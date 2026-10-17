# -*- coding: utf-8 -*-
import io, glob, os, json

D = "Uniform-quasipolynomial-time-trace-reconstruction-October-5-2026"
base = "E:/math/preprints/"
exact = os.path.isdir(base + D)
pref = D.replace("-October-5-2026", "")
sib = [os.path.basename(x) for x in glob.glob(base + pref + "*")]
files = []
for dp, dn, fn in os.walk(base + D + "/build"):
    for x in fn:
        if x.endswith(".tex"):
            files.append((os.path.relpath(os.path.join(dp, x), base + D).replace("\\", "/"),
                          os.path.getsize(os.path.join(dp, x)),
                          io.open(os.path.join(dp, x), encoding="utf-8", errors="replace").read().count("\n") + 1))
files.sort(key=lambda z: -z[1])
inf = io.open("E:/math/.tools/inflight.txt", encoding="utf-8").read().split()
disp = [l.split("\t")[0] for l in io.open("E:/math/.tools/dispatched.txt", encoding="utf-8").read().split("\n") if l.strip()]
out = io.open("E:/math/_work/precheck_D718.txt", "w", encoding="utf-8", newline="\n")
out.write("exact_dir=%s siblings=%d %s\n" % (exact, len(sib), json.dumps(sib, ensure_ascii=False)))
out.write("inflight=%s\nD718_in_dispatched=%s\n" % (inf, "D718" in disp))
out.write("note_files=%s\n" % [os.path.basename(x) for x in glob.glob("E:/math/研究笔记/D718-*.md")])
for f, sz, ln in files:
    out.write("%-42s %7dB %5dL\n" % (f, sz, ln))
out.close()
print("ok")
