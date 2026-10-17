r"""#78: does a `text width=.84\textwidth` still reach the page without a `width:`?

The §7 row files 23 sites / 9 papers as unreadable, on the strength of `_work/probe_width_units.py`,
which feeds `cetz._length` the **raw** value.  That is not the value the converter sees: the batch
runs `cetz.expand_linewidth(strip_envelope(pic), convert.line_cm(p))` over the whole picture before
the emitter is called, and that fold turns `.84\textwidth` into a number of cm (`cetz.PAGE_SHARE`).
Feeding a reader the input of a stage above it is the static-basis error this project has now
committed four times, so this probe measures the same question twice, on both bases, and prints the
difference:

* **raw**   -- `_length` on the source spelling (yesterday's gauge),
* **batch** -- the picture after the real pre-passes, with `emit_node` wrapped to record the width
  every framed node was actually handed.

A site that reads on the batch basis is not a defect; it is a gauge that never ran the code.
"""
import io
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")

KEY = re.compile(r"(text width|minimum width|minimum size|inner sep)\s*=\s*"
                 r"([^,;\]\[]*?\\(?:linewidth|textwidth|columnwidth)[^,;\]\[]*)")


def raw_census():
    """The page-share spellings as the source writes them, and whether `_length` reads each."""
    out = []
    for path in sorted(os.listdir(FLAT)):
        if not path.endswith(".tex"):
            continue
        text = open(os.path.join(FLAT, path), encoding="utf-8", errors="replace").read()
        for pic in re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S):
            for key, val in KEY.findall(pic):
                val = val.strip()
                out.append((path[:-4], key, val, cetz._length(val, cetz.IDENT) is not None))
    return out


def batch_census():
    """Run the batch's own pre-passes, then fold: what does the same spelling become?"""
    out = []
    for path in sorted(os.listdir(FLAT)):
        if not path.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, path), encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        pics = convert.lifted_pictures(body)
        if not pics:
            continue
        scopes = convert.picture_scopes(body, p.macros)
        axis = convert.line_cm(p)
        for k, m in enumerate(pics):
            table, decls = scopes[k]
            pic = convert.with_declarations(m.group(0), decls) if decls else m.group(0)
            core = cetz.expand_linewidth(cetz.strip_envelope(
                prep.expand_macros(pic, table)), axis)
            out.append((path[:-4], axis,
                        len(cetz.PAGE_SHARE.findall(m.group(0))),
                        len(cetz.PAGE_SHARE.findall(core))))
    return out


def emitter_face():
    """Every framed node the batch actually emits, with the width it was handed."""
    live = cetz.emit_node
    rows = []

    def spy(at, inner, o, *a, **kw):
        out = live(at, inner, o, *a, **kw)
        text = "\n".join(out or [])
        if "#box(" in text:
            rows.append((dict(o), kw.get("width", a[3] if len(a) > 3 else None),
                         "width:" in text))
        return out

    cetz.emit_node = spy
    try:
        for path in sorted(os.listdir(FLAT)):
            if not path.endswith(".tex"):
                continue
            src = open(os.path.join(FLAT, path), encoding="utf-8", errors="replace").read()
            pre_text, body = prep.split_document(src)
            p = prep.parse_preamble(pre_text)
            body = prep.scale_linewidth_in_minipages(body)
            body = prep.unwrap_boxes(body)
            pics = convert.lifted_pictures(body)
            if not pics:
                continue
            scopes = convert.picture_scopes(body, p.macros)
            axis = convert.line_cm(p)
            for k, m in enumerate(pics):
                table, decls = scopes[k]
                pic = convert.with_declarations(m.group(0), decls) if decls else m.group(0)
                core = cetz.expand_linewidth(cetz.strip_envelope(
                    prep.expand_macros(pic, table)), axis)
                cetz.build(core, p.colors) or cetz.build_cd(core)
    finally:
        cetz.emit_node = live
    return rows


def main():
    raw = raw_census()
    print("== source spellings carrying a page-share macro: %d over %d papers"
          % (len(raw), len({r[0] for r in raw})))
    print("   read by `cetz._length` on the RAW value : %d" % sum(1 for r in raw if r[3]))
    print("   refused by `_length` on the RAW value   : %d" % sum(1 for r in raw if not r[3]))
    by = Counter("%s = %s" % (r[1], r[2]) for r in raw if not r[3])
    for shape, n in by.most_common(8):
        print("     %3d  %s" % (n, shape))

    bat = batch_census()
    sites = sum(r[2] for r in bat)
    left = sum(r[3] for r in bat)
    print("== after the batch's own `expand_linewidth` + `line_cm` fold")
    print("   page-share sites in the lifted pictures : %d over %d canvases / %d papers"
          % (sites, sum(1 for r in bat if r[2]), len({r[0] for r in bat if r[2]})))
    print("   sites that still carry a macro after it: %d" % left)
    for r in [x for x in bat if x[3]][:8]:
        print("     %s axis=%.3fcm  %d before -> %d after" % (r[0][:44], r[1], r[2], r[3]))

    rows = emitter_face()
    named = [r for r in rows if any(k in r[0] for k in
                                    ("text width", "minimum width", "minimum size"))]
    bad = [r for r in named if not r[2]]
    print("== framed nodes emitted on the batch basis: %d, of which a measure is named: %d"
          % (len(rows), len(named)))
    print("   BUG (measure named, no `width:` emitted): %d" % len(bad))
    for o, w, drawn in bad[:6]:
        print("     width=%s %s" % (w, {k: v for k, v in o.items()
                                        if k in ("text width", "minimum width", "minimum size",
                                                 "inner sep", "align")}))


if __name__ == "__main__":
    main()
