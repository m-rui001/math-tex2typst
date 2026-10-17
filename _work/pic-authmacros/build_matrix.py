r"""Per-picture conversion decision, measured under one tree.

`--root tools` reproduces the shipped path (a picture is expanded against the preamble table alone);
`--root _work/pic-authmacros` reproduces the patched path (each picture additionally carries its own
figure's definitions and declarations). The two runs are compared to show that the three target
pictures flip refused -> converted and that no picture that already converted flips back. The compile
gate is never called: `cetz.build` answers the canvas and `cetz.sane` checks it, so no `typst` binary
is involved.
"""
import argparse, sys
root = argparse.ArgumentParser().add_argument("--root").parse_args().root
sys.path.insert(0, root)
from t2t import cetz, convert, prep

for name in PAPERS:
    src = open(FLAT + name + ".tex", encoding="utf-8").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    scopes = None
    if hasattr(convert, "picture_scopes"):
        scopes = convert.picture_scopes(body, p.macros)
    for i, m in enumerate(convert.TIKZ_SPAN.finditer(body)):
        pic = m.group(0)
        if scopes is None:
            core = prep.expand_macros(pic, p.macros)
        else:
            table, decls = scopes[i]
            core = prep.expand_macros(convert.with_declarations(pic, decls) if decls else pic, table)
        canvas = cetz.build(core, p.colors, cm)
        state = "refused" if canvas is None else ("built" if cetz.sane(canvas) else "insane")
        print("%s|%d|%s|%d" % (name[:28], i, state, len(canvas or "") and len(canvas.splitlines())))
