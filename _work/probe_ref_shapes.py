r"""Size the two reference shapes the dangling probe kept returning.

xr companion files put the number of an outside label in \\newlabel{key}{{6.3}{17}{...}},
and cleveref writes several targets in one command as a comma list. Neither reaches a
converter that only reads \\label and looks the whole argument up as one key.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"

NEWLABEL = re.compile(r"\\newlabel\{([^{}]*)\}\{\{([^{}]*)\}")
LABEL = re.compile(r"\\label\s*\*?\s*(?:\[[^\]]*\])?\s*\{([^{}]*)\}")
REFCMD = re.compile(r"\\(?:ref|eqref|[Cc]ref|[Vv]ref|pageref|autoref|nameref|Lref)\s*\*?"
                    r"(?:\[[^\]]*\])*\s*\{([^{}]*)\}")

nl_papers = 0
nl_only = collections.Counter()
comma_occ = collections.Counter()
comma_papers = 0
nl_examples = []
for src in sorted(FLAT.glob("*.tex")):
    text = src.read_text(encoding="utf-8", errors="replace")
    new = {}
    for m in NEWLABEL.finditer(text):
        new.setdefault(m.group(1), m.group(2))
    own = set(LABEL.findall(text))
    if new:
        nl_papers += 1
    hit = 0
    has_comma = False
    for m in REFCMD.finditer(text):
        key = m.group(1)
        parts = [p.strip() for p in key.split(",") if p.strip()]
        if len(parts) > 1:
            has_comma = True
            comma_occ[m.group(0).split("{")[0]] += 1
            for p in parts:
                if p not in own and p not in new:
                    pass
            continue
        if key in new and key not in own:
            nl_only[key] += 1
            hit += 1
            if len(nl_examples) < 6:
                nl_examples.append("%s  %s -> %s" % (src.stem[:34], key, new[key]))
    if has_comma:
        comma_papers += 1
    if new and hit == 0 and len(nl_examples) < 3:
        nl_examples.append("%s: %d newlabel, no ref uses them" % (src.stem[:34], len(new)))

print("papers carrying \\newlabel: %d ; refs answered only by it: %d occurrences, %d keys"
      % (nl_papers, sum(nl_only.values()), len(nl_only)))
print("papers with comma-list refs: %d ; occurrences by command: %s"
      % (comma_papers, dict(comma_occ.most_common(10))))
print("\nexamples:")
for e in nl_examples:
    print("  " + e)
print("\ntop companion keys:")
for k, n in nl_only.most_common(10):
    print("%5d  %s" % (n, k[:60]))
