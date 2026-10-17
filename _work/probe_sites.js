const fs = require('fs');
const B = String.fromCharCode(92);
const p = process.argv[2];
const t = fs.readFileSync(p, 'utf8');
// 匹配字面 \K（反斜杠 + K），避开 JS 正则里 \K 被当身份转义的坑。
const re = new RegExp(B + B + 'K(?![A-Za-z])', 'g');
let m, n = 0;
const TICK = String.fromCharCode(96);
const lines = t.split('\n');
const start = [];
let acc = 0;
for (const L of lines) { start.push(acc); acc += L.length + 1; }
const lineOf = (i) => { let lo = 0, hi = start.length - 1; while (lo < hi) { const mid = (lo + hi + 1) >> 1; if (start[mid] <= i) lo = mid; else hi = mid - 1; } return lo + 1; };
while ((m = re.exec(t)) && n < 20) {
  n++;
  const i = m.index;
  const seg = t.slice(Math.max(0, i - 70), i + 34).replace(/\n/g, ' ');
  const inTick = t.slice(start[lineOf(i)], i).split(TICK).length % 2 === 0;
  console.log('L' + lineOf(i) + ' inCodeSpan=' + inTick + ' | ' + JSON.stringify(seg));
}
console.log('sites=' + n + ' file=' + p);
