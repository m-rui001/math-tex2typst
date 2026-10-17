r"""What does a TikZ length written in a font-relative unit (`em`, `ex`) do to our products?

`UNITS` in cetz.py knows cm/mm/in/pt/bp and nothing else, so `minimum width=2em` either reaches
`_length` and is read as None (the key is then dropped, or the picture is refused) or is read as a
bare number. This census says which: for every relative unit inside a `tikzpicture` it prints the
key it sits on, the paper, and what a batch-basis `cetz.build` did with the statement.

Read-only on the sources plus one `build` per affected picture -- no compiled product involved, so
this is safe to run while a batch is writing the PDFs.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

from t2t import cetz  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
REL = re.compile(r"([-+]?\d*\.?\d+) *(em|ex)\b")
KEY = re.compile(r"([A-Za-z ]*?)\s*=\s*[-+]?\d*\.?\d* ?(?:em|ex)")


def main():
    hits = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for i, m in enumerate(PIC.finditer(src)):
            pic = m.group(0)
            for u in REL.finditer(pic):
                before = pic[max(0, u.start() - 60):u.start()]
                k = KEY.finditer(before)
                key = None
                for k in KEY.finditer(before):
                    key = k.group(1).strip()
                line = pic[:u.start()].count("\n")
                hits.append((stem, i, key or "?", u.group(0), line))
    print("relative-unit lengths in tikzpictures: %d over %d papers"
          % (len(hits), len(set(h[0] for h in hits))))
    bykey = {}
    for h in hits:
        bykey.setdefault(h[2].split()[-1] if h[2] != "?" else "?", []).append(h)
    for key in sorted(bykey, key=lambda k: -len(bykey[k])):
        print("  %-16s %3d  e.g. %s" % (key, len(bykey[key]), bykey[key][0][3]))
    print()
    # what does the converter do with one? rebuild the picture on the batch basis and look
    for stem, i, key, spell, line in hits[:12]:
        src = open(os.path.join(ROOT, "_work", "flat", stem + ".tex"),
                   encoding="utf-8", errors="replace").read()
        pics = PIC.findall(src)
        built = cetz.build(cetz.strip_envelope(pics[i]))
        shown = "?" if built is None else ("no line" if spell.split()[0] not in built else "present")
        print("%-40s pic %d  %-12s %-10s -> %s" % (stem[:40], i, key, spell, shown))


if __name__ == "__main__":
    main()
