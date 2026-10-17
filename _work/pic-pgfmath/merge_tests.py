r"""Build the runnable suite: the seeded test_t2t.py plus this family's new tests.

`tests.py` is the deliverable fragment (methods to append inside `class ConversionTests`), so the
merge is mechanical: its module docstring off, the suite's `import re` on, and the methods dropped in
ahead of the `unittest.main()` tail.

Usage: python merge_tests.py
"""
import io
import re

SANDBOX = r"E:\math\_work\pic-pgfmath"
suite = io.open(SANDBOX + r"\test_t2t.py", encoding="utf-8").read()
fragment = io.open(SANDBOX + r"\tests.py", encoding="utf-8").read()

fragment = re.sub(r'\A\s*r""".*?"""\s*\n', "", fragment, flags=re.S)
assert "def test_" in fragment
if "import re" not in suite.split("class ConversionTests")[0]:
    suite = suite.replace("import json", "import json\nimport re", 1)
tail = "if __name__ == '__main__':"
head, _, last = suite.partition(tail)
merged = head + fragment.rstrip() + "\n\n" + tail + last
io.open(SANDBOX + r"\test_t2t_with_new.py", "w", encoding="utf-8", newline="\n").write(merged)
print("tests in fragment:", fragment.count("def test_"),
      "| suite:", merged.count("def test_"), "| import re at module level:",
      "import re" in merged.split("class ConversionTests")[0])
