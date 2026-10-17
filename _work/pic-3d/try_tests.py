r"""Append tests.py inside `class ConversionTests` of the sandbox suite and report the run.

The delivered tests are methods, so they go before the `if __name__` tail rather than at the end of
the file, where the suite's own pre-existing failure already sits.

Usage: python _work/pic-3d/try_tests.py
"""
import io
import os
import subprocess
import sys

ROOT = r"E:\math\_work\pic-3d"
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

suite = open(os.path.join(ROOT, "test_t2t.py"), encoding="utf-8").read()
new = open(os.path.join(ROOT, "tests.py"), encoding="utf-8").read()
marker = "\n\nif __name__ == '__main__':"
i = suite.index(marker)
merged = suite[:i] + "\n\n" + new + suite[i:]
path = os.path.join(ROOT, "test_t2t_with_new.py")
open(path, "w", encoding="utf-8").write(merged)
print(subprocess.run([sys.executable, path], capture_output=True, text=True,
                     encoding="utf-8", errors="replace").stderr[-2500:])
