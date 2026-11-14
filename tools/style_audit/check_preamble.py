"""Check whether the first 22 lines (the shared preamble) changed in any file."""
import glob
import subprocess

BS = chr(92)


def main():
    files = sorted(glob.glob('typst/*/main.typ'))
    bad = []
    for f in files:
        rel = f.replace(BS, '/')
        old = subprocess.run(['git', 'show', 'HEAD:' + rel], capture_output=True).stdout.decode('utf-8')
        new = open(f, encoding='utf-8').read()
        ol = old.split('\n')[:22]
        nl = new.split('\n')[:22]
        if ol != nl:
            bad.append((f, ol, nl))
    print('files with changed preamble', len(bad))
    for f, ol, nl in bad[:4]:
        print(f)
        for i in range(min(len(ol), len(nl))):
            if ol[i] != nl[i]:
                print('  line', i + 1, 'OLD', repr(ol[i][:100]))
                print('  line', i + 1, 'NEW', repr(nl[i][:100]))


if __name__ == '__main__':
    main()
