"""Group the rendered LaTeX strings (the visible residue) by their first construct."""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
# a Typst string literal that still contains TeX backslash commands
TeXSTR = re.compile(r'"((?:[^"\\]|\\.)*)"|「((?:[^」\\]|\\.)*)」')
HAS = re.compile(r"\\[A-Za-z@]+")

constructs = collections.Counter()
per_file = collections.Counter()
envs = collections.Counter()
examples = collections.defaultdict(list)
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    body = path.read_text(encoding="utf-8", errors="replace")
    lines = [l for l in body.split("\n") if not l.lstrip().startswith("#raw(")]
    n = 0
    for line in lines:
        for m in TeXSTR.finditer(line):
            s = m.group(1) or m.group(2) or ""
            if not HAS.search(s):
                continue
            n += 1
            e = re.search(r"\\begin\{([^}]*)\}", s)
            envs[e.group(1) if e else "(no env)"] += 1
            head = re.sub(r"\s+", " ", s)[:70]
            first = (e.group(1) if e else
                     (re.findall(HAS, s) or ["?"])[0])
            constructs[first] += 1
            if len(examples[first]) < 2:
                examples[first].append("%s: %s" % (path.parent.name[:20], head))
    if n:
        per_file[path.parent.name] = n

print("tex-quoted strings rendered as math: %d in %d papers"
      % (sum(per_file.values()), len(per_file)))
print("\nby \\begin{} environment:")
for k, v in envs.most_common(14):
    print("  %5d  %s" % (v, k))
print("\nby first macro:")
lim = int(sys.argv[1]) if len(sys.argv) > 1 else 14
for k, v in constructs.most_common(lim):
    print("  %5d  %-22s" % (v, k))
    for ex in examples[k]:
        print("          " + ex)
print("\nworst papers:", ", ".join("%s(%d)" % kv for kv in per_file.most_common(10)))
