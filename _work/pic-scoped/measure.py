import subprocess, re, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
for name in ["m_rotate_expr", "m_shift_name"]:
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                        r"E:\math\_work\pic-scoped", r"E:\math\_work\pic-scoped\%s.tex" % name],
                       capture_output=True, text=True, cwd=r"E:\math\_work\pic-scoped")
    log = open(r"E:\math\_work\pic-scoped\%s.log" % name, encoding="utf-8", errors="replace").read()
    print("=====", name, "rc=", r.returncode)
    for line in log.splitlines():
        if re.match(r"^(CAL|EXPR|LIT|DEG|ORIGIN|NODE|NAMED|PAIR)", line.strip()):
            print(line.strip())
        # typeout lines can wrap; also scan the flat log for the markers
    for m in re.finditer(r"(?m)^\s*([A-Z]+[^\s=][^|]*)$", log):
        pass
