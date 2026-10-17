r"""The #89 diff read: the old canvas and the new one side by side for the six changed pictures.

Prints only the lines that differ, so an arc that lands where the author's corner was can be checked
against `rounded_run`'s law (tangent point at the declared radius, arc from the back-vector of the
incoming edge to the forward vector of the outgoing one).
"""
import difflib
import io
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
old = json.loads(io.open(os.path.join(HERE, "rounded_canvases_old.json"), encoding="utf-8").read())
new = json.loads(io.open(os.path.join(HERE, "rounded_canvases_new.json"), encoding="utf-8").read())

for key in sorted(old):
    if old[key] == new.get(key):
        continue
    print("\n===== %s" % key)
    for line in difflib.unified_diff(old[key].split("\n"), (new[key] or "").split("\n"),
                                     lineterm="", n=0):
        if line.startswith(("---", "+++", "@@")):
            continue
        print(line[:220])
