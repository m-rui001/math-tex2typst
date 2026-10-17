r"""The 82 in-path nodes whose bracket names a style the picture declares.

#49's first leg reads a `node[overlap]` bracket against the picture's own `/.style` table, because an
in-path node IS a node and TikZ gives it the same styles. This prints every site the lookup now fires
on -- the paper, the style name, and the keys the style carries -- so the fix can be eyeballed against
the pdflatex control instead of trusted as a count.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
INPATH = re.compile(r"(?<!\\)\bnode\s*(\[[^\]]*\])?(\[[^\]]*\])?")
BEGIN = re.compile(r"\\begin\{tikzpicture\}")


def main():
    sites = 0
    papers = set()
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        try:
            wide = line_cm(prep.parse_preamble(src))
        except Exception:
            wide = None
        for m in PIC.finditer(src):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
            hm = BEGIN.match(core)
            head, _p = cetz._opts_at(core[hm.end():].lstrip(), 0)
            styles = cetz.picture_styles(head or {})
            for mm in INPATH.finditer(core):
                for grp in mm.groups():
                    if not grp:
                        continue
                    for key, val in cetz.opts(grp[1:-1]).items():
                        if val is True and key in styles:
                            sites += 1
                            papers.add(path.stem)
                            if sites <= 14:
                                print("%-42s [%s] -> %s"
                                      % (path.stem[:42], grp[1:-1][:26],
                                         str(styles[key])[:76]))
    print("sites %d in %d papers" % (sites, len(papers)))


if __name__ == "__main__":
    main()
