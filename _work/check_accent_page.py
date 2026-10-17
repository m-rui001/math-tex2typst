r"""Does the page read `Kähler`, or is the accent still standing there as punctuation?

fitz extracts what the PDF actually carries, which is the last step the converter cannot fake: the
canvas source can hold the right codepoint and the font still fail to draw it. Prints every word on
the figure's page that carries one of the letters the fix composes, plus the words that would show
the old leak (`K“ahler`, `café` printed with a curly quote in front).
"""
import io
import pathlib
import re
import sys
import unicodedata

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
MARKED = re.compile(r"[A-Za-z]*[\u00c0-\u024f][A-Za-z]*")

for prefix in sys.argv[1:] or ["Deforming", "Memory-and-precision"]:
    dirs = [d for d in (ROOT / "typst").iterdir() if d.is_dir() and d.name.startswith(prefix)]
    if not dirs:
        print("no paper dir for %s" % prefix)
        continue
    doc = fitz.open(str(dirs[0] / "main.pdf"))
    hits = []
    for i in range(doc.page_count):
        text = unicodedata.normalize("NFC", doc[i].get_text())
        for w in MARKED.findall(text):
            hits.append((i + 1, w))
    print("%s: %d words with a composed letter" % (dirs[0].name[:46], len(hits)))
    seen = {}
    for p, w in hits:
        seen.setdefault(w, p)
    for w, p in sorted(seen.items())[:14]:
        print("   p%-4d %s" % (p, w))
    leak = [(i + 1, w) for i in range(doc.page_count)
            for w in re.findall(r"\w*[\u2018\u2019\u201c\u201d]\w*", doc[i].get_text())
            if re.search(r"[a-z][\u2018\u2019\u201c\u201d][a-z]{2,}", w, re.I)]
    print("   mid-word quote (the old leak): %s" % (leak[:4] or "none"))
    doc.close()
