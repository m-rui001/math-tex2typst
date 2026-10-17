// Companion to cite_audit.js: for every refused citation, show what the note's own
// material directory actually contains, so an abbreviated or mistyped basename can be
// told apart from an invented one without opening the paper. Prints one block per row of
// cite_audit_log.txt (tab separated: note, citation, verdict) and skips the no-dir rows,
// which are an unresolved material directory rather than a citation problem.
const fs = require('fs');
const path = require('path');

const B = String.fromCharCode(92);
const PRE = path.join('E:' + B + B + 'math', 'preprints');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const rows = fs.readFileSync('cite_audit_log.txt', 'utf8').split('\n').filter(Boolean);

const cache = new Map();
function names(dir) {
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
        rel: p.slice(dir.length + 1).split(B).join('/'),
        lines: fs.readFileSync(p, 'latin1').split('\n').length,
      });
    }
  })(path.join(PRE, dir));
  cache.set(dir, out);
  return out;
}

let shown = 0;
for (const line of rows) {
  const parts = line.split('\t');
  const note = parts[0], cite = parts[1], verdict = parts[2];
  if (verdict === 'no-dir') continue;
  const e = TBL[note];
  if (!e || !e.dir) {
    console.log(note + ' | ' + cite + ' | ' + verdict + ' | DIR-UNKNOWN');
    shown++;
    continue;
  }
  const stem = cite.replace(/:.*$/, '').replace(/^.*\//, '').replace(/\.tex$/, '');
  const pool = names(e.dir);
  const near = pool.filter((x) => {
    const b = x.base.replace(/\.[a-z]+$/, '');
    return b.includes(stem) || stem.includes(b);
  });
  const lo = cite.match(/:(\d+)/);
  const exact = pool.filter((x) => x.base === stem + '.tex' || x.base === stem + '.bbl');
  console.log(note + ' | ' + cite + ' | ' + verdict + ' | dir=' + e.dir.slice(0, 40) +
    ' ntex=' + pool.length +
    ' exact=' + (exact.length ? exact.map((x) => x.rel + '(' + x.lines + ')').join(',') : '-') +
    ' near=' + (near.length ? near.slice(0, 6).map((x) => x.base + '(' + x.lines + ')').join(',') : '-') +
    (lo ? ' want>' + lo[1] : ''));
  shown++;
}
console.log('rows_shown=' + shown);
