// psmallmatrix 这一族的形：KaTeX 0.19 认哪些环境，哪种改法既出括号又保持小字号。
const katex = require('katex');
function probe(label, src) {
  try {
    const html = katex.renderToString(src, { throwOnError: true, displayMode: label.startsWith('DISP') });
    const txt = html.replace(/<[^>]+>/g, '');
    console.log('[OK ] ' + label + '  ink=' + JSON.stringify(txt.slice(0, 60)));
  } catch (e) {
    console.log('[ERR] ' + label + '  ' + e.message.slice(0, 80));
  }
}
const cells = '1&0\\\\0&0';
probe('env psmallmatrix', '\\begin{psmallmatrix}' + cells + '\\end{psmallmatrix}');
probe('env smallmatrix', '\\begin{smallmatrix}' + cells + '\\end{smallmatrix}');
probe('env smallmatrix-nobackslash2', '\\begin{smallmatrix}1&0\\cr0&0\\end{smallmatrix}');
probe('fix left( smallmatrix )', '\\left(\\begin{smallmatrix}' + cells + '\\end{smallmatrix}\\right)');
probe('fix bigl smallmatrix bigr', '\\bigl(\\begin{smallmatrix}' + cells + '\\end{smallmatrix}\\bigr)');
probe('env pmatrix', '\\begin{pmatrix}' + cells + '\\end{pmatrix}');
probe('env bsmallmatrix', '\\begin{bsmallmatrix}' + cells + '\\end{bsmallmatrix}');
probe('env matrix', '\\begin{matrix}' + cells + '\\end{matrix}');
probe('env vmatrix', '\\begin{vmatrix}' + cells + '\\end{vmatrix}');
probe('env pmatrix-star', '\\begin{psmallmatrix*}[r]' + cells + '\\end{psmallmatrix*}');
probe('env smallmatrix ralign', '\\begin{smallmatrix}0&-1\\\\1&0\\end{smallmatrix}');

// 字号差：smallmatrix 走 scriptstyle，pmatrix 走全文字号 —— 页上/渲染上差多大？
function box(src) {
  const html = katex.renderToString(src, { throwOnError: false });
  return html;
}
const a = box('\\begin{smallmatrix}' + cells + '\\end{smallmatrix}');
const b = box('\\begin{pmatrix}' + cells + '\\end{pmatrix}');
console.log('smallmatrix has scriptstyle class:', /size4|scriptsize/.test(a), ' pmatrix:', /size4|scriptsize/.test(b));
console.log('smallmatrix fontsize marks:', JSON.stringify((a.match(/fontsize-\d+/g) || []).join(',')));
console.log('pmatrix     fontsize marks:', JSON.stringify((b.match(/fontsize-\d+/g) || []).join(',')));
