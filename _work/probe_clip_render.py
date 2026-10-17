import subprocess, sys, tempfile, pathlib
sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz

src = pathlib.Path(
    "preprints/Self-dual-random-cluster-interfaces-below-one-September-23-2026/"
    "build/figures/dependencies.tex").read_text(encoding="utf-8")
start = src.index("\\begin{tikzpicture}")
end = src.index("\\end{tikzpicture}") + len("\\end{tikzpicture}")
canvas = cetz.build(src[start:end])
tmp = pathlib.Path("_work/_clipchk")
tmp.mkdir(parents=True, exist_ok=True)
typ = tmp / "t.typ"
typ.write_text(cetz.HEADER + "#set page(width: 420pt, height: 320pt)\n" + canvas,
               encoding="utf-8")
r = subprocess.run(["typst", "compile", str(typ), str(tmp / "t.pdf")], capture_output=True)
print("rc", r.returncode)
print(r.stderr.decode("utf-8", "replace")[:2000])
if r.returncode == 0:
    import pymupdf
    doc = pymupdf.open(str(tmp / "t.pdf"))
    doc[0].get_pixmap(matrix=pymupdf.Matrix(2.4, 2.4)).save("_work/clip_check.png")
    print("wrote _work/clip_check.png")
