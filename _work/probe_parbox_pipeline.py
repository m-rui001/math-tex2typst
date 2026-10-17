r"""Convert the boxed-minipage papers twice and diff what the page would get.

Whole-source pandoc counts (`_work/probe_boxed_minipage_face.py`) showed no change, so the isolation
experiment has to be re-run inside the real pipeline: the same `convert_paper`, with `prep.unwrap_fbox`
stubs back to the old behaviour on one side and to the parbox law on the other, writing into throwaway
directories.  Read off each `main.typ` the number of `#table(` blocks, the leaked LaTeX markers
(`c\@c`, a line that is only `\&`) and the total size, so a rewrite that buys a table by dropping text
shows up as a size loss rather than hiding behind the table count.
"""
import glob
import os
import re
import shutil
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

from t2t import convert, prep  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BOXED = re.compile(r"\\fbox\s*\{\s*\\begin\{minipage\}(?:\[[^\]]*\])?\{(?P<w>[^{}]*)\}"
                   r"(?P<x>.*?)\\end\{minipage\}\s*\}", re.S)
OLD = prep.unwrap_fbox


def parbox_law(text):
    boxed = BOXED.sub(lambda m: "\\parbox{%s}{%s}" % (m.group("w"), m.group("x")), text)
    return OLD(boxed)


def read(path):
    if not os.path.exists(path):
        return None
    t = open(path, encoding="utf-8", errors="replace").read()
    return (t.count("#table("), t.count(r"\&") + t.count(r"\@c"), len(t))


def main():
    stems = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        if BOXED.search(open(path, encoding="utf-8", errors="replace").read()):
            stems.append(os.path.basename(path)[:-4])
    print("papers with a boxed minipage: %d" % len(stems))
    for stem in stems:
        flat = os.path.join(ROOT, "_work", "flat", stem + ".tex")
        res = {}
        for label, law in (("old", OLD), ("new", parbox_law)):
            out = os.path.join(ROOT, "_work", "_pb_" + label, stem)
            shutil.rmtree(out, ignore_errors=True)
            prep.unwrap_fbox = law
            try:
                convert.convert_paper(flat, out, stem)
            except Exception as exc:                                 # noqa: BLE001
                res[label] = ("FAILED", repr(exc)[:60], 0)
                continue
            finally:
                prep.unwrap_fbox = OLD
            res[label] = read(os.path.join(out, "main.typ"))
        if res["old"] != res["new"]:
            print("  %-58s tables %s->%s | leaked-latex %s->%s | bytes %s->%s"
                  % (stem[:56], res["old"][0], res["new"][0],
                     res["old"][1], res["new"][1], res["old"][2], res["new"][2]))
        else:
            print("  %-58s unchanged (tables %s, leaked %s)"
                  % (stem[:56], res["old"][0], res["old"][1]))


if __name__ == "__main__":
    main()
