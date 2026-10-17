// Classify the surviving `Expected 'EOF', got '}'` sites after the compiler fix. Three
// shapes hide under one message:
//   LITERAL  the body opens a literal set with \{ and closes it with a bare } -- the closer
//            is the defect, the count is fine;
//   EXTRA    a } with no group of its own, at the very end of a balanced prefix;
//   SPLIT    the body STARTS with } -- the formula really continues across a $ pair, so this
//            is the delimiter-pairing family, not a brace typo.
const fs = require('fs');

const rows = fs.readFileSync('dollarmath_sites10.jsonl', 'utf8').split('\n').filter(Boolean)
  .map((l) => JSON.parse(l))
  .filter((r) => r.errClass && /Expected 'EOF', got '\}'/.test(r.errClass));

function stripped(s) {
  return s.replace(/\\\{/g, '§').replace(/\\\}/g, '¶');
}
function bal(s) {
  let d = 0, min = 0;
  for (const c of stripped(s)) {
    if (c === '{') d++;
    else if (c === '}') { d--; if (d < min) min = d; }
  }
  return { net: d, min };
}

const groups = { LITERAL: [], EXTRA: [], SPLIT: [], OTHER: [] };
for (const r of rows) {
  const b = bal(r.body);
  let k = 'OTHER';
  if (/^\}/.test(r.body)) k = 'SPLIT';
  else if (r.body.includes('\\{') && b.net === -1 && b.min === -1) k = 'LITERAL';
  else if (b.net === -1 && b.min === -1) k = 'EXTRA';
  groups[k].push(r);
}
for (const k of Object.keys(groups)) {
  console.log('\n### ' + k + ' ' + groups[k].length);
  for (const r of groups[k]) {
    console.log('  ' + r.file.slice(0, 26) + ':' + r.line + '  ' + JSON.stringify(r.body));
  }
}
console.log('\ntotal ' + rows.length);
