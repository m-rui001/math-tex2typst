#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Irrational cubic fourfolds \
with geometric K3 categories]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A smooth cubic fourfold $X subset upright(bold(P))_(bb(C))^5$ is rational if its field of rational functions is a purely transcendental extension of $bb(C)$ of transcendence degree four. The connection between this birational question and K3 surfaces appears both in the middle cohomology and in the derived category. We prove that both connections can hold for the same irrational cubic.

The geometric connection grew out of explicit rationality constructions. Cubics containing quartic rational scrolls were studied by Fano #cite(label("Fano43")) p. 72; Tregub gave constructions using two disjoint planes, quintic del Pezzo surfaces, and quartic scrolls #cite(label("Tregub84")) Sections 2–4. Beauville and Donagi proved that the Fano variety $F \( X \)$, which parametrizes lines on $X$, is irreducible holomorphic symplectic. For sufficiently general Pfaffian cubics they identified $F \( X \)$ with $S^(\[ 2 \])$, the variety of length-two subschemes of a K3 surface $S$, and proved that the cubic is rational #cite(label("BeauvilleDonagi85")) Propositions 1–2 and 5. Hassett constructed further rational cubics containing a plane; in those parametrizations a family of exceptional lines is parametrized by a surface birational to a K3 surface #cite(label("Hassett99")) Theorem 4.2 and Proposition 5.1.

The Kuznetsov component of $X$ is the full triangulated subcategory

$ "Ku" \( X \) = { F in D^b \( "Coh" X \) : "Hom" \( cal(O)_X \( i \) \, F \[ k \] \) = 0 upright(" for ") 0 lt.eq i lt.eq 2 upright(" and ") k in bb(Z) #scale(x: 120%, y: 120%)[}] . $

It gives the semiorthogonal decomposition

$ D^b \( "Coh" X \) = chevron.l "Ku" \( X \) \, cal(O)_X \, cal(O)_X \( 1 \) \, cal(O)_X \( 2 \) chevron.r . $

Kuznetsov’s rationality conjecture asserts that $X$ is rational if and only if $"Ku" \( X \)$ is equivalent to the derived category of a projective K3 surface #cite(label("Kuznetsov10")) Conjecture 1.1. Here rationality means birationality over $bb(C)$ with $upright(bold(P))^4$, and the K3 equivalence in this statement means an exact $bb(C)$-linear equivalence with the ordinary category $D^b \( "Coh" S \)$. The target has no Brauer twisting.

Let $cal(C)$ denote the moduli space of smooth complex cubic fourfolds. Write $h = c_1 \( cal(O)_X \( 1 \) \)$. A #emph[labelling of discriminant $d$] is a saturated positive-definite rank-two sublattice

$ K subset H^4 \( X \, bb(Z) \) ∩ H^(2 \, 2) \( X \) $

containing $h^2$, with $det K = d$. The corresponding Hassett locus is denoted by $cal(C)_d$. We call an integer $d$ #emph[admissible] if

#[#set math.equation(numbering: n => "(1.1)")
 $ d > 6 \, #h(2em) d equiv 0 \, 2 med \( mod med 6 \) \, #h(2em) 4 divides.not d \, quad 9 divides.not d \, quad p divides.not d med upright("for every odd prime ") p equiv 2 med \( mod med 3 \) . $ <cub:admissible>]

Hassett’s period and lattice theorems make $cal(C)_d$ a nonempty irreducible divisor for these discriminants and give its associated polarized K3 surfaces #cite(label("Hassett00")) Theorems 1.0.1 and 1.0.2. Here an associated K3 surface has a primitive polarization $L$ of degree $d$ and an integral Hodge isometry $K^perp tilde.eq L^perp \( - 1 \)$, where the surface cup pairing is reversed.

Kuznetsov verified the categorical prediction for smooth Pfaffian cubics #cite(label("Kuznetsov10")) Theorem 3.1. Addington and Thomas proved that the Hodge-theoretic and categorical K3 associations agree on a dense open subset of each admissible divisor #cite(label("AddingtonThomas14")) Theorem 1.1. The construction of stability conditions by Bayer, Lahoz, Macrì and Stellari #cite(label("BLMS23")) Theorem 1.2, together with the theory in families of Bayer, Lahoz, Macrì, Nuer, Perry and Stellari, gives an ordinary K3 derived category for every cubic having an associated K3 surface #cite(label("BLMPNS21")) Corollary 29.7. These results supply the categorical assertion below; the irrationality assertion is proved here.

Our main result disproves the categorical-to-rational implication of Kuznetsov’s conjecture on every sufficiently large admissible divisor.

#thm([Theorem 1.1.])[
  (Irrationality on large admissible Hassett divisors).  #emph[There is an integer $d_0$ such that, for every admissible $d > d_0$, a very general cubic fourfold $X$ in $cal(C)_d$ is irrational and admits an exact $bb(C)$-linear equivalence 
$ "Ku" \( X \) tilde.eq D^b \( "Coh" S \) $

 for a smooth projective K3 surface $S$.]
] <thm:main>

The threshold $d_0$ is ineffective. Some Hassett divisors consist entirely of rational cubics: Russo and Staglianò proved rationality throughout $cal(C)_26$ and $cal(C)_38$ using congruences of five-secant conics #cite(label("RussoStagliano19")) Theorems 4 and 7, and throughout $cal(C)_42$ using trisecant flops #cite(label("RussoStagliano23")) Theorem 5.12. Here “very general” means outside a countable union of proper closed algebraic subsets separately in each divisor $cal(C)_d$. This qualification matters: Yang and Yu construct rational subloci of codimension two in the full moduli space inside every Hassett divisor #cite(label("YangYu20")) Theorem 9.

=== 1.1 The two evaluations of one divisorial invariant <the-two-evaluations-of-one-divisorial-invariant>

Write $T_X$ for the integral lattice orthogonal to the integral Hodge classes in $H^4 \( X \, bb(Z) \)$, with its cup-product pairing, and put $d = \| det T_X \|$. The irrationality argument concerns cubics with $"rank" T_X = 21$, $d > 2$, and $"End"_(upright("Hdg")) \( T_X ⊗ bb(Q) \) = bb(Q)$. Suppose such an $X$ were rational, and choose a birational map $f : upright(bold(P))^4 arrow.r.dashed X$. We use one fixed collection $cal(S)$ of Picard-number-one K3 surfaces: those whose entire integral transcendental Hodge lattice, after shifting Hodge types by $\( 1 \, 1 \)$ and reversing the pairing, is isometric to $T_X$. The lattice hypotheses imply that these surfaces have primitive ample degree $d$ and trivial automorphism group (Lemma 18). We do not assume that this collection is nonempty: the hypothetical birational map will force a member of it.

The maximal rationally connected (MRC) quotient of a smooth projective variety is the base of its birationally determined rational fibration with rationally connected general fibres and non-uniruled base. For an integral variety $E$, let $u \( E \)$ be one if the MRC quotient of a smooth projective model of its function field is birational to a member of $cal(S)$, and zero otherwise. Section 2 defines $c_u \( f \)$ by counting the prime divisors acquired by the target with positive sign and those lost from the source with negative sign, each weighted by $u$. The count is finite and additive under composition. We evaluate this same invariant in two ways.

Smooth weak factorization expresses $f$ as blowups and blowdowns along smooth centers. Only surface centers can have nonzero test. Classically, a surface blowup adds its whole transcendental lattice, shifted to weight four with reversed pairing, as an integral orthogonal summand. The difficulty is to recognize that same summand on blowdown. Section 3 uses genus-zero Gromov–Witten pairings with two variable transcendental inputs and all remaining insertions rational of diagonal Hodge type. For an intermediate fourfold $M$, define $T_M$ as for $X$. Each such pairing $B \( a \, b \)$ determines an operator $A_B$ by $B \( a \, b \) = q_M \( A_B a \, b \)$, where $q_M$ is the cup form on $T_M ⊗ bb(Q)$. The algebra generated by these operators has a separate scalar factor on each whole surface contribution. Its projectors force a later blowdown to remove a whole block. Intersecting that rational block with the ambient integral lattice recovers its entire integral lattice, so cancellation preserves the exact test class. Every nonzero block has a nonzero $\( 3 \, 1 \)$ part, so $h^(3 \, 1) \( X \) = 1$ leaves one block in the final transcendental lattice. Rank $21$ makes its surface center birational to a Picard-number-one K3 surface, and its discriminant fixes the degree $d$. Thus one more member of the class $cal(S)$ is added than removed, and Proposition 19 gives $c_u \( f \) = 1$.

The Sarkisov factorization passes through Mori fibre spaces: contractions $V arrow.r B$ with terminal $bb(Q)$-factorial projective fourfold $V$, $dim B < 4$, relative Picard number one, and relatively ample $- K_V$. These are the nodes of the factorization. An elementary birational transformation between nodes is a link; its endpoint bases map to a common base $Q$. The bases can change along the path. Sections 4–6 construct integer-valued functions $v \, s$ on the nodes and prove, for sufficiently large $d$,

$ c_u \( upright("link") \) = \( v + s \) \( V' \/ B' \) - \( v + s \) \( V \/ B \) . $

The value $v \( V \/ B \)$ is the finite cancelled difference between the tests of vertical divisors on $V$ and divisors on $B$. The value $s$ comes from the remaining generic-surface calculation.

At a conic-bundle node, the base field $L = bb(C) \( B \)$ has transcendence degree three. For a surface subfield $k subset L$ arising from a link, $L$ is the function field of a genus-zero curve over $k$. The surface calculation then gives a candidate for $s$, using the test on finite residue fields and covers determined by the conic’s Brauer ramification. The crucial point is that the candidates agree for every such presentation with the ramification bound supplied by the links. A second Sarkisov factorization, now on the threefold bases, compares these presentations. Bounded diagrams with their branch loci recorded give genus bounds incompatible with pencils on Picard-number-one K3 surfaces of sufficiently large degree. This proves independence with one bound for all test subcollections and factorizations. At nodes over a point both corrections vanish; the displayed differences therefore telescope to $c_u \( f \) = 0$ by Theorem 49.

The contradiction proves the irrationality criterion with one threshold for all the lattice data in its statement. Section 7 then applies the standard period and categorical results: for each admissible $d$, a very general point of $cal(C)_d$ has the required lattice data and an exact $bb(C)$-linear equivalence of its Kuznetsov component with the ordinary derived category of a smooth projective K3 surface. The criterion therefore applies in every admissible divisor above the same threshold. Figure 1 summarizes the contradictory evaluations of the hypothetical map.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((4.235, 0), [$upright(bold(P))^4 arrow.r.dashed X$])
  content((0, -1.585), [$upright("whole integral surface blocks")$])
  content((8.141, -1.585), [$upright("endpoint corrections ") v + s$])
  content((0, -3.171), [$c_u \( f \) = 1$])
  content((8.141, -3.171), [$c_u \( f \) = 0$])
  line((3.651, -0.2187), (1.916, -0.8684), mark: (end: ">"))
  content((3.002, -1.128), [#text(size: 0.73em)[$upright("smooth factorization")$]])
  line((4.807, -0.2321), (6.549, -0.9393), mark: (end: ">"))
  content((5.91, -0.01492), [#text(size: 0.73em)[$upright("Mori factorization")$]])
  line((0, -1.858), (0, -2.898), mark: (end: ">"))
  content((1.093, -2.378), [#text(size: 0.73em)[$upright("Proposition 3.10")$]])
  line((8.141, -1.858), (8.141, -2.898), mark: (end: ">"))
  content((8.993, -2.378), [#text(size: 0.73em)[$upright("Theorem 6.6")$]])
})],
  caption: [Figure 1: Assuming rationality gives a birational map $f : upright(bold(P))^4 arrow.r.dashed X$. Its two evaluations use the same collection of K3 surfaces. The right-hand evaluation holds above a degree threshold independent of the map, the test subcollection, and the number of links. ],
) <fig:two-evaluations>

=== 1.2 Consequences for K3 geometry and zero-cycles <consequences-for-k3-geometry-and-zero-cycles>

The modern associated-K3 rationality prediction, in the explicit formulation recorded by Huybrechts #cite(label("HuybrechtsUpdate25")) Conjecture 2.1, equation (2.1), asserts that a smooth complex cubic fourfold is rational if and only if the primitive cohomology of some polarized K3 surface admits a primitive isometric Hodge embedding into its primitive fourth cohomology, with the Tate twist and pairing convention used below.

#thm([Corollary 1.2.])[
  (Failure of associated-K3 sufficiency).  #emph[Let $d_0$ be the threshold in Theorem 1. For every admissible $d > d_0$, a very general $X in cal(C)_d$ is irrational and admits a labelling $K$ of discriminant $d$ and a primitively polarized smooth projective K3 surface $\( S_(upright("Hdg")) \, L \)$, with $L^2 = d$, for which there is an integral Hodge isometry 
$ K^perp tilde.eq L^perp \( - 1 \) . $

 Here $L^perp subset H^2 \( S_(upright("Hdg")) \, bb(Z) \)$, and the surface cup pairing is reversed. Thus an associated untwisted polarized K3 surface in this Hodge-theoretic sense is not sufficient for rationality.]
] <cor:associated-k3>

The proof is given in Section 7.3.

#thm([Corollary 1.3.])[
  (Failure of Hilbert-square sufficiency).  #emph[Let $d_0$ be the threshold in Theorem 1. For every integer $n gt.eq 2$ such that $d = 2 n^2 + 2 n + 2 > d_0$, a very general $X in cal(C)_d$ is irrational and its Fano variety of lines $F \( X \)$ is birational to the Hilbert square $S_(upright("Hilb"))^(\[ 2 \])$ of a smooth projective K3 surface $S_(upright("Hilb"))$. There are infinitely many such discriminants. Thus birationality of $F \( X \)$ to a K3 Hilbert square is not sufficient for rationality of $X$.]
] <cor:hilbert-square>

The proof is given in Section 7.3.

The categorical surface $S$, the Hodge-associated surface $S_(upright("Hdg"))$, and, in the Hilbert-square subfamily, the surface $S_(upright("Hilb"))$ need not be identified. They witness different structures on the same cubic.

#thm([Corollary 1.4.])[
  (Integral Chow decompositions for the irrational cubics).  #emph[Let $d_0$ be the threshold in Theorem 1. For every admissible $d > d_0$, a very general $X in cal(C)_d$ is irrational and has universally trivial $"CH"_0$: for every field extension $F \/ bb(C)$, the degree map 
$ deg : "CH"_0 \( X_F \) arrow.r bb(Z) $

 is an isomorphism. This universal $"CH"_0$ property is equivalent to the existence of a point $x in X \( bb(C) \)$, a proper closed algebraic subset $D subset.neq X$, and a codimension-four cycle $Gamma$ with integer coefficients supported on $D times X$ such that 
$ \[ Delta_X \] = \[ X times { x } \] + \[ Gamma \] quad upright("in ") "CH"^4 \( X times X \) $

 with integral coefficients.]
] <cor:chow-diagonal>

The proof is given in Section 7.3.

This applies in particular to the associated-K3 examples in Corollary 2 and the Hilbert-square subfamily in Corollary 3. The asserted identity is an integral Chow-theoretic decomposition, not merely a rational cohomological decomposition; thus the decomposition-of-the-diagonal obstruction does not detect the irrationality of these examples. A variety is stably rational if its product with some projective space is rational. Stable rationality implies universal $"CH"_0$-triviality #cite(label("Voisin17")); the corollary supplies this necessary condition for the irrational cubics. No assertion about stable rationality is made.

=== 1.3 Relation to birational invariants and quantum methods <relation-to-birational-invariants-and-quantum-methods>

The existence of an associated K3 is distinct from the stronger condition that the Fano variety of lines be birational to a Hilbert square of a K3 surface #cite(label("Addington16")) Theorems 1 and 2. A related motivic approach uses the identity of Galkin and Shinder between a cubic, its Hilbert square and its Fano variety of lines in the Grothendieck ring #cite(label("GalkinShinder14")) Theorem 5.1. Their rationality consequence assumes a cancellation conjecture for the class of the affine line #cite(label("GalkinShinder14")) Conjecture 2.7 and Theorem 7.5; Borisov proved that this global cancellation conjecture fails #cite(label("Borisov18")) Theorem 2.12. Our argument uses an additive invariant of individual birational maps.

Quantum cohomology and Hodge theory provide another approach to irrationality. Iritani’s blowup theorem decomposes the quantum $D$-module after a formal extension of coefficients and change of variables #cite(label("Iritani25")) Theorem 1.1. Using this quantum blowup behavior, Katzarkov, Kontsevich, Pantev and Yu construct Hodge atoms and obtain an irrationality theorem for a very general cubic in the full moduli space #cite(label("KKPY26")) Theorem 6.8. Their very-general hypothesis does not cover a prescribed Hassett divisor. Guéré obtains a rational Hodge-theoretic constraint on a rational cubic #cite(label("Guere26")) Theorem 63; that conclusion does not assert an integral isometry of the intersection lattices. The argument here retains whole integral polarized transcendental lattices through cancellation. Their integral discriminants determine the exact degrees of the K3 surfaces in the fixed test collection. The integral comparison and the uniform bound for the relevant surface contributions are proved in Sections 3–6.

Integral surface-transcendental lattices also enter Kulikov’s approach, which derives irrationality of a very general cubic fourfold from an indecomposability conjecture for those lattices #cite(label("Kulikov08")) Proposition 1. Auel, Böhning and Graf von Bothmer disproved that conjecture for the sextic Fermat surface #cite(label("AuelBohningBothmer13")) Theorem 1.2. Here the independent factors of the operator algebra distinguish whole surface contributions even when their transcendental Hodge structures are reducible; no general indecomposability assertion is used.

Fay proves that a very general member of a special divisor is irrational when the quaternion class $\( d \/ 2 \, - 3 \)$ over $bb(Q)$ is nonzero #cite(label("Fay26")) Theorem 1.1. The class vanishes exactly when the valuation of $d \/ 2$ is even at every prime congruent to two modulo three #cite(label("Fay26")) condition $\( * *' \)$. For every admissible $d$, all these valuations are zero: $4 divides.not d$ makes $d \/ 2$ odd, and admissibility excludes the other such primes. Thus Fay’s quaternion obstruction vanishes throughout the range of Theorem 1.

The divisorial invariant is a specialization of the motivic invariants of birational maps studied by Lin and Shinder #cite(label("LinShinder24")). Their later work develops horizontal and vertical versions #cite(label("LinShinder26")) Definition 2.3 and Lemmas 2.4–2.5 and constructs unbounded contributions from elliptic surfaces #cite(label("LinShinder26")) Theorem 1.2 and Section 4. The surface calculation adapts the virtual Néron–Severi viewpoint of Lin, Shinder and Zimmermann #cite(label("LinShinderZimmermann23")) Definition 5.2 and Proposition 5.5. Our uniform exclusion concerns Picard-number-one K3 surfaces of large degree and remains uniform when their integral transcendental Hodge-isometry class is prescribed.

=== 1.4 Notation and organization <notation-and-organization>

All varieties and function fields are over $bb(C)$, except for the explicit generic-field arguments. Cohomology coefficients are specified where used; transcendental lattices always mean integral lattices modulo torsion. For reference, the main notation is collected below.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Symbol
], table.cell(rowspan: 1, colspan: 1)[Meaning
]),
  table.cell(rowspan: 1, colspan: 1)[$T_M \, med q_M$
], table.cell(rowspan: 1, colspan: 1)[Integral transcendental middle lattice of a fourfold and its cup form.
],
  table.cell(rowspan: 1, colspan: 1)[$T_Z \( - 1 \)$
], table.cell(rowspan: 1, colspan: 1)[Surface transcendental lattice shifted to weight four, with pairing $- q_Z$.
],
  table.cell(rowspan: 1, colspan: 1)[$G_M$
], table.cell(rowspan: 1, colspan: 1)[Rational operator algebra on $T_M ⊗ bb(Q)$, defined from genus-zero pairings in Definition 11.
],
  table.cell(rowspan: 1, colspan: 1)[$cal(S) \, med u$
], table.cell(rowspan: 1, colspan: 1)[A degree-$d$ K3 test collection and its MRC indicator.
],
  table.cell(rowspan: 1, colspan: 1)[$c_u \( f \)$
], table.cell(rowspan: 1, colspan: 1)[Target-acquired minus source-lost prime divisors, weighted by $u$.
],
  table.cell(rowspan: 1, colspan: 1)[$V \/ B \, med Q$
], table.cell(rowspan: 1, colspan: 1)[A Mori fibre-space node and the common base of a link.
],
  table.cell(rowspan: 1, colspan: 1)[$v \, med h_Q$
], table.cell(rowspan: 1, colspan: 1)[Integer vertical-divisor correction and its portion dominating $Q$; (5.1) and (5.2).
],
  table.cell(rowspan: 1, colspan: 1)[$w \, med sigma_k \, med s$
], table.cell(rowspan: 1, colspan: 1)[Integer corrections on a generic surface, a conic with a chosen surface subfield, and an entire Mori node; Definition 40, (6.2), and (6.9).
],
)
]

Section 2 defines the test and the divisorial cocycle. Section 3 proves the whole-lattice calculation in smooth factorizations. Section 4 establishes the bounded marked diagrams and fixes the order of the uniform choices. Section 5 computes the correction on generic surfaces; Section 6 makes it intrinsic and proves vanishing by telescoping. Section 7 applies the resulting irrationality criterion to every sufficiently large admissible Hassett divisor and proves the three corollaries stated above.

== 2 Birational fields and a divisorial cocycle <pre:section>

We define the field test and the additive birational invariant used in both factorizations. On a smooth blowup the invariant will be the test of the center, with a sign determined by the direction of the map.

All varieties and maps are over $bb(C)$, unless a function field is explicitly specified. A variety is integral. When a finite union is used, every sum is taken over its integral components. A model of a finitely generated field $F \/ bb(C)$ is a variety with function field $F$; a smooth projective model may always be chosen. A fourfold is #emph[rational] if it is birational over $bb(C)$ to $bb(P)^4$. Rational connectedness of a field means rational connectedness of a smooth projective model. We use characteristic-zero resolution and principalization in the projective category, originating with Hironaka #cite(label("Hironaka64")); precise forms are given in #cite(label("Wlodarczyk05")) Theorems 1.0.1–1.0.3. Resolving the closure of a joint graph gives a common smooth projective resolution of finitely many rational maps. Principalization makes the marked ideals and exceptional boundary into a simple normal-crossing support; see also #cite(label("AKMW02")) Sections 1.2.2–1.2.3.

=== 2.1 The K3 test <the-k3-test>

For a smooth projective variety $V$, write $V arrow.r.dashed R \( V \)$ for its maximal rationally connected quotient. Its general fibres are rationally connected, its base is not uniruled, and the base is determined up to birational equivalence. We use the standard quotient theorem and the theorem that a fibration with rationally connected base and general fibre has rationally connected total space; see #cite(label("Kollar96")) Chapter IV, §5 and #cite(label("GHS03")) Corollaries 1.3–1.4. The quotient has a proper morphism representative on suitable dense open subsets #cite(label("Campana92")) §0.7 and Theorem 2.3.

Fix a positive integer $d > 2$ and any collection $cal(S)$ of isomorphism classes of smooth projective K3 surfaces $S$ such that

#[#set math.equation(numbering: n => "(2.1)")
 $ "Pic" \( S \) = bb(Z) L_S \, #h(2em) L_S upright(" is ample") \, #h(2em) L_S^2 = d \, #h(2em) "Aut"_(bb(C)) \( S \) = { 1 } . $ <pre:test-collection>]

For odd $d$ the collection is empty. The collection can be restricted by any further condition, including an integral polarized transcendental Hodge-isometry condition. Every degree threshold proved below is uniform in this choice of subcollection.

#prodef([Definition 2.1.])[
  (The test function).  For a finitely generated field $F \/ bb(C)$, choose a smooth projective model $V$ and set
  $ u \( F \) = cases(delim: "{", 1 \, & upright("if ") R \( V \) upright(" is birational to some ") S in cal(S) \,, 0 \, & upright("otherwise") .) $
  For an integral variety $V$, put $u \( V \) = u \( bb(C) \( V \) \)$.
] <pre:test>

Birational invariance and uniqueness of the quotient make this definition independent of the model. A K3 surface is not uniruled. Moreover, two birational smooth projective K3 surfaces are isomorphic. One way to see the latter assertion is to resolve a birational map as $S arrow.l^p W arrow.r^q S'$. The pullbacks of the nowhere vanishing two-forms on $S$ and $S'$ span the same one-dimensional space $H^0 \( W \, Omega_W^2 \)$. Their zero divisors therefore have the same support. These supports are respectively the exceptional loci of $p$ and $q$. Every exceptional fibre is connected, so $q$ contracts every fibre of $p$, and conversely. The image of $\( p \, q \)$ in $S times S'$ projects properly, quasi-finitely and birationally to the normal surface $S$, so that projection is an isomorphism. Descending in both directions gives inverse morphisms. In particular, $"Bir"_(bb(C)) \( S \) = "Aut"_(bb(C)) \( S \)$ for a K3 surface.

#thm([Lemma 2.2.])[
  (Rationally connected fibrations).  #emph[Let $V arrow.r.dashed W$ be a dominant rational map whose geometric generic fibre is integral and has a rationally connected smooth proper model. Then $R \( V \)$ and $R \( W \)$ are birational, and hence $u \( V \) = u \( W \)$. In particular, for any vector bundle $cal(E)$ of positive rank on an integral variety $W$, 
$ u \( bb(P)_W \( cal(E) \) \) = u \( W \) . $

 The test vanishes on rationally connected varieties and on varieties of dimension at most one. For an integral surface $W$, it is one precisely when $W$ is birational to a member of $cal(S)$.]
] <pre:mrc-fibration>

#proof[
  Resolve the rational maps and use smooth projective models. Compose $V arrow.r.dashed W$ with the maximal rationally connected quotient of $W$. A general fibre of the composite fibres over a rationally connected general fibre of $W arrow.r.dashed R \( W \)$, with rationally connected general fibre. It is rationally connected by the fibration theorem of Graber–Harris–Starr #cite(label("GHS03")) Corollary 1.3. Since $R \( W \)$ is not uniruled, this composite is a maximal rationally connected quotient of $V$. Indeed, a family of rational curves through general points of $V$ that is not vertical would induce a covering family of rational curves on $R \( W \)$. Uniqueness of the quotient proves the first assertion. A projective bundle has a projective-space generic fibre. The remaining statements follow from the dimension of the quotient, and from the fact that a non-uniruled surface is its own quotient. ◻
]

We also use $u$ on finite field extensions and finite Galois sets. If $k \/ bb(C)$ is finitely generated and a finite étale $k$-algebra is $A = product_i k_i$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ u \( A \) = sum_i u \( k_i \) . $ <pre:finite-orbits>]

Equivalently, for a finite set with continuous action of $"Gal" \( macron(k) \/ k \)$, sum once over its Galois orbits, using the finite residue field belonging to each orbit. There is no factor $\[ k_i : k \]$ in this sum. Each $k_i$ is viewed as a field over $bb(C)$. Geometric generic fibres over algebraic closures of function fields will be used to obtain bounds, while $u$ continues to be evaluated on the original finitely generated fields over $bb(C)$.

#thm([Lemma 2.3.])[
  (Small orbits).  #emph[Suppose $k tilde.eq bb(C) \( x \, y \)$. A finite Galois orbit of size one or two has test value zero. More generally, if a finite extension $ell \/ k$ has a nonidentity $bb(C)$-automorphism, then $u \( ell \) = 0$.]
] <pre:small-orbits>

#proof[
  The field $k$ is rational. If $u \( ell \) = 1$, the surface field $ell$ is the function field of a member of $cal(S)$, by Lemma 6. A nonidentity field automorphism would give a nonidentity birational, hence regular, automorphism of that K3 surface. This contradicts the choice of $cal(S)$. A quadratic extension in characteristic zero has its nonidentity involution. ◻
]

=== 2.2 Prime divisors as valuations <prime-divisors-as-valuations>

Let $X$ be a normal projective variety with function field $F$. A prime divisor $E subset X$ determines the normalized discrete valuation $"ord"_E : F^(*) arrow.r bb(Z)$, whose residue field is $bb(C) \( E \)$. Write $cal(D)_F \( X \)$ for this set of valuations, using a specified identification $bb(C) \( X \) tilde.eq F$ when necessary. Distinct valuations are counted separately even when their residue fields are isomorphic.

For a birational map $f : X arrow.r.dashed Y$, identify the function fields by $f^(*) : bb(C) \( Y \) arrow.r^tilde.op bb(C) \( X \) = F$ and define

#[#set math.equation(numbering: n => "(2.3)")
 $ c_u \( f \) = sum_(nu in cal(D)_F \( Y \) \\ cal(D)_F \( X \)) u \( kappa \( nu \) \) - sum_(nu in cal(D)_F \( X \) \\ cal(D)_F \( Y \)) u \( kappa \( nu \) \) . $ <pre:cocycle-definition>]

Thus divisors acquired by the target have positive sign. The target’s valuation set is transported using $f^(*)$ even when $X = Y$. This is the divisorial invariant of Lin and Shinder, composed with the MRC/K3 test $u$; the sign agrees with their target-acquired minus source-lost convention #cite(label("LinShinder24")) Definition 2.1, Lemma 2.2 and Proposition 2.3.

#thm([Lemma 2.4.])[
  (Divisorial cocycle).  #emph[The sums in (2.3) are finite. For birational maps $f : X arrow.r.dashed Y$ and $g : Y arrow.r.dashed Z$ of normal projective varieties, 
#[#set math.equation(numbering: n => "(2.4)")
 $ c_u \( g compose f \) = c_u \( f \) + c_u \( g \) \, #h(2em) c_u \( f^(- 1) \) = - c_u \( f \) . $ <pre:cocycle-additivity>]

 An isomorphism in codimension one has value zero. If $pi : tilde(X) arrow.r X$ is the blow-up of a smooth projective variety along a smooth center with connected components $Z_i$ of codimension at least two, then 
#[#set math.equation(numbering: n => "(2.5)")
 $ c_u \( pi^(- 1) \) = sum_i u \( Z_i \) \, #h(2em) c_u \( pi \) = - sum_i u \( Z_i \) . $ <pre:blowup-sign>]

]
] <pre:cocycle>

#proof[
  Choose dense open subsets on which $f$ is an isomorphism. Every divisor whose generic point belongs to these opens has a corresponding divisor on the other model with exactly the same valuation. Any valuation in the symmetric difference must therefore be represented by a divisorial component of one of the two closed complements. There are finitely many such components. This also proves that an isomorphism in codimension one has value zero.
  For the composition use the common field $F = bb(C) \( X \)$, transporting $bb(C) \( Y \)$ by $f^(*)$ and $bb(C) \( Z \)$ by $f^(*) g^(*)$. Put $D_X = cal(D)_F \( X \)$, $D_Y = cal(D)_F \( Y \)$ and $D_Z = cal(D)_F \( Z \)$. Their pairwise symmetric differences are finite. On the set of all prime divisorial valuations of $F$,
  $ upright(bold(1))_(D_Z) - upright(bold(1))_(D_X) = \( upright(bold(1))_(D_Y) - upright(bold(1))_(D_X) \) + \( upright(bold(1))_(D_Z) - upright(bold(1))_(D_Y) \) . $
  All three differences have finite support. Multiplying by $u \( kappa \( nu \) \)$ and summing proves additivity. Transport by a $bb(C)$-field isomorphism identifies residue fields, so the last term is precisely $c_u \( g \)$. Reversing the two valuation sets gives the inverse formula.
  For the blow-up, the target of the extraction $pi^(- 1) : X arrow.r.dashed tilde(X)$ retains every original divisorial valuation and adds exactly one exceptional divisor $E_i = bb(P)_(Z_i) \( N_(Z_i \/ X) \)$ for each $Z_i$. Its residue field is purely transcendental over $bb(C) \( Z_i \)$, of transcendence degree $"codim"_X \( Z_i \) - 1$. Lemma 6 gives $u \( E_i \) = u \( Z_i \)$. The stated signs now follow from the definition and the inverse formula. ◻
]

For the generic-surface interpretation, let $V arrow.r Q$ have a smooth surface generic fibre over $k = bb(C) \( Q \)$. Blowing up a closed point $P$ of that fibre creates the exceptional curve $bb(P)_(kappa \( P \))^1$. Its function field is $kappa \( P \) \( t \)$, so the corresponding divisorial valuation of $bb(C) \( V \)$ contributes $u \( kappa \( P \) \)$ once, by Lemma 6. There is no factor $\[ kappa \( P \) : k \]$. This is the compatibility between (2.2) and the divisorial count used for generic surface links.

=== 2.3 The smooth factorization used below <the-smooth-factorization-used-below>

#thm([Theorem 2.5.])[
  (Weak factorization).  #emph[A birational map between smooth projective varieties over $bb(C)$ factors into a finite zigzag of blow-ups and blow-downs along smooth connected centers, with all intermediate varieties smooth and projective. Nontrivial steps may be taken to have centers of codimension at least two.]
] <pre:weak-factorization>

This is the projective case of #cite(label("AKMW02")) Theorem 0.1.1; blowing up a smooth divisor is an isomorphism and may be omitted. In a factorization of a birational map from $bb(P)^4$, every intermediate variety is itself a smooth projective rational fourfold, hence rationally connected. Its centers have dimension zero, one, or two. Lemma 8 computes $c_u$ as the signed sum of their tests along the zigzag; only surface centers can have nonzero test.

== 3 Whole transcendental lattices under factorization <gw:section>

We construct an operator algebra which distinguishes the whole transcendental contribution of each surface center. Its role is to make the classical integral blowup decomposition compatible with cancellation in an arbitrary weak factorization. Quantum blowup decompositions also appear in Iritani’s decomposition of quantum $D$-modules and quantum cohomology $F$-manifolds #cite(label("Iritani25")) Theorem 1.1 and Corollary 1.2. That decomposition uses a formal Novikov extension and a change of variables. Here we study the rational operator algebra in the classical blowup splitting and its saturated integral transcendental summands.

=== 3.1 Hodge structures and the operator algebra <hodge-structures-and-the-operator-algebra>

For a smooth projective variety $Y$, write

$ H^(2 i) \( Y \, bb(Q) \)_(upright("Hdg")) = H^(2 i) \( Y \, bb(Q) \) ∩ H^(i \, i) \( Y \) . $

If $M$ is a rationally connected smooth projective fourfold, set

$ L_M = H^4 \( M \, bb(Z) \) \/ upright("tors") \, #h(2em) T_M = L_M ∩ H^4 \( M \, bb(Q) \)_(upright("Hdg"))^perp . $

The orthogonal is taken for the cup form $q_M$. For a smooth projective surface $Z$, use the analogous definition

$ T_Z = \( H^2 \( Z \, bb(Z) \) \/ upright("tors") \) ∩ H^2 \( Z \, bb(Q) \)_(upright("Hdg"))^perp \, $

with surface cup form $q_Z$. We always divide out torsion before discussing integral lattices. When comparing with degree four, $T_Z \( - 1 \)$ means the Tate shift to weight four, equipped with the form $- q_Z$.

#thm([Lemma 3.1.])[
  #emph[The forms on $T_M$ and $T_Z$ are nondegenerate. The rational Hodge structure $T_(M \, bb(Q))$ is generated by its $\( 3 \, 1 \)$ and $\( 1 \, 3 \)$ subspaces, and $T_(Z \, bb(Q))$ is generated by its $\( 2 \, 0 \)$ and $\( 0 \, 2 \)$ subspaces. The only off-diagonal types in the even cohomology of $M$ are $\( 3 \, 1 \)$ and $\( 1 \, 3 \)$ in degree four. If $i : Z arrow.r.hook M$ is a surface embedding, then 
$ i^(*) T_(M \, bb(Q)) = 0 \, #h(2em) i_(*) T_(Z \, bb(Q)) = 0 . $

]
] <gw:hodge>

#proof[
  Rational connectedness gives $H^(p \, 0) \( M \) = 0$ for $p > 0$ #cite(label("AraujoKollar02")) Theorem 30. We use the Hodge decomposition, functoriality and Lefschetz polarizations in #cite(label("VoisinHodge2016")) Sections 2.1–2.2; the Hodge-complement statement is Lemma 1 there. Thus $H^2 \( M \, bb(Q) \)$ is of type $\( 1 \, 1 \)$; hard Lefschetz gives the analogous statement in degree six. The remaining assertion about types follows from Hodge symmetry. In degree four all nonprimitive Lefschetz summands are rational Hodge classes. Hodge–Riemann therefore makes their orthogonal primitive transcendental part nondegenerate. The same argument in degree two applies to a surface, using an ample class to split off its nonprimitive part. Alternatively, the nondegeneracy on the Hodge-class space follows on each primitive Lefschetz summand from definiteness.
  By semisimplicity of polarizable rational Hodge structures, the substructure generated by the stated off-diagonal types has a Hodge complement in the transcendental structure. That complement would have only diagonal type, and hence would consist of rational Hodge classes. It is zero by the definition and nondegeneracy of the transcendental part. Finally, $i^(*)$ takes the off-diagonal part of $H^4 \( M \)$ into $H^4 \( Z \)$, which has only type $\( 2 \, 2 \)$; and $i_(*)$ takes the off-diagonal part of $H^2 \( Z \)$ into $H^6 \( M \)$, which has only type $\( 3 \, 3 \)$. Both maps vanish on the generating types and therefore on the whole corresponding rational Hodge structure. ◻
]

All Gromov–Witten invariants below are connected, of genus zero, and use cohomology with rational coefficients. The #emph[Hodge difference] of a class of type $\( p \, q \)$ is $p - q$. All degrees are collected by numerical curve class: an invariant denotes the sum over homology classes with the specified numerical class. This sum is finite in every bounded ample degree, and all degree comparisons below use an integral ample class. Other than the two specified variable insertions, every insertion is a rational class of diagonal Hodge type. Descendant powers at all ordinary markings, including the two variable markings, are arbitrary nonnegative integers. These two markings carry distinct formal labels in every weighted list and degeneration graph. The labels remain distinct even when the two vectors agree or one is zero. Automorphism and gluing coefficients thus depend on the fixed discrete data, independently of the variable vectors.

#prodef([Definition 3.2.])[
  For every invariant
  $ B \( u \, v \) = ⟨tau_a \( u \) \, tau_b \( v \) \, tau_(a_1) \( gamma_1 \) \, dots.h \, tau_(a_n) \( gamma_n \)⟩_(0 \, beta)^M \, #h(2em) u \, v in T_(M \, bb(Q)) \, $
  let $A_B in "End"_(bb(Q)) \( T_(M \, bb(Q)) \)$ be determined by $B \( u \, v \) = q_M \( A_B u \, v \)$. Let $G_M$ be the unital rational algebra generated by all such operators. On the zero space we take the zero algebra.
] <gw:algebra>

The virtual classes, evaluation maps, and cotangent classes defining these invariants respect Hodge structures. Thus $A_B$ is a Hodge endomorphism. Interchanging the two variable markings supplies its adjoint. In particular, every expression in $G_M$ is a rational Hodge endomorphism. By Lemma 10, equality of two such expressions can be checked on $\( 3 \, 1 \)$, by pairing their images with $\( 1 \, 3 \)$. We will use the analogous test on surfaces, after the indicated Tate shift. Accordingly, when analyzing a tensor on copies of $T_M$ or $T_Z$, we first test its two inputs on opposite off-diagonal types and then use this Hodge-generation statement to recover the full rational tensor.

#thm([Theorem 3.3.])[
  (Operator and integral blowup decomposition).  #emph[Let $pi : Y arrow.r M$ be the blowup of a connected smooth center $Z$ of codimension $r gt.eq 2$ in a rationally connected smooth projective fourfold. If $Z$ is a surface, the classical embeddings identify 
#[#set math.equation(numbering: n => "(3.1)")
 $ \( T_Y \, q_Y \) = \( T_M \, q_M \) perp \( T_Z \( - 1 \) \, - q_Z \) quad upright("over ") bb(Z) \, #h(2em) G_Y = G_M xor bb(Q) thin "id"_(T_Z) . $ <gw:split-equation>]

 The second factor is omitted when $T_Z = 0$. For a point or curve center, $T_Y = T_M$ integrally and $G_Y = G_M$.]
] <gw:blowup>

Here and subsequently a product decomposition of operator algebras means that the two factors act independently on the displayed summands, with zero mixed blocks. In particular, the assertion is stronger than the reconstruction of individual numerical invariants.

Retain the blowup $pi : Y arrow.r M$ of Theorem 12 throughout its proof. Write $i : Z arrow.r.hook M$ and $j : D arrow.r.hook Y$ for the center and exceptional-divisor embeddings, where $D = bb(P)_Z \( N_(Z \/ M) \)$. Let $p : D arrow.r Z$ and $xi = c_1 \( cal(O)_D \( 1 \) \)$. Put $W = T_(Z \, bb(Q))$ if $Z$ is a surface, and $W = 0$ otherwise.

We first identify the integral summands in the theorem. The classical blowup formula has explicit Hodge-compatible integral maps #cite(label("Schreieder14")) Section 2.1, Lemmas 9–10. In the surface case it reads

$ H^4 \( Y \, bb(Z) \) \/ upright("tors") = pi^(*) \( H^4 \( M \, bb(Z) \) \/ upright("tors") \) xor j_(*) p^(*) \( H^2 \( Z \, bb(Z) \) \/ upright("tors") \) . $

The summands are orthogonal, since $p_(*) 1 = 0$, and on the exceptional summand $j^(*) j_(*) = - xi$ and $p_(*) xi = 1$ give $- q_Z$. After rationalization this is a direct sum of Hodge structures, so its Hodge-class subspace splits as well. Taking the orthogonal and intersecting with the displayed integral direct sum gives the integral transcendental decomposition. For a curve or point center the additional degree-four cohomology is diagonal and contributes no transcendental summand.

The remaining assertion concerns the operator algebra on this fixed splitting. We first prove $G_Y subset.eq G_M xor bb(Q) "id"_W$: there are no mixed operators, the exceptional block is scalar, and the old block lies in $G_M$. An exceptional-line invariant then supplies the projector onto $W$, separating that factor from its complement. Finally we recover every operator in $G_M$ on the old summand. The two inclusions require different relative reconstructions: the first uses ordinary insertions pulled back from $M$, whereas recovery allows arbitrary ordinary insertions on $Y$. When $W = 0$, only the two inclusions are needed. The next three subsections carry out these steps; the final subsection uses the product decomposition to cancel whole integral lattices along a weak factorization.

=== 3.2 Classical degeneration and local path tensors <classical-degeneration-and-local-path-tensors>

Both reconstruction arguments express a two-variable tensor as contractions of connected relative tensors. The genus-zero tree reduces these contractions to the path joining the two variable markings. Along that path, local projective-bundle vertices supply scalar pairings between copies of $W$. We first specify the connected-factor and descendant conventions needed for these statements.

We use expanded relative stable maps in the sense of Jun Li #cite(label("Li01")) #cite(label("Li02")). An ordinary marking carries an evaluation class on the target; a relative marking carries a positive contact order and an evaluation class on the boundary divisor. In a degeneration graph the relative markings are the joining roots. A descendant at an ordinary marking is the first Chern class of the cotangent line of the actual source curve there. These are the same cotangent lines in every relative theory used below. Gluing relative markings to nodes changes no neighborhood of an ordinary marking; hence these cotangent lines restrict to the corresponding lines on the relative factors. On a smooth fibre they are the usual absolute descendant lines. We never require a descendant at a joining relative marking.

We require the degeneration formula with a product of #emph[connected] relative factors. A disconnected source can share one expanded target, so this product requires a virtual-class theorem. Here is the precise chain of results we use. Apply the ordinary-descendant degeneration formula of Abramovich–Fantechi #cite(label("AF16")) Theorem 0.1 and Section 5. For fixed labelled connected-component data $Xi = product.co_nu Gamma_nu$, write $cal(K)_(Gamma_nu) \( X \, D \)$ for the relative-map space with that connected degree, genus, and marking data, and $cal(K)_Xi \( X \, D \)$ for the space with all those components sharing an expanded target. Their contraction morphism

$ epsilon.alt : cal(K)_Xi \( X \, D \) arrow.r product_nu cal(K)_(Gamma_nu) \( X \, D \) $

separates and stabilizes the components, and satisfies

$ epsilon.alt_(*) \[ cal(K)_Xi \( X \, D \) \]^(upright("vir")) = times.square_nu \[ cal(K)_(Gamma_nu) \( X \, D \) \]^(upright("vir")) $

by #cite(label("AF16")) Proposition 4.14. Corollary 4.15 there gives the ordinary-descendant product formula, retaining all relative evaluation weights. This corollary supplies descendant compatibility under the separating and stabilizing map $epsilon.alt$. Its hypothesis that each connected component has a marking holds here: each vertex of a nontrivial connected degeneration graph has a joining root. A one-vertex term needs no product decomposition. Next apply #cite(label("AMW14")) Theorem 1.1.2 to each connected factor to identify it with the Jun Li relative invariant.

These steps preserve our cotangent convention. The ordinary lines in #cite(label("AF16")) Definition 4.1 and Section 4.3 agree with those on the actual coarse source near ordinary markings. The comparison morphism from Abramovich–Fantechi to Li contracts no source components #cite(label("AMW14")) Section 4.1; its virtual pushforward and the projection formula therefore identify the actual-source descendants as well as the evaluation classes. We need no descendant at a joining root and no comparison for disconnected Li moduli. This also explains why we use the product theorem for maps to a fixed relative target; no product rule for rubber targets is asserted.

The resulting formula expresses an absolute invariant as a finite sum over matching connected relative data. Each edge contracts a pair of relative weights with the diagonal of the double divisor. The coefficient is the product of contact orders divided by the automorphism and labeling factors. A connected genus-zero source gives a tree of connected vertices. We retain the two variable insertions throughout, so the formula is an identity of bilinear tensors.

The two normal-cone degenerations used in the reconstruction have auxiliary components

$ P = bb(P)_Z \( N_(Z \/ M) xor cal(O)_Z \) \, #h(2em) P_D = bb(P)_D \( N_(D \/ Y) xor cal(O)_D \) . $

Degenerating $M$ along $Z$ gives the pair $\( Y \, D \)$ joined to $P$ along its infinity divisor $D$; its zero section is $Z$. Degenerating $Y$ along $D$ gives $\( Y \, D \)$ joined to $P_D$ along its infinity section, another copy of $D$; its zero section is also a copy of $D$. Both auxiliary components, and their expansions, project to $Z$. All classes of Hodge difference $plus.minus 2$ on $D$, on $P$, and on the projective bundles appearing when one degenerates along $D$, come from copies of $W$ multiplied by tautological classes. If $W = 0$ there are no such classes.

Multiplication of one of these copies of $W$ by a fixed diagonal class preserves the sum of the copies, and is scalar between its degree-compatible copies. Indeed, the bundle formula reduces the assertion to base multiplication on $Z$; a positive-degree diagonal base class annihilates $W$, as is seen on $\( 2 \, 0 \)$ and $\( 0 \, 2 \)$ and then by Lemma 10. A product of two $W$ variables is $q_Z \( u \, v \)$ times the point class, with any tautological factors retained. We will use these facts when tail outputs combine cohomology labels.

#thm([Lemma 3.4.])[
  (Local tensors).  #emph[On any of the projective-bundle pieces just described, a connected genus-zero invariant, either absolute or relative to the indicated infinity boundary, with two variable insertions in the corresponding copies of $W$ and all other insertions rational and diagonal is a rational scalar multiple of $q_Z$ on the corresponding copies of $W$. It vanishes if the projected curve class on $Z$ is nonzero. These statements allow ordinary descendants and expanded targets.]
] <gw:local>

#proof[
  There is nothing to prove if $W = 0$. Otherwise $p_g \( Z \) > 0$, so $Z$ is not uniruled. A fixed-degree connected genus-zero stable map with positive projected degree has projected image a connected union of rational curves. For each irreducible component of its finite-type moduli space the evaluation image in $Z$ has dimension at most one: a dominating evaluation image would give a covering family of rational curves on $Z$. There are finitely many such components for the fixed discrete data. A holomorphic two-form pulls back to zero through each of their evaluation maps, since their images lie in curves or points. The bilinear tensor, with all other data fixed, is rational and respects Hodge structures. Its associated Hodge endomorphism therefore annihilates the $\( 2 \, 0 \)$ generating subspace, and its conjugate, and hence all of $W$ by Lemma 10. This proves vanishing as a tensor, independently of the values of the two variables. The argument also applies after projecting an expanded target to $Z$.
  If the projected degree is zero, all evaluations in $Z$ agree. Factoring out base classes by the projection formula, the two variable classes occur as $u smile v$. They already have top degree on the surface. Every additional positive-degree base factor kills their product; the remaining fibre integral is a rational number multiplying $integral_Z u v$. This reasoning is independent of $u \, v$ and allows the specified descendants. ◻
]

#thm([Lemma 3.5.])[
  (A tree with two variables).  #emph[In either normal-cone degeneration above, consider a genus-zero tree with exactly two variable insertions of Hodge differences $+ 2$ and $- 2$. Every branch disjoint from the path joining them supplies a rational diagonal class at its attachment. Along that path the variable spaces are copies of $T_(M \, bb(Q))$ or $W$, with the appropriate Tate shifts. Orient the path from the first labelled variable marking to the second, and order the two slots at each path vertex in that direction. Suppose that, with this slot order, each vertex tensor belongs to the applicable row of the following table. Then contraction of the path belongs to the row determined by its two remaining ends: 
$ upright("two end spaces") & upright("allowed tensors")\
T_(M \, bb(Q)) \, T_(M \, bb(Q)) & \( u \, v \) mapsto q_M \( A u \, v \) \, quad A in G_M \,\
W \, W & bb(Q) q_Z \,\
T_(M \, bb(Q)) \, W upright(" or ") W \, T_(M \, bb(Q)) & 0 . $

 One may replace $G_M$ by any specified rational unital operator algebra, provided that each path vertex still satisfies its applicable row in this oriented slot order. In the reconstruction arguments below, this vertex hypothesis is supplied by the local-tensor lemma or by an earlier induction case.]
] <gw:path>

#proof[
  Cut an edge outside the path. The detached connected subtree has only rational diagonal input classes. Its single output is rational and of Hodge difference zero, because its virtual class and all structure maps respect Hodge difference. At the retained vertex the attachment remains its existing relative root, with the same contact and the resulting diagonal evaluation weight; it is not an additional ordinary marking. Repeating this operation removes all side branches from the tensor contraction. Conservation of Hodge difference at the remaining vertices forces difference two along the path. Lemma 10 and the projective bundle formula identify the indicated variable spaces. These path classes and the diagonal branch outputs have even cohomological degree, so their permutations introduce no odd-degree signs. For the first row, contraction of consecutive tensors written in path order as $q_M \( A u \, x \)$ and $q_M \( B y \, v \)$ pairs $x$ and $y$ with the inverse cup form and gives $q_M \( B A u \, v \)$. Thus contraction composes operators without taking adjoints. In the second row it composes scalar maps between copies of $W$. A path changing between the two sorts has a mixed vertex, whose tensor vanishes by the stated vertex hypothesis. The diagonal of a projective bundle gives the same identities between its copies of $W$, with the relevant nonzero pairing constants. The conclusion follows from closure under composition and rational linear combination. If the two variables meet on one local piece, Lemma 13 supplies the second row directly. ◻
]

=== 3.3 Reconstruction with a center of codimension at least two <reconstruction-with-a-center-of-codimension-at-least-two>

We first prove a relative assertion for $\( Y \, D \)$. Ordinary insertions are pullbacks from $M$. Relative weights are written

#[#set math.equation(numbering: n => "(3.2)")
 $ mu = #scale(x: 120%, y: 120%)[\(] \( k_j \, xi^(b_j) p^(*) delta_j \) #scale(x: 120%, y: 120%)[\)]_(j = 1)^L \, #h(2em) k_j gt.eq 1 \, quad 0 lt.eq b_j lt.eq r - 1 . $ <gw:relative-weights>]

The two variables may be ordinary $T_M$ insertions or relative $W$ insertions. All other classes are rational and diagonal. A relative invariant with these data is interpreted as a bilinear tensor on its two variable spaces. Write $B_(upright("rel")) \( u \, v \)$ for such a tensor in numerical curve class $beta$ on $Y$, with relative list $mu$. Admissibility requires $D dot.op beta = sum_(j = 1)^L k_j$. The #emph[original ordinary markings] are the ordinary markings of this relative datum, before translating any relative conditions into additional absolute markings. This distinction fixes the ordinary-mark count used in the induction.

The translation of relative conditions into absolute descendants follows Hu–Li–Ruan #cite(label("HLR08")) Section 5.2, equation (17), extending the divisor correspondence of Maulik–Pandharipande #cite(label("MP06")) Theorem 2 and Section 2.4. The induction below retains the two variable insertions and all original ordinary descendants, in order to prove the required tensor restrictions.

#thm([Lemma 3.6.])[
  (Restricted relative reconstruction).  #emph[Every such tensor satisfies the three rows of Lemma 14.]
] <gw:relative>

#proof[
  Replace a relative weight $\( k \, xi^b p^(*) delta \)$ by the ordinary insertion
  #[#set math.equation(numbering: n => "(3.3)")
   $ tau_(r \( k - 1 \) + b) \( i_(*) delta \) $ <gw:translation>]
  to form the absolute tensor $B_(upright("abs")) \( u \, v \)$ on $M$ in numerical class $pi_(*) beta$, retaining all original ordinary insertions and their descendant powers. We apply degeneration to the normal cone using the following specific lifts. In
  $ cal(W) = "Bl"_(Z times { 0 }) \( M times bb(A)^1 \) $
  the strict transform $cal(Z)$ of $Z times bb(A)^1$ is still $Z times bb(A)^1$, because the blowup ideal restricts to the Cartier ideal $\( t \)$. Lift $i_(*) delta$ by $\( i_(cal(Z)) \)_(*) \( delta times 1 \)$. On the special fibre its restriction to $Y$ is zero and its restriction to $P = bb(P)_Z \( N_(Z \/ M) xor cal(O)_Z \)$ is the zero-section Gysin class. These are transverse fibre restrictions. Original ordinary classes use pullbacks from $M$.
  This lift is valid even when $i_(*) delta = 0$. A class on $cal(W)$ may restrict to zero on the smooth fibre and nontrivially to its special components. For a relative variable in $W$, Lemma 10 says that the associated absolute insertion is zero, so the absolute bilinear tensor is zero. For two ordinary $T_M$ variables the associated absolute tensor is a generator allowed in the first row. Thus the absolute starting tensor has the required restriction in all three cases.
  We prove the relative restriction by simultaneous strong induction, keeping the two variables throughout. Fix an integral ample divisor $H$ on $M$. The outer order is first $H dot.op pi_(*) beta$, then the number of original ordinary markings. Within fixed outer data, use, in succession, the length of the relative list, the sum of its contacts, and the sum of its hyperplane exponents, with smaller values first. At every smaller outer index the assertion is assumed simultaneously for all numerical curve classes at that index, relative lists, evaluation labels, placements of the two formal variable slots, and ordinary descendant exponents. At equal outer indices the inner induction is likewise simultaneous in the curve classes, labels, variable placements, and descendant exponents. Cutting a side branch only replaces the weight at an existing relative root, so it does not increase the number of original ordinary markings.
  A connected relative vertex on $Y$ of zero projected degree cannot have joining markings. Indeed every nonzero effective curve contracted by $pi$ has class a positive multiple of an exceptional line, and has negative $D$-degree; relative admissibility would require its $D$-degree to equal a sum of positive contacts. A zero-class vertex likewise has no contacts. Thus zero projected degree contributes only a constant invariant with no joining marks. Its two middle-degree ordinary variable classes already have total top degree; the invariant is a scalar cup pairing, or zero. This supplies the initial case.
  For a noninitial term of the degeneration formula, cut away the branches with no variables, as in Lemma 14. Every $Y$-vertex in a nontrivial connected tree has a joining edge, so the zero-degree argument above makes its projected ample degree positive. The projected classes of all components are effective and add to the original class. Hence, if there is more than one $Y$-vertex, every one has smaller projected degree and its path tensor is controlled by induction. A unique $Y$-vertex of smaller projected degree is controlled in the same way. If a $Y$-vertex has the full projected degree, it is the unique $Y$-vertex; its tensor is still an earlier case if it retains fewer original ordinary markings. Local path vertices are controlled by Lemma 13. In these cases every path vertex therefore satisfies its row, so the conditional contraction rule of Lemma 14 controls the term. A path containing no $Y$-vertex is controlled entirely by the local lemma.
  It remains to consider a unique $Y$-vertex of the full projected class carrying all original ordinary markings. Every $P$-vertex is then a fibre tail with one joining marking, since the graph is a tree. Let such a tail have joining contact $k'$ and receive the translated markings indexed by a set $J$. All its evaluations in $Z$ agree. Its pushforward to the joining divisor therefore has the form
  $ (product_(j in J) p^(*) delta_j) eta \, $
  where $eta$ is a rational diagonal class independent of the base labels. The projection formula gives this identity also when a label is one of the two variables. The complex codimension of $eta$ is
  #[#set math.equation(numbering: n => "(3.4)")
   $ c = r (sum_(j in J) k_j - k') + sum_(j in J) b_j - \| J \| + 1 . $ <gw:tail-codim>]
  Indeed the relative fibre virtual dimension is $r - 2 + r k' + \| J \|$; each translated zero-section insertion has fibre codimension $r + r \( k_j - 1 \) + b_j = r k_j + b_j$, and pushing to the relative fibre divisor of dimension $r - 1$ gives the displayed difference.
  If one tail contains both variable markings, both are relative $W$ variables, since all original ordinary markings remain on the main vertex. Their product is $q_Z \( u \, v \)$ times the point class on $Z$, so the tail output is $q_Z \( u \, v \)$ times a fixed class. The remaining vertices then have only fixed insertions, so the graph is a rational multiple of $q_Z$. It already lies in the allowed $W \, W$ row, without using induction on its main tensor. For every other nonzero term, expand the tail outputs in the projective bundle basis. A tail with one $W$ variable multiplies it only by fixed diagonal classes, which act by scalars between the allowed copies or annihilate it. Thus each remaining summand retains two separate variable slots in the prescribed spaces, and the following induction applies to it.
  A negative $c$ gives zero. An empty tail has $c = 1 - r k' < 0$, so every tail receives a translated marking. The new relative list therefore has no more entries than the old one. A strict decrease is an earlier induction case. If the lengths agree, each tail has exactly one translated marking. Then $c gt.eq 0$ and $b_j < r$ imply $k' lt.eq k_j$. A strict decrease of the total contact is again earlier. At equal contacts, expand $eta$ in the projective bundle basis. Its fibre exponent is at most $b_j$, so either the total hyperplane exponent decreases or all the original indices agree. A decrease of a fibre exponent only multiplies its base label by a rational diagonal class, and preserves the stated variable spaces. Thus all smaller terms with separate variable slots retain the required tensor restriction.
  For one translated mark and equal indices, the coefficient of the highest fibre power is obtained by restricting to a fibre. The relative invariant computed in #cite(label("HLR08")) Theorem 7.1 is
  #[#set math.equation(numbering: n => "(3.5)")
   $ ⟨tau_(r k - 1 - j) \( upright("pt") \) divides H^j⟩_(0 \, k \[ upright("line") \])^(\( bb(P)^r \, bb(P)^(r - 1) \)) = frac(1, k^(r - j) \( \( k - 1 \) ! \)^r) > 0 \, #h(2em) 0 lt.eq j lt.eq r - 1 . $ <gw:fibre-number>]
  The proof of that theorem identifies the descendant line with the cotangent line of the source at the ordinary marked point, so its convention is the one fixed above. Taking $j = r - 1 - b$ gives exactly the descendant in (3.3). Gluing multiplies these numbers by positive contact and labeling factors. Consequently the remaining term is a nonzero rational scalar times the original relative tensor. At fixed projection, the total contact fixes the numerical class on the blowup, since the kernel on curve classes is generated by the exceptional line.
  We have an identity $B_(upright("abs")) = C B_(upright("rel")) + R$, with $C in bb(Q)^(*)$ independent of the two variable vectors. The starting tensor and the remainder belong to the relevant row of Lemma 14; hence so does $B_(upright("rel"))$. The induction is simultaneous in the three rows. It is a tensor identity, not a separate choice of a scalar for each pair of vectors. Testing on opposite off-diagonal types and using Lemma 10 extends it to the full rational transcendental structures. This completes the induction. ◻
]

=== 3.4 The exceptional factor and recovery of the old algebra <the-exceptional-factor-and-recovery-of-the-old-algebra>

We first obtain

#[#set math.equation(numbering: n => "(3.6)")
 $ G_Y subset.eq G_M xor bb(Q) "id"_W . $ <gw:inclusion>]

Degenerate $Y$ along its divisor $D$. The main component is again $Y$, and the other component is the projective-line bundle $P_D arrow.r D$ defined above. By the blowup cohomology formula every ordinary insertion on $Y$ is a sum of a pullback from $M$ and exceptional terms $j_(*) a$, where $j : D arrow.r.hook Y$. Lift an exceptional term by the strict transform of the divisor family, so that it is supported on the zero section of the bundle component. Use pullbacks for the other terms. Thus the ordinary insertions on the main relative component are exactly those of Lemma 15. On the other components the local rule of Lemma 13 applies, through their projection to $Z$. Applying Lemma 14 to each degeneration tree proves (3.6), including zero mixed blocks.

The inclusion controls every operator but does not yet separate the two factors or recover all operators on the old summand. The exceptional line gives the required separation. If $W eq.not 0$, let $e$ be the exceptional line class. Every stable map of class $e$ is contained in one fibre of $D arrow.r Z$. A fibre has normal bundle $cal(O) \( - 1 \) xor cal(O)^(xor 2)$ in $Y$, so these maps are unobstructed. The two-mark degree-one evaluation map on the fibre has degree one onto $bb(P)^1 times bb(P)^1$. Restricting $j_(*) p^(*) u$ to $D$ gives $- xi p^(*) u$, whence

#[#set math.equation(numbering: n => "(3.7)")
 $ ⟨j_(*) p^(*) u \, j_(*) p^(*) v⟩_(0 \, e)^Y = integral_Z u v . $ <gw:exceptional-line>]

An insertion from $T_M$ restricts to zero on $D$ by Lemma 10. Relative to the negative cup form of the exceptional summand, (3.7) is minus its projector. Thus the projector onto $W$ belongs to $G_Y$. Its complement belongs to $G_Y$ too.

It remains to recover $G_M$. For this purpose we need the divisor version of Lemma 15, now allowing all ordinary classes on $Y$. Write $"pr"_M G_Y$ for its algebra of restrictions to $T_M$; this is defined by (3.6).

#thm([Lemma 3.7.])[
  (Divisor reconstruction with separated variable spaces).  #emph[For $\( Y \, D \)$, allow arbitrary ordinary diagonal insertions and arbitrary ordinary descendants. Allow the two variables either as ordinary classes in $T_M$ or $W subset H^4 \( Y \)$, or as boundary classes in a tautological copy of $W$ in $H^(*) \( D \)$. Then relative tensors with two $T_M$ ends belong to $"pr"_M G_Y$, tensors with two $W$ ends are scalar cup pairings, and mixed tensors vanish.]
] <gw:divisor>

#proof[
  Fix a relative tensor $B_(upright("rel")) \( u \, v \)$ in numerical curve class $beta$ on $Y$, with relative list $mu = \( \( k_j \, delta_j \) \)_(j = 1)^L$. Thus $D dot.op beta = sum_(j = 1)^L k_j$. Use degeneration of $Y$ along $D$, with the same source cotangent convention, and translate a relative weight $\( k \, delta \)$ into $tau_(k - 1) \( j_(*) delta \)$ to form an absolute tensor $B_(upright("abs")) \( u \, v \)$ on $Y$ in the same numerical class $beta$, retaining the original ordinary insertions and descendants. Use the strict divisor-family lift for translated classes and pullbacks for original ordinary classes. This is the classical divisor correspondence of #cite(label("MP06")) Section 2.4, Lemma 4; we give the ordering needed for the restricted tensors.
  The ordinary $T_M$ part restricts to zero on $D$. The rational Hodge structures generated by boundary classes of Hodge difference $plus.minus 2$ are copies of $W$: for a surface center they are $p^(*) W subset H^2 \( D \)$ and $xi p^(*) W subset H^4 \( D \)$. Gysin carries the first into the exceptional $W$ summand of $H^4 \( Y \)$ and annihilates the second, since $H^6 \( Y \)$ is diagonal. Restriction of the ordinary exceptional class is $j^(*) j_(*) p^(*) u = - xi p^(*) u$. It follows from (3.6) that every associated absolute tensor has the claimed restriction. Local tensors have it by Lemma 13. This also treats a translated variable with zero Gysin class; the absolute tensor is then zero.
  Fix an integral ample divisor on $Y$ and perform outer strong induction on its curve degree, then on the number of original ordinary markings. As before, these are the ordinary markings before translation, and the induction is simultaneous for all numerical classes, relative data, labels, variable placements, and descendant exponents at the given index. Pruning replaces existing relative weights as in Lemma 14.
  Every main $Y$-vertex in a nontrivial tree has a joining root. Its curve class cannot be zero, since a zero class has total contact zero; its ample degree is therefore positive. Under collapse of the degeneration to $Y$, the projected component classes are effective and add to the original class $beta$. If there are several main vertices, all have smaller ample degree. A unique main vertex of smaller degree is also an earlier case. A main vertex with full degree is unique, and is an earlier case unless it retains all original ordinary markings. Thus in these cases induction controls every main path vertex and Lemma 13 controls every local one, as required by the conditional path rule. A path with no main vertex is controlled by the local lemma after pruning.
  At equal outer data the unique main vertex has curve class $beta$: all other components project to points of $Y$. They are fibre tails of $P_D arrow.r D$, since the graph is a tree. This argument uses the ample degree on $Y$, without requiring $D$ to be nef. Hence $K = D dot.op beta$, the total contact, is fixed. If $K < 0$ there is no admissible relative datum. A zero curve class has $K = 0$ and no relative marks; its constant tensors are scalar cup pairings, zero on mixed summands. More generally, for $K = 0$ the following inner induction has just the empty-list case.
  Let the new main relative list have length $t$, with tail contacts $k'_a$. If $J_a$ is the set of translated markings on tail $a$, the tail calculation (3.4) now applies with $r = 1$: the center of this normal-cone degeneration is the divisor $D subset Y$. Thus
  #[#set math.equation(numbering: n => "(3.8)")
   $ c_a = sum_(j in J_a) \( k_j - 1 \) - k'_a + 1 \, #h(2em) sum_a c_a = t - L . $ <gw:divisor-order>]
  Before applying the list order, use the tail-output factorization from the first reconstruction. A tail containing both variable slots gives $q_Z \( u \, v \)$ times fixed classes, so its whole graph contribution is already an allowed scalar pairing. In every other nonzero summand the variable slots remain separate: fixed diagonal classes act by scalars between the copies of $W$. The following inner induction applies to these summands.
  Each nonzero tail has $c_a gt.eq 0$. Therefore $t gt.eq L$. Use decreasing length as the next order; it terminates because $t lt.eq K$. This is an inner induction for each fixed $beta$, so no unbounded reversal of an order is being used.
  At equal lengths every $c_a$ is zero. Each tail has
  $ k'_a - 1 = sum_(j in J_a) \( k_j - 1 \) \, #h(2em) delta'_a = upright("a scalar times ") product_(j in J_a) delta_j . $
  Take all fixed labels homogeneous. Give $\( k_j \, delta_j \)$ weight $k_j - 1 + "codim" delta_j$. These weights are nonnegative. Each formal variable slot has a fixed cohomological degree, unchanged when its vector is specialized to zero or to the other vector. A boundary $W$ slot has positive codimension, so it always has positive weight. Combining two positive-weight labels on a tail decreases their number, so use that number, with smaller values first, as the final order. A strict decrease of this count is an earlier case with two separately labelled variable slots. If the number of positive-weight labels is unchanged, each tail has at most one positive-weight label. All other labels are $\( 1 \, 1 \)$, so every nontrivial contact and label is unchanged. Empty tails have degree one and identity output; redistribution of the trivial labels, at the fixed total length, consequently gives the original weighted partition, with each formal variable slot still distinguished.
  These unchanged-data terms cannot cancel. A tail carrying its one positive-weight label has the leading fibre invariant in (3.5), now for $r = 1$, with its positive gluing contact factor. An additional $\( 1 \, 1 \)$ label translates to an ordinary point-divisor insertion on $bb(P)^1$. By the divisor equation it multiplies the leading number by $k'_a$. The descendant correction contains the square of the fibre point class and vanishes. For the source cotangent convention this is the ordinary relative divisor equation with the divisor supported in the interior, disjoint from the relative boundary. A degree-one tail without translated markings contributes one. Thus every unchanged-data coefficient is a product of the same positive leading numbers and positive contact, divisor, and labeling factors. All path labels are even, so no permutation signs occur. The graph with one leading fibre tail for each relative entry is among these terms. Their sum is therefore a nonzero rational coefficient $C$, depending only on the fixed discrete data and the formal labels, not on the two variable vectors. For the empty list the coefficient is one. This is the nonvanishing part of the triangular coefficient calculation in #cite(label("MP06")) Section 2.4, Lemma 4; its exact normalization is not needed here.
  As before, the formula is an identity of bilinear tensors. All earlier terms are allowed by the simultaneous induction and the path lemma; division by the nonzero, vector-independent coefficient proves the three stated restrictions. Ordinary descendants at retained markings have not changed, and those at markings moved to a fibre occur only in the smaller ordinary-mark cases. Hence no bound or extra hypothesis on original descendants or ordinary diagonal insertions has been used. ◻
]

To finish Theorem 12, degenerate any absolute generator on $M$ along $Z$. Its two $T_M$ insertions have zero restriction to the normal bundle component, so they occur on the main side. By Lemma 16, a main vertex carrying both insertions supplies a tensor in $"pr"_M G_Y$ after its side branches are pruned. If the two insertions lie on different main vertices, the path leaves the first through a boundary copy of $W$. That vertex has one $T_M$ end and one $W$ end, so its tensor vanishes by the mixed row of the same lemma. When $W = 0$, there is no Hodge-difference-two boundary class through which such a path could pass. Local tensors and branch outputs are controlled by Lemmas 13 and 14. Thus each term, and hence this absolute generator, belongs to $"pr"_M G_Y$. Together with (3.6) this gives $G_M = "pr"_M G_Y$. The exceptional-line projector separates the other factor when it exists. This proves the theorem.

=== 3.5 Integral cancellation and the surface forced by rationality <integral-cancellation-and-the-surface-forced-by-rationality>

#thm([Lemma 3.8.])[
  (Whole blocks).  #emph[Along a smooth weak factorization starting at $bb(P)^4$, each transcendental lattice is an integral orthogonal sum of whole shifted surface-transcendental lattices. Its operator algebra is the product of independent rational scalar algebras on those summands. A blowdown with nonzero surface-transcendental contribution removes one whole summand, whose integral polarized Hodge-isometry class is that of the entire transcendental lattice of its center. A step with zero transcendental contribution leaves the decomposition unchanged.]
] <gw:blocks>

#proof[
  At $bb(P)^4$ the transcendental lattice is zero. A blowup with a nonzero surface contribution adds exactly one summand by Theorem 12; a blowup with no transcendental contribution does nothing. A blowdown with zero transcendental contribution also leaves the lattice and algebra unchanged by the same theorem. Suppose instead that the next step is a blowdown with nonzero surface contribution. The theorem, read in reverse, exhibits the removed center as a factor $bb(Q)$ of the operator algebra of the current variety. Its identity is a primitive central idempotent. The primitive central idempotents of the already identified algebra $bb(Q)^m$ are precisely the projectors onto its existing whole summands. Thus the removed rational subspace is one of those summands, even if some summands are mutually Hodge-isomorphic or a surface transcendental structure is reducible.
  The lattice of each summand is its intersection with the ambient integral lattice: the historical decomposition and the geometric blowup decomposition are integral direct sums. Equality of their rational subspaces therefore identifies their saturated integral lattices and cup forms. The residual summands are unchanged. This proves the induction. ◻
]

The numerical comparison below is the rank-twenty-one counterpart of the surface-classification argument in #cite(label("Kulikov08")) Lemma 3.

#thm([Lemma 3.9.])[
  (Rank twenty-one centers).  #emph[Let $Z$ be a smooth connected projective surface with $h^(2 \, 0) \( Z \) = 1$ and $"rank" T_Z = 21$. Then $Z$ is birational to a Picard-number-one K3 surface. Its primitive ample generator has square $\| "disc" T_Z \|$. If this square is $d > 2$ and $"End"_(upright("Hdg")) \( T_(Z \, bb(Q)) \) = bb(Q)$, that K3 surface has trivial automorphism group.]
] <gw:k3-center>

#proof[
  Geometric genus and the transcendental lattice are unchanged by point blowups. Pass to a minimal model using #cite(label("Beauville78")) Proposition II.16. In the following numerical calculation, $K$, $b_2$, and $q = h^(1 \, 0)$ refer to that minimal surface. Since $p_g = 1$, it is not ruled and has nonnegative Kodaira dimension #cite(label("Beauville78")) Propositions III.20–III.21 and Example VII.3. Its canonical class is nef #cite(label("Beauville78")) Corollary VI.18, so $K^2 gt.eq 0$. Noether’s formula #cite(label("Beauville78")) Sections I.14 and III.19 gives $c_2 = 12 \( 1 - q + p_g \) - K^2 = 24 - 12 q - K^2$. On the other hand its topological Euler characteristic is $c_2 = 2 - 4 q + b_2$. Hence
  $ b_2 = 22 - 8 q - K^2 . $
  Projectivity gives Picard rank at least one, while the rank assumption gives $b_2 gt.eq 22$. Thus $q = 0$, $K^2 = 0$, and the Picard rank is one. Kodaira dimension two is excluded by $K^2 = 0$ #cite(label("Beauville78")) Proposition X.1. In Kodaira dimension one the elliptic fibration #cite(label("Beauville78")) Proposition IX.2 supplies a nonzero isotropic divisor class, independent of an ample class, contradicting Picard rank one. The classification in Kodaira dimension zero leaves a K3 surface, since $p_g = 1$ and $q = 0$ #cite(label("Beauville78")) Theorem VIII.2.
  The K3 lattice is unimodular, and its Néron–Severi lattice is primitive by the integral Lefschetz $\( 1 \, 1 \)$ theorem #cite(label("VoisinHodge2016")) Theorem 2. For a primitive sublattice of a unimodular lattice, its discriminant group and that of its orthogonal have equal orders. The Néron–Severi lattice here is generated by a primitive ample class $L$, so its discriminant is $L^2$. This proves the degree assertion.
  Any automorphism fixes $L$ and hence acts trivially on this rank-one Néron–Severi lattice. Its action on $T_(Z \, bb(Q))$ is a rational scalar by the endomorphism hypothesis, and preservation of the nondegenerate form makes that scalar $+ 1$ or $- 1$. The unimodular gluing identifies the cyclic discriminant group of $T_Z$ with that of $bb(Z) L$, of order $d$; see #cite(label("Nikulin80")) Proposition 1.6.1 for the compatible gluing of primitive orthogonal sublattices of an even unimodular lattice. The action $- 1$ on the first and $+ 1$ on the second is compatible only if $2$ annihilates this cyclic group, contrary to $d > 2$. Thus the action is $+ 1$ on both lattices, and hence on the whole integral second cohomology. The faithful cohomological action for K3 automorphisms, a consequence of global Torelli #cite(label("Huybrechts16")) Proposition 15.2.1, makes the automorphism the identity. ◻
]

#thm([Proposition 3.10.])[
  (The contribution forced by rationality).  #emph[Let $M$ be a rationally connected smooth projective fourfold with 
$ h^(3 \, 1) \( M \) = 1 \, #h(2em) "rank" T_M = 21 \, #h(2em) \| "disc" T_M \| = d > 2 \, #h(2em) "End"_(upright("Hdg")) \( T_(M \, bb(Q)) \) = bb(Q) . $

 Let $cal(S)$ consist of the Picard-number-one K3 surfaces $S$ whose shifted integral transcendental lattice $\( T_S \( - 1 \) \, - q_S \)$ is Hodge-isometric to $\( T_M \, q_M \)$, and use this collection in the test $u$ of the preliminary section. If $f : bb(P)^4 arrow.r.dashed M$ is a birational map, then 
$ c_u \( f \) = 1 . $

 Every member of $cal(S)$ has degree $d$ and trivial automorphism group.]
] <gw:net-center>

#proof[
  Under the rationality assumption all varieties in the smooth factorization of Theorem 9 are rationally connected. Lemma 17 tracks integral whole blocks through the factorization. A nonzero transcendental rational Hodge structure of this kind has a nonzero off-diagonal part by Lemma 10. Since the final $h^(3 \, 1)$ is one, its transcendental structure is simple: a nontrivial semisimple decomposition would require at least two nonzero $\( 3 \, 1 \)$ parts. Thus the final lattice is one whole block. The number of additions minus removals of blocks in its integral polarized Hodge-isometry class is one.
  Every center in this class has geometric genus one, transcendental rank $21$, determinant of absolute value $d$, and rational Hodge endomorphism ring $bb(Q)$. Lemma 18 makes it birational to a member of $cal(S)$, and proves the degree and automorphism assertions. Conversely, a smooth surface center counted by $u$ is birational to a member of $cal(S)$: in dimension two an MRC base which is a K3 has the same function field as the surface. Its entire transcendental lattice therefore has exactly the required class. Point and curve centers are not counted.
  The exceptional divisor of a smooth blowup is a projective bundle over its center and has the same MRC base, by Lemma 6. The sign convention and additivity in Lemma 8 therefore identify $c_u \( f \)$ with the above number of block additions minus removals. This number is one. ◻
]

== 4 Uniform bounds for the link diagrams <bd:section>

This section supplies the uniform bounds used in the Sarkisov argument. Theorem 22 converts bounded varieties and marked covers into degree bounds for K3 tests. We then construct a central model at each Sarkisov wall, preserving a fixed discrepancy bound, and recover the link as contractions of that model. Theorem 28 bounds these diagrams on geometric generic fibres, including the maps and marked bad loci that control the branch locations of later covers. Theorem 30 separately bounds models extracting only low-discrepancy valuations from a bounded log-Fano pair; this will control a relative minimal model without bounding its resolving start. Finally, Corollary 32 first fixes one ramification coefficient from the ordinary fourfold diagrams; only then do we bound the auxiliary log diagrams and choose the final K3 degree threshold.

=== 4.1 Elementary exclusions for K3 fields <elementary-exclusions-for-k3-fields>

In this subsection a #emph[degree-$d$ K3 surface] means a smooth projective K3 surface $S$ with $"Pic" \( S \) = bb(Z) L$, where $L$ is ample and $L^2 = d$. All the bounds below are independent of the choice of $S$, and therefore also of any further restriction on its transcendental Hodge structure or automorphism group.

#thm([Lemma 4.1.])[
  (Pencils on a K3 surface).  #emph[Let $S$ be a degree-$d$ K3 surface. If a dominant rational map from $S$ to a smooth projective curve has connected general fibre, that curve is $bb(P)^1$. If $g$ is the genus of the smooth general fibre on a resolution of the map, then 
$ 2 g - 2 gt.eq sqrt(d) . $

 For an arbitrary dominant rational map to a curve the same inequality holds for every geometric general fibre component, after normalization.]
] <bd:pencil>

#proof[
  Resolve the map by point blow-ups $pi : Y arrow.r S$. Since $h^1 \( Y \, cal(O)_Y \) = 0$, pullback of differentials shows that the base of its Stein factorization has genus zero. Thus, after Stein factorization, we have a morphism $f : Y arrow.r bb(P)^1$ with smooth connected general fibre $F$. The images on $S$ of these fibres form a pencil without fixed components, of class $n L$ for some integer $n gt.eq 1$. In the total-transform basis of the successive exceptional curves write
  $ F = pi^(*) \( n L \) - sum_i m_i E_i^(*) \, #h(2em) K_Y = sum_i E_i^(*) \, #h(2em) m_i gt.eq 0 . $
  The exceptional basis is orthogonal, with $\( E_i^(*) \)^2 = - 1$. Consequently adjunction and $F^2 = 0$ give
  $ sum_i m_i^2 = n^2 d \, #h(2em) 2 g - 2 = K_Y dot.op F = sum_i m_i . $
  It follows that $2 g - 2 gt.eq \( sum_i m_i^2 \)^(1 \/ 2) = n sqrt(d)$. Stein factorization accounts for the geometric components in the last assertion. ◻
]

We use the following precise boundedness conventions. A collection of projective varieties is #emph[bounded] if its members occur as geometric fibres of finitely many projective morphisms of schemes of finite type. It is #emph[birationally bounded] if each member is birational to such a fibre. For pairs $\( Y \, D \)$, boundedness includes the reduced proper closed subset $D subset.neq Y$: it must be supplied by a closed subset of the same family. A finite cover of $\( Y \, D \)$ means the normalization of $Y$ in a finite field extension, required to be #emph[étale over $Y \\ D$]. Thus the boundary hypothesis controls branch locations, not just the degree of the extension.

Here and below one can choose a bounded collection of smooth projective birational models of the irreducible components of a bounded collection. To justify this operation, work on an irreducible parameter space, separate its geometric generic components by a finite extension of the function field, resolve them, and spread the resolutions. After shrinking, the spread models are smooth and the maps are birational on the appropriate fibre components. Apply the same construction to the remaining closed subset. Noetherian induction terminates this procedure. The same argument works with a marked closed subset, using embedded resolution and including the exceptional locus in the new boundary. It also proves that irreducible components of fibres of a fixed projective family, and smooth projective models of those components, are birationally bounded. These operations allow finite base changes of parameter spaces; they impose no bound on a particular map from one member to another.

#thm([Lemma 4.2.])[
  (Bounded threefolds and their K3 quotients).  #emph[For a birationally bounded collection of varieties of dimension at most three, there is an integer $b$ such that any degree-$d$ K3 surface birational to the MRC base of a member satisfies $d lt.eq b$.]
] <bd:bounded-mrc>

#proof[
  First consider a bounded smooth projective surface $Y$ birational to $S$. Its minimal-model morphism $mu : Y arrow.r S$ is a succession of point blow-downs. Let $A$ be a very ample divisor from the bounded family. In the total-transform exceptional basis,
  $ A = mu^(*) B - sum_i a_i E_i^(*) \, #h(2em) K_Y = sum_i E_i^(*) \, #h(2em) a_i = A dot.op E_i^(*) > 0 . $
  The pushforward $B$ is ample: at each blow-down its square increases and its intersection with every curve is positive, so the surface Nakai–Moishezon criterion applies #cite(label("Cartier66")) Theorem 1. It is an integral multiple of $L$. Hence
  #[#set math.equation(numbering: n => "(4.1)")
   $ d lt.eq B^2 = A^2 + sum_i a_i^2 lt.eq A^2 + \( A dot.op K_Y \)^2 . $ <bd:surface-degree>]
  The right-hand side takes only finitely many values in a bounded smooth projective family after a finite stratification. This proves the assertion in dimension two; in smaller dimensions a K3 MRC base is impossible.
  It remains to bound the birational types of the K3 bases of bounded smooth projective threefolds. Put these threefolds into finitely many smooth projective families $cal(X) arrow.r T$, with relatively very ample divisor $H$. We use the fixed-polynomial Hilbert space and its open graph locus #cite(label("StacksProject057")) Tags 0DPH, 0D1A and 0D1B, together with semicontinuity and base change #cite(label("StacksProject057")) Tags 0BDN and 0B91. For $e gt.eq 1$, the free locus in the relative scheme of degree-$e$ maps $bb(P)^1 arrow.r cal(X) \/ T$ is open. Its morphism to $T$ is smooth: for a free map $a$ the obstruction space $H^1 \( bb(P)^1 \, a^(*) T_(cal(X)_t) \)$ vanishes. Its image is therefore open. If $U_D$ is the union of these images for $1 lt.eq e lt.eq D$, then the $U_D$ are ascending open subsets of the noetherian space $T$. Their union is precisely the locus of uniruled geometric fibres, since in characteristic zero a smooth projective variety is uniruled if and only if it has a nonconstant free rational curve. The union is quasi-compact, so $U_D$ equals that union for some $D$. These deformation statements follow, for example, from #cite(label("AraujoKollar02")) Remark 9, Proposition 10 and Theorem 15; this argument proves the uniformity rather than assuming that the uniruled fibres themselves form a separately specified family.
  Suppose now that the MRC quotient of $X = cal(X)_t$ is a surface birational to $S$. Use its almost-holomorphic presentation $r : U arrow.r S^compose$ with proper smooth rationally connected fibres; see #cite(label("Kollar96")) Chapter IV, Section 5. Its fibres are smooth copies of $bb(P)^1$. A degree-at-most-$D$ free map on $X$ deforms in a covering family. A very general member meets a very general fibre of $r$ and is contained in it, by the MRC property. Since that fibre is a complete integral curve, the image of the map is the whole fibre. The $H$-degree $e$ of the fibre is thus at most $D$.
  For such a fibre $F$, smoothness of $r$ gives $N_(F \/ X) tilde.eq cal(O)_(bb(P)^1)^(xor 2)$. Its Hilbert scheme is therefore smooth of dimension two at $\[ F \]$. The family of fibres defines an injective map from $S^compose$ to this Hilbert scheme, with isomorphic tangent spaces; its closure is an irreducible component of $"Hilb"^(e n + 1) \( X \)$ birational to $S$. The components so obtained are components of fibres of the finite-type projective scheme
  $ product.co_(e = 1)^D "Hilb"^(e n + 1) \( cal(X) \/ T \) . $
  They have bounded smooth projective birational models by the preceding bounded-family reduction. Apply (4.1) to these surfaces. This proves a uniform bound independent of the threefold and of its MRC quotient map. ◻
]

#thm([Theorem 4.3.])[
  (Bounded data exclude large K3 degrees).  #emph[Fix the finite-type families occurring in each of the following statements, and fix an integer $N gt.eq 1$. There is an integer $b$, depending only on these families and on $N$, with the following properties.]
  + #emph[No member of a specified birationally bounded collection of varieties of dimension at most three has a degree-$d$ K3 MRC base with $d > b$.]
  + #emph[Let $\( Y \, D \)$ range over a bounded collection of projective curve or surface pairs. The smooth projective curves covering the curve members with degree at most $N$, #emph[étale off $D$], have bounded genus. No surface field obtained by such a cover of a surface member is the field of a degree-$d$ K3 surface for $d > b$.]
  + #emph[Let $T arrow.r.dashed C$ be a dominant map from an integral complex surface to a smooth projective curve. Suppose each normalized geometric generic fibre component is a degree-at-most-$N$ cover of a member of a fixed bounded collection of curve pairs, #emph[étale off the marked boundary]. Then $T$ is not birational to a degree-$d$ K3 surface for $d > b$.]
  + #emph[Let $T arrow.r.dashed C$ be a dominant map from an integral complex threefold to a smooth projective curve. Suppose the geometric generic fibre components are uniruled and belong to a fixed birationally bounded collection of surfaces. Then the MRC base of $T$ is not a degree-$d$ K3 surface for $d > b$.]
  #emph[The bounded geometric data in (iii) and (iv) are understood after algebraic closure of $bb(C) \( C \)$; neither the total spaces $T$ nor the maps to $C$ are required to be bounded. The assertions apply to each field factor of a finite algebra separately.]
] <bd:exclusions>

#proof[
  Part (i) is Lemma 21. For (ii), pass to bounded smooth projective models of the pairs, including the exceptional locus in the boundary. The normalized base-changed covers are still #emph[étale] on the complementary open. For a smooth curve $A$ of genus $g_A$ with at most $r$ marked points, and a connected degree-$e$ cover $A' arrow.r A$ unramified elsewhere, Riemann–Hurwitz gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ 2 g \( A' \) - 2 lt.eq e \( 2 g_A - 2 \) + \( e - 1 \) r . $ <bd:hurwitz>]
  Indeed, over any one branch point the ramification contribution is $e$ minus the number of points above it, and is at most $e - 1$. This proves the curve assertion uniformly for $e lt.eq N$.
  For a bounded smooth surface pair choose a pencil of hyperplane sections for a relatively very ample divisor $H$. A general section $A$ is smooth, has uniformly bounded genus by adjunction, and meets the divisorial part of $D$ in uniformly boundedly many points. Choose it to avoid the zero-dimensional part of $D$. For any one cover, general members can also avoid the images of the singular points of its normalization; normal surfaces have only finitely many singular points. Each normalized component over $A$ has degree at most $N$ and is ramified only over $A ∩ D$, so (4.2) gives a uniform genus bound $G$. Resolve the pulled-back pencil on a smooth model of the covering surface and take its Stein factorization. Its smooth connected general fibres are precisely these normalized components. If the surface field were that of $S$, Lemma 20 would give $sqrt(d) lt.eq 2 G - 2$. This proves the surface assertion. The pencil can depend on the individual cover; only its genus and boundary-intersection bounds need to be uniform.
  The same curve estimate over $overline(bb(C) \( C \))$ bounds the genera of the geometric generic components in (iii). If $T$ were birational to $S$, the given map to $C$, after resolution and Stein factorization, would give a pencil on $S$. Lemma 20 again bounds $d$. No genus bound for the parameter curve $C$ is needed.
  For (iv), suppose the MRC base of $T$ is birational to $S$, and write $r : T arrow.r.dashed S$ and $f : T arrow.r.dashed C$. Put $F = bb(C) \( C \)$ and choose an algebraic closure $overline(F)$. Resolve the maps when necessary. If $f$ were nonconstant on a general fibre of $r$, the map $\( r \, f \) : T arrow.r.dashed S times C$ would be dominant and generically finite. A component of a geometric generic surface fibre of $f$ would then dominate $S_(overline(F))$ generically finitely. Such a component is uniruled, whereas a generically finite dominant image of an uniruled surface is uniruled. This contradicts the fact that a K3 surface is not uniruled in characteristic zero.
  Consequently $f = h compose r$ for a dominant rational map $h : S arrow.r.dashed C$. This is descent along the geometrically integral general fibres of the MRC quotient, or equivalently the relative algebraic closedness of $bb(C) \( S \)$ in $bb(C) \( T \)$. Resolve $h$ and take its Stein factorization. Over $overline(F)$, let $Gamma$ be a smooth geometric generic fibre of the resulting connected-fibre pencil, of genus $g$. A geometric generic component $P$ of $f$ dominates the corresponding $Gamma$. For a smooth projective model $tilde(P)$ over $overline(F)$ this implies
  $ g lt.eq h^0 \( tilde(P) \, Omega_(tilde(P))^1 \) = h^1 \( tilde(P) \, cal(O)_(tilde(P)) \) . $
  To see the inequality, resolve the rational map to $Gamma$ and pull back regular one-forms; pullback is injective for a dominant map in characteristic zero, and irregularity is a birational invariant of smooth projective surfaces. The irregularities of $tilde(P)$ are uniformly bounded by bounded smooth projective birational models and upper semicontinuity. Lemma 20 therefore bounds $d$.
  All genus, intersection, and coherent-cohomology bounds used here are preserved by extension of algebraically closed fields. The same proofs therefore apply to the geometric generic data specified in (iii) and (iv). Taking the maximum of the finitely many bounds proves all the assertions. ◻
]

=== 4.2 Central models for the two Sarkisov programs <central-models-for-the-two-sarkisov-programs>

The boundedness problem starts with a wall in a Sarkisov factorization. We first construct a central model that retains the prime valuations of the link and a fixed lower bound for log discrepancies. Its geometric generic fibre will supply the log-Fano pair to which boundedness is applied. The next subsection will then recover the contraction maps and their marked loci from these pairs.

For a pair $\( Y \, B \)$ we write $a \( F \, Y \, B \)$ for #emph[log discrepancy]; a prime divisor on $Y$ of coefficient $b$ has log discrepancy $1 - b$. A pair is $epsilon.alt$-lc if every log discrepancy is at least $epsilon.alt$. Terminality concerns exceptional divisors and means $a \( F \, Y \, B \) > 1$ for such divisors. In particular, terminality of the underlying variety is used for the ordinary Sarkisov program, whereas only a fixed positive lower bound for log discrepancies is needed for the auxiliary log program.

A variety is of #emph[Fano type] if it admits an effective rational boundary making it klt log Fano. We use the relative version over a base as well. By finite generation, a $bb(Q)$-factorial variety of Fano type is a Mori dream space: its movable cone has finitely many semiample chambers, and an MMP for any divisor terminates #cite(label("BCHM10")) Corollary 1.3.2. The chamber description includes the contraction associated with each face #cite(label("HuKeel00")) Proposition 1.11. The contraction and relative basepoint-free statements we use are #cite(label("FujinoFoundationsDraft057")) Theorem 4.5.2 and Corollary 6.9.4. For the sign and uniqueness of exceptional differences we use the negativity lemma #cite(label("KollarFamiliesDraft057")) Lemma 11.60.

A #emph[contraction morphism] is a projective surjective morphism $f : Y arrow.r Z$ of normal varieties with $f_(*) cal(O)_Y = cal(O)_Z$. A #emph[birational contraction] is a birational map whose inverse contracts no divisor. A #emph[small modification] is a birational map that is an isomorphism in codimension one. A #emph[small $bb(Q)$-factorialization] is a projective small birational morphism with $bb(Q)$-factorial source. For a $bb(Q)$-factorial Fano-type source $Y$, a #emph[rational contraction] means a composite $Y arrow.r.dashed Y' arrow.r Z$, where the first map is a small $bb(Q)$-factorial modification and the second is a contraction morphism. The target $Z$ need only be normal and projective. We use the same definition over an indicated base, with both maps over that base.

For an integral Weil divisor $D$ on a normal projective variety $Y$, write

$ R \( Y \, D \) = xor.big_(m gt.eq 0) H^0 \( Y \, cal(O)_Y \( m D \) \) \, $

where $cal(O)_Y \( m D \)$ is the divisorial reflexive sheaf. For a rational divisor we use a sufficiently divisible integral multiple; further Veronese subrings do not change $"Proj"$. In the finitely generated cases used below, the induced rational map $Y arrow.r.dashed "Proj" R \( Y \, D \)$ is its #emph[ample-model map].

We use the ample-model formulation of the Sarkisov theorem #cite(label("HM13")) Theorem 1.3, Theorem 3.3, Theorem 3.7, and Lemma 4.1. Start with two Mori fibre-space outcomes of one klt $K_W + Phi$ program on a smooth projective variety $W$. The theorem connects them using a finite-dimensional family of klt boundaries $Theta$ with $Theta - Phi$ ample on $W$; this family and its ample models are the #emph[geography] used below. All paths whose diagrams we bound below are chosen from this geography.

At a linking wall, let $N_1 \, N_2$ be the $bb(Q)$-factorial middle models on the two sides. The local diagram supplied by the two-ray construction is

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$N_1$])
  content((4.379, 0), [$N_2$])
  content((0, -0.8918), [$V_1$])
  content((4.379, -0.8918), [$V_2$])
  content((0, -1.784), [$B_1$])
  content((4.379, -1.784), [$B_2$])
  content((2.189, -2.675), [$Q$])
  line((0.468, 0), (3.911, 0), stroke: (dash: "dashed"), mark: (end: ">"))
  content((2.189, 0.2266), [#text(size: 0.73em)[$upright("small over ") Q$]])
  line((0, -0.2725), (0, -0.6193), mark: (end: ">"))
  content((0.4186, -0.4459), [#text(size: 0.73em)[$e_1$]])
  line((4.379, -0.2725), (4.379, -0.6193), mark: (end: ">"))
  content((4.797, -0.4459), [#text(size: 0.73em)[$e_2$]])
  line((0, -1.164), (0, -1.511), mark: (end: ">"))
  content((0.3705, -1.338), [#text(size: 0.73em)[$pi_1$]])
  line((4.379, -1.164), (4.379, -1.511), mark: (end: ">"))
  content((4.749, -1.338), [#text(size: 0.73em)[$pi_2$]])
  line((0.4014, -1.947), (1.901, -2.558), mark: (end: ">"))
  content((1.021, -2.572), [#text(size: 0.73em)[$q_1$]])
  line((3.977, -1.947), (2.478, -2.558), mark: (end: ">"))
  content((3.357, -2.572), [#text(size: 0.73em)[$q_2$]])
})

Each $N_i arrow.r Q$ has relative Picard rank two. The arrow $e_i$ is either the identity or an elementary divisorial contraction; $pi_i$ is the end Mori fibre contraction, of relative rank one. Additivity of the relative ranks in these morphism towers gives

#[#set math.equation(numbering: n => "(4.3)")
 $ 2 = rho \( N_i \/ Q \) = rho \( N_i \/ V_i \) + 1 + rho \( B_i \/ Q \) . $ <bd:rank-tower>]

These are ranks over the original common base $Q$, before any extension of its function field. The arrows $q_i$ may be small contractions. All maps $W arrow.r.dashed N_i$ are birational contractions, and the transforms of $K_W + Theta$ on the $N_i$ are semiample and pulled back from $Q$. Thus the middle small models share their prime valuations; the divisorial exits $e_i$ can remove valuations.

The uniformity we need is a deduction from this construction, not an assumption that arbitrary Fano-type varieties are bounded.

A relative negative program over a projective target is also a negative program in the absolute category used here. Indeed its cone of contracted curves is the face cut out by the pullback of an ample divisor on that target; a negative extremal ray of this face is extremal in the full cone. The contractions and flips remain projective. Thus a program run first over one projective target and then over another, for example over $T$ and then over $Q$, is an allowed common-start program. Its final relative rank-one fibre contraction is a Mori fibre space in this category.

#thm([Lemma 4.4.])[
  (A bounded-discrepancy central model).  #emph[Consider a wall in this geography on a smooth projective start $\( W \, Phi \)$. Assume that $\( W \, Phi \)$ is $epsilon.alt$-lc. Then the relative small models in the link have a common set of prime valuations and admit a small modification $N^(upright(c)) \/ Q$ such that 
$ - \( K_(N^(upright(c))) + Phi_(N^(upright(c))) \) quad upright("is nef and big over ") Q . $

 Its log-anticanonical ample-model map $N^(upright(c)) arrow.r Z^(upright(c))$ is small. Both $N^(upright(c))$ and $Z^(upright(c))$ are $epsilon.alt$-lc with their transformed boundaries. All the link vertices and contraction bases are rational contractions of a small $bb(Q)$-factorialization of $Z^(upright(c))$. If $Phi = 0$, all the small models can be taken terminal.]
] <bd:central>

#proof[
  Take $N = N_1$ in the displayed wall diagram, let $A = Theta - Phi$ be the ample difference on $W$, and write $A_N \, Theta_N \, Phi_N$ for transforms. We first transfer the discrepancy bound from $W$ to $N$. We then make the original log-anticanonical class nef and pass to its ample model. That last map must be small: a divisorial contraction would lose one of the prime valuations we need to retain. On a graph resolution with projections $p$ to $W$ and $q$ to $N$,
  #[#set math.equation(numbering: n => "(4.4)")
   $ p^(*) \( K_W + Theta \) - q^(*) \( K_N + Theta_N \) & = E_Theta gt.eq 0 \,\
p^(*) A - q^(*) A_N & lt.eq 0 . $ <bd:wall-comparison>]
  For this comparison at the wall, approach $Theta$ by interior parameters $Theta_i$ in the chamber defining $N$. By #cite(label("HM13")) Theorem 3.3(3), $W arrow.r.dashed N$ is a log terminal model for $K_W + Theta_i$, so the exceptional difference on the same graph resolution is effective. Its finitely many coefficients depend linearly on the boundary. Taking their limits gives $E_Theta gt.eq 0$; #cite(label("HM13")) Theorem 3.3(2) supplies the contraction $N arrow.r Q$. Thus the first difference is exceptional and nonnegative at the wall. The second is also $q$-exceptional, since the map does not extract. On a $q$-contracted curve its degree equals that of $p^(*) A$, so it is $q$-nef; the negativity lemma proves (4.4). Subtracting gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ p^(*) \( K_W + Phi \) - q^(*) \( K_N + Phi_N \) gt.eq 0 . $ <bd:original-comparison>]
  It follows valuation by valuation that the original $epsilon.alt$-lc bound is retained on $N$.
  There is a useful extension of this argument. The divisor $K_N + Theta_N$ is pulled back from $Q$. Any small $bb(Q)$-factorial modification $N' arrow.r Q$ has the same codimension-one divisor and the same pullback relation. Thus $N arrow.r.dashed N'$ is crepant for $K_N + Theta_N$. The comparison (4.4) remains nonnegative for $W arrow.r.dashed N'$, and the ample subtraction proves (4.5) for $N'$ as well. In particular, the bound holds on any required relative small chamber; there is no need to locate all those chambers in one chosen two-dimensional slice.
  The pair $\( N \, Theta_N \)$ is klt, its boundary is big over $Q$, and its log-canonical divisor is trivial over $Q$. Writing that boundary, up to relative rational linear equivalence, as an ample divisor plus an effective divisor, a sufficiently small perturbation makes a klt log-Fano boundary. Therefore $N \/ Q$ is of Fano type. Furthermore,
  $ - \( K_N + Phi_N \) equiv_Q A_N . $
  The transform of an ample class by a birational contraction is in the interior of the movable cone: choose divisor classes on $W$ mapping onto a basis on $N$, perturb $A$ slightly in both directions in this basis, and push their ample systems forward. No prime divisor is fixed, because none is extracted. The same argument works after passing to the relative numerical space over $Q$.
  Finite generation now makes this movable class nef on a small model $N^(upright(c)) \/ Q$. Only small steps are needed: a negative divisorial contraction would force its exceptional divisor to be fixed in the corresponding system. The class is big, and its semiample contraction cannot be divisorial because it lies in the interior of the movable cone. Indeed a nef class vanishing on curves covering a contracted divisor lies on the boundary of the movable cone, as follows by intersecting those curves with effective divisors avoiding that divisor. Its ample-model map $N^(upright(c)) arrow.r Z^(upright(c))$ is therefore small. The log-canonical divisor is crepant for this last contraction, so the discrepancy bound passes to $Z^(upright(c))$. Its small $bb(Q)$-factorializations have precisely the common prime valuations of the link. In particular, $N^(upright(c)) arrow.r Z^(upright(c))$ is one such small $bb(Q)$-factorialization, and $N^(upright(c)) arrow.r.dashed N_i$ is small for $i = 1 \, 2$. Composing with the contraction towers $N_i arrow.r V_i arrow.r B_i arrow.r Q$ in the wall diagram gives exactly the rational contractions asserted in the statement.
  When $Phi = 0$, exceptional valuations above $W$ already have log discrepancy greater than one. A divisor of $W$ that is contracted has a strictly negative coefficient in (4.4): intersect with a general curve in its positive-dimensional contracted fibre, on which $A$ has positive degree. Its coefficient in (4.5) is consequently strictly positive. This gives terminality also for these remaining exceptional valuations. The same reasoning applies to each small model as above. ◻
]

To compare higher smooth starts, we use the following SNC discrepancy estimate. Let $\( R \, Gamma \)$ be a smooth pair with SNC support and rational coefficients $b_i < 1$, allowing negative coefficients, and let $F$ be an exceptional divisorial valuation. At the generic point of its center of codimension $r$, choose regular parameters $x_1 \, dots.h \, x_r$ containing the equations of the boundary components through that center. Then

#[#set math.equation(numbering: n => "(4.6)")
 $ a \( F \, R \, Gamma \) gt.eq sum_(i = 1)^r \( 1 - b_i \) "ord"_F \( x_i \) \, $ <bd:snc-discrepancy>]

where $b_i = 0$ for parameters not defining a boundary component. This follows from the Jacobian formula for a divisorial valuation over a regular local ring, followed by subtracting the boundary orders. All orders are positive integers.

#thm([Lemma 4.5.])[
  (Higher common starts preserve the original marks).  #emph[Let $\( W \, Phi \)$ be smooth projective with SNC boundary whose coefficients belong to ${ 0 \, c }$, where $0 < c < 1 \/ 4$ and $dim W lt.eq 3$. Suppose two Mori fibre spaces are outputs of negative $\( K_W + Phi \)$ programs. On a higher smooth common start resolving the maps to both endpoints, keep the marks on original prime divisors and assign coefficient either $0$ or $c$ to any new prime divisor, with SNC total support. The same two outputs remain outcomes of the program for this new marked pair. In its geography the original marked discrepancy bound can be taken to be $epsilon.alt = 1 - c$, independently of the higher start. The analogous assertion holds for ordinary terminal Mori fibre spaces with zero boundary and $epsilon.alt = 1$, including the four-dimensional paths used below.]
] <bd:higher-start>

#proof[
  Write $\( W' \, Phi' \)$ for the higher smooth start with its new marking. On the original smooth SNC pair, every exceptional valuation has log discrepancy greater than one: (4.6) gives the bound $2 \( 1 - c \) > 1$ for rational $c$. For irrational $c$, apply it to rational coefficients decreasing to $c$ and use the affine dependence of log discrepancy on the boundary coefficients. The non-exceptional divisors have discrepancy at least $1 - c$. These facts also hold on the new smooth SNC start directly, without comparing the number of its exceptional divisors.
  Fix one endpoint $V$ and write $f : W' arrow.r V$ for the resolved map. For a divisor of $W$ contracted by its negative program, discrepancy strictly improves. If its retained marking is $b in { 0 \, c }$, then on the higher start its coefficient in the difference from the pullback of $K_V + Phi_V$ is
  $ a \( F \, V \, Phi_V \) - 1 + b > 0 . $
  For a divisor exceptional over $W$, monotonicity gives $a \( F \, V \, Phi_V \) gt.eq a \( F \, W \, Phi \) > 1$, and adding a new mark $b gt.eq 0$ again makes this coefficient positive. Thus the entire difference over $V$ is effective with strictly positive coefficients on every endpoint-exceptional divisor.
  Run the relative program over $V$. Existence follows from relative bigness for a birational morphism #cite(label("BCHM10")) Theorem 1.2. At a relative minimal model the exceptional difference is nef over $V$ and hence nonpositive by negativity. Since all the above positive exceptional coefficients must have been contracted, the resulting map to $V$ is small. A projective small birational morphism to a $bb(Q)$-factorial variety is an isomorphism. This realizes the same endpoint, after which its Mori contraction can be used. The argument works for both endpoints.
  We spell out the endpoint perturbations from #cite(label("HM13")) Lemma 4.1. Write $f_i : W' arrow.r V_i$ for the two resolved maps and $pi_i : V_i arrow.r B_i$ for their Mori contractions. Choose small general effective ample rational divisors $A \, H_1 \, dots.h \, H_s$, with the classes of the $H_j$ spanning $N^1 \( W' \)$, and put $H = A + sum_j H_j$. If $c$ is irrational, also choose a rational boundary $Phi_0 lt.eq Phi'$ sufficiently close to $Phi'$; for rational $c$ take $Phi_0 = Phi'$. Make these choices so that $A + Phi_0 - Phi'$ is ample, both $f_i$ are $\( K_(W') + Phi_0 + H \)$-negative, and $- \( K_(V_i) + \( f_i \)_(*) Phi_0 + \( f_i \)_(*) H \)$ is $pi_i$-ample. The exceptional differences have finitely many strictly positive coefficients, which stay positive under these small changes; the ampleness conditions are open as well. For a sufficiently positive ample rational divisor $C_i$ on $B_i$, the divisor
  $ L_i = - \( K_(V_i) + \( f_i \)_(*) Phi_0 + \( f_i \)_(*) H \) + pi_i^(*) C_i $
  is ample. Choose a general effective rational representative $F_i^(V_i) tilde.op_(bb(Q)) L_i$ and put $F_i = f_i^(*) F_i^(V_i)$. Then
  $ Theta_i = Phi_0 + H + F_i \, #h(2em) K_(V_i) + \( f_i \)_(*) Theta_i tilde.op_(bb(Q)) pi_i^(*) C_i . $
  Here $Theta_i - Phi'$ is ample: it is the sum of the ample divisor $A + Phi_0 - Phi'$ and the nef divisors $H_j \, F_i$. Simultaneous general representatives of sufficiently divisible multiples make the dominating pair $\( W' \, Phi' + H + F_1 + F_2 \)$ klt. The negativity of $f_i$ therefore makes $B_i$ the required endpoint ample model. The spanning classes $H_j$ and general two-dimensional slice in #cite(label("HM13")) Lemma 4.1 complete these two perturbations to one geography, retaining $Phi'$ as the fixed original boundary. Lemma 23 now uses the unchanged lower bound $1 - c$. With zero boundary the same proof starts from the strictly positive discrepancies of terminal endpoints. ◻
]

=== 4.3 Bounded marked pairs and their contraction diagrams <bounded-marked-pairs-and-their-contraction-diagrams>

The central models preserve the discrepancy bound independently of the chosen start. To bound the resulting links, we must control more than these varieties: the contraction maps and their marked bad loci determine the branch locations of the finite covers used later. We now prove this upgrade for bounded log-Fano pairs. Theorem 28 will combine it with Birkar’s boundedness theorem for the central models.

In a #emph[marked contraction diagram], the marks are finitely many closed subsets, including specified divisors, and the arrows are birational contractions or contraction morphisms. Diagrams are considered up to compatible isomorphisms of their vertices; the birational arrows use the common identification of function fields. More precisely, every vertex field is embedded in the field of the initial variety and every arrow respects these embeddings; in particular, a cycle of birational arrows induces the identity on that field. Boundedness requires families for the vertices, marks, and graphs of the arrows. In the contraction diagrams constructed below, the arrows are the ample-model maps with these field identifications. For a rational contraction we record both its factorization arrows and the graph of their composite. Graph resolutions will be chosen from the resulting finite-type families. Repetition of a vertex or arrow does not add new data.

We first address the family issue that occurs when boundedness is initially given without a relative $bb(Q)$-Cartier divisor.

#thm([Lemma 4.6.])[
  (Stratification of the marked log-Fano data).  #emph[Let $cal(P)$ be a bounded collection of marked projective klt log-Fano pairs $\( Y \, B \)$, with coefficients of $B$ in a fixed finite subset of $bb(Q)$. Finitely many stratified families, after finite base changes of their parameter spaces, can be chosen so that:]
  + #emph[the log-canonical divisor is relatively $bb(Q)$-Cartier, with a common Cartier multiple on each stratum;]
  + #emph[there is a simultaneous log resolution of the marked support, and the coefficients of the crepant pullback of $B$ are constant on each stratum;]
  + #emph[any further specified rational Weil divisor, with bounded marked support and coefficients in a fixed finite subset of $bb(Q)$, which is $bb(Q)$-Cartier for every member has a common Cartier multiple on each stratum, and its exceptional pullback coefficients are constant.]
  #emph[The same assertions about $bb(Q)$-Cartier classes hold for a bounded collection of varieties with rational singularities whose smooth projective resolutions have $H^1 \( cal(O) \) = H^2 \( cal(O) \) = 0$. In these families $bb(Q)$-factoriality is a constructible condition.]
] <bd:cartier-strata>

#proof[
  We give the generic argument, and then apply noetherian induction. Take the closure of the parameter points under consideration and an irreducible component of this closure. After shrinking and a generically finite base change, we have flat normal geometric fibres $cal(Y)_t$, a family $pi : cal(R) arrow.r cal(Y)$ of resolutions, and smooth projective fibres $cal(R)_t$ on which the marked strict transforms and exceptional divisors form a relative SNC divisor. The individual exceptional components can also be separated by this base change. These are the usual spreading operations on a resolution of the geometric generic fibre.
  For the members in question, rational singularities and vanishing give
  $ H^i \( cal(Y)_t \, cal(O)_(cal(Y)_t) \) = H^i \( cal(R)_t \, cal(O)_(cal(R)_t) \) = 0 quad \( i = 1 \, 2 \) . $
  For log-Fano pairs, the downstairs vanishing follows from Kawamata–Viehweg vanishing and the equality follows from rational singularities; see #cite(label("FujinoFoundationsDraft057")) Theorem 3.13.1 and Corollary 5.7.7. The parameter points of these members are Zariski dense in the closure chosen above. Thus they satisfy the dense-subset hypothesis of the relative Picard-space theorem #cite(label("CLZ26")) Theorem 1.3: rational singularities and $H^1 \( cal(O) \) = H^2 \( cal(O) \) = 0$ are required on that dense subset. Upper semicontinuity also gives the displayed vanishings on an open set. The theorem permits a further generically finite base change and shrinking such that the rational numerical divisor spaces of $cal(Y)_t$ and $cal(R)_t$, their pullback map, and the exceptional divisor classes are identified with fixed rational linear data. In particular, choose relative Cartier divisors whose classes span the downstairs space on every fibre.
  Here is the required $bb(Q)$-Cartier criterion. For a rational Weil divisor $D$ on a fibre, let $tilde(D)$ be its strict transform. Then
  #[#set math.equation(numbering: n => "(4.7)")
   $ D upright(" is ") bb(Q) upright("-Cartier") quad arrow.l.r.double quad \[ tilde(D) \] in pi^(*) N^1 \( cal(Y)_t \)_(bb(Q)) + sum_E bb(Q) \[ E \] med subset N^1 \( cal(R)_t \)_(bb(Q)) . $ <bd:cartier-test>]
  The forward implication follows by pullback. For the converse, numerical equivalence of rational divisors on $cal(R)_t$ is rational linear equivalence: its $"Pic"^0$ vanishes, and the numerically trivial part of the Néron–Severi group is torsion. Thus the asserted relation, after clearing denominators, is a linear-equivalence relation with a Cartier divisor pulled back from $cal(Y)_t$ and exceptional divisors. Pushing down proves that a multiple of $D$ is linearly equivalent to a Cartier divisor. This is precisely the converse in (4.7).
  Apply the criterion to the fixed rational classes on the resolution. For the log-canonical class one may use $K_(cal(R)_t) + tilde(B)_t$ modulo exceptional classes; this does not presuppose that $K_(cal(Y)_t) + B_t$ is $bb(Q)$-Cartier. The membership in (4.7) holds on the dense set of members under consideration, and the linear data are fixed. It therefore holds at the geometric generic point, with fixed rational coefficients in a basis of relative Cartier classes. Rational linear equivalence upstairs, followed by pushdown, proves that the generic log-canonical divisor is $bb(Q)$-Cartier. Clear denominators and spread this linear equivalence. Its possible vertical errors disappear after shrinking, giving a relative Cartier multiple. This argument applies simultaneously to each additional specified class.
  Exceptional coefficients in a pullback are unique. Indeed, an exceptional rational divisor numerically trivial over its target is zero, by applying the negativity lemma to it and its negative. They are thus the solutions of fixed rational linear equations on the resolution, and are constant after shrinking. The klt condition is now the finite set of strict inequalities saying that the crepant SNC coefficients are less than one. Relative log-anticanonical ampleness is open. Thus an open set consists entirely of the required log-Fano pairs, with all the asserted properties.
  Finally, all Weil divisors downstairs are $bb(Q)$-Cartier exactly when the right side of (4.7) exhausts $N^1 \( cal(R)_t \)_(bb(Q))$: every divisor upstairs pushes to a Weil divisor, and the same argument applies. This is again a condition on the fixed linear data. Applying the construction to the remaining closed parameter sets proves all the assertions by noetherian induction. ◻
]

Choi–Li–Zhou prove boundedness of the birational contraction models of members of a fixed bounded family of Fano-type varieties #cite(label("CLZ26")) Theorem 1.7 and Section 5.1. We use their fibrewise small $bb(Q)$-factorializations and the comparison between relative and fibre MMPs #cite(label("CLZ26")) Theorems 1.4–1.6 and Lemma 5.5. The additional data in the following statement are the marked supports, graphs, exceptional loci and their resolutions. The proof uses finite generation to list the canonical contraction maps on a generic member, the cited family results to retain the complete list after shrinking, and then spreading to include their graphs and marks.

#thm([Lemma 4.7.])[
  (Uniform contraction diagrams).  #emph[For a bounded collection of projective klt log-Fano pairs with fixed finite coefficient set, all diagrams obtained from a small $bb(Q)$-factorialization by small modifications and rational contractions are bounded. The assertion includes the transforms and images of a bounded marked support, the exceptional loci of the arrows, and their chosen graph resolutions. It also includes a non-extracting birational map followed by a contraction morphism. Here a diagram is a subdiagram of the collection of contraction models and their canonical arrows compatible with the fixed function field.]
] <bd:contractions>

#proof[
  Lemma 25 supplies families of Fano-type fibres. Take smooth parameter strata and remove the images of any vertical exceptional components of the simultaneous resolution. The relative $bb(Q)$-Cartier equality and the crepant coefficients less than one then make the total-space pair klt as well. This verifies the total-space hypothesis of #cite(label("CLZ26")) Theorem 1.4. After a generically finite base change and shrinking, #cite(label("CLZ26")) Theorems 1.4–1.6 gives fibrewise small $bb(Q)$-factorializations and compatible numerical spaces, nef cones, Mori chambers, and MMP steps. Its hypotheses hold: the fibres have rational singularities and the stated vanishings, and every fibre is of Fano type. Thus the very-general-fibre alternative in #cite(label("CLZ26")) Theorem 1.2 applies.
  For clarity, the finiteness-to-boundedness step is as follows. On the geometric generic fibre of one stratum choose a small $bb(Q)$-factorialization. Finite generation supplies finitely many small models, and finitely many faces and semiample contractions on each of them. All this finite data spreads after a finite extension and shrinking. The two inclusions needed for constancy of a nef cone can be seen directly: spread its finitely many semiample generators, which remain semiample on an open set, and spread effective curves generating the dual polyhedral cone. The divisor generators give one inclusion; the curve generators give the reverse. The fibrewise $bb(Q)$-factorializations and compatible numerical spaces ensure that these comparisons take place in the same space. The relative chamber/MMP compatibility cited above then rules out further chambers on a fibre. Here the source has first been made fibrewise $bb(Q)$-factorial, so the partial-MMP chamber description agrees with that from small modifications; the converse direction in #cite(label("CLZ26")) Theorem 1.6(3) applies. The generic finite list of graphs consequently supplies the complete list on an open set. Apply noetherian induction to the remaining strata. This proves boundedness of the diagrams, not just of their vertices.
  We also check the last assertion. If $f : Y arrow.r.dashed Z$ is a non-extracting birational map, take a sufficiently ample Cartier divisor $H$ on $Z$ and a general member avoiding the generic points of the finitely many centers of divisors contracted by $f$. Write $D$ for its strict transform on $Y$. The corresponding linear system has no fixed prime component. Moreover,
  $ R \( Y \, D \) = R \( Z \, H \) . $
  At a prime divisor retained by the map this is the same valuation test on both sides. At a prime divisor contracted on $Y$, a regular section of $cal(O)_Z \( m H \)$ pulls back regularly, and the chosen $H$ has order zero at that valuation. Normality then gives equality of the section spaces. Hence $Z$ is the ample model of a movable system on $Y$. A subsequent contraction is handled by taking the pullback of an ample divisor from its base. The Mori dream space chamber description therefore includes these maps too. If an intermediate target is not $bb(Q)$-factorial, apply this description to the composite from the initial $bb(Q)$-factorial source; the diagram also records the intermediate maps.
  Finally take closures of the marked transforms on the finitely many graph families, and resolve their union with the exceptional loci. Proper images, inverse images, and irreducible components of these finite-type families remain bounded after stratification. This gives the stated marked and exceptional data. ◻
]

#prodef([Remark 4.8.])[
  (Bad loci in a bounded diagram).  For any of these finitely many contraction families, the proper closed locus outside which a specified generic fibre property holds can be chosen in the same bounded diagram. For example, use the smooth locus in a conic or del Pezzo family. More generally, spread a resolution of the geometric generic fibre and its very free curves when that fibre is rationally connected. Smoothness and deformation of the curves give a dense good open. Shrinking and stratifying ensures that it is dense in each relevant fibre of the parameter family. The complementary closed sets and their preimages are then bounded. A prime divisor contained in such a proper closed preimage is an irreducible component of that preimage, so this observation bounds the divisors actually used below; it makes no assertion about arbitrary subvarieties inside a bounded variety.
] <bd:bad-loci>

=== 4.4 Uniform geometric generic link diagrams <uniform-geometric-generic-link-diagrams>

#thm([Theorem 4.9.])[
  (Uniform geometric generic link diagrams).  #emph[Bounded marked families of geometric generic diagrams can be chosen with the following properties:]
  + #emph[There are such families depending only on the dimension so that, for every specified birational map $f : V \/ B arrow.r.dashed V' \/ B'$ between terminal four-dimensional Mori fibre spaces, there is an ordinary Sarkisov factorization of $f$ whose individual geometric generic link diagrams belong to these families.]
  + #emph[For every fixed rational $0 < c < 1 \/ 4$, there are such families depending only on the dimension and $c$ so that, for every smooth projective threefold $W$ with a reduced SNC divisor $D$ and every two given negative $\( K_W + c D \)$ programs with Mori fibre-space outputs, there is a connecting log Sarkisov path whose individual geometric generic link diagrams belong to these families.]
  #emph[In (i) the path induces the specified map $f$; in (ii) it induces the birational map determined by the two given maps from $W$. The diagrams retain these identifications of their function fields. For a link with common base $Q$, put $F = bb(C) \( Q \)$ and choose an algebraic closure $overline(F)$. The bounded diagrams are the restrictions to the geometric generic fibre over $overline(F)$. They include the small models, both ends, their base contractions, exceptional loci, marked transforms, and bounded bad loci as in Remark 27. In (i) the marks are the exceptional and bad loci of the link contractions; in (ii) they also include the restrictions of the transforms of the original divisor $D$. Each induced end-base contraction $B arrow.r Q$ is of Fano type over $Q$. Its geometric generic fibre is integral and has a rationally connected smooth proper model. In (ii) all marked prime divisors on a link model are transforms of primes on the chosen common start: the maps from that start do not extract. Higher starts with the mark rule of Lemma 24 are allowed.]
  #emph[In both parts the families are independent of the start, its resolution, the birational map, the length of a path, or the K3 test collection.]
] <bd:diagrams>

#proof[
  Apply the geography above to a common smooth resolution of the specified map in (i), and to the given common-start maps in (ii), retaining their function-field identifications. Lemmas 23 and 24 give a central ample model $Z^(upright(c)) \/ Q$, reached by a small map from $N^(upright(c)) \/ Q$, with $epsilon.alt = 1$ in the first case and $epsilon.alt = 1 - c$ in the second. Put $Z = Z_(overline(F))^(upright(c))$. Its dimension is at most four, the negative log-canonical divisor is ample, and the same discrepancy bound holds. Birkar’s boundedness theorem #cite(label("BirkarBAB21")) Theorem 1.1 applies: projective varieties admitting an $epsilon.alt$-lc boundary with nef and big negative log-canonical divisor form a bounded family. In particular it bounds the underlying varieties $Z$ just constructed.
  The marked boundary is bounded as well. In case (ii), write its restriction to $Z$ as $c D_Z$, and let $H$ be one of the bounded very ample polarizations supplied by boundedness. In fibre dimension $r$,
  $ c D_Z dot.op H^(r - 1) lt.eq - K_Z dot.op H^(r - 1) . $
  The right side is bounded by the coefficient of the Hilbert polynomial of the bounded polarized varieties. Thus $D_Z$ has bounded degree. Reduced cycles of bounded degree in a fixed projective space form a bounded family, so the marked central pairs are bounded. Marks vertical over $Q$ have empty restriction to the generic fibre. Horizontal components may split over $overline(F)$, but their nonzero coefficients remain $c$ and their total degree is still bounded.
  All the geometric generic link vertices and bases are rational contractions of small $bb(Q)$-factorializations of these central pairs. Lemma 26 supplies bounded diagrams, and Remark 27 supplies the closed bad loci. Small loci do not acquire divisorial components under the algebraic extension to the geometric generic field. The same constructions apply over algebraically closed fields of characteristic zero. For the family results stated over $bb(C)$, we use their finite-data spreading arguments and algebraically closed base change to obtain the corresponding geometric generic families here. Every bound was taken from one of these fixed bounded families, not by accumulating constants along a path.
  For the assertion about base contractions, the central rank-two model is of Fano type over $Q$ by Lemma 23. This property survives small modifications and descends under contractions, including fibre-type contractions #cite(label("ProkhorovShokurov09")) Lemma 2.8, with the relative convention after Lemma–Definition 2.6. It therefore holds for every end and its base $B arrow.r Q$. These are contractions of normal varieties, so their generic fibres are geometrically integral in characteristic zero. The rational connectedness theorem for klt log-Fano contractions #cite(label("HM07Vertical")), applied also to a resolution, gives the asserted rationally connected smooth proper models. ◻
]

=== 4.5 The low-discrepancy extractions <the-low-discrepancy-extractions>

The link diagrams have now been bounded. A different issue arises in Proposition 47: a conic base is controlled on its geometric generic fibre, but an arbitrary smooth resolution need not be bounded even there. The relative log MMP over that base will leave a geometric generic model extracting only valuations of log discrepancy at most one, as proved in that proposition. We prepare the bound for that surviving model here; we do not bound the resolution itself.

The contraction lemma applies to maps which do not extract divisors. We therefore first extract all exceptional prime valuations of log discrepancy at most one. Any model extracting only some of them is a birational contraction of this common model and falls under that lemma.

#thm([Lemma 4.10.])[
  (Finite extraction list on an SNC pair).  #emph[Let $\( R \, Gamma \)$ be a smooth pair with SNC support and rational coefficients $b_i < 1$, allowing negative coefficients. There are only finitely many exceptional divisorial valuations $F$ with $a \( F \, R \, Gamma \) lt.eq 1$. They are obtained by a finite collection of blow-ups of boundary strata. If the pairs and their SNC components vary in a fixed log-smooth family with a fixed finite coefficient set, all these valuations occur in finitely many such relative constructions after stratification.]
] <bd:snc-places>

#proof[
  At the generic point of the center of $F$, of codimension $r$, use the regular parameters and boundary coefficients in (4.6). If the center is not a boundary stratum, at least one $b_i$ is zero; since an exceptional center has $r gt.eq 2$, the right side is strictly greater than one. Thus a valuation in question centers at a boundary stratum. Write its orders there as $w_i$. They satisfy
  $ sum_i \( 1 - b_i \) w_i lt.eq 1 . $
  There are finitely many possibilities because every $1 - b_i$ is positive.
  Blow up the stratum. In a chart containing the center of the valuation, choose an index with minimal order; the new orders are that minimum and the differences from it. Zero differences correspond to units unless the center lies in a further proper subvariety of the exceptional stratum. The latter would be a non-stratum center and is excluded by (4.6) applied to the crepant SNC transform. This transform is still klt, so its coefficients remain strictly less than one and the same non-stratum exclusion applies at every step. Thus, until the valuation itself becomes a divisor, its center continues to be a stratum and the sum of its positive orders strictly decreases. This is the usual monomial subtraction algorithm, and proves both that the valuation is a stratum valuation and that finitely many blow-up sequences suffice. In a fixed family there are finitely many strata and bounded orders; separate their geometric components and perform the same finite sequences relatively. ◻
]

#thm([Theorem 4.11.])[
  (Bounded terminalization diagrams).  #emph[Let $\( T \, Lambda \)$ range over a bounded collection of projective klt log-Fano pairs with fixed finite rational coefficient set and bounded marked support. There is a bounded collection of marked diagrams containing a $bb(Q)$-factorial crepant terminalization extracting exactly the exceptional valuations 
$ a \( F \, T \, Lambda \) lt.eq 1 . $

 Every normal projective model which extracts only a subset of these valuations, followed by non-extracting birational moves and contraction morphisms, occurs among bounded marked contraction diagrams of these terminalizations. The bound depends on the given family, not on a resolution chosen to construct one of the models.]
] <bd:terminalization>

#proof[
  Use Lemma 25 to obtain simultaneous crepant log resolutions. Their coefficients are in a fixed finite set strictly below one on each stratum. The exceptional divisors already on the resolution are a finite list; all additional valuations of log discrepancy at most one are in the uniformly finite list of Lemma 29. Extract all of them on a common resolution.
  The extraction theorem #cite(label("BCHM10")) Corollary 1.4.3 produces a $bb(Q)$-factorial model $tau : T^(upright(t)) arrow.r T$ extracting exactly this set. The extra restriction concerning non-klt centers in that theorem is empty here. Its crepant boundary $Lambda^(upright(t))$ has coefficient $1 - a \( F \, T \, Lambda \)$ on an extracted divisor, and hence is effective. By construction the pair is terminal. Also
  $ - \( K_(T^(upright(t))) + Lambda^(upright(t)) \) = tau^(*) #scale(x: 120%, y: 120%)[\(] - \( K_T + Lambda \) #scale(x: 120%, y: 120%)[\)] $
  is nef and big, so $T^(upright(t))$ is of Fano type. Apply this construction on a geometric generic member and spread it; the fixed extraction list, crepant equality, and the discrepancy inequalities persist after shrinking. Thus the terminalizations and all their marks form bounded families. This construction does not resolve an unbounded set of arbitrarily chosen higher models.
  For a model $T'$ extracting a subset, every prime divisor on $T'$ is already a valuation appearing on $T^(upright(t))$. Consequently $T^(upright(t)) arrow.r.dashed T'$ is a birational contraction. Lemma 26, applied to the bounded Fano-type terminalization families, supplies its diagram and every indicated subsequent contraction. In applying that lemma one can either use the displayed weak log-Fano pair and a small ample perturbation of its boundary on each stratum, or spread a Fano-type boundary chosen on its generic member. Both give families of klt log-Fano pairs on an open set. Include all the extracted divisors as marks, even those with crepant coefficient zero. The marked support on every output is then among the bounded transforms already considered. ◻
]

=== 4.6 Choosing the ramification coefficient once <choosing-the-ramification-coefficient-once>

#thm([Lemma 4.12.])[
  (A uniform coefficient on bounded bases).  #emph[Let $\( T \, D \)$ range over a bounded collection with $T$ a projective klt Fano variety and $D$ a reduced divisor. Assume $K_T$ and $D$ are $bb(Q)$-Cartier and $D$ is numerically proportional to $- K_T$. There is a rational $c_(*) > 0$ such that $\( T \, c D \)$ is klt log Fano for every rational $0 < c < c_(*)$. This also holds when the numerical proportionality is known over a characteristic-zero field before geometric base change and both divisors are defined over that field.]
] <bd:coefficient>

#proof[
  Zero-dimensional members have $D = 0$ and impose no restriction on $c$; we treat the positive-dimensional members below. Apply Lemma 25 to the log-Fano pairs $\( T \, 0 \)$ with additional marked divisor $D$. On finitely many simultaneous log resolutions the crepant coefficients for $\( T \, 0 \)$ and the coefficients of $pi^(*) D$ are fixed. Write $a_E = a \( E \, T \, 0 \) > 0$ and $m_E$ for the coefficient of $pi^(*) D$ on an exceptional component. Choosing $c < 1 \/ 2$ and $c m_E < a_E \/ 2$ for every $m_E > 0$ makes every coefficient of the crepant pullback of $c D$ strictly less than one. These finitely many inequalities give a uniform positive klt bound for $c$.
  For ampleness use a bounded very ample divisor $H$ and let $r = dim T$. A common multiple $m K_T$ is Cartier on each of the finitely many strata. Thus
  $ k = - K_T dot.op H^(r - 1) > 0 \, #h(2em) m k in bb(Z)_(> 0) . $
  The degree $e = D dot.op H^(r - 1)$ is a bounded nonnegative integer. Numerical proportionality says $D equiv \( e \/ k \) \( - K_T \)$. Since $e \/ k lt.eq m e$, choosing $c m e < 1 \/ 2$ for all these data gives
  $ - \( K_T + c D \) equiv \( 1 - c e \/ k \) \( - K_T \) \, $
  which is ample. Taking the minimum of the finitely many rational choices gives $c_(*)$.
  Finally numerical equivalence between divisors defined over the original field persists geometrically. Any geometric curve is defined over a finite extension; all its conjugates have the same intersection with such a divisor. Its orbit descends to a curve cycle over the original field, so a zero intersection downstairs forces zero on every conjugate. The preceding argument therefore applies after the geometric base change. ◻
]

For the next corollary, let $V arrow.r T$ be a conic Mori fibre space and let $alpha in "Br" \( bb(C) \( T \) \) \[ 2 \]$ be the class of its generic conic. At a prime divisor $P subset T$, its Brauer residue belongs to $H^1 \( bb(C) \( P \) \, bb(Z) \/ 2 \)$. Define $D_T$ to be the reduced sum of the primes with nonzero residue; this is the #emph[full visible divisorial ramification support] on this model. For a map $T arrow.r Q$, put $F = bb(C) \( Q \)$. On $T_(overline(F))$ we retain the divisor $\( D_T \)_(overline(F))$ obtained by restricting and extending this original support. A residue can become zero after extension of constants; its original supporting divisor remains marked.

#thm([Corollary 4.13.])[
  (Order of the uniform choices).  #emph[For the conic-base ends $V \/ T$ of ordinary fourfold links in the paths of Theorem 28, over $Q$ with $dim Q lt.eq 1$, a single rational number 
$ 0 < c < 1 \/ 4 $

 can be fixed such that the geometric generic pair $\( T_(overline(F)) \, c \( D_T \)_(overline(F)) \)$, with $F = bb(C) \( Q \)$, is klt log Fano. Here $D_T$ is the full visible divisorial ramification support defined on the original conic base above. Fix this number before applying the log part of Theorem 28 or Theorem 30. All resulting large-degree exclusions have a common threshold independent of the K3 test subcollection and of the chosen Sarkisov path.]
] <bd:choice-order>

#proof[
  First use only the ordinary part of Theorem 28. At the indicated end the tower is $N_i arrow.r^(e_i) V arrow.r T arrow.r Q$. Since $dim T = 3$ and $dim Q lt.eq 1$, the last contraction has positive relative dimension and $rho \( T \/ Q \) gt.eq 1$. Equation (4.3) gives
  $ 2 = rho \( N_i \/ V \) + 1 + rho \( T \/ Q \) . $
  Consequently $rho \( N_i \/ V \) = 0$ and $rho \( T \/ Q \) = 1$: the arrow $e_i$ is the identity and $T arrow.r Q$ is an elementary contraction of fibre type. This calculation takes place over $Q$ before geometric generic base change. The geometric generic model $T_(overline(F))$ and its conic projection occur in the bounded diagram. The restriction of the original visible ramification is contained in the bounded bad locus of this projection, and its divisorial support is a union of the finitely many divisorial components there. These marked supports are therefore bounded.
  Apply #cite(label("Druel16")) Lemma 4.6 to the elementary conic Mori contraction $V arrow.r T$. Its source is terminal and $bb(Q)$-factorial, so its base $T$ is $bb(Q)$-factorial. Divisors on $T_F$ extend by closure to Weil divisors on $T$, which are $bb(Q)$-Cartier. Restriction therefore surjects onto the generic numerical divisor space. The relative rank-one condition and the nonzero restriction of an ample class give $rho \( T_F \/ F \) = 1$. Fano type descends under contractions #cite(label("ProkhorovShokurov09")) Lemma 2.8; hence $T_F$ and $T_(overline(F))$ are of Fano type. Over the original generic field $F$, rank one implies that $- K_(T_F)$ is ample: it is the sum of an ample log-anticanonical class and an effective class. It also implies numerical proportionality of $\( D_T \)_F$ and $- K_(T_F)$. These two divisors are $bb(Q)$-Cartier before, and hence after, base change. Their numerical proportionality persists over $overline(F)$ by Lemma 31, even if the geometric Picard rank increases. That lemma provides a uniform $c_(*)$ from these ordinary diagrams.
  Choose a rational $c < min { 1 \/ 4 \, c_(*) }$ once. With this fixed value the marked log links have the uniform bound of Theorem 28, and the bounded $\( T_(overline(F)) \, c \( D_T \)_(overline(F)) \)$ data have the extraction bound of Theorem 30. Only finitely many bounded families, dimensions, and bounded-degree cover constructions are used subsequently: the exceptional and bad-locus components in Section 5, and the ramification and del Pezzo class covers in Section 6. Their branch and degree bounds are checked there. Take the maximum of their thresholds in Theorem 22. Every bound depends only on those families and this chosen $c$, proving the asserted independence. ◻
]

== 5 Divisorial corrections and surface links <sl:section>

We first remove the contributions vertical over the common base of a link. When that base has dimension two, the remaining surface calculation produces a correction depending on its function field; Section 6 will make the correction intrinsic to each Mori fibre space for uniformly large test degree.

=== 5.1 Vertical divisors and change of base <vertical-divisors-and-change-of-base>

Fix a degree $d$ and a subcollection $cal(S)$ of the Picard-number-one K3 surfaces of degree $d$ with trivial automorphism group. Write $u \( Y \)$ for the indicator that the maximal rationally connected quotient of a smooth proper model of $bb(C) \( Y \)$ is birational to a member of $cal(S)$. As in Definition 5, this depends only on the function field, and $u$ is extended additively to finite lists of fields. All fourfolds in this section are the terminal Mori fibre spaces and intermediate models in the ordinary Sarkisov paths supplied by Theorem 28, birational to the fixed rationally connected fourfold. Every reference to an ordinary link below is to a link in one of these chosen paths. In the eventual application that fourfold is assumed rational. The common base of a link is denoted by $Q$.

For a proper contraction $f : Y arrow.r Z$ with the generic-fibre property in Lemma 6, let $"Div"_Z \( Y \)$ denote the prime divisors on $Y$ whose images are proper subsets of $Z$. We define

#[#set math.equation(numbering: n => "(5.1)")
 $ v \( Y \/ Z \) = sum_(E in "Div"_Z \( Y \)) u \( E \) - sum_(D in "Div" \( Z \)) u \( D \) . $ <sl:v-definition>]

This notation means a finite cancelled sum, as follows. There is a dense open $U subset Z$ such that, for every prime divisor $D$ of $Z$ meeting $U$, precisely one prime divisor $E_D$ of $Y$ dominates $D$, and $E_D arrow.r.dashed D$ has the generic-fibre property of Lemma 6. To obtain $U$, spread a resolution of the generic fibre, and shrink so that the resulting smooth proper family has geometrically integral rationally connected fibres and the birational map to the original family remains fibrewise birational over dense opens. Generic flatness and openness of geometric integrality give uniqueness of $E_D$ after a further shrinking. Choose the same open so that $f$ is flat over $U$. By the dimension formula, a prime divisor meeting $f^(- 1) \( U \)$ and vertical over $U$ must dominate a divisor of $U$. It is therefore one of the divisors $E_D$ just described. Cancel $u \( E_D \) - u \( D \) = 0$ for every such $D$. Every remaining prime divisor of $Z$ is a component of $Z \\ U$, and every remaining prime divisor of $Y$ is a component of $f^(- 1) \( Z \\ U \)$. Both are finite lists. Replacing $U$ by a smaller good open only adds pairs of equal terms, so the resulting integer is independent of $U$.

#thm([Lemma 5.1.])[
  (Uniruled divisors in contraction fibres).  #emph[Let $f : Y arrow.r Z$ be a projective contraction of normal varieties over an algebraically closed field of characteristic zero. Suppose that $Y$ is of Fano type over $Z$. Let $E$ be a prime divisor which is a component of $f^(- 1) \( f \( E \) \)$ and satisfies $dim E > dim f \( E \)$. Then $E$ is uniruled. Consequently:]
  + #emph[if $dim Y > dim Z$, every divisor vertical over $Z$ is uniruled;]
  + #emph[if $f$ is birational, every $f$-exceptional prime divisor is uniruled.]
  #emph[The same conclusions apply to geometric generic fibres of such a contraction and to birational transforms of the divisors.]
] <sl:uniruled-vertical>

#proof[
  Choose a rational boundary $Theta$ making $\( Y \, Theta \)$ klt and $- \( K_Y + Theta \)$ relatively ample. Then $- K_Y = - \( K_Y + Theta \) + Theta$ is relatively big, and a sufficiently divisible multiple of $- \( K_Y + Theta \)$ is generated over $Z$. Theorem 1.2 and Corollary 1.4 of #cite(label("HM07Vertical")) give rational chain connectedness of every fibre; the non-klt locus is empty. The statement after passage to a characteristic-zero geometric generic field follows by descent of the finite data and base extension.
  Put $T = f \( E \)$ and choose a general point $e$ of $E$ outside the other components of $f^(- 1) \( T \)$. The fibre of $E arrow.r T$ through $e$ has positive dimension. A chain of rational curves in the fibre of $f$ joining $e$ to another point starts with a nonconstant rational curve through $e$. That curve is contained in $E$: its image is in $f^(- 1) \( T \)$, and an irreducible curve through a point lying on only the component $E$ must lie in that component. Thus rational curves cover $E$, proving uniruledness. Equivalently, one can select a dominating component of the parameter space of these rational curves. The argument can be made after an uncountable algebraically closed extension and descended, so it does not require an uncountability assumption on the original field.
  For (i), $f \( E \)$ is proper and $f^(- 1) \( f \( E \) \)$ is a proper closed subset of the integral variety $Y$. Its component containing $E$ must equal $E$, and $dim E - dim f \( E \) gt.eq dim Y - dim Z > 0$. The same component argument works in (ii), where exceptionalness gives $dim E - dim f \( E \) gt.eq 1$. Finally uniruledness is birationally invariant. ◻
]

The contractions $B arrow.r Q$ which occur for the bases of link ends are of Fano type over $Q$, by the base-contraction part of Theorem 28. Their geometric generic fibres are geometrically integral and rationally connected; this also holds for $V arrow.r Q$ by composition. Thus all the following cancelled sums are defined.

For a tower $V arrow.r B arrow.r Q$, let $h_Q \( V \/ B \)$ be the portion of (5.1) consisting of divisors dominating $Q$:

#[#set math.equation(numbering: n => "(5.2)")
 $ h_Q \( V \/ B \) = sum_(E in "Div"_B \( V \)\
E arrow.r Q med d o m i n a n t) u \( E \) - sum_(D in "Div" \( B \)\
D arrow.r Q med d o m i n a n t) u \( D \) . $ <sl:h-definition>]

Use the same cancellation as for $v \( V \/ B \)$. A cancelled pair $E_D \, D$ has the same dominance behaviour over $Q$, so this is well defined. Partitioning both finite cancelled lists according to dominance over $Q$ gives

#[#set math.equation(numbering: n => "(5.3)")
 $ v \( V \/ Q \) = v \( V \/ B \) - h_Q \( V \/ B \) + v \( B \/ Q \) . $ <sl:tower>]

Indeed a prime divisor of $V$ vertical over $Q$ is necessarily vertical over $B$. In the right-hand side, the divisors of $B$ vertical over $Q$ cancel between the first two terms and $v \( B \/ Q \)$, leaving exactly the defining sum for $v \( V \/ Q \)$. Good opens may be shrunk simultaneously to perform these cancellations on finite lists.

#thm([Lemma 5.2.])[
  #emph[For every base contraction $B arrow.r Q$ of an ordinary fourfold link, $v \( B \/ Q \) = 0$.]
] <sl:base-v-zero>

#proof[
  The assertion is immediate for an isomorphism. For a birational contraction, nonexceptional prime divisors cancel with their birational transforms on $Q$. The remaining divisors are uniruled by Lemma 33. Since $dim B lt.eq 3$, these divisors have dimension at most two, and their MRC quotients have dimension at most one; they have test value zero.
  If the contraction has positive relative dimension, then $dim Q lt.eq 2$. Every prime divisor of $Q$ has test value zero for dimension reasons. Every divisor of $B$ vertical over $Q$ is uniruled by Lemma 33, and again has dimension at most two, so its test value is zero. This includes $Q$ a point, when there are no vertical divisors and no base divisors to sum. ◻
]

For a link $f : V \/ B arrow.r.dashed V' \/ B'$ over $Q$, split its divisorial cocycle into the contributions from valuations vertical and horizontal over $Q$, as in #cite(label("LinShinder26")) Definition 2.3:

$ c_u \( f \) = c_(u \, upright("vert") \/ Q) \( f \) + c_(u \, upright("hor") \/ Q) \( f \) . $

The signs are those of Lemma 8: a divisor present on the primed model and absent on the unprimed model contributes positively. A common prime divisor has the same residue field and the same dominance behaviour over $Q$ on both models.

#thm([Proposition 5.3.])[
  (Vertical correction).  #emph[For every ordinary fourfold link over $Q$ one has 
#[#set math.equation(numbering: n => "(5.4)")
 $ c_(u \, upright("vert") \/ Q) \( f \) & = v \( V' \/ Q \) - v \( V \/ Q \) \,\
c_u \( f \) - #scale(x: 120%, y: 120%)[\(] v \( V' \/ B' \) - v \( V \/ B \) #scale(x: 120%, y: 120%)[\)] & = c_(u \, upright("hor") \/ Q) \( f \) - h_Q \( V' \/ B' \) + h_Q \( V \/ B \) . $ <sl:vertical-cocycle>]

 These identities hold for every test degree and require no boundedness threshold.]
] <sl:vertical>

#proof[
  In the difference $v \( V' \/ Q \) - v \( V \/ Q \)$ the base-divisor sums cancel. Common vertical prime valuations cancel as well, leaving precisely the signed exceptional divisors vertical over $Q$. This proves (5.4). Substitute (5.3) and use Lemma 34 on both ends to obtain (5.4). ◻
]

=== 5.2 The common-base dimensions other than two <the-common-base-dimensions-other-than-two>

Denote the right-hand side of (5.4) by $H_Q \( f \)$. We next specify exactly where a degree threshold is needed.

#thm([Proposition 5.4.])[
  #emph[There is an integer $d_(upright("vert"))$, depending only on the bounded marked families in Theorem 28 and the exclusions in Theorem 22, with the following property. For every $d > d_(upright("vert"))$, every allowed subcollection $cal(S)$, and every ordinary fourfold link $f$ whose common base satisfies $dim Q lt.eq 1$, one has 
$ c_(u \, upright("hor") \/ Q) \( f \) = h_Q \( V \/ B \) = h_Q \( V' \/ B' \) = 0 . $

 In particular $H_Q \( f \) = 0$. If $dim Q = 3$, these equalities hold for every $d$. The integer $d_(upright("vert"))$ is independent of the link, the birational map, the number of links in a path, and the choice of $cal(S)$.]
] <sl:low-base>

#proof[
  Suppose first that $dim Q = 3$. Each Mori base has dimension at most three and dominates $Q$, so its morphism to $Q$ is birational. No divisor of either Mori base, and no divisor of $V$ vertical over that base, dominates $Q$. Therefore both $h_Q$ terms vanish. Normal proper generic curves over $bb(C) \( Q \)$ are regular and hence smooth in characteristic zero. A birational map between them is an isomorphism. Their closed points are exactly the prime divisors of the fourfolds dominating $Q$, so there are no horizontal divisorial contributions either.
  For $dim Q = 0$, the entire marked contraction diagram is bounded by Theorem 28. The exceptional prime divisors contributing to $c_u \( f \)$ therefore have bounded birational models of dimension three. Choose a marked good open for each contraction $V arrow.r B$. After cancellation, the divisors contributing to $h_Q \( V \/ B \) = v \( V \/ B \)$ are components of the marked bad locus on $B$ or its preimage on $V$. These components have bounded birational models by the #emph[marked-locus] assertion of Theorem 28. The bounded-variety exclusion in Theorem 22(i) gives a single threshold beyond which every term has test value zero.
  Now suppose $dim Q = 1$, and put $F = bb(C) \( Q \)$. We use the bounded diagrams after extension to $overline(F)$. If $E$ is a horizontal exceptional prime divisor of the link, the geometric generic fibre components of $E arrow.r Q$ are surfaces. On the side where the divisor is extracted, each is exceptional for a divisorial contraction of the generic threefold. They are uniruled by Lemma 33; any intervening small modifications preserve their birational types. Their smooth birational models are bounded by Theorem 28. The threefold-over-a-curve exclusion in Theorem 22(iv) therefore makes $u \( E \) = 0$ uniformly for large $d$. Here $u$ is evaluated on the original complex threefold field $bb(C) \( E \)$; only its geometric generic surface components, rather than $E$ itself, are being placed in bounded families.
  It remains to treat $h_Q \( V \/ B \)$, the other end being identical. Work with a good open for the generic contraction $V_F arrow.r B_F$ and spread it over an open of $Q$. Shrinking $Q$ changes no horizontal prime field. The cancellations defining $h_Q$ remove all divisors meeting that good open. Consequently the geometric generic components of the remaining prime divisors lie in the bounded marked bad locus or its bounded preimage.
  A remaining positive term is a divisor $P subset V$ vertical over $B$ and dominant over $Q$. Its geometric generic fibre components are vertical divisors of $V_(overline(F)) arrow.r B_(overline(F))$. They are uniruled surfaces by Lemma 33, with bounded birational models. Theorem 22(iv) therefore gives $u \( P \) = 0$ for large $d$. A remaining negative term is a divisor $D subset B$ dominant over $Q$. If $dim D lt.eq 1$, its test value is zero automatically. If $dim D = 2$, its geometric generic fibre components over $Q$ are bounded curves. Were $u \( D \) = 1$, the surface $D$ would be birational to a member of $cal(S)$; the induced pencil, after Stein factorization, would have general fibre genus at least $1 + sqrt(d) \/ 2$. This contradicts the uniform genus bound for those components when $d$ is large.
  Only finitely many bounded families and types of marked components have been used. Take the maximum of their exclusion thresholds. All exclusions concern the full collection of degree-$d$ Picard-number-one K3 surfaces and therefore hold for every subcollection $cal(S)$. This proves the stated uniformity. ◻
]

=== 5.3 Reduction over a surface common base <reduction-over-a-surface-common-base>

#thm([Lemma 5.5.])[
  #emph[Suppose $dim Q = 2$. Then $k = bb(C) \( Q \)$ is a rational function field in two variables over $bb(C)$. The generic fourfold-link models are smooth projective geometrically integral surfaces over $k$, and all small modifications in the link become isomorphisms. An end is either a del Pezzo surface of Picard number one over $k$, or a conic bundle over a smooth projective geometrically integral genus-zero curve over $k$, of relative Picard number one. These statements do not assert that the surface or the genus-zero curve is split over $k$. In the conic case the total Picard number of the generic surface over $k$ is two.]
] <sl:generic-surface-reduction>

#proof[
  A smooth projective model of $Q$ is a dominant rational image of the rationally connected fourfold, hence is rationally connected. A smooth projective rationally connected complex surface is rational: it is uniruled, its minimal model is ruled over a curve, and rational connectedness forces that curve to have genus zero; see #cite(label("AraujoKollar02")) Theorem 30 and #cite(label("Beauville78")) Theorem V.1. Consequently $k tilde.eq bb(C) \( x \, y \)$.
  A terminal fourfold is nonsingular in codimension two #cite(label("KollarFlips057")) Exercise 4.9.1.1, so its singular locus has dimension at most one and cannot dominate $Q$. The generic surface is regular, as a localization of its regular total space near the generic fibre, and is smooth because $k$ is perfect. The contractions have connected fibres and rationally connected geometric generic fibres as above, giving geometric integrality. Projectivity is inherited by base change. A small birational map between smooth proper surfaces is an isomorphism: the exceptional locus of a non-isomorphic birational morphism of smooth surfaces contains a curve, and resolving a birational map gives the same conclusion if it is non-isomorphic in either direction. Such a curve would spread to a divisor exceptional for the original small map.
  If $dim B = 2$, the contraction $B arrow.r Q$ is birational. The generic end $V_k$ has ample anticanonical divisor and Picard number one over $k$, hence is a del Pezzo surface. If $dim B = 3$, the generic base $B_k$ is a normal proper curve with geometrically integral rationally connected generic model, so it is a smooth genus-zero curve. The generic morphism $V_k arrow.r B_k$ has relatively ample anticanonical divisor and relative Picard number one, hence is a smooth-surface Mori conic bundle.
  Here Picard numbers mean dimensions of numerical divisor spaces #emph[over $k$], not over its algebraic closure. To justify their restriction from the fourfold, a divisor on $V_k$ closes up to a Weil divisor on $V$, which is $bb(Q)$-Cartier. This gives surjectivity onto the generic numerical divisor space. A class numerically zero over the indicated original base remains numerically zero on the generic fibre: a generic curve and its intersection degrees spread over an open of $Q$. Thus the relative rank is at most the original rank one. The anticanonical class is nonzero, so it is exactly one. The same argument bounds the numerical rank of the generic middle surface by two. No passage to an algebraic closure is made in this rank calculation. In the conic case the base curve has numerical Picard number one, its pullback to the surface is nonzero, and the relative numerical divisor space has dimension one. Thus the total numerical divisor space has dimension two. ◻
]

#thm([Lemma 5.6.])[
  (The generic dichotomy).  #emph[Suppose $dim Q = 2$ and put $k = bb(C) \( Q \)$. After identifying the middle generic surfaces by the restricted small maps, let $W$ be their common smooth model. Exactly one of the following reductions applies:]
  + #emph[The restricted link induces an isomorphism of the structured generic ends. In the conic case their curve fields are the same embedded subfield of $k \( W \)$. Its horizontal cocycle and $H_Q$ vanish.]
  + #emph[The two ends are obtained from $W$ by distinct elementary $K_W$-negative contractions, each either divisorial to a rank-one del Pezzo surface or a conic contraction. Here $rho \( W \/ k \) = 2$, the two contractions give the two extremal rays, and $- K_W$ is ample.]
  #emph[In particular two distinct conic structures on the same surface belong to (ii), not (i).]
] <sl:generic-dichotomy>

#proof[
  By Lemma 37, $rho \( W \/ k \) lt.eq 2$. If a divisorial contraction $W arrow.r S$ survives on the generic fibre, then $rho \( W \/ k \) = rho \( S \/ k \) + 1$. The end $S$ therefore has rank one and is a del Pezzo surface. Extraction from a conic end, which has rank two, would force $rho \( W \/ k \) gt.eq 3$. Thus any surviving extraction forces $rho \( W \/ k \) = 2$. If the opposite end has no surviving extraction, its surface is $W$ itself and cannot be a rank-one del Pezzo. It must instead carry its conic contraction. If both ends have surviving extractions, both are divisorial contractions from $W$ to rank-one del Pezzo surfaces.
  If neither side has a surviving extraction, both generic end surfaces are $W$. Rank one then gives two structures over a point, and the restricted map is a structured isomorphism. Rank two gives two conic contractions. These may agree or may be distinct; the latter case is retained as a two-conic move.
  In all the rank-two cases, compare the two end contractions on $W$. If they contract the same extremal ray, uniqueness of the contraction identifies their normal targets. Indeed, each is constant on the connected fibres of the other, hence factors through it, and the two factorizations are inverse. For conic contractions this identifies their pullback curve fields inside $k \( W \)$, not merely the abstract isomorphism classes of the curves. For identical birational contractions the common exceptional orbit cancels from the horizontal cocycle. Thus the restricted birational map is a structured isomorphism in either case, with equal vertical divisor data and $H_Q = 0$.
  Otherwise the two contractions give distinct $K_W$-negative extremal rays. These are the two boundary rays of the two-dimensional cone of curves of the projective surface $W$. The anticanonical divisor is positive on both and is therefore ample. This proves (ii). The argument uses numerical classes and contractions over $k$ and does not require the generic surfaces or conic bases to split. ◻
]

=== 5.4 Finite sets attached to the generic surfaces <sl:generic-sets>

We now work over the rational surface field $k = bb(C) \( Q \)$ obtained when $dim Q = 2$. Write $overline(k)$ for an algebraic closure and $G_k = "Gal" \( overline(k) \/ k \)$. All finite $G_k$-sets below carry continuous actions. Extend the test to these sets by

#[#set math.equation(numbering: n => "(5.5)")
 $ u \( A \) = sum_(O in A \/ G_k) u \( k \( O \) \) \, $ <sl:orbit-test>]

where $k \( O \)$ is the finite extension corresponding to the transitive orbit $O$. These are surface function fields over $bb(C)$. Blowing up a closed point with residue field $K$ adds a divisor with field $K \( t \)$, so its horizontal contribution is exactly $u \( K \)$ by Lemma 6. We will repeatedly use

#[#set math.equation(numbering: n => "(5.6)")
 $ \| O \| lt.eq 2 quad arrow.r.double quad u \( k \( O \) \) = 0 . $ <sl:small-orbits>]

This is the small-orbit observation of Lemma 7: $k$ is rational, and a quadratic extension has a nonidentity $k$-automorphism, excluded for a test K3 field.

The generic Mori surfaces are rank-one del Pezzo surfaces over $k$, or relatively rank-one conic bundles $S arrow.r C$ over a geometrically integral genus-zero curve. We do not assume that either the surfaces or the curve $C$ are split over $k$.

#thm([Lemma 5.7.])[
  (Conic fibres and the horizontal vertical correction).  #emph[For a conic-bundle generic surface $S arrow.r C$, let $Delta$ be the finite $G_k$-set of singular geometric fibres and let $tilde(Delta)$ be the double set of their components. Each component cover over a discriminant orbit is nonsplit. The quaternion class of the generic conic over $k \( C \)$ ramifies exactly at these points, and its residue extensions are exactly these component covers. Moreover, 
#[#set math.equation(numbering: n => "(5.7)")
 $ h_Q \( V \/ B \) = u \( tilde(Delta) \) - u \( Delta \) = - u \( Delta \) . $ <sl:h-discriminant>]

 For a rank-one del Pezzo generic surface, $h_Q \( V \/ B \) = 0$.]
] <sl:conic-h>

#proof[
  The morphism from the smooth surface to the smooth curve is flat, so its fibres have the arithmetic genus of the generic conic. Over $overline(k)$, every fibre is connected, has arithmetic genus zero, and has anticanonical degree two. The anticanonical degree of each irreducible component is a positive integer. An irreducible reduced fibre therefore has arithmetic genus zero and is a smooth rational curve. A double fibre $2 R$ would have $R^2 = 0$ and $K_S dot.op R = - 1$, contradicting adjunction parity. The only remaining possibility is a reduced pair $R_1 + R_2$ with $- K_S dot.op R_i = 1$. Put $m = R_1 dot.op R_2$. Since $\( R_1 + R_2 \) dot.op R_i = 0$ and the fibre is connected, adjunction gives
  $ 2 p_a \( R_i \) - 2 = - m - 1 \, #h(2em) m gt.eq 1 . $
  Thus $m = 1$, both curves are smooth rational curves of self-intersection $- 1$, and they meet transversely.
  If the component cover over an orbit were split, the sum of one chosen component over each point of that orbit would descend to a divisor on $S$. It has zero intersection with a general fibre and negative intersection with every component in that chosen orbit. This is impossible when the relative numerical divisor space is one-dimensional: the general fibre is a nonzero relative curve class and spans its dual. Consequently every component orbit has field $L$ quadratic over the corresponding discriminant field $K$.
  The relative anticanonical system embeds the fibres as plane conics: on a smooth fibre it has degree two, and on a reducible fibre it has degree one on each component, with vanishing first cohomology. Cohomology and base change give the local rank-three system. At a singular fibre the total surface is regular, so after diagonalizing the quadratic form over the local discrete valuation ring, its nonsingular binary part has unit determinant and the remaining coefficient has valuation one. More explicitly, with uniformizer $t$ the equation is
  $ a x^2 + b y^2 + t c z^2 = 0 \, #h(2em) a \, b \, c upright(" units") . $
  An exponent of $t$ greater than one would make the total space singular at the geometric node. We use the Kummer identification and quaternion residue formula of #cite(label("AuelBohningBothmerPirutka20")) §2, equations (1)–(4). The associated quaternion can be written $\( - a b \, - a c t \)$; its tame residue is the square class of $- a b$ in the residue field. This is exactly the extension separating the two lines $a x^2 + b y^2 = 0$. At a smooth fibre all three diagonal coefficients are units, so the residue vanishes.
  The corresponding vertical divisor has function field $L \( t \)$, since a line is split over its component field. The involution of $L \/ K$ excludes $u \( L \) = 1$ by the automorphism clause of Lemma 7; the degree of $L$ over $k$ need not be two. All smooth fibres cancel against their base points by the MRC rule. This proves (5.7). On a del Pezzo side the generic base is a point, so there are no vertical primes dominating $Q$. ◻
]

We have computed $h_Q$ for both kinds of generic end. It remains to express the horizontal cocycle as an endpoint difference. The following finite $G_k$-sets will define a candidate function $w$. Their orbit fields matter: equality of rational permutation representations alone need not identify the fields tested by $u$.

We use the geometric classification, intersection lattices and anticanonical models of smooth del Pezzo surfaces #cite(label("DolgachevIskovskikh2009")) Sections 3.4 and 6.1. All plane blowup bases below are chosen over $overline(k)$. For a del Pezzo surface $S$, let

$ A \( S \) = { F in "Pic" \( S_(overline(k)) \) : F^2 = 0 \, med - K_S dot.op F = 2 } . $

For a conic bundle, let $P_Delta$ be the set of all choices of one component in each singular geometric fibre. It has $2^(\| Delta \|)$ elements, with its natural $G_k$-action.

The del Pezzo pencil sets and the endpoint-difference calculation below adapt the virtual Néron–Severi viewpoint of Lin, Shinder and Zimmermann #cite(label("LinShinderZimmermann23")) Definition 5.2 and Proposition 5.5. The conic correction also records the component choices needed for the generic Mori surfaces here.

The two-ray calculation below will show why only the degree-five and degree-six pencil sets, and the component choices over three singular conic fibres, enter this function. Once that identity is proved, (5.4) will express the remaining link contribution as the change of $w - h_Q$.

#prodef([Definition 5.8.])[
  For a generic Mori surface with its specified structure, set
  $ w \( S \) = cases(delim: "{", u \( A \( S \) \) \, & S upright(" is a rank-one del Pezzo of degree ") 5 upright(" or ") 6 \,, 1 / 2 u \( P_Delta \) \, & S arrow.r C upright(" is a conic bundle and ") \| Delta \| = 3 \,, 0 \, & upright("otherwise") .) $
  The del Pezzo value depends on the surface; the conic value includes its chosen genus-zero curve structure.
] <sl:w-def>

For a fourfold node $V arrow.r B$ with $dim B = 2$, write $w \( V \/ B \) := w \( V_eta \)$, where $eta = "Spec" bb(C) \( B \)$.

The factor $1 \/ 2$ is harmless even integrally. Complementing all choices is a fixed-point-free, equivariant involution of $P_Delta$. An orbit preserved by this involution has a nonidentity field automorphism and contributes zero. The remaining orbits occur in isomorphic pairs. Thus $u \( P_Delta \)$ is even.

#thm([Lemma 5.9.])[
  (The pencil sets).  #emph[The sets $A \( S \)$ have respectively five and three elements in degrees five and six. In degree six there is also a two-element set 
$ A_2 \( S \) = { C in "Pic" \( S_(overline(k)) \) : C^2 = 1 \, med - K_S dot.op C = 3 } \, $

 and an equality of rational $G_k$-representations 
#[#set math.equation(numbering: n => "(5.8)")
 $ "Pic" \( S_(overline(k)) \)_(bb(Q)) xor bb(Q) tilde.eq bb(Q) \[ A \( S \) \] xor bb(Q) \[ A_2 \( S \) \] . $ <sl:degree-six-representation>]

 If $S$ has Picard rank one over $k$, both finite sets in (5.8) are transitive.]
] <sl:pencil-sets>

#proof[
  Use a plane blowup basis $L \, E_1 \, dots.h \, E_n$ with $n = 9 - K_S^2$. A class $x L - sum y_i E_i$ belongs to $A \( S \)$ exactly when
  $ sum y_i = 3 x - 2 \, #h(2em) sum y_i^2 = x^2 . $
  Cauchy’s inequality gives $\( 3 x - 2 \)^2 lt.eq n x^2$. For $n = 4$ this restricts the integer $x$ to $1 \, 2$. At $x = 1$ there is one coefficient $y_i = 1$ and all others vanish; at $x = 2$ all four coefficients are one. These are the four line pencils and the conic pencil. For $n = 3$ the inequality forces $x = 1$, giving the three line pencils. The same calculation for $A_2 \( S \)$ gives $x = 1 \, 2$ and the two classes
  $ L \, #h(2em) 2 L - E_1 - E_2 - E_3 . $
  The three pencil classes $L - E_i$ and these two plane classes span the degree-six Picard space. Their only linear relation is the equality of the two class sums, each equal to $- K_S$. The relation is invariant under $G_k$; semisimplicity yields (5.8). Taking invariants gives
  $ 2 = \# \( A \( S \) \/ G_k \) + \# \( A_2 \( S \) \/ G_k \) . $
  The Brauer obstruction to descending an invariant line bundle is torsion #cite(label("AuelBernardara2018")) Remark 2.7. Thus invariant rational Picard classes descend, and the invariant Picard space has dimension one. Both finite sets are nonempty, proving transitivity. ◻
]

=== 5.5 The two-ray surface calculation <sl:two-ray-calculation>

#thm([Proposition 5.10.])[
  (Surface-link identity).  #emph[Let $phi : V \/ B arrow.r.dashed V' \/ B'$ be an ordinary fourfold link over a two-dimensional common base $Q$. Put $k = bb(C) \( Q \)$, and denote its generic end surfaces, with their induced Mori structures, by $S$ and $S'$. If its restriction is the nontrivial two-ray move in Lemma 38(ii), then 
#[#set math.equation(numbering: n => "(5.9)")
 $ c_(u \, upright("hor") \/ Q) \( phi \) = w \( S' \) - w \( S \) . $ <sl:surface-equation>]

 Every conic surface participating in such a move has at most seven singular geometric fibres. In the other case of Lemma 38, $H_Q = 0$ without any bound on the discriminant size.]
] <sl:surface-identity>

#proof[
  By Lemma 38, the common smooth surface $W$ is del Pezzo with a two-dimensional invariant numerical plane and the two end contractions generate its two rays. Each is either divisorial to a smooth surface or a conic contraction. For a divisorial contraction, pass first to $overline(k)$. Its exceptional intersection matrix is negative definite. An exceptional component $R$ has $R^2 < 0$ and $K_W dot.op R < 0$; adjunction $2 p_a \( R \) - 2 = R^2 + K_W dot.op R$ forces both intersections to equal $- 1$ and $R$ to be a smooth rational curve. Two such curves must be disjoint, since otherwise their two-by-two intersection matrix would not be negative definite. Thus the contraction is the blowdown of disjoint $\( - 1 \)$-curves to distinct smooth points. Each Galois orbit of these curves contributes an independent invariant relative divisor class. Relative Picard number one therefore gives a single orbit. The contraction is consequently the blowup of one closed point over $k$, and the equivariant correspondence between the geometric points and their exceptional curves identifies their orbit fields. Put $D = K_W^2 > 0$.
  Every fibre class used below is the integral class of a geometric fibre in $"Pic" \( W_(overline(k)) \)$. It is $G_k$-invariant, has square zero and anticanonical degree two, and lies in the rational numerical plane over $k$ by the torsion descent argument used in Lemma 41. A closed fibre over a point of degree $r$ on the original genus-zero curve has class $r$ times this geometric class. Thus none of the following calculations requires a $k$-point on the conic base.
  For a divisorial end let $E$ denote its orbit of exceptional curves, write $e = \| E \|$, and put $E_Sigma = sum_(R in E) R$ on $W_(overline(k))$. Thus $u \( E \) = u \( k \( E \) \)$ counts one orbit field, whereas $E_Sigma^2 = - e$ counts geometric curves in an intersection calculation. When both ends are divisorial, use $F$, $f = \| F \|$, and $F_Sigma$ for the corresponding data at the primed end. In the diagram
  #cetz.canvas({
  import cetz.draw: *
  content((2.057, 0), [$W$])
  content((0, -1.239), [$S$])
  content((4.181, -1.239), [$S'$])
  line((1.811, -0.1485), (0.2466, -1.09), mark: (end: ">"))
  content((0.8704, -0.3564), [#text(size: 0.73em)[$pi$]])
  line((2.308, -0.1462), (3.881, -1.064), mark: (end: ">"))
  content((3.261, -0.32), [#text(size: 0.73em)[$pi'$]])
  line((0.336, -1.239), (3.779, -1.239), stroke: (dash: "dashed"), mark: (end: ">"))
  content((2.057, -1.465), [#text(size: 0.73em)[$phi_k$]])
})
  $E$ is the exceptional set of $pi$ and $F$ that of $pi'$. The factorization $phi_k = pi' compose pi^(- 1)$ therefore contributes $u \( E \) - u \( F \)$ by Lemma 8: the extraction has positive sign and the contraction negative sign. Neither term is multiplied by its orbit size.
  ===== 5.5.1 One divisorial end. <one-divisorial-end.>
  Let $pi : W arrow.r S$ be the contraction to the rank-one del Pezzo end, of degree $a$, and let $W arrow.r C$ be the other, conic contraction. Then $D = a - e > 0$. Write $H = pi^(*) \( - K_S \)$. The plane spanned by $H$ and $E_Sigma$ has intersection form $H^2 = a$, $H dot.op E_Sigma = 0$, and $E_Sigma^2 = - e$. A nonzero isotropic fibre class in this rational plane therefore gives $a x^2 = e y^2$ with nonzero rational $x \, y$, so $a e$ is a square. Since $1 lt.eq e < a lt.eq 9$, the complete list is
  #[#set math.equation(numbering: n => "(5.10)")
   $ \( a \, e \) = \( 4 \, 1 \) \, med \( 8 \, 2 \) \, med \( 9 \, 1 \) \, med \( 9 \, 4 \) . $ <sl:div-conic-table>]
  Indeed, two positive integers with square product have the same squarefree part. Below ten the only unequal such pairs with smaller entry less than the larger are $1 \, 4$, $2 \, 8$, $1 \, 9$, and $4 \, 9$.
  Over $overline(k)$, contracting one line in every singular conic fibre gives a ruled surface over $upright(bold(P))^1$. Its canonical square is eight, so
  #[#set math.equation(numbering: n => "(5.11)")
   $ \| Delta \| = 8 - D . $ <sl:conic-size>]
  The first three cases of (5.10) have extraction degree at most two and discriminant size different from three. Their two $w$ values and their cocycle contributions vanish.
  In the remaining case $\( a \, e \) = \( 9 \, 4 \)$, work geometrically on the plane blown up at four points. Galois fixes $L$ and permutes the four exceptional classes transitively. Thus the invariant fibre class has the form $F = x L - y sum_(i = 1)^4 E_i$ with $x \, y in bb(Z)$. The equations $F^2 = 0$ and $- K_W dot.op F = 2$ give $x = 2$, $y = 1$. The conic pencil is therefore the pencil through the four points. Its three reducible members correspond to the partitions of these points into two pairs. For each point $p$, select in every partition the pair containing $p$. This gives a star of three lines; selecting the other pair gives its complementary triangle. The four stars and four triangles exhaust the eight possible selections. The construction commutes with every permutation of the four points, so there is an isomorphism of $G_k$-sets
  #[#set math.equation(numbering: n => "(5.12)")
   $ P_Delta tilde.eq E union.sq E . $ <sl:eight-orientations>]
  Consequently $w \( W arrow.r C \) = u \( E \)$, which is the extraction contribution. Reversing the link reverses both signs.
  ===== 5.5.2 Two conic ends. <two-conic-ends.>
  The same surface has two fibre classes $F_1 \, F_2$. Put $m = F_1 dot.op F_2$. They are distinct isotropic rays, so $m > 0$, and their anticanonical degrees are two. In their numerical plane,
  $ - K_W = 2 / m \( F_1 + F_2 \) \, #h(2em) D = 8 / m \, #h(2em) F_1 + F_2 = 4 / D \( - K_W \) . $
  Since $m$ is a positive integer, the equality $D = 8 \/ m$ excludes degree five. Thus neither conic bundle has discriminant size three, by (5.11). Their $w$ values vanish and there is no divisorial contribution.
  ===== 5.5.3 Two divisorial ends: the numerical list. <two-divisorial-ends-the-numerical-list.>
  Now let $e \, f$ be the orbit sizes, so that the end degrees are $D + e$ and $D + f$, each at most nine. If $D = 1$ or $2$, the Bertini or Geiser involution $iota$ fixes $K_W$ and acts as $- 1$ on $K_W^perp$ #cite(label("DolgachevIskovskikh2009")) Sections 6.6 and 6.7. It is defined over $k$: the corresponding complete anticanonical or bi-anticanonical system is defined over $k$, and the nontrivial involution of its quadratic function-field extension extends to $W$. If $iota$ preserved an exceptional ray with orbit sum $E_Sigma$, then $iota_(*) E_Sigma = lambda E_Sigma$ for some $lambda > 0$; intersection with $- K_W$ forces $lambda = 1$. The fixed-space formula would then give $E_Sigma in bb(Q) K_W$, contrary to $E_Sigma^2 < 0 < K_W^2$. Thus $iota$ exchanges the two contractions and identifies their entire exceptional $G_k$-sets and output surfaces over $k$. Both sides of (5.9) vanish.
  For the remaining degrees we first restrict the possible orbit sizes by intersection theory, then identify the finite $G_k$-sets. The target is
  $ u \( E \) - u \( F \) = w \( S' \) - w \( S \) . $
  Small orbits contribute zero; the other terms will be matched through equivariant bijections of exceptional or pencil sets.
  Suppose $D gt.eq 3$ and put $m = E_Sigma dot.op F_Sigma$. The Gram determinant of $- K_W \, E_Sigma \, F_Sigma$, which lie in a plane, gives
  $ D m^2 - 2 e f m - e f \( D + e + f \) = 0 . $
  Since the two effective exceptional sums meet nonnegatively, the solution is
  #[#set math.equation(numbering: n => "(5.13)")
   $ m = frac(e f + sqrt(e f \( D + e \) \( D + f \)), D) . $ <sl:intersection-formula>]
  Each curve in an orbit has the same total incidence with the opposite orbit. Thus $m \/ e$ and $m \/ f$ are integers. The anticanonical embedding realizes $\( - 1 \)$ curves as lines; two different such curves meet at most once. In particular $m lt.eq e f$.
  These conditions give precisely the following necessary possibilities, with $e lt.eq f$:
  #[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$D$
], table.cell(rowspan: 1, colspan: 1)[$\( e \, f \, m \)$
]),
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 5 \, 10 \) \, med \( 3 \, 3 \, 9 \) \, med \( 6 \, 6 \, 30 \)$
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 5 \, 5 \) \, med \( 2 \, 2 \, 4 \) \, med \( 4 \, 4 \, 12 \)$
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 3 \, 3 \)$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 3 \, 6 \)$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 2 \, 2 \)$
],
)
]
  Here is a direct exhaustion. For $e = f$, formula (5.13) gives $m \/ e = 1 + 2 e \/ D$, so $D divides 2 e$; impose also $1 lt.eq e lt.eq 9 - D$ and $m lt.eq e^2$. This gives exactly the diagonal entries displayed. For $e < f$, the values $i \( i + D \)$ for $1 lt.eq i lt.eq 9 - D$ must have matching squarefree parts. The lists for $D = 3 \, 4 \, 5 \, 6 \, 7$ are respectively
  $ 3 & 4 \, 10 \, 18 \, 28 \, 40 \, 54\
4 & 5 \, 12 \, 21 \, 32 \, 45\
5 & 6 \, 14 \, 24 \, 36\
6 & 7 \, 16 \, 27\
7 & 8 \, 18 . $
  They give only $\( 2 \, 5 \) \, \( 1 \, 5 \) \, \( 1 \, 3 \) \, \( 1 \, 2 \)$ in their respective rows. For $D gt.eq 8$ the permitted range has at most one entry and supplies neither a diagonal nor an off-diagonal case.
  ===== 5.5.4 Identifying the finite sets. <identifying-the-finite-sets.>
  In the cases $\( D \, e \, f \) = \( 3 \, 2 \, 5 \)$ and $\( 3 \, 3 \, 3 \)$, every curve in $F$ meets every curve in $E$ once. After contracting $E$, its image class $C$ on $S$ has
  $ \( K_S^2 \, C^2 \, - K_S dot.op C \) = \( 5 \, 1 \, 3 \) quad upright("or") quad \( 6 \, 2 \, 4 \) \, $
  respectively. Therefore $- K_S - C$ is in $A \( S \)$. This construction is injective: equal image classes have equal pullbacks, and all the multiplicities at the extracted points equal one, so their strict transforms have the same $\( - 1 \)$ class. A $\( - 1 \)$ class has a unique effective representative. The cardinalities in Lemma 41 then show that
  $ F tilde.eq A \( S \) $
  as actual $G_k$-sets. For $\( 3 \, 3 \, 3 \)$ the construction on the other side also gives $E tilde.eq A \( S' \)$. For $\( 3 \, 2 \, 5 \)$ the other side has degree eight and $u \( E \) = 0$. Thus the desired difference is $u \( E \) - u \( F \)$ in both cases.
  For $\( D \, e \, f \) = \( 4 \, 1 \, 5 \)$ and $\( 5 \, 1 \, 3 \)$ every opposing curve meets the single extracted curve once. Its image already has square zero and anticanonical degree two, so the image itself identifies $F$ with $A \( S \)$. The injectivity argument is unchanged. The opposite end has degree nine or eight, respectively, and the one-point orbit contributes zero. These cases again give (5.9).
  In the diagonal cases $\( D \, e \) = \( 3 \, 6 \) \, \( 4 \, 4 \) \, \( 6 \, 3 \)$, the value of $m \/ e$ is $e - 1$. Each curve therefore misses exactly one curve in the opposite orbit. This rule gives an equivariant bijection $E tilde.eq F$, since the same statement holds in both directions. The output degrees are nine or eight, so no pencil terms occur. In degree seven both orbit sizes are at most two and all terms vanish by (5.6).
  It remains to treat $\( D \, e \, f \) = \( 4 \, 2 \, 2 \)$, whose two outputs have degree six. Here we must identify the actual pencil $G_k$-sets, since an equality of rational permutation representations alone need not identify their orbit fields. The Picard blowup decompositions imply
  $ "Pic" \( S_(overline(k)) \)_(bb(Q)) xor bb(Q) \[ E \] tilde.eq "Pic" \( S'_(overline(k)) \)_(bb(Q)) xor bb(Q) \[ F \] . $
  Insert (5.8) on both sides. The permutation representations of $E \, F \, A_2 \( S \) \, A_2 \( S' \)$ have only one-dimensional rational constituents, because all four sets have two elements. By transitivity, the reduced representation of each triple $A \( S \)$ or $A \( S' \)$ is irreducible over $bb(Q)$: its image is either $C_3$, acting through $bb(Q) \( zeta_3 \)$, or $S_3$, acting through its standard representation. Semisimplicity consequently identifies these two reduced representations. Both are faithful on their image, so their kernels in $G_k$ agree. The quotient is $C_3$ or $S_3$; its transitive action on three points is unique up to isomorphism (the stabilizer is trivial or an order-two subgroup, and all such subgroups of $S_3$ are conjugate). Hence
  $ A \( S \) tilde.eq A \( S' \) $
  as $G_k$-sets. The two extraction orbits contribute zero by (5.6), completing the final case.
  Finally, positivity of $D$ in every nontrivial conic case and (5.11) give $\| Delta \| lt.eq 7$. In the structured-isomorphism case of Lemma 38, the horizontal cocycle is zero and the $h_Q$ values agree; this case includes cancellation of identical generic end contractions. Thus $H_Q = 0$ even when the conic discriminant is arbitrarily large. ◻
]

#prodef([Remark 5.11.])[
  Combining Proposition 42 with Proposition 35, the residual on a nontrivial generic surface link is the change of $w - h_Q$. On a del Pezzo side this is $w$; on a conic side it is
  $ u \( Delta \) + upright(bold(1))_(\| Delta \| = 3) thin 1 / 2 u \( P_Delta \) . $
  The surface field $k$ is part of this formula. Its compatibility across different two-dimensional common bases is proved in the next section. The local calculation alone does not assert that this is already an invariant of the entire conic Mori fibre space.
] <sl:local-correction>

This interpretation agrees with the virtual Néron–Severi sets of Lin–Shinder–Zimmermann #cite(label("LinShinderZimmermann23")) Proposition 4.8, Definition 5.2 and Proposition 5.5: their point and two-element terms vanish under our test. The explicit proof was included to retain the actual orbit fields at every step.

== 6 An intrinsic correction on conic-bundle nodes <sf:section>

The surface calculation depends on a surface field inside the field of a three-dimensional conic-bundle base. We now remove that dependence. All fields and their inclusions in this section are over $bb(C)$. A function field attached to a model is identified with its specified subfield of the common function field; replacing the model does not replace that inclusion. The test $u$ is the test of Section 2, for a collection of Picard-number-one K3 surfaces of degree $d$ having no nonidentity automorphism. None of the bounds below depends on which subcollection is used. We will show that a nonzero correction singles out its embedded surface field, and that this correction vanishes at the ends of links over a point or curve. These two assertions will make the surface calculation telescope along a fourfold factorization. We retain the convention of Section 5 that ordinary four-dimensional links belong to the paths chosen in Theorem 28(i).

=== 6.1 Eligible surface fields and the candidate <eligible-surface-fields-and-the-candidate>

Let $L$ be the function field of the three-dimensional base of a conic Mori fibre space, and let $alpha in "Br" \( L \) \[ 2 \]$ be the class of its generic conic. The zero class is allowed. A subfield $k subset L$ is #emph[eligible] if it is a surface function field and $L$ is the function field of a smooth projective geometrically integral genus-zero curve $C_k$ over $k$, with the following ramification bound. Let $Delta_k subset C_k$ be the reduced finite subscheme of closed points at which $alpha$ has nonzero residue. We require

#[#set math.equation(numbering: n => "(6.1)")
 $ r_k := deg_k Delta_k lt.eq 7 . $ <sf:eligibility>]

Thus $r_k$ counts geometric points of the ramification support defined #emph[before] extending the constants. It does not mean the ramification of the restriction of $alpha$ after extension to an algebraic closure of $k$.

The residue at each point of $Delta_k$ defines a quadratic extension of its residue field. Together these give a degree-two finite étale cover $tilde(Delta)_k arrow.r Delta_k$. If $r_k = 3$, let $P_k$ be the finite étale $k$-scheme whose geometric points choose one point in each of the three fibres of this double cover. It has degree eight. Set

#[#set math.equation(numbering: n => "(6.2)")
 $ sigma_k \( L \, alpha \) = u \( Delta_k \) + upright(bold(1))_(r_k = 3) thin 1 / 2 u \( P_k \) . $ <sf:candidate>]

Here $u$ on a finite étale scheme is the sum of $u$ on its field factors, as in the surface calculation. The data in (6.2) are intrinsic to $\( k subset L \, alpha \)$: a genus-zero function field has a unique smooth projective curve model, and Brauer residues are defined at its discrete valuations.

For the presentation supplied by a nontrivial generic two-ray move, Proposition 42 gives $r_k lt.eq 7$. Lemma 39 and Definition 40 then identify (6.2) with the local correction $w - h_Q$. The present definition also allows other eligible embedded fields; we must compare their candidates before assigning a value to the node.

The half in (6.2) causes no integrality ambiguity. Complementing all three choices defines a fixed-point-free involution of the geometric set $P_k$. A field factor preserved by this involution has a nonidentity automorphism. If it were counted by $u$, this would induce a nonidentity birational automorphism of its K3 minimal model; birational maps between smooth minimal K3 surfaces are isomorphisms. Such a factor is therefore not counted. The counted factors occur in pairs interchanged by complementation. In particular $u \( P_k \)$ is even. This observation is not needed for telescoping, but shows that all the candidate corrections are nonnegative integers.

=== 6.2 Bounded ramification diagrams <bounded-ramification-diagrams>

The following lemma supplies the implication needed in both comparison arguments: a bounded diagram with marked ramification forces the candidate to vanish at large degree. We will then construct log paths whose markings satisfy its hypothesis. Boundedness includes the morphisms and embedded marked support, rather than only the isomorphism classes of their sources and targets, as in Theorem 28.

#thm([Lemma 6.1.])[
  (Residues in a bounded diagram).  #emph[Suppose that a normal projective model of a genus-zero presentation $L \/ k$ occurs in a bounded family of diagrams 
$ Y arrow.r S \, $

 where $S$ is a normal projective surface model of $k$. Suppose also that the family has bounded marked divisorial support containing the full visible ramification of $alpha$ on $Y$. The family may instead be given on the geometric generic fibre over a curve $Q$, in which case the diagrams are over $Q$ and $bb(C) \( Q \) subset k$ is required.]
  #emph[For $r_k lt.eq 7$, the orbit fields in $Delta_k$, $tilde(Delta)_k$, and, when defined, $P_k$, are finite covers of degree at most fourteen with branch contained in a uniformly bounded bad locus on the base diagram. Consequently none of these orbit fields is counted by $u$ once $d$ exceeds a constant depending only on the bounded family.]
] <sf:residue-bound>

#proof[
  Resolve the diagram and marked support in bounded families, marking all resolution exceptional divisors as well. Write $D$ for the resulting SNC support on the smooth total space. It is enough that $D$ contain the ramification; its unramified components do no harm. Every prime on the resolution is either the strict transform of a prime on the old model or an exceptional prime. Marking all exceptional primes therefore includes any newly visible ramification, even over the singular locus of the old model.
  We form residues and their quadratic covers before extending constants: the ground field $F$ is $bb(C)$, or $bb(C) \( Q \)$ on the ordinary generic fibre over $Q$. After finding their unramified open, we will base change these same covers to $overline(bb(C) \( Q \))$ to use the geometric bounds. The Kummer isomorphism identifies the Brauer $2$-torsion of the total function field with its $H^2$ with coefficients in $mu_2$ #cite(label("AuelBohningBothmerPirutka20")) §2, equations (1)–(4). On the smooth total model, the first two residue maps form a complex
  $ H^2 \( F \( Y \) \, mu_2 \) arrow.r^partial xor.big_(E in Y^(\( 1 \))) H^1 \( F \( E \) \, bb(Z) \/ 2 \) arrow.r^partial xor.big_(z in Y^(\( 2 \))) H^0 \( F \( z \) \, mu_2^(- 1) \) \, #h(2em) partial^2 = 0 . $
  Here $Y^(\( j \))$ denotes the codimension-$j$ points. These are the coniveau differentials of #cite(label("BlochOgus74")) Example 2.1 and Proposition 3.9; the same complex applies over the characteristic-zero function field of $Q$. Consider a ramification component $D_i$ and a codimension-one point $z$ of $D_i$ outside its intersections with the other components of $D$. Every term except that from $D_i$ is zero in the displayed secondary residue at $z$. Since $D_i$ is smooth, that term is its ordinary DVR residue, so $partial_z \( partial_(D_i) alpha \) = 0$. If the quadratic residue is represented by $a in F \( D_i \)^(*) \/ F \( D_i \)^(* 2)$, this says that $"ord"_z \( a \)$ is even. After multiplication by a square, $a$ is a unit at the DVR, and adjoining its square root is unramified there. Normalize the indicated open of $D_i$ in the quadratic algebra, componentwise in the split case. This normalization is finite, is unramified at every codimension-one point, and has regular target. Purity of the branch locus makes it étale throughout that open #cite(label("StacksPurityBranch2026")) Lemma 58.21.4, Tag 0BMB.
  The horizontal ramification components are generically finite over $S$. Delete their nonfinite and branch loci on $S$, the images of their pairwise intersections, the images of their intersections with the remaining marked support, and the singular and resolution bad loci of the diagram. These images are proper closed subsets: over the generic point of $S$ the distinct horizontal components are distinct points of the smooth proper curve. The deleted sets form a bounded embedded boundary after stratifying the family. Over the resulting smooth open $U subset S$, the horizontal union is finite étale, its components are smooth and disjoint from the other marked divisors, and its residue double cover is finite étale. Their degrees over $U$ are $r_k$ and $2 r_k$. The scheme of sections defining $P_k$ is then a finite étale scheme of degree eight over $U$. Thus all the fields in the statement have the asserted degree and branch bounds.
  These degree and branch bounds exclude the large-degree K3 fields. First consider a bounded diagram over $bb(C)$. Fix an orbit field $E \/ k$ in the statement, and let $S_E arrow.r S$ be the normalization in $E$. Take a general pencil in a uniformly bounded very ample system on the resolved base surface $S$. Let $h$ bound the genus of its normalized general member and let $b$ bound its intersections with the deleted boundary. Each normalized component of the pullback of that member to $S_E$ has degree $n lt.eq 14$ and, by Hurwitz #cite(label("StacksRiemannHurwitz2026")) Lemmas 53.12.2 and 53.12.4,
  #[#set math.equation(numbering: n => "(6.3)")
   $ 2 g - 2 lt.eq n \( 2 h - 2 \) + b \( n - 1 \) . $ <sf:hurwitz>]
  If $u \( E \) = 1$, a smooth projective model of $S_E$ is birational to a test K3 surface. Resolve the pulled-back pencil on this model and take its Stein factorization. Its connected general fibre is one of these normalized components. This contradicts the bound $2 g - 2 gt.eq sqrt(d)$ in Lemma 20 for large $d$.
  When the family is given only on the geometric generic fibre of $Q$, the same construction is performed over $overline(bb(C) \( Q \))$ on the base curve there. Finite étale covers remain finite étale after this extension, although they may split. The same degree and Hurwitz bounds therefore hold on every geometric component. We retain the base changes of the original ramification support and residue covers; we do not recompute the support from the extended Brauer class, whose residues may have become zero. For any orbit field $E \/ k$, the inclusions $bb(C) \( Q \) subset k subset E$ give a rational map from its surface model to $Q$. If $u \( E \) = 1$, resolve that map on the corresponding K3 surface and take its Stein factorization. Then the geometric general fibres of that map are precisely the components whose genera were bounded. Lemma 20 again gives the contradiction. No assertion about the complexity of an unmarked Brauer class is used. ◻
]

=== 6.3 The coefficient and the full visible boundary <the-coefficient-and-the-full-visible-boundary>

We use the single rational coefficient supplied by Corollary 32. If $c_(*) > 0$ denotes the uniform upper bound obtained there from the ordinary conic-base diagrams, this choice is

#[#set math.equation(numbering: n => "(6.4)")
 $ 0 < c < min { 1 \/ 4 \, c_(*) } . $ <sf:c-choice>]

With $c$ fixed, take the log three-dimensional diagram bounds of Theorem 28 and the terminalization bounds of Theorem 30. Only then fix the common lower bound on $d$ required by Lemma 44 and Theorem 22 for these families. These choices are uniform in the eligible fields, test subcollections, factorizations, and their lengths.

Here are the boundary conventions needed to apply those results. Given finitely many presentations of $L$, take a common smooth projective model $Y$ resolving the rational maps to projective models of their bases. Resolve the ramification support and let $D_Y$ be #emph[exactly] the reduced divisor of ramification visible on this model. Use the pair

#[#set math.equation(numbering: n => "(6.5)")
 $ \( Y \, Phi \) \, #h(2em) Phi = c D_Y . $ <sf:start>]

The divisor $D_Y$ has SNC support. All models and maps in the log geography are taken with the transformed support; they do not extract prime valuations from $Y$. Their transformed support is therefore the full ramification visible on them. If a higher common start is needed, use its full visible ramification again, including the ramified exceptional divisors that have appeared.

This last convention is compatible with the discrepancy requirement in Theorem 28. For the first blowup of a smooth centre of codimension $ell gt.eq 2$ contained in $r lt.eq ell$ boundary components, the log discrepancy is $a \( F \, Y \, c D_Y \) = ell - c r$. Its ordinary discrepancy is therefore $a \( F \, Y \, c D_Y \) - 1 = ell - 1 - c r gt.eq 1 - 2 c > 0$. For an arbitrary exceptional prime, the SNC inequality (4.6) gives $a \( F \, Y \, c D_Y \) gt.eq 2 \( 1 - c \) > 1$. On a higher smooth start $pi : Y' arrow.r Y$, the coefficient of $F$ in $K_(Y') + c D_(Y') - pi^(*) \( K_Y + c D_Y \)$ is $a \( F \, Y \, c D_Y \) - 1 + c epsilon.alt_F$, where $epsilon.alt_F$ is one if $F$ is ramified and zero otherwise. This coefficient is positive in either case. A negative log MMP increases discrepancies for contracted primes. Lemma 24 therefore recovers the same endpoints, and the common-start clauses of Theorem 28 apply with the fixed coefficient in (6.4).

For an eligible $k$, the degree on the generic curve is

#[#set math.equation(numbering: n => "(6.6)")
 $ deg \( K + Phi \) = - 2 + c r_k lt.eq - 2 + 7 c < - 1 / 4 < 0 . $ <sf:negative-degree>]

Run the log MMP over a surface model of $k$. The relative programme ends in a Mori fibre space over a two-dimensional base birational to that surface; its embedded base field is still $k$. Indeed the generic relative dimension is one, and the final generic contraction is a genus-zero curve to its ground field. Geometric integrality makes this ground field $k$ rather than a proper finite extension. These relative negative steps are also permissible steps in the common-start log geography over projective bases.

=== 6.4 Uniqueness of the eligible field <uniqueness-of-the-eligible-field>

#thm([Proposition 6.2.])[
  (Uniqueness from a nonzero candidate).  #emph[For $d$ above the uniform bound fixed after (6.4), if an eligible $k subset L$ has $sigma_k \( L \, alpha \) eq.not 0$, then every eligible surface subfield of $\( L \, alpha \)$ equals $k$ as an embedded subfield of $L$.]
] <sf:unique>

#proof[
  Let $k' subset L$ be any other eligible field; its candidate need not be nonzero. Resolve the two presentations on a common start (6.5). By (6.6), its log MMP has an output with base field $k$ and another with base field $k'$. Connect these outputs by the log Sarkisov links of Theorem 28, and write their successive nodes as $Z_i \/ S_i$ for $0 lt.eq i lt.eq N$. The birational maps from the common start identify every $bb(C) \( Z_i \)$ with $L$; set $K_i = bb(C) \( S_i \) subset L$. Thus $K_0 = k$ and $K_N = k'$. The class $alpha in "Br" \( L \) \[ 2 \]$ is fixed throughout this path, and the support of each boundary is its full visible ramification on the corresponding model.
  Every Mori base in this three-dimensional programme has dimension at most two. If a common base of a link has dimension two, the endpoint bases also have dimension two and their contractions to the common base are birational: they are connected-fibre contractions between normal varieties of the same dimension. The induced identifications are the ones coming from $L$. Such a link therefore preserves the embedded surface field.
  If $k' eq.not k$, let $m$ be the first index for which $S_(m + 1)$ is not a surface with $K_(m + 1) = k$. Its common base $Q$ has dimension at most one, by the preceding paragraph. At each preceding node the data $\( k subset L \, alpha \)$ are unchanged. Hence its proper generic curve, residue covers, and candidate are the original $C_k$, the original covers, and $sigma_k \( L \, alpha \)$. The relevant part of the path is
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Z_m$])
  content((4.511, 0), [$Z_(m + 1)$])
  content((0, -1.585), [$S_m$])
  content((4.511, -1.585), [$S_(m + 1)$])
  content((2.189, -3.171), [$Q$])
  line((0.468, 0), (3.911, 0), stroke: (dash: "dashed"), mark: (end: ">"))
  content((2.189, 0.2266), [#text(size: 0.73em)[$upright("first departure")$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((4.511, -0.2725), (4.511, -1.313), mark: (end: ">"))
  line((0.307, -1.808), (1.969, -3.011), mark: (end: ">"))
  line((4.102, -1.865), (2.419, -3.014), mark: (end: ">"))
})
$#h(2em) bb(C) \( S_0 \) = dots.h.c = bb(C) \( S_m \) = k subset L \,\
dim Q lt.eq 1 .$
  By Theorem 28, on the geometric generic fibre of $Q$ its whole marked diagram is uniformly bounded, including the projection to the endpoint surface base. All ramification points on the proper generic curve are visible as divisors on this total model: their closures dominate the surface base and have codimension one. They are among the marked transforms by the full visible convention. If $Q$ is a curve, its function field is contained in $k$ because the endpoint base contracts to $Q$. Lemma 44 applies and gives $sigma_k \( L \, alpha \) = 0$, a contradiction. Thus $k' = k$. ◻
]

=== 6.5 Vanishing at ends over smaller common bases <vanishing-at-ends-over-smaller-common-bases>

At ends of ordinary four-dimensional links over a point or curve, we must exclude both the del Pezzo correction on a surface base and the eligible-field candidates on a three-dimensional conic base. The surface-base case uses the bounded finite sets already defined; the conic case will require a second log MMP output.

#thm([Lemma 6.3.])[
  (Vanishing at surface bases).  #emph[At an end $V arrow.r B$ with $dim B = 2$ of an ordinary four-dimensional link over a common base $Q$ of dimension at most one, the degree-five or degree-six del Pezzo correction $w$ is zero for uniformly large $d$.]
] <sf:surface-end>

#proof[
  The relative generic diagram over $Q$ is bounded by Theorem 28. On the smooth del Pezzo locus, let $a in { 5 \, 6 }$ be the fibre degree. The vanishings $H^1 \( cal(O) \) = H^2 \( cal(O) \) = 0$ make the relative Picard scheme étale #cite(label("KleimanPicard057")) Theorem 4.8, Corollary 5.13 and Proposition 5.19. We identify its finite part that parametrizes conic-pencil classes. For a line-bundle class $F$ on a geometric fibre $S$, Riemann–Roch gives
  $ chi #scale(x: 120%, y: 120%)[\(] cal(O)_S \( F - m K_S \) #scale(x: 120%, y: 120%)[\)] = 1 + 1 / 2 #scale(x: 120%, y: 120%)[\(] F^2 - \( 2 m + 1 \) F dot.op K_S + a m \( m + 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Consequently the equations $F^2 = 0$ and $- K_S dot.op F = 2$ are equivalent to having the fixed anticanonical Hilbert polynomial $a / 2 m \( m + 1 \) + 2 m + 2$. This fixed-polynomial locus in the relative Picard scheme is open and closed and of finite type; in the smooth projective family it is also projective #cite(label("KleimanPicard057")) Theorem 6.20, Exercise 5.7 and its answer. It is therefore proper and quasi-finite, hence finite étale. Lemma 41 identifies its geometric fibres with $A \( S \)$, of cardinality five or three according as $a = 5$ or $6$. These are statements about the Picard scheme and require no universal line bundle on the original family. The complement of this smooth family is bounded as an embedded locus of the diagram. Each field factor of the finite scheme is therefore a cover of bounded degree unramified outside this bounded locus. Apply the bounded-cover exclusion of Theorem 22, or the Hurwitz calculation (6.3). When $Q$ is a curve its field is contained in each tested surface field. Thus no factor is counted by $u$ and $w = 0$. ◻
]

Now let $V arrow.r T$ be a conic end with $dim T = 3$ and common base $Q$ of dimension at most one, and put $F = bb(C) \( Q \)$. Corollary 32 gives a bounded family of klt log-Fano pairs $\( T_(overline(F)) \, c \( D_T \)_(overline(F)) \)$ with the retained marked support and the fixed coefficient (6.4). These are the inputs to the application of Theorem 30 in the following proof. The corollary proves rank one over $F$; it requires no rank-one assertion over $overline(F)$.

#thm([Proposition 6.4.])[
  (Vanishing at conic ends).  #emph[Let $V arrow.r T$ be a conic end of an ordinary four-dimensional Sarkisov link with common base $Q$ of dimension at most one. For the uniform large degrees under consideration, no eligible surface subfield of $\( bb(C) \( T \) \, alpha \)$ has nonzero candidate.]
] <sf:conic-end>

#proof[
  Put $L = bb(C) \( T \)$ and suppose an eligible $k subset L$ has nonzero candidate. The bounded diagram on $T$ does not yet include the presentation over $k$; in particular, $k$ need not contain $bb(C) \( Q \)$. We will construct an output with bounded marked geometric generic diagram over $Q$ and compare it with the output over $k$. Choose a common smooth SNC start $Y$ mapping to $T$ and to a projective surface model of $k$, with the full visible boundary (6.5). One log MMP output has base field $k$ by (6.6).
  ===== 6.5.1 A bounded output over $Q$. <a-bounded-output-over-q.>
  First run the log MMP #emph[over $T$] to a relative minimal model $b : Y^(*) arrow.r T$. This is the birational case: relative bigness holds, so #cite(label("BCHM10")) Theorem 1.2 applies. Let $D_(*)$ be the transform of $D_Y$ on $Y^(*)$; its pushforward under $b$ is $D_T$.
  We first study the geometric generic fibre over $Q$, retaining the same symbols for these restrictions. The marked supports are the base changes of the original supports, regardless of whether the extended Brauer class still ramifies on them. We have
  #[#set math.equation(numbering: n => "(6.7)")
   $ K_(Y^(*)) + c D_(*) = b^(*) \( K_T + c D_T \) + E . $ <sf:exceptional-nef>]
  The divisor $E$ is $b$-exceptional and $b$-nef; the latter follows from relative nefness of the left side. The negativity lemma gives $E lt.eq 0$. For an exceptional prime $F$ of $b$, its coefficient is
  #[#set math.equation(numbering: n => "(6.8)")
   $ "coeff"_F \( E \) = a \( F \, T \, c D_T \) - 1 + c epsilon.alt_F \, #h(2em) epsilon.alt_F = cases(delim: "{", 1 & F upright(" occurs in ") D_(*) \,, 0 & F upright(" does not occur in ") D_(*) .) $ <sf:cutoff>]
  Consequently every valuation extracted by $b$ on this geometric generic fibre satisfies $a \( F \, T \, c D_T \) lt.eq 1$; an extracted valuation occurring in $D_(*)$ even satisfies $a \( F \, T \, c D_T \) lt.eq 1 - c$.
  Theorem 30 now bounds the geometric generic model and all its subsequent non-extracting contraction diagrams, including the marked support. Indeed the only extracted divisors are among the bounded terminalization data for the bounded klt log Fano pairs $\( T \, c D_T \)$. On the geometric generic fibre over $Q$, every component of $D_(*)$ is either the strict transform of a component of $D_T$, or one of these extracted prime divisors. The markings here are retained under extension of constants. The terminalization theorem marks the entire extraction list, including primes with crepant coefficient zero, so it bounds this full support and all of its subsequent transforms on that geometric generic fibre. Primes of the resolution exceptional over $T$ there and absent from this list cannot survive on $Y^(*)$ there by (6.8). This bounds the geometric generic model $Y^(*)$ over $Q$ and its subsequent non-extracting diagrams, not the arbitrary resolution $Y$. To obtain a Mori output over $Q$, we verify that the log canonical divisor on this geometric generic fibre is not pseudo-effective. To see this from (6.7), choose a general complete-intersection curve in $T$ avoiding the centres of the exceptional divisors of $b$. Its strict transform has negative intersection with $K_(Y^(*)) + c D_(*)$, because $K_T + c D_T$ is anti-ample. Such curves form a movable covering family, so a pseudo-effective divisor could not have this negative intersection.
  Return to the models over $bb(C)$. We may therefore run the log MMP from $Y^(*)$ over $Q$ to a Mori fibre space $Z \/ B$. Its geometric generic diagram over $Q$ is bounded by the terminalization theorem, since these additional steps do not extract divisors.
  ===== 6.5.2 Comparison with the output over $k$. <comparison-with-the-output-over-k.>
  Connect the output with field $k$ to $Z \/ B$ by log links from the same initial pair. These links are taken in the absolute common-start geography; the arbitrary eligible field $k$ need not contain $bb(C) \( Q \)$. If $B$ is not a surface with embedded field $k$, consider the first departure from $k$ along this path, as in Proposition 45. Call the common base of that link $Q'$. It has dimension at most one, its incoming endpoint has the original candidate $sigma_k \( L \, alpha \)$, and, when $Q'$ is a curve, its morphism to $Q'$ gives $bb(C) \( Q' \) subset k$. The bounded diagram over $Q'$ therefore forces that candidate to vanish by Lemma 44.
  If instead $B$ is a surface with $bb(C) \( B \) = k$, the bounded geometric generic diagram of $Z \/ B$ over the original $Q$ gives the same contradiction directly. Here $B arrow.r Q$ gives $bb(C) \( Q \) subset k$ when $Q$ is a curve, so the other application of Lemma 44 has its required field inclusion as well. Both alternatives contradict the nonzero candidate. ◻
]

=== 6.6 The intrinsic function and telescoping <the-intrinsic-function-and-telescoping>

We now attach the correction to a four-dimensional Mori node $V arrow.r B$. When $dim B = 3$, let $alpha in "Br" \( bb(C) \( B \) \) \[ 2 \]$ be the class of the generic conic. Define a function on the entire node by

#[#set math.equation(numbering: n => "(6.9)")
 $ s \( V \/ B \) = cases(delim: "{", 0 \, & dim B lt.eq 1 \,, w \( V \/ B \) \, & dim B = 2 \,, sigma_k \( bb(C) \( B \) \, alpha \) \, & dim B = 3 upright(" and some eligible ") k upright(" has nonzero candidate") \,, 0 \, & dim B = 3 upright(" and no such ") k upright(" exists") .) $ <sf:node-function>]

The function $w$ in base dimension two is the del Pezzo function of Definition 40.

#thm([Theorem 6.5.])[
  (Intrinsic correction).  #emph[For uniformly sufficiently large $d$, the function (6.9) is well defined. At a conic node its value equals the candidate of #emph[every] eligible embedded surface field, including fields whose candidate is zero. At either end of an ordinary four-dimensional link with common base of dimension at most one, its value is zero.]
] <sf:intrinsic>

#proof[
  If there is a nonzero candidate, Proposition 45 says that its eligible field is the only eligible field. If there is no nonzero candidate, all eligible candidates are zero and agree with the definition. In particular a zero candidate cannot be ignored in favour of a nonzero candidate from another field. The last assertion follows from Proposition 47, Lemma 46, and the definition when $dim B lt.eq 1$. ◻
]

#thm([Theorem 6.6.])[
  (Vanishing between Mori spaces over points).  #emph[There is a bound $d_0$ with the following property. Let $X_1$ and $X_2$ be normal projective $bb(Q)$-factorial terminal rationally connected complex fourfolds whose maps to $"Spec" bb(C)$ are Mori fibre spaces. For $d > d_0$, every birational map $f : X_1 arrow.r.dashed X_2$ satisfies 
$ c_u \( f \) = 0 . $

 The bound is independent of $X_1$, $X_2$, $f$, its Sarkisov factorization, and the chosen degree-$d$ test subcollection.]
] <sf:vanishing>

#proof[
  Choose an ordinary Sarkisov factorization supplied by Theorem 28, and orient each link from $V \/ B$ to $V' \/ B'$. Write $Delta$ for final minus initial value of a function on its nodes. Proposition 35 gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ c_u \( upright("link") \) - Delta v = H_Q = c_(u \, upright("hor") \/ Q) - Delta h_Q . $ <sf:residual>]
  We check $H_Q = Delta s$ in every dimension of the common base $Q$.
  If $dim Q lt.eq 1$, Proposition 36 gives $H_Q = 0$, while Theorem 48 gives $s = 0$ at both ends.
  If $dim Q = 3$, both endpoint bases have dimension three and are birational to $Q$. On the generic fibre the link is an isomorphism of smooth projective conics. Thus the endpoint base fields and quaternion classes are identified, including all eligible embedded surface fields and their candidates. Therefore $Delta s = 0$, which equals $H_Q$ by Proposition 36.
  Suppose $dim Q = 2$ and put $k = bb(C) \( Q \)$. In case (ii) of Lemma 38, the calculation of Proposition 42 gives $c_(u \, upright("hor") \/ Q) = Delta w$. Here $w$ is evaluated on the structured generic surface over $k$, including its conic structure when $dim B = 3$, as in Definition 40. On a del Pezzo side, $h_Q = 0$ and $s = w$. On a conic side, its generic curve base over $k$ is geometrically integral of genus zero. Lemma 39 identifies its singular-fibre set and component cover with $Delta_k$ and the residue cover. The common del Pezzo surface $W$ has positive degree, so (5.11) gives $r_k = deg_k Delta_k = 8 - K_W^2 lt.eq 7$. Hence $k$ is eligible. The same lemma gives $h_Q = - u \( Delta_k \)$, and by (6.2) and Theorem 48,
  $ s = w - h_Q . $
  This remains valid if the candidate is zero. Consequently $H_Q = Delta \( w - h_Q \) = Delta s$.
  In case (i) of Lemma 38, the structured generic surfaces are isomorphic after cancelling any identical generic contractions. Their exceptional horizontal contribution and $H_Q$ are zero by that lemma. At a del Pezzo node the Picard-class sets defining $w$ identify. At a conic node the isomorphism identifies the embedded base field and its quaternion class, so the intrinsic corrections identify. Thus $Delta s = 0$ here as well. This last argument requires no bound on the discriminant degree of an isomorphic conic structure.
  It follows from (6.10) that every link satisfies
  $ c_u \( upright("link") \) = Delta \( v + s \) . $
  Add over the factorization and use the cocycle property of Lemma 8. At a node over a point there are no vertical divisors in the defining difference for $v$, and $s = 0$ by definition. The sum therefore vanishes. All lower bounds on $d$ arose from the finitely many fixed families specified after (6.4); none depends on the length or starting resolution of the factorization. ◻
]

== 7 Cubic fourfolds of admissible discriminant <cub:section>

We now combine the two birational calculations. The first records an integral transcendental contribution in a smooth factorization; the second rules out that contribution along a Mori factorization, uniformly as the degree tends to infinity. On a cubic $X$, write $H$ for the hyperplane divisor and $h = c_1 \( cal(O)_X \( 1 \) \)$ for its cohomology class.

#thm([Proposition 7.1.])[
  (An irrationality criterion).  #emph[There is an integer $d_0$ with the following property. Let $X$ be a smooth complex cubic fourfold, and let 
$ A_X = H^4 \( X \, bb(Z) \) ∩ H^(2 \, 2) \( X \) \, #h(2em) T_X = A_X^perp subset H^4 \( X \, bb(Z) \) . $

 Suppose that 
$ "rank" T_X = 21 \, #h(2em) d = \| det T_X \| > d_0 \, #h(2em) "End"_(upright("Hdg")) \( T_X ⊗ bb(Q) \) = bb(Q) . $

 Then $X$ is not rational.]
] <cub:criterion>

#proof[
  Choose $d_0 > 2$ at least as large as the uniform bound in Theorem 49. Its uniformity allows the collection of K3 surfaces to be restricted to any specified integral transcendental Hodge-isometry class.
  Suppose that $f : bb(P)^4 arrow.r.dashed X$ is birational. Take as test collection the Picard-number-one K3 surfaces of degree $d$ whose transcendental Hodge lattice, after the shift of Hodge types and reversal of the cup pairing, is isometric to $T_X$. These surfaces have no nonidentity automorphisms by Lemma 18. The assumed rationality makes $X$ rationally connected, and the cubic Hodge calculation gives $h^(3 \, 1) \( X \) = 1$ #cite(label("Hassett00")) Section 2.1. Thus all hypotheses of Proposition 19 hold, and it gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ c_u \( f \) = 1 . $ <cub:one>]
  Both varieties are Mori fibre spaces over a point. Indeed, they are smooth, and integral weak Lefschetz and the exponential sequence give $"Pic" \( X \) = bb(Z) cal(O)_X \( 1 \)$, while adjunction gives $- K_X = 3 H$ #cite(label("HuybrechtsCubic2023")) Chapter 1, Section 1.1, Lemma 1.6 and Corollary 1.9. The ordinary Sarkisov program therefore factors $f$ into the links used in Theorem 49. Applying that theorem to this factorization yields $c_u \( f \) = 0$, contradicting (7.1). ◻
]

=== 7.1 The classical and categorical inputs <the-classical-and-categorical-inputs>

We use the following established results in their untwisted form, with the labellings and admissible discriminants defined in the introduction. Hassett’s period and lattice theorems #cite(label("Hassett00")) Theorems 1.0.1, 1.0.2 and 5.1.3; Corollary 5.2.4 give the nonempty irreducible divisor $cal(C)_d$ when $d > 6$ and $d equiv 0 \, 2 med \( mod med 6 \)$. For admissible $d$, a labelled cubic has an associated primitively polarized K3 surface $\( S \, L \)$ of degree $d$, with a Hodge isometry

#[#set math.equation(numbering: n => "(7.2)")
 $ K^perp tilde.eq L^perp \( - 1 \) \, $ <cub:associated>]

where the surface cup pairing is reversed. Hassett’s marked space also records an identification of the distinguished rank-two lattice $K$ with a fixed abstract lattice, preserving $h^2$. The map forgetting this identification is finite #cite(label("Hassett00")) Section 5.2 and Proposition 5.2.1. His marked space admits an open immersion into the moduli space of degree-$d$ polarized K3 surfaces #cite(label("Hassett00")) Corollary 5.2.4.

For such a cubic, there exists a smooth projective K3 surface $S'$ and an exact $bb(C)$-linear equivalence

#[#set math.equation(numbering: n => "(7.3)")
 $ "Ku" \( X \) tilde.eq D^b \( "Coh" \( S' \) \) . $ <cub:categorical>]

This is #cite(label("BLMPNS21")) Corollary 29.7; it applies to every cubic having a Hodge-theoretically associated K3 surface. Its target is the ordinary derived category. Already #cite(label("AddingtonThomas14")) Theorem 1.1 gives (7.3) on a Zariski open dense subset of each admissible $cal(C)_d$, which would suffice below. Those equivalences are Fourier–Mukai equivalences, so they have the exactness and $bb(C)$-linearity in Theorem 1.

=== 7.2 The very general transcendental lattice <the-very-general-transcendental-lattice>

#thm([Lemma 7.2.])[
  #emph[For each admissible $d$, a very general point $X in cal(C)_d$ satisfies 
#[#set math.equation(numbering: n => "(7.4)")
 $ "rank" A_X = 2 \, quad "rank" T_X = 21 \, quad \| det T_X \| = d \, quad "End"_(upright("Hdg")) \( T_X ⊗ bb(Q) \) = bb(Q) . $ <cub:generic-data>]

 Moreover, $T_X ⊗ bb(Q)$ is simple. All these assertions hold simultaneously with (7.3) outside a countable union of proper closed algebraic subsets of $cal(C)_d$.]
] <cub:generic>

#proof[
  We spell out the exceptional sets, including their algebraicity. Pass to Hassett’s marked space and then add finite level structure. Fix a smooth irreducible component that is finite and surjective over a dense open $U subset cal(C)_d$, and denote it by $U'$. The rank-two marking makes $K$ constant. Its orthogonal $bb(T) = K^perp$ is an integral polarized variation on $U'$; we trivialize this complementary local system only on period charts. All exceptional loci below are constructed on this one fixed cover.
  The cubic Hodge numbers and middle lattice are
  $ h^(3 \, 1) = h^(1 \, 3) = 1 \, quad h^(2 \, 2) = 21 \, quad b_4 = 23 \, #h(2em) H^4 \( X \, bb(Z) \) tilde.eq chevron.l 1 chevron.r^(xor 21) xor chevron.l - 1 chevron.r^(xor 2) \; $
  see #cite(label("Hassett00")) Section 2.1 and Proposition 2.1.2. Thus $bb(T)$ has rank $21$ and signature $\( 19 \, 2 \)$ for the cubic cup pairing. In a marked period chart its period line varies in an open subset of
  $ cal(D)_T = {\[ omega \] in bb(P) \( T ⊗ bb(C) \) : \( omega \, omega \) = 0 \, med \( omega \, overline(omega) \) < 0} . $
  Here $T$ denotes the underlying fixed lattice in that chart. The openness follows equivalently from the associated K3 period description (7.2). The domain $cal(D)_T$ is analytically open in a smooth irreducible projective quadric, and this quadric spans $bb(P) \( T ⊗ bb(C) \)$.
  For $0 eq.not t in T ⊗ bb(Q)$, consider the locus in $U'$ where some flat translate of $t$ is a Hodge class. After clearing denominators and Tate twisting, #cite(label("CDK95")) Theorem 1.1 and Corollary 1.3 makes this locus closed algebraic, with finitely many local branches. Here one fixed denominator works for the whole monodromy orbit, and the flat polarization has the same value on all its translates. The cited corollary obtains this orbit locus from images of connected components of the bounded-norm space of Hodge classes, which the theorem makes finite over the base. In a period chart each branch lies in $\( t' \)^perp ∩ cal(D)_T$ for a nonzero flat translate $t'$. Each such section is proper because the period domain spans $T ⊗ bb(C)$; hence the global locus is proper as well. There are countably many rational $t$. Since $H^4 \( X \, bb(Q) \) = K_(bb(Q)) xor K_(bb(Q))^perp$, excluding these loci removes every Hodge class outside $K_(bb(Q))$. Thus $A_X ⊗ bb(Q) = K ⊗ bb(Q)$; saturation gives $A_X = K$ and consequently $"rank" T_X = 21$.
  The middle lattice is unimodular, and both $A_X$ and $T_X$ are primitive. To recall the determinant argument, write $L = H^4 \( X \, bb(Z) \)$. Every homomorphism $A_X arrow.r bb(Z)$ extends to $L$, since $L \/ A_X$ is torsion-free. Unimodularity therefore makes the restriction map $L arrow.r A_X^(*)$ surjective with kernel $T_X$. Reducing modulo $A_X$ gives
  $ L \/ \( A_X xor T_X \) tilde.eq A_X^(*) \/ A_X . $
  Interchanging $A_X$ and $T_X$ gives the same quotient as $T_X^(*) \/ T_X$. The two discriminant groups have the same order; hence $\| det T_X \| = det A_X = d$.
  Next fix a nonscalar $a in "End"_(bb(Q)) \( T ⊗ bb(Q) \)$. If $a$ is a Hodge endomorphism, then $bb(C) omega$ is an eigenline for $a$. Hence its Hodge locus is contained in
  $ union.big_lambda bb(P) ker \( a - lambda \) ∩ cal(D)_T . $
  This is a finite union of proper linear sections of the period quadric. Indeed, an eigenspace equal to $T ⊗ bb(C)$ would make $a$ scalar; and an irreducible quadric spanning the ambient vector space cannot be contained in a finite union of proper linear subspaces. There are countably many rational endomorphisms $a$. Apply the same argument to the weight-zero polarized variation $"End" \( bb(T) \)$, clearing denominators. The locus where some flat translate of $a$ is Hodge is closed algebraic with finitely many local branches. Monodromy acts by conjugation and preserves nonscalarity, so the eigenline argument makes every local branch proper. These global loci are therefore proper. Excluding them gives $"End"_(upright("Hdg")) \( T_X ⊗ bb(Q) \) = bb(Q)$.
  For completeness, simplicity also follows directly from the Hodge numbers. By polarizability, a rational Hodge substructure has a Hodge complement. In any nontrivial direct-sum decomposition of $T_X ⊗ bb(Q)$, only one summand could contain the one-dimensional $\( 3 \, 1 \)$ part, and that summand would also contain its conjugate. Every other summand would consist entirely of rational $\( 2 \, 2 \)$ classes, contrary to the definition of $T_X$.
  Finally take the finite images in $U$ of the exceptional loci in $U'$. These images are closed and proper, since $U'$ is irreducible and finite over $U$. Their closures in $cal(C)_d$ are still proper. Adding $cal(C)_d \\ U$ gives a countable union of proper closed algebraic subsets, whose complement is nonempty over $bb(C)$. The categorical assertion holds throughout $cal(C)_d$ by (7.3); if one uses only the Addington–Thomas theorem, one additionally removes the complement of its dense open subset. This proves the simultaneous assertion. ◻
]

#proof[
  Let $d_0$ be as in Proposition 50, and fix any admissible $d > d_0$. The divisor $cal(C)_d$ is nonempty. By Lemma 51, outside a countable union of proper closed algebraic subsets of this divisor, the lattice $T_X$ has rank $21$, absolute determinant $d$, and rational Hodge endomorphism ring $bb(Q)$. The same lemma supplies an exact $bb(C)$-linear equivalence
  $ "Ku" \( X \) tilde.eq D^b \( "Coh" \( S \) \) $
  for a smooth projective K3 surface $S$. Proposition 50 applies to each such $X$ and proves that it is irrational.
  The integer $d_0$ was fixed before choosing $d$, so the conclusion holds very generally in every admissible $cal(C)_d$ with $d > d_0$. Its ineffectiveness is inherited from the uniform bound in Theorem 49. Such a cubic satisfies the categorical condition of Kuznetsov’s conjecture and fails its rationality condition; hence the categorical-to-rational implication is false. ◻
]

The sequence $d = 2 dot.op 7^j$ gives an explicit infinite subfamily of the admissible discriminants. For $j gt.eq 1$, one has $d > 6$ and $d equiv 2 med \( mod med 6 \)$; the prime $2$ occurs with exponent one, $3$ does not divide $d$, and the only odd prime divisor is $7 equiv 1 med \( mod med 3 \)$. Thus every member satisfies (1.1), and the theorem applies to all sufficiently large members of this sequence.

=== 7.3 Proofs of the consequences <cub:consequences>

We finish by combining Theorem 1 with the established K3 and zero-cycle results used in the introduction.

#proof[
  For admissible $d$, the classical input (7.2) supplies the indicated polarized K3 surface for every labelled cubic in $cal(C)_d$. Theorem 1 supplies irrationality on the stated very-general set for $d > d_0$. Since $K$ contains $h^2$, the isometry gives
  $ L^perp \( - 1 \) tilde.eq K^perp arrow.r.hook \( h^2 \)^perp = H^4 \( X \, bb(Z) \)_(upright("pr")) . $
  The inclusion is primitive: if a nonzero integer multiple of an integral class in $\( h^2 \)^perp$ is orthogonal to $K$, then the class itself is orthogonal to $K$. This is the primitive polarized K3 Hodge embedding in the cited formulation, with the stated Tate twist and pairing reversal. ◻
]

#proof[
  For $n gt.eq 2$, the integer $d = 2 n^2 + 2 n + 2$ is greater than six and is congruent to zero or two modulo six. Taking $a = 1$ realizes Addington’s condition $\( * * * \)$, namely $d = \( 2 n^2 + 2 n + 2 \) \/ a^2$ for integers $n \, a$ with $a eq.not 0$. That condition implies his condition $\( * * \)$, the remaining divisibility restrictions in (1.1); hence $d$ is admissible. Addington’s Theorem 2 then supplies the stated birationality for every $X in cal(C)_d$, with a projective K3 surface by his convention #cite(label("Addington16")) condition $\( * * * \)$, Theorem 2, and the convention in the introduction. Theorem 1 supplies irrationality for a very general such $X$ when $d > d_0$. Finally, the values $2 n^2 + 2 n + 2$ are strictly increasing and unbounded for $n gt.eq 2$, so infinitely many exceed $d_0$. ◻
]

#proof[
  First let $X in cal(C)_d$ be any cubic with a labelling $K$ of admissible discriminant $d$. The intersection form satisfies $\( h^2 \, h^2 \) = integral_X h^4 = 3$, so $h^2$ is primitive in the integral middle lattice: if $h^2 = m eta$ for an integral class $eta$, then $m^2$ divides $3$. It is therefore primitive in $K$ and extends to a basis $\( h^2 \, sigma \)$ of this rank-two lattice.
  Voisin’s Theorem 5.6 is stated for the lattice $P$ generated by the independent integral Hodge classes $h^2$ and $sigma$, which are algebraic on a smooth cubic fourfold as recalled in its proof #cite(label("Voisin17")) Theorem 5.6 and its proof. Here $P = K$, and its discriminant in that theorem is exactly
  $ D \( sigma \) = det mat(delim: "(", 3, h^2 dot.op sigma; h^2 dot.op sigma, sigma^2) = det K = d . $
  Admissibility includes $4 divides.not d$. Voisin’s theorem therefore gives universal triviality of $"CH"_0 \( X \)$ for every such labelled cubic, without requiring $K$ to be the entire lattice of Hodge classes or $X$ to be very general. The field-extension scope and the equivalence with the displayed integral Chow-theoretic decomposition are given in the introduction and equation (1) of the same paper #cite(label("Voisin17")). Theorem 1 supplies irrationality for the stated very general cubics when $d > d_0$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
