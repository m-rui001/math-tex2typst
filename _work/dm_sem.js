// _work/dm_sem.js -- READ-ONLY semantic probe for the 94 hunter ops.
// For every 'space' op it applies the deletion alone and reports the body of the span
// that the freed closer actually forms, so the shape can be cold-read.
// For every 'swap' op it checks whether the flipped character is currently an opener /
// closer of a well-formed span, or a backtick inside a matched code span -- i.e. whether
// the swap destroys working material instead of repairing a typo.
const fs = require('fs');
const path = require('path');
const L = require('./dm_lib.js');
const D = L.D, BT = L.BT;
const BS = String.fromCharCode(92);
const WORK = 'E:' + BS + BS + 'math/_work';
const CJK = /[\u3000-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uff00-\uffef]/;

const hunt = JSON.parse(fs.readFileSync(path.join(WORK, 'dm_hunt.json'), 'utf8'));
const out = [];
const p = (s) => out.push(s);
const tot = { space: 0, spaceClean: 0, spaceProse: 0, swap: 0, swapKillsSpan: 0, swapKillsCode: 0, swapOther: 0 };

for (const h of hunt) {
  const abs0 = path.join(L.ROOT, h.file);
  const cur = fs.readFileSync(abs0, 'utf8');
  if (!h.ops.length) continue;
  p('');
  p('#### ' + h.file);
  const m0 = L.corrected(cur);
  const sp0 = L.spans(m0, { digitQuirk: false });
  const isSpanEdge = (i) => sp0.find((s) => s.a === i || s.b === i) || null;
  for (const o of h.ops) {
    const k = cur.indexOf(o.OLD);
    if (k < 0) { p('  ?? OLD not found'); continue; }
    const pos = k + 24;
    if (o.shape === 'space') {
      tot.space++;
      const cand = cur.slice(0, pos) + cur.slice(pos + 1);
      const mc = L.corrected(cand);
      const sp = L.spans(mc, { digitQuirk: false });
      // the closer that the deleted space frees: position pos+1 in cur == pos in cand
      const s = sp.find((x) => x.b === pos && x.interior === 0);
      const s2 = sp.find((x) => x.b === pos);
      const use = s || s2 || null;
      let body = '', kind = 'n/a', newline = false, cjk = false, q = false, bt = false;
      if (use) {
        body = L.bodyOf(mc, use);
        kind = use.kind + (use.interior > 0 ? '/interior$=' + use.interior : '');
        newline = body.indexOf('\n') >= 0;
        cjk = CJK.test(body);
        q = /["\u201c\u201d]/.test(body);
        bt = body.indexOf(BT) >= 0;
      }
      const bad = !use || newline || cjk || q || bt || (use && use.interior > 0);
      if (!bad) { tot.spaceClean++; p('  SPACE L' + o.line + ' OK-SPAN kind=' + kind + ' len=' + body.length +
        ' body=' + JSON.stringify(body.length > 90 ? body.slice(0, 90) + '\u2026' : body)); }
      else {
        tot.spaceProse++;
        p('  SPACE L' + o.line + ' SUSPECT no_span=' + (!use) + ' newline=' + newline + ' cjk=' + cjk +
          ' quote=' + q + ' backtick=' + bt + ' interior=' + (use ? use.interior : '-') +
          ' body=' + JSON.stringify(body.length > 110 ? body.slice(0, 110) + '\u2026' : body));
      }
    } else {
      tot.swap++;
      const edge = isSpanEdge(pos);
      const insideCode = m0.s[pos] === ' ' && (cur[pos] === D || cur[pos] === BT);
      let verdict;
      if (o.from === BT) { verdict = insideCode ? 'KILLS-CODE-SPAN' : 'other'; if (insideCode) tot.swapKillsCode++; else tot.swapOther++; }
      else if (edge) { verdict = 'KILLS-MATH-SPAN(' + (edge.a === pos ? 'opener' : 'closer') + ' of ' + edge.kind +
        ' body=' + JSON.stringify(L.bodyOf(m0, edge).slice(0, 48)) + ')'; tot.swapKillsSpan++; }
      else { verdict = 'not-a-span-edge'; tot.swapOther++; }
      if (verdict === 'other') { tot.swapOther++; tot.swapKillsCode--; }
      p('  SWAP  L' + o.line + ' [' + o.from + ']->[' + o.to + '] ' + verdict);
    }
  }
}
p('');
p('== ' + JSON.stringify(tot));
const txt = out.join('\n') + '\n';
fs.writeFileSync(path.join(WORK, 'dm_sem.txt'), txt, 'utf8');
try { process.stdout.reconfigure({ encoding: 'utf8' }); } catch (e) {}
process.stdout.write(txt);
