// label_bs_probe.js — 尺：数「素材标签被写成控制字」这一族，并用该篇素材的 \label 集自证。
//
// 形：整枚数学跨度就是 $ \<letters>[:{]<tail> $ 或 $ \<letters>{<tail>} $（中间无空格）。
// 标签名不是宏；全库引标签的 house 形是代码跨度 `lem:usable`（1944 行在用），反斜杠形只有这一族。
//
// 为什么必须有第二把尺：拒渲尺（_work/dollarmath_census2.js）的可见性取决于那个名字在不在
// 语料宏表 _work/katex_macros.json。`\lem` 不在表里，KaTeX 报 Undefined control sequence，
// 看得见；`\tree`／`\dec`／`\prop` 在表里（被收成 \operatorname{tree} 之类），同一形只是
// 发成直立乱码，不拒渲——所以这一族在 census 里一半可见一半隐身。
//
// 分档（凭据＝该篇素材 preprints/<dir> 里的 \label{...} 全集）：
//   DEFECT  素材里真有这个标签        → 归位成代码跨度，标签字面一个不删
//   NEAR    素材里有同前缀的标签集，但这一枚名字对不上 → 逐行 eyeball，不发明
//   (其余)  前缀不是该篇的任何计数器  → 合法数学（例如 $\rho:1$ 是比例记法），不报
// 只读，不改盘。
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const PRE = path.join('E:' + B + B + 'math', 'preprints');
const WORK = path.join('E:' + B + B + 'math', '_work');

const SPAN = /\$\\([a-zA-Z]{2,14})([:{])([A-Za-z0-9_.\-]{1,40})\}?\$/g;
const ARGS = process.argv.slice(2);

const TABLE = JSON.parse(fs.readFileSync(path.join(WORK, 'preamble_tables.json'), 'utf8'));
const cache = new Map();
function material(id) {
  if (cache.has(id)) return cache.get(id);
  const labels = new Set(), prefixes = new Set();
  const e = TABLE[id];
  if (e && e.dir) {
    const walk = (d) => {
      let es;
      try { es = fs.readdirSync(d, { withFileTypes: true }); } catch (err) { return; }
      for (const x of es) {
        const p = path.join(d, x.name);
        if (x.isDirectory()) { if (x.name !== 'typst') walk(p); continue; }
        if (!/\.tex$/.test(x.name)) continue;
        const t = fs.readFileSync(p, 'utf8');
        let m;
        const re = /\\label\{([^}]+)\}/g;
        while ((m = re.exec(t))) {
          labels.add(m[1]);
          const c = m[1].indexOf(':');
          if (c > 0) prefixes.add(m[1].slice(0, c));
        }
      }
    };
    walk(path.join(PRE, e.dir));
  }
  const r = { labels, prefixes };
  cache.set(id, r);
  return r;
}

const rows = [];
function scan(id, lineText, lineNo, sink) {
  let m;
  SPAN.lastIndex = 0;
  while ((m = SPAN.exec(lineText))) {
    const name = m[1], tail = m[3];
    const mat = material(id);
    if (!mat.prefixes.has(name)) continue;               // 不是该篇的计数器前缀
    const lab = name + ':' + tail;
    sink.push({ file: id, line: lineNo, hit: m[0], label: lab, tier: mat.labels.has(lab) ? 'DEFECT' : 'NEAR' });
  }
}

for (const f of fs.readdirSync(ROOT).filter((x) => /^D.*\.md$/.test(x)).sort()) {
  const id = f.slice(0, f.indexOf('-'));
  fs.readFileSync(path.join(ROOT, f), 'utf8').split('\n').forEach((L, i) => scan(id, L, i + 1, rows));
}

if (ARGS.includes('--selftest')) {
  // 死尺检查：把修前那一形喂回同一条匹配路径，必须判成 DEFECT；顺带报凭据装载量。
  for (const id of ['D139', 'D310', 'D119', 'D317']) {
    const mat = material(id);
    const probe = [];
    scan(id, '于是 $\\lem:usable$ 与 $\\tree:spine-law$ 与 $\\dec:local_lists$ 的假设', 0, probe);
    const hit = probe.filter((r) => r.tier === 'DEFECT').map((r) => r.label);
    console.log('SELFTEST', id, '素材标签', mat.labels.size, '前缀', [...mat.prefixes].slice(0, 8).join(','),
      '| 喂回的形判成 DEFECT 的：', hit.join(' '));
  }
}
const def = rows.filter((r) => r.tier === 'DEFECT'), near = rows.filter((r) => r.tier === 'NEAR');
console.log('--- DEFECT（素材真有这枚标签，该归位代码跨度）---');
def.forEach((r) => console.log(r.file, String(r.line).padStart(4), r.hit));
console.log('--- NEAR（同前缀计数器、标签名对不上）---');
near.forEach((r) => console.log(r.file, String(r.line).padStart(4), r.hit, 'vs 素材前缀', r.label.split(':')[0]));
console.log('DEFECT', def.length, '篇', new Set(def.map((r) => r.file)).size, '| NEAR', near.length);
fs.writeFileSync(path.join(WORK, 'label_bs_sites.json'), JSON.stringify(rows, null, 1));
