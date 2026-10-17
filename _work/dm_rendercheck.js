// _work/dm_rendercheck.js — read-only KaTeX validator used by the dollar-family triage.
// stdin: JSON array of {id, body, display?}; stdout: JSONL {id, ok, err}
// Run from the project root:  node _work/dm_rendercheck.js < _work/dm_jobs.json
const katex = require('katex');
const { load: loadMacros } = require('./katex_macros.js');
const MACROS = loadMacros();
let inp = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', (c) => { inp += c; });
process.stdin.on('end', () => {
  const jobs = JSON.parse(inp);
  const out = [];
  for (const j of jobs) {
    let err = null;
    try {
      katex.renderToString(j.body, {
        throwOnError: true, strict: false,
        displayMode: !!j.display, macros: MACROS,
      });
    } catch (e) { err = String(e.message).replace(/ at position.*/, ''); }
    out.push(JSON.stringify({ id: j.id, ok: err === null, err: err, body: j.body }));
  }
  process.stdout.write(out.join('\n') + '\n');
});
