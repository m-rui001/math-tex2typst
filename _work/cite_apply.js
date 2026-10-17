// 把裁定好的位置串按 offset 拼回笔记：只用 cite 正则认出的完整 token，不做子串替换。
// 用法：node cite_apply.js [--apply]
const fs = require('fs');
const path = require('path');
const CITE = /([A-Za-z0-9_][A-Za-z0-9_.+-]*\.(?:tex|bbl|sty|cls|bib)):(\d+)(?:\s*(-{1,2}|[\u2013\u2014])\s*(\d+))?/g;
const TSVS = ['_work/cite_adjudicated_A.tsv', '_work/cite_adjudicated_B.tsv', '_work/cite_adjudicated_C.tsv', '_work/cite_adjudicated_D.tsv'];
const INFLIGHT = ['D377'];
const ROOT = path.resolve(__dirname, '..');
const APPLY = process.argv.includes('--apply');
const ONLY = process.argv.slice(2).filter((a) => a[0] !== '-');
if (ONLY.length) { TSVS.length = 0; TSVS.push.apply(TSVS, ONLY); }

const TAB = String.fromCharCode(9);
let rows = [];
for (const rel of TSVS) {
  const p = path.join(ROOT, rel);
  if (!fs.existsSync(p)) continue;
  const lines = fs.readFileSync(p, 'utf8').split(/\r?\n/);
  for (let i = 1; i < lines.length; i++) {
    const l = lines[i];
    if (!l.trim() || l.trim().startsWith('#')) continue;
    const c = l.split(TAB);
    if (c.length < 5) { console.log('MALFORMED ' + rel + ':' + (i + 1) + ' ' + JSON.stringify(l)); continue; }
    rows.push({ note: c[0].trim(), cited: c[1].trim(), code: c[2].trim(), rep: c[3].trim(), ev: c[4] });
  }
}
const all = rows;
const skip = rows.filter((r) => r.rep === 'NONE' || INFLIGHT.includes(r.note));
// INSTRUMENT-FP 行给出「note:<行号>」——那是勘误登记里逐字引用的坏串，不许跟着改。
const excl = new Map();
for (const r of all) {
  if (r.code !== 'INSTRUMENT-FP') continue;
  const m = /note:(\d+)/.exec(r.ev);
  if (!m) { console.log('EXCL-NOLINE ' + r.note + ' ' + r.cited); continue; }
  const k = r.note + '\t' + r.cited;
  if (!excl.has(k)) excl.set(k, new Set());
  excl.get(k).add(parseInt(m[1], 10));
  console.log('EXCLUDE ' + r.note + ' ' + r.cited + ' @note:' + m[1]);
}
rows = rows.filter((r) => r.rep !== 'NONE' && !INFLIGHT.includes(r.note));
console.log('rows=' + rows.length + ' skipped=' + skip.length);

// 按 note 分组，检测同串多值冲突；冲突时取「数值区间包含 evidence 行号」的那个
function evLine(ev) {
  const m = /:(\d+)(?:\s*[-\u2013]\s*(\d+))?\s*\u2014/.exec(ev);
  return m ? parseInt(m[1], 10) : null;
}
function covers(rep, ln) {
  const m = /^.*:(\d+)(?:\s*[-\u2013]\s*(\d+))?$/.exec(rep);
  if (!m || ln === null) return false;
  const a = parseInt(m[1], 10), b = m[2] ? parseInt(m[2], 10) : a;
  return ln >= Math.min(a, b) && ln <= Math.max(a, b);
}
const byNote = new Map();
const conflicts = [];
for (const r of rows) {
  if (!byNote.has(r.note)) byNote.set(r.note, new Map());
  const m = byNote.get(r.note);
  const prev = m.get(r.cited);
  if (prev === undefined) { m.set(r.cited, { rep: r.rep, ev: r.ev }); continue; }
  if (prev.rep === r.rep) continue;
  conflicts.push(r.note + ' ' + r.cited + ' -> ' + prev.rep + ' | ' + r.rep);
  const ln = evLine(r.ev), ln0 = evLine(prev.ev);
  const pick = covers(r.rep, ln) && !covers(prev.rep, ln) ? r : (covers(prev.rep, ln0) && !covers(r.rep, ln) ? prev : null);
  if (pick) { m.set(r.cited, pick); console.log('  RESOLVED ' + r.note + ' ' + r.cited + ' -> ' + pick.rep); }
}
console.log('conflicts=' + conflicts.length);
for (const c of conflicts) console.log('  CONFLICT ' + c);
for (const [, m] of byNote) for (const [c, v] of m) m.set(c, v.rep);

let totalSites = 0, totalBytes = 0, files = 0, missed = [];
for (const [k, m] of [...byNote.entries()].sort()) {
  const files2 = fs.readdirSync(path.join(ROOT, '研究笔记')).filter((f) => f.startsWith(k + '-') && f.endsWith('.md'));
  if (files2.length !== 1) { console.log('BADGLOB ' + k + ' ' + files2.length); continue; }
  const fp = path.join(ROOT, '研究笔记', files2[0]);
  const raw = fs.readFileSync(fp, 'utf8');
  const toks = [];
  CITE.lastIndex = 0;
  let mm;
  while ((mm = CITE.exec(raw)) !== null) toks.push({ s: mm.index, e: mm.index + mm[0].length, t: mm[0] });
  const lineNo = (i) => (raw.slice(0, i).match(/\n/g) || []).length + 1;
  const hits = [];
  // 笔记里可能写成 186--189（双连字符），审计工具只读到 186，所以 TSV 的 key 是被截短的那串。
  // 三种认法：完整串命中 / 单横线归一化命中 / 退到 file:首行号 命中；末一种要求区间端点一致，否则炸。
  const parse = (s) => {
    const m = /^(.*?):(\d+)(?:\s*(-{1,2}|[\u2013\u2014])\s*(\d+))?$/.exec(s);
    return m ? { f: m[1], a: parseInt(m[2], 10), sep: m[3] || null, b: m[4] ? parseInt(m[4], 10) : null } : null;
  };
  for (const t of toks) {
    const nt = parse(t.t);
    let rep = m.get(t.t), mode = 'exact', mKey = t.t;
    if (rep === undefined && nt && nt.sep) {
      const norm = nt.f + ':' + nt.a + '-' + nt.b;
      if (m.has(norm)) { rep = m.get(norm); mode = 'dash'; mKey = norm; }
    }
    if (rep === undefined && nt) { rep = m.get(nt.f + ':' + nt.a); mode = 'trunc'; mKey = nt.f + ':' + nt.a; }
    if (rep === undefined) continue;
    let out = rep;
    if (nt && nt.sep) {
      const rp = parse(rep);
      if (!rp) { console.log('  ABORT-NOPARSE ' + k + ' ' + t.t + ' -> ' + rep); continue; }
      if (mode === 'trunc' && (rp.b === null || rp.a !== nt.a || rp.b !== nt.b)) {
        console.log('  ABORT-RANGE ' + k + ' line=' + (lineNo(t.s)) + ' note=' + t.t + ' rep=' + rep);
        continue;
      }
      if (rp.sep !== nt.sep) out = rp.f + ':' + rp.a + (rp.b !== null ? nt.sep + rp.b : '');
    }
    const e = excl.get(k + TAB + t.t);
    const tl = lineNo(t.s);
    if (e && e.has(tl)) { console.log('  KEPT-ERRATUM ' + k + ' line=' + tl + ' ' + t.t); continue; }
    hits.push({ i: t.s, j: t.e, from: t.t, to: out, line: tl, key: mKey, mode: mode });
  }
  const want = new Set(m.keys());
  const have = new Set(hits.map((h) => h.key));
  for (const w of want) if (!have.has(w)) missed.push(k + ' ' + w);
  if (!hits.length) continue;
  let out = '', last = 0, delta = 0;
  for (const h of hits) { out += raw.slice(last, h.i) + h.to; last = h.j; delta += Buffer.byteLength(h.to) - Buffer.byteLength(h.from); }
  out += raw.slice(last);
  const chk = [];
  if (out.split('\n').length !== raw.split('\n').length) chk.push('lines');
  if ((out.match(/\$/g) || []).length !== (raw.match(/\$/g) || []).length) chk.push('dollar');
  if ((out.match(/`/g) || []).length !== (raw.match(/`/g) || []).length) chk.push('backtick');
  if (out.indexOf('\r') !== -1) chk.push('CR');
  if (Buffer.byteLength(out) !== Buffer.byteLength(raw) + delta) chk.push('bytes');
  for (const h of hits) if (/\r|\n/.test(h.to)) chk.push('newline-in-replacement');
  const byCode = {};
  for (const h of hits) byCode[h.to] = 1;
  if (chk.length) { console.log('ABORT ' + k + ' ' + chk.join(',')); continue; }
  totalSites += hits.length; totalBytes += delta; files++;
  const modes = hits.filter((h) => h.mode !== 'exact').map((h) => h.mode + '@' + h.line);
  console.log(k + ' sites=' + hits.length + ' bytes=' + Buffer.byteLength(raw) + '->' + Buffer.byteLength(out) + ' +' + delta + (modes.length ? ' NONEXACT[' + modes.join(',') + ']' : '') + ' | ' + hits.map((h) => h.line + ':' + h.from + '=>' + h.to).join(' '));
  if (APPLY) {
    fs.writeFileSync(path.join(ROOT, '_work', '_work_backup_' + k + '.pre-citeapply.md'), raw);
    fs.writeFileSync(fp, out);
  }
}
console.log((APPLY ? 'APPLIED' : 'DRY') + ' files=' + files + ' sites=' + totalSites + ' bytes=+' + totalBytes);
console.log('notFoundInNote=' + missed.length);
for (const x of missed.slice(0, 40)) console.log('  MISS ' + x);
