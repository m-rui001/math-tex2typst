# Fix: `_split_floats` mislabelled caption-first floats as material-first

## What was wrong

`python tools/test_t2t.py` ran 47 tests with one failure:
`test_a_caption_written_after_its_tabular_still_gets_a_float_of_its_own` (tools/test_t2t.py:833).

A float written with several `\caption`s is split into one float per caption by
`tools/t2t/prep.py::_split_floats`. Where the cut falls depends on the float's layout:

* **material-first** — a body block (tabular/picture) opens *above* each caption, so each caption
  names the block before it. The cut goes *after* the caption and its label chain.
* **caption-first** — the caption comes *before* its block, so the block trails the caption. The
  cut goes *at* the caption. A trailing caption with nothing after it then keeps its own float and
  is handed a stand-in body (`_split_floats` lines 305-313; for a table that stand-in is
  `\begin{tabular}{l}\mbox{}\end{tabular}` placed before the caption).

The branch selector read:

```python
if "\\begin{" in region[:caps[0].start()]:   # material-first?
```

`region` always begins with the float's own `\begin{table}` / `\begin{figure}`, so that slice
**always** contains `\begin{` and the condition was **always true**. Every caption-first float was
therefore routed down the material-first path. For the test input that cut right after
`\label{tab:a}` and *before* the `\begin{tabular}{cc} a&b \end{tabular}`, so the `a&b` body was
orphaned onto the wrong float: the "First block" float lost its tabular, and the "All fifteen
couplings" float received the real `a&b` body instead of the stand-in its (bodyless) caption
needed — the exact returned string in the failure.

The regression came from the 2026-10-10 21:09 edit, which added the material-first branch (and
`_caption_group`) but keyed its detection on a slice that includes the float's own opening tag.

## Which side was changed, and why

**The implementation, not the test.** The test's expectation is the real requirement: a float with
a caption but no body still gets a stand-in body of its kind, and a float *with* a tabular keeps
that tabular. The assertion was not weakened.

One-line correction in `prep.py` (the `if` above now excludes the float's own header):

```python
if "\\begin{" in region[head.end():caps[0].start()]:   # head = FLOAT_HEAD.match(region)
```

`head.end()` sits just past `\begin{table}`/`\begin{table*}`, so the slice now spans only what the
author put *between* the float opening and the first caption. A nested body there means
material-first; nothing there means caption-first (branch `else`, cut at the caption). No
compatibility shim, single path. After the fix the test input yields two floats: "First block"
keeps its `\begin{tabular}{cc} a&b \end{tabular}`; "All fifteen" gets
`\begin{tabular}{l}\mbox{}\end{tabular}` before its caption.

`tools/test_t2t.py` → **Ran 47 tests, OK (47/47 green)**.

## How the multi-label behaviour was confirmed to still work

`_caption_group` and its label-chain cut (`cuts = [labels[-1][1] ...]`) were left untouched; the
only change is the branch condition. Confirmed three ways (`_work/probe_split_floats.py`):

1. **Corpus-wide conservation harness** (`_work/check_split_floats.py`) gives the identical result
   before and after the fix: 13 papers touched, **0** change in float balance, no caption words
   lost; the real material-first Heisenberg `apptr` table still splits 1 -> 3 floats with all three
   labels (`apptr:entry-table`/`endpoint-table`/`coupling-table`) conserved and each split float
   carrying its own tabular. So genuine material-first multi-caption tables are unaffected.

2. **The dangling-`\ref` figure** — `fig:topology-compression` in the Positive-scalar paper — is a
   *single-caption* float carrying two `\label`s (`fig:topology-compression`, `packet:collar-figure`).
   `_split_floats` returns unchanged when `len(caps) < 2`, and that guard sits above the edited
   condition, so the fix cannot touch it: the probe isolates the exact figure and shows
   `prep.lift_captions` returns it byte-for-byte, both labels intact, one caption. Registering the
   second label is downstream in `emit.py::anchor_label` (a detached/second `\label` on an
   environment takes the counter LaTeX was on) — `emit.py` was not modified. So the 21:09
   multi-label work is preserved for both shapes (single-caption/two-label and
   multi-caption/label-chain).

3. **Synthetic material-first float with a two-label chain** under one caption: the "Upper" float
   keeps *both* `\label{tab:u1}` and `\label{tab:u2}` glued to its caption (the cut falls after the
   last label of the chain), keeps its own `1&2` tabular, and does not absorb the `3&4` body.

## Files

* `tools/t2t/prep.py` — corrected branch condition in `_split_floats` (line 290) + comment.
* `_work/probe_split_floats.py` — verification probe (four cases above).
* `_work/fix-split-floats.md` — this note.
