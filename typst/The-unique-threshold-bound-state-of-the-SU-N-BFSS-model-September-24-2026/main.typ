#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: false), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)
#show figure.where(kind: table): set block(breakable: true)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[The unique threshold bound state of \
the $"SU" \( N \)$ BFSS model]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Supersymmetric matrix quantum mechanics appears in the regularization of supermembranes #cite(label("DeWitHoppeNicolai1988")) Section 3 and in the matrix-theory conjecture of Banks, Fischler, Shenker, and Susskind #cite(label("BFSS1997")). The model studied here describes nine Hermitian matrices and their fermionic partners. Its commuting configurations form noncompact flat directions. The D0-brane bound-state prediction of Witten #cite(label("Witten1996BoundStates")) Section 4.2, subsequently central to matrix theory, is that after removing the free center of mass every finite matrix size has exactly one normalizable state of zero energy. We prove this threshold-bound-state conjecture for the $"SU" \( N \)$ model on its full configuration space. In the matrix-theory interpretation, this relative bound state supplies the internal state of a single supergraviton carrying $N$ units of longitudinal momentum #cite(label("BFSS1997")) Section 5. The continuous spectrum starts at zero #cite(label("DeWitLuscherNicolai1989")), so the proposed eigenstate lies at its threshold rather than below a gapped continuum.

=== 1.1 The operator and the result <sec:model>

Fix an integer $N gt.eq 2$ and put $d_N = N^2 - 1$. Choose a traceless Hermitian basis $T_A$, $1 lt.eq A lt.eq d_N$, with

$ "Tr" \( T_A T_B \) = delta_(A B) \, #h(2em) T_A T_B - T_B T_A = upright(i) f_(A B C) T_C . $

Repeated indices are summed unless stated otherwise. The bosonic coordinates and momenta are

$ X_i = x_i^A T_A \, #h(2em) p_i^A = - upright(i) frac(partial, partial x_i^A) \, #h(2em) 1 lt.eq i lt.eq 9 . $

Let $cal(F)_N$ be an irreducible complex Clifford module with self-adjoint generators $theta_alpha^A$, $1 lt.eq alpha lt.eq 16$, satisfying

$ { theta_alpha^A \, theta_beta^B } = delta_(alpha beta) delta_(A B) . $

Choose real symmetric $16 times 16$ matrices $gamma^i$ with ${ gamma^i \, gamma^j } = 2 delta_(i j) upright("Id")$, and set $gamma^(i j) = \[ gamma^i \, gamma^j \] \/ 2$, where the bracket in this formula is the ordinary matrix commutator. The sixteen supercharges on smooth compactly supported functions are

#[#set math.equation(numbering: n => "(1.1)")
 $ Q_alpha = p_i^A gamma_(alpha beta)^i theta_beta^A + 1 / 2 f_(A B C) x_i^B x_j^C gamma_(alpha beta)^(i j) theta_beta^A . $ <eq:model-charge>]

The physical Hilbert space is

$ cal(H)_N = #scale(x: 120%, y: 120%)[\[] L^2 \( bb(R)^(9 d_N) \) ⊗ cal(F)_N #scale(x: 120%, y: 120%)[\]]^("SU" \( N \)) \, $

with the simultaneous adjoint action on bosons and fermions. Let $H_N$ be the nonnegative self-adjoint operator associated with the closure of the quadratic form

#[#set math.equation(numbering: n => "(1.2)")
 $ q_N \( Psi \) = 1 / 16 sum_(alpha = 1)^16 ∥Q_alpha Psi∥^2 $ <eq:model-form>]

on the gauge-invariant compactly supported smooth core. This fixes the coupling and the operator domain used throughout the paper. We use the exterior grading for the polarization $T = gamma^1 gamma^2 gamma^3$, declaring its empty vector even and choosing that vector to minimize $upright(i) theta^t T theta \/ 2$. Section 2 describes the associated symmetry actions.

#thm([Theorem 1.1.])[
  #emph[For every integer $N gt.eq 2$, 
$ dim ker H_N = 1 . $

 The kernel consists of $"Spin" \( 9 \)$-invariant states and is even in the fermion grading just specified.]
] <thm:main>

All square integrability in Theorem 1 is on the whole space $bb(R)^(9 d_N)$. Constants in the proof may depend on the fixed integer $N$. The free $"U" \( 1 \)$ center-of-mass coordinates do not occur in $cal(H)_N$.

=== 1.2 History and the analytic issue <history-and-the-analytic-issue>

The supersymmetric index counts even and odd zero modes with opposite signs #cite(label("Witten1982Index")). In the present noncompact problem, contributions from infinity are essential. Yi #cite(label("Yi1997")) computed the $"SU" \( 2 \)$ bulk term and proposed a free-particle argument for its boundary correction; Sethi–Stern #cite(label("SethiStern1998")) obtained the two-particle index by including its boundary term. Moore–Nekrasov–Shatashvili #cite(label("MNS2000")) computed the matrix integrals entering the principal contribution. Green–Gutperle #cite(label("GreenGutperle1998")) Section 5 argued that corrections from free identical clusters account for the divisor sum, assuming the free-cluster boundary prescription extends to general $N$. Konechny #cite(label("Konechny1999")) Sections 3 and 5 derived a free leading asymptotic Hamiltonian and used it to conclude that the full $"SU" \( N \)$ index equals one. His expansion assumes that the eigenvalue differences of one diagonalized matrix grow at the same order. Our proof will control also the degenerating and nested cluster regions through explicit norm estimates.

A signed count becomes a dimension count once odd normalizable ground states are excluded. Sethi–Stern #cite(label("SethiStern2000")) Sections 3.2 and 4.2 proved rotational invariance of normalizable ground states of ten-dimensional reductions. Hasler–Hoppe #cite(label("HaslerHoppe2002")) Theorem 1(a) and Lemma 2(c) gave a direct rotation anticommutator and cutoff proof on the full physical Hilbert space. In the fermion representation used here, singletness implies even parity. Section 2 reproduces these arguments in our normalization and fixes the closed operator domains. The recent lectures of Lin #cite(label("Lin2026v3")) Section 3.1 describe the finite-$N$ spectral picture and distinguish the two-particle uniqueness consequence from the general conjecture.

Asymptotic wavefunction analysis supplies a second important line of work. Halpern–Schwartz #cite(label("HalpernSchwartz1998")) developed a generalized Born–Oppenheimer search for $"SU" \( 2 \)$ candidates. Graf–Hoppe #cite(label("GrafHoppe1998")) computed the leading and subleading $"SU" \( 2 \)$ asymptotics, and Fröhlich–Graf–Hasler–Hoppe–Yau #cite(label("FroehlichEtAl2000")) Section 3 classified the corresponding invariant formal supercharge expansions at infinity. For general rank, Hasler–Hoppe #cite(label("HaslerHoppeFactorization2002")) pp. 2–5 conjugated the charge by the slice density, projected onto its transverse oscillator ground state, and obtained the leading free Cartan charge. Their cancellation of the gauge-spin and density terms is a direct predecessor of the computation in Section 4. Lin–Yin #cite(label("LinYin2015")) Sections 3.2 and 4 developed a recursive cluster-factorization proposal and its first inverse-oscillator correction. These asymptotic constructions motivate the local objects used below; a global normalizable state additionally requires control of every cluster scale and of all limiting norm.

Mass deformation offers a finite count from which to approach that global problem. Porrati–Rozenberg #cite(label("PorratiRozenberg1998")) formulated a deformation criterion with explicit normalizability requirements on weighted representatives. Kac–Smilga #cite(label("KacSmilga2000")) counted mass-deformed vacua and identified persistence of normalizability at zero mass as the remaining hypothesis. We use the completely confining plane-wave deformation of Berenstein–Maldacena–Nastase #cite(label("BMN2002")). Its classical zero orbits are indexed by integer partitions of $N$. Dasgupta–Sheikh-Jabbari–Van Raamsdonk #cite(label("DasguptaSheikhJabbariVanRaamsdonk2002")) computed the quadratic fluctuation spectra around the reducible as well as irreducible vacua. Section 3 rederives these frequencies and proves the stabilizer, domain, and norm-exhaustion statements needed for the index of our specified invariant charge. Chang’s refined BMN index #cite(label("Chang2025")) Section 2.2 also records signed contributions from states with nonzero angular momentum. The count below is the Fredholm index of a real charge on a specified invariant subspace.

The operator domain must remain fixed throughout this comparison. Boulton–García del Moral–Restuccia #cite(label("Boulton2021")) Sections 5–6 establish existence and uniqueness for a valley boundary-value problem with admissible prescribed trace. The realization with zero boundary trace has trivial kernel, while the solutions with prescribed nonzero trace need not be killed by the supercharges. That problem therefore concerns a different realization from (1.2).

The task addressed here is the passage from a massive Fredholm count to the complete $L^2$ kernel of the undeformed full-space operator. The local oscillator projections and fast-inverse corrections are proved with graph-norm bounds near arbitrary proper clusters. An exterior estimate, established simultaneously with the kernel statement, excludes norm at intermediate internal scales. Together with massive confinement, it accounts for every limiting norm and inner product. This is the information that permits the final unsigned dimension comparison.

=== 1.3 The proof and its compactness mechanism <the-proof-and-its-compactness-mechanism>

Write $cal(K)_n = ker H_n$ and set $cal(K)_1 = bb(C)$. The proof compares $cal(K)_N$ with a massive problem whose index is the partition number $p \( N \)$, the number of unordered integer partitions of $N$. Two different uses of partitions enter this comparison. At small coupling, they label the massive classical vacuum orbits. In the limiting cluster decomposition, a proper partition $C = \( n_1 \, dots.h \, n_k \)$, $k gt.eq 2$, specifies the sizes of separated commuting blocks. Their distinct centers $c_alpha in bb(R)^9$ satisfy $sum_alpha n_alpha c_alpha = 0$. A #emph[cluster profile] is a wavefunction of these relative centers, with their fermions and with values in $⨂_alpha cal(K)_(n_alpha)$.

For the dimension comparison, we study profiles of normalized massive states whose charge norms tend to zero; we call these null profiles. The proper partitions will contribute $p \( N \) - 1$ lines of null profiles, while a full-collapse profile takes values in $cal(K)_N$. The comparison uses norm-preserving extraction for existence, and recovery of prescribed profiles together with a massive spectral gap for uniqueness.

===== 1.3.1 The massive count. <the-massive-count.>

We write $D_v \( h \, m \)$ for the deformed charge paired with a real unit spinor $v$, where $h > 0$ multiplies the commutator term and $m gt.eq 0$ multiplies the linear mass term. Thus $D_v \( 1 \, 0 \) = sum_alpha v_alpha Q_alpha$. Section 2 chooses a spinor $u$ and a connected fixing torus $G$ so that, on gauge and $G$ invariants,

$ D_u \( h \, m \)^2 gt.eq 2 / 3 cal(H) \( h \, m \) \, $

where $cal(H)$ is the averaged squared charge. At fixed positive mass, the restricted charge is Fredholm. Section 3 computes its index as $p \( N \)$ in the limit $h arrow.b 0$ and proves constancy for all $h > 0$.

We then study $h arrow.r oo$ at mass one. The unitary change of variables $y = h^(1 \/ 3) x$ sends $D_v \( h \, 1 \)$ to $h^(1 \/ 3) D_v \( 1 \, h^(- 2 \/ 3) \)$, so this limit is a massless limit at the original coupling. Internal block states shrink on the physical scale $h^(- 1 \/ 3)$, while their relative centers remain on scale one.

===== 1.3.2 Local profiles and their equations. <local-profiles-and-their-equations.>

Near distinct block centers, a spectral slice separates the block variables $b$ from the off-block variables. After rescaling the latter, Section 4 gives the exact decomposition

$ D_v \( h \, m \) = sqrt(h) thin E_v \( b \) + D_v^s \( h \, m \) + R_v . $

Here $E_v$ acts on the transverse variables and their fermions, $D_v^s$ is the charge of the block variables, and $R_v$ collects the remaining slice terms. On the fast space fixed by the block-center gauge torus, $E_v$ has an even one-dimensional kernel and a local oscillator gap. A first-order estimate then forces bounded graph-norm sequences onto this line. In the scalar-block limit, compressing the charge onto this line gives the ordinary slow charge: the gauge-spin term cancels the derivative of the slice density.

To pass the charge equation to a profile, we need more than concentration of the state. Section 5 constructs test states whose charge outputs converge in norm. A correction obtained from the reduced fast inverse cancels the perpendicular charge output of the leading oscillator product. Duality then identifies the center equation of each profile. Fixed physical cutoffs and $L^2$ concentration make these constructions available without moment bounds on the internal kernels.

===== 1.3.3 Capturing every concentration scale. <capturing-every-concentration-scale.>

Local profiles leave a possible loss of norm between the internal scale $h^(- 1 \/ 3)$ and a vanishing physical radius. Section 6 excludes that loss by proving, simultaneously with Theorem 1, the exterior estimate

#[#set math.equation(numbering: n => "(1.3)")
 $ ∥r D_u \( h \, 0 \) F∥ gt.eq c_N ∥∥ F \, #h(2em) "supp" F subset { h^(1 \/ 3) r > R_N } \, #h(2em) r = \| x \| . $ <eq:intro-exterior>]

It applies to compactly supported gauge-invariant vectors in the charge graph domain, without a rotation restriction. The smaller-block estimates make proper-cluster profiles account for all norm on a compact annulus. Their center spaces have dimensions $9 \( k - 1 \) gt.eq 9$, so the Euclidean Hardy inequality gives the exterior estimate at the current size. Only after this step do we extract the whole-block profile at the origin. The induction therefore uses no prior existence or dimension statement for $cal(K)_N$.

Section 7 proves a separate massive annular estimate that prevents escape to infinity. The resulting decomposition preserves all limiting norms and inner products. Each proper null profile has the unique even massive center-oscillator vacuum as its center factor. Induction on the internal blocks and the permutation symmetries then give one line for each of the $p \( N \) - 1$ proper partitions. Every null profile is even: Proposition 6 proves this for $cal(K)_N$ before its dimension is known. Consequently odd massive states have a uniform charge gap at large $h$. Spectral pairing gives the same gap on the even complement of the massive kernel, and the index becomes the exact massive dimension $p \( N \)$. Extracting these $p \( N \)$ directions forces a nonzero whole-block profile. Conversely, recovering any finite orthonormal whole-block list along with the $p \( N \) - 1$ proper lines and projecting through the gap bounds that list by one. This closes the induction.

Figure 1 records this order of dependencies.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Induction input for $2 lt.eq n<N$:#linebreak()$dim cal(K)_n=1$ and exterior estimate $E_n$]]])])
  content((0, -1.757), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Proper-cluster profiles capture all norm#linebreak()on compact annuli; corrected tests give center charges]]])])
  content((0, -3.523), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ededff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Hardy inequality in dimension $9(k-1) gt.eq 9$:#linebreak()establish the current exterior estimate $E_N$]]])])
  content((0, -5.288), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Capture the full-collapse profile in $cal(K)_N$#linebreak()kernel nontriviality and dimension remain unknown]]])])
  content((0, -7.052), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Exhaustion of norms and inner products;#linebreak()every limiting null profile is even]]])])
  content((0, -8.825), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Odd gap and spectral pairing;#linebreak()massive kernel has dimension $p(N)$]]])])
  content((0, -10.8), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$p(N)-1$ proper profile lines;#linebreak()extraction gives existence;#linebreak()recovery and the gap give uniqueness]]])])
  content((0, -12.57), [#box(width: 7.994cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ededff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Induction output: $E_N$ and $dim cal(K)_N=1$]]])])
  content((7.473, -1.757), [#box(width: 5.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Local fast analysis and#linebreak()corrected test lifts#linebreak()\(Sections~4--5\)]]])])
  content((7.473, -5.288), [#box(width: 5.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Massive annular confinement#linebreak()prevents escape to infinity#linebreak()\(Proposition~7.1\)]]])])
  content((7.473, -7.052), [#box(width: 5.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Current-size singlet and parity#linebreak()\(Proposition~2.5\),#linebreak()$dim cal(K)_N$ unrestricted]]])])
  content((7.473, -8.825), [#box(width: 5.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Independent massive#linebreak()Fredholm index $p(N)$#linebreak()\(Proposition~3.1\)]]])])
  line((0, -0.575), (0, -1.175), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((0, -2.339), (0, -2.939), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((0, -4.107), (0, -4.707), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((0, -5.87), (0, -6.47), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((0, -7.634), (0, -8.234), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((0, -9.416), (0, -10.02), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((0, -11.59), (0, -12.19), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((4.897, -1.757), (3.997, -1.757), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((7.473, -2.402), (7.473, -4.644), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((4.897, -5.288), (4.597, -5.288), (4.597, -7.052), (3.997, -7.052), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((4.897, -7.052), (3.997, -7.052), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((4.897, -8.825), (3.997, -8.825), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
})],
  caption: [Figure 1: The simultaneous induction. Here $cal(K)_n = ker H_n$ and $E_n$ is Proposition 22 at size $n$. The highlighted exterior step is completed before full collapse is used. Massive confinement follows independently from the local growing-mass estimates, and the index is computed independently at small coupling. At $N = 2$ all proper blocks are scalar, so the induction input is empty. ],
) <fig:induction>

== 2 The charge algebra, domains, and rotational invariance <sec:algebra>

We establish the operator framework needed for the index and limiting arguments: closed charge domains, a charge coercive on a chosen space of torus invariants, and even rotationally invariant undeformed kernel vectors.

We use the real Euclidean space $frak(k)$ of traceless Hermitian matrices, with scalar product $"Tr" \( X Y \)$ and real Lie bracket $\[ X \, Y \] = \( X Y - Y X \) \/ upright(i)$. Thus $"ad" \( X \)$ is a real skew matrix on $frak(k)$. Uppercase Roman indices denote an orthonormal color basis and Greek indices denote spinor components; $i \, j = 1 \, dots.h \, 9$, $a \, b \, c = 1 \, 2 \, 3$, and $d = 4 \, dots.h \, 9$ are spatial indices. For $w in bb(R)^16$ and $z in frak(k)$, write $theta \( w \) dot.op z = sum_(alpha \, A) theta_alpha^A w_alpha z^A$. All Clifford tensor products are graded tensor products.

Set

$ T = gamma^1 gamma^2 gamma^3 \, #h(2em) s_a = 2 \, quad s_d = - 1 \, #h(2em) A_i \( v \) = gamma^i v \, quad B_(i j) \( v \) = - gamma^(i j) v \, quad L_i \( v \) = s_i gamma^i T v . $

Here $T^t = - T$, $T^2 = - upright("Id")$, and $T$ commutes with the first three gamma matrices and anticommutes with the other six. For a unit real spinor $v$, coupling $h > 0$, and mass $m gt.eq 0$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ D_v \( h \, m \) & = sum_i theta \( A_i \( v \) \) dot.op p_i + h sum_(i < j) theta \( B_(i j) \( v \) \) dot.op \[ x_i \, x_j \] + m sum_i theta \( L_i \( v \) \) dot.op x_i \,\
cal(H) \( h \, m \) & = 1 / 16 sum_(nu = 1)^16 D_(v_nu) \( h \, m \)^2 . $ <eq:deformed-charge>]

The second expression initially denotes a quadratic form on the gauge-invariant smooth compactly supported core; $\( v_nu \)$ is any orthonormal real spin basis. Its closure will have the same notation. The minus sign in $B_(i j)$ is the transpose sign in $\( gamma^(i j) \)^t = - gamma^(i j)$, so $D_v \( 1 \, 0 \)$ is exactly the linear combination of the charges in (1.1) with coefficients $v$.

For a real skew spatial matrix $F$, use the rotation conventions

#[#set math.equation(numbering: n => "(2.2)")
 $ S \( F \) = 1 / 4 sum_(i \, j) F_(i j) gamma^i gamma^j \, #h(2em) J \( F \) = p dot.op F x + upright(i) / 2 theta^t S \( F \) theta . $ <alg:rotation-generator>]

The color identity in the second term is implicit. In particular, $J$ includes both orbital and spin rotations. Gauge invariance means equivariance of the Clifford-valued function, rather than invariance of its scalar coordinate dependence alone. Infinitesimally this gives

#[#set math.equation(numbering: n => "(2.3)")
 $ p dot.op "ad" \( w \) x = - upright(i) / 2 theta^t "ad" \( w \) theta quad upright("on gauge-invariant functions") \, #h(2em) w in frak(k) . $ <alg:gauge-generator>]

#thm([Proposition 2.1.])[
  (Square of a charge).  #emph[On the gauge-invariant core, 
#[#set math.equation(numbering: n => "(2.4)")
 $ cal(H) \( h \, m \) & = 1 / 2 p^2 + U_(h \, m) + upright(i) / 2 theta^t (3 / 2 m T - h K_j gamma^j) theta \, #h(2em) K_j = "ad" \( x_j \) \,\
2 U_(h \, m) & = sum_(upright("cyc")) lr(|h \[ x_a \, x_b \] - 2 m x_c|)^2 + h^2 sum_(i < j\
j > 3) lr(|\[ x_i \, x_j \]|)^2 + m^2 sum_(d = 4)^9 lr(|x_d|)^2 \,\
D_v \( h \, m \)^2 & = cal(H) \( h \, m \) + m J \( R \( v \) \) \, #h(2em) R \( v \)_(i j) = s_j v^t gamma^i gamma^j T v . $ <eq:square>]

 The cyclic sum uses $\( a \, b \, c \) = \( 1 \, 2 \, 3 \) \, \( 2 \, 3 \, 1 \) \, \( 3 \, 1 \, 2 \)$. The matrix $R \( v \)$ is skew, preserves $bb(R)^3 xor bb(R)^6$, and has zero spin-basis average. The same formulas hold for an orthogonal direct sum of compact color algebras and abelian color spaces.]
] <prop:square>

#proof[
  #emph[The massless square.] We first compute the kinetic and commutator contributions, including the gauge cancellation. For a strictly increasing multi-index $I$, let $gamma^I$ denote the corresponding ordered gamma product. The products of ranks zero through four form an orthogonal basis of the real $16$-by-$16$ matrices, for the trace scalar product. Indeed there are $1 + 9 + 36 + 84 + 126 = 256$ of them. Every nonconstant product of at most eight distinct gammas is traceless: conjugation by a gamma outside the product changes its sign for odd rank, and conjugation by a gamma inside changes its sign for positive even rank. This also proves orthogonality. The symmetric products have ranks zero, one, and four; the skew products have ranks two and three.
  Put $"sym" M = \( M + M^t \) \/ 2$ and $"skew" M = \( M - M^t \) \/ 2$. The identity needed for the Yukawa term is
  #[#set math.equation(numbering: n => "(2.5)")
   $ sum_i "sym" #scale(x: 120%, y: 120%)[\(] \( gamma^i v \) \( gamma^(i j) v \)^t #scale(x: 120%, y: 120%)[\)] = 1 / 2 \( v^t gamma^j v \) upright("Id") - 1 / 2 gamma^j . $ <alg:spin-identity>]
  To check it, test its left side against a symmetric monomial $M = gamma^I$ of rank $r$. Since $sum_i gamma^i M gamma^i = \( - 1 \)^r \( 9 - 2 r \) M$, its trace pairing is
  $ #scale(x: 120%, y: 120%)[\(] \( - 1 \)^r \( 9 - 2 r \) - 1 #scale(x: 120%, y: 120%)[\)] v^t M gamma^j v . $
  For $r = 0 \, 1 \, 4$, this is respectively $8 v^t gamma^j v$, $- 8 delta_(I j)$, and zero, which are precisely the pairings with the right side of (2.5).
  The CAR give $theta \( w \)^2 = lr(|w|)^2 \/ 2$. They therefore give the kinetic term $p^2 \/ 2$. The square of the bracket multiplier is $h^2 sum_(i < j) lr(|\[ x_i \, x_j \]|)^2 \/ 2$: its possible remaining four-form term is proportional to the alternating sum of $⟨\[ x_i \, x_j \] \, \[ x_k \, x_l \]⟩$, and vanishes by invariance of the color scalar product and the Jacobi identity.
  The scalar, first-order part of the kinetic–bracket anticommutator is $h \( v^t gamma^j v \) p dot.op K_j x$. In differentiating the bracket coefficient with respect to $x_i^A$, its component of color $B$, divided by $h$, has spin coefficient $sum_j \( K_j \)_(B A) gamma^(i j) v$. Since $K_j$ is skew in color, its contraction with the kinetic Clifford multiplier selects the symmetric spin matrix in (2.5). Consequently the differentiated part is
  $ - frac(upright(i) h, 2) theta^t K_j gamma^j theta + frac(upright(i) h, 2) \( v^t gamma^j v \) theta^t K_j theta . $
  The second term cancels the first-order term by (2.3). This proves all the massless terms in (2.4).
  #emph[The mass and rotation terms.] The vectors $L_i \( v \)$ have Gram matrix $⟨L_i \( v \) \, L_j \( v \)⟩ = s_i^2 delta_(i j)$. The bracket–mass anticommutator is a scalar multiplier. Its color contractions are alternating in three distinct spatial indices. Their spin coefficient is proportional to
  $ \( s_i + s_j + s_k \) v^t gamma^i gamma^j gamma^k T v . $
  If exactly one of the indices is among the first three, the sum of the $s$’s is zero. If exactly two, or none, are among the first three, the matrix in this expression is skew and its expectation is zero. For $\( i \, j \, k \) = \( 1 \, 2 \, 3 \)$, $T^2 = - upright("Id")$ gives $- 6 h m ⟨\[ x_1 \, x_2 \] \, x_3⟩$. Together with the bracket square and the mass square, this is exactly $U_(h \, m)$ in (2.4).
  The scalar kinetic–mass cross term is $m p dot.op R \( v \) x$. Diagonal entries of $R \( v \)$ vanish since $T$ is skew. For mixed indices in $bb(R)^3$ and $bb(R)^6$, $gamma^i gamma^j T$ is skew; for indices in the same block, $s_i = s_j$, so antisymmetry in $i \, j$ proves the stated form of $R \( v \)$. For the differentiated kinetic–mass term put
  $ C \( v \) = sum_i s_i "skew" #scale(x: 120%, y: 120%)[\(] \( gamma^i v \) \( gamma^i T v \)^t #scale(x: 120%, y: 120%)[\)] . $
  Its contribution is $- upright(i) m theta^t C \( v \) theta$, and
  #[#set math.equation(numbering: n => "(2.6)")
   $ C \( v \) = - 3 / 4 T - 1 / 2 S \( R \( v \) \) . $ <alg:mass-spin-identity>]
  Here is a trace verification that fixes both constants. For a skew monomial $M$ of rank $r = 2$ or $3$, weighted conjugation, using $sum_i s_i = 0$, gives
  $ "Tr" \( M^t C \( v \) \) = - 2 \( - 1 \)^r (sum_(i in I) s_i) v^t M T v . $
  For rank three, only $M = T$ can contribute: the case with one first-three index has zero weight sum, and the other cases give a skew product $M T$. The pairing with $T$ is $- 12$, giving $- 3 T \/ 4$. For rank two, mixed blocks give zero, and in either pure block the pairing is $- 4 R \( v \)_(i j)$; since $"Tr" \( \( gamma^(i j) \)^t gamma^(i j) \) = 16$ and $S \( R \) = 1 / 2 sum_(i < j) R_(i j) gamma^(i j)$, this is the $- S \( R \) \/ 2$ term. Thus the differentiated term is $3 upright(i) m theta^t T theta \/ 4 + upright(i) m theta^t S \( R \( v \) \) theta \/ 2$, as required.
  Finally, $sum_nu v_nu v_nu^t = upright("Id")$. The trace of $gamma^i gamma^j T$ is zero for every $i \, j$, so the spin-basis average of $R \( v_nu \)$ vanishes. Averaging the charge square gives the asserted expression for $cal(H)$. Only the invariant scalar product and Jacobi identity were used in color space, proving the last assertion as well. ◻
]

=== 2.1 The invariant charge and its coercive inequality <the-invariant-charge-and-its-coercive-inequality>

The massless charges are covariant under $"Spin" \( 9 \)$; the massive charges are covariant under $"Spin" \( 3 \) times "Spin" \( 6 \)$. We fix the fermion grading as follows. Polarize the real spinor space by $T$, and realize the Clifford module as the exterior algebra on the resulting eight-dimensional complex spinor space tensored with $frak(k)_(bb(C))$. Choose its empty vector to be the ground vector of $upright(i) theta^t T theta \/ 2$. Gauge transformations and $"Spin" \( 3 \) times "Spin" \( 6 \)$ preserve this polarization. Their actions are the natural exterior actions: their connected semisimple groups admit no character that could shift the infinitesimal spin action. The gauge action also extends to $"U" \( N \)$ by conjugation; scalar unitaries act trivially. Hence it factors through the adjoint gauge group. The central minus one in $"Spin" \( 3 \)$ acts by minus the identity on the one-particle space and therefore by exterior parity, denoted $\( - 1 \)^F$.

To restrict a single massive charge to rotation invariants, we need a subgroup fixing its spinor. This does not by itself remove the angular term in its square. The choice below makes that term controllable by averaging positive charge squares.

Write $E_12 \, E_45 \, E_67 \, E_89$ for the skew spatial matrices whose indicated upper-triangular entry is one. The commuting complex structures $gamma^12 \, gamma^45 \, gamma^67 \, gamma^89$ have a common real two-plane on which they agree. Indeed the three commuting orthogonal projectors

$ 1 / 2 \( upright("Id") - gamma^12 gamma^45 \) \, #h(2em) 1 / 2 \( upright("Id") - gamma^12 gamma^67 \) \, #h(2em) 1 / 2 \( upright("Id") - gamma^12 gamma^89 \) $

have product of trace two, by the gamma trace rules just proved. Choose a real unit $u$ in this plane. The nine-dimensional volume element $gamma^1 dots.h.c gamma^9$ is a scalar $plus.minus upright("Id")$: it is central, and the monomial basis shows that the commutant is scalar. It follows that $gamma^3 = sigma upright("Id")$ on the chosen plane, for some $sigma in { 1 \, - 1 }$.

Let $G$ be the connected subtorus in the spin group with Lie algebra

#[#set math.equation(numbering: n => "(2.7)")
 $ {sum_(q = 1)^4 t_q E_q : med sum_(q = 1)^4 t_q = 0} \, #h(2em) \( E_1 \, E_2 \, E_3 \, E_4 \) = \( E_12 \, E_45 \, E_67 \, E_89 \) . $ <alg:fixing-torus>]

It fixes $u$; covariance therefore implies that $D_u \( h \, m \)$ commutes with $G$. We always use this connected subgroup, with no additional finite-component invariance imposed.

#thm([Lemma 2.2.])[
  (Coercivity on rotation invariants).  #emph[On gauge- and $G$-invariant vectors, in the sense of quadratic forms, 
#[#set math.equation(numbering: n => "(2.8)")
 $ ∥D_u \( h \, m \) psi∥^2 gt.eq 2 / 3 cal(H) \( h \, m \) \[ psi \] . $ <eq:coercive-charge>]

]
] <lem:coercive-charge>

#proof[
  The weight-plane relations give
  $ R \( u \) = sigma \( - 2 E_12 + E_45 + E_67 + E_89 \) . $
  Off-torus coefficients vanish by orthogonality of distinct weight planes. On $G$-invariant vectors the generator of any coefficient vector with zero sum is zero. Thus, putting $R_0 = sigma \( E_45 + E_67 + E_89 \)$, $J \( R \( u \) \) = J \( R_0 \) \/ 3$. Average $R \( g u \)$ over $g in "Spin" \( 3 \)$. The first block has average zero, and the last-six block stays fixed, so the average is $R_0$. Proposition 2 now gives on the invariant core
  $ integral_("Spin" \( 3 \)) ∥D_(g u) \( h \, m \) psi∥^2 thin upright(d) g = cal(H) \( h \, m \) \[ psi \] + m ⟨psi \, J \( R_0 \) psi⟩ = 3 ∥D_u \( h \, m \) psi∥^2 - 2 cal(H) \( h \, m \) \[ psi \] . $
  Positivity proves the inequality. The domain argument below extends it to the closed graph domain of the restricted charge. ◻
]

=== 2.2 Closed domains and the massless kernel <closed-domains-and-the-massless-kernel>

For the undeformed full-space matrix model, see Lundholm #cite(label("Lundholm2010")) Theorem 3.1. The constant-symbol cutoff proof below also covers the massive charges and specifies the closed realization used in the limiting arguments.

#thm([Lemma 2.3.])[
  (Minimal and maximal domains).  #emph[For fixed $h \, m \, v$, the charge $D_v \( h \, m \)$ is essentially self-adjoint on the full smooth compactly supported core. Its closed domain is its distributional maximal domain 
$ { psi in L^2 : D_v \( h \, m \) psi in L^2 upright(" in distributions") } . $

 The same statement holds after restriction to any commuting compact group of gauge or rotation symmetries. On gauge invariants at $m = 0$, all unit-spinor charges have the same graph domain, and 
$ ∥D_v \( h \, 0 \) psi∥^2 = cal(H) \( h \, 0 \) \[ psi \] . $

 Consequently the distributional $L^2$ kernel of any one of these charges is their common kernel. At $h = 1$ it is exactly $ker H_N$ for the form Hamiltonian in (1.2).]
] <lem:domains>

#proof[
  Write $D = D_0 + V \( x \)$, where $V$ is a smooth self-adjoint matrix and $D_0$ has constant coefficients. Its symbol satisfies
  #[#set math.equation(numbering: n => "(2.9)")
   $ sigma_D \( xi \)^2 = 1 / 2 lr(|xi|)^2 upright("Id") \, #h(2em) \[ D \, chi \] = - upright(i) sum_(i \, A) theta^A \( A_i \( v \) \) partial_(i \, A) chi \, #h(2em) ∥\[ D \, chi \] \( x \)∥_(upright("op")) = lr(|nabla chi \( x \)|) / sqrt(2) $ <alg:symbol>]
  for real scalar $chi$. If $D psi in L^2$ distributionally, localizing in a compact set makes $V psi$ square integrable. The Fourier identity for $D_0$, with a further compact cutoff, shows that $psi in H_(upright("loc"))^1$.
  Take radial cutoffs $chi_R$, equal to one on $lr(|x|) lt.eq R$ and zero on $lr(|x|) gt.eq 2 R$, with $lr(|nabla chi_R|) lt.eq C \/ R$. Then
  $ D \( chi_R psi \) = chi_R D psi + \[ D \, chi_R \] psi arrow.r D psi $
  in $L^2$, and $chi_R psi arrow.r psi$ in $L^2$. Each compactly supported $H^1$ vector can in turn be approximated in the graph norm by convolution and a fixed outer cutoff; on that compact set the potential is bounded and smooth. Thus the minimal domain equals the maximal domain. The adjoint of the symmetric core operator has precisely the distributional maximal domain, proving self-adjointness. Averaging these approximants over a commuting compact group preserves smooth compact support, and converges in graph norm because its action commutes with $D$.
  At $m = 0$, Proposition 2 makes the sixteen core graph norms, and that of any unit $v$, identical. Their common completion is therefore both the closed single-charge graph domain and the form domain of $cal(H) \( h \, 0 \)$. The associated nonnegative operator has zero form precisely when every charge vanishes. This proves the kernel statements. The same core approximation and Lemma 3 imply that the restricted massive graph domain is included in the averaged form domain and that (2.8) holds there. ◻
]

The following is the explicit rotation primitive of Hasler–Hoppe #cite(label("HaslerHoppe2002")) Lemma 2(c), in the present normalization. It supplies rotational invariance without any assumption on $lr(|x|) psi$. For a skew spatial matrix $F$, define the real spin matrices

#[#set math.equation(numbering: n => "(2.10)")
 $ P_i \( F \) = 1 / 16 sum_j F_(j i) gamma^j + 1 / 112 sum_(j \, k) F_(j k) gamma^(i j k) \, #h(2em) M_v \( F \) = sum_i theta \( P_i \( F \) v \) dot.op x_i . $ <alg:explicit-P>]

Here $gamma^(i j k)$ is fully antisymmetrized, and is zero if two indices coincide.

#thm([Lemma 2.4.])[
  (An exact anticommutator for rotations).  #emph[For any orthonormal real spin basis, 
#[#set math.equation(numbering: n => "(2.11)")
 $ sum_(nu = 1)^16 { D_(v_nu) \( h \, 0 \) \, M_(v_nu) \( F \) } = J \( F \) $ <alg:rotation-exact-eq>]

 on the smooth compactly supported core.]
] <alg:rotation-exact>

#proof[
  Orthogonality of gamma monomials gives
  $ "Tr" \( gamma^j P_i \( F \) \) = F_(j i) \, #h(2em) "Tr" \( gamma^(j k) P_i \( F \) \) = 0 \, #h(2em) sum_i gamma^i P_i \( F \)^t = - 1 / 2 S \( F \) . $
  For the last identity, the rank-one term contributes $- S \( F \) \/ 4$. For fixed distinct $j \, k$, exactly seven indices $i$ remain in the rank-three term, and $gamma^i gamma^(i j k) = gamma^(j k)$; its transpose has a minus sign. Hence this term contributes another $- S \( F \) \/ 4$. The first trace identity yields the orbital term in the anticommutator. The second kills its bracket multiplier. The differentiated multiplier is $- upright(i) theta^t \( sum_i gamma^i P_i \( F \)^t \) theta$, which is exactly the spin term of $J \( F \)$. ◻
]

#thm([Proposition 2.5.])[
  (Singlet property and parity).  #emph[Every gauge-invariant $L^2$ vector in the undeformed kernel is $"Spin" \( 9 \)$-invariant and even. In particular it is $G$-invariant. This assertion does not require finite-dimensionality of the kernel or any moment of its vectors.]
] <prop:singlet-parity>

#proof[
  Let $cal(Z)$ be the common massless kernel furnished by Lemma 4. Covariance preserves $cal(Z)$. Convolving its vectors with smooth approximate identities on the compact group $"Spin" \( 9 \)$ gives a dense invariant subspace $cal(Z)^oo$ contained in the domains of all rotation generators. For $phi.alt \, psi in cal(Z)^oo$, use the radial cutoffs from Lemma 4 in (2.11). Local regularity implies that $chi_R M_v \( F \) psi$ is in the charge domain. Pairing the anticommutator with $phi.alt$, and using that both vectors are killed by every charge, gives
  $ 0 = ⟨phi.alt \, chi_R J \( F \) psi⟩ + sum_nu ⟨phi.alt \, \[ D_(v_nu) \( h \, 0 \) \, chi_R \] M_(v_nu) \( F \) psi⟩ . $
  The multiplier in the last term has operator norm bounded by $C_F lr(|x|) lr(|nabla chi_R|)$, and is supported in $R lt.eq lr(|x|) lt.eq 2 R$. Therefore that term is bounded in absolute value by
  $ C_F ∥upright(bold(1))_({ lr(|x|) gt.eq R }) phi.alt∥ ∥upright(bold(1))_({ lr(|x|) gt.eq R }) psi∥ arrow.r 0 . $
  Since $J \( F \) psi in L^2$, the first term converges to $⟨phi.alt \, J \( F \) psi⟩$. The generator also preserves the closed invariant subspace $cal(Z)$, so the vanishing of these matrix elements for its dense smooth subspace implies $J \( F \) psi = 0$. All infinitesimal generators consequently vanish on the smooth vectors of this unitary representation. Connectedness of $"Spin" \( 9 \)$, followed by density, makes the representation trivial on $cal(Z)$. The central minus one of $"Spin" \( 3 \)$ is exterior parity, as established above; thus every vector of $cal(Z)$ is even. The proof has used only escaping-annulus $L^2$ tails of the uncut states. This is the rotational-singlet argument of Sethi–Stern #cite(label("SethiStern2000")), in the explicit anticommutator form of Hasler–Hoppe #cite(label("HaslerHoppe2002")). The underlying cutoff principle also appears in Hitchin’s invariant $L^2$-cohomology argument #cite(label("Hitchin2000")) Theorem 3. ◻
]

== 3 The massive Fredholm index <sec:massive-index>

We compute the index on the fixed Hilbert space

$ cal(H)_G = #scale(x: 120%, y: 120%)[\[] L^2 \( frak(k)^9 \) ⊗ cal(F)_N #scale(x: 120%, y: 120%)[\]]^("U" \( N \) times G) \, #h(2em) cal(H)_G = cal(H)_G^(+) xor cal(H)_G^(-) . $

Here the superscripts denote the exterior grading fixed in Section 2. Let $D_h = D_u \( h \, 1 \) \|_(cal(H)_G)$. It is odd and self-adjoint by Lemma 4.

#thm([Proposition 3.1.])[
  (Massive index).  #emph[For every $h > 0$, the graph domain of $D_h$ embeds compactly into $cal(H)_G$, and its even-to-odd part is Fredholm. Its index is 
#[#set math.equation(numbering: n => "(3.1)")
 $ "ind"_G D_u \( h \, 1 \) := dim ker \( D_h \|_(cal(H)_G^(+)) \) - dim ker \( D_h \|_(cal(H)_G^(-)) \) = p \( N \) \, $ <eq:massive-index>]

 where $p \( N \)$ is the number of unordered integer partitions of $N$. For all sufficiently small $h > 0$, the massive kernel itself has dimension $p \( N \)$, consists of even vectors, and is separated from the rest of the spectrum of $D_h$ by a positive gap uniform in $h$.]
] <prop:massive-index>

The proof occupies this section. It uses the massive deformation to obtain a Fredholm problem, but makes no assertion yet about its relation to the undeformed kernel. That relation will require the global estimates of the subsequent sections.

=== 3.1 Confinement and continuity at positive coupling <confinement-and-continuity-at-positive-coupling>

#thm([Lemma 3.2.])[
  (Coercivity of the massive potential).  #emph[There are $c > 0$ and $R < oo$, depending only on $N$, such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ U_(1 \, 1) \( x \) gt.eq c lr(|x|)^2 #h(2em) \( lr(|x|) gt.eq R \) . $ <mass:potential-infinity>]

 Moreover, for $h \, m > 0$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ U_(h \, m) \( x \) = m^4 / h^2 U_(1 \, 1) (h / m x) . $ <mass:potential-scaling>]

]
] <lem:massive-potential>

#proof[
  The scaling identity follows term by term from (2.4). To prove the lower bound, suppose otherwise and choose $x^(\( n \))$ with $r_n = lr(|x^(\( n \))|) arrow.r oo$ and $U_(1 \, 1) \( x^(\( n \)) \) \/ r_n^2 arrow.r 0$. After passing to a subsequence, $x_i^(\( n \)) \/ r_n arrow.r a_i$. The last-six mass terms give $a_d = 0$, while the first-three squares give
  #[#set math.equation(numbering: n => "(3.4)")
   $ \[ x_a^(\( n \)) \, x_b^(\( n \)) \] - 2 x_c^(\( n \)) = o \( r_n \) quad upright("for cyclic ") \( a \, b \, c \) . $ <mass:escaping-residual>]
  Dividing by $r_n^2$ shows that the $a_a$ commute. Their joint eigenspaces give an orthogonal decomposition $bb(C)^N = xor.big_alpha E_alpha$, with distinct joint eigenvalue triples $lambda_alpha in bb(R)^3$. Choose $t in bb(R)^3$ so that the numbers $t dot.op lambda_alpha$ are distinct, and put $y_n = sum_a t_a x_a^(\( n \))$.
  The spectral subspaces of $y_n$ in the corresponding clusters converge to the $E_alpha$. By unitaries tending to the identity we may identify these subspaces with fixed blocks, without changing the preceding limits. Their spectral gaps are at least $c_0 r_n$ for some $c_0 > 0$. Equation (3.4) implies $∥\[ y_n \, x_a^(\( n \)) \]∥ = O \( r_n \)$. In bases diagonalizing the two relevant blocks of $y_n$, an off-block matrix entry is multiplied in this commutator by a spectral difference of magnitude at least $c_0 r_n$. Hence
  #[#set math.equation(numbering: n => "(3.5)")
   $ ∥\( x_a^(\( n \)) \)_(alpha beta)∥ = O \( 1 \) \, #h(2em) alpha eq.not beta . $ <mass:off-block-bound>]
  This is a finite-dimensional Hilbert–Schmidt estimate, uniform in the sequence.
  The trace in a diagonal block of $\[ x_a^(\( n \)) \, x_b^(\( n \)) \]$ has zero contribution from its internal commutator. Its remaining terms are products of the off-block entries in (3.5), so its block trace is $O \( 1 \)$. Divide the block trace of (3.4) by $r_n$. The result is $2 dim \( E_alpha \) \( lambda_alpha \)_c = 0$ for every $alpha \, c$. Thus every $a_i$ vanishes. This contradicts $sum_i lr(|a_i|)^2 = 1$, proving (3.2). Grouping equal limiting joint eigenvalues into a single block was essential here; no gap was required inside such a block. ◻
]

#thm([Lemma 3.3.])[
  (A common massive graph domain).  #emph[The domain of $D_h$, for every $h > 0$, is 
#[#set math.equation(numbering: n => "(3.6)")
 $ cal(D) = {psi in cal(H)_G ∩ H^1 : lr(|x|) psi in L^2 \, quad \[ x_i \, x_j \] psi in L^2 med \( i < j \)} . $ <mass:graph-domain>]

 On each compact interval $I subset.double \( 0 \, oo \)$, its graph norm is uniformly equivalent to 
#[#set math.equation(numbering: n => "(3.7)")
 $ ∥psi∥ + ∥nabla psi∥ + ∥lr(|x|) psi∥ + sum_(i < j) ∥\[ x_i \, x_j \] psi∥ . $ <mass:graph-norm>]

 The embedding $cal(D) arrow.r.hook cal(H)_G$ is compact, and $h mapsto D_h$ is norm-resolvent continuous on $\( 0 \, oo \)$. Its graded Fredholm index is constant there.]
] <mass:common-domain>

#proof[
  The fermionic multiplier in (2.4), denoted below by $V_F \( h \, m \; x \)$, acts on a fixed finite-dimensional space and satisfies
  #[#set math.equation(numbering: n => "(3.8)")
   $ ∥V_F \( h \, m \; x \)∥_(upright("op")) lt.eq C_N \( m + h lr(|x|) \) . $ <mass:fermion-bound>]
  Lemma 8 and scaling give, uniformly for $h in I$, $U_(h \, 1) gt.eq c_I lr(|x|)^2 - C_I$. Absorbing the linear term in (3.8) yields
  $ cal(H) \( h \, 1 \) \[ psi \] + C_I ∥psi∥^2 gt.eq 1 / 2 ∥nabla psi∥^2 + c'_I ∥lr(|x|) psi∥^2 . $
  The identity for $cal(H)$ then also bounds $integral U_(h \, 1) lr(|psi|)^2$ by $C_I \( cal(H) \( h \, 1 \) \[ psi \] + ∥psi∥^2 \)$. Each bracket multiplier is controlled by this integral and $∥lr(|x|) psi∥$, because the first-three residuals are $h \[ x_a \, x_b \] - 2 x_c$ and all the other brackets occur directly in the potential. On $cal(H)_G$, Lemma 3 consequently bounds (3.7) by $C_I \( ∥D_h psi∥ + ∥psi∥ \)$. The reverse bound follows immediately from the formula for $D_h$.
  These statements first hold on the invariant core. Its graph completion equals the maximal domain by Lemma 4. Conversely a vector satisfying (3.6) has all terms of the charge in $L^2$, so is in that maximal domain. This proves the common-domain assertion and norm equivalence. For a bounded set in this graph norm, Rellich compactness on balls gives local $L^2$ compactness, whereas
  $ ∥upright(bold(1))_({ lr(|x|) > R }) psi∥^2 lt.eq R^(- 2) ∥lr(|x|) psi∥^2 $
  makes the tails uniformly small. The graph embedding is compact. Thus $D_h$ has compact resolvent, finite-dimensional kernel, and closed range, and its odd part is Fredholm.
  Writing $D_h - D_(h_0) = \( h - h_0 \) B$, the bracket bound shows that $B : cal(D) arrow.r cal(H)_G$ is bounded for the graph norm of $D_(h_0)$. Thus $\( D_h - D_(h_0) \) \( D_(h_0) - upright(i) \)^(- 1)$ tends to zero in operator norm. The resolvent identity and a Neumann series imply norm-resolvent continuity. For completeness, choose a symmetric interval $\( - a \, a \)$ whose endpoints avoid the spectrum at $h_0$. Its finite-rank spectral projection is norm-continuous for nearby $h$, and preserves parity. The even and odd ranks of the projection are therefore locally constant. This is the standard stability of separated spectral projections; see #cite(label("Kato1995")) Chapter IV, Section 3.4, Theorem 3.16. The graph estimates above and the parity argument here are specific to the present operators. On its nonzero spectral subspace, the odd operator $D_h$ is an isomorphism between the even and odd parts, so their rank difference is exactly the graded kernel dimension. The index is locally constant, and hence constant on the connected interval $\( 0 \, oo \)$. ◻
]

=== 3.2 The minima and their normal oscillators <the-minima-and-their-normal-oscillators>

The zero set $Z = { U_(1 \, 1) = 0 }$ is a finite union of compact gauge orbits. In fact its equations are

$ x_a = 2 j_a \, #h(2em) \[ j_a \, j_b \] = epsilon.alt_(a b c) j_c \, #h(2em) x_d = 0 . $

Thus $j$ is a unitary representation of $frak(s u) \( 2 \)$ on $bb(C)^N$, and its irreducible dimensions form a partition of $N$. Conversely every such representation gives a zero. Conjugacy by $"U" \( N \)$ is the same as conjugacy by $"SU" \( N \)$ on this configuration space, and the representing matrices have trace zero. There are therefore exactly $p \( N \)$ zero orbits. These partition labels are the classical vacuum labels of the plane-wave model #cite(label("BMN2002")) Sec. 5.

For each zero orbit, the required contribution is one even normal vacuum that survives the stabilizer symmetry. We first specify the normal Hamiltonian, then calculate its ground line and its character.

Fix a representative $q = \( 2 j_1 \, 2 j_2 \, 2 j_3 \, 0 \, dots.h \, 0 \) in Z$. Let $cal(O) = "U" \( N \) q$, let $H_q$ be its stabilizer, and set $S_q = \( T_q cal(O) \)^perp subset frak(k)^9$. Write $U_q^(\( 2 \))$ for the quadratic Taylor term of $U_(1 \, 1)$ at $q$, restricted to $S_q$. The limiting normal Hamiltonian is

#[#set math.equation(numbering: n => "(3.9)")
 $ H_q^(upright("nor")) = - 1 / 2 Delta_(S_q) + U_q^(\( 2 \)) \( z \) + upright(i) / 2 theta^t (3 / 2 T - 2 "ad" \( j_a \) gamma^a) theta . $ <mass:normal-Hamiltonian>]

It acts first on the full slice space $L^2 \( S_q \) ⊗ cal(F)_N$; gauge transport will impose $H_q$-equivariance there.

The fluctuation frequencies below were computed by Dasgupta–Sheikh-Jabbari–Van Raamsdonk #cite(label("DasguptaSheikhJabbariVanRaamsdonk2002")) Sections 5.2–5.4. We rederive them through spin coupling to specify the normal Hessian and then establish the stabilizer character needed for the invariant index. In a finite unitary $frak(s u) \( 2 \)$-representation, the Hermitian third generator has a highest weight $l$. The adjoint raising and lowering operators produce weights $l \, l - 1 \, dots.h \, - l$; on a unit weight-$r$ vector the squared lowering norm is $l \( l + 1 \) - r \( r - 1 \)$. This follows by moving a raising operator past a lowering operator using their commutator. Positivity terminates the string at $- l$, so $2 l$ is a nonnegative integer. These strings split off orthogonally and have uniquely determined ladder coefficients. Tensoring two strings and adding their weights gives the usual decomposition into consecutive spins $lr(|l - s|) \, dots.h \, l + s$. For real skew generators, whose squares have Casimir $- l \( l + 1 \)$, this implies

#[#set math.equation(numbering: n => "(3.10)")
 $ sum_a "ad" \( j_a \) L_a^(\( s \)) = frac(l \( l + 1 \) + s \( s + 1 \) - k \( k + 1 \), 2) quad upright("on total spin ") k . $ <mass:spin-coupling>]

#thm([Lemma 3.4.])[
  (Normal frequencies and the vacuum line).  #emph[The quadratic form $U_q^(\( 2 \))$ is positive definite on $S_q$. The oscillator $H_q^(upright("nor"))$ is nonnegative, has a unique zero-energy line, and has a positive spectral gap on its orthogonal complement. Its zero-energy line is even and is fixed by the entire stabilizer $H_q$, including exchanges of identical irreducible summands. It is also fixed by the combined first-three spatial and compensating gauge rotations, and by $"Spin" \( 6 \)$.]
] <lem:normal-oscillators>

#proof[
  #emph[Bosonic normal modes.] Decompose $frak(k)_(bb(C))$ into irreducible spin-$l$ summands for $"ad" \( j \)$. Half-integral spins are allowed: maps between two different irreducible summands of the defining representation may carry such spins. The dimensions calculated in the complexification give the real dimensions of the original real operators after summing all their summands.
  On the first three spatial components, the linearized residual in the potential is
  $ 2 (sum_a "ad" \( j_a \) L_a^(\( 1 \)) - upright("Id")) \, $
  where $L_a^(\( 1 \))$ generates cross product on $bb(R)^3$. Equation (3.10) gives the eigenvalues $- l \, 1 \, l + 1$ of $sum_a "ad" \( j_a \) L_a^(\( 1 \))$, on coupled spins $l + 1 \, l \, l - 1$, respectively, whenever the indicated representation exists. Taking the absolute values of the linearized residual gives normal frequencies
  #[#set math.equation(numbering: n => "(3.11)")
   $ upright("frequency") & upright("multiplicity")\
2 \( l + 1 \) & 2 l + 3\
2 l & max \( 2 l - 1 \, 0 \)\
2 l + 1 & 6 \( 2 l + 1 \) . $ <mass:boson-frequencies>]
  The last row comes from the last six components, whose squared frequency is $1 + 4 l \( l + 1 \) = \( 2 l + 1 \)^2$. For $l > 0$, the omitted zero-frequency spin-$l$ summand is exactly the gauge tangent: $w mapsto \( \[ w \, j_a \] \)_a$ is an injective intertwiner from that color summand, its image is tangent to the zero orbit, and the dimensions agree. For $l = 0$, only the spin-one first-three summand exists and has frequency two; there is no gauge tangent. Thus all frequencies on $S_q$ are positive. Their bosonic ground energy per color spin-$l$ summand is
  #[#set math.equation(numbering: n => "(3.12)")
   $ E_B \( l \) = 1 / 2 (\( 2 l + 2 \) \( 2 l + 3 \) + \( 2 l \) \( 2 l - 1 \) + 6 \( 2 l + 1 \)^2) = 16 l^2 + 16 l + 6 . $ <mass:boson-energy>]
  The middle term is omitted when its representation is absent; it is already zero for $l = 0$ and $l = 1 \/ 2$.
  #emph[Fermionic energy and the ground line.] The real skew spin-one-half matrices $L_a^(\( 1 \/ 2 \)) = - T gamma^a \/ 2$ satisfy the same $frak(s u) \( 2 \)$ relations, and the fermion frequency matrix is
  $ M_q = 3 / 2 T - 2 "ad" \( j_a \) gamma^a = T (3 / 2 - 4 sum_a "ad" \( j_a \) L_a^(\( 1 \/ 2 \))) . $
  The coupled spins $l + 1 \/ 2$ and $l - 1 \/ 2$ have scalar factors $2 l + 3 \/ 2$ and $- 2 l - 1 \/ 2$, respectively, multiplying $T$. Since the complexified real sixteen-dimensional spinor has eight copies of spin one-half, the absolute frequencies and their complexified multiplicities are
  #[#set math.equation(numbering: n => "(3.13)")
   $ upright("absolute frequency") & upright("complexified multiplicity")\
2 l + 3 \/ 2 & 8 \( 2 l + 2 \)\
2 l + 1 \/ 2 & 8 \( 2 l \) . $ <mass:fermion-frequencies>]
  There are no zero fermion frequencies. A real two-plane with skew frequency $omega$ contributes eigenvalues $plus.minus omega \/ 2$ to $upright(i) theta^t M_q theta \/ 2$, by the CAR normalization. The fermionic ground energy is consequently $- "Tr" lr(|M_q|) \/ 4$. From (3.13) this is $- E_B \( l \)$, with $E_B \( l \)$ as in (3.12). Every bosonic oscillator and every fermionic two-plane has a unique ground vector, so their product is the unique zero-energy vector and has a positive gap above it.
  #emph[Stabilizer action and parity.] The unique ground line contributes to the invariant index only if it has trivial stabilizer character. We verify that condition in the fixed exterior realization, which also determines its parity. Decompose the defining representation as
  $ bb(C)^N = xor.big_r \( V_(j_r) ⊗ M_r \) \, #h(2em) H_q = product_r "U" \( M_r \) \, #h(2em) m_r = dim M_r \, $
  where the $j_r$ are distinct and $V_j$ denotes spin $j$. The empty vector in the $T$-polarized Fock space is gauge invariant. The one-particle spin representation under $"Spin" \( 3 \) times "Spin" \( 6 \)$ is $bb(C)^2 ⊗ bb(C)^4$. Relative to this polarization, the fermionic ground vector fills precisely the negative-factor space of $M_q \/ T$. On a color spin-$l$ summand this is $V_(l - 1 \/ 2) ⊗ bb(C)^4$, of complex dimension
  #[#set math.equation(numbering: n => "(3.14)")
   $ q_l = 4 \( 2 l \) = 8 l #h(2em) \( l > 0 \) . $ <mass:occupied-dimension>]
  Notice the distinction from the doubled multiplicities of the complexified real frequency matrix in (3.13).
  The color summand from maps between defining isotypic components is
  $ "Hom" \( V_(j_r) \, V_(j_s) \) ⊗ "Hom" \( M_r \, M_s \) \, $
  and its spin list is $l = lr(|j_r - j_s|) \, dots.h \, j_r + j_s$, once each. Thus the determinant character of its filled space is the product over that list, omitting $l = 0$, of
  #[#set math.equation(numbering: n => "(3.15)")
   $ (\( det g_s \)^(m_r) \( det g_r \)^(- m_s))^(q_l) . $ <mass:centralizer-character>]
  The reverse pair $\( s \, r \)$ has the identical spin list and the inverse character, so the factors cancel. For $r = s$ the displayed character is already trivial. Removing the scalar color from $"End" \( bb(C)^N \)$ removes only an $l = 0$ summand and does not affect this argument. Hence the determinant of the full filled space is the trivial character of $H_q$. The bosonic ground Gaussian is also $H_q$-invariant. The entire ground line is therefore fixed by the stabilizer, including its permutation matrices exchanging identical summands. No ordering sign remains. Moreover every $q_l$ is a multiple of four, including when $l$ is half-integral. The occupied degree is even, proving the parity assertion.
  #emph[Spatial rotations.] First-three rotations of $q$ can be compensated by the $"SU" \( 2 \)$ representation defined by $j$. Their combined action, and the action of $"Spin" \( 6 \)$, preserve $S_q$ and commute with $H_q^(upright("nor"))$. Each acts on its unique ground line by a continuous character of a connected semisimple group. Such a character is trivial: its derivative annihilates the commutator Lie algebra, which is the entire Lie algebra, and connectedness then annihilates the character. This proves all the claimed symmetries. ◻
]

=== 3.3 Small-coupling localization with norm exhaustion <small-coupling-localization-with-norm-exhaustion>

We next justify the passage from the finitely many normal oscillators to the spectrum. This is harmonic comparison by localization, as in semiclassical analysis #cite(label("Simon1983")); here the wells are gauge orbits, so their slice measures and stabilizers must be retained explicitly. In particular, the argument includes tails away from their tubes; local oscillator convergence alone would not determine an index.

#thm([Lemma 3.5.])[
  (Uniform localization near the massive zero orbits).  #emph[For $0 < h lt.eq 1$, let $d_h \( x \) = "dist" \( x \, h^(- 1) Z \)$. There are constants $c \, C > 0$, independent of $h$, such that 
#[#set math.equation(numbering: n => "(3.16)")
 $ U_(h \, 1) \( x \) gt.eq c thin d_h \( x \)^2 \, #h(2em) cal(H) \( h \, 1 \) \[ psi \] gt.eq 1 / 2 ∥nabla psi∥^2 + c / 2 ∥d_h psi∥^2 - C ∥psi∥^2 . $ <mass:distance-bound>]

 In particular, bounded form-energy families with bounded norm have uniform kinetic bounds and $∥upright(bold(1))_({ d_h > R }) psi∥^2 lt.eq C' \/ R^2$.]
] <mass:distance-confinement>

#proof[
  The positive normal Hessians in Lemma 10, and the finitely many compact orbits, imply $U_(1 \, 1) gt.eq c "dist" \( dot.op \, Z \)^2$ in a fixed neighborhood of $Z$. Indeed normal tubular coordinates have positive quadratic Taylor term and uniformly cubic Taylor remainder on these compact orbits. On a compact set outside that neighborhood the same inequality follows from the positive minimum of $U_(1 \, 1) \/ "dist" \( dot.op \, Z \)^2$. At infinity it follows from Lemma 8, since $Z$ is bounded. Scaling then gives its first assertion for all $x$.
  Let $M = max_(q in Z) lr(|q|)$. A nearest point of $h^(- 1) Z$ gives $h lr(|x|) lt.eq h d_h \( x \) + M$. Equation (3.8) therefore implies
  $ U_(h \, 1) \( x \) + V_F \( h \, 1 \; x \) gt.eq c thin d_h \( x \)^2 - C_N \( 1 + M + h d_h \( x \) \) gt.eq c / 2 d_h \( x \)^2 - C . $
  Adding the kinetic term proves (3.16). In particular the matrix-valued potential plus fermion term is nonnegative whenever $d_h gt.eq R_0$, for a fixed $R_0$, and the claimed tail bound follows by integration. ◻
]

#thm([Lemma 3.6.])[
  (Normal-slice compactness).  #emph[Suppose $h_n arrow.b 0$ and $psi_n$ are gauge-invariant vectors of bounded norm and bounded $cal(H) \( h_n \, 1 \)$ form energy. After a subsequence, there is one profile $f_q in L^2 \( S_q \) ⊗ cal(F)_N$ for each of the $p \( N \)$ zero orbits, with the following properties. Each profile is $H_q$-equivariant and belongs to the oscillator form domain. With the normalizations described in the proof, 
#[#set math.equation(numbering: n => "(3.17)")
 $ lim_(n arrow.r oo) ∥psi_n∥^2 = sum_q ∥f_q∥^2 \, #h(2em) sum_q H_q^(upright("nor")) \[ f_q \] lt.eq liminf_(n arrow.r oo) cal(H) \( h_n \, 1 \) \[ psi_n \] \, $ <mass:slice-exhaustion>]

 whenever the subsequence realizes the norm limit and energy liminf. For any fixed finite family of such sequences, extraction can be simultaneous and the norm identity polarizes to their inner products. Parity is preserved.]
] <mass:slice-compactness>

#proof[
  Choose disjoint normal tubes of radius $rho$ about the compact orbits in $Z$. The tubular neighborhood theorem here applies to the smooth compact embedded orbit $"U" \( N \) \/ H_q$ in the Euclidean configuration space, with its ordinary normal bundle. Scaling its normal exponential map gives the exact coordinates
  #[#set math.equation(numbering: n => "(3.18)")
   $ "U" \( N \) times_(H_q) B_(S_q) \( rho \/ h \) arrow.r frak(k)^9 \, #h(2em) \[ k \, z \] mapsto "Ad" \( k \) \( q \/ h + z \) . $ <mass:tube-chart>]
  Within this tube, $d_h = lr(|z|)$. Stabilizer equivariance is kept on the linear slice: if $rho_F$ denotes the gauge action on $cal(F)_N$, then restriction to the slice satisfies
  $ psi \( q \/ h + "Ad" \( a \) z \) = rho_F \( a \) psi \( q \/ h + z \) \, #h(2em) a in H_q . $
  We do not replace this equivariant linear slice by a singular quotient.
  Let $d_q = dim cal(O)$, and give $"U" \( N \) \/ H_q$ a fixed normalized invariant measure. Integration in (3.18) gives measure $h^(- d_q) J_q \( h z \) thin upright(d) z$ after orbit integration, with $J_q$ smooth, positive, and $H_q$-invariant on $B_(S_q) \( rho \)$. This follows by differentiating the tube map: the $d_q$ orbit columns are $h^(- 1) \[ w \, q + h z \]$, while the normal columns are fixed orthonormal vectors. Put $j_(q \, h) \( z \) = J_q \( h z \) \/ J_q \( 0 \)$. On every bounded slice set, $j_(q \, h) arrow.r 1$ smoothly and $nabla log j_(q \, h) = O \( h \)$. Define the flat-measure slice vector
  #[#set math.equation(numbering: n => "(3.19)")
   $ f_(q \, n) \( z \) = h_n^(- d_q \/ 2) J_q \( 0 \)^(1 \/ 2) j_(q \, h_n) \( z \)^(1 \/ 2) psi_n \( q \/ h_n + z \) \, #h(2em) lr(|z|) < rho \/ h_n . $ <mass:slice-normalization>]
  This identification is isometric on the tube. For general form-domain vectors we define it by $L^2$ closure from smooth equivariant vectors; the derivative estimates below pass by form-core approximation. Distinct orbit dimensions cause no ambiguity: each tube has its own displayed constant normalization.
  For any smooth equivariant vector, differentiation in an orthonormal basis of the fixed space $S_q$ is ordinary ambient differentiation. Pointwise its squared slice derivative is therefore at most the full squared ambient gradient. After (3.19), the density derivative changes this bound only by $O \( h_n \)$ on bounded sets. The uniform kinetic bound in Lemma 11 yields local $H^1$ bounds for every $f_(q \, n)$. Rellich compactness, followed by a diagonal subsequence on expanding balls in the finitely many slices, gives strong local $L^2$ convergence and weak local $H^1$ convergence to $f_q$. The distance bound gives both $lr(|z|) f_q in L^2$ and uniformly small squared norm tails $O \( R^(- 2) \)$. For fixed $R$, all the tubes $lr(|z|) < R$ are disjoint when $n$ is large, and their complement is contained in ${ d_(h_n) gt.eq R }$. Strong local convergence followed by $R arrow.r oo$ proves the first identity in (3.17). The same estimates for a finite list, or the Cauchy–Schwarz inequality on its common tails, prove the polarized identity. All changes of coordinates and densities commute with parity, so parity passes to the profiles.
  On a fixed bounded slice, Taylor expansion gives, uniformly there,
  #[#set math.equation(numbering: n => "(3.20)")
   $ U_(h \, 1) \( q \/ h + z \) = U_q^(\( 2 \)) \( z \) + O_R \( h \) \, #h(2em) V_F \( h \, 1 \; q \/ h + z \) = upright(i) / 2 theta^t M_q theta + O_R \( h \) . $ <mass:slice-potential-limit>]
  For the first formula use $U_(h \, 1) \( q \/ h + z \) = h^(- 2) U_(1 \, 1) \( q + h z \)$ and the vanishing of the constant and linear Taylor terms; for the second use the explicit linear fermion multiplier. Thus local potential energies converge under strong $L^2$ convergence, and the slice-gradient inequality and weak lower semicontinuity give the kinetic liminf.
  To justify the global energy statement, take real gauge-invariant cutoffs $chi_(q \, h \, R)$, equal to one in the $R$-tube about $h^(- 1) cal(O)_q$ and supported in its $2 R$-tube. For fixed $R$ and small $h$ the tubes are disjoint. Complete them to a squared partition of unity with an exterior cutoff, choosing the transition profiles so that the sum of squared gradients is at most $C \/ R^2$. The first-order symbol identity (2.9) gives the localization formula
  #[#set math.equation(numbering: n => "(3.21)")
   $ sum_alpha cal(H) \( h \, 1 \) \[ chi_alpha psi \] = cal(H) \( h \, 1 \) \[ psi \] + 1 / 2 integral sum_alpha lr(|nabla chi_alpha|)^2 lr(|psi|)^2 . $ <mass:IMS>]
  Every localized gauge-invariant form on the left is nonnegative, so the exterior term may be discarded. On each remaining tube the cutoff is a fixed function $chi_R \( z \)$. Applying the preceding local liminf yields
  $ liminf_n cal(H) \( h_n \, 1 \) \[ psi_n \] gt.eq sum_q H_q^(upright("nor")) \[ chi_R f_q \] - C \/ R^2 . $
  The uniform gradient and second-moment bounds already show that the limits belong to the confining oscillator form domains. Accordingly $chi_R f_q arrow.r f_q$ in these form domains as $R arrow.r oo$. This proves the second assertion of (3.17) and completes the proof. ◻
]

#thm([Lemma 3.7.])[
  (Recovery of each normal vacuum).  #emph[For every zero orbit there is a family $Phi_(q \, h) in cal(D)$ of even gauge- and $"Spin" \( 3 \) times "Spin" \( 6 \)$-invariant vectors such that, as $h arrow.b 0$, 
#[#set math.equation(numbering: n => "(3.22)")
 $ ⟨Phi_(q \, h) \, Phi_(q' \, h)⟩ arrow.r delta_(q q') \, #h(2em) ∥D_h Phi_(q \, h)∥ arrow.r 0 . $ <mass:vacuum-recovery-eq>]

]
] <mass:vacuum-recovery>

#proof[
  Let $phi_q$ be a normalized ground vector of $H_q^(upright("nor"))$, as in Lemma 10, and first fix a radial slice cutoff $chi_R$ supported in $lr(|z|) < 2 R$. Use (3.19) inversely to put $chi_R phi_q$ in the tube, and extend by gauge equivariance and then by zero. The stabilizer character calculation makes this a well-defined vector, denoted $Phi_(q \, h \, R)$. Its support is inside the tube for all sufficiently small $h$, and it is in the charge domain. The density and radial cutoff are preserved by the combined spatial and compensating gauge rotations. The invariance in Lemma 10 therefore makes $Phi_(q \, h \, R)$ invariant under the full deformation rotation group. It is even as well.
  We verify energy convergence, including the derivative directions not contained in the fixed normal space. On a bounded slice the orbit columns in (3.18) are $\[ w \, q \/ h + z \]$, with $w$ in a fixed complement of the stabilizer Lie algebra. At $z = 0$ they span the orthogonal complement of $S_q$, with inverse of size $O \( h \)$. On $lr(|z|) lt.eq 2 R$ their inverse is still $O_R \( h \)$. Gauge equivariance differentiates an orbit column to the fixed finite-dimensional operator $rho_(F \, *) \( w \)$. Expressing a unit ambient tangent vector in these columns and the normal columns therefore bounds the additional derivatives by
  $ C_R h #scale(x: 120%, y: 120%)[\(] lr(|f|) + lr(|z|) lr(|nabla f|) #scale(x: 120%, y: 120%)[\)] quad upright("for the corresponding fixed slice field ") f . $
  The density derivative is also $O_R \( h \)$. It follows that the kinetic form of $Phi_(q \, h \, R)$ converges to the Euclidean slice kinetic form of $chi_R phi_q$. Together with (3.20), this gives
  $ ∥Phi_(q \, h \, R)∥ arrow.r ∥chi_R phi_q∥ \, #h(2em) cal(H) \( h \, 1 \) \[ Phi_(q \, h \, R) \] arrow.r H_q^(upright("nor")) \[ chi_R phi_q \] . $
  The latter is $1 / 2 ∥\( nabla chi_R \) phi_q∥^2$, since $H_q^(upright("nor")) phi_q = 0$; it tends to zero as $R arrow.r oo$. Rotation invariance and Proposition 2 identify this massive form energy with $∥D_h Phi_(q \, h \, R)∥^2$. Choose $R arrow.r oo$ sufficiently slowly as $h arrow.b 0$ that all preceding fixed-$R$ convergences hold. This is a diagonal choice: for each integer $R$, first choose a positive upper bound on $h$ making its finitely many errors smaller than $1 \/ R$. Supports for different orbits are disjoint for these choices. Normalizing the vectors proves (3.22). ◻
]

=== 3.4 From localization to the index <from-localization-to-the-index>

#proof[
  The compact-domain and continuity assertions were proved in Lemma 9. We compute the constant index as $h arrow.b 0$.
  There exist $delta > 0$ and $h_0 > 0$ such that
  #[#set math.equation(numbering: n => "(3.23)")
   $ ∥D_h psi∥ gt.eq delta ∥psi∥ \, #h(2em) psi in cal(D) ∩ cal(H)_G^(-) \, quad 0 < h < h_0 . $ <mass:odd-gap>]
  Otherwise one could choose normalized odd $psi_n$, with $h_n arrow.b 0$ and $∥D_(h_n) psi_n∥ arrow.r 0$. Lemma 3 would give $cal(H) \( h_n \, 1 \) \[ psi_n \] arrow.r 0$. By Lemma 12, their profiles would have total squared norm one and would all belong to the zero-energy lines of the normal oscillators. Every such line is even by Lemma 10, whereas every extracted profile is odd. This contradiction proves (3.23).
  Because $D_h$ is odd and self-adjoint on the same invariant Hilbert space, it pairs positive even and odd eigenvectors of $D_h^2$: for eigenvalue $lambda > 0$, the map $lambda^(- 1 \/ 2) D_h$ is an isometric parity-changing bijection. Compact resolvent makes this a statement about a complete discrete spectrum. Thus (3.23) excludes positive even eigenvalues below $delta^2$ as well, and the kernel is entirely even. If $P_h$ denotes its orthogonal projection, we obtain
  #[#set math.equation(numbering: n => "(3.24)")
   $ ∥\( 1 - P_h \) psi∥ lt.eq delta^(- 1) ∥D_h psi∥ \, #h(2em) 0 < h < h_0 . $ <mass:kernel-gap>]
  The kernel has dimension at most $p \( N \)$ for all sufficiently small $h$. If not, along a sequence $h_n arrow.b 0$ one could choose $p \( N \) + 1$ orthonormal null vectors. Simultaneous normal-slice extraction and the polarized norm identity in Lemma 12 would give an orthonormal list of that length in the direct sum of the $p \( N \)$ one-dimensional normal ground spaces, a contradiction.
  Conversely, Lemma 13 supplies $p \( N \)$ asymptotically orthonormal even vectors with charge norm tending to zero. Equation (3.24) changes each by $o \( 1 \)$ when it is projected onto $ker D_h$. Their projected Gram matrix tends to the identity, so these projected vectors are linearly independent for all sufficiently small $h$. Thus the massive kernel has dimension exactly $p \( N \)$ there, is even, and has the stated uniform gap. Its graded index is consequently $p \( N \)$. Index constancy in Lemma 9 proves (3.1) for every $h > 0$. ◻
]

The massive signed count is now fixed for every positive coupling. To compare it with the undeformed kernel, we next analyze large-coupling states near separated block centers.

== 4 The charge near separated centers <fast:section>

Near a commuting configuration with distinct joint centers, the off-block coordinates form a fast oscillator. We construct its ground-line projection and prove concentration on this line, together with bounds for the charge in the block variables. We then compute the charge compressed to the line at scalar blocks. These local estimates do not require invariance under the rotation torus $G$. Gauge equivariance removes the longitudinal fast momentum and the central gauge angular momentum in the oscillator square.

The fixed-mass regime supplies cluster profiles, while the growing-mass regime will exclude escape to infinity after rescaling large annuli. We use two parameter regimes. In the first, $m gt.eq 0$ is fixed, $h arrow.r oo$, and a bounded family has locally bounded graph norm for one fixed charge $D_v \( h \, m \)$. In the second,

#[#set math.equation(numbering: n => "(4.1)")
 $ m = m_h arrow.r oo \, #h(2em) m_h lt.eq C_0 sqrt(h) \, #h(2em) parallel D_(v_alpha) \( h \, m_h \) psi_h parallel = o \( m_h \) quad \( alpha = 1 \, dots.h \, 16 \) \, $ <fast:growing-mass>]

where $\( v_alpha \)$ is an orthonormal spin basis and $sup_h parallel psi_h parallel < oo$. Every assertion with local hypotheses means the following: multiply by a fixed smooth gauge-invariant cutoff supported in the specified compact neighborhood, and assume the stated graph bounds there. Such multiplication preserves the bounds, because the commutator with a charge is Clifford multiplication by the cutoff gradient and is independent of $h$ and $m$. All constants below may depend on that neighborhood and cutoff, $N$, and, in the second regime, $C_0$.

=== 4.1 Local estimates and spectral slices <local-estimates-and-spectral-slices>

#thm([Lemma 4.1.])[
  (Raw local estimates).  #emph[In either regime, for states supported in a fixed compact set, 
#[#set math.equation(numbering: n => "(4.2)")
 $ parallel nabla psi_h parallel lt.eq C sqrt(h) \, #h(2em) sum_(i < j) parallel \[ x_i \, x_j \] psi_h parallel lt.eq C h^(- 1 \/ 2) . $ <eq:raw-estimates>]

 Consequently every weak limit of the squared norm measures on compact sets is supported on commuting configurations.]
] <lem:raw-estimates>

#proof[
  For fixed $m$, its multiplication term is bounded on the support, so $parallel D_v \( h \, 0 \) psi_h parallel = O \( 1 \)$. The undeformed square identity of Proposition 2, with the fermion term bounded below by $- C h \| x \|$, gives
  $ parallel p psi_h parallel^2 + h^2 sum_(i < j) parallel \[ x_i \, x_j \] psi_h parallel^2 lt.eq C #scale(x: 120%, y: 120%)[\(] parallel D_v \( h \, 0 \) psi_h parallel^2 + h parallel psi_h parallel^2 #scale(x: 120%, y: 120%)[\)] . $
  For (4.1), average the sixteen squared charges. The energy is $o \( m_h^2 \)$, and the fermion term on the support has norm at most $C \( h + m_h \)$. In each shifted bosonic square use $\| a - b \|^2 gt.eq 1 / 2 \| a \|^2 - \| b \|^2$. The subtracted terms are bounded by $C m_h^2 parallel psi_h parallel^2$. Since $m_h^2 = O \( h \)$, the same conclusion follows. These form estimates extend from the invariant core by Lemma 4. Finally, on a compact set separated from the commuting locus, the continuous function $sum_(i < j) \| \[ x_i \, x_j \] \|^2$ has a positive minimum. The second estimate therefore makes the norm on that set tend to zero. ◻
]

Fix a commuting configuration with $k gt.eq 2$ distinct joint centers and multiplicities $n_1 \, dots.h \, n_k$. Write

$ frak(k) = frak(k)_0 xor frak(n) \, #h(2em) frak(k)_0 = (xor.big_(alpha = 1)^k frak(u) \( n_alpha \)) ∩ frak(s u) \( N \) \, $

orthogonally for the trace metric. The full block unitary group $K_0 = product_(alpha = 1)^k "U" \( n_alpha \)$ acts on this splitting; its central torus is $Z_0$. Its scalar diagonal subgroup acts trivially by conjugation. Choose a unit spatial vector $e$ whose scalar products with the centers are all distinct. Complete $e$ to an orthonormal spatial frame and use $r$ for the eight remaining frame indices. The definitions of $A_i$, $B_(i j)$, and $L_i$ are transformed as tensors when this frame is used.

#thm([Lemma 4.2.])[
  (Exact slice and charge).  #emph[In a neighborhood of the chosen configuration, gauge-equivariant functions are equivalent to $K_0$-equivariant functions on 
$ x = b + z \, #h(2em) b in frak(k)_0^9 \, #h(2em) z in e^perp ⊗ frak(n) . $

 The block spectra of $b_e$ lie in fixed disjoint windows. Up to a fixed positive orbit-volume constant, the density on the slice is 
#[#set math.equation(numbering: n => "(4.3)")
 $ j \( b \) = \| det_(frak(n)) K_e \( b \) \| \, #h(2em) K_e \( b \) = "ad" \( b_e \) \|_(frak(n)) . $ <fast:density>]

 It is independent of $z$. The exact normalization is as follows. Give $"U" \( N \) \/ K_0$ the invariant volume induced by the trace metric on the off-block color space, let $V_C$ be its total volume, and use normalized Haar measure when integrating the gauge orbit. With fixed labeled spectral windows the integrated slice measure is $V_C j \( b \) thin upright(d) b thin upright(d) z$. Thus, with $d_f = 8 dim frak(n)$, the unitary flat-measure pullback is 
#[#set math.equation(numbering: n => "(4.4)")
 $ psi \( b \, t \) = V_C^(1 \/ 2) j \( b \)^(1 \/ 2) h^(- d_f \/ 4) Psi \( b + t \/ sqrt(h) \) . $ <fast:unitary-normalization>]

 Here the original field is restricted to the slice on the right. A fixed labeled chart has no additional permutation multiplicity. When all labels are used, division by the number of permutations of equal-sized blocks gives the quotient measure used in Definition 19. The same positive normalization is used in the inverse pullback for every test state. In these coordinates, 
#[#set math.equation(numbering: n => "(4.5)")
 $ D_v \( h \, m \) = sqrt(h) thin E_v \( b \) + D_v^s \( h \, m \) + R_v \( h \, m \) . $ <eq:slice-charge>]

 Here $D_v^s$ is precisely the charge on $frak(k)_0^9$, including all its $h \[ b_i \, b_j \]$ multipliers. The operator $E_v \( b \)$ is an odd linear oscillator in $\( p_t \, t \)$ using only fast fermions, with smooth coefficients independent of $h \, m$. On a smaller chart the raw estimates imply 
#[#set math.equation(numbering: n => "(4.6)")
 $ parallel h^(- 1 \/ 2) p_b psi_h parallel + parallel p_t psi_h parallel + parallel t psi_h parallel lt.eq C . $ <fast:chart-raw>]

]
] <lem:slice>

#proof[
  The spectral projections of $x_e$ onto the chosen windows identify its block subspaces uniquely up to $K_0$. Smooth local choices of frames give the slice. The differential of conjugation in an off-block color $w in frak(n)$ has missing component $\[ w \, b_e \]$. All other differential components occur below this block in the Jacobian matrix, whose other diagonal blocks are the identity on the slice and the fixed homogeneous space measure. This proves (4.3) exactly. Invertibility of $K_e$ and uniform bounds on its inverse follow from the spectral gaps. The same spectral-window parametrization allows arbitrary $z$; small $z$ is needed only to stay in the original compact neighborhood.
  Here are coordinate formulas that also fix the content of the remainder. Let $\( n_A \)$ be an orthonormal basis of $frak(n)$ and set
  $ w_A \( b \) = - K_e \( b \)^(- 1) n_A \, #h(2em) \[ w_A \( b \) \, b_e \] = n_A . $
  Write $theta_f$ and $theta_s$ for fast and slow color Clifford variables. Before density conjugation, gauge equivariance gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ chevron.l \[ w \, b_e \] \, p_e chevron.r = - sum_r chevron.l \[ w \, b_r + z_r \] \, p_r chevron.r - upright(i) / 2 theta^t "ad" \( w \) theta . $ <fast:gauge-momentum>]
  All coefficients in this identity multiply derivatives on their left. In particular, for $t_e = 0$, the exact fast operator is
  #[#set math.equation(numbering: n => "(4.8)")
   $ E_v \( b \) =  & sum_r theta_f \( A_r \) dot.op p_(t_r) - sum_(A \, r) theta_f^A \( A_e \) chevron.l \[ w_A \, b_r \] \, p_(t_r) chevron.r\
 & + sum_(i < j) theta_f \( B_(i j) \) dot.op #scale(x: 120%, y: 120%)[\(] \[ b_i \, t_j \] + \[ t_i \, b_j \] #scale(x: 120%, y: 120%)[\)] . $ <fast:E-coordinate>]
  If $Pi_0$ and $Pi_perp$ denote the color projections onto $frak(k)_0$ and $frak(n)$, respectively, the remaining terms before the density correction are
  #[#set math.equation(numbering: n => "(4.9)")
   $ R_v =  & sum_(i < j) theta \( B_(i j) \) dot.op \[ t_i \, t_j \] + m / sqrt(h) sum_i theta_f \( L_i \) dot.op t_i\
 & - sum_(A \, r) theta_f^A \( A_e \) chevron.l Pi_perp \[ w_A \, t_r \] \, p_(t_r) chevron.r\
 & - 1 / sqrt(h) sum_(A \, r) theta_f^A \( A_e \) chevron.l Pi_0 \[ w_A \, t_r \] \, p_(b_r) chevron.r - upright(i) / 2 sum_A theta_f^A \( A_e \) theta^t "ad" \( w_A \) theta . $ <fast:R-coordinate>]
  The formula after density conjugation is obtained by replacing every $p_(b_i)$ by $p_(b_i) + upright(i) / 2 partial_(b_i) log j$, and putting the added terms in $R_v$. In this spatial frame $j$ depends only on $b_e$, so the added term is simply
  #[#set math.equation(numbering: n => "(4.10)")
   $ upright(i) / 2 theta_s \( A_e \) dot.op nabla_(b_e) log j . $ <fast:density-term>]
  These formulas include the Clifford signs of the actual full module; when it is written as a graded tensor product, the fast odd operator has the usual slow-parity factor. They show in particular that the only derivative terms in $R_v$ have types $t p_t$ and $h^(- 1 \/ 2) t p_b$. All coefficients and their derivatives are bounded on compact subcharts.
  Tangential derivatives on the linear slice are restrictions of ambient derivatives. Gauge integration and the bounded positive density transfer the first raw estimate to these derivatives; density conjugation adds a bounded multiplier. The substitution $z = t \/ sqrt(h)$ then bounds $p_t$ and $p_b \/ sqrt(h)$. Finally,
  $ \[ x_e \, x_r \]_(frak(n)) = \[ b_e \, z_r \] $
  and the uniform inverse of $K_e$ transfer the second raw estimate to $parallel t psi_h parallel lt.eq C$. ◻
]

=== 4.2 The neutral fast oscillator <the-neutral-fast-oscillator>

The slow variables and their fermions are fixed by $Z_0$. Thus a $K_0$-equivariant slice function belongs, in its fast variables and fast fermions together, to the fixed Hilbert space of $Z_0$-neutral states. We always restrict $E_v \( b \)$ to this space. Neutrality means invariance for the whole central torus; separate invariance in every individual real color plane is not required.

#thm([Lemma 4.3.])[
  (The neutral fast line).  #emph[Let $c$ range in a compact set of scalar block configurations with distinct centers and with the chosen $e$-separations bounded below. On the neutral space, $E_v \( c \)$ has a one-dimensional even kernel, independent of $v$, and a gap bounded below uniformly on this compact set and on unit spinors $v$. For $b$ sufficiently close to that set, including noncommuting $b$, it has an even rank-one kernel projection $P_v \( b \)$ and a uniformly bounded inverse on $"ran" \( 1 - P_v \( b \) \)$.]
  #emph[Let $cal(W)^s$ be the oscillator Sobolev spaces defined below. For every prescribed finite integer $L$, the neighborhood can be chosen so that the parameter derivatives of $P_v$ and a normalized section $chi_v \( b \)$ through order $L$ have bounded oscillator moments through order $L$. The reduced inverse, extended by zero on the kernel, and its parameter derivatives through order $L$ are uniformly bounded as maps $cal(W)^s arrow.r cal(W)^(s + 1)$ for $0 lt.eq s lt.eq L$. The section can be chosen $K_0$-equivariantly so that its Berry form vanishes at $b = c$ in every slow direction. At scalar centers these sections are compatible with block permutations and the $"Spin" \( 3 \) times "Spin" \( 6 \)$ action, with no additional scalar character.]
] <lem:fast-line>

#proof[
  We first compute the scalar-center oscillator and its gap. Perturbing that operator will give the exact fast line for nearby noncommuting blocks and its regularity. We then choose the phase needed for diagonal compression and for transport between cluster charts.
  #emph[The oscillator at scalar centers.] Change from the $e$-slice to the perpendicular slice for the linear conjugation directions $\( \[ w \, c_i \] \)_i$, including the positive linear density factor. For one real two-dimensional color plane joining two distinct blocks, let $lambda in bb(R)^9$ be their signed center difference, $r = \| lambda \|$, and $J$ the orthogonal complex structure on that plane, so that $"ad" \( c_j \) = lambda_j J$. There are sixteen real transverse bosonic coordinates: eight spatial directions times two color directions. The charge on them is
  $ theta_f \( A_i \) dot.op p_i^q + sum_(i < j) theta_f \( B_(i j) \) dot.op J \( lambda_i q_j - lambda_j q_i \) \, #h(2em) q perp lambda \, quad p^q perp lambda . $
  To check the square, rotate $lambda$ to $r e_9$ and put $s = v^t gamma^9 v$. The summand becomes
  $ sum_(i = 1)^8 #scale(x: 120%, y: 120%)[\(] theta_f \( gamma^i v \) dot.op p_i^q + r theta_f \( gamma^i gamma^9 v \) dot.op J q_i #scale(x: 120%, y: 120%)[\)] \, $
  and the Clifford identity used in Proposition 2 gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ 1 / 2 #scale(x: 120%, y: 120%)[\(] \( p^q \)^2 + r^2 q^2 #scale(x: 120%, y: 120%)[\)] + r s thin p^q dot.op J q + frac(upright(i) r, 2) theta_f^t #scale(x: 120%, y: 120%)[\[] J ⊗ \( s upright("Id") - gamma^9 \) #scale(x: 120%, y: 120%)[\]] theta_f . $ <fast:one-plane-square>]
  There are no cross terms between disjoint Clifford summands. Summing their orbital terms before imposing neutrality gives the gauge generator for the single central color $sum_j \( v^t gamma^j v \) c_j$. Equation (4.7) for this central generator cancels the scalar-spin terms in (4.11). Hence, on the neutral space,
  #[#set math.equation(numbering: n => "(4.12)")
   $ E_v \( c \)^2 = H_(upright("osc")) \( c \) - upright(i) / 2 theta_f^t #scale(x: 120%, y: 120%)[\(] "ad" \( c_j \) \|_(frak(n)) ⊗ gamma^j #scale(x: 120%, y: 120%)[\)] theta_f . $ <fast:neutral-square>]
  In particular this square is independent of $v$.
  Each real color plane contributes bosonic ground energy $8 r$. Its thirty-two real fermions give sixteen Clifford oscillators of frequency $r$, with unique spin ground energy $- 8 r$. In the color-complex polarization the latter fills eight modes and leaves eight empty, so its central color charge is zero; the positive Gaussian is neutral as well. Their product is therefore in the neutral space. The nonnegative oscillator occupation numbers show that this product is the only zero vector up to scalar, and every other eigenvalue of the square is bounded below by the smallest center distance. Restriction to the neutral space cannot reduce that bound. This proves the kernel and gap assertions at centers.
  #emph[Perturbation to noncommuting blocks.] The subsequent first-order estimates use both differentiated projections and oscillator moments. At a reference center $c_(*)$ define $cal(W)^s$ by the norm $parallel \( 1 + cal(N) \)^(s \/ 2) f parallel$, where $cal(N)$ is its positive bosonic oscillator number operator; the fermion space is finite. These are restricted to neutral vectors. The creation and annihilation relations and (4.12) imply
  $ parallel p_t f parallel + parallel t f parallel lt.eq C \( parallel E_v \( c_(*) \) f parallel + parallel f parallel \) . $
  They also imply, on a circle enclosing zero alone, that $\( E_v \( c_(*) \) - zeta \)^(- 1) : cal(W)^s arrow.r cal(W)^(s + 1)$ is bounded for every fixed $s$. For completeness, the square is an oscillator number operator plus a bounded spin matrix. Each application of $t$ or $p_t$ changes the number by one, and its coefficient is bounded by a constant times $\( 1 + cal(N) \)^(1 \/ 2)$. The resolvent can be written $\( E_v \( c_(*) \) + zeta \) \( E_v \( c_(*) \)^2 - zeta^2 \)^(- 1)$; its two factors respectively lose one and gain two such orders. This proves the claimed bound, including nonintegral $s$ if needed.
  The central torus fixes $b$, and $K_e \( b \)$, its inverse, and all $"ad" \( b_r \) \|_(frak(n))$ commute with its action. Thus $E_v \( b \)$ preserves the same neutral space even when $b$ is noncommuting. Its real linear coefficients make it symmetric on the neutral Schwartz core. The coefficient formula (4.8) gives, for every fixed finite range of $s$,
  $ parallel E_v \( b \) - E_v \( c_(*) \) parallel_(cal(W)^(s + 1) arrow.r cal(W)^s) lt.eq C_s \| b - c_(*) \| . $
  Choose the neighborhood so that the resolvent Neumann series converges on each of these finitely many spaces. On $cal(W)^0$ the same relative bound, made smaller than one, gives self-adjointness on the reference domain. The contour projection has constant rank one. It commutes with parity, and its range remains entirely even by continuity. Since $E_v \( b \)$ preserves this range and reverses parity, its restriction to the range is zero. The complementary inverse can equivalently be formed from $\( E_v \( b \) + P_v \( b \) \)^(- 1) \( 1 - P_v \( b \) \)$. Differentiating its resolvent formula and using
  $ partial_b \( E_v \( b \) - zeta \)^(- 1) = - \( E_v \( b \) - zeta \)^(- 1) \( partial_b E_v \( b \) \) \( E_v \( b \) - zeta \)^(- 1) $
  proves all stated finite-order bounds after increasing the finite range of oscillator orders. None of this uses $\[ b_i \, b_j \] = 0$.
  #emph[A compatible phase.] For a fixed oriented color pair, the spin ground line over $lambda \/ r in S^8$ is homogeneous under $"Spin" \( 9 \)$. The underlying orthogonal action lifts to the Clifford module as an honest action because $"Spin" \( 9 \)$ is simply connected. Its stabilizer $"Spin" \( 8 \)$ acts on the line by a character. A connected semisimple compact group has no nontrivial continuous characters, so it fixes a chosen unit vector. Transport therefore defines a $"Spin" \( 9 \)$-equivariant unit section. Its Berry one-form is invariant on $S^8$, and hence zero: the tangent representation of $"Spin" \( 8 \)$ has no fixed covector. The normalized real positive Gaussian also has zero Berry form.
  For directions in the last six axes, the unit skew ground-frequency matrix anticommutes with the complex structure $T$ used for the exterior module. The projection between the corresponding complex annihilator spaces has squared norm $1 \/ 2$ on unit vectors, and is invertible. The new annihilators are consequently a graph over the old ones. Their vacuum has a nonzero degree-zero coefficient: if the lowest nonzero exterior component had positive degree, the graph annihilation equations in one lower degree would make all ordinary contractions of that component zero, an impossibility. This graph vacuum is even. We fix its phase by positive overlap with the empty $T$-vacuum. The overlap convention is consistent as the last-six direction varies, by $"Spin" \( 6 \)$ covariance.
  The block group and its block permutations preserve the empty $T$-vacuum by their natural exterior actions. Thus on last-six center configurations the product ground section is block invariant and has exactly the permutation transformation law of the underlying coordinates, without a scalar factor. Reordering its pair factors adds no sign, since each is even. These sections are parallel as functions of the labeled distinct centers. The quotient of two sections related by a permutation is therefore locally constant. The space of distinct labeled points in $bb(R)^9$ with trace-zero weighted mean is connected; removing the coincidence subspaces of codimension nine does not disconnect it. Agreement on last-six configurations proves agreement everywhere. The same construction gives covariance under $"Spin" \( 3 \) times "Spin" \( 6 \)$. These statements concern the fast line; the graded permutation on slow factors is still the ordinary one.
  Let $c = c \( b \)$ be the scalar block-center projection. If $xi \( c \)$ is the unit section just constructed, set
  #[#set math.equation(numbering: n => "(4.13)")
   $ chi_v \( b \) = frac(P_v \( b \) xi \( c \( b \) \), parallel P_v \( b \) xi \( c \( b \) \) parallel) . $ <fast:section-choice>]
  The denominator is bounded away from zero on a smaller neighborhood. This prescription is $K_0$-equivariant. In internal directions at $b = c$, $xi$ is constant and $P \( partial P \) P = 0$ shows that $chevron.l chi_v \, partial_b chi_v chevron.r = 0$. In center directions the same assertion is the zero Berry form already proved. Smooth transverse linear coordinate changes, implemented with the positive square root of the absolute Jacobian, do not change it: they send the normalized positive real Gaussian to a normalized positive real Gaussian, whose inner product with its derivative is zero. ◻
]

=== 4.3 Projection and the effective slow charge <projection-and-the-effective-slow-charge>

First-order oscillator projection and the cancellation between gauge spin and slice density occur in the regular Cartan analysis of Hasler–Hoppe #cite(label("HaslerHoppeFactorization2002")). We need the following uniform estimates also for nearby noncommuting blocks and for the separate growing-mass regime.

#thm([Lemma 4.4.])[
  (Projection and the slow graph bound).  #emph[In a compact subchart of Lemma 16, in either of the two local regimes, 
#[#set math.equation(numbering: n => "(4.14)")
 $ parallel \( 1 - P_v \) psi_h parallel arrow.r 0 \, #h(2em) parallel D_v^s \( h \, m \) P_v psi_h parallel lt.eq cases(delim: "{", O \( 1 \) \, & m upright(" fixed") \,, o \( m \) \, & upright("in ") upright("(4.1)") .) $ <eq:fast-projection>]

 The second norm is on the full $\( b \, t \)$ space. In the fixed-mass case, writing $P_v psi_h = chi_v \( b \) eta_h \( b \)$ gives a bounded graph norm for $D_v^s \( h \, 0 \) eta_h$, where $eta_h$ has the ordinary slow $K_0$-equivariance.]
] <lem:fast-projection>

#proof[
  For each fixed $h$, local ellipticity of the original charge puts a compactly supported graph-domain vector in $H_(upright("loc"))^1$. Gauge equivariance and the smooth orbit–slice coordinates transfer this regularity to the slice, by orbit integration, on compact subcharts. After a compact fast cutoff, $E_v psi$ and $D_v^s psi$ are therefore separately in $L^2$: the slow multipliers are bounded on the compact slow support for that fixed $h$. Local smoothing justifies the following squared-norm identities before any uniform bound on these separate operators is invoked.
  Choose an even scalar cutoff $rho_M \( t \)$ equal to one for $\| t \| lt.eq M$, supported in $\| t \| lt.eq 2 M$, and with gradient bounded by $C \/ M$. It is $K_0$-invariant. Equation (4.6) gives $parallel \( 1 - rho_M \) psi_h parallel lt.eq C \/ M$. For fixed $M$, the explicit remainder formula shows
  $ parallel h^(- 1 \/ 2) R_v rho_M psi_h parallel arrow.r 0 . $
  Indeed the respective bounds are constants depending on $M$ times $h^(- 1 \/ 2)$ for $t^2$, spin, and density terms; $h^(- 1 \/ 2) parallel p_t psi_h parallel$ for $t p_t$; $h^(- 1) parallel p_b psi_h parallel$ for $t p_b \/ sqrt(h)$; and $m \/ h$ for the mass term. The cutoff commutator with $D_v \/ sqrt(h)$ is bounded by $C \/ M + o \( 1 \)$. Also $parallel D_v psi_h parallel \/ sqrt(h) arrow.r 0$ in both regimes. Consequently
  #[#set math.equation(numbering: n => "(4.15)")
   $ limsup_(h arrow.r oo) parallel \( E_v + h^(- 1 \/ 2) D_v^s \) rho_M psi_h parallel lt.eq C \/ M . $ <fast:cut-charge>]
  Every slow bracket and mass Clifford multiplier anticommutes with $E_v$. In particular, the potentially large multiplier $h \[ b \, b \]$ produces no anticommutator. Only slow differentiation of its coefficients remains:
  $ { E_v \, D_v^s } = - upright(i) sum_(i \, Q) theta_s^Q \( A_i \) thin partial_(b_i^Q) E_v . $
  On $rho_M psi_h$ its expectation is bounded uniformly for fixed $M$, because $partial_b E_v$ is linear in $\( p_t \, t \)$ and (4.6) bounds their norms. Squaring (4.15), dropping the nonnegative slow square, and using the fast gap thus gives
  $ limsup_(h arrow.r oo) parallel \( 1 - P_v \) rho_M psi_h parallel lt.eq C' \/ M . $
  The tail estimate and then $M arrow.r oo$ prove the first assertion.
  For the second assertion, it is enough to estimate the projected remainder. The rank-one projection, its oscillator moments, and integration by parts in $t$ give the uniform bound
  #[#set math.equation(numbering: n => "(4.16)")
   $ parallel P_v R_v psi_h parallel lt.eq C (\( 1 + m \/ sqrt(h) \) parallel psi_h parallel + parallel p_b psi_h \/ sqrt(h) parallel) . $ <fast:projected-remainder>]
  To see each term, $t^2$ moves onto the oscillator bra; in $t p_t$ the derivative moves onto that bra and $t$; spin and density terms are bounded; $t p_b \/ sqrt(h)$ uses the bounded bra $t chi_v$ and the last norm on the right; and the fast mass term uses $t chi_v$ and $m \/ sqrt(h)$. Thus no norm estimate for the unprojected $R_v psi_h$ is asserted or needed. Moreover
  $ \[ D_v^s \, P_v \] = - upright(i) sum_(i \, Q) theta_s^Q \( A_i \) partial_(b_i^Q) P_v $
  is bounded: the even projection commutes with all slow Clifford multipliers. Projecting (4.5) now gives
  $ D_v^s P_v psi_h = P_v D_v psi_h - P_v R_v psi_h + \[ D_v^s \, P_v \] psi_h . $
  Equations (4.6) and (4.16) prove the claimed estimates. Finally, differentiating $chi_v eta_h$ costs a bounded derivative of $chi_v$; the fixed mass multiplier is bounded on the chart. Removing the section therefore gives the asserted undeformed slow graph bound. Its equivariance follows from (4.13). ◻
]

#thm([Lemma 4.5.])[
  (Diagonal compression at scalar blocks).  #emph[For fixed $m$, identify the range of $P_v \( b \)$ with the slow Clifford fiber by $a mapsto chi_v \( b \) a$. At $b = c$, the diagonal compression of (4.5) has exactly the slow derivative symbol and the slow order-zero terms of $D_v^s \( h \, m \)$, apart from terms whose coefficients tend to zero as $h arrow.r oo$. More precisely, after discarding explicitly $h^(- 1 \/ 2)$-small coefficients, all additional order-zero coefficients are smooth and vanish at $b = c$.]
] <lem:diagonal-compression>

#proof[
  The Berry term vanishes by Lemma 16. The outer fast fermion in each $t p_t$ or $t p_b$ term makes its diagonal matrix element zero, also when a slow derivative acts on the even section. The slow-color part of $\[ t_i \, t_j \]$ has zero Gaussian expectation: on each cross-block color space the covariance is a symmetric spatial matrix times the color identity, whose contraction with the antisymmetric color bracket is zero. Its fast-color part and the other purely fast odd terms have zero matrix element by parity.
  We verify the remaining orbit-spin and density cancellation for every slow color, including internal traceless colors. For a slow orthonormal basis color $q in frak(k)_0$, put
  $ K_q = "ad" \( q \) \|_(frak(n)) \, #h(2em) K_e = "ad" \( c_e \) \|_(frak(n)) . $
  There can be no term containing three slow fermions in the orbit-spin substitution: for $w in frak(n)$ the slow-to-slow block of $"ad" \( w \)$ is zero. Its fast-to-fast block, after the outer fast fermion is included, has odd fast degree and has zero expectation. Only the mixed slow-fast block contributes.
  On a cross-block space joining blocks $alpha \, beta$, one has $K_e = delta_(alpha beta \, e) J_(alpha beta)$ with $delta_(alpha beta \, e) eq.not 0$. The operator $K_q$ preserves this space and is real skew. The fast ground two-point matrix is $1 / 2 upright("Id")$ plus an imaginary skew matrix whose color factor is $J_(alpha beta)$ and whose spin factor is the signed unit center-difference Clifford matrix. Its imaginary part in the mixed contraction has color trace
  #[#set math.equation(numbering: n => "(4.17)")
   $ "Tr" #scale(x: 120%, y: 120%)[\(] J_(alpha beta) K_q K_e^(- 1) #scale(x: 120%, y: 120%)[\)] = delta_(alpha beta \, e)^(- 1) "Tr" K_q = 0 . $ <fast:imaginary-cancellation>]
  The equality follows by cyclicity and $J_(alpha beta)^2 = - upright("Id")$; it does not require $q$ to be central. The spin coefficient can therefore be left arbitrary in this cancellation.
  For clarity, the real scalar contraction can be computed without a symmetry argument. With the fast fermion ordered before the slow one, the mixed entries of $"ad" \( w_A \)$ are $\[ w_A \, q \] = - K_q w_A$, and their two orders combine to twice this coefficient. Multiplying by $- upright(i) / 2 theta_f^A \( A_e \)$ from (4.9) and using $chevron.l theta_(f \, mu)^A theta_(f \, nu)^B chevron.r_(upright("scalar")) = 1 / 2 delta_(A B) delta_(mu nu)$ gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ - upright(i) / 2 "Tr"_(frak(n)) \( K_e^(- 1) K_q \) theta_s^q \( A_e \) . $ <fast:scalar-spin>]
  On the other hand, differentiating the determinant in (4.3) gives
  $ partial_(b_e^q) log j \|_(b = c) = "Tr"_(frak(n)) \( K_e^(- 1) K_q \) . $
  The density term (4.10) is exactly the opposite of (4.18). This proves the cancellation for every $q$. There are no terms to check in other spatial directions: $j$ depends only on $b_e$, and only the $e$-momentum was eliminated. The finitely many remaining $h^(- 1 \/ 2)$ coefficients are explicitly visible in (4.9). Smoothness and the oscillator bounds prove the last assertion of the lemma. ◻
]

Fast projection now locates the leading state and identifies its diagonal slow charge. The next section cancels the remaining transverse charge output, so that the slow equation can be passed to limits by duality.

== 5 Profile spaces and corrected test states <lift:section>

Throughout this section the mass $m gt.eq 0$ is fixed. Projection to the fast line identifies where a bounded family can concentrate. To identify its limiting charge, we also need test states whose charge outputs converge in norm. The uncorrected oscillator product has an order-one component perpendicular to the fast line. The inverse of the fast charge removes this component with a correction of size $h^(- 1 \/ 2)$. Such reduced-inverse corrections occur in the asymptotic expansions of Konechny #cite(label("Konechny1999")), Fröhlich et al. #cite(label("FroehlichEtAl2000")), and Lin–Yin #cite(label("LinYin2015")) Section 4.1. Here we prove convergence of the corrected charge output in the norm required for duality. We give this construction without imposing any moment condition on an internal $L^2$ kernel vector.

#prodef([Definition 5.1.])[
  (Profile space).  For an unordered partition $C = \( n_1 \, dots.h \, n_k \)$ of $N$, with $k gt.eq 2$, let its labeled center space be
  $ cal(Z)_C = {\( c_1 \, dots.h \, c_k \) in \( bb(R)^9 \)^k : sum_alpha n_alpha c_alpha = 0} \, #h(2em) \| upright(d) c \|^2 = sum_alpha n_alpha \| upright(d) c_alpha \|^2 . $
  Write $cal(Z)_C^compose$ for the complement of the coincidence sets $c_alpha = c_beta$. Its center Clifford module is denoted by $cal(F)_C$. Set $cal(K)_n = ker H_n$ and $cal(K)_1 = bb(C)$, and form the Hilbert tensor product
  $ cal(V)_C = cal(F)_C thin hat(⊗) thin hat(⨂)_(alpha = 1)^k cal(K)_(n_alpha) . $
  The profile Hilbert space $cal(P)_C$ is $L^2 \( cal(Z)_C^compose \; cal(V)_C \)$ with the simultaneous coordinate and fiber symmetry for permutations of equal-sized blocks. The fiber action uses the natural center Clifford action and the graded permutation of internal factors. Lebesgue measure is that of the displayed trace metric, divided by the number of such permutations; equivalently one uses its quotient measure. No finite-dimensionality of the spaces $cal(K)_n$ is built into this definition.
  On $cal(P)_C$ the candidate charge is the abelian center operator
  #[#set math.equation(numbering: n => "(5.1)")
   $ D_v^C \( m \) = theta_C \( A_i \) dot.op p_(c_i) + m theta_C \( L_i \) dot.op c_i \, $ <lift:center-charge>]
  where all contractions are in orthonormal trace coordinates on $cal(Z)_C$. Define $cal(T)_C$ to be the space of finite sums of smooth compactly supported center functions on $cal(Z)_C^compose$ with fiber values in algebraic tensor products of actual internal kernel vectors, symmetrized as above.
] <def:profile-space>

The tests $cal(T)_C$ are dense in $cal(P)_C$ even before anything is known about the dimensions of its internal factors: finite algebraic tensors are dense in a Hilbert tensor product, ordinary compactly supported smooth functions are dense in $L^2$ on the open center space, and the finite permutation average is a bounded projection. The graph closure across collisions will be established in Lemma 25; at this stage the tests are deliberately supported away from collisions.

We use the following notation for their leading identification. In a chart of Section 4, let $c = c \( b \)$ and $xi = b - c$. The internal variables have total dimension

$ d_(upright("int")) = 9 sum_(alpha = 1)^k \( n_alpha^2 - 1 \) . $

For $f in cal(T)_C$, interpret each kernel factor as its wavefunction in $y = h^(1 \/ 3) xi$, and multiply the resulting unitary rescaling by fixed smooth block-invariant cutoffs in $xi$, equal to one near zero and supported inside the chart. Denote the resulting slow state by $f_h$. The unitary internal scaling contributes the factor $h^(d_(upright("int")) \/ 6)$. The leading local identification is

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(J)_h f = chi_v \( c \) f_h $ <lift:leading-identification>]

in the flat $\( b \, t \)$ coordinates; the center section $chi_v \( c \)$ is independent of $v$. When necessary a fixed physical $z$ cutoff, equal to one near zero, is included. Different fixed cutoffs of this kind change (5.2) by $o \( 1 \)$ in norm. We will show below that chart choices are equally immaterial.

#thm([Proposition 5.2.])[
  (Corrected test lifts).  #emph[Fix $m gt.eq 0$, a unit spinor $v$, and a partition $C$ with $k gt.eq 2$. For every $f in cal(T)_C$ there are gauge-singlet graph-domain states $I_(h \, v \, m) f$, defined for all sufficiently large $h$, such that 
#[#set math.equation(numbering: n => "(5.3)")
 $ parallel I_(h \, v \, m) f - cal(J)_h f parallel & arrow.r 0 \,\
parallel D_v \( h \, m \) I_(h \, v \, m) f - cal(J)_h \( D_v^C \( m \) f \) parallel & arrow.r 0 . $ <lift:graph-convergence>]

 The construction is linear on any fixed finite-dimensional space of tests, and both conclusions hold simultaneously for every fixed finite test family. In particular, all inner products of their leading states and indicated charge outputs converge to the corresponding profile inner products. For distinct partitions the families, including their outputs, are asymptotically orthogonal. The leading identifications intertwine block permutations and $"Spin" \( 3 \) times "Spin" \( 6 \)$; each fixed symmetry may be passed through these norm limits. The lifts may depend on $v$ and $m$.]
] <prop:test-lifts>

#proof[
  We first work in one labeled center chart. All its cutoffs may be chosen the same for a fixed finite family of tests. Internal kernel vectors have the local Sobolev regularity supplied by Lemma 4. Thus the expressions below are distributionally defined with the indicated local derivatives, even when a kernel vector has no global moment or global derivative bound.
  Consider one internal factor $phi.alt in cal(K)_n$. If its physical cutoff is $kappa \( xi \)$, its unitary rescaling is
  $ phi.alt_h \( xi \) = h^(9 \( n^2 - 1 \) \/ 6) phi.alt \( h^(1 \/ 3) xi \) . $
  Exact scaling of the undeformed charge gives $D_v \( h \, 0 \) phi.alt_h = 0$ distributionally. Hence
  $ D_v \( h \, 0 \) \( kappa phi.alt_h \) = - upright(i) theta \( A_i \) dot.op \( partial_i kappa \) phi.alt_h . $
  The derivative of $kappa$ is bounded and supported at a fixed positive physical distance from zero. Changing variables to $y$ shows that its right-hand side tends to zero in norm by the $L^2$ tail of $phi.alt$. This holds for every internal factor and every fixed spinor. It also shows that the cutoff products converge in norm, under internal rescaling, to the uncut products.
  The crucial additional estimate is separate smallness of the derivative and bracket terms:
  #[#set math.equation(numbering: n => "(5.4)")
   $ parallel p_b f_h \/ sqrt(h) parallel + sum_(i < j) parallel sqrt(h) thin \[ b_i \, b_j \] f_h parallel arrow.r 0 . $ <eq:kernel-scaled-estimate>]
  To prove it, use the undeformed square identity on each cut-off internal factor and divide by $h$. Its fermion term is bounded in absolute value by $C h \| xi \|$. Summing the internal factors gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ 1 / h parallel p_xi f_h parallel^2 + h sum_(i < j) parallel \[ b_i \, b_j \] f_h parallel^2 lt.eq C / h sum_alpha parallel D_(v \, alpha) \( h \, 0 \) f_h parallel^2 + C integral #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] sum_alpha \| xi_alpha \| #scale(x: 180%, y: 180%)[\)] \| f_h \|^2 . $ <lift:separate-energy>]
  Here the bracket is internal, since the scalar centers commute with all block variables. The first term tends to zero by the cutoff calculation. In the second, every $xi_alpha$ is bounded on the fixed physical support, while its norm measure concentrates at zero. To verify convergence directly, split its integral at $\| xi_alpha \| = epsilon$: the inner contribution is bounded by $C epsilon$, and the outer contribution tends to zero by the rescaled $L^2$ tail. First let $h arrow.r oo$, then $epsilon arrow.b 0$. Center derivatives of $f_h$ are uniformly bounded, so adding them divided by $sqrt(h)$ proves (5.4). The same splitting proves $parallel xi f_h parallel arrow.r 0$; the fixed-mass internal term is therefore negligible. This proof uses only bounded physical cutoffs and $L^2$ of the uncut kernels.
  We now identify the output that the correction must cancel. Let $R_v^(\( 0 \)) \( b \)$ be the density-conjugated remainder in (4.9)–(4.10) after removing the fast mass term and the term containing $h^(- 1 \/ 2) p_b$. Thus $R_v^(\( 0 \))$ contains the quadratic $\[ t \, t \]$ multiplier, the $t p_t$ term, the orbit-spin term, and the density term. It is independent of $h \, m$ and differentiates only the fast variables. Define the oscillator-vector map on the slow Clifford fiber by
  #[#set math.equation(numbering: n => "(5.6)")
   $ A \( b \) = - upright(i) sum_(i \, Q) theta_s^Q \( A_i \) partial_(b_i^Q) chi_v \( b \) + R_v^(\( 0 \)) \( b \) chi_v \( b \) . $ <lift:residual-map>]
  The fast output of the uncorrected state $chi_v \( b \) f_h$ is zero, and its full charge output is
  #[#set math.equation(numbering: n => "(5.7)")
   $ D_v \( h \, m \) \( chi_v \( b \) f_h \) = chi_v \( b \) \( D_v^C \( m \) f \)_h + A \( b \) f_h + o_(L^2) \( 1 \) . $ <lift:uncorrected-output>]
  Indeed the internal undeformed outputs and internal mass terms tend to zero by the cutoff calculation above. The removed slow derivative term tends to zero by (5.4) when it differentiates $f_h$, and by the bounded derivatives of $chi_v$ when it differentiates the section. The fast mass term is $O \( m \/ sqrt(h) \)$ on these states. Lemma 16 also gives boundedness of $A \( b \)$ and its required slow derivatives in every prescribed finite oscillator Sobolev order.
  Lemma 18 says $P_v \( c \) A \( c \) = 0$. Smoothness and concentration of $f_h$ give
  $ parallel P_v \( b \) A \( b \) f_h parallel arrow.r 0 . $
  Define the remaining perpendicular map and its correction by
  #[#set math.equation(numbering: n => "(5.8)")
   $ V \( b \) & = \( 1 - P_v \( b \) \) A \( b \) \, #h(2em) W \( b \) = #scale(x: 120%, y: 120%)[\(] E_v \( b \) \|_("ran" \( 1 - P_v \( b \) \)) #scale(x: 120%, y: 120%)[\)]^(- 1) V \( b \) \,\
I_(h \, v \, m) f & = chi_v \( b \) f_h - h^(- 1 \/ 2) W \( b \) f_h . $ <lift:correction>]
  The inverse here acts with the Clifford sign it has on the full graded module. Thus $E_v \( b \) W \( b \) = V \( b \)$ exactly. The maps preserve fast $Z_0$ neutrality, since every term in the construction is equivariant. Also $W \( b \)$ is even as a map of the full graded fibers: $V$ is odd and the inverse of $E_v$ is odd. The correction therefore preserves the parity of a test.
  We verify that all other outputs of the correction tend to zero. For any smooth oscillator-vector map $M \( b \)$ whose coefficients and first slow derivatives are bounded in the requisite oscillator norms, the explicit slow charge gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ parallel h^(- 1 \/ 2) D_v^s \( h \, m \) \( M f_h \) parallel lt.eq C_M #scale(x: 120%, y: 120%)[\(] & parallel p_b f_h \/ sqrt(h) parallel + sum_(i < j) parallel sqrt(h) \[ b_i \, b_j \] f_h parallel\
 & + h^(- 1 \/ 2) \( 1 + m \) parallel f_h parallel #scale(x: 120%, y: 120%)[\)] . $ <lift:matrix-stability>]
  The boundedness of $b$ on the support is included in $C_M$. The estimate follows by applying each derivative to $M$ or $f_h$ and by bounding the remaining finite Clifford matrices. In particular it remains true when such matrices act on internal kernel factors. There is no assertion that those matrices preserve the internal kernels. Equation (5.4) is precisely what makes the right-hand side tend to zero.
  Taking $M = W$ proves smallness of the slow output of the correction. For its remainder output, (4.9) gives
  $ parallel h^(- 1 \/ 2) R_v \( W f_h \) parallel lt.eq C #scale(x: 120%, y: 120%)[\(] h^(- 1 \/ 2) \( 1 + m \/ sqrt(h) \) parallel f_h parallel + h^(- 1) parallel p_b f_h parallel #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  All $t$ multiplications and $t$ derivatives here act on $W$ and are bounded by its oscillator norms. Finally, the fast output of the correction is $- V \( b \) f_h$, exactly canceling the remaining uncorrected output. We have proved
  $ D_v \( h \, m \) I_(h \, v \, m) f = chi_v \( b \) \( D_v^C \( m \) f \)_h + o \( 1 \) . $
  The correction has norm $O \( h^(- 1 \/ 2) \)$. Replacing $chi_v \( b \)$ by $chi_v \( c \)$ costs $o \( 1 \)$, both for $f$ and for the fixed test $D_v^C \( m \) f$, by continuity and concentration. This proves (5.3) in the chart.
  The states can be taken in the actual graph domain. Their slow supports lie in the interior of the chosen spectral-window chart, and their fast factors have bounded oscillator moments of every fixed order used above. If a physical transverse cutoff $tau \( z \) = tau \( t \/ sqrt(h) \)$ is desired, its deleted tail and charge commutator tend to zero: on that tail $\| t \| gt.eq a sqrt(h)$, whereas arbitrarily high fixed oscillator moments are bounded. The ambient charge commutator with a fixed smooth physical cutoff is a bounded Clifford multiplier. Extending the resulting function by gauge equivariance and by zero outside the chart introduces no boundary jump. The computed distributional charge is in $L^2$, so Lemma 4 puts the state in the graph domain. Local smoothing, followed by compact-group averaging if required, gives core approximations with the same graph limits.
  The remaining global and symmetry assertions follow from the chart compatibility proved next. In particular a finite partition of unity on the compact center support produces the asserted global lift and preserves linearity on a fixed finite test space. ◻
]

#thm([Lemma 5.3.])[
  (Compatibility of leading identifications).  #emph[On overlaps of separated-center charts, the identifications $cal(J)_h$ agree to $o \( 1 \)$ in norm for each fixed test, with the natural center and internal fiber transports. The same is true for the indicated outputs $cal(J)_h D_v^C \( m \) f$. A change of separating axis shifts the block variable $b$ by $O \( \| z \|^2 \)$; its leading fast coordinate change is projection along the central conjugation directions, with the positive unitary density factor. The statements hold for finite test families, block relabelings, and each fixed spatial symmetry in $"Spin" \( 3 \) times "Spin" \( 6 \)$.]
] <lem:chart-compatibility>

#proof[
  Choose two separating axes valid on the overlapping compact center support. To put $b + z$ into the second slice, solve its off-block slice equation by a gauge rotation with off-block generator $w \( b \, z \)$. The differential of that equation at $z = 0$ is the invertible map $w mapsto \[ w \, b_(e') \]$ on $frak(n)$. The implicit function theorem with the fixed spectral gap gives $w \( b \, z \) = O \( \| z \| \)$ with uniformly bounded smooth coefficients. Since $\[ frak(n) \, frak(k)_0 \] subset frak(n)$, its first action on $b$ is off-block. Thus the block-diagonal part of the transformed configuration satisfies
  #[#set math.equation(numbering: n => "(5.10)")
   $ b' = b + O \( \| z \|^2 \) \, #h(2em) z' = L_b z + O \( \| z \|^2 \) \, $ <lift:chart-transition>]
  where $L_c$ is the linear change of slice obtained by projecting along $\( \[ w \, c_i \] \)_i$. A fixed change of block frames or labels can be applied before this calculation.
  On bounded rescaled sets $\| y \| \, \| t \| lt.eq M$,
  $ h^(1 \/ 3) \| b' - b \| = O_M \( h^(- 2 \/ 3) \) \, #h(2em) t' = L_c t + o \( 1 \) \, #h(2em) c' = c + O_M \( h^(- 1) \) . $
  The spin action of the gauge rotation tends uniformly to the identity there. The density factors in (4.3), together with the Jacobian of $L_c$, are exactly those of the unitary change between the two flat-measure transverse slices. This can also be seen by mapping each slice to the same perpendicular slice for $\( \[ w \, c_i \] \)_i$: both start from the same ambient Euclidean volume and the same homogeneous space orbit measure. All these density square roots are positive. The transformed Gaussian is therefore the same normalized oscillator Gaussian, and its spin factor agrees by the phase convention of Lemma 16.
  For bounded smooth internal profiles these statements prove norm convergence by change of variables and dominated convergence on bounded $\( y \, t \)$ sets. They extend to an arbitrary fixed internal $L^2$ kernel tensor by approximation: truncate and approximate that tensor on a bounded $y$ set, use the unitary coordinate changes and bounded physical cutoffs to bound the approximation error, and then remove the truncation. The fast tails are uniformly small by the oscillator moments. No estimate of an uncut $y$ moment is involved. The same argument applies to $D_v^C \( m \) f$, which has the same finite collection of internal kernel factors and a smooth compact center coefficient.
  For block relabelings the only additional transformation is the ordinary graded transport of the slow factors: the fast line has no extra character by Lemma 16. Rotating a chart by a fixed element $g$ of $"Spin" \( 3 \) times "Spin" \( 6 \)$ gives the same construction and the natural profile action. Its charge output transforms with $v$ replaced by $g v$, as follows from charge covariance. In particular for rotations fixing $v$ it transforms the same charge. These are statements for each fixed $g$; a uniform assertion over all group elements is not needed.
  To finish the global construction, take smooth functions $lambda_nu \( c \)$ subordinate to finitely many labeled center charts and summing to one on the test support. Sum the local lifts of $lambda_nu f$, making the finite block permutation average when passing to the quotient. The overlap calculation identifies their leading sum with $cal(J)_h f$, and their outputs with
  $ cal(J)_h sum_nu D_v^C \( m \) \( lambda_nu f \) = cal(J)_h D_v^C \( m \) f . $
  The product-rule terms cancel because $sum_nu upright(d) lambda_nu = 0$ on the support. Thus the partition introduces exactly the center Dirac product rule already present in the required output.
  Finally, compact center supports away from collisions for distinct unordered partitions are disjoint compact subsets of the commuting gauge quotient. The norm measures of their leading products concentrate on those supports. Disjoint neighborhoods and Cauchy–Schwarz therefore make their mutual inner products tend to zero. Charge outputs have the same limiting supports, so this also proves orthogonality of the indicated outputs and the mixed inner products. Within one partition, the unitary rescalings, normalized fast vector, and fixed orbit-volume convention give exactly the profile inner products; polarization proves the finite-family assertion. ◻
]

For later symmetry averaging, one useful consequence deserves to be explicit. If a profile test is invariant under a compact group of the stated symmetries, its lift and each fixed rotated lift have difference tending to zero in norm. Haar averaging has the same leading profile by dominated convergence, because their norms are bounded. If the group commutes with the selected charge, averaging does not increase the charge error. This uses only the pointwise compatibility in Lemma 21.

The compatible tests identify limiting center equations. We next prove that their profiles capture all norm, including norm at internal scales that shrink in physical coordinates.

== 6 Exterior estimates and exhaustion by profiles <sec:profiles>

The fast projection identifies the possible local limits. It does not by itself exclude norm at an internal scale that tends to zero in physical coordinates while tending to infinity in the coordinates $y = h^(1 \/ 3) \( b - c \)$. An exterior estimate excludes precisely this possibility. We prove that estimate simultaneously with the kernel theorem, by induction on the size of the color algebra.

#thm([Proposition 6.1.])[
  (Exterior estimate).  #emph[For each $n gt.eq 2$ there are constants $c_n > 0$ and $R_n < oo$ such that 
#[#set math.equation(numbering: n => "(6.1)")
 $ ∥r D_u \( h \, 0 \) F∥ gt.eq c_n ∥F∥ \, #h(2em) "supp" F subset { h^(1 \/ 3) r > R_n } \, #h(2em) r = \| x \| \, $ <eq:exterior-estimate>]

 for every $h > 0$ and every compactly supported gauge-invariant graph-domain vector for the $"SU" \( n \)$ operator. No rotation invariance is required.]
] <prop:exterior-estimate>

The proof of Proposition 22 appears below. At size $N$, until that proof is complete, we assume only its conclusions and $dim cal(K)_n = 1$ for $2 lt.eq n < N$. We set $cal(K)_1 = bb(C)$. Every block in a proper separated-center chart has size less than $N$, so all the local arguments preceding the proof use only these induction hypotheses. At $N = 2$ the proper blocks are scalar, and there is no nontrivial hypothesis. In particular, we do not assume that $cal(K)_N$ is nonzero or finite dimensional.

=== 6.1 Intermediate scales <intermediate-scales>

#thm([Lemma 6.2.])[
  (Quantitative exclusion of intermediate scales).  #emph[Suppose (6.1) holds at size $n$. Let $F_h$ have the gauge symmetry of that block, with $∥F_h∥ lt.eq B$ and $∥D_u \( h \, 0 \) F_h∥ lt.eq K$. Both norms may include arbitrary spectator variables or a spectator Hilbert space. There is an absolute cutoff constant $C$ such that, whenever $L gt.eq 1$ and $M > e^L R_n$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ (integral_(M h^(- 1 \/ 3) < r < epsilon) \| F_h \|^2)^(1 \/ 2) lt.eq c_n^(- 1) (e^L epsilon K + frac(C B, L)) . $ <prof:intermediate-bound>]

 In particular, 
#[#set math.equation(numbering: n => "(6.3)")
 $ lim_(epsilon arrow.b 0\
M arrow.r oo) limsup_(h arrow.r oo) integral_(M h^(- 1 \/ 3) < r < epsilon) \| F_h \|^2 = 0 . $ <eq:intermediate-scales>]

 The outer limit is directed: after choosing an error tolerance, one may choose $M_0$ and $epsilon_0$ so that the bound holds for every $M gt.eq M_0$ and $0 < epsilon lt.eq epsilon_0$.]
] <lem:intermediate-scales>

#proof[
  The assertion is immediate if the indicated interval is empty. Otherwise choose $0 lt.eq chi lt.eq 1$, equal to one on that interval, supported in
  $ M e^(- L) h^(- 1 \/ 3) < r < e^L epsilon \, #h(2em) \| r chi' \( r \) \| lt.eq C \/ L . $
  One obtains such a function by multiplying two fixed smooth cutoffs in $log r$, each with transition length $L$. Its support satisfies the hypothesis of (6.1). The Clifford normalization gives $∥\[ D_u \, chi \] \( x \)∥_(upright("op")) = \| nabla chi \( x \) \| \/ sqrt(2)$. Thus
  $ c_n ∥chi F_h∥ lt.eq ∥r chi D_u \( h \, 0 \) F_h∥ + ∥r \[ D_u \, chi \] F_h∥ lt.eq e^L epsilon K + C B \/ L . $
  Approximation in the graph norm extends this computation beyond smooth vectors. The same estimate with spectators follows first for finite sums of spectator vectors, by squaring the exterior inequality and integrating, and then by approximation.
  For a given $delta > 0$, first choose $L$ so that $C B \/ \( c_n L \) < delta \/ 2$, then choose $M_0 > e^L R_n$, and finally choose $epsilon_0$ so that $e^L epsilon_0 K \/ c_n < delta \/ 2$. This proves the stated order and uniformity of the limits. ◻
]

=== 6.2 Norm measures and local compactness <norm-measures-and-local-compactness>

Let $pi$ denote the quotient by the compact gauge group. The squared norm measure of a vector $psi$ is the pushforward under $pi$ of $\| psi \( x \) \|^2 thin upright(d) x$. Bounded sequences of these finite measures have subsequences converging against continuous compactly supported functions. The quotient is a locally compact separable metric space: for instance, the distance between two orbits is the minimum Euclidean distance between their representatives. Closed bounded quotient sets are compact.

For an unordered partition $C = \( n_1 \, dots.h \, n_k \)$ with $k gt.eq 2$, let $cal(P)_C$ be the profile space of Definition 19. Its labeled center space is

$ cal(Z)_C = {\( c_1 \, dots.h \, c_k \) in \( bb(R)^9 \)^k : sum_alpha n_alpha c_alpha = 0} \, #h(2em) \| c \|^2 = sum_alpha n_alpha \| c_alpha \|^2 \, $

of dimension $d_C = 9 \( k - 1 \)$. We use the flat measure induced by this metric, with the fixed normalization for permutations of equal-sized blocks in Definition 19. In particular, the quotient norm below has no extra orbit-volume factor.

#thm([Proposition 6.3.])[
  (Profiles on proper strata).  #emph[Assume the induction hypotheses at all sizes less than $N$. Fix $m gt.eq 0$, let $h_j arrow.r oo$, and suppose that $psi_j$ is a bounded sequence of gauge-invariant vectors with locally bounded $D_u \( h_j \, m \)$ graph norms. Here local boundedness means that $∥D_u \( h_j \, m \) \( a psi_j \)∥$ is bounded for every smooth compactly supported gauge-invariant multiplier $a$. After a subsequence there is a profile $F_C in cal(P)_C$ on each proper stratum such that the limiting norm measure restricted to that stratum is exactly its squared norm density. Moreover, for every test $f in cal(T)_C$ of Proposition 20, 
#[#set math.equation(numbering: n => "(6.4)")
 $ ⟨psi_j \, I_(h_j \, u \, m) f⟩ arrow.r ⟨F_C \, f⟩ . $ <prof:test-overlap>]

 The extraction can be made simultaneously for any finite list of sequences, and then the analogous restrictions of all their polarized norm measures and test overlaps hold. Parity and rotation symmetries of the original sequences pass to the profiles under the identifications of Lemma 21.]
] <prop:profile-compactness>

#proof[
  Local compactness will construct a kernel-valued profile. The intermediate-scale estimate is then needed to show that it accounts for all norm assigned to its stratum. We carry out these two steps before gluing the local profiles and treating inner products.
  #emph[Construction of a local profile.] On a compact set the fixed mass term is a bounded multiplier, uniformly in $h_j$. The raw estimates of Lemma 14 therefore imply that any limiting norm measure is supported on commuting configurations. Indeed, on a compact subset where $sum_(i < j) \| \[ x_i \, x_j \] \|^2 gt.eq a > 0$, its mass is $O \( h_j^(- 1) \/ a \)$.
  Fix a smaller compact set in a separated-center chart, and first multiply the states by a smooth cutoff supported in the chart and equal to one on a neighborhood of that set. Write the resulting states again as $psi_j$. All the estimates that follow are uniform on this fixed set. Lemma 17 gives
  $ psi_j - P_u psi_j arrow.r 0 \, #h(2em) P_u psi_j = chi_u \( b \) eta_j \( b \) \, #h(2em) ∥D_u^s \( h_j \, m \) P_u psi_j∥ lt.eq C . $
  The normalized fast section is even and has bounded derivatives as a vector in the fast Hilbert space. The slow Clifford multipliers act on the other factor. Consequently the Leibniz identity reads
  #[#set math.equation(numbering: n => "(6.5)")
   $ D_u^s #scale(x: 120%, y: 120%)[\(] chi_u eta_j #scale(x: 120%, y: 120%)[\)] = chi_u D_u^s eta_j + sum_ell a_ell \( partial_(b_ell) chi_u \) eta_j \, $ <prof:section-removal>]
  where the $a_ell$ are constant slow Clifford matrices. The last term has norm at most $C ∥eta_j∥$. In particular, no factor of $h_j$ is introduced when removing the fast section: the large internal bracket multiplier acts only on slow fermions. Subtracting the bounded mass multiplier gives $∥D_u^s \( h_j \, 0 \) eta_j∥ lt.eq C$. Covariance of $chi_u$ means that $eta_j$ has the separate gauge symmetry in each internal $"SU" \( n_alpha \)$ factor.
  Put $w_alpha = b_alpha - c_alpha upright("Id")_(n_alpha)$. On the slow tensor product, with all graded signs included,
  $ D_u^s \( h_j \, 0 \) = D_u^C \( 0 \) + sum_(alpha : n_alpha > 1) D_(u \, alpha) \( h_j \, 0 \) . $
  These summands involve disjoint variables and odd Clifford factors, so their pairwise anticommutators vanish. For compactly supported smooth sections integration by parts gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ ∥D_u^s \( h_j \, 0 \) eta_j∥^2 = ∥D_u^C \( 0 \) eta_j∥^2 + sum_(alpha : n_alpha > 1) ∥D_(u \, alpha) \( h_j \, 0 \) eta_j∥^2 . $ <prof:block-graph-identity>]
  The identity extends by closure. One can see this directly here by approximating after the compact slow cutoff; every potential is bounded on its support for fixed $h_j$, and ordinary local smoothing applies. In particular, each internal graph norm is bounded and $∥nabla_c eta_j∥ lt.eq C$, since $∥D_u^C \( 0 \) g∥^2 = 1 / 2 ∥nabla_c g∥^2$.
  Rescale the internal variables unitarily by $y_alpha = h_j^(1 \/ 3) w_alpha$, and denote the resulting function by $tilde(eta)_j \( c \, y \)$. Then
  #[#set math.equation(numbering: n => "(6.7)")
   $ ∥D_(u \, alpha) \( 1 \, 0 \) tilde(eta)_j∥ lt.eq C h_j^(- 1 \/ 3) \, #h(2em) ∥nabla_c tilde(eta)_j∥ lt.eq C . $ <prof:rescaled-internal-bounds>]
  For an internal cutoff $zeta$ of fixed compact support, write the constant-coefficient kinetic Dirac operator as $D_(u \, alpha) \( 1 \, 0 \)$ minus its bracket multiplier. That multiplier is bounded on $"supp" zeta$. The kinetic norm identity and the bounded commutator with $zeta$ give
  $ ∥nabla_(y_alpha) \( zeta tilde(eta)_j \)∥ lt.eq C_zeta #scale(x: 120%, y: 120%)[\(] ∥D_(u \, alpha) \( 1 \, 0 \) tilde(eta)_j∥ + ∥tilde(eta)_j∥ #scale(x: 120%, y: 120%)[\)] . $
  All spectators are integrated in these norms. Combining these inequalities for the finitely many blocks with the center derivative estimate gives a bounded ordinary $H^1$ norm on every compact subset of the joint $\( c \, y \)$ space. Its Clifford fiber is finite dimensional. The usual Rellich theorem therefore gives, by a diagonal subsequence, strong local $L^2$ convergence to a function $eta_oo \( c \, y \)$. Compactness has been applied jointly in all these variables, rather than to functions with an uncontrolled infinite-dimensional spectator fiber.
  Fatou’s lemma gives the global $L^2$ bound for this local chart limit. Testing (6.7) against compactly supported smooth functions shows distributionally that $D_(u \, alpha) \( 1 \, 0 \) eta_oo = 0$ for each $alpha$. Fubini’s theorem and a countable dense family of internal tests show that almost every slice in the remaining variables is in the corresponding distributional $L^2$ kernel. Lemma 4 identifies this with $cal(K)_(n_alpha)$. Equivalently, the orthogonal projection onto each internal kernel fixes $eta_oo$; the product of these commuting projections identifies its coefficient space as $⨂_alpha cal(K)_(n_alpha)$. This constructs the local profile.
  #emph[Exact norm on the stratum.] We now identify how much limiting norm is assigned to the stratum $w = 0$. The replacement of $psi_j$ by $P_u psi_j$ changes integrals against bounded multipliers by $o \( 1 \)$. The physical fast coordinates tend to zero in norm measure, since $z = t \/ sqrt(h_j)$ and $∥t psi_j∥ lt.eq C$. On bounded $y$ sets, smoothness also gives $chi_u \( c + h_j^(- 1 \/ 3) y \) - chi_u \( c \) arrow.r 0$ uniformly in fast Hilbert norm. It remains to decide whether any internal norm escapes all bounded $y$ sets while still reaching $w = 0$.
  Here is a precise measure comparison. Take a nonnegative continuous center test $a \( c \)$ of compact support in a smaller chart. Let $0 lt.eq kappa_epsilon \( w \) lt.eq 1$ be a product of radial internal cutoffs, equal to one when every $\| w_alpha \| lt.eq epsilon$ and zero when some $\| w_alpha \| gt.eq 2 epsilon$. Choose them decreasing as $epsilon arrow.b 0$. In testing the quotient measure, include a fixed physical fast cutoff equal to one near $z = 0$, so that the product extends continuously by zero inside the outer chart. Its removal changes the limit by zero, because $∥t psi_j∥ lt.eq C$ and $z = t \/ sqrt(h_j)$. The slice density has already been absorbed unitarily, and $integral \| chi_u \( b \, t \) \|^2 thin upright(d) t = 1$; thus, after removal of the fast cutoff, these tests of the projected states are exactly the corresponding slow integrals. For each fixed $M$, strong local convergence identifies the integrals on ${ \| y_alpha \| lt.eq M upright(" for all ") alpha }$. The difference between such an integral and the integral with $kappa_epsilon$ is bounded above, apart from this local convergence error, by
  #[#set math.equation(numbering: n => "(6.8)")
   $ ∥a∥_oo sum_(alpha : n_alpha > 1) integral_(M h_j^(- 1 \/ 3) < \| w_alpha \| < 2 epsilon) \| eta_j \|^2 . $ <prof:measure-tail-bound>]
  Each summand satisfies Lemma 23, with all other variables as spectators, because of (6.6). For the converse comparison, the bounded $y$ set lies where $kappa_epsilon = 1$ for all sufficiently large $j$. Thus its limiting integral is a lower bound for the one with $kappa_epsilon$.
  To record the order of limits explicitly, put
  $ J_epsilon = integral a \( c \) kappa_epsilon \( w \) thin upright(d) mu \, #h(2em) A_M = integral_(max_alpha \| y_alpha \| lt.eq M) a \( c \) \| eta_oo \( c \, y \) \|^2 thin upright(d) c thin upright(d) y . $
  For every fixed $L gt.eq 1$ and $M > e^L max_alpha R_(n_alpha)$, the preceding comparisons and (6.2), after $j arrow.r oo$, give
  $ A_M lt.eq J_epsilon lt.eq A_M + ∥a∥_oo sum_(alpha : n_alpha > 1) c_(n_alpha)^(- 2) (2 e^L epsilon K_alpha + C B \/ L)^2 \, $
  where $K_alpha$ are the block graph bounds in (6.6). Decreasing $epsilon$ restricts $J_epsilon$ to $w = 0$, by continuity from above and concentration of the fast coordinates at zero. Next let $M arrow.r oo$, keeping its lower threshold, and finally let $L arrow.r oo$. The error vanishes and $A_M$ exhausts the profile norm. Thus the restricted measure is exactly $\| F_C \( c \) \|^2 thin upright(d) c$. If every block is scalar, the sums and internal cutoffs are absent and strong local center convergence gives the same conclusion directly. This argument also covers simultaneous fragmentation in several blocks, since their error sets are bounded by the finite sum in (6.8).
  #emph[Compatibility and inner products.] Local strong convergence and approximation by bounded $y \, t$ sets, followed by Proposition 20, give the local version of (6.4). It also identifies the profile independently of the outer chart cutoff. If two cutoffs $lambda \, tilde(lambda)$ equal one near the same smaller center support, then $parallel \( lambda - tilde(lambda) \) I_(h_j \, u \, m) f parallel arrow.r 0$ for every test supported there: its leading lift concentrates in that neighborhood, and its correction tends to zero in norm. Pairing with the original bounded sequence proves that the two localizations have identical test overlaps. These identify the same profile coefficient, including its phase.
  There are finitely many partition types and a countable exhaustion of each stratum by relatively compact charts. Repeating the extraction diagonally gives profiles on all of them. On overlapping charts, Lemma 21 identifies the leading tests and hence, by their overlaps, the local profiles. These consequently descend with the required permutation action. Exhaustion of the stratum gives the global norm bound, and the local overlaps give (6.4) for every compactly supported profile test.
  For a finite list $psi_j^1 \, dots.h \, psi_j^q$, carry out the same extractions for the list and for the finitely many sums and imaginary sums needed for complex polarization. Equivalently, take weak limits of the matrix of measures with entries $pi_(*) \( ⟨psi_j^a \( x \) \, psi_j^b \( x \)⟩ thin upright(d) x \)$. Positivity of this matrix and Cauchy–Schwarz bound every entry by its diagonal measures. Linearity of the local limits then gives, on each stratum, the entry $⟨F_C^a \( c \) \, F_C^b \( c \)⟩ thin upright(d) c$. This proves the polarized assertion. The same leading identifications commute with the indicated symmetries, which proves the final assertion. ◻
]

=== 6.3 Passing the charge to the center space <passing-the-charge-to-the-center-space>

#thm([Lemma 6.4.])[
  (Removal of collisions).  #emph[Let $S_C subset cal(Z)_C$ be the union of the collision subspaces $c_alpha = c_beta$. If $F \, G in L^2 \( cal(Z)_C \)$, with the profile coefficient fiber, satisfy $D_u^C \( m \) F = G$ distributionally on $cal(Z)_C \\ S_C$, then the same identity holds on $cal(Z)_C$. In particular, $F$ is in the full Euclidean graph domain. This remains true on the subspace with the permutation symmetry of the profile space.]
] <lem:collision-removal>

#proof[
  Each collision subspace has codimension nine, also after imposing the trace-zero constraint. Let $rho_epsilon$ be the product of smooth cutoffs that vanish at distance at most $epsilon$ from these finitely many subspaces and equal one at distance at least $2 epsilon$. On each compact set $K subset cal(Z)_C$, tubular coordinates give
  #[#set math.equation(numbering: n => "(6.9)")
   $ ∥nabla rho_epsilon∥_(L^2 \( K \))^2 lt.eq C_K epsilon^(- 2) epsilon^9 = C_K epsilon^7 . $ <prof:collision-capacity>]
  Intersections of collision subspaces cause no difficulty, since the derivative of the finite product is bounded by the sum of the individual derivatives.
  For a smooth compactly supported test $phi$, apply the given distributional identity to $rho_epsilon phi$. The commutator error has absolute value at most
  $ 2^(- 1 \/ 2) ∥F∥_(L^2 \( K \)) ∥phi∥_oo ∥nabla rho_epsilon∥_(L^2 \( K \)) \, $
  which tends to zero. All other terms converge by dominated convergence; the mass multiplier is bounded on $K$. This proves the global distributional equation. The maximal and minimal graph domains coincide by the cutoff and local ellipticity argument of Lemma 4, which applies verbatim to this abelian operator. Tests with values in a finite-dimensional coefficient subspace suffice, followed by density if necessary. For permutation-equivariant vectors, averaging the tests over the finite permutation group gives the same conclusion. There is thus no additional collision boundary condition. ◻
]

#thm([Proposition 6.5.])[
  (Liminf for the center charges).  #emph[Under the hypotheses of Proposition 24, suppose in addition that $∥D_u \( h_j \, m \) psi_j∥$ is globally bounded. On a subsequence realizing its lower limit, the profiles satisfy 
#[#set math.equation(numbering: n => "(6.10)")
 $ sum_(C upright(" proper")) ∥D_u^C \( m \) F_C∥^2 lt.eq liminf_(j arrow.r oo) ∥D_u \( h_j \, m \) psi_j∥^2 . $ <eq:profile-liminf>]

 The derivatives on the left are the full-space graph derivatives.]
] <prop:profile-liminf>

#proof[
  Choose any finite family of profile tests $g_C in cal(T)_C$ and put $T_j g = sum_C I_(h_j \, u \, m) g_C$. Proposition 20 and Lemma 21 give
  $ ∥T_j g∥^2 arrow.r sum_C ∥g_C∥^2 \, #h(2em) ⟨D_u \( h_j \, m \) psi_j \, T_j g⟩ arrow.r sum_C ⟨F_C \, D_u^C \( m \) g_C⟩ . $
  For the second identity, move the self-adjoint charge to the tests; its graph-output error pairs with the bounded norm of $psi_j$ and tends to zero. Cauchy–Schwarz therefore bounds the last functional by
  $ (liminf_j ∥D_u \( h_j \, m \) psi_j∥) (sum_C ∥g_C∥^2)^(1 \/ 2) . $
  The tests are dense in the Hilbert direct sum of the profile spaces. Riesz representation identifies this bounded functional with the direct sum of the distributional derivatives, and proves (6.10) off the collisions. Lemma 25 extends each derivative across them. This argument uses convergence for each fixed finite test family; it requires no uniform estimate on the whole unit ball of test functions. ◻
]

=== 6.4 Hardy inequality and the current exterior estimate <hardy-inequality-and-the-current-exterior-estimate>

We can now prove Proposition 22 at size $N$, without having used any information about $cal(K)_N$.

#proof[
  Fix a compact annulus $a lt.eq r lt.eq b$, where $0 < a < b < oo$. We first claim that every sequence of unit vectors supported there, with $h_j arrow.r oo$, satisfies
  #[#set math.equation(numbering: n => "(6.11)")
   $ liminf_j ∥r D_u \( h_j \, 0 \) F_j∥ gt.eq frac(5, 2 sqrt(2)) . $ <prof:fixed-annulus-bound>]
  It suffices to treat a subsequence for which the norms on the left are bounded. Because $r gt.eq a$, its unweighted graph norms are bounded. Every limiting norm measure is supported on commuting configurations in this annulus. A traceless commuting configuration with only one joint center is zero. Thus only proper strata occur here, and Proposition 24, together with additivity of the measure over the finitely many strata, gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ sum_(C upright(" proper")) ∥F_C∥^2 = 1 . $ <prof:annulus-norm-exhaustion>]
  The profiles of $r F_j$ are $\| c \| F_C$. This follows either from the local rescalings or from (6.4), since $r$ is bounded on the common support and restricts to $\| c \|$ on the stratum. The commutator with $r$ is bounded, so Proposition 26 applies to this sequence as well.
  For a reference for the classical Euclidean Hardy inequality, see #cite(label("FrankSeiringer2008")) equation (1.1), with $p = 2$. For completeness, completing a square in Euclidean dimension $d > 2$ gives, for smooth compactly supported $g$ away from zero,
  $ 0 lt.eq ∥nabla g + frac(d - 2, 2) frac(c, \| c \|^2) g∥^2 = ∥nabla g∥^2 - frac(\( d - 2 \)^2, 4) ∥g \/ \| c \|∥^2 . $
  Cutoffs and closure extend this Hardy inequality to $H^1$. Applied on $cal(Z)_C$, with its orthonormal trace coordinates and $d_C = 9 \( k - 1 \) gt.eq 9$, it yields
  $ ∥D_u^C \( 0 \) \( \| c \| F_C \)∥ = 2^(- 1 \/ 2) ∥nabla_c \( \| c \| F_C \)∥ gt.eq frac(d_C - 2, 2 sqrt(2)) ∥F_C∥ gt.eq frac(7, 2 sqrt(2)) ∥F_C∥ . $
  The full-space graph statement needed here is supplied by Lemma 25. Hence (6.10) and (6.12) imply $liminf_j ∥D_u \( h_j \, 0 \) \( r F_j \)∥ gt.eq 7 \/ \( 2 sqrt(2) \)$. Finally, $∥\[ D_u \, r \] F_j∥ = 1 \/ sqrt(2)$, proving (6.11).
  Fix a logarithmic width $A > 0$. Since $5 \/ \( 2 sqrt(2) \) > 1$, a contradiction sequence in the fixed annulus $1 < r < e^A$ shows that there is $H_A < oo$ such that its annular inequality $∥r D_u \( h \, 0 \) F∥ gt.eq ∥F∥$ holds for every $h gt.eq H_A$. Dilation $x = s xi$ replaces the coupling by $h s^3$ and leaves the weighted operator $r D_u$ unchanged. Therefore
  #[#set math.equation(numbering: n => "(6.13)")
   $ ∥r D_u \( h \, 0 \) F∥ gt.eq ∥F∥ quad upright("if") quad "supp" F subset { s < r < e^A s } \, quad h^(1 \/ 3) s gt.eq H_A^(1 \/ 3) . $ <prof:scaled-annulus-bound>]
  We use the IMS localization principle #cite(label("Simon1983")) Lemma 3.1, here in its weighted first-order form. Choose smooth functions $chi_j \( log r \)$ forming a squared partition of unity, with supports in intervals of length $A$, bounded overlap, and $sum_j \| chi'_j \|^2 lt.eq C \/ A^2$. For example, normalize translates of a fixed bump by the square root of the sum of their squares, then rescale the real variable. The Clifford symbol and $sum_j chi_j nabla chi_j = 0$ give the exact localization identity
  #[#set math.equation(numbering: n => "(6.14)")
   $ sum_j ∥r D_u \( chi_j F \)∥^2 = ∥r D_u F∥^2 + 1 / 2 integral r^2 sum_j \| nabla chi_j \|^2 \| F \|^2 lt.eq ∥r D_u F∥^2 + C / A^2 ∥F∥^2 . $ <prof:weighted-ims>]
  Fix $A$ large enough that $C \/ A^2 lt.eq 1 \/ 2$, and only then set $R_N > e^A H_A^(1 \/ 3)$. Every member of the partition meeting $"supp" F subset { h^(1 \/ 3) r > R_N }$ is supported in an annulus satisfying (6.13): its lower radius is at least $e^(- A)$ times a radius where it meets $F$. Summing that bound and using (6.14) proves $∥r D_u F∥^2 gt.eq 1 / 2 ∥F∥^2$. Taking, for example, $c_N = 1 \/ sqrt(2)$ proves the assertion. The threshold can depend on $N$. All identities initially use compact smooth vectors and extend to the stated domain by Lemma 4. ◻
]

=== 6.5 The full-collapse profile <the-full-collapse-profile>

#thm([Corollary 6.6.])[
  (Exhaustion for tight sequences).  #emph[Under the hypotheses of Proposition 24, after Proposition 22 has been proved at size $N$, there is also a full-collapse profile $F_0 in cal(K)_N$. Its squared norm is the mass of the limiting norm measure at zero. If the squared norm measures are tight, then 
#[#set math.equation(numbering: n => "(6.15)")
 $ lim_j ∥psi_j∥^2 = ∥F_0∥^2 + sum_(C upright(" proper")) ∥F_C∥^2 . $ <prof:full-norm-exhaustion>]

 For any finite simultaneously extracted list, one likewise has 
#[#set math.equation(numbering: n => "(6.16)")
 $ lim_j ⟨psi_j^a \, psi_j^b⟩ = ⟨F_0^a \, F_0^b⟩ + sum_(C upright(" proper")) ⟨F_C^a \, F_C^b⟩ . $ <prof:polarized-exhaustion>]

 The space $cal(K)_N$ is allowed to have unknown dimension in this statement.]
] <prof:full-exhaustion>

#proof[
  Multiply by a fixed compact radial cutoff equal to one near zero. The resulting undeformed graph norms are bounded, since the mass term is bounded there. Unitary whole-configuration rescaling by $h_j^(1 \/ 3)$ gives bounded $L^2$ functions whose $D_u \( 1 \, 0 \)$ outputs tend to zero. Local ellipticity and Rellich compactness give a strong local limit. Fatou’s lemma makes that limit globally square integrable, and Lemma 4 puts it in $cal(K)_N$. Lemma 23, now available at size $N$, identifies its norm with exactly the atom at zero by the same inner-ball and shrinking-physical-ball comparison used in (6.8). This construction is independent of the chosen cutoff near zero. It extracts one vector in $cal(K)_N$; it does not require compactness of its unit ball or prior finite dimensionality.
  The commuting quotient is the disjoint union of zero and the proper strata. Tightness preserves total mass in the weak limit: approximate the constant function one by compact cutoffs and use the uniform tail bound. Adding the restricted measures gives (6.15). Applying this to the finite linear combinations used for polarization gives (6.16). Rotation and parity pass to $F_0$ directly under radial cutoffs and dilation. ◻
]

== 7 Massive tightness and the kernel count <sec:counting>

The preceding section accounts for all norm at bounded physical radii. We first show that bounded massive graph norms cannot escape to infinity as $h arrow.r oo$. We then compare the resulting profiles with the exact massive index. Throughout this section the induction hypotheses at sizes less than $N$ remain in force, and the exterior estimate at size $N$ has already been proved. The dimension of $cal(K)_N$ is still unknown.

Write

$ frak(q)_(h \, m) \( psi \) = 1 / 16 sum_v ∥D_v \( h \, m \) psi∥^2 $

for the form of $cal(H) \( h \, m \)$, where the sum is over an orthonormal real spin basis.

=== 7.1 Uniform confinement on large annuli <uniform-confinement-on-large-annuli>

#thm([Proposition 7.1.])[
  (Massive tightness).  #emph[There are $a > 0$, $h_0 > 0$, and $R_0 < oo$, depending on $N$, such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ frak(q)_(h \, 1) \( psi \) gt.eq a R^2 ∥psi∥^2 quad upright("if") quad h gt.eq h_0 \, quad R gt.eq R_0 \, quad "supp" psi subset { R < \| x \| < 4 R } . $ <count:annular-confinement>]

 This inequality is on gauge invariants, with no rotation restriction. Consequently, for $R gt.eq R_0$, after enlarging the constants if needed, 
#[#set math.equation(numbering: n => "(7.2)")
 $ integral_(\| x \| > 4 R) \| psi \|^2 lt.eq C / R^2 frak(q)_(h \, 1) \( psi \) + C / R^4 ∥psi∥^2 \, #h(2em) h gt.eq h_0 . $ <count:tail-bound>]

 In particular, every bounded sequence of gauge- and $G$-invariant vectors with $h arrow.r oo$ and bounded $D_u \( h \, 1 \)$ graph norms has tight squared norm measures.]
] <prop:massive-tightness>

Averaging the abelian charge squares cancels their angular terms. In the application, each spinor charge acts on a different fast projection of the same state. The following lemma shows that norm convergence of these projections suffices for the cancellation.

#thm([Lemma 7.2.])[
  (Center confinement for nearby states).  #emph[Fix a center space $cal(Z)_C$, an arbitrary spectator Hilbert space $cal(E)$, and a compact set $K subset { c in cal(Z)_C : \| c \| gt.eq b_0 }$, where $b_0 > 0$. Let $\( v_nu \)_(nu = 1)^16$ be an orthonormal real spin basis and $m_j > 0$ with $m_j arrow.r oo$. For each $nu$, let 
$ a_(nu \, j) in L^2 \( cal(Z)_C \; cal(F)_C ⊗ cal(E) \) $

 be supported in $K$, bounded in norm, and in the graph domain of the center charge $D_(v_nu)^C \( m_j \)$, acting trivially on $cal(E)$. Suppose that 
$ ∥a_(nu \, j) - a_(1 \, j)∥ arrow.r 0 \, #h(2em) ∥D_(v_nu)^C \( m_j \) a_(nu \, j)∥ = o \( m_j \) quad \( nu = 1 \, dots.h \, 16 \) . $

 Then $∥a_(nu \, j)∥ arrow.r 0$ for every $nu$. No gauge or rotation invariance is imposed on these center states.]
] <count:center-confinement>

#proof[
  For brevity write $a_(v \, j)$ for the state belonging to a spinor in the chosen basis, and put $a_(0 \, j) = a_(v_1 \, j)$. The center mass multiplier is bounded by $C m_j$ on $K$. Subtracting it from the charge and using the free center Dirac norm identity gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ ∥p_C a_(v \, j)∥ = sqrt(2) ∥D_v^C \( 0 \) a_(v \, j)∥ = O \( m_j \) . $ <count:center-gradient-bound>]
  This identity holds with spectators by integration, or first on finite spectator sums and then by closure.
  Apply the abelian square formula of Proposition 2 and divide by $m_j^2$. Dropping its nonnegative kinetic term yields
  #[#set math.equation(numbering: n => "(7.4)")
   $ 0 gt.eq 1 / 2 sum_(i = 1)^9 s_i^2 ∥c_i a_(v \, j)∥^2 + ⟨a_(v \, j) \, A_(v \, j) a_(v \, j)⟩ + o \( 1 \) \, #h(2em) A_(v \, j) = m_j^(- 1) p_C dot.op R \( v \) c . $ <count:abelian-mass-lower-bound>]
  The fermion multiplier and the spin part of the rotation generator contribute only $O \( m_j^(- 1) \)$. The vector field $R \( v \) c$ has zero divergence, so $A_(v \, j)$ is symmetric on these compactly supported $H^1$ states.
  Bounded center coordinates and (7.3) give
  $ ∥A_(v \, j) a_(v \, j)∥ + ∥A_(v \, j) a_(0 \, j)∥ lt.eq C . $
  In the second term, the free Dirac identity for $v_1$ bounds the full center gradient of $a_(0 \, j)$, and hence bounds the angular operator for every $v$. Symmetry therefore gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ & lr(|⟨a_(v \, j) \, A_(v \, j) a_(v \, j)⟩ - ⟨a_(0 \, j) \, A_(v \, j) a_(0 \, j)⟩|)\
 & #h(1cm)  lt.eq ∥a_(v \, j) - a_(0 \, j)∥ #scale(x: 120%, y: 120%)[\(] ∥A_(v \, j) a_(v \, j)∥ + ∥A_(v \, j) a_(0 \, j)∥ #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <count:angular-replacement>]
  Only norm convergence of the difference is needed here. Bounded coordinate multiplication also permits replacement by $a_(0 \, j)$ in the mass term with error $o \( 1 \)$.
  Average (7.4) over the spin basis. The identity $sum_nu R \( v_nu \) = 0$ cancels the common angular expectation exactly. Since $s_i^2 gt.eq 1$,
  $ 0 gt.eq 1 / 2 ∥\| c \| a_(0 \, j)∥^2 + o \( 1 \) gt.eq 1 / 2 b_0^2 ∥a_(0 \, j)∥^2 + o \( 1 \) . $
  Thus $a_(0 \, j) arrow.r 0$ in norm. The assumed norm differences give the same conclusion for every $a_(v \, j)$. ◻
]

#proof[
  Suppose that the eventual uniform assertion (7.1) is false. Its quantified negation gives $h_j gt.eq j$, $R_j gt.eq j$, and unit vectors supported in $R_j < \| x \| < 4 R_j$ such that $frak(q)_(h_j \, 1) \( psi_j \) \/ R_j^2 arrow.r 0$. Dilation $x = R_j xi$, performed unitarily, and multiplication of the charge by $R_j$ give parameters
  #[#set math.equation(numbering: n => "(7.6)")
   $ h'_j = h_j R_j^3 \, #h(2em) m'_j = R_j^2 \, #h(2em) h'_j / m'_j = h_j R_j arrow.r oo . $ <count:annular-parameters>]
  Writing the dilated unit states as $f_j$, we have
  $ "supp" f_j subset { 1 < \| xi \| < 4 } \, #h(2em) frak(q)_(h'_j \, m'_j) \( f_j \) = o \( \( m'_j \)^2 \) . $
  The sixteen nonnegative summands in this form imply $∥D_v \( h'_j \, m'_j \) f_j∥ = o \( m'_j \)$ for each member of the spin basis.
  First suppose, along a subsequence, that $m'_j \/ sqrt(h'_j) arrow.r oo$. The exact scaling of the bosonic potential is
  #[#set math.equation(numbering: n => "(7.7)")
   $ U_(h' \, m') \( xi \) = frac(\( m' \)^4, \( h' \)^2) U_(1 \, 1) (h' / m' xi) . $ <count:potential-scaling>]
  Lemma 8 and (7.6) therefore imply $U_(h'_j \, m'_j) \( xi \) gt.eq c \( m'_j \)^2 \| xi \|^2$ on the fixed annulus for all large $j$. The fermionic multiplier in Proposition 2 has operator norm at most $C \( h'_j + m'_j \)$ there, and
  $ frac(h'_j + m'_j, \( m'_j \)^2) arrow.r 0 . $
  Dropping the nonnegative kinetic energy contradicts the assumed $o \( \( m'_j \)^2 \)$ form bound.
  Otherwise pass to a subsequence with $m'_j lt.eq C sqrt(h'_j)$. This is the growing-mass regime of Lemmas 14 and 17. The norm measures concentrate on the commuting part of the compact annulus. Every such configuration has at least two joint centers. Cover this compact commuting set by finitely many separated-center charts, chosen small enough for the fast estimates for all sixteen spinors simultaneously. At each reference configuration its block-center vector is nonzero. Shrinking the corresponding chart gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ \| c \| gt.eq b_0 > 0 $ <count:center-away-zero>]
  on it, with a possibly different positive constant in each of the finite charts. A fixed smooth gauge-invariant partition localizes to these charts and to a complementary region disjoint from the commuting set. Its charge commutators are $O \( 1 \) = o \( m'_j \)$. The complementary norm tends to zero by the raw commutator estimate.
  Consider one localized sequence, denoted by $psi_j$. In its full $\( b \, t \)$ Hilbert space set $a_(v \, j) = P_v \( b \) psi_j$. Lemma 17 gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ ∥a_(v \, j) - psi_j∥ = o \( 1 \) \, #h(2em) ∥D_v^s \( h'_j \, m'_j \) a_(v \, j)∥ = o \( m'_j \) . $ <count:variable-projections>]
  We retain the fast Hilbert space as a spectator here. The slow center operator and the massive internal block operators anticommute, since they act on disjoint variables and odd Clifford factors. Their squared norm identity, first on a smooth compact slow core and then by closure, implies
  #[#set math.equation(numbering: n => "(7.10)")
   $ ∥D_v^C \( m'_j \) a_(v \, j)∥ = o \( m'_j \) . $ <count:center-small-charge>]
  This does not assert that $P_v$ commutes with each block operator. Rather, it applies the identity for the slow operator to the vector $a_(v \, j)$, with its full dependence on $b \, t$. Compact slow support and local ellipticity ensure the individual slow domains, just as in (6.6).
  The projections act only in the fast variables, so all the $a_(v \, j)$ are supported in the same compact center set as the localized states. By (7.8), this set is bounded away from zero. Regard the internal variables and the fast Hilbert space as spectators. Equations (7.9) and (7.10) give every hypothesis of Lemma 29, with mass $m'_j$. The lemma therefore makes every $a_(v \, j)$, and hence $psi_j$, tend to zero in norm. Summing the finitely many charts and using the vanishing complementary norm contradicts $∥f_j∥ = 1$. This proves (7.1) in both parameter regimes.
  For the tail estimate, use a smooth squared radial partition consisting of an interior cutoff and annular functions $chi_j$, supported in $R_j < r < 4 R_j$ with $R_j gt.eq R$ and geometrically increasing radii. It can be chosen with bounded overlap, with the exterior functions exhausting the partition for $r > 4 R$, and $sum_j \| nabla chi_j \|^2 + \| nabla chi_(upright("in")) \|^2 lt.eq C \/ R^2$. Averaging the unweighted Dirac localization identity over the spin basis gives
  $ frak(q)_(h \, 1) \( chi_(upright("in")) psi \) + sum_j frak(q)_(h \, 1) \( chi_j psi \) lt.eq frak(q)_(h \, 1) \( psi \) + C R^(- 2) ∥psi∥^2 . $
  The interior form is nonnegative, and the exterior forms are bounded below by $a R^2 sum_j ∥chi_j psi∥^2$. This proves (7.2). Graph approximation and monotone exhaustion of the partition justify the same argument for arbitrary form-domain vectors. Finally, Lemma 3 gives $frak(q)_(h \, 1) \( psi \) lt.eq 3 / 2 ∥D_u \( h \, 1 \) psi∥^2$ on gauge and $G$ invariants. The displayed tail bound proves their tightness. ◻
]

=== 7.2 Parity and the exact massive kernel dimension <parity-and-the-exact-massive-kernel-dimension>

#thm([Lemma 7.3.])[
  (Gap at large coupling).  #emph[On the gauge- and $G$-invariant Hilbert space, there are $delta > 0$ and $h_1 < oo$ such that, for all $h gt.eq h_1$, 
#[#set math.equation(numbering: n => "(7.11)")
 $ ∥D_u \( h \, 1 \) psi∥ gt.eq delta ∥psi∥ #h(2em) \( psi upright(" odd") \) . $ <count:odd-gap>]

 If $P_h$ is the orthogonal projection onto $ker D_u \( h \, 1 \)$ on that space, then 
#[#set math.equation(numbering: n => "(7.12)")
 $ ∥\( 1 - P_h \) psi∥ lt.eq delta^(- 1) ∥D_u \( h \, 1 \) psi∥ . $ <count:full-gap>]

 Moreover, the massive kernel is entirely even and has dimension $p \( N \)$.]
] <lem:large-coupling-gap>

#proof[
  Let $h_j arrow.r oo$, $∥psi_j∥ = 1$, and $∥D_u \( h_j \, 1 \) psi_j∥ arrow.r 0$, with the prescribed invariances. Proposition 28 and Corollary 27 give norm-exhausting profiles. By Proposition 26, every proper profile satisfies $D_u^C \( 1 \) F_C = 0$ in the full center graph domain.
  Each internal kernel factor is a rotation singlet by Proposition 6. The phase and symmetry of the fast line in Lemma 16 and the compatibility in Lemma 21 therefore make $G$ act on these profiles through its ordinary action on the center variables and center fermions. The abelian instance of Lemma 3, valid on the full graph domain by closure, gives
  $ 0 = ∥D_u^C \( 1 \) F_C∥^2 gt.eq 2 / 3 ⟨F_C \, cal(H)_C \( 1 \) F_C⟩ . $
  This is understood as a form inequality. The mass-only oscillator has a unique zero-energy line for each center color, as also follows from the zero-triple case of Lemma 10. In orthonormal center coordinates its bosonic factor is proportional to
  $ exp (- 1 / 2 sum_(i = 1)^9 \| s_i \| thin \| c_i \|^2) \, $
  and its fermionic factor is the empty $T$-polarized vacuum. Denote the normalized product by $Omega_C$. Its parity is even. Hence each proper profile belongs to
  #[#set math.equation(numbering: n => "(7.13)")
   $ (bb(C) Omega_C ⊗ ⨂_(alpha = 1)^k cal(K)_(n_alpha))^(upright("equal-size permutations")) . $ <count:proper-profile-kernel>]
  The full-collapse profile belongs to $cal(K)_N$ and is also even, by Proposition 6, regardless of the dimension of that space.
  If every $psi_j$ were odd, symmetry transport would make every profile odd. The preceding identifications would force them all to vanish, contradicting (6.15). The negation of (7.11) would give exactly such a sequence, by choosing $h_j gt.eq j$ and an odd unit vector with charge norm below $1 \/ j$. Thus the eventual uniform odd gap holds.
  For each fixed positive $h$, Proposition 7 gives self-adjointness and compact graph embedding on this invariant space. The square has a discrete spectrum with finite-dimensional eigenspaces. On the eigenspace of any positive eigenvalue $lambda$ of the square, $D_u \/ sqrt(lambda)$ is an isometric bijection between its even and odd parts. The odd lower bound therefore excludes $0 < lambda < delta^2$ in both parities. Spectral expansion proves (7.12). There are no odd zero vectors; the index formula (3.1) consequently gives $dim ker D_u \( h \, 1 \) = p \( N \)$, all even, for $h gt.eq h_1$. ◻
]

=== 7.3 Partition multiplicities and recovery sequences <partition-multiplicities-and-recovery-sequences>

The proper strata are indexed by the unordered partitions of $N$ with at least two parts. To see why there is only one stratum for each such partition, order its block sizes in a fixed way and attach a distinct center to each listed size. This labeled presentation is identified only under permutations of entries of equal size. Relabeling unequal sizes changes the presentation of the same commuting configuration; it does not define a new partition type. Thus there are exactly $p \( N \) - 1$ proper types.

By the induction hypothesis, each internal kernel in (7.13) has dimension one. Choose the same normalized kernel vector whenever the block sizes agree. Those vectors are even. Exchanging two such factors consequently produces no graded sign. The center Gaussian is unchanged by the corresponding orthogonal permutation, and the empty center vacuum is fixed by its natural exterior action. Lemma 16 supplies the same untwisted action for the fast section, with positive volume normalizations. Therefore (7.13) is exactly one dimensional for each proper partition. Let its normalized vector be $Phi_C$.

#thm([Lemma 7.4.])[
  (Recovery of the proper profile lines).  #emph[There are even gauge- and $G$-invariant vectors $v_(C \, h)$, one for each proper partition, such that, as $h arrow.r oo$, 
#[#set math.equation(numbering: n => "(7.14)")
 $ ∥D_u \( h \, 1 \) v_(C \, h)∥ arrow.r 0 \, #h(2em) ⟨v_(C \, h) \, v_(C' \, h)⟩ arrow.r upright(bold(1))_(C = C') . $ <count:proper-recovery-estimates>]

 These vectors can be chosen simultaneously with recovery vectors for any prescribed finite list in $cal(K)_N$, with all cross inner products tending to zero.]
] <count:proper-recovery>

#proof[
  We first approximate $Phi_C$ in the center graph norm by admissible tests. Multiply its center factor by a smooth outer radial cutoff $zeta_R$, equal to one for $\| c \| lt.eq R$, zero for $\| c \| gt.eq 2 R$, and with derivative bounded by $C \/ R$. Multiply also by the collision cutoff $rho_epsilon$ of Lemma 25, chosen as a product over all unordered pairs. These cutoffs are rotation invariant and have the required permutation symmetry. The resulting vector $f_(C \, R \, epsilon)$ belongs to $cal(T)_C$.
  Since $D_u^C \( 1 \) Phi_C = 0$, only cutoff commutators contribute to its charge. The outer error tends to zero by the Gaussian tail. For fixed $R$, the smooth center factor is bounded on its support, so (6.9) bounds the squared collision error by $C_R epsilon^7$. Its omitted $L^2$ norm also tends to zero, since the collisions have measure zero. Consequently there is a sequence of such tests $f_(C \, ell)$ with
  #[#set math.equation(numbering: n => "(7.15)")
   $ ∥f_(C \, ell) - Phi_C∥ arrow.r 0 \, #h(2em) ∥D_u^C \( 1 \) f_(C \, ell)∥ arrow.r 0 . $ <count:center-test-approximation>]
  The order is explicit: for tolerance $1 \/ ell$, choose the outer radius first and then choose the collision radius small enough for that fixed outer support.
  For each fixed $ell$, Proposition 20 produces $w_(C \, h \, ell) = I_(h \, u \, 1) f_(C \, ell)$, with the prescribed leading norm and charge output. We impose the remaining symmetries carefully, since the chartwise corrections need not have been chosen rotation invariant. Let $A_G$ be Haar averaging over $G$, and let $E_(+) = \( 1 + \( - 1 \)^F \) \/ 2$ be the even projection. For every fixed $g in G$, Lemma 21 and invariance of the profile give
  $ ⟨w_(C \, h \, ell) \, U_g w_(C \, h \, ell)⟩ arrow.r ∥f_(C \, ell)∥^2 . $
  These inner products are bounded uniformly in $g \, h$ for fixed $ell$. Haar dominated convergence and the projection identity $∥A_G w∥^2 = ⟨w \, A_G w⟩$ show $∥w_(C \, h \, ell) - A_G w_(C \, h \, ell)∥ arrow.r 0$. The identical argument for the two-element parity action gives $∥w_(C \, h \, ell) - E_(+) A_G w_(C \, h \, ell)∥ arrow.r 0$. Moreover, $D_u$ commutes with $A_G$ and interchanges the parity projections, so
  $ ∥D_u \( h \, 1 \) E_(+) A_G w_(C \, h \, ell)∥ lt.eq ∥D_u \( h \, 1 \) w_(C \, h \, ell)∥ . $
  Thus imposing these symmetries preserves the leading norms and does not increase the charge errors.
  For fixed $ell$, the compact center supports on distinct partition strata are disjoint compact subsets of the gauge quotient. The leading identifications concentrate on those supports, so Lemma 21 makes the different lifts asymptotically orthogonal. Their projections have the same property by the norm approximation just proved.
  There are only finitely many proper partitions. Choose an increasing sequence $H_ell arrow.r oo$ so that for every $h gt.eq H_ell$ the finitely many norm, overlap, symmetry, and graph-output errors at the fixed test level $ell$ are below $1 \/ ell$. Taking that level for $H_ell lt.eq h < H_(ell + 1)$, and normalizing the vectors, proves (7.14). Additional finitely many cross overlaps can be included when choosing $H_ell$; the required whole-block vectors and their concentration are constructed next. ◻
]

#thm([Lemma 7.5.])[
  (Recovery of any finite whole-block list).  #emph[Let $phi.alt_1 \, dots.h \, phi.alt_M$ be any finite orthonormal list in $cal(K)_N$. There are even gauge- and $G$-invariant vectors $z_(a \, h)$ such that 
#[#set math.equation(numbering: n => "(7.16)")
 $ ∥D_u \( h \, 1 \) z_(a \, h)∥ arrow.r 0 \, #h(2em) ⟨z_(a \, h) \, z_(b \, h)⟩ arrow.r upright(bold(1))_(a = b) . $ <count:whole-recovery-estimates>]

 They concentrate at zero in physical coordinates. No weighted moment condition on any $phi.alt_a$ is required.]
] <count:whole-recovery>

#proof[
  Put $d = 9 \( N^2 - 1 \)$, and let
  $ \( S_h phi.alt \) \( x \) = h^(d \/ 6) phi.alt \( h^(1 \/ 3) x \) . $
  Then $S_h$ is unitary and $D_u \( h \, 0 \) S_h = h^(1 \/ 3) S_h D_u \( 1 \, 0 \)$. Choose a fixed compact radial cutoff $chi$ equal to one near zero, and set $z_(a \, h) = chi S_h phi.alt_a$. The vectors $S_h phi.alt_a$ concentrate at zero by their $L^2$ integrability: for every $eta > 0$,
  $ integral_(\| x \| > eta) \| S_h phi.alt_a \|^2 = integral_(\| y \| > h^(1 \/ 3) eta) \| phi.alt_a \( y \) \|^2 arrow.r 0 . $
  It follows that $∥z_(a \, h) - S_h phi.alt_a∥ arrow.r 0$, proving the Gram matrix assertion. Lemma 4 allows the cutoff product in the graph domain, and its undeformed charge is $\[ D_u \, chi \] S_h phi.alt_a$. The derivative of $chi$ is bounded and supported away from zero, so this norm tends to zero.
  The massive multiplier has norm at most $C \| x \|$. On the fixed support of $chi$, its norm on $z_(a \, h)$ tends to zero as well: if the support is contained in $\| x \| lt.eq B$, then
  $ ∥\| x \| z_(a \, h)∥^2 lt.eq eta^2 ∥phi.alt_a∥^2 + B^2 integral_(\| x \| > eta) \| S_h phi.alt_a \|^2 . $
  Take $h arrow.r oo$ and then $eta arrow.b 0$. This proves the charge estimate without assuming $\| y \| phi.alt_a in L^2$. Proposition 6 makes every $phi.alt_a$ even and a rotation singlet; radial cutoff and dilation preserve these symmetries.
  At any fixed level of the proper-partition construction, the compact center supports avoid collisions and hence avoid zero. Its lifts are therefore asymptotically orthogonal to all the $z_(a \, h)$. There are only finitely many such pairs. Include these overlaps in the threshold selection in Lemma 31 to obtain the simultaneous claim there. ◻
]

=== 7.4 Closing the simultaneous induction <closing-the-simultaneous-induction>

#proof[
  Assume that $dim cal(K)_n = 1$ and Proposition 22 hold for $2 lt.eq n < N$. Section 6 first proves the exterior estimate at size $N$, using only proper profiles on compact annuli. It then constructs the full-collapse profile in $cal(K)_N$. Proposition 28 and Lemma 30 now show that, for all sufficiently large $h$, the massive kernel on gauge and $G$ invariants has dimension exactly $p \( N \)$, with a uniform gap on its complement.
  Choose any sequence $h_j arrow.r oo$ in this range and an orthonormal $p \( N \)$-element basis of its massive kernel for each $j$. Simultaneously extract profiles from this finite list. Equation (6.16) says that the resulting list is orthonormal in
  #[#set math.equation(numbering: n => "(7.17)")
   $ cal(K)_N med xor #h(-0.16667em) #h(-0.16667em) xor.big_(C upright(" proper")) bb(C) Phi_C . $ <count:limit-target>]
  The proper summand has dimension $p \( N \) - 1$. If $cal(K)_N$ were zero, this space could not contain the orthonormal list. Hence $cal(K)_N eq.not { 0 }$.
  For the opposite inequality, take an arbitrary finite orthonormal list $phi.alt_1 \, dots.h \, phi.alt_M$ in $cal(K)_N$. Lemmas 31 and 32 provide $L = p \( N \) - 1 + M$ asymptotically orthonormal even gauge- and $G$-invariant vectors $w_(1 \, h) \, dots.h \, w_(L \, h)$ with charge norms tending to zero. The gap (7.12) implies
  $ ∥w_(a \, h) - P_h w_(a \, h)∥ arrow.r 0 #h(2em) \( 1 lt.eq a lt.eq L \) . $
  Their projected Gram matrix therefore tends to the $L$-by-$L$ identity. For all sufficiently large $h$ it is positive definite, so the $L$ projected vectors are linearly independent in the $p \( N \)$-dimensional massive kernel. Thus
  $ p \( N \) - 1 + M lt.eq p \( N \) \, #h(2em) M lt.eq 1 . $
  This applies to every finite orthonormal list, and hence proves $dim cal(K)_N lt.eq 1$ without presupposing finite dimensionality. Together with existence it gives $dim cal(K)_N = 1$.
  For $N = 2$, every proper internal block has size one. Its kernel factor is $bb(C)$, and there are no smaller nonabelian exterior estimates to assume. The same argument therefore starts the induction. At each subsequent size the order is: smaller-block kernel and exterior results, proper-stratum profiles, the current exterior estimate, the full-collapse profile, and finally the massive dimension comparison. This completes the simultaneous induction. Lemma 4 identifies $cal(K)_N$ with the kernel of the form Hamiltonian in (1.2), proving Theorem 1 on the entire configuration space. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
