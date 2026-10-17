r"""Count `\;` and `\enspace` *inside maths* in the flat sources, against the product token.

`probe87_enspace_face.py` counts both spellings raw, but a raw `\enspace` is usually prose
(`\textbf{Heading.}\enspace Text`), and prose never reaches the maths channel -- only what
`mathconv.clean()` hands pandoc inside `$ ... $` does. This probe walks each flat source,
tracks whether the cursor is inside a maths span (`$...$`, `\(...\)`, `\[...\]`, `$$...$$`,
and the amsmath display environments), and counts the two spellings only there. The per-paper
sum should land on that paper's own `#h(0em)` count in `typst/<stem>/main.typ`; a paper whose
sum overshoots is one where a spelling in maths did not become the token, and one that
undershoots is where the token came from somewhere this scanner did not see.

  python _work/probe87_math_spans.py [--pairs]
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

MATH_ENVS = ("equation", "equation*", "align", "align*", "aligned", "gather", "gather*",
             "multline", "multline*", "eqnarray", "eqnarray*", "displaymath", "math",
             "alignat", "alignat*", "flalign", "flalign*", "split", "array", "cases",
             "matrix", "pmatrix", "bmatrix", "vmatrix", "smallmatrix")
BEGIN_ENV = re.compile(r"\\begin\{([^}]*)\}")
END_ENV = re.compile(r"\\end\{([^}]*)\}")
SEMI = re.compile(r"\\;")
ENSPACE = re.compile(r"\\enspace(?![A-Za-z])")


def spans(text):
    """Yield (start, end) of every maths span, by a single left-to-right walk."""
    out = []
    i, n = 0, len(text)
    env_stack = []
    start = None
    while i < n:
        c = text[i]
        if c == "\\":
            two = text[i:i + 2]
            if two == r"\[":
                if start is None:
                    start = i
                i += 2
                continue
            if two == r"\]":
                if start is not None:
                    out.append((start, i + 2))
                    start = None
                i += 2
                continue
            if two == r"\(":
                if start is None:
                    start = i
                i += 2
                continue
            if two == r"\)":
                if start is not None:
                    out.append((start, i + 2))
                    start = None
                i += 2
                continue
            m = BEGIN_ENV.match(text, i)
            if m:
                env_stack.append((m.group(1), i))
                if m.group(1) in MATH_ENVS and start is None:
                    start = i
                i = m.end()
                continue
            m = END_ENV.match(text, i)
            if m:
                name = m.group(1)
                # close the innermost matching begin
                for k in range(len(env_stack) - 1, -1, -1):
                    if env_stack[k][0] == name:
                        b_start = env_stack[k][1]
                        del env_stack[k:]
                        if name in MATH_ENVS and start is not None:
                            out.append((start, m.end()))
                            start = None
                        break
                i = m.end()
                continue
            i += 2
            continue
        if c == "$":
            # $$ ... $$ or $ ... $
            if text[i:i + 2] == "$$":
                if start is not None:
                    out.append((start, i + 2))
                    start = None
                else:
                    start = i
                i += 2
                continue
            if start is not None:
                out.append((start, i + 1))
                start = None
            else:
                start = i
            i += 1
            continue
        i += 1
    if start is not None:
        out.append((start, n))
    return out


def count_in_math(text):
    a = b = 0
    for s, e in spans(text):
        seg = text[s:e]
        a += len(SEMI.findall(seg))
        b += len(ENSPACE.findall(seg))
    return a, b


def main():
    pairs = "--pairs" in sys.argv
    flats = sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")))
    ms = me = 0
    rows = []
    for path in flats:
        stem = os.path.basename(path)[:-4]
        text = open(path, encoding="utf-8").read()
        a, b = count_in_math(text)
        prod = os.path.join(ROOT, "typst", stem, "main.typ")
        tok = open(prod, encoding="utf-8").read().count("#h(0em)") if os.path.exists(prod) else 0
        ms += a
        me += b
        if a or b or tok:
            rows.append((tok, stem, a, b))
    print("flat sources = %d" % len(flats))
    print(r"  \;       in maths  %4d" % ms)
    print(r"  \enspace in maths  %4d" % me)
    print("  sum = %d   (product #h(0em) = 209)" % (ms + me))
    print("  papers where maths-sum != product token: %d"
          % sum(1 for t, _s, a, b in rows if a + b != t))
    if pairs:
        rows.sort(reverse=True)
        print("\n-- papers with maths-\\enspace or a mismatch --")
        for tok, stem, a, b in rows:
            if b or a + b != tok:
                print("  %-58s \\;=%3d \\enspace=%3d #h(0em)=%3d" % (stem, a, b, tok))
    return 0


if __name__ == "__main__":
    sys.exit(main())
