"""Every environment a caption sits in that `lift_captions` does not already know as a float.

`lift_captions` recognises only `figure`/`table`; a caption anywhere else is lifted into a stand-in
float, leaving the drawing behind. This lists each such environment across the corpus, with how many
captions it holds and whether its labels look like a table (`tab:`) or a figure, so the fix can be
scoped to the environments that really are floats.
"""
import io
import pathlib
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

NEWENV = re.compile(r"\\newenvironment\{([A-Za-z][A-Za-z0-9]*)\}")
BEGIN = re.compile(r"\\begin\{([A-Za-z*]+)\}")
KNOWN = {"figure", "figure*", "table", "table*"}


def env_stack_at(text, at):
    stack = []
    for m in BEGIN.finditer(text, 0, at):
        name = m.group(1)
        end = re.compile(r"\\end\{%s\*?\}" % re.escape(name)).search(text, m.end())
        if end and end.start() > at:
            stack.append(name)
    return stack


envs = Counter()
papers = {}
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    custom = set(NEWENV.findall(text))
    for m in re.finditer(r"\\caption\b", text):
        stack = env_stack_at(text, m.start())
        env = stack[-1] if stack else None
        if env is None or env in KNOWN:
            continue
        tail = text[m.start():m.start() + 120]
        label = re.search(r"\\label\{([^}]*)\}", tail)
        kind = "tab" if label and label.group(1).startswith("tab") else "fig"
        key = (env, "custom" if env in custom else "std")
        envs[key] += 1
        papers.setdefault(key, set()).add(path.stem[:40])

for (env, tag), n in envs.most_common():
    print("%-24s %-7s %3d  %s" % (env, tag, n, sorted(papers[(env, tag)])[0]))
