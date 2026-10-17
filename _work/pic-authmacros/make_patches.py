r"""Write the output contract's patches.

`cetz.patch` is the family: `macros.py` (a control word is read the way TeX reads one) and
`convert.py` (a picture is expanded against its own figure's scope). difflib against the live
`tools/t2t/` file *as found*, `a/t2t/<name>` / `b/t2t/<name>`, so `patch -p1` from `tools/` applies
them; the same diffs also land in `<name>.patch` per file, which is what the previous writer left.

`cetz-orange.patch` is deliberately separate: one value of the shared `cetz.RGB` table, measured in
m_colors.tex, that 132 papers' pictures read. It is not this family's mechanism, so it is not folded
into the family's patch.
"""
import difflib
import pathlib

ROOT = pathlib.Path(__file__).parent
LIVE = ROOT.parent.parent / "tools" / "t2t"
FAMILY = ("macros.py", "convert.py")

combined = []
for name in FAMILY:
    old = (LIVE / name).read_text(encoding="utf-8").splitlines(True)
    new = (ROOT / "t2t" / name).read_text(encoding="utf-8").splitlines(True)
    diff = list(difflib.unified_diff(old, new, fromfile="a/t2t/" + name, tofile="b/t2t/" + name))
    (ROOT / (name + ".patch")).write_text("".join(diff), encoding="utf-8", newline="\n")
    combined += diff
    print(name, len(diff), "diff lines")
(ROOT / "cetz.patch").write_text("".join(combined), encoding="utf-8", newline="\n")
print("cetz.patch", len(combined), "diff lines")

old = (LIVE / "cetz.py").read_text(encoding="utf-8").splitlines(True)
new = (ROOT / "_orange" / "cetz.py.fixed").read_text(encoding="utf-8").splitlines(True)
diff = list(difflib.unified_diff(old, new, fromfile="a/t2t/cetz.py", tofile="b/t2t/cetz.py"))
(ROOT / "cetz-orange.patch").write_text("".join(diff), encoding="utf-8", newline="\n")
print("cetz-orange.patch", len(diff), "diff lines")
