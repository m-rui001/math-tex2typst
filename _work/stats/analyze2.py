# -*- coding: utf-8 -*-
"""Read-only dialect survey v2 of LaTeX sources under E:/math/preprints.
Excludes vendored texmf/pgf tool trees. Writes raw_stats.json."""
import os, re, json
from collections import Counter, defaultdict

ROOT = "E:/math/preprints"
OUT = "E:/math/_work/stats"

BUNDLE_RX = re.compile(r"[\\/](?:tools|vendor|texmf|texdeps)[\\/]", re.I)
BUNDLE_FN = {"glyphtounicode.tex", "unicode-map.tex"}

files = []
excluded = []
for dirpath, dirnames, filenames in os.walk(ROOT):
    for fn in filenames:
        if fn.lower().endswith(".tex"):
            full = os.path.join(dirpath, fn)
            paper = os.path.relpath(full, ROOT).split(os.sep)[0]
            if BUNDLE_RX.search(full) or fn in BUNDLE_FN:
                excluded.append(full)
                continue
            files.append((full, paper, fn))

def read(p):
    for enc in ("utf-8", "latin-1"):
        try:
            with open(p, "r", encoding=enc) as f:
                return f.read()
        except (UnicodeDecodeError, UnicodeError):
            continue
        except OSError:
            return ""
    return ""

def strip_comments(s):
    out_lines = []
    for ln in s.split("\n"):
        i = 0; cut = -1
        while True:
            j = ln.find("%", i)
            if j < 0:
                break
            k = j - 1; nb = 0
            while k >= 0 and ln[k] == "\\":
                nb += 1; k -= 1
            if nb % 2 == 0:
                cut = j; break
            i = j + 1
        out_lines.append(ln if cut < 0 else ln[:cut])
    return "\n".join(out_lines)

CONTENTS = {}
for full, paper, fn in files:
    CONTENTS[(full, paper, fn)] = strip_comments(read(full))

PAPER_COUNT = len({p for _, p, _ in files})
def cmd_rx(name):
    return re.compile(r"\\" + name + r"(?![A-Za-z])")

R = {"meta": {"tex_files": len(files), "excluded_vendored": len(excluded),
             "papers": PAPER_COUNT}}

# ---------------- Q1 usepackage ----------------
rx_up = re.compile(r"\\usepackage(?:\[[^\]]*\])?\{([^}]*)\}")
pkg = Counter(); pkg_papers = defaultdict(set)
for key, text in CONTENTS.items():
    for m in rx_up.finditer(text):
        for n in m.group(1).split(","):
            n = n.strip().split("[")[0].strip()
            if n:
                pkg[n] += 1; pkg_papers[n].add(key[1])
R["usepackage"] = {"total": sum(pkg.values()), "distinct": len(pkg),
    "table": [(k, v, len(pkg_papers[k])) for k, v in pkg.most_common()]}

rx_req = re.compile(r"\\RequirePackage(?:\[[^\]]*\])?\{([^}]*)\}")
rp = Counter(); rp_papers = defaultdict(set)
for key, text in CONTENTS.items():
    for m in rx_req.finditer(text):
        for n in m.group(1).split(","):
            n = n.strip().split("[")[0]
            if n:
                rp[n] += 1; rp_papers[n].add(key[1])
R["RequirePackage"] = {"total": sum(rp.values()), "distinct": len(rp),
    "table": [(k, v, len(rp_papers[k])) for k, v in rp.most_common(30)]}

# ---------------- Q2 newtheorem / theoremstyle ----------------
rx_nt = re.compile(r"\\newtheorem\s*\*?\s*(?:\[(?P<shared>[^\]]*)\])?\s*\{(?P<env>[^}]*)\}\s*(?:\[(?P<within>[^\]]*)\])?\s*\{(?P<name>[^}]*)\}")
nt_env = Counter(); nt_env_papers = defaultdict(set)
nt_forms = Counter(); nt_form_papers = defaultdict(set)
nt_shared = 0; nt_within = Counter()
for key, text in CONTENTS.items():
    for m in rx_nt.finditer(text):
        env = m.group("env").strip()
        nt_env[env] += 1; nt_env_papers[env].add(key[1])
        nt_forms[m.group(0).strip()] += 1; nt_form_papers[m.group(0).strip()].add(key[1])
        if m.group("shared"): nt_shared += 1
        if m.group("within"): nt_within[m.group("within").strip()] += 1
R["newtheorem"] = {"total": sum(nt_env.values()), "distinct_envs": len(nt_env),
    "shared_counter_decls": nt_shared,
    "within": nt_within.most_common(10),
    "env_table": [(k, v, len(nt_env_papers[k])) for k, v in nt_env.most_common()],
    "top_forms": [(f, c, len(nt_form_papers[f])) for f, c in nt_forms.most_common(20)]}

rx_ts = re.compile(r"\\theoremstyle\s*\{([^}]*)\}")
ts_c = Counter(); ts_p = defaultdict(set)
for key, text in CONTENTS.items():
    for m in rx_ts.finditer(text):
        v = m.group(1).strip(); ts_c[v] += 1; ts_p[v].add(key[1])
R["theoremstyle"] = {"total": sum(ts_c.values()),
    "table": [(k, v, len(ts_p[k])) for k, v in ts_c.most_common()]}

# ---------------- Q3 begin{env} ----------------
rx_be = re.compile(r"\\begin\s*\{([^}]*)\}")
be_c = Counter(); be_p = defaultdict(set)
for key, text in CONTENTS.items():
    for m in rx_be.finditer(text):
        e = m.group(1).strip(); be_c[e] += 1; be_p[e].add(key[1])
R["environments"] = {"total": sum(be_c.values()), "distinct": len(be_c),
    "table": [(k, v, len(be_p[k])) for k, v in be_c.most_common()]}

# ---------------- math regions ----------------
MATHENVS = {"math","displaymath","equation","eqnarray","align","alignat","gather","multline",
    "flalign","matrix","pmatrix","bmatrix","Bmatrix","vmatrix","Vmatrix",
    "smallmatrix","bordermatrix","array","cases","dcases","rcases","split","aligned","alignedat",
    "gathered","equation*","eqnarray*","align*","alignat*","gather*","multline*","flalign*",
    "subarray","CD","matrix*","pmatrix*","bmatrix*","array*","darray"}

def find_math_env_spans(text):
    for m in rx_be.finditer(text):
        e = m.group(1).strip()
        core = e.rstrip("*")
        if core in MATHENVS or e in MATHENVS:
            depth = 1; pos = len(text)
            pat = re.compile(r"\\(?:begin|end)\s*\{" + re.escape(e) + r"\}")
            for mm in pat.finditer(text, m.end()):
                if mm.group(0).startswith("\\begin"):
                    depth += 1
                else:
                    depth -= 1
                    if depth == 0:
                        pos = mm.start(); break
            yield m.start(), pos, e

def find_dollars(text):
    spans = []; i = 0; n = len(text)
    while i < n:
        c = text[i]
        if c == "\\":
            i += 2; continue
        if c == "$":
            disp2 = text.startswith("$$", i)
            j = i + (2 if disp2 else 1)
            while j < n:
                if text[j] == "\\":
                    j += 2; continue
                if disp2 and text.startswith("$$", j):
                    j += 2; break
                if (not disp2) and text[j] == "$":
                    j += 1; break
                j += 1
            spans.append((i, j)); i = j; continue
        i += 1
    return spans

def find_brack(text):
    spans = []
    for m in re.finditer(r"\\\[", text):
        j = text.find("\\]", m.end()); spans.append((m.start(), j if j >= 0 else len(text)))
    for m in re.finditer(r"\\\(", text):
        j = text.find("\\)", m.end()); spans.append((m.start(), j if j >= 0 else len(text)))
    return spans

def math_regions(text):
    n = len(text); covered = [False]*n; parts = []
    for s, e, name in find_math_env_spans(text):
        if s < e and not any(covered[s:e]):
            for i in range(s, e): covered[i] = True
            parts.append((text[s:e], name))
    raw = sorted(find_dollars(text) + find_brack(text))
    for s, e in raw:
        if s >= e or covered[s]: continue
        i = s
        while i < e:
            if not covered[i]:
                j = i
                while j < e and not covered[j]: j += 1
                parts.append((text[i:j], "$"))
                for k in range(i, j): covered[k] = True
                i = j
            i += 1
    return parts

rx_cmd = re.compile(r"\\([A-Za-z]+)")
rx_left = re.compile(r"\\left(?![A-Za-z])\s*(\\[A-Za-z]+|\\.|[^\s\{])")
rx_right = re.compile(r"\\right(?![A-Za-z])\s*(\\[A-Za-z]+|\\.|[^\s\{])")

mc = Counter(); mc_papers = defaultdict(set)
delim_left = Counter(); delim_right = Counter()
n_math_regions = 0
for key, text in CONTENTS.items():
    paper = key[1]
    seen = set()
    for seg, src in math_regions(text):
        n_math_regions += 1
        for m in rx_cmd.finditer(seg):
            mc[m.group(1)] += 1; seen.add(m.group(1))
        for m in rx_left.finditer(seg): delim_left[m.group(1)] += 1
        for m in rx_right.finditer(seg): delim_right[m.group(1)] += 1
    for name in seen: mc_papers[name].add(paper)
R["math_commands"] = {"total": sum(mc.values()), "distinct": len(mc),
    "table_top150": [(k, v, len(mc_papers[k])) for k, v in mc.most_common(150)],
    "left_delims": delim_left.most_common(30), "right_delims": delim_right.most_common(30),
    "math_regions": n_math_regions}

# ---------------- user-defined macros ----------------
rx_macro_def = re.compile(
    r"\\(?:newcommand|renewcommand|providecommand|DeclareMathOperator(?:\*?)?|DeclarePairedDelimiter|DeclareRobustCommand|def)\s*\*?\s*\{\s*\\([A-Za-z]+)\s*\}")
rx_macro_def2 = re.compile(r"\\(?:newcommand|renewcommand|providecommand|def)\s+\\([A-Za-z]+)")
defined = set(); def_papers = defaultdict(set)
for key, text in CONTENTS.items():
    for rx in (rx_macro_def, rx_macro_def2):
        for m in rx.finditer(text):
            defined.add(m.group(1)); def_papers[m.group(1)].add(key[1])
R["user_macros"] = {"distinct": len(defined),
    "used_math_defined_top": [(k, v, len(mc_papers[k]), len(def_papers[k]))
        for k, v in mc.most_common(400) if k in def_papers][:60]}

# newcommand with #args (brace-form names)
rx_nc = re.compile(r"\\(newcommand|renewcommand|providecommand)\s*\*?\s*\{\s*(\\[A-Za-z]+|[^\s\{\}\\])\s*\}")
def read_group(text, i):
    if i >= len(text) or text[i] != "{": return None, i
    depth = 0; j = i
    while j < len(text):
        if text[j] == "\\": j += 2; continue
        if text[j] == "{": depth += 1
        elif text[j] == "}":
            depth -= 1
            if depth == 0: return text[i+1:j], j+1
        j += 1
    return text[i+1:], len(text)

nc_tot = nc_param = 0; nc_papers = set(); nc_param_papers = set()
for key, text in CONTENTS.items():
    paper = key[1]
    for m in rx_nc.finditer(text):
        nc_tot += 1; nc_papers.add(paper)
        i = m.end()
        while i < len(text) and text[i] in " \t\n": i += 1
        for _ in range(2):  # optional [n] and optional [default]
            if i < len(text) and text[i] == "[":
                j = text.find("]", i)
                if j < 0: break
                i = j + 1
                while i < len(text) and text[i] in " \t\n": i += 1
        if i < len(text) and text[i] == "{":
            body, _ = read_group(text, i)
            if body and re.search(r"#\d", body):
                nc_param += 1; nc_param_papers.add(paper)
R["newcommand_family"] = {"total": nc_tot, "papers": len(nc_papers),
    "with_params": nc_param, "papers_with_params": len(nc_param_papers)}

rx_def = re.compile(r"\\def\s*\\?[A-Za-z@]+")
def_tot = 0; def_papers_all = set()
def_forms = Counter()
for key, text in CONTENTS.items():
    for m in rx_def.finditer(text):
        def_tot += 1; def_papers_all.add(key[1]); def_forms[m.group(0)] += 1
R["def"] = {"total": def_tot, "papers": len(def_papers_all),
    "top_forms": def_forms.most_common(20)}

# ---------------- Q5 TikZ ----------------
rx_lib = re.compile(r"\\usetikzlibrary(?:\[[^\]]*\])?\{([^}]*)\}")
libs = Counter(); libs_papers = defaultdict(set)
tikz_cmds = Counter(); tikz_cmds_papers = defaultdict(set)
tikz_per_paper = Counter(); tikz_opts = Counter()
axis_c = Counter(); axis_papers = set()
for key, text in CONTENTS.items():
    paper = key[1]
    for m in rx_lib.finditer(text):
        for l in m.group(1).split(","):
            l = l.strip()
            if l: libs[l] += 1; libs_papers[l].add(paper)
    n_here = 0
    for m in re.finditer(r"\\begin\{tikzpicture\}", text):
        s = m.end(); depth = 1; pos = len(text)
        pat = re.compile(r"\\(begin|end)\{tikzpicture\}")
        for mm in pat.finditer(text, s):
            if mm.group(1) == "begin": depth += 1
            else:
                depth -= 1
                if depth == 0: pos = mm.start(); break
        n_here += 1
        seg = text[s:pos]
        for mm in rx_cmd.finditer(seg):
            tikz_cmds[mm.group(1)] += 1; tikz_cmds_papers[mm.group(1)].add(paper)
    if n_here:
        tikz_per_paper[paper] = tikz_per_paper.get(paper, 0) + n_here
    for mm in re.finditer(r"\\begin\{(axis|group|plot)\*?\}", text):
        axis_c[mm.group(1)] += 1; axis_papers.add(paper)
    for mm in cmd_rx("tikz").finditer(text):
        tikz_cmds["(inline \\tikz)"] += 1; tikz_cmds_papers["(inline \\tikz)"].add(paper)
R["tikz"] = {"total_pictures": sum(tikz_per_paper.values()),
    "papers_using": len(tikz_per_paper),
    "avg_per_using_paper": round(sum(tikz_per_paper.values())/max(1,len(tikz_per_paper)),2),
    "max_per_paper": tikz_per_paper.most_common(5),
    "libs": [(k, v, len(libs_papers[k])) for k, v in libs.most_common(30)],
    "cmds": [(k, v, len(tikz_cmds_papers[k])) for k, v in tikz_cmds.most_common(45)],
    "axisish": axis_c.most_common(), "axis_papers": len(axis_papers)}

# ---------------- Q6 refs ----------------
refs = {}
for name in ["ref","eqref","autoref","cref","Cref","citep","citet","Citet","cite","nocite","citeauthor","citeyear"]:
    rx = cmd_rx(name); tot = 0; ps = set()
    for key, text in CONTENTS.items():
        c = len(rx.findall(text))
        if c: tot += c; ps.add(key[1])
    refs[name] = (tot, len(ps))
rx_cs = re.compile(r"\\cite\*(?![A-Za-z])")
tot = 0; ps = set()
for key, text in CONTENTS.items():
    c = len(rx_cs.findall(text))
    if c: tot += c; ps.add(key[1])
refs["cite*"] = (tot, len(ps))
rx_lbl = re.compile(r"\\label\s*\{([^}]*)\}")
lbl_prefix = Counter(); lbl_prefix_papers = defaultdict(set)
for key, text in CONTENTS.items():
    for m in rx_lbl.finditer(text):
        nm = m.group(1)
        mm = re.match(r"([A-Za-z]+):", nm)
        pfx = mm.group(1) + ":" if mm else "(no-prefix)"
        lbl_prefix[pfx] += 1; lbl_prefix_papers[pfx].add(key[1])
misc = {}
for name, rx in [("numberwithin_eq_section", re.compile(r"\\numberwithin\s*\{equation\}\s*\{section\}")),
                 ("numberwithin_eq", re.compile(r"\\numberwithin\s*\{equation\}")),
                 ("tag", re.compile(r"\\tag\*?(?![A-Za-z])")),
                 ("notag", cmd_rx("notag")), ("nonumber", cmd_rx("nonumber"))]:
    tot = 0; ps = set()
    for key, text in CONTENTS.items():
        c = len(rx.findall(text))
        if c: tot += c; ps.add(key[1])
    misc[name] = (tot, len(ps))
R["refs"] = {"ref_counts": refs, "label_total": sum(lbl_prefix.values()),
    "label_prefixes": [(k, v, len(lbl_prefix_papers[k])) for k, v in lbl_prefix.most_common(30)],
    "misc": misc}

# ---------------- Q7 structure ----------------
st = {}
def simple(rx):
    tot = 0; ps = set()
    for key, text in CONTENTS.items():
        c = len(rx.findall(text))
        if c: tot += c; ps.add(key[1])
    return tot, len(ps)
items = {
 "input": re.compile(r"\\input\s*\{?[A-Za-z0-9_./-]+"),
 "include": cmd_rx("include"), "import": cmd_rx("import"),
 "subfile": cmd_rx("subfile"),
 "renewcommand": cmd_rx("renewcommand"), "providecommand": cmd_rx("providecommand"),
 "newcommand": cmd_rx("newcommand"),
 "NewDocumentCommand": cmd_rx("NewDocumentCommand"),
 "DeclareMathOperator": cmd_rx("DeclareMathOperator"),
 "DeclarePairedDelimiter": cmd_rx("DeclarePairedDelimiter"),
 "newenvironment": cmd_rx("newenvironment"),
 "newtheorem_env_like": cmd_rx("newenvironment"),
 "newsavebox": cmd_rx("newsavebox"), "sbox": cmd_rx("sbox"), "parbox": cmd_rx("parbox"),
 "minipage": re.compile(r"\\begin\s*\{minipage\}"),
 "footnote": cmd_rx("footnote"), "footnotetext": cmd_rx("footnotetext"),
 "thanks": cmd_rx("thanks"), "maketitle": cmd_rx("maketitle"),
 "tableofcontents": cmd_rx("tableofcontents"), "appendix": cmd_rx("appendix"),
 "thebibliography": re.compile(r"\\begin\s*\{thebibliography\}"),
 "bibitem": cmd_rx("bibitem"),
 "labeltag_sublabel": cmd_rx("subfigure"), "subfigure_cmd": cmd_rx("subfigure"),
 "lstlisting": re.compile(r"\\begin\s*\{lstlisting\}"),
 "verbatim": re.compile(r"\\begin\s*\{verbatim\*?\}"),
 "algorithm_env": re.compile(r"\\begin\s*\{algorithm\*?\}"),
 "floats_fig": re.compile(r"\\begin\s*\{figure\*?\}"),
 "floats_tab": re.compile(r"\\begin\s*\{table\*?\}"),
 "tabular_star": re.compile(r"\\begin\s*\{tabular\*?\}"),
 "resizebox": cmd_rx("resizebox"), "scalebox": cmd_rx("scalebox"),
 "includegraphics": cmd_rx("includegraphics"),
 "textcircled": cmd_rx("textcircled"),
 "centering_vs_center": cmd_rx("center"),
 "bigskip_vspace": cmd_rx("vspace"),
 "hspace": cmd_rx("hspace"),
 "linebreak": cmd_rx("linebreak"),
 "newline": cmd_rx("newline"),
 "noindent": cmd_rx("noindent"),
 "emph": cmd_rx("emph"), "textit": cmd_rx("textit"), "textbf": cmd_rx("textbf"),
 "item": cmd_rx("item"),
 "url": cmd_rx("url"), "href": cmd_rx("href"), "hyperref_cmd": cmd_rx("hyperref"),
 "qed": cmd_rx("qed"),
 "allowdisplaybreaks": cmd_rx("allowdisplaybreaks"),
 "numberwithin_any": re.compile(r"\\numberwithin"),
}
for k, rx in items.items():
    t, p = simple(rx)
    st[k] = (t, p)
R["structure"] = st
# input target examples
ex = Counter()
for key, text in CONTENTS.items():
    for m in re.finditer(r"\\input\s*\{?([A-Za-z0-9_./-]+)", text):
        ex[m.group(1)] += 1
R["input_targets"] = ex.most_common(20)

rx_bs = re.compile(r"\\bibliographystyle\s*\{([^}]*)\}")
bs = Counter(); bs_p = defaultdict(set)
for key, text in CONTENTS.items():
    for m in rx_bs.finditer(text):
        bs[m.group(1)] += 1; bs_p[m.group(1)].add(key[1])
R["bibliographystyle"] = {"total": sum(bs.values()),
    "table": [(k, v, len(bs_p[k])) for k, v in bs.most_common()]}

tb = defaultdict(set)
for key, text in CONTENTS.items():
    for nm in ["title","author","date","maketitle"]:
        if cmd_rx(nm).search(text): tb[nm].add(key[1])
R["title_block"] = {k: len(v) for k, v in tb.items()}
R["title_block"]["papers_total"] = PAPER_COUNT

rx_dc = re.compile(r"\\documentclass\s*(?:\[[^\]]*\])?\s*\{([^}]*)\}")
dc = Counter(); dc_p = defaultdict(set)
for key, text in CONTENTS.items():
    for m in rx_dc.finditer(text):
        dc[m.group(1)] += 1; dc_p[m.group(1)].add(key[1])
R["documentclass"] = [(k, v, len(dc_p[k])) for k, v in dc.most_common(20)]

bibn = 0
for dirpath, dirnames, filenames in os.walk(ROOT):
    if BUNDLE_RX.search(dirpath): continue
    bibn += sum(1 for f in filenames if f.lower().endswith(".bib"))
R["bib_files"] = bibn

with open(os.path.join(OUT, "raw_stats.json"), "w", encoding="utf-8") as f:
    json.dump(R, f, ensure_ascii=False, indent=1, default=list)
print("DONE v2")
