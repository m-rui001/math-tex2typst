r"""Compile each candidate Typst spelling alone; only a spelling typst accepts may enter the table.

Also reports the glyph typst draws (via fitz), so a name that compiles to the WRONG symbol is
caught rather than shipped.
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(errors="replace")

# name -> (latex command, candidate typst spelling)
CAND = {
    # symbol commands pandoc spells
    "cap": ("\\cap", "sect"), "mid": ("\\mid", "divides"), "sim": ("\\sim", "tilde.op"),
    "simeq": ("\\simeq", "tilde.eq"), "langle": ("\\langle", "chevron.l"),
    "rangle": ("\\rangle", "chevron.r"), "longmapsto": ("\\longmapsto", "mapsto"),
    "otimes": ("\\otimes", "times.circle"), "leftrightarrow": ("\\leftrightarrow", "arrow.l.r"),
    "ast": ("\\ast", "*"), "pm": ("\\pm", "plus.minus"),
    "notin": ("\\notin", "in.not"), "cong": ("\\cong", "tilde.equiv"),
    "jmath": ("\\jmath", "dotless.j"), "ni": ("\\ni", "in.rev"),
    "bigoplus": ("\\bigoplus", "xor.big"), "gg": ("\\gg", "gt.double"),
    "int": ("\\int", "integral"), "lfloor": ("\\lfloor", "floor.l"),
    "longleftrightarrow": ("\\longleftrightarrow", "arrow.l.r.long"),
    "neg": ("\\neg", "not"), "preceq": ("\\preceq", "prec.curly.eq"),
    "rfloor": ("\\rfloor", "floor.r"), "supseteq": ("\\supseteq", "supset.eq"),
    "Longleftrightarrow": ("\\Longleftrightarrow", "arrow.l.r.double.long"),
    "bot": ("\\bot", "tack.t"), "downarrow": ("\\downarrow", "arrow.b"),
    "emptyset": ("\\emptyset", "nothing"), "iff": ("\\iff", "arrow.l.r.double"),
    "longleftarrow": ("\\longleftarrow", "arrow.l.long"),
    "lor": ("\\lor", "or"), "prod": ("\\prod", "product"),
    "uparrow": ("\\uparrow", "arrow.t"), "varrho": ("\\varrho", "rho.alt"),
    # symbol commands pandoc echoes (letters would be wrong)
    "chi": ("\\chi", "chi"), "Psi": ("\\Psi", "Psi"), "sum": ("\\sum", "sum"),
    "supset": ("\\supset", "supset"), "asymp": ("\\asymp", "asymp"),
    "approx": ("\\approx", "approx"), "top": ("\\top", "top"),
    "bullet": ("\\bullet", "bullet"), "sharp": ("\\sharp", "sharp"),
    "perp": ("\\perp", "perp"), "div": ("\\div", "div"),
    # operator names pandoc echoes (bare operator is the right rendering)
    "cos": ("\\cos", "cos"), "sin": ("\\sin", "sin"), "tan": ("\\tan", "tan"),
    "cot": ("\\cot", "cot"), "sec": ("\\sec", "sec"), "csc": ("\\csc", "csc"),
    "tanh": ("\\tanh", "tanh"), "max": ("\\max", "max"), "min": ("\\min", "min"),
    "sup": ("\\sup", "sup"), "inf": ("\\inf", "inf"), "ker": ("\\ker", "ker"),
    "dim": ("\\dim", "dim"), "deg": ("\\deg", "deg"), "exp": ("\\exp", "exp"),
    "liminf": ("\\liminf", "liminf"), "Im": ("\\Im", "Im"), "Re": ("\\Re", "Re"),
    # layout commands -> deleted
    "left": ("\\left", " "), "right": ("\\right", " "), "bigl": ("\\bigl", " "),
    "bigr": ("\\bigr", " "), "big": ("\\big", " "), "Big": ("\\Big", " "),
    "biggl": ("\\biggl", " "), "biggr": ("\\biggr", " "), "Bigl": ("\\Bigl", " "),
    "Bigr": ("\\Bigr", " "), "Bigg": ("\\Bigg", " "), "textstyle": ("\\textstyle", " "),
    "scriptstyle": ("\\scriptstyle", " "), "limits": ("\\limits", " "),
    "nolimits": ("\\nolimits", " "),
}


def main():
    import fitz
    tmp = tempfile.mkdtemp(prefix="spell")
    bad = []
    for name, (latex, cand) in sorted(CAND.items()):
        path = os.path.join(tmp, "s.typ")
        pdf = os.path.join(tmp, "s.pdf")
        open(path, "w", encoding="utf-8").write("$ %s $\n" % cand)
        r = subprocess.run(["typst", "compile", path, pdf], capture_output=True)
        if r.returncode:
            bad.append((name, cand, "FAIL"))
            continue
        d = fitz.open(pdf)
        glyph = ""
        for page in d:
            for b in page.get_text("dict")["blocks"]:
                for l in b.get("lines", []):
                    for sp in l["spans"]:
                        glyph += sp["text"]
        d.close()
        print("  %-20s %-16s %-16s -> %r" % (latex, name, cand, glyph.strip()[:20]))
    print("\nFAILED: %d" % len(bad))
    for name, cand, _ in bad:
        print("   %-20s %r" % (name, cand))


if __name__ == "__main__":
    main()
