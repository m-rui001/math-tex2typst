"""Read the DUMP records of _work/m100_nd_probe.tex and print the gaps pdflatex drew.

For every (case, direction) the border-to-border gap is `B.west - A.east` on the horizontal and
`B.south - A.north` on the vertical; the centre-to-centre distance is printed beside it so a reading
can be told from a claim about which one TikZ separates.
"""
import io
import re
import sys

PT = re.compile(r"([-+0-9.]+)pt")
REC = re.compile(r"^DUMP\|([^|]*)\|([^|]*)\|([AB]\.[a-z-]+)\|([-+0-9.]+)pt\|([-+0-9.]+)pt")
CM = 28.452755  # 1cm in pt, the same conversion the probe's own numbers use


def main(path):
    got = {}
    for line in io.open(path, encoding="utf-8", errors="replace"):
        m = REC.match(line.strip())
        if m:
            case, key, anchor, x, y = m.groups()
            got.setdefault((case, key), {})[anchor] = (float(x), float(y))
    print("%-22s %-14s %9s %9s %9s %9s" % ("case", "direction", "gap-x pt", "gap-x cm",
                                           "gap-y pt", "gap-y cm"))
    for (case, key), a in sorted(got.items(), key=lambda x: str(x[0])):
        gx = a["B.west"][0] - a["A.east"][0]
        gy = a["B.south"][1] - a["A.north"][1]
        print("%-22s %-14s %9.3f %9.3f %9.3f %9.3f   cc=(%.3f, %.3f)"
              % (case, key, gx, gx / CM, gy, gy / CM,
                 a["B.center"][0] - a["A.center"][0], a["B.center"][1] - a["A.center"][1]))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1] if len(sys.argv) > 1 else "_work/m100_nd_probe.log"))
