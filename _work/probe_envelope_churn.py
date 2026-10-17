r"""Churn face of the envelope strip moving outside the drawing.

Old law stripped every `\[` and `\]` in the picture text, new law only those outside the
tikzpicture environment. Build both canvases for every picture of every flat paper and print the
ones that differ; a canvas the old law built and the new one refuses is a lost drawing and has to
be read statement by statement.
"""
import glob
import os
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

changed, lost, gained = [], 0, 0
for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
    stem = os.path.basename(path)[:-4]
    with open(path, encoding="utf-8", errors="replace") as fh:
        src = fh.read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    pics = convert.TIKZ_SPAN.findall(body)
    if not pics:
        continue
    scopes = convert.picture_scopes(body, p.macros)
    for i, pic in enumerate(pics):
        table, decls = scopes[i]
        if decls:
            pic = convert.with_declarations(pic, decls)
        pic = prep.expand_macros(pic, table)
        if "\\[" not in pic and "\\]" not in pic:
            continue
        old = cetzmod.build(cetzmod.MATH_ENVELOPE.sub("", pic), {}, 15.0)
        new = cetzmod.build(cetzmod.strip_envelope(pic), {}, 15.0)
        if old == new:
            continue
        if old is not None and new is None:
            lost += 1
            changed.append((stem, i + 1, "LOST"))
        elif old is None and new is not None:
            gained += 1
            changed.append((stem, i + 1, "GAINED"))
        else:
            changed.append((stem, i + 1, "DIFF"))

print("changed %d  lost %d  gained %d" % (len(changed), lost, gained))
for stem, idx, kind in changed:
    print("%s pic %d %s" % (stem, idx, kind))
