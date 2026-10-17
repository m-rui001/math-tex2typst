r"""The change surface of #62: nodes that lose an anchor when framed nodes stop carrying one.

The old law is reproduced by a stub `_node_anchor` that answers None for a framed node -- that is
exactly what `emit_node` did before, since every site the round changed was a framed branch and the
unframed one kept its anchor.  Both builds run on the batch basis and their lines are diffed, so the
count is of canvases and lines, not of keyword spellings in `_work/flat`.
"""
import difflib
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

ADDED = re.compile(r'anchor: "')


def build(pic, colors, line_cm):
    return cetzmod.build(cetzmod.strip_envelope(pic), colors, line_cm)


def main():
    real = cetzmod._node_anchor
    canvases, papers, lines, lost = 0, set(), 0, 0

    def old(o):
        return None if cetzmod.box_visible(o) else real(o)

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
            cetzmod._node_anchor = real
            new = build(pic, p.colors, convert.line_cm(p))
            cetzmod._node_anchor = old
            was = build(pic, p.colors, convert.line_cm(p))
            cetzmod._node_anchor = real
            if new is None or was is None or new == was:
                continue
            canvases += 1
            papers.add(stem)
            for ln in difflib.unified_diff(was.splitlines(), new.splitlines(), n=0):
                if ln.startswith("+") and not ln.startswith("+++"):
                    lines += 1
                    if ADDED.search(ln):
                        lost += 1
    print("changed canvases: %d / %d papers, +%d lines of which %d carry the new anchor"
          % (canvases, len(papers), lines, lost))
    print("papers: %s" % ", ".join(sorted(s[:34] for s in papers)))


if __name__ == "__main__":
    main()
