r"""How much raw TeX is in the bib files we ship?

The page-side census (_work/probe_page_syntax_tokens.py, run127) printed
`\mathbb Z_+^N`, `C^\infty rectifiability`, `n\times n matrices` from
bibliography lines: 879 hits / 247 papers. Typst's bibliography runs each field
through hayagriva's own parser, so whatever TeX survives that parser is the ink
on the page. This probe counts the source spellings per paper so the fix can be
judged against a measured face, not against a keyword list.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace",
                              newline="")

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
TYPST = os.path.join(ROOT, "typst")

FIELD = re.compile(r"^\s*(\w+)\s*=\s*[{\"](.*)$", re.S)
CS = re.compile(r"\\[A-Za-z]{2,}")
MATH = re.compile(r"\$+")
SUP = re.compile(r"[_^]")


def main():
    papers = 0
    bibs = 0
    fields = {}
    hits = []
    for name in sorted(os.listdir(TYPST)):
        bib = os.path.join(TYPST, name, "refs.bib")
        if not os.path.isdir(os.path.join(TYPST, name)):
            continue
        papers += 1
        if not os.path.exists(bib):
            continue
        text = open(bib, encoding="utf-8", errors="replace").read()
        found = []
        for line in text.splitlines():
            m = FIELD.match(line)
            if not m:
                continue
            key, value = m.group(1), m.group(2)
            if key.lower() in ("doi", "url", "eprint", "isbn", "issn"):
                continue
            n = len(CS.findall(value)) + len(SUP.findall(value))
            if "$" in value or n:
                found.append((key, len(MATH.findall(value)), n, value[:95]))
        if found:
            bibs += 1
            for key, _, _, _ in found:
                fields[key] = fields.get(key, 0) + 1
            hits.append((name, found))
    print("papers: %d  bibs with raw TeX in a field: %d" % (papers, bibs))
    print("fields by name:", ", ".join(
        "%s %d" % kv for kv in sorted(fields.items(), key=lambda kv: -kv[1])[:12]))
    print("total offending fields: %d" % sum(len(f) for _, f in hits))
    for name, found in hits[:8]:
        print(" ", name[:44], len(found))
        for key, dollars, cs, value in found[:3]:
            print("     %-9s $x%d csx%d | %s" % (key, dollars, cs, value))


main()
