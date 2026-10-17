r"""How many pictures are written tight against a control word, so their marker fuses?

``convert.preserve_tikz`` swaps a picture for the token ``ZQT2TTIKZ<i>`` with no space around it.
When the source writes ``\centering\begin{tikzpicture}`` the token lands directly after a control
word's letters, and LaTeX's reader -- pandoc's too -- takes ``\centeringZQT2TTIKZ1`` as ONE command
name, so the token never appears in the parsed text and the restore step at convert.py:433 finds
nothing: the figure keeps its caption and loses its content. That is what the Cylinder-amplitudes
paper does to three of its four pictures (``_work/probe_tip_missing_canvas.py``).

This counts, per paper, the pictures whose opening brace is preceded by a letter with no space
between, and the ones whose closing brace is followed by a letter (harmless for the find, but it
would show up as a marker glued to prose).
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
OPEN = re.compile(r"(?<=[A-Za-z])\\begin\{tikzpicture\}")
CLOSED = re.compile(r"\\end\{tikzpicture\}(?=[A-Za-z])")


def main():
    fused_pics = fused_papers = 0
    tail_pics = tail_papers = 0
    shown = 0
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        a = len(OPEN.findall(src))
        b = len(CLOSED.findall(src))
        if not a and not b:
            continue
        fused_pics += a
        tail_pics += b
        if a:
            fused_papers += 1
        if b:
            tail_papers += 1
        if a and shown < 12:
            shown += 1
            m = OPEN.search(src)
            print("   %-58s %d fused | %s" % (path.stem[:58], a,
                                              src[max(0, m.start() - 40):m.start() + 20].replace("\n", "\\n")))
    print("pictures written tight after a control word: %d over %d papers" % (fused_pics, fused_papers))
    print("pictures written tight before the following text: %d over %d papers" % (tail_pics, tail_papers))
    return 0


if __name__ == "__main__":
    sys.exit(main())
