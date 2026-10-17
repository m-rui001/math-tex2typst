"""Which source labels never reach the emitter's registry, and what surrounds them.

The sources resolve 140k references by themselves; the pipeline still reports thousands
of dangling ones, so the loss is in registration. This converts one paper while recording
every label the emitter registers, then prints the source labels it missed together with
the environment they sit in.

Run: python _work/probe_label_loss.py <paper-name-prefix>
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit  # noqa: E402
from t2t.convert import convert_paper  # noqa: E402

FLAT = ROOT / "_work" / "flat"
LABEL = re.compile(r"\\label[ \t]*\{([^{}]*)\}")
ENV = re.compile(r"\\(?:begin|end)\{([a-zA-Z@*][a-zA-Z0-9@*]*)\}")

prefix = sys.argv[1] if len(sys.argv) > 1 else "Conditional-information"
paper = sorted(p.stem for p in FLAT.glob(prefix + "*.tex"))[0]
text = (FLAT / (paper + ".tex")).read_text(encoding="utf-8", errors="replace")

registered = set()
real_register = emit.Book.register
real_anchor = emit.Book.anchor_label


def watched(self, label, kind, shown, name=None):
    registered.add(label)
    return real_register(self, label, kind, shown, name)


def anchored(self, label):
    registered.add(label)
    return real_anchor(self, label)


emit.Book.register = watched
emit.Book.anchor_label = anchored

out = ROOT / "_work" / "label_loss" / paper
out.mkdir(parents=True, exist_ok=True)
report = convert_paper(str(FLAT / (paper + ".tex")), str(out), paper)
print("%s: dangling=%s registered=%d" % (paper[:50],
      (report.get("stats") or {}).get("dangling_ref"), len(registered)))


def enclosing(index):
    stack = []
    for m in ENV.finditer(text, 0, index):
        if text[m.start() + 1:m.start() + 5].startswith("begin"):
            stack.append(m.group(1))
        elif stack and stack[-1] == m.group(1):
            stack.pop()
    return ">".join(stack[-3:]) or "(top level)"


lost = []
for m in LABEL.finditer(text):
    if m.group(1) not in registered:
        lost.append(m)
print("source labels=%d lost=%d" % (len(LABEL.findall(text)), len(lost)))
kinds = collections.Counter()
shown = 0
for m in lost[:2000]:
    env = enclosing(m.start())
    line = text[:m.start()].count("\n")
    snippet = " ".join(text.splitlines()[line].split())[:90]
    kinds[env] += 1
    if shown < 14:
        shown += 1
        print("  L%-6d [%s] %s" % (line + 1, env, snippet))
print("\nlost labels by enclosing environment:")
for env, count in kinds.most_common(15):
    print("  %-40s %d" % (env[:40], count))
