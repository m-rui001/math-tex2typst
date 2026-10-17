r"""Corpus-wide: how many pictures have a definition or a declaration standing in front of them?

The change travels every `\newcommand`/\`\def` block and every `\tikzset`/\`\colorlet`/
`\definecolor` statement that sits between two pictures into the picture below it. That is only worth
the regression risk if the corpus is thin there, so this counts, per flat paper, the pictures with
such a block ahead of them and splits the `\tikzset` statements into the pure `/.style` tables the
emitter folds and the picture-wide defaults it refuses.
"""
import glob, re, sys
sys.path.insert(0, "_work/pic-authmacros")
from t2t import cetz, convert, prep, macros

PIC = convert.TIKZ_SPAN
DECL = re.compile(r"\\(?:newcommand|renewcommand|def|tikzset|colorlet|definecolor)(?![A-Za-z])")
total = {"papers": 0, "pictures": 0, "with_block": 0, "tikzset_nonpure": 0, "color": 0}
for path in sorted(glob.glob("_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    pre, body = prep.split_document(src)
    pics = list(PIC.finditer(body))
    if not pics:
        continue
    total["papers"] += 1
    total["pictures"] += len(pics)
    pos, hits = 0, 0
    for pic in pics:
        region = body[pos:pic.start()]
        pos = pic.end()
        if DECL.search(region):
            hits += 1
        for m in re.finditer(r"\\tikzset\s*\{", region):
            inner, _end = cetz.bracketed(region, m.end() - 1)
            if inner is None:
                continue
            spec = cetz.opts(inner)
            if not spec or not all(k.endswith("/.style") for k in spec):
                total["tikzset_nonpure"] += 1
                print("NONPURE", path, repr(inner[:70]))
        total["color"] += len(re.findall(r"\\(?:colorlet|definecolor)(?![A-Za-z])", region))
    if hits:
        total["with_block"] += hits
        print("BLOCK", path, hits, "of", len(pics))
print(total)
