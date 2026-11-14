"""Report files where the scanner does not end in a clean top-level markup frame."""
import glob

from typstscan import mode_map, NAMES, MARKUP


def main():
    bad = []
    for f in sorted(glob.glob('typst/**/*.typ', recursive=True)):
        t = open(f, encoding='utf-8', errors='replace').read()
        rep = {}
        mode_map(t, rep)
        stacked = len(rep['stack']) > 1 or rep['depth'] != 0 or rep['mode'] != MARKUP
        if stacked:
            bad.append((f, len(rep['stack']), NAMES[rep['mode']], rep['depth'],
                        [NAMES[x[0]] for x in rep['stack'][:6]]))
    print('dirty-scanner files', len(bad))
    for b in bad[:20]:
        print(' ', b[0].replace('\\', '/'), b[1], b[2], b[3], b[4])


if __name__ == '__main__':
    main()
