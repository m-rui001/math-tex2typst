r"""How many bib fields still print TeX after BOTH passes, and what stops them?

#75's law is that a `.bib` field carries ink, not markup, and pandoc's plain writer is the reader.
Its known boundary was the field whose answer echoes a `$…$` group back: the plain writer has no
Unicode for a shape that needs a second line. #76 lays those shapes out in one line
(`convert.bib_struct_text`) and re-feeds the group to the same pass.

The count must come from the function under test, run in memory over the bib files as they sit on
disk -- a source-side scanner with its own line filter reported 0/0 while the page carried 106
(轴 54's 量具教訓). Read-only, no typst.
"""
import io
import os
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import convert

CS_RX = re.compile(r"\\([a-zA-Z]+)")
ECHO_RX = re.compile(r"\$([^$]*)\$")
FIELD_RX = convert.BIB_FIELD_RX


def pass_one(bibs):
    """The groups the FIRST pass hands back as an echo, read from that pass's own answers.

    A `$…$` in the source is not an echo -- most of them convert. The census has to ask the plain
    writer, so it walks each entry's fields in one batch call and counts the answers that still
    carry a group.
    """
    groups, fields, papers = Counter(), 0, set()
    for name, bib in bibs:
        spans, i = [], 0
        while True:
            m = FIELD_RX.search(bib, i)
            if m is None:
                break
            stop = convert.find_group(bib, m.end() - 1) - 1
            value = bib[m.end():stop]
            if m.group(1).lower() not in convert.BIB_LINK_KEYS \
                    and convert.BIB_MARKUP_RX.search(value):
                spans.append(value)
            i = stop
        answers = convert.mathconv.convert_plain_batch(spans)
        for pos in range(len(spans)):
            echoed = ECHO_RX.findall(answers.get(pos) or "")
            if not echoed:
                continue
            fields += 1
            papers.add(name)
            for g in echoed:
                groups[g] += 1
    return groups, fields, papers


def census(groups):
    cs = Counter()
    shapes = Counter()
    for g, n in groups.items():
        for c in CS_RX.findall(g):
            cs[c] += n
        for rx, label in ((convert.BIB_FRAC_RX, "frac"), (convert.BIB_SQRT_RX, "sqrt"),
                          (convert.BIB_RULE_RX, "rule")):
            hit = len(rx.findall(g))
            if hit:
                shapes[label] += hit
    return cs, shapes


def residual(bibs):
    """Fields the flattened bib STILL prints markup for, grouped by the shape that stopped them."""
    kept, papers, families = [], set(), {}
    for name, bib in bibs:
        flat = convert.flatten_bib_fields(bib)
        for m in FIELD_RX.finditer(flat):
            if m.group(1).lower() in convert.BIB_LINK_KEYS:
                continue
            stop = convert.find_group(flat, m.end() - 1) - 1
            value = flat[m.end():stop]
            cmds = tuple(sorted(set(CS_RX.findall(value))))
            if not cmds and "$" not in value:
                continue
            kept.append((name, m.group(1), value[:90]))
            papers.add(name)
            key = families.setdefault(cmds, [0, "%s | %s" % (m.group(1), value[:80])])
            key[0] += 1
    return kept, papers, families


# The base is the bib the paper ships, which is what the pipeline reads, not the refs.bib the
# previous round wrote -- flattening an already flattened bib converts a field twice and reports a
# face of its own.
def old_flatten(bib):
    """The law as it stood before #76: line-anchored fields, one pass, echo left on the page.

    Stubbed here so the face is a diff of the two laws over the SAME bib, which is what a changed
    product means; comparing a new-code flatten against the previous round's refs.bib also counts
    the pipeline's own year/month rewrites, which no change of ours moved.
    """
    spans = []
    for m in re.finditer(r'(?im)^\s*(\w+)\s*=\s*\{', bib):
        if m.group(1).lower() in convert.BIB_LINK_KEYS:
            continue
        stop = convert.find_group(bib, m.end() - 1) - 1
        value = bib[m.end():stop]
        if convert.BIB_MARKUP_RX.search(value):
            spans.append((m.end(), stop, value))
    if not spans:
        return bib
    plain = convert.mathconv.convert_plain_batch([s[2] for s in spans])
    out, at = [], 0
    for pos, (start, stop, value) in enumerate(spans):
        text = plain.get(pos)
        if text is None:
            continue
        out.append(bib[at:start])
        out.append(convert.bib_plain(text, value))
        at = stop
    out.append(bib[at:])
    return ''.join(out)


bibs = []
for name in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    for key in ("refs.original.bib", "refs.bib"):
        path = os.path.join(ROOT, "typst", name, key)
        if os.path.isfile(path):
            bibs.append((name, open(path, encoding="utf-8").read()))
            break

mode = sys.argv[1] if len(sys.argv) > 1 else "residual"
if mode == "face":
    changed = [name for name, bib in bibs if convert.flatten_bib_fields(bib) != old_flatten(bib)]
    print("papers whose bib the two laws spell differently: %d" % len(changed))
    open(os.path.join(ROOT, "_work", "regen_needed.txt"), "w", encoding="utf-8").write(
        "".join(name + "\n" for name in changed))
elif mode == "echoes":
    groups, fields, papers = pass_one(bibs)
    cs, shapes = census(groups)
    print("fields echoed after pass 1: %d over %d papers; groups %d" % (fields, len(papers), sum(groups.values())))
    print("shapes laid out: %s" % dict(shapes))
    print("commands inside echoed groups: %s" % cs.most_common())
    for g, n in sorted(groups.items()):
        if not (convert.BIB_FRAC_RX.search(g) or convert.BIB_SQRT_RX.search(g)
                or convert.BIB_RULE_RX.search(g)):
            print("  NO SHAPE LAID OUT (%d): %s" % (n, g))
        print("  %dx  %s  ==>  %s" % (n, g, convert.bib_struct_text(g)))
else:
    kept, papers, families = residual(bibs)
    print("fields still carrying markup after both passes: %d over %d papers" % (len(kept), len(papers)))
    for cmds, (n, eg) in sorted(families.items(), key=lambda kv: -kv[1][0]):
        print("  %-30s %3d   %s" % (str(cmds), n, eg))
    by_paper = Counter(name for name, _, _ in kept)
    for name, n in by_paper.most_common():
        print("  %-58s %d" % (name[:58], n))
