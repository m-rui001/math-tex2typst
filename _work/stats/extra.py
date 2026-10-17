import os, re, json
from collections import Counter, defaultdict
ROOT = "E:/math/preprints"
BUNDLE_RX = re.compile(r"[\\/](?:tools|vendor|texmf|texdeps)[\\/]", re.I)
BUNDLE_FN = {"glyphtounicode.tex", "unicode-map.tex"}

def read(p):
    for enc in ("utf-8", "latin-1"):
        try:
            return open(p, encoding=enc).read()
        except (UnicodeDecodeError, UnicodeError):
            continue
        except OSError:
            return ""
    return ""

CUR = [
 "middle","overset","underset","stackrel","overbrace","underbrace","binom","dbinom","tbinom",
 "Binom","choose","atop","dfrac","cfrac","genfrac","nicefrac",
 "mathbb","mathcal","mathfrak","mathscr","mathbf","boldsymbol","bm",
 "mathrm","mathit","mathtt","mathsf","Bbbk","hbox","mbox","fbox","text","operatorname",
 "substack","sideset","slashed",
 "bigl","bigr","Bigl","Bigr","biggl","biggr","Biggl","Biggr","big","Big","bigg","Bigg",
 "langle","rangle","lVert","rVert","lvert","rvert","vert","mid","colon","coloneqq","Coloneqq",
 "dagger","ddagger","oplus","ominus","odot","oslash","bullet","star","circ",
 "emptyset","varnothing","supset","sqsubseteq","trianglelefteq","cong","approx","propto","angle",
 "leftarrow","rightarrow","leftrightarrow","twoheadrightarrow","nearrow",
 "iint","iiint","oint","bigcup","bigcap","bigsqcup","bigoplus","bigotimes","bigodot","coprod",
 "limsup","liminf","varinjlim","varprojlim","hbar","aleph","wp",
 "hat","tilde","vec","dot","ddot","check",
 "overleftarrow","overrightarrow","overline","underline",
 "root","phantom","hphantom","vphantom","strut","mathstrut","smash","raisebox","rlap","llap",
 "subarray","smallmatrix","bordermatrix","vdots","ddots","dots",
 "not","notin","restriction","upharpoonright",
 "xrightarrow","xleftarrow","xhookrightarrow",
 "pic","shade","shadedraw","filldraw","foreach","tikzset","clip","pattern",
]
rx_all = re.compile(r"\\(" + "|".join(CUR) + r")(?![A-Za-z])")
cnt = Counter(); psc = defaultdict(set)
rx_tikz_inline = re.compile(r"\\tikz(?![A-Za-z])")
best = Counter()
for dp, dn, fn in os.walk(ROOT):
    if BUNDLE_RX.search(dp):
        continue
    for f in fn:
        if not f.endswith(".tex") or f in BUNDLE_FN:
            continue
        full = os.path.join(dp, f)
        paper = os.path.relpath(full, ROOT).split(os.sep)[0]
        s = read(full)
        for m in rx_all.finditer(s):
            cnt[m.group(1)] += 1; psc[m.group(1)].add(paper)
        c = len(rx_tikz_inline.findall(s))
        if c:
            best[paper] += c
res = {k: [v, len(psc[k])] for k, v in cnt.most_common()}
out = {"curated": res, "tikz_inline_by_paper": best.most_common(5)}
json.dump(out, open("E:/math/_work/stats/extra_stats.json", "w", encoding="utf-8"),
          ensure_ascii=False, indent=1)
print("EXTRA DONE")
