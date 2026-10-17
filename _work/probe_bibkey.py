"""Why do citations have no number? split the 104 missing_bibkey notes by cause.

A baked-bibliography paper needs its cited keys to appear as \bibitem in its own source;
a .bib paper needs them in the bib files prepare_assets collected. Run: python _work/probe_bibkey.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"

CITE_RX = re.compile(r"\\(?:cite|citep|citet|nocite|parencite|textcite)"
                     r"(?:\[[^\]]*\])*(?:\[[^\]]*\])?\{([^{}]*)\}")
BIBITEM_RX = re.compile(r"\\bibitem(?:\[[^\]]*\])?\{([^}]*)\}")


def keys(text):
    return [k.strip() for chunk in re.findall(r"\\(?:cite|citep|citet|nocite|parencite|textcite)"
                                              r"(?:\[[^\]]*\])*\{([^{}]*)\}", text)
            for k in chunk.split(",") if k.strip()]


def main():
    baked_missing, bib_missing, ok = [], [], 0
    for tex in sorted(FLAT.glob("*.tex")):
        body = tex.read_text(encoding="utf-8", errors="replace")
        if "_work_tex" in tex.parts:
            continue
        cited = keys(body)
        if not cited:
            continue
        if "\\begin{thebibliography}" in body:
            have = {k.strip() for k in BIBITEM_RX.findall(body)}
            miss = sorted({k for k in cited if k not in have})
            if miss:
                baked_missing.append((tex.stem, len(cited), miss))
            else:
                ok += 1
            continue
        if "\\bibliography{" not in body:
            continue
        names = {pathlib.Path(s.strip()).stem
                 for m in re.findall(r"\\bibliography\{([^}]*)\}", body) for s in m.split(",")}
        origin = ROOT / "preprints" / tex.stem.split("-alternate-")[0]
        bibs = [p for p in origin.rglob("*.bib") if p.stem in names]
        have = set()
        for p in bibs:
            have |= {m.group(1) for m in
                     re.finditer(r"@\w+\s*\{\s*([^,\s]+)", p.read_text(encoding="utf-8", errors="replace"))}
        miss = sorted({k for k in cited if k not in have})
        if miss:
            bib_missing.append((tex.stem, len(cited), miss, [p.stem for p in bibs]))
        else:
            ok += 1

    print("clean papers: %d" % ok)
    print("baked-bib papers with unnumbered cites: %d" % len(baked_missing))
    for stem, n, miss in baked_missing[:8]:
        print("  %s cites=%d missing=%s" % (stem[:44], n, miss[:6]))
    print("bib-file papers with unnumbered cites: %d" % len(bib_missing))
    for stem, n, miss, collected in bib_missing[:8]:
        print("  %s cites=%d bibs=%s missing=%s" % (stem[:40], n, collected, miss[:6]))


if __name__ == "__main__":
    main()
