# -*- coding: utf-8 -*-
r"""What does Typst print for a backslash before a character that is not a syntax character?

The bibliography text carries `\;`, `\_`, `\(`, `\[`, `\>` written straight out of the .bib. The
compile gate accepts all of them, so the only question that matters is what lands on the page --
read the glyphs back out of the PDF rather than guess.
"""
import os
import subprocess
import sys

import fitz

ROOT = r"E:\math"
TMP = os.path.join(ROOT, "_work", "_esc")

CASES = [
    ("semicolon", "A\\;B"),
    ("underscore", "arxiv\\_1706"),
    ("paren", "x\\(y\\)z"),
    ("bracket", "x\\[y\\]z"),
    ("angle", "x\\<y\\>z"),
    ("colon", "x\\:y"),
    ("star", "a\\*b"),
    ("percent", "50\\%"),
    ("ampersand", "A\\&B"),
    ("hash", "x\\#y"),
    ("dollar", "x\\$y"),
]


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    os.makedirs(TMP, exist_ok=True)
    src = os.path.join(TMP, "t.typ")
    lines = ["#set page(width: 30cm, height: 20cm, margin: 1cm)"]
    for name, body in CASES:
        lines.append("%s: %s" % (name, body))
    open(src, "w", encoding="utf-8").write("\n".join(lines) + "\n")
    pdf = os.path.join(TMP, "t.pdf")
    got = subprocess.run(["typst", "compile", src, pdf], capture_output=True)
    print("compile rc=%d" % got.returncode)
    warn = got.stderr.decode("utf-8", "replace")
    if warn.strip():
        print("--- typst says ---")
        print(warn.strip()[:1500])
    doc = fitz.open(pdf)
    print("--- page reads ---")
    print(doc[0].get_text().strip())
    doc.close()


if __name__ == "__main__":
    main()
