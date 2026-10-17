"""How big is the accent leak the `sane` investigation exposed?

A paper's `K\"ahler` reaches a node body, `_markup_text` deletes the command name (here the backslash
of the two-character control symbol) and the accent's *punctuation* stays on the page: the canvas
reads `K"ahler`. That is a figure-text defect of the #24 family, and it is also what made the retired
bracket count mis-pair a Typst string. This counts what the corpus actually writes: for every picture,
which accent control symbols appear in the source and whether the built canvas carries the accent's
character with its command name gone.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
# TeX's accent control *symbols* -- `\"a`, `\'e`, ``\^o``, `\~n``, `\v{z}` -- are one punctuation
# character, so a letter may follow them directly. A backslash followed by a letter is a control
# WORD instead (`\color`, `\cot`, `\cup`), and those are not measured here: an instrument that
# matched `\c` + `o` reported 858 "accents" in this corpus, all of them `\color`.
ACCENT = re.compile(r"\\([\"'`^~])(\??)([A-Za-z]|\{[A-Za-z]\})")
LEAKED = {
    '"': re.compile(r'(?<![\\])"[a-zA-Z]'),
    "'": re.compile(r"[a-zA-Z]'(?:[a-zA-Z]|\s)"),
    "`": re.compile(r"`[a-zA-Z]"),
    "^": re.compile(r"\^[a-zA-Z]"),
    "~": re.compile(r"~[a-zA-Z]"),
}

cmds = Counter()
papers = {}
canvases = 0
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    text = open(src, encoding="utf-8", errors="replace").read()
    name = os.path.basename(src)[:-4]
    hit = 0
    for p in PIC.findall(text):
        found = [(m.group(1), m.group(3)) for m in ACCENT.finditer(p)]
        if not found:
            continue
        canvases += 1
        for c, _letter in found:
            cmds[c] += 1
        built = cetz.build(p)
        if built is None:
            continue
        for c in {c for c, _ in found}:
            probe = LEAKED.get(c)
            if probe and probe.search(built):
                hit += 1
                papers.setdefault(name, []).append(c)
                break
print("pictures that write an accent command: %d" % canvases)
print("accent letters per command:", dict(cmds))
print("built canvases still carrying the accent character as markup: %d papers" % len(papers))
for name, cs in sorted(papers.items(), key=lambda kv: -len(kv[1]))[:15]:
    print("  %s  %s" % (name[:58], "".join(sorted(set(cs)))))
