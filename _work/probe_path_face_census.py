r"""Correct face for §7 「裸 `\path` 语句被描边画成实线」(#48) — read-only census only.

The old `probe_bare_path_face.py` counted every `line(...)` call with no `stroke:`, which
over-counts: a bare `\draw` is *supposed* to stroke.  The real defect is only the `\path` verb
(currently emitting a stroked line).  Per §7 line 847 we attribute per statement: build each
literal `\path` statement in isolation via `cetz.build` (no `typst` compile — safe during A's
gate), count the unstyled `line(...)` it emits, and rebuild it as `\draw` to confirm the geometry
is real and only the verb is wrong.

Pre-filter: only `\path` statements with NO explicit `draw`/`fill` option AND with geometry
(`--` connector or two coordinate groups) can emit a spurious line; pure `\path coordinate` /
`\path node` are skipped (they legitimately emit nothing).  Output is flushed incrementally so a
timeout cannot lose partial results.
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
STMT = re.compile(r"\\(?:draw|path|fill|filldraw)\b(?:\s*\[[^\]]*\])?(?:\s*\([^;]*?\)|\s*[^;\[]*?)*?;", re.S)
VERB = re.compile(r"\\(draw|path|fill|filldraw)\b")
OPT = re.compile(r"\\\[(.*?)\\\]", re.S)
GEOM = re.compile(r"^\s*(line|bezier|arc)\(")
STYLED = re.compile(r"stroke:|fill:|mark:")


def unstyled_lines(canvas):
    if not canvas:
        return 0
    return sum(1 for ln in canvas.splitlines()
               if GEOM.match(ln.strip()) and not STYLED.search(ln))


def build(stmt):
    try:
        got = cetz.build(r"\begin{tikzpicture}" + stmt + r"\end{tikzpicture}")
    except Exception as e:  # noqa
        return ("ERR", str(e)[:50])
    if got is None:
        return ("NONE", "")
    return ("OK", got)


def is_suspicious(stmt):
    """No explicit draw/fill option and carries geometry that would stroke."""
    m = OPT.search(stmt)
    if m and re.search(r"\b(draw|fill)\b", m.group(1)):
        return False
    if "--" in stmt:
        return True
    # two coordinate groups, e.g. \path (a) -- (b) already caught; this catches \path (a) (b)
    if re.search(r"\([^)]*\)\s*\([^)]*\)", stmt):
        return True
    return False


def main():
    total_path = 0
    skipped_coordnode = 0
    suspicious = 0
    build_fails = 0
    papers = {}            # stem -> spurious line count
    detail = []
    draw_confirm = 0
    n = 0
    out = sys.stdout

    def flush_summary():
        out.write("\n=== §7 #48 裸 \\path 真面（逐语句归属，只读 cetz.build，不开 typst）===\n")
        out.write("字面 \\path 动词语句总数：%d\n" % total_path)
        out.write("跳过（coordinate/node 专用，本就不画线）：%d\n" % skipped_coordnode)
        out.write("可疑语句（无 draw/fill 且带几何）：%d\n" % suspicious)
        out.write("建失败（ERR）：%d\n" % build_fails)
        out.write("发出多余实线（无 stroke: 的 line）的语句：%d\n" % len(detail))
        out.write("其中『同句改 \\draw 也出同样条数』（几何真、只动词错）：%d\n" % draw_confirm)
        out.write("受影响论文数：%d\n" % len(papers))
        out.write("\n--- 受影响论文 × 多余实线条数 ---\n")
        for stem in sorted(papers, key=lambda s: -papers[s]):
            out.write("  %-52s %d\n" % (stem[:52], papers[stem]))
        out.write("\n--- 逐语句明细（前 40）---\n")
        for stem, snip, sl, dl, note in detail[:40]:
            out.write("  %s | %s | path出%d draw出%s | %s\n"
                      % (stem[:34], snip[:44], sl, dl, note[:46]))

    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for pic in PIC.findall(src):
            body = pic[len(r"\begin{tikzpicture}"):-len(r"\end{tikzpicture}")]
            for stmt in STMT.findall(body):
                m = VERB.search(stmt)
                if not m or m.group(1) != "path":
                    continue
                total_path += 1
                if not is_suspicious(stmt):
                    skipped_coordnode += 1
                    continue
                suspicious += 1
                status, canvas = build(stmt)
                if status == "ERR":
                    build_fails += 1
                    continue
                if status == "NONE":
                    continue
                sl = unstyled_lines(canvas)
                if sl == 0:
                    continue
                draw_stmt = VERB.sub(r"\\draw", stmt, count=1)
                dstatus, dcanvas = build(draw_stmt)
                dl = unstyled_lines(dcanvas) if dstatus == "OK" else -1
                if dstatus == "OK" and dl == sl:
                    draw_confirm += 1
                    note = "draw twin strokes same %d -> geometry real, verb wrong" % sl
                elif dstatus == "OK":
                    note = "draw twin strokes %d (path %d)" % (dl, sl)
                else:
                    note = "draw twin %s" % dstatus
                papers[stem] = papers.get(stem, 0) + sl
                detail.append((stem, stmt.strip()[:80].replace("\n", " "), sl, dl, note))
                n += 1
                if n % 50 == 0:
                    out.write("[%d] papers=%d spurious_stmts=%d\n" % (n, len(papers), len(detail)))
                    out.flush()
    flush_summary()
    out.flush()
    return 0


if __name__ == "__main__":
    sys.exit(main())
