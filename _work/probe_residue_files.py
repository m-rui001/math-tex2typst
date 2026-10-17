r"""Which papers still hold quoted LaTeX, and how much of it is one formula?

The tail is a dozen files, so the next fix is chosen by the biggest single span rather than
by the control sequence that happens to appear most.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
MACRO = re.compile(r"\\[A-Za-z@]+\*?")
LIMIT = int(sys.argv[1]) if len(sys.argv) > 1 else 40


def unescape(line):
    return line.replace("\\\\", "\x00").replace("\\n", "").replace("\x00", "\\")


per = collections.Counter()
spans = collections.defaultdict(list)
whole = {}
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
        if "#raw(" in line:
            continue
        hits = MACRO.findall(unescape(line))
        if not hits:
            continue
        key = path.parent.name[:42]
        per[key] += len(hits)
        whole[key] = path
        spans[key].append(len(hits))

print("files: %d ; occurrences: %d" % (len(per), sum(per.values())))
for name, n in per.most_common(14):
    biggest = max(spans[name])
    print("%5d  longest span %3d  %s" % (n, biggest, name))
    for line in whole[name].read_text(
            encoding="utf-8", errors="replace").split("\n"):
        if "#raw(" in line:
            continue
        if len(MACRO.findall(unescape(line))) >= LIMIT:
            print("        " + line.strip()[:150])
            break
