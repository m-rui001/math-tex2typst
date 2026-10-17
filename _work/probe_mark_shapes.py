"""What head does each `mark:` spelling actually draw?

One canvas per spelling, one horizontal line. The head is the *filled* path fitz finds (the line
itself has no fill), so its bbox is the tip's length and width; `line` is the shortened stroke. A
spelling that compiles but draws no head shows `no head`. `mark:` must be an argument of `line`, not
a key inside `stroke:` -- nesting it there dies with "maximum function call depth exceeded".
"""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")

HEADER = '#import "@preview/cetz:0.5.0"\n'

SPELLINGS = [
    ('">"', 'mark: (end: ">")'),
    ('">" len2mm', 'mark: (end: (symbol: ">", length: 2mm))'),
    ('">" len5.7', 'mark: (end: (symbol: ">", length: 5.68pt, width: 4pt))'),
    ('">" scale2', 'mark: (end: (symbol: ">", scale: 2))'),
    ('stealth', 'mark: (end: "stealth")'),
    ('stealth len2mm', 'mark: (end: (symbol: "stealth", length: 2mm))'),
    ('stealth len5.7', 'mark: (end: (symbol: "stealth", length: 5.68pt, width: 4pt))'),
    ('curved-stealth', 'mark: (end: "curved-stealth")'),
    ('")>" len2mm', 'mark: (end: (symbol: ")>", length: 2mm))'),
    ('">" top len', 'mark: (end: ">", length: 2mm)'),
    ('bare len sibling', 'mark: (end: ">", length: 4mm)'),
]


def doc_for(extra):
    return (HEADER + "#set page(width: 12cm, height: 4cm)\n#cetz.canvas({\n"
            "  import cetz.draw: *\n"
            "  line((0, 0), (4, 0), stroke: (thickness: 0.4pt)%s)\n})\n"
            % (", " + extra if extra else ""))


def head(pdf):
    """(head length, head width, line length) in pt, from the filled path."""
    import fitz
    d = fitz.open(pdf)
    filled = [x for x in d[0].get_drawings() if x.get("fill") is not None]
    stroked = [x for x in d[0].get_drawings() if x.get("fill") is None]
    d.close()
    h = None
    if filled:
        r = max(filled, key=lambda x: x["rect"].width)["rect"]
        h = (r.width, r.height)
    line = max((x["rect"].width for x in stroked), default=0.0)
    return h, line


def compile_to(text, out):
    return subprocess.run(["typst", "compile", "--format", "pdf", "-", out],
                          input=text.encode("utf-8"), capture_output=True)


def main():
    tmp = tempfile.mkdtemp()
    out = os.path.join(tmp, "c.pdf")
    if compile_to(doc_for(""), out).returncode:
        print("control failed")
        return
    _h, control_line = head(out)
    print("control line %.2f pt" % control_line)
    for name, spec in SPELLINGS:
        out = os.path.join(tmp, "m.pdf")
        r = compile_to(doc_for(spec), out)
        if r.returncode:
            err = (r.stderr or b"").decode("utf-8", "replace")
            line = next((l for l in err.splitlines() if "error" in l),
                        (err.splitlines() or ["(no output)"])[0])
            print("%-16s FAIL  %s" % (name, line[:100]))
            continue
        h, line = head(out)
        if h is None:
            print("%-16s ok but NO HEAD drawn (line %.2f)" % (name, line))
            continue
        print("%-16s head %5.2f x %5.2f pt   line %.2f  (head takes %.2f)"
              % (name, h[0], h[1], line, control_line - line))


if __name__ == "__main__":
    main()
