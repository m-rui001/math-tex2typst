"""Corpus shape after the re-flatten: unbalanced links, picture environments.

Run: python _work/probe_flat_shape.py
"""
import glob
import pathlib
import re

FLAT = pathlib.Path(__file__).resolve().parents[1] / "_work" / "flat"
UNCLOSED = re.compile(r"\\(?:href|url|nolinkurl)\{[^{}]*$", re.M)
ENV = {
    "tikzcd": re.compile(r"\\begin\{tikzcd\}"),
    "tikzpicture": re.compile(r"\\begin\{tikzpicture\}"),
    "CD": re.compile(r"\\begin\{CD\}"),
    "pspicture": re.compile(r"\\begin\{pspicture\}"),
}

files = sorted(FLAT.glob("*.tex"))
counts = {name: 0 for name in ENV}
papers = {name: 0 for name in ENV}
unclosed = 0
for path in files:
    text = path.read_text(encoding="utf-8", errors="replace")
    if UNCLOSED.search(text):
        unclosed += 1
    for name, rx in ENV.items():
        found = len(rx.findall(text))
        if found:
            counts[name] += found
            papers[name] += 1
print("flat=%d unclosed_link_files=%d" % (len(files), unclosed))
for name in ENV:
    print("  %-12s envs=%-5d papers=%d" % (name, counts[name], papers[name]))
