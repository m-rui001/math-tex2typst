r"""Prove the colour test only passes once `cetz-orange.patch` is applied, and never with the family
alone - the family must not smuggle a shared-table change along with it.

Each variant is a full `tools/t2t` copy with the delivered patches applied by `patch -p1`, and the
spliced suite is run *from inside that copy* in a subprocess: the suite puts its own directory at
`sys.path[0]`, so any other tree on the path (this sandbox's `t2t/`, which carries the family but
not the colour) would silently win and the run would prove nothing.

  family  = live + macros.py.patch + convert.py.patch
  orange  = the same + cetz-orange.patch
"""
import os
import shutil
import subprocess
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")
CHECK = os.path.join(SB, "_treecheck")

NEW = [
    "test_a_macro_that_only_looks_like_a_conditional_still_expands",
    "test_a_figure_that_defines_its_macros_in_the_body_reaches_the_canvas",
    "test_a_scope_a_body_macro_opens_lands_where_tex_inks_it",
    "test_a_band_on_a_narrow_axis_carries_the_axis_scale_and_the_pgfmath_midpoint",
    "test_a_named_colour_mixes_at_the_value_tex_prints",
]

sys.path.insert(0, SB)
import step6_run_new_tests as splice  # noqa: E402  writes _run_tests.py: suite + the 5 new methods


def build_tree(name, patches):
    tree = os.path.join(CHECK, name)
    if os.path.isdir(tree):
        shutil.rmtree(tree)
    os.makedirs(tree)
    shutil.copytree(os.path.join(ROOT, "tools", "t2t"), os.path.join(tree, "t2t"))
    for p in patches:
        with open(os.path.join(SB, p), "rb") as fh:
            subprocess.run(["patch", "-p1", "-s"], cwd=tree, stdin=fh, check=True)
    shutil.copyfile(splice.path, os.path.join(tree, "suite_check.py"))
    return tree


def run(tree, label):
    args = ["python", os.path.join(tree, "suite_check.py")] + \
           ["ConversionTests." + n for n in NEW]
    out = subprocess.run(args, capture_output=True, text=True, cwd=tree)
    tail = (out.stdout + out.stderr).splitlines()
    passed = [n for n in NEW if any(n in l and "... ok" in l for l in tail)]
    failed = [n for n in NEW if any(n in l and "... FAIL" in l for l in tail)]
    print("%-14s %s" % (label, " ".join(
        "%s=%s" % (n.replace("test_a_", ""), "ok" if n in passed else "FAIL") for n in NEW)))
    for line in tail:
        if line.startswith(("Ran ", "OK", "FAILED")):
            print("%-14s %s" % ("", line))
    return passed, failed


FAMILY = ["macros.py.patch", "convert.py.patch"]
family = build_tree("family", FAMILY)
orange = build_tree("orange", FAMILY + ["cetz-orange.patch"])

fp, ff = run(family, "family only")
op, of = run(orange, "family+orange")
print()
print("colour test needs the separate patch:",
      "confirmed" if "test_a_named_colour_mixes_at_the_value_tex_prints" in ff
      and "test_a_named_colour_mixes_at_the_value_tex_prints" in op else "NOT confirmed")
print("family tests unaffected by it:",
      set(fp - ["test_a_named_colour_mixes_at_the_value_tex_prints"]) ==
      set(op - ["test_a_named_colour_mixes_at_the_value_tex_prints"]))
