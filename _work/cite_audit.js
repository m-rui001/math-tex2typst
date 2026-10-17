// Read-only audit of the `file.tex:NN` / `file.tex:NN-MM` position strings that the
// notes publish. For each note the material directory comes from preamble_tables.json,
// the build tree of that directory gives the real per-file line counts, and a citation
// is refused when the named file is not in that tree or when a cited line is past its end.
// A basename that exists in some other preprint directory is tagged other-dir, because
// there the writer is quoting a neighbouring paper rather than inventing a number.
const fs = require('fs');
const path = require('path');

const B = String.fromCharCode(92);
const NOTES = path.join('E:' + B + B + 'math', '研究笔记');
const PRE = path.join('E:' + B + B + 'math', 'preprints');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
// 三篇笔记的素材树不在 preprints/ 的常规归属里：D258/D259 的目录 2026-10-09 被移到
// _work/withdrawn-2026-10-09/preprints/，D113 与 D487 共用同一篇（表里只记给 D487）。
// 不补这三条，扫描只认 preprints/ 的检查器会把它们的 423 处引用全读成 FABRICATED。
const WD = path.join('E:' + B + B + 'math', '_work', 'withdrawn-2026-10-09', 'preprints');
const OVERRIDE = {
  D113: { root: PRE, dir: 'Nonuniqueness-for-Bounded-Measurable-Scalar-Conductivities-in-Three-Dimensions-September-23-2026' },
  D258: { root: WD, dir: 'Algebraicity-of-Kuga-Satake-Correspondences-for-K3-Surfaces-October-3-2026' },
  D259: { root: WD, dir: 'Algebraicity-of-Weil-classes-on-split-abelian-eightfolds-September-18-2026' },
};

// The writers are told to cite the paper's own build tree; the prelude/bibliography
// files sit outside it and are legitimately cited by path-less name only.
const CITE = /([A-Za-z0-9_][A-Za-z0-9_.+-]*\.(?:tex|bbl|sty|cls|bib)):(\d+)(?:\s*(?:-{1,2}|[\u2013\u2014])\s*(\d+))?/g;

const treeCache = new Map();
function treeOf(dir, root) {
  const ck = (root || PRE) + '|' + dir;
  if (treeCache.has(ck)) return treeCache.get(ck);
  const map = new Map();
  root = path.join(root || PRE, dir);
  (function walk(p, rel) {
    let st;
    try {
      st = fs.statSync(p);
    } catch (e) {
      return;
    }
    if (st.isDirectory()) {
      for (const f of fs.readdirSync(p)) walk(path.join(p, f), rel + '/' + f);
      return;
    }
    if (!/\.(tex|bbl|sty|cls|bib)$/.test(p)) return;
    // 行号口径＝split 的段数（文件以换行收尾时比 wc -l 大一）。写手在 Read 面板上
    // 看到的就是这一段空行并会引它（D03 引 introduction.tex:216--228，实测
    // len(split)=228／wc-l=227），改成内容行数会把这类末行引用全判成越界（187 处假账）。
    const n = fs.readFileSync(p, 'latin1').split('\n').length;
    const base = path.basename(p);
    if (!map.has(base)) map.set(base, []);
    map.get(base).push({ rel: rel, lines: n });
  })(root, '');
  treeCache.set(ck, map);
  return map;
}

const globalIndex = new Map();for (const dir of fs.readdirSync(PRE)) {
  for (const [base, hits] of treeOf(dir)) {
    if (!globalIndex.has(base)) globalIndex.set(base, []);
    for (const h of hits) {
      if (!globalIndex.get(base).some((e) => e.dir === dir)) {
        globalIndex.get(base).push({ dir: dir, lines: h.lines });
      }
    }
  }
}

let files = 0, cites = 0, miss = 0, oob = 0, other = 0, nolimit = 0, okc = 0;
const rows = [];
for (const f of fs.readdirSync(NOTES).filter((x) => /^D.*\.md$/.test(x)).sort()) {
  const key = (f.match(/^D\d+(?=-)/) || [''])[0];
  const e = OVERRIDE[key] || TBL[key];
  const text = fs.readFileSync(path.join(NOTES, f), 'utf8');
  let hits = 0, bad = 0;
  for (const m of text.matchAll(CITE)) {
    cites++;
    hits++;
    const base = m[1], lo = +m[2], hi = m[3] ? +m[3] : lo;
    if (!e || !e.dir) { nolimit++; rows.push([key, m[0], 'no-dir']); bad++; continue; }
    const t = treeOf(e.dir, e.root);
    const own = t.get(base);
    if (own) {
      const mx = Math.max.apply(null, own.map((x) => x.lines));
      if (hi > mx) { oob++; bad++; rows.push([key, m[0], 'oob>' + mx]); }
      else okc++;
      continue;
    }
    const g = globalIndex.get(base);
    if (g) { other++; bad++; rows.push([key, m[0], 'other-dir:' + g[0].dir]); }
    else { miss++; bad++; rows.push([key, m[0], 'absent']); }
  }
  files++;
  if (bad) console.log(key + ' cites=' + hits + ' bad=' + bad);
}
// Second pass: the abbreviated position strings, `05:191-192` or `02a:12-30` inside a code
// span, name a piece by its number prefix only. The CITE pass above cannot see them at all
// (it requires a dot-extension before the colon), so 6,914 of them were sitting outside the
// 171,931 audited cites. Each is resolved against THIS note's own material tree: exactly one
// basename whose stem starts with the prefix resolves; two or more is ambiguous, none is
// absent. Counters stay separate from the first pass so both baselines remain comparable.
// Resolution has three tiers, most permissive last, and each tier requires uniqueness:
// exact  —— the original rule, basename starts with the literal prefix;
// initial —— `01h` for `01-history.tex`, the number then the word's first letter;
// token  —— `04-estimates` for `04-densities-estimates.tex`, the prefix's dash-separated
//           words must appear, in order, among the basename's words after the number.
// A numeric prefix of three digits or more that no basename in this tree starts with is
// not a position string at all (D577's `708:100` and `684:011` are ledger cells), so it
// lands in a separate noncite bucket instead of inflating the absent count.
const ABBR = /`(\d{1,3}[A-Za-z\-]*):(\d+)(?:(?:-{1,2}|[\u2013\u2014])(\d+))?/g;
const words = (s) => s.split(/[^A-Za-z0-9]+/).filter(Boolean);
function resolveAbbr(pre, bases) {
  const rx = new RegExp('^' + pre.replace(/[.*+?^${}()|[\]\\]/g, B + '$&') + '(?:[.\\-_|]|$)');
  const exact = bases.filter((b) => rx.test(b));
  if (exact.length) return { cands: exact, tier: 'exact' };
  const mm = pre.match(/^(\d{1,3})([-_]?[A-Za-z][A-Za-z\-]*)?$/);
  if (!mm) return { cands: [], tier: 'none' };
  const num = mm[1], tail = (mm[2] || '').replace(/^[-_]+/, '').toLowerCase();
  let c = [];
  if (tail && /^[a-z]+$/.test(tail)) {
    const r2 = new RegExp('^' + num + '[._-]?' + tail[0]);
    c = bases.filter((b) => r2.test(b));
    if (c.length) return { cands: c, tier: 'initial' };
  }
  const toks = tail.split('-').filter(Boolean);
  if (toks.length) {
    c = bases.filter((b) => {
      const w = words(b.toLowerCase());
      if (w[0] !== num) return false;
      let i = 1;
      for (const t of toks) {
        while (i < w.length && w[i] !== t) i++;
        if (i >= w.length) return false;
        i++;
      }
      return true;
    });
    if (c.length) return { cands: c, tier: 'token' };
  }
  if (num.length >= 3 && !bases.some((b) => words(b.toLowerCase())[0] === num)) {
    return { cands: [], tier: 'noncite' };
  }
  return { cands: [], tier: 'none' };
}
let aN = 0, aOk = 0, aAmb = 0, aAbs = 0, aOob = 0, aNon = 0;
const arows = [];
for (const f of fs.readdirSync(NOTES).filter((x) => /^D.*\.md$/.test(x)).sort()) {
  const key = (f.match(/^D\d+(?=-)/) || [''])[0];
  const e = OVERRIDE[key] || TBL[key];
  const text = fs.readFileSync(path.join(NOTES, f), 'utf8');
  if (!e || !e.dir) continue;
  const t = treeOf(e.dir, e.root);
  const bases = Array.from(t.keys());
  for (const m of text.matchAll(ABBR)) {
    aN++;
    const pre = m[1], lo = +m[2], hi = m[3] ? +m[3] : lo;
    const r = resolveAbbr(pre, bases);
    if (r.tier === 'noncite') { aNon++; arows.push([key, m[0], 'abbrev-nonclick']); continue; }
    let cands = r.cands;
    if (!cands.length) { aAbs++; arows.push([key, m[0], 'abbrev-absent']); continue; }
    if (cands.length > 1) {
      // A cited line past a candidate's last line cannot have come from that candidate, so a
      // range that only one candidate is long enough to contain resolves the prefix without
      // any guess about which piece the writer meant.
      const cap = cands.filter((b) => Math.max.apply(null, t.get(b).map((x) => x.lines)) >= hi);
      if (cap.length === 1) { cands = cap; r.tier = 'capacity'; }
    }
    if (cands.length > 1) { aAmb++; arows.push([key, m[0], 'abbrev-ambig:' + cands.join(',') + '@' + r.tier]); continue; }
    const mx = Math.max.apply(null, t.get(cands[0]).map((x) => x.lines));
    if (hi > mx) { aOob++; arows.push([key, m[0], 'abbrev-oob>' + mx + ' (' + cands[0] + '@' + r.tier + ')']); }
    else aOk++;
  }
}
console.log('abbrev=' + aN + ' ok=' + aOk + ' absent=' + aAbs + ' ambiguous=' + aAmb + ' oob=' + aOob + ' noncite=' + aNon);
fs.writeFileSync('cite_abbrev_log.txt', arows.map((r) => r.join('\t')).join('\n'), 'utf8');

console.log('files=' + files + ' cites=' + cites + ' ok=' + okc +
  ' absent=' + miss + ' oob=' + oob + ' other-dir=' + other +
  ' notes-without-dir=' + nolimit);
fs.writeFileSync('cite_audit_log.txt',
  rows.map((r) => r.join('\t')).join('\n'), 'utf8');
