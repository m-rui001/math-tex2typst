r"""读 #81 那 31 张被改动的画布：修之前和修之后，各自的互压各是多少？

全库普查只告诉我们总数从 160/278 变成 157/272——一张画布修完是变好还是变坏，得逐张读。
做法：在同一批基（`_work/flat`）上把每张图各建两遍（live 与「`_transform` 的 scope 打回 False」的
旧律），只对**两版文本不同**的那些发页；两版各排一页，交给 #81 的量具（`probe81_label_box_face`）
数 foreign／on-ink。画布序号按「该篇第几张图」对齐——两版来自同一张源图，序号天然一致。

  python _work/probe81m_churn_read.py
"""
import glob
import importlib.util
import io
import os
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, convert, prep  # noqa: E402

spec = importlib.util.spec_from_file_location(
    "g81", os.path.join(ROOT, "_work", "probe81_label_box_face.py"))
g81 = importlib.util.module_from_spec(spec)
sys.argv = ["g81"]
spec.loader.exec_module(g81)

FLAT = os.path.join(ROOT, "_work", "flat")


def source(path):
    """The paper's pictures and the tables the pipeline hands them, before any build."""
    src = open(path, encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    pics = convert.lifted_pictures(body)
    if not pics:
        return None
    return p, pics, convert.picture_scopes(body, p.macros), convert.line_cm(p)


def build_all(p, pics, scopes, axis, with_scope=True):
    """Every picture of one paper, built by the emitter as it stands -- `with_scope=False` puts
    #81's scope rule back to False so the two laws can be read against each other."""
    real = cetz._transform

    def stub(o, outer=cetz.IDENT, names=None, scope=False):
        return real(o, outer, names, with_scope and scope)
    cetz._transform = stub
    try:
        got = []
        for k, m in enumerate(pics):
            pic = m.group(0)
            table, decls = scopes[k]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)
            core = cetz.expand_linewidth(cetz.strip_envelope(pic), axis)
            got.append(cetz.build(core, p.colors) or cetz.build_cd(core))
        return got
    finally:
        cetz._transform = real


def live(path):
    """Today's canvas for each of the paper's pictures, in document order (None if refused)."""
    held = source(path)
    return [] if held is None else build_all(*held)


def pictures(path):
    """The two laws' canvases for one paper, as a list of (index, old, new)."""
    held = source(path)
    if held is None:
        return []
    old = build_all(*held, with_scope=False)
    new = build_all(*held, with_scope=True)
    return [(k, a, b) for k, (a, b) in enumerate(zip(old, new)) if a != b and a and b]


def count(canvas, head, name):
    got = g81.render(canvas, name, head)
    if got is None:
        return None
    rects, ink, pdf = got
    # the same decision path the census uses -- a second gauge here would price depth differently
    foreign, onink = g81.decide(pdf, rects, ink)
    depths = [f[0] for f in foreign] + [f[0] for f in onink]
    return len(foreign), len(onink), (max(depths) if depths else 0.0)


def main():
    names = [l.strip() for l in open(os.path.join(ROOT, "_work", "regen81l.txt"),
                                     encoding="utf-8") if l.strip()]
    better = worse = same = 0
    for stem in names:
        path = os.path.join(FLAT, stem + ".tex")
        if not os.path.exists(path):
            print("missing flat source: %s" % stem)
            continue
        typ = os.path.join(ROOT, "typst", stem, "main.typ")
        head = g81.header_of(open(typ, encoding="utf-8").read()) if os.path.exists(typ) else ""
        for k, old, new in pictures(path):
            a = count(old, head, "%s_old%d" % (stem[:18], k))
            b = count(new, head, "%s_new%d" % (stem[:18], k))
            if a is None or b is None:
                print("  %-46s#%-2d render refused (old %s / new %s)" % (stem[:46], k, a, b))
                continue
            tag = "better" if sum(b[:2]) < sum(a[:2]) else ("WORSE" if sum(b[:2]) > sum(a[:2]) else "same")
            if tag == "better":
                better += 1
            elif tag == "WORSE":
                worse += 1
            else:
                same += 1
            print("  %-46s#%-2d  old %d/%d (worst %.1f)  ->  new %d/%d (worst %.1f)   %s"
                  % (stem[:46], k, a[0], a[1], a[2], b[0], b[1], b[2], tag))
    print("\ncanvases read: %d   better %d   same %d   worse %d"
          % (better + same + worse, better, same, worse))


if __name__ == "__main__":
    main()
