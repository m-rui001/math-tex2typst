// dollarmath_flip_search.js — for every span KaTeX refuses with
// "Can't use function '$' in math mode", find out WHY the span grammar had to swallow a
// '$', and test the one-character repairs. Read-only: candidates are applied to an
// in-memory copy, re-masked with the corrected口径 (dm_lib) and re-rendered with the same
// KaTeX options as _work/dollarmath_census2.js.
//
// By construction of the span grammar (dm_lib.spans: the closer is the FIRST '$' that is
// neither preceded by whitespace nor followed by a digit), every '$' inside a refused
// body is a delimiter that got VETOED. So this family has exactly two root causes and two
// content-preserving repairs:
//   ws-before   -> DESPACE   delete the one space in front of the vetoed closer
//   digit-after -> INSERTSP  put one space between the closer and the digit
// The delimiter-destroying probes stay in as CONTRAST, because "makes the gauge quiet" is
// not the same claim as "repairs the note":
//   FLIP the '$' -> backtick | ESC insert a backslash | DEL delete the character
//
// Tiers (the reporting decision lives here, not in the reader):
//   T1-WS-SPLIT          a whitespace-only edit splits a one-line refused span into two
//                        spans -> 可机械替换, dD=0 dB=0, byte delta +/-1
//   T3-CROSS-LINE        the refused span itself spans several lines -> 需人工, the defect
//                        is the closer that never came (跨多行行内式 family)
//   T3-WS-BUT-NOT-A-SPLIT  whitespace clears it but does not produce a split -> 需人工
//   T2-ONLY-DELIM-PROBE  only destroying a '$' clears it -> 需人工 (unmatched '$' elsewhere)
//   T4-NO-REPAIR         no single-character edit clears it -> 需人工
// A FALSE-POSITIVE tier is NOT reachable by construction: a '$' inside a refused body is
// always a vetoed delimiter, so it can never already be a legal span boundary.
//
// Usage from the project root:
//   node _work/dollarmath_flip_search.js [--out=_work/dollarmath_flip.jsonl] [--only=D134]
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const L = require('./dm_lib.js');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();

const ARGS = process.argv.slice(2);
function argVal(name) {
  const p = name + '=';
  const a = ARGS.find((x) => x.startsWith(p));
  return a ? a.slice(p.length) : null;
}
const OUT = argVal('--out') || path.join('_work', 'dollarmath_flip.jsonl');
const ONLY = argVal('--only');
const KEY = "Can't use function '" + L.D + "' in math mode";
const B = L.B, D = L.D, BT = L.BT;

function render(body, display) {
  try {
    katex.renderToString(body, {
      throwOnError: true, strict: false, displayMode: !!display, macros: MACROS,
    });
    return null;
  } catch (e) { return String(e.message); }
}

// full parse of one text: every span, and for the refused ones the message + position
function parseAll(text) {
  const m = L.corrected(text);
  const spans = [];
  for (const s of L.spans(m, {})) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') { spans.push({ unclosed: true, a: s.a }); continue; }
    const body = L.bodyOf(m, s);
    const err = render(body, s.kind === 'DISPLAY');
    spans.push({
      unclosed: false, a: s.a, b: s.b, kind: s.kind, body: body,
      line: L.lineOf(text, s.a),
      err: err,
      errClass: err ? err.replace(/at position.*/, '').slice(0, 58) : null,
      pos: err ? (err.match(/at position (\d+)/) || [])[1] : null,
      isDollar: !!err && err.indexOf(KEY) >= 0,
    });
  }
  return { m: m, spans: spans };
}

function tally(res) {
  const t = new Map();
  for (const s of res.spans) {
    if (s.unclosed || !s.err) continue;
    const k = s.line + '|' + s.kind + '|' + s.errClass;
    t.set(k, (t.get(k) || 0) + 1);
  }
  return t;
}
function unclosedCount(res) { return res.spans.filter((s) => s.unclosed).length; }
function spanCount(res) { return res.spans.filter((s) => !s.unclosed).length; }

function vetoReason(m, q) {
  if (L.WS[m.s[q - 1]]) return 'ws-before';
  if (L.DIG.indexOf(m.s[q + 1]) >= 0) return 'digit-after';
  if (m.s[q + 1] === D) return 'dollar-after';
  return 'other';
}

// one-character edits worth testing at this site
function candidates(text, m, sp) {
  const base = sp.kind === 'DISPLAY' ? 2 : 1;
  const out = [];
  for (let q = sp.a + base; q < sp.b; q++) {
    if (!m.delim[q]) continue;
    const why = vetoReason(m, q);
    if (why === 'ws-before' && m.prov[q - 1] === 'P' && text[q - 1] === ' ') {
      out.push(['DESPACE@' + q, text.slice(0, q - 1) + text.slice(q)]);
    }
    if (why === 'digit-after' || why === 'dollar-after') {
      out.push(['INSERTSP@' + q, text.slice(0, q + 1) + ' ' + text.slice(q + 1)]);
    }
  }
  // contrast probes at the position KaTeX itself points at
  const pm = sp.pos === null ? null : (sp.a + base) + parseInt(sp.pos, 10);
  const targets = [];
  if (pm !== null && m.delim[pm] && text[pm] === D) targets.push(pm);
  for (let q = sp.a + base; q < sp.b; q++) if (m.delim[q] && q !== pm) targets.push(q);
  for (const o of targets) {
    out.push(['FLIP@' + o, text.slice(0, o) + BT + text.slice(o + 1)]);
    out.push(['ESC@' + o, text.slice(0, o) + B + text.slice(o)]);
    out.push(['DEL@' + o, text.slice(0, o) + text.slice(o + 1)]);
  }
  return out;
}

let files = fs.readdirSync(L.ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
if (ONLY) files = files.filter((f) => f.startsWith(ONLY));

const rows = [];
let sites = 0, filesHit = 0;
const tallyVerdict = {};
for (const f of files) {
  const text = fs.readFileSync(path.join(L.ROOT, f), 'utf8');
  const base = parseAll(text);
  const baseT = tally(base);
  const lines = text.split('\n');
  const dl = base.spans.filter((s) => !s.unclosed && s.isDollar);
  if (!dl.length) continue;
  filesHit++;
  for (const sp of dl) {
    sites++;
    const m = base.m;
    const adv = sp.kind === 'DISPLAY' ? 2 : 1;
    const vetoes = [];
    for (let q = sp.a + adv; q < sp.b; q++) if (m.delim[q]) vetoes.push(vetoReason(m, q));
    const per = {};
    const clears = [];
    for (const [name, fixed] of candidates(text, m, sp)) {
      const after = parseAll(fixed);
      const at = tally(after);
      let newOnes = 0, removed = 0;
      for (const k of new Set([...baseT.keys(), ...at.keys()])) {
        const b0 = baseT.get(k) || 0, a0 = at.get(k) || 0;
        if (a0 > b0) newOnes++;
        if (a0 < b0) removed++;
      }
      const ok = newOnes === 0 && removed >= 1 && unclosedCount(after) === unclosedCount(base);
      per[name] = {
        clear: ok, newOnes: newOnes, removed: removed,
        spans: spanCount(after) - spanCount(base),
        dD: fixed.split(D).length - text.split(D).length,
        dB: fixed.split(BT).length - text.split(BT).length,
        dBytes: fixed.length - text.length,
      };
      if (ok) clears.push(name);
    }
    // Which repairs are content-preserving: they touch only whitespace, so every '$'
    // keeps its delimiter status (dD=0 and dB=0). The rest (FLIP/ESC/DEL) silence the
    // gauge by destroying a delimiter, which is evidence about the pairing, not a repair.
    const PRI = ['DESPACE', 'INSERTSP', 'FLIP', 'ESC', 'DEL'];
    const verdict = PRI.map((k) => clears.find((c) => c.indexOf(k) === 0)).filter(Boolean)[0] || 'MANUAL';
    const wsClear = clears.filter((c) => c.indexOf('DESPACE') === 0 || c.indexOf('INSERTSP') === 0);
    // A whitespace repair only RESTORES the author's pairing when the refused span lived
    // on one line to begin with and the edit splits it in two. If the span crossed a
    // newline, the defect is the missing/misplaced closer itself (the 跨多行行内式 family),
    // and the same edit just moves the boundary somewhere convenient.
    const crosses = m.s.slice(sp.a, sp.b + 1).indexOf('\n') >= 0;
    const splitOne = wsClear.some((c) => per[c].spans === 1);
    const tier = wsClear.length && !crosses && splitOne ? 'T1-WS-SPLIT'
      : crosses ? 'T3-CROSS-LINE'
      : wsClear.length ? 'T3-WS-BUT-NOT-A-SPLIT'
      : clears.length ? 'T2-ONLY-DELIM-PROBE'
      : 'T4-NO-REPAIR';
    tallyVerdict[tier] = (tallyVerdict[tier] || 0) + 1;
    const lt = lines[sp.line - 1];
    const win = {};
    for (const k of Object.keys(per)) {
      if (!per[k].clear) continue;
      const o = parseInt(k.split('@')[1], 10);
      win[k] = text.slice(Math.max(0, o - 30), o + 26).replace(/\n/g, '\\n');
    }
    rows.push(JSON.stringify({
      file: f, line: sp.line, lineEnd: L.lineOf(text, sp.b), kind: sp.kind,
      a: sp.a, b: sp.b,
      dollarsOnLine: lt.split(D).length - 1,
      backticksOnLine: lt.split(BT).length - 1,
      vetoes: vetoes,
      crosses: crosses,
      tier: tier, verdict: verdict, wsClear: wsClear, cands: per, win: win,
      body: sp.body.slice(0, 140).replace(/\n/g, '\\n'),
    }));
    process.stderr.write('.');
  }
}
process.stderr.write('\n');
fs.writeFileSync(OUT, rows.join('\n') + (rows.length ? '\n' : ''), 'utf8');
console.log('sites=' + sites + ' files=' + filesHit +
  ' by=' + JSON.stringify(tallyVerdict));
