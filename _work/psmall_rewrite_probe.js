// 12 站改写后的验真：把 psmallmatrix 换成素材/house 那一形，逐站喂 KaTeX。
// D49 那一站还多一处缺陷：`\mathbf` 掉了反斜杠，正文里印成字母 mathbf。
const fs = require('fs');
const katex = require('katex');
const B = String.fromCharCode(92);
const bodies = JSON.parse(fs.readFileSync('_work/psmall_bodies.json', 'utf8'));

function fixEnv(b) {
  return b
    .split('{psmallmatrix}').join('{smallmatrix}')
    .split(B + 'begin{smallmatrix}').join(B + 'left(' + B + 'begin{smallmatrix}')
    .split(B + 'end{smallmatrix}').join(B + 'end{smallmatrix}' + B + 'right)');
}

for (const r of bodies) {
  const old = r.body;
  let cur = fixEnv(old);
  const trial = [];
  try {
    katex.renderToString(cur, { throwOnError: true });
    trial.push('REWRITES-OK');
  } catch (e) {
    trial.push('ERR:' + e.message.slice(0, 70));
  }
  // D49 的 mathbf 掉反斜杠：整段里 `\\\\mathbf`（行分隔后紧跟裸词）验两种补法
  if (old.indexOf('mathbf') >= 0 && old.indexOf(B + B + 'mathbf') >= 0) {
    const v1 = cur.replace(B + B + 'mathbf 1', B + B + B + 'mathbf 1');
    const v2 = cur.replace(B + B + 'mathbf 1', B + B + B + 'mathbf{1}');
    for (const [k, v] of [[B + 'mathbf 1', v1], [B + 'mathbf{1}', v2]]) {
      try {
        const h = katex.renderToString(v, { throwOnError: true }).replace(/<[^>]+>/g, '');
        console.log('   cand ' + k + ' RENDERS ink=' + JSON.stringify(h.slice(0, 40)));
      } catch (e) {
        console.log('   cand ' + k + ' ERR ' + e.message.slice(0, 60));
      }
    }
    // 裸 mathbf（当前正文形）到底印出什么
    const raw = katex.renderToString(cur, { throwOnError: false }).replace(/<[^>]+>/g, '');
    console.log('   AS-IS ink=' + JSON.stringify(raw.slice(0, 50)));
  }
  console.log(r.file.slice(0, 4) + ':' + r.line + '  ' + trial.join(' ') + '  ->  ' + cur);
}
