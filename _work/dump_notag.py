import pathlib
import pymupdf

txt = pymupdf.open(str(pathlib.Path(__file__).with_name("notag_probe.pdf")))[0].get_text()
pathlib.Path(__file__).with_name("notag_probe.rendered.txt").write_text(txt, encoding="utf-8")
