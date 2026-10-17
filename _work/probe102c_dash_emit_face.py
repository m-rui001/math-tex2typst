r"""#102 leg C: the dash face as the EMITTER sees it (轴 77: 只能问发射器).

The keyword census (_work/label101k_dash_census.txt, 436 statements / 228 canvases / 146 papers)
counts literal strings in the flat source. That number cannot be filed with: `dash dot` is a
substring of `densely dash dot`, a key written in a `\tikzset` style table never reaches a
statement, and a statement whose merged options lose the key in `opts()` is not on the list at all.

So this probe spies `cetz.stroke_args` while replaying `cetz.build` over every flat picture and
records, per call, the option dictionary plus whether a `dash:` came out. A statement is on the
face when its merged options carry a dash spelling and no `dash:` was emitted. The recorded
dictionaries also answer the implementation question: how the space-separated names arrive as keys.

  PYTHONIOENCODING=utf-8 python _work/probe102c_dash_emit_face.py
"""
import io
import os
import re
import sys
from collections import Counter

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(HERE, "flat")
OUT = os.path.join(HERE, "label102c_dash_emit_face.txt")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

from t2t import cetz  # noqa: E402

CALLS = []          # (picture id, option dict, emitted list)
_real = cetz.stroke_args


def spy(o, pal=None):
    got = _real(o, pal)
    CALLS.append((o, got))
    return got


DASH_KEYS = ("dashed", "dotted", "densely dashed", "densely dotted", "loosely dashed",
             "loosely dotted", "dash pattern", "dash dot", "dashdotted", "dash dot dot",
             "dashdotdotted", "densely dashdotted", "densely dash dot", "solid",
             "ultra densely dashed", "very densely dashed")


def dash_keys_in(o):
    return sorted(k for k in o if k in DASH_KEYS)


def main():
    sys.stdout.reconfigure(errors="replace")
    cetz.stroke_args = spy
    stems = sorted(d[:-4] for d in os.listdir(FLAT) if d.endswith(".tex"))
    per_pic = {}
    samples = []
    for stem in stems:
        text = io.open(os.path.join(FLAT, stem + ".tex"), encoding="utf-8",
                       errors="replace").read()
        for k, pic in enumerate(PIC.findall(text)):
            before = len(CALLS)
            try:
                canvas = cetz.build(pic)
            except Exception as exc:  # a refused picture is not our dash loss
                continue
            if canvas is None:
                continue
            lost = []
            for o, got in CALLS[before:]:
                keys = dash_keys_in(o)
                if keys and not any("dash:" in str(x) for x in got):
                    lost.append((keys, o, got))
            if lost:
                per_pic[(stem, k)] = lost
                if len(samples) < 12:
                    samples.append((stem, k, lost[0][0],
                                    {k2: lost[0][1][k2] for k2 in lost[0][0]}))
    cetz.stroke_args = _real

    stmts = sum(len(v) for v in per_pic.values())
    papers = {s for s, _ in per_pic}
    keyc = Counter()
    for v in per_pic.values():
        for keys, _, _ in v:
            for key in keys:
                keyc[key] += 1
    lines = ["dash face read off the emitter (stroke_args spied during cetz.build over _work/flat)",
             "a statement counts when its merged options carry a dash spelling and no dash: came out",
             "",
             "statements %d / canvases %d / papers %d of %d" % (stmts, len(per_pic), len(papers), len(stems)),
             "",
             "key (as the option dict spells it) -> statements"]
    for key, n in keyc.most_common():
        lines.append("  %-26s %d" % (key, n))
    lines.append("")
    lines.append("sample option dicts (what the fix has to read):")
    for stem, k, keys, vals in samples:
        lines.append("  %s #%d  %s" % (stem[:52], k, keys))
        lines.append("      %s" % vals)
    lines.append("")
    lines.append("canvases by paper:")
    by = Counter(s for s, _ in per_pic)
    for s, c in by.most_common(20):
        lines.append("  %2d  %s" % (c, s[:70]))
    lines.append("")
    lines.append("every site carrying an explicit `dash pattern` / a compound name"
                 " (the value string is what the fix must parse):")
    for (stem, k), lost in sorted(per_pic.items()):
        for keys, o, got in lost:
            for key in keys:
                if key in ("dash pattern", "dash dot", "dashdotted", "dash dot dot",
                           "dashdotdotted"):
                    lines.append("  %-52s #%d  %-13s %r" % (stem[:52], k, key, o[key]))
    lines.append("")
    lines.append("statements carrying MORE THAN ONE dash spelling (no measured precedence law):")
    multi = [(s, k, keys) for (s, k), lost in per_pic.items() for keys, _, _ in lost
             if len(keys) > 1]
    lines.append("  %d" % len(multi))
    for s, k, keys in multi[:10]:
        lines.append("  %s #%d %s" % (s[:52], k, keys))
    out = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(out)
    print(out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
