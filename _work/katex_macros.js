// Compile the corpus macro schema (_work/katex_macros.json) into a KaTeX macros object.
// Every entry becomes a NATIVE string macro, `#1`..`#9` and all. The hand-rolled
// alternative -- ctx.consumeArgs(n) plus a string join -- silently reverses the argument's
// token stream in KaTeX 0.19.0, so `\norm{\mathbb E_{\mu}x}` was expanded as
// `\Vert }x_{\mu{\mathbb E\Vert` and the census charged the NOTE with a stray brace
// (`Expected 'EOF', got '}'`) that only our own expander produced. The array form
// ["body", n] is still unusable: it crashes with "tokens is not iterable".
const fs = require('fs');
const path = require('path');
const B = String.fromCharCode(92);
const WORK = path.join('E:' + B + B + 'math', '_work');

function compile(schema) {
  const macros = {};
  for (const key of Object.keys(schema)) macros[key] = schema[key].tex;
  return macros;
}

function load() {
  try {
    return compile(JSON.parse(fs.readFileSync(path.join(WORK, 'katex_macros.json'), 'utf8')));
  } catch (e) {
    return {};
  }
}

module.exports = { load, compile };
