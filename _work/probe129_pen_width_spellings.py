r"""#91's face: every pen WIDTH the corpus writes, by SITE and by SPELLING.

`stroke_args` prices a rule from one key, `line width`, and reads only a bare number with pt/mm/cm.
A picture that fixes its pen on its own brackets, a statement that says `[thick]`, a length written in
`bp` or `in`, a value carried by a `/.style` -- all four are silence to that reader.  The site question
comes first, because #90 measured that a head pen key is pgf's SCOPE default and reaches every statement
AND every node frame (`_work/measure91_pen_widths.py` section B).

Everything is counted out of the option tables the emitter itself parses -- `cetz._opts_at` for a
bracketed group, `cetz.picture_styles` for a `/.style` table, `cetz.split_statements` for the statements
-- never by grepping the source for a keyword (轴: 面必须由选项表数).  Two readings per statement: what it
writes itself, and what `resolve_opts` hands the emitter after styles are merged.
"""
import io
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
PEN_NAMES = ["ultra thin", "ultra thick", "very thick", "semithick", "thick", "thin"]
# pgf's own silence prices a rule at 0.4pt on the page (`_work/measure91_pen_widths.py` reads the same
# 0.398pt the converter's DEFAULT_RULE_PT answers), so a pen at or under it changes no ink.
DEFAULT_PT = 0.4

from t2t import cetz


def shape(value):
    """How a width value is written -- the answer decides what the reader must learn."""
    if not isinstance(value, str):
        return "bare-key"
    v = value.strip()
    m = re.fullmatch(r"([0-9.]*)([a-zA-Z\\]+)", v)
    if m:
        return "length+" + m.group(2)
    if v in PEN_NAMES:
        return "name:" + v
    return "other:" + v


def classify(opts):
    """The width shape one option table carries, or None."""
    if not isinstance(opts, dict):
        return None
    if "line width" in opts:
        return shape(opts.get("line width"))
    for name in PEN_NAMES:
        if opts.get(name) is True:
            return "name:" + name
    return None


def weight(opts):
    """The weight one option table asks for, in page pt -- read by the emitter's own pen reader."""
    return cetz.pen_width_pt(opts) if isinstance(opts, dict) else None


def above_by_name(opts):
    """Does this table ask for a weight above the default BY PEN NAME rather than by a length?"""
    w = weight(opts)
    return w is not None and w > DEFAULT_PT + 1e-9 and \
        not isinstance(opts.get("line width"), str)


def main():
    own, merged, heads, styles = Counter(), Counter(), Counter(), Counter()
    carried = Counter()
    verdict = Counter()
    cause = Counter()
    transform = Counter()
    pics = 0
    papers = set()
    papers_lost = set()
    ex = {}
    worst = []
    for fn in sorted(os.listdir(FLAT)):
        if not fn.endswith(".tex"):
            continue
        stem = fn[:-4]
        text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
        for pic in PIC.findall(text):
            m = re.match(r"\\begin\{tikzpicture\}", pic)
            if not m:
                continue
            pics += 1
            body = pic[m.end():].lstrip()
            head, pos = cetz._opts_at(body, 0)
            if head is None:
                continue
            got = classify(head)
            if got:
                heads[got] += 1
                ex.setdefault(("head", got), stem)
            styles_tbl = cetz.picture_styles(head)
            for name, table in styles_tbl.items():
                s = classify(table)
                if s:
                    styles["%s" % s] += 1
                    ex.setdefault(("style", s), stem)
            any_width = bool(got)
            want_head = weight(head)
            want_stmt = None
            # is the demand above pgf's default spelled as a bare pen NAME anywhere?  that is the
            # second mechanism of this round, and the one the §7 row from #90 never counted
            name_demand = above_by_name(head) or any(above_by_name(t)
                                                    for t in styles_tbl.values())
            for stmt in cetz.split_statements(body[pos:]):
                # the emitter's own reading: a control word, then its leading option group
                sm = re.match(r"\\(draw|filldraw|fill|path|node|coordinate)\b\s*", stmt)
                if not sm:
                    continue
                o, _pos = cetz._opts_at(stmt, sm.end())
                if o is None:
                    continue
                s = classify(o)
                if s:
                    own[s] += 1
                    ex.setdefault(("own", s), stem)
                    any_width = True
                mo = cetz.resolve_opts(dict(o), styles_tbl, sm.group(1) == "node")
                m2 = classify(mo)
                if m2:
                    merged[m2] += 1
                    ex.setdefault(("merged", m2), stem)
                    any_width = True
                if above_by_name(o) or above_by_name(mo):
                    name_demand = True
                w = weight(mo)
                if w is not None and (want_stmt is None or w > want_stmt):
                    want_stmt = w
            # the picture's own brackets are pgf's scope default, so a statement that writes no pen
            # asks for the head's weight; take the two sites apart to know what to implement
            want = max(w for w in (want_head, want_stmt) if w is not None) \
                if (want_head is not None or want_stmt is not None) else None
            if want is not None and want > DEFAULT_PT + 1e-9:
                built = cetz.build(pic)
                if built is None:
                    verdict["head asks above default but picture refuses today"] += 1
                else:
                    th = [float(x) for x in re.findall(r"thickness: ([0-9.]+)pt", built)]
                    got_w = max(th) if th else 0.0
                    head_above = want_head is not None and want_head > DEFAULT_PT + 1e-9
                    stmt_above = want_stmt is not None and want_stmt > DEFAULT_PT + 1e-9
                    site = ("head only" if head_above and not stmt_above else
                            ("both head and statement/style"
                             if head_above and stmt_above else "statement/style only"))
                    key = "%s: %s" % (site, "carries it" if got_w >= want * 0.9 else "LOSES it")
                    verdict[key] += 1
                    if got_w < want * 0.9:
                        papers_lost.add(stem)
                        worst.append((stem, round(want, 3), round(got_w, 3), site))
                        cause["spelled as a pgf pen NAME" if name_demand else
                              ("spelled as a length on the picture head"
                               if want_head is not None and want_head > DEFAULT_PT + 1e-9
                               else "spelled as a length carried by a style")] += 1
            if any_width:
                papers.add(stem)
                if any(k in head for k in ("scale", "x", "y", "xslant", "yslant", "rotate")):
                    transform[stem] += 1
                built = cetz.build(pic)
                if built is None:
                    carried["picture refuses today"] += 1
                    continue
                th = [float(x) for x in re.findall(r"thickness: ([0-9.]+)pt", built)]
                carried["canvas carries a weight above 0.4pt"
                         if th and max(th) > 0.4001 else
                         "canvas at the 0.4pt default everywhere"] += 1

    print("pictures scanned: %d   papers writing a pen width: %d" % (pics, len(papers)))
    print("carried on the canvas: %s" % dict(carried))
    print("\n== per picture, the weight asked for above pgf's default (0.4pt):")
    for k, v in sorted(verdict.items(), key=lambda x: -x[1]):
        print("   %-52s %4d" % (k, v))
    print("   papers losing at least one: %d" % len(papers_lost))
    print("   by spelling of the demand: %s" % dict(cause))
    print("   papers that write a pen AND a picture-head transform (`scale=`, an axis unit, a slant "
          "or a rotate): %d -- a pen is an absolute page length, so a transform must not reprice it"
          % len(transform))
    for w in sorted(worst, key=lambda x: -(x[1] - x[2]))[:10]:
        print("      %-58s want=%-7s got=%-7s %s" % w)
    for label, code, table in (("picture head", "head", heads),
                               ("statement's own group", "own", own),
                               ("after style merge", "merged", merged),
                               ("/.style definition", "style", styles)):
        print("\n== %s" % label)
        for k, v in table.most_common():
            print("   %-26s %5d   e.g. %s" % (k, v, ex.get((code, k), "-")))


if __name__ == "__main__":
    main()
