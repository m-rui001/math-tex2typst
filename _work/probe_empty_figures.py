r"""The twelve `#figure([], ...)` blocks: what did their source float actually hold?

An empty content is a lost picture only if the float held one. Match each emitted caption back to the
source float by the words the two have in common (the emitted caption carries converted maths, so an
exact substring search fails), then print what that float contains.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
TYPST = os.path.join(ROOT, "typst")
EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)
CAP = re.compile(r"caption: \[(.{0,140})")
WORDS = re.compile(r"[A-Za-z]{4,}")
FLOAT = re.compile(r"\\begin\{figure\*?\}(.*?)\\end\{figure\*?\}", re.S)


def words(text):
    got = [w.lower() for w in WORDS.findall(text)]
    return [w for w in got if w not in ("figure", "caption", "table")]


for stem in sorted(os.listdir(TYPST)):
    path = os.path.join(TYPST, stem, "main.typ")
    if not os.path.isfile(path):
        continue
    typ = open(path, encoding="utf-8", errors="replace").read()
    marks = list(EMPTY.finditer(typ))
    if not marks:
        continue
    flat = os.path.join(FLAT, stem + ".tex")
    if not os.path.isfile(flat):
        for other in os.listdir(FLAT):
            if other.startswith(stem[:40]) and other.endswith(".tex"):
                flat = os.path.join(FLAT, other)
                break
    src = open(flat, encoding="utf-8", errors="replace").read() if os.path.isfile(flat) else ""
    floats = [(FLOAT.finditer(src), )]
    regions = list(FLOAT.finditer(src))
    print("=== %-44s %d empty, %d source figure floats" % (stem[:44], len(marks), len(regions)))
    for m in marks:
        cap = CAP.search(typ[m.start():m.start() + 1200])
        text = cap.group(1) if cap else ""
        want = set(words(text)[:8])
        best, best_score = None, 0
        for region in regions:
            have = set(words(region.group(1))[:14])
            score = len(want & have)
            if score > best_score:
                best, best_score = region, score
        if best is None or best_score < 3:
            print("   %-52s | NO SOURCE FLOAT MATCHED (%d common words)"
                  % (text[:52].replace("\n", " "), best_score))
            continue
        body = best.group(1)
        kinds = sorted(set(re.findall(r"\\begin\{([A-Za-z*]+)\}", body)))
        graphic = re.findall(r"\\includegraphics(?:\[[^\]]*\])?\{([^{}]*)\}", body)
        print("   %-52s | matched %d words | envs=%s | graphics=%s"
              % (text[:52].replace("\n", " "), best_score, kinds, graphic or "none"))
