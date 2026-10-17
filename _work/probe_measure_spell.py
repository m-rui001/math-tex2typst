"""Find a Typst spelling that grows a box to the wider of a declared width and its own text.

`#context { let … box(width: max(…, measure(…).first().x)) }` failed to parse (`unclosed
delimiter`), so the candidates are tried one at a time and typst's own words are printed.
"""
import pathlib
import subprocess
import sys
import tempfile

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

TEXT = "Finite FK comparisons#linebreak()rectangles and sectors"
CANDS = {
    "block": "#context { let _t = [%s]; box(width: max(3.552cm, measure(_t).first().x + 0.6666em), "
             "inset: 0.3333em, stroke: (thickness: 0.4pt), [_t]) }" % TEXT,
    "hash": "#context #{ let _t = [%s]; box(width: max(3.552cm, measure(_t).first().x + 0.6666em), "
            "inset: 0.3333em, stroke: (thickness: 0.4pt), [_t]) }" % TEXT,
    "inline": "#context box(width: max(3.552cm, measure([%s]).first().x + 0.6666em), "
              "inset: 0.3333em, stroke: (thickness: 0.4pt), [%s])" % (TEXT, TEXT),
    "nolead": "#context { let _t = {%s}; box(width: max(3.552cm, measure(_t).first().x + 0.6666em), "
              "inset: 0.3333em, stroke: (thickness: 0.4pt), [_t]) }" % TEXT,
    "ctx-fn": "#let _t = [%s]#context box(width: max(3.552cm, measure(_t).first().x + 0.6666em), "
              "inset: 0.3333em, stroke: (thickness: 0.4pt), [_t])" % TEXT,
}
DOC = cetz.HEADER + "#set page(width: 20cm, height: 4cm, margin: 0pt)\n#set text(size: 9.6pt)\n%s\n"

with tempfile.TemporaryDirectory() as tmp:
    for name, src in CANDS.items():
        f = pathlib.Path(tmp) / ("%s.typ" % name)
        f.write_text(DOC % src, encoding="utf-8")
        out = f.with_suffix(".pdf")
        r = subprocess.run(["typst", "compile", str(f), str(out)], capture_output=True)
        err = r.stderr.decode("utf-8", "replace")
        line = [l.strip() for l in err.splitlines() if l.strip().startswith("error")]
        print("%-7s %s %s" % (name, "OK" if r.returncode == 0 else "FAIL",
                              (line[0] if line else "")[:160]))
