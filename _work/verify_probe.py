# -*- coding: utf-8 -*-
import io, glob, os

ROOT = "E:/math/" + "\u7814\u7a76\u7b14\u8bb0"
# (note-prefix, 1-based line, label)
targets = [
    ("D214", 60, "\\F"),
    ("D214", 74, "psmallmatrix"),
    ("D214", 125, "\\A + \\m"),
    ("D96", 519, "\\d"),
    ("D139", 276, "\\lem"),
    ("D84", 193, "\\H group"),
    ("D31", 304, "\\H no-arg"),
    ("D100", 498, "$ in math"),
    ("D160", 223, "macro-arg EOF"),
    ("D125", 478, "\\closedball"),
    ("D71", 142, "\\T transpose"),
    ("D18", 956, "DeclareMathOperator KEEP"),
    ("D238", 744, "\\math KEEP self-correct"),
    ("D211", 233, "# heading WAIVER"),
]

out = io.open("E:/math/_work/verify_out.txt", "wb")
def p(x=""):
    out.write((x + "\n").encode("utf-8"))

for pre, ln, label in targets:
    matches = glob.glob(os.path.join(ROOT, pre + "-*.md")) + glob.glob(os.path.join(ROOT, pre + ".md"))
    if not matches:
        p("### %s line %d [%s] :: NO FILE" % (pre, ln, label))
        continue
    f = sorted(matches)[0]
    lines = io.open(f, encoding="utf-8").read().split("\n")
    p("### %s (%s) line %d [%s] :: total_lines=%d" % (
        pre, os.path.basename(f)[:24], ln, label, len(lines)))
    for i in range(max(0, ln - 4), min(len(lines), ln + 3)):
        mark = ">>" if (i + 1) == ln else "  "
        p("  %s %4d| %s" % (mark, i + 1, lines[i][:240]))
    p("")
out.close()
raw = io.open("E:/math/_work/verify_out.txt", "rb").read()
assert b"\r" not in raw
print("verify cr-free bytes=%d" % len(raw))
