// _work/h_census.js — every KaTeX-refused span whose error names the control sequence
// BACKSLASH-H, with the material-credential question attached: is this site a body-side
// math span of the note, or a verbatim quote of that paper's tex?
//   node _work/h_census.js [--sites=_work/h_sites.jsonl]
// Reads 研究笔记, writes only inside _work. Reuses the corrected mask from dm_lib.js.
'use strict';
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const L = require('./dm_lib.js');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();
const B = String.fromCharCode(92);
const WORK = path.join('E:' + B + B + 'math', '_work');
const OUT = (process.argv.find((a) => a.startsWith('--sites=')) || '').split('=')[1] ||
  path.join(WORK, 'h_sites.jsonl');

// KaTeX's own '\H' is the Hungarian accent, which takes a mandatory group: '\H{o}'.
// A note that quotes a paper redefining '\H' (e.g. '\renewcommand{\H}{\mathcal H}')
// therefore fails with one of two messages, and both are captured by KEY.
const KEY = new RegExp(B + B + 'H(?![a-zA-Z])');
function classifies(msg) {
  return /Expected group as argument to/.test(msg) ||
    /Got function '[^']*' with no arguments/.test(msg);
}

let files = fs.readdirSync(L.ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
const rows = [];
const per = {};
for (const f of files) {
  const text = L.readNote(f);
  const m = L.corrected(text);
  const lines = text.split('\n');
  for (const s of L.spans(m, {})) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') continue;
    const body = L.bodyOf(m, s);
    if (!KEY.test(body)) continue;
    let err = null;
    try {
      katex.renderToString(body, { throwOnError: true, strict: false, displayMode: s.kind === 'DISPLAY', macros: MACROS });
    } catch (e) { err = e; }
    if (!err || !classifies(String(err.message))) continue;
    const ln = L.lineOf(text, s.a);
    const lt = lines[ln - 1];
    const ctx = /^\s*>/.test(lt) ? 'QUOTE' : /^\s*\|/.test(lt) ? 'TABLE' : 'PROSE';
    per[f] = per[f] || { sites: 0, QUOTE: 0, TABLE: 0, PROSE: 0, msgs: {} };
    per[f].sites++;
    per[f][ctx]++;
    const mk = String(err.message).replace(/at position.*/, '').slice(0, 60);
    per[f].msgs[mk] = (per[f].msgs[mk] || 0) + 1;
    rows.push(JSON.stringify({
      file: f, line: ln, ctx: ctx, kind: s.kind, msg: mk,
      hUses: (body.match(new RegExp(B + B + 'H(?![a-zA-Z])', 'g')) || []).length,
      body: body.slice(0, 120),
    }));
  }
}
fs.writeFileSync(OUT, rows.join('\n') + '\n', 'utf8');
for (const f of Object.keys(per)) {
  console.log(f + '  sites=' + per[f].sites + ' quote=' + per[f].QUOTE +
    ' table=' + per[f].TABLE + ' prose=' + per[f].PROSE);
  for (const k of Object.keys(per[f].msgs)) console.log('    ' + per[f].msgs[k] + '  ' + k);
}
console.log('total=' + rows.length + ' sites -> ' + OUT);
