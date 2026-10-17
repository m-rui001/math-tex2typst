r"""#91 change surface: the pre-round emitter and the new one over the SAME 932 source pictures.

The round prices a pen by pgf name, folds the picture head's weight into the scope default, takes that
weight from an `every path` declaration when the picture writes one, and moves a node's border by half
the pen (`_outer_sep`).  Reading the diff as one number would hide which of these the page can actually
see, and the first three landed in run144 while the fourth has not been built yet -- so a copy of the
converter with the hunks reverted is loaded as a second module and every flat picture is built by both.

The reverts are textual and asserted: if a hunk does not land, the probe says so instead of measuring
the new code against itself.  Two sandboxes, two questions:

  LEGACY  = all four hunks out  -> the round's whole change surface, against run143;
  MID     = only `every path` out -> the papers run144 does not yet have right, i.e. the rebuild list.
"""
import io
import os
import re
import shutil
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

from t2t import cetz

# (new text, old text): the name table goes blind, the head stops seeding a weight, the weight stops
# coming from `every path`, and the border returns to reading `line width` as a transform-priced length
NAME_HUNK = ("""    for name in PGF_PEN_PT:
        if o.get(name) is True:
            return PGF_PEN_PT[name]
    width = o.get("line width")""",
             """    width = o.get("line width")""")
HEAD_HUNK = ("""    want = pen_width_pt(styles.get("every path") or head)
    if want is not None:
        pen["line width"] = "%gpt" % want
    if pen:""",
             """    if pen:""")
EVERY_HUNK = ("""    want = pen_width_pt(styles.get("every path") or head)""",
              """    want = pen_width_pt(head)""")
SEP_HUNK = ("""    want = pen_width_pt(o)
    return (want if want is not None else 0.4) * UNITS["pt"] / 2.0""",
            """    width = o.get("line width")
    if width is None or width is True:
        return PGF_LINE_WIDTH / 2.0
    got = _length(str(width), xf)
    return None if got is None else got / 2.0""")

REVERTS = {"legacy": [NAME_HUNK, HEAD_HUNK, SEP_HUNK],
           "mid": [EVERY_HUNK]}


def revert_copy(tag):
    build = tempfile.mkdtemp(prefix="m131_", dir=os.path.join(ROOT, "_work"))
    pkg = os.path.join(build, "t2" + tag)
    shutil.copytree(os.path.join(ROOT, "tools", "t2t"), pkg,
                    ignore=shutil.ignore_patterns("__pycache__"))
    text = io.open(os.path.join(pkg, "cetz.py"), encoding="utf-8").read()
    for new, old in REVERTS[tag]:
        if new not in text:
            raise SystemExit("revert hunk not found -- the probe would measure the new code: %r"
                             % new[:60])
        text = text.replace(new, old, 1)
    io.open(os.path.join(pkg, "cetz.py"), "w", encoding="utf-8").write(text)
    sys.path.insert(0, build)
    mod = __import__("t2" + tag + ".cetz", fromlist=["cetz"])
    return mod, build


TH = re.compile(r"thickness: ([0-9.]+)pt")
XY = re.compile(r"\(\s*[-+0-9.]+\s*,\s*[-+0-9.]+\s*\)")


def survey(other, tag):
    same = changed = heavier = moved = started = stopped = 0
    papers_weight, papers_moved, papers_new, papers_gone = set(), set(), set(), set()
    for fn in sorted(os.listdir(FLAT)):
        if not fn.endswith(".tex"):
            continue
        paper = fn[:-4]
        text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
        for pic in PIC.findall(text):
            got_new = cetz.build(pic)
            got_old = other.build(pic)
            if got_new is None and got_old is None:
                continue
            if got_new is None:
                stopped += 1
                papers_gone.add(paper)
                continue
            if got_old is None:
                started += 1
                papers_new.add(paper)
                continue
            if got_new == got_old:
                same += 1
                continue
            changed += 1
            if sorted(TH.findall(got_new)) != sorted(TH.findall(got_old)):
                heavier += 1
                papers_weight.add(paper)
            if sorted(XY.findall(got_new)) != sorted(XY.findall(got_old)):
                moved += 1
                papers_moved.add(paper)
    print("== %s: pictures answered for=%d unchanged=%d changed=%d started=%d stopped=%d"
          % (tag, same + changed + started + stopped, same, changed, started, stopped))
    print("   heavier or lighter rule=%d over %d papers" % (heavier, len(papers_weight)))
    print("   coordinates moved (a border by half the pen)=%d over %d papers"
          % (moved, len(papers_moved)))
    print("   starts drawing=%d over %d papers, stops drawing=%d over %d papers"
          % (started, len(papers_new), stopped, len(papers_gone)))
    return sorted(papers_weight | papers_moved | papers_new | papers_gone)


legacy, dir_l = revert_copy("legacy")
mid, dir_m = revert_copy("mid")
print("pre-round copy: %s\nrun144 copy:    %s" % (os.path.join(dir_l, "t2legacy"),
                                                  os.path.join(dir_m, "t2mid")))

whole = survey(legacy, "legacy (whole round, against run143)")
now = survey(mid, "mid (only `every path` still missing, against run144)")
io.open(os.path.join(ROOT, "_work", "regen_needed.txt"), "w",
        encoding="utf-8").write("\n".join(whole) + "\n")
io.open(os.path.join(ROOT, "_work", "regen_needed_91b.txt"), "w",
        encoding="utf-8").write("\n".join(now) + "\n")
print("papers to rebuild for the whole round=%d, for this hunk alone=%d" % (len(whole), len(now)))
for p in now:
    print("   %s" % p)
