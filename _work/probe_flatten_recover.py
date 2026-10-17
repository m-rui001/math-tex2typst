# Static, typst-free: re-flatten every entry with the patched candidate walk and
# compare against the flat files run87 left on disk.
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
import inventory as inv

FLAT = os.path.join(inv.ROOT, "_work", "flat")

LABEL = re.compile(r"\\label\{([^{}]+)\}")
REF = re.compile(r"\\(?:ref|eqref|autoref|cref|Cref|pageref)\{([^{}]+)\}")

grew = 0
shrank = 0
same = 0
missing_now = []
cases = []

for paper in sorted(os.listdir(inv.PREPRINTS)):
    d = os.path.join(inv.PREPRINTS, paper)
    if not os.path.isdir(d):
        continue
    cand = inv.candidates(d)
    if not cand:
        continue
    flat_path = os.path.join(FLAT, paper + ".tex")
    if not os.path.exists(flat_path):
        continue
    old = inv.read(flat_path)
    missing = []
    new = inv.flatten(cand[0], set(), missing, os.path.dirname(cand[0]))
    if len(new) > len(old):
        grew += 1
    elif len(new) < len(old):
        shrank += 1
    else:
        same += 1
    lost_labels = set(LABEL.findall(old))
    gained = sorted(set(LABEL.findall(new)) - lost_labels)
    dangling = sorted(set(REF.findall(old)) - lost_labels)
    if gained and set(gained) & set(dangling):
        cases.append((paper, sorted(set(gained) & set(dangling))))
    missing_now.extend(missing)

print("flat files: grew=%d shrank=%d same=%d" % (grew, shrank, same))
print("unresolved includes after the fix: %d" % len(missing_now))
for m in missing_now[:10]:
    print("  " + m)
print("papers whose dangling refs gain their label: %d" % len(cases))
for paper, names in cases[:15]:
    print("  %-52s %s" % (paper[:52], ",".join(names)))
