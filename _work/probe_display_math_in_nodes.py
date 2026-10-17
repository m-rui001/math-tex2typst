r"""Count node labels that hold a display-math span, which NODE_MATH does not read.

`cetz.node_text` splits a label on `$...$` and `\(...\)`; a `\[ ... \]` inside a label is prose to
it, so the markup pass strips its command names and prints the rest escaped -- the gate figure's
note reached the page as `e^ Hm_*w>2B_0.` Wrap `node_text` while every flat paper's pictures are
built and record the labels that carry one.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

hits = []
real = cetzmod.node_text
DISPLAY = re.compile(r"(?<!\\)\\\[")


def spy(inner, pal=None):
    if DISPLAY.search(inner):
        hits.append(inner)
    return real(inner, pal)


cetzmod.node_text = spy

papers = 0
for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
    with open(path, encoding="utf-8", errors="replace") as fh:
        src = fh.read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    pics = convert.TIKZ_SPAN.findall(body)
    if not pics:
        continue
    papers += 1
    scopes = convert.picture_scopes(body, p.macros)
    for i, pic in enumerate(pics):
        table, decls = scopes[i]
        if decls:
            pic = convert.with_declarations(pic, decls)
        try:
            cetzmod.build(prep.expand_macros(pic, table), {}, 15.0)
        except Exception:  # noqa: BLE001
            pass

print("papers: %d   labels with a display span: %d" % (papers, len(hits)))
for h in hits:
    print("---")
    print(" ".join(h.split())[:300])
