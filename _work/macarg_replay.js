// 21 枚 `Unexpected end of input in a macro argument` 的现场：把整条消息、卡点位置和上下文打出来。
// 站点表里的 errClass 在 55 字符处截断，光凭它分不了形；这里逐站重放给 KaTeX 听。
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const { load } = require('./katex_macros.js');
const MACROS = load();
const B = String.fromCharCode(92);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');

const rows = fs.readFileSync('dollarmath_sites11.jsonl', 'utf8').split('\n').filter(Boolean)
  .map((l) => JSON.parse(l))
  .filter((r) => r.errClass && /Unexpected end of input/.test(r.errClass));

console.log('sites ' + rows.length);
for (const r of rows) {
  let msg = 'RENDERS', pos = null;
  try {
    katex.renderToString(r.body, {
      macros: MACROS, throwOnError: true, strict: 'ignore', displayMode: r.kind === 'DISPLAY',
    });
  } catch (e) {
    msg = String(e.message).replace(/^KaTeX parse error: /, '').replace(/\s+at position.*$/, '');
    const m = /at position (\d+)/.exec(e.message);
    pos = m ? Number(m[1]) : null;
  }
  const ctx = pos === null ? '' : JSON.stringify(r.body.slice(Math.max(0, pos - 16), pos + 8));
  console.log(r.file.slice(0, 22) + ':' + r.line + ' | ' + msg + ' | pos=' + pos + ' | ' + ctx);
}
