"""Refresh aggregate reports and create a clickable paper index."""
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'typst'


def main():
    reports = []
    for path in sorted(OUT.glob('*/report.json')):
        report = json.loads(path.read_text(encoding='utf-8'))
        paper = path.parent
        report['typ_path'] = str(paper / 'main.typ')
        report['pdf_path'] = str(paper / 'main.pdf') if report.get('compile_ok') else None
        if report.get('compile_ok'):
            assert (paper / 'main.typ').exists() and (paper / 'main.pdf').exists(), paper
        reports.append(report)
    (OUT / 'batch-report.json').write_text(json.dumps(reports, ensure_ascii=False, indent=2), encoding='utf-8')
    total = sum(r.get('formulas', 0) for r in reports)
    failed = sum(r.get('math_failed', 0) for r in reports)
    summary = {
        'documents': len(reports),
        'compiled': sum(bool(r.get('compile_ok')) for r in reports),
        'unique_formulas_within_documents': total,
        'native_formulas_reported': total - failed,
        'latex_formula_fallbacks': failed,
        'latex_literals_remaining': sum(r.get('latex_literals_remaining', 0) for r in reports),
        'documents_with_formula_fallbacks': sum(bool(r.get('math_failed')) for r in reports),
        'documents_with_unhandled_figure_content': sum(bool(r.get('stats', {}).get('figure_content_unhandled')) for r in reports),
        'documents_with_unresolved_references': sum(bool(r.get('stats', {}).get('dangling_ref')) for r in reports),
        'failed_documents': [r['paper'] for r in reports if not r.get('compile_ok')],
    }
    (OUT / 'summary.json').write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding='utf-8')
    lines = ['# LaTeX → Typst 转换结果', '',
             f"文档：{len(reports)}；编译通过：{summary['compiled']}。", '',
             f"按每篇去重的 Math 条目：{total}；报告中的转换回退：{failed}；最终源码中显式保留的 LaTeX 数学字串：{summary['latex_literals_remaining']}。", '',
             '每篇 main.typ 是可编辑源码，main.pdf 是编译结果，report.json 包含转换诊断。分节 TeX 已合并进对应主文档；备用入口和独立文档单独输出。', '',
             '## 转换范围与限制', '',
             '- 保留原语言；本次不进行翻译。',
             '- 无法转换的公式保留 LaTeX 文本，不冒充原生公式。',
             '- 外部 PDF 插图以页面位图保留；PDF 拼接封装文档按原 PDF 页面保留。',
             '- TikZ、picture 等源码图尚未全部重绘；诊断列列出这些降级情况。',
             '- 源文件缺失的文献或未解析的交叉引用保留引用键；请结合原文核对。',
             '- 编译通过不代表数学内容、全部编号和每页版面已逐项校验；已对三篇代表篇进行抽查。', '',
             '## 文档索引', '',
             '| 文档 | Typst | PDF | Math 条目 / 最终 LaTeX 字串 | 其他诊断 |',
             '| --- | --- | --- | --- | --- |']
    for r in reports:
        folder = OUT / r['paper']
        rel = r['paper'] + '/'
        typ = '[源码](<' + rel + 'main.typ>)' if (folder / 'main.typ').exists() else '—'
        pdf = '[PDF](<' + rel + 'main.pdf>)' if r.get('compile_ok') else '**编译失败**'
        notes = []
        counts = r.get('stats', {})
        for key, label in [('figure_content_unhandled', '图待重绘'), ('dangling_ref', '引用待核对'), ('missing_bibkey', '文献键缺失'), ('unhandled_rawblock', '原始块')]:
            if counts.get(key):
                notes.append(label + ' ' + str(counts[key]))
        if r.get('included_pdf_pages'):
            notes.append('PDF 页面保留 ' + str(r['included_pdf_pages']))
        notes.append('[报告](<' + rel + 'report.json>)')
        lines.append(f"| {r['paper']} | {typ} | {pdf} | {r.get('formulas',0)} / {r.get('latex_literals_remaining',r.get('math_failed',0))} | {'；'.join(notes)} |")
    (OUT / 'INDEX.md').write_text('\n'.join(lines) + '\n', encoding='utf-8')
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
