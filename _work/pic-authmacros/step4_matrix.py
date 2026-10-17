r"""Full production path, per picture, for every paper the patch can reach.

The cheap scan left 9 papers: the two whose *whole-document* macro table grows (a body `\\newcommand`
whose body only *looks* like a conditional to the old substring test) and the eight with a
`\\tikzset`/`\\colorlet` standing between pictures. `cetz.convert` is wrapped, not replaced, so each
paper still runs the real pipeline (pandoc included, `typst compile` stubbed) and the record is the
converter's own decision per picture: canvas or quoted. A picture that converted before the patch and
quotes after it is a regression, and it is the only thing this matrix can see.
"""
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")
STUB = r'"\[typst compile stubbed\]"'


def run(tree, tag, names):
    sys.path.insert(0, os.path.join(ROOT, tree))
    for mod in [m for m in sys.modules if m.startswith("t2t")]:
        sys.modules.pop(mod, None)
    from t2t import convert

    real_run = subprocess.run

    def guarded(cmd, *a, **kw):
        if isinstance(cmd, list) and "typst" in str(cmd[0]):
            return subprocess.CompletedProcess(cmd, 0, STUB, "")
        return real_run(cmd, *a, **kw)

    convert.subprocess.run = guarded
    convert.ROOT = ROOT
    convert.MANIFEST = {e["paper"]: e for e in json.loads(
        Path(ROOT, "_work", "manifest.json").read_text(encoding="utf-8"))}

    decisions = {}
    real_convert = convert.cetzmod.convert
    current = [""]

    def recorded(text, colors, cm, refs=None):
        done = real_convert(text, colors, cm, refs=refs)
        decisions.setdefault(current[0], []).append(bool(done))
        return done

    convert.cetzmod.convert = recorded
    flat_src = os.path.join(ROOT, "_work", "flat")
    local = os.path.join(SB, "_flat_" + tag)
    os.makedirs(local, exist_ok=True)
    for name in names:
        dst = os.path.join(local, name + ".tex")
        if not os.path.exists(dst):
            shutil.copyfile(os.path.join(flat_src, name + ".tex"), dst)
        current[0] = name
        convert.convert_paper(dst, os.path.join(SB, "_out", tag, name), name)
    convert.cetzmod.convert = real_convert
    return decisions


names = json.load(open(os.path.join(SB, "_affected.json"), encoding="utf-8"))
live = run("tools", "live", names)
sb = run("_work" + os.sep + "pic-authmacros", "sandbox", names)
raw = re.compile(r'#raw\(block: true, lang: "latex"')
canvas = re.compile(r"#cetz\.canvas\(")
flips = regressions = 0
for name in names:
    a, b = live.get(name, []), sb.get(name, [])
    ty = open(os.path.join(SB, "_out", "live", name, "main.typ"), encoding="utf-8").read()
    ts = open(os.path.join(SB, "_out", "sandbox", name, "main.typ"), encoding="utf-8").read()
    same = [(i, x, y) for i, (x, y) in enumerate(zip(a, b)) if x != y]
    regressions += sum(1 for _, x, y in same if x and not y)
    flips += len(same)
    print("%-78s pics %d->%d | raw %d->%d | canvas %d->%d %s" % (
        name[:78], len(a), len(b), len(raw.findall(ty)), len(raw.findall(ts)),
        len(canvas.findall(ty)), len(canvas.findall(ts)),
        ("flips: " + str(same)) if same else ""))
print("pictures whose decision changed: %d, of which converted -> refused: %d" % (flips, regressions))
