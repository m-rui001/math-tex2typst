"""Static gate for the escaped-brace guard: does any canvas still carry a LaTeX control word?

The strip loop that took `{K_0}`'s braces also reached inside an escaped `\{`, so the author's
`\1_{\{v\}}` reached the page as `1_{\v\}`. Builds every picture in the corpus with cetz.build only
(no typst, so this is safe beside a batch) and prints the canvases that still hold a backslash-word.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
from t2t import cetz

LEAK = re.compile(r"\\[a-zA-Z@]")


def main():
    files = hits = 0
    shown = 0
    for path in sorted(glob.glob(os.path.join(os.path.dirname(__file__),
                                              "flat", "*.tex"))):
        tex = open(path, encoding="utf-8", errors="replace").read()
        local = 0
        for m in re.finditer(r"\\begin\{tikzpicture\}(.*?)\\end\{tikzpicture\}", tex, re.S):
            built = cetz.build("\\begin{tikzpicture}" + m.group(1) + "\\end{tikzpicture}")
            if not built:
                continue
            for line in built.splitlines():
                if "content(" not in line:
                    continue
                body = line[line.index("content("):]
                # \linebreak and \box are our own Typst markup, not the author's LaTeX
                clean = re.sub(r"#\[?linebreak\)?|#box\(|#align\(|#text\(|#set ", "", body)
                if LEAK.search(clean):
                    local += 1
                    if shown < 6:
                        shown += 1
                        print("%s: %s" % (os.path.basename(path)[:34], body.strip()[:120]))
        if local:
            files += 1
            hits += local
    print("canvases still carrying a control word: %d over %d papers" % (hits, files))


main()
