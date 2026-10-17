# How many flat files change if the TeX-correct candidate (entry-root/target) is tried before the
# same-basename fallback? Orderings compared on every manifest entry; typst is never called.
import json
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
import inventory as inv

ORDERINGS = {
    "current (base, base/basename, root, root/basename)": 0,
    "TeX-correct (base, root, base/basename, root/basename)": 1,
}


def flatten_ordered(path, seen, missing, root, base_root_first, depth=0):
    real = os.path.abspath(path)
    if real in seen or depth > 24:
        return ""
    seen.add(real)
    text = inv.strip_comments(inv.read(path))
    base = os.path.dirname(path)

    def repl(m):
        target = m.group(1).strip()
        if not target.endswith(".tex"):
            target += ".tex"
        if os.path.basename(target).startswith("glyphtounicode"):
            return ""
        near = [os.path.normpath(os.path.join(base, target)),
                os.path.normpath(os.path.join(base, os.path.basename(target)))]
        far = [os.path.normpath(os.path.join(root, target)),
               os.path.normpath(os.path.join(root, os.path.basename(target)))]
        cands = (near[:1] + far[:1] + near[1:] + far[1:]) if base_root_first else (near + far)
        inlined = False
        for p in cands:
            if not os.path.exists(p):
                continue
            if os.path.abspath(p) in seen:
                inlined = True
                continue
            return flatten_ordered(p, seen, missing, root, base_root_first, depth + 1)
        if inlined:
            return ""
        missing.append(os.path.relpath(path, inv.PREPRINTS) + " -> " + m.group(1))
        return ""

    return inv.INPUT_RE.sub(repl, text)


KEYS = [("The-Kervaire-Invariant-Problem-at-the-Prime-Three-September-24-2026", "finite:enclosures"),
        ("A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026", "apptr:coupling-table")]

manifest = json.loads(open(os.path.join(inv.ROOT, "_work", "manifest.json"), encoding="utf-8").read())
entries = [e for e in manifest if e.get("entry")]
for label, first in ORDERINGS.items():
    grew = 0
    unresolved = 0
    total = 0
    recovered_keys = []
    for e in entries:
        entry = os.path.join(inv.PREPRINTS, e["paper"], e["entry"])
        missing = []
        body = flatten_ordered(entry, set(), missing, os.path.dirname(entry), first)
        disk = os.path.join(inv.ROOT, "_work", "flat", e["paper"] + ".tex")
        old = open(disk, encoding="utf-8", errors="replace").read() if os.path.exists(disk) else ""
        if len(body) > len(old):
            grew += 1
        unresolved += len(missing)
        total += len(body)
        for paper, key in KEYS:
            if e["paper"] == paper and key in re.findall(r"\\label\s*\{([^{}]+)\}", body):
                recovered_keys.append(paper[:38] + " / " + key)
    print("%s\n   grows_vs_disk=%d unresolved=%d total_bytes=%d" % (label, grew, unresolved, total))
    print("   tracked keys present: %s" % (recovered_keys or "none"))
