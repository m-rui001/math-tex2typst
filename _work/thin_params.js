// Parameters for the thin-note (浅版债) leg, pasted from measurement rather than memory:
// current size / lines / headings / max section number, and the size of the unread
// material so a dispatch can state how much substance is actually missing.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const PRE = path.join('E:' + B + B + 'math', 'preprints');
const ids = process.argv.slice(2);
const DIRPAT = new RegExp('preprints' + B + B + '([A-Za-z0-9._%+\\-]+)');
for (const id of ids) {
  const f = fs.readdirSync(ROOT).filter((x) => x.startsWith(id + '-'))[0];
  if (!f) { console.log(id + ' NO FILE'); continue; }
  const p = path.join(ROOT, f);
  const raw = fs.readFileSync(p);
  const text = raw.toString('utf8');
  const lines = text.split('\n');
  const heads = (text.match(/^## /gm) || []).length;
  let max = -1, nums = [];
  for (const l of lines) {
    const m = l.match(/^##\s*(?:§|第)?\s*(\d+)/);
    if (m) { nums.push(+m[1]); if (+m[1] > max) max = +m[1]; }
  }
  const missing = [];
  for (let k = 0; k <= max; k++) if (!nums.includes(k)) missing.push(k);
  const dup = nums.filter((v, i) => nums.indexOf(v) !== i);
  let dir = null, ctx = '';
  for (let k = 0; k < 25 && k < lines.length; k++) {
    const m = DIRPAT.exec(lines[k]);
    if (m) { dir = m[1].replace(/[.,]+$/, ''); ctx = lines[k].trim().slice(0, 70); break; }
  }
  let texBytes = 0, nTex = 0, biggest = '', bigBytes = 0;
  if (dir) {
    const d = path.join(PRE, dir, 'build');
    const walk = (p) => {
      if (!fs.existsSync(p)) return;
      for (const e of fs.readdirSync(p, { withFileTypes: true })) {
        const q = path.join(p, e.name);
        if (e.isDirectory()) walk(q);
        else if (/\.tex$/.test(e.name)) {
          const s = fs.statSync(q).size;
          texBytes += s; nTex++;
          if (s > bigBytes) { bigBytes = s; biggest = e.name; }
        }
      }
    };
    walk(d);
  }
  console.log(id + ' bytes=' + raw.length + ' lines=' + lines.length +
    ' cr=' + (raw.toString('binary').match(/\r/g) || []).length +
    ' heads=' + heads + ' max=' + max + ' missing=[' + missing.join(',') + ']' +
    ' dup=[' + dup.join(',') + ']' +
    ' dir=' + (dir || 'NONE') + ' tex_files=' + nTex + ' tex_bytes=' + texBytes +
    ' biggest=' + biggest + '(' + bigBytes + ')');
  console.log('   name=' + f);
}
