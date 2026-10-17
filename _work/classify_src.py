# -*- coding: utf-8 -*-
import io, os, sys, glob, gzip, tarfile
sys.stdout.reconfigure(encoding='utf-8')
for d in sorted(glob.glob('被引素材/*')):
    files = [os.path.join(d, f) for f in os.listdir(d)]
    kinds = {}
    for f in files:
        h = io.open(f, 'rb').read(6)
        if h[:2] == b'\x1f\x8b':
            k = 'gzip'
        elif h[:4] == b'%PDF':
            k = 'PDF'
        else:
            k = 'text'
        kinds[k] = kinds.get(k, 0) + 1
    print('%-16s n=%d %s' % (os.path.basename(d), len(files), kinds), end='  ')
    for f in files:
        h = io.open(f, 'rb').read(2)
        if h == b'\x1f\x8b':
            try:
                data = gzip.decompress(io.open(f, 'rb').read())
                nm = f + '.tex'
                os.rename(f, nm)
                io.open(nm, 'wb').write(data)
                print('gunzipped %s -> %d bytes' % (os.path.basename(nm), len(data)), end='')
            except Exception as e:
                print('gunzip FAIL %s' % e, end='')
    print()
