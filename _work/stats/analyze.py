# -*- coding: utf-8 -*-
"""Read-only dialect survey of LaTeX sources under E:/math/preprints.
Writes markdown report + raw JSON stats under E:/math/_work/stats/.
"""
import os, re, json, sys
from collections import Counter, defaultdict

ROOT = "E:/math/preprints"
OUT = "E:/math/_work/stats"

files = []
for dirpath, dirnames, filenames in os.walk(ROOT):
    for fn in filenames:
        if fn.lower().endswith(".tex"):
            full = os.path.join(dirpath, fn)
            paper = os.path.relpath(full, ROOT).split(os.sep)[0]
            files.append((full, paper, fn))

def read(p):
    for enc in ("utf-8", "utf-16", "latin-1"):
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
        i = 0
        cut = -1
        while True:
            j = ln.find("%", i)
            if j < 0:
                break
            # count preceding backslashes
            k = j - 1
            nb = 0
            while k >= 0 and ln[k] == "\\":
                nb += 1
                k -= 1
            if nb % 2 == 0:  # unescaped %
                cut = j
                break
            i = j + 1
        out_lines.append(ln if cut < 0 else ln[:cut])
    return "\n".join(out_lines)

CONTENTS = {}
print("files:", len(files), flush=True)
for idx, (full, paper, fn) in enumerate(files):
    CONTENTS[(full, paper, fn)] = strip_comments(read(full))
    if idx % 1000 == 0:
        print("read", idx, flush=True)

def cmd_rx(name):
    return re.compile(r"\\" + name + r"(?![A-Za-z])")

def count_all(rx):
    """returns (total, paperset, per_form Counter, per_form_papers dict)"""
    total = 0
    papers = set()
    forms = Counter()
    for (full, paper, fn), text in CONTENTS.items():
        ms = list(rx.finditer(text))
        if ms:
            total += len(ms)
            papers.add(paper)
            for m in ms:
                forms[m.group(0)] += 1
    return total, papers, forms

def occ_and_papers(rx, keygroup=0):
    tot = 0
    per_key = Counter()
    per_key_papers = defaultdict(set)
    for (full, paper, fn), text in CONTENTS.items():
        for m in rx.finditer(text):
            k = m.group(keygroup) if keygroup <= len(m.groups()) and keygroup > 0 else m.group(0)
            tot += 1
            per_key[k] += 1
            per_key_papers[k].add(paper)
    return tot, per_key, per_key_papers

R = {}

# ---------------- Q1 usepackage ----------------
rx_up = re.compile(r"\\usepackage(?:\[[^\]]*\])?\{([^}]*)\}")
pk_tot = 0
pkg = Counter(); pkg_papers = defaultdict(set)
pkg_top_forms = Counter()
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_up.finditer(text):
        names = [n.strip() for n in m.group(1).split(",") if n.strip()]
        for n in names:
            base = n.split("[")[0].strip()
            pk_tot += 1
            pkg[base] += 1
            pkg_papers[base].add(paper)
R["usepackage"] = {"total": pk_tot, "distinct": len(pkg),
    "table": [(k, v, len(pkg_papers[k])) for k, v in pkg.most_common()]}

rx_req = re.compile(r"\\RequirePackage(?:\[[^\]]*\])?\{([^}]*)\}")
rp = Counter(); rp_papers = defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_req.finditer(text):
        for n in m.group(1).split(","):
            n = n.strip().split("[")[0]
            if n:
                rp[n] += 1; rp_papers[n].add(paper)
R["RequirePackage"] = {"total": sum(rp.values()), "distinct": len(rp),
    "table": [(k, v, len(rp_papers[k])) for k, v in rp.most_common(30)]}

# ---------------- Q2 newtheorem / theoremstyle ----------------
rx_nt = re.compile(r"\\newtheorem\s*\*?\s*(?:\[(?P<shared>[^\]]*)\])?\s*\{(?P<env>[^}]*)\}\s*(?:\[(?P<within>[^\]]*)\])?\s*\{(?P<name>[^}]*)\}")
nt_tot = 0
nt_env = Counter(); nt_env_papers = defaultdict(set)
nt_forms = Counter(); nt_form_papers = defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_nt.finditer(text):
        nt_tot += 1
        env = m.group("env").strip()
        nt_env[env] += 1; nt_env_papers[env].add(paper)
        f = m.group(0).strip()
        nt_forms[f] += 1; nt_form_papers[f].add(paper)
R["newtheorem"] = {"total": nt_tot, "distinct_envs": len(nt_env),
    "env_table": [(k, v, len(nt_env_papers[k])) for k, v in nt_env.most_common()],
    "top_forms": [(f, c, len(nt_form_papers[f])) for f, c in nt_forms.most_common(20)]}

rx_ts = re.compile(r"\\theoremstyle\s*\{([^}]*)\}")
ts_tot, ts_c, ts_p = 0, Counter(), defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_ts.finditer(text):
        ts_tot += 1; v = m.group(1).strip()
        ts_c[v] += 1; ts_p[v].add(paper)
R["theoremstyle"] = {"total": ts_tot, "table": [(k, v, len(ts_p[k])) for k, v in ts_c.most_common()]}

# ---------------- Q3 begin{env} ----------------
rx_be = re.compile(r"\\begin\s*\{([^}]*)\}")
be_tot, be_c, be_p = 0, Counter(), defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_be.finditer(text):
        e = m.group(1).strip()
        be_tot += 1; be_c[e] += 1; be_p[e].add(paper)
R["environments"] = {"total": be_tot, "distinct": len(be_c),
    "table": [(k, v, len(be_p[k])) for k, v in be_c.most_common()]}

# ---------------- math-region helpers ----------------
MATHENVS = {"math","displaymath","equation","eqnarray","align","alignat","gather","multline",
    "flalign","xalign","slash","matrix","pmatrix","bmatrix","Bmatrix","vmatrix","Vmatrix",
    "smallmatrix","bordermatrix","array","cases","dcases","rcases","split","aligned","alignedat",
    "gathered","cases*","equation*","eqnarray*","align*","alignat*","gather*","multline*","flalign*",
    "subarray","CD","matrix*","pmatrix*","bmatrix*","array*","darray","MAD"}

def find_balanced_env(text, begin_rx):
    """yield (start,end) spans of \begin{X}...\end{X} for math envs (X in MATHENVS or with *)."""
    for m in begin_rx.finditer(text):
        e = m.group(1).strip()
        core = e.rstrip("*")
        if core in MATHENVS and not core.startswith("tikz"):
            # find matching end accounting for same-name nesting (rare) depth=1
            depth = 1
            pos = m.end()
            pat = re.compile(r"\\(?:begin|end)\s*\{" + re.escape(e) + r"\}")
            ok = False
            for mm in pat.finditer(text, m.end()):
                if mm.group(0).startswith("\\begin"):
                    depth += 1
                else:
                    depth -= 1
                    if depth == 0:
                        yield m.start(), mm.start(), e
                        ok = True
                        break
            if not ok:
                yield m.start(), len(text), e

def find_dollars(text):
    spans = []
    i = 0; n = len(text)
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
            spans.append((i, j))
            i = j; continue
        i += 1
    return spans

def find_brack(text):
    spans = []
    for m in re.finditer(r"\\\[(?:\*)?\s", text):
        j = text.find("\\]", m.end())
        spans.append((m.start(), j if j >= 0 else len(text)))
    for m in re.finditer(r"\\\(", text):
        j = text.find("\\)", m.end())
        spans.append((m.start(), j if j >= 0 else len(text)))
    return spans

def math_regions(text):
    """Non-overlapping math spans. Environments first (they are outer-most math
    containers we care about), then $..$ / \\[..\\] fill uncovered areas."""
    n = len(text)
    covered = [False] * n
    parts = []
    for s, e, name in find_balanced_env(text, rx_be):
        if any(covered[s:e]):
            continue
        for i in range(s, e):
            covered[i] = True
        parts.append((text[s:e], name))
    raw = find_dollars(text) + find_brack(text)
    raw.sort()
    for s, e in raw:
        if s >= e or covered[s]:
            continue
        seg_parts = []
        i = s
        while i < e:
            if not covered[i]:
                j = i
                while j < e and not covered[j]:
                    j += 1
                seg_parts.append(text[i:j])
                for k in range(i, j):
                    covered[k] = True
                i = j
            i += 1
        for sp in seg_parts:
            parts.append((sp, "$"))
    return parts

rx_cmd = re.compile(r"\\([A-Za-z]+|@|\d|\D)(\*?)")
# simpler: letters commands
rx_cmd = re.compile(r"\\([A-Za-z][A-Za-z0-9]*)\*?")

mc_tot = 0
mc = Counter(); mc_papers = defaultdict(set)
delim_left = Counter(); delim_right = Counter(); lr_tot = 0
math_env_begin = Counter()
n_math_regions = 0
for (full, paper, fn), text in CONTENTS.items():
    segs = math_regions(text)
    n_math_regions += len(segs)
    seen_cmd_in_file = set()
    for seg, src in segs:
        if src != "$":
            math_env_begin[src] += 0  # placeholder
        for m in rx_cmd.finditer(seg):
            name = m.group(1)
            mc[name] += 1
            seen_cmd_in_file.add(name)
        for m in re.finditer(r"\\left\s*(\\[A-Za-z]+|\\.|[^\s\{])", seg):
            delim_left[m.group(1)] += 1; lr_tot += 1
        for m in re.finditer(r"\\right\s*(\\[A-Za-z]+|\\.|[^\s\{])", seg):
            delim_right[m.group(1)] += 1
    for name in seen_cmd_in_file:
        mc_papers[name].add(paper)
R["math_commands"] = {"total": sum(mc.values()), "distinct": len(mc),
    "table_top120": [(k, v, len(mc_papers[k])) for k, v in mc.most_common(120)],
    "left_delims": delim_left.most_common(30),
    "right_delims": delim_right.most_common(30),
    "lr_total": lr_tot,
    "math_regions": n_math_regions}

# ---------------- Q5 TikZ ----------------
tikz_tot = 0
tikz_per_paper = Counter()
tikz_cmds = Counter(); tikz_cmds_papers = defaultdict(set)
rx_lib = re.compile(r"\\usetikzlibrary(?:\[[^\]]*\])?\{([^}]*)\}")
libs = Counter(); libs_papers = defaultdict(set); lib_tot = 0
axis_tot = 0; axis_papers = set()
rx_pgflib = re.compile(r"\\pgfplotsset|\\usepgfplotslibrary\{([^}]*)\}")
pgflibs = Counter()
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_lib.finditer(text):
        for l in m.group(1).split(","):
            l = l.strip()
            if l:
                lib_tot += 1; libs[l] += 1; libs_papers[l].add(paper)
    n_here = 0
    for s, e, _ in find_balanced_env(text, rx_be):
        pass
    for m in re.finditer(r"\\begin\{tikzpicture\}", text):
        s = m.end()
        # find matching end with nesting
        depth = 1; pos = s
        pat = re.compile(r"\\(begin|end)\{tikzpicture\}")
        for mm in pat.finditer(text, s):
            if mm.group(1) == "begin":
                depth += 1
            else:
                depth -= 1
                if depth == 0:
                    pos = mm.start(); break
        else:
            pos = len(text)
        n_here += 1
        seg = text[s:pos]
        for mm in rx_cmd.finditer(seg):
            tikz_cmds[mm.group(1)] += 1
            tikz_cmds_papers[mm.group(1)].add(paper)
    if n_here:
        tikz_tot += n_here
        tikz_per_paper[paper] = n_here
    for mm in re.finditer(r"\\begin\{axis\*?\}", text):
        axis_tot += 1; axis_papers.add(paper)
    for mm in rx_pgflib.finditer(text):
        if mm.lastgroup is not None and mm.group(1):
            pgflibs[mm.group(1)] += 1
R["tikz"] = {"total_pictures": tikz_tot, "papers_using": len(tikz_per_paper),
    "avg_per_paper": round(tikz_tot / max(1, len(tikz_per_paper)), 2),
    "max_per_paper": tikz_per_paper.most_common(5),
    "libs_total": lib_tot, "libs": [(k, v, len(libs_papers[k])) for k, v in libs.most_common(30)],
    "cmds": [(k, v, len(tikz_cmds_papers[k])) for k, v in tikz_cmds.most_common(40)],
    "axis_total": axis_tot, "axis_papers": len(axis_papers),
    "pgfplotslibs": pgflibs.most_common(20)}

# ---------------- Q6 refs ----------------
refs = {}
for name in ["ref","eqref","autoref","cref","Cref","nameCref","citep","citet","cite","nocite","citeauthor","citeyear","Citett","Citet","parencite","textcite","footcite"]:
    rx = cmd_rx(name)
    tot = 0; ps = set()
    for (full, paper, fn), text in CONTENTS.items():
        c = len(rx.findall(text))
        if c:
            tot += c; ps.add(paper)
    refs[name] = (tot, len(ps))
rx_lbl = re.compile(r"\\label\s*\{([^}]*)\}")
lbl_tot = 0; lbl_prefix = Counter(); lbl_prefix_papers = defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_lbl.finditer(text):
        lbl_tot += 1
        nm = m.group(1)
        mm = re.match(r"([A-Za-z]+):", nm)
        pfx = mm.group(1) + ":" if mm else "(no-prefix)"
        lbl_prefix[pfx] += 1; lbl_prefix_papers[pfx].add(paper)
misc6 = {}
for name in [r"numberwithin\{equation\}\{section\}", r"numberwithin\{equation\}", r"tag", r"notag", r"nonumber"]:
    rxn = re.compile(r"\\" + name + r"(?![A-Za-z])") if not name.endswith("}") else re.compile(r"\\" + name)
    tot = 0; ps = set()
    for (full, paper, fn), text in CONTENTS.items():
        c = len(rxn.findall(text))
        if c:
            tot += c; ps.add(paper)
    misc6[name] = (tot, len(ps))
# \tag{...} and \tag*[...]
tagc = 0; tagp = set()
for (full, paper, fn), text in CONTENTS.items():
    ms = re.findall(r"\\tag\*?(?:\[[^\]]*\])?\{", text)
    if ms:
        tagc += len(ms); tagp.add(paper)
misc6["tag_with_brace"] = (tagc, len(tagp))
R["refs"] = {"ref_counts": refs, "label_total": lbl_tot,
    "label_prefixes": [(k, v, len(lbl_prefix_papers[k])) for k, v in lbl_prefix.most_common(30)],
    "misc": misc6}

# ---------------- Q7 structure ----------------
st = {}
def simple_count(rx):
    tot = 0; ps = set(); forms = Counter()
    for (full, paper, fn), text in CONTENTS.items():
        for m in rx.finditer(text):
            tot += 1; ps.add(paper); forms[m.group(0)] += 1
    return tot, ps, forms

for label, rx in [
    ("input", re.compile(r"\\input\s*\{?([^\s\{%]*)")),
    ("include", cmd_rx("include")),
    ("import", cmd_rx("import") ),
    ("subfile", cmd_rx("subfile")),
    ("renewcommand", cmd_rx("renewcommand")),
    ("providecommand", cmd_rx("providecommand")),
    ("DeclareMathOperator", cmd_rx("DeclareMathOperator")),
    ("DeclarePairedDelimiter", cmd_rx("DeclarePairedDelimiter")),
    ("newenvironment", cmd_rx("newenvironment")),
    ("newsavebox", cmd_rx("newsavebox")),
    ("parbox", cmd_rx("parbox")),
    ("minipage_begin", re.compile(r"\\begin\s*\{minipage\}")),
    ("footnote", cmd_rx("footnote")),
    ("thanks", cmd_rx("thanks")),
    ("maketitle", cmd_rx("maketitle")),
    ("tableofcontents", cmd_rx("tableofcontents")),
    ("appendix", cmd_rx("appendix")),
    ("thebibliography", re.compile(r"\\begin\s*\{thebibliography\}")),
    ("def", re.compile(r"\\def\s*\\[A-Za-z]+")),
]:
    tot, ps, forms = simple_count(rx)
    st[label] = {"total": tot, "papers": len(ps)}

# newcommand with args: brace-balanced parse
rx_nc_head = re.compile(r"\\(newcommand|renewcommand|providecommand)\s*(\*?)\s*(\\[A-Za-z]+|[^\s\[{][^0-9A-Za-z]?)")
nc_tot = 0; nc_param = 0; nc_param_papers = set(); nc_papers = set()
def read_group(text, i):
    """text[i] should be '{'; return (content, next_index) balanced."""
    if i >= len(text) or text[i] != "{":
        return None, i
    depth = 0; j = i
    while j < len(text):
        if text[j] == "\\":
            j += 2; continue
        if text[j] == "{":
            depth += 1
        elif text[j] == "}":
            depth -= 1
            if depth == 0:
                return text[i+1:j], j+1
        j += 1
    return text[i+1:], len(text)

for (full, paper, fn), text in CONTENTS.items():
    for m in rx_nc_head.finditer(text):
        nc_tot += 1; nc_papers.add(paper)
        i = m.end()
        # skip whitespace, optional [n], optional [default]
        while i < len(text) and text[i] in " \t\n":
            i += 1
        has_arg = False
        for _ in range(2):
            if i < len(text) and text[i] == "[":
                j = text.find("]", i)
                if j < 0: break
                i = j + 1
                while i < len(text) and text[i] in " \t\n":
                    i += 1
        # two braced groups: before-code (may be empty for newcommand) and definition
        if i < len(text) and text[i] == "{":
            g1, i2 = read_group(text, i)
            # newcommand: after first group IS the body. renewcommand in latex also.
            body = g1 if False else g1
            i = i2
            if i < len(text) and text[i] == "{":
                g2, i = read_group(text, i)
                body = g2  # for \newcommand{x}[1]{...}: g1 is the body actually...
                # careful: \newcommand{macro}{def} -> g1=def, g2 None.
                # \newcommand{macro}[1]{def}: after [1] only one braced group (the def) -> g1=def
                # So if g2 exists then g1 was optional 'before-code'? no, that's \NewDocumentCommand.
                # For \newcommand the header is {macro} then optional [n] then {def}.
                # Here m.end() is after macro name, so g1 = {def} or {def}? [n] already consumed.
                # Thus g2 existing means something unusual; keep g1 as body if g2 absent.
                body = g1
            # but if there was no [n] between {macro} and {def}, we may have consumed the
            # definition as g1 already; and a following '{' could belong to NEXT token.
            if re.search(r"#\d", body or ""):
                nc_param += 1; nc_param_papers.add(paper)
st["newcommand_param_ratio_note"] = "heuristic: body scanned for #1..#9"
R["structure"] = st
R["newcommand"] = {"total": nc_tot, "papers": len(nc_papers), "with_args": nc_param,
    "with_args_papers": len(nc_param_papers)}

# bibliography styles
rx_bs = re.compile(r"\\bibliographystyle\s*\{([^}]*)\}")
bs = Counter(); bs_p = defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_bs.finditer(text):
        bs[m.group(1)] += 1; bs_p[m.group(1)].add(paper)
R["bibliographystyle"] = {"total": sum(bs.values()),
    "table": [(k, v, len(bs_p[k])) for k, v in bs.most_common()]}

# title block completeness per main file
rx_ti = cmd_rx("title"); rx_au = cmd_rx("author"); rx_da = cmd_rx("date")
tb = {"title": 0, "author": 0, "date": 0, "maketitle": 0}
paper_has = defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    if len(rx_ti.findall(text)): paper_has[paper].add("title")
    if len(rx_au.findall(text)): paper_has[paper].add("author")
    if len(rx_da.findall(text)): paper_has[paper].add("date")
    if len(cmd_rx("maketitle").findall(text)): paper_has[paper].add("maketitle")
for p, s in paper_has.items():
    for x in s:
        tb[x] += 1
R["title_block"] = {"papers_total": len({p for _, p, _ in files}), **tb}

# docclass
rx_dc = re.compile(r"\\documentclass\s*(?:\[[^\]]*\])?\s*\{([^}]*)\}")
dc = Counter(); dc_p = defaultdict(set)
for (full, paper, fn), text in CONTENTS.items():
    for m in rx_dc.finditer(text):
        dc[m.group(1)] += 1; dc_p[m.group(1)].add(paper)
R["documentclass"] = [(k, v, len(dc_p[k])) for k, v in dc.most_common(20)]

# bib files count
bibn = 0
for dirpath, dirnames, filenames in os.walk(ROOT):
    for fn in filenames:
        if fn.lower().endswith(".bib"):
            bibn += 1
R["bib_files"] = bibn

with open(os.path.join(OUT, "raw_stats.json"), "w", encoding="utf-8") as f:
    json.dump(R, f, ensure_ascii=False, indent=1, default=list)
print("DONE", flush=True)
