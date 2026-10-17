// Deeper probe: log every '$' occurrence on the reported line (D245) and the full display/inline
// pairing sequence for D222/D752, to expose the true parity-flip source upstream of the reported
// first-unclosed site. Reuses census fenceMask + span grammar.
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '\u7814\u7a76\u7b14\u8bb0');
const DIG = '0123456789';

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
function lineCol(maskedLines, off) {
  let acc = 0;
  for (let k = 0; k < maskedLines.length; k++) {
    if (off < acc + maskedLines[k].length + 1) return { line: k + 1, col: off - acc };
    acc += maskedLines[k].length + 1;
  }
  return { line: maskedLines.length, col: 0 };
}

function walk(masked, stopLine) {
  // non-breaking walk; records spans; returns {spans, unclosed}
  const maskedLines = masked.split('\n');
  const res = [];
  const n = masked.length;
  let i = 0, unclosed = null;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { unclosed = { kind: 'DUNCLOSED', ...lineCol(maskedLines, i), off: i }; res.push({ kind: 'D-ORPHAN', o: lineCol(maskedLines, i) }); break; }
      res.push({ kind: 'DISPLAY', o: lineCol(maskedLines, i), c: lineCol(maskedLines, j) });
      i = j + 2; continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { res.push({ kind: 'LITERAL$', at: lineCol(maskedLines, i) }); i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) { closer = j; break; }
      j++;
    }
    if (closer < 0) { unclosed = { kind: 'IUNCLOSED', ...lineCol(maskedLines, i), off: i }; res.push({ kind: 'I-ORPHAN', o: lineCol(maskedLines, i) }); break; }
    res.push({ kind: 'INLINE', o: lineCol(maskedLines, i), c: lineCol(maskedLines, closer) });
    i = closer + 1;
  }
  return { spans: res, unclosed };
}

const targets = ['D222', 'D245', 'D752'];
const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();

for (const t of targets) {
  const f = files.find((x) => x.startsWith(t + '-'));
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const masked = fenceMask(text);
  const maskedLines = masked.split('\n');
  const origLines = text.split('\n');
  const w = walk(masked);
  console.log('==================== ' + t + ' ' + f);
  console.log('per-line counts of "$$" occurrences and single-$ parity:');
  // list all lines that contain a '$$' occurrence
  for (let k = 0; k < maskedLines.length; k++) {
    const m = maskedLines[k];
    let occ = 0;
    for (let x = 0; x + 1 < m.length; x++) if (m[x] === D && m[x + 1] === D) occ++;
    if (occ) console.log('  L' + (k + 1) + ' contains $$ occurrences=' + occ + ' :: ' + JSON.stringify(m.slice(0, 90)));
  }
  console.log('span pairing sequence (last 12 before break / around report):');
  const seq = w.spans.slice(-12);
  for (const s of seq) {
    if (s.kind === 'DISPLAY') console.log('  DISPLAY open@L' + s.o.line + ' -> close@L' + s.c.line + (s.o.line === s.c.line ? '' : '  <== MULTILINE'));
    else if (s.kind === 'INLINE') console.log('  INLINE  open@L' + s.o.line + 'c' + s.o.col + ' -> close@L' + s.c.line + 'c' + s.c.col);
    else if (s.kind === 'LITERAL$') console.log('  LITERAL$ at L' + s.at.line + 'c' + s.at.col);
    else if (s.kind === 'D-ORPHAN') console.log('  *** D-ORPHAN open@L' + s.o.line + 'c' + s.o.col);
    else if (s.kind === 'I-ORPHAN') console.log('  *** I-ORPHAN open@L' + s.o.line + 'c' + s.o.col);
  }
  if (w.unclosed) {
    console.log('FIRST-UNCLOSED kind=' + w.unclosed.kind + ' line=' + w.unclosed.line + ' col=' + w.unclosed.col);
    if (t === 'D245') {
      const ln = w.unclosed.line;
      const ml = maskedLines[ln - 1];
      console.log('  every $ occurrence on L' + ln + ' (col:prev|cur|next):');
      for (let x = 0; x < ml.length; x++) {
        if (ml[x] === D) {
          console.log('    col=' + x + ' prev=' + JSON.stringify(ml[x - 1] || '') + ' next=' + JSON.stringify(ml[x + 1] || '') +
            ' ctx=' + JSON.stringify(ml.slice(Math.max(0, x - 6), x + 7)));
        }
      }
    }
  }
}
