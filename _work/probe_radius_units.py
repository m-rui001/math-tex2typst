"""Do circle/arc radii in the corpus carry explicit units?"""
import collections
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
CIRCLE = re.compile(r"(?:circle|ellipse)\s*(\(([^()]*)\)|\[([^\]]*)\])", re.S)
RADIUS = re.compile(r"(?:x radius|y radius|radius)\s*=\s*([^,\]]+)")

kinds = collections.Counter()
bare = []
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        for m in CIRCLE.finditer(pic):
            val = (m.group(2) or m.group(3) or "").strip()
            for part in re.findall(r"=\s*([^,=]+)", val) or [val]:
                part = part.strip().split("and")[0].strip()
                if not part:
                    continue
                if re.search(r"(cm|mm|in|pt|bp|ex|em)\b", part):
                    kinds["unit"] += 1
                elif re.fullmatch(r"-?[\d.]+", part):
                    kinds["bare number"] += 1
                    if len(bare) < 8:
                        bare.append((tex.name[:36], pic[max(0, 0):0], part))
                else:
                    kinds["other: " + part[:22]] += 1
        for m in RADIUS.finditer(pic):
            val = m.group(1).strip()
            if re.search(r"(cm|mm|in|pt|bp)\b", val):
                kinds["arc radius unit"] += 1
            elif re.fullmatch(r"-?[\d.]+", val):
                kinds["arc radius bare"] += 1
            else:
                kinds["arc radius other: " + val[:20]] += 1
for k, v in kinds.most_common(14):
    print("%5d  %s" % (v, k))
