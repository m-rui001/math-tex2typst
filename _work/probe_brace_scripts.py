"""Where do brace-wrapped scripts sit, and do they print?

Measured on this toolchain's typst 0.15.1 (`_work/brace_probe2.typ`, read at 400 dpi): `$x_{i+1}$`
raises `i+1` correctly but ALSO draws the braces, while `$x_i$` is clean. So a script written as a
group shows its group. The corpus emits `_{...}` 746 times -- this asks where those live, because the
answer decides the fix: inside a `cetz.canvas(` line it is cetz's own math emitter, outside it is the
body math converter, and the two are different code paths with different blast radii.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
from probe_tip_product import CLOSE, OPEN  # noqa: E402  (one canvas grammar, two gauges)

SCRIPT = re.compile(r"[\^_]\{[^{}]*\}")


def canvas_lines(typ):
    """The set of line numbers that belong to a canvas body."""
    out = set()
    start = None
    for i, line in enumerate(typ.splitlines()):
        if start is None:
            if OPEN.search(line):
                start = i
        else:
            out.add(i)
            if CLOSE.match(line):
                start = None
    return out


def main():
    in_canvas = out_canvas = 0
    papers_in = set()
    papers_out = set()
    samples = []
    for path in sorted((ROOT / "typst").glob("*/main.typ")):
        typ = path.read_text(encoding="utf-8", errors="replace")
        inside = canvas_lines(typ)
        for i, line in enumerate(typ.splitlines()):
            n = len(SCRIPT.findall(line))
            if not n:
                continue
            if i in inside:
                in_canvas += n
                papers_in.add(path.parent.name)
            else:
                out_canvas += n
                papers_out.add(path.parent.name)
            if len(samples) < 12:
                samples.append(("canvas" if i in inside else "body",
                                path.parent.name[:40], line.strip()[:150]))
    print("brace scripts inside a cetz canvas: %d over %d papers" % (in_canvas, len(papers_in)))
    print("brace scripts outside a canvas     : %d over %d papers" % (out_canvas, len(papers_out)))
    for kind, paper, line in samples:
        print("   %-6s %-40s %s" % (kind, paper, line))
    return 0


if __name__ == "__main__":
    sys.exit(main())
