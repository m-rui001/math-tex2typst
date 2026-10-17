r"""What the per-axis padding changes on the pages, and whether anything is lost by it.

The stub is the law as the emitter knew it before this round: read `inner sep` for both axes and ignore
`inner xsep` / `inner ysep`. Every canvas whose text differs under that stub is a page the regeneration
has to rewrite, and the line count is the face -- 42 framed nodes write their padding one axis at a time
(`_work/probe_padding_face.py`), so the diff should land on those and on the `text width` frames those
nodes sit in, which `node_frame_width` now widens by the horizontal axis.

LOST and GAINED are the two verdicts that matter more than the count: a canvas that built before and
refuses now means the emitted dictionary broke Typst, and a canvas that appears only under the stub means
the new code destroyed a picture that used to draw. The list of changed papers goes to
`_work/regen_needed.txt`, which is what `_work/regen_list.py` reads.
"""
import io
import pathlib
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
_live = cetz.node_padding


def old(o, xf):
    got = cetz._length(o.get("inner sep"), xf)
    return got, got


def main():
    verdicts = Counter()
    papers, lines, lost, gained, samples = set(), 0, [], [], []
    cetz.node_padding = old
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        for n, m in enumerate(PIC.finditer(src)):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), None)
            cetz.node_padding = old
            was = cetz.build(core) or cetz.build_cd(core)
            cetz.node_padding = _live
            now = cetz.build(core) or cetz.build_cd(core)
            if was is None and now is None:
                verdicts["refused both"] += 1
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
            papers.add(path.stem)
            for a, b in zip(was.splitlines(), now.splitlines()):
                if a != b:
                    lines += 1
                    if len(samples) < 6:
                        samples.append("- %s\n+ %s" % (a.strip()[:110], b.strip()[:110]))
    cetz.node_padding = _live
    print("canvas verdicts: %s" % dict(verdicts))
    print("changed canvases %d, papers %d, differing lines %d"
          % (verdicts["changed"], len(papers), lines))
    print("lost %d %s   gained %d %s" % (len(lost), lost[:6], len(gained), gained[:6]))
    for s in samples:
        print("  %s" % s)
    (ROOT / "_work" / "regen_needed.txt").write_text("\n".join(sorted(papers)), encoding="utf-8")
    print("wrote _work/regen_needed.txt with %d papers" % len(papers))


if __name__ == "__main__":
    main()
