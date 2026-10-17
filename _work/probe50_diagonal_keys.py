r"""语料里到底有没有「对角方向键带距离」这种写法？§7 那一行的前提是「没有就不做，别为不存在的写法编映射」。

`_work/probe_side_key.py` 那族量过单边（`above=20pt`），这一支数**两词组合**：八个对角方向
（`above right`／`right above`／`below left`… 共 4×2 个顺序）× 三种带法（`=d`、`=d and d`、裸写不带 `=`），
并把它落在**哪个宿主**上分开数——节点选项、`\node` 后的名字后选项、边/路径的 `node[...]`、
还是 `/.style` 定义里（后者要样式展开才看得见，源侧数只是下界）。

用法：python _work/probe50_diagonal_keys.py            # 选项表口径（发射器看到的键）——这才是面
      python _work/probe50_diagonal_keys.py keywords  # 关键词口径，留着当反面教材：它把
                                                       # `label=above left:$f$` 也算成方向键
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

VERT = ("above", "below")
HORZ = ("left", "right")
WORDS = ["%s %s" % (v, h) for v in VERT for h in HORZ] + ["%s %s" % (h, v) for h in HORZ for v in VERT]
RX = re.compile(r"(?<![\w])(%s)\s*(=|:)\s*([^,;{}\]]*?)(?=[,\s;]|$)|(?<![\w])(%s)(?![\w])"
                % ("|".join(WORDS), "|".join(WORDS)))
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STYLE_DEF = re.compile(r"/[a-zA-Z0-9_./ ]*\.style\s*=\s*\{")


def hosts(seg):
    """Which construct the key sits in: a `/.style` body, a `node[...]`, or a picture/node option list."""
    if STYLE_DEF.search(seg):
        return "style-body"
    return "option-list"


def main():
    per = {}
    papers = {}
    pictures = 0
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        for pic in PICTURE.findall(src):
            pictures += 1
            # options are what the emitter reads, so scan every bracketed group in the picture
            for m in re.finditer(r"\[([^\[\]]*)\]", pic):
                group = m.group(1)
                for hit in RX.finditer(group):
                    word = hit.group(1) or hit.group(4)
                    if not word:
                        continue
                    if hit.group(1):
                        value = hit.group(3).strip()
                        kind = "bare-with-%s" % ("and" if " and " in value else "one-distance")
                    else:
                        value = ""
                        kind = "no-distance"
                    key = "%s | %s" % (word, kind)
                    per[key] = per.get(key, 0) + 1
                    papers.setdefault(key, set()).add(name[:40])
                    print("   %s  [%s]  %r  -> %s" % (name[:38], hosts(group), value, key))
    print("pictures scanned: %d" % pictures)
    print("distinct spellings found: %d" % len(per))
    for key in sorted(per, key=lambda k: -per[k]):
        print("   %-38s %3d  occurrences / %d papers" % (key, per[key], len(papers[key])))
    if not per:
        print("NO FACE: 语料里一个对角方向键都没有（含裸写），§7 那一行可撤")
    # what does the live reader answer for each spelling the corpus has?
    for key in sorted(per):
        word = key.split(" | ")[0]
        for spelling in ("%s=2mm" % word, "%s=2mm and 4mm" % word, word):
            o = cetz.opts(spelling)
            print("reader  %-28s -> %r" % (spelling, o))
        break
    print("bare four-word reader sanity: %r" % (cetz.opts("above=20pt"),))


def opts_view():
    r"""选项表口径：把每张图的每个中括号选项组交给 `cetz.opts`，问**它拿到的键**里有没有对角方向。

    关键词普查会把 `label=above left:$f$` 也算成方向键（这一支的 491 个「裸写」就是这么来的），
    而发射器读的是选项表——只有键叫 `above left` 一类才算。
    """
    from collections import Counter
    words = set(WORDS)
    buckets = Counter()
    pap = {}
    groups = 0
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        for pic in PICTURE.findall(src):
            for m in re.finditer(r"\[([^\[\]]*)\]", pic):
                groups += 1
                try:
                    table = cetz.opts(m.group(1))
                except Exception as exc:  # a group the reader cannot parse is its own finding
                    buckets["unreadable-group:%s" % type(exc).__name__] += 1
                    continue
                for key, val in table.items():
                    if key not in words:
                        continue
                    if val is True:
                        kind = "bare"
                    elif " of " in str(val):
                        # `above right=2mm of x` is answered by placed_at, not by _side_key
                        kind = "of-form"
                    elif " and " in str(val):
                        kind = "two-distance"
                    elif cetz._size(str(val)) is not None:
                        kind = "one-distance"
                    else:
                        kind = "unreadable-value"
                    buckets["%s | %s" % (key, kind)] += 1
                    pap.setdefault(kind, set()).add(name[:40])
                    if kind != "bare":
                        print("   %-15s %-40s %r=%r  group=%r"
                              % (kind, name[:38], key, val, m.group(1)[:56]))
    print("option groups read: %d" % groups)
    for kind in sorted(pap, key=lambda k: -len(pap[k])):
        n = sum(v for key, v in buckets.items() if key.endswith("| " + kind))
        print("%-16s %4d sites / %3d papers   %s" % (kind, n, len(pap[kind]),
              {k.split(" | ")[0]: v for k, v in buckets.items() if k.endswith("| " + kind)}))
    for k, v in buckets.items():
        if k.startswith("unreadable"):
            print("   %s %d" % (k, v))
    print("papers carrying either distance form: %d"
          % len(pap.get("one-distance", set()) | pap.get("two-distance", set())))
    for spelling in ("above right=2mm", "above left=2mm and 4mm", "above left", "above left=2mm of x"):
        o = cetz.opts(spelling)
        print("reader %-26s -> anchor=%r side=%r" % (spelling, cetz._anchor_name(o), cetz._side_key(o)))


def gap():
    r"""两处读数差在哪：关键词命中、选项表却给不出对角键的那些组，按「键名归类」列出来。

    口径差不是随机的：关键词是在**整串**上找词，选项表只承认**键名**是方向词的那个，
    所以 `label=above left:$f$` 一类「值里带方向词」的写法必然只出现在前者。
    这里把差异逐组打印成 (组, 关键词命中, 选项表的键)，让分类自己浮出来，而不是我口头解释。
    """
    from collections import Counter
    words = set(WORDS)
    klass = {}
    shown = 0
    carried = Counter()
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        for pic in PICTURE.findall(src):
            for m in re.finditer(r"\[([^\[\]]*)\]", pic):
                group = m.group(1)
                hits = [h for h in RX.finditer(group)
                        if (h.group(1) or h.group(4))]
                if not hits:
                    continue
                try:
                    table = cetz.opts(group)
                except Exception:
                    table = {}
                if any(k in words for k in table):
                    # the group DOES carry a diagonal key: count the keyword hits against it,
                    # because one table key can answer for several hits (`label=above left:` + `above left=2mm`)
                    carried["%d hits -> %d diagonal keys"
                            % (len(hits), sum(k in words for k in table))] += 1
                    continue
                for hit in hits:
                    word = hit.group(1) or hit.group(4)
                    if hit.group(1):
                        value = hit.group(3).strip()
                        kind = "with-distance" if " and " not in value else "and-form"
                    else:
                        kind = "bare"
                    at = group.find(word)
                    lead = group[max(0, at - 24):at]
                    tail = group[at + len(word):at + len(word) + 24]
                    cls = "value of %r" % re.sub(r"\s+", " ",
                                                 (lead.split(",")[-1] + tail.split(":")[0]).strip()) \
                        if (lead.endswith("=") or lead.endswith(":") or ":" in tail[:3]) \
                        else "loose text / other"
                    klass["%s | %s" % (cls, kind)] = klass.get("%s | %s" % (cls, kind), 0) + 1
                    if shown < 40:
                        shown += 1
                        print("   %-42s %r  keys=%s" % (cls, group[:78], sorted(table)[:6]))
    print("keyword-only hits, classified by the keyword view's own bucket:")
    for cls, n in sorted(klass.items(), key=lambda kv: -kv[1]):
        print("   %-42s %d" % (cls, n))
    print("total keyword hits with no diagonal key: %d" % sum(klass.values()))
    print("hits inside groups that DO carry a diagonal key:")
    for cls, n in sorted(carried.items()):
        print("   %-42s %d" % (cls, n))


if __name__ == "__main__":
    MODE = (sys.argv[1:] or ["opts"])[0]
    if MODE == "keywords":
        main()
    elif MODE == "gap":
        gap()
    else:
        opts_view()

