// Discriminate the residual KaTeX refusals by what the refused command IS, not by which
// line it sits on. Three families matter:
//   XREF   - a cross-reference / text-mode macro (\eqref, \ref, \cite, \lem, ...) that got
//            swept into a math span by a verbatim source quote; math can't render it at all.
//   SHORTH - a notation shorthand that some preamble does define (cross-paper bleed).
//   SYNTAX - KaTeX refused for a structural reason (nested $, ungrouped \H, matrix env, ...).
// Reads preamble_tables.json for the definedness credential, same as the fix pass did.
const fs = require('fs');
const path = require('path');
const katex = require('katex');

const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const CJK = new RegExp('[' + String.fromCharCode(0x4e00) + '-' + String.fromCharCode(0x9fff) + ']');

const tables = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const definedAnywhere = new Set();
for (const k of Object.keys(tables))
  for (const c of Object.keys(tables[k].defs || {})) definedAnywhere.add(c);
const unresolved = new Set();
for (const k of Object.keys(tables))
  for (const c of tables[k].unresolved || []) unresolved.add(c);

const XREF = new Set([B + 'eqref', B + 'ref', B + 'cite', B + 'citep', B + 'citet', B + 'citeauthor',
  B + 'Cref', B + 'cref', B + 'label', B + 'pageref', B + 'autoref', B + 'lem', B + 'thm', B + 'prop',
  B + 'cor', B + 'remark', B + 'definition', B + 'qed', B + 'noindent', B + 'item', B + 'bibitem',
  B + 'section', B + 'subsection', B + 'paragraph', B + 'text', B + 'textrm', B + 'textbf',
  B + 'emph', B + 'footnote', B + 'href', B + 'url', B + 'includegraphics', B + 'centering']);

function fenceMask(text) {
  const lines = text.split('\n');
  const out = [];
  let infence = false, tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) { infence = true; tok = s[0] + s[0] + s[0]; out.push(''); continue; }
      if (tok && s.startsWith(tok)) { infence = false; tok = null; out.push(''); continue; }
    }
    if (infence) { out.push(''); continue; }
    out.push(l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'), (m) => ' '.repeat(m.length)));
  }
  return out.join('\n');
}

function spans(masked) {
  const res = [], n = masked.length, DIG = '0123456789';
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { res.push({ kind: 'DUNCLOSED', a: i }); break; }
      res.push({ kind: 'DISPLAY', body: masked.slice(i + 2, j), a: i, b: j + 1 });
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'IUNCLOSED', a: i }); break; }
    res.push({ kind: 'INLINE', body: masked.slice(i + 1, closer), a: i, b: closer });
    i = closer + 1;
  }
  return res;
}

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
const xrefCmds = new Map(), shorthands = new Map(), syntax = new Map(), nowhere = new Map();
let xref = 0, short = 0, syn = 0, refused = 0, nw = 0;
const xrefFiles = new Map();
const idOf = (f) => (f.match(/^D\d+/) || [''])[0];
for (const f of files) {
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const masked = fenceMask(text);
  const key = idOf(f);
  const mine = tables[key] ? tables[key].defs : null;
  for (const s of spans(masked)) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') continue;
    let err = null;
    try {
      katex.renderToString(s.body, { throwOnError: true, strict: false, displayMode: s.kind === 'DISPLAY' });
    } catch (e) { err = e; }
    if (!err) continue;
    refused++;
    const msg = String(err.message);
    const m = msg.match(new RegExp('Undefined control sequence: ' + B + B + '([A-Za-z]+|.)'));
    if (!m) {
      const k = msg.replace(/at position.*/, '').slice(0, 52);
      syn++; syntax.set(k, (syntax.get(k) || 0) + 1);
      continue;
    }
    const c = B + m[1];
    if (XREF.has(c) || /[a-z]{4,}/.test(c.slice(1)) && !CJK.test(c)) {
      // text-mode / cross-reference macros: a real formula would not need them
      if (XREF.has(c)) {
        xref++;
        xrefCmds.set(c, (xrefCmds.get(c) || 0) + 1);
        xrefFiles.set(f, (xrefFiles.get(f) || 0) + 1);
        continue;
      }
    }
    if (mine && mine[c]) { short++; shorthands.set(c, (shorthands.get(c) || 0) + 1); continue; }
    if (definedAnywhere.has(c)) { short++; shorthands.set(c, (shorthands.get(c) || 0) + 1); continue; }
    if (unresolved.has(c)) { short++; shorthands.set(c, (shorthands.get(c) || 0) + 1); continue; }
    nw++; nowhere.set(c, (nowhere.get(c) || 0) + 1);
  }
}
console.log('refused=' + refused + '  xref_textmode=' + xref + '  defined_shorthand=' + short +
  '  never_defined=' + nw + '  syntax=' + syn);
console.log('files_with_xref=' + xrefFiles.size);
const top = (mp, n) => [...mp.entries()].sort((a, b) => b[1] - a[1]).slice(0, n);
console.log('-- xref commands:'); for (const [k, v] of top(xrefCmds, 14)) console.log('   ' + k.padEnd(14) + v);
console.log('-- syntax classes:'); for (const [k, v] of top(syntax, 12)) console.log('   ' + String(v).padStart(5) + ' ' + k);
console.log('-- never-defined top:'); for (const [k, v] of top(nowhere, 18)) console.log('   ' + k.padEnd(14) + v);
console.log('-- defined-shorthand top:'); for (const [k, v] of top(shorthands, 14)) console.log('   ' + k.padEnd(14) + v);
fs.writeFileSync('residual_report.txt',
  JSON.stringify({ refused: refused, xref: xref, short: short, nowhere: nw, syn: syn,
    xrefFiles: Object.fromEntries(xrefFiles), xrefCmds: Object.fromEntries(xrefCmds),
    syntax: Object.fromEntries(syntax), nowhereCmds: Object.fromEntries(nowhere) }, null, 1));
