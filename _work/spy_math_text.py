"""What text actually reaches the maths path's picture branch.

`emit.math_text` converts any formula whose text holds a picture, which is where the one figure
that draws a collapsed blob must come from. Wrap that call, run one paper through the real
converter, and print every picture-bearing string with its length, so the fragment is read
instead of guessed.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import convert, emit  # noqa: E402

PIC = re.compile(r"\\begin\{(?:tikzpicture|tikzcd|CD)\}")
seen = []
original = emit.Emitter.math_text


def spy(self, latex):
    if PIC.search(latex):
        seen.append(latex)
    return original(self, latex)


def main():
    paper = sys.argv[1]
    flat = next((ROOT / "_work" / "flat").glob(paper + "*.tex"))
    out = ROOT / "_work" / "_spy" / flat.stem
    out.mkdir(parents=True, exist_ok=True)
    emit.Emitter.math_text = spy
    convert.convert_paper(str(flat), str(out), flat.stem)
    emit.Emitter.math_text = original
    for text in seen:
        print("== %d chars, ends with the picture: %s" % (
            len(text), text.rstrip().endswith("\\end{tikzpicture}")
            or text.rstrip().endswith("\\end{tikzcd}")))
        print(" ".join(text.split())[:900])


main()
