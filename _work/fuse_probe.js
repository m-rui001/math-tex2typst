// 控制字融合判形：KaTeX 拒绝的每一个控制字，试它的所有真前缀——
// 只要某个前缀 KaTeX 认得，这个 token 就是「命令名＋字母」的融合体（KaTeX 会把命令名整枚印成字母）。
// 读数来源 _work/katexundef.json（katex_census.js 落的，键名自带反斜杠）。
// 用法：node fuse_probe.js [--show N]
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const B = String.fromCharCode(92);
const WORK = path.join('E:' + B + B + 'math', '_work');

const J = JSON.parse(fs.readFileSync(path.join(WORK, 'katexundef.json'), 'utf8'));
const undef = J.undef;

function undefinedByItself(src, tok) {
  // 只有报错逐字点名这枚控制字，才算「KaTeX 不认识它」；缺参数、缺定界符都说明命令本体存在。
  try { katex.renderToString(src); return false; } catch (e) {
    const m = String(e.message);
    return m.indexOf('Undefined control sequence') >= 0 && m.indexOf(tok) >= 0;
  }
}

const rows = [];
let fusedOcc = 0, plainOcc = 0;
const tailHist = {};
for (const entry of Object.entries(undef)) {
  const tok = entry[0];            // 形如 \dd
  const count = entry[1];
  const name = tok.charAt(0) === B ? tok.slice(1) : tok;
  let hit = null;
  for (let L = name.length - 1; L >= 2; L--) {
    // 前缀至少两个字母：\r \c \l \s 这些重音单字母命令会把所有长宏都判成融合体。
    const p = B + name.slice(0, L);
    if (!undefinedByItself(p, p)) { hit = [p, name.slice(L)]; break; }
  }
  if (hit) {
    const k = 'tail' + hit[1].length;
    tailHist[k] = (tailHist[k] || 0) + count;
    fusedOcc += count;
    rows.push([tok, count, hit[0], hit[1]]);
  } else {
    plainOcc += count;
  }
}
rows.sort((a, b) => b[1] - a[1]);
const shown = process.argv.indexOf('--show') >= 0 ?
  Number(process.argv[process.argv.indexOf('--show') + 1] || 40) : 0;
const fusedSet = new Set(rows.map((r) => r[0]));
const lines = [];
lines.push('distinct=' + Object.keys(undef).length + ' fused_tokens=' + rows.length +
  ' fused_occ=' + fusedOcc + ' plain_occ=' + plainOcc + ' refused_spans=' + J.refused);
lines.push('tail_hist=' + JSON.stringify(tailHist));
for (let i = 0; i < Math.min(shown, rows.length); i++) {
  lines.push('  ' + rows[i][0] + ' x' + rows[i][1] + '  = ' + rows[i][2] + ' + ' + rows[i][3]);
}
const rest = [];
for (const [tok, count] of Object.entries(undef)) {
  if (!fusedSet.has(tok)) rest.push(tok + ' x' + count);
}
lines.push('--- not fused（本名没人认：素材宏或单字母简写）: ' + rest.length);
lines.push(rest.join(' '));
fs.writeFileSync(path.join(WORK, 'fuse_out.txt'), lines.join('\n'));
fs.writeFileSync(path.join(WORK, 'fuse_tokens.json'), JSON.stringify(
  rows.map((r) => ({ tok: r[0], undef: undef[r[0]], prefix: r[2], tail: r[3] })), null, 1));
console.log('fused_tokens=' + rows.length + ' fused_occ=' + fusedOcc + ' -> _work/fuse_out.txt');
