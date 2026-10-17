r"""Read a rendered Typst page back as text, so a spelling is judged by what lands on the paper.

`python _work/read_typst_page.py brace_probe6` -- the PDF must already be compiled. Math italic
letters come back as their mathematical-alphanumeric codepoints, so the printout is ASCII-folded
(NFKD + drop combining) to keep it readable on a GBK console.
"""
import pathlib
import sys
import unicodedata

import pymupdf

out = pymupdf.open(sys.argv[1] if sys.argv[1].endswith(".pdf") else sys.argv[1] + ".pdf")
text = "\n".join(page.get_text() for page in out)
out.close()
folded = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("ascii")
sys.stdout.buffer.write(folded.encode("ascii"))
