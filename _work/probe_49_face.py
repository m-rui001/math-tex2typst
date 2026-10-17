r"""What #49 changes on the pages, measured against the converter's own previous law.

Two legs, two instruments, run over the SAME picture so neither misses what the other fires on:

LEG (b) is a stroke rule, and `box_args` is a pure function of the node's options, so the old law can
be re-run as a stub -- "the frame gets `stroke: (thickness: 0.4pt)` unless the author sized a border" --
and every canvas that comes out different under it is a page the regeneration has to rewrite. The stub
also gives the two verdicts that matter more than the count: LOST (built before, refuses now) and
GAINED (the new code broke a picture that used to draw).

LEG (a) is a lookup inside one statement parser, which no stub can reach, so it is counted where it
lives: a `node[<name>]` written between two coordinates whose bracket names a `/.style` the picture
head declares. Before the round those options vanished whole. The count is NODES, one per bracket, and
it is taken whether or not the stroke leg fired on the same canvas -- an earlier run of this probe
put it after the identical-canvas `continue` and so reported only the 18 papers where both legs acted.

The canvas builds come from the flat source with the batch's own column width (`line_cm`), because a
`\linewidth`-sized picture will not build without it -- the #45 trap, where a probe reported the whole
page stale. Writes `_work/regen_needed.txt`.
"""
import pathlib
import re
import sys
from collections import Counter

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BEGIN = re.compile(r"\\begin\{tikzpicture\}")
# an in-path node: the word `node` not introducing a `\node` statement
INPATH = re.compile(r"(?<!\\)\bnode\s*(\[[^\]]*\])?(\[[^\]]*\])?")
_live_box = cetz.box_args


def old_box_args(o, pal):
    framed = ["inset: " + cetz.node_inset(o)]
    rc = o.get("rounded corners")
    if rc is True:
        framed.append("radius: 4pt")
    elif rc is not None:
        cm = cetz._length(str(rc), cetz.IDENT)
        if cm is not None:
            framed.append("radius: %.4gpt" % (cm * 28.346))
    framed += (cetz.stroke_args(o, pal, bare=True) or ["stroke: (thickness: 0.4pt)"])
    return framed


def main():
    verdicts = Counter()
    stroke_papers, lines, lost, gained, samples = set(), 0, [], [], []
    style_papers, style_nodes = set(), 0

    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        try:
            wide = line_cm(prep.parse_preamble(src))
        except Exception:
            wide = None
        for n, m in enumerate(PIC.finditer(src)):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)

            # leg (a): an in-path node whose bracket names a style the picture head declares
            hm = BEGIN.match(core)
            head, _p = cetz._opts_at(core[hm.end():].lstrip(), 0)
            styles = cetz.picture_styles(head or {})
            for mm in INPATH.finditer(core):
                fired = False
                for grp in mm.groups():
                    if not grp:
                        continue
                    for key, val in cetz.opts(grp[1:-1]).items():
                        if val is True and key in styles:
                            fired = True
                if fired:
                    style_nodes += 1
                    style_papers.add(path.stem)

            # leg (b): the same canvas under the old stroke law and the new one
            cetz.box_args = old_box_args
            was = cetz.build(core)
            cetz.box_args = _live_box
            now = cetz.build(core)
            if was is None and now is None:
                continue
            if was is not None and now is None:
                lost.append("%s pic%d" % (path.stem[:44], n))
                verdicts["LOST"] += 1
                continue
            if was is None and now is not None:
                gained.append("%s pic%d" % (path.stem[:44], n))
                verdicts["GAINED"] += 1
                continue
            if was == now:
                verdicts["identical"] += 1
                continue
            verdicts["changed"] += 1
            stroke_papers.add(path.stem)
            for a, b in zip(was.splitlines(), now.splitlines()):
                if a != b:
                    lines += 1
                    if len(samples) < 4:
                        samples.append("- %s\n+ %s" % (a.strip()[:120], b.strip()[:120]))

    cetz.box_args = _live_box
    papers = stroke_papers | style_papers
    print("stroke-leg canvas verdicts: %s" % dict(verdicts))
    print("stroke-leg changed canvases %d, papers %d, differing lines %d"
          % (verdicts["changed"], len(stroke_papers), lines))
    print("lost %d %s   gained %d %s" % (len(lost), lost[:6], len(gained), gained[:6]))
    print("in-path nodes that name a declared style: %d nodes in %d papers"
          % (style_nodes, len(style_papers)))
    for s in samples:
        print("  %s" % s)
    (ROOT / "_work" / "regen_needed.txt").write_text("\n".join(sorted(papers)), encoding="utf-8")
    print("regen list: %d papers (%d by the stroke leg, %d by the style leg, %d in both)"
          % (len(papers), len(stroke_papers), len(style_papers),
             len(stroke_papers & style_papers)))


if __name__ == "__main__":
    main()
