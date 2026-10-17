r"""Edit the copied package back to the code as it stood before #93.

The churn probe has to run the OLD emitter and the NEW one over the same 724-paper replay, so the
only difference between the two dumps is this round's two edits: `_math_body`'s last pass
(`tex = re.sub(r"[ \t]*/[ \t]*", '"/"', tex)`) and the guard clauses that pass makes unreachable.
Everything else in the copy stays byte-identical.

  python _work/_make_m93old.py
"""
import io
import sys

PATH = "_work/_m93old/t2t/cetz.py"

OLD_PASS = '''    # Typst reads a `/` in maths as a FRACTION: `$R^2/d_{ij}^{2}$` reaches the page as three LINES,
    # the denominator running to the end of the span, where TeX sets one line with an ordinary slash
    # (`_work/probe93_slash_classes2.py`: 261 spans over 122 papers ship that shape today).  The
    # quoted string `"/"` sets the glyph the author's slash sets -- measured on fifteen shapes taken
    # out of those spans against a pdflatex node of the same TeX
    # (`_work/measure93_slash_fidelity.py`): every one comes back with the control's own line strings,
    # and the gaps the slash bounds read 0.00-0.17pt (the two worst readings, 0.708 and 0.717, sit on a
    # superscript's kern, which is an engine difference 轴 74 already records).  A space on either side
    # of the quoted glyph costs 3.32pt TeX never charges, so the call goes out tight and the author's
    # own spaces around the slash go with it (42 spans over 30 papers write one; TeX ignores a space in
    # maths).  Nothing here is a stacked fraction in disguise:
    # `\\frac`/`\\dfrac`/`\\tfrac` became `frac(...)` calls above (38/6/25 spans) and TeX's infix
    # `\\over`/`\\nicefrac`/`\\binom`/`\\slash` appear 0 times in the canvas maths the emitter receives,
    # and a `/` cannot hide inside a quoted word because `quote_words` only wraps letter runs.
    tex = re.sub(r"[ \\t]*/[ \\t]*", '"/"', tex)
'''

NEW_DOCSTRING_TAIL = '''    honest statement of that is a list of what cannot END an atom -- an opening delimiter or another
    script -- rather than a list of what may: every one of the 80 distinct figure formulas the old
    allow-list refused compiles when handed to Typst as the maths it was
    (`_work/measure_refused_formulas.py`), a prime, a norm's closing `|`, a `+`, a symbol glyph and
    a space all being legal bases.  A slash and a comment pair are not on the list because `_math_body`
    never hands them to this guard: its own last pass turns every `/` into the `"/"` glyph, and `*/`,
    `/*` and `//` cannot be spelled without one.  A letter fused to a digit is broken by that pass's
    neighbour too, so this guard states what Typst refuses rather than what the converter leaves
    unfixed.
'''

OLD_DOCSTRING_TAIL = '''    honest statement of that is a list of what cannot END an atom -- an opening delimiter, a bare
    `/`, or another script -- rather than a list of what may: every one of the 80 distinct figure
    formulas the old allow-list refused compiles when handed to Typst as the maths it was
    (`_work/measure_refused_formulas.py`), a prime, a norm's closing `|`, a `+`, a symbol glyph and
    a space all being legal bases. '/*' and '//' are comments -- and the spaced form of a `*` before
    a '/' is not a fix, because Typst draws a '/' in a canvas as a stacked fraction whose
    denominator runs to the end of the maths (`_work/probe93_slash_face.py`: 265 spans already ship
    that shape over 125 papers, so the slash is one round of its own, not a guard exception).  A
    letter fused to a digit is broken by `_math_body`'s boundary pass before the string reaches
    here, so this guard states what Typst refuses rather than what the converter leaves unfixed.
'''

OLD_TAIL = '''    if re.search(r"[\\^_](?:[\\^_]|$)", tex):
        return False
    if re.search(r"\\*/|/\\*|//", tex):
        return False
    return tex[:1] != "/" and tex[-1:] != "/"
'''

NEW_TAIL = '''    if re.search(r"[\\^_](?:[\\^_]|$)", tex):
        return False
    return True
'''

BASES = 'base[-1] in "([{^_"'
BASES_OLD = 'base[-1] in "([{/^_"'


def main():
    text = io.open(PATH, encoding="utf-8").read()
    for i, (old, new) in enumerate([
            (OLD_PASS, ""),
            (NEW_DOCSTRING_TAIL, OLD_DOCSTRING_TAIL),
            (NEW_TAIL, OLD_TAIL),
            (BASES, BASES_OLD),
    ]):
        if text.count(old) != 1:
            print("FAIL %d: %d occurrences" % (i, text.count(old)))
            return 1
        text = text.replace(old, new)
    io.open(PATH, "w", encoding="utf-8", newline="\n").write(text)
    sys.path.insert(0, "_work/_m93old")
    from t2t import cetz
    print("1/2 ->", repr(cetz._math_body("1/2")))
    print("L_*/3 ->", repr(cetz._math_body(r"L_*/3+O(b_m)")))
    print("/b ->", repr(cetz._math_body("/b")))
    print("safe a/_(x) ->", cetz.math_safe("a/_(x)"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
