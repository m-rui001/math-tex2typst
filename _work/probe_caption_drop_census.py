r"""How many captions never reach the page, because pandoc only keeps a float's one caption?

A \caption inside a minipage, a user float environment, or a second one in the same float is
dropped at pandoc's LaTeX reader, and with it the caption's own words. Count both shapes over the
corpus so the fix is sized, not guessed.
"""
import collections
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
FLOAT = re.compile(r"\\begin\{(figure|table)\*?\}(?:\[[^\]]*\])?.*?\\end\{\1\*?\}", re.S)
CAPTION = re.compile(r"\\caption\b")

outside = collections.Counter()
multi = collections.Counter()
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    if not CAPTION.search(text):
        continue
    floats = FLOAT.findall(text)
    rest = FLOAT.sub("", text)
    n_out = len(CAPTION.findall(rest))
    if n_out:
        outside[tex.stem] += n_out
    for m in FLOAT.finditer(text):
        body = m.group(0)
        hits = len(CAPTION.findall(body))
        if hits > 1:
            multi[tex.stem] += hits - 1

print("caption words sitting outside a figure/table float: %d over %d papers"
      % (sum(outside.values()), len(outside)))
print("extra captions inside one float (pandoc keeps only one): %d over %d papers"
      % (sum(multi.values()), len(multi)))
print("worst outside:", outside.most_common(6))
print("worst multi:", multi.most_common(6))
