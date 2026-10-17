"""Control for the 46-canvas claim: were those refusals old, or caused by the new marks?

`_work/probe_sane_yield.py` replayed the retired bracket count over canvases built by *today's* code,
which now writes CeTz's curved head as `")>"` and its bar tip as `"]"`. A count over the line as
written refuses exactly those spellings, so the 46 may all be new marks rather than 46 pictures the
corpus has been losing all along. The control names the line the count trips on: if every offending
line carries a `mark:`, the refusal is something the arrow change introduced; if a mark-free line
offends, the generated tree was already dropping that figure.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def bad_line(line):
    """The retired guard's verdict on one canvas line."""
    stripped = re.sub(r"\\.", "", line)
    if stripped.count("$") % 2:
        return True
    plain = re.sub(r"\$[^$]*\$", "", stripped)
    return plain.count("[") != plain.count("]") or plain.count("(") != plain.count(")")


def main():
    new_caused = old_harm = 0
    harms, samples = [], []
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            got = cetz.build(p)
            if got is None or cetz.sane(got) is False:
                continue
            offend = [l for l in got.splitlines()[2:-1] if bad_line(l)]
            if not offend:
                continue
            if all("mark: (" in l for l in offend):
                new_caused += 1
                samples.append(offend[0].strip()[:130])
            else:
                old_harm += 1
                harms.append((os.path.basename(src)[:46], offend[0].strip()[:110]))
    print("canvases the retired count rejects: %d only because of a new mark, %d with a "
          "mark-free line offending (those the tree already lost)" % (new_caused, old_harm))
    for name, line in harms[:8]:
        print("  OLD %s\n      %s" % (name, line))
    for line in samples[:4]:
        print("  NEW %s" % line)


if __name__ == "__main__":
    main()
