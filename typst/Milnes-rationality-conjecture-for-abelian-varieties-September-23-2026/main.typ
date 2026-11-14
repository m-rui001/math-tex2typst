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

#align(center)[#text(size: 16pt, weight: "bold")[Milne's rationality conjecture \
for abelian varieties]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

Suppose an abelian variety has good reduction at a prime.
  A rational algebraic cycle on the variety specializes to a cycle on the reduction.
  Its intersection with any complementary product of divisors has a rational degree,
  and every cycle-class realization computes that same number.
  Milne’s rationality conjecture asks for this conclusion when the original class is only known to be a rational
  Hodge class. We prove it for every residue characteristic.

The distinction matters because good reduction can acquire divisors that do not lift to the original variety.
  Deligne’s absolute-Hodge theorem gives compatible realizations of the Hodge class,
  but does not by itself identify its pairing with these new divisors as the degree of a rational cycle.
  The conjecture isolates this rationality question from the stronger problem of representing the Hodge class by
  an algebraic cycle.

Fix $overline(bb(Q)) subset bb(C)$, a prime $p$, and a $p$-adic place $w$ of $overline(bb(Q))$. Write

$ bb(F) = overline(bb(F))_p \, wide K_0 = "Frac" W \( bb(F) \) \, wide C_w = hat(overline(bb(Q)))_w . $

We regard $K_0$ and an algebraic closure of it as subfields of $C_w$.
  Good reduction means good reduction after descent to a number field and finite extension at the chosen place.

#thm([Theorem 1.1.])[
  #emph[Let $A \/ overline(bb(Q))$ be an abelian variety of dimension $d$ with good reduction $A_0 \/
    bb(F)$ at $w$. Let $0 lt.eq r lt.eq d$, and let
$ gamma in H^(2 r) \( A \( bb(C) \) \, bb(Q) \( r \) \) $

 be a rational Hodge class. For every list of Cartier divisors $D_1 \, dots.h \, D_(d - r)$ on $A_0$,
   there is a number $q in bb(Q)$ such that
$ "Tr"_ell #scale(x: 120%, y: 120%)[\(] gamma_(0 \, ell) c_(1 \, ell) \( D_1 \) dots.h.c
  c_(1 \, ell) \( D_(d - r) \) #scale(x: 120%, y: 120%)[\)] & =
  q &  & upright("in ") bb(Q)_ell quad \( ell eq.not p \) \,\
"Tr"_p #scale(x: 120%, y: 120%)[\(] gamma_(0 \, p) c_(1 \, upright("cris")) \( D_1 \) dots.h.c
  c_(1 \, upright("cris")) \( D_(d - r) \) #scale(x: 120%, y: 120%)[\)] & = q &  & upright("in ") C_w . $

 Here $gamma_(0 \, ell)$ is the smooth proper specialization of the $ell$-adic realization,
   and $gamma_(0 \, p)$ is the de Rham–crystalline specialization in
$ H_(upright("cris"))^(2 r) \( A_0 \/ W \( bb(F) \) \) \[ 1 \/ p \] \( r \) ⊗_(K_0) C_w . $

 The traces use the top Tate twist and send the class of a zero-cycle to its degree.
   If $r = d$, the divisor product is $1$.]
] <thm:main>

By linearity the same conclusion holds for every rational Lefschetz class of complementary codimension, that is,
  every rational linear combination of products of divisors.
  The number $q$ is common to all realizations for the fixed data;
  no comparison between different reduction places is required.

=== 1.1 Origins and consequences <origins-and-consequences>

Milne introduced a weak-rationality formulation while studying the reduction of Shimura varieties and the
  Langlands–Rapoport conjecture [20] Conjecture 6.1(A). It asks that a specialized CM Hodge class whose components
  lie in the local spans of divisor products in every realization arise from one rational Lefschetz class.
  The pairing formulation appears in his AIM notes and his study of rational Tate classes [22] Section 10,
  [24] Conjecture 4.1. A previous positive case is a CM abelian variety with simple ordinary reduction,
  together with all its powers: in that case every divisor class on the reduction lifts [24] Example 4.2.

The broader purpose is to obtain rational cohomological correspondences for abelian motives in characteristic $p$,
  compatible with reduction from characteristic zero [20] Sections 5–6; see also [29] Introduction and Section 2.
  For $ell eq.not p$, Tate classes are twisted $ell$-adic classes fixed by a power of Frobenius;
  there is a corresponding $bb(Q)_p$-algebra of crystalline Tate classes.
  A #emph[good theory of rational Tate classes] chooses one graded $bb(Q)$-algebra on each variety whose scalar
  extensions give these Tate algebras. The theory is stable under pullback and pushforward,
  contains divisor classes, and contains specializations of CM Hodge classes [24] Definitions 2.1 and 3.1.
  These are cohomological correspondences; their definition does not assert that they are algebraic.

Milne proved that the rationality assertion for all CM abelian varieties is equivalent to the existence of such a
  good theory on varieties over $bb(F)$ whose connected components are products of abelian varieties and
  projective spaces [24] Theorem 4.5. Our proof also expresses each specialized Hodge class as the pullback,
  along a rational homomorphism of special fibers, of a specialized Hodge class from a CM abelian variety.
  This extends the theory’s specialization property beyond the CM case.
  In Corollary 23, every rational Hodge class on a good-reduction abelian variety specializes to a unique class in
  one fixed good theory. Its crystalline component gives the stated specialization after extension to $C_w$.

A distinct additional input gives algebraicity on the special fiber.
  Combining the same transport with the Hodge theorem for CM abelian varieties [31] Theorem 1.1,
  Corollary 24 represents each specialized Hodge class by one rational algebraic cycle in all the stated
  realizations. Its pairing with any complementary algebraic cycle is therefore a rational intersection number.
  This consequence uses the CM Hodge theorem; the proof of Theorem 1 is independent of it.

=== 1.2 The method and its antecedents <the-method-and-its-antecedents>

Three foundational results make this question accessible.
  Deligne proved that every Hodge class on an abelian variety is absolute Hodge [6] Main Theorem 2.11.
  Blasius established its compatibility with $p$-adic comparison [3] Theorems 0.3 and 5.3;
  Moonen presents the Blasius–Wintenberger comparison theorem, with Ogus’s simplification,
  in the perfect-residue-field form needed for the local auxiliary lifts below [30] Theorem 5.6.3.
  Milne’s theory of Lefschetz classes supplies a common rational divisor algebra with perfect complementary
  pairing, independent of the Weil cohomology [19] Section 5.

The determinant classes used in the proof belong to the theory of Weil classes developed by Weil,
  Deligne and André; see [6] Section 4 and Endnotes M.10–M.12.
  André’s refinement of the CM reduction expresses Hodge classes by pullbacks from varieties of split Weil type
  [1]; a detailed account is [27] Theorem 1. We prove directly the balanced form of that reduction needed here in
  Lemma 21. Balanced signatures assert equal Hodge multiplicities at conjugate embeddings;
  split Weil type also requires the associated Hermitian form to have a half-dimensional isotropic subspace.
  André’s later theory of motivated cycles establishes a broader unconditional motivic setting for abelian Hodge
  classes [2] Theorem 0.6.2, without identifying them with algebraic cycles.

For an imaginary quadratic field, Markman has proved algebraicity of Weil classes on abelian fourfolds of Weil
  type and on abelian sixfolds of split Weil type [17] Theorem 1.2.
  These are characteristic-zero algebraicity results. The pairing argument here applies in arbitrary dimension and
  begins only with the Hodge class and its good reduction.

There is also a direct antecedent for the lifting strategy.
  Milne asked whether a specialized CM Hodge class and a divisor could be lifted together, up to isogeny,
  to a CM variety, and explained the resulting rationality implication [22] Question 10.6 and Proposition 10.7.
  His current account gives a conditional criterion through weak lifting of Lefschetz classes on CM Weil triples
  and describes the reduction from general Hodge classes through CM varieties to Weil classes [29] Introduction,
  Question 2.17, and Theorem 2.18. Our proof follows this general route,
  using two auxiliary varieties with different purposes. The first is CM;
  the second realizes a prescribed admissible filtration over a local field and need not be CM.
  The necessary realization machinery comes from Grothendieck–Serre–Tate deformation theory,
  Tate’s extension theorem, and the integral-model and local-Shimura results of Kisin–Zhou and Pappas–Rapoport
  [9,34,16,32]. For the prescribed filtration, we choose a framed local Shimura point over its admissible period
  and use integral uniformization; the required uniformization condition is supplied by [8] Corollary 6.3.
  We state the precise inputs where they enter and prove the connecting arguments for the prescribed flag.

The contribution along this route is to construct a filtration that preserves the extra divisor and then obtain a
  rational divisor identity on its lift. A separate normalization by rational intersection numbers makes the
  tensor transports simultaneous in all realizations. Kisin–Zhou’s compatibility theorem concerns Weil–Deligne
  representations across coefficient fields [16] Theorem 1.2;
  the additional issue here is the rational value of a Hodge–divisor intersection.

The key step is a dichotomy for balanced Weil classes: either all the complementary Lefschetz pairings vanish,
  or the specialized class is itself a rational polynomial in divisors, simultaneously in every realization.

=== 1.3 Proof overview <proof-overview>

The proof has four stages. The order below describes the deduction;
  Sections 3–5 establish its reusable constructions before Section 6 assembles them.

===== 1.3.1 1. Transport to a CM variety. <transport-to-a-cm-variety.>

Corollary 9 constructs a CM abelian variety $C \/ overline(bb(Q))$, a quasi-isogeny $a_(upright("CM")) :
  A_0^n arrow.r C_0$, and a rational Hodge class $kappa$ such that

$ gamma_0 = \( a_(upright("CM")) j \)^(*) kappa_0 \, $

where $j$ includes the first factor. This is one rational algebraic homomorphism on the special fibers and one
  equality in every realization. Kisin–Zhou’s special-point theorem supplies the CM lift [16] Theorem 2.2.7.
  The local tensors initially determine similitude scalars;
  a ratio of rational divisor intersections shows that all those scalars are the same rational number.
  This normalization is what transports the original rational class,
  rather than a separate local multiple in each cohomology theory.

===== 1.3.2 2. Reduce CM classes to balanced Weil classes. <reduce-cm-classes-to-balanced-weil-classes.>

Lemma 21 constructs rational-idempotent factors of actual powers of $C$.
  Their homology has rank $2 s$ over a CM field $E$, with signatures $\( s \, s \)$ at every embedding,
  and their polarizations induce conjugation on $E$. Their Weil classes are the rational forms whose components,
  after splitting $E$, are top alternating forms on individual $E$-eigenspaces.
  Pullbacks of these Hodge classes span the given CM Hodge class over $bb(Q)$. Good reduction is retained.
  Having one rational value for each complementary Lefschetz pairing is preserved by rational pullback (Lemma 4).
  It therefore remains to prove that assertion for balanced Weil classes.

===== 1.3.3 3. Find a divisor and a compatible filtration. <find-a-divisor-and-a-compatible-filtration.>

For a balanced Weil variety $Z$, let $dagger$ denote Rosati on its reduction and consider

$ cal(U) = { u in "End"^0 \( Z_0 \) : u^dagger = u \, quad u e = macron(e) u upright(" for all ") e in E } . $

Proposition 17 proves a dichotomy. If $cal(U)$ has no invertible element,
  every complementary Lefschetz pairing of a specialized Weil class is zero.
  If it has an invertible element, the specialized Weil class is itself a simultaneous rational Lefschetz class:
  one rational polynomial in divisors gives its class in every realization.
  For the second branch, such a $u$ supplies a divisor $D^u$ whose alternating form is nondegenerate on each
  $E$-eigenspace. Theorem 10 constructs a weakly admissible balanced filtration on the fixed crystalline module
  that preserves $E$, $u$, and the polarization. Generic transversality has a classical role in
  admissible-filtration constructions [7] Theorem 1 and Lemmas 1.1–1.2.
  Here bounded-degree avoidance makes all the constrained choices over one finite extension,
  and a maximality argument reduces the weak-admissibility test to subobjects stable under the endomorphisms.

===== 1.3.4 4. Lift the divisor and extract a rational identity. <lift-the-divisor-and-extract-a-rational-identity.>

The second case of Proposition 6 realizes this flag on a local auxiliary abelian variety $B$,
  with a marked quasi-isogeny $a_(upright("fl")) : Z_0^m arrow.r B_0$.
  The prescribed flag makes the first-summand projector, its algebraic $E$-action,
  and the transported divisor filtered. These specified algebraic maps lift to $B$.
  After choosing an abstract complex realization of $B$, polynomial coefficient extraction expresses the relevant
  rational Betti Weil class as a rational linear combination of divisor products (Lemma 19).
  The same rational identity specializes in every realization.
  Pullback returns it to $Z_0$, completing the case of an invertible element in the dichotomy and,
  through the first two stages, the main theorem.

Figure 1 separates the two lifts and their special-fiber markings.
  Section 2 fixes comparisons, traces, and rational pullback.
  Section 3 proves both transport alternatives; Section 4 constructs the prescribed flag;
  Section 5 proves the balanced-Weil dichotomy; and Section 6 proves the CM reduction and finishes the argument.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((3, 1), [CM transport])
  content((0, 0), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$A^n"/"overline( Q)$]]])])
  content((6, 0), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C"/"overline( Q)$\(CM\)]]])])
  content((0, -1.7), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$A_0^n$]]])])
  content((6, -1.7), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C_0$]]])])
  line((0, -0.55), (0, -1.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, -0.85), [#text(size: 9pt)[reduction]], anchor: "east", padding: 0.1176cm)
  line((6, -0.55), (6, -1.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6, -0.85), [#text(size: 9pt)[reduction]], anchor: "west", padding: 0.1176cm)
  line((2.15, -1.7), (3.85, -1.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3, -1.7), [#text(size: 9pt)[$a_( upright("CM") )$]], anchor: "south", padding: 0.1176cm)
  content((3, -2.65), [#text(size: 9pt)[$gamma_0=(a_( upright("CM") )j)^* kappa_0$]])
  content((3, -3.3), [Prescribed-filtration transport])
  content((0, -4.4), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$Z^m"/"overline( Q)$\(balanced Weil\)]]])])
  content((6, -4.4), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B"/"K$, $K"/"K_0$ finite]]])])
  content((0, -6.1), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$Z_0^m$]]])])
  content((6, -6.1), [#box(width: 4.3cm, height: 1.1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_0$]]])])
  line((0, -4.95), (0, -5.55), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, -5.25), [#text(size: 9pt)[reduction]], anchor: "east", padding: 0.1176cm)
  line((6, -4.95), (6, -5.55), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6, -5.25), [#text(size: 9pt)[reduction]], anchor: "west", padding: 0.1176cm)
  line((2.15, -6.1), (3.85, -6.1), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3, -6.1), [#text(size: 9pt)[$a_( upright("fl") )$]], anchor: "south", padding: 0.1176cm)
  content((3, -7.05), [#text(size: 9pt)[$a_( upright("fl") )^* "Fil"^1H^1_( upright("dR") )(B) =( cal(F)_Z^1)^( plus.o m)$]])
})],
  caption: [Figure 1: The two uses of transport. Each lower horizontal arrow is one actual quasi-isogeny preserving the specified tensors in all realizations; the vertical arrows denote good reduction. There is no claimed map between the generic fibers. The upper construction starts from the original variety. The lower construction is applied separately to a balanced Weil variety $Z$ arising in the CM reduction; its lift $B$ realizes the chosen filtration $cal(F)_Z^(xor m)$ under $a_(upright("fl"))^(*)$. The CM and prescribed-filtration auxiliaries need not coincide. ],
) <fig:two-transports>

== 2 Comparisons and rational Lefschetz classes <sec:preliminaries>

We first put the realizations in Theorem 1 in a common notation and formulate its conclusion as a property of
  cohomology classes. The essential functorial fact is that this property is preserved by rational pullback.
  We also record the criterion that will lift an additional divisor once a suitable Hodge filtration has been realized.

We work in the category of abelian varieties up to isogeny.
  Thus $"Hom"^0 \( X \, Y \) = "Hom" \( X \, Y \) ⊗_(bb(Z)) bb(Q)$, and divisors may have rational coefficients.
  Pullback by a rational homomorphism is defined on $H^1$ and extended to its exterior algebra.
  If $N f$ is an actual homomorphism, then on $H^(2 r)$

#[#set math.equation(numbering: n => "(2.1)")
 $ f^(*) = N^(- 2 r) \( N f \)^(*) . $ <eq:rational-pullback>]

This convention is the same in all realizations.

For an abelian variety $X \/ bb(F)$, set

$ k_ell = bb(Q)_ell quad \( ell eq.not p \) \, wide k_p = C_w \, $

and write $H_v^(2 r) \( X \) \( r \)$ for its $ell$-adic cohomology if $v = ell eq.not p$,
  and for crystalline cohomology extended to $C_w$ if $v = p$.
  Cup products will usually be written without a cup symbol.
  All trace maps and divisor classes have their cycle-class normalizations.
  The Betti Tate line $bb(Q) \( r \)$ supplies the twists in the other realizations through comparison.
  Thus $"Tr"_v$ is the trace on top cohomology with its top Tate twist and sends the class of a zero-cycle to its
  degree. For a good-reduction lift, $gamma_(0 \, ell)$ denotes smooth proper specialization of its absolute-Hodge
  realization, and $gamma_(0 \, p)$ denotes de Rham–crystalline specialization extended from $K_0$ to $C_w$.
  We keep first crystalline cohomology over $K_0$ when constructing filtrations,
  and specify each extension of the filtration field separately.

We use the exterior-algebra description of abelian cohomology and faithfulness of rational homomorphisms on $H^1$;
  see [18] Theorems 12.5 and 15.1 for the prime-to-characteristic realizations.
  The uniform Weil-cohomology formalism, including crystalline cohomology, exterior powers,
  cycle-normalized traces and the projection formula, is set out in [19] Section 1 and Appendix,
  Proposition (A.2). Smooth proper specialization away from $p$ is [25] Theorem 20.4.

=== 2.1 Comparison of Hodge tensors <comparison-of-hodge-tensors>

#thm([Lemma 2.1.])[
  #emph[For an abelian variety with good reduction, the realizations of an absolute Hodge class are compatible
    with the de Rham and crystalline comparison isomorphisms.
    In particular, the $p$-adic crystalline tensor obtained from its $p$-adic étale realization agrees,
    after extension of scalars, with the de Rham–crystalline realization in Theorem 1.
    These compatibilities respect tensor operations, duals, Tate twists, divisor classes, and rational homomorphisms.]
  #emph[The same assertion applies to auxiliary abelian varieties with good reduction over a finite extension of
    $K_0$, using a complex embedding of an algebraic closure of their field of definition.]
] <lem:comparison>

#proof[
  For abelian varieties over $overline(bb(Q))$, Deligne’s absolute-Hodge theorem [6] Main Theorem 2.11 and
    Blasius’s comparison theorem [3] Theorems 0.3 and 5.3 give the assertion.
    The compatibility of the crystalline comparison with the de Rham comparison is part of [3] §5.1.
    The formulation for a complete mixed-characteristic discrete valuation ring with perfect residue field is
    given in [30] Theorem 5.6.3; the paragraph following that theorem explains removal of the number-field
    hypothesis. A finite extension of $K_0$ is within that scope.
    The stated functorialities are those of the comparison isomorphisms. ◻
]

An abstract complex embedding used here need not be continuous.
  To see that it can be chosen compatibly with $overline(bb(Q)) subset bb(C)$,
  take a transcendence basis of $overline(K_0) \/ overline(bb(Q))$,
  embed it in a transcendence basis of $bb(C) \/ overline(bb(Q))$, and extend algebraically.
  The cardinalities permit this construction. No descent of a general auxiliary lift to $overline(bb(Q))$ is inferred.

=== 2.2 The common rational Lefschetz space <the-common-rational-lefschetz-space>

Let $"Lef"^r \( X \)$ be the space of rational polynomial expressions in divisors of codimension $r$,
  modulo numerical equivalence. We use the following established properties:

+ its cycle map is injective, and $"Lef"^r \( X \) ⊗_(bb(Q))
  k_v$ is the divisor-generated subspace of $H_v^(2 r) \( X \) \( r \)$;
+ intersection and degree give a perfect pairing
  $ "Lef"^r \( X \) times "Lef"^(dim X - r) \( X \) arrow.r bb(Q) \; $
+ pushforward by a homomorphism of abelian varieties preserves the divisor-generated subspaces in each realization;
+ hard Lefschetz and its inverse restrict to these subspaces.

These are [19] Proposition 5.2, Corollaries 5.3 and 5.5, Theorem 5.9,
  with the author’s correction to the proof of Theorem 5.9. Crystalline cohomology is included.
  Extension of its coefficient field to $C_w$ preserves these statements.
  We call the tuple of realizations of a fixed element of $"Lef"^r \( X \)$ a #emph[simultaneous rational
  Lefschetz class].

#prodef([Definition 2.2.])[
  A tuple $alpha = \( alpha_v \)_v$, with $alpha_v in H_v^(2 r) \( X \) \( r \)$,
    has the #emph[Lefschetz pairing property] if, for every $delta in "Lef"^(dim X - r) \( X \)$,
    the numbers $"Tr"_v \( alpha_v delta_v \)$ are the images of one number in $bb(Q)$.
]

Simultaneous rational algebraic classes have this property, by the intersection formula.
  The property is closed under rational linear combinations. We shall need the following additional closure property.

#thm([Lemma 2.3.])[
  #emph[If $alpha$ has the Lefschetz pairing property on $Y$ and $f in "Hom"^0 \( X \, Y \)$,
    then $f^(*) alpha$ has that property on $X$.]
] <lem:pairing-functorial>

#proof[
  If $r > dim Y$, the input class is zero; if $r > dim X$, its pullback is zero.
    We may therefore suppose that $f$ is an actual homomorphism and $r lt.eq min \( dim X \, dim Y \)$.
    For $delta in "Lef"^(dim X - r) \( X \)$, the class $f_(*)
    delta_v$ lies in the Lefschetz subspace of codimension $dim Y - r$ in every realization.
    Choose rational bases $a_i$ of $"Lef"^(dim Y - r) \( Y \)$ and $b_j$ of $"Lef"^r \( Y \)$.
    The matrix $M_(i j) = deg \( a_i b_j \)$ is an invertible rational matrix.
    If $f_(*) delta_v = sum_i c_(i \, v) \( a_i \)_v$, the projection formula gives
  $ sum_i c_(i \, v) M_(i j) = deg \( delta f^(*) b_j \) . $
  The right side is a rational number independent of $v$. Solving this one rational system shows that
    $c_(i \, v) = c_i in bb(Q)$ for every $v$. Thus $f_(*) delta$ is simultaneous rational Lefschetz.
    Applying the projection formula once more proves the assertion. For rational $f$, use (2.1). ◻
]

=== 2.3 Lifting a prescribed rational homomorphism <lifting-a-prescribed-rational-homomorphism>

The second transport construction will produce an abelian lift with a chosen Hodge filtration.
  The following criterion then lifts the algebraic projector, field action,
  and divisor already specified on its special fiber. Its input is a rational algebraic homomorphism,
  rather than an arbitrary map between cohomology spaces.

In the next lemma $R$ is a complete mixed-characteristic discrete valuation ring finite over $W \( bb(F) \)$,
  with fraction field $K$. For an abelian scheme $cal(X) \/ R$,
  the Hodge filtration is regarded as a filtration of
  $H_(upright("cris"))^1 \( X_0 \/ W \( bb(F) \) \) \[ 1 \/ p \] ⊗_(K_0) K$.

#thm([Lemma 2.4.])[
  #emph[Let $cal(X) \, cal(Y)$ be abelian schemes over $R$, with special fibers $X_0 \, Y_0$,
    and let $f_0 in "Hom"^0 \( X_0 \, Y_0 \)$. If its contravariant crystalline map preserves the Hodge
    filtrations, then $f_0$ lifts uniquely to a rational homomorphism $cal(X) arrow.r cal(Y)$.]
  #emph[In particular, a symmetric rational homomorphism $X_0 arrow.r
    X_0^or$ with this property lifts to a rational divisor class on the generic fiber.
    Algebraic identities among finitely many such lifted maps remain valid.]
] <lem:lift-hom>

#proof[
  The crystalline map already commutes with Frobenius. Full faithfulness for rational filtered Dieudonné modules
    gives a rational morphism of the associated $p$-divisible groups;
    see [9] and the perfect-residue-field formulation in [11] §4.2(v).
    Equivalently, crystalline comparison first gives the rational map on Tate modules.
    Multiply by an integer $N$ that clears both its Tate-lattice denominator and the denominator of $f_0$.
    Tate’s extension theorem [34] Theorem 4 extends the resulting integral generic-fiber map of $p$-divisible
    groups over $R$. Faithfulness of the special-fiber Dieudonné functor identifies its reduction with the map
    induced by $N f_0$. Here equality after inverting $p$ is already equality of integral maps,
    because the integral Dieudonné modules are torsion free. The integer $N$ is fixed for the remainder of the
    construction.
  The specified-map form of Serre–Tate deformation theory now gives a lift over each $R \/
    frak(m)_R^n$ [9] p. 432. One can also deduce it from the fixed-object formulation [11] Theorem 2.3.3 as
    follows. On $X_0 times Y_0$ form the shear $s_0 \( x \, y \) = \( x \, y + N f_0 \( x \) \)$.
    The lifted $p$-divisible-group map gives the same shear on the product $p$-divisible group.
    View the existing product deformation with two special-fiber markings differing by $s_0$.
    Full faithfulness lifts the shear to an algebraic isomorphism between these marked deformations;
    its second component restricted to $X$ lifts $N f_0$. Uniqueness makes these maps compatible at every finite order.
  Formal existence algebraizes the resulting formal map [33] Tag 0A42:
    its source is proper over the complete noetherian ring $R$, and its target is separated and of finite type.
    Dividing by the fixed $N$ gives the desired rational lift.
    Rigidity gives uniqueness and injectivity of specialization on rational homomorphisms [18] Proposition 20.1
    and Corollary 20.2.
  If $f_0$ is symmetric, injectivity shows that its lift is symmetric. The usual identification
  $ "NS" \( X_K \) ⊗ bb(Q) tilde.eq "Hom" \( X_K \, X_K^or \)^(upright("sym")) ⊗ bb(Q) $
  gives the rational divisor class, after a finite extension if necessary [18] Proposition 17.2.
    Finally an identity between the maps specializes to the given identity, so injectivity proves it upstairs as well. ◻
]

Only prescribed rational algebraic maps on the special fiber are being lifted in Lemma 5.
  An arbitrary $bb(Q)_p$-linear map of $p$-divisible groups is not asserted to be a rational algebraic map.
  We also use the extension of generic-fiber homomorphisms between abelian schemes over a discrete valuation ring:
  their Néron mapping property extends such a homomorphism uniquely over the base [5] Definition 5.1 and
  Example 5.3. Clearing one rational denominator therefore makes specialization of these maps well defined.

== 3 Transport through Hodge-type integral models <sec:transport>

After taking a power of the original abelian variety, we transport a rational Hodge class to an auxiliary variety
  by one quasi-isogeny on special fibers, with the same equality in every realization.
  The auxiliary variety can be chosen either of CM type or with a prescribed admissible Hodge filtration.
  These choices serve different parts of the proof, but share the tensor construction and the rational
  normalization in Proposition 6 below.

Throughout this section, a polarization on a rational homology space is written as a rational alternating form,
  using the fixed Betti trivialization of the Tate line. If its similitude character is $c$,
  an alternating form $xi : V^(2 r) arrow.r bb(Q)$ of multiplier $c^r$ means that

#[#set math.equation(numbering: n => "(3.1)")
 $ xi \( g v_1 \, dots.h \, g v_(2 r) \) = c \( g \)^r xi \( v_1 \, dots.h \, v_(2 r) \) . $ <eq:transport-multiplier>]

Such a form is regarded as a tensor with its codimension-$r$ Tate twist.
  All homomorphisms and polarizations may be rational: an isomorphism in the isogeny category induces the usual
  isomorphisms on cohomology, including its tensor constructions.

We say that filtered isocrystal data have #emph[finite local-field descent] if they are obtained by scalar
  extension from an isocrystal with its tensors over the maximal unramified subfield $H_0$ of a finite extension
  $H \/ bb(Q)_p$, together with a filtration over $H$. The scalar extension is to $K_0 H$.
  This condition will let us apply weak admissibility over a finite local field.
  For a group in a faithful representation, a tensor-preserving identification means one respecting a finite
  family of rational tensors whose stabilizer is that group, together with their comparison realizations.

#thm([Proposition 3.1.])[
  (Transport).  #emph[Let $A \/ overline(bb(Q))$ be an abelian variety of positive dimension with good reduction
    at $w$, and put $V = H_1 \( A \( bb(C) \) \, bb(Q) \)$. Suppose
$ G subset "GSp" \( V \, psi \) $

 is connected reductive, its Hodge homomorphism $h$ gives the Hodge structure of $A$,
   and its conjugacy class $X$ makes this inclusion a Hodge embedding.
   Let $gamma$ be a rational Hodge class of codimension $r$,
   represented on $V$ by an alternating form satisfying (3.1).]
  #emph[Then there exist a positive integer $n$, an auxiliary good-reduction abelian variety $B$,
    a quasi-isogeny $a : A_0^n arrow.r B_0$, and a rational Hodge class $kappa$ of codimension $r$ on $B$ such
    that, for the first-factor inclusion $j : A_0 arrow.r A_0^n$,
#[#set math.equation(numbering: n => "(3.2)")
 $ \( a j \)^(*) kappa_0 = gamma_0 . $ <eq:transport-class>]

 The equality holds simultaneously in every $ell$-adic realization with $ell eq.not
   p$ and in the crystalline realization after extension to $C_w$.
   Either of the following two further specifications can be imposed.]
  + #emph[The variety $B$ is of CM type and is defined over $overline(bb(Q))$,
    with its indicated good reduction at $w$.]
  + #emph[Put $D_A = H_(upright("cris"))^1 \( A_0 \/ W \( bb(F) \) \) \[ 1 \/ p \]$.
    Suppose $cal(F)_A$ is a filtration in degrees $0 \, 1$ on $D_A$, over a finite extension of $K_0$,
    which is weakly admissible and has finite local-field descent together with the specialized tensors specifying
    the $G$-structure. Suppose also that, after a geometric tensor-preserving identification,
    it lies in the $G$-orbit of the original Hodge filtration.
    Then $B$ can be defined over a finite extension $K \/ K_0$ inside $C_w$, and $a$ can be chosen so that
#[#set math.equation(numbering: n => "(3.3)")
 $ a^(*) "Fil"^1 H_(upright("dR"))^1 \( B \/ K \) = \( cal(F)_A^1 \)^(xor n) . $ <eq:transport-prescribed-filtration>]

 Here the equality is made after a common finite extension and crystalline–de Rham identification.
   To discuss Hodge classes on this $B$, choose a complex embedding of an algebraic closure of $K$ extending the
   fixed embedding of $overline(bb(Q))$.]
  #emph[In the second case the realizations of $kappa$ are supplied by the canonical tensor sections of the
    Hodge-type model and the polarization. In the first case these agree with the usual realizations and
    specialization of its absolute Hodge class.]
] <prop:transport>

We prepare two ingredients for the proof. First, we enlarge the given Hodge datum so that integral-model theorems
  apply at every prime while its rational representation remains a sum of copies of $V$.
  Second, we realize a prescribed admissible filtration by choosing a framed local Shimura point above its
  crystalline period and applying integral uniformization. The resulting abelian lift retains that point’s
  integral tensors and special-fiber marking. After these preparations,
  the proof constructs the transported tensor and normalizes it using rational divisor intersections.

=== 3.1 An auxiliary strongly admissible datum <an-auxiliary-strongly-admissible-datum>

We recall the hypotheses on integral models that we will use.
  For a reductive group $H_p \/ bb(Q)_p$, a full Bruhat–Tits stabilizer is the smooth group scheme fixing a point
  of its extended building. Its identity component is the associated parahoric group scheme.
  Now let $\( H \, X_H \)$ be a Shimura datum over $bb(Q)$.
  In the terminology of [16] Definition 2.1.6, the triple $\( H \, X_H \, cal(H) \)$ is #emph[strongly admissible]
  if $\( H \, X_H \)$ is of Hodge type, $cal(H)$ is a full stabilizer of $H_(bb(Q)_p)$ with connected special
  fiber, the centralizer of a maximal $K_0$-split torus of $H_(K_0)$ is $R$-smooth,
  and the relative root system over $K_0$ is reduced when $p = 2$.
  Here $R$-smoothness is the condition on tori used in [15] §2.4.
  We will use it only for products and extensions of restrictions of scalars of split tori,
  for which it holds by [15] Proposition 2.4.6.

#thm([Lemma 3.2.])[
  (Auxiliary Hodge datum).  #emph[Let
$ \( G \, X \) arrow.r.hook \( "GSp" \( V \, psi \) \, X_(upright("Siegel")) \) $

 be a Hodge embedding, with $G$ connected and similitude character $c$.
   For every prime $p$ there exist a totally real field $P$, a connected reductive group $J$, and a Hodge embedding
$ \( J \, X_J \) arrow.r.hook \( "GSp" \( W \, psi_W \) \, X'_(upright("Siegel")) \) $

 with the following properties.]
  + #emph[There are inclusions of Shimura data induced by
$ G arrow.r J arrow.r "Res"_(P \/ bb(Q)) G_P \, $

 where the first map is diagonal and $J$ is the subgroup on which the similitude multipliers in the restriction of
   scalars agree.]
  + #emph[The group $J_(bb(Q)_p)$ is quasi-split and has a full connected stabilizer $cal(J)$ making
    $\( J \, X_J \, cal(J) \)$ strongly admissible.]
  + #emph[As a rational $J$-representation,
#[#set math.equation(numbering: n => "(3.4)")
 $ W tilde.eq \( V ⊗_(bb(Q)) P \)^(xor m) $ <eq:transport-copies>]

 for some positive integer $m$. The form $psi_W$ has multiplier the common character $c$, and $cal(J) arrow.r
   "GL" \( W_(bb(Q)_p) \)$ extends to a closed immersion into $"GL" \( Lambda_p \)$ for a self-dual
   $bb(Z)_p$-lattice $Lambda_p$.]
] <lem:auxiliary-datum>

#proof[
  Choose a finite extension of $bb(Q)_p$ splitting $G_(bb(Q)_p)$.
    Polynomial approximation, together with Krasner’s lemma [26] Propositions 7.60–7.61 and Corollary 7.62,
    gives a totally real number field $P$ whose completions at $p$ split $G_(bb(Q)_p)$.
    For example, approximate the minimal polynomial of a primitive element of a splitting extension at $p$,
    and a polynomial with distinct real roots at the real place.
    The resulting number field can have just one place above $p$; this additional condition is not needed.
  Define the multiplier fiber product
  #[#set math.equation(numbering: n => "(3.5)")
   $ J = \( "Res"_(P \/ bb(Q)) G_P \) times_("Res"_(P \/ bb(Q)) upright(bold(G))_m) upright(bold(G))_m \,
     $ <eq:equal-multiplier-group>]
  where the last map is diagonal. The Hodge cocharacter, or its inverse according to convention,
    pairs to $1$ with $c$. Since $c$ factors through $G^(upright("ab"))$,
    its character on this torus is primitive. Thus $ker \( G^(upright("ab")) arrow.r upright(bold(G))_m \)$ is a
    torus, and $ker \( c : G arrow.r upright(bold(G))_m \)$ is connected reductive. The exact sequence
  $ 1 arrow.r "Res"_(P \/ bb(Q)) \( ker c \)_P arrow.r J arrow.r^c upright(bold(G))_m arrow.r 1 $
  proves connectedness and reductivity of $J$. Moreover,
  #[#set math.equation(numbering: n => "(3.6)")
   $ J^(upright("der")) = "Res"_(P \/ bb(Q)) G_P^(upright("der")) . $ <eq:auxiliary-derived>]
  The action on $U = V ⊗_(bb(Q)) P$, with alternating form $"Tr"_(P \/ bb(Q)) psi_P$,
    gives a symplectic embedding of $J$ with similitude character $c$.
    The diagonal Hodge homomorphism gives $X_J$. The adjoint Hodge-type and Cartan-involution axioms follow
    componentwise from those for $X$. We also check that extending the totally real field introduces no rational
    adjoint factor on which the Hodge homomorphism is trivial.
    Write a rational simple adjoint factor as $"Res"_(L \/ bb(Q)) H$, with $L$ totally real.
    Every field factor $L'$ of $P ⊗_(bb(Q)) L$ is totally real,
    and every real embedding of $L$ extends to a real embedding of $L'$.
    Hence the existence of a nontrivial Hodge component for $H$ persists in each resulting rational factor.
    Finally the diagonal weight is rational and the trace form is a polarization.
    This proves that $\( J \, X_J \)$ is a Shimura datum of Hodge type.
  Here are the local conditions explicitly. Put $P ⊗ bb(Q)_p =
    product_(v divides p) P_v$ and choose a split maximal torus $T_v$ of $G_(P_v)$.
    The character $c$ on $T_v$ has a cocharacter section: a conjugate of the Hodge cocharacter pairs to $1$ with
    it, and all cocharacters of a split torus are defined over $P_v$.
    The same argument applies to $G_(P_v)^(upright("ab"))$. Consequently the maximal torus of $J_(bb(Q)_p)$
    obtained from the $T_v$, and the abelianization of $J_(bb(Q)_p)$, have the forms
  #[#set math.equation(numbering: n => "(3.7)")
   $ T_J & tilde.eq upright(bold(G))_m times product_(v divides p) "Res"_(P_v \/ bb(Q)_p)
     upright(bold(G))_m^("rk" G - 1) \,\
J_(bb(Q)_p)^(upright("ab")) & tilde.eq upright(bold(G))_m times
  product_(v divides p) "Res"_(P_v \/ bb(Q)_p) upright(bold(G))_m^(dim G^(upright("ab")) - 1) . $ <eq:auxiliary-torus>]
  The split Borels over the $P_v$ give a Borel of $J_(bb(Q)_p)$, so this group is quasi-split.
    Its derived group is a product of restrictions of split groups by (3.6).
    The vertices from the hyperspecial vertices in those split groups give a very special parahoric of
    $J_(bb(Q)_p)$. The inertia coinvariants of the cocharacter module in (3.7) are torsion-free,
    since that module is a direct sum of permutation modules.
    The full stabilizer is therefore connected by [15] Lemma 4.2.4.
  The centralizer of a maximal $K_0$-split torus is obtained from (3.7) by unramified base extension;
    its torus factors are still induced split tori and $upright(bold(G))_m$.
    It is $R$-smooth by [15] Proposition 2.4.6. Finally restrictions of split root systems give reduced relative
    root systems, also at $p = 2$. These are precisely the strong-admissibility checks in the construction of [16]
    Proposition 5.3.8. They use the stipulated Hodge embedding,
    not the assertion that $G$ is the full Mumford–Tate group of a particular point.
  Apply [16] Proposition 2.1.9, starting with the representation $U$ just constructed.
    Its proof first tensors $U$ with an auxiliary totally real $bb(Q)$-vector space, then takes direct sums,
    and finally applies the symplectic self-duality construction.
    The group acts trivially on that extra vector-space factor.
    In the last construction the dual representation twisted by $c$ is identified with $U$ by its symplectic form.
    Thus every resulting rational summand is a copy of $U$, with the same multiplier.
    This gives (3.4), together with $psi_W$ and $Lambda_p$. The assertion of the cited proposition includes $p =
    2$; its proof uses the reduced-relative-root condition through [16] Lemma 2.1.8. ◻
]

Choose a sufficiently small neat prime-to-$p$ level $K^p$ and put $K_p = cal(J) \( bb(Z)_p \)$.
  The adapted embedding gives the integral model $cal(S)_K$ and its universal abelian scheme.
  A rational $bb(Z)_(\( p \))$-lattice can be chosen with completion $Lambda_p$.
  We use a finite family of tensors defining its stabilizer $cal(J)$, as in [16] §2.1.4.
  Any additional rational $J$-invariant tensors may be included in this family after clearing denominators.
  Indeed their integral stabilizer condition already holds on the generic fiber;
  flatness of $cal(J)$ makes it hold on $cal(J)$ itself. Adding them therefore changes neither the group scheme
  nor its tensor trivializations.

The added tensors have compatible sections in every realization, as follows.
  Use the homological degree-one realizations in this paragraph, that is, the duals of the corresponding $H^1$,
  so that their reference representation is $W$. For such a realization $H_nu$ over its coefficient field $k_nu$, let

$ cal(P)_nu = "Isom"_({ s_alpha }) \( W ⊗ k_nu \, H_nu \) $

be its torsor of frames preserving the original defining tensors.
  For a rational $J$-invariant tensor $u$ and a frame $e$, set $u_nu = e \( u \)$.
  Two frames differ by an element of $J$, so this definition is independent of the frame and descends from a
  trivialization of the torsor. It also works integrally after clearing the fixed denominator of $u$.

The Betti and étale frame torsors are supplied by the canonical tensor sections of [16] §2.1.4.
  The construction of the universal Breuil–Kisin–Fargues module and its structure tensors gives the crystalline
  torsor and its compatibility with those sections [16] §§2.1.13–2.1.14.
  Indeed, a comparison map carrying every $s_alpha$ to its specified realization carries a frame $e$ to the
  comparison of $e$; it therefore carries $e \( u \)$ to the same tensor evaluated in the new frame.
  Thus it preserves $u_nu$ for every added invariant $u$, without requiring $u$ to be an expression in the chosen
  defining tensors. At a lift over $overline(bb(Q))$, these are the realizations of its rational Hodge tensor,
  by Lemma 2. Their crystalline specializations are independent of the lift because they are evaluations in the
  fixed crystalline frame torsor.

The same observation applies to isogenies. One quasi-isogeny preserving the defining tensors identifies their
  frame torsors in every realization in which those tensors are preserved.
  It therefore preserves all the added invariant tensors as well.
  This proves the tensor comparison and simultaneous preservation that will be used below;
  flatness alone is used only to keep the integral stabilizer unchanged.

Specification (1) of Proposition 6 uses the special-point theorem [16] Theorem 2.2.7 directly.
  The next lemma is needed only for specification (2), where the filtration has been prescribed in advance.

=== 3.2 Realizing a prescribed admissible filtration <realizing-a-prescribed-admissible-filtration>

For a point $x in cal(S)_K \( bb(F) \)$ let $C_x$ be the corresponding abelian variety and put

$ bb(D)_x = H_(upright("cris"))^1 \( C_x \/ W \( bb(F) \) \) \, wide D_x = bb(D)_x \[ 1 \/ p \] . $

The crystalline structure tensors are denoted $s_(alpha \, 0 \, x)$;
  the tensors away from $p$ are denoted $s_(alpha \, ell \, x)$.
  They are the specializations of the canonical tensor sections and are independent of the chosen lift of $x$.

The #emph[tensor isogeny class] $cal(I)_x$ consists of the points $y in
  cal(S)_K \( bb(F) \)$ for which a single quasi-isogeny $C_x arrow.r
  C_y$ preserves $s_(alpha \, 0)$ and every $s_(alpha \, ell)$ for $ell eq.not p$.
  We emphasize that this definition concerns actual quasi-isogenies of abelian varieties.
  It is the class defined in [16] §2.2.4.

#thm([Lemma 3.3.])[
  (Realization of an admissible filtration).  #emph[Let $\( J \, X_J \, cal(J) \)$ be strongly admissible,
    with $J_(bb(Q)_p)$ quasi-split, and choose the adapted embedding and neat level above.
    Let $x in cal(S)_K \( bb(F) \)$ have a lift to characteristic zero.
    Suppose a filtration $cal(F)$ on $D_x$, after a finite extension of $K_0$, has the following properties:]
  + #emph[the resulting filtered isocrystal is admissible;]
  + #emph[geometrically its filtration is induced by a $J$-valued cocharacter in the conjugacy class prescribed by
    $X_J$.]
  #emph[Then, after extending that field finitely, there are $y in cal(I)_x$,
    a tensor-preserving quasi-isogeny $b : C_x arrow.r C_y$, and a lift $tilde(y)$ over the extended valuation
    ring such that
$ b^(*) "Fil"^1 H_(upright("dR"))^1 \( C_(tilde(y)) \) = cal(F)^1 $

 under the crystalline–de Rham identification.]
  #emph[In particular, condition (1) follows if the filtered isocrystal and its tensor data have finite
    local-field descent and $cal(F)$ is weakly admissible.]
] <lem:admissible-realization>

#proof[
  Write $k = bb(F)$ and let $breve(E)$ be the completed local reflex field.
    We work over a common finite extension $K$ of $K_0$ containing $breve(E)$ and a field of definition of
    $cal(F)$. Every further field extension below is finite. Put $K_p = cal(J) \( bb(Z)_p \)$.
  We first fix the relation between the group and cohomological conventions.
    Let $rho : J_(bb(Q)_p) arrow.r "GL" \( W_(bb(Q)_p) \)$ be the adapted homological representation and let
    $rho^or$ be its dual. Choose the tensor-preserving identification $bb(D)_x tilde.eq Lambda_p^or ⊗_(bb(Z)_p)
    W \( k \)$ of [16] §2.1.14. The local shtuka parameter is $b_x in J \( K_0 \)$,
    whereas crystalline Frobenius on this cohomological Dieudonné module is
  $ F_x = rho^or \( sigma \( b_x \) \) compose sigma . $
  The additional $sigma$ on $b_x$ comes from the comparison with the vector shtuka:
    its special-fiber module is $\( sigma^(- 1) \)^(*) \( bb(D)_x^or \)$ [32] Example 2.3.4 and Remark 2.3.10.
    Write ${ mu }$ for the class prescribed by $X_J$; then $\[ b_x \] in B \( J \, mu^(- 1) \)$.
  For precision, identify the general linear crystalline period flag with the appropriate filtration variety on
    $D_x$ by its marked Rapoport–Zink interpretation. If a deformation $cal(H)$ has special-fiber marking $q :
    cal(H)_k arrow.r.dashed C_x \[ p^oo \]$, this identification sends its period to $\( q^(*) \)^(- 1) "Fil"^1
    H_(upright("dR"))^1 \( cal(H) \)$. Pushout through the faithful Hodge representation gives the commutative
    period square
  $ M_(cal(J) \, b_x \, mu \, K_p) & arrow.r & M_("GL" \, rho \( b_x \) \, rho \( mu \))\
pi_(upright("GM")) arrow.b &  & arrow.b pi_(upright("GM"))\
cal(F)_(J \, mu) & arrow.r & "Flag" \( D_x \) . $
  The lower map is a closed immersion: the parabolic stabilizing the faithful filtration intersects $J$ in the
    parabolic for $mu$. Define $f_(cal(F))$ to be the unique $J$-flag with image $cal(F)$.
    It exists by condition (2). The square uses crystalline periods and the dual Frobenius descent above,
    so no extension of $sigma$ to the ramified filtration field is chosen.
    When $q = b^(- 1)$ its lower right period is exactly $b^(*) "Fil"^1$.
  #emph[A framed point over the prescribed period.] Admissibility of the faithful filtered isocrystal implies that
    the image of $f_(cal(F))$ in the general linear period flag variety is in its admissible locus.
    To see this in the cohomological coordinates of the square,
    let $U$ be a crystalline representation realizing $\( D_x \, cal(F) \)$.
    Its crystalline comparison identifies the associated vector bundle away from the untilt with $U ⊗ cal(O)$.
    The filtered de Rham comparison identifies the modification at the untilt with the standard lattice $U ⊗
    B_(upright("dR"))^(+)$. They glue to the trivial bundle $U ⊗ cal(O)$ on the Fargues–Fontaine curve,
    which is the general linear admissibility condition. Since $rho$ is faithful,
    $rho^(- 1) \( Z_("GL" \( W \)) \) subset Z_J$: an element acting as a scalar commutes with the faithful image
    of $J$. The admissible-locus identity in [32] Proposition 3.1.1(i),
    (3.1.9) therefore puts $f_(cal(F))$ in $cal(F)_(J \, mu)^(upright("adm"))$.
  This locus is the image of the crystalline period map
  $ pi_(upright("GM")) : M_(cal(J) \, b_x \, mu \, K_p) arrow.r cal(F)_(J \, mu)^(upright("adm")) . $
  The map is étale [32] §3.1.1, (3.1.4). Its fiber at the classical point $f_(cal(F))$ is nonempty;
    an étale rigid space over $K$ has a point over a finite extension of $K$. After making that extension, choose
  #[#set math.equation(numbering: n => "(3.8)")
   $ z in M_(cal(J) \, b_x \, mu \, K_p) \( K \) \, wide pi_(upright("GM")) \( z \) =
     f_(cal(F)) . $ <eq:transport-framed-point>]
  In particular $z$ supplies the integral level as well as the rational isocrystal marking.
    If $C$ is the completed algebraic closure of $K$, its moduli description gives an actual $cal(J)$-torsor
    $cal(P)_z$, a Frobenius isomorphism bounded by $mu$, and, for sufficiently large $a$, an isomorphism
  $ i_a : cal(J)_(Y_(\[ a \, oo \)) \( C^flat \)) arrow.r^(med tilde.op med)
    cal(P)_z \|_(Y_(\[ a \, oo \)) \( C^flat \)) \, wide phi_(cal(P)_z) compose phi^(*) i_a = i_a compose phi_(b_x) . $
  These are precisely the torsor and annular framing in [32] §3.1.1.
    Its associated pro-étale $cal(J) \( bb(Z)_p \)$-torsor gives integral tensor frames.
    Thus the integral structure and Frobenius-compatible framing are part of the chosen point,
    with all their tensor compatibilities.
  #emph[Integral realization and its special fiber.] Our adapted datum is of global Hodge type:
    the group scheme is a full connected Bruhat–Tits stabilizer,
    and the chosen Hodge embedding is integral on $Lambda_p$.
    The center also satisfies the split-rank hypothesis of [32] §4.1.
    Indeed its real subgroup of multiplier one preserves the positive definite form $psi_W \( v \, h \( i \) w \)$
    and is compact. Its real split rank is therefore at most one,
    while the rational weight torus supplies one split central direction over $bb(Q)$; both split ranks are one.
    The model here is the one in [16] §2.1.11 and Theorem 2.1.12,
    obtained from this adapted Hodge embedding and satisfying the Pappas–Rapoport characterization.
    Condition $\( U_x \)$ holds by [8] Corollary 6.3; see also [32] Remark 4.10.4.
    Consequently [32] Theorem 4.10.6 represents the integral local Shimura variety by a normal formal scheme
    $frak(M)_(cal(J) \, b_x \, mu)$ and gives the morphism
  $ Theta_x : frak(M)_(cal(J) \, b_x \, mu) arrow.r hat(cal(S)_K) . $
  More precisely, [32] §4.10.2, (4.10.2)–(4.10.6) identifies this formal scheme with the tensor-compatible open
    and closed part of the pullback of the Siegel Rapoport–Zink space.
    This construction identifies the pullback of the universal $cal(J)$-shtuka with its tautological framed shtuka
    and the faithful vector realization with the universal $p$-divisible group.
  Its rigid generic fiber is the local Shimura variety [32] Proposition 3.5.1(i).
    The classical point $z$ of this rigid generic fiber gives $"Spf" cal(O)_K arrow.r
    frak(M)_(cal(J) \, b_x \, mu)$. Indeed it lies in the generic fiber of a formal affine chart;
    for a special formal chart one may take an affinoid member of its standard generic-fiber covering containing
    $z$. Evaluation of the formal chart’s ring is integral, and its ideal of definition maps to topologically
    nilpotent elements of $cal(O)_K$. Let $z_0$ be the special point and put $y =
    Theta_x \( z_0 \)$ and $tilde(y) = Theta_x \( z \)$. The formal map $tilde(y)$ gives a point of the integral
    model over $cal(O)_K$ by restricting to an affine neighborhood of $y$.
    Pullback of the universal abelian scheme gives $C_(tilde(y))$ and its $p$-divisible group $cal(H)_z$.
  We record explicitly the integral comparison at this point.
    For a uniformizer $pi$ of $K$, put $frak(S) = W \( k \) \[ \[ u \] \]$, with $u mapsto pi$,
    and let $E_pi \( u \)$ generate its kernel. The crystalline representation and integral level of $z$ give the
    $cal(J)$-Breuil–Kisin torsor of [32] §3.5, with
  $ Phi : phi^(*) cal(P)_(upright("BK")) \[ 1 \/ E_pi \] arrow.r^(med tilde.op med)
    cal(P)_(upright("BK")) \[ 1 \/ E_pi \] . $
  Its pushout to $"GL" \( Lambda_p \)$ is the Breuil–Kisin module of $cal(H)_z$.
    Reduction at $u = 0$, followed by the dual Frobenius descent fixed above,
    therefore gives the actual Dieudonné lattice of $cal(H)_(z \, k)$.
    Proposition 3.5.1 of [32] compares the two specializations of this already constructed framed point.
    In the coordinates of [16] Theorem 2.2.5 it gives
  $ g in X_(cal(J)) \( mu^(- 1) \, b_x \) \, wide bb(D) \( cal(H)_(z \, k) \) =
    rho^or \( sigma \( g \) \) bb(D)_x subset D_x . $
  Indeed the Frobenius matrix on this lattice, written in its induced basis, is
  $ rho^or #h(-0.16667em) (sigma \( g^(- 1) b_x sigma \( g \) \)) compose sigma \, $
  which explains the same Frobenius descent in the Deligne–Lusztig condition and in the lattice formula.
  #emph[The abelian marking and the filtration.] Keep the identity prime-to-$p$ coordinate in the uniformization.
    The description of its special fiber in [32] §4.10.3, or equivalently the isogeny-class map of [16]
    Theorem 2.2.5, gives $y = i_x \( g \)$ and a single abelian quasi-isogeny $b : C_x arrow.r
    C_y$ preserving the crystalline tensors and every prime-to-$p$ tensor.
    Its crystalline marking is the one just used for $cal(H)_z$,
    because the uniformization is induced by the marked Siegel Rapoport–Zink space.
  The crystalline period map of that space is the Hodge filtration of its universal deformation pulled back by its
    marking. Compatibility of $Theta_x$ with the tautological shtuka and (3.8) consequently give
  $ b^(*) "Fil"^1 H_(upright("dR"))^1 \( C_(tilde(y)) \/ K \) = cal(F)^1 . $
  The deformation criterion [16] Proposition 2.2.3 is satisfied concretely:
    the filtration is of type $mu$, and the crystalline structure tensors compare with the integral étale tensors
    in the $cal(J) \( bb(Z)_p \)$-frames of $z$. The bounded integral shtuka and its annular framing were obtained
    before using this criterion or comparing specializations.
    All cited global Hodge-type and strongly admissible results apply at $p = 2$ as well.
  Finally, under finite local-field descent, the weak-admissibility inequalities restrict to the descended
    Frobenius subobjects. Colmez–Fontaine’s theorem [4] Theorem A makes those descended data admissible,
    and scalar extension supplies condition (1). ◻
]

=== 3.3 Proof of the transport proposition <proof-of-the-transport-proposition>

#proof[
  #emph[The original point and its reduction.] Apply Lemma 7.
    Choose a rational $J$-equivariant identification $W = \( V ⊗_(bb(Q)) P \)^(xor m)$ and set $n =
    m \[ P : bb(Q) \]$. Choose a basis of $P$ whose first vector is $1$.
    The resulting identification of the Hodge structure at the diagonal point $h$ with $V^(xor n)$ makes the
    first-factor map equal to
  #[#set math.equation(numbering: n => "(3.9)")
   $ v mapsto \( v ⊗ 1 \, 0 \, dots.h \, 0 \) . $ <eq:transport-first-factor>]
  The rational homology/isogeny correspondence [21] Corollary 6.9 therefore makes the abelian variety $C$ at that
    point isogenous to $A^n$. Fix a rational isogeny $f : A^n arrow.r C$ realizing this identification.
  We explain the field and reduction assertions for this starting point.
    The Hodge embedding maps it to the Siegel point of the polarized variety $C$ with finite level.
    The abelian variety $C$ is defined over $overline(bb(Q))$:
    clearing a denominator in $f$ realizes it as a quotient of $A^n$ by a finite subgroup of its torsion,
    and every such subgroup is defined over $overline(bb(Q))$.
    Its rational polarization and its finite level also descend to $overline(bb(Q))$,
    since homomorphisms between abelian varieties over $overline(bb(Q))$ do not enlarge after extending
    algebraically closed fields [18] Corollary 20.4. The Hodge embedding induces a finite morphism onto its image
    at sufficiently small finite level [21] Theorem 5.16. Its fiber over a $overline(bb(Q))$-point therefore
    consists of $overline(bb(Q))$-points. This places the diagonal point on the canonical model over $overline(bb(Q))$.
  After a finite number-field extension the variety $C$ has good reduction,
    since it is isogenous to $A^n$ [23] Chapter IV, Theorem 3.5.
    Its polarization and prime-to-$p$ level extend after a further finite extension.
    The integral Hodge-type model is the normalization of the closure of the generic fiber in the adapted Siegel
    model. The valuative criterion for this finite normalization therefore extends our point to its integral
    model. Denote the reduction by $x$. The rational isogeny $f$ specializes to a quasi-isogeny $f_0 :
    A_0^n arrow.r C_x$.
  #emph[The trace tensor and its descent.] Next extend the alternating form defining $gamma$ $P$-multilinearly and
    take its trace. Composing with projection onto the first copy in (3.4) gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ eta = "Tr"_(P \/ bb(Q)) \( gamma_P \) compose \( "pr"_1 \)^(⊗ 2 r) in and.big^(2 r) W^(*) .
     $ <eq:transport-trace-tensor>]
  For $r = 0$ this is interpreted as the scalar trace. The equal-multiplier condition implies that $eta$ has
    multiplier $c^r$ under $J$. On (3.9), its restriction is
  #[#set math.equation(numbering: n => "(3.11)")
   $ j^(*) f^(*) eta_C = \[ P : bb(Q) \] gamma . $ <eq:transport-trace-restriction>]
  The class $eta_C$ is understood with its Tate twist.
  We turn this semi-invariant into the untwisted tensors to which the integral-model theorems directly apply.
    Write $psi_W^(- 1) in and.big^2 W$ for the inverse symplectic bivector, and include
  #[#set math.equation(numbering: n => "(3.12)")
   $ u_psi = psi_W ⊗ psi_W^(- 1) \, wide u_eta = eta ⊗ \( psi_W^(- 1) \)^(⊗ r) $ <eq:transport-untwisted-tensors>]
  among the structure tensors. Both are $J$-invariant tensors in ordinary tensor constructions of $W$ and $W^(*)$;
    no separately trivialized Tate object is needed. They can be made integral and added to the defining family as
    explained above. Their crystalline and prime-to-$p$ realizations at $x$ are the specializations from the
    original point, with the comparison conventions fixed above.
  The entire finite family of structure tensors, including $u_psi$ and $u_eta$, has finite local-field descent.
    To see this, choose a finite extension $L \/ bb(Q)_p$ over whose valuation ring the original number-field
    point is defined, and let $L_0$ be its maximal unramified subfield.
    The canonical étale tensor sections of [16] §2.1.4, pulled back to that point,
    are $"Gal" \( overline(L) \/ L \)$-invariant. Applying the tensor functor $D_(upright("cris") \, L)$ to these
    morphisms from the unit object places them in the crystalline tensor spaces over $L_0$.
    Their extension to $K_0$ is exactly the family $s_(alpha \, 0 \, x)$, by good-reduction comparison.
    The map $f_0$ also descends after a finite residue-field extension,
    so this descent is retained under its marking. Taking a compositum with the finite field of definition of a
    prescribed filtration therefore gives one finite local field for all the data.
    No tensor-preserving trivialization over $L_0$ is being asserted or needed.
  #emph[The two choices of lift.] For specification (1), apply [16] Theorem 2.2.7 to $x$.
    It gives a point $y in cal(I)_x$ with a special-point lift and a tensor-preserving quasi-isogeny $b :
    C_x arrow.r C_y$. The special-point lift supplies a CM abelian variety $B$.
    Special points on the canonical Shimura variety are algebraic over its reflex field by the canonical-model
    theory [21] Definition 12.8 and Proposition 14.14, so $B$ and its level data can be taken over
    $overline(bb(Q))$. The given local lift specifies their embedding at $w$ and their good reduction $B_0 = C_y$.
  For specification (2), identify $D_x$ with $D_A^(xor n)$ using $f_0^(*)$ and prescribe the direct-sum filtration
    $cal(F)_A^(xor n)$. It is weakly admissible, with the required finite local-field descent.
    It is also in the required $J$-cocharacter orbit. Indeed a geometric element of the transported $G$ taking the
    original filtration on $D_A$ to $cal(F)_A$ acts diagonally on all the copies of $V$ in $W$;
    its image in $J$ takes the original filtration on $D_x$ to the prescribed one.
    The tensor-preserving identifications used here come from the initial point and comparison,
    so they include the $J$-structure tensors as well. Geometric conjugacy can be realized over a finite
    extension, since the corresponding isomorphism scheme is of finite type.
    Lemma 8 now gives $y$, its lift $B$, and a tensor-preserving quasi-isogeny $b : C_x arrow.r
    B_0$ with the prescribed marked filtration. This proves (3.3) for $a = b f_0$.
  #emph[A common rational normalization.] It remains, in both specifications,
    to recover the twisted class and normalize it by a single rational scalar.
    Choose a complex description of the lifted Shimura point.
    Its rational marking by $W$ supplies a rational Hodge class $eta_B$ corresponding to $eta$,
    and a rational divisor class $theta_B$ corresponding to $psi_W$.
    Write $theta_C$ for the analogous class on $C$ and put
  $ theta_(*) = f_0^(*) theta_(C \, 0) in "NS" \( A_0^n \) ⊗_(bb(Z)) bb(Q) . $
  The class $theta_(*)$ is rational ample. Tensor preservation of $u_psi$ says that, in each realization,
  #[#set math.equation(numbering: n => "(3.13)")
   $ a^(*) theta_(B \, 0) = lambda_v theta_(*) \, $ <eq:transport-local-similitudes>]
  with a nonzero local scalar $lambda_v$. Let $D = n dim A$. Pairing with $theta_(*)^(D - 1)$ gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ lambda_v =
     frac(deg #scale(x: 120%, y: 120%)[\(] a^(*) theta_(B \, 0) dot.op theta_(*)^(D - 1)
     #scale(x: 120%, y: 120%)[\)], deg \( theta_(*)^D \)) = : lambda in bb(Q)^times .
     $ <eq:transport-rational-similitude>]
  Both intersection numbers refer to rational divisor classes on the same abelian variety;
    their cycle-class traces are identical in every realization.
    The denominator is positive because $theta_(*)$ is ample, and the numerator is nonzero by (3.13).
    Thus all the scalars in (3.13), including the crystalline one, are the single rational number $lambda$.
  Preservation of $u_eta$, together with (3.14), then yields
  #[#set math.equation(numbering: n => "(3.15)")
   $ a^(*) eta_(B \, 0) = lambda^r f_0^(*) eta_(C \, 0) $ <eq:transport-eta-scaling>]
  simultaneously. In fact the inverse bivector scales by $lambda^(- 1)$,
    so that the equality for the untwisted tensor in (3.12) gives exactly (3.15). Set
  $ kappa = frac(lambda^(- r), \[ P : bb(Q) \]) eta_B . $
  Specializing (3.11) and using (3.15) proves (3.2).
  For the arbitrary local lift, the crystalline realization just used is unambiguous:
    the canonical model supplies the untwisted tensor $u_eta$,
    and the algebraic polarization supplies its Tate line and inverse bivector.
    The comparison isomorphism and these operations define $eta_B$ in the crystalline realization and agree with
    its canonical étale tensors. Consequently any identity expressing this class by algebraic divisor operations
    specializes with the same rational coefficients in all realizations.
    For the $overline(bb(Q))$-valued CM lift, these are also the usual absolute-Hodge and de Rham realizations.
    This completes the two constructions. ◻
]

#thm([Corollary 3.4.])[
  (CM transport of a Hodge class).  #emph[Let $A \/ overline(bb(Q))$ be an abelian variety of positive dimension
    with good reduction at $w$, and let $gamma in H^(2 r) \( A \( bb(C) \) \, bb(Q) \( r \) \)$ be a rational
    Hodge class, where $0 lt.eq r lt.eq dim A$. There are a positive integer $n$,
    a CM abelian variety $B \/ overline(bb(Q))$ with good reduction at $w$,
    a rational Hodge class $kappa$ of codimension $r$ on $B$, and a quasi-isogeny $a : A_0^n arrow.r B_0$ such that
$ gamma_0 = \( a j \)^(*) kappa_0 \, $

 where $j : A_0 arrow.r A_0^n$ is the first-factor inclusion.
   This is an equality of the usual absolute-Hodge specializations in every prime-to-$p$ realization and in
   crystalline cohomology extended to $C_w$.]
] <cor:cm-transport>

#proof[
  Choose a polarization $psi$ on $V = H_1 \( A \( bb(C) \) \, bb(Q) \)$, and let $G = "MT" \( V \)$.
    The Mumford–Tate group is connected reductive and is characterized by its Hodge tensors [6] Section 3,
    Propositions 3.4 and 3.6. The Hodge homomorphism and its $G \( bb(R) \)$-conjugacy class define the
    Mumford–Tate Shimura datum of Hodge type, with faithful symplectic representation
  $ G arrow.r.hook "GSp" \( V \, psi \) . $
  The polarization supplies the rational weight and the Cartan involution condition.
    The definition of the Mumford–Tate group excludes an adjoint factor on which the Hodge homomorphism is
    trivial. The class $gamma$, with its Tate twist, is fixed by $G$.
    Equivalently, its alternating form on $V$ has multiplier $c^r$, where $c$ is the similitude character.
    Thus the first alternative of Proposition 6 applies and gives the asserted data and simultaneous equality. ◻
]

== 4 An endomorphism-stable weakly admissible filtration <sec:filtration>

We construct a filtration on first crystalline cohomology that preserves an additional divisor.
  The construction takes place entirely on the given isocrystal.
  Its realization by an abelian lift will be a separate step.
  Generic transversality is a basic ingredient of the admissible-filtration existence theorems of
  Fontaine–Rapoport [7] Theorem 1 and Lemmas 1.1–1.2. We impose the additional endomorphism and polarization
  constraints explicitly. The bounded-degree argument below chooses the required coordinates over a finite
  algebraic extension, while testing every subisocrystal over the fixed coefficient field.

Throughout this section, $K_0 = "Frac" W \( overline(bb(F))_p \)$, and valuations are normalized by $v \( p \) =
  1$. If $D$ is an isocrystal over $K_0$ and $K \/ K_0$ is finite,
  a subspace $L subset D_K$ defines the one-step filtration

$ "Fil"^i D_K = cases(delim: "{", D_K \, & i lt.eq 0 \,, L \, & i = 1 \,, 0 \, & i gt.eq 2 .) $

For an isocrystal subobject $P subset D$, its Hodge number for this filtration is $t_H \( P \) =
  dim_K \( P_K ∩ L \)$. Its Newton number $t_N \( P \)$ is the sum of its slopes with multiplicities.
  Weak admissibility means that $t_H \( D \) = t_N \( D \)$ and $t_H \( P \) lt.eq
  t_N \( P \)$ for every isocrystal subobject $P$ over $K_0$.

Finite local-field descent is understood as in Section 3:
  the isocrystal and its indicated tensors descend to the maximal unramified subfield of a finite extension of
  $bb(Q)_p$, and the filtration descends to that finite extension.

#thm([Theorem 4.1.])[
  (The filtration construction).  #emph[Let $A_0 \/ overline(bb(F))_p$ be an abelian variety equipped with a
    rational action of a CM field $E$ and a polarization whose Rosati involution restricts to conjugation on $E$.
    Suppose that
$ D = H_(upright("cris"))^1 \( A_0 \/ W \( overline(bb(F))_p \) \) \[ 1 \/ p \] $

 has rank $2 s$ over $E ⊗_(bb(Q)) K_0$, where $s gt.eq 1$.
   Suppose also that there is an invertible $u in "End"^0 \( A_0 \)$ such that
$ u^dagger = u \, wide u e = macron(e) u quad \( e in E \) . $

 Let $beta$ be the dual polarization pairing on $D$, with values in the isocrystal line of slope $1$.]
  #emph[Then there are a finite extension $K \/ K_0$ and a subspace $L subset D_K$ with the following properties:]
  + #emph[The one-step filtration with $"Fil"^1 D_K = L$ is weakly admissible.]
  + #emph[$L$ is stable under the cohomological actions of $E$ and $u$, and is Lagrangian for $beta$.]
  + #emph[After extending to an algebraically closed field $Omega \/ K$, one has $dim_Omega L_tau =
    s$ for every embedding $tau : E arrow.r.hook Omega$.]
  + #emph[The isocrystal, its indicated tensors, and this filtration have finite local field descent.]
  #emph[Moreover, geometrically $L$ belongs to the balanced polarized cocharacter orbit. More explicitly, define
$ G_D = {g in "GSp" \( D \, beta \) ∩ "GL"_(E ⊗_(bb(Q)) K_0) \( D \) : det_(E ⊗_(bb(Q)) K_0) \( g \) = c \( g \)^s} \, $

 where the scalar on the right is viewed in $\( E ⊗_(bb(Q)) K_0 \)^times$.
   The balanced $E$-stable $beta$-Lagrangians form a single $G_D \( Omega \)$-orbit.
   Each is the weight-$1$ space of a cocharacter of $G_(D \, Omega)$ with weights $0 \, 1$.
   In particular $L$ belongs to the orbit of any original filtration of this type under a tensor-preserving comparison.]
] <thm:filtration>

The proof will construct $L$ from Lagrangians in finitely many symplectic spaces.
  The two lemmas below supply the required simultaneous choice:
  minimum intersection with a subspace is ensured by a nonzero minor of bounded degree,
  and all such minors over a fixed coefficient field can be made nonzero over one finite extension.

#thm([Lemma 4.2.])[
  (Bounded-degree avoidance over a finite extension).  #emph[Let $K_1 \/ K_0$ be a finite extension, and let $r \,
    b gt.eq 1$ be integers. There exist an element $theta$ algebraic over $bb(Q)_p$ and a point
$ \( x_0 \, dots.h \, x_(r - 1) \) in K_1 \( theta \)^r $

 at which every nonzero polynomial in $K_1 \[ X_0 \, dots.h \, X_(r - 1) \]$ of total degree at most $b$ is
   nonzero. The coordinates $x_i$ can all be chosen in $bb(Q)_p \( theta \)$.]
] <lem:avoidance>

#proof[
  Choose an integer $N > b$ and put
  $ B = b sum_(i = 0)^(r - 1) N^i . $
  Let $e$ be the ramification index of $K_1 \/ K_0$, so that $v \( K_1^times \) = 1 / e bb(Z)$.
    Choose a prime $q > max \( B \, e \)$, and choose $theta$ with $theta^q = p$ in an algebraic closure of $K_1$.
    The value $v \( theta \) = 1 \/ q$ has order $q$ modulo $1 / e bb(Z)$.
    Consequently the ramification index, and hence the degree, of $K_1 \( theta \) \/ K_1$ is at least $q$.
    The polynomial $X^q - p$ gives the reverse inequality, so
  $ \[ K_1 \( theta \) : K_1 \] = q > B . $
  Set $x_i = theta^(N^i)$. Under the substitution $X_i = T^(N^i)$,
    distinct monomials of total degree at most $b$ have distinct exponents:
    each exponent of an individual variable is smaller than $N$, and uniqueness follows from base-$N$ expansion.
    Thus a nonzero polynomial of total degree at most $b$ becomes a nonzero polynomial in $T$ of degree at most
    $B$. It cannot vanish at $theta$, whose degree over $K_1$ exceeds $B$. ◻
]

#prodef([Remark 4.3.])[
  The coefficient field in Lemma 11 is the fixed field $K_1$.
    The conclusion concerns all bounded-degree polynomials over that field,
    with no restriction on their cardinality. It would be false with $K_1 \( theta \)$ in place of $K_1$ as the
    coefficient field.
]

#thm([Lemma 4.4.])[
  (Intersections with Lagrangians).  #emph[Let $M$ be a symplectic space of dimension $2
    m$ over a field $k$ of characteristic zero, and let $W subset M$ have dimension $a$.
    A nonempty open subset of the Lagrangian Grassmannian consists of subspaces $L$ such that
$ dim \( L ∩ W \) = max \( 0 \, a - m \) . $

 On any fixed symplectic affine big cell, at least one nonzero polynomial of degree at most $m$ has nonvanishing
   locus contained in this open subset. This degree bound is independent of $W$.]
] <lem:lagrangian-intersection>

#proof[
  We first work over an algebraic closure. The Lagrangian Grassmannian is geometrically integral of dimension
    $m \( m + 1 \) \/ 2$; its affine big cells are parametrized by symmetric $m times m$ matrices.
    If $1 lt.eq a lt.eq m$, consider the projective incidence variety of pairs $\( ell \, L \)$ with $ell subset
    W$ a line and $ell subset L$ a Lagrangian. The fiber over $ell$ is the Lagrangian Grassmannian of the
    symplectic space $ell^perp \/ ell$, and therefore the incidence variety has dimension
  $ a - 1 + frac(m \( m - 1 \), 2) < frac(m \( m + 1 \), 2) . $
  Its image is a proper closed subset. Its complement consists precisely of the Lagrangians missing $W$.
    The case $a = 0$ is immediate. For $a > m$, use
  $ dim \( L ∩ W \) = a - m + dim \( L ∩ W^perp \) $
  and apply the preceding argument to $W^perp$.
  For the assertion on equations, choose coordinates on the fixed big cell in which $L$ is the column space of
  $ vec(I_m, T) \, wide T = T^(sans(t)) . $
  The minimum-intersection condition says that the composite of this matrix with the quotient map $M arrow.r
    M \/ W$ has rank $min \( m \, 2 m - a \)$. Its entries are affine linear polynomials in the independent
    entries of $T$. The nonempty open subset already proved meets this big cell,
    so some minor of the required size is a nonzero polynomial over $k$.
    Its degree is at most $m$, and its nonvanishing implies the required rank.
    If the required rank is zero, use the constant polynomial $1$. ◻
]

The two lemmas reduce simultaneous transversality to a uniform bound on the degrees of the relevant minors.
  We now identify the symplectic spaces on which to apply them and the inequalities they must enforce.

#proof[
  We write $e$ and $u$ also for their cohomological actions on $D$. These actions commute with Frobenius and satisfy
  #[#set math.equation(numbering: n => "(4.1)")
   $ beta \( u x \, y \) = beta \( x \, u y \) \, wide beta \( e x \, y \) = beta \( x \, macron(e) y \) \, wide
     u e = macron(e) u . $ <eq:filtration-adjoints>]
  There is no change to the last relation from contravariance.
    Indeed, pulling back $u e = macron(e) u$ gives $e^(*) u^(*) = u^(*) macron(e)^(*)$;
    replacing $e$ by $macron(e)$ gives $u^(*) e^(*) = macron(e)^(*) u^(*)$.
    Likewise, if $J$ is the homological polarization matrix, $U^(sans(t)) J = J U$ implies $U J^(- 1) =
    J^(- 1) U^(sans(t))$, which is the self-adjointness of the cohomological action $U^(sans(t))$ for the dual
    pairing. The Rosati-conjugate adjoint identity for $E$ follows in the same way.
  The pullback $U^(sans(t))$ of an individual endomorphism is distinct from the contragredient group action $g
    mapsto g^(- sans(t))$. If a homological similitude $g$ has multiplier $c_V$ and satisfies $det_E \( g \) =
    c_V^s$, its dual action has multiplier $c_D = c_V^(- 1)$ and satisfies $det_E \( g^(- sans(t)) \) = c_D^s$.
    Thus $G_D$ is the dual form of the homological group defined by this determinant condition,
    with its cohomological multiplier.
  #emph[Reduction to the stable subobjects.] First consider any $E \, u$-stable candidate $L subset D_K$,
    where $K \/ K_0$ is finite. We show that the weak-admissibility inequalities need only be tested on $E \,
    u$-stable subobjects. This resembles the use of canonical destabilizing objects in [7] Section 2,
    but we use total defect, not defect divided by dimension, and give the required elementary argument.
    For any isocrystal subobject $P subset D$ over $K_0$, set
  $ f \( P \) = t_H \( P \) - t_N \( P \) . $
  These values form a finite set: the Hodge number is a bounded integer,
    and the Newton number is determined by bounded integer multiplicities among the finitely many slopes of $D$.
    Let $a$ be their maximum. Newton numbers are additive in short exact sequences, while
  $ \( P_K ∩ L \) + \( Q_K ∩ L \) subset \( P + Q \)_K ∩ L . $
  Consequently
  #[#set math.equation(numbering: n => "(4.2)")
   $ f \( P \) + f \( Q \) lt.eq f \( P ∩ Q \) + f \( P + Q \) . $ <eq:filtration-supermodularity>]
  If $P$ and $Q$ both attain $a$, the right-hand terms are each at most $a$, so both attain $a$.
    Thus maximizers are closed under intersection and sum. Choose a maximizer $P_max$ of largest dimension.
    Adding any other maximizer to it shows that the other one is contained in it.
    Hence $P_max$ is the unique largest maximizer.
  The operators $u$ and $e in E^times$ are filtration-preserving isocrystal automorphisms.
    They preserve $f$ and hence fix $P_max$, by its uniqueness. Thus $P_max$ is $E \, u$-stable.
    Consequently, if $t_H \( D' \) lt.eq t_N \( D' \)$ for every $E \, u$-stable subobject $D'$, then $a =
    f \( P_max \) lt.eq 0$. All the weak-admissibility inequalities follow.
    We must therefore construct an $E \, u$-stable Lagrangian with these restricted inequalities and
    $t_H \( D \) = t_N \( D \)$.
  #emph[Semisimplicity and symplectic blocks.] The Rosati trace form
  $ chevron.l a \, b chevron.r = "Tr" \( a b^dagger \) quad upright("on ") "End"^0 \( A_0 \) ⊗_(bb(Q)) bb(R) $
  is positive definite [18] Theorem 17.3. Left multiplication by $u$ is self-adjoint for this form,
    since trace cyclicity gives
  $ chevron.l u a \, b chevron.r = "Tr" \( u a b^dagger \) = "Tr" \( a b^dagger u \) = chevron.l a \, u b chevron.r . $
  It is therefore diagonalizable. Its minimal polynomial equals the minimal polynomial of $u$ in the endomorphism
    algebra, as is seen by applying a polynomial in the multiplication operator to the identity.
    Thus $u$, and hence $u^2$, acts semisimply on $D$. The relation in (4.1) also shows that $u^2$ commutes with $E$.
  Put
  $ B \( x \, y \) = beta \( x \, u y \) . $
  This is a nondegenerate alternating pairing. Indeed, invertibility is immediate, and $B \( y \, x \) = -
    beta \( u x \, y \) = - B \( x \, y \)$. In addition,
  $ B \( e x \, y \) = beta \( x \, macron(e) u y \) = beta \( x \, u e y \) = B \( x \, e y \) \, wide
    B \( u^2 x \, y \) = B \( x \, u^2 y \) . $
  After a finite splitting extension $K_1 \/ K_0$, write
  $ D_(K_1) = xor.big_(tau \, z) M_(tau \, z) \, wide M_(tau \, z) = { x : e x = tau \( e \) x med \( e in E \) \,
    med u^2 x = z x } . $
  We omit zero summands. The self-adjoint identities for $B$ show that distinct summands are orthogonal.
    Its restriction to each summand is therefore nondegenerate. Write $dim M_(tau \, z) = 2 m_(tau \, z)$.
  For $macron(tau) = tau compose overline(\( dot.op \))$, the operator $u$ maps $M_(tau \, z)$ isomorphically to
    $M_(macron(tau) \, z)$. On these spaces,
  #[#set math.equation(numbering: n => "(4.3)")
   $ B \( u x \, u y \) = z B \( x \, y \) . $ <eq:filtration-u-similitude>]
  Here $z eq.not 0$, and $tau eq.not macron(tau)$. Choose a $B$-Lagrangian $L_(tau \, z)$ in one member of each
    opposite pair, and prescribe
  #[#set math.equation(numbering: n => "(4.4)")
   $ L_(macron(tau) \, z) = u L_(tau \, z) . $ <eq:filtration-opposite-choice>]
  Equation (4.3) shows that the latter is Lagrangian as well.
    Their direct sum $L$ is $E$-stable and $u$-stable; on applying $u$ twice, one obtains $z L_(tau \, z) =
    L_(tau \, z)$. Since
  $ beta \( x \, y \) = B \( x \, u^(- 1) y \) \, $
  $L$ is also $beta$-Lagrangian. Its dimension at each $E$-embedding is $s$.
    It remains to make the independent choices appropriately.
  #emph[The inherited Newton grading.] Use the canonical slope decomposition
  $ D = xor.big_lambda D_lambda . $
  The isocrystal category over $overline(bb(F))_p$ is semisimple, and this decomposition is functorial [4] §3.2,
    Proposition 3.3. The slopes of $D$ belong to $\[ 0 \, 1 \]$:
    its integral Dieudonné operators $F \, V$ satisfy $F V = p$,
    so both the slopes of $F$ and those of $V$ are nonnegative.
    All the endomorphisms above preserve every $D_lambda$, and the projectors onto the simultaneous eigenspaces
    preserve its scalar extension. Thus each block has a grading
  $ M_(tau \, z) = xor.big_lambda M_(tau \, z \, lambda) \, wide M_(tau \, z \, lambda) =
    M_(tau \, z) ∩ \( D_lambda \)_(K_1) . $
  We use this grading even if Frobenius permutes the labels $\( tau \, z \)$.
    No extension of Frobenius to $K_1$, and no isocrystal structure on an individual block, is required.
  Before scalar extension, $B$ is a pairing of isocrystals into the slope-$1$ line.
    Hence $B \( D_lambda \, D_mu \) = 0$ unless $lambda + mu = 1$.
    Nondegeneracy on an individual block $M$ then gives perfect pairings between $M_lambda$ and $M_(1 - lambda)$.
    In particular, if $dim M = 2 m$,
  #[#set math.equation(numbering: n => "(4.5)")
   $ sum_lambda lambda dim M_lambda = m . $ <eq:filtration-block-newton>]
  Let $D' subset D$ be an isocrystal subobject over $K_0$ stable under $E$ and $u$.
    Its intersections $M' = D'_(K_1) ∩ M$ decompose $D'_(K_1)$ and inherit the same slope grading.
    Put $a = dim M'$. The slope sum of the graded quotient $M \/ M'$ is at most $2 m - a$,
    because all its slopes belong to $\[ 0 \, 1 \]$. By (4.5),
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_lambda lambda dim M'_lambda gt.eq max \( 0 \, a - m \) . $ <eq:filtration-block-bound>]
  The additional bound by zero follows from the nonnegative slopes.
    The right side is also the smallest possible dimension of the intersection of a Lagrangian in $M$ with $M'$.
    Thus attaining this minimum in every block will give the weak-admissibility inequalities for all the stable
    subobjects.
  #emph[Simultaneous choices and finite local field descent.] We may arrange the splitting field and coordinates
    used above as follows. Choose a finite field $k_0 subset overline(bb(F))_p$ over which $A_0$,
    its polarization, $u$, and a rational basis of $E$ are defined.
    The underlying isocrystal and the indicated tensors then descend to $"Frac" W \( k_0 \)$.
    Choose a finite local field $H \/ bb(Q)_p$ containing this field and splitting the actions of $E$ and $u^2$.
    The eigenspaces and their symplectic bases can be constructed over $H$ by linear algebra.
    We take $K_1 = K_0 H$. In particular, the independent Lagrangian Grassmannians,
    fixed symplectic big cells in them, and the maps induced by $u$ all have coordinates over $H$.
  Take the product of these big cells, one for each independent choice in (4.4),
    and let $r$ be its number of affine coordinates. For every $E \,
    u$-stable isocrystal subobject $D'$ over $K_0$ and each independent block $M$, the space $M' =
    D'_(K_1) ∩ M$ is defined over the #emph[fixed] field $K_1$.
    Lemma 13 supplies a nonzero polynomial over $K_1$, of degree at most $m$, whose nonvanishing ensures
  #[#set math.equation(numbering: n => "(4.7)")
   $ dim \( L_(tau \, z) ∩ M' \) = max \( 0 \, dim M' - m \) . $ <eq:filtration-minimal-intersection>]
  We regard this as a polynomial on the whole product by ignoring the other coordinates.
    A single bound $b = max m_(tau \, z)$ works for all these polynomials, independently of $D'$.
    On the opposite block, the same intersection equality follows from $u$-stability of $D'$ and (4.4).
  Apply Lemma 11 to $K_1 \, r \, b$. Its one point satisfies (4.7) for every one of the subobjects just specified,
    simultaneously. This use of the lemma does not assume that the collection of subobjects is countable or that
    its members descend to $H$. Their definition over $K_1$ and the uniform polynomial degree bound are the only
    requirements. There are nonzero blocks with $m gt.eq 1$, so $r \, b gt.eq 1$ as required.
  Put $K = K_1 \( theta \) = K_0 H \( theta \)$. The resulting Lagrangian is defined over $H \( theta \)$ in the
    chosen coordinates, and $H \( theta \)$ is finite over $bb(Q)_p$.
    Extending the original isocrystal to the maximal unramified subfield of $H \( theta \)$ therefore gives finite
    local field descent of the complete filtered data. In particular,
    the construction has not obtained its generic point by introducing transcendental parameters.
  Summing (4.7) and (4.6) over all blocks gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ t_H \( D' \) lt.eq t_N \( D' \) quad upright("for every ") E \,
     u upright("-stable isocrystal subobject ") D' subset D upright(".") $ <eq:filtration-stable-test>]
  For $D$ itself, both numbers equal $1 / 2 dim D$ by (4.5).
    The reduction to stable subobjects proved at the start now gives all the weak-admissibility inequalities for
    subobjects of $D$ over $K_0$. Each subobject over the smaller unramified field of descent extends to one of
    these subobjects. Hence the descended filtered isocrystal is weakly admissible as well.
  #emph[The geometric cocharacter orbit.] Over $Omega$, the polarization pairs $D_tau$ only with
    $D_(macron(tau))$. A balanced $E$-stable Lagrangian is determined by an $s$-dimensional subspace of $D_tau$
    for one member of each pair; the subspace in the opposite member is its annihilator.
    The subgroup of $G_D$ with multiplier $1$ contains the product of $"SL" \( D_tau \)$ acting on opposite spaces
    by the inverse dual representations. These special linear groups are transitive on the $s$-dimensional
    subspaces. Thus all the indicated Lagrangians form one $G_D \( Omega \)$-orbit.
  Finally choose an $E$-stable $beta$-Lagrangian complement to one such $L$.
    Such a complement is obtained separately on each pair of opposite embedding spaces.
    Acting by $t$ on $L$ and by $1$ on the complement gives a cocharacter with multiplier $t$ and $E$-determinant
    $t^s$ at each embedding. It lies in $G_D$ and has the stated filtration. This proves the final assertions. ◻
]

#thm([Corollary 4.5.])[
  #emph[The filtration of Theorem 10, with its finite local field descent, is admissible:
    the descended filtered isocrystal is the filtered crystalline module of a crystalline representation.]
] <cor:filtration-admissible>

#proof[
  Apply the weakly-admissible-implies-admissible theorem of Colmez–Fontaine with monodromy operator zero [4]
    Theorem A. ◻
]

#thm([Corollary 4.6.])[
  (The divisor filtration condition).  #emph[Let $D \, L$ be as in Theorem 10,
    and let $psi$ and $U$ denote the homological polarization and the homological action of $u$ on $D_K^or$.
    The untwisted divisor form $psi \( dot.op \, U dot.op \)$ belongs to
$ "Fil"^1 #scale(x: 120%, y: 120%)[\(] and.big^2 D_K #scale(x: 120%, y: 120%)[\)] = L and D_K \, $

 and hence to filtration degree zero after its codimension-one Tate twist.
   If a marked power is realized by an abelian lift, the corresponding pulled-back divisor satisfies the
   filtration condition for its symmetric homomorphism in Lemma 5.]
] <cor:filtration-divisor>

#proof[
  Let $H subset D_K^or$ be the annihilator of $L$. It is Lagrangian for $psi$ and stable under $U$:
    for $a in L$ and $h in H$,
  $ a \( U h \) = \( u^(*) a \) \( h \) = 0 . $
  Therefore $psi \( h \, U h' \) = 0$ for $h \, h' in H$. The divisor form thus lies in
  $ ker #scale(x: 120%, y: 120%)[\(] and.big^2 D_K arrow.r and.big^2 H^or #scale(x: 120%, y: 120%)[\)] = L and D_K . $
  This proves the assertion on the fixed filtered vector space.
    After realization of a marked power, pullback respects this filtration condition,
    which is precisely the condition on the associated symmetric homomorphism in Lemma 5. ◻
]

== 5 Balanced Weil classes <sec:weil>

Let $A \/ overline(bb(Q))$ have good reduction at the fixed place $w$,
  and let a CM field $E$ act on $A$ up to isogeny. We write $e mapsto macron(e)$ for its complex conjugation.
  Suppose that a polarization $lambda$ induces this involution on $E$. Put

$ V = H_1 \( A \( bb(C) \) \, bb(Q) \) \, wide dim_E V = 2 s \, wide g = dim A = s \[ E : bb(Q) \] \, $

where $s gt.eq 1$. We assume that the Hodge multiplicities at every embedding of $E$ are $\( s \, s \)$.
  The polarization is an alternating form $psi : V times V arrow.r bb(Q) \( 1 \)$ satisfying

$ psi \( e x \, y \) = psi \( x \, macron(e) y \) . $

#prodef([Definition 5.1.])[
  The rational space of #emph[Weil classes] associated with $E$ is the subspace
  $ W_E^s \( A \) subset and.big_(bb(Q))^(2 s) V^or ⊗ bb(Q) \( s \) = H^(2 s) \( A \( bb(C) \) \, bb(Q) \( s \) \) $
  whose scalar extension to a splitting field $Omega$ of $E$ is
  #[#set math.equation(numbering: n => "(5.1)")
   $ W_E^s \( A \) ⊗_(bb(Q)) Omega = xor.big_(tau : E arrow.r.hook Omega) and.big_Omega^(2 s) V_tau^or ⊗
     bb(Q) \( s \)_Omega . $ <eq:weil-pure-space>]
  Here each summand is extended by zero on the other eigenspaces.
    The right side is Galois stable, so it defines the indicated rational subspace.
] <def:weil-space>

The balanced multiplicities imply that every element of $W_E^s \( A \)$ is a Hodge class:
  each determinant in (5.1) has untwisted type $\( s \, s \)$.
  We use its compatible realizations as an absolute Hodge class; see [6].
  The same eigenspace description of its support holds after specialization,
  since the $E$-action specializes compatibly.

Our goal is the Lefschetz pairing property for these specialized classes.
  In fact, the reduction satisfies a dichotomy determined by its rational endomorphisms.
  Let $dagger$ be Rosati for the reduced polarization and put

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(U) = { u in "End"^0 \( A_0 \) : u^dagger = u \, quad u e = macron(e) u med
   upright("for every ") e in E } . $ <eq:weil-U>]

#thm([Proposition 5.2.])[
  #emph[Every $gamma in W_E^s \( A \)$ satisfies the Lefschetz pairing property at $w$.
    More precisely, if $cal(U)$ in (5.2) has no invertible element, all complementary pairings are zero.
    If it has an invertible element, $gamma_0$ is a simultaneous rational Lefschetz class.]
] <prop:weil>

We first prove the vanishing alternative. For the other alternative,
  an invertible $u$ supplies a divisor whose form is nondegenerate on each $E$-eigenspace separately.
  We will lift this divisor and use it to obtain a rational identity for the determinant classes.

=== 5.1 The orthogonality alternative <the-orthogonality-alternative>

#thm([Lemma 5.3.])[
  #emph[If $cal(U)$ contains no invertible element, every specialization of a class in $W_E^s \( A \)$ is
    orthogonal to all complementary Lefschetz classes, in each cohomological realization.]
] <lem:weil-orthogonality>

#proof[
  We prove the contrapositive. A nonzero pairing will produce a divisor form nondegenerate on one $E$-eigenspace.
    We will then show that a rational endomorphism in $cal(U)$ with this property is invertible.
  Fix one realization and extend its coefficient field to an algebraically closed field $Omega$.
    At the crystalline component we also include the coefficient extension used for the specialized class.
    In this proof, $V_tau$ also denotes the corresponding eigenspace in the dual of first cohomology of $A_0$,
    identified by specialization and comparison. Write $L_Omega^j \( A_0 \)$ for the $Omega$-span of products of
    $j$ divisor classes. Since $\[ E : bb(Q) \] gt.eq 2$, we have $g - 2 s gt.eq 0$.
    Hard Lefschetz on the Lefschetz algebra gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ L_Omega^(g - s) \( A_0 \) = psi_0^(g - 2 s) L_Omega^s \( A_0 \) . $ <eq:weil-hard-lefschetz>]
  The restriction of hard Lefschetz to this algebra, including for crystalline cohomology,
    follows from the Lefschetz correspondences of [19] Theorem 5.9.
  Suppose a Weil class pairs nontrivially with $D_1 dots.h.c D_s psi_0^(g - 2 s)$, and choose a pure term,
    supported on $V_tau$, whose contribution is nonzero. This term already has degree $2 s$ on $V_tau$,
    so no further factor in a nonzero top-degree product can use that space.
    A factor from $psi_0$ which uses $V_(macron(tau))$ also uses $V_tau$;
    hence the polarization factors contribute to neither space in this pair.
    All $2 s$ degrees on $V_(macron(tau))$ must therefore come from the $s$ divisor factors.
    Each has degree two, so each must contribute its restriction to $V_(macron(tau))$,
    and those restrictions have nonzero product. The coefficient of $t_1 dots.h.c t_s$ in
  $ \( t_1 D_1 + dots.h.c + t_s D_s \)^s \|_(V_(macron(tau))) $
  is $s !$ times that product. Some $Omega$-linear combination of the divisors therefore restricts to a
    nondegenerate alternating form on $V_(macron(tau))$.
  We identify which endomorphisms can give these restrictions.
    Let $p_xi in E ⊗_(bb(Q)) Omega$ be the eigenspace projectors. Rosati satisfies $p_xi^dagger = p_(macron(xi))$.
    A divisor corresponds under $psi_0$ to a Rosati-symmetric endomorphism $t$. Define
  #[#set math.equation(numbering: n => "(5.4)")
   $ Pi \( t \) = sum_xi p_(macron(xi)) t p_xi . $ <eq:weil-block-projection>]
  This operation takes place inside $"End"^0 \( A_0 \) ⊗_(bb(Q)) Omega$. Moreover,
  $ \( p_(macron(xi)) t p_xi \)^dagger = p_(macron(xi)) t^dagger p_xi \, wide Pi \( t \) e = macron(e) Pi \( t \) . $
  Thus $Pi \( t \) in cal(U) ⊗_(bb(Q)) Omega$. Conversely, these are exactly the blocks allowed by the second
    equation in (5.2). For $x \, y in V_xi$, the form $psi_0 \( x \, t y \)$ depends only on $p_(macron(xi)) t
    p_xi$. It follows that projecting by (5.4) preserves all the same-embedding restrictions in question.
  Nondegeneracy on $V_(macron(tau))$ is a polynomial open condition on $cal(U) ⊗_(bb(Q)) Omega$,
    and we have shown this open is nonempty. The rational points of the rational vector space $cal(U)$ are Zariski
    dense after extension to $Omega$. Hence there is a rational $u in
    cal(U)$ for which $psi_0 \( dot.op \, u dot.op \)$ is nondegenerate on $V_(macron(tau))$.
  To prove invertibility, we use the fact that a nonzero $E$-stable abelian subvariety has a nonzero homology
    space at every embedding of $E$. Suppose that $u$ is not invertible,
    and choose an integer $N > 0$ such that $N u$ is an endomorphism.
    The reduced identity component $C = \( \( ker \( N u \) \)^0 \)_(upright("red"))$ is a positive-dimensional
    abelian subvariety. The relation $u e = macron(e) u$ makes $C$ stable under the rational action of $E$.
    This action is unital and therefore faithful. Choose a primitive element $e$ of $E$ and an integer $M >
    0$ such that $M e$ acts by an integral endomorphism of $C$.
    The exterior algebra description of cohomology and normalized top-degree pullback give,
    in every realization [19] Appendix, Proposition (A.2)(a),(b),
  $ det #scale(x: 120%, y: 120%)[\(] n - e divides H^1 \( C \) #scale(x: 120%, y: 120%)[\)] =
    M^(- 2 dim C) deg #scale(x: 120%, y: 120%)[\(] \[ M n \] - M e #scale(x: 120%, y: 120%)[\)] $
  for every integer $n$ for which the map on the right is an isogeny.
    All but finitely many integers have this property. The right side is rational and independent of the
    realization. Polynomial interpolation therefore gives one characteristic polynomial in $bb(Q) \[ T \]$,
    identical also in crystalline cohomology. Its roots lie among the conjugates of $e$,
    and rationality forces their multiplicities to be equal. Since $C eq.not 0$,
    every embedding of $E$ occurs with positive multiplicity.
    The same statement holds on first homology, in the chosen realization.
    Rational Poincaré reducibility [18] Proposition 12.1 makes the inclusion $C arrow.r.hook
    A_0$ injective on first homology in every realization. This inclusion is $E$-equivariant,
    and its image is killed by $u$. Thus the nonzero $macron(tau)$-eigenspace of $H_1 \( C \)$ shows that the
    kernel of $u$ meets $V_(macron(tau))$ nontrivially. Such a vector lies in the radical of
    $psi_0 \( dot.op \, u dot.op \) \|_(V_(macron(tau)))$, a contradiction.
  A nonzero pairing would therefore give an invertible element of $cal(U)$.
    Taking the contrapositive proves the lemma. The argument applies separately to every realization,
    so all the pairings in this case have the common rational value zero. ◻
]

=== 5.2 A divisor identity on a rational summand <a-divisor-identity-on-a-rational-summand>

For the rest of the section, suppose that $u in cal(U)$ is invertible.
  It gives a rational divisor $D^u$ on $A_0$ with alternating form

#[#set math.equation(numbering: n => "(5.5)")
 $ D^u \( x \, y \) = psi_0 \( x \, u y \) . $ <eq:weil-extra-divisor>]

This form is nondegenerate and pairs each embedding of $E$ only with itself:
  $u$ exchanges opposite eigenspaces, whereas $psi_0$ pairs opposite eigenspaces.

Prescribed-filtration transport will replace $A_0$ by a power and then by an isogenous special fiber $B_0$.
  We will retain the first factor through a rational projector on $B_0$, and lift that projector,
  the $E$-action on its image, and the transported divisor to $B$.
  The next lemma explains the resulting divisor identity: a divisor nondegenerate separately on those eigenspaces
  generates their determinant classes. A rational projector here means an idempotent in the rational endomorphism
  algebra.

#thm([Lemma 5.4.])[
  #emph[Let $B$ be a complex abelian variety, let $R in "End"^0 \( B \)$ be a rational projector,
    and suppose that there is an algebra action $E arrow.r R "End"^0 \( B \) R$ whose unit maps to $R$.
    Let $T = "im" \( R \)$ in rational first homology, with $dim_E T = 2 s$;
    the indicated endomorphisms act by zero on $ker \( R \)$.
    Suppose there is a rational divisor class $D$ on $B$ such that $R^(*) D = D$ and, after splitting $E$,
    its alternating form is
$ D = sum_tau D_tau \, wide D_tau in and.big^2 T_tau^or ⊗ bb(Q) \( 1 \) \, $

 with each $D_tau$ nondegenerate. Then the rational subspace whose scalar extension is
$ xor.big_tau and.big^(2 s) T_tau^or ⊗ bb(Q) \( s \) \, $

 extended by zero on the complementary summand, consists of rational Lefschetz classes on $B$.]
] <lem:weil-divisor-span>

#proof[
  For $b in E$, let $tilde(b) in "End"^0 \( B \)$ act by $b$ on $T$ and by zero on the complement.
    Its pullback of a rational divisor is a rational divisor:
    clear a denominator in $tilde(b)$, and use that multiplication by $N$ acts as $N^2$ on $H^2$.
    Over a splitting field $Omega$, choosing Tate-line bases, we have
  $ \( tilde(b)^(*) D \)^s = (sum_tau tau \( b \)^2 D_tau)^s . $
  The coordinates $x_tau = tau \( b \)$ are independent coordinates on the scalar extension of the rational vector
    group underlying $E$. In the corresponding vector-valued polynomial
  #[#set math.equation(numbering: n => "(5.6)")
   $ P \( \( x_tau \)_tau \) = (sum_tau x_tau^2 D_tau)^s \, $ <eq:weil-coefficient-polynomial>]
  the coefficient of $x_tau^(2 s)$ is $D_tau^s$. Nondegeneracy makes this coefficient nonzero,
    so it spans $and.big^(2 s) T_tau^or ⊗ bb(Q) \( s \)_Omega$.
  Let $M$ be the rational span of the Lefschetz classes $\( tilde(b)^(*) D \)^s$ for $b in E$.
    The set $E$ of rational points is Zariski dense in its vector group, also after extension to $Omega$.
    Any linear functional annihilating $M ⊗_(bb(Q)) Omega$ annihilates all evaluations of (5.6) on those points.
    It therefore annihilates the polynomial, and hence each coefficient. Every $D_tau^s$ belongs to $M ⊗_(bb(Q)) Omega$.
  This proves the required inclusion after scalar extension.
    Both subspaces are rational; applying faithful scalar extension to their quotient proves the inclusion over
    $bb(Q)$. In particular it gives rational coefficients for every rational class in the asserted subspace,
    without requiring an individual embedding line to be defined over $bb(Q)$. ◻
]

=== 5.3 A lift preserving the divisor <a-lift-preserving-the-divisor>

We now construct the auxiliary variety to which Lemma 19 applies.
  To transport the Weil class, we use the $E$-linear polarization similitudes whose determinant has the same
  transformation law as a codimension-$s$ Tate twist. Choose a rational basis for the Betti Tate line,
  let $c$ be the multiplier of $"GSp" \( V \, psi \)$, and set

#[#set math.equation(numbering: n => "(5.7)")
 $ G = { a in "GSp" \( V \, psi \) ∩ "GL"_E \( V \) : det_E \( a \) = c \( a \)^s } . $ <eq:weil-group>]

On points over a $bb(Q)$-algebra $R$, the determinant equality is in $\( E ⊗_(bb(Q)) R \)^times$,
  with the right side embedded diagonally.

#thm([Lemma 5.5.])[
  #emph[The Hodge homomorphism of $A$ factors through $G$, and its conjugacy class defines a Shimura datum of
    Hodge type through the displayed embedding. Over an algebraically closed coefficient field,
    the orbit of the corresponding filtration on $H^1$ consists exactly of the $E$-stable Lagrangians for the dual
    polarization pairing whose dimension at each embedding of $E$ is $s$.
    Using a basis of its Tate line, every alternating form in (5.1) transforms by $c^s$.]
] <lem:weil-group>

#proof[
  The polarization pairs $V_tau$ with $V_(macron(tau))$, and no other pair of eigenspaces.
    Over an algebraically closed field, choose one embedding in each conjugate pair.
    An element of $G$ is specified by $c$ and matrices $a_tau in "GL"_(2 s)$ with $det \( a_tau \) = c^s$;
    the matrices on the opposite spaces are then determined by the polarization. In particular,
  $ ker \( c : G arrow.r bb(G)_m \) tilde.eq product_({ tau \, macron(tau) }) "SL"_(2 s) . $
  The multiplier is surjective geometrically. Thus $G$ is connected reductive,
    with the same adjoint group as the group of $E$-linear polarization similitudes.
  The two Hodge characters occur $s$ times at every embedding.
    Their product is the polarization multiplier, so the Hodge homomorphism satisfies the determinant condition in
    (5.7). Its weight is rational and central. On the adjoint Lie algebra the Hodge types are among
    $\( - 1 \, 1 \) \, \( 0 \, 0 \) \, \( 1 \, - 1 \)$, as follows from the weight-one representation.
    Conjugation by the image of $i$ is a Cartan involution, by the polarization.
    At every real embedding of the maximal totally real subfield of $E$,
    the adjoint group has unitary signature $\( s \, s \)$. Its Hodge homomorphism is nontrivial there,
    so no rational simple adjoint factor has trivial Hodge homomorphism.
    These are the Shimura-datum conditions for the given Hodge embedding.
  On $H^1$ the polarization still pairs opposite eigenspaces.
    An $E$-stable Lagrangian is specified by an $s$-dimensional subspace at one embedding of each pair;
    the subspace at the opposite embedding is its annihilator.
    The factor $"SL"_(2 s)$ acts transitively on these subspaces,
    as in the cohomological orbit calculation of Theorem 10. Finally,
    an alternating determinant form evaluated on $a_tau v_1 \, dots.h \,
    a_tau v_(2 s)$ is multiplied by $det \( a_tau \) = c^s$. This proves the asserted transformation law. ◻
]

#proof[
  The vanishing alternative is Lemma 18. Suppose that $u$ is invertible, and use the divisor $D^u$ from (5.5).
  #emph[A filtration preserving the divisor.]
  Let $cal(D) = H_(upright("cris"))^1 \( A_0 \/ W \( bb(F) \) \) \[ 1 \/ p \]$, with its contravariant convention,
    and let $beta$ be the dual polarization pairing, taking values in the isocrystal line of slope one.
    The actions on $cal(D)$ satisfy
  $ beta \( u x \, y \) = beta \( x \, u y \) \, wide beta \( e x \, y \) = beta \( x \, macron(e) y \) \, wide
    u e = macron(e) u . $
  All these endomorphisms and the polarization have finite field descent.
    Theorem 10 supplies, over a finite extension with finite local field descent,
    a weakly admissible filtration $"Fil"^1 cal(D) = L$ which is $E$- and $u$-stable, is Lagrangian for $beta$,
    and has dimension $s$ at every embedding of $E$. By Lemma 20 it lies geometrically in the required $G$-orbit.
    The (3.12) in Proposition 6 shows that its full finite family of Hodge-type structure tensors descends from
    the original number-field point by crystalline comparison.
    Taking a compositum with the local field of definition of $L$ gives the common finite local-field descent
    required by its prescribed-filtration clause.
  #emph[Transport and the first rational summand.] Apply Proposition 6 to $G$ and $gamma$ with this filtration.
    It gives a lift $B$, a quasi-isogeny $a : A_0^n arrow.r B_0$, and a rational Hodge class $kappa$ on $B$, with
  $ f_0 = a j : A_0 arrow.r B_0 \, wide f_0^(*) kappa_0 = gamma_0 \, $
  simultaneously in the realizations under consideration. The filtration on $B$, marked by $a$,
    is the direct sum of $n$ copies of the chosen filtration. Here $j$ includes the first factor.
    The map $f_0$ identifies $A_0$ with a rational direct summand of $B_0$.
    Its retraction $q_0$ and the corresponding projector $R_0$ are
  #[#set math.equation(numbering: n => "(5.8)")
   $ q_0 = "pr"_1 a^(- 1) \, wide R_0 = f_0 q_0 . $ <eq:weil-projector-identity>]
  Thus $q_0 f_0 = "id"$ and $R_0^2 = R_0$. Pulling back $f_0^(*) kappa_0 = gamma_0$ by $q_0$ gives
  $ R_0^(*) kappa_0 = q_0^(*) gamma_0 . $
  Act by $E$ on $"im" \( R_0 \)$ using $e mapsto f_0 e q_0$, and by zero on the complement.
    Also put $D_0 = q_0^(*) D^u$.
  #emph[Lifting the projector, action, and divisor.] The projector and this $E$-action preserve the repeated
    filtration. By Corollary 15, $D^u$ satisfies the divisor lifting condition for the chosen filtration on the
    first summand. The crystalline map induced by $q_0 = "pr"_1
    a^(- 1)$ respects that filtration and the marked repeated filtration on $B_0$.
    Hence $D_0 = q_0^(*) D^u$ satisfies the same condition on $B$.
    Apply Lemma 5 to $R_0$, to a finite $bb(Q)$-basis of the action of $E$ on $"im" \( R_0 \)$,
    and to the symmetric homomorphism $h_(D_0) : B_0 arrow.r B_0^or$ defined by $D_0$.
    Denote their lifts by $R$, the corresponding basis of maps, and $h_D$.
    Injectivity of specialization preserves $R^2 = R$, the rational multiplication table of that basis,
    and its unit $R$. It therefore gives an algebra action $E arrow.r R "End"^0 \( B \) R$.
    The symmetric map $h_D$ defines a rational divisor class $D$. Moreover, $q_0 R_0 = q_0$, so
  $ R_0^or h_(D_0) R_0 = h_(D_0) . $
  Injectivity lifts this identity to $R^or h_D R = h_D$, which is exactly $R^(*) D = D$.
    Thus the required projector, action, and divisor all exist on the one auxiliary variety $B$.
  #emph[The rational identity and its specialization.] Consider now rational Betti cohomology at a complex
    realization of $B$. The summand $T = "im" \( R \)$ has dimension $2 s$ at each embedding of $E$.
    The form of $D$ is supported on this summand and pairs each embedding with itself nondegenerately.
    Also $R^(*) kappa$ is supported on the pure determinant spaces of this summand.
    These assertions can be checked after extension to any one prime-to-$p$ realization:
    for the divisor they follow from its specified specialization,
    and for the Hodge class they follow from the equality $R_0^(*) kappa_0 =
    q_0^(*) gamma_0$ and the pure support of $gamma_0$. Compatibility of the transported realizations then gives
    these support and nondegeneracy assertions in Betti cohomology.
  Lemma 19 now expresses the rational Betti class $R^(*) kappa$ as a finite rational linear combination of
    products of rational divisor classes on $B$. The realization and specialization compatibilities in
    Proposition 6, together with those for divisors and homomorphisms,
    specialize this identity with the same rational coefficients in every component.
    Hence $R_0^(*) kappa_0$ is a simultaneous rational Lefschetz class. Finally,
  $ gamma_0 = f_0^(*) R_0^(*) kappa_0 \, $
  because $R_0 f_0 = f_0$. Pullback by a rational homomorphism preserves simultaneous rational Lefschetz classes,
    so the same is true of $gamma_0$. Its complementary traces are therefore one common rational intersection
    number, proving the second alternative and the proposition. ◻
]

== 6 CM reduction and consequences <sec:reduction>

The remaining step in the main proof is to express CM Hodge classes as pullbacks of balanced Weil classes.
  Together with CM transport and Proposition 17, this will prove Theorem 1.
  We then derive two specialization consequences.

=== 6.1 CM classes as pullbacks of Weil classes <cm-classes-as-pullbacks-of-weil-classes>

We give the CM reduction in the form needed here. The stronger reduction to classes on abelian varieties of split
  Weil type is due to Deligne and André [1]; see the reconstruction in [27] Theorem 1 and Section 4.
  Only balanced signatures and a compatible polarization are needed for our application,
  and we prove this form directly using rational idempotents on powers.

#thm([Lemma 6.1.])[
  (CM reduction).  #emph[Let $A \/ overline(bb(Q))$ be an abelian variety of CM type with good reduction at $w$,
    and let $r > 0$. For every rational Hodge class $gamma in H^(2 r) \( A \( bb(C) \) \, bb(Q) \( r \) \)$,
    there are finitely many abelian varieties $B_i \/ overline(bb(Q))$ with good reduction at $w$,
    rational homomorphisms $f_i : A arrow.r B_i$, and rational Weil classes $eta_i in
    H^(2 r) \( B_i \( bb(C) \) \, bb(Q) \( r \) \)$ such that
#[#set math.equation(numbering: n => "(6.1)")
 $ gamma = sum_i f_i^(*) eta_i . $ <eq:cm-pullback-decomposition>]

 Each $B_i$ has an action of a CM field $K$ for which $H_1 \( B_i \( bb(C) \) \, bb(Q) \)$ has rank $2
   r$ over $K$, the Hodge signatures are $\( r \, r \)$ at every embedding of $K$,
   and a polarization induces complex conjugation on $K$. The equality specializes simultaneously in all the
   realizations used in Theorem 1.]
] <lem:cm-reduction>

#proof[
  We first identify the eigenspace components that can support a rational Hodge class.
    For each such component we construct a balanced abelian factor of a power of $A$,
    whose Weil classes pull back onto that component. Taking the sum of these rational pullback spaces will then
    give the decomposition over $bb(Q)$.
  #emph[Balanced eigenspace components.] Set $V = H_1 \( A \( bb(C) \) \, bb(Q) \)$.
    We work throughout up to isogeny. There is a CM algebra $E'$, a product of CM fields,
    acting on $A$ such that $V$ is free of rank one over $E'$.
    To obtain it, decompose $A$ up to isogeny into simple CM factors and take the product of their CM fields,
    with a separate label for each repeated factor. Transporting this action back along an isogeny gives the
    asserted action on $A$ itself.
  Choose a finite Galois CM field $K subset overline(bb(Q))$ containing the images of all the factors of $E'$,
    and put $S = "Hom"_(bb(Q) upright("-alg")) \( E' \, K \)$. Then
  $ V_K := V ⊗_(bb(Q)) K = xor.big_(rho in S) V_rho \, wide dim_K V_rho = 1 . $
  The Hodge decomposition is diagonal for this decomposition after extension to $bb(C)$.
    We suppress the common Tate twist in the following linear-algebra calculations.
    Alternating forms of degree $2 r$ decompose as
  $ and.big^(2 r) V_K^(*) = xor.big_(Delta subset S\
\| Delta \| = 2 r) L_Delta \, wide L_Delta = and.big^(2 r) (xor.big_(rho in Delta) V_rho)^(*) \, $
  where each form on the right is extended by zero on the other summands.
    Every $L_Delta$ is one-dimensional and has a definite Hodge type.
  Suppose the component of $gamma$ in $L_Delta$ is nonzero.
    Since $gamma$ is rational, its component in $L_(sigma Delta)$ is the semilinear conjugate of that component
    and is nonzero for every $sigma in "Gal" \( K \/ bb(Q) \)$.
    The Hodge condition therefore implies that every $sigma Delta$ contains $r$ lines of each of the two Hodge
    types. We call such a subset balanced under all conjugates.
  #emph[An abelian factor with balanced signatures.] Fix one of these subsets $Delta$.
    Form the abelian variety $A ⊗_(bb(Q)) K$ in the category up to isogeny:
    it is a power of $A$ whose index space is the underlying rational vector space of $K$.
    The regular action of $K$ on this index space is an action by rational endomorphisms of the power.
    Its rational homology is
  $ T = V ⊗_(bb(Q)) K \, wide dim_(bb(Q)) T = \[ K : bb(Q) \] dim_(bb(Q)) V . $
  In contrast with the coefficient space $V_K$, we regard $T$ here as a $bb(Q)$-vector space,
    with $K$ acting on its second factor. The abelian variety remains over $overline(bb(Q))$.
    The actions on the two factors give an action of the rational algebra
  $ E' ⊗_(bb(Q)) K tilde.eq product_(rho in S) K \, wide e ⊗ k mapsto #scale(x: 120%, y: 120%)[\(] rho \( e \) k
    #scale(x: 120%, y: 120%)[\)]_(rho in S) . $
  Let $e_Delta$ be the idempotent with coordinates $1$ on $Delta$ and $0$ elsewhere.
    It is a rational endomorphism of $A ⊗_(bb(Q)) K$, so its image is an abelian variety $B_Delta$ up to isogeny.
    In particular no Galois invariance of $Delta$ is required for this construction. Write
  $ U = H_1 \( B_Delta \( bb(C) \) \, bb(Q) \) = e_Delta T . $
  The index-field action of $K$ preserves $U$.
  Now extend the coefficients of $U$ to $K$, and use the fixed inclusion $K subset
    bb(C)$ to identify the embeddings of $K$ with $"Gal" \( K \/ bb(Q) \)$.
    Evaluation of the index factor at $tau$ identifies its eigenspace in $T ⊗_(bb(Q)) K$ with $V_K$.
    In that eigenspace the idempotent retains exactly the summands indexed by $tau Delta$. Thus
  #[#set math.equation(numbering: n => "(6.2)")
   $ U_tau = xor.big_(rho in Delta) V_(tau rho) \, $ <eq:cm-embedding-summand>]
  and the same description holds after extension to $bb(C)$.
    Explicitly, evaluation of the idempotent at the pair of embeddings $\( xi \, tau \)$ is $1$ exactly when $xi =
    tau rho$ for some $rho in Delta$. Thus $dim_K U_tau = 2 r$ for every $tau$.
    Since $K$ is Galois and $Delta$ is balanced under all conjugates,
    each $U_tau$ has $r$ lines of each Hodge type. Consequently $U$ has rank $2 r$ over $K$, $dim B_Delta =
    r \[ K : bb(Q) \]$, and the required Hodge signatures are $\( r \, r \)$.
  #emph[A compatible polarization.] Let $psi$ be a rational polarization form on $V$,
    and equip the index space $K$ with the positive definite rational symmetric form
  $ t \( k \, l \) = "Tr"_(K \/ bb(Q)) \( k macron(l) \) . $
  The form $Psi = psi ⊗ t$ is a rational polarization form on the power $A ⊗_(bb(Q)) K$:
    its alternating and Hodge properties follow from those of $psi$,
    and its positivity follows by tensoring the positive symmetric form associated to $psi$ with $t$.
    A positive integral multiple gives an actual polarization. For $a in K$,
  $ t \( a k \, l \) = t \( k \, macron(a) l \) \, $
  so the Rosati involution of $Psi$ induces conjugation on the index-field action. Restrict $Psi$ to $B_Delta$.
    This is again a polarization, and because $U$ is $K$-stable its adjoint identity still induces conjugation on
    $K$. This restriction does not require $e_Delta$ to be self-adjoint.
  #emph[Pullback and descent of the rational span.] The factor $B_Delta$ now has the field action,
    balanced signatures, and polarization needed to define its Weil classes.
    The rational homomorphism $f_Delta : A arrow.r B_Delta$ defined on homology by
  $ v mapsto e_Delta \( v ⊗ 1 \) $
  has the needed effect on Weil classes. After splitting coefficients,
    its component at the identity embedding of $K$ is the projection
  $ xor.big_(rho in S) V_rho arrow.r xor.big_(rho in Delta) V_rho . $
  Thus pullback maps $and.big^(2 r) U_("id")^(*)$ isomorphically onto $L_Delta$.
    More generally the component indexed by $tau$ pulls back onto $L_(tau Delta)$.
    The rational Weil-class space $W_K^r \( B_Delta \)$ is characterized, with the twist restored, by
  $ W_K^r \( B_Delta \) ⊗_(bb(Q)) K = xor.big_(tau : K arrow.r.hook K) and.big^(2 r) U_tau^(*) \( r \) . $
  In particular $f_Delta^(*) W_K^r \( B_Delta \)$ is a rational subspace whose extension to $K$ contains
    $L_Delta \( r \)$.
  Take the sum of these rational pullback spaces over the finitely many subsets supporting $gamma$.
    Its scalar extension contains every component of $gamma$, and therefore contains $gamma$ itself.
    Since extension of scalars is injective on the quotient by a rational subspace,
    the sum already contains $gamma$ over $bb(Q)$. This proves (6.1) with rational Weil classes.
    Notice that an individual embedding component need not descend to $bb(Q)$;
    only the entire Weil-class space and its pullback are used in this descent argument.
  #emph[Good reduction and specialization.] All the constructions use finitely many rational endomorphisms of
    powers of $A$ and their images. They therefore exist over $overline(bb(Q))$ and descend,
    together with the maps, to a common number field after a finite extension.
    Choose that extension so that $A$ has good reduction at the place specified by $w$.
    For any $ell eq.not p$, the rational Tate module of $B_Delta$ is a Galois-stable direct summand of the
    rational Tate module of the power of $A$. It is unramified at this place.
    The Néron–Ogg–Shafarevich criterion gives good reduction of $B_Delta$ there;
    it also shows that the isogenies used in the construction do not affect this conclusion [23] Chapter IV,
    Theorem 3.5. Rational homomorphisms between the resulting good-reduction varieties specialize after clearing
    denominators. The equality of rational Hodge classes (6.1) is respected by their compatible realizations and
    by specialization, with the same rational coefficients in every component. This proves the last assertion. ◻
]

#thm([Corollary 6.2.])[
  #emph[The Lefschetz pairing property holds for the specialization of every rational Hodge class on a CM abelian
    variety over $overline(bb(Q))$ with good reduction at $w$.]
] <cor:cm-pairing>

#proof[
  In codimension zero the class is a rational multiple of the unit,
    so the assertion follows from the compatibility of divisor intersection numbers with the normalized traces.
    In positive codimension use Lemma 21. Proposition 17 gives the Lefschetz pairing property for the
    specialization of each $eta_i$. Lemma 4 preserves this property under rational pullback and rational linear
    combinations. Applying it to (6.1) proves the assertion. ◻
]

=== 6.2 Proof of the main theorem <proof-of-the-main-theorem>

#proof[
  The case $r = 0$ follows from divisor intersection numbers as in the preceding corollary.
    This includes $dim A = 0$, where the abelian variety is a point.
    If $r = dim A$, a rational top class is a rational multiple of the point class;
    its normalized trace is preserved by specialization, and the complementary product is $1$.
    We may therefore assume $0 < r < dim A$.
  Corollary 9 gives a CM abelian variety $B \/ overline(bb(Q))$ with good reduction at $w$,
    a rational Hodge class $kappa$ on $B$, a quasi-isogeny $a : A_0^n arrow.r B_0$,
    and the first-factor inclusion $j : A_0 arrow.r A_0^n$, such that
  $ gamma_0 = \( a j \)^(*) kappa_0 $
  simultaneously in all the realizations under consideration.
    Corollary 22 gives the Lefschetz pairing property for $kappa_0$, and Lemma 4 gives it for $gamma_0$.
    Hence, for each prescribed product of complementary divisor classes on $A_0$,
    all the normalized traces in Theorem 1 equal one rational number. This proves the theorem. ◻
]

=== 6.3 Specialization in a fixed good theory <specialization-in-a-fixed-good-theory>

We now use CM transport to place the specialization of every rational Hodge class in one fixed theory of rational
  Tate classes.

Continue to fix $overline(bb(Q)) subset bb(C)$, $p$, and $w$, with $bb(F)$, $K_0$,
  and $C_w$ as in the introduction. Let $cal(S)_0$ be Milne’s class of $bb(F)$-varieties whose connected
  components are products of abelian varieties and projective spaces.
  The CM case of Theorem 1, by linearity for complementary Lefschetz classes,
  satisfies the hypothesis of [24] Theorem 4.5. Fix one good theory $cal(R)$ of rational Tate classes on
  $cal(S)_0$ supplied by that theorem, before varying any abelian variety or Hodge class.

For $rho in cal(R)^r \( X \)$, write $\( rho \)_ell$ for its $ell$-adic component when $ell eq.not p$,
  and $\( rho \)_p$ for its native crystalline Tate component in

$ H_(upright("cris"))^(2 r) \( X \/ W \( bb(F) \) \) \[ 1 \/ p \] \( r \) . $

We use three properties of the theory. Its spaces are rational vector spaces preserved by pullback,
  its realization maps are injective, and specializations of CM Hodge classes belong to it.
  These are the properties in axioms (R1), (R4), and the goodness axiom (R3),
  respectively [24] Definitions 2.1 and 3.1. The following consequence extends the last property to all rational
  Hodge classes, while keeping this one theory fixed.

#thm([Corollary 6.3.])[
  (Specialization of all rational Hodge classes).  #emph[For every abelian variety $A \/
    overline(bb(Q))$ of dimension $d$ with good reduction $A_0 \/ bb(F)$ at $w$, every $0 lt.eq r lt.eq d$,
    and every rational Hodge class
$ gamma in H^(2 r) \( A \( bb(C) \) \, bb(Q) \( r \) \) \, $

 there is a unique class $rho_gamma in cal(R)^r \( A_0 \)$ such that
$ \( rho_gamma \)_ell = gamma_(0 \, ell) quad \( ell eq.not p \) \, wide \( rho_gamma \)_p ⊗ 1 = gamma_(0 \, p) . $

 The prime-to-$p$ equalities are in $H_(acute(e) t)^(2 r) \( A_0 \, bb(Q)_ell \( r \) \)$;
   the crystalline equality is in
$ H_(upright("cris"))^(2 r) \( A_0 \/ W \( bb(F) \) \) \[ 1 \/ p \] \( r \) ⊗_(K_0) C_w . $

 The specialization components are those of Theorem 1. The assertion holds for every prime $p$, including $p = 2$,
   with the prime, place, and theory fixed before $A$ and $gamma$ vary.]
] <cor:all-hodge-specialization>

#proof[
  In codimension zero, take the corresponding rational multiple of the unit,
    which belongs to the theory by pullback from the point. This also covers $d = 0$.
    In top codimension $r = d > 0$, take $q$ times the point class,
    where $q in bb(Q)$ is the normalized trace of $gamma$. The point class belongs to $cal(R)^d \( A_0 \)$
    [24] §2.3, and its normalized trace is one. Compatibility of traces with specialization gives the required
    components in these cases.
  Suppose now that $0 < r < d$. Choose the CM variety $B$, Hodge class $kappa$, and rational homomorphism
  $ b = a j in "Hom"^0 \( A_0 \, B_0 \) \, wide gamma_0 = b^(*) kappa_0 $
  from Corollary 9. The equality holds in all the stated realizations,
    with the usual absolute-Hodge specializations of $kappa$.
    Axiom (R3) gives one class $rho_kappa in cal(R)^r \( B_0 \)$ with
  $ \( rho_kappa \)_ell = kappa_(0 \, ell) quad \( ell eq.not p \) \, wide \( rho_kappa \)_p ⊗ 1 = kappa_(0 \, p) . $
  Choose an integer $N > 0$ such that $h = N b$ is an actual homomorphism $A_0 arrow.r B_0$.
    Pullback by $h$ preserves the theory by axiom (R1) of [24] Definition 2.1.
    Since $cal(R)^r \( A_0 \)$ is a $bb(Q)$-vector space, we may set
  $ rho_gamma = N^(- 2 r) h^(*) rho_kappa in cal(R)^r \( A_0 \) . $
  Functoriality of the component maps and (2.1) give
  $ \( rho_gamma \)_ell & = N^(- 2 r) h^(*) kappa_(0 \, ell) = b^(*) kappa_(0 \, ell) =
    gamma_(0 \, ell) &  & \( ell eq.not p \) \,\
\( rho_gamma \)_p ⊗ 1 & = N^(- 2 r) h^(*) kappa_(0 \, p) = b^(*) kappa_(0 \, p) = gamma_(0 \, p) . $
  The second line is taken after extension from $K_0$ to $C_w$.
    Pullback in (R1) applies to any homomorphism $h$, and rational scalar multiplication allows any denominator
    $N$. Thus the argument requires neither an isogeny nor separability, and remains valid when $p divides N$,
    including at $p = 2$.
  Finally, two classes with the required components have the same $ell$-adic component for any one $ell eq.not p$.
    Injectivity of that component map by (R4) makes them equal.
    Thus the class is unique in the fixed theory, independently of the auxiliary choices. ◻
]

This cohomological membership statement alone gives no algebraic cycle and proves neither the Hodge nor the Tate
  conjecture. The construction takes place at the fixed reduction place:
  its CM auxiliary may have dimension $n dim A$, and the map $b$ is between special fibers.
  It supplies no same-dimensional CM lift or map between the generic fibers.

=== 6.4 Algebraicity after good reduction <algebraicity-after-good-reduction>

The CM Hodge theorem [31] Theorem 1.1, combined with our CM transport,
  strengthens the preceding specialization statement. It is an additional input to the following consequence,
  not to the proof of Theorem 1.

#thm([Corollary 6.4.])[
  (Algebraic specialization of rational Hodge classes).  #emph[Fix the prime and place as in Theorem 1.
    Let $A \/ overline(bb(Q))$ be an abelian variety of dimension $d$ with good reduction $A_0 \/ bb(F)$ at $w$,
    and let $gamma in H^(2 r) \( A \( bb(C) \) \, bb(Q) \( r \) \)$ be a rational Hodge class, where $0 lt.eq
    r lt.eq d$. There is one rational algebraic cycle $z_gamma in "CH"^r \( A_0 \)_(bb(Q))$ such that
$ "cl"_ell \( z_gamma \) = gamma_(0 \, ell) quad \( ell eq.not p \) \, wide
  "cl"_(upright("cris")) \( z_gamma \) ⊗ 1 = gamma_(0 \, p) . $

 The crystalline equality is in
$ H_(upright("cris"))^(2 r) \( A_0 \/ W \( bb(F) \) \) \[ 1 \/ p \] \( r \) ⊗_(K_0) C_w . $

 This holds for every prime $p$, including $p = 2$. Consequently, for every $y in "CH"^(d - r) \( A_0 \)_(bb(Q))$,
   the traces of $gamma_(0 \, ell) "cl"_ell \( y \)$ for $ell eq.not p$ and of $gamma_(0 \, p)
   "cl"_(upright("cris")) \( y \)$ are all the same rational number $deg \( z_gamma dot.op y \)$.]
] <cor:algebraic-specialization>

#proof[
  In codimension zero or top codimension, use the corresponding rational multiple of the unit or the point class,
    as in the preceding proof. This includes dimension zero. For $0 < r < d$, use the CM variety $B$,
    rational Hodge class $kappa$, and map
  $ b = a j in "Hom"^0 \( A_0 \, B_0 \) \, wide gamma_0 = b^(*) kappa_0 $
  given by Corollary 9, with the equality in every stated realization.
  By [31] Theorem 1.1, $kappa$ is the Betti class of a rational algebraic cycle on $B_(bb(C))$.
    A representative can be chosen over $overline(bb(Q))$: spread each of its finitely many components in the
    Hilbert scheme of the fixed projective variety $B$, and choose a $overline(bb(Q))$-point on the same
    geometrically connected component. The universal flat family preserves the Betti cycle class.
    Thus there is $Z in "CH"^r \( B \)_(bb(Q))$ with class $kappa$.
    Descend $B$ and $Z$ to a number field and extend the chosen place so that $B$ has an abelian scheme model.
    Specialization gives $Z_0 in "CH"^r \( B_0 \)_(bb(Q))$. Compatibility of cycle classes with smooth proper
    specialization and the de Rham–crystalline comparison identifies its classes with $kappa_(0 \, ell)$ and
    $kappa_(0 \, p)$, respectively. In particular the same rational cycle $Z_0$ gives every realization.
  Choose $N > 0$ with $h = N b$ an actual homomorphism $A_0 arrow.r B_0$, and put
  $ z_gamma = N^(- 2 r) h^(*) Z_0 in "CH"^r \( A_0 \)_(bb(Q)) . $
  Here $h^(*)$ is the Chow pullback between smooth varieties, defined by the graph and refined intersection;
    it requires neither flatness nor separability of $h$. Functoriality of cycle classes and (2.1) give the
    required equalities. Rational coefficients permit this denominator even if $p divides N$;
    the crystalline realization has already inverted $p$. Finally,
    compatibility of cycle classes with products and normalized traces gives the asserted intersection number for
    every $y$. ◻
]

This conclusion concerns only the special fiber at the fixed place.
  It neither asserts the Hodge conjecture for arbitrary abelian varieties in characteristic zero nor lifts
  $z_gamma$ to the original generic fiber. The representing cycle is not asserted to be unique modulo rational
  equivalence, and no comparison between different reduction places is made.

#heading(level: 1)[References]
#bibitem([1])[Y.~André, #emph[Une remarque à propos des cycles de Hodge de type CM], in S.~David (ed.),
  #emph[Séminaire de Théorie des Nombres, Paris, 1989--90], Progress in Math.
  #strong[102], Birkhäuser Boston, Boston, MA, 1992, 1--7.]
#bibitem([2])[Y.~André, #emph[Pour une théorie inconditionnelle des motifs], Publ. Math. Inst. Hautes Études Sci.
  #strong[83] (1996), 5--49. #link("https://doi.org/10.1007/BF02698643")[doi:10.1007/BF02698643].
  #link("https://www.numdam.org/item/10.1007/BF02698643.pdf")[Original article].]
#bibitem([3])[D.~Blasius, #emph[A $p$-adic property of Hodge classes on abelian varieties],
  in #emph[Motives] (Seattle, WA, 1991), Part~2, U.~Jannsen, S.~Kleiman, and J.-P.~Serre (eds.), Proc. Sympos.
  Pure Math. #strong[55], Part~2, American Mathematical Society, Providence, RI, 1994, 293--308.
  #link("https://doi.org/10.1090/pspum/055.2/1265557")[doi:10.1090/pspum/055.2/1265557].
  #link("https://archive.mpim-bonn.mpg.de/id/eprint/3859/1/preprint_1992_59.pdf")[Author's preprint].]
#bibitem([4])[P.~Colmez and J.-M.~Fontaine, #emph[Construction des représentations $p$-adiques semi-stables],
  Invent. Math. #strong[140] (2000), no.~1, 1--43.
  #link("https://doi.org/10.1007/s002220000042")[doi:10.1007/s002220000042].
  #link("https://www.imo.universite-paris-saclay.fr/~fontaine/CF.pdf")[Author's version].]
#bibitem([5])[B.~Conrad, #emph[Minimal models for elliptic curves], notes, 20 October 2003.
  #link("https://math.stanford.edu/~conrad/vigregroup/vigre03/minimalmodel.pdf")[Author's notes].]
#bibitem([6])[P.~Deligne, #emph[Hodge cycles on abelian varieties] (notes by J.~S.~Milne), in P.~Deligne,
  J.~S.~Milne, A.~Ogus, and K.-y.~Shih, #emph[Hodge Cycles, Motives, and Shimura Varieties],
  Lecture Notes in Math. #strong[900], Springer-Verlag, Berlin--New York, 1982, 9--100.
  #link("https://www.jmilne.org/math/Documents/Deligne82.pdf")[Corrected online version].]
#bibitem([7])[J.-M.~Fontaine and M.~Rapoport, #emph[Existence de filtrations admissibles sur des isocristaux],
  Bull. Soc. Math. France #strong[133] (2005), no.~1, 73--86.
  #link("https://doi.org/10.24033/bsmf.2479")[doi:10.24033/bsmf.2479].
  #link("https://www.numdam.org/article/BSMF_2005__133_1_73_0.pdf")[Published version].]
#bibitem([8])[I.~Gleason, D.~G.~Lim, and Y.~Xu, #emph[The connected components of affine Deligne--Lusztig
  varieties], Invent. Math. #strong[243] (2026), 805--861.
  #link("https://doi.org/10.1007/s00222-025-01386-1")[doi:10.1007/s00222-025-01386-1].
  #link("https://arxiv.org/abs/2208.07195v3")[arXiv:2208.07195v3] (10 November 2025);
  preprint locators refer to #link("https://arxiv.org/pdf/2208.07195v3")[this version].]
#bibitem([9])[A.~Grothendieck, #emph[Groupes de Barsotti-Tate et cristaux],
  in #emph[Actes du Congrès International des Mathématiciens] (Nice, 1970), Tome~1, Gauthier-Villars, Paris, 1971,
  431--436. #link("https://webusers.imj-prg.fr/~leila.schneps/grothendieckcircle/GroupesB-T.pdf")[Original article].]
#bibitem([10])[U.~Hartl, #emph[On period spaces for $p$-divisible groups], C. R. Math. Acad. Sci.
  Paris #strong[346] (2008), nos.~21--22, 1123--1128.
  #link("https://doi.org/10.1016/j.crma.2008.07.003")[doi:10.1016/j.crma.2008.07.003].
  #link("https://comptes-rendus.academie-sciences.fr/mathematique/item/10.1016/j.crma.2008.07.003.pdf")[Published
  version].]
#bibitem([11])[L.~Illusie, #emph[Grothendieck at Pisa: crystals and Barsotti--Tate groups], in U.~Zannier (ed.),
  #emph[Colloquium De Giorgi 2013 and 2014], Publications of the Scuola Normale Superiore #strong[5],
  Edizioni della Normale, Pisa, 2015, 79--107.
  #link("https://doi.org/10.1007/978-88-7642-515-8_5")[doi:10.1007/978-88-7642-515-8\_5].
  #link("https://www.imo.universite-paris-saclay.fr/~luc.illusie/Illusie-Pisa5.pdf")[Author's version].]
#bibitem([12])[W.~Kim, #emph[The classification of $p$-divisible groups over $2$-adic discrete valuation rings],
  Math. Res. Lett. #strong[19] (2012), no.~1, 121--141.
  #link("https://doi.org/10.4310/MRL.2012.v19.n1.a10")[doi:10.4310/MRL.2012.v19.n1.a10].
  #link("https://arxiv.org/abs/1007.1904v3")[arXiv:1007.1904v3] (30 December 2011);
  preprint locators refer to #link("https://arxiv.org/pdf/1007.1904v3")[this version].]
#bibitem([13])[M.~Kisin, #emph[Crystalline representations and $F$-crystals], in V.~Ginzburg (ed.),
  #emph[Algebraic Geometry and Number Theory: In Honor of Vladimir Drinfeld's 50th Birthday], Progress in Math.
  #strong[253], Birkhäuser Boston, Boston, MA, 2006, 459--496.
  #link("https://doi.org/10.1007/978-0-8176-4532-8_7")[doi:10.1007/978-0-8176-4532-8\_7].]
#bibitem([14])[M.~Kisin, #emph[Mod $p$ points on Shimura varieties of abelian type], J. Amer. Math. Soc.
  #strong[30] (2017), no.~3, 819--914. #link("https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf")[Author's
  version used for all locators].]
#bibitem([15])[M.~Kisin and R.~Zhou, #emph[Independence of $ell$ for Frobenius conjugacy classes attached to
  abelian varieties], Ann. of Math. (2) #strong[202] (2025), no.~3, 1077--1156.
  #link("https://doi.org/10.4007/annals.2025.202.3.3")[doi:10.4007/annals.2025.202.3.3].
  #link("https://arxiv.org/abs/2103.09945v2")[arXiv:2103.09945v2] (7 October 2024).
  All locators refer to #link("https://arxiv.org/pdf/2103.09945v2")[arXiv:2103.09945v2].]
#bibitem([16])[M.~Kisin and R.~Zhou, #emph[Strongly compatible systems associated to semistable abelian
  varieties], preprint, 2025, #link("https://arxiv.org/abs/2505.02165v1")[arXiv:2505.02165v1] (deposited 4 May
  2025). #link("https://arxiv.org/pdf/2505.02165v1")[PDF version used for all locators], dated 10 June 2025.]
#bibitem([17])[E.~Markman, #emph[Secant sheaves and Weil classes on abelian varieties], preprint,
  contribution to the ICM 2026, #link("https://arxiv.org/abs/2509.23403v2")[arXiv:2509.23403v2] (11 February
  2026). #link("https://arxiv.org/pdf/2509.23403v2")[Version used for all locators], dated 13 February 2026.]
#bibitem([18])[J.~S.~Milne, #emph[Abelian varieties], in G.~Cornell and J.~H.~Silverman (eds.),
  #emph[Arithmetic Geometry] (Storrs, CT, 1984), Springer-Verlag, New York, 1986, 103--150.
  #link("https://doi.org/10.1007/978-1-4613-8655-1_5")[doi:10.1007/978-1-4613-8655-1\_5].
  #link("https://www.jmilne.org/math/xnotes/AVs.pdf")[Corrected author's version], 2 January 2022;
  original theorem numbering retained.]
#bibitem([19])[J.~S.~Milne, #emph[Lefschetz classes on abelian varieties], Duke Math. J.
  #strong[96] (1999), no.~3, 639--675. #link("https://www.jmilne.org/math/articles/1999aP.pdf")[Author's
  version]\; #link("https://www.jmilne.org/math/articles/1999a.html")[author's correction to the proof of Theorem~5.9].]
#bibitem([20])[J.~S.~Milne, #emph[Towards a proof of the conjecture of Langlands and Rapoport],
  notes for a talk at the Institut Henri Poincaré, 28 April 2000, version dated 30 April 2000.
  #link("https://www.jmilne.org/math/articles/2000.pdf")[Author's notes].]
#bibitem([21])[J.~S.~Milne, #emph[Introduction to Shimura varieties], in #emph[Harmonic Analysis,
  the Trace Formula, and Shimura Varieties], Clay Math. Proc.
  #strong[4], American Mathematical Society, Providence, RI, 2005, 265--378.
  #link("https://www.jmilne.org/math/xnotes/svi.pdf")[Author's revision], 16 September 2017;
  locators refer to this revision.]
#bibitem([22])[J.~S.~Milne, #emph[The Tate conjecture over finite fields (AIM talk)],
  notes for the American Institute of Mathematics workshop, July 2007, version~2.2, 7 May 2008.
  #link("https://www.jmilne.org/math/articles/2007e.pdf")[Version used for all locators].]
#bibitem([23])[J.~S.~Milne, #emph[Abelian Varieties], course notes, version~2.00, 2008, vi+166~pp.
  #link("https://www.jmilne.org/math/CourseNotes/AVc.pdf")[Author's course notes].]
#bibitem([24])[J.~S.~Milne, #emph[Rational Tate classes], Mosc. Math. J. #strong[9] (2009), no.~1, 111--141.
  #link("https://www.jmilne.org/math/articles/2009b.pdf")[Author's version]\; page numbers refer to this version.]
#bibitem([25])[J.~S.~Milne, #emph[Lectures on Étale Cohomology], course notes, version~2.21, 22 March 2013.
  #link("https://www.jmilne.org/math/CourseNotes/LEC.pdf")[Author's notes].]
#bibitem([26])[J.~S.~Milne, #emph[Algebraic Number Theory], course notes, version~3.08, 19 July 2020.
  #link("https://www.jmilne.org/math/CourseNotes/ANTc.pdf")[Author's course notes]. Locators refer to this version.]
#bibitem([27])[J.~S.~Milne, #emph[Hodge classes on abelian varieties], preprint, 2020,
  #link("https://arxiv.org/abs/2010.08857v2")[arXiv:2010.08857v2] (11 November 2020).
  #link("https://arxiv.org/pdf/2010.08857v2")[Version used for all locators].]
#bibitem([28])[J.~S.~Milne, #emph[Algebraic Groups: The Theory of Group Schemes of Finite Type over a Field],
  Cambridge Studies in Advanced Mathematics #strong[170], Cambridge University Press, Cambridge, 2017;
  corrected reprint, 2022. #link("https://doi.org/10.1017/9781316711736")[doi:10.1017/9781316711736].
  #link("https://www.jmilne.org/math/Books/iAG2022.pdf")[Corrected 2022 version used for all locators].]
#bibitem([29])[J.~S.~Milne, #emph[Abelian motives and Shimura varieties in nonzero characteristic], preprint,
  version~2.2, 2 November 2025. #link("https://www.jmilne.org/math/articles/SVp.pdf")[Author's version used for
  all locators].]
#bibitem([30])[B.~Moonen, #emph[Models of Shimura varieties in mixed characteristics],
  in A.~J.~Scholl and R.~L.~Taylor (eds.), #emph[Galois Representations in Arithmetic Algebraic Geometry] (Durham,
  1996), London Math. Soc. Lecture Note Ser. #strong[254], Cambridge University Press, Cambridge, 1998, 267--350.
  #link("https://doi.org/10.1017/CBO9780511662010.008")[doi:10.1017/CBO9780511662010.008].
  #link("https://www.math.ru.nl/personal/bmoonen/Papers/SMCfinal.pdf")[Author's version].]
#bibitem([31])[OpenAI, #emph[The rational Hodge conjecture for CM abelian varieties], \
OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-rational-Hodge-conjecture-for-CM-abelian-varieties-September-30-2026/paper.pdf")[OAI:The-rational-Hodge-conjecture-for-CM-abelian-varieties-September-30-2026],
  2026.]
#bibitem([32])[G.~Pappas and M.~Rapoport, #emph[$p$-adic shtukas and the theory of global and local Shimura
  varieties], Camb. J. Math. #strong[12] (2024), no.~1, 1--164.
  #link("https://doi.org/10.4310/CJM.2024.v12.n1.a1")[doi:10.4310/CJM.2024.v12.n1.a1].
  #link("https://arxiv.org/abs/2106.08270v6")[arXiv:2106.08270v6] (26 October 2023);
  preprint page numbers refer to #link("https://arxiv.org/pdf/2106.08270v6")[this version].]
#bibitem([33])[The Stacks Project Authors, #emph[The Stacks Project],
  #link("https://stacks.math.columbia.edu/tag/0A42")[Lemma~30.28.3, Tag~0A42], accessed 23 September 2026.]
#bibitem([34])[J.~T.~Tate, #emph[$p$-Divisible Groups], in T.~A.~Springer (ed.),
  #emph[Proceedings of a Conference on Local Fields] (Driebergen, 1966), Springer-Verlag, Berlin--Heidelberg,
  1967, 158--183. #link("https://doi.org/10.1007/978-3-642-87942-5_12")[doi:10.1007/978-3-642-87942-5\_12].
  #link("https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf")[Original article].]
#bibitem([35])[J.-P.~Wintenberger, #emph[Propriétés du groupe tannakien des structures de Hodge $p$-adiques et
  torseur entre cohomologies cristalline et étale], Ann. Inst.
  Fourier (Grenoble) #strong[47] (1997), no.~5, 1289--1334.
  #link("https://doi.org/10.5802/aif.1600")[doi:10.5802/aif.1600].
  #link("https://www.numdam.org/item/10.5802/aif.1600.pdf")[Original article].]
