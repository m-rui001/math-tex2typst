r"""#91's second oracle: does an `every path` / `every edge` style definition price the pen on the page?

The round's face instrument found the spelling the head-census could not see: a weight written inside
a style DEFINITION the author never invokes -- `every path/.style={line width=.6pt}` on the picture's
brackets (12 definitions / 8 papers, heaviest 0.8pt; `every edge` 2 / 2) -- and those pictures answer
0.4pt on the page.  pgf applies `every path` to a path without being told, so before deciding whether
that is a scope default like the head's own key (which #91 folded into `styles["picture"]`) or
something with its own precedence, the page has to say:

  A. which statements an `every path` width reaches -- a plain path, a `to`, an arrow, a node frame;
  B. what outranks it -- the statement's own key, a style the statement invokes, the head's own key;
  C. whether `every edge` is the same thing as `every path` (pgf's manual splits `--` operators from
     whole paths, and the corpus writes both).

One case per page (the lesson of #43: a rule's colour or its order on a shared page both have to be
decoded, and a decoded pairing is a hypothesis).  fitz reads `get_drawings()['width']`.
"""
import io
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "measure91_every_path_run.txt")


def doc(body):
    return ("\\documentclass[10pt]{article}\n\\usepackage{tikz}\n\\usetikzlibrary{positioning}\n"
            "\\pagestyle{empty}\\begin{document}\n" + body + "\\end{document}\n")


def run(path, tex):
    io.open(path + ".tex", "w", encoding="utf-8").write(tex)
    if os.path.exists(path + ".pdf"):
        os.remove(path + ".pdf")
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                        os.path.dirname(path), os.path.basename(path) + ".tex"],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not os.path.exists(path + ".pdf"):
        sys.stderr.write("pdflatex failed for %s (rc=%s)\n" % (path, r.returncode))
        return None
    return path + ".pdf"


def widths(pdf):
    """[(page index, y in page pt, stroke width)] for every single-segment horizontal rule."""
    import fitz
    d = fitz.open(pdf)
    out = []
    for i, page in enumerate(d):
        for dr in page.get_drawings():
            items = dr["items"]
            if len(items) == 1 and items[0][0] == "l":
                p0, p1 = items[0][1], items[0][2]
                if abs(p1.y - p0.y) < 0.01:
                    out.append((i, round(p0.y, 2), dr["width"]))
    d.close()
    return out


def all_shapes(pdf, page_index):
    """Every drawn path on one page, with its items and width -- for the node-frame cases."""
    import fitz
    d = fitz.open(pdf)
    rows = []
    for dr in d[page_index].get_drawings():
        rows.append(("".join(x[0] for x in dr["items"]), dr["width"],
                     [round(v, 2) for v in (dr["rect"].x0, dr["rect"].y0,
                                            dr["rect"].x1, dr["rect"].y1)]))
    d.close()
    return rows


def main():
    tmp = tempfile.mkdtemp(prefix="m91ep_", dir=os.path.join(ROOT, "_work"))
    log = io.open(OUT, "w", encoding="utf-8")

    def say(msg):
        print(msg)
        log.write(msg + "\n")

    say("== A: `every path/.style={line width=2pt}` on the picture brackets -- what does it reach?")
    cases = [
        ("plain path", "\\draw (0,1) -- (6,1);"),
        ("statement writes 0.4pt", "\\draw[line width=0.4pt] (0,1) -- (6,1);"),
        ("statement writes thin", "\\draw[thin] (0,1) -- (6,1);"),
        ("to/bend", "\\draw (0,1) to[bend left] (6,1);"),
        ("arrow", "\\draw[->] (0,1) -- (6,1);"),
        ("double", "\\draw (0,1) -- (6,1) -- (0,2);"),
        ("fill", "\\fill[blue] (0,1) -- (6,1) -- (3,2) -- cycle;"),
        ("node frame", "\\node[draw] at (3,1) {X};"),
        ("circle node", "\\node[draw, circle] at (3,1) {Y};"),
        ("edge between nodes", "\\node (a) at (0,1) {A};\\node (b) at (6,1) {B};\\draw (a) -- (b);"),
    ]
    body = []
    for label, stmt in cases:
        body.append("\\begin{tikzpicture}[every path/.style={line width=2pt}]\n  %s\n"
                    "\\end{tikzpicture}\n\\newpage" % stmt)
    pdf = run(os.path.join(tmp, "a"), doc("".join(body)))
    if pdf is None:
        say("   pdflatex produced nothing -- no readings")
        return
    for i, (label, stmt) in enumerate(cases):
        rows = all_shapes(pdf, i)
        say("   %-26s  %s" % (label, "; ".join("%s w=%s r=%s" % (k, "None" if w is None
                                                                  else "%.3f" % w, r)
                                               for k, w, r in rows[:5]) or "NOTHING DRAWN"))

    say("")
    say("== B: precedence -- `every path` against the head's own key and an invoked style")
    for head, stmt, why in [
            ("every path/.style={line width=2pt}, line width=1pt", "\\draw (0,1) -- (6,1);",
             "head key vs every path"),
            ("every path/.style={line width=2pt}, my/.style={line width=0.8pt}", "\\draw[my] (0,1) -- (6,1);",
             "invoked style vs every path"),
            ("my/.style={line width=0.8pt}, every path/.style={line width=2pt}", "\\draw[my] (0,1) -- (6,1);",
             "same pair, written the other way round"),
            ("every path/.style={ultra thick}", "\\draw (0,1) -- (6,1);",
             "every path carries a NAME"),
            ("every path/.style={line width=2pt}", "\\draw[ultra thin] (0,1) -- (6,1);",
             "statement name vs every path length"),
            ("every node/.style={line width=2pt}", "\\node[draw] at (3,1) {X};",
             "every node on a frame"),
            ("every node/.style={line width=2pt}, line width=1pt", "\\draw (0,1) -- (6,1);",
             "every node must NOT reach a path"),
            ("every path/.style={line width=2pt}, line cap=round", "\\draw (0,1) -- (6,1);",
             "every path width with a head cap key"),
    ]:
        pdf = run(os.path.join(tmp, "b"), doc("\\begin{tikzpicture}[%s]\n  %s\n\\end{tikzpicture}"
                                              % (head, stmt)))
        rows = [r for r in all_shapes(pdf, 0)] if pdf else []
        say("   %-40s %-42s -> %s" % (
            why, head[:42], "; ".join("%s w=%s" % (k, "None" if w is None else "%.3f" % w)
                                      for k, w, _r in rows[:4]) or "NOTHING DRAWN"))

    say("")
    say("== C: `every edge` -- is it the same rule as `every path`?")
    for head, stmt, why in [
            ("every edge/.style={line width=2pt}", "\\draw (0,1) -- (6,1);",
             "an edge written inside a path"),
            ("every edge/.style={line width=2pt}", "\\path (0,1) edge (6,1);",
             "an `edge` operator"),
            ("every edge/.style={line width=2pt}", "\\draw (0,1) edge (6,1);",
             "edge drawn as a path"),
            ("every path/.style={line width=0.4pt}, every edge/.style={line width=2pt}",
             "\\draw (0,1) -- (6,1);", "both, plain path"),
            ("every path/.style={line width=0.4pt}, every edge/.style={line width=2pt}",
             "\\draw (0,1) edge (6,1);", "both, edge operator"),
    ]:
        pdf = run(os.path.join(tmp, "c"), doc(
            "\\begin{tikzpicture}[%s]\n  %s\n\\end{tikzpicture}" % (head, stmt)))
        read = widths(pdf) if pdf else []
        say("   %-28s %-56s -> %s" % (why, stmt[:56],
                                      " ".join("%.3f" % w for _i, _y, w in read) or "NO RULE"))

    log.close()
    print("log: " + OUT)


if __name__ == "__main__":
    main()
