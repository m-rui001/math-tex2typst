// 分清两式：`\operatorname{词}` 在下标位「左侧」（作为底）与「右侧」（作为下标）是不是都炸。
const katex = require('katex');
const { load: loadMacros } = require('./katex_macros.js');
const M = loadMacros();
function r(s) {
  try { katex.renderToString(s, { throwOnError: true, strict: false, macros: M }); return 'OK   ' + s; }
  catch (e) { return 'ERR  ' + s + '  =>  ' + String(e.message).replace(/at position.*/, '').slice(0, 58); }
}
[
  '\\operatorname{wt}_\\xi',
  '\\operatorname{quo}_x',
  '{\\operatorname{wt}}_\\xi',
  'h_\\operatorname{quo}',
  'h_{\\operatorname{quo}}',
  '\\operatorname{vol}_{X,x}(v)',
  'X\\operatorname{Spec}\\mathbb C',
].forEach((s) => console.log(r(s)));
