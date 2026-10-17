r"""Close the gap between the census (1,207 `box_args` calls with a declared `inner sep`) and the stub
diff (1,204 changed lines over 279 canvases).

`box_args` is called from two places in `emit_node`: the two-line-range path (cetz.py:2164, where a
range the code cannot re-measure makes the call's result a discard) and the Typst `#box(` path (2189).
The range path that survives emits `content(range, ..., frame: "rect")` and spends NO `inset:` -- the
author's own `minimum width/height` already carries `inner sep` into the range (`node_frame_width`), so
a call there is a call whose value never reaches the page.

This replays every building picture once, counts the calls and the `inset:` occurrences the built canvas
actually carries, and prints the canvases where they differ -- with the statement shapes that explain
them (`frame: "rect"` lines).
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
current = [None]
CALLS = {}
LIVE = cetz.box_args


def wrap(o, pal):
    got = o.get("inner sep")
    if got is not None and cetz._length(str(got), cetz.IDENT) is not None:
        CALLS[current[0]] = CALLS.get(current[0], 0) + 1
    return LIVE(o, pal)


cetz.box_args = wrap
rows = []
total_calls = total_spent = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(src)):
        key = (path.stem, n)
        current[0] = key
        built = cetz.build(pic)
        if built is None:
            continue
        spent = len(re.findall(r"inset: (?!0\.3333em)", built))
        called = CALLS.get(key, 0)
        total_calls += called
        total_spent += spent
        if called != spent:
            rows.append((key, called, spent, built.count('frame: "rect"'),
                         built.count("#box(")))
cetz.box_args = LIVE

print("declared-sep calls %d   `inset:` lines that are not the default %d"
      % (total_calls, total_spent))
print("canvases where they differ: %d" % len(rows))
for (stem, n), called, spent, rects, boxes in rows[:15]:
    print("   %-44s pic%-3d calls=%d inset=%d  range-frames=%d #box(=%d"
          % (stem[:44], n, called, spent, rects, boxes))
print("surplus over those canvases: %d calls, %d short"
      % (sum(c - s for _k, c, s, _r, _b in rows), sum(s - c for _k, c, s, _r, _b in rows)))
