r"""Split the 209 `#h(0em)` tokens back onto the two source spellings that produce them.

`mathconv.clean()` hands pandoc's Typst writer both `\;` and `\enspace`, and the writer
collapses them into one token -- `#h(0em)` -- so the product side cannot tell them apart
(§7 row "pandoc 把 `\;` 与 `\enspace` 合成同一个 `#h(0em)`"). The split has to be taken
on the source side, where the two spellings are still distinct.

The population is the flat sources the batch actually reads (`_work/flat/*.tex`), not the
products -- the product token is the merged one. For each paper we print the two raw counts
and whether that paper carries `#h(0em)` in its own `typst/<stem>/main.typ`, so a paper whose
`\;`/`\enspace` never reaches the maths channel shows up as a mismatch instead of a silent
over-count.

  python _work/probe87_enspace_face.py [--pairs]
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# `\;` is a control symbol (backslash + semicolon); `\enspace` a control word. Count both
# without eating a longer neighbour: `\enspace` must not match inside `\enspacefoo`, and
# `\;` must not match the `\;` of `\;;` (there is no such thing, but the guard is free).
SEMI = re.compile(r"\\;")
ENSPACE = re.compile(r"\\enspace(?![A-Za-z])")


def main():
    pairs = "--pairs" in sys.argv
    flats = sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")))
    semi_tot = ens_tot = 0
    semi_papers = ens_papers = 0
    both = only_semi = only_ens = 0
    mismatch = []
    rows = []
    for path in flats:
        stem = os.path.basename(path)[:-4]
        text = open(path, encoding="utf-8").read()
        n_semi = len(SEMI.findall(text))
        n_ens = len(ENSPACE.findall(text))
        prod = os.path.join(ROOT, "typst", stem, "main.typ")
        n_tok = 0
        if os.path.exists(prod):
            n_tok = open(prod, encoding="utf-8").read().count("#h(0em)")
        semi_tot += n_semi
        ens_tot += n_ens
        if n_semi:
            semi_papers += 1
        if n_ens:
            ens_papers += 1
        if n_semi and n_ens:
            both += 1
        elif n_semi:
            only_semi += 1
        elif n_ens:
            only_ens += 1
        if (n_semi or n_ens) and n_tok == 0:
            mismatch.append((stem, n_semi, n_ens, n_tok))
        if n_semi or n_ens:
            rows.append((n_semi + n_ens, stem, n_semi, n_ens, n_tok))
    print("flat sources = %d" % len(flats))
    print(r"  \;        %4d occurrences over %3d papers" % (semi_tot, semi_papers))
    print(r"  \enspace  %4d occurrences over %3d papers" % (ens_tot, ens_papers))
    print("  papers with both = %d, only \\; = %d, only \\enspace = %d"
          % (both, only_semi, only_ens))
    print("  papers carrying #h(0em) in the product = %d"
          % sum(1 for p in flats
                if os.path.exists(os.path.join(ROOT, "typst", os.path.basename(p)[:-4], "main.typ"))
                and open(os.path.join(ROOT, "typst", os.path.basename(p)[:-4], "main.typ"),
                         encoding="utf-8").read().count("#h(0em)")))
    print("  source-has-spelling but product-has-no-token = %d" % len(mismatch))
    for stem, a, b, c in mismatch[:20]:
        print("    %-60s \\;=%d \\enspace=%d #h(0em)=%d" % (stem, a, b, c))
    if pairs:
        rows.sort(reverse=True)
        print("\n-- per paper (spelling count desc) --")
        for tot, stem, a, b, c in rows:
            print("  %-60s \\;=%3d \\enspace=%3d #h(0em)=%3d" % (stem, a, b, c))
    return 0


if __name__ == "__main__":
    sys.exit(main())
