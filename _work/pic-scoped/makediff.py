import difflib, os, io, sys
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
root = r"E:\math\_work\pic-scoped"
changed = []
for rel in ("t2t/cetz.py", "t2t/convert.py", "t2t/prep.py", "t2t/emit.py",
            "t2t/mathconv.py", "t2t/macros.py", "t2t/texutil.py"):
    a = open(os.path.join(root, "pristine", rel.replace("/", os.sep)), encoding="utf-8").readlines()
    b = open(os.path.join(root, rel.replace("/", os.sep)), encoding="utf-8").readlines()
    if a != b:
        changed.append(rel)
        diff = difflib.unified_diff(a, b, fromfile="a/" + rel, tofile="b/" + rel)
        out = os.path.join(root, os.path.basename(rel).rsplit(".", 1)[0] + ".patch")
        with open(out, "w", encoding="utf-8", newline="\n") as fh:
            fh.writelines(diff)
        print("wrote", out)
print("changed files:", changed)
