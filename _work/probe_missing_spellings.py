r"""Ask pandoc for the Typst spelling of every command name a figure label lost.

cetz's node maths goes through MATH_SYMBOLS, and a name the table lacks keeps its own
letters (cetz.py:876).  pandoc's typst writer knows most of those spellings -- it emits
`$tilde.eq$` for `\simeq` and `$in.not$` for `\notin` -- so one pandoc call over the lost
names says how much of the defect is a short table rather than an untranslatable symbol.
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from probe_tex_defined_words import figure_words  # noqa: E402
from t2t import cetz  # noqa: E402

WORDS = sorted(figure_words()[0])


def main():
    defined = set()
    with open(os.path.join(ROOT, "_work", "cscheck", "words.txt")) as fh:
        for line in fh:
            parts = line.split()
            if len(parts) == 2 and parts[0] == "YES":
                defined.add(parts[1])
    leaks = {w: n for w, n in figure_words()[0].items() if w in defined}
    missing = {w: n for w, n in leaks.items() if "\\" + w not in cetz.MATH_SYMBOLS}
    print("leaked names: %d ; not in MATH_SYMBOLS: %d (%d occurrences) ; already in it: %d"
          % (len(leaks), len(missing), sum(missing.values()),
             len(leaks) - len(missing)))
    # one call per name: pandoc joins adjacent formulas into one paragraph, so a
    # batch would not keep a stable name -> line alignment
    spelled, plain = {}, {}
    for w in sorted(missing):
        p = subprocess.run(["pandoc", "-f", "latex", "-t", "typst"],
                           input=("$\\%s$" % w).encode(), capture_output=True)
        out = p.stdout.decode("utf-8", "replace").strip()
        m = re.match(r"^\$(.*?)\$$", out, re.S)
        if not m:
            continue
        v = " ".join(m.group(1).split())
        (plain if v == w else spelled)[w] = v
    print("pandoc gives a Typst spelling: %d of %d  (%d occurrences)"
          % (len(spelled), len(missing), sum(missing[w] for w in spelled)))
    print("pandoc echoes the letters (operator name, letters are right): %d" % len(plain))
    print("\n-- spellings available now")
    for w, v in sorted(spelled.items(), key=lambda kv: -missing[kv[0]]):
        print("   %-16s %-10d -> %s" % (w, missing[w], v))
    print("\n-- letters echoed")
    print("   " + " ".join(w for w in sorted(plain)))


if __name__ == "__main__":
    main()
