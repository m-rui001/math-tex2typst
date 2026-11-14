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

#align(center)[#text(size: 16pt, weight: "bold")[The equivariant cohomological Hikita conjecture \
for arbitrary quivers]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Hikita’s conjecture relates two different kinds of algebra:
  the cohomology of a symplectic resolution and the functions on a fixed subscheme of a corresponding Coulomb
  branch. The scheme structure is essential. Even when the underlying fixed-point set is small,
  its nilpotent functions can encode positive-degree cohomology.
  For quiver gauge theories, the tautological classes on the Higgs side and the equivariant parameters on the
  Coulomb side give a common coefficient ring. The question is whether the relations among those coefficients agree.

We prove this agreement for arbitrary finite quivers, under the precise regularity hypothesis stated below.
  The proof keeps the coefficient maps and the full fixed schemes throughout.
  Its two main comparisons have different purposes: a calculation for the full topological torus identifies the
  cohomology algebra, while a separate argument identifies that torus-fixed scheme with the fixed scheme of the
  stability cocharacter.

=== 1.1 The statement and its coefficient maps <the-statement-and-its-coefficient-maps>

Let $Q = \( Q_0 \, Q_1 \)$ be a finite oriented quiver. Loops and multiple arrows are allowed.
  Fix complex vector spaces $V_i \, W_i$ of dimensions $v_i \, w_i$, and put

#[#set math.equation(numbering: n => "(1.1)")
 $ G = product_(i in Q_0) "GL" \( V_i \) \, wide N = xor.big_(a : i arrow.r j) "Hom" \( V_i \, V_j \) xor
   xor.big_(i in Q_0) "Hom" \( V_i \, W_i \) . $ <eq:gauge-data>]

An algebraic torus $F$ acts linearly on $N$ and commutes with $G$; write $frak(f) = "Lie" F$.
  The induced action on $T^(*) N = N xor N^(*)$ is Hamiltonian.
  For $\( s \, p \) in N xor N^(*)$, our cotangent moment map is characterized by $chevron.l mu \( s \, p \) \,
  xi chevron.r = chevron.l p \, xi s chevron.r$. Choose a character $nu$ of $G$ for which the $nu$-semistable
  locus in $mu^(- 1) \( 0 \)$ equals the stable locus and $G$ acts freely there.
  We call such a character #emph[regular], and set

#[#set math.equation(numbering: n => "(1.2)")
 $ D = mu^(- 1) \( 0 \)^(nu upright("-stable")) \, wide X = D \/ G . $ <eq:higgs-definition>]

Thus $X$ is a smooth Nakajima variety. We allow $D$ and $X$ to be empty.

Put $cal(O) = bb(C) \[ \[ t \] \]$ and $cal(K) = bb(C) \( \( t \) \)$.
  The Braverman–Finkelberg–Nakajima space of triples and its flavor-deformed Coulomb algebra are

#[#set math.equation(numbering: n => "(1.3)")
 $ cal(R) & = { \[ g \, s \] in G \( cal(K) \) times_(G \( cal(O) \)) N \( cal(O) \) : g s in N \( cal(O) \) } \,\
A_F & = H_(*)^(G \( cal(O) \) times F) \( cal(R) \; bb(C) \) \, wide Y_(frak(f)) =
  "Spec" A_F . $ <eq:triples-definition>]

Here $\( g \, s \) tilde.op \( g h^(- 1) \, h s \)$, and the multiplication is BFN convolution.
  We use the commutative algebra, without the loop-rotation deformation parameter.
  Its topological grading is by $pi_1 \( G \) = bb(Z)^({ i : v_i > 0 })$,
  and defines a torus $T_(upright("top")) = "Hom" \( pi_1 \( G \) \, bb(C)^times \)$.
  The character $nu$ gives a cocharacter of this torus. Its fixed locus is scheme-theoretic:
  if $\( A_F \)_m$ denotes its weight-$m$ subspace, then

#[#set math.equation(numbering: n => "(1.4)")
 $ bb(C) \[ Y_(frak(f))^nu \] = A_F \/ chevron.l \( A_F \)_m : m eq.not 0 chevron.r . $ <eq:nu-quotient>]

No reduction of this quotient will be taken.

Let $T subset G$ be the diagonal maximal torus, let $cal(W)$ be its Weyl group, and write

#[#set math.equation(numbering: n => "(1.5)")
 $ R = H_(G times F)^(*) \( upright("pt") \; bb(C) \) = bb(C) \[ "Lie" T xor frak(f) \]^(cal(W)) \, wide R_0 =
   H_G^(*) \( upright("pt") \; bb(C) \) . $ <eq:coefficient-ring>]

The Kirwan map $phi.alt_H : R arrow.r H_F^(*) \( X \; bb(C) \)$ and the coefficient map $phi.alt_C : R arrow.r
  bb(C) \[ Y_(frak(f))^nu \]$ are the natural maps on the two sides of the Hikita conjecture.
  On the first side, a gauge Chern class maps to the Chern class of its tautological bundle,
  and a flavor parameter acts through $H_F^(*) \( upright("pt") \)$.
  On the second side, $R$ acts by the coefficient classes of the Coulomb algebra,
  followed by the fixed-scheme quotient. Each linear gauge or flavor parameter has degree two.

#prodef([Theorem 1.1.])[
  #emph[For every datum (1.1), every commuting flavor torus $F$, and every regular stability character $nu$,
    both coefficient maps are surjective and have the same kernel.
    They therefore induce a canonical isomorphism of graded $R$-algebras
$ H_F^(*) \( X \; bb(C) \) med tilde.equiv med bb(C) \[ Y_(frak(f))^nu \] . $

 The gradings are ordinary cohomological degree and BFN homological degree, respectively.
   The assertion includes the empty case, whose ring is zero.]
] <thm:main>

This is the equivariant cohomological Hikita conjecture for quiver gauge theories,
  in the form of #cite(label("DK25")) Conjecture 2.1, Equation (2.3).
  It concerns the full coefficient-algebra quotient, with its nilpotents.
  No finite-type, Dynkin, conical, or good/ugly hypothesis is imposed.

=== 1.2 History and the comparison problem <history-and-the-comparison-problem>

A classical model is the description of type-$A$ Springer-fiber cohomology through scheme-theoretic intersections
  of nilpotent orbit closures with a Cartan subalgebra, developed by de Concini–Procesi and Tanisaki
  #cite(label("DeConciniProcesi81")) #cite(label("Tanisaki82")).
  In the setting of symplectic duality #cite(label("BLPW16")),
  Hikita formulated a fixed-scheme realization of cohomology and established it for the Hilbert scheme of points
  in the plane, with related type-$A$ Spaltenstein and smooth hypertoric examples #cite(label("Hikita17")).
  These examples explain why the infinitesimal structure of the fixed locus, rather than its set of points,
  is central to the question.

Nakajima proposed a mathematical Coulomb-branch construction for three-dimensional gauge theories
  #cite(label("Nakajima16")); Braverman–Finkelberg–Nakajima constructed its commutative convolution algebra
  #cite(label("BFN18")) #cite(label("BFN19")), extending the affine-Grassmannian convolution framework of
  Bezrukavnikov–Finkelberg–Mirković #cite(label("BFM05")). For quiver gauge theories the corresponding Higgs
  quotient is a Nakajima variety #cite(label("Nakajima94")).
  The coefficient-compatible formulation has important predecessors.
  Kamnitzer–Tingley–Webster–Weekes–Yacobi record Nakajima’s equivariant conjecture in the affine-Grassmannian
  setting and strengthen its specialized form by requiring compatibility with tautological classes
  #cite(label("KTWWY19")) Conjectures 8.9–8.10. Hilburn–Kamnitzer–Weekes formulate the equivariant quantized
  refinement over the common coefficient algebra #cite(label("HKW23")) Section 5.7, Conjecture 5.26.
  Krylov–Shlykov state the general-quiver comparison for the #emph[full topological-torus fixed scheme] as
  equality of coefficient-map kernels #cite(label("KrylovShlykov25")) Section 8.1, Conjecture 8.1.
  We first establish that equality and then compare the full-torus fixed scheme with the stability-cocharacter
  fixed scheme. Thus compatibility with the coefficient maps is part of the conjectural formulation itself.

Krylov–Shlykov prove the Gieseker, or framed Jordan-quiver, case #cite(label("KrylovShlykov25")).
  Dumanski–Krylov give the formulation used here and compare cohomological, equivariant,
  and $K$-theoretic versions #cite(label("DK25")). Their finite-type conclusion includes types $A \, D \, E_6$;
  in types $E_7 \, E_8$ it imposes the framing restrictions in #cite(label("DK25")) Corollary 2.17.
  Their Remark 2.18 explains why the earlier unrestricted ADE assertion must be qualified.
  Recent developments also include Setiabrata’s Hikita surjectivity result for the base-affine-cotangent example
  #cite(label("Setiabrata24")), and the refined quantum Hikita theorem of Dinkins–Karpov–Krylov for ADE quivers
  with minuscule-supported framing and for the Jordan quiver #cite(label("DinkinsKarpovKrylov26")) Theorem B.
  Theorem 1 treats the cohomological algebra for all the finite quiver data above.
  It does not assert the quantized statement in #cite(label("DK25")) Equation (2.2),
  nor extend the theorem to arbitrary reductive gauge groups; outside this setting,
  proposed Hikita-type identifications can fail #cite(label("HoangKrylovMatvieievskyi24")) Example 6.7.

Several established tools enter the argument in distinct ways.
  BFN abelianization turns minuscule convolution classes into explicit Laurent expressions,
  and Weekes’s generation theorem makes these classes sufficient for arbitrary quivers #cite(label("BFN18"))
  #cite(label("BFN19")) #cite(label("Weekes19")). McGerty–Nevins’s ordinary and equivariant Kirwan surjectivity
  results supply the tautological presentation on the Higgs side #cite(label("MN18")) Theorem 1.2 and
  Corollary 1.5. Hausel’s arithmetic Fourier-transform formula computes the Betti numbers that eventually
  determine the size of the coefficient quotient #cite(label("Hausel06")).
  Character-linearized GIT and the topological Kempf–Ness correspondence connect regular stability to the flat
  hyperkähler quotient construction #cite(label("King94")) #cite(label("Hoskins14")) #cite(label("HKLR87"))
  #cite(label("Nakajima94")). Our use of these inputs is explained at their precise interfaces below.

The finite-dimensional critical-model viewpoint is related to Nakajima’s original construction and to
  Botta–Tamagni’s critical lattice and quasimap models #cite(label("Nakajima16")) #cite(label("BottaTamagni26")).
  Here the specific stable-pair test proves an inclusion of coefficient ideals;
  it does not require their entire Coulomb-action construction.
  Deformation arguments also appear in Krylov–Shlykov’s Gieseker proof #cite(label("KrylovShlykov25"))
  Remark 1.15. Our loop-removal step uses subgroup localization #cite(label("Brion98")),
  with the prequotient perspective of #cite(label("DK25")) Proposition 2.3,
  and an explicit descent for homogeneous ideals. These connections distinguish the established methods from the
  particular comparison arguments carried out here.

The difficulty is not just to match dimensions. One must identify the relations under the specified maps,
  with their grading and nilpotents, for arbitrary flavors and for every regular stability.
  Neither a calculation on closed fixed points nor an isomorphism after inverting generic parameters establishes
  that assertion. A further distinction is that a regular character can satisfy $nu dot.op upright(bold(b)) =
  0$ for an integer vector $0 < upright(bold(b)) lt.eq upright(bold(v))$.
  Therefore the full topological-torus calculation does not by itself identify the cocharacter-fixed quotient.

=== 1.3 Proof strategy and organization <proof-strategy-and-organization>

Define the intermediate coefficient algebra and the two ideals to be compared by

#[#set math.equation(numbering: n => "(1.6)")
 $ B_F & = bb(C) \[ Y_(frak(f))^(T_(upright("top"))) \] = A_F \/ chevron.l A_F^(\( d \)) : d eq.not 0 chevron.r \,\
I_(upright("top")) & = ker \( R arrow.r B_F \) \, wide I_H = ker \( R arrow.r^(phi.alt_H) H_F^(*) \( X \) \) \,
  $ <eq:intro-two-ideals>]

where $A_F^(\( d \))$ is the subspace of topological charge $d in pi_1 \( G \)$;
  its cocharacter weight is $nu dot.op d$. Neither of these is the cohomological degree used in Hilbert series.
  Section 2 explains why the coefficient maps to $B_F$ and to $H_F^(*) \( X \)$ are surjective.
  Thus the first task is precisely the equality $I_(upright("top")) = I_H$.
  The second task is the equality of the cocharacter and full-torus defining ideals inside $A_F$.
  A subscript $0$ means that the flavor torus is trivial, so $R_0 =
  H_G^(*) \( upright("pt") \)$ and $B_0$ denotes the corresponding full-torus quotient.
  Figure 1 separates the two tasks.

===== 1.3.1 1. Stable pairs give a quotient map. <stable-pairs-give-a-quotient-map.>

Sections 3 and 4 prove $I_(upright("top")) subset.eq I_H$ for all the data of the theorem.
  The nontrivial minuscule generators used here are dressed lattice modifications whose coweight entries are all
  in ${ 0 \, 1 }$ or all in ${ 0 \, - 1 }$, with nonzero topological charge;
  a subset may involve several vertices. A convolution word is a finite product of these classes.
  By minuscule generation, a coefficient in $I_(upright("top"))$ is a finite sum of positive-length convolution
  words, each of total topological charge zero. Section 3 realizes each such word by finite-dimensional lattice
  correspondences, keeping all degree shifts. The test in Section 4 evaluates them on stable cotangent pairs.
  The stability character assigns an additive degree to each modification,
  so the degrees in a neutral word sum to zero. After reordering each word,
  its first modification is nontrivial and has nonpositive character-line degree; stability excludes it.
  On the identity correspondence, the same test gives a split restriction onto $H_F^(*) \( X \)$,
  which detects the coefficient class itself. The tested relation therefore vanishes in cohomology,
  yielding the graded coefficient-compatible surjection $B_F arrow.r.twohead H_F^(*) \( X \)$ of Proposition 8.

===== 1.3.2 2. Added loops make the size comparison explicit. <added-loops-make-the-size-comparison-explicit.>

Temporarily suppose that the quiver has a loop at every vertex of positive gauge dimension, take no flavor,
  and use determinant stability $nu_det = product_i det_(V_i)$.
  The loop weights cancel the Grassmannian denominators in minuscule abelianization.
  Section 5 proves a Laurent model with polynomial coefficients and filters $B_0$ by multipartitions of the gauge
  dimension vector. Its successive quotients are bounded by invariant parts of polynomial quotients defined by cut
  products: products of framing variables and differences across a subset of slots and its complement.
  Section 6 computes their Hilbert series using a reachability stratification and identifies the resulting sum
  with Hausel’s ordinary Poincaré polynomial. The upper bound and the surjection from the first step force
  equality in every degree. This is an isomorphism under the original coefficient map,
  not merely a numerical identity; see Corollary 20.

===== 1.3.3 3. Deformation returns to the original data. <deformation-returns-to-the-original-data.>

For an arbitrary quiver $Q$, let $Q^(+)$ be obtained by adding one loop at each vertex of positive gauge
  dimension. Give the new loops the common weight one of an auxiliary flavor torus $H = bb(C)^times$,
  with parameter $z in H_H^2 \( upright("pt") \)$. The comparison in Section 7 uses a lift of the no-flavor
  isomorphism for $Q^(+)$ to this flavor. Near zero gauge parameters and nonzero mass $z = 1$,
  the new minuscule Euler factors are invertible on the Coulomb side.
  Subgroup localization on the stable prequotient gives the corresponding comparison on the Higgs side.
  The resulting equality of localized coefficient ideals descends to the original homogeneous ideals in $R_0$:
  their equality at the graded origin determines them globally.
  This homogeneity argument, not specialization of an unspecified generic isomorphism,
  is the content of Proposition 23. Local constancy of regular stability, quaternionic rotation,
  and generic constancy of compactly supported Betti numbers then compare all regular characters.
  A final flavor lift proves $B_F tilde.eq H_F^(*) \( X \)$ in Theorem 24.

===== 1.3.4 4. Complementary monopoles identify the cocharacter quotient. <complementary-monopoles-identify-the-cocharacter-quotient.>

Section 8 proves, independently of the preceding cohomology comparison,
  that the natural map $bb(C) \[ Y_(frak(f))^nu \] arrow.r B_F$ is an isomorphism.
  It combines polynomial-form Hall-algebra generation #cite(label("JindalNegut26")) with the monopole maps of
  Lemma 25, derived from #cite(label("Tsymbaliuk23Difference")) Theorem 5.7 with explicit product signs.
  The resulting finite identities can be specialized without dividing by rotation or arrow parameters.
  After adjoining a rank-one framing vertex, any surviving nontrivial minuscule monopole has a surviving
  complementary monopole. Hall generation would then decompose both charges into indecomposable charges of the
  enlarged quiver, all of weight zero for the extended character.
  Lemma 27 realizes these charges by moment-level blocks. Their semistable direct sum has a stabilizer that
  remains positive-dimensional even after removing the ineffective diagonal scalar.
  This contradicts the freeness in regularity, including when the semistable locus is empty.
  Proposition 28 therefore identifies the two defining ideals, completing the scheme-theoretic comparison.

#figure(
  [#grid(
    columns: (0.47fr, 0.47fr,),
    column-gutter: 6%,
    [
      #strong[The coefficient-ideal comparison]
      Every $Q \, F$ and regular $nu$ Stable-pair test $I_(upright("top")) subset.eq I_H$ Sections 3–4
      $arrow.b.double$
      $Q^(+)$, no flavor, determinant stability Laurent model and cut-ideal count $B_0 \( Q^(+) \) tilde.eq
        H^(*) \( X_det \( Q^(+) \) \)$ Sections 5–6
      $arrow.b.double$
      Lift to the added-loop flavor $H$ Compare near gauge $0$, mass $z =
        1$ Descend homogeneous ideals for $Q$ Proposition 23
      $arrow.b.double$
      All regular stabilities, then all flavors $B_F tilde.eq H_F^(*) \( X \)$ Theorem 24
    ],
    [
      #strong[The fixed-scheme comparison]
      Suppose a nontrivial minuscule class survives in the cocharacter quotient.
        Adjoin a rank-one framing vertex; its complementary class also survives
      $arrow.b.double$
      Polynomial Hall generation Both surviving charges decompose into indecomposable charges of the enlarged
        quiver, all of weight zero Lemma 26
      $arrow.b.double$
      Lemma 27 gives moment-level blocks. Their direct sum retains a positive-dimensional stabilizer after
        removing the diagonal scalar, contradicting regularity
      $arrow.b.double$
      $bb(C) \[ Y_(frak(f))^nu \] tilde.eq B_F$ as quotients of $A_F$ Proposition 28
    ],
  )
  $bb(C) \[ Y_(frak(f))^nu \] med arrow.r^(med tilde.op med) med B_F med arrow.r^(med tilde.op med) med
    H_F^(*) \( X \)$],
  caption: [Figure 1: The two comparisons in the proof. Here $Q^(+)$ adds one loop at each positive-rank vertex of $Q$; dimension and framing vectors are unchanged and suppressed. The left column uses the stable-pair surjection in the dimension comparisons. The right column is independent of the left and identifies defining ideals, not just closed fixed points. Both final maps preserve the coefficient ring and grading. ],
) <fig:proof-route>

== 2 Coefficient rings, minuscule classes, and flavor <sec:preliminaries>

This section supplies the generation and coefficient maps needed for the two ideal comparisons described in
  Section 1. Minuscule generation makes $B_F$ a quotient of $R$;
  Kirwan surjectivity does the same for $H_F^(*) \( X \)$. Flavor base change and local constancy of regular
  stability will let us apply these presentations to the auxiliary data used later.

We use complex coefficients throughout. Vertices with $v_i = 0$ can be discarded.
  If all $v_i$ vanish, both sides of Theorem 1 equal $H_F^(*) \( upright("pt") \)$,
  so we henceforth allow ourselves to omit that case. Write

$ P_F = bb(C) \[ x_(i a) : i in Q_0 \, med 1 lt.eq a lt.eq v_i \] ⊗ bb(C) \[ frak(f) \] \, wide cal(W) =
  product_i S_(v_i) \, wide R = P_F^(cal(W)) . $

The $x_(i a)$ are the Chern roots of the gauge bundles. Each linear form in $P_F$ has cohomological degree two.
  An element $lambda = \( lambda_(i a) \) in X_(*) \( T \)$ has topological charge
  $\[ lambda \] = \( sum_a lambda_(i a) \)_i$. We write $A_F^(\( d \))$ for the subspace of charge $d$ and define

#[#set math.equation(numbering: n => "(2.1)")
 $ B_F = A_F \/ chevron.l A_F^(\( d \)) : d eq.not 0 chevron.r . $ <eq:full-fixed-quotient>]

Thus $B_F$ is the coordinate ring of the fixed subscheme for $T_(upright("top"))$.
  A subscript $0$ means that the flavor torus is trivial.

#prodef([Lemma 2.1.])[
  #emph[For the purposes of Theorem 1, one may assume that the flavor action assigns a character to each arrow
    summand and acts diagonally on each framing multiplicity space.
    Adding or removing a $G$-trivial representation with any flavor action preserves both coefficient-algebra
    quotients and all stability conditions.]
] <lem:trivial-summands>

#proof[
  Decompose $N$ into $G$-isotypic summands. A commuting torus acts on each multiplicity space and is
    diagonalizable there. The nontrivial irreducible gauge representations that occur are the bifundamentals
    between distinct vertices, the dual standard representations from framing,
    and the traceless endomorphisms at vertices of rank at least two. All remaining summands are gauge-trivial.
    A weighted traceless endomorphism summand can be replaced by the full endomorphism representation by adding a
    scalar line of the same flavor weight. This gives the asserted description.
  If $E$ is gauge-trivial, the moment map for $N xor E$ is the moment map for $N$,
    and semi-invariant generation shows that the stable and semistable loci are the corresponding loci for $N$,
    times $T^(*) E$. Their stabilizers are unchanged. The quotient gains a factor $T^(*) E$,
    which retracts $F$-equivariantly to zero. In the space of triples the condition on the $E \( cal(O) \)$
    coordinate imposes no lattice constraint, so this coordinate gives a common vector-space factor in every
    finite truncation. The normalized equivariant Thom isomorphism removes this factor,
    compatibly with convolution, both gradings, and the coefficient map. This proves the claim on both sides. ◻
]

We call a coweight #emph[positive minuscule] if all its entries, across all vertices, are $0$ or $1$,
  and #emph[negative minuscule] if all entries are $0$ or $- 1$.
  Its orbit $"Gr"_G^lambda$ in $"Gr"_G = G \( cal(K) \) \/ G \( cal(O) \)$ is a product of ordinary Grassmannians
  and is closed and smooth.

Write $cal(W)_lambda = "Stab"_(cal(W)) \( lambda \)$, $u_(+) = max \( u \, 0 \)$,
  and let $"wt" \( N \)$ denote the multiset of weights of $N$.
  For $p in P_F^(cal(W)_lambda)$, put $p_(w lambda) = w \( p \)$;
  stabilizer invariance makes this independent of the representative $w$.

#prodef([Proposition 2.2.])[
  (Abelianization and minuscule generation).  #emph[There is an injective coefficient-preserving algebra map from
    $A_F$ into
$ #scale(x: 120%, y: 120%)[\(] "Frac" \( P_F \) \[ X_(*) \( T \) \] #scale(x: 120%, y: 120%)[\)]^(cal(W)) \, wide
  e^lambda e^gamma = e^(lambda + gamma) . $

 Besides $R$, the algebra is generated by the dressed classes associated with all nonzero positive and negative
   minuscule coweights. For $p in P_F^(cal(W)_lambda)$, the class has expression
#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(lambda' in cal(W) lambda) e^(lambda') p_(lambda')
   frac(product_(beta in "wt" \( N \)) beta^(\( - chevron.l beta \, lambda' chevron.r \)_(+)), "eu"_T \(
   T_(t^(lambda')) "Gr"_G^lambda \)) . $ <eq:minuscule>]

 Each distinct translate occurs once, and the dressing is translated with the coweight.
   Denote this class by $M_(lambda \, p)$. Weights $beta$ include their flavor components,
   but pairings use only the gauge components; factors with exponent zero are omitted.
   The class has charge $\[ lambda \]$. On charge zero, the BFN grading is twice the ordinary polynomial degree of
   the rational coefficients in this description.]
] <prop:minuscule>

#proof[
  We use the classical BFN localization and flavor construction #cite(label("BFN18")) Proposition 3.22,
    Lemmas 5.9–5.13, Proposition 5.15, and Corollary 5.21, and its minuscule formula #cite(label("BFN18"))
    Proposition 6.6#cite(label("BFN19")) Appendix A, Proposition A.2,
    together with quiver minuscule generation #cite(label("Weekes19")) Proposition 3.1 and Remarks 3.3–3.4.
    The form of the formula can be checked directly: the inclusion of the space of triples into the bundle of
    lattices $g N \( cal(O) \)$ contributes the Euler class of
  $ t^(lambda') N \( cal(O) \) #scale(x: 120%, y: 120%)[\/] #scale(x: 120%, y: 120%)[\(] N \( cal(O) \) ∩
    t^(lambda') N \( cal(O) \) #scale(x: 120%, y: 120%)[\)] \, $
  which is the numerator of (2.2). Localization on the closed minuscule orbit gives the tangent denominator.
    There is no rotation, so translating a modification by $t^eta$ changes the Laurent monomial but does not shift
    the coefficients. The localization theorem and the orbit filtration give injectivity before taking Weyl
    invariants. Equivalently, the image of the nonabelian algebra lies in the invariant part of the displayed ring.
  For completeness, the minuscule coweights used in the generation theorem are subsets of slots at several
    vertices at once. Decomposing positive or negative integral coweights by successive level sets gives exactly
    these two families; no assertion that single-slot monopoles suffice is needed.
    Lemma 2 puts arbitrary commuting flavors in weighted quiver form.
    Flavor characters change the equivariant Euler factors but not the gauge-weight hyperplane arrangement used in
    the generation proof; the same chamber argument therefore retains those parameters,
    as discussed in #cite(label("Weekes19")) Section 1.6.1. The embedding used here is the classical localization
    map, not a specialization of a representation in which loop rotation is inverted.
    Finally, put $c_lambda = sum_(beta in "wt" \( N \)) \( - chevron.l beta \, lambda chevron.r \)_(+)$ and
    $a_lambda = dim "Gr"_G^lambda$. For homogeneous $p$, the BFN homological normalization gives
  $ deg M_(lambda \, p) = 2 c_lambda - 2 a_lambda + deg p $
  by #cite(label("BFN18")) Lemmas 2.2 and 2.5–2.6. These are exactly the degrees of the numerator,
    tangent denominator, and dressing in Equation (2.2). The bare matter-free torus class $e^lambda$ has degree
    zero. This proves the stated grading comparison. General dressings are decomposed into homogeneous summands.
    The additional shifts from a common finite section cutoff will be kept explicitly in Section 3.
    No nonnegative grading on $A_F$ itself is assumed. ◻
]

Every nontrivial minuscule generator in Proposition 3 has nonzero charge.
  Consequently the coefficient map $R arrow.r B_F$ is surjective, and $B_F$ is nonnegatively graded.
  More precisely, the ideal in (2.1) is generated by those minuscule classes:
  after killing them the algebra is generated by $R$ and is supported in charge zero.
  In particular, a coefficient relation in $B_F$ can be expressed as a finite sum of neutral words of positive
  length in the nonzero minuscule generators, with coefficients in $R$.

#prodef([Lemma 2.3.])[
  (Flavor base change).  #emph[Let $F arrow.r F'$ be a homomorphism of algebraic tori,
    and suppose the action on $N$ is obtained by restriction of an $F'$-action commuting with $G$.
    Then the natural maps are isomorphisms
$ A_(F') ⊗_(H_(F')^(*) \( upright("pt") \)) H_F^(*) \( upright("pt") \) & med tilde.equiv A_F \,\
B_(F') ⊗_(H_(F')^(*) \( upright("pt") \)) H_F^(*) \( upright("pt") \) & med tilde.equiv B_F . $

 They respect the coefficient maps, both gradings, and convolution.]
] <lem:flavor-base-change>

#proof[
  Filter the affine Grassmannian by bounded unions of orbits and truncate all section lattices between
    sufficiently high positive and negative powers of $t$. Over an orbit,
    the truncated space of triples is a vector bundle of constant relative rank.
    The orbit is an affine-space bundle over a partial flag variety; its equivariant homology,
    with the relative shifts in the definition of $A_F$, is even.
    Its $F'$-equivariant homology is free over $H_(F')^(*) \( upright("pt") \)$,
    and restricting the flavor action gives the displayed change of coefficients on this stratum.
    The exact sequences for adjoining strata have no odd terms,
    so these statements extend through each finite filtration.
    The free successive quotients also show that tensoring the sequences introduces no Tor term.
    Passing to the stabilized truncations and their exhaustive union proves the first assertion.
    Pullback, refined intersection, and proper pushforward defining convolution commute with this change of
    equivariance, so the assertion is an algebra isomorphism.
  Flavor parameters have charge zero. Under the first isomorphism the ideal generated by all nonzero charge spaces
    is the extension of the same ideal before base change. Taking the quotient therefore gives the second
    assertion; no flatness of $B_(F')$ is required for this step. ◻
]

For the moment-map comparisons below, we use the topological affine Kempf–Ness theorem:
  the quotient of a character-shifted real moment level by a compact form of $G$ is homeomorphic to the
  corresponding affine-character GIT quotient #cite(label("Hoskins14")) Theorem 4.2(v).
  The same statement restricts to a closed invariant subvariety.
  Indeed, its GIT quotient embeds as a closed subspace of the ambient quotient,
  and its orbit closures and their closed representatives remain in that subvariety.
  This applies in particular to every central complex moment fiber in $T^(*) N$.

#prodef([Lemma 2.4.])[
  (Local constancy of regular stability).  #emph[Let $theta$ be a rational character parameter for which every
    semistable point of $mu^(- 1) \( 0 \)$ is stable and has trivial stabilizer.
    There is a neighborhood $U$ of $theta$ in $X^(*) \( G \) ⊗_(bb(Z))
    bb(R)$ such that the stable and semistable loci are unchanged for every rational $theta' in U$.
    One may choose such a $theta'$ outside all proper hyperplanes $theta' dot.op upright(bold(b)) =
    0$ with $0 < upright(bold(b)) lt.eq upright(bold(v))$, and then clear its denominators by a positive integer.
    Empty loci are included.]
] <lem:local-stability>

#proof[
  We identify a positive multiple of a rational character with the same stability condition.
    Fix a maximal torus of $G$ and the finite set of its weights on $N xor N^(*)$.
    For a point $x$ and $g in G$, let $C \( g x \)$ be the cone generated by the weights occurring in $g x$.
    The affine Hilbert–Mumford criterion says that $x$ is semistable precisely when the character belongs to every
    such cone, and is stable with finite stabilizer precisely when it belongs to all their full interiors in the
    real weight space; see #cite(label("King94")) and #cite(label("Hoskins14")) Propositions 2.5 and 2.7.
    Although $g$ varies, only finitely many cones occur. A sufficiently small neighborhood of $theta$ remains
    inside each cone whose interior contains $theta$, and outside each cone that does not contain $theta$.
    A $theta$-stable point therefore remains stable, and a $theta$-unstable point remains unstable.
    Regularity accounts for all points of the closed subvariety $mu^(- 1) \( 0 \)$.
    This proves the assertion about the entire loci, including when they are empty.
    The geometric quotient and its principal gauge bundle are unchanged, as is freeness.
    Choose a rational point in this neighborhood avoiding the finitely many proper hyperplanes specified in the
    statement, and then rescale by a positive integer. If $G$ is trivial,
    its character space is a point and the list of bounded nonzero dimension vectors is empty,
    so the assertion is immediate. ◻
]

The Kirwan map $R arrow.r H_F^(*) \( X \)$ is surjective.
  For nonempty $X$, Lemma 5 permits a rational perturbation $theta$ of $nu$ that preserves the entire stable locus
  $D$ and avoids $theta dot.op upright(bold(b)) = 0$ for $0 < upright(bold(b)) lt.eq upright(bold(v))$.
  Its extension $\( theta \, - theta dot.op upright(bold(v)) \)$ is nondegenerate for the framed dimension vector
  $\( upright(bold(v)) \, 1 \)$: a proper subvector has final coordinate zero, or its nonzero complement does.
  Clearing denominators preserves stability. The quotient, its principal gauge bundle,
  and its tautological bundles are unchanged, so ordinary Kirwan surjectivity applies with the same coefficient
  map #cite(label("MN18")) Definition 3.1 and Theorem 1.2; see also #cite(label("DK25")) Section 2.1.
  The torus-equivariant conclusion is #cite(label("MN18")) Corollary 1.5;
  we recall its argument for an arbitrary commuting flavor torus.
  Choose a homogeneous basis of $H^(*) \( X \)$ represented by polynomials in the ordinary tautological Chern
  classes. These classes lift to $F$-equivariant Chern classes.
  Leray–Hirsch for $X arrow.r E F times_F X arrow.r B F$ therefore makes $H_F^(*) \( X \)$ free over
  $H_F^(*) \( upright("pt") \)$ on these lifts and proves the asserted equivariant surjectivity.
  In particular $H^(*) \( X \)$ is finite-dimensional and even.
  For empty $X$ the assertion means the unique surjection to the zero ring.

== 3 A finite correspondence test for Coulomb relations <sec:correspondences>

We work with the finite-dimensional algebraic group $sans(K) = G times F$.
  All homology in this section is equivariant Borel–Moore homology, with complex coefficients.
  We use constructible sheaves only on finite-dimensional varieties.
  The purpose of the section is to express a coefficient relation in the Coulomb algebra as a relation between
  such sheaves.

=== 3.1 Bounded lattice families <bounded-lattice-families>

A point $b = g G \( cal(O) \)$ of $"Gr"_G$ determines the lattice $g N \( cal(O) \)$ in $N \( cal(K) \)$.
  For a BFN triple $\[ g \, s_0 \]$, we use $n = g s_0$ as section coordinate;
  the fiber over $b$ is $N \( cal(O) \) ∩ g N \( cal(O) \)$.
  Let $B$ be a projective $sans(K)$-variety equipped with a $sans(K)$-equivariant map to $"Gr"_G$ with bounded
  image. The map need not be an embedding. For any finite collection of these families,
  choose $l$ large enough that all their lattices contain $t^l N \( cal(O) \)$ and are contained in $t^(- l)
  N \( cal(O) \)$. Set

#[#set math.equation(numbering: n => "(3.1)")
 $ L & = t^(- l) N \( cal(O) \) \/ t^l N \( cal(O) \) \, & E_b & = g N \( cal(O) \) \/ t^l N \( cal(O) \) \,\
S_B & = { \( b \, n \) in B times L : n in E_b } \, & f_B & : S_B arrow.r L . $ <eq:finite-lattice-space>]

Here and below the same notation is used for a lattice and for its pullback to a parameter space.
  The representation map $"Gr"_G arrow.r "Gr"_("GL" \( N \))$ identifies $S_B$ with the pullback of a tautological
  vector bundle on a finite Grassmannian. We work separately on components if its rank varies.
  If $chi_N = det \( N \|_G \)$, its rank on a component of degree $gamma in pi_1 \( G \)$ is

#[#set math.equation(numbering: n => "(3.2)")
 $ r_B = l dim N - chevron.l chi_N \, gamma chevron.r . $ <eq:lattice-rank>]

The incidence $S_B subset B times L$ is closed, so $f_B$ is proper.
  We write $S_(upright("pt")) = N \( cal(O) \) \/ t^l N \( cal(O) \)$ for the family at the identity lattice and
  $i = f_(upright("pt"))$. Put $r = l dim N$ and $cal(F)_B = R f_(B \, *) bb(C)_(S_B)$; in particular,
  $cal(F)_(upright("pt")) = i_(*) bb(C)_(S_(upright("pt")))$.

Let $Z$ be a finite union of affine Schubert varieties in the neutral component, containing the identity lattice.
  Restriction to that lattice gives a degree-zero morphism

#[#set math.equation(numbering: n => "(3.3)")
 $ rho_Z : cal(F)_Z arrow.r cal(F)_(upright("pt")) . $ <eq:restriction-at-identity>]

Both section bundles here have rank $r$. The base $Z$ is allowed to be singular.

The notation $"Hom"_(sans(K) \, L)^d \( cal(F) \, cal(G) \)$ denotes $"Hom" \( cal(F) \, cal(G) \[ d \] \)$ for
  $sans(K)$-equivariant constructible complexes on $L$, computed on the common Borel approximations used below.

#prodef([Lemma 3.1.])[
  (Finite correspondence factorization).  #emph[Let $u in R$ be homogeneous of cohomological degree $d$,
    and suppose that in $A_F$ it has an expression
#[#set math.equation(numbering: n => "(3.4)")
 $ u = sum_w M_(lambda_(w \, 1) \, p_(w \, 1)) dots.h.c M_(lambda_(w \, k_w) \, p_(w \, k_w)) \, wide k_w gt.eq
   1 \, wide sum_j \[ lambda_(w \, j) \] = 0 in pi_1 \( G \) . $ <eq:neutral-word-relation>]

 Every factor is a nontrivial dressed positive or negative minuscule generator of Proposition 3,
   and every word is homogeneous of degree $d$. Coefficients in $R$ may be included in the dressings.
   Choose an ordering of the factors of each word. There are $Z$ as above bounding their final lattices and a
   common truncation (3.1) such that
#[#set math.equation(numbering: n => "(3.5)")
 $ u rho_Z = sum_w Psi_w quad upright("in") quad "Hom"_(sans(K) \, L)^d \( cal(F)_Z \, cal(F)_(upright("pt")) \) .
   $ <eq:finite-relation-factorization>]

 Each $Psi_w$ factors through a cohomological shift of $cal(F)_("Gr"_G^(lambda_(w \, 1)))$.
   Only the endpoints are required to lie in $Z$ or in the neutral component;
   all intermediate lattices are included in the common truncation.]
] <lem:correspondence-factorization>

#proof[
  We first specify the correspondences and their degrees, then prove the identity by a faithful localization
    calculation.
  ===== 3.1.1 Correspondences and shifts. <correspondences-and-shifts.>
  For proper maps $f : X arrow.r L$ and $g : Y arrow.r L$, write $omega_Y$ for the complex-linear dualizing
    complex of $Y$. Proper base change and adjunction give
  $ R "Hom"_L \( R f_(*) bb(C)_X \, R g_(*) omega_Y \) tilde.eq R Gamma \( X times_L Y \, omega_(X times_L Y) \) . $
  For example, if $q : X times_L Y arrow.r Y$ is the projection,
    the left side is $R "Hom"_Y \( q_(*) bb(C)_(X times_L Y) \, omega_Y \)$,
    which gives the displayed identity by $q_(*) tack.l q^(!)$.
    Thus, when $Y$ is smooth of complex dimension $e$, we have
  #[#set math.equation(numbering: n => "(3.6)")
   $ "Hom"_(sans(K) \, L)^a \( R f_(*) bb(C)_X \, R g_(*) bb(C)_Y \) tilde.eq
     H_(2 e - a)^(sans(K)) \( X times_L Y \) . $ <eq:finite-correspondence-Hom>]
  The equivariant version follows on common Borel approximations; their additional dimensions cancel in the shift.
    These finite-type models have triangulable analytic topology and finite cohomological dimension.
    We use the proper-support base-change and adjunction formalism of #cite(label("SchnurerSoergel16"))
    Theorems 5.10 and 7.7, with complex coefficients, and the duality and Borel–Moore identifications of
    #cite(label("MaximSchurmann21")) Example 2.7(3) and Corollary 2.11.
    In particular, the source $X$ need not be smooth. Composition across a smooth middle space is refined
    intersection along its diagonal followed by proper pushforward.
    These operations are the adjunction and base-change operations in the displayed identification.
  Fix one word, temporarily suppressing its index $w$. Let $B_j$ be the variety of chains of lattices with
    successive relative positions $lambda_1 \, dots.h \, lambda_j$, starting at the identity.
    Set $B_0 = upright("pt")$. Each forgetful map $B_j arrow.r
    B_(j - 1)$ is a bundle with fiber the closed minuscule orbit $"Gr"_G^(lambda_j)$,
    so the $B_j$ are smooth and projective. Write
  $ a_j = dim "Gr"_G^(lambda_j) \, wide r_j = "rk" E_(b_j) \, wide I_j = { \( b_0 \, dots.h \, b_j \, n \) :
    n in E_(b_(j - 1)) ∩ E_(b_j) } . $
  The intersection has constant rank by fixed relative position.
    It defines a vector bundle on $B_j$ and a correspondence
  $ S_(B_j) med arrow.l.hook^(v_j) med I_j arrow.r^(u_j) S_(B_(j - 1)) $
  over $L$, where $v_j$ is the closed subbundle inclusion and $u_j$ forgets the last lattice.
    Write $c_j = "rk" \( E_(b_j) \/ I_j \)$, using the same symbol $I_j$ for the intersection bundle.
    The dressing $p_j$ gives an equivariant characteristic class on $B_j$:
    use the two tautological blocks of the minuscule modification in the preceding lattice frame,
    together with the flavor classes. This is the twisted-orbit version of the stabilizer-invariant dressing in (2.2).
  If $delta_j = deg p_j$, the class $p_j ∩ \[ I_j \]$ defines a morphism $cal(F)_(B_j) arrow.r
    cal(F)_(B_(j - 1)) \[ q_j \]$, where
  #[#set math.equation(numbering: n => "(3.7)")
   $ q_j = 2 \( r_(j - 1) - r_j + c_j - a_j \) + delta_j . $ <eq:chain-shift>]
  Indeed, $dim I_j = dim B_(j - 1) + a_j + r_j - c_j$, and (3.6) uses the target dimension $dim S_(B_(j - 1)) =
    dim B_(j - 1) + r_(j - 1)$. The endpoint map $B_k arrow.r Z$ induces a proper map $S_(B_k) arrow.r S_Z$.
    Its pullback morphism on constant sheaves, followed by pushforward to $L$, gives $cal(F)_Z arrow.r
    cal(F)_(B_k)$ with no shift. Compose it with the $k$ incidence morphisms to obtain $Psi_w$.
    This already gives the stated first-step factorization.
  At a modification of type $lambda_j$, $c_j = sum_beta \( - chevron.l beta \, lambda_j chevron.r \)_(+)$,
    with multiplicities and with the pairing taken on the gauge part.
    The rational coefficient in Equation (2.2) has degree $2 c_j - 2 a_j + delta_j$,
    counting linear forms with degree two. For the neutral word, the sum of these degrees is its BFN degree $d$,
    by Proposition 3. Moreover, Equation (3.2) gives $r_k = r_0 = r$. Consequently
  $ sum_j q_j = 2 \( r_0 - r_k \) + sum_j \( 2 c_j - 2 a_j + delta_j \) = d . $
  Thus $Psi_w$ and $u rho_Z$ belong to the same graded Hom space.
    No equality of intermediate ranks or identification of nonneutral degree conventions is used.
  ===== 3.1.2 Faithfulness of the localization test. <faithfulness-of-the-localization-test.>
  Put $C_Z = S_(upright("pt")) times_L S_Z$ and let $iota : C_Z arrow.r.hook S_Z$ be the inclusion.
    The identity (3.6), with smooth target $S_(upright("pt"))$,
    identifies the Hom space in (3.5) with $H_(2 r - d)^(sans(K)) \( C_Z \)$.
    Under it, $rho_Z$ is the fundamental class of $S_(upright("pt"))$ over the identity lattice.
  Let $P = H_(T times F)^(*) \( upright("pt") \)$. The stratification of $C_Z$ over the finitely many
    $G \( cal(O) \)$-orbits in $Z$ has vector-bundle strata. Each orbit is an affine-space bundle over a partial
    flag variety and contracts to it under loop scaling $t mapsto a t$ as $a arrow.r 0$.
    This contraction commutes with $T$, and $F$ acts trivially on the orbit.
    Its ordinary equivariant cohomology is therefore even and free over $P$;
    smooth equivariant Poincaré duality gives the same assertion for Borel–Moore homology, with a dimension shift.
    The section bundle adds an even Thom shift. The closed-stratum exact sequences split into short exact
    sequences by parity, and their free quotients make each extension free over $P$.
    It follows that $H_(*)^(T times F) \( C_Z \)$ is free, in particular torsion-free.
    This is the finite version of the orbit-filtration argument in #cite(label("BFN18")) Lemmas 2.5–2.6.
  The $T$-fixed lattices in $"Gr"_G$ are precisely the diagonal lattices $t^eta$:
    a fixed lattice in each $V_i \( cal(K) \)$ splits along its distinct diagonal characters,
    and a lattice in a one-dimensional Laurent series space is $t^m cal(O)$.
    At $t^eta$, every $\( T times F \)$-weight-zero summand of $N$ has gauge pairing zero with $eta$.
    Its lattice is unchanged by intersection with $N \( cal(O) \)$.
    Thus $iota$ identifies the fixed loci of $C_Z$ and $S_Z$.
    Equivariant localization makes $iota_(*)$ an isomorphism after tensoring with $"Frac" P$;
    torsion-freeness makes this localized pushforward a faithful test on $H_(*)^(T times F) \( C_Z \)$.
    Passing to Weyl invariants recovers $sans(K)$-equivariance.
    This is also the fixed-fiber calculation of #cite(label("BFN18")) Lemma 5.13.
  After localization, the classes of the entire section fibers $E_(t^eta)$ form a basis for the homology of $S_Z$,
    indexed by its fixed lattices. These classes, rather than isolated points in a fiber,
    allow weight-zero summands of $N$ without inverting a zero Euler class. We denote this basis formally by $e^eta$.
  ===== 3.1.3 The chain calculation. <the-chain-calculation.>
  For each partial chain put $C_j = S_(upright("pt")) times_L S_(B_j)$, and let $h_j :
    C_j arrow.r.hook S_(B_j)$ forget the initial section constraint.
    Let $z_j$ be the Borel–Moore class of the composite $cal(F)_(B_j) arrow.r
    cal(F)_(upright("pt")) \[ sum_(h = 1)^j q_h \]$ formed by the first $j$ incidence morphisms.
    Since $S_(B_j)$ is smooth, write $\( h_j \)_(*) z_j = alpha_j ∩ \[ S_(B_j) \]$. We claim that
  #[#set math.equation(numbering: n => "(3.8)")
   $ alpha_k = product_(j = 1)^k p_j thin "eu" \( E_(b_j) \/ I_j \) \, $ <eq:chain-euler-product>]
  with all factors pulled to $B_k$.
  The initial class has $alpha_0 = 1$. At the $j$th step, composition is refined intersection along the diagonal
    of the smooth middle space $S_(B_(j - 1))$. This intersection commutes with the proper pushforward that
    forgets the initial section constraint. We may therefore first replace $z_(j - 1)$ by $\( h_(j - 1) \)_(*)
    z_(j - 1) = alpha_(j - 1) ∩ \[ S_(B_(j - 1)) \]$. The remaining intersection pulls this cohomology class back
    to $I_j$, giving
  $ \( h_j \)_(*) z_j = \( v_j \)_(*) #scale(x: 120%, y: 120%)[\(] u_j^(*) alpha_(j - 1) thin p_j ∩ \[ I_j \]
    #scale(x: 120%, y: 120%)[\)] . $
  Here the regular diagonal belongs to the smooth middle space; no smoothness of $u_j$ is needed.
    The classes $alpha_(j - 1)$ are pulled from the chain bases,
    and the subbundle inclusion $v_j$ multiplies by $"eu" \( E_(b_j) \/ I_j \)$. This proves (3.8) by induction.
  Under the same Hom–Borel–Moore identification, precomposition with the unit for the proper endpoint map $S_(B_k)
    arrow.r S_Z$ is proper pushforward along $C_k arrow.r C_Z$.
    Forgetting the initial section constraint commutes with this pushforward.
    Thus the endpoint pushforward of $alpha_k ∩ \[ S_(B_k) \]$ is exactly the image of $Psi_w$ in the localization test.
  Fixed chains are sequences of Weyl translates $lambda'_j$ of the chosen minuscule coweights;
    their successive lattices are $t^(eta_j)$ with $eta_j = sum_(h lt.eq j) lambda'_h$.
    At such a chain the $j$th modification is translated by $t^(eta_(j - 1))$.
    This translation commutes with the diagonal torus. There is no loop rotation,
    so it changes neither the relevant weights nor the dressing values. Hence its quotient Euler class is
  $ product_beta beta^(\( - chevron.l beta \, lambda'_j chevron.r \)_(+)) \, $
  and its relative tangent Euler class is $"eu"_T \( T_(t^(lambda'_j)) "Gr"_G^(lambda_j) \)$.
    Localization on the smooth chain base therefore sends (3.8), after endpoint pushforward, to
  $ sum_(\( lambda'_1 \, dots.h \, lambda'_k \)) e^(lambda'_1 + dots.h.c + lambda'_k) product_(j = 1)^k
    (p_(j \, lambda'_j) frac(product_beta beta^(\( - chevron.l beta \, lambda'_j chevron.r \)_(+)), "eu"_T \(
    T_(t^(lambda'_j)) "Gr"_G^(lambda_j) \))) . $
  This is exactly the product of the expressions (2.2) for the word.
    All dressings are transported with their coweights. The fiber ranks at the endpoint equal $r$,
    so no additional fiber factor enters endpoint pushforward.
  The localized pushforward of $u rho_Z$ is $u e^0$. Equation (3.4) and the abelianization of Proposition 3
    identify it with the sum of the displayed word expressions.
    The faithful test just proved implies the equality in $H_(2 r - d)^(sans(K)) \( C_Z \)$ and hence (3.5). ◻
]

#prodef([Remark 3.2.])[
  Every $u in ker \( R arrow.r B_F \)$ admits an expression of the form (3.4), degree by degree.
    Indeed, Proposition 3 implies that the ideal of all nonzero topological degrees is generated by the nontrivial
    positive and negative minuscule generators. Expand a relation in that ideal and retain its neutral component.
    Commutativity of $A_F$ permits any desired ordering of the factors before applying Lemma 6.
]

The relation has now been transferred to a finite-dimensional category,
  with the identity-lattice map on one side and first-step factorizations on the other.
  The stable-pair test in Section 4 will annihilate the selected first-step objects while keeping a split
  restriction from the identity-lattice test onto cohomology.

== 4 Testing coefficient relations by stable pairs <sec:stable-pairs>

We use the finite-dimensional correspondences of Section 3 to prove

#prodef([Proposition 4.1.])[
  #emph[For every datum and regular stability in Theorem 1, the coefficient map induces a graded $R$-algebra surjection
#[#set math.equation(numbering: n => "(4.1)")
 $ B_F arrow.r.twohead H_F^(*) \( X \) . $ <eq:stable-pair-surjection>]

]
] <prop:kernel-inclusion>

Throughout this section, $sans(K) = G times F$. We retain the notation $L$, $E_b$, $S_B$, $f_B$, $i =
  f_(upright("pt"))$, and $rho_Z$ from Lemma 6. All cohomology in the test below is ordinary equivariant cohomology.

=== 4.1 A degree constraint on global stable pairs <a-degree-constraint-on-global-stable-pairs>

We first record the geometric consequence of stability that will exclude the first lattice of each word.
  For a principal $G$-bundle $cal(P)$ on $bb(P)^1$, write $cal(L)_nu$ for its character line bundle,
  with the convention that evaluating a $nu^m$-semi-invariant on a section of an associated representation gives a
  section of $cal(L)_nu^(⊗ m)$. Its degree is a linear function of the topological class of $cal(P)$.

#prodef([Lemma 4.2.])[
  #emph[Let $cal(P)$ be a principal $G$-bundle on $bb(P)^1$, equipped with a frame at infinity,
    and let $sigma$ be a global section of $cal(P) times_G \( T^(*) N \)$.
    Suppose that its value $sigma_oo$ in this frame is $nu$-stable and has trivial stabilizer.
    Then $deg cal(L)_nu gt.eq 0$. If $deg cal(L)_nu = 0$, the pair $\( cal(P) \, sigma \)$ has a unique
    trivialization, agreeing with the given frame at infinity, in which $sigma$ is the constant section $sigma_oo$.]
  #emph[In particular, suppose that $cal(P)$ is specified by a lattice $b in "Gr"_G$,
    with its usual trivialization on $bb(P)^1 \\ { 0 }$. In the degree-zero case its topological class is zero and
#[#set math.equation(numbering: n => "(4.2)")
 $ b = h G \( cal(O) \) \, wide h in G \( bb(C) \[ t^(- 1) \] \) \, wide h \( oo \) =
   1 . $ <eq:based-loop-trivialization>]

 In the off-zero frame, the section is $h sigma_oo$.]
] <lem:stable-section-degree>

#proof[
  Choose a $nu^m$-semi-invariant $f$, with $m > 0$, that is nonzero at $sigma_oo$.
    Its evaluation on $sigma$ is a global section of a positive power of $cal(L)_nu$, nonzero at infinity.
    This proves nonnegativity of the degree.
  If the degree is zero, this section is nowhere zero. Thus $sigma$ is everywhere semistable and determines a morphism
  $ gamma : bb(P)^1 arrow.r \( T^(*) N \) \/ #h(-0.16667em) \/_nu G . $
  Every invariant polynomial evaluated on $sigma$ is a regular function on $bb(P)^1$, hence constant.
    The image of $gamma$ therefore lies in one fiber of the projective morphism to the affine quotient
    $\( T^(*) N \) \/ #h(-0.16667em) \/ G$. A sufficiently divisible GIT polarization is relatively ample and
    pulls back to a positive power of $cal(L)_nu$. Its degree is zero, so $gamma$ is constant:
    an ample line bundle has positive degree on the image of a nonconstant morphism from $bb(P)^1$.
    These are the usual character-linearized affine GIT constructions; see #cite(label("King94")) Section 2.
  The constant value is the stable quotient point represented by $sigma_oo$.
    Its fiber in the semistable locus is the single orbit $G sigma_oo$.
    Consequently $sigma$ is a section of the associated orbit bundle $cal(P) times_G \( G sigma_oo \)$.
    Since $G sigma_oo tilde.eq G$ equivariantly, this section trivializes $cal(P)$.
    Freeness makes the trivialization unique once the coordinates of the section are prescribed to be $sigma_oo$;
    it agrees with the specified frame at infinity.
  In the lattice presentation, compare this global trivialization with the fixed trivialization off zero.
    Their transition is a regular map $bb(A)_(t^(- 1))^1 arrow.r G$ equal to $1$ at infinity.
    It is the loop $h$ in (4.2), and the lattice of regular sections at zero is $h G \( cal(O) \)$. ◻
]

Every point of $D = mu^(- 1) \( 0 \)^(nu upright("-stable"))$ is stable with trivial stabilizer also in the
  ambient representation $T^(*) N$. Indeed, for a closed invariant subvariety,
  semi-invariants lift by exactness of reductive invariants, and orbit closures stay in that subvariety.
  The affine GIT stability criterion therefore agrees with its ambient restriction.
  Lemma 9 applies to the #emph[pair] $\( s \, p \) in D$.

=== 4.2 The finite vanishing-cycle test <the-finite-vanishing-cycle-test>

For the truncation parameter $l$ of Lemma 6, put

$ L_(-) = xor.big_(j = - l)^(- 1) t^j N \, wide L_(+) = xor.big_(j = 0)^(l - 1) t^j N \, wide P_(-) =
  xor.big_(j = - l)^(- 1) t^j N^(*) . $

Thus $L = L_(-) xor L_(+)$, and the residue pairing identifies $P_(-)$ with $L_(+)^(*)$.
  Regard $s in N$ and $p in N^(*)$ as constant series. On $tilde(L) = L times D times
  P_(-)$ define the $sans(K)$-invariant function

#[#set math.equation(numbering: n => "(4.3)")
 $ W \( n \, s \, p \, y \) = "Res" #scale(x: 120%, y: 120%)[\(] chevron.l p + y \, n chevron.r - chevron.l y \,
   s chevron.r #scale(x: 120%, y: 120%)[\)] \, wide \( s \, p \) in D . $ <eq:stable-test-function>]

After restricting $n$ to a moving lattice, variation in $y$ imposes the prescribed nonnegative modes $"pr"_(L_(+))
  n = s$, while variation in $n$ imposes dual-lattice membership for $p + y$.
  These are the extension conditions for the two components of the stable pair across the lattice modification.
  The residue is the coefficient of $t^(- 1)$; the expression is well-defined on the truncated spaces.

Use the shifted vanishing-cycle functor $Phi_f = phi.alt_f \[ - 1 \]$, normalized so that $Phi_0$ is the identity.
  Vanishing cycles will be regarded as complexes on the ambient space by closed direct image from the zero fiber.
  The test of a complex $cal(F)$ on $L$ is

#[#set math.equation(numbering: n => "(4.4)")
 $ sans(T) \( cal(F) \) = R Gamma_(sans(K)) #h(-0.16667em) (tilde(L) \, thin Phi_W thin "pr"_L^(*) cal(F)) .
   $ <eq:stable-test-functor>]

For a bounded projective lattice family $B$, set $M_B = S_B times D times P_(-)$,
  and let $W_B$ be the pullback of $W$. Proper base change and compatibility of vanishing cycles with proper
  direct image give

#[#set math.equation(numbering: n => "(4.5)")
 $ sans(T) \( f_(B \, *) bb(C)_(S_B) \) tilde.eq R Gamma_(sans(K)) \( M_B \, Phi_(W_B) bb(C)_(M_B) \) .
   $ <eq:stable-test-proper>]

Here proper-direct-image compatibility is #cite(label("MaximSchurmann21")) Proposition 4.19(1);
  the smooth projection pullback uses part (2). The same operations in the critical-cohomology setting are
  recalled in #cite(label("BottaTamagni26")) Appendix A.1.

The test is $R$-linear. To see this precisely, work on a finite Borel approximation with base $B sans(K)$.
  A coefficient class $u$ is a morphism $bb(C)_(B sans(K)) arrow.r bb(C)_(B sans(K)) \[ deg u \]$,
  pulled back to each space. The projection formula makes proper direct image compatible with this action
  #cite(label("SchnurerSoergel16")) Theorem 6.3. Nearby cycles commute naturally with tensoring by a locally
  constant complex pulled back from the base; taking the specialization cone gives the same assertion for
  vanishing cycles. Naturality with respect to the morphism representing $u$ therefore identifies its tested
  action with cup product by the restricted class. Passing to sufficiently large approximations proves the
  assertion for $R = H_(sans(K))^(*) \( upright("pt") \)$.

#prodef([Lemma 4.3.])[
  #emph[The support of $Phi_(W_B) bb(C)_(M_B)$ is contained in the closed locus $Sigma_B$ defined by
#[#set math.equation(numbering: n => "(4.6)")
 $ n in s + L_(-) \, wide p + y in g N^(*) \( cal(O) \) \/ t^l N^(*) \( cal(O) \) \, wide b =
   g G \( cal(O) \) . $ <eq:stable-critical-equations>]

 Here $n in E_b$ is already part of the definition of $M_B$.
   If $B$ lies in a nonzero topological component whose character-line degree is nonpositive,
   then $Sigma_B$ is empty and the test in (4.5) is zero.]
] <lem:stable-test-support>

#proof[
  Differentiating in $y$ gives $"pr"_(L_(+)) n = s$. Differentiating in the section variable $n in
    E_b$ says that $p + y$ annihilates $E_b$ in the residue pairing.
    The annihilator is the displayed truncated dual lattice. These conditions are zeros of algebraic bundle maps
    and hence define a closed locus.
  This derivative calculation gives a support bound even when $B$ is singular.
    Off $Sigma_B$, a derivative in one of the vector-bundle fiber coordinates is nonzero.
    The function is affine linear in that coordinate; where its coefficient is invertible,
    replacing the coordinate by $W_B$ gives a product chart over the unchanged base.
    The constant sheaf has zero vanishing cycles in this chart.
  A bounded lattice in each general linear factor specifies a modification of the trivial vector bundle at zero,
    determined by finite jets. A point of $Sigma_B$ gives two global sections on $bb(P)^1$ for the resulting
    principal bundle. In the off-zero frame they are the polynomials $n$ and $p + y$ in $t^(- 1)$,
    with values $s$ and $p$ at infinity. The lattice conditions are exactly their extendability at zero:
    the discarded $t^l$ tails already lie in the corresponding lattices.
    Their value at infinity is the stable pair $\( s \, p \)$.
    Lemma 9 now excludes negative character-line degree and, in degree zero,
    forces the entire topological class to be zero. This proves the last assertion. ◻
]

=== 4.3 The neutral component and its quadratic normal form <the-neutral-component-and-its-quadratic-normal-form>

Let $Z$ be the neutral projective Schubert union used in Lemma 6, containing the base lattice $1$.
  Set $r = l dim N$. Since the index of the associated representation lattice factors through $pi_1 \( G \)$,
  the bundles $E_b$ have rank $r$ on $Z$. Define the invariant open subset

#[#set math.equation(numbering: n => "(4.7)")
 $ U = { b in Z : "pr"_(L_(+)) : E_b arrow.r^tilde.op L_(+) } . $ <eq:stable-test-open>]

It contains $1$.

#prodef([Lemma 4.4.])[
  #emph[Assume $D eq.not diameter$. The locus $Sigma_Z$ is a closed graph $Gamma tilde.eq U times D$ in $M_Z$.
    There are compatible $sans(K)$-equivariant identifications
#[#set math.equation(numbering: n => "(4.8)")
 $ Phi_(W_Z) bb(C)_(M_Z) tilde.eq iota_(Gamma \, *) bb(C)_Gamma \[ - 2 r \] \, wide
   Phi_(W_(upright("pt"))) bb(C)_(M_(upright("pt"))) tilde.eq iota_(D \, *) bb(C)_D \[ - 2 r \] .
   $ <eq:quadratic-vanishing-cycles>]

 Under these identifications, the test of $rho_Z$ induces ordinary restriction
#[#set math.equation(numbering: n => "(4.9)")
 $ H_(sans(K))^(*) \( U times D \) arrow.r H_(sans(K))^(*) \( D \) $ <eq:quadratic-restriction>]

 with the same uniform shift on source and target. This map is split surjective and $R$-linear.]
] <lem:quadratic-test>

#proof[
  First, every point of $Sigma_Z$ lies over $U$. By Lemma 9, its principal bundle is trivial,
    with a based loop $h$ as in (4.2). A vector in the kernel of $E_b arrow.r
    L_(+)$ is a negative polynomial section of its associated $N$-bundle,
    extending at zero and vanishing at infinity. That associated bundle is trivial, so the vector is zero.
    The two spaces have dimension $r$, and the projection is an isomorphism.
  Over $U$, write $E_b$ as the graph of a regular linear map $A_b : L_(+) arrow.r L_(-)$.
    Thus $n = a + A_b a$ for $a in L_(+)$. Define the linear functional
  $ ell_(b \, p) \( a \) = "Res" chevron.l p \, A_b a chevron.r . $
  Via $P_(-) = L_(+)^(*)$, Equation (4.3) becomes
  #[#set math.equation(numbering: n => "(4.10)")
   $ W_Z = chevron.l y \, a - s chevron.r + ell_(b \, p) \( a \) . $ <eq:stable-quadratic-coordinates>]
  Its fiber critical equations have the unique solution $a = s$, $y = - ell_(b \, p)$,
    depending regularly on $\( b \, s \, p \)$. Consequently $Sigma_Z$ is the graph $Gamma tilde.eq U times D$.
    It is closed in all of $M_Z$ because the equations defining $Sigma_Z$ are closed and every solution has
    already been shown to lie over $U$.
  It remains to compute the critical value. Apply Lemma 9 to this solution. In the off-zero frame,
  $ n = h s \, wide p + y = h p . $
  Invariance of the pairing gives $chevron.l h p \, h s chevron.r = chevron.l p \, s chevron.r$,
    a constant series. Hence
  $ W_(upright("crit")) = - chevron.l \[ t^(- 1) \] \( h p \) \, s chevron.r . $
  Write $h = 1 + xi t^(- 1) + O \( t^(- 2) \)$, where $xi in frak(g)$.
    The coefficient $\[ t^(- 1) \] \( h p \)$ is the infinitesimal dual action $xi dot.op p$. Therefore
  #[#set math.equation(numbering: n => "(4.11)")
   $ W_(upright("crit")) = - chevron.l xi dot.op p \, s chevron.r = chevron.l p \, xi dot.op s chevron.r =
     chevron.l mu \( s \, p \) \, xi chevron.r = 0 . $ <eq:stable-critical-value>]
  Thus the regular, equivariant translations $a' = a - s$, $y' = y + ell_(b \, p)$ turn (4.10) into the fixed split form
  $ W_Z = chevron.l y' \, a' chevron.r $
  over $U times D$.
  The vanishing cycles of this form on $L_(+) xor L_(+)^(*)$ are one copy of $bb(C) \[ - 2 r \]$ at the origin.
    The external-product theorem applies to the constant sheaf of $U times
    D$ even if $U$ is singular #cite(label("Massey99")) Theorem, pp. 1–2 of the arXiv preprint.
    The splitting is global and equivariant. Its structure group acts as $g xor g^(- T)$,
    so the quadratic vanishing-cycle line has trivial equivariant monodromy.
    Choosing its identification with $bb(C)$ once gives compatible identifications over the whole base.
  Lemma 10 says that the vanishing cycles are zero off the closed graph $Gamma$.
    The product calculation therefore gives the first isomorphism in (4.8) on all of $M_Z$.
    In particular, there are no further cycles over $Z \\ U$:
    every point there fails at least one of the fiber equations.
    The same computation at $1$ has $A_1 = 0$, $ell_(1 \, p) = 0$, and the same $2 r$ quadratic variables,
    giving the second isomorphism.
  The map $rho_Z$ is restriction to the base lattice. To identify its test as a morphism,
    not just its source and target, put $B = U times D$ and consider the maps
  $ D arrow.r^(thin j thin) U times D arrow.r^(thin pi thin) D \, wide j \( d \) = \( 1 \, d \) \, quad
    pi \( b \, d \) = d . $
  These maps are $sans(K)$-equivariant and satisfy $pi j = upright("id")$.
    Their ordinary cohomological pullbacks satisfy $j^(*) pi^(*) = upright("id")$.
    On the same base $B$, apply the natural external-product identification to the morphism $bb(C)_B arrow.r
    R j_(*) bb(C)_D$, with zero function on $B$ and the fixed split quadratic on $L_(+) xor L_(+)^(*)$.
    Since $j$ is closed, proper-direct-image compatibility identifies the target with the quadratic calculation
    over $D$. One common choice of generator of the quadratic line then identifies the resulting morphism with
    $bb(C)_B \[ - 2 r \] arrow.r R j_(*) bb(C)_D \[ - 2 r \]$.
    Taking ordinary equivariant cohomology gives exactly Equation (4.9).
    This uses naturality in a sheaf morphism and proper direct image,
    not commutation with an arbitrary nonsmooth pullback. The identity $j^(*) pi^(*) =
    upright("id")$ supplies the $R$-linear splitting, without any properness requirement on $pi$. ◻
]

#proof[
  The assertion is immediate if $D = diameter$, so assume $D$ is nonempty.
    Let $u in R$ be homogeneous and zero in $B_F$. Proposition 3 expresses $u$ in $A_F$ as a finite sum of
    positive-length words in nontrivial dressed positive and negative minuscule generators,
    with coefficients absorbed into the dressings. Taking the full topological-degree-zero part,
    every word has total topological degree zero.
  The character-line degrees of its steps sum to zero. Choose a step with nonpositive character-line degree and,
    by commutativity, put it first. Its topological degree is nonzero.
    Apply Lemma 6, with a common neutral endpoint bound $Z$. The morphism $u rho_Z$ is a sum of compositions,
    each factoring through the first-step object $f_(B \, *) bb(C)_(S_B)$, with the prescribed shifts.
    By Lemma 10, the test of every such object is zero. It follows that
  $ sans(T) \( u rho_Z \) = 0 . $
  The degree calculation in Lemma 6 identifies the degree of this morphism with $deg u$,
    including when intermediate lattice components are nonneutral.
    The test commutes with shifts, and Lemma 11 places the same quadratic shift on its source and target.
    Its $R$-linearity therefore gives the equality of graded maps
  $ \( u \|_D \) smile j^(*) = 0 . $
  Apply this equality to $pi^(*) \( 1 \)$. Since $j^(*) pi^(*) \( 1 \) = 1$, we obtain $u \|_D =
    0$ in $H_(sans(K))^(*) \( D \)$.
  The free stable-locus action identifies $H_(sans(K))^(*) \( D \) = H_F^(*) \( X \)$,
    compatibly with the coefficient map. We have proved
  $ ker \( R arrow.r B_F \) subset.eq ker \( R arrow.r H_F^(*) \( X \) \) . $
  Both rings are generated by their coefficient images. For $B_F$ this follows from Proposition 3;
    for $H_F^(*) \( X \)$ it follows from Kirwan surjectivity #cite(label("MN18")) and its equivariant extension
    recalled above. The displayed inclusion induces the graded $R$-algebra surjection (4.1). ◻
]

== 5 A Laurent model and a filtration by multipartitions <sec:laurent>

To complement the surjection of Proposition 8, we seek an upper bound for the Hilbert series of $B_0$.
  One loop at each vertex cancels the minuscule tangent denominators, giving a Laurent model for this calculation.

Throughout this Section the flavor torus is trivial, and the quiver has at least one loop at every vertex of
  positive gauge dimension. Delete the vertices of gauge dimension zero,
  and choose one loop at every remaining vertex. Let $Q'$ be the quiver obtained by deleting these chosen loops. Write

$ n_(i j) = \# Q'_1 \( i \, j \) \, wide c_(i j) = n_(i j) + n_(j i) \, wide C \( upright(bold(v)) \) = 1 /
  2 sum_(i \, j) c_(i j) v_i v_j . $

In particular, $c_(i i) = 2 n_(i i)$. We use the set

$ Omega = { \( i \, a \) : i in Q_0 \, med 1 lt.eq a lt.eq v_i } $

of gauge slots, the polynomial ring $P = bb(C) \[ x_(i a) : \( i \, a \) in Omega \]$, and $cal(W) =
  product_i S_(v_i)$. Let $cal(B)'$ be the multiset consisting of the weights $x_(j b) -
  x_(i a)$ of all arrows of $Q'$ and $w_i$ copies of $- x_(i a)$ at each gauge slot.
  The zero weights arising from diagonal entries of loops can be omitted: their coweight pairing is always zero.

For $lambda in bb(Z)^Omega$, put

$ E_beta \( lambda \) = #scale(x: 120%, y: 120%)[\(] - chevron.l beta \,
  lambda chevron.r #scale(x: 120%, y: 120%)[\)]_(+) \, wide r_lambda =
  e^lambda product_(beta in cal(B)') beta^(E_beta \( lambda \)) \, $

where $u_(+) = max \( u \, 0 \)$ and $e^lambda e^gamma = e^(lambda + gamma)$.
  These expressions belong to $bb(C) \( x_(i a) \) \[ bb(Z)^Omega \]$.
  For a polynomial $p in P^(cal(W)_lambda)$, with $cal(W)_lambda = "Stab"_(cal(W)) \( lambda \)$,
  denote the distinct-translate orbit sum by

$ sans(S)_lambda \( p \) = sum_(w in cal(W) \/ cal(W)_lambda) w \( p r_lambda \) . $

The choice of representative of the coweight orbit does not affect the space of such sums.

#prodef([Proposition 5.1.])[
  #emph[Under the abelianization embedding of Proposition 3, the no-flavor Coulomb algebra is
#[#set math.equation(numbering: n => "(5.1)")
 $ A_0 = (xor.big_(lambda in bb(Z)^Omega) P r_lambda)^(cal(W)) . $ <eq:laurent-model>]

 The identification preserves the coefficient ring $R_0 = P^(cal(W))$ and the topological grading.]
] <prop:laurent-model>

#proof[
  First, the direct sum on the right is an algebra. Indeed,
  #[#set math.equation(numbering: n => "(5.2)")
   $ r_alpha r_gamma = r_(alpha + gamma) product_(beta in cal(B)')
     beta^(E_beta \( alpha \) + E_beta \( gamma \) - E_beta \( alpha + gamma \)) \, $ <eq:laurent-product>]
  and every exponent is nonnegative. The multiset $cal(B)'$ is $cal(W)$-stable, so taking invariants gives a subalgebra.
  For a positive or negative subset coweight, the weights of the deleted loop at a vertex cancel the tangent Euler
    denominator in Equation (2.2), up to a nonzero constant sign.
    This is the Grassmannian tangent-weight calculation: for a positive subset $I$,
    the loop contributes $product_(a in I \, med b in.not I) \( x_(i b) - x_(i a) \)$,
    while the tangent weights are these roots, up to their common sign convention.
    For a negative subset the roots are reversed. This is the local Euler-factor calculation associated with
    minuscule flag localization; compare the pushforward identity in #cite(label("Weekes19")) Lemma 2.10.
    Proposition 3 therefore places every generator of $A_0$ in the right-hand side of Equation (5.1).
    Conversely, it places every $sans(S)_alpha \( p \)$ for a positive or negative subset coweight $alpha$ in
    $A_0$, since a constant sign can be removed.
  We prove that all the orbit sums $sans(S)_lambda \( p \)$ belong to $A_0$ by strong induction on
  $ parallel lambda parallel^2 = sum_(\( i \, a \) in Omega) lambda_(i a)^2 . $
  The coefficient and positive or negative subset-coweight cases have just been established.
    If $lambda$ has a positive coordinate, set
  $ f \( t \) = 1_(t > 0) \, wide g \( t \) = t - 1_(t > 0) \; $
  otherwise set
  $ f \( t \) = - 1_(t < 0) \, wide g \( t \) = t + 1_(t < 0) . $
  In either case define $alpha = f \( lambda \)$ and $gamma = g \( lambda \)$ coordinatewise.
    Outside the base cases both $alpha$ and $gamma$ have squared norm strictly smaller than that of $lambda$.
    Both functions are nondecreasing on $bb(Z)$, and their values have compatible signs relative to zero.
    Thus, for every pair of slots $d \, e$ and every slot $d$,
  $ \( alpha_d - alpha_e \) \( gamma_d - gamma_e \) gt.eq 0 \, wide alpha_d gamma_d gt.eq 0 . $
  These statements apply across different colors as well. Consequently every exponent in Equation (5.2) is zero
    for this pair, and $r_alpha r_gamma = r_lambda$.
  Order the slots at each vertex by their $lambda$-coordinates.
    Then $alpha$ and $gamma$ are ordered in the same way. The rearrangement inequality gives,
    for every relative matching $w in cal(W)$,
  $ parallel alpha + w gamma parallel^2 lt.eq parallel alpha + gamma parallel^2 = parallel lambda parallel^2 . $
  In the equality case, the resulting sum lies in the orbit of $lambda$.
    To see the last assertion directly, sort the matched entries within each color.
    Swapping an inverted pair strictly increases the scalar product unless one of the two corresponding pairs is
    tied; swaps involving ties leave the multiset of sums unchanged.
    Hence every maximal matching has the same multiset of sums as the ordered matching.
    All other orbits occurring in a product $sans(S)_alpha \( p_alpha \)
    sans(S)_gamma \( p_gamma \)$ therefore have strictly smaller squared norm.
  We now verify that the leading coefficient can be an arbitrary $cal(W)_lambda$-invariant dressing.
    At the fixed representative $lambda$, the decomposition into translates of $alpha$ and $gamma$ is unique.
    For example, in the positive case, a different assignment of the $1$-entries of $alpha$ would assign $1$ to
    some coordinate $lambda_d lt.eq 0$ and $0$ to some coordinate $lambda_e > 0$ of the same color.
    The corresponding $gamma$-entries would satisfy $gamma'_d = lambda_d - 1 < lambda_e = gamma'_e$,
    which is a strict inversion relative to $alpha'$. This contradicts maximality.
    The negative case would similarly assign $0$ to a negative coordinate $lambda_d$ and $-
    1$ to a nonnegative coordinate $lambda_e$ of the same color; then $gamma'_d = lambda_d < lambda_e + 1 =
    gamma'_e$ is again a strict inversion relative to $alpha'$.
    Thus the coefficient of $r_lambda$ in that product is precisely $p_alpha p_gamma$.
  Within each color, the level blocks of $alpha$ and $gamma$ are intervals in the chosen ordering.
    Their combined cuts are exactly the cuts of the level blocks of $lambda$:
    two distinct values cannot have both the same $f$-value and the same $g$-value, since $f \( t \) + g \( t \) =
    t$. For every $k gt.eq 1$, the power sum on each $lambda$-block is therefore a linear combination of power
    sums on $alpha$-blocks and $gamma$-blocks. Explicitly, obtain prefix power sums at all cuts from whichever
    block partition contains the cut, and subtract successive prefixes.
    Power sums generate each symmetric-polynomial ring over $bb(C)$, so
  $ P^(cal(W)_lambda) = chevron.l P^(cal(W)_alpha) \, P^(cal(W)_gamma) #scale(x: 120%, y: 120%)[chevron.r] . $
  As the rings commute, every element of the ring on the right is a finite sum of products $p_alpha
    p_gamma$ from the two indicated subrings. Such products of dressed orbit sums realize any prescribed leading
    dressing. The other terms have polynomial dressings by Equation (5.2);
    their dressings are invariant under the stabilizers of their coweights because the full product is
    $cal(W)$-invariant. The induction hypothesis removes all those lower terms.
    This proves the reverse inclusion, without inverting any polynomial, and completes the proof. ◻
]

=== 5.1 Multipartitions and cut ideals <multipartitions-and-cut-ideals>

For the rest of this Section, $q$ records half the cohomological degree:
  each polynomial variable has cohomological degree two and contributes $q$.
  Thus $"Hilb" \( M \; q \) = sum_d dim \( M^(2 d) \) q^d$ for the evenly graded vector spaces under consideration.

Let $cal(M) \( upright(bold(v)) \)$ be the finite set of arrays

$ m = \( m_(i \, s) \)_(i in Q_0 \, med s gt.eq 1) \, wide m_(i \, s) in bb(Z)_(gt.eq 0) \, wide
  sum_(s gt.eq 1) s m_(i \, s) = v_i . $

For $m in cal(M) \( upright(bold(v)) \)$, set

$ l_i = sum_(s gt.eq 1) m_(i \, s) \, wide upright(bold(l)) = \( l_i \)_i \, wide \| l \| = sum_i l_i \, $

and

$ D_m = 1 / 2 sum_(i \, j) sum_(s \, t gt.eq 1) c_(i j) min \( s \, t \) m_(i \, s) m_(j \, t) . $

Let $Omega_m^(+)$ consist of $m_(i \, s)$ distinguished copies of each type $\( i \, s \)$.
  These are the #emph[positive slots]. For $d in Omega_m^(+)$ denote its color by $i \( d \)$ and its size by
  $s \( d \)$. Define

$ P_m = bb(C) \[ x_d : d in Omega_m^(+) \] \, wide cal(W)_m = product_(i \, s) S_(m_(i \, s)) \, wide b_(d e) =
  c_(i \( d \) i \( e \)) min \( s \( d \) \, s \( e \) \) . $

The group $cal(W)_m$ permutes copies of the same type. For every nonempty subset $S subset.eq Omega_m^(+)$, put

#[#set math.equation(numbering: n => "(5.3)")
 $ q_S = product_(d in S) x_d^(w_(i \( d \))) product_(d in S\
e in Omega_m^(+) \\ S) \( x_d - x_e \)^(b_(d e)) . $ <eq:cut-polynomial>]

Let $J_m subset.eq P_m$ be the ideal generated by these cut polynomials, and set

$ h_m \( q \) = "Hilb" #scale(x: 120%, y: 120%)[\(] \( P_m \/ J_m \)^(cal(W)_m) \; q #scale(x: 120%, y: 120%)[\)] . $

The ideal is homogeneous and $cal(W)_m$-stable. For the empty array, these conventions give $P_m = bb(C)$, $J_m =
  0$, and $h_m \( q \) = 1$.

These cut products have a familiar graphical interpretation.
  Adjoin a framing vertex $0$, put $w_(i \( d \))$ edges between $0$ and each positive slot $d$,
  and put $b_(d e)$ edges between each unordered pair of distinct slots $d \, e$.
  When this multigraph is connected, $J_m$ is the cocircuit ideal of its reduced incidence configuration,
  with the row for $0$ deleted. A minimal disconnecting cut contributes the product of its edge forms,
  $x_d$ for framing edges and $x_d - x_e$ for slot edges; every cut product is divisible by a minimal-cut product.
  Such ideals occur in toric hyperkähler cohomology #cite(label("HauselSturmfels02")) Section 7,
  Equation (37) and in permutation-invariant quiver constructions #cite(label("ReinekeRhoadesTewari23"))
  Sections 2 and 4.4. A component disjoint from $0$ instead gives a unit cut and zero quotient.
  Section 6 gives a direct reachability calculation that retains the $cal(W)_m$-action and yields the recurrence
  needed here.

#prodef([Proposition 5.2.])[
  #emph[The quotient $B_0$ for the full topological torus satisfies the coefficientwise graded bound
#[#set math.equation(numbering: n => "(5.4)")
 $ "Hilb" \( B_0 \; q \) med lt.eq sum_(m in cal(M) \( upright(bold(v)) \))
   q^(C \( upright(bold(v)) \) - D_m + upright(bold(w)) dot.op \( upright(bold(v)) - upright(bold(l)) \))
   h_m \( q \) . $ <eq:filtration-bound>]

 Every exponent displayed in the sum is a nonnegative integer.]
] <prop:filtration-bound>

#proof[
  Choose, for each color, an identification of its $l_i$ positive slots with $l_i$ of its $v_i$ gauge slots.
    On the remaining $v_i - l_i$ slots put $s \( d \) = 0$; call these the #emph[zero slots] and write their set
    as $Omega_m^0$. Define a coweight by
  $ \( lambda_m \)_d = s \( d \) - 1 wide \( d in Omega \) . $
  The word “positive” refers to the part size, so at a rank-three vertex the sizes $\( 2 \, 1 \, 0 \)$ give the
    coweight $\( 1 \, 0 \, - 1 \)$. The coweight $lambda_m$ has topological degree zero,
    since the sum of its coordinates at vertex $i$ is $sum_s s m_(i \, s) - v_i = 0$. Its stabilizer is
  $ cal(W)_(lambda_m) = cal(W)_m times product_i S_(v_i - l_i) . $
  The last factors permute the zero slots.
  By the degree convention in Proposition 3, the half cohomological degree of $r_(lambda_m)$ is the polynomial
    degree of its Laurent coefficient. For a remaining arrow $i arrow.r j$, that degree is
  $ sum_(a = 1)^(v_i) sum_(b = 1)^(v_j) max \( s \( i a \) - s \( j b \) \, 0 \) = v_i v_j -
    sum_(a = 1)^(v_i) sum_(b = 1)^(v_j) min \( s \( i a \) \, s \( j b \) \) \, $
  because $sum_a s \( i a \) = v_i$. The framing contribution at $i$ is $w_i
    sum_(d in Omega_m^(+) \, med i \( d \) = i) \( s \( d \) - 1 \) = w_i \( v_i - l_i \)$. Summing gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ delta_m := deg_q r_(lambda_m) = C \( upright(bold(v)) \) - D_m +
     upright(bold(w)) dot.op \( upright(bold(v)) - upright(bold(l)) \) . $ <eq:multipartition-shift>]
  This also proves integrality and nonnegativity. The formula includes remaining loops:
    their ordered pairs of gauge slots give precisely the diagonal term with $c_(i i) = 2 n_(i i)$.
  For $- 1 lt.eq L lt.eq sum_i v_i$, define $cal(F)_(- 1) = 0$ and, for $L gt.eq 0$,
    let $cal(F)_L subset.eq B_0$ be the sum of the images of
  $ sans(S)_(lambda_m) #scale(x: 120%, y: 120%)[\(] P^(cal(W)_(lambda_m)) #scale(x: 120%, y: 120%)[\)] \, wide
    m in cal(M) \( upright(bold(v)) \) \, quad \| l \| lt.eq L . $
  Here and below an orbit sum denotes its image in the quotient when it is viewed in $B_0$.
    This is a finite filtration by graded vector subspaces. The array $m_(i \, 1) = v_i$ has $lambda_m = 0$,
    so the last stage contains the image of all coefficients.
    Those coefficients generate $B_0$, by Proposition 3; hence $cal(F)_(sum_i v_i) = B_0$.
    Exhaustion is asserted in the quotient, and requires no assertion about spanning the entire
    topological-degree-zero part of $A_0$ before quotienting. For later use denote the symbol map of each orbit type by
  $ Phi_m : P^(cal(W)_(lambda_m)) arrow.r cal(F)_(\| l \|) \/ cal(F)_(\| l \| - 1) \, wide
    p mapsto \[ sans(S)_(lambda_m) \( p \) \] . $
  It adds the half-degree shift $delta_m$.
  We first eliminate dressings in the zero slots. For each color $i$ and $k gt.eq 1$,
    define an ambient Laurent-ring derivation by
  $ D_(i \, k) \( p e^lambda \) = p e^lambda sum_a lambda_(i a) x_(i a)^k \, wide D_(i \, k) \( p \) =
    0 quad \( p in bb(C) \( x_(i a) \) \) . $
  Additivity of the displayed multiplier in $lambda$ proves the Leibniz rule.
    This derivation commutes with $cal(W)$, preserves the algebra in Equation (5.1),
    and preserves every topological homogeneous summand. It therefore preserves the ideal defining $B_0$.
    Its induced derivation on $B_0$ is zero, since it kills the coefficient generators.
    Applying it to an arbitrarily dressed orbit sum gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ sans(S)_(lambda_m) (p [sum_(d in Omega_m^(+)\
i \( d \) = i) \( s \( d \) - 1 \) x_d^k - sum_(z in Omega_m^0\
i \( z \) = i) x_z^k]) = 0 quad upright("in ") B_0 $ <eq:zero-slot-power-sums>]
  for every $p in P^(cal(W)_(lambda_m))$. The invariant dressing ring is the tensor product of the
    symmetric-polynomial rings on the positive type blocks and the zero blocks.
    Power sums generate each zero-block ring over $bb(C)$. Equation (5.6), including its arbitrary multiplier $p$,
    replaces each such power sum by the indicated positive-slot polynomial.
    Thus positive-slot dressings alone span the image of this orbit type. These replacements preserve degree.
  Fix now a nonempty $S subset.eq Omega_m^(+)$, and split the array of sizes on all gauge slots as $s = a + b$,
    by putting $b_d = s \( d \)$ on $S$ and $b_d = 0$ elsewhere. Set
  $ alpha = a - 1 \, wide beta = b . $
  The topological degree of $beta$ is a nonzero vector with nonnegative entries, so every product
  $ sans(S)_alpha \( p_a \) sans(S)_beta \( p_b \) $
  vanishes in $B_0$. The dressings here may be arbitrary polynomials invariant under their respective coweight
    stabilizers, by Proposition 12.
  To analyze the terms of this product, fix $a$ and match it with a colorwise permutation $b'$ of $b$.
    The resulting coweight is $t - 1$, where $t = a + b'$ has nonnegative entries and $sum_(i \( d \) = i) t_d =
    v_i$. It therefore determines another array in $cal(M) \( upright(bold(v)) \)$.
    Writing $A = "supp" \( a \)$ and $B' = "supp" \( b' \)$, its length is
  $ \| "supp" \( t \) \| = \| A \| + \| B' \| - \| A ∩ B' \| = \| l \| - \| A ∩ B' \| . $
  Every overlap term belongs to $cal(F)_(\| l \| - 1)$. For a disjoint matching,
    the positive sizes of $t$ are the multiset union of those of $a$ and $b$ at each color.
    Hence its array is exactly $m$; no other orbit type occurs at length $\| l \|$.
  For the chosen disjoint decomposition, the excess coefficient in $r_alpha r_beta \/
    r_(lambda_m)$ is $q_S$ up to a nonzero constant sign. Here is the calculation for each weight.
    For an arrow from slot $d$ to slot $e$, its excess exponent is
  $ \( a_d - a_e \)_(+) + \( b_d - b_e \)_(+) - \( a_d + b_d - a_e - b_e \)_(+) . $
  This is zero unless one slot belongs to $"supp" \( a \)$ and the other to $S$.
    In that case it is $min \( s \( d \) \, s \( e \) \)$. For the framing weight $- x_d$, the excess is
  $ \( a_d - 1 \)_(+) + \( b_d \)_(+) - \( a_d + b_d - 1 \)_(+) \, $
  which equals one on $S$ and zero elsewhere. These give exactly the exponents in Equation (5.3).
    With the weight conventions above, the sign is $\( - 1 \)^(epsilon.alt_S)$, where
  $ epsilon.alt_S = sum_(d in S) w_(i \( d \)) + sum_(d in S\
e in Omega_m^(+) \\ S) n_(i \( d \) i \( e \)) min \( s \( d \) \, s \( e \) \) . $
  This integer depends only on the numbers of selected and unselected copies of each type.
    In particular the sign is constant on the averaging orbit considered next.
  It remains to check the full span of the leading dressing relations. Let
  $ H = cal(W)_(lambda_m) \, wide H_S = cal(W)_alpha ∩ cal(W)_beta . $
  Then $H_S subset.eq H$. Its blocks are the selected and unselected copies of each positive type,
    together with the zero block at every color. All disjoint decompositions of the fixed representative
    $lambda_m$ into translates of $alpha$ and $beta$ form exactly the set $H \/ H_S$.
    The coefficient of its leading orbit sum in the product above is $\( - 1 \)^(epsilon.alt_S)
    "Tr"_(H_S)^H \( q_S p_a p_b \)$. Since the sign is nonzero and all other terms have lower length, we obtain
  #[#set math.equation(numbering: n => "(5.7)")
   $ Phi_m #scale(x: 120%, y: 120%)[\(] "Tr"_(H_S)^H \( q_S p_a p_b \) #scale(x: 120%, y: 120%)[\)] = 0 \, wide
     "Tr"_(H_S)^H \( f \) = sum_(h in H \/ H_S) h \( f \) . $ <eq:cut-leading-trace>]
  Choose $p_a$ to depend only on the positive-size blocks of $a$ and $p_b$ only on the positive-size blocks of
    $b$. Such choices are allowed by their coweight stabilizers.
    Their products span the $H_S$-invariant polynomial ring on the positive slots,
    since that ring is the tensor product of the symmetric-polynomial rings on the selected and unselected copies
    of every type. Moreover $q_S$ is $H_S$-invariant. For an arbitrary $f in P_m$,
    Reynolds averaging first over $H_S$ and then over $H$ consequently shows that
  $ "Av"_H \( q_S f \) = "Av"_H #scale(x: 120%, y: 120%)[\(] q_S "Av"_(H_S) \( f \) #scale(x: 120%, y: 120%)[\)] $
  is a linear combination of the relations in Equation (5.7).
    All normalizing factors are nonzero constants in $bb(C)$.
    Averaging the generators $q_S$ with arbitrary multipliers spans $J_m ∩ P_m^(cal(W)_m)$,
    because $J_m$ is stable under $cal(W)_m$ and averaging is exact in characteristic zero.
    Therefore all invariant cut-ideal relations annihilate the symbol of this orbit type.
  Combining the zero-slot elimination with these cut relations gives, for every $L$,
    a surjection of graded vector spaces
  #[#set math.equation(numbering: n => "(5.8)")
   $ xor.big_(m in cal(M) \( upright(bold(v)) \)\
\| l \| = L) \( P_m \/ J_m \)^(cal(W)_m) \[ delta_m \] arrow.r.twohead cal(F)_L \/ cal(F)_(L - 1) .
  $ <eq:filtration-symbol-surjection>]
  Here $\[ delta_m \]$ means that polynomial half degree $d$ is placed in half cohomological degree $d + delta_m$.
    Exactness of invariants identifies the source with the invariant dressing quotient just obtained.
    Summing its Hilbert-series bound over the finite exhaustive filtration proves Equation (5.4). ◻
]

#prodef([Remark 5.3.])[
  If there are no gauge slots, the unique empty array gives $A_0 = B_0 = bb(C)$ and equality in Equation (5.4).
    If $upright(bold(v)) eq.not 0$ and $upright(bold(w)) = 0$, the cut on all positive slots is $q_(Omega_m^(+)) =
    1$, so every summand on the right is zero. Correspondingly,
    $e^(upright(bold(1)))$ is an invertible monopole of nonzero topological degree, and $B_0 = 0$.
    The same observation applies to any unframed connected component.
    Full subsets, empty zero blocks, and rank-one gauge factors require no change in the proof.
] <rem:filtration-edge-cases>

The filtration has reduced the upper bound for $B_0$ to finitely many cut quotients $\( P_m \/ J_m \)^(cal(W)_m)$.
  Section 6 evaluates their generating series and compares the sum in Equation (5.4) with the cohomology at
  determinant stability. No algebra presentation of $B_0$ is inferred from the vector-space surjections onto its
  filtration quotients.

== 6 Cut ideals and the Betti-number bound <sec:counting>

We retain the notation of Section 5, including the assumption that the original quiver has a loop at every vertex
  of positive dimension. All Hilbert series in this section use half cohomological degree:
  each variable $x_d$ has degree one. We first compute the cut quotients and then identify the right-hand side of
  Proposition 13 with the ordinary Poincaré polynomial. We write $v = upright(bold(v))$, $w = upright(bold(w))$,
  and $l = \( l_i \)_i$ for the dimension vectors in this section.

For the counting identities, allow $m = \( m_(i \, s) \)_(i in Q_0 \, med s gt.eq 1)$ to be any finite array of
  nonnegative integers. Its slots, cut ideal, and permutation group are defined as before. Set

$ parallel m parallel_i = sum_(s gt.eq 1) s m_(i \, s) \, wide w \( m \) = sum_(i \, s) w_i m_(i \, s) \,
  wide \( q \)_m = product_(i \, s) product_(j = 1)^(m_(i \, s)) \( 1 - q^j \) . $

For two such arrays, write

$ b \( k \, m' \) = sum_(i \, j \, s \, t) c_(i j) min \( s \, t \) k_(i \, s) m'_(j \, t) . $

Thus $D_m = 1 / 2 b \( m \, m \)$. Empty products equal one, and the empty array has $P_0 = bb(C)$, $J_0 = 0$,
  and $h_0 \( q \) = 1$.

#prodef([Lemma 6.1.])[
  #emph[For every finite array $m$, the algebra $P_m \/ J_m$ is finite dimensional.
    Consequently $h_m \( q \)$ is a polynomial with nonnegative integer coefficients.]
] <lem:finite-cut-quotient>

#proof[
  The assertion for the empty array is immediate. Suppose that $x$ is a common zero of the cut polynomials and
    that one of its coordinates has a nonzero value $a$. Take
  $ S = { d : x_d = a } . $
  Every framing factor in $q_S \( x \)$ is nonzero, and every difference across the cut is nonzero because $S$
    contains all slots with value $a$. Thus $q_S \( x \) eq.not 0$, a contradiction.
    The common zero set of $J_m$ is therefore contained in the origin.
    By the Nullstellensatz, either $J_m = P_m$ or a power of each variable belongs to $J_m$.
    Both alternatives give a finite-dimensional quotient. Taking invariants under the finite group $cal(W)_m$
    preserves finite dimensionality and the nonnegative grading. ◻
]

#prodef([Proposition 6.2.])[
  #emph[For every finite array $m$,
#[#set math.equation(numbering: n => "(6.1)")
 $ frac(1, \( q \)_m) = sum_(k + m' = m) q^(w \( k \) + b \( k \, m' \)) frac(h_(m') \( q \), \( q \)_k) .
   $ <eq:cut-recurrence>]

]
] <prop:cut-recurrence>

#proof[
  We realize the cut products as Euler classes of incoming coordinates and stratify by unreachable slots to obtain
    both the coefficient-ring presentation and the recurrence.
    Make a directed graph whose vertices are the slots of $m$.
    For each unordered pair of distinct slots $d \, e$, put $b_(d e)$ arrows from $d$ to $e$ and $b_(d e)$ arrows
    from $e$ to $d$, with each ordered arrow counted once. Add a fixed framing vertex and $w_(i \( d \))$ arrows
    from it to $d$. Assign a one-dimensional vector space to every slot and to the framing vertex.
    Let $E_m$ be the space of representations of this graph, and let
  $ T_m = \( bb(C)^times \)^(Omega_m^(+)) $
  act by change of basis at the slots, leaving the framing line fixed.
    The class $x_d in H_(T_m)^2 \( upright("pt") \)$ is the first Chern class of the standard character at slot $d$.
  A slot is #emph[reachable] if there is a directed path from the framing vertex to it on which every arrow
    coordinate is nonzero. Let $U_m$ be the open subset where all slots are reachable.
    We will show that the natural coefficient map gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ H_(T_m)^(*) \( U_m \; bb(C) \) = P_m \/ J_m \, $ <eq:cut-cohomology>]
  and that this cohomology is concentrated in even degrees. Reachability is an open condition:
    it is a union of conditions requiring the coordinates on finitely many paths to be nonzero.
  We use induction on the number $n$ of slots. For $n = 0$,
    the representation space and its reachable open are both a point, and both assertions hold.
    For $0 lt.eq r lt.eq n$, let $U_r subset E_m$ be the open subset with at most $r$ unreachable slots.
    Thus $U_n = E_m$ and $U_0 = U_m$. For a subset $S$ of $r gt.eq 1$ slots,
    let $Z_S subset U_r$ consist of representations whose unreachable set is exactly $S$.
  Let $L_S subset E_m$ be the linear subspace on which all framing arrows into $S$ and all arrows from the
    complement of $S$ into $S$ vanish. These equations force every slot of $S$ to be unreachable.
    Conversely, within $U_r$, unreachability of all $r$ slots in $S$ forces every complementary slot to be
    reachable, so these incoming coordinates must vanish. It follows that
  $ Z_S = L_S ∩ U_r . $
  In particular, $Z_S$ is smooth and closed in $U_r$, and $U_r \\ U_(r - 1)$ is the disjoint union of the $Z_S$
    with $\| S \| = r$.
  Let $k$ record the types of the slots in $S$, and put $m' = m - k$.
    Restricting to the complement identifies $Z_S$ with a vector bundle over $U_(m')$.
    Its remaining coordinates are the internal arrows on $S$ and the arrows from $S$ to its complement,
    all of which are unrestricted. Contracting these vector-bundle fibers is equivariant.
    The factor of $T_m$ acting at the slots of $S$ acts trivially on the base, so the inductive hypothesis gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ H_(T_m)^(*) \( Z_S \) =
     H_(T_(m'))^(*) \( U_(m') \) \[ x_d : d in S \] = \( P_(m') \/ J_(m') \) \[ x_d : d in S \] .
     $ <eq:cut-stratum-cohomology>]
  The normal bundle is the representation formed by the incoming coordinates set to zero.
    Its complex rank and equivariant Euler class are
  #[#set math.equation(numbering: n => "(6.4)")
   $ c_S & = w \( k \) + b \( k \, m' \) \,\
e_S & = product_(d in S) x_d^(w_(i \( d \))) product_(d in S \, med e in.not S) \( x_d - x_e \)^(b_(d e)) =
  q_S . $ <eq:cut-stratum-codimension>]
  Only arrows entering $S$ vanish; this accounts for the exponent $b \( k \, m' \)$,
    even though the graph has arrows in both directions.
  Multiplication by $e_S$ on Equation (6.3) is injective. Indeed,
    view it as a polynomial in the variables indexed by $S$, over the possibly nonreduced coefficient ring
    $P_(m') \/ J_(m')$. Its term of highest total degree in those variables is the single monomial
  $ product_(d in S) x_d^(w_(i \( d \)) + sum_(e in.not S) b_(d e)) $
  with coefficient one. Multiplication by this monomial is injective over any coefficient ring,
    and all other terms have lower degree in the new variables.
    A highest-degree argument proves the claim, including the case $e_S = 1$.
  Write $i_S : Z_S arrow.r.hook U_r$. The self-intersection identity says that $i_S^(*)
    i_(S \, *)$ is multiplication by $e_S$. Restriction to a different, disjoint stratum kills the Gysin image.
    Therefore the direct sum of the Gysin maps is injective. The equivariant Thom exact sequence,
    applied successively from $U_n$ down to $U_0$, gives short exact sequences
  #[#set math.equation(numbering: n => "(6.5)")
   $ 0 arrow.r xor.big_(\| S \| = r) H_(T_m)^(* - 2 c_S) \( Z_S \) arrow.r^(med sum i_(S \, *) med)
     H_(T_m)^(*) \( U_r \) arrow.r H_(T_m)^(*) \( U_(r - 1) \) arrow.r 0 . $ <eq:cut-thom-sequence>]
  It also proves at each step that the cohomology is even and that restriction from $P_m =
    H_(T_m)^(*) \( E_m \)$ is surjective. These statements start with $U_n = E_m$;
    evenness of the strata follows from the induction on $n$.
  We also identify the kernel at each step. By Equation (6.3),
    every class on $Z_S$ is the restriction of a polynomial in the slot variables.
    The incoming linear equations cut out $Z_S$ regularly inside $U_r$,
    so its fundamental class $i_(S \, *) \( 1 \)$ is the restriction of the Euler product $q_S$.
    The projection formula now shows that the image of $i_(S \, *)$ is the ideal generated by that class.
    Removing all strata therefore gives exactly the ideal generated by the nonempty cuts, proving Equation (6.2).
  Finally, choose arrow labels compatibly with permutations of equal types.
    Then $cal(W)_m$ acts on the entire construction, permuting the slot torus and its variables.
    Complex orientations give equivariant Thom classes without permutation signs.
    Taking $cal(W)_m$-invariants is exact over $bb(C)$. Subsets $S$ with a fixed count vector $k$ form one orbit,
    whose stabilizer is $cal(W)_k times cal(W)_(m')$. Their total invariant cohomology contribution in
    Equation (6.5) is consequently
  $ q^(c_S) "Hilb" #scale(x: 120%, y: 120%)[\(] bb(C) \[ x_d : d in S \]^(cal(W)_k) \;
    q #scale(x: 120%, y: 120%)[\)] "Hilb" #scale(x: 120%, y: 120%)[\(] \( P_(m') \/ J_(m') \)^(cal(W)_(m')) \;
    q #scale(x: 120%, y: 120%)[\)] = q^(w \( k \) + b \( k \, m' \)) frac(h_(m') \( q \), \( q \)_k) . $
  There is one such contribution for each count vector $k$;
    taking invariants of the sum over its subset orbit supplies no binomial multiplicity.
    The all-reachable open supplies the term $k = 0$. Summing all strata and using
    $"Hilb" \( P_m^(cal(W)_m) \; q \) = 1 \/ \( q \)_m$ proves Equation (6.1). ◻
]

#prodef([Corollary 6.3.])[
  #emph[In the formal power series ring $bb(C) \( q \) \[ \[ z_i : i in Q_0 \] \]$,
#[#set math.equation(numbering: n => "(6.6)")
 $ sum_m z^(parallel m parallel) q^(- D_m - w \( m \)) h_m \( q \) =
   frac(sum_m z^(parallel m parallel) q^(- D_m - w \( m \)) \/ \( q \)_m, sum_m z^(parallel m parallel) q^(-
   D_m) \/ \( q \)_m) . $ <eq:cut-generating-ratio>]

]
] <cor:cut-generating-ratio>

#proof[
  The quadratic form satisfies
  $ D_(k + m') = D_k + D_(m') + b \( k \, m' \) . $
  This identity includes the diagonal entries of the type matrix:
    slots in the two separate blocks are distinct even when their types agree.
    Multiply Equation (6.1) by $z^(parallel m parallel) q^(- D_m - w \( m \))$ and sum over $m$. Its summand factors as
  $ frac(z^(parallel k parallel) q^(- D_k), \( q \)_k) thin z^(parallel m' parallel) q^(- D_(m') - w \( m' \))
    h_(m') \( q \) . $
  For each monomial in the $z_i$, only finitely many arrays occur.
    The resulting convolution identity may therefore be divided by the first factor’s series,
    whose constant coefficient is one. This is Equation (6.6). ◻
]

=== 6.1 Ordinary cohomology and Hausel’s formula <ordinary-cohomology-and-hausels-formula>

Let $nu_det = product_i det_(V_i)$ denote determinant stability,
  and write $X_det \( v \, w \)$ for the corresponding quiver variety. This is a regular choice:
  its pairing with every nonzero nonnegative dimension vector is strictly positive.
  Here is the corresponding GIT criterion, including freeness.
  Write $I_i : W_i arrow.r V_i$ for the incoming framing maps.
  In the convention that semi-invariants satisfy $f \( g x \) = nu_det \( g \)^a f \( x \)$,
  semistability is cyclicity: the smallest collection of subspaces invariant under all doubled-quiver arrows and
  containing every $"im" I_i$ is $V$. If that collection is proper,
  a one-parameter subgroup with weight zero on it and weight $-
  1$ on a chosen complement has a limit on the point and negative determinant weight.
  Every semi-invariant of positive determinant weight must therefore vanish.
  Conversely, at a cyclic point choose a basis at each vertex from images of framing vectors under arrow paths.
  The product of their basis determinants is a nonzero semi-invariant of weight $nu_det$.
  On the principal open where this product is nonzero, normalizing these path bases gives a slice meeting each
  orbit once. A semistable orbit limit is cyclic, and one of its such principal opens also meets the original
  orbit; the slice then shows that the limit belongs to that orbit.
  Thus these orbits are closed in the semistable locus. Moreover,
  a stabilizer fixes all path images of framing vectors, and hence is the identity.
  With the opposite linearization convention the dual argument gives cocyclicity.
  The argument applies to the closed moment fiber and allows loops throughout. Put

$ P_(X_det \( v \, w \)) \( q \) = sum_(j gt.eq 0) dim H^(2 j) \( X_det \( v \, w \) \; bb(C) \) q^j . $

Odd cohomology vanishes by Kirwan surjectivity, so this is the full ordinary cohomology polynomial in half
  degrees. The empty variety has polynomial zero.

#prodef([Proposition 6.4.])[
  #emph[For a quiver with a loop at every vertex of positive dimension,
#[#set math.equation(numbering: n => "(6.7)")
 $ P_(X_det \( v \, w \)) \( q \) = sum_(parallel m parallel = v) q^(C \( v \) - D_m + w dot.op \( v - l \))
   h_m \( q \) . $ <eq:hausel-cut-bound>]

]
] <prop:hausel-identification>

#proof[
  We first specify the moment-level comparison. Give $N$ a Hermitian metric invariant under $G_c =
    product_i U \( V_i \)$, and equip $T^(*) N$ with its flat hyperkähler structure.
    The hyperkähler moment map has one real and one complex component.
    Under the trace identification of the central real dual with $bb(R)^(Q_0)$,
    let $eta = \( 1 \, dots.h \, 1 \)$ be the level corresponding to the determinant character.
    The GIT–moment-map correspondence identifies $X_det \( v \, w \)$ with the compact-group quotient at real
    level $eta$ and complex level zero. Rotation of the three moment-map components carries this quotient to the
    one at real level zero and complex level $c eta$, for a common nonzero normalization constant $c$.
    At real level zero, affine Kempf–Ness identifies the latter quotient with
  $ mu_(bb(C))^(- 1) \( c eta \) \/ #h(-0.16667em) \/ G . $
  These are identifications of underlying topological spaces;
    they do not assert that rotation is holomorphic in the original complex structure.
    The comparison uses the direct rotation on the flat representation #cite(label("HKLR87")) Section 3(D) and the
    topological affine Kempf–Ness theorem recalled in Section 2.
    The quiver GIT description is explained in #cite(label("Nakajima94"));
    the flat-representation argument just given includes loops.
    Multiplying the cotangent coordinate by $c^(- 1)$ is an algebraic isomorphism from this affine quotient to
  $ M_eta \( v \, w \) = mu_(bb(C))^(- 1) \( \( upright("id")_(V_i) \)_i \) \/ #h(-0.16667em) \/ G \, $
  because the cotangent moment map is linear in that coordinate.
    Thus $M_eta \( v \, w \)$ and $X_det \( v \, w \)$ have the same ordinary cohomology,
    including simultaneous emptiness.
  Hausel’s formula for $M_eta \( v \, w \)$ explicitly allows loops and multiple arrows #cite(label("Hausel06"))
    Equation (9). We record its grading and all factors needed here. For partitions $lambda^i$ and $lambda^j$, write
  $ chevron.l lambda^i \, lambda^j chevron.r = sum_(a \, b) min \( lambda_a^i \, lambda_b^j \) \, wide
    E_Q \( lambda \) = sum_(a : i arrow.r j in Q_1) chevron.l lambda^i \, lambda^j chevron.r -
    sum_i chevron.l lambda^i \, lambda^i chevron.r . $
  Let $m \( lambda \)_(i \, s)$ be the number of parts of size $s$ in $lambda^i$, and set
  $ delta \( v \, w \) = sum_(a : i arrow.r j in Q_1) v_i v_j - sum_i v_i^2 + w dot.op v . $
  The nonempty smooth variety has complex dimension $2 delta \( v \, w \)$.
    With $q = t^2$, where $t$ is the ordinary cohomological variable in Hausel’s formula, that formula reads
  #[#set math.equation(numbering: n => "(6.8)")
   $ sum_v q^(- delta \( v \, w \)) P_(M_eta \( v \, w \)) \( q \) z^v =
     frac(sum_lambda z^(\| lambda \|) q^(- E_Q \( lambda \) - sum_i chevron.l lambda^i \, \( 1^(w_i) \)
     chevron.r) \/ \( q \)_(m \( lambda \)), sum_lambda z^(\| lambda \|) q^(- E_Q \( lambda \)) \/ \( q \)_(m \(
     lambda \))) . $ <eq:hausel-ordinary>]
  Here $lambda$ ranges over all multipartitions, including the empty one.
    In particular, the left side uses ordinary cohomology. Its normalization can also be checked by Poincaré
    duality: if $u$ is the arithmetic variable, a smooth variety of complex dimension $2
    delta$ satisfies $P_c \( u \) = u^(2 delta) P \( u^(- 1) \)$.
    The normalized count $u^(- delta) P_c \( u \)$ therefore becomes $q^(- delta) P \( q \)$ after setting $u =
    q^(- 1)$, as in Equation (6.8).
  Now write $m = m \( lambda \)$. Removing one loop at each vertex cancels the vertex self-pairing in $E_Q$,
    and therefore
  $ E_Q \( lambda \) = D_m \, wide sum_i chevron.l lambda^i \, \( 1^(w_i) \) chevron.r = sum_i w_i l_i =
    w \( m \) \, wide delta \( v \, w \) = C \( v \) + w dot.op v . $
  Consequently the right side of Equation (6.8) is exactly the ratio in Equation (6.6).
    Taking its $z^v$ coefficient and multiplying by $q^(C \( v \) + w dot.op v)$ proves Equation (6.7).
  The right side is a finite polynomial before this identification:
    Lemma 15 makes each $h_m$ finite, there are only finitely many multipartitions of $v$,
    and the shifts are nonnegative integers. Explicitly,
  $ C \( v \) - D_m = 1 / 2 sum_(i \, j \, s \, t) c_(i j) #scale(x: 120%, y: 120%)[\(] s t -
    min \( s \, t \) #scale(x: 120%, y: 120%)[\)] m_(i \, s) m_(j \, t) gt.eq 0 \, wide w dot.op \( v - l \) =
    sum_(i \, s) w_i \( s - 1 \) m_(i \, s) gt.eq 0 . $
  The diagonal entries $c_(i i)$ are even and the off-diagonal terms pair, which also verifies integrality. ◻
]

#prodef([Remark 6.5.])[
  When $v = 0$, only the empty multipartition occurs and the polynomial is one.
    When $w = 0$ and $v eq.not 0$, the cut consisting of all positive slots has $q_S = 1$,
    so every summand is zero. Equivalently, the numerator and denominator of Equation (6.6) coincide.
    This agrees with emptiness at determinant stability: the diagonal gauge scalar acts trivially on the fields
    and nontrivially on the linearization. An unframed connected component of the supported graph gives the same
    unit cut. Thus neither the recurrence nor the Betti comparison omits these degenerate cases.
] <rem:counting-empty-cases>

#prodef([Corollary 6.6.])[
  #emph[Suppose that the quiver has a loop at every vertex of positive dimension.
    At determinant stability, the coefficient map induces a canonical isomorphism of graded $R_0$-algebras
$ B_0 arrow.r^(med tilde.op med) H^(*) \( X_det \( v \, w \) \; bb(C) \) . $

]
] <cor:loop-isomorphism>

#proof[
  Proposition 8 gives the displayed graded $R_0$-algebra surjection.
    Proposition 13 and Proposition 18 bound the dimension of each graded piece of its source from above by that of
    its target. Surjectivity gives the reverse inequality. Its kernel therefore vanishes in every degree.
    Since the bijection is the original coefficient-compatible algebra map,
    this is an isomorphism over $R_0$ and an equality of the two coefficient ideals,
    with the quotient rings retaining nilpotents. The same argument includes the zero ring in the empty case. ◻
]

== 7 Flavor parameters, loop removal, and stability <sec:deformations>

Throughout this section, $B_F$ denotes the quotient by the full topological torus.
  In particular, it is independent of the stability character.
  We first prove that regular stabilities have the same Betti numbers.
  We then lift a no-flavor comparison to arbitrary flavor parameters and use an added-loop parameter to remove the
  loop hypothesis at determinant stability. These three inputs combine in Theorem 24.

#prodef([Lemma 7.1.])[
  #emph[Fix a quiver and dimension and framing vectors. The ordinary Betti numbers of $X_theta =
    mu^(- 1) \( 0 \) \/ #h(-0.16667em) \/_theta G$ are independent of the regular character $theta$,
    where regular means that every semistable point is stable and the action on the semistable locus is free.
    Empty quotients are included.]
] <lem:betti-independence>

#proof[
  By Lemma 5, each regular character has a real open ball in which every rational parameter gives the same stable
    and semistable loci, geometric quotient, and principal gauge bundle.
    We may therefore perturb within this ball without changing the quotient.
  Here is a comparison of such neighborhoods for different regular characters.
    Write $G_c = product_i U \( V_i \)$ for a compact form and $frak(c) = \( frak(g)^(*) \)^G$ for the space of
    complex central moment parameters. Equip $T^(*) N$ with its standard flat hyperkähler structure.
    The character space identifies with a real form of $frak(c)$.
    For a rational parameter, clear its denominators and then dilate the flat representation by the inverse square
    root of that common denominator; the quadratic moment maps thereby return to level $theta$.
    Kempf–Ness identifies $X_theta$ with the quotient by $G_c$ at real moment level $theta$ and complex moment
    level zero. Quaternionic rotation commutes with $G_c$ and rotates the three moment maps.
    Thus it identifies this space with the quotient at real level zero and complex level $c theta$,
    where $c eq.not 0$ is one fixed scalar determined by the normalization of the moment maps.
    Applying affine Kempf–Ness at this latter level gives a homeomorphism
  #[#set math.equation(numbering: n => "(7.1)")
   $ X_theta med tilde.eq med mu^(- 1) \( c theta \) \/ #h(-0.16667em) \/ G . $ <eq:rotation-affine-fiber>]
  This uses the flat hyperkähler quotient construction #cite(label("HKLR87")) Section 3(D) and the topological
    affine Kempf–Ness identification recalled in Section 2; the quiver-variety description appears in
    #cite(label("Nakajima94")). The rotation here acts directly on the flat representation and is valid with
    loops. It requires no properness of a moment-map family. One can normalize $c = 1$;
    alternatively a linear dilation of $T^(*) N$ identifies any two common nonzero scalar multiples of the complex
    level.
  Consider the affine family
  $ pi : cal(Z) = "Spec" bb(C) \[ { \( x \, zeta \) in T^(*) N times frak(c) : mu \( x \) = zeta } \]^G arrow.r
    frak(c) . $
  Its fiber at $zeta$ is $mu^(- 1) \( zeta \) \/ #h(-0.16667em) \/ G$.
    To check this without a flatness assumption, let $A$ be the coordinate ring inside the brackets.
    The ideal specifying $zeta$ is generated by invariant parameter functions.
    Exactness of invariants and the Reynolds operator give
  $ \( A \/ frak(m)_zeta A \)^G = A^G \/ frak(m)_zeta A^G . $
  The morphism $pi$ is of finite type. Constructibility of compactly supported direct image and its fiber-stalk
    description #cite(label("MaximSchurmann21")) Theorem 2.5(b) #cite(label("SchnurerSoergel16")) Theorem 5.10
    therefore imply that $R pi_(!) bb(C)_(cal(Z))$ has constructible cohomology sheaves with stalks
    $H_c^(*) \( pi^(- 1) \( zeta \) \; bb(C) \)$. On a common dense Zariski open subset $Omega subset frak(c)$,
    their ranks, hence all compactly supported Betti numbers of the fibers, are constant.
    We may take $Omega$ connected. Every real open ball in the character space is Zariski dense after
    multiplication by $c$, and its rational points are dense in the usual topology.
    Each regular character can thus be perturbed, without changing its quotient, so that $c theta in Omega$.
  By Equation (7.1), all regular quotients have the same compactly supported Betti numbers.
    A nonempty such quotient is smooth of complex dimension $2 \( dim N - dim G \)$:
    freeness makes the moment map a submersion along its stable locus.
    Poincaré duality now gives equality of ordinary Betti numbers.
    If one regular quotient is empty, all compactly supported Betti numbers vanish for every regular quotient;
    a nonempty smooth quotient would have nonzero top compactly supported cohomology, a contradiction.
    This also covers nonfaithful gauge actions and unframed components:
    the generic central fiber is allowed to be empty. If $G$ is trivial,
    the parameter space is a point and the assertion is immediate. ◻
]

#prodef([Lemma 7.2.])[
  #emph[For a fixed regular stability, suppose that the coefficient map induces $B_0 tilde.eq H^(*) \( X \)$.
    Then, for every commuting flavor torus $F$, the map of Proposition 8 is an isomorphism
$ B_F arrow.r^(med tilde.op med) H_F^(*) \( X \) $

 of graded $R$-algebras.]
] <lem:flavor-lift>

#proof[
  Set $S = bb(C) \[ frak(f) \]$ and let $S_(+)$ be its positive-degree ideal.
    Kirwan surjectivity implies $H^(upright("odd")) \( X \) = 0$.
    The Borel spectral sequence for $X arrow.r E F times_F X arrow.r
    B F$ has second page $H^(*) \( B F \) ⊗ H^(*) \( X \)$, concentrated in even total degrees.
    It degenerates, and its edge map to $H^(*) \( X \)$ is surjective.
    Lifting a finite homogeneous basis of $H^(*) \( X \)$ and applying Leray–Hirsch shows that $H_F^(*) \( X \)$
    is a free $S$-module with
  $ H_F^(*) \( X \) \/ S_(+) H_F^(*) \( X \) = H^(*) \( X \) . $
  This remains valid for $X = diameter$, with zero modules.
  Let $J$ be the kernel of the surjection $B_F arrow.r.twohead H_F^(*) \( X \)$ from Proposition 8.
    Freeness of the target makes $"Tor"_1^S \( H_F^(*) \( X \) \, S \/ S_(+) \)$ vanish.
    Tensoring its defining exact sequence with $S \/ S_(+)$ consequently gives
  $ 0 arrow.r J \/ S_(+) J arrow.r B_F \/ S_(+) B_F arrow.r H^(*) \( X \) arrow.r 0 . $
  Lemma 4 identifies the middle term and map with $B_0 arrow.r^tilde.op H^(*) \( X \)$; hence $J = S_(+) J$.
    The module $J$ is graded and bounded below, since $B_F$ is a quotient of the nonnegatively graded ring $R$.
    If $J$ had a nonzero homogeneous element of least degree, the identity $J =
    S_(+) J$ would express it using elements of smaller degree, which is impossible. Thus $J = 0$.
    This argument uses positivity only for the coefficient quotient $B_F$,
    and does not assume that the Coulomb algebra itself is nonnegatively graded. ◻
]

#prodef([Proposition 7.3.])[
  #emph[For every finite quiver and every dimension and framing vector,
    at the determinant stability used in Corollary 20, the coefficient map induces an isomorphism of graded
    $R_0$-algebras
$ B_0 arrow.r^(med tilde.op med) H^(*) \( X \) . $

]
] <prop:loop-removal>

#proof[
  Discard zero-rank gauge factors. Add one loop at each remaining vertex and write
  $ N^(+) = N xor xor.big_i "End" \( V_i \) . $
  Let $H = bb(C)^times$ act trivially on $N$ and with weight one on every added loop.
    Put $H_H^(*) \( upright("pt") \) = bb(C) \[ z \]$, with $deg z = 2$,
    and use a superscript $+$ for the enlarged theory. At determinant stability, Corollary 20 and Lemma 22 give
  #[#set math.equation(numbering: n => "(7.2)")
   $ B_H^(+) arrow.r^(med tilde.op med) H_H^(*) \( X^(+) \) wide
     upright("as graded ") R_0 \[ z \] upright("-algebras") . $ <eq:enlarged-flavor-isomorphism>]
  We compare this with the original theory endowed with the trivial $H$-action.
    Let $frak(m)_0 subset R_0$ be the maximal ideal of the graded origin and set
  #[#set math.equation(numbering: n => "(7.3)")
   $ Lambda = R_0 \[ z \]_(\( frak(m)_0 \, z - 1 \)) . $ <eq:loop-local-ring>]
  The comparison over $Lambda$ is ungraded in cohomological degree but retains topological charge.
    The equality of homogeneous ideals in $R_0$ obtained below will restore the cohomological grading.
  #emph[The Coulomb comparison.] Use the common rational Laurent realization of Proposition 3, and put $P =
    bb(C) \[ x_(i a) \]$. For a positive or negative minuscule coweight $lambda$,
    the added numerator in Equation (2.2) is
  $ E_lambda \( x \, z \) =
    product_i product_(a \, b = 1)^(v_i) \( z + x_(i b) - x_(i a) \)^(\( lambda_(i a) - lambda_(i b) \)_(+)) . $
  It is invariant under the stabilizer $cal(W)_lambda$ and has value one at $\( x \, z \) = \( 0 \, 1 \)$.
    Its inverse belongs to $P \[ z \]^(cal(W)_lambda) ⊗_(R_0 \[ z \]) Lambda$: indeed,
  $ Delta_lambda = product_(w in cal(W)) w E_lambda in R_0 \[ z \] \, wide Delta_lambda \( 0 \, 1 \) = 1 \, $
  and $E_lambda^(- 1) = \( Delta_lambda \/ E_lambda \) \/ Delta_lambda$.
    If $M \( lambda \, p \)$ denotes an original dressed generator,
    the enlarged generator with dressing $p$ is $M \( lambda \, p E_lambda \)$.
    Conversely, dressing by $p \/ E_lambda$ recovers $M \( lambda \, p \)$ after localization.
    Generation therefore identifies the two localized Coulomb algebras,
    with their coefficient maps and their full topological gradings.
    The elements inverted in Equation (7.3) have topological degree zero.
    Thus localization commutes with quotienting by all nonzero topological degrees, and gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ B_H^(+) ⊗_(R_0 \[ z \]) Lambda tilde.eq \( B_0 ⊗_(bb(C)) bb(C) \[ z \] \) ⊗_(R_0 \[ z \]) Lambda .
     $ <eq:loop-coulomb-localization>]
  #emph[The cohomological comparison.] Let $D^(+) subset T^(*) N^(+)$ be the stable zero moment locus.
    An $H$-fixed point of the quotient may be fixed only after a compensating gauge transformation.
    We therefore localize the actual $H$-fixed locus of this prequotient, retaining $G times H$ equivariance,
    and first restrict to $T times H$. Brion’s subgroup localization theorem #cite(label("Brion98")) Lemma 4 says
    that, for a torus space embedded equivariantly in a finite-dimensional representation,
    restriction to the fixed locus of a subtorus becomes an isomorphism after inverting finitely many characters
    nontrivial on that subtorus. Apply it to the compact forms of $T times
    H$ and $H$ and to the invariant locally closed subset $D^(+) subset T^(*) N^(+)$.
    Every character nontrivial on $H$ is nonzero at the central Lie algebra element $\( 0 \, 1 \)$. The restriction
  $ H_(T times H)^(*) \( D^(+) \) arrow.r H_(T times H)^(*) \( \( D^(+) \)^H \) $
  is consequently an isomorphism there. Taking $cal(W)$-invariants recovers $G times H$ equivariance.
    This is compatible with localization over $Lambda$: the point is $cal(W)$-fixed,
    and the product of the Weyl translates of any denominator is an invariant denominator still nonzero there.
    This is also the central-parameter case of the prequotient localization in #cite(label("DK25")) Proposition 2.3.
  Both the added loops and their cotangent partners have nonzero $H$-weights,
    so $\( D^(+) \)^H$ sets all these coordinates to zero. The enlarged moment map then restricts to the original
    moment map. Stability restricts to the original stability as well:
    under a $G$-equivariant closed inclusion, the Hilbert–Mumford test of a point and of every one-parameter
    subgroup is unchanged. Equivalently, semi-invariants lift by reductivity,
    and orbit closures remain in the closed subvariety. Hence
  $ \( D^(+) \)^H = D \, $
  with $H$ acting trivially on the right. Freeness of the stable actions now gives a coefficient-compatible isomorphism
  #[#set math.equation(numbering: n => "(7.5)")
   $ H_H^(*) \( X^(+) \) ⊗_(R_0 \[ z \]) Lambda
     tilde.eq \( H^(*) \( X \) ⊗_(bb(C)) bb(C) \[ z \] \) ⊗_(R_0 \[ z \]) Lambda . $ <eq:loop-higgs-localization>]
  The localization theorem used here does not require compactness of $D^(+)$ or $X^(+)$.
  #emph[Descent.] Let $I_B$ and $I_X$ be the kernels of the coefficient maps from $R_0$ to $B_0$ and
    $H^(*) \( X \)$, respectively. Equations (7.2), (7.4), and (7.5) identify the localized quotients over the
    same ring $Lambda$. Therefore $I_B Lambda = I_X Lambda$. Setting $z = 1$ uses the identity
  $ Lambda \/ \( z - 1 \) Lambda = \( R_0 \)_(frak(m)_0) $
  and yields $\( I_B \)_(frak(m)_0) = \( I_X \)_(frak(m)_0)$. Both ideals are homogeneous.
    If $h in I_B$ is homogeneous, there is $s in R_0$ with $s \( 0 \) eq.not 0$ and $s h in I_X$.
    The component of degree $deg h$ of this relation is $s \( 0 \) h in I_X$, whence $h in I_X$.
    Interchanging the ideals proves $I_B = I_X$ globally. This is equality of ideals and gives the asserted graded
    isomorphism of quotient rings, with all nilpotents retained.
    The proof applies unchanged to empty stable loci; if there are no nonzero gauge ranks, the assertion is immediate. ◻
]

#prodef([Theorem 7.4.])[
  #emph[For every datum in the statement of Theorem 1, the coefficient map induces a canonical isomorphism of
    graded $R$-algebras
$ B_F arrow.r^(med tilde.op med) H_F^(*) \( X \) . $

]
] <thm:full-torus>

#proof[
  At determinant stability, Proposition 23 identifies $B_0$ with ordinary cohomology,
    so $B_0$ is finite-dimensional. For any other regular stability, Lemma 21 gives the same total Betti number.
    The graded coefficient-compatible surjection $B_0 arrow.r.twohead
    H^(*) \( X \)$ of Proposition 8 is therefore an isomorphism.
    Lemma 22 proves the assertion for every commuting flavor torus, with the generality supplied by Lemma 2.
    If a quotient is empty, the same argument gives $B_0 = B_F = 0$.
    Uniqueness follows from surjectivity of the coefficient map $R arrow.r B_F$. ◻
]

== 8 The cocharacter fixed scheme <sec:cocharacters>

We now compare the fixed scheme for the chosen cocharacter with the fixed scheme for the full topological torus.
  This comparison uses only minuscule generation, a root-support consequence of the loop-nilpotent Hall algebra,
  and the regularity of the stability. In particular, it does not use Theorem 24 or assume coefficient
  surjectivity onto the cocharacter fixed quotient.

If $nu dot.op upright(bold(b)) eq.not 0$ for every $0 < upright(bold(b)) lt.eq upright(bold(v))$,
  Proposition 3 immediately gives the comparison: every nontrivial positive or negative minuscule generator has
  nonzero $nu$-weight. The argument below also covers regular characters that lie on some of these dimension
  hyperplanes.

For example, take two disconnected vertices, no arrows, and $upright(bold(v)) = upright(bold(w)) = \( 1 \, 1 \)$,
  with $nu = \( 1 \, - 1 \)$. Each Higgs factor is a point with free stable gauge action,
  so this character is regular, although $nu dot.op \( 1 \, 1 \) = 0$.
  The joint positive monopole is a product of monopoles of weights $1$ and $- 1$,
  and hence vanishes in the cocharacter fixed quotient: weight zero alone does not imply survival.

To treat these characters, we adjoin a rank-one framing vertex.
  If a nontrivial minuscule generator of the original Coulomb algebra survived in its cocharacter fixed quotient,
  the corresponding class and its complementary class would both survive in the enlarged cocharacter fixed
  quotient. Polynomial Hall-algebra generation would then decompose both nonzero complementary dimension vectors
  into indecomposable dimension vectors of weight zero for the extended character.
  These two decompositions supply at least two blocks of a semistable direct sum;
  after removing the one ineffective diagonal scalar, its stabilizer remains positive-dimensional,
  contradicting regularity.

=== 8.1 Generation in indecomposable charges <generation-in-indecomposable-charges>

For a finite quiver $Gamma$, possibly with loops, write

$ Delta_Gamma = { thin 0 eq.not bold(gamma) in bb(Z)_(gt.eq 0)^(Gamma_0) :
  A_(Gamma \, bold(gamma)) \( q \) eq.not 0 thin } . $

Here $A_(Gamma \, bold(gamma))$ is the polynomial counting absolutely indecomposable representations over finite
  fields introduced in Kac’s work #cite(label("Kac83")); polynomiality for quivers with self-loops is explicitly
  recalled in #cite(label("Kac19")) Theorem 1(a) and Remark 4.
  We use $Delta_Gamma$ only as the nonzero support of these polynomials, without a loopless root-system interpretation.

The generation mechanism belongs to the cohomological Hall theory initiated by Kontsevich–Soibelman
  #cite(label("KontsevichSoibelman11")). Its BPS and PBW structure was developed by Davison–Meinhardt and Davison
  #cite(label("DavisonMeinhardt20")) #cite(label("Davison25AffineBPS"));
  the graded Kac identity builds on Mozgovoy’s generating-series formula and Davison’s cohomology of preprojective
  stacks #cite(label("Mozgovoy11McKay")) #cite(label("Davison23Preprojective")).
  The difference-operator maps were developed in the work of Finkelberg–Tsymbaliuk, Frassek–Tsymbaliuk,
  and Tsymbaliuk #cite(label("FinkelbergTsymbaliuk19Integral")) #cite(label("FrassekTsymbaliuk22"))
  #cite(label("Tsymbaliuk23Difference")). For arbitrary unframed quivers,
  Muthiah–Weekes relate Kac-polynomial Hilbert series and shuffle algebras through limit quantized zastava spaces
  #cite(label("MuthiahWeekes2026Zastavas")). The zastava comparison provides related context.
  Our inputs are the polynomial-parameter loop-nilpotent package of Jindal–Neguţ #cite(label("JindalNegut26")) and
  Tsymbaliuk’s arbitrary-quiver operator maps #cite(label("Tsymbaliuk23Difference")) Theorem 5.7.
  We first fix their product conventions and prove that the maps restrict to polynomial coefficient rings.
  This is needed before specializing the independent parameters to the given flavor action.

Put

$ S = bb(Q) \[ ℏ \, u_a divides a in Gamma_1 \] \, wide K = "Frac" \( S \) \, $

with independent parameters. Let $cal(S)_S^(+)$ be the polynomial shuffle half of #cite(label("JindalNegut26"))
  Definition 2.3, and denote its product by $*$. It is graded by dimension vectors, and contains

$ e_(upright(bold(n)) \, g) = g \( z_(i a) \) product_i product_(a \, b = 1)^(n_i) \( z_(i b) - z_(i a) + ℏ \) \,
  wide g in S \[ z_(i a) \]^(product_i S_(n_i)) . $

For homogeneous elements of dimensions $upright(bold(n)) \, upright(bold(m))$, use the product

#[#set math.equation(numbering: n => "(8.1)")
 $ E star.op E' = \( - 1 \)^(sum_(a : i arrow.r j) n_j m_i) E * E' . $ <eq:hall-sign-product>]

Bilinearity of the exponent makes this product associative.
  Let $cal(S)_S^(-)$ be its ordinary opposite algebra, with $f_(upright(bold(n)) \, g)$ denoting the same
  polynomial in that half. A word changes under this twist by a sign depending only on the dimensions of its
  factors; all homogeneous $S$-word spans are unchanged.

#prodef([Lemma 8.1.])[
  (Polynomial monopole maps).  #emph[For every unframed quiver $Gamma$ and dimension vector $upright(bold(d))$,
    the two halves above admit $S$-linear algebra maps to an algebra of difference operators defined without
    inverting rotation or arrow parameters. They send $e_(upright(bold(n)) \, g)$ and $f_(upright(bold(n)) \, g)$,
    for $upright(bold(n)) lt.eq upright(bold(d))$, to nonzero constant multiples of the positive and negative
    fundamental operators, respectively; they send these elements to zero when $upright(bold(n)) lt.eq.not
    upright(bold(d))$. After setting $ℏ = 0$, $w_(i a) = x_(i a)$, and $u_a = - f_a$,
    where $f_a$ is the prescribed flavor weight of arrow $a$,
    their images lie in $A_(Gamma \, upright(bold(d)) \, F)$.
    Dimension-vector degree becomes positive, respectively negative, topological charge.
    These maps preserve finite polynomial-coefficient identities under this specialization.]
] <lem:polynomial-monopole-maps>

#proof[
  We specify the operator algebra and the sign convention. Let $D_(i a)
    w_(j b) = \( w_(j b) + ℏ delta_(i j) delta_(a b) \) D_(i a)$, with all the $D_(i a)$ commuting.
    Allow coefficients in
  $ S \[ w_(i a) \, \( w_(i a) - w_(i b) + r ℏ \)^(- 1) : a eq.not b \, med r in bb(Z) \] . $
  This ring is preserved by every shift $D_(i a)^(plus.minus 1)$.
    For subsets $A_i subset.eq { 1 \, dots.h \, d_i }$, write $w_A = \( w_(i a) \)_(a in A_i \, i in Gamma_0)$. Define
  $ E_(upright(bold(n)) \, g) & = sum_(\| A_i \| = n_i) g \( w_A \)
    frac(product_(a : i arrow.r j) product_(alpha in A_i \, med beta in.not A_j) \( w_(i alpha) - w_(j beta) +
    u_a \), product_i product_(alpha in A_i \, med beta in.not A_i) \( w_(i alpha) - w_(i beta) \))
    product_(i \, alpha in A_i) D_(i alpha) \,\
F_(upright(bold(n)) \, g) & = sum_(\| A_i \| = n_i) g \( w_A - ℏ \)
  frac(product_(a : j arrow.r i) product_(alpha in A_i \, med beta in.not A_j) \( w_(i alpha) - w_(j beta) -
  u_a \), product_i product_(alpha in A_i \, med beta in.not A_i) \( w_(i alpha) - w_(i beta) \))
  product_(i \, alpha in A_i) D_(i alpha)^(- 1) . $
  These are the fundamental formulas #cite(label("JindalNegut26")) Equations (78)–(79).
    Let $cal(C)_S$ be the $S$-subalgebra generated by these operators and the polynomials symmetric in $w$
    separately at each vertex.
  We construct the maps first over $K$, then prove that their polynomial halves land in $cal(C)_S$.
    Use Tsymbaliuk’s maps on the full trigonometric shuffle algebra and its opposite
    #cite(label("Tsymbaliuk23Difference")) Theorem 5.7, Equations (93) and (96), with no framing,
    and make the formal substitutions
  $ q = e^(epsilon ℏ) \, wide t_a = e^(epsilon u_a) \, wide W_(i a) = e^(epsilon w_(i a)) . $
  Here $epsilon$ is an auxiliary formal variable, not $ℏ$. The multiplicative shift in the source satisfies
    $D_(i a)^(upright("trig")) W_(i a) = q^(- 1) W_(i a) D_(i a)^(upright("trig"))$.
    Thus its inverse becomes our positive shift $D_(i a)$, while it becomes $D_(i a)^(- 1)$ in the negative map.
    The leading coefficient of the trigonometric shuffle kernel is
  $ (frac(x - ℏ, x))^(delta_(i j)) product_(a : i arrow.r j) \[ - \( x + u_a \) \]
    product_(a : j arrow.r i) \( x + ℏ - u_a \) . $
  It is precisely the kernel for $star.op$ in Equation (8.1):
    the incoming-arrow signs have been removed from the kernel of #cite(label("JindalNegut26")) Equation (31).
    This distinction is necessary. For the quiver consisting of one arrow $i arrow.r j$,
    the untwisted product gives $e_(\( 1 \, 0 \) \, 1) * e_(\( 0 \, 1 \) \, 1) = -
    e_(\( 1 \, 1 \) \, z_i - z_j + u_a)$, whereas the corresponding fundamental operator product has a plus sign.
  Here are the order calculations that justify taking leading coefficients,
    including for loops and repeated gauge slots. Put
  $ kappa \( upright(bold(n)) \) = sum_(a : i arrow.r j) n_i n_j \, wide ell_i = \# { a : i arrow.r i } \, wide
    L_i^(+) = sum_(a : i arrow.r j) d_j - d_i + 1 \, wide L_i^(-) = sum_(a : j arrow.r i) d_j - d_i + 1 . $
  Lift a polynomial $E$ of dimension $upright(bold(n))$ to $epsilon^(kappa \( upright(bold(n)) \))
    E \( \( X_(i a) - 1 \) \/ epsilon \)$. The cross-kernel order is
    $kappa \( upright(bold(n)) + upright(bold(m)) \) - kappa \( upright(bold(n)) \) -
    kappa \( upright(bold(m)) \)$; thus the leading source product is $star.op$.
    In an operator summand, let $m_(i a)$ be the length of the string assigned to gauge slot $\( i \, a \)$,
    so $sum_a m_(i a) = n_i$, and set $P_2 = sum_(i \, a) ell_i m_(i a)^2$.
    The three prefactors in Tsymbaliuk’s formulas have orders
  $ upright("factor") & epsilon upright("-order")\
upright("single-entry factors ") Y upright(" or ") Y' & L^plus.minus dot.op upright(bold(n)) - sum_i ell_i n_i\
upright("inverse kernels within one string") & - P_2 + sum_i ell_i n_i\
upright("factors between distinct slots") & - kappa \( upright(bold(n)) \) + P_2 . $
  Together with the lifted input, their total order is $L^plus.minus dot.op upright(bold(n))$,
    independently of the composition. Multiply the operator image of the lift by
    $epsilon^(- L^plus.minus dot.op upright(bold(n)))$ and take its $epsilon^0$ coefficient to define the
    normalized leading map. The remaining denominators have nonzero leading coefficients over $K \( w \)$.
    There are only finitely many compositions. Consequently an input with zero normalized leading coefficient also
    has zero normalized leading output. The construction is independent of the lift.
    Since $L^plus.minus dot.op upright(bold(n))$ is additive, the normalized leading maps preserve multiplication.
    Multiplying them in dimension $upright(bold(n))$ by $ℏ^(- \| upright(bold(n)) \|)$ preserves that property.
  The use of formal parameters in this argument requires no analytic specialization theorem.
    For real $ℏ < u_a < 0$ and small positive $epsilon$, the substitutions satisfy Tsymbaliuk’s parameter
    inequalities. The monomial factors involving logarithms of torus parameters are expanded near $W = 1$;
    they have leading coefficient one and rational Taylor coefficients in $ℏ \, u_a \, w_(i a)$.
    Each coefficient of the multiplication identities is therefore a rational identity valid on this nonempty real
    open set, hence valid over $K \( w \)$. This justifies the formal leading maps, denoted $Psi_(+)$ and $Psi_(-)$.
  For the distinguished elements the maps are especially simple:
  #[#set math.equation(numbering: n => "(8.2)")
   $
     Psi_(+) \( e_(upright(bold(n)) \, g) \) = \( - 1 \)^(L^(+) dot.op upright(bold(n)) + kappa \(
     upright(bold(n)) \)) E_(upright(bold(n)) \, g) \, wide Psi_(-) \( f_(upright(bold(n)) \, g) \) =
     F_(upright(bold(n)) \, g) . $ <eq:corrected-monopole-images>]
  Indeed, the same-color factor in $e_(upright(bold(n)) \, g)$ vanishes on every additive string of length at
    least two. Only selected subsets of distinct slots remain.
    Its diagonal factors contribute $ℏ^(\| upright(bold(n)) \|)$,
    which cancels the normalization $ℏ^(- \| upright(bold(n)) \|)$;
    its off-diagonal factors cancel the same-color denominators in the operator formula.
    The factors for arrows between two selected slots cancel as well.
    In the positive formula the single-entry factors contribute $\( - 1 \)^(sum_i n_i \( L_i^(+) - ell_i \))$,
    and the internal-arrow cancellations contribute $\( - 1 \)^(kappa \( upright(bold(n)) \) - sum_i ell_i n_i)$,
    giving the stated sign. In the opposite formula the selected variables are $w_A - ℏ$;
    the incoming-arrow factors cancel without these signs. This proves both formulas,
    and proves that the image is zero when $upright(bold(n)) lt.eq.not upright(bold(d))$.
  By #cite(label("JindalNegut26")) Theorem 2.4, the distinguished elements generate $cal(S)_S^(+)$ over $S$.
    The twist preserves their word spans, and the opposite statement follows by reversing words.
    Equation (8.2) therefore proves that both polynomial halves land in $cal(C)_S$.
    Although we constructed the maps over $K$, their restrictions are thus defined over $S$;
    no inverse of a parameter is needed in the identities in $cal(C)_S$.
  Finally specialize $ℏ = 0$, $w_(i a) = x_(i a)$, and $u_a = - f_a$.
    Every allowed denominator becomes $x_(i a) - x_(i b)$, with $a eq.not b$,
    so this defines a homomorphism to $"Frac" \( P_F \) \[ X_(*) \( T \) \]$,
    sending each $D_(i a)$ to the monomial for its standard slot coweight.
    For a selected-variable dressing $g$, also denoting its specialization by $g$,
    direct comparison with Proposition 3 gives
  $ M_(upright(bold(n)) \, g)^(+) = \( - 1 \)^(sum_(a : i arrow.r j) n_i \( d_j - n_j \))
    E_(upright(bold(n)) \, g) \|_(upright("specialization")) \, wide
    M_(upright(bold(n)) \, g)^(-) = \( - 1 \)^(sum_i n_i \( d_i - n_i \))
    F_(upright(bold(n)) \, g) \|_(upright("specialization")) . $
  The first sign comes from the outgoing matter factors; the second comes from reversing the minuscule tangent
    weights. The coefficient roots themselves are unchanged. Thus every generator of $cal(C)_S$ specializes to an
    element of $A_(Gamma \, upright(bold(d)) \, F)$, and so does every image of the polynomial halves.
    Only this homomorphism is needed; no injectivity or flatness after specialization is asserted. ◻
]

#prodef([Lemma 8.2.])[
  (Root-charge generation).  #emph[Let $Gamma$ be an unframed quiver with dimension vector $upright(bold(d))$,
    and let a flavor torus act by a character on each arrow. Write $A_(Gamma \, upright(bold(d)) \, F)$ for its
    commutative Coulomb algebra and $R_(Gamma \, upright(bold(d)) \, F)$ for its coefficient algebra.
    For $epsilon.alt in { + 1 \, - 1 }$, let $M_(upright(bold(b)) \, p)^epsilon.alt$ be a dressed minuscule class
    whose coweight has $b_i$ entries equal to $epsilon.alt$ at vertex $i$ and all other entries zero,
    where $0 < upright(bold(b)) lt.eq upright(bold(d))$. There is a finite expression
#[#set math.equation(numbering: n => "(8.3)")
 $ M_(upright(bold(b)) \, p)^epsilon.alt = sum_r c_r a_(r 1) dots.h.c a_(r k_r) \, wide
   c_r in R_(Gamma \, upright(bold(d)) \, F) \, $ <eq:root-charge-words>]

 in which every factor is topologically homogeneous and
$ deg_(upright("top")) a_(r h) = epsilon.alt bold(gamma)_(r h) \, wide bold(gamma)_(r h) in Delta_Gamma \, wide
  sum_(h = 1)^(k_r) bold(gamma)_(r h) = upright(bold(b)) . $

 The factors need not themselves be minuscule classes.]
] <lem:root-charge-generation>

#proof[
  #emph[Polynomial Hall-algebra input.] Use the independent polynomial ring $S$ defined above.
    This is the equivariant coefficient ring $H^(*) \( B T_(upright("univ")) \; bb(Q) \)$ for
    $T_(upright("univ")) = \( bb(C)^times \)^(1 + \| Gamma_1 \|)$, with independent rotation and arrow characters.
    It lies in the geometric parameter setting of #cite(label("JindalNegut26")) Equation (30) and Remark 2.6;
    no extension to arbitrary field-valued exponential parameters is needed.
    On the tripled quiver use weights $- u_a$, $u_a - ℏ$, and $ℏ$ on an original arrow, its reverse,
    and an added loop, respectively. These choices satisfy all the genericity hypotheses of
    #cite(label("JindalNegut26")) §2.2; in particular there is no nonzero nonnegative integral relation among
    $u_a \, ℏ - u_a$, and $u_a in.not bb(Z) ℏ$ for every original loop.
  We use the following polynomial-form results of that source:
    the loop-nilpotent Hall algebra identifies with its shuffle half #cite(label("JindalNegut26"))
    Proposition 3.7; its BPS descendants generate over $S$ #cite(label("JindalNegut26")) Theorem 3.10,
    Equation (109), and Corollary 3.15; and the BPS comparison and Kac formula show that the nonzero
    dimension-vector support of these generators is $Delta_Gamma$ #cite(label("JindalNegut26")) Proposition 3.14
    and §3.10. Here the Kac identity retains the full cohomological grading:
    the coefficient of $t^(d \/ 2)$ is $\( - 1 \)^d dim H^d$.
    A zero Kac polynomial therefore forces every graded piece of the corresponding BPS space to vanish.
    Proposition 3.14 of that source transfers this vanishing to the loop-nilpotent BPS space.
    The concrete twist in Equation (8.1) preserves these homogeneous word spans.
    Here polynomial form refers to equivariant parameters over $bb(Q)$, not integral cohomology.
  Apply the generation statement to $e_(upright(bold(b)) \, g)$ or $f_(upright(bold(b)) \, g)$,
    and retain dimension-vector degree $upright(bold(b))$. All nonconstant Hall degrees are nonnegative,
    so the result is a finite $S$-linear combination of products of BPS descendants with degrees in $Delta_Gamma$
    summing to $upright(bold(b))$. Applying Lemma 25 gives the corresponding finite identity in $cal(C)_S$.
    Its coefficients lie in $S$; no parameter from $S$ is inverted in this identity.
    Every factor has degree at most $upright(bold(b)) lt.eq upright(bold(d))$;
    no assertion about vanishing of entire Hall components outside this bound is needed.
  #emph[Specialization.] Now extend scalars to $bb(C)$ and apply the specialization homomorphism of Lemma 25.
    Each finite identity becomes an identity in $A_(Gamma \, upright(bold(d)) \, F)$.
    The signs in the images of the distinguished elements are nonzero constants and can be absorbed in its
    coefficients. This operation is performed on the abstract polynomial-form algebra and its map,
    not on the ambient polynomial representation of the shuffle algebra.
    An element whose ambient representative is divisible by $ℏ$ need not belong to $ℏ$ times the polynomial
    shuffle half, and is therefore not discarded before applying the map.
  #emph[General dressings.] It remains to allow an arbitrary stabilizer-invariant dressing $p$.
    At each vertex, the polynomial algebra symmetric separately in the selected and complementary variables is
    generated by the polynomials symmetric in all variables together with those symmetric in the selected
    variables. Indeed, each complementary power sum is the total power sum minus the selected power sum.
    Thus $p$ is a finite sum of coefficient polynomials times selected-variable dressings $g$.
    The already proved identities for $g$ give Equation (8.3). ◻
]

=== 8.2 Indecomposables and central moment values <indecomposables-and-central-moment-values>

We record the geometric consequence of the charges in Lemma 26. For a dimension vector $bold(gamma)$, put

$ G_(bold(gamma)) = product_(i in Gamma_0) "GL"_(gamma_i) \, wide N_(bold(gamma)) =
  xor.big_(a : i arrow.r j) "Hom" \( bb(C)^(gamma_i) \, bb(C)^(gamma_j) \) . $

For a real vector $bold(theta) = \( theta_i \)$, let $tau_(bold(theta)) in
  "Lie" \( G_(bold(gamma)) \)^(*)$ be the central functional

$ tau_(bold(theta)) \( xi \) = sum_i theta_i "tr" \( xi_i \) . $

Choose standard Hermitian forms, and write $\( mu_(bb(R)) \, mu_(bb(C)) \)$ for the flat hyperkähler moment maps
  on $T^(*) N_(bold(gamma))$. We normalize the real parameter so that an integral character $bold(theta)$
  corresponds to real central level $tau_(bold(theta))$ in the affine Kempf–Ness correspondence.
  With any other common normalization, the same fixed scalar multiplies every level below.

#prodef([Lemma 8.3.])[
  #emph[If $bold(gamma) in Delta_Gamma$ and $bold(theta) dot.op bold(gamma) = 0$, then
$ mu_(bb(C))^(- 1) \( 0 \) ∩ mu_(bb(R))^(- 1) \( tau_(bold(theta)) \) eq.not diameter . $

 The scalar circle acting simultaneously on all nonzero vertex spaces fixes every point of this representation.]
] <lem:root-moment>

#proof[
  First, $Gamma$ has an indecomposable complex representation $x$ of dimension $bold(gamma)$.
    For completeness, the required passage from Kac support to characteristic zero can be made by
    constructibility. A representation is decomposable over an algebraic closure exactly when its endomorphism
    algebra contains an idempotent other than $0$ and $1$. The equations for such idempotents,
    together with these two open exclusions, define a constructible incidence condition over $bb(Z)$.
    Chevalley’s theorem therefore gives a constructible locus of geometrically indecomposable representations.
    A nonzero Kac polynomial gives points of this locus in infinitely many residue characteristics.
    Its generic fiber cannot be empty, since a constructible subset of $"Spec"
    bb(Z)$ that omits the generic point is finite. Base change of the nonempty characteristic-zero locus to
    $bb(C)$ gives $x$.
  The following trace-annihilator argument is the lifting criterion of Crawley–Boevey
    #cite(label("CrawleyBoevey01")) Lemma 3.1 and Theorem 3.3;
    we recall it before passing to the real moment level. Every endomorphism $e$ of $x$ has the form $c
    upright("id") + n$, where $n$ is nilpotent. Indeed, its generalized eigenspaces are subrepresentations,
    so indecomposability permits only one eigenvalue. Consequently
  $ tau_(bold(theta)) \( e \) = c thin bold(theta) dot.op bold(gamma) = 0 . $
  The cotangent moment map with $x$ fixed is the transpose of the infinitesimal orbit map:
  $ N_(bold(gamma))^(*) arrow.r "Lie" \( G_(bold(gamma)) \)^(*) \, wide
    y mapsto #scale(x: 120%, y: 120%)[\(] xi mapsto y \( xi x \) #scale(x: 120%, y: 120%)[\)] . $
  Its image is the annihilator of $"End"_Gamma \( x \) = ker \( xi mapsto xi x \)$.
    Hence the complex moment fiber at $tau_(bold(theta))$ is nonempty,
    as is the fiber at any common scalar multiple of that value.
  This fiber is a closed invariant affine subset, since the moment value is central.
    The closure of any orbit in it contains an orbit closed in the ambient affine representation.
    By the zero-character affine Kempf–Ness theorem, that orbit meets $mu_(bb(R))^(- 1) \( 0 \)$;
    see #cite(label("King94")) Theorem 6.1 and Corollary 6.2.
    Thus there is a point with hyperkähler moment value $\( 0 \, tau_(bold(theta)) \, 0 \)$,
    using the real and imaginary parts of the complex moment map and adjusting the common scalar to the chosen
    normalization.
  The quaternionic rotation on the flat cotangent representation commutes with the compact gauge group and rotates
    its three moment maps. A single rotation sends this value to $\( tau_(bold(theta)) \, 0 \, 0 \)$
    #cite(label("HKLR87")) §3(D). This proves the asserted nonemptiness.
    The simultaneous scalar acts trivially on all arrow spaces and their duals, proving the last statement. ◻
]

=== 8.3 The framing vertex and complementary monopoles <the-framing-vertex-and-complementary-monopoles>

#prodef([Proposition 8.4.])[
  #emph[Suppose that every $nu$-semistable point of $mu^(- 1) \( 0 \)$ is stable and has trivial $G$-stabilizer.
    Then the natural quotient map
$ A_F \/ chevron.l \( A_F \)_m : m eq.not 0 chevron.r arrow.r B_F \, $

 where $m$ denotes $nu$-weight, is an isomorphism. This is an equality of quotients of $A_F$,
   preserving the coefficient map and both gradings.]
] <prop:cocharacter-fixed>

#proof[
  Lemma 2 allows us to suppose that $F$ scales the individual arrows and framing rows.
    Adding or removing the gauge-trivial cotangent summands in that lemma preserves both regularity and all the
    fixed quotients under consideration. Write
  $ nu \( \( g_i \) \) = product_i det \( g_i \)^(nu_i) . $
  Adjoin one vertex $oo$ of dimension one and $w_i$ arrows $i arrow.r oo$, keeping the original arrows.
    Denote this unframed quiver by $hat(Q)$ and its dimension vector by
    $upright(bold(d)) = \( upright(bold(v)) \, 1 \)$. Its representation is the original $N$,
    after a choice of basis in each framing space.
  There is a group isomorphism
  $ G times bb(C)^times arrow.r G_(upright(bold(d))) \, wide \( \( g_i \) \, c \) mapsto \( \( c g_i \) \, c \) . $
  The second factor acts trivially on $N$. The BFN space of triples and its convolution therefore split, giving
  #[#set math.equation(numbering: n => "(8.4)")
   $ A_(hat(Q) \, upright(bold(d)) \, F) tilde.equiv A_F ⊗_(bb(C)) bb(C) \[ xi \, z \, z^(- 1) \] .
     $ <eq:central-splitting>]
  Here $xi$ is the coefficient parameter of the extra scalar and $z$ is its fundamental Laurent monopole,
    of cohomological degree zero. This $z$ is unrelated to the degree-two added-loop mass in Section 7.
    In the original vertex coordinates, $z$ has topological charge $upright(bold(d))$:
    it translates every gauge coweight entry, including the entry at $oo$, by one.
  Extend the character by
  $ hat(nu)_i = nu_i quad \( i in Q_0 \) \, wide hat(nu)_oo = - sum_i nu_i v_i . $
  Then $hat(nu) dot.op upright(bold(d)) = 0$, and under the displayed group isomorphism $hat(nu)$ is $nu$ on $G$
    and trivial on the extra scalar. In particular, both $xi$ and $z^(plus.minus 1)$ have $hat(nu)$-weight zero.
    Taking the cocharacter fixed quotient in Equation (8.4) consequently gives
  $ #scale(x: 120%, y: 120%)[\(] A_(hat(Q) \, upright(bold(d)) \, F)
    #scale(x: 120%, y: 120%)[\)]_(upright("fix") \, hat(nu)) tilde.equiv #scale(x: 120%, y: 120%)[\(] A_F
    #scale(x: 120%, y: 120%)[\)]_(upright("fix") \, nu) ⊗_(bb(C)) bb(C) \[ xi \, z \, z^(- 1) \] \, $
  where the subscript denotes the quotient by nonzero cocharacter weights. This extension is faithfully flat.
  Let $M_(upright(bold(b))' \, p)^(+)$ be a nontrivial positive minuscule generator of $A_F$,
    and put $upright(bold(b)) = \( upright(bold(b))' \, 0 \)$.
    If $hat(x)_(i a)$ denotes an enlarged gauge Chern root, the group isomorphism above identifies the original
    root with $x_(i a) = hat(x)_(i a) - xi$. Let $p^arrow.t$ be the polynomial obtained from $p$ by these
    substitutions, leaving every flavor parameter unchanged. The original generator is then the positive minuscule
    class $M_(upright(bold(b)) \, p^arrow.t)^(+)$. Central translation also expresses it using the complementary
    negative coweight:
  #[#set math.equation(numbering: n => "(8.5)")
   $ M_(upright(bold(b)) \, p^arrow.t)^(+) = z thin M_(upright(bold(d)) - upright(bold(b)) \, p^arrow.t)^(-) .
     $ <eq:complementary-monopoles>]
  The two coweights have the same Weyl stabilizer, so the same polynomial $p^arrow.t$ is an admissible dressing on
    both sides. It need not depend only on the variables selected by the complementary negative coweight;
    Lemma 26 allows all stabilizer-invariant dressings. The equality follows directly from Equation (2.2):
    all matter weights pair trivially with the central coweight,
    and central translation identifies the minuscule orbits and their equivariant tangent bundles.
    Equivalently it follows from convolution with the invertible central class.
    Thus it holds with compatible fundamental-class conventions;
    rescaling minuscule generators changes only a nonzero constant.
  Suppose that this generator has nonzero image in the cocharacter fixed quotient.
    Apply Lemma 26 in the enlarged quiver to $M_(upright(bold(b)) \, p^arrow.t)^(+)$.
    Any word containing a factor of nonzero $hat(nu)$-weight vanishes in that quotient.
    A nonzero image therefore requires a decomposition
  $ upright(bold(b)) = sum_a bold(alpha)_a \, wide bold(alpha)_a in Delta_(hat(Q)) \, wide
    hat(nu) dot.op bold(alpha)_a = 0 . $
  Since $z$ is an invertible element of weight zero, Equation (8.5) implies that
    $M_(upright(bold(d)) - upright(bold(b)) \, p^arrow.t)^(-)$ also survives.
    Applying the negative half of the same lemma yields
  $ upright(bold(d)) - upright(bold(b)) = sum_b bold(beta)_b \, wide bold(beta)_b in Delta_(hat(Q)) \, wide
    hat(nu) dot.op bold(beta)_b = 0 . $
  Both sums are nonempty: $upright(bold(b)) eq.not 0$, while its $oo$-entry is zero and that of $upright(bold(d))$
    is one.
  Together these decompositions express $upright(bold(d))$ as a sum of at least two nonzero dimension vectors
    $bold(gamma)_1 \, dots.h \, bold(gamma)_k$ in $Delta_(hat(Q))$, each orthogonal to $hat(nu)$.
    For each summand choose the point furnished by Lemma 27, with real central parameter $hat(nu)$.
    Use orthogonal decompositions of the vertex spaces and take the direct sum of these points.
    Moment maps are block diagonal on direct sums, so the resulting point has
  $ mu_(bb(C)) = 0 \, wide mu_(bb(R)) = tau_(hat(nu)) . $
  Its stabilizer contains $k$ independent block scalar circles.
  The enlarged reduction is exactly the original framed reduction:
    the extra diagonal scalar is ineffective, its moment equation is redundant, and $hat(nu)$ is trivial on it.
    After dividing by this scalar, the stabilizer still contains a torus of dimension $k - 1 > 0$.
    By the affine Kempf–Ness correspondence at the character level,
    the resulting point is $nu$-semistable in the original zero complex moment fiber #cite(label("King94"))
    Theorem 6.1 and Corollary 6.2. This contradicts the assumed freeness of every such point.
    The argument also applies when the stable locus is empty:
    it would then produce a semistable point where none exists.
  Every nontrivial positive minuscule generator therefore vanishes.
    For a negative generator use the identity $M_(upright(bold(b)) \, p^arrow.t)^(-) =
    z^(- 1) M_(upright(bold(d)) - upright(bold(b)) \, p^arrow.t)^(+)$ and interchange the two halves in the
    argument; it vanishes as well. By Proposition 3, the ideal they generate is the ideal generated by the nonzero
    full topological-charge spaces. It is therefore contained in the ideal generated by the nonzero $nu$-weight
    spaces. For $m eq.not 0$, the $nu$-weight space $\( A_F \)_m$ is a sum of nonzero topological-charge spaces.
    This gives the opposite inclusion. The ideals coincide, proving the proposition.
    If all gauge ranks are zero there are no such generators and the same conclusion is immediate. ◻
]

=== Completion of the proof <completion-of-the-proof>

#proof[
  Proposition 28 and Theorem 24 give graded $R$-algebra isomorphisms
  $ bb(C) \[ Y_(frak(f))^nu \] arrow.r_(med tilde.op med)^beta B_F arrow.r_(med tilde.op med)^alpha
    H_F^(*) \( X \) \, wide \( alpha compose beta \) compose phi.alt_C = phi.alt_H . $
  Thus $ker phi.alt_C = ker phi.alt_H$. The inverse of $alpha compose beta$ is the isomorphism in Theorem 1;
    surjectivity of $phi.alt_H$ makes it the unique isomorphism compatible with the coefficient maps.
    All quotient rings are scheme-theoretic and retain their nilpotents. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
