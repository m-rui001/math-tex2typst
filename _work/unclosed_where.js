// _work/unclosed_where.js — the census reports ONE unclosed span corpus-wide but skips it;
// this names the note, the line and the ±60-char window, because 「unclosed 红旗总在全文
// 最后一个 span」 means the real culprit sits upstream.  Read-only; writes nothing.
'use strict';
const fs = require('fs');
const path = require('path');
const L = require('./dm_lib.js');

let files = fs.readdirSync(L.ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
const ARG = process.argv.slice(2).find((a) => a.startsWith('--only='));
if (ARG) files = files.filter((f) => f.startsWith(ARG.split('=')[1]));
let n = 0;
for (const f of files) {
  const text = L.readNote(f);
  const m = L.corrected(text);
  for (const s of L.spans(m, {})) {
    if (s.kind !== 'IUNCLOSED' && s.kind !== 'DUNCLOSED') continue;
    n++;
    const ln = L.lineOf(text, s.a);
    const win = text.slice(Math.max(0, s.a - 120), s.a + 40).replace(/\n/g, '\\n');
    console.log('UNCLOSED ' + f.slice(0, 34) + '  kind=' + s.kind + ' line=' + ln +
      '  window=…' + win + '…');
  }
}
console.log('files=' + files.length + ' unclosed=' + n);
