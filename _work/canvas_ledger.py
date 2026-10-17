r"""Where did the converted canvases go?

The probe counts pictures in _work/flat, report.json logs what the gate emitted, and the page shows
what a reader sees. A paper whose logged cetz_converted exceeds its #cetz.canvas( count lost a
drawing somewhere between the gate and the page -- a silently dropped figure -- and this names the
marker the page carries in its place.

Read-only.
"""
import collections
import glob
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
RAW_LATEX = re.compile(r'#raw\(block: true, lang: "latex"')
CANVAS = re.compile(r"#cetz\.canvas\(")
ANY_CANVAS = re.compile(r"cetz\.canvas", re.I)
TOKEN = re.compile(r"2TTIKZ\d+|ZQT2T[A-Z]+")
IMAGE = re.compile(r"#image\(")
UNCONVERTED = re.compile(r"#unconverted\(")

rows = []
lost = collections.Counter()
for d in sorted(glob.glob(str(ROOT / "typst" / "*"))):
    rp = pathlib.Path(d) / "report.json"
    typs = sorted(pathlib.Path(d).glob("*.typ"))
    if not rp.exists() or not typs:
        continue
    rep = json.load(open(rp, encoding="utf-8"))
    body = "\n".join(t.read_text(encoding="utf-8", errors="replace") for t in typs)
    stats = rep.get("stats", {})
    conv, refused = stats.get("cetz_converted", 0), stats.get("cetz_refused", 0)
    canvas = len(CANVAS.findall(body))
    rows.append({
        "paper": pathlib.Path(d).name, "log_conv": conv, "page_canvas": canvas,
        "log_refused": refused, "page_raw": len(RAW_LATEX.findall(body)),
        "any_canvas": len(ANY_CANVAS.findall(body)), "image": len(IMAGE.findall(body)),
        "unconverted": len(UNCONVERTED.findall(body)),
        "token": TOKEN.findall(body), "source": rep.get("source", ""),
    })
    if conv != canvas:
        lost[pathlib.Path(d).name] = conv - canvas

print("papers: %d   log cetz_converted %d   page #cetz.canvas( %d"
      % (len(rows), sum(r["log_conv"] for r in rows), sum(r["page_canvas"] for r in rows)))
print("papers whose canvas count differs from the log: %d" % len(lost))
for k, v in lost.most_common():
    r = next(x for x in rows if x["paper"] == k)
    print("%+3d  %-50s log_conv=%d canvas=%d raw=%d image=%d token=%s"
          % (v, k[:50], r["log_conv"], r["page_canvas"], r["page_raw"], r["image"], r["token"]))
print("\nmangled/leftover placeholder tokens on the page:")
for r in rows:
    if r["token"]:
        print("%s  %s" % (r["paper"][:50], r["token"]))
print("\npapers carrying an #unconverted marker: %d" % sum(1 for r in rows if r["unconverted"]))
json.dump(rows, open(ROOT / "_work" / "canvas_ledger.json", "w", encoding="utf-8"),
          ensure_ascii=False, indent=1)
print("wrote _work/canvas_ledger.json")
