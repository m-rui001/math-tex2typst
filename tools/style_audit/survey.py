"""Read-only survey of the corpus: what the style problems actually look like."""
import glob
import re
import collections
import sys

BS = chr(92)
RAW = re.compile(BS + BS + r'[A-Za-z]{2,}')
VH = re.compile(r'#(?:v|h)\(')
CJK = re.compile('[\u4e00-\u9fff]')


def main():
    root = sys.argv[1] if len(sys.argv) > 1 else '.'
    files = sorted(glob.glob(root + '/typst/**/*.typ', recursive=True))
    tex = collections.Counter()
    tex_ctx = collections.Counter()
    per_file = collections.Counter()
    nlong = 0
    pure = 0
    pure_cjk = 0
    long_with_math = 0
    long_math_only = 0
    hvals = collections.Counter()
    comment_lines = 0
    bannerish = collections.Counter()
    for f in files:
        t = open(f, encoding='utf-8', errors='replace').read()
        for m in RAW.finditer(t):
            tex[m.group(0)] += 1
            per_file[f] += 1
            a = max(0, m.start() - 30)
            tex_ctx[t[a:m.end() + 20].replace('\n', ' ')] += 1
        for m in VH.finditer(t):
            pass
        for m in re.finditer(r'#h\(([^)]*)\)', t):
            hvals[m.group(1)] += 1
        for line in t.split('\n'):
            s = line.strip()
            if s.startswith('//'):
                comment_lines += 1
                if re.search(r'[-=*#]{3,}', s):
                    bannerish[s] += 1
            if len(line) > 120:
                nlong += 1
                has_math = '$' in s
                has_code = ('#' in s) or ('@' in s) or (BS in s)
                if not (has_math or has_code):
                    pure += 1
                    if CJK.search(s):
                        pure_cjk += 1
                elif has_math:
                    # prose with inline math, or a math block line
                    if s.startswith('$'):
                        long_math_only += 1
                    else:
                        long_with_math += 1
    print('files', len(files))
    print('long_gt120', nlong, 'pure_prose', pure, 'pure_cjk', pure_cjk,
          'prose+inline_math', long_with_math, 'mathline_start_$', long_math_only)
    print('raw_tex', sum(tex.values()), 'distinct', len(tex))
    for k, v in tex.most_common(30):
        print('  TEX', repr(k), v)
    for k, v in tex_ctx.most_common(15):
        print('  CTX', repr(k), v)
    print('files_with_raw_tex', len(per_file))
    print('h(', sum(hvals.values()), 'distinct', len(hvals))
    print('comment_lines', comment_lines, 'banner_lines', sum(bannerish.values()),
          'distinct_banners', len(bannerish))
    for k, v in bannerish.most_common(10):
        print('  BAN', repr(k[:80]), v)


if __name__ == '__main__':
    main()
