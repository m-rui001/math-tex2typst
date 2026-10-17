# -*- coding: utf-8 -*-
"""CRLF / BOM / trailing-space census (binary reads only, ASCII stdout)."""
import io, os, glob, json, collections

NOTES = r"E:\math\研究笔记"
EXCL = {u"D476", u"D71"}

def stat(p):
    b = io.open(p, "rb").read()
    crlf = b.count(b"\r\n")
    lone_cr = b.count(b"\r") - crlf
    lf = b.count(b"\n") - crlf
    bom = 1 if b.startswith(b"\xef\xbb\xbf") else 0
    t = b.decode("utf-8", "replace")
    lines = t.split(u"\n")
    trail = sum(1 for l in lines if l.endswith(u" \r") or (l.endswith(u" ") and l.strip()))
    return {"bytes": len(b), "crlf": crlf, "cr": lone_cr, "lf": lf, "bom": bom,
            "lines": len(lines), "trail_ws": trail}

def main():
    out = {}
    n_excl = 0
    for p in sorted(glob.glob(os.path.join(NOTES, u"D*.md"))):
        key = os.path.basename(p).split(u"-")[0]
        if not key[1:].isdigit():
            continue
        if key in EXCL:
            n_excl += 1
            continue
        out[key] = stat(p)
    json.dump(out, io.open(os.path.join(r"E:\math\_work\_woprep", "crlf.json"), "w",
                           encoding="utf-8"), ensure_ascii=False)
    c = collections.Counter()
    for k, v in out.items():
        if v["crlf"]:
            c["with_crlf"] += 1
        if v["cr"]:
            c["with_lone_cr"] += 1
        if v["bom"]:
            c["with_bom"] += 1
        if v["trail_ws"]:
            c["with_trailing_ws"] += 1
    c["notes"] = len(out)
    c["excl_skipped"] = n_excl
    print(json.dumps(c))
    top = sorted(out.items(), key=lambda kv: -kv[1]["crlf"])[:12]
    print(json.dumps([[k, v["crlf"], v["trail_ws"], v["bom"]] for k, v in top]))

if __name__ == "__main__":
    main()
