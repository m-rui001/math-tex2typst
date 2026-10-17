# Brief: convert the refused TikZ pictures to CeTz (parallel writers)

Read this whole file before touching anything. It is the standing contract for every
agent working on this task; your dispatch prompt only adds which family you own.

## The objective

`tools/t2t/` turns 724 flat LaTeX papers (`_work/flat/<paper>.tex`) into Typst
(`typst/<paper>/main.typ`, `main.pdf`, `report.json`). TikZ pictures are redrawn as CeTz
canvas drawings by `tools/t2t/cetz.py`. When a picture cannot be modelled, the emitter falls
back to quoting its LaTeX verbatim: `#raw(block: true, lang: "latex", "...")`.

16 pictures in 16 papers are still refused. Your job is to make the family you own convert,
with geometry measured from real TeX, not guessed.

## Hard rules

1. **Never write to `tools/`, `_work/flat/`, or `typst/` from this task.** Other agents and a
   batch are live there. Work only inside your own `_work/<your-name>/` directory (below).
2. **Never run `tools/batch_typst.py`, and never invoke the `typst` binary.** A batch owns that
   queue. Static tools are safe: `pandoc`, `pdflatex`/`xelatex`, `fitz`/PyMuPDF, Python.
3. **TikZ/TeX semantics are measured with pdflatex (TeXLive 2025 is installed)**, never inferred
   from intuition. Build a control case that differs in exactly one feature and read the real
   coordinates (e.g. `\path ... node at (...)` measured by dumping `pgf` coordinate macros, or
   `pdftoppm`/`fitz` on the compiled control PDF).
4. **Refuse rather than draw something unmeasured.** No approximate ellipses, no invented spline.
5. One path only: no compatibility shims, no parallel implementations of a routine that already
   exists, no dead fields, no half-finished features. Extend the existing function; do not add a
   second way to do the same job.
6. Paper directory names must be resolved by glob/`startswith` against `_work/flat/` — never from
   memory; the names are truncated and carry a date suffix you cannot recall.
7. Any code containing backslashes must be created with the Write/Edit tools as Python raw
   strings. Never `python -c`, heredoc, or `printf` — bash eats the backslashes.
8. Comments explain WHY (a measured constraint, a trap), never WHAT the line does.

## Isolation protocol

Set up your sandbox once:

```
mkdir -p _work/<your-name>
cp -r tools/t2t _work/<your-name>/t2t
cp tools/test_t2t.py _work/<your-name>/test_t2t.py
```

In every driver script you write, import your copy, not the live tree:

```python
import sys
sys.path.insert(0, "_work/<your-name>")   # beats the repo's tools/
from t2t import cetz, convert, prep
```

Run your copy of the suite the same way (`PYTHONPATH=_work/<your-name> python
_work/<your-name>/test_t2t.py`, or insert the path inside the file). The suite must stay green:
it is a single script of plain `def test_*` assertions, currently 47 passing.

When a picture needs the real production inputs, convert one paper like this:

```python
src = open(flat_path, encoding="utf-8").read()
pre_text, _ = prep.split_document(src)          # convert.py:236
p = prep.parse_preamble(pre_text)               # convert.py:237
cm = convert.line_cm(p)                          # convert.py:176, needs the preamble object
core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), cm)
```

## Finishing a partial sandbox (a previous writer was cut off mid-implementation)

Several sandboxes already contain that writer's edits to their copy of `t2t/`. If your dispatch
says a sandbox is yours to finish:

1. Diff the sandbox copy against the live tree first (`difflib.unified_diff` of `_work/<name>/t2t/X.py`
   against `tools/t2t/X.py`) and read the whole diff before writing anything. That diff IS the prior
   work; you are continuing it, not starting over.
2. Re-run the family's pictures through your sandbox converter and count canvases vs
   `#raw(block: true, lang: "latex")` before you change a line. That is the honest starting number.
3. Do not re-do measurements the prior writer already recorded (`measurements.md`, control `.tex`
   files, drivers left in the sandbox) unless you doubt them.
4. Turn budget is finite. Prefer one family fully converted, tested and patched over three half
   edited: a sandbox whose `t2t/` copy is mid-edit converts NOTHING.
5. Deliver the same output contract as above. The patch must be `difflib.unified_diff` against the
   live `tools/t2t/` file as you found it, so the orchestrator can apply it cleanly.

Write these files, then summarise them in your final message:

- `_work/<your-name>/cetz.patch` — a `difflib.unified_diff` patch of every file you changed,
  relative to the copies you were given (`--- a/t2t/cetz.py`, `+++ b/t2t/cetz.py`). Generate it
  with a script, not by hand. It must contain only your family's changes.
- `_work/<your-name>/tests.py` — the new `def test_*` functions to append to `tools/test_t2t.py`,
  each asserting the measured values (numbers from pdflatex), not your own output.
- `_work/<your-name>/measurements.md` — the control cases you compiled, the coordinates/lengths
  pdflatex reported, and the arithmetic from those numbers to what you emit.
- `_work/<your-name>/status.txt` — one line per picture you own: `converted` / `refused: <reason>`
  / `skipped: <reason>`, with the before/after `#raw(block: true, lang: "latex")` count for the
  papers you touched.

Do NOT apply your patch to `tools/`. The orchestrator applies patches one at a time and re-runs
the batch.

## Known landmarks in cetz.py (line numbers from 2026-10-10; the live file is moving)

- `expand_pgfmath` ~1029, `PGFMATH_DEF` ~1000, `expand_ifnum` ~1115, `IFNUM` ~1062
- `\foreach` unrolling ~1294 (`count=` pgfmath form ~908)
- ellipse/circle size spec ~1493, radius emission ~1519, the "an ellipse has no turned form"
  refusal ~1980-1988
- node sizing from `text width` / `minimum width` ~445-460, multi-line node text ~1214
- `plot_points` ~1788 (`plot[smooth]` spline refusal ~1794, `domain=`/`samples=` read ~1802)
- `to[out=,in=,looseness=]` ~1665, ~2083 (measured `0.39*L` at looseness 5, `_work/measure_looseness.py`)
- scope transform read ~2374-2382, `SCOPE` ~2290, statement/transform pairing ~2489
- `_work/refused_pic_detail.txt` — the full source of all 16 refused pictures with the stage name
  the converter stopped at, and `_work/probe_stages_run2.txt` — the corrected stage table.
