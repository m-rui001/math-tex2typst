// Expand a note's shorthand control sequences into the body its OWN material
// preamble defines, then re-measure with KaTeX. Nothing is invented: a command with
// no entry in that note's table is left alone and stays in the census.
// Usage: node katex_fix.js [IDprefix] [--apply]
const fs = require('fs');
const path = require('path');
const katex = require('katex');

const B = String.fromCharCode(92);
const D = String.fromCharCode(36);
const BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const WORK = 'E:' + B + B + 'math' + B + B + '_work';
const DIG = '0123456789';
const APPLY = process.argv.includes('--apply');
const DIFF = process.argv.includes('--diff');
const PREFIX = process.argv.slice(2).find((a) => !a.startsWith('--')) || '';

const TABLES = JSON.parse(fs.readFileSync(path.join(WORK, 'preamble_tables.json'), 'utf8'));

// Blank fenced lines and code spans IN PLACE with spaces so that every offset in the
// masked text addresses the same byte of the original file; deleting the line instead
// would shift the offsets and make the edits land in the wrong place.
function fenceMask(text) {
  const lines = text.split('\n');
  const out = [];
  let infence = false;
  let tok = null;
  for (const l of lines) {
    const s = l.trim();
    if (/^(?:`{3,}|~{3,})/.test(s)) {
      if (!infence) {
        infence = true;
        tok = s[0] + s[0] + s[0];
        out.push(' '.repeat(l.length));
        continue;
      }
      if (tok && s.startsWith(tok)) {
        infence = false;
        tok = null;
        out.push(' '.repeat(l.length));
        continue;
      }
    }
    out.push(infence ? ' '.repeat(l.length)
      : l.replace(new RegExp(BT + '+[^' + BT + B + 'n]*' + BT + '+', 'g'),
        (m) => ' '.repeat(m.length)));
  }
  return out.join('\n');
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
      if (j >= n) { res.push({ kind: 'X', a: i, b: i }); break; }
      res.push({ kind: 'DISPLAY', body: masked.slice(i + 2, j), a: i + 2, b: j });
      i = j + 2;
      continue;
    }
    if (i + 1 >= n || ' \t\n'.includes(masked[i + 1])) { i++; continue; }
    let j = i + 1;
    let closer = -1;
    while (j < n) {
      if (masked[j] === D && !' \t\n'.includes(masked[j - 1]) &&
          !(masked[j + 1] && masked[j + 1] !== D && DIG.includes(masked[j + 1]))) {
        closer = j;
        break;
      }
      j++;
    }
    if (closer < 0) { res.push({ kind: 'X', a: i, b: i }); break; }
    res.push({ kind: 'INLINE', body: masked.slice(i + 1, closer), a: i + 1, b: closer });
    i = closer + 1;
  }
  return res;
}

function refused(text) {
  const masked = fenceMask(text);
  const cmds = new Map();
  let bad = 0;
  for (const s of spans(masked)) {
    if (s.kind === 'X') continue;
    try {
      katex.renderToString(s.body, { throwOnError: true, strict: false,
        displayMode: s.kind === 'DISPLAY' });
    } catch (e) {
      bad++;
      const msg = String(e.message);
      const add = (m) => {
        if (!m) return;
        const k = B + m[1];
        cmds.set(k, (cmds.get(k) || 0) + 1);
      };
      add(msg.match(new RegExp('Undefined control sequence: ' + B + B + '([A-Za-z]+|.)')));
      // Second shape of the same defect: the material redefines a name KaTeX already owns
      // (paper's `\renewcommand{\H}{\mathcal H}` against KaTeX's Hungarian accent `\H{o}`),
      // so the refusal is an arity complaint, not an undefined one. The name is harvested
      // here too -- the credential gate is unchanged: expansion still needs that note's own
      // preamble table, and a table entry only ever reaches spans this file already refuses.
      add(msg.match(new RegExp("Expected group as argument to '" + B + B + "([A-Za-z]+)'")));
      add(msg.match(new RegExp("Got function '" + B + B + "([A-Za-z]+)' with no arguments")));
      // Third shape of the same defect: when the offending control word sits just before a
      // closing group (`F_{\red}`), KaTeX reports a BRACE complaint and the name never
      // reaches the message at all. Candidates are then this span's own control words; the
      // credential gate is unchanged -- main() only expands names that note's preamble table
      // defines, and only inside spans this file already judged refused.
      if (/Extra \}/.test(msg) || /Expected '\}', got 'EOF'/.test(msg)) {
        const cre = new RegExp(B + B + '([A-Za-z]+)', 'g');
        let cm;
        while ((cm = cre.exec(s.body))) cmds.set(B + cm[1], (cmds.get(B + cm[1]) || 0) + 1);
      }
    }
  }
  return { bad: bad, cmds: cmds };
}

// Replace one command with its defined body inside every math span. TeX tokenises a
// control word greedily, so `\eps` is that command only when no letter follows it.
// The terminator is never eaten: a space is ignored in math mode, while eating it could
// fuse the body with whatever letter came next (`\eps`+` x` -> `epsilonx`). The mirror
// hazard, taken from macros.py's own guard, is a letter-starting body gluing onto the
// control word before it (`\to` + `\Sel` -> `\toSel`), so a space is inserted there.
function expandAll(text, cmd, body) {
  const masked = fenceMask(text);
  const edits = [];
  for (const s of spans(masked)) {
    if (s.kind === 'X') continue;
    let i = s.a;
    while (i < s.b) {
      if (masked.startsWith(cmd, i)) {
        const after = masked[i + cmd.length];
        if (after === undefined || !/[A-Za-z]/.test(after)) {
          const prev = text[i - 1];
          const rep = (/[A-Za-z]/.test(body[0]) && /[A-Za-z]/.test(prev || '') ? ' ' : '') + body;
          edits.push([i, i + cmd.length, rep]);
          i += cmd.length;
          continue;
        }
      }
      i++;
    }
  }
  if (!edits.length) return { text: text, n: 0 };
  let out = '';
  let pos = 0;
  for (const [a, b, rep] of edits) {
    out += text.slice(pos, a) + rep;
    pos = b;
  }
  out += text.slice(pos);
  return { text: out, n: edits.length };
}

const files = fs.readdirSync(ROOT).filter((f) => /^D.*\.md$/.test(f))
  .filter((f) => !PREFIX || f.startsWith(PREFIX)).sort();
const log = [];
let totOps = 0, before = 0, after = 0, filesTouched = 0, noTable = 0, diffFiles = 0;

for (const f of files) {
  const p = path.join(ROOT, f);
  const id = f.match(/^(D\d+)/)[1];
  const tab = TABLES[id];
  let text = fs.readFileSync(p, 'utf8');
  if (text.includes('\r')) { console.log('SKIP-CR ' + f.slice(0, 12)); continue; }
  let r0 = refused(text);
  if (!r0.bad) continue;
  before += r0.bad;
  if (!tab) { noTable++; continue; }
  const defs = tab.defs;
  let cur = text;
  let ops = [];
  for (let round = 0; round < 4; round++) {
    const rr = refused(cur);
    let progressed = false;
    for (const [cmd] of rr.cmds) {
      if (!(cmd in defs)) continue;
      if (defs[cmd].indexOf('\n') >= 0) continue;
      const res = expandAll(cur, cmd, defs[cmd]);
      if (res.n) {
        cur = res.text;
        ops.push([cmd, res.n]);
        progressed = true;
      }
    }
    if (!progressed) break;
  }
  const r1 = refused(cur);
  after += r1.bad;
  if (!ops.length) {
    console.log(f.slice(0, 12) + ' refused=' + r0.bad + ' no defined cmd, left as is');
    continue;
  }
  if (r1.bad >= r0.bad) {
    console.log('REFUSE-NOT-DECREASING ' + f.slice(0, 12) + ' ' + r0.bad + '->' + r1.bad);
    continue;
  }
  if (cur.includes('\r')) {
    console.log('REFUSE-INVARIANT ' + f.slice(0, 12) + ' char="CR"');
    continue;
  }
  // invariants: delimiters and code fences are never touched, and no op may move a line,
  // because every 「第 N 行」 self-reference in the corpus is keyed to the current numbering
  if (cur.split('\n').length !== text.split('\n').length) {
    console.log('REFUSE-INVARIANT ' + f.slice(0, 12) + ' char="newline"');
    ops = [];
  }
  const cnt = (s, ch) => (s.match(new RegExp('[' + ch.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\' + '$&') + ']', 'g')) || []).length;
  for (const ch of [D, BT]) {
    if (cnt(cur, ch) !== cnt(text, ch)) {
      console.log('REFUSE-INVARIANT ' + f.slice(0, 12) + ' char=' + JSON.stringify(ch));
      ops = [];
      break;
    }
  }
  if (!ops.length) continue;
  filesTouched++;
  totOps += ops.reduce((a, e) => a + e[1], 0);
  console.log(f.slice(0, 12) + ' refused ' + r0.bad + '->' + r1.bad +
    ' ops=' + ops.reduce((a, e) => a + e[1], 0) +
    ' bytes ' + Buffer.byteLength(text) + '->' + Buffer.byteLength(cur) +
    ' [' + ops.map((e) => e[0] + 'x' + e[1]).join(' ') + ']');
  if (DIFF && diffFiles < 3) {
    diffFiles++;
    const a = text.split('\n'), b = cur.split('\n');
    let shown = 0;
    console.log('== ' + f);
    for (let k = 0; k < Math.min(a.length, b.length) && shown < 4; k++) {
      if (a[k] !== b[k]) {
        console.log('  -  ' + a[k].slice(0, 110));
        console.log('  +  ' + b[k].slice(0, 110));
        shown++;
      }
    }
  }
  if (APPLY) {
    fs.copyFileSync(p, path.join(WORK, f.slice(0, 12) + '.pre-macro.md'));
    fs.writeFileSync(p, cur);
    log.push(f + '\t' + r0.bad + '\t' + r1.bad + '\t' +
      ops.map((e) => e[0] + 'x' + e[1]).join(' '));
  }
}
if (APPLY && log.length) {
  fs.appendFileSync(path.join(WORK, 'macro_fix_log.txt'),
    new Date().toISOString() + '\n' + log.join('\n') + '\n');
}
console.log('TOTAL files_touched=' + filesTouched + ' ops=' + totOps +
  ' refused ' + before + '->' + after + ' files_without_table=' + noTable +
  (APPLY ? ' APPLIED' : ' dry'));
