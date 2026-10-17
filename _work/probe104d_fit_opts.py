r"""#104d: what does the option reader hand the emitter for a `fit=` node?

The five statements of the corpus face (`_work/label104c_fit_face.txt`) are the whole population, so
this asks `cetz.opts` what each option group becomes -- the key name, the value's shape (a bare
`(a)(b)` run, a brace group, an anchored reference) and which other keys stand beside it (the style
name a `panel` node carries, the seps the author wrote).  Nothing here measures the page; it only
reads the emitter's own input, which is the one thing a fix has to match.

  PYTHONIOENCODING=utf-8 python _work/probe104d_fit_opts.py  ->  _work/label104d_fit_opts.txt
"""
import glob
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import cetz  # noqa: E402

GROUP = re.compile(r"\\node\[([^\]]*fit=[^\]]*)\]")


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    lines = []
    for path in sorted(glob.glob(os.path.join(HERE, "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        for m in GROUP.finditer(text):
            o = cetz.opts(m.group(1))
            lines.append("%s  group=%r" % (stem[:44], m.group(1)))
            lines.append("    fit=%r  ->  keys %s" % (o.get("fit"), sorted(o)))
    out = "\n".join(lines) + "\n"
    io.open(os.path.join(HERE, "label104d_fit_opts.txt"), "w", encoding="utf-8").write(out)
    print(out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
