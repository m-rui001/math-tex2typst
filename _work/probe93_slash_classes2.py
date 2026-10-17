r"""#93 face, second version: ask the GUARD whether a slash span travelled as maths.

The first version (`_work/probe93_slash_classes.py`) split "shipped as maths" from "quoted fallback"
by looking at the emission's first character -- and 轴 74 already records that as an invalid reading:
`"Lr"/8` is a maths span whose first WORD is quoted, not a fallback.  Three spans were misfiled that
way.  This version does what `probe93_slash_face.py` does: a `math_safe` spy collects the guard's
answer for the span currently being emitted, so `refused` is the guard's own word.

Two more questions get answered on the same replay because they decide the shape of the rule:
`//` (a TeX alignment row break, which must NOT be turned into two visible slashes) is counted on
both sides, and `\end{bmatrix}`-style maths carrying a slash inside a script group is separated from
a slash at the top level, since Typst stacks a fraction wherever the `/` sits.

  python _work/probe93_slash_classes2.py > _work/m93_slash_classes2.txt
writes the full table to _work/m93_slash_sites2.tsv (newlines escaped, one record per line)
"""
import os
import re
import sys
from collections import Counter, defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
OUT = os.path.join(ROOT, "_work", "m93_slash_sites2.tsv")
current = [None]
rows = []
inputs = []

_real_body = cetz._math_body
_real_safe = cetz.math_safe
verdicts = []


def in_string(text, i):
    """Is position i inside a Typst `"..."` run?  Quotes arrive only in matched pairs."""
    return text.count('"', 0, i) % 2 == 1


def one_line(text):
    return " ".join(text.split())


def spy_body(tex):
    verdicts.append([])
    got = _real_body(tex)
    refused = not verdicts[-1][-1] if verdicts[-1] else False
    inputs.append(tex)
    if "/" in got:
        rows.append((current[0], one_line(tex), refused, one_line(got)))
    verdicts.pop()
    return got


def spy_safe(tex):
    got = _real_safe(tex)
    verdicts[-1].append(got)
    return got


cetz._math_body = spy_body
cetz.math_safe = spy_safe
papers = 0
for name in sorted(os.listdir(FLAT)):
    if not name.endswith(".tex"):
        continue
    src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
    pre, body = prep.split_document(src)
    stem = name[:-4]
    try:
        p = prep.parse_preamble(pre)
        scopes = convert.picture_scopes(body, p.macros)
        pics = convert.lifted_pictures(body)
    except Exception as exc:
        print("SKIP %s: %s" % (stem[:44], exc))
        continue
    papers += 1
    current[0] = stem
    wide = convert.line_cm(p)
    for i, m in enumerate(pics):
        text = m.group(0)
        table = p.macros
        if i < len(scopes):
            table, decls = scopes[i]
            if decls:
                text = convert.with_declarations(text, decls)
        core = prep.expand_macros(text, table)
        cetz.convert(core, p.colors, wide, refs=None)
cetz._math_body = _real_body
cetz.math_safe = _real_safe

maths = [r for r in rows if not r[2]]
refused = [r for r in rows if r[2]]
with open(OUT, "w", encoding="utf-8", newline="\n") as fh:
    fh.write("paper\trefused\tparents\tsource\temission\tslash_tags\n")
    for stem, src_tex, ref, emitted in rows:
        bare = [(i, m.start()) for i, m in enumerate(re.finditer(r"/", emitted))
                if not (ref or in_string(emitted, i))]
        tags = []
        for k, i in bare:
            prev = emitted[:i].rstrip()
            nxt = emitted[i + 1:].lstrip()
            depth = prev.count("(") - prev.count(")")
            tags.append("%s|%s%s" % (prev[-1:] or "start", nxt[:1] or "end",
                                     " @script" if depth > 0 else ""))
        fh.write("%s\t%d\t%d\t%s\t%s\t%s\n"
                 % (stem, int(ref), src_tex.count("{"), src_tex, emitted, " ".join(tags)))

print("papers replayed: %d   slash-carrying emissions: %d over %d papers"
      % (papers, len(rows), len({r[0] for r in rows})))
print("  shipped AS MATHS (page stacks a fraction): %d spans over %d papers"
      % (len(maths), len({r[0] for r in maths})))
print("  already in the quoted fallback           : %d spans over %d papers"
      % (len(refused), len({r[0] for r in refused})))
for stem, src_tex, ref, emitted in refused:
    print("     REF %-40s %-28s %s" % (stem[:40], src_tex[:28], emitted[:56]))

qslash = [r for r in rows if not r[2]
          and all(in_string(r[3], m.start()) for m in re.finditer(r"/", r[3]))]
print("  maths spans whose slashes are ALL inside quotes: %d" % len(qslash))

print("\nslashes per maths span:", dict(Counter(r[3].count("/") for r in maths)))
ctx = Counter()
for stem, src_tex, ref, emitted in maths:
    for m in re.finditer(r"/", emitted):
        if in_string(emitted, m.start()):
            ctx["in-quote"] += 1
            continue
        prev = emitted[:m.start()].rstrip()
        nxt = emitted[m.start() + 1:].lstrip()
        grp = "script" if prev.count("(") - prev.count(")") > 0 else "top"
        kind = lambda ch: ("quote" if ch == '"' else
                           "digit" if ch.isdigit() else
                           "letter" if ch.isalpha() else
                           "punct" if ch else "EDGE")
        ctx["%s>%s/%s" % (grp, kind(prev[-1:]), kind(nxt[:1]))] += 1
for tag, n in sorted(ctx.items(), key=lambda kv: -kv[1]):
    print("  %-22s %d" % (tag, n))

print("\n`//` (a TeX row break, must NOT become two visible slashes):")
print("  maths strings the emitter receives that hold `//`: %d"
      % sum(1 for t in inputs if "//" in t))
print("  emissions above that hold `//`: %d" % sum(1 for r in rows if "//" in r[3]))
print("\nnamed fraction forms in the maths the emitter receives:")
for pat, label in ((r"\\frac", r"\frac"), (r"\\dfrac", r"\dfrac"), (r"\\tfrac", r"\tfrac"),
                   (r"\\cfrac", r"\cfrac"), (r"\\binom", r"\binom"),
                   (r"\\over(?![a-zA-Z])", r"\over"), (r"\\nicefrac", r"\nicefrac"),
                   (r"\\slash(?![a-zA-Z])", r"\slash")):
    print("  %-9s %d maths spans" % (label, sum(1 for t in inputs if re.search(pat, t))))

print("\n30 maths spans with a slash inside a script group:")
n = 0
for rec in open(OUT, encoding="utf-8").read().splitlines()[1:]:
    parts = rec.split("\t")
    if len(parts) == 6 and parts[1] == "0" and "@script" in parts[5]:
        print("   %-40s %-26s %s" % (parts[0][:40], parts[3][:26], parts[4][:64]))
        n += 1
        if n >= 30:
            break
print("script-group slashes total: %d" % ctx.get("script>digit/digit", 0))
