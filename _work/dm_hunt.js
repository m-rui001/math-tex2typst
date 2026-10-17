// _work/dm_hunt.js — READ-ONLY fix hunter for the "Can't use function '$' in math
// mode" family.
//
// For each note that the corrected gauge (_work/dollarmath_census2.js
// --mask=corrected --digit=plain) still refuses, hunt single-character swaps
// ('$' <-> '`') on the offending line that clear the site under the same grammar,
// then verify the whole edited file with KaTeX. Nothing is written back to
// 研究笔记: the edits live only in memory and in _work/dm_hunt.json (+ the edited
// copy under _work/dm_fixed/<note>).
//
// Usage from the project root:
//   node _work/dm_hunt.js                      // all notes with family sites
//   node _work/dm_hunt.js D95-xxx.md D134-...  // restrict to named notes
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const L = require('./dm_lib.js');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();
const D = L.D, BT = L.BT;
const WORK = 'E:' + String.fromCharCode(92) + String.fromCharCode(92) + 'math/_work';

const opts = { digitQuirk: false };

function measure(text) {
  const m = L.corrected(text);
  const sp = L.spans(m, opts);
  let fam = 0, uncl = 0, spansT = 0;
  const bodies = [];
  for (const s of sp) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') { uncl++; continue; }
    spansT++;
    if (s.interior > 0) { fam++; bodies.push({ kind: s.kind, a: s.a, b: s.b, body: L.bodyOf(m, s) }); }
  }
  return { fam, uncl, spansT, bodies, m };
}

function refused(text) {
  const m = L.corrected(text);
  let bad = 0;
  const classes = {};
  for (const s of L.spans(m, opts)) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') continue;
    const body = L.bodyOf(m, s);
    try {
      katex.renderToString(body, { throwOnError: true, strict: false, displayMode: s.kind === 'DISPLAY', macros: MACROS });
    } catch (e) {
      bad++;
      const c = String(e.message).replace(/at position.*/, '').slice(0, 58);
      classes[c] = (classes[c] || 0) + 1;
    }
  }
  return { bad, classes };
}

function lineIndex(text, off) { return text.slice(0, off).split('\n').length - 1; }
function lineRange(text, li) {
  const a = text.split('\n', li).join('\n').length + (li > 0 ? 1 : 0);
  let b = text.indexOf('\n', a);
  if (b < 0) b = text.length;
  return [a, b];
}

function hunt(file) {
  const text0 = fs.readFileSync(path.join(L.ROOT, file), 'utf8');
  let text = text0;
  let base = measure(text);
  const ops = [];
  const unresolved = [];
  let guard = 0;
  while (base.fam > 0 && guard++ < 24) {
    const site = base.bodies[0];
    const li = lineIndex(text, site.a);
    const [la, lb] = lineRange(text, li);
    const [la2, lb2] = lineRange(text, Math.min(li + 1, text.split('\n').length - 1));
    const win = [Math.max(0, la - 2), Math.min(text.length, lb2 + 2)];
    let best = null;
    const tryCand = (p, cand, shape, from, to) => {
      const mm = measure(cand);
      if (mm.fam < base.fam && mm.uncl <= base.uncl) {
        const gain = base.fam - mm.fam;
        if (!best || gain > best.gain || (gain === best.gain && shape < best.shape)) {
          best = { p, c: from, nc: to, gain, fam: mm.fam, cand, shape };
        }
      }
    };
    for (let p = win[0]; p < win[1]; p++) {
      const c = text[p];
      // shape 'swap': one character flipped between '$' and backtick
      if (c === D || c === BT) {
        const nc = c === D ? BT : D;
        tryCand(p, text.slice(0, p) + nc + text.slice(p + 1), 'swap', c, nc);
      }
      // shape 'space': a space right in front of a '$' deleted (the 闭符前多一枚空格
      // family -- the span cannot close, so it steals the next delimiter)
      if (c === D && text[p - 1] === ' ' && text[p - 2] !== ' ') {
        tryCand(p - 1, text.slice(0, p - 1) + text.slice(p), 'space', ' ', '');
      }
    }
    if (!best) {
      unresolved.push(site);
      // skip past this site: mark by removing it from consideration
      base.bodies.shift();
      if (base.bodies.length === 0) break;
      continue;
    }
    const li0 = lineIndex(text, best.p);
    const [l0a, l0b] = lineRange(text, li0);
    const lineTxt = text.slice(l0a, l0b);
    const shift = best.cand.length - text.length;
    const candLine = best.cand.slice(l0a, l0b + shift);
    ops.push({
      pos: best.p, old: best.c, neu: best.nc, shape: best.shape,
      line: li0 + 1,
      before: text.slice(Math.max(0, best.p - 40), best.p),
      after: text.slice(best.p + 1, best.p + 41),
      gain: best.gain, famAfter: best.fam,
      bytes_delta: Buffer.byteLength(best.cand, 'utf8') - Buffer.byteLength(text, 'utf8'),
      dollar_line_before: lineTxt.split(D).length - 1,
      dollar_line_after: candLine.split(D).length - 1,
      tick_line_before: lineTxt.split(BT).length - 1,
      tick_line_after: candLine.split(BT).length - 1,
    });
    text = best.cand;
    base = measure(text);
  }
  return { file, text0, text, ops, unresolved, fam0: measure(text0).fam, famLeft: base.fam };
}

function main() {
  const argFiles = process.argv.slice(2).filter((a) => !a.startsWith('--'));
  let files = argFiles;
  if (!files.length) {
    const j = JSON.parse(fs.readFileSync(path.join(WORK, 'dm_c_corrected_plain.json'), 'utf8'));
    files = Object.keys(j.dollarFamilyPerFile);
  }
  const out = [];
  for (const f of files) {
    const r = hunt(f);
    const v0 = refused(r.text0);
    const v1 = r.ops.length ? refused(r.text) : v0;
    const uniq = r.ops.map((o) => {
      const OLD = (o.before.slice(-24) + o.old + o.after.slice(0, 24));
      const count = r.text0.split(OLD).length - 1;
      return { OLD, NEW: o.before.slice(-24) + o.neu + o.after.slice(0, 24), count };
    });
    out.push({
      file: f,
      fam_before: r.fam0, fam_after: r.famLeft,
      refused_before: v0.bad, refused_after: v1.bad,
      classes_before: v0.classes, classes_after: v1.classes,
      ops: r.ops.map((o, i) => ({
        line: o.line, from: o.old, to: o.neu, gain: o.gain, shape: o.shape,
        bytes_delta: o.bytes_delta,
        dollar_line_before: o.dollar_line_before, dollar_line_after: o.dollar_line_after,
        tick_line_before: o.tick_line_before, tick_line_after: o.tick_line_after,
        OLD: uniq[i].OLD, NEW: uniq[i].NEW, hits: uniq[i].count,
        ctx: o.before + '[' + o.old + ']' + o.after,
      })),
      unresolved: r.unresolved.map((s) => ({
        line: lineIndex(r.text, s.a) + 1, kind: s.kind, body: s.body.slice(0, 200),
      })),
      dollar_before: r.text0.split(D).length - 1,
      dollar_after: r.text.split(D).length - 1,
      tick_before: r.text0.split(BT).length - 1,
      tick_after: r.text.split(BT).length - 1,
      bytes_before: Buffer.byteLength(r.text0, 'utf8'),
      bytes_after: Buffer.byteLength(r.text, 'utf8'),
    });
    console.log(f.split('-')[0] + ' fam ' + r.fam0 + '->' + r.famLeft +
      ' ops=' + r.ops.length + ' refused ' + v0.bad + '->' + v1.bad);
  }
  fs.writeFileSync(path.join(WORK, 'dm_hunt.json'), JSON.stringify(out, null, 1), 'utf8');
}
main();
