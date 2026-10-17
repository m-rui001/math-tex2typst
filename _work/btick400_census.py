# -*- coding: utf-8 -*-
# btick400_census.py  —  D400+ mistyped-closer candidate census.
# Shape: a chr(36) '$' sitting where the CLOSING backtick of a Markdown inline
# code span belongs. Detection (matches region_check's odd-$ yardstick):
#   For a '$' at index p: let nb = count of chr(96) backticks strictly before p.
#   If nb is ODD (an opener is still unclosed), and the maximal run of ASCII
#   code-ish chars ending at p-1 is non-empty AND is immediately preceded by a
#   backtick at q-1, then p is a candidate mistyped closer.
# Flipping p to a backtick: line '$' count -1 (odd->even), line backtick +1
# (odd->even). We record per-candidate the flip preconditions.
import glob
import io
import os
import re

BT = chr(96)      # backtick
DL = chr(36)      # dollar
CODEISH = set("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_:./-")
# self-report / declaration keywords that mark a KEEP line (author quotes defect)
KEEPWORDS = [u"应读作", u"登记", u"申报", u"实测", u"不回改", u"勘误", u"误写", u"错位"]


def note_id(path):
    b = os.path.basename(path)
    m = re.match(r"D(\d+)-", b)
    return int(m.group(1)) if m else None


def odd_dollar_lines(text):
    return sum(1 for l in text.split(u"\n") if l.count(DL) % 2)


def candidates(line):
    """Return list of (pos, open_pos, content) candidate mistyped closers."""
    out = []
    for p, ch in enumerate(line):
        if ch != DL:
            continue
        nb = line.count(BT, 0, p)   # backticks strictly before p
        if nb % 2 == 0:
            continue                 # no unclosed opener -> not this shape
        # walk back over the code-ish run ending at p-1
        q = p
        while q > 0 and line[q - 1] in CODEISH:
            q -= 1
        if q == p:
            continue                 # empty content
        if line[q - 1] != BT:
            continue                 # run not opened by a backtick
        # '$' must be at EOL or followed by a non-ASCII / CJK punctuation / space
        nxt = line[p + 1] if p + 1 < len(line) else None
        end_ok = (nxt is None) or (ord(nxt) > 127) or (nxt in u" \t")
        out.append((p, q - 1, line[q:p], end_ok))
    return out


def main():
    files = []
    for path in glob.glob(u"研究笔记/D*.md"):
        nid = note_id(path)
        if nid is not None and nid >= 400:
            files.append((nid, path))
    files.sort()

    rows = []
    notes_hit = 0
    total_sites = 0
    odd_before_total = 0
    odd_after_total = 0   # if every candidate were flipped
    per_note_odd = {}

    for nid, path in files:
        text = io.open(path, encoding="utf-8").read()
        lines = text.split(u"\n")
        odd_before = odd_dollar_lines(text)
        per_note_odd[nid] = odd_before
        odd_before_total += odd_before
        hit = 0
        for ln, line in enumerate(lines, 1):
            if line.count(DL) % 2 == 0:
                # only odd-$ lines can host the defect (yardstick); but still
                # scan: a candidate on an even-$ line can't fix the parity.
                pass
            for (p, op, content, end_ok) in candidates(line):
                keep_kw = [w for w in KEEPWORDS if w in line]
                line_bt = line.count(BT)
                line_dl = line.count(DL)
                flip_bt_even = (line_bt + 1) % 2 == 0
                flip_dl_to_even = line_dl % 2 == 1  # dropping 1 makes it even
                verdict = "REPAIR"
                reason = []
                if not flip_bt_even:
                    verdict = "KEEP"
                    reason.append("flip-leaves-backtick-odd")
                if not flip_dl_to_even:
                    verdict = "KEEP"
                    reason.append("line-dollars-even-not-oddyardstick")
                if not end_ok:
                    verdict = "KEEP"
                    reason.append("closer-not-at-eol-or-CJK")
                if keep_kw:
                    verdict = "KEEP"
                    reason.append("self-report-kw:" + u",".join(keep_kw))
                rows.append(dict(nid=nid, path=path, line=ln, lineno=ln,
                                 p=p, op=op, content=content,
                                 line_dl=line_dl, line_bt=line_bt,
                                 odd_before=odd_before,
                                 verdict=verdict, reason=u";".join(reason),
                                 raw=line))
                hit += 1
                total_sites += 1
        if hit:
            notes_hit += 1

    # odd-$ after: each REPAIR flip on an odd-$ line turns it even (net -1);
    # flips on already-even lines are excluded by the reason gate above.
    repair_rows = [r for r in rows if r["verdict"] == "REPAIR"]
    # de-dup: a note could have several lines; count distinct (path,line) flips
    flip_lines = set()
    for r in repair_rows:
        flip_lines.add((r["path"], r["lineno"]))
    odd_after_total = odd_before_total - len(flip_lines)

    with io.open(u"_work/btick400_sites.txt", "wb") as f:
        for r in rows:
            s = (u"nid=%d line=%d dl=%d bt=%d oddline=%d candpos=%d openpos=%d "
                 u"content=%s\nLINE: %s\n" % (
                     r["nid"], r["lineno"], r["line_dl"], r["line_bt"],
                     r["line_dl"] % 2, r["p"], r["op"], r["content"], r["raw"]))
            f.write(s.encode("utf-8"))

    with io.open(u"_work/btick400_plan.txt", "wb") as f:
        head = (u"TOTAL notes scanned(D400+)=%d  candidate_sites=%d  "
                u"notes_hit=%d\nodd-$ lines before(total)=%d  "
                u"after(all REPAIR flips)=%d\nREPAIR=%d  KEEP=%d\n" % (
                    len(files), total_sites, notes_hit,
                    odd_before_total, odd_after_total,
                    len(repair_rows), len(rows) - len(repair_rows)))
        f.write(head.encode("utf-8"))
        for r in rows:
            rec = (u"[%s] nid=%d line=%d content=%s reason=%s\n    LINE: %s\n" % (
                r["verdict"], r["nid"], r["lineno"], r["content"],
                r["reason"] or u"ok", r["raw"]))
            f.write(rec.encode("utf-8"))

    # ASCII-only stdout summary (no Chinese to console)
    print("scanned_D400plus=%d candidate_sites=%d notes_hit=%d" % (
        len(files), total_sites, notes_hit))
    print("odd_dollar_before=%d odd_dollar_after=%d" % (
        odd_before_total, odd_after_total))
    print("REPAIR=%d KEEP=%d" % (len(repair_rows), len(rows) - len(repair_rows)))
    # per-note REPAIR counts
    byn = {}
    for r in repair_rows:
        byn[r["nid"]] = byn.get(r["nid"], 0) + 1
    print("repair_by_note=" + str(sorted(byn.items())))


if __name__ == "__main__":
    main()
