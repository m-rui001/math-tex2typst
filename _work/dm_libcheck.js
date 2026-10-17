// _work/dm_libcheck.js — validates _work/dm_lib.js against the two shipped gauges.
// Reads only. Prints, for each口径, the number of KaTeX-refused spans whose error is
// "Can't use function '$' in math mode", so the readings are comparable with
//   node _work/katex_census.js          (105)
//   node _work/dollarmath_census2.js    (99)
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const L = require('./dm_lib.js');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();
const D = L.D;

function shippedObj(text) { return L.shipped(text); }

function count(mode) {
  const files = fs.readdirSync(L.ROOT).filter((f) => /^D.*\.md$/.test(f)).sort();
  let fam = 0, refused = 0, spansT = 0, uncl = 0;
  const perFile = {};
  for (const f of files) {
    const text = L.readNote(f);
    const m = mode === 'shipped' ? shippedObj(text) : L.corrected(text);
    for (const sp of L.spans(m)) {
      if (sp.kind === 'IUNCLOSED' || sp.kind === 'DUNCLOSED') { uncl++; continue; }
      spansT++;
      const body = L.bodyOf(m, sp);
      let err = null;
      try {
        katex.renderToString(body, {
          throwOnError: true, strict: false,
          displayMode: sp.kind === 'DISPLAY', macros: MACROS,
        });
      } catch (e) { err = String(e.message); }
      if (!err) continue;
      refused++;
      if (err.indexOf("'" + D + "' in math mode") >= 0) {
        fam++;
        perFile[f] = (perFile[f] || 0) + 1;
      }
    }
  }
  console.log(mode + ': spans=' + spansT + ' refused=' + refused +
    ' dollar_family=' + fam + ' files=' + Object.keys(perFile).length + ' unclosed=' + uncl);
  return perFile;
}

const a = count('shipped');
const b = count('corrected');
fs.writeFileSync(path.join('E:' + String.fromCharCode(92) + String.fromCharCode(92) + 'math', '_work', 'dm_lib_family.json'),
  JSON.stringify({ shipped: a, corrected: b }, null, 0));
