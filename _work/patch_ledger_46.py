import pathlib
import re

p = pathlib.Path("_work/community.md")
t = p.read_text(encoding="utf-8")
subs = [
    ("新增 `node_inset(o)`（1936）一条路径", "新增 `node_inset(o)`（1967）一条路径"),
    ("`box_args`（1951）第一件事改成", "`box_args`（1996）第一件事改成"),
    ("新增 `PADDING_KEYS`＋`node_padding(o, xf)`（1930 前后）",
     "新增 `PADDING_KEYS`（566）＋`node_padding(o, xf)`（569）"),
    ("`node_inner_sep`（横轴 cm：圆的", "`node_inner_sep`（595，横轴 cm：圆的"),
    ("`node_frame_width`（`text width` 的撑宽）",
     "`node_frame_width`（524，`text width` 的撑宽）"),
]
for a, b in subs:
    if a not in t:
        raise SystemExit("not found: " + a[:40])
    t = t.replace(a, b, 1)
p.write_text(t, encoding="utf-8")
print("patched %d references" % len(subs))
