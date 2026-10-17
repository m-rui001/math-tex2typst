// 单串验真：`node _work/one_render.js "<tex>" [display]` — 用全库宏表渲染，打墨或报错第一行。
const katex = require('katex');
const MAC = require('./katex_macros.js').load();
const src = process.argv[2];
try {
  const h = katex.renderToString(src, { throwOnError: true, strict: 'ignore', macros: MAC, displayMode: process.argv[3] === 'display' })
    .replace(/<annotation[\s\S]*?<\/annotation>/g, '').replace(/<[^>]+>/g, '');
  console.log('OK   ink=' + JSON.stringify(h.replace(/−/g, '-').slice(0, 90)));
} catch (e) { console.log('ERR  ' + e.message.split('\n')[0].slice(0, 120)); }
