r"""How wide and how tall is a real tikzcd cell, for the cells this corpus actually writes?

`cd_columns` places columns by `max(colsep, (cd_width[a] + cd_width[b])/2 + 0.9)` and rows by a fixed
pitch, where `cd_width` is `0.55 + 0.17 * chars` -- a hand-sized estimate whose char count comes from
a regex that strips commands and therefore counts pandoc's spaces as glyphs (`_work/community.md`
§7).  `_work/probe90_cd_sep_law.py` says the language separates columns by `sep + (box[a] + box[b])/2`
-- an edge-to-edge gap -- so that estimate has to become a real box width before the sep law can go
in: at 11pt a ten-letter math-italic cell inks 82.4pt while the model says 0.55+1.7 = 2.25cm = 64pt,
and a single letter inks 7pt while the model says 0.72cm = 20pt.

Reads every line of every cell of every exchange diagram in `_work/flat`, split the way `build_cd`
splits it after the batch's own macro expansion (same helpers, so the strings are the ones the
emitter sees and the ones a real page can set), puts each one in a row of a `tabular` behind a `R###`
marker, and measures the ink box of the words to the right of that marker on that baseline -- `$cell$`
is an hbox of maths, which is how a pgf matrix cell is set.  Then fits ink width against the model's
own char count and prints the error distribution of the model against the ink, plus the pitch of a
`gathered` cell's two lines -- the number `CD_LINE_CM` claims.

  python _work/probe91_cd_cell_box.py            # fits + outliers
  python _work/probe91_cd_cell_box.py dump       # write _work/label91_cd_cells.json
"""
import glob
import io
import json
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TMP = os.path.join(WORK, "_m91")
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, prep  # noqa: E402

BATCH = 20
DOC = ("\\documentclass[%s,border=6pt]{standalone}\n\\usepackage{amsmath}\n\\usepackage{tikz-cd}\n"
       "\\begin{document}\n%s\n\\end{document}\n")
PT_CM = 28.3465
# a cell whose text would not survive being written into a document of our own: `%` comments the rest
# of the line out, `#` is a macro parameter, `$` would close the maths we wrap the cell in, and a raw
# `\\` -- a matrix's own row break inside the cell -- would end the measuring table's row instead
RISKY = re.compile(r"[%#$]|\\\\|\\item")


BAND = 13.0  # pt above and below the marker's own line that still counts as the cell's ink
STRETCH = 3.0  # row pitch multiplier: keeps the band above from reaching the row before it


def cell_lines(src, macros):
    r"""Every cell line of every exchange diagram, as `cd_width` sees it.

    The picture goes through the batch's own macro expansion first: cells carry the paper's control
    sequences (`\cts`, `\hthreects`), and a synthetic page that does not define them is a page with
    nothing on it.

    A stacked cell is measured line by line, because that is what `cd_width` takes its maximum over.
    """
    out = []
    for m in cetz.PICTURE_ENV.finditer(src):
        pic = prep.expand_macros(m.group(0), macros)
        env = cetz.CD_ENV.search(pic)
        if not env:
            continue
        body = cetz.cd_protect_stacks(cetz.xy_to_tikzcd(pic) or pic)
        body = cetz.CD_ENV.search(body).group(2)
        for line in cetz.LINEBREAK.split(body):
            for cell in cetz.split_top(line, "&"):
                text = cetz.CD_STACK_ENV.sub(" ", cetz.CD_ARROW.sub(" ", cell)).strip()
                for part in cetz.cd_lines(text):
                    if part:
                        out.append(part)
    return out


def chars_of(text):
    """The char count `cd_width` pays 0.17cm for."""
    body = re.sub(r"\\[a-zA-Z@]+\*?", " ", text)
    return len(re.sub(r"[{}\\$]", "", body).strip())


def run(name, cls, body):
    os.makedirs(TMP, exist_ok=True)
    tex = os.path.join(TMP, name + ".tex")
    open(tex, "w", encoding="utf-8").write(DOC % (cls, body))
    proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP, tex],
                          capture_output=True, cwd=TMP, text=True, errors="replace")
    if re.search(r"^! ", proc.stdout, re.M):
        return None
    pdf = os.path.join(TMP, name + ".pdf")
    return pdf if os.path.exists(pdf) else None


def words_of(pdf):
    doc = fitz.open(pdf)
    got = doc[0].get_text("words")
    doc.close()
    return got


def measure_batch(cls, items, tag):
    """Ink box (w, h) per cell line.

    One page, one table row per cell: `$cell$` is an hbox of math, which is exactly how a pgf matrix
    cell is set, and a `R###` marker in the left column fixes the row's baseline so the cell's own
    words are the ones to its right on that line.  One cell that will not compile (a macro the paper
    defines and we do not) would take its whole batch down with it, so `measure_items` halves.

    The band around the marker is `BAND` pt on each side, not the marker's own box, and `STRETCH`
    opens the rows to match: superscripts, `\Gamma` and an accent reach far above a word's own box,
    and the first cut of this gauge read them as the next row's ink and lost them -- a cell of 26
    chars came out 8.5pt wide.  A stretched row keeps a band that wide from touching its neighbour.
    """
    rows = ["R%03d & $%s$ \\\\" % (i, text) for i, text in enumerate(items)]
    pdf = run("cells-%s-%s" % (cls[:2], tag), cls,
              "\\renewcommand{\\arraystretch}{%s}\n"
              "\\begin{tabular}{@{}l@{\\hspace{8pt}}l@{}}\n%s\n\\end{tabular}"
              % (STRETCH, "\n".join(rows)))
    if not pdf:
        return None
    doc = fitz.open(pdf)
    # `standalone` splits a tabular taller than its own page limit, and this gauge reads page one
    pages = doc.page_count
    words = doc[0].get_text("words")
    doc.close()
    if pages > 1:
        return None
    marks = {}
    for x0, y0, x1, y1, text, *_ in words:
        m = re.fullmatch(r"R(\d\d\d)", text)
        if m:
            marks[int(m.group(1))] = (y0, y1, x1)
    out = [None] * len(items)
    for i, (y0, y1, mark_x1) in marks.items():
        mid = (y0 + y1) / 2
        sel = [w for w in words if w[0] > mark_x1 and abs((w[1] + w[3]) / 2 - mid) <= BAND]
        if not sel:
            continue
        box = fitz.Rect(min(w[0] for w in sel), min(w[1] for w in sel),
                        max(w[2] for w in sel), max(w[3] for w in sel))
        out[i] = (round(box.width, 2), round(box.height, 2))
    return out


def measure_items(cls, items, tag, depth=0):
    """`measure_batch`, halving the batch while the page refuses to compile."""
    got = measure_batch(cls, items, tag)
    if got is not None:
        return got
    if len(items) == 1:
        return [None]
    half = len(items) // 2
    left = measure_items(cls, items[:half], "%sa" % tag, depth + 1)
    right = measure_items(cls, items[half:], "%sb" % tag, depth + 1)
    return left + right


def line_pitch(cls):
    """The baseline pitch of a `gathered` cell's own lines, in pt: what `CD_LINE_CM` claims."""
    pdf = run("pitch-%s" % cls[:2], cls,
              "\\begin{tikzcd} \\begin{gathered} aaaa \\\\ bbbb \\end{gathered} \\end{tikzcd}")
    if not pdf:
        return None
    tops = sorted(round(w[1], 1) for w in words_of(pdf) if re.search(r"[ab]{4}", w[4]))
    if len(tops) < 2:
        return None
    return round(tops[1] - tops[0], 2)


def main():
    byclass = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        src = open(path, encoding="utf-8", errors="replace").read()
        if not cetz.CD_ENV.search(src):
            continue
        pre_text = src[:src.index("\\begin{document}")] if "\\begin{document}" in src else src
        p = prep.parse_preamble(pre_text)
        head = pre_text
        m = re.search(r"\\documentclass\[([^\]]*)\]", head)
        cls = "10pt"
        if m:
            s = re.search(r"\b(10|11|12)pt\b", m.group(1))
            cls = s.group(1) + "pt" if s else "10pt"
        for text in cell_lines(src, p.macros):
            table = byclass.setdefault(cls, {})
            if RISKY.search(text):
                table.setdefault("~skipped", [0, 0])
                table["~skipped"][0] += 1
                continue
            table[text] = table.get(text, 0) + 1
    skipped = sum(v["~skipped"][0] for v in byclass.values() if "~skipped" in v)
    print("distinct cell lines per class: %s   (%d uses skipped as `%%%%`/`#`/env text)"
          % (", ".join("%s %d" % (c, len([k for k in v if k != "~skipped"]))
                       for c, v in sorted(byclass.items())), skipped))
    print("CD_LINE_CM says %.2fcm = %.1fpt; the page says %s"
          % (cetz.CD_LINE_CM, cetz.CD_LINE_CM * PT_CM,
             ", ".join("%s %s" % (cls, line_pitch(cls)) for cls in sorted(byclass))))
    records = []
    for cls, table in sorted(byclass.items()):
        items = sorted(k for k in table if k != "~skipped")
        for b in range(0, len(items), BATCH):
            got = measure_items(cls, items[b:b + BATCH], "%02d" % (b // BATCH))
            if all(x is None for x in got):
                print("  %s batch %d: pdflatex produced nothing" % (cls, b // BATCH))
                continue
            for text, box in zip(items[b:b + BATCH], got):
                if not box:
                    continue
                records.append({"cls": cls, "text": text, "chars": chars_of(text),
                                "model_cm": round(cetz.cd_width(text), 3),
                                "ink_w_pt": box[0], "ink_h_pt": box[1], "count": table[text]})
    print("\nmeasured %d distinct cell lines (%d uses)" % (len(records), sum(
        r["count"] for r in records)))
    fit(records)
    if "dump" in sys.argv[1:]:
        name = os.path.join(WORK, "label91_cd_cells.json")
        json.dump(records, open(name, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        print("\nwrote %s" % name)
    return 0


def lsq(pairs):
    n = len(pairs)
    if n < 2:
        return (0.0, 0.0, 0.0)
    sx = sum(x for x, _ in pairs)
    sy = sum(y for _, y in pairs)
    sxx = sum(x * x for x, _ in pairs)
    sxy = sum(x * y for x, y in pairs)
    den = n * sxx - sx * sx
    b = (n * sxy - sx * sy) / den if den else 0.0
    a = (sy - b * sx) / n
    rms = (sum((y - (a + b * x)) ** 2 for x, y in pairs) / n) ** 0.5
    return (a, b, rms)


def fit(records):
    print("\n%-6s %6s %9s %11s %8s   %s"
          % ("cls", "cells", "a (pt)", "b (pt/char)", "rms", "model minus ink, cm"))
    for cls in sorted({r["cls"] for r in records}):
        rows = [r for r in records if r["cls"] == cls]
        a, b, rms = lsq([(r["chars"], r["ink_w_pt"]) for r in rows])
        err = sorted(r["model_cm"] - r["ink_w_pt"] / PT_CM for r in rows)
        print("%-6s %6d %9.2f %11.3f %8.2f   p10 %+.2f  median %+.2f  p90 %+.2f"
              % (cls, len(rows), a, b, rms,
                 err[len(err) // 10], err[len(err) // 2], err[-max(1, len(err) // 10)]))
        print("       current model 15.59pt + 4.82pt/char; heights: median %.2f pt, p90 %.2f pt"
              % (median([r["ink_h_pt"] for r in rows]),
                 sorted(r["ink_h_pt"] for r in rows)[-max(1, len(rows) // 10)]))
    print("\nwidest cells in the corpus (ink pt / model cm / chars / uses):")
    for r in sorted(records, key=lambda r: -r["ink_w_pt"])[:14]:
        print("  %6.1f  %5.2fcm %3d  %-46r x%d"
              % (r["ink_w_pt"], r["model_cm"], r["chars"], r["text"][:44], r["count"]))
    print("\nnarrowest:")
    for r in sorted(records, key=lambda r: r["ink_w_pt"])[:6]:
        print("  %6.1f  %5.2fcm %3d  %-46r x%d"
              % (r["ink_w_pt"], r["model_cm"], r["chars"], r["text"][:44], r["count"]))


def median(values):
    values = sorted(values)
    return values[len(values) // 2] if values else 0.0


if __name__ == "__main__":
    sys.exit(main())
