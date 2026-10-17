// Shared markdown-math readers for the repair passes: one implementation of the
// fence/code masking and of the $...$ span pairing, so every tool sees the same spans.
// Blank fenced lines and code spans IN PLACE with spaces so that every offset in the
// masked text addresses the same byte of the original file.
const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const DIG = '0123456789';

function fenceMask(text) {
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
    out.push(infence ? ' '.repeat(l.length)
      : l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'), (m) => ' '.repeat(m.length)));
  }
  return out.join('\n');
}

// micromark-extension-math's inline rule: the opener may not be followed by whitespace,
// the closer may not be preceded by whitespace nor followed by a digit. $$..$$ is display.
function spans(masked) {
  const res = [];
  const n = masked.length;
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { res.push({ kind: 'X', a: i, b: i }); break; }
      res.push({ kind: 'DISPLAY', body: masked.slice(i + 2, j), a: i + 2, b: j });
      i = j + 2;
      continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1, closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !(masked[j + 1] && masked[j + 1] !== D && DIG.includes(masked[j + 1]))) { closer = j; break; }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'X', a: i, b: i }); break; }
    res.push({ kind: 'INLINE', body: masked.slice(i + 1, closer), a: i + 1, b: closer });
    i = closer + 1;
  }
  return res;
}

function lineOf(offsets, a) {
  let ln = 0;
  while (ln + 1 < offsets.length && offsets[ln + 1] <= a) ln++;
  return ln + 1;
}

function lineOffsets(text) {
  let acc = 0;
  return text.split('\n').map((l) => { const prev = acc; acc += l.length + 1; return prev; });
}

module.exports = { fenceMask: fenceMask, spans: spans, lineOf: lineOf, lineOffsets: lineOffsets, B: B, D: D, BT: BT };
