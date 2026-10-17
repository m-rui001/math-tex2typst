"""Which scope option makes a `\begin{scope}` refuse, counted over the whole corpus?

_work/probe_refusal_stages.py says 11 pictures stop at the scoped stage but keeps one sample
per family. This walks every flat source, and for each picture that reaches that stage prints
the option head of each scope, so the fix is written against the real list of keys rather than
one example.

Usage: python _work/probe_scope_opts.py
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
heads = collections.Counter()
papers = collections.defaultdict(set)


def scope_heads(body):
    out, pos = [], 0
    while True:
        m = cetz.SCOPE.search(body, pos)
        if not m:
            return out
        if m.group(1) == "begin":
            o, _end = cetz._opts_at(body, m.end())
            # _opts_at has already parsed the bracket into a key -> value mapping
            out.append(", ".join("%s=%s" % (k, v) for k, v in sorted((o or {}).items())))
        pos = m.end()


for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.finditer(text):
        core = pic.group(0)
        if cetz.convert(core):
            continue
        if core.startswith("\\begin{tikzpicture}"):
            head, pos = cetz._opts_at(core[len("\\begin{tikzpicture}"):].lstrip(), 0)
            if head is None or cetz._transform(head) is None:
                continue
            body = core.lstrip()[len("\\begin{tikzpicture}") + pos:]
            body = body[:body.rfind("\\end{tikzpicture}")]
            body = cetz.expand_foreach(body)
            if body is None or cetz.expand_pgfmath(body) is None:
                continue
            body = cetz.expand_ifnum(body)
            if body is None or cetz._colors(body)[0] is None:
                continue
            if cetz.scoped(body, cetz.IDENT) is not None:
                continue
            for h in scope_heads(body):
                heads[h or "(no options)"] += 1
                papers[h or "(no options)"].add(tex.stem[:40])

print("scope heads that reach a refusal:")
for h, n in heads.most_common(25):
    print("%4d  %r  (%d papers)" % (n, h[:90], len(papers[h])))
