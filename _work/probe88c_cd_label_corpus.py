r"""How many corpus arrow labels would a scriptstyle rule touch, and how are they spelled?

The control says an exchange-diagram label is set in `\scriptstyle` -- 6.97/7.97/7.97pt against cells
of 9.96/10.91/11.96pt (`_work/probe88b_cd_label_size.py`) -- and that a label whose TeX opens its own
`$...$` escapes that style and prints at body size. Before `build_cd` gets a size rule, the corpus
has to say what the rule would fire on:

  labels       every arrow label in a `tikzcd` or `CD` picture, and how many begin with `$`
  canvases     how many carry at least one label at all
  class sizes  the documentclass size each affected paper asks for, because script is 7/8/8 pt at
               10/11/12 pt -- a ratio is not a constant, and the emitter needs to know which

  python _work/probe88c_cd_label_corpus.py
"""
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
CD_ENV = re.compile(r"\\begin\{(tikzcd|CD)\}(.*?)\\end\{\1\}", re.S)
TIKZCD_LABEL = re.compile(r"\\arrow\[[^\]]*\]")
QUOTED = re.compile(r'"([^"]*)"')
AMSCD_LABEL = re.compile(r"@[<>=VA|.]*\{((?:[^{}]|\{[^{}]*\})*)\}")
CLASS_OPT = re.compile(r"\\documentclass\[([^\]]*)\]")


def labels(body, env):
    """The label strings of one diagram, in the spelling the author wrote."""
    if env == "CD":
        return [m.group(1) for m in AMSCD_LABEL.finditer(body)]
    out = []
    for m in TIKZCD_LABEL.finditer(body):
        out += [q.group(1) for q in QUOTED.finditer(m.group(0))]
    return out


def main():
    canvases = papers = 0
    sized = Counter()
    spell = Counter()
    classes = Counter()
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        found = list(CD_ENV.finditer(src))
        if not found:
            continue
        touched = False
        for env, body in (m.groups() for m in found):
            got = [l.strip() for l in labels(body, env) if l.strip()]
            if not got:
                continue
            touched = True
            canvases += 1
            for lab in got:
                spell["dollar" if lab.startswith("$") else "plain"] += 1
                sized[env] += 1
        if touched:
            papers += 1
            opts = CLASS_OPT.search(src)
            sizes = [o.strip() for o in (opts.group(1).split(",") if opts else [])
                     if re.match(r"^\d+pt$", o.strip())]
            classes[sizes[0] if sizes else "default"] += 1
    print("labelled exchange canvases: %d over %d papers" % (canvases, papers))
    print("labels by env:   %s" % dict(sized))
    print("labels by spelling: %s  (a `$`-opened label escapes the environment's scriptstyle)"
          % dict(spell))
    print("documentclass of the affected papers: %s" % dict(classes))
    return 0


if __name__ == "__main__":
    sys.exit(main())
