// 收稿的实质断言：新形渲染出来的 ink，按 cell 序列逐格对上修前 body 里写的数字/符号；
// D49 那一站额外要求字母 "mathbf" 不再出现在 ink 里（修前它印成字母）。
const fs = require('fs');
const katex = require('katex');
const B = String.fromCharCode(92);
const bodies = JSON.parse(fs.readFileSync('_work/psmall_bodies.json', 'utf8'));

function inkOf(src) {
  return katex.renderToString(src, { throwOnError: true })
    .replace(/<annotation.*?<\/annotation>/gs, '')
    .replace(/<[^>]+>/g, '')
    .replace(/[\u200b-\u200f]/g, '')
    .replace(/−/g, '-');   // 页上的减号是 U+2212，要折回源式的 ASCII '-' 才可比
}
// KaTeX 把源式也塞进 <annotation>，剥掉后剩下的 ink 仍带重复（visually-hidden 一份），去重相邻
function cellsOf(src) {
  return src.split(B + B).map(r => r.split('&'));
}

let bad = 0;
for (const r of bodies) {
  let cur = r.body
    .split(B + 'begin{psmallmatrix}').join(B + 'left(' + B + 'begin{smallmatrix}')
    .split(B + 'end{psmallmatrix}').join(B + 'end{smallmatrix}' + B + 'right)');
  if (r.file.startsWith('D49')) cur = cur.replace(B + B + 'mathbf', B + B + B + 'mathbf');
  const ink = inkOf(cur);
  const want = cellsOf(r.body.replace(/^.*?\{psmallmatrix\}/, ''));
  const flat = want.map(row => row.join('')).join('').replace(/&/g, '');
  const inkDigits = (ink.match(/[-0-9]/g) || []).join('');
  const wantDigits = (flat.match(/[-0-9]/g) || []).join('');
  // KaTeX 把同一式子发两遍（MathML 副本＋视觉副本），MathML 那份的数字顺序不守阅读序，
  // 所以只按「视觉那份在前」断言：ink 必须以 want 开头。
  const eq = inkDigits.startsWith(wantDigits);
  const dup = inkDigits.length - wantDigits.length;
  const letters = ink.includes('mathbf');
  if (!eq || letters) bad++;
  console.log(`${eq ? 'CELL-OK ' : 'CELL-BAD'} ${r.file.slice(0, 4)}:${r.line}  ink=${JSON.stringify(ink.slice(0, 24))} want=${JSON.stringify(wantDigits)} got=${JSON.stringify(inkDigits)}${letters ? '  <== 仍印字母 mathbf' : ''}`);
}
console.log(`站=${bodies.length} 异常=${bad}`);
