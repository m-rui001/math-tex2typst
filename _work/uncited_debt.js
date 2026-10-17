// 「浅版债」重测：每篇笔记的素材 build 树里，凡是没被这篇笔记覆盖的论文正文文件，
// 把它们的字节数加总。排最前的就是还没读过的料——派单续写的优先级。
// 覆盖判据：basename 出现在正文，或该文件的编号前缀以 `NN` 反引号形出现（按片简称）。
// --detail D68 D71 ：列出未覆盖文件（按字节降序，含字节与内容行数）。
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const ROOT = path.join('E:' + B + B + 'math');
const PRE = path.join(ROOT, 'preprints');
const NOTES = path.join(ROOT, '研究笔记');
const WD = path.join(ROOT, '_work', 'withdrawn-2026-10-09', 'preprints');
const TBL = JSON.parse(fs.readFileSync(path.join(ROOT, '_work', 'preamble_tables.json'), 'utf8'));
const OVERRIDE = {
  D113: { root: PRE, dir: 'Nonuniqueness-for-Bounded-Measurable-Scalar-Conductivities-in-Three-Dimensions-September-23-2026' },
  D258: { root: WD, dir: 'Algebraicity-of-Kuga-Satake-Correspondences-for-K3-Surfaces-October-3-2026' },
  D259: { root: WD, dir: 'Algebraicity-of-Weil-classes-on-split-abelian-eightfolds-September-18-2026' },
};
// 随稿打包的运行时与字体表不是论文正文。
const VENDORED = /^build\/(tex\/|figures\/|glyphtounicode|.*\/tex\/)/i;
const argv = process.argv.slice(2).filter((a) => a[0] !== '-');
const DETAIL = process.argv.includes('--detail');
const INFLIGHT = DETAIL ? [] : argv;
const ONLY = DETAIL && argv.length ? new Set(argv) : null;

const rows = [];
for (const f of fs.readdirSync(NOTES).filter((x) => /^D.*\.md$/.test(x)).sort()) {
  const key = (f.match(/^D\d+(?=-)/) || [''])[0];
  if (ONLY && !ONLY.has(key)) continue;
  const e = OVERRIDE[key] || TBL[key];
  if (!e || !e.dir) continue;
  const root = path.join(e.root || PRE, e.dir);
  if (!fs.existsSync(root)) continue;
  const text = fs.readFileSync(path.join(NOTES, f), 'utf8');
  let tot = 0, un = 0, unFiles = 0, all = 0;
  const list = [];
  const walk = (p) => {
    const st = fs.statSync(p);
    if (st.isDirectory()) { for (const g of fs.readdirSync(p)) walk(path.join(p, g)); return; }
    if (!/\.tex$/.test(p)) return;
    const rel0 = path.relative(root, p).replace(/\\/g, '/');
    if (VENDORED.test(rel0)) return;
    all++; tot += st.size;
    const base = path.basename(p);
    const num = (base.match(/^(\d+)/) || [])[1];
    if (text.indexOf(base) !== -1 || (num && text.indexOf('`' + num + '`') !== -1)) return;
    un += st.size; unFiles++;
    const raw = fs.readFileSync(p, 'latin1');
    const parts = raw.split('\n');
    list.push({ rel: rel0, sz: st.size, ln: parts.length - (parts[parts.length - 1] === '' ? 1 : 0) });
  };
  const bd = path.join(root, 'build');
  walk(fs.existsSync(bd) ? bd : root);
  if (DETAIL) {
    list.sort((a, b) => b.sz - a.sz);
    console.log('== ' + key + ' dir=' + e.dir + ' uncovered=' + un + 'B ' + unFiles + '/' + all);
    for (const x of list) console.log('   ' + x.rel + ' ' + x.sz + 'B ' + x.ln + 'L');
    continue;
  }
  rows.push({ key: key, un: un, unFiles: unFiles, tot: tot, all: all, pct: Math.round(100 * un / tot), name: f });
}
if (DETAIL) { console.log('detail done'); process.exit(0); }
rows.sort((a, b) => b.un - a.un);
let shown = 0;
for (const r of rows) {
  if (INFLIGHT.includes(r.key)) continue;
  console.log(r.key + ' uncovered=' + r.un + 'B files=' + r.unFiles + '/' + r.all + ' tree=' + r.tot + ' pct=' + r.pct + '% ' + r.name.slice(0, 40));
  if (++shown >= 14) break;
}
console.log('notes=' + rows.length + ' inflight-excluded=' + INFLIGHT.join(','));
