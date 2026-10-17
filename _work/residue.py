"""Leftover LaTeX in the generated Typst, with the deliberate #raw quotations counted apart.

A #raw block is still TeX on the page, so reporting only the un-quoted residue lets a refused
picture hide behind the metric: both numbers print, and the raw one names how many papers carry it.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
# Only control sequences are residue: texmath writes Typst grouping as '\( \)', so
# escaped punctuation is normal output, not leftover TeX.
MACRO = re.compile(r"\\[A-Za-z@]+\*?")
RAW = re.compile(r"#raw\(")
RAW_LATEX = re.compile(r'#raw\(block: true, lang: "latex"')


def unescape(line):
    r"""Undo Typst string quoting so only real TeX is counted.

    A quoted formula writes \nu as '\\nu', while a lone '\n' in that same string is
    an escaped newline; collapsing the doubled backslashes first tells them apart.
    """
    return line.replace("\\\\", "\x00").replace("\\n", "").replace("\x00", "\\")


kind = collections.Counter()
where = collections.Counter()
files = set()
raw_blocks = collections.Counter()
shown = collections.defaultdict(list)
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
        for _n in RAW_LATEX.findall(line):
            raw_blocks[path.parent.name] += 1
        if RAW.search(line):
            continue
        hits = MACRO.findall(unescape(line))
        if not hits:
            continue
        files.add(path.parent.name)
        for h in hits:
            kind[h] += 1
        stripped = line.strip()
        zone = "code" if stripped.startswith("#") else (
            "math" if "$" in stripped else "markup")
        where[zone] += len(hits)
        for h in set(hits):
            if len(shown[h]) < 3:
                shown[h].append("%s:%s" % (path.parent.name[:22], stripped[:120]))

print("files with residue: %d ; occurrences: %d" % (len(files), sum(kind.values())))
print("quoted LaTeX on the page: %d blocks over %d papers"
      % (sum(raw_blocks.values()), len(raw_blocks)))
print("zones:", dict(where))
for h, n in kind.most_common(int(sys.argv[1]) if len(sys.argv) > 1 else 25):
    print("%6d  %-18s" % (n, h))
    for ex in shown[h]:
        print("          " + ex)
