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

#align(center)[#text(size: 16pt, weight: "bold")[Filtered chromatic splitting at generic primes]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Chromatic localization separates stable homotopy theory into heights. The fracture square relates height $n$ to the lower heights through the overlap

$ X_(n \, p) = L_(n - 1) L_(K \( n \)) S_p^and . $

Here $K \( n \)$ is Morava $K$-theory, $L_(K \( n \))$ is its localization, and $L_r = L_(E \( r \))$ is localization at Johnson–Wilson theory; $L_0$ is rationalization. Describing this overlap requires both its pieces and the maps that attach them.

We prove a filtered form of chromatic splitting in the range $p > n + 1$. The cofibers are the sphere localizations in the classical strong splitting list, but their extensions are retained. The map from the first stage to $X_(n \, p)$ is the canonical localization unit. The proof constructs one family of product maps before applying any lower-height test.

=== 1.1 The theorem <the-theorem>

Put $S = S_p^and$ and $D = L_(K \( n \)) S$. For a finite set $I$ of positive integers, write

$ d \( I \) = sum_(i in I) \( 2 i - 1 \) \, #h(2em) d \( diameter \) = 0 . $

All filtrations below are in the category of $E \( n - 1 \)$-local $S$-modules; equivalences and localizations are detected on the underlying spectra.

#thm([Theorem 1.1.])[
  #emph[Let $n gt.eq 1$ and let $p > n + 1$ be prime. There exist an enumeration $I_1 \, dots.h \, I_(2^n)$ of the subsets of ${ 1 \, dots.h \, n }$, a filtration $F_bullet$, and a family of classes $y_i in pi_(1 - 2 i) D$, $1 lt.eq i lt.eq n$, with the following properties.]
  + #emph[#strong[Filtration and unit.] The enumeration has $I_1 = diameter$ and $max I_j$ nondecreasing for $j gt.eq 2$. The filtration is 
$ 0 = F_0 arrow.r F_1 arrow.r dots.h.c arrow.r F_(2^n) arrow.r^tilde.eq X_(n \, p) $

 with $"cofib" \( F_(j - 1) arrow.r F_j \) tilde.eq C_(I_j)$, where 
#[#set math.equation(numbering: n => "(1.1)")
 $ C_diameter & = L_(n - 1) S \,\
C_I & = Sigma^(- d \( I \)) L_(n - max I) S quad \( I eq.not diameter \) . $ <eq:pieces>]

 Under $F_1 = C_diameter$, the composite $F_1 arrow.r X_(n \, p)$ is the canonical localization unit.]
  + #emph[#strong[Simultaneous product bases.] For this one family, set $y_diameter = 1$ and $y_I = y_(i_1) dots.h.c y_(i_r)$ for $I = { i_1 < dots.h.c < i_r }$. For every $1 lt.eq t < n$, the specified map 
#[#set math.equation(numbering: n => "(1.2)")
 $ L_(K \( t \)) (or.big_(I subset.eq { 1 \, dots.h \, n - t }) Sigma^(- d \( I \)) S arrow.r^(\( y_I \)) D) quad upright("is an equivalence") . $ <eq:height-basis>]

]
] <thm:main>

The product bases are the input to the filtration criterion of Proposition 2. Its construction removes the pieces in blocks of decreasing chromatic height. For $n > 1$, the first block consists of the unit and the degree-$- 1$ piece, both localized at $E \( n - 1 \)$. For $2 lt.eq j < n$, the block with $max I = j$ has $2^(j - 1)$ pieces; after removing it, the remaining quotient has height at most $n - j - 1$. The last quotient is rational, and its $2^(n - 1)$ pieces are chosen from rational dimensions. Those last pieces are not identified with the products $y_I$ containing $n$.

The resulting filtration retains the attaching maps. Thus the theorem answers the ordered-filtration formulation studied here; it does not assert the classical wedge decomposition or a retraction of the unit. We make no sharpness claim for the prime bound.

At height one the two cofibers are $H bb(Q)_p$ and $Sigma^(- 1) H bb(Q)_p$. At height three, where the range is $p gt.eq 5$, one permitted order is

$ L_2 S \, quad Sigma^(- 1) L_2 S \, quad Sigma^(- 3) L_1 S \, quad Sigma^(- 4) L_1 S \,\
Sigma^(- 5) H bb(Q)_p \, quad Sigma^(- 6) H bb(Q)_p \, quad Sigma^(- 8) H bb(Q)_p \, quad Sigma^(- 9) H bb(Q)_p . $

=== 1.2 Proof strategy <intro:strategy>

Two issues separate the desired product bases from a calculation of cohomological ranks. The cohomology generators must be represented by sphere classes, and those representatives must induce the required basis under every lower-height test. The proof develops these two inputs separately and compares their actual actions before applying the tests. Figure 1 shows where they meet.

For the coefficient input, fix $1 lt.eq t < n$, put $m = n - t$, and choose a finite field $k$ containing the Honda fields in use, with degree prime to $p$. The characteristic-$p$ deformation stratum has rings

$ A_t = k \[ \[ x_t \, dots.h \, x_(n - 1) \] \] \, #h(2em) B_t = A_t \[ 1 \/ x_t \] . $

Let $cal(B)_(n \, t)$ be the algebraic union of finite covers of $B_t$ that mark the connected height-$t$ formal group, leaving its étale Tate module unmarked. A cochain on a compact source uses one finite cover and one common pole bound. Write $P_n$ for the ordinary height-$n$ stabilizer, the unit group of the maximal order in the division algebra over $bb(Q)_p$ of invariant $1 \/ n$.

Sections 3–5 compare these algebraic coefficients with integral compact supports. Finite covers that mark both the connected group and its étale basis carry translation torsors. Their normalized transfers have a concrete feature: in invariant-volume coordinates, the transpose is the actual Frobenius on finite-cover functions. The perfected frame quotient is a space of independent bundle extensions. Its compact supports, computed by a rational flag resolution, give a finite stable transfer image.

The passage from that stable image to coefficient finiteness is a three-part induction, organized in Theorem 13. Section 6 proves compact finiteness using a fixed translation extension operation. Section 7 removes the pole bound by retaining the nilpotent transverse deformation at each boundary stratum. Section 8 then passes to the full frame tower and proves the individual-row norm-character filtrations needed at later boundary steps. The order on $\( n \, n - t \)$ makes these dependencies inductive: a boundary step uses full-frame rows at larger starting height and compact coefficients at smaller total height. Throughout, the constant $P_n$-cochain action is retained.

The second input is one family of stable constants. Sections 9–10 construct

$ u_i in pi_(1 - 2 i) C_(upright("cts"))^(*) \( P_n \; S \) \, #h(2em) 1 lt.eq i lt.eq n \, $

where the coefficient sphere has trivial $P_n$-action. A common modification space compares division and matrix constant cochains; on the extension space, it identifies the action with upper-left matrix-block restriction. Integral regulator and top-volume calculations normalize the classes so that their mod-$p$ Hurewicz images have nonzero exterior product. Write $xi_i in H_(upright("cts"))^(2 i - 1) \( P_n \; k \)$ for these images under $S arrow.r H bb(F)_p$, followed by scalar extension to $k$.

Section 11 brings the two inputs together. A parabolic weight calculation and a natural top-edge map identify the coefficient module with the regular exterior module for the specified classes. Its degree-zero generator is the coefficient unit: Proposition 69 proves

$ and.big_k \( e_1 \, dots.h \, e_m \) arrow.r^(#h(0.27778em) tilde.op #h(0.27778em)) H_(upright("cts"))^(*) \( P_n \; cal(B)_(n \, t) \) \, #h(2em) e_i mapsto xi_i dot.op 1 \, quad \| e_i \| = 2 i - 1 . $

The same rank-$n$ family supplies this map for every $t$.

Finally, Section 12 applies ordinary residue smash to the completed Morava descent resolution. Flatness and finite algebraic base change recover the coefficient complex above, including its semilinear first coface. The classes $u_i$ map to the classes $y_i$ in $D$; their products give compatible lifts of every basis vector through the totalization tower. Consequently the associated-graded basis is realized by the specified maps in (1.2). Section 2 proves in advance the final step: successive cofibers lower the height of the quotient, rational independence determines its last block, and finite pullbacks produce the filtration with its prescribed unit.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3.25, 0), [#box(width: 6.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite frames, transfers, and compact supports#linebreak()Sections~3--5]]])])
  content((-3.25, -1.229), [#box(width: 6.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Coefficient finiteness and full-frame rows#linebreak()Sections~6--8]]])], anchor: "north")
  content((3.25, -1.1), [#box(width: 6.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[One integral sphere-cochain family#linebreak()Sections~9--10]]])])
  content((0, -3.087), [#box(width: 9.423cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[The coefficient unit generates#linebreak()the specified exterior module#linebreak()Proposition~11.4]]])], anchor: "north")
  content((0, -5.269), [#box(width: 9.423cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[The specified products form a basis#linebreak()at every lower positive height#linebreak()Theorem~12.5]]])], anchor: "north")
  content((0, -7.415), [#box(width: 9.423cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Fracture and rational dimensions#linebreak()give the ordered filtration#linebreak()Proposition~2.1]]])], anchor: "north")
  line((-3.25, -0.529), (-3.25, -1.229), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((-2.419, -2.287), (-1.163, -3.087), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((2.62, -1.629), (0.8825, -3.087), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((0, -4.569), (0, -5.269), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((0, -6.715), (0, -7.415), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
})],
  caption: [Figure 1: The two inputs to the prescribed product bases. The left branch keeps the algebraic coefficient topology and its constant-cochain action; the right constructs the classes that act. Ordinary residue descent recognizes their products, and the independent rational calculation supplies the last filtration block. ],
) <fig:proof-architecture>

=== 1.3 History and the ingredients of the proof <history-and-the-ingredients-of-the-proof>

Hopkins’ chromatic splitting conjecture, recorded by Hovey #cite(label("Hovey")) Conjecture 4.2, proposes classes, factorizations, and a splitting of a canonical cofiber sequence. Its weak consequence asks for a retraction of the canonical unit comparison #cite(label("Hovey")) p. 2. Barthel and Beaudry review a revised strong formulation #cite(label("BB")) Conjecture 6.3 and Remark 6.4. The exterior-indexed summand pattern motivates (1.1); Theorem 1 realizes that pattern as the successive cofibers of an ordered filtration in the stated prime range.

Hovey’s July 1993 account records the height-one case and the height-two case at $p > 3$ as known, attributing the latter to Hopkins using Shimomura–Yabe #cite(label("Hovey")) pp. 17–19. Goerss–Henn–Mahowald prove the height-two splitting at $p = 3$ #cite(label("GHM2014")) Theorem 1.2. At height two and prime two, Beaudry disproved the original strong formula #cite(label("Beaudry2017")) Theorem 1.4. Beaudry–Goerss–Henn’s corrected calculation has additional Moore-spectrum terms and retains a split unit #cite(label("BGH2022")) Theorem 1.1.6.

Barthel–Schlank–Stapleton–Weinstein determine the rational homotopy of the $K \( n \)$-local sphere at every positive height and prime #cite(label("BSSW")) Theorem A. Their result gives

#[#set math.equation(numbering: n => "(1.3)")
 $ dim_(bb(Q)_p) pi_(- b) L_0 D = \# { I subset.eq { 1 \, dots.h \, n } : d \( I \) = b } . $ <eq:rational-dimensions>]

This determines the size of the last, rational block. It does not identify the maps in (1.2). We do not identify its individual rational generators with our integral $y_i$.

Torii developed common-coefficient comparisons between adjacent Morava theories and the localized descent spectral sequences they induce, including the unit comparison and survival of the reduced-norm class #cite(label("ToriiTranschromatic")) Theorems 4.7, 6.2, 7.6, and 8.1. The characteristic-$p$ period domains of Barthel–Mann–Ray–Schlank–Senger–Weinstein–Zhou provide a geometric approach to the coheight-one problem. For $n gt.eq 2$, their Corollary B shows that the map

$ L_(K \( n - 1 \)) S med or med Sigma^(- 1) L_(K \( n - 1 \)) S arrow.r L_(K \( n - 1 \)) D $

represented by the unit and the Devinatz–Hopkins class admits a retraction when $\( p - 1 \) divides.not \( n - 1 \)$. Their Theorem C gives the full equivalence at height two and odd primes #cite(label("BMR")). Their relative two-tower description also identifies the determinant normalization for positive-height strata #cite(label("BMR")) Theorems 2.0.1 and 2.6.3.

The coefficient distinction emphasized in #cite(label("BMR")) Section 1.5 is essential here. At intermediate heights $0 < t < n - 1$, analytic functions on the punctured stratum form a larger ring than the arithmetic coefficients arising from ordinary chromatic base change. Our height test requires the algebraic union $cal(B)_(n \, t)$ with its common finite-stage and bounded-pole cochains. Sections 5–8 connect its cohomology to integral compact supports through transfer and the boundary induction, while retaining that algebraic coefficient convention.

To connect the finite frame tower to integral compact supports, we pass from torsion coordinates to bundle extensions and track the transfer system. Hopkins and Gross relate the rigid generic Lubin–Tate deformation space to projective geometry through an equivariant period map #cite(label("HopkinsGross1994")) Theorem 1. The finite torsion-coordinate calculation is closely related to Strauch’s analysis of universal formal modules #cite(label("Strauch")); the exact-height connected markings use the formal-group classification in #cite(label("LurieFormalGroups")) Lecture 14, Theorem 1. The passage to bundles uses the Fargues–Fontaine curve #cite(label("FarguesFontaine")), the universal-cover description of Scholze–Weinstein #cite(label("ScholzeWeinstein")), the relative slope classification of Fargues–Scholze #cite(label("FarguesScholze")), and the full faithfulness for positive section sheaves of Anschütz–Le Bras #cite(label("AnschuetzLeBrasFourier")). Primitive comparison and open–closed localization for integral coefficients supply the geometric comparisons #cite(label("ScholzeHodge")) #cite(label("PignonYwanne")). The compact-parameter and incidence arguments in Section 5 establish the uniformity required to apply these comparisons to the finite marking tower and its transfers.

To obtain one family of acting sphere classes, we compare constant cochains and construct stable representatives with integral product normalization. Dotto–Le Hung compute the required mod-$p$ constant cohomology in the range $a < p - 1$ #cite(label("DLH")); the integral deduction is included in Section 9. The same section uses the integral Drinfeld-space calculation of Colmez–Dospinescu–Nizioł #cite(label("CDN")) to compare constant cochains through a common modification space. The construction of stable representatives then uses the continuity theorem of Geisser–Hesselholt #cite(label("GeisserHesselholt")), in the modern formulation of Clausen–Mathew–Morrow #cite(label("CMM")), the local cyclotomic-trace comparison of Hesselholt–Madsen #cite(label("HesselholtMadsenWitt")), and the chosen coordinates in topological cyclic homology of Blumberg–Mandell #cite(label("BlumbergMandellTC")). The regulator comparison of Huber–Kings #cite(label("HuberKings")) and the suspended-Chern volume calculation of Huber–Soergel #cite(label("HuberSoergel")) supply the rational normalization data. Section 10 combines them with local lattice and sphere-lifting arguments to obtain the integral normalization needed for the products to remain generators modulo $p$.

== 2 A criterion for the filtration <sec:assembly>

We first isolate the passage from compatible local bases to an actual filtration. The construction removes the basis maps in blocks, ordered by the largest index in their subsets. Each block kills the highest remaining chromatic layer of the quotient. After the last positive height has been removed, rational independence determines the remaining block. Taking fibers of the quotient maps then recovers a filtration of the original object. The same maps must serve as bases at every height so that removing an earlier block has this prescribed effect on every later test.

=== 2.1 Localizations and scalar conventions <localizations-and-scalar-conventions>

Fix a prime $p$, and write $S = S_p^and$. We work in the stable category of $S$-modules. Localizations are detected on the underlying spectra. In particular, an $S$-module is $E \( r \)$-local or $K \( t \)$-local when its underlying spectrum is so. These localizations inherit their $S$-module structure and adjunction from the monoidal Bousfield localization of spectra. All the fibers and cofibers below are taken in $S$-modules.

We use three familiar consequences of chromatic localization:

+ If $r gt.eq t$, the localization unit induces
  $ L_(K \( t \)) S arrow.r^(#h(0.27778em) tilde.eq #h(0.27778em)) L_(K \( t \)) L_r S . $
+ If an $E \( t \)$-local object $Q$ satisfies $L_(K \( t \)) Q = 0$, then $Q$ is $E \( t - 1 \)$-local. This is the chromatic fracture square applied to $Q$.
+ $L_0 L_r S = L_0 S = H bb(Q)_p$ for every $r gt.eq 0$. Consequently rational $S$-modules are modules over $H bb(Q)_p$.

The first statement follows because every $E \( r \)$-equivalence is a $K \( t \)$-equivalence. Composing localizations gives the first equality in (iii): rationalization is already an $E \( r \)$-localization of lower height. To identify its value, let $bb(S)$ denote the sphere before completion. Its positive stable stems are finite: choose an odd sphere in the stable range and apply Serre’s finiteness theorem #cite(label("Serre1951")) Chapter V, Section 3, Proposition 3. The Moore exact sequences for $bb(S) \/ p^v$ and the Milnor sequence for their inverse limit then give

$ pi_0 S = bb(Z)_p \, #h(2em) pi_i S = \( pi_i bb(S) \)_p^and quad \( i > 0 \) \, #h(2em) pi_i S = 0 quad \( i < 0 \) . $

Indeed, the finite Moore groups satisfy Mittag–Leffler, and the transition on the torsion kernels in the Moore exact sequences is multiplication by $p$, so their inverse limit is zero. Thus the positive groups displayed above are finite $p$-groups. Rationalizing leaves only $bb(Q) ⊗ bb(Z)_p = bb(Q)_p$ in degree zero, proving $L_0 S = H bb(Q)_p$. The standard fracture square and these localization conventions are reviewed in #cite(label("BB")) Section 2.

We will also use that the unit of $L_(K \( 1 \)) S$ is nonzero after rationalization. At odd $p$, height-one Morava theory is $E_1 tilde.eq K U_p^and$, with $bb(Z)_p^times$ acting through Adams operations. The structured homotopy fixed point spectral sequence

$ H_c^s \( bb(Z)_p^times \; pi_r E_1 \) arrow.r.double pi_(r - s) L_(K \( 1 \)) S $

is strongly convergent #cite(label("DevinatzHopkins")) Theorem 1(iii)–(iv) and pp. 2–3. The $p$-cohomological dimension of $bb(Z)_p^times = mu_(p - 1) times \( 1 + p bb(Z)_p \)$ is one. Since $pi_(*) E_1$ is even and the action on $pi_0 E_1 = bb(Z)_p$ is trivial, total degree zero has only the term $H_c^0 \( bb(Z)_p^times \; pi_0 E_1 \) = bb(Z)_p$. The augmentation sends the actual sphere unit to $1$ on this edge. Hence $pi_0 L_(K \( 1 \)) S tilde.equiv bb(Z)_p$, with the unit corresponding to $1$; its rationalization is nonzero.

=== 2.2 The simultaneous basis criterion <the-simultaneous-basis-criterion>

For a finite subset $I$ of the positive integers put

$ d \( I \) = sum_(i in I) \( 2 i - 1 \) \, #h(2em) d \( diameter \) = 0 . $

When we refer to a map representing an element of $pi_(- d \( I \)) D$, its source is the free $S$-module $Sigma^(- d \( I \)) S$.

#thm([Proposition 2.1.])[
  (Filtration criterion).  #emph[Let $n gt.eq 1$, let $p$ be odd, and let $D$ be an $S$-module with a specified map $u : S arrow.r D$. Suppose that maps 
$ z_I : Sigma^(- d \( I \)) S arrow.r D \, #h(2em) I subset.eq { 1 \, dots.h \, n - 1 } \, #h(2em) z_diameter = u \, $

 have the following properties.]
  + #emph[For each $1 lt.eq t < n$, the map with the specified components 
#[#set math.equation(numbering: n => "(2.1)")
 $ or.big_(I subset.eq { 1 \, dots.h \, n - t }) Sigma^(- d \( I \)) S arrow.r^(\( z_I \)) D $ <eq:criterion-bases>]

 is a $K \( t \)$-equivalence.]
  + #emph[For every integer $b$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ dim_(bb(Q)_p) pi_(- b) L_0 D = \# { I subset.eq { 1 \, dots.h \, n } : d \( I \) = b } . $ <eq:criterion-rational>]

 If $n = 1$, assume in addition that $pi_0 L_0 u$ is nonzero.]
  #emph[Then $X = L_(n - 1) D$ has the filtration and unit compatibility of Theorem 1(a), with $u$ in place of its unit.]
] <prop:assembly>

#proof[
  First suppose $n > 1$. We construct successive quotients $Q_j$ of $X$, starting with $Q_0 = X$. The first block is
  $ B_1 = L_(n - 1) S med or med Sigma^(- 1) L_(n - 1) S . $
  Localizing the maps $z_diameter \, z_({ 1 })$ gives a map $B_1 arrow.r Q_0$. Let $Q_1$ be its cofiber. Applying $L_(K \( n - 1 \))$, hypothesis (a) identifies this map with an equivalence. The cofiber $Q_1$ is therefore $E \( n - 2 \)$-local.
  Inductively, assume that $2 lt.eq j lt.eq n - 1$ and that $Q_(j - 1)$ is $E \( n - j \)$-local. For every $I$ with $max I = j$, compose $z_I$ with $D arrow.r X arrow.r Q_(j - 1)$. The localization adjunction extends this map uniquely, in the space of such extensions, to $Sigma^(- d \( I \)) L_(n - j) S$. We thus obtain
  #[#set math.equation(numbering: n => "(2.3)")
   $ B_j = or.big_(max I = j) Sigma^(- d \( I \)) L_(n - j) S arrow.r Q_(j - 1) arrow.r Q_j \, $ <eq:block-quotient>]
  where the last object is the cofiber.
  Here is the compatibility needed to continue the induction. Fix $t = n - j$. Hypothesis (a) gives a specified direct-sum basis of $L_(K \( t \)) D = L_(K \( t \)) X$, indexed by the subsets of ${ 1 \, dots.h \, j }$. For each earlier block $ell < j$, its sphere localization has height at least $t$. Its $K \( t \)$-localization is therefore the corresponding shift of $L_(K \( t \)) S$, and its map is the image of the original component $z_I$. Successive cofibers of these components remove exactly the subsets whose maximum is less than $j$, together with the empty subset. This assertion is inductive: at each step the map into the cofiber is the composite of that same original component with the quotient map, so the cofiber is the quotient by that direct summand.
  The remaining summands are precisely the components of $B_j$. It follows that $L_(K \( t \)) \( B_j arrow.r Q_(j - 1) \)$ is an equivalence. Consequently $L_(K \( t \)) Q_j = 0$, and chromatic fracture makes $Q_j$ $E \( t - 1 \)$-local. The construction thus reaches a rational object $Q_(n - 1)$. For $n = 2$, this is already the object $Q_1$ constructed from the first block.
  We next determine that rational quotient, keeping track of possible kernels. The elements
  $ z_I \, #h(2em) I subset.eq { 1 \, dots.h \, n - 1 } \, $
  are linearly independent after rationalization in each degree. Indeed, under hypothesis (a) at $t = 1$, their images in $L_(K \( 1 \)) D$ are the units of distinct shifted summands $Sigma^(- d \( I \)) L_(K \( 1 \)) S$. The rationalized unit in each such summand is nonzero. A rational relation between the $z_I$ would therefore give a relation between nonzero elements in different summands, which is impossible. This argument includes subsets with equal values of $d \( I \)$.
  Since $L_0 L_r S = H bb(Q)_p$, rationalizing the map from each block gives, in every degree, the injection of the corresponding independent vectors into the quotient by the preceding vectors. The cofiber long exact sequence has no suspended kernel. Subtracting these vectors from the dimensions in hypothesis (b) leaves
  $ dim_(bb(Q)_p) pi_(- b) Q_(n - 1) = \# { I subset.eq { 1 \, dots.h \, n } : max I = n \, med d \( I \) = b } . $
  The derived category of $bb(Q)_p$-vector spaces splits by homology. Choose a basis in each degree to obtain an equivalence of rational $S$-modules
  $ B_n = or.big_(max I = n) Sigma^(- d \( I \)) H bb(Q)_p arrow.r^(#h(0.27778em) tilde.eq #h(0.27778em)) Q_(n - 1) . $
  Its cofiber $Q_n$ is zero.
  It remains to pass from these successive quotients to a filtration of $X$. Set
  $ G_j = "fib" \( X arrow.r Q_j \) \, #h(2em) 0 lt.eq j lt.eq n . $
  Then $G_0 = 0$ and $G_n = X$. For each block the square
  (2.4)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$G_j$])
  content((1.992, 0), [$B_j$])
  content((0, -1.239), [$X$])
  content((1.992, -1.239), [$Q_(j - 1)$])
  line((0.468, 0), (1.524, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  line((1.992, -0.2725), (1.992, -0.9661), mark: (end: ">"))
  line((0.336, -1.239), (1.392, -1.239), mark: (end: ">"))
})
  is cartesian: its upper left corner is the fiber of $X arrow.r Q_j = "cofib" \( B_j arrow.r Q_(j - 1) \)$. Taking fibers of its horizontal maps yields the cofiber sequence
  $ G_(j - 1) arrow.r G_j arrow.r B_j . $
  If a block is $B_j = C_1 or dots.h.c or C_r$, replace $G_j$ by the intermediate pullbacks along
  $ 0 arrow.r C_1 arrow.r C_1 or C_2 arrow.r dots.h.c arrow.r B_j . $
  Exactness of pullback in a stable category makes their successive cofibers $C_1 \, dots.h \, C_r$. In the first block choose the unit summand first. Its pullback identifies the first stage with $L_(n - 1) S$, and its map to $X$ is exactly the localized $u$. The other blocks are already ordered by maximum. The number of individual pieces is
  $ 2 + sum_(j = 2)^(n - 1) 2^(j - 1) + 2^(n - 1) = 2^n . $
  This constructs the required filtration by $S$-linear maps.
  If $n = 1$, the object $X = L_0 D$ is rational. Hypothesis (b) places one copy of $bb(Q)_p$ in degree zero and one in degree $- 1$. The nonzero map $L_0 u : H bb(Q)_p arrow.r X$ is an isomorphism on degree-zero homotopy, so its cofiber is $Sigma^(- 1) H bb(Q)_p$. These are the two required stages. ◻
]

#prodef([Remark 2.2.])[
  The construction uses maps into the current quotient. Diagram (2.4) retains their boundary maps when the blocks are pulled back to $X$. Thus the criterion produces the attaching maps as part of the filtration; it requires no choice of a nullhomotopy for them.
] <rem:assembly-extensions>

== 3 Finite frame rings and Cartier transfers <sec:rings>

To compare coefficient cohomology with compact supports, we need transfers whose transpose is the actual Frobenius on functions of the finite covers. This section constructs the finite frame rings and lift torsors, then normalizes their Cartier transfers to obtain that map in Lemma 11.

Fix integers $1 lt.eq t < n < p - 1$, and put $m = n - t$. Choose a finite field $k$ containing the fields of definition of the Honda endomorphisms at the heights at most $n$. Its degree over $bb(F)_p$ may be chosen prime to $p$: a multiple of $"lcm" \( 1 \, dots.h \, n \)$ suffices for these endomorphism fields. Further finite extensions used below are chosen with the same property. Write

$ A = k \[ \[ x_t \, dots.h \, x_(n - 1) \] \] \, #h(2em) x = x_t \, #h(2em) B = A \[ 1 \/ x \] . $

Here $A$ is the height-$t$ quotient of the characteristic-$p$ Lubin–Tate deformation ring of the height-$n$ Honda group. Write $cal(G)_A$ for its formal group and $P_n = cal(O)_(D_n)^times$ for the ordinary height-$n$ stabilizer. The action on a function induced by a left action on points is always inverse substitution.

We choose a coordinate on $cal(G)_A$ lifting the fixed Honda coordinate and having the height congruences

#[#set math.equation(numbering: n => "(3.1)")
 $ \[ p \] \( T \) equiv x_i T^(p^i) med \( mod med \( x_t \, dots.h \, x_(i - 1) \, T^(p^i + 1) \) \) \, #h(2em) t lt.eq i lt.eq n \, quad x_n = 1 . $ <rings:height-congruences>]

The same choice gives the full special-fiber identity

$ \[ p \] \( T \) equiv T^(p^n) med \( mod med \( x_t \, dots.h \, x_(n - 1) \) \) $

as an identity of formal series. Moreover $\[ p \] \( T \)$ factors through $T^(p^t)$ over $A$. The group used on $B$ is the algebraic $p$-divisible group obtained from the finite kernels over $A$. More explicitly, Weierstrass preparation makes

$ A \[ \[ T \] \] \/ \( \[ p^l \] \( T \) \) $

a finite free $A$-algebra of rank $p^(n l)$. Its torsion coordinate is topologically nilpotent before localization, so the formal addition and multiplication series define algebraic group operations on this finite algebra. Preparation for $\[ p \] \( T \) - Z$ gives the finite flat transition maps. We localize these finite group schemes at $x$. Thus the connected–étale sequence on $B$ retains the entire finite kernel, including its infinitesimal connected part.

=== 3.1 Labeled rings before localization <labeled-rings-before-localization>

For $l gt.eq 1$, consider $m$ points of $cal(G)_A \[ p^l \]$ whose images form a basis of the étale quotient at the generic point of $A$. Let $tilde(C)_l$ be the reduced closure of this generic lifted-basis locus in the finite scheme of $m$ torsion points, and write $z_(1 \, l) \, dots.h \, z_(m \, l)$ for the lifted coordinates. Set

$ w_(i \, l) = z_(i \, l)^(p^(t l)) \, #h(2em) C_l = A \[ w_(1 \, l) \, dots.h \, w_(m \, l) \] subset.eq tilde(C)_l . $

These finite $A$-algebras are complete. A reduced closure is used only to establish their coordinates; the proposition also identifies the unreduced scheme that will be used for descent. For the boundary convention $t = n$, the empty labeled ring is $k$.

#thm([Proposition 3.1.])[
  (Finite labeled rings).  #emph[There are compatible identifications 
#[#set math.equation(numbering: n => "(3.2)")
 $ C_l = k \[ \[ w_(1 \, l) \, dots.h \, w_(m \, l) \] \] \, #h(2em) tilde(C)_l = k \[ \[ z_(1 \, l) \, dots.h \, z_(m \, l) \] \] \, #h(2em) w_(i \, l) = z_(i \, l)^(p^(t l)) . $ <rings:regular-coordinates>]

 Both rings are finite free over $A$. On the exact-height locus, $C_l \[ 1 \/ x \]$ is the finite étale algebra of bases of the étale $p^l$-torsion. Over this algebra the scheme of all lifts of its universal basis to $cal(G)_A \[ p^l \]$ has algebra 
$ tilde(C)_l \[ 1 \/ x \] = \( C_l \[ 1 \/ x \] \)^(1 \/ p^(t l)) \, $

 finite locally free of rank $p^(t l m)$.]
  #emph[The transition maps are finite and injective, and for $j lt.eq l$ 
#[#set math.equation(numbering: n => "(3.3)")
 $ z_(i \, j) in k \[ \[ z_(1 \, l)^(p^(t \( l - j \))) \, dots.h \, z_(m \, l)^(p^(t \( l - j \))) \] \] . $ <rings:transition-powers>]

]
] <prop:finite-rings>

#proof[
  The algebra $tilde(C)_l$ is finite and reduced, and each of its irreducible components dominates $"Spec" A$ by its definition as a generic closure. It has dimension $m$. Above the closed point of $A$ all torsion coordinates are nilpotent, so there is a unique closed point and its residue field is $k$. Its maximal ideal is generated by the height parameters and the $z_(i \, l)$.
  Put $a_i = \[ p^(l - 1) \] \( z_(i \, l) \)$, and for $v in bb(F)_p^m$ let $a_v$ be the corresponding formal-group linear combination of the $a_i$. If $W_p \( T \)$ is the distinguished polynomial for $\[ p \] \( T \)$, then
  #[#set math.equation(numbering: n => "(3.4)")
   $ W_p \( T \) = product_(v in bb(F)_p^m) \( T - a_v \)^(p^t) = product_(v in bb(F)_p^m) \( T^(p^t) - a_v^(p^t) \) . $ <rings:basis-polynomial>]
  Indeed this is the factorization over every geometric generic field: the distinct étale points are indexed by the labels and each has connected multiplicity $p^t$. Both sides are monic of degree $p^n$, so generic density in the reduced algebra proves the identity there.
  There is a series $h_l$ with $\[ p^(l - 1) \] \( T \) = h_l \( T^(p^(t \( l - 1 \))) \)$. Consequently $a_i^(p^t)$ is a power series in $w_(i \, l)$ with coefficients in $A$ and zero constant term. Taking formal-group linear combinations gives the same assertion for every $a_v^(p^t)$. Thus (3.4) is an identity over $C_l$, and modulo $\( w_(1 \, l) \, dots.h \, w_(m \, l) \)$ it becomes $T^(p^n)$. The preparation unit for $\[ p \] \( T \)$ is defined over $A$. All coefficients of $\[ p \] \( T \)$ of degree below $p^n$ therefore vanish in this quotient, and (3.1) successively gives
  $ x_t = x_(t + 1) = dots.h.c = x_(n - 1) = 0 . $
  The maximal ideal of $C_l$ is generated by its $m$ displayed $w$-coordinates. Since $C_l$ is integral over $A$, its dimension is $m$. It is a regular local ring, and the surjection from $k \[ \[ W_1 \, dots.h \, W_m \] \]$ taking $W_i$ to $w_(i \, l)$ is an isomorphism: a nonzero kernel would lower the dimension of this power-series domain. The identical maximal-ideal argument with the $z_(i \, l)$ gives the second identification in (3.2), including the stated inclusion. These finite regular rings are Cohen–Macaulay of dimension $m$; the parameters of $A$ form systems of parameters on them. Their Koszul complexes are exact in positive degree, so the finite modules are flat, hence free, over the local ring $A$.
  We next check the finite schemes after localization. Write
  $ \[ p^l \] \( T \) = g_l \( T^(p^(t l)) \) \, #h(2em) g_l \( S \) = U_l \( S \) V_l \( S \) \, $
  where $U_l$ is a unit and $V_l$ is distinguished of degree $p^(m l)$. The linear coefficient of $g_l$ is a unit times $x^(1 + p^t + dots.h.c + p^(t \( l - 1 \)))$. The invariant-differential identity for this Frobenius-divided homomorphism expresses $g'_l \( S \)$ as that coefficient times a quotient of unit series. Evaluating in the prepared finite algebra shows that $V'_l$ is a unit after $x$ is inverted. Thus the Frobenius-divided finite group is étale there, of rank $p^(m l)$. Its kernel quotient has removed exactly the connected kernel of rank $p^(t l)$.
  The scheme of bases of this étale group is finite étale over $B$. The universal labeled points give a surjection from its algebra to $C_l \[ 1 \/ x \]$. It is an isomorphism generically, since the generic closure included every basis. Its kernel is zero: the source is flat over the domain $B$, whereas a kernel vanishing generically would be $B$-torsion. This identifies the basis algebra.
  Over this basis algebra, the scheme of lifts of the $m$ basis vectors is a product of torsors for the connected finite kernel. It is finite locally free of rank $p^(t l m)$. Its algebra surjects onto $tilde(C)_l \[ 1 \/ x \]$, which is generated by the same lifted coordinates. The latter is free over $C_l \[ 1 \/ x \]$ with basis
  $ product_(i = 1)^m z_(i \, l)^(e_i) \, #h(2em) 0 lt.eq e_i < p^(t l) . $
  The two ranks are equal, so the surjection is an isomorphism. This is the assertion about the full lift scheme, rather than its reduction.
  A basis at level $j$ lifts to a basis at level $l$ over an extension of every geometric generic field. Hence the transition maps on the reduced closures are injective. They are finite because both rings are finite over $A$. Since $z_(i \, j) = \[ p^(l - j) \] \( z_(i \, l) \)$, factorization through Frobenius and (3.2) give (3.3). ◻
]

The underlying regular-quotient and étale-coordinate construction is also described at arbitrary height in #cite(label("Strauch")) §§3–4, Proposition 4.1. The explicit rank comparison above records the additional finite-flat statement needed for our translation torsors.

The boundary calculation also needs a presentation that survives nilpotent base change. We establish that presentation before identifying the locus on which a label vanishes.

#thm([Lemma 3.2.])[
  (An integral full-section presentation).  #emph[Let $H$ be the quotient of $cal(G)_A \[ p \]$ by its relative $p^t$-Frobenius kernel. The ring $C_1$ represents full labeled section tuples $bb(F)_p^m arrow.r H$, including over nilpotent test rings. Here “full” means equality of the finite Cartier divisors, or equivalently, after every base change, equality of the norm of every function with its product over the labeled sections.]
] <rings:full-sections-presentation>

#proof[
  The quotient $H$ has the monogenic presentation obtained by dividing the prepared $p$-series by relative Frobenius. The full-section condition is a finite set of coefficient identities for its monic polynomial. Indeed equality for the coordinate implies equality of the characteristic polynomial for every polynomial in that coordinate by substitution, and every function in the finite algebra has such a representative. This description commutes with arbitrary base change.
  Let $Q$ be the resulting finite complete $A$-algebra of labeled group-homomorphism tuples. It has one closed point, because at the closed point of $A$ the connected finite group has only the zero section over a field. If all $m$ labeled coordinates are set equal to zero, the full-section identity makes the divided distinguished polynomial $T^(p^m)$. Applying (3.1) before this division successively kills all the height parameters. Thus the maximal ideal of $Q$ has at most $m$ generators. There is a surjection $Q arrow.r.twohead C_1$ induced by the generic full tuple. Since $C_1$ has dimension $m$, the dimension and embedding dimension of $Q$ are both $m$. Hence $Q$ is regular. A quotient of this regular local domain of the same dimension has zero kernel, proving $Q = C_1$.
  All equations in this argument are equations in finite algebras formed before localization. Their subsequent use on an étale component therefore involves polynomial operations in a finite algebra; it does not require substituting an order-one element into an unevaluated formal series. ◻
]

#thm([Corollary 3.3.])[
  (Vanishing labels and higher starting height).  #emph[At level one, for each nonzero label $v in bb(F)_p^m$ there is a coordinate $w_v$ such that 
#[#set math.equation(numbering: n => "(3.5)")
 $ x = upright("a unit") dot.op product_(0 eq.not v in bb(F)_p^m) w_v . $ <rings:height-divisor>]

 Each ideal $\( w_v \)$ is $P_n$-stable. Its conormal is a power of the invariant coordinate line. For a primitive label, the quotient by $\( w_v \)$ is the starting-height-$\( t + 1 \)$ level-one ring with $p$-th roots of its parameters adjoined. The same assertion can be iterated for any independent set of dead labels.]
] <rings:boundary-labels>

#proof[
  At level one let $a_v$ be the formal-group linear combination of $z_(1 \, 1) \, dots.h \, z_(m \, 1)$ with label $v in bb(F)_p^m$, and put $w_v = a_v^(p^t)$. The coefficient of $T^(p^t)$ in (3.4), together with the preparation unit, gives (3.5). Transport by $P_n$ is a change of formal coordinate with invertible linear coefficient. Its action on $w_v$ is $w_v$ times a unit, proving stability of $\( w_v \)$. On the conormal only that linear coefficient remains, raised to the $p^t$-th power. Equivalently, this is the invariant cotangent line of the Frobenius-divided group restricted to its zero section. This also describes the action without a choice of generator for the line.
  Change the labels so that $v$ is the first basis vector, and put $R = C_1 \/ \( w_1 \) = k \[ \[ w_2 \, dots.h \, w_m \] \]$. Write $\[ p \] \( T \) = g_t \( T^(p^t) \)$ and let $Q_t$ be the distinguished polynomial of $g_t$. Formula (3.5) gives $x_t = 0$ in $R$. The labels in each coset of $bb(F)_p v$ then give the same point, so
  $ Q_t \( Y \) = product_(macron(v) in bb(F)_p^(m - 1)) \( Y^p - w_(macron(v))^p \) . $
  Over $A \/ \( x_t \)$ we have $g_t \( Y \) = g_(t + 1) \( Y^p \)$, and uniqueness of preparation gives $Q_t \( Y \) = Q_(t + 1) \( Y^p \)$. Therefore
  $ Q_(t + 1) \( Z \) = product_(macron(v) in bb(F)_p^(m - 1)) \( Z - w_(macron(v))^p \) . $
  Coefficient Frobenius identifies these labels with the formal-group combinations of $w_2^p \, dots.h \, w_m^p$ in the next Frobenius twist. By Lemma 5, the displayed full-section identity gives a map from the starting-height-$\( t + 1 \)$ labeled ring, whose labeled coordinates map to $w_2^p \, dots.h \, w_m^p$. In the power-series coordinates of Proposition 4, this map is injective with image $k \[ \[ w_2^p \, dots.h \, w_m^p \] \] = R^p$, since $k$ is perfect. Thus $R$ is exactly its $p$-th-root extension, with the indicated $A \/ \( x_t \)$-structure. Repeating the calculation for $h$ independent dead labels sends the higher-height labeled coordinates to $w_(h + i)^(p^h)$ and gives the corresponding $p^h$-th-root extension. ◻
]

=== 3.2 Connected markings and compatible lifts <connected-markings-and-compatible-lifts>

Let $Gamma_t$ be the height-$t$ Honda group over $k$. A connected marking is an isomorphism

$ alpha : Gamma_t arrow.r cal(G)_B^0 $

of formal groups, and an étale marking is an integral basis $i : bb(Z)_p^m arrow.r T_p cal(G)_B^(upright("et"))$. Their joint algebraic tower has structure group

$ U_0 = P_t times "GL"_m \( bb(Z)_p \) \, #h(2em) P_t = cal(O)_(D_t)^times . $

We use the left action $\( h \, a \) \( alpha \, i \) = \( alpha h^(- 1) \, i a^(- 1) \)$. For an open subgroup $U subset.eq U_0$, write $B_U$ for the corresponding finite frame algebra. Write $cal(B) = "colim"_U B_U$ for the entire joint algebraic frame ring. No completion of this union is part of this notation.

#thm([Proposition 3.4.])[
  (Frame and lift torsors).  #emph[The rings $B_U$ form a tower of finite étale $B$-algebras. After passing to normal open levels, the maps in the tower are finite étale torsors for the indicated finite deck groups. The tower is $P_n$-equivariant, and $P_n$ commutes with its $U_0$-action.]
  #emph[Over $cal(B)$, the scheme of lifts of the compatible étale basis is an affine faithfully flat torsor for 
#[#set math.equation(numbering: n => "(3.6)")
 $ T = \( T_p Gamma_t \)^m \, #h(2em) T_p Gamma_t = "proj lim"_(\[ p \]) Gamma_t \[ p^r \] . $ <rings:translation-group>]

 For every $r gt.eq 1$ its finite quotient has group $T \/ \[ p \]^r T = Gamma_t \[ p^r \]^m$ and algebra 
#[#set math.equation(numbering: n => "(3.7)")
 $ cal(B)^(1 \/ p^(t r)) . $ <rings:root-torsor>]

 Thus the full lift algebra is the algebraic root union $cal(B)^(upright("perf"))$. The group $P_n$ acts trivially on the translation parameters. The action of $\( h \, a \) in U_0$ on a translation tuple $tau$ is 
#[#set math.equation(numbering: n => "(3.8)")
 $ tau mapsto h tau a^(- 1) . $ <rings:auxiliary-action>]

 All finite torsor constructions and all their morphisms descend to finite frame levels once their finite marking data are included.]
] <prop:frame-torsor>

#proof[
  Over $B$ the lower height coefficients vanish and the height-$t$ coefficient is invertible. The full isomorphism ring between this law and $Gamma_t$ is therefore a filtered union of finite étale extensions, by the exact-height isomorphism theorem #cite(label("LurieFormalGroups")) Lecture 14, Theorem 1. For clarity, its finite stages record coefficients of a full isomorphism that extend to the next required equations. The first coefficient $c$ satisfies $c^(p^t - 1) = x^(- 1)$ up to the chosen leading unit. The subsequent free coefficients satisfy monic additive equations with invertible linear coefficient; the other coefficients are uniquely determined. The equation constraining a coefficient of degree $p^j$ can occur at degree $p^(t + j)$. Thus these are not the schemes of arbitrary finite-bud isomorphisms. Any two full markings differ uniquely by $P_t$, and quotienting by an open subgroup gives its finite étale torsor stages.
  The étale Tate basis tower is finite étale at each level, as proved in Proposition 4. Taking the product of the two frame torsors proves the first assertion. Universal deformation transport carries both markings along the same isomorphism; it commutes with changing the markings. This proves the asserted $P_n$ equivariance.
  At finite level $r$, two lifts of the marked étale basis differ by exactly one element of $Gamma_t \[ p^r \]^m$. Proposition 4 identifies the lift algebra over the étale basis cover with its $p^(t r)$-th root ring. Relative Frobenius commutes with finite étale base change, so the same identification holds after any connected marking base change. It is canonical: each element of the lift algebra is the unique $p^(t r)$-th root of its power in the base. The identity may be checked on the faithfully flat basis cover and then descended.
  The finite torsor maps are faithfully flat and the transition on lifts is multiplication by $p$. Taking their affine inverse limit gives the torsor identity and faithful flatness for (3.6). The kernel of the projection $T arrow.r Gamma_t \[ p^r \]^m$ is $\[ p \]^r T$: shifting a compatible sequence by $r$ constructs its unique preimage under $\[ p \]^r$. This proves both the subgroup assertion and (3.7).
  Finally, transport by $P_n$ carries the connected marking, the étale basis, and its lift simultaneously, so it fixes their difference parameter in the constant Honda group. Changing the markings by $\( h \, a \)$ instead changes that parameter by (3.8). Each finite kernel and each finite diagram uses finitely many coefficients of the connected marking and a finite étale level, proving finite-stage descent. ◻
]

#prodef([Definition 3.5.])[
  (Coefficient and cochain convention).  For a finite projective module over a finite frame algebra we use continuous cochains with bounded poles. On a compact profinite source this means that one power of $x$ places the entire image in a finite power-series lattice, where the cochain is continuous for the parameter-adic topology. For a union of frame, root, or associated-bundle coefficients, one common finite stage is required on each compact source. Equivalently the cochain complex of such a union is the filtered colimit of its finite-stage bounded-pole cochain complexes. These conventions also apply with an additional compact profinite parameter.
] <rings:bounded-cochains>

Finite free coordinate formulas, module splittings, and finite étale descent preserve this convention. A fixed finite diagram can have a fixed pole loss, but its formulas require only finitely many coefficients and denominators. The compact-lattice estimates and continuous cochain exactness used later will be established with these coefficient topologies.

=== 3.3 The dual distribution ring <the-dual-distribution-ring>

The distribution ring organizes the translation representations at each finite root level. Its identifications across Frobenius levels will be used in Lemma 11 to normalize the transfer and identify its transpose with the actual Frobenius on cover functions.

Suppose first that $t > 1$, and put $d = m \( t - 1 \)$. The category of rational representations of the affine group scheme $T$ is the category in which every vector belongs to a representation of a finite quotient of $T$. It is not the representation category of its geometric points. Finite Cartier duality identifies its completed distribution ring with

#[#set math.equation(numbering: n => "(3.9)")
 $ Lambda = "proj lim"_r cal(O) \( Gamma_t \[ p^r \]^m \)^or = cal(O) \( \( hat(Gamma_t^or) \)^m \) tilde.eq k \[ \[ D_1 \, dots.h \, D_d \] \] . $ <rings:distribution-ring>]

Here $\( - \)^or$ on a finite vector space is its $k$-linear dual. Rational representations correspond to discrete modules locally killed by powers of the augmentation ideal. The displayed parameters need not linearize the auxiliary action.

#thm([Lemma 3.6.])[
  (Divisible Frobenius levels).  #emph[There is a positive integer $r_0$, divisible by $t - 1$, such that for $r = a r_0$, $a gt.eq 1$, the two numbers 
#[#set math.equation(numbering: n => "(3.10)")
 $ Q = p^(t r) \, #h(2em) q = p^(t r \/ \( t - 1 \)) $ <rings:two-frobenius-indices>]

 are Frobenius powers fixing $k$. At this level 
$ cal(O) \( \( Gamma_t^or \[ p^r \] \)^m \) = Lambda_q := Lambda \/ \( D_1^q \, dots.h \, D_d^q \) \, #h(2em) dim_k Lambda_q = q^d = Q^m . $

 The embedding $\[ p \]^r : T arrow.r.hook T$ corresponds on distributions to 
$ psi_q : Lambda arrow.r Lambda \, #h(2em) D_j mapsto D_j^q \, quad c mapsto c med \( c in k \) . $

 If $N_q = cal(O) \( T \/ \[ p \]^r T \)$ is the regular function representation, finite Hopf duality gives a normalized equivariant identification $N_q tilde.eq Lambda_q$ as translation representations. The auxiliary action on each finite quotient factors through a finite group.]
] <rings:dual-distribution>

#proof[
  The dual of the dimension-one, height-$t$ Honda group has dimension $t - 1$ and height $t$. Since $t > 1$, it is connected; its formal group is smooth of dimension $t - 1$. This proves (3.9). The Honda relation is $F^t = \[ p \]$ on $Gamma_t$. Duality gives $V^t = \[ p \]$ on $Gamma_t^or$, and $F V = \[ p \]$ then gives
  $ F^t = \[ p \]^(t - 1) quad upright("on ") Gamma_t^or . $
  Cancellation here is cancellation of an isogeny of the divisible group. Thus, when $r$ is divisible by $t - 1$, $\[ p \]^r$ on the dual is Frobenius of order $t r \/ \( t - 1 \)$. Choose $r_0$ also so that this Frobenius and Frobenius of order $t r_0$ fix $k$. Pullback on any system of formal parameters is consequently the stated $q$-power map. Its kernel has the displayed truncated power-series ring. The length identity follows directly from $d = m \( t - 1 \)$.
  For a finite commutative group scheme $G$, its function algebra and the dual Hopf algebra are related by the perfect Frobenius pairing
  $ \( f \, g \) mapsto lambda \( f g \) \, $
  where $lambda$ is a nonzero invariant integral. In our Frobenius kernels, a coordinate description of $lambda$ is the highest-monomial coefficient after multiplication by the normalized invariant volume density. The pairing is perfect: its associated graded pairing in augmentation coordinates pairs complementary monomials. More explicitly, let $v$ be the highest monomial in the original group coordinates. The map $Lambda_q arrow.r N_q$, $a mapsto a dot.op v$, is an isomorphism of translation representations. Indeed the socle integral of the local Gorenstein algebra $Lambda_q$ acts nontrivially on $v$. A nonzero kernel ideal would meet that socle, a contradiction, and the two dimensions agree. Under an auxiliary change of group coordinates, $v$ changes by the tangent determinant raised to the $\( Q - 1 \)$-st power; higher coordinate terms have too large total degree to contribute to the socle. This character is trivial, because its values lie in $k^times$ and $Q$-power fixes $k$. The displayed regular-module identification is therefore equivariant. With its socle normalization $lambda \( v \) = 1$, it satisfies
  $ lambda \( a dot.op v \) = epsilon \( a \) lambda \( v \) = epsilon \( a \) \, $
  where $epsilon$ is the distribution augmentation. Thus normalized integration is exactly the quotient $Lambda_q arrow.r k$ under this identification. The finite-dimensional algebra is a finite set, since $k$ is finite. Continuity of the marking action implies that its action factors through a finite quotient. ◻
]

When $t = 1$ we instead take $Gamma_1 = hat(bb(G))_m$. Its Cartier dual is étale. The translation group $T$ is diagonalizable with character group $\( bb(Q)_p \/ bb(Z)_p \)^m$. A rational representation is the direct sum of its character spaces, and invariants are the zero-character summand. Invariants are consequently exact. The transfer at a finite level is the constant-character projection, normalized to fix constants. We set $d = 0$ in this case and use no power-series distribution ring or higher translation Ext. The function-root exponent remains $Q = p^r$.

=== 3.4 Powering and natural finite diagrams <powering-and-natural-finite-diagrams>

Write $cal(E) = cal(B)^(upright("perf"))$ for the algebraic lift union. For a finite translation representation $M$, its associated coefficient module is

$ cal(V) \( M \) = \( cal(E) ⊗_k M \)^T . $

It is obtained by finite flat descent from a finite lift torsor as soon as $M$ factors through a finite quotient. In particular it is finite projective over $cal(B)$ and descends to a finite frame stage. A compatible auxiliary action on $M$ is retained in this construction.

#thm([Lemma 3.7.])[
  (Powering on associated diagrams).  #emph[Let $r$ be one of the chosen levels and put $H = \[ p \]^r T$. Transport a finite $T$-representation $M$ to $H$ using $\[ p \]^r : T tilde.eq H$, and then coinduce it to $T$. This is an exact functor, denoted $cal(C)_r$. There is a natural $P_n$- and auxiliary-equivariant identification of the associated coefficient diagram for $cal(C)_r M$ with the $Q$-root version of the diagram for $M$. Powering by $Q$ identifies the two diagrams $k$-linearly and Frobenius-semilinearly over the base: 
#[#set math.equation(numbering: n => "(3.11)")
 $ Phi_Q \( c f \) = c^Q Phi_Q \( f \) \, #h(2em) Phi_Q \( f \) = f^Q . $ <rings:power-scalar-rule>]

 The assertion holds for every morphism and every finite diagram, and after invariants in any compatible open frame subgroup. It does not require trivializing the auxiliary action on all coinduced modules simultaneously.]
] <rings:coinduction>

#proof[
  Let $rho$ be the coaction on $cal(E)$ and $rho_H$ its restriction to $H$, transported to $T$. On $cal(O) \( T \)$, substitution along $\[ p \]^r$ is the $Q$-power map, because $\[ p \]^r = F^(t r)$ on the original Honda group. Taking powers in the coaction identity gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ rho Phi_Q = \( Phi_Q ⊗ 1 \) rho_H . $ <rings:coaction-powering>]
  The algebra $cal(E)$ is perfect, so $Phi_Q$ is bijective. It is $k$-linear by the choice of $r$, and has the scalar behavior (3.11). It identifies $cal(E)^H = cal(B)^(1 \/ Q)$ with $cal(E)^T = cal(B)$.
  Finite induction and coinduction for $H subset.eq T$ are exact. For $t > 1$ this can be seen directly from (3.9): $Lambda$ is finite free over $psi_q \( Lambda \)$, with the monomials of exponents less than $q$ as a basis, so both tensor induction and Hom coinduction are exact. After forgetting auxiliary actions their usual Frobenius pairing also identifies these two functors. The equivariance needed here will follow directly from the coaction identity and adjunction below. For $t = 1$ the same statement is the corresponding finite character decomposition. The descent identity for coinduction is
  $ cal(V) \( cal(C)_r M \) tilde.eq \( cal(E) ⊗_k M \)^H . $
  Tensoring (3.12) with $M$ and taking invariants gives the claimed comparison.
  Every marking automorphism commutes with $\[ p \]^r$, and every characteristic-$p$ ring automorphism commutes with $Q$-powering. Hence these identities are equivariant before taking invariants. They are also natural before invariants, so they apply to entire finite diagrams, not just to their dimensions or individual terms. Finite torsor formulas use finitely many marking coefficients and denominators. They therefore descend, with their natural actions, and respect Definition 8. ◻
]

=== 3.5 Invariant volumes and the transfer transpose <invariant-volumes-and-the-transfer-transpose>

The dimension of the finite lift group $Gamma_t \[ p^r \]^m$ in tangent directions is $m$, whereas the dimension of its formal Cartier dual is $d$. The volume in this subsection has degree $m$. Choose normalized invariant coordinate volumes on the Honda factors. On a sufficiently divisible finite lift torsor, their product gives a generator of the relative top differentials. In the root coordinates of Proposition 4, the base consists of $Q$-th powers. Relative and absolute continuous differentials therefore agree. Transport this generator by the abstract ring isomorphism $f mapsto f^Q$ from the root ring to the original ring, and call the resulting top form $eta$. This transport is transport through an isomorphism of rings with renamed root coordinates; it is not the zero pullback of differentials under an absolute Frobenius morphism. It gives compatible frames on subsequent levels. To check this, trivialize the relevant finite torsor diagram faithfully flatly. The subgroup map is $Q$-power on the original Honda coordinates, and the normalized invariant-volume coefficients are fixed by this power on $k$. Power-transport is therefore the normalized group volume at the preceding stage. Equality descends along the trivialization. Thus one choice of $eta$ is used throughout the stationary tower.

The construction uses only finite torsor and marking data. Thus $eta$ is a generator at a sufficiently deep finite frame level. On the full joint tower it is $P_n$-invariant, since $P_n$ fixes the translation parameters. Its auxiliary line is

#[#set math.equation(numbering: n => "(3.13)")
 $ chevron.l eta chevron.r = det "Lie" \( Gamma_t^m \)^(*) . $ <rings:volume-character>]

In particular its $"GL"_m$ weight is $+ 1$ in each diagonal row, by (3.8). The character is finite over $k$; it becomes trivial on a sufficiently small open frame subgroup.

#thm([Lemma 3.8.])[
  (Cartier transfer and its transpose).  #emph[Fix one sufficiently divisible step with function-root exponent $Q$, and use the volume just constructed. The quotient transfers of the lift torsors can be normalized compatibly so that, after powering to a fixed finite frame ring, their first step is 
#[#set math.equation(numbering: n => "(3.14)")
 $ S \( f \) = frac(cal(C)_Q \( f eta \), eta) \, $ <rings:stationary-c>]

 where $cal(C)_Q$ is Cartier trace on continuous top differentials. The subsequent stationary transfers are $S^a$. In particular $S \( c^Q f \) = c S \( f \)$.]
  #emph[These transfers are finite Hopf integration on the torsor, not ordinary field trace. They commute with $P_n$, with their natural auxiliary actions, and with finite étale change of frame level. Their transpose under the residue pairing is positive Frobenius on dual coefficient functions, with the one volume line (3.13) retained. Before stationary identification it is the inclusion into the next root coefficient ring. For a finite étale cover or its associated coefficient module, this is the actual Frobenius on the cover functions and their trace duals. All statements hold for finite diagrams in Lemma 10.]
] <lem:cartier-transfer>

#proof[
  We first verify both the normalization and the absence of a base-dependent scalar. On a root chart write
  $ R_0 = k \[ \[ w_1 \, dots.h \, w_m \] \] \, #h(2em) R_1 = k \[ \[ z_1 \, dots.h \, z_m \] \] \, #h(2em) w_i = z_i^Q \, $
  with the relevant height parameter inverted and with finite étale scalar extensions permitted. Write the invariant torsor volume as
  $ eta_1 = a \( z \) thin d z_1 and dots.h.c and d z_m . $
  Its power transport is $eta_0 = a \( z \)^Q thin d w_1 and dots.h.c and d w_m$; the coefficient $a \( z \)^Q$ belongs to $R_0$ and is a unit there. For $f in R_1$, the Frobenius trace on top forms, divided by $eta_0$, is the $R_0$-linear functional
  #[#set math.equation(numbering: n => "(3.15)")
   $ tau \( f \) = frac(\[ z_1^(Q - 1) dots.h.c z_m^(Q - 1) \] \( f thin a \( z \) \), a \( z \)^Q) . $ <rings:trace-formula>]
  Brackets mean coefficient extraction in the free $R_0$-basis with all exponents between $0$ and $Q - 1$. This trace is independent of the root coordinates: it is the finite-duality trace on top forms, or, equivalently, the functional characterized by the change-of-variables rule for the residue. Invariant volume and the same rule make it translation invariant.
  To determine its normalization, make a faithfully flat extension that supplies a point $b$ of the torsor. The torsor becomes the finite Honda kernel. In the root chart put $epsilon.alt_i = z_i - b_i$, so that $epsilon.alt_i^Q = 0$. Let $u_i$ be normalized group coordinates at the identity. Invariance of the volume gives
  $ det (frac(partial u, partial epsilon.alt)) \( 0 \) = a \( b \) . $
  In the truncated polynomial ring the socle therefore transforms as
  $ u_1^(Q - 1) dots.h.c u_m^(Q - 1) = a \( b \)^(Q - 1) epsilon.alt_1^(Q - 1) dots.h.c epsilon.alt_m^(Q - 1) . $
  Only the linear part of the coordinate change contributes in the maximal possible total degree; its action on that socle is the determinant to the $\( Q - 1 \)$-st power. Formula (3.15) consequently sends this group-coordinate socle to
  $ frac(a \( b \)^(Q - 1) a \( b \), a \( b \)^Q) = 1 . $
  The normalized invariant Hopf integral has exactly this value. The invariant-functional module is a free line, as is also clear from the perfect complementary-monomial pairing. The two functionals are therefore equal over the whole splitting algebra. Faithfully flat descent proves equality on the original torsor. In particular no comparison only on geometric fibers, and no undetermined invertible function on the base, is being used.
  Identify the root ring with the original ring by $Q$-powering. Formula (3.15) is then exactly (3.14). The transitivity of finite-duality traces, or direct iteration of the coefficient-extraction formula, gives $S^a$ at the $a$-th step. This proves stationarity with compatible normalizations. Under the regular-module identifications in Lemma 9, the finite transfers are the quotient maps $Lambda_(q') arrow.r Lambda_q$. Indeed, in normalized group coordinates the transfer from root exponent $Q'$ to $Q$ takes the highest monomial to the highest monomial: extracting the residue classes of exponents modulo $Q' \/ Q$ leaves precisely the exponents $Q - 1$. The invariant-volume density and its inverse contribute only their constant terms to these socles. The transfer is $T$-equivariant, so its value on this cyclic generator determines it on the whole regular module. For $t = 1$ the same calculation uses the invariant forms $d y_i \/ y_i$ in multiplicative coordinates. It extracts the zero character on a finite diagonalizable torsor, so agrees with the constant-character projection described above.
  For the transpose, take first a free compact lattice over $R_0$ and pair it with the negative principal parts of its dual tensored with top forms. The pairing is
  $ \( f \, h eta \) mapsto "res" \( f h eta \) . $
  In coordinates, Cartier selects exponents congruent to $Q - 1$ in every variable and divides their successors by $Q$. Since $Q$ fixes $k$, its residue identity is
  #[#set math.equation(numbering: n => "(3.16)")
   $ "res" #scale(x: 120%, y: 120%)[\(] S \( f \) h eta #scale(x: 120%, y: 120%)[\)] = "res" #scale(x: 120%, y: 120%)[\(] f h^Q eta #scale(x: 120%, y: 120%)[\)] . $ <rings:transpose-residue>]
  This follows as well by applying Cartier to $f h^Q eta$ and using its inverse-semilinearity. Thus the transpose is $h mapsto h^Q$ in the stationary volume frame. Renaming the root coordinates makes this the root inclusion. The form $eta$ is retained once, as in (3.13).
  For a finite étale coefficient algebra the dual is identified by its finite étale trace pairing. Cartier commutes with étale pullback and trace; this can be checked after a faithfully flat étale splitting, where it is the preceding formula on each factor. Hence the transpose is the actual Frobenius on the finite-cover functions, transported through their trace dual, and not an arbitrary semilinear matrix with the same ranks. The same assertion holds for associated modules and their morphisms by finite flat descent and the naturality of the pairing.
  Finally, coordinate changes, torsor automorphisms, and finite-level maps preserve finite duality and the normalized invariant-volume construction. Their character changes in source and target agree because the chosen Frobenius fixes $k$. This proves the equivariance assertions, including those for complete finite diagrams in Lemma 10. All formulas involve finite coefficient data and preserve the common-stage convention of Definition 8. ◻
]

The last assertion has a useful integral consequence. On an analytic affinoid chart contained in $x eq.not 0$, a finite free coefficient basis and the intrinsic norm on its finite étale cover differ by some finite factor $C$. Rooting the actual cover functions replaces this factor by $C^(1 \/ Q^a)$. It tends to $1$. The support comparison will use this consequence of the explicit transpose, along with positive lattices constructed in Lemma 16; it does not assign such a norm interpretation to an arbitrary semilinear endomorphism.

== 4 Coefficient scope, norm lines, and stable lattices <sec:coefficient-scope>

We keep the coefficient and frame conventions of Proposition 7. In particular, a cochain with values in a localized coefficient ring has a uniform pole bound on its compact source. A cochain in a union of frame levels or root extensions is represented at one finite level. All vector spaces in this section are over the finite field $k$.

=== 4.1 The simultaneous induction <the-simultaneous-induction>

We specify the auxiliary coefficients needed on boundary strata. This also records the precise scope of the compact finiteness assertion.

#prodef([Definition 4.1.])[
  An admissible compact coefficient on $A$ or $C_1$ is a finite free module with continuous $P_n$-action satisfying the following condition on every successive labeled height stratum. After restriction to its exact-height open, and after a finite joint frame change and a fixed finite Frobenius root change, the module has a finite $P_n$-stable filtration whose graded pieces admit $P_n$-equivariant identifications with finite direct sums of the coefficient ring, with $P_n$ acting only on that ring. We call these identifications constant frames; any commuting auxiliary frame actions are retained. The filtration splits as a filtration of underlying modules. The same condition is required after restriction to each dead-label boundary disc and power-identification with its starting-height disc. For a module on $A$ the condition is checked after pullback to the labeled strata.
  We also allow the constant frames to require a finite level of the translation splitting torsor. Equivalently, before that last ascent the graded pieces may be associated to finite representations of a finite translation quotient. The condition must still hold on every successive boundary stratum. All actions, filtrations, and splittings use bounded poles on each exact-height open.
] <def:compact:admissible>

The boundary requirement is recursive: at a pair $\( n \, t \)$ it also tests the restrictions to the labelled discs with starting heights $t + 1 \, dots.h \, n$. A power identification of such a disc transports its coefficient and group action together. A finite translation splitting can instead be kept as an ascent with its representation data, for use in associated-bundle descent.

Here are the coefficients to which we will apply the definition. The invariant line, the Lie bundles of the universal group and its Cartier dual, their tensor and character constructions, and finite torsion or Frobenius-divided torsion coordinate modules have constant frames after marking the connected group and the finite étale quotient and splitting the relevant finite lifting torsor. A fixed finite construction needs only finitely many marking coefficients. Its linear dual has the dual frame. Thus these constructions and their finite tensor operations satisfy the condition on each successive stratum.

Before translation splitting, the same coefficients can be treated through their finite translation representations. At connected height greater than one the distribution algebra is local, so those representations have filtrations by trivial lines. At multiplicative height the simple representations are characters; an associated character is a summand of the regular representation of its finite translation quotient. The coordinate module of a split group itself has constant frames.

Powers of conormal and canonical lines are also included. The volume construction trivializes the canonical line on an exact-height stratum, and adjunction along a label hyperplane introduces its conormal line. The higher-height identification in Corollary 6 transports these constructions to the corresponding boundary disc. The same verifications commute with finite tensor operations, linear duals, and power transport.

For each height $s$, let

$ nu_s : P_s arrow.r bb(F)_p^times subset k^times \, #h(2em) nu_s \( g \) = overline("Nrd" \( g \)) \, $

be the reduced norm followed by reduction modulo $p$. Write $k \( nu_s^j \)$ for the corresponding one-dimensional constant $P_s$-representation. These particular constant characters have a geometric realization on the entire deformation disc.

For rectangular frame levels write

$ B_(K \, V) = B_(K times V) \, #h(2em) B_(upright("conn") \, V) = "colim"_(K subset P_t) B_(K \, V) \, #h(2em) B_(upright("full")) = "colim"_(K \, V) B_(K \, V) \, $

where $K$ and $V$ run through compact open subgroups of $P_t$ and $"GL"_m \( bb(Z)_p \)$, respectively. These are algebraic unions with the cochain convention above.

#thm([Theorem 4.2.])[
  (Coefficient finiteness).  #emph[Suppose $1 lt.eq t < n < p - 1$. The following assertions hold.]
  + #emph[Every admissible compact coefficient on $A$ or $C_1$ has finite total continuous $P_n$-cohomology. This includes the stable finite free lattices constructed below.]
  + #emph[For every finite joint frame level $U$, the bounded-pole groups $H^(*) \( P_n \, B_U \)$ have finite total dimension. The assertion also holds with a fixed power of the invariant line. Finite direct sums and finite-dimensional trivial coefficient factors are allowed.]
  + #emph[For every fixed compact open $V subset "GL"_m \( bb(Z)_p \)$, $H^(*) \( P_n \, B_(upright("conn") \, V) \)$ has finite total dimension. There is an integer $h$, independent of the rectangular levels used in the union, such that $1 + p^h bb(Z)_p$ acting by scalar matrices acts identically on $H^(*) \( P_n \, B_(upright("full")) \)$. These conclusions persist after taking the algebraic union of Frobenius roots, with the actions transported by powering.]
    #emph[Moreover, put $B_(upright("full"))^(upright("perf")) = "colim"_r B_(upright("full"))^(1 \/ p^r)$, the algebraic root union with common finite stages on compact cochain sources. For every compact open $V subset "GL"_m \( bb(Z)_p \)$ and every $a \, i$, the finite-dimensional smooth $P_t$-representation 
$ Q_V^(a \, i) = H^a #h(-0.16667em) (V \, H^i \( P_n \, B_(upright("full"))^(upright("perf")) \)) $

 has a finite $P_t$-stable filtration whose successive quotients are powers of the reduced-norm character $nu_t$.]
  #emph[All assertions use common finite stages on profinite cochain sources.]
] <thm:coefficient-finiteness>

The theorem fixes the target of a distributed induction, completed in Sections 6–8. We label a case by its height pair $\( n \, t \)$ and order the cases by the lexicographic measure

#[#set math.equation(numbering: n => "(4.1)")
 $ \( n \, n - t \) . $ <eq:compact:induction-order>]

At each height pair, the three assertions are proved in the displayed order. Their induction dependencies and proof locations are as follows.

Proposition 35 uses compact finiteness on the dead-label discs at the higher starting-height pairs $\( n \, t + 1 \) \, \( n \, t + 2 \) \, dots.h$. The initial case $t = n$ is finite-coefficient cohomology on the zero-dimensional disc.

Proposition 36 uses the compact assertion at the current pair, the full-frame assertions at $\( n \, s \)$ for $s > t$, and compact coefficients at the smaller total-height pairs $\( s \, t \)$.

Propositions 46 and 50 use the first two assertions at the current pair and the support comparison. They include the specified perfected individual-row filtration. Thus the row filtration at $\( n \, s \)$ is available before the bounded-pole proof at $\( n \, t \)$ whenever $s > t$.

Every appeal to an earlier case decreases (4.1). In particular, the full-frame assertion at the current pair is never used in its compact or bounded-pole proof. The cited propositions complete the proof of Theorem 13.

=== 4.2 Norm-character coefficients <norm-character-coefficients>

We begin with the coefficients that occur in the smaller-disc step of this induction. The next lemma realizes the required constant norm characters on the universal deformation disc, including every boundary restriction used below.

#thm([Lemma 4.3.])[
  (The norm line on the deformation disc).  #emph[Let $cal(G)$ be the algebraic height-$s$, dimension-one Barsotti–Tate group obtained from the universal formal deformation, and let $cal(R)_s$ be its characteristic-$p$ complete local deformation ring. There is a functorial height-one, dimension-one Barsotti–Tate group 
$ cal(H)_det = and.big^s cal(G) . $

 Its marked deformation is canonically constant. The covariant action of $P_s$ on its special group, and hence on this constant marked deformation, is multiplication by the actual unit $"Nrd" \( g \) in bb(Z)_p^times$.]
  #emph[With the convention that actions on functions use inverse substitution, put 
$ cal(N)_s = "Hom"_(cal(R)_s) \( omega_(cal(H)_det) \, cal(R)_s \) . $

 Then there is a $P_s$-equivariant identification 
$ cal(N)_s tilde.eq cal(R)_s ⊗_k k \( nu_s \) . $

 Every integral tensor power of this line is admissible on every starting-height quotient of the deformation disc and on its labeled disc. The assertion is preserved by the finite root transports and the successive boundary restrictions used in Definition 12.]
] <lem:compact:norm-line>

The character in this identification need not be trivial on $P_s$. Admissibility instead asks for a frame after a finite equivariant base change: the frame can transform through the marking coordinates. The proof supplies this frame from the first truncated determinant group, without trivializing the original constant character.

#proof[
  The prime in this manuscript is odd. The exterior-power theorem for a height-$s$ $p$-divisible group of dimension at most one applies to the algebraic Barsotti–Tate group, including its finite truncated levels. Its exterior powers have heights $binom(s, r)$ and, on the dimension-one locus, dimensions $binom(s - 1, r - 1)$; the construction and its universal alternating map commute with base change. Apply this for $r = s$ to obtain $cal(H)_det$ of height and dimension one #cite(label("HedayatzadehExterior")) Theorem 3.25. The same functorial construction identifies its first truncated level with the top exterior construction on $cal(G) \[ p \]$ #cite(label("HedayatzadehExterior")) Lemmas 3.23–3.24 and Theorem 3.25. We use these truncated group schemes before any localization of their coefficient rings.
  Here is an explicit justification of the constancy assertion. Let $H_0$ be the special fibre of $cal(H)_det$, with the marking induced from the fixed Honda marking of $cal(G)$. The Cartier dual of a height-one, dimension-one group is an étale group of height one. The complete local ring $cal(R)_s$ is henselian #cite(label("StacksProject")) Lemma 10.153.9, Tag 04GM. For every $r$, its finite group $cal(H)_det^or \[ p^r \]$ is the unique finite étale lift over $cal(R)_s$ of $H_0^or \[ p^r \]$, with its specified special-fibre identification. The constant lift along $k arrow.r cal(R)_s$ is one such lift. The equivalence of finite étale categories under reduction #cite(label("StacksProject")) Lemma 10.153.7, Tag 04GK identifies the two lifts uniquely, including their group laws, transition maps, and homomorphisms. These identifications are compatible for all $r$. Dualizing gives the canonical marked identification
  $ cal(H)_det tilde.eq H_0 times_("Spec" k) "Spec" cal(R)_s . $
  One can equivalently obtain this uniqueness by height-one deformation theory: its Hodge filtration has a unique lift and its marked morphisms are rigid; see #cite(label("ZinkDisplays")) Theorem 48, Proposition 40, and Corollary 95. The finite étale argument also shows directly that all the chosen identifications are compatible with nilpotent thickenings. Their pullbacks give the required identifications on every quotient and finite-level base used below.
  We identify the action, rather than only its closed-point scalar. On the rational Honda Dieudonne realization the action of the endomorphism division algebra becomes its defining $s$-dimensional matrix action after passage to a splitting field. Functoriality of the exterior construction makes the action on the top exterior line its determinant. By the defining identity for the reduced norm this determinant is $"Nrd" \( g \)$, and the equality descends from the splitting field. The normalized Frobenius in the exterior construction changes the Frobenius of the line, not the determinant action of an automorphism on its underlying line. For $g in P_s$ the determinant is an integral unit, so on the height-one group $H_0$ it is the automorphism $\[ "Nrd" \( g \) \]$. Rigidity of the marked height-one lift then identifies the semilinear transport on $cal(H)_det$ with this same constant automorphism over the whole parameter ring. In particular this is not an identification inferred merely by reducing a varying invariant-line cocycle at the closed point.
  Under inverse substitution the action on an invariant differential of $H_0$ is multiplication by $overline("Nrd" \( g \))^(- 1)$. Its dual line therefore has character $nu_s$, proving the displayed equivariant identification of $cal(N)_s$.
  It remains to check the finite-stage admissibility condition. On any exact-height stratum, choose finite connected and étale markings sufficient for the first truncated group, and a finite translation splitting of its connected–étale extension. These are exactly the permitted ascents in Definition 12. They give an equivariant constant frame for $cal(G) \[ p \]$ on that stratum. Functoriality and base change for the truncated exterior construction then give an equivariant constant frame for $cal(H)_det \[ p \]$. In characteristic $p$, the invariant differential module of a $p$-divisible group is the invariant differential module of its first truncated level: the differential of multiplication by $p$ is zero. Thus this is already a finite-stage frame of $omega_(cal(H)_det)$, and hence of $cal(N)_s$. Only this finite coefficient datum is needed; no entire infinite marking is claimed to occur at one finite level.
  The construction commutes with restrictions to successive label boundaries and with their power identifications. Alternatively, pull back the determinant group from $cal(R)_s$ first and repeat the same finite first-level marking and splitting on that stratum. Both give the same line by base-change naturality. Frobenius transports preserve $nu_s$, whose values lie in $bb(F)_p^times$. Tensor powers and duals of a finite-stage frame remain finite-stage frames. This proves all the admissibility assertions. ◻
]

#thm([Corollary 4.4.])[
  (Coefficients with a norm-character filtration).  #emph[Let $E$ be an admissible compact coefficient for a pair $\( s \, t \)$, and let $Q$ be a finite-dimensional smooth $P_s$-representation with a finite $P_s$-stable filtration 
$ 0 = Q_0 subset Q_1 subset dots.h.c subset Q_l = Q \, #h(2em) Q_j \/ Q_(j - 1) tilde.eq k \( nu_s^(e_j) \) . $

 Then $E ⊗_k Q$ and $E ⊗_k Q^or$ are admissible. At every induction stage where compact finiteness at $\( s \, t \)$ is available, their total $P_s$-cohomology is finite-dimensional.]
] <cor:compact:norm-filtration>

#proof[
  Each quotient of the filtration $E ⊗_k Q_j$ is $E ⊗_k k \( nu_s^(e_j) \)$. By Lemma 14, tensoring with this constant character is tensoring with a power of the admissible universal determinant line. On every required stratum take one common finite frame and splitting level for the filtration of $E$ and the finitely many determinant-line powers. Refining the tensor filtration then gives equivariantly trivial graded frames. The original filtration is split as a module filtration, since it is obtained by tensoring finite-dimensional $k$-vector spaces; the refined filtration has the module splittings required in the definition. The same construction applies on every successive boundary and after root transport. Thus $E ⊗_k Q$ is admissible. Dualizing the finite filtration reverses its order and replaces $e_j$ by $- e_j$, so it also proves the assertion for $Q^or$. Proposition 35 gives the cohomological conclusion. All acting groups in this argument are the full $P_s$. ◻
]

=== 4.3 Stable lattices and continuous duality <stable-lattices-and-continuous-duality>

#thm([Lemma 4.5.])[
  (Lattices compatible with transfer).  #emph[At a sufficiently deep finite joint frame level, the finite free coefficient $B_U$ and the associated coefficients of any fixed finite translation diagram admit $P_n$-stable free $C_1$-lattices. Their fixed pole strips have finite filtrations by boundary restrictions of admissible coefficients. For the stationary functions coefficient one can choose such a lattice $L$ and an integer $b$ so that 
$ P = x^(- b) L $

 is preserved by $S$, and every $x^(- c) L$ is carried into $P$ by a sufficiently high iterate of $S$. In the invariant-volume frames the transpose on the dual lattice of top forms has Frobenius matrix entries in $x C_1$. Its finite basis, viewed as finite-cover functions by these frames, can be taken integral over $C_1$.]
] <lem:compact:stable-lattices>

#proof[
  Begin after the first étale basis level and after the finite marking level defining the volume and its character. The tame connected marking adjoins a $\( p^t - 1 \)$st root of the leading height coefficient, with the line-frame convention understood. Its coefficient module on localization is a sum of powers of the invariant line. Subsequent normal finite levels can be taken to have $p$-group deck groups; their regular representations over $k$ have finite filtrations by trivial representations. Associated-bundle descent gives filtrations of the localized coefficient modules, split as module filtrations. The same construction applies to a finite translation diagram after one frame level on which its extra finite actions are defined. In the multiplicative case one first uses its character decomposition.
  Choose lifts of bases of the graded lines. The action matrices in these bases are triangular. Their off-diagonal entries have one common pole bound because the acting group is compact and the actions are bounded-pole continuous. Rescale successive lifted bases by powers of $x$, starting at one end of the filtration. At each step the finitely many off-diagonal denominators are absorbed by the earlier rescalings. The resulting split free lattice is stable. Its successive quotients are line lattices, and the same is true for its pole strips. Factoring $x$ into label coordinates as in Corollary 6 gives the asserted boundary filtrations.
  Choose a divisible stationary step whose Frobenius power fixes $k$, and denote its coefficient Frobenius exponent by $Q > 1$. Finite freeness of Frobenius and a finite root basis give a constant $c_0$ with
  $ S \( x^(- c) L \) subset x^(- ceil.l c \/ Q ceil.r - c_0) L . $
  This is obtained by applying $S$ to the finitely many root-basis vectors and clearing their denominators; inverse semilinearity then divides the remaining pole order by $Q$. If $b$ is larger than the fixed point of this affine bound, $S \( P \) subset P$, and iterating the bound sends every fixed larger lattice into $P$.
  In dual invariant-volume frames, Lemma 11 identifies the transpose with positive Frobenius. Replacing the dual lattice by $x^b$ times it increases its Frobenius matrix valuations by $\( Q - 1 \) b$, up to the fixed denominators of its original matrix. A further increase of $b$ therefore makes every entry divisible by $x$. Finally a finite basis of the finite étale algebra over $C_1 \[ 1 \/ x \]$ becomes integral over $C_1$ after multiplying by a large power of $x$: clear the denominators in a monic equation for each basis element. Increase $b$ to achieve this simultaneously in the volume/trace frames. The preceding stability and positivity inequalities continue to hold. ◻
]

#thm([Lemma 4.6.])[
  (Compact and residue duality).  #emph[Let $L$ be a stable finite free lattice over a formal $r$-disc $C$, and let $frak(m)_C$ be its closed-point ideal. Put $L^(*) = "Hom"_C \( L \, C \)$ and $omega_C = and.big^r hat(Omega)_(C \/ k)^1$, using continuous differentials. There are natural identifications 
$ L^or & tilde.eq H_(frak(m)_C)^r \( L^(*) ⊗_C omega_C \) \,\
H^i \( P_n \, L \)^or & tilde.eq H^(n^2 - i) #scale(x: 120%, y: 120%)[\(] P_n \, L^or #scale(x: 120%, y: 120%)[\)] . $

 Here $\( - \)^or = "Hom"_(k \, upright("cts")) \( - \, k \)$ is the discrete continuous dual. The identifications are compatible with finite coefficient diagrams and with the transpose of the constant-cochain cup action. In particular $H^i \( P_n \, L \)$ is profinite and vanishes outside $0 lt.eq i lt.eq n^2$.]
] <lem:compact:duality>

#proof[
  The units in the height-$n$ division algebra have analytic dimension $n^2$. They have no $p$-torsion in the present range: an element of order $p$ would embed the degree-$p - 1$ extension $bb(Q)_p \( zeta_p \)$ in a division algebra of degree $n$, which is impossible for $n < p - 1$. The compact analytic group results recalled in #cite(label("Venjakob")) Sections 1.1–1.2 give a resolution of the trivial compact $bb(Z)_p \[ \[ P_n \] \]$-module by finitely generated projectives, of length $n^2$. Reducing it modulo $p$ and extending scalars to $k$ gives the corresponding $k \[ \[ P_n \] \]$-resolution: the underlying $bb(Z)_p$-modules are flat, so this base change is exact. The residue-field completed group ring is also Noetherian of finite global dimension #cite(label("ArdakovWadsley")) Proposition 3.3. The dualizing row and its adjoint action are described in #cite(label("BGHS")) Propositions 4.16 and 4.40, and Remark 4.23. Its orientation character is trivial here. Indeed, after a splitting field the adjoint representation is conjugation on a full matrix algebra, whose determinant is one. This is the orientable form of analytic Poincaré duality; see #cite(label("Lazard")) #cite(label("SerreGalois")).
  The finite resolution computes continuous cohomology for compact coefficients, by reduction to finite discrete quotients and inverse limit. The coefficient maps in those inverse systems are surjective on resolution terms. It agrees with the continuous bar model, and also with that model on lattice unions using the specified pole bounds. For a compact lattice all differentials have closed image, so cohomology is compact and dualization is exact. Duality for the finite projective resolution gives the second identification and the cup-action compatibility.
  For the first identification use formal coordinates $w_1 \, dots.h \, w_r$. The residue pairing sends a negative principal monomial times $d w_1 and dots.h.c and d w_r$ and a power series to the coefficient of $w_1^(- 1) dots.h.c w_r^(- 1)$. Every continuous functional on $C$ depends on a finite-dimensional power-series quotient, so it is a finite sum of such monomial functionals. Applying this pairing to a free basis proves the assertion for $L$. The residue transformation law makes the pairing independent of coordinates and accounts for the canonical line. It therefore respects all the stated actions. ◻
]

== 5 The frame quotient and compact supports <sec:support>

This section converts the actual Frobenius transpose of Lemma 11 into a calculation of compact supports on a space of independent bundle extensions. The calculation proves finiteness of the stable transfer image in Corollary 30, which Section 6 promotes to finiteness for compact coefficients.

Throughout this section, $1 lt.eq t < n < p - 1$ and $m = n - t$. We use the rings, extendable frame levels, and transfer of Section 3. In particular, $x = x_t$, the first labelled ring is $C_1$, and the joint frame group is

$ U_0 = P_t times "GL"_m \( bb(Z)_p \) . $

Let $C$ be a complete algebraically closed extension of the unramified ground field, let $E = C^flat$, and choose compatible roots of $p$ in $C$. Their tilt is denoted by $pi.alt$, so $pi.alt^sharp = p$. Set

$ R = \( cal(O)_E \/ pi.alt \)^a \, #h(2em) cal(A) = \( cal(O)^(flat \, +) \/ pi.alt \)^a . $

The superscript $a$ means almostification with respect to the maximal ideal of $cal(O)_E$. On a diamond over the chosen untilt, $cal(A)$ identifies with $\( cal(O)^(+) \/ p \)^a$; this identification is compatible with pullback. We retain Tate twists in intermediate formulas. A choice of compatible roots of unity over $C$ identifies $R \( 1 \)$ with $R$ whenever only the frame-group actions are under consideration.

=== 5.1 From Tate coordinates to extensions of bundles <from-tate-coordinates-to-extensions-of-bundles>

Write $V_a = cal(O) \( 1 \/ a \)$ for the stable bundle of rank $a$ and degree one on the Fargues–Fontaine curve. These conventions agree with the unramified-pushforward definition of the standard bundles #cite(label("FarguesFontaine")) Definition 8.2.2 and Theorem 8.2.10. Define the relative extension sheaf

$ N_t = cal(E) x t^1 \( V_t \, cal(O) \) \, #h(2em) Z = \( N_t^m \)_(upright("ind")) . $

Here $cal(E) x t^1$ is sheafified on perfectoid test spaces. A tuple $\( e_1 \, dots.h \, e_m \)$ belongs to $Z$ if the map

$ bb(Q)_p^m arrow.r N_t \, #h(2em) \( a_1 \, dots.h \, a_m \) mapsto sum_i a_i e_i $

is injective at every geometric point. The action of $"GL"_m \( bb(Z)_p \)$ on the tuple is the standard action; its action on functions is inverse substitution. This action must be distinguished from the dual-standard action on the translation parameters of the lifting torsor.

===== 5.1.1 The analytic joint frame space. <the-analytic-joint-frame-space.>

Let $cal(X)$ be the analytic realization over $E$ of the joint frame tower ${ B_U }$ in Proposition 7, together with the lift tower (3.7), on the exact-height locus $x eq.not 0$ of the open $A$-disc. We take the completed perfection of this finite-level system. Forgetting the connected marking gives a space $Y$, the perfected étale-basis and lift tower on that locus, and $cal(X) arrow.r Y$ is a $P_t$-torsor. At each finite frame level, $cal(X) \/ U$ is the corresponding perfected analytic realization of $B_U$. The algebraic union $cal(B) = "colim"_U B_U$ is still uncompleted, with the common finite-stage and bounded-pole cochain convention.

The next lemma supplies coordinates for $Y$ by first retaining the boundary. We then use those coordinates to identify the connected marking with a frame of a quotient bundle.

#thm([Lemma 5.1.])[
  #emph[After scalar extension to $E$, the completed perfection of the full etale-basis tower, including its boundary, is the product of $m$ open Honda balls. The exact-height locus is the open locus on which the corresponding $m$ rational Tate sections are independent. The identification is compatible with $P_n$, changes of integral Tate basis, and passage between finite frame levels.]
] <support:tate-ball>

#proof[
  Let $z_(i \, l)$ be compatible lifted division coordinates, with $\[ p \] z_(i \, l + 1) = z_(i \, l)$. Proposition 4 identifies the finite lift algebras, including their infinitesimal fibers, with the indicated root algebras. Consequently, on perfectoid test rings the lifts are unique after perfection. The coordinates in the inverse limit are
  $ X_(i \, l) = z_(i \, l)^(p^(n l)) \, #h(2em) X_i = lim_(l arrow.r oo) X_(i \, l) . $
  We check both convergence and the topology, since merely adjoining roots to the generic ring would not determine the domain.
  Put $I = \( x_t \, dots.h \, x_(n - 1) \)$ and $lambda = max_(t lt.eq a < n) \| x_a \| < 1$. The full Honda congruence and the factorization through $T^(p^t)$ in Section 3 give
  $ \[ p \] \( T \) - T^(p^n) in I T^(p^t) A \[ \[ T \] \] \, #h(2em) \| \[ p \] z - z^(p^n) \| lt.eq lambda \| z \|^(p^t) quad \( \| z \| < 1 \) . $
  For $0 < rho < 1$, define the closed level-$l$ domain and its unnormalized radius by
  $ B_l \( rho \) = {max_i \| z_(i \, l) \|^(p^(n l)) lt.eq rho} \, #h(2em) R_l = rho^(p^(- n l)) \, #h(2em) l gt.eq 1 . $
  For compatible division points, the characteristic-$p$ power identity and the preceding error estimate imply
  $ \| X_(i \, l + 1) - X_(i \, l) \| lt.eq lambda^(p^(n l)) \| z_(i \, l + 1) \|^(p^(n l + t)) lt.eq lambda^(p^(n l)) . $
  The proof of Proposition 4 gives $x_a in \( w_(1 \, 1) \, dots.h \, w_(m \, 1) \)$ in $C_1$, with $w_(i \, 1) = z_(i \, 1)^(p^t)$. Thus the level-one coordinate ideal, followed by the increment estimate down from a point of $B_l \( rho \)$, gives
  $ lambda lt.eq max_i \| z_(i \, 1) \|^(p^t) lt.eq max { rho^(p^(t - n)) \, lambda^(p^t) } . $
  Indeed the increment estimate gives $max_i \| X_(i \, 1) \| lt.eq max { rho \, lambda^(p^n) }$, which is the second inequality after taking the $p^(t - n)$ power. Since $lambda < 1$ and $p^t > 1$, it follows that $lambda lt.eq rho^(p^(t - n))$ uniformly on $B_l \( rho \)$.
  These domains are preserved by the transition maps, which are also surjective on them. For $l gt.eq 1$ one has
  $ p^(- n l) \( 1 - p^(t - n) \) < p^(t - n) \, #h(2em) lambda lt.eq rho^(p^(t - n)) < rho^(p^(- n l) \( 1 - p^(t - n) \)) = R_(l + 1)^(p^n - p^t) . $
  The error estimate therefore sends $B_(l + 1) \( rho \)$ into $B_l \( rho \)$. Conversely, finite lying-over for the frame transition supplies a lifted valued point above any point of $B_l \( rho \)$. If one of its coordinates $z$ had $\| z \| > R_(l + 1)$, the strict inequality $lambda \| z \|^(p^t) < \| z \|^(p^n)$ would make the Honda term dominate, so
  $ \| \[ p \] z \| = \| z \|^(p^n) > R_l \, $
  contrary to the chosen point of $B_l \( rho \)$. Thus the lift belongs to $B_(l + 1) \( rho \)$.
  On these compatible domains the increment estimate is bounded by $rho^(p^(n l + t - n))$, which tends to zero. It proves uniform convergence of the sequence defining $X_i$, with
  $ \| X_i - X_(i \, l) \| lt.eq delta_l := rho^(p^(n l + t - n)) \, #h(2em) \| X_i^(1 \/ p^(n l)) - z_(i \, l) \| lt.eq lambda . $
  We verify the resulting map of completed coordinate rings on a dense subalgebra. Fix a nonzero polynomial $f$ over $E$ in $X_1^(1 \/ p^a) \, dots.h \, X_m^(1 \/ p^a)$, with one fixed denominator $p^a$. For $n l gt.eq a$, its level-$l$ approximation is the polynomial
  $ f \( z_(1 \, l)^(p^(n l - a)) \, dots.h \, z_(m \, l)^(p^(n l - a)) \) . $
  By Proposition 4, $B_l \( rho \)$ is the closed $z$-polydisc of radius $R_l$. The displayed polynomial has exactly the Gauss norm of $f$ at radius $rho^(1 \/ p^a)$; projection from the inverse limit onto $B_l \( rho \)$ is surjective, so its supremum norm there is unchanged. The coordinate errors are at most $delta_l^(1 \/ p^a)$, which tends to zero. Finite polynomial substitution therefore converges uniformly to $f \( X_1^(1 \/ p^a) \, dots.h \, X_m^(1 \/ p^a) \)$. Once the error is smaller than the nonzero Gauss norm of $f$, the ultrametric inequality makes the two norms equal. This proves that the map from the fractional polynomial algebra is isometric and hence injective on its completion.
  To prove density in the other direction, (3.3) expresses each coordinate from level $l_0$ as an integral series in the $p^(t \( l - l_0 \))$-powers of the level-$l$ coordinates. Substitution of $X_i^(1 \/ p^(n l))$ changes this series by at most $lambda^(p^(t \( l - l_0 \)))$, which tends uniformly to zero. Thus the $X_i$ and their roots topologically generate the inverse limit, proving the asserted identification of perfectoid spaces. Applying the estimates to the addition law and to the finite-level change-of-frame formulas proves equivariance.
  A rational relation can be multiplied by a power of $p$ and then made primitive over $bb(Z)_p$. Its reduction at a sufficiently large division level is a relation among the labelled basis sections. The full-set polynomial of Proposition 4 says precisely that such a relation occurs when the etale rank drops below $m$. Conversely a drop of that rank supplies a relation. This proves the last assertion, including at the boundary. ◻
]

We shall use the following curve facts with their relative meanings. Standard positive bundles have the Honda universal covers as their section sheaves #cite(label("ScholzeWeinstein")) Corollary 5.1.2 and Proposition 5.1.6; equivalently one may use #cite(label("ScholzeWeinsteinBerkeley")) Theorems 15.2.3 and 15.2.5. Families with constant slope polygon become standard pro-etale locally, and slope-zero bundles correspond to $bb(Q)_p$-local systems #cite(label("FarguesScholze")) Theorem II.2.19 and Corollary II.2.20. The sheafified first cohomology of $cal(O)$ vanishes #cite(label("FarguesScholze")) Proposition II.2.5(ii). The functor of section sheaves on positive bundles is fully faithful over a varying perfectoid base: this follows from the fully faithful $R tau_(*)$ on perfect complexes and the positive-slope identification with Banach–Colmez sheaves #cite(label("AnschuetzLeBrasFourier")) Corollary 3.11. All maps to which we apply this assertion are $bb(Q)_p$-linear.

#thm([Theorem 5.2.])[
  #emph[Let $cal(X)$ be the full perfected joint frame space over $E$. There is a $P_n times U_0$-equivariant description of $cal(X)$ as the space of exact sequences 
#[#set math.equation(numbering: n => "(5.1)")
 $ 0 arrow.r cal(O)^m arrow.r V_n arrow.r V_t arrow.r 0 $ <support:framed-extension>]

 whose determinant comparison is a $bb(Z)_p^times$-multiple of a fixed comparison. Forgetting the middle frame gives a $P_n$-torsor $cal(X) arrow.r Z$. Thus, for every compact open $U subset U_0$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ \[ cal(X) \/ U thin \/ P_n \] tilde.eq \[ Z \/ U \] . $ <support:quotient-stacks>]

 On the quotient there is the universal sequence 
$ 0 arrow.r L_m ⊗ cal(O) arrow.r V'_n arrow.r V'_t arrow.r 0 \, $

 where $L_m$ has its integral etale lattice and the two positive bundles have compact frame reductions. Finally, 
#[#set math.equation(numbering: n => "(5.3)")
 $ N_t tilde.eq bb(A)_C^(1 \, diamond.stroked.small) \/ F \, $ <support:additive-presentation>]

 where $F \/ bb(Q)_p$ is unramified of degree $t$, acting by translations.]
] <thm:geometric-quotient>

#proof[
  The universal-cover comparison sends the independent Tate sections of Lemma 18 to a map $cal(O)^m arrow.r V_n$. Let its saturated image on a geometric fiber have rank $r lt.eq m$. It is generically generated by sections, so has no negative quotient and has degree at least zero. Stability of $V_n$ bounds its degree by $r \/ n < 1$. The degree is therefore zero, and all its slopes are zero. It is a trivial bundle of rank $r$, whose rational section space has dimension $r$. Independence forces $r = m$. The spanning determinant section has degree zero and no zeros. Thus the map is a subbundle inclusion on every fiber, and hence relatively. Every slope of its quotient is positive: a nonpositive quotient would give a nonpositive quotient of $V_n$. The quotient has rank $t$ and degree one. By the classification of bundles it is of type $V_t$, since two distinct positive summands would already have total degree at least two.
  Conversely, the middle term of an extension of $V_t$ by $cal(O)^m$ has no negative slope: a negative quotient receives no map from either end term. A nonbasic middle term must consequently contain a slope-zero quotient, since its total degree is one. Such a quotient is locally a trivial rational line, and it is equivalent to a rational linear relation among the extension classes. Thus the basic locus is exactly $Z$. These assertions are relative assertions after pro-etale standardization and descend because the saturated slope filtration is unique.
  It remains to check that the connected marking gives the indicated quotient frame, including its integral reduction. Write $beta = alpha^(- 1) : cal(G)_B^0 arrow.r Gamma_t$ and put $q = p^t$. On an affinoid perfectoid test over a bounded characteristic-$p$ chart, write $\[ p \]_(cal(G)) \( T \) = a_q T^q + dots.h.c$ and $beta \( T \) = sum_(j gt.eq 1) b_j T^j$. The coefficients of $\[ p \]_(cal(G))$ are power bounded, with $a_q$ equal to $x$ times the fixed integral unit. Comparing degree $q j$ in $beta \( \[ p \]_(cal(G)) \( T \) \) = beta \( T \)^q$ gives a monic equation
  $ b_j^q - a_q^j b_j = P_j \( b_1 \, dots.h \, b_(j - 1) \) \, $
  where $P_j$ has power-bounded coefficients. Induction gives $\| b_j \| lt.eq 1$ for every $j$; in particular $b_1^(q - 1) = a_q$. Thus on each closed subball $\| z \| lt.eq rho < 1$ the series converges uniformly, with tail after degree $N$ bounded by $rho^(N + 1)$. It defines a functorial continuous map on all topologically nilpotent coordinates. Applying it componentwise to compatible inverse-$\[ p \]$ sequences gives a continuous map of universal-cover $v$-sheaves; each coordinate uses a strict radius bound, and compact parameter families use finite such covers. The formal scalar identities give $bb(Z)_p$-linearity, and the shift on the inverse limit gives $bb(Q)_p$-linearity.
  For a Tate coordinate $z_l$ of order $p^l$, its image satisfies $beta \( z_l \)^(p^(t l)) = 0$. Characteristic-$p$ perfectoid tests are reduced, so this image is zero. The map therefore kills the rational span of the Tate sections. This torsion vanishing is only asserted on these reduced analytic tests, not on arbitrary nilpotent Artin algebras. Let $cal(Q) = V_n \/ cal(O)^m$ be the positive quotient bundle above, and write $tau_(*)$ for the relative section-sheaf functor. The relative universal-cover comparison and the sheafified vanishing $R^1 tau_(*) cal(O) = 0$ give an exact sequence of topological $bb(Q)_p$-module $v$-sheaves
  $ 0 arrow.r underline(bb(Q)_p)^(thin m) arrow.r tau_(*) V_n arrow.r tau_(*) cal(Q) arrow.r 0 . $
  Hence the map just constructed factors uniquely through $tau_(*) cal(Q) arrow.r tau_(*) V_t$. These positive section objects are concentrated in degree zero, so relative full faithfulness produces an actual bundle map $overline(beta) : cal(Q) arrow.r V_t$. On each geometric fiber, $b_1 eq.not 0$ and a sufficiently small nonzero formal point has nonzero image; division-point projection is surjective. The bundle map is therefore nonzero on every fiber. A nonzero map between the stable bundles of this type is an isomorphism, so the relative map is an isomorphism.
  We now show that this construction recovers every quotient frame in the required determinant component. Over the independent Tate-section space $Y$, the connected markings form the $P_t$-torsor $cal(X) arrow.r Y$. The quotient bundles form the family $cal(Q) = V_n \/ cal(O)^m$ constructed above. Their frames form the $D_t^times$-torsor
  $ cal(F) = underline("Isom")_Y \( cal(Q) \, V_t \) . $
  The map $alpha mapsto overline(beta)$ just constructed is $P_t$-equivariant from $cal(X)$ to $cal(F)$.
  The ordered trivial subbundle identifies $det cal(Q)$ with $det V_n$. Fix a comparison $kappa : det V_n tilde.eq det V_t$. For $f in cal(F)$, put
  $ delta \( f \) = v_p #scale(x: 120%, y: 120%)[\(] det \( f \) \/ kappa #scale(x: 120%, y: 120%)[\)] in bb(Z) . $
  Each fiber of this locally constant determinant map is a $P_t$-torsor, because the kernel of $v_p "Nrd" : D_t^times arrow.r bb(Z)$ is $P_t$. In particular $delta \( overline(beta) \)$ is unchanged by changing the connected integral marking. It descends to a locally constant integer on $Y$; an integral change of Tate basis also leaves it unchanged.
  The space $Y$ is geometrically connected. In the Honda-ball coordinates of Lemma 18, for each nonzero rational row $v$ choose a nonzero integral multiple and let $f_v$ be the coordinate function of the corresponding Honda-linear combination. Its zero locus detects that rational relation. At a point of $Y$, every $f_v$ is nonzero. Pass to the completed residue field of the point and take centered Gauss seminorms of increasing radius less than one. The Gauss expansion of each $f_v$ retains its nonzero constant term, so its norm stays nonzero along the entire radius path. This works separately for every $v$ and requires no common lower bound for their norms. Once the radius contains the point’s coordinates, the centered Gauss polydisc is the origin Gauss polydisc. Increasing its radius joins these origin polydiscs. Thus these paths remain in $Y$ and prove connectedness on Berkovich points; rank-one maximalizations give the same conclusion for locally constant functions on the adic space.
  Consequently $delta \( overline(beta) \)$ has one value. Rescale $kappa$ to make that value zero. The map $cal(X) arrow.r cal(F)_0$ is now an equivariant map between $P_t$-torsors over $Y$, hence an isomorphism. This also gives the inverse construction: a determinant-matched framed extension gives its independent Tate sections in $Y$ and its quotient frame in $cal(F)_0$, which uniquely recover the connected marking.
  Now the possible middle frames form a torsor under $D_n^times$. Their determinant valuations are the reduced-norm valuations, so the determinant-matched frames form exactly the subgroup $cal(O)_(D_n)^times = P_n$. This proves the torsor assertion and the quotient equivalence. This normalization also agrees with the determinant condition in the two-tower description #cite(label("BMR")) Theorem 2.0.1: our finite connected and etale frames, followed by the root lifting tower, are exactly the generic trivialization there. Indeed the finite lift algebras are the root algebras of Proposition 4, and on perfectoid tests their connected lifting torsors have unique sections.
  For the last assertion use the curve with coefficient field $F$. The untilt divisor gives
  $ 0 arrow.r cal(O)_F \( - 1 \) arrow.r cal(O)_F arrow.r i_(*) cal(O)_C arrow.r 0 . $
  The section sheaf of $cal(O)_F$ is $F$, its first cohomology sheaf vanishes, and $cal(O)_F \( - 1 \)$ has no sections. Finite pushforward to the $bb(Q)_p$-curve identifies $cal(O)_F \( - 1 \)$ with $V_t^or$ by rank, degree, and the cyclic unramified Frobenius description. The cohomology sequence is therefore $0 arrow.r F arrow.r bb(A)_C^(1 \, diamond.stroked.small) arrow.r N_t arrow.r 0$, proving (5.3) as a sequence of sheaves on arbitrary perfectoid tests. ◻
]

=== 5.2 The integral support convention <the-integral-support-convention>

All supports below are computed on bounded closed subdomains lying overconvergently inside an open chart. Equivalently, one takes the filtered colimit of the fibers of restriction to the complements of such subdomains. Inner and outer radii always have a strict gap. This convention agrees with compactly supported pushforward for the partially proper spaces used here. On quotient presentations we first choose such supports upstairs and then descend their complexes.

We record the localization facts needed to use this convention with $cal(A)$. The integral structure sheaf modulo $p$ is an etale coefficient. For a quasi-pro-etale map $f : X arrow.r Y$, its pullback is $f^(*) \( cal(O)_Y^(+) \/ p \) tilde.eq cal(O)_X^(+) \/ p$ #cite(label("PignonYwanne")) Proposition 2.1.2 and the proof of Lemma 2.1.3. For a cofiltered spatial system with coefficient pulled back from one stage, its cohomology commutes with the inverse limit of spaces #cite(label("ScholzeDiamonds")) Proposition 14.9. Quasicompact injections are quasi-pro-etale #cite(label("ScholzeDiamonds")) Corollary 10.6. Consequently shrinking rational tubes to a generalizing closed locus computes restriction to that locus. The open–closed localization triangle for this coefficient, also in its solid almost form, is

#[#set math.equation(numbering: n => "(5.4)")
 $ j_(!) j^(*) K arrow.r K arrow.r i_(*) i^(*) K $ <support:localization>]

for the specializing open complements occurring here #cite(label("PignonYwanne")) Corollary 3.2.4 and Proposition 4.3.1. In particular this use of localization does not assert coherent purity across an arbitrary characteristic-$p$ boundary.

The compact group calculations will use the following finite resolution model. It applies both to the support complexes here and to the geometric constant-cochain comparison later.

#thm([Lemma 5.3.])[
  (Finite projective calculation of solid rows).  #emph[Let $K$ be a compact $p$-adic analytic group without $p$-torsion, and put $R_K = bb(F)_p \[ \[ K \] \]$. Let $cal(V)$ be a solid $bb(F)_p$-module with continuous condensed $K$-action. Choose a bounded resolution $Q_bullet arrow.r bb(F)_p$ by finitely generated projective profinite $R_K$-modules. Then continuous solid $K$-cohomology is computed by 
#[#set math.equation(numbering: n => "(5.5)")
 $ underline("Hom")_(underline(R_K)) \( underline(Q_bullet) \, cal(V) \) . $ <eq:const-solid-resolution>]

 Evaluation of this complex at the one-point profinite set is exact and each of its terms is a retract of a finite direct sum of $cal(V) \( * \)$. In particular, if a commuting endomorphism $u$ acts as a scalar $c$ on $cal(V) \( * \)$, it acts as $c$ on the point-valued cohomology of (5.5).]
  #emph[For a derived solid coefficient $cal(A)$, this gives a natural spectral sequence 
#[#set math.equation(numbering: n => "(5.6)")
 $ H_(upright("solid"))^r \( K \; H^s \( cal(A) \) \) \( * \) med arrow.r.double med H^(r + s) \( R Gamma_(upright("solid")) \( K \; cal(A) \) \) \( * \) . $ <eq:const-solid-ss>]

 The preceding scalar assertion applies to every row.]
] <lem:solid-rows>

#proof[
  The existence of the chosen bounded resolution follows from Noetherianity and finite global dimension of $bb(F)_p \[ \[ K \] \]$ when $K$ has no element of order $p$ #cite(label("ArdakovWadsley")) Proposition 3.3; finite generation of its terms follows by successively resolving kernels. The condensation functor from profinite $R_K$-modules is exact and preserves projectives by #cite(label("Tang")) Theorems 3.2 and 3.14(i). Moreover, solid $bb(F)_p$-modules with commuting condensed $K$-action are precisely solid $underline(bb(F)_p \[ \[ K \] \])$-modules by #cite(label("Tang")) Proposition 3.21. In this assertion the solidification of the condensed group ring is the completed group ring, including its multiplication. Thus condensation of $Q_bullet$ is a projective resolution in the required coefficient category, proving (5.5).
  Write $Q_i$ as a summand of $R_K^(N_i)$. Internal Hom from this finite free module is $cal(V)^(N_i)$, and the idempotent defining $Q_i$ cuts out the corresponding summand. Evaluation at $*$ preserves finite sums and these idempotents, and is exact: the point is an extremally disconnected projective object of the condensed site. A scalar on $cal(V) \( * \)$ therefore stays that scalar on every term and on its cohomology. No assertion that point evaluation is conservative on solid modules is involved. Filtering $cal(A)$ by its cohomology objects gives (5.6); the finite length of $Q_bullet$ controls its group-cohomological direction. ◻
]

Here is the comparison with geometric descent. For a locally spatial diamond $Y'$ and an extremally disconnected profinite set $T'$, form the finite-coefficient geometric cochains on $Y' times T'$. An affinoid-perfectoid hypercover and the Artin–Schreier complex compute these cochains. On a characteristic-$p$ perfectoid affinoid the analytic ring with its topology is a complete linearly topologized $bb(F)_p$-module, hence an inverse limit of discrete $bb(F)_p$-modules. On its product with $T'$ the ring is the corresponding continuous-function module. These are solid. Kernels, extensions, and derived limits retain solidity, so the Artin–Schreier complexes and their hypercover totalizations are derived solid. The derived closure assertion for profinite coefficient rings is also recorded in #cite(label("Tang")) Theorem 4.4(ii). Evaluation at $*$ gives the usual finite-coefficient geometric étale cochains. The nerve of a compact group action is the same parameter construction.

To compare that nerve with (5.5), solidify the free bar resolution. For a profinite set $T'$, the derived solidification of the free condensed $bb(F)_p$-module on $T'$ is $bb(F)_p \[ \[ T' \] \]$ in degree zero: resolve $T'$ by extremally disconnected profinite sets and dualize the resulting augmented complex to locally constant $bb(F)_p$-functions, which are acyclic on a profinite space. The solidified bar terms are therefore the usual free profinite completed-group-ring modules. The augmented bar is still exact, with its usual continuous contraction after forgetting the group action. It is a projective resolution by Tang’s projective-preservation theorem, and comparison with $Q_bullet$ gives the asserted equality of descent constructions. This argument uses analytic rings to construct the coefficient category; it does not replace a topological geometric coefficient by a discrete tensor product.

#thm([Lemma 5.4.])[
  #emph[These localization and support computations are compatible with compact profinite parameters and compact frame torsors. They apply to the rational-rank loci in $N_t^m$ and to their flag incidences. On an exact-rank locus the smallest rational plane depends continuously on the point.]
] <support:parameters>

#proof[
  #emph[Integral continuity and compact parameters.] On an affinoid perfectoid, integral sections modulo $pi.alt$ compute $cal(A)$ up to almost isomorphism. This is affinoid almost acyclicity and its v-descent form #cite(label("ScholzeDiamonds")) Proposition 8.8. Completing a union of affinoid perfectoid rings does not change its reduced integral sections almost: for every $epsilon.alt > 0$, quasicompactness makes a bound on the limit an eventual bound with norm loss at most $\| pi.alt \|^(- epsilon.alt)$. The same estimate applies to the $pi.alt$-multiples. Finite Cech diagrams preserve these estimates. Alternatively one may pull a tube system to a strictly totally disconnected cover; its terms and nerve are then computed by rational subsets and their buffered limits. This verifies that the coefficient is pulled back in the continuity assertion just stated.
  For a compact profinite parameter, reduction modulo a fixed positive-valuation cutoff makes continuous sections locally constant. Uniform approximation on finitely many clopen pieces therefore reduces the calculation to the one without parameters. The same argument applies on the nerve of a compact profinite torsor. Such a torsor is proper, and inverse images of compact bounds and their compact-group translates admit common compact bounds.
  #emph[Compact groups and the support colimit.] We justify passage through the support colimit in the stable almost localization of derived solid $A_0$-modules, where $A_0 = cal(O)_E \/ pi.alt$ and $A_0^a = R$. For a buffered support $K$, let $cal(C)_K$ be its supported parameter object. The cutoff continuous-function modules above are solid $bb(F)_p$-modules; their derived Cech limits and supported fibers give $cal(C)_K$ in this category. The compact-support object is $"colim"_K cal(C)_K$ there. Every compact frame group $G$ used here is $p$-adic analytic without $p$-torsion, since $p > n + 1$. Choose a bounded resolution of $bb(F)_p$ by finitely generated projective profinite $bb(F)_p \[ \[ G \] \]$-modules #cite(label("ArdakovWadsley")) Proposition 3.3. The continuous solid bar calculation agrees with this resolution #cite(label("Tang")) Theorems 3.2 and 3.14(i), Proposition 3.21; the completed-bar comparison is detailed following Lemma 20. Derived solid scalar extension to $R$ preserves its augmentation and makes its terms retracts of finite free modules over the $R$-linear action algebra. Thus invariants are computed by a bounded complex of retracts of finite sums of the coefficient object. Forming both computations inside the almost category gives
  $ "colim"_K R Gamma \( G \, cal(C)_K \) arrow.r^(med tilde.op med) R Gamma #scale(x: 120%, y: 120%)[\(] G \, "colim"_K cal(C)_K #scale(x: 120%, y: 120%)[\)] . $
  Only the group resolution is bounded; no amplitude bound on $cal(C)_K$ is required.
  For the two torsors in (5.2), choose common cofinal buffered supports upstairs invariant under both groups, using properness. At a fixed support, the supported fiber commutes with Cech descent, and the two orders of descent give the common double nerve $cal(X) times P_n^a times U^b$. Replacing its two group directions by their bounded resolutions gives a finite double complex whose terms are retracts of finite sums. The support colimit therefore commutes with both directions. This proves that the torsor nerves compute compact supports and that the two presentations agree. The comparison remains the canonical double-nerve map; its support, cup, and trace maps are unchanged by this verification.
  #emph[Rational-rank incidence.] On bounded affine lifts of $N_t^m$, cover the compact rational Grassmannian by finitely many clopen charts admitting matrix frames. In such a chart, incidence with a plane of dimension $j$ has equations
  $ A \( L \) z = b \, #h(2em) b in F^(m - j) . $
  The entries of $A \( L \)$ have a common bound, say $C_0$, and $z$ has some bound $M_0$. Therefore every possible $b$ lies in the compact ball $\| b \| lt.eq C_0 M_0$ in $F^(m - j)$. Thus all relevant relations are included in a closed analytic incidence over compact parameters. Projection along these parameters is proper. Its image is closed and generalizing: the same equation and the same witness survive generization. Equivalently one may use the generalizing property of maps of locally spatial diamonds #cite(label("ScholzeDiamonds")) Proposition 11.19(iv), Definition 18.1, and Remark 18.2. Its open complement is partially proper by the valuative criterion #cite(label("ScholzeDiamonds")) Definition 18.4.
  Choose a finite mesh in the compact parameter chart, bound the values of its relation functions, and let those bounds tend to zero. The resulting rational tubes have this incidence image as their closed limit. Strict radius gaps exclude additional valuations at an outer boundary. The construction is compatible with every quasicompact test and with refinements of the mesh. On the stratum of actual rank $j$, the smallest plane is unique. The proper incidence projection with this unique fiber has a continuous inverse there. This is precisely the continuity used when contracting the flag choices on an exact-rank stratum. ◻
]

#thm([Lemma 5.5.])[
  #emph[For the diamond of the untilted affine space one has 
$ R Gamma_c \( bb(A)_C^(j \, diamond.stroked.small) \, cal(A) \) tilde.eq R \( - j \) \[ - 2 j \] . $

 Translations and invertible linear changes act trivially on this line, apart from its displayed arithmetic Tate twist. The identification is compatible with compact profinite parameters.]
] <support:affine>

#proof[
  Take $bb(P)_C^j$ with hyperplane complement $bb(A)_C^j$. Proper primitive comparison #cite(label("ScholzeHodge")) Theorem 5.1 and (5.4) identify the compact-support complex with the fiber of the projective-space restriction map. Restriction preserves the powers of the hyperplane class, so cancels the even degrees from $0$ through $2 j - 2$ and leaves $R \( - j \)$ in degree $2 j$. The same conclusion follows directly from compact-support primitive comparison for Zariski opens of smooth proper spaces #cite(label("PignonYwanne")) Corollary 5.3.2 and its proof, with algebraic–analytic proper-support compatibility #cite(label("BhattHansen")) Proposition 3.16. The top affine class is invariant under affine linear changes, and the comparison and localization maps are natural. Lemma 21 proves the parameter assertion.
  For clarity, the boundary germ involved here is indeed the coefficient at a point. Shrinking quasicompact discs to that point and applying spatial continuity gives $R$ in degree zero. One can also see the vanishing directly on a Kummer annulus: a nonconstant fractional monomial of exponent $u = b p^v$, $p divides.not b$, has difference operator of norm $\| epsilon.alt - 1 \|^(p^v)$. Shrinking both Laurent bounds by a ratio at most $\| epsilon.alt - 1 \|$ makes division by this operator integral, since $p^v lt.eq \| u \|_(bb(R))$. This contracts the nonconstant complex. The remaining degree-one Kummer class vanishes on a smaller disc by the binomial-series root. This argument also explains why the same assertion is not being made about compact supports of a perfected open unit disc. ◻
]

#thm([Lemma 5.6.])[
  #emph[For $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(5.7)")
 $ R Gamma_c \( N_t^j \, cal(A) \) tilde.eq R \( - j \) ⊗ "or"_(F^j)^(- 1) \[ - \( t + 2 \) j \] . $ <support:ambient-cohomology>]

 Here $"or"_(F^j)^(- 1)$ is the top continuous cohomology orientation of a lattice in the $bb(Q)_p$-space $F^j$. On $"GL"_j \( bb(Z)_p \)$ its character is $\( det \)^(- t)$, reduced to the coefficient ring. The identification retains the commuting frame actions and compact parameters.]
] <support:translation-quotient>

#proof[
  Let $Lambda_s = p^(- s) cal(O)_F^j$. Choose radii $\| p \|^(- r) < rho_r < \| p \|^(- \( r + 1 \))$ and let $D_r$ be the open polydisc of radius $rho_r$, with buffered compact supports inside. Then $F^j ∩ D_r = Lambda_r$, and translates by elements outside $Lambda_r$ are disjoint from $D_r$. For a fixed lattice, compact-group descent commutes with exhaustion by invariant supports. Lemma 22 consequently gives
  $ "colim"_r R Gamma_c \( D_r \/ Lambda_s \, cal(A) \) tilde.eq R Gamma \( Lambda_s \, R \( - j \) \) \[ - 2 j \] . $
  The quotients $D_r \/ Lambda_r$, with radii chosen to contain exactly the prescribed translation lattice, embed openly into $N_t^j$ and exhaust it. More explicitly, use pairs $\( s \, r \)$ with $r gt.eq s$. Increasing $r$ gives extension on the disc, while increasing $s$ gives corestriction for the finite cover between lattice quotients. These are the maps induced by the open embedding into the next quotient chart: on the cover, they sum the disjoint translates. The diagonal is cofinal, because a bounded compact support and any finite compact family of translates fit in a later disc. Thus one may first exhaust the affine space at fixed $s$ and then take the lattice colimit.
  Put $h = t j$. The continuous Koszul complex for the abelian lattice gives
  $ H^a \( Lambda_s \, R \) = and.big^a "Hom"_(upright("cts")) \( Lambda_s \, bb(F)_p \) ⊗_(bb(F)_p) R . $
  In homothety frames the corestriction from $Lambda_s$ to $Lambda_(s + 1)$ multiplies degree $a$ by $p^(h - a)$. This follows either from the exterior Koszul comparison or by duality with restriction in complementary degree. Hence the colimit kills every degree except $h$, where it preserves the top orientation. Together with the affine degree $2 j$ this proves (5.7). Under inverse substitution an automorphism acts on the top lattice class by the inverse of its $bb(Q)_p$-determinant. A matrix on $j$ rows acts on $F^j$ with determinant $\( det \)^t$, proving the stated character. The finite Koszul and compact-support maps are functorial, so the argument retains all commuting actions.
  For the commuting $P_t$-action this functoriality can be expressed without choosing a $P_t$-invariant affine chart. The constant-$bb(F)_p$ primitive comparison on the affine pieces, followed by the same lattice corestriction colimit, gives the canonical equivalence
  $ R Gamma_c \( N_t^j \, bb(F)_p \) ⊗_(bb(F)_p) R arrow.r^(med tilde.op med) R Gamma_c \( N_t^j \, cal(A) \) . $
  The source has a single one-dimensional $bb(F)_p$-cohomology group, in degree $\( t + 2 \) j$. The comparison is natural for automorphisms of $N_t^j$ and for compact parameter families. Its $P_t$-action is consequently a smooth finite character, as required when taking compact-group invariants below. ◻
]

=== 5.3 The rational flag resolution <the-rational-flag-resolution>

To recover the compact supports of $Z$ from those of $N_t^m$, we resolve the complement of $Z$, consisting of dependent tuples, by rational supporting planes allowed to vary over compact Grassmannians. Flags organize the incidence among these plane families. The augmented incidence complex below represents extension by zero from $Z$, so the next definitions record the orientation line and flag cohomology associated to each smallest plane.

For $m = 1$ the complement is only the zero extension. The support triangle is

$ R Gamma_c \( N_t \\ { 0 } \, cal(A) \) arrow.r R Gamma_c \( N_t \, cal(A) \) arrow.r R . $

Lemma 23 places the ambient line $R \( - 1 \) ⊗ "or"_F^(- 1)$ in degree $t + 2$. The triangle therefore gives a boundary copy of $R$ in degree one and that ambient line in degree $t + 2$. For general $m$, the proper rational planes replace the single zero plane, and their flags account for the additional incidence degrees.

For a rational plane $W subset bb(Q)_p^m$ of dimension $j$, write $N_t \( W \) = W ⊗_(bb(Q)_p) N_t$ and

$ frak(o)_t \( W \) = and.big_(bb(F)_p)^(t j) "Hom"_(upright("cts")) \( \( W ∩ bb(Z)_p^m \) ⊗_(bb(Z)_p) cal(O)_F \, bb(F)_p \) ⊗_(bb(F)_p) R . $

This is the line in Lemma 23; its plane-row character is $\( det \)^(- t)$. Its natural commuting $P_t$ action is retained. We put $frak(o)_t \( 0 \) = R$.

If $Q$ has rational dimension $s$, let $Delta_s = { 1 \, dots.h \, s - 1 }$, and denote by $"Fl"_I \( Q \)$ the compact space of rational flags with dimension set $I subset Delta_s$. The empty flag space is a point. For a coefficient module $M$, consider the augmented complex

#[#set math.equation(numbering: n => "(5.8)")
 $ cal(B)_Q^a \( M \) = xor.big_(I subset Delta_s\
\| I \| = a - 1) "LC" \( "Fl"_I \( Q \) \, M \) \, #h(2em) 1 lt.eq a lt.eq s . $ <support:flag-complex-definition>]

Its differential adding $i in.not I$ is pullback along the flag projection, with sign $\( - 1 \)^(\| { u in I : u < i } \|)$. Define

$ "St" \( Q \; M \) = frac("LC" \( "Fl"_(Delta_s) \( Q \) \, M \), sum_(i in Delta_s) "LC" \( "Fl"_(Delta_s \\ { i }) \( Q \) \, M \)) \, $

where the maps in the denominator are pullbacks. For $s = 1$ this means $"St" \( Q \; M \) = M$.

#thm([Lemma 5.7.])[
  #emph[The complex (5.8) has cohomology only in degree $s$, where it is $"St" \( Q \; M \)$. The assertion is natural under linear isomorphisms and for locally constant families over compact rational Grassmannians.]
] <support:flag-complex>

#proof[
  Choose a basis and an upper triangular Borel. For each partial flag type, filter by the decreasing Bruhat opens consisting of cells of length at least $b$. Restriction gives the associated graded as compactly supported locally constant functions on the cells of length $b$. These restriction maps are surjective: compactly supported locally constant functions on a closed stratum extend after a finite refinement by compact open neighborhoods.
  A flag projection sends a refined cell indexed by $v$ to that indexed by the shortest representative $w$ of its parabolic coset. Its length can only decrease. If the lengths agree, then $v = w$ and the projection is an isomorphism on the common unipotent cell coordinates. Hence, on the associated graded, only these isomorphisms contribute.
  For a permutation $w$, the resulting summand is the signed Boolean complex on the subsets $I$ containing its right descent set $D_R \( w \)$, with the same cell coefficient in degree $\| I \| + 1$. If $D_R \( w \) eq.not Delta_s$, toggling any element of $Delta_s \\ D_R \( w \)$, with the incidence sign, contracts this complex. Only the longest permutation survives, in degree $s$. The filtration is finite, so this proves vanishing in all other degrees. Its top cokernel is the displayed Steinberg quotient.
  Over a Grassmannian choose a finite disjoint clopen refinement with quotient frames. Locally constant sections commute with this calculation: they are filtered colimits over finite clopen partitions of finite products. The constructions are natural, so the local identifications glue independently of the frames. ◻
]

For $0 lt.eq j < m$, let $cal(V)_j$ be the locally constant sections over $"Gr"_j \( bb(Q)_p^m \)$ of the family

$ W mapsto frak(o)_t \( W \) \( - j \) ⊗_R "St" \( bb(Q)_p^m \/ W \; R \) . $

This is locally constant induction from the compact parabolic stabilizing a $j$-plane. Its first block has orientation character $- t$ and its remaining block has character zero before taking the flag complex. Put $cal(V)_m = frak(o)_t \( bb(Q)_p^m \) \( - m \)$.

#thm([Proposition 5.8.])[
  #emph[The compactly supported cohomology of $Z$ is 
$ H_c^a \( Z \, cal(A) \) = cases(delim: "{", cal(V)_j \, & a = \( t + 2 \) j + \( m - j \) \, quad 0 lt.eq j < m \,, cal(V)_m \, & a = \( t + 2 \) m \,, 0 \, & upright("otherwise") .) $

 The map to $R Gamma_c \( N_t^m \, cal(A) \)$ identifies the last cohomology group with the ambient line. Scalar matrices in $1 + p bb(Z)_p$ act trivially on these cohomology groups. The statement is equivariant for the commuting compact frame groups and retains the actual finite incidence complex, without choosing an equivariant splitting of that complex.]
] <prop:compact-support>

#proof[
  For $a gt.eq 1$, let $cal(I)_a$ parametrize
  $ \( z \, W_0 < dots.h.c < W_(a - 1) < bb(Q)_p^m \) \, #h(2em) z in N_t \( W_0 \) . $
  The maps $pi_a : cal(I)_a arrow.r N_t^m$ are proper by Lemma 21. With the ambient term in degree zero, form the alternating incidence complex
  #[#set math.equation(numbering: n => "(5.9)")
   $ cal(A)_(N_t^m) arrow.r pi_(1 *) cal(A)_(cal(I)_1) arrow.r dots.h.c arrow.r pi_(m *) cal(A)_(cal(I)_m) . $ <support:incidence-resolution>]
  Forgetting the smallest plane uses restriction from a larger plane fiber to a smaller one; the other face maps forget a flag step.
  This complex represents extension by zero from $Z$. An independent point has no proper containing plane. At a dependent point, the containing-plane poset has an initial object, its smallest plane, so adjoining this plane contracts the augmented nerve. This is a contraction of the supported calculation, not only a calculation of geometric-point ranks: filter by actual rank and use the continuous smallest-plane map of Lemma 21. On its finite clopen matrix charts the contraction acts on the same tube and parameter complexes. Coefficient localization then glues the contraction.
  Apply compactly supported cohomology to (5.9). First compute the plane-fiber direction by Lemma 23. For a fixed smallest plane of dimension $j$, the remaining complex is (5.8) for the quotient of dimension $m - j$, tensored with $frak(o)_t \( W \) \( - j \)$. Its term with no further plane lies in incidence degree one. The full incidence sign is the negative of the flag sign; multiplication in flag degree $r + 1$ by $\( - 1 \)^r$ identifies the two conventions. Lemma 24 therefore gives the entries
  $ E_2^(m - j \, \( t + 2 \) j) = cal(V)_j quad \( 0 lt.eq j < m \) \, #h(2em) E_2^(0 \, \( t + 2 \) m) = cal(V)_m . $
  There are no further differentials. A differential to an entry with smaller plane dimension $j' < j$ would require
  $ r = j - j' \, #h(2em) r - 1 = \( t + 2 \) \( j - j' \) \, $
  which is impossible. The total degrees are distinct, proving the formula. Projection onto the ambient term is the map induced by extension of supports along $Z subset N_t^m$, so its top edge has the asserted identification.
  A scalar fixes all rational flags. On a plane of dimension $j$ it acts by $overline(a)^(- t j)$ on the orientation, and trivially on the affine Tate line. This is one for $a in 1 + p bb(Z)_p$. The assertion follows on every displayed cohomology group. All maps used in the construction are pullbacks, restrictions, extensions of supports, or the lattice corestrictions described above. Thus the comparison retains the commuting actions. ◻
]

#thm([Corollary 5.9.])[
  #emph[For a compact open $U subset U_0$ and a fixed finite character twist, the groups 
$ H^a #scale(x: 120%, y: 120%)[\(] U \, R Gamma_c \( Z \, cal(A) \) ⊗ chi #scale(x: 120%, y: 120%)[\)] $

 vanish outside a finite range and have bounded almost length over $R$. In particular, if such a group is $V ⊗_k R$ for a $k$-vector space $V$, then $V$ is finite dimensional.]
] <support:finite-invariants>

#proof[
  Use the finite flag resolutions rather than replace them by an infinite representation without its resolution. Shapiro reduces the $"GL"_m$-direction to compact parabolic groups with a line coefficient. Their intersection with an open subgroup has finitely many orbits on each compact flag space. The commuting $P_t$-direction is compact as well. All these groups have finite $p$-cohomological dimension and a bounded resolution with finite projective terms: they are compact $p$-adic analytic groups without $p$-torsion, since $p > n + 1$. Their line coefficients and the finite twists are smooth; after shrinking an open subgroup they are trivial. Thus each computing complex has finitely many finite almost free coefficient terms. The same is true of the finite flag and group filtrations.
  For the last assertion normalize the length of $R$ to one. Subquotients and finite extensions of $R^b$ have length bounded by the sum of the corresponding integers $b$; the assertion also holds after almostification, by taking arbitrarily small valuation losses. A direct sum of $r$ copies of $R$ has length $r$. Every finite-dimensional subspace of $V$ therefore has bounded dimension. Faithfulness of the scalar extension implies that $V$ is finite dimensional. ◻
]

=== 5.4 Principal parts and the positive Frobenius system <principal-parts-and-the-positive-frobenius-system>

We now return to a sufficiently deep finite joint frame level $U$. Let $P = x^(- b) L$ be a finite free compact $C_1$-lattice in $B_U$, with the following properties. It is stable under the stationary transfer $S$, every fixed larger pole lattice is carried into $P$ by a sufficiently large iterate, and the transpose on

$ M = "Hom"_(C_1) \( P \, omega_(C_1) \) \, #h(2em) omega_(C_1) = Omega_(C_1 \/ k \, upright("cts"))^m \, $

is positive Frobenius in the finite volume frame $eta$. More precisely, after the divisible choice of root step in Lemma 11, write this step as $Q$-Frobenius. Its matrix on $M$ has entries in $x C_1$. In the etale trace and volume identification on $x eq.not 0$, the basis functions of $M$ are integral over $C_1$. These lattice choices exist by Lemma 16; that lemma uses only the finite-level rings and denominator bounds, not a cohomological finiteness assertion. The integrality condition can always be arranged simultaneously with positivity: a sufficiently high power of $x$ clears the coefficients of the finitely many monic equations of the basis functions, while the Frobenius matrix gains $\( Q - 1 \) b$ powers of $x$.

The continuous residue pairing identifies

#[#set math.equation(numbering: n => "(5.10)")
 $ P^or = "Hom"_(upright("cts")) \( P \, k \) tilde.eq H_(frak(m))^m \( M \) \, #h(2em) frak(m) = \( w_1 \, dots.h \, w_m \) . $ <support:residue-dual>]

On a free basis it pairs power series with finite sums of monomials negative in every variable, by the coefficient of $w_1^(- 1) dots.h.c w_m^(- 1) d w_1 and dots.h.c and d w_m$. This is an equivariant pairing: the top differential includes the Jacobian in the change-of-variables formula for the residue.

We specify the root coefficient system before passing to analytic supports. Choose a free basis $e_1 \, dots.h \, e_N$ of $M$. On $x eq.not 0$, the trace and volume frame writes $e_i = f_i eta$, with $f_i$ a finite-cover function integral over $C_1$. The actual Frobenius transpose $F = S^or$ has the form

$ F \( e_i \) = f_i^Q eta = sum_j a_(j i) e_j \, #h(2em) a_(j i) in x C_1 . $

Put $C^(\( r \)) = C_1^(1 \/ Q^r)$ and let $M_r = xor.big_i C^(\( r \)) e_i^(\( r \))$ be free on the displayed symbols. Only on the puncture do we interpret $e_i^(\( r \))$ as $f_i^(1 \/ Q^r) eta$; the volume line is retained once and is not rooted. Define the transition, linear over $C^(\( r \)) subset C^(\( r + 1 \))$, by

#[#set math.equation(numbering: n => "(5.11)")
 $ e_i^(\( r \)) mapsto sum_j a_(j i)^(1 \/ Q^(r + 1)) e_j^(\( r + 1 \)) . $ <support:root-coefficient-transition>]

Taking $Q^(r + 1)$-th roots of the displayed function identity verifies that this is the actual inclusion on the puncture. Its entries are integral on the ambient rooted disc and are divisible by $x^(1 \/ Q^(r + 1))$.

Power renaming gives a $k$-linear isomorphism $theta_r : M_r arrow.r M$, sending $c e_i^(\( r \))$ to $c^(Q^r) e_i$. It satisfies $theta_(r + 1) iota_r = F theta_r$, where $iota_r$ is (5.11). The same identity holds on the Cech fractions computing local cohomology. Thus the stationary transition on principal parts is exactly $F$.

On $bb(D)^(m \, upright("perf"))$, let $cal(M)_r = xor.big_i cal(A) e_i^(\( r \))$, with the integral analytic transition matrix (5.11). This defines the free ambient extension without assuming that the cover functions themselves extend across $x = 0$. The maps $theta_r$ are power renamings of the algebraic $k$-coefficients; after scalar extension their comparisons fix $E$ and $R$, rather than applying absolute Frobenius to those scalars. The finite torsor actions and morphisms of Section 3 commute with this system.

#thm([Lemma 5.10.])[
  #emph[On the perfected open $m$-disc, compact supports of the free integral lattice coefficient are computed by principal parts in degree $m$. For the root system of $M$, the resulting comparison is 
#[#set math.equation(numbering: n => "(5.12)")
 $ "colim"_F H_(frak(m))^m \( M \) ⊗_k R \[ - m \] tilde.eq R Gamma_c (bb(D)^(m \, upright("perf")) \, "colim"_r cal(M)_r) \, $ <support:principal-parts-comparison>]

 where $cal(M)_r$ and its transitions are defined above, and $F = S^or$ under (5.10). The map is natural for lattice morphisms, integral coordinate changes, and continuous $P_n$ parameters.]
] <support:principal-parts>

#proof[
  First fix a coefficient stage. Write $K_a$ for the closed polydisc of radius $a$, $B_s$ for the outer closed polydisc of radius $s < 1$, and $E_(b \, s) = union.big_i { b lt.eq \| w_i \| lt.eq s } subset B_s$ for its Laurent exterior. For $0 < a < b < c < s < 1$, put
  $ cal(C)_a = R Gamma_(K_a) \( bb(D)^(m \, upright("perf")) \, cal(M)_r \) \, #h(2em) cal(L)_(b \, s) = "fib" #scale(x: 120%, y: 120%)[\(] R Gamma \( B_s \, cal(M)_r \) arrow.r R Gamma \( E_(b \, s) \, cal(M)_r \) #scale(x: 120%, y: 120%)[\)] . $
  The inclusions $B_s \\ K_c subset E_(b \, s) subset B_s \\ K_a$ give, by restriction and excision at the two ends, maps
  #[#set math.equation(numbering: n => "(5.13)")
   $ cal(C)_a arrow.r cal(L)_(b \, s) arrow.r cal(C)_c $ <support:buffer-sandwich>]
  whose composite is the canonical enlargement of supports.
  Here is the direction of the maps in the buffered system. Index it by triples $\( a \, b \, s \)$ with $a < b < s$, and let a later triple $\( a' \, b' \, s' \)$ satisfy $s < a'$. Choose $b < c < s$ and use $cal(L)_(b \, s) arrow.r cal(C)_c arrow.r cal(C)_(a') arrow.r cal(L)_(b' \, s')$ as its transition. Comparing two choices with a larger intermediate $c$ shows independence of that choice; (5.13) also shows that these transitions compose. The genuine support system and this buffered system interleave cofinally, so their colimits agree. Outer-domain comparisons enter through excision; the forward maps enlarge supports.
  The intersections in the finite cover of $E_(b \, s)$ are
  $ U_I = { b lt.eq \| w_i \| lt.eq s med \( i in I \) \, quad \| w_j \| lt.eq s med \( j in.not I \) } \, #h(2em) diameter eq.not I subset.eq { 1 \, dots.h \, m } . $
  Affinoid almost acyclicity computes $cal(L)_(b \, s)$ by the augmented Cech complex of integral Laurent coefficients modulo $pi.alt$.
  For an exponent vector $alpha$, a monomial $w^alpha$ occurs on $U_I$ exactly when its negative exponents have indices in $I$. Wherever it occurs its Gauss weight is
  $ b^(sum_(alpha_i < 0) alpha_i) s^(sum_(alpha_i gt.eq 0) alpha_i) . $
  Thus the monomial Cech contraction preserves the norm: it removes every exponent vector except those negative in all coordinates, which remain in degree $m$ of the restriction fiber. On a fixed buffered chart the weighted coefficients of a convergent Laurent series tend to zero. Modulo any fixed positive-valuation cutoff, only finitely many monomials remain, so this norm-preserving contraction also applies to the completed series.
  The support transitions just constructed carry a negative Laurent cocycle to the same principal part, with its coefficients unchanged. For a fixed all-negative $alpha$, the integral coefficient bound is $\| c_alpha \| lt.eq b^(sum_i \( - alpha_i \))$; the denominator sublattice has the same bound multiplied by $\| pi.alt \|$. Along the cofinal system $b$ tends to one, so these bounds tend to $1$ and $\| pi.alt \|$. Their colimit quotient is almost $R$. We obtain the discrete finite-sum principal part module tensored with $R$, shifted by $m$.
  At a fixed module stage $r$, the perfected analytic scalars can be computed by allowing a further scalar-root stage $h gt.eq r$. This gives two indices: $r$ for the module transitions (5.11), and $h$ for the fractional exponents in its scalar coefficients. After the fixed cutoff calculation every principal part is finite, so its exponents have one common root denominator. It appears at some finite $h$, and increasing $r$ to at least $h$ places it on the diagonal. That diagonal is cofinal. The identity $theta_(r + 1) iota_r = F theta_r$ identifies its algebraic Cech transitions with the direct system on the left of (5.12). The integral matrices preserve both the coefficient lattices and their $pi.alt$-multiple submodules.
  The comparison map itself is the map from algebraic Cech fractions to the supported analytic Cech complex, permitting arbitrarily small scalar losses before almostification. It is therefore independent of the chosen expression in monomials. The residue change-of-variables formula proves coordinate naturality. On a compact continuous group parameter, uniform polynomial approximation reduces the calculation modulo the cutoff to locally constant finite principal parts. Hence the same map and contractions apply to the parameter complexes. ◻
]

Let $bb(D)^times$ be the puncture $x eq.not 0$ of the completed perfected open labelled disc of $C_1$ in Proposition 4. At our chosen sufficiently deep level $U subset P_t times ker \( "GL"_m \( bb(Z)_p \) arrow.r "GL"_m \( bb(F)_p \) \)$, let $nu : cal(X) \/ U arrow.r bb(D)^times$ be the finite cover obtained by analytically realizing the finite étale $C_1 \[ 1 \/ x \]$-algebra $B_U$. The symbol $chevron.l eta chevron.r$ denotes the retained one-dimensional volume representation; it is not absorbed into a change of auxiliary action.

#thm([Lemma 5.11.])[
  #emph[There is a natural almost equivalence on the ambient perfected labelled disc 
#[#set math.equation(numbering: n => "(5.14)")
 $ "colim"_r cal(M)_r tilde.eq j_(!) nu_(*) cal(A)_(cal(X) \/ U) ⊗ chevron.l eta chevron.r \, #h(2em) j : bb(D)^times arrow.r.hook bb(D)^(m \, upright("perf")) . $ <support:positive-extension-equivalence>]

 It respects finite-cover trace, changes of frame level, the $P_n$-action, and the retained volume character.]
] <support:positive-extension>

#proof[
  Trivialize the finite volume frame, retaining its transformation line. By Lemma 11, the transpose is the actual positive Frobenius on finite etale cover functions in this frame. In particular, the matrices here are not arbitrary semilinear matrices. Their root-stage bases are the roots of these finite-cover functions.
  First work on a bounded affinoid chart with $\| x \|$ bounded away from zero. A finite free basis norm and the intrinsic integral norm on cover functions are equivalent, with a fixed two-sided factor $C_0 gt.eq 1$. At the $r$th root stage this factor is at most $C_0^(1 \/ Q^r)$. The chosen basis is integral over $C_1$, so its root basis is power bounded; thus there is an actual map from these integral lattices into the intrinsic integral coefficient. For every $epsilon.alt > 0$, at sufficiently large $r$ the inverse comparison loses norm at most $\| pi.alt \|^(- epsilon.alt)$. It follows that the cokernel is almost zero. Applying the same two-sided estimates to the $pi.alt$-multiples proves almost injectivity after reduction. Finally finite fractional polynomials are dense in the completed perfection; modulo a positive-valuation cutoff they are available after a common finite increase in root stage. This proves the desired equivalence on $bb(D)^times$, including the completion comparison.
  On the closed locus $x = 0$, every transition of the free extended lattices is zero, since its entries are divisible by the relevant root of $x$. Hence the direct limit has zero restriction to that locus. In terms of tubes, an element from a fixed stage acquires a positive fractional power of $x$ at its next stage; the latter basis is power bounded. It therefore vanishes modulo $pi.alt$ on a sufficiently small tube. The tube may depend on the fixed stage. This is enough for the direct-limit restriction, and no common tube for all stages is needed.
  The zero locus is generalizing closed, being the inverse limit of its shrinking rational tubes. Coefficient continuity and (5.4) now identify the direct limit with extension by zero of the coefficient already computed on its open complement. This proves (5.14).
  The construction used the intrinsic finite-cover functions, their actual Frobenius, and the residue/trace frame. All these maps commute with the finite-level operations of Lemma 11. Norm bounds serve only to prove that these same maps are almost equivalences; they do not choose a replacement action. The estimates hold uniformly on compact $P_n$-families by a common finite basis and pole bound. This proves the asserted naturalities. ◻
]

=== 5.5 The transpose comparison <the-transpose-comparison>

We use the ordinary constant-cochain action throughout this comparison. On a $P_n$-action nerve, a locally constant function $P_n^a arrow.r bb(F)_p$ gives a geometric cochain by multiplying the coefficient unit $1$ on each clopen piece. These maps commute with the faces, degeneracies, and cup products. Totalization thus gives the structural action of $C_(upright("cts"))^(*) \( P_n \; bb(F)_p \)$; on the quotient presentation it is pullback from $B P_n$. Supported fibers inherit the action from the same nerve. This specifies the action before making any comparison of cohomology groups.

#thm([Proposition 5.12.])[
  #emph[For the stable lattice $P$ and sufficiently deep finite frame level $U$ specified above, there is a natural equivalence 
#[#set math.equation(numbering: n => "(5.15)")
 $ ("colim"_(S^or) R Gamma \( P_n \, P \)^or) ⊗_k R tilde.eq R Gamma #scale(x: 120%, y: 120%)[\(] U \, R Gamma_c \( Z \, cal(A) \) ⊗ chevron.l eta chevron.r #scale(x: 120%, y: 120%)[\)] \[ m + n^2 \] . $ <support:transpose-derived>]

 The dual of a compact cochain complex is its continuous $k$-linear dual, with cochain degrees reversed. In degree $- i$ this gives 
#[#set math.equation(numbering: n => "(5.16)")
 $ ("colim"_(S^or) H^i \( P_n \, P \)^or) ⊗_k R tilde.eq H^(m + n^2 - i) #scale(x: 120%, y: 120%)[\(] U \, R Gamma_c \( Z \, cal(A) \) ⊗ chevron.l eta chevron.r #scale(x: 120%, y: 120%)[\)] . $ <support:transpose-cohomology>]

 These are equivalences of modules for the action of the actual constant $bb(F)_p$-cochains of $P_n$, with the usual dual signs. Transpose trace upon enlargement of a frame level corresponds to pullback on the geometric side.]
] <prop:transpose-comparison>

#proof[
  The comparison has four terms. The two shifts come from group duality and principal parts, respectively:
  (5.17)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$("colim"_(S^or) R Gamma \( P_n \, P \)^or) ⊗_k R$])
  content((0, -1.585), [$R Gamma #h(-0.16667em) (P_n \, \( "colim"_F H_(frak(m))^m \( M \) \) ⊗_k R) \[ n^2 \]$])
  content((0, -3.171), [$R Gamma #h(-0.16667em) (P_n \, R Gamma_c \( cal(X) \/ U \, cal(A) \) ⊗ chevron.l eta chevron.r) \[ m + n^2 \]$])
  content((0, -4.756), [$R Gamma #h(-0.16667em) (U \, R Gamma_c \( Z \, cal(A) \) ⊗ chevron.l eta chevron.r) \[ m + n^2 \] .$])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-1.479, -0.7927), [#text(size: 0.73em)[$upright("group and residue duality")$]])
  content((0.2741, -0.7927), [#text(size: 0.73em)[$tilde.eq$]])
  line((0, -1.858), (0, -2.898), mark: (end: ">"))
  content((-2.105, -2.378), [#text(size: 0.73em)[$upright("principal parts and positive extension")$]])
  content((0.2741, -2.378), [#text(size: 0.73em)[$tilde.eq$]])
  line((0, -3.443), (0, -4.484), mark: (end: ">"))
  content((-1.382, -3.963), [#text(size: 0.73em)[$upright("the common torsor nerve")$]])
  content((0.2741, -3.963), [#text(size: 0.73em)[$tilde.eq$]])
})
  We justify these arrows with their cochain actions.
  The group $P_n$ has dimension $n^2$ and no $p$-torsion, since $p - 1 > n$. Its dualizing orientation is trivial: after a splitting field, the adjoint action is conjugation on matrices and has determinant one. Continuous compact-group duality therefore gives
  $ R Gamma \( P_n \, P \)^or tilde.eq R Gamma \( P_n \, P^or \) \[ n^2 \] . $
  One may compute this with a bounded finite projective resolution over $k \[ \[ P_n \] \]$. The compact and discrete models are compatible by reduction to finite coefficients and inverse limit; the transition maps on the terms are surjective. This is also the compact/discrete duality of Lemma 17. The completed-module interpretation for the corresponding continuous and solid group cochains is compatible with these finite projective resolutions #cite(label("Tang")) Theorems 3.2 and 3.14(i), Proposition 3.21.
  Apply (5.10) and Lemma 27. The bounded resolution lets us commute its finite sums and retracts with the filtered root colimit. Lemma 28 then identifies the root system with the compact-support coefficient in the third term of (5.17). There is no $P_n$-character on the constant volume frame; its remaining character is the auxiliary one displayed here.
  Finally use Theorem 19. The two compact torsor presentations of $\[ Z \/ U \]$ have compatible cofinal compact bounds. At each fixed bound their common double nerve gives the comparison; the bounded $P_n$ and $U$ resolutions in Lemma 21 allow the support colimit to pass through both group directions. This is the last arrow of (5.17). Lemma 21 gives this comparison with every compact parameter and every support restriction needed in the nerves. This proves (5.15) and its cohomological form.
  We check the extra module assertion. On the original presentation, the constant cochain algebra acts through the structural map to $B P_n$. Compact-group duality sends its cup action to the cap/cup transpose with the canonical graded signs. The residue pairing, the Cech support maps, and the finite-cover Frobenius comparison are all maps over that same presentation. They therefore commute with these operations. The common double nerve carries the identical structural map to $B P_n$, so the action transported to $\[ Z \/ U \]$ is the actual one, not an action chosen after comparing dimensions. Finite etale trace and its transpose are compatible with the same residue pairing. Enlarging a frame level hence gives geometric pullback, as asserted. ◻
]

#thm([Corollary 5.13.])[
  #emph[For every $i$, the stable transfer image 
$ ⋂_(r gt.eq 0) S^r H^i \( P_n \, P \) $

 is finite dimensional over $k$.]
] <support:finite-stable-image>

#proof[
  Corollary 26 and faithful scalar extension applied to (5.16) imply that $"colim"_(S^or) H^i \( P_n \, P \)^or$ is finite dimensional. Its compact dual is the inverse limit with transition $S$. Projection from that inverse limit has image exactly the intersection displayed above: compactness supplies compatible preimages of every point in the intersection. The intersection is therefore a quotient of a finite-dimensional vector space. ◻
]

== 6 Compact finiteness from stable transfer images <sec:compact>

We now prove the compact part of Theorem 13. The support comparison supplies a finite stable image for transfer. The argument below uses the translation representations to turn this stable-image statement into countability for the localized coefficients, then uses compactness to obtain finiteness for the compact ones. The bounded-pole finiteness assertion remains the task of Section 7.

For $P$ as in Lemma 16, Corollary 30 gives

#[#set math.equation(numbering: n => "(6.1)")
 $ dim_k ⋂_(a gt.eq 0) S^a H^i \( P_n \, P \) < oo . $ <eq:compact:finite-stable-part>]

=== 6.1 Pole strips and the compact algebra lemma <pole-strips-and-the-compact-algebra-lemma>

Assume the earlier compact assertions in (4.1). Every strip between two fixed pole bounds for the lattices above has finite $P_n$-cohomology. Indeed, write $x$ as a unit times the product of the nonzero label coordinates. Successively dividing out one factor filters a fixed strip by finitely many restrictions to a label hyperplane, with its conormal powers. That hyperplane is a starting-height $t + 1$ basis disc after the finite root change in Corollary 6. Continuing through intersections gives only the admissible boundary coefficients in the induction hypothesis. Power-series truncations have continuous module sections, so these short exact sequences remain exact on continuous cochain terms. At $t = n$ this is simply finite-coefficient group cohomology.

Write, at a fixed frame level,

$ M^i = H^i \( P_n \, P \) \, #h(2em) X^i = H^i \( P_n \, B_U \) . $

The map $M^i arrow.r X^i$ has countable-dimensional kernel and cokernel. To see this, express the localized coefficient as the union of $x^(- c) L$ for integral $c$. The finite resolution commutes with this union, and the differences from $P$ are the strips just considered. There are countably many bounds and each strip has finite cohomology. Moreover the kernel is locally $S$-nilpotent. If a cocycle in $P$ becomes a boundary after localization, choose a primitive at one pole bound. A high iterate of $S$ carries that primitive into $P$, and annihilates the original cohomology class.

#thm([Lemma 6.1.])[
  #emph[Let $M$ be a compact $k$-vector space and $S$ a continuous $k$-linear endomorphism. Suppose $M \/ S M$ and $I = ⋂_(a gt.eq 0) S^a M$ are finite. Then $S \( I \) = I$, $S$ is invertible on $I$, and $M \/ I$ is a finitely generated $k \[ \[ z \] \]$-module with $z$ acting as $S$. In particular $S$ has finite kernel and cokernel on $M$.]
  #emph[If $f : M arrow.r X$ commutes with $S$ and has locally $S$-nilpotent kernel, then $ker f$ is finite and 
#[#set math.equation(numbering: n => "(6.2)")
 $ ⋂_(a gt.eq 0) "im" \( S^a M arrow.r X \) = f \( I \) $ <eq:compact:finite-intersection>]

 is finite.]
] <lem:compact:operator>

#proof[
  For $y in I$, the nonempty compact sets $S^(- 1) \( y \) ∩ S^a M$ are nested. Their intersection gives a preimage in $I$, proving $S \( I \) = I$; finiteness makes the restriction invertible. The images $S^a \( M \/ I \)$ shrink uniformly to zero. Otherwise a compact closed set outside a neighborhood of zero would meet every one of these nested images and hence their intersection, which is zero.
  Choose finitely many lifts of a basis of $\( M \/ I \) \/ S \( M \/ I \)$. Repeatedly subtract their linear combinations, and divide the remainder by $S$. The resulting series converges uniformly in the compact topology and defines a continuous surjection $k \[ \[ z \] \]^r arrow.r M \/ I$. The kernel and cokernel of $z$ on a finite module over this discrete valuation ring are finite-dimensional. The same conclusion for $S$ on $M$ follows using its finite invariant subspace $I$.
  The image of $ker f$ in $M \/ I$ is contained in the $z$-power torsion submodule, which is finite-dimensional. Since $I$ is finite, this proves that $ker f$ is finite, without assuming it closed in advance. For $x$ on the left of (6.2), its fibre is now a finite closed coset of $ker f$. It meets every nested compact set $S^a M$, and hence meets $I$. This proves the equality. ◻
]

We will also use that a countable compact Hausdorff group is finite. The Baire theorem applied to its countably many singleton subsets gives an isolated point; translations make the group discrete, and compactness then makes it finite. As $k$ is finite, countable dimension and countability of the underlying set agree.

=== 6.2 The regular translation module <the-regular-translation-module>

For $t > 1$, the translation representations supply the missing countability argument. We work simultaneously at sufficiently deep frame levels and choose the largest degree in which countability could fail. A Koszul extension will give one surjective operation into that degree, modulo countable-dimensional spaces. Its powered realizations must all be compared at one fixed frame level: only then can the finite transfer intersection in the compact operator lemma bound its image. The next two lemmas construct this operation; the following subsection establishes the required uniformity.

Assume first that $t > 1$, so that $Lambda = k \[ \[ D_1 \, dots.h \, D_d \] \]$ with $d = m \( t - 1 \) > 0$. We use the finite-dimensional nilpotent $Lambda$-modules, equivalently the finite translation representations. Associated coefficients, followed by $P_n$-cochains, form an exact functor on cochain terms: finite flat torsor descent and the split module filtrations above give continuous coefficient splittings. The finite $P_n$-resolution gives one bound on its cohomological degrees.

To retain precisely the possible failure of countability, let $cal(V)$ be the Serre quotient of $k$-vector spaces by the countable-dimensional ones. Let $cal(G)$ be the category of germs of sequences in $cal(V)$, where sequences agreeing after an initial segment are identified. Use a cofinal sequence of principal joint frame levels. Denote by $T^i \( N \) in cal(G)$ the cohomology of the associated coefficient for a finite module $N$ at those levels. In particular $T^i \( k \)$ is represented by $X^i$. For each finite diagram we may discard an initial segment to make all its finite auxiliary actions defined and compatible. Kernels, cokernels, and exact sequences have their termwise meaning in this category. Its zero objects are exactly the sequences of countable-dimensional spaces at all sufficiently deep levels. Thus $T^i \( k \) eq.not 0$ means that $X^i$ is uncountable-dimensional at arbitrarily deep levels; discarding a finite initial segment cannot remove that failure.

The exact cochain functor extends levelwise to pro objects. Write $overline(T)^i \( Lambda \)$ for its value on the inverse regular-module system. Lemma 11 identifies this system with

$ dots.h.c arrow.r^S X^i arrow.r^S X^i $

in $"Pro" \( cal(G) \)$, with the augmentation to $T^i \( k \)$; the harmless normalization constants are in $k^times$. The completed Koszul resolutions used below are exact pro resolutions. Indeed finite-length quotients of a finite exact complex of finitely generated $Lambda$-modules are pro exact by the adic Artin–Rees property. Thus they can be used with this levelwise cochain functor.

#thm([Lemma 6.2.])[
  #emph[For each $i$, the pro object $overline(T)^i \( Lambda \)$ is constant and its augmentation to $T^i \( k \)$ is monic. Its $Lambda$-action factors through $k$.]
] <lem:compact:pro-constant>

#proof[
  Constant objects in a pro abelian category are closed under kernels and cokernels of maps between constants and under extensions. For the last assertion, one can pass to the opposite ind category: in an extension of two constants, the identity of the constant quotient factors through one presenting term. Add the constant kernel to that term; the resulting relation object is constant, giving a constant presentation of the extension.
  We induct downwards in $i$, starting above the uniform cohomological bound. Suppose the assertion of constancy is known for larger indices. Resolve $frak(m)_Lambda = \( D_1 \, dots.h \, D_d \)$ by the truncated completed Koszul resolution. Successive short exact sequences $0 arrow.r K arrow.r F arrow.r Q arrow.r 0$ in this finite resolution give
  $ 0 arrow.r "coker" #scale(x: 120%, y: 120%)[\(] overline(T)^j \( K \) arrow.r overline(T)^j \( F \) #scale(x: 120%, y: 120%)[\)] arrow.r overline(T)^j \( Q \) arrow.r ker #scale(x: 120%, y: 120%)[\(] overline(T)^(j + 1) \( K \) arrow.r overline(T)^(j + 1) \( F \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  Starting from its free end, closure of constants under these operations shows that $overline(T)^j \( frak(m)_Lambda \)$ is constant for $j > i$. The augmentation sequence then identifies the image of $overline(T)^i \( Lambda \) arrow.r T^i \( k \)$ with the constant kernel of $T^i \( k \) arrow.r overline(T)^(i + 1) \( frak(m)_Lambda \)$.
  This image is represented by the decreasing system $S^a X^i subset X^i$. It stabilizes at a single finite index $h$ in $cal(G)$. More explicitly, after removing its constant subobject the decreasing system is pro zero. A sufficiently late transition to any fixed term is therefore zero; since that transition is monic, its source is zero. This gives stabilization, and hence
  $ S^h X^i \/ S^(h + 1) X^i $
  is countable-dimensional at every sufficiently deep frame level.
  At each such level put $M = S^h M^i$. The map from $M$ to $S^h X^i$ has countable kernel and cokernel by the strip argument. It follows that $M \/ S M$ is countable, and it is a compact quotient because $S M$ is compact. It is therefore finite. Its stable part is finite by (6.1). Lemma 31 now shows that $S$ has finite kernel and cokernel on $M$, and hence countable kernel and cokernel on $S^h X^i$. Thus $S$ is an isomorphism on the stabilized image in $cal(G)$. The stationary inverse system is consequently constant, and its augmentation is the inclusion of that stabilized image in $T^i \( k \)$, which is monic. This completes the induction. Finally the augmentation is $Lambda$-linear and $frak(m)_Lambda$ acts trivially on $k$; its monicity implies the same assertion on $overline(T)^i \( Lambda \)$. ◻
]

Suppose now, for a contradiction, that some $T^i \( k \)$ is nonzero, and choose the largest such degree $b_0$. Every finite nilpotent $Lambda$-module has a filtration by copies of $k$, so its $T^j$ vanishes for $j > b_0$. The augmentation sequence in the preceding proof is therefore surjective in degree $b_0$ as well as injective. The stabilized image is already the entire $T^(b_0) \( k \)$, and one may take $h = 0$. In particular $M^(b_0) \/ S M^(b_0)$ is finite. The locally $S$-nilpotent kernel $M^(b_0) arrow.r X^(b_0)$ is finite by Lemma 31, and at every sufficiently deep level

#[#set math.equation(numbering: n => "(6.3)")
 $ I_X = ⋂_(a gt.eq 0) "im" \( S^a M^(b_0) arrow.r X^(b_0) \) quad upright("is finite") . $ <eq:compact:top-finite-intersection>]

Here $P$ is the fixed target lattice defining $M^(b_0)$. We will construct a connecting operation into $X^(b_0)$ whose image, on a sufficiently positive #emph[source] lattice, lies in $I_X$. The source lattice will be in an associated translation coefficient, and need not be $P$.

#thm([Lemma 6.3.])[
  (A fixed Koszul edge).  #emph[For one sufficiently large allowed exponent $s$, a generator $e_s in "Ext"_Lambda^d \( N_s \, k \)$ induces an epimorphism 
$ T^(b_0 - d) \( N_s \) arrow.r T^(b_0) \( k \) $

 in $cal(G)$.]
] <lem:compact:koszul-edge>

#proof[
  Use the completed free Koszul complex $K_s = K \( D_1^s \, dots.h \, D_d^s \)$ in columns $\[ - d \, 0 \]$. Here $s$ is an allowed distribution exponent from Lemma 9, not a height. Its cohomology is $N_s = Lambda \/ \( D_1^s \, dots.h \, D_d^s \)$ in column zero. After applying the cochain functor the vertical page consists of copies of $overline(T)^j \( Lambda \)$. The first differential is zero by Lemma 32. For $s' > s$, the map lifting the upward inclusion of regular modules is given on the Koszul basis by
  $ e_I mapsto (product_(j in.not I) D_j^(s' - s)) e_I \, #h(2em) \| I \| = - upright("column") . $
  It is the identity in column $- d$ and is $frak(m)_Lambda$-valued in every other column. On vertical cohomology the comparison is therefore the identity in the leftmost column and zero elsewhere.
  There are no incoming differentials to the entry $\( - d \, b_0 \)$. Increase $s$ once for each possible outgoing differential. Naturality and the zero map on its target show successively that it vanishes at the increased stage. Only finitely many increases are needed, since there are $d + 1$ columns. The whole leftmost entry therefore survives and is the quotient edge of $T^(b_0 - d) \( N_s \)$. Projection to the leftmost column followed by augmentation represents a nonzero generator of $"Ext"_Lambda^d \( N_s \, k \)$, proving the assertion.
  The operation just described is also the operation of a finite Yoneda extension. Here are the category comparisons needed for this use. Pro finite-length $Lambda$-modules are the corresponding profinite modules; stable images identify their finite quotients. The completed free modules in $K_s$ are projective in these resolutions. Moreover Ext between finite modules over the Noetherian local ring $Lambda$ agrees with Ext in its $frak(m)_Lambda$-torsion category, since injective envelopes of torsion modules remain torsion. A Yoneda extension in that category can be replaced by a finite one: lift a finite set of generators successively through its finite number of arrows and include the resulting finite-length submodules and their relations. The same construction contains any prescribed finite comparison diagram. Hence completed resolutions, torsion-module Ext, and finite Yoneda diagrams induce the same connecting operation under our exact cochain functor. ◻
]

=== 6.3 Uniform equivariance of the extension operation <uniform-equivariance-of-the-extension-operation>

The Koszul edge has fixed its endpoints $N_s$ and $k$. We now compare it with operations obtained at growing root levels $q$. Equality in ordinary translation Ext would allow a different auxiliary subgroup for each $q$. We need one subgroup on which all these equalities hold, because $I_X$ is an intersection at one frame level.

#thm([Lemma 6.4.])[
  (Uniform restriction for fixed endpoints).  #emph[Choose finite extension diagrams for $e_s$ as above and for a nonzero $e in "Ext"_Lambda^d \( k \, k \)$. They are equivariant for some compact open frame group $U$. For every allowed $q gt.eq s$ let $gamma_q$ be the composite 
#[#set math.equation(numbering: n => "(6.4)")
 $ N_s arrow.r N_q arrow.r^("coind" \( e \)) N_q \[ d \] arrow.r k \[ d \] \, $ <eq:compact:coinduced-extension>]

 where the outer maps are upward inclusion and normalized transfer. There is one open subgroup $U' subset U$, independent of $q$, on which 
$ gamma_q = c_q e_s \, #h(2em) c_q in k^times \, $

 as equivariant extensions.]
] <lem:uniform-ext>

#proof[
  Forget the auxiliary group first. Finite Hopf duality identifies coinduction with base change $D_i mapsto D_i^q$ of the fundamental Koszul class. Its top coefficient is a unit. The comparison from $K_s$ to $K_q$ is the identity on its leftmost column, as in Lemma 33. Hence the composite is a nonzero multiple $c_q e_s$ in ordinary $Lambda$-Ext.
  We must make all these equalities equivariant at a single level. Their differences have the fixed endpoints $N_s \, k$, so they lie in the kernel of the one forgetful map
  $ "Ext"_(T times.r U)^d \( N_s \, k \) arrow.r "Ext"_Lambda^d \( N_s \, k \) . $
  We will show that this kernel is finite and that each of its classes vanishes on an open subgroup. A finite intersection will then work for every $q$. Shrink $U$ to a pro-$p$ compact analytic subgroup defining the two chosen finite diagrams. There is a continuous spectral sequence
  $ H^a #scale(x: 120%, y: 120%)[\(] U \, "Ext"_Lambda^j \( N_s \, k \) #scale(x: 120%, y: 120%)[\)] arrow.r.double "Ext"_(T times.r U)^(a + j) \( N_s \, k \) . $
  It can be formed in rational translation representations with smooth auxiliary action. To verify the needed acyclicity, use cofree comodules for the semidirect product: their restriction to $T$ is cofree, and their $T$-invariants are cofree for $U$. This gives the usual composition-of-invariants spectral sequence. The Koszul resolution shows
  $ dim_k "Ext"_Lambda^j \( N_s \, k \) = binom(d, j) . $
  Its terms have continuous finite-dimensional $U$-action. Analytic group cohomology is finite-dimensional on such coefficients, so $"Ext"_(T times.r U)^d \( N_s \, k \)$ is finite. Since $k$ is finite, it is a finite set as well.
  The finite Yoneda construction also gives finite equivariant representatives here. A finite set of vectors has finite $U$-orbits, since the action is smooth and $U$ is compact. Their $Lambda$-span is finite-dimensional: one power of the augmentation ideal kills the finite orbit set, and that ideal is $U$-stable. Using these spans successively in the construction retains equivariance.
  Every class in the forgetful kernel vanishes after restriction to some open subgroup. Indeed choose a finite Yoneda zero-comparison for its underlying extension, using the finite comparison property in the preceding proof. All its objects are killed by one power of $frak(m)_Lambda$. Shrink the auxiliary group so that it fixes that finite quotient of $Lambda$ and the finite objects in the original diagram. Give the additional comparison objects the trivial action of this subgroup. This is compatible with their $Lambda$-action, and all the comparison maps are now equivariant. Intersect these open subgroups over the finite forgetful kernel. The resulting $U'$ kills that entire kernel at once, and hence kills every $gamma_q - c_q e_s$.
  All the composites in (6.4) are defined before this common restriction by natural coinduction and transfer. In particular the transfer $N_q arrow.r k$ is equivariant; its translation-Hom space is one-dimensional, and a pro-$p$ group has no nontrivial character into $k^times$. The argument uses the fixed endpoints $N_s \, k$. It requires no common trivialization of the growing representations $N_q$. ◻
]

=== 6.4 Countability and compact finiteness <countability-and-compact-finiteness>

We finish the contradiction following (6.3). Fix the finite extension diagrams first, and then fix a frame level deep enough for Lemma 34, the Koszul epimorphism, and all the preceding compact estimates. At this level choose a free source lattice $L_s$ in the coefficient associated to $N_s$. For an arbitrarily deep positive multiple $x^a L_s$, the cokernel on localized cohomology is countable-dimensional by the strip argument. Thus, modulo a countable-dimensional contribution, source classes are represented by cocycles in one such positive lattice.

Keep separate the two exponents from Lemma 9. At a growing divisible torsion level $ell_r$ they are

$ Q_r = p^(t ell_r) \, #h(2em) q_r = p^(t ell_r \/ \( t - 1 \)) . $

The module $N_(q_r)$ has distribution exponent $q_r$, whereas powering its coefficient functions uses $Q_r$. Take $q_r gt.eq s$. There is a fixed loss $c_(upright("in"))$ in the source-basis and root-inclusion comparison before powering. Indeed the finitely many basis functions of $L_s$ belong to one root ring, and their powers in the base ring have a common denominator. There is also a fixed loss $c_(upright("out"))$ for the connecting operation of $e$ after powering: construct it with continuous module sections in its finitely many finite free coefficient modules. Their section matrices, differentials, and multiplication structure constants have bounded denominators. These two constants absorb all changes among the fixed finite bases. Choose $a > c_(upright("in"))$ once, before varying $r$. The resulting lower bound for the order is

$ Q_r \( a - c_(upright("in")) \) - c_(upright("out")) . $

The first loss is multiplied by the Frobenius exponent, and the second is incurred by the fixed boundary diagram afterwards. The bound tends to infinity. Lemma 11 applies to the entire finite diagram, so its coinduced connecting operation is exactly this powered operation on the root coefficient, with all auxiliary actions retained.

Consequently, for every sufficiently large allowed $q_r$, the powered representative of a class from the chosen positive lattice is carried by the fixed boundary of $e$ into $P$ at that root stage. The final transfer in (6.4), in stationary coordinates, is an arbitrarily high iterate of $S$ as $r$ grows. Let $e_(s \, *)$ and $gamma_(q_r \, *)$ denote the connecting operations on cohomology. For a source class $\[ z \]$ represented in $x^a L_s$ and any $a_0$, choosing $r$ sufficiently large gives

$ c_(q_r) e_(s \, *) \( \[ z \] \) = gamma_(q_r \, *) \( \[ z \] \) in "im" \( S^(a_0) M^(b_0) arrow.r X^(b_0) \) . $

The equality holds at our single fixed frame level by Lemma 34. Its scalar is nonzero, so the $e_s$-image belongs to all the displayed subspaces. It lies in the finite space $I_X$ of (6.3).

Thus the image of the whole Koszul edge is countable-dimensional: its positive-lattice part is finite and its remaining source quotient is countable-dimensional. The edge was an epimorphism modulo countable-dimensional spaces at every sufficiently deep level, so $X^(b_0)$ is countable-dimensional at all those levels. This says $T^(b_0) \( k \) = 0$, a contradiction. We have proved that every $X^i$ is countable-dimensional at sufficiently deep joint frame levels.

At $t = 1$ the translation group is diagonalizable and one replaces this pro argument by its exact character decomposition. Constants split equivariantly at every root step, and the normalized constant-character projection retracts inclusion. Fix a divisible stationary step with function exponent $Q$ fixing $k$. In stationary coordinates the retraction says

$ S^r Phi_(Q^r) = 1 \, #h(2em) Phi_(Q^r) \( f \) = f^(Q^r) \, $

as maps of coefficient complexes. Apply the same positive-lattice estimate: a class represented in one sufficiently positive lattice is, after powering and then transfer, represented in $S^a M^i$ for arbitrarily large $a$. The retraction identifies its class with the original one already in compact lattice cohomology. It therefore belongs to the finite intersection $⋂_a S^a M^i$ from (6.1). Pole strips account for a countable-dimensional remainder. This proves the same countability of $X^i$, using neither a positive-dimensional distribution ring nor higher translation Ext in multiplicative height.

#thm([Proposition 6.5.])[
  (Compact coefficient finiteness).  #emph[The first assertion of Theorem 13 holds at $\( n \, t \)$ under the earlier compact assertions in (4.1). In addition, all finite-frame localized coefficients, and the localizations of admissible compact coefficients, have countable-dimensional $P_n$-cohomology.]
] <prop:compact-finiteness>

#proof[
  We have proved countability for functions at sufficiently deep finite frame levels. It descends to any smaller level by finite flat Čech descent. On cochain terms augmentation is exact: finite étale descent has module sections, or a trace-one contraction, and these preserve bounded poles. Pass first to a normal finite frame cover, with deck group $D$. Its Čech coefficient in degree $q$ is a finite product of the deeper-level coefficient indexed by $D^q$. The acting stabilizer $P_n$ fixes this indexing set because its action commutes with the frame action. Thus each such term is a finite direct sum of the already treated $P_n$-coefficient; no new acting-stabilizer representation is introduced here. In each total degree only finitely many terms of its bounded-below cohomological spectral sequence contribute. Countability is therefore preserved in the descent.
  For an admissible extra coefficient, take the finite frame and filtration in Definition 12. Trivial graded pieces reduce to the function calculation. If a finite translation splitting is required, filter its representation over the marked unsplit base. At height greater than one the graded pieces are trivial. At height one a character is a summand of the regular representation of the finite diagonalizable quotient; its associated coefficient is a summand of a finite root ring. Powering identifies this ring, with all actions transported, with the function ring at an adequately deep marking level. The established countability applies to it and its summands. Enlarge any prescribed root ascent to one of the cofinal divisible lift levels; the split filtration pulls back to this level. After the finite marking, its descent uses the translation torsor of Proposition 7. Each degree of its bar construction adds a finite tensor power of the Honda torsion-coordinate algebra. Its $P_n$-action is trivial, so the resulting coefficients are finite direct sums of the treated coefficient. The underlying module splittings preserve bounded poles, and only finitely many bar terms contribute in a fixed total degree. Finite extensions and these two descents prove countability for the localized extra.
  Now let $E$ be a compact admissible coefficient on $C_1$. Its map to $E \[ 1 \/ x \]$ has countable-dimensional cohomological kernel by the strip argument: the boundary restrictions and their conormal twists are admissible and have finite cohomology by induction. Its localized cohomology is countable-dimensional by the preceding paragraph. Hence $H^i \( P_n \, E \)$ is countable-dimensional. It is also profinite by Lemma 17, and is therefore finite. Only finitely many degrees occur.
  For $E$ on $A$ first localize at $x_t$ and pass to the first labeled level. The exact-height countability just proved descends to the unlabeled localization. The strips for powers of $x_t$ have a finite filtration by coefficients on the next starting-height disc, with the specified conormal twists. These satisfy the induction hypothesis after pullback to its labeled strata. The identical countable-kernel argument and compactness prove finiteness on $A$.
  The argument is unaffected by a fixed finite root change: transport the group, its marking and splitting torsors, the filtrations, and all twists by that same power identification. In particular a universal finite torsion construction restricted to a dead-label boundary may be a Frobenius pullback of the smaller universal construction; its frames and splittings are transported from those of that construction. This checks exactly the extra coefficients and their linear duals used in the smaller-height local duality of Proposition 36. ◻
]

The distinction between the two conclusions here is essential for the next step: compact cohomology is finite, whereas the argument so far gives only countability for the algebraic bounded-pole localization. Finiteness of that localization will follow from its boundary support rows in the next section.

== 7 Removing the pole bound <sec:boundary>

We continue the induction of Theorem 13, in the lexicographic order on $\( n \, n - t \)$. At the present pair $\( n \, t \)$, Proposition 35 has established the compact assertion. At every intermediate pair $\( n \, s \)$ with $t < s < n$, we may use the full-frame assertion and its perfected-row refinement, Proposition 50. At $\( s \, t \)$ with $s < n$, we may use compact finiteness for the admissible coefficients of Definition 12, including the norm-character filtrations of Corollary 15. The full-frame assertions at $\( n \, t \)$ will be proved in the next section. On an exact height-$s$ stratum of the original deformation, $P_n$ is the acting stabilizer and $P_s$ is its commuting auxiliary connected-frame group. After the relative splitting, the same $P_s$ also acts as the stabilizer of the smaller height-$s$ deformation disc. Both roles enter the final compact-duality calculation.

We use the algebraic coefficient convention throughout this section. For example, $B_(upright("full") \, s)^(upright("perf"))$ denotes the union of all finite connected and étale marking levels for the pair $\( n \, s \)$ and of their finite Frobenius root extensions. On a profinite source, a cochain in this union uses one finite marking and root stage and one pole bound. The superscript $upright("perf")$ in this notation does not include completion. Powering identifies each fixed root extension with the original coefficient problem, with all actions and line bundles transported together. Thus the uniform full-connected, fixed-étale-level bounds and the fixed scalar subgroup from an earlier induction stage persist in this root union.

#thm([Proposition 7.1.])[
  (Removal of the pole bound).  #emph[Let $1 lt.eq t < n < p - 1$, and retain the notation $A$, $x = x_t$, and $C_1$ of Proposition 4. The bounded-pole continuous cohomology 
$ H^(*) \( P_n \, C_1 \[ 1 \/ x \] ⊗ omega^e \) \, #h(2em) e in bb(Z) \, $

 has finite total dimension over $k$, where $omega$ is the invariant cotangent line of the universal connected formal group. Consequently $H^(*) \( P_n \, B_U \)$ has finite total dimension at every finite joint frame level $U$; in particular this holds for every $B_(K \, V)$.]
] <prop:pole-removal>

We prove the proposition after establishing the relative support calculation. Powers of $omega$ are retained in that calculation; writing the untwisted coefficient in a formula suppresses only that fixed factor.

=== 7.1 The height filtration of support <the-height-filtration-of-support>

Put

$ J_s = \( x_t \, dots.h \, x_(s - 1) \) subset A \, #h(2em) r = s - t \, #h(2em) t < s lt.eq n \, $

and use the convention $x_n = 1$. Successive localization triangles for the closed sets $V \( J_s \)$ filter the support complex $R Gamma_(\( x \)) \( C_1 ⊗ omega^e \)$ by the terms

#[#set math.equation(numbering: n => "(7.1)")
 $ R Gamma_(J_s) \( C_1 ⊗ omega^e \) \[ 1 \/ x_s \] tilde.eq H_(J_s)^(s - t) \( C_1 ⊗ omega^e \) \[ 1 \/ x_s \] \[ - \( s - t \) \] . $ <eq:boundary-support-rows>]

Here $C_1$ is finite free over $A$, and $x_t \, dots.h \, x_(s - 1)$ is a regular sequence on this coefficient. This proves the concentration in the displayed degree. The localization triangles can be computed by finite Čech complexes, so all denominators in any particular element or cochain are finite. Equivalently the local row is the direct limit of Koszul fractions on nilpotent neighborhoods, with continuous coefficient splittings obtained by power-series truncation. Applying continuous $P_n$-cochains therefore gives the same finite support filtration.

The last term, $s = n$, needs no relative deformation. If $L$ is the finite free coefficient on the full formal disc, the residue pairing identifies the continuous dual of its top local cohomology with

$ "Hom"_A \( L \, omega_A \) \, #h(2em) omega_A = and.big^(n - t) Omega_(A \/ k \, upright("cts"))^1 . $

Continuous duality for the orientable group $P_n$, of dimension $n^2$ (Lemma 17), then expresses its $P_n$-cohomology as the dual of compact-coefficient cohomology in complementary degree. The dual bundle is one of the allowed compact extras: finite duality for $C_1 \/ A$ and adjunction identify its canonical line with the volume and conormal lines used in Proposition 35. That proposition proves finiteness for $s = n$. We now treat $t < s < n$.

=== 7.2 Marked deformations over Artin parameter rings <marked-deformations-over-artin-parameter-rings>

On the reduced exact height-$s$ stratum, take a full connected Honda marking and an integral basis of the surviving étale Tate module. There are $e_s = n - s$ surviving basis vectors. The marking and basis towers have group

$ P_s times "GL"_(e_s) \( bb(Z)_p \) . $

Finite étale covers lift uniquely across nilpotent thickenings. We always lift a finite part of these towers to a fixed nilpotent neighborhood before making further constructions.

We use the relative marked-deformation theorem over the nilpotent affine neighborhoods just constructed. Here is its precise application. Let $A_(upright("nil")) arrow.r.twohead S_0$ be one such characteristic-$p$ algebra with nilpotent kernel $I$ and reduced quotient $S_0$, and let the connected formal $p$-divisible group over $S_0$ be identified with $Gamma_s times_k S_0$ by the full Honda marking. The étale quotient lifts uniquely across $I$, so its kernel is the height-$s$ formal $p$-divisible group to which the deformation theorem is applied.

Work successively over $A_(upright("nil")) \/ I^a$. For $a gt.eq 1$ the next kernel $J = I^a \/ I^(a + 1)$ is square-zero; equip it with the trivial nilpotent divided powers. The base has $p = 0$, so the display lifting theorem applies: lifts of the display, with its specified reduction, are classified by lifts of its Hodge filtration #cite(label("ZinkDisplays")) Theorem 48 and Corollary 49. In the dimension-one convention this is the choice of a rank-one Hodge quotient in a rank-$s$ module. The difference between two choices belongs to the Hodge tangent module, a projective module of rank $s - 1$, tensored with $J$. Since $I J = 0$, the Honda marking identifies this tangent module on $J$ with $J^(s - 1)$.

Lifts of a classifying parameter map from $k \[ \[ v_1 \, dots.h \, v_(s - 1) \] \]$ form a torsor under the same module $J^(s - 1)$. The Kodaira–Spencer isomorphism for the universal height-$s$ deformation identifies these two difference actions #cite(label("Lau2010Tate")) Section 5, pp. 226–227. The universal pullback therefore gives an equivariant bijection between the torsors of parameter lifts and of marked-deformation lifts. Affineness ensures that the required lifts of the finite projective Hodge quotient have no further gluing obstruction. The comparison with formal $p$-divisible groups, including the criterion for lifting morphisms over a nilpotent kernel, is #cite(label("ZinkDisplays")) Corollary 95. It gives an actual isomorphism of the pulled-back formal $p$-divisible group with the prescribed marked deformation. For uniqueness, the nilradical of $A_(upright("nil")) \/ I^(a + 1)$ is $I \/ I^(a + 1)$ and is nilpotent, because $S_0$ is reduced. The display functor is therefore fully faithful by #cite(label("ZinkDisplays")) Proposition 99; the injectivity under nilpotent reduction in #cite(label("ZinkDisplays")) Proposition 40 gives uniqueness of the group isomorphism with its prescribed reduction. These results apply to the connected formal group just specified. Induction on $a$ proves the classification and its functorial compatibility over the fixed nilpotent neighborhood.

The successive height congruences set $v_1 \, dots.h \, v_(t - 1)$ equal to zero. Thus the relative parameter ring used here is

#[#set math.equation(numbering: n => "(7.2)")
 $ R' = k \[ \[ v_t \, dots.h \, v_(s - 1) \] \] \, #h(2em) frak(m)' = \( v_t \, dots.h \, v_(s - 1) \) \, $ <eq:boundary-relative-base>]

and $cal(G)$ denotes the corresponding algebraic $p$-divisible group, formed from its finite kernels. The triangular conormal computation in Lemma 37 will identify this parameter filtration with the original transverse filtration.

The finite-stage assertion is coefficientwise. At a fixed nilpotence order the parameter values and every specified finite list of coefficients of the universal isomorphism are elements of the algebraic marking union, hence descend to one common finite marking stage. Equivalently one can record these coefficients on a sufficiently high finite flat torsion group and use finite presentation. This assertion does not select one finite stage for the whole infinite isomorphism series. For every particular finite diagram, the Hodge lifts and their comparison maps involve finite projective modules and finitely many algebraic operations at that stage. They are compatible with the commuting actions by uniqueness. The explicit truncation and idempotent sections in Lemma 37 then supply continuity and a common bounded pole loss for compact cochain sources.

#thm([Lemma 7.2.])[
  (Relative Artin splitting).  #emph[Set $R_N = R' \/ frak(m)' ""^N$. The marked height-$s$ nilpotent neighborhoods above are flat over $R_N$. After adjoining compatible lifts of the surviving étale basis, let $E_N$ be their algebraic union, formed first without the extra coefficient $C_1$. Then 
$ E_N \/ frak(m)' E_N = B_(upright("full") \, s)^(upright("perf")) = : S_s $

 is perfect, and there is a canonical isomorphism 
#[#set math.equation(numbering: n => "(7.3)")
 $ R_N ⊗_k S_s arrow.r^(med tilde.op med) E_N . $ <eq:boundary-artin-product>]

 It is compatible with restriction in $N$, with $P_n$, $P_s$, and the surviving matrix-group action, and with bounded-pole continuous cochains on every compact profinite source. The group translating the lifts remains the group over $R'$ determined by $cal(G)$.]
] <lem:artin-splitting>

#proof[
  We first verify the parameter assertion, including flatness. Write $h$ for the universal isomorphism, oriented by
  $ h compose \[ p \]_(upright("original")) = \[ p \]_(cal(G)) compose h \, #h(2em) c = h' \( 0 \) in E_N^times . $
  Successive height-coordinate congruences show that the parameters below $t$ vanish. Inductively compare the coefficient of $X^(p^i)$ modulo the earlier height parameters, for $t lt.eq i < s$. On that quotient the two $p$-series start with $x_i X^(p^i)$ and $v_i X^(p^i)$, respectively. The isomorphism identity therefore gives $c x_i = c^(p^i) v_i$ modulo the earlier parameters. Induction also identifies the ideals generated by those earlier parameters on the two sides. Passing to the conormal module gives
  $ x_i equiv c^(p^i - 1) v_i + sum_(j < i) b_(i j) v_j med \( mod med J_s^2 \) . $
  Changing the orientation of $h$ inverts this matrix. In particular the diagonal entries are units. The $v_i$ and $x_i$ consequently generate the same transverse ideal and the same ideal-power filtration on every nilpotent neighborhood.
  This conormal calculation is accompanied by a calculation of every parameter graded piece. Before marking, regularity of the transverse parameters gives
  $ "gr"_(J_s) \( A \[ 1 \/ x_s \] \/ J_s^N \) tilde.eq \( A \/ J_s \) \[ 1 \/ x_s \] \[ X_t \, dots.h \, X_(s - 1) \] \/ \( X \)^N . $
  Finite étale marking covers are flat, and this equality therefore base changes to their special-fiber algebras. The triangular change just computed identifies it with the associated graded for $R_N$. Choose a $k$-linear lift of the special-fiber algebra into the marked algebra. Multiplication extends that lift to an $R_N$-linear map from its tensor product with $R_N$. The map is an isomorphism on every associated graded piece, hence is an isomorphism of modules because the filtration is finite. This proves flatness over $R_N$; it is valid regardless of the dimension of the special-fiber algebra as a $k$-vector space. Adjoining a finite set of basis lifts is a finite locally free torsor, so it preserves this flatness. Its filtered union does so as well.
  The group of compatible lifts is
  #[#set math.equation(numbering: n => "(7.4)")
   $ T' = \( T_p cal(G) \)^(e_s) . $ <eq:boundary-relative-translations>]
  On the closed parameter fiber, Proposition 7 identifies its finite lift levels with the successive root rings of the full height-$s$ marked coefficient. Their union is $S_s$, which is perfect.
  We recall the elementary splitting fact that now applies. Let $R$ be a finite local Artin $k$-algebra, let $E$ be a flat $R$-algebra, and suppose $S = E \/ frak(m)_R E$ is perfect. Choose $q = p^a$ large enough to kill the nilpotent ideal by $q$th powers and to act identically on $k$. For $z in S$ define
  $ sigma \( z \) = tilde(z^(1 \/ q))^(thin q) in E \, $
  where the tilde denotes any lift. The result is independent of the lift because the difference of two lifts has zero $q$th power. Using a further root proves independence of sufficiently large $q$. The characteristic-$p$ power identities show that $sigma$ is additive, multiplicative, and $k$-linear. It is functorial in $E$. Flatness gives
  $ "gr"_(frak(m)_R) E = "gr"_(frak(m)_R) R ⊗_k S . $
  Thus $r ⊗ z mapsto r sigma \( z \)$ is an isomorphism on associated graded modules and therefore an isomorphism of algebras. Applying this fact to $E_N \/ R_N$ proves (7.3). Functoriality proves all asserted equivariances and compatibility in $N$. In particular $P_n$ acts only on $S_s$ in this description, whereas $P_s$ acts on both factors in the universal deformation convention.
  We check the topological assertion at the same finite stages. Expansion in the transverse $x_i$ gives continuous additive sections of their finite truncations. At a finite étale marking stage the coefficient module is finite projective. More explicitly, if its presentation is $e_N \( A \[ 1 \/ x_s \] \/ J_s^N \)^d$ and $e_0$ is the reduced idempotent, let $tau$ lift each coordinate by transverse truncation. Then $z mapsto e_N tau \( z \)$ is a continuous additive section on $"im" \( e_0 \)$. Monomial division in the coordinates, followed by $e_N$, extracts the parameter layers. A finite lift-torsor algebra has the finite free torsion-coordinate bases of Proposition 4, and the same construction applies in that basis. The finitely many structure constants and the inverse triangular conormal matrix have a common denominator after localizing at $x_s$. It follows that these additive lifts and successive parameter-coefficient extractions have bounded pole loss and are continuous on a cleared-denominator power-series lattice. For a compact cochain source all of these choices use one finite stage and one bound. In the formula for $sigma$, extracting the $q$th root means moving to one further finite root stage; taking powers and products preserves the stated continuity and merely changes the finite pole bound. The inverse of (7.3) extracts the finitely many parameter layers by the same maps. This proves the assertion for cochains. All tensor products used here have the finite-dimensional algebra $R_N$ as one factor; no completion or infinite parameter tensor product has been introduced. ◻
]

=== 7.3 The full-section coefficient across nilpotents <the-full-section-coefficient-across-nilpotents>

The remaining coefficient $C_1$ must also be identified on these thickenings. Let

$ H_c = cal(G) \[ p \] \/ ker \( F^t \) \, #h(2em) "rank" \( H_c \) = p^(s - t) \, $

where the quotient is the Frobenius-divided kernel over $R'$. It is a finite locally free algebraic group scheme. We write $C_1^(\( s \, t \))$ for the smaller labeled ring of Proposition 4, with total height $s$ and starting height $t$.

#thm([Lemma 7.3.])[
  (Full sections on a split kernel).  #emph[After the lift ascent of Lemma 37, the pullback of $C_1$ is a finite disjoint union of coefficients pulled back from $R'$ of the form 
#[#set math.equation(numbering: n => "(7.5)")
 $ M = C_1^(\( s \, t \)) ⊗_(R') cal(O) \( H_c \)^(⊗ e_s) . $ <eq:boundary-M>]

 An invariant-line twist is the corresponding twist from $cal(G)$. The algebra $M$ is finite free over $R'$, and is free over $C_1^(\( s \, t \))$ with finite torsion-coordinate factors. The decomposition and its group actions hold on arbitrary nilpotent test rings. A sufficiently small surviving matrix congruence subgroup fixes the components and acts trivially on the factors in (7.5). Translation on these factors uses only a finite torsion level.]
] <lem:full-sections>

#proof[
  Recall first the integral full-section presentation. If $H$ is a finite monogenic scheme of rank $p^m$, a label homomorphism $ell : bb(F)_p^m arrow.r H$ is full when the characteristic polynomial of its coordinate equals the product over the label sections, with multiplicities. Equivalently, for every function $f$ on $H$ after arbitrary base change,
  #[#set math.equation(numbering: n => "(7.6)")
   $ det \( m_f : cal(O) \( H \) arrow.r cal(O) \( H \) \) = product_(v in bb(F)_p^m) f \( ell \( v \) \) . $ <eq:boundary-norm-sections>]
  The equivalence follows by polynomial substitution in the characteristic-polynomial identity, or by the resultant formula for the norm. Thus this condition is intrinsic and is preserved by every automorphism of the finite scheme.
  For the Frobenius-divided $\[ p \]$-kernel, Lemma 5 identifies this full-section algebra with $C_1$, including after arbitrary nilpotent base change.
  Over the split lift tower the divided kernel is
  $ H = H_c times E_(upright("et")) \, #h(2em) E_(upright("et")) tilde.eq bb(F)_p^(e_s) . $
  The projection of a full tuple gives a surjection
  $ b : bb(F)_p^(n - t) arrow.r.twohead bb(F)_p^(e_s) . $
  Indeed, if a component of $E_(upright("et"))$ were omitted, take the function which is zero on that component and one on every other component. Its norm is zero, but its product over the proposed sections is one, contradicting (7.6). Projection to the constant étale group is locally constant on the test scheme. We can therefore decompose the full-section scheme into the finitely many open and closed components indexed by these surjections.
  Fix $b$, put $K = ker b$, and choose a complement $W$ to $K$ in the label space. Its dimensions are $s - t$ and $e_s$, respectively. A label homomorphism with this projection is exactly the data of a homomorphism $K arrow.r H_c$ and $e_s$ arbitrary points of $H_c$, the images of a basis of $W$. On each étale component, the proposed tuple is the translate of the kernel tuple by the associated point of $H_c$. To test fullness on one component, take an arbitrary function on that copy of $H_c$ and extend it by $1$ on every other component. Equation (7.6) then reduces exactly to the norm identity for that one component. Conversely, the product of the componentwise identities gives the identity for every function on the whole disjoint union. Translation preserves these norm identities. Thus the original tuple is full if and only if its kernel tuple is full for $H_c$, over every test algebra. The two constructions are inverse without reducing that algebra. The component is therefore
  $ "Full" \( H_c \) times H_c^(e_s) \, $
  whose ring is (7.5).
  The argument uses algebraic translations on the finite group scheme. It does not evaluate a formal power series on an arbitrary localized coordinate; the norm identity supplies the required substitution invariance within the finite algebra. Finite freeness follows from the smaller $C_1$ calculation and finite local freeness of $H_c$. All operations are functorial for changes of deformation framing. Changes of surviving Tate basis act on these particular data through a finite level, since the tuple and the divided kernel are finite-level objects. A sufficiently deep congruence subgroup fixes the chosen labels, complement, and connected factors. The same finite-level observation applies to translations and to each fixed invariant-line or torsion twist. ◻
]

Let $r = s - t$. For a coefficient $M$ in (7.5), with any of the fixed twists just discussed, put

$ cal(H) \( M \) = H_(frak(m)')^r \( M \) . $

This is a discrete union of finite-dimensional $k$-vector spaces. For example, it is computed by the quotients

#[#set math.equation(numbering: n => "(7.7)")
 $ cal(H) \( M \) = "colim"_N M \/ \( v_t^N \, dots.h \, v_(s - 1)^N \) M \, $ <eq:boundary-local-union>]

whose transition is multiplication by $v_t dots.h.c v_(s - 1)$. These maps are injective, since $M$ is free over $R'$ and

$ \( \( v_t^(N + 1) \, dots.h \, v_(s - 1)^(N + 1) \) : v_t dots.h.c v_(s - 1) \) = \( v_t^N \, dots.h \, v_(s - 1)^N \) . $

The rectangular ideals here and the powers of $frak(m)'$ are cofinal. The compatible Artin splittings therefore identify the full split local row with the ordinary tensor product

#[#set math.equation(numbering: n => "(7.8)")
 $ S_s ⊗_k cal(H) \( M \) . $ <eq:boundary-split-local-row>]

The action of $P_n$ is on $S_s$ alone. A fixed finite projective resolution for $P_n$ and the finite-dimensional stages in (7.7) give, with the specified cochain convention,

#[#set math.equation(numbering: n => "(7.9)")
 $ H^i \( P_n \, S_s ⊗_k cal(H) \( M \) \) = H^i \( P_n \, S_s \) ⊗_k cal(H) \( M \) . $ <eq:boundary-split-cohomology>]

The same formulas hold after adjoining any fixed finite list of torsion-coordinate factors from $cal(G)$. In particular the identification keeps the complete nilpotent local-cohomology term.

=== 7.4 Forgetting the varying translation torsor <forgetting-the-varying-translation-torsor>

The earlier full-frame assertion at $\( n \, s \)$ supplies one nontrivial scalar $a in 1 + p bb(Z)_p$ acting identically on $H^(*) \( P_n \, S_s \)$. After taking a power, it also fixes the finite label and torsion data in $M$. It consequently acts identically on (7.9). It conjugates $T'$ by $\[ a \]$ or $\[ a^(- 1) \]$, according to the dual-standard convention. The following calculation treats either convention.

#thm([Lemma 7.4.])[
  (Scalar conjugation and relative translation cohomology).  #emph[On the cohomology rows in (7.9), some subgroup $T'_h = \[ p \]^h T'$ acts trivially. Over an Artin parameter neighborhood, write 
$ Lambda_N = R_N \[ \[ D_1 \, dots.h \, D_delta \] \] \, #h(2em) delta = e_s \( s - 1 \) \, #h(2em) I = \( D_1 \, dots.h \, D_delta \) $

 for the distribution algebra of $T'_h$, transported along $T' tilde.eq T'_h$. If $V$ is a row with trivial $T'_h$ action, then 
#[#set math.equation(numbering: n => "(7.10)")
 $ H^j \( T'_h \, V \) tilde.eq V ⊗_(R_N) and.big^j \( I \/ I^2 \)^or \, #h(2em) 0 lt.eq j lt.eq delta . $ <eq:boundary-relative-koszul>]

 This description is functorial under changes of distribution coordinates and under all the commuting actions.]
] <boundary:translation-descent>

#proof[
  Since $s gt.eq 2$, the special Cartier dual of $cal(G)$ is connected, of dimension $s - 1$. Its formal completion is smooth over $R'$. The completed distribution algebra of $T'$ is therefore a power-series algebra over $R'$ on $delta$ parameters. The representations under consideration are locally killed by a parameter power and locally factor through a finite torsion level. These are the continuous torsion modules for this distribution algebra. To check the topology, modulo $frak(m)'$ the finite dual-kernel quotients are cofinal with powers of their augmentation ideal, because the special dual is connected. At a fixed Artin thickness this cofinality lifts by multiplying exponents by a nilpotence bound. Conversely the coordinates of $\[ p \]$ have no linear term in characteristic $p$, so their iterates tend to zero in the augmentation topology. The inverse limit of these finite distribution quotients is precisely $Lambda_N$.
  Suppose first that $a$ conjugates translations by $\[ a \]$, and let $sigma_a = \[ a \]^(*)$ on the distribution algebra of $T'$. As $a$ acts identically on the row, the ideal
  $ J_a = \( sigma_a \( f \) - f : f in Lambda_N \) $
  annihilates it. Write $F$ for the formal group law on the Cartier dual. The identity
  $ F \( \[ a \] \( D \) \, \[ - 1 \] \( D \) \) = \[ a - 1 \] \( D \) $
  shows that the coordinates of $\[ a - 1 \] \( D \)$ belong to $J_a$. Conversely, $F \( D \, \[ a - 1 \] \( D \) \) = \[ a \] \( D \)$ shows that $\[ a \] \( D \) - D$ belongs to the ideal of those coordinates. Thus
  $ J_a = \( \[ a - 1 \]_1 \( D \) \, dots.h \, \[ a - 1 \]_delta \( D \) \) . $
  If $a - 1 = p^h u$ with $u in bb(Z)_p^times$, the automorphism $\[ u \]$ gives
  $ J_a = \[ p^h \]^(*) \( I \) . $
  This is the image of the augmentation ideal for restriction to $\[ p \]^h T'$, so that subgroup acts trivially. With $a^(- 1)$ in place of $a$, its difference from $1$ has the same $p$-adic valuation and the argument is identical. The chosen scalar is uniform on the special cohomology and the coefficient $M$ is one fixed finite construction, so $h$ is uniform over its local-cohomology union.
  It remains to justify the relative cohomology calculation. The sequence $D_1 \, dots.h \, D_delta$ is regular in $R_N \[ \[ D \] \]$, even though $R_N$ itself can have nilpotents: successive quotients are the power-series rings in the remaining variables over $R_N$, and multiplication by the next variable is injective. Its Koszul complex is a finite free resolution of $R_N$ over $Lambda_N$. Applying continuous $"Hom"$ to a row annihilated by $I$ gives zero differentials, and hence (7.10). No flatness of the row over $R_N$ is required.
  This Ext calculation is also the torsor-descent calculation being used here. At finite levels the lift algebras are finite locally free, with the unit a local basis vector, and their augmented descent diagrams are split as base-module diagrams on affine covers. Their flat union supplies the relative continuous bar construction. Over $R_N$, its completed distribution resolution and the Koszul resolution are resolutions split over the base: unit insertion and monomial division give continuous contractions of their augmented complexes. An induced completed bar term $Lambda_N hat(⊗)_(R_N) W$ lifts along a continuously $R_N$-split surjection by its $R_N$-linear splitting; finite free Koszul terms have the same lifting property. Induction along the two resolutions therefore gives continuous comparison maps in both directions and comparison homotopies. Alternatively continuous $"Hom"$ from each finite free Koszul term commutes with the union of torsion coefficients. Consequently both resolutions compute the same relative Ext. Its exterior description is canonically the exterior algebra on the dual augmentation conormal, so nonlinear changes of parameters give the asserted action. All the calculations are made at a common Artin thickness before passing to the local-cohomology union. ◻
]

The exterior bundles in (7.10) are tensor constructions from the Lie bundle of $cal(G)^or$, with the standard matrix-label action. A small matrix congruence subgroup acts trivially on that label representation in characteristic $p$. They are therefore among the extra bundles allowed in the smaller compact calculation. Notice that this argument uses the dimension $s - 1$ of the relative Cartier dual; it does not replace the varying translation group by a constant formal group.

=== 7.5 Individual matrix-group rows <individual-matrix-group-rows>

We need finiteness after taking the surviving matrix invariants on individual $P_n$-cohomology rows. Here is the algebraic implication which supplies it from the full-connected, fixed-étale-level assertion.

#thm([Lemma 7.5.])[
  #emph[Let $V$ be a torsion-free pro-$p$ compact $p$-adic analytic group, and let $C$ be a bounded complex of smooth $k \[ V \]$-modules. If $R Gamma \( V \, C \)$ has finite-dimensional cohomology in each degree, then 
$ H^a \( V \, H^i \( C \) \) $

 is finite-dimensional for every $a \, i$. These groups are zero outside finitely many $\( a \, i \)$ when $C$ has bounded cohomology.]
] <boundary:row-finiteness>

#proof[
  Take the full $k$-linear dual, with its product topology, and put $Omega = k \[ \[ V \] \]$. This duality is exact from discrete vector spaces to pseudocompact vector spaces and exchanges smooth $V$-modules with pseudocompact $Omega$-modules. The ring $Omega$ is local and Noetherian. The dual bounded complex $D = C^or$ has degreewise finite derived completed reduction
  $ k hat(⊗)_Omega^(bb(L)) D tilde.eq R Gamma \( V \, C \)^or . $
  We recall why this implies finite generation of each $H^j \( D \)$. All differentials in $D$ have closed image, so its cohomology is pseudocompact. At the highest nonzero cohomological degree $b$, right t-exactness of derived completed tensor gives
  $ H^b #h(-0.16667em) (k hat(⊗)_Omega^(bb(L)) D) = k hat(⊗)_Omega H^b \( D \) . $
  Thus the ordinary completed reduction of $H^b \( D \)$ is finite. Lift a finite set of generators of that reduction to cycles. Their $Omega$-span is closed, because it is the image of a finite free pseudocompact module. Its quotient has zero completed reduction, and is zero by compact Nakayama: a nonzero pseudocompact quotient has a nonzero finite simple quotient, which for the local algebra $Omega$ is $k$. Thus these finitely many cycles generate $H^b \( D \)$.
  Map the finite free module on these cycles into $D$, in degree $b$, and take its cone. The cone has no cohomology in degree $b$ and still has degreewise finite derived reduction. Repeat downwards. In recovering the cohomology of the preceding complexes, all kernels inside finite free modules are finitely generated by Noetherianity. The exact sequences of these cones therefore prove finite generation of every original $H^j \( D \)$; only finitely many cone steps are needed for each degree. For a finitely generated pseudocompact $Omega$-module $M$, choose a resolution of $M$ whose terms are finite-rank free pseudocompact $Omega$-modules. Such a resolution is constructed successively: the kernel at each step is closed and finitely generated because $Omega$ is Noetherian. Completed tensoring this resolution with $k$ gives finite-dimensional terms in every degree. Consequently every $"Tor"_a^Omega \( k \, M \)$ is finite-dimensional. The finite projective dimension of the trivial module $k$ supplies the vanishing range $a > dim \( V \)$. Applying these facts to the finitely generated cohomology modules of $D$ and using duality proves the assertion for $H^a \( V \, H^i \( C \) \)$. The bounded range for $i$ gives the asserted finite total range. ◻
]

Apply the lemma to $C = R Gamma \( P_n \, B_(upright("full") \, s)^(upright("perf")) \)$, using the fixed finite $P_n$-resolution. Its terms and cohomology are smooth for the surviving matrix group: a cochain uses one finite stage. The finite group resolution computes the same invariants in the smooth category and with the bounded-pole convention, since in either case its terms are the same finite sums and retracts of the coefficient modules. Descent of the full étale frame tower gives

$ R Gamma \( V \, C \) tilde.eq R Gamma \( P_n \, B_(upright("conn") \, V \, s)^(upright("perf")) \) . $

At finite levels this is ordinary finite étale torsor descent; the augmented coefficient diagrams have module splittings, and the common-stage convention passes the assertion to the union. The earlier full-frame assertion makes the right-hand side finite. Thus, for all sufficiently small open matrix groups $V$,

#[#set math.equation(numbering: n => "(7.11)")
 $ dim_k H^a #h(-0.16667em) (V \, H^i \( P_n \, B_(upright("full") \, s)^(upright("perf")) \)) < oo . $ <eq:boundary-row-finiteness>]

An arbitrary compact open follows by finite-index descent. The commuting $P_s$-action on these groups is smooth and therefore factors through a finite quotient. We also need the representation-theoretic refinement furnished by the completed earlier stage. Put

$ nu_s : P_s arrow.r^("Nrd") bb(Z)_p^times arrow.r bb(F)_p^times subset k^times . $

By Proposition 50, each actual row

#[#set math.equation(numbering: n => "(7.12)")
 $ Q_(a \, i \, V) = H^a #h(-0.16667em) (V \, H^i \( P_n \, B_(upright("full") \, s)^(upright("perf")) \)) $ <eq:boundary-norm-row>]

has a finite $P_s$-stable filtration with one-dimensional successive quotients $k \( nu_s^j \)$. The exponents may depend on the row. Its linear dual has the dual filtration, with successive quotients $k \( nu_s^(- j) \)$. This is the additional structure that permits these particular constant factors in the smaller-disc compact calculation.

Only the previously proved induction stage $\( n \, s \)$, with $s > t$, is used here. After the full-frame calculation and Proposition 50 are proved at $\( n \, t \)$, the same conclusions become available for its use in subsequent pole-removal stages. Thus both the finite-dimensional row assertion and its norm-character refinement follow the same lexicographic induction.

=== 7.6 Final descent and compact duality on the smaller disc <final-descent-and-compact-duality-on-the-smaller-disc>

#proof[
  For an intermediate support row $t < s < n$, perform the marked and split ascent of Lemmas 37 and 38. The resulting coefficient is (7.8). First take $P_n$-cohomology, then forget the subgroup $T'_h$ supplied by Lemma 39. The cohomology rows are the tensors in (7.9) with the finite exterior bundles in (7.10).
  Take next the invariants of a sufficiently small surviving matrix group $V$, chosen also to fix all finite label and torsion factors being considered. The finite resolution for $V$ commutes with the discrete union (7.7). Its individual cohomology terms consequently have the form
  #[#set math.equation(numbering: n => "(7.13)")
   $ Q ⊗_k H_(frak(m)')^r \( M ⊗_(R') F \) . $ <eq:boundary-before-Ps>]
  Here $Q$ is one of the actual rows (7.12), and $F$ is a finite free tensor construction from the Lie bundle of $cal(G)^or$, invariant lines, and the fixed additional finite torsion-coordinate bundles. In particular $Q$ is finite and its $P_s$-composition factors are norm powers. Every fixed bar degree adds only such universal torsion-coordinate factors to $F$; the special coefficient producing $Q$ remains $B_(upright("full") \, s)^(upright("perf"))$.
  We finally take $P_s$-cohomology. The residue pairing on the $r$-dimensional disc identifies the continuous dual of the local term in (7.13) with
  $ L_(M \, F) = "Hom"_(R') \( M ⊗_(R') F \, omega_(R') \) \, #h(2em) omega_(R') = and.big^r Omega_(R' \/ k \, upright("cts"))^1 . $
  The group $P_s$ is orientable of dimension $s^2$, and continuous group duality therefore gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ H^b #h(-0.16667em) (P_s \, Q ⊗_k H_(frak(m)')^r \( M ⊗ F \))^or tilde.eq H^(s^2 - b) \( P_s \, Q^or ⊗_k L_(M \, F) \) . $ <eq:boundary-Matlis-duality>]
  First we verify that $L_(M \, F)$ is an admissible compact coefficient at the smaller pair $\( s \, t \)$, whose total height is strictly less than $n$. The algebra $M$ is free over $C_1^(\( s \, t \))$ and consists of finite torsion-coordinate factors. On each successive labeled boundary stratum of that smaller disc, finite root transport identifies the construction with the corresponding height-stratum construction. After finite connected and étale markings and a finite splitting level, its divided connected kernels and finite étale sections have the required constant frames. The Lie and invariant-line factors have the same property. Finite tensor constructions and linear duals preserve these filtrations. If a multiplicative connected kernel occurs, its character factors are summands of the finite regular translation representation; its associated coefficient is the finite root ring allowed in the compact assertion. Finally finite duality gives
  $ "Hom"_(R') \( M ⊗ F \, omega_(R') \) tilde.eq "Hom"_(C_1^(\( s \, t \))) \( M ⊗ F \, omega_(C_1^(\( s \, t \))) \) \, $
  and the volume construction and conormal adjunction supply the required filtration for this canonical-line twist. This proves admissibility of $L_(M \, F)$.
  Now use the finite $P_s$-stable filtration of $Q^or$ from (7.12). Tensoring it with $L_(M \, F)$ gives a finite filtration with successive coefficients
  $ L_(M \, F) ⊗_k k \( nu_s^(- j) \) . $
  Lemma 14 identifies the constant norm line through the determinant of the universal height-$s$ $p$-divisible group and proves its admissibility on every required stratum. Thus these successive coefficients are admissible by Corollary 15. Their compact $P_s$-cohomology is finite by the earlier compact assertion at $\( s \, t \)$. The finite-dimensional filtration of $Q^or$ splits over $k$ as a filtration of vector spaces; after tensoring with $L_(M \, F)$, its coefficient sequences therefore have continuous underlying module splittings. Their long exact cohomology sequences prove finiteness for $Q^or ⊗_k L_(M \, F)$. Consequently (7.14) is finite-dimensional. The acting group in this application is $P_s$ throughout.
  These successive computations are legitimate descent spectral sequences for the coefficient under consideration. At an Artin stage, adjoining finite free translation coordinates commutes with $P_n$-cochains because those coordinates come from $cal(G) \/ R'$ and $P_n$ fixes $R'$. Flat torsor descent and the finite-module splittings described above give the bar construction before taking the local row. The compatible finite-thickness calculations then give it on that row. Thus one may filter first by $P_n$-, then by translation-, and then by matrix-group cohomology before taking $P_s$-cohomology. Each final contribution is a group of the form (7.14). All group degrees are nonnegative, and the one local-cohomology shift is the fixed integer $r$.
  There is still the finite translation quotient $T' \/ T'_h$ to forget. Use its augmented bar construction. In bar degree $q$ it adds $q$ finite torsion-coordinate factors of $cal(G)$, of one fixed finite torsion order. They are finite free over $R'$, and $T'_h$ acts trivially on them. The calculation just given applies in every bar degree, with these factors included in $M ⊗ F$. A further matrix congruence restriction fixes their finite-level label actions. For every resulting open matrix group, the representation assertion of Proposition 50 still applies to its special cohomology rows. The factors added in the finite quotient bars remain in the universal bundle $M ⊗ F$, so the same norm-filtration argument applies in each bar degree. There are only finitely many bar degrees in a fixed total degree, so this descent preserves finite-dimensionality in each degree. The same reasoning forgets the finite quotients used to fix label components or to replace a matrix group by a small open subgroup. Forgetting the full connected marking is exactly the $P_s$ step above. We have proved that every support row in (7.1) has finite-dimensional $P_n$-cohomology. Its intrinsic $P_n$ cohomological bound is $n^2$, so its total cohomology is finite.
  The endpoint $s = n$ was treated by compact duality at the beginning of the section. The finite height-support filtration therefore has finite total $P_n$-cohomology. Compact finiteness on $C_1$, together with the localization triangle
  $ R Gamma_(\( x \)) \( C_1 ⊗ omega^e \) arrow.r C_1 ⊗ omega^e arrow.r C_1 \[ 1 \/ x \] ⊗ omega^e \, $
  proves the first assertion of the proposition.
  For completeness, this yields every finite frame level as follows. After the first étale basis level, the leading connected marking is tame and decomposes into powers of the invariant line. All subsequent sufficiently deep normal finite joint levels have finite $p$-group deck transformations. Their regular representations over $k$ have finite filtrations by trivial representations. The associated coefficient bundles consequently have finite filtrations by the invariant-line coefficients already treated. The filtrations split as modules on localization, so they give exact sequences of bounded-pole continuous cochains. This proves finite total cohomology at all such sufficiently deep levels. Any prescribed finite joint level is below one of these. Finite torsor descent and its cohomological spectral sequence prove finite-dimensionality in each degree there as well. The fixed cohomological bound for $P_n$ again gives finite total dimension. Every step admits arbitrary compact profinite-source parameters by the common-thickness, common-stage, and bounded-pole constructions above. The asserted finiteness is finiteness of the resulting cohomology groups over $k$. ◻
]

== 8 Full frames and completion of the coefficient induction <full:section>

Fix $1 lt.eq t < n < p - 1$, and retain the notation

$ m = n - t \, #h(2em) G = "GL"_m \( bb(Z)_p \) \, #h(2em) U_0 = P_t times G . $

For compact open subgroups $K subset P_t$ and $V subset G$, write

$ B_(K \, V) = B_(K times V) \, #h(2em) B_(upright("conn") \, V) = "colim"_K B_(K \, V) \, #h(2em) B_(upright("full")) = "colim"_(K \, V) B_(K \, V) . $

These are algebraic unions. A cochain with values in one of them uses a common finite frame level and a common pole bound on its compact source. The same convention applies when an algebraic union of Frobenius roots is adjoined. In particular, none of these unions denotes an analytic completion.

We complete the induction of Theorem 13. Connected-frame cohomology at each fixed matrix level will be finite, and the perfected full-frame rows will have the norm-character filtrations needed on subsequent boundary strata. At the current pair $\( n \, t \)$ we use compact finiteness and removal of the pole bound, already supplied by Propositions 35 and 36. No chosen constant classes are needed for this induction step.

The construction has three stages. First, a dual coefficient complex turns the stable transfer image into compact supports on the independent extension locus. Scalar symmetry of that support calculation makes deep translations trivial on cohomology. Compact-group duality then gives finiteness at full connected level. Finally, we follow the actual root inclusions to determine the norm characters on each perfected cohomology row. Section 11 will use the same dual complex to identify the action of the specified constant classes on the coefficient unit.

All complexes in this section use cohomological grading. The algebraic dual $C^(*) = "Hom"_k \( C \, k \)$ has $\( C^(*) \)^(- i) = "Hom"_k \( C^i \, k \)$ and the usual dual differential. For a compact complex we also use its continuous dual $C^or$. Constant stabilizer cochains act on either dual by the graded transpose of their cup action. Equivalently, the dual is a module over the same cochain algebra in the derived category, with the duality signs.

=== 8.1 The cutoff after finiteness <the-cutoff-after-finiteness>

Let $cal(E)_U \( N \)$ be the coefficient bundle associated to a finite translation representation $N$ at a joint frame level $U$ on which its auxiliary actions are defined. Fix once and for all a bounded finite projective resolution for $P_n$ and use it to write

$ C_U^bullet \( N \) = C^bullet \( P_n \, cal(E)_U \( N \) \) . $

Its degrees lie in $\[ 0 \, n^2 \]$. The associated-bundle functor is exact on the coefficient modules under consideration: finite flat descent and module splittings on the punctured affine base give exactness before cohomology. It remains exact with the stipulated continuous parameters.

The regular translation representations will be denoted $N_r$, where $r$ ranges through the divisible progression of Lemma 11. Thus $cal(E)_U \( N_r \)$ is the corresponding lift/root algebra. The transition $N_(r') arrow.r N_r$ is normalized Hopf integration. In stationary coordinates the induced cochain transition is the transfer operator, denoted $S$ in this subsection. The progression is chosen to fix $k$, so this operator is $k$-linear.

#thm([Lemma 8.1.])[
  (Finite stable images).  #emph[At a sufficiently deep fixed frame level, let $P = x^(- b) L$ be a transfer-stable compact lattice as in Proposition 29. The map 
$ H^i \( P_n \, P \) arrow.r H^i \( P_n \, B_U \) $

 identifies the stable images of transfer on its source and target. Consequently the transpose comparison remains valid when the compact lattice is replaced by the entire bounded-pole coefficient. The resulting comparison of dual direct-limit complexes preserves constant stabilizer cochains and finite-level trace maps.]
] <full:stable-cutoff>

#proof[
  Put $M = H^i \( P_n \, P \)$ and $X = H^i \( P_n \, B_U \)$. Both are finite-dimensional: this is Proposition 35 for $M$ and Proposition 36 for $X$. Their comparison kernel is locally transfer-nilpotent. Indeed a primitive in the bounded-pole complex has some finite pole bound, and sufficiently many transfers carry that primitive into $P$.
  Choose cocycle representatives for a basis of $X$. They have a common pole bound, which is carried into $P$ by an iterate of transfer. Hence $S^a X$ is contained in the image of $M$ for some $a$. On a finite vector space, the stable image $X_(upright("inv")) = ⋂_a S^a X$ is the largest subspace on which $S$ is invertible; the complementary generalized zero-eigenspace is nilpotent. The same holds for $M$. The two preceding observations show that $M_(upright("inv")) arrow.r X_(upright("inv"))$ is surjective and has zero kernel.
  The direct limit of the dual transfer system is the dual of the stable image. This proves the comparison on cohomology in every degree. For the assertion on complexes, use the natural zigzag
  $ C^bullet \( P_n \, B_U \)^(*) arrow.r C^bullet \( P_n \, P \)^(*) arrow.l C^bullet \( P_n \, P \)^or $
  and take the direct limits of transpose transfer. The second arrow is the inclusion of continuous functionals. The compact cochain terms and their closed images have exact continuous duality; algebraic vector space duality is exact as well. Since the compact cohomology groups are finite, the second arrow is a cohomology isomorphism. The stable-image argument gives the same assertion for the first arrow after the direct limit. Filtered colimits are exact and the complexes are bounded, so the zigzag consists of quasi-isomorphisms after that limit.
  All its arrows are restriction, inclusion of functionals, or transpose transfer. Their compatibility with cup products and with finite-frame trace is the compatibility in Lemma 11 and Proposition 29. No choice of a basis of $M$ or $X$ is used to define these arrows. ◻
]

=== 8.2 A dual complex with translation action <a-dual-complex-with-translation-action>

Take algebraic duals of the regular-representation complexes and form the filtered colimit over translation levels and joint frame levels:

#[#set math.equation(numbering: n => "(8.1)")
 $ cal(D) = "colim"_(U \, r) C_U^bullet \( N_r \)^(*) . $ <full:dual-complex>]

In the translation direction the arrows are dual to Hopf transfer; in the frame direction they are dual to finite-level trace. This notation means a filtered colimit of complexes, and does not require every displayed arrow to have been written as an inclusion. Each finite diagram is taken at one sufficiently deep frame level. The result is a bounded complex of rational $T$-representations, with a commuting smooth $U_0$-action and with the constant stabilizer cochain action.

Here a rational representation of the affine group scheme $T$ is a comodule for its coordinate Hopf algebra. Each vector belongs to a finite-dimensional subcomodule and uses a finite translation level. This is distinct from an action of the group of geometric points of $T$. Write $T_h = \[ p \]^h T$, with $h$ in the same divisible progression as above. For $t > 1$ its distribution algebra is, after stationary identification,

$ Lambda_h tilde.eq k \[ \[ D_1 \, dots.h \, D_d \] \] \, #h(2em) d = m \( t - 1 \) . $

For $t = 1$, $T_h$ is diagonalizable and its invariants are exact.

#thm([Lemma 8.2.])[
  (Trace descent for the dual complex).  #emph[Let $U = K times V$. There is a natural equivalence 
#[#set math.equation(numbering: n => "(8.2)")
 $ R Gamma #scale(x: 120%, y: 120%)[\(] U \, R Gamma \( T_h \, cal(D) \) #scale(x: 120%, y: 120%)[\)] tilde.eq C^bullet \( P_n \, B_(K \, V)^(\( h \)) \)^(*) \, $ <full:dual-descent>]

 where $B_(K \, V)^(\( h \))$ denotes the corresponding lift/root coefficient. Taking $h = 0$ means the trivial translation representation. The equivalence is compatible with transpose cup actions. Under it, corestriction in $K$ or $V$ is dual to pullback of bounded-pole coefficients. Power transport identifies the questions about $B_(K \, V)^(\( h \))$ with those about $B_(K \, V)$, retaining ordinary $bb(F)_p$-cochains.]
] <full:trace-descent>

The notation $B_(K \, V)^(\( h \))$ in (8.2) is the $U = K times V$ instance of the regular-representation coefficient $cal(E)_U \( N_h \)$ described above, at the $h$th lift/root level of (3.7).

#proof[
  First keep the translation level finite. If $U' lt.closed U$ is a smaller frame level, its coefficient algebra is a finite torsor for $H = U \/ U'$. Over the quotient algebra $A$, faithfully flat trivialization makes it a regular $A \[ H \]$-module. Projectivity over $A \[ H \]$ descends, and $A \[ H \]$ is free as a $k \[ H \]$-module; hence the additive coefficient module is projective for the finite deck group. The same argument applies to the descended coefficient bundles. Coinvariants identify with the lower-level coefficient by trace: on a trivialized torsor this is the augmentation of the regular module. The fixed finite projective $P_n$-resolution takes equivariant finite sums and retracts, so both assertions hold on its cochain terms.
  Dual terms are consequently acyclic for deck-group invariants, with invariants equal to the required dual coefficient at the lower level. Passing to the smooth union preserves this calculation. Indeed a continuous cochain with discrete smooth values has finite image on a compact source; that image and all its stabilizers are visible at one finite quotient. Thus the continuous bar calculation is the filtered union of these finite calculations.
  For translations, test a term of (8.1) against any finite-dimensional rational representation $W$. Its equivariant Hom is the dual of the associated-bundle functor evaluated on $W^(*)$. That functor is exact. Hence the term is injective in the category of rational $T$-representations. Here finite tests suffice: in extending a map from a subcomodule, any new vector lies in a finite-dimensional subcomodule $W$. Its intersection with the domain is finite dimensional, so exactness extends the map across $W$ and then across their sum. The maximal-extension argument proves injectivity. The restriction to $T_h$ remains injective: induction across the finite quotient $T \/ T_h$ is exact, as is seen on its finite locally free Hopf algebra.
  Translation invariants of these terms are therefore computed without higher termwise cohomology. They recover the dual coefficient of the trivial translation representation; $T_h$-invariants recover the indicated finite lift level. The bounded complex permits taking this calculation before the compact frame-group calculation. This proves (8.2).
  At a finite deck level, dualizing pullback gives trace. The induced map on the invariant calculation is precisely corestriction, by the regular-module norm formula. This proves the assertion about frame transitions, including its direction. The remaining assertions follow from the equivariant powering identities of Lemma 11. In particular, powering preserves constant $bb(F)_p$-cochains even before a scalar extension has been chosen to make every stationary operator $k$-linear. ◻
]

#thm([Proposition 8.3.])[
  (Full-frame support comparison).  #emph[Let $R = \( cal(O)_E \/ pi.alt \)^a$, with $pi.alt = p^flat$, and let $Z = \( N_t^m \)_(upright("ind"))$ be the independent extension locus of Theorem 19. Use the geometric coefficient $cal(A) = \( cal(O)^(flat \, +) \/ pi.alt \)^a$ of Section 5. There is an equivalence 
#[#set math.equation(numbering: n => "(8.3)")
 $ cal(D) ⊗_k R tilde.eq R Gamma_c \( Z \; cal(A) \) ⊗ chevron.l eta chevron.r \[ m + n^2 \] $ <full:eq-three>]

 after forgetting translations. It is $U_0$-equivariant and linear for the action of ordinary constant stabilizer cochains. It is also compatible with all finite-frame trace maps used in Lemma 42.]
] <prop:full-frame-comparison>

#proof[
  Apply Proposition 29 at a sufficiently deep fixed frame level. Lemma 41 replaces its compact lattice by the bounded-pole coefficient without changing the dual transfer colimit. We obtain, naturally in the frame level, the comparison with the compact support calculation on $\[ Z \/ U \]$, with the shift $m + n^2$ and the volume character shown in (8.3).
  Now pass up all finite frame covers using transpose trace. On the geometric presentation this removes compact invariants. More explicitly, finite cover descent computes the supported complexes with locally constant parameters on the compact deck groups. A finite diagram of those parameters is defined at one finite quotient. Passing to all covers therefore gives the supported complex on $Z$. This is the same smooth-union descent used in Lemma 42. The buffered support and coefficient comparisons of Proposition 29 are made on those finite diagrams before taking the union, so their arrows pass to this limit as well.
  Continuous compact-group duality supplies the transpose of the cup action, the residue pairing supplies the shift by $m$, and the geometric torsor comparison supplies the structural map to $B P_n$. These are comparisons of complexes with their actions. Thus the result retains the asserted constant-cochain action, rather than only the dimensions of its cohomology groups. ◻
]

=== 8.3 Finite cohomology and the scalar assertion <finite-cohomology-and-the-scalar-assertion>

#thm([Lemma 8.4.])[
  (Homotheties and deep translations).  #emph[Let $M$ be a rational $T$-representation with a compatible action of a scalar $a in 1 + p bb(Z)_p$, $a eq.not 1$, conjugating $T$ by multiplication by $a$ or $a^(- 1)$. If $a$ acts as the identity on $M$, then $T_h$ acts trivially on $M$ for sufficiently large $h$. A single $h$ works for a family of such modules on which this same scalar is the identity.]
] <full:scalar-translation>

#proof[
  Suppose first that $t > 1$. In the distribution algebra $Lambda$, the ideal generated by $f compose \[ a \] - f$ annihilates $M$; replacing $a$ by $a^(- 1)$ does not change the argument. The formal group identity
  $ \[ a - 1 \] \( z \) = F \( \[ a \] \( z \) \, \[ - 1 \] \( z \) \) $
  shows that the coordinates of $\[ a - 1 \]$ belong to this ideal. This follows also by setting the two inputs of $F \( X \, \[ - 1 \] \( Y \) \)$ equal: its coordinates vanish when $X = Y$, and hence lie in the ideal generated by $X_i - Y_i$. Writing $a - 1 = p^h u$ with $u in bb(Z)_p^times$ shows that the ideal contains the coordinates of $\[ p \]^h$. The image of the augmentation ideal under the distribution-algebra map for $T_h arrow.r.hook T$ therefore annihilates $M$. This is exactly triviality of the $T_h$-action.
  At $t = 1$, decompose $M$ into characters of the diagonalizable translation group. Conjugation by $a$ carries the character $chi$ to $a chi$. If $a$ acts identically on $M$, every character occurring in $M$ satisfies $\( a - 1 \) chi = 0$. It is consequently trivial on $T_h$ for $h gt.eq v_p \( a - 1 \)$. Both arguments depend only on $a$, not on a choice of vectors in $M$. ◻
]

We will also use the following compact duality calculation. The orientation character of $P_t$ is trivial, since the determinant of its adjoint action is one.

#thm([Lemma 8.5.])[
  (Corestriction to full connected level).  #emph[Let $M$ be a finite-dimensional smooth $k$-representation of $P_t$. For a cofinal sequence of sufficiently small compact open subgroups $K subset P_t$, inverse limit with corestriction gives 
$ "proj lim"_(K \, upright("cor")) H^c \( K \, M \) = 0 quad \( c eq.not t^2 \) \, #h(2em) "proj lim"_(K \, upright("cor")) H^(t^2) \( K \, M \) tilde.eq M . $

 The last isomorphism uses a fixed orientation and is natural for commuting endomorphisms of $M$. More generally, for a bounded smooth $P_t$-complex $C$ with finite-dimensional cohomology, it gives 
#[#set math.equation(numbering: n => "(8.4)")
 $ "proj lim"_(K \, upright("cor")) H^ell #scale(x: 120%, y: 120%)[\(] R Gamma \( K \, C \) #scale(x: 120%, y: 120%)[\)] tilde.eq H^(ell - t^2) \( C \) . $ <full:connected-complex-limit>]

 This identification is natural for maps of coefficient complexes, including degree-shifted maps. Normal connected levels retain the commuting actions and the action of $P_t$ by conjugation.]
] <full:corestriction>

#proof[
  Shrink $K$ so that it acts trivially on $M$. Compact group duality identifies the dual of corestriction in degree $c$ with restriction in degree $t^2 - c$, with the dual coefficient and the orientation character. The latter character is trivial here. In a restriction colimit over open subgroups, positive-degree continuous cohomology with finite discrete coefficients vanishes: a normalized cocycle and its finite diagram factor through a finite quotient, and restriction to the kernel makes its positive-degree class zero. Degree zero retains the underlying coefficient. This proves the assertion by duality.
  For the complex assertion, use the bounded spectral sequence
  $ E_2^(c \, j) \( K \) = H^c \( K \, H^j \( C \) \) arrow.r.double H^(c + j) #scale(x: 120%, y: 120%)[\(] R Gamma \( K \, C \) #scale(x: 120%, y: 120%)[\)] . $
  All its groups at a fixed level are finite over the finite field $k$, so their inverse systems are Mittag–Leffler. Taking the inverse limit is exact on these systems and retains only the column $c = t^2$. There are finitely many groups and pages in each total degree; no derived inverse-limit term remains. This proves (8.4). Naturality of the spectral sequence and of compact duality proves naturality also for a map $C arrow.r C' \[ r \]$. Conjugation preserves the chosen orientation because its adjoint determinant is one, so normal levels preserve the stated $P_t$-action as well. ◻
]

#thm([Proposition 8.6.])[
  (Completion of the joint induction).  #emph[For every compact open $V subset G$, the graded vector space 
$ H^(*) \( P_n \, B_(upright("conn") \, V) \) $

 has finite total dimension. There is an integer $e$, depending on $\( n \, t \)$, such that the scalar subgroup $1 + p^e bb(Z)_p subset G$ acts identically on $H^(*) \( P_n \, B_(upright("full")) \)$. The same scalar subgroup acts identically after adjoining the algebraic union of Frobenius roots. Together with Proposition 50 below, these statements complete the full-frame part of Theorem 13 at the current induction step.]
] <full:joint-completion>

#proof[
  By Proposition 25, every scalar in $1 + p bb(Z)_p$ acts identically on the compact support cohomology of $Z$: it fixes the plane and flag parameters and has trivial reduced orientation character. Its character on the volume line is also trivial. Proposition 43 and faithful almost scalar extension therefore give the same scalar identity on $H^(*) \( cal(D) \)$.
  Choose such an $a eq.not 1$. By Lemma 44, a single $T_h$ acts trivially on all these cohomology groups. Increase $h$ into the prescribed divisible progression. The translation hypercohomology spectral sequence then has rows
  #[#set math.equation(numbering: n => "(8.5)")
   $ H^q \( cal(D) \) ⊗_k and.big^b \( frak(m)_(Lambda_h) \/ frak(m)_(Lambda_h)^2 \)^(*) \, #h(2em) 0 lt.eq b lt.eq d . $ <full:translation-rows>]
  This is the augmentation Koszul calculation for the regular distribution algebra. The induced auxiliary action on Ext is the linear action on its cotangent space, even though an auxiliary automorphism of the full distribution algebra may be nonlinear. At $t = 1$ only the column $b = 0$ is present, by exactness of invariants.
  Apply $V$-cohomology to the rows in (8.5). After tensoring with $R$, the flag resolutions of Proposition 25 and Shapiro’s lemma reduce their cohomology to that of compact parabolic subgroups with finite-dimensional coefficient representations. Those groups are compact analytic groups without $p$-torsion; their finite projective resolutions give finite-dimensional cohomology in a bounded range. There are only finitely many flag types and finite exterior factors. The resulting bounds descend before almost scalar extension by the bounded almost-length argument of Corollary 26: every finite-dimensional subspace of a $k$-cohomology group contributes its dimension to the length after tensoring with $R$, whereas the finite flag and compact group resolutions give one upper bound for that length. Smooth cohomology commutes with this flat tensor, by the fixed finite projective group resolution. Thus the $V$-cohomology groups just obtained are finite-dimensional smooth $P_t$-modules.
  Take $K$-cohomology next and then inverse limit with corestrictions in $K$. Lemma 45 retains only the top connected group degree $t^2$, with the underlying finite-dimensional coefficients. All cohomological ranges are bounded by the dimensions of the compact analytic groups, the support range, and $d$. Mittag–Leffler therefore permits using the inverse limit on these spectral sequences. By Lemma 42, the result is the algebraic dual of
  $ "colim"_K H^(*) \( P_n \, B_(K \, V)^(\( h \)) \) . $
  It is finite-dimensional, so the displayed colimit is finite-dimensional as well. Power transport identifies it with the asserted group for $B_(upright("conn") \, V)$. Rectangular subgroups form a cofinal family, so this proves the finiteness statement at every compact open $V$.
  It remains to check that a scalar subgroup can be chosen uniformly when both frame levels vary. The scalar $a$ above is central in $G$, so it acts trivially by conjugation on every $V$. On (8.5) it is the identity: it is the identity on $H^q \( cal(D) \)$, and its action on the cotangent factor is given by reduction of scalar multiplication, hence is also the identity. It therefore acts identically on the successive spectral-sequence terms used above. The filtration lengths are bounded independently of $K \, V$: the dimensions are always $t^2$ and $m^2$, the translation range is $\[ 0 \, d \]$, and the complex $cal(D)$ is bounded by $n^2$. A further fixed $p$-power of $a$ consequently acts identically on the cohomology of every sufficiently deep rectangular-level calculation: an operator acting identically on a filtration of length $l$ satisfies $\( a - 1 \)^l = 0$, and $a^(p^j) - 1 = \( a - 1 \)^(p^j)$ in characteristic $p$. These deep rectangular levels are cofinal in the full-frame union.
  Dualizing and passing to the algebraic frame union proves scalar identity on $H^(*) \( P_n \, B_(upright("full")) \)$. Its action is smooth, so identity for a topological generator implies identity for the closed open scalar subgroup it generates. Finally, every root stage is identified by powering with the same finite-level calculation, with the same scalar action. Cohomology commutes with the algebraic root union under the common-stage convention, so the same subgroup works there. This proves the scalar assertion used on strata of higher starting height in the subsequent induction steps. ◻
]

=== 8.4 Characters after perfecting the full frame <characters-after-perfecting-the-full-frame>

The boundary induction needs a norm-character filtration on each individual matrix-group cohomology row of the perfected full-frame coefficient. To obtain it, we dualize the actual root inclusions: their translation corestrictions remove the lower translation degrees in the root limit, and the remaining top translation line combines with the invariant volume to give a norm character.

In this subsection the starting height is denoted by $s$. Fix an induction pair $\( n \, s \)$, with

$ 1 lt.eq s < n < p - 1 \, #h(2em) m = n - s \, #h(2em) G = "GL"_m \( bb(Z)_p \) \, #h(2em) d = m \( s - 1 \) . $

For $s > 1$, put

$ E_h^b = and.big^b \( frak(m)_(Lambda_h) \/ frak(m)_(Lambda_h)^2 \)^(*) \, #h(2em) 0 lt.eq b lt.eq d . $

For $s = 1$, put $E_h^0 = k$ and retain only this degree. We use the compact and bounded-pole assertions already proved at this pair, the finiteness and scalar assertions of Proposition 46, and the full-frame comparison. The additional assertion proved here is established at the end of that same induction step. In a subsequent boundary step $\( n \, t \)$ it is used only with $s > t$.

Choose the finite field $k$ to contain $bb(F)_(p^s)$, as in the fixed Honda conventions. Let

$ P_s^1 = 1 + frak(p)_(D_s) \, #h(2em) Delta_s = mu_(p^s - 1) subset P_s \, #h(2em) nu_s : P_s arrow.r^("Nrd") bb(Z)_p^times arrow.r bb(F)_p^times . $

Reduction identifies $Delta_s$ with $bb(F)_(p^s)^times$, and $nu_s$ restricts to the finite-field norm on $Delta_s$. Write $Delta_s^0 = ker \( nu_s \|_(Delta_s) \)$. A $k \[ Delta_s \]$-module has only norm characters if $Delta_s^0$ acts identically on it. Since $\| Delta_s \|$ is prime to $p$, this condition is preserved by subobjects, quotients, extensions, and filtered colimits. It is also detected after the faithful almost scalar extension $k arrow.r R$ used in the support comparison.

Use the same divisible progression of integers $h$ as in Lemma 11; in particular its powering isomorphisms fix $k$. Put

$ B_(K \, V)^(upright("perf")) = "colim"_h B_(K \, V)^(\( h \)) \, #h(2em) B_(upright("conn") \, V)^(upright("perf")) = "colim"_(K \, h) B_(K \, V)^(\( h \)) \, #h(2em) B_(upright("full"))^(upright("perf")) = "colim"_(K \, V \, h) B_(K \, V)^(\( h \)) . $

Every colimit is algebraic, with the common-stage and common-pole convention for continuous $P_n$-cochains. The root transition is the actual inclusion into the next root ring. Its direction differs from the transfer used to construct $cal(D)$.

The four maps below keep these constructions distinct. Write $C_U^(\( h \)) = C^bullet \( P_n \, B_U^(\( h \)) \)$ and let $U' subset U$ be a finer frame level; $r' > r$ and $h' > h$ denote deeper translation and root levels. The dual identifications in the last two rows are those of Lemma 42 and Lemma 47 below.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Map
], table.cell(rowspan: 1, colspan: 1)[Coefficient direction
], table.cell(rowspan: 1, colspan: 1)[Transpose and use
]),
  table.cell(rowspan: 1, colspan: 1)[Hopf transfer
], table.cell(rowspan: 1, colspan: 1)[$C_U^bullet \( N_(r') \) arrow.r C_U^bullet \( N_r \)$
], table.cell(rowspan: 1, colspan: 1)[Direct transition in the translation index defining $cal(D)$.
],
  table.cell(rowspan: 1, colspan: 1)[Frame trace
], table.cell(rowspan: 1, colspan: 1)[$C_(U')^bullet \( N_r \) arrow.r C_U^bullet \( N_r \)$
], table.cell(rowspan: 1, colspan: 1)[Direct transition in the frame index defining $cal(D)$; geometric pullback.
],
  table.cell(rowspan: 1, colspan: 1)[Root inclusion
], table.cell(rowspan: 1, colspan: 1)[$C_U^(\( h \)) arrow.r C_U^(\( h' \))$
], table.cell(rowspan: 1, colspan: 1)[Corestriction from $T_(h')$ to $T_h$; dualizes perfection.
],
  table.cell(rowspan: 1, colspan: 1)[Frame pullback
], table.cell(rowspan: 1, colspan: 1)[$C_U^(\( h \)) arrow.r C_(U')^(\( h \))$
], table.cell(rowspan: 1, colspan: 1)[Corestriction from $U'$ to $U$; dualizes the connected-frame union.
],
)
]

Stationary powering identifies individual coefficient problems; it is none of these transition maps. The next lemma computes the third row, which is the additional input needed to control characters after perfection.

#thm([Lemma 8.7.])[
  (Root inclusions and translation corestriction).  #emph[In the equivalence of Lemma 42, the transpose of the inclusion $B_(K \, V)^(\( h \)) arrow.r.hook B_(K \, V)^(\( h' \))$ for $h' > h$ is finite-Hopf corestriction 
$ R Gamma \( T_(h') \, cal(D) \) arrow.r R Gamma \( T_h \, cal(D) \) . $

 This identification commutes with the compact frame-group corestrictions and with the action of $P_s$ by conjugation on normal connected levels.]
  #emph[Suppose $s > 1$, and suppose $T_h$ acts trivially on every $H^j \( cal(D) \)$. On a cohomology row the displayed transition is zero in translation degrees $b < d$ and is the oriented identity in degree $d$, up to a nonzero normalization scalar.]
] <full:root-corestriction>

#proof[
  For $s = 1$, the finite diagonalizable translation representations split into character summands. The transpose of inclusion is the projection dual to inclusion of those summands, which is normalized finite-Hopf corestriction; it preserves the trivial character. This proves the first assertion in that case.
  Now suppose $s > 1$. At a finite translation level use the invariant trace pairing of Lemma 11 to identify the regular representation with its distribution-algebra model
  $ N_q = k \[ D_1 \, dots.h \, D_d \] \/ \( D_1^q \, dots.h \, D_d^q \) . $
  The constant function corresponds to the normalized top socle element. Inclusion of functions at the next finite quotient is therefore, in this model,
  $ N_q arrow.r N_(q') \, #h(2em) f mapsto (product_i D_i^(q' - q)) f . $
  Here compatible invariant pairings give the displayed formula; for other Frobenius-pairing coordinates it is multiplied by a unit of the target algebra. Its image is the submodule annihilated by all $D_i^q$. The opposite-direction normalized Hopf transfer is the quotient $N_(q') arrow.r.twohead N_q$. These descriptions follow either from the invariant pairing or by pairing the two maps with the monomial basis; the normalization fixes the top functional. The root-ring presentation in Proposition 7 identifies the first map with the actual root inclusion. Taking its dual in the regular-module construction of $cal(D)$ gives corestriction from $T_(h')$ to $T_h$. Thus the transition here is distinct from the transpose of Hopf transfer used to define $cal(D)$.
  Here is the cochain calculation, with directions explicit. Write
  $ A = Lambda_h = k \[ \[ x_1 \, dots.h \, x_d \] \] \, #h(2em) A' = Lambda_(h') = k \[ \[ y_1 \, dots.h \, y_d \] \] \, #h(2em) y_i mapsto x_i^q \, $
  where $q > 1$ is the relative exponent in the divisible progression. The Koszul complex $K_A \( x_1 \, dots.h \, x_d \)$ resolves $k$, and
  $ A ⊗_(A') K_(A') \( y_1 \, dots.h \, y_d \) = K_A \( x_1^q \, dots.h \, x_d^q \) $
  resolves $A \/ \( x_1^q \, dots.h \, x_d^q \)$. The socle inclusion $k arrow.r A \/ \( x_i^q \)$ is lifted by the chain map
  #[#set math.equation(numbering: n => "(8.6)")
   $ e_I mapsto (product_(j in.not I) x_j^(q - 1)) f_I . $ <full:root-koszul-map>]
  Indeed both sides of its differential identity have, for an index $i in I$, the factor $x_i^q product_(j in.not I) x_j^(q - 1)$. Applying $"Hom"_A \( - \, cal(D) \)$ gives
  $ "RHom"_(A') \( k \, cal(D) \) arrow.r "RHom"_A \( k \, cal(D) \) \, $
  the asserted corestriction. On a row $M = H^j \( cal(D) \)$ annihilated by $\( x_1 \, dots.h \, x_d \)$, its degree-$b$ map is multiplication by the complementary product in (8.6). It is zero if $b < d$ and the identity if $b = d$.
  Multiplying the socle inclusion by a unit multiplies these components by that unit; on $M$ its effect is its nonzero augmentation. Thus the vanishing and top isomorphism do not require a choice of compatible unit normalizations. The maps themselves are the finite Hopf inclusion and its transpose, so they are natural under all frame actions, including nonlinear augmented automorphisms of the distribution algebra. The cohomology-row calculation is therefore equivariant. We do not need to identify the full complexes at a fixed root level with their top rows. All finite coefficient diagrams commute with frame changes and their traces, giving the remaining compatibilities. ◻
]

#thm([Lemma 8.8.])[
  (The perfected connected-frame calculation).  #emph[Choose $h_0$ so that $T_(h_0)$ acts trivially on $H^(*) \( cal(D) \)$, and set $A_h = R Gamma \( V \, R Gamma \( T_h \, cal(D) \) \)$. For every compact open $V subset G$, there are natural $P_s$-equivariant identifications 
#[#set math.equation(numbering: n => "(8.7)")
 $ "Hom"_k #h(-0.16667em) (H^i \( P_n \, B_(upright("conn") \, V)^(upright("perf")) \) \, k) med tilde.eq med "proj lim"_(h \, "cor") H^(- i - s^2) \( A_h \) . $ <full:perfected-connected-dual>]

 All vector spaces in this formula are finite dimensional. Let $chi$ be a character of $Delta_s$. If 
#[#set math.equation(numbering: n => "(8.8)")
 $ H^a \( V \, H^q \( cal(D) \) ⊗ E_h^d \)_chi = 0 quad upright("for every ") a \, q upright(" and ") h gt.eq h_0 \, $ <full:top-row-character-test>]

 then the $chi$-isotypic part of the dual in (8.7) is zero. For $s = 1$, put $d = 0$ and $E_h^0 = k$.]
] <full:perfected-connected-calculation>

#proof[
  The finite flag calculation and the translation-row spectral sequence in the proof of Proposition 46 show that $H^(*) \( A_h \)$ has finite total dimension. This uses only $V$-cohomology of the support flag representations; no cohomology of a coefficient twisted by an arbitrary $P_s$-representation is used. Finiteness is obtained before almost scalar extension by Corollary 26. The dimensions of the cohomological ranges are bounded by $n^2$, $m^2$, and $d$, independently of $h$.
  First take the connected-frame limit at a fixed $h$. Choose a cofinal sequence of normal principal open subgroups $K lt.closed P_s$. Lemma 42 identifies $R Gamma \( K \, A_h \)$ with the finite-frame dual. Compact duality and inverse limit with corestriction therefore give
  #[#set math.equation(numbering: n => "(8.9)")
   $ "Hom"_k #h(-0.16667em) (H^i \( P_n \, B_(upright("conn") \, V)^(\( h \)) \) \, k) tilde.eq H^(- i - s^2) \( A_h \) . $ <full:connected-limit-before-roots>]
  This is the calculation of Lemma 45, applied to the bounded finite cohomology rows of $A_h$. It retains the full $P_s$-action: an element of $P_s$ acts on $K$ by conjugation as well as on its coefficient. In compact duality its additional character is the determinant of the adjoint action on $"Lie" \( P_s \)$, which is one. For example, after a splitting field extension the Lie algebra is $M_s$ and conjugation has determinant one. Thus the top-degree survivor in (8.9) carries exactly the original $P_s$ coefficient action. Normality of $K$ makes these actions compatible throughout the inverse system. The finite cohomology groups are Mittag–Leffler, so no derived inverse-limit term occurs.
  All these operations precede scalar extension. The actual power-transport isomorphism at a fixed $V$ identifies the dimensions of $H^(*) \( P_n \, B_(upright("conn") \, V)^(\( h \)) \)$ with the same fixed finite dimensions for every $h$ in the progression. These isomorphisms give a uniform bound on dimensions; they do not identify the root inclusions with isomorphisms. Consequently the root direct limit is finite dimensional, and duality identifies it with the inverse limit of the finite spaces in (8.9). Every cohomological inverse system here is Mittag–Leffler.
  This proves (8.7). It remains to prove the character test. For $s > 1$, fix a row $M = H^q \( cal(D) \)$ and consider the bounded spectral sequence
  $ H^a \( V \, H^b \( T_h \, M \) \) med arrow.r.double med H^(a + b) #scale(x: 120%, y: 120%)[\(] V \, R Gamma \( T_h \, M \) #scale(x: 120%, y: 120%)[\)] . $
  Here $H^b \( T_h \, M \) = M ⊗ E_h^b$. By Lemma 47, root corestriction acts as zero on every row with $b < d$. On the $chi$-part the remaining $b = d$ row is zero by (8.8). Thus every transition is zero on this row page after projecting to $chi$. The ranges $0 lt.eq a lt.eq m^2$ and $0 lt.eq b lt.eq d$ give a uniform finite filtration on its abutment. A transition zero on the associated graded lowers that filtration, so a bounded number of successive transitions is zero on the $chi$-part of the abutment.
  Next use the bounded cohomology filtration of $cal(D)$ to compute $A_h$ from these row calculations. Its number of nonzero cohomology rows is at most $n^2 + 1$. Repeating the same filtration argument therefore gives one integer $N$, independent of $h$, such that the composite of $N$ successive root transitions is zero on $H^j \( A_h \)_chi$ in every degree. For example, one may enlarge the bound to $\( n^2 + 1 \) \( m^2 + d + 1 \)$. This two-stage argument retains all derived translation and $V$-extensions; it assumes no equivariant formality. The $chi$-part of the inverse system is uniformly pro-zero. Its inverse limit is consequently zero, as is its derived inverse-limit contribution.
  For $s = 1$, translation invariants are exact character projection. Once $T_(h_0)$ acts trivially on $H^(*) \( cal(D) \)$, only $b = 0 = d$ occurs. Condition (8.8) kills the corresponding $chi$-part directly by the bounded cohomology filtration of $cal(D)$. Throughout the proof, inverse limits were evaluated on the finite $k$-cohomology systems before tensoring with $R$; no interchange of an infinite inverse limit with almost scalar extension is required. ◻
]

#thm([Lemma 8.9.])[
  (The remaining tame characters).  #emph[The $P_s$-action on $H^i \( P_n \, B_(upright("conn") \, V)^(upright("perf")) \)$ has only norm characters on $Delta_s$, for every $i$ and every compact open $V subset G$.]
] <full:perfected-support-characters>

#proof[
  We record the connected-frame characters in the support calculation. The orientation line for a rational plane of dimension $r$ comes by scalar extension from a one-dimensional $bb(F)_p$-space, naturally for automorphisms of $N_s$. Indeed the natural compact primitive comparison
  $ R Gamma_c \( N_s^r \, bb(F)_p \) ⊗_(bb(F)_p) R arrow.r R Gamma_c \( N_s^r \, cal(A) \) $
  is computed by the same buffered affine exhaustion and lattice corestriction calculation as Lemma 23. The affine finite-coefficient complex is $bb(F)_p \( - r \) \[ - 2 r \]$; the lattice corestriction limit retains its top $s r$-dimensional orientation. Thus the source has one $bb(F)_p$-cohomology line in degree $\( s + 2 \) r$, and the comparison is an equivalence. The calculation is natural, so it applies also to $P_s$ automorphisms which do not preserve a chosen affine/lattice presentation. The compact-parameter construction gives a continuous action on that finite line. Its $P_s$ character consequently takes values in $bb(F)_p^times$.
  Every continuous character $P_s arrow.r bb(F)_p^times$ is a power of $nu_s$. Its restriction to the pro-$p$ group $P_s^1$ is trivial; the quotient is the cyclic group $bb(F)_(p^s)^times$, and every homomorphism from that group to $bb(F)_p^times$ is a power of the finite-field norm. Denote the resulting orientation character for an $r$-plane by $nu_s^(c_r)$; its exact exponent is not needed. The rational plane and flag parameters are fixed by $P_s$, since $P_s$ commutes with the action on the $m$ row indices. Hence each finite flag term for the support row is a representation with this scalar $P_s$ character.
  There are also the volume and top translation Ext lines. Let $a in bb(F)_(p^s)^times$ be a Teichmüller element, acting on the tangent line of the fixed Honda group by $a$. With the inverse-substitution convention of (3.8), the characters are
  $ chevron.l eta chevron.r \( a \) = a^(- m) \, #h(2em) E_(h_0)^d \( a \) = a^(- m \( p + p^2 + dots.h.c + p^(s - 1) \)) . $
  For the second identity, let $h = \[ a \]$ act on the Honda group. Its action on functions is $h dot.op f = \( h^(- 1) \)^(*) f$, so the dual distribution action is $lambda mapsto \( f mapsto lambda \( h^(*) f \) \)$. Under Cartier duality this is pullback by $h^D \( rho \) = rho compose h$. To compute these characters, let $O = W \( bb(F)_(p^s) \) subset "End" \( Gamma_s \)$ act on the covariant Dieudonne module $M$ over $W \( k \)$. The Honda endomorphism calculation identifies a Teichmuller element $a$ with the endomorphism $a X$ #cite(label("RavenelGreenBook")) Lemma A2.2.16 and Theorem A2.2.18. The $s$ idempotents of $W \( k \) ⊗_(bb(Z)_p) O$ split $M$ into its eigensummands. Its semilinear Frobenius commutes with $O$ and is invertible after inverting $p$, so it permutes the rationalized eigensummands cyclically and forces their ranks to be equal #cite(label("ZinkDisplays")) Example 14 and Proposition 15. The covariant Hodge sequence for $M \/ p M$ has total rank $s$, the sum of the dual dimension $s - 1$ and the dimension one of $Gamma_s$ #cite(label("Lau2010Tate")) Section 5. Each eigensummand therefore has rank one, and the residue eigencharacters are $a \, a^p \, dots.h \, a^(p^(s - 1))$. In this functorial Hodge sequence the quotient $"Lie" \( Gamma_s \)$ has character $a$, and the subspace $omega_(Gamma_s^D)$ is the cotangent space of the distribution formal group, with characters $a^p \, dots.h \, a^(p^(s - 1))$. Degree-one translation Ext is the linear dual of this cotangent space; top Ext is its top exterior power. This gives the stated negative exponents. In particular the action used here is cotangent pullback by $h^D$, not the tangent action of $rho mapsto rho compose h^(- 1)$ on dual points. The divisible progression fixes these characters when transported to $T_(h_0)$. Therefore
  #[#set math.equation(numbering: n => "(8.10)")
   $ \( chevron.l eta chevron.r ⊗ E_(h_0)^d \) \( a \) = a^(- m \( 1 + p + dots.h.c + p^(s - 1) \)) = nu_s \( a \)^(- m) . $ <full:connected-top-character>]
  For $s = 1$ the second line is trivial and the same formula holds. This is a calculation on the fixed Honda group and its actual translation representations. It does not identify a parameter-dependent universal Lie line with the constant extension of its special-fibre character.
  To apply (8.8), use Proposition 43 on each $H^q \( cal(D) \) ⊗ E_h^d$ after tensoring with $R$. By the finite flag resolution, the resulting support rows have only norm characters of $Delta_s$, namely the products of $nu_s^(c_r)$ with (8.10). $V$ commutes with $Delta_s$. Its finite projective resolution therefore preserves this condition, and commutes with the flat scalar extension. Faithfulness detects (8.8) before scalar extension for every nonnorm $chi$. Lemma 48 now kills all these isotypic pieces of the perfected dual. The set of norm characters is closed under inversion, so dualizing proves the assertion on the primal coefficient. ◻
]

#thm([Proposition 8.10.])[
  (Norm characters on the perfected individual rows).  #emph[At the current induction pair $\( n \, s \)$, for every compact open $V subset "GL"_(n - s) \( bb(Z)_p \)$ and all $a \, i$, the vector space 
$ Q = H^a #h(-0.16667em) (V \, H^i \( P_n \, B_(upright("full"))^(upright("perf")) \)) $

 is finite dimensional and has a finite $P_s$-stable filtration whose successive quotients are one-dimensional characters $nu_s^j$. Its dual has a filtration by the inverse characters. This assertion concerns the representations arising from these perfected full-frame rows.]
] <full:perfected-row-characters>

#proof[
  First take the algebraic union over the matrix levels in Lemma 49. The fixed finite $P_n$-resolution and the common-stage cochain convention give
  $ H^i \( P_n \, B_(upright("full"))^(upright("perf")) \) = "colim"_(V') H^i \( P_n \, B_(upright("conn") \, V')^(upright("perf")) \) . $
  The maps here are actual coefficient pullbacks and are $P_s$-equivariant. Since $Delta_s^0$ acts identically on every term, it acts identically on this individual $P_n$-cohomology group. This step uses an algebraic coefficient colimit; it does not deduce an individual row from a total-cohomology spectral-sequence abutment.
  The group $V$ commutes with $P_s$, in particular with $Delta_s^0$. A bounded finite projective resolution for $V$ computes its cohomology by retracts of finite sums of the displayed coefficient module. Thus $Delta_s^0$ also acts identically on $Q$. Its finite-dimensionality is the individual-row finiteness assertion of Lemma 40. The hypotheses of that lemma hold for the perfected coefficient as well: finite-frame descent identifies its total $V'$-cohomology with the connected-frame calculation, and the uniform finite root-stage dimensions used in Lemma 48 give finite dimensions after the root union, for every open $V'$. The cohomological ranges stay bounded by the fixed group dimensions.
  Finally the image $Pi$ of $P_s^1$ in $"GL"_k \( Q \)$ is a finite normal $p$-group. Its augmentation ideal $J subset k \[ Pi \]$ is nilpotent. The finite filtration $J^b Q$ is $P_s$-stable, and its quotients have trivial $P_s^1$ action. They therefore split over $k$ into characters of $P_s \/ P_s^1 = bb(F)_(p^s)^times$. Exactness of restriction to $Delta_s$ and of its character projections shows that each such character is trivial on $Delta_s^0$. Each is consequently a power of $nu_s$. Refine the filtration by these one-dimensional summands. Duality reverses this finite filtration and inverts its characters, proving the final assertion. ◻
]

== 9 Constant cochains, modification, and stable transport <sec:constants>

We compare constants on the division and matrix sides before choosing their generators. This distinction matters: an abstract isomorphism of exterior algebras would not identify the cup action in Proposition 43. The comparison below is induced by pullback from a single modification stack. It also applies to finite Postnikov coefficients, and hence transports continuous sphere-cochain representatives.

Throughout this section, $1 lt.eq a < p - 1$, and

$ K_a = "GL"_a \( bb(Z)_p \) \, #h(2em) I_a = { g in K_a : g med mod med p upright(" is upper triangular") } \, #h(2em) P_a = cal(O)_(D_a)^times \, $

where $D_a \/ bb(Q)_p$ has invariant $1 \/ a$. All group cohomology is continuous. Coefficients such as $bb(Z)_p$ carry their profinite topology; finite coefficients carry the discrete topology. We use $C_(upright("cts"))^(*) \( G \; E \)$ for the spectrum of continuous cochains with constant spectrum $E$, and $R Gamma_(upright("cts")) \( G \; M \)$ for its complex-valued counterpart. Finite Postnikov spectra here have finitely many nonzero homotopy groups, each a finite $p$-group. Cochains with these coefficients are formed first; completed coefficients will be obtained by the explicit inverse limits below.

=== 9.1 Integral and finite-coefficient cohomology <integral-and-finite-coefficient-cohomology>

#thm([Theorem 9.1.])[
  (Constant cohomology).  #emph[For $G = K_a \, I_a$, or $P_a$, the groups $H^q \( G \, bb(Z)_p \)$ are finite free $bb(Z)_p$-modules, vanish for $q > a^2$, and have Poincaré polynomial 
#[#set math.equation(numbering: n => "(9.1)")
 $ sum_q "rank"_(bb(Z)_p) H^q \( G \, bb(Z)_p \) z^q = product_(i = 1)^a \( 1 + z^(2 i - 1) \) . $ <eq:const-poincare>]

 There are exterior-algebra presentations over $bb(Z)_p$, and over every finite extension of $bb(F)_p$, with generators in degrees $2 i - 1$, $1 lt.eq i lt.eq a$. For every $r gt.eq 1$, reduction induces an isomorphism 
#[#set math.equation(numbering: n => "(9.2)")
 $ H^q \( G \, bb(Z)_p \) \/ p^r med arrow.r^(med tilde.op med) med H^q \( G \, bb(Z) \/ p^r \) . $ <eq:const-reduction>]

 The actual restriction maps 
$ H^(*) \( K_a \, bb(Z)_p \) arrow.r H^(*) \( I_a \, bb(Z)_p \) \, #h(2em) H^(*) \( K_a \, bb(Z) \/ p^r \) arrow.r H^(*) \( I_a \, bb(Z) \/ p^r \) $

 are isomorphisms. These assertions do not select the generators: the compatible stable generators will be constructed in Theorem 56.]
] <thm:constant-cohomology>

#proof[
  We specify the finite-coefficient input. Theorem 1.1 of #cite(label("DLH")), comprising Propositions 5.5 and 5.7 there, computes the cohomology of an unramified split Chevalley group and proves restriction to its Iwahori to be an isomorphism when $p > h + 1$, where $h$ is the Coxeter number. For $"GL"_a \/ bb(Q)_p$, $a gt.eq 2$, this is $h = a$; the degree of the ground field and its ramification index are both one. Thus its hypothesis is exactly $a < p - 1$, and its exterior degrees are $1 \, 3 \, dots.h \, 2 a - 1$. For the division algebra, #cite(label("DLH")) §5.2, Proposition 5.12 applies to an unramified ground field and a division algebra of invariant $1 \/ a$ with $a < p - 1$. It gives the same exterior algebra over the residue field of $D_a$, which here is $bb(F)_(p^a)$. Extension of the finite constant field commutes with continuous cochains. In particular, that calculation gives the stated degreewise dimensions over $bb(F)_p$. For $a = 1$ all three groups are $bb(Z)_p^times = mu_(p - 1) times \( 1 + p bb(Z)_p \)$, so the assertion follows directly from the two-term resolution for $bb(Z)_p$ and exactness of $mu_(p - 1)$-invariants.
  We include the integral deduction. None of these groups has an element of order $p$. Such an element in $"GL"_a \( bb(Q)_p \)$ would require the cyclotomic polynomial $Phi_p$, of degree $p - 1$, in its rational representation; in $D_a^times$ it would embed $bb(Q)_p \( zeta_p \)$ as a subfield of a division algebra of degree $a$. Both are impossible for $a < p - 1$. The compact $p$-adic analytic group theorem therefore gives $p$-cohomological dimension $a^2$. Its completed group algebra is Noetherian, and the trivial module has a bounded resolution by finitely generated projectives. One can obtain finite generation of the resolution terms from Noetherianity and truncate at the cohomological dimension. The compact-module form of these analytic-group results is recalled in #cite(label("Venjakob")) Sections 1.1–1.2; see also #cite(label("Lazard")) #cite(label("SerreGalois")). In particular, $H^q \( G \, bb(Z)_p \)$ is finitely generated over $bb(Z)_p$, and rational base change computes continuous rational cohomology.
  Write $r_q$ for its rank and $t_q$ for the number of cyclic summands in its finite $p$-primary torsion subgroup. The coefficient sequence gives
  $ 0 arrow.r H^q \( G \, bb(Z)_p \) \/ p arrow.r H^q \( G \, bb(F)_p \) arrow.r H^(q + 1) \( G \, bb(Z)_p \) \[ p \] arrow.r 0 \, $
  and consequently
  #[#set math.equation(numbering: n => "(9.3)")
   $ dim_(bb(F)_p) H^q \( G \, bb(F)_p \) = r_q + t_q + t_(q + 1) . $ <eq:const-uct>]
  Rational Lazard comparison identifies the rational cohomology with the invariant Lie-algebra calculation. The matrix Lie algebra is $frak(g l)_a$; after a splitting field extension the division Lie algebra is the same Lie algebra. Its cohomology is exterior in degrees $1 \, 3 \, dots.h \, 2 a - 1$, and conjugation acts trivially #cite(label("BSSW")) Proposition 3.8.1 and Lemma 3.8.2. The rational and mod-$p$ dimensions therefore agree in every degree. Equation (9.3) forces $t_q = t_(q + 1) = 0$ for every $q$. The coefficient sequence for $p^r$ now proves (9.2). Restriction to $I_a$ is an isomorphism integrally as well, since its reduction modulo $p$ is an isomorphism between finite free modules of equal rank.
  For completeness, the finite-field extension in the division calculation does not conceal an algebra-descent assertion. Choose over $bb(F)_p$ a homogeneous basis of the indecomposable quotient of the positive-degree cohomology algebra. After extension to $bb(F)_(p^a)$ there is precisely one basis element in each of the indicated odd degrees. Their lifts generate the original graded algebra by induction on degree; their squares vanish because $p$ is odd. The resulting surjection from the exterior algebra is an isomorphism by the degreewise dimension calculation. Lift these generators to integral cohomology using (9.2). Graded commutativity and torsionfreeness give a map from the integral exterior algebra, whose reduction modulo $p$ is an isomorphism. Nakayama’s lemma in each degree proves the integral presentation. ◻
]

#prodef([Remark 9.2.])[
  The coefficient-field automorphisms used to pass from the ordinary to the extended stabilizer act trivially on $H^(*) \( P_a \, bb(Z)_p \)$. Indeed, on the division Lie algebra they become inner automorphisms after splitting, so they act trivially on rational cohomology. Torsionfreeness then makes their integral action trivial. This concerns the constant cohomology classes; equivariant sphere representatives can subsequently be obtained by transfer across a finite extension of degree prime to $p$.
] <rem:const-galois>

=== 9.2 The subgroup of determinant valuation zero <the-subgroup-of-determinant-valuation-zero>

Set

$ J_a = { g in "GL"_a \( bb(Q)_p \) : v_p \( det g \) = 0 } . $

This condition retains a lattice in the determinant of a rational frame, without requiring a lattice in the whole frame.

#thm([Lemma 9.3.])[
  (Building restriction).  #emph[Restriction along $K_a subset J_a$ induces an equivalence 
$ C_(upright("cts"))^(*) \( J_a \; E \) med arrow.r^(med tilde.op med) C_(upright("cts"))^(*) \( K_a \; E \) $

 for every finite Postnikov $p$-primary constant coefficient spectrum $E$. It also induces isomorphisms with constant coefficients $bb(Z)_p$ and $bb(Z) \/ p^r$.]
] <lem:const-building>

#proof[
  For $a = 1$ the groups are equal. Otherwise let $cal(B)_a$ be the reduced Bruhat–Tits building. The group $J_a$ preserves vertex types, acts without inversions, and has a closed chamber as fundamental domain. The stabilizer $K_v$ of a vertex is a conjugate of $K_a$. Indeed a matrix stabilizing the homothety class of a lattice is a scalar times a lattice automorphism, and determinant valuation zero forces the scalar valuation to be zero. Every face stabilizer $K_sigma$ is compact and lies between the Iwahori of the chamber and one of its vertex stabilizers.
  The index $\[ K_sigma : I_a \]$ is prime to $p$: after reduction it is a flag count for the corresponding Levi blocks, and each such flag count is congruent to one modulo $p$. Transfer therefore makes $H^(*) \( K_sigma \, bb(F)_p \) arrow.r H^(*) \( I_a \, bb(F)_p \)$ injective. The restriction $H^(*) \( K_v \, bb(F)_p \) arrow.r H^(*) \( I_a \, bb(F)_p \)$ is an isomorphism by Theorem 51, and factors through this injection. It follows that the face restriction is an isomorphism too. Identifying every face group with $H^(*) \( I_a \, bb(F)_p \)$ by its actual restriction makes all incidence maps identities.
  The equivariant cellular resolution of the contractible building gives
  #[#set math.equation(numbering: n => "(9.4)")
   $ E_1^(r \, s) = xor.big_(sigma upright(" in the chamber")\
dim sigma = r) H^s \( K_sigma \, bb(F)_p \) med arrow.r.double med H^(r + s) \( J_a \, bb(F)_p \) . $ <eq:const-building-ss>]
  The sum is finite, the chamber has dimension $a - 1$, and the compact face groups have cohomological dimension $a^2$. Thus this is a bounded spectral sequence. Its rows are the ordinary cochain complex of a simplex with constant coefficient $H^s \( I_a \, bb(F)_p \)$. They have only degree zero cohomology. The resulting edge map is restriction to a vertex; this proves the assertion for $H bb(F)_p$.
  A finite abelian $p$-group has a finite filtration with quotients $bb(F)_p$. Coefficient exact sequences and then Postnikov fibre sequences prove the assertion for every stated $E$. This proves a comparison of the actual restriction maps, natural in $E$. The integral assertion follows by taking the inverse limit of the finite-coefficient comparisons. The groups on the compact side are finite at each finite coefficient level, so the cohomological inverse systems are Mittag–Leffler. The same is then true on the $J_a$ side. ◻
]

=== 9.3 The common modification stack and its arithmetic <the-common-modification-stack-and-its-arithmetic>

Fix $n < p - 1$. Choose a finite unramified extension $K \/ bb(Q)_p$ over which the Honda endomorphisms in use are defined, and a completed algebraic closure $C$ of $K$. All spaces in the next display are geometric diamonds over $C$; we retain their $"Gal" \( overline(K) \/ K \)$-descent. Let

$ Omega_C^(n - 1) = bb(P)_C^(n - 1) \\ union.big_H H_C \, $

where $H$ ranges through rational $bb(Q)_p$-hyperplanes.

#thm([Lemma 9.4.])[
  (Modification presentations).  #emph[There is a common modification stack, with its determinant lattice, 
#[#set math.equation(numbering: n => "(9.5)")
 $ cal(M)_n tilde.eq \[ bb(P)_C^(n - 1) \/ P_n \] tilde.eq \[ Omega_C^(n - 1) \/ J_n \] . $ <eq:const-modification-stack>]

 The two presentations commute with the arithmetic action over $K$. In particular, arithmetic acts trivially on the continuous group cochains of $P_n$ and $J_n$. Their structural maps to geometric cochains, constructed in the next subsection, are arithmetic-equivariant.]
] <lem:const-modification-stack>

#proof[
  Use the convention that $V_n$ has slope $1 \/ n$. A point of projective space specifies a length-one quotient at the untilt divisor,
  $ 0 arrow.r W arrow.r V'_n arrow.r i_(*) cal(L) arrow.r 0 \, $
  where $V'_n$ is a form of $V_n$. The kernel has rank $n$ and degree zero. If a proper subbundle of rank $r$ had positive degree, its inclusion in the stable bundle $V'_n$ would give degree strictly less than $r \/ n < 1$, a contradiction. Thus $W$ is semistable of slope zero. The relative slope-zero equivalence identifies it with a rank-$n$ $bb(Q)_p$-local system.
  Conversely, an upper modification of a trivial rank-$n$ bundle has nonnegative slopes and total degree one. Nonnegativity follows because a negative-slope quotient would receive no map from the trivial bundle, whereas that bundle has only a torsion cokernel. The positive part is therefore a single stable bundle of degree one; the rest, if present, has slope zero. A slope-zero quotient is precisely a rational linear functional annihilating the modification direction. Its absence is exactly the condition that the direction lie in $Omega_C^(n - 1)$. On that locus the middle bundle is of type $V_n$.
  The relative classification of these bundles and the slope-zero/local-system equivalence make the frames torsors in the $v$-topology, so the two descriptions are inverse on families as well as on geometric points. This is the basic EL modification description underlying the duality of #cite(label("ScholzeWeinstein")) Theorem 7.2.3; the slope argument above specifies its basic locus in the present case.
  We explain the determinant reduction. Fix a lattice in the rank-one slope-zero local system $det \( V_n \) \( - oo \)$. Require the determinant of the frame of $W$ to carry $bb(Z)_p$ to that lattice. Its permitted rational frame changes are exactly $J_n$. On the positive-bundle side the corresponding condition is $v_p \( "Nrd" \( g \) \) = 0$ on $D_n^times$, whose subgroup is $P_n$. Hence the same determinant condition cuts out the two groups in (9.5). The determinant-matching construction is the one appearing, for the positive-height extension towers, in #cite(label("BMR")) Theorem 2.0.1 and Theorem 2.6.3.
  Choose the positive Honda isocrystal over the unramified field containing its endomorphism field. Arithmetic then acts on the period factor and commutes with its division-algebra endomorphisms. Subtracting the untilt divisor in its determinant produces a rank-one $bb(Q)_p$-local system with compact arithmetic image; equivalently, its integral Tate lattice is preserved. More intrinsically, the valuation of an arithmetic determinant action is a continuous homomorphism from a profinite group to $bb(Z)$ and hence is zero. The chosen determinant component can therefore be retained arithmetically. On the split-frame directions this is the usual arithmetic action on Drinfeld space: changing the trivialization of the determinant only changes a line scale, which disappears in projective directions. Thus both torsor presentations and both structural maps commute with arithmetic. ◻
]

=== 9.4 Finite constant sections and geometric descent <finite-constant-sections-and-geometric-descent>

The two presentations of $cal(M)_n$ now specify the comparison to be made. We need its structural maps to preserve the actual constant classes and their products, and we need arithmetic to separate these classes from higher geometric cohomology. We first construct the maps on finite coefficients.

The compact-group descent calculation is Lemma 20. Its geometric parameter construction and completed-bar comparison apply to both period spaces above. For $J_n$, use the finite chamber resolution of Lemma 53 and apply that calculation to each compact face stabilizer. There are finitely many faces, so this adds a finite filtration. In particular, a commuting arithmetic scalar on a geometric row stays the same scalar on all its group-cohomology rows. This retains the profinite parameters of the Steinberg duals that will occur for Drinfeld space.

We make explicit the map from the separately defined group cochains to geometric cochains. For a small $v$-stack $X$, write $C_v^(*) \( X \; E \) = R Gamma \( X_v \, underline(E) \)$ for the cochains of the constant sheaf associated to a finite Postnikov $p$-primary spectrum $E$. For a compact profinite set $T$, put

$ "LC" \( T \; E \) = "colim"_(T arrow.r.twohead T_i) product_(t in T_i) E \, $

where $T_i$ runs over the finite clopen quotients. For the locally profinite group powers used here, take the product of these objects over a disjoint compact-open decomposition. Each compact piece meets only finitely many pieces of another such decomposition, so common refinement identifies the result. For abelian coefficients the same notation means the locally constant function module, degreewise for complexes. On each finite clopen partition the constant-section maps for $E$ on the inverse-image pieces define

$ "LC" \( T \; E \) arrow.r C_v^(*) \( X times underline(T) \; E \) . $

They commute with refinement. If a locally profinite group $G$ acts on $X$ over a small $v$-stack base $cal(B)$, the action nerve therefore gives, for the trivial action on $E$,

$ eta_(X \, G \, E) : med C_(upright("cts"))^(*) \( G \; E \) & = "Tot"_(a gt.eq 0) "LC" \( G^a \; E \)\
 & arrow.r "Tot"_(a gt.eq 0) C_v^(*) \( X times underline(G^a) \; E \) tilde.eq C_v^(*) \( \[ X \/ G \] \; E \) . $

The last equivalence is Čech descent for the quotient. This constant-section construction is valid over every $cal(B)$. If $phi.alt : H arrow.r G$ is continuous and $f : X' arrow.r X$ is $phi.alt$-equivariant over a base map, then the induced quotient map satisfies

$ \[ f \]^(*) eta_(X \, G \, E) = eta_(X' \, H \, E) "res"_phi.alt . $

The equality holds on the nerve terms and commutes with all faces and degeneracies. The same termwise construction commutes with coefficient maps and, for any specified pairing $E and F arrow.r E'$, with the corresponding cup maps. It is consequently natural under arithmetic base automorphisms as well.

Write $B_(cal(B)) G = \[ cal(B) \/ underline(G) \]$ for the relative classifying stack. Its universal map $eta_(cal(B) \, G \, E)$ pulls back to $eta_(X \, G \, E)$ along $\[ X \/ G \] arrow.r B_(cal(B)) G$. If $cal(T) arrow.r Z$ is a $G$-torsor with classifying map $beta$, its Čech nerve is $cal(T) times underline(G^a)$, so under $\[ cal(T) \/ G \] tilde.eq Z$ the map $beta^(*) eta_(cal(B) \, G \, E)$ is $eta_(cal(T) \, G \, E)$. This identity commutes with base change of the torsor. For an $H$-torsor $cal(T)$ and a homomorphism $phi.alt : H arrow.r G$, it also gives, on the common quotient $Z$,

$ eta_(cal(T) times^H G \, G \, E) = eta_(cal(T) \, H \, E) "res"_phi.alt . $

In geometric occurrences of $B G$ in this paper, the base is the one in the diagram at issue, and a classifying pullback of a continuous class $c$ means the pullback of its universal image $eta_(cal(B) \, G \, E) \( c \)$. The structural constant actions on supported coefficients are the cup actions of these same finite unit images on the common Čech nerves used for support.

This definition agrees with the geometric parameter cochains used in Lemma 20. For locally spatial $Y times underline(T)$ with $T$ profinite, #cite(label("ScholzeDiamonds")) Proposition 14.10 identifies finite constant étale cochains with their $v$-cochains. For a finite abelian $p$-group $M$, use the coefficient ring $bb(Z) \/ p^r$ annihilating $M$ in that proposition; its coefficient ring is arbitrary. Finite Postnikov induction extends the identification from $H M$ to $E$. Write $cal(C)_(Y \, bb(F)_p)$ for the derived solid parameter object associated to $Y$ in that construction. The constant sections give a unit $underline(bb(F)_p) arrow.r cal(C)_(Y \, bb(F)_p)$, and the just specified étale–$v$ comparison identifies the map on compact bar invariants induced by this unit with $eta_(Y \, G \, H bb(F)_p)$. Thus the unit is fixed before the comparison of the bar resolution with $Q_bullet$.

For a geometric point $B_C = "Spd" C$, with $C$ complete and algebraically closed, the universal map is an equivalence when $G$ is compact. Indeed, the example after Definition 7.8 in #cite(label("ScholzeDiamonds")) expresses $B_C times underline(T)$, for profinite $T = "proj lim" T_i$, as the limit of the finite disjoint unions $B_C times T_i$. Proposition 7.16 there makes the $C$ point strictly totally disconnected, so its étale covers split and its finite constant cohomology is concentrated in degree zero. Propositions 14.9 and 14.10 then give the actual constant-section equivalence

$ "LC" \( T \; H M \) tilde.eq C_v^(*) \( B_C times underline(T) \; H M \) #h(2em) \( M upright(" a finite abelian ") p upright("-group") \) . $

Finite Postnikov induction gives the same assertion for $E$. The equivalences are natural in $T$ and in automorphisms of $C$; taking them on the compact $G$-nerve proves the claim about $eta_(B_C \, G \, E)$. We use this compact comparison for the literal relative classifying interpretation of $P_n$ and $K_n$. For $J_n$ and the upper block group below, the universal images together with the finite chamber and inflation calculations provide the required maps. For the modification stack $cal(M)_n$ above, the unadorned $C^(*) \( cal(M)_n \; E \)$ denotes $C_v^(*) \( cal(M)_n \; E \)$ and $H^q \( cal(M)_n \, bb(F)_p \) = pi_(- q) C_v^(*) \( cal(M)_n \; H bb(F)_p \)$. In what follows, constant cochains on $B P_n$ and $B J_n$ mean these continuous sources with their universal images.

=== 9.5 Arithmetic separation and continuous stable transport <arithmetic-separation-and-continuous-stable-transport>

Choose $gamma in "Gal" \( overline(K) \/ K \)$ such that $macron(chi)_p \( gamma \) = u$ generates $bb(F)_p^times$. Such a choice is possible because $K \/ bb(Q)_p$ is unramified. For a vector space with an endomorphism annihilated by a polynomial whose roots lie in $bb(F)_p^times$, its generalized weight-zero part means its $\( gamma - 1 \)$-primary summand. Nilpotent extensions are included in this terminology.

#thm([Proposition 9.5.])[
  (Transport of constants).  #emph[The structural maps from (9.5) identify 
#[#set math.equation(numbering: n => "(9.6)")
 $ H^(*) \( P_n \, bb(F)_p \) med arrow.r^(med tilde.op med) H^(*) \( cal(M)_n \, bb(F)_p \)_(\( 1 \)) arrow.l^(med tilde.op med) H^(*) \( J_n \, bb(F)_p \) \, $ <eq:const-weight-zero>]

 where $\( 1 \)$ denotes generalized eigenvalue one for $gamma$. These are identifications by the actual pullback maps and preserve cup products. Together with Lemma 53, they induce natural equivalences, for every finite Postnikov $p$-primary spectrum $E$, 
#[#set math.equation(numbering: n => "(9.7)")
 $ C_(upright("cts"))^(*) \( P_n \; E \) med tilde.eq med C^(*) \( cal(M)_n \; E \)_(\( 1 \)) med tilde.eq med C_(upright("cts"))^(*) \( J_n \; E \) med tilde.eq med C_(upright("cts"))^(*) \( K_n \; E \) . $ <eq:const-postnikov-transport>]

 The equivalences commute with coefficient maps, products, and Hurewicz maps. They extend to the $p$-complete sphere by the Postnikov and coefficient limits defining continuous cochains.]
  #emph[There is also the following compatibility on the independent extension locus $Z = \( N_t^m \)_(upright("ind"))$, $m = n - t$. After fixing the connected quotient frame, let 
$ b : \[ Z \/ K_m \] arrow.r B P_n \, #h(2em) q : \[ Z \/ K_m \] arrow.r B K_m $

 be the positive middle-bundle classifying map and the structural map. If $c_P$ and $c_K$ correspond under (9.7), then 
#[#set math.equation(numbering: n => "(9.8)")
 $ b^(*) c_P = q^(*) "res"_(K_m)^(K_n) \( c_K \) \, #h(2em) K_m arrow.r K_n \, quad g mapsto "diag" \( g \, 1_t \) . $ <eq:const-block-action>]

 This equality holds for finite Postnikov coefficients, for their stable limits, and for the resulting ordinary cup actions. In particular the constant action in Proposition 43 is the actual block-restriction action.]
] <prop:modification-transport>

#proof[
  #emph[Arithmetic separation and the specified degree-zero edges.] We first prove (9.6). The projective-space calculation is
  $ H^(2 j) \( bb(P)_C^(n - 1) \, bb(F)_p \) = bb(F)_p \( - j \) \, quad 0 lt.eq j < n \, #h(2em) H^(2 j + 1) \( bb(P)_C^(n - 1) \, bb(F)_p \) = 0 . $
  Its geometric automorphisms act trivially on these lines, and $gamma$ acts by $u^(- j)$. For Drinfeld space, apply the integral and finite-coefficient theorem #cite(label("CDN")) Theorems 1.1 and 5.1 with ground field $bb(Q)_p$, matching the rational $bb(Q)_p$-hyperplanes defining $Omega_C^(n - 1)$, and then restrict its arithmetic action to $"Gal" \( overline(K) \/ K \)$. It gives compatible topological isomorphisms
  #[#set math.equation(numbering: n => "(9.9)")
   $ H_(upright(acute(e) t))^j \( Omega_C^(n - 1) \, bb(Z)_p \( j \) \) & tilde.eq "Sp"_j \( bb(Z)_p \)^(*) \,\
H_(upright(acute(e) t))^j \( Omega_C^(n - 1) \, bb(F)_p \( j \) \) & tilde.eq "Sp"_j \( bb(F)_p \)^(*) \, #h(2em) 0 lt.eq j < n . $ <eq:const-cdn>]
  Here $"Sp"_j$ is the integral generalized Steinberg representation, the star is its continuous integral or finite-field dual, and arithmetic acts trivially on that factor. Cohomology vanishes above $n - 1$. Thus the untwisted $j$th group has exactly the arithmetic scalar $u^(- j)$; degree zero is precisely the constants. In particular, (9.9) is an integral and finite-coefficient statement. We neither reduce a rational pro-étale calculation nor discard analytic terms by tensoring it with $bb(F)_p$.
  Apply geometric descent to the two presentations of $cal(M)_n$. Lemma 20 shows that every group-cohomology row arising from geometric degree $j$ has the same arithmetic scalar $u^(- j)$. For the projective presentation its geometric degree is $2 j$; for the Drinfeld presentation it is $j$. Both filtrations are bounded, using the compact group resolution on the first side and the finite chamber together with compact face resolutions on the second. Since
  $ 1 lt.eq j lt.eq n - 1 < p - 1 \, $
  all the higher geometric rows have eigenvalue different from one. An equivariant differential between generalized summands with relatively prime eigenvalue polynomials is zero. Exactness of primary decomposition therefore shows that the generalized-one part of the abutment is exactly the geometric degree-zero row.
  We identify its edge using the unit $underline(bb(F)_p) arrow.r cal(C)_(Y \, bb(F)_p)$. For each of $Y = bb(P)_C^(n - 1)$ and $Y = Omega_C^(n - 1)$, its induced point map $bb(F)_p arrow.r H_(upright(acute(e) t))^0 \( Y \, bb(F)_p \)$ is an isomorphism: the displayed row calculations make the target one-dimensional, and the constant section $1$ is nonzero. For each compact group in the descent, apply the finite projective resolution $Q_bullet$ of Lemma 20. Each evaluated internal-Hom term is an idempotent summand of finitely many copies of the point value, as in (5.5). The unit commutes with these idempotents and the differentials, so it is an isomorphism on the bottom-row computing complexes. The bar comparison identifies the map so obtained with $eta_(Y \, G \, H bb(F)_p)$ from continuous cochains. On the Drinfeld side make the same check on each compact face and then take the finite chamber: naturality of the unit with respect to face restrictions holds before the projective resolutions are chosen. Thus both degree-zero edges are the specified finite constant-section maps. This proves (9.6), with its specified maps. The generalized-one part is closed under products, and these unit maps are multiplicative, proving the assertion about cup products.
  #emph[Finite Postnikov coefficients and the sphere limit.] The finite-coefficient comparison must now retain actual lifts. Put
  $ Q \( T \) = product_(j = 1)^(n - 1) \( T - tilde(u^(- j)) \) in bb(Z) \[ T \] \, $
  where the tildes are integer lifts; the empty product at $n = 1$ is one. Then $Q \( 1 \)$ is a $p$-adic unit. The preceding bounded filtrations imply that, on the finite-coefficient cohomology, some powers of $T - 1$ and $Q \( T \)$ give the two coprime primary factors for $T = gamma$. Coefficient extensions and Postnikov fibre sequences retain this property, with possibly larger exponents. They also retain a finite bound on the cohomological amplitude of $C^(*) \( cal(M)_n \; E \)$.
  For clarity, the primary part can be taken on spectra and not merely on their homotopy groups. A bounded Postnikov spectrum with bounded $p$-primary exponent is killed, as an object, by a sufficiently large power of $p$. A polynomial in an endomorphism that vanishes on every homotopy group becomes zero as a map after a bounded power, by the Postnikov filtration. Increase the two primary exponents accordingly. The Bezout identity for the coprime factors $\( T - 1 \)^N$ and $Q \( T \)^N$ modulo that power of $p$ then gives complementary idempotents. Splitting them defines $C^(*) \( cal(M)_n \; E \)_(\( 1 \))$ functorially. Equivalently, localization of the $gamma$-action by $Q \( gamma \)$ selects this summand. The construction is exact on fibre sequences and is independent of the larger exponents used to express the two primary factors.
  The finite units $eta_(X \, G \, E)$ are $gamma$-equivariant by their base-change naturality, and their continuous sources have trivial $gamma$-action. They therefore land in this summand. Applying coefficient exact sequences to these same units extends (9.6) from $H bb(F)_p$ to finite $p$-primary Eilenberg–Mac Lane spectra. Induction through the finite Postnikov tower of $E$ proves the first two equivalences in (9.7). The last is Lemma 53. This proof uses the maps of cochain spectra throughout, and their coefficient naturality gives Hurewicz naturality. Product compatibility means compatibility with a specified coefficient pairing $E and F arrow.r E'$. The termwise cup maps for $eta$ respect this pairing, and a tensor product of two unipotent arithmetic actions is again unipotent, so they preserve the generalized-one parts.
  In particular, write the continuous sphere cochains as
  #[#set math.equation(numbering: n => "(9.10)")
   $ C_(upright("cts"))^(*) \( G \; S \) = "proj lim"_(r \, N) C_(upright("cts"))^(*) \( G \; tau_(lt.eq N) \( S \/ p^r \) \) . $ <eq:const-sphere-cochains>]
  Every displayed coefficient has finite $p$-primary homotopy groups. Take the inverse limit of the already constructed finite units and equivalences, defining the middle generalized-one object by this same limit. Every geometric pullback of a sphere class means this inverse limit of the finite constant-section pullbacks. We do not interchange an eigenspace localization with an unrestricted inverse limit. On the classifying groups, finite cohomological dimension controls the Postnikov limit in each degree; finite coefficient cohomology and the finite building comparison control the coefficient limit. This agrees with continuous totalization of termwise $p$-completed locally constant sphere cochains. Consequently a sphere-cochain representative on $K_n$ transports to one on $P_n$ with its specified mod-$p$ Hurewicz image.
  #emph[The action on a fixed connected quotient.] It remains to prove (9.8). Fix a length-one quotient $V_t arrow.r i_(*) cal(L)$ and a rational frame, with determinant lattice, of its slope-zero kernel $W_t$. On the full connected frame space the universal sequence is
  $ 0 arrow.r L_m ⊗ cal(O) arrow.r V'_n arrow.r V_t arrow.r 0 . $
  Modify it by the fixed quotient of $V_t$. On $\[ Z \/ K_m \]$ this produces
  #[#set math.equation(numbering: n => "(9.11)")
   $ 0 arrow.r W_n arrow.r V'_n arrow.r i_(*) cal(L) arrow.r 0 \,\
0 arrow.r L_m ⊗ cal(O) arrow.r W_n arrow.r W_t arrow.r 0 . $ <eq:const-modified-extension>]
  The first line defines a map $f : \[ Z \/ K_m \] arrow.r cal(M)_n$ whose positive-bundle classifying map is $b$. All bundles in the second line have slope zero. Exactness of the slope-zero/local-system equivalence therefore identifies its kernel with the actual rank-$m$ Tate local system $L_m ⊗ bb(Q)_p$, and its quotient with the fixed framed $bb(Q)_p^t$. Locally on the pro-étale, hence on the $v$-site, this sequence admits rational frames and splittings.
  Its permitted frame changes form
  #[#set math.equation(numbering: n => "(9.12)")
   $ H_(m \, t) = {mat(delim: "(", g, v; 0, 1_t) : g in K_m \, med v in M_(m \, t) \( bb(Q)_p \)} subset J_n . $ <eq:const-upper-block>]
  The determinant condition is the product of the determinant lattice of $L_m$ and the fixed one of $W_t$, using the matching convention in Lemma 54. The quotient $H_(m \, t) arrow.r K_m$ has its displayed block-diagonal section. The composition $\[ Z \/ K_m \] arrow.r B H_(m \, t) arrow.r B K_m$ is exactly $q$.
  The additive group $M_(m \, t) \( bb(Q)_p \)$ has no positive continuous cohomology with constant finite $p$-primary coefficients. Indeed, exhaust it by $p^(- r) bb(Z)_p^(m t)$. The cohomology of these compact lattices with $bb(F)_p$-coefficients is the exterior algebra on their continuous duals. Restriction to the preceding lattice multiplies each degree-one generator by $p$, and is zero in every positive degree. In degree zero it is the identity. The countable inverse-limit sequence has no derived-limit error: these cohomology systems are Mittag–Leffler, and restriction of continuous cochain terms is surjective because a compact open subset admits extension of locally constant functions. Thus only degree zero survives. Coefficient exact sequences and Postnikov induction give the same assertion for every finite Postnikov $E$.
  For the extension descent, the same lattice argument applies with an extra compact profinite parameter $T$. At $bb(F)_p$ coefficients, finite clopen rectangle refinements give
  $ "LC" \( T times \( p^(- r) bb(Z)_p^(m t) \)^bullet \; bb(F)_p \) = "colim"_(T arrow.r.twohead T_i) product_(t in T_i) C_(upright("cts"))^bullet \( p^(- r) bb(Z)_p^(m t) \; bb(F)_p \) . $
  Filtered colimits and finite products are exact, so its vertical cohomology is the locally constant $T$-family of the compact-lattice cohomology just computed. The lattice restrictions are still the identity in degree zero and zero in positive degrees, and the cochain term restrictions are surjective by extension by zero from the clopen subset $T times \( p^(- r) bb(Z)_p^(m t) \)^a$. The same Mittag–Leffler argument therefore applies. The lattices are $K_m$-stable; take $T = K_m^b$ in the outer bar for $1 arrow.r M_(m \, t) \( bb(Q)_p \) arrow.r H_(m \, t) arrow.r K_m arrow.r 1$. The resulting vertical equivalences commute with the outer faces. Totalizing this external double bar, and then using coefficient and Postnikov induction, shows that inflation from $K_m$ is an equivalence on the finite constant cochains of $H_(m \, t)$. Its inverse is restriction along the displayed section.
  For a $J_n$-class $c_J$ whose restriction to $K_n$ is $c_K$, that section followed by $H_(m \, t) arrow.r J_n$ is the upper-left block inclusion through $K_n$. Hence
  $ "res"_(H_(m \, t))^(J_n) c_J = inf_(K_m)^(H_(m \, t)) "res"_(K_m)^(K_n) c_K . $
  The $H_(m \, t)$-torsor above induces the split-frame torsor of $f$ along $H_(m \, t) arrow.r J_n$ and the torsor of $q$ along $H_(m \, t) arrow.r K_m$. The finite torsor naturality of $eta$ therefore identifies the pullback of the left side with the $J_n$ structural image pulled along $f$, and the pullback of the right side with the $K_m$ structural image pulled along $q$.
  The structural images of corresponding $c_P$ and $c_J$ in $cal(M)_n$ agree under (9.7) inside the generalized-one summand itself. Pull that equality along $f$. Its positive-bundle torsor is $b$ by (9.11), and the preceding torsor calculation identifies its split-frame side. Over the base $cal(B)$ of this diagram the resulting equality is
  $ b^(*) #scale(x: 120%, y: 120%)[\(] eta_(cal(B) \, P_n \, E) \( c_P \) #scale(x: 120%, y: 120%)[\)] = q^(*) #scale(x: 120%, y: 120%)[\(] eta_(cal(B) \, K_m \, E) \( "res"_(K_m)^(K_n) c_K \) #scale(x: 120%, y: 120%)[\)] \, $
  which is (9.8) under the classifying-pullback convention. The same equality persists under (9.10). For ordinary cohomology it is an equality of the classes that act by cup product on the supported complex on $Z$. Once this action is identified with the $K_m$-action, the $K_m$-equivariant map to the ambient affine support calculation preserves it. There is no need to extend the $B P_n$-classifying map away from the independent locus. ◻
]

== 10 Integral primitive classes and stable representatives <sec:generators>

Fix an odd prime $p$. Write $G_a = "GL"_a \( bb(Z)_p \)$, the group denoted $K_a$ in Section 9, and let $S$ be the $p$-complete sphere. The continuous cochain spectrum $C_(upright("cts"))^(*) \( G_a \; E \)$ is the one defined in Section 9: for bounded finite $p$-primary Postnikov coefficients it is continuous totalization, and complete coefficients are obtained by the compatible Postnikov and $p$-completion limits. In particular, its cohomological filtration has spectral sequence

#[#set math.equation(numbering: n => "(10.1)")
 $ E_2^(s \, t) = H_(upright("cts"))^s \( G_a \, pi_t E \) quad arrow.r.double quad pi_(t - s) C_(upright("cts"))^(*) \( G_a \; E \) . $ <gen:ahss>]

For connective $E$, the coefficient map $E arrow.r H pi_0 E$ sends a class of degree $- b$ to a class in $H_(upright("cts"))^b \( G_a \, pi_0 E \)$. We call this its leading ordinary class; it is defined even when it is zero. The source class has filtration at least $b$, and this coefficient image is its component in filtration $b$. For $pi_0 E = bb(Z)_p$, reduction modulo $p$ gives its ordinary mod-$p$ Hurewicz class.

Theorem 51 supplies the following facts for $a lt.eq p - 2$. The group $G_a$ has $p$-cohomological dimension $a^2$; its integral constant cohomology is finitely generated and $p$-torsion-free; and its mod-$p$ cohomology has the graded dimensions of the exterior algebra on degrees $1 \, 3 \, dots.h \, 2 a - 1$. We now construct compatible integral classes and lift them to sphere cochains. The regulator and top-volume comparisons then show that these selected classes generate the exterior algebras integrally and modulo $p$. Their normalization and compatibility as the rank varies will be needed in the comparison with the full frame tower.

#thm([Theorem 10.1.])[
  (Stable primitive generators).  #emph[Let $1 lt.eq N lt.eq p - 2$. There are classes 
$ c_(a \, i) in pi_(1 - 2 i) C_(upright("cts"))^(*) \( G_a \; S \) \, #h(2em) 1 lt.eq i lt.eq a lt.eq N \, $

 with leading integral classes 
$ alpha_(a \, i) in H_(upright("cts"))^(2 i - 1) \( G_a \, bb(Z)_p \) \, $

 having the following properties.]
  + #emph[The classes $alpha_(a \, i)$ induce isomorphisms of graded algebras 
$ and.big_(bb(Z)_p) \( alpha_(a \, 1) \, dots.h \, alpha_(a \, a) \) arrow.r^(med tilde.op med) H_(upright("cts"))^(*) \( G_a \, bb(Z)_p \) \, #h(2em) and.big_(bb(F)_p) \( overline(alpha)_(a \, 1) \, dots.h \, overline(alpha)_(a \, a) \) arrow.r^(med tilde.op med) H_(upright("cts"))^(*) \( G_a \, bb(F)_p \) . $

 Their rationalizations are nonzero multiples of the standard primitive classes. For $i = 1$ the class is the divided determinant logarithm.]
  + #emph[For the upper-left block inclusion $G_b arrow.r G_a$, with $b lt.eq a$, one has 
$ "res" alpha_(a \, i) = alpha_(b \, i) quad \( i lt.eq b \) \, #h(2em) "res" alpha_(a \, i) = 0 quad \( b < i lt.eq a \) . $

 The sphere representatives can be chosen so that $"res" c_(a \, i) = c_(b \, i)$ for $i lt.eq b$.]
  + #emph[Apply Proposition 55 at rank $N$. The classes $c_(N \, i)$ have transported representatives 
$ u_i in pi_(1 - 2 i) C_(upright("cts"))^(*) \( P_N \; S \) . $

 Their leading mod-$p$ classes, denoted $xi_i$, are the transported classes $overline(alpha)_(N \, i)$. On the extension space with a marked connected quotient and an $m$-dimensional Tate kernel, their constant cohomology action is the upper-left block restriction of $overline(alpha)_(N \, i)$, hence is given by $overline(alpha)_(m \, i)$ for $i lt.eq m$ and vanishes for $i > m$.]
] <thm:stable-generators>

The construction of the classes and their integrality occupy the rest of this section. The last assertion of the theorem is a compatibility of the actual cochain maps with the modification comparison. It does not use the coefficient-module calculation of Proposition 69.

=== 10.1 The continuous class from algebraic K-theory <gen:continuous-k-section>

At each positive integer $r$, the standard representation of $"GL"_a \( bb(Z) \/ p^r \)$ gives a based additive class with coefficients in $K \( bb(Z) \/ p^r \)$. We use its reduced version, obtained by subtracting its rank, and denote it by $kappa_(a \, r)$. These classes are natural for reduction in $r$. Under block sum, their pullbacks add. These statements hold already for the maps to algebraic $K$-theory, before taking homotopy groups.

#thm([Lemma 10.2.])[
  (Continuous evaluation of the standard representation).  #emph[The classes $kappa_(a \, r)$ define a continuous additive class 
$ kappa_a in pi_0 C_(upright("cts"))^(*) \( G_a \; K \( bb(Z)_p \)_p^and \) . $

 If $f : K \( bb(Z)_p \)_p^and arrow.r E$ is a map to a complete connective spectrum of finite type, composition with $f$ is represented in the continuous Postnikov cochain construction. It is compatible with restriction to blocks and with block sums. Restriction to the discrete group $G_a$ agrees with evaluation of the usual discrete algebraic $K$-theory class followed by completion and $f$.]
] <gen:k-continuity>

#proof[
  First fix a coefficient exponent $p^l$ and a bounded Postnikov interval. The $p$-adic continuity theorem applies to $bb(Z)_p$, since it is local, $p$-torsion-free, and henselian along $\( p \)$. It identifies
  $ K \( bb(Z)_p \) \/ p^l arrow.r { K \( bb(Z) \/ p^r \) \/ p^l }_r $
  on the pro systems of homotopy groups in every fixed degree; see #cite(label("GeisserHesselholt")) Theorem C. The mod-$p$ formulation also appears in #cite(label("CMM")) Section 5.2, Theorem 5.10; the assertion for $p^l$ follows from it by the finite coefficient exact sequences. The relevant homotopy groups of the finite rings are finite. In positive degrees this is the usual finiteness of the $K$-groups of a finite ring #cite(label("WeibelKBook")) Chapter IV, Proposition 1.16; it can also be obtained from stability for its finite linear groups and rational acyclicity. Degree zero becomes finite after reduction modulo $p^l$.
  Consequently the displayed map is a pro-Postnikov equivalence on the chosen interval. Explicitly, the inverse systems of finite groups are Mittag–Leffler. An isomorphism from a finite constant system to their limit has pro-zero kernel and cokernel: after passing to stable images, the system is an inverse system of surjections, and the finite limit detects its stable image at every fixed stage. Induction through the finitely many Postnikov fibers gives the corresponding statement for spectra on the interval. Alternatively, the pro homotopy-group form of the cited continuity theorem gives this directly.
  For these bounded targets the natural maps out of the constant system can therefore be computed after passage far enough down the finite-ring tower. The representative $kappa_(a \, r)$ then factors through the finite congruence quotient of $G_a$ and is a continuous cochain representative. The pro equivalence retains the homotopies between these representatives, so the construction is compatible as both the Postnikov interval and $l$ increase. Taking these complete limits defines $kappa_a$ and its composites with $f$. The finite-stage construction commutes with block sum, and therefore so do the limits. Finally, every comparison was induced by reduction of the usual standard representation, which proves the assertion about discrete evaluation.
  Only bounded Postnikov intervals are needed to form any fixed ordinary cohomology component. Thus this construction of the ordinary components is available at arbitrary ranks, even when we will use a finite cohomological dimension bound only in the range $a lt.eq p - 2$. ◻
]

Let $ell_p$ denote the connective Adams summand of $p$-complete complex $K$-theory, so that

$ pi_(*) ell_p = bb(Z)_p \[ v \] \, #h(2em) \| v \| = 2 p - 2 . $

We fix the choices in the following local calculation once for all ranks.

#thm([Lemma 10.3.])[
  (Local K-theory coordinates).  #emph[For $2 lt.eq i lt.eq p - 2$, there are spectrum maps 
$ f_i : K \( bb(Z)_p \)_p^and arrow.r Sigma^(2 i - 1) ell_p $

 which induce a generator coordinate on the free group in degree $2 i - 1$. Via the integral etale edge and localization for $bb(Q)_p$, this coordinate identifies that group with $H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \)$, up to a $p$-adic unit.]
] <gen:local-k-coordinates>

#proof[
  Use the connective-cover comparison between local algebraic $K$-theory and topological cyclic homology #cite(label("HesselholtMadsenWitt")) Theorem D and Addendum 5.2, together with the odd-prime decomposition of $"TC" \( bb(Z) \)_p^and$; see #cite(label("BlumbergMandellTC")) Sections 2 and 7. The summands indexed by twists $i = 2 \, dots.h \, p - 2$ are the connective suspensions $Sigma^(2 i - 1) ell_p$. Projection to one of them gives $f_i$. Only these nonexceptional twist residues are used. In particular the argument uses the local calculation and imposes no regular-prime condition on global algebraic $K$-theory.
  Put $d = 2 i - 1$ and $X = K \( bb(Z)_p \)_p^and$. The same decomposition gives
  $ pi_d X = bb(Z)_p \, #h(2em) pi_(d - 1) X = 0 \, #h(2em) g_i := \( f_i \)_(*) : pi_d X arrow.r^tilde.op pi_0 ell_p = bb(Z)_p . $
  To check the adjacent degree, write $L$ for the periodic $p$-complete Adams summand and $J = L_(K \( 1 \)) S$. The decomposition has summands $j$, $Sigma j'$, and $z_0 \, dots.h \, z_(p - 2)$. Here $j$ and $j'$ are the connective covers of $J$ and $J'$, with $J'$ noncanonically equivalent to $J$; $z_k$ is the $1$-connected cover of $Sigma^(2 k - 1) L$ for $k eq.not 0$, and $z_0$ is the $\( - 2 \)$-connected cover of $Sigma^(- 1) L$. Passing to $X$ takes the connective cover of this wedge. Now $pi_(*) L$ is concentrated in degrees divisible by $2 \( p - 1 \)$, while $pi_(*) J$ is concentrated in degree zero and in degrees congruent to $- 1$ modulo $2 \( p - 1 \)$. Thus, in the range $3 lt.eq d lt.eq 2 p - 5$, only the bottom group of the summand $Sigma^d ell_p$ contributes in degree $d$, and no summand contributes in degree $d - 1$. These descriptions are in #cite(label("BlumbergMandellTC")) Section 2.
  Write $K_j \( A \; bb(Z) \/ p^r \) = pi_j \( K \( A \) \/ p^r \)$. For a connective spectrum, the completion map is an equivalence modulo $p^r$: it is an equivalence modulo $p$, and the Moore spectrum for $p^r$ is built by finitely many extensions from the Moore spectrum for $p$. The coefficient exact sequence and $pi_(d - 1) X = 0$ therefore identify
  $ \( pi_d X \) \/ p^r arrow.r^tilde.op K_d \( bb(Z)_p \; bb(Z) \/ p^r \) . $
  The localization sequence for $bb(Z)_p subset bb(Q)_p$ has residue term $K \( bb(F)_p \)$. By #cite(label("HesselholtMadsenWitt")) Theorem B and the following paragraph, $K \( bb(F)_p \)_p^and tilde.eq H bb(Z)_p$, so $K \( bb(F)_p \) \/ p^r tilde.eq H \( bb(Z) \/ p^r \)$. Since $d gt.eq 3$, localization and #cite(label("HesselholtMadsenLocalFields")) Theorem A, the descent spectral sequence (6.1.9), and Theorem 6.1.10 consequently give compatible isomorphisms
  $ \( pi_d X \) \/ p^r arrow.r^tilde.op K_d \( bb(Q)_p \; bb(Z) \/ p^r \) arrow.r^tilde.op H^1 \( bb(Q)_p \, mu_(p^r)^(⊗ i) \) . $
  The last theorem applies to the complete characteristic-zero discrete valuation field $bb(Q)_p$, whose residue field is perfect of characteristic $p > 2$. Its odd-degree isomorphism is the unique $H^1$ edge of the canonical etale comparison and is natural in the coefficient maps. Continuous integral cochains are the inverse limit of the finite-coefficient cochains. Their transitions are surjective by choosing set sections of the finite coefficient maps, and the finite groups in degree zero have vanishing $"proj lim"^1$. Taking the inverse limit gives an isomorphism
  $ "edge"_i : pi_d X arrow.r^tilde.op H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \) . $
  Consequently $g_i compose "edge"_i^(- 1)$ is an integral isomorphism from this etale group to $bb(Z)_p$. The universal Chern regulator used below is compared with these coordinates in Lemma 61. ◻
]

Compose $kappa_a$ with $f_i$, and write the resulting class as

#[#set math.equation(numbering: n => "(10.2)")
 $ z_(a \, i) in pi_(1 - 2 i) C_(upright("cts"))^(*) \( G_a \; ell_p \) . $ <gen:ell-class>]

Its leading integral class is denoted $alpha_(a \, i)$. These leading classes are defined at every rank by the bounded construction in Lemma 57.

=== 10.2 Rational primitivity and the lift through the image of J <gen:sphere-lifts-section>

Write $b_i$ for the standard rational primitive in degree $2 i - 1$ in matrix Lie algebra cohomology. We normalize it as the transgression of the algebraic de Rham Chern class $c_i$. Equivalently it is the primitive used to define the $p$-adic Borel regulator in #cite(label("HuberKings")) Definition 0.4.5 and Remark 0.4.6. Restriction to $frak(g l)_a$ is zero for $i > a$. The same notation will be used for its image in continuous rational group cohomology under the Lazard comparison.

#thm([Lemma 10.4.])[
  (Rational components of the additive class).  #emph[For $a lt.eq p - 2$ and $i lt.eq a$, the only possibly nonzero rational ordinary-cohomology component of $z_(a \, i)$ is its component in degree $2 i - 1$. Moreover $alpha_(a \, i) ⊗ bb(Q)_p$ is a scalar multiple of $b_i$.]
] <gen:rational-components>

#proof[
  The standard representation is additive for block sum and each $f_i$ is a map of spectra. Thus every rational ordinary component of $z_(a \, i)$ is primitive under block sum. To interpret this statement stably, work first in a fixed bounded Postnikov interval of the coefficient spectrum. Lemma 57 constructs its components at all matrix ranks, compatibly. Clear the finitely many denominators on this interval and then rationalize the resulting continuous integral cohomology classes. This gives the usual stable primitive condition without any exchange of an unbounded Postnikov limit with rationalization.
  The primitive space in stable rational matrix Lie cohomology is one-dimensional in each degree $2 j - 1$, generated by $b_j$, and its restriction to rank $a$ vanishes for $j > a$. The possible ordinary components of (10.2) have degrees
  $ 2 i - 1 + 2 r \( p - 1 \) = 2 #scale(x: 120%, y: 120%)[\(] i + r \( p - 1 \) #scale(x: 120%, y: 120%)[\)] - 1 \, #h(2em) r gt.eq 0 . $
  If $r > 0$, the corresponding primitive index exceeds $a$, since $a lt.eq p - 2$. These components therefore vanish. The component for $r = 0$ is a multiple of $b_i$, as asserted. ◻
]

#thm([Lemma 10.5.])[
  (Sphere representatives).  #emph[For $1 lt.eq i lt.eq a lt.eq p - 2$, the class $alpha_(a \, i)$ has a representative in $pi_(1 - 2 i) C_(upright("cts"))^(*) \( G_a \; S \)$. For $i gt.eq 2$ its image in $ell_p$ is $z_(a \, i)$. For $i = 1$ one can take the pullback of the divided logarithm along the determinant.]
] <gen:sphere-representatives>

#proof[
  Put $q_0 = 2 p - 2$, and choose $q in bb(Z)_p^times$ whose Adams operation generates the pro-Adams action and whose finite residue is primitive. The operation $psi^q - 1$ on $ell_p$ is zero on $pi_0$, so it factors through the positive connective cover, identified with $Sigma^(q_0) ell_p$. Denote the resulting map by
  $ theta : ell_p arrow.r Sigma^(q_0) ell_p \, #h(2em) j_p = "fib" \( theta \) . $
  This is the connective image-of-$J$ fiber, and the sphere unit lifts to a map $S arrow.r j_p$.
  For any fixed suspension of $ell_p$, spectral sequence (10.1) has finitely many contributing groups on each total degree, since $s lt.eq a^2$. All of them are finite free over $bb(Z)_p$ by Theorem 51. The rational spectral sequence has zero differentials, because the rational coefficient spectrum is a direct sum of ordinary Eilenberg–Mac Lane spectra in this finite range. Induction on the pages shows that the integral differentials also vanish: a map between the free groups on a page which vanishes rationally is zero. The resulting finite extensions of free $bb(Z)_p$-modules are free. In particular the abutment in each fixed total degree is torsion-free and injects into its rationalization.
  By Lemma 59, the rational class $z_(a \, i)$ has only its degree-zero coefficient component. The map $theta$ kills this component. Thus $theta z_(a \, i)$ is rationally zero, and the torsion-freeness just proved makes it zero integrally. A choice of its nullhomotopy lifts $z_(a \, i)$ to cochains with coefficients in $j_p$.
  The classical odd-primary image-of-$J$ range identifies $S arrow.r j_p$ on homotopy below the first beta stem
  $ b_p = 2 p \( p - 1 \) - 2 . $
  We use only degrees at most $a^2$, and
  #[#set math.equation(numbering: n => "(10.3)")
   $ a^2 lt.eq \( p - 2 \)^2 < 2 p \( p - 1 \) - 2 . $ <gen:beta-range>]
  The finite continuous cohomological dimension bound shows that coefficients above degree $a^2$ cannot affect a negative-degree cochain class. Indeed a coefficient in degree $t > a^2$ contributes only total degrees $t - s > 0$. Therefore $S arrow.r j_p$ induces the needed isomorphism in degree $1 - 2 i$ on continuous cochains, and the lifted $j_p$ class has a sphere representative. We use here the usual first image-of-$J$ range, as recorded in the classical calculation of the odd-primary stable stems; see #cite(label("RavenelGreenBook")) Theorems 1.1.14 and 1.5.19(a).
  For $i = 1$, normalize the logarithm by
  $ lambda : bb(Z)_p^times arrow.r bb(Z)_p \, #h(2em) lambda \( u \) = frac(log u, log \( 1 + p \)) . $
  It kills the Teichmuller factor and sends $1 + p$ to $1$. The group $bb(Z)_p^times$ has $p$-cohomological dimension one. In total degree $- 1$, its connective sphere-cochain spectral sequence therefore has just the entry $H^1 \( bb(Z)_p^times \, bb(Z)_p \)$. Thus $lambda$ lifts to a sphere cochain, whose pullback along $det : G_a arrow.r bb(Z)_p^times$ defines $c_(a \, 1)$ and $alpha_(a \, 1)$. ◻
]

=== 10.3 The integral regulator lattice <gen:regulator-section>

The preceding argument does not yet show that the leading classes are generators modulo $p$. For that purpose we first determine their rational normalization relative to $b_i$.

We first record the compact-coefficient finiteness used below. Let $T = bb(Z)_p \( i \)$, $T_r = T \/ p^r T$, and $M = H_(upright("cts"))^1 \( G_(bb(Q)_p) \, T \)$. Finite-coefficient local Galois cohomology is finite #cite(label("MilneADT")) Chapter I, Theorem 2.1. Continuous cochains with coefficients in $T$ are the inverse limit of the $T_r$ cochains, whose transitions are surjective by choosing set sections of the finite coefficient maps. The finite groups $H^0 \( G_(bb(Q)_p) \, T_r \)$ have zero $"proj lim"^1$, so $M = "proj lim"_r H^1 \( G_(bb(Q)_p) \, T_r \)$ is a compact pro-$p$ module. The coefficient sequence for multiplication by $p$ gives an injection $M \/ p M arrow.r.hook H^1 \( G_(bb(Q)_p) \, T_1 \)$. Choose lifts $m_1 \, dots.h \, m_e$ of a finite basis of $M \/ p M$. Successive reduction modulo $p$ expresses any element as a $bb(Z)_p$-linear combination of these lifts plus a remainder in $p^N M$. That remainder tends to zero: its projection to the group with coefficients $T_r$ is zero once $N gt.eq r$. The coefficient sums converge in $bb(Z)_p$, proving that $M$ is finitely generated. This supplies the compact integral assertion without applying a theorem about discrete finitely generated modules to $T$.

#thm([Lemma 10.6.])[
  (Integral Soulé coordinate).  #emph[Let $2 lt.eq i lt.eq p - 2$, $d = 2 i - 1$, and $X = K \( bb(Z)_p \)_p^and$. There is a $bb(Z)_p$-linear isomorphism 
$ c_i^(upright(S)) : pi_d X arrow.r^tilde.op H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \) $

 whose value on the completion of $x in K_d \( bb(Z)_p \)$ rationalizes to the Soulé regulator $r_p \( x \)$ of #cite(label("HuberKings")) Section 1.3, restricted from $bb(Q)_p$ by localization.]
] <gen:soule-coordinate>

#proof[
  Write $M_i = H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \)$. First match the coefficient conventions. For a connective $K$-theory spectrum $Y$, the mod-$q$ Moore space $P^d \( q \)$ used in #cite(label("WeibelEtaleChern")) Section 1, Example 1.4 has suspension spectrum $Sigma^(d - 1) S \/ q$. Adjunction and the fiber/cofiber triangle give
  $ \[ P^d \( q \) \, Omega_0^oo Y \] = pi_(d - 1) F \( S \/ q \, Y \) = pi_(d - 1) Sigma^(- 1) \( Y \/ q \) = pi_d \( Y \/ q \) . $
  Here $d gt.eq 3$, so the connected Moore space maps to the identity component. With the common cofiber orientation these identifications commute with ordinary reduction and coefficient maps.
  Compose the finite-coefficient identifications in Lemma 58 with the universal etale Chern maps
  $ c_(i \, r)^(upright(S)) : \( pi_d X \) \/ p^r arrow.r^tilde.op K_d \( bb(Q)_p \; bb(Z) \/ p^r \) arrow.r^(c_(i \, 1)) H^1 \( bb(Q)_p \, mu_(p^r)^(⊗ i) \) . $
  The last map is defined in #cite(label("WeibelEtaleChern")) Section 2, equation (2.1) by the standard representation’s universal Chern class, its Kunneth component, and the mod-$p^r$ Hurewicz map. Its coefficient prime is invertible in $bb(Q)_p$. Proposition 2.4 there gives additivity for odd coefficients, and Proposition 2.8 gives compatibility with coefficient reductions for $d gt.eq 2$. Their inverse limit is therefore a continuous additive, hence $bb(Z)_p$-linear, map $c_i^(upright(S)) : pi_d X arrow.r M_i$. The compatible etale edges identify the projection to coefficients $bb(Z) \/ p$ with the quotient $M_i arrow.r M_i \/ p M_i$, and thus $M_i \/ p M_i tilde.equiv H^1 \( bb(Q)_p \, mu_p^(⊗ i) \)$.
  We prove that the mod-$p$ Chern map over $bb(Q)_p$ is onto. Put $L = bb(Q)_p \( zeta_p \)$. The polynomial $Phi_p \( 1 + T \)$ is Eisenstein, so $\[ L : bb(Q)_p \] = p - 1$. By #cite(label("WeibelEtaleChern")) Proposition 5.2, the cokernel of
  $ c_(i \, 1) : K_(2 i - 1) \( L \; bb(Z) \/ p \) arrow.r H^1 \( L \, mu_p^(⊗ i) \) $
  is annihilated by $\( i - 1 \) !$. Its hypotheses are $i gt.eq 2$ and $q equiv.not 2 med \( mod med 4 \)$ for a field containing $1 \/ q$ and a primitive $q$th root. They hold for $q = p$ and $L$ above. Since $\( i - 1 \) !$ is a unit modulo $p$, this map is onto.
  For the finite separable extension $bb(Q)_p subset L$, #cite(label("WeibelEtaleChern")) Proposition 4.4 gives
  $ i #scale(x: 120%, y: 120%)[\(] c_(i \, 1) \( N_(L \/ bb(Q)_p) y \) - "cor"_(L \/ bb(Q)_p) c_(i \, 1) \( y \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( y in K_d \( L \; bb(Z) \/ p \) \) . $
  Because $i$ is a unit modulo $p$, the two maps agree. On $H^1 \( bb(Q)_p \, mu_p^(⊗ i) \)$, restriction followed by corestriction is multiplication by $p - 1$. Given $h$ in this group, choose $y$ with $c_(i \, 1) \( y \) = \( p - 1 \)^(- 1) "res"_(L \/ bb(Q)_p) h$. Then $c_(i \, 1) \( N_(L \/ bb(Q)_p) y \) = h$, proving surjectivity over $bb(Q)_p$. The compatible edges identify both the source and target of this mod-$p$ map with $bb(F)_p$. It is the reduction of $c_i^(upright(S))$, so that reduction is an isomorphism. Both integral modules are free of rank one; consequently $c_i^(upright(S))$ is an isomorphism.
  It remains to identify this integral map on discrete classes. All the coefficient identifications above are induced by completion and localization, so the reduction of $hat(x)$ corresponds to the ordinary reduction of the localized class $x$. By #cite(label("WeibelEtaleChern")) Lemma 2.3, the finite Chern map on this reduction is evaluation of the same universal etale Chern class on the integral Hurewicz image of $x$. The proof of Proposition 2.8 there makes these evaluation maps compatible already in the coefficient triangles. For a fixed $x$, its Hurewicz image is represented by a finite bar cycle at a finite matrix rank. Evaluating the compatible integral universal class on that cycle and reducing therefore gives $c_(i \, r)^(upright(S)) \( hat(x) med mod med p^r \)$ at every $r$. The isomorphism $M_i = "proj lim"_r H^1 \( bb(Q)_p \, mu_(p^r)^(⊗ i) \)$ makes the integral evaluation uniquely equal to $c_i^(upright(S)) \( hat(x) \)$.
  The regulator in #cite(label("HuberKings")) Section 1.3 evaluates the universal standard-representation etale Chern class with $bb(Q)_p \( i \)$ coefficients on the same Hurewicz image. It is the coefficient image of the usual integral class just used: these Chern classes are normalized on line bundles and characterized by the splitting principle. Hence, with the common suspension convention,
  $ r_p \( x \) = c_i^(upright(S)) \( hat(x) \) ⊗ 1 quad upright("in ") H^1 \( bb(Q)_p \, bb(Q)_p \( i \) \) #h(2em) \( x in K_d \( bb(Z)_p \) \) . $
  Here the target is $M_i \[ 1 \/ p \]$. Indeed a continuous map from a compact power of $G_(bb(Q)_p)$ to $bb(Q)_p \( i \)$ has bounded image, so it lies in $p^(- N) bb(Z)_p \( i \)$ for some $N$. Thus rational continuous cochains are the localization of integral continuous cochains, and localization is exact. This comparison evaluates a fixed finite bar cycle and uses the inverse limit in the target; it makes no exchange of an unbounded group-cohomology limit with rationalization. ◻
]

We use the Bloch–Kato exponential of #cite(label("BlochKatoTamagawa")) Definition 3.10 and Proposition 1.17; its specialization to $bb(Q)_p \( i \)$ and the isomorphism for $i > 1$ are recalled in #cite(label("HuberKings")) Section 1.3.

#thm([Lemma 10.7.])[
  (The integral exponential lattice).  #emph[For $2 lt.eq i lt.eq p - 2$, use the standard period basis to identify $D_(upright("dR")) \( bb(Q)_p \( i \) \)$ with $bb(Q)_p$. Then 
$ exp_(upright("BK"))^(- 1) H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \) = p^i bb(Z)_p . $

]
] <gen:exponential-lattice>

#proof[
  For $i gt.eq 2$, the rational group $H^1 \( bb(Q)_p \, bb(Q)_p \( i \) \)$ is crystalline and is identified with $bb(Q)_p$ by the Bloch–Kato exponential. The integral group $H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \)$ is free of rank one. Indeed local Galois cohomology is finitely generated, its rational rank is one, and its torsion vanishes because $H^0 \( bb(Q)_p \, \( bb(Q)_p \/ bb(Z)_p \) \( i \) \) = 0$: the mod-$p$ cyclotomic character to the $i$th power is nontrivial in the stated range.
  We shall construct one primitive integral extension using Fontaine–Laffaille theory over the absolutely unramified field $bb(Q)_p$. We use covariant filtered Frobenius conventions with weights $- i$ and $0$. Taking the filtered dual puts these weights in $\[ 0 \, i \] subset \[ 0 \, p - 2 \]$, where the original contravariant Fontaine–Laffaille functor applies. Its exact lattice construction is #cite(label("FontaineLaffaille")) Section 7.14 and Proposition 7.15(i); its full faithfulness on the reductions modulo $p$ is #cite(label("FontaineLaffaille")) Theorem 6.1. The latter applies since the interval avoids filtration degree $p - 1$. The rational comparison in #cite(label("FontaineLaffaille")) Theorem 8.4(ii) identifies the functor on the filtered dual with the original covariant crystalline representation. Thus strongly divisible extensions in our conventions give integral crystalline extensions of $bb(Z)_p$ by $bb(Z)_p \( i \)$, compatibly with reduction and rationalization.
  The rank-one endpoint has the standard period scale. Let $C = hat(overline(bb(Q)_p))$, $R = cal(O)_(C^flat)$, and $theta : W \( R \) arrow.r cal(O)_C$. We also write $theta$ for the residue map $B_(upright("dR"))^(+) arrow.r C$. Choose $xi = \[ x_0 \] + p$ with $x_0^sharp = - p$, so $ker theta = \( xi \)$. At $q = p$, the period ring and its filtered pieces are
  $ cal(S) = W \( R \) \[ xi^p \/ p \] \, #h(2em) cal(S)^j = \( xi^j \, xi^p \/ p \) quad \( 0 < j < p \) $
  by #cite(label("FontaineLaffaille")) Section 2.5 and Lemma 5.4; write $hat(cal(S))^(thin j)$ for their separated $p$-adic completions as in Section 7.14 there. Choose a generator $e_(upright("cyc"))$ of $bb(Z)_p \( 1 \)$, represented by a primitive compatible root system $epsilon.alt = \( 1 \, zeta_p \, zeta_(p^2) \, dots.h \)$, and put $mu = \[ epsilon.alt \] - 1 = xi a$ with $a in W \( R \)$. The logarithm $t_(upright("cyc")) = log \[ epsilon.alt \]$ belongs to $hat(cal(S))^(thin 1)$. Indeed, if $k = p m + r$ with $0 lt.eq r < p$,
  $ mu^k / k = p^m / k thin xi^r a^k (xi^p / p)^m . $
  Here $m - v_p \( k \) gt.eq 0$ and tends to infinity with $k$. Each term lies in $cal(S)^1$ (when $r = 0$, $m gt.eq 1$), and the logarithm series converges in its $p$-adic completion. The displayed ideals give $\( cal(S)^1 \)^i subset.eq cal(S)^i$, while $phi.alt \( t_(upright("cyc")) \) = p t_(upright("cyc"))$ #cite(label("FontaineBarsottiTate")) Section 4.11. Here the completed divided Frobenius is $phi.alt_i = p^(- i) phi.alt : hat(cal(S))^(thin i) arrow.r hat(cal(S))$. Thus $t_(upright("cyc"))^i in hat(cal(S))^(thin i)$ and $phi.alt_i \( t_(upright("cyc"))^i \) = t_(upright("cyc"))^i$.
  The same ideal formula shows that $x mapsto theta \( x \/ xi^i \)$ sends $cal(S)^i$ to $cal(O)_C$: the generator $xi^p \/ p$ contributes zero because $i < p$. This map extends $p$-adically to $hat(cal(S))^(thin i)$ and, under the filtered period embedding in the proof of #cite(label("FontaineLaffaille")) Theorem 8.4(ii), is the same residue map. For the primitive period just chosen, the proof of #cite(label("FontaineBarsottiTate")) Proposition 2.17, pp. 543–544 computes $v_p theta \( t_(upright("cyc")) \/ xi \) = 1 \/ \( p - 1 \)$. Consequently
  $ v_p theta (frac(t_(upright("cyc"))^i \/ p, xi^i)) = frac(i, p - 1) - 1 < 0 \, $
  so $t_(upright("cyc"))^i \/ p in.not hat(cal(S))^(thin i)$. For the positive rank-one object of weight $i$ with $phi.alt_i \( f_i \) = f_i$, its realization is $L_i = { s in hat(cal(S))^(thin i) : phi.alt_i \( s \) = s }$. Rank preservation and rational comparison make $L_i$ a rank-one lattice in $bb(Q)_p t_(upright("cyc"))^i$. It contains $t_(upright("cyc"))^i$ but not $t_(upright("cyc"))^i \/ p$, hence $L_i = bb(Z)_p t_(upright("cyc"))^i$. The unit $1$ is primitive at weight zero since $theta \( hat(cal(S)) \) subset.eq cal(O)_C$. The corresponding covariant basis is therefore the standard period basis $e_i = t_(upright("cyc"))^(- i) ⊗ e_(upright("cyc"))^(⊗ i)$.
  Here is the lattice calculation in those conventions. Let $e_i$ be the standard basis of the rank-one filtered Frobenius object for $bb(Q)_p \( i \)$, with $phi.alt \( e_i \) = p^(- i) e_i$, and choose an integral lift $e_0$ of the quotient basis. Write
  $ "Fil"^0 = bb(Z)_p \( e_0 + x e_i \) \, #h(2em) phi.alt \( e_0 \) = e_0 + y e_i . $
  Strong divisibility is exactly
  #[#set math.equation(numbering: n => "(10.4)")
   $ x in bb(Z)_p \, #h(2em) z := y + p^(- i) x in bb(Z)_p . $ <gen:fl-conditions>]
  Indeed the second condition says that $phi.alt \( "Fil"^0 \)$ is integral. The condition in filtration $- i$ follows because $p^i y = p^i z - x$ is integral, and generation holds because $p^i phi.alt \( e_i \) = e_i$ while the degree-zero filtered generator maps to a lift of $e_0$. These are all the conditions for the two-step filtered object. Subtracting the rational Frobenius splitting gives the exponential parameter
  #[#set math.equation(numbering: n => "(10.5)")
   $ x - frac(y, 1 - p^(- i)) = frac(x - z, 1 - p^(- i)) . $ <gen:fl-parameter>]
  As $x \, z$ range independently over $bb(Z)_p$, this ranges exactly over $p^i bb(Z)_p$, since $p^i - 1$ is a unit. Replacing $e_0$ by $e_0 + b e_i$, $b in bb(Z)_p$, replaces both $x$ and $z$ by their differences with $b$, so (10.5) is independent of this change of integral lift.
  To see that the resulting lattice is the whole integral Galois cohomology lattice, take $x = 1$ and $z = 0$. Its extension modulo $p$ does not split in the filtered category. This can be checked directly in the standard positive interval: if $f_i \, f_0$ are dual to $e_i \, e_0$, the dual lattice has
  $ phi.alt \( f_0 \) = f_0 \, #h(2em) phi.alt \( f_i \) = p^i f_i + f_0 \, #h(2em) "Fil"^j = bb(Z)_p \( f_i - f_0 \) quad \( 1 lt.eq j lt.eq i \) . $
  Its divided Frobenius satisfies $phi.alt_i \( f_i - f_0 \) = f_i$. A filtered section of the weight-$i$ quotient modulo $p$ must lift its basis to $f_i - f_0$; commuting with $phi.alt_i$ would require its image to be $f_i - f_0$ instead of $f_i$. Thus no such section exists. In the original coordinates this is the invariant $x - z = 1$ under all changes of lift, even after reduction. Full faithfulness on finite objects implies that the corresponding Galois extension modulo $p$ does not split either: a Galois splitting would lift to a filtered splitting. Its class in $H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \)$ is consequently not divisible by $p$, and hence generates that rank-one free module. Its exponential parameter is $p^i \/ \( p^i - 1 \)$ by (10.5). This proves $exp_(upright("BK"))^(- 1) H^1 \( bb(Q)_p \, bb(Z)_p \( i \) \) = p^i bb(Z)_p$ using the exact construction, finite full faithfulness, and rational comparison just cited. ◻
]

The integral lattice fixes the scale of a generator of local Galois cohomology. To compare that scale with the continuous primitive $b_i$, we will evaluate both classes on a discrete algebraic $K$-class. The following lemma supplies a class on which this comparison detects a nonzero scalar.

#thm([Lemma 10.8.])[
  (A detected discrete regulator class).  #emph[For $2 lt.eq i lt.eq p - 2$, the Soulé regulator 
$ r_p : K_(2 i - 1) \( bb(Z)_p \) ⊗_(bb(Z)) bb(Q)_p arrow.r H^1 \( bb(Q)_p \, bb(Q)_p \( i \) \) $

 is nonzero.]
] <gen:detected-regulator>

#proof[
  Choose a nonidentity Teichmuller root of unity $xi in bb(Z)_p^times$ and put $F = bb(Q) \( xi \)$. The symbol $\[ xi \]_i$ lies in degree one of de Jeu’s rational weight-$i$ polylogarithmic complex over $F$ #cite(label("DeJeuWedge")), in the presentation of #cite(label("BesserDeJeu")) p. 868. Its differential is $\[ xi \]_(i - 1) ⊗ xi$ for $i > 2$ and $\( 1 - xi \) and xi$ for $i = 2$; both vanish because $xi$ is torsion in $F^times$, hence zero in $F^times ⊗_(bb(Z)) bb(Q)$. The first map in #cite(label("BesserDeJeu")) Theorem 1.12 sends the resulting degree-one cohomology class to $K_(2 i - 1) \( F \) ⊗_(bb(Z)) bb(Q)$. For the chosen embedding $F arrow.r bb(Q)_p$, let $cal(O)$ be the localization of the integers of $F$ at the corresponding prime above $p$. Both $xi$ and $1 - xi$ are units there. The same theorem sends the rational $K$-class through the localization isomorphism and the map to local algebraic $K$-theory before applying the syntomic regulator. This number-field case requires no conjectural weight assumption; see #cite(label("BesserDeJeu")) p. 871, the paragraph preceding Theorem 1.10, and Remark 1.13. The regulator here is the syntomic Chern character in the normalized coordinate of #cite(label("BesserDeJeu")) Definition 4.6 and Appendix A. Its value is $plus.minus \( i - 1 \) ! "Li"_i \( xi \)$, since the logarithmic correction terms vanish at $xi$.
  There is some such $xi$ for which this value is nonzero. To see this directly, use the Coleman measure identity
  #[#set math.equation(numbering: n => "(10.6)")
   $ \( 1 - p^(- i) \) "Li"_i \( xi \) = lim_(r arrow.r oo) frac(sum_(1 lt.eq b < p^r\
p divides.not b) xi^b b^(- i), 1 - xi^(p^r)) \, #h(2em) xi^p = xi eq.not 1 \; $ <gen:coleman-measure>]
  see #cite(label("BesserDeJeuAlgorithm")) Proposition 4.8 and Corollary 4.9, where the proof of Proposition 4.8 attributes the measure formula to #cite(label("Coleman")) Lemma 7.2. This is integration of $x^(- i)$ on $bb(Z)_p^times$ against the bounded measure whose mass on $b + p^r bb(Z)_p$ is $xi^b \/ \( 1 - xi^(p^r) \)$. The masses are compatible under refinement by the geometric-series identity, so their integral modulo $p$ is computed at level one. This finite-polylogarithm reduction is the one developed in #cite(label("BesserFinitePolylog")) Proposition 2.1 and Corollary 2.2. Its numerator is the finite polylogarithm
  $ P_i \( X \) = sum_(b = 1)^(p - 1) b^(- i) X^b in bb(F)_p \[ X \] . $
  This polynomial is nonzero, has degree $p - 1$, and vanishes at both $0$ and $1$; the latter uses $1 lt.eq i lt.eq p - 2$. It cannot vanish at every element of $bb(F)_p$, since that would give at least $p$ distinct roots. Some $overline(xi) in bb(F)_p^times \\ { 1 }$ therefore has $P_i \( overline(xi) \) eq.not 0$, and its Teichmuller lift makes the right side of (10.6) nonzero. The denominator is a unit. Since $1 - p^(- i) eq.not 0$, this proves $"Li"_i \( xi \) eq.not 0$, and hence the normalized Chern-character regulator above is nonzero.
  On Hurewicz images from positive algebraic $K$-groups, evaluation of the usual Chern-character component of degree $i$ is $\( - 1 \)^(i - 1) \/ \( i - 1 \) !$ times evaluation of $c_i$; see #cite(label("TammeRelativeChern")) the remark after Definition 4.23 and Section 5.9. The comparison from the syntomic theory used by Huber–Kings to the modified theory above preserves Chern classes, by #cite(label("BesserDeJeu")) Section 4 and #cite(label("HuberKings")) Propositions 2.2.7 and 2.2.9. Because the normalized coordinate is an isomorphism, its nonzero character value implies a nonzero syntomic Chern value in the Huber–Kings theory. Their isomorphism $eta : H_(upright("syn"))^1 \( bb(Z)_p \, i \) arrow.r^tilde.op bb(Q)_p$ is defined in #cite(label("HuberKings")) Definition 2.2.5. By Proposition 2.3.4 there, evaluation of this Chern class followed by $eta$ and the Bloch–Kato exponential is the etale regulator $r_p$. The exponential is an isomorphism for $i > 1$ by Section 1.3 there. Thus the preceding construction supplies a discrete rational algebraic $K$-theory class $x$ with $r_p \( x \) eq.not 0$. If it is initially regarded over $bb(Q)_p$, it has a preimage in $K_(2 i - 1) \( bb(Z)_p \) ⊗ bb(Q)_p$ by #cite(label("HuberKings")) Remark 1.3.1, since $i > 1$; the regulator extends $bb(Q)_p$-linearly. ◻
]

We can now determine the normalization of the classes selected by the fixed local $K$-theory coordinates. The argument needs the integral exponential lattice and a single detected evaluation; the two preceding lemmas supply these separately.

#thm([Lemma 10.9.])[
  (Normalization of the selected primitives).  #emph[With the choices of Lemma 58, there are units $epsilon_i in bb(Z)_p^times$, independent of the matrix rank, such that 
#[#set math.equation(numbering: n => "(10.7)")
 $ alpha_(a \, i) ⊗ bb(Q)_p = epsilon_i p^(- i) b_i #h(2em) \( 2 lt.eq i lt.eq a lt.eq p - 2 \) . $ <gen:primitive-normalization>]

 The same formula holds for $i = 1$, with a unit $epsilon_1$ determined by the divided logarithm.]
] <lem:regulator-lattice>

#proof[
  For $i gt.eq 2$, put $g_i = \( f_i \)_(*)$ and define
  $ t_i = exp_(upright("BK"))^(- 1) #scale(x: 120%, y: 120%)[\(] c_i^(upright(S)) \( g_i^(- 1) \( 1 \) \) #scale(x: 120%, y: 120%)[\)] . $
  Lemma 62 and Lemma 61 give $t_i in p^i bb(Z)_p^times$. Write $alpha_i$ for the stable compatible family of leading classes, and let $alpha_i^delta$ and $b_i^delta$ denote the stable discrete restrictions of the compatible continuous classes. The bottom Postnikov composite
  $ K \( bb(Z)_p \)_p^and arrow.r^(f_i) Sigma^(2 i - 1) ell_p arrow.r Sigma^(2 i - 1) H bb(Z)_p $
  induces $g_i$ on $pi_(2 i - 1)$. Its fundamental ordinary class is the leading class $alpha_i$. Lemma 57 and naturality of Hurewicz evaluation give
  $ chevron.l alpha_i^delta \, "hur" \( x \) chevron.r = g_i \( hat(x) \) #h(2em) \( x in K_(2 i - 1) \( bb(Z)_p \) \) \, $
  and the same identity extends $bb(Q)_p$-linearly to $K_(2 i - 1) \( bb(Z)_p \) ⊗_(bb(Z)) bb(Q)_p$. The fundamental class of the Eilenberg–Mac Lane target evaluates as the identity on its homotopy group, so no additional normalization factor occurs. By #cite(label("HuberKings")) Definition 1.2.3 and Theorem 1.3.2 and Lemma 61,
  $ chevron.l b_i^delta \, "hur" \( x \) chevron.r = exp_(upright("BK"))^(- 1) r_p \( x \) = t_i g_i \( hat(x) \) = t_i chevron.l alpha_i^delta \, "hur" \( x \) chevron.r . $
  Choose $x$ as in Lemma 63. By Lemma 59, write the stable continuous primitive as $alpha_i ⊗ bb(Q)_p = lambda_i b_i$. The evaluation identities above are nonzero on $x$ and give $lambda_i = t_i^(- 1) = epsilon_i p^(- i)$ for a unit $epsilon_i in bb(Z)_p^times$. Both $g_i$ and $c_i^(upright(S))$ were fixed independently of matrix rank, so this is the same unit at every rank. This uses one detected discrete evaluation and requires no density assertion about discrete local algebraic $K$-theory.
  Finally, $b_1$ corresponds under the Lazard comparison to the ordinary determinant logarithm. Since $log \( 1 + p \)$ has valuation one, the normalization in Lemma 60 gives $alpha_(a \, 1) = epsilon_1 p^(- 1) b_1$ with $epsilon_1 in bb(Z)_p^times$. ◻
]

=== 10.4 Top volume and the integral product <gen:volume-section>

Let $d = a^2$. Order the $a^2$ matrix entries once and for all, and write

$ omega_a = and.big_(r \, s) \( g^(- 1) d g \)_(r s) = det \( g \)^(- a) and.big_(r \, s) d g_(r s) $

for the corresponding invariant algebraic top differential. Its value at the identity is the raw entry volume on $frak(g l)_a \( bb(Q)_p \)$. The normalization just proved gives the product $alpha_(a \, 1) dots.h.c alpha_(a \, a)$ a factor $p^(- a \( a + 1 \) \/ 2)$ relative to $b_1 dots.h.c b_a$. We now show that this is exactly the integral top-cohomology lattice of $G_a$. This comparison will prove that the selected product generates the integral top cohomology.

#thm([Lemma 10.10.])[
  (The top integral lattice).  #emph[Assume $a lt.eq p - 2$.]
  + #emph[In rational Lie algebra cohomology, 
$ b_1 and dots.h.c and b_a = u_a omega_a \, #h(2em) u_a in bb(Z)_(\( p \))^times . $

]
  + #emph[For all sufficiently large integers $r$, the integral top cohomology lattice of $U_r = 1 + p^r M_a \( bb(Z)_p \)$ corresponds under the rational Lazard comparison to 
$ bb(Z)_p thin p^(- r d) omega_a . $

]
  + #emph[The top integral lattice of $G_a$ corresponds to 
$ bb(Z)_p thin p^(- a \( a + 1 \) \/ 2) omega_a . $

]
] <lem:top-volume>

#proof[
  For the first assertion, we use the Chern-class comparison and volume calculation of Huber–Soergel #cite(label("HuberSoergel")) Propositions 1.3, 3.3, and 4.1. The compatibility with suspension in their Corollary 3.4 identifies precisely the primitives $b_i$ fixed above, rather than arbitrary rational generators. On the compact real form $U \( a \)$ of $"GL"_a \( bb(C) \)$, these transgressed Chern classes, divided by their Tate factors $\( 2 pi sqrt(- 1) \)^i$, are integral odd generators, and their product integrates to $1$ up to orientation. Successive last-column projections $U \( j \) arrow.r S^(2 j - 1)$ compute the entry-volume integral as
  $ integral_(U \( a \)) omega_a = plus.minus frac(\( 2 pi sqrt(- 1) \)^(a \( a + 1 \) \/ 2), product_(j = 1)^a \( j - 1 \) !) . $
  One obtains this formula by using the sphere volume $2 pi^j \/ \( j - 1 \) !$ at the $j$th step; each complex off-diagonal tangent entry contributes its $2 sqrt(- 1)$ factor and the imaginary diagonal entry its $sqrt(- 1)$ factor. Comparing with the product of the transgressions gives exactly $u_a = plus.minus product_(j = 1)^a \( j - 1 \) !$ in the chosen normalization. Since $a lt.eq p - 2$, this coefficient is a $p$-unit. In particular this calculation does not introduce the possibly nonunit factor $\( a^2 \) !$ into the primitive product.
  We give a direct integral verification of the second assertion that also handles that latter factorial. Put $e = v_p \( d ! \)$, and take $r$ sufficiently large; for example $r gt.eq d + 1$ is sufficient for the estimates below. In the affine coordinates $g = 1 + p^r Y$ on $U_r$, the normalized form is
  $ p^(- r d) omega_a = det \( 1 + p^r Y \)^(- a) and.big_(r' \, s') d Y_(r' s') . $
  Integrate this form formally, term by term, over affine straight simplices with vertices in $U_r$. The integral of a monomial of total degree $h$ on a $d$-simplex has denominator dividing $\( h + d \) !$. The expansion
  $ det \( 1 + p^r Y \)^(- a) = 1 + sum_(h gt.eq 1) p^(r h) Q_h \( Y \) $
  has integral homogeneous polynomials $Q_h$. Hence the resulting series of simplex integrals converges $p$-adically. Left multiplication on matrices is affine and preserves $omega_a$. Formal Stokes and the faces of a simplex therefore give a homogeneous group cocycle. In inhomogeneous notation call it $C_r$, evaluated on the vertices
  $ 1 \, med g_1 \, med g_1 g_2 \, med dots.h \, med g_1 dots.h.c g_d . $
  It is a continuous rational analytic cocycle representing the normalized form under differentiation. Its leading term is
  $ frac(1, d !) det \( X_1 \, dots.h \, X_d \) \, #h(2em) X_j = \( g_j - 1 \) \/ p^r . $
  Differentiation alternates in the $d$ variables and cancels precisely this $d !$, so the corresponding Lie cohomology class is $p^(- r d) omega_a$ with the stated normalization. This description of the rational Lazard map agrees with the analytic differentiation comparison in #cite(label("HuberKings")) Section 4; an all-degree integral comparison for uniform groups is also supplied by #cite(label("HuberKingsNaumann")) Theorem 3.3.3, Proposition 4.2.4, and Remark 4.2.5.
  The following reduction proves the integral assertion directly. Multiply $C_r$ by $d !$ and work modulo $p^(e + 1)$. Every term with $h gt.eq 1$ has valuation at least
  $ e + r h - v_p \( \( h + d \) ! \) gt.eq e + 1 $
  for the chosen $r$. For instance $v_p \( \( h + d \) ! \) lt.eq \( h + d \) \/ \( p - 1 \)$ proves this inequality when $r gt.eq d + 1$. Furthermore successive-product vertices differ from their additive partial sums by multiples of $p^r$. Since $r gt.eq e + 1$, these differences do not affect the reduction. Writing $A_e = bb(Z) \/ p^(e + 1)$, the entry functions
  $ chi_j : U_r arrow.r A_e \, #h(2em) chi_j \( g \) = \( \( g - 1 \) \/ p^r \)_j med \( mod med p^(e + 1) \) \, quad 1 lt.eq j lt.eq d \, $
  are genuine group homomorphisms. Indeed the additional product term is divisible by $p^r$. We consequently obtain
  #[#set math.equation(numbering: n => "(10.8)")
   $ \[ d ! C_r \] = d ! \[ chi_1 smile dots.h.c smile chi_d \] quad upright("in ") H_(upright("cts"))^d \( U_r \, A_e \) . $ <gen:factorial-reduction>]
  Here the determinant cocycle is the alternating sum of the ordered cups. Graded commutativity makes each term equal to the ordered cup after its permutation sign is included, giving the factor $d !$.
  The group $U_r$ is uniform, and the reductions of the $chi_j$ are its standard degree-one basis. Their ordered cup is the nonzero top generator in mod-$p$ cohomology. Orientable compact-group duality gives
  $ H_(upright("cts"))^d \( U_r \, bb(Z)_p \) = bb(Z)_p \, #h(2em) H_(upright("cts"))^(d + 1) \( U_r \, bb(Z)_p \) = 0 . $
  Reduction thus identifies $H^d \( U_r \, A_e \)$ with $H^d \( U_r \, bb(Z)_p \) \/ p^(e + 1)$. The ordered cup in (10.8) is a unit in this cyclic module. The integral cocycle $d ! C_r$ therefore represents a class of #emph[exactly] valuation $e$ in $H^d \( U_r \, bb(Z)_p \)$. Dividing its rational class by $d !$ proves that $\[ C_r \]$ is an integral unit generator. This argument does not divide by $d !$ inside $A_e$; the valuation is first determined by reduction and only then divided in rational cohomology. It proves the second assertion even when $p divides d !$.
  For the last assertion, the determinant of the adjoint action of $G_a$ is one, so its orientation is trivial. Top restriction from $G_a$ to $U_r$ multiplies an integral orientation generator by $\[ G_a : U_r \]$, up to a unit; this follows equally by dualizing degree-zero corestriction or by the restriction–corestriction identity and oriented duality. Its index has valuation
  $ v_p \[ G_a : U_r \] & = \( r - 1 \) a^2 + v_p \| "GL"_a \( bb(F)_p \) \|\
 & = \( r - 1 \) a^2 + frac(a \( a - 1 \), 2) = r a^2 - frac(a \( a + 1 \), 2) . $
  The rational Lie algebra is unchanged under restriction. Combining this index with the lattice $p^(- r a^2) omega_a$ gives $p^(- a \( a + 1 \) \/ 2) omega_a$ for the full group. ◻
]

=== 10.5 Products, block restrictions, and transport <gen:products-section>

#proof[
  By Lemmas 64 and 65, the product of the leading integral classes has rational image
  $ alpha_(a \, 1) dots.h.c alpha_(a \, a) = (product_(i = 1)^a epsilon_i) p^(- a \( a + 1 \) \/ 2) thin b_1 dots.h.c b_a $
  and is an integral unit generator in top degree $a^2$. In particular its mod-$p$ reduction is nonzero.
  All the classes have odd degree, and $2$ is invertible in $bb(Z)_p$, so they define a map from the indicated exterior algebra. If the graded kernel of the mod-$p$ map contained a nonzero homogeneous element, the perfect top-degree pairing in the source exterior algebra would multiply it to a nonzero top class in the kernel. The nonvanishing top image therefore makes this map injective. Theorem 51 gives the same graded dimensions on both sides, so it is an isomorphism. Integral torsion-freeness, finite generation in each degree, and reduction modulo $p$ then show that the integral map is also an isomorphism. This proves the generator assertions, with actual leading classes rather than a choice of abstract exterior generators.
  The definitions of $kappa_a$ and $f_i$ make their leading classes compatible with every upper-left block restriction. For $i > b$, the rational primitive restricts to zero at rank $b$. Integral torsion-freeness at that rank makes the integral restriction zero as well. For $i lt.eq b$ it is exactly $alpha_(b \, i)$, since the projection $f_i$ and its free-coordinate normalization were fixed independently of rank. To choose compatible sphere representatives, first use Lemma 60 at rank $N$ and then restrict those chosen representatives to every smaller rank. Their images in $ell_p$ and their leading integral classes are the ones already constructed there. No simultaneous canonical choice of nullhomotopies is needed.
  Finally apply Proposition 55 to these rank-$N$ sphere classes. That proposition transports continuous stable lifts through the common modification stack and preserves their mod-$p$ Hurewicz images. It also identifies their action after choosing the connected quotient frame with the actual upper-left matrix-block restriction. Thus the transported classes $u_i$ have the leading classes $xi_i$ stated in the theorem, and for $i lt.eq m$ their action on the extension space is through $overline(alpha)_(m \, i)$. This proves all the asserted compatibilities. ◻
]

== 11 The specified constant-cochain module <full:module-section>

Fix $1 lt.eq t < n < p - 1$, put

$ m = n - t \, #h(2em) G = "GL"_m \( bb(Z)_p \) \, #h(2em) U_0 = P_t times G \, $

and use the finite field $k$ and algebraic frame rings of Section 3. The coefficient induction is now complete. We determine $H^(*) \( P_n \, B_(upright("conn") \, G) \)$ together with its unit and its action by the specified rank-$n$ constant classes.

Retain the dual complex $cal(D)$ of (8.1), the independent extension locus $Z = \( N_t^m \)_(upright("ind"))$, and the coefficients $R = \( cal(O)_E \/ pi.alt \)^a$ and $cal(A) = \( cal(O)^(flat \, +) \/ pi.alt \)^a$ of Section 5. Proposition 43 identifies $cal(D) ⊗_k R$ with compact supports on $Z$, with the volume line $chevron.l eta chevron.r$ and the shift $m + n^2$. Choose a translation subgroup $T_h = \[ p \]^h T$ acting trivially on $H^(*) \( cal(D) \)$ as in Proposition 46, and put $d = m \( t - 1 \)$. The derived translation action on $cal(D)$ is still retained.

The argument first isolates a single support and translation term by its matrix weights. A natural top-edge map then identifies the full derived calculation with that term. Connected-group duality and the block-restriction comparison of Proposition 55 identify the surviving constant action. Finally, the integral classes of Theorem 56 and the coefficient unit give the specified exterior-algebra basis.

=== 11.1 The parabolic weight calculation <the-parabolic-weight-calculation>

For $t > 1$, let $Lambda_h tilde.eq k \[ \[ D_1 \, dots.h \, D_d \] \]$ be the distribution algebra of $T_h$, with augmentation ideal $frak(m)_(Lambda_h)$, and put

$ E_h^b = and.big^b \( frak(m)_(Lambda_h) \/ frak(m)_(Lambda_h)^2 \)^(*) \, #h(2em) 0 lt.eq b lt.eq d . $

For $t = 1$ this means $E_h^0 = k$ and there are no other terms. Let $epsilon.alt_i$ denote the character of the $i$th diagonal Teichmüller entry of $G$. The $t - 1$ translation Ext generators in row $i$ each have character $epsilon.alt_i$. This follows from the contragredient change of translation parameters; any Frobenius twists of these characters agree on $bb(F)_p^times$. Thus a weight of $E_h^b$ has the form

#[#set math.equation(numbering: n => "(11.1)")
 $ sum_(i = 1)^m e_i epsilon.alt_i \, #h(2em) 0 lt.eq e_i lt.eq t - 1 \, #h(2em) sum_i e_i = b . $ <full:exterior-weights>]

In particular, $E_h^d$ has character $\( det \)^(t - 1)$.

There are two other characters in the support comparison. For a smallest plane of dimension $r$, its compact support orientation has weight $- t$ in each of its $r$ rows and zero in the remaining rows, by Lemma 23. The single volume line $chevron.l eta chevron.r$ has weight $+ 1$ in every row, by (3.13). Consequently the coefficient weights in a flag term are

#[#set math.equation(numbering: n => "(11.2)")
 $ lambda_i = cases(delim: "{", 1 - t + e_i \, & 1 lt.eq i lt.eq r \,, 1 + e_i \, & r < i lt.eq m .) $ <full:flag-weights>]

The affine Tate twist has no $G$-character. The signs in (11.2) account separately for inverse substitution on the compact support orientation and for duality on translation Ext; the volume has been included exactly once.

#thm([Lemma 11.1.])[
  (Weight vanishing).  #emph[For every $a \, q \, b$ one has 
#[#set math.equation(numbering: n => "(11.3)")
 $ H^a #scale(x: 120%, y: 120%)[\(] G \, H_c^q \( Z \; cal(A) \) ⊗ chevron.l eta chevron.r ⊗ E_h^b #scale(x: 120%, y: 120%)[\)] = 0 $ <full:weight-vanishing>]

 unless $q = \( t + 2 \) m$ and $b = d$. For $b = d$, extension to the ambient space induces an equivalence 
#[#set math.equation(numbering: n => "(11.4)")
 $ & R Gamma #scale(x: 120%, y: 120%)[\(] G \, R Gamma_c \( Z \; cal(A) \) ⊗ chevron.l eta chevron.r ⊗ E_h^d #scale(x: 120%, y: 120%)[\)]\
 & #h(2em) arrow.r^(med tilde.op med) R Gamma #scale(x: 120%, y: 120%)[\(] G \, R Gamma_c \( N_t^m \; cal(A) \) ⊗ chevron.l eta chevron.r ⊗ E_h^d #scale(x: 120%, y: 120%)[\)] . $ <full:ambient-edge>]

 The remaining ambient coefficient is a line with trivial $G$-action. All assertions preserve the commuting connected-frame action.]
] <lem:weight-vanishing>

#proof[
  We give the group-cohomological weight bound used in the argument. Let $P subset G$ be the compact stabilizer of a rational flag, written with its successive subspaces first. Its matrix entries below the corresponding block diagonal are zero. Let $P^(+)$ consist of its matrices whose reduction is upper unitriangular, and let
  $ Delta = { "diag" \( a_1 \, dots.h \, a_m \) : a_i in mu_(p - 1) } . $
  The subgroup $P^(+) times.r Delta$ has index prime to $p$ in $P$. Indeed its index is the product of the complete flag counts in the diagonal Levi blocks, each congruent to one modulo $p$. Restriction to this subgroup is therefore injective on $k$-cohomology, by restriction followed by transfer.
  The pro-$p$ group $P^(+)$ has an ordered valued basis consisting of elementary upper entries, principal diagonal entries, and the allowed principal lower entries. Give these entries the values
  #[#set math.equation(numbering: n => "(11.5)")
   $ upright("entry") & upright("value")\
E_(i j) med \( i < j \) & \( j - i \) \/ m\
p E_(i j) med \( i > j \) upright(" in one flag block") & 1 + \( j - i \) \/ m\
p E_(i i) & 1 . $ <full:iwahori-valuation>]
  Successive $p$-powers increase the value by one. When $m = 1$ only the diagonal entry occurs. For $m > 1$ the smallest value is $1 \/ m > 1 \/ \( p - 1 \)$. Matrix multiplication respects the resulting filtration: the row-index terms add along a product $E_(i j) E_(j k)$, and the $p$-adic valuations add. The block zero conditions are closed under these products. Logarithm and exponential converge in this filtration because a term of degree $s$ has valuation at least $s \/ m - v_p \( s ! \)$, tending to infinity; the same estimates identify the required $p$-roots when their valuation exceeds the saturation threshold. Thus (11.5) is a saturated $p$-valuation with values in $1 / m bb(Z)$.
  Apply the valued-group cohomology spectral sequence of #cite(label("Sorensen")) Theorem 1.1. In its trivial-coefficient specialization, the $E_1$-page is the cohomology of the finite-dimensional graded Lie algebra obtained from the ordered basis by setting the power-shift parameter to zero. The group-ring construction is functorial for automorphisms preserving the valuation. It is therefore $Delta$-equivariant; this equivariant use is also the construction in #cite(label("DLH")) §3 and equation (4.2). The Chevalley cochain complex gives the following sufficient bound: every weight in $H^(*) \( P^(+) \, k \)$ is a sum of distinct allowed cochain-root weights
  #[#set math.equation(numbering: n => "(11.6)")
   $ epsilon.alt_j - epsilon.alt_i quad upright("for each allowed tangent entry ") E_(i j) \; $ <full:cochain-roots>]
  diagonal entries contribute zero. This statement only bounds the weights of the abutment; it does not assert degeneration of this spectral sequence. It follows because its Lie cochains are exterior powers of the dual leading-symbol space, and every subsequent page is a subquotient.
  The same bound holds with the finite coefficient representation in (11.2), after adding one of its weights. To see this without assuming a trivial unipotent action, filter that representation by powers of the augmentation ideal of the finite $p$-group through which $P^(+)$ acts. This is a finite, $Delta$-stable filtration. Its quotients have trivial $P^(+)$-action and decompose into $Delta$-characters, since $\| Delta \|$ is invertible in $k$. Their character weights occur among the original coefficient weights. Apply the preceding calculation to each quotient and use the coefficient spectral sequence. Tensoring with $R$ preserves both this filtration and its weight vanishing.
  Consider a flag with smallest plane of dimension $r < m$. Use its finite flag resolution from Proposition 25. At each term, Shapiro reduces to a group $P$ as above whose first block has size $r$. For a weight in (11.2), the sum of the exponents on the last $m - r$ coordinates is strictly positive. A root internal to either of the two large blocks contributes zero to that sum. The allowed crossing roots are precisely the cochain roots from an upper entry with $i lt.eq r < j$; by (11.6) each contributes $+ 1$ to the last-block sum. There are no crossing roots with the opposite sign, since the lower crossing entries are absent from $P$. The resulting full weight therefore cannot be zero as an integral weight.
  This integral test also tests the actual finite torus. Each coordinate of a sum of distinct allowed roots lies between $- \( m - 1 \)$ and $m - 1$. Equation (11.2) gives
  $ \| upright("each resulting exponent") \| lt.eq t + m - 1 = n - 1 < p - 1 . $
  The only multiple of $p - 1$ in this range is zero. Hence a trivial $Delta$-character would require every integral exponent to be zero, contrary to the last-block sum. Exactness of $Delta$-invariants and injectivity of restriction prove vanishing for each of these parabolic terms. Their finite flag resolution proves it for each proper-plane support cohomology group.
  For the ambient term put $r = m$. Its coefficient exponents are $1 - t + e_i lt.eq 0$, with total
  $ sum_i \( 1 - t + e_i \) = b - m \( t - 1 \) = b - d . $
  Every root has total zero. If $b < d$, the same finite-torus bound therefore excludes a trivial weight. If $b = d$, then every $e_i = t - 1$, and the coefficient is a line with character
  $ \( det \)^(- t) thin \( det \) thin \( det \)^(t - 1) = 1 . $
  This cancellation is an equality of $G$-characters, since the three determinant characters are defined on $G$, not only on $Delta$.
  These calculations prove (11.3). The map to ambient support is an isomorphism on the top geometric cohomology group by Proposition 25; its other cohomology groups are the proper-plane groups just killed. The bounded hypercohomology spectral sequence of its cone therefore proves (11.4). The flag maps, weight filtrations, and torus projections commute with the connected-frame action, which is consequently retained throughout. ◻
]

=== 11.2 The canonical top edge <the-canonical-top-edge>

The translation action on $H^(*) \( cal(D) \)$ is trivial after replacing $T$ by $T_h$. We continue to retain its action on the complex $cal(D)$. Triviality on cohomology alone does not identify that derived action with a trivial one.

#thm([Lemma 11.2.])[
  (Equivariant top-edge insertion).  #emph[There is a natural $U_0$-equivariant map 
#[#set math.equation(numbering: n => "(11.7)")
 $ cal(D) ⊗_k E_h^d \[ - d \] arrow.r R Gamma \( T_h \, cal(D) \) . $ <full:top-edge-map>]

 On a trivially acted-on cohomology row, it is insertion into translation degree $d$. The map is linear for constant stabilizer cochains. After applying $R Gamma \( G \, - \)$ it is an equivalence, as a complex with the remaining smooth $P_t$-action.]
] <full:top-edge>

#proof[
  Suppose $t > 1$ and write $Lambda = Lambda_h$. The residue field $k$ is a perfect $Lambda$-module, of projective dimension $d$. Finite Koszul duality gives the natural tensor-Hom identification
  $ "RHom"_Lambda \( k \, cal(D) \) tilde.eq "RHom"_Lambda \( k \, Lambda \) ⊗_Lambda^(bb(L)) cal(D) . $
  The first factor on the right has one cohomology group:
  $ "Ext"_Lambda^i \( k \, Lambda \) = 0 quad \( i eq.not d \) \, #h(2em) "Ext"_Lambda^d \( k \, Lambda \) = det \( frak(m)_Lambda \/ frak(m)_Lambda^2 \)^(*) = E_h^d . $
  Truncation therefore gives a canonical identification $"RHom"_Lambda \( k \, Lambda \) tilde.eq E_h^d \[ - d \]$, where $Lambda$ acts on the line through its residue field. Consequently
  #[#set math.equation(numbering: n => "(11.8)")
   $ "RHom"_Lambda \( k \, cal(D) \) tilde.eq \( k ⊗_Lambda^(bb(L)) cal(D) \) ⊗_k E_h^d \[ - d \] . $ <full:local-duality>]
  The map $Lambda arrow.r k$ gives the natural map $cal(D) arrow.r k ⊗_Lambda^(bb(L)) cal(D)$. Tensor it with $E_h^d \[ - d \]$ and use (11.8). This is (11.7), since rational translation cohomology is the displayed derived Hom.
  These constructions are natural for every augmented automorphism of $Lambda$. In particular, the orientation identification is the canonical top Ext identification, so it is equivariant even when a frame change acts nonlinearly on chosen parameters. One may use coordinates to check the row map: for a module $M$ annihilated by $frak(m)_Lambda$, the Koszul differential is zero, and the map sends $M ⊗ E_h^d \[ - d \]$ to the top Ext summand of $"RHom"_Lambda \( k \, M \)$. This coordinate check defines no choices in the map itself. Tensor-Hom duality and the augmentation are natural for all commuting coefficient maps, including the constant-cochain action.
  Filter $cal(D)$ by its bounded cohomology filtration. On a row $H^q \( cal(D) \)$, the target has translation cohomology $H^q \( cal(D) \) ⊗ E_h^b$ in degrees $0 lt.eq b lt.eq d$. The row map is the just-described insertion at $b = d$. After tensoring with $R$, Proposition 43 and Lemma 66 kill all the other columns on applying $R Gamma \( G \, - \)$. The same lemma identifies the top column on source and target. The spectral sequences are bounded, since $cal(D)$ is bounded, $k$ has $Lambda$-projective dimension $d$, and $G$ has $p$-cohomological dimension $m^2$. The comparison is therefore an equivalence after almost scalar extension, hence before it by faithful flatness. All its maps commute with $P_t$.
  For $t = 1$, rational representations of $T_h$ decompose into characters, and the natural projection onto the trivial character is exact. It defines (11.7) with $d = 0$. All cohomology rows are already in the trivial character, so the projection is a quasi-isomorphism; the same argument with $G$ and the support calculation applies. ◻
]

We now combine the comparisons, keeping track of their actions and of the connected-frame limit. Write

$ A_G = H_(upright("cts"))^(*) \( G \, k \) \, #h(2em) M_t^(*) = H^(*) \( P_n \, B_(upright("conn") \, G) \) . $

The star in $M_t^(*)$ denotes its cohomological grading. When taking its algebraic dual below, we write $"Hom"_k \( - \, k \)$ to avoid confusing these two uses.

#thm([Proposition 11.3.])[
  (The surviving constant action).  #emph[After tensoring with $R$ and choosing the one-dimensional orientation factors, there are graded identifications 
#[#set math.equation(numbering: n => "(11.9)")
 $ "Hom"_k \( M_t^i \, k \) ⊗_k R tilde.eq A_G^(m^2 - i) ⊗_k R . $ <full:dual-poincare-module>]

 If a constant class on $P_n$ corresponds to a class on $"GL"_n \( bb(Z)_p \)$ under Proposition 55, its transpose action on the right of (11.9) is ordinary cup product by the upper-left block restriction of that class to $G$.]
] <full:surviving-module>

#proof[
  Put
  $ C_G = R Gamma #scale(x: 120%, y: 120%)[\(] G \, R Gamma \( T_h \, cal(D) \) #scale(x: 120%, y: 120%)[\)] . $
  Lemma 42 identifies $R Gamma \( K \, C_G \)$ with the dual of the coefficient complex at level $\( K \, G \, h \)$. The proof of Proposition 46 gives finite cohomology for $C_G$ before almost scalar extension, with its smooth $P_t$-action. Applying (8.4) therefore gives
  #[#set math.equation(numbering: n => "(11.10)")
   $ "Hom"_k #h(-0.16667em) (H^i \( P_n \, B_(upright("conn") \, G)^(\( h \)) \) \, k) tilde.eq H^(- i - t^2) \( C_G \) . $ <full:constant-connected-limit>]
  Here corestriction is the transpose of coefficient pullback, so its inverse limit is exactly the dual of the connected-frame union. The finite Mittag–Leffler calculation takes place before tensoring with $R$. Power transport removes the root stage while preserving ordinary $bb(F)_p$-cochains.
  To compute $C_G$, apply Lemma 67 and then Proposition 43 after the faithful almost extension. The ambient map (11.4) and Lemma 23 leave the ambient line in geometric degree $\( t + 2 \) m$. The three $G$-characters cancel as in Lemma 66.
  If $a$ is the $G$-cohomological degree, the dual cochain lies in degree $a + \( t + 2 \) m + d + t^2 - \( m + n^2 \)$. It is consequently dual to primal degree
  #[#set math.equation(numbering: n => "(11.11)")
   $ i = n^2 + m - \( t + 2 \) m - d - t^2 - a = m^2 - a . $ <full:degree-cancellation>]
  Here $n = m + t$ and $d = m \( t - 1 \)$, including $d = 0$ when $t = 1$. The remaining Tate and connected orientation factors are one-dimensional. A choice of their bases over the fixed geometric coefficient field gives (11.9); changing those bases changes the comparison by a nonzero scalar and does not change its module assertion.
  To identify the action, return to the support calculation on $Z$ before the ambient map. Both the support comparison and the top translation insertion preserve the actual pullback of constant $P_n$-cochains along the middle-bundle map. A constant class of degree $r$ thus acts by a $P_t$-equivariant map $C_G arrow.r C_G \[ r \]$ in the derived category. The naturality for degree-shifted coefficient maps in (8.4) shows that its action in (11.10) is the underlying map on $H^(*) \( C_G \)$ after forgetting $P_t$. Equivalently, the connected-group spectral sequence retains only degree $t^2$; a positive connected-filtration component would raise that degree beyond the cohomological dimension and vanishes. This uses no equivariant splitting of $C_G$. Compact duality retains the dual cup signs throughout.
  After fixing the connected quotient frame, Proposition 55, specifically (9.8), identifies this ordinary action on $\[ Z \/ G \]$ with pullback from $B G$ of the actual restriction along $g mapsto "diag" \( g \, 1_t \)$. That equality comes from the slope-zero extension with its fixed quotient and the vanishing of positive finite-coefficient cohomology of the additive rational upper block; it is an equality of pullback classes, so applies to their cup action on compact supports. The map from $Z$ to ambient support is $G$-equivariant and hence linear for these $B G$-classes. Thus it preserves the now-identified action. The middle positive bundle need only be of standard type on $Z$; no extension of its $B P_n$-map to dependent tuples is used. The ambient line is $G$-trivial, so the remaining action is ordinary cup product on $A_G$. This proves the assertion. ◻
]

=== 11.3 The constant basis on the primal side <the-constant-basis-on-the-primal-side>

Fix the classes of Theorem 56 at rank $n$. Write

$ xi_i in H^(2 i - 1) \( P_n \, k \) \, #h(2em) 1 lt.eq i lt.eq n \, $

for the transported reductions of its integral matrix classes $alpha_(n \, i)$. They are also the leading ordinary classes of the same continuous sphere-cochain representatives $u_i$ that will be used in the height tests.

#thm([Proposition 11.4.])[
  (The actual constant-cochain module).  #emph[For $1 lt.eq t < n < p - 1$, put $m = n - t$. The cup map 
#[#set math.equation(numbering: n => "(11.12)")
 $ and.big_k \( e_1 \, dots.h \, e_m \) arrow.r H^(*) \( P_n \, B_(upright("conn") \, G) \) \, #h(2em) e_i mapsto xi_i dot.op 1 \, #h(2em) \| e_i \| = 2 i - 1 \, $ <full:constant-basis>]

 is an isomorphism of graded $k$-algebras. In particular, for $I subset { 1 \, dots.h \, m }$ the products 
$ xi_I dot.op 1 = (product_(i in I) xi_i) dot.op 1 $

 form a basis in cohomological degrees $sum_(i in I) \( 2 i - 1 \)$ and internal degree zero. The classes $xi_i$ for $i > m$ act as zero. The assertion uses the fixed rank-$n$ classes simultaneously for every $t$.]
] <prop:constant-module>

#proof[
  By Theorems 51 and 56,
  $ A_G = and.big_k \( overline(alpha)_(m \, 1) \, dots.h \, overline(alpha)_(m \, m) \) \, #h(2em) sum_(i = 1)^m \( 2 i - 1 \) = m^2 . $
  The stable-generator theorem identifies the block restriction of $overline(alpha)_(n \, i)$ with $overline(alpha)_(m \, i)$ for $i lt.eq m$, and with zero for $i > m$. Proposition 68 consequently identifies the dual of the desired module, after tensoring with $R$, with the reindexed regular module of this specified exterior algebra.
  An exterior algebra has its perfect top-degree pairing
  $ A_G^j ⊗_k A_G^(m^2 - j) arrow.r A_G^(m^2) tilde.eq k . $
  Indeed the ordered monomial for a subset pairs, up to its exterior sign, with the monomial for its complement; all other pairings in complementary degree are zero. Thus the reindexed dual of the regular $A_G$-module is again its regular module, with a generator in degree zero. This proves that the target of (11.12), after tensoring with $R$, is free of rank one under the displayed exterior action.
  We identify its generator. The preceding comparison shows that $H^0 \( P_n \, B_(upright("conn") \, G) \)$ is one-dimensional over $k$: it is finite by Proposition 46, and its almost scalar extension has the length of one copy of $R$. The unit $1$ is nonzero in it. More explicitly, the algebraic coefficient rings and their frame pullbacks are unital, so $k dot.op 1$ injects into their union; this line is $P_n$-invariant, and no negative-degree cochains can give a boundary in degree zero. Hence $1$ spans that one-dimensional $k$-space. After tensoring with $R$ it is a basis of the degree-zero line, and therefore generates the entire regular module.
  The cup map in (11.12) is consequently an isomorphism after the faithful almost extension. Its kernel and cokernel are $k$-vector spaces, and exactness and faithfulness of that extension make both zero. The map is a map of algebras: group cohomology with commutative coefficients has graded-commutative cup product, and each $xi_i$ has odd degree, so its square vanishes because $p$ is odd. This proves the algebra presentation and the asserted product basis. The zero restrictions for $i > m$ give zero actions after extension by Proposition 68, hence before extension by the same faithfulness. All comparisons preserve the actual classes and powering maps, so the proof applies to the one fixed family at rank $n$, rather than choosing new generators at each height. ◻
]

== 12 Simultaneous chromatic bases and the filtration <sec:spectral>

The coefficient theorem computes an algebraic continuous-cochain complex, whereas the desired conclusion concerns specified maps of spectra. We compare that complex with the ordinary height-$t$ residue of the completed Morava descent resolution. The same sphere-cochain representatives then lift every coefficient basis vector through the resulting totalization tower, forcing the actual product maps to be $K \( t \)$-equivalences. The three steps below construct the common maps, identify their residue coefficients and constant action, and prove that their images form a basis. Fix $p > n + 1$, put $S = S_p^and$, and write

$ D = L_(K \( n \)) S . $

Choose a finite field $k$ containing $bb(F)_(p^a)$ for $1 lt.eq a lt.eq n$, with $f = \[ k : bb(F)_p \]$ prime to $p$. For example, $f = "lcm" \( 1 \, dots.h \, n \)$ has these properties. Write

$ Gamma = "Gal" \( k \/ bb(F)_p \) \, #h(2em) G_n = P_n times.r Gamma \, $

where the action on the ordinary height-$n$ stabilizer factors through $"Gal" \( bb(F)_(p^n) \/ bb(F)_p \)$. Let $E_n = E_n \( k \)$ be Morava $E$-theory with this field of constants. Its coefficient ring is

$ pi_0 E_n = W \( k \) \[ \[ x_1 \, dots.h \, x_(n - 1) \] \] \, $

with its maximal-ideal topology. The extension of constants allows the same source resolution to be used for every height test below.

=== 12.1 Completed descent and exact functors <completed-descent-and-exact-functors>

All the tensor products in the following Amitsur resolution are initially taken in the $K \( n \)$-local category. Set

#[#set math.equation(numbering: n => "(12.1)")
 $ cal(A)^q = L_(K \( n \)) #scale(x: 120%, y: 120%)[\(] E_n^(and \( q + 1 \)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) q gt.eq 0 . $ <spec:amitsur>]

The ordinary smash product inside the parentheses is followed by the indicated localization. Completed Morava cooperations identify this cosimplicial spectrum with

$ cal(A)^q tilde.eq "Map"^c \( G_n^q \, E_n \) \, $

where the right side uses maximal-ideal-completed functions. We use standard inhomogeneous coordinates: the first coface is the semilinear stabilizer action, and the remaining cofaces are the group-nerve maps. The augmentation is the unit of $D$. For the standard constant field $k_0 = bb(F)_(p^n)$, these completed cooperations have the structured realization of Devinatz–Hopkins. Their evaluation composites (2.3), (2.5), and (2.7), formed from the action and multiplication, define the natural cohomology isomorphism (2.6), with the completed coefficient Hopf algebroid described by Proposition 2.2 #cite(label("DevinatzHopkins")) Proposition 2.2 and (2.3), (2.5)–(2.7). The weakly contractible mapping components and rectification in their Theorems 4.1 and 3.2 and Proposition 4.6 make these maps coherent. Their Proposition 4.10 and Construction 4.11 construct diagrams over finite continuous $G_n$-sets, with the full simplex category, all cofaces, and all codegeneracies #cite(label("DevinatzHopkins")) Theorems 3.2 and 4.1, Propositions 4.6 and 4.10, and Construction 4.11. Their Theorem 1(iii) identifies the augmented object with $D$.

Here $"Map"^c$ denotes our chosen completed function-spectrum model for this rectified diagram, functorial for continuous pullback in its profinite parameters. In the printed coordinates of Devinatz–Hopkins, the inverse action occurs in the last coface #cite(label("DevinatzHopkins")) Definition 4.18 and Lemma 4.22. On the structured model, parameter pullback and the rectified action map realize the following change from a standard inhomogeneous $q$-cochain $c$ to their coordinates:

$ \( T_q c \) \( g_1 \, dots.h \, g_q \) = g_1^(- 1) c \( g_1 g_2^(- 1) \, dots.h \, g_(q - 1) g_q^(- 1) \, g_q \) \, #h(2em) T_0 = upright("id") . $

The inverse at $\( a_1 \, dots.h \, a_q \)$ evaluates at $\( a_1 dots.h.c a_q \, a_2 dots.h.c a_q \, dots.h \, a_q \)$ and acts on the value by $a_1 dots.h.c a_q$. These are inverse maps of the completed function spectra by the structured action law. Applying the same substitutions to the rectified structure maps intertwines all cofaces and codegeneracies; the unital multiplicative action preserves the unit and multiplication. Thus this transport supplies the stated inhomogeneous convention at the spectrum level. We explain the extension to the chosen $k$. Put $Q = "Gal" \( k \/ k_0 \)$. The unramified coefficient extension $E_n \( k_0 \) arrow.r E_n \( k \)$ is finite free, and its Galois comparison

$ E_n \( k \) ⊗_(E_n \( k_0 \)) E_n \( k \) arrow.r^(#h(0.27778em) tilde.op #h(0.27778em)) product_(sigma in Q) E_n \( k \) $

is an equivalence in the $K \( n \)$-local module category: on coefficients it is the finite unramified identity $W \( k \) ⊗_(W \( k_0 \)) W \( k \) tilde.equiv product_Q W \( k \)$, and finite freeness removes higher Tor. Base-changing the standard cooperation formula on both ends and using this identity indexes its factors by the lifts in

$ P_n times.r "Gal" \( k \/ bb(F)_p \) arrow.r P_n times.r "Gal" \( k_0 \/ bb(F)_p \) . $

This gives the displayed formula for $G_n$; iteration gives all higher terms. Naturality for the unit, multiplication, and rectified action transports $T_bullet$ to these factors. In our inhomogeneous coordinates the first coface therefore remains the semilinear action, with the remaining nerve maps unchanged. The same finite Galois comparison identifies descent through $Q$ with the standard constant-field theory, so the augmentation still has source $D$.

#thm([Proposition 12.1.])[
  (Exact tests of completed descent).  #emph[The augmentation $D arrow.r "Tot" cal(A)^bullet$ is an equivalence. Moreover, if $F$ is an exact functor from spectra to a stable $oo$-category admitting countable limits, then 
#[#set math.equation(numbering: n => "(12.2)")
 $ F \( D \) arrow.r^(#h(0.27778em) tilde.eq #h(0.27778em)) "Tot" #scale(x: 120%, y: 120%)[\(] F \( cal(A)^bullet \) #scale(x: 120%, y: 120%)[\)] . $ <spec:exact-totalization>]

 The transformed partial-totalization tower is quickly convergent. For spectrum-valued $F$, its totalization spectral sequence has this convergence control. In particular, if its $E_2$-page lies in a bounded range of cohomological degrees, it converges strongly with a finite filtration in each total degree.]
] <spec:exact-descent>

#proof[
  Morava $E$-theory attached to the chosen perfect field $k$ is descendable in the $K \( n \)$-local category #cite(label("Mathew")) Proposition 10.10. Descendability says that the augmented partial-totalization tower has nilpotent error; equivalently, it belongs to the thick class generated by constant and nilpotent towers #cite(label("Mathew")) Propositions 3.10, 3.20 and 3.27. Here a nilpotent tower is one for which a fixed finite number of consecutive transition maps has null composite. Such a tower has zero inverse limit. This is the quickly convergent form of descent, whose universal totalization property is explained in #cite(label("MathewNilpotence")) Definition 2.19 and Propositions 2.20, 2.21 and 2.26.
  The inclusion of $K \( n \)$-local spectra into spectra is exact. We verify that each full partial totalization here is a finite limit. For $s gt.eq 0$, send a nonempty subset of ${ 0 \, dots.h \, s }$ to its ordered set in $Delta_(lt.eq s)$. This functor is homotopy initial. Indeed, its comma category at $\[ q \]$, $q lt.eq s$, is the nonempty face poset of the complex with simplices
  $ \( i_0 \, j_0 \) \, dots.h \, \( i_b \, j_b \) \, #h(2em) 0 lt.eq i_0 < dots.h.c < i_b lt.eq s \, quad 0 lt.eq j_0 lt.eq dots.h.c lt.eq j_b lt.eq q . $
  Call this complex $P \( s \, q \)$. It is contractible for $s gt.eq q$. Start with the cone with vertex $\( s \, q \)$ on $P \( s - 1 \, q \)$, and attach in descending order the cones with vertices $\( s \, j \)$, $j < q$. The attaching subcomplex is $P \( s - 1 \, j \)$, which is contractible by induction since $j lt.eq s - 1$. The first cone is contractible even when $q = s$; the induction begins with $P \( 0 \, 0 \)$, a point. This proves the claim.
  Consequently the full partial totalization is the limit of the punctured $\( s + 1 \)$-cube with vertex $L_(K \( n \)) \( E_n^(and \| T \|) \)$ at nonempty $T subset.eq { 0 \, dots.h \, s }$ and unit-insertion maps. This is the finite cubical comparison in standard descent machinery; compare #cite(label("MNNDescent")) Proposition 2.14. It applies to the full Amitsur totalization, including its codegeneracies. Thus the inclusion and then $F$ preserve these finite limits, the augmentation, and the stated nilpotence of the error tower. The inverse limit of the transformed error tower is therefore zero. This proves (12.2) and carries along the convergence control. Bounded cohomological support then gives the stated finite, complete filtration on the abutment. ◻
]

Thus an ordinary residue smash can be applied after (12.1). The terms to which it is applied remain the completed terms of that resolution.

=== 12.2 Common spherical classes <common-spherical-classes>

For a profinite group $G$, use the continuous sphere-cochain spectrum $C_(upright("cts"))^(*) \( G \; S \)$ of Proposition 55. One may construct its cosimplicial terms by locally constant approximation with finite $p$-power coefficients and finite Postnikov truncations, followed by the separated Postnikov and $p$-complete limits. The unit $S arrow.r E_n$ gives a natural map of cosimplicial spectra

#[#set math.equation(numbering: n => "(12.3)")
 $ C_(upright("cts"))^bullet \( G_n \; S \) arrow.r "Map"^c \( G_n^bullet \, E_n \) . $ <spec:constant-map>]

Indeed, it gives the map on locally constant functions at every finite coefficient stage. Completeness of the target extends it to the indicated limits. At finite Postnikov range this is exactly the continuous cochain construction used to obtain the spherical classes in Theorem 56; passing to the Postnikov limit preserves this identification. The parameter pullbacks defining $T_bullet$ commute with these constant-section maps, and its value action commutes with the unit because every action map is unital. Thus (12.3) uses the same transported structured cosimplicial model, preserving all cofaces and codegeneracies, the unit, and multiplication through the indicated limits.

Write $alpha_(n \, i)^P in H^(2 i - 1) \( P_n \, bb(Z)_p \)$ for the transport of the matrix class $alpha_(n \, i)$ under Proposition 55, and write $alpha_(n \, I)^P = product_(i in I) alpha_(n \, i)^P$. Its reduction modulo $p$, extended to $k$, is the class $xi_I$ used in Proposition 69.

#thm([Proposition 12.2.])[
  (Simultaneous representatives).  #emph[There are classes 
$ y_i in pi_(1 - 2 i) D \, #h(2em) 1 lt.eq i lt.eq n \, $

 represented by constant sphere-cochain classes whose integral Hurewicz images on $P_n$ are $alpha_(n \, i)^P$. For $I = { i_1 < dots.h.c < i_r }$, put 
$ y_I = y_(i_1) dots.h.c y_(i_r) \, #h(2em) y_diameter = 1 . $

 These are represented by actual sphere-cochain classes with Hurewicz image $alpha_(n \, i_1)^P dots.h.c alpha_(n \, i_r)^P$. The class $y_diameter$ is the unit $S arrow.r D$.]
] <spec:global-classes>

#proof[
  Theorem 56 and Proposition 55 give classes
  $ u_i in pi_(1 - 2 i) C_(upright("cts"))^(*) \( P_n \; S \) $
  with these integral Hurewicz images. The range applies because $n lt.eq p - 2$.
  By Remark 52, the action of $Gamma$ on $H_(upright("cts"))^(*) \( P_n \; bb(Z)_p \)$ is trivial.
  As $f$ is a unit in $bb(Z)_p$, restriction from $G_n$ identifies continuous sphere cochains with the $Gamma$-homotopy fixed points of the $P_n$-cochains, and the averaging idempotent realizes invariants on homotopy groups. In concrete terms, normalized transfer lifts
  $ overline(u)_i = 1 / f sum_(gamma in Gamma) gamma u_i $
  to a class on $G_n$. Its Hurewicz image on $P_n$ remains $alpha_(n \, i)^P$. This also follows from the finite-group homotopy-fixed-point spectral sequence: all its positive $Gamma$-cohomology vanishes, since multiplication by $f$ is invertible on its coefficient groups.
  Map these classes through the totalization of (12.3) and use Proposition 70 to obtain the $y_i$. Multiplication supplies the stated representatives of all the $y_I$. The empty product maps to the augmentation unit itself. ◻
]

=== 12.3 Ordinary residue coefficients <ordinary-residue-coefficients>

Fix $1 lt.eq t < n$, and put $m = n - t$. Let $E_t = E_t \( k \)$ be height-$t$ Morava $E$-theory and let $kappa_t$ be its iterated residue module, obtained by taking cofibers of the regular sequence

$ p \, u_1 \, dots.h \, u_(t - 1) . $

Put $I_t = \( p \, u_1 \, dots.h \, u_(t - 1) \) subset.eq pi_0 E_t$. Regularity identifies its homotopy groups, as graded $pi_(*) E_t$-modules, with the quotient scalar field

$ pi_(*) kappa_t tilde.equiv kappa_(t \, *) := pi_(*) E_t \/ I_t = k \[ v^(plus.minus 1) \] \, #h(2em) \| v \| = 2 . $

This residue has the Bousfield class of $K \( t \)$; consequently its ordinary smash detects $K \( t \)$-equivalences. The periodicity here belongs to the test theory.

The scalar action on the residue tower comes from $E_t$. For each displayed generator $x$ of $I_t$, let $E_t \/ x$ be its cofiber as an $E_t$-module. Evenness and the fact that $x$ is a nonzerodivisor on $pi_(*) E_t$ give $pi_1 \( E_t \/ x \) = 0$. Applying $\[ - \, E_t \/ x \]_(E_t)$ to the cofiber triangle gives an injection

$ \[ E_t \/ x \, E_t \/ x \]_(E_t) arrow.r.hook \[ E_t \, E_t \/ x \]_(E_t) = pi_0 \( E_t \/ x \) . $

The map $x thin upright("id")_(E_t \/ x)$ restricts to zero in the group on the right, so it is nullhomotopic. The iterated residue is the relative tensor product of these individual cofibers. Tensoring the chosen nullhomotopy on the $x$-factor shows that $x$ acts nullhomotopically on $kappa_t$. Smashing that homotopy with a spectrum is natural in the spectrum, so it also gives a nullhomotopy on the residue cosimplicial diagram and on all its partial totalizations and fibers. Consequently their homotopy groups are modules over the quotient $kappa_(t \, *)$, compatibly with the tower filtration. Each scalar may be represented by a lift in $pi_(*) E_t$; its action is a map of the tower, and different lifts give the same action on homotopy.

Retain the algebraic marking tower of Proposition 7 and the cochain convention of Definition 8: with

$ A = k \[ \[ x_t \, dots.h \, x_(n - 1) \] \] \, #h(2em) B = A \[ 1 \/ x_t \] \, $

write

#[#set math.equation(numbering: n => "(12.4)")
 $ cal(B)_(n \, t) = B_(upright("conn") \, "GL"_m \( bb(Z)_p \)) = "colim"_K B_(K \, "GL"_m \( bb(Z)_p \)) . $ <spec:connected-coefficients>]

Here $K$ runs through open connected-marking levels. The $"GL"_m \( bb(Z)_p \)$ subscript means that the integral étale Tate module is unmarked. In particular, no additional general linear group parameter is part of $cal(B)_(n \, t)$.

We first record the flatness that is needed before taking a residue.

#thm([Lemma 12.3.])[
  (Flat continuous function modules).  #emph[Let $R = W \( k \) \[ \[ x_1 \, dots.h \, x_(n - 1) \] \]$, with maximal ideal $frak(m)$, and let $Q$ be a profinite set. The module $N_Q = C_(upright("cts")) \( Q \, R \)$ is $frak(m)$-adically complete and flat over $R$. Its reductions are 
$ N_Q \/ frak(m)^a N_Q = C_(upright("lc")) \( Q \, R \/ frak(m)^a \) . $

 Quotienting by $p \, x_1 \, dots.h \, x_(t - 1)$ gives $C_(upright("cts")) \( Q \, A \)$.]
] <spec:flat-functions>

#proof[
  A function into the finite ring $R \/ frak(m)^a$ is constant on some finite clopen partition of $Q$; lifting its finitely many values proves surjectivity of reduction. The kernel equality follows by continuous coefficient division among the finitely many monomial generators of $frak(m)^a$. This division is performed in the power-series coordinates, including the $p$-adic coefficient expansion, and is continuous for their adic topologies. The same coordinate argument applies to the displayed height ideal.
  The locally constant function module modulo $frak(m)^a$ is a filtered colimit of finite free $R \/ frak(m)^a$-modules, indexed by finite clopen partitions, and is therefore flat. Furthermore
  $ N_Q = "proj lim"_a C_(upright("lc")) \( Q \, R \/ frak(m)^a \) . $
  The adic flatness criterion over the Noetherian ring $R$ now gives flatness of $N_Q$. Equivalently, lifting a basis of $C_(upright("lc")) \( Q \, k \)$ and successively lifting modulo $frak(m)^a$ identifies $N_Q$ with a completed free $R$-module. This also proves its asserted completeness. ◻
]

#thm([Lemma 12.4.])[
  (Ordinary residue of the completed cobar).  #emph[For the completed terms $cal(A)^bullet$ in (12.1), followed by ordinary smash with $kappa_t$, there is a natural quasi-isomorphism of cochain complexes 
#[#set math.equation(numbering: n => "(12.5)")
 $ N^(*) pi_r \( kappa_t and cal(A)^bullet \) tilde.eq kappa_(t \, r) ⊗_k C_(upright("cts"))^(*) \( P_n \; cal(B)_(n \, t) \) . $ <spec:residue-complex>]

 Here $N^(*)$ denotes normalization of a cosimplicial abelian group. The right side uses one finite algebraic connected-marking stage and one bound on the pole order on each compact cochain domain. It is zero when $r$ is odd. The comparison carries the unit to $1$ and the constant-cochain action to the actual constant cup action of Proposition 69.]
] <lem:ordinary-residue>

#proof[
  #emph[Ordinary cooperations before residue.] For $M = "Map"^c \( Q \, E_n \)$, the ordinary module identity is
  $ E_t and M tilde.eq \( E_t and E_n \) ⊗_(E_n) M . $
  Lemma 72 gives flatness of $pi_(*) M$ over $E_(n \, *)$, so the module Kunneth spectral sequence has no positive $"Tor"$. Its convergence is bounded by the finite graded global dimension of the regular ring $E_(n \, *)$. Thus
  #[#set math.equation(numbering: n => "(12.6)")
   $ pi_(*) \( E_t and M \) = pi_(*) \( E_t and E_n \) ⊗_(E_(n \, *)) C_(upright("cts")) \( Q \, E_(n \, *) \) . $ <spec:ordinary-kunneth>]
  Ordinary Landweber exact base change identifies the first factor with the two-sided base change of the formal-group-isomorphism Hopf algebroid. This is the ordinary cooperation algebra; the Landweber flatness assertions on both sides apply to it #cite(label("HoveyStrickland")) Example 0.1(d), Lemma 2.2 and Corollary 2.3. One may compute using $B P_(*) B P$: isomorphisms between the typical laws are the formal-group sums of their typical curves, and the ratio of the periodic frames supplies the invertible linear coefficient. Thus this computation includes all isomorphisms of the underlying formal groups #cite(label("GoerssFormalGroups")) Definition 2.40, Remark 2.41(3) and Corollary 2.45.
  #emph[The height ideal and the algebraic marking ring.] Flatness and (12.6) keep the test-side sequence $p \, u_1 \, dots.h \, u_(t - 1)$ regular. Indeed, it is regular on the cooperation algebra, and tensoring its successive injections with the flat function module preserves injectivity. Taking its iterated cofibers therefore produces only even homotopy groups. Under the universal formal-group isomorphism the successive height ideals agree on the two sides; their next generators differ by a unit modulo the preceding ideal. Consequently the residue imposes
  $ p = x_1 = dots.h.c = x_(t - 1) = 0 \, $
  and invertibility of the test height-$t$ coefficient inverts $x_t$. Lemma 72 then leaves $C_(upright("cts")) \( Q \, A \) \[ 1 \/ x_t \]$ on the source side.
  We make the remaining cooperation algebra explicit, including the source constants and periodicity. The two constant fields are initially independent, and
  $ k ⊗_(bb(F)_p) k tilde.equiv product_(sigma in Gamma) k \, #h(2em) a ⊗ b mapsto \( a sigma \( b \) \)_sigma \, $
  where the first factor is the test field. Let $cal(B)_(n \, t)^(\[ sigma \])$ be the connected-marking algebra after the source constants are embedded into the test field by $sigma$. Its universal marking is an isomorphism from the Honda height-$t$ group to that source deformation. In particular, $cal(B)_(n \, t)^(\[ 1 \]) = cal(B)_(n \, t)$. With the test period $v$ fixed, the ordinary cooperation calculation gives an isomorphism of graded algebras
  #[#set math.equation(numbering: n => "(12.7)")
   $ frac(pi_(*) \( E_t and E_n \), \( p \, u_1 \, dots.h \, u_(t - 1) \)) med tilde.equiv med product_(sigma in Gamma) #scale(x: 120%, y: 120%)[\(] kappa_(t \, *) ⊗_k cal(B)_(n \, t)^(\[ sigma \]) #scale(x: 120%, y: 120%)[\)] . $ <spec:residue-cooperation-algebra>]
  Here the ideal on the left acts through the test factor.
  To check the map and its inverse, use degree-zero formal-group coordinates and let $alpha$ denote the Honda-to-source isomorphism. If $v_n$ is the source period, its linear coefficient is $c = v_n \/ v$. Comparison of the leading terms in $\[ p \]_(upright("source")) alpha = alpha \[ p \]_(upright("Honda"))$ gives
  $ x_t c^(p^t - 1) = 1 . $
  Thus the cooperation data determine the embedding $sigma$ and the full marking $alpha$, including $c$. Conversely, a marking and the fixed test period determine $v_n = c v$; rescaling the coordinates by these periods makes $alpha$ strict and recovers the corresponding $B P_(*) B P$-isomorphism. These constructions are inverse and commute with composition. In particular, the source period is already recorded by the linear coefficient of the marking; there is no further frame parameter. No étale Tate basis is chosen.
  The full algebraic isomorphism ring is a filtered union of finite étale marking algebras #cite(label("LurieFormalGroups")) Lecture 14, Theorem 1. These stages retain coefficients of full markings together with their extension equations, as in Proposition 7; they are not schemes of arbitrary finite-bud isomorphisms.
  #emph[The topology produced by the tensor product.] For a finite marking algebra $J$ over $B$, choose an idempotent presentation $J = e B^a$. Then
  #[#set math.equation(numbering: n => "(12.8)")
   $ J ⊗_A C_(upright("cts")) \( Q \, A \) = e #scale(x: 120%, y: 120%)[\(] C_(upright("cts")) \( Q \, A \) \[ 1 \/ x_t \] #scale(x: 120%, y: 120%)[\)]^a . $ <spec:bounded-functions>]
  The right side consists exactly of functions admitting a common power of $x_t$ as denominator and continuous coordinates in a finite $A$-lattice. For example, $J ∩ A^a$ is such a lattice: it is finite over the Noetherian ring $A$, it spans $J$ after inverting $x_t$, and it is closed in $A^a$. Multiplying by a common denominator places any element of the right side in continuous functions into this lattice; the converse follows from its inclusion in $A^a$. Passing to the algebraic union of finite $J$’s requires one finite stage for each element of the tensor product. This proves exactly the bounded-pole, common-stage convention on every profinite parameter $Q$. No completion is taken after inverting $x_t$ or forming this algebraic union.
  #emph[Cofaces and constants.] Apply this calculation with $Q = G_n^q$, retaining every source-embedding factor in (12.7). For the first coface, composition with the deformation-change isomorphism transports the tautological marking by the actual stabilizer action. Every finite coefficient of this composite uses only finitely many coefficients of the two isomorphisms. The continuous action preserves the height ideal and takes $x_t$ to a unit times $x_t$ modulo that ideal. Compactness of the stabilizer parameter therefore gives one finite marking stage and one pole bound for the resulting coefficient. The other cofaces and the codegeneracies are pullbacks along the usual profinite group-nerve maps. They preserve the same convention. The unit is the constant function $1$; multiplication is ordinary multiplication of the marking coefficients. This proves compatibility with constant cup products as well as with the differential.
  It remains to take source-field descent. With the test field fixed, $Gamma$ permutes the source-embedding factors simply transitively; the full product of the corresponding $P_n$-cochain coefficients is a coinduced module for $P_n subset G_n$. Group descent, or Shapiro’s lemma, identifies its $G_n$-cochains with the $P_n$-cochains of the identity-embedding factor. This is the step that changes the termwise cooperation calculation into the quasi-isomorphism of $P_n$-cochain complexes in (12.5). Equivalently, exact $Gamma$-descent on the full product followed by evaluation at that factor gives this identification. Taking invariants of an isolated factor would not make sense, since that factor is not $Gamma$-stable. The test periodicity is fixed throughout, so $kappa_(t \, r)$ is an untwisted coefficient line. This gives (12.5), naturally for constants and their products. ◻
]

The use of ordinary smash here also respects the scalar convention of the theorem. The cofiber of $S_(\( p \)) arrow.r S_p^and$ is rational: it is $p$-local and multiplication by $p$ on it is an equivalence, since the map is an equivalence modulo $p$. Its smash with $kappa_t$ is zero. Consequently $kappa_t and S tilde.eq kappa_t$, and for an $S$-module $M$, ordinary residue smash agrees with the corresponding relative $S$-module test. All the maps used below are thus maps of $S$-modules.

=== 12.4 The specified bases survive <the-specified-bases-survive>

#thm([Theorem 12.5.])[
  (Simultaneous height bases).  #emph[The common classes of Proposition 71 satisfy, for every $1 lt.eq t < n$, 
#[#set math.equation(numbering: n => "(12.9)")
 $ L_(K \( t \)) (or.big_(I subset.eq { 1 \, dots.h \, n - t }) Sigma^(- d \( I \)) S arrow.r^(\( y_I \)) D) quad upright("is an equivalence") \, $ <spec:height-basis>]

 where $d \( I \) = sum_(i in I) \( 2 i - 1 \)$, and the empty component is the unit.]
] <thm:height-bases>

#proof[
  Use Proposition 70 with the exact functor $kappa_t and -$. Lemma 73 identifies the totalization spectral sequence as
  #[#set math.equation(numbering: n => "(12.10)")
   $ E_2^(s \, r) = kappa_(t \, r) ⊗_k H_(upright("cts"))^s \( P_n \; cal(B)_(n \, t) \) arrow.r.double pi_(r - s) \( kappa_t and D \) . $ <spec:test-spectral-sequence>]
  By Proposition 69, this page is free over $kappa_(t \, *)$ with basis $xi_I dot.op 1$, for $I subset.eq { 1 \, dots.h \, m }$ and $m = n - t$. These are the images of the reductions of the transported integral classes $alpha_(n \, I)^P$. The basis vector indexed by $I$ lies in bidegree $\( s \, r \) = \( d \( I \) \, 0 \)$. In particular, the page is zero for $s < 0$ or $s > m^2$. This statement uses the constant cup action and the nonzero image of $1$ in that proposition.
  We now identify the actual representative of each basis vector. There are two filtrations to distinguish: the source tower of constant sphere cochains is built from connective spectra, whereas the residue tower computing $kappa_t and D$ is periodic. We first locate a representative in the source filtration and then transport it to the residue filtration.
  The empty subset is represented by the unit itself. For a nonempty subset put $b = d \( I \) > 0$. The sphere-cochain representative of $y_I$ has filtration at least $b$. Indeed, the $\( b - 1 \)$-st partial totalization of the connective sphere-cochain diagram is $\( 1 - b \)$-connective and hence has zero homotopy in degree $- b$. The representative therefore lifts to the fiber of the map to that partial totalization. Its component in filtration $b$, modulo the cochain boundary, is its integral Hurewicz class, whose restriction to $P_n$ is $alpha_(n \, I)^P$. The map (12.3) sends this chosen lift to the completed descent tower. Ordinary residue smash is exact and preserves the partial totalizations and their fibers, so it transports the lift to the residue tower as well. Lemma 73 identifies its leading component in (12.10) with precisely the specified image of $alpha_(n \, I)^P$. Connectivity was needed only in the source tower.
  These representatives come from the source totalization and hence supply compatible lifts through every subsequent partial totalization. Their leading terms cannot support an outgoing differential. Products give the representatives for all subsets. For a coefficient in $kappa_(t \, *)$, choose a lift in $pi_(*) E_t$. Its natural action on the residue tower carries these compatible lifts to representatives of the corresponding multiple of each basis vector. Therefore every element of the $E_2$-page has such a lift, so $d_2 = 0$. Inductively, if the earlier differentials vanish, the same representatives span the next page and force its outgoing differential to vanish. This proves that all differentials vanish; in particular none of the specified vectors can be lost as an incoming boundary.
  Strong convergence and the bound $0 lt.eq s lt.eq m^2$ now give a finite filtration on $pi_(*) \( kappa_t and D \)$. The actual images of the $y_I$ lift its specified associated-graded basis. The coefficient action preserves every filtration step, so this is a filtration by graded $kappa_(t \, *)$-submodules. Finite filtered linear algebra over the graded field $kappa_(t \, *)$ shows that these images themselves form a basis: independence and spanning follow successively from their lowest nonzero filtration components. It follows that the actual map
  $ or.big_(I subset.eq { 1 \, dots.h \, m }) Sigma^(- d \( I \)) kappa_t arrow.r kappa_t and D $
  is an equivalence. Since $kappa_t$ detects $K \( t \)$-equivalences and ordinary residue smash agrees with the relative scalar test, this proves (12.9) with all its stated components. ◻
]

=== 12.5 Rational dimensions and completion of the proof <rational-dimensions-and-completion-of-the-proof>

The last block of the filtration is rational. We use the following independent calculation of the rational local sphere.

#thm([Theorem 12.6.])[
  (Barthel–Schlank–Stapleton–Weinstein).  #emph[For every prime $p$ and height $n gt.eq 1$, the rational homotopy of the $K \( n \)$-local sphere is the exterior $bb(Q)_p$-algebra 
$ pi_(*) L_(K \( n \)) S ⊗_(bb(Z)) bb(Q) tilde.equiv and.big_(bb(Q)_p) \( zeta_1 \, dots.h \, zeta_n \) \, #h(2em) \| zeta_i \| = 1 - 2 i \, $

 with its natural scalar action induced by the unit. In particular, 
#[#set math.equation(numbering: n => "(12.11)")
 $ dim_(bb(Q)_p) pi_(- b) L_0 D = \# { I subset.eq { 1 \, dots.h \, n } : d \( I \) = b } #h(2em) \( b in bb(Z) \) . $ <spec:rational-dimensions>]

]
] <thm:rational-sphere>

#proof[
  This is #cite(label("BSSW")) Theorem A, with the generator degrees displayed in homotopical grading. Replacing the sphere by its $p$-completion does not change its positive-height localization. The dimension formula is the monomial basis of the exterior algebra. Only this additive formula and the natural scalar action are needed below; no identification of the individual $zeta_i$ with the classes $y_i$ is required. ◻
]

#proof[
  Proposition 71 supplies the one family $y_i$, its ordered products, and $y_diameter = 1$. For $n > 1$, take $z_I = y_I$, for $I subset.eq { 1 \, dots.h \, n - 1 }$, and take the specified map $u = y_diameter : S arrow.r D$ to be the unit. Theorem 74 verifies all the simultaneous local basis hypotheses of Proposition 2; Theorem 75 verifies its rational dimension hypothesis. That proposition constructs the successive quotient blocks and pulls them back to a filtration of $L_(n - 1) D$, with the required individual cofibers. Under the first-stage identification $F_1 = L_(n - 1) S$, the composite $F_1 arrow.r L_(n - 1) D = X_(n \, p)$ is the localized unit. All maps and cofibers are $S$-linear, as required.
  When $n = 1$, Proposition 71 still supplies $y_1$; only the positive-height tests are vacuous. The unit calculation in Section 2 and the dimensions of Theorem 75 verify the remaining hypotheses of Proposition 2. Its height-one case gives the two cofibers $H bb(Q)_p$ and $Sigma^(- 1) H bb(Q)_p$, with the composite from the first stage to $X_(1 \, p)$ equal to the canonical localization unit. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
