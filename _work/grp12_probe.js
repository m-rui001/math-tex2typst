// `Expected group after '_'／'^'` 腿的修法验真：12 站的修前串直接从 sites17 台账取（逐字），
// 修法＝对同一 body 做定点替换后再喂 KaTeX（throwOnError + 全局宏表 + display 按 kind）。
const fs = require('fs');
const katex = require('katex');
const MAC = require('./katex_macros.js').load();
const B = String.fromCharCode(92);

function render(label, src, display) {
  try {
    const h = katex.renderToString(src, { throwOnError: true, strict: 'ignore', macros: MAC, displayMode: !!display })
      .replace(/<annotation[\s\S]*?<\/annotation>/g, '').replace(/<[^>]+>/g, '');
    console.log('  [OK ] ' + label + '  ink=' + JSON.stringify(h.replace(/−/g, '-').slice(0, 60)));
    return true;
  } catch (e) { console.log('  [ERR] ' + label + '  ' + e.message.split('\n')[0].slice(0, 78)); return false; }
}

// 每站：[站点前缀, 行号, 该跨内的定点替换 [old, new], 期望命中数]
const FIX = [
  ['D137', 667, [B + 'tfrac a_' + B + 'sigma', B + 'tfrac{r}{x}a_' + B + 'sigma'], 1],
  ['D204', 254, [B + 'mathfrm_B', B + 'mathfrak m_B'], 1],
  ['D235', 383, ['^^{-' + B + 'gamma}', '^{-' + B + 'gamma}'], 1],
  ['D260', 246, ['cx)_#', 'cx)_' + B + '#'], 1],
  ['D262', 502, ['S^^*f', 'S^*f'], 1],
  ['D307', 112, [B + 'mathfrm_x', B + 'mathfrak m_x'], 1],
  ['D523', 178, [B + 'mathbf C^^r', B + 'mathbf C^r'], 1],
  ['D61-', 983, ['(6r/c)^^{3/2}', '(6r/c)^{3/2}'], 1],
  ['D61-', 1048, ['(6r/c)^^{3/2}', '(6r/c)^{3/2}'], 1],
  ['D619', 184, ['(p_U)__*', '(p_U)_*'], 1],
  ['D772', 322, ['U(v)__1', 'U(v)_1'], 1],
  ['D772', 1050, ['U(v)__1', 'U(v)_1'], 1],
];

const rows = fs.readFileSync('_work/dollarmath_sites17.jsonl', 'utf8')
  .split('\n').filter(s => s.trim()).map(s => JSON.parse(s));

console.log('--- 诊断：单下标紧跟控制字是否合法');
render('a_' + B + 'sigma 裸形（素材 :99 原句）', 'f_' + B + 'sigma(z)=m_0x(z)+a_' + B + 'sigma r(z)', 0);
console.log('--- 诊断：Lean 推前下标三种形');
render('裸 _#', 'A_#' + B + 'mu', 0);
render('house 形 _' + B + '#', 'A_' + B + '#' + B + 'mu', 0);
render('带组 _{' + B + '#}', 'A_{' + B + '#}' + B + 'mu', 0);

console.log('--- 12 站：修前（逐字取自台账）→ 修法');
let miss = 0;
for (const [cid, line, [old, neu], exp] of FIX) {
  const r = rows.find(x => x.file.startsWith(cid) && x.line === line);
  if (!r) { console.log('[NO-ROW] ' + cid + ':' + line); miss++; continue; }
  const hits = r.body.split(old).length - 1;
  console.log('\n=== ' + cid + ':' + line + '  kind=' + r.kind + '  跨内命中=' + hits + '／期望=' + exp);
  console.log('  body=' + JSON.stringify(r.body));
  if (hits !== exp) { console.log('  !! 命中数不符，跳过'); miss++; continue; }
  render('修前', r.body, r.kind === 'DISPLAY');
  render('修法', r.body.split(old).join(neu), r.kind === 'DISPLAY');
}
console.log('\n无台账行／命中不符 = ' + miss);
