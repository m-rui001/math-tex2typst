"""Census the arrow-tip spellings the corpus writes, and whether we keep the head.

For every flat picture we take each option list (`\\draw[..]`, `\\path[..]`, `x/.style={..}`) and
pull out every arrow specification in it. `arrow_mark` in cetz.py only looks at the literal keys
`->`, `<-`, `<->`, `.-.>`, so anything written with a named tip (`-latex`, `-{Stealth[length=2mm]}`,
`{Latex[]}-{Latex[]}`) is dropped today -- this prints how much of the corpus is in that case.
The build is then replayed so the count is over pictures we actually draw, not over all sources.
"""
import io
import os
import re
import sys
import glob

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(errors="replace")

from t2t import cetz  # noqa: E402

FLAT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work/flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

# every bracketed option list, and every `.style={...}` definition (`flow/.style={…}`, the
# spelling TikZ actually uses -- a leading slash here matched nothing in the corpus)
OPTLIST = re.compile(r"(?:\\(?:draw|path|node|fill|shade|double|clip)\s*(?:\[[^\]]*\])?\s*(\[[^\]]*\])"
                     r"|([A-Za-z0-9_/*]*\.style=\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}))", re.S)

TIPNAME = re.compile(r"\{\s*([A-Za-z]+)")


def lists(text):
    out = []
    for m in OPTLIST.finditer(text):
        raw = m.group(1) if m.group(1) else m.group(2)
        if not raw:
            continue
        if not raw.startswith("["):
            raw = raw[raw.find("{") + 1:raw.rfind("}")]
        out.append(raw)
    return out


SPEC_CHARS = set("<>=.-[]{}()*+xo|, \t")
NAMED = re.compile(r"^[-=][A-Za-z]+$|^\{[^{}]+\}-|^-\{[^{}]+\}$|^\{[^{}]+\}-\{[^{}]+\}$")


def specs(raw):
    """Arrow specs inside one option list, as the real `opts()` hands them to `arrow_mark`."""
    body = re.sub(r"^\[|\]$", "", raw)
    got = []
    for part in cetz.split_top(body, ","):
        p = part.strip()
        if not p:
            continue
        outside = re.sub(r"\[[^\]]*\]|\{[^{}]*\}", "", p)
        is_spec = ("=" not in outside and any(c in p for c in "<>=")
                   and not set(outside) - SPEC_CHARS) or bool(NAMED.match(p))
        if is_spec:
            got.append(p)
    return got


def kept(spec):
    """Does arrow_mark hand this spec a mark today, going through the same opts() the code uses?"""
    return cetz.arrow_mark(cetz.opts(spec), None, True) is not None


def main():
    papers = {}
    names = {}
    examples = []
    drawn = quoted = total = dropped = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        base = os.path.basename(src)[:-4]
        hits = 0
        for p in PIC.findall(text):
            got = cetz.build(p)
            if got is None:
                quoted += 1
                continue
            drawn += 1
            bad = []
            for raw in lists(p):
                for s in specs(raw):
                    total += 1
                    if kept(s):
                        continue
                    bad.append(s)
                    m = TIPNAME.search(s) or re.search(r"[-=]([A-Za-z]+)", s)
                    if m:
                        names[m.group(1)] = names.get(m.group(1), 0) + 1
                    if len(examples) < 12 and s not in examples:
                        examples.append(s)
            if bad:
                hits += 1
                dropped += len(bad)
        if hits:
            papers[base] = hits
    print("drawn canvases %d, refused %d" % (drawn, quoted))
    print("arrow specs seen: %d, dropped: %d" % (total, dropped))
    print("canvases with a dropped tip: %d over %d papers"
          % (sum(papers.values()), len(papers)))
    print("tip names:", sorted(names.items(), key=lambda kv: -kv[1])[:16])
    for e in examples:
        print("  e.g. %r" % e)
    with open(os.path.join(os.path.dirname(FLAT), "arw_papers.txt"), "w",
              encoding="utf-8") as fh:
        for k, v in sorted(papers.items(), key=lambda kv: -kv[1]):
            fh.write("%s\t%d\n" % (k, v))


if __name__ == "__main__":
    main()
