r"""Rewrite §0 and §1 of _work/community.md between the markers.

The old §1 was a per-round status table running from #25 to #49 with an empty "本轮测量" column for
half its rows -- 7 KB that duplicated §2 and §7 and went stale every round.  This cuts it down to the
baseline gauges and puts the collaboration board above it.
"""
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
DOC = os.path.join(HERE, "community.md")

NEW = open(os.path.join(HERE, "board_new.md"), encoding="utf-8").read().rstrip("\n")


def main():
    text = open(DOC, encoding="utf-8").read()
    start = text.index("## 1. ")
    end = text.index("## 2. ")
    body = text[start:end]
    if "run112/113 基线" not in body:
        print("!! §1 does not look like the stale table; refusing to overwrite")
        print(body[:200])
        return
    out = text[:start] + NEW + "\n\n" + text[end:]
    open(DOC, "w", encoding="utf-8").write(out)
    print("replaced %d chars of section 1 with %d" % (len(body), len(NEW)))
    for pat in ("## 0. ", "## 1. ", "## 2. ", "## 3. ", "## 7. "):
        print("   %-10s at %d" % (pat.strip(), out.index(pat)))
    print("total chars: %d -> %d" % (len(text), len(out)))


if __name__ == "__main__":
    main()
