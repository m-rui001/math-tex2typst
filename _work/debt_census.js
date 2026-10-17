// Corpus-wide dispatch debt: for every note, how many bytes of its own build dir
// carry zero citation in that note. Ranks notes a writer could still deepen.
// A material file counts as cited under EITHER convention: full basename
// (`07-fractional-density.tex:120`) or the numeric prefix used inside the ledgers
// (`` `07:120` ``). Measuring only the first convention calls half the corpus under-cited.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const PRE = path.join('E:' + B + B + 'math', 'preprints');
const tbl = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));

function countCite(text, name) {
  const esc = name.replace(/[.*+?^${}()|[\]\\]/g, B + '$&');
  let c = (text.match(new RegExp(esc + '(?![A-Za-z0-9._-])', 'g')) || []).length;
  const m = name.match(/^(\d{1,3})[-_.]/);
  if (m) {
    const pre = m[1].replace(/^0(?=\d)/, '');
    c += (text.match(new RegExp('(?<![0-9A-Za-z.])' + pre + ':(?=[0-9])', 'g')) || []).length;
  }
  return c;
}

const rows = [];
for (const f of fs.readdirSync(ROOT)) {
  if (!/^D\d+.*\.md$/.test(f)) continue;
  const key = f.match(/^D\d+/)[0];
  const e = tbl[key];
  if (!e || !e.dir) continue;
  const build = path.join(PRE, e.dir, 'build');
  if (!fs.existsSync(build)) continue;
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  let uncited = 0, total = 0, files = 0, big = null, bigB = 0;
  const walk = (d) => {
    for (const en of fs.readdirSync(d, { withFileTypes: true })) {
      const p = path.join(d, en.name);
      if (en.isDirectory()) { walk(p); continue; }
      if (!p.endsWith('.tex')) continue;
      // Bundled LaTeX libraries ship inside build/ and are never the note's debt.
      const rel = path.relative(build, p);
      if (/(^|[\\/])(texmf|pgf|tikz|generic|fonts|figures|graphics)([\\/]|$)/i.test(rel)) continue;
      if (/^(tikz|pgf|pgflibrary|pgfcoresystem|glyphtounicode|tex|l3|expl3|fontspec|xcolor|hyperref|hypertex|ifthen|t1enc|utf8def|ltx|plain)/i.test(en.name)) continue;
      if (/(^|[-_.])(style|class|cfg|ldf)\.tex$/i.test(en.name)) continue;
      const st = fs.statSync(p);
      total += st.size; files++;
      const c = countCite(text, en.name);
      if (c === 0) {
        uncited += st.size;
        if (st.size > bigB) { bigB = st.size; big = en.name; }
      }
    }
  };
  walk(build);
  if (files === 0) continue;
  rows.push({ key, file: f.slice(0, 28), bytes: text.length ? fs.statSync(path.join(ROOT, f)).size : 0,
    heads: (text.match(/^## /gm) || []).length, tex: files, total, uncited, big, bigB });
}
rows.sort((a, b) => b.uncited - a.uncited);
const flight = process.argv.slice(2).filter((a) => !a.startsWith('--'));
const det = process.argv.indexOf('--detail');
if (det >= 0) {
  const want = process.argv[det + 1];
  for (const r of rows) {
    if (r.key !== want) continue;
    const build = path.join(PRE, tbl[r.key].dir, 'build');
    const text = fs.readFileSync(path.join(ROOT, fs.readdirSync(ROOT).find((f) => f.startsWith(r.key + '-'))), 'utf8');
    const acc = [];
    const walk = (d) => {
      for (const en of fs.readdirSync(d, { withFileTypes: true })) {
        const p = path.join(d, en.name);
        if (en.isDirectory()) { walk(p); continue; }
        if (!p.endsWith('.tex')) continue;
        const rel = path.relative(build, p);
        if (/(^|[\\/])(texmf|pgf|tikz|generic|fonts|figures|graphics)([\\/]|$)/i.test(rel)) continue;
        if (/^(tikz|pgf|pgflibrary|pgfcoresystem|glyphtounicode|tex|l3|expl3|fontspec|xcolor|hyperref|hypertex|ifthen|t1enc|utf8def|ltx|plain)/i.test(en.name)) continue;
        if (/(^|[-_.])(style|class|cfg|ldf)\.tex$/i.test(en.name)) continue;
        const st = fs.statSync(p);
        acc.push({ rel, lines: fs.readFileSync(p, 'utf8').split('\n').length, bytes: st.size,
          cited: countCite(text, en.name) });
      }
    };
    walk(build);
    acc.sort((x, y) => x.cited - y.cited || y.bytes - x.bytes);
    console.log('DETAIL ' + r.key + ' dir=' + tbl[r.key].dir);
    for (const a of acc) console.log('  ' + (a.cited ? 'cited=' + a.cited : 'ZERO  ') + ' ' + String(a.lines).padStart(4) + 'L ' + String(a.bytes).padStart(7) + 'B ' + a.rel);
  }
  process.exit(0);
}
console.log('notes_measured=' + rows.length + ' excluded=' + flight.join(','));
let shown = 0;
for (const r of rows) {
  if (flight.indexOf(r.key) >= 0) continue;
  console.log(r.key.padEnd(6) + 'bytes=' + String(r.bytes).padStart(7) + ' heads=' + String(r.heads).padStart(3) +
    ' tex=' + String(r.tex).padStart(2) + ' total=' + String(r.total).padStart(7) +
    ' uncited=' + String(r.uncited).padStart(7) + ' biggest=' + r.big + '(' + r.bigB + ')');
  if (++shown >= 20) break;
}
