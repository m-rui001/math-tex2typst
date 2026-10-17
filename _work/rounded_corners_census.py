r"""Which statements really carry `rounded corners`, and what we emit for them today.

pgf's key rounds any corner in the statement it is written on, but CeTz only models it in some
places: `rect` takes a `radius:`, while `content`'s frame is a plain line-strip and `line` has no
radius at all. This splits the corpus by which of the three the statement lands on, so the fix is
scoped to the shapes that can actually carry it.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
RC = re.compile(r"rounded\s+corners")
STMT = re.compile(r"\\(?:draw|path|fill|filldraw)\b.*?;", re.S)


def split_statements(body):
    return STMT.findall(body)


def classify(stmt):
    """The shape family this statement's corners land on."""
    if re.search(r"\bnode\b", stmt):
        return "node"
    if re.search(r"\brectangle\b", stmt):
        return "rect_path"
    if re.search(r"\bgrid\b", stmt):
        return "grid"
    return "polyline"


def main():
    tally = {}
    papers = {}
    valued = {}
    by_kind = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for pic in PIC.findall(src):
            body = pic[len(r"\begin{tikzpicture}"):-len(r"\end{tikzpicture}")]
            for stmt in split_statements(body):
                if not RC.search(stmt):
                    continue
                kind = classify(stmt)
                tally[kind] = tally.get(kind, 0) + 1
                papers.setdefault(kind, set()).add(stem)
                m = re.search(r"rounded\s+corners\s*(?:=\s*([^\],;]+))?", stmt)
                val = (m.group(1) or "").strip() if m else ""
                valued[val] = valued.get(val, 0) + 1
                by_kind.setdefault(kind, set()).add(val)
    for kind in sorted(tally, key=lambda k: -tally[k]):
        print("%-10s stmts=%4d papers=%3d values=%s"
              % (kind, tally[kind], len(papers[kind]), sorted(by_kind[kind])))
    print("\nvalues written:")
    for val, n in sorted(valued.items(), key=lambda kv: -kv[1])[:15]:
        print("  %-24r %d" % (val, n))

    print("\nwhat we emit today:")
    for probe in (r"\draw[rounded corners] (0,0) rectangle (2,1);",
                  r"\draw[rounded corners=6pt] (0,0) rectangle (2,1);",
                  r"\fill[red,rounded corners] (0,0) rectangle (2,1);",
                  r"\draw[rounded corners=1cm] (0,0) rectangle (2,1);",
                  r"\draw[rounded corners=nonsense] (0,0) rectangle (2,1);",
                  r"\draw[rotate=30,rounded corners] (0,0) rectangle (2,1);",
                  r"\draw[rounded corners] (0,0) -- (1,1) -- (2,0);",
                  r"\node[draw,rounded corners] {x};",
                  r"\node[draw,rounded corners=6pt] {x};"):
        got = cetz.build(r"\begin{tikzpicture}" + probe + r"\end{tikzpicture}")
        line = [ln.strip() for ln in got.splitlines()
                if ln.strip() and not ln.strip().startswith(("#", ")", "//"))]
        print("  %-52s -> %s" % (probe, " | ".join(line[:2])[:150]))


if __name__ == "__main__":
    main()
