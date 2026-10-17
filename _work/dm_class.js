// _work/dm_class.js -- READ-ONLY classifier for the "Can't use function '$' in math
// mode" family. Re-verifies every hunter op against the CURRENT bytes of the note and
// flags ops that land inside verbatim source material (blockquotes / "..." quotes /
// inline code / fences). Nothing is written under 研究笔记; output -> _work/dm_class.txt
const fs = require('fs');
const path = require('path');
const L = require('./dm_lib.js');
const D = L.D, BT = L.BT;
const BS = String.fromCharCode(92);
const WORK = 'E:' + BS + BS + 'math/_work';

function countOf(hay, needle) { return hay.split(needle).length - 1; }
function quoteRuns(lineTxt) {
  const runs = [];
  let open = -1;
  for (let i = 0; i < lineTxt.length; i++) {
    const c = lineTxt[i];
    if (c === '"' || c === String.fromCharCode(0xff02)) {
      if (open < 0) open = i; else { runs.push([open, i]); open = -1; }
    } else if (c === String.fromCharCode(0x201c)) open = i;
    else if (c === String.fromCharCode(0x201d)) { if (open >= 0) { runs.push([open, i]); open = -1; } }
  }
  if (open >= 0) runs.push([open, lineTxt.length]);
  return runs;
}

// shipped-gauge family rows per file
const sites = fs.readFileSync(path.join(WORK, 'katex_sites_now.jsonl'), 'utf8')
  .split('\n').filter((x) => x.trim()).map((x) => JSON.parse(x));
const famShipped = {};
for (const s of sites) if (/Can't use function '\$' in math mode/.test(s.errClass || ''))
  famShipped[s.file] = (famShipped[s.file] || 0) + 1;

const hunt = JSON.parse(fs.readFileSync(path.join(WORK, 'dm_hunt.json'), 'utf8'));
const out = [];
const p = (s) => out.push(s);
const tot = { ops: 0, space: 0, swap: 0, unresolved: 0, verbatim: 0, inCode: 0, changed: 0, hitsNotOne: 0, dollarLineSame: 0, ctx: 0 };

for (const h of hunt) {
  const abs = path.join(L.ROOT, h.file);
  const cur = fs.readFileSync(abs, 'utf8');
  const st = fs.statSync(abs);
  const lines = cur.split('\n');
  const bytesNow = Buffer.byteLength(cur, 'utf8');
  const mm = L.corrected(cur);
  const provLine = (li, col) => {
    let la = 0; for (let k = 0; k < li - 1; k++) la += lines[k].length + 1;
    return la + col;
  };
  p('');
  p('#### ' + h.file);
  p('  NOW bytes=' + bytesNow + ' AT-HUNT bytes=' + h.bytes_before + ' mtime=' +
    st.mtime.toISOString().slice(11, 19) + (bytesNow === h.bytes_before ? ' [SAME]' : ' [CHANGED-SINCE-HUNT]') +
    ' | family shipped=' + (famShipped[h.file] || 0) + ' corrected=' + h.fam_before +
    ' ->' + h.fam_after + ' after-ops | refused ' + h.refused_before + '->' + h.refused_after);
  if (bytesNow !== h.bytes_before) tot.changed++;
  for (const o of h.ops) {
    tot.ops++;
    if (o.shape === 'space') tot.space++; else tot.swap++;
    const hitsNow = countOf(cur, o.OLD);
    let flags = '', abs = -1, col = -1, realLine = o.line;
    const k = cur.indexOf(o.OLD);
    if (k >= 0) {
      abs = k + 24;
      realLine = cur.slice(0, abs).split('\n').length;
      col = abs - (cur.lastIndexOf('\n', abs - 1) + 1);
    } else col = -1;
    const curLine = lines[realLine - 1] || '';
    if (hitsNow !== 1) { tot.hitsNotOne++; flags += ' HITS-NOT-1(x' + hitsNow + ')'; }
    if (col >= 0) {
      if (realLine !== o.line) flags += ' LINE' + realLine;
      if (quoteRuns(curLine).some(([a, b]) => col >= a && col <= b)) { tot.verbatim++; flags += ' VERBATIM-QUOTE'; }
      if (/^\s*>/.test(curLine)) { tot.verbatim++; flags += ' BLOCKQUOTE'; }
      if (mm.s[abs] === ' ' && (cur[abs] === D || cur[abs] === BT)) { tot.inCode++; flags += ' INSIDE-CODE-OR-FENCE'; }
      tot.ctx++;
      p('    CTX ' + JSON.stringify(cur.slice(Math.max(0, abs - 60), abs) + '\u25c2' + cur[abs] + '\u25b8' + cur.slice(abs + 1, abs + 61)));
    } else { flags += ' OLD-NOT-FOUND-CURRENT'; }
    if (o.dollar_line_before === o.dollar_line_after) tot.dollarLineSame++;
    p('  OP L' + o.line + ' [' + o.from + ']->[' + o.to + '] shape=' + o.shape +
      ' hits_now=' + hitsNow + ' bytes_delta=' + o.bytes_delta +
      ' $line=' + o.dollar_line_before + '->' + o.dollar_line_after +
      ' `line=' + o.tick_line_before + '->' + o.tick_line_after + flags);
    p('    OLD ' + JSON.stringify(o.OLD));
    p('    NEW ' + JSON.stringify(o.NEW));
  }
  for (const u of h.unresolved) {
    tot.unresolved++;
    p('  NONE L' + u.line + ' ' + u.kind + ' body=' + JSON.stringify(u.body));
  }
  // replay every op once on the CURRENT bytes and re-measure under the corrected gauge
  if (h.ops.length) {
    let t = cur;
    let applied = 0;
    for (const o of h.ops) {
      if (t.indexOf(o.OLD) >= 0 && countOf(t, o.OLD) === 1) { t = t.replace(o.OLD, o.NEW); applied++; }
    }
    const mc = L.corrected(t);
    let famNow = 0, uncl = 0, sp = 0;
    for (const s of L.spans(mc, { digitQuirk: false })) {
      if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') { uncl++; continue; }
      sp++; if (s.interior > 0) famNow++;
    }
    p('  REPLAY applied=' + applied + '/' + h.ops.length + ' corrected_family=' + famNow +
      ' corrected_spans=' + sp + ' corrected_unclosed=' + uncl +
      ' bytes=' + bytesNow + '->' + Buffer.byteLength(t, 'utf8'));
  }
}
p('');
p('== totals ' + JSON.stringify(tot, null, 0));
const txt = out.join('\n') + '\n';
fs.writeFileSync(path.join(WORK, 'dm_class.txt'), txt, 'utf8');
try { process.stdout.reconfigure({ encoding: 'utf8' }); } catch (e) {}
process.stdout.write(txt);
