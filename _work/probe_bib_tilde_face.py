r"""Measure #77's faces before choosing where the fix goes.

(a) What does pandoc's plain writer ANSWER for a `.bib` field carrying LaTeX's hard space? If it
    prints `~` the fix belongs after the pass; if it answers a space, the fields that print a tilde
    today are simply the ones the pass never reads -- BIB_MARKUP_RX has no `~`.
(b) The corpus face, per field value: is the tilde LaTeX's hard space or a URL's own character, and
    does the current flatten read that field at all? The newly-read set is the churn, and the
    URL-bearing fields inside it are the risk that decides whether the pass needs a link mask.
"""
import io
import os
import re
import sys
from collections import Counter, defaultdict

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

from t2t import mathconv
from t2t.convert import BIB_FIELD_RX, BIB_LINK_KEYS, bib_field_spans, find_group

CASES = [
    r"Vol.~II",
    r"No.~62",
    r"Article~90",
    r"Part~I",
    r"3.~Folge",
    r"Theorem~1.2",
    r"\url{https://pi.math.cornell.edu/~hatcher/AT/AT.pdf}",
    r"see https://www.renyi.hu/~gharcos/bombieri.pdf",
    r"arXiv:2410.18372v1 [math.GT] 15~Oct 2024",
    r"~10{,}000~participants",
    r"$x\sim y$",
    r"Edition~2, Revised~Printing",
    r"In {\emph Algebra and Geometry, Vol.~II}, a note",
]

URLISH = re.compile(r"(?:https?|ftp|doi)://\S*|arXiv:\S*|"
                    r"\b[\w.-]+\.(?:edu|org|com|net|hu|uk|de|fr|jp|cn|ch|se|pl|cz|it|es)\S*")


def part_a():
    print("=== (a) what the plain writer answers")
    ans = mathconv.convert_plain_batch(CASES)
    for i, text in sorted(ans.items()):
        print("  %-62r -> %r" % (CASES[i], text))
    print("  bib_plain's whitespace collapse on a NBSP: %r" % (" ".join("Vol.\xa0II".split())))


def part_b():
    print("\n=== (b) corpus face, crossed with 'does the flatten read this field'")
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    out = os.path.join(root, "typst")
    stats = Counter()
    papers = defaultdict(set)
    samples = defaultdict(list)
    bare = Counter()
    for name in sorted(os.listdir(out)):
        d = os.path.join(out, name)
        if not os.path.isdir(d):
            continue
        src = os.path.join(d, "refs.original.bib")
        if not os.path.exists(src):
            continue
        with io.open(src, encoding="utf-8", errors="replace") as f:
            bib = f.read()
        read_spans = {(st, sp) for st, sp, _v in bib_field_spans(bib)}
        i = 0
        while True:
            m = BIB_FIELD_RX.search(bib, i)
            if m is None:
                break
            start = m.end()
            stop = find_group(bib, start - 1) - 1
            value = bib[start:stop]
            i = stop
            if "~" not in value:
                continue
            key = m.group(1).lower()
            urls = [u.group(0) for u in URLISH.finditer(value)]
            n = value.count("~")
            in_url = sum(u.count("~") for u in urls)
            read = (start, stop) in read_spans
            if key in BIB_LINK_KEYS:
                tag = "link-field"
            elif in_url == n:
                tag = "all-in-url"
            elif in_url:
                tag = "mixed"
            else:
                tag = "hard-space"
            stats[(tag, read)] += n
            papers[(tag, read)].add(name)
            if not read and tag in ("hard-space", "mixed") and urls:
                bare[(tag, value[:70])] += 1
            if len(samples[tag]) < 6:
                samples[tag].append((read, name, key, value[:100]))
    for tag in ("link-field", "all-in-url", "mixed", "hard-space"):
        for read in (True, False):
            k = (tag, read)
            if stats[k]:
                print("  %-11s read-by-flatten=%-5s %5d tildes / %4d papers"
                      % (tag, read, stats[k], len(papers[k])))
    print("\n  fields NOT read today that carry BOTH a hard space and a URL (the mask question):")
    for (tag, v), c in sorted(bare.items(), key=lambda x: -x[1])[:8]:
        print("   %-11s %d  %s" % (tag, c, v.replace("\n", " ")))
    print("\n  samples:")
    for tag in ("hard-space", "mixed", "all-in-url"):
        for read, name, key, value in samples[tag]:
            print("   %-11s read=%-5s %-34s %-10s %s"
                  % (tag, read, name[:34], key, value.replace("\n", " ")))


if sys.argv[1:] and sys.argv[1][0] == "a":
    part_a()
else:
    part_b()
