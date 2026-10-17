// `Expected '}', got 'EOF'` 8 站候选修法的验真：整跨喂 KaTeX（throwOnError），
// D16 那一形先问「中文能不能待在 \text{} 里」。
const katex = require('katex');
const B = String.fromCharCode(92);
function tryR(label, src) {
  try {
    const h = katex.renderToString(src, { throwOnError: true })
      .replace(/<annotation[\s\S]*?<\/annotation>/g, '').replace(/<[^>]+>/g, '');
    console.log('[OK ] ' + label + '  ink=' + JSON.stringify(h.replace(/−/g, '-').slice(0, 48)));
  } catch (e) { console.log('[ERR] ' + label + '  ' + e.message.slice(0, 78)); }
}

console.log('--- D16:303  正文写作 `$' + B + 'sup_{h' + B + 'in$ 紧区间$' + B + '$}`：两半跨');
tryR('修前 前半跨', B + 'sup_{h' + B + 'in');
tryR('修前 后半跨', B + '}');
tryR('修法 A（合跨，中文进 text）', B + 'sup_{h' + B + 'in' + B + 'text{ 紧区间}}');
tryR('修法 B（同 A，无前置空格）', B + 'sup_{h' + B + 'in' + B + 'text{紧区间}}');
tryR('修法 C（operatorname）', B + 'sup_{h' + B + 'in' + B + 'operatorname{紧区间}}');

console.log('--- 其余各站：修前 vs 修法');
const CASES = [
  ['D335 修前', B + 'quad Z_*e^{-1.2D'],
  ['D335 修法', B + 'quad Z_*e^{-1.2D}'],
  ['D402 修前', 'Dx_{ij}(y)D^{-1}=x_{ij(byb^{-1})'],
  ['D402 修法', 'Dx_{ij}(y)D^{-1}=x_{ij}(byb^{-1})'],
  ['D490 修前', 'Z(t)' + B + 'le Z(r)+' + B + 'int_r^t(C_2Z(s)/(s+s_N)+C_{A,' + B + 'delta}s^{A-1))' + B + ',' + B + 'mathrm ds'],
  ['D490 修法', 'Z(t)' + B + 'le Z(r)+' + B + 'int_r^t(C_2Z(s)/(s+s_N)+C_{A,' + B + 'delta}s^{A-1})' + B + ',' + B + 'mathrm ds'],
  ['D500 修前', 'B^{-1-c_{*}/2)'],
  ['D500 修法', 'B^{-1-c_{*}/2}'],
  ['D762 修前', 'n^{-5/6+15m'],
  ['D762 修法', 'n^{-5/6+15m}'],
  ['D765 修前', B + '(H_j-(P_j^{' + B + 'mathrm{eu})^{-1}' + B + 'mathcal L_Q(b)' + B + '|_2'],
  ['D765 修法', B + '(H_j-(P_j^{' + B + 'mathrm{eu}})^{-1}' + B + 'mathcal L_Q(b)' + B + '|_2'],
];
for (const [label, src] of CASES) tryR(label, src);
