"""Locate the LaTeX entry point of every preprint and flatten its \\input tree."""

import json
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PREPRINTS = os.path.join(ROOT, "preprints")
MANIFEST = os.path.join(ROOT, "_work", "manifest.json")

# TeX reads an \input anywhere on the line, so a paper keeps its bibliography in
# {\raggedright\input{references}} and only an unanchored pattern inlines it.
INPUT_RE = re.compile(r"\\(?:input|include|subfile)\s*\{([^{}]+)\}")
DOCCLASS_RE = re.compile(r"\\documentclass(\[[^\]]*\])?\{[^{}]*\}")


LINK_ARG = re.compile(r"\\(?:href|url|nolinkurl|includegraphics|lstinline)"
                      r"\s*(?:\[[^\]]*\])?\{")


def _skip_group(line, i):
    """The index just past the balanced {...} that starts at line[i], or -1."""
    depth = 0
    while i < len(line):
        if line[i] == "\\":
            i += 2
            continue
        if line[i] == "{":
            depth += 1
        elif line[i] == "}":
            depth -= 1
            if not depth:
                return i + 1
        i += 1
    return -1


def strip_comments(text):
    r"""Drop TeX comments, but keep a bare % that belongs to a URL.

    These preprints write percent-encoded links (…/Articles-PDF/%5B4%5D.pdf) without
    escaping the %, and cutting the line there leaves \href{ unterminated, which
    costs the reader the rest of the bibliography entry.
    """
    out = []
    for line in text.split("\n"):
        cut, i = None, 0
        while i < len(line):
            m = LINK_ARG.match(line, i)
            if m:
                end = _skip_group(line, m.end() - 1)
                if end < 0:
                    break  # the argument never closes: keep the line as it is
                while line[end:end + 1] == " ":
                    end += 1
                if line[end:end + 1] == "{":
                    end = _skip_group(line, end)
                    if end < 0:
                        break
                i = end
                continue
            if line[i] == "\\":
                i += 2
            elif line[i] == "%":
                cut = i
                break
            else:
                i += 1
        out.append(line if cut is None else line[:cut])
    return "\n".join(out)


def read(path):
    with open(path, "r", encoding="utf-8", errors="replace") as f:
        return f.read()


def candidates(paper_dir):
    """Entry points, most authoritative first."""
    found = []
    for rel in ("build/main.tex", "build/source/main.tex", "build/paper.tex",
                "build/source/paper.tex", "main.tex", "paper.tex"):
        p = os.path.join(paper_dir, *rel.split("/"))
        if os.path.exists(p):
            found.append(p)
    if found:
        return found
    for dirpath, _dirs, files in os.walk(paper_dir):
        for name in sorted(files):
            if name.endswith(".tex"):
                p = os.path.join(dirpath, name)
                if DOCCLASS_RE.search(read(p)):
                    found.append(p)
        if found:
            break
    return found


def flatten(path, seen, missing, root, depth=0):
    real = os.path.abspath(path)
    if real in seen or depth > 24:
        return ""
    seen.add(real)
    text = strip_comments(read(path))
    base = os.path.dirname(path)

    def repl(m):
        target = m.group(1).strip()
        if not target.endswith(".tex"):
            target += ".tex"
        # pdfTeX glyph-bookkeeping files carry no body content.
        if os.path.basename(target).startswith("glyphtounicode"):
            return ""
        # LaTeX resolves \input against the main document's directory, so the
        # entry root has to be tried even for includes nested in sections/.
        # pdfTeX resolves a relative \input against the *main document's* directory, so a target that
        # carries a path (`figures/moduli`) has to be tried against the entry root before any
        # same-basename fallback: collapsing it to `moduli` can land on an unrelated section file that
        # shares the name, and then the real file is never read. The base-relative form stays first
        # because repository layouts that nest includes under the including file are common, and both
        # basename forms remain last as a convenience for flat trees.
        # A candidate that has already been inlined is a weaker match than a
        # fresh file lower on the list: `sections/x.tex` pulling in
        # `figures/x` is shadowed by the same-basename fallback, which points
        # back at the very file being flattened, so the walk has to keep going.
        inlined = False
        for p in (os.path.normpath(os.path.join(base, target)),
                  os.path.normpath(os.path.join(root, target)),
                  os.path.normpath(os.path.join(base, os.path.basename(target))),
                  os.path.normpath(os.path.join(root, os.path.basename(target)))):
            if not os.path.exists(p):
                continue
            if os.path.abspath(p) in seen:
                inlined = True
                continue
            return flatten(p, seen, missing, root, depth + 1)
        if inlined:
            return ""
        missing.append(os.path.relpath(path, PREPRINTS) + " -> " + m.group(1))
        return ""

    return INPUT_RE.sub(repl, text)


def main():
    papers = sorted(d for d in os.listdir(PREPRINTS)
                    if os.path.isdir(os.path.join(PREPRINTS, d)))
    entries = []
    for name in papers:
        d = os.path.join(PREPRINTS, name)
        cand = candidates(d)
        if not cand:
            entries.append({"paper": name, "entry": None})
            continue
        missing = []
        body = flatten(cand[0], set(), missing, os.path.dirname(cand[0]))
        tex_files = sum(1 for _r, _d, fs in os.walk(d) for f in fs if f.endswith(".tex"))
        bib = next((os.path.relpath(os.path.join(dp, f), d).replace("\\", "/")
                    for dp, _dd, fs in os.walk(d) for f in fs if f.endswith(".bib")), None)
        pdf = next((f for f in ("article.pdf", "paper.pdf")
                    if os.path.exists(os.path.join(d, f))), None)
        entries.append({
            "paper": name,
            "entry": os.path.relpath(cand[0], d).replace("\\", "/"),
            "extra_docclass": [os.path.relpath(c, d).replace("\\", "/") for c in cand[1:]],
            "tex_files": tex_files,
            "flat_bytes": len(body.encode("utf-8")),
            "flat_lines": body.count("\n") + 1,
            "bib": bib,
            "orig_pdf": pdf,
            "unresolved_inputs": missing,
        })
        with open(os.path.join(ROOT, "_work", "flat", name + ".tex"), "w",
                  encoding="utf-8") as f:
            f.write(body)
    os.makedirs(os.path.dirname(MANIFEST), exist_ok=True)
    with open(MANIFEST, "w", encoding="utf-8") as f:
        json.dump(entries, f, indent=1, ensure_ascii=False)
    bad = [e["paper"] for e in entries if not e["entry"]]
    unres = [e for e in entries if e.get("unresolved_inputs")]
    print(f"papers={len(entries)} no_entry={len(bad)} papers_with_unresolved_inputs={len(unres)}")
    for p in bad[:20]:
        print("  no entry:", p)
    for e in unres[:10]:
        print("  unresolved:", e["paper"], e["unresolved_inputs"][:3])
    print("total flat bytes =", sum(e.get("flat_bytes", 0) for e in entries) / 1e6, "MB")


if __name__ == "__main__":
    os.makedirs(os.path.join(ROOT, "_work", "flat"), exist_ok=True)
    main()
