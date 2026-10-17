// Repair the citation family where the note drops the numeric prefix of a material
// filename: `introduction.tex:18` when that paper's build tree has exactly one
// `00-introduction.tex`. The candidate must be unique, the cited range must fit inside
// it, and the note's own material directory (preamble_tables.json) must not already
// contain the cited basename -- otherwise this is a cross-paper quote or a wrong number,
// and those need reading, not splicing. Edits are spliced by offset, right to left, so a
// repeated abbreviation is repaired once per occurrence.
//   node cite_prefix_fix.js [--apply] [ID...]
const fs = require('fs');
const path = require('path');

const B = String.fromCharCode(92);
const NOTES = path.join('E:' + B + B + 'math', '研究笔记');
const PRE = path.join('E:' + B + B + 'math', 'preprints');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const CITE = /([A-Za-z0-9_][A-Za-z0-9_.+-]*\.(?:tex|bbl|sty|cls|bib))(:(?:\d+)(?:\s*[-\u2013]\s*\d+)?)/g;
const APPLY = process.argv.includes('--apply');
const ONLY = process.argv.slice(2).filter((a) => /^D\d+$/.test(a));
// Writers currently appending to these must not have their tail edited under them.
// D533 handed its batch back at 15:44, so it is no longer frozen.
const INFLIGHT = ['D68', 'D605'];

const cache = new Map();
function tree(dir) {
  if (cache.has(dir)) return cache.get(dir);
  const out = [];
  (function walk(p) {
    let st;
    try {
      st = fs.statSync(p);
    } catch (e) {
      return;
    }
    if (st.isDirectory()) {
      for (const f of fs.readdirSync(p)) walk(path.join(p, f));
      return;
    }
    if (/\.(tex|bbl|sty|cls|bib)$/.test(p)) {
      out.push({
        base: path.basename(p),
        stem: path.basename(p).replace(/\.[a-z]+$/, ''),
        lines: fs.readFileSync(p, 'latin1').split('\n').length,
      });
    }
  })(path.join(PRE, dir));
  cache.set(dir, out);
  return out;
}

// The prefix the writers omit: a leading run of digits, zeros and separators.
function unprefixed(stem) {
  return stem.replace(/^[\d._-]+/, '');
}

let filesHit = 0, sites = 0, refused = 0, bytesDelta = 0;
for (const f of fs.readdirSync(NOTES).filter((x) => /^D\d+.*\.md$/.test(x)).sort()) {
  const key = (f.match(/^D\d+(?=-)/) || [''])[0];
  if (INFLIGHT.includes(key)) continue;
  if (ONLY.length && !ONLY.includes(key)) continue;
  const e = TBL[key];
  if (!e || !e.dir) continue;
  const pool = tree(e.dir);
  if (!pool.length) continue;
  const p = path.join(NOTES, f);
  const text = fs.readFileSync(p, 'utf8');
  const edits = [];
  for (const m of text.matchAll(CITE)) {
    const base = m[1], tail = m[2];
    const stem = base.replace(/\.[a-z]+$/, '');
    if (pool.some((x) => x.stem === stem)) continue;
    const want = unprefixed(stem);
    const cands = pool.filter((x) => unprefixed(x.stem) === want &&
      x.stem !== stem && x.stem.endsWith(stem));
    const nums = tail.match(/\d+/g).map(Number);
    const fits = cands.filter((x) => nums.every((v) => v <= x.lines));
    if (cands.length !== 1 || fits.length !== 1) {
      refused++;
      if (cands.length > 1) {
        console.log('AMB ' + key + ' ' + base + tail + ' -> ' +
          cands.map((x) => x.base).join(','));
      }
      continue;
    }
    edits.push({ at: m.index, len: base.length, to: fits[0].base, from: base, where: tail });
  }
  if (!edits.length) continue;
  filesHit++;
  sites += edits.length;
  let out = text;
  for (let i = edits.length - 1; i >= 0; i--) {
    const E = edits[i];
    out = out.slice(0, E.at) + E.to + out.slice(E.at + E.len);
  }
  const sameLines = out.split('\n').length === text.split('\n').length;
  const sameDollar = (out.match(/\$/g) || []).length === (text.match(/\$/g) || []).length;
  const sameTick = (out.match(/`/g) || []).length === (text.match(/`/g) || []).length;
  const noCR = out.indexOf('\r') < 0;
  if (!(sameLines && sameDollar && sameTick && noCR)) {
    console.log('GUARD-FAIL ' + key + ' lines=' + sameLines + ' $=' + sameDollar +
      ' tick=' + sameTick + ' cr=' + noCR);
    continue;
  }
  bytesDelta += Buffer.byteLength(out) - Buffer.byteLength(text);
  const uniq = new Set(edits.map((E) => E.from + E.where + '->' + E.to));
  console.log(key + ' sites=' + edits.length + ' distinct=' + uniq.size +
    ' +' + (Buffer.byteLength(out) - Buffer.byteLength(text)) + 'B ' +
    [...uniq].slice(0, 6).join(' / ') + (uniq.size > 6 ? ' ...' : ''));
  if (APPLY) {
    // The backup goes next to the other probe output, never into 研究笔记: a stray
    // `D*.md` there would be counted by the gate and wrap censuses.
    fs.writeFileSync('_work_backup_' + key + '.pre-citefix.md', text);
    fs.writeFileSync(p, out);
  }
}
console.log('MODE=' + (APPLY ? 'APPLIED' : 'dry') + ' files=' + filesHit +
  ' sites=' + sites + ' refused=' + refused + ' bytes+' + bytesDelta);
