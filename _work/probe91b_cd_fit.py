r"""Read the cell-box dump and refit it a few ways, in one place.

probe91's own print is the authority on `chars` (it computed them from the strings in memory); this
reads the same records back and only re-derives the *model* terms, so the LaTeX command strip here
runs on the dumped text rather than on whatever a shell heredoc did to a backslash.
"""
import json
import os
import re
import sys

WORK = os.path.dirname(os.path.abspath(__file__))
PT_CM = 28.3465
CMD = re.compile(r"\\[a-zA-Z@]+\*?")
BRACE = re.compile(r"[{}\\$]")
SCRIPT = re.compile(r"[_^]\s*(\{(?:[^{}]|\{[^{}]*\})*\}|\w)")


def strip(text):
    return BRACE.sub("", CMD.sub(" ", text)).strip()


def script_split(text):
    src = CMD.sub(" ", text)
    sub = sum(len(strip(m.group(1))) for m in SCRIPT.finditer(src))
    return len(strip(src)) - sub, sub


def lsq(pairs):
    n = len(pairs)
    sx = sum(x for x, _ in pairs)
    sy = sum(y for _, y in pairs)
    sxx = sum(x * x for x, _ in pairs)
    sxy = sum(x * y for x, y in pairs)
    den = n * sxx - sx * sx
    b = (n * sxy - sx * sy) / den
    a = (sy - b * sx) / n
    res = [y - (a + b * x) for x, y in pairs]
    rms = (sum(r * r for r in res) / n) ** 0.5
    return a, b, rms, res


def report(name, pairs, recs):
    a, b, rms, res = lsq(pairs)
    srt = sorted(res)
    print("%-22s ink = %6.2f + %6.3f x   rms %5.2f pt   resid p10 %+5.1f med %+5.1f p90 %+5.1f"
          "  min %+5.1f max %+5.1f"
          % (name, a, b, rms, srt[len(srt) // 10], srt[len(srt) // 2],
             srt[-max(1, len(srt) // 10)], srt[0], srt[-1]))
    return a, b, res


def main():
    rec = json.load(open(os.path.join(WORK, "label91_cd_cells.json"), encoding="utf-8"))
    print("records %d; regex sanity: strip('\\text{a}') = %r" % (len(rec), strip("\\text{a}")))
    bad = [r for r in rec if len(strip(r["text"])) != r["chars"]]
    print("dumped chars disagree with the record for %d cells" % len(bad))
    for r in bad[:3]:
        print("   %d vs %d  %r" % (len(strip(r["text"])), r["chars"], r["text"][:50]))
    ink = [r["ink_w_pt"] for r in rec]
    report("chars (emitter's)", [(r["chars"], w) for r, w in zip(rec, ink)], rec)
    fs = [script_split(r["text"]) for r in rec]
    report("full only", [(f, w) for (f, _s), w in zip(fs, ink)], rec)
    for ratio in (0.55, 0.7, 0.85):
        report("full + %.2f*script" % ratio,
               [(f + ratio * s, w) for (f, s), w in zip(fs, ink)], rec)
    # upright text inside \text{} is not maths italic: count it at its own advance
    TEXT = re.compile(r"\\(?:text|mathrm|operatorname|textrm)\s*\{([^{}]*)\}")
    ut = []
    for r, w in zip(rec, ink):
        plain = sum(len(re.sub(r"\s", "", m.group(1))) for m in TEXT.finditer(r["text"]))
        ut.append((r["chars"] - plain, plain, w))
    for coef in (0.0, 1.3, 1.5, 1.7):
        report("chars + %.1f*upright" % coef, [(c - p + coef * p, w) for c, p, w in ut], rec)
    print("\ncurrent cd_width: 0.55cm + 0.17cm/char = %.2f + %.2f pt/char"
          % (0.55 * PT_CM, 0.17 * PT_CM))
    print("measured box = ink + 9.39pt (column padding, probe90 at 11pt)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
