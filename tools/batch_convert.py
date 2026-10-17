"""Batch convert papers using the manifest, copying bib files alongside."""

import json
import os
import shutil
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from t2t.convert import convert_paper  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def run_one(paper_name, manifest_entry, keep_work=False):
    flat = os.path.join(ROOT, "_work", "flat", paper_name + ".tex")
    out_dir = os.path.join(ROOT, "preprints", paper_name, "typst")
    os.makedirs(out_dir, exist_ok=True)
    # Copy bib file if present
    bib_rel = manifest_entry.get("bib")
    if bib_rel:
        bib_src = os.path.join(ROOT, "preprints", paper_name, bib_rel)
        bib_dst = os.path.join(out_dir, "refs.bib")
        if os.path.exists(bib_src) and not os.path.exists(bib_dst):
            shutil.copy(bib_src, bib_dst)
    return convert_paper(flat, out_dir, paper_name, keep_work=keep_work)


def main():
    manifest_path = os.path.join(ROOT, "_work", "manifest.json")
    with open(manifest_path, encoding="utf-8") as fh:
        manifest = json.load(fh)
    entries = {e["paper"]: e for e in manifest}

    argv = sys.argv[1:]
    report_path = os.path.join(ROOT, "_work", "batch_report.jsonl")
    if argv and argv[0] == "--report":
        report_path = os.path.abspath(argv[1])
        argv = argv[2:]

    # Load already-done papers for resume
    done = set()
    if os.path.exists(report_path):
        with open(report_path, encoding="utf-8", errors="replace") as fh:
            for line in fh:
                try:
                    done.add(json.loads(line)["paper"])
                except Exception:
                    pass

    # Pilot subset, --list file, or full run
    if argv and argv[0] == "--list":
        with open(argv[1], encoding="utf-8") as fh:
            requested = [l.strip() for l in fh if l.strip()]
    elif argv and argv[0] != "--all":
        requested = argv
    else:
        requested = list(entries.keys())
    names = [n for n in requested if n not in done]

    ok = fail = 0
    with open(report_path, "a", encoding="utf-8") as out:
        for i, name in enumerate(names):
            entry = entries.get(name)
            if not entry:
                print("SKIP %s (not in manifest)" % name)
                continue
            t0 = time.time()
            try:
                rep = run_one(name, entry)
            except Exception as exc:
                rep = {"paper": name, "ok": False, "stage": "exception", "error": str(exc)[:300]}
            dt = time.time() - t0
            rep["seconds"] = round(dt, 1)
            out.write(json.dumps(rep, ensure_ascii=False) + "\n")
            out.flush()
            if rep.get("compile_ok"):
                ok += 1
                print("[%d/%d] OK %s (%.1fs, %d lines)" % (i + 1, len(names), name, dt, rep.get("typ_lines", 0)))
            else:
                fail += 1
                print("[%d/%d] FAIL %s (%.1fs) errors=%d kinds=%s" % (
                    i + 1, len(names), name, dt,
                    rep.get("compile_errors", 0),
                    list(rep.get("error_kinds", {}).keys())[:3]))
    print("\nTotal this run: %d ok, %d fail" % (ok, fail))


if __name__ == "__main__":
    main()
