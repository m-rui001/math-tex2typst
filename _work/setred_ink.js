// KaTeX 对 `\Set`／`\red` 到底是内置什么 arity，以及 `\Set(\text{Fin }r\to\mathbb N)` 这一形发成什么墨。
// 只看可见文字（去掉 mathml annotation）。
const katex = require('katex');
const { load } = require('./katex_macros.js');
const MACROS = load();

function ink(body) {
  try {
    const html = katex.renderToString(body, { macros: MACROS, throwOnError: true, strict: 'ignore' });
    const t = html
      .replace(/<annotation[\s\S]*?<\/annotation>/g, '')
      .replace(/<math[\s\S]*?<\/math>/g, '')          // mathml 侧整块去掉
      .replace(/<[^>]+>/g, '')
      .replace(/&#\d+;/g, '?');
    return 'RENDERS ink=' + JSON.stringify(t.replace(/\s+/g, ' ').trim());
  } catch (e) {
    return 'ERR ' + String(e.message).replace(/^KaTeX parse error: /, '').replace(/\s+at position.*$/, '');
  }
}

for (const b of [
  '\\Set',
  '\\Set(\\text{Fin }r\\to\\mathbb N)',
  '\\mathbb N\\to\\Set(\\OrderedDistinctPoints\\ r)',
  '\\mathbb N\\to\\Set',
  '\\mathbb N\\to\\mathrm{Set}',
  '\\red',
  '\\red\\text{ 服务支撑}',
  'X_{\\red}',
  'X_{\\mathrm{red}}',
  '\\text{前 }\\Set\\text{后}',
]) console.log(JSON.stringify(b) + '  ->  ' + ink(b));
