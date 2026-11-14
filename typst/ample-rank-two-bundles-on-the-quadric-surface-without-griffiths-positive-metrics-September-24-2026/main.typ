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

#align(center)[#text(size: 16pt, weight: "bold")[Ample rank-two bundles on the quadric surface \
without Griffiths-positive metrics]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A holomorphic vector bundle $E$ on a projective variety is ample when the tautological quotient line bundle
  $cal(O)_(bb(P) \( E \)) \( 1 \)$ is ample; here $bb(P) \( E \)$ parametrizes one-dimensional quotients
  #cite(label("Hartshorne1966")) Proposition 3.2. A smooth Hermitian metric is strictly Griffiths-positive if its
  Chern curvature is positive in every pair of nonzero tangent and fiber directions.
  Such a metric implies ampleness. Griffiths’ conjecture asks for the converse on smooth complex projective
  varieties #cite(label("Griffiths1969")) Problem (0.9).

Set

$ S = bb(P)^1 times bb(P)^1 \, wide P = cal(O)_S \( 1 \, 1 \) \, $

where $p_1 \, p_2 : S arrow.r bb(P)^1$ are the projections, and $cal(O)_S \( r \, s \) =
  p_1^(*) cal(O)_(bb(P)^1) \( r \) ⊗ p_2^(*) cal(O)_(bb(P)^1) \( s \)$.
  Let $f_m : S arrow.r S$ raise the homogeneous coordinates in each factor to their $m$th powers.
  Thus $deg f_m = m^2$ and $f_m^(*) P tilde.eq P^m$.

#thm([Theorem 1.1.])[
  #emph[There is an algebraic vector bundle $G$ of rank two on $S$ such that, for every positive integer $m$, the bundle
$ E_m = f_m^(*) G ⊗ P $

 is ample. There is an integer $m_0$ such that $E_m$ admits no smooth Hermitian metric with strictly
   Griffiths-positive Chern curvature for every $m gt.eq m_0$.]
] <thm:main>

The bundle $G$ is given explicitly in Section 2. The ampleness assertion has a quantitative certificate:
  Proposition 5 proves that $cal(O)_(bb(P) \( E_m \)) \( n \)$ is very ample for every even $n$ with $n - 1 gt.eq
  3 m$. The threshold $m_0$ is obtained by compactness and is ineffective.
  Thus Griffiths’ conjecture fails in rank two on the quadric surface.

=== Historical context and related results <historical-context-and-related-results>

Hartshorne developed the algebraic theory of ample vector bundles through symmetric powers, global generation,
  and the tautological line bundle #cite(label("Hartshorne1966")).
  Griffiths’ original question used the term “cohomologically positive”;
  his definition of “ample” in that article included a first-jet generation condition
  #cite(label("Griffiths1969")) Definitions (0.2)–(0.3), Problem (0.9).
  The conjecture above is the modern formulation of that question.
  Its significance is the proposed passage from algebraic positivity to a Hermitian curvature condition on the
  bundle itself, which can then enter differential-geometric vanishing arguments.

For line bundles the algebraic and curvature notions agree #cite(label("Umemura1973")) Proposition 1.15.
  On complex curves, Hartshorne characterized ampleness by positivity of the degrees of all nonzero quotient
  bundles #cite(label("Hartshorne1971")) Theorem 2.4. Umemura proved the metric equivalence first for elliptic
  curves and then for compact Riemann surfaces #cite(label("Umemura1972")) #cite(label("Umemura1973"));
  see in particular #cite(label("Umemura1973")) Theorem 2.6 and the later work of Campana–Flenner
  #cite(label("CampanaFlenner1990")). These results make a surface the first possible base dimension for the
  phenomenon in Theorem 1.

Several positive results recover strong curvature after modifying the bundle.
  Nakano positivity is a stronger curvature condition than Griffiths positivity.
  Berndtsson proved Nakano positivity of $E ⊗ det E$ for ample $E$ through direct-image curvature
  #cite(label("Berndtsson2009")) Theorem 1.3. Liu–Sun–Yang established Nakano and dual-Nakano positivity for
  determinant-twisted symmetric powers and for sufficiently large symmetric powers of ample bundles
  #cite(label("LiuSunYang2013")) Theorems 1.1–1.2 and Corollary 1.3.
  The determinant twists and symmetric powers are part of these conclusions;
  they do not supply a Griffiths-positive metric on $E$ itself.

Analytic approaches to that remaining question include Demailly’s Hermitian–Yang–Mills system and subsequent
  curvature functionals #cite(label("Demailly2021")) #cite(label("Demailly2022")).
  Pingali identified a limitation of the initial system and solved a related system for direct sums of ample line
  bundles on Riemann surfaces #cite(label("Pingali2021")) #cite(label("Pingali2023")).
  Murakami subsequently obtained an analytic proof of the full curve case through the Demailly system
  #cite(label("Murakami2026")) Theorem 1.2. These developments concern smooth Hermitian metrics and clarify the
  analytic difficulty of recovering them from ampleness.

The requirement that the metric be Hermitian is essential to the problem.
  Kobayashi characterized ampleness of $E$ by negatively curved strongly pseudoconvex complex Finsler structures
  on $E^(*)$ #cite(label("Kobayashi1975")) Theorems 4.1 and 5.1.
  His term “convex” means positivity of the complex fiber Hessian of the squared metric
  #cite(label("Kobayashi1975")) Section 2. Their squared norms are homogeneous of degree two but need not be
  Hermitian quadratics in the fiber variable. More recently,
  Lempert showed that an equivariant fiberwise rule applied to a prescribed positive tautological metric can fail
  to produce even a semipositive Hermitian metric #cite(label("Lempert2026Construction")) Theorem 2.1.
  His examples are direct sums of a positive line bundle and also carry positive Hermitian metrics.
  That result identifies an obstruction to the specified construction rule;
  the obstruction below concerns every smooth strictly positive metric on the indicated bundles.

In a preprint posted on September 22, 2026, Du–Xie state the existence of a rank-two ample bundle on the abelian
  surface $C times C$, where $C$ is the elliptic curve $y^2 = x^3 - x$,
  without a smooth Griffiths-semipositive metric #cite(label("DuXie2026Counterexample")) Theorem 1.1.
  Their accompanying preprint gives a first-jet characterization of Griffiths positivity in terms of an
  adjoint-Levi obstruction #cite(label("DuXie2026FirstJet")) Theorem 1.1.
  The construction here is on the rational quadric and supplies a specified power-map family,
  an all-$m$ ampleness certificate, and the general limiting statement of Proposition 6.
  Its metric conclusion is the absence of smooth #emph[strictly] Griffiths-positive metrics for all sufficiently
  large $m$.

A subsequent preprint of Liu–Wan, posted on September 29, 2026,
  states the existence of ample rank-two bundles on every Hirzebruch surface, including $bb(P)^1 times bb(P)^1$,
  that are slope-stable with respect to suitable ample polarizations and admit no smooth strongly pseudoconvex
  Finsler metric of semipositive Kobayashi curvature #cite(label("LiuWan2026")) Theorem 1.1.
  That curvature condition is imposed on the original bundle;
  Kobayashi’s ampleness characterization above uses negative curvature on its dual.
  The result concerns a different construction and a stronger metric exclusion than the strict Hermitian
  conclusion proved here.

=== Proof strategy <proof-strategy>

===== 1.1 Compatible graph identifications. <compatible-graph-identifications.>

Choose two projective transformations $A \, B$ of $bb(P)^1$ with order three and no common fixed point,
  such that $A B$ is conjugate to $z mapsto lambda z$ with $\| lambda \| > 1$.
  Their chosen linear lifts, and the relative lift $A^(- 1) B$, have finite order.
  The two properties serve different purposes: finite relative orders allow line maps to agree at graph
  intersections, whereas the expanding product will prevent a common invariant measure.
  For $M in { I \, A \, B }$ put $Gamma_M = { \( x \, M x \) : x in bb(P)^1 }$ and $D =
  Gamma_I union Gamma_A union Gamma_B$. For a suitable common multiple $b$ of the finite lift orders, set $L_1 =
  cal(O)_S \( b \, 0 \)$ and $L_2 = cal(O)_S \( 0 \, b \)$.
  The lifted maps identify $L_1^(- 1) \|_D$ with $L_2^(- 1) \|_D$;
  duality gives a corresponding identification of $L_1 \|_D$ and $L_2 \|_D$.
  Define $G$ by the pairs of local sections of $L_1 xor L_2$ that agree under this identification on $D$.
  This is an elementary transformation in the sense of #cite(label("Maruyama1986")) Introduction, (0.1).
  Section 2 checks compatibility at every node, local freeness, and the two line-bundle quotients of $G$.
  Their dual line subbundles in $F = G^or$ span away from $D$ and coincide over $D$ according to the prescribed
  lifted transformations.

===== 1.2 Ampleness from the two quotients. <ampleness-from-the-two-quotients.>

The two quotient sequences give two filtrations of symmetric powers.
  The product of the two kernel line bundles is positive in both rulings.
  Alternating the sequences groups the negative twists into powers of this product;
  each remaining quotient loses at most one additional copy of the graph divisor.
  After pullback by $f_m$, twisting $"Sym"^n \( f_m^(*) G \)$ by $P^(n - 1)$ offsets that loss for sufficiently
  large even $n$. The line factors are then globally generated and have vanishing first cohomology.
  Section 3 lifts their sections through the filtration. A relative Veronese map,
  the base embedding supplied by one further factor $P$, and a Segre embedding then give the stated very-ampleness
  certificate. This follows the symmetric-power framework of #cite(label("Hartshorne1966")),
  while using the two quotients separately also where their kernels coincide.

===== 1.3 A nonzero quadratic limit. <a-nonzero-quadratic-limit.>

Suppose that infinitely many $E_m$ have positive metrics. Their dual squared norms are plurisubharmonic.
  Average these norms over $f_m$, using a local $m$th root of a pulled-back #emph[twisting frame] to absorb the
  factor $P$. Each average remains a Hermitian quadratic; the twisting transition factor tends to one as $m
  arrow.r oo$. After a scalar normalization, the coefficient matrices are locally uniformly bounded.
  Proposition 6 produces a finite, nonnegative, nonzero plurisubharmonic function $q$ on $F$,
  quadratic on every fiber. Convolution of negative singular Hermitian metrics is developed in
  #cite(label("BerndtssonPaun2008")) #cite(label("Raufi2015")) #cite(label("PaunTakayama2018")).
  Here noncollapse and the assertion on #emph[every] fiber require separate arguments:
  the graph relations lie over a divisor and cannot be read from an almost-everywhere representative.

===== 1.4 Incompatible invariances. <incompatible-invariances.>

Restricting $q$ to either line subbundle makes its squared seminorm independent of the other $bb(P)^1$ coordinate,
  by the maximum principle. The graph relations give a single nonzero squared seminorm on
  $cal(O)_(bb(P)^1) \( - b \)$, invariant under the lifts of $A$ and $B$.
  Total-space plurisubharmonicity and quadratic fiber dependence imply subharmonicity of the logarithmic weights.
  Applying $i partial macron(partial)$ to them gives a positive measure whose nonzero total mass is fixed by the
  degree $- b$, even when the seminorm has zeros. Invariance under $A
  B$ forces this measure to be supported on its two fixed points. Both $A$ and $B$ preserve this nonempty support.
  Since a permutation of at most two points whose order divides three is trivial,
  each would fix every support point, giving a common fixed point.
  Section 5 proves this contradiction, and Section 6 assembles the theorem.

=== Conventions and notation <conventions-and-notation>

For a vector bundle $V$, $bb(P) \( V \)$ parametrizes one-dimensional quotients,
  and $cal(O)_(bb(P) \( V \)) \( 1 \)$ is the tautological quotient line.
  The projective line $bb(P)^1$ used to describe the graph transformations is also identified with the lines in
  $bb(C)^2$; its tautological subbundle is $cal(O)_(bb(P)^1) \( - 1 \)$.

We use the curvature convention of #cite(label("Demailly2021")).
  At a point, in local coordinates and a frame orthonormal at that point, write

$ Theta_(E \, h) = i sum_(j \, k \, alpha \, beta) c_(j k alpha beta) thin d z_j and
  d macron(z)_k ⊗ e_alpha^(*) ⊗ e_beta . $

Strict Griffiths positivity means

$ sum_(j \, k \, alpha \, beta) c_(j k alpha beta) xi_j macron(xi)_k v_alpha macron(v)_beta > 0 quad
  upright("for all ") xi eq.not 0 \, med v eq.not 0 . $

The dual has the opposite Griffiths sign. In particular its squared norm is plurisubharmonic on the total bundle;
  this standard criterion is recalled where it is used. Throughout, “psh” means plurisubharmonic,
  and $i partial accent(partial u, ‾) = i u_(z macron(z)) thin d z and d macron(z)$ on a complex curve.
  A Hermitian quadratic form is allowed to be positive semidefinite when this is stated explicitly.

== 2 A bundle defined by three graphs <sec:construction>

We construct $G$ together with two line-bundle quotients.
  Their dual inclusions will span away from three graphs and agree on those graphs through specified linear maps.
  The quotient sequences will prove ampleness; the graph identities will constrain a quadratic limit on $G^or$.

We choose matrices $A \, B$ with two different properties.
  The relative lifts $A$, $B$, and $A^(- 1) B$ must have finite order,
  so that their tensor powers agree at graph intersections.
  The projective actions of $A$ and $B$ will have order three and no common fixed point,
  while $A B$ will have eigenvalues of distinct moduli. Together these properties will exclude an invariant
  measure in Section 5. As in the introduction, $S = bb(P)^1 times bb(P)^1$,
  and we view $bb(P)^1$ as the lines in $bb(C)^2$, with tautological bundle $cal(O)_(bb(P)^1) \( - 1 \)$.

Put

#[#set math.equation(numbering: n => "(2.1)")
 $ a = e^(i pi \/ 3) \, wide s = 1 / 2 - frac(i \( 1 + 2 sqrt(2) \), 2 sqrt(3)) \, wide A =
   mat(delim: "(", a, 0; 0, a^(- 1)) \, wide B = mat(delim: "(", s, 1; sqrt(2) \/ 3, 1 - s) . $ <eq:matrices>]

We use the same letters for their induced automorphisms of $bb(P)^1$.

#thm([Lemma 2.1.])[
  #emph[The matrices $A \, B$ belong to $"SL"_2 \( bb(C) \)$ and satisfy
$ "tr" A = "tr" B = 1 \, wide "tr" \( A^(- 1) B \) = - sqrt(2) \, wide "tr" \( A B \) = 1 + sqrt(2) . $

 The orders of $A$, $B$, and $A^(- 1) B$ in $"SL"_2 \( bb(C) \)$ are $6$, $6$, and $8$, respectively.
   The induced projective orders of $A$ and $B$ are both $3$.
   The matrix $A B$ has two positive real reciprocal eigenvalues of distinct moduli, and $A \,
   B$ have no common eigenline.]
] <lem:matrix-data>

#proof[
  The value of $s$ gives
  $ s \( 1 - s \) = 1 + sqrt(2) / 3 \, wide a^(- 1) s + a \( 1 - s \) = - sqrt(2) . $
  These identities prove the determinant and trace assertions except for the trace of $A B$.
    The characteristic polynomial of each of $A \, B$ is $t^2 - t + 1$, with roots $e^(plus.minus i pi \/ 3)$,
    while that of $A^(- 1) B$ is $t^2 + sqrt(2) t + 1$, with roots $e^(plus.minus 3 i pi \/ 4)$.
    The roots in each pair are distinct, proving the claimed orders; in particular $A^3 = B^3 = - "Id"$.
  Cayley–Hamilton gives $A + A^(- 1) = "Id"$. Multiplication by $B$ and taking traces therefore yield
  $ "tr" \( A B \) = "tr" B - "tr" \( A^(- 1) B \) = 1 + sqrt(2) > 2 . $
  Since $det \( A B \) = 1$, its eigenvalues are positive real reciprocals, one greater than one.
    Finally, the eigenlines of $A$ are the two coordinate lines, and neither is preserved by $B$,
    whose two off-diagonal entries are nonzero. ◻
]

For $M in { I \, A \, B }$ let

$ Gamma_M = { \( x \, M x \) : x in bb(P)^1 } \, wide D = Gamma_I union Gamma_A union Gamma_B \, $

where $D$ has the reduced structure.

#thm([Lemma 2.2.])[
  #emph[The divisor $D$ has bidegree $\( 3 \, 3 \)$ and exactly six singular points,
    all ordinary transverse intersections of two components. There are no triple intersections.]
] <lem:graph-divisor>

#proof[
  Each graph is a smooth divisor of bidegree $\( 1 \, 1 \)$.
    An intersection of $Gamma_M$ and $Gamma_N$ corresponds to a fixed point of $M^(- 1) N$,
    hence to an eigenline of that matrix. The relative matrices are $A \, B \, A^(- 1) B$ or their inverses.
    Each has two distinct eigenvalues, and the multiplier at either projective fixed point is the ratio of those
    eigenvalues in one order or the other. This ratio is not one.
    The fixed points are therefore simple, so each pair of graphs meets transversely at two points.
    A point on all three graphs would give a common eigenline of $A$ and $B$, contrary to Lemma 2.
    Thus the six pairwise intersections are distinct. Their local equations are products of two regular
    parameters, and the asserted description follows. ◻
]

Set

#[#set math.equation(numbering: n => "(2.2)")
 $ b = 24 \, wide L_1 = p_1^(*) cal(O)_(bb(P)^1) \( b \) \, wide L_2 =
   p_2^(*) cal(O)_(bb(P)^1) \( b \) . $ <eq:construction-lines>]

The exponent $24$ is a common multiple of the orders $6 \, 6 \, 8$ of the specified relative linear lifts $A \,
  B \, A^(- 1) B$. It makes the induced tensor-power maps on the two branches of each graph intersection agree on
  their common fiber, as used in the descent argument below.

Along $Gamma_M$, the map $M$ on tautological lines induces an isomorphism from $L_1^(- 1)$ to $L_2^(- 1)$ by
  taking its $b$-th tensor power.

#thm([Proposition 2.3.])[
  #emph[These three isomorphisms glue to an algebraic isomorphism
#[#set math.equation(numbering: n => "(2.3)")
 $ alpha : L_1^(- 1) \|_D arrow.r^tilde.op L_2^(- 1) \|_D \, wide alpha \|_(Gamma_M) = M^(⊗ b) . $ <eq:alpha>]

 Let $beta = \( alpha^or \)^(- 1) : L_1 \|_D arrow.r L_2 \|_D$ and define
#[#set math.equation(numbering: n => "(2.4)")
 $ G = { \( u_1 \, u_2 \) in L_1 xor L_2 : u_2 \|_D = beta \( u_1 \|_D \) #scale(x: 120%, y: 120%)[}] .
   $ <eq:equalizer>]

 Then $G$ is an algebraic vector bundle of rank two. Both projections $rho_i : G arrow.r L_i$ are surjective,
   with exact sequences
#[#set math.equation(numbering: n => "(2.5)")
 $ 0 arrow.r L_i \( - D \) arrow.r G arrow.r^(rho_j) L_j arrow.r 0 \, wide { i \, j } = { 1 \,
   2 } . $ <eq:quotient-sequences>]

 For $F = G^or$, the dual inclusions $iota_i = rho_i^or : L_i^(- 1) arrow.r.hook
   F$ span each fiber over $S \\ D$ and satisfy
#[#set math.equation(numbering: n => "(2.6)")
 $ iota_2 compose alpha = iota_1 wide upright("on ") D . $ <eq:dual-gluing>]

]
] <prop:construction>

#proof[
  The bundle will be an elementary transformation of $L_1 xor L_2$ along the effective Cartier divisor $D$,
    as in #cite(label("Maruyama1986")) Introduction, (0.1). We verify the gluing and the local basis directly,
    since the resulting quotient maps are needed in both subsequent arguments.
  At a point of $Gamma_M ∩ Gamma_N$, let $v$ span the first-coordinate line.
    For some eigenvalue $lambda$ of $M^(- 1) N$ we have $N v = lambda M v$. By Lemma 2, $lambda^24 = 1$. Consequently
  $ \( N v \)^(⊗ b) = \( M v \)^(⊗ b) . $
  Thus the two maps agree as maps of the actual line fibers.
    This also covers the reversed pair, for which the eigenvalue is $lambda^(- 1)$.
  We check descent at a node. If $R$ is the local ring of $S$ there and $\( x \) \, \( y \)$ are the branch
    ideals, transversality gives $\( x \) ∩ \( y \) = \( x y \)$ and the exact sequence
  $ 0 arrow.r R \/ \( x y \) arrow.r R \/ \( x \) xor R \/ \( y \) arrow.r R \/ \( x \, y \) arrow.r 0 \, $
  whose last map is the difference of the residue values. Tensoring this sequence by the locally free rank-one
    sheaf $"Hom" \( L_1^(- 1) \, L_2^(- 1) \) \|_D$ shows that the equal fiber values are precisely the
    compatibility needed to descend the two branch sections. Their common value is nonzero,
    so the descended scalar is a unit in the nodal local ring.
    The component maps therefore glue to the isomorphism (2.3).
  Near a point of $D$, choose frames of $L_1 \, L_2$ and a local equation $d$ of $D$.
    The scalar defining $beta$ modulo $d$ lifts, after shrinking, to a regular unit $h$.
    In these frames the module (2.4) has basis
  #[#set math.equation(numbering: n => "(2.7)")
   $ e = \( 1 \, h \) \, wide f = \( 0 \, d \) . $ <eq:local-basis>]
  Indeed, every element has a unique expression $u_1 e + k f$, since $u_2 -
    h u_1$ is divisible by the non-zero-divisor $d$. Away from $D$ the sheaf is simply $L_1 xor L_2$,
    proving local freeness everywhere.
  The first projection maps $e$ to $1$, and the second maps $e$ to the unit $h$, so both are surjective.
    Setting the $j$-th coordinate equal to zero in (2.4) identifies its kernel with $L_i \( - D \)$,
    proving (2.5). Their duals are line subbundles of $F$, and away from $D$ they span.
    On $D$, if $v in L_1^(- 1)$ and $\( u_1 \, u_2 \) in G$, then
  $ #scale(x: 120%, y: 120%)[\(] iota_2 \( alpha v \)
    #scale(x: 120%, y: 120%)[\)] \( u_1 \, u_2 \) = \( alpha v \) \( beta u_1 \) = v \( u_1 \) =
    #scale(x: 120%, y: 120%)[\(] iota_1 \( v \) #scale(x: 120%, y: 120%)[\)] \( u_1 \, u_2 \) \, $
  because $alpha^or beta = "Id"$. This is (2.6). ◻
]

For a positive integer $m$, define

#[#set math.equation(numbering: n => "(2.8)")
 $ f_m #scale(x: 120%, y: 120%)[\(] \[ z_0 : z_1 \] \, \[ w_0 : w_1 \] #scale(x: 120%, y: 120%)[\)] =
   #scale(x: 120%, y: 120%)[\(] \[ z_0^m : z_1^m \] \, \[ w_0^m : w_1^m \] #scale(x: 120%, y: 120%)[\)] .
   $ <eq:power-maps>]

This is finite of degree $m^2$, and $f_m^(*) cal(O)_S \( r \, t \) tilde.eq cal(O)_S \( m r \, m t \)$.
  In particular, $f_m^(*) P tilde.eq P^(⊗ m)$. The bundles in the theorem are

#[#set math.equation(numbering: n => "(2.9)")
 $ E_m = f_m^(*) G ⊗ P . $ <eq:family>]

== 3 Ampleness of every member of the family <sec:ampleness>

For each $m$, we construct enough symmetric-power sections to embed $bb(P) \( E_m \)$.
  The two quotient sequences are used alternately: their kernels individually have one negative degree,
  but their tensor product is positive in both rulings. The resulting filtration gives an explicit very-ampleness
  range within Hartshorne’s symmetric-power framework #cite(label("Hartshorne1966")) Corollary 2.5 and Proposition 3.2.

#thm([Proposition 3.1.])[
  #emph[For every positive integer $m$, the bundle $E_m = f_m^(*) G ⊗ P$ is ample.
    More precisely, $cal(O)_(bb(P) \( E_m \)) \( n \)$ is very ample for every even integer $n$ with $n - 1 gt.eq 3 m$.]
] <prop:ampleness>

#proof[
  Fix $m$ and write
  $ V = f_m^(*) G \, wide tilde(L)_i = f_m^(*) L_i \, wide tilde(D) = f_m^(*) D \, wide K_i =
    tilde(L)_i \( - tilde(D) \) \, wide K = K_1 ⊗ K_2 . $
  Pullback of (2.5) gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ 0 arrow.r K_i arrow.r V arrow.r tilde(L)_j arrow.r 0 \, wide { i \, j } = { 1 \, 2 } . $ <eq:pullback-quotients>]
  These sequences remain exact because their original quotients are locally free. Here
  $ K_1 = cal(O)_S \( 21 m \, - 3 m \) \, wide K_2 = cal(O)_S \( - 3 m \, 21 m \) \, $
  and hence
  #[#set math.equation(numbering: n => "(3.2)")
   $ K = cal(O)_S \( 18 m \, 18 m \) \, wide cal(O)_S \( tilde(D) \) =
     cal(O)_S \( 3 m \, 3 m \) . $ <eq:kernel-product>]
  We write powers of line bundles for tensor powers throughout this proof.
  #strong[Alternating the quotient sequences.] For an extension $0 arrow.r K' arrow.r V' arrow.r L' arrow.r
    0$ with $K' \, L'$ line bundles, multiplication gives
  $ 0 arrow.r K' ⊗ "Sym"^(r - 1) V' arrow.r "Sym"^r V' arrow.r \( L' \)^r arrow.r 0 wide \( r gt.eq 1 \) . $
  Indeed, a local splitting gives a kernel generator $k'$ and a lift $e'$ of a quotient generator.
    The monomials containing $k'$ form the kernel of the symmetric quotient,
    and the remaining monomial $\( e' \)^r$ maps to a quotient generator.
    This is the usual symmetric-power filtration of an extension;
    compare the proof of #cite(label("Hartshorne1966")) Corollary 3.4.
  Apply this construction first to $V arrow.r tilde(L)_2$ and then to $V arrow.r tilde(L)_1$. For $r gt.eq 2$ it gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ 0 & arrow.r K_1 ⊗ "Sym"^(r - 1) V arrow.r "Sym"^r V arrow.r tilde(L)_2^(thin r) arrow.r 0 \,\
0 & arrow.r K ⊗ "Sym"^(r - 2) V arrow.r K_1 ⊗ "Sym"^(r - 1) V arrow.r K_1 ⊗ tilde(L)_1^(thin r - 1) arrow.r
  0 . $ <eq:symmetric-first>]
  Thus each pair of steps leaves the residual bundle $K ⊗ "Sym"^(r - 2) V$,
    with one line-bundle quotient at each step. For even $n$,
    iteration gives a filtration of $"Sym"^n V$ with line factors
  #[#set math.equation(numbering: n => "(3.4)")
   $ K^j ⊗ tilde(L)_2^(thin n - 2 j) \, wide K^j ⊗ tilde(L)_1^(thin n - 2 j) \( - tilde(D) \) \, wide 0 lt.eq
     j < n \/ 2 \,\
K^(n \/ 2) . $ <eq:graded-lines>]
  Indeed, after $j$ pairs the residual bundle is $K^j ⊗ "Sym"^(n - 2 j) V$,
    whose second quotient is $K^j K_1 tilde(L)_1^(thin n - 2 j - 1) =
    K^j tilde(L)_1^(thin n - 2 j) \( - tilde(D) \)$. Only the second quotient contains an additional twist by $-
    tilde(D)$ beyond the factors absorbed into $K^j$.
  Each step uses just one of the locally split sequences (3.1),
    so it remains valid when the two kernel lines have the same fiber image.
    Concretely, in the pulled-back basis $e \, f$ of (2.7), the kernels are generated by $k = d e - h f$ and $f$,
    with $h$ a unit. For $n = 2$ the filtration is
  $ cal(O) \( k f \) subset k V subset "Sym"^2 V . $
  Since $e \, k$ are also a basis of $V$, the module $k V$ has basis $k e \,
    k^2$ and is a direct summand of $"Sym"^2 V$, with complement generated by $e^2$. Moreover,
  $ k f = d / h k e - 1 / h k^2 . $
  The coefficient $- 1 \/ h$ is a unit, so $k f$ extends to a basis of $k V$.
    Both inclusions therefore have locally free quotients. This verification uses no smoothness of $d =
    0$ and applies at nodes and to nonreduced pullbacks of the divisor.
  #strong[Global generation after twisting.] Choose $n$ even with $n - 1 gt.eq 3 m$, and set
  #[#set math.equation(numbering: n => "(3.5)")
   $ W = "Sym"^n V ⊗ P^(n - 1) . $ <eq:generated-symmetric-power>]
  By (3.2), the bidegrees of its filtration factors, in the order of (3.4), are
  $ & \( 18 m j + n - 1 \, thick 18 m j + 24 m \( n - 2 j \) + n - 1 \) \,\
 & \( 18 m j + 24 m \( n - 2 j \) - 3 m + n - 1 \, thick 18 m j - 3 m + n - 1 \) \,\
 & \( 9 m n + n - 1 \, thick 9 m n + n - 1 \) . $
  Every entry is nonnegative: the only possibly negative contribution is $- 3 m$, and it is offset by $n - 1$.
  For $c \, t gt.eq 0$, products of homogeneous monomials generate $cal(O)_S \( c \, t \)$.
    Moreover $H^1 \( bb(P)^1 \, cal(O) \( c \) \) = H^1 \( bb(P)^1 \, cal(O) \( t \) \) = 0$,
    as computed on the two standard affine charts, so the Künneth formula gives
    $H^1 \( S \, cal(O)_S \( c \, t \) \) = 0$ #cite(label("StacksProject")) Tags 01XD and 0BED.
    If $0 arrow.r U arrow.r Z arrow.r Q arrow.r 0$ is an extension of globally generated bundles with
    $H^1 \( S \, U \) = H^1 \( S \, Q \) = 0$, the cohomology sequence gives $H^1 \( S \, Z \) =
    0$ and lifts every global section of $Q$ to $Z$. The lifted generators of $Q$,
    together with generators of $U$, span each fiber of $Z$. Starting with the innermost line factor and applying
    this observation successively proves that $W$ is globally generated.
  #strong[The projective embedding and its line bundle.] We record the tautological twists in the
    quotient-projectivization and Segre constructions #cite(label("StacksProject")) Tags 01OA, 01N1, and 01WD.
    Let $pi : bb(P) \( V \) arrow.r S$ and $H = H^0 \( S \, W \)$.
    Evaluation $H ⊗ cal(O)_S arrow.r W$ induces a closed immersion
  $ bb(P) \( W \) arrow.r.hook bb(P) \( H \) times S $
  whose projective hyperplane line pulls back to $cal(O)_(bb(P) \( W \)) \( 1 \)$.
    The relative Veronese closed immersion $bb(P) \( V \) arrow.r
    bb(P) \( "Sym"^n V \)$ sends a quotient line $ell$ to $ell^(⊗ n)$.
    Under the natural identification $bb(P) \( "Sym"^n V \) tilde.eq bb(P) \( W \)$, its tautological pullback is
  $ cal(O)_(bb(P) \( V \)) \( n \) ⊗ pi^(*) P^(n - 1) . $
  Consequently their composition embeds $bb(P) \( V \)$ into $bb(P) \( H \) times
    S$ with this hyperplane pullback from the first factor. Embedding $S$ by $P =
    cal(O)_S \( 1 \, 1 \)$ and then applying the Segre embedding gives a closed immersion into projective space
    whose hyperplane line pulls back to
  $ #scale(x: 120%, y: 120%)[\(] cal(O)_(bb(P) \( V \)) \( n \) ⊗ pi^(*) P^(n - 1) #scale(x: 120%, y: 120%)[\)] ⊗
    pi^(*) P = #scale(x: 120%, y: 120%)[\(] cal(O)_(bb(P) \( V \)) \( 1 \) ⊗ pi^(*) P #scale(x: 120%, y: 120%)[\)]^n . $
  This line is therefore very ample. Finally, $bb(P) \( E_m \) =
    bb(P) \( V ⊗ P \) tilde.eq bb(P) \( V \)$ identifies $cal(O)_(bb(P) \( E_m \)) \( 1 \)$ with
    $cal(O)_(bb(P) \( V \)) \( 1 \) ⊗ pi^(*) P$, proving the proposition. ◻
]

== 4 A necessary quadratic limit <sec:limit>

The power maps allow the fixed twist by $P$ to disappear in a limit.
  We prove that the quadratic structure survives at every base point,
  even where a raw pointwise limit need not be plurisubharmonic. The argument has four steps:
  trace the dual norms, normalize and extract their coefficient limit, prove that the limit is nonzero,
  and recover its intrinsic plurisubharmonic representative.
  We establish this statement for an arbitrary vector bundle on $S$.

#thm([Proposition 4.1.])[
  #emph[Let $G$ be a holomorphic vector bundle of positive rank on $S = bb(P)^1 times bb(P)^1$, and put $F =
    G^or$. Suppose that $f_m^(*) G ⊗ P$ admits a smooth strictly Griffiths-positive Hermitian metric for
    infinitely many positive integers $m$. Then there is a function
$ q : F arrow.r \[ 0 \, oo \) $

 which is plurisubharmonic on the total space, is not identically zero, and has the following property:
   for every $x in S$ there is a finite positive semidefinite Hermitian form $H_x$ on $F_x$ such that
$ q \( x \, v \) = H_x \( v \, v \) wide \( v in F_x \) . $

 In particular, this fiberwise assertion holds at every base point.]
] <prop:limit>

#proof[
  Put $r = "rank" G$. Choose an unbounded sequence of the indicated integers and let $parallel dot.op
    parallel_m$ denote the smooth dual metric on
  $ \( f_m^(*) G ⊗ P \)^or = f_m^(*) F ⊗ P^(- 1) . $
  Its squared norm is plurisubharmonic on the total space. We recall the sign in this standard implication.
    For a smooth Hermitian metric with matrix $h$, choose a holomorphic frame normal at the point in question,
    so that $h = "Id"$ and its first derivatives vanish there.
    Along a holomorphic disk with coordinate $zeta$, write the Hermitian curvature as $i C thin d zeta and
    d macron(zeta)$. In the convention used here,
  $ C = - frac(partial^2 h, partial zeta thin partial macron(zeta)) $
  at the normal point. Thus, for a holomorphic section $s$ along the disk,
  #[#set math.equation(numbering: n => "(4.1)")
   $ frac(partial^2, partial zeta thin partial macron(zeta)) parallel s parallel^2 =
     parallel D'_(partial \/ partial zeta) s parallel^2 - chevron.l C s \, s chevron.r . $ <eq:limit-dual-hessian>]
  Duality reverses Griffiths positivity, so the second term on the right is nonnegative for the dual metric.
    Applying this calculation to the section of the pulled-back bundle defined by any disk in its total space
    proves the assertion. For this classical norm criterion and duality,
    see #cite(label("Umemura1973")) Remark 1.3 and Lemma 1.7 and #cite(label("Raufi2015")) Section 2;
    the same implication is recorded in #cite(label("ForstnericKusakabe")) Proposition 2.6.
  #strong[Trace quadratics and normalization.] Fix, for each $m$,
    the holomorphic isomorphism $f_m^(*) P^(- 1) tilde.eq P^(- m)$.
    If $t$ is a nonvanishing holomorphic frame of $P^(- 1)$ on an open set $U subset S$, define on $F \|_U$
  #[#set math.equation(numbering: n => "(4.2)")
   $ q_(m \, t) \( x \, v \) = 1 / m^2 sum_(y in f_m^(- 1) \( x \)) parallel v ⊗ \( f_m^(*) t \)^(1 \/ m) \( y \)
     #scale(x: 120%, y: 120%)[parallel]_(m \, y)^2 \, $ <eq:limit-trace>]
  where the sum counts multiplicities. The root in this expression is local on the source.
    Indeed, in a local frame $s$ of $P^(- 1)$ the section $f_m^(*) t$ has the form $eta \( y \) s^m$,
    with $eta$ holomorphic and nowhere zero. A local holomorphic logarithm of $eta$ gives the root
    $exp \( \( log eta \) \/ m \) s$. Two choices differ by an $m$-th root of unity,
    which does not change the squared norm. The expression (4.2) is consequently well defined and is a positive
    definite Hermitian quadratic in $v$.
  We verify its regularity through the branch locus. Off that locus,
    every local inverse branch of $f_m$ gives a holomorphic map
  $ \( x \, v \) mapsto #scale(x: 120%, y: 120%)[\(] y \( x \) \,
    v ⊗ \( f_m^(*) t \)^(1 \/ m) \( y \( x \) \) #scale(x: 120%, y: 120%)[\)] $
  into $f_m^(*) F ⊗ P^(- 1)$. Hence each summand, and their sum, is plurisubharmonic.
    The unordered multiset of roots of $y^m = x$ varies continuously with $x$,
    counting coalescing roots with their multiplicities. Applied in the two factors,
    and using local source frames for the norm in (4.2), this proves continuity of the sum across the branch
    locus, including a crossing of its two components.
  The continuous trace is plurisubharmonic across the branch locus as well.
    In a local total-space chart, the inverse image of the branch locus under the bundle projection $F \|_U
    arrow.r U$ is an analytic set, contained in ${ z_1 z_2 = 0 }$ after choosing affine coordinates on the two
    base factors. It is therefore pluripolar. The trace is locally bounded above there by continuity,
    so the removable-singularities theorem for plurisubharmonic functions #cite(label("DemaillyCADG")) Chapter I,
    Theorem 5.24 gives a unique plurisubharmonic extension. Its upper-limit values agree with the continuous
    trace. This proves joint plurisubharmonicity of $q_(m \, t)$ on all of $F \|_U$.
  If $t' = g t$ is another nonvanishing frame, then
  #[#set math.equation(numbering: n => "(4.3)")
   $ q_(m \, t') \( x \, v \) = \| g \( x \) \|^(2 \/ m) q_(m \, t) \( x \, v \) . $ <eq:limit-frame-law>]
  Choose smooth background Hermitian norms $\| dot.op \|_0$ on $F$ and $P^(- 1)$. By (4.3), the continuous quadratic
  $ N_m \( x \, v \) = q_(m \, t) \( x \, v \) \| t \( x \) \|_0^(- 2 \/ m) $
  is globally defined. We use $N_m$ to normalize the traces globally;
    the local functions $q_(m \, t)$ retain the plurisubharmonicity used below.
    The background unit sphere bundle is compact, and $N_m$ is positive there.
    Multiplying the dual metric’s squared norm by a positive constant, we may therefore arrange
  #[#set math.equation(numbering: n => "(4.4)")
   $ max_(x in S \, med \| v \|_0 = 1) N_m \( x \, v \) = 1 . $ <eq:limit-normalization>]
  This rescaling does not change the curvature. Homogeneity gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ 0 lt.eq q_(m \, t) \( x \, v \) lt.eq \| t \( x \) \|_0^(2 \/ m) \| v \|_0^2 . $ <eq:limit-local-bound>]
  #strong[A measurable coefficient limit.] In a holomorphic trivialization of $F \|_U$, write
  $ q_(m \, t) \( x \, v \) = v^(*) H_m \( x \) v . $
  On each relatively compact subset of $U$, the positive matrices $H_m$ are uniformly bounded, by (4.5).
    Weak compactness in $L^2$ and a diagonal subsequence on a countable collection of charts and compact
    exhaustions give distributional limits $H$ for all the coefficient matrices.
    These limits belong to $L_(upright("loc"))^oo$, are Hermitian,
    and are positive semidefinite almost everywhere. For example,
    positivity and the same local upper bound pass to $c^(*) H
    c$ against every nonnegative test function for each $c in \( bb(Q) + i bb(Q) \)^r$;
    density then gives the matrix inequalities on a single set of full measure.
  The coefficient limits have the untwisted transition law of a form on $F$.
    More explicitly, let $v = T \( x \) w$ be a holomorphic change of bundle coordinates and let $t' = g t$.
    The original matrices satisfy
  $ H'_m = \| g \|^(2 \/ m) T^(*) H_m T . $
  On a compact subset $K$ of the overlap, the error obtained by deleting the scalar factor has,
    against a smooth compactly supported matrix test function $Phi$, the bound
  $ lr(|⟨#scale(x: 120%, y: 120%)[\(] \| g \|^(2 \/ m) - 1 #scale(x: 120%, y: 120%)[\)] T^(*) H_m T \, Phi⟩|)
    lt.eq C_K parallel Phi parallel_(L^1) sup_K \| \| g \|^(2 \/ m) - 1 #scale(x: 120%, y: 120%)[\|] arrow.r 0 . $
  Here the local matrix bound and the boundedness of $T$ are absorbed into $C_K$.
    Multiplication by the fixed smooth matrices $T \, T^(*)$ preserves distributional convergence,
    as does a change of base coordinates. Consequently $H' = T^(*) H T$ almost everywhere.
  #strong[Nonvanishing of the measurable limit.] The limiting measurable form is not zero.
    Choose maximizing unit vectors $\( x_m \, v_m \)$ in (4.4).
    After a further subsequence they converge in the compact unit sphere bundle to $\( x_(*) \, v_(*) \)$.
    This further subsequence retains all the distributional limits already obtained.
    In one fixed coordinate and frame chart around $x_(*)$, let $c_m arrow.r c$ be their fiber coordinates.
    Then $c eq.not 0$, and a local operator bound $parallel H_m parallel lt.eq C$ gives
  $ \| c^(*) H_m \( x_m \) c - c_m^(*) H_m \( x_m \) c_m #scale(x: 120%, y: 120%)[\|] lt.eq C \| c -
    c_m \| \( \| c \| + \| c_m \| \) arrow.r 0 . $
  On the other hand,
  $ c_m^(*) H_m \( x_m \) c_m = \| t \( x_m \) \|_0^(2 \/ m) arrow.r 1 \, $
  since the norm of the nonvanishing frame is bounded above and away from zero on a fixed compact neighborhood.
    Thus the nonnegative plurisubharmonic function $u_m \( x \) =
    c^(*) H_m \( x \) c$ satisfies $u_m \( x_m \) gt.eq 1 / 2$ for large $m$.
    Choose $𝜚 > 0$ so that $B \( x_(*) \, 4 𝜚 \)$ lies in the coordinate chart,
    and choose a fixed smooth nonnegative function $chi$ supported in $B \( x_(*) \, 3 𝜚 \)$ and equal to one on
    $B \( x_(*) \, 2 𝜚 \)$. For all sufficiently large $m$, the ball $B \( x_m \, 𝜚 \)$ lies in that latter ball.
    The submean inequality yields
  #[#set math.equation(numbering: n => "(4.6)")
   $ integral chi \( x \) c^(*) H_m \( x \) c thin d x gt.eq
     integral_(B \( x_m \, 𝜚 \)) u_m \( x \) thin d x gt.eq 1 / 2 "Vol" \( B \( 0 \, 𝜚 \) \) . $ <eq:limit-noncollapse>]
  The left side is a pairing against the fixed smooth matrix test function $chi c c^(*)$,
    so the inequality passes to $H$. It proves that $H$ is nonzero as a measurable form.
  #strong[A quadratic psh representative on every fiber.] The measurable form is defined only up to a set of
    measure zero in the base. Even a pointwise limit of the traces may fail to be plurisubharmonic:
    in one base variable, tracing $\( 1 + \| y \|^2 \) \| v \|^2$ through $x = y^m$ gives
  $ \( 1 + \| x \|^(2 \/ m) \) \| v \|^2 . $
  Its pointwise limit has coefficient $1$ at $x = 0$ and $2$ elsewhere,
    whereas its plurisubharmonic representative has coefficient $2$ everywhere.
    We now recover the intrinsic plurisubharmonic representative of our measurable form and show that it remains a
    Hermitian quadratic on every fiber.
  Convolution regularization of negative singular Hermitian metrics appears in #cite(label("BerndtssonPaun2008"))
    Section 3, Proposition 3.1 and #cite(label("Raufi2015")) Proposition 1.3(i);
    the use of polarization to recover an everywhere-defined representative is also discussed in
    #cite(label("PaunTakayama2018")) Remark 2.2.3. We supply the argument for the present possibly rank-deficient
    limit, including the compatibility of the representatives on overlaps.
    Work in a coordinate and bundle chart $U$, and let $rho$ be a nonnegative smooth radial function on $bb(C)^2$,
    supported in the unit ball and of integral one. Put
  $ rho_delta \( y \) = delta^(- 4) rho \( y \/ delta \) \, wide H_delta = H * rho_delta \, wide
    q_delta \( x \, v \) = v^(*) H_delta \( x \) v \, $
  on the interior domain where this convolution is defined. Convolving $H_m$ in the same way gives
  $ q_(m \, delta) \( x \, v \) = integral q_(m \, t) \( x - y \, v \) rho_delta \( y \) thin d y . $
  It is plurisubharmonic jointly in $\( x \, v \)$, since each base translation $\( x \, v \)
    mapsto \( x - y \, v \)$ is holomorphic and the average has nonnegative weights.
    For fixed $delta$, distributional convergence of $H_m$ implies convergence of the convolved coefficients and
    all their derivatives at every interior point: these are pairings against translates of derivatives of the
    fixed smooth kernel. The Levi matrices of $q_(m \, delta)$ therefore converge pointwise to that of $q_delta$.
    Hence $q_delta$ is smooth and plurisubharmonic, and on each smaller chart
  #[#set math.equation(numbering: n => "(4.7)")
   $ 0 lt.eq q_delta \( x \, v \) lt.eq C \| v \|^2 $ <eq:limit-convolution-bound>]
  for all sufficiently small $delta$.
  These quadratics decrease as $delta$ decreases. To check this for any fixed nonnegative radial kernel,
    write $rho \( y \) = phi.alt \( \| y \| \)$ and let $M_u \( x \, s \)$ denote the spherical mean of a
    subharmonic function $u$ on $bb(R)^4$. Polar coordinates give
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( u * rho_delta \) \( x \) = \| bb(S)^3 \| integral_0^1 M_u \( x \, delta s \) phi.alt \( s \) s^3 thin d
     s . $ <eq:limit-radial-means>]
  The spherical mean is nondecreasing in its radius. The integration weight in (4.8) is nonnegative and does not
    depend on $delta$, so the convolution is nondecreasing in $delta$.
    Apply this to $u \( x \) = q_(m \, t) \( x \, v \)$ for each constant $v$,
    then pass to the limit in $m$ at two fixed radii. It follows that
  $ H_(delta_1) \( x \) lt.eq H_(delta_2) \( x \) wide \( 0 < delta_1 < delta_2 \) $
  in the order of Hermitian forms.
  Thus $q_delta$ decreases, as $delta arrow.b 0$, to a finite nonnegative plurisubharmonic function $q_U$ on the
    total-space chart. The decreasing-limit assertion follows also by passing to the submean inequalities;
    see #cite(label("DemaillyCADG")) Chapter I, Theorem 5.4. Finiteness is supplied by (4.7).
    At every fixed base point $x$, this limit is a Hermitian quadratic.
    Indeed, all entries of $H_delta \( x \)$ are determined by the finite set of values at $e_j$, $e_j + e_k$,
    and $e_j + i e_k$, through
  $ 2 "Re" \( H_delta \)_(j k) & = q_delta \( x \, e_j + e_k \) - q_delta \( x \, e_j \) - q_delta \( x \, e_k \) \,\
2 "Im" \( H_delta \)_(j k) & = q_delta \( x \, e_j \) + q_delta \( x \, e_k \) - q_delta \( x \, e_j + i e_k \) . $
  Each value on the right has a finite limit. Hence the entries converge to one Hermitian matrix
    $hat(H)_U \( x \)$, and passage to the finite quadratic polynomial gives
  $ q_U \( x \, v \) = v^(*) hat(H)_U \( x \) v wide upright("for every ") v in bb(C)^r . $
  This matrix is positive semidefinite at every $x$, by nonnegativity.
    At almost every $x$, approximate-identity convergence also gives $hat(H)_U \( x \) = H \( x \)$.
  Finally these local representatives agree on overlaps. After the holomorphic change of bundle coordinates,
    their measurable matrices agree outside a base-null set, by the transition law already proved.
    The quadratic functions therefore agree for every fiber vector outside that set,
    hence almost everywhere in the total-space chart by Fubini’s theorem.
    Both functions are locally bounded and plurisubharmonic. Such a function is determined everywhere by its
    almost-everywhere values: the submean inequality and upper semicontinuity give, in local Euclidean coordinates,
  $ u \( p \) = lim_(epsilon arrow.b 0) frac(1, "Vol" \( B \( p \, epsilon \) \)) integral_(B \( p \, epsilon \)) u . $
  Thus the local $q_U$ glue to a single function $q$ on $F$.
    Its coefficients represent the original measurable form almost everywhere, so (4.6) implies $q equiv.not 0$.
    All the required pointwise and plurisubharmonic properties now hold. ◻
]

#prodef([Remark 4.2.])[
  The function in Proposition 6 represents a distributional limit;
    no convergence of restrictions to a divisor is asserted. The graph identities will instead be evaluated
    directly in this single everywhere-defined function $q$.
] <rmk:canonical-limit>

== 5 The invariant measure obstruction <sec:obstruction>

We now exclude the quadratic function produced by Proposition 6 for the graph-defined bundle $G$.
  The two rulings and the three graph identities force a nonzero squared seminorm on $cal(O)_(bb(P)^1) \( - b \)$
  that is invariant under the lifts of $A$ and $B$. We then turn that seminorm into a positive measure of mass $2
  pi b$ and show that the two transformations cannot preserve such a measure.

=== 5.1 From the two rulings to one invariant seminorm <from-the-two-rulings-to-one-invariant-seminorm>

#thm([Lemma 5.1.])[
  #emph[Let $G$ be the bundle of Proposition 4, and put $F = G^or$.
    Suppose that $q : F arrow.r \[ 0 \, oo \)$ is finite, plurisubharmonic, not identically zero,
    and a Hermitian quadratic form on every fiber. Then there is a finite, nonnegative,
    nonzero plurisubharmonic function $a_bullet$ on $cal(O)_(bb(P)^1) \( - b \)$,
    a Hermitian positive semidefinite quadratic on each fiber, such that
$ a_bullet \( M x \, M^(⊗ b) v \) = a_bullet \( x \, v \) wide \( M = A \, B \) $

 for every $x in bb(P)^1$ and $v in cal(O) \( - b \)_x$.]
] <lem:ruling-reduction>

#proof[
  Write $q \( x \, v \) = H_x \( v \, v \)$; nonnegativity says that every $H_x$ is positive semidefinite.
    Pull $q$ back by the line inclusions
  $ iota_i : L_i^(- 1) = p_i^(*) cal(O)_(bb(P)^1) \( - b \) arrow.r F \, wide i = 1 \, 2 . $
  For fixed $x_i in bb(P)^1$ and $v in cal(O) \( - b \)_(x_i)$,
    the function obtained by holding $v$ fixed while varying the other base coordinate is finite and subharmonic
    on the complementary $bb(P)^1$. It is constant by the maximum principle.
    Consequently $q compose iota_i$ descends to a finite nonnegative squared seminorm $a_i$ on
    $cal(O)_(bb(P)^1) \( - b \)$ over the $i$-th factor. Fixing any point in the other factor realizes $a_i$ as a
    holomorphic pullback of $q$, so $a_i$ is plurisubharmonic on the total line bundle.
  On $Gamma_M$, the identity $iota_2 alpha = iota_1$ from Proposition 4 and the definition of $alpha$ give
  #[#set math.equation(numbering: n => "(5.1)")
   $ a_1 \( x \, v \) = a_2 \( M x \, M^(⊗ b) v \) \, wide M in { "Id" \, A \, B } . $ <eq:seminorm-graph-identities>]
  The case $M = "Id"$ identifies $a_1$ and $a_2$ as a single function $a_bullet$ on $cal(O) \( - b \)$.
    This function is not identically zero. Indeed, if it were zero, then for every $x in.not D$,
    the form $H_x$ would vanish on each of two spanning lines. The inequality
  $ \| H_x \( v \, w \) \|^2 lt.eq H_x \( v \, v \) H_x \( w \, w \) $
  would then force $H_x = 0$. Hence $q$ would vanish on the full-measure complement of the inverse image of $D$ in
    $F$. Nonnegativity and the submean inequality on small total-space coordinate balls would give $q =
    0$ everywhere, a contradiction.
  The cases $M = A \, B$ of (5.1) give the asserted invariances under the holomorphic lifts $A^(⊗ b)$ and $B^(⊗ b)$. ◻
]

=== 5.2 Logarithmic weights and their measure <logarithmic-weights-and-their-measure>

The seminorm in Lemma 8 may vanish in some fibers. The next lemma shows that its logarithmic weights still define
  a positive measure with the mass dictated by the negative line bundle.
  This is the rank-one squared-norm/logarithmic-norm principle from singular Hermitian metric theory
  #cite(label("BerndtssonPaun2008")) Section 3 and #cite(label("Raufi2015")) Definition 1.2 and Section 2.
  We prove local integrability at zeros before taking distributional curvature,
  so all possible atoms remain in the mass calculation.

#thm([Lemma 5.2.])[
  (Logarithmic curvature of a squared seminorm).  #emph[Let $L$ be a holomorphic line bundle on a connected
    Riemann surface $C$. Suppose that $a_bullet : L arrow.r \[ 0 \, oo \)$ is finite, plurisubharmonic,
    and not identically zero, and that its restriction to every fiber is a Hermitian positive semidefinite
    quadratic form. In a nonvanishing holomorphic frame $e$ on $U subset C$, write
$ a_bullet \( z \, w e \( z \) \) = u_e \( z \) \| w \|^2 . $

 Then $log u_e$, with the value $- oo$ allowed, is subharmonic and locally integrable.
   The local measures $i partial macron(partial) log u_e$ define a positive Radon measure $mu$ on $C$.]
  #emph[If a holomorphic bundle automorphism $tilde(T) : L arrow.r L$ covers an automorphism $T : C arrow.r
    C$ and satisfies $a_bullet compose tilde(T) = a_bullet$, then $T^(*) mu = mu$.
    If $C = bb(P)^1$ and $L = cal(O)_(bb(P)^1) \( - b \)$ with $b gt.eq 1$, then
#[#set math.equation(numbering: n => "(5.2)")
 $ mu \( bb(P)^1 \) = 2 pi b . $ <eq:seminorm-curvature-mass>]

]
] <lem:seminorm-curvature>

Where $u_e$ is smooth and strictly positive, $i partial macron(partial) log
  u_e$ is the negative of the Chern curvature of the corresponding metric in our convention.
  This accounts for the positive mass when $L = cal(O) \( - b \)$.

#proof[
  Fix a coordinate disk $U$ and a frame $e$, and abbreviate $u_e$ to $u$.
    The function $u$ is finite, nonnegative, subharmonic, and locally bounded,
    by restriction to the holomorphic section $e$. Choose a nonnegative smooth radial function $rho$ supported in
    the unit disk, with integral one, and put
  $ rho_delta \( z \) = delta^(- 2) rho \( z \/ delta \) \, wide u_delta = u * rho_delta + delta . $
  These functions are defined on the interior of $U$ for sufficiently small $delta > 0$.
    Averaging the holomorphic base translations $\( z \, w \)
    mapsto \( z - zeta \, w \)$ shows that $\( u * rho_delta \) \( z \) \| w \|^2$ is plurisubharmonic.
    Adding $delta \| w \|^2$ preserves this property, so $u_delta > 0$ and $u_delta \( z \) \|
    w \|^2$ is smooth and plurisubharmonic. Its Levi matrix at $w = 1$ is
  $ mat(delim: "(", \( u_delta \)_(z macron(z)), \( u_delta \)_z; \( u_delta \)_(macron(z)), u_delta) . $
  Its nonnegative determinant gives
  $ \( log u_delta \)_(z macron(z)) =
    frac(u_delta \( u_delta \)_(z macron(z)) - \| \( u_delta \)_z \|^2, u_delta^2) gt.eq 0 . $
  Thus $f_delta := log u_delta$ is subharmonic.
  The radial convolutions are nonnegative weighted averages of circular means of $u$.
    These means increase with their radii, and converge to $u$ as the radii tend to zero. Consequently
  $ u_delta arrow.b u \, wide f_delta arrow.b log u quad upright("as ") delta arrow.b 0 . $
  We establish local integrability before taking distributional derivatives of the limit.
    Suppose that $u \( z_0 \) > 0$, and choose $R > 0$ with $overline(B \( z_0 \, R \)) subset U$.
    For all sufficiently small $delta$, local boundedness supplies a constant $C_0 gt.eq
    0$ such that $f_delta lt.eq C_0$ on this disk. Moreover $f_delta \( z_0 \) gt.eq log u \( z_0 \)$.
    Integrating the circular submean inequality over the radius gives
  $ integral_(B \( z_0 \, R \)) f_delta thin d A gt.eq pi R^2 log u \( z_0 \) . $
  Writing $f^(-) := max { - f \, 0 }$, we obtain the explicit bound
  #[#set math.equation(numbering: n => "(5.3)")
   $ integral_(B \( z_0 \, R \)) f_delta^(-) thin d A lt.eq pi R^2 #scale(x: 120%, y: 120%)[\(] C_0 -
     log u \( z_0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:log-negative-part>]
  The negative parts increase as $delta$ decreases, whereas the positive parts are bounded by $C_0$.
    Monotone convergence therefore proves $log u in L^1 \( B \( z_0 \, R \) \)$.
    It also gives $f_delta arrow.r log u$ in $L^1$ on this disk.
  This conclusion propagates throughout $C$. Indeed, let $Omega$ consist of the points near which a local
    logarithmic weight is integrable. A frame change $e' = g e$ gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ log u_(e') = log u_e + log \| g \|^2 \, $ <eq:log-frame-change>]
  so $Omega$ is independent of the chosen frame. It is open and nonempty:
    nontriviality of $a_bullet$ supplies a point with $u > 0$, to which (5.3) applies.
    If $x$ is in the boundary of $Omega$, choose a coordinate disk containing $overline(B \( x \, 4 r \))$.
    There is a small open disk contained in $Omega ∩ B \( x \, r \)$.
    On that disk integrability of $log u$ implies $u > 0$ almost everywhere,
    so it contains a point $z_0$ with $u \( z_0 \) > 0$. The disk $B \( z_0 \, 2 r \)$ has closure in the original
    chart and contains a neighborhood of $x$. Applying (5.3) on this larger disk proves $x in Omega$.
    Thus $Omega$ is also closed, and connectedness gives $Omega = C$.
  On every relatively compact disk, $C_0 - f_delta$ increases to the integrable function $C_0 - log u$.
    Hence the local convergence is in $L^1$, and the decreasing limit $log u$ is subharmonic.
    In particular, $i partial macron(partial) log u$ is a positive distribution and thus a positive Radon measure.
    Since $g$ in (5.4) is holomorphic and nowhere zero, $log \| g \|^2$ is harmonic.
    The local measures therefore glue to $mu$.
  For the invariance assertion, choose frames $e$ on $U$ and $e'$ on $V$ with $T \( U \) subset V$, and write
  $ tilde(T) \( e \( z \) \) = c \( z \) e' \( T z \) \, $
  where $c$ is holomorphic and nowhere zero. The isometry condition gives
  $ u_e \( z \) = \| c \( z \) \|^2 u_(e') \( T z \) \, wide log u_e = log \| c \|^2 + \( log u_(e') \) compose T . $
  Taking distributional $i partial macron(partial)$, which commutes with pullback by the holomorphic
    diffeomorphism $T$, gives $mu = T^(*) mu$. Here pullback is that of a top-degree current: for a test function $phi$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ integral_C phi thin d \( T^(*) mu \) = integral_C \( phi compose T^(- 1) \) thin d mu . $ <eq:measure-pullback>]
  Equivalently, $\( T^(*) mu \) \( E \) = mu \( T \( E \) \)$ for Borel sets $E$.
    This is ordinary measure invariance under the bijection $T$; in particular, $T^(*) delta_p =
    delta_(T^(- 1) p)$ with unchanged atom mass.
  Finally suppose $C = bb(P)^1$ and $L = cal(O) \( - b \)$.
    Let $h_0$ be the smooth Hermitian metric on $cal(O) \( - b \)$ induced by the standard norm on $bb(C)^2$.
    In the tautological affine frame $e \( z \) = \( 1 \, z \)^(⊗ b)$ its weight is
  $ u_0 \( z \) = h_0 \( e \( z \) \, e \( z \) \) = \( 1 + \| z \|^2 \)^b . $
  The local functions $log u_e - log h_0 \( e \, e \)$ define a single globally integrable function $Phi$ on
    $bb(P)^1$, by the common frame law. If $mu_0 = i partial macron(partial) log h_0 \( e \, e \)$, then
  $ mu - mu_0 = i partial macron(partial) Phi \, wide integral_(bb(P)^1) \( mu - mu_0 \) =
    chevron.l i partial macron(partial) Phi \, 1 chevron.r = 0 . $
  The measure $mu$ is finite because it is locally finite on the compact sphere.
    With the convention $i partial accent(partial f, ‾) = i f_(z macron(z)) thin d z and d macron(z)$,
    the smooth reference measure has mass
  $ integral_(bb(P)^1) mu_0 = integral_(bb(C)) frac(b thin i thin d z and d macron(z), \( 1 + \| z \|^2 \)^2) =
    4 pi b integral_0^oo frac(r thin d r, \( 1 + r^2 \)^2) = 2 pi b . $
  This proves (5.2). Zeros of $u_e$ and any atoms of $mu$ are included in the distributional calculation;
    no points have been excised. ◻
]

=== 5.3 The incompatible invariances <the-incompatible-invariances>

We now use the special dynamics of the two matrices. Concentration of invariant measures on proper projective
  subsets is a classical mechanism; see #cite(label("Furstenberg1976")) Lemma 2 and the proof of Lemma 3.
  The following elementary argument gives precisely the rank-two statement needed here.

#thm([Lemma 5.3.])[
  #emph[The projective transformations induced by the matrices $A$ and $B$ in (2.1) preserve no nonzero finite
    positive Borel measure on $bb(P)^1$.]
] <lem:no-invariant-measure>

#proof[
  Suppose that $mu$ is such a measure. It is invariant under $T = A B$.
    The two eigenvalues of $A B$ have distinct moduli, so after a projective change of coordinate $T$ acts as $z
    mapsto lambda z$ with $R := \| lambda \| > 1$. The Borel sets
  $ C_n = { z in bb(C)^(*) : R^n lt.eq \| z \| < R^(n + 1) } \, wide n in bb(Z) \, $
  are pairwise disjoint, cover $bb(C)^(*)$, and satisfy $T \( C_n \) = C_(n + 1)$. Each has the same measure.
    Finiteness and positivity imply that this common measure is zero,
    and countable additivity gives $mu \( bb(C)^(*) \) = 0$. The half-open annuli assign every boundary circle to
    exactly one set, so this argument applies equally to atomic and diffuse measures and to nonreal $lambda$.
  Thus the nonempty support of $mu$ consists of one or two of the fixed points of $T$.
    Invariance under $A$ and $B$ preserves this support as a set:
    the inverse image of an open neighborhood of the image of a support point has positive measure.
    Both projective transformations have order three. Their induced permutations on a set of at most two points
    are therefore trivial. Each point of the support would be fixed by both $A$ and $B$,
    and hence would be a common eigenline of the two matrices. Lemma 2 excludes such a line. ◻
]

The preceding results rule out exactly the object supplied by Proposition 6.

#thm([Proposition 5.4.])[
  #emph[For the bundle $G$ of Proposition 4, every finite nonnegative plurisubharmonic function on the total space
    of $F = G^or$ whose restriction to each fiber is a Hermitian quadratic form is identically zero.]
] <prop:obstruction>

#proof[
  If such a function were nonzero, Lemma 8 would give a nonzero squared seminorm on $cal(O)_(bb(P)^1) \( - b \)$
    invariant under the lifts of $A$ and $B$. Lemma 9 would then produce a finite positive measure on $bb(P)^1$ of
    mass $2 pi b > 0$, invariant under both projective transformations. This contradicts Lemma 10. ◻
]

== 6 Proof of the main theorem <sec:conclusion>

#proof[
  Take the algebraic rank-two bundle $G$ of Proposition 4. By Proposition 5, every $E_m =
    f_m^(*) G ⊗ P$ is ample in the quotient convention.
  If the set of positive integers $m$ for which $E_m$ has a smooth strictly Griffiths-positive metric were
    infinite, it would contain a sequence tending to infinity.
    Proposition 6 would then give a finite, nonnegative, nonzero psh function on the total space of $G^or$ that is
    a Hermitian positive semidefinite quadratic form on every fiber.
    Proposition 11 excludes precisely such a function. Consequently that set of integers is finite.
    Choose $m_0$ larger than all its elements, taking $m_0 = 1$ if the set is empty.
    Every $m gt.eq m_0$ gives the required counterexample. ◻
]

The limit in the proof is permitted to lose rank, but not to vanish identically or to lose its quadratic structure
  at any base point. These are exactly the properties needed to transfer the graph relations to a nonzero
  invariant measure. The argument requires no uniform estimates for the input metrics or their curvature,
  and it does not determine an effective value of $m_0$.

#bibliography("refs.bib", style: "ieee", title: [References])
