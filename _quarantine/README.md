# 隔离区

这 14 篇的 `main.typ` 正文完整，唯一缺陷是引用的 `fig/*.png` 不在仓库里（共 27 处）。
旧 `.gitignore` 的 `*.png` 把图位图挡在版本库外，上游 `preprints/<name>/build/figures/` 也已为空，
无法重生成，因此它们编译不过、不能混在 `typst/` 的 100% 编译集里。

处理方式：整目录从 `typst/` 移到 `_quarantine/typst/`，`report.json` 保留失败读数，
`MANIFEST.csv` 里标记 `quality=quarantined`、`defect=missing_images`。
恢复条件：在有上游 `build/figures/*.pdf` 的机器上跑 `tools/t2t/convert.py` 的 `prepare_assets`，
生成 `fig/*.png` 后把目录移回 `typst/` 并重跑 `tools/verify_typst.py`。

| 文档 | 字符数 | sha1(main.typ) |
| --- | --- | --- |
| A-Torsion-Free-Counterexample-to-Reduced-Baum-Connes-Injectivity-September-23-2026 | 298686 | 938e990b341b24d7 |
| An-Artin-group-with-no-geometric-CAT-0-action-September-23-2026 | 99019 | 484eed5d0fbc0930 |
| An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026 | 363136 | cacf579e1ebc4348 |
| An-explicit-power-saving-for-the-exact-discrete-Fourier-transform-September-25-2026 | 104411 | 62763dea7d437545 |
| Beyond-the-Square-Root-Exponent-for-Depth-Three-Boolean-Circuits-September-23-2026 | 67591 | a1f687d0327a8c26 |
| Global-Arthur-Enhancements-of-Cuspidal-Excursion-Parameters-October-5-2026 | 261721 | 97da31b0b3348a9a |
| Quantum-Depletion-and-Momentum-Distribution-in-the-Dilute-Hard-Sphere-Bose-Gas-October-5-2026 | 296360 | acccf368b88e0ae4 |
| Quenched-SLE3-Universality-for-the-Weak-Random-Bond-Ising-Model-October-5-2026 | 210022 | 422ee03c7c8bf64a |
| Sharp-one-dimensional-Lieb-Thirring-inequalities-for-matrix-potentials-October-5-2026 | 78246 | 5037554f0a0236ea |
| Squared-logarithmic-randomized-k-server-on-arbitrary-metrics-September-24-2026 | 254279 | f1694be5a254a858 |
| Symplectic-Balls-in-Symmetric-Polar-Products-September-22-2026 | 56458 | e166c8e22b0971ac |
| The-Falconer-distance-conjecture-in-all-dimensions-September-23-2026 | 255064 | 05fea711a4072712 |
| The-spacetime-Penrose-inequality-with-charge-and-original-data-rigidity-October-5-2026 | 367719 | 206207eb2463e015 |
| The-symmetric-Mahler-conjecture-and-its-equality-cases-September-22-2026 | 75828 | 92b357f6b5f4ac0e |

生成方式：`python tools/corpus_audit.py` 之后按 `MANIFEST.csv` 的 quarantined 行重写本表。
