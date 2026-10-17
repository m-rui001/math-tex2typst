// 定点复现 KaTeX 的两族 parse error，找出「_ 后面紧跟什么」才炸。
// 用法：node _work/c_err_probe.js
const katex = require('katex');
const fs = require('fs');
const path = require('path');

const { load: loadMacros } = require('./katex_macros.js');
const macros = loadMacros();
console.log('macros keys=', Object.keys(macros).length,
  '\\R=', JSON.stringify(macros['\\R']), '\\wt=', JSON.stringify(macros['\\wt']));

const cases = [
  'h_\\operatorname{quo}',
  'h_{\\operatorname{quo}}',
  '\\operatorname{quo}',
  'a+\\operatorname{Spec}X',
  'a+{\\operatorname{Spec}}X',
  '\\wt_\\xi',
  '\\xi\\in\\mathfrak t^+_\\R',
  't^+_\\R',
  't^+_{\\R}',
  '\\mathfrak t^+_\\R',
];
for (const c of cases) {
  try {
    katex.renderToString(c, { throwOnError: true, strict: false, macros: macros });
    console.log('OK   ' + c);
  } catch (e) {
    console.log('ERR  ' + c + '  =>  ' + String(e.message).slice(0, 100));
  }
}
