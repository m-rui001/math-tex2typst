// 内层 `$` 落在 `\text{}` 里时，KaTeX 把这两枚 `$` 发成什么墨？
// 只把渲染出来的可见文字打出来（annotation 是源式，不算墨）。
const katex = require('katex');
const { load } = require('./katex_macros.js');
const MACROS = load();

function visible(body) {
  const html = katex.renderToString(body, { macros: MACROS, throwOnError: true, strict: 'ignore' });
  const m = /<span class="mord">([\s\S]*?)<\/span>/.exec(html);
  const txt = html
    .replace(/<annotation[\s\S]*?<\/annotation>/g, '')
    .replace(/<[^>]+>/g, '')
    .replace(/&[#a-z0-9]+;/gi, ' ');
  console.log('  BODY ' + JSON.stringify(body));
  console.log('  INK  ' + JSON.stringify(txt.replace(/\s+/g, ' ').trim()));
  console.log('  DOLLAR-INK ' + (txt.indexOf('$') >= 0 ? 'YES' : 'no'));
}

visible('\\text{$s$ 的固定幂}');
visible('\\text{s 的固定幂}');
visible('\\text{\\textit{s} 的固定幂}');
visible('\\text{ 是 $k$-power-free}');
visible('\\text{$F$ 有界全纯}');
visible('\\text{$n$ 圈的返回贡献}');
