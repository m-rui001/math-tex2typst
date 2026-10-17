r"""Does a genuine escaped dollar ever sit inside a node label in the corpus?

Two spellings share the two characters `\$` in the flat source and only one of them is an escaped
dollar: `A\\$B$` is a row break whose `\\` happens to abut the opening delimiter of the maths that
follows. A real one is a backslash that is not itself escaped, so the count has to say which.
`_v_command` prices a control sequence by looking its character up in `V_SYMBOL`, and `$` is mapped
to None there, so a real `\$` on a node with a written size crashes with
`'NoneType' object is not subscriptable`; if the spelling does not occur, nothing is owed it.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

NODE = re.compile(r"\\node\b(?:\s*\[[^\]]*\])?(?:\s*\([^)]*\))?\s*(?:at\s*\([^)]*\))?\s*\{", re.S)
SIZED = re.compile(r"(minimum (?:width|height|size)|text width|text height|inner sep)")
ESC = re.compile(r"(?<!\\)\\\$")
ABUT = re.compile(r"\\\\\$")


def label_after(src, start):
    """The balanced `{...}` body whose `{` sits at `start - 1`."""
    depth, i = 0, start - 1
    while i < len(src):
        if src[i] == "\\" and i + 1 < len(src):
            i += 2
            continue
        if src[i] == "{":
            depth += 1
        elif src[i] == "}":
            depth -= 1
            if depth == 0:
                return src[start:i]
        i += 1
    return None


def main():
    files = sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")))
    esc = sized_esc = abut = 0
    papers, examples = set(), []
    for path in files:
        src = open(path, encoding="utf-8", errors="replace").read()
        for m in NODE.finditer(src):
            body = label_after(src, m.end())
            if body is None:
                continue
            abut += len(ABUT.findall(body))
            if not ESC.search(body):
                continue
            esc += 1
            papers.add(os.path.basename(path))
            head = src[m.start():m.end()]
            if SIZED.search(head):
                sized_esc += 1
            if len(examples) < 12:
                examples.append((os.path.basename(path), head.strip()[:90], body.strip()[:90]))
    print("flat files scanned            :", len(files))
    print("node labels with a row break  :", abut, "abutting a `$` (not an escape)")
    print("node labels holding a real \\$ :", esc, "over", len(papers), "papers")
    print("  ... on a SIZED node         :", sized_esc)
    for name, head, body in examples:
        print("  %s\n    %s\n    %s" % (name, head, body))
    tot = sum(len(ESC.findall(open(p, encoding="utf-8", errors="replace").read())) for p in files)
    print("real \\$ anywhere in flat      :", tot)


if __name__ == "__main__":
    main()
