// `\text{…$…$…}` 一族的全库面：26 处里只有 7 处在这把尺上报错，其余按构造是「静默截断」——
// 跨度在内层那枚 $ 处关段，前后两截各自能渲染，读者看到的是断开的式子＋掉出来的中文。
// 这里用 shipped 语法（dm_lib.spans，与 katex_census.js 同一口径）逐处算出：
//   该处落在哪一枚跨度里、那一跨的 body 是什么、重放给 KaTeX 的结果、断点之后掉出来的文字。
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const dm = require('./dm_lib.js');
const { load } = require('./katex_macros.js');
const MACROS = load();
const RX = /\\text\{[^{}]*\$[^{}]*\}/g;

const files = fs.readdirSync(dm.ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
const out = [];
for (const f of files) {
  const text = dm.readNote(f);
  // 用 corrected 口径：围栏＋行内代码＋\$ 全部空格化，长度不变，所以偏移＝原始偏移，
  // 行号与跨度位置能直接对上（shipped 把围栏行删成长度不齐，不能拿来定位）。
  const m = dm.corrected(text);
  const sps = dm.spans(m, { digitQuirk: true });
  const lines = text.split('\n');
  for (let li = 0; li < lines.length; li++) {
    const off0 = lines.slice(0, li).join('\n').length + (li ? 1 : 0);
    RX.lastIndex = 0;
    let mm;
    while ((mm = RX.exec(lines[li]))) {
      const raw = off0 + mm.index;
      // 找到包含这个偏移的跨度
      const hit = sps.filter((s) => s.b !== undefined && s.a <= raw && raw < s.b);
      if (!hit.length) { out.push({ f, li: li + 1, kind: 'NO-SPAN', prov: m.prov[raw], frag: mm[0] }); continue; }
      const sp = hit[0];
      const body = dm.bodyOf(m, sp);
      let res, pos = null;
      try {
        katex.renderToString(body, { macros: MACROS, throwOnError: true, strict: 'ignore', displayMode: sp.kind === 'DISPLAY' });
        res = 'RENDERS';
      } catch (e) {
        res = String(e.message).replace(/^KaTeX parse error: /, '').replace(/\s+at position.*$/, '');
        const q = /at position (\d+)/.exec(e.message); pos = q ? Number(q[1]) : null;
      }
      // 内层第一个 $ 在跨度里的位置：它之后掉出去的文字
      const rel = raw - sp.a;
      const dollars = [];
      for (let i = 0; i < body.length; i++) if (body[i] === '$') dollars.push(i);
      const leak = dollars.length ? JSON.stringify(body.slice(dollars[0])) : '(body 里没有 $)';
      out.push({ f, li: li + 1, kind: sp.kind, res: res.slice(0, 46), pos, body: JSON.stringify(body).slice(0, 70), leak, frag: JSON.stringify(mm[0]).slice(0, 70) });
    }
  }
}
let n = 0;
for (const o of out) {
  n++;
  console.log(JSON.stringify(o));
}
console.log('sites=' + n + '  RENDERS(静默)=' + out.filter((o) => o.res === 'RENDERS').length +
  '  拒渲=' + out.filter((o) => o.res !== 'RENDERS' && o.res !== 'NO-SPAN').length +
  '  不在跨度=' + out.filter((o) => o.res === 'NO-SPAN').length);
