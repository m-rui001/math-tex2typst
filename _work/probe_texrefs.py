"""Why do references dangle? Compare \\label and \\ref sets in the flattened source.

The emitter only knows about labels it could attach to a block it understands, so a
reference is dangling either because its target was never labelled in this file, or
because the label sat somewhere the conversion dropped.

Run: python _work/probe_texrefs.py [count]
"""
import collections
import pathlib
import re
import sys

FLAT = pathlib.Path(__file__).resolve().parents[1] / "_work" / "flat"

LABEL = re.compile(r"\\label[ \t]*\{([^{}]*)\}")
REF = re.compile(r"\\(?:eq|auto|nam|pa|[cC])?ref(?![a-zA-Z])[ \t]*\*?\{([^{}]*)\}")


def main(limit):
    papers = sorted(FLAT.glob("*.tex"))[:limit] if limit else sorted(FLAT.glob("*.tex"))
    prefixes = collections.Counter()
    kinds = collections.Counter()
    examples = {}
    papers_with_refs = 0
    total_refs = total_missing = 0
    for path in papers:
        if path.name.startswith("_"):
            continue
        text = path.read_text(encoding="utf-8", errors="replace")
        labels = set(LABEL.findall(text))
        targets = REF.findall(text)
        if not targets:
            continue
        papers_with_refs += 1
        for target in targets:
            total_refs += 1
            for part in re.split(r"[,;]\s*", target):
                part = part.strip()
                if not part:
                    continue
                if part in labels:
                    continue
                total_missing += 1
                prefix = part.split(":")[0] if ":" in part else "(no-prefix)"
                prefixes[prefix] += 1
                first = part.split(":")[0] if ":" in part else part
                kinds[first if ":" in part else "(bare)"] += 1
                examples.setdefault(prefix, (path.name, part, len(labels)))
    print("papers=%d with_refs=%d refs=%d missing=%d"
          % (len(papers), papers_with_refs, total_refs, total_missing))
    print("\nby label prefix:")
    for prefix, count in prefixes.most_common(25):
        name, part, nlabels = examples[prefix]
        print("  %-14s %5d  e.g. %-28s (%s, %d labels in file)"
              % (prefix, count, part[:28], name[:34], nlabels))


if __name__ == "__main__":
    main(int(sys.argv[1]) if len(sys.argv) > 1 else 0)
