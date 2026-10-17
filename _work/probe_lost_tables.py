"""Do table floats reach the generated Typst?

A dangling `\label` for a table can mean two different things: the caption is there and only the key
was lost, or pandoc dropped the whole float. Match each source `\caption` inside a `table`
environment against the generated page by a distinctive word from it, and report the papers where
the caption text never arrives.
"""
import re
import pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
TABLE = re.compile(r"\\begin\{table\*?\}.*?\\end\{table\*?\}", re.S)
CAP = re.compile(r"\\caption\{")
STOP = set("the this that with from are and for its their which while without below above".split())


def words(text):
    text = re.sub(r"\\[a-zA-Z]+|[{}$\\&%^_~]", " ", text)
    return [w for w in re.findall(r"[A-Za-z]{9,}", text) if w.lower() not in STOP]


def bracketed(text, start):
    depth, i = 0, start
    while i < len(text):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if not depth:
                return text[start + 1:i], i + 1
        i += 1
    return None, start


missing = []
total = kept = 0
for src in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    dst = ROOT / "typst" / src.stem / "main.typ"
    if not dst.is_file():
        continue
    body = dst.read_text(encoding="utf-8", errors="replace")
    tex = src.read_text(encoding="utf-8", errors="replace")
    lost = []
    for m in TABLE.finditer(tex):
        cap = CAP.search(m.group(0))
        if not cap:
            continue
        text, _ = bracketed(m.group(0), cap.end() - 1)
        if text is None:
            continue
        probe = words(text)
        if not probe:
            continue
        total += 1
        if all(w not in body for w in probe[:3]):
            lost.append(" ".join(probe[:3]))
        else:
            kept += 1
    if lost:
        missing.append((src.stem, len(lost), lost[0][:52]))

print("table captions in sources: %d ; present in the page: %d ; absent: %d"
      % (total, kept, total - kept))
for stem, n, ex in sorted(missing, key=lambda t: -t[1])[:18]:
    print("%3d  %-44s %s" % (n, stem[:44], ex))
print("papers with a lost table caption:", len(missing))
