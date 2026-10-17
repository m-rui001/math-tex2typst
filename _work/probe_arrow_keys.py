"""Every arrow-spec-shaped option key the corpus actually writes, now that `opts()` keeps them whole.

Prints each distinct bare key that looks like an arrow specification, how many drawn canvases carry
it, and whether `arrow_mark` gives it a head today. This is the shape list the parser has to cover --
measured over `_work/flat`, not guessed from the TikZ manual.
"""
import os
import re
import sys
import glob

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(errors="replace")

from t2t import cetz  # noqa: E402

FLAT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work/flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
OPTLIST = re.compile(r"(?:\\(?:draw|path|node|fill|shade|double|clip)\s*(?:\[[^\]]*\])?\s*(\[[^\]]*\])"
                     r"|([A-Za-z0-9_/*]*\.style=\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}))", re.S)

def looks_like_spec(key):
    """A bare option whose every character is tip furniture, a tip name, or a tip group."""
    if " " in key.strip():
        return False
    tip = re.match(r"""^(?:[<>=.|()ox^*+{}\-]|[A-Za-z][A-Za-z.]*(?:\[[^\]]*\])?)+$""", key)
    return bool(tip) and bool(re.search(r"[-<>]", key))


def main():
    counts = {}
    canvases = papers = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        seen = set()
        for p in PIC.findall(text):
            if cetz.build(p) is None:
                continue
            canvases += 1
            found = False
            for m in OPTLIST.finditer(p):
                raw = m.group(1) or m.group(2)
                if not raw:
                    continue
                if not raw.startswith("["):
                    raw = raw[raw.find("{") + 1:raw.rfind("}")]
                for key, val in cetz.opts(raw[1:-1] if raw.startswith("[") else raw).items():
                    if val is True and looks_like_spec(key):
                        counts.setdefault(key, [0, 0])
                        counts[key][0] += 1
                        if cetz.arrow_mark({key: True}, None, True) is None:
                            counts[key][1] += 1
                            found = True
                            seen.add(key)
            papers += 1 if found else 0
    print("drawn canvases %d; canvases still missing a head: %d" % (canvases, papers))
    for key, (n, miss) in sorted(counts.items(), key=lambda kv: -kv[1][0]):
        print("%5d  %-34s dropped %d" % (n, repr(key), miss))


if __name__ == "__main__":
    main()
