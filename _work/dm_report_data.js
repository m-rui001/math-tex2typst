// _work/dm_report_data.js — assemble the per-site review sheet used by the triage
// report: for every shipped-gauge dollar-family row, the raw window around the
// offending span, the interior '$' provenance, and the hunter's candidate op.
// Read-only; writes _work/dm_sheet.txt.
const fs = require('fs');
const path = require('path');
const L = require('./dm_lib.js');
const D = L.D, BT = L.BT;
const WORK = 'E:' + String.fromCharCode(92) + String.fromCharCode(92) + 'math/_work';
const OPTS = { digitQuirk: false };

function readSites(p) {
  return fs.readFileSync(p, 'utf8').split('\n').filter((x) => x.trim()).map((x) => JSON.parse(x));
}
const shipped = readSites(path.join(WORK, 'dm_sites_ss.jsonl'));
const corrected = readSites(path.join(WORK, 'dm_sites_corrected_plain.jsonl'));
const hunt = JSON.parse(fs.readFileSync(path.join(WORK, 'dm_hunt.json'), 'utf8'));
const huntByFile = {};
for (const h of hunt) huntByFile[h.file] = h;
const isFam = (r) => (r.errClass || '').indexOf("'" + D + "' in math mode") >= 0;
const fShipped = shipped.filter(isFam);
const fCorr = corrected.filter(isFam);

const out = [];
let n = 0;
const byFile = {};
for (const r of fShipped) (byFile[r.file] = byFile[r.file] || []).push(r);
for (const f of Object.keys(byFile).sort()) {
  const text = fs.readFileSync(path.join(L.ROOT, f), 'utf8');
  const co = L.corrected(text);
  const sp = L.spans(co, OPTS);
  const corrHere = fCorr.filter((x) => x.file === f);
  const h = huntByFile[f] || { ops: [], unresolved: [] };
  out.push('#### ' + f);
  out.push('     corrected-gauge sites in this note = ' + corrHere.length +
    '; hunter ops = ' + h.ops.length + '; unresolved = ' + h.unresolved.length +
    '; refused ' + (h.refused_before) + '->' + (h.refused_after));
  for (const r of byFile[f]) {
    n++;
    const matchCorr = corrHere.filter((c) => c.line === r.line);
    // locate the corrected span for context
    const spanHere = sp.filter((s) => s.interior > 0 && L.lineOf(text, s.a) === r.line);
    out.push('  -- site ' + n + ' | L' + r.line + ' | ' + r.kind +
      ' | shipped body ' + JSON.stringify(r.body.slice(0, 70)) +
      ' | ' + (matchCorr.length ? 'REAL under corrected gauge' : 'GAUGE ARTIFACT under corrected gauge'));
    for (const s of spanHere) {
      const a = Math.max(0, s.a - 150), b = Math.min(text.length, s.b + 150);
      out.push('     WINDOW  ' + JSON.stringify(text.slice(a, b)));
      const inside = [];
      for (let q = s.a + 1; q < s.b; q++) if (co.delim[q]) inside.push(q);
      for (const q of inside) {
        out.push('     $@' + q + ' line ' + L.lineOf(text, q) + ' prov=' + co.prov[q] +
          ' :: ' + JSON.stringify(text.slice(Math.max(0, q - 70), q + 70)));
      }
    }
    if (!spanHere.length && !matchCorr.length) {
      out.push('     (no corrected-gauge span on this line: the shipped reading came from ' +
        'material the corrected mask blanks or from the DIG.includes("") veto)');
      out.push('     HOSTLINE ' + JSON.stringify((r.lineText || '').slice(0, 700)));
    }
    const op = h.ops.filter((o) => o.line === r.line);
    for (const o of op) {
      out.push('     OP line ' + o.line + ' [' + o.from + ']->[' + o.to + '] hits=' + o.hits +
        ' gain=' + o.gain + ' ctx=' + JSON.stringify(o.ctx));
      out.push('        OLD ' + JSON.stringify(o.OLD));
      out.push('        NEW ' + JSON.stringify(o.NEW));
    }
    for (const u of h.unresolved) {
      if (u.line === r.line) out.push('     NO SINGLE-CHAR FIX FOUND (unresolved)');
    }
    out.push('');
  }
  out.push('');
}
fs.writeFileSync(path.join(WORK, 'dm_sheet.txt'), out.join('\n'), 'utf8');
console.log('sites=' + n + ' bytes=' + Buffer.byteLength(out.join('\n'), 'utf8'));
