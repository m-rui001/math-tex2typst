r"""Can pandoc read a table float whose body is a tabularx, and what does rewriting it cost?

The last paper still without its captions is An-Irrational-Trace: its float is
\begin{table}[ht]\centering\small\begin{tabularx}{\linewidth}{@{}lX@{}} ... \end{tabularx}
\caption{Parameter choices ...}. Feeding pandoc the float as written, with the environment renamed
to tabular, and with the width argument dropped shows which of the two parts the reader gives up on.
The second lost caption of the same paper is printed too, to see whether it is the same shape.
"""
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

PAPER = "An-Irrational-Trace-Counterexample-to-Reduced-Baum-Connes-September-23-2026"
BODY = open(os.path.join(ROOT, "_work", "flat", "%s.tex" % PAPER),
            encoding="utf-8", errors="replace").read()
CAP = re.compile(r"\\caption\b\s*(?:\[[^\]]*\])?\s*\{")
FLOAT = re.compile(r"\\begin\{(figure|table)\*?\}.*?\\end\{\1\*?\}", re.S)


def pandoc(text):
    tmp = os.path.join(ROOT, "_work", "_probe_tx.tex")
    with open(tmp, "w", encoding="utf-8") as fh:
        fh.write(text + "\n")
    p = subprocess.run(["pandoc", tmp, "-f", "latex", "-t", "json", "-o", "-"],
                       capture_output=True)
    if p.returncode:
        return "pandoc failed: %s" % p.stderr.decode("utf-8", "replace")[:120]
    s = p.stdout.decode("utf-8")
    ast = json.loads(s)
    caps = [json.dumps(n["c"][1]) for n in walk(ast) if n.get("t") == "Table"]
    return ("tables=%d caption=%s rawblock=%d" % (s.count('"Table"'),
            "Parameter" in "".join(caps) or "graph" in "".join(caps), s.count('"RawBlock"')))


def walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from walk(v)


def main():
    regions = [(m.group(0)) for m in FLOAT.finditer(BODY)]
    hits = [r for r in regions if "Parameter choices" in r or "The graph used" in r]
    print("float regions carrying the two lost captions: %d" % len(hits))
    for region in hits:
        head = region[:120].encode("unicode_escape").decode()
        print("---- region head: %s" % head)
        print("   as written      : %s" % pandoc(region))
        print("   tabularx->tabular(same preamble): %s"
              % pandoc(region.replace("tabularx", "tabular")))
        stripped = re.sub(r"\\begin\{tabularx\}\{[^{}]*\}", r"\\begin{tabular}",
                         region.replace("\\end{tabularx}", "\\end{tabular}"))
        print("   width dropped, X kept: %s" % pandoc(stripped))
        narrowed = re.sub(r"\{X\}", "{l}", re.sub(r"X\b", "l", stripped))
        print("   X->l too: %s" % pandoc(narrowed))
        print("   envs inside: %s" % re.findall(r"\\begin\{([a-z*]+)\}", region)[:6])


main()
