r"""Run the new tests inside the real suite.

tests.py holds the methods exactly as they are to be appended to tools/test_t2t.py, so the check has
to splice them into the class rather than import them: the file is not valid Python on its own.
"""
import os
import re
import subprocess
import sys
import unittest

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")
suite = open(os.path.join(SB, "test_t2t.py"), encoding="utf-8").read()
new = open(os.path.join(SB, "tests.py"), encoding="utf-8").read()
body = new.split('"""')[2] if new.count('"""') >= 2 else new
# tests.py says so: the suite imports two names out of t2t.convert but not the module itself
suite = suite.replace("from t2t import prep\n", "from t2t import convert, prep\n")
patched = suite.replace("\nif __name__ == '__main__':", "\n" + body + "\nif __name__ == '__main__':")
path = os.path.join(SB, "_run_tests.py")
open(path, "w", encoding="utf-8", newline="\n").write(patched)

sys.path.insert(0, SB)
loader = unittest.TestLoader()
ns = {"__file__": path, "__name__": "_spliced_suite__"}
exec(compile(patched, path, "exec"), ns)
cases = [k for k in dir(ns["ConversionTests"]) if k.startswith("test_") and k in body]
print("methods lifted:", len(re.findall(r"^    def test_", body, re.M)))
suite_obj = unittest.TestSuite(ns["ConversionTests"](k) for k in cases)
res = unittest.TextTestRunner(verbosity=2).run(suite_obj)
print("ran %d failures %d errors %d" % (res.testsRun, len(res.failures), len(res.errors)))
