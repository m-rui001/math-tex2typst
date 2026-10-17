"""Fast (no compile gate): signature histogram of statements cetz still refuses."""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
REF = re.compile(r"[A-Za-z]+=")


def verb_of(stmt):
    m = re.match(r"\\(\w+)", stmt)
    return m.group(1) if m else "?"


def signature(stmt):
    """A coarse shape for a refused statement: verb, option keys, remaining constructs."""
    m = re.match(r"\\(\w+)\s*", stmt)
    if not m:
        return stmt.strip()[:60]
    verb = m.group(1)
    o, pos = cetz._opts_at(stmt, m.end())
    keys = tuple(sorted(k for k in (o or {})))
    rest = stmt[pos:] if o is not None else stmt[m.end():]
    constructs = []
    for pat, name in ((r"\\node\b", "node"), (r"\\foreach\b", "foreach"),
                      (r"\|-", "|-"), (r"-\|", "-|"), (r"\\bd\b|\\bend", "bend"),
                      (r"\bto\b", "to"), (r"\((?:[-\w]*)\)\s*at\b", "at-node"),
                      (r"atan|\bsin\b|\bcos\b", "trig"), (r"\\draw\b", "draw2"),
                      (r"\bbefore xy\b|\blet\b", "let"), (r"coordinates\s*\{", "coords"),
                      (r"\\pic\b", "pic"), (r"\\matrix\b", "matrix"),
                      (r"\\scoped\b|begin\{scope\}", "scope")):
        if re.search(pat, rest):
            constructs.append(name)
    return "%s opts=%s %s" % (verb, ",".join(keys)[:60], ",".join(constructs))


hist = collections.Counter()
examples = {}
refused_pics = converted = 0

for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        if cetz.build(pic) is not None:
            converted += 1
            continue
        # production said no; retrace its steps only to report which statement
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        if not m:
            hist["no-begin"] += 1
            continue
        body = pic[m.end():].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None:
            hist["broken-header"] += 1
            continue
        base = cetz._transform(head)
        if base is None:
            hist["tilt-header"] += 1
            continue
        body = body[pos:]
        end = body.rfind("\\end{tikzpicture}")
        body = body[:end] if end >= 0 else body
        exp = cetz.expand_foreach(body)
        if exp is None:
            hist["foreach-failed"] += 1
            continue
        cols = cetz._colors(exp)
        if cols is None:
            hist["unmodellable-color"] += 1
            continue
        pal, exp = cols
        hit = cetz.UNSUPPORTED.search(exp)
        if hit:
            hist["unsupported:" + hit.group(0).strip("\\ ")] += 1
            continue
        placed = cetz.scoped(exp, base)
        if placed is None:
            hist["scope-failed"] += 1
            continue
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf)
        bad = None
        for stmt, xf in placed:
            if cetz.translate_statement(stmt, names, xf, pal) is None:
                bad = stmt
                break
        if bad is None:
            hist["markup-or-compile-gate"] += 1
            continue
        refused_pics += 1
        sig = signature(bad)
        hist[sig] += 1
        examples.setdefault(sig, (tex.name[:40], re.sub(r"\s+", " ", bad.strip())[:170]))

print("reach translate_statement without refusal: %d, refused: %d" % (converted, refused_pics))
for k, v in hist.most_common(40):
    print("%5d  %s" % (v, k))
    name, ex = examples.get(k, ("", ""))
    if ex:
        print("        %-42s %s" % (name, ex))
