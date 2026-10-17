# -*- coding: utf-8 -*-
import io, glob, os, sys, json
NOTES = r"E:\math\研究笔记"
pairs = json.loads(sys.argv[1])
out = io.open(r"E:\math\_work\_woprep\peek.txt", "w", encoding="utf-8")
for d, l in pairs:
    p = glob.glob(os.path.join(NOTES, d + u"-*.md"))[0]
    ls = io.open(p, "rb").read().decode("utf-8", "replace").split(u"\n")
    out.write(u"@@ %s L%d (total %d lines)\n%s\n\n" % (d, l, len(ls), ls[l - 1]))
out.close()
print(json.dumps({"n": len(pairs)}))
