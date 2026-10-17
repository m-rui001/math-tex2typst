r"""What does the page actually carry for each TikZ picture?

The probe walks _work/flat and names a stage; the page is the only ground truth. Count, per paper,
the raw LaTeX quotations, the #cetz.canvas( drawings, and what report.json logged, then put them
beside the probe's verdict so a false refusal and a silently dropped figure cannot look the same.

Read-only.
"""
import collections
import glob
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
RAW_LATEX = re.compile(r'#raw\(block: true, lang: "latex"')
CANVAS = re.compile(r"#cetz\.canvas\(")
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
TIKP = re.compile(r"\\begin\{tikzpicture\}")

probe_path = ROOT / "_work" / "refusal_stages.json"
if not probe_path.exists():
    sys.exit("run _work/probe_refusal_stages.py first")
probe = json.load(open(probe_path, encoding="utf-8"))
by_paper = collections.defaultdict(list)
for r in probe["records"]:
    by_paper[r["paper"]].append(r["stage"])

rows = []
flat_names = [pathlib.Path(s).stem for s in sorted(glob.glob(str(ROOT / "_work" / "flat" / "*.tex")))]
flat_set = set(flat_names)
for d in sorted(glob.glob(str(ROOT / "typst" / "*"))):
    name = pathlib.Path(d).name
    typs = sorted(pathlib.Path(d).glob("*.typ"))
    if not typs:
        continue
    body = "\n".join(t.read_text(encoding="utf-8", errors="replace") for t in typs)
    raw = len(RAW_LATEX.findall(body))
    canvas = len(CANVAS.findall(body))
    rep = {}
    rp = pathlib.Path(d) / "report.json"
    if rp.exists():
        rep = json.load(open(rp, encoding="utf-8"))
    stats = rep.get("stats", {})
    samples = rep.get("samples", {})
    # the flat source this output came from: report.json records it verbatim, and the ledger dir
    # names truncate to 44 chars so a prefix match pairs the wrong sibling papers
    flat = rep.get("source") or ""
    stem = pathlib.Path(flat).stem if flat else None
    if stem not in flat_set:
        stem = None
    src = ""
    if stem:
        src = (ROOT / "_work" / "flat" / (stem + ".tex")).read_text(encoding="utf-8", errors="replace")
    pics = [m.group(0) for m in PICTURE.finditer(src)]
    stages = by_paper.get(stem, []) if stem else []
    pr_ref = sum(1 for s in stages if s)
    pr_conv = sum(1 for s in stages if not s)
    rows.append({
        "paper": name, "flat": stem, "pics": len(pics),
        "tikzpics": len(TIKP.findall(src)), "probe_refused": pr_ref, "probe_conv": pr_conv,
        "page_raw": raw, "page_canvas": canvas,
        "log_refused": stats.get("cetz_refused", 0), "log_converted": stats.get("cetz_converted", 0),
        "log_sample": samples.get("cetz_refused", ""), "stages": [s for s in stages if s],
        "ok": rep.get("ok"), "compile_ok": rep.get("compile_ok"),
    })

tot = collections.Counter()
for r in rows:
    for k in ("pics", "probe_refused", "probe_conv", "page_raw", "page_canvas",
              "log_refused", "log_converted"):
        tot[k] += r[k]
print("papers with output: %d" % len(rows))
print("totals: " + " ".join("%s=%d" % (k, v) for k, v in sorted(tot.items())))
print("\n-- papers where the probe and the page disagree --")
bad = []
for r in rows:
    if r["probe_refused"] != r["page_raw"] or r["probe_conv"] != r["page_canvas"]:
        bad.append(r)
        print(json.dumps(r, ensure_ascii=False))
print("disagreements: %d" % len(bad))
print("\n-- every page raw block, with its probe stages --")
for r in rows:
    if r["page_raw"]:
        print("%s  raw=%d canvas=%d probe_refused=%d stages=%s"
              % (r["paper"][:46], r["page_raw"], r["page_canvas"], r["probe_refused"], r["stages"]))
print("\n-- probe refused but page has no raw block --")
for r in rows:
    if r["probe_refused"] and r["page_raw"] == 0:
        print("%s  probe_refused=%d stages=%s canvas=%d log_refused=%d ok=%s compile_ok=%s"
              % (r["paper"][:46], r["probe_refused"], r["stages"], r["page_canvas"],
                 r["log_refused"], r["ok"], r["compile_ok"]))
# flat sources with no output directory at all (withdrawn papers): the probe still walks them
covered = {r["flat"] for r in rows if r["flat"]}
orphans = sorted(set(by_paper) - covered)
print("\n-- flat papers with no typst output: %d --" % len(orphans))
for s in orphans:
    st = [x for x in by_paper[s] if x]
    print("%s  probe_refused=%d stages=%s" % (s[:60], len(st), st))
print("page raw total %d ; probe refused over shipped papers %d ; probe refused incl. orphans %d"
      % (sum(r["page_raw"] for r in rows),
         sum(r["probe_refused"] for r in rows),
         sum(1 for r in probe["records"] if r["stage"])))
json.dump(rows, open(ROOT / "_work" / "page_vs_probe.json", "w", encoding="utf-8"),
          ensure_ascii=False, indent=1)
print("wrote _work/page_vs_probe.json")
