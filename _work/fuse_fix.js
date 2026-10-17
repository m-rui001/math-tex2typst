// Split a control word that lost its space: `\lverth(v)` was written for `\lvert h(v)`,
// and TeX reads `\lverth` as one undefined name, so the whole span fails to render.
// Only the delimiter words the ledger cell rule pins are touched here, because for them
// a following letter can only be the next token: none of them takes an argument.
// Usage: node fuse_fix.js [IDprefix] [--apply]
const fs = require('fs');
const path = require('path');
const M = require('./mdmath.js');
const katex = require('katex');
const B = M.B, D = M.D, BT = M.BT;
const ROOT = 'E:' + B + B + 'math' + B + B + '研究笔记';
const WORK = 'E:' + B + B + 'math' + B + B + '_work';
const APPLY = process.argv.includes('--apply');
const PREFIX = process.argv.slice(2).find((a) => !a.startsWith('--')) || '';
const FUSE = new RegExp(B + B + '(lVert|rVert|lvert|rvert|mid|upharpoonright)([A-Za-z]+)', 'g');

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f))
  .filter((f) => !PREFIX || f.startsWith(PREFIX)).sort();
const log = [];
let ops = 0, filesTouched = 0;
for (const f of files) {
  const p = path.join(ROOT, f);
  const text = fs.readFileSync(p, 'utf8');
  if (text.includes('\r')) { console.log('SKIP-CR ' + f.slice(0, 12)); continue; }
  const masked = M.fenceMask(text);
  const offs = M.lineOffsets(text);
  const edits = [];
  for (const s of M.spans(masked)) {
    if (s.kind === 'X') continue;
    FUSE.lastIndex = 0;
    let m;
    while ((m = FUSE.exec(s.body))) {
      const a = s.a + m.index;
      // Split only when the renderer itself refuses the fused name: `\middle|` reads as
      // `mid` + `dle` to this regex, yet `\middle` is a real command and must stay whole.
      let err = null;
      try {
        katex.renderToString(m[0], { throwOnError: true, strict: false });
      } catch (e) { err = e; }
      if (!err || !/Undefined control sequence/.test(String(err.message))) continue;
      const b = s.a + m.index + m[0].length;
      if (masked.startsWith(m[0], a)) {
        edits.push([a, b, B + m[1] + ' ' + m[2], M.lineOf(offs, a)]);
      }
    }
  }
  if (!edits.length) continue;
  let out = '', pos = 0;
  for (const [a, b, rep] of edits) { out += text.slice(pos, a) + rep; pos = b; }
  out += text.slice(pos);
  const cnt = (s, ch) => s.split(ch).length - 1;
  if (out.split('\n').length !== text.split('\n').length ||
      cnt(out, D) !== cnt(text, D) || cnt(out, BT) !== cnt(text, BT) || out.includes('\r')) {
    console.log('REFUSE-INVARIANT ' + f.slice(0, 12));
    continue;
  }
  filesTouched++;
  ops += edits.length;
  console.log(f.slice(0, 12) + ' ops=' + edits.length + ' lines=' +
    edits.map((e) => e[3]).join(','));
  for (const e of edits) log.push(f + '\t' + e[3] + '\t' + e[2]);
  if (APPLY) {
    fs.copyFileSync(p, path.join(WORK, f.slice(0, 12) + '.pre-fuse.md'));
    fs.writeFileSync(p, out);
  }
}
if (APPLY && log.length) {
  fs.writeFileSync(path.join(WORK, 'fuse_fix_log.txt'), log.join('\n') + '\n');
}
console.log('TOTAL files=' + filesTouched + ' ops=' + ops + (APPLY ? ' APPLIED' : ' dry'));
