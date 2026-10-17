"""Reconcile #96's two counts on ONE ruler.

``probe94_bare_slash.py`` reported **spans** (14,367 over 672 papers); ``probe96_face.py``
reports **sites** (one per bare slash). A span can carry several slashes, so the two are
different quantities, not two measurements of the same one. This reads the site census
``m96_face.tsv`` and re-derives the span count from it, so both numbers come off the same
walk and the same 判据.
"""
import csv
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TSV = os.path.join(ROOT, "_work", "m96_face.tsv")


def spans_with_multiplicity(rows):
    """Count maths spans, not distinct span *texts*: the site stream is a walk, so every
    run of consecutive rows with the same (paper, span) came from one span."""
    out = []
    cur = None
    for r in rows:
        key = (r["paper"], r["span"])
        if key != cur:
            out.append([key, r["kind"], 0])
            cur = key
        out[-1][2] += 1
    return out


def main():
    with open(TSV, encoding="utf-8", newline="") as fh:
        rows = list(csv.DictReader(fh, delimiter="\t"))
    sites = len(rows)
    papers = {r["paper"] for r in rows}
    runs = spans_with_multiplicity(rows)
    spans = len(runs)
    multi = {}
    for _, _, n in runs:
        multi[n] = multi.get(n, 0) + 1
    print("same walk, two quantities:")
    print("   sites (one per bare `/`)          = %d over %d papers" % (sites, len(papers)))
    print("   spans (a span may carry several)  = %d over %d papers" % (spans, len(papers)))
    print("   slashes per span: %s" % " ".join("%d->%d" % (k, multi[k])
                                               for k in sorted(multi)))
    faithful = [r for r in runs if r[1] == "last-in-span"]
    print("   faithful spans = %d over %d papers" % (len(faithful),
                                                     len({k[0] for k, _, _ in faithful})))
    run = [r for r in runs if r[1] != "last-in-span"]
    print("   runaway spans  = %d over %d papers" % (len(run), len({k[0] for k, _, _ in run})))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
