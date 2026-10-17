r"""Where does each source picture sit, and did the AST ever see it?

`probe_canvas_population.py` says some papers have fewer canvases in the product than
`\begin{tikzpicture}` blocks in the flat source.  All five of the Grothendieck pictures build fine,
so the loss is upstream of `cetz.build`: either the picture lives inside a structure that is dropped
before conversion, or the source counts something the AST never received.  This prints, for every
picture in a paper, the enclosing environment chain at that byte offset plus the nearest float or
comment markers, so the two populations can be compared statement by statement.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ENV = re.compile(r"\\(begin|end)\{([^{}]+)\}")
PIC = re.compile(r"\\begin\{tikzpicture\}")
COMMENT = re.compile(r"(?<!\\)%")


def env_chain(text, pos):
    stack = []
    for m in ENV.finditer(text):
        if m.start() >= pos:
            break
        if m.group(1) == "begin":
            stack.append(m.group(2))
        elif stack and m.group(2) in stack[::-1]:
            for i in range(len(stack) - 1, -1, -1):
                if stack[i] == m.group(2):
                    del stack[i]
                    break
    return "/".join(stack) or "(top level)"


def commented(text, start, end):
    """A picture is commented out when every line from its `\begin` to `\end` starts with `%`."""
    return all(COMMENT.match(l) for l in text[start:end].split("\n") if l.strip())


def in_math(text, pos):
    """Is this picture inside a `\\[ … \\]` display?  `\\begin{tikzpicture}` inside math is what pandoc eats."""
    return text.rfind("\\[", 0, pos) > text.rfind("\\]", 0, pos)


def main():
    stem = sys.argv[1]
    src = os.path.join(ROOT, "_work", "flat", stem + ".tex")
    text = open(src, encoding="utf-8", errors="replace").read()
    typ = os.path.join(ROOT, "typst", stem, "main.typ")
    body = open(typ, encoding="utf-8", errors="replace").read() if os.path.isfile(typ) else ""
    print("source %d B / product %d B / canvases in product %d"
          % (len(text), len(body), len(re.findall(r"#cetz\.canvas\(", body))))
    for k, m in enumerate(PIC.finditer(text), 1):
        line = text.count("\n", 0, m.start()) + 1
        end = text.find("\\end{tikzpicture}", m.start())
        print("picture %d: line %d  env=%s  in_display_math=%s  commented=%s"
              % (k, line, env_chain(text, m.start()), in_math(text, m.start()),
                 commented(text, m.start(), end)))
        lo = max(0, m.start() - 260)
        for l in text[lo:m.start()].split("\n")[-4:]:
            print("        | %s" % l.strip()[:110])


if __name__ == "__main__":
    main()
