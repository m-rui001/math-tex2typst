"""Does Typst accept a script attached to a quoted word, as `"alpha"_r`?

One compile per spelling; run it before any label change ships, because the emitter would
otherwise put the string in front of 724 papers.
"""
import pathlib
import subprocess

ROOT = pathlib.Path(__file__).resolve().parents[1]
CASES = {
    "quoted-word-script": '$"alpha"_r$',
    "plain-script": "$alpha_r$",
    "quoted-word-bar": '$"alpha" dot.op "x"$',
    "script-of-group": '$\"alpha\"_(r)$',
}
out = ROOT / "_work" / "typst_script_probe.typ"
for name, body in CASES.items():
    out.write_text("#set page(width: 6cm, height: 3cm)\n" + body + "\n", encoding="utf-8")
    proc = subprocess.run(["typst", "compile", str(out), str(out.with_suffix(".pdf"))],
                          capture_output=True, text=True)
    print("%-22s %s" % (name, "ok" if proc.returncode == 0 else
                        "REJECTED: " + " ".join(proc.stderr.split())[:110]))
