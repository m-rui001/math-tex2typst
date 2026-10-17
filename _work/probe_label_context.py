"""Where do the labels the emitter never registered actually sit?

For a list of reference keys that dangle in the real pass, print the source line that
defines the label plus the innermost environment around it. A label inside an
environment the converter does not know is a label that never reaches the registry.

Run: python _work/probe_label_context.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
ENV = re.compile(r"\\(?:begin|end)\{([a-zA-Z@*][a-zA-Z0-9@*]*)\}")

CASES = {
    "Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026": [
        "l-l:trim", "l-l:degree-all-powers", "h-lem:path-cylinder", "f-shear:lem:delayed-symmetry"],
    "Finite-Congruence-Lattices-Characterization-and-Undecidability-September-24-2026": [
        "grw:normal-commuting", "cls:cat-geometric", "irr:high-rank-table", "ext:e4",
        "c:linear-subspaces,c:isometry-subspace"],
    "A-Negative-Solution-to-the-Finite-Lattice-Representation-Problem-September-24-2026": [
        "prop:sphere-height-one", "lem:cts-local-section", "pert:selection", "sec:packets"],
}


def enclosing(text, index):
    """Innermost environment name around one position, outermost first."""
    stack = []
    for m in ENV.finditer(text, 0, index):
        kind = text[m.start() + 1:m.start() + 5]
        if kind.startswith("begin"):
            stack.append(m.group(1))
        elif stack and stack[-1] == m.group(1):
            stack.pop()
    return ">".join(stack[-3:]) or "(top level)"


for paper, keys in CASES.items():
    path = ROOT / "_work" / "flat" / (paper + ".tex")
    text = path.read_text(encoding="utf-8", errors="replace")
    print("== %s" % paper[:60])
    for key in keys:
        m = re.search(r"\\label\{%s\}" % re.escape(key), text)
        if not m:
            print("   %-42s no \\label in file" % key[:42])
            continue
        line = text[:m.start()].count("\n") + 1
        source = text.splitlines()[line - 1].strip()
        print("   %-42s line %-6d inside %s" % (key[:42], line, enclosing(text, m.start())))
        print("       %s" % source[:110])
