r"""#30's blast radius: which diagrams move when the label clears its own box?

The old law is one line -- `off = 0.45 * side` -- so the stub answers 0.45 for every label and the
diff against the live rule is exactly this round's change, on the same basis for both halves.
Written to the same seam the code now uses (`cetz.cd_label_off`) rather than to a copy of the
placement loop, because a stub that re-implements the loop measures the probe.

The list of papers whose canvas text differs is what goes to `_work/regen_needed.txt`; the count of
labels that still fail the crossing test after the move is `_work/probe30_cd_face.py`'s job, not
this one's.
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
CD_SRC = re.compile(r"\\begin\{(?:tikzcd|CD)\}.*?\\end\{(?:tikzcd|CD)\}", re.S)


def build_all(live_off):
    """{paper: [canvas, ...]} for every CD diagram, under whichever label rule is installed."""
    cetz.cd_label_off = live_off
    out = {}
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        for m in CD_SRC.finditer(src):
            core = cetz.strip_envelope(m.group(0))
            canvas = cetz.build(core) or cetz.build_cd(core)
            if canvas:
                out.setdefault(name[:-4], []).append(canvas)
    return out


def main():
    live = cetz.cd_label_off
    try:
        new = build_all(live)
        old = build_all(lambda label, px, py: 0.45)
    finally:
        cetz.cd_label_off = live
    papers = {p for p, canvases in new.items() if canvases != old.get(p, [])}
    moved = sum(1 for p in new for c in new[p] if c not in old.get(p, []))
    print("== CD canvases built: %d over %d papers (old rule: %d over %d)"
          % (sum(len(v) for v in new.values()), len(new),
             sum(len(v) for v in old.values()), len(old)))
    print("   canvases whose text changes: %d" % moved)
    print("   papers to regenerate       : %d" % len(papers))
    listfile = os.path.join(ROOT, "_work", "regen_needed.txt")
    with open(listfile, "w", encoding="utf-8") as fh:
        fh.write("\n".join(sorted(papers)) + "\n")
    print("   wrote %s" % os.path.basename(listfile))
    for p in sorted(papers)[:8]:
        print("     %s" % p[:60])


if __name__ == "__main__":
    main()
