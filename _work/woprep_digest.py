# -*- coding: utf-8 -*-
import io, json, collections, os
H = json.load(io.open(r"E:\math\_work\_woprep\strong.json", encoding="utf-8"))
print(json.dumps({"n": len(H), "files": len(set(h["d"] for h in H))}))
c = collections.Counter(h["d"] for h in H)
print(json.dumps(c.most_common(20)))
out = io.open(r"E:\math\_work\_woprep\digest.txt", "w", encoding="utf-8")
for i, h in enumerate(H):
    out.write(u"### [%03d] %s L%d  pats=%s\n%s\n\n" % (i, h["d"], h["line"], u",".join(h["pats"]), h["text"].strip()))
out.close()
print(json.dumps({"size": os.path.getsize(r"E:\math\_work\_woprep\digest.txt")}))
