r"""Do any of the nodes #62 moves also hang a `label=` off themselves?

`label_lines` pushes a `label=` off the parent's border using the parent's half-extent around `at`, and
the anchor now moves the drawn box away from `at`, so a node that asks for both would have its label
pushed off the point the box no longer covers.  Counted on the batch basis by wrapping `emit_node`: the
options table is read for an anchor AND for the label spellings `_node_label` knows.
"""
import glob
import os
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

LABEL_KEYS = ("label",)


def main():
    both, papers = 0, set()
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
        hits = []
        for i, pic in enumerate(pics):
            table, decls = scopes[i]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)

            real = cetzmod.emit_node

            def spy(*args, **kw):
                o = args[2] if len(args) > 2 else kw.get("o")
                if (cetzmod.label_placements(o) and cetzmod._node_anchor(o)
                        and cetzmod.box_visible(o)):
                    hits.append((i, sorted(o)[:8]))
                return real(*args, **kw)

            cetzmod.emit_node = spy
            try:
                cetzmod.build(cetzmod.strip_envelope(pic), p.colors, convert.line_cm(p))
            finally:
                cetzmod.emit_node = real
        if hits:
            both += len(hits)
            papers.add(stem)
            for h in hits[:3]:
                print("%s p%d opts %s" % (stem[:38], h[0], h[1]))
    print("nodes with a frame, an anchor and a label=: %d in %d papers" % (both, len(papers)))


if __name__ == "__main__":
    main()
