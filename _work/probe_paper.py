"""Trace every picture formula one paper hands the emitter.

Run: python _work/probe_paper.py <paper-name-prefix>
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, convert as conv  # noqa: E402

name = sys.argv[1]
flat = next(p for p in (ROOT / "_work" / "flat").glob(name + "*.tex"))
out = ROOT / "_work" / "trace_out"

seen = []
real = cetz.convert


def logged(src):
    if cetz.PICTURE.search(src):
        got = real(src)
        seen.append((src, got))
        return got
    return real(src)


cetz.convert = logged
conv.convert_paper(str(flat), str(out), flat.stem)
print("picture formulas seen by math_text: %d, canvases: %d"
      % (len(seen), sum(1 for _s, g in seen if g)))
for src, got in seen:
    print("-" * 70)
    print("%s  %s" % ("CANVAS " if got else "REFUSED", repr(src[:200])))
    if got:
        continue
    env = cetz.CD_ENV.search(src)
    if not env:
        print("   no CD_ENV match; is it a tikzpicture? %s" % ("tikzpicture" in src))
        continue
    rest = src[:env.start()] + src[env.end():]
    print("   outside env: %r" % rest[:120])
    print("   build_cd(env alone): %s" % ("canvas" if cetz.build_cd(env.group(0)) else "none"))
