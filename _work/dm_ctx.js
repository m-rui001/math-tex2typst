// _work/dm_ctx.js — read-only context extractor for the dollar-family sites.
// For each site of a given --sites jsonl, print the raw span window from the note
// (offsets taken from the corrected gauge) so every judgement can be cold-read.
const fs = require('fs');
const path = require('path');
const L = require('./dm_lib.js');
const D = L.D;
const WORK = 'E:' + String.fromCharCode(92) + String.fromCharCode(92) + 'math/_work';

const sitesArg = arg('--sites');
const W = parseInt(arg('--w') || '160', 10);
function arg(n) {
  const p = n + '=';
  const a = process.argv.find((x) => x.startsWith(p));
  return a ? a.slice(p.length) : null;
}
const rows = fs.readFileSync(sitesArg, 'utf8').split('\n').filter((x) => x.trim())
  .map((x) => JSON.parse(x));
const fam = rows.filter((r) => (r.errClass || '').indexOf("'" + D + "' in math mode") >= 0);
const byFile = {};
for (const r of fam) (byFile[r.file] = byFile[r.file] || []).push(r);
const out = [];
for (const f of Object.keys(byFile).sort()) {
  const text = fs.readFileSync(path.join(L.ROOT, f), 'utf8');
  const m = L.corrected(text);
  const sp = L.spans(m, { digitQuirk: false });
  out.push('#### ' + f);
  for (const r of byFile[f]) {
    out.push('  L' + r.line + '  kind=' + r.kind + '  body=' + JSON.stringify(r.body.slice(0, 120)));
    // locate the offending span by matching the body of the corrected reading
    const hit = sp.filter((s) => s.interior > 0 &&
      L.lineOf(text, s.a) === r.line && L.bodyOf(m, s) === r.body);
    for (const s of (hit.length ? hit : sp.filter((x) => x.interior > 0 && L.lineOf(text, x.a) === r.line))) {
      const a = Math.max(0, s.a - W), b = Math.min(text.length, s.b + W);
      out.push('    WINDOW: ' + JSON.stringify(text.slice(a, b)));
      for (let q = s.a + 1; q < s.b; q++) {
        if (m.delim[q]) {
          out.push('    $@' + q + ' L' + L.lineOf(text, q) + ' :: ' +
            JSON.stringify(text.slice(Math.max(0, q - 70), q + 70)));
        }
      }
    }
    if (!hit.length) out.push('    (span not located under the corrected reading)');
  }
  out.push('');
}
fs.writeFileSync(path.join(WORK, 'dm_ctx.txt'), out.join('\n'), 'utf8');
console.log('files=' + Object.keys(byFile).length + ' sites=' + fam.length +
  ' bytes=' + Buffer.byteLength(out.join('\n'), 'utf8'));
