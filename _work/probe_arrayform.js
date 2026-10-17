const katex = require('katex');
const m1 = { '\\foo': ['x#1y', 1] };          // array form, 1 arg
const m2 = { '\\bar': 'z' };                   // string form, 0 arg
const m3 = { '\\norm': ['{\\Vert #1\\Vert}', 1] };
try { katex.renderToString('\\foo{a}', { throwOnError: true, strict: false, macros: m1 }); console.log('array-form OK'); }
catch (e) { console.log('array-form FAIL:', String(e.message).slice(0, 60)); }
try { katex.renderToString('\\bar', { throwOnError: true, strict: false, macros: m2 }); console.log('string-form OK'); }
catch (e) { console.log('string-form FAIL:', String(e.message).slice(0, 60)); }
try { katex.renderToString('\\norm{a}', { throwOnError: true, strict: false, macros: m3 }); console.log('norm-array OK'); }
catch (e) { console.log('norm-array FAIL:', String(e.message).slice(0, 60)); }
console.log('katex version', katex.version);
