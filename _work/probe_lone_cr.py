"""Find lone carriage returns in the pipeline sources.

A patch script written with a non-raw Python string turns ``\\ref`` into CR + 'ef' before it ever
reaches the file, so the corruption looks like a line break in the middle of a sentence. A real CR
only belongs at an end-of-line, so CR-not-followed-by-LF is the signature.
"""
import pathlib

for path in sorted((pathlib.Path(__file__).resolve().parents[1] / "tools").rglob("*.py")):
    text = path.read_bytes().decode("utf-8", "replace")
    bad = [i for i, ch in enumerate(text) if ch == "\r" and (i + 1 >= len(text) or text[i + 1] != "\n")]
    if not bad:
        continue
    print("%s: %d lone CR" % (path.relative_to(path.parents[1]), len(bad)))
    for i in bad:
        print("   %r" % text[max(0, i - 45):i + 45])
