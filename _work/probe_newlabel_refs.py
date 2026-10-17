"""What the corpus would gain from two reference fixes.

\\newlabel{key}{{2.3}{5}{}{}{}} is what LaTeX writes for a cross-reference it resolved
in an earlier run; these preprints keep the lines, so a reference whose \\label lives in
a different draft still has its number on the page. And \\ref{a,b} names two targets,
which the emitter currently reads as one impossible label.

Run: python _work/probe_newlabel_refs.py
"""
import collections
import pathlib
import re

FLAT = pathlib.Path(__file__).resolve().parents[1] / "_work" / "flat"

LABEL = re.compile(r"\\label[ \t]*\{([^{}]*)\}")
NEWLABEL = re.compile(r"\\newlabel\{([^{}]*)\}\{\{([^{}]*)\}")
REF = re.compile(r"\\(?:eq|auto|nam|pa|[cC])?ref(?![a-zA-Z])[ \t]*\*?\{([^{}]*)\}")

kinds = collections.Counter()
newlabel_number = collections.Counter()
multi = collections.Counter()
examples = {}
for path in sorted(FLAT.glob("*.tex")):
    if path.name.startswith("_"):
        continue
    text = path.read_text(encoding="utf-8", errors="replace")
    labels = set(LABEL.findall(text))
    aux = dict((k, v) for k, v in NEWLABEL.findall(text))
    for target in REF.findall(text):
        parts = [p.strip() for p in re.split(r"[,;]\s*", target) if p.strip()]
        if len(parts) > 1:
            multi["multi-key-ref"] += 1
            kinds["multi-part"] += len(parts)
        else:
            kinds["single"] += 1
        for part in parts:
            if part in labels:
                kinds["resolved-by-label"] += 1
            elif part in aux:
                kinds["resolved-by-newlabel"] += 1
                newlabel_number[aux[part]] += 1
                examples.setdefault("newlabel", (path.name, part, aux[part]))
            else:
                kinds["absent"] += 1
                examples.setdefault("absent", (path.name, part, ""))

print("refs: %s" % dict(kinds))
print("multi-key refs=%d" % multi["multi-key-ref"])
print("newlabel fallback numbers seen=%d distinct=%d"
      % (kinds["resolved-by-newlabel"], len(newlabel_number)))
print("  e.g. %s" % (examples.get("newlabel"),))
print("  still absent e.g. %s" % (examples.get("absent"),))
