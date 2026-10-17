r"""#86 的收稿量具：发射器换出的间距能不能排、排的间距对不对。

两问：

  bodies  `_math_body` 对六个拼写各回什么——带 `#h(...)` 的那条必须是**未加引号**的数学体，
          被守卫打回文本的那条必须只剩一个空格（`#h` 印在页上就是缺陷）。
  page    拿 on-ink 名单里带 `\ ` 的那张真画布（`A-boundary-only-...` #1），按当前发射器重建、
          单排一页，用 fitz 自己的行盒数它排成几行、逗号后的墨距是多少，再对 pdflatex 控制页
          （`_work/measure86_space_tokens.py` 的 9pt/10pt 价：`\,` 加 1.53pt、`\ ` 加 3.08pt，
          相对「TeX 忽略的字面空格」这一基）。

用法：python _work/probe86_emitter_check.py [bodies|page|churn|cd] [flat-stem-prefix]

  churn   全库逐张按两种律各建一遍，diff 就是改动面；顺带把改动的篇名写进 `_work/regen86.txt`。
  cd      打印一篇重建出来的画布里带 `\,` / `#h(` / `\ ` 的行，看 tikz-cd 那条路上谁在拼间距。
"""
import importlib.util
import io
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODE = sys.argv[1] if len(sys.argv) > 1 else "bodies"
FRAG = sys.argv[2] if len(sys.argv) > 2 else "A-boundary-only"
# the census gauge rewrites sys.argv when it is imported, so the mode is read above it
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.join(ROOT, "_work"))

spec = importlib.util.spec_from_file_location(
    "m86", os.path.join(ROOT, "_work", "probe81m_churn_read.py"))
m86 = importlib.util.module_from_spec(spec)
sys.argv = ["m86"]
spec.loader.exec_module(m86)
g = m86.g81
from t2t import cetz  # noqa: E402
import fitz  # noqa: E402
import re  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
CMP = os.path.join(ROOT, "_work", "cmp")
WORK = os.path.join(ROOT, "_work")

SAMPLES = [
    r"n=-s,\ v=s",
    r"P(R \, n)",
    r"u \; v",
    r"R \! S",
    r"A\,\#B",          # 作者自己的 '#'：守卫必须照旧打回，且不得把调用印出来
    r"\alpha \, \beta",
]

# #83's table, spelled once: `\,` and `\;` a literal space (which Typst's maths already prices at
# 0.1667em), `\!` nothing, and `\ ` left as the author wrote it -- the line break this round removes
STUB = ({r"\,": "0.1667", r"\;": "0.1667", r"\!": "0"},
        re.compile(r"(?<!\\)[ \t]*(\\[,;!])[ \t]*"))


def old_law():
    """Put the table back on the module, whoever the caller is, and restore it after."""
    class _Stub(object):
        def __enter__(self):
            self.saved = (cetz.MATH_SPACES, cetz.MATH_SPACE)
            cetz.MATH_SPACES, cetz.MATH_SPACE = STUB
            return self

        def __exit__(self, *exc):
            cetz.MATH_SPACES, cetz.MATH_SPACE = self.saved
            return False
    return _Stub()


def old_body(tex):
    with old_law():
        return cetz._math_body(tex)


def bodies():
    for tex in SAMPLES:
        for tag, conv in (("new", cetz._math_body), ("old", old_body)):
            got = conv(tex)
            print("  %-4s %-16r -> %s%s"
                  % (tag, tex, got, "   QUOTED" if got.startswith('"') else ""))


def lines(pdf):
    """[(text, y0, y1)] fitz's own line boxes on page 1, top to bottom."""
    doc = fitz.open(pdf)
    out = []
    for block in doc[0].get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            text = "".join(s["text"] for s in line["spans"]).strip()
            if text:
                out.append((text, line["bbox"][1], line["bbox"][3]))
    doc.close()
    return sorted(out, key=lambda r: r[1])


def page():
    """The on-ink canvas that started the round, built both ways and set on one page each."""
    stem = next((n for n in os.listdir(FLAT) if n.startswith(FRAG)), None)
    if stem is None:
        print("no flat source")
        return
    path = os.path.join(FLAT, stem)
    held = m86.source(path)
    if held is None:
        print("no pictures in %s" % stem)
        return
    p, pics, scopes, axis = held
    new = m86.build_all(*held)
    with old_law():
        old = m86.build_all(*held)
    for k, (a, b) in enumerate(zip(old, new)):
        if a == b:
            continue
        print("  canvas #%d changes:" % k)
        for ln in [l for l in b.splitlines() if "h(0." in l or "h(-0." in l][:4]:
            print("      new %s" % ln.strip())
        for tag, canvas in (("old", a), ("new", b)):
            ret = g.render(canvas, "86e_%s%d" % (tag, k))
            if not ret:
                print("      %s render refused" % tag)
                continue
            rects, ink, pdf = ret
            foreign, onink = g.decide(pdf, rects, ink)
            rows_ = lines(pdf)
            print("      %s  %d rows   foreign %d   on-ink %d (%s)"
                  % (tag, len(rows_), len(foreign), len(onink),
                     " ".join("%.2f" % t[0] for t in onink)))
            for text, y0, y1 in rows_[:10]:
                print("        row %6.2f..%6.2f  %r" % (y0, y1, text[:40]))
    ctl = os.path.join(CMP, "A_boundary_only_obstruction_to_four_dime-1.pdf")
    if os.path.exists(ctl):
        print("  control %s" % os.path.relpath(ctl, ROOT))
        for text, y0, y1 in lines(ctl):
            if "annulus" in text or "v=s" in text:
                print("      row %6.2f..%6.2f  %r" % (y0, y1, text[:44]))


def churn():
    r"""Every picture in the corpus built twice, the new law and #83's table stubbed back.

    The diff is the change face; which call the newer line carries names the family that drove it.
    A canvas that only moves a `\,` is not in the face: the old law's literal space already cost
    Typst's 0.1667em, which is TeX's thin to the sixth decimal.
    """
    drives = {}
    names = []
    canvases = papers = changed = 0
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        held = m86.source(os.path.join(FLAT, name))
        if held is None:
            continue
        new = m86.build_all(*held)
        with old_law():
            old = m86.build_all(*held)
        hit = [(a, b) for a, b in zip(old, new) if a and b and a != b]
        if not hit:
            continue
        papers += 1
        canvases += len(hit)
        names.append(name[:-4])
        for a, b in hit:
            la, lb = a.splitlines(), b.splitlines()
            changed += sum(1 for x, y in zip(la, lb) if x != y) + abs(len(la) - len(lb))
            for ratio in ("0.3333", "0.2778", "-0.1667"):
                if b.count("#h(%sem)" % ratio) > a.count("#h(%sem)" % ratio):
                    drives.setdefault(ratio, set()).add(name[:-4])
    for ratio, tag in (("0.3333", r"\  (break -> space)"), ("0.2778", r"\; "),
                       ("-0.1667", r"\! ")):
        print("  %-22s %2d papers" % (tag, len(drives.get(ratio, ()))))
    print("  canvases changed %d   papers %d   lines %d" % (canvases, papers, changed))
    with io.open(os.path.join(WORK, "regen86.txt"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(names) + "\n")
    print("  list -> _work/regen86.txt")


def cd():
    """What the rebuilt cd canvases of one paper hold where the author wrote a comma or a space."""
    stem = next((n for n in os.listdir(FLAT) if n.startswith(FRAG)), None)
    held = m86.source(os.path.join(FLAT, stem)) if stem else None
    if held is None:
        print("no pictures in %r" % FRAG)
        return
    for k, canvas in enumerate(m86.build_all(*held)):
        if not canvas:
            print("  #%d refused" % k)
            continue
        kind = "cd" if "#text(size:" not in canvas else "node"
        print("  #%d %s" % (k, kind))
        for ln in canvas.splitlines():
            if "\\," in ln or "#h(" in ln or "\\ " in ln:
                print("      %s" % ln.strip()[:110])


if __name__ == "__main__":
    {"bodies": bodies, "page": page, "churn": churn, "cd": cd}[MODE]()
