r"""Which bib fields does the scanner reach, and what would a wider boundary cost?

`convert.BIB_FIELD_RX` anchored a field at the START of a line. A `.bib` entry is a
comma-separated list and an author may write two fields on one line, so
`author={Noga Alon and Vitali D. Milman},title={{$\lambda_1$}, Isoperimetric…}` was never read --
the page prints `\lambda_1` for it (`_work/page_syntax_run129.txt`, bscmd). The wider reading is
`key = {` after a line start OR a comma, walked left to right so a field's own braces are skipped
and a nested `key = {` cannot be matched twice.

This counts, over every bib in the corpus: the fields each of the two boundaries reaches, how many
of them a value's own text could be (`= "` -- a quoted value has no braces to skip), and whether
the brace matcher ever meets an unbalanced field. Read-only, no typst.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import convert
from t2t.texutil import find_group

LINE_RX = re.compile(r'(?im)^\s*(\w+)\s*=\s*\{')
BOUND_RX = re.compile(r'(?im)(?:^|,)\s*(\w+)\s*=\s*\{')
QUOTE_RX = re.compile(r'(?im)(?:^|,)\s*(\w+)\s*=\s*"')


def walk(rx, bib):
    """The fields a boundary reaches, each skipped whole so nesting cannot double-count."""
    spans, i = [], 0
    while True:
        m = rx.search(bib, i)
        if m is None:
            return spans
        stop = find_group(bib, m.end() - 1) - 1
        spans.append((m.group(1), m.end(), stop, bib[m.end():stop]))
        i = stop


bibs = []
for name in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    for key in ("refs.original.bib", "refs.bib"):
        path = os.path.join(ROOT, "typst", name, key)
        if os.path.isfile(path):
            bibs.append((name, open(path, encoding="utf-8").read()))
            break

line_fields = bound_fields = quoted_files = markup_only_in_wider = 0
extra, failures = [], []
for name, bib in bibs:
    a = walk(LINE_RX, bib)
    try:
        b = walk(BOUND_RX, bib)
    except ValueError:
        failures.append((name, "unbalanced under the wider boundary"))
        continue
    line_fields += len(a)
    bound_fields += len(b)
    if QUOTE_RX.search(bib):
        quoted_files += 1
    reached = {start for _, start, _stop, _v in a}
    for key, start, _stop, value in b:
        if start not in reached and convert.BIB_MARKUP_RX.search(value):
            markup_only_in_wider += 1
            extra.append((name, key, value[:70]))

print("bib files read: %d" % len(bibs))
print("fields reached: line-anchored %d, boundary %d (+%d)" % (line_fields, bound_fields,
                                                               bound_fields - line_fields))
print("of the wider reach, fields carrying markup the page cannot read: %d" % markup_only_in_wider)
print("bib files holding a quoted (non-braced) value: %d" % quoted_files)
print("unbalanced fields: %d %s" % (len(failures), failures[:3]))
for name, key, value in extra[:14]:
    print("  %-56s %-8s %s" % (name[:56], key, value))
