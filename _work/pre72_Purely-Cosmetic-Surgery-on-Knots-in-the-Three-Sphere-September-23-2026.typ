#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Purely cosmetic surgery on knots in the three-sphere]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $K$ be a smooth knot in the oriented three-sphere, and let $E_K = S^3 \\ "int" \( nu K \)$ be its exterior. The meridian $mu$ and preferred longitude $lambda$ identify the unoriented slopes on $partial E_K$ with $bb(Q) union { oo }$: the primitive class $p mu + q lambda$, considered up to simultaneous sign, represents $p \/ q$. Write $S_(p \/ q)^3 \( K \)$ for the corresponding Dehn filling, with the orientation extending that of $E_K$. Two distinct slopes giving orientation-preservingly homeomorphic fillings are called #emph[purely cosmetic].

#thm([Theorem 1.1.])[
  #emph[Let $K subset S^3$ be a smooth nontrivial knot. For any $r \, s in bb(Q) union { oo }$, an orientation-preserving homeomorphism 
$ S_r^3 \( K \) tilde.equiv S_s^3 \( K \) $

 implies $r = s$.]
] <thm:main>

Theorem 1 resolves the purely cosmetic surgery conjecture for knots in the three-sphere. The homeomorphism in its statement is a map of the entire filled manifolds; it need not preserve a surgery core or the knot exterior. The orientation hypothesis is essential to the question: orientation-reversing, or #emph[chirally cosmetic], coincidences are a different phenomenon.

=== 1.1 The remaining case <the-remaining-case>

Dehn surgery converts the peripheral information of a knot into a closed three-manifold. The cosmetic surgery problem asks how much of the filling slope can be recovered from that oriented manifold. For knot exteriors, this is an instance of the cosmetic filling problem formulated by Gordon #cite(label("Gordon1991")) Conjecture 6.1 and recorded as Bleiler’s Problem 1.81(A) in Kirby’s list #cite(label("Kirby1997")). Bleiler, Hodgson, and Weeks developed the terminology and distinguished fillings related by a symmetry of the exterior from those that are not #cite(label("BleilerHodgsonWeeks1999")). Here the homeomorphism between fillings is arbitrary. Gordon and Luecke’s theorem that nontrivial surgery on a nontrivial knot cannot produce $S^3$ #cite(label("GordonLuecke1989")) Theorem 2 settles the meridional case.

Several theories have supplied obstructions to a cosmetic pair of finite slopes. Boyer and Lines obtained an Alexander-polynomial obstruction from surgery formulae for classical three-manifold invariants #cite(label("BL90")). The rational surgery formula of Ozsváth and Szabó #cite(label("OS11")), Wang’s genus-one theorem #cite(label("Wang06")), and Wu’s exclusion of same-sign purely cosmetic pairs #cite(label("Wu11")) established a Heegaard Floer approach. Ni and Wu strengthened the restriction to opposite slopes #cite(label("NiWu2015")) Theorem 1.2. Using graded Floer information through immersed curves, Hanselman restricted the possibilities to $plus.minus 2$ or $plus.minus 1 \/ q$ for a positive integer $q$, and showed that the $plus.minus 2$ case requires genus two #cite(label("Hanselman2023")) Theorem 2.

Other obstructions and special cases clarify the range of the problem. Ichihara and Wu used the Jones polynomial #cite(label("IchiharaWu2019")), and Detcherry developed a quantum obstruction #cite(label("Detcherry2026")). Tao settled nontrivial cable and composite knots #cite(label("TaoCables2019")) #cite(label("TaoConnected2022")), and Stipsicz and Szabó settled nontrivial pretzel knots #cite(label("StipsiczSzabo2021")). Kotelskiy, Lidman, Moore, Watson, and Zibrowius proved an equivariant version for strongly invertible knots, in which the diffeomorphism commutes with the extended involutions #cite(label("KotelskiyLidmanMooreWatsonZibrowius2024")). Futer, Purcell, and Schleimer combined knot invariants, hyperbolic estimates, and verified computations to establish the conjecture through $19$ crossings and for the one-cusped SnapPy census #cite(label("FuterPurcellSchleimer2025")). Their procedure applies beyond these finite data sets but is not guaranteed to distinguish every pair. Ren proved that the conjecture is equivalent to its restriction to hyperbolic surgeries on hyperbolic knots #cite(label("Ren2025")) Theorem 3, arXiv version 2.

The filtered instanton argument of Daemi, Lidman, and Miller Eismeier excludes the pairs $plus.minus 1 \/ q$. Combined with the earlier restrictions, their Corollary 1.4 leaves only opposite integer slopes of magnitude two on a genus-two knot; it also imposes additional Alexander and Jones polynomial conditions #cite(label("DaemiLidmanMillerEismeier2025")). We use only the following consequence.

#thm([Proposition 1.2.])[
  (Cosmetic surgery reduction).  #emph[If a smooth nontrivial knot $K subset S^3$ has distinct purely cosmetic slopes, then $g \( K \) = 2$ and the two slopes are $- 2$ and $2$.]
] <prop:introduction:reduction>

For completeness, the zero slope causes no additional case: $H_1 \( S_(p \/ q)^3 \( K \) \; bb(Z) \)$ is cyclic of order $\| p \|$ for $p eq.not 0$ and is infinite cyclic for $p = 0$. Primitivity makes $0 \/ 1$ the unique slope with zero numerator. The meridional slope is covered by the sphere-filling theorem just mentioned.

We henceforth suppose that $g \( K \) = 2$ and that there is an oriented diffeomorphism

#[#set math.equation(numbering: n => "(1.1)")
 $ phi.alt : Y_(- 2) arrow.r Y_2 \, #h(2em) Y_j = S_j^3 \( K \) \, quad Y_oo = S^3 . $ <eq:introduction:cosmetic>]

The three-dimensional smoothing theorem permits the original homeomorphism to be replaced by a homotopic diffeomorphism #cite(label("Massuyeau2011")) Theorem 2.3. Homotopy preserves its degree, so this replacement preserves orientation. We will obtain a contradiction without imposing any peripheral condition on $phi.alt$.

=== 1.2 The argument <the-argument>

There are two counts. The first is an integer instanton count $Omega eq.not 0$ on a closed parameterized cobordism. The second is an oriented one-dimensional spinor count whose boundary would force $2^eta Omega = 0$. The work is to construct the two counts with compatible metrics, incidence conditions, determinant lifts, and orientations.

The comparison follows the nonabelian-monopole cobordism strategy of Pidstrigach–Tyurin and Okonek–Teleman #cite(label("PidstrigachTyurin1995")) #cite(label("OkonekTeleman1996")), with the analytic and instanton-link development of Feehan–Leness #cite(label("FeehanLenessPU2I")) #cite(label("FeehanLenessPU2II")) #cite(label("FeehanLenessLinksI")). The doubled phase class is part of that method. Here the simultaneous family, its relative boundary analysis, and the regularization of mixed projections are constructed explicitly.

The ordinary count uses instanton Floer and Donaldson theory #cite(label("Floer1988")) #cite(label("Donaldson2002")) #cite(label("DonaldsonKronheimer1990")), with determinant-one gauge transformations. At the rational ends with first homology of order at most two, all flat reducers are central. At zero surgery we instead use the determinant class evaluating oddly on the capped Seifert surface. Ordinary surgery families give units modulo two. The negative direction requires an interval of metrics, a degree-two sphere test, and a signed sum over two determinant lifts. The two minimal lens-wall contributions cancel with these signs. Symplectic caps and ordinary Donaldson invariants provide a nonzero rational cap pairing whose probes can be moved off all variable blocks, following the cap and nonvanishing methods of Kronheimer–Mrowka #cite(label("KronheimerMrowka2004")) #cite(label("KronheimerMrowka1995")). Repetition on the free integral Floer lattice modulo a power of two then produces the nonzero integer $Omega$.

The same repetition makes the complex coupled Dirac index $n_D$ positive while preserving nonvanishing; the index calculation and integral congruences are in Section 5. The phase circle acts by multiplying the spinor. Starting from the zero-dimensional ordinary count, adding spinors, imposing $eta = n_D - 1$ complex phase cuts, and taking the effective phase quotient gives expected dimension

$ 2 n_D - 2 eta - 1 = 1 . $

Near an ordinary instanton the phase link is $bb(C P)^(n_D - 1)$, and each phase cut has class twice the hyperplane class, as in the link calculation of Feehan–Leness #cite(label("FeehanLenessPU2II")) Lemma 3.28 and Proposition 3.29, arXiv version 3. These links contribute $2^eta Omega$ with the ordinary instanton signs.

Reducible fields and broken or bubbled limits could supply additional ends. To control them, we construct toric metric sectors using the Hessian description of Guillemin and the scalar-curvature formula of Abreu #cite(label("Guillemin1994")) #cite(label("Abreu1998")). Their periods constrain every parallel line reduction, that is, a splitting of the bundle into line bundles preserved by the connection. Long tube estimates and isolated-cap estimates make those constraints simultaneous, including at genuine corners of the parameter family. The resulting quadratic and index inequalities exclude fixed tuples and every mixed broken or bubbled boundary except a face at which one minimal trace cap separates.

At each surviving lens face, precisely one minimal trace cap separates from a single free main component. These limits have no particles, and regular cylindrical gluing applies. The two determinant sectors at each face cancel using the same local orientation comparison that defined the negative instanton unit. The oriented boundary formula now contradicts $Omega eq.not 0$.

The analytic construction proceeds in stages. The ordinary representatives and their compactness properties are established independently of the nonvanishing argument. For the spinor problem, energy bounds and ideal compactness precede fixed-type regularization and its index exclusions; these precede the finite projected regularization and the construction of the remaining regular ends. Gluing these ends precedes the final interior regularization of the one-dimensional free stratum. The generic choices are made around the ordinary data, within a neighborhood preserving $Omega$. The final boundary formula is applied only after these stages are complete.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Ordinary units and cap pairing#linebreak()Sections~2--4]]])])
  content((6.753, 0), [#box(width: 5.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Metric families and line estimates#linebreak()Sections~6--7]]])])
  content((0, -2.05), [#box(width: 5.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Integral repetition#linebreak()$Omega != 0$, $n_D>0$; Section~5]]])])
  content((6.753, -2.05), [#box(width: 5.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Boundary index inequalities#linebreak()Section~8#linebreak() Hypotheses supplied in Sections~9--10]]])])
  content((3.376, -4.175), [#box(width: 9.153cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Compatible perturbations, compactness, and regular end gluing#linebreak()Sections~9--10]]])])
  content((3.376, -5.675), [#text(size: 9pt)[Instanton links: $2^ eta Omega$ Lens pairs: $0$]])
  line((0, -0.525), (0, -1.525), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.753, -0.525), (6.753, -1.525), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -2.575), (-1.2, -3.65), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.753, -2.575), (7.953, -3.65), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((3.376, -4.7), (3.376, -5.675), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The two parts of the proof meet in one compatible boundary count. The analytic construction supplies the regularity hypotheses used by the dimension inequalities; those inequalities in turn identify the allowed ends. ],
) <fig:introduction:structure>

=== 1.3 Local constructions and organization <local-constructions-and-organization>

Three constructions carry the main technical content. First, a parameterized negative cobordism is made into an integral chain map by a local comparison of two determinant lifts, while its invertibility is detected modulo two (Theorem 23 and Proposition 25). Second, a family of toric periods, together with a separate flux estimate on a long $S^2 times S^1$ tube, yields line-class inequalities that persist across compatible separations (Theorems 54 and 64). Third, exact-support incidence conditions and finite equivariant branch perturbations permit negative-dimension arguments on projections of mixed strata (Lemmas 99 and 103, and Proposition 104). These projections forget zero-spinor reducer fields while retaining their parameters; the remaining equations are independent of the forgotten fields. The finite construction is confined to images of candidate tuples whose retained main fields solve the equations and cuts, with omitted lens caps and cylinder levels recorded through discrete nonnegative charge assignments. Their statements retain the local hypotheses explicitly, so that these constructions can be used apart from the final knot surgery contradiction.

The proof distinguishes two kinds of neck throughout. The surgery seams $Y_j$ and the auxiliary isolation collars are long but finite. The genuine infinite faces in the spinor compactification are the specified $S^3$ cuts, denoted $J$, and the lens boundaries of square-$- 4$ sphere neighborhoods. Their limiting metrics have positive scalar curvature. Thus the proof does not require a general regular spinor Floer theory on the knot surgeries, or gluing at positive particle levels.

Sections 2–5 construct the ordinary nonzero count and its topological data. Sections 6–7 construct the metrics and prove the line estimates with their order of choices. Section 8 proves the boundary inequalities under precise regularity and incidence hypotheses. Section 9 constructs representatives, proves compactness, and supplies the regularity needed for the boundary exclusions and the instanton links. Section 10 constructs the surviving lens collars, regularizes the remaining free interior, and completes the boundary count proving Theorem 1.

== 2 Ordinary instanton theory and the handle units <sec:ordinary>

We write $Y_j = S_j^3 \( K \)$, including $Y_oo = S^3$, and write $A subset Y_0$ for the capped Seifert surface. On $Y_0$ the determinant line evaluates oddly on $A$; on $Y_(plus.minus 1) \, Y_(plus.minus 2)$ and $Y_oo$ it is trivializable. All gauge transformations have determinant one. In particular, fixing a determinant means fixing its connection and its transition identifications, not passing to the full group of projective gauge transformations.

We establish the following ordinary input. The word “unit” means an isomorphism on instanton homology over $bb(F)_2$; it does not assert that a particular matrix on the chain group is invertible.

#thm([Theorem 2.1.])[
  (Ordinary handle units).  #emph[Let $C \( Y_j \; bb(Z) \)$ be the irreducible, unframed instanton complex with the determinants just specified. Compatible small perturbations and coherent orientations can be chosen so that the rigid counts define integral chain maps, and the rigid and interval counts have the following properties over $bb(F)_2$.]
  + #emph[Each rigid meridional handle map $Y_r arrow.r Y_(r + 1)$, for $r = 0 \, 1$, is a unit whenever its determinant has the specified end restrictions. The rigid count on their composite is their composition up to chain homotopy. Denote this composite by $f_(+) : C \( Y_0 \) arrow.r C \( Y_2 \)$.]
  + #emph[On the path $2 arrow.r oo arrow.r 0$, let $F_l \, A$ be the capped Seifert classes of squares $- 2 \, 0$, respectively, with $F_l dot.op A = 0$, and let $S_l = A - F_l$. Choose the base determinant $c \( F_l \, A \) = \( 0 \, 1 \)$ and the two determinants $c + e "PD" \( S_l \)$, $e = 0 \, 1$, identified off $S_l$. The sum modulo two of the interval counts of actual index $- 1$ is a unit $g_(+) : C \( Y_2 \; bb(F)_2 \) arrow.r C \( Y_0 \; bb(F)_2 \)$.]
  + #emph[The mirror construction, read backwards, gives units $f_(-) : C \( Y_(- 2) \) arrow.r C \( Y_0 \)$ on the rigid path through $- 1$, and $g_(-) : C \( Y_0 \; bb(F)_2 \) arrow.r C \( Y_(- 2) \; bb(F)_2 \)$ on $0 arrow.r oo arrow.r - 2$. For $g_(-)$ the base evaluations are $\( 1 \, 0 \)$ and the second determinant differs by the Poincaré dual of the intervening $\( - 2 \)$-sphere.]
  #emph[For the summed interval maps, each summand has an integral orientation; the assertion that the sum is a chain map and a unit is required only after reduction modulo two. End identifications, including any tensor automorphisms, are fixed before composing the maps.]
] <thm:ordinary:units>

The proof occupies this section. After fixing the complexes and index conventions, we construct the handle families and their determinant data. We then establish the perturbation and matching results needed to compute every boundary face of the interval and pentagon counts.

=== 2.1 Complexes and index conventions <complexes-and-index-conventions>

#thm([Lemma 2.2.])[
  (Reducibles at the ordinary ends).  #emph[At a trivializable-determinant rational end occurring here, every reducible flat connection is central after a square-root normalization of the determinant. Its adjoint cohomology has $\( h^0 \, h^1 \) = \( 3 \, 0 \)$. The admissible determinant on $Y_0$ has no reducible projectively flat connection. Small perturbations fixing the central connections preserve these properties.]
] <lem:ordinary:central-ends>

#proof[
  The first homology of the rational ends is either zero or $bb(Z) \/ 2$. A reducible $"SU" \( 2 \)$ representation is Abelian, so factors through that first homology and takes values in ${ 1 \, - 1 }$. Its adjoint local system is therefore the trivial rank-three system. Rational homology-sphere cohomology gives $h^0 = 3$ and $h^1 = 0$. The two possible central lifts at an order-two end remain distinct fixed-determinant flat connections; their adjoint corrections coincide.
  A reducible projectively flat connection on $Y_0$ would split as two line connections with equal real first Chern class. Its determinant would consequently pair evenly with the integral surface $A$, contrary to the choice of determinant. At a central rational flat the Hessian on the Coulomb slice is invertible, since $h^1 = 0$. The implicit function theorem, with the residual compact stabilizer acting on that slice, therefore preserves its isolation when the perturbation vanishes there. If new reducible critical points appeared for perturbations tending to zero, compactness in dimension three would give a reducible flat limit. The preceding isolation, or the admissibility obstruction at $Y_0$, excludes such a sequence. ◻
]

Thus the irreducible-only Floer construction applies to these ends. We use the determinant-one version throughout #cite(label("KronheimerMrowka2010")) Section 7.1, arXiv version 2; the extension to three-manifolds with two-torsion first homology is explicitly recorded in #cite(label("GhoshSivekZentner2023")) Section 2, Theorem 2.3. After a nondegenerate perturbation there are finitely many generators. The differential counts oriented index-one trajectories modulo translation. The central-contact estimate proved below excludes central strata from the compactifications defining the differential and its square. At $Y_oo$ choose the unperturbed flat problem, so that

#[#set math.equation(numbering: n => "(2.1)")
 $ C \( Y_oo \) = 0 . $ <eq:ordinary:sphere-complex>]

We may forget the finite Floer grading when discussing linear isomorphisms; whenever a moduli space is counted, its actual integer index, rather than only its residue class, is specified.

#prodef([Convention 2.3.])[
  (Relative sectors and fixed-limit index).  The cobordism $C_j$ is the oriented knot trace from $Y_oo$ to $Y_j$. Paths of cobordisms are written in chronological order; their induced operators compose from right to left. The symbol $C_j$ for a cobordism is distinct from the complex $C \( Y_j \)$.
  On a completed piece, $i$ denotes the unframed ASD index with the boundary representatives fixed. Gauge transformations may approach independent parallel stabilizers at the ends. Normal remainders have small positive exponential weights. We retain all relative bundle sectors compatible with the fixed determinant transitions, and select the required actual total index. A matching across an isolated flat adds $h^0$ to the sum of the two fixed-limit indices.
  At $L = S^1 times S^2$ with trivialized determinant, harmonic flat parameters are included before residual conjugation. At a noncentral flat $\( h^0 \, h^1 \) = \( 1 \, 1 \)$, and at a central flat $\( h^0 \, h^1 \) = \( 3 \, 3 \)$. Varying one fixed asymptote adds $h^1$; matching two fixed-asymptote pieces adds $h^0 + h^1$.
  Choose the ordinary integral determinant-line orientation systems, with true-end orientations, homology orientations and integral determinant lifts fixed. These systems are orientable for the determinant-one problem. In any fixed relative bundle sector the space of reference connections with fixed product-flat collars is affine, hence connected; a comparison made by determinant-line excision therefore extends by orientation transport with a constant relative sign. Gluing these comparisons is associative. Changing an internal framing degree changes the relative charge sector, so a cap prescribed to have charge $1 \/ 4$ uses that prescribed framing degree. These orientation conventions are those of the ordinary ASD/Floer construction #cite(label("DonaldsonKronheimer1990")); see in particular #cite(label("Donaldson2002")) Section 5.4, Proposition 5.11, and Section 5.6 for determinant-line gluing and determinant-one conventions.
] <conv:ordinary:index>

#thm([Lemma 2.4.])[
  (Charge and index bookkeeping).  #emph[Put $E = - p_1 \( "ad" E \) \/ 4$, interpreted by Chern–Weil on the completed connection. Increasing relative charge by one increases $i$ by eight. If a connected piece has $b_1 = 0$ and only central rational ends, then 
#[#set math.equation(numbering: n => "(2.2)")
 $ i = 8 E - 3 \( 1 + b^(+) \) . $ <eq:ordinary:central-index>]

 For replacements with identical boundary flats and fixed transitions, including all matching terms, the index difference is 
#[#set math.equation(numbering: n => "(2.3)")
 $ Delta i = 8 Delta E - 3 / 2 Delta \( chi + sigma \) . $ <eq:ordinary:excision>]

 The nonnegative lower charge bounds used below persist for sufficiently small perturbations. On a product neck with a bounded Floer functional perturbation, the required error is bounded independently of the neck length.]
] <lem:ordinary:index>

#proof[
  The real ASD symbol contributes $- 3 \( chi + sigma \) \/ 2$, and its bundle term is $- 2 p_1 \( "ad" E \) = 8 E$. APS boundary terms for a central flat are those of three trivial real coefficients. Under Convention 5, the scalar fixed-limit complex has index $- 1 - b^(+)$; tensoring by the parallel adjoint fiber gives (2.2). This also gives $- 3$ for a flat central cylinder, as required by the addition of its three matching directions. Excision cancels the identical boundary terms and proves (2.3). These are the usual ASD index formulas with the unframed correction retained; see #cite(label("DonaldsonKronheimer1990")) and #cite(label("DaemiLidmanMillerEismeier2025")) Equation (10), p. 24.
  For unperturbed ASD fields, the trace-free charge is a nonnegative multiple of the curvature norm squared. In each application its possible values lie in a specified discrete translate of $bb(Z)$. If a sequence of perturbations tending to zero violated the stated lower bound, compactness and charge quantization would give an ASD limit, with any lost charges positive, violating that same bound. On a long product one uses the gradient identity instead of a bound proportional to length. With the normalization of Chern–Simons absorbed in a fixed positive constant, a gradient trajectory satisfies
  $ integral_a^b parallel dot(a) \( t \) parallel^2 thin d t = "CS" \( a \( a \) \) + h \( a \( a \) \) - "CS" \( a \( b \) \) - h \( a \( b \) \) . $
  The perturbation contribution is bounded by $2 parallel h parallel_oo$. On concatenated product segments the intermediate functional values telescope. Consequently smallness can be fixed before increasing the product length. This is also the energy estimate used when discarding a nonconstant collar level. ◻
]

A regular count over a $p$-dimensional metric family, without insertions, has $i = - p$. Its one-dimensional boundary relation has $i = 1 - p$. An irreducible nonconstant trajectory has index at least one before quotienting by translation. A #emph[particle] is an ideal curvature-concentration point with a positive integral charge. A particle of charge $q$ lowers the field index by $8 q$ and has at most four location parameters. These conventions will be used even when a piece is filled only virtually for an index comparison.

=== 2.2 The polygon model and its metric families <the-polygon-model-and-its-metric-families>

The polygon and associahedral surgery families follow the constructions of Culler–Daemi–Xie #cite(label("CullerDaemiXie2020")) Section 4.3 and Theorem 4.56, arXiv version 1 and Daemi–Lidman–Miller Eismeier #cite(label("DaemiLidmanMillerEismeier2025")) Section 5. We supply the local plumbing, determinant and boundary calculations needed for the present ends and integral units.

#thm([Lemma 2.5.])[
  (Polygon traces and plumbing cuts).  #emph[A path of adjacent slopes has a smooth toric local model over a polygon. Choose clockwise primitive slope vectors $w_0 \, dots.h \, w_m$ with $det \( w_i \, w_(i + 1) \) = - 1$. Collapse the circle of slope $w_i$ over the corresponding side and the whole torus at each corner, and attach the remaining boundary to the knot exterior times an interval. An arc from the exterior boundary to side $i$ gives the primary cut $Z_i = Y_(w_i)$. An arc between sides $i \, j$, $j - i gt.eq 2$, gives a cut $M_(i j)$ bounding the linear plumbing associated with the intervening sides. Its spheres have consecutive intersections $+ 1$ and squares $- d_k$, where 
#[#set math.equation(numbering: n => "(2.4)")
 $ w_(k - 1) + w_(k + 1) = d_k w_k . $ <eq:ordinary:fan-relation>]

 If the two endpoint slopes agree, the plumbing boundary is $L = S^1 times S^2$. Its primitive radical is the image of the boundary $S^2$. Replacing this cap by $D = S^1 times D^3$ joins the two equal collapsed sides and leaves the exterior identity cylinder.]
] <lem:ordinary:polygon>

#proof[
  At a corner the two adjacent slope circles form an integral basis. The quotient is therefore the usual smooth two-disk corner model, rather than an orbifold. Along an interior side the change from the preceding basis to the following basis reverses the tangent circle parameter and has normal degree $- d_k$, proving (2.4) and the self-intersection formula. The common corner contributes intersection $+ 1$ to neighboring spheres. Trivializations along the exterior side give precisely the usual two-handle trace, since $oo arrow.r j$ is $C_j$, $j arrow.r oo$ is its orientation-reversed reverse, and $r arrow.r r + 1$ adds a $\( - 1 \)$-framed meridian to $C_r$. Removing a side of square $- 1$ is the corresponding corner blow-down.
  The inverse image of an arc from the exterior side is the filled three-manifold at that slope. The inverse image of an arc between two collapsed sides is the boundary of their intervening chain, which proves the cut descriptions. When the endpoint circles are equal, their collapse gives a sphere, and the transverse circle remains free; the boundary is $S^2 times S^1$. The sphere along that arc is primitive, and its image in the plumbing is the primitive null vector of the intersection matrix. Filling by $S^1 times D^3$ replaces the arc by a half-disk with one straight collapsed edge. This joins the equal sides without changing the exterior gluing and proves the last assertion. ◻
]

#thm([Lemma 2.6.])[
  (Compatible associahedral metric families).  #emph[A two-step path has an interval family with endpoint cuts $Z_1 \, M_02$. A three-step path has a pentagon family with faces $Z_1 \, Z_2 \, M_02 \, M_13 \, M_03$. A four-step path has the corresponding three-dimensional associahedral family. Each face carries the product families on its split pieces, and compatible simultaneous cuts are exactly the disjoint noncrossing arc systems.]
  #emph[Two consecutive final handles may instead be retained as a fixed segment. For the path $2 \, oo \, 0 \, 1 \, 2$, this gives a pentagon with faces 
#[#set math.equation(numbering: n => "(2.5)")
 $ Z_1 \, quad Z_2 \, quad M_02 \, quad M_04 \, quad M_14 $ <eq:ordinary:compressed-cycle>]

 in cyclic order. The $M_04$ edge has endpoints $M_02$ and $M_14$; no cut internal to the fixed segment is introduced.]
] <lem:ordinary:metric-families>

#proof[
  Use collars of the polygon arcs of Lemma 7. At shared slope sides, separate their endpoints slightly in noncrossing order; at the exterior side use distinct ordered slices. Thus every compatible arc system has disjoint collars. Face-product coordinates of an associahedron specify independent lengths for precisely these collars. Choose the metrics on completed pieces inductively over faces, with fixed product metrics on the cross-sections: round metrics on lens spaces and the product metric on $L$. For finite lengths glue and round these collars. Once prescribed on a neighborhood of the boundary of a parameter face, the metrics extend over its compact interior because positive-definite symmetric forms form a convex cone.
  For two steps, the only alternatives are splitting at the intermediate filling or isolating the intervening sphere. For three steps, the noncrossing arc description gives the five listed faces and their corner incidences. Keeping the last two handles fixed simply treats their union as the third block; the same three-block construction applies. In the original indices its cap cuts are $M_02 \, M_14 \, M_04$, giving (2.5). Omitting the interior cut of a fixed block leaves that block’s data unchanged and does not create another boundary parameter. The construction inserts only neck lengths; it introduces no twist coordinate. ◻
]

#thm([Lemma 2.7.])[
  (Topological and determinant data for the unit families).  #emph[The single steps $r arrow.r r + 1$ for $r = 0 \, 1$, and their composite $0 arrow.r 1 arrow.r 2$, have $H_1 = 0$ and $b^(+) = 0$. A determinant on a single step with the prescribed end restrictions is determined modulo twice an integral class; changing it within that parity changes the map only by tensor identifications at the ends.]
  #emph[The pentagons proving the single-step units may be taken on 
#[#set math.equation(numbering: n => "(2.6)")
 $ s arrow.r oo arrow.r r arrow.r s \, #h(2em) r arrow.r s arrow.r oo arrow.r r \, #h(2em) s = r + 1 . $ <eq:ordinary:two-triples>]

 Their hard caps have chain $\[ - 1 \, - 1 \]$, primitive radical $P_1 + P_2$, and determinant evaluations $\( 1 \, - 1 \)$ up to a common sign. The compressed pentagon for $g_(+)$ has chain $\[ - 2 \, - 1 \, - 2 \]$, radical $S_l + 2 T_1 + R$, and determinant evaluations 
#[#set math.equation(numbering: n => "(2.7)")
 $ c_0 \( S_l \, T_1 \, R \) = \( 1 \, - 1 \, 1 \) \, #h(2em) c_1 \( S_l \, T_1 \, R \) = \( - 1 \, 0 \, 1 \) . $ <eq:ordinary:hard-determinants>]

 All these full pentagon cobordisms and their interval subpieces have $b^(+) lt.eq 1$.]
] <lem:ordinary:unit-topology>

#proof[
  An attached meridian normally generates the incoming surgery group, so the single steps have trivial first homology. Precede $r arrow.r r + 1$ by $C_r$ and blow down the meridional corner. The result is $C_(r + 1)$ blown up once, with orthogonal classes $G \, T$, $G^2 = r + 1$, $T^2 = - 1$. The incoming trace class is $G - T$, and the image of the step’s intersection lattice is its orthogonal complement, by the relative homology exact sequence. For $r = 0$ it is generated by $G - T$ and is null; for $r = 1$ it is generated by $G - 2 T$, of square $- 2$. In particular neither step has positive rank. Preceding $0 arrow.r 1 arrow.r 2$ by $C_0$ gives the twice blown-up $C_2$, with incoming null class $G - T_1 - T_2$. Its orthogonal complement has no positive subspace. This proves the assertions about $b^(+)$ and, again by normal generation, $H_1$.
  The rank-one integral cohomology of a step tests the indicated generator, and the end restrictions fix its parity. Since $H_1 = 0$ there is no torsion ambiguity in this statement. Two determinants of that parity differ by twice a line class. Tensoring the rank-two bundle by that line identifies their adjoint equations and induces the corresponding fixed identifications on the end complexes. The rank and invertibility assertions about the map are invariant under these end automorphisms.
  For the first triple in (2.6), use orthogonal classes $F_l \, G \, T$ with squares $- s \, s \, - 1$ and put
  $ P_1 = G - T - F_l \, #h(2em) P_2 = T \, #h(2em) c \( F_l \, G \, T \) = \( 0 \, 0 \, - 1 \) . $
  Their intersections give the chain $\[ - 1 \, - 1 \]$ and $c \( P_1 \, P_2 \) = \( 1 \, - 1 \)$. For the second triple, blow down $P_1 = T$ to $- C_r + C_r$ with classes $F_l \, G$ of squares $- r \, r$, and put
  $ P_2 = G - F_l - T \, #h(2em) c \( F_l \, G \, T \) = \( 1 \, 1 \, 1 \) . $
  Again the chain determinant is $\( 1 \, - 1 \)$. The intermediate $- C_s$ class is $F_l + T$, with even determinant evaluation; thus the order-two end, when present, has the required trivializable restriction. The zero-surgery restriction is odd in the relevant coordinates. These presentations have at most one positive direction, as do their subpieces.
  For the compressed path the full trace is $- C_2$ followed by the twice blown-up $C_2$. In the orthogonal basis $F_l \, G \, T_1 \, T_2$ the squares are $- 2 \, 2 \, - 1 \, - 1$. Set
  #[#set math.equation(numbering: n => "(2.8)")
   $ A & = G - T_1 - T_2 \,\
S_l & = G - T_1 - T_2 - F_l \, #h(2em) R = T_2 - T_1 \,\
c_0 \( F_l \, G \, T_1 \, T_2 \) & = \( 0 \, 0 \, - 1 \, 0 \) \, #h(2em) c_e = c_0 + e "PD" \( S_l \) . $ <eq:ordinary:three-chain>]
  Direct intersection gives squares $- 2 \, - 1 \, - 2$ and adjacent intersections $1$. The determinant evaluations are precisely (2.7), and both annihilate the radical. On $- C_2 + C_0$ they restrict to the data of Theorem 3(ii). At $Z_2$ the remaining piece has an allowed determinant for $f_(+)$. The displayed ambient diagonal form also proves the positive-rank bound. ◻
]

=== 2.3 Compatible perturbations <compatible-perturbations>

The handle families require perturbations that agree on shared faces and vary independently on separated pieces. Interior equation perturbations provide this freedom; at true Floer ends they must be gradients of time-independent invariant functions. We construct these two types of perturbation separately.

#thm([Lemma 2.8.])[
  (Local perturbations and fixed-flat evaluation).  #emph[For the finite ordinary families used in this section one can choose arbitrarily small compatible perturbations with the following properties.]
  + #emph[Irreducible equations, together with any specified finite collection of auxiliary evaluations, are transverse, using variations supported in the same component. On a split face, variations on different components are independent.]
  + #emph[At a specified harmonic reducible, perturbations can vanish in value while prescribing arbitrary finite-rank complex-linear maps from the off-diagonal kernel to the off-diagonal cokernel. Thus a complex index-zero normal operator can be made invertible, and a complex index-one normal operator can be made surjective.]
  + #emph[Evaluation of an irreducible field at an $S^1 times S^2$ end is transverse to a local flat slice. Fixing a central flat imposes three real conditions in that slice.]
  #emph[The equation perturbations are independent of auxiliary cut marks. They may be taken cylindrical at designated ordinary product ends, with exponentially decreasing tails at separated auxiliary ends.]
] <lem:ordinary:perturbations>

#proof[
  Choose a base frame and finitely many based loops and paths in the component. Their holonomies and transports are equivariant under the compact frame group. At an irreducible field some finite set has precisely the central stabilizer. To see the corresponding infinitesimal assertion, suppose that every loop variation is a simultaneous infinitesimal conjugation. Extend that infinitesimal conjugating element along paths from the base point. The loop condition makes the extension independent of the path, and the resulting section is an infinitesimal gauge transformation. Thus finite samples detect any prescribed finite-dimensional horizontal tangent space.
  In a slice of the sample space choose equivariant coefficient functions, and transport arbitrary compactly supported output forms from small balls. To test universal surjectivity at a smooth base configuration, first use the auxiliary linearization from $W_(delta_S)^(1 \, q)$ to $L_(delta_S)^q$, with $q > 4$. When the higher charts use a Hölder weight $delta_H$, choose $0 < delta_S < delta_H$ in the same root-free interval of the normal end operator. Field values on paths and at points are continuous in this domain; coefficients arising from moving paths or finite parameters are evaluated at the smooth base. Vary auxiliary cut values independently, thereby killing the finite-dimensional cut component of any cokernel functional. Its equation component is then an $L^(q')$ dual functional, where $q' = q \/ \( q - 1 \)$. Smooth compactly supported outputs detect every nonzero such functional, even when required to avoid finitely many labeled particle locations, since they are dense in $L_(delta_S)^q$. No smoothness of an adjoint cokernel field is asserted; derivatives of graph terms can have distributional adjoints. A finite selection of outputs spans the finite-dimensional cokernel. Primal elliptic bootstrap transfers this surjectivity to the higher-order charts: a low-order solution of the linearized equation with higher-order right-hand side gains the required regularity. The fixed output forms are smooth, while transport and sample linearizations preserve the available Hölder order with the prescribed summable bounds; scalar cutoff functionals multiply smooth profiles. Sobolev embedding first supplies positive Hölder regularity, the local elliptic inverse gains one order, and iteration gives each higher order. The end estimates transfer the solution to weight $delta_H$ because there are no intervening indicial roots; no equal-weight Hölder-to-Sobolev inclusion is used. A countable dense library and Sard–Smale then give simultaneous transversality for the countably many relative sectors and breaking types in question.
  At a reducible, retain noncentral sample data to distinguish its parallel torus. The off-diagonal tangent and target spaces carry the same complex torus character. Slice-linear equivariant functions with zero value on commuting samples realize arbitrary complex-linear maps between finite kernel and cokernel subspaces. Finite-rank perturbation theory then gives the asserted invertibility or surjectivity. The value on the entire Abelian path remains zero. Further irreducible variations are supported away from that path in configuration space.
  To vary the asymptote, extend a prescribed infinitesimal harmonic flat variation over the end. Its equation error is compactly supported after a cutoff and is cancelled by the same interior universal variations. This proves transversality of the evaluation. Near a central $S^1 times S^2$ flat the slice consists of the three parameters $h theta.alt$, $h in frak(s u) \( 2 \)$, with the full parallel group acting on $h$. On the irreducible exterior the condition $h = 0$ has codimension three. Quotienting the flat space first to a conjugacy interval would obscure these three equations and is not our convention.
  One may implement the samples by thickened loops, or by graph samples multiplied by small-ball curvature cutoffs. In the latter description the cutoff is zero if the graph enters a ball with curvature above a fixed small-energy threshold. Consequently a particle disables a graph it meets; graph terms away from particles converge in regular gauges. Countably many terms with summable smooth operator norms suffice. At product faces extend each term from its component and turn off incompatible terms. Product cutoffs and a relative generic extension over parameter interiors preserve the face data. Moving paths can be handled in successively higher Sobolev or little-Hölder orders, so that the finite differentiability required by Sard–Smale is available. No mark variable enters the equation coefficients. This construction is the ordinary, zero-spinor specialization of the more detailed compactness-compatible construction in Section 9. ◻
]

For actual Floer ends the perturbations in the last lemma must be gradients of time-independent invariant functions. The next lemma supplies this additional requirement, rather than treating arbitrary interior curvature perturbations as Floer perturbations.

#thm([Lemma 2.9.])[
  (Gradient transversality on ordinary trajectories).  #emph[Small time-independent invariant thickened-holonomy functions, fixing the central critical points, can make the irreducible critical points and all irreducible trajectories needed here regular. Their gradients are bounded, and their Hessians along a compact smooth configuration arc are bounded operators on $L^2$.]
] <lem:ordinary:gradient-transversality>

#proof[
  Average invariant functions of simultaneous based holonomies over a disk of base points and submersively thickened paths. The first variation is a bounded transported insertion along the paths; Cauchy–Schwarz followed by integration over the thickening gives an $L^2$ bound for the Hessian. Use weighted summable smooth norms for a countable collection of such functions. Thin-loop values and first variations on a compact smooth arc are limits of these averages. The detection argument of Lemma 10 therefore supplies arbitrary finite-dimensional differentials on an irreducible sample slice, which proves universal transversality for the critical points.
  We verify the corresponding assertion for trajectories. In temporal gauge write $dot(a) = - "grad" \( "CS" + h \) \( a \)$. Two smooth solutions agreeing on a time slice agree everywhere. Indeed, on a compact interval their difference satisfies
  $ dot(xi) + D xi = B \( t \) xi \, $
  where $D$ is time-independent and symmetric and $B \( t \)$ is bounded on $L^2$. On a nonzero interval set $m = chevron.l D xi \, xi chevron.r \/ parallel xi parallel^2$. Differentiation and completion of the variance square give
  $ m' lt.eq 1 / 2 parallel B parallel^2 \, #h(2em) \( log parallel xi parallel^2 \)' = - 2 m + O \( parallel B parallel \) . $
  The first inequality bounds $m$ above towards the right, and the second then prevents the norm from reaching zero at a finite right endpoint. Apply the same argument after reversing time and replacing $D$ by $- D$ to exclude a finite left endpoint. This proves uniqueness in both directions.
  If a spatial gauge transformation stabilizes one slice, uniqueness implies that it stabilizes the entire trajectory. Thus every slice of an irreducible trajectory is irreducible. Comparison with a critical trajectory shows that the velocity never vanishes and neither limiting critical point is attained. Comparison with a time translate shows that repetition modulo spatial gauge would make the positive energy of a nonconstant segment repeat indefinitely, contradicting finite energy. Hence the trajectory is an injectively immersed curve in the spatial quotient.
  Let $eta$ annihilate the universal linearization, including all additional gradient perturbations supported away from the limiting critical points. Compactly supported temporal-connection and spatial-field variations imply
  #[#set math.equation(numbering: n => "(2.9)")
   $ d_a^(*) eta = 0 \, #h(2em) - dot(eta) + cal(H)_a eta = 0 \, #h(2em) cal(H)_a = * d_a + "Hess" h \( a \) . $ <eq:ordinary:trajectory-adjoint>]
  A small compact segment of the immersed trajectory can be isolated from the rest by finitely many sample functions: injectivity, compactness up to its limiting critical points, and finite-dimensional tangent detection give such a slice chart. In that chart choose a function whose restriction to the curve is zero but whose differential in any chosen horizontal normal direction is arbitrary. Pairing its gradient with $eta$ forces $eta \( t \) = c \( t \) dot(a) \( t \)$. Next choose arbitrary functions along the curve, with compact support in the chart. The universal pairing becomes $integral c \( t \) frac(d, d t) f \( a \( t \) \) thin d t = 0$, so $c$ is constant. Thickened averages approximate all these tests, hence give the same conclusion.
  Differentiating the trajectory equation gives $dot.double(a) = - cal(H)_a dot(a)$. Combining this with (2.9) and $eta = c dot(a)$ shows that, if $c eq.not 0$, both $cal(H)_a dot(a)$ and $dot.double(a)$ vanish. The $L^2$ norm of the velocity would then be constant; finite energy forces it to be zero. Thus $c = 0$, proving universal surjectivity. Local slices, elliptic regularity and simultaneous Sard–Smale complete the construction. This argument asserts no regularity for arbitrary reducible trajectories; those are controlled by their index and charge instead. ◻
]

The same choices regularize the metric families of Lemma 8. Relative cutoffs extend the auxiliary data from their prescribed product faces, and relative generic extension over each parameter interior leaves those face restrictions unchanged.

=== 2.4 Ordinary gluing and harmonic necks <ordinary-gluing-and-harmonic-necks>

At an irreducible nondegenerate match the end operator has no zero modes. We first recall this gluing argument, then treat the harmonic flat modes at the auxiliary cap boundaries.

#thm([Lemma 2.10.])[
  (Ordinary irreducible gluing).  #emph[Suppose completed ordinary ASD pieces have matching isolated, nondegenerate irreducible end connections, fixed determinant-preserving transition identifications, and compatible cut data. At a regular matched cut configuration, gluing gives the usual local product chart, including the neck-length parameters when these are variable. In particular an isolated regular matched configuration gives one nearby solution at each sufficiently long prescribed neck. The chart exhausts solutions converging to that configuration and carries the coherent determinant-line gluing orientation.]
] <lem:caps:irreducible-gluing>

#proof[
  At a nondegenerate irreducible critical point the gauge-fixed tangential operator has $h^0 = h^1 = 0$, hence a spectral gap. The fields and their linearized variations converge exponentially on the ends. Pregluing therefore has exponentially small equation and cut errors. Split off the finite-dimensional tangent space of the regular matched problem; on its complement the half-problem operators have bounded right inverses. Their cutoff splice gives a parametrix on the joined neck. There is no tangential zero mode to match. Increasing the cutoff transition length makes its derivative error small, and exponential end decay controls the remaining splice error. A Neumann series therefore gives a right inverse on that complement, uniformly in sufficiently long necks. The gauge Laplacian has the same property. For an isolated matched cut configuration, index zero makes these operators invertible after the indicated gauge fixing and cuts. The contraction theorem corrects the pregluing uniquely; with a nonzero matched tangent space it gives the asserted smooth local chart. Conversely, exponential end estimates put any converging solution in this slice and in the contraction neighborhood, giving exhaustion. These are the gapped irreducible gluing estimates of ordinary instanton Floer theory #cite(label("DonaldsonKronheimer1990")) #cite(label("Donaldson2002")).
  The center ${ plus.minus 1 }$ acts trivially on the adjoint data and extends over either piece, so its two representatives do not give two matches. The only permitted matching isomorphisms preserve the fixed determinant transition. Pairing adjacent end orientation lines in cobordism order gives the asserted orientation. In the cap applications of Section 4 all cut degrees are even. The asymptotic cut data have the decay required by the same parametrix. This argument is for irreducible matches; it does not use the auxiliary reducible-cap hypothesis of Lemma 14. ◻
]

The analytic input at an $S^1 times S^2$ neck differs from that at a rational sphere. In particular its central flat is not a smooth endpoint of a one-dimensional slice. We retain its three harmonic coordinates until the gauge quotient is taken.

#thm([Lemma 2.11.])[
  (Decay with harmonic flat modes).  #emph[Give $L = S^1 times S^2$ the product metric, and let $alpha$ be a flat connection with parallel stabilizer $H$. On a sufficiently small-energy neck, modulo gauge, the spatial field has the form 
#[#set math.equation(numbering: n => "(2.10)")
 $ a \( t \) = alpha + h \( t \) theta.alt + b \( t \) \, quad h \( t \) in H_alpha^0 \( L \; "ad" \) \, quad b \( t \) perp H_alpha^1 \( L \; "ad" \) \, quad d_alpha^(*) b \( t \) = 0 . $ <eq:ordinary:harmonic-slice>]

 Here $theta.alt$ is the circle one-form and the temporal component has zero parallel part. For $\[ - T \, T \]$ and any sufficiently small fixed decay rate $delta > 0$, the normal part satisfies estimates of the form 
#[#set math.equation(numbering: n => "(2.11)")
 $ parallel b \( t \) parallel_k lt.eq C_k #scale(x: 120%, y: 120%)[\(] B_(-) e^(- delta \( t + T \)) + B_(+) e^(- delta \( T - t \)) #scale(x: 120%, y: 120%)[\)] + C_k integral_(- T)^T e^(- delta \| t - s \|) rho_k \( s \) thin d s \, $ <eq:ordinary:normal-decay>]

 where $B_plus.minus$ measure the end-strip normal data and $rho_k$ is the decreasing perturbation or background error. The derivative of $h$ is bounded by the same normal size and error. Its total drift is therefore bounded independently of $T$, and on middle strips the field is exponentially close to a single, possibly varying, middle flat.]
  #emph[These assertions include a central $alpha$, in whose fixed slice $h$ has three real coordinates. They give matching up to $H$, exponential convergence on completed ends, and convergence of holonomies uniformly over compact smooth families of bounded paths on the relevant strips. At isolated lens flats the same assertions hold with no harmonic spatial term.]
] <lem:ordinary:neck-decay>

#proof[
  For a product metric the harmonic one-forms are exactly $h theta.alt$, with $h$ parallel. Since $theta.alt and theta.alt = 0$, every $alpha + h theta.alt$ in this slice is an actual flat connection, including at a central $alpha$. The residual parallel group acts by conjugation on $h$. Time-dependent parallel rotations remove the parallel part of the temporal connection.
  The slice equation determines the remaining temporal component $phi$ by $d_alpha^(*) d_a$ on the orthogonal complement of parallel sections. This operator remains invertible for small $h \, b$, and its right-hand side vanishes when $b = 0$. Its estimates therefore have the form $parallel phi parallel_(k + 1) lt.eq C_k epsilon.alt parallel b parallel_k + C_k rho_k$ after shrinking the slice. Projecting the ASD equation to the co-closed normal space gives
  $ \( partial_t + K_alpha \) b = cal(R) \, #h(2em) K_alpha = * d_alpha \, #h(2em) parallel cal(R) parallel_k lt.eq C_k epsilon.alt parallel b parallel_k + C_k rho_k . $
  There is no forcing from a pure harmonic field. Projection to harmonic forms gives the analogous bound for $\| dot(h) \|$.
  On the normal space $K_alpha$ is self-adjoint with a spectral gap. Propagate its positive spectral part from the left and its negative part from the right. The resulting Green kernels are bounded by $C e^(- lambda \| t - s \|)$ for a gap $lambda > 0$. Convolution with these kernels and absorption of $C epsilon.alt parallel b parallel$ in a weight $delta < lambda$ prove (2.11). Interior elliptic estimates give the higher derivative versions. Integration of the harmonic derivative gives a bound by $C epsilon.alt \( B_(-) + B_(+) \) + C integral rho$, with no factor $T$. Integrating only between a middle strip and $t = 0$ gives the exponential closeness to $alpha + h \( 0 \) theta.alt$ claimed in the statement.
  To justify using one slice along a long small-energy stretch, start near a cluster flat on a middle strip. Local compactness places every boundary strip of a maximal slice interval close to some flat. The normal estimate and the length-independent harmonic drift bound keep the solution inside a slightly larger fixed slice until a strip leaves the small-energy regime. Shrinking the energy threshold first excludes such an exit in the stretches under discussion. This also avoids changing a three-dimensional central slice into a one-dimensional noncentral slice during the argument.
  Any remaining non-small stretch produces a nonconstant level or a particle by ordinary compactness. The collar charge on $S^1 times S^2$ is integral because Chern–Simons is constant on its connected flat space, so a nonflat level costs at least one charge. After the finitely many possible losses have been extracted, the preceding estimates apply to all remaining stretches. Smooth convergence on strips implies the holonomy assertion by the transport ODE and uniform bounds on the chosen path family. For a lens flat $h^1 = 0$, and the same proof uses only the gapped normal operator. ◻
]

#thm([Lemma 2.12.])[
  (Regular matching at an auxiliary reducible end).  #emph[Suppose two completed ordinary pieces meet at one of the auxiliary flats above. Assume that one piece is a cap whose parallel stabilizer is the whole matching group $H$; it has one matching end, and its other end conditions, if present, are decaying. Assume that the connection on the other piece is irreducible; prescribed unglued true-end asymptotes are also irreducible. Frame the cap at the matching end and leave the other piece unframed. Suppose the matched half-problem, including all flat parameters, metric parameters and cuts, is isolated and transverse. Then for all sufficiently long necks each such match gives exactly one solution modulo determinant-one gauge. Every convergent solution sufficiently close to this broken configuration arises in this way. The regular operators and gauge-fixing operators have inverses with at most polynomial growth in neck length.]
  #emph[The assertion also holds for successive removal of pendant caps in a tree of regular cuts, provided each removal satisfies these hypotheses with compatible data. Orientations are the determinant-line gluing orientations; there is no factor from ordering a splitting, from the central subgroup ${ 1 \, - 1 }$, or from additional projective gauge twists.]
] <lem:ordinary:regular-gluing>

#proof[
  Preglue the halves with their common flat. By Lemma 13, the equation and cut errors are exponentially small. The gauge-augmented linearization on each half has bounded extended kernel fields whose limits consist of a parallel temporal mode and a harmonic spatial variation. All normal remainders decay exponentially.
  The square operator on the finite glued manifold, with its true ends completed, is
  $ D_T : W_delta^(k + 1 \, q) \( Omega^1 \( "ad" E \) \) xor bb(R)^(p + a) arrow.r W_delta^(k \, q) \( Omega^0 \( "ad" E \) xor Omega^(+) \( "ad" E \) \) xor bb(R)^b . $
  Here $q > 4$, positive weights occur only at the fixed true ends, $p$ counts metric parameters, $a$ counts cut marks, and $b$ is the cut codimension. The gauge row is $d_A^(*)$. The irreducible core eliminates a global infinitesimal stabilizer. Index addition gives
  $ "ind" D_T = i_N^(upright("fix")) + i_V^(upright("fix")) + h^0 + h^1 + p + a - b = 0 \, $
  the last equality being isolated regularity of the matched problem. Indeed varying both flat slices adds $2 h^1$, matching subtracts $h^1$, and framing the cap adds $h^0$. At a central $L$ flat, both $h^0$ and $h^1$ are three, so all three spatial matching equations are retained. This index-zero assertion concerns the full finite operator. The cap’s decaying augmented operator can still have the parallel scalar cokernel of its gauge row, even when its physical framed problem is regular. Extended temporal modes and the following flux calculation account for that cokernel; framing alone does not remove it.
  We first identify the zero modes in the matched kernel. On the stabilizer cap integrate the linearized gauge-slice equation against a globally parallel stabilizer section $xi$. If $a = tau thin d t + beta + o \( 1 \)$, with $tau in H_alpha^0$ and $beta in H_alpha^1$, integration on a truncation $N_R$ gives
  $ 0 = integral_(N_R) chevron.l d_A^(*) a \, xi chevron.r = - integral_(L_R) chevron.l a \( nu \) \, xi chevron.r + o \( 1 \) . $
  There is one possible nondecaying boundary flux; all other end terms tend to zero. Global parallel sections restrict onto the whole end stabilizer, so the limit forces $chevron.l tau \, xi_oo chevron.r = 0$ for every $xi_oo$, and hence $tau = 0$. The spatial mode $beta$ has no normal contraction. The same argument kills all three temporal modes at a central flat. Although framing restricts the allowed cap gauges, the parallel sections remain legitimate test sections in this integration identity. Temporal matching gives the same conclusion on the other half. The remaining spatial flat modes, field variations, parameters and cut variations solve exactly the matched half linearization. Its kernel is zero by the isolated transversality hypothesis. A residual infinitesimal gauge in augmented gauge is also zero: integration of its gauge Laplacian gives its covariant derivative norm, with zero end terms. At true irreducible ends use decaying gauge parameters.
  Here is a useful quantitative version of this argument. Use a uniform local norm, the supremum of the elliptic norms on unit strips, together with the finite parameter norm and the fixed positive outer-end weights. If no polynomial lower bound held, one could find unit-norm fields and parameters on necks of length $2 T$ with linearized residual $o \( T^(- 1) \)$ (and, if necessary, smaller than any fixed inverse power for higher-order norms). Their limits on the two halves solve the homogeneous half equations. Projection to the neck zero modes shows that their derivatives are $o \( T^(- 1) \)$ plus the exponentially decreasing normal tails. More explicitly, writing $z_T$ for that projection, between distances $R$ from the two neck ends one has
  $ \| z_T \( T - R \) - z_T \( - T + R \) \| lt.eq C T parallel D_T x_T parallel_(upright("uloc")) + C e^(- delta R) . $
  First let $T$ and then $R$ tend to infinity. Thus the two limiting constants agree. The previous paragraph makes both half limits and all parameters zero. A remaining unit norm translating down the neck would limit to a bounded homogeneous full-cylinder solution. The spectral gap leaves only a zero mode, but its value is already zero by the same matching estimate. This contradicts local elliptic compactness. In particular a mode of amplitude one spread over a neck, whose derivative is of order $T^(- 1)$, cannot invalidate the argument: it is excluded by the stated residual bound in the uniform local norm.
  The full operator has index zero, so this lower bound implies injectivity and hence surjectivity, giving an inverse with polynomial norm. Equivalently one constructs its right inverse from the inverses on the matched half spaces and the finite-dimensional neck zero modes. The gauge Laplacian has the same polynomial bound by the long-cylinder Poincaré estimate and the irreducible core on the other side. Exponential pregluing errors dominate these polynomial losses, so the contraction theorem produces one solution in a shrinking slice neighborhood.
  For exhaustion, a convergent sequence has, on its middle strips, an exponentially close #emph[variable] flat, by Lemma 13. Cut using that same flat on both halves. In weak positive weights on the normal remainders, and the ordinary norm on the flat parameter, the half data converge and have exponentially small equation and matching errors. The injective regular half linearization improves this closeness modulo gauge to exponential closeness. Hence the sequence lies in the uniqueness neighborhood just constructed. At a central flat the allowed stabilizer rotation acts on the small harmonic variation as well as on the frame.
  For the stated tree, remove the pendant stabilizer caps in the specified order and use product gluing. At each removal the flux argument has just one nondecaying cap end; this is stronger than merely assuming that the cut graph has no cycles. The cap stabilizer absorbs the matching $H$-rotations. The central gauge subgroup is already part of the gauge quotient, and the fixed determinant transitions do not permit summing over nonliftable $"SO" \( 3 \)$ twists. A change of integral framing degree changes the relative charge and hence the actual index; it belongs to a different sector, not to an additional copy of the same zero-dimensional match. Finally the usual APS/Floer determinant-line identifications, associative under these gluings, give the stated integral orientations. ◻
]

=== 2.5 Cap shifts and primary-face exclusions <cap-shifts-and-primary-face-exclusions>

#thm([Lemma 2.13.])[
  (The elementary cap shifts).  #emph[The isolated exceptional-sphere faces of the single-step pentagons contribute at least two indices relative to a flat-ball filling. The $M_14$ face of the compressed pentagon has the same lower bound. The odd-determinant $\( - 2 \)$-disk-bundle cap at $M_02$ has a unique projective boundary flat class, of trace zero and $\( h^0 \, h^1 \) = \( 1 \, 0 \)$, and its relative contribution including matching is 
#[#set math.equation(numbering: n => "(2.12)")
 $ delta = 8 \( E - 1 / 8 \) \, #h(2em) E in 1 / 8 + bb(Z) . $ <eq:ordinary:minus-two-shift>]

 At $E = 1 \/ 8$ its only generic framed zero-dimensional match is the harmonic reducible, with multiplicity one. The two determinant choices at this face have identical exterior data and cancel modulo two.]
] <lem:ordinary:cap-shifts>

#proof[
  For a split bundle write $d$ for the difference of the summand classes. Its trace-free charge is $- d^2 \/ 4$. On an odd exceptional sphere the least such square is $- 1$, so $E in 1 \/ 4 + bb(Z)$ and its nonnegative minimum is $1 \/ 4$. The exceptional disk bundle and the flat ball have the same $chi + sigma = 1$. Equation (2.3), including the separating $S^3$ matching, therefore gives the shift $8 E gt.eq 2$.
  The $M_14$ chain has matrix and inverse
  $ Q = mat(delim: "(", - 1, 1; 1, - 2) \, #h(2em) Q^(- 1) = mat(delim: "(", - 2, - 1; - 1, - 1) . $
  Its two determinant evaluation vectors are $\( - 1 \, 1 \)$ and $\( 0 \, 1 \)$; both have square $- 1$. The cap is unimodular, its link is $S^3$, and again $chi + sigma = 1$. Consequently $E in 1 \/ 4 + bb(Z)$ and the same shift is at least two.
  For the $\( - 2 \)$ disk bundle an odd difference evaluates to one on the section and has square $- 1 \/ 2$, giving reference charge $1 \/ 8$. Its boundary is $bb(R P)^3$. The projective flat representation with this determinant obstruction is represented, after square-root normalization, by $"diag" \( i \, - i \)$ on its generator; it is the unique such class. Its stabilizer is a torus and $h^1 = 0$.
  To count the charge-$1 \/ 8$ cap, we first show that its framed normal index is zero. Compactify the resolution to the ruled surface $bb(F)_2$ and contract its exceptional section to obtain $bb(P) \( 1 \, 1 \, 2 \)$. Let $T$ be a fiber class on $bb(F)_2$. It has degree one on the exceptional section and corresponds to $cal(O) \( 1 \)$ on the common smooth complement. The real off-diagonal ASD symbol is complex; on a closed Kähler surface its complex index is $- chi \( cal(O) \( T \) \) - chi \( cal(O) \( - T \) \)$. On $bb(F)_2$ these fiber twists are pullbacks of $cal(O) \( 1 \) \, cal(O) \( - 1 \)$ on the base, with no higher direct image, giving Euler characteristics $2 \, 0$. On $bb(P) \( 1 \, 1 \, 2 \)$ the weight-one monomials give $h^0 \( cal(O) \( 1 \) \) = 2$. The monomial decomposition of the three-coordinate Čech complex has no degree-one cohomology, and its degree-two cohomology is dual to weighted polynomials of degree $- k - 4$ for $cal(O) \( k \)$. For $k = 1 \, - 1$ these spaces vanish. Thus there is no higher cohomology for $cal(O) \( 1 \)$ and no cohomology for $cal(O) \( - 1 \)$. Thus its two Euler characteristics are also $2 \, 0$. Excision on their common complex bundle complement has zero normal index difference. The cone ball has framed index zero, as follows from the flat-ball operator restricted to the invariant fields, so the framed normal index on the resolution cap is zero. Equivalently, the invariant flat-ball complex has no harmonic one-forms or self-dual two-forms, and framing removes its parallel gauge contribution. The tangential framed operator has index zero and no kernel or cokernel because $H^1 = b^(+) = 0$. Unframing subtracts its one-dimensional stabilizer, and matching adds that dimension back. This gives zero total shift at $1 \/ 8$. All other relative sectors change charge by an integer and index by eight, proving (2.12). The complement identifications here are complex bundle identifications; matching just real Chern forms would not suffice for this index excision.
  At the reference charge the tangential harmonic solution is unique. Lemma 10 makes the index-zero complex normal operator invertible without changing that solution. A framed irreducible would carry a positive dimensional orbit of the boundary torus, contradicting a regular zero-dimensional framed count. Additional levels or particles would increase charge and are unavailable at the minimum. Finally adding $"PD" \( S_l \)$ changes the determinant evaluation by $- 2$ on this cap, hence is tensoring by a line of degree $- 1$. This tensor operation preserves the adjoint equation, and its order-two action at the boundary preserves the trace-zero class. Choose tensor-related cap perturbations and the same exterior perturbations. The two minimum contributions then agree and cancel over $bb(F)_2$. ◻
]

#thm([Lemma 2.14.])[
  (The primary central-group estimate).  #emph[In a broken ordinary configuration, let a maximal consecutive group consist of $q$ reducible pieces or levels with only central rational contacts. Suppose its pieces have $b_1 = 0$, and denote by $b_(upright("group"))^(+)$ the sum of their positive ranks. Its index contribution, including all internal matches and its two exterior central matches, is at least 
#[#set math.equation(numbering: n => "(2.13)")
 $ 3 \( 1 - b_(upright("group"))^(+) \) . $ <eq:ordinary:group-cost>]

 In particular this contribution is at least three when the group has positive rank zero. A direct central match between two irreducible pieces adds three. The estimate remains valid when the isolated minimum odd $\( - 2 \)$ cap is virtually filled by its reference cap.]
] <lem:ordinary:central-cost>

#proof[
  Apply (2.2) to every group member and use its nonnegative charge. Their total is at least $- 3 q - 3 b_(upright("group"))^(+)$. There are $q - 1$ internal contacts and two exterior contacts, each contributing three. Adding them gives (2.13). Direct matching uses the same stabilizer dimension. For a group reaching a prescribed irreducible true end, the exterior contact is realized by a nonconstant trajectory from the central state to that irreducible; this trajectory is not included in the group and has index at least one. No reducer can meet the admissible end $Y_0$. The last assertion follows from the zero framed shift of the reference filling in (2.12); its removal changes neither the exterior index convention nor the lower bound. ◻
]

#thm([Lemma 2.15.])[
  (Compactifications in the unit dimensions).  #emph[For the rigid maps, intervals and pentagons above, all moduli spaces needed in dimensions zero and one have no particles and no unwanted central contacts at primary cuts or true ends. Primary $S^3$ faces are empty. Exceptional-sphere faces and the $M_14$ face are empty in these dimensions. The only possible contribution at the compressed $M_02$ face is the paired minimum contribution of Lemma 15, away from the corners. All other primary boundary strata are ordinary chain breakings or the stated compositions.]
] <lem:ordinary:low-dimensional-compactness>

#proof[
  The positive subspaces of split main pieces inject orthogonally into the unsplit form, so their total positive rank is at most one. If $p'$ parameters remain on irreducible pieces, their total index is at least $- p'$ by regularity. We now check each possible number of primary cuts; this avoids supposing that a non-admissible primary face behaves like an admissible one.
  For a single rigid $b^(+) = 0$ map every forbidden central group has the surplus three in Lemma 16. The chain dimensions are zero and one, so the surplus excludes it. The same argument permits an ordinary one-parameter continuation and stretching the middle of $f_(+)$: even subtracting that one parameter leaves a surplus two.
  For an interval $p = 1$ the relevant indices are $- 1 \, 0$; for a pentagon $p = 2$ they are $- 2 \, - 1$. With no primary cut, a central group of positive rank zero costs at least three, leaving a lower total index $3 - p$ and hence exceeding the required indices. If a central group uses the available positive rank, it must contain the whole uncut cobordism piece: a group confined to true-end cylinder levels has positive rank zero. It then requires two nonconstant irreducible end trajectories. They cost at least two in total; there is no irreducible cobordism piece from which to subtract the metric parameter count.
  At one primary cut a group using the positive rank contains a main piece incident to at least one true end and hence requires at least one such trajectory. At most $p - 1$ parameters remain on the other pieces. Its total is therefore at least $1 - \( p - 1 \)$, which is positive for the interval and at least zero for the pentagon. Both exceed the needed boundary indices. Other central groups again have surplus three. At two primary cuts of a pentagon no metric parameters remain. Every group contribution is nonnegative and every irreducible piece has nonnegative index, whereas the boundary problem has index $- 1$. This excludes its central configurations as well. Since $S^3$ has no irreducible generator, its primary faces are empty in all these cases.
  For an exceptional or $M_14$ cap, virtual filling leaves the preceding nonnegative group bounds and adds at least two indices. At most one parameter remains on the other pieces of a pentagon face, and none on an interval face. Thus these faces cannot occur. At $M_02$ the minimum reference filling has shift zero. It can occur at a rigid exterior parameter, as in Lemma 15; its corners impose the additional parameter loss and are excluded by the same primary and exceptional bounds. A higher sector there adds at least eight indices.
  For completeness, particle positions do not defeat these inequalities. A lost charge $q gt.eq 1$ lowers field index by $8 q$ and supplies at most $4 q$ position parameters. Thus the dimension of an ideal stratum is at most the unbroken expected dimension minus $4 q$, before any additional face loss. It is negative in dimensions at most one. If a graph perturbation or auxiliary evaluation is disabled by the particle, retain its position as a parameter and use the componentwise variations of Lemma 10; no insertion of positive degree occurs in these unit families to restore the lost dimension. The same argument applies to particles on levels. Charge discreteness and the bounded gradient energy identity prevent accumulation of further nonconstant levels.
  Consequently regular compactness leaves precisely the ordinary irreducible chain breaks and the stated compositions. Notice that reducible main components joining two nondecaying primary ends have been #emph[excluded] here by dimension. We never apply Lemma 14 to such a component; all its stabilizer absorbers in the following counts are single-ended auxiliary caps. ◻
]

=== 2.6 The hard cap and its restriction degree <the-hard-cap-and-its-restriction-degree>

At the remaining outer face, replacing the sphere chain by $S^1 times D^3$ leaves an identity cylinder. We will show that its exterior contributes the continuation map and that the original cap supplies an odd number of matches with each generic noncentral boundary flat, summed over the two determinants in the compressed case.

#thm([Lemma 2.16.])[
  (Flat replacement and the continuation exterior).  #emph[At the outer cut $M_03$ of a single-step pentagon, or $M_04$ of the compressed pentagon, write $N$ for the sphere-chain cap and $V$ for its exterior. Replace $N$ by $D = S^1 times D^3$, keeping the determinant transitions fixed. The filled cobordism is the appropriate identity cylinder, possibly with a fixed change of end identification. If $i_(upright("filled"))$ denotes its index, then 
#[#set math.equation(numbering: n => "(2.14)")
 $ i_(upright("total")) = i_(upright("filled")) + 8 E_N - 3 \, #h(2em) i_(upright("filled")) = i_V^(upright("fix")) + h^1 \, #h(2em) E_N in 1 / 4 + bb(Z) . $ <eq:ordinary:hard-index>]

 For the pentagon boundary problem $i_(upright("total")) = - 1$, the only possible exterior is regular and irreducible, has $i_(upright("filled")) = 0$, and has a noncentral boundary flat. Necessarily $E_N = 1 \/ 4$. Its count with the flat replacement cap is the continuation isomorphism.]
] <lem:ordinary:flat-replacement>

#proof[
  Both chain determinants annihilate their primitive radical, so restrict trivially to $L$ and extend over $D$. The last assertion of Lemma 7 identifies the filled cobordism. Leave the replacement cap unperturbed. A flat on $L$ extends uniquely to $D$ with its chosen boundary representative: both fundamental groups are generated by the same circle. Its fixed-limit unframed index is $- h^0$. After framing it has a regular family of flats mapping identically to the boundary flat slice. Thus fixed-limit addition gives $i_V^(upright("fix")) - h^0 + \( h^0 + h^1 \) = i_V^(upright("fix")) + h^1$.
  For the two-sphere chain $chi \( N \) = 3$, $sigma \( N \) = - 1$; for the three-sphere chain $chi \( N \) = 4$, $sigma \( N \) = - 2$. In both cases $chi \( N \) + sigma \( N \) = 2$, whereas $chi \( D \) + sigma \( D \) = 0$. Excision therefore gives the first identity of (2.14). The split reference differences in the two caps have square $- 1$, as computed explicitly in Lemma 19 below. Their charge is $1 \/ 4$. Chern–Simons is constant on the flat space of $L$, and fixing the determinant and relative transitions makes changes of the remaining bundle degree integral. Hence $E_N in 1 \/ 4 + bb(Z)$, including charge on extracted hard-neck levels. Nonnegativity gives $E_N = 1 \/ 4 + k$ with $k gt.eq 0$. At total index $- 1$, (2.14) becomes $i_(upright("filled")) = - 8 k$.
  The exterior has no remaining metric parameter; the one parameter on this face belongs to the cap. Its moduli space with variable asymptote therefore has dimension $i_V^(upright("fix")) + h^1 = i_(upright("filled"))$. The virtual filling has positive rank zero, so Lemma 16 excludes true central breaks there; an admissible end also excludes reducibles. A central $L$-restriction imposes the full three conditions of Lemma 10. Thus generic data leave only regular irreducibles of dimension zero, with a noncentral restriction, and force $k = 0$.
  To identify their count, stretch the same $L$ neck in the filled cylinder. A nonflat $D$-side sector or collar level costs at least one integral charge, lowering the remaining regular index by eight. Particles are excluded by the same index loss. The only limiting replacement fields are therefore the regular flat family on $D$ just described. Lemma 14 applies: the global parallel stabilizer on $D$ is the entire end stabilizer, and $D$ has one matching end. Its unique gluing identifies this count with the usual continuation count. Continuation is a chain homotopy equivalence over $bb(Z)$ with coherent orientations. A fixed tensor or collar identification can compose it with an automorphism, which is still an isomorphism. In the compressed pentagon the exterior and its data are common to the two determinant choices. ◻
]

#thm([Lemma 2.17.])[
  (Minimum-charge harmonic caps).  #emph[Let $N$ be either hard cap of Lemma 9, with one of its specified determinants $c$. At charge $1 \/ 4$ the only possible unordered split difference is ${ c \, - c }$. For each metric of its cap interval there is a unique Abelian ASD connection modulo gauge with the ordered difference $d = c$, allowing the boundary flat to vary. These connections form a harmonic path.]
  #emph[At a fixed noncentral boundary flat the cap index is $- 2$. Its tangential unframed index is $- 2$ and its complex normal index is zero. If a noncentral exterior angle is a transverse value of the harmonic path, the framed cap with its one metric parameter has one regular contribution at each crossing. There is no second contribution from exchanging its summands or from a residual boundary framing.]
] <lem:ordinary:harmonic-caps>

#proof[
  For the chain $\[ - 1 \, - 1 \]$ a class annihilating the radical has evaluations $\( a \, - a \)$ and square $- a^2$. The determinant parity makes $a$ odd, so charge $1 \/ 4$ forces $a = plus.minus 1$. For $\[ - 2 \, - 1 \, - 2 \]$, write the difference evaluations as $\( d_l \, d_m \, d_r \)$. The radical condition and square are
  #[#set math.equation(numbering: n => "(2.15)")
   $ d_l + 2 d_m + d_r = 0 \, #h(2em) - d^2 / 4 = frac(d_l^2 + d_r^2, 8) . $ <eq:ordinary:three-chain-charge>]
  The first and last evaluations are odd. Charge $1 \/ 4$ forces $d_l \, d_r in { 1 \, - 1 }$. When $e = 0$, $d_m$ is odd, so $d_l = d_r$ and the possibilities are $plus.minus \( 1 \, - 1 \, 1 \)$. When $e = 1$, $d_m$ is even, so $d_l = - d_r$ and the possibilities are $plus.minus \( - 1 \, 0 \, 1 \)$. This proves both the uniqueness assertion and $c^2 = - 1$.
  The class $d$ restricts trivially in real cohomology to $L$, hence lies in the image of compactly supported cohomology. Cylindrical-end Abelian Hodge theory gives its $L^2$ harmonic representative. The intersection form on this image is negative definite and $b^(+) = 0$, so that representative is anti-self-dual. Integrating it gives an Abelian connection with the prescribed integral summand class; its limiting flat is determined by this connection. The fixed determinant supplies the other summand. There is no missing self-dual obstruction when the harmonic boundary parameter is allowed to vary.
  For uniqueness, the difference of two such curvatures is exact, anti-self-dual, and decays. Stokes’ theorem on long truncations gives zero for its square; the flat limiting difference contributes no boundary curvature. An anti-self-dual exact difference of square zero vanishes. The plumbing has $H^1 \( N \; bb(R) \) = 0$ and is simply connected, so a remaining flat difference of line connections is gauge. Smooth dependence of the inverse Abelian operator on the metric produces the harmonic path. The same argument supplies the uniqueness of the minimum odd $\( - 2 \)$ reference used in Lemma 15.
  At a noncentral flat the replacement cap has index $- 1$. Its difference from $N$ is $8 \( 1 \/ 4 \) - 3 = - 1$, so the fixed cap index is $- 2$. In the diagonal scalar complex there is one parallel stabilizer and one boundary-flux obstruction when the flat is fixed; $H^1 \( N \) = b^(+) \( N \) = 0$ leaves no other tangential kernel or obstruction. Thus the tangential index is $- 2$. Subtracting it from the full real index leaves zero, so the complex normal index is zero. Framing restores one real dimension; a transverse metric crossing of the prescribed flat removes the remaining flux obstruction. Derivative variations from Lemma 10 make the complex normal operator invertible while leaving the harmonic path fixed. This gives a regular zero-dimensional framed cap problem. A putative irreducible cap, unframed and at this fixed angle, would have expected dimension $- 2 + 1 = - 1$ and is absent for generic data.
  An unordered splitting is counted once. Choose $d = c$ to order its two lines. At a fixed noncentral boundary representative its actual normalized eigenvalue, not merely its conjugacy class, prescribes which boundary eigenline is assigned to this ordered line. Swapping both lines describes the same unordered connection and does not create a new boundary choice. The parallel torus of the split cap absorbs all matching rotations. This is exactly the single-ended stabilizer situation of Lemma 14, so there is no additional multiplicity. ◻
]

#thm([Lemma 2.18.])[
  (Normalized eigenholonomy and the odd restriction degree).  #emph[For the $\[ - 1 \, - 1 \]$ cap, the harmonic path has odd mod-two intersection number with every generic noncentral conjugacy class of boundary flats. For the $\[ - 2 \, - 1 \, - 2 \]$ cap the sum of those intersection numbers over the two determinant choices is odd.]
] <lem:ordinary:holonomy-degree>

#proof[
  Let $beta$ generate the free circle of $L$, and choose an integral spanning surface or chain $Delta$ for $beta$ in $N$. Fix the determinant trivialization $tau$ at $L$, compatible throughout the family. With curvature normalized to integral periods, Abelian Stokes’ theorem for the ordered line of difference $d$ gives its normalized eigenholonomy as
  #[#set math.equation(numbering: n => "(2.16)")
   $ u \( d \, c \) = \( - 1 \)^(chevron.l c \, \( Delta \, tau \) chevron.r) exp (pi i integral_Delta d_(upright("harm"))) \, $ <eq:ordinary:eigenholonomy>]
  up to inversion. Indeed the ordered summand curvature is $\( F_det + d_(upright("harm")) \) \/ 2$. Exponentiating its integral over $Delta$ gives the exponential in (2.16); the relative integral of $F_det$ gives the displayed half-determinant sign. The sign cannot be discarded when determinants are compared. Inversion changes the ordering but not the conjugacy class or the mod-two degree.
  The primitive radical is the image of the boundary sphere by Lemma 7. Boundary duality says that a spanning chain of the free boundary circle pairs once, up to sign, with that sphere. Consequently
  #[#set math.equation(numbering: n => "(2.17)")
   $ Delta dot.op \( P_1 + P_2 \) = 1 med \( mod med 2 \) quad upright("or") quad Delta dot.op \( S_l + 2 T_1 + R \) = 1 med \( mod med 2 \) \, $ <eq:ordinary:radical-pairing>]
  as appropriate.
  We justify the curvature localizations used at the ends of the harmonic paths. Across a rational plumbing link there are no real harmonic one-forms. The linear version of the gapped estimate in Lemma 13 gives exponential decay for the harmonic curvature on the stretched collar. Hodge compactness on the fixed cores and uniqueness of the harmonic representative identify its limits with the prescribed piecewise representatives. Their tail integrals tend to zero. Extending compactly supported representatives by zero therefore computes the limiting integral over $Delta$ by its relative intersection pairing. This is a linear Hodge calculation; it does not require nonlinear gluing at a higher-energy stratum.
  For $\[ - 1 \, - 1 \]$, the two ends isolate the exceptional spheres $P_1$ and $P_2$. For the same ordered difference $c = \( 1 \, - 1 \)$ their limiting localized representatives are respectively $- "PD" \( P_1 \)$ and $"PD" \( P_2 \)$. Each yields a central boundary value, because its integral over $Delta$ is integral. Their quotient in (2.16) is $\( - 1 \)^(Delta dot.op \( P_1 + P_2 \)) = - 1$ by (2.17). The two endpoints are therefore the opposite central values.
  For $\[ - 2 \, - 1 \, - 2 \]$, first consider the end isolating $S_l$, with cap $B = nu S_l$ and rational link $Q = partial B = bb(R P)^3$. Let $p$ be the integral relative Thom class of $S_l$, represented by the line $cal(O) \( S_l \)$ with its canonical nonzero section $s$ off $S_l$. For the determinant lines choose $D_1 = D_0 ⊗ cal(O) \( S_l \)$ and $tau_1 = tau_0 ⊗ s \|_L$, as required by the fixed outside identification. Thus their relative first Chern classes differ by $p$, not by an unspecified lift of its absolute class. In particular the two half-determinant signs differ by $\( - 1 \)^k$, where $k = chevron.l p \, \[ Delta \] chevron.r = Delta dot.op S_l$.
  The common remaining curvature can be seen explicitly. In rational cohomology put $w = c_0 + p \/ 2$. Then
  $ p^2 = - 2 \, #h(2em) c_0 dot.op p = 1 \, #h(2em) w dot.op p = 0 \, #h(2em) w^2 = - 1 / 2 \, #h(2em) c_e = w + \( e - 1 / 2 \) p . $
  Under the $Q$ stretch, linear Hodge splitting localizes $plus.minus p \/ 2$ on $B$ and the same class $w$ on the complement. Each part has charge $1 \/ 8$. Only the #emph[difference] of the two harmonic curvatures localizes entirely on $B$. Its limit there is the harmonic representative of $p$, and its limit on the complement is zero. A compact Thom representative and this harmonic representative differ by an exact form whose primitive decays modulo an exact boundary form, since $H^1 \( Q \; bb(R) \) = 0$. Split $Delta$ across $Q$ and apply Stokes’ theorem; the neck tails have vanishing integrals. Consequently the integral over $Delta$ of the harmonic difference tends to $k$. The exponential factor in (2.16) therefore changes by $exp \( pi i k \) = \( - 1 \)^k$, cancelling the relative determinant sign. Thus the two paths have the same boundary value at this end; that common value need not be central.
  At the other end the unimodular cap on $T_1 \, R$ carries the entire charge. Its two localized differences are
  #[#set math.equation(numbering: n => "(2.18)")
   $ d_0 = "PD" \( T_1 \) \, #h(2em) d_1 = - "PD" \( T_1 \) - "PD" \( R \) . $ <eq:ordinary:unimodular-localization>]
  The evaluations of these classes on $S_l \, T_1 \, R$ are exactly (2.7). Choose $Delta$ to avoid this cap. This is possible because its separating link is $S^3$: van Kampen applied to the simply connected plumbing shows that the complement is simply connected, so $beta$ bounds there. The curvature integrals in (2.16) are now zero. Equation (2.17) reduces to $Delta dot.op S_l = 1 med \( mod med 2 \)$. Hence the determinant signs of the two paths differ by $- 1$. Their values at this end are the opposite central values.
  Identify the conjugacy space of flat $"SU" \( 2 \)$ connections on $L$ with the closed angle interval $\[ 0 \, pi \]$. Figure 2 records the endpoint data.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1, 1.9), [#text(size: 9pt)[$[-1,-1]$]])
  circle((0.3, 1.1), radius: 0.08481, stroke: (thickness: 0.4pt))
  content((0.3, 1.135), [$-1$], anchor: "south")
  content((0.3, 1.065), [$P_1$], anchor: "north")
  circle((1.7, 1.1), radius: 0.08481, stroke: (thickness: 0.4pt))
  content((1.7, 1.135), [$-1$], anchor: "south")
  content((1.7, 1.065), [$P_2$], anchor: "north")
  line((0.3, 1.1), (1.7, 1.1), stroke: (thickness: 0.4pt))
  content((4.2, 1.1), [#text(size: 9pt)[$0$]])
  content((7.5, 1.1), [#text(size: 9pt)[$pi$]])
  line((4.2, 1.1), (7.5, 1.1), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  content((5.85, 0.4), [#text(size: 9pt)[$P_1$ and $P_2$ isolations#linebreak()\(either order\)]])
  content((1, -0.6), [#text(size: 9pt)[$[-2,-1,-2]$]])
  circle((0, -1.4), radius: 0.08481, stroke: (thickness: 0.4pt))
  content((0, -1.365), [$-2$], anchor: "south")
  content((0, -1.435), [$S_l$], anchor: "north")
  circle((1, -1.4), radius: 0.08481, stroke: (thickness: 0.4pt))
  content((1, -1.365), [$-1$], anchor: "south")
  content((1, -1.435), [$T_1$], anchor: "north")
  circle((2, -1.4), radius: 0.08481, stroke: (thickness: 0.4pt))
  content((2, -1.365), [$-2$], anchor: "south")
  content((2, -1.435), [$R$], anchor: "north")
  line((0, -1.4), (1, -1.4), stroke: (thickness: 0.4pt))
  line((1, -1.4), (2, -1.4), stroke: (thickness: 0.4pt))
  content((4.2, -1.4), [#text(size: 9pt)[$theta_*$]])
  content((7.5, -0.95), [#text(size: 9pt)[$0$]])
  content((7.5, -1.85), [#text(size: 9pt)[$pi$]])
  line((4.2, -1.4), (7.5, -0.95), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((4.2, -1.4), (7.5, -1.85), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  content((4.2, -2.55), [#text(size: 9pt)[$S_l$ isolation]])
  content((7.5, -2.55), [#text(size: 9pt)[$T_1,R$ isolation]])
})],
    caption: [Figure 2: Cap chains and their harmonic-path endpoint values in the flat conjugacy interval. The two compressed paths share a value $theta_(*) in \[ 0 \, pi \]$ and end at opposite central values. The branches are not assigned determinant labels. Only the endpoint data are shown; no monotonicity of the paths is asserted. ],
  ) <fig:ordinary:cap-endpoints>
  The preimage parity of a generic interior angle under any path is determined by which side of that angle contains each endpoint. For the first cap its two endpoints are $0 \, pi$, so the parity is one. For the second cap the contributions of the common endpoint cancel between the two paths, while the other endpoints are $0 \, pi$; their total parity is again one. Choose the exterior angles away from the finitely many relevant limiting values and transverse to these paths. Such a choice is allowed by Lemma 10. Small normal regularizations preserving the Abelian paths do not change the parity. ◻
]

#thm([Lemma 2.19.])[
  (No additional ends of the minimum cap matches).  #emph[For a generic noncentral exterior angle, the cap matches counted in Lemmas 19 and 20 form a compact zero-dimensional set. The two types of cap-interval endpoint give no extra contribution. Gluing them to the continuation exterior gives exactly its count modulo two, summed over both determinants in the compressed case.]
] <lem:ordinary:cap-end-compactness>

#proof[
  At exceptional-sphere or unimodular-cap isolation, the isolated part already carries charge $1 \/ 4$. No charge remains on its complement. The limiting boundary angle is therefore one of the localized harmonic endpoint values computed in Lemma 20, and a generic exterior angle avoids it.
  At the $S_l$ isolation in the compressed case, the trace-zero $\( - 2 \)$ reference cap has its minimum charge. After filling that piece, the other part has fixed index $- 2$ and no parameter. It has no regular irreducible solution. A split solution extends through the traceless link by the unique minimum split filling and again has unordered difference ${ c_e \, - c_e }$ by Lemma 19. It therefore has the already computed common endpoint angle, also avoided by the exterior. Additional charge losses are impossible at total charge $1 \/ 4$; particles have integral positive charge, and collar levels between the same prescribed flat classes also have positive integral charge.
  All remaining matches occur at transverse interior angles. Their tangential and normal regularity and multiplicity one were proved in Lemma 19. The cap has one matching end and absorbs its full parallel stabilizer. Lemma 14 therefore both constructs all nearby solutions and exhausts every convergent sequence. The odd degree of Lemma 20 supplies one copy modulo two of each continuation exterior. No gluing at any excluded higher-energy cap or at a reducible main connector has been invoked. ◻
]

=== 2.7 Boundary identities and the bridge <boundary-identities-and-the-bridge>

#proof[
  First form the rigid maps on the two increasing steps. Their chain identities and the identification of the rigid count on $0 arrow.r 1 arrow.r 2$ with their composition follow from the $b^(+) = 0$ case of Lemma 17, the irreducible gluing of Lemma 12, and determinant-line orientations. All collars used in this comparison are fixed. Denote one single-step map by $u_r$.
  For its inverse comparison use both triples in (2.6). The complementary interval on $s arrow.r oo arrow.r r$ has no non-chain boundary: its $S^3$ endpoint is empty and its exceptional cap endpoint has shift at least two. Thus its index $- 1$ count is a chain map. The five faces of the two pentagons are as follows; the same labels refer to arcs in their respective ordered paths.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Face
], table.cell(rowspan: 1, colspan: 1)[$s \, oo \, r \, s$
], table.cell(rowspan: 1, colspan: 1)[$r \, s \, oo \, r$
]),
  table.cell(rowspan: 1, colspan: 1)[$Z_1$
], table.cell(rowspan: 1, colspan: 1)[empty $S^3$ split
], table.cell(rowspan: 1, colspan: 1)[composition across $Y_s$
],
  table.cell(rowspan: 1, colspan: 1)[$Z_2$
], table.cell(rowspan: 1, colspan: 1)[composition across $Y_r$
], table.cell(rowspan: 1, colspan: 1)[empty $S^3$ split
],
  table.cell(rowspan: 1, colspan: 1)[$M_02$
], table.cell(rowspan: 1, colspan: 1)[exceptional cap, empty
], table.cell(rowspan: 1, colspan: 1)[exceptional cap, empty
],
  table.cell(rowspan: 1, colspan: 1)[$M_13$
], table.cell(rowspan: 1, colspan: 1)[exceptional cap, empty
], table.cell(rowspan: 1, colspan: 1)[exceptional cap, empty
],
  table.cell(rowspan: 1, colspan: 1)[$M_03$
], table.cell(rowspan: 1, colspan: 1)[continuation on $Y_s$
], table.cell(rowspan: 1, colspan: 1)[continuation on $Y_r$
],
)
]
  Here the empty statements are precisely Lemma 17; the last row is Lemmas 18–21. No other face exists by Lemma 8.
  The compactified one-dimensional pentagon moduli spaces, of actual index $- 1$, consequently give, over $bb(F)_2$, chain homotopies of the form
  #[#set math.equation(numbering: n => "(2.19)")
   $ u_r h_1 tilde.eq J_s \, #h(2em) h_2 tilde(u)_r tilde.eq J_r \, $ <eq:ordinary:single-step-identities>]
  where $J_s \, J_r$ are continuation isomorphisms. The map $tilde(u)_r$ has the determinant induced by the second pentagon; it is tensor-equivalent to $u_r$, by Lemma 9. The first identity makes $u_r$ surjective on homology. The second makes $tilde(u)_r$ injective, and hence imposes the opposite inequality on the dimensions of the two finite-dimensional homology groups. They have equal dimension. Therefore $u_r$ is an isomorphism. This argument does not require the two complementary interval maps or their determinant transitions to be identical. Tensor equivalence also proves the assertion for every allowed single-step determinant. It follows that $f_(+) = u_1 u_0$ is a unit.
  Now use the paired interval on $2 arrow.r oo arrow.r 0$. Its $S^3$ endpoint is empty. At its other endpoint the two minimum trace-zero cap contributions agree and cancel modulo two by Lemma 15; every higher sector is excluded. The remaining ends are exactly the differential terms. Thus the paired index $- 1$ count $g_(+)$ is a chain map modulo two.
  The compressed pentagon on $2 \, oo \, 0 \, 1 \, 2$ has exactly the faces in (2.5). We record each term separately:
  #[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Face
], table.cell(rowspan: 1, colspan: 1)[Contribution to the paired count
]),
  table.cell(rowspan: 1, colspan: 1)[$Z_1$
], table.cell(rowspan: 1, colspan: 1)[empty primary $S^3$ split
],
  table.cell(rowspan: 1, colspan: 1)[$Z_2$
], table.cell(rowspan: 1, colspan: 1)[$f_(+) g_(+)$
],
  table.cell(rowspan: 1, colspan: 1)[$M_02$
], table.cell(rowspan: 1, colspan: 1)[equal trace-zero terms, cancelling modulo two
],
  table.cell(rowspan: 1, colspan: 1)[$M_14$
], table.cell(rowspan: 1, colspan: 1)[positive cap shift, empty
],
  table.cell(rowspan: 1, colspan: 1)[$M_04$
], table.cell(rowspan: 1, colspan: 1)[continuation $J_2$ by combined odd degree
],
)
]
  At the $M_04$ endpoints the only possible additional cap degenerations are $M_02$ and $M_14$, and Lemma 21 has already excluded them at a generic exterior angle. The compact one-dimensional paired pentagon count therefore gives
  #[#set math.equation(numbering: n => "(2.20)")
   $ f_(+) g_(+) tilde.eq J_2 #h(2em) upright("over ") bb(F)_2 . $ <eq:ordinary:two-step-identity>]
  Since $f_(+)$ and $J_2$ are isomorphisms, so is $g_(+)$.
  Apply the same constructions to the mirror knot and reverse the order of the ends, identifying the oppositely oriented three-manifolds. The ordinary counts dualize. Negating a determinant, or changing the sign of the flip sphere, changes the two choices by tensoring with lines, with the latter line canonically trivial off the sphere. Their prescribed restrictions are the ones in part (iii), and the mod-two unit argument is unchanged. This proves the claims for $f_(-)$ and $g_(-)$. ◻
]

#thm([Corollary 2.20.])[
  (The ordinary bridge).  #emph[Fix an orientation-preserving diffeomorphism $phi.alt : Y_(- 2) arrow.r Y_2$, with fixed bundle and collar identifications. The stacked cobordism and its rigid count 
#[#set math.equation(numbering: n => "(2.21)")
 $ T = f_(-) thin phi.alt^(- 1) thin f_(+) : Y_0 arrow.r Y_0 $ <eq:ordinary:bridge>]

 define an integral chain map inducing a unit over $bb(F)_2$ and an isomorphism over $bb(Q)$. The cobordism has 
#[#set math.equation(numbering: n => "(2.22)")
 $ H_1 \( T \; bb(Z) \) = 0 \, #h(2em) chi \( T \) = 4 \, #h(2em) sigma \( T \) = - 2 . $ <eq:ordinary:bridge-topology>]

 Its two increasing-handle halves are simply connected.]
] <cor:ordinary:bridge>

#proof[
  The maps $f_plus.minus$ have coherent integral orientations, and the fixed diffeomorphism induces an integral chain isomorphism. Stretching their rational seams introduces only $b^(+) = 0$ primary pieces. The surplus three of Lemma 16 excludes central contacts in the chain dimensions, so the rigid count equals the displayed composition up to integral chain homotopy. Each factor is a unit modulo two by Theorem 3.
  To obtain the rational assertion, take the mapping cone of this map of finite free integral complexes. Its homology modulo two vanishes. The universal coefficient exact sequence implies that its integral homology has no free summand, since any such summand would survive tensoring with $bb(F)_2$. Thus the cone is acyclic over $bb(Q)$, proving the rational isomorphism. No integral invertibility of $T$ on torsion is required.
  Each meridional handle kills a normally generating meridian in the incoming surgery group. Hence both handle halves are simply connected and their gluing has $H_1 = 0$. There are four two-handles, giving $chi = 4$. Each half has one negative direction and no positive direction: its remaining intersection direction comes from the zero-surgery boundary and is null, as in Lemma 9. Signature additivity across the rational seam gives $sigma = - 1 - 1 = - 2$. ◻
]

== 3 The negative interval unit <sec:negative>

The ordinary interval units have an additional negative-direction analogue with a sphere incidence condition. This condition is essential: it is a degree-two insertion, obtained by allowing the loop in a degree-three holonomy condition to move through a one-parameter sweep of a sphere. Throughout this section the determinant transitions on the true ends are fixed, and all gauge transformations have determinant one. Sweep homotopies preserve the chosen sphere orientation.

The proof has four stages: the minimal cap calculation, the comparison of its two determinant lifts, the chain-map identity, and the four-step family proving that the map is a unit modulo two. The local comparison fixes the weights that will also cancel the spinor lens ends in Section 10.

Set

$ W' = \( - C_2 \) + C_(- 2) : Y_2 arrow.r Y_(- 2) . $

The capped Seifert classes $F_l \, F_r$ are orthogonal, have square $- 2$, and give integral coordinates on $H_2 \( W' \; bb(Z) \)$. The two capping disks give an embedded sphere

#[#set math.equation(numbering: n => "(3.1)")
 $ S = F_l - F_r \, #h(2em) S^2 = - 4 . $ <eq:negative:sphere>]

The interval of metrics has one endpoint at the primary splitting $J = Y_oo = S^3$ and the other at the splitting off $N' = nu S$, whose oriented boundary is the corresponding lens space of order four. These are the two arc cuts in the polygon construction of Lemma 7. Write $t$ for the interval parameter.

Choose an orientation of $S$ and a sweep $gamma_s$, $0 lt.eq s lt.eq 1$, from a constant loop to a constant loop, of degree one onto $S$. Reparametrize it to be constant near $s = 0 \, 1$. On the lens collar keep the entire sweep inside $N'$. For each $e in { 0 \, 1 }$ use the determinant

#[#set math.equation(numbering: n => "(3.2)")
 $ c_e = e "PD" \( S \) \, $ <eq:negative:lifts>]

with the two determinant bundles identified off $N'$. Both determinants have square roots on $W'$: their evaluations on the integral basis $\( F_l \, F_r \)$ are $\( 0 \, 0 \)$ or $\( - 2 \, 2 \)$, and $H_1 \( W' \; bb(Z) \) = 0$. Divide holonomy by the holonomy of that root. Equivalently, for a sphere sweep the determinant square root is the one continued from its collapsed starting loop. The condition denoted by $x \( S \)$ is

#[#set math.equation(numbering: n => "(3.3)")
 $ "Hol"_0 \( a \, gamma_s \) = - "id" in "SU" \( 2 \) . $ <eq:negative:cut>]

The target is central, so the condition is independent of the frame used to record holonomy. At the collapsed loops the normalized holonomy is $+ "id"$, and the condition is absent there, also after a sufficiently small regularizing perturbation supported away from those endpoints.

The index $i$ is the fixed-limit unframed ASD index of Section 2. Thus a zero-dimensional count defining the interval map has

#[#set math.equation(numbering: n => "(3.4)")
 $ i + underbrace(1, t) + underbrace(1, s) - underbrace(3, upright("holonomy")) = 0 \, #h(2em) i = 1 . $ <eq:negative:dimension>]

Let $B_e$ be this count between the prescribed irreducible generators. We will specify the relative orientation of its two summands below and write $B = B_0 + B_1$ with those orientations understood.

#thm([Theorem 3.1.])[
  (Negative interval unit).  #emph[The counts defining $B$ can be chosen coherently so that 
$ B : C \( Y_2 \; bb(Z) \) arrow.r C \( Y_(- 2) \; bb(Z) \) $

 is an integral chain map. Its reduction modulo two induces an isomorphism on Floer homology. Its integral chain-homotopy class is unchanged by compatible changes of the interval data and sphere sweep. The relative sign of the two determinant lifts is local at $N'$, is independent of the exterior solution, and is preserved under composition with other cobordisms.]
] <thm:negative:unit>

We first establish the cap calculation and the signs. We then compute the map modulo two by a four-step family. The analytic inputs are the ordinary compactness, perturbation, and regular-gluing statements of Section 2, together with the compatible library of Proposition 94. In the application below these inputs are used with fixed relative bundle sectors, product-compatible parameter collars, perturbations independent of incidence marks, and fixed true-end data. At a harmonic reducer the perturbation value is zero and its normal derivative may be varied equivariantly. We only glue transverse, isolated matches with no particle or positive-charge neck loss. The following dimension and charge arguments verify those last hypotheses before gluing is used.

=== 3.1 The minimal cap and relative orientations <the-minimal-cap-and-relative-orientations>

#thm([Lemma 3.2.])[
  (The order-four cap).  #emph[Use a determinant square-root normalization on $N'$. For a fixed boundary flat $alpha$, let $h^0 \( alpha \)$ be the dimension of its parallel adjoint sections. The framed cap index and its charge satisfy 
#[#set math.equation(numbering: n => "(3.5)")
 $ delta := i_(N')^(upright("fix")) + h^0 \( alpha \) = 8 E \, #h(2em) cases(delim: "{", E in bb(Z) \, & alpha upright(" central") \,, E in 1 / 4 + bb(Z) \, & alpha upright(" trace zero") .) $ <eq:negative:cap-index>]

 A flat cap misses $x \( S \)$. The minimum cap which meets the cut has $E = 1 \/ 4$, trace-zero boundary flat, and framed real index two. With arbitrarily small compatible equivariant perturbations, its framed cut-down solutions are harmonic reducible crossings, with signed total $plus.minus 1$. Each crossing gives one match with a regular unframed exterior; there is no additional ordering or framing multiplicity.]
] <lem:negative:cap>

#proof[
  Let $x in H^2 \( N' \; bb(Z) \)$ evaluate as one on $S$. Rationally $x^2 = - 1 \/ 4$. The normalized boundary representations of its cyclic fundamental group have generator holonomy $plus.minus "id"$ or a conjugate of $"diag" \( i \, - i \)$. A reference split connection with summand difference $d = 2 x$ has
  $ E = - d^2 / 4 = 1 / 4 . $
  With a fixed boundary representative, changing the relative bundle degree changes $E$ by an integer and the index by eight. Both central boundary values have the trivial adjoint boundary correction; the flat $+ "id"$ reference has framed index zero. The trace-zero reference has framed tangent index zero, since $H^1 \( N' \; bb(R) \) = 0$ and $b^(+) \( N' \) = 0$, and framed normal complex index one. Here is the relative calculation of the latter correction. Contract the negative section in $bb(F)_4$ to obtain $bb(P) \( 1 \, 1 \, 4 \)$. On their identified smooth complements the two normal twists agree as complex bundles. For the fiber twists of degrees $2 \, - 2$ their Euler characteristics are $3 \, - 1$ on the resolution and $3 \, 0$ on the weighted plane. Indeed the fiber line on $bb(F)_4$ is pulled back from $cal(O)_(bb(C P)^1) \( 1 \)$, so the two Euler characteristics are $chi \( cal(O) \( 2 \) \) = 3$ and $chi \( cal(O) \( - 2 \) \) = - 1$. On the weighted plane with weights $1 \, 1 \, 4$, the degree-two part has three monomials; the degree-minus-two part has no sections, no intermediate cohomology, and no top cohomology, the latter also following from the canonical degree $- 6$. The ASD normal symbol contributes minus the sum of these characteristics; hence its relative complex index is
  $ \[ - 3 - \( - 1 \) \] - \[ - 3 - 0 \] = 1 . $
  The corresponding flat cone reference has framed index zero. Excision gives the asserted normal index, and hence (3.5). The minimal unframed dimension one is also the $m = 1$ case of the order-four calculation in #cite(label("FintushelStern1997")) Lemmas 5.2–5.3.
  The cap is simply connected. A flat connection after determinant normalization therefore has trivial holonomy on every loop of the sweep. Compactness makes this avoidance persist for sufficiently small perturbations. Nonnegative charges in (3.5), including charges of any neck levels, then show that the first possible cut cap has $E = 1 \/ 4$.
  At this charge a reducible has unordered difference ${ 2 x \, - 2 x }$. Order the summands by requiring $d \( S \) = 2$. Their difference restricts to the degree-two character modulo four, and the ordered normalized eigenvalue specifies its eigenline at the fixed boundary representative. Thus ordering does not double the number of connections. Abelian Hodge theory supplies a unique ASD extension with these data: existence uses the vanishing of the self-dual obstruction, while the difference of two such solutions has exact curvature, zero $L^2$ curvature norm by integration by parts, and then is gauge trivial because $H^1 \( N' \) = 0$.
  The normalized chosen eigenline has degree $d \( S \) \/ 2 = 1$. If $D_s$ is the part of the swept sphere preceding $gamma_s$, its holonomy is
  $ lambda \( s \) = exp (2 pi i integral_(D_s) F_(upright("eig")) \/ \( 2 pi i \)) . $
  The continuous real phase changes by one from one collapsed loop to the other. Consequently $lambda$ has winding one, up to reversal of the sphere orientation. Its transverse crossings of $- 1$ have signed sum $plus.minus 1$. Both eigenvalues equal $- 1$ at such a crossing; they describe a single instance of (3.3).
  For completeness, regularity here concerns the #emph[framed] cap. Its tangent operator is already regular of real index zero. The normal operator is complex linear of index one. Holonomy derivatives detect its kernel modulo infinitesimal gauge: if every based-loop variation is a simultaneous infinitesimal conjugation, transport from the base point constructs that gauge; its off-diagonal part decays because the trace-zero boundary flat has no off-diagonal parallel sections. A finite collection detects the finite-dimensional kernel. In a slice fixing the boundary torus, torus-equivariant linear outputs in these detected directions prescribe kernel-to-cokernel variations. These outputs vanish on commuting data. They therefore make the complex operator surjective without moving the harmonic solution. After this step its normal kernel has complex dimension one.
  The holonomy target tangent at $- "id"$ is the direct sum of a real toral line and an off-diagonal complex line. Vary the cut so that the mark derivative is nonzero in the toral line at every crossing, and its derivative on the normal kernel is a complex isomorphism onto the off-diagonal line. These variations are allowed by the same sample slice construction. The resulting dimension is
  #[#set math.equation(numbering: n => "(3.6)")
   $ underbrace(2, upright("framed cap index")) + underbrace(1, upright("mark")) - 3 = 0 . $ <eq:negative:framed-cut>]
  The off-diagonal isomorphism is complex oriented, so the remaining crossing sign is precisely the toral winding sign. This proves the signed count assertion.
  An irreducible cap satisfying the cut would have a positive-dimensional orbit under the residual framing torus $H = "U" \( 1 \)$. Equivariant transversality would make the framed cut locus zero-dimensional, so such a solution is absent. A reducible crossing is fixed by $H$: its parallel stabilizer absorbs that action. Accordingly one can glue the framed cap to the unframed exterior, or equivalently divide two framed matching spaces by the diagonal $H$; either convention gives exactly one match per crossing. At the minimum there is no positive cap or neck charge available, and a flat cap misses the cut, so there is no further end of this local count. These regularity choices are required only at the finitely many transverse exterior parameter values; they can be localized, extended over parameter collars, and copied by tensoring to the second lift. ◻
]

#thm([Proposition 3.3.])[
  (Local relative signs).  #emph[There is a relative orientation convention for the two lifts in (3.2) under which their minimal lens ends cancel over $bb(Z)$. The comparison uses identical exterior data, including relative bundle degree, and is independent of the exterior field. It commutes with gluing on other seams and is multiplicative for disjoint sphere caps. Adding a coupled complex Dirac determinant preserves this convention.]
] <prop:negative:local-sign>

#proof[
  Fix coherent Floer orientations for the unflipped sector. Fix also a representative $alpha$ of the trace-zero lens flat, and realize the two framed relative cap sectors at charge $1 \/ 4$. On the cap, $"PD" \( S \) = - 4 x$, so tensoring by a line of first Chern class $a = - 2 x$ changes the determinant by $2 a = "PD" \( S \)$. Starting with $c \( S \) = 0$, the relative Chern numbers change by
  #[#set math.equation(numbering: n => "(3.7)")
   $ Delta c^2 = - 4 \, #h(2em) Delta c_2 = - 1 \, #h(2em) Delta (c_2 - c^2 / 4) = 0 . $ <eq:negative:tensor-charge>]
  Here $alpha$ is recorded in the fixed common exterior determinant normalization. The twisting line has the order-two flat character on the boundary in that convention. It carries $"diag" \( i \, - i \)$ to $"diag" \( - i \, i \)$, which is conjugate back to $alpha$. Choose a determinant-preserving parallel boundary identification making that conjugation. Its remaining ambiguity is the connected centralizer, and does not reverse an orientation. Equality of the trace-free charges with this boundary identification fixes the relative $c_2$ change in (3.7). Thus gluing this tensor cap to the unchanged exterior gives precisely the flipped bundle, with unchanged relative degree outside the cap.
  Here is the determinant-line comparison, including its relation to any previous choice of orientations for the individual sectors. Write
  $ K_e = det D_(N' \, e)^(upright("fr")) ⊗ det bb(R)_s ⊗ #scale(x: 120%, y: 120%)[\(] det frak(s u) \( 2 \) #scale(x: 120%, y: 120%)[\)]^(*) $
  for the framed cap line with its mark and cut factors, and let $lambda_V$ include the common unframed exterior and its remaining parameter and cut factors. With their fixed ordering, determinant gluing gives maps $Gamma_e : lambda_V ⊗ K_e arrow.r lambda_e$ to the full constrained orientation lines. Tensoring and the chosen boundary conjugation compare the full cap deformation and cut complexes and give $tau_(upright("cap")) : K_0 arrow.r K_1$. Set
  #[#set math.equation(numbering: n => "(3.8)")
   $ Phi = Gamma_1 compose \( "id" ⊗ tau_(upright("cap")) \) compose Gamma_0^(- 1) . $ <eq:negative:orientation-comparison>]
  For conventional sector orientations $o_e$, define $s in { 1 \, - 1 }$ by $Phi \( o_0 \) = s thin o_1$. Choose weights according to
  #[#set math.equation(numbering: n => "(3.9)")
   $ epsilon_1 = - s epsilon_0 \, #h(2em) Phi \( epsilon_0 o_0 \) = - epsilon_1 o_1 . $ <eq:negative:lift-weights>]
  This is exactly the opposite count orientation required for paired crossings. It neither assumes nor needs $s = 1$. In particular a Weyl boundary conjugation can reverse an ordered toral generator and conjugate an ordered off-diagonal complex coordinate; all such signs, including the framing and target factors, are part of $tau_(upright("cap"))$.
  Take tensor-related equation and cut data and tensor-related roots: a root after tensoring is the old root tensored with the twisting line. These are the intrinsic cap roots continued from the collapsed loop; their boundary identifications need not coincide with the fixed common exterior normalization used to record $alpha$. Thus the boundary value changes from $alpha$ to $- alpha$ in the latter convention, whereas normalized sweep holonomy is unchanged before the boundary conjugation. Conjugation preserves the central target $- "id"$ and its orientation in $"SU" \( 2 \)$. Thus the matched cut points correspond and (3.9) makes their contributions opposite. The weights may equivalently be absorbed into the orientations of $B_e$. In later compositions they give a weighted sum of the ordinary sector counts. The canonically oriented cap pairing used for nonvanishing is left unchanged: the subsequent repetition argument uses this signed map $B$, whose reduction modulo two is independent of the weights. No equality with an unweighted sum of Donaldson invariants on the assembled manifold is required.
  We explain why the convention extends consistently away from the wall. The integral-lift ASD determinant line with chosen true-end orientations is orientable on the #emph[determinant-one gauge quotient], as fixed in Convention 5. Its orientation double cover therefore has trivial monodromy, including around a path closed by a gauge transformation. The reference connection spaces with the specified collar representative and relative degree are affine and connected, so their quotients are connected. Connectedness permits transport from the chosen reference; quotient orientability makes that transport independent of the path. This extends the comparison (3.8) as a comparison of orientation torsors with one constant relative sign.
  In choosing $alpha$, fix its internal framing degree so that the cap sector has charge $1 \/ 4$. An integral gauge degree changes this relative charge by the same integer. Hence a boundary gauge relating two actual minimum-charge walls in this sector has degree zero. In the fixed boundary trivialization its homotopy class lies in $\[ partial N' \, "SU" \( 2 \) \] tilde.equiv H^3 \( partial N' \; bb(Z) \) tilde.equiv bb(Z)$, classified by that degree. A degree-zero gauge is nullhomotopic; use a nullhomotopy on the collar and the identity beyond it to extend it over the cap. Nonzero degree would change the prescribed relative sector. The remaining parallel ambiguity in the boundary conjugation lies in the connected torus stabilizer and extends as a parallel cap gauge. There is consequently no additional boundary-gauge sign in the comparison. Interpolations here take place in connection space; no path of solutions is asserted.
  Associativity of determinant-line gluing now proves naturality under adding an exterior cylinder or cobordism: in either gluing order the same cap reference and the identity on the same exterior are used. The two raw framed cap indices are the same even number, namely two, and the two constrained indices in (3.6) are zero. With one fixed ordering of cuts and parameters there is no exterior-dependent interchange sign. Comparisons on disjoint caps therefore multiply. Finally a coupled Dirac determinant has its complex orientation, and tensoring and the boundary conjugation act complex linearly on that factor. It introduces no new relative sign. ◻
]

The square roots used to normalize holonomy do not identify the two global relative bundles with their fixed exterior and true-end data. In particular a root of their determinant difference need not be trivial on that exterior. The comparison just proved is the localized cap replacement with its boundary conjugation. The same comparison will be used for the coupled regular cap in Proposition 106.

=== 3.2 The chain map and its invariance <the-chain-map-and-its-invariance>

#thm([Proposition 3.4.])[
  (Chain property and invariance).  #emph[With the signs of Proposition 25, $B$ is an integral chain map. Compatible homotopies of equation data and incidence representatives give integral chain homotopies. The allowed representative homotopies include smooth conjugation-equivariant homotopies of the normalized based holonomy paths, relative to their collapsed endpoints, under the following requirements. Their exact compact supports remain in the specified parts, they persist under ideal convergence away from a support hit, and the equation data do not depend on the incidence mark. At the lens endpoint the test is supported in $N'$, its two lifts are tensor-paired with the same exterior, and its flat-cap and collapsed-endpoint avoidance holds throughout. The data admit regularization preserving these requirements. The homotopy of the incidence representative need not be small. Near the primary $J$ endpoint the unconstrained equation exclusion requires no additional behavior of the representative.]
] <prop:negative:invariance>

#proof[
  The boundary relation for the count (3.4) uses $i = 2$. At $J$, with no remaining interval parameter, a central contact costs at least three by Lemma 16 and $b^(+) \( W' \) = 0$. This excludes the face even if the incidence condition is discarded. At a true central end without the $J$ cut the same cost is accompanied by a nonconstant irreducible trajectory towards the prescribed generator. That trajectory costs at least one more index, giving $4 - 1 > 2$ even after the interval parameter is allowed. A bubble costs eight index before its four position parameters; even discarding the degree-two insertion leaves too much codimension in these zero- and one-dimensional families. Equivalently, project to the remaining equation solution before introducing the incidence mark: its index has decreased by eight and it has at most one equation parameter. It is excluded by ordinary regularity and the same reducible-group estimate.
  At the lens endpoint a flat cap misses the cut. Thus Lemma 24 gives $delta gt.eq 2$, with neck charge included. The exterior is measured after a reference filling by the cap; it has $b^(+) = 0$ and no equation parameters. For a central outer limit the reducible estimate remains $8 E_(upright("ext")) - 3 \( 1 + b_(upright("filled"))^(+) \)$: excision subtracts exactly the cap contribution $delta$, so no boundary correction is lost. Reducible groups and forbidden central contacts are consequently excluded as above. Regular irreducible exteriors have nonnegative index. The only lens boundary with $i lt.eq 2$ is therefore
  $ i = 2 \, #h(2em) delta = 2 \, #h(2em) i_(upright("ext")) = 0 . $
  It consists of an isolated regular irreducible exterior and a minimal cut cap, without further breaking. Lemma 14 applies: the framed cap is regular and absorbs the boundary stabilizer, and all matching and cut derivatives are transverse. It gives exactly the end counted by Lemma 24. The two lifts cancel by Proposition 25.
  All remaining ends are the ordinary irreducible trajectory breaks at the true ends. Their oriented boundary formula is precisely the chain-map equation for $B$ (with the usual degree convention). For a homotopy allow one additional common family parameter, so that at most two parameters enter the equation data, independently of the incidence mark. Its chain-homotopy count has index zero and its boundary relation index one. At the primary face the estimate is $3 - 1 > 1$; at a true central contact it is $4 - 2 > 1$. Lens boundaries, when present, are the same paired minimal caps with their common exterior. Bubbling is again excluded after dropping the insertion. These are all faces of the parameterized compactification. The oriented boundary formula supplies the desired chain homotopy. These arguments use smallness of the equation perturbations for the energy exclusions, but no smallness of the incidence-representative homotopy: its relative endpoint condition and flat avoidance exclude mark endpoints and zero-charge lens caps, its support and persistence hypotheses identify the ideal limits, and its tensor pairing gives the same lens cancellation. In particular sweeps may be transported along collars or changed near $J$, where the exclusion did not use the test.
  To check explicitly that such a homotopy preserves the insertion, work first in a framed configuration slice. Its evaluation maps are a homotopy
  $ F_h : cal(B) times \( \[ 0 \, 1 \] \, { 0 \, 1 } \) arrow.r \( "SU" \( 2 \) \, { "id" } \) \, #h(2em) 0 lt.eq h lt.eq 1 . $
  Pulling back the oriented degree-three class of the central incidence condition and integrating over the mark gives its degree-two transgression. A homotopy relative to the mark endpoints preserves this class. The construction descends from framed slices because the homotopy is conjugation-equivariant and conjugation preserves the target orientation. Its regular parameterized incidence cobordism is exactly the one used in the boundary argument above. ◻
]

We turn to the mod-two computation. Consider the four-step path

#[#set math.equation(numbering: n => "(3.10)")
 $ 2 arrow.r oo arrow.r 0 arrow.r oo arrow.r - 2 $ <eq:negative:four-step>]

on a cobordism $W$. Its three-dimensional associahedral family has nine facets: the three primary cuts $Z_1 \, Z_2 \, Z_3$ and the six cap cuts $M_02 \, M_03 \, M_04 \, M_13 \, M_14 \, M_24$. A facet carries the product of the remaining parameter families, as in Lemma 8.

=== 3.3 The four-step family and its boundary faces <the-four-step-family-and-its-boundary-faces>

#thm([Lemma 3.5.])[
  (Topology and determinant sectors of the four-step family).  #emph[The group $H_2 \( W \; bb(Z) \)$ has integral coordinates $F_l \, F_r \, A \, U$, with $F_l^2 = F_r^2 = - 2$, an orthogonal hyperbolic pair $A^2 = U^2 = 0$, $A dot.op U = 1$, and $F_l \, F_r$ orthogonal to that pair. Moreover $H_1 \( W \; bb(Z) \) = 0$ and $b^(+) \( W \) = 1$. The interior side spheres are 
$ S_l = A - F_l \, #h(2em) U \, #h(2em) S_r = A - F_r \, $

 and form the chain with weights $\[ - 2 \, 0 \, - 2 \]$. For 
#[#set math.equation(numbering: n => "(3.11)")
 $ c = "PD" \( U \) + e "PD" \( S_l \) + e' "PD" \( S_r \) \, #h(2em) e \, e' in { 0 \, 1 } \, $ <eq:negative:four-determinants>]

 the face at $Z_2$ is the product of the two ordinary interval units of Theorem 3.]
] <lem:negative:four-topology>

#proof[
  The two outside traces split off across $S^3$ and give $F_l \, F_r$. The doubled zero-trace portion is represented by a zero-framed knot handle and a linked meridian handle. The latter gives the square-zero sphere $U$ and the capped Seifert surface gives its primitive dual $A$. Their linking number is one; the two zero framings give their self-intersections zero. This is an integral handle basis, and the meridian normally generates the relevant fundamental group, so the displayed homology and positive rank follow. The common capped surface can also be represented on $Z_2 = Y_0$ and pushed to either side of the middle cut. Subtracting its capping disk on the outside trace gives $S_l \, S_r$, with intersections exactly as stated.
  On the left half of $Z_2$, $"PD" \( U \)$ evaluates as $\( 0 \, 1 \)$ on $\( F_l \, A \)$; on the right it evaluates as $\( 1 \, 0 \)$ on $\( A \, F_r \)$. The two additions in (3.11) are supported in their respective halves. Thus the determinant transition at $Z_2$ can be chosen common to all four sectors. The resulting restrictions are those of $g_(+) : Y_2 arrow.r Y_0$ and its negative-side counterpart $g_(-) : Y_0 arrow.r Y_(- 2)$. Each has index $- 1$ with one parameter; their product face has index $- 2$ with two parameters and induces a mod-two isomorphism. A fixed tensor or endpoint identification in this description only composes it with a Floer automorphism. ◻
]

#thm([Lemma 3.6.])[
  (The other associahedron facets).  #emph[In the boundary relation at index $i = - 2$ for the family (3.10), the $M_04 \, M_03 \, M_14 \, Z_1 \, Z_3$ facets and all their degenerations contribute nothing. The $M_02 \, M_24$ contributions cancel modulo two by their respective determinant flips. The remaining terms are the product at $Z_2$, the face $M_13$, and ordinary true-end breaks.]
] <lem:negative:faces>

#proof[
  At $M_04$ the enclosed chain has intersection matrix
  $ Q = mat(delim: "(", - 2, 1, 0; 1, 0, 1; 0, 1, - 2) \, #h(2em) Q^(- 1) = mat(delim: "(", - 1 / 4, 1 / 2, 1 / 4; 1 / 2, 1, 1 / 2; 1 / 4, 1 / 2, - 1 / 4) . $
  Replacing its middle zero-sphere cap by $D = S^1 times D^3$ joins the two $oo$ sides, leaving exactly $N'$. This identifies their oriented links. The determinant evaluation vector is $Q \( e \, 1 \, e' \)^t$, so its restriction to that link is trivializable. Every boundary eigenline extends over the chain, because the restriction from its integral cohomology onto the lens cohomology is surjective. A split reference with difference evaluations $\( d_l \, b \, d_r \)$ has
  #[#set math.equation(numbering: n => "(3.12)")
   $ d^2 = - frac(\( d_l - d_r \)^2, 4) + b \( d_l + d_r \) + b^2 . $ <eq:negative:chain-square>]
  Here $d_l \, d_r$ are odd, since $c \( S_l \) = 1 - 2 e$ and $c \( S_r \) = 1 - 2 e'$. Hence the square is integral and $E in 1 / 4 bb(Z)$. Charge zero is impossible, even at a corner: nonnegative charges on all cap pieces and levels would make all of them flat; their matching would give a flat adjoint cap, whereas its restriction to an outside sphere has nonzero $w_2$. Thus $E gt.eq 1 \/ 4$.
  Compared with $N'$, this cap has Euler characteristic greater by two and the same signature. The excision formula therefore gives its framed contribution, including the matching correction, as
  #[#set math.equation(numbering: n => "(3.13)")
   $ 8 E - 3 gt.eq - 1 . $ <eq:negative:large-shift>]
  The exterior has no parameters and has $b^(+) = 0$ after virtual $N'$ filling. The central-group estimate, including any true-end trajectories, and irreducible regularity give exterior index at least zero. The sum is greater than $- 2$, excluding $M_04$.
  For $M_03$ the chain is $\[ - 2 \, 0 \]$, and the reversed chain occurs at $M_14$. The inverse intersection matrix gives
  $ d^2 = 2 b \( d + b \) . $
  Its outside evaluation $d$ is odd; $b$ and $d + b$ have opposite parities, so $d^2$ is divisible by four. The cap charge is a positive integer. Positivity follows by the same odd-sphere flat obstruction, including at broken corners. Comparison with a ball gives shift $8 E - 3 gt.eq 5$. The virtually filled exterior has $b^(+) = 0$. Even allowing all remaining parameters on its irreducible components cannot reduce this contribution to index $- 2$. These facets are therefore absent as well.
  The small caps $M_02 \, M_24$ are the odd-determinant $- 2$ disk bundles of Section 2. Their trace minimum has charge $1 \/ 8$ and framed shift zero relative to its reference filling. Nonminimum charge has strictly larger shift. At a minimum a single harmonic reducer gives the framed regular match, and the flip supported on that sphere gives a second copy with the same exterior. The two copies cancel modulo two. To justify applying this local description, we check that no exceptional exterior or corner can intervene.
  Away from the larger cap facets already excluded, fill back any small odd cap by its reference. The sum of positive ranks of the primary pieces is at most one. A maximal reducible group contributes at least $3 \( 1 - b_(upright("group"))^(+) \)$, including its two exterior matches, by Lemma 16. If there is no primary cut, a group using the positive rank must contain the whole main cobordism and needs two nonconstant trajectories to the prescribed irreducible ends. If there is one primary cut, such a group touches an end and needs at least one trajectory; with at most $p = 2$ remaining parameters its lower bound is $1 - p gt.eq - 1 > - 2$. At two or more primary cuts at most one parameter remains, and the group bound alone is greater than $- 2$. A central contact with no such group costs at least three before parameter subtraction. Nonminimum small caps and bubbles increase these bounds. Consequently the only small-cap matches are minimum caps with exteriors that are irreducible and rigid in their remaining parameters, away from the corners.
  The primary cuts $Z_1 \, Z_3$ are on $S^3$, which has no irreducible Floer generators. Any prospective contact there is one of the forbidden central configurations just excluded. The only surviving primary facet is $Z_2$, the product in Lemma 27. The nine-facet list is now exhausted except for $M_13$. Ordinary irreducible breaking at the two true ends supplies the differential terms in the family homotopy relation. ◻
]

The remaining facet $P = M_13$ is a pentagon. It separates $N_U = nu U tilde.equiv S^2 times D^2$ from $V = W \\ N_U^compose$ and has link $L = S^1 times S^2$. Its five edges are

#[#set math.equation(numbering: n => "(3.14)")
 $ Z_1 \, med Z_3 \, med M_03 \, med M_14 \, med M_04 . $ <eq:negative:pentagon-edges>]

In particular it meets neither small flip facet.

=== 3.4 The selected center and the interval count <the-selected-center-and-the-interval-count>

The remaining task is to turn the pentagon count into the interval count that defines $B$. We first identify the flat on $L$ selected by a flat $N_U$. Replacing $N_U$ by $D = S^1 times D^3$ will then express this matching as a loop-holonomy condition. The final step contracts the loop through two disks whose union represents $plus.minus S$, producing the degree-two sphere test.

#thm([Lemma 3.7.])[
  (The root mismatch and the selected center).  #emph[Only the sectors $e = e'$ have a flat limit at $L$. After a tensor identification fixed on the true ends, their determinants are 
#[#set math.equation(numbering: n => "(3.15)")
 $ "PD" \( U \) + e "PD" \( F_l - F_r \) \, #h(2em) e = 0 \, 1 . $ <eq:negative:surviving-determinant>]

 Replacing $N_U$ by $D = S^1 times D^3$ gives $W'$ with determinant $e "PD" \( S \)$. If the exterior is normalized using a square root from $W'$, a flat $N_U$ matches it exactly when the normalized holonomy of the generator of $pi_1 \( L \)$ is $- "id"$.]
] <lem:negative:root>

#proof[
  The determinant evaluates on $U$ as $e + e'$. A projectively flat connection on $S^1 times S^2$ has trivial $w_2$ on its $S^2$, since its representation factors through the circle. Thus $e eq.not e'$ is impossible. In the $e = e' = 1$ sector tensor by the line of class $- "PD" \( S_l \)$, canonically trivial off that sphere. This changes the determinant by $- 2 "PD" \( S_l \)$ and gives
  $ "PD" \( U \) - "PD" \( S_l \) + "PD" \( S_r \) = "PD" \( U \) + "PD" \( F_l - F_r \) . $
  It proves (3.15); the $e = 0$ sector requires no tensoring. The class $"PD" \( U \)$ can be represented inside $N_U$, while the second term survives the replacement. The polygon replacement joins the identical $oo$ sides and yields $W'$, including its fixed true-end identifications.
  There are square roots of the determinant separately on $N_U$ and on $V$: use the root on $W'$ for $V$. Their root structures on $L$ differ by a flat sign line $Q in H^1 \( L \; bb(Z) \/ 2 \)$. The Mayer–Vietoris connecting homomorphism sends $Q$ to the obstruction $c med mod med 2$ to a square root on $W$. This obstruction is nonzero, since
  $ c \( A \) = U dot.op A + e \( F_l - F_r \) dot.op A = 1 . $
  Equivalently, if the root structures matched they would glue to a global root, contradicting this odd evaluation. As $H^1 \( L \; bb(Z) \/ 2 \) = bb(Z) \/ 2$, $Q$ is its nontrivial character and is $- 1$ on the circle generator. A normalized flat connection on the simply connected cap $N_U$ has generator holonomy $+ "id"$. Changing from its root to the exterior root multiplies that holonomy by $Q$, giving $- "id"$. Conversely this sign change makes any exterior limit at $- "id"$ agree with the flat cap. This establishes the selected center and not merely its image in the projective flat space. ◻
]

#thm([Lemma 3.8.])[
  (The surviving pentagon count).  #emph[At index $i_(upright("total")) = - 2$ the face $P$ consists of isolated regular exterior matches at the selected center with a flat $N_U$. Their count induces a mod-two isomorphism. It is also the count on $W'$ over $P$ at index $i' = 1$, with the degree-three condition 
#[#set math.equation(numbering: n => "(3.16)")
 $ "Hol"_0 \( a \, beta \) = - "id" \, #h(2em) beta = S^1 times { 0 } subset D \, $ <eq:negative:beta-cut>]

 when the $D$–exterior neck is sufficiently long and finite.]
] <lem:negative:pentagon>

#proof[
  Leave $N_U$ unperturbed at this cut. Relative to a virtual flat $D$ filling, index excision gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ i_(upright("filled")) = i_V^(upright("fix")) + h^1 = i_(upright("total")) + 3 - 8 E_(N_U) lt.eq 1 \, #h(2em) E_(N_U) in bb(Z)_(gt.eq 0) . $ <eq:negative:zero-replacement-index>]
  Any nonflat hard-neck level is included in $E_(N_U)$. The charge is integral because the Chern–Simons value is constant on this flat space and the cap has a zero-charge reference. The filled exterior has $b^(+) = 0$ and at most two equation parameters. If $E_(N_U) gt.eq 1$, then $i_(upright("filled")) lt.eq - 7$, which is incompatible with irreducible regularity or the central-group lower bound. Positive neck or cap charge is therefore impossible. An additional primary $S^3$ cut leaves at most one parameter, and costs three. A forbidden true central contact also needs an extra irreducible trajectory and costs at least $4 - p > 1$ for $p lt.eq 2$. The larger cap corners have already been excluded in Lemma 28.
  At the selected center $h^0 = h^1 = 3$. Varying the flat in a framed slice uses three real parameters; imposing the center removes all three. It is not a codimension-one endpoint condition on the conjugacy interval. The dimension of a prospective exterior match is
  $ i_(upright("filled")) + p - 3 lt.eq 1 + 2 - 3 = 0 . $
  It can be nonnegative only at $E_(N_U) = 0$, $p = 2$, and $i_(upright("total")) = - 2$, and is then zero. Generic compatible exterior data give transverse matches.
  The flat $N_U$ is regular when the boundary flat is allowed to vary before matching. Its framed fixed-limit infinitesimal kernel is zero, since $H^1 \( N_U \) = 0$; the three boundary flux obstructions in the self-dual equation are killed by the three flat parameters, componentwise by the Abelian relative Hodge exact sequence. Its full parallel group absorbs the matching rotations. Thus this is an isolated regular matched problem of exactly the type in Lemma 14, with coefficient one. The associahedron boundary relation, using Lemma 28, identifies its map on homology with the unit at $Z_2$. This proves the first assertion.
  For the second assertion replace $N_U$ by $D$ and retain the same limiting exterior. The index becomes $i' = 1$. The framed flat family on $D$ is locally the three-dimensional group of generator holonomies near $- "id"$; its evaluation on $beta$ is the identity. Consequently (3.16) regularly fixes that flat, and $i' + 2 - 3 = 0$. A nonflat $D$ component or hard-neck loss costs a positive integer charge and is excluded by the same filled-exterior estimate. Regular gluing therefore gives exactly the previous center matches at every sufficiently long finite neck.
  Here is the required uniform boundary check. Keep the exterior of $M_04$ fixed and common for the two sectors, independent of its cap parameters; both flip spheres are inside that cap. After replacement denote the corresponding edges by primes. The $Z_1 \, Z_3$ edges still cut on $S^3$ and are excluded with $p lt.eq 1$ even without (3.16). The cap at $M'_04$ is $N'$; a nonflat contribution has framed shift at least two and the exterior has no parameters, so it cannot occur at $i' = 1$. At $M'_03 \, M'_14$ the caps are balls and a nonflat contribution has shift at least eight. On these three edges the zero-charge caps in the filled manifold are simply connected and contain $beta$; their normalized flat holonomy is $+ "id"$, so they miss the cut. The same assertion holds if the long $D$ neck breaks simultaneously: its matching zero-charge fields glue to a flat on the same simply connected filled cap. The normal-gap estimate and controlled harmonic drift of Lemma 13 show that a loop in a middle slice sees that same flat orbit. This rules out escape down the long neck and proves exhaustion, including the compatible corners. The true-end determinant identifications remain fixed throughout the tensor and replacement operation. ◻
]

#thm([Lemma 3.9.])[
  (Contraction of the pentagon to the interval).  #emph[The map on homology counted in Lemma 30 agrees modulo two with $B$.]
] <lem:negative:sweeps>

#proof[
  We describe the contraction disks, since their location determines which boundary avoidances remain valid. In the polygon after the $U$ replacement, let $E = \[ a \, b \]$ be the merged $oo$ side. Its preimage is
  $ #scale(x: 120%, y: 120%)[\(] \[ a \, b \] times S^1 #scale(x: 120%, y: 120%)[\)] \/ #scale(x: 120%, y: 120%)[\(] { a } times S^1 upright(" and ") { b } times S^1 upright(" collapsed separately") #scale(x: 120%, y: 120%)[\)] \, $
  an embedded sphere. Let $\[ u \, v \] subset \( a \, b \)$ be the inserted $D$ portion and choose $u < t_0 < v$. The surviving circle over $t_0$ is $beta$. The preimages of $\[ a \, t_0 \]$ and $\[ t_0 \, b \]$ are disks $Delta_l \, Delta_r$ with common boundary $beta$. Their union is the merged side sphere. Before replacement its class is, up to orientation, $S_l - S_r$; hence after replacement it is $plus.minus \( F_l - F_r \) = plus.minus S$.
  The $M'_04$ arc encloses the entire merged side and contains both disks. The $M'_03$ arc can end on the merged side at a point $t_(+) > v$, so its one-corner cap contains $Delta_l$ and all of $D$; the $M'_14$ arc can end at $t_(-) < u$, and its cap contains $Delta_r$ and all of $D$. These choices come from nesting the original $N_U$ cut inside the respective larger cap. The two-disk chart at the unique basis corner identifies each one-corner cap with a ball. These two ball cuts are incompatible facets and are never imposed simultaneously. At a corner with $M'_04$, the appropriate one-corner cap is nested in that outer cap. Slight collar displacements put the disks in the required interiors without altering their boundary or their union class.
  Choose an embedded interval $I subset P$ from the interior of $M'_04$ to a primary $Z$ edge, separating $M'_03$ from $M'_14$, as in Figure 3. It divides $P$ into two regions. On the first region contract $beta$ through $Delta_l$, and on the second contract it through $Delta_r$. Denote the contraction parameter by $s$. Transport the contractions over the parameter collars so that, at each cap edge, the loops remain in the disk just specified. The metrics and ASD perturbations have the two parameters of $P$ and are independent of $s$. At $s = 0$ we recover the original degree-three condition; at $s = 1$ the loop is collapsed and misses $- "id"$. Each contraction is a one-dimensional constrained family:
  $ i' + underbrace(2, P) + underbrace(1, s) - 3 = 1 . $
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0.928, 2.82), (2.4, 3.556), (3.136, 3.188), (2.4, 0.612), (1.296, 0.612), close: true, fill: rgb("#f6f6f6"), stroke: none)
  line((3.136, 3.188), (3.872, 2.82), (3.504, 0.612), (2.4, 0.612), close: true, fill: rgb("#ededff"), stroke: none)
  line((0.928, 2.82), (2.4, 3.556), (3.872, 2.82), (3.504, 0.612), (1.296, 0.612), close: true, stroke: (thickness: 0.4pt))
  line((2.4, 0.612), (3.136, 3.188), stroke: (thickness: 0.4pt, dash: "dashed"))
  content((2.814, 2.084), [#text(size: 9pt)[$I$]], anchor: "west")
  content((1.94, 2.038), [#text(size: 9pt)[$Delta_l$]])
  content((3.274, 1.394), [#text(size: 9pt)[$Delta_r$]])
  content((1.664, 3.188), [#text(size: 9pt)[$Z_3$]], anchor: "south-east")
  content((3.136, 3.188), [#text(size: 9pt)[$Z_1$]], anchor: "south-west")
  content((1.112, 1.716), [#text(size: 9pt)[$M_03'$]], anchor: "east")
  content((3.688, 1.716), [#text(size: 9pt)[$M_14'$]], anchor: "west")
  content((2.4, 0.612), [#text(size: 9pt)[$M_04'$]], anchor: "north")
  content((2.4, -0.124), [#text(size: 9pt)[Pentagon $P$]])
  rect((6.6, 0.8), (11.86, 4), fill: rgb("#f6f6f6"), stroke: none)
  rect((8.386, 0.8), (10.08, 4), fill: rgb("#d9d9ff"), stroke: none)
  bezier((6.6, 2.4), (11.86, 2.4), (7.822, 3.9), (10.64, 3.9), stroke: (thickness: 0.4pt))
  bezier((8.386, 3.39), (8.386, 1.41), (8.151, 2.9), (8.151, 1.9), stroke: (thickness: 0.4pt))
  bezier((10.08, 3.39), (10.08, 1.41), (10.31, 2.9), (10.31, 1.9), stroke: (thickness: 0.4pt))
  circle((9.232, 2.4), radius: (0.2256, 1.125), stroke: (thickness: 0.4pt))
  content((7.587, 2.5), [#text(size: 9pt)[$Delta_l$]])
  content((10.88, 2.5), [#text(size: 9pt)[$Delta_r$]])
  content((9.232, 3.55), [#text(size: 9pt)[$beta$]], anchor: "south")
  line((6.6, 0.55), (12.05, 0.55), stroke: (thickness: 0.4pt), mark: (end: ">"))
  line((6.6, 0.63), (6.6, 0.47), stroke: (thickness: 0.4pt))
  content((6.6, 0.46), [#text(size: 9pt)[$a$]], anchor: "north")
  line((8.386, 0.63), (8.386, 0.47), stroke: (thickness: 0.4pt))
  content((8.386, 0.46), [#text(size: 9pt)[$u$]], anchor: "north")
  line((9.232, 0.63), (9.232, 0.47), stroke: (thickness: 0.4pt))
  content((9.232, 0.46), [#text(size: 9pt)[$t_0$]], anchor: "north")
  line((10.08, 0.63), (10.08, 0.47), stroke: (thickness: 0.4pt))
  content((10.08, 0.46), [#text(size: 9pt)[$v$]], anchor: "north")
  line((11.86, 0.63), (11.86, 0.47), stroke: (thickness: 0.4pt))
  content((11.86, 0.46), [#text(size: 9pt)[$b$]], anchor: "north")
  line((6.6, 2.4), (6.6, 0.65), stroke: (thickness: 0.4pt))
  line((8.386, 1.41), (8.386, 0.65), stroke: (thickness: 0.4pt))
  line((9.232, 1.275), (9.232, 0.65), stroke: (thickness: 0.4pt))
  line((10.08, 1.41), (10.08, 0.65), stroke: (thickness: 0.4pt))
  line((11.86, 2.4), (11.86, 0.65), stroke: (thickness: 0.4pt))
  content((9.232, -0.35), [#text(size: 9pt)[Merged $infinity$ side and its sphere]])
})],
    caption: [Figure 3: The two contractions of the pentagon loop test. Left: the interval $I$ separates the incompatible ball edges $M'_03$ and $M'_14$; each region uses the disk lying in its ball cap. Right: the inverse image of the merged $oo$ side $\[ a \, b \]$ is a sphere. The circle over $t_0$ is $beta$, and the preimages of $\[ a \, t_0 \]$ and $\[ t_0 \, b \]$ are $Delta_l$ and $Delta_r$. The shaded annulus is the part in the inserted $D$ piece. Concatenating the disk contractions gives a sweep of $plus.minus S$. The drawing is schematic, and the $D$ neck remains finite. ],
  ) <fig:negative:contraction>
  We check its compactification uniformly before using its boundary formula. At a primary edge, the unconstrained equation projection has at most one parameter and is excluded by the central cost. The contraction mark cannot remedy an empty equation projection. At a true central end the extra irreducible trajectory gives cost at least $4 - p > 1$ for $p lt.eq 2$ #emph[equation] parameters, again independent of the mark. Positive cap or neck loss and bubbles obey the same inequalities as in Lemma 30. At $M'_04$, $M'_03$, or $M'_14$ a zero-charge cap misses the test because the chosen contraction lies in that simply connected cap. The collapsed end is also uniformly disjoint from the cut.
  The latter avoidance is valid even while the hidden $D$ neck becomes arbitrarily long. The sphere meets $D = S^1 times D^3$ in $S^1$ times a diameter of $D^3$. In each stretched collar its intersection is consequently $S^1$ times a pole of $S^2$ times the neck interval. The contractions can therefore be taken along the merged side, using at each mark a free-circle loop in one slice of the neck or in one of the two bodies, with uniformly bounded spatial length and derivatives. Central holonomy requires no comparison of frames transported down the neck. Suppose uniform avoidance failed for arbitrarily small part perturbations. Ideal compactness and the charge exclusions just proved would give matching flat data on a zero-charge cap and its neck pieces. These glue to a flat on the whole simply connected cap, and the root from $W'$ normalizes it absolutely. A mark remaining on a body then has holonomy tending to $+ "id"$. For a mark escaping along the middle, Lemma 13 gives the same conclusion: normal modes decay and the harmonic slice remains in the matching flat orbit. Both conclusions contradict the value $- "id"$. The argument works also at nested compatible corners, using the innermost required cap. Thus first choose the sufficiently small limiting part perturbations with this avoidance, and only then the large finite $D$ neck. This order also permits the small generic cut perturbations needed for regularity.
  Apply the one-dimensional mod-two boundary formula on the two regions. Their original pentagon contributions add to the original count; the collapsed ends and the exterior parameter edges contribute nothing. True irreducible end breaks give a chain homotopy. The remaining boundary lies on $I$, where the two disk contractions concatenate to a sweep of their union sphere. Its dimension is
  $ i' + underbrace(1, I) + underbrace(1, s) - 3 = 0 . $
  This is exactly the interval count with $x \( S \)$, up to reversal of the sweep and the fixed tensor identifications. Reversal is irrelevant modulo two.
  Finally this induced interval data may be made identical to the chosen data for $B$. Keep the exterior at $M'_04$ fixed and common for the two lifts. At index one there are no solutions near that endpoint: a nonflat cap costs at least two with no exterior parameters, and a flat cap misses the sweep. Hence tensor-paired cap regularizations and cut data may be inserted there, stationary at the endpoint, without changing the count. Subsequent comparisons are precisely the compatible homotopies in Proposition 26. This proves the lemma. ◻
]

#proof[
  Propositions 25 and 26 give the integral chain map, its homotopy invariance, and its coherent local sign convention. Lemma 27 identifies the $Z_2$ face with a product of ordinary mod-two units. Lemma 28 and the associahedron boundary formula identify that product on homology with the surviving pentagon count. Lemmas 30 and 31 identify the latter with $B$ modulo two. Thus $B$ induces an isomorphism, as asserted. ◻
]

== 4 Caps and a nonzero ordinary pairing <sec:caps>

This section constructs a nonzero ordinary pairing and puts every Donaldson insertion in two fixed end caps. These caps supply the fixed states paired with the repeated cobordism maps in Section 5. The intervening cobordisms will carry no moving surface insertions. We retain the determinant-one gauge group and the fixed collar identifications of Section 2. Write $x_0$ for the point class and use the normalization

#[#set math.equation(numbering: n => "(4.1)")
 $ mu \( xi \) = - 1 / 4 p_1 \( "ad" E \) \/ xi . $ <eq:caps:normalization>]

A #emph[tight surface] is an embedded oriented surface $B$ with $B^2 = 2 g \( B \) - 2 > 0$. The capped minimal Seifert surface $A subset Y_0$ has genus two and square zero in the closures below.

#thm([Theorem 4.1.])[
  (Fixed caps with a nonzero pairing).  #emph[There are two fixed compact caps $C_(-)$ and $C_(+)$ with common rational boundary $Y_2$, fixed determinant data trivialized at that boundary, and finite collections of integral point and surface probes in their interiors with the following properties.]
  + #emph[Each cap has $H_1 \( C_plus.minus \; bb(Z) \) = 0$ and $b^(+) \( C_plus.minus \) > 0$. Each contains a square-zero copy of $A$ on which the determinant class evaluates as $1$, and a tight genus-two surface of square two.]
  + #emph[Each cap has one additional, separate exceptional summand. The determinant evaluates as zero on its exceptional sphere, and every probe is supported in the old part of the cap.]
  + #emph[For suitable generic cap data and small ordinary Floer data at the rational boundary, the cut counts give a rational cycle $x$ and a rational cocycle $y$ on the irreducible determinant-one Floer complex, with 
#[#set math.equation(numbering: n => "(4.2)")
 $ y x eq.not 0 . $ <eq:caps:nonzero-pairing>]

 Fixed integral multiples of these are an integral cycle and cocycle.]
  + #emph[The total real degree $z$ of all cap probes is fixed. Reducible cap limits in any of the bounded charge ranges used below are excluded by the cap period choices. The period choices admit the finite isolation extensions of Proposition 72.]
  #emph[The cycle and cocycle can be recomputed with the final cap data used in Section 5; their pairing is the same nonzero closed Donaldson count, up to the fixed normalization and orientation sign.]
] <thm:caps:pairing>

We first construct a closure, prove that it has a nonzero Donaldson invariant, and move its insertions away from a rational seam. The exact sections used to represent the insertions are supplied by Proposition 94; the present section proves the labelled identities, the compactness budgets, and the comparison with closed Donaldson invariants. This use of the ordinary analytic library does not require the spinor compactification or the nonzero count to be constructed later.

=== 4.1 The closure and its tight surfaces <the-closure-and-its-tight-surfaces>

The foliation, contact, and symplectic-cap route to a closed nonvanishing problem is assembled in Kronheimer–Mrowka #cite(label("KronheimerMrowka2004")) Theorem 8, Lemmas 9–14, and Proposition 15. The construction below establishes simple connectivity and the tight surfaces used in the nonvanishing argument. It also gives the stated geography bounds.

#thm([Lemma 4.2.])[
  (Enhanced symplectic closure).  #emph[There is a symplectic closure $X_0$ of $Y_0$ such that its two halves are simply connected, $A$ is symplectic, and each half contains a tight genus-two surface $B$. The closure can be chosen to satisfy 
#[#set math.equation(numbering: n => "(4.3)")
 $ q \( X_0 \) := frac(chi \( X_0 \) + sigma \( X_0 \), 4) gt.eq 3 \, #h(2em) s \( X_0 \) := 2 chi \( X_0 \) + 3 sigma \( X_0 \) gt.eq q \( X_0 \) - 2 . $ <eq:caps:geography>]

 Moreover, $\[ A \]$ is primitive and there is $w in H^2 \( X_0 \; bb(Z) \)$ with $chevron.l w \, A chevron.r = 1$.]
] <lem:caps:closure>

#proof[
  Gabai’s taut-foliation construction for zero surgery on a nontrivial knot allows the capped norm-minimizing Seifert surface to be a leaf #cite(label("Gabai1987")) Corollary 8.10 and Remark 8.13. The contact approximation and weak symplectic product construction preserve positivity on this leaf #cite(label("EliashbergThurston1998")). Thus a product neighborhood of $Y_0$ embeds in a symplectic cobordism, with $A$ symplectic and outer boundaries weakly compatible with their contact structures. We describe the additional cap choices; they strengthen the homological conclusions alone of the usual cap construction #cite(label("KronheimerMrowka2004")) Theorem 8 and Lemmas 9–12.
  Choose a supporting open book with connected binding at each end #cite(label("Giroux2002")) Theorems 3–4. Positive stabilizations can increase the page genus while restoring connected binding in pairs of stabilizations. We may therefore take its genus to be
  $ G = frac(\( d - 1 \) \( d - 2 \), 2) $
  for an arbitrarily large $d gt.eq 6$. Attach Eliashberg’s symplectic binding handle #cite(label("Eliashberg2004")) Theorem 1.1. The new boundary is a bundle of closed genus-$G$ surfaces over the circle, with a prescribed closed boundary two-form positive on the fibers. Viewed from this new boundary, the handle cobordism has only a relative two-handle. In particular its fundamental group is generated by the image of that boundary.
  Factor the required inverse boundary monodromy into positive twists on nonseparating curves #cite(label("AkbulutOzbagci2002")) Lemma 2, arXiv version 2. Such a factorization exists for the closed fiber: nonseparating twists generate the closed surface mapping class group, and a positive chain relation expressing the identity contains each of the standard generators. Solving this relation for a chosen inverse expresses that inverse as a positive word; conjugation does the same for any nonseparating twist. Append as many positive identity factorizations as necessary from generic degree-$d$ plane pencils. These pencils have only irreducible nodal singular fibers. Their blown-up total spaces are $bb(C P)^2 \# d^2 overline(bb(C P))^(thin 2)$ and have sections. Removing a regular fiber leaves a simply connected disk fibration: its fundamental group is normally generated by the meridian of the removed fiber, and a punctured section is a disk bounding this meridian. Equivalently, the vanishing cycles of one plane-pencil identity block normally generate the fiber fundamental group. Appending one such block consequently kills the fundamental group of the disk fibration with the originally prescribed monodromy. Let $Z$ denote the resulting simply connected disk filling.
  There is no additional boundary-flux hypothesis in this construction. Indeed, Poincaré–Lefschetz duality gives
  $ H^3 \( Z \, partial Z \; bb(R) \) tilde.equiv H_1 \( Z \; bb(R) \) = 0 \, $
  so the class of the prescribed boundary two-form extends over $Z$. It is positive on the regular fiber and on each singular fiber component, since every singular fiber is irreducible. Here is the relative form construction with this particular boundary condition. On a boundary collar extend the prescribed two-form, and choose representatives of the extended class positive on the vertical tangent planes in fiber neighborhoods. At a critical point use the usual local Lefschetz model and a form taming that model. Representatives in overlapping base neighborhoods differ by exact forms after their fiber integrals have been matched. Patching their primitives with a partition of unity on the base therefore preserves both closedness and vertical positivity; the correction terms contain a base differential and vanish on vertical pairs. Carry out this patching relative to the boundary collar. Adding a sufficiently large pullback of an area form on the disk gives a symplectic form, including on the finitely many critical neighborhoods. That added form restricts to zero on the tangent bundle of the boundary. Thus its tangential boundary restriction is exactly the prescribed one. Equal restrictions give compatible collars by the symplectic hypersurface neighborhood construction. This also agrees with the boundary-form and flux arrangements in #cite(label("Eliashberg2004")) Lemmas 3.4–3.5 and Remark 3.6.
  Gluing $Z$ kills the group of the binding-handle cobordism, because its new boundary surjects on that group. It follows that the resulting half of the closure is simply connected. Do this at both ends. Van Kampen’s theorem then gives $pi_1 \( X_0 \) = 0$.
  For completeness, two adjacent plane-pencil identity blocks give the required tight surface inside either cap. Conjugate their fiber identifications so that a chosen nonseparating vanishing cycle agrees in the two blocks, and put these chosen critical points next to the intervening product region. Join their thimbles across that region. The Lefschetz framings give an embedded sphere $S$ of square $- 2$. A curve in the fiber dual to the vanishing cycle gives a rim torus $R$ in the product region, with $R^2 = 0$ and $S dot.op R = 1$. Take disjoint parallel copies $R_1 \, R_2$ and resolve their two intersections with $S$. The resulting connected embedded oriented surface satisfies
  $ chi \( B \) = 2 + 0 + 0 - 4 = - 2 \, #h(2em) B^2 = \( S + R_1 + R_2 \)^2 = - 2 + 4 = 2 . $
  Thus $g \( B \) = 2$ and $B$ is tight. This is the sphere-and-two-tori construction of #cite(label("KronheimerMrowka1995")) Corollary 8.5, in the matching-thimble form used in #cite(label("Sivek2015")) Lemma 4.6, arXiv version 2. It requires neither a new cap theorem nor a genus-two nonvanishing theorem.
  One additional plane-pencil block has Euler characteristic $3 + d^2$ and signature $1 - d^2$. Fiber sum along genus $G$ adds another $4 G - 4$ to the Euler characteristic. Consequently its increments are
  #[#set math.equation(numbering: n => "(4.4)")
   $ Delta q = G \, #h(2em) Delta s = 1 - d^2 + 8 G . $ <eq:caps:block-increments>]
  For $d gt.eq 6$, $Delta s - Delta q = 1 - d^2 + 7 G > 0$. Sufficiently many blocks give (4.3). In particular $b^(+) \( X_0 \) = 2 q \( X_0 \) - 1 gt.eq 5$.
  Finally symplectic adjunction gives $K_omega dot.op A = 2$. The second homology of the simply connected $X_0$ is torsion free. If $\[ A \] = k a$ with $k > 1$, this equality forces $k = 2$ and $K_omega dot.op a = 1$. But $a^2 = 0$, contradicting the fact that $K_omega$ is characteristic. Hence $\[ A \]$ is primitive. Unimodularity of the intersection form supplies an integral $w$ with $chevron.l w \, A chevron.r = 1$. ◻
]

=== 4.2 An extremal Floer line and Donaldson nonvanishing <an-extremal-floer-line-and-donaldson-nonvanishing>

#thm([Proposition 4.3.])[
  (Donaldson nonvanishing for the closure).  #emph[For the integral determinant $w$ of Lemma 33, there are $m \, a gt.eq 0$ and $h in H_2 \( X_0 \; bb(Z) \)$ such that 
#[#set math.equation(numbering: n => "(4.5)")
 $ h dot.op A = 1 \, #h(2em) D_(X_0)^w \( x_0^m h^a \) eq.not 0 . $ <eq:caps:initial-invariant>]

]
] <prop:caps:nonvanishing>

We prove this by comparing positive Lefschetz words. A pencil on a blowup of $X_0$ supplies the word to be studied; an elliptic surface supplies a model word with a nonzero Donaldson invariant. On a one-dimensional generalized Floer summand the model acts by a nonzero scalar. Conjugation and Hurwitz moves extract the pencil word from a product of model words, forcing its action on that same line to be nonzero. Simple type and the blowup formula then recover the prescribed determinant $w$ on $X_0$.

The argument uses ordinary irreducible gluing in Lemma 12, the Donaldson structure theorem, and the calculation for elliptic surfaces. It does not identify the Donaldson series of an arbitrary symplectic manifold with its Seiberg–Witten series. We begin with the generalized Floer summand on which the comparison will take place.

#thm([Lemma 4.4.])[
  (The product extremal generalized spaces).  #emph[Let $V_g$ be the full determinant-one instanton homology over $bb(C)$ of $Sigma_g times S^1$, with determinant dual to ${ p } times S^1$, where $g gt.eq 2$. Set $S = mu \( Sigma_g \)$ and $P = mu \( x_0 \)$. Every joint eigenvalue $\( lambda \, nu \)$ has $\| lambda \| lt.eq 2 g - 2$. Those with equality are exactly 
#[#set math.equation(numbering: n => "(4.6)")
 $ \( lambda \, nu \) = #scale(x: 120%, y: 120%)[\(] i^r \( 2 g - 2 \) \, \( - 1 \)^r 2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) r = 0 \, 1 \, 2 \, 3 . $ <eq:caps:extreme-spectrum>]

 Each corresponding simultaneous generalized eigenspace has dimension one.]
] <lem:caps:extreme>

#proof[
  The gauge convention matters here. The full group is the determinant-one group of #cite(label("KronheimerMrowka2010")) Section 7.1; Muñoz’s ring calculation uses the additional involution quotient. The spectrum and the conversion between these conventions are described in #cite(label("KronheimerMrowka2010")) Proposition 7.1 and Section 7.2. Proposition 7.4 there states an ordinary eigenspace assertion. We give the extra local-algebra argument needed for a generalized eigenspace, using the localization framework of Muñoz #cite(label("Munoz1999Ring")) Section 5, equations (6)–(7).
  In the quotient ring use Muñoz’s coordinates $alpha = 2 S$, $beta = - 4 P$, and $gamma$. Its invariant summand is $bb(C) \[ alpha \, beta \, gamma \] \/ J_g$, where $J_g = \( R_g^1 \, R_g^2 \, R_g^3 \)$. With $\( R_0^1 \, R_0^2 \, R_0^3 \) = \( 1 \, 0 \, 0 \)$, the recurrences of #cite(label("Munoz1999Ring")) Theorem 16 are
  #[#set math.equation(numbering: n => "(4.7)")
   $ R_g^1 & = alpha R_(g - 1)^1 + \( g - 1 \)^2 R_(g - 1)^2 \,\
R_g^2 & = \( beta + \( - 1 \)^g 8 \) R_(g - 1)^1 + frac(2 \( g - 1 \), g) R_(g - 1)^3 \,\
R_g^3 & = gamma R_(g - 1)^1 . $ <eq:caps:munoz-first>]
  The extreme points of this quotient are
  $ \( a_0 \, b_0 \, 0 \) = #scale(x: 120%, y: 120%)[\(] plus.minus 4 \( g - 1 \) i^g \, thin \( - 1 \)^(g - 1) 8 \, thin 0 #scale(x: 120%, y: 120%)[\)] . $
  Here is an explicit check of the two polynomial facts required for localization. Put $zeta_r = R_r^1$. Eliminating the other two polynomials from the recurrence gives
  $ zeta_(r + 1) = alpha zeta_r + r^2 \( beta + \( - 1 \)^r 8 \) zeta_(r - 1) + 2 r \( r - 1 \) gamma zeta_(r - 2) . $
  For $f_r \( alpha \) = zeta_r \( alpha \, b_0 \, 0 \)$, induction gives
  $ b_0 = - 8 : quad f_(2 m) \( alpha \) & = product_(j = 1)^m #scale(x: 120%, y: 120%)[\(] alpha^2 - 16 \( 2 j - 1 \)^2 #scale(x: 120%, y: 120%)[\)] \, & f_(2 m + 1) \( alpha \) & = alpha product_(j = 1)^m #scale(x: 120%, y: 120%)[\(] alpha^2 - 16 \( 2 j - 1 \)^2 #scale(x: 120%, y: 120%)[\)] \,\
b_0 = 8 : quad f_(2 m) \( alpha \) & = alpha^2 product_(j = 1)^(m - 1) \( alpha^2 + 64 j^2 \) \, & f_(2 m + 1) \( alpha \) & = alpha product_(j = 1)^m \( alpha^2 + 64 j^2 \) . $
  The second even formula is for $m gt.eq 1$, with $f_0 = 1$ separately. For even $g$ use the first row, and for odd $g$ the second. In either case $f_(g - 1) \( a_0 \) eq.not 0$, whereas $a_0$ is a simple root of $f_g$. These are the extreme factors in #cite(label("Munoz1999Ring")) Proposition 20. Thus $R_(g - 1)^1$ is a unit in the localized algebra at this point. Equation (4.7) first forces $gamma = 0$. Since $R_(g - 1)^3$ is divisible by $gamma$, Equation (4.7) then forces $beta = b_0$. The remaining relation $R_g^1 \( alpha \, b_0 \, 0 \) = 0$ has a simple root at $a_0$ by the displayed factors. After localization it therefore forces $alpha = a_0$. The local algebra is $bb(C)$, not a nonreduced extension of $bb(C)$.
  More precisely, the full quotient ring decomposition is
  $ xor.big_(k = 0)^(g - 1) Lambda_0^k H^3 ⊗ bb(C) \[ alpha \, beta \, gamma \] \/ J_(g - k) . $
  The terms with $k > 0$ are primitive exterior-power summands tensored with the analogous quotient for a smaller genus. Their surface eigenvalues have strictly smaller modulus. They contribute nothing to an extreme local algebra. This proves the one-dimensional #emph[generalized] assertion in the quotient theory.
  The full determinant-one group splits into the two eigenspaces of the degree-four involution $tau$, its positive eigenspace being the quotient theory above. The grading character $U$ associated to an eighth root of unity satisfies
  $ S U = i U S \, #h(2em) P U = - U P \, #h(2em) U tau = - tau U . $
  For operators of cohomological degrees two and four one may take $U \|_(V_j) = e^(- pi i j \/ 4)$; the opposite grading convention reverses the character. It exchanges the two sectors, multiplies the surface eigenvalue by $i$, and reverses the point eigenvalue. It carries generalized spaces isomorphically to generalized spaces. Applying it to the two quotient extremes gives all four points in (4.6), with the normalization (4.1). The same ring presentation gives the stated upper bound for every remaining eigenvalue. ◻
]

#thm([Lemma 4.5.])[
  (A nonseparating pencil).  #emph[After blowups at points disjoint from $A$, the tight surfaces, and $Y_0$, the closure $X_0$ admits a genus-$g$ Lefschetz fibration with a section, $g gt.eq 2$, all of whose vanishing cycles are nonseparating. Its positive monodromy word is the identity in the mapping class group of a surface with one marked point.]
] <lem:caps:pencil>

#proof[
  Rationally approximate and scale the symplectic form, and take a sufficiently high-degree Donaldson pencil #cite(label("Donaldson1999")). Let $F_0$ be its fiber and $b = F_0^2$ its positive number of base points. Its genus $g_0$ is large. Since $b^(+) \( X_0 \) > 1$, Taubes’s canonical-class inequality $K_omega dot.op \[ omega \] gt.eq 0$ #cite(label("Taubes1995")) Theorems 1–2 and symplectic adjunction give
  $ 2 g_0 - 2 = F_0^2 + K_omega dot.op F_0 gt.eq b . $
  Use #emph[full] degree doubling: every base point is used in joining the two copies of the punctured old fiber. In the doubling monodromy formula, the new vanishing cycles are nonseparating, and an old separating cycle remains separating only if one of its sides contains no used base point #cite(label("AurouxKatzarkov2008")) Theorem 4. If $C$ is a component of a reducible pencil fiber, then
  $ F_0 dot.op C = k integral_C omega > 0 . $
  A distinct fiber can meet $C$ only at base points. Both sides of every old separating cycle therefore contain used base points, so none remains separating after full doubling. This is also the mechanism in #cite(label("Smith2001")) Theorem 3.10.
  The finite base-point set can be chosen disjoint from the specified surfaces and hypersurface. Blow it up. Any exceptional section marks a point in every regular fiber; the critical handles are disjoint from this section. The monodromy around the sphere is consequently the identity in the pointed mapping class group. The resulting fibration is denoted $tilde(X)_0 arrow.r S^2$. ◻
]

#thm([Lemma 4.6.])[
  (A model word on an elliptic surface).  #emph[For every $g gt.eq 2$ there is a genus-$g$ Lefschetz fibration with a section on a manifold deformation equivalent to $E \( g + 1 \)$, all vanishing cycles nonseparating, whose Donaldson series for the section determinant has a nonzero coefficient at $e^(\( 2 g - 2 \) t)$ on the fiber line.]
] <lem:caps:model>

#proof[
  Put $n = g + 1$. Consider the double cover of $bb(P)_x^1 times bb(P)_y^1$ branched in a smooth curve of bidegree $\( 4 \, 2 n \)$, and project to the $x$-line. A regular fiber is a double cover of the $y$-line branched at $2 n$ points, hence has genus $n - 1 = g$. Fix $y_0$ and impose on the branch polynomial $b$ the condition
  $ b \( x \, y_0 \) = s \( x \)^2 \, $
  where $s$ is a quadratic section with two simple zeros. The equations $z = plus.minus s \( x \)$ above $y = y_0$ give sections. At a zero of $s$, require $partial b \/ partial y eq.not 0$. The total branch curve is then smooth there, its projection to $x$ is unramified, and each displayed section is smooth. The fact that the two sections meet at these points causes no failure of either section to be a section.
  Here is the required genericity away from that slice. Variations vanishing on $y = y_0$ are divisible by its defining linear form; their remaining bidegree is $\( 4 \, 2 n - 1 \)$. They supply first point jets, second vertical jets, and the first vertical jets at two distinct points of any other fixed fiber. Thus singular branch points impose three independent conditions on a two-dimensional point space; triple vertical roots likewise impose three; and two double roots on one fiber impose four conditions on a three-dimensional space of a fiber and two points. A generic member of the imposed affine system has none of these phenomena. The same argument in the projective coordinate charts covers points at infinity. All singular fibers therefore arise from a single simple branch collision. The normalization of such a double cover has $2 n - 2 > 0$ remaining branch points and is connected. Its node is nonseparating.
  The projection to the $y$-line has elliptic regular fiber $F$. To use the elliptic-surface Donaldson series, we must identify the surface together with this fiber class. We first identify a smooth double cover of bidegree $\( 4 \, 2 \)$ with the cubic-pencil $E \( 1 \)$, then use cyclic base change and deformation to obtain the required model of $E \( n \)$. Choose a generic pencil $y_0 A \( x \, z \) + y_1 B \( x \, z \) = 0$ of curves of bidegree $\( 2 \, 2 \)$ on $bb(P)_x^1 times bb(P)_z^1$. Its eight basepoints are distinct and transverse. Its incidence surface is the blowup at these basepoints. Projection of the incidence surface to $bb(P)_x^1 times bb(P)_y^1$ is a finite double cover. Indeed, at a fixed $x$ the two quadratic coefficient vectors are freely variable, and their being proportional is the rank-at-most-one condition on a $3 times 2$ matrix, of codimension two. Allowing $x$ to vary adds only one dimension, so a generic pair has no proportional coefficient vectors at any $x$. The three coefficients of the quadratic in $z$ therefore have no common zero on the $\( x \, y \)$-base. Its discriminant has bidegree $\( 4 \, 2 \)$. The finite map is flat, since its smooth surface source is Cohen–Macaulay and its target is a smooth surface. Locally a flat double cover is $w^2 = b$; its smooth total space therefore implies that its discriminant is smooth.
  Write $H_x \, H_z$ for the ruling classes and $E_1 \, dots.h \, E_8$ for the exceptional classes. The system $\| L \|$, where $L = H_x + H_z - E_1$, is the resolution of projection of the Segre quadric from the first basepoint to $bb(P)^2$. It contracts the two ruling transforms $A_1 = H_x - E_1$, $A_2 = H_z - E_1$ and the seven curves $E_2 \, dots.h \, E_8$. These are nine disjoint exceptional curves; genericity ensures that none of the other seven basepoints lies on those two rulings. The elliptic pencil has fiber
  $ F = 2 H_x + 2 H_z - sum_(i = 1)^8 E_i = 3 L - A_1 - A_2 - sum_(i = 2)^8 E_i . $
  Thus the blowdown sends it to a plane cubic pencil with nine simple basepoints. This is the usual cubic-pencil construction of $E \( 1 \)$, and each blown-up basepoint gives a section.
  Choose a disk in the $y$-sphere containing no critical value and choose two distinct interior points. The connected cyclic degree-$n$ cover of the sphere branched at these two points pulls the discriminant back to a smooth curve of bidegree $\( 4 \, 2 n \)$: over the branch values the elliptic fibers are regular, so the discriminant is transverse to those ruling fibers. Over the complementary disk the base cover consists of $n$ disjoint disks. The inverse image of the chosen disk is a sphere with $n$ boundary circles, since its Euler characteristic is $n - 2 \( n - 1 \) = 2 - n$. The elliptic fibration over the original disk is a product. Its pullback is therefore the same elliptic fiber times this punctured sphere, attached to the $n$ copies over the complementary disk with the product identifications. This is the untwisted iterated fiber sum of $n$ copies of the cubic-pencil $E \( 1 \)$, namely $E \( n \)$. The base-changed section remains a section, so there are no multiple fibers.
  Finally choose one $y$-ruling fiber transverse to both this pullback discriminant and the smooth discriminant constructed above with the required genus-$g$ sections. Smooth divisors of bidegree $\( 4 \, 2 n \)$ transverse to this fixed ruling fiber form a nonempty Zariski-open subset of the projective linear system, hence are path connected. Over the corresponding connected open subset of nonzero sections in $H^0 \( bb(P)^1 times bb(P)^1 \, cal(O) \( 4 \, 2 n \) \)$, the equations $z^2 = b$ in the fixed line bundle $cal(O) \( 2 \, n \)$ form a proper holomorphic family of smooth double covers. Thus our cover is complex deformation equivalent to the cyclic-base-change cubic-pencil model of $E \( n \)$. Along a smooth path within this open set the double covers form a proper smooth family; the inverse images of the chosen ruling fiber form a smooth subfamily. A lift of the parameter vector field tangent to this subfamily integrates to an orientation-preserving diffeomorphism carrying the elliptic fiber to the elliptic fiber. Thus our model is diffeomorphic to $E \( n \)$ with its required class $F$ preserved.
  If $G_f$ denotes the genus-$g$ fiber, then $F dot.op G_f = 2$ and $G_f^2 = 0$. The elliptic-surface Donaldson calculation has extreme basic classes $plus.minus \( n - 2 \) F$ with nonzero coefficients, all other basic classes having smaller evaluations on $G_f$ #cite(label("KronheimerMrowka1995")); the elliptic series is computed in #cite(label("FintushelStern1997")) Section 6, Theorem 6.7, arXiv version 1, with its parameters $p = q = 1$. In the convention with determinant even on $F$, its series has the factor $sinh \( F \)^(n - 2)$, times a nonzero constant and $exp \( Q \/ 2 \)$. Either genus-$g$ section $z = plus.minus s \( x \)$ above $y = y_0$ lies in an elliptic fiber, so its dual determinant has zero evaluation on a generic $F$; other determinant conventions change the nonzero basic coefficients only by signs. Therefore
  #[#set math.equation(numbering: n => "(4.8)")
   $ cal(D)_(E \( n \))^(upright("section")) \( t G_f \) := D_(E \( n \))^(upright("section")) #scale(x: 120%, y: 120%)[\(] \( 1 + x_0 \/ 2 \) e^(t G_f) #scale(x: 120%, y: 120%)[\)] $ <eq:caps:model-series>]
  has nonzero extreme exponential coefficients at $plus.minus 2 \( n - 2 \) = plus.minus \( 2 g - 2 \)$, as claimed. ◻
]

#proof[
  Let $g$ be the genus of the pencil on $tilde(X)_0$ supplied by Lemma 36. Remove products over two regular disks from the genus-$g$ model fibration of Lemma 37. Its remaining Lefschetz word is an annular cobordism with both ends identified with the marked product $Sigma_g times S^1$. Use the determinant dual to its actual section, including its induced collar identifications. Let $M$ be its ordinary map on $V_g$, and let $u_g \, v_g$ be the state and costate of the two marked product-disk pieces. The annular map commutes with $S$ and $P$: represent a fiber or point insertion on either product collar and move it across the annulus. The even degrees introduce no insertion-order sign. Ordinary admissible compactness, the support budget in Lemma 38 below, and fixed-transition gluing of Lemma 12 justify this operation. In particular no simple-type assertion about a relative piece is being used.
  By primary decomposition for two commuting endomorphisms of a finite-dimensional vector space, their simultaneous generalized spectral projectors are polynomials in $S \, P$. The nonzero extreme exponential coefficient in (4.8), computed by capping $M$, therefore gives an extreme line $V_(*)$ on which
  #[#set math.equation(numbering: n => "(4.9)")
   $ v_g Pi_(*) M Pi_(*) u_g eq.not 0 . $ <eq:caps:three-factors>]
  Lemma 35 says that this space has dimension one. Consequently the projected disk state, projected disk costate, and restriction of $M$ are all nonzero; the last is a nonzero scalar.
  The conclusion does not depend on arranging a common sign for all monomial gluing conventions in advance. Indeed, consider the two sequences with $j$ fiber insertions and respectively zero and one point insertion. The extreme exponentials in (4.8) imply that at least one sequence has upper exponential growth rate at least $2 g - 2$. Multiplying its terms by orientation signs preserves this rate. If every extreme projection of the disk–annulus–disk composition vanished, its terms would instead be bounded by a polynomial in $j$ times $rho^j$ for some $rho < 2 g - 2$, by the Jordan decomposition. This is impossible. Thus some extreme line always satisfies (4.9). The normalization of $S \, P$ is fixed by (4.1); the ordinary gluing has no additional factor accumulating with each insertion.
  Let $a_1 dots.h.c a_N$ be the pointed positive word of $tilde(X)_0$. Every $a_i$ is a twist on a nonseparating curve away from the mark. These curves form one orbit of the pointed mapping class group. For each $i$ conjugate a copy of the model word so that a selected first twist is $a_i$. A marked oriented fiber identification, a compatible determinant identification, or continuation induces an isomorphism on Floer homology commuting with $S \, P$. Its restriction to $V_(*)$ is nonzero. Each conjugated model word thus acts by a nonzero scalar on the same $V_(*)$, and so does their product.
  Extract the selected twists to the front in their prescribed order. The elementary Hurwitz exchange for a preceding positive word $R$ is
  #[#set math.equation(numbering: n => "(4.10)")
   $ R a = a \( a^(- 1) R a \) . $ <eq:caps:hurwitz>]
  It leaves the selected $a$ unchanged and replaces $R$ by a positive conjugated word. Repeated use gives the factorization $\( a_1 dots.h.c a_N \) R'$ of the product of the model words. The whole word and its prefix are pointed identity words; therefore so is $R'$. Cutting between them gives marked product boundaries, and the composite of their maps is nonzero on $V_(*)$. Both factors, in particular the desired prefix, are therefore nonzero there.
  We spell out why this word operation preserves the data needed by the gauge theory. A pointed Lefschetz cobordism is built from a marked product by attaching the ordered Lefschetz two-handles away from the section track. Hurwitz changes are changes of vanishing paths for those handles; conjugation is a change of marked fiber identification. The section track remains straight in the attaching coordinates. The prefix is therefore the cobordism of $tilde(X)_0$, with its section, up to its boundary identifications. There is no additional loop-of-identifications invariant: contractibility of $"Diff"_0 \( Sigma_g \)$ and the point-evaluation fibration, with its fiber based at the identity, give $pi_1 \( "Diff"_0 \( Sigma_g \, p \) \) = pi_2 \( Sigma_g \) = 0$ #cite(label("Gramain1973")) Theorem 1 and Section 1.1, Proposition 1. Capping the marked section is allowed to have nonzero normal Euler number. At every step the determinant is dual to this tracked section, with its fixed transition functions; we never replace it by a sum over possible seam lifts.
  One can track the normal Euler number explicitly by replacing the marked point with a small disk. Each twist away from the mark has its canonical lift fixing the disk boundary. A pointed identity word has product $t_partial^e$ in this boundary-fixing mapping class group, where $t_partial$ is the central boundary twist and $e$ records the section’s normal Euler number (with the convention $e = - \[ upright("section") \]^2$). The Hurwitz exchange (4.10) holds for these canonical lifts. Lifts of a pointed conjugator differ by a central boundary twist, which cancels in conjugation. The extracted prefix therefore has exactly the canonical lifted word, and hence the section Euler number, of the original pencil. The complement carries the sum of the model exponents minus the prefix exponent; no factor is required to have exponent zero. Its actual section determinant and boundary identifications are transported throughout. A change of marked product identification transports the disk states by an isomorphism commuting with $S \, P$, so their nonzero projections to $V_(*)$ remain nonzero.
  Cap the prefix with the two nonzero projected disk states. Since $V_(*)$ is a line, the resulting projected composition is nonzero. The projector is a polynomial in $S \, P$, so some monomial of fiber and point insertions gives a nonzero ordinary Donaldson invariant on $tilde(X)_0$. Insertions may be placed on separate product collars. Their exact geometric representatives and closed interpretation are justified in Lemmas 38 and 39 below; those lemmas apply to these admissible product boundaries as well as to $Y_0$.
  We have obtained a nonzero invariant on $tilde(X)_0$ for its section determinant. It remains to pass to the prescribed determinant $w$ and remove the pencil blowups. The tight surface $B$ survives these blowups, so the tight-surface simple-type theorem #cite(label("KronheimerMrowka1995")) Theorem 8.1 applies to $tilde(X)_0$, which is simply connected with odd $b^(+) > 1$. A nonzero invariant then implies a nonzero $\( 1 + x_0 \/ 2 \)$-series. To see that no cancellation is hidden in this assertion, simple type reduces every point power using $x_0^2 = 4$, while, for fixed surface degree $a$, the terms $D \( h^a \)$ and $D \( x_0 h^a \)$ have degrees differing by four. Only one can satisfy the fixed determinant index congruence modulo eight.
  The basic-class structure theorem expresses this series as
  #[#set math.equation(numbering: n => "(4.11)")
   $ cal(D)^(w') \( h \) = e^(Q \( h \) \/ 2) sum_j \( - 1 \)^(\( \( w' \)^2 + K_j dot.op w' \) \/ 2) beta_j e^(K_j dot.op h) \, $ <eq:caps:structure-series>]
  with distinct $K_j$ and nonzero $beta_j$ independent of $w'$ #cite(label("KronheimerMrowka1995")) Theorem 1.7. Changing to the pullback of $w$ changes coefficients only by signs and cannot annihilate this sum of distinct exponentials. The pullback blowup formula #cite(label("KronheimerMrowka1995")) Proposition 1.9 has a nonzero exceptional factor, so nonvanishing of that pullback series implies nonvanishing of the series on $X_0$. Thus some homogeneous polynomial $h mapsto D_(X_0)^w \( x_0^m h^a \)$ is nonzero.
  The affine integral lattice ${ h : h dot.op A = 1 }$ is nonempty because $A$ is primitive, and is Zariski dense in its affine hyperplane. A nonzero homogeneous polynomial cannot vanish on that whole hyperplane: rescaling it would make it vanish on the open set $h dot.op A eq.not 0$. There is therefore an integral point in the hyperplane at which the polynomial is nonzero. For $a = 0$ any integral point of that hyperplane will do. This proves (4.5). ◻
]

=== 4.3 Labelled probes and their exact representatives <labelled-probes-and-their-exact-representatives>

The closure is cut along $Y_0$, while the fixed caps must meet along the rational homology sphere $Y_2$. Inserting a positive number of copies of the bridge $T = f_(-) phi.alt^(- 1) f_(+)$ from Corollary 22 creates such a seam. To retain a nonzero invariant we must also carry the surfaces across these copies; the ordinary map $T$ alone does not record their insertions. We keep the occurrences separately labelled and construct a finite deformation of the Floer complex that records them. Its algebra will show that some positive power of the deformed bridge still has a nonzero pairing.

Represent the $a$ occurrences of $h$ in (4.5) by separately labelled oriented surfaces. Their intersections with $Y_0$ all represent the meridian class in $H_1 \( Y_0 \; bb(Z) \)$, since $h dot.op A = 1$. A surface cobordism between homologous one-cycles in $Y_0$, inserted in a collar together with its reverse, changes each intersection to a prescribed meridian $gamma_i$. Choose the $gamma_i$ to be disjoint parallel loops. General position and tubing give pairwise transverse representatives with no triple intersections. Put the $m$ point representatives in one cap, disjoint from all of them.

The two handle halves of $T$ are simply connected, so the meridian loops bound relative surfaces on the two halves separately. Fix these surfaces, joining the corresponding labels at the two ends of $T$. Choose its determinant with evaluation one on both end copies of $A$ and the prescribed trivialization at its internal rational seam. The increasing-handle coordinates in Section 2 give precisely these restrictions. Glue it to $w$ and repeat the same determinant transitions for every copy of $T$. The closed manifold obtained by inserting $T^k$ in $X_0$ at $Y_0$ is denoted $X'_k$, with $X'_0 = X_0$.

#thm([Lemma 4.7.])[
  (Exact cuts and the low-dimensional support budget).  #emph[For the labelled surfaces just described, and also for the separated fiber and point insertions used above, the exact adjoint tests can be chosen coherently on cylinders, caps, and cobordisms. In cut dimensions zero and one, their compactifications have only the ordinary irreducible breaking strata. No curvature particle contributes. These statements hold for the parameterized comparisons of exact tests as well.]
] <lem:caps:labelled-compactness>

#proof[
  At a fixed or moving point, use the dependence locus of two sections of the universal complexified adjoint bundle of rank three. Its principal stratum has complex codimension two, hence real codimension four, and represents
  $ c_2 \( "ad" E ⊗ bb(C) \) = - p_1 \( "ad" E \) . $
  The zero-rank stratum has larger codimension and is avoided in the dimensions at issue. A moving point on an oriented surface contributes two position parameters, so its net cut degree is two. A fixed point has degree four.
  The section construction of Proposition 94 uses holonomy and frame-equivariant sampled transports from the marked point to finite systems of loops detecting irreducibility. The center acts trivially on the adjoint output. Irreducibility gives full value variation at the output, hence transverse choices of the two sections. On a cylinder the choices are translation invariant relative to the mark; on cobordisms they approach those choices at the ends. The sampling terms carry small-ball energy cutoffs along their paths. For thin paths one uses arbitrarily fine path libraries, with sufficiently rapidly decreasing coefficients. The cutoff limits include curvature atoms in the limiting energy measure. Thus a term either has its prescribed convergent off-atom transport or is cut off when its sampling neighborhood acquires an atom. Loop systems avoiding a given finite set of atoms still detect irreducibility and still give independent value variations. The resulting exact cut condition persists unless its marked point itself hits a curvature atom. On a particle stratum the retained equation is allowed to depend on its retained atom positions. Indeed a smooth sampling cutoff replaces its energy argument by
  $ integral rho thin \| F_a^0 \|^2 + 8 pi^2 sum_j ell_j rho \( p_j \) \, $
  which is smooth in the positions $p_j$ on that stratum. Thus persistence means convergence to a section on the residual-field-and-particle stratum, not necessarily to the ordinary section on the residual field alone. The latter equality is not needed for the dimension budget. This is the support-exact feature for which the construction, rather than a representative depending indiscriminately on a whole surface neighborhood, is needed here.
  Choose parameters transverse simultaneously on all lower-charge strata, including remaining marks and the positions of particles. This remains possible for the particle-dependent sections just described: at any such configuration a detecting graph and sufficiently small sampling balls can avoid the finite atom set, and the associated surviving term has unrestricted adjoint output variation. The particle positions are counted once among the stratum parameters, not again as new cut data. Ends carrying the odd determinant on $A$ are admissible. Every nonconstant cylinder level and every cobordism piece considered in this labelled construction is consequently irreducible. A constant critical cylinder cannot carry a generic mark: modulo translation its mark has only the one loop coordinate, against a codimension-four condition. Floer compactness therefore assigns any escaping mark to a nonconstant trajectory level, unless that mark hits an escaping particle.
  For a compact-part particle, the precise budget is as follows. The “Released degree” column records the net degree of discarded cuts, after their mark parameters are included.
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Position of the particle
], table.cell(rowspan: 1, colspan: 1)[Released degree
], table.cell(rowspan: 1, colspan: 1)[Position dimension
], table.cell(rowspan: 1, colspan: 1)[Sum
]),
  table.cell(rowspan: 1, colspan: 1)[Outside the supports
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
  table.cell(rowspan: 1, colspan: 1)[On one surface
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
  table.cell(rowspan: 1, colspan: 1)[At two transverse surfaces
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
  table.cell(rowspan: 1, colspan: 1)[At a fixed point
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
)
]
  There are no triple intersections or point–surface incidences. If the lost charge is $ell$ and it is carried by $r$ distinct particles, then $r lt.eq ell$, while the ASD index drops by $8 ell$. The residual cut stratum, with particle positions retained, therefore has dimension at most
  #[#set math.equation(numbering: n => "(4.12)")
   $ d - 8 ell + 4 r lt.eq d - 4 ell \, $ <eq:caps:bubble-budget>]
  where $d$ is the original cut dimension, including any comparison parameter. This is negative for $d lt.eq 1$ and $ell > 0$. The same reasoning applies on extracted nonconstant cylinder levels. If an atom escapes along a constant-flat region with no nonconstant level retained there, it can discard at most one label, since the parallel cylindrical supports $bb(R) times gamma_i$ are disjoint. All equations on retained levels persist, so this case is at least as strongly excluded. This is the incidence estimate of Lemma 99 in the present setting.
  At the remaining broken configurations, exponential convergence to nondegenerate critical points and Lemma 12 give exactly the products of the cut factors. The increasingly distant sampling offsets may be truncated on long gluing collars with faster than exponential tails; their errors then lie within the ordinary gluing estimates. Section choices and determinant-line orientations are compatible with these products. Thus the only ends of an oriented one-dimensional cut moduli space are its ordinary irreducible breaks and its prescribed comparison endpoints. ◻
]

#thm([Lemma 4.8.])[
  (Comparison with closed Donaldson insertions).  #emph[The closed counts obtained from these exact tests and the fixed transition functions are the Donaldson invariants for that determinant, with each surface and point class replaced by its multiple $4 mu$. They have no additional sum over determinant lifts. The assertion applies to $X'_k$ and to the fiber gluings used in Proposition 34.]
] <lem:caps:closed-comparison>

#proof[
  All the $X'_k$ are simply connected: the original two halves and the handle halves of $T$ are simply connected, and Van Kampen applies at each connected seam. They retain a tight surface and $b^(+) > 1$. Their determinants remain odd on the retained copies of $A$. The same properties needed here hold for the simply connected model and pencil manifolds. We first explain comparison from long admissible collars, where the Floer perturbation was chosen before the gluing length.
  A reducible would have integral line difference $d$ with odd evaluation on every odd-class slice. On a fixed slice metric its tangential curvature therefore has a uniform positive $L^2$ lower bound, by pairing with a fixed dual form and Cauchy–Schwarz. Integrated along a long product collar this lower bound grows linearly with its length. The near-ASD equation, with gradient-type Floer perturbation and sufficiently small remaining error, converts it to a growing lower bound for the charge on that product. Other admissible collars have the same property, and their gradient energy identities have endpoint terms that telescope. In a fixed total charge range this rules out a reducible while the Floer perturbations are turned off on collars that are still sufficiently long. It is therefore legitimate to perform this first step with the earlier fixed small Floer data; no reversal of the order of smallness and gluing length is required. Thereafter choose a generic path to an unperturbed closed metric, with perturbations as small as needed. Generic periods exclude the finitely relevant reducible classes throughout this path; $b^(+) > 1$ permits a generic one-parameter path. The bubble budget (4.12) applies to these comparison homotopies.
  Localize the exact section data near the surface representatives and in small disjoint point balls at the final generic unperturbed metric. An irreducible ASD connection on one of these simply connected manifolds is locally irreducible: a local parallel line extends by ASD unique continuation, and simple connectivity removes monodromy of this extension. An irreducible flat exception cannot occur. Thus the localized choices retain the needed independent transversality. For a fixed point the adjoint rank-drop locus is already the usual geometric representative of $- p_1$ on its ball.
  For a surface compare one test at a time. Omit that degree-two test; the remaining partially cut ASD moduli space has dimension two. It is compact. Indeed, take the chosen small neighborhoods so that at most two surface neighborhoods meet at any point and no point ball meets a surface neighborhood. If a particle occurs, discard the tests whose neighborhoods contain it. At most degree four is released per particle. For this argument project to the residual ASD solution and ignore particle-position parameters: every sampling graph, output, and cutoff for a retained test lies in its atom-free neighborhood. Consequently these retained equations are exactly the ordinary lower-level local equations and are independent of particles outside their neighborhoods. This localization, unlike the earlier general particle-stratum argument, is what permits forgetting the positions. The residual problem has dimension at most $2 - 8 ell + 4 ell < 0$. Hence it has no solutions. This establishes the compactness needed for the comparison, rather than assuming compactness of an arbitrary partially cut moduli space.
  On this compact two-dimensional space the moving-point intersection number is exactly the slant product of $c_2 \( "ad" E ⊗ bb(C) \)$ with the surface. By (4.1) it is $4 mu$ of that surface. Replacing the surface tests one at a time identifies the full count with the ordinary Donaldson intersection number, and the point tests contribute $4 mu \( x_0 \)$ in the same normalization. Generic homotopies of these exact tests have no extra ends by Lemma 38.
  Finally, the glued transition functions are fixed actual determinant-preserving bundle identifications, not arbitrary projective identifications with a prescribed characteristic class. A projective seam automorphism has an obstruction in $H^1 \( Y \; bb(Z) \/ 2 \)$ to lifting to the determinant-one gauge group. A nonzero obstruction excludes that automorphism from the matching group at the outset, even if it would preserve $c_1$ and $c_2$. The full determinant-one Floer complex likewise keeps distinct the orbits related by such a nonliftable twist.
  For the remaining, liftable automorphisms, obstruction theory on the three-manifold identifies components of the determinant-one gauge group with $H^3 \( Y \; bb(Z) \)$: its fiber $"SU" \( 2 \)$ is two-connected, and conjugation acts trivially on $pi_3 \( "SU" \( 2 \) \) = bb(Z)$. Thus a degree-zero allowed automorphism is homotopic to the identity. A nonzero degree changes $c_2$ and changes the ASD index by eight times that degree. The actual zero-dimensional index fixes this remaining integer. In the pointed word construction the actual section and its dual determinant transport these identifications through every conjugation and Hurwitz move. Therefore ordinary gluing here counts the required fixed determinant problem; neither a hidden $H^1 \( Y \; bb(Z) \/ 2 \)$ twist nor a new sum of lifts is introduced.
  This restriction on matching isomorphisms does not omit closed connections. Fix the actual closed rank-two bundle $E$ with the prescribed determinant and second Chern class, and restrict it to the pieces using the transition induced by $E$. Every closed connection on $E$ has literal restrictions with equal full determinant-one boundary orbits. Compactness and gluing are performed in that gauge convention. A projective change of gauge with nonzero lifting obstruction can move one full boundary orbit to another; the composition sums over all full orbits and does not quotient by this action. Thus such boundary states are retained, rather than their corresponding closed solutions being discarded. Ordinary maps also retain all compatible relative bundle sectors. Their integer degree bookkeeping sums to $c_2 \( E \)$ at the selected total index. Conversely a full-state match with these fixed determinant transitions and this total degree glues a rank-two bundle with $c_1 \( E \) \, c_2 \( E \)$, hence the prescribed closed bundle, since these classes classify rank-two complex bundles over a four-dimensional complex. The usual determinant-one gauge-matching quotient identifies its connections with the closed gauge orbits, and Lemma 12 gives multiplicity one. This applies in particular to the annulus–disk compositions above.
  For comparison, the published Fukaya–Floer gluing formula in #cite(label("Munoz1999FukayaFloer")) Theorem 3.1 uses a convention permitting an additional nonliftable seam twist and has a corresponding sum of two determinant invariants. We have instead constructed and glued the determinant-one counts with fixed collars; that published sum is not being invoked as a fixed-lift formula. ◻
]

=== 4.4 The finite deformation and a positive power of the bridge <the-finite-deformation-and-a-positive-power-of-the-bridge>

Let $C$ be the ordinary integral admissible Floer complex of $Y_0$, with its fixed determinant. Tensor with $bb(Q)$ when needed. Keep the labels distinct and set

#[#set math.equation(numbering: n => "(4.13)")
 $ L_a = bb(Q) \[ t_1 \, dots.h \, t_a \] \/ \( t_1^2 \, dots.h \, t_a^2 \) \, #h(2em) J = \( t_1 \, dots.h \, t_a \) . $ <eq:caps:label-ring>]

The variables have even parity (one may give each degree $- 2$). For a subset $P subset { 1 \, dots.h \, a }$ write $t_P = product_(i in P) t_i$. For $a = 0$, use $L_0 = bb(Q)$.

#thm([Proposition 4.9.])[
  (Finite labelled Floer construction).  #emph[There are a differential $d_L$ on $C_L = C ⊗ L_a$, a cycle $u in C_L$, a cocycle $v in "Hom"_(L_a) \( C_L \, L_a \)$, and a chain map $T_L : C_L arrow.r C_L$ such that $T_L med mod med J = T$. The all-label coefficient of $v T_L^k u$ is, up to a fixed nonzero normalization and orientation sign, the closed Donaldson invariant on $X'_k$ with the indicated labelled closed surfaces and fixed point insertions. In particular, 
#[#set math.equation(numbering: n => "(4.14)")
 $ \[ t_1 dots.h.c t_a \] \( v u \) eq.not 0 . $ <eq:caps:coefficient-zero>]

]
] <prop:caps:labelled>

#proof[
  For each subset $P$, count cylinder trajectories with one moving point on $bb(R) times gamma_i$ and its codimension-four adjoint test for every $i in P$. A rigid such trajectory has unparametrized index $2 \| P \|$, or parametrized trajectory index $1 + 2 \| P \|$. Let its count be $d_P$, and set
  $ d_L = sum_P t_P d_P . $
  Do not retain a mark or a test for a label outside $P$. Define the cap coefficients $u_P \, v_P$ by the corresponding relative surfaces in the caps and their fixed point insertions. Define $\( T_L \)_P$ by the relative surfaces in $T$. All these counts use the exact tests of Lemma 38.
  The oriented boundary of a one-dimensional cylinder space is a broken pair with each label assigned to exactly one factor. Its algebraic identity is
  $ sum_(P_1 union.sq P_2 = P) d_(P_1) d_(P_2) = 0 . $
  This is exactly the coefficient of $t_P$ in $d_L^2$, since repeated labels vanish in $L_a$. The same boundary calculation on a cap or a cobordism gives $d_L u = 0$, $v d_L = 0$, and $d_L T_L = T_L d_L$, with the prescribed common grading sign if that convention is used. End-generator orientation lines are paired by ordinary determinant-one composition. All insertion degrees are even, so distributing labels introduces no additional Koszul sign. There are no factorials: these are distinct labels, each used at most once.
  Stretch the $Y_0$ seams in the closed manifold. Its ends are admissible. Lemma 38 excludes particles and unwanted constant levels, and Lemma 12 gives the product of the cut factors, with labels distributed among them. This is precisely the coefficient expansion of $v T_L^k u$. The fixed transition data and Lemma 39 identify each coefficient with its actual fixed-determinant Donaldson invariant. At $k = 0$, the all-label coefficient is the nonzero invariant (4.5), multiplied by $4^(a + m)$ and the fixed orientation sign. This proves (4.14). ◻
]

#thm([Lemma 4.10.])[
  (Nilpotent deformation and positive powers).  #emph[There is $k gt.eq 1$ for which 
#[#set math.equation(numbering: n => "(4.15)")
 $ \[ t_1 dots.h.c t_a \] \( v T_L^k u \) eq.not 0 . $ <eq:caps:positive-coefficient>]

]
] <lem:caps:positive-power>

#proof[
  By Corollary 22, $T$ is a rational quasi-isomorphism. Filter the mapping cone of $T_L$ by powers of $J$. Since $J^(a + 1) = 0$, this is a finite filtration. Its associated graded complex is a direct sum of copies of the rational mapping cone of $T$, tensored with the finite-dimensional spaces $J^r \/ J^(r + 1)$, and is acyclic. Induction through the short exact sequences of filtration steps shows that the cone of $T_L$ is acyclic. Therefore the induced endomorphism $F$ of $H_(*) \( C_L \)$ is an automorphism. This homology is finite-dimensional over $bb(Q)$; no freeness over $L_a$ has been asserted or needed.
  Let $N = dim_(bb(Q)) H_(*) \( C_L \)$ and write the characteristic polynomial of $F$ as $a_0 + a_1 s + dots.h.c + a_N s^N$. Its constant coefficient is nonzero because $F$ is invertible. Cayley–Hamilton gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ "id" = - a_0^(- 1) sum_(j = 1)^N a_j F^j . $ <eq:caps:cayley-hamilton>]
  Apply the functional $\[ t_1 dots.h.c t_a \] thin v \( thin dot.op thin \) u$ to this identity on homology. Its value on the identity is nonzero by (4.14). At least one positive-power value must therefore be nonzero, proving (4.15). ◻
]

=== 4.5 Moving all probes into the final caps <moving-all-probes-into-the-final-caps>

Fix a positive $k$ supplied by Lemma 41. The associated nonzero closed count on $X'_k$ has only even-degree insertions. The dimension congruence consequently forces $b^(+) \( X'_k \)$ to be odd; $b_1 = 0$ and the ASD dimension is $8 kappa - 3 \( 1 + b^(+) \)$. Split $X'_k$ at an internal rational $Y_2$ seam. Since $H_1 \( Y_2 \; bb(Q) \) = H_2 \( Y_2 \; bb(Q) \) = 0$, Mayer–Vietoris gives

#[#set math.equation(numbering: n => "(4.17)")
 $ H_2 \( X'_k \; bb(Q) \) = H_2 \( C_(-)^0 \; bb(Q) \) xor H_2 \( C_(+)^0 \; bb(Q) \) . $ <eq:caps:homology-split>]

Expand each probe class with this direct sum and use multilinearity of the closed invariant. The resulting finite sum is nonzero, so at least one allocation of all the probes to the two cap interiors has nonzero value. Clear its rational denominators. Integral surface classes in a cap have embedded oriented representatives in its interior, after resolving double points if necessary. Take separate representatives for separate labels, arrange pairwise transversality without triple points, and keep them disjoint from the point probes.

Each $C_plus.minus^0$ is simply connected by the same handle-half and Van Kampen argument used above. It contains its old tight surface $B$, so it has $b^(+) > 0$, and contains a copy of $A$ on which its determinant evaluates as one. Its determinant is trivialized at the rational boundary. Blow up one further point in the interior of each cap, away from all these surfaces and probes. Extend the determinant with zero exceptional evaluation. The pullback blowup formula #cite(label("KronheimerMrowka1995")) Proposition 1.9, restricted to the old homology, preserves the invariant, because its exceptional factor has constant term one. Denote the resulting caps by $C_(-) \, C_(+)$.

#thm([Proposition 4.11.])[
  (Cap periods and the ordinary pairing).  #emph[Generic period choices on the old cap parts exclude reducible ASD cap solutions in the bounded charge ranges needed for the cap cycles, comparison homotopies, and the closed pairing. After sufficiently long finite isolation of the separate exceptional summands, and sufficiently small ordinary Floer data, stretching the common $Y_2$ seam computes the nonzero allocated invariant as the pairing of a cycle and a cocycle on the irreducible complex.]
] <prop:caps:periods>

#proof[
  For a reducible with determinant $c$, its integral line difference is $d = 2 l - c$ for some integral $l$. In particular
  $ d \( A \) equiv c \( A \) = 1 med \( mod med 2 \) \, $
  so $d$ is nonzero in rational cohomology. A reducible ASD solution with rational flat end would require $d^(+) = 0$. Since $b^(+) \( C_plus.minus \) > 0$, generic cap periods avoid this condition. The precise cap version of the period argument, including compactly supported metric variation, small perturbations, bounded charge, and the long isolated exceptional summand, is Proposition 72. Its metric choices apply here because the old cap contains both $A$ and $B$ and the probes are supported away from the isolated summand.
  One must use its bounded-charge conclusion, rather than claiming that arbitrary cap data give the same cap states. Here are the charge bounds that supply its hypothesis. Let $z_W$ be the local probe degree on one cap. Its cycle entries have actual index $i = z_W$, and the one-dimensional spaces giving the cycle identity have $i = z_W + 1$. For a comparison with $t in { 0 \, 1 }$ parameters the corresponding condition is $i + t - z_W in { 0 \, 1 }$. Only these finitely many integer indices occur. With fixed reference lifts for the finitely many end generators $alpha$, the APS formula takes the form
  $ i = 8 kappa + b_W \( alpha \) . $
  The boundary correction $b_W \( alpha \)$ is uniformly bounded as the ordinary perturbations become sufficiently small. Indeed the flat moduli space is compact; elliptic spectral estimates bound uniformly the number of eigenvalues near zero, so only uniformly finitely many such eigenvalues can contribute integer spectral-flow jumps under a small perturbation. The smooth boundary and transgression terms are also bounded on this compact family near the flat moduli space. At a central flat the correction is explicitly $- 3 \( 1 + b^(+) \( W \) \)$ by Equation (2.2). Thus all these cap problems have a bounded charge range, including reducible candidates before period exclusion. The closed pairing has the fixed total charge
  $ 8 kappa_(upright("closed")) = z + 3 \( 1 + b^(+) \( X \) \) . $
  These bounds do not deteriorate with a Floer collar length. On a gradient collar the perturbed Chern–Simons identity bounds the topological charge below by the difference of the bounded perturbation at its two endpoints, with a fixed error from the permitted integrable non-gradient terms. Summing through successive segments or broken levels telescopes those endpoint terms. Thus the charge of an entire outgoing chain has a lower bound independent of its length and of the number of levels. Subtracting this bound from the fixed total charge bounds the charge on the compact cap part from above. The same argument applies to either cap in the closed pairing, using the fixed local geometry on the other compact part. Chern–Weil then bounds the curvature on compact parts. On a prefix of length $N$, the remaining small self-dual error contributes at most a fixed constant times $delta^2 N$, so the bound has the form
  $ integral_(upright("cap and prefix through ") N) \| F_a^0 \|^2 lt.eq E_(cal(P)) + C_W delta^2 N . $
  Here $E_(cal(P))$ can depend on the fixed finite problem, while the coefficient of $N$ is controlled by the fixed collar data. This is the prefix bound required for the exponentially decreasing harmonic cutoff tails in Proposition 72. It also covers central outgoing chains; their later dimension exclusion is not used to obtain this energy bound. A formal infinite tail may be asymptotic to a perturbed nonflat connection, so no finite unperturbed curvature norm on that entire tail is asserted. Isolation depths and smallness thresholds can now be chosen for all the fixed index ranges just listed.
  Count regular irreducible cap solutions with their local cuts, obtaining $x$ and $y$. Bubbling is absent by the exact support budget of Lemma 38. Reducible cap pieces are absent by the period choice. At a central seam the three-dimensional central stabilizer contributes three matching indices, as in Lemma 16. Each of the two irreducible cap pieces has nonnegative residual dimension after its local cuts. Such a central matching therefore cannot occur in a zero-dimensional closed count. More generally a maximal central cylinder group includes its exterior matchings and has the same surplus of at least three. At a central end in a cap-cycle identity it must also have the requisite nonconstant outgoing trajectory. It cannot be an end of a one-dimensional cut cap moduli space. The only remaining boundary points are ordinary irreducible Floer breaks. Their signed sum gives $partial x = 0$ and $y partial = 0$.
  At a sufficiently long finite common neck, every rigid closed solution is therefore an irreducible match of two rigid cap solutions. Conversely each such match glues by Lemma 12. Fixed determinant transitions identify the glued bundle, and cancelling adjacent orientation lines gives the closed count up to its fixed comparison sign. There is no extra factor of two from the common central subgroup ${ plus.minus 1 }$ of an irreducible stabilizer: it is already included in the determinant-one gluing convention. We obtain the pairing $y x$, which equals the nonzero allocated invariant up to the nonzero $4 mu$ normalization. ◻
]

#proof[
  Use the caps and probes just constructed and Proposition 42. Their topology gives (i) and (ii), and their ordinary pairing gives (iii). All exact point and surface classes are integral multiples of the Donaldson classes. The remaining rational factors come from the fixed denominators in (4.17) and, if used, rational perturbation weights. Clearing these fixed denominators yields integral cycles and cocycles in the finite integral complex, while multiplying $y x$ by a nonzero integer. Let $z$ be the sum of the real degrees of the resulting fixed probes. This proves (iv), with the extension of the cap period choices supplied by Proposition 72.
  For later metric choices, recompute the pairing by stretching the same seam in the old closed, blown-up manifold. Its fixed-determinant closed Donaldson invariant is unchanged because $b^(+) > 1$; the exact-test comparison is Lemma 39. The cap period exclusion and central matching budget apply again at those choices. This proves the last assertion without requiring separate metric-independence of either individual cap state. ◻
]

== 5 The stack, its lifts, and the nonzero instanton count <sec:stack>

We now arrange the ordinary maps and the fixed cap pairing into a closed family with a nonzero integer count. The cap pairing is nonzero over $bb(Q)$, while the maps are units modulo two. Repetition on the free integral Floer lattice will reconcile these two inputs and make the coupled Dirac index positive. Before choosing that repetition, we compute the stack’s lift data and identify its actual count in the metrics used for the spinor argument. That identification requires a separate exclusion of central limits at rational seams; invariance of the individual maps alone does not supply it.

Throughout this section, the diffeomorphism $phi.alt : Y_(- 2) arrow.r Y_2$ is the arbitrary oriented cosmetic identification fixed in Section 2. No compatibility with the knot exterior is imposed. We use the caps of Theorem 32, their fixed compact probes of total real degree $z$, and the signed negative interval map $B : C \( Y_2 \) arrow.r C \( Y_(- 2) \)$ of Theorem 23. Put

$ H = f_(+) f_(-) : C \( Y_(- 2) \) arrow.r C \( Y_2 \) . $

Thus $H$ is the ordinary rigid map along $- 2 arrow.r - 1 arrow.r 0 arrow.r 1 arrow.r 2$, with the odd determinant at $Y_0$. All compositions below use fixed determinant transitions and determinant-one gauges.

=== 5.1 The arrangement and its cell lattices <the-arrangement-and-its-cell-lattices>

Insert $n$ negative intervals $W'_1 \, dots.h \, W'_n$ between the caps. After an interval use $phi.alt$ to return to the $Y_2$ convention, except at $m$ selected bridges, where the positive path defining $H$ is inserted instead. The return after the last interval meets the final cap in the $Y_2$ convention. Selected bridges are at least four intervals apart; the repeated pattern used below has exact spacing four. Long initial and terminal pads contain no positive bridge. A positive bridge together with its two adjacent negative intervals is a #emph[macro]. Macros are disjoint and have ordinary single intervals between them. Write $J_i$ for the potential primary $S^3$-cut in $W'_i$, and write

$ S_i = F_(l \, i) - F_(r \, i) \, #h(2em) S_i^2 = - 4 \, $

for its test sphere. Cutting at all the $J_i$’s and filling the new spherical boundaries by balls gives two outside pieces and one cell between each pair of successive $J_i$’s. This is a topological decomposition used for intersection-form computations; it does not assert that any metric neck has been stretched.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$C_-$]])
  content((1.35, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.07056cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B$]]])])
  content((2.7, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.07056cm, stroke: (thickness: 0.4pt), fill: rgb("#ededff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$H$]]])])
  content((4.05, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.07056cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B$]]])])
  content((5.65, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.07056cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B$]]])])
  content((7.25, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.07056cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B$]]])])
  content((8.85, 0), [#text(size: 9pt)[$dots.h$]])
  content((10.2, 0), [#text(size: 9pt)[$C_+$]])
  line((0, 0), (0.9, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((1.8, 0), (2.25, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((3.15, 0), (3.6, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((4.5, 0), (5.2, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  content((4.85, 0), [#text(size: 9pt)[$phi$]], anchor: "north")
  line((6.1, 0), (6.8, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  content((6.45, 0), [#text(size: 9pt)[$phi$]], anchor: "north")
  line((7.7, 0), (8.85, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  content((8.05, 0), [#text(size: 9pt)[$phi$]], anchor: "north")
  line((8.85, 0), (10.2, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((0.85, 0.65), (4.55, 0.65), stroke: (thickness: 0.4pt))
  content((2.7, 0.8264), [#text(size: 9pt)[one positive macro]], anchor: "south")
  line((1.35, -0.4), (1.35, -0.85), stroke: (thickness: 0.4pt))
  content((1.35, -0.85), [#text(size: 7pt)[$J_j$]], anchor: "north")
  line((4.05, -0.4), (4.05, -0.85), stroke: (thickness: 0.4pt))
  content((4.05, -0.85), [#text(size: 7pt)[$J_(j+1)$]], anchor: "north")
  line((1.35, -1.35), (4.05, -1.35), stroke: (thickness: 0.4pt))
  content((2.7, -1.526), [#text(size: 7pt)[positive cell $P$]], anchor: "north")
  line((0.85, -2.05), (7.7, -2.05), stroke: (thickness: 0.4pt))
  content((4.275, -2.226), [#text(size: 9pt)[four interval blocks per positive bridge]], anchor: "north")
})],
  caption: [Figure 4: One repeated four-interval pattern between the caps. The first two intervals and the positive path form a macro; the positive cell lies between the primary cuts inside those intervals. The cut marks are schematic, and the cell lattice is computed after filling its spherical boundaries. Initial and terminal negative pads are suppressed. All ordinary $Y$-seams have finite length; each $B$ carries its own primary $J$-face and lens face, which are the genuine ends of its parameter interval. ],
) <fig:stack:pattern>

#thm([Proposition 5.1.])[
  (Cell lattices).  #emph[All these filled pieces have $H_1 = 0$, and their integral intersection lattices are unimodular. A negative cell has orthogonal trace classes $F_r \, F'_l$, both of square $- 2$, and its lattice has the basis 
#[#set math.equation(numbering: n => "(5.1)")
 $ a = frac(F_r + F'_l, 2) \, #h(2em) b = frac(F_r - F'_l, 2) \, #h(2em) a^2 = b^2 = - 1 \, quad a b = 0 . $ <eq:stack:negative-lattice>]

 A positive cell $P$ has an integral basis $G \, U \, T_1 \, T_2 \, T_3 \, T_4$ with 
#[#set math.equation(numbering: n => "(5.2)")
 $ Q_P = mat(delim: "(", 2, 1; 1, 0) xor \( - I_4 \) \, #h(2em) F_r = G - sum_(b = 1)^4 T_b \, #h(2em) F'_l = G - 2 U . $ <eq:stack:positive-lattice>]

 Here $U$ is represented by a sphere of square zero, and $U F_r = U F'_l = 1$. The middle $0$-trace class is 
#[#set math.equation(numbering: n => "(5.3)")
 $ F_0 = G - T_3 - T_4 . $ <eq:stack:middle-class>]

 The macro contains an ordinary plumbing of the three spheres 
#[#set math.equation(numbering: n => "(5.4)")
 $ X_1 = - S_j \, quad U \, quad X_2 = S_(j + 1) \, #h(2em) X_1^2 = X_2^2 = - 4 \, quad U X_1 = U X_2 = 1 \, quad X_1 X_2 = 0 . $ <eq:stack:macro-plumbing>]

 In particular $b^(+) \( P \) = 1$ and $sigma \( P \) = - 4$.]
] <prop:stack:lattice>

#proof[
  The trace halves have zero first homology. Gluing two such halves along a rational homology sphere preserves this property by the Mayer–Vietoris sequence. The same argument applies to the caps and to the positive handle path. Filling spherical boundary components by balls does not change $H_1$. Poincaré duality and the universal coefficient theorem therefore give a unimodular intersection form on the integral second homology.
  In a negative cell the two trace classes have intersection matrix $"diag" \( - 2 \, - 2 \)$, whose determinant is four. They span an index-two sublattice. Its discriminant group is $\( bb(Z) \/ 2 \)^2$. Of its three nonzero elements, the classes of $F_r \/ 2$ and $F'_l \/ 2$ have square $- 1 \/ 2$, and so cannot be adjoined to an integral lattice. The remaining element, $\( F_r + F'_l \) \/ 2$, has integral square $- 1$. It gives the unique integral index-two extension, namely (5.1). This argument uses no information about $phi.alt$ beyond its being a diffeomorphism of the filled manifolds. In particular, its action on $H_1 \( Y_(plus.minus 2) \) = bb(Z) \/ 2$ is necessarily the identity.
  For the positive cell use the polygon model from Section 2. Between its two spherical boundaries the consecutive rays are
  $ \( - 1 \, 0 \) \, med \( - 2 \, 1 \) \, med \( - 1 \, 1 \) \, med \( 0 \, 1 \) \, med \( 1 \, 1 \) \, med \( 2 \, 1 \) \, med \( 1 \, 0 \) . $
  The five internal side spheres form the chain $\[ - 1 \, - 2 \, - 2 \, - 2 \, - 1 \]$. The sum of these spheres has zero intersection with each member of the chain. Smoothing its four transverse intersections gives a sphere: the dual graph is a tree, and each smoothing joins two spheres. Its square is $- 1 - 2 - 2 - 2 - 1 + 2 dot.op 4 = 0$. This is $U$. Its two endpoint incidences give the stated intersections with the neighboring test spheres.
  Blow down the four corner subdivisions introduced by the four increasing steps. The remaining doubled $2$-trace has a trace class $G$ with $G^2 = 2$. Doubling its cocore disk across the $Y_2$ seam gives the sphere $U$, with $U^2 = 0$ and $G U = 1$. Under restoration of the corner subdivisions this is the smoothed side-chain sphere described above; the blowup points are disjoint from its representative. This rank-two form is unimodular. Restore the subdivisions in their chronological order from slope $- 2$ to slope $2$, and use their total exceptional transforms as $T_1 \, dots.h \, T_4$. These have intersection form $- I_4$ and are orthogonal to the pullbacks of $G \, U$. The incoming trace passes through all four blown-up corners, whereas the middle trace passes through the last two. Their proper transforms are therefore $G - sum T_b$ and $G - T_3 - T_4$. The reverse outgoing trace is orthogonal to the incoming one, meets $U$ once, and has square $- 2$; in the doubled-trace coordinates it is $G - 2 U$. This proves (5.2) and (5.3). The local corner charts give transverse positive plumbing intersections, so the smoothing and the two adjacent $- 4$-spheres give (5.4) inside the macro. There is no use of a negative bridge identification in this construction. The signature and positive rank follow from the displayed matrix. ◻
]

An evaluation vector $v = \( x \, u \; t_1 \, t_2 \, t_3 \, t_4 \)$ in the positive basis consequently has square

#[#set math.equation(numbering: n => "(5.5)")
 $ v^2 = 2 x u - 2 u^2 - sum_(b = 1)^4 t_b^2 . $ <eq:stack:positive-dual-square>]

On a negative cell the corresponding formula is

#[#set math.equation(numbering: n => "(5.6)")
 $ v^2 = - frac(\( v F_r \)^2 + \( v F'_l \)^2, 2) . $ <eq:stack:negative-dual-square>]

These formulas will also be used on rational orthogonal summands of pieces cut at only some of the $J_i$’s.

=== 5.2 Characteristic lifts and the index telescope <characteristic-lifts-and-the-index-telescope>

The spin-$c$ structure used for the coupled Dirac operator will have characteristic determinant class $l$. For a rank-two bundle with determinant class $c$, write $Lambda = l + c$. We choose $c_0$ and $Lambda_0$ so that $l = Lambda_0 - c_0$ is characteristic and remains fixed when the determinant lift changes.

On every negative cell set

$ c_0 = 0 \, #h(2em) \( Lambda_0 F_r \, Lambda_0 F'_l \) = \( - 2 \, 0 \) . $

On a positive cell specify their evaluations by

#[#set math.equation(numbering: n => "(5.7)")
 $ c_0 = \( 2 \, 1 \; 1 \, 0 \, 1 \, 0 \) \, #h(2em) Lambda_0 = \( - 2 \, - 1 \; 0 \, 1 \, 0 \, - 1 \) . $ <eq:stack:base-lifts>]

On each outside piece use the fixed cap determinant, extending it with zero evaluation on the bordering negative trace. Choose $Lambda_0 - c_0$ characteristic, with $Lambda_0 F_(l \, 1) = 0$ on the first outside trace and $Lambda_0 F_(r \, n) = - 2$ on the last. On the separate extra exceptional class $E_(upright("exc"))$ of each cap choose $Lambda_0 E_(upright("exc"))$ to be an odd integer; its absolute value will later be made large. The old cap data are fixed before this choice.

#thm([Lemma 5.2.])[
  (Existence and restrictions of the lifts).  #emph[These choices define integral classes on the closed stack, and $l = Lambda_0 - c_0$ is characteristic. For every bit vector $e = \( e_1 \, dots.h \, e_n \) in { 0 \, 1 }^n$, set 
#[#set math.equation(numbering: n => "(5.8)")
 $ c_e = c_0 + sum_(i = 1)^n e_i "PD" \( S_i \) \, #h(2em) Lambda_e = Lambda_0 + sum_(i = 1)^n e_i "PD" \( S_i \) . $ <eq:stack:bit-lifts>]

 Then $Lambda_e - c_e = l$ is independent of $e$. The determinant has the required odd restriction at every positive $Y_0$ seam and is trivializable at all rational primary seams. Moreover 
#[#set math.equation(numbering: n => "(5.9)")
 $ c_0 S_i = 0 \, #h(2em) Lambda_0 S_i = 2 \, #h(2em) S_i S_j = 0 quad \( i eq.not j \) . $ <eq:stack:sphere-pairings>]

]
] <lem:stack:lifts>

#proof[
  In the basis $a \, b$ of a negative cell, $Lambda_0$ has evaluations $\( - 1 \, - 1 \)$, so its difference from $c_0 = 0$ is characteristic. On a positive cell this difference has evaluations
  $ \( - 4 \, - 2 \; - 1 \, 1 \, - 1 \, - 1 \) . $
  The first two are even, as the diagonal entries of the rank-two form are even, and the other four are odd. This is exactly the characteristic congruence on the integral basis in Proposition 43. Direct evaluation gives, for either type of cell,
  $ \( c_0 F_r \, c_0 F'_l \) = \( 0 \, 0 \) \, #h(2em) \( Lambda_0 F_r \, Lambda_0 F'_l \) = \( - 2 \, 0 \) . $
  A square-$- 2$ integral class in an integral lattice is primitive: if it were $d F$, $d > 1$, its square would be divisible by $d^2$. In a unimodular lattice it consequently has a dual class of pairing one. Starting with any characteristic class on an outside piece, add an even multiple of that dual to give the prescribed even evaluation on the bordering trace. The extra exceptional summand is orthogonal and has determinant evaluation zero; its characteristic evaluation can be any odd integer. Gluing over $S^3$’s identifies these integral classes, since the first and second cohomology of the seams vanish. This proves existence of the closed classes and the characteristic assertion.
  On a positive cell $c_0 F_0 = 1$, and $F_0 F_r = F_0 F'_l = 0$. Thus every adjacent bit change preserves the odd evaluation at the middle seam. At a $plus.minus 2$ rational seam the restriction of a line class is its trace evaluation modulo two. Those evaluations are even, including after a bit change. Hence the determinant is trivializable there. The remaining rational seams have first homology zero. Finally the two halves of each $S_i$ have the base evaluations just computed, including at the outside pieces. The spheres lie in distinct intervals, which proves (5.9). ◻
]

Write $kappa = c_2 \( E \) - c_e^2 \/ 4$ and $Theta = \( Lambda_e^2 - sigma \( X \) \) \/ 4$. To keep $kappa$ fixed when one bit changes from zero to one, the second Chern number must #emph[decrease] by one. Indeed

#[#set math.equation(numbering: n => "(5.10)")
 $ c_e^2 = c_0^2 - 4 sum_i e_i \, #h(2em) Lambda_e^2 = Lambda_0^2 . $ <eq:stack:global-bit-squares>]

There is a useful more local version of the second equality.

#thm([Lemma 5.3.])[
  (The cell telescope).  #emph[The contribution of the cell between $J_j$ and $J_(j + 1)$ to $Theta$ is 
#[#set math.equation(numbering: n => "(5.11)")
 $ m_(upright("cell")) + frac(e_j - e_(j + 1), 2) \, #h(2em) m_(upright("cell")) = cases(delim: "{", 0 & upright("negative cell") \,, 1 & upright("positive cell") .) $ <eq:stack:cell-theta>]

 Consequently there are constants $b_0 \, Theta_0$, depending only on the outside choices, such that 
#[#set math.equation(numbering: n => "(5.12)")
 $ b^(+) \( X \) = m + b_0 \, #h(2em) Theta = m + Theta_0 . $ <eq:stack:total-topology>]

 For an interior filled component consisting of $L$ cells between actual $J$-cuts, with $m_I$ positive cells and endpoint bits $e_a \, e_b$, 
#[#set math.equation(numbering: n => "(5.13)")
 $ b_I^(+) = m_I \, #h(2em) Theta_I = m_I + frac(e_a - e_b, 2) \, #h(2em) p_I = L - 1 . $ <eq:stack:interior-topology>]

 Here $p_I$ counts interval parameters with separated lens parameters virtually restored. Endpoint differences telescope when contiguous components are joined.]
] <lem:stack:telescope>

#proof[
  The restriction of a bit change to a cell is $- e_j "PD" \( F_r \) + e_(j + 1) "PD" \( F'_l \)$. Orthogonality of the two trace classes and their base evaluations give
  $ Lambda_e^2 - Lambda_0^2 = 4 e_j - 2 e_j^2 - 2 e_(j + 1)^2 = 2 \( e_j - e_(j + 1) \) . $
  The base square on a negative cell is $- 2$, equal to its signature. On a positive cell both base squares in (5.7) are zero by (5.5), whereas its signature is $- 4$. This proves (5.11). Summing the internal cells leaves $\( e_1 - e_n \) \/ 2$. The first outside trace contributes $- e_1 \/ 2$, and the last contributes $+ e_n \/ 2$. All bit dependence cancels. Positive subspaces add across spherical cuts, proving (5.12). The same sum on an interior segment proves (5.13); there is one retained interval between each consecutive pair of its $L$ cells. ◻
]

#thm([Corollary 5.4.])[
  (Spacing).  #emph[An interior segment with $m_I gt.eq 1$ positive cells has $L gt.eq 4 m_I - 3$. More precisely, if $a \, b$ count negative cells before its first and after its last positive cell, then $L gt.eq 4 m_I - 3 + a + b$. Equality holds when it contains no enlarged gap between positive cells.]
] <cor:stack:interior>

#proof[
  The positive cell positions are at least four apart. The distance from the first to the last is therefore at least $4 \( m_I - 1 \)$. Include those endpoint cells and the $a + b$ additional cells. ◻
]

The dimension of the ordinary closed family with its $n$ sphere tests and cap probes is $D_I + n - 2 n - z$. Thus the zero-dimensional condition is

#[#set math.equation(numbering: n => "(5.14)")
 $ D_I = 8 kappa - 3 \( 1 + b^(+) \) = n + z . $ <eq:stack:ordinary-dimension>]

The coupled Dirac index is $n_D = Theta - kappa$, as computed in Lemma 75. Consequently

#[#set math.equation(numbering: n => "(5.15)")
 $ n_D = Theta - kappa = frac(5 m - n, 8) + Theta_0 - frac(z + 3 + 3 b_0, 8) . $ <eq:stack:dirac-growth>]

These are topological index formulas; none presupposes the existence of a solution. For the four-interval repeated pattern with fixed pads, $n = 4 m + d$ for a fixed integer $d$, so the last index grows as $m \/ 8$. We still have to identify the actual ordinary count with the product and choose repetitions that preserve the cap pairing and the bundle-degree congruence.

=== 5.3 Tests and the relative macro map <tests-and-the-relative-macro-map>

Use a product of the negative interval parameters. The genuine faces are the primary $J$-faces and the $- 4$-lens faces of those intervals. All other seams, including the outer $Y$-seams of macros and single intervals, have long #emph[finite] collars. The metric construction of Theorem 54 keeps these genuine faces and provides the local metrics later needed for the Abelian estimate. In the present ordinary argument we use only the topology, the face-product structure, and the small-perturbation properties stated next; no Abelian spinor inequality is used.

#thm([Lemma 5.5.])[
  (Compatible sphere representatives).  #emph[The sphere tests can be chosen with the following properties, preserving the integral map $B$ on homology and its mod-two unit property. For a commuting connection whose ordered line difference is $v$, a whole test avoids $- 1$ if $v S_i = 0$. Toward the primary face it becomes two consecutive sweeps representing $F_(l \, i)$ and $- F_(r \, i)$; each sweep then avoids $- 1$ when its half evaluation is zero. During the change of prescription, avoidance is retained if both half evaluations vanish. At an actual $J_i$-split each surviving test is assigned compactly to exactly one side. At a lens face it is supported on the lens cap and its data at the two determinant lifts are tensor-paired as in Proposition 25.]
] <lem:stack:tests>

#proof[
  Apply the smooth conjugation-equivariant operation of Lemma 91 to the normalized holonomy path of each sphere sweep. At a commuting connection its winding is half the line-difference evaluation. The operation fixes nonzero-winding commuting paths and moves every zero-winding commuting path into the closed positive-real hemisphere, giving a uniform gap from $- 1$. It is defined on path space before evaluating on connections, so one smooth prescription applies across all commuting configurations.
  At a primary split the simply connected traces supply sphere maps for $F_(l \, i)$ and $- F_(r \, i)$, and their pinch represents $S_i$. Lemma 92 first homotopes the whole sweep to this concatenation and then interpolates to the separate modifications of the two half sweeps. When both half evaluations vanish, the whole and half logarithms agree on their respective segments, so the uniform avoidance gap persists throughout this interpolation. At the actual face each event is defined in a frame intrinsic to its half; a zero half evaluation therefore gives avoidance on that side. These changes take place within the interval, before its true length collars and away from the internal $Y$-necks used below. The metric construction stops using the whole prescription on a side before that side begins to switch.
  Use product data near primary faces and the original tensor-paired data near lens faces. The two representative lemmas belong to the independent ordinary library in Proposition 94; they do not use the nonzero count proved below. Generic equivariant cut variations smaller than half the uniform gap retain the avoidances and give regular cuts on the remaining irreducible locus.
  To verify invariance of $B$, use the homotopy to the path operation provided by Lemma 91. It is relative to the mark endpoints and fixes the constant path and every nonzero-winding commuting path, including the minimum lens-cap paths of Lemma 24. Thus flat avoidance and tensor compatibility at the lens are retained. The operation uses only the original sweep; its exact-support and ideal-persistence properties are those of Lemma 99, and equation data remain independent of the incidence mark. This initial homotopy need not avoid $- 1$ at every intermediate winding-zero path, nor be a small change of sweep: Proposition 26 imposes neither condition. The later whole-to-halves interpolation has the stronger both-zero-half avoidance just proved. At a primary face the unconstrained index exclusion applies even without the test, and at a lens face the two lift contributions cancel by Proposition 25. The invariance proposition therefore preserves $B$ on homology throughout these changes, including for standalone intervals. ◻
]

In estimates involving ideal limits, failure of an avoidance can occur only when a particle meets the exact support of that test. Distinct tests have disjoint supports in their intervals. One lost unit of charge cannot be used to explain two such failures. The ordinary transversality and support-incidence estimates are those of Lemma 10.

#thm([Lemma 5.6.])[
  (Local charge costs).  #emph[For the main pieces of a single interval or macro, virtually restore all separated lens caps with the split references of differences $0 \, plus.minus 4 \, plus.minus 2$, respectively at the extendibly central, other central, and trace-zero states. Include their charges, particles, and other positive losses in the piece charge. For a reducible main piece with $s$ assigned tests and no positive cell, 
#[#set math.equation(numbering: n => "(5.16)")
 $ 8 kappa_(upright("piece")) gt.eq 4 s . $ <eq:stack:negative-test-cost>]

 For a reducible main piece containing the positive cell of a macro, 
#[#set math.equation(numbering: n => "(5.17)")
 $ kappa_(upright("piece")) in 1 / 2 bb(Z) \, #h(2em) kappa_(upright("piece")) gt.eq 1 / 2 . $ <eq:stack:positive-charge>]

 The statements hold for sufficiently small perturbations, throughout the finite metric templates and the long-neck comparisons used below.]
] <lem:stack:charge-costs>

#proof[
  For an ordered splitting the line difference satisfies $v = c_e$ modulo two. All negative trace evaluations are therefore even. After virtual filling its charge has the form
  $ kappa_(upright("piece")) = - v^2 \/ 4 + ell \, #h(2em) ell in bb(Z)_(gt.eq 0) . $
  The stated reference fillings have charges $0 \, 1 \, 1 \/ 4$; their boundary eigenlines extend the given splitting. Excess charge in a cap or its trajectories, and charge of particles, contributes to $ell$. On a negative piece a nonzero even half evaluation contributes at least two to $- v^2$, by (5.6). Every assigned test either charges such a half or, by Lemma 47, charges a unit of $ell$. In a whole test a nonzero difference entails a nonzero half; during switching the same assertion follows unless both halves vanish; at a primary face only its assigned half is used. For a separated lens, vanishing of both halves would give the flat reference, which misses the test. Different tests use different halves or different units of loss. Thus each costs at least four in $8 kappa = - 2 v^2 + 8 ell$, proving (5.16).
  On the positive cell, $v G$ is even and precisely two of the four $v T_b$’s are odd; bit changes preserve these two properties. Equation  (5.5) shows that $v^2$ is even. Added negative trace halves also have even square contribution, so $kappa in 1 / 2 bb(Z)$. The small-perturbation energy bound first gives $kappa gt.eq 0$ in this discrete set. Charge zero is impossible. In fact, the sphere between the first two increasing steps represents $plus.minus \( T_2 - T_1 \)$, and the determinant evaluates oddly on it. It lies in the first half of the positive path, away from the internal $Y_(- 2) \, Y_0 \, Y_2$ collars and from the genuine cut collars. For fixed artificial metric sizes its neighborhood has compactly controlled geometry. Were charge zero possible for perturbations tending to zero, the energy identity would force the trace-free curvature to tend to zero on this neighborhood. A flat projective limit over this sphere has trivial $w_2$, contradicting the odd determinant evaluation.
  This argument remains uniform in the long-neck comparisons. On a long Floer collar retain a gradient perturbation; the perturbed Chern–Simons identity bounds its charge below by an error tending to zero with the perturbation size, independently of collar length. The endpoint perturbation terms telescope over successive levels. On genuine separating collars use unperturbed deep regions, and make other errors arbitrarily small in integrated square norm. The compact odd sphere is untouched. Thus the same contradiction excludes zero in true split limits and in the comparison to long internal product collars. Discreteness now gives (5.17). ◻
]

#thm([Proposition 5.7.])[
  (The relative macro).  #emph[The two-parameter, two-test family on the chronological cobordism $B thin H thin B$, with the above data and irreducible outer limits, defines an integral map on Floer homology at instanton index $i = 2$. It is independent of the metric interpolation preserving the genuine faces, and agrees, up to the common orientation convention, with $B H B$. In particular it induces a unit modulo two.]
] <prop:stack:macro>

#proof[
  We give the low-dimensional exclusions needed for the chain and homotopy identities. Let $t = 0$ for the family and $t = 1$ for a homotopy. It suffices to consider $i lt.eq 3 - t$. If $k$ of the two primary $J$’s are cut, $k in { 0 \, 1 \, 2 }$, let $p$ and $s$ on a main piece denote its remaining interval parameters and its assigned tests, with lens parameters virtually restored. Then
  $ sum p = 2 - k \, #h(2em) sum s = 2 . $
  Equation and cut data on a piece depend only on its retained parameters. A regular irreducible piece costs at least $2 s - p$. At most one additional parameter is subtracted from the irreducible aggregate in a homotopy.
  A separated lens loses a parameter and removes its degree-two test from the main problem, but has framed index shift $delta = 8 E gt.eq 2$. Its net additional cost, measured against $2 s - p$, is at least one. A unit particle loses eight indices; its position and any released cut degrees recover at most four by the exact-support incidence convention. These losses are therefore strict. A purely negative reducible piece has index at least $4 s - 3$, by Lemma 48. Matching at each central contact adds three.
  Consider first an unwanted centered contact or a maximal consecutive reducible group not containing a positive-cell reducer. A group of $r$ negative reducers contributes at least $4 s_R - 3 r$, and its $r - 1$ internal and two exterior central matchings contribute $3 \( r + 1 \)$. Its aggregate cost is at least $4 s_R + 3$. A centered contact without reducers has the same extra cost three. Adding regular irreducible costs, and allowing the one homotopy parameter, gives the lower bound
  $ 4 s_R + 3 + 2 \( 2 - s_R \) - \( 2 - k \) - t gt.eq 5 + k - t > 3 - t . $
  Unused parameters on reducible pieces only increase this bound.
  Now suppose the unique positive cell lies on a reducible piece. Its index is at least $4 - 6 = - 2$. A maximal reducible group containing it, including all internal and both exterior central matchings, costs at least four; negative members add their nonnegative test costs. At $k = 0$, the whole main cobordism is reducible and must be joined to each prescribed irreducible outer limit by a genuine nonconstant irreducible trajectory. These two trajectories give the bound six. At $k = 1$, let $u in { 0 \, 1 }$ record whether the split test is assigned to the positive piece. That piece reaches an outer end, so a true-end trajectory is required. The other piece has no retained parameter and has $1 - u$ tests. If it is irreducible, the bound is $4 + 1 + 2 \( 1 - u \) - t gt.eq 5 - t$. If it is reducible, both outer ends require trajectories and the bound is $4 + 4 \( 1 - u \) + 2 gt.eq 6$. At $k = 2$ there are no retained interval parameters. Let $u_i$ record assignment of each split test to the positive piece. An irreducible outer piece contributes at least $2 \( 1 - u_i \)$; a reducible outer piece, together with its forced true-end trajectory, contributes at least $4 \( 1 - u_i \) + 1$. Including the positive group and subtracting the homotopy parameter at most once gives $4 - t$. Each bound is strictly greater than $3 - t$. These are all placements and assignment choices for the positive reducer.
  It follows that only regular irreducible pieces occur in the relevant boundary strata. Their strict loss estimates exclude particles and all lens possibilities except a single trace-minimum lens cap in the boundary index. Its two lift contributions cancel by Proposition 25. Ordinary Floer breaking and regular gluing consequently give the integral chain identity and the invariance on homology.
  It remains to identify this operation with $B H B$. Homotope the local toric metrics to product metrics through families with the same genuine cuts. The space of metrics on the remaining compact cores permits the interpolation; there is no need to retain a spinor clamp during this homotopy. Keep the tests of Lemma 47 and the paired lens data. Finite partial stretches may still retain the positive rank of the unsplit macro; they are covered by the preceding macro homotopy bounds and Lemma 48. For the final comparison send all three internal lengths to infinity so that their minimum tends to infinity. Every limit then contains the three cuts $Y_(- 2) \, Y_0 \, Y_2$, and its main factors in path order are
  $ B_L \, #h(2em) H_(-) : med - 2 arrow.r - 1 arrow.r 0 \, #h(2em) H_(+) : med 0 arrow.r 1 arrow.r 2 \, #h(2em) B_R . $
  Both $B$ factors are negative definite. The two increasing paths also have $b^(+) = 0$. Explicitly, preceding $H_(-)$ by the $- 2$-trace gives $C_0 \# 2 overline(bb(C P))^2$, with basis $A^2 = 0 \, T_1^2 = T_2^2 = - 1$. Its incoming class is $A - T_1 - T_2$; the orthogonal image of the handle path has $t_1 + t_2 = 0$ and square $- 2 t_1^2$. Preceding $H_(+)$ by the $0$-trace gives $C_2 \# 2 overline(bb(C P))^2$, with $G^2 = 2 \, T_3^2 = T_4^2 = - 1$ and incoming class $G - T_3 - T_4$. A vector $a G + t_3 T_3 + t_4 T_4$ in its orthogonal satisfies $2 a + t_3 + t_4 = 0$ and has square $- \( t_3 - t_4 \)^2 \/ 2$. The relative Mayer–Vietoris sequence identifies these orthogonal images with the handle-path homology; the null direction is the $Y_0$ surface direction. Thus neither path contributes a positive subspace.
  At a compatible genuine $J$-face, either $B$ splits into negative trace halves; at a lens face, virtual restoration of the negative lens cap recovers the same nonpositive form. The two increasing paths remain unchanged. A reducer cannot meet the admissible $Y_0$ seam, so all reducer groups lie in negative interval pieces, trace halves, or rational cylinder levels. They therefore have the same cost $4 s_R + 3$, including their internal and two exterior central matchings. Regular increasing-path factors cost nonnegative index and carry no interval parameters or tests. Consequently an unwanted centered contact again costs at least $5 + k$, while a lens, particle, or nonconstant irreducible trajectory adds strictly to the regular index bound. At $i = 2$ only the ordinary rigid irreducible matches remain, with no true interval faces or positive losses. The regular gluing theorem therefore identifies the map with the product for sufficiently long finite internal lengths. The coherent orientations are the compositions of the ordinary orientations, with the same local flip comparisons. The mod-two unit assertion follows from Theorems 3 and 23. ◻
]

=== 5.4 The closed gluing budget <the-closed-gluing-budget>

We next stretch only the external negative $Y$-seams separating caps, macros, and single intervals. The relative macro proposition fixed irreducible outer limits; a limit of this closed stretching may instead have central flats on the seams. We therefore need a local index bound allowing central outer limits, followed by a global bound including their matching contributions.

#thm([Lemma 5.8.])[
  (Local excess, including central outer limits).  #emph[For a single interval or macro let $b = 1$ or $2$, respectively, and let $i_(upright("loc"))$ be its index at its actual outer limits, with seam trajectories treated separately. A single interval has $i_(upright("loc")) - 1 gt.eq 0$. A macro with $a$ central outer limits has 
#[#set math.equation(numbering: n => "(5.18)")
 $ i_(upright("loc")) - 2 gt.eq - 2 a . $ <eq:stack:macro-excess>]

 If both outer limits are irreducible, equality for either kind of factor requires an ordinary stable rigid solution: there are no primary or lens faces, particles, or positive trajectory losses.]
] <lem:stack:local-excess>

#proof[
  Suppose $k$ primary cuts occur in the factor. Restore the lens caps virtually, assigning any primary-neck charges to the pieces. Index addition and the parameter and test totals give
  #[#set math.equation(numbering: n => "(5.19)")
   $ E := i_(upright("loc")) - b = sum_(upright("pieces")) \( i + p - 2 s \) + 4 k \, #h(2em) sum p = b - k \, quad sum s = b . $ <eq:stack:excess-identity>]
  Indeed primary matching adds $3 k$, while the lost parameters supply the remaining $k$. Call the summands in parentheses #emph[scores]. Regular irreducibles have score at least zero, strictly positive for the losses described in the preceding proof. Negative reducers have score at least $- 3 + 2 s + p$. A reducer containing the positive cell has score at least $- 2 + p - 2 s$.
  For a single interval with $k = 0$, an irreducible has nonnegative score, and a reducer has $s = p = 1$, also giving score at least zero. For $k = 1$, both parameters disappear and the two test assignments are $u \, 1 - u$, with $u in { 0 \, 1 }$. If both pieces are irreducible, $E gt.eq 4$. If just one is reducible, assigned $s_R$ tests, then $E gt.eq 1 + 2 s_R gt.eq 1$. If both are reducible, their scores plus four give $E gt.eq 0$; both outer limits are then central. This proves all assertions for a single interval.
  For a macro first suppose the positive-cell piece is irreducible. At $k = 0$ its score is nonnegative. At $k = 1$, the only possible reducer is the negative outer piece; with $u$ the assignment of the split test to the positive piece, its score is at least $- 1 - 2 u$, so $E gt.eq 3 - 2 u gt.eq 1$. If it is irreducible as well, the stronger bound is four. At $k = 2$, let $u_i$ indicate assignment of the $i$-th split test to the positive piece and $r_i$ indicate reducibility of the corresponding outer piece. Then
  $ E gt.eq 8 - sum_(i = 1)^2 r_i \( 1 + 2 u_i \) gt.eq 2 . $
  Thus all primary faces are strict in this case.
  It remains to consider a positive-cell reducer. At $k = 0$ the whole macro is reducible, with $p = s = 2$, giving $E gt.eq - 4$ and $a = 2$. At $k = 1$ its parameter count is one and its test count is $1 + u$, where $u in { 0 \, 1 }$ is the split test assignment. The other piece has no parameter and has $1 - u$ tests. Write $r = 1$ if that piece is reducible and $r = 0$ otherwise. Equation (5.19) becomes
  $ E gt.eq 1 - 2 u - r \( 1 + 2 u \) . $
  For $\( u \, r \) = \( 0 \, 0 \) \, \( 1 \, 0 \) \, \( 0 \, 1 \) \, \( 1 \, 1 \)$, the respective lower bounds are $1 \, - 1 \, 0 \, - 4$. The positive reducer forces one central outer limit, and the other reducer, if present, forces the second. Hence $a gt.eq 1 + r$, and each of these four bounds implies (5.18).
  At $k = 2$ the positive reducer has no parameter and has $u_1 + u_2$ tests. Each outer piece has no parameter and has $1 - u_i$ tests. Thus
  $ E gt.eq 6 - 2 \( u_1 + u_2 \) - sum_(i = 1)^2 r_i \( 1 + 2 u_i \) . $
  For $r_1 + r_2 = 0 \, 1 \, 2$, its minimum over the assignments is, respectively, $2 \, - 1 \, - 4$. Since $a gt.eq r_1 + r_2$, all three minima imply (5.18). Notice that an irreducible outer piece can itself have a central outer limit; only this inequality, not equality, is needed. When $a = 0$ the bound is at least two.
  Finally, with irreducible outer limits a nonsplit whole reducer is impossible. The strict primary-face bounds just proved, and the strict lens and particle costs on remaining irreducibles, show that zero excess then occurs only in the ordinary stable rigid count. ◻
]

#thm([Proposition 5.9.])[
  (Closed composition in the final metrics).  #emph[Choose the old cap metrics with generic periods and take sufficiently long finite isolation collars for their separate extra exceptional summands. For any fixed finite stack, the sphere tests and sufficiently small ordinary data can be chosen so that, for all sufficiently long finite external negative $Y$-necks, the oriented closed count $Omega$, summed over the determinant bits, equals the ordinary composition of its cap states, single intervals, and macro maps, up to one overall sign. The same conclusion holds after sufficiently small further generic changes preserving the genuine-face prescriptions. These data can also satisfy Theorem 64.]
] <prop:stack:composition>

#proof[
  The fixed indices and total charge, together with uniformly bounded end corrections, give bounded cap charge ranges for this finite stack. Include also the cap-cycle, comparison-homotopy, and old closed-pairing ranges. With the old-cap periods fixed, Proposition 42, in the uniform isolation form of Proposition 72, permits exceptional isolation depths and perturbation tolerances to be chosen for all these ranges at once. It excludes cap reducers also in broken relative limits as the external $Y$-necks stretch. The charge bounds used there remain uniform in those lengths: the gradient Chern–Simons terms telescope along any chain of end levels, and the resulting cap and finite-prefix bounds suffice for the period test. They make no assertion of finite unperturbed curvature norm on an infinite tail approaching a perturbed nonflat.
  Each regular cap irreducible now has nonnegative excess over its fixed probe degree. The last assertion of Theorem 32 allows the cap pairing to be recomputed with these final data by stretching the old closure’s rational seam. Its closed invariant is unchanged, since $b^(+) > 1$ and the probes represent the same classes. Thus the pairing stays nonzero without requiring separate metric independence of the two cap states.
  Now consider a limit as all external seams become long. A seam contributes nonnegative additional index from trajectories and matching. If any central state occurs in it, its total contribution is at least three: group contiguous reducible cylinder levels and include their two exterior matching terms, exactly as in Lemma 16. Write $S$ for the number of seams containing a central state, and $A$ for the sum of the numbers of central outer limits over the macros. Since macros are separated by single intervals and separated from the caps by pads, a seam is adjacent to at most one macro. Hence $A lt.eq S$. Lemma 50 and cap regularity give total excess at least
  $ 3 S - 2 A gt.eq S . $
  But the total excess is zero by (5.14). Thus $S = 0$. With all external limits irreducible, every factor has nonnegative excess. Equality and the last assertion of Lemma 50 exclude all true faces and positive losses. Nonconstant irreducible seam trajectories cost at least one and are excluded as well. Precisely the rigid irreducible factor matches remain.
  Choose regular ordinary data independently on the pieces, with product compatibility at all external seams and genuine cuts. Ordinary compactness, the preceding exclusions, and regular Floer gluing now identify the closed count with the product for sufficiently long finite external lengths. This proves also that no broken or ideal cut tuple occurs at a genuine face for these choices. Otherwise a sequence at arbitrarily large external lengths would have a limiting tuple excluded by the same budget. At fixed suitable lengths the absence is open by compactness, and the regular zero-dimensional count is unchanged by sufficiently small further data changes.
  For orientations, order the closed ASD determinant line in cobordism order, pairing an intermediate end line with its dual. The parameter, mark, and test lines are then reordered into the factor order. Their dimensions and the indices of the rigid factors are fixed, so the reordering sign is independent of the matched solutions. Equivalently, the fixed cap degree determines the first Floer parity, and the fixed degrees of the successive maps determine every subsequent parity. This gives a single comparison sign for the whole product. The local two-lift comparison commutes with this operation: excise its framed lens cap before or after the other gluings, using the same transition and trace reference. The compared cap indices are equal and even. Thus all bit comparisons are precisely the ones used to define the maps in Section 3.
  It remains to explain compatibility with the later metric choices. The metric existence assertion in Theorem 54 and the finite-choice assertion in Corollary 73 apply to the fixed topology, lifts, and index bounds, independently of the value of $Omega$. They supply finite artificial isolation sizes and a positive allowable size for fixed gradient perturbations on the external $Y$-collars before those collars are sent into their gluing range. The ordinary argument above works for arbitrarily small such gradients. Choose them below that tolerance, then take the external lengths sufficiently large and finite. Any additional non-gradient errors are chosen with arbitrarily small total squared norm for those already chosen lengths. The final open generic adjustments preserve the count. Thus no error estimate is required to hold for a non-gradient perturbation accumulated over an uncontrolled $Y$-length. ◻
]

Changing the fixed determinant connection, or the background connection used in the coupled Dirac equation, does not change this ordinary calculation. In the ordinary projective equations its effect is absorbed by the scalar half-difference of the two determinant connections. The normalized holonomy tests use the same determinant lifts. Thus the independent background choices needed later do not alter $Omega$.

=== 5.5 Repetition on the integral free quotient <repetition-on-the-integral-free-quotient>

The cap pairing is rationally nonzero, whereas the maps are known to be units modulo two. The passage between these assertions uses the free quotient of integral Floer homology, rather than discarding torsion inside a mod-two homology group.

#thm([Lemma 5.10.])[
  (The finite-lattice argument).  #emph[Let $C \, C'$ be finite complexes of finitely generated free abelian groups, and let $f : C arrow.r C'$ be a chain map whose reduction modulo two is a quasi-isomorphism. On the free quotients 
$ L = H \( C \; bb(Z) \) \/ "Tor" \, #h(2em) L' = H \( C' \; bb(Z) \) \/ "Tor" \, $

 its induced map is an isomorphism after localization at two. In particular $L \/ 2^N L arrow.r L' \/ 2^N L'$ is an isomorphism for every $N gt.eq 1$.]
  #emph[If $L = L'$ has rank $r$, all these maps modulo $2^N$ have orders dividing a single integer depending only on $r \, N$.]
] <lem:stack:finite-lattice>

#proof[
  The mapping cone of $f$ is a finite free complex whose mod-two homology is zero. Apply the universal coefficient sequence over $bb(Z)_(\( 2 \))$. In each degree the finitely generated localized cone homology has zero quotient by its maximal ideal $\( 2 \)$, so it vanishes by Nakayama’s lemma. Thus $f$ induces an isomorphism on integral homology after localization. An isomorphism preserves torsion, hence also induces an isomorphism on the free quotients after localization. In integral bases its square matrix therefore has odd determinant. The adjugate formula makes it invertible modulo every $2^N$. The last assertion follows by taking the exponent of the finite group $"GL"_r \( bb(Z) \/ 2^N bb(Z) \)$. It does not require integral homology to be torsion-free. ◻
]

#thm([Theorem 5.11.])[
  (A nonzero family with positive coupled index).  #emph[Fix the old caps and their compact probes. Prescribe any lower bounds on the two outside pad lengths, and prescribe any odd evaluations of $Lambda$ on their separate extra exceptional classes. There exist arbitrarily large finite stacks with positive bridges at spacing four, satisfying those pad bounds, for which the following hold simultaneously:]
  + #emph[the lifts are those of Lemma 44, with a common allowed charge $kappa$ and $D_I = n + z$;]
  + #emph[the actual oriented ordinary family count satisfies $Omega eq.not 0$;]
  + #emph[the coupled Dirac index $n_D = Theta - kappa$ is positive;]
  + #emph[all auxiliary collars are finite, and the metric and small-data choices can be made to satisfy Theorem 54 and Theorem 64.]
  #emph[The integers specifying the stack and all topological lift data are chosen before the artificial isolation sizes, perturbation bounds, and external Floer gluing lengths.]
] <thm:stack:nonzero>

#proof[
  Clear the fixed cap denominators once. Thus choose integral cap cycles and an integral cap functional whose pairing is a nonzero integer $q$; the corresponding exact surface insertions are the fixed integral multiples of the rational probes used in Theorem 32. The functional kills torsion, so it factors through the free integral Floer lattice $L$ of $Y_2$. Choose $N$ such that $q equiv.not 0 med \( mod med 2^N \)$. The rational pairing shows that $r = "rank" L$ is positive.
  Let $cal(A) = phi.alt_(*) B$ be a negative step returned to the $Y_2$ convention, and let $cal(D) = H B$ be a positive-return step. By Theorems 3 and 23, and Lemma 52, both operators are automorphisms of $L \/ 2^N L$. The chronological four-interval pattern is one positive-return step followed by three negative steps, so its operator is $cal(A)^3 cal(D)$. Geometrically its first two intervals and intervening positive bridge form the macro; its last two intervals are single factors. Proposition  49 proves that its directly counted clamped macro has the same integral homology operation, with the already fixed common sign convention. For the finite-order argument it would suffice that this direct operation is itself a mod-two unit.
  Choose a common exponent $E$ of $"GL"_r \( bb(Z) \/ 2^N bb(Z) \)$, enlarged to be divisible by eight. Choose initial and terminal pad lengths $p_(-) \, p_(+)$ that are multiples of $E$ and meet the prescribed lower bounds. Let $q_0$ be any sufficiently large positive multiple of $E$ and repeat the four-interval pattern $q_0$ times. Then
  $ m = q_0 \, #h(2em) n = p_(-) + 4 q_0 + p_(+) \, $
  and each pad and the whole repeated middle operation are the identity on $L \/ 2^N L$. Here $q_0$, the repetition number, is distinct from the fixed nonzero pairing $q$. Use literally periodic local block, orientation, and determinant transition data within each set of repetitions. Thus each operation really is a power of one automorphism. The data may depend on this finite stack: the common exponent depends only on $r \, N$, so the argument is unchanged if the automorphism changes when smaller perturbations are required. Continuation identifies the free lattices, and the integral cap pairing remains $q$, up to a fixed sign, by the closed comparison in the proof of Proposition 51. A common sign of a map causes no difficulty, since it too is an element of the same finite group.
  We check the degree congruence before making any metric choices. The old nonzero cap pairing has an allowed bundle degree. Rational Mayer–Vietoris at its seam identifies its positive rank with $b^(+) \( C_(-) \) + b^(+) \( C_(+) \) = b_0$ and its determinant square with the sum of the two cap squares. Adjoining the outside trace halves adds only negative directions with zero determinant evaluation. Internal negative cells also have $c_0 = 0$, and a positive cell has $c_0^2 = 0$. Thus the base determinant square of the closed stack equals that for the old pairing, while its positive rank increases by $m$. Equation  (5.14) therefore changes the required quantity $8 kappa$ by $n + 3 m$. Our choices make both $n$ and $m$ multiples of eight, so this change is divisible by eight. The required $c_2 = kappa + c_0^2 \/ 4$ is integral. Every bit sector is also integral, by (5.10). This is the residue restriction on the allowed degrees; it has not been inferred from a formal nonzero count.
  The pad lengths and exceptional evaluations are now fixed. Equation (5.15) becomes
  $ n_D = q_0 / 8 + Theta_0 - frac(p_(-) + p_(+) + z + 3 + 3 b_0, 8) . $
  It is positive for all sufficiently large allowed $q_0$. Increasing the repetition number by $E$ preserves every congruence and increases $n_D$ by $E \/ 8$.
  For each such fixed finite problem choose the metric isolations and small data as in Proposition 51, preserving periodicity during the factor computation. That proposition identifies the actual count with the product. Modulo $2^N$ this product pairs the final cap states exactly as the identity operation, and hence
  $ Omega equiv plus.minus q equiv.not 0 med \( mod med 2^N \) . $
  It follows that $Omega eq.not 0$. Subsequent sufficiently small generic data for the one-component closed problem need no periodicity and preserve this integer. The same proposition gives the compatibility with the metric tests and completes all assertions. ◻
]

With the stack integers and lifts fixed, the displayed indices bound all charge ranges that will occur, including the auxiliary relative cap calculations. Table 1 records the order of the finite choices; its length and perturbation quantifiers are those of Corollary 73.

One deformation used in comparing the old cap closure with unperturbed closed data deserves separate mention. Turn off a gradient perturbation while its seam remains long, preserving its gradient form throughout. This retains the uniform charge bound used in the period exclusion.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[Choice
], table.cell(rowspan: 1, colspan: 1)[Dependence and use
]),
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[Old caps, probes, and periods
], table.cell(rowspan: 1, colspan: 1)[The constants $C_W$ depend only on the old cap data (Proposition 72).
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[Outside delays and odd exceptional evaluations
], table.cell(rowspan: 1, colspan: 1)[Chosen using the old-cap bounds, before middle repetitions (Lemma 85).
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[Pads and repetition integers
], table.cell(rowspan: 1, colspan: 1)[Congruences, nonvanishing, and $n_D > 0$ determine a fixed finite problem (Theorem 53).
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[Tube scale $epsilon.alt$
], table.cell(rowspan: 1, colspan: 1)[Chosen for this fixed finite problem.
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[Regularizer $d$, finite rational isolations, and a positive gradient tolerance
], table.cell(rowspan: 1, colspan: 1)[Isolation thresholds may depend on the whole finite problem; the gradient tolerance precedes the external seam lengths.
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[Periodic ordinary factor data, then finite $Y$ lengths
], table.cell(rowspan: 1, colspan: 1)[Data lie below the chosen tolerances. The $Y$ lengths may then be any sufficiently large finite gluing lengths (Proposition 51).
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[Further nongradient errors
], table.cell(rowspan: 1, colspan: 1)[Their allowed total squared cost may depend on the selected finite $Y$ lengths.
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[Small closed generic changes
], table.cell(rowspan: 1, colspan: 1)[These preserve the computed integer $Omega$ and need not preserve periodicity.
],
)
]],
  caption: [Table 4: Order of the finite choices. Only the old-cap constants are independent of later exterior choices. The genuine $J$ and lens lengths, distinct from the finite lengths listed here, may subsequently diverge at parameter faces. ],
)

=== 5.6 The coupled spinor data <the-coupled-spinor-data>

The next sections couple the fixed spin-$c$ determinant $l = Lambda - c$ to the rank-two bundle of determinant $c$. Let $W^plus.minus$ be the rank-two spinor bundles of this spin-$c$ structure, and let $E$ be the rank-two Hermitian bundle with $c_1 \( E \) = c$. A configuration consists of a unitary connection $a$ on $E$, with its determinant connection fixed, and a coupled spinor $Phi in Gamma \( W^(+) ⊗ E \)$. The coupled Dirac operator is $D_a : Gamma \( W^(+) ⊗ E \) arrow.r Gamma \( W^(-) ⊗ E \)$. In the equations of Section 8, $P_D$ is a section of $W^(-) ⊗ E$, while $P_(+)$ has the same target as $rho \( F_a^(0 \, +) \)$. These denote the Dirac and curvature perturbations. The phase circle multiplies $Phi$; on the determinant-one gauge quotient its ineffective subgroup at a free orbit is ${ 1 \, - 1 }$. Definition 74 gives the full field-type classification. Table 3 records how the ordinary determinant, framing, and sign conventions continue into the final spinor count.

At a phase-fixed configuration the spinor is either zero, or lies in one line of a parallel splitting. If $v$ is the ordered summand difference, with the active line first in the latter case, its spin-$c$ line class is $K = Lambda + v$. For virtual $- 4$-cap fillings use the split references above, choosing the order at the nonextendible center so that $\| K S_i \| lt.eq 4$; this is possible because $\| Lambda S_i \| = 2$, and is automatic at the trace-zero state. These conventions fix the interface with Section 8. The symbol $P$ for a positive bridge cell in this section is distinct from the later component type $P$, which denotes a field not fixed by phase.

== 6 A simultaneous family of metrics <sec:geometry>

The positive bridges require a range of self-dual periods. We construct that range inside the interval cube, while keeping precisely the genuine cuts prescribed in Section 5. Two distinctions matter in this construction. First, a vanishing coefficient in a period is an auxiliary plumbing degeneration; it is not the middle three-sphere cut of an interval. Second, the narrow-period region is controlled by a long tube with spherical fibers. We retain that tube while replacing the toric metric near the corner where both coefficients vanish.

Fix a finite stack, its determinant and spin data, and its finitely many bit choices. The number of intervals, all exceptional evaluations, and the topological charge ranges are fixed in every limiting assertion below. Constants for compact pieces may depend on this finite problem. The constant attached only to an old cap will be identified separately in Section 7. A #emph[genuine length] is a length tending to infinity at a face of the interval cube. The only such cuts are the middle spheres $J_i tilde.equiv S^3$ and the boundaries of the $\( - 4 \)$ disk bundles $N_i$. All other lengths used here, including the external surgery seams $Y_j$, will ultimately be chosen finite. The $Y$ collars varied below are the external rational seams joining the ordinary factors: macros, single intervals, and caps.

In a macro containing positive bridge $j$, orient the adjacent spheres as

#[#set math.equation(numbering: n => "(6.1)")
 $ X_1 = - S_j \, #h(2em) X_2 = S_(j + 1) . $ <eq:geometry:oriented-spheres>]

Write $U$ for the sphere in Proposition 43. Thus $X_i^2 = - 4$, $U^2 = 0$, $U X_i = 1$, and $X_1 X_2 = 0$. The regular neighborhoods needed below are

#[#set math.equation(numbering: n => "(6.2)")
 $ C_2 = nu \( X_1 union U union X_2 \) \, #h(2em) C_(1 \, i) = nu \( U union X_(3 - i) \) \, #h(2em) C_0 = nu U \, #h(2em) N_i = nu X_i . $ <eq:geometry:neighborhoods>]

Here neighborhoods are rounded, and their separating hypersurfaces are specified up to isotopy. In particular $C_0$ is a neighborhood supporting a tube, not an additional infinite cut.

#thm([Theorem 6.1.])[
  (The metric family).  #emph[For the fixed finite stack, there are families with the following properties. They are defined for all sufficiently small $epsilon.alt > 0$, all sufficiently small regularizers $d > 0$, and arbitrarily long finite auxiliary rational collars. The auxiliary bounds may depend on $epsilon.alt$ and the fixed problem. The family parameter is the original cube of interval parameters, with no added boundary faces.]
  + #emph[At its genuine faces the family has independent product length collars at $J_i$ and $partial N_i$, compatible at intersections of faces. The $J_i$ cross-sections are round. On a component separated by $J_i$, the limiting data depend only on the interval parameters retained on that component. The $N_i$ metric is complete with positive scalar curvature and a positive-scalar-curvature product end. Its link and its scale on the stretching collar are independent of the tangential cube parameters. The link is joined to the round lens metric through positive-scalar-curvature metrics. These metric choices are common to the two bit terms compared at that lens face.]
  + #emph[On the positive-width toric region of a macro constructed below, as $d arrow.r 0$ the retained main piece has a complete metric conformal to a toric Kähler metric with positive cohomology ray represented by 
#[#set math.equation(numbering: n => "(6.3)")
 $ H = U + a X_1 + b_0 X_2 \, #h(2em) 0 lt.eq a \, b_0 lt.eq 1 / 4 \, #h(2em) a + b_0 > 0 . $ <eq:geometry:period>]

 It has nonnegative scalar curvature, with strict positivity on an open set. A zero coefficient removes the corresponding outer part by a $C_(1 \, i)$ separation; a coefficient $1 \/ 4$ separates $N_i$. The class $H$ is supported rationally on the retained main piece in all these cases. Its positive rank is one.]
  + #emph[Every macro in the small-width replacement region contains an $S^2 times S^1 times I$ tube, with fiber $U$, of length comparable to $epsilon.alt^(- 1)$. On its bulk the metric is, or approaches smoothly, 
#[#set math.equation(numbering: n => "(6.4)")
 $ g_(upright("long")) = g_(S^2 \( 1 \/ sqrt(2) \)) + 1 / 2 thin d xi^2 + 2 thin d theta_x^2 . $ <eq:geometry:long-model>]

 The same description holds for every toric macro whose normalized length $L = 1 \/ \( a + b_0 \)$ tends to infinity. All such tube lengths are $O \( epsilon.alt^(- 1) \)$. The tubes lie in $C_0$ and are disjoint from both middle spheres $J_i$.]
  + #emph[Along any sequence of these parameters, every additional unbounded region is one of the following: an exact rational product collar, an annulus approaching a positive-scalar-curvature product, or one of the tubes in (iii). The remaining pieces, after the specified satellite rescalings, have uniformly bounded geometry on fixed truncations. There are only finitely many such pieces for the fixed stack. Away from fixed-length tube ends, the error from (6.4), with any fixed number of spatial derivatives, tends to zero as the distance from both ends tends to infinity. In particular the integrated errors used in Section 7 are $o \( epsilon.alt^(- 1) \)$, uniformly under deeper regularization and longer auxiliary rational collars. For scalar-curvature costs, the middles of the $Y_j$ collars are omitted, retaining prefixes of length $O \( epsilon.alt^(- 1 \/ 2) \)$; no positivity is required on a $Y_j$ cross-section.]
  + #emph[For each fixed real cohomology class $Lambda$ there are closed comparison forms with its prescribed vertical flux on these tubes, zero curvature on the long parts of rational collars, and $o \( epsilon.alt^(- 1) \)$ energy away from the tubes. More precisely, the uniform comparison and error assertions are those of Lemma 63.]
  #emph[The construction is smooth at finite parameter values and has the ordinary product description on every genuine length collar. Only spatial derivative estimates are asserted uniformly as lengths diverge; no bound on derivatives in a compactifying length coordinate is needed.]
] <thm:geometry:family>

The proof occupies the rest of this section. The theorem supplies the geometry for the simultaneous Abelian tests, whose statement and proof are Theorem 64. Harmonic background connections and their exact product convention at genuine faces are constructed in Section 7; this will also ensure that the complementary data agree under the lens flip.

=== 6.1 Embedded plumbings and the period polygon <embedded-plumbings-and-the-period-polygon>

#thm([Lemma 6.2.])[
  (Placement of the interfaces).  #emph[The neighborhoods in (6.2) can be placed strictly inside the macro so that $U$ is disjoint from $J_1 union J_2$, $C_(1 \, i)$ is disjoint from $J_i$, $N_(3 - i) subset C_(1 \, i)$, and $C_0 subset C_(1 \, 1) ∩ C_(1 \, 2)$. The simultaneous separating interfaces required below can be chosen disjoint or nested. The two interfaces $partial C_(1 \, 1)$ and $partial C_(1 \, 2)$ are never required simultaneously, and neither is a $C_0$ separation required together with an $N_i$ separation.]
] <lem:geometry:plumbing>

#proof[
  The four increases of framing in the positive path replace the $\( - 2 \)$ trace by a $2$ trace blown up at four distinct points of its core. This is the corner-blowdown description in Proposition 43. Its cocore disk can be chosen away from those four points. On adjoining the reverse $2$ trace, the two cocores join to a sphere. The two normal disk trivializations agree along their common boundary with opposite boundary orientations, so the normal Euler number of this double is zero. The double meets each neighboring end core once. With the orientations (6.1), these intersections are positive. The cocore double lies between the two middle cuts, whereas $X_i$ passes through its own middle cut $J_i$. Consequently the double is disjoint from both $J_i$.
  At each intersection choose oriented complex disk coordinates in which the two spheres are the coordinate axes. Plumbing their normal disk bundles by exchanging base and fiber disks gives a neighborhood of the embedded configuration; its Euler numbers are $- 4 \, 0 \, - 4$. Taking sufficiently small disk fibers gives $C_2$ inside the macro. The subconfiguration $U union X_(3 - i)$ misses $J_i$, so its smaller regular neighborhood $C_(1 \, i)$ also misses $J_i$. Shrink $N_(3 - i)$ inside it and choose a still smaller $C_0$ common to both subchain neighborhoods. This proves the asserted geometric placements.
  The restrictions on simultaneous interfaces follow from the parameter regions used below: a low-side separation has the other coefficient bounded away from zero in normalized units, and thus cannot coexist with the other low-side separation. An opposite high-side $N_(3 - i)$ separation is inside $C_(1 \, i)$. The region using only $C_0$ has both coefficients small, so no high-side separation occurs there. We therefore need only nested subchain neighborhoods and disjoint disk bundle neighborhoods; small isotopies make their collars disjoint. ◻
]

For $0 < a \, b_0 < 1 \/ 4$, consider the polygon

#[#set math.equation(numbering: n => "(6.5)")
 $ cal(P) \( a \, b_0 \) = { \( x \, y \) : 4 \| y \| lt.eq x lt.eq 1 \, med - a lt.eq y lt.eq b_0 } . $ <eq:geometry:polygon>]

The angle lattice is $2 pi bb(Z)^2$. In cyclic order the inward normals are

#[#set math.equation(numbering: n => "(6.6)")
 $ n_p = \( 1 \, 4 \) \, quad n_1 = \( 0 \, 1 \) \, quad n_o = \( - 1 \, 0 \) \, quad n_2 = \( 0 \, - 1 \) \, quad n_q = \( 1 \, - 4 \) . $ <eq:geometry:normals>]

The vertex $\( 0 \, 0 \)$ has determinant eight. We always remove its cone point and attach the resulting outer lens boundary to the macro exterior. Figure 5 shows the compact divisors that remain.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (1.536, -0.384), (3.2, -0.384), (3.2, 0.544), (2.176, 0.544), close: true, fill: rgb("#f5f5ff"), stroke: none)
  line((0.256, -0.064), (1.536, -0.384), (3.2, -0.384), (3.2, 0.544), (2.176, 0.544), (0.256, 0.064), stroke: (thickness: 0.4pt))
  arc((0.256, -0.064), start: -90deg, stop: 90deg, radius: (0.0576, 0.064), stroke: (thickness: 0.4pt, dash: "dashed"))
  content((0.128, 0), [$partial C_2$], anchor: "east")
  content((2.432, -0.384), [$X_1$], anchor: "north")
  content((3.2, 0.08), [$U$], anchor: "west")
  content((2.688, 0.544), [$X_2$], anchor: "south")
  content((0.928, -0.24), [$x+4y=0$], anchor: "north-east")
  content((1.248, 0.32), [$x-4y=0$], anchor: "south-east")
  line((3.968, -0.384), (3.968, 0.544), stroke: (paint: rgb("#808080"), thickness: 0.4pt), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((3.968, 0.08), [$a+b_0$], anchor: "west")
  line((5.632, 0.08), (7.36, 0.08), stroke: (thickness: 0.4pt))
  circle((5.632, 0.08), radius: 0.0864, fill: rgb("#ffffff"), stroke: none)
  circle((5.632, 0.08), radius: 0.0864, stroke: (thickness: 0.4pt))
  content((5.632, 0.1837), [$X_1$], anchor: "south")
  content((5.632, -0.02368), [$-4$], anchor: "north")
  circle((6.496, 0.08), radius: 0.0864, fill: rgb("#ffffff"), stroke: none)
  circle((6.496, 0.08), radius: 0.0864, stroke: (thickness: 0.4pt))
  content((6.496, 0.1837), [$U$], anchor: "south")
  content((6.496, -0.02368), [$0$], anchor: "north")
  circle((7.36, 0.08), radius: 0.0864, fill: rgb("#ffffff"), stroke: none)
  circle((7.36, 0.08), radius: 0.0864, stroke: (thickness: 0.4pt))
  content((7.36, 0.1837), [$X_2$], anchor: "south")
  content((7.36, -0.02368), [$-4$], anchor: "north")
})],
  caption: [Figure 5: The punctured polygon and its compact divisor chain. The three affine edge lengths are $1 - 4 a$, $a + b_0$, and $1 - 4 b_0$. Shrinking a horizontal edge separates its $\( - 4 \)$ disk bundle. Sending $a$ or $b_0$ to zero instead moves the outer cone point to a subchain interface; the true middle-sphere cut is introduced outside that interface. ],
) <fig:geometry:polygon>

#thm([Lemma 6.3.])[
  (The toric model and its periods).  #emph[The toric space associated to the punctured polygon is $C_2$. With $w = a + b_0$ and normalized coordinates 
#[#set math.equation(numbering: n => "(6.7)")
 $ xi = x \/ w \, quad y' = y \/ w \, quad L = 1 \/ w \, quad r_1 = a \/ w \, quad r_2 = b_0 \/ w \, #h(2em) r_1 + r_2 = 1 \, $ <eq:geometry:normalization>]

 it has a toric Kähler metric 
#[#set math.equation(numbering: n => "(6.8)")
 $ g & = 1 / 2 M_(i j) thin d mu_i thin d mu_j + 2 \( M^(- 1) \)_(i j) thin d theta_i thin d theta_j \, #h(2em) \( mu_1 \, mu_2 \) = \( xi \, y' \) \,\
M & = C + sum_nu frac(n_nu n_nu^t, l_nu) \, #h(2em) C = mat(delim: "(", 1, 0; 0, 0) \,\
\( l_p \, l_1 \, l_o \, l_2 \, l_q \) & = \( xi + 4 y' \, r_1 + y' \, L - xi \, r_2 - y' \, xi - 4 y' \) . $ <eq:geometry:hessian>]

 Its positive Kähler ray is (6.3), and 
#[#set math.equation(numbering: n => "(6.9)")
 $ H X_1 = 1 - 4 a \, quad H U = a + b_0 \, quad H X_2 = 1 - 4 b_0 \, #h(2em) H^2 = 2 \( a + b_0 \) - 4 \( a^2 + b_0^2 \) > 0 . $ <eq:geometry:period-pairings>]

 At $a = 0$ or $b_0 = 0$, with $w > 0$, the retained piece is the indicated punctured subplumbing $C_(1 \, i)$. At a coefficient $1 \/ 4$, the retained piece is punctured at the collapsed $X_i$ divisor. The affine term for a collapsed facet is retained in the limiting potential. These limits may occur together.]
] <lem:geometry:toric>

#proof[
  Every successive normal pair except $\( n_q \, n_p \)$ has determinant one. The corresponding torus corner chart is a smooth bidisk: the two circle subgroups normal to its sides collapse on its coordinate axes. Gluing these charts along an edge identifies the normal disk fibers with the framing determined by the third normal. The relations
  $ n_p + n_o = 4 n_1 \, #h(2em) n_1 + n_2 = 0 \, #h(2em) n_o + n_q = 4 n_2 $
  therefore give Euler numbers $- 4 \, 0 \, - 4$, respectively. At the remaining corner $\| det \( n_q \, n_p \) \| = 8$, so its removed neighborhood is a cone on a lens space of order eight. These charts construct exactly the plumbing in Lemma 55, without changing its underlying smooth four-manifold.
  The matrix $M \/ 2$ is the Hessian of
  $ 1 / 4 xi^2 + 1 / 2 sum_nu l_nu log l_nu . $
  It is positive definite in the polygon interior since its normals span $bb(R)^2$. The coefficient $1 / 2$ of each primitive boundary term gives the smooth polar-coordinate extension along a simple facet. At a determinant-one corner this holds in both disk coordinates; at the removed corner it holds on the finite quotient chart. This is the toric boundary convention of #cite(label("Guillemin1994")), also verified directly by setting the normal moment variable equal to half the square of a radial coordinate.
  For the unnormalized polygon the affine lengths of the compact facets are $1 - 4 a$, $w$, and $1 - 4 b_0$; symplectic areas are $2 pi$ times these lengths. The intersection matrix in the ordered basis $\( X_1 \, U \, X_2 \)$ is
  #[#set math.equation(numbering: n => "(6.10)")
   $ mat(delim: "(", - 4, 1, 0; 1, 0, 1; 0, 1, - 4) . $ <eq:geometry:plumbing-matrix>]
  It is nonsingular with determinant eight and signature $\( 1 \, 2 \)$. Solving for the class with these three periods gives $U + a X_1 + b_0 X_2$. Normalizing the metric divides its Kähler form by $w$ and hence does not change this ray. Direct multiplication gives (6.9); positivity follows also from $a^2 + b_0^2 lt.eq \( a + b_0 \) \/ 4$.
  If $a = 0$, the $X_1$ coefficient is absent, so the class is carried by the subchain $U \, X_2$. The new vertex is removed, while the affine term belonging to the collapsed outer edge remains as a redundant term in the Hessian. The other low limit is identical with the indices exchanged. If $a = 1 \/ 4$, then $H X_1 = 0$. The rational orthogonal decomposition at $partial N_1$ consequently puts the whole class on the complement of $N_1$. The same argument applies to $X_2$. The subchain matrix has determinant $- 1$; each isolated disk bundle has determinant $- 4$. Thus all these separating boundaries are rational homology spheres, so the decompositions over $bb(R)$ are nondegenerate. Removing only negative directions, or retaining the subchain of signature $\( 1 \, 1 \)$, leaves positive rank one. ◻
]

=== 6.2 Scalar curvature of the Hessian metrics <scalar-curvature-of-the-hessian-metrics>

We give the curvature calculation because its quantitative strictness is needed when the tips are changed conformally. It applies to both the main polygon and the satellite metrics.

#thm([Lemma 6.4.])[
  (Curvature and dependence bounds).  #emph[Let $l_nu$ be positive affine functions with gradients $n_nu$ spanning $bb(R)^2$, and let $C gt.eq 0$ be constant. For the metric (6.8), put 
$ B = M^(- 1) \, quad A_nu = B^(1 \/ 2) n_nu \/ sqrt(l_nu) \, quad P_(nu mu) = A_nu^t A_mu \, quad z_nu = l_nu^(- 1 \/ 2) \, quad q_nu = z_nu P_(nu nu) . $

 Then $0 lt.eq P lt.eq I$, $"Scal" \( g \) = 2 cal(S)$, and 
#[#set math.equation(numbering: n => "(6.11)")
 $ cal(S) & = 2 sum_nu z_nu^2 P_(nu nu)^2 - q^t P q - z^t P^(compose 3) z\
 & = q^t \( I - P \) q + z^t #scale(x: 120%, y: 120%)[\(] \( I - P \) compose \( P compose P \) #scale(x: 120%, y: 120%)[\)] z gt.eq 0 . $ <eq:geometry:scalar-identity>]

 Here $compose$ is entrywise product. For every nonzero relation $sum_nu gamma_nu n_nu = 0$, its two nonnegative terms satisfy 
#[#set math.equation(numbering: n => "(6.12)")
 $ q^t \( I - P \) q & gt.eq frac(\( sum_nu gamma_nu P_(nu nu) \)^2, sum_nu gamma_nu^2 l_nu) \,\
z^t #scale(x: 120%, y: 120%)[\(] \( I - P \) compose \( P compose P \) #scale(x: 120%, y: 120%)[\)] z & gt.eq frac(∥sum_nu gamma_nu A_nu A_nu^t∥_(upright("HS"))^2, sum_nu gamma_nu^2 l_nu) . $ <eq:geometry:first-bound>]

 The main metrics have strictly positive scalar curvature on compact sets away from punctures, including their smooth toric axes. This strictness remains uniform on fixed compact truncations of their $L arrow.r oo$ tips and of the three-direction satellites below.]
] <lem:geometry:scalar>

#proof[
  Let $A$ be the matrix with columns $A_nu$. Then
  $ A A^t = B^(1 \/ 2) \( M - C \) B^(1 \/ 2) = I - B^(1 \/ 2) C B^(1 \/ 2) lt.eq I . $
  Hence $P = A^t A$ is a positive contraction. For completeness set $G_(nu mu) = n_nu^t B n_mu$. Differentiating $B M = I$ gives
  $ partial_k B = sum_nu n_(nu k) / l_nu^2 B n_nu n_nu^t B . $
  Differentiating once more, contracting the two derivative indices, and collecting the derivative of $l_nu^(- 2)$ separately from the two derivatives of $B$ yields
  $ - partial_i partial_j B_(i j) = 2 sum_nu G_(nu nu)^2 / l_nu^3 - sum_(nu \, mu) frac(G_(nu nu) G_(mu mu) G_(nu mu) + G_(nu mu)^3, l_nu^2 l_mu^2) . $
  The real Riemannian scalar curvature of a toric metric is minus the contracted second derivative of its inverse potential Hessian #cite(label("Abreu1998")) Theorem 4.1(i), arXiv version 1; it is twice the Kähler scalar curvature denoted by $R$ in that reference. That inverse Hessian is $2 B$ here, proving (6.11), including its factor two. The second equality uses $"diag" \( P_(nu nu)^2 \) - P^(compose 3) = \( I - P \) compose \( P compose P \)$. Both summands are nonnegative by the Schur product theorem.
  Let $k_nu = gamma_nu sqrt(l_nu)$. The relation on the normals gives $A k = 0$, hence $P k = 0$ and
  $ I - P gt.eq frac(k k^t, parallel k parallel^2) . $
  Pairing with $q$ proves (6.12). Schur-multiplying the same inequality by $P compose P$ and pairing with $z$ proves (6.12), because
  $ sum_(nu \, mu) gamma_nu gamma_mu \( A_nu^t A_mu \)^2 = ∥sum_nu gamma_nu A_nu A_nu^t∥_(upright("HS"))^2 . $
  For the full polygon use the positive dependence $gamma = \( 1 \, 1 \, 2 \, 1 \, 1 \)$ in the order $\( p \, 1 \, o \, 2 \, q \)$. Its first numerator is strictly positive in the interior. At a simple facet its active column $A_nu$ tends to a unit vector, so $P_(nu nu) arrow.r 1$ and this numerator remains positive. At a smooth vertex the two active columns tend to orthonormal vectors, with the same conclusion. These assertions follow either by inverting $M$ in active-normal coordinates or by taking the Schur complement of its singular normal term. They also prove a positive lower bound on any compact smooth truncation.
  For the tip with $xi = O \( 1 \)$ and $L arrow.r oo$, discard the vanishing $n_o$ term and use $n_1 + n_2 = 0$. Its denominator is $l_1 + l_2 = 1$, and its first numerator is $\( P_11 + P_22 \)^2$. In the interior this is positive. On an active horizontal edge one diagonal term tends to one. On an active sloping edge, the projections of $n_1 \, n_2$ to the remaining tangent direction are nonzero; inversion on that direction again gives a positive limit. At a smooth vertex one horizontal edge is active. Thus strictness extends to all smooth boundary points of each fixed truncated tip.
  After satellite rescaling the constant $C$ disappears and exactly three distinct normal directions remain. Their unique relation has three nonzero coefficients. The three rank-one symmetric matrices $n_nu n_nu^t$ are linearly independent: in coordinates where two directions are the axes, the third has a nonzero off-diagonal entry. Conjugation by $B^(1 \/ 2)$ and multiplication by positive $l_nu^(- 1)$ preserve independence. Thus the numerator of (6.12) is nonzero in the interior. At a simple edge its active unit column is orthogonal in the limit to the other columns, so the corresponding nonzero coefficient prevents cancellation. At a smooth vertex the two active columns are orthonormal and again prevent cancellation. The same bound is positive on each compact truncation, including the smooth axes. ◻
]

#thm([Lemma 6.5.])[
  (Cone links).  #emph[At every puncture, the homogeneous Hessian formed from precisely the vanishing linear terms is a metric cone. Its smooth link has scalar curvature at least six. The link at a collapsed $X_i$ admits a path through positive-scalar-curvature metrics to the round lens metric.]
] <lem:geometry:cones>

#proof[
  Write $E = mu_i partial_(mu_i)$ for the moment Euler field at the vertex. For homogeneous $l_nu$ and $C = 0$,
  $ g \( E \, dot.op \) = 1 / 2 d sum_nu l_nu \, #h(2em) R^2 = 2 sum_nu l_nu . $
  The dilation of moment variables by $s^2$ multiplies $g$ by $s^2$, and $2 E = R partial_R$ has squared length $R^2$. Thus $g = d R^2 + R^2 h$. Its scalar curvature is $R^(- 2) \( "Scal" \( h \) - 6 \)$, so Lemma 57 gives $"Scal" \( h \) gt.eq 6$. Each bounding side has primitive normal. The torus action therefore has no finite isotropy along its collapsed circle, and the link is smooth, even when the cone vertex itself is a finite quotient singularity.
  At $N_1$ the adjacent linear forms are $p$ and $v$ below, and the redundant form is $\( p + v \) \/ 4$. Multiply its Hessian contribution by $s in \[ 0 \, 1 \]$. For $s > 0$ this is the contribution of the positive linear form $s \( p + v \) \/ 4$ itself, since $nabla \( s l \) nabla \( s l \)^t \/ \( s l \) = s nabla l nabla l^t \/ l$. The nonnegative scalar calculation applies for every $s$, including the two-form limit $s = 0$. Identifying the radius-one links by radial dilation gives a smooth path with scalar curvature at least six. At $s = 0$ the two independent primitive-side terms give the flat quotient of $bb(C)^2$, whose link is the round lens space. The other side is obtained by reflection. ◻
]

=== 6.3 Shrinking edges, satellites, and cylindrical completions <shrinking-edges-satellites-and-cylindrical-completions>

In the normalized polygon the parameters measuring an edge shrink are

#[#set math.equation(numbering: n => "(6.13)")
 $ r_i \, #h(2em) h_i = L \/ 4 - r_i . $ <eq:geometry:shrink-parameters>]

Only one $r_i$ can be small, because $r_1 + r_2 = 1$. A small $h_i$ occurs near the corresponding right-hand corner and separates $N_i$. A small $r_i$ occurs at a different corner and separates $C_(1 \, i)$. These zones can be chosen disjoint. The sole nesting is the original determinant-eight puncture inside an $r_i$ satellite. We retain this distinction in choosing the conformal factors.

#thm([Lemma 6.6.])[
  (Uniform collar and satellite models).  #emph[For every fixed derivative order $k$, the metric near an edge with shrink parameter $delta = r_i$ or $h_i$ has the following description. There is a homogeneous radius $R$ and a cone metric $g_(upright(c))$ such that, in scale-invariant $C^k$ norms on every dyadic annulus, 
#[#set math.equation(numbering: n => "(6.14)")
 $ parallel g - g_(upright(c)) parallel_(C^k \( g_(upright(c)) \)) lt.eq C_k #scale(x: 120%, y: 120%)[\(] delta \/ R^2 + R^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) C sqrt(delta) lt.eq R lt.eq R_(*) . $ <eq:geometry:cone-error>]

 The estimates include smooth toric axes and are uniform on the $L arrow.r oo$ tips. In affine moment coordinates $mu_(upright("loc"))$ centered at the relevant homogeneous cone vertex, the scale $mu_(upright("loc")) = delta hat(mu)_(upright("loc"))$ gives $g = delta \( g_(upright("sat")) + o \( 1 \) \)$ on compact sets away from any remaining cone point. The metric $g_(upright("sat"))$ is a three-direction Hessian metric with strictly positive scalar curvature on those compact sets.]
  #emph[There are conformal changes making all the necessary annuli asymptotically cylindrical, with fixed positive limiting link sizes. They have nonnegative scalar curvature and preserve strict positivity on smooth compact regions. Arbitrarily deep in those annuli one may interpolate to the exact limiting product over a bounded logarithmic width, with $C^k$ errors tending to zero. In particular the separated $N_i$ cap can be made positive everywhere, including its exact product end.]
] <lem:geometry:collars>

#proof[
  The two local calculations are explicit. At a small $h_1$, set
  $ p = xi + 4 y' \, #h(2em) v = L - xi . $
  The three relevant forms are $p \, v \, \( p + v \) \/ 4 - h_1$. Their homogeneous limits are $p \, v \, \( p + v \) \/ 4$. At a small $r_1$, set
  $ q = xi - 4 y' \, #h(2em) l = r_1 + y' . $
  The relevant forms are $q \, l \, q + 8 l - 8 r_1$, with homogeneous limits $q \, l \, q + 8 l$. Reflection gives side two. In each case use the sum of the three homogeneous forms to define $R$ as in Lemma 58.
  Only the redundant homogeneous form is shifted. It is uniformly comparable to $R^2$: in the high model $\( p + v \) \/ 4 = R^2 \/ 10$, and in the low model $R^2 \/ 4 lt.eq q + 8 l lt.eq 4 R^2 \/ 9$. Replacing that denominator by its shift of size $O \( delta \)$ therefore gives a relative error $O \( delta \/ R^2 \)$. The bounding side forms are unchanged, including where one vanishes on an axis. The constant matrix and the remaining regular facet terms give a relative error $O \( R^2 \)$. Differentiating after rescaling the annulus to unit size gives the same bound at every fixed derivative order. Near a simple axis, use the square root of its vanishing affine form as the radial disk coordinate. The singular normal term is then precisely the smooth polar disk metric, and its coefficients and those of the inverse Hessian obey the same estimates. This proves (6.14) through the axis. At the left tip as $L arrow.r oo$, the omitted $l_o^(- 1)$ term is bounded with all scaled derivatives and tends to zero; all other omitted denominators stay bounded away from zero on the chosen zone. Thus the constants are uniform there.
  Use $mu_(upright("loc")) = \( p \, v \)$ at a high-side shrink and $mu_(upright("loc")) = \( q \, l \)$ at a low-side shrink. In the variables $hat(mu)_(upright("loc")) = mu_(upright("loc")) \/ delta$, the three singular Hessian terms have factor $delta^(- 1)$ while $d mu_(upright("loc"))$ has factor $delta$. The moment and angle terms of the metric both have factor $delta$. Removing that factor leaves exactly the three affine-direction metric. The constant and regular terms tend to zero. Lemma 57 proves its asserted strict positivity.
  Choose a nondecreasing smooth function $chi_oo$ which is zero below a large fixed number and one above a larger fixed number, and put
  #[#set math.equation(numbering: n => "(6.15)")
   $ F \( t \) = integral_t^oo chi_oo \( s \) s^(- 2) thin d s \, #h(2em) f = 1 + c thin chi_0 \( R \) delta^(- 1 \/ 2) F \( R \/ sqrt(delta) \) . $ <eq:geometry:conformal-factor>]
  Here $chi_0$ is one at small fixed radius and cuts off at a slightly larger fixed radius. Choose those radii inside the zone above. The new metric is $f^2 g$. In dimension four its scalar curvature is $f^(- 3) \( - 6 Delta_g + "Scal" \( g \) \) f$, where $Delta_g = "div" "grad"$.
  For $q \( R \) = delta^(- 1 \/ 2) F \( R \/ sqrt(delta) \)$ a direct calculation gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ Delta_g q = - frac(chi'_oo \( R \/ sqrt(delta) \) \| d R \|^2, sqrt(delta) thin R^2) + frac(chi_oo \( R \/ sqrt(delta) \), R^3) #scale(x: 120%, y: 120%)[\(] 2 \| d R \|^2 - R Delta_g R #scale(x: 120%, y: 120%)[\)] . $ <eq:geometry:radial-laplacian>]
  For the exact cone, $R Delta R = 3 \| d R \|^2$. By (6.14), choosing the initial ramp point large and $R_(*)$ small gives $R Delta_g R > \( 2 + sigma \) \| d R \|^2$ for one fixed $sigma > 0$ where $q$ starts decreasing. Thus $- Delta_g q$ is positive there. Where $q$ is constant, strict positivity of the base scalar curvature suffices. On the outer cutoff annulus, the main or rescaled-tip metrics have a common positive scalar lower bound; choosing $c > 0$ sufficiently small absorbs all derivatives of $chi_0$. We obtain $\( - 6 Delta_g + "Scal" \( g \) \) f > 0$ on the smooth part. The coefficient $c$ may be tapered smoothly to zero when $delta$ leaves its small-parameter zone. Choose the taper only where the same strict compact bounds hold. The limiting factor is $1 + c \/ R$ on the cylindrical annulus, with fixed $c > 0$ near $delta = 0$.
  At the original puncture the homogeneous radius is $R_8 = sqrt(4 xi)$. Add a cutoff multiple $c_8 \/ R_8$. If no $r_i$ is small, this is the preceding construction without an inner smoothing scale. If $r_i arrow.r 0$, place its cutoff at a fixed sufficiently small radius in the rescaled satellite, that is, at $R_8$ comparable to a small fixed multiple of $sqrt(r_i)$. It then lies where the first factor in (6.15) is constant of order $r_i^(- 1 \/ 2)$. Write $R_8 = sqrt(r_i) rho$ and cancel this scale against $g = r_i g_(upright("sat")) + o \( r_i \)$. The added factor is a fixed multiple of $c_8 \/ rho$ on a fixed-scale satellite. Its cutoff error is therefore absorbed by the satellite’s strict compact positivity after choosing $c_8$ small. This also shows that the nested link does not shrink to zero. At most one such nesting occurs. The other zones are disjoint, so their choices do not interfere.
  On a cylinder use $s = - log R$. The cone metric multiplied by $\( c \/ R \)^2$ is $c^2 \( d s^2 + h \)$. The difference between $1 + c \/ R$ and $c \/ R$ has relative size $O \( R \/ c \)$, in addition to the error (6.14). Interpolating to $c^2 \( d s^2 + h \)$ over a fixed $s$-width deep in the annulus has errors tending to zero with all fixed spatial derivatives. Because the product scalar curvature is bounded positively away from zero, a sufficiently deep interpolation preserves positivity. The same argument applies at the nested puncture after rescaling. On a separated high-side satellite, the compact core and the entire outward conformal annulus are positive; the exact product continuation is positive as well. This is the required complete positive metric on $N_i$. ◻
]

=== 6.4 The interval cube and its true ends <the-interval-cube-and-its-true-ends>

Use coordinates $t_i in \[ - 3 \, 3 \]$ on the two intervals of a macro. The true $J_i$ face is $t_i = - 3$, and the true $N_i$ face is $t_i = 3$. Choose a smooth nondecreasing function $alpha_i \( t_i \)$ which is zero for $t_i lt.eq 0$, equals $1 \/ 4$ for $t_i gt.eq 1$, and increases between these values on $\( 0 \, 1 \)$. It may be taken stationary to all orders at the endpoints. A sphere test keeps its whole-loop rule for $t_i gt.eq 0$. Its conversion to the two segment rules of Section 5 takes place only at $t_i < 0$, after that side is no longer used as a whole test.

Set $w_0 = alpha_1 + alpha_2$. For $w_0 gt.eq 3 epsilon.alt$ the target coefficients are $\( alpha_1 \, alpha_2 \)$. For a finite smooth metric replace them by

#[#set math.equation(numbering: n => "(6.17)")
 $ a_i = alpha_i + d w_0 \( 1 - 8 alpha_i \) \, #h(2em) \( a_1 \, a_2 \) = \( a \, b_0 \) \, #h(2em) w = w_0 #scale(x: 120%, y: 120%)[\(] 1 + d \( 2 - 8 w_0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:geometry:regularization>]

For a common sufficiently small $d > 0$, both coefficients lie strictly between zero and $1 \/ 4$. At low saturation $alpha_i = 0$, and at high saturation $alpha_i = 1 \/ 4$, respectively, the shrink parameter is

#[#set math.equation(numbering: n => "(6.18)")
 $ r_i = frac(d, 1 + d \( 2 - 8 w_0 \)) \, #h(2em) h_i = frac(d, 1 + d \( 2 - 8 w_0 \)) . $ <eq:geometry:saturation-scale>]

Thus there is one uniform small scale for productizing at either saturation.

#thm([Proposition 6.7.])[
  (Assembly in the positive-width region).  #emph[For $w_0 gt.eq 3 epsilon.alt$, the toric models and their collars form a smooth family on the fixed macro. The low and high saturation regions extend to the prescribed true faces. At fixed $epsilon.alt$, as $d arrow.r 0$, all retained positive-width main pieces converge on compact subsets to the complete conformal metrics of Theorem 54(ii), uniformly under further genuine length insertions.]
] <prop:geometry:assembly>

#proof[
  Always remove the original outer cone point, complete it by Lemma 59, and attach its product collar to the exterior of $C_2$. The collar is an artificial finite collar. Its productization may be moved arbitrarily far down the puncture as $d arrow.r 0$, so on every compact subset the retained metric is exactly conformal to (6.8) in the limit.
  Near a saturation, productize at $R asymp d^(1 \/ 4)$ whenever the corresponding $delta$ is at most $2 d$, and turn off this productization by $delta = 3 d$. Equations (6.14) and (6.18) show that its Hessian error is $O_k \( sqrt(d) \)$, while its conformal product error is $O_k \( d^(1 \/ 4) \)$. A fixed-width cutoff in $log R$ therefore has vanishing errors. Use the adjacent affine forms to fix the angular coordinates of this product. They determine its link independently of all tangential parameters.
  For $t_i gt.eq 1$, this gives an exact collar separating $N_i$. Attach any additional length inside the exact product, with length zero initially and tending to infinity only as $t_i arrow.r 3$. Keep the link and the coefficient $c$ fixed on that collar. The satellite on the $N_i$ side is the positive cap of Lemma 59. Its metric, like every retained sector, is unaffected by length inserted in another disjoint product collar. The metric on the complementary sector is unchanged by the bit supported on $X_i$.
  For $t_i lt.eq 0$, the collar instead separates $C_(1 \, i)$. It must be retained while the exterior is changed to introduce $J_i$. Since $w_0 gt.eq 3 epsilon.alt$, the other coefficient is positive; there is no competing second low separation. First extend the outer-puncture productization back to a fixed sufficiently far-out portion of the rescaled satellite, where it is already close to a positive product. Shorten that obsolete outer collar there. Similarly extend the product structure a bounded distance toward the compact part on the $C_(1 \, i)$ side, while retaining the auxiliary $partial C_(1 \, i)$ collar, whose length tends to infinity as $d arrow.r 0$. For fixed auxiliary choices this collar remains finite as $t_i arrow.r - 3$. All of these extensions take place in positive-product regions, so they have bounded geometry and preserve positive scalar curvature along their long parts.
  The exterior of this retained collar now consists of bounded pieces. On those pieces interpolate to a metric with a round product collar at $J_i$, and fixed data on its far side. This is possible because $C_(1 \, i)$ misses $J_i$ by Lemma 55. Keep the inner collar fixed during the interpolation. Only after reaching the round product data insert the genuine $J_i$ length, tending to infinity as $t_i arrow.r - 3$. The far side was made independent of the other interval parameter before this insertion. Consequently the true split has the required local parameter dependence. The retained main metric and its long $partial C_(1 \, i)$ collar have not been changed.
  Use successive closed subintervals of the low or high saturation range for these operations, with each operation stationary near the joints. If another parameter has no active operation it simply waits. Disjoint genuine collars then permit independent insertion lengths. In a low-high corner the $N_(3 - i)$ collar is inside $C_(1 \, i)$ and its length insertion commutes with the exterior low-side operation. This gives the asserted compatibility.
  It remains to justify that these varying polygons and interfaces are placed on one fixed manifold. Start from a fixed punctured plumbing polygon, with marked cross curves for the interfaces actually in use. A cross curve near a shrinking $X_i$ edge bounds that divisor’s disk bundle. A cross curve at small $r_i$ joins the $X_i$ edge to the far sloping side; its inner side contains exactly the subchain $U \, X_(3 - i)$. A cross curve joining the two horizontal sides in the long strip bounds the chosen $U$ neighborhood. These are exactly the neighborhood types in Lemma 55.
  On each side of the polygon, place the endpoints of these curves by increasing coordinate changes. Their order does not change, since only compatible disjoint or nested curves are marked together. Choose the curves as segments or graphs in rectangular side charts and extend their motion by vector fields tangent to the polygon faces, supported away from unmarked corners. On the remaining disk interiors extend the motion with a cutoff. This constructs smooth face-preserving diffeomorphisms carrying the marked collars to the fixed interfaces. Near a face they are smooth positive rescalings of its normal variable, so their lifts in the square-root disk coordinates are smooth. Carry the angle torus along with these maps; its lattice and all transition functions are fixed. The two low placements use disjoint parameter zones and fix the common smaller $C_0$ whenever it is marked. Thus they impose no crossing condition on one another.
  For any exterior interpolation first shorten unretained long products, trivialize the resulting bounded pieces by these maps, and interpolate the positive-definite tensors there with their product collars fixed. Reinsert retained products afterward. This is a convex interpolation on a compact family of bounded pieces and hence gives uniform spatial geometry; it does not require a uniform parameter derivative in a stretching coordinate. The construction is stationary on smaller genuine face collars except for the prescribed lengths and retained tangential parameters. It proves both smooth assembly and the stated convergence. ◻
]

=== 6.5 Small width and the long spherical tube <small-width-and-the-long-spherical-tube>

#thm([Lemma 6.8.])[
  (The tube and the corner replacement).  #emph[The family of Proposition 60 extends across $w_0 lt.eq 3 epsilon.alt$ to the low-low corner, with exactly the true cuts $J_1 \, J_2$. Every macro in this region contains a tube of fiber class $U$ and length comparable to $epsilon.alt^(- 1)$. The extension satisfies the uniform description in Theorem 54(iii)–(iv).]
] <lem:geometry:tube>

#proof[
  First suppose $w_0 in \[ epsilon.alt \, 3 epsilon.alt \]$, so $L asymp epsilon.alt^(- 1)$ and no high coefficient is saturated. Put $z = y' + r_1$. On the strip between the two horizontal faces, $0 lt.eq z lt.eq 1$. The two horizontal Hessian terms add to $1 \/ \[ z \( 1 - z \) \]$ in the $y'$ direction. If both $xi$ and $L - xi$ tend to infinity, the other facet terms tend to zero. Thus the limiting metric is
  #[#set math.equation(numbering: n => "(6.19)")
   $ frac(d z^2, 2 z \( 1 - z \)) + 2 z \( 1 - z \) d theta_y^2 + 1 / 2 d xi^2 + 2 d theta_x^2 . $ <eq:geometry:explicit-tube>]
  Under $z = \( 1 + cos phi \) \/ 2$ its first two terms are $1 / 2 \( d phi^2 + sin^2 phi thin d theta_y^2 \)$. This proves the radius and normalization in (6.4). The class of the spherical fiber is $U$, since it is the toric sphere transverse to the longitudinal strip between the two horizontal facets.
  For every fixed derivative order, on $T lt.eq xi lt.eq L - T$ the error is bounded by a number $eta_k \( T \) arrow.r 0$ as $T arrow.r oo$, uniformly in $r_i in \[ 0 \, 1 \]$. This follows by differentiating the remaining reciprocal affine terms; the denominators are at least a fixed multiple of the distance to a strip end when $T$ is large. Using $sqrt(z)$ and $sqrt(1 - z)$ near the two sphere poles gives the same conclusion through the axes. All conformal tip changes were supported in bounded end regions and do not meet this bulk strip.
  Choose a large fixed $T$. First interpolate on the strip to make the metric exactly (6.4) between $2 T$ and $L - 2 T$, using cutoffs in fixed-width transition strips. The interpolated errors obey the same bulk bounds, in particular with two derivatives. Within the parameter region $epsilon.alt lt.eq w_0 lt.eq 3 epsilon.alt$, deform the toric model from regularizer $d$ to one fixed small positive value. The obsolete artificial collar lengths then become bounded. Throughout these stages retain the low-saturation exterior procedure of Proposition 60 if either parameter is low. It changes only an exterior of the retained subchain and does not reach the tube.
  Now bring the exact tube to a fixed length comparable to $epsilon.alt^(- 1)$. The remaining tips, in normalized coordinates, have bounded size, and their effective $r_i$ are bounded away from zero because the regularizer has been fixed positively. Interpolate these bounded pieces to template metrics with product collars at both $J_i$, retaining the exact tube. Its placement inside $C_0$ is disjoint from both $J_i$. If a $J_i$ insertion has already started, perform the interpolation on the underlying shortened metric with its product collar fixed, then reinsert precisely the same length. Arrange the original low-side stages to supply this product before the corresponding insertion starts. The far side stays fixed, so no dependence on the other interval parameter is introduced at a true cut.
  These successive operations can be assigned disjoint subranges of $w_0 \/ epsilon.alt$, with stationary overlaps. Below $w_0 = epsilon.alt$ retain only the fixed long tube, the bounded templates, and the ordinary low-end prescriptions. This includes $w_0 = 0$, where neither a normalized polygon nor a positive-width period is used. Both genuine $J_i$ lengths are still inserted in their own collars. Thus the corner has no extra face or extra multiplicity.
  For the uniform assertion, take any sequence of parameters. The identities $r_1 + r_2 = 1$ and $L gt.eq 2$ imply that the two small-$r_i$ parameter regimes are mutually exclusive. Also $h_i gt.eq 1 \/ 2 - r_i$ excludes simultaneous small $r_i \, h_i$ on the same side. A low degeneration and the opposite high degeneration, or the two high degenerations, may occur simultaneously; their spatial neighborhoods are disjoint. The only nested spatial degeneration is the already described outer puncture inside a low satellite. Lemma 59 lists the smooth main scale, cone annulus, and rescaled satellite for each shrinking edge. The only remaining possible unbounded toric direction is $L arrow.r oo$, just analyzed by (6.19). A deactivated rational collar in a low homotopy was shortened inside a positive product. Every free exterior interpolation was on bounded pieces. Hence this list exhausts all unbounded regions after passing to a subsequence.
  For a toric macro retained above $3 epsilon.alt$, $L lt.eq C \/ epsilon.alt$ by (6.17); in the replacement region its chosen length has the same bound. Fixing $T$ leaves a bounded number of truncated tips, whose geometric costs are bounded by a constant $C_T$, independent of deeper regularizations and longer rational products. A bounded local error tending to zero on the tube bulk has integrated cost at most
  #[#set math.equation(numbering: n => "(6.20)")
   $ C_T + eta \( T \) thin C epsilon.alt^(- 1) \, #h(2em) eta \( T \) arrow.r 0 . $ <eq:geometry:integrated-error>]
  Multiplying by $epsilon.alt$, letting $epsilon.alt arrow.r 0$ first, and then $T arrow.r oo$ proves the stated $o \( epsilon.alt^(- 1) \)$ assertion. The rational product collars inside a macro have positive scalar curvature and their own exact models, so their arbitrary lengths contribute no error of this type. Their nonexact annular ends have the same uniform bounded-truncation description. This establishes the full sequential assertion. ◻
]

Intervals outside positive macros may use any smooth interval path with the same true cuts, taking the positive complete disk-bundle metric of Lemma 59 at the lens end and the round middle cut at the other end. The positive-definite tensors with fixed collars form a convex space on the shortened compact piece, so such paths exist with stationary endpoints. Different macro procedures are products on disjoint regions. The external rational $Y_j$ collars and the old-cap exceptional-sphere isolation collars are disjoint from all these modifications. They can therefore be inserted with arbitrary finite lengths. This proves the metric and true-face parts of Theorem 54.

=== 6.6 Cohomology support and uniform comparison forms <cohomology-support-and-uniform-comparison-forms>

We finish with the two topological interfaces needed in the Abelian estimates. They prevent a period comparison from using a class on a piece which has disappeared, and prevent long rational collars from adding an uncontrolled background energy cost.

#thm([Lemma 6.9.])[
  (Support at period vertices).  #emph[Let $H$ be a positive-width limiting period in (6.3). Express it as a convex combination of the four vertex classes 
$ U \, #h(2em) U + X_1 \/ 4 \, #h(2em) U + X_2 \/ 4 \, #h(2em) U + \( X_1 + X_2 \) \/ 4 . $

 Every vertex with nonzero weight is carried rationally by the retained smooth main piece. It omits every side whose coefficient is zero, and is orthogonal to every divisor whose coefficient is $1 \/ 4$. Its pairings may consequently be computed with compactly supported Poincaré forms on that piece, independently of any reference filling at a true lens cut. A side occurring in such a nonempty vertex still has its whole-sphere test in the approximating positive-width family.]
] <lem:geometry:period-support>

#proof[
  Set $p = 4 a$, $q = 4 b_0$. The four weights are $\( 1 - p \) \( 1 - q \)$, $p \( 1 - q \)$, $\( 1 - p \) q$, and $p q$. If $p = 0$, all nonzero-weight vertices omit $X_1$ and lie in the subchain $U \, X_2$. If $p = 1$, all such vertices contain $X_1 \/ 4$, and their intersection with $X_1$ is $1 + X_1^2 \/ 4 = 0$. The same statements hold for $q$ and $X_2$. At a rational boundary, Mayer–Vietoris over $bb(R)$ splits second cohomology, and the intersection form splits orthogonally. Thus absence of a coefficient gives support on the retained subchain, and orthogonality to an isolated negative divisor gives support on its complement. The relative-to-absolute cohomology map is surjective in degree two because the boundary has $H^1 = H^2 = 0$ over $bb(R)$. Each supported class therefore has a compactly supported representative on the completed main piece.
  A positive limiting coefficient has $t_i > 0$ unless it is on the high saturated side, where $t_i gt.eq 1$. For all sufficiently late approximating parameters that side is in the whole-loop range. If its $N_i$ has been cut off it is also, by convention, a whole test. No side in the low switching range is used. ◻
]

#thm([Lemma 6.10.])[
  (Comparison forms, uniformly in the auxiliary lengths).  #emph[Fix a finite set of real degree-two classes on the fixed stack, or on its genuine-cut components with specified bounded reference extensions. On every family in Theorem 54 each such class $Lambda$ has a closed imaginary-valued representative $b_(*)$, with $b_(*) \/ \( 2 pi i \)$ representing $Lambda$, such that the following hold. On each long tube of fiber $U$ it is 
#[#set math.equation(numbering: n => "(6.21)")
 $ b_(*) = i lambda_U thin "vol"_(S^2 \( 1 \/ sqrt(2) \)) \, #h(2em) lambda_U = Lambda U \, $ <eq:geometry:comparison-flux>]

 apart from bounded end transitions. It vanishes on the long middle of every rational collar. For every fixed truncation size $T$, its energy off the bulk tubes is bounded by a constant $C_T$ on all compact and rescaled pieces, independently of deeper regularizations and longer rational collars. On the tube bulk its norm and volume differ from their product values by an error of the form (6.20). Consequently 
#[#set math.equation(numbering: n => "(6.22)")
 $ integral \| b_(*) \|^2 = O \( epsilon.alt^(- 1) \) \, #h(2em) integral_(upright(o f f med t u b e s)) \| b_(*) \|^2 = o \( epsilon.alt^(- 1) \) \, $ <eq:geometry:comparison-energy>]

 where bounded end regions may be included in either term. The same uniform $o \( epsilon.alt^(- 1) \)$ assertion holds for the squared negative scalar-curvature costs on the region obtained by omitting the $Y_j$ middles and retaining prefixes of length $O \( epsilon.alt^(- 1 \/ 2) \)$, and for bounded local defects from the bulk model. There is no scalar-curvature assertion on the omitted $Y_j$ middles. Constants may depend on the fixed classes and finite problem. These assertions do not assert uniform bounds as the integral class itself ranges over an unbounded set.]
] <lem:geometry:comparison>

#proof[
  First shorten every long rational collar and every long tube to bounded length, keeping its product identification and the corresponding collapse map. For a shrinking edge also cut in the cone annulus, retain fixed compact truncations of its main and rescaled satellite pieces, and shorten the intervening product. Do this inside the satellite for its nested outer puncture if present. The proof of Lemma 61 shows that there are only finitely many resulting decomposition types. To check compactness also when $L$ is unbounded, observe that then both $h_i = L \/ 4 - r_i$ tend to infinity. Off the bulk strip there remain only the tip $xi lt.eq 2 T$, the tip $L - xi lt.eq 2 T$, and possibly one low-side satellite. At the latter, the rescaling and nested puncture truncation of Lemma 59 give fixed compact charts. At the opposite tip use $\( L - xi \, z \)$, where $z = y' + r_1$; the two sloping-facet terms tend to zero, and the other terms converge smoothly on the retained charts. When $L$ is bounded, ordinary parameter compactness together with the finitely many edge rescalings gives the same conclusion. The low-side exterior homotopies were performed on bounded pieces. Thus within each decomposition type the truncated metrics and their collar identifications vary in compact smooth families. The moment sides and angle lattice are fixed; no unbounded change of homology basis occurs in passing to these truncations. Uniform equivalence of these metrics on each fixed truncation is enough for the following de Rham construction.
  Choose closed representatives of a basis for the cohomology of each shortened manifold. On a rational product collar, a degree-two class restricts to zero over $bb(R)$. Its representative there is therefore $d eta$, and subtracting $d \( chi eta \)$ sets it to zero on a smaller middle collar. On a tube slice, $H^2 \( S^2 times S^1 \; bb(R) \)$ is generated by the spherical area form. Since that sphere has area $2 pi$, (6.21) has exactly the prescribed integral. The difference between it and the original representative is exact on a middle slab. The same cutoff construction replaces the representative by the prescribed vertical form there. Use disjoint smaller collars for these operations. Local primitives can be chosen by a fixed bounded right inverse on the shortened collars, so their norms and the resulting energy are bounded uniformly on each compact family.
  Restore every long product using the same tangential closed form on its whole middle: zero on a rational collar and (6.21) on a tube. Closure is preserved, and the collapse identification preserves the original real class. The cutoff transitions remain on bounded pieces. For a varying decomposition choose finitely many overlapping parameter neighborhoods carrying these constructions. Affine combinations with a partition of unity in the parameters remain closed on each four-manifold, represent the same class, and have the same prescribed middle values. A finite combination retains the uniform norm bounds. This also handles the stationary overlaps in the low-side and small-width interpolations.
  These are curvature forms, and the argument does not trivialize a torsion line bundle on a rational boundary. Such a restriction admits a flat unitary connection; using that flat reference and splicing a real primitive changes its curvature by the exact forms just constructed. Fixed torsion holonomy and determinant transition maps are therefore retained throughout.
  Four-dimensional two-form energy is invariant under conformal change and constant metric rescaling. The large conformal factors at the satellite and the rescaling by its shrinking parameter thus introduce no new energy factor. Their fixed truncations contribute at most $C_T$. The long rational middles contribute zero. On a tube the metric converges with the uniform bulk error $eta \( T \)$ of Lemma 61; the fixed vertical form has bounded product norm, so its integral differs from the product integral by at most $eta \( T \)$ times the tube length. Since the total tube length is $O \( epsilon.alt^(- 1) \)$, the two-stage limit in (6.20) proves (6.22).
  For scalar curvature, compact truncated pieces have a uniform scalar bound and bounded volume. The cylindrical annuli and exact rational products other than the $Y_j$ products have nonnegative scalar curvature by construction; free interpolations occur on the bounded pieces. Each retained $Y_j$ prefix has fixed bounded local geometry and length $O \( epsilon.alt^(- 1 \/ 2) \)$, so the integral of its squared negative scalar part is $O \( epsilon.alt^(- 1 \/ 2) \) = o \( epsilon.alt^(- 1) \)$. The omitted middle may be arbitrarily long and is not included in this assertion. On a tube, two spatial derivative bounds control its scalar defect from the product value four. Its bounded defect tending to zero in the bulk has the same estimate (6.20), also after squaring. This proves the last assertion. ◻
]

In the application $lambda_U = - 1 - e_j + e_(j + 1)$, so $\| lambda_U \| lt.eq 2$. The fiber has area $2 pi$, scalar curvature four, and the circle and longitudinal normalizations are exactly those in (6.4). These fixed constants are what make the Dirac estimate compatible with the prescribed flux. Lemma 63 completes the proof of Theorem 54; the next section chooses the background connections and then chooses finite auxiliary sizes so that all the required tests hold simultaneously.

== 7 Uniform curvature estimates and the Abelian clamp <sec:estimates>

We now turn the metric periods and tube estimates of Section 6 into simultaneous bounds on the parallel line classes that enter the index calculation of Section 8.

The metric choices in Section 6 will be made for a #emph[fixed finite problem]. This means that the number of intervals, the bits, the bundles, all exceptional evaluations, the charge bound, and the finite set of reference fillings have been fixed. Denote this collection by $cal(P)$. Constants with a subscript $cal(P)$ are allowed to depend on all of it. The constants attached to an old cap $W$ below have a different, explicitly stated, dependence.

We use real two-forms $beta \, D$, with

$ b = i beta \, #h(2em) \[ beta \/ \( 2 pi \) \] = Lambda \, #h(2em) \[ D \/ \( 2 pi \) \] = v . $

Thus $i D$ is the difference of the two line curvatures at a reduction, and the active spinor line has determinant class $K = Lambda + v$. Type $R$ means an Abelian connection with zero spinor, with an ordering of its summands; type $S$ means a parallel splitting with a nonzero spinor in the active summand. These component-type letters do not denote the capped Seifert surface $A$; the full field-type classification is Definition 74. Our curvature norm is normalized so that, on a region with its inherited relative charge,

#[#set math.equation(numbering: n => "(7.1)")
 $ parallel F_a^0 parallel_2^2 = 2 parallel F_a^(0 \, +) parallel_2^2 + 8 pi^2 kappa . $ <eq:estimates:energy-charge>]

The identity is additive under cutting, whether or not the individual charges are positive.

For a positive bridge put $X_1 = - S_j$, $X_2 = S_(j + 1)$, as in Section 6, and define

#[#set math.equation(numbering: n => "(7.2)")
 $ lambda = Lambda U = - 1 - e_j + e_(j + 1) \, #h(2em) u = v U \,\
H_I = U + 1 / 4 sum_(i in I) X_i \, #h(2em) z_I = v H_I \, #h(2em) lambda_I = Lambda H_I quad \( I subset { 1 \, 2 } \) . $ <eq:estimates:vertices>]

In particular $H_diameter = U$. Direct substitution gives

#[#set math.equation(numbering: n => "(7.3)")
 $ lambda_1 = - 3 / 2 + e_(j + 1) \, #h(2em) lambda_2 = - 1 / 2 - e_j \, #h(2em) lambda_12 = - 1 \, #h(2em) u equiv lambda med \( mod med 2 \) . $ <eq:estimates:vertex-values>]

A whole side is a side on which the sphere test is still the whole sphere test. A separated $N_i$ with its specified Abelian reference filling counts as whole; a side in the transition to the two-piece $J_i$ rule need not be used.

#thm([Theorem 7.1.])[
  (The Abelian clamp).  #emph[For the finite problem $cal(P)$ and a fixed upper bound on total topological charge, the metrics and fixed line connections of Theorem 54 can be chosen with all artificial isolation lengths finite so that the following assertions hold simultaneously, including at every genuine face.]
  + #emph[On an $R$ or $S$ component containing a positive bridge, either $u = 0$, or there is a nonempty subset $I$ of its adjacent whole sides such that 
#[#set math.equation(numbering: n => "(7.4)")
 $ "sign" \( u \) z_I lt.eq 0 quad \( R \) \, #h(2em) "sign" \( u \) z_I < \| lambda_I \| quad \( S \) . $ <eq:estimates:clamp>]

]
  + #emph[No $R$ component contains an outside cap. For each fixed old cap $W$, cut at its rational seams and before its extra blow-up, there is a constant $C_W$ such that an $S$ component satisfies 
#[#set math.equation(numbering: n => "(7.5)")
 $ v_W^2 lt.eq C_W \, #h(2em) \( Lambda_W + v_W \)^2 lt.eq C_W . $ <eq:estimates:cap-squares>]

 The constant depends only on $W$, its fixed line data, metric and boundary collars. It is independent of the number of added intervals and of the new exceptional evaluations.]
  + #emph[On an actually separated $N_i$ the fixed background is harmonic and anti-self-dual, and the metric has positive scalar curvature. The complementary metrics and backgrounds agree for the two bit choices differing by the class supported on $N_i$.]
  #emph[One may first choose a positive bound for the ordinary Floer-gradient perturbations on the finite $Y$ seams and then take those seams to any sufficiently large finite gluing lengths. Once those lengths have been chosen, further compatible perturbations may be made sufficiently small, including in total squared $L^2$ cost on the seams. Precise quantifiers are given in Corollary 73.]
  #emph[The charge assumption concerns the sum over all retained fields and nonnegative ideal losses. No sign assumption is made on the charge of an arbitrary $"PU" \( 2 \)$ component.]
] <thm:estimates:clamp>

We prove the theorem in several steps. Only the collar, bulk-product, and comparison-representative conclusions of Theorem 54 are used as geometric input.

=== 7.1 Harmonic backgrounds and local energy <harmonic-backgrounds-and-local-energy>

#thm([Lemma 7.2.])[
  (Harmonic backgrounds and rational collars).  #emph[On a completed piece with rational-homology-sphere ends, a real cohomology class has a unique $L^2$ harmonic representative. If pieces are joined by increasingly long product collars with rational cross-sections, their harmonic representatives converge on compact subsets to the representatives of the restricted classes, provided their total norms are bounded. The convergence and the cutoff errors are exponential in distance from the ends of a long collar.]
  #emph[Background connections can consequently be chosen to be flat on the middle of each sufficiently long finite $Y$ collar and to obey the product rule at all genuine faces. On an isolated positive toric piece their self-dual curvature is proportional to its Kähler form; on a separated $N_i$ it is zero.]
] <lem:estimates:hodge>

#proof[
  For clarity, “a class” on a completed piece means its image from compactly supported cohomology. The map from relative to absolute degree-two cohomology is an isomorphism over $bb(R)$ here: the boundary has zero first and second real cohomology. Minimize the two-form norm in the affine space obtained by adding the $L^2$ closure of compactly supported exact forms to a compactly supported representative. Orthogonal projection gives a closed and coclosed form, which is smooth by local elliptic regularity. Compactly supported dual pairings preserve its class. For uniqueness, the difference of two such forms is exact. On each end it has a decreasing primitive, by the spectral description below; a global primitive can be made equal to these primitives outside a compact set, since $H^1$ of the cross-section vanishes over $bb(R)$. Integration by parts against the difference gives zero for its squared norm. This is also the relative-cohomology description of cylindrical Hodge theory #cite(label("AtiyahPatodiSingerI")) Proposition 4.9.
  Here is the required quantitative collar fact. Let $Z$ be a fixed rational homology sphere. Write a harmonic two-form on $\[ 0 \, T \] times Z$ as $d t and alpha \( t \) + gamma \( t \)$. The tangential one- and two-form Laplacians have a common positive lower spectral bound $mu_Z$. Each eigenmode satisfies
  $ - f'' + mu f = 0 \, #h(2em) mu gt.eq mu_Z . $
  Its two exponential solutions and elementary integration give, for $1 lt.eq r lt.eq T \/ 2$, and then by interior elliptic estimates,
  #[#set math.equation(numbering: n => "(7.6)")
   $ parallel b parallel_(L^2 \( \[ r \, T - r \] times Z \)) lt.eq C_Z e^(- sigma_Z r) parallel b parallel_(L^2 \( \[ 0 \, T \] times Z \)) \, #h(2em) parallel b parallel_(C^k \( \[ r \, r + 1 \] times Z \)) lt.eq C_(Z \, k) e^(- sigma_Z min \( r \, T - r - 1 \)) parallel b parallel_2 \, $ <eq:estimates:rational-decay>]
  after decreasing $sigma_Z > 0$ if necessary. The constants can be chosen uniformly when the link metrics range over the compact families used in Section 6. The same mode expansion gives a primitive on an interior collar with the same bounds. There are no harmonic tangential modes in this argument. In particular, it is not an assertion about an $S^2 times S^1$ tube.
  Local elliptic compactness, followed by compactly supported dual pairings, now identifies every bounded-norm limit with the harmonic representative of the restricted class. To see the stronger gluing assertion, cut off the decreasing tails of the piecewise harmonic forms and glue their primitives on the long products. This produces a same-class closed representative $h_T$. Conversely, applying the same cutoff to the harmonic representative $b_T$ produces representatives on the separated pieces. Equation (7.6) bounds the energy change in either direction by $C e^(- sigma T)$ times a bound for the total energy. The projection identity
  #[#set math.equation(numbering: n => "(7.7)")
   $ parallel h_T - b_T parallel_2^2 = parallel h_T parallel_2^2 - parallel b_T parallel_2^2 $ <eq:estimates:minimizing-remainder>]
  therefore proves exponential closeness, with a possibly smaller exponent. Interior estimates give the corresponding smooth closeness away from the splice strips. The argument applies to several disjoint collars at once.
  For each subset of the currently long genuine collars, preglue the harmonic data obtained by cutting just those collars. Average these closed representatives with the product weights formed from $chi \( T \)$ and $1 - chi \( T \)$, where $chi$ is zero below one large threshold and one above a larger threshold. These weights depend only on the metric parameters, so the average is closed on the four-manifold and represents the same class. The preceding estimate makes its difference from harmonic data as small as prescribed. Taking thresholds uniformly in the other disjoint collars gives the product rule at every multiple face. At a $J$ face the data on a piece depend only on that piece’s parameters. At an $N_i$ face the piece is already separated, so its datum remains exactly harmonic. The thresholds may be increased as the auxiliary sizes vary; thus the errors can have any prescribed smaller order in the estimates below.
  A line bundle on a rational cross-section admits the flat connection specified by its torsion class; no trivialization of that line bundle is asserted. The small primitive in (7.6) cuts a connection off to this flat one. Connections with the prescribed curvatures exist because their periods are the prescribed integral periods. Fixed collar gauges and the fixed line identifications give the asserted compatibility.
  Finally, in four dimensions the star on two-forms and their $L^2$ norm are conformally invariant. The toric Kähler form has finite squared norm before completion, since the moment polygon has finite area. It therefore remains an $L^2$ self-dual harmonic form after conformal cylindrical completion. The main piece has $b^(+) = 1$, so this form spans its self-dual harmonic space. Since $b^(+) \( N_i \) = 0$, its harmonic datum is anti-self-dual. A class supported on $N_i$ restricts to zero on the complement; the product construction accordingly gives the same exterior datum for the two bit choices. ◻
]

We next record the local estimate with the error norms that will actually be used. The equations and Clifford convention are those of Section 8; equivalently,

$ D_a Phi = P_D \, #h(2em) rho \( F_a^(0 \, +) \) = \( Phi Phi^(*) \)_00 + P_(+) . $

These are the usual trace-free monopole equations #cite(label("FeehanLenessPU2I")). If $Phi$ is identified with a two-by-two matrix with singular values $s \, t$, then

$ chevron.l \( Phi Phi^(*) \)_00 Phi \, Phi #scale(x: 120%, y: 120%)[chevron.r] = 1 / 4 \( s^4 + t^4 \) + 5 / 2 s^2 t^2 gt.eq 1 / 4 \| Phi \|^4 . $

We write $d_(*) = 1 \/ 4$ for this lower bound; changing the common quadratic normalization merely changes this fixed positive constant.

#thm([Lemma 7.3.])[
  (Local integrated estimate).  #emph[Set 
$ V = "Scal" / 4 "id" + 1 / 2 rho \( b \) \, #h(2em) h = max { 0 \, - lambda_min \( V \) } . $

 If $zeta = f^2$ is a compactly supported real cutoff with $0 lt.eq f lt.eq 1$, then 
#[#set math.equation(numbering: n => "(7.8)")
 $ 1 / 2 integral zeta^2 \| nabla_a Phi \|^2 + d_(*) / 4 integral zeta^2 \| Phi \|^4 lt.eq  & 2 integral zeta^2 \| P_D \|^2 + 1 / d_(*) integral zeta^2 \( h^2 + \| P_(+) \|^2 \)\
 & + 9 / d_(*) integral frac(\| d zeta \|^4, zeta^2) . $ <eq:estimates:cutoff>]

 The last integrand is defined continuously as $16 \| d f \|^4$ where $f = 0$. Enlarging the numerical constants in (7.8), if the curvature perturbation is expressed as a two-form instead of an endomorphism, accounts for its fixed Clifford norm. In particular, uniform local geometry, bounded $h$, and bounded local squared error costs give uniform bounds for $integral \( \| nabla_a Phi \|^2 + \| Phi \|^4 \)$ on interior unit strips. No derivative of $P_D$ occurs.]
] <lem:estimates:local>

#proof[
  Pair the weak identity $D_a^(*) D_a Phi = D_a^(*) P_D$ with $zeta^2 Phi$, and use the positive-spinor Weitzenböck formula. The right side is
  $ chevron.l P_D \, D_a \( zeta^2 Phi \) chevron.r = zeta^2 \| P_D \|^2 + 2 zeta chevron.l P_D \, rho \( d zeta \) Phi chevron.r . $
  Thus no integration by parts differentiates the prescribed error. The covariant derivative cross term is at most $1 / 2 zeta^2 \| nabla_a Phi \|^2 + 2 \| d zeta \|^2 \| Phi \|^2$; the displayed Dirac cross term is at most $zeta^2 \| P_D \|^2 + \| d zeta \|^2 \| Phi \|^2$. The negative zeroth-order terms are bounded by $zeta^2 \( h + \| P_(+) \| \) \| Phi \|^2$. Apply Young’s inequality separately to these two terms, using a total of at most $d_(*) \/ 2$ of the quartic coefficient, and to $3 \| d zeta \|^2 \| Phi \|^2$, using at most $d_(*) \/ 4$. The resulting remainders are bounded by the right side of (7.8). Finally $\| d \( f^2 \) \|^4 \/ \( f^2 \)^2 = 16 \| d f \|^4$. A cutoff supported in a fixed larger strip and equal to one on the strip in question proves the last assertion. ◻
]

#thm([Lemma 7.4.])[
  (Charge on a finite $Y$ middle).  #emph[Consider a flat-background product cylinder with fixed cross-section $Y$. On its translation-invariant middle, assume that the ordinary connection perturbation is the gradient of a functional $cal(W)$ with $parallel cal(W) parallel_oo lt.eq M$ and uniformly bounded gradient. Let $r \, e$ denote any additional connection and Dirac errors there. Suppose their total squared $L^2$ norms are bounded by $nu$. There is a constant $C_Y$, depending only on the fixed cross-section and the functional and gradient bounds, independent of both $nu$ and cylinder length, such that one can choose boundary slices in prescribed interior unit strips near its two ends for which 
#[#set math.equation(numbering: n => "(7.9)")
 $ kappa_(upright("middle")) gt.eq - C_Y - C_Y nu . $ <eq:estimates:cylinder-charge>]

 The complementary bounded strips may be included in the retained region of a cutoff estimate.]
] <lem:estimates:cylinder>

#proof[
  Use temporal gauge and the convention $rho_3 \( xi \) = - rho_4 \( d t and xi \)$ on positive spinors. Write the equations as
  $ dot(Phi) + D_a Phi = e \, #h(2em) dot(a) + * F_a = q \( Phi \) + sigma nabla cal(W) \( a \) + r \, #h(2em) sigma in { 1 \, - 1 } . $
  With the stated Clifford and trace conventions $c_(*) = 1 \/ 2$, and $chevron.l q \( Phi \) \, v chevron.r = - c_(*) chevron.l D'_a \( v \) Phi \, Phi chevron.r$. All pairings in this proof are integrated over $Y$ and are real pairings. For $H \( t \) = chevron.l D_a Phi \, Phi chevron.r$, differentiation and the Dirac equation give the exact identity
  #[#set math.equation(numbering: n => "(7.10)")
   $ - chevron.l * F_a \, dot(a) chevron.r =  & parallel dot(a) parallel_2^2 + c_(*) H' \( t \) + 2 c_(*) parallel dot(Phi) parallel_2^2 - sigma frac(d, d t) cal(W) \( a \)\
 & - chevron.l r \, dot(a) chevron.r - 2 c_(*) chevron.l e \, dot(Phi) chevron.r . $ <eq:estimates:cylinder-identity>]
  In particular an ordinary Floer perturbation contributes endpoint values, rather than a length times its pointwise size. Young’s inequality absorbs the last two terms into half the positive energies at a cost of $1 / 2 parallel r parallel_2^2 + c_(*) parallel e parallel_2^2$.
  It remains to bound $H$ on suitable slices. Apply Lemma 66 on fixed larger strips around the two prescribed unit strips. Their geometry and background are fixed, and the gradient has a uniform pointwise bound, so
  $ integral_(J times Y) \( \| nabla_a Phi \|^2 + \| Phi \|^4 \) lt.eq A_Y \( 1 + nu \) . $
  Since $\| D_a Phi \| lt.eq sqrt(3) \| nabla_a Phi \|$ for the tangential Dirac operator,
  $ integral_J \| H \( t \) \| thin d t lt.eq sqrt(3) thin "Vol" \( J times Y \)^(1 \/ 4) { A_Y \( 1 + nu \) }^(3 \/ 4) . $
  There is a slice in each unit strip with $\| H \| lt.eq B_Y \( 1 + nu \)^(3 \/ 4)$, where $B_Y$ is independent of $nu$. Integrating (7.10) between the chosen slices and using
  $ kappa_(\[ u \, v \] times Y) = - frac(1, 4 pi^2) integral_u^v chevron.l * F_a \, dot(a) chevron.r thin d t $
  gives the explicit lower bound
  $ - frac(2 c_(*) B_Y \( 1 + nu \)^(3 \/ 4) + 2 M + 1 / 2 parallel r parallel_2^2 + c_(*) parallel e parallel_2^2, 4 pi^2) . $
  Since $\( 1 + nu \)^(3 \/ 4) lt.eq 1 + nu$, this proves (7.9) for every $nu gt.eq 0$ with the asserted constant. The same local estimate controls the adjoining cutoff strips. Notice that the proof does not require pointwise differentiability bounds for $e$. ◻
]

=== 7.2 The long tube and the small-width test <the-long-tube-and-the-small-width-test>

#thm([Proposition 7.5.])[
  (Tube comparison and retained-region energy).  #emph[Fix $cal(P)$. Let $epsilon.alt arrow.b 0$ through the family in Section 6, allowing all admissible deeper regularizations and rational isolations. Let $cal(R)_epsilon.alt$ be the union of the retained regions, obtained by removing the long translation-invariant $Y$ middles. Keep initial $Y$ prefixes of length $R_0 = C epsilon.alt^(- 1 \/ 2)$, as well as the bounded cutoff strips. For harmonic backgrounds, and also for the product-rule backgrounds of Lemma 65 chosen with smaller errors, 
#[#set math.equation(numbering: n => "(7.11)")
 $ sum_(cal(T)) parallel beta - lambda_(cal(T)) omega_(S^2) parallel_(L^2 \( cal(T) \))^2 + parallel beta parallel_(L^2 \( upright("rest") \))^2 = o_(cal(P)) \( epsilon.alt^(- 1) \) \, #h(2em) parallel beta parallel_2^2 = O_(cal(P)) \( epsilon.alt^(- 1) \) . $ <eq:estimates:tube-background>]

 Here $cal(T)$ runs over the bulk tubes, bounded end pieces may be transferred to the rest, and $omega_(S^2)$ is the area form of $S^2 \( 1 \/ sqrt(2) \)$. The subscript on the little-$o$ means uniformity over those admissible choices and all parameter faces for the fixed problem.]
  #emph[For solutions whose total charge is bounded above, bounded ordinary $Y$ gradient perturbations and additional errors of squared cost $o \( epsilon.alt^(- 1) \)$ give 
#[#set math.equation(numbering: n => "(7.12)")
 $ integral_(cal(R)_epsilon.alt) \( \| Phi \|^4 + \| F_a^(0 \, +) \|^2 + \| F_a^0 \|^2 \) = o_(cal(P)) \( epsilon.alt^(- 1) \) . $ <eq:estimates:small-energy>]

 For each fixed $epsilon.alt > 0$, the same quantities have a finite bound $E_(cal(P) \, epsilon.alt)$ independent of all subsequently lengthened rational collars and of the omitted $Y$ lengths, with the error costs bounded. The assertions also hold for the retained main fields of ideal tuples with nonnegative omitted losses.]
] <prop:estimates:energy>

#proof[
  The geometric input is Lemma 63. After collapsing long products to bounded products, prescribe the vertical form $lambda_(cal(T)) omega_(S^2)$ on their middle slices and zero real curvature on rational middle slices. The restriction classes agree with these prescriptions. Relative de Rham representatives on the bounded truncations, followed by reinsertion of the products, give a same-class comparison form $h$. Uniform bounded truncations at the smooth pieces, conical annuli and rescaled satellites give
  #[#set math.equation(numbering: n => "(7.13)")
   $ parallel h parallel_2^2 = sum_(cal(T)) lambda_(cal(T))^2 "Vol" \( cal(T) \) + o_(cal(P)) \( epsilon.alt^(- 1) \) . $ <eq:estimates:comparison-upper>]
  In this formula the volumes are those of the product models. Metric errors change its two sides by $o_(cal(P)) \( epsilon.alt^(- 1) \)$. Additional rational cylinders have zero comparison curvature on their long parts, so their arbitrary lengths add no leading term.
  For the converse estimate, on each exact product fiber $Sigma = S^2 \( 1 \/ sqrt(2) \)$ one has
  $ integral_Sigma beta = 2 pi lambda_(cal(T)) \, #h(2em) "area" \( Sigma \) = 2 pi . $
  Fiberwise Cauchy–Schwarz and integration over the other two coordinates therefore bound the energy from below by the summand in (7.13). More precisely, the cross term against the model vertical form is fixed by this same flux, so on the exact product
  $ parallel beta - lambda_(cal(T)) omega_(S^2) parallel_2^2 = parallel beta parallel_2^2 - lambda_(cal(T))^2 "Vol" \( cal(T) \) . $
  First discard bounded tip ranges and an arbitrarily small end fraction of each long tube. On the remainder the metric and its needed derivatives tend uniformly to the product model. The errors in the last identity are bounded by this metric error times the energy, which is $O_(cal(P)) \( epsilon.alt^(- 1) \)$ by minimization and (7.13). Then let the discarded fraction tend to zero. Nonnegativity of all the remaining energies proves (7.11).
  The background is flattened on each $Y$ middle only after the prefix of length $R_0$. Equation (7.6) bounds the added squared error by $C_(cal(P)) e^(- 2 sigma R_0) epsilon.alt^(- 1)$, which is negligible. The product-rule alterations at genuine faces can have smaller cost by the threshold choice in Lemma 65.
  On a bulk tube, $"Scal" = 4$ in the model and
  $ "Scal" / 4 = 1 gt.eq frac(\| lambda_(cal(T)) \|, 2) = 1 / 2 parallel rho \( i lambda_(cal(T)) omega_(S^2) \) parallel \, #h(2em) \| lambda_(cal(T)) \| lt.eq 2 . $
  Consequently the squared negative part $h^2$ from Lemma 66 has integral $o_(cal(P)) \( epsilon.alt^(- 1) \)$ there, by (7.11) and the integrated metric-error bounds. The same assertion holds on the rest: its background energy is lower order, its negative scalar-curvature squared cost is lower order by the geometric decomposition, and the retained $Y$ prefixes have bounded local scalar cost times $O \( R_0 \) = o \( epsilon.alt^(- 1) \)$. A bounded $Y$ gradient perturbation has the same lower-order squared cost on those prefixes. All other errors have the stipulated total cost. Thus, for a cutoff equal to one on the retained part away from the bounded transition strips,
  $ integral_(cal(R)_epsilon.alt) \( h^2 + \| P_(+) \|^2 + \| P_D \|^2 \) = o_(cal(P)) \( epsilon.alt^(- 1) \) . $
  Apply (7.8); use the local strip estimate at its finitely many transitions. At a genuine infinite end use cutoffs and finite-energy tails. This gives the $\| Phi \|^4$ assertion. The quadratic curvature equation gives the assertion for $\| F_a^(0 \, +) \|^2$.
  For the full curvature, sum charges over all retained components. If $Q$ is the fixed upper charge bound and there are $q_Y$ omitted $Y$ middles, Lemma 67 gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ kappa \( cal(R)_epsilon.alt \) lt.eq Q + q_Y C_Y \( 1 + nu \) . $ <eq:estimates:retained-charge>]
  Nonnegative particles and other omitted nonnegative losses only decrease the left side. Substitution into (7.1) proves the full-curvature assertion. This sums over the arbitrary $"PU" \( 2 \)$ fields as well as the reduced fields, and never discards a component on an assumed charge sign.
  Finally fix $epsilon.alt$. All bounded-truncation contributions in the same argument are then finite uniform constants; lengthening a positive rational cylinder adds neither negative scalar cost nor a zero-mode background. The omitted-middle bound is independent of length. Repeating the estimates with constants instead of little-$o$ proves the stated $E_(cal(P) \, epsilon.alt)$ bound. ◻
]

#thm([Corollary 7.6.])[
  (The small-width test).  #emph[For $epsilon.alt$ sufficiently small, every $R$ or $S$ reduction on a small-width transition or replacement region has $v U = 0$. This choice is uniform under the subsequent deeper regularizations and rational isolations allowed by the metric construction.]
] <cor:estimates:tube>

#proof[
  Such a region contains a bulk tube of length at least $c_(cal(P)) \/ epsilon.alt$, whose other circle factor has length bounded below. For a reduction, $F_a^0$ has diagonal entries $i D \/ 2 \, - i D \/ 2$, so $\| F_a^0 \|^2 = \| D \|^2 \/ 2$. Each fiber has $integral_(S^2) D = 2 pi u$. Cauchy–Schwarz therefore gives, with a constant independent of the auxiliary lengths,
  $ integral_(cal(T)) \| F_a^0 \|^2 gt.eq c'_(cal(P)) u^2 \/ epsilon.alt . $
  If the integer $u$ is nonzero this contradicts (7.12) along a sequence $epsilon.alt arrow.b 0$. The estimates are uniform in precisely the other parameters permitted in such a sequence. The stationary overlap of the small-width and toric prescriptions is included. ◻
]

=== 7.3 Period inequalities and finite persistence <period-inequalities-and-finite-persistence>

#thm([Lemma 7.7.])[
  (The period inequality on an isolated positive piece).  #emph[Let $M$ be a positive-width toric main limit, with period class $H = U + a X_1 + b_0 X_2$, $a \, b_0 in \[ 0 \, 1 \/ 4 \]$, $a + b_0 > 0$. Let the fixed background be harmonic. Every finite-energy solution of the unperturbed reduced equations satisfies 
#[#set math.equation(numbering: n => "(7.15)")
 $ v H = 0 quad upright("or") quad \( v H \) \( \( Lambda + v \) H \) < 0 \, $ <eq:estimates:period>]

 with $v H = 0$ when the spinor vanishes and the strict alternative when it is nonzero.]
] <lem:estimates:projection>

#proof[
  At a reduction the trace-free curvature is $"diag" \( i D \/ 2 \, - i D \/ 2 \)$. The two bundle-diagonal blocks of the doubly trace-free quadratic term are likewise one half of the active spinor quadratic term with opposite signs. The reduced curvature equation is therefore
  $ rho \( i D^(+) \) = \( psi psi^(*) \)_0 \, $
  and the active Dirac operator has fixed-plus-variable curvature $i \( beta + D \)$. This checks that $v$ and $Lambda + v$ in (7.15) are full line classes. For the Clifford convention in use,
  $ "tr" #scale(x: 120%, y: 120%)[\(] rho \( i eta^(+) \) rho \( i xi^(+) \) #scale(x: 120%, y: 120%)[\)] = 4 chevron.l eta^(+) \, xi^(+) chevron.r \, #h(2em) \| psi \|^4 = 8 \| D^(+) \|^2 . $
  The integrated Dirac identity consequently reads
  #[#set math.equation(numbering: n => "(7.16)")
   $ 0 = integral_M (\| nabla psi \|^2 + "Scal" / 4 \| psi \|^2) + 2 integral_M (chevron.l beta^(+) \, D^(+) chevron.r + \| D^(+) \|^2) . $ <eq:estimates:line-Weitzenbock>]
  To justify integration on the completion, insert cutoffs changing on bounded-width end strips. The derivative error there is bounded by a fixed constant times $"Vol" \( upright("strip") \)^(1 \/ 2) \( integral_(upright("strip")) \| psi \|^4 \)^(1 \/ 2)$ and tends to zero. The other terms follow by the finite curvature energy and the cutoff estimate. In particular no global $L^2$ assumption on $psi$ is needed.
  Scalar curvature is nonnegative and positive on a nonempty interior open set. The first integral in (7.16) is therefore nonnegative. If it vanished, then $nabla psi = 0$ and $"Scal" \| psi \|^2 = 0$ everywhere. The latter equality makes $psi$ vanish on that open set, and a parallel section which vanishes at a point vanishes on the connected manifold $M$. Thus the first integral is strictly positive whenever $psi eq.not 0$. Write $D^(+) = D_H + D_perp$, where $D_H$ is its self-dual harmonic projection. By Lemma 65, $beta^(+)$ belongs to the same one-dimensional harmonic space. With $h_H$ the harmonic form of class $H$,
  $ beta^(+) = 2 pi frac(Lambda H, H^2) h_H \, #h(2em) D_H = 2 pi frac(v H, H^2) h_H . $
  The second integral in (7.16) is therefore
  $ \( 2 pi \)^2 frac(\( v H \) \( \( Lambda + v \) H \), H^2) + parallel D_perp parallel_2^2 . $
  It is negative if $psi eq.not 0$, which proves the strict alternative. If $psi = 0$, the curvature equation gives $D^(+) = 0$ and hence $v H = 0$. ◻
]

#thm([Lemma 7.8.])[
  (Vertex test and finite persistence).  #emph[After $epsilon.alt$ has been fixed as in Corollary 69, sufficiently small regularization, sufficiently long finite rational isolation, and sufficiently small perturbations give (7.4) on every positive bridge. The assertion is uniform near genuine faces and over all sufficiently long finite $Y$ seams.]
] <lem:estimates:vertices>

#proof[
  #emph[The isolated vertex test.] First consider an isolated positive-width limit. Put $p = 4 a$, $q = 4 b_0$. Its period is the convex combination
  #[#set math.equation(numbering: n => "(7.17)")
   $ H = \( 1 - p \) \( 1 - q \) H_diameter + p \( 1 - q \) H_1 + \( 1 - p \) q H_2 + p q H_12 . $ <eq:estimates:convex>]
  All weights are nonnegative, and at least one nonempty vertex has positive weight. All nonempty vertices have negative $Lambda$-evaluation by (7.3); the empty one has $lambda lt.eq 0$. Consequently $Lambda H < 0$. If $u eq.not 0$, its parity gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ \| u \| gt.eq \| lambda \| . $ <eq:estimates:parity-size>]
  Indeed this is immediate for $lambda = 0 \, - 1$, and for $lambda = - 2$ a nonzero even integer has absolute value at least two.
  For type $R$, if all available nonempty vertices violated the asserted weak inequality, multiplication of (7.17) by $"sign" \( u \) v$ would give $"sign" \( u \) v H > 0$, contradicting Lemma 70. For type $S$, failure at all such vertices, together with (7.18), gives
  $ "sign" \( u \) v H gt.eq sum_I theta_I \| lambda_I \| = \| Lambda H \| > 0 . $
  Here $theta_I$ are the four weights. A number of magnitude at least $\| Lambda H \|$ cannot satisfy either alternative of (7.15). This proves the limiting test.
  #emph[Persistence at finite sizes.] Fix $cal(P)$ and $epsilon.alt$, and suppose the conclusion failed along a sequence with regularization tending to zero, isolations tending to infinity, and perturbations tending to zero. Pass to a fixed sign of $u$ and to limiting period parameters. The small-width alternative is already excluded by Corollary 69. By Proposition 68 the retained energy is uniformly bounded. We will pass to an unperturbed reduction on the retained smooth main piece. Only the pairings of vertices with positive limiting weight must pass to this limit; those vertices remain supported on that piece even when other classes collapse.
  On a ball, Abelian Coulomb gauge gives a connection one-form bounded in $W^(1 \, 2)$ by its curvature norm. Lemma 66, followed by $d psi = nabla_a psi - a psi$ and $W^(1 \, 2) subset L^4$, bounds the spinor in $W^(1 \, 2)$ as well. To exclude an atom of its fourth-power measure at a point, take a radial cutoff $f_R$ equal to one on $B_(R^2)$ and zero outside $B_R$, with logarithmic transition. In four dimensions
  $ integral \| d f_R \|^4 lt.eq C \| log R \|^(- 3) . $
  Use $zeta = f_R^2$ in (7.8), first pass to the sequence limit and then let $R arrow.b 0$. The bounded background cost is $O \( R^4 \)$ and the error costs tend to zero, so the atom is zero. The critical Sobolev concentration argument now gives strong local $L^4$ convergence of the spinors: its defect measure is supported at atoms, as follows by applying the Sobolev inequality to a cutoff times the weakly convergent difference and partitioning sets on which the limiting gradient-energy measure is small. The reduced curvature equation and the interior elliptic estimate for $d^(*) xor d^(+)$ then give strong $W^(1 \, 2)$ convergence of the Coulomb connection forms on smaller balls.
  For completeness, bootstrap on balls on which their $L^4$ norms are small. In the Dirac equation multiplication by this one-form is a small operator from $W^(1 \, p)$ to $L^p$, for $2 < p < 4$, and can be absorbed in the local Dirac estimate. The cutoff inhomogeneity is already in $L^p$; choosing $p > 8 \/ 3$ gives spinor integrability greater than eight. The quadratic curvature equation then gives connection coefficients in $W^(1 \, q)$ for some $q > 4$. Repeated Dirac and $d^(*) xor d^(+)$ estimates give smooth convergence when the errors tend to zero in the corresponding local Sobolev norms. This proves convergence to an unperturbed reduction without differentiating the errors in the initial energy estimate or using transversality. Ideal markings elsewhere and filled true lens ends do not change its compact pairings.
  Only vertices of positive limiting weight in (7.17) matter. By Lemma 62, each such vertex is represented rationally in the smooth retained main part: it omits a side whose low coefficient has vanished, and includes a collapsed high divisor with coefficient $1 \/ 4$, making it orthogonal to that divisor. Compactly supported dual representatives therefore bound its evaluation by the retained $L^2$ energy. Those evaluations lie in a fixed discrete lattice, so a subsequence makes them constant. All of their nonempty sides are whole for late terms of the sequence. There is no need to bound an evaluation on a vertex of zero limiting weight, nor to bound $u$ if the empty weight is zero.
  For $R$, strict violation on a nonempty vertex persists as a strictly positive discrete value; the empty vertex, if relevant, has $"sign" \( u \) u > 0$. For $S$, violation is the closed inequality $"sign" \( u \) z_I gt.eq \| lambda_I \|$, and persists as well. The limiting calculation just made is a contradiction, including if an $S$ spinor limits to zero. The argument allowed arbitrary genuine faces and arbitrary further $Y$ lengths, proving the stated uniformity. ◻
]

=== 7.4 Fixed caps and the order of choices <fixed-caps-and-the-order-of-choices>

#thm([Proposition 7.9.])[
  (Cap constants before exterior choices).  #emph[For each old cap $W$ there is a metric, unchanged on its rational end collars, and a number $C_W < oo$ such that 
$ forall thin cal(P) med exists thin L_(cal(P)) \, delta_(cal(P)) > 0 :\
upright("isolation at least ") L_(cal(P)) \, quad upright("admissible errors at most ") delta_(cal(P))\
arrow.r.double quad upright("no cap-containing ") R upright(" and ") upright("(7.5)") upright(".") $

 Here $cal(P)$ is any fixed finite exterior problem whose restriction to $W$ is the fixed cap datum. Neither $C_W$ nor that metric depends on the new exceptional evaluation or the number of intervals. The thresholds and intermediate full-curvature bounds may depend on both.]
] <prop:estimates:cap>

#proof[
  The cap contains a nonzero class $A$ with $A^2 = 0$ and $c A$ odd. Its real intersection form is nondegenerate, since its boundaries are rational homology spheres. A nondegenerate negative-definite form has no nonzero isotropic vector, so $b^(+) \( W \) > 0$. Moreover every allowed restriction $v_W equiv c_W med \( mod med 2 \)$ has odd evaluation on $A$, and is nonzero in real cohomology.
  Choose the metric so that none of these countably many integral classes is anti-self-dual. Here is the period argument with the permitted support. Suppose a nonzero harmonic representative $alpha$ of one such class is anti-self-dual. Choose a nonzero self-dual harmonic form $omega$. Unique continuation for harmonic forms #cite(label("Aronszajn1957")) Remark 3 implies that the nonzero sets of $alpha$ and $omega$ meet in any prescribed open region for metric variation. Infinitesimal changes of the metric there give all homomorphisms between the anti-self-dual and self-dual two-form spaces. Thus one may choose a compactly supported variation of the star for which
  $ integral_W chevron.l dot(*) alpha \, omega chevron.r eq.not 0 . $
  Differentiating the harmonic projection shows that this is, up to a nonzero fixed factor, its derivative in the $omega$ direction. The wall for this class is therefore closed with empty interior among metrics fixed on the end collars. Baire’s theorem avoids all the walls at once. This is the usual local period variation argument; see also #cite(label("DonaldsonKronheimer1990")). It uses the nonzero real class, so torsion presents no exception.
  Fix this metric and its harmonic datum $beta_W$. Let $omega_1 \, dots.h \, omega_b$ be an $L^2$ orthonormal basis of its self-dual harmonic forms. They and their end primitives decrease exponentially by (7.6). Cover $W$ by finitely many interior sets and bounded-overlap unit end strips $V_k$, $k gt.eq 0$. On a completed-cap limit, the local estimate gives
  #[#set math.equation(numbering: n => "(7.19)")
   $ parallel D^(+) parallel_(L^2 \( V_k \)) lt.eq A_W quad upright("for every ") k \, $ <eq:estimates:cap-local>]
  where $A_W$ depends only on the fixed cap geometry and background. Indeed the scalar curvature and background are bounded on all these sets, the enlarged sets have uniformly bounded volume and cutoffs, and the limiting equations are unperturbed. No incoming spinor boundary value occurs in Lemma 66. For $R$ the left side is zero. Hence the convergent sums
  #[#set math.equation(numbering: n => "(7.20)")
   $ B_(W \, a) = frac(A_W, 2 pi) sum_k parallel omega_a parallel_(L^2 \( V_k \)) \, #h(2em) B_W = (sum_(a = 1)^b B_(W \, a)^2)^(1 \/ 2) $ <eq:estimates:cap-constant>]
  bound the coefficients, and then the norm, of the limiting positive projection of $v_W$. These numbers contain no exterior data.
  We must identify that projection with the topological restriction, without imposing a cap-only bound on the anti-self-dual curvature. Fix $cal(P)$ and $epsilon.alt$ first. Compactly supported dual pairings in $W$ and Proposition 68 bound all integral evaluations of $v_W$; thus only finitely many restriction classes occur for this problem. In a hypothetical sequence with isolation tending to infinity, pass to a constant one of these classes. Local convergence gives a field on the completed cap.
  For a harmonic $omega_a$, let $alpha_a$ be its exponentially decreasing primitive on each end. If $chi_N$ is one through distance $N$ and zero beyond $N + 1$, then
  $ hat(omega)_(a \, N) = chi_N omega_a + d chi_N and alpha_a $
  is a compactly supported closed representative of its relative class. The sign follows from $d alpha_a = omega_a$; equivalently it is $omega_a - d \( \( 1 - chi_N \) alpha_a \)$ on the ends. Its pairing with $D \/ \( 2 pi \)$ is the topological pairing of $v_W$ with $\[ omega_a \]$.
  The full-curvature bound needed in these end strips can depend on $cal(P)$. Retain a prefix of length $N + 2$ of a neighboring $Y$ collar and choose its omitted-middle slice beyond the prefix. Lemma 67 still gives the same lower middle-charge bound. Lemma 66 bounds the self-dual cost of each additional cap-prefix strip by a fixed constant. Equation (7.1) then gives
  #[#set math.equation(numbering: n => "(7.21)")
   $ integral_(upright("cap and prefixes through ") N + 2) \| D \|^2 lt.eq E_(cal(P) \, epsilon.alt) + C'_W \( N + 2 \) . $ <eq:estimates:cap-prefix>]
  The same bound applies at a positive rational isolation collar. For each fixed $N$ it follows either before passing to the cap limit, once that prefix is isolated, or afterward. Its intercept may be arbitrarily large as exterior data vary. The correction pairing is consequently bounded by
  #[#set math.equation(numbering: n => "(7.22)")
   $ C'_W e^(- sigma N) sqrt(E_(cal(P) \, epsilon.alt) + C'_W \( N + 2 \)) arrow.r 0 quad \( N arrow.r oo \) \, $ <eq:estimates:cap-tail>]
  with $cal(P)$ fixed. The remaining integral converges by (7.19) and exponential decay of $omega_a$. It equals $\( 2 pi \)^(- 1) integral_W chevron.l D^(+) \, omega_a chevron.r$. This proves the required identification and the bound $parallel v_W^(+) parallel lt.eq B_W$.
  An $R$ limit would have $v_W^(+) = 0$, contrary to the chosen period condition. For an $S$ limit, possibly with vanishing limiting spinor,
  $ v_W^2 lt.eq parallel v_W^(+) parallel^2 lt.eq B_W^2 \, #h(2em) \( Lambda_W + v_W \)^2 lt.eq \( parallel Lambda_W^(+) parallel + B_W \)^2 . $
  Choose once and for all
  #[#set math.equation(numbering: n => "(7.23)")
   $ C_W = 1 + max { B_W^2 \, \( parallel Lambda_W^(+) parallel + B_W \)^2 } . $ <eq:estimates:CW>]
  For the fixed problem, a sequence violating either finite square bound has a constant restriction class and would contradict this strict cushion in the limit. A sequence of cap-containing $R$ fields similarly contradicts the period condition. Thus finite thresholds exist. The exceptional negative summand is outside $W$ under the rational orthogonal splitting, and has not been included in either cap constant. ◻
]

#thm([Corollary 7.10.])[
  (Order of finite choices).  #emph[The constants $C_W$ can be fixed before choosing the delays, exceptional evaluations and repetition count in the stack. After those choices have specified a finite problem $cal(P)$, there are $epsilon.alt > 0$, admissible finite auxiliary sizes, numbers $delta > 0$ and $T_0 < oo$, with the following property. For every collection of finite $Y$ lengths $T_j gt.eq T_0$ and ordinary Floer-gradient perturbations of size at most $delta$, there is a positive allowed size for the further non-gradient perturbations such that all conclusions of Theorem 64 hold. The further size may depend on the chosen finite $T_j$; it includes their total squared error costs. At genuine ends the perturbations and backgrounds obey the product rule and the specified decreasing tail bounds.]
] <cor:estimates:choices>

#proof[
  First fix the cap metrics and (7.23). Next fix $cal(P)$, including any arbitrarily large exceptional evaluations. Choose $epsilon.alt$ by Corollary 69. Bounded $Y$ gradients only cost $O \( epsilon.alt^(- 1 \/ 2) \)$ on its retained prefixes and contribute bounded endpoint terms on the omitted middles, so this first choice remains valid under the later lengthenings. Choose the smaller regularization parameter $d$, the rational isolation lengths and the perturbation bounds for Lemma 71 and Proposition 72, with this $epsilon.alt$ fixed.
  Here is the uniformity argument for the order of the last choices. If no such finite auxiliary choices, positive $delta$, and $T_0$ worked for all $T_j gt.eq T_0$, choose failures successively with $d arrow.r 0$, each required isolation length tending to infinity, gradient sizes tending to zero, and $min T_j arrow.r oo$. For each chosen finite collection of lengths, let the additional errors tend to zero in the indicated local and total norms before selecting a failure. The off-middle energy bound is uniform in all these lengths. After passing to subsequences, the small-width test, the positive-width vertex argument or the cap argument therefore supplies exactly the contradiction already proved. This is a neighborhood assertion in all the auxiliary variables: it supplies a fixed positive gradient tolerance before the finite $Y$ gluing lengths are selected. It is stronger than merely finding one successful diagonal sequence.
  Finally fix those finite lengths. Further errors can be decreased in norms depending on all the sizes now chosen. Compactly supported errors have finite cost; errors on genuine collars can have prescribed square-integrable decreasing tails. For an error on a finite $Y$ middle this permits, for example, a pointwise bound whose square times the chosen length tends to zero. Alternatively that middle may remain exactly a gradient equation. The argument never requires a fixed non-gradient pointwise tolerance on arbitrarily long uncontrolled middles. On a separated positive $N_i$ allow only the small compact instanton perturbations that preserve its spinor-zero conclusion. This completes the choice of all data and the proof of Theorem 64. ◻
]

== 8 Spinor indices and exclusion of unwanted strata <sec:indices>

The purpose of this section is to determine which strata can meet the cut-down spinor problem. We separate this numerical assertion from the regularization needed to apply it: Definition 80 states the precise analytic properties used here. In particular, none of the dimension arguments below presupposes compactness of the moduli spaces it is intended to exclude.

=== 8.1 Conventions and closed indices <conventions-and-closed-indices>

Fix the integral determinant lift $c = c_1 \( E \)$ and its connection, and use only determinant-one gauge transformations with the prescribed transition maps. The spin-$c$ determinant is $l = Lambda - c$. Write

#[#set math.equation(numbering: n => "(8.1)")
 $ kappa = c_2 \( E \) - c^2 / 4 \, #h(2em) Theta = frac(Lambda^2 - sigma, 4) . $ <eq:indices:charge>]

Here and below a square on a piece with rational homology sphere boundary is the relative rational square. On positive spinors the Clifford convention is $rho \( e^i and e^j \) = rho \( e^i \) rho \( e^j \)$ for orthogonal unit covectors; positive chirality sees self-dual curvature. The equations are

#[#set math.equation(numbering: n => "(8.2)")
 $ D_a Phi = P_D \, #h(2em) rho \( F_a^(0 \, +) \) = \( Phi Phi^(*) \)_00 + P_(+) . $ <eq:indices:equations>]

The subscript $00$ means trace-free in both rank-two factors. The unperturbed quadratic term has positive pairing with the curvature term in the Dirac Weitzenböck formula, bounded below by a positive constant times $\| Phi \|^4$. Indeed, represent a spinor by a $2 times 2$ complex matrix, diagonalize it by unitary changes of basis, and project its rank-one Hermitian square off the two scalar factors. That projection is nonzero for every nonzero spinor; its squared norm has a positive minimum on the unit sphere. This is the quartic term used in Section 7.

#prodef([Definition 8.1.])[
  The phase circle $bb(T)$ acts by multiplying $Phi$. On the quotient by determinant-one gauge, its kernel at a free orbit is ${ 1 \, - 1 }$. A main component has type $A$ when $Phi = 0$ and the connection is irreducible, type $R$ when $Phi = 0$ and the connection has continuous stabilizer, type $S$ when $Phi eq.not 0$ lies in one summand of a parallel splitting, and type $P$ otherwise. A #emph[fixed-type tuple] has no component of type $P$. The letters here denote field types; in particular $A$ is not the capped Seifert surface, and $P$ is not the positive bridge cell.
  For a split connection write $E = L_1 xor L_2$ and $v = c_1 \( L_1 \) - c_1 \( L_2 \)$, placing the active spinor line first in type $S$. Then
  #[#set math.equation(numbering: n => "(8.3)")
   $ v equiv c med \( mod med 2 \) \, #h(2em) K = l + 2 c_1 \( L_1 \) = Lambda + v . $ <eq:indices:split-classes>]
  At type $R$ choose either ordering, including an ordering at a central connection. Actual separated lens caps are not counted as main components when assigning these types.
] <def:indices:types>

The description of the phase-fixed locus follows directly from stabilizers. A gauge transformation compensating a phase outside ${ 1 \, - 1 }$ is a parallel unitary automorphism of $E$ with distinct eigenvalues. If the spinor is nonzero, it belongs to its corresponding parallel eigenline; determinant one gives the complementary eigenline. Conversely, a parallel splitting carrying the spinor in one summand compensates every phase by the diagonal determinant-one gauge action. Thus the above list also describes the fixed locus of the diagonal phase on a product of main components.

#thm([Lemma 8.2.])[
  #emph[On a closed filled piece with $b_1 = 0$, the real instanton index, complex coupled Dirac index, and real spinor index before phase quotient are 
#[#set math.equation(numbering: n => "(8.4)")
 $ D_I = 8 kappa - 3 \( 1 + b^(+) \) \, #h(2em) n_D = Theta - kappa \, #h(2em) D_(upright("sp")) = D_I + 2 n_D . $ <eq:indices:closed-indices>]

 The pure-line tangential index at type $S$ is 
#[#set math.equation(numbering: n => "(8.5)")
 $ d_s = frac(K^2 - \( 2 chi + 3 sigma \), 4) . $ <eq:indices:tangent-index>]

]
] <lem:indices:closed>

#proof[
  The ASD index is the index of $d_a^(*) xor d_a^(+)$ with $p_1 \( "ad" E \) = - 4 kappa$. For the Dirac operator the degree-four part of $"ch" \( E \) e^(l \/ 2) hat(A)$ is
  $ c^2 / 2 - c_2 \( E \) + frac(c l, 2) + l^2 / 4 - sigma / 4 = frac(\( l + c \)^2 - sigma, 4) - kappa . $
  Here the signature theorem gives the integrated $hat(A)$ term. This proves the first two formulas by the index theorem #cite(label("AtiyahSingerIII")); the complex Dirac summand contributes twice its index to the real deformation index. For a line spinor with determinant $K$, its complex Dirac index is $\( K^2 - sigma \) \/ 8$. Adding twice this to the scalar gauge/self-duality index $- \( 1 - b_1 + b^(+) \)$ gives (8.5), since $2 chi + 3 sigma = 4 \( 1 - b_1 + b^(+) \) + sigma$. These conventions also agree with #cite(label("FeehanLenessLinksI")) Equations (2.51) and (2.63). ◻
]

On cylindrical pieces we use fixed-limit Fredholm operators with a small positive exponential weight. The gauge group permits independent parallel limiting constants in the stabilizers; this is the #emph[unframed] convention. Framing an end adds $h^0$, the dimension of its flat stabilizer. The true cuts are $J = S^3$ and the lens boundary of a $\( - 4 \)$ disk bundle. For each flat on these links, $H^1$ of the adjoint local system is zero: this is immediate on $S^3$, and on its finite lens quotient it follows by averaging, or by taking invariants in the cohomology of the finite cover. The flat Dirac has no kernel by positive scalar curvature. Thus the weights can be chosen below a common nonzero spectral gap. Filling a $J$-end by a flat ball changes no unframed index after stabilizer matching; the framed ball index is zero. Across $k$ such cuts the filled ASD indices sum to $D_I^(upright("tot")) - 3 k$, whereas Dirac indices add without a correction. These statements follow from the APS index formula with the specified framing convention #cite(label("AtiyahPatodiSingerI")).

=== 8.2 Lens fillings and their indices <lens-fillings-and-their-indices>

Let $N$ be the disk bundle with zero section $S$, $S^2 = - 4$. Normalize the boundary holonomy by a square root of the determinant on $N$. The three states are the central states $+$ and $-$, and the trace-zero state. This normalization is local to $N$: after a determinant bit is flipped, the two normalizations need not agree when viewed from the exterior. An effective cap charge $kappa_N$ includes particles in the cap and all trajectory charge in this end, with the boundary state specified as seen from the main component.

#thm([Proposition 8.3.])[
  #emph[The framed ASD and spinor corrections supplied by this end are 
#[#set math.equation(numbering: n => "(8.6)")
 $ upright("state") & upright("charge congruence") & delta_I & delta_(upright("sp"))\
+ \, - & kappa_N in bb(Z) & 8 kappa_N & 6 kappa_N\
upright("trace") & kappa_N in 1 / 4 + bb(Z) & 2 + 8 \( kappa_N - 1 / 4 \) & 2 + 6 \( kappa_N - 1 / 4 \) $ <eq:indices:lens-table>]

 For a split main field there are reference fillings with 
#[#set math.equation(numbering: n => "(8.7)")
 $ upright("state") & d = v \( S \) & kappa_(upright("ref")) & upright("choice for an active line")\
+ & 0 & 0 & K \( S \) = Lambda S\
- & plus.minus 4 & 1 & \| Lambda S + d \| lt.eq 4\
upright("trace") & plus.minus 2 & 1 / 4 & upright("the prescribed boundary eigenline") $ <eq:indices:reference-fillings>]

 Here $\| Lambda S \| = 2$. With these choices the pure-line tangential correction, including stabilizer matching, is zero.]
] <prop:indices:lens-index>

#proof[
  A cohomology class evaluating as $r$ on $S$ has square $- r^2 \/ 4$. Consequently a splitting with difference $d$ has charge $d^2 \/ 16$. The normalized eigenline has degree $d \/ 2$ on $S$ and boundary character $exp \( pi i d \/ 4 \)$, up to inversion of the chosen generator. Thus $d = 0 \, plus.minus 4 \, plus.minus 2$ give the three states in (8.7). Comparing any filling with a reference by gluing changes the charge by an integer, proving the congruences.
  We compute the local Dirac correction explicitly. In this calculation $k \( S \)$ is the #emph[spin-$c$ determinant evaluation], not the evaluation of a twisting line. On the Hirzebruch surface $bb(F)_4$, let $T$ be a fiber divisor. The canonical class is $- 2 S - 6 T$, so the canonical spin-$c$ determinant evaluates as $- 2$ on $S$. Twisting by $cal(O) \( a T \)$ gives $k \( S \) = - 2 + 2 a$. Projection to $bb(C P)^1$ gives
  $ chi \( bb(F)_4 \, cal(O) \( a T \) \) = a + 1 . $
  Contracting $S$ gives $bb(P) \( 1 \, 1 \, 4 \)$, with $cal(O) \( a T \)$ corresponding to $cal(O) \( a \)$ on the common smooth complement. Set
  $ H \( j \) = cases(delim: "{", sum_(b = 0)^(floor.l j \/ 4 floor.r) \( j - 4 b + 1 \) \, & j gt.eq 0 \,, 0 \, & j < 0 .) $
  Weighted monomials compute $H^0$, intermediate cohomology vanishes, and Serre duality uses the canonical sheaf $cal(O) \( - 6 \)$. Hence
  $ chi \( bb(P) \( 1 \, 1 \, 4 \) \, cal(O) \( a \) \) = H \( a \) + H \( - a - 6 \) \; $
  see #cite(label("Dolgachev1982")) Sections 1.2.3 and 1.4.1. Regard $X = bb(P) \( 1 \, 1 \, 4 \)$ as the complex orbifold with its standard cyclic quotient chart at the contracted point. Its orbifold line $cal(L)_a = cal(O) \( a \)$ has invariant holomorphic-section sheaf equal to the coherent sheaf denoted $cal(O) \( a \)$ above. On each finite uniformizing chart, averaging the Dolbeault resolution over the finite group preserves exactness; invariant partitions of unity make it a fine resolution. Thus the orbifold Dolbeault index of $cal(L)_a$ equals the coherent Euler characteristic just computed. The canonical spin-$c$ Dirac operator twisted by $cal(L)_a$ has the same symbol and hence the same index #cite(label("Kawasaki1979")) pp. 155–156.
  The contraction identifies the complements of $S subset bb(F)_4$ and the quotient point of $X$ holomorphically, identifying $cal(O) \( a T \)$ with $cal(L)_a$. Since $K_(bb(F)_4) = - 2 S - 6 T$, this identification also identifies the canonical spin-$c$ structures on the complement and their boundary restrictions. We use this identification, including its boundary character, for the twisted spin-$c$ structures. In the quotient chart, write $zeta \( u \, v \) = \( zeta u \, zeta v \)$ for $zeta in mu_4$, and choose the character convention $cal(L)_a arrow.l.r zeta^a$. The canonical determinant character is $zeta^2$, so twisting gives $zeta^(2 + 2 a)$, consistent with $k \( S \) = - 2 + 2 a$ modulo four. The common-complement identification fixes the full boundary spin-$c$ structure, not merely this determinant residue.
  Choose identical product operators on a separating smooth lens-space collar. Cutting with complementary boundary spectral projections gives the same exterior contribution in the two index problems. This cutting identity is local on the smooth collar: its parametrix and matching maps commute with finite-group averaging on the quotient-ball side. Consequently only the indices of the two fillings differ; no characteristic-number formula for an orbifold with boundary is being assumed.
  The quotient-ball filling is $B^4 \/ mu_4$, with the corresponding equivariant flat line on $B^4$. Choose an invariant positive-scalar cylindrical completion and flat twisting. The Weitzenböck identity kills the $L^2$ kernels in both chiralities upstairs, hence in each required finite-group invariant subspace. The boundary Dirac operator is invertible, so a sufficiently small decay weight crosses no root. The ball Dirac index is therefore zero. The common-exterior comparison gives
  $ "ind"_(bb(C)) D_N^(+) = chi \( bb(F)_4 \, cal(O) \( a T \) \) - chi \( X \, cal(L)_a \) \, $
  which yields the following table:
  #[#set math.equation(numbering: n => "(8.8)")
   $ k \( S \) & a & chi \( bb(F)_4 \, cal(O) \( a T \) \) & chi \( bb(P) \( 1 \, 1 \, 4 \) \, cal(O) \( a \) \) & "ind"_(bb(C)) D_N^(+)\
- 6 & - 2 & - 1 & 0 & - 1\
- 4 & - 1 & 0 & 0 & 0\
- 2 & 0 & 1 & 1 & 0\
0 & 1 & 2 & 2 & 0\
2 & 2 & 3 & 3 & 0\
4 & 3 & 4 & 4 & 0\
6 & 4 & 5 & 6 & - 1 $ <eq:indices:dirac-table>]
  For the ASD operator, the framed real tangential line index on $N$ is zero, since $H^1 \( N \) = 0$ and $b^(+) \( N \) = 0$. The complex off-diagonal index is obtained by comparing
  $ - chi \( bb(F)_4 \, cal(O) \( d T \) \) - chi \( bb(F)_4 \, cal(O) \( - d T \) \) $
  with the corresponding expression on the weighted plane. Indeed, the Kähler symbol is the direct sum of the reversed Dolbeault symbols for the difference line and its inverse, so its complex index is the negative sum of these two Euler characteristics. The same description holds for the corresponding orbifold lines, and the common-collar comparison applies to these symbols as well. The flat quotient ball has no deformation cohomology in degrees one or two. Its sole unframed contribution is the negative of the space of parallel gauge generators. Adding the boundary-framing factor cancels this contribution, including when the boundary character is trivial. Thus its framed index is zero. The differences are $0 \, 1 \, 4$ complex dimensions for $d = 0 \, 2 \, 4$ respectively. For example, at $d = 2$ the two resolution Euler characteristics are $3 \, - 1$, and the orbifold values are $3 \, 0$, giving difference $+ 1$. Doubling yields framed real ASD indices $0 \, 2 \, 8$.
  For $Lambda S = 2$, the two Dirac determinant evaluations are $2 + d$ and $2 - d$. Their index sums from (8.8) are $0 \, 0 \, - 1$ at $d = 0 \, 2 \, 4$. Changing the sign of $Lambda S$ gives the same sums. Increasing relative charge by one with the boundary data fixed increases the ASD index by eight and decreases the complex Dirac index by one. Thus the coupled Dirac corrections are $- kappa_N$ at a central state and $1 / 4 - kappa_N$ at trace. Adding twice these to the ASD corrections proves (8.6).
  Finally choose the active-line reference at $-$ with sign opposite to $Lambda S$. The two choices $d = plus.minus 4$ restrict to the same allowable boundary eigenline: their individual line degrees differ by four. More explicitly, with the determinant root fixed, the active extensions differ by a line $M$ of degree four up to sign on $N$, and the complementary extensions differ by $M^(- 1)$. The restriction $H^2 \( N \; bb(Z) \) arrow.r H^2 \( partial N \; bb(Z) \)$ is reduction modulo four. The reference connection on $M$ therefore has trivial flat boundary restriction; choose a parallel trivialization there and its inverse on the complement. This gives a determinant-one identification preserving the active boundary line and the fixed transition, and identifies the spinors themselves, not merely their determinant classes. Boundary trivializations introduce no $"U" \( 1 \)$ degree because $H^1 \( partial N \; bb(Z) \) = 0$. At $+$ and trace the prescribed choices already give $\| K \( S \) \| lt.eq 4$. Equation (8.8) gives zero active-line Dirac index in all these cases. Together with the zero framed scalar ASD/gauge index, and matching of its parallel $"U" \( 1 \)$, this gives zero tangential correction. Choosing the other reference at $-$ would instead give $\| K \( S \) \| = 6$ and real tangential correction $- 2$; that is why the choice in (8.7) is necessary.
  The calculation was made with round links. The positive-scalar link homotopies in Theorem 54 preserve the boundary Dirac gap; flat adjoint cohomology is unchanged. Index invariance and excision with any intervening cylinders therefore give the same answers for the chosen ends. ◻
]

#thm([Lemma 8.4.])[
  #emph[On an actual separated $N$ and its infinite lens cylinders the spinor is zero. If its sphere cut is retained, its effective charge satisfies 
#[#set math.equation(numbering: n => "(8.9)")
 $ kappa_N in bb(Z)_(gt.eq 1) quad upright("at ") + \, - \, #h(2em) kappa_N in 1 / 4 + bb(Z)_(gt.eq 0) quad upright("at trace") . $ <eq:indices:lens-charge>]

 At trace charge $1 \/ 4$, there are no particles or nonconstant cylinder levels, and the cap itself has charge $1 \/ 4$.]
] <lem:indices:lens-charge>

#proof[
  On $N$ the fixed-line curvature is harmonic ASD and the metric has positive scalar curvature; the same applies to its exact limiting cylinders with flat background. Integrating the Dirac identity with finite-energy cutoffs therefore annihilates the spinor. The sufficiently small compact ASD perturbations allowed on $N$ preserve this conclusion by absorption in the positive scalar term, with no Dirac perturbation there. On an unperturbed cylindrical level a nonconstant ASD trajectory has strictly positive charge, whereas zero charge means a constant flat. On a cap with a compact curvature perturbation and zero spinor, Chern–Weil gives
  $ kappa_(upright("cap")) gt.eq - C parallel F_a^(0 \, +) parallel_(L^2)^2 gt.eq - C' parallel P_(+) parallel_(L^2)^2 > - 1 / 4 $
  after decreasing the permitted perturbation size. Its discrete charge congruence therefore makes its charge nonnegative, and at least $1 \/ 4$ when its own end is trace. Particles carry positive integer charges. The congruences in Proposition 76 now imply the claimed ranges, except possibly central charge zero.
  At $+$, the zero-charge unperturbed cap is flat and its sphere sweep misses $- 1$. At $-$, a flat extension is impossible because $N$ is simply connected. This excludes charge zero with the cut. These exclusions persist for the permitted small compact cap perturbations: a sequence violating them as the perturbation tends to zero has no energy available for bubbling or nonconstant levels, so converges to the flat case; the modified sphere path has a uniform avoidance gap there. The local compactness and no-loss assertion used in this last sentence is proved independently of exclusion in Lemmas 97 and 98.
  For effective trace charge $1 \/ 4$ an integer particle is impossible. A nonflat cap with the cut already has charge at least $1 \/ 4$ if its own end is trace, and at least one if it is central. A zero-charge flat cap at $+$ misses the cut. There is consequently no charge left for a nonconstant cylinder level, proving the final assertion. ◻
]

#thm([Corollary 8.5.])[
  #emph[At the minimal trace reducer, the framed tangential ASD index is zero, the normal ASD index is one complex dimension, and the coupled Dirac operator is invertible. Its normalized eigenline sphere sweep has winding of absolute value one.]
] <cor:indices:trace-minimum>

#proof[
  Order the summands with $d = 2$. The normalized eigenline has degree one. The harmonic Abelian ASD extension is unique for this ordered boundary line, since $H^1 \( N \) = 0$ and $b^(+) \( N \) = 0$; any parallel boundary identification is absorbed by the cap’s parallel stabilizer. The ASD indices were computed in Proposition 76. The two Dirac determinant evaluations are $0$ and $plus.minus 4$, so their total index is zero. Positive scalar curvature and ASD curvature annihilate the positive Dirac kernel; index zero then annihilates the cokernel. The degree-one eigenline gives the asserted winding. Normal ASD surjectivity and regularity of the cap cut require the additional choices made in Section 10; they are not consequences of this index statement. ◻
]

=== 8.3 Virtual pieces and the analytic hypotheses <virtual-pieces-and-the-analytic-hypotheses>

The calculation below applies to a finite stack with nonzero ordinary count and $n_D^(upright("tot")) > 0$. Lemma 85 specifies the required outside data; with those data fixed, Theorem 53 supplies the repetitions. The ordinary dimension condition and the number of phase sections are

#[#set math.equation(numbering: n => "(8.10)")
 $ D_I^(upright("tot")) + n - 2 n - z = 0 \, #h(2em) eta = n_D^(upright("tot")) - 1 gt.eq 0 . $ <eq:indices:phase-count>]

There are $n$ interval parameters, $n$ real-degree-two sphere tests, cap insertions of total real degree $z$, and $eta$ complex sections of phase weight two. The free spinor dimension after these cuts and phase quotient is therefore

$ \( D_I^(upright("tot")) + n - 2 n - z \) + 2 n_D^(upright("tot")) - 2 eta - 1 = 1 . $

Keep $k$ true $J$-cuts in a limiting tuple, and virtually fill all lens cuts and all $J$-ends. The resulting $k + 1$ main components are ordered from left to right. Let $p_i$ count the remaining interval parameters on component $i$, restoring a parameter at each of its lens ends. Let $s_i$ count its assigned sphere tests, and $z_i$ its cap degree. At a $J$-cut the one sphere event is assigned to the side on which it occurs. Allocate particle charges and integer $J$-trajectory charges to pieces, and include all effective lens charges in the corresponding virtual filled indices. Set

#[#set math.equation(numbering: n => "(8.11)")
 $ q_i = D_(I \, i) + p_i - 2 s_i - z_i \, #h(2em) i_i = q_i + 2 n_(D \, i) . $ <eq:indices:q-and-i>]

#thm([Lemma 8.6.])[
  #emph[These virtual numbers satisfy 
#[#set math.equation(numbering: n => "(8.12)")
 $ sum_i \( q_i + 4 \) = 4 \, #h(2em) sum_i i_i - 2 eta = 2 - 4 k . $ <eq:indices:virtual-sums>]

 For a component of type $R$ or $S$, the split reference fillings of Proposition 76 give 
#[#set math.equation(numbering: n => "(8.13)")
 $ kappa_i = - v_i^2 / 4 + ell_i \, #h(2em) ell_i in bb(Z)_(gt.eq 0) . $ <eq:indices:ell>]

]
] <lem:indices:virtual-sums>

#proof[
  The $J$-gluing formulas and allocation of charges give
  $ sum_i D_(I \, i) = D_I^(upright("tot")) - 3 k \, quad sum_i n_(D \, i) = n_D^(upright("tot")) \, quad sum_i p_i = n - k \, quad sum_i s_i = n \, quad sum_i z_i = z . $
  Thus $sum_i q_i = - 4 k$, proving both sums. The fourth lost dimension per $J$ is the removed interval parameter, in addition to the three ASD stabilizer dimensions. For a split field, $c_2 \( L_1 xor L_2 \) - c^2 \/ 4 = - v^2 \/ 4$. Actual particles and allocated $J$-trajectory charges add nonnegative integers. At a lens end the actual charge minus the chosen reference charge is also a nonnegative integer by Lemma 77 and (8.7). Their sum is $ell_i$. ◻
]

#prodef([Definition 8.7.])[
  Call a choice of equations and representatives #emph[admissible for the exclusion calculation] if it has the following properties, for all ideal main-part tuples in the fixed total charge budget, including the enlarged candidate class described in Section 9.6. In this class the completed main fields satisfy their equations and retained nonphase cuts, together with the phase cuts when imposed. Matching across true cuts and the actual lens-cap and connector fields are omitted. The assigned lens-cap and connector charges obey their permitted nonnegative ranges and the total charge constraint; the omitted fields need not be realizable.
  + On a fixed-type tuple, the restricted ASD equations with retained nonphase cuts on type $A$ components, and the pure tangential equations on type $S$ components, are transverse. In particular a type $A$ component has $q_i gt.eq 0$, with strict inequality if it has any lens end, main particle, or allocated nonconstant $J$-trajectory loss. A type $S$ component satisfies
    #[#set math.equation(numbering: n => "(8.14)")
     $ d_s + p_i + 4 ell_i gt.eq 0 . $ <eq:indices:tangential-bound>]
    These are componentwise assertions using only parameters retained on the component.
  + For types $R \, S$, an assigned whole sphere test with $v \( S_j \) = 0$ requires a unit of $ell_i$. This includes a separated lens test. During switching to the $J$ prescription the unit is required if both half values vanish; at a true $J$ the assigned test requires the unit if its own half value vanishes. Different sphere tests so charged on the same component require distinct units. Type $S$ is needed in this assertion only for a tuple with no $P$.
  + For a tuple containing $P$, project away all type $R$ fields, positions, and tests, retaining their parameters. The equations and retained cuts on the other components are independent of the discarded data. Before diagonal phase quotient and phase cuts, the necessary projected problem has dimension at most
    #[#set math.equation(numbering: n => "(8.15)")
     $ sum_(i in.not R) (i_i - sum_(upright("lens ends of ") i) \( delta_(upright("sp")) - 1 \) - 2 w_i) + sum_(i in R) p_i \, $ <eq:indices:projection-input>]
    where $w_i$ is the total main-particle weight and other allocated integer loss outside lens caps on that component. The $eta$ phase sections subtract $2 eta$, and the phase quotient subtracts one. Regularity is required only near the projections of candidate tuples in the stated overcount, with all $R$ fields still present before projection. At those candidate projections, a negative dimension excludes a zero. No assertion is made about other zeros of the enlarged equations after the $R$ fields are discarded. This permits finite rational multisections on free strata without changing the integral instanton maps at zero spinor.
] <def:indices:analytic-hypotheses>

Here is the finite-dimensional loss calculation underlying these requirements. It also specifies which incidence bounds the analytic construction must preserve.

#thm([Lemma 8.8.])[
  #emph[For exact sphere, cap surface, and cap point representatives as in Section 9, a particle of integer weight $a gt.eq 1$ can recover at most $4 a$ dimensions through its position and any cuts dropped at that position. A main particle consequently has net penalty at least four in ASD dimension and two in spinor dimension. A separated lens has net penalty $delta_I - 1$ or $delta_(upright("sp")) - 1$ in the respective cut-down main problem.]
] <lem:indices:loss-budget>

#proof[
  An unconstrained particle position contributes four and releases no cut. A particle hitting the exact support of a sphere sweep has at most two position dimensions; dropping the entire sphere test releases two more. The same budget holds for a cap surface cut, whose position varies in a two-dimensional domain and whose real degree is two. At a fixed cap point there are zero position dimensions and the released degree is four. Two transverse cap surfaces can be hit at one point: the position is then zero-dimensional and the released degree is four. General position excludes triple surface hits and intersections with the fixed cap points. Sphere supports are mutually disjoint and disjoint from cap tests. These cases exhaust the possibilities, also for sphere maps with self-intersections, because their exact supports are parameterized by their two-dimensional domains. Thus the bound is four per distinct particle position, and at most $4 a$ per particle weight.
  Dropping the integer charge $a$ lowers $D_I$ by $8 a$ and $D_(upright("sp"))$ by $6 a$, giving the stated net penalties. Ignoring matching and using the same conservative recovery allowance for allocated integer trajectory units only enlarges the necessary problem. At a lens end, let $delta$ be its framed index correction. Relative to the virtual filled problem, the main index falls by $delta$, one parameter is removed, and its sphere cut of degree two is omitted. The net change is $- delta - 1 + 2 = - \( delta - 1 \)$. ◻
]

By (8.6) and (8.9), a lens therefore costs at least one in either calculation. Its ASD penalty is at least seven at a central state; its spinor penalty is at least five there. At trace the spinor penalty is exactly $1 + 6 h$ when $kappa_N = 1 / 4 + h$. Type $A$ regularity therefore implies (i), with strictness for every loss. For type $S$, fill by the sharp tangential references and ignore all retained cuts; allowing four position dimensions per unit of $ell_i$ gives (8.14). The remaining issue is to obtain these regularity and independence assertions simultaneously. Section 9 proves them, rather than assuming regularity of a split-component Dirac operator with negative index.

=== 8.4 The square estimate on a positive cell <the-square-estimate-on-a-positive-cell>

We now use the lattice of Proposition 43 and the metric tests of Theorem 64. In a positive cell put

$ x = v G \, #h(2em) u = v U \, #h(2em) t_b = v T_b quad \( 1 lt.eq b lt.eq 4 \) . $

The cell contributes

#[#set math.equation(numbering: n => "(8.16)")
 $ Q_0 = 2 x u - 2 u^2 - sum_(b = 1)^4 t_b^2 $ <eq:indices:positive-square>]

to $v^2$. Exactly two $t_b$ are odd. The two neighboring negative half values will be denoted $h_1 \, h_2$, and the whole side evaluations are

#[#set math.equation(numbering: n => "(8.17)")
 $ d_1 = x - sum_b t_b - h_1 \, #h(2em) d_2 = x - 2 u - h_2 . $ <eq:indices:d-values>]

All $x \, h_i \, d_i$ are even. In particular, for a selected nonempty subset $I$ of whole sides,

#[#set math.equation(numbering: n => "(8.18)")
 $ z_I = u + 1 / 4 sum_(i in I) d_i in 1 / 2 bb(Z) . $ <eq:indices:z-local>]

We retain the subscript here to distinguish $z_I$ from the cap insertion degree $z$.

For endpoint bits $e \, f in { 0 \, 1 }$, the background values are

#[#set math.equation(numbering: n => "(8.19)")
 $ lambda = - 1 - e + f \, quad lambda_({ 1 }) = - 3 / 2 + f \, quad lambda_({ 2 }) = - 1 / 2 - e \, quad lambda_({ 1 \, 2 }) = - 1 . $ <eq:indices:lambda-values>]

If $u eq.not 0$, the clamp selects a nonempty subset of available #emph[whole] sides with

#[#set math.equation(numbering: n => "(8.20)")
 $ "sign" \( u \) z_I lt.eq 0 quad \( R \) \, #h(2em) "sign" \( u \) z_I < \| lambda_I \| quad \( S \) . $ <eq:indices:clamp-input>]

A side whose test has switched to the separate-half rule is not needed in this subset. A sphere in a separated lens cap still counts as whole for this assertion and for its reference filling.

#thm([Lemma 8.9.])[
  #emph[For a cell of type $R$ or $S$, combine its square with the neighboring negative half contributions $- 1 / 2 sum_(i in I) h_i^2$ selected by the clamp. The resulting square $Q$ is at most $- 2$, except possibly in type $S$ when $I$ is a singleton and $u = z_I = 1$ or $u = z_I = - 1$. In that exception $Q lt.eq 2$ and the selected whole side has $d_i = 0$. If $u = 0$, the cell square alone is at most $- 2$.]
] <lem:indices:positive-square>

#proof[
  For $u = 0$, Equation (8.16) and the two odd $t_b$ give $Q_0 lt.eq - 2$. Suppose $u eq.not 0$. Direct substitution from (8.17)–(8.18) gives
  #[#set math.equation(numbering: n => "(8.21)")
   $ I = { 1 } : quad Q & = 8 z_I u - 4 u^2 - sum_b \( t_b - u \)^2 - frac(\( h_1 - 2 u \)^2, 2) \,\
I = { 2 } : quad Q & = 8 z_I u - 4 u^2 - sum_b t_b^2 - frac(\( h_2 - 2 u \)^2, 2) \,\
I = { 1 \, 2 } : quad Q & = 4 z_I u - 2 u^2 - sum_b \( t_b - u \/ 2 \)^2 - sum_(i = 1)^2 frac(\( h_i - u \)^2, 2) . $ <eq:indices:square-one>]
  Let $a = \| u \| gt.eq 1$ and $w = "sign" \( u \) z_I$. For a singleton the exceptional-square sum is at least two, also after shifting each $t_b$ by the integer $u$: exactly two of the shifted values remain odd. Type $R$ has $w lt.eq 0$ and therefore $Q lt.eq - 2$. For type $S$, the singleton threshold is $1 \/ 2$ or $3 \/ 2$. Since $w in 1 / 2 bb(Z)$, the former implies $w lt.eq 0$ and the latter $w lt.eq 1$. Thus
  $ Q lt.eq 8 a w - 4 a^2 - 2 lt.eq 8 a - 4 a^2 - 2 . $
  For $a gt.eq 2$ the last expression is at most $- 2$. For $a = 1$, every $w lt.eq 1 \/ 2$ still gives $Q lt.eq - 2$. The remaining possibility is $a = 1 \, w = 1$, that is, $u = z_I = plus.minus 1$. Its upper bound is two, and $d_i = 4 \( z_I - u \) = 0$.
  For two sides, type $R$ again has $w lt.eq 0$, while type $S$ has $w < 1$, hence $w lt.eq 1 \/ 2$. If $u$ is even, the $t_b - u \/ 2$ are integers with two odd values, so their squared sum is at least two. If $u$ is odd, all four are half-integers, contributing at least one; both $h_i - u$ are odd, so the final sum in (8.21) contributes at least one more. In both cases
  $ Q lt.eq 2 a - 2 a^2 - 2 lt.eq - 2 . $
  This proves every case, including the stated exceptional alternative. ◻
]

The exception requires an actual loss unit. Its side was selected among whole tests, so property (ii) of Definition 80 applies to $d_i = 0$. This use of a whole side is the reason the metric construction stops using a side before its sphere representative switches to the $J$ rule.

=== 8.5 Incidence assignments and fixed-type runs <incidence-assignments-and-fixed-type-runs>

Consider an interior filled component between true $J$-cuts. Let $L_i$ be its number of cells, and $m_i$ its number of positive cells. By Equation (5.13),

#[#set math.equation(numbering: n => "(8.22)")
 $ p_i = L_i - 1 \, #h(2em) b_i^(+) = m_i \, #h(2em) Theta_i = m_i + Delta_i / 2 . $ <eq:indices:interior-data>]

The bit differences $Delta_i$ telescope on contiguous runs, so their sum is the difference of two bits and belongs to ${ - 1 \, 0 \, 1 }$. Each negative cell contributes minus one half the sum of the squares of its two even half-sphere evaluations.

We specify the assignment convention carefully. Reserve two potential slots for each positive cell, one at each adjacent test. A slot is occupied by the whole test or by the half test assigned to that cell’s side of a $J$-break. Let $s_P lt.eq 2 m_i$ be the number of the component’s assigned tests occupying these slots, and put $s_N = s_i - s_P$. All other assigned tests use the negative rule: charge one nonzero even half value in the component, or, if all the relevant half values vanish, charge a unit of $ell_i$. A nonzero even half contributes at most $- 2$ to $v^2$.

The negative halves used with the clamp in Lemma 82 are reserved along with the positive-cell slots, and are never used by the negative rule. Each half belongs to one adjacent test, so no half is charged twice. Positive cells have disjoint adjacent macros at the prescribed spacing. A test assigned across a $J$ to a neighboring negative component uses the negative half in that component; the positive-cell slot on the other side is then empty. This convention also applies when only one of those components belongs to a run under consideration. At an outside cap, the bordering negative trace half is available to the negative rule. During switching the negative rule only needs a nonzero half or the incidence unit when both half values vanish, exactly as in Definition 80.

#thm([Lemma 8.10.])[
  #emph[For an interior fixed component of type $R$ or $S$ satisfying the incidence property (ii) of Definition 80, 
#[#set math.equation(numbering: n => "(8.23)")
 $ 8 kappa_i gt.eq max \( 4 s_i - 4 m_i \, thin 4 m_i \) \, $ <eq:indices:charge-lower>]

 and 
#[#set math.equation(numbering: n => "(8.24)")
 $ q_i + 4 gt.eq max \( 2 s_i + L_i - 7 m_i \, thin m_i + L_i - 2 s_i \) . $ <eq:indices:q-score>]

 More precisely, if $z_0$ negative-rule assignments have no nonzero half option and $e_0$ positive cells have the exception of Lemma 82, then 
#[#set math.equation(numbering: n => "(8.25)")
 $ ell_i gt.eq z_0 + e_0 \, #h(2em) 8 kappa_i gt.eq 4 \( s_N - z_0 \) + 4 m_i - 8 e_0 + 8 ell_i gt.eq 4 s_N + 4 m_i . $ <eq:indices:incidence-charge>]

]
] <lem:indices:component-score>

#proof[
  The zero negative-rule tests and the exceptional whole tests are distinct assigned tests with disjoint sphere supports. Property (ii) therefore charges distinct units and gives $ell_i gt.eq z_0 + e_0$. The negative rule contributes at most $- 2 \( s_N - z_0 \)$ to $v_i^2$. The positive-cell estimates contribute at most $- 2 m_i + 4 e_0$. Every remaining negative square can be discarded in an upper bound. Multiplying by $- 2$ in (8.13) gives the middle inequality of (8.25). Substitution of $ell_i gt.eq z_0 + e_0$ gives the last one (in fact it leaves an additional $4 z_0$). Now $s_N gt.eq s_i - 2 m_i$ and $s_N gt.eq 0$, proving (8.23). Finally, since there are no cap insertions on an interior piece,
  $ q_i + 4 = 8 kappa_i + L_i - 3 m_i - 2 s_i . $
  Using the two charge bounds gives (8.24). ◻
]

#thm([Lemma 8.11.])[
  #emph[For any nonempty contiguous run of interior components of types $R \, S$, 
#[#set math.equation(numbering: n => "(8.26)")
 $ sum_(i upright(" in the run")) \( q_i + 4 \) gt.eq - 2 . $ <eq:indices:fixed-run>]

]
] <lem:indices:fixed-run>

#proof[
  Let $L \, m \, s$ be the totals on the run. Summing each of the two separate bounds in (8.24) gives
  $ sum \( q_i + 4 \) gt.eq max \( 2 s + L - 7 m \, thin m + L - 2 s \) . $
  Every internal adjacency contributes one assigned test to the run, while only its two endpoints can contribute an additional test. Thus $L - 1 lt.eq s lt.eq L + 1$. Corollary 46 gives $L gt.eq 4 m - 3$ for $m gt.eq 1$. If $m gt.eq 2$, the first bound is at least $3 L - 7 m - 2 gt.eq 5 m - 11 gt.eq - 1$. For $m = 1 \, L gt.eq 3$ it is at least $3 L - 9 gt.eq 0$. The remaining short possibilities are
  $ \( m \, L \) & upright("possible ") s & max \( 2 s + L - 7 m \, thin m + L - 2 s \)\
\( 1 \, 1 \) & 0 \, 1 \, 2 & 2 \, 0 \, - 2\
\( 1 \, 2 \) & 1 \, 2 \, 3 & 1 \, - 1 \, 1 . $
  For $m = 0$ the first bound is at least $L > 0$. Every case is at least $- 2$. ◻
]

=== 8.6 The outside caps and the large exceptional evaluations <the-outside-caps-and-the-large-exceptional-evaluations>

The constants in Proposition 72 depend only on the old caps $W$, before the extra blow-ups. They are independent of both the new exceptional evaluations and the number of intervals. We use both of its square bounds, one for $v$ and one for $K$.

#thm([Lemma 8.12.])[
  #emph[The delays before the first and after the last positive bridge, followed by the odd values $Lambda \( E_(upright("exc")) \)$, can be chosen so that no outside component has type $R$, and every outside component of type $S$ satisfying properties (i) and (ii) of Definition 80 has 
#[#set math.equation(numbering: n => "(8.27)")
 $ q_i + 4 gt.eq 8 . $ <eq:indices:end-score>]

 This holds also for a single component containing both outside caps. The choices precede the number of middle repetitions and all finite metric isolation sizes.]
] <lem:indices:end-exclusion>

#proof[
  The exclusion of $R$ is part of Proposition 72. Consider type $S$. Let $L$ count its internal cells and $m$ its positive cells. Rational orthogonal splitting separates the old cap parts, the new exceptional summands, the bordering negative trace halves, and the internal cells. Applying the incidence argument of Lemma 83, including the bordering trace halves, gives
  #[#set math.equation(numbering: n => "(8.28)")
   $ 8 kappa_i gt.eq 4 s_i - 4 m + 2 sum_(E_(upright("exc")) upright(" in ") i) v \( E_(upright("exc")) \)^2 - C_1 . $ <eq:indices:end-square>]
  To see that $C_1$ is uniform, the old-cap terms in $v^2$ are bounded above by the sum of their fixed constants $C_W$, the exceptional summands contribute $- v \( E_(upright("exc")) \)^2$, and all unused negative squares can only improve the estimate. The same $z_0 \, e_0$ incidence argument cancels the possible positive-cell exceptions. Only one or two fixed cap pieces are involved.
  On an end component $p_i = L + O \( 1 \)$, $s_i gt.eq L - O \( 1 \)$, and $b_i^(+) = m + O \( 1 \)$; all the constants, including $z_i$, depend only on the fixed caps. Substituting (8.28) in (8.11) therefore gives a single fixed $C$ with
  #[#set math.equation(numbering: n => "(8.29)")
   $ q_i gt.eq 3 L - 7 m + 2 sum_(E_(upright("exc")) upright(" in ") i) v \( E_(upright("exc")) \)^2 - C . $ <eq:indices:end-lower>]
  For example, the intermediate expression is $2 s_i + L - 7 m + 2 sum v \( E_(upright("exc")) \)^2 - C'$; using $s_i gt.eq L - O \( 1 \)$ gives the displayed form. Spacing gives $m lt.eq \( L + 3 \) \/ 4$, so its first two terms are at least $\( 5 L - 21 \) \/ 4$. Choose a fixed $L_(*)$ so large that $L gt.eq L_(*)$ already implies $q_i gt.eq 4$.
  Delay the first and last positive cells beyond $L_(*)$. An end component with $L < L_(*)$ then has no positive cell. Suppose, seeking the only remaining obstruction, that $q_i < 4$. All its topological dimension terms are bounded independently of the new values of $Lambda \( E_(upright("exc")) \)$, so (8.11) bounds $kappa_i$ above. There are no positive cells, and the cap estimate for $v$ gives $v_i^2 lt.eq C_v$, independently of those values. Thus
  $ 0 lt.eq ell_i = kappa_i + v_i^2 / 4 lt.eq C_ell . $
  The tangential necessary condition (8.14) now gives
  $ K_i^2 gt.eq 2 chi_i + 3 sigma_i - 4 p_i - 16 ell_i gt.eq - C_K . $
  There are only boundedly many negative cells and fixed caps in these short end components, so $C_K$ is uniform. The #emph[second] cap estimate, for $K$, and negativity of all the other summands give
  $ K_i^2 lt.eq C'_K - sum_(E_(upright("exc")) upright(" in ") i) K \( E_(upright("exc")) \)^2 . $
  It follows that every $\| K \( E_(upright("exc")) \) \|$ is bounded by a fixed number $B$, independent of $Lambda \( E_(upright("exc")) \)$. But
  $ \| v \( E_(upright("exc")) \) \| = \| K \( E_(upright("exc")) \) - Lambda \( E_(upright("exc")) \) \| gt.eq \| Lambda \( E_(upright("exc")) \) \| - B . $
  Choose the odd exceptional evaluations at both ends so large that (8.29) is incompatible with $q_i < 4$ even for $L < L_(*)$. A component containing either end contains its exceptional summand, so the argument covers both single-cap and two-cap components. This proves (8.27).
  The selection just made uses only the old-cap constants and the bounded short-end topologies: first $L_(*)$ and the delays, then the exceptional values. The middle repetitions can subsequently be chosen to make $n_D^(upright("tot")) > 0$ and the ordinary count nonzero. Only after that finite problem is fixed are the isolation lengths and perturbation sizes chosen as in Corollary 73. In particular the cap bounds are not being asserted uniformly over unboundedly many new field problems at one fixed isolation length. ◻
]

#thm([Proposition 8.13.])[
  #emph[With the preceding cap choices, a fixed-type tuple satisfying properties (i) and (ii) of Definition 80 has no true $J$-cut. No mixed projection regularity is assumed in this assertion. It is a single type $A$ component with no lens end, particles, or other positive loss. Its cut-down instanton dimension is zero.]
] <prop:indices:fixed-exclusion>

#proof[
  Suppose first that $k > 0$, so the two outside components are distinct. Each is type $A$ or $S$. Let $a$ be the number of all type $A$ components, and $b in { 0 \, 1 \, 2 }$ the number of type $S$ outside components. There are $a + b gt.eq 2$ distinguished components. They contribute at least $4 a + 8 b$ to $sum \( q_i + 4 \)$. The remaining components form at most $a + b - 1$ contiguous interior runs of types $R \, S$, each contributing at least $- 2$ by Lemma 84. Thus
  $ sum_i \( q_i + 4 \) gt.eq 4 a + 8 b - 2 \( a + b - 1 \) = 2 a + 6 b + 2 gt.eq 6 \, $
  contradicting (8.12). A run adjacent to an outside $S$ uses only its interior portion in this count; the outside component has already contributed its separate score of eight.
  If $k = 0$, there is a single component and $q_1 = 0$. It cannot be type $R$ by the cap exclusion, or type $S$ by (8.27). It is therefore type $A$. Property (i) rules out every lens end, particle, and allocated trajectory loss, since any of these would force $q_1 > 0$. Equation (8.10) is exactly its ordinary cut-down dimension-zero condition. ◻
]

=== 8.7 Projection away from reducible zero-spinor components <projection-away-from-reducible-zero-spinor-components>

For the mixed calculation only type $R$ is discarded. The sharper square bound for that type has no exceptional positive-cell case.

#thm([Lemma 8.14.])[
  #emph[For a nonempty contiguous run of $r$ interior components of type $R$, 
#[#set math.equation(numbering: n => "(8.30)")
 $ sum_(i upright(" in the run")) \( 4 + i_i - p_i \) gt.eq - 2 . $ <eq:indices:mixed-run>]

 More precisely, let $s \, m$ be the total assigned tests and positive cells, let $s_P$ count occupied positive-cell slots, and let $upright("miss") = 2 m - s_P$. With $Delta$ the telescoping endpoint bit difference, 
#[#set math.equation(numbering: n => "(8.31)")
 $ sum \( 4 + i_i - p_i \) gt.eq s - 4 m + r + Delta + 3 thin upright("miss") . $ <eq:indices:mixed-run-sharp>]

]
] <lem:indices:mixed-run>

#proof[
  From the definitions and (8.22),
  $ i_i - p_i = 6 kappa_i - 3 - m_i + Delta_i - 2 s_i . $
  With $e_0 = 0$, Equation (8.25) gives $6 kappa_i gt.eq 3 s_(N \, i) + 3 m_i$. Consequently
  $ 4 + i_i - p_i gt.eq 1 + s_i - 4 m_i + Delta_i + 3 \( 2 m_i - s_(P \, i) \) \, $
  which proves (8.31) after summing.
  If $m = 0$, its right side is $s + r + Delta gt.eq 0$ because $r gt.eq 1$ and $Delta gt.eq - 1$. Suppose $m > 0$. Write $a \, b gt.eq 0$ for the numbers of cells before the first and after the last positive cell in the run, and $epsilon.alt_a \, epsilon.alt_b in { 0 \, 1 }$ for the two endpoint test assignments into the run. Then
  $ L gt.eq 4 m - 3 + a + b \, #h(2em) s = L - 1 + epsilon.alt_a + epsilon.alt_b . $
  An endpoint with zero offset and no assignment leaves its boundary positive-cell slot empty. It therefore contributes one to $upright("miss")$. At the left endpoint,
  $ a + epsilon.alt_a + 3 thin upright(bold(1))_({ a = 0 \, epsilon.alt_a = 0 }) gt.eq 1 \, $
  and the identical statement holds at the right endpoint. The two empty boundary slots are distinct, including when there is only one positive cell. Applying these inequalities to (8.31) gives
  $ sum \( 4 + i_i - p_i \) gt.eq r + Delta - 4 + a + epsilon.alt_a + b + epsilon.alt_b + 3 thin upright("miss") gt.eq r + Delta - 2 gt.eq - 2 . $
  When a boundary test is assigned to a negative component outside the run, its cost is charged there by its negative half; inside the run the empty positive slot gives precisely the correction just used. No charge from an exterior component is borrowed in this calculation. ◻
]

#thm([Proposition 8.15.])[
  #emph[A tuple containing type $P$, satisfying the type $R$ incidence in property (ii) and the projection property (iii) of Definition 80, has no true $J$-cut. It has no particles or other integer losses. Apart from an unbroken free main field, the only possible case is one separated lens end of effective trace charge $1 \/ 4$, a single main component of type $P$, and no other lens end or loss.]
] <prop:indices:mixed-exclusion>

#proof[
  Write $N$ for the number of non-$R$ main components, and $N_(upright("lens") \, i)$ for the number of lens ends on component $i$. Since every lens penalty in (8.15) is at least one, the necessary projected dimension after phase and phase cuts is at most
  #[#set math.equation(numbering: n => "(8.32)")
   $ & sum_(i in.not R) \( i_i - N_(upright("lens") \, i) - 2 w_i \) + sum_(i in R) p_i - 2 eta - 1\
 & #h(2em) = 5 - 4 N - sum_(i in R) \( 4 + i_i - p_i \) - sum_(i in.not R) \( N_(upright("lens") \, i) + 2 w_i \) . $ <eq:indices:projected-dimension>]
  Indeed substitute $sum i_i - 2 eta = 2 - 4 k$ and $k + 1 = N + \# R$ to obtain the equality. This is a dimension of a necessary projection, so forgetting interpiece matching can only enlarge the candidate space. Its negative value excludes the original tuple without any regularity assertion for the discarded $R$ fields.
  If $k > 0$, both outside components are non-$R$ by Lemma 85, and hence $N gt.eq 2$. There are at most $N - 1$ contiguous $R$-runs. Applying Lemma 87 in (8.32) bounds it above by
  $ 5 - 4 N + 2 \( N - 1 \) = 3 - 2 N lt.eq - 1 . $
  Thus $k = 0$. There is only one main component, and because the tuple contains $P$ it has type $P$. The projected dimension is at most $1 - N_(upright("lens") \, 1) - 2 w_1$, so $w_1 = 0$ and $N_(upright("lens") \, 1) lt.eq 1$. If there is a lens end, use the actual penalty $delta_(upright("sp")) - 1$ in (8.15). A central cap costs at least five, while a trace cap of charge $1 / 4 + j$ costs $1 + 6 j$. Nonnegative dimension therefore forces trace charge exactly $1 \/ 4$. For an actual limiting tuple, Lemma 77 also excludes particles or breaks inside that cap and its cylindrical end. These are all the possibilities asserted. ◻
]

#thm([Theorem 8.16.])[
  (Numerical exclusion).  #emph[Choose the old-cap data, outside delays, exceptional evaluations, finite stack, metric sizes, and sufficiently small equation data in the order of Lemma 85 and Corollary 73, with $n_D^(upright("tot")) > 0$. Assume the regularity, incidence, and projection properties of Definition 80. Then the only fixed-type tuples meeting the nonphase cuts are the legitimate unbroken isolated type $A$ instantons. The free part after the $eta = n_D^(upright("tot")) - 1$ phase cuts and phase quotient has expected dimension one. Its only possible true-face or positive-loss limiting tuples are single trace-minimum lens faces, with one type $P$ main component and no other losses. Consequently the only boundary types to be constructed for its compactified one-dimensional count are links of the legitimate instantons and those trace-minimum ends.]
] <thm:indices:exclusion>

#proof[
  Proposition 86 gives the fixed-type assertion, and Equation (8.10) gives the dimension. Proposition 88 gives the asserted free degenerations. Lemma 77 describes the minimal cap. The analytic realization of these exclusions and of the instanton links is proved in Section 9; regular trace-end gluing and orientation comparison are proved in Section 10. ◻
]

== 9 Representatives, compactness, and regularization <sec:analysis>

We fix one of the finite topological problems constructed in Section 5, with the metrics, artificial lengths, backgrounds, and tolerances chosen in Sections 6 and 7. Only the actual $J = S^3$ and lens cuts may now have infinite length. In particular, a very long $Y$ seam is still a finite part of this problem. Constants below may depend on this finite problem. Connections have the specified integral determinant, transitions are fixed, and all gauges have determinant one. The letters $A \, R \, S \, P$ in this section denote the field types of Definition 74, not the capped Seifert surface $A$.

For the spinor regularization, the ordinary equation and representative data are based at the choices of Proposition 51, with the zero-winding and segmentation prescriptions already installed. Work inside its open neighborhood of genuine-face-preserving data on which the ordinary count is $Omega$. The weighted perturbation norm below maps continuously into the finitely many norms defining this neighborhood. Every subsequent generic choice is made in a sufficiently small relative open ball satisfying the harmonic-reducer, bit-identification, and parameter-locality conditions. These conditions leave the local variation spaces used below available. Thus regularizing the ideal problems never requires leaving the neighborhood that preserves $Omega$. The ordinary library proposition itself is independent of this choice: it applies to arbitrary ordinary data and assumes neither the metric clamps nor a nonzero count.

Here is the analytic statement used in the dimension calculation. Its ordinary assertion is also available before the spinor construction and does not assume the nonvanishing of any count.

#thm([Theorem 9.1.])[
  (Compatible regularization).  #emph[For the fixed finite family, equation perturbations and representatives can be chosen arbitrarily small in the prescribed norms with the following properties.]
  + #emph[Ordinary irreducible equations and the labelled sphere, surface, and point tests are transverse, including the relevant ideal and broken strata. Their representatives have the exact support and persistence properties of Lemma 99. They are compatible with fixed determinant gluing, marked translation on cylinders, and all true faces. Prescribed harmonic reducers on separated caps are preserved.]
  + #emph[Single-component, single-valued equivariant perturbations give the fixed-type regularity in Definition 80. Every tuple of fixed type is consequently excluded except the legitimate unbroken cut-down instantons.]
  + #emph[A finite collection of rational multisection terms, in addition to single-valued terms, eliminates every forbidden mixed ideal stratum by the negative dimension of its necessary projection. No equation or retained cut on this projection depends on discarded $R$ fields or their particles. The allowed free stratum is regular of dimension one, and the single trace-end main problem is regular of dimension zero. Choices on the exterior of a separated lens cap agree under the corresponding bit flip.]
  + #emph[Solutions have the compactness, removable-singularity, integral particle-charge, and exponential true-end properties proved below. Near each legitimate instanton, the phase-cut link has oriented count $2^eta$ times its instanton sign, where $eta = n_D^(upright("tot")) - 1$.]
  #emph[The finite branch lists have compatible weighted germs and total weight one. After the no-particle end gluing of Section 10, their oriented one-dimensional zero sets obey the ordinary rational Stokes rule.]
] <thm:analysis:regularization>

We construct the representatives, prove compactness, and regularize the fixed and forbidden strata in this section. The proof of the theorem is completed in Section 10, after the remaining lens ends have been given regular collars. Closed-manifold monopole compactness provides useful background #cite(label("FeehanLenessPU2I")), but does not by itself give the face, support, and projected-regularity assertions above.

The proof order is summarized in Table 2. Sections 2–5 construct the nonzero count $Omega$; the ordinary library used there is independently available. The remaining stages preserve this count and close the spinor boundary argument. In particular, the regular end construction in Section 10 precedes the final interior regularization there.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stage
], table.cell(rowspan: 1, colspan: 1)[Output used next
]),
  table.cell(rowspan: 1, colspan: 1)[Ordinary representatives
], table.cell(rowspan: 1, colspan: 1)[An independent ordinary library with exact support rules. Later choices remain in the neighborhood preserving the count constructed in Sections 2–5.
],
  table.cell(rowspan: 1, colspan: 1)[Energy and fixed types
], table.cell(rowspan: 1, colspan: 1)[Ideal compactness, exclusion of unwanted fixed types, and the legitimate instanton links.
],
  table.cell(rowspan: 1, colspan: 1)[Projected finite induction
], table.cell(rowspan: 1, colspan: 1)[Exclusion of forbidden mixed candidates and regular zero-dimensional trace-main problems.
],
  table.cell(rowspan: 1, colspan: 1)[Regular end gluing
], table.cell(rowspan: 1, colspan: 1)[Section 10 constructs exhaustive collars for the remaining no-particle lens ends, preserving branch weights and orientations.
],
  table.cell(rowspan: 1, colspan: 1)[Final free stratum
], table.cell(rowspan: 1, colspan: 1)[Section 10 completes the interior one-dimensional regularization and applies the weighted boundary rule to the resulting compact count.
],
)
]],
  caption: [Table 5: Stages of the analytic construction. The numerical inequalities of Section 8 are applied as their regularity and incidence hypotheses become available. ],
)

=== 9.1 Function spaces and allowable supports <function-spaces-and-allowable-supports>

Let $X$ be a completed component of an open face, and choose product coordinates $\( t \, y \)$ on each end. Use a smooth reference configuration which is the prescribed flat connection with zero spinor sufficiently far out; exponentially convergent references give the same spaces. Write $c^(a \, alpha)$ for the closure of smooth sections in the $C^(a \, alpha)$ norm, with $a gt.eq 3$ and $0 < alpha < 1$. For $delta > 0$ put

#[#set math.equation(numbering: n => "(9.1)")
 $ parallel u parallel_(a \, alpha \, delta) = parallel u parallel_(c^(a \, alpha) \( X_(upright("core")) \)) + sup_(j gt.eq 0) e^(delta j) parallel u parallel_(c^(a \, alpha) \( \[ j \, j + 2 \] times Y \)) \, $ <eq:analysis:weighted-norm>]

summing the last expression over the finitely many ends. Take the closure of compactly supported smooth sections in this norm. We use $E_a = c_delta^(a \, alpha) \( Lambda^1 ⊗ "ad" E xor W^(+) ⊗ E \)$ for field differences and $F_a = c_delta^(a - 1 \, alpha)$ for the curvature, Dirac, and gauge-slice equations. On finite inserted cylinders use the corresponding uniform strip norms; exponential weights are measured from the ends when a gluing norm is needed. Choose $delta$ smaller than the positive normal spectral gaps of the finitely many limiting flat states. The specific asymmetric lens norm is described in Section 10.

When a Sobolev cokernel test is used, choose a second weight $0 < delta_S < delta_H = delta$, both below the same positive indicial gaps. Then $c_(delta_H)^(a \, alpha)$ embeds in $W_(delta_S)^(1 \, p)$ for every finite $p$: on the $j$th strip the weighted integrand is bounded by a constant times $e^(- p \( delta_H - delta_S \) j)$. We do not use inclusion at equal weights, which need not hold. Elliptic end estimates transfer surjectivity back to weight $delta_H$ because no indicial root lies between these two weights, as detailed below.

The local gauge group consists of $c^(a + 1 \, alpha)$ determinant-one gauges whose difference from a parallel limiting constant is in $c_delta^(a + 1 \, alpha)$. Constants at different ends are independent. Thus the gauge Lie algebra is the decaying space together with a finite sum of cut-off parallel end sections. It is not the gauge group with a chosen frame fixed at every end. The usual local slice is obtained by adjoining the adjoint of the infinitesimal gauge action to the field equations. For a non-$R$ field its gauge stabilizer is finite. At an $R$ field we use the Abelian equations and its parallel stabilizer instead. If $frak(s)$ is its Lie algebra of global parallel stabilizers, the augmented gauge target in this latter convention is

$ "ann" \( frak(s) \) = {f in c_delta^(a - 1 \, alpha) : integral_X chevron.l f \, sigma chevron.r = 0 upright(" for every ") sigma in frak(s)} \, $

and gauge parameters are taken modulo $frak(s)$. An augmentation using the full target instead retains its $frak(s)$ cokernel, as on the cap in Section 10. All universal surjectivity assertions below concern non-$R$ fields; in particular the nonzero active spinor of type $S$ kills its infinitesimal determinant-one gauge stabilizer. The weighted elliptic operator on each fixed-asymptote slice is Fredholm; the extra limiting constants implement precisely the index convention of Section 2. The fixed-operator weighted Sobolev Fredholm theory is classical #cite(label("LockhartMcOwen1985")) Theorems 6.2 and 8.1, Lemmas 7.1 and 7.3. The transfer to the present little-Hölder spaces and the estimates uniform in neck length are established below. The local analytic inputs are the small-curvature gauge theorem #cite(label("Uhlenbeck1982Connections")) Theorems 1.3 and 2.1, Corollary 2.2, the usual gauge slices #cite(label("DonaldsonKronheimer1990")), and local elliptic parametrices and Sobolev/Schauder estimates #cite(label("Taylor1991")) Corollary 2.1.B and Theorem 2.2.C, revised author text.

The local sampling terms used below read holonomies and transported spinor values on compact graphs of loops and paths, and return outputs supported in compact balls. We first specify how these supports behave when necks separate.

The parameter space is treated stratum by stratum. Near a corner its length coordinates $T_j$ are independent, and the embeddings of each compact subset of a limiting component commute. A datum on a face is extended using these embeddings and a product of parameter cutoffs. A connected sampling graph and every ball in its energy cutoff belong to the same component. A term requiring transport through a cut is turned off before that cut separates. A nonstationary term far down an inserted collar is either zero there or has an exponentially small coefficient, with the same statement for its derivatives. We may impose any fixed finite exponential rate required subsequently. This is a condition on terms extending to increasing depths, not a restriction on compactly supported tests on any given open face.

Here is an explicit form of the exponential requirement. For an elementary term $p$, let $p^(\[ D \])$ mean its contribution whenever an input or output graph reaches depth at least $D$ in an inserted collar, or crosses a neck of length at least $2 D$; include any nonstationary error in this contribution. Put

#[#set math.equation(numbering: n => "(9.2)")
 $ N_(k \, mu) \( p \) = sup_(D gt.eq 0) e^(mu D) parallel p^(\[ D \]) parallel_(C_(upright(p a r \, f i e l d \, s p a c e))^k) \, #h(2em) mu > 0 \, $ <eq:analysis:exponential-seminorm>]

on each of the bounded configuration and parameter sets used for the library norms. The norm includes the relevant output operator derivatives, and its supremum is uniform in the other length coordinates. Each term has bounded-depth compact graphs on its limiting part, and its incompatible crossing extension is cut off at a finite length, so these seminorms are finite. Include integral $k \, mu$ in the countable norm list below. The summed contributions affected by flattening a middle of depth $D$ are then $O \( e^(- mu D) \)$ at every fixed required order. Fixed polynomial factors from derivatives can be absorbed by decreasing $mu$. Parallel end constants do not supply a nondecaying forcing term: their temporal part is removed by the parallel-group gauge ODE, and its endpoint rotations are allowed independently.

There are two further restrictions. First, a single-component term between two $J$ cuts uses only the metric parameters retained on that component: those in the intervals from its left bounding interval to its right bounding interval, inclusive. It vanishes near any intermediate $J$ separation incompatible with that component. Second, terms reaching a separated lens cap $N$ never couple it to another component. The Dirac perturbation on $N$ is zero, the curvature perturbation is zero on its Abelian locus, and exterior data are equal under the bit flip. Inside $N$ use the tensor-equivalent ASD data and sphere tests. These requirements are simultaneous at corners, by the product collars of Theorem 54. They leave all compact probes on the relevant main components available.

Ordinary perturbations on a finite $Y$ seam are time-independent gradients of smooth invariant functions of simultaneous solid-torus holonomies, averaged with a transverse disk density. The thickenings are submersive, their values are bounded, and their spatial Hessians are bounded on $L^2$. Retain their ordinary transversality choices and extend them independently of the spinor. They are supported away from the true cylinders. Their gradient nature, rather than a bound integrated over the seam length, is what is used in the energy estimate of Lemma 67. For the spinor family a fixed finite $Y$ seam is part of the compact body. Additional equation probes may be supported in any of its compact balls; their norms are included in the small nongradient remainder after the seam lengths have been fixed. This permits full local output variation there. The equation on a genuine ordinary Floer cylinder, where the length is unbounded in Floer theory, retains the separate time-independent gradient prescription.

=== 9.2 Exact representatives <exact-representatives>

#thm([Lemma 9.2.])[
  (The zero-winding modification).  #emph[Fix $1 \/ 2 < b < 1$. On the Hilbert manifold of $H^b$ paths $g : \[ 0 \, 1 \] arrow.r "SU" \( 2 \)$ with endpoints $1$ there is a smooth conjugation-equivariant operation $g mapsto hat(g)$, homotopic to the identity operation relative to the endpoints, such that every commuting path of winding zero has image a uniform positive distance from $- 1$. The operation fixes commuting paths of nonzero winding. It uses only the given path.]
] <lem:analysis:zero-winding>

#proof[
  Identify $"SU" \( 2 \)$ with the unit quaternions. For a nonconstant commuting path define
  $ M \( g \) = integral_0^1 "Im" g \( t \) ⊗ "Im" g \( t \) thin d t . $
  This is a rank-one positive matrix: if its eigenvalue were zero, continuity would force $g$ to be the constant path $1$. Near such a path its largest eigenvalue remains simple and determines a smooth, unoriented real line $L \( g \)$. Orthogonal projection onto $bb(R) xor L \( g \)$ followed by normalization gives a path $h_g$ in the circle subgroup associated to $L \( g \)$. Shrinking the neighborhood makes this projection nonzero at every time. Sobolev embedding $H^b arrow.r.hook C^0$ and the Banach algebra property for $b > 1 \/ 2$ show that all these operations are smooth.
  In the winding-zero neighborhood, the lift of $h_g$ starting at zero is a unique $H^b$ path $s_g \( t \) in L \( g \)$ with $s_g \( 0 \) = s_g \( 1 \) = 0$ and $h_g = exp s_g$. This definition is independent of an orientation of $L \( g \)$. Let $C$ be the set of commuting winding-zero paths meeting ${ "Re" lt.eq 0 }$. It is closed in the full based path space. Indeed axes have a convergent subsequence, uniform convergence preserves commutativity, and a limiting path meeting this hemisphere is nonconstant; the degree of its projected circle path is locally constant. An invariant open neighborhood $U$ of $C$ can consequently be chosen on which $L \( g \)$ and $s_g$ are defined and which contains no commuting path of nonzero winding.
  Smooth separation on a Hilbert manifold gives a function $f$, equal to one on $C$, with support in $U$ and $0 lt.eq f lt.eq 1$. Averaging over conjugation preserves these properties. Set
  $ hat(g) \( t \) = g \( t \) exp \( - f \( g \) s_g \( t \) \) \, $
  with the second factor equal to one outside $U$. Multiplying the exponent by a parameter in $\[ 0 \, 1 \]$ supplies the required homotopy. On $C$ the modified path is constant. A commuting winding-zero path outside $C$ lies in the positive-real hemisphere; its lifted angles lie in $\( - pi \/ 2 \, pi \/ 2 \)$ and partial multiplication replaces them by $\( 1 - f \)$ times those angles. It remains in that hemisphere. Thus all such modified paths lie in the closed positive-real hemisphere, whose distance from $- 1$ is positive. The stated behavior at nonzero winding follows from the choice of $U$. ◻
]

Apply the lemma to the normalized holonomy sweep of each sphere map. Parallel transport compares the frames, and the continuous square root of the determinant holonomy, starting at one, makes the sweep $"SU" \( 2 \)$-valued. The determinant evaluations on these spheres are even, so the sweep ends at one. At a parallel splitting its eigen-winding is $v \( S \) \/ 2$. The equation $hat(g) \( t \) = - 1$ has real codimension three with one moving mark $t$, hence degree two. Subsequent equivariant cut variations are absolutely smaller than half the avoidance gap in Lemma 91. Include all comparison paths in the basic support. The support is the image of a compact space of dimension at most two, and no thickening is added to it for purposes of incidence.

#thm([Lemma 9.3.])[
  (Segmentation at a primary cut).  #emph[The sphere representatives can be chosen so that, at a true $J$ face, their event is the disjoint union of the events on the two half spheres, with the prescribed signs. During the change from the whole-sphere rule to this rule, a commuting path whose two half degrees vanish retains a uniform avoidance gap. Every event on the face is intrinsic to its assigned side; no derivative of transport along the growing neck enters its definition.]
] <lem:analysis:segmentation>

#proof[
  The punctured traces are simply connected. The Hurewicz identification of $pi_2$ with $H_2$ shows that the sphere class and the signed sum of the two half classes are represented by homotopic sphere maps in the interval under consideration. Realize the latter map by concatenated sweeps with identity intervals and fixed whiskers. Use the whole-path operation until concatenation has been reached.
  At concatenation write $s$ for the whole logarithm and $s_1 \, s_2$ for the logarithms of the two zero-degree segments, extended by zero on the other segment. On commuting data with both degrees zero, $s = s_1 + s_2$. Interpolate the multipliers by
  $ exp \( - \( 1 - u \) f s \) thin exp \( - u f_1 s_1 \) thin exp \( - u f_2 s_2 \) \, #h(2em) 0 lt.eq u lt.eq 1 . $
  At a point of a segment meeting the nonpositive hemisphere its own cutoff is one, as is the whole cutoff. The exponent therefore cancels its whole angle. If a segment remains in the positive hemisphere, any partial cancellation still keeps its angle between its original value and zero. This proves the same uniform gap throughout the interpolation. The interpolation is equivariant and is defined on neighborhoods by the same cutoffs as before. The metric construction places this switch in the regimes where the old whole-sphere clamp is no longer required on that side.
  After switching, keep marks off the identity intervals. A whisker to the second sweep and its inverse conjugate that sweep by a transport independent of its internal mark. The equation that its value is $- 1$ and the modification are conjugation-invariant, so they may instead be defined in a frame intrinsic to that half. Variations of its cut use the same intrinsic description. Whiskers and the earlier homotopy lie in the original interval interior. At the actual split there is thus no graph crossing $J$ and no length-dependent frame comparison. ◻
]

To retain support incidences through finite switches, retain the earlier compact homotopy-support domains on their closed finite parameter ranges and the intrinsic half-support domains on their subsequent closed ranges. At a switching endpoint use the union of their limiting supports. This is a finite collection of closed incidence charts of dimension at most two in each parameter fiber; transversality is imposed also on their boundary strata, whose parameter dimension can only decrease. Consequently existing hits persist across every finite switch. In a neighborhood of the true face only the later intrinsic half domains remain. This convention changes neither the smoothly switching event equation nor the boundary of the actual zero set. It does not thicken a support or increase the released-degree budget.

For a cap surface or point use two complex sections of the rank-three universal adjoint bundle at the evaluation point, and require the resulting $3 times 2$ matrix to have rank at most one. Its rank-one stratum has complex codimension two; the rank-zero stratum has complex codimension six. This is the usual degeneracy representative of $c_2 \( "ad"_(bb(C)) E \) = - p_1 \( "ad" E \)$, with the sign and normalization for the chosen insertion kept outside the count. A variable point on an immersed surface reduces the real degree from four to two. Choose distinct surface representatives pairwise transverse with no triple incidence; fixed cap points are general. All sphere supports are disjoint from one another and from the cap tests. This is the exact evaluation representative: the sampling graphs used to construct its sections do not enlarge its basic incidence support.

Phase cuts are sections of character two for the original spinor phase $bb(T)$. They are determinant-one gauge invariant. Equation perturbations use none of the sweep marks or surface evaluation variables. A cut variation uses at most its own such variable, and phase sections use none. These restrictions ensure the index accounting in Section 8.

=== 9.3 Sampling libraries and the finite isotropy construction <sampling-libraries-and-the-finite-isotropy-construction>

For each connected graph choose one base frame. Its data consist of finitely many based holonomies and spinor values transported to that frame. Use bounded spinor samples, for example $Phi \/ \( 1 + \| Phi \|^2 \)^(1 \/ 2)$, when a global bound is needed. An output is a fixed smooth form or spinor supported in a ball, transported from the base, times a smooth bounded equivariant function of these data. The same construction gives section values and small group-valued variations by exponentiation. Include ordinary compact cutoffs in sample and parameter charts.

For a finite small-ball cover of every input graph and output region choose functions $chi_nu$ which are one on smaller balls still covering these sets. Multiply the term by

#[#set math.equation(numbering: n => "(9.3)")
 $ product_nu theta.alt_nu (integral_X chi_nu #scale(x: 120%, y: 120%)[\(] \| F_a^0 \|^2 + \| Phi \|^4 #scale(x: 120%, y: 120%)[\)] + 8 pi^2 sum_j m_j chi_nu \( x_j \)) \, $ <eq:analysis:energy-cutoff>]

where $sum_j m_j \[ x_j \]$ is the current ideal label, and each $theta.alt_nu$ is supported below a small regular-gauge threshold. Its value can be one on the smaller neighborhood being tested. The threshold is also smaller than a charge-one curvature atom. A finite ball cover can always be made sufficiently fine at a smooth field and away from specified particles. Crucially, each $chi_nu$ is confined to the component of its associated graph. Weighted atoms enter this formula additively, including at collisions.

Enumerate a dense countable library of these single-valued terms by $p_j$. Choose positive weights $w_j$ as follows. List the desired fixed-order operator bounds on bounded configuration and parameter sets, the corresponding active-graph regularity bounds on nested balls, and the exponential end bounds, as a countable list of seminorms $N_k$. Arrange

#[#set math.equation(numbering: n => "(9.4)")
 $ w_j gt.eq 2^j max \( 1 \, N_1 \( p_j \) \, dots.h \, N_j \( p_j \) \) \, #h(2em) parallel lambda parallel_(frak(P)) = sum_j w_j \| lambda_j \| . $ <eq:analysis:weights>]

For each fixed $k$ the finitely many ratios $N_k \( p_j \) \/ w_j$ with $j < k$ have a finite maximum $C_k$; for $j gt.eq k$ the ratio is at most $2^(- j)$. Thus $sum_j lambda_j p_j$ converges in every listed norm, with a bound depending on $k$, uniformly on bounded sets, and tails tend to zero there. The parameter space $frak(P)$ is a separable weighted $ell^1$ space. Taking a small ball in it makes any prescribed finite collection of equation norms as small as required. The field derivative of each term is compact from $E_a$ to $F_a$: graph evaluation and transport are of order zero, inclusion from field order $a$ to equation order $a - 1$ is compact on its compact support, and derivatives of the energy cutoffs are finite-rank scalar functionals. The tail estimates preserve compactness for the sum.

#thm([Lemma 9.4.])[
  (Finite samples and available variations).  #emph[Finite framed samples, avoiding any specified finite particle set, detect the stabilizer of a smooth field. They give arbitrary curvature and retained cut variations at type $A$, and arbitrary tangential curvature and active-line spinor variations at type $S$. With a type $P$ witness they give arbitrary full equation and retained cut variations at every non-$R$ target, using finite weighted branch lists if needed. Phase-cut values can be varied using the witness alone.]
] <lem:analysis:samples>

#proof[
  A gauge stabilizing a connection is parallel and is determined by its base value, which commutes with all based holonomies. It must also fix all transported spinor values, up to the prescribed common phase when phase is included. For $"SU" \( 2 \)$ one noncentral holonomy reduces its centralizer to a circle and two noncommuting ones reduce it to the center. Spinor values impose finite-dimensional linear eigenspace conditions. This proves finite detection; equivalently the stabilizer is the common stabilizer of finitely many matrices and vectors in these fixed finite-dimensional representations. Removing finitely many points does not change the parallel-transport criterion. Paths can be perturbed to avoid these points, retaining the finitely many strict conditions that detect the stabilizer.
  At $A$ the frame stabilizer is the center, which acts trivially on the adjoint target. At $S$ the combined frame and phase stabilizer preserves the ordered active line. Its invariant outputs are exactly diagonal curvature and spinors in that line. In a slice tube for the compact sample group an arbitrary invariant output at the center extends to an equivariant function: first choose it on the slice, average over its stabilizer, and extend by the group action. Cutoffs supported inside the tube globalize it. Outputs in arbitrarily small balls span all smooth compactly supported directions in the stated target. Separate cut coefficients give their values independently of equation outputs. The sample and parameter cutoffs may be supported away from the zero-spinor reducible locus. At a central end, choices of a parallel line create no extra parameter after unframing: its full connected parallel group acts transitively on these lines and its elements extend over the collar. The residual group is the splitting-preserving group already used for the tangential equations.
  For the mixed assertion use independent frames for the target and the witness, together with the common phase. If a parallel gauge on a $P$ field compensates a phase $z eq.not plus.minus 1$, its distinct eigenspaces are parallel lines and the spinor lies in one of them. That would be type $S$. Thus the projection of its stabilizer to phase is exactly ${ 1 \, - 1 }$. With phase so restricted an $A$ target has only its central stabilizer and an $S$ target only a finite stabilizer. The product sample group therefore has finite isotropy $H$.
  In a tube $G times_H D$, choose an output $s$ on the slice and include all translates $h dot.op s \( h^(- 1) dot.op \)$, $h in H$, each with weight $1 \/ \| H \|$. Multiply by an invariant cutoff whose support lies inside the tube. On a neighborhood of its boundary every branch is zero; extend outside by $\| H \|$ repeated zero branches. A change of slice representative permutes the list with multiplicities, so this is a well-defined weighted germ. Choose the coefficient space to contain the whole $H$-span of each chosen output space. Every branch then has the same full coefficient range at the center, giving surjectivity branch by branch. A witness alone has stabilizer acting trivially on the phase-character-two target, so arbitrary phase-section values are available there even single-valuedly. ◻
]

#thm([Proposition 9.5.])[
  (Ordinary exact-support library).  #emph[The preceding construction at zero spinor supplies the ordinary representatives and perturbations used in Sections 2 and 4. It is independent of the existence or value of the closed cap count. It permits simultaneous regularity on the countably many required lower strata and normal derivative regularization at the specified harmonic reducers while fixing their values.]
] <prop:analysis:ordinary-library>

#proof[
  At an irreducible instanton all required adjoint outputs are available by Lemma 93. Universal surjectivity follows by pairing a cokernel with arbitrary compactly supported smooth outputs away from the finitely many labelled points; these outputs are dense in $L^p$. Independent variations give the full value matrix of each retained rank test and the three holonomy-event directions. The transversality argument below applies on each position, rank, parameter, and topology stratum. It uses no nonvanishing input.
  For a specified harmonic reducer take a sample slice with its circle stabilizer singled out by noncentral data. Infinitesimal based holonomies detect a connection variation modulo infinitesimal gauge: if every loop variation is simultaneous infinitesimal conjugation, transport that infinitesimal base value along paths; the loop identity makes the result independent of the path and its covariant derivative is the given variation. A finite number of samples thus injects the finite-dimensional normal kernel. Localized output forms detect its finite-dimensional cokernel. Slice-linear equivariant variations therefore prescribe any complex-linear kernel-to-cokernel map in the normal circle representation. They vanish on the commuting slice and leave the Abelian equation unchanged. A generic arbitrarily small map makes a complex index-zero block invertible, or a complex index-one block surjective. Independent cut variations prescribe the corresponding normal cut derivative. Subsequent irreducible variations are supported off the reducible locus.
  On an ordinary cylinder use the time-independent gradient library for the equation, whose irreducible transversality is established in Section 2. For a cut based at a moving mark translate its graph with that mark. This is joint translation invariance of the marked problem; the equation still does not depend on the mark. Energy cutoffs and labelled atoms translate with it. The face and end prescriptions above make these choices agree with compact probes on the pieces and with their exponentially small extensions. The gauge group and the fixed transition identifications are those already specified, so this construction introduces neither an $"SO" \( 3 \)$ lift sum nor a new matching factor. Persistence and particle accounting are proved in Lemma 99. ◻
]

#thm([Lemma 9.6.])[
  (Independence from discarded fields).  #emph[The coupled terms can be supported so that they vanish on every tuple of fixed type. On an exact $J$ face a term involving a connected graph in an $R$ component vanishes on a neighborhood of that sample. After discarding $R$ fields, their particles, and their tests, every remaining equation and cut is a function only of the retained fields and particles and of the retained parameter variables. The same assertion holds for separated lens-cap data.]
] <lem:analysis:R-independence>

#proof[
  Support a mixed term compactly inside the finite-isotropy locus of its independent-frame sample space. In a tuple of fixed type the common phase can be compensated independently on every $S$ component, while it acts trivially on every zero-spinor component. The combined stabilizer is therefore continuous. An $R$ input or output has a continuous independent frame stabilizer even when another component contains a witness. Both types of sample are outside the closed support of the term.
  No frame is compared between the disconnected graphs. On a split face the only nonzero coupled terms consequently sample retained components. The energy cutoffs of those terms have balls on precisely those components, so the atomic summands in (9.3) contain no discarded positions. First-stage terms are single-component and already have this property. Parameter cutoffs use only allowed variables; the parameters of an $R$ component may remain in the projection, as stipulated in its dimension count. Lens-cap sampling and coupling have been disabled separately. This proves independence for the entire formula, including the scalar cutoff factors, not just for its visible output. ◻
]

=== 9.4 Differentiability and universal regularity <differentiability-and-universal-regularity>

Moving a sampling path is not a smooth operation at unchanged field regularity. We use the following precise version of the regularity argument, rather than differentiating translations indefinitely on one Banach space.

#thm([Lemma 9.7.])[
  (Compatible implicit charts).  #emph[Let $E_s = c_delta^(a + s \, alpha)$ and $F_s = c_delta^(a + s - 1 \, alpha)$, with the finite-dimensional equation, parameter, and cut variables included. For the sampling formulas above, the equation map at level $s$ is $C^1$. For every prescribed $j$ it is $C^j$ from sufficiently high field order to $F_s$. At a smooth universally surjective zero its universal solution set has $C^j$ local charts, for every prescribed finite $j$, with the same perturbation space $frak(P)$ and the same smooth finite-dimensional kernel coordinates at all levels.]
] <lem:analysis:scale>

#proof[
  The derivative of evaluation along a moving path contains one derivative of the field; transport satisfies the same assertion by differentiating its ordinary differential equation. Little-Hölder translation is continuous, so field order $a + s$ gives a continuous first derivative with target order $a + s - 1$. Additional parameter differentiations use additional field derivatives. Smooth functions, finite products, integration in (9.3), and the summability in (9.4) preserve these assertions. Metrics and bundles are compared in fixed local identifications, so their variation only changes smooth coefficients of the differential operators.
  Write the field linearization as $L_s : E_s arrow.r F_s$. It is elliptic plus a compact derivative. At a smooth solution its kernel is smooth and independent of $s$, and higher-order right-hand sides give higher-order solutions. For the graph terms this is the same elliptic bootstrap as below: their field derivatives have order zero and the cutoff derivatives are scalar functionals multiplying smooth outputs. Pick finitely many smooth perturbation directions $Q subset frak(P)$ spanning the cokernel at the lowest level. Linear regularity shows that $tilde(L)_s : E_s xor Q arrow.r F_s$ is surjective at every level and has a common smooth finite-dimensional kernel $K$. Choose a projection onto $K$ using finitely many compactly supported smooth pairings and coordinates on $Q$. Its kernels $V_s$ are compatible complements, and $tilde(L)_s : V_s arrow.r F_s$ is an isomorphism.
  Write $frak(P) = Q xor frak(P)'$ and $Z = K xor frak(P)'$. The $C^1$ implicit theorem at each level gives a graph $v_s : U_s subset Z arrow.r V_s$. On sufficiently small common domains uniqueness of the lowest-level graph makes the graphs agree. For any finite list of higher levels we may intersect their domains; thus the common graph $v$ is $C^1$ into every level needed in a given finite-order argument.
  Here is the higher-order step. In graph coordinates write $cal(F) \( v \( z \) \, z \) = 0$ and $B_s \( z \) = D_v cal(F) \( v \( z \) \, z \) : V_s arrow.r F_s$. It remains invertible near the base point. If $v$ is $C^r$ into the requisite higher levels, its differentiated equation has the form
  $ B_s \( z \) H_r \( z \) = R_r \( z \) \, #h(2em) H_r = D^r v \, $
  where $R_1 = - D_z cal(F)$, and for $r gt.eq 2$ the right-hand side uses derivatives of $v$ only up to order $r - 1$. Choose a level $t$ high enough that $cal(F) : V_t times Z arrow.r F_s$ is $C^(r + 1)$. Then $R_r$ and $B_s \|_(V_t)$ are $C^1$, while $H_r$ is continuous into $V_t$. Subtracting the equations at $z + h$ and $z$ gives
  $ B_s \( z \) #scale(x: 120%, y: 120%)[\(] H_r \( z + h \) - H_r \( z \) #scale(x: 120%, y: 120%)[\)] =  & R_r \( z + h \) - R_r \( z \)\
 & - #scale(x: 120%, y: 120%)[\(] B_s \( z + h \) - B_s \( z \) #scale(x: 120%, y: 120%)[\)] H_r \( z + h \) . $
  Apply the fixed inverse $B_s \( z \)^(- 1)$. The right-hand side has a first-order expansion with $o \( parallel h parallel \)$ remainder, using continuity of $H_r$ at level $t$. This proves differentiability into $V_s$; the same expression proves continuity of the derivative. Induction gives $C^(r + 1)$ charts at the lower level. Only finitely many higher charts are needed for any specified order. In particular this proof does not differentiate the inverse repeatedly as a same-order operator. ◻
]

To test universal surjectivity, first use the augmented linearization $W_(delta_S)^(1 \, p) arrow.r L_(delta_S)^p$ with $p > 4$ at a fixed smooth zero in the weight-$delta_H$ configuration space. The perturbation outputs span the curvature, Dirac, and cut targets, not the added gauge-adjoint target. The latter cokernel component is removed first: pairing with infinitesimal gauge variations gives the gauge Laplacian $G^(*) G$, where $G$ is the infinitesimal gauge action. A dual solution $xi$ has weight $- delta_S$. On an end the limiting gauge operator is $- partial_t^2 + Delta_gamma$. Its spectral decomposition and elliptic regularity give

$ xi \( t \) = a_e + t b_e + O \( e^(- epsilon.alt t) \) \, #h(2em) a_e \, b_e in ker Delta_gamma \, $

with exponential decay in the complementary modes. Growing normal modes are excluded by the choice of weight. Exponentially decreasing coefficient errors preserve this expansion, after decreasing $epsilon.alt$ to absorb polynomial factors. For every independently allowed cut-off parallel end constant $chi_e c$, pair the cokernel with the field variation $G \( chi_e c \)$. Gauge equivariance kills the equation and cut rows. Green’s formula for the gauge row gives

$ 0 = integral_X chevron.l xi \, G^(*) G \( chi_e c \) chevron.r = - chevron.l b_e \, c chevron.r_(L^2 \( Y_e \)) . $

Thus every $b_e$ is zero. The dual solution is bounded with decaying derivative, so a second integration by parts gives $parallel G xi parallel_2^2 = 0$. It is a global infinitesimal stabilizer and is zero on the non-$R$ slices used here. More generally the extended gauge Laplacian has kernel and cokernel $frak(s)$, and induces an isomorphism from the gauge domain modulo $frak(s)$ to $"ann" \( frak(s) \)$. This also explains the target convention specified above. The argument applies to tangential non-$R$ slices and to infinitesimal local lifts of finite branches.

Compactly supported smooth outputs away from finitely many particles are dense in its equation target. The variations in Lemma 93 consequently annihilate no nonzero cokernel in the required full or tangential target. Field evaluation on the compact paths is continuous at this level. Independent section variations give the retained finite-dimensional cut targets.

Linear elliptic regularity gives the same surjectivity at higher orders and weight $delta_H$. To justify the weight step explicitly, an $L_(delta_S)^p$ solution with right-hand side in $c_(delta_H)^(a - 1 \, alpha)$ satisfies on each sufficiently remote end the limiting spectral equation plus a small decreasing-coefficient error and the summable graph tails. The positive and negative spectral integrals improve its decay to $delta_H$, since the interval $\[ delta_S \, delta_H \]$ contains no indicial root; parallel gauge modes have just been treated by their separate end constants. The error is absorbed in the weight-$delta_H$ norm, and graph tails in (9.2) are chosen faster than $delta_H$. Interior Schauder estimates then give the asserted Hölder order. The same argument identifies the smooth kernels and the finite-dimensional cokernel quotients at both weights, including the finite extended gauge coordinates. The cokernel identification uses the range and regularity of solutions, not smooth representatives of the full adjoint cokernel: adjoints of thin samples can have path- or point-supported distribution terms. Density of smooth outputs detects those cokernels without any smoothness assertion. It does not presume that equal-weight Hölder closure embeds in weighted Sobolev space.

Equivariance makes gauge directions redundant, also on local branch lifts. Apply parametric transversality in the charts of Lemma 96; the differentiability order can always be chosen larger than both zero and the relevant Fredholm index #cite(label("Smale1965")) Theorem 1.3 and Corollary 1.5. Finite isotropy is handled on the local finite slice covers. Rank-one and rank-zero matrix strata are treated separately, with variations of the full matrices available before either restriction.

=== 9.5 Energy, regularity, and ideal limits <energy-regularity-and-ideal-limits>

#thm([Lemma 9.8.])[
  (Compactness on bodies and removable particles).  #emph[For the fixed finite family, and for perturbations in a sufficiently small bounded set of the norms above, the following statements hold uniformly, including coefficient-convergent sequences of already ideal solutions.]
  + #emph[The trace-free curvature and covariant spinor gradient are bounded in $L^2$, and the spinor is bounded in $L^4$.]
  + #emph[The measure $\| Phi \|^4 thin d "Vol"$ has no atoms in a weak limit, including a limit obtained by translating along a true cylinder. Neither does $\| F_a^(0 \, +) \|^2 thin d "Vol"$.]
  + #emph[On compact sets, a subsequence converges modulo gauge away from finitely many points. The limiting field extends across these points and solves the same equations with the ideal cutoff formula (9.3). The lost charges are positive integers, and each charge-$m$ atom has mass $8 pi^2 m$ in the stated curvature norm.]
  + #emph[On any fixed ideal stratum, if there is no further bubbling or end loss, convergence is in the completed higher-order field charts. At a new bubble there is still convergence in $C^(0 \, beta)$ on surviving exact cut paths for any fixed $beta < 1$.]
] <lem:analysis:compactness>

#proof[
  The integrated inequality of Lemma 66, combined with Proposition 68 and Chern–Weil, gives
  #[#set math.equation(numbering: n => "(9.5)")
   $ parallel F_a^0 parallel_2^2 + parallel nabla_a Phi parallel_2^2 + parallel Phi parallel_4^4 lt.eq C . $ <eq:analysis:global-energy>]
  Here the negative zeroth-order coefficients have uniformly bounded squared integral. The true collar middles have positive scalar curvature, asymptotically flat background, and exponentially small forcing; the remaining finite body, including all finite $Y$ seams, has a fixed bound. The perturbation values have bounded squared integral by construction. On completed ends first use decaying cutoffs and then pass to the limit. The integrated Dirac identity uses $parallel P_D parallel_2^2$, not a derivative of $P_D$. The curvature identity is
  $ parallel F_a^0 parallel_2^2 = 2 parallel F_a^(0 \, +) parallel_2^2 + 8 pi^2 kappa . $
  The charge bound and the positive quartic term therefore give all three terms in (9.5).
  For the nonconcentration statement take a cutoff equal to one on $B_r$ and supported in $B_(2 r)$. The local inequality gives, with harmless positive constants and uniformly bounded local geometry,
  #[#set math.equation(numbering: n => "(9.6)")
   $ c integral_(B_r) \| Phi \|^4 lt.eq C r^(- 2) integral_(B_(2 r) \\ B_r) \| Phi \|^2 + o_r \( 1 \) lt.eq C (integral_(B_(2 r) \\ B_r) \| Phi \|^4)^(1 \/ 2) + o_r \( 1 \) . $ <eq:analysis:no-atom>]
  The lower-order and bounded inhomogeneous terms tend to zero on these shrinking balls; a uniform $L^4$ bound and Hölder’s inequality give this also for a bounded coefficient times $\| Phi \|^2$. First pass to a weak measure limit at radii with zero boundary mass, then let $r$ tend to zero along such radii. The limiting annulus masses tend to zero even if there were an atom at the center. Equation (9.6) forces that atom to vanish. The same local argument applies after translation on a true cylinder. Since $F_a^(0 \, +)$ is quadratic in $Phi$ plus a bounded perturbation, its squared norm has no atom either.
  Fix a ball outside curvature concentration points. Small-energy Coulomb gauge gives a $W^(1 \, 2)$ connection form $a$ small in $L^4$ after choosing the ball and the energy threshold small enough. The spinor has $W^(1 \, 2)$ control from (9.5) and is small in $L^4$ on this ball, by the nonconcentration just proved. In these gauges the augmented first-order system for $u = \( a \, Phi \)$ is
  #[#set math.equation(numbering: n => "(9.7)")
   $ cal(D) u = C \( u \) u + b \, #h(2em) \| C \( u \) \| lt.eq C \| u \| \, $ <eq:analysis:critical-system>]
  where $b$ is uniformly bounded; bounded lower-order linear terms may be included in $cal(D)$ or $b$. For $2 < p < 4$, the critical Sobolev estimate gives on a smaller ball
  $ parallel u parallel_(W^(1 \, p)) lt.eq C_p #scale(x: 120%, y: 120%)[\(] parallel u parallel_(L^p) + parallel b parallel_(L^p) + parallel C \( u \) parallel_4 parallel u parallel_(4 p \/ \( 4 - p \)) #scale(x: 120%, y: 120%)[\)] . $
  Absorb the last term by making the $L^4$ coefficient small. For a weak field the same step is justified by a local parametrix: freeze the principal symbol on a sufficiently small chart, absorb its small variation and the $L^4$ potential, and solve at exponents $2$ and $p$. The cutoff commutator contains $u in L^4$, hence belongs to $L^p$; uniqueness of the small-potential inverse identifies the two solutions.
  Choose $p > 8 \/ 3$, so $4 p \/ \( 4 - p \) > 8$. The quadratic terms are then in an $L^q$ space with $q > 4$. A second elliptic estimate gives local boundedness and a positive Hölder exponent. Equation (9.7) now gives $W^(1 \, q)$ for every finite $q$, hence $C^(0 \, beta)$ for every fixed $beta < 1$ on smaller balls. This part of the argument needs only bounds on perturbation values, so it precedes any differentiation of their graph formulas.
  For an active graph, its cutoff balls have this regularity with uniform bounds and the graph lies in their smaller interiors. Transport and sample formulas consequently acquire their first regularity bounds. When there is no ordinary $Y$ term sampling a developing concentration point, differentiating the equations and using nested smaller radii gives the next elliptic bounds. Repeating this proves every fixed order. The diagonal choice (9.4) includes the constants at each step, so the countable sum obeys the same bounds. Transition gauges have corresponding bounds from the connection transformation equation. This gives full bounds on a no-new-bubbling stratum and smoothness of a single weak solution once it extends over the labelled points. It does not assert uniform high derivatives for an ordinary $Y$ term whose loop family passes near a new particle.
  There is one separate convergence issue for the ordinary solid-torus $Y$ terms. Thicken every transport leg, including any comparison whisker, with the transverse disk of bases; no fixed common whisker or common point is left in the family. On each leg the map from its three-dimensional path-and-disk domain to the spatial three-manifold is submersive in its interior. The preimage of a spatial particle is discrete there, so its projection to the disk is a null set; the moving endpoint maps give the same conclusion on boundary pieces. There are only finitely many legs in a term. Alternatively, for these slice-wise gradient terms, all input paths avoid a finite four-dimensional particle set at every time except its finitely many time coordinates, which already suffices for almost-everywhere spacetime convergence. On the good loops transport converges, and the bounded integrands give strong local $L^p$ convergence of the averaged perturbation values by dominated convergence. Thus the equations and local elliptic estimates give strong first-order convergence off the particles. Interpolation with the uniform higher-integrability bounds gives $C^(0 \, beta)$ convergence on compact good sets for any prescribed $beta < 1$, in particular with $beta > b$ as needed for the modified sweeps. If no new bubbling occurs, the full graph bootstrap, including these thickened-loop terms, gives convergence at every order. We require only the stated lower order convergence at a new bubble.
  Choose the concentration threshold before the graph cutoff thresholds. Every new concentration point carries at least that fixed positive amount of curvature energy. A graph meeting it has a covering cutoff which equals one there and is therefore disabled. For any other graph, weak convergence of the energy measures gives exactly the scalar cutoff limit in (9.3). This proves convergence of the limiting equations wherever they are defined; no transport or evaluation at an atom is required. The energy bound leaves only finitely many new points.
  For completeness, the limiting punctures are removable in the required perturbed problem. On a sequence of shrinking spherical annuli the limiting $L^2$ curvature tends to zero. Rescaled annular Coulomb gauges are then small in $W^(1 \, 2)$ and $L^4$; the flat annular limit is trivial since the annulus retracts to $S^3$. Cutting the connection to zero inside such an annulus costs arbitrarily small $L^2$ curvature: the cutoff derivative is controlled by the rescaled $L^4$ bound. Apply small-ball gauges to these fillings and pass weakly to obtain a $W^(1 \, 2)$ extension in an extended bundle. On the fixed outer collar the gauges give the same original connection up to a bundle identification. The spinor extends in $W^(1 \, 2)$, and point cutoffs show that the equations extend distributionally. Terms whose graphs meet the labelled atom are already off. The preceding weak bootstrap makes the extension regular. This is the local small-energy removal argument of #cite(label("Uhlenbeck1982Removable")) with the bounded inhomogeneous terms retained.
  Compare the Chern integrals of the original sequence and this extension on a surrounding sphere collar of strong $W^(1 \, p)$ convergence, with $p > 4$. Fubini’s theorem selects a boundary sphere on which a subsequence converges in tangential $W^(1 \, p)$; the Chern–Simons boundary integrals then converge. More precisely the difference of the two ball charge integrals is the degree of their determinant-one clutching map $g_j : S^3 arrow.r "SU" \( 2 \)$ plus the difference of the boundary Chern–Simons integrals in the convergent gauges. The latter tends to zero. Bounded charge bounds the integer degrees, so a subsequence has constant degree and the limiting charge difference is that integer. Since the self-dual part has no atom, Chern–Weil identifies the lost curvature mass with $8 pi^2$ times that integer. The mass is positive, so the integer is positive. Previously labelled weights simply add to new weights; collisions give the same cutoff expression because the summands $m_j chi \( x_j \)$ add. The limiting equations on every fixed position stratum are therefore smooth, particle-dependent equations of the stipulated form.
  All arguments are uniform for coefficients converging in the weighted seminorms: approximate by a finite library, use the finite convergence argument, and use the uniform tail bounds. If no further degeneration occurs, the full bootstrap and the true-end estimate below give convergence in the completed field charts. This proves the lemma. ◻
]

#thm([Lemma 9.9.])[
  (True necks and exponential completion).  #emph[Along a sequence in which genuine neck lengths tend to infinity, a subsequence has finitely many particles and nonconstant cylinder levels. Every translated cylinder level has zero spinor and is ASD. Nonconstant levels have a discrete positive charge cost. The remaining necks carry no diffuse loss and converge to matching flat states with exponential decay of all derivatives. On a no-loss stretch of length $T$ the deviation from the flat orbit is bounded by exponentially decreasing contributions from its two ends and from the prescribed forcing.]
] <lem:analysis:neck>

#proof[
  Deep translation eliminates the background splice errors and all nonstationary graph terms. The limit is an unperturbed solution on a positive-scalar-curvature cylinder with flat fixed-line background. The integrated Weitzenböck inequality with cutoffs and finite energy forces its spinor to be zero. It is therefore ASD. We first prove the small-strip estimate and completion of any one such finite-energy level, without assuming a finite extraction count.
  The flat orbits on $S^3$ and on the lens space form a finite list. For a lens this follows by diagonalizing the representation of its finite cyclic fundamental group. Their adjoint $H^1$ vanishes; one may also obtain this by averaging over the finite covering group. Positive scalar curvature kills the flat Dirac kernel. Thus their normal boundary operators have a common positive gap $beta$. On any stretch close to a flat $gamma$, put the spatial connection $a = gamma + xi$ in the slice $d_gamma^(*) xi = 0$. Use the parallel group to remove the parallel component of the temporal connection. The remaining temporal component $alpha$ is determined, on the complement of constants, by an equation of the form
  $ d_gamma^(*) d_a alpha = d_gamma^(*) #scale(x: 120%, y: 120%)[\(] Q \( xi \, Phi \) + f_(+) #scale(x: 120%, y: 120%)[\)] \, $
  where $Q$ is quadratic. Its inverse from $H^(- 1)$ to $H^1$ gives $parallel d_a alpha parallel_2 lt.eq C \( parallel Q parallel_2 + parallel f_(+) parallel_2 \)$, uniformly for small $xi$. Hence the projected nonlinear term is of order zero in the low norm. Writing $u = \( xi \, Phi \)$, the projected equation is
  #[#set math.equation(numbering: n => "(9.8)")
   $ \( partial_t + B_gamma \) u = N \( u \) + f \( t \) \, #h(2em) parallel N \( u \( t \) \) parallel_(L^2 \( Y \)) lt.eq C epsilon parallel u \( t \) parallel_(L^2 \( Y \)) . $ <eq:analysis:neck-evolution>]
  The transformed forcing $f$ has the same strip Sobolev bounds as the original forcing. The operator $B_gamma$ is the co-closed $*_3 d_gamma$ block together with the flat Dirac block; all parallel gauge constants have been separated. Higher-order tame estimates give $parallel N \( u \) parallel_(H^(k - 1) \( I \)) lt.eq C_k epsilon parallel u parallel_(H^k \( I \))$ on a fixed-size strip, with a fixed enlargement of $I$ if required. Smallness in the needed local norms follows from small-energy regularity on these genuine collars.
  Here are the norms in the decay estimate. Move the ends by less than one, absorbing these bounded collars into the end norms, so the length of the stretch is an integer $M gt.eq 6$. Put $I_j = \[ j \, j + 1 \] times Y$ and $I_j^(+) = \[ max \( 0 \, j - 2 \) \, min \( M \, j + 3 \) \] times Y$, for $0 lt.eq j < M$. Set
  $ A_j = parallel u parallel_(H^k \( I_j \)) \, #h(2em) F_j = parallel f parallel_(H^(k - 1) \( I_j^(+) \)) \, #h(2em) A_(-) = parallel u parallel_(H^k \( \[ 0 \, 3 \] times Y \)) \, quad A_(+) = parallel u parallel_(H^k \( \[ M - 3 \, M \] times Y \)) . $
  For any sufficiently small $0 < delta < beta$ one has
  #[#set math.equation(numbering: n => "(9.9)")
   $ A_j lt.eq  & C_k (e^(- delta j) A_(-) + e^(- delta \( M - 1 - j \)) A_(+))\
 & + C_k sum_(r = 0)^(M - 1) e^(- delta \| j - r \|) F_r . $ <eq:analysis:neck-decay>]
  Its constants are independent of $M$. To prove it, first propagate the positive spectral subspace of $B_gamma$ from the left and the negative subspace from the right in $L^2 \( Y \)$. The two semigroups have $L^2$ operator norm at most $e^(- beta \| t - s \|)$. Integrating over unit strips and using Cauchy–Schwarz yields, with $L_j = parallel u parallel_(L^2 \( I_j \))$, the discrete bound
  $ L_j lt.eq C (e^(- beta j) A_(-) + e^(- beta \( M - 1 - j \)) A_(+)) + C sum_r e^(- beta \| j - r \|) \( epsilon L_r + F_r \) . $
  End traces may be chosen in the first and last unit strips by Fubini, or bounded by $A_plus.minus$. The exponentially weighted sequence norm with rate $delta < beta$ bounds this convolution uniformly in $M$, so sufficiently small $epsilon$ absorbs its $L_r$ term.
  Next, the interior elliptic estimate for $partial_t + B_gamma$ on overlapping strips gives
  $ A_j lt.eq C_k (parallel u parallel_(L^2 \( I_j^(+) \)) + F_j + epsilon parallel u parallel_(H^k \( I_j^(+) \))) $
  away from the two end collars. Only a fixed number of neighboring $A_r$ enter the last norm. In the same exponentially weighted sequence norm this finite-neighbor operator is bounded uniformly in $M$; absorb it after further decreasing $epsilon$. Substituting the low-norm bound proves (9.9), with a possibly smaller $delta$. This two-stage argument uses a nonsingular $L^2$ semigroup estimate and then elliptic regularity. It does not assert a bounded $H^(k - 1) arrow.r H^k$ semigroup kernel at $t = s$. Increasing $k$ gives all required spatial and temporal derivatives.
  Now consider either tail of one finite-energy ASD cylinder level. Its unit-strip energies tend to zero. Local small-energy compactness therefore puts all sufficiently remote strips near the finite set of flat orbits. Overlapping strips and continuity force an entire tail to remain near one orbit, since distinct sufficiently small flat neighborhoods are disjoint. The slice and estimate just proved apply on arbitrary finite subintervals of that tail. Sending their remote endpoint to infinity gives exponential convergence to the flat; boundedness of its end norm follows from small-energy regularity. Only now apply the Chern–Simons identity to its completed ends. The finite flat list has discrete Chern–Simons differences modulo integer charge, and a nonconstant ASD level has positive energy. Consequently these levels have a uniformly positive charge cost. Together with the integral particle masses and (9.5), this bounds the extraction count.
  After those finitely many extractions every remaining unit strip is close to a flat orbit; a violating strip translated to the origin would produce a further level or particle. The same slice argument and (9.9) apply to each residual stretch. They keep it in one flat neighborhood and give exponential decay from its two ends, plus the exponentially weighted forcing sum.
  There is no diffuse charge in this residual stretch. In the slice neighborhood choose one lift of Chern–Simons; its difference between two slices tending to the same flat tends to zero. This is the topological charge between them. The positive local Weitzenböck estimate, or (9.9), controls the spinor and self-dual energy there. Chern–Weil then controls the remaining curvature energy. Thus no energy is missed by the discrete extractions. Exponential forcing gives exponential completion and, in a no-loss middle, exponential smallness. Comparisons by the compact residual parallel groups at the ends are allowed by our gauge convention. The forcing bounds are uniform under arbitrary simultaneous approaches to true faces by (9.2) and the product collars. The removed parallel temporal component is a pure gauge mode, so a slowly varying comparison of end constants cannot produce a residual polynomial forcing term.
  This lemma concerns isolated rational flat states. The harmonic flat-slice argument at an ordinary $S^1 times S^2$ auxiliary neck is the separate one in Section 2; no assertion about that positive-dimensional flat variety is being deduced from the spectral gap used here. ◻
]

#thm([Lemma 9.10.])[
  (Exact support and incidence budget).  #emph[At an ideal limit a basic sphere, surface, or point test persists unless a particle meets its exact basic support. In that case one may drop the test with its auxiliary evaluation variable, while retaining the particle’s incidence with that support. For every particle of weight $m$, the dimension of its permitted position plus the degrees released by all such dropped tests is at most $4 m$. The zero-evaluation sphere rules in Definition 80 hold, with different charged tests using distinct loss units.]
] <lem:analysis:incidence>

#proof[
  If no particle meets the basic sphere support, the sphere path converges in $C^(0 \, beta)$ with $beta > b$, hence in the $H^b$ topology needed in Lemma 91. The modified sweep and every surviving correction converge. A correction graph hitting an atom vanishes by (9.3); this does not invalidate the limiting section formula. Thus the test persists unless its basic sweep support itself is hit. At a $J$ face the sweep has already been segmented; the mark lies on exactly one nonidentity segment and assigns the event to that side. Identity segments are uniformly disjoint from the event and cannot be limits of its marks. Cap sections at an unhit evaluation point have the same convergence and cutoff argument. Phase sections and all other sampled cut terms converge by their cutoff formulas; at a fixed tuple phase cuts are not needed for the fixed-type exclusion.
  The position and released-degree counts are explicit. A sphere or surface hit gives at most two position parameters and releases degree two. For a possibly degenerate sphere map, retain a preimage in its compact two-dimensional parameter domain; injectivity is unnecessary for this upper bound. A fixed point gives no position parameter and releases four degrees. Two distinct cap surfaces meet transversely, so a simultaneous hit has zero position dimension and releases four degrees. There are no triple incidences, competing sphere supports, or sphere–cap incidences. An unconstrained particle has four position parameters and releases no degree. These cases give at most four for weight one; multiplicities only increase the allowed bound $4 m$. The lower-rank matrix stratum has higher codimension and cannot increase this budget.
  For a parallel field, a whole test with zero evaluation is impossible without a support hit by Lemma 91 and the absolute smallness of its variations. During segmentation the same conclusion applies when both half evaluations vanish, by Lemma 92. At the split it applies to the assigned half separately. At a lens face the whole test lies in $N$; the charge-zero extendibly central reference has the same avoidance, and the index and charge table of Proposition 76 charges any remaining permitted alternative to the stated excess. Disjoint basic sphere supports prevent one particle unit from paying for two such tests. Assign a unit to each witnessing particle on a main support, and assign the necessary excess in a tested lens cap to that cap’s single sphere. The different caps are disjoint. Near a $J$ separation each incident particle remains on the intrinsic compact support of its assigned half, so it cannot escape into the connector while carrying a second test. A particle carried into a newly separated $N$ transfers its integer weight to that cap’s excess; when its evaluation is zero the reference charge is zero, so this weight still pays for its one test. Unconstrained particles escaping to a connector carry their charge there but create no additional zero-degree support incidence. Colliding labels add their weights and never identify two charge units. These assignments, with each connector charge allocated once in the virtual decomposition, prove the distinct-unit assertion.
  In particular a main monopole particle removes six field dimensions and restores at most four through incidence and position variables. Its net penalty is at least two. The ordinary instanton loss is eight, so its corresponding penalty is at least four. ◻
]

=== 9.6 Candidate main fields and their degenerations <subsec:analysis:candidates>

The dimension argument of Section 8 will be applied to a larger class than the actual ideal limits. We keep the equations on every main component but replace the lens-cap and cylinder fields by their possible charge assignments and impose no matching across true cuts. The retained equations will give ideal compactness for these main fields; the assigned losses will bound the number of degenerations. Neither assertion will require reconstruction of the omitted fields.

A #emph[candidate] consists of completed main fields, their parameter values, weighted main particles, retained cut variables, and a discrete charge assignment. The main fields solve their equations and all retained nonphase cuts for the current perturbation data. When phase sections have been installed, we also impose those cuts. For single-valued data this is a single system of equations; after finite branch lists have been added, a candidate solves one local lift of that library. The class includes every actual ideal boundary tuple for the same data, but its omitted lens caps and matchings need not be reconstructible.

The charge and incidence data are as follows. At a $J$ connector record its additional nonnegative integer charge; at a lens record an effective cap charge in the range and congruence determined by the main flat state and its required sphere test. Retain the total charge condition. At a labelled point on a basic support allow the corresponding test and its auxiliary evaluation variable to be dropped, but retain its exact support incidence as in Lemma 99. There are finitely many assignments of a segmented test to a side at each $J$ face. At a finite switching value use the closed support charts and limiting union specified after Lemma 92; near a true $J$ face only the intrinsic half-support charts occur. Include the boundary strata of these closed parameter ranges among the finite support-stratum choices.

We first bound the candidate fields and charges. The main charges need not be nonnegative, so the total charge condition alone is not an energy bound for each piece. Apply the integrated Weitzenböck inequality on each completed main piece first, using Young’s inequality on its negative zeroth-order terms. Bounded squared costs of those terms and of the forcing give uniform bounds on $parallel Phi_i parallel_4^4$ and $parallel nabla Phi_i parallel_2^2$, independently of the charge. The curvature equation then gives $parallel F_i^(0 \, +) parallel_2^2 lt.eq B_i$. Write $kappa_i^(upright("main"))$ for the actual charge of this smooth completed main field, excluding particles and omitted end fields; this is distinct from the virtually filled $kappa_i$ of Section 8. Thus

#[#set math.equation(numbering: n => "(9.10)")
 $ kappa_i^(upright("main")) & gt.eq - frac(B_i, 4 pi^2) \, #h(2em) cal(L) lt.eq kappa^(upright("tot")) + sum_i frac(B_i, 4 pi^2) \,\
kappa_i^(upright("main")) & lt.eq kappa^(upright("tot")) + sum_(j eq.not i) frac(B_j, 4 pi^2) . $ <eq:analysis:candidate-energy-order>]

Here $kappa^(upright("tot")) = sum_i kappa_i^(upright("main")) + cal(L)$ and $cal(L) gt.eq 0$ is the omitted effective end and particle loss. Finally $parallel F_i^0 parallel_2^2 lt.eq 2 B_i + 8 pi^2 kappa_i^(upright("main"))$ gives the full curvature bound. The finitely many component and face types have uniform constants $B_i$. This argument requires only the completed main equations and the assigned nonnegative losses. It supplies the energy bound for the degeneration argument that follows.

#thm([Lemma 9.11.])[
  (Finiteness of degeneration data).  #emph[For this finite problem the degeneration data needed for candidate exclusion have finite ranges. Order the data by: deeper true faces; larger total effective end and particle loss; fewer distinct main particle locations at fixed loss; more dropped tests; and more $R$ components. Treat finite assignment, closed support-stratum, and rank choices together at each step. In a fixed finite branch library, if the single-valued coefficients converge in $frak(P)$ and the additional finite coefficients converge, every sequence of candidates has a subsequence which either converges modulo the completed field slices at the same step or limits to an earlier step or a fixed-type tuple.]
] <lem:analysis:finite-data>

#proof[
  There are finitely many true faces and flat-state assignments. The energy bound gives a uniform upper bound on all nonnegative end losses and particle weights. These charges lie in discrete sets (quarters suffice for the lens data and integers for particles and $J$ losses), so their ranges and the possible numbers of positions are finite. There are finitely many basic tests and components.
  Relative bundle sectors are also finite after inessential boundary degree relabellings. With determinant fixed and limiting flats fixed, relative $c_2$ is an integer and is bounded by Chern–Weil and the candidate curvature bound just proved. For split fields, every possible completed core has rational-homology-sphere boundary, so compactly supported two-forms detect all of its real second cohomology. A finite dual collection $beta_j$ satisfies
  $ \| chevron.l v \, \[ beta_j \] chevron.r \| lt.eq \( 2 pi \)^(- 1) parallel F_L - F_M parallel_2 parallel beta_j parallel_2 . $
  Thus the full curvature bound bounds every coordinate of the integral splitting lattice; torsion gives only finitely many further choices. The finitely many split cores and compactly supported representatives are fixed in the current metric problem. Holonomy gauges of nonzero degree only relabel the relative sectors with the same stated charge data. These observations give the asserted finite ranges.
  Apply body compactness and neck extraction. At a newly appearing cut, Lemmas 97 and 98 give the stated charge assignments. True cuts persist, and a new cut is an earlier step. A new bubble or positive cylinder level increases the total loss. An already separated lens may acquire a different main asymptote only through an extracted cylinder level. If the old state is $gamma$, the new state is $gamma'$, and the extracted ASD cylinder runs from $gamma'$ to $gamma$ with charge $e > 0$, replace its assigned cap charge by
  #[#set math.equation(numbering: n => "(9.11)")
   $ kappa'_N = kappa_N + e . $ <eq:analysis:cap-charge-transfer>]
  The Chern–Simons identity gives exactly the charge congruence for $gamma'$, with the fixed determinant transitions. The previous tested cap charge is positive. Hence the new charge is at least $1 \/ 4$ if the new state is trace, and at least one if it is central, by its respective congruence. It satisfies the same allowed range and lies at an earlier loss step. This argument needs the cylinder extracted from the main solution, not a reconstructed old cap. Several levels add their charges; a pure parallel-frame change has zero charge and does not change the flat state.
  Escape of an already labelled particle into an already separated end transfers its weight to effective end loss; if the total loss stays constant, the number of main locations decreases. Collisions also decrease that number. A surviving basic test can fail only by an exact hit, which adds a dropped test; existing hits persist by closedness of their incidence parameterizations on that face. In particular an incident particle cannot escape down a true $J$ middle: the rule has already switched there, and the assigned half test has a compact intrinsic support in its retained component. It remains incident on that half in the limit. At a newly appearing lens face the whole test lies in the separated $N$ core and is omitted from the main problem altogether; a particle incident to it transfers its integer weight to that cap charge. A decrease in the number of dropped #emph[main] tests here is harmless, since the new true face is earlier in the ordering. At an already separated end every retained main test has compact support, so only particles without such an incidence can escape down that end. Thus no missing main test is restored without justification. Earlier whiskers used during a switching homotopy are absent in the neighborhood of the true face and cannot carry an incidence for its current test. The marks cannot escape through identity segments of sphere sweeps. The $R$ condition is closed under smooth completed convergence: a normalized parallel splitting has a convergent subsequence in the compact space of base lines and remains parallel, and the spinor remains zero. A new $R$ component therefore moves earlier.
  If none of these worsenings occurs, there is no new body or end loss. The strong bootstrap and exponential completion give convergence in the same high-order field charts. Changes among $A \, S \, P$ cause no singularity in the full non-$R$ field model as long as at least one $P$ remains: the finite-isotropy construction and compatible charts of Lemmas 93 and 96 apply throughout. If the last $P$ disappears, the limit is a fixed-type tuple. Rank-one tests may limit to rank zero; cover them using full matrix-value neighborhoods and impose transversality to each rank stratum there. This avoids an unjustified compactness assertion for the open rank-one stratum alone. ◻
]

=== 9.7 The fixed stage and legitimate instanton links <the-fixed-stage-and-legitimate-instanton-links>

#thm([Proposition 9.12.])[
  (First-stage regularity).  #emph[There is an arbitrarily small single-valued, single-component choice for which type $A$ equations with all retained nonphase tests are transverse on every relevant ideal and parameter stratum, and type $S$ tangential equations are transverse. The first two conditions of Definition 80 follow. The only fixed-type tuples are a finite set of legitimate unbroken cut-down instantons, and the coupled complex Dirac operator can also be made surjective at each of them without altering the instanton equations.]
] <prop:analysis:first-stage>

#proof[
  Use the countable single-valued library with the locality and bit identifications imposed above. Lemma 93 and the universal-surjectivity argument give regularity on each $A$ equation and retained-cut problem and on each pure $S$ tangential problem. There are countably many relative topologies, coordinate charts, and finite position and rank strata. The intersection of their residual regularity sets in the arbitrarily small allowed open ball of $frak(P)$ is residual. At a true $J$ face, a component’s equations use only its retained parameters, so this assertion does not give it spurious parameter directions from another component.
  For $A$, the index after the reference fillings is $q_i$. Each assigned effective lens charge supplies the correction $delta_I$, while removal of its one parameter and degree-two test restores one, giving the penalty $delta_I - 1$. The permitted cap charge and test exclude the zero-charge central case, and all remaining lens penalties are positive by Proposition 76. A main instanton particle has net penalty at least four by Lemma 99, and an allocated positive integer $J$-trajectory charge has positive index penalty. A regular nonempty problem therefore has $q_i gt.eq 0$, strictly if any of these losses occurs.
  For $S$ retain only the pure tangential equations. The active line is ordered by its nonzero spinor. Use the sharp reference fillings of Proposition 76, whose tangential correction, including the limiting line stabilizer, is zero. The actual pure-line problem has index $d_s + p_i$, with the prescribed ideal labels adding at most $4 ell_i$ position directions when tests are ignored. Transversality implies $d_s + p_i + 4 ell_i gt.eq 0$. This is precisely the tangential bound required; it makes no assertion of full normal regularity at an arbitrary $S$ field. The incidence condition is Lemma 99.
  Apply Proposition 86, which uses only these fixed-stage bounds and the metric clamps. Every fixed tuple except an unbroken, loss-free, cut-down type $A$ field is excluded. Compactness from Lemmas 97 and 98 now makes that zero-dimensional regular instanton set compact, hence finite. This reasoning uses compactness of sequences and the already proved fixed-type bounds; it does not assume compactness of the final monopole bordism.
  At such an instanton $a$, phase equivariance forces $P_D \( a \, 0 \) = 0$, but its spinor derivative may be any complex-linear compact operator. Let $K_a$ and $C_a$ be the kernel and cokernel of its current complex Dirac operator. Finitely many transported spinor samples inject $K_a$, and finitely many localized smooth output spinors detect $C_a$. Hence their compositions give every map $K_a arrow.r C_a$. The irreducible connection has only its central gauge stabilizer; complex-linear spinor operators respect both that center and phase. They extend from its sample slice with compact cutoffs. Since $dim_(bb(C)) K_a - dim_(bb(C)) C_a = n_D^(upright("tot")) > 0$, a generic arbitrarily small such variation makes the Dirac operator surjective. The value at zero spinor remains zero and the ASD equation and its cuts are unchanged. Treat the finitely many instantons in disjoint configuration neighborhoods.
  These additional finite conditions are open. They can be combined with the preceding residual choices; alternatively make the small finite changes and then choose generically within their open surjectivity neighborhoods. Absence of the other fixed tuples persists under sufficiently small changes by ideal compactness. Existing true cuts and positive losses persist in a limit. An unbroken $R$ or $S$ sequence retains a parallel reduction and cannot tend to a legitimate irreducible instanton. The finitely many legitimate instantons have regular isolated ASD neighborhoods, and every nearby instanton lies in their union, since an outside sequence would have an excluded ideal limit. Their Dirac surjectivity is an open condition there. Consequently the finite adjustments and the subsequent generic choice preserve the fixed-type exclusion. This completes the first stage. ◻
]

Fix this ultimate first-stage choice before constructing the quadratic phase sections below. Its finitely many instantons and their surjective Dirac kernels are therefore the centers of those charts. Subsequent mixed and interior regularizing variations are identically zero in smaller fixed neighborhoods of the instanton collars. They do not move the centers or their quadratic leading sections. Thus no assertion that genericity on every ideal component stratum is open is needed: after each preliminary adjustment genericity is reselected inside the open neighborhood preserving the forbidden-tuple absence, the finite ordinary zeros, and their Dirac surjectivity; the link data are installed only after that selection is complete.

#thm([Proposition 9.13.])[
  (The instanton link and its phase degree).  #emph[Put $n_(*) = n_D^(upright("tot")) > 0$ and $eta = n_(*) - 1$. At each legitimate cut-down instanton, the normal spinor link before phase quotient is $S^(2 n_(*) - 1) \/ { plus.minus 1 }$ and its phase quotient is $bb(C P)^(n_(*) - 1)$. The phase-character-two line restricts to $cal(O) \( 2 \)$ on this projective space. The $eta$ phase sections can be chosen so that their cut-down link is regular and has signed count 
#[#set math.equation(numbering: n => "(9.12)")
 $ 2^eta thin "sign" \( a \) . $ <eq:analysis:instanton-degree>]

 There is one fixed overall boundary-orientation convention in this formula, the same for every instanton. Subsequent mixed branch terms may be kept zero near these links.]
] <prop:analysis:instanton-link>

#proof[
  The cut-down ASD and metric problem is a regular isolated point and the complex Dirac operator is onto. Its kernel $K$ has dimension $n_(*)$. The implicit theorem, with the cut marks included among the finite variables, solves the transverse field, metric, and cut coordinates in terms of the small spinor kernel. Curvature outputs are phase-invariant, so their first spinor derivative at zero is zero; Dirac outputs have phase weight one. The normal model is consequently a smooth equivariant deformation of $K$, with the gauge center identifying $psi$ and $- psi$. Equivalently write $Phi = r psi$, $parallel psi parallel = 1$, and divide the Dirac equation by $r$. At $r = 0$ it is the surjective kernel problem, and radial blow-up gives boundary $S \( K \) \/ { plus.minus 1 }$. Dividing by phase gives $bb(P) \( K \)$. Its orientation is the complex orientation multiplied by the ordinary instanton sign.
  Choose phase sections quadratic to leading order in $Phi$. Finitely many spinor samples inject the finite-dimensional space $K$, so any complex quadratic form on $K$ extends to a quadratic function of these samples. The connection sample slice makes this extension equivariant; the center acts trivially on squares. Put the support in an interior parameter chart near the instanton. Division by $r^2$ extends its section smoothly over the blow-up and gives the chosen quadratic form on the projective boundary. The freedom is independent of the other marks and of the equation perturbations.
  More explicitly, a homogeneous function $q \( z \)$ of phase weight two satisfies $q \( lambda z \) = lambda^2 q \( z \)$ and defines a section of $cal(O) \( 2 \)$ on $bb(P) \( K \)$. The center quotient does not turn this into $cal(O) \( 1 \)$: the principal bundle $S \( K \) \/ { plus.minus 1 } arrow.r bb(P) \( K \)$ has doubled Hopf transition functions when its effective circle is identified with a standard circle. Thus its associated weight-two line for the original phase has $c_1 = 2 h$. This agrees with the link calculation in #cite(label("FeehanLenessPU2II")) Lemma 3.28 and Proposition 3.29.
  For a direct regular choice, in coordinates $\[ z_0 : dots.h.c : z_(n_(*) - 1) \]$ take $z_j^2 - a_j z_0^2$, $1 lt.eq j lt.eq n_(*) - 1$, with all $a_j eq.not 0$. Every common zero has $z_0 eq.not 0$, there are exactly $2^(n_(*) - 1)$ such points, and their complex Jacobian is invertible. This also proves the intersection number $chevron.l \( 2 h \)^(n_(*) - 1) \, \[ bb(C P)^(n_(*) - 1) \] chevron.r = 2^(n_(*) - 1)$. For $n_(*) = 1$ there are no phase cuts and the same formula is one. The implicit theorem extends these boundary points to regular collars. Choose every later coupled term outside smaller neighborhoods of these finitely many collars. Where such a term is zero its repeated branches have total weight one, so no extra rational factor changes (9.12). ◻
]

=== 9.8 Mixed projections and finite exclusion <mixed-projections-and-finite-exclusion>

#thm([Lemma 9.14.])[
  (The necessary mixed projection).  #emph[For a candidate containing a $P$ field, delete the $R$ fields, their particle positions, and their tests, but retain their parameter variables. Quotient the remaining fields by their independent gauges and the common phase. This defines a Fredholm problem with finite isotropy near its candidate projections. Its dimension, before phase quotient and phase cuts, is at most 
#[#set math.equation(numbering: n => "(9.13)")
 $ sum_(i in.not R) (i_i - sum_(upright("lens ends of ") i) \( delta_(upright("sp")) - 1 \) - 2 w_i) + sum_(i in R) p_i . $ <eq:analysis:projected-dimension>]

 The phase cuts and quotient subtract $2 eta + 1$. At every such candidate projection, admissible local finite-branch variations make the universal equations and retained cuts transverse.]
] <lem:analysis:projection>

#proof[
  Lemma 95 proves that the equations factor through this projection, including every energy-cutoff atom. The $P$ witness makes its isotropy finite by Lemma 93. Particle positions satisfying a dropped sphere incidence can be parameterized by preimages in the sphere domain; a surface incidence uses its surface domain, and two surface incidences use their transverse fiber product. These are the finite-dimensional position spaces used in computing the index. Surviving test marks are retained separately. Singularities of a possibly nonimmersed sphere map do not increase that parameter-space dimension.
  The virtually filled field index is $i_i$. Removal of a lens filling costs $delta_(upright("sp"))$, while omitting its one parameter and degree-two test restores one. Its penalty is therefore the full $delta_(upright("sp")) - 1$, not merely one per lens. Every unit of main particle charge loses six field dimensions and recovers at most four through the position and incidence budget. Allocated integer connector losses lose at least as much as the bound two charged here. The discarded $R$ equations contribute no fields or cuts to the projection, only their $p_i$ remaining parameters. This proves (9.13); higher-codimension rank strata only decrease it. Finally the common phase has finite stabilizer and the $eta$ complex phase sections impose $2 eta$ real conditions.
  Full equation outputs at every retained target, full matrices at cap tests, holonomy-event values, and independent phase-section values are available by Lemma 93. The universal-surjectivity argument and Lemma 96 apply on each finite branch lift. No transversality statement on an arbitrary removed $R$ field is used. ◻
]

#thm([Proposition 9.15.])[
  (Finite exclusion of mixed candidates).  #emph[After the first-stage choices, finitely many additional local multisection terms with arbitrarily small coefficients exclude all forbidden mixed candidates. The only remaining mixed candidate types are the unbroken free part and the single trace-minimum lens-end main problem of Proposition 88. The latter is regular of dimension zero. The unbroken free problem has expected dimension one; its regularization follows the lens gluing in Section 10. The additional choices agree on paired lens exteriors and are zero near the legitimate instanton collars.]
] <prop:analysis:finite-induction>

#proof[
  The inequalities in the proof of Proposition 88, applied to (9.13), give strictly negative projected index for each forbidden candidate type. Here the numerical argument is used to compute the index, before asserting that a negative index eliminates a zero. The preceding fixed stage already excluded all unwanted fixed-type tuples. We now establish the regularity that turns these negative indices into absence.
  Use the finite ordering of Lemma 100. Suppose all earlier steps have been excluded at the current coefficients. The set needed at this step is the image under projection of the candidates of Section 9.6, with their $R$ fields still present before projection. Lemma 100 makes this image compact modulo local slices and its finite assignment choices: a sequence has a limit at this step, at an already excluded earlier step, or at an already excluded fixed tuple. It is not necessary, and is not asserted, that every zero of the loosened equations after deleting the $R$ fields belongs to a compact set.
  A forbidden candidate cannot instead converge to a legitimate clean instanton. Any existing cut or positive loss persists in the degeneration order. It cannot become the single permitted trace end either: already separated end loss cannot decrease, and a particle escaping into a newly separated lens carries at least one unit, whereas the permitted total lens charge is $1 \/ 4$. The unbroken free stratum with no degeneration is not one of the exclusion steps. These facts justify the use of the already excluded fixed locus and of protected neighborhoods of the legitimate instanton collars.
  At each point of the compact candidate image choose finitely many supported variations from Lemma 103 spanning the missing universal directions. Take a finite subcover and the finite sum $V$ of those coefficient spaces. There are only finitely many previously chosen branch lists. At each local lift include all their branch choices and all translates in the newly chosen coefficient spaces. The invariant-span prescription in Lemma 93 makes the universal map transverse for every branch separately. At zero new coefficients a new list merely repeats the old list with total weight one.
  Surjectivity persists near this compact image for sufficiently small $v in V$. Moreover every new candidate for sufficiently small $v$ has its projection in this neighborhood. Otherwise take $v_j arrow.r 0$ and candidates outside it. Compactness gives either a forbidden earlier limit or a candidate at the current step whose projection is inside the neighborhood, both contradictions. The same argument shows that absence at all completed steps is open under sufficiently small changes.
  Apply finite-dimensional parametric transversality to $V$, in the countably many projected field charts and to each local branch and rank stratum. The universal zero set is smooth by Lemma 96; the regular parameter values are residual (equivalently apply Sard–Smale to its parameter projection). At any such value, every projected negative-index zero set in the chosen neighborhood is empty. Since every candidate projects there, the current step is excluded. Choose the coefficients small enough to preserve all previous exclusions, the metric tolerances, and the protected instanton collars. There are finitely many steps, each adding finitely many terms, so the total product of branch choices is finite. This turns every negative projected index used in Proposition 88 into absence, proving its exclusions. Regularity of the remaining strata is a separate step.
  For the single trace-end main problem, use the same construction to obtain regularity instead of emptiness. Its compact candidate set is isolated from forbidden corners by what was just proved. It has a single type $P$ main component; its effective sample action permits ordinary single-valued variations. Choose these simultaneously on the paired lens exteriors, using their exact tensor identification. Its expected dimension is zero.
  All additions use the corner and bit-flip extension prescriptions, so the required exterior equalities are preserved. This completes the forbidden-candidate exclusion and trace-main regularization. ◻
]

#thm([Lemma 9.16.])[
  (The weighted boundary rule).  #emph[A compact oriented one-dimensional zero set built from the finite branch lists above in the surviving free stratum has total weighted oriented boundary zero. Its weights are rational, and a region on which every additional branch term is zero has the weight of the original single-valued problem.]
] <lem:analysis:stokes>

#proof[
  In this application the unbroken stratum has one $P$ component. After quotienting the ineffective diagonal center, its gauge and phase action is free. Thus its local base charts are ordinary manifold charts; no additional effective-orbifold integration factor is being omitted. In a sample slice tube every $H$ translate has weight $1 \/ \| H \|$. Changing the slice lift permutes these translates and preserves their multiplicities. To check orientations, choose the finite samples to detect the exact combined stabilizer at the central candidate. The $P$ witness restricts phase to ${ plus.minus 1 }$. A nonzero-spinor target with such a phase has scalar parallel gauge $plus.minus 1$: in $"SU" \( 2 \)$ an eigenvalue $plus.minus 1$ forces both eigenvalues to be that scalar. An $A$ target already has only central gauges. Thus $H$ is a subgroup of a product of central groups ${ plus.minus 1 }$, with the common phase, modulo its ineffective kernel. Nearby tube stabilizers are conjugate to subgroups of $H$ and are still central. They act trivially on the real adjoint, parameter, and cut directions and complex-linearly by signs on the spinor blocks. Deform the linearization equivariantly to its real ASD part and complex Dirac part. These actions preserve the determinant orientation there, and hence preserve it throughout the deformation. Each cutoff is zero on a neighborhood of the tube boundary, so extension by repeated zeros creates no boundary of a branch zero set. Finite products have product weights, and the sum of their weights is one. Consequently the weighted oriented germs agree on chart overlaps, even where branches coincide or separate.
  Choose a partition of unity on a finite cover of a compact remainder and apply the one-dimensional Stokes formula on each oriented local lift with its weight. Terms involving derivatives of the partition sum to zero because the weighted germs agree. The remaining terms are exactly the weighted boundary points. This proves their total is zero. At a zero perturbation all repeated branches represent the same germ and their total weight is one, proving the final assertion. ◻
]

== 10 Regular lens ends and the final boundary count <sec:gluing>

Fix the finite stack, its determinant transitions, its metrics, and the small perturbations obtained from Propositions 101 and 104. These choices exclude the forbidden fixed and mixed candidates and make the trace-main problems regular. We construct their lens collars before completing the regularization of the unbroken free stratum.

All artificial isolations and all surgery seams have finite length. Only the primary three-sphere cuts and the lens cuts are boundary faces of the parameter space. The only end types left by the exclusions are the legitimate unbroken instantons and a single separated minimal trace cap with a free main component. The latter limits have no particles, cylinder losses, additional true cuts, or corners. The instanton collars are supplied by Proposition 102; we now construct and exhaust the remaining lens collars.

=== 10.1 The framed minimal cap <the-framed-minimal-cap>

Let $N$ be the cylindrical completion of the disk bundle of Euler number $- 4$, with zero section $S$, and fix a representative $gamma$ of the trace-zero limiting flat connection. Its determinant-one parallel group is

$ H = { "diag" \( e^(i theta) \, e^(- i theta) \) : theta in bb(R) } tilde.equiv "U" \( 1 \) . $

The cap $N$ has exactly one matching end. On $N$, #emph[framed] means quotienting by gauge transformations tending to the identity at this fixed representative. Thus $H$ still acts on the framed configuration space. On the main component we instead allow parallel limiting gauge transformations. The determinant connections and all identifications in this distinction are fixed.

#thm([Proposition 10.1.])[
  (Regular minimal cap).  #emph[At each of finitely many regular isolated main-component limits on a trace face, the cap data can be chosen arbitrarily small, compatibly with the preceding exclusions, so that the following statements hold. The framed cap problem of charge $1 \/ 4$, with its sphere-sweep mark and the normalized holonomy condition $- 1$, is a finite set of regular points. Every point is a crossing on the unique harmonic Abelian connection with ordered summand difference $v \( S \) = 2$. These points are fixed by $H$, and their oriented sum has absolute value one. The spinor is zero, and the coupled Dirac operator is invertible at each point. The choices for the two determinant lifts are related by the prescribed cap tensor operation.]
] <prop:gluing:regular-cap>

#proof[
  The boundary eigenline of the ordered splitting is prescribed by its degree modulo four. With that eigenline fixed, the Abelian ASD extension is unique: the harmonic curvature is determined by the relative class, the difference between two such connections is a closed one-form modulo gauge, and $H^1 \( N \; bb(R) \) = 0$. The vanishing of $b^(+) \( N \)$ gives surjectivity of its tangential ASD deformation problem. A different parallel boundary identification is absorbed by the parallel stabilizer of this same connection. In particular, the two eigenlines are not an extra pair of framed cap solutions.
  Corollary 78 gives the following dimensions before the sweep cut: the tangential framed ASD part has real index zero, the normal ASD part has complex index one, and the coupled Dirac part has complex index zero. Positive scalar curvature and the specified ASD fixed-line curvature kill the Dirac kernel; its index then kills its cokernel. The same Weitzenböck argument kills every cap spinor for the allowed small curvature perturbations. There is no Dirac forcing on the separated cap.
  We explain why the two remaining normal regularity requirements can be imposed by the allowed perturbations. Write $T$ for the complex normal ASD operator at the reducer. Its kernel and cokernel are finite-dimensional complex representations of $H$, all with the off-diagonal character. Derivatives of based holonomies detect $ker T$ modulo infinitesimal gauge. Indeed, suppose a deformation has on every based loop only the derivative produced by the same infinitesimal conjugation. Subtract that conjugation and compare parallel transport from the base point along paths. Independence of the path, which follows from the vanishing loop derivatives, defines an infinitesimal gauge transformation producing the deformation. Its off-diagonal part tends to zero on the end, since $gamma$ has no off-diagonal parallel section. It is therefore a framed gauge direction. Consequently the holonomy derivatives separate the normal kernel. Finitely many suffice: successively reduce their common kernel, whose dimension is finite.
  Include a noncentral holonomy in this finite sample to fix the torus. In a slice for the sample orbit, a torus-equivariant linear function of the normal sample coordinates, followed by a localized off-diagonal two-form output, vanishes on commuting data and has the prescribed normal derivative. Multiplication by an invariant cutoff extends it to an allowed perturbation. Smooth compactly supported outputs detect every nonzero cokernel element, so finitely many outputs suffice as well. These constructions realize all complex linear maps from $ker T$ to $"coker" T$.
  For completeness, split domain and range into kernel, cokernel, and complements on which $T$ is invertible. The Schur complement of a small perturbation is a finite-dimensional map $ker T arrow.r "coker" T$. Surjective such maps are dense because $dim_(bb(C)) ker T - dim_(bb(C)) "coker" T = 1$. The preceding perturbations supply all their first derivatives. We may thus make $T$ surjective by an arbitrarily small perturbation whose value on the reducer remains zero. Its kernel is now a complex line.
  In the determinant-root normalization the reducer’s sphere sweep is a loop in $H$. The eigenline has degree $v \( S \) \/ 2 = 1$, so the sweep has winding $1$ or $- 1$, according to its fixed orientation. Perturb its toral component slightly, relative to the collapsed ends, so that its crossings of $- 1$ are transverse. Their signed sum is this winding. At a crossing, left translation identifies the target tangent space with
  $ T_(- 1) "SU" \( 2 \) = bb(R) tau xor bb(C)_(upright("off")) \, $
  where $tau$ generates the diagonal Lie algebra. The sweep-mark derivative is nonzero in $bb(R) tau$. On the complex normal kernel, the off-diagonal cut derivative is $H$-equivariant and hence complex linear. The same finite sample construction, now with output in the cut target, varies this map arbitrarily. Choose it nonzero at every crossing. Equation and cut variations are independent, so this does not undo surjectivity of $T$. The combined cut derivative on the kernel and mark is therefore an isomorphism
  #[#set math.equation(numbering: n => "(10.1)")
   $ ker T xor bb(R) med arrow.r med bb(C)_(upright("off")) xor bb(R) tau . $ <eq:gluing:cap-cut>]
  Its complex factor preserves orientation, leaving precisely the toral crossing sign. The framed dimension calculation here is
  #[#set math.equation(numbering: n => "(10.2)")
   $ 2 + 1 - 3 = 0 . $ <eq:gluing:cap-dimension>]
  This is different from the ordinary interval calculation $1 + 1 + 1 - 3 = 0$: the latter uses the unframed index of $W'$, an interval parameter, and a sweep mark. No interval parameter is being added to the fixed framed cap in (10.2).
  It remains to exclude additional cap points. Near every reducer crossing, (10.1) and the implicit function theorem give a unique framed solution for the fixed tangential data. It is the reducer crossing just constructed. Away from the reducers, ordinary sample variations give full equation and cut transversality. The residual $H$-orbit of a framed irreducible has positive dimension, whereas its regular framed cut-down space would have dimension zero. Thus no such irreducible point can remain. Equivalently, the irreducible quotient by $H$ has negative expected dimension and the same local variations make its universal problem transverse. There is no compactness boundary in this argument: a particle costs an integer charge; a nonconstant lens-cylinder loss at total charge $1 \/ 4$ leaves a flat cap, which misses the sphere cut. These facts follow from Lemma 77 and the compactness of Lemma 97. After the regular neighborhoods of the reducer crossings are fixed, the remaining candidate set is compact, so finitely many ordinary perturbation neighborhoods suffice. The oriented sum of all points is therefore the winding sum.
  There are only finitely many relevant main limits and finitely many local branches there. Cap adjustments can be supported in their tangential parameter neighborhoods, away from the other true faces, and copied to the flipped cap by tensoring. They can also avoid the legitimate instanton charts. The established forbidden-stratum exclusions persist under sufficiently small such adjustments. To see the required openness, a sequence of newly appearing forbidden zeros would have an ideal limit by Lemma 97. Further breaks and losses remain forbidden. A fixed-type tuple has a fixed-type limit; an unbroken reducible or active-line configuration cannot converge smoothly to a legitimate irreducible zero-spinor instanton because its parallel reduction persists. These alternatives are exactly the closed degenerations treated in Proposition 104. This proves the compatibility asserted in the proposition. ◻
]

=== 10.2 The augmented operators at a matching pair <the-augmented-operators-at-a-matching-pair>

Fix a main solution $u_M$ and a cap crossing $u_N$ as above, in a single local branch. All remaining metric parameters, cut marks, and cap evaluation variables are included in the constrained operators. The neck length itself is held fixed during this linearization. Fix the effective phase on the main component by the argument of a nonvanishing local sample function of original phase character two. Such a function exists at a free main solution. Its differential is an isomorphism on the effective phase direction.

Let $G$ denote infinitesimal determinant-one gauge action and augment the equation-and-cut derivative by $G^(*)$. Use sufficiently high little-Hölder completions; the field target has one less derivative than the field domain. On an end with coordinate $s gt.eq 0$, a positive weight means that $e^(delta s)$ times the field is in the unweighted space. The number $delta > 0$ is less than the absolute value of every nonzero eigenvalue of the boundary operator. At the trace flat the only zero mode of the augmented connection operator is the temporal one-form $tau thin d s$. The adjoint spatial first cohomology vanishes, the off-diagonal flat has no parallel sections, and the boundary Dirac is invertible.

#thm([Lemma 10.2.])[
  (The scalar obstruction and the weight change).  #emph[After fixing phase as above, the positive-weight main augmented constrained operator $L_M^(+)$ is an isomorphism. On the cap the positive-weight augmented constrained operator $L_N^(+)$ has zero kernel and has precisely the one-dimensional cokernel 
#[#set math.equation(numbering: n => "(10.3)")
 $ ell \( f \) = integral_N chevron.l tau \, f_(upright("gauge")) chevron.r . $ <eq:gluing:scalar-cokernel>]

 Here $f_(upright("gauge"))$ is its $G^(*)$-component and $tau$ is the parallel diagonal gauge generator on the cap. Changing the cap field weight from $+ delta$ to $- delta$ gives an isomorphism $L_N^(-)$.]
] <lem:gluing:blocks>

#proof[
  On the main completion gauge transformations may tend to parallel constants. Analytically their infinitesimal domain includes cutoff extensions of these constants, in addition to decaying sections. This extension is essential. The gauge Laplacian satisfies
  $ chevron.l G^(*) G xi \, xi chevron.r = parallel d_a xi parallel_2^2 + parallel xi Phi parallel_2^2 . $
  The boundary term is zero for an extended constant with decaying derivative. A vector in its kernel is parallel and annihilates the nonzero main spinor, and is consequently zero. In the complementary weight, a homogeneous cokernel representative can have a constant or linear parallel asymptote. Pairing with the cutoff parallel constants in the extended gauge domain forces the linear coefficient, namely its boundary flux, to vanish. The remaining bounded representative satisfies the same integrated identity and is zero. One can also obtain this directly on the cylindrical constant mode by solving the scalar second-order equation with a free limiting constant; the nonconstant boundary modes have the spectral gap. Thus $G^(*) G$, on the extended gauge domain, is invertible.
  It follows that the gauge augmentation gives a genuine slice for unframed fields. The main cut-down problem, with phase fixed, is regular and isolated. Its equation-and-cut derivative on that slice is therefore an isomorphism. Combining it with the gauge inverse proves the assertion for $L_M^(+)$.
  On the reducer cap, write $A_N$ for the reference connection. The parallel gauge $tau$ acts trivially on its field. For a variation $v = \( a \, psi \, nu \)$, including its mark $nu$, integration by parts gives
  $ ell \( L_N^(+) v \) = integral_N chevron.l tau \, d_(A_N)^(*) a chevron.r = 0 $
  for decaying variations; the spinor is zero. The scalar gauge equation consequently has the compatibility condition (10.3). There is no other one. Indeed, the cap gauge Laplacian $Q = G^(*) G$ on decaying gauge parameters has zero kernel by integration. In its complementary weight, an adjoint homogeneous solution has a constant or linear parallel asymptote; the other modes have the boundary spectral gap. On this one-ended cap, integration against the global parallel $tau$ forces the linear flux to vanish. Integrating the resulting bounded solution against itself shows that it is parallel. Thus the adjoint kernel is exactly $bb(R) tau$, and $"im" Q$ consists exactly of scalar targets of integral zero.
  Given equation-and-cut target $y$, framed regularity from (10.1) and the invertible Dirac supply a field and mark variation $u$ realizing $y$. For any scalar target $f_(upright("gauge"))$ with integral pairing zero against $tau$, solve
  $ Q xi = f_(upright("gauge")) - G^(*) u $
  in decaying cap gauges. Adding $G xi$ corrects the scalar row and leaves the equation-and-cut target unchanged, by equivariance at the solution. Conversely a zero of the augmented operator is a framed gauge direction by constrained regularity, and then $Q xi = 0$ makes it zero. This gives zero kernel and full range in $ker ell$. Thus $"ind" L_N^(+) = - 1$ with the full scalar target used here.
  Only the eigenvalue zero is crossed in changing the weight. Its multiplicity is one, so $"ind" L_N^(-) = 0$. A vector in the kernel of $L_N^(-)$ has an expansion
  $ a = c tau thin d s + a_0 \, #h(2em) a_0 = O \( e^(- epsilon.alt s) \) \, quad epsilon.alt > delta \, $
  with the same decay for derivatives and with decaying spinor; the remaining finite-dimensional variables are the cap mark variables. This expansion follows by the spectral decomposition on the end, or by integrating each mode of the cylindrical operator. Pair its gauge equation with $tau$ on the truncation $N_R$. Since $tau$ is parallel, Green’s formula gives
  $ 0 = integral_(N_R) chevron.l tau \, d_(A_N)^(*) a chevron.r = - integral_(partial N_R) chevron.l tau \, a \( nu \) chevron.r . $
  Letting $R$ tend to infinity forces $c thin parallel tau parallel_(L^2 \( partial N \))^2 = 0$. The vector hence lies in the positive-weight domain and is zero by the preceding kernel assertion. Index zero now proves surjectivity and the asserted inverse. ◻
]

Main parameters can also change the cap equations. This does not make the separated operator diagonal automatically. The next observation records the needed change of variables.

#thm([Lemma 10.3.])[
  (Eliminating shared parameter derivatives).  #emph[Let $p$ denote the main parameter and auxiliary-variable directions which also occur in the cap equations or cap cut. Locally the limiting representative $gamma$, collar gauges, and link metric can be kept fixed. In these choices, the limiting coupled derivative can be reduced to $L_M^(+) xor L_N^(-)$ by a triangular change of variables. The field part of its cap correction to $p$ decays exponentially.]
] <lem:gluing:triangular>

#proof[
  Write $B_N p$ for the derivative of the cap equation and cut in these directions. The augmentation is defined at the reference field and does not vary with $p$; thus $\( B_N p \)_(upright("gauge")) = 0$. Moreover these variations do not change the limiting flat, so their other components decay. By (10.3), $ell \( B_N p \) = 0$. Lemma 107 therefore gives a unique positive-weight correction
  #[#set math.equation(numbering: n => "(10.4)")
   $ K p = - \( L_N^(+) \)_(ker ell)^(- 1) B_N p . $ <eq:gluing:parameter-correction>]
  In this formula the inverse means the inverse from $ker ell$ to the cap domain, including its mark variable. Substituting $v_N = w_N + K p$ changes the cap row $L_N v_N + B_N p$ into $L_N w_N$. The main row is unchanged, giving the triangular elimination. Elliptic regularity and the boundary gap give exponential decay of the field component of $K p$, with derivatives, at some rate $beta > 0$ independent of a subsequent choice of smaller $delta$. This uses the fixed boundary spectral gap and the compact support or prescribed rapid decay of $B_N p$. The mark component is an ordinary finite-dimensional correction on the cap core. All these statements are uniform on the finite set of main limits and local branches under consideration. ◻
]

=== 10.3 A finite-length inverse and the nonlinear gluing map <a-finite-length-inverse-and-the-nonlinear-gluing-map>

#thm([Proposition 10.4.])[
  (Regular gluing and exhaustion).  #emph[For every matching pair $\( u_M \, u_N \)$ above and every sufficiently large finite lens-neck length $D$, there is exactly one nearby unbroken zero in a fixed local branch, modulo determinant-one gauge and effective phase. These zeros depend continuously, and smoothly in finite-order solution charts, on $D$. Every sequence of unbroken zeros converging to this pair belongs to this collar for all sufficiently large lengths. The construction preserves the finite branch lists, their multiplicities, and their weights.]
] <prop:gluing:collar>

#proof[
  Use an oriented cylinder $\[ 0 \, D \] times partial N$, with coordinate $t$ increasing from the main body to the cap body. Cut off the exponentially decaying tails of $u_M$ and $u_N$ near the middle and splice through $gamma$. Perform the same extensions for all equation perturbations and cut representatives. Lemma 98 and the prescribed perturbation tails give a preglued field $u_D^0$ with residual, including the cuts,
  #[#set math.equation(numbering: n => "(10.5)")
   $ parallel cal(F)_D \( 0 \) parallel lt.eq C e^(- b D) $ <eq:gluing:residual>]
  for some $b > 0$, after decreasing $b$ to absorb fixed polynomial factors. Here $cal(F)_D$ is the augmented, phase-fixed local equation in field and finite-dimensional variables centered at $u_D^0$. The preglued fields have uniform bounds of every fixed local differentiability order. The perturbation library was chosen with summable bounds at each such order.
  #emph[Linear estimate.] Choose $delta > 0$ below the boundary gap and as small as needed below. On the neck use the weight $w_D \( t \) = e^(delta t)$, smoothly continued as $1$ on the main core and $e^(delta D)$ on the cap core. The cap’s own mark variables and cut targets are scaled by $e^(delta D)$ as well. The main variables are not scaled. Viewed from the cap with outward coordinate $s = D - t$, the relative weight is $e^(- delta s)$; viewed from the main side it is $e^(delta t)$. The limiting operators in these norms are therefore exactly $L_M^(+)$ and $L_N^(-)$. Figure 6 shows the two outward coordinates and their induced weights.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2, 1.05), fill: rgb("#f2f2ff"), stroke: (thickness: 0.4pt), radius: 2pt)
  rect((8, 0), (10, 1.05), fill: rgb("#f2f2ff"), stroke: (thickness: 0.4pt), radius: 2pt)
  line((2, 0.2), (8, 0.2), (2, 0.85), (8, 0.85), stroke: (thickness: 0.4pt))
  content((1, 0.55), [#text(size: 9pt)[main core]])
  content((9, 0.55), [#text(size: 9pt)[cap core]])
  content((5, 0.55), [#text(size: 9pt)[$w_D(t)=e^( delta t)$]])
  line((2.2, 1.4), (7.8, 1.4), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  content((5, 1.4), [#text(size: 9pt)[$t$]], anchor: "south")
  content((2, 1.4), [#text(size: 9pt)[$0$]], anchor: "south")
  content((8, 1.4), [#text(size: 9pt)[$D$]], anchor: "south")
  line((7.8, -0.35), (2.2, -0.35), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  content((5, -0.35), [#text(size: 9pt)[$s=D-t$]], anchor: "north")
  content((1, -0.15), [#text(size: 9pt)[$w_D=1$#linebreak()$L_M^+$]], anchor: "north")
  content((9, -0.15), [#text(size: 9pt)[$w_D=e^( delta D)$#linebreak()$L_N^-$]], anchor: "north")
  content((5, -1.05), [#text(size: 9pt)[cap-relative weight: $e^(- delta D)w_D=e^(- delta s)$]], anchor: "north")
})],
    caption: [Figure 6: The asymmetric weight on a finite lens neck. Measured from the main core it induces the positive completion weight; after dividing by the cap-core factor $e^(delta D)$ it induces the negative completion weight in the cap’s outward coordinate. The cap mark and cut target carry the same cap-core factor. ],
  ) <fig:gluing:weight>
  First transplant the triangular change of Lemma 108, cutting off $K p$ on the long cylinder. Its cutoff error is exponentially small, even with the displayed weight, when $delta$ is small compared with its decay rate. Write $tilde(L)_D$ for the resulting derivative. There is a constant $C_delta$, independent of large $D$, such that
  #[#set math.equation(numbering: n => "(10.6)")
   $ parallel v parallel_(X_(D \, delta)) lt.eq C_delta parallel tilde(L)_D v parallel_(Y_(D \, delta)) . $ <eq:gluing:weighted-inverse>]
  Here one may use the supremum of weighted local Hölder norms on unit strips, with the usual norms on the compact cores and on the finite-dimensional variables. These are Banach norms on the finite cylinder and give the same elliptic Fredholm problem.
  We give an estimate proof to account for possible concentration in the middle. After conjugating by $w_D$, the model there is $partial_t + B - delta$, with $B$ the self-adjoint augmented boundary operator. For every spectral value $lambda$ its scalar inverse on the full line integrates toward $+ oo$ when $lambda - delta < 0$ and toward $- oo$ when $lambda - delta > 0$. The respective kernels decay as $e^(- \| lambda - delta \| \| t - s \|)$. Since $"dist" \( delta \, "spec" B \) > 0$, spectral summation and local elliptic estimates give a bounded full-cylinder inverse, also on the uniformly local norms just specified. In particular, this estimate includes the parallel scalar mode $lambda = 0$.
  Cover the glued manifold by the main completion model, the cap completion model, and this cylindrical model. Take cutoff functions with transitions of a fixed, large width $R$, constant on the compact cores and cut supports. Apply the two inverse estimates of Lemma 107 and the cylinder estimate to these cutoffs of $v$. The commutators are at most $C_delta R^(- 1) parallel v parallel$, in the corresponding one-order-lower norm. Coefficient errors at the far ends tend to zero as $R$ increases; errors from the actual splicing tend to zero as $D$ increases. The compact graph terms have no unaccounted interaction between the patches: terms supported on a body have its cutoff equal to one, and tails or terms reaching the deep cylinder have arbitrarily small exponentially weighted operator bounds. The same tail bounds control the finite-dimensional parameter forcing outside its body’s cutoff. Shared parameter terms have already been removed by (10.4). Choose $R$ to absorb the commutators and end errors, and then choose $D$ large to absorb the remaining errors. This proves (10.6). It also explains why merely discarding the zero boundary eigenvalue would give an incorrect estimate.
  The unbroken constrained family has index one after fixing effective phase. Fixing the lens-neck length $D$ removes one parameter, so the finite-length constrained problem has index zero. Thus (10.6) implies that its derivative is invertible. Undoing the weight and the triangular change gives an inverse $Q_D$ in the original norms with
  #[#set math.equation(numbering: n => "(10.7)")
   $ parallel Q_D parallel lt.eq C e^(a delta D) $ <eq:gluing:inverse-loss>]
  for a fixed constant $a$. A fixed polynomial in $D$ can be absorbed by increasing $a$, for every fixed $delta > 0$. No bound independent of $D$ in the original symmetric norms is being asserted.
  #emph[Nonlinear estimate.] Set $L_D = D cal(F)_D \( 0 \)$ and $R_D \( v \) = cal(F)_D \( v \) - cal(F)_D \( 0 \) - L_D v$. In a small ball of radius $r$ in the original field and variable norms,
  #[#set math.equation(numbering: n => "(10.8)")
   $ parallel R_D \( v \) - R_D \( v' \) parallel lt.eq C e^(a' delta D) r thin parallel v - v' parallel . $ <eq:gluing:nonlinear>]
  The local quadratic field terms have this estimate by multiplication in the chosen high-order spaces. We spell out its moving-path point because arbitrary same-order smoothness of translation is not needed. If $T_p$ denotes pullback along a smooth family of paths or local transports, then with one derivative lost,
  $ parallel \( T_p - T_0 \) h parallel_(k - 1 \, alpha) lt.eq C \| p \| thin parallel h parallel_(k \, alpha) . $
  For the parameter derivative, subtract its value at the smooth base field $u_D^0$ by first replacing the field by $u_D^0$ and then replacing $p$ by zero. The first difference is bounded by $C parallel u - u_D^0 parallel_(k \, alpha)$; the second is bounded by $C \| p \| parallel u_D^0 parallel_(k + 1 \, alpha)$. Only the base field needs the extra derivative. Differentiating the transport ordinary differential equation gives these same bounds for holonomies. Products, smooth functions of finitely many samples, localized outputs, and the energy-cutoff scalars preserve them. Consequently the derivative of the entire graph formula differs from its derivative at the smooth preglued base by at most $C r$. Integration on the segment from $v$ to $v'$ gives (10.8). Little-Hölder completions justify this first-derivative calculation; the compatible higher-order solution charts are those of Lemma 96. The prescribed summable library bounds and the rescaling introduce at most the exponential factor written in (10.8).
  Choose $delta$ so small that $\( 2 a + a' \) delta < b \/ 2$. Put $r_D = 2 C^2 e^(- \( b - a delta \) D)$, enlarging its fixed coefficient if necessary. Equations (10.5)–(10.8) show that
  $ v mapsto - Q_D #scale(x: 120%, y: 120%)[\(] cal(F)_D \( 0 \) + R_D \( v \) #scale(x: 120%, y: 120%)[\)] $
  maps the radius-$r_D$ ball into itself and has Lipschitz constant less than $1 \/ 2$ for all large $D$. It therefore has a unique fixed point. The same estimates give uniqueness on any ball of radius $e^(- c D)$ for which $\( a + a' \) delta < c < b - a delta$; the inverse-scaled pregluing residual $Q_D cal(F)_D \( 0 \)$ then fits in that ball. Dependence on finite $D$ follows by the parameterized implicit theorem, with elliptic regularity giving the compatible smooth solution charts.
  #emph[Exhaustion.] Let exact unbroken zeros tend to the specified matching pair while $D arrow.r oo$. There is no loss in their necks. By Lemma 98, gauges on their two halves can be chosen in which the deviation from $gamma$ and all its derivatives decay exponentially from the two bodies. Flattening each half near the middle then gives fields on the completed main and cap pieces with exponentially small residuals. Initially they are $o \( 1 \)$-close to $u_M$ and $u_N$ in small positive decay weights: on any fixed core this is convergence to the limit, and the uniform exponential tail estimate controls the complementary ends in any smaller weight.
  Put these flattened fields in the fixed completed gauge slices before applying the augmented estimates. The completed main gauge inverse and phase-fixing function give its slice; on the cap the scalar gauge error has integral zero and the decaying gauge inverse onto that range gives the framed slice. These are fixed-piece slice maps with constants independent of $D$. Their gauge and phase rows now vanish exactly. Equivariance preserves the exponentially small equation-and-cut residuals.
  The inverse estimate for $L_M^(+)$, followed by absorption of the local nonlinear remainder, improves the main field and its parameter differences from $o \( 1 \)$ to $O \( e^(- b_1 D) \)$ for some $b_1 > 0$. On the cap, $L_N^(+)$ is injective with closed range, so it has the corresponding estimate on its domain even for a residual not known beforehand to satisfy $ell = 0$. Apply this estimate to the cap difference after subtracting $K p$; the already controlled parameter difference and the flattening error are exponentially small. A second absorption therefore gives the same exponential improvement on the cap. Shrink $b_1$ if needed to include all cutoff errors.
  The half gauges may differ by an element of $H$. The cap reducer is fixed by $H$, so that mismatch is absorbed on the cap without changing the matching point. Splicing the half gauges makes the global difference exponentially small. Passing to the global gauge slice costs at most a polynomial in $D$. Here is a direct bound: on a fixed main-core ball the limiting spinor has positive norm bounded away from zero, and the gauge-action norm there controls the norm of a Lie-algebra element. Kato’s inequality and the one-dimensional Poincaré inequality along the tube give
  $ parallel xi parallel_2^2 lt.eq C \( 1 + D \)^2 #scale(x: 120%, y: 120%)[\(] parallel d_a xi parallel_2^2 + parallel xi Phi parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  Local elliptic estimates upgrade this bound for the inverse of $G^(*) G$ to the required field orders. The small nonlinear slice correction has the same polynomial loss, which exponential closeness absorbs. Hence the exact zeros lie in an $O \( e^(- b_2 D) \)$-neighborhood of the pregluing for some $b_2 > 0$. The fixed-piece half estimates give this positive rate before the final small weight is selected. Choose $delta$ small enough and then choose $c$ so that
  $ \( a + a' \) delta < c < min { b - a delta \, b_2 } . $
  The uniqueness ball of radius $e^(- c D)$ contains both the constructed solution and all these exact zeros for large $D$. They must therefore be the same zeros. This proves exhaustion, not just existence of a gluing map.
  #emph[Branches and matching multiplicity.] The cap crossing is fixed by $H$. If both pieces are framed, the diagonal $H$ quotient identifies every matching rotation with the same pair. If the main piece is unframed from the outset, this is exactly the same quotient. There is one glued zero per cap crossing; no $H$-volume, eigenline choice, or extra factor of two is introduced. The effective phase was fixed on the main piece, and the zero-spinor cap adds no phase parameter.
  Each finite multisection is, in a local sample slice, a finite list with multiplicities and weights. At the separated pair the active graph data belong to the appropriate parts. A graph which would compare frames across the true cut is absent there; its finite-length tail is either zero or exponentially small. Thus on each local branch the limiting equations are precisely the matching branch equations used above. The contraction construction applies to each member of this finite list, with the same thresholds after taking a maximum. It commutes with permutations of local lifts, and repeated branches keep their multiplicities. Accordingly it pulls the matching list back to the list of unbroken zeros with exactly the original weights. No new choice of branches, or averaging over matching rotations, is made during gluing. ◻
]

=== 10.4 Completion of the compatible regularization <subsec:gluing:completion>

The lens collars constructed above complete the local description of all permitted ends. We can now regularize the remaining free stratum relative to those collars and the instanton collars.

#proof[
  The ordinary construction is Proposition 94, and its exact support and lower-level behavior follow from Lemmas 97 and 99. For ordinary non-PSC Floer ends the compactness and gradient-regularity arguments are those in Section 2; the isolated true-neck argument is needed only for the present spinor family. Proposition 101 verifies the fixed-type requirements using single-valued data. Lemma 103 and Proposition 104 exclude the forbidden mixed candidates and give regular zero-dimensional trace-main problems. The estimates and ideal limits are Lemmas 97 and 98. Proposition 102 gives the legitimate instanton collars and their contribution.
  Propositions 106 and 109 now give exhaustive regular collars at the remaining no-particle lens ends. On the unbroken part use a countable small single-valued library supported off these collars and the protected instanton collars, or regularize compact remainders successively. Universal surjectivity there again uses its single $P$ component, and the expected dimension is one. Such small final choices preserve the forbidden-stratum exclusions by the compactness argument of Proposition 104.
  There are no other ideal boundaries by the numerical exclusions, now with their analytic hypotheses proved. The lens construction uses the local cap operator and the exponential estimates, with no gluing at an excluded positive-particle stratum. With the instanton and lens collars added, sequential compactness gives the claimed compact weighted one-dimensional object. Lemma 105 supplies its boundary rule. All choices were made in arbitrarily small prescribed norms and obeyed the support, parameter-locality, and tensor-identification conditions from the start. ◻
]

=== 10.5 The local comparison of determinant orientations <the-local-comparison-of-determinant-orientations>

Table 3 collects the conventions used in the comparison. The sign $s$ is the sign of the full real cap determinant line, including its framing, mark, and cut factors.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Datum
], table.cell(rowspan: 1, colspan: 1)[Ordinary convention
], table.cell(rowspan: 1, colspan: 1)[Spinor continuation
], table.cell(rowspan: 1, colspan: 1)[Reference
]),
  table.cell(rowspan: 1, colspan: 1)[Determinant and gauges
], table.cell(rowspan: 1, colspan: 1)[Determinant connection and transition maps fixed; determinant-one gauges
], table.cell(rowspan: 1, colspan: 1)[Same fixed exterior data under a local cap flip
], table.cell(rowspan: 1, colspan: 1)[Convention 5
],
  table.cell(rowspan: 1, colspan: 1)[Framing
], table.cell(rowspan: 1, colspan: 1)[Unframed main; framed one-ended cap
], table.cell(rowspan: 1, colspan: 1)[The cap stabilizer absorbs matching rotations, with no extra multiplicity
], table.cell(rowspan: 1, colspan: 1)[Proposition 109
],
  table.cell(rowspan: 1, colspan: 1)[Local dimensions
], table.cell(rowspan: 1, colspan: 1)[Interval: $1 + 1 + 1 - 3 = 0$
], table.cell(rowspan: 1, colspan: 1)[Fixed framed cap: $2 + 1 - 3 = 0$
], table.cell(rowspan: 1, colspan: 1)[Theorem 23; Proposition 106
],
  table.cell(rowspan: 1, colspan: 1)[Real cap line
], table.cell(rowspan: 1, colspan: 1)[Ordered parameter, mark, cut, and framing factors; comparison sign $s$
], table.cell(rowspan: 1, colspan: 1)[The same full real comparison; $epsilon_1 = - s epsilon_0$
], table.cell(rowspan: 1, colspan: 1)[Proposition 25
],
  table.cell(rowspan: 1, colspan: 1)[Dirac factor
], table.cell(rowspan: 1, colspan: 1)[Absent from the ordinary operator
], table.cell(rowspan: 1, colspan: 1)[Canonical complex orientation contributes the separate real sign $+ 1$
], table.cell(rowspan: 1, colspan: 1)[Proposition 110
],
  table.cell(rowspan: 1, colspan: 1)[Phase and cuts
], table.cell(rowspan: 1, colspan: 1)[Ordinary instanton sign retained
], table.cell(rowspan: 1, colspan: 1)[Original character two; effective phase quotients by ${ 1 \, - 1 }$; the link cut is $cal(O) \( 2 \)$
], table.cell(rowspan: 1, colspan: 1)[Proposition 102
],
  table.cell(rowspan: 1, colspan: 1)[Branch weights
], table.cell(rowspan: 1, colspan: 1)[The integral count uses the fixed lift weights
], table.cell(rowspan: 1, colspan: 1)[Lens matching preserves each branch weight; near instanton links the total branch weight is one
], table.cell(rowspan: 1, colspan: 1)[Propositions 109 and 102
],
)
]],
  caption: [Table 6: The ordinary conventions and their spinor continuation. The interval count varies the metric and the sweep mark; the cap count fixes the separating face and retains the framed cap directions. The full comparisons, rather than a prescribed value of $s$, determine the cancellation. ],
)

Let $epsilon \( upright(bold(e)) \)$ denote the relative lift weights already used in the integral ordinary composition, where $upright(bold(e)) = \( e_1 \, dots.h \, e_n \)$. They are fixed before constructing the spinor problem. The next proposition shows that these same weights cancel the lens ends.

#thm([Proposition 10.5.])[
  (The ordinary weights cancel the spinor lens ends).  #emph[For every regular trace-face main solution and every local branch, the two caps obtained by flipping its lens bit have opposite oriented contributions after multiplication by $epsilon \( upright(bold(e)) \)$. This comparison is independent of the main solution, respects all remaining gluings, and preserves the branch weights. In particular it is the relative sign of Proposition 25, with no new sign choice.]
] <prop:gluing:signs>

#proof[
  Fix a regular trace-face main solution and one local branch. The exterior data agree under the lens-bit flip by Proposition 104, and Proposition 106 chooses tensor-related cap data. We first recall the relative cap operation from Proposition 25 in these matching conventions. If $x in H^2 \( N \; bb(Z) \)$ has $x \( S \) = 1$, then
  $ x^2 = - 1 / 4 \, #h(2em) "PD" \( S \) \|_N = - 4 x . $
  Tensoring on the cap by the line with first Chern class $- 2 x$ changes the rank-two determinant by $- 4 x$. Globally, before this bit is flipped, $c dot.op S = 0$ and $S^2 = - 4$. Thus
  #[#set math.equation(numbering: n => "(10.9)")
   $ Delta c^2 = - 4 \, #h(2em) Delta c_2 = - 1 \, #h(2em) Delta #scale(x: 120%, y: 120%)[\(] c_2 - c^2 \/ 4 #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:gluing:flip-charge>]
  The same flip adds $"PD" \( S \)$ to $Lambda$. This is a local cap replacement with the identical exterior bundle and identical relative exterior charge; it is not a global choice of a square root on the exterior.
  The tensor line has the order-two flat boundary character. In the fixed common exterior determinant normalization, it sends $"diag" \( i \, - i \)$ to $"diag" \( - i \, i \)$, a conjugate trace representative. Choose once a determinant-preserving parallel boundary conjugation returning to the fixed $gamma$. Its ambiguity lies in the connected group $H$ and is absorbed by the cap stabilizer. At charge $1 \/ 4$ the relative cap degree is fixed, and (10.9) identifies the desired cap sectors. Use the intrinsic cap root obtained by tensoring the old root with the twisting line, continued from the collapsed sweep loop as in Proposition 25. With these roots the normalized sphere path is unchanged before boundary conjugation, which preserves its central target $- 1$. The adjoint data and sphere cut therefore correspond; copying the cap curvature and cut perturbations gives the paired crossings and full framed deformation-and-cut complexes of Proposition 106.
  Fix the ordering of parameter, mark, cut, and phase factors used in the ordinary and spinor counts. At a product-flat lens splitting the instanton orientation line factors by determinant gluing as
  #[#set math.equation(numbering: n => "(10.10)")
   $ lambda_I \( upright("total") \) tilde.equiv lambda_I \( M \; upright("unframed") \) ⊗ lambda_I \( N \; upright("framed") \) . $ <eq:gluing:excision>]
  The framed cap factor includes the boundary-stabilizer orientation which would otherwise occur in matching. Use the full cap lines $K_e$ and gluing isomorphisms $Gamma_e : lambda_V ⊗ K_e arrow.r lambda_e$ of Proposition 25; $K_e$ includes the framing, sweep-mark, and holonomy-target factors. The comparison and weights in (3.8) and (3.9) are
  $ Phi = Gamma_1 \( "id" ⊗ tau_(upright("cap")) \) Gamma_0^(- 1) \, #h(2em) Phi \( o_0 \) = s thin o_1 \, #h(2em) epsilon_1 = - s thin epsilon_0 \, $
  where $o_e$ are the previously chosen ordinary sector orientations. Thus $Phi \( epsilon_0 o_0 \) = - epsilon_1 o_1$. The map $tau_(upright("cap"))$ includes every framing and cut factor, including the possible complex conjugation of an ordered off-diagonal coordinate and reversal of the toral generator under the boundary Weyl conjugation. Only this full real determinant-line sign $s$ is used. The products of these comparisons are exactly the weights $epsilon \( upright(bold(e)) \)$ in the ordinary composition.
  Proposition 25 proves that this comparison extends with constant sign over the relative configuration sectors: the connection spaces are connected and the integral-lift orientation systems have trivial monodromy on the determinant-one gauge quotient. The fixed charge $1 \/ 4$ excludes a change of internal boundary degree. The same proposition proves naturality under other gluings and multiplicativity on disjoint caps; the constrained cap factors have even parity. These are comparisons of orientation torsors and require no path of solutions. They apply here because the exterior bundle, relative degree, cap framing, and mark and cut ordering are precisely the ones just identified.
  Finally, homotope the spinor deformation operator, keeping its symbol, to the direct sum of the instanton deformation operator and the coupled complex Dirac operator. Its orientation is the instanton orientation times the complex Dirac orientation, followed by the chosen parameter, cut, and effective-phase factors. Tensoring the cap and applying the chosen boundary conjugation act complex linearly on the spinor bundles, so the canonically oriented Dirac determinant contributes the separate real sign $+ 1$. This remains true if the interior Dirac operators are joined by a homotopy rather than identified by an identical formula. The exterior phase, parameter, and all other cut factors agree in the paired problems. Thus the full spinor comparison has exactly the ordinary relative sign above.
  The perturbation prescription ties each exterior finite branch list under the flip, rather than only its averaged value. The chosen main branch therefore has the same paired branch and rational weight. Proposition 109 preserves those lists and weights under gluing, with one match per cap crossing and no additional $H$-multiplicity. The opposite orientation comparison consequently holds for each weighted lens-boundary contribution. ◻
]

=== 10.6 Closing the one-dimensional count <closing-the-one-dimensional-count>

#thm([Theorem 10.6.])[
  (Contradiction from the boundary count).  #emph[The finite stack of Theorem 53 cannot exist under an orientation-preserving identification $Y_(- 2) tilde.equiv Y_2$. Consequently the remaining oriented cosmetic pair of slopes $- 2$ and $2$ is impossible.]
] <thm:gluing:contradiction>

#proof[
  Let $Omega eq.not 0$ be the oriented ordinary instanton count of Theorem 53, with the fixed lift weights $epsilon \( upright(bold(e)) \)$ and the prescribed cap insertions. Put
  $ r = n_D^(upright("tot")) > 0 \, #h(2em) eta = r - 1 . $
  The ordinary dimension equation is $D_I^(upright("tot")) + n - 2 n - z = 0$. Adding the spinor directions, dividing by effective phase, and imposing the $eta$ complex phase cuts gives
  #[#set math.equation(numbering: n => "(10.11)")
   $ D_I^(upright("tot")) + 2 r + n - 2 n - z - 1 - 2 eta = 1 . $ <eq:gluing:one-dimensional>]
  By Theorem 90 the free zero set is therefore an oriented one-dimensional finite weighted branch space, with the exclusion and compactness properties already proved there.
  The instanton-link contribution is supplied by Proposition 102. At a legitimate regular cut-down instanton the phase quotient of the normal link is $bb(C P)^(r - 1)$, and the $eta = r - 1$ original-phase-character-two cuts are sections of $cal(O) \( 2 \)$. With $h = c_1 \( cal(O) \( 1 \) \)$,
  #[#set math.equation(numbering: n => "(10.12)")
   $ ⟨\( 2 h \)^(r - 1) \, \[ bb(C P)^(r - 1) \]⟩ = 2^(r - 1) = 2^eta . $ <eq:gluing:link-multiplicity>]
  For $r = 1$ this means the single point of $bb(C P)^0$ and no phase cuts. The proposition gives the complex orientation multiplied by the ordinary instanton sign, up to one common boundary-orientation convention. The mixed and final interior perturbations vanish in these charts, and their repeated zero branches have total weight one. Consequently the total instanton-link boundary contribution is $sigma_0 2^eta Omega$, for one common $sigma_0 in { 1 \, - 1 }$.
  Choose small disjoint radial neighborhoods of these finitely many instantons, and cut each of the finitely many regular lens collars at a sufficiently large finite $D$. Proposition 109 identifies every end of the latter type with its matching main point and cap crossing. The remaining part of the free zero set is compact. Indeed, an escaping sequence has an ideal limit by Lemma 97; Theorem 89 and Proposition 104 exclude every limit except the neighborhoods just removed. The exhaustion assertion of Proposition 109 and the instanton blow-up charts preclude escape even to those limits from the truncated remainder.
  Apply Lemma 105 to this compact oriented one-dimensional remainder. Its finite local branch lists have the compatible weighted germs proved there, and the instanton and lens collars preserve their weights. Branches extend by the same repeated zero list across a perturbation-support boundary, so no artificial boundary point is introduced. The total weighted oriented boundary is therefore zero.
  Every lens contribution cancels with its bit-flipped partner by Proposition 110, using the same $epsilon \( upright(bold(e)) \)$ as in $Omega$. The exclusions have left no other boundary. Stokes therefore gives
  $ 0 = sigma_0 2^eta Omega . $
  This contradicts $Omega eq.not 0$ over $bb(Q)$. All neighborhoods used here are the regular zero-particle neighborhoods proved above; no gluing assertion at a positive-particle level has entered the boundary argument. ◻
]

#proof[
  The reduction in Section 1 shows that a distinct orientation-preserving cosmetic pair on a nontrivial knot in $S^3$ would have slopes $- 2$ and $2$ and genus two. The meridional slope is already excluded by the absence of a second sphere filling, and zero cannot pair with a different slope because of first homology. An oriented homeomorphism in the remaining case can be taken to be a diffeomorphism, giving the identification used throughout the construction. Theorem 111 excludes that case. Thus any orientation-preserving homeomorphism between two fillings in the statement has equal slopes. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
