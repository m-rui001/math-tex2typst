"""Drop the orphaned test body and sweep the pipeline sources for stray control characters.

A patch script written with a non-raw Python string turns `\a`, `\b` and `\r` inside a comment into
BEL, backspace and CR before the file is written, so the damage is invisible on screen and cannot be
matched by an edit. Python code should contain none of ASCII 0-31 except tab and newline.
"""
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
t = (ROOT / "tools" / "test_t2t.py").read_text(encoding="utf-8")
orphan = re.compile(
    r'\n        self\.assertNotIn\(r"\\tag v1", unrolled\)\n'
    r"\n        # measured in _work/foreach_multi_probe\.pdf.*?"
    r'\n        self\.assertEqual\(cetz\._loop_values\("p/1/2,q/3", 2\), \[\("p", "1"\), \("q", "3"\)\]\)\n',
    re.S)
t, n = orphan.subn('\n        self.assertNotIn(r"\\tag v1", unrolled)\n', t)
print("orphaned bodies removed:", n)
(ROOT / "tools" / "test_t2t.py").write_text(t, encoding="utf-8", newline="")

for path in sorted((ROOT / "tools").rglob("*.py")):
    text = path.read_text(encoding="utf-8")
    bad = sorted({ord(c) for c in text if ord(c) < 32 and c not in "\t\n\r"})
    crlf_free_lf = text.count("\r")
    if bad or crlf_free_lf:
        print("%s: control chars %s ; CR %d" % (path.relative_to(ROOT), bad, crlf_free_lf))
print("sweep done")
