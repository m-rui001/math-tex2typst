// 单跨度诊断：把嫌疑 span 逐段剥开，找第一个 KaTeX 不吃的位置
const katex = require(process.env.KATEX_PATH || 'katex');
const bodies = [
  "\\mathcal{D}_{\\operatorname{X}}=\\mathcal{D}_{\\operatorname{X},\\overline{\\mathbf{G}}}\\colon \\mathbf{Sch}_{\\operatorname{k}}^{\\mathrm{op}}\\to \\Set",
  "\\widehat{\\mathcal{D}}_{X}\\colon \\mathbf{Sch}_{\\operatorname{k}}^{\\mathrm{op}}\\to \\Set",
  "\\mathbf{Sch}_{\\operatorname{k}}^{\\mathrm{op}}\\to \\Set",
  "x \\to \\Set",
  "\\Set",
  "\\mathcal{D}_{\\operatorname{X},\\overline{\\mathbf{G}}}",
  "\\mathbf{Sch}_{\\operatorname{k}}^{\\mathrm{op}}",
];
for (const b of bodies) {
  try { katex.renderToString(b, { throwOnError: true }); console.log('OK   ', b.slice(0, 60)); }
  catch (e) { console.log('FAIL ', b.slice(0, 60), '|', String(e.message).slice(0, 110)); }
}
