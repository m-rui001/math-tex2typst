// Corpus census of math spans that KaTeX refuses, and the command it refuses on.
// The span grammar is the strict inline-math one used by the note leg: `$$..$$` for
// display, `$..$` with no whitespace after the opener and no whitespace before the
// closer / no digit after it. Fenced blocks and code spans are blanked first, and a
// span that does not close under that grammar is reported separately, not sent to KaTeX.
const fs = require('fs');
const path = require('path');
const katex = require('katex');

const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
// Optional flags (also used by the C-note leg): --root=<dir> --prefix=<glob-head, default D>
const ARGS0 = process.argv.slice(2);
function argVal0(name) {
  const p = name + '=';
  const a = ARGS0.find((x) => x.startsWith(p));
  return a ? a.slice(p.length) : null;
}
const ROOT = argVal0('--root') || path.join('E:' + B + B + 'math', '研究笔记');
const FILE_RE = new RegExp('^' + (argVal0('--prefix') || 'D') + '.*\\.md$');
const WORK = path.join('E:' + B + B + 'math', '_work');
const DIG = '0123456789';
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();

function fenceMask(text) {
  const lines = text.split('\n');
  const out = [];
  const flags = [];
  let infence = false;
  let tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) {
        infence = true;
        tok = s[0] + s[0] + s[0];
        out.push('');
        flags.push(1);
        continue;
      }
      if (tok && s.startsWith(tok)) {
        infence = false;
        tok = null;
        out.push('');
        flags.push(1);
        continue;
      }
    }
    if (infence) {
      out.push('');
      flags.push(1);
    } else {
      const cleaned = l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'),
        (m) => ' '.repeat(m.length));
      out.push(cleaned);
      flags.push(0);
    }
  }
  return { masked: out.join('\n'), flags: flags, lines: lines };
}

function spans(masked) {
  const res = [];
  const n = masked.length;
  let i = 0;
  while (i < n) {
    if (masked[i] !== D) { i++; continue; }
    if (masked[i + 1] === D) {
      let j = i + 2;
      while (j < n && !(masked[j] === D && masked[j + 1] === D)) j++;
      if (j >= n) { res.push({ kind: 'DUNCLOSED', a: i }); break; }
      res.push({ kind: 'DISPLAY', body: masked.slice(i + 2, j), a: i });
      i = j + 2;
      continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1;
    let closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !DIG.includes(masked[j + 1] === D ? '' : masked[j + 1] || '')) {
        closer = j;
        break;
      }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'IUNCLOSED', a: i }); break; }
    res.push({ kind: 'INLINE', body: masked.slice(i + 1, closer), a: i });
    i = closer + 1;
  }
  return res;
}

function lineOf(text, off) {
  let c = 0;
  for (let i = 0; i < off; i++) if (text[i] === '\n') c++;
  return c + 1;
}

const files = fs.readdirSync(ROOT).filter((f) => FILE_RE.test(f)).sort();
const undef = new Map();
const otherErr = new Map();
let spansTotal = 0, bad = 0, filesHit = 0, unclosed = 0;
const examples = [];
const firsts = [];

// Optional flags (added for the long-tail triage, counting logic below is unchanged):
//   --out=PATH   write the summary json here instead of katexundef.json
//   --sites=PATH append every refused span as a JSONL line:
//                {file,line,col,tok,errClass,body,lineText}
const ARGS = process.argv.slice(2);
function argVal(name) {
  const p = name + '=';
  const a = ARGS.find((x) => x.startsWith(p));
  return a ? a.slice(p.length) : null;
}
const OUT_PATH = argVal('--out') || path.join(WORK, 'katexundef.json');
const SITES_PATH = argVal('--sites');
const sites = [];

for (const f of files) {
  const text = fs.readFileSync(path.join(ROOT, f), 'utf8');
  const { masked } = fenceMask(text);
  let hit = 0;
  for (const s of spans(masked)) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') { unclosed++; continue; }
    spansTotal++;
    let err = null;
    try {
      katex.renderToString(s.body, { throwOnError: true, strict: false, displayMode: s.kind === 'DISPLAY', macros: MACROS });
    } catch (e) {
      err = e;
    }
    if (!err) continue;
    bad++;
    hit++;
    const UNDEF = new RegExp('Undefined control sequence: ' + B + B + '([A-Za-z]+|.)');
    const m = String(err.message).match(UNDEF);
    let errClass = null;
    let tok = null;
    if (m) {
      const c = B + m[1];
      tok = c;
      undef.set(c, (undef.get(c) || 0) + 1);
      firsts.push(c);
    } else {
      errClass = String(err.message).replace(/at position.*/, '').slice(0, 58);
      otherErr.set(errClass, (otherErr.get(errClass) || 0) + 1);
      firsts.push(null);
    }
    if (SITES_PATH) {
      const ln = lineOf(masked, s.a);
      const origLines = text.split('\n');
      sites.push(JSON.stringify({
        file: f, line: ln, kind: s.kind, tok: tok, errClass: errClass,
        body: s.body, lineText: origLines[ln - 1],
      }));
    }
  }
  if (hit) filesHit++;
}

function top(map, n) {
  return [...map.entries()].sort((a, b) => b[1] - a[1]).slice(0, n);
}
console.log('files=' + files.length + ' spans=' + spansTotal +
  ' katex_refused=' + bad + ' files_hit=' + filesHit +
  ' unclosed_spans=' + unclosed);
const order = [...undef.entries()].sort((a, b) => b[1] - a[1]).map((e) => e[0]);
fs.writeFileSync(OUT_PATH, JSON.stringify({
  spans: spansTotal, refused: bad, filesHit: filesHit,
  undef: Object.fromEntries(undef), other: Object.fromEntries(otherErr),
}, null, 1));
if (SITES_PATH) {
  fs.writeFileSync(SITES_PATH, sites.join('\n') + '\n', 'utf8');
  fs.writeFileSync(SITES_PATH + '.count', String(sites.length) + '\n', 'utf8');
}
for (const K of [10, 20, 40, 80, 150, 300]) {
  const set = new Set(order.slice(0, K));
  const covered = firsts.filter((c) => c && set.has(c)).length;
  console.log('top' + String(K).padStart(4) + ' commands cover ' + covered +
    ' spans, ' + (100 * covered / bad).toFixed(1) + '% of refused');
}
console.log('--- distinct undefined commands=' + undef.size);
for (const [k, v] of top(undef, 40)) console.log(k.padEnd(16) + v);
console.log('--- other error classes=' + otherErr.size);
for (const [k, v] of top(otherErr, 12)) console.log(String(v).padStart(7) + '  ' + k);
