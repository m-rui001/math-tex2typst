"""Which papers could change under the math-citation fix: a cite command carrying a bracket note.

`bake_refs` runs on cleaned formula text, so a source-level scan is only a candidate list; the
precise set is whatever the conversion actually rewrites, which `regen_cite_list.py` reads off the
converted formulas.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
CITED_NOTE = re.compile(r"\\(?:cite[pt]|cite|autocite|parencite|textcite|citeauthor|citeyear"
                        r"|citetitle|nocite)(?![a-zA-Z])\s*\[[^\]]*\]")
CITED = re.compile(r"\\(?:cite[pt]|cite|nocite|autocite|parencite|textcite|citeauthor|citeyear"
                   r"|citetitle)(?![a-zA-Z])\s*(?:\[[^\]]*\])*\s*\{[^{}]*\}")
noted, any_cite, external = [], [], []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    if not (ROOT / "typst" / path.stem / "main.typ").is_file():
        continue
    src = path.read_text(encoding="utf-8", errors="replace")
    if CITED.search(src):
        any_cite.append(path.stem)
        if CITED_NOTE.search(src):
            noted.append(path.stem)
        if (ROOT / "typst" / path.stem / "refs.bib").is_file():
            external.append(path.stem)
print("papers citing anything: %d" % len(any_cite))
print("  ... with a bracket note on a cite: %d" % len(noted))
print("  ... with an external refs.bib: %d" % len(external))
(ROOT / "_work" / "regen_cite_candidates.txt").write_text("\n".join(any_cite), encoding="utf-8")
