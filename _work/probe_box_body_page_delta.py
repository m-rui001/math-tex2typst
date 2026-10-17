r"""Does #63 itself move ink past a frame? Build the same papers by the old law and the new one.

`_work/overflow_before.json` is a #61-era snapshot, and between then and now the papers went through
#62 (which started passing `anchor:` at all) and the table rounds -- so a delta against it cannot be
attributed to #63.  Here the same three sources are converted twice, once with `_box_body` monkeypatched
back to the pre-fix spelling and once with the shipped one, each into its own scratch tree, and the
(box, ink line) escape census `_work/probe_frame_ink_overflow.py` uses is run over both trees.  Any
difference left is the fix's own.

Usage:  python _work/probe_box_body_page_delta.py <stem> [<stem> ...]
"""
import json
import os
import pathlib
import shutil
import sys

import fitz

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.path.insert(0, str(ROOT / "_work"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402
from t2t.convert import convert_paper  # noqa: E402
from probe_frame_ink_overflow import pairs  # noqa: E402

NEW_BODY = cetz._box_body


def old_box_body(text, align, horizon=False):
    if horizon:
        inner = "#align(%s + horizon)[%s]" % (align or "left", text)
        return "[#set text(hyphenate: false); %s]" % inner
    inner = "#align(%s)[%s]" % (align, text) if align else text
    return "[#set text(hyphenate: false); %s]" % inner


def build(stem, tag):
    # a stem may be a prefix of the paper's directory, whose full name no one types from memory
    src = sorted(pathlib.Path.glob(ROOT / "_work" / "flat", stem + "*.tex"))
    if len(src) != 1:
        raise SystemExit("flat source for %r: %s" % (stem, [str(s.name) for s in src]))
    stem = src[0].stem
    cetz._box_body = old_box_body if tag == "old" else NEW_BODY
    out = ROOT / "_work" / "_ba" / tag / stem
    shutil.rmtree(out, ignore_errors=True)
    out.mkdir(parents=True, exist_ok=True)
    report = convert_paper(str(src[0]), str(out), stem)
    (out / "report.json").write_text(json.dumps(report, ensure_ascii=False), encoding="utf-8")
    cetz._box_body = NEW_BODY
    return out / "main.pdf", stem


def census(pdf):
    if not pdf.exists():
        return None
    doc = fitz.open(str(pdf))
    total, hits = 0, []
    for i, page in enumerate(doc):
        for over, r, band, text in pairs(page):
            total += 1
            hits.append((i + 1, round(over, 2), round(r.y0, 2), round(r.y1, 2), text[:30]))
    doc.close()
    return total, hits


def main():
    if len(sys.argv) < 2:
        print("give at least one stem")
        return
    for prefix in sys.argv[1:]:
        old_pdf, stem = build(prefix, "old")
        new_pdf, _ = build(prefix, "new")
        old, new = census(old_pdf), census(new_pdf)
        print("== %s" % stem[:60])
        if old is None or new is None:
            print("   old %s / new %s" % (old and old[0], new and new[0]))
            continue
        print("   escapes old %d -> new %d" % (old[0], new[0]))
        before = {h[4] for h in old[1]}
        after = {h[4] for h in new[1]}
        for h in new[1]:
            if h[4] not in before:
                print("   + p%-3d over %5.2f box y[%.2f %.2f] %r" % h)
        for h in old[1]:
            if h[4] not in after:
                print("   - p%-3d over %5.2f box y[%.2f %.2f] %r" % h)


if __name__ == "__main__":
    main()
