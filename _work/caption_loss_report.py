"""Did every \\caption in the corpus reach the generated page?

A float whose body is a display-math array reached `The-Kervaire-…`'s Typst as the array alone: its
caption sentence and its label are both gone, and `figure_content_unhandled` reported 0 because it
only watches picture bodies. This walks the flattened LaTeX, takes each caption's longest run of
plain words, and looks for that run in the paper's own `main.typ`, with whitespace allowed to differ
because a converted caption carries Typst spacing. A caption that cannot be found at all is content
the reader never sees.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
CAPTION = re.compile(r"\\caption\*?\s*\{")
WORDS = re.compile(r"[A-Za-z]{3,}(?:[ \t]+[A-Za-z]{3,}){2,}")


def caption_core(text):
    """The caption's own words, with nested braces balanced out."""
    depth, out, i = 1, [], 0
    while i < len(text) and depth:
        ch = text[i]
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if not depth:
                break
        elif not depth == 1 or ch != "\\":
            out.append(ch)
        i += 1
    return "".join(out)


missing = []
total = 0
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = tex.name[:-4]
    out = ROOT / "typst" / paper / "main.typ"
    if not out.exists():
        print("no generated typst for %s" % paper)
        continue
    hay = re.sub(r"\s+", " ", out.read_text(encoding="utf-8", errors="replace")).lower()
    src = tex.read_text(encoding="utf-8", errors="replace")
    for m in CAPTION.finditer(src):
        body = caption_core(src[m.end():])
        run = max(WORDS.findall(body), key=len, default="")
        if not run:
            continue
        total += 1
        if re.sub(r"\s+", " ", run).lower() not in hay:
            missing.append((paper, re.sub(r"\s+", " ", run)[:70]))

print("captions checked: %d ; not found in the generated page: %d" % (total, len(missing)))
seen = set()
for paper, run in missing:
    if paper not in seen and len(seen) < 15:
        seen.add(paper)
        print("   %-44s %s" % (paper[:44], run))
print("papers affected: %d" % len({p for p, _ in missing}))
