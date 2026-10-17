# -*- coding: utf-8 -*-
# 收稿宏腿：按该篇 preamble 的定义精确展开新区域里的自定义控制字
# 用法：python _work/intake_macro_fix.py <ID> <from-line> [--apply]
import io, glob, sys, re

MAPS = {
    "D04": [(r"\1", r"\mathbf 1"), (r"\E", r"\mathbb E"), (r"\Pbb", r"\mathbb P")],
    "D718": [(r"\re", r"\operatorname{Re}"), (r"\norm", None)],  # None = 带花括号参数的改写
}


def brace_arg(s, i):
    depth = 0
    j = i
    while j < len(s):
        if s[j] == "{":
            depth += 1
        elif s[j] == "}":
            depth -= 1
            if depth == 0:
                return s[i + 1:j], j
        j += 1
    return None, -1


def main():
    key, frm = sys.argv[1], int(sys.argv[2])
    do_apply = "--apply" in sys.argv
    p = glob.glob("E:/math/研究笔记/%s-*.md" % key)[0]
    s = io.open(p, encoding="utf-8", newline="").read()
    before = snap(s)
    L = s.split("\n")
    pats = [(re.escape(k) + r"(?![A-Za-z])", k, rep) for k, rep in MAPS[key]]
    pats = [(re.compile(rx), k, rep) for rx, k, rep in pats]
    changed = {}
    skipped = []
    for i in range(frm - 1, len(L)):
        line = L[i]
        if any(pp.search(line) for pp, k, rep in pats):
            if "`" in line:
                skipped.append((i + 1, "verbatim-line"))
                continue
        for pp, k, rep in pats:
            n = len(pp.findall(line))
            if not n:
                continue
            if rep is None:
                out = line
                while True:
                    mm = pp.search(out)
                    if not mm:
                        break
                    j = mm.end()
                    while j < len(out) and out[j] == " ":
                        j += 1
                    if j < len(out) and out[j] == "{":
                        content, endj = brace_arg(out, j)
                        if content is None:
                            skipped.append((i + 1, "unbalanced " + k))
                            break
                        out = out[:mm.start()] + r"\lVert " + content + r"\rVert" + out[endj + 1:]
                    else:
                        skipped.append((i + 1, "no-brace-arg " + k))
                        break
                changed[k] = changed.get(k, 0) + (len(pp.findall(line)) - len(pp.findall(out)))
                line = out
            else:
                changed[k] = changed.get(k, 0) + n
                line = pp.sub(lambda z, r=rep: r, line)
        L[i] = line
    new = "\n".join(L)
    after = snap(new)
    print("APPLY=%s" % do_apply)
    for k in before:
        print("  %-7s %d -> %d" % (k, before[k], after[k]))
    print("  changed=%s" % changed)
    print("  skipped=%s" % skipped)
    residual = {}
    for k, rep in MAPS[key]:
        residual[k] = len(re.findall(re.escape(k) + r"(?![A-Za-z])", new))
    print("  residual=%s" % residual)
    if do_apply:
        io.open(p, "w", encoding="utf-8", newline="").write(new)
        print("  written bytes=%d" % len(new.encode("utf-8")))


def snap(s):
    return dict(bytes=len(s.encode("utf-8")), dollars=s.count("$"), backtick=s.count("`"),
                lines=s.count("\n") + 1, CR=s.count("\r"))


if __name__ == "__main__":
    main()
