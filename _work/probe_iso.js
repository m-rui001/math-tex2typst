const katex = require('katex');
const fs = require('fs');
const M = JSON.parse(fs.readFileSync('katex_macros.json', 'utf8'));
const cases = [
  ['\\norm{x}', true],
  ['\\abs{x}', true],
  ['\\norm{U(z)}^2', false],
  ['\\inner{a}{b}', false],
  ['\\ip{a}{b}', false],
  ['\\eqref{eq:a}', false],
  ['\\ref{a}', false],
  ['\\cite{a}', false],
  ['\\label{a}', false],
  ['\\floor{x}', true],
  ['\\ceil{x}', true],
  ['\\av x', false],
  ['\\mathfr{x}', false],
  ['\\widilde{x}', false],
  ['\\mathfrak{x}', false],
  ['\\operatorname{av}', false],
];
for (const [t, disp] of cases) {
  try { katex.renderToString(t, { throwOnError: true, strict: false, displayMode: disp, macros: M }); console.log('OK  ', t); }
  catch (e) { console.log('FAIL', t, '::', String(e.message).slice(0, 60)); }
}
// Now test each WITHOUT its specific macro present:
console.log('--- without specific macro ---');
for (const [t, disp] of cases) {
  const m2 = Object.assign({}, M);
  // remove the leading command
  const cmd = t.match(/^\\[A-Za-z]+/);
  if (cmd) delete m2[cmd[0]];
  try { katex.renderToString(t, { throwOnError: true, strict: false, displayMode: disp, macros: m2 }); console.log('OKno', t); }
  catch (e) { console.log('FAILno', t, '::', String(e.message).slice(0, 50)); }
}
