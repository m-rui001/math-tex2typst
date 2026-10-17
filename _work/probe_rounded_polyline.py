r"""C's claim (2026-10-15 §0): measure pgf's per-corner `rounded corners` law on MULTI-SEGMENT
polylines -- the part of #61's family that was never measured ("pgf 如何逐转角圆法还没量，另起一轮").

Two parts:
  PART 1  extract the 13 real `rounded corners` polyline statements (the §7 residual: 13 stmts / 5 papers)
          from `_work/flat/*.tex`, with paper + value, so the fix later knows exactly what it is fixing.
  PART 2  measure pgf's law off the page with fitz: at each interior vertex of a polyline, what radius
          does the arc take? Two unknowns:
            (a) default value when `rounded corners` is written with no `=`: manual says 4pt.
            (b) clamping: pgf cannot round a corner tighter than half the shorter adjacent segment, so
                r_corner = min(specified, 0.5 * min(len_in, len_out)). We prove this with a Z-shape
                where one corner has a long/long pair (full radius) and the next has a short segment
                (clamped).

Read-only: only runs pdflatex + fitz. Does not touch cetz.py or any tools.
"""
import glob
import os
import re
import subprocess
import sys

import fitz  # noqa: E402

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402  (build() only emits a source string, no typst run)
FLAT = os.path.join(ROOT, "_work", "flat")
HERE = os.path.dirname(os.path.abspath(__file__))

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
RC = re.compile(r"rounded\s+corners")
STMT = re.compile(r"\\(?:draw|path|fill|filldraw)\b.*?;", re.S)


def classify(stmt):
    if re.search(r"\bnode\b", stmt):
        return "node"
    if re.search(r"\brectangle\b", stmt):
        return "rect_path"
    if re.search(r"\bgrid\b", stmt):
        return "grid"
    return "polyline"


def short(stmt, n=120):
    s = re.sub(r"\s+", " ", stmt).strip()
    return s if len(s) <= n else s[:n] + "…"


def part1_extract():
    print("=" * 78)
    print("PART 1 — the 13 real polyline `rounded corners` statements (§7 residual)")
    print("=" * 78)
    rows = []
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for pic in PIC.findall(src):
            body = pic[len(r"\begin{tikzpicture}"):-len(r"\end{tikzpicture}")]
            for stmt in STMT.findall(body):
                if not RC.search(stmt):
                    continue
                if classify(stmt) != "polyline":
                    continue
                m = re.search(r"rounded\s+corners\s*(?:=\s*([^\],;]+))?", stmt)
                val = (m.group(1) or "").strip() if m else ""
                rows.append((stem, val or "(default)", short(stmt)))
    print("found %d statements across %d papers\n" % (len(rows), len({r[0] for r in rows})))
    for i, (stem, val, s) in enumerate(rows, 1):
        print("[%2d] %-22s value=%-10s %s" % (i, stem, val, s))
    return rows


# ---- PART 2: pgf per-corner law, read off the page ----
PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}
%s
\end{tikzpicture}
\end{document}
"""


def render(tex):
    tmp = os.path.join(HERE, "_rc_poly")
    os.makedirs(tmp, exist_ok=True)
    name = "pgfpoly"
    tpath = os.path.join(tmp, name + ".tex")
    open(tpath, "w", encoding="utf-8").write(tex)
    pdf = os.path.join(tmp, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    for _ in range(2):
        subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                       cwd=tmp, capture_output=True)
    return pdf if os.path.exists(pdf) else None


def get_drawings(pdf):
    doc = fitz.open(pdf)
    drawings = doc[0].get_drawings()
    doc.close()
    return drawings


def vertex_page(tex_verts):
    """Draw the polyline (black, rounded) plus a tiny RED reference line at each vertex so we can
    read each vertex's exact page position from the page. Returns list of (vx,vy) page points."""
    refs = []
    for (x, y) in tex_verts:
        refs.append(r"\draw[red,line width=0.1pt] (%.4f,%.4f) -- (%.4f,%.4f);"
                    % (x, y, x, y - 0.02))
    body = "\n".join(refs)
    return body


def measure_case(label, key, verts_cm):
    # polyline (black) with the rounded key; reference red lines give us vertex page positions
    poly = "\\draw[%s] %s;" % (key, " -- ".join("(%s,%s)" % (x, y) for x, y in verts_cm))
    refs = "\n".join("\\draw[red,line width=0.1pt] (%.4f,%.4f) -- (%.4f,%.4f);"
                     % (x, y, x, y - 0.02) for x, y in verts_cm)
    tex = PGF % (poly + "\n" + refs)
    pdf = render(tex)
    if not pdf:
        print("  !! %s: no pdf" % label)
        return
    drawings = get_drawings(pdf)
    red_pts = []
    black_curves = []
    black_lines = []
    for d in drawings:
        col = d.get("color")
        is_red = (isinstance(col, (tuple, list)) and len(col) == 3 and col[0] > 0.5
                  and col[1] < 0.3 and col[2] < 0.3)
        for it in d["items"]:
            if it[0] == "l":
                p = it[1]
                if is_red:
                    red_pts.append(p)
                else:
                    black_lines.append(p)
            elif it[0] == "c":
                if not is_red:
                    # fitz bezier item is ("c", p1, c1, c2, p4): start = it[1], end = it[-1]
                    black_curves.append(it)
    if not red_pts:
        print("  !! %s: no red reference points" % label)
        return
    # each vertex ~ a red point; for each, find nearest black curve endpoint -> radius
    results = []
    for v in red_pts:
        best = None
        for c in black_curves:
            for ep in (c[1], c[-1]):  # cubic bezier start / end
                dd = abs(ep - v)
                if best is None or dd < best:
                    best = dd
        results.append(best)
    print("  %-10s key=%-18s corner_r(bp)=[%s]"
          % (label, key, " ".join("%.3f" % (r if r is not None else -1) for r in results)))
    return results


def part2_law():
    print("\n" + "=" * 78)
    print("PART 2 — pgf per-corner law on polylines (read off the page, bp)")
    print("=" * 78)
    # L-shape, both segments long (3cm=85bp >> any radius) -> should show the raw radius
    print("L-shape, long/long (expects raw radius, no clamp):")
    measure_case("default", "rounded corners", [(0, 0), (3, 0), (3, 3)])
    measure_case("4pt", "rounded corners=4pt", [(0, 0), (3, 0), (3, 3)])
    measure_case("10pt", "rounded corners=10pt", [(0, 0), (3, 0), (3, 3)])
    measure_case("20pt", "rounded corners=20pt", [(0, 0), (3, 0), (3, 3)])
    # Z-shape: vertex A=(3,0) long/long, vertex B=(3,3) has a SHORT 0.1cm segment -> clamp
    print("\nZ-shape: A=long/long (full), B has a 0.1cm short segment (clamp to ~1.42bp):")
    measure_case("10pt_Z", "rounded corners=10pt", [(0, 0), (3, 0), (3, 3), (3.1, 3)])
    measure_case("20pt_Z", "rounded corners=20pt", [(0, 0), (3, 0), (3, 3), (3.1, 3)])
    # explicit large value with very short segment to push clamp hard
    print("\nU-shape with a 0.05cm notch (clamp to ~0.71bp):")
    measure_case("30pt_U", "rounded corners=30pt", [(0, 0), (3, 0), (3, 0.05), (3.05, 0.05)])
    # isolated clamp: A = long/long (full 10pt), B has one 0.3cm (=8.5pt) short segment -> clamp 4.25pt
    print("\nIsolated clamp: A full, B short 0.3cm segment (clamp ~4.25bp):")
    measure_case("10pt_clamp", "rounded corners=10pt", [(0, 0), (3, 0), (3, 0.3), (6, 0.3)])
    measure_case("4pt_clamp", "rounded corners=4pt", [(0, 0), (3, 0), (3, 0.3), (6, 0.3)])


def _to_pt(val):
    """`rounded corners` value: default unit is pt in pgf."""
    val = val.strip()
    if not val:
        return 4.0  # default
    m = re.match(r"^([-0-9.]+)\s*(pt|cm|mm|in|bp)?$", val)
    if not m:
        return None  # nonsense value -> pgf ignores the key
    num = float(m.group(1))
    unit = m.group(2) or "pt"
    return {"pt": 1, "bp": 1.00375, "cm": 28.4528, "mm": 2.84528, "in": 72.27}[unit] * num


CM_PT = 28.4528


def _verts_cm(stmt):
    out = []
    for tok in re.findall(r"\(([^)]*)\)", stmt):
        parts = tok.split(",")
        if len(parts) != 2:
            return None  # node-ref like (v3) or cycle -> skip
        try:
            x = float(parts[0])
            y = float(parts[1])
        except ValueError:
            return None
        out.append((x, y))
    return out


def show_current_emit(stmt):
    """What CeTz emits today for this statement (no typst run; just build the source)."""
    try:
        got = cetz.build(r"\begin{tikzpicture}" + stmt + r"\end{tikzpicture}")
    except Exception as e:  # noqa
        return "BUILD-ERROR: %s" % e
    if got is None:
        return "cetz.build->None (can't parse; today this corner would be dropped)"
    line = [ln.strip() for ln in got.splitlines()
            if ln.strip() and not ln.strip().startswith(("#", ")", "//"))]
    return " | ".join(line[:1])[:160]


def part3_impact():
    print("\n" + "=" * 78)
    print("PART 3 — per-statement impact spec for the 13 real polylines (read-only)")
    print("=" * 78)
    print("%-3s %-50s val   corners  min_r   clamp?  current CeTz emit" % ("#", "paper"))
    rows = []
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for pic in PIC.findall(src):
            body = pic[len(r"\begin{tikzpicture}"):-len(r"\end{tikzpicture}")]
            for stmt in STMT.findall(body):
                if not RC.search(stmt) or classify(stmt) != "polyline":
                    continue
                m = re.search(r"rounded\s+corners\s*(?:=\s*([^\],;]+))?", stmt)
                val = (m.group(1) or "").strip() if m else ""
                vpt = _to_pt(val)
                verts = _verts_cm(stmt)
                emit = show_current_emit(stmt)
                if verts is None or len(verts) < 3:
                    rows.append((stem, val or "(default)", "n/a", "n/a", "node-ref/cycle",
                                 emit))
                    continue
                segs = [((verts[i + 1][0] - verts[i][0]) ** 2 +
                         (verts[i + 1][1] - verts[i][1]) ** 2) ** 0.5 * CM_PT
                        for i in range(len(verts) - 1)]
                rs = []
                for k in range(1, len(verts) - 1):  # interior corners
                    if vpt is None:
                        rs.append(None)
                        continue
                    half = 0.5 * min(segs[k - 1], segs[k])
                    rs.append(min(vpt, half))
                if vpt is None:
                    binding = "key-ignored"
                    clamp = "-"
                else:
                    binding = "%.2fpt" % min(rs)
                    clamp = "YES" if any(r < vpt - 0.05 for r in rs) else "no"
                rows.append((stem, val or "(default)", str(len(rs)), binding, clamp, emit))
    for i, (stem, val, nc, mr, clamp, emit) in enumerate(rows, 1):
        print("%-3d %-50s %-5s %-7s %-7s %-6s %s"
              % (i, stem[:50], val, nc, mr, clamp, emit))


if __name__ == "__main__":
    part1_extract()
    part2_law()
    part3_impact()
