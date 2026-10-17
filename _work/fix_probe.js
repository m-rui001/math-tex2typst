// 通用修法验真尺。用法：node _work/fix_probe.js <规格json> <sites台账jsonl>
// 逐单：从台账取该站的整跨（逐字），先喂修前（应当 ERR），再对跨做 old→new 定点替换后喂（应当 OK），
// 并打印渲染墨的前 60 字，供「只错墨不报错」型第二缺陷肉眼复核。
// 规格里 level 不是 "body" 的单，改的是跨度外的定界符或**跨度配对本身**，跨内没有这一串，本尺看不见＝跳过并申报：
// delim 那几单由 _work/delim_probe.py 的定界符账那一格判真，grammar 那几单由 _work/span_grammar_probe.js
// （用 dm_lib 同一套语法在内存里重算全篇跨度）判真；code 那几单坐在代码跨度里，两把尺都不渲染它，
// 凭据只能是素材原文逐字对照（fix_verify 只保证落盘后新旧形各就各位）。
const fs = require('fs');
const katex = require('katex');
const MAC = require('./katex_macros.js').load();

const SPEC = process.argv[2] || '_work/dbl_fix.json';
const LEDGER = process.argv[3] || '_work/dollarmath_sites19.jsonl';
const fixes = JSON.parse(fs.readFileSync(SPEC, 'utf8'));
const rows = fs.readFileSync(LEDGER, 'utf8').split('\n').filter(s => s.trim()).map(s => JSON.parse(s));

function render(src, display) {
  try {
    const h = katex.renderToString(src, { throwOnError: true, strict: 'ignore', macros: MAC, displayMode: !!display })
      .replace(/<annotation[\s\S]*?<\/annotation>/g, '').replace(/<[^>]+>/g, '');
    return { ok: true, ink: h.replace(/−/g, '-').slice(0, 60) };
  } catch (e) { return { ok: false, err: e.message.split('\n')[0].slice(0, 76) }; }
}

let bad = 0, skipped = 0;
for (const f of fixes) {
  if (f.level && f.level !== 'body') {
    console.log('\n=== ' + f.cid + ':' + f.line + '  level=' + f.level +
      '  本尺跳过（delim 由 delim_probe、grammar 由 span_grammar_probe、code 由素材逐字对照判）  ' + f.cred);
    skipped++;
    continue;
  }
  const r = rows.find(x => x.file.startsWith(f.cid + '-') && x.line === f.line);
  if (!r) { console.log('[NO-ROW] ' + f.cid + ':' + f.line); bad++; continue; }
  const hits = r.body.split(f.old).length - 1;
  console.log('\n=== ' + f.cid + ':' + f.line + '  kind=' + r.kind + '  跨内命中=' + hits + '（规格期望 ' + f.expect + '）  ' + f.cred);
  if (hits === 0) { console.log('  !! old 不在这一跨里，规格要带跨内串'); bad++; continue; }
  const a = render(r.body, r.kind === 'DISPLAY');
  const b = render(r.body.split(f.old).join(f.new), r.kind === 'DISPLAY');
  console.log('  修前 ' + (a.ok ? '!! 竟然 RENDERS（本站不属于这族？）' : 'ERR  ' + a.err));
  console.log('  修法 ' + (b.ok ? 'OK   ink=' + JSON.stringify(b.ink) : '!! 仍 ERR  ' + b.err));
  if (!b.ok || (a.ok && hits)) bad++;
}
console.log('\n规格 ' + fixes.length + ' 单（本尺判 ' + (fixes.length - skipped) + '、跳过 ' + skipped + '），异常 ' + bad);
