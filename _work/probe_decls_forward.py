r"""Churn face of #54: which canvases change when a figure's declarations persist forward.

The old law attached each picture the declarations that stood directly above it; the new one
accumulates them, as TeX does for a top-level \definecolor. Stub the old law back in, build both
canvases for every picture of every flat paper, and print the ones that differ.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))

from t2t import convert, prep, cetz as cetzmod, macros  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def old_scopes(body, table):
    """The per-picture law, rebuilt for the diff."""
    out, scope, pos = [], dict(table), 0
    for pic in convert.TIKZ_SPAN.finditer(body):
        region, pos = body[pos:pic.start()], pic.end()
        extra, _skipped = macros.parse_definitions(region)
        scope.update(extra)
        decls = []
        for m in convert.STYLE_DECL.finditer(region):
            start = convert.skip_spaces(region, m.end())
            if region[start:start + 1] != "{":
                continue
            try:
                close = convert.find_group(region, start)
            except ValueError:
                continue
            end = close
            while region[end:end + 1] == "{":
                try:
                    end = convert.find_group(region, end)
                except ValueError:
                    break
            if m.group(0) == "\\tikzset" and region[end:end + 1] == ";":
                end += 1
            decls.append(region[m.start():end])
        out.append((scope, "\n".join(decls)))
    return out


def canvas(pic, table, decls):
    if decls:
        pic = convert.with_declarations(pic, decls)
    return cetzmod.build(prep.expand_macros(pic, table), {}, 15.0)


changed_papers, changed_pics, papers = [], 0, 0
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
    papers += 1
    new, old = convert.picture_scopes(body, p.macros), old_scopes(body, p.macros)
    hit = []
    for i, pic in enumerate(pics):
        if i >= len(new) or i >= len(old):
            continue
        if new[i][1] == old[i][1]:
            continue
        a = canvas(pic, old[i][0], old[i][1])
        b = canvas(pic, new[i][0], new[i][1])
        if a != b:
            changed_pics += 1
            hit.append((i + 1, a is None, b is None,
                        (a or "").count("fill: black"), (b or "").count("fill: black")))
    if hit:
        changed_papers.append((stem, hit))

print("papers with a picture: %d" % papers)
print("papers changed: %d   pictures changed: %d" % (len(changed_papers), changed_pics))
for stem, hit in changed_papers:
    print(stem)
    for idx, old_none, new_none, ob, nb in hit:
        print("   pic %d  old_build=%s new_build=%s  fill:black %d -> %d"
              % (idx, "None" if old_none else "canvas", "None" if new_none else "canvas", ob, nb))
