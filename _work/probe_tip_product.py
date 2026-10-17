"""Product-side re-measure for axis 21 (#43).

The census (``probe_tip_default_face.py``) reads what ``cetz.build`` returns; this reads the emitted
``main.typ``, i.e. what is on the page. Two numbers are wanted:

* how many ``mark:`` lines carry an explicit ``symbol:`` -- a named head, filled and shaped;
* whether any canvas that got such a named head ALSO still carries a bare ``">"``/``"<"`` mark, which
  would be a reheading that landed on some arrows of a picture and not the rest.

The second test attributes marks to canvases, not papers: a picture that sets ``>=`` should have every
one of its ``->`` arrows reheaded. A canvas with no ``symbol:`` line at all is either an unset picture
(bare V is correct there) or one whose marks are ``|``/``[``/``+`` sides, and is not counted. Any
canvas flagged by the test is printed in full, because an explicit ``-{Stealth}`` on a single statement
in an otherwise-unset picture produces the same signature without being a bug.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
TYPST = ROOT / "typst"
FLAT = ROOT / "_work" / "flat"

SYMBOL = re.compile(r"symbol:")
ANGLE = re.compile(r'"[<>]"')
OPEN = re.compile(r"cetz\.canvas\(")
CLOSE = re.compile(r"^\s*\}\)")


def canvases(typ):
    """Split a main.typ into canvas bodies by line position. Counting parens would not do: the
    emitted symbols are strings like ")>", whose bracket is not a delimiter."""
    out = []
    body = None
    for line in typ.splitlines():
        if body is None:
            if OPEN.search(line):
                body = [line]
        else:
            body.append(line)
            if CLOSE.match(line):
                out.append(body)
                body = None
    return out


def main():
    papers = sorted(p.stem for p in FLAT.glob("*.tex")
                    if ">=" in p.read_bytes().decode("utf-8", "replace"))
    named = bare = 0
    marked_canvases = mixed = 0
    flags = []
    for name in papers:
        typ_path = TYPST / name / "main.typ"
        if not typ_path.is_file():
            flags.append(("NO PRODUCT", name, ""))
            continue
        typ = typ_path.read_text(encoding="utf-8", errors="replace")
        for body in canvases(typ):
            has_symbol = has_angle = False
            for line in body:
                if "mark:" not in line:
                    continue
                if SYMBOL.search(line):
                    named += 1
                    has_symbol = True
                elif ANGLE.search(line):
                    bare += 1
                    has_angle = True
            if has_symbol:
                marked_canvases += 1
            if has_symbol and has_angle:
                mixed += 1
                flags.append(("MIXED", name, "\n".join(body)[:400]))
    print("papers whose source writes `>=` at all: %d" % len(papers))
    print("`mark:` lines with an explicit symbol:  %d" % named)
    print("`mark:` lines with a bare > or < in a declaring paper: %d" % bare)
    print("canvases carrying a named head: %d  (of which also a bare head: %d)"
          % (marked_canvases, mixed))
    for kind, name, blob in flags[:6]:
        print("--- %s %s\n%s" % (kind, name, blob))
    if len(flags) > 6:
        print("--- ... %d more" % (len(flags) - 6))
    return 0


if __name__ == "__main__":
    sys.exit(main())
