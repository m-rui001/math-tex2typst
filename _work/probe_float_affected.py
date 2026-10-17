"""Papers whose floats the #22 change touches: a custom `\@captype` env, or a `longtable` caption."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

NEWENV = re.compile(r"\\newenvironment\{([A-Za-z][A-Za-z0-9]*)\}")
CAPTYPE = re.compile(r"\\@captype\s*\{\s*(figure|table)\s*\}")
CAPTION = re.compile(r"\\caption\b")

custom = []
longt = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    names = set(NEWENV.findall(text))
    hit = False
    for m in NEWENV.finditer(text):
        # the definition window carries the \@captype
        window = text[m.start():m.start() + 400]
        if CAPTYPE.search(window) and re.search(r"\\begin\{%s\}" % re.escape(m.group(1)), text):
            hit = True
    if hit:
        custom.append(path.stem)
    if re.search(r"\\begin\{longtable\}", text) and "longtable" in text:
        if CAPTION.search(text):
            longt.append(path.stem)

print("custom \\@captype float envs: %d" % len(custom))
for n in custom:
    print("   ", n[:64])
print("longtable papers: %d" % len(longt))
for n in longt:
    print("   ", n[:64])
names = sorted(set(custom) | set(longt))
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(names), encoding="utf-8")
print("wrote %d names to _work/regen_needed.txt" % len(names))
