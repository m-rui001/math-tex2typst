// 量两族 parse error 的修法在 KaTeX 上成不成立：
//  A. `_` / `^` 紧跟裸 \operatorname{词} 时补花括号
//  B. 素材凭据把 \wt 展开成 {\rm wt}（KaTeX 全局表把 \wt 记成 \widetilde，遮蔽了本篇凭据）
// 用法：node _work/c_fix_probe.js
const katex = require('katex');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();

function render(s) {
  try {
    katex.renderToString(s, { throwOnError: true, strict: false, displayMode: false, macros: MACROS });
    return 'OK ';
  } catch (e) {
    return 'ERR ' + String(e.message).replace(/at position.*/, '').slice(0, 60);
  }
}

const cases = [
  'h_\\operatorname{quo}',
  'h_{\\operatorname{quo}}',
  '\\Theta_{h_\\operatorname{quo}}',
  '\\Theta_{h_{\\operatorname{quo}}}',
  '\\wt_\\xi',
  '{\\rm wt}_\\xi',
  '\\mathrm{wt}_\\xi',
  '{\\rm vol}_{(X,D)}',
  '\\mathrm{vol}_{(X,D)}',
  '\\operatorname{vol}_{(X,D)}',
  '\\min_\\alpha\\{\\langle\\alpha,\\xi\\rangle:f_\\alpha\\ne 0\\}',
];
for (const c of cases) console.log(render(c) + ' | ' + c);
