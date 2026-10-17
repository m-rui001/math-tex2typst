# -*- coding: utf-8 -*-
"""整块置换：把 ## 编号节的物理顺序排回编号升序。只换块，不改任何字节。
两种编号写法都认：'## §N 标题' 与 '## N. 标题'。
用法: python _work/perm_blocks.py [--apply] ID ...
"""
import io, os, re, sys

sys.stdout.reconfigure(encoding="utf-8")
BASE = u"\u7814\u7a76\u7b14\u8bb0"
NUM = re.compile(u"^## *(?:\u00a7 ?)?(\\d+)(?=[. \u3001])")
ANY = re.compile(u"^## ")


def find_file(i):
    for f in sorted(os.listdir(BASE)):
        if f.startswith(u"D%s-" % i) and f.endswith(u".md"):
            return os.path.join(BASE, f)
    return None


def main():
    ids = [a for a in sys.argv[1:] if a != u"--apply"]
    apply = u"--apply" in sys.argv[1:]
    for i in ids:
        p = find_file(i)
        if not p:
            print(i, "NOFILE")
            continue
        raw = io.open(p, encoding="utf-8", newline="").read()
        lines = raw.split(u"\n")
        h2 = [k for k, l in enumerate(lines) if ANY.match(l) and not l.startswith(u"###")]
        num_at = {}
        for k in h2:
            m = NUM.match(lines[k])
            if m:
                num_at[k] = int(m.group(1))
        unnum = [k for k in h2 if k not in num_at]
        nums = [num_at[k] for k in h2 if k in num_at]
        first_num = min(num_at) if num_at else None
        last_num = max(num_at) if num_at else None
        stray = [k for k in unnum if first_num is not None and k > last_num]
        bad = [k for k in unnum if k not in stray]
        if bad:
            print("D%s SKIP stray H2 at %s %s" % (i, bad[:3], [lines[k][:20] for k in bad[:3]]))
            continue
        if len(set(nums)) != len(nums):
            print("D%s SKIP dup numbers %s" % (i, nums))
            continue
        if nums == sorted(nums):
            print("D%s already ordered (%d blocks)" % (i, len(nums)))
            continue
        cut = sorted(h2)
        blocks = []
        for idx, k in enumerate(cut):
            if k not in num_at:
                continue
            end = cut[idx + 1] if idx + 1 < len(cut) else len(lines)
            blocks.append((num_at[k], k, end))
        # unnumbered H2 that sits before the first numbered one stays in preamble;
        # an unnumbered H2 inside a block is carried with that block (its own lines)
        order = [b[0] for b in blocks]
        newb = sorted(blocks, key=lambda b: b[0])
        pre_end = blocks[0][1]
        tail = lines[min(stray):] if stray else []
        rebuilt = lines[:pre_end] + [l for b in newb for l in lines[b[1]:b[2]]] + tail
        out = u"\n".join(rebuilt)
        same = len(out.encode("utf-8")) == len(raw.encode("utf-8"))
        multiset = sorted(lines) == sorted(rebuilt)
        n2 = [int(NUM.match(l).group(1)) for l in rebuilt if NUM.match(l) and l.startswith(u"## ")]
        mono = n2 == sorted(n2)
        steps = all(n2[k + 1] - n2[k] == 1 for k in range(len(n2) - 1))
        print("D%s size=%d blocks=%d moves=%d bytes_same=%s multiset=%s mono=%s strict=%s seq=%s"
              % (i, len(raw.encode("utf-8")), len(blocks),
                 sum(1 for a, b in zip(blocks, newb) if a[1] != b[1]), same, multiset, mono, steps, n2))
        if apply:
            assert same and multiset and mono, "refuse"
            bakdir = os.path.join("_work", "reorder-bak")
            if not os.path.isdir(bakdir):
                os.makedirs(bakdir)
            bak = os.path.join(bakdir, u"D%s.pre-perm.md" % i)
            if not os.path.exists(bak):
                io.open(bak, "w", encoding="utf-8", newline="").write(raw)
            io.open(p, "w", encoding="utf-8", newline="").write(out)
            print("   APPLIED D%s bak=%s" % (i, bak))


main()
