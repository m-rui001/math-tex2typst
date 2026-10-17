"""Count the unresolved-citation marks `[??]` in the generated Typst across the corpus.

`mathconv.bake_refs` turns a `\\citep{key}` inside a formula into `\\text{[<shown>]}`, and
`_shown` answers `??` for a key the bibliography never registered -- so a `[??]` is a citation whose
key is missing, not a dangling `\\ref` (which prints a bare `??`). Both are counted, apart.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

CITE = re.compile(r"\[\?\?\]")
BARE = re.compile(r"(?<!\[)\?\?(?!\])")

cite_total = bare_total = 0
cite_papers = []
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    text = path.read_text(encoding="utf-8", errors="replace")
    n = len(CITE.findall(text))
    if n:
        cite_total += n
        cite_papers.append((n, path.parent.name))
    bare_total += len(BARE.findall(text))
print("[??] citation marks: %d over %d papers" % (cite_total, len(cite_papers)))
for n, name in sorted(cite_papers, reverse=True):
    print("   %2d  %s" % (n, name[:64]))
print("bare ?? (dangling \\ref): %d" % bare_total)
