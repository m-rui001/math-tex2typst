const katex = require('katex');
// 1) array form, numArgs 0
try { katex.renderToString('\\a', { throwOnError: true, strict: false, macros: { '\\a': ['z', 0] } }); console.log('array 0-arg OK'); }
catch (e) { console.log('array 0-arg FAIL:', String(e.message).slice(0, 50)); }
// 2) array form numArgs 1, no #1 in body
try { katex.renderToString('\\b{x}', { throwOnError: true, strict: false, macros: { '\\b': ['yz', 1] } }); console.log('array 1-arg no-#1 OK'); }
catch (e) { console.log('array 1-arg no-#1 FAIL:', String(e.message).slice(0, 50)); }
// 3) FUNCTION form 1-arg
try {
  const m = { '\\norm': (ctx) => { const a = ctx.consumeArgs(1)[0].map(t=>t.text).join(''); return '\\Vert ' + a + '\\Vert'; } };
  katex.renderToString('\\norm{a}', { throwOnError: true, strict: false, macros: m });
  console.log('function 1-arg OK');
} catch (e) { console.log('function 1-arg FAIL:', String(e.message).slice(0, 60)); }
// 4) FUNCTION form 2-arg (inner)
try {
  const m = { '\\inner': (ctx) => { const a = ctx.consumeArgs(2); const x=a[0].map(t=>t.text).join(''); const y=a[1].map(t=>t.text).join(''); return '\\langle '+x+','+y+'\\rangle'; } };
  katex.renderToString('\\inner{a}{b}', { throwOnError: true, strict: false, macros: m });
  console.log('function 2-arg OK');
} catch (e) { console.log('function 2-arg FAIL:', String(e.message).slice(0, 60)); }
