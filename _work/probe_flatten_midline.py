"""Re-flatten only the papers whose flat file still carries a literal \input.

Writes to a scratch dir, not _work/flat, so a corpus run in progress keeps its inputs.
Run: python _work/probe_flatten_midline.py
"""
import os
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import inventory  # noqa: E402

CMD_RX = re.compile(r"\\(?:input|include|subfile)\s*\{([^{}]*)\}")
OUT = ROOT / "_work" / "midline_flat"


def main():
    OUT.mkdir(exist_ok=True)
    affected = []
    for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        body = tex.read_text(encoding="utf-8", errors="replace")
        targets = [m for m in CMD_RX.findall(body) if not m.strip().startswith("glyphtounicode")]
        if targets:
            affected.append((tex.stem, targets))

    for name, targets in affected:
        entry = inventory.candidates(os.path.join(inventory.PREPRINTS, name))[0]
        missing = []
        flat = inventory.flatten(entry, set(), missing, os.path.dirname(entry))
        (OUT / (name + ".tex")).write_text(flat, encoding="utf-8")
        left = CMD_RX.findall(flat)
        print("%s\n  targets were: %s" % (name[:58], targets))
        print("  bibitems=%d thebibliography=%d tikzpictures=%d input{figures}=%d still-literal=%s missing=%s"
              % (flat.count("\\bibitem"), flat.count("\\begin{thebibliography}"),
                 flat.count("\\begin{tikzpicture}"), len(re.findall(r"\\input\{figures", flat)),
                 left, missing))


if __name__ == "__main__":
    main()
