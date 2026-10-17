// 字母级融合体普查（全库口径，不依赖 katex_census 的拒绝跨度）：
// 对每篇笔记「剥掉围栏与行内代码、只留 $…$ 数学跨度」的正文，取每一枚控制字，
// 若本名 KaTeX 不认、而某个长度 >=2 的真前缀 KaTeX 认得，就记为「命令名＋字母」融合体。
// 只读不落盘笔记，产出 _work/fuse_scan.json 与 _work/fuse_scan.txt。
// 用法：node fuse_scan.js [--show N]
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const B = String.fromCharCode(92);
const ROOT = 'E:' + B + B + 'math';
const WORK = path.join(ROOT, '_work');
const NOTES = '\u7814\u7a76\u7b14\u8bb0';

const memo = {};
function undefinedByItself(src, tok) {
  const key = src + '|' + tok;
  if (key in memo) return memo[key];
  let r = false;
  try { katex.renderToString(src); r = false; } catch (e) {
    const m = String(e.message);
    r = m.indexOf('Undefined control sequence') >= 0 && m.indexOf(tok) >= 0;
  }
  memo[key] = r;
  return r;
}

// 剥围栏＋行内代码，再取同一行内的 $…$ 跨度；奇数 $ 的行留给 mathspan 腿，这里不判。
function mathTexts(lines) {
  const out = [];
  let infence = false;
  lines.forEach(function (l, i) {
    if (l.trim().indexOf('```') === 0) { infence = !infence; return; }
    if (infence) return;
    let clean = '';
    const parts = l.split('`');
    for (let k = 0; k < parts.length; k += 2) clean += parts[k];
    if ((clean.split('$').length - 1) % 2 === 1) return;
    const re = /\$\$([^$]+)\$\$|\$([^$]+)\$/g;
    let m;
    while ((m = re.exec(clean))) out.push({ line: i + 1, text: m[1] || m[2] });
  });
  return out;
}

const files = fs.readdirSync(path.join(ROOT, NOTES)).filter(function (f) {
  return f.charAt(0) === 'D' && f.slice(-3) === '.md';
}).sort();
const cand = {};
let spans = 0, words = 0;
for (const f of files) {
  const key = f.split('-')[0];
  const lines = fs.readFileSync(path.join(ROOT, NOTES, f), 'utf8').split('\n');
  for (const sp of mathTexts(lines)) {
    spans++;
    const re = /\\([a-zA-Z]+)/g;
    let m;
    while ((m = re.exec(sp.text))) {
      const name = m[1];
      if (name.length < 2) continue;
      words++;
      const tok = B + name;
      if (!undefinedByItself(tok, tok)) continue;
      let hit = null;
      for (let L = name.length - 1; L >= 2; L--) {
        const p = B + name.slice(0, L);
        if (!undefinedByItself(p, p)) { hit = [p, name.slice(L)]; break; }
      }
      if (!hit) continue;
      const c = cand[tok] || (cand[tok] = { tok: tok, occ: 0, prefix: hit[0], tail: hit[1], notes: {}, ex: [] });
      c.occ++;
      c.notes[key] = (c.notes[key] || 0) + 1;
      if (c.ex.length < 3) c.ex.push(key + ':' + sp.line + ' ' + sp.text.slice(Math.max(0, m.index - 30), m.index + 30));
    }
  }
}
const rows = Object.keys(cand).map(function (k) { return cand[k]; });
rows.sort(function (a, b) { return b.occ - a.occ; });
const noteSet = {};
rows.forEach(function (r) { Object.keys(r.notes).forEach(function (n) { noteSet[n] = 1; }); });
const out = [];
out.push('files=' + files.length + ' math_spans=' + spans + ' control_words=' + words +
  ' fused_tokens=' + rows.length + ' fused_occ=' + rows.reduce(function (a, r) { return a + r.occ; }, 0) +
  ' notes=' + Object.keys(noteSet).length);
const show = process.argv.indexOf('--show') >= 0 ? Number(process.argv[process.argv.indexOf('--show') + 1] || 40) : 0;
for (let i = 0; i < Math.min(show, rows.length); i++) {
  const r = rows[i];
  out.push(r.tok + ' x' + r.occ + ' = ' + r.prefix + ' + ' + r.tail + '  notes=' + Object.keys(r.notes).length);
  out.push('   ' + r.ex.join('  ||  ').replace(/[^\x20-\x7e\u4e00-\u9fff]/g, '').slice(0, 260));
}
fs.writeFileSync(path.join(WORK, 'fuse_scan.txt'), out.join('\n'));
fs.writeFileSync(path.join(WORK, 'fuse_scan.json'), JSON.stringify(rows.map(function (r) {
  return { tok: r.tok, occ: r.occ, prefix: r.prefix, tail: r.tail, notes: r.notes };
}), null, 1));
console.log(out[0] + ' -> _work/fuse_scan.txt');
