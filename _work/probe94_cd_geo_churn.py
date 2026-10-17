r"""#87b 的改动面：把 `column sep`/`row sep` 换成盒到盒的实测律、单元盒换成拟合的墨宽，哪些画布动了？

这一轮换的是六件事（`_work/probe90_cd_sep_law.py` 的间距律、`_work/probe91_cd_cell_box.py` 的单元盒、
`_work/probe92_cd_amscd_sep.py` 的 amsCD 译法），而 `build_cd` 里的 `pos`/`edge` 是闭包，桩从模块外够不到，
所以旧律不是 monkeypatch 出来的：把 live 源码按六处逐字退回换前的写法，exec 成第二个模块，两条律跑同一个基
再 diff。退回的每一处都要求在当前源码里恰好命中一次，命中不了就报错，不允许静悄悄退不全。

桩是否真的等于换前的行为，不靠我说：`_work/probe94_cd_geo_churn.py check` 拿换前 `test_t2t.py` 里那批
逐字断言（堆叠单元 -0.65/-2.8、长标签 1.829/-0.85、`f` 的 1.3、弯箭 0.51/4.69、hook 0.51）喂旧模块，
每条都得命中才算数。#40 的教训在这摆着：一个退得比本轮多得多的桩报的是上界，长得像一张缺陷脸。

基是 `_work/probe101_cd_batch_pictures.batch`——转换器真正画的那一串字符（图已按论文自己的
`\newcommand` 展开），图序＝画布序。`_work/probe88d_cd_label_churn.py` 用的是 `_work/flat` 的原始图序，
那份基没有宏展开：`The-height-three…#1` 在原始图上会被 texmath 排成 9 个字母的 `\hthreects`，产品里只有
3 个字母的 cts，两边墨宽不同，改动面名单就会多算或多算不到。CD_LABEL_EM 两边都不动——标签尺寸是上一轮的账。

  python _work/probe94_cd_geo_churn.py          # 旧律自检 + 改动面
"""
import glob
import os
import re
import sys
import types

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# probe81 wraps sys.stdout for the utf-8 text these probes print; wrapping it a second time would
# close the buffer the first wrapper handed to pymupdf's message stream
sys.path.insert(0, os.path.join(ROOT, "_work"))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe101_cd_batch_pictures as B  # noqa: E402
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
LIVE = os.path.join(ROOT, "tools", "t2t", "cetz.py")
COORD = re.compile(r"content\(\((-?[\d.]+), (-?[\d.]+)\)")
CD = re.compile(r"\\begin\{(tikzcd|CD)\}")

# what the code read before this round, in the exact text it had then
GAP_OLD = '''def cd_gap(head, key):
    """The separation an author sets on `column sep` / `row sep`, in cm.

    tikz-cd takes a named step or a dimension, and a step it does not know is an error on its own
    page rather than a silent default, so the one reading this function cannot give is a value the
    author wrote: an unknown shape keeps the `normal` step the environment uses when the author
    writes nothing at all.  The corpus writes the names `small`, `large`, `huge` and the units `cm`
    and `em` -- 12 pictures over 11 papers whose value the old name-only table used to drop
    (`_work/probe89_cd_sep_census.py`).
    """
    m = re.search(re.escape(key) + r"\\s*=\\s*(?:\\{([^{}]*)\\}|([^\\s,\\]}]+))", head)
    base = CD_SEP_BASE[key.split()[0]]
    if not m:
        return base * CD_STEP_NAMES["normal"]
    value = (m.group(1) or m.group(2)).strip().lower()
    if value in CD_STEP_NAMES:
        return base * CD_STEP_NAMES[value]
    dim = CD_DIM.fullmatch(value)
    if dim:
        return float(dim.group(1)) * CD_UNIT_CM[dim.group(2)]
    return base * CD_STEP_NAMES["normal"]'''
GAP_NEW = '''CD_SIZE = {"tiny": 1.4, "small": 2.0, "large": 3.2}


def cd_gap(head, key, default):
    """A named tikzcd separation in cm; an unknown dimension keeps the default."""
    m = re.search(key + r"\\s*=\\s*(\\w+)", head)
    return CD_SIZE.get(m.group(1), default) if m else default'''

REVERTS = [
    (GAP_OLD, GAP_NEW),
    ('    colsep = cd_gap(head, "column sep")\n',
     '    colsep = cd_gap(head, "column sep", 2.6)\n'),
    ('    rowsep = cd_gap(head, "row sep")\n',
     '    rowsep = cd_gap(head, "row sep", 1.7)\n'),
    ("CD_LINE_CM = 0.586\n", "CD_LINE_CM = 0.5\n"),
    ("CD_CELL_CM = (0.540, 0.132)\n", "CD_CELL_CM = (0.55, 0.17)\n"),
    ("        xs.append(xs[-1] + colsep + (wide[c - 1] + wide[c]) / 2)\n",
     "        xs.append(xs[-1] + max(colsep, (wide[c - 1] + wide[c]) / 2 + 0.9))\n"),
    ('''    def pos(r, c):
        # a row's place comes from cd_rows, which already descends; a step off the grid lands one
        # separation beyond the last row or column the diagram actually fills
        return (xs[c] if c < len(xs) else xs[-1] + colsep,
                ys[r] if r < len(ys) else ys[-1] - rowsep)
''', '''    def pos(r, c):
        # a canvas y grows upward while tikzcd's rows descend, so row r sits at -r * rowsep
        return (xs[c] if c < len(xs) else xs[-1] + colsep, -r * rowsep)
'''),
    ('''    def edge(r, c, ux, uy):
        """How far a cell's box reaches along the direction an arrow leaves it."""
        text = grid[r][c][0] if r < len(grid) and c < len(grid[r]) else ""
        return max(abs(ux) * cd_width(text) / 2, abs(uy) * cd_height(text) / 2)
''', '''    def edge(r, c, ux, uy):
        """How far a cell's box reaches along the direction an arrow leaves it."""
        text = grid[r][c][0] if r < len(grid) and c < len(grid[r]) else ""
        if not text:
            return 0.5
        half = 0.4 + CD_LINE_CM / 2 * max(0, len(cd_lines(text)) - 1)
        return max(abs(ux) * (cd_width(text) / 2 + 0.15), abs(uy) * half)
'''),
    ("    ys = cd_rows(grid, rowsep)\n", ""),
    ('''    return ("\\\\begin{tikzcd}[column sep=1.125cm,row sep=0.199cm]%s\\\\end{tikzcd}"
            % merge_arrow_rows(drawn))''',
     '    return "\\\\begin{tikzcd}[column sep=large,row sep=large]%s\\\\end{tikzcd}" '
     '% merge_arrow_rows(drawn)'),
]

# the assertions `tools/test_t2t.py` carried before this round, verbatim -- the old law's own record
ORACLE = [
    ("stacked cell", "\\begin{tikzcd}[row sep=large]"
     "\\begin{gathered}\\text{first line}\\\\ \\text{second line}\\end{gathered} \\arrow[d] \\\\"
     "\\text{below}\\end{tikzcd}",
     ["content((0, 0.25), [$upright(\"first line\")$])",
      "content((0, -3.2), [$upright(\"below\")$])",
      "line((0, -0.65), (0, -2.8), mark: (end: \">\"))"]),
    ("long label", "\\begin{tikzcd} A \\arrow[d,\"group and residue duality\"] \\\\ B \\end{tikzcd}",
     ["line((0, -0.4), (0, -1.3)", "content((1.829, -0.85),"]),
    ("short label", "\\begin{tikzcd} A \\arrow[r,\"f\"] & B \\end{tikzcd}",
     ["content((1.3, 0.2266), [#text(size: 0.73em)[$f$]])", "line((0.51, 0), (2.09, 0)"]),
    ("bend 22", "\\begin{tikzcd} A \\arrow[rr,bend left=22,\"f\"] & & B \\end{tikzcd}",
     ["bezier((0.51, 0), (4.69, 0), (2.021, 0.6107), (3.179, 0.6107),",
      "content((2.6, 0.6847), [#text(size: 0.73em)[$f$]])"]),
    ("hook", "\\begin{tikzcd} A \\arrow[r,hook] & B \\end{tikzcd}",
     ["line((0.51, 0), (0.51, 0.3))"]),
]


def old_module():
    """The live source with this round's six steps withdrawn, exec'd as a second module."""
    src = open(LIVE, encoding="utf-8").read()
    for now, before in REVERTS:
        n = src.count(now)
        if n != 1:
            raise SystemExit("revert hit %d times, not once: %r" % (n, now[:60]))
        src = src.replace(now, before)
    mod = types.ModuleType("t2t.cetz_old94")
    mod.__package__ = "t2t"
    mod.__file__ = LIVE
    exec(compile(src, "cetz_old94.py", "exec"), mod.__dict__)
    return mod


def check(old):
    bad = 0
    for name, src, wants in ORACLE:
        got = old.build_cd(src) or ""
        for want in wants:
            if want not in got:
                print("  STALE STUB  %-12s %r" % (name, want))
                print("              %s" % " / ".join(got.splitlines()[2:]))
                bad += 1
    print("old-law stub reproduces the pre-round assertions: %s"
          % ("yes" if not bad else "NO (%d miss)" % bad))
    return bad


def sweep(builder):
    out = {}
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)[:-4]
        for k, pic in enumerate(B.batch(stem)[0]):
            if not CD.match(pic):
                continue
            out[(stem, k)] = builder(cetz.strip_envelope(pic))
    return out


def main():
    old = old_module()
    if check(old):
        return 1
    live = sweep(cetz.build_cd)
    before = sweep(old.build_cd)
    moved, same, gained, lost = [], [], [], []
    for key in live:
        a, b = live[key], before[key]
        if a == b:
            same.append(key)
            continue
        if a is None:
            lost.append(key)
        elif b is None:
            gained.append(key)
        elif COORD.findall(a) != COORD.findall(b):
            moved.append(key)
        else:
            same_moves = [x for x in a.splitlines() if x not in b.splitlines()]
            moved.append(key)
            print("  no content() coordinate moved, %d line(s) differ: %s#%d: %s"
                  % (len(same_moves), key[0][:40], key[1], same_moves[0].strip()[:90]))
    papers = sorted({key[0] for key in moved + gained + lost})
    print("\ncanvases: %d built, %d refused both ways, %d unchanged"
          % (sum(1 for v in live.values() if v), sum(1 for v in live.values() if not v), len(same)))
    print("this round's churn: %d canvases in %d papers (moved %d, gained %d, lost %d)"
          % (len(moved) + len(gained) + len(lost), len(papers), len(moved), len(gained), len(lost)))
    for key in gained + lost:
        print("  %s: %s#%d" % ("GAINED" if key in gained else "LOST", key[0][:46], key[1]))
    name = os.path.join(ROOT, "_work", "regen94.txt")
    with open(name, "w", encoding="utf-8") as fh:
        fh.write("\n".join(papers))
    union = sorted(set(papers) | set(open(os.path.join(ROOT, "_work", "regen88.txt"),
                                          encoding="utf-8").read().split()))
    print("wrote %s (%d papers); with #88's list to regen: %d papers"
          % ("_work/regen94.txt", len(papers), len(union)))
    ulist = os.path.join(ROOT, "_work", "regen94_union.txt")
    with open(ulist, "w", encoding="utf-8") as fh:
        fh.write("\n".join(union))
    return 0


if __name__ == "__main__":
    sys.exit(main())
