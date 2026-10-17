r"""Rebuild the products the manifest does not name.

`regen_rest.py` and `regen_list.py` walk `_work/manifest.json`, so they never touch the five products
`batch_typst.py` adds on its own: a `-alternate-N` for each paper carrying extra `\documentclass`
documents, and a `standalone-<stem>` for each TeX document outside the inventory. Those five were
built before #66-#68 and still print a grid without the justify block, so the corpus is only sealed
when they are rebuilt too. Take the same item lists from `batch_typst.py` -- the naming and the
flattening are its lines 46-61 -- and convert only those.
"""
import concurrent.futures
import json
import os
import pathlib
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper  # noqa: E402
from inventory import flatten  # noqa: E402


def run(item):
    name, source = item
    out = ROOT / "typst" / name
    out.mkdir(parents=True, exist_ok=True)
    try:
        report = convert_paper(str(source), str(out), name)
    except Exception as exc:  # noqa: BLE001
        report = {"paper": name, "ok": False, "compile_ok": False, "error": repr(exc)}
    report["source"] = str(source)
    (out / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2),
                                     encoding="utf-8")
    return name, report


def items():
    manifest = json.loads((ROOT / "_work/manifest.json").read_text(encoding="utf-8"))
    named = {e["paper"] for e in manifest if e.get("entry")}
    out = []
    for folder in [ROOT, ROOT / "reasoning_traces", ROOT / "研究笔记"]:
        for source in folder.glob("*.tex"):
            if "\\documentclass" not in source.read_text(encoding="utf-8", errors="replace"):
                continue
            name = "standalone-" + source.stem
            dest = ROOT / "_work/flat" / (name + ".tex")
            dest.write_text(flatten(str(source), set(), [], str(source.parent)), encoding="utf-8")
            out.append((name, dest))
    for entry in manifest:
        for i, rel in enumerate(entry.get("extra_docclass", []), 1):
            source = ROOT / "preprints" / entry["paper"] / rel
            name = entry["paper"] + "-alternate-" + str(i)
            dest = ROOT / "_work/flat" / (name + ".tex")
            dest.write_text(flatten(str(source), set(), [], str(source.parent)), encoding="utf-8")
            out.append((name, dest))
    return [(n, s) for n, s in out if n not in named]


def main():
    sys.stdout.reconfigure(errors="replace")
    todo = items()
    print("products outside the manifest: %d" % len(todo), flush=True)
    start = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=min(6, os.cpu_count() or 4)) as pool:
        for name, report in pool.map(run, todo):
            print("%-72s compiled=%s %s"
                  % (name[:72], report.get("compile_ok"),
                     (report.get("error") or "")[:80]), flush=True)
    print("DONE %d in %.0fs" % (len(todo), time.time() - start), flush=True)


if __name__ == "__main__":
    main()
