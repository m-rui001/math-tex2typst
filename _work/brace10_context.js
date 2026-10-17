// Adjudication context for the surviving brace sites: the note line with the reported span
// marked, plus the neighbouring line, because `Expected 'EOF', got '}'` is equally often a
// pairing artefact (the span began mid-formula) and that only shows on the raw line.
const fs = require('fs');
const path = require('path');
const ROOT = path.join('E:' + B() + B() + 'math', '研究笔记');
function B() { return String.fromCharCode(92); }

const rows = fs.readFileSync('dollarmath_sites10.jsonl', 'utf8').split('\n').filter(Boolean)
  .map((l) => JSON.parse(l))
  .filter((r) => r.errClass && /Expected 'EOF', got '\}'/.test(r.errClass));

const cache = {};
const linesOf = (f) => (cache[f] || (cache[f] = fs.readFileSync(path.join(ROOT, f), 'utf8').split('\n')));

for (const r of rows) {
  const ls = linesOf(r.file);
  const cur = ls[r.line - 1] || '';
  const prev = r.line > 1 ? ls[r.line - 2] : '';
  const nxt = ls[r.line] || '';
  console.log('\n=== ' + r.file.slice(0, 30) + ':' + r.line + '  $onLine=' + (cur.split('$').length - 1));
  console.log('PREV| ' + prev.slice(0, 200));
  console.log('CUR | ' + cur.slice(0, 320));
  console.log('NEXT| ' + nxt.slice(0, 200));
}
