r"""Change surface of `rounded corners`, read per emitted shape.

The scan said 45 canvases gained a radius; this asks a sharper question, because the key can ride on
three different emitted shapes and only two of them were wired up: a rectangle path (`rect(.., ..,
radius:)`), an unsized node's frame (`#box(inset: .., radius: ..)`) and a node that declares its own
size, which goes through `content(range, body, frame: "rect")` and has no radius argument at all. For
every picture of every flat paper the build is run once and the statements that carry the key are
printed next to the shape they turned into, so the residue is a list of statements, not a count.
"""
import collections
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz  # noqa: E402

KEY = re.compile(r"rounded\s+corners")
STATEMENT = re.compile(r"\\(?:draw|fill|filldraw|shade|node|path)[^;]*;")
SIZED = re.compile(r"minimum (?:width|height|size)|text width=|inner sep")


def canvases(body, table):
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    out = []
    for pic, (macros, decls) in zip(convert.TIKZ_SPAN.findall(body),
                                     convert.picture_scopes(body, table.macros)):
        if decls:
            pic = convert.with_declarations(pic, decls)
        out.append(prep.expand_macros(pic, macros))
    return out


def emitted_as(stmt, built):
    """The shape the statement's rounding ended up on."""
    if "radius:" not in built:
        return "nothing"
    if re.search(r"\\node", stmt):
        return "sized node frame" if SIZED.search(stmt) else "node box"
    return "rect path" if "rectangle" in stmt else "other path"


def main():
    seen = collections.Counter()
    silent = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        if not KEY.search(src):
            continue
        pre_text, body = prep.split_document(src)
        table = prep.parse_preamble(pre_text)
        for pic in canvases(body, table):
            if not KEY.search(pic):
                continue
            built = cetz.convert(pic, table.colors, convert.line_cm(table))
            if built is None:
                seen["refused picture"] += 1
                continue
            hits = [s for s in STATEMENT.findall(pic) if KEY.search(s)]
            if not hits:
                # the key sits in a style or a scope option this pass never expanded onto a statement
                seen["key only in a declaration"] += 1
                if "radius:" not in built:
                    silent.append((stem, pic[:70]))
                continue
            for stmt in hits:
                seen[emitted_as(stmt, built)] += 1
                if emitted_as(stmt, built) == "sized node frame":
                    silent.append((stem, " ".join(stmt.split())[:130]))
    for kind, n in seen.most_common():
        print("%-30s %d" % (kind, n))
    print("\nstatements whose rounding did not reach an emitted shape: %d" % len(silent))
    for stem, stmt in silent[:14]:
        print("   %s: %s" % (stem[:32], stmt))


if __name__ == "__main__":
    main()
