// Self-test for the corpus macro compiler: one shape that MUST render (an argument-taking
// corpus macro, expanded the native way) and one that MUST fail (a genuine stray brace).
// A compiler that silently produced garbage would otherwise pass by making the census go
// quiet, so both ends are pinned here.
const katex = require('katex');
const { load, compile } = require('./katex_macros.js');

const MUST_RENDER = [
  '\\norm{\\mathbb E_{\\mu_{h_0}}x-t_*}\\le C',
  '\\abs{x^*D_{>i}x}\\le\\norm x^2',
  '\\norm{\\operatorname{Ric}-3g}_2\\to0',
  '\\norm{g_{j+1}-g_j}_p',
];
const MUST_FAIL = [
  ['\\mathbb P_{\\mathrm{P}}}', "Expected 'EOF', got '}'"],
  ['\\delta_{e_{h(s)}}}', "Expected 'EOF', got '}'"],
];

let bad = 0;
const macros = load();
console.log('compiled entries ' + Object.keys(macros).length +
  ' (all strings: ' + Object.values(macros).every((v) => typeof v === 'string') + ')');
for (const t of MUST_RENDER) {
  try {
    katex.renderToString(t, { macros, throwOnError: true, strict: 'ignore' });
    console.log('ok       ' + t);
  } catch (e) {
    bad++;
    console.log('UNEXPECTED ' + t + ' :: ' + e.message.slice(0, 70));
  }
}
for (const [t, why] of MUST_FAIL) {
  let got = 'RENDERS';
  try {
    katex.renderToString(t, { macros, throwOnError: true, strict: 'ignore' });
  } catch (e) {
    got = String(e.message).replace(/^KaTeX parse error: /, '');
  }
  if (!got.startsWith(why)) { bad++; console.log('LOST     ' + t + ' :: ' + got.slice(0, 60)); }
  else console.log('ok       ' + t + ' still reports ' + why);
}
// Order test: an argument-taking macro must land each argument in its own slot. Assert the
// glyph ORDER in the rendered text (KaTeX echoes the source in an <annotation>, so comparing
// HTML across forms is meaningless). The previous compiler built args with
// ctx.consumeArgs(n) + a string join, which returns the tokens reversed in 0.19.0 -- that
// shape fails this assertion, which is the point.
const r = (s, m) => katex.renderToString(s, { macros: m, throwOnError: true, strict: 'ignore' });
const text = (h) => h.replace(/<annotation[\s\S]*?<\/annotation>/g, '')
  .replace(/<[^>]*>/g, '').replace(/\s+/g, '');
const two = compile({ '\\TT': { n: 2, tex: '#1\\subset#2' } });
const fwd = text(r('\\TT{a}{b}', two));
const rev = text(r('\\TT{b}{a}', two));
const ok = (s, x, y) => s.indexOf(x) >= 0 && s.indexOf(y) > s.indexOf(x) && !s.includes('#');
if (!ok(fwd, 'a', 'b') || !ok(rev, 'b', 'a')) {
  bad++; console.log('BROKEN two-arg order: fwd=' + fwd + ' rev=' + rev);
} else console.log('ok       two-arg slots in order: ' + fwd + ' / ' + rev);
console.log(bad === 0 ? 'SELFTEST PASS' : 'SELFTEST FAIL ' + bad);
process.exit(bad ? 1 : 0);
