r"""#81 的改动面：scope 上的 shift 现在走矩阵——哪些画布真的变了？

只撤这一步：把 `_transform` 的 `scope` 参数打回 False（shift 一律照字面加），其余一行不动。在同一基
（批处理自己的图片路径：`lifted_pictures` → `picture_scopes` → `with_declarations` → `expand_macros`
→ `expand_linewidth(strip_envelope(pic), line_cm)` → `build(core, colors) or build_cd(core)`）上把
live 与 old 各跑一遍再 diff，得到的就是这一轮的改动面；关键词普查不是量具（#78 那 23 处假账）。

打桩把 head 也一起打回原样（head 的 shift 在语料里 0 处与 scale 同列，_work/probe81j_head_face.py），
所以 live/old 的差只可能来自 scope 与 picture head 上真正带矩阵的那些写法。

  python _work/probe81l_scope_churn.py
"""
import glob
import io
import os
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")


def sweep():
    out = {}
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)
        src = open(path, encoding="utf-8", errors="replace").read()
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
            pic = m.group(0)
            table, decls = scopes[k]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)
            core = cetz.expand_linewidth(cetz.strip_envelope(pic), axis)
            out[(stem, k)] = cetz.build(core, p.colors) or cetz.build_cd(core)
    return out


live = sweep()
real = cetz._transform


def verbatim(o, outer=cetz.IDENT, names=None, scope=False):
    # yesterday's law: a shift was added to the origin whatever matrix was in force at it
    return real(o, outer, names, False)


cetz._transform = verbatim
old = sweep()
cetz._transform = real

changed = [key for key in live if live[key] != old[key]]
papers = sorted({key[0] for key in changed})
start = [key for key in changed if old[key] is None and live[key] is not None]
stop = [key for key in changed if live[key] is None and old[key] is not None]
lines = 0
for key in changed:
    if not (live[key] and old[key]):
        continue
    for a, b in zip(live[key].splitlines(), old[key].splitlines()):
        if a != b:
            lines += 1
print("canvases built: %d (refused both ways: %d)"
      % (sum(1 for v in live.values() if v is not None),
         sum(1 for v in live.values() if v is None)))
print("canvases moved: %d in %d papers, %d lines" % (len(changed), len(papers), lines))
print("started drawing: %d   stopped drawing: %d" % (len(start), len(stop)))
with open(os.path.join(ROOT, "_work", "regen81l.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(os.path.splitext(p)[0] for p in papers))
print("wrote _work/regen81l.txt (%d papers)" % len(papers))
for key in changed[:8]:
    a = (live[key] or "").splitlines()
    b = (old[key] or "").splitlines()
    for i, (x, y) in enumerate(zip(a, b)):
        if x != y:
            print("  %s#%d line %d\n    old %s\n    new %s"
                  % (key[0][:46], key[1], i, y.strip()[:150], x.strip()[:150]))
            break
