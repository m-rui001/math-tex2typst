"""Does the corpus give tikzcd's `column sep` / `row sep` a numeric dimension at all?

`cd_gap` only knows the named sizes in `CD_SIZE`; `column sep=8em` reads as an unknown token and
falls back to the default, which is how `Global-quantum-…#0` came to set its two columns 2.6cm apart
while the arrow label over that gap is 90pt wide.  Before that fallback is widened into a law, the
question is how many pictures ever write a dimension there -- a one-off in one paper is that paper's
problem, not a rule for `cetz.py`.

Prints every `column sep` / `row sep` value in the corpus's `tikzcd` preambles, split into the ones
`CD_SIZE` already answers and the ones it drops, with the unit of each dropped value and the paper it
came from.  Also counts the `CD` (amscd) environments' `\CDwidth`-style settings, since those are the
other way an exchange diagram asks for a wider gap.

  python _work/probe89_cd_sep_census.py
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

GAP = re.compile(r"\b(column|row|baselineskip) sep\s*=\s*([^\s,\]}]+)")
ENV = re.compile(r"\\begin{tikzcd}(?:\[[^\]]*\])?")


def main():
    kept = {}
    dropped = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for m in ENV.finditer(src):
            opts = m.group(0)[len("\\begin{tikzcd}"):]
            for kind, val in GAP.findall(opts):
                token = "%s=%s" % (kind, val)
                if cetz.CD_SIZE.get(val) is not None:
                    kept.setdefault(token, []).append(stem)
                else:
                    dropped.setdefault(token, []).append(stem)
    print("values cd_gap already answers:")
    for token in sorted(kept):
        print("  %-24s %d pics / %d papers   -> %.2f cm"
              % (token, len(kept[token]), len(set(kept[token])), cetz.CD_SIZE[token.split("=")[1]]))
    print("\nvalues that fall back to the default (%d distinct):" % len(dropped))
    for token in sorted(dropped):
        print("  %-24s %d pics / %d papers   %s"
              % (token, len(dropped[token]), len(set(dropped[token])),
                 sorted({s[:40] for s in dropped[token]})[:3]))
    units = {}
    for token in dropped:
        m = re.match(r"([-\d.]+)\s*([a-zA-Z]+)", token.split("=", 1)[1])
        if m:
            units.setdefault(m.group(2), set()).add(token)
    print("\nunits among the dropped values: %s"
          % ", ".join("%s (%d)" % (u, len(v)) for u, v in sorted(units.items())))
    print("\nCD_SIZE keys: %s" % ", ".join(sorted(cetz.CD_SIZE)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
