// _work/dm_final.js -- READ-ONLY: joins the 105 shipped-gauge dollar-family rows with the
// corrected-gauge reading, the hunter ops and the semantic probes, and issues one verdict
// per row. Writes _work/dm_rows.json (machine readable) + _work/dm_rows.txt (review).
const fs = require('fs');
const path = require('path');
const L = require('./dm_lib.js');
const D = L.D, BT = L.BT;
const BS = String.fromCharCode(92);
const WORK = 'E:' + BS + BS + 'math/_work';
const CJK = /[\u3000-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uff00-\uffef]/;
const FORBID = ['D95','D93','D452','D24','D25','D26','D28','D29','D30','D32','D34','D36',
  'D364','D41','D44','D47','D50','D65','D68'];
const isFam = (r) => (r.errClass || '').indexOf("'" + D + "' in math mode") >= 0;
const read = (f) => fs.readFileSync(path.join(WORK, f), 'utf8').split('\n').filter((x) => x.trim()).map((x) => JSON.parse(x));
const count = (a) => a.length;

const sSQ = read('dm_sites_ss.jsonl');            // shipped mask + shipped digit quirk  (== shipped gauge)
const sSP = read('dm_sites_shipped_plain.jsonl'); // shipped mask + plain digit rule
const cQP = read('dm_sites_corrected_quirk.jsonl');
const cPL = read('dm_sites_corrected_plain.jsonl');
const key = (r) => r.file + '|' + r.line + '|' + r.kind + '|' + r.body;
const setOf = (arr) => new Set(arr.filter(isFam).map(key));
const KSP = setOf(sSP), KCQ = setOf(cQP), KCP = setOf(cPL);
const hunt = JSON.parse(fs.readFileSync(path.join(WORK, 'dm_hunt.json'), 'utf8'));
const huntByFile = {}; for (const h of hunt) huntByFile[h.file] = h;

const fShipped = sSQ.filter(isFam);
const rows = [];
const stats = {};
const bump = (s) => { stats[s] = (stats[s] || 0) + 1; };
const norm = (x) => x.replace(/[\s]+/g, '');

const cache = {};
function load(f) {
  if (!cache[f]) {
    const text = fs.readFileSync(path.join(L.ROOT, f), 'utf8');
    const cur = L.corrected(text);
    const sites = L.spans(cur, { digitQuirk: false }).filter((s) => s.interior > 0 &&
      s.kind !== 'IUNCLOSED' && s.kind !== 'DUNCLOSED');
    cache[f] = { text, cur, bytes: Buffer.byteLength(text, 'utf8'),
      st: fs.statSync(path.join(L.ROOT, f)), sites, lines: text.split('\n') };
  }
  return cache[f];
}
const newSites = [];
{
  const seen = {};
  for (const r of sSQ.filter(isFam)) seen[r.file + '|' + r.line] = (seen[r.file + '|' + r.line] || 0) + 1;
  for (const f of Object.keys(cache)) {}
}
function spanEdge(m, pos) { return L.spans(m, { digitQuirk: false }).find((s) => s.a === pos || s.b === pos) || null; }

for (const r of fShipped) {
  const note = r.file.split('-')[0];
  const C = load(r.file);
  const row = {
    file: r.file, note, line: r.line, kind: r.kind, shippedBody: r.body, errClass: r.errClass,
    forbidden: FORBID.indexOf(note) >= 0,
  };
  // a shipped row is REAL iff a corrected-gauge site on the same line carries the same
  // body once whitespace is normalised (the shipped fence mask loses line lengths)
  const match = C.sites.filter((s) => L.lineOf(C.text, s.a) === r.line &&
    norm(L.bodyOf(C.cur, s)) === norm(r.body));
  const inCorr = match.length > 0;
  row.inCorrected = inCorr;
  if (!inCorr) {
    row.verdict = '假阳';
    const inShippedPlain = sSP.filter(isFam).some((x) => x.file === r.file && x.line === r.line && norm(x.body) === norm(r.body));
    row.why = inShippedPlain
      ? 'GAUGE-BUG(遮罩): shipped 的 fenceMask 只清单行反引号 span、且不认 `\\$` 与跨单换行的行内代码，代码/围栏素材里的 $ 泄漏进 span 体；修正遮罩后该行不再成位'
      : 'GAUGE-BUG(数字否决): katex_census.js 用 DIG.includes(masked[j+1]==="$" ? "" : …)，String#includes("") 恒真，于是紧跟另一枚 $ 的合法闭符被否决，相邻两个行内 span `$a$$b$` 被读成一枚含 $ 的 span；去掉该 quirk 后不再成位';
    row.legalForm = inShippedPlain ? '围栏/行内代码逐字素材（合法形态：代码里的 $ 不该进数学 span）'
      : '相邻行内 span 贴接（逐字 tex 引用里的 `$a$$b$`，合法形态）';
    const C2 = load(r.file);
    row.hostLine = (C2.lines[r.line - 1] || '').slice(0, 300);
  } else {
    const h = huntByFile[r.file];
    const ops = h ? h.ops.filter((o) => o.line === r.line) : [];
    const unl = h ? h.unresolved.filter((u) => u.line === r.line) : [];
    if (ops.length) {
      const o = ops[0];
      row.shape = o.shape;
      row.OLD = o.OLD; row.NEW = o.NEW; row.hitsHunt = o.hits;
      row.bytes_delta = o.bytes_delta;
      row.dollarLine = o.dollar_line_before + '->' + o.dollar_line_after;
      row.tickLine = o.tick_line_before + '->' + o.tick_line_after;
      row.gain = o.gain;
      row.hitsNow = C.text.split(o.OLD).length - 1;
      const pos = C.text.indexOf(o.OLD) + 24;
      row.pos = pos;
      row.lineNow = C.text.slice(0, pos).split('\n').length;
      row.ctxRaw = JSON.stringify(C.text.slice(Math.max(0, pos - 80), pos) + '\u25c2' + C.text[pos] + '\u25b8' + C.text.slice(pos + 1, pos + 81));
      row.inBlockquote = /^\s*>/.test(C.text.split('\n')[row.lineNow - 1] || '');
      row.inCodeOrFence = C.cur.s[pos] === ' ' && (C.text[pos] === D || C.text[pos] === BT);
      if (o.shape === 'space') {
        const cand = C.text.slice(0, pos) + C.text.slice(pos + 1);
        const mc = L.corrected(cand);
        const s = L.spans(mc, { digitQuirk: false }).find((x) => x.b === pos) || null;
        const body = s ? L.bodyOf(mc, s) : null;
        row.newSpanBody = body === null ? null : body.length > 120 ? body.slice(0, 120) + '\u2026' : body;
        const bad = !s || /\n/.test(body) || CJK.test(body) || /["\u201c\u201d]/.test(body) ||
          body.indexOf(BT) >= 0 || / {3,}/.test(body) || s.interior > 0;
        if (bad || row.inBlockquote || row.inCodeOrFence || row.hitsNow !== 1) {
          row.verdict = '需人工定夺';
          row.why = !s ? '删掉这枚空格后释放的闭符不与任何合法开符配对（span 结构仍坏）'
            : /\n/.test(body) ? '删空格后成形的 span 跨行'
            : / {3,}/.test(body) || body.indexOf(BT) >= 0 ? '删空格后成形的 span 体里含被遮罩清白的行内代码/围栏空隙，真缺陷在代码素材里'
            : /["\u201c\u201d]/.test(body) ? '删空格后成形的 span 体里含逐字引号 `"…"` 素材（改它=动原始素材）'
            : CJK.test(body) ? '删空格后成形的 span 体是整句中文（释放的闭符与前文某枚 $ 组 span；病根在前文那枚孤立 $）'
            : 'span 体仍含 $';
          if (row.inBlockquote) row.why += '；且改动落在 `>` 逐字引用行内';
          bump('manual-space-prose');
        } else {
          row.verdict = '可机械替换';
          row.why = '闭符前多一枚空格：删掉这枚空格后 span 体是纯数学 ' + JSON.stringify(row.newSpanBody) + '，即作者本意的式子';
          bump('mech');
        }
      } else {
        row.verdict = '需人工定夺';
        const edge = spanEdge(C.cur, pos);
        row.why = o.from === BT
          ? '把行内代码的闭反引号改成 $：该反引号' + (row.inCodeOrFence ? '正与同行的开反引号配对（文件路径/label 引用），改掉即毁掉一处正常代码 span' : '不在配对代码 span 内') + '；属奇偶补偿，spec 禁止'
          : (edge ? '被改的 $ 当前是合法 span 的' + (edge.a === pos ? '开符' : '闭符') + '（体=' +
              JSON.stringify(L.bodyOf(C.cur, edge).slice(0, 60)) + '），改成反引号即毁掉一处正常数学；属奇偶补偿，spec 禁止'
              : '被改的 $ 不是任何配对 span 的边界，改成反引号留下一枚孤立反引号（真缺陷是数学 span 丢了闭符，需补闭符而非改字符）');
        bump('manual-swap');
      }
    } else if (unl.length) {
      row.verdict = '需人工定夺';
      row.why = ' hunter 在本行窗口内找不到任何单字符改动（空格删除或 $↔反引号互换）能清位';
      row.unresBody = unl[0].body;
      bump('manual-unresolved');
      const pos = C.text.indexOf(unl[0].body.slice(0, 30));
      if (pos >= 0) {
        row.pos = pos;
        row.lineNow = C.text.slice(0, pos).split('\n').length;
        row.ctxRaw = JSON.stringify(C.text.slice(Math.max(0, pos - 80), pos) + '\u25c2' + C.text.slice(pos, pos + 81));
      }
    } else {
      row.verdict = '需人工定夺';
      row.why = '修正口径下仍成 span，但本行未被 hunter 记为可清位（同一行的多个 site 共用一条 op 之外的余位）';
      bump('manual-other');
    }
  }
  if (row.verdict === '假阳') bump('artifact');
  rows.push(row);
}

// sites the corrected gauge surfaces but the shipped gauge misses
{
  const shippedNorm = {};
  for (const r of fShipped) (shippedNorm[r.file + '|' + r.line] = shippedNorm[r.file + '|' + r.line] || []).push(norm(r.body));
  for (const r of cPL.filter(isFam)) {
    const list = shippedNorm[r.file + '|' + r.line] || [];
    if (list.indexOf(norm(r.body)) < 0) newSites.push(r);
  }
}

fs.writeFileSync(path.join(WORK, 'dm_rows.json'), JSON.stringify({ rows, newSites }, null, 1), 'utf8');
const o = [];
o.push('rows=' + rows.length + '  shipped_family=' + fShipped.length +
  '  corrected_family=' + count(cPL.filter(isFam)) +
  '  corrected_quirk=' + count(cQP.filter(isFam)) +
  '  shipped_plain=' + count(sSP.filter(isFam)) +
  '  artifacts(shipped-only)=' + rows.filter((x) => x.verdict === '假阳').length +
  '  corrected-only-new-sites=' + newSites.length);
o.push('verdicts: ' + JSON.stringify(stats));
const byFile = {};
for (const r of rows) (byFile[r.file] = byFile[r.file] || []).push(r);
for (const f of Object.keys(byFile).sort()) {
  o.push('');
  o.push('#### ' + f + '  [' + (byFile[f][0].forbidden ? '不可现在执行' : '可执行') + '] bytes=' + load(f).bytes + ' mtime=' + load(f).st.mtime.toISOString().slice(11, 19));
  for (const r of byFile[f]) {
    o.push('  L' + r.line + ' ' + r.kind + ' => ' + r.verdict + (r.shape ? ' [' + r.shape + ']' : '') + ' :: ' + r.why);
    if (r.OLD) o.push('     hits_now=' + r.hitsNow + ' bytes_delta=' + r.bytes_delta + ' $line=' + r.dollarLine + ' `line=' + r.tickLine + ' gain=' + r.gain);
    if (r.OLD) { o.push('     OLD ' + JSON.stringify(r.OLD)); o.push('     NEW ' + JSON.stringify(r.NEW)); }
    if (r.ctxRaw) o.push('     CTX ' + r.ctxRaw);
    if (r.hostLine) o.push('     HOST ' + JSON.stringify(r.hostLine));
  }
}
o.push('');
o.push('== 修正口径新暴露、shipped 口径漏记的 family 位 (' + newSites.length + ')');
for (const r of newSites)
  o.push('   ' + r.file.split('-')[0] + ' L' + r.line + ' ' + r.kind + ' body=' + JSON.stringify(r.body.slice(0, 110)));
fs.writeFileSync(path.join(WORK, 'dm_rows.txt'), o.join('\n') + '\n', 'utf8');try { process.stdout.reconfigure({ encoding: 'utf8' }); } catch (e) {}
process.stdout.write(o.slice(0, 2).join('\n') + '\n');
