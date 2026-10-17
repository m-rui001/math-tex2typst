// 定界符级修法的第二把尺：补完之后**新造出来的那个式体**能不能渲染。
// 用法：node _work/hash8_render.js
// 式体是从「修前那一行的行内代码之外的单 $ 配对」手工落出来的（delim_probe 已经证明修后成对），
// 这里只判「成对之后的式体是不是合法 LaTeX」，防止把缺陷从跨行拖回成一行内的乱码式。
const katex = require('katex');
const MAC = require('./katex_macros.js').load();

const SPANS = [
  ['D211:227', '\\mu(U)=1', false],
  ['D211:233', '\\eqref{eq:split-measure}', false],
  ['D80:2228', 'D_*=1+\\lfloor\\log_{10/9}(n^3)\\rfloor', false],
  ['D93:158', 'd\\ge3', false],
  ['D293:57', 'R_*(n,d,j)=\\Big\\{r\\in R(n,d):\\#\\{u\\in\\{0,1\\}^n:\\#(W_n(r;d)\\cap\\mathcal O_u)\\ge j(2r)^n\\}\\ge\\frac{2^n}{d}\\Big\\}', true],
  // 同段并行的合法形，作对照（这些本来就在稿里，渲染必须通过）
  ['D80 对照', '2^{O(\\log^2(L+2))}', false],
  ['D244 删符后残留', 'U_T g=g\\circ T', false],
];

let bad = 0;
for (const [name, body, disp] of SPANS) {
  try {
    const ink = katex.renderToString(body, {
      throwOnError: true, strict: 'ignore', macros: MAC, displayMode: disp,
    }).replace(/<annotation[\s\S]*?<\/annotation>/g, '').replace(/<[^>]+>/g, '');
    console.log('OK   ' + name.padEnd(12) + JSON.stringify(ink.replace(/−/g, '-').slice(0, 56)));
  } catch (e) {
    console.log('!! ERR ' + name.padEnd(12) + e.message.split('\n')[0].slice(0, 80));
    bad++;
  }
}
// 修前的非法形必须确实报错，否则这把尺没有信息量
try {
  katex.renderToString('R_*(n,d,j)=\\Big\\{r\\in R(n,d):\\#\\{u\\in\\{0,1\\}^n:\\ #(W_n(r;d)\\cap\\mathcal O_u)\\Big\\}',
    { throwOnError: true, strict: 'ignore', macros: MAC, displayMode: true });
  console.log('!! 修前裸 # 形竟然渲染，对照失效');
  bad++;
} catch (e) {
  console.log('OK   修前对照 ' + e.message.split('\n')[0].slice(0, 60));
}
console.log('式体=' + SPANS.length + ' 异常=' + bad);
