r"""Where does each remaining fat space sit, and what line is it on?

_work/probe_justified_cells.py finds four spaces wider than 12 pt in four papers, and the count did
not move when table cells stopped being justified -- so they are not cells. Name them before deciding
whether they are a defect: a justified prose line with two words legitimately carries a wide space,
while a wide space inside a figure's text or a caption would be another story. Print the line, the
space's own width, and the page.
"""
import glob
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PAPERS = ["Triple-ergodic-averages*", "The-Quasi-Riemann-Hypothesis*",
          "Pointwise-convergence-of-triple-ergodic*", "Conditional-information*"]
FLOOR = 12.0


def main():
    for pat in PAPERS:
        for d in glob.glob(os.path.join(ROOT, "typst", pat)):
            doc = fitz.open(os.path.join(d, "main.pdf"))
            print("\n%s" % os.path.basename(d)[:70])
            for pno, page in enumerate(doc, 1):
                for block in page.get_text("rawdict")["blocks"]:
                    for line in block.get("lines", []):
                        chars = [c for span in line.get("spans", [])
                                 for c in span.get("chars", [])]
                        for k, ch in enumerate(chars):
                            w = ch["bbox"][2] - ch["bbox"][0]
                            if ch["c"] == " " and w > FLOOR:
                                text = "".join(c["c"] for c in chars)
                                print("  p%-3d space %.1f pt | %s"
                                      % (pno, w, text.strip()[:88]))
            doc.close()


if __name__ == "__main__":
    main()
