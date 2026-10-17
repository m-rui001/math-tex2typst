r"""Classify every canvas maths that ships a `/`, before any slash rule is written.

#92 measured the shape: a `/` inside Typst maths draws a **stacked fraction whose denominator runs to
the end of the maths** (`_work/measure92_math_fidelity.py` -- `$E/2$` comes back as `E` over `2`, two
PDF lines, while pdflatex sets one inline slash), and `_work/probe93_slash_face.py` counted 265 such
spans over 125 papers on the batch replay.  This turns that count into a work list: for each span it
records the author's TeX, the emission, and where each `/` sits -- bare maths, inside a quoted prose
run, or in the quoted fallback the guard already refused.

Why the split matters: `quote_words` puts prose inside `"..."`, and a `/` inside a Typst string is an
ordinary character.  So "emit `\"/\"` for every slash" is not one law -- it would also cut words in
half (`"L/3"` -> `"L" "/" "3"`, paying Typst's operator spacing where TeX pays none).  The face of
each side has to be counted first.  The same replay watches the input strings for TeX spells a
*real* stacked fraction (`\over`, `\nicefrac`, `\binom`): those authors want the two-line shape, so a
blanket inline-slash rule would break them, and if the corpus holds none the rule needs no exception.

  python _work/probe93_slash_classes.py > _work/m93_slash_classes.txt
writes the full table to _work/m93_slash_sites.tsv
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
OUT = os.path.join(ROOT, "_work", "m93_slash_sites.tsv")
current = [None]
rows = []
inputs = []

_real_body = cetz._math_body
_real_safe = cetz.math_safe
verdicts = []


def in_string(text, i):
    """Is position i inside a Typst `"..."` run?  Quotes arrive only in matched pairs."""
    return text.count('"', 0, i) % 2 == 1


def classify(emitted, refused):
    """One label per `/` in the emission: where it is, and what touches it."""
    tags = []
    for m in re.finditer(r"/", emitted):
        i = m.start()
        if refused:
            tags.append("fallback")
            continue
        if in_string(emitted, i):
            tags.append("in-quote")
            continue
        prev = emitted[:i].rstrip()
        nxt = emitted[i + 1:].lstrip()
        before = prev[-1] if prev else ""
        after = nxt[0] if nxt else ""
        if before == '"':
            before = "quote"
        if after == '"':
            after = "quote"
        tags.append("%s|%s" % (before or "start", after or "end"))
    return " ".join(tags)


def spy_body(tex):
    got = _real_body(tex)
    inputs.append(tex)
    if "/" in got:
        # the fallback branch quotes the span, so the guard's answer tells the two apart
        refused = got.startswith('"') and "/'" not in got and '"$' not in got
        rows.append((current[0], tex.strip(), got, refused))
    return got


def spy_safe(tex):
    return _real_safe(tex)


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

with open(OUT, "w", encoding="utf-8", newline="\n") as fh:
    fh.write("paper\trefused\tsource\temission\tslash_tags\n")
    for stem, src_tex, emitted, refused in rows:
        fh.write("%s\t%d\t%s\t%s\t%s\n"
                 % (stem, int(refused), src_tex, emitted, classify(emitted, refused)))

print("papers replayed: %d   slash-carrying emissions: %d over %d papers"
      % (papers, len(rows), len({r[0] for r in rows})))
ref = [r for r in rows if r[3]]
print("  already refused to the quoted fallback: %d over %d papers"
      % (len(ref), len({r[0] for r in ref})))

# how many spans would change shape if every bare maths `/` became the literal glyph
bare = [r for r in rows if not r[3]
        and any(not in_string(r[2], m.start()) for m in re.finditer(r"/", r[2]))]
qonly = [r for r in rows if not r[3]
         and all(in_string(r[2], m.start()) for m in re.finditer(r"/", r[2]))]
print("  maths spans with a BARE slash (page ships a stacked fraction): %d over %d papers"
      % (len(bare), len({r[0] for r in bare})))
print("  maths spans with slashes ONLY inside quotes (page already fine): %d over %d papers"
      % (len(qonly), len({r[0] for r in qonly})))

ctx = Counter()
for r in bare:
    for tag in classify(r[2], False).split():
        if tag != "in-quote":
            ctx[tag] += 1
print("\nthe bare slash, by what touches it (emission side):")
for tag, n in ctx.most_common(30):
    print("  %-14s %d" % (tag, n))

print("\nTeX that means a REAL stacked fraction, in the maths the emitter receives:")
for pat, label in ((r"\\over(?![a-zA-Z])", r"\over"),
                   (r"\\nicefrac", r"\nicefrac"),
                   (r"\\binom", r"\binom"),
                   (r"\\cfrac", r"\cfrac"),
                   (r"\\dfrac", r"\dfrac"),
                   (r"\\tfrac", r"\tfrac")):
    n = sum(1 for t in inputs if re.search(pat, t))
    print("  %-9s %d maths spans" % (label, n))

print("\nfirst 45 bare-slash spans:")
for stem, src_tex, emitted, _ in bare[:45]:
    print("   %-40s %-34s %s" % (stem[:40], src_tex[:34], emitted[:74]))
