r"""Convert a list of papers and report empty figures + compile status."""
import concurrent.futures
import json
import os
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper  # noqa: E402

EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)

TARGETS = [
    "The-sharp-factor-of-IID-threshold-for-the-free-Ising-model-on-regular-trees-September-26-2026",
    "An-integral-scalar-curvature-bound-for-real-simplicial-volume-October-5-2026",
    "An-explicit-power-saving-for-the-exact-discrete-Fourier-transform-September-25-2026",
]


def run(name):
    source = ROOT / "_work/flat" / (name + ".tex")
    out = ROOT / "typst" / name
    out.mkdir(parents=True, exist_ok=True)
    try:
        report = convert_paper(str(source), str(out), name)
    except Exception as exc:  # noqa: BLE001
        return {"paper": name, "ok": False, "compile_ok": False, "error": repr(exc)}
    text = (out / "main.typ").read_text(encoding="utf-8", errors="replace")
    report["empty_figures"] = len(EMPTY.findall(text))
    (out / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2),
                                     encoding="utf-8")
    return report


def main():
    sys.stdout.reconfigure(errors="replace")
    names = sys.argv[1:] or TARGETS
    with concurrent.futures.ThreadPoolExecutor(max_workers=min(8, os.cpu_count() or 4)) as pool:
        for r in pool.map(run, names):
            print("%-60s ok=%s compile=%s empty=%s %s"
                  % (r["paper"][:58], r.get("ok"), r.get("compile_ok"),
                     r.get("empty_figures", "?"), r.get("error", "")))


if __name__ == "__main__":
    main()
