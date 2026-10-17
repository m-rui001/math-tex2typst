"""Run the seeded suite with a ROOT that resolves.

`t2t/convert.py` computes ROOT as three dirnames above itself and reads ROOT/_work/manifest.json,
which only holds inside a real repository clone. Mirroring the package under this sandbox's own
`tools/` makes that arithmetic land on the sandbox instead of on `E:/math/_work/_work`.
"""
import os
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
TOOLS = os.path.join(HERE, "tools")
WORK = os.path.join(HERE, "_work")

shutil.rmtree(TOOLS, ignore_errors=True)
os.makedirs(TOOLS)
os.makedirs(WORK, exist_ok=True)
shutil.copytree(os.path.join(HERE, "t2t"), os.path.join(TOOLS, "t2t"),
                ignore=shutil.ignore_patterns("__pycache__"))
shutil.copy(os.path.join(HERE, "test_t2t.py"), os.path.join(TOOLS, "test_t2t.py"))
target = os.path.join(WORK, "manifest.json")
if not os.path.exists(target):
    shutil.copy(os.path.join(REPO, "_work", "manifest.json"), target)

sys.exit(subprocess.call([sys.executable, os.path.join(TOOLS, "test_t2t.py")], cwd=HERE))
