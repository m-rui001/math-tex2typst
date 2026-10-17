import sys, os, io, subprocess, json
variant = sys.argv[1]
root = r"E:\math\_work\pic-scoped"
sys.path.insert(0, os.path.join(root, "pristine") if variant == "before" else root)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

real_run = subprocess.run
def stub(cmd, *a, **k):
    if isinstance(cmd, (list, tuple)) and cmd and str(cmd[0]) == "typst":
        return subprocess.CompletedProcess(cmd, 0, "", "")
    return real_run(cmd, *a, **k)
subprocess.run = stub

from t2t.convert import convert_paper

PAPERS = [
    "No-percolation-at-criticality-on-quasi-transitive-graphs-September-24-2026",
    "The-Deligne-Drinfeld-conjecture-September-23-2026",
]
out = {}
for name in PAPERS:
    out_dir = os.path.join(root, "typst_out", variant, name[:20])
    rep = convert_paper(os.path.join(root, "flat", name + ".tex"), out_dir,
                        "scoped-" + variant, keep_work=True)
    text = open(os.path.join(out_dir, "main.typ"), encoding="utf-8").read()
    out[name[:20]] = {"ok": rep.get("ok"), "raw": text.count('#raw(block: true, lang: "latex"'),
                      "canvas": text.count("#cetz.canvas")}
print(json.dumps(out, indent=1))
