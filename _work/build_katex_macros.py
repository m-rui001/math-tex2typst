# -*- coding: utf-8 -*-
"""Build the corpus-wide KaTeX macro *schema* (_work/katex_macros.json).

First pass = HIGH-CONFIDENCE only. We record each macro as {"n": numArgs, "tex": template}
where template may contain #1,#2. A companion JS module (katex_macros.js) compiles this
into KaTeX function-macros, because KaTeX 0.19.0 has a bug in the array form ["body", n]
("tokens is not iterable") -- the function form works.

Deliberately OMITTED: ambiguous single-letter shorthands (\D \F \E \G \A \M \V \K \X \T
\o \d ...) whose meaning varies paper-to-paper. Those are flagged on the board.
"""
import json, io

BS = "\\"

def op(name):
    return BS + "operatorname{" + name + "}"

def bb(name):
    return BS + "mathbb{" + name + "}"

def cal(name):
    return BS + "mathcal{" + name + "}"

# schema: cmd -> {"n":numArgs, "tex":template}
S = {}

def add(cmd, tex, n=0):
    S[BS + cmd] = {"n": n, "tex": tex}

# --- paired delimiters (1-arg, no \left/\right -- those also break the expander) ---
add("norm", BS + "Vert #1" + BS + "Vert", 1)
add("abs", "|#1|", 1)
add("normtwo", BS + "Vert #1" + BS + "Vert_2", 1)
add("floor", BS + "lfloor#1" + BS + "rfloor", 1)
add("ceil", BS + "lceil#1" + BS + "rceil", 1)
add("Floor", BS + "lfloor#1" + BS + "rfloor", 1)
add("bigrvert", BS + "bigr|")
add("Bigrvert", BS + "Bigr|")

# --- inner product (2-arg) ---
add("inner", BS + "langle #1,#2" + BS + "rangle", 2)
add("ip", BS + "langle #1,#2" + BS + "rangle", 2)

# --- cross-reference fallbacks (1-arg): render the key as text, do not break math ---
add("eqref", BS + "text{(#1)}", 1)
add("ref", BS + "text{#1}", 1)
add("cite", BS + "text{#1}", 1)
add("Cref", BS + "text{#1}", 1)
add("label", "", 1)  # consume its argument, emit nothing

# --- literals / no-ops (0-arg) ---
add("textdollar", BS + "$")
add("qedhere", "")

# --- standard math operators (0-arg, upright) ---
ops = [
    "Tr", "Var", "Sat", "SDP", "dist", "proj", "Id", "Pic", "Aut", "Hom",
    "Stab", "Sym", "sign", "id", "GL", "SL", "Sp", "SU", "SO", "Spec",
    "Ext", "End", "Hess", "supp", "im", "Span", "Mat", "op", "PGL", "Gal",
    "lcm", "coker", "Frac", "vol", "Res", "Lie", "Hilb", "Br", "KS", "td",
    "rank", "reg", "ev", "loc", "Ann", "can", "gen", "exc", "codim", "colim",
    "Cone", "poly", "fib", "cts", "hofib", "Part", "Full", "asc", "degavg",
    "MaxCut", "DFAS", "rge", "Map", "Eff", "Lipnorm", "Trd", "Prim", "dg",
    "an", "mix", "HM", "Ord", "maj", "MK", "rigr", "igr", "Gram", "arctanh",
    "KL", "scal", "Hg", "cl", "PD", "pt", "ac", "av", "CH", "NS", "Isom",
    "rad", "nullity", "diam", "prop", "dec", "CSB", "WPP", "localSlope",
    "Time", "per", "gap", "OrderedDistinctPoints", "Lemma", "Equation",
    "Thm", "sgn", "const", "cdeg", "len", "Flevel", "Ktail", "ee",
    "negMulLog", "logeps", "span", "succe", "NI", "To", "Two", "Ev",
    "ind", "avg", "range", "Proj", "pos", "Bl", "Ad", "Supp", "Sing",
    "Exc", "pr", "res", "Ric", "alg", "Flag", "Fin", "tree", "pp",
    "curveDegree",
]
for n in ops:
    add(n, op(n))

# --- calligraphic ---
for n in ["calN", "calP", "calB", "calE", "calF", "calG", "cO", "cJ", "cR",
          "cD", "cT"]:
    add(n, cal(n[3:] if n.startswith("cal") else n[1:]))

# --- blackboard bold / probability / reals ---
for cmd, arg in [("C", "C"), ("Q", "Q"), ("QQ", "Q"), ("ZZ", "Z"), ("HH", "H"),
                ("CP", "CP"), ("RP", "RP"), ("Sph", "S"), ("Real", "R"),
                ("Pbb", "P"), ("BE", "E"), ("E", "E")]:
    add(cmd, bb(arg))

# --- misc confidence items ---
add("O", cal("O"))            # ring of integers / big-O
add("HS", BS + "mathrm{HS}")
add("i", BS + "mathrm{i}")      # imaginary unit
add("one", BS + "mathbf{1}")
add("1", BS + "mathbf{1}")      # zero/one vector
add("0", BS + "mathbf{0}")
add("ast", BS + "ast")
add("*", BS + "ast")
add("wh", BS + "widehat{#1}", 1)
add("til", BS + "widetilde{#1}", 1)
add("mathfr", BS + "mathfrak{#1}", 1)
add("mathfrm", BS + "mathfrak{#1}", 1)
add("longhookrightarrow", BS + "hookrightarrow")
add("gtrimes", BS + "rtimes")
add("rffloor", BS + "rfloor")
add("hookive", BS + "hookrightarrow")
add("uphook", BS + "hookrightarrow")
add("widilde", BS + "widetilde{#1}", 1)
add("sslash", BS + "mathbin{/\!/}")
add("vare", BS + "varepsilon")
add("eps", BS + "varepsilon")
add("dR", BS + "mathrm{dR}")
add("dif", BS + "mathrm{d}")
add("sqrtg", BS + "sqrt{g}")

# --- ambiguous single-letter shorthands: intentionally NOT defined here ---
ambiguous = ["D", "F", "G", "A", "M", "V", "K", "X", "T", "w", "m", "j", "g",
             "o", "d", "B", "S", "N", "R", "P", "W", "Y", "Z", "L", "U", "J",
             "H", "q", "ellr", "sqrtg_already", "dR_already", "deltaR",
             "deltaM", "lambdaG", "dv", "dif_already", "dd", "lc", "sr",
             "stHom", "stEnd", "ldim", "Zd", "At", "ar", "alphah", "setu",
             "cr", "restrict", "fall", "lem", "asy", "asypto", "Csum", "betam",
             "Ec", "Ad_already", "root", "box", "tabalign", "clB", "OOo",
             "two_dup", "closedball", "hsSq", "q_dup", "Ex", "ot", "Ce",
             "Sing_already", "lambdaG2", "dv2", "Ad2", "Ec2", "math_dup",
             "V_dup", "G_dup", "A_dup", "math", "lambdah", "two", "o_dup"]

io.open("E:/math/_work/katex_macros.json", "w", encoding="utf-8").write(
    json.dumps(S, ensure_ascii=False, indent=1, sort_keys=True))
print("defined=%d" % len(S))
