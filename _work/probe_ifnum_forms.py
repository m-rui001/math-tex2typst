"""Every \\ifnum / \\ifdim that survives inside a TikZ picture, grouped by shape.

Feeds the design of cetz.expand_ifnum: which terms, which comparators, is there an
\\else, do conditionals nest, does anything carry \\relax or arithmetic.
"""
import pathlib
import re

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
COND = re.compile(r"\\if(num|dim)\b")

forms = {}
for tex in sorted(pathlib.Path("_work/flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        for m in COND.finditer(pic):
            tail = pic[m.start():m.start() + 130].replace("\n", " ")
            term = re.match(r"\\if(?:num|dim)\s*([^\s=<>]*)\s*([=<>])\s*([^\s]*?)(\s*\\relax)?[\s{]",
                            tail + " ")
            key = (m.group(1),
                   term.group(2) if term else "?",
                   bool(term and re.search(r"[^0-9-]", term.group(1) or "")),
                   bool(term and re.search(r"[^0-9-]", term.group(3) or "")),
                   "\\else" in tail, "\\or" in tail)
            forms.setdefault(key, (tail[:100], tex.stem[:40]))

print("%d distinct shapes" % len(forms))
for key, (tail, paper) in sorted(forms.items()):
    print("%s  %s\n      e.g. %s" % (str(key), tail[:92], paper))
