r"""maths 里究竟有几家拼写被 pandoc 合成同一个 `#h(0em)`——决定能不能在 post-writer 统一改价。

B 的 `_work/probe87_math_spans.py` 已在数学跨度内数了 `\;`（217／74 篇）与 `\enspace`（3／1 篇），
并按 writer 神谕确认「任何 `\hspace{长度}`」与「`\mspace{5mu}`」也发成 `#h(0em)`（长度整个被丢）。
**那两家的数学面还没数**——若它们非零，`tex_space_values` 里一条 `#h(0em)`→`#h(0.27778em)` 就会
把 `\hspace{1cm}` 也读成 5mu：这是「一家一价」还是「三家一价」的唯一判据。

尺只调 B 那一支的 `spans()`，不自带第二条走弦器。

用法：python _work/probe87_hspace_face.py
"""
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe87_math_spans as B  # noqa: E402

SPELLINGS = [
    ("semi", re.compile(r"\\;")),
    ("enspace", re.compile(r"\\enspace(?![A-Za-z])")),
    ("hspace", re.compile(r"\\hspace\*?\s*\{([^{}]*)\}")),
    ("mspace", re.compile(r"\\mspace\s*\{([^{}]*)\}")),
    ("qquad", re.compile(r"\\qquad(?![A-Za-z])")),
]


def main():
    totals = dict((n, [0, 0]) for n, _ in SPELLINGS)
    per_len = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        text = io.open(path, encoding="utf-8", errors="replace").read()
        maths = "".join(text[a:b] for a, b in B.spans(text))
        for name, rx in SPELLINGS:
            hits = rx.findall(maths)
            if hits:
                totals[name][0] += len(hits)
                totals[name][1] += 1
                if name in ("hspace", "mspace"):
                    for arg in hits:
                        per_len.setdefault("%s:%s" % (name, arg.strip()), [0, set()])
                        per_len["%s:%s" % (name, arg.strip())][0] += 1
    print("papers with flat sources: %d" % len(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))))
    for name, _ in SPELLINGS:
        print("  in-maths %-8s %6d occurrences / %4d papers" % (name, totals[name][0], totals[name][1]))
    print("  -- the lengths `\\hspace`/`\\mspace` actually carry inside maths --")
    for key in sorted(per_len, key=lambda k: -per_len[k][0])[:20]:
        print("    %-26s %d" % (key, per_len[key][0]))


if __name__ == "__main__":
    main()
