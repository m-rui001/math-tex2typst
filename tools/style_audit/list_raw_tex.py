"""List genuine LaTeX leftovers (\command) per file, excluding JS newline escapes."""
import glob
import re
import sys

BS = chr(92)
RAW = re.compile(BS + BS + r'[A-Za-z]{2,}')
NEWLINE_TOKENS = {'nM', 'nU', 'ndef', 'nK', 'nf', 'nP', 'nfor', 'nk', 'nassert', 'ng',
                  'npython', 'nq', 'nif', 'nelif', 'nelse', 'nreturn', 'nwhile', 'nn', 'nt'}


def main():
    rows = []
    for f in sorted(glob.glob('typst/**/*.typ', recursive=True)):
        t = open(f, encoding='utf-8', errors='replace').read()
        for i, line in enumerate(t.split('\n'), 1):
            for m in RAW.finditer(line):
                tok = m.group(0)[1:]
                if tok in NEWLINE_TOKENS or tok.startswith('n') and len(tok) <= 4:
                    continue
                rows.append((f, i, tok, line.strip()[:180]))
    print('hits', len(rows))
    for r in rows:
        print(r[0].replace('\\', '/'), r[1], r[2], '|', r[3])


if __name__ == '__main__':
    main()
