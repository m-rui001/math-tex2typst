"""Census: how many papers use tikzcd, and how many leak `gathered` into figure text?"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

cd_papers = []
gathered_papers = []
arrow_papers = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    t = path.read_text(encoding="utf-8", errors="replace")
    n = len(re.findall(r"\\begin\{tikzcd\}", t))
    if n:
        cd_papers.append((n, path.stem))
    g = len(re.findall(r"\\begin\{gathered\}", t))
    if g:
        gathered_papers.append((g, path.stem))
    a = len(re.findall(r"\\arrow\[", t))
    if a:
        arrow_papers.append((a, path.stem))

print("tikzcd papers: %d (total envs %d)" % (len(cd_papers), sum(n for n, _ in cd_papers)))
for n, name in sorted(cd_papers, reverse=True)[:12]:
    print("   %2d  %s" % (n, name[:66]))
print("gathered papers: %d (total %d)" % (len(gathered_papers), sum(n for n, _ in gathered_papers)))
print("arrow papers: %d (total %d)" % (len(arrow_papers), sum(n for n, _ in arrow_papers)))

# how many of the gathered/arrow uses sit inside tikzcd vs tikzpicture
both = 0
for n, name in gathered_papers:
    t = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
    if re.search(r"\\begin\{tikzcd\}", t):
        both += 1
print("gathered papers that also use tikzcd: %d" % both)

# leaked 'gathered' word in emitted canvas content lines
leak = 0
leak_names = []
for main in sorted((ROOT / "typst").glob("*/main.typ")):
    t = main.read_text(encoding="utf-8", errors="replace")
    hits = len(re.findall(r"content\(\([^)]*\), \[[^\]]*\bgathered\b", t))
    if hits:
        leak += hits
        leak_names.append((hits, main.parent.name))
print("emitted canvas labels carrying 'gathered': %d in %d papers" % (leak, len(leak_names)))
for h, name in sorted(leak_names, reverse=True)[:10]:
    print("   %2d  %s" % (h, name[:66]))
