// dollarmath_census2.js — corrected, READ-ONLY re-count of the math spans KaTeX
// refuses, aimed at the "Can't use function '$' in math mode" family.
//
// Two口径 knobs, so the two known artifact mechanisms can be attributed separately:
//
//   --mask=corrected|shipped   which code material is blanked before the '$' are
//                paired.
//       shipped   = _work/katex_census.js fenceMask(): fenced blocks blanked (fence
//                   lines collapsed to empty), inline code spans matched by the
//                   single-line regex  `+[^`\n]*`+  only, '\$' treated as a
//                   delimiter.
//       corrected = same口径 as _work/wrap_census.py mask() / _work/texmask.py, plus
//                   the two holes those two also leave open: an inline code span that
//                   crosses a newline (CommonMark legal, the single-line regex cannot
//                   see it) is blanked too, and a backslash-escaped '\$' is NOT a
//                   delimiter.  Fence lines keep their length, so columns survive.
//
//   --digit=plain|quirk        the "no digit right after the closer" rule.
//       quirk  = katex_census.js verbatim:  !DIG.includes(masked[j+1]==='$'?'':…)
//                and '0123456789'.includes('') === true, so a closer followed
//                immediately by another '$' is vetoed  ->  '$a$$b$' (two adjacent
//                inline spans, e.g. inside a verbatim tex quote) is read as ONE span
//                whose body carries a '$'.
//       plain  = the documented rule only: a '$' is not a digit, the closer stands.
//
// Span grammar otherwise unchanged (see _work/dm_lib.js). Output fields identical to
// katex_census.js --sites: {file,line,kind,tok,errClass,body,lineText}.
//
// Usage from the project root (the equals form is required):
//   node _work/dollarmath_census2.js --sites=_work/dollarmath_sites2.jsonl
// Reads 研究笔记 and preprints-facing material never; writes only inside _work.
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const L = require('./dm_lib.js');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();
const D = L.D;
const B = String.fromCharCode(92);
const WORK = path.join('E:' + B + B + 'math', '_work');

const ARGS = process.argv.slice(2);
function argVal(name) {
  const p = name + '=';
  const a = ARGS.find((x) => x.startsWith(p));
  return a ? a.slice(p.length) : null;
}
const MODE = argVal('--mask') || 'corrected';
const DIGIT = argVal('--digit') || 'plain';
const OUT_PATH = argVal('--out') || path.join(WORK, 'dollarmath_census2.json');
const SITES_PATH = argVal('--sites');
const ONLY = argVal('--only');

let files = fs.readdirSync(L.ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
if (ONLY) files = files.filter((f) => f.startsWith(ONLY));

const undef = new Map();
const otherErr = new Map();
const sites = [];
const famPerFile = {};
let spansTotal = 0, bad = 0, filesHit = 0, unclosed = 0;
let famAll = 0, famFiles = 0, famInline = 0, famDisplay = 0;

for (const f of files) {
  const text = fs.readFileSync(path.join(L.ROOT, f), 'utf8');
  const m = MODE === 'shipped' ? L.shipped(text) : L.corrected(text);
  const origLines = text.split('\n');
  let hit = 0;
  for (const s of L.spans(m, { digitQuirk: DIGIT === 'quirk' })) {
    if (s.kind === 'IUNCLOSED' || s.kind === 'DUNCLOSED') { unclosed++; continue; }
    spansTotal++;
    const body = L.bodyOf(m, s);
    let err = null;
    try {
      katex.renderToString(body, {
        throwOnError: true, strict: false,
        displayMode: s.kind === 'DISPLAY', macros: MACROS,
      });
    } catch (e) { err = e; }
    if (!err) continue;
    bad++; hit++;
    const mm = String(err.message).match(new RegExp('Undefined control sequence: ' + B + B + '([A-Za-z]+|.)'));
    let errClass = null, tok = null;
    if (mm) {
      tok = B + mm[1];
      undef.set(tok, (undef.get(tok) || 0) + 1);
    } else {
      errClass = String(err.message).replace(/at position.*/, '').slice(0, 58);
      otherErr.set(errClass, (otherErr.get(errClass) || 0) + 1);
      if (errClass.indexOf("'" + D + "' in math mode") >= 0) {
        famAll++; famInline += s.kind === 'INLINE' ? 1 : 0;
        famPerFile[f] = (famPerFile[f] || 0) + 1;
        famFiles = Object.keys(famPerFile).length;
      }
    }
    if (SITES_PATH) {
      const off = MODE === 'shipped' ? m.map[s.a] : s.a;
      const ln = L.lineOf(text, off);
      sites.push(JSON.stringify({
        file: f, line: ln, kind: s.kind, tok, errClass,
        body: body, lineText: origLines[ln - 1],
      }));
    }
  }
  if (hit) filesHit++;
}

function top(map, n) {
  return [...map.entries()].sort((a, b) => b[1] - a[1]).slice(0, n);
}
console.log('mask=' + MODE + ' digit=' + DIGIT +
  ' files=' + files.length + ' spans=' + spansTotal +
  ' katex_refused=' + bad + ' files_hit=' + filesHit +
  ' unclosed_spans=' + unclosed);
console.log("dollar_family=" + famAll + ' distinct_files=' + famFiles +
  ' inline=' + famInline + ' display=' + (famAll - famInline));
fs.writeFileSync(OUT_PATH, JSON.stringify({
  mask: MODE, digit: DIGIT,
  spans: spansTotal, refused: bad, filesHit: filesHit,
  dollarFamily: famAll, dollarFamilyPerFile: famPerFile,
  undef: Object.fromEntries(undef), other: Object.fromEntries(otherErr),
}, null, 1));
if (SITES_PATH) {
  fs.writeFileSync(SITES_PATH, sites.length ? sites.join('\n') + '\n' : '', 'utf8');
  fs.writeFileSync(SITES_PATH + '.count', String(sites.length) + '\n', 'utf8');
}
console.log('--- other error classes=' + otherErr.size);
for (const [k, v] of top(otherErr, 14)) console.log(String(v).padStart(7) + '  ' + k);
