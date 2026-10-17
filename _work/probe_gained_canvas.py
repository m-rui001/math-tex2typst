r"""Is the one canvas the circle stub "gained" a gain, or a stub that reverted too much?

`_work/probe_circle_regen_guard.py` stubs `node_shape` to answer `rect` for EVERY node, which is not
the code before #40: the old emitter had no `node_shape` at all but did read the bare key
(`o.get("circle") is True`) in `emit_node` and `_anchor_ring`, so it drew a round frame and a round
anchor ring for `\node[circle, draw]` -- it only missed the shape spelled through a style
(`vertex/.style={circle,…}`, which arrives as `shape=circle`). A stub that answers `rect` for both
spellings therefore takes away a canvas the old code built, and the "before 917 / after 918" it
reports is one canvas short of the truth.

Replays the corpus with the faithful old rule -- `circle` only where the bare key says so -- and
prints the built counts, the changed canvases and any canvas that builds live but not under the stub.
The picture named in the earlier run's `gained>` line is reported by itself, with the spellings that
decide it: whether its round nodes come from a bare `circle` key or a style, and whether a statement
reads one of their anchors (`(v.east)`), which is what needs `_anchor_ring`.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
LIVE = cetz.node_shape
OLD = lambda o: "circle" if o.get("circle") is True else "rect"  # noqa: E731
STUB = lambda o: "rect"  # noqa: E731


def build_with(pic, rule):
    cetz.node_shape = rule
    try:
        return cetz.build(pic)
    finally:
        cetz.node_shape = LIVE


def main():
    counts = {"old": 0, "stub": 0, "live": 0}
    lost_old = lost_stub = 0
    changed_old = 0
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        for pic in PIC.findall(text):
            new = cetz.build(pic)
            if new is not None:
                counts["live"] += 1
            for key, rule in (("old", OLD), ("stub", STUB)):
                got = build_with(pic, rule)
                if got is not None:
                    counts[key] += 1
                    if new is None:
                        print("LOST under #40 %s (%s)" % (path.stem[:56], key))
                        lost_old += key == "old"
                    elif got != new and key == "old":
                        changed_old += 1
                elif new is not None:
                    print("%s builds live, not under the %s rule: %s"
                          % (path.stem[:52], key, "pic"))
    print("canvases: live %d, faithful-old-rule %d, all-rect-stub %d"
          % (counts["live"], counts["old"], counts["stub"]))
    print("changed against the faithful old rule: %d, lost: %d" % (changed_old, lost_old))

    print("\n-- the picture the earlier run called gained --")
    src = (ROOT / "_work" / "flat" /
           "Translative-covering-densities-of-order-n-log-n-September-23-2026.tex").read_text(
        encoding="utf-8", errors="replace")
    pic = PIC.findall(src)[0]
    print("bare `circle` key: %d  shape=circle: %d  style tables: %d  anchor reads: %s"
          % (len(re.findall(r"\[\s*[^\]]*\bcircle\b[^\]]*\]", pic)),
             len(re.findall(r"shape=circle", pic)),
             len(re.findall(r"\.style=", pic)),
             sorted(set(re.findall(r"\)\s*\.\s*(north|south|east|west|north east|north west|"
                                   r"south east|south west)", pic))) or "none"))
    for key, rule in (("old", OLD), ("stub", STUB)):
        got = build_with(pic, rule)
        print("under the %-3s rule: %s" % (key, "builds" if got else "refused"))
    print("live: %s" % ("builds" if cetz.build(pic) else "refused"))


if __name__ == "__main__":
    main()
