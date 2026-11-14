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

#align(center)[#text(size: 16pt, weight: "bold")[Cuntz comparison and Jiang--Su absorption]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Comparison asks whether numerical size determines order among positive operators.
  Divisibility asks whether those operators can be split into pieces of nearly equal size.
  For nuclear $C^(*)$-algebras, these questions are tied to tensorial absorption of the Jiang–Su algebra $cal(Z)$:

$ A tilde.equiv A ⊗_min cal(Z) . $

Jiang and Su constructed $cal(Z)$ as a simple infinite-dimensional unital algebra with the Elliott invariant of
  the complex numbers [19]. Its absorption is a central regularity property in the classification program.
  The purpose of this paper is to pass from comparison and divisibility in the Cuntz semigroup to this tensorial
  regularity, including algebras without a unit and algebras with ideals.

=== 1.1 Comparison and the simple theorem <comparison-and-the-simple-theorem>

All algebras in this paper are complex. Let $cal(K)$ be the compact operators on a separable infinite-dimensional
  Hilbert space. For $a \, b in \( A ⊗ cal(K) \)_(+)$, write $a prec.tilde b$ if $v_j^(*) b v_j arrow.r
  a$ in norm for some sequence $\( v_j \)$ in $A ⊗ cal(K)$. Mutual comparison defines the Cuntz classes $\[ a \]$.
  Their ordered semigroup $upright("Cu") \( A \)$ has addition given by orthogonal sum and suprema of increasing
  sequences [12]. A #emph[functional] on $upright("Cu") \( A \)$ is a map to $\[ 0 \, oo \]$ preserving zero,
  addition, order, and increasing suprema. Write $upright(F) \( upright("Cu") \( A \) \)$ for the cone of all
  these functionals.

We use the following precise extended-functional convention for #emph[strict comparison]:
  for every $x \, y in upright("Cu") \( A \)$,

#[#set math.equation(numbering: n => "(1.1)")
 $ phi \( x \) & lt.eq phi \( y \) &  & upright("for every ") phi in upright(F) \( upright("Cu") \( A \) \) \,\
phi \( x \) & < phi \( y \) &  & upright("whenever ") 0 < phi \( y \) < oo} quad arrow.r.double quad x lt.eq
  y . $ <ext:eq:comparison>]

The second line concerns the same cone of functionals. Arithmetic at zero and infinity is extended nonnegative
  arithmetic; in particular, strict inequality is required precisely at positive finite target values.
  An algebra is #emph[non-elementary] if it is not isomorphic to the compact operators on any Hilbert space.

#thm([Theorem 1.1.])[
  (Simple comparison and absorption).  #emph[Let $A$ be a separable simple nuclear non-elementary $C^(*)$-algebra.
    If $A$ has strict comparison in the sense of Equation (1.1), then $A tilde.equiv A ⊗_min cal(Z)$.]
] <ext:thm:main>

Rørdam proved that $cal(Z)$-absorption forces almost unperforation of the finite-matrix Cuntz semigroup and,
  in the simple exact unital setting, the corresponding trace comparison theorem [26] Theorem 4.5 and
  Corollary 4.6. The reverse implication is the strict-comparison-to-$cal(Z)$-stability part of the Toms–Winter
  regularity problem; see [30] Conjecture 5 and Problem XVIII.
  Theorem 1 gives a positive resolution of this implication with the extended-functional convention above.
  Its nonunital formulation includes stably projectionless algebras and allows unbounded traces.

The comparison argument has a stronger intermediate scope.
  Theorem 11 proves, for every simple exact non-elementary $A$ satisfying Equation (1.1),
  that each $x in upright("Cu") \( A \)$ and integer $N gt.eq 1$ admit a single class $u$ with $N u lt.eq
  x lt.eq \( N + 1 \) u$. Neither separability nor nuclearity enters that theorem.
  Nuclearity is used in constructing central maps from this order-theoretic information.

=== 1.2 The nonsimple absorption mechanism <the-nonsimple-absorption-mechanism>

The first order property we require is #emph[almost unperforation]:

#[#set math.equation(numbering: n => "(1.2)")
 $ \( l + 1 \) x lt.eq l y quad arrow.r.double quad x lt.eq
   y wide \( x \, y in upright("Cu") \( A \) \, med l gt.eq 1 \) . $ <eq:pre:au>]

The second is #emph[full almost divisibility]: for every $x in upright("Cu") \( A \)$ and integer $N gt.eq 1$,
  there is $u in upright("Cu") \( A \)$ such that

#[#set math.equation(numbering: n => "(1.3)")
 $ N u lt.eq x lt.eq \( N + 1 \) u . $ <eq:pre:div>]

Here $l$ is also an integer. We call the conjunction of these two properties (C).
  The same class $u$ must satisfy both inequalities in Equation (1.3).

The comparison convention in Equation (1.1) is equivalent to almost unperforation of $upright("Cu") \( A \)$ [15]
  Proposition 6.2. Lemma 6 explains this equivalence, including the zero and infinite values.
  Thus the extended-functional formulation agrees with the usual Cuntz-semigroup comparison condition.

To state the central conclusion, fix a free ultrafilter $omega$ on $bb(N)$.
  The norm ultrapower and its central annihilator quotient are

$ A_omega = ell^oo \( bb(N) \, A \) \/ { \( a_n \) : lim_(n arrow.r omega) parallel a_n parallel = 0 } \, wide
  F_omega \( A \) = \( A_omega ∩ A' \) \/ "Ann" \( A \) \, $

where $A$ is the constant copy and $"Ann" \( A \) = { z in A_omega : z A = A z = 0 }$.
  For separable $A$, a sequential approximate unit represents the unit of $F_omega \( A \)$.
  The zero algebra absorbs $cal(Z)$ immediately; the central-map statement below is formulated for nonzero algebras.

#thm([Theorem 1.2.])[
  (Absorption from condition (C)).  #emph[Let $A$ be a nonzero separable nuclear $C^(*)$-algebra satisfying (C).
    For every fixed free ultrafilter $omega$ on $bb(N)$, there is a unital $*$-homomorphism $cal(Z) arrow.r
    F_omega \( A \)$. Consequently $A tilde.equiv A ⊗_min cal(Z)$.]
] <thm:condition-C>

#thm([Corollary 1.3.])[
  (The canonical Cuntz-semigroup map).  #emph[Let $A$ be a separable nuclear $C^(*)$-algebra, and let $iota :
    A arrow.r A ⊗_min cal(Z)$ be $iota \( a \) = a ⊗ 1_(cal(Z))$.
    If $upright("Cu") \( iota \) : upright("Cu") \( A \) arrow.r
    upright("Cu") \( A ⊗_min cal(Z) \)$ is an isomorphism, then $A tilde.equiv A ⊗_min cal(Z)$.]
] <cor:canonical>

The isomorphism in this hypothesis is the map induced by $iota$.
  Corollary 3 resolves positively implication (iii)$arrow.r.double$(ii) in the nonsimple Toms–Winter problem [30]
  Section 22, Problem LXXV. It applies to every separable nuclear $A$ with the indicated canonical map;
  an additional restriction on its elementary ideal subquotients is unnecessary.

Condition (C) depends only on the ordered-semigroup structure.
  Consequently, the same absorption theorem also removes the requirement that the Cuntz-semigroup isomorphism be
  the canonical one.

#thm([Corollary 1.4.])[
  (An abstract Cuntz-semigroup criterion).  #emph[Let $A$ be a separable nuclear $C^(*)$-algebra. Then
$ A tilde.equiv A ⊗_min cal(Z) quad arrow.l.r.double quad
  upright("Cu") \( A \) tilde.equiv upright("Cu") \( A ⊗_min cal(Z) \) upright(" in the category ")
  upright(bold(C u)) . $

 The isomorphism on the right is abstract: it is not required to be induced by the first-factor embedding,
   or by any $*$-homomorphism.]
] <cor:abstract-cu>

Here the category $upright(bold(C u))$ retains zero, addition, order, increasing sequential suprema,
  and the way-below relation of the Cuntz semigroup. Corollary 4 answers positively the abstract Cuntz-semigroup
  question in [30] Section 9, Problem XXVI, without assuming unitality, simplicity, or stable finiteness.
  Separability and nuclearity remain hypotheses.

=== 1.3 History and the main obstacles <history-and-the-main-obstacles>

The comparison of positive elements and their dimension functions goes back to Cuntz and Blackadar–Handelman
  [13,5]. The completed Cuntz semigroup of Coward–Elliott–Ivanescu [12] makes increasing suprema part of the
  invariant. Elliott–Robert–Santiago’s correspondence [15] identifies its functionals with lower semicontinuous
  extended quasitraces. For exact algebras, Haagerup’s additivity theorem [17],
  in the extended form of Blanchard–Kirchberg recalled in [15] Remark 4.3, makes these quasitraces traces.
  The associated rank is $d_tau \( a \) = lim_n tau \( a^(1 \/ n) \)$:
  the functional corresponding to $tau$ sends $\[ a \]$ to $d_tau \( a \)$.

The reverse comparison implication has a substantial history of partial results.
  Matui and Sato proved it for unital separable simple nuclear infinite-dimensional algebras with finitely many
  extremal traces, using excision in small central sequences and property (SI) [22] Theorem 1.1.
  Sato, Kirchberg–Rørdam, and Toms–White–Winter extended the tracial-boundary approach to nonempty compact extreme
  boundaries of finite covering dimension [29] Corollary 1.2, [21] Corollary 7.9, [32] Corollary 4.7.
  Castillejos, Evington, Tikuisis, and White isolated the remaining uniform central divisibility in trace:
  for simple separable unital nuclear algebras with nonempty tracial state space,
  strict comparison together with uniform property $Gamma$ is equivalent to $cal(Z)$-stability [8] Theorem 5.6.
  Uniform property $Gamma$ requires approximately central partitions that split the trace values of finitely many
  elements evenly, uniformly over all traces. The present argument constructs central maps from condition (C)
  without imposing a tracial-boundary or uniform-$Gamma$ hypothesis.

The Toms–Winter problem also links these properties to finite nuclear dimension,
  a finite-colour form of completely positive approximation.
  Winter’s absorption theorem and the converse of Castillejos, Evington, Tikuisis, White,
  and Winter establish the equivalence of finite nuclear dimension and $cal(Z)$-stability in the simple separable
  unital nuclear non-elementary setting [34] Corollary 6.3 [9] Theorem A.
  The comparison implication is the remaining direction addressed here.

The distinction between comparison and divisibility is already visible in the range of possible rank functions of
  positive elements. Thiel proved that strict comparison yields almost divisibility and the canonical
  Cuntz-semigroup isomorphism for separable simple unital non-elementary algebras of stable rank one [31]
  Corollary 8.12. Theorem 11 uses exactness without a stable-rank-one hypothesis.
  The fractional spectral discretization in Dadarlat–Toms [14] Theorem 5.1 and its proof follows earlier
  rank-realization ideas of Brown–Perera–Toms [7] Section 5.
  Our first construction moves trace values into a hereditary subalgebra of small rank before taking integer
  spectral cuts. The resulting error is at most one support rank,
  regardless of the norm of the transferred element or the number of spectral levels.
  Proposition 14 gives the unital uniform-trace version of this elementary construction.

For nonunital algebras, there may be no normalized trace space on which all errors can be bounded.
  The substitute is one fixed nonzero spectral cut of the element being divided.
  Simplicity makes its rank positive and finite for every functional that is finite and positive somewhere,
  even when the original element has infinite rank. We measure all rounding errors relative to this same cut and
  make them summable. Zero functionals and functionals infinite on every nonzero class are handled separately.
  This keeps the full extended trace cone available without requiring a common normalization;
  the precise three-way distinction is proved in Lemma 8.

Comparison and divisibility are also studied together through the notion of pureness.
  For the completed semigroup, the usual almost divisibility condition asks for $N u lt.eq
  x$ and $x' lt.eq \( N + 1 \) u$ whenever $x'$ is compactly contained in $x$;
  together with almost unperforation this defines pureness [2].
  Full almost divisibility as used here implies that condition.
  For separable simple unital non-elementary algebras of locally finite nuclear dimension,
  Winter proved that pureness implies Jiang–Su absorption [34] Corollary 6.2.
  Under the same local nuclear-dimension hypothesis, he also obtained an abstract criterion using $W \( A \)$,
  the Cuntz semigroup of positive elements in finite matrices over $A$ [34] Corollary 6.4.
  Corollary 4 instead uses the completed invariant $upright("Cu") \( A \)$ and has no local nuclear-dimension
  assumption. The tensor-product approach to regularity of abstract Cuntz semigroups was developed by Antoine,
  Perera, and Thiel [2]; more recent work of Antoine, Perera, Thiel,
  and Vilalta characterizes pureness by controlled comparison and functional divisibility [3] Theorem C.
  Regularity of $upright("Cu") \( A \)$ and regularity of the central sequence algebra are distinct inputs.
  In particular, Perera, Thiel, and Vilalta characterize Jiang–Su absorption by pureness of the central sequence
  algebra for every separable $A$ [24] Theorem 3.6. Theorem 2 constructs the required central structure from the
  stated order properties of $upright("Cu") \( A \)$ itself.

For the central construction, a #emph[matrix cone] means a completely positive contractive order-zero map from
  $M_k$: it preserves orthogonality of positive elements. Its #emph[weight] is the image of $1_(M_k)$.
  Norm-central cones take values in $A_omega ∩ A'$, with coordinate maps whose centrality and order-zero errors
  tend to zero along $omega$.

Robert and Tikuisis developed a nonsimple route from regularity to central structure using finite nuclear
  dimension [25] Theorem 1.1. For separable algebras of finite nuclear dimension,
  they characterized absorption by the existence of two full orthogonal elements in the central sequence algebra
  [25] Theorem 1.2. Our hypothesis is instead the order condition (C), with no bound on nuclear dimension.
  The nonsimple problem has a different obstruction. A positive element can be large in every representation of
  interest without a single uniform integer controlling all the associated ideal comparisons.
  At the same time, traces may be finite only after hereditary localization.
  The proof treats these two forms of largeness separately.
  Pure-state compression and support shrinking construct norm-visible central matrix cones.
  Convex order-zero nuclear approximations, originating in the work of Hirshberg, Kirchberg,
  and White [18] and refined by Brown, Carrión, and White [6], supply cones large for bounded traces.
  We localize the latter estimates and then remove a relative trace ideal to obtain norm centrality.

The matrix-cone calculus uses Winter and Zacharias’s structure theorem for order-zero maps [35].
  The final packing step is an instance of Gabe’s approximate domination theorem [16];
  its weighted-inclusion form is proved here. Choi–Effros lifting and Arveson extension allow us to retain
  completely positive maps during diagonalization [10,4]. The absorption step uses the structural properties of
  $cal(Z)$ established by Jiang–Su, Toms–Winter, and Rørdam–Winter [19,33,27].
  Nawata’s nonunital central dimension-drop criterion [23] Proposition 5.1 is implemented here by an explicit
  lifting and intertwining argument.

=== 1.4 Proof strategy and organization <proof-strategy-and-organization>

Figure 1 separates the two routes into condition (C) from the common central-sequence argument.
  The full proof of Theorem 2 is contained in this paper. Its concrete target, for each $p gt.eq 2$,
  is a matrix cone $alpha : M_p arrow.r F_omega \( A \)$ and an element $s$ with

$ s^(*) s = 1 - alpha \( 1 \) \, wide alpha \( e_11 \) s = s . $

Thus $s$ fills the cone’s defect inside one diagonal corner.
  These relations give a unital map from the prime dimension-drop algebra $I \( p \, p + 1 \)$,
  whose continuous functions on $\[ 0 \, 1 \]$ take values in $M_p ⊗ M_(p + 1)$ and have endpoint values in $M_p ⊗
  1$ and $1 ⊗ M_(p + 1)$, respectively. Such maps supply the central copy of $cal(Z)$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[Simple exact non-elementary algebra: extended-functional comparison
], table.cell(rowspan: 1, colspan: 1)[Separable nuclear algebra:
  abstract $upright("Cu") \( A \) tilde.equiv upright("Cu") \( A ⊗ cal(Z) \)$
],
  table.cell(rowspan: 1, colspan: 1)[rounding and comparison arithmetic $arrow.b$
], table.cell(rowspan: 1, colspan: 1)[$arrow.b$ transfer of tensor regularity
],
  table.cell(rowspan: 1, colspan: 2, align: center)[Condition (C): almost unperforation and full almost divisibility
],
  table.cell(rowspan: 1, colspan: 2, align: center)[#emph[Under separability and nuclearity:]
],
  table.cell(rowspan: 1, colspan: 1)[Norm-visible cones fix the coordinate multiplicities
], table.cell(rowspan: 1, colspan: 1)[Localized tracial cones choose relative errors afterwards
],
  table.cell(rowspan: 1, colspan: 2, align: center)[$arrow.b$ bounded comparison witnesses and central slots
],
  table.cell(rowspan: 1, colspan: 2, align: center)[$arrow.b$ central defect filler and dimension-drop maps
],
  table.cell(rowspan: 1, colspan: 2, align: center)[$cal(Z) arrow.r F_omega \( A \) quad arrow.r.double quad A tilde.equiv A ⊗ cal(Z)$
],
)
]],
  caption: [Figure 1: The order of the constructions. The simple comparison route supplies condition (C) already under exactness. Both absorption routes then use the same separable nuclear construction. The norm-cone multiplicities are fixed before the localized trace accuracies. ],
) <fig:proof-flow>

Section 2 introduces the common Cuntz-semigroup and trace conventions,
  together with the support calculus for spectral cuts. Sections 3–5 then prove the simple exact
  almost-divisibility theorem. Trace values are transferred to successively smaller hereditary supports,
  rounded at integer levels, and summed in one norm-convergent stable block sum.
  A fixed nonzero cut controls the summable errors even when the original class has infinite functional value.
  Comparison supplies the two sides of the divisibility sandwich, completing the simple route to condition (C).

Section 6 begins the common absorption argument. It derives condition (C) from the canonical Cuntz-semigroup map
  and develops its consequences for rank comparison and divisible matrix cones.
  It also records the ultrapower and bounded diagonalization tools used in the central constructions.
  Sections 7 and 8 construct the norm-visible cones. Two-support shrinking preserves the representations detecting
  a prescribed positive cut while making cross terms small.
  Pure-state word models can then be combined into approximately central matrix cones.
  Their norm visibility supplies finite coordinate ideal multiplicities.
  Sections 9 and 10 construct the tracial cones. Two support compressions keep their errors independent of the
  number of nuclear approximation summands; hereditary localization and a relative trace ideal turn tracial
  centrality into norm centrality.

Section 11 combines these constructions in that order. Its trace accuracies depend on the already fixed ideal
  multiplicities. Spectral margins first produce exact coordinate Cuntz inequalities and then bound the comparison
  witnesses independently of matrix size. This permits a slowly growing supply of orthogonal equivalent central
  slots. Section 12 packs finite simultaneous compressions into those slots;
  approximate-unit tests make the packed element bounded and central.
  Section 13 turns the resulting relations into dimension-drop maps,
  constructs a single unital central copy of $cal(Z)$, and performs the nonunital intertwining.
  Section 14 assembles the four stated results.

== 2 Cuntz comparison and support calculus <sec:preliminaries>

We collect the comparison and trace facts used by both routes into condition (C).
  Cut placement lets us move positive elements into prescribed hereditary subalgebras.
  The trace correspondence then makes numerical estimates available to the Cuntz semigroup,
  with zero and infinite values retained.

All tensor products are spatial unless a maximal tensor product is explicitly indicated.
  Unitization is denoted by a tilde. We permit the adjoined unit in formulas,
  but maps and constructed elements take values in the stated algebra.
  We write $cal(K)$ for the compact operators on a separable infinite-dimensional Hilbert space.

For $b in D_(+)$, set

$ "her"_D \( b \) = overline(b D b) \, wide "Ideal"_D \( b \) = overline("span") \( D b D \) \, wide p_b =
  1_(\( 0 \, oo \)) \( b \) in D^(* *) . $

The ambient algebra is omitted when clear. Spectral projections are also used in representations.
  A comparison or support relation for a matrix over $D$ is understood in the corresponding matrix amplification.

=== 2.1 Order zero and the Cuntz semigroup <order-zero-and-the-cuntz-semigroup>

A completely positive contractive map is abbreviated c.p.c.
  It has #emph[order zero] if it preserves orthogonality of positive elements.
  For a c.p.c. order-zero map $theta : E arrow.r D$ with unital domain, the order-zero structure theorem [35] gives

$ theta \( z \) = h rho \( z \) = rho \( z \) h \, wide h = theta \( 1 \) \, wide rho \( 1 \) = p_h \, $

where $rho : E arrow.r D^(* *)$ is a supporting homomorphism. Its elements act as multipliers on $"her" \( h \)$.
  If $f : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ is continuous and $f \( 0 \) = 0$,
  then $f \( h \) rho \( z \)$ belongs to $D$ and defines another c.p.c. order-zero map, denoted $f \( theta \)$.
  A #emph[matrix cone] means a c.p.c. order-zero map from $M_k$, for some $k$.

For $a \, b in \( D ⊗ cal(K) \)_(+)$, the notation $a prec.tilde b$ means that $r_j^(*) b r_j arrow.r
  a$ in norm for suitable $r_j in D ⊗ cal(K)$. The Cuntz semigroup $upright("Cu") \( D \)$ consists of equivalence
  classes for the associated mutual comparison relation, with addition given by orthogonal sum.
  We use its usual sequential-supremum structure [12]; in particular,

#[#set math.equation(numbering: n => "(2.1)")
 $ \[ \( a - epsilon.alt \)_(+) \] lt.double \[ a \] \, wide \[ a \] =
   sup_(epsilon.alt > 0) \[ \( a - epsilon.alt \)_(+) \] . $ <eq:pre:cuts>]

Here $x lt.double y$ means that whenever an increasing sequence has supremum at least $y$,
  one of its terms is at least $x$. We will use $\[ a + c \] lt.eq \[ a \] + \[ c \]$ and the identities

#[#set math.equation(numbering: n => "(2.2)")
 $ \[ z^(*) z \] = \[ z z^(*) \] \, wide c in "her" \( b \)_(+) arrow.r.double \[ c \] lt.eq \[ b \] \,
   wide \[ c \] = sup_(n gt.eq 1) \[ \( c - 1 \/ n \)_(+) \] . $ <ext:eq:cu-facts>]

For mutually orthogonal positive elements, the class of the sum is the sum of the classes:
  the row of their square roots compares the sum with its diagonal matrix.
  Subequivalence to a fixed positive element is closed under norm limits in the left variable,
  by choosing a sufficiently good comparison witness for each approximant.
  The semigroup $W \( D ⊗ cal(K) \)$, defined using finite matrices over the stable algebra, is $upright("Cu") \( D \)$.

We record the elementary comparison facts which will control the locations and norms of witnesses.

#thm([Lemma 2.1.])[
  (Cuts, placement, and witness bounds).  #emph[Let $D$ be a $C^(*)$-algebra.]
  + #emph[If $a \, b in D_(+)$ and $parallel a - r^(*) b r parallel < epsilon.alt$, then there is $v in D$ with
$ v^(*) v = \( a - epsilon.alt \)_(+) \, wide v v^(*) in "her" \( b \) . $

 Consequently, if $a prec.tilde b$, the hereditary algebra of every positive cut of $a$ can be placed in
   $"her" \( b \)$ by a polar isometry.]
  + #emph[If $a in "Ideal" \( b \)_(+)$, then for every $epsilon.alt > 0$ there is a finite integer $L$ such that
$ \[ \( a - epsilon.alt \)_(+) \] lt.eq L \[ b \] . $

 If $\[ a \] lt.eq L \[ b \]$, every positive cut of $a$ still compares to $L \[ \( b - delta \)_(+) \]$ for a
   sufficiently small $delta > 0$.]
  + #emph[Comparisons between elements of a hereditary subalgebra can be witnessed in that subalgebra.
    Comparisons between specified matrix corners can be witnessed by the appropriate rectangular matrices.]
  + #emph[If $u prec.tilde \( y - beta \)_(+)$, where $0 lt.eq alpha < beta$,
    then for each $eta > 0$ there is $r in D$ such that
$ parallel u - r^(*) \( y - alpha \)_(+) r parallel < eta \, wide parallel r parallel^2 lt.eq
  frac(parallel u parallel + eta, beta - alpha) . $

]
] <lem:pre:cut-placement>

#proof[
  For the first assertion, choose $parallel a - r^(*) b r parallel < delta < epsilon.alt$,
    and a continuous $g gt.eq 0$, vanishing on $\[ 0 \, delta \]$,
    which is one on $\[ epsilon.alt \, parallel a parallel \]$. For $z = b^(1 \/ 2) r g \( a \)$,
  $ \( delta - parallel a - r^(*) b r parallel \) thin g \( a \)^2 lt.eq
    z^(*) z lt.eq \( parallel a parallel + parallel a - r^(*) b r parallel \) thin g \( a \)^2 . $
  Thus $z^(*) z$ and $g \( a \)^2$ generate the same hereditary algebra,
    which contains $\( a - epsilon.alt \)_(+)$. If $w$ is the polar isometry of $z$,
    conjugation by $w$ maps $"her" \( z^(*) z \)$ into $"her" \( b \)$.
    Moreover $w x in D$ for $x in "her" \( z^(*) z \)$, by approximation using $w \| z \| = z$.
    Taking $v = w \( a - epsilon.alt \)_(+)^(1 \/ 2)$ proves the assertion.
    Its matrix version gives the claimed hereditary placement.
  For the second assertion, approximate $a^(1 \/ 2)$ by a finite sum $q =
    sum_i x_i b y_i$ so closely that $parallel a - q^(*) q parallel < epsilon.alt \/ 2$.
    Write $q = X Y$, where $X = \( x_i b^(1 \/ 2) \)_i$ is a row and $Y = \( b^(1 \/ 2) y_i \)_i$ is a column.
    Then $q^(*) q lt.eq parallel X parallel^2 Y^(*) Y$, while $Y Y^(*)$ belongs to the hereditary algebra of $H =
    "diag" \( b \, dots.h \, b \)$. Positive domination and equality of the classes of the two squared moduli give
  $ q^(*) q prec.tilde Y^(*) Y tilde.op Y Y^(*) prec.tilde H . $
  Choose a comparison witness with error less than $epsilon.alt \/
    2$ and apply the first assertion to obtain the claimed cut comparison.
    Alternatively, for a fixed comparison witness against $"diag" \( b \, dots.h \, b \)$,
    replacing $b$ by $\( b - delta \)_(+)$ changes the compression by at most $delta parallel r parallel^2$.
    This also proves the assertion about an extra target cut.
  Let $C subset.eq D$ be hereditary and let $\( e_i \)$ be an approximate unit of $C$.
    Given $a \, b in C_(+)$ and a witness $r$, first choose an index for which the errors in $e_i b e_i$ and $e_i
    a e_i$ are small. Then $e_i r e_i in C$, and its compression is as close to $a$ as desired.
    This proves the third assertion. The same compression in matrix algebras gives rectangular witnesses.
    More generally, an element whose two squared moduli belong to the specified hereditary corners lies in their
    rectangular block, as is seen by multiplying by approximate units on both sides.
  For the last assertion choose $x$ with $parallel u - x^(*) \( y - beta \)_(+) x parallel < eta$, and put
  $ f \( t \) = (frac(\( t - beta \)_(+), \( t - alpha \)_(+)))^(1 \/ 2) \, wide r = f \( y \) x \, $
  where the quotient is zero when its denominator vanishes. This is a continuous function vanishing near zero, and
  $ f \( y \) \( y - alpha \)_(+) f \( y \) = \( y - beta \)_(+) \, wide
    f \( y \)^2 lt.eq \( beta - alpha \)^(- 1) \( y - beta \)_(+) . $
  The compression and the norm bound follow. If the original comparison is in the stabilization,
    compression to the given corner first gives $x in D$. ◻
]

=== 2.2 Extended traces and rank <extended-traces-and-rank>

We allow all lower semicontinuous extended traces $tau : A_(+) arrow.r \[ 0 \, oo \]$, without dense finiteness.
  Thus $tau$ is additive and positively homogeneous on positives, is lower semicontinuous in norm,
  vanishes at zero, and satisfies $tau \( x^(*) x \) = tau \( x x^(*) \)$. For $b gt.eq 0$, write

$ d_tau \( b \) = lim_(j arrow.r oo) tau \( b^(1 \/ j) \) \, $

first rescaling to a contraction when necessary. The rank is unchanged by positive scalar rescaling.
  Traces are extended to matrices and to stabilization using the unnormalized matrix trace:
  on a positive infinite matrix, the extended trace is the sum of the traces of its diagonal entries.
  Additivity and lower semicontinuity justify these sums, and traciality follows by summing the squared moduli of
  the matrix entries. For a positive contraction $b$ and $s > 0$,

#[#set math.equation(numbering: n => "(2.3)")
 $ tau \( b \) lt.eq d_tau \( b \) \, wide d_tau \( \( b - s \)_(+) \) lt.eq
   s^(- 1) tau \( b \) . $ <eq:pre:trace-rank>]

These inequalities follow from functional calculus. Rank respects Cuntz comparison.
  For a bounded trace we use its normal extension to the bidual, so $d_tau \( b \) = tau \( p_b \)$.

Every such trace defines a functional $\[ b \] mapsto d_tau \( b \)$ on $upright("Cu") \( A \)$.
  Conversely, if $A$ is exact, every $phi in upright(F) \( upright("Cu") \( A \) \)$ has the form

#[#set math.equation(numbering: n => "(2.4)")
 $ phi \( \[ b \] \) = d_tau \( b \) \, wide b in \( A ⊗ cal(K) \)_(+) \, $ <ext:eq:trace-representation>]

for a lower semicontinuous extended trace $tau$ on the stabilization.
  Elliott–Robert–Santiago’s correspondence first gives an extended quasitrace; Haagerup’s theorem,
  in its extended form for exact algebras, makes it additive,
  and stabilization preserves the trace cone [15] Proposition 4.2 and Remarks 4.3 and 4.5.
  Neither boundedness nor dense finiteness is imposed.

Nuclear algebras are exact. Indeed, for an ideal $J lt.closed D$,
  the quotient norm on $A ⊙ \( D \/ J \)$ induced by $\( A ⊗_min D \) \/ \( A ⊗_min J \)$ dominates the spatial
  norm and is a $C^(*)$-cross-norm, as seen by elementary-tensor lifts.
  Here $⊙$ denotes the algebraic tensor product. Uniqueness of the tensor norm for nuclear $A$ identifies this
  quotient with $A ⊗_min \( D \/ J \)$, giving the exact tensor-product sequence.

=== 2.3 The comparison convention <the-comparison-convention>

The extended-functional convention in Equation (1.1) is equivalent to almost unperforation.
  The non-strict inequality on the whole functional cone records ideal containment;
  the strict inequalities at finite positive target values then determine comparison.

#thm([Lemma 2.2.])[
  #emph[For any $C^(*)$-algebra $A$, strict comparison in the sense of Equation (1.1) is equivalent to almost
    unperforation of $upright("Cu") \( A \)$.]
] <lem:comparison-convention>

#proof[
  Suppose first that Equation (1.1) holds and that $\( l + 1 \) x lt.eq l y$.
    Applying a functional gives $phi \( x \) lt.eq phi \( y \)$,
    with strict inequality whenever $0 < phi \( y \) < oo$. If $phi \( y \) = 0$, then $phi \( x \) = 0$;
    if $phi \( y \) = oo$, the non-strict inequality is automatic. Thus Equation (1.1) gives $x lt.eq y$.
  Conversely, suppose $upright("Cu") \( A \)$ is almost unperforated,
    and let $x = \[ a \]$ and $y = \[ b \]$ satisfy the two functional inequalities in Equation (1.1).
    In $B = A ⊗ cal(K)$, set $I = "Ideal"_B \( b \)$. The map that is zero on $I_(+)$ and infinite outside $I_(+)$
    is a lower semicontinuous extended trace: a sum of positives belongs to an ideal exactly when both summands
    do, $z^(*) z$ belongs to it exactly when $z z^(*)$ does, and the ideal is norm closed.
    Its rank functional vanishes at $y$, so the first inequality forces $a in I$.
    Lemma 5(2) now gives $x lt.eq sup_(n gt.eq 1) n y$. For every functional normalized by $phi \( y \) = 1$,
    the second inequality gives $phi \( x \) < 1$. The comparison criterion of [15] Proposition 6.2 therefore
    yields $x lt.eq y$. ◻
]

== 3 Simple algebras and extended traces <ext:sec:preliminaries>

The next three sections prove full almost divisibility from extended-functional comparison.
  Two consequences of simplicity supply the error estimates:
  there are arbitrarily small nonzero Cuntz classes, and one fixed positive cut has finite positive value at every
  nonzero functional that is finite somewhere. The first provides small hereditary supports;
  the second measures the errors on all of them. No nuclear approximation is used.

We work in $B = A ⊗ cal(K)$ and identify $upright("Cu") \( B \)$ with $upright("Cu") \( A \)$.
  Matrix algebras over $B$ are placed in stable corners. These placements preserve Cuntz classes:
  if $V$ is the corresponding multiplier isometry, then $b$ and $V b V^(*)$ are the two squared moduli of $V
  b^(1 \/ 2)$. The trace and rank conventions are those of Section 2.

#thm([Lemma 3.1.])[
  (Small nonzero classes).  #emph[If $A$ is simple and non-elementary, then $B =
    A ⊗ cal(K)$ is simple and has no minimal projections. For every nonzero $e in B_(+)$ and integer $M gt.eq 1$,
    there is a nonzero $h in B_(+)$ with
$ M \[ h \] lt.eq \[ e \] . $

]
] <ext:lem:small>

#proof[
  Matrix-unit multipliers extract a nonzero matrix entry from any nonzero ideal of $B$ and put it into every
    matrix position. Simplicity of $A$ then implies simplicity of $B$.
    If $p in B$ were minimal, $B p$ would be a Hilbert space with inner product $x^(*) y = chevron.l x \,
    y chevron.r p$. Left multiplication is faithful by simplicity,
    and the elements $x y^(*)$ act as rank-one operators. Since $p$ generates $B$ as an ideal,
    they span a dense subspace of $B$, giving $B tilde.equiv cal(K) \( B p \)$.
    The multiplier corner $1 ⊗ e_11$ would consequently identify $A$ with compact operators on a Hilbert space,
    a contradiction.
  There are $M$ nonzero mutually orthogonal positives $e_1 \, dots.h \, e_M$ in $"her" \( e \)$.
    Indeed, split a nonzero positive element at two distinct nonzero spectral points.
    If no such points exist, the element is a multiple of a projection, whose corner is not one-dimensional.
    A shifted nonscalar selfadjoint in that corner has two distinct positive spectral points and can be split
    instead. Recursion gives the required family while preserving orthogonality.
  For nonzero $f \, g in B_(+)$, simplicity gives $f B g eq.not 0$.
    If $0 eq.not v in f B g$, then $\[ v^(*) v \] = \[ v v^(*) \]$ is a nonzero class below both $\[ f \]$ and
    $\[ g \]$. Iterating this observation gives $h eq.not 0$ with $\[ h \] lt.eq \[ e_i \]$ for every $i$.
    Therefore $M \[ h \] lt.eq sum_i \[ e_i \] lt.eq \[ e \]$. ◻
]

#thm([Lemma 3.2.])[
  (Functional trichotomy).  #emph[Let $A$ be simple and nonzero.
    Every functional on $upright("Cu") \( A \)$ is either zero, infinite on every nonzero class,
    or positive on every nonzero class and finite on every class $\[ \( c - delta \)_(+) \]$ with $c
    in \( A ⊗ cal(K) \)_(+)$ and $delta > 0$. The third type consists exactly of the functionals finite and
    positive at some class.]
] <ext:lem:trichotomy>

#proof[
  Every nonzero $b in B_(+)$ is full. Lemma 5 therefore bounds each positive cut of any $c in
    B_(+)$ by finitely many copies of $\[ b \]$. If $phi \( \[ b \] \) = 0$,
    preservation of increasing suprema gives $phi \( \[ c \] \) = 0$ for every $c$.
    If $0 < phi \( \[ b \] \) < oo$, the same cut comparison gives finiteness on every cut,
    and the first observation gives positivity on every nonzero class. These alternatives exhaust all functionals. ◻
]

Write $upright(F)_(upright("fin")) \( A \)$ for the third type in Lemma 8.
  This notation does not assert finiteness on all classes. If $parallel a parallel =
  1$ and $e = \( a - 1 \/ 2 \)_(+)$, then

#[#set math.equation(numbering: n => "(3.1)")
 $ 0 < phi \( \[ e \] \) < oo \, wide phi \( \[ e \] \) lt.eq
   phi \( \[ a \] \) quad \( phi in upright(F)_(upright("fin")) \( A \) \) . $ <ext:eq:controller>]

== 4 Trace transfer and spectral rounding <ext:sec:rounding>

We approximate trace values by ranks in two steps. First,
  a positive function of an element that vanishes near zero is transferred into a small hereditary support without
  changing any trace value. Integer spectral cuts then approximate that value with an error bounded by the rank of
  the support. The transferred element may have large norm; the error will be independent of that norm.

#thm([Lemma 4.1.])[
  (Trace transfer).  #emph[Let $B$ be a simple stable $C^(*)$-algebra, let $a in B_(+)$ be a contraction,
    and let $0 eq.not h in B_(+)$. Suppose that $r : \[ 0 \, 1 \]
    arrow.r \[ 0 \, oo \)$ is continuous and vanishes on $\[ 0 \, delta \]$ for some $0 < delta < 1$.
    There is $c in "her"_B \( h \)_(+)$ such that
$ tau \( c \) = tau \( r \( a \) \) $

 for every lower-semicontinuous extended trace $tau$ on $B$.]
] <ext:lem:transfer>

#proof[
  Fullness of $h$ and Lemma 5 give $\[ \( a - delta \/ 4 \)_(+) \] lt.eq m \[ h \]$ for some finite $m gt.eq 1$.
    Apply that lemma in $M_m \( B \)$, with cut parameter $epsilon.alt =
    delta \/ 4$ and comparison error less than $delta \/ 4$, to the source
    $"diag" \( \( a - delta \/ 4 \)_(+) \, 0 \, dots.h \, 0 \)$ and target $H = "diag" \( h \, dots.h \, h \)$.
    The resulting placement matrix has only its first column nonzero,
    because all other diagonal entries of its initial squared modulus are zero.
    Thus there is a column $v = \( v_i \)_(i = 1)^m$ such that
  $ v^(*) v = \( a - delta \/ 2 \)_(+) \, wide v v^(*) in M_m \( "her"_B \( h \) \) . $
  Define
  $ g \( t \) = (frac(r \( t \), \( t - delta \/ 2 \)_(+)))^(1 \/ 2) \, $
  setting it equal to zero where the denominator vanishes. It is continuous and vanishes near zero because $r$
    vanishes on $\[ 0 \, delta \]$. For $z_i = v_i g \( a \)$, we have
  $ sum_(i = 1)^m z_i^(*) z_i = r \( a \) \, wide c := sum_(i = 1)^m z_i z_i^(*) in "her"_B \( h \) . $
  For the containment, use $z_i z_i^(*) lt.eq parallel g parallel^2 v_i v_i^(*)$ and heredity.
    Additivity and traciality give the asserted identity for every extended trace, with the same $c$. ◻
]

#thm([Lemma 4.2.])[
  (Integer spectral rounding).  #emph[Let $B$ be a stable $C^(*)$-algebra, $c in B_(+)$,
    and let $L$ be an integer greater than $parallel c parallel$. Put
$ w = sum_(i = 1)^L \[ \( c - i \)_(+) \] in upright("Cu") \( B \) . $

 For every lower-semicontinuous extended trace $tau$, writing $phi = d_tau$, one has
#[#set math.equation(numbering: n => "(4.1)")
 $ phi \( w \) lt.eq tau \( c \) lt.eq phi \( w \) + d_tau \( c \) . $ <ext:eq:rounding>]

]
] <ext:lem:rounding>

#proof[
  For $q \( t \) = min \( t \, 1 \)$ on $\[ 0 \, oo \)$, scalar functional calculus gives the exact identity
  #[#set math.equation(numbering: n => "(4.2)")
   $ c = sum_(i = 1)^L q \( \( c - \( i - 1 \) \)_(+) \) . $ <ext:eq:staircase>]
  Set $R = max \( 1 \, parallel c parallel \)$. For every integer $m gt.eq 1$,
  $ #scale(x: 120%, y: 120%)[\(] \( c - i \)_(+) \/ R #scale(x: 120%, y: 120%)[\)]^(1 \/ m) lt.eq
    q \( \( c - \( i - 1 \) \)_(+) \) . $
  Indeed, below the spectral threshold $i$ the left side is zero, and above it the right side is one. Consequently,
  $ d_tau \( \( c - i \)_(+) \) lt.eq tau \( q \( \( c - \( i - 1 \) \)_(+) \) \) lt.eq
    d_tau \( \( c - \( i - 1 \) \)_(+) \) . $
  The last inequality uses Equation (2.3) and hereditary containment.
    Summing and using $\( c - L \)_(+) = 0$ proves Equation (4.1).
    Only the first rank $d_tau \( c \)$ remains as error; the number $L$ of spectral levels does not occur in the
    error bound. ◻
]

We now combine the two lemmas. If $M \[ h \] lt.eq \[ e \]$ and $c$ is obtained by trace transfer into
  $"her" \( h \)$, then $M \[ c \] lt.eq \[ e \]$. For a functional with $phi \( \[ e \] \) < oo$,
  rounding therefore approximates $tau \( r \( a \) \)$ to within $phi \( \[ e \] \) \/ M$.
  A single cut-supported function does not recover the full rank of an arbitrary element.
  In the next section we write that rank as a sum of such trace values and choose the support ranks so that the
  errors are summable. Neither the norm of $c$ nor the number of its spectral levels has to be bounded uniformly.

== 5 Almost divisibility with a relative error <ext:sec:divisibility>

For a given class $x$ and integer $N gt.eq 1$, we seek a single class $u$ with $phi \( x \) \/ \( N + 1 \) <
  phi \( u \) < phi \( x \) \/ N$ whenever $0 < phi \( x \) < oo$.
  We choose $s$ between $1 \/ \( N + 1 \)$ and $1 \/ N$ and approximate $s phi \( x \)$ from below.
  The error is measured by one fixed cut, so the same construction also controls functionals taking the value
  infinity on $x$.

#thm([Theorem 5.1.])[
  #emph[Let $A$ be a simple exact non-elementary $C^(*)$-algebra with strict comparison as in Equation (1.1).
    For every $x in upright("Cu") \( A \)$ and integer $N gt.eq 1$,
    there exists $u in upright("Cu") \( A \)$ such that $N u lt.eq x lt.eq \( N + 1 \) u$.]
] <ext:thm:divisibility>

#proof[
  The assertion is immediate for $x = 0$. Otherwise write $x = \[ a \]$, where $a in B_(+)$ has norm one,
    and put $e = \( a - 1 \/ 2 \)_(+)$. If $upright(F)_(upright("fin")) \( A \)$ is empty,
    all functionals are zero or infinite on every nonzero class.
    Equation (1.1) then gives $N x lt.eq x$, while $x lt.eq \( N + 1 \) x$ is automatic. Take $u = x$.
    We henceforth assume $upright(F)_(upright("fin")) \( A \) eq.not diameter$.
  #emph[Choose supports with summable relative rank.] Choose a real number $s$ and integers $M_j gt.eq 1$,
    $j gt.eq 1$, such that
  #[#set math.equation(numbering: n => "(5.1)")
   $ frac(1, N + 1) < s < 1 / N \, wide E := sum_(j = 1)^oo 1 / M_j < s - frac(1, N + 1) . $ <ext:eq:budget>]
  Lemma 7 supplies nonzero $h_j in B_(+)$ with $M_j \[ h_j \] lt.eq \[ e \]$.
  To recover the full rank of $a$ from functions vanishing near zero,
    choose increasing cutoffs $F_j$ converging to one on $\( 0 \, 1 \]$ and transfer their positive increments.
    Concretely, set
  $ F_0 = 0 \, wide F_j \( t \) = min { 1 \, max { 0 \, 2^j t - 1 } } \, wide r_j =
    s \( F_j - F_(j - 1) \) quad \( j gt.eq 1 \) . $
  The functions $F_j$ increase, and $r_j gt.eq 0$ vanishes on $\[ 0 \, 2^(- j) \]$. Put $p_j = r_j \( a \)$.
    Lemma 9 gives $c_j in "her" \( h_j \)_(+)$ satisfying
  #[#set math.equation(numbering: n => "(5.2)")
   $ tau \( c_j \) = tau \( p_j \) quad upright("for all extended traces ") tau \, wide
     M_j \[ c_j \] lt.eq \[ e \] . $ <ext:eq:transferred>]
  #emph[Round and sum inside the Cuntz semigroup.] Choose integers $L_j > parallel c_j parallel$ and put
  #[#set math.equation(numbering: n => "(5.3)")
   $ w_j = sum_(i = 1)^(L_j) \[ \( c_j - i \)_(+) \] \, wide u = sup_(k gt.eq 1) sum_(j = 1)^k w_j . $ <ext:eq:u>]
  For completeness, this supremum is represented by a positive element of $B$:
    choose representatives of $w_j$, rescale them to norm at most $2^(- j)$,
    and put them in mutually orthogonal stable blocks. Their sum converges in norm.
    Each finite partial sum is Cuntz below it. Conversely, comparison of all partial sums with one target passes
    to the norm limit, proving the least-upper-bound property. Therefore
  #[#set math.equation(numbering: n => "(5.4)")
   $ phi \( u \) = sum_(j = 1)^oo phi \( w_j \) quad \( phi in upright(F) \( upright("Cu") \( A \) \) \) .
     $ <ext:eq:u-values>]
  Fix $phi in upright(F)_(upright("fin")) \( A \)$ and choose its representing trace using Equation (2.4).
    Equations (4.1) and (5.2) give
  #[#set math.equation(numbering: n => "(5.5)")
   $ phi \( w_j \) lt.eq tau \( p_j \) lt.eq phi \( w_j \) + frac(phi \( \[ e \] \), M_j) . $ <ext:eq:piece-error>]
  The finite value $phi \( \[ e \] \)$ is the only trace-dependent constant in the error estimate.
  #emph[Recover the rank of $a$.] Telescoping gives
  $ sum_(j = 1)^k tau \( p_j \) = s tau \( F_k \( a \) \) . $
  We claim that
  #[#set math.equation(numbering: n => "(5.6)")
   $ tau \( F_k \( a \) \) arrow.t d_tau \( a \) = phi \( x \) . $ <ext:eq:recover>]
  The values increase and are at most $d_tau \( a \)$ by Equation (2.3) and hereditary containment.
    Given $0 < epsilon.alt < 1$, for sufficiently large $k$ we have $F_k \( t \) = 1$ on $\[ epsilon.alt \, 1 \]$.
    Thus, simultaneously for all integers $m gt.eq 1$,
  $ \( a - epsilon.alt \)_(+)^(1 \/ m) lt.eq F_k \( a \) . $
  Taking traces and then letting $m arrow.r oo$ gives $d_tau \( \( a - epsilon.alt \)_(+) \) lt.eq
    tau \( F_k \( a \) \)$. The cut-supremum formula in Equation (2.2) now proves Equation (5.6).
  Sum Equation (5.5), then use Equations (5.4) and (5.6). In extended nonnegative arithmetic,
    for every $phi in upright(F)_(upright("fin")) \( A \)$,
  #[#set math.equation(numbering: n => "(5.7)")
   $ phi \( u \) lt.eq s phi \( x \) lt.eq phi \( u \) + E phi \( \[ e \] \) . $ <ext:eq:total-error>]
  If $phi \( x \) < oo$, Equation (3.1) implies
  $ \( s - E \) phi \( x \) lt.eq phi \( u \) lt.eq s phi \( x \) . $
  Since $phi \( x \) > 0$, Equation (5.1) yields
  #[#set math.equation(numbering: n => "(5.8)")
   $ frac(phi \( x \), N + 1) < phi \( u \) < frac(phi \( x \), N) . $ <ext:eq:strict-interval>]
  If instead $phi \( x \) = oo$, then $E phi \( \[ e \] \) < oo$ and Equation (5.7) forces $phi \( u \) = oo$.
    No subtraction of infinite values is used. Since $upright(F)_(upright("fin")) \( A \)$ is nonempty,
    these conclusions also prove $u eq.not 0$.
  #emph[Apply comparison with each target.] Zero functionals vanish at both $x$ and $u$,
    and the everywhere-infinite functionals are infinite at both.
    For functionals in $upright(F)_(upright("fin")) \( A \)$, the preceding estimates give
  $ phi \( N u \) lt.eq phi \( x \) \, wide phi \( x \) lt.eq phi \( \( N + 1 \) u \) . $
  The first inequality is strict whenever $0 < phi \( x \) < oo$.
    For the second, if $0 < phi \( \( N + 1 \) u \) < oo$, then the functional belongs to
    $upright(F)_(upright("fin")) \( A \)$ and the infinite-value case excludes $phi \( x \) = oo$.
    Equation (5.8) makes that inequality strict as well. Applying Equation (1.1) twice proves $N u lt.eq
    x lt.eq \( N + 1 \) u$. ◻
]

#thm([Corollary 5.2.])[
  (Condition (C) from comparison).  #emph[Let $A$ be a simple exact non-elementary $C^(*)$-algebra with strict
    comparison in the sense of Equation (1.1). Then $upright("Cu") \( A \)$ satisfies condition (C).]
] <ext:cor:condition-C>

#proof[
  Theorem 11 gives the full almost-divisibility sandwich, and Lemma 6 gives almost unperforation. ◻
]

#prodef([Remark 5.3.])[
  The same sequence $\( M_j \)$ works for every functional.
    The values $phi \( \[ e \] \)$ need not be uniformly bounded over any trace family:
    their pointwise finiteness is enough to handle $phi \( x \) = oo$,
    and their bound by $phi \( x \)$ handles finite values. This is why no trace normalization is needed.
]

=== 5.1 A unital uniform-trace illustration <a-unital-uniform-trace-illustration>

The simple route into (C) is complete. We record a separate consequence of trace transfer and integer rounding
  when traces can be normalized. It illustrates the approximation mechanism without an exactness, nuclearity,
  or comparison hypothesis, and is not needed in the absorption construction.
  The spectral discretization in [14] Section 5 provides related rank-approximation methods;
  here small support permits integer spectral cuts with one support-rank of error.

#thm([Proposition 5.4.])[
  (Uniform approximation from below).  #emph[Let $A$ be a unital simple infinite-dimensional $C^(*)$-algebra with
    nonempty tracial state space $T \( A \)$. For every $p in A_(+)$ and $eta > 0$,
    there are a finite integer $L$ and $w in M_L \( A \)_(+)$ such that
$ 0 lt.eq tau \( p \) - d_tau \( w \) lt.eq eta wide \( tau in T \( A \) \) \, $

 where matrix traces are unnormalized. No exactness, nuclearity, or comparison assumption is required.]
] <prop:unital-approx>

#proof[
  Choose an integer $N$ with $1 \/ N < eta$. There are $N$ mutually orthogonal nonzero positive elements in $A$:
    repeatedly split a positive element at two distinct positive spectral values.
    If a nonzero hereditary corner had no such element, it would contain a minimal projection,
    and simplicity would identify $A$ with compact operators; unitality would then make $A$ finite dimensional.
    For any two nonzero positives $e \, f$, simplicity supplies $0 eq.not v in e A f$.
    The class $\[ v^(*) v \] = \[ v v^(*) \]$ is nonzero and below both $\[ e \]$ and $\[ f \]$.
    Iterating over the orthogonal family gives $0 eq.not h in A_(+)$ with
  $ d_tau \( h \) lt.eq 1 \/ N wide \( tau in T \( A \) \) . $
  Fullness gives finitely many $s_i in A$ with $sum_i s_i^(*) h s_i = 1$.
    To see the exact equality, choose an invertible finite sum $S = sum_i r_i h t_i$ approximating $1$.
    For the row $R = \( r_i h^(1 \/ 2) \)_i$ and column $D = \( h^(1 \/ 2) t_i \)_i$, the identity $S =
    R D$ gives $S^(*) S lt.eq parallel R parallel^2 D^(*) D$, so $D^(*) D$ is invertible.
    Set $s_i = t_i \( D^(*) D \)^(- 1 \/ 2)$. The element
  $ c = sum_i h^(1 \/ 2) s_i p s_i^(*) h^(1 \/ 2) in "her"_A \( h \)_(+) $
  therefore satisfies $tau \( c \) = tau \( p \)$ and $d_tau \( c \) lt.eq 1 \/ N$ for every $tau in T \( A \)$.
    Choose an integer $L > parallel c parallel$ and let $w = xor.big_(j = 1)^L \( c - j \)_(+)$.
    Lemma 10, applied in the stabilization, gives
  $ d_tau \( w \) lt.eq tau \( c \) lt.eq d_tau \( w \) + d_tau \( c \) lt.eq d_tau \( w \) + 1 \/ N . $
  This proves the required simultaneous inequalities. ◻
]

== 6 Comparison and support tools under condition (C) <sec:support-tools>

Corollary 12 has supplied condition (C) from simple extended-functional comparison.
  We first complete the other route, from the canonical Cuntz-semigroup map.
  The remaining lemmas turn (C) into the hereditary supports, matrix cones,
  and bounded witnesses used by the common absorption construction.
  They apply without simplicity; exactness is needed for the trace comparison,
  and separability enters the central-sequence constructions.

=== 6.1 The consequences of the canonical Cu map <the-consequences-of-the-canonical-cu-map>

#thm([Lemma 6.1.])[
  (Cuntz regularity).  #emph[Under the hypothesis of Corollary 3,
    the semigroup $upright("Cu") \( A \)$ satisfies condition (C), namely Equations (1.2)–(1.3).]
] <lem:C>

#proof[
  The algebra $A ⊗ cal(Z)$ and its stabilization absorb $cal(Z)$.
    Rørdam’s Theorem 4.5 [26] makes their $W$-semigroup almost unperforated.
    Transport through $upright("Cu") \( iota \)$ proves (1.2).
  For an integer $N gt.eq 1$, Rørdam’s divisibility lemma [26] Lemma 4.2 supplies $z in cal(Z)_(+)$ such that
  $ N \[ z \] lt.eq \[ 1_(cal(Z)) \] lt.eq \( N + 1 \) \[ z \] . $
  For $x = \[ b \]$, tensor these comparisons with $b$. Comparison is preserved by tensoring with a fixed positive
    element [26] Lemma 4.1: tensor the witnesses and use a bounded approximate unit on the other factor. Thus
  $ N \[ b ⊗ z \] lt.eq \[ b ⊗ 1_(cal(Z)) \] lt.eq \( N + 1 \) \[ b ⊗ z \] . $
  The middle class is exactly $upright("Cu") \( iota \) \( x \)$. Pulling back the outside class proves (1.3). ◻
]

=== 6.2 Comparison from a rank gap <comparison-from-a-rank-gap>

The later construction will compare a defect with a matrix-cone weight by proving a uniform gap between their
  ranks. The following form allows traces that vanish on an ideal or take infinite values.
  Exactness turns the rank inequalities into functional inequalities,
  and almost unperforation supplies comparison through Lemma 6.

#thm([Lemma 6.2.])[
  (Comparison from a uniform rank gap).  #emph[Suppose $A$ is exact and satisfies (1.2). If $v \, w in A_(+)$ satisfy
$ d_tau \( v \) lt.eq 1 / 2 d_tau \( w \) $

 for every lower semicontinuous extended trace on $A$, then $v prec.tilde w$.]
] <lem:G>

#proof[
  Let $phi in upright(F) \( upright("Cu") \( A \) \)$. By Equation (2.4),
    it is represented by an extended trace on $A ⊗ cal(K)$. Restricting that trace to the original corner and
    applying the hypothesis gives
  $ phi \( \[ v \] \) lt.eq 1 / 2 phi \( \[ w \] \) lt.eq phi \( \[ w \] \) . $
  The inequality is strict whenever $0 < phi \( \[ w \] \) < oo$.
    Since $upright("Cu") \( A \)$ is almost unperforated, Lemma 6 applies and gives $\[ v \] lt.eq \[ w \]$. ◻
]

=== 6.3 Placing divisible matrix cones <placing-divisible-matrix-cones>

Almost divisibility provides equal Cuntz classes below a prescribed positive element.
  Cutting these classes lets us place the corresponding matrix cone inside its hereditary algebra.
  The two forms below retain, respectively, norm visibility in representations and a prescribed fraction of the
  rank for bounded traces.

#thm([Lemma 6.3.])[
  (Cone placement).  #emph[Assume (1.2)–(1.3).]
  + #emph[Let $B$ be a hereditary subalgebra of a matrix algebra over $A ⊗ cal(K)$,
    let $b in B_(+)$ be a contraction, and let $N gt.eq 1$ and $epsilon.alt > 0$.
    There is a c.p.c. order-zero map $psi : M_N arrow.r "her"_B \( b \)$ such that
$ parallel sigma \( psi \( 1 \) \) parallel = 1 quad upright("whenever") quad
  sigma \( \( b - epsilon.alt \)_(+) \) eq.not 0 . $

 Its $N$ diagonal weights are orthogonal and equivalent in $"her"_B \( b \)$.
   Each diagonal weight, cut at $1 \/ 2$, dominates a positive class $u_0$ for which
$ \[ \( b - epsilon.alt \)_(+) \] lt.eq \( N + 1 \) u_0 . $

]
  + #emph[Let $C$ be isomorphic to a finite direct sum of hereditary subalgebras as above.
    For $b in C_(+)$ a contraction, $k gt.eq 1$, and $0 < q lt.eq 1$, there is a c.p.c. order-zero map $psi :
    M_k arrow.r "her"_C \( b \)$, with weight $t = psi \( 1 \)$, such that
#[#set math.equation(numbering: n => "(6.1)")
 $ d_sigma \( t \) lt.eq q thin d_sigma \( b \) \, wide d_sigma \( \( t - 1 / 2 \)_(+) \) gt.eq \( q \/ 3 \)
   d_sigma \( \( b - 1 / 2 \)_(+) \) $ <eq:pre:P>]

 for every bounded positive trace $sigma$ on $C$.]
] <lem:placement>

#proof[
  Choose $u = \[ r \]$ with $N \[ r \] lt.eq \[ b \] lt.eq \( N + 1 \) \[ r \]$.
    By (2.1), a sufficiently small $eta > 0$ gives
  $ \[ \( b - epsilon.alt \)_(+) \] lt.eq \( N + 1 \) \[ \( r - 2 eta \)_(+) \] . $
  Lemma 5 places the hereditary algebra of $"diag" \( \( r - eta \)_(+) \, dots.h \, \( r - eta \)_(+) \)$,
    with $N$ diagonal entries, inside $"her"_B \( b \)$. In this hereditary matrix algebra take the cone $e_(i j)
    mapsto e_(i j) ⊗ g \( r \)$, where $0 lt.eq g lt.eq 1$, $g = 0$ on $\[ 0 \, eta \]$, and $g =
    1$ on $\[ 2 eta \, oo \)$. Transport it by the polar isometry.
    Every diagonal acts as one on the corresponding transported $\( r - 2 eta \)_(+)$,
    proving both its cut comparison and the norm-one assertion.
    The off-diagonal entries give equivalence of the orthogonal weights.
  For the second assertion do this in each summand, with $N = ceil.l k \/ q ceil.r$ and $epsilon.alt = 1 \/ 2$,
    and restrict to the first $k$ slots. The complete $N$-slot weight lies in $"her" \( b \)$,
    so equivalence and additivity of rank give
  $ d_sigma \( t \) lt.eq \( k \/ N \) d_sigma \( b \) lt.eq q thin d_sigma \( b \) . $
  The retained narrow classes and the cut comparison give
  $ d_sigma \( \( t - 1 / 2 \)_(+) \) gt.eq frac(k, N + 1) d_sigma \( \( b - 1 / 2 \)_(+) \) gt.eq \( q \/ 3 \)
    d_sigma \( \( b - 1 / 2 \)_(+) \) . $
  All comparisons take place in the indicated hereditary algebra, by Lemma 5.
    Thus arbitrary bounded traces on that algebra may be used, whether or not they extend boundedly to $A$.
    Summing the finitely many summands proves the claim. ◻
]

=== 6.4 A support compression <a-support-compression>

To make an error operator small on a hereditary support, we compress its complement below a chosen threshold and
  take the positive part. The following observation gives the resulting bound on the support,
  without requiring the error operator to commute with the compressing element.

#thm([Lemma 6.4.])[
  #emph[Let $K = K^(*)$ be a bounded operator on a Hilbert space, let $s gt.eq 0$ be bounded,
    and let $lambda in bb(R)$. On the support of
$ b = s \[ s \( lambda - K \) s \]_(+) s $

 the compression of $K$ is at most $lambda$. If $b = 0$, then $s \( lambda - K \) s lt.eq 0$.]
] <lem:support>

#proof[
  Put $H = s \( lambda - K \) s$. For a vector $xi$ in the positive spectral space of $H$,
  $ chevron.l \( lambda - K \) s xi \, s xi chevron.r = chevron.l H xi \, xi chevron.r gt.eq 0 . $
  The range closure of $s H_(+)^(1 \/ 2)$ is the support space of $b$.
    It is contained in the closure of the images $s xi$ just used.
    Continuity of the quadratic form proves the compression bound.
  If $b = 0$, then $H_(+)^(1 \/ 2) s = 0$. Since $H_(+)$ is supported on $p_s$,
    and the range of $s$ is dense in its support space, this implies $H_(+) = 0$, as required. ◻
]

=== 6.5 Ultrapowers and bounded diagonalization <ultrapowers-and-bounded-diagonalization>

Fix a free ultrafilter $omega$ on $bb(N)$. We write

$ D_omega = ell^oo \( bb(N) \, D \) \/ { \( x_n \) : lim_(n arrow.r omega) parallel x_n parallel = 0 } \, $

and identify $D$ with its constant copy. For separable $A$,

$ "Ann" \( A \) = { x in A_omega ∩ A' : x a = a x = 0 upright(" for every ") a in A } . $

An approximate unit of $A$ gives the unit in $\( A_omega ∩ A' \) \/ "Ann" \( A \)$.
  We use c.p.c. lifting for separable nuclear domains [10] Theorem 3.10 and Corollary 3.11;
  in particular maps from a matrix algebra can be lifted to c.p.c. coordinate maps.

#thm([Lemma 6.5.])[
  (Bounded diagonalization).  #emph[Suppose a countable family of norm-continuous algebraic and
    functional-calculus conditions, with fixed coefficients in a norm ultrapower,
    is approximately satisfiable on every finite subfamily. Suppose each unknown has a fixed individual norm bound
    in these finite solutions. Then the conditions can be satisfied exactly in the ultrapower.
    Additional countably many commutator conditions and conditions after multiplication by a fixed countable
    subset of the algebra may be imposed in the same way.]
] <lem:diagonal>

#proof[
  For each $j$, choose an ultrapower solution of the first $j$ conditions to accuracy $1 \/ j$,
    and choose bounded coordinate representatives. Slightly enlarging each fixed bound once,
    and truncating representatives, gives bounds independent of $j$.
    There is an $omega$-large set on which these first $j$ coordinate conditions hold to accuracy $2 \/ j$.
    Replace these sets by decreasing finite intersections, also intersecting the $j$-th set with ${ n gt.eq j }$.
    They have empty intersection. At coordinate $n$, use the solution of the largest applicable level $j lt.eq n$,
    with an arbitrary bounded choice when no level applies. The chosen level tends to infinity along $omega$;
    each fixed condition therefore has error tending to zero.
    The bounds ensure that every unknown represents an element of the norm ultrapower.
    Positivity or complete positivity can be preserved by choosing positive or completely positive lifts at each
    level. ◻
]

We will also use the following reindexing observation. If a central sequence is to commute with finitely many
  already chosen coordinate values, then, at each output coordinate, those values are ordinary elements of $A$.
  Centrality supplies the required good set of old indices.
  It can be intersected with finitely many other good sets before choosing the new index.
  Any uniform coordinate predicate retained in this selection continues to hold.
  In the nonunital quotient, algebraic and unit defects are tested after multiplication by a dense subset of $A$;
  boundedness then extends the resulting relations to all of $A$.

== 7 Shrinking two hereditary supports <shr:section>

We will shrink two hereditary supports so that a prescribed cross-compression decreases by a fixed factor,
  while at least one new support remains nonzero in each irreducible representation where an original element has
  norm at least $1 \/ 2$. Repeated use of this operation will separate the supports in the norm-cone construction
  of Section 8. Only the two Cuntz-semigroup properties in (C) are needed; nuclearity is not used here.
  All Cuntz comparisons in hereditary subalgebras are understood in the ambient stabilization,
  with their witnesses compressed into the indicated corners as in the preliminaries.
  If $sigma$ is a representation, its matrix amplifications will also be denoted by $sigma$.

#thm([Lemma 7.1.])[
  (Two-support shrinking).  #emph[There is a numerical constant $0 < c <
    1$ with the following property for every $C^(*)$-algebra $A$ satisfying (C).
    If $a \, b in A$ are positive contractions and $z in tilde(A)$ satisfies $parallel p_a z p_b parallel lt.eq
    1$, there are positive contractions $a' in "her" \( a \)$ and $b' in "her" \( b \)$ such that
#[#set math.equation(numbering: n => "(7.1)")
 $ parallel p_(a') z p_(b') parallel lt.eq c $ <shr:conclusion>]

 and, for every irreducible representation $sigma$ of $A$,
#[#set math.equation(numbering: n => "(7.2)")
 $ max { parallel sigma \( a \) parallel \, parallel sigma \( b \) parallel } gt.eq 1 / 2 quad arrow.r.double quad
   sigma \( a' \) eq.not 0 med upright("or") med sigma \( b' \) eq.not 0 . $ <shr:visibility>]

 The support norms are computed in the bidual, or equivalently in the universal representation.]
] <lem:shrinking>

We first prove a transfer statement for two hereditary supports.
  It replaces finitely many rectangular elements by one contraction which has norm one in every representation
  where a prescribed element reaches a fixed norm threshold.

#thm([Lemma 7.2.])[
  (Transfer between two supports).  #emph[Suppose that $A$ satisfies (C).
    Let $B subset.eq A$ be hereditary, let $D in M_l \( B \)_(+)$ and $E in B_(+)$, and suppose that $w_1 \,
    dots.h \, w_m in M_(l \, 1) \( B \)$ satisfy
$ w_i w_i^(*) in "her" \( D \) \, wide w_i^(*) w_i in "her" \( E \) . $

 For each $delta > 0$ there is a contraction $v in M_(l \, 1) \( B \)$ such that
$ v v^(*) in "her" \( D \) \, wide v^(*) v in "her" \( E \) \, $

 and, in every representation $sigma$ of $B$,
$ max_(1 lt.eq i lt.eq m) parallel sigma \( w_i \) parallel gt.eq delta quad arrow.r.double quad
  parallel sigma \( v \) parallel = 1 . $

]
] <lem:transfer>

#proof[
  Set $T_0 = "diag" \( w_1^(*) w_1 \, dots.h \, w_m^(*) w_m \)$.
    The hereditary conditions and $\[ w_i^(*) w_i \] = \[ w_i w_i^(*) \]$ give
  $ \[ T_0 \] lt.eq m \[ E \] \, wide \[ T_0 \] lt.eq m \[ D \] . $
  By divisibility in (C), choose a positive element $r$ in a stabilization with
  $ \( m + 1 \) \[ r \] lt.eq \[ T_0 \] lt.eq \( m + 2 \) \[ r \] . $
  Almost unperforation, applied with $m$, gives $\[ r \] lt.eq \[ E \]$ and $\[ r \] lt.eq \[ D \]$.
    Choose $eta > 0$ sufficiently small that
  #[#set math.equation(numbering: n => "(7.3)")
   $ \[ \( T_0 - delta^2 \/ 2 \)_(+) \] lt.eq \( m + 2 \) \[ \( r - 2 eta \)_(+) \] . $ <shr:transfer-cut>]
  This is possible because the class on the left is compactly contained in $\[ T_0 \]$,
    and the classes $\( m + 2 \) \[ \( r - 2 eta \)_(+) \]$ increase to $\( m + 2 \) \[ r \]$.
  The cut-placement result in the preliminaries supplies partial isometries $u_E \,
    u_D$ which identify $"her" \( \( r - eta \)_(+) \)$ with hereditary subalgebras of $"her" \( E \)$ and
    $"her" \( D \)$, respectively. Their initial projection is the support of $\( r - eta \)_(+)$.
    Choose a continuous function $j$ with $0 lt.eq j lt.eq 1$, $j = 0$ on $\[ 0 \, eta \]$, and $j =
    1$ on $\[ 2 eta \, oo \)$. Then
  $ v = u_D j \( r \) u_E^(*) $
  belongs to $M_(l \, 1) \( B \)$: factor it as $\( u_D j \( r \)^(1 \/ 2) \) \( u_E j \( r \)^(1 \/ 2) \)^(*)$.
    Each factor belongs to the ambient stabilized algebra by cut placement,
    and the product’s left and right supports lie in the prescribed finite matrix corners. It is a contraction, and
  $ v^(*) v = u_E j \( r \)^2 u_E^(*) in "her" \( E \) \, wide v v^(*) = u_D j \( r \)^2 u_D^(*) in "her" \( D \) . $
  If $parallel sigma \( w_i \) parallel gt.eq delta$ for some $i$,
    then $sigma \( \( T_0 - delta^2 \/ 2 \)_(+) \) eq.not 0$.
    By (7.3), the source copy $u_E \( r - 2 eta \)_(+) u_E^(*)$ is nonzero in this representation:
    otherwise the comparison would make the represented left side zero.
    The operator $sigma \( v^(*) v \)$ is the identity on the support of that nonzero copy,
    since $j$ is one on its spectrum. Thus $parallel sigma \( v \) parallel = 1$. ◻
]

#proof[
  Suppose that no such constant exists. Fix numbers $c_n in \( 0 \, 1 \)$ increasing to $1$.
    For each $n$, choose an algebra satisfying (C) and data $a \, b \, z$ for which the conclusion fails with $c =
    c_n$. The algebras are allowed to vary; we suppress $n$ until the limiting argument.
    The construction below always gives (7.1), so failure will provide a representation in which both constructed
    positives vanish.
  #strong[Step 1: a matrix corner and two prospective supports.] Apply Lemma 17,
    with seven slots and a cut of $a$ below $1 \/ 2$, to obtain a c.p.c. order-zero map $M_7 arrow.r
    "her" \( a \)$ with weight $d$ satisfying
  #[#set math.equation(numbering: n => "(7.4)")
   $ parallel sigma \( a \) parallel gt.eq 1 / 2 quad arrow.r.double quad parallel sigma \( d \) parallel =
     1 . $ <shr:d-visibility>]
  Its supporting matrix units identify
  $ "her" \( d \) = M_7 \( B \) \, wide d = "diag" \( P \) \, $
  where $B$ is the hereditary algebra generated by its first diagonal weight and $P in
    B$ is a strictly positive contraction. Concretely, in any representation,
    the support space of $d$ is identified with $cal(H)^(xor 7)$, where $B$ acts nondegenerately on $cal(H)$.
    Choose $Q = min \( 1 \, 2 b \)$ by functional calculus. Then $Q in "her" \( b \)$ is a positive contraction and
  #[#set math.equation(numbering: n => "(7.5)")
   $ parallel sigma \( b \) parallel gt.eq 1 / 2 quad arrow.r.double quad parallel sigma \( Q \) parallel =
     1 . $ <shr:Q-visibility>]
  We shall choose contractions $v_0 in M_(2 \, 1) \( B \)$ and $v_1 in M_(3 \, 1) \( B \)$.
    For any such choice set, in multiplier notation,
  #[#set math.equation(numbering: n => "(7.6)")
   $ U =
     vec(1 / 2 thin 1, 1 / 2 v_0, 1 / 2 v_1, #scale(x: 120%, y: 120%)[\(] 3 / 4 thin 1 - 1 / 4 v_0^(*) v_0 - 1 / 4
     v_1^(*) v_1 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)) \, wide L = U P U^(*) in M_7 \( B \) \, wide t = 1 /
     2 . $ <shr:U>]
  The expression under the square root is at least $1 / 4 thin 1$, and $U^(*) U = 1$. Define
  #[#set math.equation(numbering: n => "(7.7)")
   $ a' = \( L - t \)_(+) \, wide b' = Q #scale(x: 120%, y: 120%)[\[] Q \( c_n^2 t - z^(*) L z \) Q
     #scale(x: 120%, y: 120%)[\]]_(+) Q . $ <shr:ab-prime>]
  These belong to $"her" \( a \)$ and $"her" \( b \)$, respectively. They are contractions:
    $0 lt.eq L lt.eq 1$, and the selfadjoint operator inside the positive part in the second expression is bounded
    above by $c_n^2 t thin 1$. By Lemma 18, the compression of $z^(*) L
    z$ to the support of $b'$ is at most $c_n^2 t$. Since $L gt.eq t p_(a')$, this implies
  $ t p_(b') z^(*) p_(a') z p_(b') lt.eq p_(b') z^(*) L z p_(b') lt.eq c_n^2 t p_(b') \, $
  which proves (7.1) with $c_n$, for every choice of the two columns.
  #strong[Step 2: data chosen before either column.] Put $Z = p_d z Q$ and write its rows in groups of sizes $1 \,
    2 \, 3 \, 1$ as $Z_(upright(f)) \, Z_0 \, Z_1 \, Z_(upright("last"))$.
    These are operators from the original representation space to the corresponding copies of $cal(H)$.
    The hypothesis on $z$ gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ Z^(*) Z lt.eq Q^2 \, $ <shr:Z-bound>]
  because $p_d lt.eq p_a$ and $p_b Q = Q$. Thus $Z$ has norm at most one,
    even though no uniform bound on $z$ itself is assumed.
  The next choices address the only way the prospective supports can fail to retain visibility.
    For any choice of the columns, a representation in which $a' = b' = 0$ would have $P lt.eq t$ and,
    by the zero case of Lemma 18,
  #[#set math.equation(numbering: n => "(7.9)")
   $ c_n^2 t Q^2 lt.eq Z^(*) U P U^(*) Z lt.eq t Z^(*) Z lt.eq t Q^2 . $ <shr:alignment-chain>]
  As $c_n arrow.r 1$, these inequalities force the limiting range of $Z$ into the range of $U$,
    with its $U$-coordinate in the $t$-spectral subspace of $P$. Step 5 proves this alignment precisely.
    Since the first row of $U$ is $1 \/ 2$, the first row of $Z$ then recovers that coordinate.
    The following cutoffs implement this recovery within the hereditary corner, before either column has been chosen.
  Fix continuous functions on $\[ 0 \, 1 \]$ by
  $ g \( x \) = min { 1 \, max { 0 \, 8 x - 2 } } \, wide G \( x \) = min { 1 \, 4 x } . $
  They vanish at zero, satisfy $G g = g$, and $g \( t \) = G \( t \) = 1$. Set
  #[#set math.equation(numbering: n => "(7.10)")
   $ X = 2 g \( P \) Z_(upright(f)) \, wide h_0 = X X^(*) \, wide Y_i =
     2 "diag" \( G \( P \) \) Z_i X^(*) quad \( i = 0 \, 1 \) . $ <shr:XY>]
  Here $h_0 in B_(+)$, $Y_0 in M_(2 \, 1) \( B \)$, and $Y_1 in M_(3 \, 1) \( B \)$.
    For example, their entries are the appropriate entries of sandwiches of $z Q^2
    z^(*)$ by $g \( d \)$ and $G \( d \)$; these sandwiches belong to $"her" \( d \)$. We have
  #[#set math.equation(numbering: n => "(7.11)")
   $ parallel X parallel lt.eq 2 \, quad parallel h_0 parallel lt.eq 4 \, quad parallel Y_i parallel lt.eq 4 \,
     wide G \( P \) h_0 = h_0 = h_0 G \( P \) . $ <shr:initial-bounds>]
  In particular, $G \( P \)$ acts as the identity on the support of $h_0$. None of these data depends on $v_0$ or $v_1$.
  For later use fix
  $ r = 1 / 8 \, wide W_j = r^(- 1) \( Y_0 \)_j^(*) quad \( j = 1 \, 2 \) \, wide f = f \( h_0 \) \, quad
    f \( x \) = min { 1 \, max { 0 \, 4 x - 1 } } quad \( x gt.eq 0 \) . $
  Thus $f$ vanishes on $\[ 0 \, 1 \/ 4 \]$ and is one on $\[ 1 \/ 2 \, oo \)$.
    With $u = W_1 f$ and $c_f = \( 1 - f^2 \)^(1 \/ 2)$, put $V = u + c_f$ in $tilde(B)$ and define
  #[#set math.equation(numbering: n => "(7.12)")
   $ T = 1 - V V^(*) = f^2 - u u^(*) - u c_f - c_f u^(*) in B . $ <shr:T>]
  This selfadjoint element records the prospective range complement of $V$.
    At this stage $V$ need not be an isometry and $T$ need not be positive.
    Step 7 will produce a reducing subspace in the failure limit on which $V$ is an isometry and $T$ is a nonzero
    projection. We use the positive spectral part of $T$ now to prepare the second column,
    which will rule out that possibility. The bounds above give $parallel W_j parallel lt.eq 32$,
    $parallel u parallel lt.eq 32$, and $parallel T parallel lt.eq 1089$. Fix on $bb(R)$ the continuous functions
  $ beta \( x \) = min { 1 \, max { 0 \, 2 x - 1 } } \, wide chi \( x \) = min { 1 \, max { 0 \, 4 x - 1 } } . $
  They vanish at zero, $beta$ vanishes on $\( - oo \, 1 \/ 2 \]$, $beta \( 1 \) = 1$, and $chi beta = beta$. Put
  #[#set math.equation(numbering: n => "(7.13)")
   $ b_T = beta \( T \) \, wide B_T = "her"_B \( b_T \) \, wide y =
     "diag" \( b_T \) Y_1 b_T in M_(3 \, 1) \( B_T \) \, wide S = "diag" \( b_T \) in M_3 \( B_T \) . $ <shr:BT-y>]
  We have $parallel y parallel lt.eq 4$, and $S$ is strictly positive in $M_3 \( B_T \)$.
  #strong[Step 3: the second column and bounded comparison witnesses.] Apply Lemma 17 with two slots inside
    $"her" \( \( y y^(*) - 10^(- 3) \)_(+) \)$, using the narrower cut $\( y y^(*) - 10^(- 2) \)_(+)$.
    The plateau of the slot weights may be chosen equal to one on the transported narrower element.
    To use the contraction form of that Lemma explicitly, take $b = \( y y^(*) - 10^(- 3) \)_(+) \/
    16$ and $epsilon.alt = 9 dot.op 10^(- 3) \/ 16$; positive rescaling preserves all the hereditary algebras and
    Cuntz classes in question. We obtain equivalent orthogonal positive contractions $k \, k' in M_3 \( B_T \)$ with
  #[#set math.equation(numbering: n => "(7.14)")
   $ k \, k' in "her" \( \( y y^(*) - 10^(- 3) \)_(+) \) \, wide \[ \( y y^(*) - 10^(- 2) \)_(+) \] lt.eq
     3 \[ \( k - 0.9 \)_(+) \] . $ <shr:k-comparison>]
  If this hereditary algebra is zero, take $k = k' = 0$; the same assertions hold.
    Choose three matrices $x_j in M_3 \( B_T \)$ witnessing
  $ ∥\( y y^(*) - 0.01 \)_(+) - sum_(j = 1)^3 x_j^(*) \( k - 0.9 \)_(+) x_j∥ < 0.005 . $
  There are three matrices because the right side of the comparison is a threefold direct sum;
    rectangular witnesses can be split into its three blocks. Replace $x_j$ by
  $ q_j = (frac(\( k - 0.9 \)_(+), \( k - 0.8 \)_(+)))^(1 \/ 2) x_j \, $
  where the quotient is defined to be zero when its denominator is zero. This is a continuous function of $k$. Then
  #[#set math.equation(numbering: n => "(7.15)")
   $ ∥\( y y^(*) - 0.01 \)_(+) - sum_(j = 1)^3 q_j^(*) \( k - 0.8 \)_(+) q_j∥ < 0.005 \, wide
     parallel q_j parallel lt.eq sqrt(160) < 13 . $ <shr:bounded-witnesses>]
  Indeed the compression sum before replacement is positive and has norm less than $16$,
    so each summand has norm less than $16$. Also
  $ frac(\( k - 0.9 \)_(+), \( k - 0.8 \)_(+)) lt.eq 10 \( k - 0.9 \)_(+) . $
  These give $q_j^(*) q_j lt.eq 10 x_j^(*) \( k - 0.9 \)_(+) x_j$ and the stated bound.
    The positive gap between the two cuts is what makes these witnesses uniformly bounded.
  Choose $p' = min \( 1 \, k \/ 0.8 \)$ and put
  $ D' = \( 1 - p' \) S \( 1 - p' \) in M_3 \( B_T \)_(+) . $
  We claim that
  #[#set math.equation(numbering: n => "(7.16)")
   $ 3 \[ b_T \] = \[ S \] lt.eq \[ k \] + \[ D' \] lt.eq 2 \[ D' \] . $ <shr:Dprime-comparison>]
  For the first inequality, sandwich $1 / 2 thin 1 lt.eq \( p' \)^2 + \( 1 - p' \)^2$ by $S^(1 \/ 2)$.
    The resulting two summands have the classes of $p' S p'$ and $\( 1 - p' \) S \( 1 - p' \)$,
    and $p' S p' in "her" \( k \)$. For the second inequality it suffices to check that $k' in "her" \( D' \)$,
    since $\[ k \] = \[ k' \]$. Orthogonality gives $\( 1 - p' \) k' \( 1 - p' \) = k'$.
    Since $S$ is strictly positive, there are positive elements $c_j arrow.r k'$ with $c_j lt.eq
    C_j S$ for finite constants $C_j$: one may take $c_j = e_j k' e_j$ with $e_j = S \( S + 1 \/ j \)^(- 1)$.
    Consequently
  $ \( 1 - p' \) c_j \( 1 - p' \) lt.eq C_j D' \, wide \( 1 - p' \) c_j \( 1 - p' \) arrow.r k' \, $
  which proves the inclusion and (7.16).
  Almost unperforation now gives $\[ b_T \] lt.eq \[ D' \]$.
    Cut placement supplies a column $v_1 in M_(3 \, 1) \( B_T \)$ with
  #[#set math.equation(numbering: n => "(7.17)")
   $ v_1^(*) v_1 = \( b_T - 1 \/ 4 \)_(+) \, wide v_1 v_1^(*) in "her" \( D' \) \, wide
     parallel v_1 parallel lt.eq 1 . $ <shr:v1>]
  Since $\( k - 0.8 \)_(+) \( 1 - p' \) = 0$, its range condition implies
  #[#set math.equation(numbering: n => "(7.18)")
   $ \( k - 0.8 \)_(+) v_1 = 0 . $ <shr:v1-annihilation>]
  We shall also retain the following fixed continuous support identities:
  #[#set math.equation(numbering: n => "(7.19)")
   $ \( 10^(- 3) - y y^(*) \)_(+) k = 0 \, wide chi \( T \) \( v_1 \)_j = \( v_1 \)_j = \( v_1 \)_j chi \( T \)
     quad \( 1 lt.eq j lt.eq 3 \) . $ <shr:fixed-supports>]
  The first follows from (7.14); the second holds because $chi \( T \) b_T =
    b_T$ and the entries of $v_1$ belong to $B_T$. These equations,
    unlike statements about varying support projections, pass directly to an operator ultraproduct.
  #strong[Step 4: finite word tests and the first column.] Let $p$ be the continuous function of $Y_0
    Y_0^(*)$ which is zero up to $r^2$, linear between $r^2$ and $\( r + 1 \/ n \)^2$, and one thereafter. Put
  #[#set math.equation(numbering: n => "(7.20)")
   $ s = "diag" \( \( h_0 - 1 \/ 4 \)_(+) \) in M_2 \( B \) \, wide E = \( h_0 - 1 \/ 2 \)_(+) in B \, wide D =
     s #scale(x: 120%, y: 120%)[\[] s \( 1 / 4 - p \) s #scale(x: 120%, y: 120%)[\]]_(+) s in M_2 \( B \) . $ <shr:DE>]
  Choose an ordered alphabet consisting of all entries of
  #[#set math.equation(numbering: n => "(7.21)")
   $ P \, h_0 \, Y_0 \, Y_1 \, p \, s \, E \, D \, T \, b_T \, y \, k \, k' \, D' \, v_1 \, q_1 \, q_2 \,
     q_3 $ <shr:alphabet>]
  and their adjoints. The number of letters is independent of $n$, as all matrix sizes are fixed.
    Their norms are bounded independently of the instance: the bounds already given apply, $parallel s parallel \,
    parallel E parallel lt.eq 4$, $parallel D parallel lt.eq 256$, and $p \, k \, k' \, b_T \, D' \,
    v_1$ are contractions. Thus, for example, $1089$ is a common bound on every letter.
    Neither $v_0$ nor $U$ is a letter.
  Apply Lemma 21 to the finite list of columns
  #[#set math.equation(numbering: n => "(7.22)")
   $ D upright(bold(e))_j x E \, wide j = 1 \, 2 \, quad x upright(" a word of length at most ") n \,
     $ <shr:word-tests>]
  including the empty word $x = 1$, with threshold $1 \/ n$.
    Here $upright(bold(e))_j$ is the $j$th scalar basis column.
    The left and right squared moduli of these columns lie in $"her" \( D \)$ and $"her" \( E \)$, respectively.
    The resulting contraction $v_0 in M_(2 \, 1) \( B \)$ satisfies
  #[#set math.equation(numbering: n => "(7.23)")
   $ v_0 v_0^(*) in "her" \( D \) \, wide v_0^(*) v_0 in "her" \( E \) \, wide v_0^(*) p v_0 lt.eq 1 /
     4 v_0^(*) v_0 . $ <shr:v0>]
  The last assertion is Lemma 18 applied to the pencil defining $D$. In addition, we have the exact operator identities
  #[#set math.equation(numbering: n => "(7.24)")
   $ \( 1 \/ 2 - h_0 \)_(+) v_0^(*) = 0 \, wide "diag" \( G \( P \) \) v_0 = v_0 . $ <shr:v0-fixed>]
  For the first use the right hereditary condition. For the second,
    the support of $D$ is contained in that of $s$, and $G \( P \)$ fixes the support of $h_0$ by (7.11).
    The choice of $v_1$, all the comparison witnesses, and the whole alphabet precedes the choice of $v_0$,
    so the construction is not circular.
  #strong[Step 5: failure forces alignment in a Hilbert ultraproduct.] Make the choices above at coordinate $n$
    and define $a' \, b'$ by (7.7). Since they satisfy the required angle bound,
    the assumed failure gives an irreducible representation $sigma_n$ such that
  $ max { parallel sigma_n \( a \) parallel \, parallel sigma_n \( b \) parallel } gt.eq 1 / 2 \, wide
    sigma_n \( a' \) = sigma_n \( b' \) = 0 . $
  Use the same symbols for the represented operators. The first vanishing gives $L lt.eq t$, hence $P =
    U^(*) L U lt.eq t$. By (7.4), the $a$-trigger is impossible. Therefore $parallel Q parallel = 1$ by (7.5).
    The two vanishings also give the conditional inequalities (7.9) established in Step 2.
  Pass along the fixed free ultrafilter to Hilbert-space ultraproducts of the representation spaces and of their
    first matrix-coordinate spaces. For clarity, such an ultraproduct is the completion of bounded sequences of
    vectors modulo those whose norms tend to zero along the ultrafilter,
    with inner product the ultralimit of the coordinate inner products.
    Uniformly bounded operator sequences act on these spaces, respect sums, products and adjoints,
    and have norm equal to the ultralimit of their norms. The last assertion follows by choosing a nearly
    norm-maximizing unit vector at each coordinate. Fixed continuous functional calculus is preserved,
    by uniform polynomial approximation on a common spectral interval.
    All operators used here are uniformly bounded: in addition to the alphabet this includes $Q \, Z \, X \, U \,
    v_0$, by (7.8), (7.11), and (7.6). We keep the same notation for their limits.
  Equality holds throughout (7.9). In particular $Z^(*) Z = Q^2$ and $Z^(*) \( t 1 - U P U^(*) \) Z = 0$. Since
  $ t 1 - U P U^(*) = t \( 1 - U U^(*) \) + U \( t - P \) U^(*) $
  is a sum of positive operators, both positive summands annihilate $Z$. For $xi = U^(*) Z$, it follows that
  #[#set math.equation(numbering: n => "(7.25)")
   $ Z = U xi \, wide P xi = t xi \, wide xi^(*) xi = Q^2 . $ <shr:alignment>]
  The first row of $U$ is $1 \/ 2$, so $X = 2 g \( P \) Z_(upright(f)) = xi$. Consequently
  #[#set math.equation(numbering: n => "(7.26)")
   $ parallel h_0 parallel = 1 \, wide Y_i = "diag" \( G \( P \) \) v_i h_0 \, wide Y_0 = v_0 h_0 . $ <shr:limit-Y>]
  The last equality uses the second identity in (7.24).
  #strong[Step 6: the moving cutoff makes every word test vanish.] Although the function defining $p$ changes with
    $n$, $p$ itself is a bounded alphabet variable. At each coordinate it commutes with $R_0 =
    Y_0 Y_0^(*)$ and satisfies
  $ \( r^2 - R_0 \)_(+) p = 0 \, wide parallel \( 1 - p \) \( R_0 - r^2 \)_(+) parallel lt.eq \( r + 1 \/ n \)^2 -
    r^2 . $
  Thus in the limit
  #[#set math.equation(numbering: n => "(7.27)")
   $ \[ p \, R_0 \] = 0 \, wide \( r^2 - R_0 \)_(+) p = 0 \, wide \( 1 - p \) \( R_0 - r^2 \)_(+) =
     0 . $ <shr:moving-cutoff>]
  The first two equations show that the support of $p$ lies in the spectral subspace of $R_0$ for
    $\[ r^2 \, oo \)$, hence in the closure of the range of $Y_0$, and therefore of $v_0$ by (7.26).
    On this last closed range the inequality $v_0^(*) p v_0 lt.eq 1 /
    4 v_0^(*) v_0$ says that the quadratic form of $p$ is at most one quarter of the squared norm.
    This follows first on vectors $v_0 eta$, then by density; on the orthogonal complement $p$ is zero. Hence
  #[#set math.equation(numbering: n => "(7.28)")
   $ 0 lt.eq p lt.eq 1 / 4 thin 1 . $ <shr:p-small>]
  The last equation in (7.27), and invertibility of $1 - p$, now give $R_0 lt.eq r^2$.
    The other support equation then gives
  #[#set math.equation(numbering: n => "(7.29)")
   $ parallel Y_0 parallel lt.eq r \, wide R_0 p = r^2 p . $ <shr:R0>]
  Every fixed word $x$ in the limiting alphabet satisfies
  #[#set math.equation(numbering: n => "(7.30)")
   $ D upright(bold(e))_j x E = 0 wide \( j = 1 \, 2 \) . $ <shr:all-word-tests>]
  Indeed, if such an operator had norm $delta > 0$, its coordinate norms would be at least $delta \/
    2$ on an ultrafilter-large set. On an ultrafilter-large subset we also have $n gt.eq
    "length" \( x \)$ and $1 \/ n lt.eq delta \/ 2$. The transfer condition used in (7.22) would give $parallel
    v_0 parallel = 1$ in the ultraproduct. The first equation in (7.24) puts the range of $v_0^(*)$ in the $h_0
    gt.eq 1 \/ 2$ spectral subspace. Inverting $h_0$ on that subspace, with inverse norm at most two, gives
  $ parallel v_0 h_0 parallel gt.eq 1 / 2 parallel v_0 parallel = 1 / 2 . $
  This contradicts $Y_0 = v_0 h_0$ and (7.29), since $r = 1 \/ 8$.
  #strong[Step 7: a nonzero defect projection on the word space.] Let $cal(H)$ denote the limiting
    single-coordinate Hilbert space and set
  $ cal(L) = overline("span") { x E eta : x upright(" a word in the alphabet") \, med eta in cal(H) } . $
  The alphabet includes adjoints, so $cal(L)$ reduces every letter and the $C^(*)$-algebra they generate.
    Restrict letters to this space, and matrix variables to its amplifications.
    Equation (7.30) gives $D = 0$ on $cal(L)^(xor 2)$. Moreover $E cal(H) subset.eq cal(L)$,
    so the restriction retains $parallel E parallel = 1 \/ 2$, hence $parallel h_0 parallel = 1$.
    We do not assert that $v_0$ reduces $cal(L)$. All further calculations involve only alphabet operators and
    their continuous functions. The needed range information from $v_0$ has already become the identity
  #[#set math.equation(numbering: n => "(7.31)")
   $ \( 1 \/ 2 - h_0 \)_(+) W_j = 0 wide \( j = 1 \, 2 \) \, $ <shr:W-range>]
  which follows on the full limiting space from $W_j = r^(- 1) h_0 \( v_0 \)_j^(*)$ and (7.24),
    and thus restricts to $cal(L)$.
  By the zero case of Lemma 18, $D = 0$ implies $s \( 1 / 4 - p \) s lt.eq 0$.
    Equation (7.28) gives the reverse inequality, so $s \( 1 / 4 - p \) s = 0$.
    Taking a positive square root shows $\( 1 / 4 - p \) s = 0$, or $p s = s \/ 4$. Together with (7.29), this yields
  #[#set math.equation(numbering: n => "(7.32)")
   $ R_0 s = r^2 s . $ <shr:Rs>]
  Let $e = 1_(\( 1 \/ 4 \, oo \)) \( h_0 \)$ on $cal(L)$. The range of $s$ is dense in $\( e cal(L) \)^(xor 2)$,
    so (7.32) implies
  $ \( W_i e \)^(*) \( W_j e \) = delta_(i j) e wide \( 1 lt.eq i \, j lt.eq 2 \) . $
  Thus $W_1 \, W_2$ restricted to $e cal(L)$ are isometries with orthogonal ranges.
    By (7.31), their ranges lie in the $h_0 gt.eq 1 \/ 2$ subspace, where $f = 1$.
  It follows that $u = W_1 f$ satisfies $u^(*) u = f^2$ and $c_f u = 0$, hence also $u^(*) c_f = 0$. Consequently
  $ V^(*) V = f^2 + c_f^2 = 1 . $
  Its range-complement projection is exactly
  #[#set math.equation(numbering: n => "(7.33)")
   $ 1 - V V^(*) = f^2 - u u^(*) - u c_f - c_f u^(*) = T . $ <shr:T-projection>]
  Both the initial and final supports of $u$ are contained in $e$, and $f = e f$.
    As $c_f$ commutes with $e$, formula (7.33) shows $T = e T e$. In particular
  #[#set math.equation(numbering: n => "(7.34)")
   $ T h_0 T gt.eq 1 / 4 T . $ <shr:ThT>]
  This projection is nonzero. Indeed $W_2 f eq.not 0$ because $parallel h_0 parallel = parallel f parallel =
    1$ and $W_2$ is isometric on $e cal(L)$, whereas
  $ V^(*) W_2 f = f W_1^(*) W_2 f + c_f W_2 f = 0 . $
  Its nonzero range is therefore contained in the range of $T$.
  #strong[Step 8: the second column gives the contradiction.] Since $T$ is now a projection, $b_T = beta \( T \) =
    T$ and $chi \( T \) = T$. The fixed identities (7.19) give
  $ T \( v_1 \)_j = \( v_1 \)_j = \( v_1 \)_j T . $
  They hold after restriction because $v_1$ was included in the alphabet.
    As $G \( P \)$ fixes the support of $h_0$ and $T = e T e$, it also fixes $T$;
    thus $"diag" \( G \( P \) \) v_1 = v_1$. Using (7.13), (7.17), and (7.26), we obtain
  #[#set math.equation(numbering: n => "(7.35)")
   $ y = v_1 T h_0 T \, wide v_1^(*) v_1 = 3 / 4 T \, wide y^(*) y = 3 / 4 \( T h_0 T \)^2 gt.eq 3 /
     64 T . $ <shr:final-y>]
  In particular, $parallel y y^(*) parallel gt.eq 3 \/ 64$.
  The three uniformly bounded witnesses in (7.15) survive both the ultraproduct and the restriction, giving
  $ ∥\( y y^(*) - 0.01 \)_(+) - sum_(j = 1)^3 q_j^(*) \( k - 0.8 \)_(+) q_j∥ lt.eq 0.005 . $
  Hence $q = \( k - 0.8 \)_(+)$ is nonzero: otherwise $parallel y y^(*) parallel lt.eq 0.015 < 3 \/ 64$,
    contradicting (7.35). On the other hand, (7.18) and (7.35) imply $q y = 0$.
    The first fixed support identity in (7.19) puts the range of $k$, and hence of $q$,
    in the spectral subspace of $y y^(*)$ for $\[ 10^(- 3) \, oo \)$. Therefore
  $ 0 = q y y^(*) q gt.eq 10^(- 3) q^2 \, $
  forcing $q = 0$. This contradiction proves the existence of the constant $c$ and completes the proof. ◻
]

== 8 Norm-visible central matrix cones <norm:section>

The construction in this section detects a prescribed positive element uniformly in the irreducible
  representations at each coordinate. Its building blocks are finite word spaces at pure states.
  Lemma 20 lets us separate their hereditary supports while retaining all the representations that must be detected.

#thm([Proposition 8.1.])[
  #emph[Suppose that $A$ is separable and satisfies (C). For every positive contraction $x in A$,
    every $gamma > 0$, and every integer $k gt.eq 2$, there are c.p.c. maps $nu_n : M_k arrow.r A$ such that
$ nu : M_k arrow.r A_omega ∩ A' \, wide nu \( z \) = \[ \( nu_n \( z \) \)_n \] \, $

 is order zero, and there is a number $kappa > 0$ for which
#[#set math.equation(numbering: n => "(8.1)")
 $ upright("for every ") n in bb(N) upright(" and every irreducible representation ") sigma upright(" of ") A \,\
parallel sigma \( x \) parallel gt.eq gamma med arrow.r.double med
  parallel sigma \( x nu_n \( 1 \) \) parallel gt.eq kappa . $ <norm:coordinate-visibility>]

 One may take $kappa = gamma^2 \/ 32$. In particular, the estimate holds on one $omega$-large set of coordinates
   simultaneously for every irreducible representation, including representations chosen separately at each coordinate.]
] <prop:norm>

We first establish the uniformity and compression facts used in the proof.
  All support projections below are taken in the bidual, or in the universal representation,
  and each representation is extended normally to the bidual when support estimates are used.

=== 8.1 Finite covers and pure-state compression <finite-covers-and-pure-state-compression>

For $x in A_(+)$ and $gamma > 0$, write

$ cal(K) \( x \, gamma \) = { sigma : sigma upright(" is an irreducible representation of ") A \, med
  parallel sigma \( x \) parallel gt.eq gamma } . $

There is no compactness assumption on the primitive ideal space.

#thm([Lemma 8.2.])[
  #emph[Let $x in A_(+)$, $gamma > 0$, and let $\( s_alpha \)_(alpha in Lambda)$ be positive elements of $A$.
    Suppose that $cal(K) \( x \, gamma \) eq.not diameter$ and that, for every $sigma in cal(K) \( x \, gamma \)$,
    some $sigma \( s_alpha \)$ is nonzero. Then there are $alpha_1 \, dots.h \, alpha_m$ and $t > 0$ such that
$ sigma in cal(K) \( x \, gamma \) quad arrow.r.double quad
  max_(1 lt.eq i lt.eq m) parallel sigma \( s_(alpha_i) \) parallel > t . $

 Thus the nonvanishing loci of the cuts $\( s_(alpha_i) - t \)_(+)$ still cover $cal(K) \( x \, gamma \)$.
   For a finite covering family of positive contractions, continuous functional calculus can replace its members
   by positive contractions with the same supports and with maximum represented norm equal to one at every $sigma
   in cal(K) \( x \, gamma \)$.]
] <norm:finite-cover>

#proof[
  Let $I$ be the closed ideal generated by all the $s_alpha$, and let $q : A arrow.r A \/ I$ be the quotient map.
    We claim that $parallel q \( x \) parallel < gamma$. Otherwise,
    a pure state of the unitization of $A \/ I$ can be chosen to take the value $parallel q \( x \)
    parallel$ on $q \( x \)$. For completeness, the states taking that value form a nonempty compact face of the
    state space: nonemptiness follows by extending the norm-attaining state of the commutative algebra generated
    by $q \( x \)$ and the unit. An extreme point of that face is a pure state.
    Its value on $q \( x \)$ is positive, so its irreducible representation restricts nontrivially to $A \/ I$.
    Pulling that representation back to $A$ gives an element of $cal(K) \( x \, gamma \)$ annihilating every
    $s_alpha$, a contradiction.
  The strict quotient-norm inequality permits a finite sum
  $ y = sum_(j = 1)^r u_j s_(alpha \( j \)) v_j \, wide u_j \, v_j in tilde(A) \, wide parallel x -
    y parallel < gamma . $
  Indeed, these finite sums are dense in $I$, and the distance from $x$ to $I$ is strictly less than $gamma$.
    Choose $t > 0$ so small that
  $ y_t = sum_(j = 1)^r u_j \( s_(alpha \( j \)) - t \)_(+) v_j quad upright("satisfies") quad parallel x -
    y_t parallel < gamma . $
  If a representation annihilates every cut appearing in this sum, then $parallel sigma \( x \) parallel lt.eq
    parallel x - y_t parallel < gamma$. This proves the first assertions.
  For the last assertion apply what was just proved to the given finite family and put $f_t \( u \) =
    min { u \/ t \, 1 }$ for $u gt.eq 0$. The function $f_t$ vanishes only at zero, so it preserves supports.
    Whenever $parallel sigma \( s_i \) parallel > t$, functional calculus gives $parallel
    sigma \( f_t \( s_i \) \) parallel = 1$. ◻
]

The following compression is the pure-state excision principle of Akemann, Anderson,
  and Pedersen [1] Proposition 2.2. We include a proof using Kadison’s transitivity theorem and the pure-state
  kernel identity [20] Theorem 1 and Corollary 2.

#thm([Lemma 8.3.])[
  (Pure-state compression).  #emph[Let $lambda$ be a pure state of a unital $C^(*)$-algebra $D$,
    with irreducible GNS representation $\( pi \, cal(H) \, xi \)$.
    Given a finite subset $cal(E) subset D$ and $epsilon.alt > 0$, there is a positive contraction $q in D$ such that
$ pi \( q \) xi = xi \, wide parallel q y q - lambda \( y \) q^2 parallel < epsilon.alt quad \( y in cal(E) \) . $

]
] <norm:excision>

#proof[
  Set
  $ J = { z in D : pi \( z \) xi = 0 } \, wide H = J ∩ J^(*) . $
  The space $J$ is a closed left ideal, and $H$ is a hereditary $C^(*)$-subalgebra.
    For the latter assertion, it is a closed selfadjoint subalgebra, and if $0 lt.eq a lt.eq b$ with $b in H_(+)$,
    then $lambda \( a \) lt.eq lambda \( b \) = 0$, so $pi \( a \) xi = 0$.
  We show that
  #[#set math.equation(numbering: n => "(8.2)")
   $ ker lambda = J + J^(*) . $ <norm:state-kernel>]
  The inclusion from right to left is immediate. For the converse, let $lambda \( y \) = 0$ and put $zeta =
    pi \( y \) xi$, which is orthogonal to $xi$. If $zeta = 0$, then $y in J$.
    Otherwise, on $K = "span" { xi \, zeta }$, define $R xi = zeta$ and $R zeta = 0$.
    The selfadjoint form of Kadison’s Transitivity Theorem [20] supplies selfadjoint $h \,
    g in D$ whose restrictions to $K$ are respectively $"Re" R$ and $"Im" R$. Thus $v = h + i g$ satisfies
  $ pi \( v \) xi = zeta \, wide pi \( v^(*) \) xi = 0 . $
  Consequently $y - v in J$ and $v in J^(*)$, proving (8.2).
  Let $\( e_alpha \)$ be a positive contractive approximate unit for $H$ and put $q_alpha = 1 - e_alpha$.
    Each $q_alpha$ fixes $xi$. For $z in J$, the element $z^(*) z$ belongs to $H$, and hence
  $ parallel z q_alpha parallel^2 = parallel q_alpha z^(*) z q_alpha parallel arrow.r 0 . $
  Its adjoint gives $parallel q_alpha z^(*) parallel arrow.r 0$. Applying (8.2) to $y - lambda \( y \) 1$ now gives
  $ parallel q_alpha \( y - lambda \( y \) 1 \) q_alpha parallel arrow.r 0 wide \( y in D \) . $
  Choose one index sufficiently late for all the finitely many tests. ◻
]

We will apply excision to make finitely many word representatives almost orthonormal on one hereditary support.
  Their Gram matrix will control the norm of the row formed from these representatives.
  We also estimate how that row intertwines the action of each prescribed element below the outermost word level;
  a taper will later remove that boundary level.

To construct this matrix form of the compression, fix a finite set $F subset A$ of selfadjoint contractions,
  $d gt.eq 1$, and $0 < eta < 1$. Suppose $sigma in cal(K) \( x \, gamma \)$, where $x$ is a positive contraction.
  Choose a unit vector $xi$ with

$ lambda \( x \) := chevron.l sigma \( x \) xi \, xi chevron.r > gamma \/ 2 . $

Every nonzero vector in an irreducible representation is cyclic, so this is a pure state of $tilde(A)$.
  Let $cal(H)_l$ be the span of the vectors $sigma \( w \) xi$, where $w$ is a word of length at most $l$ in $F$,
  with the empty word equal to $1$. These finite-dimensional spaces form an increasing filtration

$ bb(C) xi = cal(H)_0 subset.eq cal(H)_1 subset.eq dots.h.c subset.eq cal(H)_d . $

Choose an orthonormal basis $xi_1 \, dots.h \, xi_m$ adapted to this filtration, with $xi_1 = xi$.
  Write $xi_j = sigma \( b_j \) xi$, where $b_j in tilde(A)$ is a finite linear combination of the appropriate
  words; take $b_1 = 1$. Let $l_j in { 0 \, dots.h \, d }$ be the level of $xi_j$.
  There is exactly one level-zero vector.

For $a in F$, let $M_a in M_m$ be the matrix of its compression to $cal(H)_d$ in this basis.
  It is a selfadjoint contraction. Moreover,

#[#set math.equation(numbering: n => "(8.3)")
 $ \( M_a \)_(i j) = 0 quad upright("if ") \| l_i - l_j \| > 1 . $ <norm:banded-model>]

Indeed, $a cal(H)_l subset.eq cal(H)_(l + 1)$ for $l < d$;
  orthogonality to the filtration proves one half of the assertion, and selfadjointness proves the other.
  For $l_j < d$, put

$ r_j \( a \) = a b_j - sum_(l = 1)^m b_l \( M_a \)_(l j) . $

Since $a xi_j in cal(H)_d$, these residuals satisfy $sigma \( r_j \( a \) \) xi = 0$.

#thm([Lemma 8.4.])[
  #emph[For this finite word model there is a positive contractive seed $s in A$ with $sigma \( s \) eq.not 0$,
    whose support $P = p_s$ satisfies
#[#set math.equation(numbering: n => "(8.4)")
 $ P x P & gt.eq \( gamma \/ 4 \) P \,\
parallel \( P b_i^(*) b_j P \)_(i \, j = 1)^m - I_m ⊗ P parallel & lt.eq eta^2 \/ 4 \,\
parallel \( P r_i \( a \)^(*) r_j \( a \) P \)_(l_i \, l_j < d) parallel & lt.eq
  eta^2 \/ 4 wide \( a in F \) . $ <norm:positive-compression>]

 Every positive element in $"her" \( s \)$ has a support on which the same three estimates hold.]
] <norm:prototype>

#proof[
  Apply Lemma 24 in $tilde(A)$ to $x$, all $b_i^(*) b_j$, and all $r_i \( a \)^(*) r_j \( a \)$.
    Their state values are respectively $lambda \( x \) > gamma \/ 2$, $delta_(i j)$, and zero.
    Choose the excision error at most $gamma \/ 16$ for $x$, and at most $eta^2 \/ \( 16 m \)$ for each of the
    matrix entries. Put
  $ P_0 = 1_(\( 1 \/ 2 \, 1 \]) \( q \) \, wide v = q^(- 1) P_0 quad upright("in ") tilde(A)^(* *) . $
  Here $parallel v parallel lt.eq 2$, and
  $ P_0 \( y - lambda \( y \) 1 \) P_0 = v #scale(x: 120%, y: 120%)[\(] q y q -
    lambda \( y \) q^2 #scale(x: 120%, y: 120%)[\)] v . $
  The estimate for $x$ therefore gives $P_0 x P_0 gt.eq \( lambda \( x \) - gamma \/ 4 \) P_0
    gt.eq \( gamma \/ 4 \) P_0$. For the matrices, each entry has error at most $eta^2 \/ \( 4 m \)$.
    An $r$-by-$r$ operator matrix whose entries have norm at most $delta$ has norm at most $r delta$,
    by the Cauchy–Schwarz inequality for its row action. Since each matrix here has size at most $m$,
    both matrix errors are at most $eta^2 \/ 4$.
  Choose a continuous function $f : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ that is zero on $\[ 0 \, 1 \/ 2 \]$ and has
    $f \( 1 \) = 1$, and set $s = f \( q \) x f \( q \)$. This is a positive contraction in $A$,
    because $A$ is an ideal in its unitization. Also $lambda \( s \) = lambda \( x \) > 0$,
    so $sigma \( s \) eq.not 0$, and $p_s lt.eq P_0$. Compressing the preceding inequalities to $p_s$ proves the
    claims. Further hereditary restriction only decreases the support projection, so preserves all the estimates. ◻
]

=== 8.2 Separating the models <separating-the-models>

The next observation records precisely why iterating Lemma 20 does not lose the representation cover.

#thm([Lemma 8.5.])[
  #emph[Assume that $A$ satisfies (C). Suppose that positive contractions $s_1 \, dots.h \,
    s_m in A$ have nonvanishing loci covering $cal(K) \( x \, gamma \)$.
    For each pair $i eq.not j$, prescribe a finite set $cal(E)_(i j) subset tilde(A)$, and let $delta > 0$.
    There are positive contractions $t_i in "her" \( s_i \)$, with supports $Q_i = p_(t_i)$, such that
#[#set math.equation(numbering: n => "(8.5)")
 $ max_i parallel sigma \( t_i \) parallel & = 1 &  & \( sigma in cal(K) \( x \, gamma \) \) \,\
parallel Q_i z Q_j parallel & lt.eq delta &  & \( i eq.not j \, med z in cal(E)_(i j) \) . $ <norm:retained-cover>]

]
] <norm:separated-cover>

#proof[
  If $cal(K) \( x \, gamma \)$ is empty, take every $t_i = 0$. Otherwise proceed as follows.
    Let $c < 1$ be the constant in Lemma 20. Before each shrinking operation,
    apply the last assertion of Lemma 23 to the current finite family.
    This leaves every support unchanged and ensures that each representation in $cal(K) \( x \, gamma \)$ gives
    norm one to at least one of the current seeds.
  For one prescribed triple $i \, j \, z$, let $beta = parallel p_(s_i) z p_(s_j) parallel$,
    using the current seeds. If $beta = 0$, nothing is needed.
    Otherwise apply Lemma 20 to the current seeds $s_i \, s_j$ and to $z \/ beta$.
    Their replacements have supports on which the compression of $z$ has norm at most $c beta$.
    For any $sigma in cal(K) \( x \, gamma \)$, choose a current seed of represented norm one.
    If its index is outside ${ i \, j }$, it survives unchanged.
    If its index is in ${ i \, j }$, the representation clause in Lemma 20 ensures that at least one replacement
    is nonzero. Thus the new family still covers $cal(K) \( x \, gamma \)$, allowing the next reparametrization.
  All new supports are subprojections of their previous supports.
    Consequently no previously obtained compression bound can increase.
    For a fixed coefficient $z$, finitely many repetitions suffice:
    after $r$ repetitions its bound is at most $c^r parallel z parallel$.
    There are only finitely many prescribed coefficients and pairs.
    Treating them successively therefore gives (8.5). A final support-preserving reparametrization gives (8.5). ◻
]

=== 8.3 The row map and the taper <the-row-map-and-the-taper>

#thm([Lemma 8.6.])[
  #emph[Assume that $A$ satisfies (C). Let $x in A$ be a positive contraction, $gamma > 0$, $k gt.eq 2$,
    $F subset A$ a finite set of selfadjoint contractions, $d gt.eq 1$, and $0 < eta < 1$.
    There is a c.p.c. map $V : M_k arrow.r A$ such that
#[#set math.equation(numbering: n => "(8.6)")
 $ parallel V \( z \) V \( w \) parallel & lt.eq
   eta^2 &  & \( z \, w in \( M_k \)_(+) \, med parallel z parallel \, parallel w parallel lt.eq 1 \, med z w = 0 \) \,\
parallel \[ a \, V \( z \) \] parallel & lt.eq 2 eta + 2 \/ d &  & \( a in F \, med parallel z parallel lt.eq 1 \) \,\
parallel sigma \( x V \( 1 \) \) parallel & gt.eq gamma^2 \/ 32 &  & \( sigma in cal(K) \( x \, gamma \) \) .
  $ <norm:order-zero-error>]

]
] <norm:finite-stage>

#proof[
  If $cal(K) \( x \, gamma \)$ is empty, take $V = 0$. Otherwise construct the preceding word model and the seed
    in Lemma 25 for each representation in that set. The seeds cover the set.
    Lemma 23 therefore retains finitely many models, indexed by $i = 1 \, dots.h \, m$.
    Write $n_i$ for their basis sizes, $b_j^(\( i \))$ for their basis representatives,
    $l_j^(\( i \))$ for their levels, and $M_a^(\( i \))$ and $r_j^(\( i \)) \( a \)$ for their model matrices and
    residuals. Set $N = sum_i n_i$.
  Apply Lemma 26 with $delta = eta^2 \/ \( 2 N \)$ to all coefficients
  $ \( b_j^(\( i \)) \)^(*) b_l^(\( h \)) quad upright("and") quad \( r_j^(\( i \)) \( a \) \)^(*)
    r_l^(\( h \)) \( a \) wide \( i eq.not h \, med a in F \) \, $
  where the residual indices have levels less than $d$. Let $s_i$ denote the resulting seeds and $P_i = p_(s_i)$.
    All the estimates of Lemma 25 remain valid. The number of models and their sizes have already been fixed
    before this cross-compression tolerance is chosen.
  By Lemma 17, choose c.p.c. order-zero maps $phi.alt_i : M_k arrow.r "her" \( s_i \)$ such that
  #[#set math.equation(numbering: n => "(8.7)")
   $ parallel sigma \( s_i \) parallel = 1 quad arrow.r.double quad
     parallel sigma \( phi.alt_i \( 1 \) \) parallel = 1 . $ <norm:cone-norm-one>]
  In fact it suffices to apply that Lemma to the fixed cut $\( s_i - 1 \/ 2 \)_(+)$.
    In the universal representation on $cal(H)$, consider
  $ cal(L) = xor.big_(i = 1)^m xor.big_(j = 1)^(n_i) P_i cal(H) quad upright("and") quad B : cal(L) arrow.r
    cal(H) \, wide B \( zeta_(i j) \) = sum_(i \, j) b_j^(\( i \)) zeta_(i j) . $
  The row $B$ is only an operator on these support spaces. Its Gram matrix has $\( i j \, h l \)$-entry
    $P_i \( b_j^(\( i \)) \)^(*) b_l^(\( h \)) P_h$. The diagonal blocks differ from the corresponding identity
    blocks by at most $eta^2 \/ 4$. The off-diagonal matrix has $N$ rows and columns with entries bounded by
    $delta$, so has norm at most $N delta = eta^2 \/ 2$. In particular,
  #[#set math.equation(numbering: n => "(8.8)")
   $ parallel B^(*) B - 1_(cal(L)) parallel lt.eq eta^2 \, wide
     parallel B parallel lt.eq \( 1 + eta^2 \)^(1 \/ 2) . $ <norm:row-gram>]
  Let
  $ M_a = xor.big_i \( M_a^(\( i \)) ⊗ 1_(P_i cal(H)) \) quad upright("on ") cal(L) \, $
  and let $Q$ be the projection onto the slots of level less than $d$.
    The columns of $\( a B - B M_a \) Q$ are $r_j^(\( i \)) \( a \) P_i$.
    Its squared norm is the norm of their Gram matrix. The local residual estimates and the same off-diagonal
    estimate therefore give
  #[#set math.equation(numbering: n => "(8.9)")
   $ parallel \( a B - B M_a \) Q parallel lt.eq eta wide \( a in F \) . $ <norm:row-residual>]
  For $z in M_k$, define operators on $cal(L)$ by
  $ D_z = xor.big_(i \, j) phi.alt_i \( z \) \|_(P_i cal(H)) \, wide T =
    xor.big_(i \, j) \( 1 - l_j^(\( i \)) \/ d \) 1_(P_i cal(H)) \, wide C_z = T D_z . $
  The map $z mapsto C_z$ is c.p.c. and order zero: it is the direct sum of the order-zero maps $phi.alt_i$,
    each multiplied by a nonnegative scalar at most one. It is supported on $Q$,
    since the taper $T$ vanishes at level $d$. Put
  #[#set math.equation(numbering: n => "(8.10)")
   $ lambda_0 = \( 1 + eta^2 \)^(- 1) \, wide V \( z \) = lambda_0 B C_z B^(*) =
     lambda_0 sum_(i \, j) \( 1 - l_j^(\( i \)) \/ d \) b_j^(\( i \)) phi.alt_i \( z \) \( b_j^(\( i \)) \)^(*) .
     $ <norm:row-map>]
  The last formula shows that $V \( z \) in A$, including when $A$ is nonunital.
    Row compression gives complete positivity. Furthermore $0 lt.eq C_1 lt.eq 1_(cal(L))$,
    so $parallel V \( 1 \) parallel lt.eq lambda_0 parallel B parallel^2 lt.eq 1$; hence $V$ is contractive.
  For orthogonal positive contractions $z \, w in M_k$, we have $C_z C_w = 0$. Thus
  $ V \( z \) V \( w \) = lambda_0^2 B C_z \( B^(*) B - 1_(cal(L)) \) C_w B^(*) \, $
  and (8.8) gives
  $ parallel V \( z \) V \( w \) parallel lt.eq lambda_0^2 \( 1 + eta^2 \) eta^2 lt.eq eta^2 . $
  This proves (8.6).
  We next bound the commutator. Let $E_l$ be the projection onto all slots of level $l$,
    summed over the prototypes. By (8.3), the selfadjoint contraction $M_a$ has only its level diagonal and its
    two adjacent-level diagonals. The operators
  $ M_(a \, +) = sum_(l = 0)^(d - 1) E_(l + 1) M_a E_l \, wide M_(a \, -) = M_(a \, +)^(*) $
  each have norm at most one: their separate summands have orthogonal initial spaces and orthogonal final spaces.
    The level diagonal commutes with $T$, and
  $ \[ M_a \, T \] = d^(- 1) \( M_(a \, +) - M_(a \, -) \) \, wide parallel \[ M_a \, T \] parallel lt.eq 2 \/ d . $
  Within each prototype the entries of $M_a$ are scalar and the operator $phi.alt_i \( z \)$ is the same in every
    slot. Thus $\[ M_a \, D_z \] = 0$, and
  #[#set math.equation(numbering: n => "(8.11)")
   $ parallel \[ M_a \, C_z \] parallel lt.eq 2 \/ d wide \( parallel z parallel lt.eq 1 \) . $ <norm:taper-bound>]
  With $R_a = a B - B M_a$, selfadjointness gives $R_a^(*) = B^(*) a - M_a B^(*)$, and a direct expansion yields
  $ \[ a \, V \( z \) \] = lambda_0 #scale(x: 120%, y: 120%)[\(] R_a C_z B^(*) + B \[ M_a \, C_z \] B^(*) -
    B C_z R_a^(*) #scale(x: 120%, y: 120%)[\)] . $
  Because $C_z = Q C_z Q$, (8.9) bounds both outside error terms. Consequently
  $ parallel \[ a \, V \( z \) \] parallel lt.eq lambda_0 #scale(x: 120%, y: 120%)[\(] 2 eta parallel B
    parallel + \( 2 \/ d \) parallel B parallel^2 #scale(x: 120%, y: 120%)[\)] lt.eq 2 eta + 2 \/ d . $
  This proves (8.6); the estimate is uniform over the unit ball of $M_k$.
  Finally fix $sigma in cal(K) \( x \, gamma \)$. The retained cover gives an index $i$ with $parallel
    sigma \( s_i \) parallel = 1$, so that $h_i = sigma \( phi.alt_i \( 1 \) \)$ has norm one by (8.7).
    Denote the represented support by $P_i^sigma$, and put $X = sigma \( x \)$, $H = sigma \( V \( 1 \) \)$.
    The unique level-zero slot of the $i$-th model has representative $b_1^(\( i \)) =
    1$ and taper coefficient one. Every summand of (8.10) at $z = 1$ is positive, so $H gt.eq lambda_0 h_i$. Also
  $ P_i^sigma X^2 P_i^sigma gt.eq \( P_i^sigma X P_i^sigma \)^2 gt.eq \( gamma \/ 4 \)^2 P_i^sigma \, $
  where the first inequality follows by expanding $P_i^sigma X \( 1 - P_i^sigma \) X P_i^sigma gt.eq 0$,
    and the second uses (8.4). Since $h_i = P_i^sigma h_i P_i^sigma$,
  $ parallel X h_i X parallel = parallel h_i^(1 \/ 2) X^2 h_i^(1 \/ 2) parallel gt.eq \( gamma \/ 4 \)^2 parallel
    h_i parallel = \( gamma \/ 4 \)^2 . $
  Positive domination and $parallel X parallel lt.eq 1$ now imply
  $ parallel X H parallel gt.eq parallel X H X parallel gt.eq lambda_0 parallel X h_i X parallel gt.eq
    gamma^2 \/ 32 \, $
  because $eta < 1$ gives $lambda_0 gt.eq 1 \/ 2$. This proves (8.6). ◻
]

#proof[
  Choose increasing finite sets $F_n$ of selfadjoint contractions whose union is dense in the selfadjoint unit
    ball of $A$. Apply Lemma 27 with $F = F_n$, $d = n$, and $eta = \( n + 1 \)^(- 1)$,
    and denote its maps by $nu_n$. Complete positivity and contractivity pass to the ultrapower.
    The error in (8.6) tends to zero, so the resulting map is order zero.
    The estimate in (8.6), density, and $parallel nu_n \( z \) parallel lt.eq
    parallel z parallel$ imply that its range commutes with $A$.
    All maps have norm at most one, which supplies the bound required to form their representing sequences.
    The final estimate in Lemma 27 holds for every $n$ and every $sigma in cal(K) \( x \, gamma \)$,
    with the same constant $gamma^2 \/ 32$. This proves the stated simultaneous coordinate quantifiers. ◻
]

#prodef([Remark 8.7.])[
  Proposition 22 controls irreducible representations of the coordinate algebra $A$.
    It supplies the representation estimates needed for later ideal comparisons;
    it makes no assertion of fullness in $A_omega ∩ A'$ or in its annihilator quotient.
] <norm:scope>

== 9 Matrix cones large for bounded traces <sec:tracial>

From this section onward, unless stated otherwise, $A$ is a separable nuclear $C^(*)$-algebra satisfying (C).

The matrix cones in this section are approximately central in tracial $2$-norm.
  The construction uses a convex nuclear approximation, and its estimates are independent of the number of maps in
  that approximation. Throughout, $D subset.eq A$ is hereditary and $T_(lt.eq 1) \( D \)$ denotes the positive
  bounded traces on $D$ of norm at most one. We extend these traces normally to $D^(* *)$.
  On matrices we use the unnormalized extension $cal(T) = "Tr" ⊗ tau$, and write $parallel x parallel_(2 \, tau) =
  cal(T) \( x^(*) x \)^(1 \/ 2)$, also for rectangular matrices. The traces need not be faithful.
  All estimates below hold simultaneously for every $tau in T_(lt.eq 1) \( D \)$.

#thm([Proposition 9.1.])[
  (Bounded-trace matrix cones).  #emph[Fix $k gt.eq 2$ and put
$ L = \( 20 k \)^2 \, wide C_k = 1 + 4 L . $

 Let $F subset D$ be a finite set of selfadjoint contractions,
   let $cal(P) subset.eq F$ consist of positive contractions, and let $0 < delta < 1$.
   For every $epsilon > 0$ there is a c.p.c. order-zero map $V : M_k arrow.r D$ such that,
   for every $tau in T_(lt.eq 1) \( D \)$,
#[#set math.equation(numbering: n => "(9.1)")
 $ sup_(parallel x parallel lt.eq 1) parallel \[ a \, V \( x \) \] parallel_(2 \, tau) & < epsilon &  & \( a in F \) \,\
tau \( a V \( 1 \) \) & gt.eq delta / 3 tau \( a \) - C_k delta^(3 \/ 2) -
  epsilon &  & \( a in cal(P) \) . $ <tr:central-target>]

 In particular, $k$ is fixed before the accuracy is chosen;
   no bound on the number of nuclear approximation summands is required.]
] <prop:bounded-trace>

We first record the functional-calculus estimate used to regularize a row whose operator norm need not be
  uniformly bounded.

#thm([Lemma 9.2.])[
  (Lipschitz calculus in tracial $2$-norm).  #emph[Let $cal(M)$ be a von Neumann algebra with a finite normal
    trace $T$, let $H = H^(*) in cal(M)$, and let $B in cal(M)$.
    If $f$ is real-valued and Lipschitz on an interval containing the spectrum of $H$, then
$ parallel \[ f \( H \) \, B \] parallel_(2 \, T) lt.eq "Lip" \( f \) parallel \[ H \, B \] parallel_(2 \, T) . $

 Consequently, if $W$ is a finite row, $a = a^(*)$ and $m = m^(*)$ are compatible contractions, and
$ R = W \( 1 + W^(*) W \)^(- 1 \/ 2) \, $

 then $parallel R parallel lt.eq 1$ and
$ parallel a R - R m parallel_(2 \, T) lt.eq parallel a W - W m parallel_(2 \, T) . $

 The constants do not depend on the size of the matrices or on $parallel W parallel$.]
] <tr:lipschitz>

#proof[
  For a finite spectral resolution $H = sum_j alpha_j e_j$,
    the blocks $e_i B e_j$ are orthogonal in $L^2 \( cal(M) \, T \)$. Thus
  $ parallel \[ f \( H \) \, B \] parallel_(2 \, T)^2 & = sum_(i \, j) \| f \( alpha_i \) -
    f \( alpha_j \) \|^2 parallel e_i B e_j parallel_(2 \, T)^2\
 & lt.eq "Lip" \( f \)^2 sum_(i \, j) \| alpha_i - alpha_j \|^2 parallel e_i B e_j parallel_(2 \, T)^2 . $
  Approximate an arbitrary $H$ in operator norm by finite spectral step functions of $H$.
    The corresponding functions $f \( H \)$ also converge in norm.
    Since $T \( 1 \) < oo$, passage to $2$-norm proves the assertion.
    This passage is made separately in each finite matrix algebra;
    the resulting inequality has no factor involving its size or $T \( 1 \)$.
  For the row assertion use
  $ H = mat(delim: "(", 0, W; W^(*), 0) \, wide B = mat(delim: "(", a, 0; 0, m) \, wide f \( t \) = t /
    sqrt(1 + t^2) . $
  This function has Lipschitz constant one, and $f \( H \) = mat(delim: "(", 0, R; R^(*), 0)$.
    The squares of the two commutator norms in the preceding inequality are respectively $2 parallel a R -
    R m parallel_(2 \, T)^2$ and $2 parallel a W - W m parallel_(2 \, T)^2$. ◻
]

We shall also use the following description of a finite-dimensional commutant.
  If $h in D_(+)$ and $rho : E arrow.r M \( "her"_D \( h \) \)$ is a unital homomorphism from a finite-dimensional
  algebra, with unit $p_h$ in $D^(* *)$, write $E = xor.big_j
  M_(n_j)$ and let $v_(r s)^(\( j \))$ be its represented matrix units. Then

#[#set math.equation(numbering: n => "(9.2)")
 $ "her"_D \( h \) ∩ rho \( E \)' tilde.equiv xor.big_j v_11^(\( j \)) "her"_D \( h \) v_11^(\( j \)) \,
   wide \( b_j \)_j mapsto sum_(j \, r) v_(r 1)^(\( j \)) b_j v_(1 r)^(\( j \)) . $ <tr:commutant-corners>]

Indeed, commuting with the diagonal matrix units kills every unwanted block,
  and commuting with the remaining matrix units identifies the retained diagonal blocks by the displayed formula.
  Each corner on the right is hereditary in $D$. Averaging over the compact unitary group of $E$ gives a
  trace-preserving conditional expectation

$ bb(E)_rho : p_h D^(* *) p_h arrow.r p_h D^(* *) p_h ∩ rho \( E \)' . $

It preserves $"her"_D \( h \)$ because the represented unitaries are multipliers.
  It is contractive in tracial $2$-norm, by the triangle inequality for the integral.
  If $b$ is in its range, then $tau \( b bb(E)_rho \( x \) \) =
  tau \( b x \)$ whenever these expressions are defined. These observations allow us to apply Lemma 17 in the
  commutant, simultaneously to all its bounded positive traces.

#proof[
  We will combine small matrix cones chosen in the commutants of the nuclear approximation maps.
    Their supports are chosen to make the model and overlap errors summable,
    after which a regularized row gives a contraction. A second support compression makes this row bounded below
    on the retained support. The polar isometry of the compressed row then transports an exact matrix cone to $D$
    while retaining the tracial mass needed for the stated estimate.
  Fix $F \, cal(P) \, k \, delta$. Our approximation parameter is $0 < u < 1 \/ 4$.
    The notation $o_u \( 1 \)$ below always means a quantity tending to zero uniformly over $T_(lt.eq 1) \( D \)$
    with this fixed data. It has no dependence on the number of approximation summands.
  #strong[The convex approximation and its weighted errors.] The hereditary algebra $D$ is nuclear.
    The convex order-zero return approximation is due to Hirshberg, Kirchberg, and White [18] Theorem 1.4;
    it is also part of the stronger Brown–Carrión–White approximation theorem [6] Theorem 3.1.
    This supplies a finite-dimensional unital algebra $E$, one c.p.c. map $alpha : D arrow.r E$,
    positive numbers $lambda_1 \, dots.h \, lambda_r$ with $sum_l lambda_l = 1$,
    and c.p.c. order-zero maps $beta_l : E arrow.r D$, such that
  $ Phi = sum_(l = 1)^r lambda_l beta_l alpha $
  is as close to the identity as prescribed on a given finite set.
    The integer $r$ may depend on $u$ without restriction. Put
  $ h_l = beta_l \( 1 \) \, quad p_l = p_(h_l) \, quad beta_l \( x \) = h_l rho_l \( x \) \, quad mu_l =
    rho_l alpha \, quad theta_l = h_l mu_l . $
  Here $rho_l$ is the supporting homomorphism of the order-zero map [35];
    it acts by multipliers of $"her"_D \( h_l \)$. In particular $h_l$ commutes with $mu_l \( D \)$.
  By approximating $F$, its squares, and a sufficiently late positive contractive approximate-unit element $e in
    D$, we arrange
  #[#set math.equation(numbering: n => "(9.3)")
   $ ∥sum_l lambda_l \( a - theta_l \( a \) \)^2∥ & lt.eq u^4 &  & \( a in F \) \,\
∥a^(1 \/ 2) (1 - sum_l lambda_l h_l) a^(1 \/ 2)∥ & lt.eq u^4 &  & \( a in cal(P) \) . $ <tr:mean-square>]
  For completeness, the Schwarz inequality gives
  $ 0 lt.eq sum_l lambda_l \( a - theta_l \( a \) \)^2 lt.eq a^2 - a Phi \( a \) - Phi \( a \) a + Phi \( a^2 \) \, $
  whose norm is at most $3 v$ if both relevant approximation errors are at most $v$.
    For the second estimate choose $e$ so that $parallel a^(1 \/ 2) \( 1 - e \) a^(1 \/ 2) parallel lt.eq
    u^4 \/ 2$ for all targets, and approximate $e$ within $u^4 \/ 2$.
    Since $theta_l \( e \) lt.eq h_l$, this proves (9.3). All appearances of $1$ in this proof are allowed in the
    bidual; no unit of $D$ is assumed.
  Choose the following explicit continuous cutoff on $\[ 0 \, 1 \]$:
  $ g \( t \) =
    cases(delim: "{", 0 \, & t lt.eq 1 - 2 u \,, \( t - 1 + 2 u \) \/ u \, & 1 - 2 u < t < 1 - u \,, 1 \, & t
    gt.eq 1 - u .) $
  Set $g_l = g \( h_l \)$ and $z_l = 1_(\( 1 - 2 u \, 1 \]) \( h_l \)$.
    Thus $p_(g_l) lt.eq z_l lt.eq p_l$, and the scalar inequality
  #[#set math.equation(numbering: n => "(9.4)")
   $ 1 - g_l^4 lt.eq u^(- 1) \( 1 - h_l \) $ <tr:g-loss>]
  holds by functional calculus. With
  $ D_l = sum_(a in F) p_l \( a - mu_l \( a \) \)^2 p_l \, wide B_u = 2 u^4 + 8 u^2 \, $
  we have, for every $a in F$,
  #[#set math.equation(numbering: n => "(9.5)")
   $ sum_l lambda_l parallel \( a - mu_l \( a \) \) z_l parallel_(2 \, tau)^2 lt.eq B_u \, wide
     sum_l lambda_l tau \( z_l D_l \) lt.eq \| F \| B_u . $ <tr:model-square>]
  Indeed, the contribution of $a - theta_l \( a \)$ is bounded by $u^4$ using (9.3) and the trace inequality
    $tau \( z_l x z_l \) lt.eq tau \( x \)$ for $x gt.eq 0$. On $z_l$,
    $parallel \( theta_l \( a \) - mu_l \( a \) \) z_l parallel lt.eq 2 u$.
    Apply $parallel x + y parallel_2^2 lt.eq 2 parallel x parallel_2^2 +
    2 parallel y parallel_2^2$ and $sum_l lambda_l tau \( z_l \) lt.eq 1$.
  Weighted Cauchy–Schwarz now gives, for $a in cal(P)$,
  #[#set math.equation(numbering: n => "(9.6)")
   $ sum_l lambda_l tau \( mu_l \( a \) g_l^4 \) & gt.eq tau \( a \) - u^3 - sqrt(B_u) \,\
sum_l lambda_l tau \( mu_l \( a \) z_l \) & lt.eq tau \( a \) + sqrt(B_u) . $ <tr:T1-lower>]
  To verify the replacement of $mu_l \( a \)$ by $a$, for example,
  $ lr(|sum_l lambda_l tau \( \( mu_l \( a \) - a \) g_l^4 \)|) lt.eq
    (sum_l lambda_l parallel \( mu_l \( a \) - a \) z_l parallel_2^2)^(1 \/ 2)
    (sum_l lambda_l tau \( g_l^8 \))^(1 \/ 2) lt.eq sqrt(B_u) . $
  The same argument applies to $z_l$. The lost $a$-mass in the first inequality is at most $u^3$,
    by (9.4) and (9.3); in the second use $z_l lt.eq 1$.
  #strong[The first pencil: small supports and summable overlaps.] For each $l$ put
  $ C_l = "her"_D \( h_l \) ∩ rho_l \( E \)' \, wide bb(E)_l = bb(E)_(rho_l) . $
  Construct maps $psi_l : M_k arrow.r C_l$ inductively, writing $t_l = psi_l \( 1 \)$.
    Once the earlier maps have been chosen, we penalize both the model error and overlap with their weights by setting
  #[#set math.equation(numbering: n => "(9.7)")
   $ S_l & = sum_(i < l) t_i^2 \, wide K_l = bb(E)_l #scale(x: 120%, y: 120%)[\(] u^(- 1) D_l +
     delta^(- 1 \/ 2) p_l S_l p_l #scale(x: 120%, y: 120%)[\)] \,\
X_l & = g_l \( p_l - K_l \) g_l \, wide b_l = g_l \( X_l \)_(+) g_l . $ <tr:first-pencil>]
  These formulas define $b_l in C_l$. To check membership before taking positive parts,
    sandwich each term of $D_l$ by $g_l$. Terms involving $a in D$ then lie in $"her"_D \( h_l \)$,
    and terms involving $mu_l \( a \)$ lie there by multiplier action. The same is true of $g_l S_l g_l$.
    Averaging preserves this hereditary algebra and commutes with multiplication by $g_l$.
    Hence $X_l$ belongs to it and to the commutant, as does $b_l$.
  The inequalities $X_l lt.eq p_l$ and $X_l gt.eq - \( parallel K_l parallel + 1 \) p_l$ imply $0
    lt.eq \( X_l \)_(+) lt.eq p_l$ by scalar functional calculus. Therefore
  #[#set math.equation(numbering: n => "(9.8)")
   $ 0 lt.eq b_l lt.eq g_l^2 lt.eq z_l \, wide b_l gt.eq g_l^4 - g_l^2 K_l g_l^2 . $ <tr:first-pencil-bounds>]
  The second inequality follows from $\( X_l \)_(+) gt.eq X_l$. Lemma 18, applied to the pencil in (9.7), gives
  #[#set math.equation(numbering: n => "(9.9)")
   $ p_(b_l) K_l p_(b_l) lt.eq p_(b_l) . $ <tr:first-support>]
  Use the tracial conclusion of Lemma 17 in $C_l$, which has the form (9.2), with $q =
    delta lambda_l$ and positive contraction $b_l$. It gives a c.p.c. order-zero map $psi_l : M_k arrow.r
    "her"_(C_l) \( b_l \)$ whose weight $t_l$ satisfies
  #[#set math.equation(numbering: n => "(9.10)")
   $ d_sigma \( t_l \) lt.eq delta lambda_l d_sigma \( b_l \) \, wide d_sigma \( \( t_l - 1 \/ 2 \)_(+) \) gt.eq
     frac(delta lambda_l, 3) d_sigma \( \( b_l - 1 \/ 2 \)_(+) \) $ <tr:placement>]
  for every bounded positive trace $sigma$ on $C_l$. In particular, on restricting $tau$ to $C_l$,
  #[#set math.equation(numbering: n => "(9.11)")
   $ tau \( p_(t_l) \) lt.eq delta lambda_l \, wide sum_l tau \( p_(t_l) \) lt.eq delta \, wide
     tau \( S_l \) lt.eq delta . $ <tr:support-budget>]
  Here ranks are the traces of the corresponding support projections in the bidual.
    As $p_(t_l) lt.eq p_(b_l)$, (9.9) gives
  $ sum_l tau \( t_l^2 K_l \) lt.eq sum_l tau \( t_l^2 \) lt.eq delta . $
  We may remove $bb(E)_l$ inside these traces because $t_l^2 in C_l$. Both summands defining $K_l$ are positive.
    It follows that
  #[#set math.equation(numbering: n => "(9.12)")
   $ sum_l parallel \( a - mu_l \( a \) \) t_l parallel_(2 \, tau)^2 & lt.eq u delta &  & \( a in F \) \,\
sum_l tau \( t_l^2 S_l \) & lt.eq delta^(3 \/ 2) . $ <tr:T2-model>]
  These are unweighted sums: the individual support allowances $delta
    lambda_l$ in (9.11) have absorbed the convex coefficients.
    Their total is $delta$, so increasing the number of approximation summands does not enlarge either error bound.
  We next obtain a lower bound for their high spectral cuts. Let
  $ s_l = 1_(\( 1 \/ 2 \, 1 \]) \( t_l \) \, wide e_l = 1_(\( 1 \/ 2 \, 1 \]) \( b_l \) . $
  Since $b_l$ is a contraction supported under $z_l$, scalar functional calculus and (9.8) give
  #[#set math.equation(numbering: n => "(9.13)")
   $ e_l gt.eq 2 b_l - z_l gt.eq 2 g_l^4 - 2 g_l^2 K_l g_l^2 - z_l . $ <tr:cut-lower>]
  For $a in cal(P)$, the functional
  $ sigma_(l \, a) \( c \) = tau \( mu_l \( a \) c \) wide \( c in C_l \) $
  is a bounded positive trace. Indeed $mu_l \( a \)$ is a positive contraction commuting with $C_l$,
    so positivity and the trace identity follow from those of $tau$.
    Normality shows that $d_(sigma_(l \, a)) \( t_l \) = tau \( mu_l \( a \) p_(t_l) \)$,
    and gives the same formula for every positive spectral cut.
    Thus (9.10) applies to this single weighted trace and yields $tau \( mu_l \( a \) s_l \)
    gt.eq \( delta lambda_l \/ 3 \) tau \( mu_l \( a \) e_l \)$.
    Using (9.13) and $0 lt.eq mu_l \( a \) lt.eq 1$, we obtain
  #[#set math.equation(numbering: n => "(9.14)")
   $ sum_l tau \( mu_l \( a \) s_l \) & gt.eq delta / 3 sum_l lambda_l
     tau \( mu_l \( a \) \( 2 g_l^4 - z_l \) \) - frac(2 delta, 3) sum_l lambda_l tau \( g_l^2 K_l g_l^2 \) .
     $ <tr:weighted-mass>]
  For the last term, remove the expectation against $g_l^4 in C_l$:
  $ sum_l lambda_l tau \( g_l^2 K_l g_l^2 \) & = sum_l lambda_l
    (u^(- 1) tau \( g_l^4 D_l \) + delta^(- 1 \/ 2) tau \( g_l^4 S_l \))\
 & lt.eq u^(- 1) \| F \| B_u + sqrt(delta) . $
  In the inequality use $g_l^4 lt.eq z_l$, (9.5), and $tau \( S_l \) lt.eq delta$.
    Combining this with (9.6)–(9.6) proves
  #[#set math.equation(numbering: n => "(9.15)")
   $ sum_l tau \( mu_l \( a \) s_l \) gt.eq delta / 3 tau \( a \) - delta^(3 \/ 2) - r_u wide \( a in cal(P) \) \,
     $ <tr:T3>]
  where one may take the explicit error
  $ r_u = delta / 3 (2 u^3 + 3 sqrt(B_u) + 2 \| F \| B_u \/ u) arrow.r 0 . $
  #strong[Regularizing the combined row.] Form matrices over $D$ and models in its bidual as follows:
  $ W = \( t_1 \, dots.h \, t_r \) \, quad D_0 = "diag" \( t_l^2 \) \, quad m \( a \) =
    "diag" \( mu_l \( a \) \) \, quad p = p_(D_0) \, $
  $ R = W \( 1 + W^(*) W \)^(- 1 \/ 2) \, wide Q_0 = R^(*) R \, wide G_0 = D_0 \( 1 + D_0 \)^(- 1) . $
  Here $cal(T) \( p \) lt.eq delta$ by (9.11). Each $t_l$ commutes with $mu_l \( a \)$, so (9.12) says
  $ parallel a W - W m \( a \) parallel_(2 \, tau) lt.eq sqrt(u delta) = : e_u . $
  The diagonal of $W^(*) W - D_0$ is zero, and its $\( i \, j \)$ entry off the diagonal is $t_i t_j$. Consequently
  #[#set math.equation(numbering: n => "(9.16)")
   $ parallel W^(*) W - D_0 parallel_(2 \, tau)^2 = 2 sum_l sum_(i < l) tau \( t_l^2 t_i^2 \) =
     2 sum_l tau \( t_l^2 S_l \) lt.eq 2 delta^(3 \/ 2) . $ <tr:off-diagonal-cost>]
  Lemma 30 gives the first of the following estimates; the second follows by expanding the commutator of $R^(*) R$:
  #[#set math.equation(numbering: n => "(9.17)")
   $ parallel a R - R m \( a \) parallel_(2 \, tau) & lt.eq e_u \, & parallel \[ Q_0 \, m \( a \) \]
     parallel_(2 \, tau) & lt.eq 2 e_u . $ <tr:regularized-central>]
  Finally, $Q_0 = 1 - \( 1 + W^(*) W \)^(- 1)$ and $G_0 = 1 - \( 1 + D_0 \)^(- 1)$.
    The resolvent identity and the contractivity of both resolvents show that
  #[#set math.equation(numbering: n => "(9.18)")
   $ parallel Q_0 - G_0 parallel_(2 \, tau)^2 lt.eq 2 delta^(3 \/ 2) . $ <tr:regularized-overlap>]
  This regularization has removed every occurrence of $parallel W parallel$ from the estimates.
  #strong[The second pencil in one matrix commutant.] Write $B_0 = "her"_(M_r \( D \)) \( D_0 \)$.
    Both $W^(*) W$ and $D_0$ belong to $B_0$: for the former,
    use its entries $t_i t_j$ and an approximate unit obtained by functional calculus of $D_0$.
    Hence $Q_0 \, G_0 in B_0$. Let
  $ pi : M_k arrow.r M \( B_0 \) $
  be the diagonal of the supporting homomorphisms of $psi_l$, whose unit in the bidual is $p$.
    Its values commute with $"diag" \( t_l \)$ and with $m \( a \)$.
    To see the latter assertion, recover each supporting homomorphism by bounded strong limits from $t_l$ and
    $psi_l \( M_k \)$, all of which commute with $mu_l \( a \)$.
    The multiplier assertion follows because its products with $"diag" \( t_l \)$ belong to $M_r \( D \)$;
    the same observation shows that $m \( a \)$ acts by multipliers on $B_0$ and commutes with $p$.
  The row $R$ is contractive, but its Gram operator $Q_0$ need not commute with $pi \( M_k \)$,
    so $R pi \( dot.op \) R^(*)$ need not have order zero. We use the small overlap cost in (9.18) to find a
    $pi \( M_k \)$-invariant support on which $R$ is bounded below.
    The polar isometry of the compressed row will then transport the matrix action while the estimates below
    control the lost tracial mass.
  Let $u_k \, v_k in M_k$ be the clock and shift unitaries. The map
  $ bb(E)_pi \( X \) = 1 / k^2 sum_(i \, j = 0)^(k - 1) pi \( u_k^i v_k^j \) X pi \( u_k^i v_k^j \)^(*) $
  is the trace-preserving expectation onto the commutant of $pi \( M_k \)$ in the corner with unit $p$.
    The usual matrix-unit calculation shows that the average kills the nonconstant matrix coefficients,
    and fixes the commutant. Since the identity conjugation is one of its $k^2$ positive summands,
  #[#set math.equation(numbering: n => "(9.19)")
   $ X lt.eq k^2 bb(E)_pi \( X \) wide \( X gt.eq 0 \) . $ <tr:finite-average-bound>]
  Put
  $ K = bb(E)_pi \( \( Q_0 - G_0 \)^2 \) . $
  Then $K in B_0 ∩ pi \( M_k \)'$, and
  #[#set math.equation(numbering: n => "(9.20)")
   $ cal(T) \( K \) lt.eq 2 delta^(3 \/ 2) \, wide parallel \[ m \( a \) \, K \] parallel_(2 \, tau) lt.eq
     4 e_u . $ <tr:second-cost>]
  For the commutator use $\[ m \( a \) \, G_0 \] = 0$, $parallel Q_0 - G_0 parallel lt.eq 1$, (9.17),
    and the $2$-norm contractivity of the expectation, which commutes with multiplication by $m \( a \)$.
  Choose the fixed piecewise linear cutoff
  $ g' \( t \) =
    cases(delim: "{", 0 \, & t lt.eq 1 \/ 10 \,, 10 t - 1 \, & 1 \/ 10 < t < 1 \/ 5 \,, 1 \, & t gt.eq 1 \/ 5 \,)
    wide g' = g' \( G_0 \) \, $
  and, with $L = \( 20 k \)^2$, set
  #[#set math.equation(numbering: n => "(9.21)")
   $ X' = g' \( p - L K \) g' \, wide c = g' \( X' \)_(+) g' . $ <tr:second-pencil>]
  As for the first pencil, $c in B_0 ∩ pi \( M_k \)'$ and
  #[#set math.equation(numbering: n => "(9.22)")
   $ 0 lt.eq c lt.eq \( g' \)^2 lt.eq p \, wide c gt.eq \( g' \)^4 - L \( g' \)^2 K \( g' \)^2 \, wide p_c lt.eq
     1_(\( 1 \/ 10 \, oo \)) \( G_0 \) . $ <tr:second-pencil-bounds>]
  Lemma 18 gives $p_c K p_c lt.eq L^(- 1) p_c$. For $xi in p_c cal(H)$, (9.19) implies
  $ parallel \( Q_0 - G_0 \) xi parallel^2 lt.eq k^2 chevron.l K xi \, xi chevron.r lt.eq 1 /
    400 parallel xi parallel^2 . $
  On the same space $G_0$ has compression at least $1 \/ 10$. Therefore
  #[#set math.equation(numbering: n => "(9.23)")
   $ c^2 gt.eq c Q_0 c gt.eq 1 / 20 c^2 . $ <tr:polar-lower>]
  Furthermore $m \( a \)$ commutes with $g'$. Lemma 30, applied to the scalar function $t mapsto t_(+)$ in (9.21),
    yields the useful explicit bound
  #[#set math.equation(numbering: n => "(9.24)")
   $ parallel \[ m \( a \) \, c \] parallel_(2 \, tau) lt.eq
     L parallel \[ m \( a \) \, K \] parallel_(2 \, tau) lt.eq 4 L e_u . $ <tr:c-commutator>]
  There remains a lower bound on the mass surviving this second pencil. Set $s' = "diag" \( s_l \)$.
    On $s_l$ one has $t_l > 1 \/ 2$, so $t_l^2 \/ \( 1 + t_l^2 \) > 1 \/ 5$, and hence $g' s' = s'$.
    The scalar inequality $c^2 gt.eq 2 c - p$, followed by (9.22), gives
  $ s' c^2 s' gt.eq 2 s' c s' - s' gt.eq s' - 2 L s' K s' . $
  For $a in cal(P)$, $m \( a \)$ is a positive contraction commuting with $s'$.
    Decomposing the trace along $s'$ and $p - s'$ shows that $cal(T) \( m \( a \) c^2 \) gt.eq
    cal(T) \( m \( a \) s' c^2 s' \)$; the omitted diagonal contribution is nonnegative. Thus
  #[#set math.equation(numbering: n => "(9.25)")
   $ cal(T) \( m \( a \) c^2 \) & gt.eq cal(T) \( m \( a \) s' \) - 2 L cal(T) \( K \)\
 & gt.eq delta / 3 tau \( a \) - \( 1 + 4 L \) delta^(3 \/ 2) - r_u . $ <tr:corrected-mass>]
  Here we used (9.15) and (9.20). The argument only uses the commutation of $m \( a \)$ with $s'$;
    it does not require $c$ to commute with $s'$.
  #strong[Polar correction and exact order zero.] Put $d = c Q_0
    c$ and let $U$ be the polar partial isometry of the row $R c$ in the bidual.
    Equation (9.23) implies $p_d = p_c$, so $U^(*) U = p_c$. We claim that the row
  $ Y = U c $
  belongs to $M_(1 \, r) \( D \)$ and satisfies
  #[#set math.equation(numbering: n => "(9.26)")
   $ sup_(tau in T_(lt.eq 1) \( D \)) parallel a Y - Y m \( a \) parallel_(2 \, tau) =
     o_u \( 1 \) wide \( a in F \) . $ <tr:polar-intertwining>]
  We give uniform estimates for this passage, since $r$ can grow with $u$.
  For $eta > 0$ define the algebraic row
  $ Y_eta = R c \( d + eta \)^(- 1 \/ 2) c in M_(1 \, r) \( D \) . $
  The domination $c^2 lt.eq 20 d$ implies a factorization $c = d^(1 \/ 2) x$ with $parallel x parallel lt.eq
    sqrt(20)$. One elementary proof is to define $x^(*)$ initially on the range of $d^(1 \/ 2)$ by
    $x^(*) \( d^(1 \/ 2) xi \) = c xi$; the stated domination makes this well-defined and bounded,
    and it extends by zero on the orthogonal complement. Using $R c = U d^(1 \/ 2)$ now gives
  #[#set math.equation(numbering: n => "(9.27)")
   $ parallel Y - Y_eta parallel lt.eq sqrt(20) sup_(t gt.eq 0) sqrt(t) (1 - sqrt(frac(t, t + eta))) lt.eq
     sqrt(20 eta) . $ <tr:uniform-polar-norm>]
  For the last scalar bound split at $t = eta$: below it use $sqrt(t)$, and above it use $1 -
    sqrt(t \/ \( t + eta \)) lt.eq eta \/ t$. In particular the norm limit $Y$ lies in the rectangular algebra.
    Both $Y$ and $Y_eta$ have right support under $p$, so
  #[#set math.equation(numbering: n => "(9.28)")
   $ parallel Y - Y_eta parallel_(2 \, tau) lt.eq sqrt(20 eta delta) . $ <tr:uniform-polar-two>]
  This uses $cal(T) \( p \) lt.eq delta$, rather than a bound on the trace of the full matrix unit.
  At fixed $eta$ the intertwining error for $Y_eta$ tends to zero uniformly with $u$.
    To spell this out, (9.17) and (9.24) imply
  $ parallel \[ m \( a \) \, d \] parallel_(2 \, tau) lt.eq \( 8 L + 2 \) e_u . $
  On $\[ 0 \, 1 \]$ the function $\( t + eta \)^(- 1 \/ 2)$ has norm at most $eta^(- 1 \/ 2)$ and Lipschitz
    constant at most $1 / 2 eta^(- 3 \/ 2)$. Expand $a Y_eta -
    Y_eta m \( a \)$ through its four factors and apply Lemma 30. This gives
  $ parallel a Y_eta - Y_eta m \( a \) parallel_(2 \, tau) lt.eq
    (\( 1 + 8 L \) eta^(- 1 \/ 2) + \( 4 L + 1 \) eta^(- 3 \/ 2)) e_u . $
  Together with (9.28), this bounds the error for $Y$ by the displayed right-hand side plus $2
    sqrt(20 eta delta)$. First choose $eta$ small and then $u$ small. This proves (9.26) without any restriction on $r$.
  Define
  $ V \( x \) = U c pi \( x \) c U^(*) = Y pi \( x \) Y^(*) wide \( x in M_k \) . $
  These elements lie in $D$: the rows $Y_eta pi \( x \)$ belong to $M_(1 \, r) \( D \)$ by multiplier action,
    and converge in norm to $Y pi \( x \)$ by (9.27). The map is completely positive and contractive,
    since $V \( 1 \) = U c^2 U^(*) lt.eq 1$. It is exactly order zero.
    Indeed $c$ commutes with $pi \( M_k \)$, $U^(*) U = p_c$, and for orthogonal positive $x \, y in M_k$,
  $ V \( x \) V \( y \) = U c^4 pi \( x y \) U^(*) = 0 . $
  For a selfadjoint $a in F$ set $Delta_a = a Y - Y m \( a \)$.
    Since $m \( a \)$ commutes with $pi \( M_k \)$ and $parallel Y parallel lt.eq 1$,
  $ \[ a \, V \( x \) \] = Delta_a pi \( x \) Y^(*) - Y pi \( x \) Delta_a^(*) \, wide
    parallel \[ a \, V \( x \) \] parallel_(2 \, tau) lt.eq 2 parallel x parallel parallel Delta_a
    parallel_(2 \, tau) . $
  This proves (9.1) when $u$ is sufficiently small. Finally $Y^(*) Y =
    c^2$ and $parallel Y parallel_(2 \, tau) lt.eq sqrt(delta)$. Rectangular traciality and Cauchy–Schwarz give
  $ lr(|tau \( a V \( 1 \) \) - cal(T) \( m \( a \) c^2 \)|) = lr(|cal(T) \( Y^(*) Delta_a \)|) lt.eq
    sqrt(delta) thin parallel Delta_a parallel_(2 \, tau) = o_u \( 1 \) . $
  Combining this with (9.25), and choosing $u$ to make $r_u +
    sqrt(delta) sup_tau parallel Delta_a parallel_(2 \, tau) < epsilon$ for the finitely many targets,
    proves (9.1). All choices were made for the entire family $T_(lt.eq 1) \( D \)$ at once, completing the proof. ◻
]

== 10 Joining matrix cones and localizing traces <sec:localization>

Our goal is to retain the tracial mass from the previous section while obtaining norm-central maps.
  The trace-kernel ideal and relative commutant lifting methods have predecessors in Kirchberg–Rørdam [21]
  Section 4. Here the relative ideal is specified by hereditary rank tests,
  including the traces which vanish on the controlling positive element.

Throughout this section, traces on $A$ are the lower semicontinuous extended traces of the preliminaries.
  In particular, they need not be finite on a dense ideal. If $D subset.eq A$ is hereditary,
  write $T_(lt.eq 1) \( D \)$ for the bounded positive tracial functionals on $D$ of norm at most one, and put

$ parallel z parallel_(2 \, T_(lt.eq 1) \( D \)) = sup_(sigma in T_(lt.eq 1) \( D \)) sigma \( z^(*) z \)^(1 \/ 2) . $

The supremum is zero if there are no nonzero such functionals.
  Expressions involving $1 - h$ are evaluated in a unitization; a sandwich by an element of $D$ still belongs to $D$.

#thm([Lemma 10.1.])[
  (Joining two matrix cones).  #emph[Let $B$ be a $C^(*)$-algebra, and let $phi.alt_1 \, phi.alt_2 : M_k arrow.r
    B$ be c.p.c. order-zero maps with commuting ranges. Set $h_i = phi.alt_i \( 1 \)$.
    There is a c.p.c. order-zero map $phi.alt : M_k arrow.r
    C^(*) \( phi.alt_1 \( M_k \) \, phi.alt_2 \( M_k \) \)$ such that
#[#set math.equation(numbering: n => "(10.1)")
 $ phi.alt \( 1 \) = 1 - \( 1 - h_1 \) \( 1 - h_2 \) = h_1 + h_2 - h_1 h_2 . $ <loc:join-weight>]

 Its weight dominates both $h_1$ and $h_2$. If both original maps commute with a subset of an ambient algebra,
   the joined map also commutes with that subset.]
] <lem:join>

#proof[
  Let $cal(C)_k = C_0 \( \( 0 \, 1 \] \, M_k \)$. Its unitization is the algebra of continuous $M_k$-valued
    functions on $\[ 0 \, 1 \]$ whose value at zero is scalar.
    Realize $tilde(cal(C))_k ⊗ tilde(cal(C))_k$ as the algebra of continuous $M_k ⊗
    M_k$-valued functions $F$ on the square satisfying
  $ F \( x \, 0 \) in M_k ⊗ 1 \, wide F \( 0 \, y \) in 1 ⊗ M_k . $
  These conditions also make $F \( 0 \, 0 \)$ scalar. Here is a direct verification that these conditions
    characterize the tensor product. The tensor product contains every scalar continuous function on the square,
    and its evaluation at each point is the entire indicated fiber:
    use scalar functions vanishing at zero to realize matrix entries on either nonzero coordinate.
    Given a continuous function satisfying the conditions, choose, at each point,
    an element of the tensor product having the same value there.
    Continuity gives a neighborhood on which the error is less than a prescribed tolerance.
    A finite scalar partition of unity subordinate to these neighborhoods gives an approximation in the tensor
    product. Closedness proves the assertion.
  Let $S$ be the unitary that interchanges the two factors of $bb(C)^k ⊗ bb(C)^k$, and put $Q = \( 1 - S \) \/ 2$.
    Since $S = S^(*) = S^(- 1)$, $Q$ is a projection, and
  $ U \( t \) = exp \( i pi t Q \) \, wide 0 lt.eq t lt.eq 1 \, $
  is a unitary path from $1$ to $S$. For $z in M_k$ define
  $ F_z \( x \, y \) =
    cases(delim: "{", \( x + y - x y \) thin U #scale(x: 120%, y: 120%)[\(] y \/ \( x + y \)
    #scale(x: 120%, y: 120%)[\)] \( z ⊗ 1 \) U #scale(x: 120%, y: 120%)[\(] y \/ \( x + y \)
    #scale(x: 120%, y: 120%)[\)]^(*) \, & \( x \, y \) eq.not \( 0 \, 0 \) \,, 0 \, & \( x \, y \) = \( 0 \, 0 \) .) $
  At $y = 0$ this is $x z ⊗ 1$, and at $x = 0$ it is $y 1 ⊗ z$.
    At the origin continuity follows from $parallel F_z \( x \, y \) parallel lt.eq \( x + y \) parallel z
    parallel$; no limit of the unitary itself is needed. Thus $F_z$ belongs to the tensor product.
    Pointwise it is a positive scalar contraction times a $*$-homomorphism,
    so $z mapsto F_z$ is completely positive, contractive, and order zero. Its weight is $\( x + y - x y \) 1$.
  The cone homomorphisms associated to $phi.alt_1$ and $phi.alt_2$ extend to commuting unital homomorphisms from
    their unitizations. Nuclearity of the cones lets their product be evaluated on the spatial tensor product.
    The functions $F_z$ vanish at $\( 0 \, 0 \)$. The ideal of functions vanishing there is generated by
    $cal(C)_k ⊗ 1$ and $1 ⊗ cal(C)_k$: quotienting by those two ideals leaves only the scalar evaluation at the
    origin. Its image consequently lies in $C^(*) \( phi.alt_1 \( M_k \) \, phi.alt_2 \( M_k \) \)$,
    even when $B$ is nonunital. Evaluation of $F_z$ gives the asserted map and its weight.
    Finally $phi.alt \( 1 \) - h_1 = \( 1 - h_1 \) h_2 gt.eq 0$, and similarly for $h_2$.
    The last assertion follows from containment of the range in the generated algebra. ◻
]

#thm([Lemma 10.2.])[
  (Filling bounded traces).  #emph[Let $D subset.eq A$ be hereditary, $k gt.eq 2$, $F subset D$ finite,
    and $cal(P) subset D$ a finite set of positive contractions.
    For every $rho > 0$ there is a c.p.c. map $mu : M_k arrow.r D$ such that, for all matrix units $e_(i j) \,
    e_(r s)$ and all $x in F$,
#[#set math.equation(numbering: n => "(10.2)")
 $ parallel \[ mu \( e_(i j) \) \, x \] parallel_(2 \, T_(lt.eq 1) \( D \)) & < rho \,\
parallel mu \( e_(i j) \) mu \( e_(r s) \) - mu \( 1 \) mu \( e_(i j) e_(r s) \)
  parallel_(2 \, T_(lt.eq 1) \( D \)) & < rho \,\
sigma #scale(x: 120%, y: 120%)[\(] a^(1 \/ 2) \( 1 - mu \( 1 \) \) a^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] & < rho
  quad \( a in cal(P) \, med sigma in T_(lt.eq 1) \( D \) \) . $ <loc:fill-comm>]

]
] <loc:bounded-fill>

#proof[
  The sequences that vanish in the uniform $2$-seminorm define a closed two-sided ideal $J_2$ of $D_omega$.
    Indeed the uniform $2$-seminorm is at most the norm, and $parallel u z parallel_2 \,
    parallel z u parallel_2 lt.eq parallel u parallel parallel z parallel_2$ for every bounded trace;
    the triangle inequality and the same inequalities establish ideality and closedness.
    Write $B = D_omega \/ J_2$. Every choice $sigma_n in T_(lt.eq 1) \( D \)$ gives a bounded trace
  $ sigma_omega \( \( z_n \) \) = lim_(n arrow.r omega) sigma_n \( z_n \) $
  on $D_omega$, which factors through $B$ by Cauchy–Schwarz. These choices are allowed to depend on $n$.
  Fix $0 < delta < 1$. Proposition 29, applied at coordinate $n$ with its auxiliary error tending to zero,
    has the following consequence. Given finitely many positive contractions in $B$ and finitely many elements
    with which to commute, there is a c.p.c. order-zero map $psi : M_k arrow.r
    B$ commuting with those elements and satisfying
  #[#set math.equation(numbering: n => "(10.3)")
   $ sigma_omega \( c psi \( 1 \) \) gt.eq delta / 3 sigma_omega \( c \) - C_k delta^(3 \/ 2) $ <loc:fraction>]
  for all the chosen targets and all the traces just described.
    To see the quantifiers, choose positive contractive lifts of the finitely many targets and bounded lifts of
    the tests, and apply that proposition separately at every coordinate,
    including real and imaginary parts of the tests, rescaled to contractions,
    with the requested errors tightened by their fixed norms.
    The coordinate errors tend to zero uniformly over $T_(lt.eq 1) \( D \)$.
    The coordinate maps are order zero, and their commutator sequences belong to $J_2$. This proves the assertion.
    The lifts exist by completely positive lifting for the finite-dimensional domain when a map,
    rather than a single element, is being lifted.
  Start with joined weight $H_0 = 0$. Having constructed the preceding joined map, let $r = 1 -
    H_j$ and prescribe the targets $r^(1 \/ 2) a r^(1 \/ 2)$ for $a in cal(P)$.
    Prescribe commutation with the preceding map and with the fixed tests.
    Apply (10.3) and join the new map to the preceding one using Lemma 31.
    The new weight commutes with $r$, and hence, for any trace $sigma_omega$, the defect
  $ D_j \( a \) = sigma_omega #scale(x: 120%, y: 120%)[\(] a^(1 \/ 2) \( 1 - H_j \) a^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\)] $
  satisfies
  $ D_(j + 1) \( a \) lt.eq \( 1 - delta \/ 3 \) D_j \( a \) + C_k delta^(3 \/ 2) . $
  This follows by subtracting $sigma_omega \( r^(1 \/ 2) a r^(1 \/ 2) psi \( 1 \) \)$ from $D_j \( a \)$;
    traciality and commutation of $psi \( 1 \)$ with $r$ justify the subtraction without any commutation
    assumption on $a$. Since $D_0 \( a \) lt.eq 1$, induction gives
  #[#set math.equation(numbering: n => "(10.4)")
   $ D_N \( a \) lt.eq \( 1 - delta \/ 3 \)^N + 3 C_k sqrt(delta) . $ <loc:geometric>]
  Choose $delta$ so that the second term is less than $rho \/ 4$,
    and then a finite $N$ so that the first term is less than $rho \/ 4$.
  Lift the resulting c.p.c. map from $B$ to coordinate c.p.c. maps into $D$.
    Its exact order-zero and commutation identities in $B$ give (10.2)–(10.2) on an $omega$-large set.
    Its trace estimates also give (10.2) on an $omega$-large set.
    Otherwise choose, at every failing coordinate, a violating tracial contraction and one of the finitely many
    targets; pass to an $omega$-large set where the target is fixed.
    Their ultralimit would contradict the strict bound $rho \/ 2$ from (10.4).
    Intersect these finitely many good sets and choose a coordinate. This proves all the required uniform estimates. ◻
]

We now seek norm-central order-zero maps whose trace deficits against a positive contraction $a$ are arbitrarily
  small relative to the rank of a fixed $b in A_(+)$. Here $a in "Ideal"_A \( b \)$ and $d_tau \( a \) lt.eq
  C d_tau \( b \)$ for every $tau$ and one finite $C > 0$; the precise statement is Proposition 35 below.
  For positive contractive representatives $\( h_n \)$ of the weight, the target is

$ tau #scale(x: 120%, y: 120%)[\(] a^(1 \/ 2) \( 1 - h_n \) a^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
  eta d_tau \( b \) $

on a common $omega$-large set for each $eta > 0$, uniformly over traces with $d_tau \( b \) < oo$.
  To remove the norm defects without losing this estimate, we measure an error by the rank of each positive cut of
  its modulus. Taking cuts makes this smallness condition stable under norm-null changes of representatives;
  traces with $d_tau \( b \) = 0$ will require exact vanishing.

#prodef([Definition 10.3.])[
  For $b in A_(+)$ define $J_b subset.eq A_omega$ as follows.
    An element $z = \( z_n \)$ belongs to $J_b$ if, for every $s > 0$ and $eta > 0$, there is $E in omega$ such that
  #[#set math.equation(numbering: n => "(10.5)")
   $ d_tau \( \( \| z_n \| - s \)_(+) \) lt.eq eta d_tau \( b \) quad
     upright("for every ") n in E upright(" and every ") tau upright(" with ") d_tau \( b \) < oo . $ <loc:J-predicate>]
  For $d_tau \( b \) = 0$ this means exact zero on the left.
    The set $E$ is common to the entire indicated trace family. It is enough to test positive rational $s \, eta$.
] <loc:relative-ideal>

#thm([Lemma 10.4.])[
  (The relative trace ideal).  #emph[Definition 33 is independent of the bounded representative.
    It defines a closed two-sided ideal of $A_omega$. Moreover,
    for every separable $C^(*)$-subalgebra $C_0 subset.eq A_omega$ there is a positive contraction $e in J_b ∩
    C'_0$ such that $e y = y$ for every $y in J_b ∩ C_0$.]
] <loc:sigma-ideal>

#proof[
  We record the rank facts used in verifying ideality. For $u \, v \, x in A$,
  #[#set math.equation(numbering: n => "(10.6)")
   $ d_tau \( \| u^(*) \| \) = d_tau \( \| u \| \) \, quad d_tau \( \| x u \| \) \, d_tau \( \| u x \| \) lt.eq
     d_tau \( \| u \| \) \, quad d_tau \( \| u + v \| \) lt.eq d_tau \( \| u \| \) +
     d_tau \( \| v \| \) . $ <loc:rank-calculus>]
  The first follows from Cuntz equivalence of the two squared moduli.
    For the second use $u^(*) x^(*) x u lt.eq parallel x parallel^2 u^(*) u$,
    and then the first identity for right multiplication. For the last use $\( u + v \)^(*) \( u + v \) lt.eq
    2 \( u^(*) u + v^(*) v \)$ and the Cuntz inequality for a sum of positive elements.
  For $t > 0$ the polar cut
  $ u^(\[ t \]) = u thin q_t \( \| u \| \) \, wide q_t \( lambda \) =
    cases(delim: "{", \( lambda - t \)_(+) \/ lambda \, & lambda > 0 \,, 0 \, & lambda = 0 \,) $
  belongs to $A$, has modulus $\( \| u \| - t \)_(+)$, and satisfies $parallel u - u^(\[ t \]) parallel lt.eq t$.
    Consequently a fixed positive cut of a sum or product can be Cuntz compared to the modulus of a sum or product
    of sufficiently small polar cuts. In detail, choose $t$ so small that the norm difference of the two
    expressions makes the difference of their moduli less than the desired cut.
    This is possible uniformly on the bounded sets at issue, by uniform continuity of $z mapsto \| z \|$.
    Norm comparison and (10.6) then bound that cut rank by the sum of the ranks of the input polar cuts,
    or by one such rank for multiplication and adjoints. Apply (10.5) with error $eta \/
    2$ for each of the two summands, and with error $eta$ for a product or adjoint.
    Finite intersection of the good sets proves closure under addition, adjoints,
    and left and right multiplication by bounded sequences. Scalar multiplication follows in the same way.
  Here are the perturbation details, including the zero-rank case.
    If $\( z_n \)$ and $\( z'_n \)$ represent the same element, then, for a fixed $s > 0$,
    on an $omega$-large set $parallel \| z'_n \| - \| z_n \| parallel < s \/ 2$. Therefore
  #[#set math.equation(numbering: n => "(10.7)")
   $ \[ \( \| z'_n \| - s \)_(+) \] lt.eq \[ \( \| z_n \| - s \/ 2 \)_(+) \] \, $ <loc:representative-cut>]
  by comparing $\| z'_n \|$ with $\( \| z_n \| - s \/ 2 \)_(+)$ in norm, at error strictly less than $s$.
    This proves representative independence. If $z^(\( l \)) in J_b$ converges in the norm of $A_omega$ to $z$,
    fix a cut $s > 0$ and choose $l$ so that bounded lifts of $z^(\( l \))$ and $z$ are close enough on an
    $omega$-large set to give (10.7) with $z^(\( l \))$ on the right.
    Apply its predicate at cut $s \/ 2$ and arbitrary error $eta$. This proves norm closedness.
    When $d_tau \( b \) = 0$, every rank comparison in these arguments has an exactly zero right side on the
    common good set. No assertion about the uncut rank of a norm-small perturbation is being used.
  Put $I_0 = J_b ∩ C_0$. Choose dense sequences $\( c_j \)$ in the unit ball of $C_0$ and $\( y_j \)$ in the unit
    ball of $I_0$. A quasicentral approximate unit for $I_0$ in $C_0$ supplies positive contractions $e^(\( l \))
    in I_0$ such that, for $j lt.eq l$,
  $ parallel \[ e^(\( l \)) \, c_j \] parallel < 1 \/ l \, wide parallel e^(\( l \)) y_j - y_j parallel < 1 \/ l . $
  Choose positive contractive lifts $e_n^(\( l \))$ and bounded lifts of the $c_j \, y_j$.
    For each $l$, there is an $omega$-large set $G_l$ on which these finitely many norm estimates hold with $2 \/
    l$ in place of $1 \/ l$ and, simultaneously, for $1 lt.eq j lt.eq l$,
  #[#set math.equation(numbering: n => "(10.8)")
   $ d_tau \( \( e_n^(\( l \)) - 1 \/ j \)_(+) \) lt.eq l^(- 1) d_tau \( b \) quad
     upright("for all ") tau upright(" with ") d_tau \( b \) < oo . $ <loc:sigma-stage>]
  Each displayed inequality is one uniform coordinate predicate,
    so only finitely many predicates are intersected at this stage.
    In particular, this construction does not enumerate traces.
  Replace $G_l$ by the decreasing sets $E_l = { n gt.eq l } ∩ ⋂_(r lt.eq l) G_r$.
    For $n in E_1$ let $l \( n \)$ be the largest $l lt.eq n$ with $n in E_l$, and set $e_n =
    e_n^(\( l \( n \) \))$; put $e_n = 0$ elsewhere. Then $l \( n \) arrow.r_omega oo$.
    The norm tests imply that $e = \( e_n \)$ commutes with $C_0$ and absorbs $I_0$.
    Given $s \, eta > 0$, choose $j$ with $1 \/ j < s$ and then require $l \( n \) gt.eq
    j$ and $1 \/ l \( n \) lt.eq eta$. Equation (10.8) implies (10.5).
    For zero-rank traces it continues to assert exact zero at each selected coordinate.
    Thus $e in J_b$, completing the proof. ◻
]

#thm([Proposition 10.5.])[
  (Localized norm-central trace filling).  #emph[Let $k gt.eq 2$, $b in A_(+)$,
    and let $a in "Ideal"_A \( b \)$ be a positive contraction. Suppose that, for some finite $C > 0$,
#[#set math.equation(numbering: n => "(10.9)")
 $ d_tau \( a \) lt.eq C d_tau \( b \) wide upright("for every ") tau . $ <loc:relative-rank>]

 There is a c.p.c. order-zero map $phi.alt : M_k arrow.r A_omega ∩
   A'$ with weight $h$ such that every positive contractive representative $\( h_n \)$ of $h$ has the following
   property: for every $eta > 0$, on a common $omega$-large set of coordinates,
#[#set math.equation(numbering: n => "(10.10)")
 $ tau #scale(x: 120%, y: 120%)[\(] a^(1 \/ 2) \( 1 - h_n \) a^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
   eta d_tau \( b \) wide \( d_tau \( b \) < oo \) . $ <loc:TL>]

 In particular the left side is exactly zero when $d_tau \( b \) = 0$.]
  #emph[The finite-coordinate form permits arbitrary relative trace accuracies together with prescribed finite
    norm tests. Given a finite set $F subset A$, finitely many pairs $\( a_l \, b_l \)$ satisfying (10.9) with
    finite constants $C_l$, positive accuracies $eta_l$, and $rho > 0$, there is a c.p.c. map $theta : M_k arrow.r
    A$ whose matrix-unit order-zero defects and commutators with $F$ have norm less than $rho$,
    and whose weight satisfies
#[#set math.equation(numbering: n => "(10.11)")
 $ tau #scale(x: 120%, y: 120%)[\(] a_l^(1 \/ 2) \( 1 - theta \( 1 \) \) a_l^(1 \/ 2) #scale(x: 120%, y: 120%)[\)]
   lt.eq eta_l d_tau \( b_l \) wide \( d_tau \( b_l \) < oo \) $ <loc:TL-coordinate>]

 for every $l$, simultaneously over all the indicated traces.]
] <prop:localized-trace>

#proof[
  The relative rank bound will control both the approximate-unit tail in the hereditary construction and the trace
    mass lost when we remove the ideal $J_b$. Write $I = "Ideal"_A \( b \)$ and choose a sequential positive
    contractive quasicentral approximate unit $v_i$ for $I$ in $A$. Fix $t_i > 0$ tending to zero, and set
  $ p_i = \( v_i - 2 t_i \)_(+) \, wide q_i = chi_i \( v_i \) \, $
  where $chi_i$ is zero on $\[ 0 \, t_i \]$, increases linearly to one on $\[ t_i \, 2 t_i \]$,
    and is one thereafter. We may assume $2 t_i < 1$. Then $p_i q_i = p_i$, $parallel p_i - v_i parallel lt.eq
    2 t_i$, and $\( p_i \)$ is still a quasicentral approximate unit.
    Moreover $\[ q_i \] lt.eq \[ \( v_i - t_i \/ 2 \)_(+) \]$.
    Compact containment and $v_i in I$ give an integer $L_i gt.eq 1$ with
  #[#set math.equation(numbering: n => "(10.12)")
   $ \[ q_i \] lt.eq L_i \[ b \] . $ <loc:hereditary-bound>]
  No uniform bound on these integers is required.
  Let $D_i = "her"_A \( q_i \)$. If $d_tau \( b \) < oo$, the restriction of $tau$ to $D_i$ is a bounded positive
    tracial functional with
  #[#set math.equation(numbering: n => "(10.13)")
   $ parallel tau \|_(D_i) parallel = d_tau \( q_i \) lt.eq L_i d_tau \( b \) . $ <loc:trace-norm>]
  Indeed every positive contraction of $D_i$ is supported by $p_(q_i)$, so its trace is at most $d_tau \( q_i \)$;
    an approximate unit obtained from $q_i$ shows equality. Equivalently,
    use $q_i^(1 \/ m)$ and lower semicontinuity. Finiteness of the bound turns the additive tracial map on
    positives into a bounded positive linear functional on $D_i$. For $d_tau \( b \) = 0$ that functional is zero.
    For a positive finite $d_tau \( b \)$, dividing it by $L_i
    d_tau \( b \)$ gives an element of $T_(lt.eq 1) \( D_i \)$.
  Choose a dense sequence $\( x_j \)$ in the unit ball of $A$, and apply Lemma 32 inside $D_i$, with tests
  $ p_i \, quad q_i x_j q_i med \( j lt.eq i \) quad upright("and their real and imaginary parts") \, $
  and positive target $p_i a p_i$. Choose its accuracy $rho_i > 0$ after $L_i$ has been fixed, so that
  #[#set math.equation(numbering: n => "(10.14)")
   $ L_i rho_i arrow.r 0 \, wide L_i rho_i^2 arrow.r 0 \; $ <loc:accuracy>]
  for example $rho_i = 1 \/ \( i \( 1 + L_i \) \)$ works. Denote the resulting maps by $mu_i : M_k arrow.r D_i$,
    and put $theta_i \( z \) = p_i mu_i \( z \) p_i$. These are c.p.c. maps into $A$.
  Their trace defects have the required relative bound already before correction.
    Put $lambda_i = parallel a^(1 \/ 2) \( 1 - p_i^2 \) a^(1 \/ 2) parallel$, so $lambda_i arrow.r 0$.
    The positive element defining $lambda_i$ is supported by $p_a$; using (10.9),
    its trace is at most $C lambda_i d_tau \( b \)$. The other part of the defect is, by traciality,
  $ tau #scale(x: 120%, y: 120%)[\(] \( 1 - mu_i \( 1 \) \)^(1 \/ 2) p_i a p_i \( 1 - mu_i \( 1 \) \)^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\)] lt.eq L_i rho_i d_tau \( b \) . $
  Thus
  #[#set math.equation(numbering: n => "(10.15)")
   $ tau #scale(x: 120%, y: 120%)[\(] a^(1 \/ 2) \( 1 - theta_i \( 1 \) \) a^(1 \/ 2) #scale(x: 120%, y: 120%)[\)]
     lt.eq \( C lambda_i + L_i rho_i \) d_tau \( b \) wide \( d_tau \( b \) < oo \) . $ <loc:uncorrected-trace>]
  At zero rank both contributions are exactly zero.
  Let $mu \, theta$ be the c.p.c. maps represented by the coordinate maps.
    Their relevant relations first hold modulo $J_b$. In fact, for each tested $2$-norm defect $z_i$,
    normalization in (10.13) and functional calculus give
  $ d_tau \( \( \| z_i \| - s \)_(+) \) lt.eq s^(- 2) tau \( z_i^(*) z_i \) lt.eq s^(- 2) L_i rho_i^2 d_tau \( b \) . $
  The estimate holds for every fixed $s > 0$; at zero rank it holds because all the coordinates at issue belong to
    $I$ and the restricted trace is zero. Equation (10.14) proves that these defect sequences belong to $J_b$.
    Consequently, modulo $J_b$, the map $mu$ is order zero and commutes with $p = \( p_i \)$ and each
    $\( q_i x_j q_i \)$. Also $\[ p_i \, q_i x_j q_i \] = q_i \[ p_i \, x_j \] q_i arrow.r 0$ in norm.
    It follows that $theta = p mu \( dot.op \) p$ is order zero modulo $J_b$ and commutes there with
    $\( q_i x_j q_i \)$. It commutes there with the constant $x_j$ as well:
    using $q_i p_i = p_i$, the difference between the two commutators has norm at most $2
    parallel \[ p_i \, x_j \] parallel$. For example $p_i mu_i \( z \) p_i x_j \( 1 - q_i \) =
    p_i mu_i \( z \) \[ p_i \, x_j \] \( 1 - q_i \)$ for $parallel z parallel lt.eq 1$;
    the other term is its analogous left-sided expression. Density gives the assertion for all of $A$.
  Apply Lemma 34 to $C_0 = C^(*) \( A \, theta \( M_k \) \)$, and let $e$ be its absorbing positive contraction. Define
  $ phi.alt \( z \) = \( 1 - e \) theta \( z \) . $
  Since $e$ commutes with the range, this is c.p.c. Every order-zero polynomial defect of $theta$ belongs to
    $J_b ∩ C_0$ and is annihilated by $1 - e$. Multiplication by $\( 1 - e \)^2$ therefore proves the exact
    order-zero identities for $phi.alt$.
    Likewise $\[ phi.alt \( z \) \, x \] = \( 1 - e \) \[ theta \( z \) \, x \] = 0$ for $x in A$.
    Thus $phi.alt : M_k arrow.r A_omega ∩ A'$ has the required norm relations.
  To check the trace loss, the removed weight $j = e theta \( 1 \)$ is a positive contraction in $J_b$.
    Choose positive contractive representatives $j_i$ and $h_i$ of $j$ and $h = phi.alt \( 1 \)$.
    Then $theta_i \( 1 \) - h_i - j_i arrow.r_omega 0$ in norm.
    For $s > 0$, functional calculus gives $j_i lt.eq s 1 + \( j_i - s \)_(+)$, whence
  #[#set math.equation(numbering: n => "(10.16)")
   $ tau \( a^(1 \/ 2) j_i a^(1 \/ 2) \) lt.eq s d_tau \( a \) +
     d_tau \( \( j_i - s \)_(+) \) . $ <loc:correction-cost>]
  Here the second term bounds the trace of a compression of the positive contraction $\( j_i - s \)_(+)$,
    and its rank is unchanged by a positive rescaling if necessary.
    Given a desired relative error, first choose $s$ so that $s C$ is small,
    then use (10.5) at that fixed cut with a sufficiently small error.
    Norm-null differences of the lifts contribute at most their norm times $d_tau \( a \) lt.eq C d_tau \( b \)$.
    Combining these observations with (10.15) proves (10.10), uniformly for positive finite $d_tau \( b \)$.
    If $d_tau \( b \) = 0$, then $d_tau \( a \) = 0$ and every positive contraction $h_i$ has exactly zero defect
    against $a$. This also proves the assertion for every choice of positive contractive representative of $h$.
  For completeness, the passage to several pairs permits arbitrary finite coordinate tests.
    Construct the map for the first pair. For the next pair use the preceding construction and reindex its
    coordinate lifts as follows. At coordinate $n$ the matrix-unit values of all already fixed maps are a finite
    list of ordinary elements of $A$. Norm centrality of the new map allows an index at which its commutators with
    that list and with the first $n$ fixed dense tests are less than $1 \/ n$.
    Intersect this set of indices with the sets imposing its order-zero errors and its uniform trace predicate for
    its fixed pair, to any desired accuracy tending to zero. A finite intersection is $omega$-large and hence
    nonempty. The selected sequence still has (10.10) and now commutes with the earlier maps.
    Repeat for the finite list of pairs and join.
  The joined weight $H$ dominates every original weight $h^(\( l \))$.
    This domination also preserves the uniform trace estimates at coordinates.
    Indeed choose positive lifts $D_n^(\( l \))$ of $H - h^(\( l \))$; for any positive contractive lifts $H_n \,
    h_n^(\( l \))$,
  $ H_n gt.eq h_n^(\( l \)) - delta_(l \, n) 1 \, wide delta_(l \, n) arrow.r_omega 0 . $
  Their trace-defect difference against $a_l$ is therefore at most $C_l delta_(l \, n)
    d_tau \( b_l \)$ when that rank is finite; at zero rank both defects vanish.
    Lift the joined c.p.c. map and select one coordinate in the finite intersection imposing all desired norm
    relations, all prescribed commutators, and all relative trace bounds with strict slack. This gives (10.11).
    The finite set $F$, and each $eta_l$, are arbitrary at this final step. ◻
]

== 11 Adaptive comparison and an unlimited supply of slots <sec:comparison>

Our goal is to compare a cut of the defect of a central matrix cone with one of its diagonal corners,
  with a witness bound independent of matrix size. Norm visibility supplies finite coordinate ideal multiplicities
  $L_n$, which need not be bounded. We fix the norm maps and these integers first,
  and then choose a tracial cone with relative defect error $eta_n \/ L_n$, where $eta_n arrow.r 0$.
  The ideal comparison bounds the controlling rank by a multiple of $L_n$ times the target rank;
  passing to a diagonal corner adds only the fixed matrix-size factor.
  The reciprocal $L_n$ in the trace error cancels this multiplicity.
  We must therefore obtain an exact coordinate Cuntz inequality before using it.
  A further spectral margin bounds the witnesses independently of matrix size,
  allowing the final construction of countably many orthogonal equivalent central slots.

Fix a countable norm-dense family $cal(A)$ in the positive contractions of $A$,
  closed under positive rational spectral cuts. Such a family is obtained by starting with a countable dense
  family and adjoining its iterated rational cuts. Enumerate the tests

$ \( a_r \, epsilon_r \) in cal(A) times \( bb(Q) ∩ \( 0 \, 1 \) \) \, wide r gt.eq 1 . $

We shall use the fixed scalar functions

#[#set math.equation(numbering: n => "(11.1)")
 $ f \( t \) = min \( 1 \, 2 t \) \, wide g \( t \) = max \( 0 \, 2 t - 1 \) quad \( 0 lt.eq t lt.eq 1 \) .
   $ <cmp:cutoff-functions>]

Thus $g$ is nondecreasing, vanishes on $\[ 0 \, 1 \/ 2 \]$, and $g \( 1 \) = 1$; also $f \( t \) gt.eq
  t$ and $f g = g$. Functional calculus on an order-zero map has the meaning fixed in the preliminaries.
  The function $f$ enlarges its weight, while $g$ selects a part on which $f$ is one;
  the enlarged cone will consequently fix the slots cut out by $g$.

#thm([Proposition 11.1.])[
  (Coordinate ideal visibility).  #emph[For every fixed $k gt.eq 2$ there is a c.p.c. order-zero map $nu :
    M_k arrow.r A_omega ∩ A'$, represented by c.p.c. maps $nu_n : M_k arrow.r A$, with weights $h_n^nu =
    nu_n \( 1 \)$, such that the following holds. For every test $\( a \, epsilon \)$, put
$ b = \( a - epsilon \/ 8 \)_(+) \, wide y_n^nu = a^(1 \/ 2) g \( h_n^nu \)^2 a^(1 \/ 2) . $

 There are integers $L_(a \, epsilon \, n) gt.eq 1$ and an $omega$-large set $E_(a \, epsilon)$ on which
#[#set math.equation(numbering: n => "(11.2)")
 $ \[ b \] lt.eq L_(a \, epsilon \, n) \[ \( y_n^nu - epsilon \/ 20 \)_(+) \] quad
   upright("in ") upright("Cu") \( A \) . $ <cmp:I>]

 The integers need not be bounded as $n$ varies.]
] <prop:idealvisibility>

#proof[
  First consider finitely many tests. For one of them apply Proposition 22 with
  $ x = \( a - epsilon \/ 16 \)_(+) \, wide gamma = epsilon \/ 64 . $
  It gives a norm-central order-zero map with positive contractive weight representatives $t_n$ and a constant
    $0 < kappa lt.eq 1$ such that, on a common $omega$-large set,
  #[#set math.equation(numbering: n => "(11.3)")
   $ parallel sigma \( x \) parallel gt.eq gamma quad arrow.r.double quad
     parallel sigma \( x t_n \) parallel gt.eq kappa wide upright("for every irreducible ") sigma .
     $ <cmp:norm-trigger>]
  If no representation satisfies the trigger, one can take the zero map and any $0 < kappa lt.eq 1$;
    the assertions below then remain vacuous on the relevant representations.
    Choose a continuous positive contraction $chi$ on $\[ 0 \, 1 \]$,
    zero at zero and equal to one on $\[ kappa \/ 2 \, 1 \]$, and reparametrize the order-zero map by $chi$.
  Do this for each of the finitely many tests, choosing commuting maps by successive reindexing.
    Here reindexing preserves the representation quantifier in (11.3).
    More explicitly, at coordinate $n$, previously chosen matrix-unit lifts form a finite list of elements of $A$.
    Choose an index of the next map at which its norm commutators with those elements and the first $n$ dense
    tests are small, its order-zero defects are small, and its own uniform implication (11.3) holds.
    Each condition holds on an $omega$-large set, and a finite intersection is nonempty.
    The implication is simultaneous over all representations at the selected index,
    so it is retained without choosing representations during reindexing. Join the reparametrized maps using Lemma 31.
  Let $nu$ denote this finite join for the moment, and choose c.p.c. coordinate lifts with weights $h_n^nu$.
    We claim that, on an $omega$-large set, simultaneously in all irreducible representations,
  #[#set math.equation(numbering: n => "(11.4)")
   $ parallel sigma \( a \) parallel > 3 epsilon \/ 32 quad arrow.r.double quad
     parallel sigma \( a^(1 \/ 2) g \( h_n^nu \)^2 a^(1 \/ 2) \) parallel > epsilon \/ 20 .
     $ <cmp:visibility-implication>]
  Suppose instead that its failure set belongs to $omega$, and choose a failing representation $sigma_n$ at each
    such coordinate. Intersect with the good set for (11.3). Since
  $ parallel sigma_n \( \( a - epsilon \/ 16 \)_(+) \) parallel > 3 epsilon \/ 32 - epsilon \/ 16 =
    epsilon \/ 32 > gamma \, $
  that trigger applies, even if the represented norms tend to the boundary $3 epsilon \/ 32$.
  Take the Hilbert space ultraproduct of these representations, and write $macron(a) \, macron(t) \,
    macron(H)$ for the resulting positive operators representing $a$, the old unmodified weight for this test,
    and the joined weight. Norm centrality gives $\[ macron(a) \, macron(t) \] = 0$, and (11.3) gives
  $ parallel \( macron(a) - epsilon \/ 16 \)_(+) macron(t) parallel gt.eq kappa . $
  Consequently the joint spectral part where $macron(a) > epsilon \/ 16$ and $macron(t) > kappa \/ 2$ is nonzero.
    Indeed the product is zero where $macron(a) lt.eq epsilon \/ 16$ and has norm at most $kappa \/
    2$ where $macron(t) lt.eq kappa \/ 2$. On the indicated nonzero part the reparametrized weight
    $chi \( macron(t) \)$ is one. The joined weight dominates this weight and commutes with it and with
    $macron(a)$; being a contraction, it too is one there. It follows that
  $ parallel macron(a)^(1 \/ 2) g \( macron(H) \)^2 macron(a)^(1 \/ 2) parallel gt.eq epsilon \/ 16 > epsilon \/ 20 . $
  This contradicts the upper bound at the failing coordinates.
    Arbitrary positive weight lifts of the joined map give the same limiting operators,
    so no particular lifting convention was needed for this contradiction.
    This proves (11.4) for each test in the finite group.
  For each $l$ perform this construction for the first $l$ tests.
    Take c.p.c. coordinate lifts of the resulting maps. Choose a decreasing sequence of $omega$-large sets on
    which the first $l$ norm centrality tests and matrix-unit order-zero identities hold to accuracy tending to
    zero, and all the first $l$ implications (11.4) hold exactly.
    Include ${ n gt.eq l }$ in the $l$th set, and use its largest admissible stage at coordinate $n$.
    Lemma 19 applies, since all these maps and weights are contractions.
    The diagonal defines a single norm-central order-zero $nu$, with c.p.c. lifts,
    and preserves each of the implications on an $omega$-large set.
  At a coordinate where (11.4) holds, every irreducible representation annihilating
    $\( y_n^nu - epsilon \/ 20 \)_(+)$ annihilates $\( a - 3 epsilon \/ 32 \)_(+)$.
    Indeed annihilation of the former is precisely the condition $parallel sigma \( y_n^nu \) parallel lt.eq
    epsilon \/ 20$, which implies $parallel sigma \( a \) parallel lt.eq 3 epsilon \/ 32$.
    Primitive ideal separation gives
  $ \( a - 3 epsilon \/ 32 \)_(+) in "Ideal"_A \( \( y_n^nu - epsilon \/ 20 \)_(+) \) . $
  The additional positive cut $epsilon \/ 8 - 3 epsilon \/ 32 =
    epsilon \/ 32$ now gives a finite integer $L_(a \, epsilon \, n)$ in (11.2),
    by the compact-cut ideal comparison from the preliminaries.
    Choose the integer to be at least one and put it equal to one outside the good set.
    This makes all constants specified at all coordinates and proves the proposition. ◻
]

#thm([Proposition 11.2.])[
  (An adaptive rank gap).  #emph[For every fixed $k gt.eq 2$ there is a c.p.c. order-zero map $zeta^k :
    M_k arrow.r A_omega ∩ A'$ with weight $H$ such that, for every test $\( a \, epsilon \)$, if
#[#set math.equation(numbering: n => "(11.5)")
 $ u^k \( a \) = \( 1 - f \( H \) \) a \, wide y^k \( a \) = g \( zeta^k \) \( e_11 \)^2 a \, $ <cmp:u-y>]

 there is $r_(a \, epsilon)^k in A_omega$ satisfying
#[#set math.equation(numbering: n => "(11.6)")
 $ \( u^k \( a \) - epsilon \)_(+) = \( r_(a \, epsilon)^k \)^(*) y^k \( a \) r_(a \, epsilon)^k \, wide
   parallel r_(a \, epsilon)^k parallel^2 lt.eq 32 \/ epsilon . $ <cmp:bounded-comparison>]

 In particular the witness bound is independent of $k$.]
] <prop:rankgap>

#proof[
  Apply Proposition 36 for this $k$. #emph[Fix its coordinate maps $nu_n$, their weights,
    and every integer $L_(a \, epsilon \, n)$ before making any subsequent choices.] They will not be reindexed in
    this proof.
  For a test $\( a \, epsilon \)$ retain $b = \( a - epsilon \/ 8 \)_(+)$ and put
    $d = \( a - epsilon \/ 4 \)_(+)$. Then $d in "Ideal"_A \( b \)$ and $\[ d \] lt.eq \[ b \]$,
    so Proposition 35 applies to $\( d \, b \)$ with relative rank constant one.
    Let $E_r$ be the good sets in (11.2) for the enumerated tests. Form decreasing $omega$-large sets
  $ G_l = { n gt.eq l } ∩ ⋂_(r lt.eq l) E_r \, $
  and let $l \( n \)$ be the largest $l lt.eq n$ with $n in G_l$, or zero if there is none.
    Thus $l \( n \) arrow.r_omega oo$, and all ideal bounds for the first $l \( n \)$ tests are valid at
    coordinate $n$. Choose positive numbers $eta_n arrow.r 0$, for example $eta_n = 1 \/ n$.
  At coordinate $n$ use the finite-coordinate conclusion of Proposition 35 for the first $l \( n \)$ pairs
    $\( d_r \, b_r \)$, with the individually prescribed accuracies
  $ eta_n \/ L_(a_r \, epsilon_r \, n) . $
  Include the first $n$ members of a fixed dense family in $A$, and all matrix-unit values $nu_n \( e_(i j) \)$,
    in the commutator tests. Ask for norm commutators and norm order-zero defects less than $1 \/ n$.
    Denote the resulting c.p.c. map by $theta_n$, and its weight by $h_n^theta$.
    Where $l \( n \) = 0$ one may use the zero map. Every finite problem here has already specified its finite
    integers; its requested trace accuracy is allowed to be arbitrarily small.
    Consequently the maps represent a norm-central order-zero map $theta$ commuting with $nu$, and,
    for each fixed test, on an $omega$-large set,
  #[#set math.equation(numbering: n => "(11.7)")
   $ tau #scale(x: 120%, y: 120%)[\(] d^(1 \/ 2) \( 1 - h_n^theta \) d^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
     eta_n / L_(a \, epsilon \, n) d_tau \( b \) wide \( d_tau \( b \) < oo \) . $ <cmp:adaptive-trace>]
  At zero rank this asserts exact zero; alternatively it follows directly from $\[ d \] lt.eq \[ b \]$.
  Join $theta$ and $nu$ to obtain $zeta^k$. Use the following specific positive contractive representatives of its
    weight:
  #[#set math.equation(numbering: n => "(11.8)")
   $ H_n = 1 - \( 1 - h_n^theta \)^(1 \/ 2) \( 1 - h_n^nu \) \( 1 - h_n^theta \)^(1 \/ 2) .
     $ <cmp:positive-weight-lift>]
  They belong to $A$: equivalently, they are $h_n^theta + \( 1 - h_n^theta \)^(1 \/ 2)
    h_n^nu \( 1 - h_n^theta \)^(1 \/ 2)$. They lie between $h_n^theta$ and $1$.
    Since the two weights commute in the ultrapower, they represent the joined weight $H$.
    For $u^k \( a \)$ use the positive contractive representatives
  #[#set math.equation(numbering: n => "(11.9)")
   $ u_n = \( 1 - f \( H_n \) \)^(1 \/ 2) a \( 1 - f \( H_n \) \)^(1 \/ 2) . $ <cmp:source-lift>]
  For $y^k \( a \)$ choose positive contractive representatives $y_n$; for example,
    if $B_n$ are positive contractive representatives of $g \( zeta^k \) \( e_11 \)$, one can take $y_n =
    B_n a B_n$. All products in (11.5) are positive because the matrix map is norm-central.
  We first convert the norm visibility into an exact coordinate Cuntz inequality.
    In $A_omega$ the old weight $h^nu$ and $H$ commute, $h^nu lt.eq H$, and both commute with $a$.
    Monotonicity of $g$ in this commutative functional calculus gives
  #[#set math.equation(numbering: n => "(11.10)")
   $ y^nu = a g \( h^nu \)^2 lt.eq a g \( H \)^2 . $ <cmp:total-weight-domination>]
  Write $𝜚$ for the supporting homomorphism of $zeta^k$. Since $a$ commutes with the range of $zeta^k$,
    it also commutes with the supporting matrix units: these are the strong limits of
    $zeta^k \( e_(i j) \) \( H + t \)^(- 1)$ as $t arrow.b 0$ in the bidual. The right side is the orthogonal sum of
  $ z_i = a g \( H \)^2 𝜚 \( e_(i i) \) quad \( 1 lt.eq i lt.eq k \) \, wide z_1 = y^k \( a \) . $
  The products are in $A_omega$. All $z_i$ are Cuntz equivalent, as are their corresponding positive cuts.
    Indeed $a^(1 \/ 2) g \( H \) 𝜚 \( e_(i j) \) in A_omega$ has its two squared moduli equal to $z_j \, z_i$;
    taking polar cuts gives the same fact for $\( z_j - t \)_(+)$ and $\( z_i - t \)_(+)$.
    The two positives in (11.10) commute, so scalar functional calculus, splitting a cut of an orthogonal sum,
    and enlarging its individual cuts give
  #[#set math.equation(numbering: n => "(11.11)")
   $ \[ \( y^nu - epsilon \/ 22 \)_(+) \] lt.eq k \[ \( y^k \( a \) - epsilon \/ 30 \)_(+) \] quad
     upright("in ") upright("Cu") \( A_omega \) . $ <cmp:ultrapower-cut>]
  Here the cut margins yield an exact inequality before any multiplication by a varying integer.
    Put $Delta = epsilon \/ 20 - epsilon \/ 22 > 0$. Choose one rectangular comparison witness for (11.11) in
    $M_(k \, 1) \( A_omega \)$ with norm error less than $Delta \/ 2$.
    Such rectangular witnesses suffice because the source is in one corner and the target is the diagonal of $k$
    elements of $A_omega$. Choose bounded coordinate lifts $X_n$ of this witness.
    Since functional calculus commutes with the quotient, on an $omega$-large set,
  $ ∥\( y_n^nu - epsilon \/ 22 \)_(+) -
    X_n^(*) "diag" #scale(x: 120%, y: 120%)[\(] \( y_n - epsilon \/ 30 \)_(+) \,
    dots.h \, \( y_n - epsilon \/ 30 \)_(+) #scale(x: 120%, y: 120%)[\)] X_n∥ < Delta . $
  Norm comparison at that coordinate gives
  $ \[ \( y_n^nu - epsilon \/ 20 \)_(+) \] lt.eq k \[ \( y_n - epsilon \/ 30 \)_(+) \] lt.eq
    k \[ \( y_n - epsilon \/ 32 \)_(+) \] . $
  Intersect with the good set for (11.2). Only now multiply the exact Cuntz inequality by $L_n =
    L_(a \, epsilon \, n)$ to obtain
  #[#set math.equation(numbering: n => "(11.12)")
   $ \[ b \] lt.eq k L_n \[ \( y_n - epsilon \/ 32 \)_(+) \] . $ <cmp:exact-coordinate-bound>]
  The bound on $X_n$ may depend on the fixed $k$ and the test. No norm error is multiplied by $L_n$ in this argument.
  We next prove the coordinate rank gap
  #[#set math.equation(numbering: n => "(11.13)")
   $ d_tau \( \( u_n - epsilon \)_(+) \) lt.eq 1 / 2 d_tau \( \( y_n - epsilon \/ 32 \)_(+) \) wide
     upright("for every ") tau $ <cmp:R>]
  on an $omega$-large set. Put $c_n = \( 1 - f \( H_n \) \)^(1 \/ 2)$ and $v_n = c_n d c_n$.
    Since $parallel a - d parallel lt.eq epsilon \/ 4$, one has $parallel u_n - v_n parallel lt.eq epsilon \/ 4$.
    Comparing $u_n$ with $\( v_n - epsilon \/ 2 \)_(+)$ gives
  $ \[ \( u_n - epsilon \)_(+) \] lt.eq \[ \( v_n - epsilon \/ 2 \)_(+) \] \, wide
    d_tau \( \( u_n - epsilon \)_(+) \) lt.eq \( 2 \/ epsilon \) tau \( v_n \) . $
  For the first inequality the norm error is at most $epsilon \/ 4 + epsilon \/ 2 < epsilon$;
    the second is the elementary spectral trace bound. From the scalar inequality $f \( t \) gt.eq t$ and (11.8),
  $ f \( H_n \) gt.eq H_n gt.eq h_n^theta . $
  This uses functional calculus on $H_n$ itself and positive domination of $H_n$;
    it makes no operator-monotonicity assertion about $f$. Traciality and (11.7) consequently give,
    whenever $d_tau \( b \) < oo$,
  #[#set math.equation(numbering: n => "(11.14)")
   $ d_tau \( \( u_n - epsilon \)_(+) \) lt.eq 2 / epsilon tau #scale(x: 120%, y: 120%)[\(]
     d^(1 \/ 2) \( 1 - f \( H_n \) \) d^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
     frac(2 eta_n, epsilon L_n) d_tau \( b \) . $ <cmp:source-rank-estimate>]
  This estimate handles every possible trace value. Set $R_n = d_tau \( \( y_n - epsilon \/ 32 \)_(+) \)$.
    If $R_n < oo$, the exact inequality (11.12) gives $d_tau \( b \) lt.eq k L_n R_n < oo$, and therefore
  $ d_tau \( \( u_n - epsilon \)_(+) \) lt.eq \( 2 k eta_n \/ epsilon \) R_n . $
  For the fixed $k$ and test, eventually $2 k eta_n \/ epsilon lt.eq 1 \/ 2$.
    If $R_n = 0$, the same argument first forces $d_tau \( b \) = 0$ and then gives exactly zero on the left.
    If $R_n = oo$, inequality (11.13) is automatic in $\[ 0 \, oo \]$.
    All good sets used in these alternatives were chosen uniformly over the trace families;
    thus their intersection proves (11.13) simultaneously for every lower semicontinuous extended trace.
  Apply Lemma 16 in $A$ at each coordinate of this common good set. It gives
  $ \( u_n - epsilon \)_(+) prec.tilde \( y_n - s \)_(+) \, wide s = epsilon \/ 32 . $
  Choose $x_n in A$ with
  $ parallel x_n^(*) \( y_n - s \)_(+) x_n - \( u_n - epsilon \)_(+) parallel < 1 \/ n . $
  These witnesses need not themselves be bounded. Define the continuous scalar function
  $ q_s \( t \) =
    cases(delim: "{", #scale(x: 120%, y: 120%)[\(] \( t - s \)_(+) \/ t #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, &
    t > 0 \,, 0 \, & t = 0 \,) $
  and set $r_n = q_s \( y_n \) x_n$ on the good set and $r_n = 0$ elsewhere. Then
  $ r_n^(*) y_n r_n = x_n^(*) \( y_n - s \)_(+) x_n \, wide parallel r_n parallel^2 lt.eq
    s^(- 1) parallel x_n^(*) \( y_n - s \)_(+) x_n parallel lt.eq \( 32 \/ epsilon \) \( 1 + 1 \/ n \) . $
  The norm estimate follows from $q_s \( t \)^2 lt.eq s^(- 1) \( t - s \)_(+)$.
    Thus these representatives have the fixed bound $parallel r_n parallel^2 lt.eq 64 \/ epsilon$,
    and their ultrapower element has norm squared at most $32 \/ epsilon$.
    The compression errors tend to zero along $omega$, proving (11.6). Neither bound depends on $k$ or on any $L_n$. ◻
]

#thm([Proposition 11.3.])[
  (Infinitely many central slots).  #emph[For every $p gt.eq 2$ there are a c.p.c. order-zero map $alpha :
    M_p arrow.r A_omega ∩ A'$, with weight $h = alpha \( 1 \)$,
    and contractions $s_j in A_omega ∩ A'$ for $j gt.eq 1$ such that, putting $P = s_1$, one has
#[#set math.equation(numbering: n => "(11.15)")
 $ P gt.eq 0 \, wide s_i^(*) s_j = delta_(i j) P^2 \, wide alpha \( e_11 \) s_j = s_j . $ <cmp:slot-relations>]

 For every test $\( a \, epsilon \)$ there is $r_(a \, epsilon) in A_omega$ with
#[#set math.equation(numbering: n => "(11.16)")
 $ \( \( 1 - h \) a - epsilon \)_(+) = r_(a \, epsilon)^(*) \( P^2 a \) r_(a \, epsilon) \, wide
   parallel r_(a \, epsilon) parallel^2 lt.eq 64 \/ epsilon . $ <cmp:slot-comparison>]

 No centrality is asserted or needed for these comparison witnesses.]
] <prop:slots>

#proof[
  For fixed $m gt.eq 1$, apply Proposition 37 with $k = p m$ and identify $M_(p m) = M_p ⊗ M_m$. Define
  $ alpha_m \( z \) = f \( zeta^(p m) \) \( z ⊗ 1_m \) \, wide s_j^(\( m \)) =
    g \( zeta^(p m) \) \( e_11^(\( p \)) ⊗ e_(j 1)^(\( m \)) \) quad \( 1 lt.eq j lt.eq m \) \, wide P_m =
    s_1^(\( m \)) . $
  These are norm-central contractions, and $P_m$ is positive.
    The matrix-unit relations for the supporting homomorphism give
  $ \( s_i^(\( m \)) \)^(*) s_j^(\( m \)) = delta_(i j) P_m^2 . $
  The scalar identity $f g = g$ gives $alpha_m \( e_11 \) s_j^(\( m \)) = s_j^(\( m \))$.
    The weight of $alpha_m$ is $f \( H^(p m) \)$. Under the indicated identification the first diagonal slot of
    $M_(p m)$ is $e_11^(\( p \)) ⊗ e_11^(\( m \))$, so Proposition 37 supplies, for every test,
  $ \( \( 1 - alpha_m \( 1 \) \) a - epsilon \)_(+) = \( r_(a \, epsilon)^(\( m \)) \)^(*) \( P_m^2 a \)
    r_(a \, epsilon)^(\( m \)) . $
  The witness norm bounds are independent of $m$.
  We spell out the diagonalization because the number of slots grows.
    For every $m$ choose c.p.c. coordinate lifts $alpha_(m \, n)$,
    contractive lifts $s_(j \, m \, n)$ for $1 lt.eq j lt.eq m$, and positive contractive lifts $P_(m \, n) =
    s_(1 \, m \, n)$. Choose lifts of each comparison witness bounded by $sqrt(64 \/ epsilon)$;
    the sharper ultrapower bound in Proposition 37 leaves room for this choice.
    Put $h_(m \, n) = alpha_(m \, n) \( 1 \)$. At stage $l$ use $m = l$ and require:
  + the matrix-unit order-zero identities of $alpha_(l \, n)$,
    and its commutators with the first $l$ dense tests of $A$, to have error less than $1 \/ l$;
  + the centrality and the two algebraic relations in (11.15) for all slot indices at most $l$ to have error less
    than $1 \/ l$;
  + for the first $l$ comparison tests, the equations with positive coordinate expressions
    $ #scale(x: 120%, y: 120%)[\(] \( 1 - h_(l \, n) \)^(1 \/ 2) a \( 1 - h_(l \, n) \)^(1 \/ 2) -
      epsilon #scale(x: 120%, y: 120%)[\)]_(+) quad upright("and") quad
      r_(a \, epsilon \, l \, n)^(*) P_(l \, n) a P_(l \, n) r_(a \, epsilon \, l \, n) $
    to have error less than $1 \/ l$.
  For fixed $l$ all these finitely many estimates hold on an $omega$-large set,
    because their equations are exact in the ultrapower. The positive coordinate expressions represent the desired
    products since the weights and slots commute with $A$ in the ultrapower.
  Intersect the first $l$ such good sets with ${ n gt.eq l }$ to obtain decreasing $E_l in omega$,
    and take $m \( n \)$ to be the largest $l lt.eq n$ with $n in E_l$ (zero if none).
    At coordinate $n$ use the row indexed by $m \( n \)$. For a slot or witness whose index is larger than
    $m \( n \)$, use zero at that coordinate. Every fixed variable is eventually present along $omega$,
    since $m \( n \) arrow.r_omega oo$. All maps and slots are contractions,
    and the witness for a fixed test has its individual bound $sqrt(64 \/ epsilon)$ independently of the row.
    These are precisely the boundedness hypotheses of Lemma 19.
    The selected maps therefore define a c.p.c. norm-central order-zero $alpha$,
    and the selected slots and witnesses define elements with (11.15)–(11.16).
    No uniform trace estimate as $m$ grows was needed: each fixed matrix size had already produced exact equations
    with the stated individual norm bounds. ◻
]

== 12 Simultaneous domination and a central defect filler <cen:section>

The slots of Proposition 38 provide a central matrix cone $alpha$ with weight $h$, a positive contraction $P =
  s_1$, and orthogonal equivalent slots $s_j$. Put $E = A_omega$ and

$ Phi \( a \) = \( 1 - h \) a \, wide Psi \( a \) = P^2 a quad \( a in A \) . $

We will extend the comparison relations to obtain $Phi \( a \) in "Ideal"_E \( Psi \( a \) \)$ for every $a in
  A_(+)$. The individual comparison witnesses depend on $a$.
  To fill the defect centrally, for each prescribed finite $F subset A$ and $delta >
  0$ we need one finite list $v_1 \, dots.h \, v_N in E$ such that

$ ∥Phi \( a \) - sum_(j = 1)^N v_j^(*) Psi \( a \) v_j∥ < delta wide \( a in F \) . $

The first part of this section proves this implication for weighted inclusions.
  Nuclearity allows us to pass from pointwise ideal containment to an inclusion of support-representation kernels;
  the two tensor-ideal lemmas establish the needed bridge.

The slots then pack the common sum into $z = sum_j s_j v_j$.
  These elements need not be uniformly bounded or central. Approximate-unit tests will give bounded compressions
  with commutators tending to zero, and hence a bounded central element $S$ satisfying

$ alpha \( e_11 \) S = S \, wide S^(*) S a = \( 1 - h \) a quad \( a in A \) . $

This defect-filling argument is related to Matui–Sato’s use of excision in small central sequences and property
  (SI) [22].

=== 12.1 Tensor ideals and support representations <tensor-ideals-and-support-representations>

#thm([Lemma 12.1.])[
  #emph[Let $D$ and $C$ be $C^(*)$-algebras. Every nonzero closed two-sided ideal of $D ⊗
    C$ contains a nonzero tensor $a ⊗ b$ with $a in D_(+)$ and $b in C_(+)$.]
] <cen:elementary-tensor>

#proof[
  Let $0 eq.not x in J_(+)$. There is a pure state $lambda$ of the unitization $D^tilde.op$ such that
    $b = \( lambda ⊗ "id"_C \) \( x \) eq.not 0$. Indeed, product positive functionals detect nonzero positive
    elements of a spatial tensor product. Fixing the second functional gives a nonzero positive affine function on
    the state space of $D^tilde.op$, which is nonzero at some extreme point.
    The resulting pure state does not annihilate $D$. Its GNS representation is therefore nondegenerate on $D$;
    write $xi$ for its unit cyclic vector.
  Lemma 24 gives, on any prescribed finite set of coefficients in $D^tilde.op$,
    positive contractions $g in D^tilde.op$ with
  $ lambda \( g \) = 1 \, wide parallel g c g - lambda \( c \) g^2 parallel arrow.r 0 . $
  Here $pi_lambda \( g \) xi = xi$, since $g$ is a positive contraction.
    Choose once and for all a positive contraction $u in D$ such that $parallel pi_lambda \( u \) xi -
    xi parallel < 1 \/ 8$. Approximation of $x$ by finite algebraic sums and excision of their first coefficients
    show that
  $ "dist" #scale(x: 120%, y: 120%)[\(] \( u g^2 u \) ⊗ b \, J #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  The element used to approximate it is $\( u g ⊗ 1 \) x \( g u ⊗ 1 \)$, which belongs to $J$;
    all products with $1$ here are multiplier products. Moreover,
  $ parallel u g^2 u parallel med gt.eq med parallel pi_lambda \( g \) pi_lambda \( u \) xi parallel^2
    med > \( 7 \/ 8 \)^2 > 1 \/ 2 . $
  Thus the first factor retains a fixed norm lower bound as the excision accuracy improves.
  We use the following elementary cut observation. If $a \, b$ are positive and $parallel a ⊗ b +
    J parallel < t^2$, then
  #[#set math.equation(numbering: n => "(12.1)")
   $ \( a - t \)_(+) ⊗ \( b - t \)_(+) in J . $ <cen:product-cut>]
  To see this, represent $\( D ⊗ C \) \/ J$ faithfully and nondegenerately.
    The commuting multiplier operators representing $a ⊗ 1$ and $1 ⊗ b$ have product of norm less than $t^2$.
    Their joint spectrum has no point with both coordinates larger than $t$.
    Joint continuous functional calculus proves (12.1). Now fix $0 < t < min { 1 \/ 2 \,
    parallel b parallel }$ and choose $g$ so that the preceding distance is less than $t^2$.
    Both cuts in $\( u g^2 u - t \)_(+) ⊗ \( b - t \)_(+)$ are nonzero, and their tensor product belongs to $J$. ◻
]

#thm([Lemma 12.2.])[
  #emph[If $D$ is nuclear and $C$ is arbitrary, every closed two-sided ideal $J subset D ⊗
    C$ is generated by the positive elementary tensors that it contains.]
] <cen:nuclear-tensor-ideals>

#proof[
  Let $J_0$ be the ideal generated by those tensors. If $J_0 eq.not J$,
    primitive ideal separation gives a nondegenerate irreducible representation $pi$ with $pi \( J_0 \) =
    0$ and $pi \( J \) eq.not 0$. Let $pi_D$ and $pi_C$ be its commuting leg representations, and put $I =
    ker pi_D$, $L = ker pi_C$. Nuclearity of $D$ and of its quotient $D \/ I$ [11] Corollary 4,
    together with the quotient identity for the maximal tensor product, gives
  #[#set math.equation(numbering: n => "(12.2)")
   $ q : D ⊗ C arrow.r \( D \/ I \) ⊗ \( C \/ L \) \, wide ker q = overline(I ⊗ C + D ⊗ L) . $ <cen:tensor-quotient>]
  For completeness, the maximal quotient identity follows by the universal property of commuting representations:
    a representation annihilating the indicated two leg ideals is exactly a pair factoring through $D \/
    I$ and $C \/ L$. The nuclearity of the first leg identifies both maximal products in this statement with
    spatial products.
  The representation induced by $pi$ on the target of $q$ is faithful. Here is the needed verification.
    Write $M = pi_D \( D \)''$ and $N = pi_C \( C \)''$. The center of $M$ commutes with both legs,
    hence with the irreducible representation $pi$; it consists of scalars.
    Thus $M$ is a factor, and the same holds for $N$. If nonzero positive elements $x in M$, $y in N$ had $x y =
    0$, their support projections $e in M$, $f in N subset M'$ would satisfy $e f = 0$.
    Since $f$ commutes with $M$, it annihilates every $v e v^(*)$, $v in cal(U) \( M \)$.
    The join of these projections is the central support of $e$, which is $1$ in the factor $M$.
    This would give $f = 0$, a contradiction. The leg representations of $D \/ I$ and $C \/ L$ are faithful,
    so the induced tensor representation kills no nonzero positive elementary tensor.
    Lemma 39 applied to its kernel proves faithfulness.
  The nonzero ideal $q \( J \)$ therefore contains a nonzero positive tensor $macron(a) ⊗ macron(b)$.
    Choose positive lifts $a in D$, $b in C$. Since $a ⊗ b in J + ker q$,
    compression by $\( 1 - e \) ⊗ \( 1 - f \)$, where $e$ and $f$ run through positive contractive approximate
    units of $I$ and $L$, gives
  $ "dist" \( a_e ⊗ b_f \, J \) arrow.r 0 \, quad a_e = \( 1 - e \) a \( 1 - e \) \, quad
    b_f = \( 1 - f \) b \( 1 - f \) . $
  Indeed these compressions send each term of a finite sum from $I ⊗ C + D ⊗ L$ to zero in norm,
    and they preserve $J$. The quotient images of $a_e \, b_f$ remain $macron(a) \, macron(b)$.
    Fix $0 < t < min { parallel macron(a) parallel \, parallel macron(b) parallel }$.
    Once the displayed distance is less than $t^2$, (12.1) yields $\( a_e - t \)_(+) ⊗ \( b_f - t \)_(+) in
    J_0$ with nonzero image under $q$. Faithfulness of the induced representation contradicts $pi \( J_0 \) = 0$. ◻
]

=== 12.2 The simultaneous approximation <the-simultaneous-approximation>

Gabe’s approximate domination theorem [16] Definition 3.1 and Theorem 3.3 applies to an exact $C^(*)$-algebra $D$,
  an arbitrary $C^(*)$-algebra $E$, and nuclear completely positive maps $Psi \, Phi : D arrow.r E$,
  with $Psi$ of order zero. It identifies the condition $Phi \( a \) in "Ideal"_E \( Psi \( a \) \)$ for every $a
  in D_(+)$ with the following finite-set approximation: for every finite $F subset D$ and $delta > 0$,
  there are $N in bb(N)$ and $v_1 \, dots.h \, v_N in E$ such that

#[#set math.equation(numbering: n => "(12.3)")
 $ ∥Phi \( a \) - sum_(j = 1)^N v_j^(*) Psi \( a \) v_j∥ < delta wide \( a in F \) . $ <cen:domination-equation>]

Nuclearity is required of the maps; no nuclearity or separability assumption is imposed on $E$.
  We prove the weighted-inclusion case used here, so that the passage from ideal containment to one common finite
  list of compression coefficients is explicit.

#thm([Lemma 12.3.])[
  (Simultaneous domination for weighted inclusions).  #emph[Let $D subset.eq
    E$ be a nuclear $C^(*)$-subalgebra of a $C^(*)$-algebra $E$, and let $v \,
    w$ be positive contractions in $tilde(E) ∩ D'$. Put $Phi \( a \) = v a$ and $Psi \( a \) = w a$ for $a in D$;
    these products belong to $E$. Suppose that
$ Phi \( a \) in "Ideal"_E \( Psi \( a \) \) wide \( a in D_(+) \) . $

 Then for every finite set $F subset D$ and every $delta > 0$, there are an integer $N gt.eq 1$ and $v_1 \,
   dots.h \, v_N in E$ such that
$ ∥v a - sum_(j = 1)^N v_j^(*) w a v_j∥ < delta wide \( a in F \) . $

]
] <cen:weighted-domination>

#proof[
  Let $cal(Q)$ be the cone of maps $a mapsto sum_(j = 1)^N b_j^(*) w a b_j$, where $b_j in E$. It is convex:
    sums concatenate the lists, and multiplication by a nonnegative scalar is absorbed into the $b_j$.
    It suffices first to place $Phi$ in its point-weak closure.
  Fix $a_1 \, dots.h \, a_m in D$ and $ell_1 \, dots.h \, ell_m in E^(*)$.
    We may represent all these functionals in one nondegenerate cyclic representation $sigma : E arrow.r
    cal(B) \( H \)$, with cyclic vector $xi$, in the form
  #[#set math.equation(numbering: n => "(12.4)")
   $ ell_i \( b \) = chevron.l sigma \( b \) c_i xi \, xi chevron.r \, wide
     c_i in sigma \( E \)' . $ <cen:common-functional-model>]
  To verify this, decompose the real and imaginary parts of each $ell_i$ into differences of positive functionals.
    A positive multiple of their sum dominates all the positive summands.
    In its GNS representation a dominated positive functional gives a bounded positive form on vectors
    $sigma \( b \) xi$; its representing operator commutes with $sigma \( E \)$,
    as is seen by moving $sigma \( x \)$ between the two arguments of the form.
    Linear combinations give the $c_i$ in (12.4). Extend $sigma$ unitally to $E^tilde.op$ when necessary.
  Put $C = C^(*) \( 1 \, c_1 \, dots.h \, c_m \) subset sigma \( E \)'$. The commuting representations define
  $ pi : D ⊗ C arrow.r cal(B) \( H \) \, wide pi \( a ⊗ c \) = sigma \( a \) c \; $
  continuity for the spatial tensor norm follows from nuclearity of $D$.
    For $q = v \, w$, let $p_q$ be the support projection of $sigma \( q \)$ and let $pi_q$ be the restriction to
    $p_q H$. This is a reducing subspace for $pi$: each $q$ commutes with $D$,
    and each element of $C$ commutes with $E^tilde.op$.
  We claim
  #[#set math.equation(numbering: n => "(12.5)")
   $ ker pi_w subset ker pi_v . $ <cen:support-kernel>]
  Suppose $a ⊗ c in ker pi_w$. Commutation with the weight and positivity give
  $ sigma \( w a^(*) a \) c^(*) c = 0 . $
  Since $c^(*) c$ commutes with all of $sigma \( E \)$, this identity persists after multiplying
    $sigma \( w a^(*) a \)$ on either side by elements of $sigma \( E \)$ and taking closed linear spans.
    The ideal hypothesis $v a^(*) a in "Ideal"_E \( w a^(*) a \)$ therefore gives $sigma \( v a^(*) a \) c^(*) c =
    0$. This says $pi \( a ⊗ c \) sigma \( v \)^(1 \/ 2) = 0$, and,
    by density of the range of $sigma \( v \)^(1 \/ 2)$ in $p_v H$, gives $a ⊗ c in ker pi_v$.
    Lemma 40 says that the elementary tensors in $ker pi_w$ generate that kernel, and proves (12.5).
  Let $K = ker pi_w$. The vectors
  $ eta_b = sigma \( w \)^(1 \/ 2) sigma \( b \) xi \, wide b in E \, $
  are dense in $p_w H$: cyclicity first gives density before application of $sigma \( w \)^(1 \/ 2)$,
    and its range is dense in its support space. Finite sums of their vector functionals have weak-\* closure
    equal to the positive functional cone of $\( D ⊗ C \) \/ K$. Here is the separation argument.
    A selfadjoint element of this quotient that is nonnegative on all these functionals has a positive
    representing operator on $p_w H$, by the density of the $eta_b$.
    Faithfulness of the quotient representation makes the element positive.
    Thus the polar of the cone of these vector functionals is exactly the positive cone of the quotient.
    The bipolar form of Hahn–Banach separation identifies its weak-\* closure with all positive functionals on
    that quotient. This argument also applies to a nonunital quotient.
  The positive functional
  $ gamma_v \( x \) = chevron.l pi \( x \) sigma \( v \)^(1 \/ 2) xi \, sigma \( v \)^(1 \/ 2) xi chevron.r $
  factors through this quotient by (12.5). Hence, simultaneously on the finitely many tensors $a_i ⊗ c_i$,
    it is approximated by finite sums of vector functionals for $eta_(b_j)$. On these tensors the identities are
  $ gamma_v \( a_i ⊗ c_i \) & = ell_i \( v a_i \) \,\
sum_j chevron.l pi \( a_i ⊗ c_i \) eta_(b_j) \, eta_(b_j) chevron.r & = ell_i (sum_j b_j^(*) w a_i b_j) . $
  They prove the required point-weak closure, with the same finite list of coefficients for all the tests.
    Finally, for a fixed finite list $a_1 \, dots.h \, a_m$, the set
  $ { \( T \( a_1 \) \, dots.h \, T \( a_m \) \) : T in cal(Q) } subset E^m $
  is convex. Its weak and norm closures coincide by Hahn–Banach separation. This proves (12.3). ◻
]

=== 12.3 From slots to a bounded central element <from-slots-to-a-bounded-central-element>

#thm([Proposition 12.4.])[
  #emph[Let $A$ be a separable nuclear $C^(*)$-algebra satisfying (C).
    For each $p gt.eq 2$ there are a c.p.c. order-zero map $alpha : M_p arrow.r A_omega ∩ A'$, with $h =
    alpha \( 1 \)$, and an element $S in A_omega ∩ A'$ such that
#[#set math.equation(numbering: n => "(12.6)")
 $ alpha \( e_11 \) S = S \, wide S^(*) S a = \( 1 - h \) a quad \( a in A \) . $ <cen:filler-relations>]

 One can choose $parallel S parallel lt.eq 2$. In the second equation the expression $\( 1 - h \)
   a$ is computed in the unitization of $A_omega$ and belongs to $A_omega$.]
] <prop:central-filler>

#proof[
  Fix the map and slots from Proposition 38. Thus $P = s_1 gt.eq 0$, all $s_j$ are central contractions,
  #[#set math.equation(numbering: n => "(12.7)")
   $ s_i^(*) s_j = delta_(i j) P^2 \, wide alpha \( e_11 \) s_j = s_j \, $ <cen:slot-recall>]
  and, for every element $a$ of the countable dense family $cal(A)$ of positive contractions fixed in Section 11,
    closed under positive rational cuts, and every rational $epsilon > 0$,
    there is a bounded element $r_(a \, epsilon)$ with
  $ \( \( 1 - h \) a - epsilon \)_(+) = r_(a \, epsilon)^(*) \( P^2 a \) r_(a \, epsilon) . $
  Set $E = A_omega$, $v = 1 - h$, $w = P^2$, and define $Phi \( a \) = v a$, $Psi \( a \) = w a$.
    Both maps are completely positive and contractive, and $Psi$ has order zero.
    Since $A$ is nuclear, composing finite-dimensional completely positive approximations to $"id"_A$ with either
    map proves that both maps are nuclear.
  Letting $epsilon arrow.b 0$ in the last comparison gives $Phi \( d \) in "Ideal"_E \( Psi \( d \) \)$ for $d in
    cal(A)$. We verify the extension to an arbitrary positive contraction $a in A$.
    Choose $d_n in cal(A)$ and positive rational $delta_n arrow.b 0$ with $parallel d_n - a parallel < delta_n$.
    The cuts $b_n = \( d_n - delta_n \)_(+)$ belong to $cal(A) ∩ "Ideal"_A \( a \)$,
    by positive-element perturbation, and $b_n arrow.r a$ in norm. Centrality of $w$ implies
  #[#set math.equation(numbering: n => "(12.8)")
   $ w "Ideal"_A \( a \) subset "Ideal"_E \( w a \) : quad w \( x a y \) =
     x \( w a \) y quad \( x \, y in A \) . $ <cen:ideal-extension>]
  The same assertion follows for the closed ideal by approximation with finite sums.
    Consequently $Psi \( b_n \) in "Ideal"_E \( Psi \( a \) \)$, and
  $ Phi \( b_n \) in "Ideal"_E \( Psi \( b_n \) \) subset "Ideal"_E \( Psi \( a \) \) . $
  Taking the norm limit proves the ideal hypothesis for $a$; scaling proves it for every positive element.
  Apply Lemma 41. Any resulting sum packs into a single element $z = sum_(j = 1)^N s_j v_j in E$, because, for $a in A$,
  #[#set math.equation(numbering: n => "(12.9)")
   $ z^(*) a z = sum_(i \, j) v_i^(*) s_i^(*) a s_j v_j = sum_j v_j^(*) \( P^2 a \) v_j . $ <cen:packed-sum>]
  There is no uniform bound here on $z$ or on the individual $v_j$,
    and the coefficients need not commute with $A$. A compression by one approximate-unit element will supply both
    the bound needed for diagonalization and, through simultaneous tests, control of the commutators.
  Fix a finite set $F$ of contractions in $A$, and let $eta \, delta > 0$.
    Choose a positive contraction $t in A$ from an approximate unit so that, for all $a in F$,
  $ parallel t^2 a - a parallel < eta \, wide parallel t a t - a parallel < eta \, wide parallel t a^(*) a t -
    a^(*) a parallel < eta . $
  Approximate $Phi$ to within $delta$, using one sum in (12.9), on
  $ { t^2 } union { t a t \, t a^(*) a t : a in F } . $
  Put $S' = t z$. The $t^2$ test gives
  #[#set math.equation(numbering: n => "(12.10)")
   $ parallel S' parallel^2 = parallel z^(*) t^2 z parallel lt.eq parallel v t^2 parallel + delta lt.eq 1 +
     delta . $ <cen:bounded-compression>]
  Also $alpha \( e_11 \) S' = S'$ exactly, since $alpha \( e_11 \)$ commutes with $t$ and fixes all the $s_j$.
    Writing $kappa = delta + eta$, the three tests give
  #[#set math.equation(numbering: n => "(12.11)")
   $ parallel S' ""^(*) S' a - v a parallel & < kappa \,\
parallel S' ""^(*) a S' - v a parallel & < kappa \,\
parallel S' ""^(*) a^(*) a S' - v a^(*) a parallel & < kappa . $ <cen:first-test>]
  For the first line, multiply $parallel S' ""^(*) S' - v t^2 parallel < delta$ by $a$;
    the other two lines follow directly from their respective tests.
    Taking the adjoint of (12.11) controls $S' ""^(*) a^(*) S'$ as well. Now expand the full commutator square:
  $ \( a S' - S' a \)^(*) \( a S' - S' a \) =  & S' ""^(*) a^(*) a S' - S' ""^(*) a^(*) S' a\
 & - a^(*) S' ""^(*) a S' + a^(*) S' ""^(*) S' a . $
  Its four terms are within $kappa$ of, respectively, $v a^(*) a$, $- v a^(*) a$, $- v a^(*) a$, and $v a^(*) a$,
    because $v$ commutes with $A$. Therefore
  #[#set math.equation(numbering: n => "(12.12)")
   $ parallel \[ a \, S' \] parallel lt.eq 2 sqrt(kappa) wide \( a in F \) . $ <cen:commutator-bound>]
  Take increasing finite sets dense in the unit ball of $A$ and choose $eta \, delta arrow.b 0$,
    always with $delta < 1$. Each resulting $S'$ has norm at most $sqrt(2)$ by (12.10),
    and may be represented by a sequence bounded by $2$. Fix representatives of the finitely many matrix entries
    of $alpha$ throughout. The countable diagonalization of Lemma 19,
    applied to these fixed representatives and the norm tests (12.11), (12.12), and $alpha \( e_11 \) S' = S'$,
    gives a single element $S$ of norm at most $2$. It commutes with every element of $A$,
    retains the fixed support equation, and satisfies (12.6) on a dense set, hence on all of $A$ by continuity.
    Only the uniformly bounded $S'$ are diagonalized at this last step;
    the compression coefficients and their unbounded sums are not retained as variables. ◻
]

== 13 Dimension-drop relations and Jiang–Su absorption <abs:section>

Proposition 42 supplies a matrix cone and an element filling its defect.
  We first turn their relations into unital maps from individual prime dimension-drop algebras.
  These maps need not be compatible: nuclear approximation and bounded completely positive lifts will instead
  produce a single unital map $cal(Z) arrow.r F_omega \( A \)$.
  Finally, half-flip unitaries and an approximate intertwining give $A tilde.equiv A ⊗ cal(Z)$.

This route from central dimension-drop maps to absorption is established.
  For separable, possibly nonunital algebras, Nawata [23] Proposition 5.1 states the criterion using the sequence
  quotient. It fits the strongly self-absorbing framework of Toms–Winter [33];
  a formulation for arbitrary strongly self-absorbing algebras is given in [24] Theorem 2.2.
  We give the lifting and intertwining steps for the fixed ultrafilter quotient used here.

=== 13.1 The unit in the annihilator quotient <the-unit-in-the-annihilator-quotient>

Put

$ "Ann" \( A \) = { x in A_omega : x a = a x = 0 upright(" for every ") a in A } \, wide
  F_omega \( A \) = \( A_omega ∩ A' \) \/ "Ann" \( A \) . $

The annihilator is a closed two-sided ideal of $A_omega ∩ A'$.
  It is contained in that relative commutant, since all its products with $A$ vanish.
  If $\( e_n \)$ is a positive contractive sequential approximate unit of $A$,
  then $e = \[ \( e_n \) \] in A_omega ∩ A'$, and its class is the unit of $F_omega \( A \)$.
  Indeed $e a = a e = a$ for $a in A$, while for $x in A_omega ∩ A'$ the differences $e x - x$ and $x e -
  x$ annihilate $A$ on both sides. For example $\( e x - x \) a = \( e a - a \) x = 0$,
  and the other products follow in the same way.

Apply Proposition 42. The selfadjoint element $S^(*) S + h - e$ annihilates $A$ on the right by (12.6),
  and therefore on the left by taking adjoints. Writing $s$ for the quotient image of $S$,
  and using the same letters $alpha \, h$ for the quotient images of the map and its weight, gives the exact relations

#[#set math.equation(numbering: n => "(13.1)")
 $ s^(*) s = 1 - h \, wide alpha \( e_11 \) s = s \, wide h = alpha \( 1 \) . $ <abs:quotient-relations>]

In particular $s$ is a contraction in the quotient. The argument uses the quotient unit represented by
  $\( e_n \)$, without requiring a unit in $A$.

=== 13.2 An explicit dimension-drop model <an-explicit-dimension-drop-model>

For positive integers $r \, s$, write

$ I \( r \, s \) = { f in C \( \[ 0 \, 1 \] \, M_r ⊗ M_s \) : f \( 0 \) in M_r ⊗ 1_s \, med f \( 1 \) in 1_r ⊗ M_s } . $

Relations (13.1) are the order-zero form of the dimension-drop presentation in [28] Proposition 2.1,
  following [27] Proposition 5.1, (iii)$arrow.r.double$(iv).
  We give an explicit model and verify that every representation of the relations factors through it.

#thm([Proposition 13.1.])[
  #emph[Let $B$ be a unital $C^(*)$-algebra, let $p gt.eq 2$, and suppose that a c.p.c. order-zero map $alpha :
    M_p arrow.r B$ and $s in B$ satisfy
$ h = alpha \( 1 \) \, wide s^(*) s = 1 - h \, wide alpha \( e_11 \) s = s . $

 There is a unital homomorphism $I \( p \, p + 1 \) arrow.r B$ whose range contains $alpha \( M_p \)$ and $s$.
   Consequently $F_omega \( A \)$ receives a unital homomorphism from $I \( p \, p + 1 \)$ for every $p gt.eq 2$.]
] <prop:dimensiondrop>

#proof[
  #emph[The model and its generators.] Decompose the first matrix leg of $M_(p + 1) ⊗
    M_p$ into blocks of sizes $p$ and $1$, and put
  #[#set math.equation(numbering: n => "(13.2)")
   $ A_a \( t \) & = mat(delim: "(", a ⊗ 1_p, 0; 0, t a) \, &  & a in M_p \,\
T \( t \) & = sqrt(1 - t) med e_(1 \, p + 1)^(\( p + 1 \)) ⊗ 1_p . $ <abs:model-map>]
  The upper diagonal block has size $p^2$ and the lower one size $p$.
    At each $t$ the map $a mapsto A_a \( t \)$ is completely positive, contractive, and order zero.
    Direct matrix multiplication gives
  #[#set math.equation(numbering: n => "(13.3)")
   $ T^(*) T = 1 - A_1 \, wide A_(e_11) T = T \, $ <abs:model-relations>]
  and
  #[#set math.equation(numbering: n => "(13.4)")
   $ T^(*) T + sum_(i = 1)^p A_(e_(i 1)) T T^(*) A_(e_(1 i)) = \( 1 - t \) 1_(p \( p + 1 \)) . $ <abs:scalar-identity>]
  For the last identity, $T^(*) T$ is $\( 1 - t \)$ times the bottom block projection,
    and the $i$th summand is $\( 1 - t \)$ times the $i$th top block projection.
  Let
  $ j \( a \) = "diag" \( a ⊗ 1_p \, a \) $
  and define the boundary algebra
  $ B_p = { f in C \( \[ 0 \, 1 \] \, M_(p + 1) ⊗ M_p \) : f \( 0 \) in M_(p + 1) ⊗ 1_p \, med
    f \( 1 \) in j \( M_p \) } . $
  We claim that $A_a$ and $T$ generate $B_p$. First $A_1 + T^(*) T = 1$,
    and (13.4) gives the coordinate scalar function $t 1$. Thus their generated algebra contains
    $C \( \[ 0 \, 1 \] \) 1$. At $t = 1$ the generators have image $j \( M_p \)$.
    At $0 lt.eq t < 1$, the nonzero link $T \( t \)$, its adjoint,
    and the top matrix action yield all matrix units of $M_(p + 1) ⊗ 1_p$:
    the links $A_(e_(i 1)) \( t \) T \( t \)$ give the $i$th top-to-bottom units,
    and their products give all top-to-top units and the bottom projection.
    At $t = 0$ these are exactly the prescribed fiber. When $0 < t < 1$,
    compression of $A_a \( t \)$ to the bottom block and division by the scalar $t$ gives the full bottom copy of
    $M_p$. Multiplying by the preceding matrix units gives all of $M_(p + 1) ⊗ M_p$ in that fiber.
  Fiber generation and the scalar functions prove the claim in norm.
    More explicitly, for $f in B_p$ and $epsilon > 0$, at each $t$ choose an element $g_t$ of the generated
    algebra whose value at $t$ agrees with $f \( t \)$, or is within $epsilon \/ 2$ of it.
    Continuity gives an open neighborhood on which $parallel g_t - f parallel < epsilon$.
    A finite subcover and a subordinate scalar partition of unity produce an element of the generated algebra
    within $epsilon$ of $f$ on the whole interval.
  The representation $j$ of $M_p$ has multiplicity $p + 1$,
    so some unitary $V in M_(p + 1) ⊗ M_p$ conjugates $j \( M_p \)$ onto $1_(p + 1) ⊗ M_p$.
    The finite-dimensional unitary group is path connected; choose a unitary path $V \( t \)$ from $1$ to $V$.
    Conjugation by this path changes only the endpoint presentation:
    the boundary algebra becomes the one with fibers $M_(p + 1) ⊗ 1_p$ at $0$ and $1_(p + 1) ⊗ M_p$ at $1$.
    Reversing the interval and interchanging the tensor legs identifies it with $I \( p \, p + 1 \)$.
  #emph[Arbitrary representations of the relations.] We have identified the algebra generated by the model.
    To obtain the asserted map into $B$, we now show that every pair $\( alpha \, s \)$ in the statement gives a
    representation of that algebra. Represent $B$ faithfully and unitally on a Hilbert space $H$.
    The order-zero structure theorem gives a supporting representation $rho : M_p arrow.r cal(B) \( H \)$,
    with unit the support projection of $h = alpha \( 1 \)$, such that $alpha \( a \) = h rho \( a \) =
    rho \( a \) h$. In the polar decomposition
  $ s = u \( 1 - h \)^(1 \/ 2) \, $
  the initial space of $u$ is $H_s = 1_(\[ 0 \, 1 \)) \( h \) H$.
    The equation $alpha \( e_11 \) s = s$ implies that $alpha \( e_11 \)$ is the identity on the closed range of
    $s$. Since $0 lt.eq alpha \( e_11 \) lt.eq h lt.eq 1$, both $h$ and $rho \( e_11 \)$ are the identity on this
    range. Thus $u$ is an isometry from $H_s$ into $1_({ 1 }) \( h \) rho \( e_11 \) H$.
  For $1 lt.eq i lt.eq p$ the subspaces $rho \( e_(i 1) \) u H_s$ are mutually orthogonal.
    Their direct sum $H_t$ reduces $rho$ and is identified with $bb(C)^p ⊗ H_s$ by the unitary sending $e_i ⊗
    zeta$ to $rho \( e_(i 1) \) u zeta$. On $H_t$ the weight is $1$ and the representation is $a ⊗ 1_(H_s)$.
    Since $H_t$ is contained in the $h = 1$ space, it is orthogonal to $H_s$. The orthogonal complement
  $ H_r = 1_({ 1 }) \( h \) H ⊖ H_t $
  reduces both generators: $s$ and $s^(*)$ vanish there, and $alpha$ acts there as the unital matrix
    representation $rho \|_(H_r)$. This summand is therefore obtained by evaluating $B_p$ at $1$.
  On $H_t xor H_s tilde.equiv bb(C)^(p + 1) ⊗ H_s$ the generators are precisely
  #[#set math.equation(numbering: n => "(13.5)")
   $ alpha \( a \) = mat(delim: "(", a ⊗ 1_(H_s), 0; 0, h_s rho_s \( a \)) \, wide s =
     e_(1 \, p + 1)^(\( p + 1 \)) ⊗ \( 1 - h_s \)^(1 \/ 2) \, $ <abs:arbitrary-representation>]
  where $h_s$ and $rho_s$ denote the source restrictions, with $rho_s = 0$ on $ker h_s$.
    Split $H_s$ as $H_0 xor H_(upright("mid"))$ according to the spectral sets ${ 0 }$ and $\( 0 \, 1 \)$.
    On $bb(C)^(p + 1) ⊗ H_0$, (13.5) is the amplification of evaluation at $0$:
    its bottom matrix action is zero and its link has coefficient $1$.
    On $H_(upright("mid"))$ the representation $rho_s$ is unital and commutes with $h_s$.
    Continuous functional calculus therefore gives a unital representation
  $ C \( \[ 0 \, 1 \] \) ⊗ M_p arrow.r cal(B) \( H_(upright("mid")) \) \, wide
    f ⊗ a mapsto f \( h_s \) rho_s \( a \) . $
  Amplifying by $M_(p + 1)$ and restricting to $B_p$ sends (13.2)–(13.2) to (13.5) on this summand.
    Together with the two endpoint representations this gives a unital representation of $B_p$ on all of $H$,
    sending its generators to $alpha \( a \)$ and $s$. Since these generators generate $B_p$,
    the image lies in the represented copy of $B$. The identification of $B_p$ with $I \( p \, p + 1 \)$ proves
    the assertion. ◻
]

=== 13.3 From prime blocks to a central copy of $cal(Z)$ <from-prime-blocks-to-a-central-copy-of-mathcal-z>

We use the standard structural properties of the Jiang–Su algebra.
  It is separable, unital, and nuclear, and is an injective unital inductive limit of prime dimension-drop blocks
  [19] Proposition 2.5 and its proof. It is also strongly self-absorbing [19] Theorems 7.6 and 8.7;
  see the framework in [33] and the later construction in [27].
  We next give the passage from the individual block maps to a homomorphism of the limit,
  since the block maps obtained above need not be compatible.

#thm([Lemma 13.2.])[
  #emph[If $r$ and $s$ are relatively prime, there is a unital homomorphism $I \( r \, s \) arrow.r
    I \( p \, p + 1 \)$ for some $p gt.eq 2$.]
] <abs:prime-block-map>

#proof[
  The congruences $p equiv 0 med \( mod med r \)$ and $p equiv -
    1 med \( mod med s \)$ have a simultaneous solution, and adding a sufficiently large multiple of $r
    s$ makes it at least $2$. Write $p = m r$, $p + 1 = n s$, and use the unital amplifications
  $ M_r arrow.r M_p \, quad a mapsto a ⊗ 1_m \, wide M_s arrow.r M_(p + 1) \, quad b mapsto b ⊗ 1_n . $
  Their tensor product, applied pointwise, sends the $0$ boundary $M_r ⊗ 1_s$ into $M_p ⊗
    1_(p + 1)$ and the $1$ boundary $1_r ⊗ M_s$ into $1_p ⊗ M_(p + 1)$. ◻
]

The next lemma lets us approximately retract a finite subset of $cal(Z)$ into a sufficiently late stage.
  Composing the retraction with any homomorphism from that stage gives a completely positive map defined on all of
  $cal(Z)$. Approximation on the prescribed elements and their products makes this map approximately multiplicative.

#thm([Lemma 13.3.])[
  #emph[Let $D subset L$ be a unital inclusion with $D$ nuclear.
    Given a finite subset $G subset D$ and $epsilon > 0$, there is a c.p.c. map $R : L arrow.r
    D$ with $parallel R \( d \) - d parallel < epsilon$ for $d in G$.]
] <abs:approximate-retraction>

#proof[
  Choose a nuclear approximation $D arrow.r^theta M_k arrow.r^eta D$,
    with both maps completely positive and contractive, whose composition is within $epsilon$ of the identity on
    $G$. The matrix-valued extension theorem of Arveson [4] Theorem 1.2.3 extends $theta$ to a c.p.c. map
    $tilde(theta) : L arrow.r M_k$. Then $R = eta tilde(theta)$ has the stated properties.
    Applying the approximation also to $1_D$ makes $R \( 1_L \)$ as close to $1_D$ as desired;
    an exactly unital retraction is unnecessary. ◻
]

#thm([Proposition 13.4.])[
  #emph[Let $A$ be a nonzero separable nuclear $C^(*)$-algebra satisfying (C),
    and fix any free ultrafilter $omega$ on $bb(N)$. Then there is a unital homomorphism $cal(Z) arrow.r
    F_omega \( A \)$.]
] <prop:Z-map>

#proof[
  Realize $cal(Z)$ as the closure of an increasing sequence of its injectively included prime dimension-drop
    stages $D_l$. By Proposition 43 and Lemma 44, every $D_l$ has a unital homomorphism $chi_l : D_l arrow.r
    F_omega \( A \)$.
  Let $cal(Z)_0$ be a countable dense $*$-subalgebra over $bb(Q) + i bb(Q)$ containing $1$,
    and exhaust it by finite sets. For any finite set of contractions $F subset cal(Z)_0$ and any $epsilon > 0$,
    approximate $F union F^2 union { 1 }$ by one stage, and apply Lemma 45 to those stage approximants.
    With the errors chosen sufficiently small, the resulting c.p.c. map $R : cal(Z) arrow.r D_l$,
    viewed in $cal(Z)$, satisfies
  $ parallel R \( x \) - x parallel < epsilon quad \( x in F union F^2 union { 1 } \) . $
  Consequently, for $x \, y in F$,
  $ parallel R \( x y \) - R \( x \) R \( y \) parallel lt.eq parallel R \( x y \) - x y parallel + parallel x y -
    R \( x \) R \( y \) parallel < 3 epsilon . $
  Here the norm calculation takes place in $cal(Z)$, with $D_l$ included isometrically.
    Composing with $chi_l$ produces c.p.c. maps $beta_n : cal(Z) arrow.r F_omega \( A \)$ such that
  #[#set math.equation(numbering: n => "(13.6)")
   $ parallel beta_n \( x y \) - beta_n \( x \) beta_n \( y \) parallel arrow.r 0 \, wide
     parallel beta_n \( 1 \) - 1 parallel arrow.r 0 $ <abs:quotient-approximation>]
  for every $x \, y in cal(Z)_0$. Including successively larger scaled tests handles elements outside the unit ball.
  We now turn these approximate quotient relations into exact ones.
    Put $C_A = A_omega ∩ A'$, and let $q : C_A arrow.r F_omega \( A \)$ be the quotient map.
    By the nuclear completely positive lifting theorem of Choi–Effros [10] Theorem 3.10 and Corollary 3.11,
    each $beta_n$ has a c.p.c. lift $L_n : cal(Z) arrow.r C_A$.
    Regarding $L_n$ as a map into $A_omega$ and applying the same theorem to $ell^oo \( bb(N) \, A \) arrow.r
    A_omega$ gives a c.p.c. lift
  $ tilde(L)_n : cal(Z) arrow.r ell^oo \( bb(N) \, A \) \, wide
    tilde(L)_n \( x \) = \( L_(n \, k) \( x \) \)_(k gt.eq 1) . $
  Each coordinate map $L_(n \, k) : cal(Z) arrow.r A$ is completely positive and contractive,
    so all its values on each fixed test have a bound independent of $n$ and $k$.
  The relevant quotient norm errors are multiplied errors. If $d in C_A$ and $a in A$, then
  #[#set math.equation(numbering: n => "(13.7)")
   $ parallel d a parallel \, med parallel a d parallel lt.eq
     parallel q \( d \) parallel thin parallel a parallel . $ <abs:multiplied-quotient-norm>]
  Indeed, replacing $d$ by $d + j$ with $j in "Ann" \( A \)$ does not change either product,
    and taking the infimum over such $j$ gives the inequalities. Apply this to
  $ d = L_n \( x y \) - L_n \( x \) L_n \( y \) \, wide d = L_n \( 1 \) - e \, $
  where $e$ represents the unit as above. Equations (13.6) and (13.7) give errors tending to zero in $A_omega$
    after multiplication by each fixed $a in A$. Also $\[ L_n \( x \) \, a \] = 0$ exactly for every $n \, x \, a$.
  Choose a countable dense set ${ a_j }$ in $A$, and diagonalize over $cal(Z)_0$, its product tests,
    and these $a_j$. More explicitly, choose increasing row indices $m_l$ so that the first $l$ multiplied defects
    in row $m_l$ have ultrapower norm less than $2^(- l - 1)$.
    Their coordinate errors, together with the first $l$ commutator errors,
    are less than $2^(- l)$ on some set $E_l in omega$; replacing these sets by their successive finite
    intersections with ${ k gt.eq l }$ makes them decreasing.
    Let $l \( k \)$ be the largest $l lt.eq k$ with $k in E_l$, or zero when no such level exists.
    Put $gamma_k = L_(m_(l \( k \)) \, k)$ if $l \( k \) > 0$, and $gamma_k = 0$ otherwise.
    Then $l \( k \) arrow.r_omega oo$, and
  $ Gamma \( x \) = \[ \( gamma_k \( x \) \)_k \] $
  defines a c.p.c. map $Gamma : cal(Z) arrow.r A_omega ∩ A'$.
    The maps $gamma_k$ are linear and completely positive at every coordinate;
    no separate lifting of individual elements is involved. The diagonal conditions say
  $ \( Gamma \( x y \) - Gamma \( x \) Gamma \( y \) \) a = 0 \, wide \( Gamma \( 1 \) - e \) a =
    0 quad \( x \, y in cal(Z)_0 \, med a in A \) . $
  All the displayed defects are central relative to $A$, so they annihilate it on both sides.
    Passing through $q$ therefore gives multiplicativity and unitality on $cal(Z)_0$.
    Continuity extends these identities to $cal(Z)$ and proves the proposition. ◻
]

=== 13.4 Connected half-flip unitaries and their lifts <connected-half-flip-unitaries-and-their-lifts>

#thm([Lemma 13.5.])[
  #emph[The unitary groups of $cal(Z)$ and $cal(Z) ⊗ cal(Z)$ are path connected.
    If $q : D arrow.r D \/ J$ is a unital quotient map, every unitary in the identity component of
    $cal(U) \( D \/ J \)$ lifts to a unitary in $D$.]
] <abs:connected-unitaries>

#proof[
  We first check connectedness for a prime block $I \( r \, s \)$, with $gcd \( r \, s \) = 1$.
    A unitary is a continuous path in $U \( r s \)$ whose endpoints belong to
  $ H_0 = U \( r \) ⊗ 1_s \, wide H_1 = 1_r ⊗ U \( s \) . $
  Both endpoint groups are connected. Attach a path in $H_0$ from $1$ to the initial value and a path in $H_1$
    from the final value to $1$. Attaching these paths gradually, while reparametrizing the original path,
    is a homotopy through paths satisfying the same endpoint conditions.
    The result is a based loop in $U \( r s \)$. Changing the attached $H_0$ path by an endpoint loop changes its
    determinant winding by an arbitrary multiple of $s$; changing the $H_1$ path changes it by an arbitrary
    multiple of $r$. Bezout’s identity therefore permits choices for which the total winding is zero.
    The determinant identifies $pi_1 \( U \( r s \) \)$ with $bb(Z)$,
    so this loop contracts with its basepoint fixed. That contraction retains endpoint value $1$,
    and hence remains in the prime block. Thus every unitary of $I \( r \, s \)$ is connected to $1$.
  For a unitary in the injective unital inductive limit $cal(Z)$, choose a sufficiently close element of a stage.
    Its two unitary defects are small, so its polar part is a unitary in the same stage and is still close to the
    original unitary. Two unitaries of distance less than $1$ are joined by the logarithm path for their quotient.
    Connectedness of the stage unitary group proves connectedness of $cal(U) \( cal(Z) \)$.
    Strong self-absorption gives an isomorphism $cal(Z) ⊗ cal(Z) tilde.equiv cal(Z)$,
    proving the same assertion for the tensor square.
  Finally, a unitary $v$ connected to $1$ in $D \/ J$ is a finite product of exponentials of selfadjoints.
    To see this, subdivide a continuous unitary path finely enough that consecutive values differ by less than
    $1$, and take a selfadjoint logarithm of each consecutive quotient.
    Lift these finitely many selfadjoints through $q$ and multiply their exponentials in $D$.
    The resulting unitary lifts $v$. ◻
]

#thm([Lemma 13.6.])[
  #emph[Let $A$ be a separable $C^(*)$-algebra, and suppose there is a unital homomorphism $phi : cal(Z) arrow.r
    F_omega \( A \)$. For finite sets $F subset A$, $G subset A ⊗ cal(Z)$, and $epsilon > 0$,
    there is a unitary $u in A^tilde.op ⊗ cal(Z)$ such that
#[#set math.equation(numbering: n => "(13.8)")
 $ parallel \[ u \, a ⊗ 1 \] parallel < epsilon quad \( a in F \) \, wide
   "dist" \( u^(*) b u \, A ⊗ 1 \) < epsilon quad \( b in G \) . $ <abs:unitary-criterion>]

]
] <abs:finite-unitary-criterion>

#proof[
  Write $D = A^tilde.op ⊗ cal(Z)$ and $A_1 = A ⊗ 1$, and form the unital algebra and its annihilator quotient
  $ C_D = D_omega ∩ A'_1 \, wide Q = C_D \/ "Ann"_(D_omega) \( A_1 \) . $
  First-factor sequences give a homomorphism $F_omega \( A \) arrow.r Q$:
    centrality and annihilation are both preserved by tensoring with $1$.
    This homomorphism is unital, since the approximate-unit representative $e ⊗
    1$ differs from $1_(D_omega)$ by an annihilator of $A_1$.
    Its composition with $phi$ is a unital map $phi_1 : cal(Z) arrow.r
    Q$ and commutes with the constant second-factor map $phi_2 \( z \) = 1 ⊗ z + "Ann" \( A_1 \)$.
    Because $cal(Z)$ is nuclear, these two maps give a unital homomorphism
  $ Theta : cal(Z) ⊗ cal(Z) arrow.r Q \, wide Theta \( z ⊗ z' \) = phi_1 \( z \) phi_2 \( z' \) . $
  The approximately inner half-flip of the strongly self-absorbing algebra $cal(Z)$ [33] Proposition 1.5 says
    that, for a finite set $H subset cal(Z)$ and $delta > 0$, there is a unitary $V in cal(Z) ⊗ cal(Z)$ with
  #[#set math.equation(numbering: n => "(13.9)")
   $ parallel V^(*) \( 1 ⊗ z \) V - z ⊗ 1 parallel < delta quad \( z in H \) . $ <abs:half-flip>]
  By Lemma 47, $V$ is connected to $1$. Thus $Theta \( V \)$ is connected to $1$ in $Q$,
    and the same lemma lifts it to a unitary $W in C_D$.
  This unitary has a representing sequence of actual unitaries in $D$.
    Indeed choose bounded representatives $x_k$. Since $W$ is unitary, both $parallel x_k^(*) x_k -
    1 parallel$ and $parallel x_k x_k^(*) - 1 parallel$ tend to zero along $omega$.
    On a good set both are less than $1 \/ 2$, and the polar parts $u_k =
    x_k \( x_k^(*) x_k \)^(- 1 \/ 2)$ are unitaries with $parallel u_k - x_k parallel arrow.r_omega 0$.
    Put $u_k = 1$ on the remaining coordinates. Then $W = \[ \( u_k \) \]$, and $W in C_D$ gives
  #[#set math.equation(numbering: n => "(13.10)")
   $ parallel \[ u_k \, a ⊗ 1 \] parallel arrow.r_omega 0 quad \( a in A \) . $ <abs:lift-centrality>]
  For each $z in H$ choose a lift $c_z in A_omega ∩ A'$ of $phi \( z \)$;
    a single c.p.c. lift of $phi$ is available by Choi–Effros lifting,
    so these lifts may satisfy $parallel c_z parallel lt.eq parallel z parallel$. In $C_D$ the difference
  $ d_z = W^(*) \( 1 ⊗ z \) W - c_z ⊗ 1 $
  has quotient norm less than $delta$ by (13.9). The analogue of (13.7) gives
  $ parallel \( a ⊗ 1 \) d_z parallel lt.eq delta parallel a parallel . $
  Since $W$ commutes with $a ⊗ 1$ in the ultrapower, this is the concrete norm estimate
  #[#set math.equation(numbering: n => "(13.11)")
   $ parallel W^(*) \( a ⊗ z \) W - \( a c_z \) ⊗ 1 parallel lt.eq
     delta parallel a parallel . $ <abs:half-flip-multiplied>]
  Here $\( a c_z \) ⊗ 1$ is represented by a first-factor sequence $\( a c_(z \, k) \) ⊗ 1$,
    with $a c_(z \, k) in A$. Thus no estimate in an annihilator quotient is being used as an unmultiplied
    estimate in a norm ultrapower.
  For finitely many elementary tensors, choose one coordinate where (13.10) and (13.11) all have the desired
    accuracy. This gives (13.8) for those tensors. For a general finite $G$,
    approximate each of its elements by a finite sum of elementary tensors,
    include all the corresponding second factors in $H$, and choose $delta$ small enough for the finite sums of
    the bounds $delta parallel a parallel$. Unitary conjugation preserves the initial approximation errors,
    so the same conclusion holds for $G$. ◻
]

=== 13.5 The final intertwining <the-final-intertwining>

The construction of the central map used nuclearity and condition (C).
  The implication from that map to absorption requires only separability, as the following proposition makes explicit.

#thm([Proposition 13.7.])[
  #emph[If a separable $C^(*)$-algebra $A$ admits a unital homomorphism $cal(Z) arrow.r F_omega \( A \)$,
    then $A tilde.equiv A ⊗ cal(Z)$.]
] <prop:absorption>

#proof[
  The zero algebra is immediate, so assume $A eq.not 0$. Set $B = A ⊗ cal(Z)$ and let $iota \( a \) = a ⊗ 1$.
    The algebra $A^tilde.op ⊗ cal(Z)$ acts by multipliers on its ideal $B$,
    so all the unitaries in Lemma 48 act as automorphisms of $B$ by conjugation.
  Choose sequences $\( a_j \)$ and $\( b_j \)$ dense in $A$ and $B$, respectively, and put $epsilon_n = 2^(- n)$.
    We construct products of multiplier unitaries $U_n$ and embeddings $iota_n = "Ad" \( U_n \) compose
    iota$ as follows. Start with $U_0 = 1$. Before step $n$, let $F_n$ be a finite subset of $A$ containing
    $a_1 \, dots.h \, a_n$ and all elements $c_(k \, j)$ chosen at earlier steps $k < n$, $1 lt.eq j lt.eq k$.
    Apply Lemma 48 with these domain tests and the finite target set
  $ { U_(n - 1)^(*) b_j U_(n - 1) : 1 lt.eq j lt.eq n } . $
  Obtain $u_n$ with errors less than $epsilon_n$, and put $U_n = U_(n - 1) u_n$. The commutator estimate gives
  #[#set math.equation(numbering: n => "(13.12)")
   $ parallel iota_n \( a \) - iota_(n - 1) \( a \) parallel < epsilon_n quad \( a in F_n \) \,
     $ <abs:successive-embeddings>]
  and the range estimate gives elements $c_(n \, j) in A$ with
  #[#set math.equation(numbering: n => "(13.13)")
   $ parallel iota_n \( c_(n \, j) \) - b_j parallel < epsilon_n quad \( 1 lt.eq j lt.eq n \) .
     $ <abs:stored-preimages>]
  Store these finitely many preimages in every subsequent $F_m$. They are legitimate finite norm tests:
    each has finite norm, indeed $parallel c_(n \, j) parallel < parallel b_j parallel + epsilon_n$,
    because $iota_n$ is isometric.
  For each dense domain element $a_j$, equation (13.12) holds at every step $n gt.eq j$.
    Summability of $\( epsilon_n \)$ gives convergence of $iota_n \( a_j \)$.
    As all $iota_n$ are isometric, approximation by the dense set extends this to point-norm convergence on $A$.
    The limit $Phi : A arrow.r B$ is a homomorphism by continuity of multiplication and adjoints,
    and it is isometric since $parallel Phi \( a \) parallel = lim_n parallel iota_n \( a \) parallel =
    parallel a parallel$.
  Fix $j$ and take any $n gt.eq j$. The stored preimage $c_(n \, j)$ belongs to every $F_m$ with $m > n$, so
  $ parallel Phi \( c_(n \, j) \) - b_j parallel lt.eq epsilon_n + sum_(m > n) epsilon_m = 2^(1 - n) . $
  Letting $n arrow.r oo$ shows that every $b_j$ is in the closure of $Phi \( A \)$.
    The range of an isometric homomorphism is closed, and the $b_j$ are dense, so $Phi \( A \) = B$.
    This proves the desired isomorphism. ◻
]

== 14 Assembly of the absorption theorems <sec:assembly>

The preceding construction has used separability, nuclearity, and condition (C),
  rather than the canonical-map hypothesis. We now apply it to the comparison and Cuntz-semigroup criteria in the
  introduction.

#proof[
  Fix the free ultrafilter in the theorem. Proposition 46, through the support, norm-cone, tracial-cone,
    comparison, and packing constructions above, supplies a unital $*$-homomorphism $cal(Z) arrow.r
    F_omega \( A \)$. Proposition 49 then gives $A tilde.equiv A ⊗_min cal(Z)$. ◻
]

#proof[
  The zero algebra, if admitted by the convention for simplicity, is immediate.
    Nuclearity implies exactness, so Corollary 12 shows that $A$ satisfies condition (C).
    Theorem 2 then gives $A tilde.equiv A ⊗_min cal(Z)$. ◻
]

#proof[
  Again the zero algebra is immediate. Lemma 15 derives (C) from the canonical induced map
    $upright("Cu") \( iota \)$, using that $upright("Cu") \( iota \) \( \[ b \] \) = \[ b ⊗ 1_(cal(Z)) \]$.
    Theorem 2 then proves the assertion. ◻
]

#proof[
  The forward implication follows from functoriality of $upright("Cu")$ under $*$-isomorphisms.
    For the converse, let $Phi : upright("Cu") \( A \) arrow.r
    upright("Cu") \( A ⊗_min cal(Z) \)$ be an abstract isomorphism.
    The case $A = 0$ is immediate, so put $D = A ⊗_min cal(Z)$ and suppose $A eq.not 0$.
    Then $D$ is nonzero, separable, and nuclear.
  Strong self-absorption of $cal(Z)$ supplies an isomorphism $phi : cal(Z) arrow.r
    cal(Z) ⊗ cal(Z)$ approximately unitarily equivalent to $z mapsto z ⊗
    1_(cal(Z))$ [33] Definition 1.3(iv) and Example 1.14(iv).
    Consequently $"id"_A ⊗ phi : D arrow.r D ⊗ cal(Z)$ is an isomorphism approximately unitarily equivalent to the
    first-factor map $j_D \( d \) = d ⊗ 1_(cal(Z))$. This also holds when $A$ is nonunital:
    if $u_n in cal(Z) ⊗ cal(Z)$ are the implementing unitaries,
    then $1_(M \( A \)) ⊗ u_n in M \( A ⊗ cal(Z) ⊗ cal(Z) \)$ implement the equivalence,
    first on elementary tensors and then on all of $D$ by density.
  Approximately unitarily equivalent homomorphisms induce the same map on $upright("Cu")$.
    Indeed, after stabilization, norm approximation by unitary conjugates gives comparison of every positive cut
    of either image with the other image, by Lemma 5(1); approximate units place the comparison witnesses in the
    algebra when the conjugating unitaries are multipliers. Taking the suprema of cuts in Equation (2.1) gives
    equality of the two Cuntz classes. Thus $upright("Cu") \( j_D \) =
    upright("Cu") \( "id"_A ⊗ phi \)$ is an isomorphism. Lemma 15, applied to $D$,
    gives condition (C) on $upright("Cu") \( D \)$. Both almost unperforation and the full almost-divisibility
    sandwich are intrinsic ordered-semigroup properties, so $Phi$ transports them to $upright("Cu") \( A \)$.
    Theorem 2 now gives $A tilde.equiv A ⊗_min cal(Z)$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[C.~A.~Akemann, J.~Anderson, and G.~K.~Pedersen, #emph[Excising states of $C^(*)$-algebras], Canad.
  J. Math. #strong[38] (1986), no.~5, 1239--1260.
  #link("https://doi.org/10.4153/CJM-1986-063-7")[doi:10.4153/CJM-1986-063-7].]
#bibitem([2])[R.~Antoine, F.~Perera, and H.~Thiel, #emph[Tensor products and regularity properties of Cuntz
  semigroups], Mem. Amer. Math. Soc. #strong[251] (2018), no.~1199, viii+191 pp.
  #link("https://doi.org/10.1090/memo/1199")[doi:10.1090/memo/1199].]
#bibitem([3])[R.~Antoine, F.~Perera, H.~Thiel, and E.~Vilalta, #emph[Pure $C^(*)$-algebras],
  #link("https://arxiv.org/abs/2406.11052v3")[arXiv:2406.11052v3] (2024).]
#bibitem([4])[W.~B.~Arveson, #emph[Subalgebras of $C^(*)$-algebras], Acta Math. #strong[123] (1969), 141--224.
  #link("https://doi.org/10.1007/BF02392388")[doi:10.1007/BF02392388].]
#bibitem([5])[B.~Blackadar and D.~Handelman, #emph[Dimension functions and traces on $C^(*)$-algebras], J. Funct.
  Anal. #strong[45] (1982), no.~3, 297--340.
  #link("https://doi.org/10.1016/0022-1236(82)90009-X")[doi:10.1016/0022-1236(82)90009-X].]
#bibitem([6])[N.~P.~Brown, J.~R.~Carrión, and S.~White, #emph[Decomposable approximations revisited],
  in #emph[Operator Algebras and Applications: The Abel Symposium 2015], Abel Symposia #strong[12],
  Springer, 2016. #link("https://doi.org/10.1007/978-3-319-39286-8_2")[doi:10.1007/978-3-319-39286-8\_2].
  #link("https://arxiv.org/abs/1602.00021v4")[arXiv:1602.00021v4] (revised 2017).]
#bibitem([7])[N.~P.~Brown, F.~Perera, and A.~S.~Toms, #emph[The Cuntz semigroup, the Elliott conjecture,
  and dimension functions on $C^(*)$-algebras], J. Reine Angew. Math. #strong[621] (2008), 191--211.
  #link("https://arxiv.org/abs/math/0609182v2")[arXiv:math/0609182v2].]
#bibitem([8])[J.~Castillejos, S.~Evington, A.~Tikuisis, and S.~White, #emph[Uniform property $Gamma$], Int. Math.
  Res. Not. #strong[2022] (2022), no.~13, 9864--9908.
  #link("https://doi.org/10.1093/imrn/rnaa282")[doi:10.1093/imrn/rnaa282].]
#bibitem([9])[J.~Castillejos, S.~Evington, A.~Tikuisis, S.~White, and W.~Winter,
  #emph[Nuclear dimension of simple $C^(*)$-algebras], Invent. Math. #strong[224] (2021), no.~1, 245--290.
  #link("https://doi.org/10.1007/s00222-020-01013-1")[doi:10.1007/s00222-020-01013-1].]
#bibitem([10])[M.-D.~Choi and E.~G.~Effros, #emph[The completely positive lifting problem for $C^(*)$-algebras],
  Ann. of Math. (2) #strong[104] (1976), no.~3, 585--609.
  #link("https://annals.math.princeton.edu/1976/104-3/p08")[Publisher record].]
#bibitem([11])[M.-D.~Choi and E.~G.~Effros, #emph[Nuclear $C^(*)$-algebras and injectivity:
  The general case], Indiana Univ. Math. J. #strong[26] (1977), no.~3, 443--446.
  #link("https://doi.org/10.1512/iumj.1977.26.26034")[doi:10.1512/iumj.1977.26.26034].]
#bibitem([12])[K.~T.~Coward, G.~A.~Elliott, and C.~Ivanescu,
  #emph[The Cuntz semigroup as an invariant for $C^(*)$-algebras], J. Reine Angew. Math.
  #strong[623] (2008), 161--193. #link("https://arxiv.org/abs/0705.0341")[arXiv:0705.0341].]
#bibitem([13])[J.~Cuntz, #emph[Dimension functions on simple $C^(*)$-algebras], Math. Ann.
  #strong[233] (1978), no.~2, 145--153. #link("https://doi.org/10.1007/BF01421922")[doi:10.1007/BF01421922].]
#bibitem([14])[M.~Dadarlat and A.~S.~Toms, #emph[Ranks of operators in simple $C^(*)$-algebras], J. Funct. Anal.
  #strong[259] (2010), no.~5, 1209--1229.
  #link("https://doi.org/10.1016/j.jfa.2010.03.022")[doi:10.1016/j.jfa.2010.03.022].]
#bibitem([15])[G.~A.~Elliott, L.~Robert, and L.~Santiago,
  #emph[The cone of lower semicontinuous traces on a $C^(*)$-algebra], Amer. J. Math.
  #strong[133] (2011), no.~4, 969--1005. #link("https://arxiv.org/abs/0805.3122v2")[arXiv:0805.3122v2].]
#bibitem([16])[J.~Gabe, #emph[A new proof of Kirchberg's $cal(O)_2$-stable classification], J. Reine Angew. Math.
  #strong[761] (2020), 247--289. #link("https://arxiv.org/abs/1706.03690v2")[arXiv:1706.03690v2].]
#bibitem([17])[U.~Haagerup, #emph[Quasitraces on exact $C^(*)$-algebras are traces], C. R. Math. Rep. Acad. Sci.
  Canada #strong[36] (2014), nos.~2--3, 67--92. #link("https://arxiv.org/abs/1403.7653")[arXiv:1403.7653].]
#bibitem([18])[I.~Hirshberg, E.~Kirchberg, and S.~White, #emph[Decomposable approximations of nuclear
  $C^(*)$-algebras], Adv. Math. #strong[230] (2012), no.~3, 1029--1039.
  #link("https://doi.org/10.1016/j.aim.2012.03.028")[doi:10.1016/j.aim.2012.03.028].]
#bibitem([19])[X.~Jiang and H.~Su, #emph[On a simple unital projectionless $C^(*)$-algebra], Amer. J. Math.
  #strong[121] (1999), no.~2, 359--413. #link("https://doi.org/10.1353/ajm.1999.0012")[doi:10.1353/ajm.1999.0012].]
#bibitem([20])[R.~V.~Kadison, #emph[Irreducible operator algebras], Proc. Natl. Acad. Sci. U.S.A.
  #strong[43] (1957), no.~3, 273--276. #link("https://doi.org/10.1073/pnas.43.3.273")[doi:10.1073/pnas.43.3.273].]
#bibitem([21])[E.~Kirchberg and M.~Rørdam, #emph[Central sequence $C^(*)$-algebras and tensorial absorption of the
  Jiang--Su algebra], J. Reine Angew. Math. #strong[695] (2014), 175--214; erratum, ibid., 215--216.
  #link("https://doi.org/10.1515/crelle-2012-0118")[doi:10.1515/crelle-2012-0118].]
#bibitem([22])[H.~Matui and Y.~Sato, #emph[Strict comparison and $cal(Z)$-absorption of nuclear $C^(*)$-algebras],
  Acta Math. #strong[209] (2012), no.~1, 179--196.
  #link("https://doi.org/10.1007/s11511-012-0084-4")[doi:10.1007/s11511-012-0084-4].]
#bibitem([23])[N.~Nawata, #emph[Picard groups of certain stably projectionless $C^(*)$-algebras], J. Lond. Math.
  Soc. (2) #strong[88] (2013), no.~1, 161--180. #link("https://doi.org/10.1112/jlms/jdt013")[doi:10.1112/jlms/jdt013].]
#bibitem([24])[F.~Perera, H.~Thiel, and E.~Vilalta, #emph[Centrally pure $C^(*)$-algebras],
  #link("https://arxiv.org/abs/2512.17261v1")[arXiv:2512.17261v1] (2025).]
#bibitem([25])[L.~Robert and A.~Tikuisis, #emph[Nuclear dimension and $cal(Z)$-stability of non-simple
  $C^(*)$-algebras], Trans. Amer. Math. Soc. #strong[369] (2017), no.~7, 4631--4670.
  #link("https://arxiv.org/abs/1308.2941v2")[arXiv:1308.2941v2].]
#bibitem([26])[M.~Rørdam, #emph[The stable and the real rank of $cal(Z)$-absorbing $C^(*)$-algebras], Internat. J.
  Math. #strong[15] (2004), no.~10, 1065--1084. #link("https://arxiv.org/abs/math/0408020v2")[arXiv:math/0408020v2].]
#bibitem([27])[M.~Rørdam and W.~Winter, #emph[The Jiang--Su algebra revisited], J. Reine Angew. Math.
  #strong[642] (2010), 129--155. #link("https://arxiv.org/abs/0801.2259")[arXiv:0801.2259].]
#bibitem([28])[Y.~Sato, #emph[The Rohlin property for automorphisms of the Jiang--Su algebra], J. Funct. Anal.
  #strong[259] (2010), no.~2, 453--476.
  #link("https://doi.org/10.1016/j.jfa.2010.04.006")[doi:10.1016/j.jfa.2010.04.006].]
#bibitem([29])[Y.~Sato, #emph[Trace spaces of simple nuclear $C^(*)$-algebras with finite-dimensional extreme
  boundary], #link("https://arxiv.org/abs/1209.3000")[arXiv:1209.3000] (2012).]
#bibitem([30])[C.~Schafhauser, A.~Tikuisis, and S.~White, #emph[Nuclear $C^(*)$-algebras:
  99 problems], #link("https://arxiv.org/abs/2506.10902v2")[arXiv:2506.10902v2] (2025; version 2, 2026).]
#bibitem([31])[H.~Thiel, #emph[Ranks of operators in simple $C^(*)$-algebras with stable rank one], Comm. Math.
  Phys. #strong[377] (2020), 37--76. #link("https://arxiv.org/abs/1711.04721v3")[arXiv:1711.04721v3].]
#bibitem([32])[A.~S.~Toms, S.~White, and W.~Winter, #emph[$cal(Z)$-stability and finite-dimensional tracial
  boundaries], Int. Math. Res. Not. #strong[2015] (2015), no.~10, 2702--2727.
  #link("https://doi.org/10.1093/imrn/rnu001")[doi:10.1093/imrn/rnu001].]
#bibitem([33])[A.~S.~Toms and W.~Winter, #emph[Strongly self-absorbing $C^(*)$-algebras], Trans. Amer. Math. Soc.
  #strong[359] (2007), no.~8, 3999--4029. #link("https://arxiv.org/abs/math/0502211v2")[arXiv:math/0502211v2].]
#bibitem([34])[W.~Winter, #emph[Nuclear dimension and $cal(Z)$-stability of pure $C^(*)$-algebras], Invent. Math.
  #strong[187] (2012), no.~2, 259--342.
  #link("https://doi.org/10.1007/s00222-011-0334-7")[doi:10.1007/s00222-011-0334-7].
  #link("https://arxiv.org/abs/1006.2731v2")[arXiv:1006.2731v2].]
#bibitem([35])[W.~Winter and J.~Zacharias, #emph[Completely positive maps of order zero], Münster J. Math.
  #strong[2] (2009), 311--324. #link("https://arxiv.org/abs/0903.3290")[arXiv:0903.3290].]
