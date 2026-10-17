// -*- coding: utf-8 -*-
// Intake check for a freshly appended section: does the new region still carry shorthands
// that THIS paper's own preamble defines? The macro leg expanded those corpus-wide with
// KaTeX as the credential, so any survivor inside a new batch is a regression of the same
// family, and the expansion string is not a guess -- it is the paper's own definition.
// Usage: node newsec_macro.js D605 414
const fs = require('fs');
const path = require('path');

const B = String.fromCharCode(92);
const NOTES = path.join('E:' + B + B + 'math', '研究笔记');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const key = process.argv[2];
const from = Number(process.argv[3]);
const glob = fs.readdirSync(NOTES).filter((f) => f.startsWith(key + '-'));
if (glob.length !== 1) throw new Error('glob ambiguity ' + glob.length);
const text = fs.readFileSync(path.join(NOTES, glob[0]), 'utf8');
const lines = text.split('\n');
const seg = lines.slice(from - 1).join('\n');
const e = TBL[key];
if (!e) throw new Error('no preamble entry for ' + key);
const hits = [];
for (const [mac, def] of Object.entries(e.defs || {})) {
  // Count only whole-token uses: a control word ends at the first non-letter.
  const re = new RegExp(mac.replace(/[.*+?^${}()|[\]\\]/g, B + '$&') + '(?![A-Za-z])', 'g');
  const n = (seg.match(re) || []).length;
  if (n) hits.push([mac, n, def]);
}
console.log(key + ' from-line ' + from + ' segLines=' + (lines.length - from + 1) +
  ' defs=' + Object.keys(e.defs || {}).length + ' survivors=' + hits.length);
for (const h of hits) console.log('  ' + h[0] + ' x' + h[1] + ' -> ' + h[2]);
console.log('unresolved=' + JSON.stringify(e.unresolved || []));
