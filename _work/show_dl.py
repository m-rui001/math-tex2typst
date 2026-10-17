import sys, tempfile, pathlib
sys.path.insert(0, "tools")
from t2t.convert import convert_paper
tex = pathlib.Path("_work/dl_sample.tex").read_text(encoding="utf-8")
with tempfile.TemporaryDirectory() as folder:
    src = pathlib.Path(folder, "paper.tex"); src.write_text(tex, encoding="utf-8")
    out = pathlib.Path(folder, "output")
    convert_paper(str(src), str(out), "dl")
    for line in (out / "main.typ").read_text(encoding="utf-8").split("\n"):
        if "alpha" in line or "z = 3" in line:
            print(repr(line))
