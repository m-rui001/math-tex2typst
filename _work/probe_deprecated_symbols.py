r"""Which of the symbols this corpus emits are names Typst has deprecated -- or does not have at all.

The compiler says both, so the honest way to get the list is to hand it every symbol the products use,
one per compile, and read its answer. `_work/probe_typst_warnings.py` only sees what `compile_err_full`
kept (4,000 chars per paper), which is why it counted 113 `lt.tri`/`gt.tri` while the products hold 199
-- that probe is the discovery, this one is the tally. One symbol per compile also matters: typst stops
a document at its first `unknown variable`, so a single bad name hides every deprecation behind it
(the first version of this probe reported "0 deprecated" for exactly that reason).

Names come out of the products, not out of a table I wrote: every dotted lowercase identifier inside a
`$...$` span, plus every `#sym.xxx`, with `#raw(…)[ … ]` regions cut out first because refused figures
keep their LaTeX there and none of it compiles. Occurrence and paper counts are read off the products
again, because "how many pages does this touch" is a product-side question.

Second half: for every deprecated name, compile the old spelling beside Typst's own suggested new one
and read each glyph's CODEPOINT back with fitz. A rename that changes the glyph is not a cleanup but a
different symbol -- `lt.tri` (U+22B2, open) against `lt.closed` (U+25C1, filled) is precisely the pair
that would rewrite a normal-subgroup sign into a black triangle.
"""
import pathlib
import re
import subprocess
import sys
from collections import Counter, defaultdict

import fitz

ROOT = pathlib.Path(__file__).resolve().parents[1]
TMP = ROOT / "_work" / "deprsyms"
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

# a symbol is the WHOLE dotted name: `diamond.stroked.small` is one symbol, and `stroked.small` on its
# own is not -- without the lookbehind this probe "found" six names typst does not have by cutting the
# tail off a longer one. A name inside a quoted string is not a symbol either: `_quote_run` deliberately
# prints `"fin.dim"` because Typst would read the bare spelling as a field access (#47).
SYM = re.compile(r"(?<![A-Za-z0-9_.])([a-z][a-z0-9]*(?:\.[a-z0-9]+)+)(?![A-Za-z0-9_.])")
QUOTED = re.compile(r'"[^"]*"')
HASHSYM = re.compile(r"#sym\.([a-z0-9.]+)")
WARN = re.compile(r"^warning: (.*)$", re.M)
ERR = re.compile(r"^error: (.*)$", re.M)


def cut_raw(text):
    """Drop every `#raw(…)[ … ]` region: refused figures keep their quoted LaTeX there."""
    out, i = [], 0
    while True:
        j = text.find("#raw(", i)
        if j < 0:
            out.append(text[i:])
            return "".join(out)
        k = text.find(")", j)
        k = text.find("[", k) if k >= 0 else -1
        if k < 0:
            out.append(text[i:])
            return "".join(out)
        depth, m = 0, k
        while m < len(text):
            if text[m] == "[":
                depth += 1
            elif text[m] == "]":
                depth -= 1
                if depth == 0:
                    break
            m += 1
        out.append(text[i:j])
        i = m + 1


def collect():
    """Every symbol spelling the products use, with how often and in how many papers.

    Quoted strings are blanked first, and counts come from the same scan rather than `text.count`,
    which reads `stroked.small` as an occurrence inside `diamond.stroked.small`.
    """
    uses = Counter()
    papers = defaultdict(set)
    for path in sorted((ROOT / "typst").glob("*/main.typ")):
        text = QUOTED.sub('""', cut_raw(path.read_text(encoding="utf-8", errors="replace")))
        found = SYM.findall(text) + HASHSYM.findall(text)
        uses.update(found)
        for name in set(found):
            papers[name].add(path.parent.name)
    return uses, papers


def run(body, tag):
    d = TMP / tag
    d.mkdir(parents=True, exist_ok=True)
    tex = d / "syms.typ"
    tex.write_text("#set page(width: 200pt, height: auto, margin: 6pt)\n" + body, encoding="utf-8")
    r = subprocess.run(["typst", "compile", str(tex), str(d / "syms.pdf")],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    return r, d / "syms.pdf"


def main():
    uses, papers = collect()
    names = sorted(uses)
    print("distinct symbol spellings in products: %d" % len(names))
    dep, unknown = {}, []
    for name in names:
        r, _ = run("$%s$\n" % name, "one")
        w = WARN.search(r.stderr or "")
        e = ERR.search(r.stderr or "")
        if w:
            dep[name] = w.group(1)
        elif e:
            unknown.append((name, e.group(1)))
    print("\nDEPRECATED %d names, %d occurrences, %d papers"
          % (len(dep), sum(uses[n] for n in dep), len({p for n in dep for p in papers[n]})))
    for name, msg in sorted(dep.items(), key=lambda kv: -uses[kv[0]]):
        print("  %-24s %6d uses  %3d papers   %s" % (name, uses[name], len(papers[name]), msg))
    print("\nUNKNOWN to typst %d names, %d occurrences, %d papers"
          % (len(unknown), sum(uses[n] for n, _ in unknown),
             len({p for n, _ in unknown for p in papers[n]})))
    for name, msg in unknown:
        print("  %-24s %6d uses  %3d papers   %s" % (name, uses[name], len(papers[name]), msg))

    # Typst's hint names the base symbol only (`lt.tri` -> `lt.closed`), so a decorated spelling has to
    # be tried with the same substitution: `lt.tri.eq` is U+22B4 and `lt.closed` is U+22B2, and the
    # parity read below is what decides, not the hint.
    cands = sorted({(n, s) for n, msg in dep.items()
                    for s in re.findall(r"`([a-z0-9.]+)`", msg)[1:]}
                   | {(n, n.replace(".tri", ".closed")) for n in dep if ".tri" in n})
    if not cands:
        return
    body = "".join("$%s$ #linebreak()\n" % x for pair in cands for x in pair)
    r, pdf = run(body, "parity")
    print("\nglyph parity (codepoint read back with fitz; compile rc=%d):" % r.returncode)
    if pdf.exists():
        rows = [ln.strip() for p in fitz.open(str(pdf))
                for ln in p.get_text().splitlines() if ln.strip()]
        for i, (old, new) in enumerate(cands):
            go = rows[2 * i] if 2 * i < len(rows) else "?"
            gn = rows[2 * i + 1] if 2 * i + 1 < len(rows) else "?"
            cp = lambda g: ("U+%04X" % ord(g[0])) if len(g) == 1 else "-"  # noqa: E731
            print("  %-22s %s %-7s ->  %-22s %s %-7s  %s"
                  % (old, go, cp(go), new, gn, cp(gn),
                     "SAME GLYPH" if go == gn else "DIFFERENT GLYPH"))


if __name__ == "__main__":
    main()
