r"""Append tests.py inside the sandbox suite's class and run the whole thing.

The deliverable is `tests.py` (method bodies at class indentation); this writes the merged copy into
this sandbox only, so the suite runs with the new checks in place, exactly as the orchestrator will
after applying them to `tools/test_t2t.py`.

Run: python _work/pic-plot/run_merged.py
"""
from pathlib import Path

HERE = Path(__file__).resolve().parent
suite = (HERE / "test_t2t.py").read_text(encoding="utf-8")
tests = (HERE / "tests.py").read_text(encoding="utf-8")
start = tests.index("\ndef _canvas_calls")
end = tests.index('\nif __name__ == "__main__":')
# tests.py holds its defs unindented so the file runs on its own; in the suite they sit in the class
lines = tests[start:end].splitlines()
body = "\n".join(("    " + line if line.strip() else line) for line in lines[1:])
anchor = "\n\nif __name__ == '__main__':"
assert anchor in suite, "the suite no longer ends with its unittest.main guard"
merged = suite.replace(anchor, "\n" + body.rstrip() + "\n" + anchor)
(HERE / "test_merged.py").write_text(merged, encoding="utf-8")
print("appended %d test methods" % body.count("\n    def test_"))
raise SystemExit(__import__("subprocess").run(
    ["python", str(HERE / "test_merged.py")]).returncode)
