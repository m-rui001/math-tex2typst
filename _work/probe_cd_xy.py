"""Every Xy-pic CD diagram in the corpus, so the arrow notation is known by sight.

CD writes its arrows as @>{label}>> rather than tikzcd's \\arrow[r,"label"], and the
shape of the syntax decides how much of it can be laid out on the same grid.

Run: python _work/probe_cd_xy.py [max]
"""
import pathlib
import re
import sys

FLAT = pathlib.Path(__file__).resolve().parents[1] / "_work" / "flat"
CD = re.compile(r"\\begin\{CD\}(.*?)\\end\{CD\}", re.S)
ARROW = re.compile(r"@[^ &\\]{0,8}")

limit = int(sys.argv[1]) if len(sys.argv) > 1 else 14
shown = 0
tokens = {}
total = 0
for path in sorted(FLAT.glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in CD.finditer(text):
        total += 1
        for tok in ARROW.findall(m.group(1)):
            tokens[tok] = tokens.get(tok, 0) + 1
        if shown < limit:
            shown += 1
            print("== %s" % path.stem[:52])
            print(m.group(1).strip()[:420])
print("\nCD environments=%d ; arrow tokens:" % total)
for tok, count in sorted(tokens.items(), key=lambda kv: -kv[1])[:20]:
    print("  %-16s %d" % (tok, count))
