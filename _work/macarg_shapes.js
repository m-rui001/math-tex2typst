// `Unexpected end of input in a macro argument` 一族的分形凭据：
// 1) `\Set` / `\red` 在这把尺上到底是什么（KaTeX 内置？语料宏表？逐篇宏表？），报名字还是报 arity；
// 2) 「内层 `$` 落在 `\text{}` 里」这一形整条重放后的完整消息；
// 3) 候选修法在 KaTeX 上能不能渲染：`\text{s 中文}` 与 `\text{\textit{s} 中文}`。
const katex = require('katex');
const { load } = require('./katex_macros.js');
const MACROS = load();

function t(label, body, macros) {
  try {
    katex.renderToString(body, { macros: macros || {}, throwOnError: true, strict: 'ignore' });
    console.log('  ' + label + ' -> RENDERS');
  } catch (e) {
    console.log('  ' + label + ' -> ' + String(e.message).replace(/^KaTeX parse error: /, ''));
  }
}

console.log('[A] 报名字的形（空宏表 / 全局宏表）');
for (const b of ['\\mathbb N\\to\\Set', '\\red', '\\eqref', '\\mathrm\\operatorname{Id}',
  '\\frac{\\mathfrak}2', '\\text{ 是 $k']) {
  t('nofn ' + JSON.stringify(b), b, {});
  t('glob ' + JSON.stringify(b), b, MACROS);
}

console.log('[B] 内层 $ 在 \\text{} 里：整条重放');
const G1 = [
  '4^D\\cdot(\\text{$s$ 的固定幂})=\\exp(O(s^2))=o(n)',
  '\\#\\{1\\le n\\le X:f(n)\\text{ 是 $k$-power-free}\\}',
  '\\neg\\exists F\\,(\\text{$F$ 有界全纯}\\wedge\\text{Jacobian 处处非零})',
  'Q_s(t,N)=\\{y\\in C(t,N):\\text{至少 $s$ 个槽在 }\\partial[-1,1]^t\\}',
  '\\sum_{S} f_q(S)\\cdot \\mathbf 1[\\text{$S$ 是 transversal}]',
  '\\mathbb P_P(\\text{$i$ 之后下一钉在 $T$}\\mid\\mathcal H)',
  'r=\\sum_{n\\ge1}(\\text{$n$ 圈的返回贡献})',
];
for (const b of G1) t('full ' + b.slice(0, 24), b, MACROS);

console.log('[C] 候选修法');
t('A-inner \\text{s 的固定幂}', '\\text{s 的固定幂}', MACROS);
t('B-inner \\text{\\textit{s} 的固定幂}', '\\text{\\textit{s} 的固定幂}', MACROS);
t('A-whole 4^D(\\text{s 的固定幂})', '4^D\\cdot(\\text{s 的固定幂})=o(n)', MACROS);
t('B-whole 4^D(\\text{\\textit{s} 的固定幂})', '4^D\\cdot(\\text{\\textit{s} 的固定幂})=o(n)', MACROS);
t('eqref-code形 \\mathrm{Id}', 'RD=\\mathrm{Id}', MACROS);
t('mathfrak S 形 \\frac{\\mathfrak S}2', '\\ge(\\frac{\\mathfrak S}2-C_{\\rm bal}\\kappa-o(1))\\frac{X_A}L', MACROS);
t('arccos 补闭符形', '\\kappa(q)=\\frac{4\\pi}{\\arccos(-\\sqrt q/2)}', MACROS);
