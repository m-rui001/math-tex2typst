r"""How many canvases now carry a corner radius on a rectangle path, and which papers they are in.

Before this round no `rect(` ever carried a `radius:` -- the node frame already did, so the count is
taken on `rect(` lines only and needs no old-law stub. A picture that fails to build at all is
counted separately, because losing a drawing is not a rounding.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

RECT = re.compile(r"rect\([^\n]*radius:")


def main():
    papers, canvases, rects, refused, radii, built = set(), 0, 0, set(), {}, 0
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
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
            if "rounded corners" not in pic:
                continue
            got = cetzmod.build(pic, {}, 15.0)
            if got is None:
                refused.add(stem)
                continue
            built += 1
            lines = [ln for ln in got.splitlines() if RECT.search(ln)]
            if not lines:
                continue
            canvases += 1
            rects += len(lines)
            papers.add(stem)
            for ln in lines:
                m = re.search(r"radius: ([^\s,)]+)", ln)
                key = m.group(1) if m else "??"
                radii[key] = radii.get(key, 0) + 1
    print("rounded rects: %d in %d canvases / %d papers  built: %d  refused: %d"
          % (rects, canvases, len(papers), built, len(refused)))
    print("radii emitted: %s" % sorted(radii.items(), key=lambda kv: -kv[1]))
    print("papers: %s" % ", ".join(sorted(s[:34] for s in papers)))


if __name__ == "__main__":
    main()
