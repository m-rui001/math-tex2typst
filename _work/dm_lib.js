// _work/dm_lib.js — the two masking口径 used by the dollar-family triage, exported
// so that _work/dollarmath_census2.js and the fix hunter read the corpus through the
// same gauge.  Pure functions; no writes; notes are only ever read.
'use strict';
const fs = require('fs');
const path = require('path');

const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const DIG = '0123456789';
const WS = { ' ': 1, '\t': 1, '\n': 1 };
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');

// ---------- shipped口径 (katex_census.js fenceMask, verbatim: fence lines -> '') ----
// Returns {s, delim, map}: masked offset i maps back to raw offset map[i] ('' lines
// keep their newline so line numbers survive, but columns are lost).
function shipped(text) {
  const lines = text.split('\n');
  const out = [];
  const map = [];
  let infence = false;
  let tok = null;
  let raw = 0;
  for (const l of lines) {
    const s = l.trim();
    let blanked = false;
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) { infence = true; tok = s[0] + s[0] + s[0]; blanked = true; }
      else if (tok && s.startsWith(tok)) { infence = false; tok = null; blanked = true; }
    }
    let piece;
    if (infence && !blanked) piece = '';
    else if (blanked) piece = '';
    else piece = l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'),
      (m) => ' '.repeat(m.length));
    for (let i = 0; i < piece.length; i++) map.push(piece === '' ? raw + i : raw + i);
    map.push(raw + l.length);   // the newline
    out.push(piece);
    raw += l.length + 1;
  }
  const s = out.join('\n');
  const delim = [];
  for (let i = 0; i < s.length; i++) delim.push(s[i] === D ? 1 : 0);
  return { s, delim, map, lines: lines };
}

// length-preserving variant of the shipped口径 (used when raw offsets are wanted)
function shippedMask(text) {
  const lines = text.split('\n');
  const out = [];
  let infence = false;
  let tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) { infence = true; tok = s[0] + s[0] + s[0]; out.push(' '.repeat(l.length)); continue; }
      if (tok && s.startsWith(tok)) { infence = false; tok = null; out.push(' '.repeat(l.length)); continue; }
    }
    if (infence) out.push(' '.repeat(l.length));
    else out.push(l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'), (m) => ' '.repeat(m.length)));
  }
  return out.join('\n');
}

// ---------- corrected口径: fences + code spans (1- and multi-line) + \$ escapes ----
// prov codes: 'F' fence material, 'c' single-line code span, 'C' code span crossing a
// newline, 'E' the character after a backslash, 'P' plain.
function provOf(text) {
  const n = text.length;
  const prov = new Array(n);
  for (let i = 0; i < n; i++) prov[i] = 'P';
  const lines = [];
  let pos = 0;
  while (pos <= n) {
    let e = text.indexOf('\n', pos);
    if (e < 0) e = n;
    lines.push([pos, e]);
    if (e === n) break;
    pos = e + 1;
  }
  let infence = false;
  let tok = null;
  const fencey = [];
  for (const [a, b] of lines) {
    const t = text.slice(a, b).trim();
    let isDelim = false;
    if (/^(?:`{3,}|~{3,})/.test(t)) {
      if (!infence) { infence = true; tok = t[0] + t[0] + t[0]; isDelim = true; }
      else if (t.startsWith(tok)) { infence = false; tok = null; isDelim = true; }
    }
    fencey.push(infence || isDelim);
  }
  lines.forEach(([a, b], li) => {
    if (fencey[li]) for (let i = a; i < b; i++) prov[i] = 'F';
  });
  // inline code spans, paragraph aware
  let open = null;    // {line, col, k, off}
  lines.forEach(([a, b], li) => {
    if (fencey[li]) { open = null; return; }
    let j = a;
    while (j < b) {
      const c = text[j];
      if (c === B) { j += 2; continue; }
      if (c !== BT) { j++; continue; }
      let k = 0;
      while (j + k < b && text[j + k] === BT) k++;
      if (!open) { open = { line: li, col: j, k, off: j }; j += k; continue; }
      if (k === open.k) {
        const cls = open.line === li ? 'c' : 'C';
        if (open.line === li) {
          for (let q = open.col; q < j + k; q++) if (prov[q] === 'P') prov[q] = cls;
        } else {
          for (let q = open.col; q < b; q++) if (prov[q] === 'P') prov[q] = cls;
          for (let sl = open.line + 1; sl < li; sl++) {
            for (let q = lines[sl][0]; q < lines[sl][1]; q++) prov[q] = cls;
          }
          const ea = lines[li][0];
          for (let q = ea; q < j + k; q++) if (prov[q] === 'P') prov[q] = cls;
        }
        open = null;
        j += k;
        continue;
      }
      j += k;
    }
    if (text.slice(a, b).trim() === '') open = null;
  });
  // escapes
  lines.forEach(([a, b], li) => {
    if (fencey[li]) return;
    let j = a;
    while (j < b) {
      if (text[j] === B) { if (j + 1 < n && prov[j + 1] === 'P') prov[j + 1] = 'E'; j += 2; continue; }
      j++;
    }
  });
  return prov.join('');
}

function corrected(text) {
  const prov = provOf(text);
  const s = [];
  const delim = [];
  for (let i = 0; i < text.length; i++) {
    const p = prov[i];
    if (p === 'F' || p === 'c' || p === 'C') {
      s.push(text[i] === '\n' ? '\n' : ' ');
      delim.push(0);
    } else {
      s.push(text[i]);
      delim.push(text[i] === D && p !== 'E' ? 1 : 0);
    }
  }
  return { s: s.join(''), delim, prov };
}

// ---------- the shipped span grammar, over a mask with an explicit delim table ----
// opts.digitQuirk: katex_census.js line 75 tests  !DIG.includes(masked[j+1]==='$' ? ''
// : masked[j+1]||'')  -- and '0123456789'.includes('') is TRUE, so a closer followed
// immediately by another '$' is VETOED. That makes '$a$$b$' (two adjacent inline
// spans, the way a verbatim tex quote is often written) into one span whose body
// carries a '$'. With digitQuirk=false the rule is the documented one: a '$' is not a
// digit, so the closer stands.
function spans(m, opts) {
  const quirk = !!(opts && opts.digitQuirk);
  const res = [];
  const n = m.s.length;
  let i = 0;
  while (i < n) {
    if (!m.delim[i]) { i++; continue; }
    if (i + 1 < n && m.delim[i + 1]) {
      let j = i + 2;
      while (j < n && !(m.delim[j] && m.delim[j + 1])) j++;
      if (j >= n) { res.push({ kind: 'DUNCLOSED', a: i, interior: 0 }); break; }
      let c = 0;
      for (let q = i + 2; q < j; q++) if (m.delim[q]) c++;
      res.push({ kind: 'DISPLAY', a: i, b: j, interior: c });
      i = j + 2;
      continue;
    }
    if (i + 1 >= n || WS[m.s[i + 1]]) { i++; continue; }
    let j = i + 1;
    let closer = -1;
    while (j < n) {
      const nx = j + 1 < n ? m.s[j + 1] : '';
      const key = quirk ? (m.s[j + 1] === D ? '' : nx) : nx;
      const digit = quirk ? (DIG.indexOf(key) >= 0 || key === '') : (DIG.indexOf(nx) >= 0);
      if (m.delim[j] && !WS[m.s[j - 1]] && !digit) { closer = j; break; }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'IUNCLOSED', a: i, interior: 0 }); break; }
    let c = 0;
    for (let q = i + 1; q < closer; q++) if (m.delim[q]) c++;
    res.push({ kind: 'INLINE', a: i, b: closer, interior: c });
    i = closer + 1;
  }
  return res;
}

function lineOf(text, off) {
  let c = 0;
  for (let i = 0; i < off; i++) if (text[i] === '\n') c++;
  return c + 1;
}

function bodyOf(m, sp) {
  return sp.kind === 'DISPLAY' ? m.s.slice(sp.a + 2, sp.b) : m.s.slice(sp.a + 1, sp.b);
}

module.exports = {
  ROOT, D, BT, B, DIG, WS,
  shipped,
  shippedMask,
  corrected,
  provOf,
  spans,
  lineOf,
  bodyOf,
  readNote: (f) => fs.readFileSync(path.join(ROOT, f), 'utf8'),
};
