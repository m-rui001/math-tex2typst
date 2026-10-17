r"""#99: every `even odd rule` / `nonzero rule` option in the corpus, with the subpaths it governs.

The converter has no reader for either spelling (grep of `tools/t2t` for `even.?odd|rulepath|fill.?rule`
returns nothing), so the option is silently dropped and each subpath of the fill ships as its own
`circle(..., fill: C, stroke: none)`. Two concentric circles of the same paint then cover the hole the
author asked to leave open -- which is page ink, not the no-ink zero-length subpath §7's row is about.

This prints the whole statement around every site so the shape of each can be judged from the source
(nested annulus, non-nested overlap, `nonzero` where nothing changes), plus what the canvas ships for
it. Read statically off `_work/flat` -- no render, and `typst/` is not written.

  python _work/probe99c_fill_rule_face.py        # -> _work/label99c_fill_rule_face.txt
"""
import collections
import io
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
OUT = os.path.join(WORK, "label99c_fill_rule_face.txt")
B = chr(92) * 2
PICRX = re.compile(B + "begin{tikzpicture}.*?" + B + "end{tikzpicture}", re.S)
STMT = re.compile(B + "(draw|fill|filldraw|path|shade|shadedraw)\\b(\\[[^\\]]*\\])?")
RULE = re.compile(r"even odd|nonzero")


def statements(pic):
    """(verb, options, body) per path statement, split on top-level `;`."""
    body = pic[pic.find("}") + 1:]
    out, depth, cur = [], 0, ""
    for ch in body:
        if ch in "{[(":
            depth += 1
        elif ch in "}])":
            depth -= 1
        if ch == ";" and depth <= 0:
            out.append(cur)
            cur = ""
        else:
            cur += ch
    out.append(cur)
    return [s.strip() for s in out if RULE.search(s) and STMT.search(s)]


def classified(pic):
    r"""[(kind, statement)] for every path statement naming a fill rule.

    `kind` is what the emitter can act on: `hole` = a fill verb whose own option bracket carries
    `even odd rule` and whose body holds two closed subpaths -- the shape that ships painted over;
    `default` = `nonzero rule`, which is already pgf's and Typst's behaviour; `clip` = the rule riding
    on a `\clip`, which we do not emit at all; `text` = the phrase sitting in a node's words rather
    than in an option bracket, which is no feature at all.
    """
    out = []
    for stmt in statements(pic):
        m = STMT.search(stmt)
        bracket = m.group(2) or ""
        if "even odd" not in bracket:
            out.append(("text" if RULE.search(stmt) else "default", stmt))
            continue
        shapes = len(re.findall(r"circle|ellipse|rectangle", stmt))
        if B + "clip" in stmt:
            out.append(("clip", stmt))
        elif shapes >= 2:
            out.append(("hole", stmt))
        else:
            out.append(("single", stmt))
    return out


def main():
    lines = ["", "== statements carrying a fill rule"]
    kinds = collections.Counter()
    papers = collections.defaultdict(set)
    n_sites = n_pics = n_papers = 0
    for name in sorted(os.listdir(os.path.join(WORK, "flat"))):
        if not name.endswith(".tex"):
            continue
        text = io.open(os.path.join(WORK, "flat", name), encoding="utf-8",
                       errors="replace").read()
        for i, pic in enumerate(PICRX.findall(text)):
            for kind, stmt in classified(pic):
                kinds[kind] += 1
                papers[kind].add(name[:-4])
                if kind == "hole":
                    papers["hole.pics"].add("%s#%d" % (name[:-4], i))
                lines.append("\n[%s] %s#%d  %s"
                             % (kind, name[:-4][:56], i, stmt.replace("\n", " ")[:330]))
    head = "kinds: " + "  ".join("%s=%d (%d papers)" % (k, n, len(papers[k]))
                                 for k, n in sorted(kinds.items()))
    head += "\nhole pictures=%d  papers=%d" % (len(papers["hole.pics"]), len(papers["hole"]))
    n_sites = sum(kinds.values())
    text = "\n".join([head, "sites=%d" % n_sites] + lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(head)
    print("sites=%d" % n_sites)
    return 0


if __name__ == "__main__":
    main()
