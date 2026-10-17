"""The 10 real rotated+anchored nodes of `_work/m100_rot_anchor.tsv`: where their text ink
falls relative to the declared point, measured on a one-node control page.

The ruler is `probe101a_rot_variants.ink_offsets()` -- the same span-bbox union, not a copy.
For each tsv row the node's real text is recovered from `_work/flat/<paper>.tex` by matching
both the option string and the declared coordinate, then the statement is typeset alone:

    \\fill (x,y) circle (1.2pt);
    \\node[<full option string>] at (x,y) {<real text>};

The second page is the control: same text, same inner sep / font, `anchor=center`, no rotate.

  PYTHONIOENCODING=utf-8 python _work/probe101b_pgf_nodes.py 2> _work/m101_err.txt
      # -> _work/label101b_pgf_nodes.txt
"""
import datetime
import io
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
TSV = os.path.join(HERE, "m100_rot_anchor.tsv")
FLAT = os.path.join(HERE, "flat")
OUT = os.path.join(HERE, "label101b_pgf_nodes.txt")
sys.path.insert(0, HERE)

import probe101a_rot_variants as p  # noqa: E402  (the one ruler: ink_offsets(), not a private copy)

DEVNULL = subprocess.DEVNULL


def make_tex(coord, opt, text):
    return (
        "\\documentclass[border=14pt]{standalone}\n"
        "\\usepackage{tikz}\n"
        "\\usepackage{amsmath,amssymb}\n"
        "\\begin{document}\n"
        "\\begin{tikzpicture}[x=1cm,y=1cm]\n"
        "  \\fill " + coord + " circle (1.2pt);\n"
        "  \\node[" + opt + "] at " + coord + " {" + text + "};\n"
        "\\end{tikzpicture}\n"
        "\\end{document}\n"
    )


def one_line(s):
    return re.sub(r"\s+", " ", s).strip()


def find_node(src, opt, coord):
    """All `\\node[opt] at (coord) {body};` statements, with 1-based line numbers."""
    coord_n = re.sub(r"\s+", "", coord).strip("()")
    pat = re.compile(r"\\node\s*\[" + re.escape(opt) + r"\]\s*at\s*\(")
    hits = []
    for m in pat.finditer(src):
        i = m.end()
        j = src.find(")", i)
        if j < 0:
            continue
        if re.sub(r"\s+", "", src[i:j]) != coord_n:
            continue
        k = j + 1
        while k < len(src) and src[k].isspace():
            k += 1
        if k >= len(src) or src[k] != "{":
            continue
        depth = 0
        s = q = k
        while q < len(src):
            ch = src[q]
            if ch == "{":
                depth += 1
            elif ch == "}":
                depth -= 1
                if depth == 0:
                    break
            q += 1
        if q >= len(src) or depth != 0:
            continue
        body = src[s + 1:q]
        r = q + 1
        while r < len(src) and src[r].isspace():
            r += 1
        end = r + 1 if r < len(src) and src[r] == ";" else r
        line = src.count("\n", 0, m.start()) + 1
        hits.append((body, line, src[m.start():end]))
    return hits


def control_opt(opt):
    """Same box (inner sep / font kept), no rotate, named anchor replaced by center."""
    s = re.sub(r"(?:^|,)\s*rotate=-?\d+(?:\.\d+)?\s*(?=,|$)", "", opt)
    s = re.sub(r"(?:^|,)\s*anchor=[A-Za-z ]+\s*(?=,|$)", "", s)
    s = re.sub(r",\s*,", ",", s).strip(" ,")
    return (s + ",anchor=center") if s else "anchor=center"


def run_page(stem, opt, text, coord):
    tex = os.path.join(HERE, stem + ".tex")
    pdf = os.path.join(HERE, stem + ".pdf")
    for ext in (".pdf", ".aux", ".log"):
        f = os.path.join(HERE, stem + ext)
        if os.path.exists(f):
            os.remove(f)  # rule 8: never let a previous run's pdf answer this one
    io.open(tex, "w", encoding="utf-8").write(make_tex(coord, opt, text))
    rc = subprocess.run(
        ["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
         "-output-directory", HERE, tex],
        stdout=DEVNULL, stderr=DEVNULL, cwd=HERE).returncode
    rec = {"stem": stem, "rc": rc, "pdf": pdf, "mtime": None, "bytes": None, "read": None}
    if os.path.exists(pdf):
        st = os.stat(pdf)
        rec["mtime"] = datetime.datetime.fromtimestamp(st.st_mtime).strftime("%Y-%m-%d %H:%M:%S")
        rec["bytes"] = st.st_size
        try:
            rec["read"] = p.ink_offsets(pdf)  # the ruler
        except Exception as e:  # a corrupt/absent pdf is a negative result, not a crash
            rec["read"] = None
            rec["err"] = repr(e)
    return rec


def fmt_read(r):
    if r is None:
        return "UNREADABLE"
    w, h, left, right, top, bottom = r
    return ("box %6.2f x %6.2f  left %7.2f right %7.2f top %7.2f bottom %7.2f"
            % (w, h, left, right, top, bottom))


def nominal_font(opt):
    m = re.search(r"font=\\?(footnotesize|scriptsize|small|large|Large)", opt)
    if not m:
        return "10pt (normal, font= not written)"
    return {"footnotesize": "8pt", "scriptsize": "7pt", "small": "9pt",
            "large": "12pt", "Large": "14.4pt"}[m.group(1)] + " (font=\\" + m.group(1) + ")"


def main():
    rows = []
    for n, ln in enumerate(io.open(TSV, encoding="utf-8"), 1):
        parts = ln.rstrip("\n").split("\t")
        if len(parts) == 5 and not ln.startswith("source"):
            rows.append((n,) + tuple(parts))

    papers, order = {}, []
    for _, paper, _, _, _, _ in rows:
        if paper not in papers:
            papers[paper] = "P%d" % (len(papers) + 1)
            order.append(paper)

    lines = ["#101b: the 10 real rotate+anchor nodes -- text ink relative to the declared point (pt)",
             "gauge: probe101a_rot_variants.ink_offsets()  [span bbox union; dot = \\fill circle 1.2pt]",
             "coords: page coordinates, y grows down; left/right/top/bottom = ink edge minus dot centre",
             "source rows: _work/m100_rot_anchor.tsv lines 4-13",
             "",
             "papers (flat file = _work/flat/<name>.tex):"]
    for paper in order:
        hits = [x for x in os.listdir(FLAT) if x.startswith(paper[:40])]
        tag = hits[0] if len(hits) == 1 else ("AMBIGUOUS:%d" % len(hits) if hits else "NOSITE")
        lines.append("  %-3s %s   flat=%s" % (papers[paper], paper, tag))
    lines.append("")
    lines.append("== NODE readings (10) ==")

    node_recs = []
    for idx, (tsvline, paper, pic, anchor, opt, coord) in enumerate(rows):
        tag = papers[paper]
        hits = [x for x in os.listdir(FLAT) if x.startswith(paper[:40])]
        head = "NODE %02d  %s pic=%s anchor=%s  tsv line %d" % (idx + 1, tag, pic, anchor, tsvline)
        if len(hits) != 1:
            lines.append(head)
            lines.append("  NOSITE/AMBIGUOUS: flat hits=%r" % (hits,))
            lines.append("")
            node_recs.append(None)
            continue
        flat = os.path.join(FLAT, hits[0])
        src = io.open(flat, encoding="utf-8").read()
        found = find_node(src, opt, coord)
        lines.append(head)
        lines.append("  src _work/flat/%s:%s" % (hits[0], found[0][1] if found else "?"))
        if len(found) != 1:
            lines.append("  NOSITE/AMBIGUOUS node statements: %d hit(s) for opt=%r at %r"
                         % (len(found), opt, coord))
            for body, line, stmt in found:
                lines.append("    line %d: %s" % (line, one_line(stmt)))
            lines.append("")
            node_recs.append(None)
            continue
        body, srcline, stmt = found[0]
        lines.append("  raw: %s" % one_line(stmt))
        lines.append("  text {%s}  opt {%s}" % (one_line(body), opt))
        lines.append("  inner sep written: %s   font= written: %s   nominal: %s"
                     % ("yes" if "inner sep" in opt else "no",
                        "yes" if "font=" in opt else "no", nominal_font(opt)))

        node = run_page("m101b_node_%02d" % idx, opt, body, coord)
        copt = control_opt(opt)
        ctrl = run_page("m101b_ctrl_%02d" % idx, copt, body, coord)
        lines.append("  pdf %s  rc=%d  mtime=%s  bytes=%s"
                     % (node["stem"] + ".pdf", node["rc"], node["mtime"], node["bytes"]))
        lines.append("  %s   [ink_offsets=%s]" % (fmt_read(node["read"]), node["read"]))
        lines.append("  ctrl opt {%s}  pdf %s  mtime=%s  bytes=%s"
                     % (copt, ctrl["stem"] + ".pdf", ctrl["mtime"], ctrl["bytes"]))
        lines.append("")
        node_recs.append((node, ctrl))

    lines.append("== CONTROL readings (10): same text, anchor=center, no rotate ==")
    for idx, pair in enumerate(node_recs):
        tag = papers[rows[idx][1]]
        if pair is None:
            lines.append("CTRL %02d  %s  NO NODE READING" % (idx + 1, tag))
            lines.append("")
            continue
        node, ctrl = pair
        lines.append("CTRL %02d  %s  opt {%s}" % (idx + 1, tag, control_opt(rows[idx][4])))
        lines.append("  pdf %s  rc=%d  mtime=%s  bytes=%s"
                     % (ctrl["stem"] + ".pdf", ctrl["rc"], ctrl["mtime"], ctrl["bytes"]))
        lines.append("  %s   [ink_offsets=%s]" % (fmt_read(ctrl["read"]), ctrl["read"]))
        if node["read"] is not None and ctrl["read"] is not None:
            d = [node["read"][i] - ctrl["read"][i] for i in range(6)]
            lines.append("  delta node-ctrl: dw %6.2f dh %6.2f  dleft %7.2f dright %7.2f"
                         " dtop %7.2f dbottom %7.2f"
                         % (d[0], d[1], d[2], d[3], d[4], d[5]))
        lines.append("")

    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
