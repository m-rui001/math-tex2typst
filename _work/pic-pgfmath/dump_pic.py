r"""Print one flat picture's own source so a canvas diff can be checked against what TikZ says.

Usage: python dump_pic.py <flat-name-prefix> <picture-index>
"""
import glob
import re
import sys

prefix, index = sys.argv[1], int(sys.argv[2])
path = glob.glob(r"E:\math\_work\flat\%s*.tex" % prefix)[0]
src = open(path, encoding="utf-8", errors="replace").read()
pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", src, re.S)
print(pics[index])
