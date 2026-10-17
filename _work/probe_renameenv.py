"""Would renaming a custom float env to `figure` keep both the picture and the caption?

The `fixedfigure` env is defined with `\newenvironment` in the paper's own preamble, so pandoc never
learns it is a float and `lift_captions` cannot pair its caption with its picture. This rewrites the
flat source (drop the definition, rename the usages) into a scratch file and converts that.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper  # noqa: E402

NAME = "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions-September-24-2026"
ENV = "fixedfigure"

src = (ROOT / "_work" / "flat" / (NAME + ".tex")).read_text(encoding="utf-8", errors="replace")
# drop the env definition, then rename its uses
src = re.sub(r"\\newenvironment\{%s\}(\[[^\]]*\])?\{.*?\}\{.*?\}\s*" % ENV, "", src, flags=re.S)
src = re.sub(r"\\(begin|end)\{%s\}" % ENV, r"\\\1{figure}", src)

scratch = ROOT / "_work" / "_envchk2" / (NAME + ".tex")
scratch.parent.mkdir(parents=True, exist_ok=True)
scratch.write_text(src, encoding="utf-8")
out = ROOT / "_work" / "_envchk2" / NAME
out.mkdir(parents=True, exist_ok=True)
rep = convert_paper(str(scratch), str(out), NAME)
print("ok", rep.get("ok"), "compile_ok", rep.get("compile_ok"))
main = (out / "main.typ").read_text(encoding="utf-8", errors="replace")
print("empty figures:", len(re.findall(r"#figure\(\s*\[\],", main)))
print("caption kept:", "tree in one depth" in main)
print("canvases:", len(re.findall(r"#cetz\.canvas", main)))
i = main.find("#figure(")
print(main[i:i + 260] if i >= 0 else "(no #figure)")
