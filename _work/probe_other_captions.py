r"""What shape are the other four lost captions, and does the array-spec patch reach them?

`caption_loss_report.py` named five papers whose caption text is absent from the generated page. One
is the math-array float whose brace-bearing preamble `array_floats` could not see. The rest may be
the same mechanism or another one, and only the source says which - so print, for each missing
caption, the float region it came from and whether an array float sits in it at all.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PAPERS = [p[:-4] for p in sorted(os.listdir(FLAT)) if p.endswith(".tex")]
CAP = re.compile(r"\\caption\s*(?:\[[^\]]*\])?\s*\{")


def words(body, start):
    inner, end = prep.bracketed(body, start + len("\\caption") - 1) if hasattr(prep, "bracketed") else ("", start)
    return inner, end


def main():
    wanted = sys.argv[1:]
    for paper in PAPERS:
        if not any(w.lower() in paper.lower() for w in wanted):
            continue
        body = open(os.path.join(FLAT, "%s.tex" % paper), encoding="utf-8", errors="replace").read()
        out_path = os.path.join(ROOT, "typst", paper, "main.typ")
        out = open(out_path, encoding="utf-8", errors="replace").read() if os.path.exists(out_path) else ""
        print("======== %s" % paper)
        for m in list(CAP.finditer(body))[:200]:
            frag = body[m.end():m.end() + 90]
            phrase = frag.split("}")[0].strip()
            if len(phrase) < 12 or ("{" not in frag):
                continue
            if phrase in out:
                continue
            lo = body.rfind("\n", 0, m.start() - 260)
            hi = body.find("\n", m.end() + 260)
            region = body[lo:hi]
            print("  LOST: %r" % phrase[:70].encode("unicode_escape").decode())
            print("    in table float: %s ; in figure float: %s ; array env: %s ; minipage: %s"
                  % ("\\begin{table" in region, "\\begin{figure" in region,
                     "\\begin{array" in region, "\\begin{minipage" in region))
            print("    --- source context ---")
            for line in region.splitlines()[:14]:
                print("    | " + line[:110].encode("unicode_escape").decode()[:150])
            print("    --- after prep.array_floats ---")
            for line in prep.array_floats(region).splitlines()[:6]:
                print("    > " + line[:110].encode("unicode_escape").decode()[:150])


main()
