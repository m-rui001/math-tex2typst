# -*- coding: utf-8 -*-
import re

FUSE = re.compile(u"\\\\(lVert|rVert|Vert|lvert|rvert|mid(?!dle))(?=[A-Za-z])")
s = (u"$\\left\\lvertq\\right\\rvertS$ and $\\mid x$ and $\\middle|y$ "
     u"and $a\\rVertz$ and $\\VertQ$")
out = FUSE.sub(u"\\\\\\g<1> ", s)
print(repr(s))
print(repr(out))
print("residual=", FUSE.findall(out))
print("lines=", s.count(u"\n") == out.count(u"\n"), "len=", len(s), len(out))
