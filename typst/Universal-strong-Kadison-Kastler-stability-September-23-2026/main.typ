#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Universal strong Kadison--Kastler stability]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a von Neumann algebra $M subset.eq cal(B) \( H \)$, write $M_1$ for its closed operator-norm unit ball. The Kadison–Kastler distance between two such algebras is

#[#set math.equation(numbering: n => "(1.1)")
 $ d \( M \, N \) = max {sup_(x in M_1) inf_(y in N_1) lr(bar.v.double x - y bar.v.double) \, quad sup_(y in N_1) inf_(x in M_1) lr(bar.v.double x - y bar.v.double)} . $ <eq:kk-definition>]

Kadison and Kastler introduced this metric in 1972 #cite(label("KadisonKastler1972")). Their perturbation problem asks whether closeness of the unit balls forces spatial isomorphism, implemented by a unitary close to the identity. We prove the uniform form of this assertion.

#thm([Theorem 1.1.])[
  (Strong Kadison–Kastler stability).  #emph[For every $epsilon > 0$ there is $delta = delta \( epsilon \) > 0$ such that the following holds. If $H$ is any complex Hilbert space and $M \, N subset.eq cal(B) \( H \)$ are unital von Neumann algebras with identity $I_H$ and $d \( M \, N \) < delta$, there is a unitary $u in cal(B) \( H \)$ satisfying 
$ u M u^(*) = N \, #h(2em) lr(bar.v.double u - I_H bar.v.double) < epsilon . $

]
] <thm:main>

The tolerance is independent of the algebras, their type, their representations, and the cardinalities of their preduals and Hilbert spaces. Thus 1 resolves the strong Kadison–Kastler conjecture positively. Its hypothesis concerns the ordinary distance (1.1).

=== 1.1 Historical context <historical-context>

Early positive results treated type I algebras: Phillips proved spatial isomorphism, and Christensen obtained a conjugating unitary close to the identity #cite(label("Phillips1974")) #cite(label("Christensen1975")). The work of Christensen, Johnson, and Raeburn–Taylor established the amenable case #cite(label("Christensen1977")) #cite(label("Johnson1977")) #cite(label("RaeburnTaylor1977")). Christensen subsequently developed the one-sided theory of near inclusions: an amenable von Neumann algebra sufficiently nearly contained in another can be moved into it by a small unitary #cite(label("Christensen1980")). His earlier work also treated close von Neumann subalgebras of a common finite von Neumann algebra #cite(label("Christensen1977II")). The common finite ambient algebra is an essential hypothesis of that result; merely assuming that both represented algebras are finite gives a different problem. In a different common-ambient setting, Ino proved near-identity unitary conjugacy for sufficiently close subalgebras of a countably decomposable ambient algebra when both admit conditional expectations of finite probabilistic index from that algebra #cite(label("Ino2016")) Theorem 3.2.

The corresponding development for $C^(*)$-algebras clarifies the role of the conclusion. Christensen, Sinclair, Smith, White, and Winter proved that sufficiently close $C^(*)$-algebras acting on a separable Hilbert space are spatially isomorphic if one of them is norm separable and nuclear #cite(label("CSSWW2010")) #cite(label("CSSWW2012")). Johnson’s examples exclude a uniform bound on the displacement of an implementing unitary that tends to zero with the algebra distance; they do not exclude spatial isomorphism #cite(label("Johnson1982")).

For nonamenable von Neumann algebras, Cameron, Christensen, Sinclair, Smith, White, and Wiggins constructed strongly stable factors of the form $\( L^oo \( X \) times.r upright("SL")_n \( bb(Z) \) \) overline(⊗) R$, where $n gt.eq 3$, the action is free, ergodic, and probability preserving on a standard nonatomic probability space, and $R$ is the hyperfinite type $upright("II")_1$ factor #cite(label("CCSSWW2012")) #cite(label("CCSSWW2014")). Their proof combines amenable near-inclusion methods, a common standard representation, and bounded cohomology. Their later work transfers property $Gamma$ and Cartan structure between sufficiently close type $upright("II")_1$ factors with separable predual, and also studies stability of solidity, strong solidity, and tensor-product structure #cite(label("CCSSWW2017")).

The passage between representations is tied to Kadison’s similarity problem: whether a bounded homomorphism from a $C^(*)$-algebra into $cal(B) \( H \)$ is conjugate by an invertible operator to a $*$-homomorphism. Christensen’s work on property $Gamma$ factors provides a foundational special case #cite(label("Christensen1986")) #cite(label("Christensen2001")). Christensen, Sinclair, Smith, and White established perturbation results for the similarity property and operator-algebraic invariants #cite(label("CSSW2010")); Cameron and collaborators then proved that the similarity property is equivalent to continuity of commutants, with the required uniformity over representations #cite(label("CCSSWW2013")). These results explain why ordinary norm closeness, control at all matrix levels, and implementation on the original Hilbert space must be kept distinct throughout a proof of strong stability. The companion manuscript #cite(label("OpenAI2026Similarity")) also proves a uniform commutator estimate, using invariant tensors and a free-corner Hankel test. The amplification argument here instead uses free-word randomization and is proved independently. Neither commutator estimate alone constructs a nearby multiplicative correspondence between two algebras; Appendix 10 compares their scope and this remaining perturbation step.

The unit-ball metric supplies nearby elements but does not specify a linear or multiplicative correspondence. We must construct such a correspondence and control its implementation on the given Hilbert space, with estimates independent of the algebras and representations.

=== 1.2 Proof overview <proof-overview>

We first work on separable Hilbert spaces. For finite factors, two arguments meet in 5. The first supplies matrix norm control: for a separably acting type $upright("II")_1$ factor $M subset.eq cal(B) \( H \)$ and $h = h^(*)$, 8 bounds all matrix amplifications of $x mapsto \[ h \, x \]$ by an absolute multiple of its ordinary operator norm. It combines Haagerup’s cyclic similarity estimate #cite(label("Haagerup1983")) and Popa’s independence theorem for tracial ultraproducts #cite(label("Popa2014")) with a free-word randomization argument. The constant is independent of matrix size and representation.

A separate argument constructs an isomorphism close in ordinary norm to the inclusion. Using the common-position construction of #cite(label("CCSSWW2014")) Lemma 4.10, we move the factors to a tracial representation in which one vector represents both traces, and the left and right actions of a common hyperfinite subfactor $R$ agree. The inclusion is irreducible, meaning $R' ∩ M = bb(C) I$.

For a countable strongly dense subgroup $G$ of the unitary group of $M$, choose nearby unitaries $v_g in N$. Their multiplication errors are uniformly small. Section 4 constructs a probability space $D$ with an amenable $G$-action preserving null sets. An adaptation of the averaging and polar-correction method for approximate representations #cite(label("Kazhdan1982")) #cite(label("BurgerOzawaThom2013")) corrects the nearby unitaries to measurable fields $W_g : D arrow.r cal(U) \( N \)$ satisfying

$ W_g \( x \) W_h \( g^(- 1) x \) = W_(g h) \( x \) . $

Here $G$ need not be amenable: the correction produces a cocycle over its amenable action, not a representation on the original space. On $D^2$, a tracial averaging argument and double ergodicity force a suitable equivariant vector field to be constant. We give the unitary-coefficient double-ergodicity argument in full, using the bilateral random-walk viewpoint of Kaimanovich; Björklund gives the corresponding unitary formulation and another proof #cite(label("Kaimanovich2003")) #cite(label("Bjorklund2014")). The resulting linear bijection preserves adjoints and squares and is close to the inclusion; proximity excludes reversal of multiplication. Transporting this isomorphism back and applying the commutator estimate gives a small unitary on the original Hilbert space.

For infinite factors, a common copy of $cal(B) \( ell^2 \)$ identifies the ordinary gap with the supremum of all matrix gaps. Tensoring with one fixed hyperfinite factor gives type $upright("III")_1$ factors with an irreducible hyperfinite finite subfactor admitting a conditional expectation. This preparation uses Marrakchi’s absorption criterion for a trivial bicentralizer and Haagerup’s construction of the expected hyperfinite subfactor #cite(label("Marrakchi2020")) #cite(label("Haagerup1987")). Houdayer and Marrakchi’s September 2026 preprint proves triviality of the bicentralizer for every type $upright("III")_1$ factor with a faithful normal state #cite(label("HoudayerMarrakchi2026")) Theorem G; the preparation here uses only the earlier absorption criterion.

Small adjustments align the subfactor’s left and right actions and provide a common cyclic separating vector $Omega$ whose two vector states centralize $R$. For either algebra, the closure of $x Omega mapsto x^(*) Omega$ is its Tomita operator. 33 shows that small matrix gaps force its two graphs to be close when the output is multiplied by any $c > 0$, uniformly in $c$. This uniformity permits comparison of the modular actions. A uniform infinitesimal estimate for type $upright("III")$ factors controls norm-continuous paths of unitaries whose conjugations nearly preserve the algebra. Using Arveson’s nest distance formula #cite(label("Arveson1975")), analytic smoothing brings the modular comparison into this setting. Limits of conjugation maps yield, at each time, a unitary whose conjugation preserves one algebra and which is close to the other algebra’s modular unitary. Averaging corrects their multiplication law. Section 7 thereby obtains a single small change of position making the first algebra invariant under that modular group.

We form crossed products using this common action. Their unit balls are close at every matrix size, and continuous decomposition identifies one crossed product as a type $upright("II")_oo$ factor #cite(label("Takesaki1973")) #cite(label("Takesaki2003II")). After aligning matrix units, its finite corner and the corresponding nearby corner are both finite factors. The finite-factor theorem conjugates these corners and hence the crossed products. Averaging gives a unital completely positive (UCP) map between the base algebras, meaning that it preserves the identity and positivity at every matrix size. A state slice gives a second UCP map between the original factors. The criterion in 5, derived from Ricard–Roydor’s multiplication perturbation theorem #cite(label("RicardRoydor2014")) Proposition 3.2, turns both maps into small spatial isomorphisms. It does not require the averaging maps to be normal.

Finally, aligning centers and selecting measurable unitaries assembles the factor results on separable spaces. For an arbitrary Hilbert space, finite sets of operators and vectors lie in suitable separable restrictions. Extend their small conjugating unitaries by the identity. A subnet of the conjugation maps converges pointwise in the weak operator topology to a UCP map. The finite tests put its range in the required algebra, and the same criterion finishes the proof. All tolerances depend only on the requested final unitary displacement.

1 displays how the finite-factor result enters both the finite and infinite cases and how they meet in the final reductions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-2.5, 0), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Commutator amplification#linebreak()Section~3]]])])
  content((2.5, 0), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Boundary and common trace#linebreak()Sections~4--5]]])])
  content((0, -1.65), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite factors on separable spaces#linebreak()Theorem~5.1]]])])
  content((-4, -3.8), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Preparation and modular alignment#linebreak()Sections~6--7]]])])
  content((1, -3.8), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite crossed-product corner#linebreak()and two descents#linebreak()Section~8]]])])
  content((1, -5.8), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[All separably acting factors#linebreak()Theorem~8.4]]])])
  content((-2.5, -7.6), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Common center and#linebreak()measurable assembly#linebreak()Section~9]]])])
  content((2.5, -7.6), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Finite tests on arbitrary $H$#linebreak()Section~9]]])])
  line((-1.742, -0.5), (-0.7576, -1.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((1.742, -0.5), (0.7576, -1.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0.2326, -2.15), (0.7674, -3.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((-2.049, -3.8), (-0.9514, -3.8), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((1, -4.3), (1, -5.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((1.951, -1.65), (3.951, -1.65), (3.951, -5.8), (2.951, -5.8), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0.02778, -6.3), (-1.528, -7.1), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((-0.5486, -7.6), (0.5486, -7.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The finite-factor theorem has two inputs and is reused in the crossed-product argument. The UCP criterion supplies pointwise normalizers in Section 7, both descents in Section 8, and the final limit in Section 9. ],
) <fig:proof>

Section 2 proves the transfer tools. Sections 3–5 establish the finite case. Sections 6–8 treat infinite factors. Section 9 removes the factor and separability assumptions and gathers the final quantifiers. Appendix 10 distinguishes uniformity over representations from uniformity over factors and compares the commutator methods of this paper and the similarity companion.

== 2 Perturbation tools and a completely positive criterion <sec:foundations>

Several steps of the proof produce an averaged map instead of a homomorphism. The main result of this section, 5, turns such a map into a small unitary conjugacy. All constants in this section are independent of the algebras and Hilbert spaces.

=== 2.1 Metrics, amplification, and limits <metrics-amplification-and-limits>

We use the unit-ball formula (1.1) also for unital $C^(*)$-algebras. For $A subset.eq cal(B) \( H \)$, write $cal(U) \( A \)$ for its unitary group, $A' = { T in cal(B) \( H \) : T a = a T upright(" for every ") a in A }$ for its commutant, and $Z \( A \) = A ∩ A'$ for its center. The symbol $A overline(⊗) B$ denotes the spatial von Neumann tensor product.

For a linear map $T : A arrow.r cal(B) \( H \)$, let $T_n$ act entrywise on $M_n \( A \)$, and put $lr(bar.v.double T bar.v.double)_(upright("cb")) = sup_n lr(bar.v.double T_n bar.v.double)$. The same notation for rectangular matrices is obtained by adding zero rows and columns and compressing. For concretely represented von Neumann algebras define

$ d_(upright("cb")) \( A \, B \) = sup_(n gt.eq 1) d \( M_n \( A \) \, M_n \( B \) \) . $

Here every matrix unit ball uses its operator norm on $H^n$. We write $A subset_gamma B$ if there is $gamma' < gamma$ such that every $x in A_1$ has $"dist" \( x \, B \) lt.eq gamma'$; the approximant in $B$ need not be contractive. If $lr(bar.v.double x bar.v.double) lt.eq 1$ and $lr(bar.v.double x - y bar.v.double) lt.eq r$, then

$ y_0 = frac(y, max { 1 \, lr(bar.v.double  bar.v.double) y }) in B_1 \, #h(2em) lr(bar.v.double x - y_0 bar.v.double) lt.eq 2 r . $

We use this normalization whenever passing from near inclusions to unit-ball distances. Conversely, a strict upper bound for $d \( A \, B \)$ gives both near inclusions with that bound. For a unitary $v$,

#[#set math.equation(numbering: n => "(2.1)")
 $ d \( A \, v B v^(*) \) & lt.eq d \( A \, B \) + 2 lr(bar.v.double v - I bar.v.double) \,\
d_(upright("cb")) \( A \, v B v^(*) \) & lt.eq d_(upright("cb")) \( A \, B \) + 2 lr(bar.v.double v - I bar.v.double) . $ <eq:gap-adjustment>]

These inequalities follow at every matrix level from $lr(bar.v.double v_n x v_n^(*) - x bar.v.double) lt.eq 2 lr(bar.v.double v - I bar.v.double) lr(bar.v.double  bar.v.double) x$. Also $lr(bar.v.double v_1 dots.h.c v_k - I bar.v.double) lt.eq sum_j lr(bar.v.double v_j - I bar.v.double)$.

Inner products are linear in their first variable. A normal map between von Neumann algebras is an ultraweakly continuous map. A map is #emph[unital completely positive], abbreviated UCP, if it preserves the identity and each of its matrix amplifications is positive. Such maps are completely contractive.

We repeatedly use the following elementary compactness facts. A bounded operator ball is compact in the weak operator topology (WOT). A net of UCP maps with fixed domain and codomain $cal(B) \( H \)$ has a subnet converging pointwise in WOT: use the product of the operator balls indexed by domain elements. The limit is UCP, since linearity, the identity, and every finite matrix positivity inequality pass to the limit. If the maps are within $a$ in cb norm of a fixed map, so is their limit; apply WOT closedness of norm balls at each fixed matrix size. If their values lie in a fixed von Neumann algebra, the limit has the same property. Normality need not pass to this limit and will not be required.

For clarity, $O \( t \)$ denotes a bound $C t$ for an absolute constant $C$, valid below an absolute positive threshold for $t$. Constants may change between displays. A function tending to zero will always be chosen uniformly over the explicitly stated class of algebras.

=== 2.2 The amenable embedding theorem <the-amenable-embedding-theorem>

The following form of Christensen’s theorem supplies the small changes of position used in the proof #cite(label("Christensen1980")).

#thm([Theorem 2.1.])[
  (Amenable near inclusions).  #emph[Let $R \, Q subset.eq cal(B) \( H \)$ be von Neumann algebras with identity $I$, with $R$ amenable. If $R subset_gamma Q$ and $gamma < 1 \/ 100$, there is a unitary $v in \( R union Q \)''$ such that 
$ v R v^(*) subset.eq Q \, #h(2em) lr(bar.v.double v - I bar.v.double) lt.eq 150 gamma . $

 If also $Q subset_gamma R$ and $gamma < 1 \/ 101$, the same conclusion holds with $v R v^(*) = Q$.]
] <thm:amenable>

This is #cite(label("CCSSWW2014")) Theorem 3.3(i), with its strict near-inclusion convention. The location of $v$ in $\( R union Q \)''$ is useful: any algebra commuting with both $R$ and $Q$ also commutes with the change of position. We apply the theorem to abelian algebras, hyperfinite finite factors, and type $upright(I)$ algebras, all of which are amenable.

=== 2.3 From commutators to intertwiners <from-commutators-to-intertwiners>

For $h in cal(B) \( H \)$ write $"ad"_h \( x \) = \[ h \, x \] = h x - x h$.

#thm([Lemma 2.2.])[
  #emph[For every unital von Neumann algebra $A subset.eq cal(B) \( H \)$ and $h in cal(B) \( H \)$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ "dist" \( h \, A' \) lt.eq lr(bar.v.double "ad"_h \|_A bar.v.double)_(upright("cb")) . $ <eq:commutant-cb>]

 Consequently $d_(upright("cb")) \( A \, B \) lt.eq gamma$ implies $d \( A' \, B' \) lt.eq 4 gamma$.]
] <lem:commutant-cb>

#proof[
  Since $A'$ is weak-star closed, its preannihilator in the trace class computes the quotient norm $"dist" \( h \, A' \)$. Let $phi$ be a trace-class functional of norm at most one vanishing on $A'$. A singular-value decomposition gives vectors $xi \, eta in ell^2 ⊗ H$, each of norm at most one, with
  $ phi \( x \) = chevron.l \( I ⊗ x \) xi \, eta chevron.r quad \( x in cal(B) \( H \) \) . $
  This uses only countably many vectors even when $H$ is nonseparable. Let $p$ project onto $overline(\( I ⊗ A' \) xi)$. This subspace reduces $I ⊗ A'$, so every matrix entry of $p$ belongs to $A$. Moreover $p xi = xi$ and $p eta = 0$. Therefore
  $ phi \( h \) = chevron.l \[ I ⊗ h \, p \] xi \, eta chevron.r . $
  If $q_n$ projects onto the first $n$ coordinates of $ell^2$, the compression of this commutator is $\[ I_n ⊗ h \, q_n p q_n \]$, of norm at most $lr(bar.v.double "ad"_h \|_A bar.v.double)_(upright("cb"))$ because $q_n p q_n in M_n \( A \)_1$. Testing on finitely supported vectors and then using density proves the same bound for the full commutator. Taking the supremum over $phi$ proves (2.2).
  For $h in A'_1$, approximate each contraction in $M_n \( B \)$ by one in $M_n \( A \)$, with arbitrary slack above $gamma$. It follows that $lr(bar.v.double "ad"_h \|_B bar.v.double)_(upright("cb")) lt.eq 2 gamma$. The first assertion gives distance at most $2 gamma$ to $B'$, and normalization of approximants gives distance at most $4 gamma$ to $B'_1$. Reverse the algebras to finish. ◻
]

#thm([Lemma 2.3.])[
  (Close representations).  #emph[Let $rho \, theta : P arrow.r cal(B) \( H \)$ be normal unital $*$-representations of a von Neumann algebra. If $lr(bar.v.double rho - theta bar.v.double)_(upright("cb")) lt.eq e < 1 \/ 4$, there is a unitary $u in cal(B) \( H \)$ with 
$ u rho \( x \) u^(*) = theta \( x \) quad \( x in P \) \, #h(2em) lr(bar.v.double u - I bar.v.double) lt.eq 4 e . $

]
] <lem:paired>

#proof[
  If $e = 0$, take $u = I$. Otherwise let
  $ pi \( x \) = mat(delim: "(", rho \( x \), 0; 0, theta \( x \)) \, #h(2em) S = mat(delim: "(", 0, I; I, 0) . $
  The von Neumann image $pi \( P \)$ has the quotient matrix norms of $P$. The commutator of $S$ with $pi$ has cb norm at most $e$, hence the same is true on $pi \( P \)$ by quotient lifts with arbitrarily small norm slack. By 3 choose $D in pi \( P \)'$ with $lr(bar.v.double D - S bar.v.double) < 2 e$. Its lower off-diagonal block $T$ satisfies
  $ T rho \( x \) = theta \( x \) T \, #h(2em) lr(bar.v.double T - I bar.v.double) < 2 e < 1 . $
  Thus $T$ is invertible and $T^(*) T$ commutes with $rho \( P \)$. Its polar unitary $u = T \| T \|^(- 1)$ intertwines the representations. The singular values of $T$ lie between $1 - r$ and $1 + r$, where $r = lr(bar.v.double T - I bar.v.double)$, so
  $ lr(bar.v.double u - I bar.v.double) lt.eq lr(bar.v.double u - T bar.v.double) + r = lr(bar.v.double I - \| T \| bar.v.double) + r lt.eq 2 r < 4 e . $
  ◻
]

=== 2.4 The completely positive criterion <the-completely-positive-criterion>

The norm relevant to perturbing a product is the completely bounded norm on the Haagerup tensor product. We recall only the form needed here. For a bilinear map $b : P times P arrow.r P$, it is the least $K$ such that, at all rectangular sizes,

#[#set math.equation(numbering: n => "(2.3)")
 $ ∥[sum_(j = 1)^r b \( x_(i j) \, y_(j k) \)]_(i \, k)∥ lt.eq K lr(bar.v.double  bar.v.double) X lr(bar.v.double  bar.v.double) Y \, quad X in M_(p \, r) \( P \) \, quad Y in M_(r \, q) \( P \) . $ <eq:haagerup-products>]

Indeed the matrix Haagerup norm is the infimum of $lr(bar.v.double  bar.v.double) X lr(bar.v.double  bar.v.double) Y$ over such row-column factorizations. We write $lr(bar.v.double  bar.v.double) b_(upright("cb"))$ for this norm as well.

Write $m_P \( x \, y \) = x y$ for the original multiplication on $P$. Correction of multiplication by cohomological methods goes back to Johnson and Raeburn–Taylor #cite(label("Johnson1977")) #cite(label("RaeburnTaylor1977")). We use the completely bounded version supplied by Ricard–Roydor’s multiplication perturbation theorem #cite(label("RicardRoydor2014")) Proposition 3.2: on a von Neumann algebra $P$, an associative product $m$ with $lr(bar.v.double m - m_P bar.v.double)_(upright("cb")) lt.eq 1 \/ 11$ admits a cb linear isomorphism $L$ with

$ L \( m \( x \, y \) \) = L \( x \) L \( y \) \, #h(2em) lr(bar.v.double L - "id" bar.v.double)_(upright("cb")) lt.eq 10 lr(bar.v.double m - m_P bar.v.double)_(upright("cb")) . $

If $m \( x \, y \)^(*) = m \( y^(*) \, x^(*) \)$, $L$ can preserve the involution. There is no normality or separability assumption on the new product.

#thm([Proposition 2.4.])[
  (UCP criterion).  #emph[Let $P \, Q$ be von Neumann algebras, let $rho : P arrow.r cal(B) \( H \)$ be a faithful normal unital representation, and let $Q subset.eq cal(B) \( H \)$ have the same identity. Suppose that $F : P arrow.r Q$ is UCP and 
$ lr(bar.v.double F - rho bar.v.double)_(upright("cb")) lt.eq e < 10^(- 3) \, #h(2em) sup_(y in Q_1) "dist" \( y \, rho \( P \)_1 \) lt.eq g \, #h(2em) g + e < 1 . $

 Then there is a normal unital $*$-isomorphism $theta : P arrow.r Q$ and a unitary $u in cal(B) \( H \)$ such that 
$ lr(bar.v.double theta - rho bar.v.double)_(upright("cb")) lt.eq 32 e \, #h(2em) u rho \( x \) u^(*) = theta \( x \) med \( x in P \) \, #h(2em) lr(bar.v.double u - I bar.v.double) lt.eq 128 e . $

 The map $F$ need not be normal.]
] <prop:ucp>

#proof[
  Complete isometry of $rho$ gives $lr(bar.v.double F_n \( X \) bar.v.double) gt.eq \( 1 - e \) lr(bar.v.double  bar.v.double) X$ at every matrix size. Thus $F$ is injective, its range $V$ is norm closed, and $lr(bar.v.double F^(- 1) : V arrow.r P bar.v.double)_(upright("cb")) lt.eq \( 1 - e \)^(- 1)$. For $y in Q_1$, match $y$ with $rho \( x \)$ for $x in P_1$, allowing arbitrary slack, to obtain $"dist" \( y \, V \) lt.eq g + e < 1$. If $V$ were proper, the quotient map $Q arrow.r Q \/ V$ would have norm one, contradicting this bound on $Q_1$. Hence $F$ is onto.
  Transport multiplication from $Q$ to $P$:
  $ m \( x \, y \) = F^(- 1) \( F \( x \) F \( y \) \) . $
  It is associative and preserves the involution. For rectangular $X \, Y$, insert $rho \( X Y \) = rho \( X \) rho \( Y \)$ to see that
  $ lr(bar.v.double F \( X Y \) - F \( X \) F \( Y \) bar.v.double) lt.eq 3 e lr(bar.v.double  bar.v.double) X lr(bar.v.double  bar.v.double) Y . $
  Here the first difference is bounded by $e lr(bar.v.double X Y bar.v.double)$ and the product difference by $2 e lr(bar.v.double  bar.v.double) X lr(bar.v.double  bar.v.double) Y$, since $F$ and $rho$ are complete contractions. Equation (2.3) therefore gives
  $ q := lr(bar.v.double m - m_P bar.v.double)_(upright("cb")) lt.eq frac(3 e, 1 - e) < 1 / 11 . $
  The cited theorem gives an involution-preserving $L$ with $lr(bar.v.double L - "id" bar.v.double)_(upright("cb")) lt.eq lambda := 30 e \/ \( 1 - e \) < 1$. Then $theta = F L^(- 1)$ is a bijective $*$-homomorphism, and
  $ lr(bar.v.double theta - rho bar.v.double)_(upright("cb")) lt.eq e + lr(bar.v.double L^(- 1) - "id" bar.v.double)_(upright("cb")) lt.eq e + frac(lambda, 1 - lambda) = e + frac(30 e, 1 - 31 e) lt.eq 32 e . $
  Bijective multiplicativity makes $theta$ unital. A $*$-isomorphism between von Neumann algebras is an order isomorphism on their selfadjoint parts, so it preserves bounded increasing suprema and is normal. Apply 4, since $32 e < 1 \/ 4$. When $e = 0$, the preceding range argument gives $Q = rho \( P \)$ directly. ◻
]

We will use this criterion both to descend from a tensor product and to replace a pointwise weak limit by a spatial isomorphism. Its quantitative conclusion depends only on the cb error of the map; the ordinary reverse gap supplies surjectivity.

=== 2.5 Tensor products and averaging <tensor-products-and-averaging>

#thm([Lemma 2.5.])[
  #emph[Let $A \, B subset.eq cal(B) \( H \)$ be unital von Neumann algebras with $d_(upright("cb")) \( A \, B \) lt.eq gamma$. If $K$ is separable, then 
$ d_(upright("cb")) \( A overline(⊗) cal(B) \( K \) \, B overline(⊗) cal(B) \( K \) \) lt.eq gamma . $

 If $D subset.eq cal(B) \( K \)$ is a von Neumann algebra whose commutant is the strong closure of increasing finite-dimensional unital algebras, then 
$ d_(upright("cb")) \( A overline(⊗) D \, B overline(⊗) D \) lt.eq gamma . $

]
] <lem:tensor-gap>

#proof[
  Compress a contraction of $M_n \( A overline(⊗) cal(B) \( K \) \)$ by increasing finite-rank projections on $K$. In a corner of rank $r$, choose an opposite contraction in $M_(n r) \( B \)$ within $gamma$ plus arbitrarily small slack, and extend it by zero on the complement. The compressions of the original contraction converge strongly to it. A bounded WOT cluster of the opposite contractions is in $M_n \( B overline(⊗) cal(B) \( K \) \)_1$ and is within $gamma$, by WOT closedness of the norm bound, choosing the approximation slack to tend to zero along the compressions. Reverse the argument and take the supremum over $n$.
  Now start with a contraction in $M_n \( A overline(⊗) D \)$. The first assertion supplies a nearby contraction in $M_n \( B overline(⊗) cal(B) \( K \) \)$. Average it by conjugation over the unitary group of each finite-dimensional stage of $D'$. The input commutes with these groups, so the bound is preserved. A WOT cluster of the averages commutes with $D'$ and still lies in $M_n \( B overline(⊗) cal(B) \( K \) \)$. The von Neumann tensor commutation theorem #cite(label("BlackadarOperatorAlgebras")) Theorem III.4.5.8 and Corollary III.4.5.9, pp. 319–320 places it in $M_n \( B overline(⊗) D \)$. Reverse and amplify as before. ◻
]

#thm([Lemma 2.6.])[
  (Invariant operator means).  #emph[Let $G$ be a discrete amenable group and $m$ a left invariant mean on $ell^oo \( G \)$: thus $m$ is a positive unital linear functional with $m \( f \( h^(- 1) thin dot.op \) \) = m \( f \)$ for every $h in G$. For a bounded family $T_g in cal(B) \( K \)$, define 
$ chevron.l \( m_g T_g \) xi \, eta chevron.r = m_g chevron.l T_g xi \, eta chevron.r . $

 This averaging map from bounded operator families to $cal(B) \( K \)$ is UCP, commutes with multiplication on either side by a fixed operator, and preserves weak-operator closed linear subspaces. If $lr(bar.v.double T_g - T bar.v.double) lt.eq a$ for every $g$, then $lr(bar.v.double m_g T_g - T bar.v.double) lt.eq a$, also at rectangular matrix levels. No measurability of the family is required.]
  #emph[For a unitary representation $g mapsto V_g$ on $K$, the map 
$ E_V \( T \) = m_g V_g T V_g^(*) #h(2em) \( T in cal(B) \( K \) \) $

 is a UCP projection onto ${ V_g : g in G }'$. It preserves every von Neumann algebra invariant under these conjugations. More generally, for an action by automorphisms $alpha_g$ on a von Neumann algebra $P$, the formula 
$ phi \( E \( x \) \) = m_g phi \( alpha_g \( x \) \) #h(2em) \( phi in P_(*) \) $

 defines a UCP map onto $P^G$ fixing that algebra. These averaging maps need not be normal.]
] <lem:invariant-mean>

#proof[
  The coefficient formula defines a bounded sesquilinear form and hence an operator. Positivity at every matrix size and unitality follow by applying the positive scalar mean to matrix quadratic forms; the domain has the pointwise operations on bounded operator families. Fixed left and right factors pass through the coefficient formula. Testing the linear equations defining a weak-operator closed subspace proves range preservation. Testing vector coefficients at each rectangular size gives the norm bound. For the action average, left invariance makes the range invariant, while averaging fixes each invariant operator. An invariant algebra is preserved by the preceding range property. Predual duality gives the same argument for the general action on $P$, including preservation of matrix norm bounds. ◻
]

For $G = bb(R)$ with the discrete topology, an invariant mean is obtained as a weak-star cluster point of uniform averages on finite boxes in finitely generated subgroups. Direct the choices by a finite set of translations and an error tolerance. Each subgroup is free abelian, and the relative boundary of its boxes tends to zero for every prescribed translation; the cluster is therefore positive, unital, and translation invariant.

The boundary means in 4 require a separate construction: their equivariance involves a nonsingular action and their module coefficients vary over the boundary space.

== 3 Uniform amplification of commutators <sec:amplification>

The finite-factor argument will first produce an isomorphism that is close to the given representation in operator norm. To implement it by a small unitary, we need the same control at every matrix level. The following estimate supplies that passage.

#thm([Theorem 3.1.])[
  (Uniform amplification).  #emph[There is an absolute constant $C_(upright("amp"))$ such that, for every type $upright("II")_1$ factor $M subset.eq cal(B) \( H \)$ on a separable Hilbert space and every selfadjoint $h in cal(B) \( H \)$, 
$ lr(bar.v.double "ad"_h \|_M bar.v.double)_(upright("cb")) lt.eq C_(upright("amp")) lr(bar.v.double "ad"_h \|_M bar.v.double) . $

 The constant is independent of $M$, its representation, and $H$.]
] <thm:amplification>

We first control columns by the cyclic similarity theorem. A free-word estimate then permits us to apply this column bound to randomized matrix coefficients. The randomization also recovers a fixed positive multiple of the identity in a weak limit; this will detect every matrix commutator. The auxiliary matrix sizes depend on the matrix level being tested, but every estimate that survives to the conclusion is absolute.

=== 3.1 Columns and trace limits <columns-and-trace-limits>

For $a_1 \, dots.h \, a_l in cal(B) \( H \)$, write $lr(bar.v.double \( a_i \)_i bar.v.double)_(upright("col")) = lr(bar.v.double sum_i a_i^(*) a_i bar.v.double)^(1 \/ 2)$.

#thm([Lemma 3.2.])[
  (Column estimate).  #emph[Let $A subset.eq cal(B) \( H \)$ be a unital $C^(*)$-algebra, let $h in cal(B) \( H \)$, and put $delta = lr(bar.v.double "ad"_h \|_A bar.v.double)$. Then 
$ lr(bar.v.double \( \[ h \, a_i \] \)_i bar.v.double)_(upright("col")) lt.eq 8 delta thin lr(bar.v.double \( a_i \)_i bar.v.double)_(upright("col")) #h(2em) \( a_1 \, dots.h \, a_l in A \) . $

]
] <lem:column-commutator>

#proof[
  There is nothing to prove if $delta = 0$. Otherwise we use the triangular homomorphism associated with a derivation, as in #cite(label("Haagerup1983")) p. 216:
  $ Phi \( a \) = mat(delim: "(", a, delta^(- 1) \[ h \, a \]; 0, a) quad \( a in A \) . $
  This is a unital homomorphism with $lr(bar.v.double Phi bar.v.double) lt.eq 2$. For $xi in H$, the closed subspace
  $ K_xi = overline({ Phi \( a \) \( 0 \, xi \) : a in A }) subset.eq H xor H $
  is invariant for $Phi \( A \)$, and the restricted homomorphism is cyclic. Haagerup’s cyclic similarity theorem gives $lr(bar.v.double Phi \|_(K_xi) bar.v.double)_(upright("cb")) lt.eq lr(bar.v.double Phi \|_(K_xi) bar.v.double)^3 lt.eq 8$; see #cite(label("Haagerup1983")) Theorem 1.1 and its proof, pp. 217, 225. Apply its column amplification to $\( 0 \, xi \) in K_xi$, and retain the upper component of each output. This gives
  $ (sum_i lr(bar.v.double \[ h \, a_i \] xi bar.v.double)^2)^(1 \/ 2) lt.eq 8 delta thin lr(bar.v.double \( a_i \)_i bar.v.double)_(upright("col")) lr(bar.v.double xi bar.v.double) . $
  Taking the supremum over unit vectors proves the claim. ◻
]

We use normalized traces on finite factors and the standard comparison and subdivision of projections by trace #cite(label("BlackadarOperatorAlgebras")) III.1.7.9–10, p. 257; III.2.5.4(iii) and Theorem III.2.5.7, p. 279. For a finite von Neumann algebra $\( P \, tau \)$, put $lr(bar.v.double x bar.v.double)_2 = tau \( x^(*) x \)^(1 \/ 2)$ and $lr(bar.v.double x bar.v.double)_1 = tau \( \| x \| \)$. Fix a free ultrafilter $omega$ on $bb(N)$. The tracial ultrapower $P^omega$ is the quotient of the bounded sequences in $P$ by those with $lim_(j arrow.r omega) lr(bar.v.double x_j bar.v.double)_2 = 0$; its trace is $tau_omega \( \( x_j \)_omega \) = lim_(j arrow.r omega) tau \( x_j \)$. We identify $P$ with its constant sequences.

#thm([Lemma 3.3.])[
  (Transfer from the trace to a normal representation).  #emph[Let $P subset.eq cal(B) \( K \)$ be a finite von Neumann algebra with faithful normal trace $tau$.]
  + #emph[If $\( x_j \)$ is bounded and $lim_(j arrow.r omega) lr(bar.v.double x_j bar.v.double)_2 = 0$, then $lim_(j arrow.r omega) lr(bar.v.double x_j xi bar.v.double) = 0$ for every $xi in K$.]
  + #emph[If $x = \( x_j \)_omega in P^omega$, then the weak-operator ultralimit of $x_j$ in this representation is $E_P \( x \)$, where $E_P : P^omega arrow.r P$ is the trace-preserving conditional expectation.]
] <lem:trace-transfer>

#proof[
  The functionals $a mapsto tau \( b a \)$, $b in P$, are norm dense in the predual $P_(*)$. Indeed, their annihilator in $\( P_(*) \)^(*) = P$ is zero, by faithfulness of the trace, so Hahn–Banach gives the density. For a normal vector functional $phi$, approximate $phi$ in norm by one of these functionals. If $lr(bar.v.double x_j bar.v.double) lt.eq K_0$, then
  $ \| phi \( x_j^(*) x_j \) \| lt.eq K_0^2 lr(bar.v.double phi - tau \( b thin dot.op \) bar.v.double) + lr(bar.v.double b bar.v.double) lr(bar.v.double x_j bar.v.double)_2^2 . $
  This proves (i). For (ii), the defining identity of the conditional expectation gives
  $ lim_(j arrow.r omega) tau \( b x_j \) = tau_omega \( b x \) = tau \( b E_P \( x \) \) #h(2em) \( b in P \) . $
  The same predual-density argument, using boundedness, extends the identity to every normal functional. ◻
]

=== 3.2 Free projection words <free-projection-words>

The following estimate controls sums of projection words whose labels have the same multiplicities. In the later randomization, these sums will give coefficients to which we apply the column estimate separately. When the squared estimates are added, each diagonal vector component is counted once for every multiset containing its label. We therefore need squared word-norm bounds with a uniformly bounded sum through each fixed label.

#thm([Lemma 3.4.])[
  (Free projection words).  #emph[For every integer $r gt.eq 1$ there are constants $C_r > 0$ and an integer $d_r gt.eq r$ with the following property. Let $d gt.eq d_r$, and let $\( cal(A) \, tau \)$ be a von Neumann algebra with a faithful normal tracial state. Suppose that $A_1 \, dots.h \, A_r subset cal(A)$ are unital copies of $M_d \( bb(C) \)$ which are scalar free: the trace of a product of centered letters from successively different copies is zero. For each $j$, let $\( e_a^(\( j \)) \)_(a = 1)^d$ be the diagonal minimal projections of $A_j$.]
  #emph[For a multiset $W$ of cardinality $r$ drawn from ${ 1 \, dots.h \, d }$, put 
$ B_W = sum_(\( a_1 \, dots.h \, a_r \) in { 1 \, dots.h \, d }^r\
upright("with multiset ") W) e_(a_r)^(\( r \)) dots.h.c e_(a_1)^(\( 1 \)) . $

 Then $lr(bar.v.double B_W bar.v.double) lt.eq beta_W$, where 
#[#set math.equation(numbering: n => "(3.1)")
 $ beta_W = cases(delim: "{", 7 sqrt(\( r - 1 \) !) thin d^(- \( r - 1 \) \/ 2) \, & upright("if all labels in ") W upright(" are distinct") \,, C_r d^(- \( r - 1 \) \/ 2) \, & upright("otherwise") .) $ <eq:fw-beta>]

 The constants and threshold depend only on $r$, not on the ambient algebra, the free copies, or $W$.]
] <lem:free-words>

Every word in $B_W$ ends with a projection $e_a^(\( 1 \))$ whose label occurs in $W$. Thus $B_W$ has right support in the sum of those projections from the first copy, at most $r$ of them. This support bound will let us reduce each coefficient to a column, once the auxiliary matrix dimension is large enough.

#proof[
  We estimate the centered words first, then restore their scalar parts. The decomposition below uses the creation, annihilation, and diagonal actions in the free-product Hilbert space, as in the framework developed by Voiculescu #cite(label("Voiculescu1985")) and the reduced-free-product inequalities of Ricard and Xu #cite(label("RicardXu2006")) Section 1 and Fact 2.6. The corresponding bound for words of fixed length in free groups is Haagerup’s inequality #cite(label("Haagerup1979")) Lemma 1.4. Here the prescribed label multiplicities require the additional tuple-matrix and square-summation estimates proved below.
  ===== 3.2.1 Reduced words and their cuts. <reduced-words-and-their-cuts.>
  We first describe the Hilbert space on which the word norm will be estimated. Replace $cal(A)$ by $W^(*) \( A_1 \, dots.h \, A_r \)$ and use its faithful left representation on $L^2 \( cal(A) \, tau \)$. Set
  $ H_j^compose = L^2 \( A_j \, tau \) ⊖ bb(C) 1 . $
  Freeness identifies this representation space with
  #[#set math.equation(numbering: n => "(3.2)")
   $ cal(F) = bb(C) Omega med xor #h(-0.16667em) xor.big_(ell gt.eq 1 \, med i_1 \, dots.h \, i_ell in { 1 \, dots.h \, r }\
i_t eq.not i_(t + 1)) H_(i_1)^compose ⊗ dots.h.c ⊗ H_(i_ell)^compose . $ <eq:fw-fock>]
  Indeed, map a tensor to the corresponding product applied to $1$. Its inner products are the tensor inner products: in the trace of the adjoint of one reduced word times another, pair the adjacent letters at the junction, split their product into its trace and centered part, and iterate. Freeness eliminates the centered terms until the copy sequences agree and all letters have been paired. Distinct summands are orthogonal. Splitting each letter into its scalar and centered parts shows that reduced words span the algebra generated by the copies, hence a dense subspace of $L^2 \( cal(A) \, tau \)$.
  Write $h_a^(\( j \)) = e_a^(\( j \)) - d^(- 1) 1$. Define the label map
  $ D_j : ell^2 \( { 1 \, dots.h \, d } \) arrow.r H_j^compose \, #h(2em) D_j delta_a = h_a^(\( j \)) . $
  The normalized matrix trace gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ D_j^(*) D_j = 1 / d I - 1 / d^2 upright(bold(1)) upright(bold(1))^(*) \, #h(2em) lr(bar.v.double D_j bar.v.double) lt.eq d^(- 1 \/ 2) \, $ <eq:fw-label-map>]
  where $upright(bold(1))$ is the vector all of whose entries are one.
  Left multiplication by $h_a^(\( j \))$ creates the first letter $h_a^(\( j \))$ on a reduced tensor not beginning in copy $j$. On a tensor $b ⊗ xi$ beginning in that copy, it has two parts: annihilation, equal to $tau \( h_a^(\( j \)) b \) xi$, and preservation of the first leg, with operator
  #[#set math.equation(numbering: n => "(3.4)")
   $ K_a^(\( j \)) = P_j^compose L_(e_a^(\( j \))) P_j^compose - 1 / d I_(H_j^compose) quad upright("on ") H_j^compose . $ <eq:fw-preservation-operator>]
  Here $P_j^compose$ is the orthogonal projection onto $H_j^compose$ inside $L^2 \( A_j \, tau \)$, and $L$ denotes left multiplication. These formulas also apply to the vacuum, on which only creation occurs.
  Consider a fully centered word $h_(a_r)^(\( r \)) dots.h.c h_(a_1)^(\( 1 \))$. The rightmost letter acts first. Since the copy indices $1 \, dots.h \, r$ are distinct, once a creation or preservation occurs, every later operation must be a creation. Thus the word is a sum of cuts of two kinds: $p$ annihilations followed by $q = r - p$ creations, or $p$ annihilations, one preservation, and $q = r - p - 1$ creations.
  For completeness, the domain restrictions in these cuts can be made explicit. For a set $S$ of copy indices, let $cal(F)_(in.not S)$ denote the vacuum plus all reduced tensors whose first copy index is outside $S$. For a cut without preservation put
  $ S_p = #scale(x: 120%, y: 120%)[\(] { p } upright(" if ") p gt.eq 1 #scale(x: 120%, y: 120%)[\)] union #scale(x: 120%, y: 120%)[\(] { p + 1 } upright(" if ") p < r #scale(x: 120%, y: 120%)[\)] \, #h(2em) E_p = cal(F)_(in.not S_p) . $
  Its source and target spaces are canonically embedded copies of
  $ H_1^compose ⊗ dots.h.c ⊗ H_p^compose ⊗ E_p \, #h(2em) H_r^compose ⊗ dots.h.c ⊗ H_(p + 1)^compose ⊗ E_p \, $
  respectively; empty tensor products mean $bb(C)$. Excluding copy $p$ makes the input reduced, and excluding copy $p + 1$ permits the first creation. For a preservation cut put $j = p + 1$ and $E = cal(F)_(in.not { j })$. Its source and target spaces are
  $ H_1^compose ⊗ dots.h.c ⊗ H_p^compose ⊗ H_j^compose ⊗ E \, #h(2em) H_r^compose ⊗ dots.h.c ⊗ H_(j + 1)^compose ⊗ H_j^compose ⊗ E . $
  All embeddings are isometries; a cut is zero on the orthogonal complement of its indicated source space. In particular these restrictions depend on the cut alone and never on the labels.
  ===== 3.2.2 Distinct labels and tuple matrices. <distinct-labels-and-tuple-matrices.>
  We now suppose that $W$ has distinct labels and sum the fully centered words with multiset $W$. In each cut, the annihilation map is the tensor product of $D_1^(*) \, dots.h \, D_p^(*)$, with the identity on the remaining factors. The creation map uses the $D_j$ in decreasing copy order. Their norms are at most $d^(- p \/ 2)$ and $d^(- q \/ 2)$. Between them is a matrix on label tuples, scalar-valued without preservation and operator-valued on $H_j^compose$ with preservation. Tensor order reversals are unitary. Together with the isometric source and target embeddings, this gives a factorization of each cut whose norm is bounded by
  #[#set math.equation(numbering: n => "(3.5)")
   $ d^(- \( p + q \) \/ 2) lr(bar.v.double upright("matrix on label tuples") bar.v.double) . $ <eq:fw-cut-factorization>]
  The tail factor carries the identity throughout.
  Without preservation, the tuple matrix has entry one exactly when the input and output tuples together list $W$. Group tuples by their underlying subsets. Each input subset of size $p$ is paired only with its complementary output subset of size $q$, giving mutually orthogonal all-ones blocks of size $q !$ by $p !$. The matrix norm is therefore $sqrt(p ! q !)$. Summing these cuts gives at most
  #[#set math.equation(numbering: n => "(3.6)")
   $ sum_(p = 0)^r sqrt(p ! \( r - p \) !) thin d^(- r \/ 2) lt.eq \( r + 1 \) sqrt(r !) thin d^(- r \/ 2) . $ <eq:fw-no-preservation>]
  For a preservation cut, $p + q = r - 1$. Summing and replicating over the orders of the input and output tuples introduces a factor $sqrt(p ! q !)$. The remaining matrix is indexed by subsets $B subset W$ of size $p$ on the input and subsets $A subset W$ of size $q$ on the output. Its entry is $K_a^(\( j \))$ when $A ∩ B$ is empty and ${ a } = W \\ \( A union B \)$; other entries vanish.
  To estimate this matrix, first replace $K_a^(\( j \))$ by the projection $L_(e_a^(\( j \)))$ on $L^2 \( A_j \, tau \)$ and call the resulting matrix $T$. For a fixed row $A$, the admissible columns $B$ give distinct missing labels $a$, so their output ranges are orthogonal. For a fixed column $B$, the admissible rows also give distinct $a$, so the projection domains are orthogonal. Thus, for an input $\( xi_B \)_B$,
  $ lr(bar.v.double T xi bar.v.double)^2 = sum_A sum_(B : med A ∩ B = diameter) lr(bar.v.double L_(e_(a \( A \, B \))^(\( j \))) xi_B bar.v.double)^2 lt.eq sum_B lr(bar.v.double xi_B bar.v.double)^2 . $
  Consequently $lr(bar.v.double T bar.v.double) lt.eq 1$. Compressing every input and output leg to $H_j^compose$ preserves this bound. By (3.4), the remaining scalar correction is $d^(- 1)$ times the zero-one matrix of admissible pairs, tensored with $I_(H_j^compose)$. This matrix has $p + 1$ entries in each row and $q + 1$ in each column; Cauchy–Schwarz in each row bounds its norm by $sqrt(\( p + 1 \) \( q + 1 \))$. The preservation tuple matrix therefore has norm at most
  $ sqrt(p ! q !) (1 + sqrt(\( p + 1 \) \( q + 1 \)) / d) lt.eq sqrt(p ! q !) (1 + r / d) . $
  Using (3.5) and summing the preservation cuts gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ (1 + r / d) sqrt(\( r - 1 \) !) thin d^(- \( r - 1 \) \/ 2) sum_(p = 0)^(r - 1) binom(r - 1, p)^(- 1 \/ 2) . $ <eq:fw-preservation-sum>]
  The last sum is at most five, uniformly in $r$. To see this, put $m = r - 1$. For $m = 0 \, 1 \, 2 \, 3$ the sums are respectively $1$, $2$, $2 + 1 \/ sqrt(2)$, and $2 + 2 \/ sqrt(3)$. For $m gt.eq 4$, unimodality of the binomial coefficients gives
  $ sum_(p = 0)^m binom(m, p)^(- 1 \/ 2) lt.eq 2 + 2 / sqrt(m) + \( m - 3 \) sqrt(frac(2, m \( m - 1 \))) lt.eq 3 + sqrt(2) < 5 . $
  ===== 3.2.3 Scalar parts and repeated labels. <scalar-parts-and-repeated-labels.>
  It remains to restore the scalar parts of the projections and to treat repeated labels. We record a bound for a single centered word of length $l gt.eq 1$ in distinct copy positions, with arbitrary labels. The same cuts now have scalar coefficients rather than tuple sums. Each creation or annihilation has norm at most $d^(- 1 \/ 2)$, and each preservation has norm at most one, since it is a compression of multiplication by $e_a - d^(- 1) 1$. There are $l$ preservation cuts and $l + 1$ cuts without preservation. Hence
  #[#set math.equation(numbering: n => "(3.8)")
   $ lr(bar.v.double h_(a_l)^(\( i_l \)) dots.h.c h_(a_1)^(\( i_1 \)) bar.v.double) lt.eq l thin d^(- \( l - 1 \) \/ 2) + \( l + 1 \) d^(- l \/ 2) lt.eq \( 2 l + 1 \) d^(- \( l - 1 \) \/ 2) . $ <eq:fw-single-word>]
  This estimate does not require the labels to be distinct.
  Expand a projection word of length $r$ using $e_a = d^(- 1) 1 + h_a$. A term retaining $l < r$ centered letters contains the scalar factor $d^(- \( r - l \))$. For $1 lt.eq l < r$, (3.8) bounds it by
  $ \( 2 l + 1 \) d^(- r + \( l + 1 \) \/ 2) lt.eq \( 2 l + 1 \) d^(- r \/ 2) . $
  The term retaining no centered letters has norm $d^(- r) lt.eq d^(- r \/ 2)$. Thus the difference between $B_W$ and its fully centered sum has norm at most
  #[#set math.equation(numbering: n => "(3.9)")
   $ r ! H_r d^(- r \/ 2) \, #h(2em) H_r = 1 + sum_(l = 1)^(r - 1) binom(r, l) \( 2 l + 1 \) \, $ <eq:fw-scalar-remainder>]
  because at most $r !$ ordered tuples have multiset $W$.
  For distinct labels, combining (3.6), (3.7), and (3.9) yields
  $ lr(bar.v.double B_W bar.v.double) lt.eq 5 (1 + r / d) sqrt(\( r - 1 \) !) thin d^(- \( r - 1 \) \/ 2) + J_r d^(- r \/ 2) \, #h(2em) J_r = \( r + 1 \) sqrt(r !) + r ! H_r . $
  For example, choose an integer
  $ d_r gt.eq max {5 r \, frac(J_r^2, \( r - 1 \) !)} . $
  Then the two excess terms, after division by $sqrt(\( r - 1 \) !) thin d^(- \( r - 1 \) \/ 2)$, are each at most one, proving the constant seven in (3.1).
  For repeated labels, apply (3.8) to every fully centered summand and use (3.9). Since $d^(- r \/ 2) lt.eq d^(- \( r - 1 \) \/ 2)$, it suffices to take
  $ C_r = r ! #scale(x: 120%, y: 120%)[\(] 2 r + 1 + H_r #scale(x: 120%, y: 120%)[\)] . $
  These choices depend only on $r$ and complete the proof. ◻
]

#thm([Corollary 3.5.])[
  (Sum of squared word bounds through one label).  #emph[For every integer $N gt.eq 1$ there is an integer $d_0 \( N \)$ such that, whenever $d gt.eq d_0 \( N \)$, the constants (3.1) satisfy 
#[#set math.equation(numbering: n => "(3.10)")
 $ max_(1 lt.eq a lt.eq d) sum_(W upright(" a multiset from ") { 1 \, dots.h \, d }\
\| W \| = r \, med a in W) beta_W^2 lt.eq 64 #h(2em) \( 1 lt.eq r lt.eq N \) . $ <eq:fw-through-label>]

 Membership $a in W$ here means that $a$ occurs at least once; each multiset is counted once, regardless of that multiplicity. In particular, for free copies as in 11, the norm bounds and (3.10) hold simultaneously through length $N$ after choosing this one threshold for $d$.]
] <cor:through-label>

#proof[
  Fix $r$ and a label $a$. There are $binom(d - 1, r - 1)$ distinct-label multisets containing $a$, and their contribution is
  $ 49 \( r - 1 \) ! d^(- \( r - 1 \)) binom(d - 1, r - 1) lt.eq 49 . $
  For $r = 1$ this is the entire sum. Suppose $r gt.eq 2$. A repeated-label multiset has support of cardinality $t lt.eq r - 1$. If it contains $a$, its other $t - 1$ support labels can be chosen in $binom(d - 1, t - 1)$ ways. Its positive multiplicities, with total $r$, can be chosen in $binom(r - 1, t - 1)$ ways. Consequently the number of such multisets is at most
  $ sum_(t = 1)^(r - 1) binom(d - 1, t - 1) binom(r - 1, t - 1) lt.eq A_r d^(r - 2) \, #h(2em) A_r = sum_(u = 0)^(r - 2) frac(1, u !) binom(r - 1, u) . $
  Their contribution to (3.10) is therefore at most $C_r^2 A_r \/ d$. Choose $d_0 \( N \)$ to be an integer at least all the $d_r$ for $1 lt.eq r lt.eq N$ and all the numbers $C_r^2 A_r \/ 15$ for $2 lt.eq r lt.eq N$. The latter condition is empty when $N = 1$. The sum is then at most $49 + 15 = 64$, uniformly in $a$ and simultaneously for the finitely many lengths $r lt.eq N$. ◻
]

=== 3.3 Free unitaries with controlled lifts <free-unitaries-with-controlled-lifts>

For varying finite tracial algebras $\( F_j \, tau_j \)$, the same bounded-sequence construction defines the tracial ultraproduct $product_omega \( F_j \, tau_j \)$. A unitary $s$ is #emph[Haar] if $tau \( s^m \) = 0$ for every nonzero $m in bb(Z)$. Two unital subalgebras are #emph[scalar free] if every alternating product of trace-zero elements from them has trace zero. Subalgebras containing $B$ are #emph[free over $B$] if the corresponding assertion holds with the trace replaced by the trace-preserving conditional expectation $E_B$.

#thm([Lemma 3.6.])[
  (Free Haar unitaries with matrix-algebra lifts).  #emph[Let $M subset.eq cal(B) \( H \)$ be a separably acting $upright("II")_1$ factor, let $n gt.eq 1$, and put $P = M_n \( M \)$. For every free ultrafilter $omega$ there is a Haar unitary $s in P^omega$ such that $W^(*) \( s \)$ and the constant copy of $P$ are scalar free. Moreover, $s$ has unitary representatives 
$ s = \( s_j \)_omega \, #h(2em) s_j in cal(U) \( M_n \( R_j \) \) \, $

 where each $R_j subset.eq M$ is a unital full matrix algebra. Consequently, for every $h = h^(*) in cal(B) \( H \)$, with $delta = lr(bar.v.double "ad"_h \|_M bar.v.double)$ and $h_n = I_n ⊗ h$, these representatives satisfy 
#[#set math.equation(numbering: n => "(3.11)")
 $ lr(bar.v.double \[ h_n \, s_j \] bar.v.double) lt.eq 2 delta #h(2em) \( j gt.eq 1 \) . $ <eq:free-lift-commutator>]

]
] <lem:free-lifts>

#proof[
  We construct the free unitary in two stages, then control its representatives.
  ===== 3.3.1 Ultraproduct facts and the independence input. <ultraproduct-facts-and-the-independence-input.>
  We first record the two facts about tracial ultraproducts used in the construction. A tracial ultraproduct of finite factors is a factor. Indeed, in any finite factor $F$ the scalar $tau \( x \) 1$ belongs to the $2$-norm closed convex hull of ${ u x u^(*) : u in cal(U) \( F \) }$. To see this, take the unique element of least $2$-norm in that closed convex hull. It is fixed by every unitary conjugation. It still belongs to $F$, because the convex hull is uniformly bounded in operator norm and the same is true of its $2$-norm closure. It is therefore scalar, and its trace identifies it as $tau \( x \) 1$. In particular,
  $ lr(bar.v.double x - tau \( x \) 1 bar.v.double)_2 lt.eq sup_(u in cal(U) \( F \)) lr(bar.v.double \[ x \, u \] bar.v.double)_2 . $
  If $\( x_j \)_omega$ is central in an ultraproduct, the supremum on the right tends to zero along $omega$: otherwise choosing an almost maximizing unitary in each offending coordinate would give a unitary sequence not commuting with $\( x_j \)_omega$. Thus every central element is scalar. The ultraproduct of matrix factors whose sizes tend to infinity is diffuse, since their projections have traces approaching any prescribed number in $\[ 0 \, 1 \]$. An ultrapower of a $upright("II")_1$ factor is likewise diffuse, since it contains the constant factor. These ultraproducts are therefore $upright("II")_1$ factors.
  Second, every unitary in such an ultraproduct lifts to coordinate unitaries. If $\( x_j \)_omega$ is unitary, then $lim_omega lr(bar.v.double x_j^(*) x_j - 1 bar.v.double)_2 = 0$. Extend the partial isometry in the polar decomposition of $x_j$ to a unitary $u_j$. This extension exists because the two complementary support projections have the same trace in the finite factor. Functional calculus gives
  $ lr(bar.v.double x_j - u_j bar.v.double)_2 = lr(bar.v.double \| x_j \| - 1 bar.v.double)_2 lt.eq lr(bar.v.double x_j^(*) x_j - 1 bar.v.double)_2 \, $
  so $\( u_j \)_omega = \( x_j \)_omega$.
  We use the following form of #cite(label("Popa2014"), form: "prose") Theorem 0.1(b). Let $cal(F) = product_omega F_j$, where the $F_j$ are finite factors with $dim F_j arrow.r oo$, allowing infinite dimensions. For a separable amenable von Neumann subalgebra $B_1 subset.eq cal(F)$, put $Q = B'_1 ∩ cal(F)$ and $D = Q' ∩ cal(F)$. If $cal(X) subset.eq ker E_D$ is a separable linear subspace, there is a diffuse abelian von Neumann algebra $A subset.eq Q$ such that
  #[#set math.equation(numbering: n => "(3.12)")
   $ E_D \( x_0 a_1 x_1 dots.h.c a_r x_r \) = 0 $ <eq:popa-exact-endpoints>]
  whenever $r gt.eq 1$, $x_0 in cal(X) union { 1 }$, $x_1 \, dots.h \, x_r in cal(X)$, and $a_1 \, dots.h \, a_r in A ∩ ker tau$. Here separability is for the $2$-norm, as specified in #cite(label("Popa2014")) Section 1.1. We use the displayed form with its final $x_r$ and establish the additional endpoints needed below.
  In our applications $D$ is a full matrix algebra, $A subset.eq D' ∩ cal(F)$, and $cal(X)$ is selfadjoint. For $a in A$, bimodularity implies $E_D \( a \) in Z \( D \)$, whence $E_D \( a \) = tau \( a \) 1$. Taking adjoints in (3.12) also treats alternating words that start with an $cal(X)$-letter and end with an $A$-letter. For a word with both endpoints in $A$, write
  $ W = a_0 x_1 a_1 dots.h.c x_r a_r \, #h(2em) r gt.eq 1 \, $
  with all displayed letters centered in their respective senses. For $b in D$, traciality and $\[ A \, D \] = 0$ give
  $ tau \( b W \) = tau #scale(x: 120%, y: 120%)[\(] b thin a_r a_0 x_1 a_1 dots.h.c x_r #scale(x: 120%, y: 120%)[\)] . $
  Split $a_r a_0$ into its trace and a trace-zero element of $A$. The latter term vanishes by (3.12) with $x_0 = 1$; the scalar term vanishes by the same formula when $r gt.eq 2$, and by $E_D \( x_1 \) = 0$ when $r = 1$. Thus $E_D \( W \) = 0$. A single centered $A$-letter has already been covered. Hence all alternating endpoint patterns used below are valid.
  ===== 3.3.2 A finite-matrix model. <a-finite-matrix-model.>
  We first construct a matrix-algebra model that is free from $B = M_n \( bb(C) \) ⊗ 1$. In
  $ cal(F)_0 = product_omega #scale(x: 120%, y: 120%)[\(] M_n \( bb(C) \) ⊗ M_j \( bb(C) \) #scale(x: 120%, y: 120%)[\)] $
  apply Popa’s theorem with $B_1 = bb(C) 1$, so that $Q = cal(F)_0$ and $D = bb(C) 1$, and with $cal(X) = B ∩ ker tau$. The resulting diffuse abelian algebra is scalar free from $B$ by the endpoint argument. It contains a Haar unitary $tilde(s)_0$: successively bisect projections in this diffuse abelian algebra to obtain a selfadjoint element uniformly distributed on $\[ 0 \, 1 \]$, and exponentiate it by $t mapsto e^(2 pi i t)$. Choose unitary lifts $tilde(s)_(0 \, j) in M_n \( bb(C) \) ⊗ M_j \( bb(C) \)$.
  For each $j$, choose a unital matrix subalgebra $R_j^0 tilde.equiv M_j \( bb(C) \)$ of $M$. Such a subalgebra is obtained by subdividing $1$ into $j$ projections of trace $1 \/ j$ and choosing matrix units using equivalence of equal-trace projections in a finite factor. The coordinate embeddings $M_n \( bb(C) \) ⊗ M_j \( bb(C) \) arrow.r.hook M_n \( M \)$ preserve the normalized traces and fix $B$. They induce a trace-preserving embedding of $cal(F)_0$ into
  $ cal(P) = P^omega = M_n \( M^omega \) . $
  Thus the image $s_0$ of $tilde(s)_0$ is Haar and scalar free from $B$, and it has representatives $s_(0 \, j) in cal(U) \( M_n \( R_j^0 \) \)$.
  ===== 3.3.3 Freeness from the constant algebra. <freeness-from-the-constant-algebra.>
  Next we move this model into free position relative to the whole constant algebra $P$. The equality $P^omega = M_n \( M^omega \)$ follows entry by entry from $lr(bar.v.double \( x_(a b) \) bar.v.double)_2^2 = n^(- 1) sum_(a \, b) lr(bar.v.double x_(a b) bar.v.double)_2^2$. Since $M^omega$ is a factor,
  $ B' ∩ cal(P) = I_n ⊗ M^omega \, #h(2em) \( B' ∩ cal(P) \)' ∩ cal(P) = B . $
  Put $T = W^(*) \( P \, s_0 \) subset.eq cal(P)$ and $cal(X) = T ∩ ker E_B$. This is a $2$-norm separable selfadjoint linear subspace: the separably acting algebra $P$ is countably generated as a von Neumann algebra, and adjoining one unitary preserves this property. Equivalently, bounded polynomial approximations in a countable generating set give $2$-norm density. Apply Popa’s theorem with $B_1 = B$ and this $cal(X)$. Choose a Haar unitary $w$ in the resulting abelian algebra $A subset.eq I_n ⊗ M^omega$.
  Let $P_1 = W^(*) \( B \, s_0 \)$ and $P_2 = w P_1 w^(*)$. Both contain $B$, since $w$ commutes with $B$. Trace testing against $B$ shows that
  $ E_B \( w y w^(*) \) = E_B \( y \) #h(2em) \( y in cal(P) \) . $
  We claim that $P_2$ and $P$ are free over $B$. In an alternating product of $B$-centered elements from these algebras, write each $P_2$-letter as $w y w^(*)$ with $y in P_1 ∩ ker E_B$. The resulting word alternates letters $w \, w^(*)$ from $A ∩ ker tau$ with letters in $cal(X)$. It has zero $E_B$ by (3.12) and the endpoint extensions proved above. A product consisting of one letter has zero expectation by its assumed centering. This proves the claim.
  Set $s = w s_0 w^(*)$ and $C_s = W^(*) \( s \)$. It is Haar, and $C_s$ is scalar free from $B$, because conjugation by $w$ fixes $B$ and preserves the trace. To deduce scalar freeness from $P$, first observe that
  #[#set math.equation(numbering: n => "(3.13)")
   $ E_B \( c_1 b_1 c_2 dots.h.c b_(m - 1) c_m \) = 0 $ <eq:scalar-free-block>]
  for $m gt.eq 1$, $c_i in C_s ∩ ker tau$, and $b_i in B ∩ ker tau$. Indeed, test the trace against an arbitrary $b in B$ and split $b$ into its scalar and centered parts; scalar freeness makes both resulting traces zero. By bimodularity, arbitrary $B$-letters may also be attached at the two endpoints in (3.13).
  Single letters have trace zero by centering. Now take any mixed alternating scalar-centered word from $C_s$ and $P$, and split each $P$-letter $x$ as
  $ x = \( x - E_B \( x \) \) + E_B \( x \) . $
  The first summand is $B$-centered, and the second lies in $B ∩ ker tau$. In every expanded term, group maximal blocks of $C_s$-letters and the selected $B$-letters. Each such block lies in $P_2$ and is $B$-centered by (3.13), including any $B$-letters at the endpoints. These blocks alternate with $B$-centered $P$-letters, so freeness over $B$ makes their product have zero expectation. If there is no remaining $B$-centered $P$-letter, the term is one block covered by (3.13). Taking traces proves that $C_s$ and $P$ are scalar free.
  ===== 3.3.4 Controlled representatives. <controlled-representatives.>
  Finally write $w = I_n ⊗ z$ with $z in cal(U) \( M^omega \)$, and choose unitary lifts $z_j in cal(U) \( M \)$. Then
  $ R_j = z_j R_j^0 z_j^(*) \, #h(2em) s_j = \( I_n ⊗ z_j \) s_(0 \, j) \( I_n ⊗ z_j^(*) \) $
  have all the asserted properties. For the commutator estimate, average $h$ over the compact unitary group of $R_j$:
  $ h^(\( j \)) = integral_(cal(U) \( R_j \)) u h u^(*) thin d u . $
  This operator commutes with $R_j$, and $lr(bar.v.double h - h^(\( j \)) bar.v.double) lt.eq delta$. Therefore $I_n ⊗ h^(\( j \))$ commutes with $s_j$, and
  $ lr(bar.v.double \[ h_n \, s_j \] bar.v.double) = lr(bar.v.double \[ I_n ⊗ \( h - h^(\( j \)) \) \, s_j \] bar.v.double) lt.eq 2 lr(bar.v.double h - h^(\( j \)) bar.v.double) lt.eq 2 delta . $
  ◻
]

#thm([Lemma 3.7.])[
  (Unitary twists of a free Haar unitary).  #emph[Let $\( F \, tau \)$ be a finite tracial von Neumann algebra, let $P subset.eq F$ be a unital von Neumann subalgebra, and let $s in F$ be Haar and scalar free from $P$. For every $U in cal(U) \( P \)$, both $s U$ and $U s$ are Haar and scalar free from $P$.]
] <lem:haar-twist>

#proof[
  Put $v = s U$. It suffices first to show
  $ tau \( v^k \) = 0 quad \( k eq.not 0 \) \, #h(2em) tau \( v^(k_1) x_1 dots.h.c v^(k_r) x_r \) = 0 $
  for $r gt.eq 1$, nonzero integers $k_i$, and $x_i in P ∩ ker tau$. These cyclic mixed words suffice: if an alternating word starts and ends in the same algebra, cyclically bring those two letters together, split their product into its scalar and centered parts, and induct on word length. Regard an expanded trace word as a cyclic sequence of letters $s$ and $s^(*)$ separated by elements of $P$. The expansion of $\( s U \)^k$ uses $\( s U \)^k$ itself for $k > 0$ and $\( U^(*) s^(*) \)^(- k)$ for $k < 0$. At a transition from an $s$-letter to an $s^(*)$-letter the separator is $U x_i U^(*)$; at a transition from $s^(*)$ to $s$ it is $x_i$. Thus every separator between opposite signs is centered, including the cyclic junction.
  Split every other separator into its scalar and centered parts. In each resulting term, removal of a scalar separator merges only powers of $s$ with the same sign. Consequently every surviving power has nonzero exponent, and every surviving separator is a centered element of $P$. If any separator remains, freeness of $s$ from $P$ gives trace zero. If no separator remains, all signs were the same and the term is a scalar multiple of a nonzero power of $s$, again with trace zero. The argument for $tau \( v^k \)$ is identical, with all signs the same from the outset. This proves the displayed identities.
  Centered Laurent polynomials in $v$ are $2$-norm dense, with bounded approximants, in the centered part of $W^(*) \( v \)$: use the Fejér sums of the corresponding bounded functions on the circle. The displayed identities therefore imply scalar freeness of $W^(*) \( v \)$ and $P$. Here bounded $2$-norm approximation can be passed through each trace word by telescoping and the inequality $\| tau \( a y b \) \| lt.eq lr(bar.v.double a bar.v.double) lr(bar.v.double y bar.v.double)_2 lr(bar.v.double b bar.v.double)$. Finally apply the proved assertion to $s^(*)$ and $U^(*)$ and take adjoints to obtain the assertion for $U s$. ◻
]

=== 3.4 Randomized coefficients <randomized-coefficients>

We now prove 8. Fix $M subset.eq cal(B) \( H \)$ and selfadjoint $h$, and set $delta = lr(bar.v.double "ad"_h \|_M bar.v.double)$. We may assume $delta > 0$. It suffices first to bound the commutator with an arbitrary unitary at an arbitrary matrix level. Fix $n gt.eq 2$, $U in cal(U) \( P \)$, where $P = M_n \( M \)$, and a unit vector $X in H^n$. Write

$ h_n = I_n ⊗ h \, #h(2em) Y = U X \, #h(2em) B = M_n \( bb(C) \) ⊗ 1 . $

The following order of choices will be used throughout this proof:

#[#set math.equation(numbering: n => "(∗)")
 $ R_(*) = 100 pi \, #h(2em) N gt.eq 100 n R_(*)^3 \, #h(2em) k gt.eq N \, #h(2em) d = n k . $ <eq:amplification-choices>]

Here $N$ is an integer, and then $k$ is chosen so large that 12 holds at every length $1 lt.eq r lt.eq N$. Choose a unital matrix algebra $R tilde.equiv M_k \( bb(C) \)$ in $M$. Such an algebra is obtained by subdividing the identity into $k$ equivalent projections of trace $1 \/ k$ and choosing matrix units. Let $e_1 \, dots.h \, e_d$ be the diagonal minimal projections of $D = M_n \( R \)$.

Take the free unitary $s = \( s_j \)_omega$ of 13. Each $s_j$ lies in $M_n \( R_(0 \, j) \)$ for a unital matrix algebra $R_(0 \, j) subset M$, and therefore

#[#set math.equation(numbering: n => "(3.14)")
 $ lr(bar.v.double \[ h_n \, s_j \] bar.v.double) lt.eq 2 delta . $ <eq:cheap-lift-commutator>]

Put $v_j = s_j U$ and $v = s U$. By 14, $v$ is a Haar unitary free from the constant algebra $P$.

Fix an integer $q > 2 N$. Independently and uniformly choose $q$-th roots of unity $theta_1 \, dots.h \, theta_d$, and set

$ t = sum_(a = 1)^d theta_a e_a \, #h(2em) L_j = t v_j . $

For $1 lt.eq r lt.eq N$, consider the unitary expressions

$ Q_(r \, j)^(+) = \( t v_j \)^(r - 1) t \, #h(2em) Q_(r \, j)^(-) = \( v_j^(*) t^(*) \)^r . $

In either expression, group its phase monomials by the multiset $W$ of the $r$ labels that occur. Thus

$ Q_(r \, j)^plus.minus = sum_(\| W \| = r) chi_W^plus.minus \( theta \) K_(W \, j)^plus.minus \, #h(2em) chi_W^plus.minus \( theta \) = product_(a in W) theta_a^(plus.minus 1) . $

Multiplicities are included in the product. Within either sign, these characters are distinct and orthogonal, since $q > 2 N$. For the next estimates we suppress the superscript and $r$. Orthogonality and unitarity give

#[#set math.equation(numbering: n => "(3.15)")
 $ sum_W K_(W \, j)^(*) K_(W \, j) = I . $ <eq:coefficient-column>]

Moreover,

#[#set math.equation(numbering: n => "(3.16)")
 $ K_(W \, j) = K_(W \, j) p_W \, #h(2em) p_W = sum_(a in W upright(" distinct")) e_a \, $ <eq:coefficient-support>]

because the rightmost factor carrying a phase is a diagonal projection with a label in $W$.

Their classes $K_W = \( K_(W \, j) \)_omega$ have norm at most $beta_W$ from 11. Indeed, moving all powers of $v$ to the left rewrites each coefficient, up to a left unitary, as the corresponding sum of projection words from distinct algebras $v^(- l) D v^l$. These algebras are scalar free: in a product of centered letters from alternating conjugates, consecutive unequal exponents leave nonzero powers of the Haar unitary between centered $P$-letters; scalar freeness of $v$ and $P$ makes its trace zero. Consequently, 12 gives

#[#set math.equation(numbering: n => "(3.17)")
 $ max_a sum_(\| W \| = r\
a in W) beta_W^2 lt.eq 64 #h(2em) \( 1 lt.eq r lt.eq N \) . $ <eq:beta-through-label>]

The coordinate coefficients need not themselves obey their limiting norm bounds. We enforce those bounds by spectral truncation. For $b > 0$, put

$ f_b \( u \) = min { 1 \, b \/ u } quad \( u > 0 \) \, #h(2em) f_b \( 0 \) = 1 \, $

and define

$ K'_(W \, j) = K_(W \, j) f_(beta_W) \( \| K_(W \, j) \| \) \, #h(2em) E_(W \, j) = K_(W \, j) - K'_(W \, j) . $

Then $lr(bar.v.double K'_(W \, j) bar.v.double) lt.eq beta_W$, its right support is still contained in $p_W$, and

#[#set math.equation(numbering: n => "(3.18)")
 $ sum_W \( K'_(W \, j) \)^(*) K'_(W \, j) lt.eq I \, #h(2em) sum_W E_(W \, j)^(*) E_(W \, j) lt.eq I . $ <eq:clipped-columns>]

These follow term by term from (3.15). Continuous functional calculus in the quotient gives

$ lim_(j arrow.r omega) lr(bar.v.double E_(W \, j) bar.v.double)_2 = 0 \, $

since the positive function $\( u - beta_W \)_(+)$ vanishes on the spectrum of $\| K_W \|$.

The purpose of these truncated coefficients is to replace a matrix commutator by a column commutator with a small support. Average $h$ over $cal(U) \( R \)$ with Haar probability measure, obtaining

$ h^0 = integral_(cal(U) \( R \)) u h u^(*) thin d u in R' \, #h(2em) lr(bar.v.double h - h^0 bar.v.double) lt.eq delta \, #h(2em) lr(bar.v.double "ad"_(h^0) \|_M bar.v.double) lt.eq delta . $

Write $h_n^0 = I_n ⊗ h^0$. The last inequality follows by averaging $\[ u h u^(*) \, a \] = u \[ h \, u^(*) a u \] u^(*)$. For each $W$, there is a rectangular partial isometry $V in M_(n \, 1) \( R \)$ with $V V^(*) = p_W$: the support of $p_W$ has at most $r lt.eq k$ minimal diagonal projections, so its rank does not exceed the dimension $k$ of the source column. Its entries commute with $h^0$, and hence

$ \[ h_n^0 \, K'_(W \, j) \] Z = #scale(x: 120%, y: 120%)[\(] h_n^0 K'_(W \, j) V - K'_(W \, j) V h^0 #scale(x: 120%, y: 120%)[\)] V^(*) Z . $

9 bounds this by $8 delta beta_W lr(bar.v.double p_W Z bar.v.double)$. Orthogonality of the diagonal projections and (3.17) give the weighted support estimate

$ sum_W beta_W^2 lr(bar.v.double p_W Z bar.v.double)^2 = sum_(a = 1)^d (sum_(\| W \| = r\
a in W) beta_W^2) lr(bar.v.double e_a Z bar.v.double)^2 lt.eq 64 lr(bar.v.double Z bar.v.double)^2 . $

Squaring the column bounds, summing over $W$, and taking a square root therefore yields

$ (sum_W lr(bar.v.double \[ h_n^0 \, K'_(W \, j) \] Z bar.v.double)^2)^(1 \/ 2) lt.eq 64 delta lr(bar.v.double Z bar.v.double) . $

Replacing $h^0$ by $h$ costs at most $2 delta lr(bar.v.double Z bar.v.double)$, by the first column contraction in (3.18). Thus

#[#set math.equation(numbering: n => "(3.19)")
 $ (sum_W lr(bar.v.double \[ h_n \, K'_(W \, j) \] Z bar.v.double)^2)^(1 \/ 2) lt.eq 66 delta lr(bar.v.double Z bar.v.double) . $ <eq:clipped-drift>]

For $Z = X$, restoring the coefficients $E_(W \, j)$ costs a quantity tending to zero along $omega$, by 10. There are only finitely many $W$. For the moving vector $Z = v_j X = s_j Y$, write

$ \[ h_n \, E_(W \, j) \] s_j Y = h_n E_(W \, j) s_j Y - E_(W \, j) s_j h_n Y - E_(W \, j) \[ h_n \, s_j \] Y . $

The first two terms tend to zero in column norm: $E_(W \, j) s_j$ is bounded and 2-small, and $Y \, h_n Y$ are fixed. The last term has column norm at most $2 delta$, by (3.18), (3.14). Phase orthogonality now converts these column bounds back to root-mean-square bounds for the unitary words:

#[#set math.equation(numbering: n => "(3.20)")
 $ lim_(j arrow.r omega) (bb(E)_theta lr(bar.v.double \[ h_n \, Q_(r \, j)^(+) \] v_j X bar.v.double)^2)^(1 \/ 2) & lt.eq 68 delta \,\
lim_(j arrow.r omega) (bb(E)_theta lr(bar.v.double \[ h_n \, Q_(r \, j)^(-) \] X bar.v.double)^2)^(1 \/ 2) & lt.eq 66 delta . $ <eq:positive-drift>]

Both bounds hold for every $r lt.eq N$.

=== 3.5 Recovering a scalar operator <recovering-a-scalar-operator>

The word estimates control commutator errors independently of the matrix size. We now combine the words into rows and choose a contraction of $M$ so that their averaged product converges weakly to a positive scalar multiple of the identity. This scalar will detect the matrix commutator.

Independently choose a uniform $q$-th root of unity $z$ and a uniform standard basis column $alpha in bb(C)^n$. Write $p = alpha alpha^(*) in B$, and define

$ f_j = N^(- 1 \/ 2) sum_(r = 1)^N \( z L_j \)^r \, #h(2em) F_j = sqrt(n) thin alpha^(*) f_j \, #h(2em) G_j = sqrt(n) thin alpha^(*) f_j^(*) . $

Here $F_j \, G_j : H^n arrow.r H$ are rows over $M$. In the remainder of the proof $bb(E)$ averages over all three finite random choices $theta \, z \, alpha$. Averaging first over $alpha$ and then using orthogonality of $z \, dots.h \, z^N$ gives

#[#set math.equation(numbering: n => "(3.21)")
 $ bb(E) lr(bar.v.double F_j X bar.v.double)^2 = bb(E) lr(bar.v.double G_j X bar.v.double)^2 = 1 . $ <eq:row-rms>]

The same orthogonality removes cross terms between different powers in the following errors:

#[#set math.equation(numbering: n => "(3.22)")
 $ lim_(j arrow.r omega) (bb(E) lr(bar.v.double h F_j X - F_j U^(*) h_n Y bar.v.double)^2)^(1 \/ 2) & lt.eq 70 delta \,\
lim_(j arrow.r omega) (bb(E) lr(bar.v.double h G_j X - G_j h_n X bar.v.double)^2)^(1 \/ 2) & lt.eq 70 delta . $ <eq:forward-row-drift>]

To check the first estimate, use $L_j^r = Q_(r \, j)^(+) s_j U$. The corresponding error before the scalar phase is

$ \[ h_n \, Q_(r \, j)^(+) \] s_j Y + Q_(r \, j)^(+) \[ h_n \, s_j \] Y \, $

which is bounded by (3.20) and (3.14). For the second estimate, the adjoint power is $Q_(r \, j)^(-)$, so (3.20) applies. Averaging the normalized sum of the $N$ squared bounds produces no factor depending on $N$.

We next choose contractions $x_j in M$ so that the average of $G_j^(*) x_j F_j$ has a nonzero scalar weak limit. Put

$ A_j = p f_j^2 p \, #h(2em) tilde(x)_j = A_j^(*) \( A_j A_j^(*) + .01 p \)^(- 1 \/ 2) = alpha x_j alpha^(*) . $

The inverse square root is taken in the unital corner $p P p$. Functional calculus gives $lr(bar.v.double x_j bar.v.double) lt.eq 1$. Let

$ C_j = G_j^(*) x_j F_j = n f_j tilde(x)_j f_j . $

Since $lr(bar.v.double f_j bar.v.double) lt.eq sqrt(N)$, these operators have norm at most $n N$, uniformly in $j$ and the random choices.

Use the same letters without the subscript for their ultrapower classes. The unitary $u = z t v$ is Haar and free from $P$, by 14. Since $C in W^(*) \( u \, p \)$, freeness gives

#[#set math.equation(numbering: n => "(3.23)")
 $ E_P \( C \) = lambda p + mu \( 1 - p \) . $ <eq:scalar-expectation>]

For completeness, expand a polynomial in $u \, u^(*) \, p$ into alternating centered letters from $W^(*) \( u \)$ and $W^(*) \( p \)$. Every reduced term containing a centered $u$-letter has zero expectation onto $P$, as is seen by testing its trace against elements of $P$. The remaining terms lie in $W^(*) \( p \)$. Polynomial approximation, including the continuous corner functional calculus defining $tilde(x)$, proves (3.23). The numbers $lambda \, mu$ depend only on $n \, N$: the free joint law of $u \, p$ is the same for all choices, since $tau \( p \) = 1 \/ n$. As $bb(E)_alpha p = I \/ n$, it follows that

#[#set math.equation(numbering: n => "(3.24)")
 $ bb(E) E_P \( C \) = c_(*) I \, #h(2em) c_(*) = tau \( C \) . $ <eq:scalar-average>]

We give the lower bound on $c_(*)$, since its independence from $n$ is essential. Traciality and the support of the corner functional calculus show that

$ c_(*) = n tau #scale(x: 120%, y: 120%)[\(] A A^(*) \( A A^(*) + .01 p \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] gt.eq n lr(bar.v.double p f^2 p bar.v.double)_1 - .1 . $

The inequality follows from $t^2 \( t^2 + .01 \)^(- 1 \/ 2) gt.eq t - .1$ for $t gt.eq 0$, and $n tau \( p \) = 1$.

Let $e$ be the spectral projection of $u$ for the arc ${ e^(i t) : \| t \| lt.eq R_(*) \/ N }$, and put $eta = tau \( e \) = R_(*) \/ \( pi N \)$. Haar measure gives $tau \( \| f \|^2 \) = 1$, and $lr(bar.v.double f^2 bar.v.double) lt.eq N$. For $0 < \| t \| lt.eq pi$, the geometric-sum formula gives

$ lr(|sum_(r = 1)^N e^(i r t)|) lt.eq frac(pi, \| t \|) . $

Integrating its square outside the arc yields

#[#set math.equation(numbering: n => "(3.25)")
 $ tau \( \| f \|^2 \( 1 - e \) \) lt.eq frac(1, 2 pi) integral_(\| t \| > R_(*) \/ N) frac(pi^2, N t^2) thin d t lt.eq pi / R_(*) . $ <eq:haar-tail>]

Since $f$ commutes with $e$, tracial Cauchy–Schwarz and freeness of $p$ from $f \, e$ give

$ n lr(bar.v.double p \( f^2 - e f^2 e \) p bar.v.double)_1 & = n lr(bar.v.double p f \( 1 - e \) f p bar.v.double)_1\
 & lt.eq n lr(bar.v.double p f \( 1 - e \) bar.v.double)_2 lr(bar.v.double \( 1 - e \) f p bar.v.double)_2\
 & = tau \( \| f \|^2 \( 1 - e \) \) lt.eq pi / R_(*) . $

Put $s_e = n e p e$, a positive operator in the corner $e P^omega e$. The polar decomposition of $sqrt(n) thin e p$ identifies the nonzero parts of the following two operators, and hence gives

#[#set math.equation(numbering: n => "(3.26)")
 $ n lr(bar.v.double p e f^2 e p bar.v.double)_1 = lr(bar.v.double s_e^(1 \/ 2) f^2 s_e^(1 \/ 2) bar.v.double)_1 . $ <eq:compression-polar>]

Explicitly, if $sqrt(n) thin e p = s_e^(1 \/ 2) w$, the left-hand operator inside the norm is $w^(*) s_e^(1 \/ 2) f^2 s_e^(1 \/ 2) w$, and the middle operator is supported on $w w^(*) = "supp" \( s_e \)$ on both sides.

The elementary free moment calculation gives

$ lr(bar.v.double s_e^(1 \/ 2) bar.v.double)_2 = sqrt(eta) \, #h(2em) lr(bar.v.double s_e - e bar.v.double)_2^2 = \( n - 1 \) eta^2 . $

For the second identity, put $a = n p - I$. Then $tau \( a \) = 0$, $tau \( a^2 \) = n - 1$, and freeness gives $tau \( a e a e \) = eta^2 tau \( a^2 \)$; expansion of $tau \( \( n e p e - e \)^2 \)$ gives the same quantity. Within the corner with identity $e$, $\| sqrt(t) - 1 \| lt.eq \| t - 1 \|$ for $t gt.eq 0$, so $lr(bar.v.double s_e^(1 \/ 2) - e bar.v.double)_2 lt.eq sqrt(n - 1) eta$. Consequently,

$ lr(bar.v.double s_e^(1 \/ 2) f^2 s_e^(1 \/ 2) - e f^2 e bar.v.double)_1 & lt.eq lr(bar.v.double s_e^(1 \/ 2) - e bar.v.double)_2 lr(bar.v.double f^2 bar.v.double) #scale(x: 120%, y: 120%)[\(] lr(bar.v.double s_e^(1 \/ 2) bar.v.double)_2 + lr(bar.v.double e bar.v.double)_2 #scale(x: 120%, y: 120%)[\)]\
 & lt.eq 2 N sqrt(n - 1) eta^(3 \/ 2) . $

Since $lr(bar.v.double e f^2 e bar.v.double)_1 = tau \( e \| f \|^2 \)$, we obtain

#[#set math.equation(numbering: n => "(3.27)")
 $ c_(*) gt.eq .9 - frac(2 pi, R_(*)) - 2 N sqrt(n - 1) (frac(R_(*), pi N))^(3 \/ 2) gt.eq 1 / 2 . $ <eq:positive-scalar>]

Indeed, by (∗), the last term is at most $.2 \/ pi^(3 \/ 2)$, and $2 pi \/ R_(*) = .02$.

For each fixed random choice, 10 identifies the weak ultralimit of $C_j$ with $E_P \( C \)$. All random spaces are finite, and their sizes are fixed before taking the ultralimit. Thus (3.24) gives

#[#set math.equation(numbering: n => "(3.28)")
 $ "WOT" #h(-0.16667em) - #h(-0.16667em) lim_(j arrow.r omega) thin bb(E) C_j = c_(*) I . $ <eq:weak-scalar-limit>]

=== 3.6 Extracting the matrix commutator <extracting-the-matrix-commutator>

The randomized rows now have two properties: their commutator drift is bounded independently of $n$, and their product with a contraction $x_j in M$ has a positive scalar weak limit. Apply the defining scalar commutator bound to that contraction:

$ lr(|bb(E) chevron.l \[ h \, x_j \] F_j X \, G_j X chevron.r|) lt.eq delta thin bb(E) #scale(x: 120%, y: 120%)[\(] lr(bar.v.double F_j X bar.v.double) lr(bar.v.double G_j X bar.v.double) #scale(x: 120%, y: 120%)[\)] lt.eq delta \, $

using (3.21). As $h = h^(*)$, the expression inside the average equals

$ chevron.l x_j F_j X \, h G_j X chevron.r - chevron.l x_j h F_j X \, G_j X chevron.r . $

Substitute the main terms from (3.22), (3.22). By Cauchy–Schwarz and (3.21), the sum of the two average errors has ultralimit at most $140 delta$. The remaining expression is

$ chevron.l C_j X \, h_n X chevron.r - chevron.l C_j U^(*) h_n Y \, X chevron.r . $

(3.28) therefore implies

$ c_(*) lr(|chevron.l h_n X \, X chevron.r - chevron.l h_n U X \, U X chevron.r|) lt.eq 141 delta . $

Here the quadratic forms are real because $h_n$ is selfadjoint. By (3.27), their difference has absolute value at most $282 delta$. The choices of randomization were allowed to depend on $U \, X \, n$, but this bound does not. Taking the supremum over unit vectors gives

$ lr(bar.v.double h_n - U^(*) h_n U bar.v.double) lt.eq 282 delta \, #h(2em) lr(bar.v.double \[ h_n \, U \] bar.v.double) lt.eq 282 delta . $

Every selfadjoint contraction $a$ in a unital $C^(*)$-algebra is the average of the unitaries $a plus.minus i \( 1 - a^2 \)^(1 \/ 2)$. Writing a general contraction as its real part plus $i$ times its imaginary part therefore bounds its commutator by $564 delta$. The level $n = 1$ is already covered by the definition of $delta$. Taking the supremum over $n$ proves 8, for example with $C_(upright("amp")) = 600$.

== 4 Boundary averaging and measurable correction <sec:boundary>

The finite-factor argument begins with nearby unitaries whose products are only approximately respected. For their countable indexing group $G$, we construct a probability space $\( D \, nu \)$ with a nonsingular $G$-action and an equivariant mean that corrects these multiplication errors. On $D^2$ two actions have different roles. The separate action $\( g \, h \) \( x \, y \) = \( g x \, h y \)$ permits averaging of cocycles. The diagonal action $g \( x \, y \) = \( g x \, g y \)$ has a rigidity property: bounded measurable vector fields transforming under a unitary representation are constant. For cocycles with values in a finite algebra, a tracial convex-hull construction will connect these two uses of $D^2$. All estimates are independent of $G$.

For a nonsingular action of a countable group $G$ on a probability space $\( D \, nu \)$, write

$ alpha_g F \( x \) = F \( g^(- 1) x \) \, #h(2em) \( lambda_g F \) \( t \, x \) = F \( g^(- 1) t \, g^(- 1) x \) . $

Nonsingular means that the action preserves the class of null sets; measure preservation is not required. On $G times D$ we use counting measure in the first variable. A bounded operator field on a separable Hilbert space $K$ means an essentially bounded, weakly measurable map into $cal(B) \( K \)$. Its norm is the essential supremum of its operator norms. Separability makes this a measurable function: the operator norm can be tested on countably many unit vectors. Products of such fields are again weakly measurable, since their values on fixed vectors are measurable $K$-valued maps and can be approximated by countably valued maps.

The scalar mean below is the conditional-expectation formulation of amenability for a measured group action #cite(label("Zimmer1978Boundary")) #cite(label("AdamsElliottGiordano1994")); see in particular #cite(label("AdamsElliottGiordano1994")) Theorem 3.4, p. 810. We give the construction and the operator-field extension required here.

#thm([Lemma 4.1.])[
  (Equivariant boundary means).  #emph[For every countable group $G$ there are a standard probability space $\( D \, nu \)$ with a nonsingular $G$-action and a positive unital contraction 
$ m : L^oo \( G times D \) arrow.r L^oo \( D \) $

 satisfying 
#[#set math.equation(numbering: n => "(4.1)")
 $ m \( lambda_g F \) = alpha_g \( m F \) \, #h(2em) m \( f F \) = f thin m \( F \) quad \( f in L^oo \( D \) \) . $ <eq:boundary-mean-identities>]

 There is a mean $m^(\( 2 \))$ with the same properties for the separate $G times G$-action on $D times D$ and functions on $G^2 times D^2$. Each mean extends to a contraction on bounded operator fields on any separable $K$. The extension preserves adjoints and von Neumann algebra values, and is a bimodule map over bounded operator fields independent of the group variable: 
#[#set math.equation(numbering: n => "(4.2)")
 $ m \( B F C \) = B thin m \( F \) thin C . $ <eq:boundary-operator-module>]

]
] <lem:boundary-mean>

#proof[
  Choose a symmetric probability measure $mu$ on $G$ with $mu \( g \) > 0$ for every $g$. Let $X = G^(bb(N) union { 0 })$ with product probability $bb(P) = mu^(bb(N) union { 0 })$. On $X$ define
  $ g \( omega_0 \, omega_1 \, dots.h \) = \( g omega_0 \, omega_1 \, dots.h \) \, #h(2em) S \( omega_0 \, omega_1 \, dots.h \) = \( omega_0 omega_1 \, omega_2 \, dots.h \) . $
  These maps commute. The first-coordinate laws of their pushforwards are respectively $g mu$ and $mu * mu$, while all later coordinates remain independent with law $mu$. Full support therefore makes both pushforwards equivalent to $bb(P)$.
  Let $cal(I)$ be the completed sigma algebra of sets $E$ satisfying $S^(- 1) E = E$ modulo null sets. It is countably generated modulo null sets. Indeed the measure algebra of $X$ is separable for the metric $bb(P) \( E triangle.stroked.t F \)$, so its subspace $cal(I)$ is separable. Choose a countable dense family $E_j$ in that subspace. For each $E in cal(I)$, a sequence from this family with summable symmetric-difference errors converges almost everywhere in indicators to $1_E$. Thus the $E_j$ generate $cal(I)$ after completion. The $G$-action preserves $cal(I)$, because it commutes with $S$. Include all translates $g E_j$ and set
  $ b \( omega \)_(j \, g) = 1_(g E_j) \( omega \) \, #h(2em) D = { 0 \, 1 }^(bb(N) times G) \, #h(2em) nu = b_(*) bb(P) . $
  Equip $D$ with its Borel probability measure and, when taking measurable functions, its completion. The coordinate-permutation action $\( h x \)_(j \, g) = x_(j \, h^(- 1) g)$ satisfies $b \( h omega \) = h b \( omega \)$. It is nonsingular, since the action on $X$ is nonsingular. We have $b compose S = b$ almost everywhere. Pullback by $b$ identifies $L^oo \( D \)$ with the $S$-fixed subalgebra of $L^oo \( X \)$: one inclusion follows from $b compose S = b$, and the other from the generation of $cal(I)$. This description also applies to scalar $L^2$ functions. Countably many representative identities can always be made simultaneous by deleting a null set.
  For $F in L^oo \( G times D \)$ put
  $ \( J F \) \( omega \) = F \( omega_0 \, b \( omega \) \) \, #h(2em) T_n F = 1 / n sum_(j = 0)^(n - 1) \( J F \) compose S^j . $
  The map $J$ is well defined on equivalence classes: there are only countably many group coordinates, and each section has a $nu$-null exceptional set. These maps are positive unital contractions. Take a simultaneous pointwise weak-star cluster subnet of the maps $T_n$, using the product of the weak-star compact balls $product_F { a in L^oo \( X \) : lr(bar.v.double a bar.v.double) lt.eq lr(bar.v.double F bar.v.double) }$. Denote its limit by $T$; it is linear, positive, unital and contractive.
  Pullback by a nonsingular measurable map is weak-star continuous on $L^oo$. To see this directly, for $q in L^1$ the measure $E mapsto integral_(S^(- 1) E) q thin d bb(P)$ is absolutely continuous with respect to $bb(P)$; its Radon–Nikodym density is the required preadjoint applied to $q$. Its $L^1$ norm is at most $lr(bar.v.double q bar.v.double)_1$. Consequently the telescoping bound
  $ lr(bar.v.double \( T_n F \) compose S - T_n F bar.v.double) lt.eq 2 lr(bar.v.double F bar.v.double) \/ n $
  implies $\( T F \) compose S = T F$. Write $T F = \( m F \) compose b$. Moreover $J lambda_g F = \( J F \) compose g^(- 1)$ and the group action commutes with $S$. Weak-star continuity of its nonsingular pullback gives the first identity in (4.1). The identity $b compose S = b$ gives $T_n \( f F \) = \( f compose b \) T_n F$; multiplication by a fixed bounded function is weak-star continuous, proving the second identity.
  For the product mean use $X^2$, its two commuting shifts $S_1 \, S_2$, and rectangular averages
  $ frac(1, n m) sum_(i = 0)^(n - 1) sum_(j = 0)^(m - 1) F #scale(x: 120%, y: 120%)[\(] \( S^i omega \)_0 \, \( S^j omega' \)_0 \, b \( omega \) \, b \( omega' \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) n \, m arrow.r oo . $
  A simultaneous weak-star cluster is fixed by both shifts. These common fixed functions are exactly the functions of $\( b \( omega \) \, b \( omega' \) \)$. For completeness, a fixed scalar $L^2 \( X^2 \)$ function has almost every section in the closed subspace $L^2 \( cal(I) \) subset L^2 \( X \)$ in each variable, by Fubini and the preceding identification. The two orthogonal projections onto $L^2 \( cal(I) \) ⊗ L^2 \( X \)$ and $L^2 \( X \) ⊗ L^2 \( cal(I) \)$ commute; their product has range $L^2 \( cal(I) \) ⊗ L^2 \( cal(I) \)$. This proves the assertion. The preceding equivariance and module arguments now apply in both coordinates.
  Here are details of the operator-field extension; they also explain why no normality of $m$ is needed. On a countable rational complex vector subspace dense in $K$, define the coefficients of $m \( F \) \( x \)$ by applying the scalar $m$ to $chevron.l F \( t \, x \) xi \, eta chevron.r$. Outside a single null set these coefficients are sesquilinear and bounded by $lr(bar.v.double F bar.v.double) lr(bar.v.double xi bar.v.double) lr(bar.v.double eta bar.v.double)$. They therefore define a bounded operator, and extension by density supplies all coefficients. Positivity of the scalar mean implies that this extension preserves adjoints; the norm bound gives contractivity. The coefficient identities also prove equivariance.
  The scalar module identity implies the same coefficient formula when the test vectors depend measurably on $x$. First take countably valued bounded vector fields: on each member of the countable joint partition, localize using the scalar module identity and use the fixed-vector formula. Then approximate arbitrary bounded measurable vector fields uniformly by countably valued ones, using separability of $K$ and the norm bound. Testing $B F C$ on fixed vectors with the variable vectors $C \( x \) xi$ and $B \( x \)^(*) eta$ proves (4.2). In particular, if $F$ takes values in a von Neumann algebra $A subset cal(B) \( K \)$, its mean commutes with each constant operator in $A'$. Choose a countable strongly dense subset of the unit ball of $A'$ to make this simultaneous almost everywhere; then $m \( F \) \( x \) in A'' = A$. Every step applies also to $m^(\( 2 \))$. ◻
]

The next proof uses the averaging and polar-decomposition iteration that appears in stability of approximate unitary representations #cite(label("Kazhdan1982")) #cite(label("BurgerOzawaThom2013")); compare #cite(label("BurgerOzawaThom2013")) Theorem 3.2 and its proof, pp. 116–117. Here the mean belongs to an amenable action, and the corrected objects are measurable cocycles.

#thm([Lemma 4.2.])[
  (Correction of a measurable unitary cocycle).  #emph[Let $D$ and $m$ be as in 15, and let $A subset cal(B) \( K \)$ be a von Neumann algebra on a separable Hilbert space. Suppose $V_g in L^oo \( D \, cal(U) \( A \) \)$, $g in G$, and 
$ e = sup_(g \, h in G) lr(bar.v.double V_g alpha_g \( V_h \) - V_(g h) bar.v.double)_oo lt.eq 1 / 64 . $

 Then there are measurable unitary fields $W_g$ with 
#[#set math.equation(numbering: n => "(4.3)")
 $ W_g alpha_g \( W_h \) = W_(g h) \, #h(2em) sup_g lr(bar.v.double W_g - V_g bar.v.double)_oo lt.eq 2 e . $ <eq:boundary-exact-cocycle>]

 In particular $W_1 = I$. The identities hold simultaneously almost everywhere for every $g \, h$, and may be used on a $G$-invariant conull subset of $D$.]
] <lem:boundary-correction>

#proof[
  We give a quadratic improvement and then iterate it. For the current family define
  $ H_g \( t \, x \) = V_t \( x \) V_(g^(- 1) t) \( g^(- 1) x \)^(*) \, #h(2em) A_g = m_t H_g . $
  The defect inequality implies $lr(bar.v.double H_g - V_g bar.v.double)_oo lt.eq e$, hence $lr(bar.v.double A_g - V_g bar.v.double)_oo lt.eq e$ and $lr(bar.v.double H_g - A_g bar.v.double)_oo lt.eq 2 e$. All $H_g$ are unitary and all $A_g$ are contractions. There is the exact factorization
  $ H_(g h) = H_g lambda_g \( H_h \) \, #h(2em) m \( lambda_g H_h \) = alpha_g \( A_h \) . $
  Using the left and right module identities to cancel the linear terms in the product gives
  $ A_(g h) - A_g alpha_g \( A_h \) & = m #scale(x: 120%, y: 120%)[\(] \( H_g - A_g \) \( lambda_g H_h - alpha_g \( A_h \) \) #scale(x: 120%, y: 120%)[\)] \,\
I - A_g^(*) A_g & = m #scale(x: 120%, y: 120%)[\(] \( H_g - A_g \)^(*) \( H_g - A_g \) #scale(x: 120%, y: 120%)[\)] . $
  Both right sides have norm at most $4 e^2$. The same calculation gives $lr(bar.v.double I - A_g A_g^(*) bar.v.double) lt.eq 4 e^2$. Since $A_g$ is within $e < 1$ of a unitary, it is invertible in $L^oo \( D \, A \)$. Its unitary polar part $V'_g = A_g \( A_g^(*) A_g \)^(- 1 \/ 2)$ satisfies
  $ lr(bar.v.double V'_g - A_g bar.v.double)_oo = lr(bar.v.double I - \| A_g \| bar.v.double)_oo lt.eq 4 e^2 . $
  Functional calculus preserves measurability: here it can be obtained by uniform polynomial approximation on a fixed compact interval away from zero. The new defect is at most $16 e^2$, since changing the three terms in $A_g alpha_g \( A_h \) - A_(g h)$ to their polar parts costs at most $12 e^2$. Also $sup_g lr(bar.v.double V'_g - V_g bar.v.double)_oo lt.eq e + 4 e^2$.
  Starting with $e_0 = e$, the successive defects satisfy $e_(j + 1) lt.eq 16 e_j^2 lt.eq e_j \/ 4$. Thus the families converge uniformly in $g$ and in essential operator norm to unitary fields $W_g$. Their defects tend to zero, and the total change is bounded by
  $ sum_(j gt.eq 0) \( e_j + 4 e_j^2 \) lt.eq 17 / 16 sum_(j gt.eq 0) e_j lt.eq 17 / 12 e lt.eq 2 e . $
  If $e = 0$, the original family already works. Countability of $G$ and nonsingularity permit deletion of all exceptional sets and their translates. Finally the cocycle identity with $g = h = 1$ makes the unitary $W_1$ idempotent, so $W_1 = I$. ◻
]

#thm([Lemma 4.3.])[
  (Averaged intertwiner).  #emph[Take either $\( Gamma \, Z \) = \( G \, D \)$ or $\( Gamma \, Z \) = \( G^2 \, D^2 \)$, with its mean from 15. Let $U : Gamma arrow.r cal(U) \( K \)$ be a unitary representation on a separable Hilbert space, and let $Sigma_s in L^oo \( Z \, cal(U) \( K \) \)$ be an exact cocycle for the given action. If 
$ sup_(s in Gamma) lr(bar.v.double Sigma_s - U_s bar.v.double)_oo lt.eq delta < 1 \, $

 there is $L in L^oo \( Z \, cal(U) \( K \) \)$ such that 
#[#set math.equation(numbering: n => "(4.4)")
 $ lr(bar.v.double L - I bar.v.double)_oo lt.eq 2 delta \, #h(2em) L \( z \) U_s = Sigma_s \( z \) L \( s^(- 1) z \) . $ <eq:boundary-intertwiner>]

]
] <lem:boundary-intertwiner>

#proof[
  Set $B = m_t \( Sigma_t U_t^(*) \)$. Then $lr(bar.v.double B - I bar.v.double)_oo lt.eq delta$, so $B$ is invertible. Equivariance, the module identities and the cocycle identity give
  $ Sigma_s alpha_s \( B \) U_s^(*) = m_t #scale(x: 120%, y: 120%)[\(] Sigma_s alpha_s \( Sigma_(s^(- 1) t) \) U_(s^(- 1) t)^(*) U_s^(*) #scale(x: 120%, y: 120%)[\)] = m_t \( Sigma_t U_t^(*) \) = B . $
  Thus $B U_s = Sigma_s alpha_s \( B \)$. Taking adjoints and products shows $B^(*) B = U_s alpha_s \( B^(*) B \) U_s^(*)$, so the same identity holds after replacing $B$ by its unitary polar part $L$. The inequalities $\( 1 - delta \) I lt.eq \| B \| lt.eq \( 1 + delta \) I$ give $lr(bar.v.double L - B bar.v.double)_oo lt.eq delta$, proving the stated bound. ◻
]

Applied on $D^2$, the preceding lemma gives an intertwiner for the separate action. For the finite-factor application we also need an algebra-valued comparison of the two boundary variables under the diagonal action. The next construction uses the trace in place of an invariant mean for that action.

#thm([Lemma 4.4.])[
  (Diagonal comparison in a finite algebra).  #emph[Let $A$ be a finite von Neumann algebra with faithful normal tracial state $tau$ and separable trace Hilbert space $L^2 \( A \, tau \)$. Let $W_g in L^oo \( D \, cal(U) \( A \) \)$ be an exact cocycle. Suppose 
$ sup_(g in G) upright("ess") thin s u p_(x \, y in D) lr(bar.v.double W_g \( x \) W_g \( y \)^(*) - I bar.v.double) lt.eq r < 1 . $

 Then there is a measurable field $a : D^2 arrow.r cal(U) \( A \)$ such that 
#[#set math.equation(numbering: n => "(4.5)")
 $ lr(bar.v.double a - I bar.v.double)_oo lt.eq 2 r \, #h(2em) a \( x \, y \) = W_g \( x \) a \( g^(- 1) x \, g^(- 1) y \) W_g \( y \)^(*) . $ <eq:boundary-diagonal-unitary>]

 In particular, if $sup_g lr(bar.v.double W_g - u_g bar.v.double)_oo lt.eq delta$ for any constant unitaries $u_g$ on a common representation space, the conclusion holds with $lr(bar.v.double a - I bar.v.double)_oo lt.eq 4 delta$ when $2 delta < 1$.]
] <lem:boundary-diagonal-unitary>

#proof[
  For almost every $\( x \, y \)$ let $C_(x \, y)$ be the closed convex hull in $L^2 \( A \, tau \)$ of the countable set
  $ { W_t \( x \) W_t \( y \)^(*) : t in G } . $
  It has a unique vector $c \( x \, y \)$ of least Hilbert norm. To prove measurability explicitly, enumerate its rational convex combinations as $z_j \( x \, y \)$ and put $d \( x \, y \) = inf_j lr(bar.v.double z_j \( x \, y \) bar.v.double)_2$. These are measurable functions: bounded weakly measurable operator fields are strongly measurable as vectors in the separable trace Hilbert space. For each $n$, choose the first $j$ with $lr(bar.v.double z_j \( x \, y \) bar.v.double)_2^2 < d \( x \, y \)^2 + 2^(- n)$. The choices are measurable. For two such choices, the parallelogram identity and the lower bound $d$ on the norm of their midpoint give
  $ lr(bar.v.double z_j - z_k bar.v.double)_2^2 lt.eq 2 \( lr(bar.v.double z_j bar.v.double)_2^2 - d^2 \) + 2 \( lr(bar.v.double z_k bar.v.double)_2^2 - d^2 \) . $
  They converge pointwise in $L^2$ to the measurable field $c$.
  Every $z_j$ is an operator contraction with $lr(bar.v.double z_j - I bar.v.double) lt.eq r$. These inequalities persist under bounded weak-operator limits, and weak-operator compactness in the trace representation identifies any such limit with the $L^2$ limit by its value on the trace vector. Consequently $c \( x \, y \) in A$, $lr(bar.v.double c \( x \, y \) bar.v.double) lt.eq 1$ and $lr(bar.v.double c \( x \, y \) - I bar.v.double) lt.eq r$. On bounded subsets, trace-Hilbert measurability implies weak operator measurability in the trace representation: test first on the dense vectors $p \, q in A subset L^2 \( A \, tau \)$, where the coefficients are $tau \( q^(*) c p \)$, and then use the uniform operator bound. Thus $c$ is also a measurable bounded operator field.
  The linear isometry
  $ z mapsto W_g \( x \) z W_g \( y \)^(*) $
  from the trace Hilbert space to itself sends $C_(g^(- 1) x \, g^(- 1) y)$ onto $C_(x \, y)$. Indeed the cocycle identity sends its generator with index $t$ to the generator with index $g t$. Uniqueness of the least-norm vector gives the asserted equivariance for $c$. Since $lr(bar.v.double c - I bar.v.double) lt.eq r < 1$, its unitary polar part $a$ is measurable, satisfies $lr(bar.v.double a - I bar.v.double) lt.eq 2 r$, and has the same transformation law: polar decomposition respects multiplication on either side by unitaries. Finally $lr(bar.v.double W_g \( x \) W_g \( y \)^(*) - I bar.v.double) lt.eq 2 delta$ follows by comparing both $W_g \( x \)$ and $W_g \( y \)$ with $u_g$. ◻
]

It remains to establish the rigidity of the diagonal action. The bilateral-shift argument below proves the unitary-coefficient form of the double-ergodicity theorem for Poisson boundaries #cite(label("Kaimanovich2003")); see also #cite(label("Bjorklund2014")) Theorem 2.1 and Remark 2.2, p. 7. Symmetry of the random-walk measure identifies the forward and reflected boundary laws used in the proof.

#thm([Lemma 4.5.])[
  (Double ergodicity with unitary coefficients).  #emph[For the space $D$ constructed in 15, let $sigma : G arrow.r cal(U) \( K \)$ be a unitary representation on a separable Hilbert space. If a bounded measurable map $f_0 : D^2 arrow.r K$ satisfies 
$ f_0 \( g x \, g y \) = sigma \( g \) f_0 \( x \, y \) quad \( g in G \) $

 almost everywhere, then $f_0$ is almost everywhere a constant vector fixed by every $sigma \( g \)$.]
] <lem:double-ergodicity>

#proof[
  Use bilateral independent coordinates $\( omega_j \)_(j in bb(Z))$ with law $mu$, and let $theta$ be the left shift, so $\( theta omega \)_j = omega_(j + 1)$. Define
  $ b_(+) \( omega \) = b \( omega_0 \, omega_1 \, dots.h \) \, #h(2em) b_(-) \( omega \) = b \( omega_(- 1)^(- 1) \, omega_(- 2)^(- 1) \, dots.h \) \, #h(2em) f \( omega \) = f_0 \( b_(+) \( omega \) \, b_(-) \( omega \) \) . $
  Symmetry of $mu$ makes $b_(+)$ and $b_(-)$ independent with common law $nu$. The identities $b compose S = b$ and equivariance give
  $ b_(+) \( theta omega \) = omega_0^(- 1) b_(+) \( omega \) \, #h(2em) b_(-) \( theta omega \) = omega_0^(- 1) b_(-) \( omega \) . $
  For the first identity apply $b compose S = b$ to the forward sequence; for the second, apply it to $\( omega_0^(- 1) \, omega_(- 1)^(- 1) \, dots.h \)$ and then use equivariance. All these identities hold almost everywhere, including after every integer shift. Consequently
  #[#set math.equation(numbering: n => "(4.6)")
   $ f \( theta^n omega \) = sigma \( omega_(n - 1)^(- 1) dots.h.c omega_0^(- 1) \) f \( omega \) quad \( n gt.eq 1 \) . $ <eq:boundary-bilateral-transport>]
  Let $f_m$ be the Hilbert-valued conditional expectation of $f$ on coordinates $\[ - m \, m \]$. Then $epsilon_m = lr(bar.v.double f - f_m bar.v.double)_2 arrow.r 0$ by density of finite-coordinate functions in the product $L^2$ space. Fix $n > 2 m + 1$ and put
  $ Q & = sigma \( omega_m^(- 1) dots.h.c omega_0^(- 1) \) \, #h(2em) A = Q f_m \,\
P & = sigma \( omega_(n - m - 1)^(- 1) dots.h.c omega_(m + 1)^(- 1) \) \,\
R & = sigma \( omega_(n - 1)^(- 1) dots.h.c omega_(n - m)^(- 1) \) \, #h(2em) B = R^(- 1) f_m compose theta^n . $
  Thus $A$, $P$ and $B$ depend respectively on the disjoint coordinate sets $\[ - m \, m \]$, $\[ m + 1 \, n - m - 1 \]$ and $\[ n - m \, n + m \]$; they are independent. Equation (4.6) and unitarity yield
  #[#set math.equation(numbering: n => "(4.7)")
   $ lr(bar.v.double P A - B bar.v.double)_2 lt.eq 2 epsilon_m . $ <eq:boundary-independent-blocks>]
  Set $a_0 = bb(E) A$ and $b_0 = bb(E) B$. Independence and orthogonality of centered Hilbert-valued random variables give
  $ bb(E) lr(bar.v.double P A - B bar.v.double)^2 = bb(E) lr(bar.v.double A - a_0 bar.v.double)^2 + bb(E) lr(bar.v.double B - b_0 bar.v.double)^2 + bb(E) lr(bar.v.double P a_0 - b_0 bar.v.double)^2 . $
  For example, condition first on $P$: the centered terms $P \( A - a_0 \)$ and $B - b_0$ have zero mean, are independent, and their squared norms are unchanged by $P$. It follows that
  $ lr(bar.v.double A - a_0 bar.v.double)_2 lt.eq 2 epsilon_m \, #h(2em) lr(bar.v.double B - b_0 bar.v.double)_2 lt.eq 2 epsilon_m . $
  Undoing the first transport shows $lr(bar.v.double f - Q^(- 1) a_0 bar.v.double)_2 lt.eq 3 epsilon_m$. This approximation depends only on coordinates $\[ 0 \, m \]$. Undoing the other transport shows $lr(bar.v.double f compose theta^n - R b_0 bar.v.double)_2 lt.eq 3 epsilon_m$. After shifting back by $n$, the approximating function depends only on coordinates $\[ - m \, - 1 \]$. Hence $f$ belongs both to the closed $L^2$ subspace of functions of the nonnegative coordinates and to that of functions of the negative coordinates. The two sigma algebras are independent, so their common subspace consists of constants: if $f$ is measurable with respect to the second one, its conditional expectation on the first is its constant expectation, and this conditional expectation also equals $f$. Write $f = v$ almost everywhere. The joint law of $\( b_(+) \, b_(-) \)$ is $nu times nu$, so $f_0 = v$ almost everywhere. Its equivariance and nonsingularity imply $sigma \( g \) v = v$ for every $g$. ◻
]

== 5 Finite factors in their original representations <sec:finite>

We now apply the boundary construction to close finite factors. First we place them on one tracial Hilbert space and identify their two actions of a hyperfinite subfactor. This gives the norm control needed for the boundary argument. That argument produces a nearby isomorphism; the amplification estimate then implements it on the original Hilbert space.

#thm([Theorem 5.1.])[
  (Uniform stability of finite factors).  #emph[There are a number $t_(upright("fin")) > 0$ and a nondecreasing function $eta_(upright("fin")) : \( 0 \, t_(upright("fin")) \) arrow.r \( 0 \, oo \)$, with $eta_(upright("fin")) \( t \) arrow.r 0$ as $t arrow.b 0$, having the following property. Let $H$ be a separable nonzero Hilbert space, let $M subset.eq cal(B) \( H \)$ be a unital finite factor, and let $N subset.eq cal(B) \( H \)$ be a von Neumann algebra with the same identity. If $d \( M \, N \) < t < t_(upright("fin"))$, then $N$ is a finite factor and there is a unitary $u in cal(B) \( H \)$ such that 
$ u M u^(*) = N \, #h(2em) lr(bar.v.double u - I_H bar.v.double) lt.eq eta_(upright("fin")) \( t \) . $

 The threshold and function are independent of $M \, N$ and their representations.]
] <thm:finite>

=== 5.1 An irreducible hyperfinite subfactor <an-irreducible-hyperfinite-subfactor>

We use the normalized trace $tau$ of a finite factor, with $lr(bar.v.double x bar.v.double)_2 = tau \( x^(*) x \)^(1 \/ 2)$ and trace vector $Omega = 1 in L^2 \( M \, tau \)$. We use the trace-preserving expectations onto von Neumann subalgebras of a finite algebra. An inclusion $R subset.eq M$ is #emph[irreducible] when $R' ∩ M = bb(C) I$.

#thm([Lemma 5.2.])[
  #emph[If $M subset.eq cal(B) \( H \)$ is a unital finite factor and $N subset.eq cal(B) \( H \)$ is a von Neumann algebra with $d \( M \, N \) < 1 \/ 10$, then $N$ is a finite factor.]
] <lem:finite-neighbor>

#proof[
  Choose $t$ with $d \( M \, N \) < t < 1 \/ 10$. If $v in N$ were a proper isometry, choose $x in M_1$ with $lr(bar.v.double x - v bar.v.double) < t$. Then $x^(*) x gt.eq \( 1 - t \)^2 I$, so the polar part $w$ of $x$ is an isometry in $M$. Finiteness makes $w$ unitary. Since $1 - t lt.eq \| x \| lt.eq 1$, $lr(bar.v.double w - v bar.v.double) lt.eq lr(bar.v.double w - x bar.v.double) + lr(bar.v.double x - v bar.v.double) < 2 t < 1$. This is impossible: a proper isometry within distance less than one of a unitary would be invertible. Thus $N$ is finite.
  Suppose that $q in Z \( N \)$ is a projection. Choose $a in M_1$ with $lr(bar.v.double a - q bar.v.double) < t$. For $v in cal(U) \( M \)$ choose $b in N_1$ with $lr(bar.v.double v - b bar.v.double) < t$. Since $q$ commutes with $b$,
  $ lr(bar.v.double v a v^(*) - q bar.v.double) lt.eq lr(bar.v.double a - q bar.v.double) + lr(bar.v.double \[ v \, q \] bar.v.double) < 3 t . $
  The trace-Hilbert closed convex hull of the conjugates $v a v^(*)$ contains $tau \( a \) I$. Indeed, its unique vector of least norm is conjugacy invariant, is bounded by one by weak compactness of the operator ball, and is therefore scalar; its trace is $tau \( a \)$. Consequently $lr(bar.v.double q - tau \( a \) I bar.v.double) lt.eq 3 t < 1 \/ 2$. A nontrivial projection has distance $1 \/ 2$ from the scalars, so $q$ is zero or one. The spectral projections of every central selfadjoint element are therefore trivial, proving $Z \( N \) = bb(C) I$. ◻
]

We recall Popa’s irreducible hyperfinite subfactor theorem #cite(label("Popa1981")) and give the finite-factor construction needed here.

#thm([Lemma 5.3.])[
  (Increasing matrix algebras with scalar relative commutant).  #emph[Every separable-predual $upright("II")_1$ factor $M$ contains an irreducible unital hyperfinite $upright("II")_1$ subfactor $R$. One can write $R = \( union.big_j Q_j \)''$, where $Q_j$ are increasing unital full matrix algebras and their sizes tend to infinity.]
] <lem:irreducible-hyperfinite>

#proof[
  We first make a single selfadjoint element nearly scalar under a matrix average. Let $P$ be a $upright("II")_1$ factor, $y = y^(*) in P$, and $epsilon > 0$. Choose a spectral step approximation $y_0 = sum_(i = 1)^l lambda_i p_i$, where $sum_i p_i = I$. For a sufficiently large integer $b$, split $floor.l b tau \( p_i \) floor.r$ orthogonal projections of trace $1 \/ b$ from each $p_i$. The remaining projection has trace
  $ frac(b - sum_i floor.l b tau \( p_i \) floor.r, b) < l / b \, $
  and also splits into projections of trace $1 \/ b$. The resulting $b$ equivalent projections extend to matrix units for a unital $F tilde.equiv M_b \( bb(C) \)$ in $P$. Let $y_1 in F$ be diagonal, equal to $lambda_i$ on the pieces taken from $p_i$ and zero on the remainder. Then
  $ lr(bar.v.double y - y_1 bar.v.double)_2 lt.eq lr(bar.v.double y - y_0 bar.v.double)_2 + lr(bar.v.double y_0 bar.v.double) sqrt(l \/ b) . $
  Haar averaging over $cal(U) \( F \)$ sends $y_1$ to $tau \( y_1 \) I$. Contractivity of this average in $L^2$ gives
  #[#set math.equation(numbering: n => "(5.1)")
   $ lr(bar.v.double E_(F' ∩ P) \( y \) - tau \( y \) I bar.v.double)_2 lt.eq 2 lr(bar.v.double y - y_1 bar.v.double)_2 < epsilon \, $ <eq:one-element-matrix-average>]
  by first choosing $y_0$ and then $b gt.eq 2$.
  Choose an $L^2$-dense sequence $\( x_j \)$ in the selfadjoint unit ball of $M$, and enumerate the requirements $\( j \, k \) in bb(N)^2$. Start with $Q_0 = bb(C) I$. Given a full matrix algebra $Q_n$, its relative commutant $P_n = Q'_n ∩ M$ is a $upright("II")_1$ factor: matrix units identify $M$ with a matrix algebra over one of its corners and $P_n$ with that corner. For the next requirement $\( j \, k \)$ apply (5.1) in $P_n$ to $E_(P_n) \( x_j \)$, with error $1 \/ k$. If $F subset.eq P_n$ is the resulting matrix algebra, set $Q_(n + 1) = Q_n or F$. These commuting matrix algebras generate a full matrix algebra of at least twice the size of $Q_n$, and
  $ P_(n + 1) = F' ∩ P_n \, #h(2em) E_(P_(n + 1)) = E_(P_(n + 1)) E_(P_n) . $
  Hence $lr(bar.v.double E_(P_(n + 1)) \( x_j \) - tau \( x_j \) I bar.v.double)_2 < 1 \/ k$, and all earlier bounds persist under subsequent expectations. For $R = \( union.big_n Q_n \)''$ the expectation onto $R' ∩ M = ⋂_n P_n$ thus sends every $x_j$ to $tau \( x_j \) I$. Density gives $R' ∩ M = bb(C) I$. In particular $R$ is a factor; it is finite and has unital matrix subalgebras of unbounded size, so it is of type $upright("II")_1$. Its increasing matrix presentation makes it hyperfinite. ◻
]

We will repeatedly use the following consequence of this construction. If $E_j$ denotes Haar averaging over $cal(U) \( Q_j \)$, then $E_j$ is the orthogonal projection in $L^2 \( M \, tau \)$ onto $L^2 \( Q'_j ∩ M \)$. These decreasing subspaces intersect in $bb(C) I$, so

#[#set math.equation(numbering: n => "(5.2)")
 $ E_j \( x \) arrow.r tau \( x \) I quad upright("in ") L^2 \( M \, tau \) #h(2em) \( x in M \) . $ <eq:irreducible-averages>]

Here is a direct justification avoiding any boundedness assumption on a Hilbert-space vector. Decreasing orthogonal projections have a strong Hilbert-space limit. For bounded $x$, the operators $E_j \( x \)$ are uniformly bounded, and every weak-operator cluster belongs to all $Q'_j ∩ M$, hence is scalar; its trace identifies it as $tau \( x \) I$. Applying the cluster to $Omega$ identifies the Hilbert-space limit. Density of the bounded vectors then gives the assertion on the whole trace Hilbert space.

=== 5.2 Common tracial position <common-tracial-position>

A factor $P subset.eq cal(B) \( K \)$ is in #emph[standard tracial position] with unit vector $Omega$ when $x mapsto x Omega$ identifies $K$ with $L^2 \( P \, tau_P \)$. Its conjugation $J_P$ is determined by $J_P \( x Omega \) = x^(*) Omega$.

The representation theorem we use is the following part of #cite(label("CCSSWW2014"), form: "prose") Lemma 4.10. We state it separately because it changes the Hilbert space and does not itself give the unitary in 20.

#thm([Proposition 5.4.])[
  (Common-position theorem).  #emph[Let $M \, N$ be separable-predual $upright("II")_1$ factors acting nondegenerately on one Hilbert space, with mutual strict $g$-near inclusions, where $0 < g < 1.74 dot.op 10^(- 13)$. Suppose that an amenable von Neumann subalgebra $R subset.eq M ∩ N$ satisfies $R' ∩ M subset.eq R$. There are faithful normal representations $pi : M arrow.r cal(B) \( K \)$ and $rho : N arrow.r cal(B) \( K \)$, a common unit vector $Omega$, and a number $beta < 50948 sqrt(g)$ such that:]
  + #emph[both images are in standard tracial position with vector $Omega$;]
  + #emph[$pi \|_R = rho \|_R$, and the images have mutual strict $beta$-near inclusions;]
  + #emph[for original contractions $x in M$, $y in N$, 
$ lr(bar.v.double pi \( x \) - rho \( y \) bar.v.double) lt.eq beta + lr(bar.v.double x - y bar.v.double) \; $

]
  + #emph[if $e_R$ is the projection onto $overline(pi \( R \) Omega)$, then $\( pi \( M \) union { e_R } \)'' = \( rho \( N \) union { e_R } \)''$.]
  #emph[The space $K$ can be taken separable.]
] <prop:finite-common-position>

Below, after applying the proposition, we suppress $pi \, rho$ when discussing its images. Normalizing near-inclusion approximants gives

#[#set math.equation(numbering: n => "(5.3)")
 $ d \( M \, N \) lt.eq 2 beta . $ <eq:standard-gap>]

#thm([Lemma 5.5.])[
  (The common right action).  #emph[In the setting of 23, the right actions of $R$ agree elementwise: 
$ J_M r J_M = J_N r J_N #h(2em) \( r in R \) . $

 In particular $T = J_N J_M - I$ commutes with the left and right actions of $R$.]
] <lem:finite-right-action>

#proof[
  The commutant of $\( M union { e_R } \)''$ is $J_M R J_M$. Indeed, an element of $M'$ is right multiplication by an element of $M$. If it commutes with $e_R$, applying it to $Omega$ shows that its right multiplier lies in $L^2 \( R \) ∩ M = R$, where the equality follows from the trace expectation. Conversely right multiplication by $R$ reduces $L^2 \( R \)$. The same argument applies to $N$. Equality of the basic constructions therefore gives $J_M R J_M = J_N R J_N$. For each $r in R$ the two displayed operators take $Omega$ to $r^(*) Omega$. The vector $Omega$ is separating for the common right algebra, since it is cyclic for $M$, so the operators are equal. Applying these identities twice proves the last assertion. ◻
]

#thm([Lemma 5.6.])[
  (Testing a bimodular operator on bounded algebra elements).  #emph[Let $M$ be a $upright("II")_1$ factor and let $R = \( union.big_j Q_j \)'' subset.eq M$ be as in 22. If a bounded operator $V$ on $L^2 \( M \, tau \)$ commutes with left and right multiplication by $R$, then 
$ lr(bar.v.double V bar.v.double) lt.eq 384 sup_(a \, b in M_1) \| chevron.l V a Omega \, b Omega chevron.r \| . $

]
] <lem:finite-ball-tests>

#proof[
  Denote the supremum by $K$. Start with bounded $a \, b in M$ with $lr(bar.v.double a bar.v.double)_2 \, lr(bar.v.double b bar.v.double)_2 lt.eq 1$, without an operator-norm bound. By (5.2), finite convex averages of conjugations by unitaries of $R$ can bring both $a a^(*)$ and $b b^(*)$ within one of their scalar traces in $L^2$. One first takes a sufficiently high Haar average and then approximates its integral by a finite sum; rational weights and repetitions give equal weights. Choose such a family $\( d_i \)$. Independently choose a family $\( e_l \)$ so that the averages of $e_l^(*) a^(*) a e_l$ and $e_l^(*) b^(*) b e_l$ have the same property. Enumerate the Cartesian product of the two families by $k = 1 \, dots.h \, m$ and put $a_k = d_i a e_l$, $b_k = d_i b e_l$. Their covariance averages satisfy
  $ L_a = 1 / m sum_k a_k a_k^(*) \, quad Q_a = 1 / m sum_k a_k^(*) a_k \, #h(2em) lr(bar.v.double L_a bar.v.double)_2 \, lr(bar.v.double Q_a bar.v.double)_2 lt.eq 2 \, $
  and the same bounds hold for $L_b \, Q_b$.
  Use the same independent fair signs in the two sums
  $ A = m^(- 1 \/ 2) sum_k epsilon.alt_k a_k \, #h(2em) B = m^(- 1 \/ 2) sum_k epsilon.alt_k b_k . $
  Bimodularity and sign orthogonality give
  #[#set math.equation(numbering: n => "(5.4)")
   $ bb(E) chevron.l V A Omega \, B Omega chevron.r = chevron.l V a Omega \, b Omega chevron.r \, #h(2em) bb(E) lr(bar.v.double A bar.v.double)_2^2 \, med bb(E) lr(bar.v.double B bar.v.double)_2^2 lt.eq 1 . $ <eq:finite-random-pairing>]
  Put $lr(bar.v.double x bar.v.double)_4^4 = tau \( \( x^(*) x \)^2 \)$. The three pairings in the fourth moment give exactly
  $ bb(E) lr(bar.v.double A bar.v.double)_4^4 = tau \( Q_a^2 \) + tau \( L_a^2 \) + 1 / m^2 sum_(k \, l) tau \( \( a_k^(*) a_l \)^2 \) - 2 / m^2 sum_k tau \( \( a_k^(*) a_k \)^2 \) . $
  Tracial Cauchy–Schwarz gives $\| tau \( \( a_k^(*) a_l \)^2 \) \| lt.eq tau \( a_k a_k^(*) a_l a_l^(*) \)$. Dropping the last nonpositive term therefore yields
  $ bb(E) lr(bar.v.double A bar.v.double)_4^4 lt.eq lr(bar.v.double Q_a bar.v.double)_2^2 + 2 lr(bar.v.double L_a bar.v.double)_2^2 lt.eq 12 \, #h(2em) bb(E) lr(bar.v.double B bar.v.double)_4^4 lt.eq 12 . $
  If $A = w \| A \|$, set $A_s = w \| A \| 1_(\[ 0 \, s \]) \( \| A \| \)$ and define $B_s$ similarly. These operators have norm at most $s$, their $L^2$ norms do not increase, and
  $ bb(E) lr(bar.v.double A - A_s bar.v.double)_2^2 lt.eq 12 \/ s^2 \, #h(2em) bb(E) lr(bar.v.double B - B_s bar.v.double)_2^2 lt.eq 12 \/ s^2 . $
  Substituting them in (5.4) and applying Cauchy–Schwarz in probability gives
  $ \| chevron.l V a Omega \, b Omega chevron.r \| lt.eq s^2 K + frac(2 sqrt(12), s) lr(bar.v.double V bar.v.double) . $
  Take $s = 4 sqrt(12)$, and then take the supremum over the dense bounded $L^2$ unit vectors $a \, b$. We obtain $lr(bar.v.double V bar.v.double) lt.eq 192 K + lr(bar.v.double V bar.v.double) \/ 2$, proving the assertion. ◻
]

#thm([Lemma 5.7.])[
  (Norm control of tracial conjugations).  #emph[Let $M \, N subset.eq cal(B) \( K \)$ be $upright("II")_1$ factors in common standard tracial position with vector $Omega$. Suppose that $R subset.eq M ∩ N$ is an irreducible hyperfinite subfactor of $M$, presented by increasing matrix algebras, and that its right actions agree. If $d \( M \, N \) < b$, then 
$ lr(bar.v.double J_M - J_N bar.v.double) lt.eq C_J b \, #h(2em) C_J = 768 . $

]
] <lem:tracial-conjugations>

#proof[
  Set $T = J_N J_M - I$. The common right-action identity implies that $T$ commutes with both actions of $R$. For $x in M_1$ choose $y in N_1$ with $lr(bar.v.double x - y bar.v.double) < b$. Then
  $ lr(bar.v.double T x Omega bar.v.double) = lr(bar.v.double J_N x^(*) Omega - x Omega bar.v.double) lt.eq lr(bar.v.double \( x^(*) - y^(*) \) Omega bar.v.double) + lr(bar.v.double \( x - y \) Omega bar.v.double) < 2 b . $
  Thus the supremum in 25 is at most $2 b$. That lemma gives $lr(bar.v.double T bar.v.double) lt.eq 768 b$, and $lr(bar.v.double T bar.v.double) = lr(bar.v.double J_M - J_N bar.v.double)$. ◻
]

=== 5.3 From the boundary to a Jordan isomorphism <from-the-boundary-to-a-jordan-isomorphism>

We now work entirely in the common tracial representation. Our immediate objective, when $d \( M \, N \) < b$ is sufficiently small, is to construct a Hilbert-space unitary $S_0$ fixing $Omega$ such that, for every $u in cal(U) \( M \)$,

$ S_0 u Omega = b_u Omega \, #h(2em) b_u in cal(U) \( N \) \, #h(2em) lr(bar.v.double b_u - u bar.v.double) = O \( b \) \, $

with the error uniform in $u$. Unitaries linearly span $M$. Linearity of $S_0$ and the separating property of $Omega$ will make the assignment $u mapsto b_u$ extend to a unital linear map from $M$ to $N$. We will first prove that it preserves the Jordan product $x compose y = \( x y + y x \) \/ 2$; a linear map with this property is called a #emph[Jordan homomorphism]. After proving surjectivity, Herstein’s orientation theorem #cite(label("Herstein1956")) will leave only the multiplicative and antimultiplicative possibilities, and closeness will exclude the latter. We record its algebraic proof before constructing $S_0$. All closeness estimates here are in ordinary operator norm; complete boundedness enters when we return to the original representation.

#thm([Lemma 5.8.])[
  (The orientation of a Jordan map into a factor).  #emph[A surjective linear Jordan homomorphism between unital complex algebras, whose target is a factor von Neumann algebra, is either a homomorphism or an antihomomorphism.]
] <lem:jordan-orientation>

#proof[
  Write the map as $theta : cal(A) arrow.r N$, where $N$ is the target factor. Preservation of the Jordan product gives preservation of $x y x$, since $x y x = 2 x compose \( x compose y \) - x^2 compose y$, where $x compose y = \( x y + y x \) \/ 2$. Polarizing in $x$ gives preservation of $x y z + z y x$. Fix $a \, b$, and set
  $ A = theta \( a \) \, quad B = theta \( b \) \, quad D = theta \( a b \) \, quad E = theta \( b a \) = A B + B A - D \, #h(2em) h = D - A B \, quad k = D - B A . $
  Compute $theta \( a b thin c thin b a + b a thin c thin a b \)$ in two ways. The polarized triple identity gives $D C E + E C D$, where $C = theta \( c \)$; applying the unpolarized identity first to the inner and then to the outer products gives $A B C B A + B A C A B$. Expanding their equality yields
  $ h C k + k C h = 0 #h(2em) \( C in N \) \, $
  where surjectivity allows every $C$ in the target. Substitute $C = C_1 k C_2$, and use the same identity with $C_1$ and $C_2$ to move $h$ past the adjacent factors. The two resulting terms are equal, so
  $ h C_1 k C_2 k = 0 #h(2em) \( C_1 \, C_2 in N \) . $
  A factor is prime: $x N y = { 0 }$ implies $x = 0$ or $y = 0$, since the central supports of the support projections of nonzero $x \, y$ are both one. If $k eq.not 0$, primeness first gives $h C_1 k = 0$ for every $C_1$, and then $h = 0$. Thus, for each pair $\( a \, b \)$, either $theta \( a b \) = theta \( a \) theta \( b \)$ or $theta \( a b \) = theta \( b \) theta \( a \)$.
  For fixed $a$, the sets of $b$ satisfying these two respective identities are additive subgroups whose union is the whole additive group. A group cannot be the union of two proper subgroups: choose an element in each but not the other, and their sum belongs to neither. One identity therefore holds for all $b$. The same two-subgroup argument, now for those $a$ for which each identity holds for every $b$, makes one orientation hold globally. ◻
]

#thm([Proposition 5.9.])[
  #emph[There are absolute constants $b_0 > 0$ and $C_(upright("st")) > 0$ such that the following holds. Let $M \, N subset.eq cal(B) \( K \)$ be type $upright("II")_1$ factors on a separable Hilbert space in common standard tracial position with vector $Omega$. Suppose they contain a common hyperfinite $upright("II")_1$ subfactor $R$, irreducible in $M$ and generated by increasing matrix algebras, and that $J_M r J_M = J_N r J_N$ for every $r in R$. If $d \( M \, N \) < b < b_0$, then there is a normal unital star-isomorphism $theta.alt : M arrow.r N$ satisfying 
$ sup_(x in M_1) lr(bar.v.double theta.alt \( x \) - x bar.v.double) lt.eq C_(upright("st")) b . $

]
] <prop:finite-standard-isomorphism>

#proof[
  Choose a countable strongly dense subgroup $G subset.eq cal(U) \( M \)$. For each $g in G$ choose a unitary $v_g in N$ with $lr(bar.v.double v_g - g bar.v.double) lt.eq 3 b$: a contraction approximant to $g$ is invertible for $b < 1$, and its polar part has this bound. Thus
  $ sup_(g \, h in G) lr(bar.v.double v_g v_h - v_(g h) bar.v.double) lt.eq 9 b . $
  Apply 16 to these constant fields on the boundary space $\( D \, nu \)$ of 15. For sufficiently small absolute $b$ it gives measurable unitary fields $W_g : D arrow.r cal(U) \( N \)$ satisfying
  #[#set math.equation(numbering: n => "(5.5)")
   $ W_g \( x \) W_h \( g^(- 1) x \) = W_(g h) \( x \) \, #h(2em) sup_g lr(bar.v.double W_g - g bar.v.double)_(L^oo \( D \)) lt.eq C_1 b \, $ <eq:finite-boundary-cocycle>]
  where $C_1$ is absolute.
  To obtain this correspondence on unitary vectors, we will compare the cocycle with the original left and right actions, and then compare its two boundary values within $N$. The first comparison uses the separate action on $D^2$. Form its product cocycle and the constant representation
  $ Sigma_(g \, h) \( x \, y \) = W_g \( x \) J_N W_h \( y \) J_N \, #h(2em) U_(g \, h) = g J_M h J_M . $
  The left and right $N$ actions commute, so $Sigma$ is an exact cocycle for the separate $G^2$ action. By 26,
  $ sup_(g \, h) lr(bar.v.double Sigma_(g \, h) - U_(g \, h) bar.v.double)_oo lt.eq \( 2 C_1 + 2 C_J \) b . $
  The product version of 17 gives a measurable unitary field $L : D^2 arrow.r cal(U) \( K \)$, with $lr(bar.v.double L - I bar.v.double)_oo lt.eq C_2 b$, such that
  #[#set math.equation(numbering: n => "(5.6)")
   $ L \( x \, y \) U_(g \, h) = Sigma_(g \, h) \( x \, y \) L \( g^(- 1) x \, h^(- 1) y \) . $ <eq:finite-product-intertwiner>]
  The constants $C_1 \, C_2$, and all subsequent $C_i$ in this proof, are absolute.
  The field $L$ takes values in $cal(U) \( K \)$; its intertwining identity alone does not supply trace vectors of unitaries in $N$. For this we use the diagonal comparison. Equation (5.5) gives
  $ sup_g upright("ess") thin s u p_(x \, y in D) lr(bar.v.double W_g \( x \) W_g \( y \)^(*) - I bar.v.double) lt.eq 2 C_1 b . $
  For sufficiently small $b$, 18 therefore gives a measurable $a : D^2 arrow.r cal(U) \( N \)$ with $lr(bar.v.double a - I bar.v.double)_oo lt.eq C_3 b$ and
  #[#set math.equation(numbering: n => "(5.7)")
   $ a \( x \, y \) = W_g \( x \) a \( g^(- 1) x \, g^(- 1) y \) W_g \( y \)^(*) . $ <eq:finite-diagonal-unitary>]
  We can now combine the two comparisons: the vector field $f \( x \, y \) = L \( x \, y \)^(*) a \( x \, y \) Omega$ is equivariant for the diagonal representation $g mapsto U_(g \, g)$. Indeed right multiplication by $W_g \( y \)^(*)$ on trace vectors is $J_N W_g \( y \) J_N$, so (5.7) and (5.6) give $f \( x \, y \) = U_(g \, g) f \( g^(- 1) x \, g^(- 1) y \)$. By 19, $f$ is a constant invariant vector. The invariant vectors for $g mapsto g J_M g J_M$ are exactly $bb(C) Omega$. To see this, strong density extends invariance from $G$ to $cal(U) \( M \)$; averaging over $cal(U) \( Q_j \)$ acts on $x Omega$ as $E_j \( x \) Omega$ and converges to the projection onto $bb(C) Omega$ by (5.2). Hence
  #[#set math.equation(numbering: n => "(5.8)")
   $ L \( x \, y \)^(*) a \( x \, y \) Omega = lambda Omega \, #h(2em) \| lambda \| = 1 \, #h(2em) \| lambda - 1 \| lt.eq \( C_2 + C_3 \) b . $ <eq:finite-boundary-constant>]
  Discard one null set and all its countably many $G^2$ translates, so that the preceding identities hold at a chosen pair $\( x \, y \)$ and at all its translates. Define the Hilbert-space unitary
  $ S_0 = lambda a \( x \, y \)^(*) L \( x \, y \) . $
  It fixes $Omega$. Using (5.6) for $\( g \, 1 \)$ and (5.8) at $\( g^(- 1) x \, y \)$ gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ S_0 g Omega = a \( x \, y \)^(*) W_g \( x \) a \( g^(- 1) x \, y \) Omega = b_g Omega \, $ <eq:finite-unitary-images>]
  where $b_g in cal(U) \( N \)$ and $lr(bar.v.double b_g - g bar.v.double) lt.eq C_4 b$ uniformly in $g$.
  Every $u in cal(U) \( M \)$ is the strong limit of a sequence $g_j in G$. The vectors $b_(g_j) Omega = S_0 g_j Omega$ are Cauchy in trace $L^2 \( N \)$. For unitaries, traciality gives $lr(bar.v.double b_(g_j)^(*) - b_(g_l)^(*) bar.v.double)_2 = lr(bar.v.double b_(g_j) - b_(g_l) bar.v.double)_2$. Uniformly bounded $L^2$ convergence in the standard representation implies strong convergence: test first on the dense right-multiplier vectors $N' Omega$ and then use boundedness. Thus $b_(g_j)$ and their adjoints converge strongly, and their limits are a unitary $b_u in N$ and its adjoint. We obtain
  $ S_0 u Omega = b_u Omega \, #h(2em) lr(bar.v.double b_u - u bar.v.double) lt.eq C_4 b \, $
  where the norm inequality follows by weak closedness of the appropriate operator ball.
  Every element of $M$ is a linear combination of unitaries, so the rule
  #[#set math.equation(numbering: n => "(5.10)")
   $ theta.alt \( z \) Omega = S_0 z Omega #h(2em) \( z in M \) $ <eq:finite-jordan-map>]
  defines a linear map into $N$. It is well-defined because $Omega$ is separating for $N$. Writing a contraction as its real and imaginary selfadjoint parts, each an average of two unitaries, gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ theta.alt \( I \) = I \, #h(2em) lr(bar.v.double theta.alt \( z \) - z bar.v.double) lt.eq 2 C_4 b lr(bar.v.double z bar.v.double) quad \( z in M \) . $ <eq:finite-jordan-bound>]
  In particular $theta.alt$ is bounded, and it sends every unitary to a unitary. For $z = z^(*)$ expand $theta.alt \( e^(i t z) \)^(*) theta.alt \( e^(i t z) \) = I$ in operator norm. The coefficient of $t$ says $theta.alt \( z \)^(*) = theta.alt \( z \)$. Applying this also to $z^2$ and comparing the coefficient of $t^2$ gives $theta.alt \( z^2 \) = theta.alt \( z \)^2$. Complex linearity and polarization show that $theta.alt$ preserves adjoints and the Jordan product.
  When $2 C_4 b < 1$, (5.11) makes its range closed and makes $theta.alt$ injective. Every contraction of $N$ has distance at most $\( 1 + 2 C_4 \) b$ from this range, by the original gap and (5.11). For $\( 1 + 2 C_4 \) b < 1$ the range must be all of $N$: otherwise the quotient map by this proper closed linear subspace has norm one, contrary to that bound.
  27 shows that this surjective Jordan map is either multiplicative or antimultiplicative. The latter possibility is excluded by (5.11). Indeed, for unitaries $z \, w in M$ antimultiplicativity would give
  $ lr(bar.v.double z w - w z bar.v.double) lt.eq lr(bar.v.double z w - theta.alt \( z w \) bar.v.double) + lr(bar.v.double theta.alt \( w \) theta.alt \( z \) - w z bar.v.double) lt.eq 6 C_4 b . $
  A unital copy of $M_2 \( bb(C) \)$ in $M$ contains anticommuting selfadjoint unitaries, whose commutator has norm two. Taking $6 C_4 b < 2$ excludes the anti case. Thus $theta.alt$ is a unital star-isomorphism, and it is normal because a bijective order isomorphism of von Neumann algebras preserves all bounded increasing suprema. This proves the proposition, with $C_(upright("st")) = 2 C_4$ and one absolute sufficiently small $b_0$. ◻
]

=== 5.4 Return to the original Hilbert space <return-to-the-original-hilbert-space>

#proof[
  Choose $t > d \( M \, N \)$ below the absolute thresholds specified below. By 21, $N$ is a finite factor. If either factor is a matrix algebra, 2 for the mutual near inclusions gives the required near-identity conjugacy, with an absolute linear bound. We may therefore suppose both factors are of type $upright("II")_1$.
  Choose $R subset.eq M$ from 22. By 2, there is a unitary $w$ with $lr(bar.v.double w - I bar.v.double) lt.eq 150 t$ and $w R w^(*) subset.eq N$. Replacing $N$ by $N_0 = w^(*) N w$ makes $R$ common, and
  $ d \( M \, N_0 \) < 301 t . $
  Take $g = 302 t$ and apply 23, provided $g < 1.74 dot.op 10^(- 13)$. Write $M_s = pi \( M \)$, $N_s = rho \( N_0 \)$. Their common subfactor remains irreducible in $M_s$ by faithfulness. By 24 its right actions agree, and $d \( M_s \, N_s \) lt.eq 2 beta$, with $beta < 50948 sqrt(g)$. Choose a strict standard-gap bound $b = 3 dot.op 50948 sqrt(g)$. If $b < b_0$, 28 supplies a normal star-isomorphism $theta.alt_s : M_s arrow.r N_s$ with $lr(bar.v.double theta.alt_s - "id" bar.v.double) lt.eq C_(upright("st")) b$ on $M_s$.
  Transport it to the original representation:
  $ theta = rho^(- 1) theta.alt_s pi : M arrow.r N_0 . $
  For $x in M_1$ choose $y in \( N_0 \)_1$ with $lr(bar.v.double x - y bar.v.double) < g$. The original-contraction comparison in 23 and faithfulness of $rho$ give
  $ lr(bar.v.double theta \( x \) - x bar.v.double) & lt.eq lr(bar.v.double theta \( x \) - y bar.v.double) + lr(bar.v.double y - x bar.v.double)\
 & lt.eq lr(bar.v.double theta.alt_s pi \( x \) - pi \( x \) bar.v.double) + lr(bar.v.double pi \( x \) - rho \( y \) bar.v.double) + g\
 & lt.eq C_(upright("st")) b + beta + 2 g . $
  Let $e \( t \) = C_(upright("st")) b + 50948 sqrt(302 t) + 604 t$. This is an absolute function tending to zero.
  On the original $H xor H$, consider the faithful normal paired representation $x mapsto x xor theta \( x \)$ of $M$, and the selfadjoint switch $s \( xi \, eta \) = \( eta \, xi \)$. Its scalar commutator norm on that factor is at most $e \( t \)$. 8 therefore gives
  $ lr(bar.v.double "ad"_s \|_({ x xor theta \( x \) : x in M }) bar.v.double)_(upright("cb")) lt.eq C_(upright("amp")) e \( t \) . $
  At each matrix level the switch commutator has off-diagonal block $\[ x_(i j) - theta \( x_(i j) \) \]$, so equivalently $lr(bar.v.double theta - "id" bar.v.double)_(upright("cb")) lt.eq C_(upright("amp")) e \( t \)$. For sufficiently small absolute $t$, 4 gives a unitary $v in cal(B) \( H \)$ with $v M v^(*) = N_0$ and $lr(bar.v.double v - I bar.v.double) lt.eq C_(upright("pair")) C_(upright("amp")) e \( t \)$, for an absolute constant $C_(upright("pair"))$. Then $u = w v$ conjugates $M$ onto $N$, and
  $ lr(bar.v.double u - I bar.v.double) lt.eq 150 t + C_(upright("pair")) C_(upright("amp")) e \( t \) . $
  All thresholds used above are absolute. Besides $t < 1 \/ 10$, they are the bounds in Theorem 2.1, Lemma 2.3 and the two bounds in Proposition 5.4, Proposition 5.9. Choose $t_(upright("fin"))$ so that they hold for every $0 < t < t_(upright("fin"))$, and take $eta_(upright("fin"))$ to be the maximum of the displayed bound and the matrix-factor bound. These bounds are nondecreasing functions of $t$ and tend to zero. This establishes the claimed uniformity on the original Hilbert space. ◻
]

== 6 Preparing infinite factors and comparing modular graphs <sec:modular-preparation>

We now pass from infinite factors to a common modular setting. The input is ordinary closeness on a separable Hilbert space. After one small adjustment, proper infiniteness makes that closeness completely bounded. A fixed hyperfinite tensor factor then supplies an irreducible finite subfactor in a state centralizer. Aligning its left and right actions gives a common cyclic separating vector. The main estimate of this section compares the two Tomita graphs uniformly under rescaling. In 7, this estimate will permit a small change of position after which the modular group of one algebra preserves both algebras.

=== 6.1 A fixed tensor factor and common position <a-fixed-tensor-factor-and-common-position>

#thm([Lemma 6.1.])[
  (Amplification by common isometries).  #emph[Let $M \, N subset.eq cal(B) \( H \)$ contain the same unital copy of $cal(B) \( ell^2 \)$. Then $d_(upright("cb")) \( M \, N \) = d \( M \, N \)$.]
] <lem:common-infinite-amplification>

#proof[
  For each $n gt.eq 1$ choose isometries $s_1 \, dots.h \, s_n$ in that common copy such that $s_i^(*) s_j = delta_(i j) 1$ and $sum_i s_i s_i^(*) = 1$. The operator $V : H^n arrow.r H$ given by $V \( xi_i \) = sum_i s_i xi_i$ is unitary. For either $P = M$ or $P = N$,
  $ V M_n \( P \) V^(*) = P \, #h(2em) V \[ x_(i j) \] V^(*) = sum_(i \, j) s_i x_(i j) s_j^(*) . $
  Indeed the inverse coefficient formula is $x_(i j) = s_i^(*) x s_j$. The same unitary therefore identifies the two amplified unit balls with the two original unit balls. Taking the supremum over $n$ proves the assertion. ◻
]

We fix, once and for all,

$ lambda = e^(- 1) \, #h(2em) mu = e^(- sqrt(2)) . $

For $0 < nu < 1$, let $rho_nu$ be the state of $M_2 \( bb(C) \)$ with density $\( 1 + nu \)^(- 1) "diag" \( 1 \, nu \)$. Form a countable infinite tensor product containing infinitely many sites of each of the two types $\( M_2 \( bb(C) \) \, rho_lambda \)$ and $\( M_2 \( bb(C) \) \, rho_mu \)$, and denote its von Neumann algebra and product state by $\( D \, rho \)$. We use the tensor product of the site standard representations, on a separable Hilbert space $K$. The product vector $Omega_rho$ is cyclic for both left and right local matrix actions, and hence is cyclic and separating for $D$. Thus $rho$ is faithful and normal. Both $D$ and its standard commutant are hyperfinite: their finite site matrix algebras increase strongly to them.

We recall the modular notation. In a standard representation with a cyclic separating vector $Omega$ implementing a faithful normal state $psi$, the closure of $x Omega mapsto x^(*) Omega$ has polar decomposition $S = J Delta^(1 \/ 2)$. The antilinear isometry $J$ is the modular conjugation, and $sigma_t^psi \( x \) = Delta^(i t) x Delta^(- i t)$ is the modular automorphism group. The state determines this action independently of the chosen standard representation; see #cite(label("Takesaki2003II")) for Tomita–Takesaki theory.

For a faithful normal state $psi$ on an algebra $P$, its #emph[centralizer] is

$ P_psi = { a in P : psi \( a x \) = psi \( x a \) upright(" for every ") x in P } . $

It is also the fixed algebra of the modular automorphism group $sigma^psi$. We use the following precise continuous-core facts. The modular crossed product $P times.r_(sigma^psi) bb(R)$ is semifinite, with a faithful normal semifinite trace scaled by its dual action #cite(label("BlackadarOperatorAlgebras")) III.4.8.1–4, p. 329. For a type $upright("III")$ factor $P$, this crossed product is a factor exactly when $P$ is of type $upright("III")_1$; in that case it is of type $upright("II")_oo$ #cite(label("Takesaki1973")) Lemma 8.2 and Corollary 9.7. For a semifinite factor, choose a faithful normal semifinite trace $tau$. The modular crossed product is independent, up to isomorphism, of the faithful normal semifinite weight used to form it #cite(label("BlackadarOperatorAlgebras")) III.4.8.1, p. 329. Since $sigma^tau$ is trivial, this crossed product is $P overline(⊗) L \( bb(R) \) tilde.equiv P overline(⊗) L^oo \( bb(R) \)$ and is not a factor. Here $L \( bb(R) \)$ is the von Neumann algebra generated by translations on $L^2 \( bb(R) \)$, identified with $L^oo \( bb(R) \)$ by Fourier transform. Thus a factor has a factorial modular crossed product precisely when it is of type $upright("III")_1$.

#thm([Lemma 6.2.])[
  (The fixed tensor factor).  #emph[One has $D'_rho ∩ D = bb(C) 1$. If $A$ is any factor with separable predual, then $A overline(⊗) D$ is a type $upright("III")_1$ factor and 
$ A overline(⊗) D tilde.equiv \( A overline(⊗) D \) overline(⊗) R_lambda \, $

 where $R_lambda$ is the Powers factor obtained using only $\( M_2 \( bb(C) \) \, rho_lambda \)$ sites.]
] <lem:fixed-tensor-factor>

#proof[
  Swapping two sites of the same type is implemented by a unitary in a finite site algebra. This unitary preserves the product state, so it belongs to $D_rho$. Suppose $x in D'_rho ∩ D$. Given a finite site element $a$, choose bounded finite site approximants $x_j$ with $lr(bar.v.double \( x - x_j \) Omega_rho bar.v.double) arrow.r 0$. A product of the indicated swaps moves $a$ to an element $a_j$ supported away from $x_j$. Since $x$ commutes with the implementing unitary and the state is invariant,
  $ rho \( a x \) = rho \( a_j x \) \, #h(2em) rho \( a_j x_j \) = rho \( a \) rho \( x_j \) . $
  State Cauchy–Schwarz bounds the error in the first product by $rho \( a a^(*) \)^(1 \/ 2) lr(bar.v.double \( x - x_j \) Omega_rho bar.v.double)$; the other error tends to zero as well. Hence $rho \( a x \) = rho \( a \) rho \( x \)$ for every finite site $a$. Density gives $\( x - rho \( x \) 1 \) Omega_rho = 0$, and faithfulness gives $x = rho \( x \) 1$. In particular $D$ is a factor.
  Choose a faithful normal state $psi$ on $A$ and put $P = A overline(⊗) D$ with state $psi ⊗ rho$. In the regular representation of its modular crossed product on $L^2 \( bb(R) \, H_P \)$, the generators are
  $ \( pi \( x \) xi \) \( t \) = sigma_(- t)^(psi ⊗ rho) \( x \) xi \( t \) \, #h(2em) \( lambda_s xi \) \( t \) = xi \( t - s \) . $
  Here $H_P$ can be the standard space of $P$. Let $Z$ be central in the crossed product. After Fourier transform in $t$, commutation with every $lambda_s$ makes $Z$ a decomposable operator. The crossed product also commutes with the constant representation of $P'$. Consequently its decomposable field takes values in $P$. Commutation with the constant operators $1 ⊗ D_rho$ puts this field in $A ⊗ 1$: normal slices and $D'_rho ∩ D = bb(C) 1$ prove this relative-commutant identity.
  An off-diagonal matrix unit at a $nu$-site is a modular eigenoperator with frequency $log nu$ or $- log nu$. Its regular representation, after Fourier transform, is that matrix unit followed by a frequency translation. If $a \( zeta \) ⊗ 1$ denotes the field of $Z$, commutation therefore gives
  $ a \( zeta + log lambda \) = a \( zeta \) \, #h(2em) a \( zeta + log mu \) = a \( zeta \) quad upright("almost everywhere") . $
  The generated subgroup is countable and dense in $bb(R)$. Test the field on countably many vector coefficients. Translation continuity in local $L^1$ extends its invariance to every real translation, and convolution with compactly supported approximate identities shows that each coefficient is constant. Thus $Z = a_0 ⊗ 1$ is a constant field. Commutation with $pi \( A ⊗ 1 \)$, using strong continuity of the modular action and a countable strongly dense set, gives $a_0 in A' ∩ A = bb(C) 1$. The core is a factor, so the continuous-core criterion makes $P$ a type $upright("III")_1$ factor.
  Finally, adjoining another countable family of $lambda$-sites and reindexing that family gives the asserted absorption. All these tensor products preserve the displayed product states. The usual identification of the two-ratio product with the hyperfinite $upright("III")_1$ factor is also recorded in #cite(label("Haagerup1987")) Example 1.6, p. 103; the argument above establishes the additional assertion for every $A$. ◻
]

For a faithful normal state $psi$ on $P$, its #emph[bicentralizer] $upright(B) \( P \, psi \)$ consists of those $a in P$ for which $lr(bar.v.double \[ a \, x_n \] bar.v.double)_psi arrow.r 0$ whenever $\( x_n \)$ is a bounded sequence in $P$ and $lr(bar.v.double x_n psi - psi x_n bar.v.double) arrow.r 0$. Here $lr(bar.v.double x bar.v.double)_psi = psi \( x^(*) x \)^(1 \/ 2)$, and the last norm is the predual norm of the functional $y mapsto psi \( y x_n - x_n y \)$. We use the following consequence of two established results. If a $sigma$-finite type $upright("III")_1$ factor $P$ absorbs $R_lambda$ for some $0 < lambda < 1$, then its bicentralizer is $bb(C) 1$ #cite(label("Marrakchi2020")) Theorem D(ii). For a type $upright("III")_1$ factor with separable predual, trivial bicentralizer gives an irreducible hyperfinite $upright("II")_1$ subfactor $R subset.eq P$ with a faithful normal conditional expectation $E : P arrow.r R$. The finite subfactor is constructed in #cite(label("Haagerup1987")) Lemma 3.8 and the proof of Theorem 3.1, $\( 2 \) arrow.r.double \( 3 \)$, pp. 142–145: the construction first gives such a subfactor in a nonzero corner, which is isomorphic to $P$. This statement imposes no injectivity assumption on $P$. The state $tau_R compose E$ centralizes $R$, by bimodularity of $E$.

#prodef([Definition 6.3.])[
  (Prepared pair).  A #emph[prepared pair] consists of type $upright("III")_1$ factors $M \, N subset.eq cal(B) \( H \)$ on a separable Hilbert space, a common cyclic separating unit vector $Omega$, and a hyperfinite $upright("II")_1$ factor $R subset.eq M ∩ N$ such that
  + $R' ∩ M = R' ∩ N = bb(C) 1$;
  + the vector state $phi \( x \) = chevron.l x Omega \, Omega chevron.r$ centralizes $R$ when restricted to either algebra;
  + $J_M r J_M = J_N r J_N$ for every $r in R$, where $J_M \, J_N$ are the modular conjugations associated with $Omega$.
] <def:prepared-pair>

#thm([Proposition 6.4.])[
  (Preparing an infinite pair).  #emph[There are absolute constants $c \, C > 0$ with the following property. Suppose $M_0 \, N_0 subset.eq cal(B) \( H \)$ are factors on a separable Hilbert space, $M_0$ is infinite, and $d \( M_0 \, N_0 \) < t < c$. For the fixed $D subset.eq cal(B) \( K \)$ above, there are unitaries $u_0 in cal(B) \( H \)$ and $v in cal(B) \( H ⊗ K \)$ satisfying 
$ lr(bar.v.double u_0 - 1 bar.v.double) + lr(bar.v.double v - 1 bar.v.double) lt.eq C t $

 such that 
$ M = M_0 overline(⊗) D \, #h(2em) N = v #scale(x: 120%, y: 120%)[\(] \( u_0 N_0 u_0^(*) \) overline(⊗) D #scale(x: 120%, y: 120%)[\)] v^(*) $

 form a prepared pair and $d_(upright("cb")) \( M \, N \) lt.eq C t$.]
] <prop:prepared-pair>

#proof[
  A countably decomposable infinite factor is properly infinite and contains a unital copy of $cal(B) \( ell^2 \)$: split its identity into countably many equivalent projections and choose corresponding matrix units #cite(label("BlackadarOperatorAlgebras")) III.1.3.5 and III.1.5.1, pp. 243, 247. 2 embeds this amenable subfactor of $M_0$ into $N_0$ by a unitary of norm distance at most $150 t$ from 1. Conjugating $N_0$ in the inverse direction gives $u_0$ for which the subfactor is common. This also proves that $N_0$ is infinite. The adjusted ordinary gap is at most $301 t$. 29 makes this also a cb gap. 6 transfers it to the tensor pair because $D'$ is hyperfinite. By 30, both tensor factors are of type $upright("III")_1$ and absorb $R_lambda$.
  For the moment write $N_1 = \( u_0 N_0 u_0^(*) \) overline(⊗) D$. The bicentralizer and expected-subfactor results just stated give an irreducible hyperfinite $upright("II")_1$ factor $R subset.eq M$ and a faithful normal state $phi$ on $M$ centralizing $R$. The given representation of $M$ has a cyclic separating vector realizing $phi$. Here is the representation point needed for this assertion. A normal representation on a separable space splits as a countable sum of cyclic normal representations. Each cyclic summand embeds in the standard representation by the standard-form vector implementing its vector functional #cite(label("Haagerup1975")) Lemma 2.10(1), p. 278. A countable amplification of the standard representation is unitarily equivalent to it, since its type $upright("III")$ commutant contains a countable family of isometries with ranges summing to 1. Finally, every nonzero projection in that countably decomposable type $upright("III")$ commutant is equivalent to 1 #cite(label("BlackadarOperatorAlgebras")) Theorem III.1.7.9. Thus every nonzero normal representation here is equivalent to the standard one. Transport the standard vector for $phi$ to obtain the desired $Omega$ on the actual space $H ⊗ K$. No conjugation of either algebra is made in this choice.
  Put $S = J_M R J_M subset.eq M'$. Centralization gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ r Omega = J_M r^(*) J_M Omega #h(2em) \( r in R \) . $ <eq:common-central-vector>]
  First apply 2 to $R subset.eq M$ and its near inclusion in $N_1$. It gives a unitary $v_1$ with $v_1 R v_1^(*) subset.eq N_1$ and $lr(bar.v.double v_1 - 1 bar.v.double) = O \( t \)$. Put $N_2 = v_1^(*) N_1 v_1$, so $R subset.eq M ∩ N_2$. Cb gaps change by at most twice the norm distance of the adjusting unitary from 1. Thus 3 gives $d \( M' \, N'_2 \) = O \( t \)$. Apply 2 to $S subset.eq M'$ and its near inclusion in $N'_2$. It gives a unitary $v_2$ with
  $ v_2 S v_2^(*) subset.eq N'_2 \, #h(2em) lr(bar.v.double v_2 - 1 bar.v.double) = O \( t \) \, #h(2em) v_2 in \( S union N'_2 \)'' subset.eq R' . $
  Set $N = v_2^(*) N_2 v_2$. Since $v_2$ commutes with $R$, this algebra still contains $R$, and now $S subset.eq N'$. The algebra $M$, its state $phi$, and the vector $Omega$ have remained fixed. The unitary in the statement is $v = v_2^(*) v_1^(*)$, with $lr(bar.v.double v - 1 bar.v.double) = O \( t \)$, and the resulting cb gap is $O \( t \)$.
  We next check irreducibility and the vector, rather than assume they survive an arbitrary small perturbation. Choose increasing matrix subfactors $R_j$ strongly generating $R$. Haar averaging over $cal(U) \( R_j \)$ converges weakly on $M$ to $x mapsto phi \( x \) 1$. Indeed every bounded cluster point commutes with all $R_j$, hence is scalar, and the averages preserve $phi$. If a nontrivial projection $p in R' ∩ N$ existed, a close approximant $x in M$ would therefore give
  $ "dist" \( p \, bb(C) 1 \) lt.eq lr(bar.v.double p - x bar.v.double) = O \( t \) . $
  The left side is $1 \/ 2$. Taking $t$ sufficiently small proves $R' ∩ N = bb(C) 1$. The same argument in the commutants, with $S$ and the vector state on $M'$, proves $S' ∩ N' = bb(C) 1$.
  Let $p$ be the projection onto $overline(N' Omega)$. It belongs to $N$. By (6.1), this subspace reduces $R$: for $r in R$ and $x' in N'$, the vector $r x' Omega = x' r Omega$ lies in $overline(N' Omega)$, and the same holds for $r^(*)$. Thus $p in R' ∩ N$, so $p = 1$. Similarly the projection onto $overline(N Omega)$ belongs to $S' ∩ N'$ and is 1. Hence $Omega$ is cyclic and separating for $N$. The common commuting right action in (6.1) shows that its state on $N$ is invariant under conjugation by $cal(U) \( R \)$, and hence centralizes $R$. The two operators $J_M r J_M \, J_N r J_N in N'$ now agree on $Omega$; since $Omega$ is separating for $N'$, they agree everywhere. All conditions in 31 are satisfied. ◻
]

=== 6.2 Flattening rescaled Tomita graphs <flattening-rescaled-tomita-graphs>

Fix a prepared pair on a space denoted again by $H$. Choose increasing unital matrix subfactors $R_j$ strongly generating its common subfactor $R$. For $P = M \, N$, let $S_P$ be the closure of $x Omega mapsto x^(*) Omega$ and write $S_P = J_P Delta_P^(1 \/ 2)$. For $c > 0$, let $E_c^P$ be the orthogonal projection in $H xor overline(H)$ onto the closure of

#[#set math.equation(numbering: n => "(6.2)")
 $ g_c \( x \) = \( x Omega \, c thin overline(x^(*) Omega) \) \, #h(2em) x in P . $ <eq:rescaled-graph>]

The conjugate Hilbert space makes this a complex linear graph. Our next result gives uniform control even as $c$ tends to zero or infinity. Bounding $x$ in the ordinary operator norm directly would lose this uniformity. We instead flatten a graph vector and then replicate it into a row, where cb closeness supplies the needed estimate.

#thm([Proposition 6.5.])[
  (Uniform graph comparison).  #emph[There is an absolute constant $C$ such that every prepared pair with $d_(upright("cb")) \( M \, N \) lt.eq gamma$ satisfies 
$ sup_(c > 0) lr(bar.v.double E_c^M - E_c^N bar.v.double) lt.eq C gamma . $

]
] <prop:modular-graphs>

#proof[
  For $s in R$ put $R_s = J_M s^(*) J_M = J_N s^(*) J_N$. On either graph, the operation $g_c \( x \) mapsto g_c \( r x s \)$ for $r \, s in cal(U) \( R \)$ is the restriction of the common unitary
  $ \( r R_s \) xor overline(s^(*) R_(r^(*))) quad upright("on ") H xor overline(H) . $
  Both graph subspaces reduce these unitaries. Thus $T = \( 1 - E_c^N \) E_c^M$ commutes with them.
  ===== 6.2.1 A bounded element retaining the graph signal. <a-bounded-element-retaining-the-graph-signal.>
  First take $c = sqrt(k)$, $k in bb(N)$. If $T eq.not 0$, choose $x in M$ with
  $ lr(bar.v.double g_c \( x \) bar.v.double) = 1 \, #h(2em) lr(bar.v.double T g_c \( x \) bar.v.double) gt.eq 1 / 2 lr(bar.v.double T bar.v.double) . $
  Such vectors are dense in the graph. Write
  $ alpha = phi \( x^(*) x \) \, #h(2em) beta = phi \( x x^(*) \) \, #h(2em) alpha + k beta = 1 . $
  Choose independent Haar unitaries $u_i \, v_i in cal(U) \( R_j \)$ and independent signs $epsilon.alt_i in { - 1 \, 1 }$, and put
  $ x_i = u_i x v_i \, #h(2em) y = m^(- 1 \/ 2) sum_(i = 1)^m epsilon.alt_i x_i . $
  For fixed unitaries, the vectors $T g_c \( x_i \)$ all have the same norm. The sign second moment and the elementary Hilbert fourth-moment bound give
  $ bb(E)_epsilon.alt lr(bar.v.double T g_c \( y \) bar.v.double)^2 = lr(bar.v.double T g_c \( x \) bar.v.double)^2 \, #h(2em) bb(E)_epsilon.alt lr(bar.v.double T g_c \( y \) bar.v.double)^4 lt.eq 3 lr(bar.v.double T g_c \( x \) bar.v.double)^4 . $
  Consequently, with sign probability at least $1 \/ 12$,
  #[#set math.equation(numbering: n => "(6.3)")
   $ lr(bar.v.double T g_c \( y \) bar.v.double) gt.eq frac(lr(bar.v.double T bar.v.double), 2 sqrt(2)) . $ <eq:graph-sign-signal>]
  For completeness, this probability bound follows by applying Cauchy–Schwarz to the part of a nonnegative random variable above half its mean: $bb(P) \( Z gt.eq bb(E) Z \/ 2 \) gt.eq \( bb(E) Z \)^2 \/ \( 4 bb(E) Z^2 \)$.
  We need a simultaneous bound on the fourth moments of $y$. The Haar averages
  $ cal(E)_j \( a \) = integral_(cal(U) \( R_j \)) u a u^(*) thin d u #h(2em) \( a in M \) $
  converge weakly to $phi \( a \) 1$ as in the preceding proof. For distinct $i \, l$, centralizer cycling and Haar invariance give the exact identities
  $ bb(E) phi \( x_i^(*) x_i x_l^(*) x_l \) & = phi #scale(x: 120%, y: 120%)[\(] \( x^(*) x \) cal(E)_j \( x^(*) x \) #scale(x: 120%, y: 120%)[\)] \,\
bb(E) phi \( x_i^(*) x_l x_l^(*) x_i \) & = phi #scale(x: 120%, y: 120%)[\(] x^(*) cal(E)_j \( x x^(*) \) x #scale(x: 120%, y: 120%)[\)] . $
  For the first identity, cycle $v_i^(*)$ to the right and average over the Haar unitary $v_i v_l^(*)$. For the second, cycle $v_i^(*)$ and $v_i$ away and average over $u_i^(*) u_l$. Each formula contains just one weakly convergent average. The three sign-pairing terms in $phi \( \( y^(*) y \)^2 \)$ have expected limits
  $ bb(E) phi \( x_i^(*) x_i x_l^(*) x_l \) & arrow.r alpha^2 \,\
bb(E) phi \( x_i^(*) x_l x_l^(*) x_i \) & arrow.r alpha beta \,\
\| bb(E) phi \( x_i^(*) x_l x_i^(*) x_l \) \| & lt.eq bb(E) phi \( x_i^(*) x_l x_l^(*) x_i \) arrow.r alpha beta . $
  For the third, state Cauchy–Schwarz gives $\| phi \( a^2 \) \| lt.eq phi \( a a^(*) \)^(1 \/ 2) phi \( a^(*) a \)^(1 \/ 2)$, and the two expected factors agree by interchanging $i \, l$. The all-equal indices contribute $m^(- 1) phi \( \( x^(*) x \)^2 \)$. The same calculation for $y y^(*)$ interchanges $alpha \, beta$. For the fixed $x \, k$, first choose $m$ so that the weighted diagonal contribution satisfies
  $ frac(phi \( \( x^(*) x \)^2 \) + k phi \( \( x x^(*) \)^2 \), m) lt.eq 1 . $
  The limiting weighted off-diagonal contribution is at most $alpha^2 + k beta^2 + 2 \( k + 1 \) alpha beta lt.eq 6$, because $alpha + k beta = 1$ and $k gt.eq 1$. Now choose $j$ large enough that the weighted off-diagonal contribution is at most 7. Since $bb(E) lr(bar.v.double g_c \( y \) bar.v.double)^2 = 1$, these choices give
  #[#set math.equation(numbering: n => "(6.4)")
   $ bb(E) [lr(bar.v.double g_c \( y \) bar.v.double)^2 + phi \( \( y^(*) y \)^2 \) + k phi \( \( y y^(*) \)^2 \)] lt.eq 10 . $ <eq:graph-first-moment-bound>]
  Markov’s inequality bounds the probability that the bracket in (6.4) exceeds $240$ by $1 \/ 24$. Together with (6.3), this gives a realization with both properties. Fix such a $y$, and clip its singular values at a fixed constant $K_1$:
  $ z = y f_(K_1) \( \| y \| \) \, #h(2em) f_b \( t \) = min \( 1 \, b \/ t \) \, quad f_b \( 0 \) = 1 . $
  Functional calculus on both sides of the polar decomposition gives
  $ lr(bar.v.double g_c \( y - z \) bar.v.double)^2 lt.eq K_1^(- 2) [phi \( \( y^(*) y \)^2 \) + k phi \( \( y y^(*) \)^2 \)] . $
  Choose $K_1$ once so that $sqrt(240) \/ K_1 lt.eq 1 \/ \( 4 sqrt(2) \)$. Writing $a_0 = 1 \/ \( 4 sqrt(2) \)$, the signal loss satisfies
  $ lr(bar.v.double T g_c \( z \) bar.v.double) & gt.eq lr(bar.v.double T g_c \( y \) bar.v.double) - lr(bar.v.double T bar.v.double) lr(bar.v.double g_c \( y - z \) bar.v.double)\
 & gt.eq (frac(1, 2 sqrt(2)) - sqrt(240) / K_1) lr(bar.v.double T bar.v.double) gt.eq a_0 lr(bar.v.double T bar.v.double) . $
  Thus the choice of $K_1$ is independent of the size of $lr(bar.v.double T bar.v.double)$, and
  #[#set math.equation(numbering: n => "(6.5)")
   $ lr(bar.v.double z bar.v.double) lt.eq K_1 \, quad lr(bar.v.double T g_c \( z \) bar.v.double) gt.eq a_0 lr(bar.v.double T bar.v.double) \, quad phi \( z^(*) z \) lt.eq 240 \, quad phi \( z z^(*) \) lt.eq 240 \/ k . $ <eq:graph-clipped-vector>]
  ===== 6.2.2 A bounded row retaining the normalized signal. <a-bounded-row-retaining-the-normalized-signal.>
  We have produced a bounded element retaining the signal, but a single bounded-element approximation would still cost $sqrt(k) gamma$ on the second graph leg. To remove that factor, replicate $z$ into the row
  $ Y = \[ r_1 z med dots.h.c med r_k z \] \, #h(2em) A = Y Y^(*) \, $
  where the $r_i$ are independent Haar unitaries in a sufficiently large $R_j$. For rows of graph vectors use the normalized Hilbert norm
  $ lr(bar.v.double \( eta_i \)_(i = 1)^k bar.v.double)_(upright("av"))^2 = k^(- 1) sum_i lr(bar.v.double eta_i bar.v.double)^2 . $
  Equivariance makes the normalized signal of this row at least $a_0 lr(bar.v.double T bar.v.double)$ for every choice of the $r_i$. Put $alpha_z = phi \( z^(*) z \)$ and $beta_z = phi \( z z^(*) \)$. Haar averaging and centralizer cycling give
  $ bb(E) phi \( A^2 \) & arrow.r k phi \( \( z z^(*) \)^2 \) + k \( k - 1 \) beta_z^2 \,\
bb(E) [k^(- 1) sum_i phi \( Y_i^(*) A Y_i \)] & arrow.r phi \( \( z^(*) z \)^2 \) + \( k - 1 \) alpha_z beta_z . $
  For example, the second off-diagonal term averages $z z^(*)$ under $r_i^(*) r_l$ between $z^(*)$ and $z$. By (6.5), the limits are bounded by an absolute constant: use $phi \( \( z z^(*) \)^2 \) lt.eq K_1^2 beta_z$ and $phi \( \( z^(*) z \)^2 \) lt.eq K_1^2 alpha_z$ for the diagonals. Choose the stage and then a realization with
  #[#set math.equation(numbering: n => "(6.6)")
   $ phi \( A^2 \) + k^(- 1) sum_i phi \( Y_i^(*) A Y_i \) lt.eq C_1 \, $ <eq:graph-row-moments>]
  where $C_1$ is absolute.
  Clip the whole row on the left:
  $ X = f_(K_2) \( A^(1 \/ 2) \) Y \, $
  so $lr(bar.v.double X bar.v.double) lt.eq K_2$. If $Q = 1 - f_(K_2) \( A^(1 \/ 2) \)$, then $Q^2 lt.eq A \/ K_2^2$ and $Y - X = Q Y$. As $c^2 = k$, its normalized squared graph error is
  $ k^(- 1) sum_i lr(bar.v.double g_c \( Y_i - X_i \) bar.v.double)^2 & = k^(- 1) sum_i phi \( Y_i^(*) Q^2 Y_i \) + phi \( Q A Q \)\
 & lt.eq C_1 \/ K_2^2 . $
  Choose the absolute $K_2$ so that $sqrt(C_1) \/ K_2 lt.eq a_0 \/ 2$. The same proportional error estimate for the row gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ lr(bar.v.double \( T g_c \( X_i \) \)_i bar.v.double)_(upright("av")) & gt.eq lr(bar.v.double \( T g_c \( Y_i \) \)_i bar.v.double)_(upright("av")) - lr(bar.v.double T bar.v.double) lr(bar.v.double \( g_c \( Y_i - X_i \) \)_i bar.v.double)_(upright("av"))\
 & gt.eq (a_0 - sqrt(C_1) / K_2) lr(bar.v.double T bar.v.double) gt.eq \( a_0 \/ 2 \) lr(bar.v.double T bar.v.double) . $ <eq:graph-final-signal>]
  ===== 6.2.3 Comparison at one matrix level and all rescalings. <comparison-at-one-matrix-level-and-all-rescalings.>
  Cb closeness gives a row $Z in M_(1 \, k) \( N \)$ with $lr(bar.v.double X - Z bar.v.double) lt.eq K_2 gamma$, with arbitrarily small slack if needed. For any row $\[ e_i \]$ of norm at most $eta$,
  $ k^(- 1) sum_i lr(bar.v.double g_c \( e_i \) bar.v.double)^2 = k^(- 1) sum_i phi \( e_i^(*) e_i \) + phi (sum_i e_i e_i^(*)) lt.eq 2 eta^2 . $
  Here the graph-vector formula itself makes sense for all operators on $H$, whether or not they lie in $M$ or $N$. Because $g_c \( X_i \) in "ran" E_c^M$ and $g_c \( Z_i \) in "ran" E_c^N$,
  $ lr(bar.v.double \( T g_c \( X_i \) \)_i bar.v.double)_(upright("av")) = lr(bar.v.double \( \( 1 - E_c^N \) g_c \( X_i \) \)_i bar.v.double)_(upright("av")) lt.eq sqrt(2) K_2 gamma . $
  Together with (6.7), this bounds $lr(bar.v.double \( 1 - E_c^N \) E_c^M bar.v.double)$ by an absolute multiple of $gamma$. If $T = 0$ the same assertion is immediate. Interchanging $M \, N$ gives the reverse bound, hence the claimed projection bound for $c = sqrt(k)$.
  The antiunitary flip $\( xi \, overline(eta) \) mapsto \( eta \, overline(xi) \)$ takes $g_c \( x \)$ to $c g_(1 \/ c) \( x^(*) \)$, so the bound also holds for $c = 1 \/ sqrt(k)$. For $c gt.eq 1$ choose $k = floor.l c^2 floor.r$; then $c \/ sqrt(k) in \[ 1 \, sqrt(2) \]$. Scaling the second leg by this ratio has condition number at most $sqrt(2)$ and increases either one-sided subspace gap by at most that factor. Reciprocal scaling handles $0 < c < 1$. Finally, for two orthogonal projections $E \, F$,
  $ lr(bar.v.double E - F bar.v.double) = max { lr(bar.v.double \( 1 - F \) E bar.v.double) \, lr(bar.v.double \( 1 - E \) F bar.v.double) } . $
  This proves the uniform assertion. ◻
]

=== 6.3 Separated spectral cuts <separated-spectral-cuts>

#thm([Corollary 6.6.])[
  (Logarithmic modular cuts).  #emph[For a prepared pair with $d_(upright("cb")) \( M \, N \) lt.eq gamma$, put $L_P = log Delta_P$, $P = M \, N$. There is an absolute constant $C$ such that, for every $a in bb(R)$, 
$ lr(bar.v.double 1_(\( - oo \, a - 1 \/ 2 \]) \( L_N \) 1_(\[ a + 1 \/ 2 \, oo \)) \( L_M \) bar.v.double) lt.eq C gamma . $

 The same estimate holds with $M \, N$ interchanged.]
] <cor:modular-cuts>

#proof[
  The upper-left block of the projection onto a closed operator graph is $\( 1 + A^(*) A \)^(- 1)$. Applied to (6.2), this gives $\( 1 + c^2 Delta_P \)^(- 1)$. With $g \( s \) = \( 1 + e^s \)^(- 1)$, 33 consequently yields
  $ lr(bar.v.double g \( L_M - a \) - g \( L_N - a \) bar.v.double) lt.eq C gamma #h(2em) \( a in bb(R) \) . $
  Let $p = 1_(\( - oo \, a - 1 \/ 2 \]) \( L_N \)$ and $q = 1_(\[ a + 1 \/ 2 \, oo \)) \( L_M \)$, and regard $p q$ as an operator $q H arrow.r p H$. Let $A$ and $B$ be the restrictions of $g \( L_N - a \)$ and $g \( L_M - a \)$ to those respective subspaces. Then
  $ A gt.eq g \( - 1 \/ 2 \) 1 \, #h(2em) B lt.eq g \( 1 \/ 2 \) 1 \, #h(2em) lr(bar.v.double A \( p q \) - \( p q \) B bar.v.double) lt.eq C gamma . $
  For $D = A \( p q \) - \( p q \) B$, integration of the derivative of $e^(- t A) \( p q \) e^(t B)$ gives
  $ p q = integral_0^oo e^(- t A) D e^(t B) thin d t \, #h(2em) lr(bar.v.double p q bar.v.double) lt.eq frac(lr(bar.v.double D bar.v.double), g \( - 1 \/ 2 \) - g \( 1 \/ 2 \)) . $
  The denominator is a fixed positive number. Reversing the two algebras proves the other estimate. ◻
]

== 7 Aligning the modular action <sec:modular-alignment>

The preceding section compares the spectral subspaces of two modular operators. We now turn that comparison into an algebra invariant under one modular group. Distances are measured in operator norm, and all constants are absolute. The selected unitaries need not depend continuously on time; the proof specifies the topology whenever continuity is used.

#thm([Proposition 7.1.])[
  (A common modular action).  #emph[There are absolute constants $c_(upright("mod")) \, C_(upright("mod")) > 0$ with the following property. Let $\( M \, N \, Omega \, R \)$ be a prepared pair as in 31, acting on the same separable Hilbert space $H$, and suppose that $d_(upright("cb")) \( M \, N \) < gamma < c_(upright("mod"))$. There is a unitary $q in cal(B) \( H \)$ such that 
$ lr(bar.v.double q - I bar.v.double) lt.eq C_(upright("mod")) gamma \, #h(2em) d_(upright("cb")) \( q M q^(*) \, N \) lt.eq C_(upright("mod")) gamma \, #h(2em) Delta_N^(i t) \( q M q^(*) \) Delta_N^(- i t) = q M q^(*) quad \( t in bb(R) \) . $

 The algebra $N$ and its modular group are unchanged.]
] <prop:modular-alignment>

The proof has three steps. A uniform infinitesimal estimate controls norm-continuous paths of approximate normalizers. Analytic smoothing puts the modular comparison into that setting, and a completely positive limit recovers exact normalizers at each time. Finally an averaging iteration corrects their multiplication law and produces the near-identity change of position.

We use two groups associated with a concrete factor $P subset cal(B) \( H \)$:

$ cal(G)_P = cal(U) \( P \) cal(U) \( P' \) \, #h(2em) cal(N)_P = { v in cal(U) \( cal(B) \( H \) \) : v P v^(*) = P } . $

The two factors in a product defining $cal(G)_P$ commute, so $cal(G)_P$ is a subgroup of $cal(N)_P$. We first prove a uniform estimate near this subgroup. This estimate uses only that $P$ is a separably acting type $upright("III")$ factor.

=== 7.1 Distance to the infinitesimal normalizers <distance-to-the-infinitesimal-normalizers>

#thm([Lemma 7.2.])[
  #emph[For a separably acting properly infinite von Neumann algebra $P subset cal(B) \( H \)$ and $h = h^(*) in cal(B) \( H \)$, 
$ "dist" \( h \, P' \) lt.eq 4 lr(bar.v.double "ad"_h \|_P bar.v.double) . $

]
] <lem:infinite-commutant-bound>

#proof[
  Put $d = lr(bar.v.double "ad"_h \|_P bar.v.double)$. Choose a unital copy $S$ of $cal(B) \( ell^2 \)$ in $P$, with matrix units $\( e_(i j) \)$ whose diagonal sum is $I$. The finite-dimensional unital algebras
  $ S_n = "span" { e_(i j) : 1 lt.eq i \, j lt.eq n } + bb(C) #scale(x: 180%, y: 180%)[\(] I - sum_(i = 1)^n e_(i i) #scale(x: 180%, y: 180%)[\)] $
  increase and generate $S$. Average $h$ over $cal(U) \( S_n \)$ and take a weak-operator cluster point $h_0$. Each average is self-adjoint, within $d$ of $h$, and has scalar commutator bound at most $d$ on $P$. These properties pass to the cluster point. Haar invariance at every earlier stage gives $h_0 in S'$.
  For any $k$, choose isometries $s_1 \, dots.h \, s_k in S$ with $s_i^(*) s_j = delta_(i j) I$ and $sum_i s_i s_i^(*) = I$. The unitary $V : H^k arrow.r H$, $V \( xi_i \) = sum_i s_i xi_i$, identifies $M_k \( P \)$ with $P$ and $h_0^(\( k \))$ with $h_0$. Consequently
  $ lr(bar.v.double "ad"_(h_0) \|_P bar.v.double)_(upright("cb")) lt.eq d . $
  By 3, $"dist" \( h_0 \, P' \) lt.eq d$, so in fact $"dist" \( h \, P' \) lt.eq 2 d$. The stated larger constant will be convenient. ◻
]

#thm([Lemma 7.3.])[
  (Uniform infinitesimal estimate).  #emph[There is an absolute $K < oo$ such that every separably acting type $upright("III")$ factor $P subset cal(B) \( H \)$ and every self-adjoint $h in cal(B) \( H \)$ satisfy 
#[#set math.equation(numbering: n => "(7.1)")
 $ "dist" \( h \, P + P' \) lt.eq K sup_(x in P_1) "dist" \( \[ h \, x \] \, P \) . $ <eq:normalizer-linear-bound>]

 The sum $P + P'$ here is a linear subspace; no closedness assertion about that sum is needed.]
] <lem:local-normalizer-linear>

#proof[
  Suppose there is no common $K$. By scaling a counterexample and subtracting a self-adjoint sum from $P + P'$, we can choose factors $P_j subset cal(B) \( H_j \)$ and self-adjoint $h_j$ with
  $ "dist" \( h_j \, P_j + P'_j \) = 1 \, #h(2em) lr(bar.v.double h_j bar.v.double) lt.eq 2 \, #h(2em) epsilon_j := sup_(x in \( P_j \)_1) "dist" \( \[ h_j \, x \] \, P_j \) arrow.r 0 . $
  Taking real parts justifies using a self-adjoint approximating sum. Its subtraction does not change either distance in the assertion, because its commutator with $P_j$ belongs to $P_j$.
  Fix a free ultrafilter $omega$ on $bb(N)$ and form the norm ultraproducts
  $ A = product_omega P_j subset product_omega cal(B) \( H_j \) = E . $
  Here a norm ultraproduct is the algebra of bounded sequences modulo the sequences whose operator norms tend to zero along $omega$. The algebra $A$ is simple. Indeed, a nonzero positive element $a$ has uniformly bounded positive representatives $a_j$ and a number $t > 0$ such that $e_j = 1_(\[ t \, oo \)) \( a_j \)$ is nonzero on a set in $omega$. In a separably acting type $upright("III")$ factor each nonzero projection is equivalent to $I$. Choose isometries $v_j$ with $v_j v_j^(*) = e_j$ on that set. Then $v_j^(*) a_j v_j gt.eq t I$ there. The class $v^(*) a v$ is invertible in $A$ and belongs to the ideal generated by $a$. Thus every nonzero closed ideal of $A$ contains $I$.
  Commutation with $\[ h_j \] in E$ defines a bounded derivation $D : A arrow.r A$. To see that its range is in $A$, choose, for every bounded sequence $x_j in P_j$, elements $y_j in P_j$ with
  $ lr(bar.v.double \[ h_j \, x_j \] - y_j bar.v.double) lt.eq \( epsilon_j + j^(- 1) \) sup_i lr(bar.v.double x_i bar.v.double) . $
  The $y_j$ are uniformly bounded, and their class is the commutator in $E$. Its definition is therefore independent of the choices; linearity and the derivation identity follow in $E$.
  Sakai’s theorem for simple unital $C^(*)$-algebras gives $a in A$ with $D \( x \) = \[ a \, x \]$ #cite(label("Sakai1971")) Section 1, p. 259; Section 2, p. 260. No separability of the norm ultraproduct is required. Since the $h_j$ are self-adjoint, replacing $a$ by $\( a + a^(*) \) \/ 2$ leaves this identity unchanged. Choose uniformly bounded self-adjoint representatives $a_j in P_j$. The equality of the two derivations implies
  $ lim_omega lr(bar.v.double "ad"_(h_j - a_j) \|_(P_j) bar.v.double) = 0 . $
  Otherwise contractions witnessing a fixed positive commutator norm could be selected at each coordinate of an ultrafilter-large set, contradicting equality on their class in $A$. 36 now gives
  $ 1 = "dist" \( h_j \, P_j + P'_j \) lt.eq "dist" \( h_j - a_j \, P'_j \) lt.eq 4 lr(bar.v.double "ad"_(h_j - a_j) \|_(P_j) bar.v.double) arrow.r_omega 0 \, $
  a contradiction. ◻
]

#thm([Lemma 7.4.])[
  (A path of approximate normalizers).  #emph[There are absolute constants $e_0 \, C_(upright("path")) > 0$ such that the following holds. Let $P subset cal(B) \( H \)$ be a separably acting type $upright("III")$ factor, let $I subset bb(R)$ be an interval containing $0$, and let $v : I arrow.r cal(U) \( cal(B) \( H \) \)$ be norm continuous with $v \( 0 \) = I$. If $0 lt.eq e < e_0$ and 
$ sup_(t in I) sup_(x in P_1) "dist" \( v \( t \) x v \( t \)^(*) \, P \) lt.eq e \, $

 then 
$ sup_(t in I) "dist" \( v \( t \) \, cal(G)_P \) lt.eq C_(upright("path")) e . $

 The constants are independent of the interval’s length.]
] <lem:local-normalizer-path>

#proof[
  Write $b \( t \) = "dist" \( v \( t \) \, cal(G)_P \)$. This is a continuous function, since distance to any nonempty subset is $1$-Lipschitz. Suppose $b = b \( t \)$ is smaller than a fixed absolute radius, and choose $p in cal(G)_P$ with $lr(bar.v.double p^(*) v \( t \) - I bar.v.double) < b + eta$. For sufficiently small $b + eta$, principal functional calculus writes $p^(*) v \( t \) = e^(i h)$ with $h = h^(*)$ and $lr(bar.v.double h bar.v.double) lt.eq 2 \( b + eta \)$. As $p$ normalizes $P$, this conjugation has the same one-sided approximation bound $e$. The twice-integrated conjugation formula gives
  $ lr(bar.v.double e^(i h) x e^(- i h) - x - i \[ h \, x \] bar.v.double) lt.eq 2 lr(bar.v.double h bar.v.double)^2 lr(bar.v.double x bar.v.double) . $
  It follows that
  $ sup_(x in P_1) "dist" \( \[ h \, x \] \, P \) lt.eq e + 2 lr(bar.v.double h bar.v.double)^2 . $
  Apply 37 and approximate $h$ by a self-adjoint sum $a + b'$ with $a in P$, $b' in P'$. Since $a$ and $b'$ commute, $e^(i \( a + b' \)) = e^(i a) e^(i b')$ belongs to $cal(G)_P$. The inequality $lr(bar.v.double e^(i h) - e^(i k) bar.v.double) lt.eq lr(bar.v.double h - k bar.v.double)$ for self-adjoint $h \, k$ therefore shows, on letting both approximation slacks vanish, that
  #[#set math.equation(numbering: n => "(7.2)")
   $ b \( t \) lt.eq K e + 8 K b \( t \)^2 quad upright("whenever ") b \( t \) upright(" is in that radius") . $ <eq:normalizer-path-barrier>]
  Choose $r > 0$ within the radius and with $8 K r lt.eq 1 \/ 4$. If $K e < r \/ 2$, the continuous function $b$, starting at zero, cannot first reach $r$: (7.2) would give $r < 3 r \/ 4$. Thus $b \( t \) < r$ throughout the interval between $0$ and any chosen $t in I$. Absorbing the quadratic term in (7.2) gives $b \( t \) lt.eq 2 K e$ uniformly. This proves the assertion with suitably reduced $e_0$. ◻
]

=== 7.2 Analytic approximation of the modular comparison <analytic-approximation-of-the-modular-comparison>

The next argument converts separated spectral-cut estimates into actual normalizers. Its analytic approximation takes place in operator norm away from the real axis. Its passage to the real axis uses the strong-\* topology at each fixed time; it does not require norm continuity of modular unitaries.

We first record explicitly the analytic fact needed below. On $cal(K) = L^2 \( bb(R) \, H \)$ put $D = - i thin d \/ d t$, with Fourier-transform convention

$ hat(f) \( xi \) = \( 2 pi \)^(- 1 \/ 2) integral_(bb(R)) e^(- i t xi) f \( t \) thin d t \, #h(2em) P_a = 1_(\( a \, oo \)) \( D \) . $

A bounded operator-valued function always means a field measurable on each vector, modulo a common null set, with essentially bounded operator norm. Here and below $H$ is separable. Integrals of such fields are defined by matrix coefficients, equivalently by integration on each vector when the kernel is integrable. No norm measurability as a $cal(B) \( H \)$-valued function is required.

#thm([Lemma 7.5.])[
  (Analytic extension of a frequency-preserving multiplier).  #emph[Suppose multiplication by a bounded field $B \( t \)$ on $L^2 \( bb(R) \, H \)$ preserves $P_0 cal(K)$. Then it is the boundary field of a bounded, operator-norm holomorphic function on the upper half-plane, given by 
#[#set math.equation(numbering: n => "(7.3)")
 $ B \( t + i r \) = integral_(bb(R)) frac(r, pi \( \( t - s \)^2 + r^2 \)) B \( s \) thin d s \, #h(2em) r > 0 . $ <eq:analytic-poisson>]

 Its norm is at most $upright("ess") thin s u p_s lr(bar.v.double B \( s \) bar.v.double)$. For two such fields, and any constant $x in cal(B) \( H \)$, the extension of the boundary product $B \( s \) x S \( s \)$ is $B \( z \) x S \( z \)$.]
] <lem:analytic-multiplier>

#proof[
  Write $w = \( t - i \) \/ \( t + i \)$ and give the unit circle normalized measure $d theta \/ \( 2 pi \)$. The transformation
  $ \( J f \) \( t \) = frac(1, sqrt(pi) \( t + i \)) f (frac(t - i, t + i)) $
  is unitary from $L^2 \( bb(T) \, H \)$ onto $cal(K)$: the change of variables has $d theta \/ \( 2 pi \) = d t \/ \( pi \( 1 + t^2 \) \)$. For $n gt.eq 0$, $J \( w^n \)$ is a linear combination of $\( t + i \)^(- k)$, $1 lt.eq k lt.eq n + 1$, whose Fourier transforms are supported in $\[ 0 \, oo \)$. For $n < 0$ its expression is a linear combination of $\( t - i \)^(- k)$, whose Fourier transforms are supported in $\( - oo \, 0 \]$. These support statements follow directly from
  $ \( t + i \)^(- k) = frac(\( - i \)^k, \( k - 1 \) !) integral_0^oo u^(k - 1) e^(- u) e^(i t u) thin d u $
  and its complex conjugate, interpreted under the $L^2$ Fourier transform. Since the images of all circle modes form an orthonormal basis, $J$ identifies the nonnegative-mode subspace with $P_0 cal(K)$.
  Conjugating the multiplier by $J$ gives the circle multiplier $tilde(B) \( w \) = B \( t \)$. Apply its invariant-subspace property to every constant vector. All negative Fourier coefficients of $tilde(B)$ vanish. If $b_n$ denotes its $n$th coefficient, defined by matrix coefficients, then
  $ F \( w \) = sum_(n gt.eq 0) b_n w^n \, #h(2em) \| w \| < 1 \, $
  converges in operator norm locally uniformly and is operator-norm holomorphic. Its value at $w = rho e^(i theta)$ is the circle Poisson integral of $tilde(B)$, since all its negative coefficients vanish. The Poisson kernel is positive and has integral one, so $lr(bar.v.double F \( w \) bar.v.double) lt.eq lr(bar.v.double tilde(B) bar.v.double)_oo$. Changing variables in the circle Poisson integral gives exactly (7.3); explicitly, harmonic measure at $t + i r$ pushes forward to $r thin d s \/ \( pi \( \( t - s \)^2 + r^2 \) \)$.
  For completeness, multiplication of these extensions can be checked without presupposing pointwise boundary limits. The radial Poisson integrals converge in $L^2 \( bb(T) \, H \)$ on each fixed vector, for both $tilde(B)$ and $tilde(B)^(*)$, and likewise for $tilde(S)$ and $tilde(S)^(*)$. Choose a sequence of radii tending to one along which these convergences hold pointwise for a countable dense family of vectors. Uniform boundedness extends the pointwise convergence to every vector. Along this sequence the products converge strongly-\* almost everywhere to $tilde(B) \( w \) x tilde(S) \( w \)$. Each Fourier coefficient of the bounded analytic product $F \( w \) x G \( w \)$ therefore converges, by dominated convergence on matrix coefficients, to the corresponding coefficient of that boundary product. In particular its negative coefficients vanish, and its nonnegative coefficients are precisely the Taylor coefficients of $F x G$. This proves the asserted product identity. The same argument applies to products with a scalar bounded analytic function. ◻
]

#thm([Lemma 7.6.])[
  (From modular cuts to near normalizers).  #emph[Let $M \, N subset.eq cal(B) \( H \)$ be a prepared pair on a separable Hilbert space, with $M$ of type $upright("III")$ and $d_(upright("cb")) \( M \, N \) lt.eq gamma$. Write 
$ U_P \( t \) = e^(i t L_P) \, #h(2em) L_P = log Delta_P quad \( P = M \, N \) \, #h(2em) W \( t \) = U_N \( t \) U_M \( t \)^(*) . $

 Assume the separated-cut estimate of 34, with its universal constant, and the local path estimate of 38. There are universal constants $gamma_0 > 0$ and $C$ such that, if $0 < gamma < gamma_0$, then for every $t in bb(R)$ there is a unitary $n_t$ satisfying 
$ n_t M n_t^(*) = M \, #h(2em) lr(bar.v.double n_t - W \( t \) bar.v.double) lt.eq C gamma . $

 No regularity of the choices $t mapsto n_t$ is asserted or needed.]
] <lem:modular-near-normalizers>

#proof[
  The letters $C$ below denote constants depending only on the universal constants in the stated inputs, and can increase between occurrences. All required smallness conditions are met by decreasing one universal $gamma_0$ at the end.
  ===== 7.2.1 The initial approximate normalizers. <the-initial-approximate-normalizers.>
  Both $U_M \( t \)$ and $U_N \( t \)$ normalize their respective algebras. For every matrix size $k$ and $x in M_k \( M \)_1$, first move $U_M \( t \)^(*) x U_M \( t \)$ into $M_k \( N \)_1$, conjugate by $U_N \( t \)$, and move back into $M_k \( M \)_1$. The two approximation errors are at most $gamma$ each, with arbitrarily small slack. Thus
  #[#set math.equation(numbering: n => "(7.4)")
   $ "dist" #scale(x: 120%, y: 120%)[\(] W \( t \)^(\( k \)) x W \( t \)^(\( k \) *) \, M_k \( M \)_1 #scale(x: 120%, y: 120%)[\)] lt.eq 2 gamma . $ <eq:W-cb-near-normalizer>]
  Here $T^(\( k \)) = I_(bb(C)^k) ⊗ T$. Applying the same two approximations before conjugating by $U_M \( t \)$ gives the corresponding assertion for $W \( t \)^(*) x W \( t \)$. Consequently
  #[#set math.equation(numbering: n => "(7.5)")
   $ d_(upright("cb")) #scale(x: 120%, y: 120%)[\(] W \( t \) M W \( t \)^(*) \, M #scale(x: 120%, y: 120%)[\)] lt.eq 2 gamma #h(2em) \( t in bb(R) \) . $ <eq:W-range-gap>]
  ===== 7.2.2 The frequency nest and its signs. <the-frequency-nest-and-its-signs.>
  Use the notation $cal(K) \, D \, P_a$ introduced above. Let $C_s$ denote multiplication by $e^(i s t)$, and let $cal(U)_P$ be multiplication by $U_P \( t \)$. Spectral calculus gives
  $ cal(U)_P^(*) D cal(U)_P = D + L_P \, #h(2em) C_s^(*) D C_s = D + s . $
  The sum on the right is the selfadjoint operator obtained from the commuting spectral measures on the two tensor factors; these identities therefore include their domains. They can also be checked in the spectral representation of $L_P$, where $cal(U)_P$ is a scalar frequency translation on each fiber. Put $cal(W) = cal(U)_N cal(U)_M^(*)$. Directly moving the spectral projections past these unitaries gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ \( 1 - P_a \) C_1 cal(W) P_a = C_1 cal(U)_N 1_(\( - oo \, a - 1 \]) \( D + L_N \) 1_(\( a \, oo \)) \( D + L_M \) cal(U)_M^(*) . $ <eq:shifted-nest-block>]
  After Fourier transformation the product in the middle has fiber
  $ 1_(\( - oo \, a - 1 - xi \]) \( L_N \) 1_(\( a - xi \, oo \)) \( L_M \) . $
  Its two thresholds have separation one, with midpoint $a - 1 / 2 - xi$. The cut estimate of 34 bounds its norm by $C gamma$, uniformly in $a$ and $xi$. The same argument with $M \, N$ interchanged applies to $C_1 cal(W)^(*)$. In particular
  #[#set math.equation(numbering: n => "(7.7)")
   $ sup_a lr(bar.v.double \( 1 - P_a \) C_1 cal(W) P_a bar.v.double) lt.eq C gamma \, #h(2em) sup_a lr(bar.v.double \( 1 - P_a \) C_1 cal(W)^(*) P_a bar.v.double) lt.eq C gamma . $ <eq:two-nest-errors>]
  Adjoin $0 \, I$ to the complete nest ${ P_a : a in bb(R) }$. Arveson’s distance formula for its nest algebra #cite(label("Arveson1975")) Theorem 1.1, p. 212 says that the distance of an operator $T$ to the operators preserving every $P_a cal(K)$ equals $sup_a lr(bar.v.double \( 1 - P_a \) T P_a bar.v.double)$. Choose preserving operators $T_B \, T_S$ with
  $ lr(bar.v.double T_B - C_1 cal(W) bar.v.double) lt.eq delta \, #h(2em) lr(bar.v.double T_S - C_1 cal(W)^(*) bar.v.double) lt.eq delta \, #h(2em) delta = C gamma \, $
  enlarging $C$ to allow slack in taking the infimum.
  ===== 7.2.3 Character averaging produces multipliers. <character-averaging-produces-multipliers.>
  The averaging below parallels Arveson’s construction of an expectation onto multiplication operators that preserves the frequency nest algebra on $L^2 \( bb(T) \)$ #cite(label("Arveson1975")) Proposition 5.1, pp. 228–229. Use the invariant mean on the discrete group $bb(R)$ from 7. For $T in cal(B) \( cal(K) \)$ put
  $ cal(E) \( T \) = m_s C_s T C_s^(*) . $
  This UCP map has range in the commutant of the scalar characters. Since $C_s^(*) P_a C_s = P_(a - s)$, conjugation by $C_s$ preserves the entire nest algebra. The coefficient average preserves it as well: each identity $\( 1 - P_a \) C_s T C_s^(*) P_a = 0$ remains zero after taking the mean. Both target multipliers $C_1 cal(W)$ and $C_1 cal(W)^(*)$ commute with every $C_s$, so averaging retains both approximation bounds.
  The scalar characters generate the scalar multiplication algebra $L^oo \( bb(R) \)$. Indeed, an $L^1$ function annihilating all characters has zero Fourier transform and hence is zero. Their commutant on $L^2 \( bb(R) \, H \)$ is therefore the algebra of decomposable operators. One may see the latter assertion by taking matrix coefficients relative to a countable orthonormal basis of $H$: each coefficient commutes with scalar multiplication and is itself a scalar multiplier; the operator norm bound on a countable dense set of finite vectors gives a common almost-everywhere bounded operator-valued field. Thus $cal(E) \( T_B \)$ and $cal(E) \( T_S \)$ are multipliers by fields $B \( s \) \, S \( s \)$ satisfying
  #[#set math.equation(numbering: n => "(7.8)")
   $ upright("ess") thin s u p_s lr(bar.v.double B \( s \) - e^(i s) W \( s \) bar.v.double) lt.eq delta \, #h(2em) upright("ess") thin s u p_s lr(bar.v.double S \( s \) - e^(i s) W \( s \)^(*) bar.v.double) lt.eq delta . $ <eq:B-S-boundary-errors>]
  They preserve $P_0 cal(K)$, so 39 applies. Write their extensions as $B \( z \) \, S \( z \)$.
  ===== 7.2.4 Analytic products retain the approximate algebra relations. <analytic-products-retain-the-approximate-algebra-relations.>
  The boundary products satisfy, in both orders,
  $ lr(bar.v.double B \( s \) S \( s \) - e^(2 i s) I bar.v.double) \, med lr(bar.v.double S \( s \) B \( s \) - e^(2 i s) I bar.v.double) lt.eq 2 delta + delta^2 quad upright("almost everywhere") . $
  By the product identity and the positive Poisson kernel,
  #[#set math.equation(numbering: n => "(7.9)")
   $ lr(bar.v.double B \( z \) S \( z \) - e^(2 i z) I bar.v.double) \, med lr(bar.v.double S \( z \) B \( z \) - e^(2 i z) I bar.v.double) lt.eq 2 delta + delta^2 . $ <eq:analytic-inverse-errors>]
  Similarly, for every $k$ and $x in M_k \( M \)_1$,
  #[#set math.equation(numbering: n => "(7.10)")
   $ "dist" #scale(x: 120%, y: 120%)[\(] B \( z \)^(\( k \)) x S \( z \)^(\( k \)) \, M_k \( M \) #scale(x: 120%, y: 120%)[\)] lt.eq beta \, quad "dist" #scale(x: 120%, y: 120%)[\(] S \( z \)^(\( k \)) x B \( z \)^(\( k \)) \, M_k \( M \) #scale(x: 120%, y: 120%)[\)] lt.eq beta \, #h(2em) beta = 2 gamma + 2 delta + delta^2 . $ <eq:analytic-algebra-errors>]
  Here is a justification that avoids choosing measurable nearest points in $M_k \( M \)$. On the boundary, the inequalities follow from (7.4) and (7.8). Test against any normal functional annihilating $M_k \( M \)$. The product identity identifies its value in the upper half-plane with the Poisson average of its boundary values, so the same bound holds there. Since $M_k \( M \)$ is weak-\* closed, its norm distance is the supremum over these annihilating normal functionals of norm at most one. This last distance formula follows from Hahn–Banach applied to the preannihilator in the trace class.
  For $z = t + i r$ with $0 < r lt.eq gamma$ define
  $ A_r \( t \) = e^(- i z) B \( z \) \, #h(2em) C_r \( t \) = e^(- i z) S \( z \) . $
  Because $\| e^(- i z) \| = e^r$, equations (7.9)–(7.10) give, uniformly in $r \, t \, k$,
  #[#set math.equation(numbering: n => "(7.11)")
   $ lr(bar.v.double A_r \( t \) bar.v.double) \, med lr(bar.v.double C_r \( t \) bar.v.double) & lt.eq e^gamma \( 1 + delta \) lt.eq 1 + C gamma \,\
lr(bar.v.double A_r \( t \) C_r \( t \) - I bar.v.double) \, med lr(bar.v.double C_r \( t \) A_r \( t \) - I bar.v.double) & lt.eq C gamma \,\
"dist" #scale(x: 120%, y: 120%)[\(] A_r \( t \)^(\( k \)) x C_r \( t \)^(\( k \)) \, M_k \( M \) #scale(x: 120%, y: 120%)[\)] \, quad "dist" #scale(x: 120%, y: 120%)[\(] C_r \( t \)^(\( k \)) x A_r \( t \)^(\( k \)) \, M_k \( M \) #scale(x: 120%, y: 120%)[\)] & lt.eq C gamma . $ <eq:AC-norms>]
  The last line is for $x in M_k \( M \)_1$.
  ===== 7.2.5 Polar smoothing gives a norm-continuous path. <polar-smoothing-gives-a-norm-continuous-path.>
  For small enough $gamma$, both products in (7.11) are invertible. They provide a right and a left inverse for $A_r \( t \)$, which agree, and
  $ lr(bar.v.double A_r \( t \)^(- 1) bar.v.double) lt.eq frac(1 + C gamma, 1 - C gamma) lt.eq 1 + C gamma . $
  Together with (7.11), this places the spectrum of $\| A_r \( t \) \|$ in $\[ 1 - C gamma \, 1 + C gamma \]$. Its polar unitary
  $ V_r \( t \) = A_r \( t \) #scale(x: 120%, y: 120%)[\(] A_r \( t \)^(*) A_r \( t \) #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) $
  therefore satisfies
  #[#set math.equation(numbering: n => "(7.12)")
   $ lr(bar.v.double V_r \( t \) - A_r \( t \) bar.v.double) lt.eq C gamma \, #h(2em) lr(bar.v.double V_r \( t \)^(*) - C_r \( t \) bar.v.double) lt.eq C gamma . $ <eq:polar-AC-errors>]
  For the second bound, first use $lr(bar.v.double C_r \( t \) - A_r \( t \)^(- 1) bar.v.double) lt.eq lr(bar.v.double A_r \( t \)^(- 1) bar.v.double) lr(bar.v.double A_r \( t \) C_r \( t \) - I bar.v.double)$, and then compare $A_r \( t \)^(- 1)$ with $V_r \( t \)^(*)$. It follows from (7.11) that $V_r \( t \)$ approximately normalizes $M$ in both directions, with error $C gamma$ at every matrix level.
  For fixed $r > 0$, the fields $A_r \( t \)$ are norm continuous by holomorphy, and their inverses are uniformly bounded. Continuous functional calculus makes $V_r \( t \)$ norm continuous. Put
  $ E_r \( t \) = V_r \( t \) V_r \( 0 \)^(*) . $
  This is a norm-continuous unitary path with $E_r \( 0 \) = I$ and
  #[#set math.equation(numbering: n => "(7.13)")
   $ sup_(x in M_1) "dist" \( E_r \( t \) x E_r \( t \)^(*) \, M \) lt.eq C gamma . $ <eq:Er-normalizer-error>]
  To check composition here, approximate $V_r \( 0 \)^(*) x V_r \( 0 \)$ by an $m in M$ with $lr(bar.v.double m bar.v.double) lt.eq 1 + C gamma$, and apply the corresponding estimate for $V_r \( t \)$ to $m$; the sum of the two errors is still $C gamma$. Apply 38 to the portion of this path joining $0$ to $t$, in either time direction. For each $r \, t$ it gives $a_r \( t \) in cal(U) \( M \)$ and $b'_r \( t \) in cal(U) \( M' \)$ such that
  #[#set math.equation(numbering: n => "(7.14)")
   $ lr(bar.v.double E_r \( t \) - a_r \( t \) b'_r \( t \) bar.v.double) lt.eq C gamma \, $ <eq:Er-product-approximation>]
  where a further slack of $gamma$ allows for an unattained infimum. No continuous choice of these factors is needed.
  ===== 7.2.6 The boundary comparison holds at every fixed time. <the-boundary-comparison-holds-at-every-fixed-time.>
  Set $F_0 \( s \) = e^(i s) W \( s \)$, a bounded strongly-\* continuous field, and
  $ D_r \( t \) = e^(- i \( t + i r \)) integral_(bb(R)) frac(r F_0 \( s \), pi \( \( t - s \)^2 + r^2 \)) thin d s . $
  The Poisson formula and (7.8) give $lr(bar.v.double A_r \( t \) - D_r \( t \) bar.v.double) lt.eq e^r delta$. Thus
  #[#set math.equation(numbering: n => "(7.15)")
   $ lr(bar.v.double V_r \( t \) - D_r \( t \) bar.v.double) lt.eq C gamma \, #h(2em) lr(bar.v.double D_r \( t \) bar.v.double) lt.eq e^r . $ <eq:V-D-error>]
  At every fixed $t$, the Poisson approximate identity gives $D_r \( t \) arrow.r W \( t \)$ strongly-\* as $r arrow.b 0$. For clarity, on a fixed vector split the integral into $\| s - t \| < h$ and its complement. Strong continuity controls the first piece, while the Poisson mass of the complement tends to zero. Apply the same argument to the adjoint field; the scalar prefactor converges to $e^(- i t)$. This proves both strong limits everywhere, not just almost everywhere.
  Consequently
  $ Q_r \( t \) = D_r \( t \) D_r \( 0 \)^(*) arrow.r W \( t \) quad upright("strongly-* at every fixed ") t \, $
  since $W \( 0 \) = I$ and all factors are uniformly bounded. By (7.15),
  #[#set math.equation(numbering: n => "(7.16)")
   $ lr(bar.v.double E_r \( t \) - Q_r \( t \) bar.v.double) lt.eq C gamma . $ <eq:Er-Qr-error>]
  These estimates compare $E_r \( t \)$ with a convergent family; they do not assert convergence of $E_r \( t \)$ itself.
  ===== 7.2.7 A UCP limit recovers an actual normalizer. <a-ucp-limit-recovers-an-actual-normalizer.>
  Fix $t$. For a sequence $r arrow.b 0$ define the UCP maps
  $ Phi_r : M arrow.r M \, #h(2em) Phi_r \( x \) = a_r \( t \) x a_r \( t \)^(*) . $
  Since $b'_r \( t \)$ commutes with $M$, this is the restriction of $"Ad" \( a_r \( t \) b'_r \( t \) \)$. Equations (7.14) and (7.16) therefore imply, at every matrix level,
  #[#set math.equation(numbering: n => "(7.17)")
   $ lr(bar.v.double Phi_r^(\( k \)) \( x \) - Q_r \( t \)^(\( k \)) x Q_r \( t \)^(\( k \) *) bar.v.double) lt.eq C gamma lr(bar.v.double x bar.v.double) \, #h(2em) x in M_k \( M \) . $ <eq:Phi-Qr-cb>]
  Indeed, for any bounded operators $T \, R$ the cb norm of the difference of the maps $x mapsto T x T^(*)$ and $x mapsto R x R^(*)$ is at most $\( lr(bar.v.double T bar.v.double) + lr(bar.v.double R bar.v.double) \) lr(bar.v.double T - R bar.v.double)$.
  Compactness of the product of the weak-operator compact balls ${ y in M : lr(bar.v.double y bar.v.double) lt.eq lr(bar.v.double x bar.v.double) }$, indexed by $x in M$, supplies a subnet for which $Phi_r \( x \)$ converges weakly for every $x$. Denote its limit by $Phi \( x \)$. Linearity, unitality and positivity at every matrix level pass to this limit, so $Phi : M arrow.r M$ is UCP. No normality of $Phi$ is needed. Bounded strong-\* continuity of multiplication gives $Q_r \( t \) x Q_r \( t \)^(*) arrow.r W \( t \) x W \( t \)^(*)$ strongly-\* for each fixed $x$, and likewise at every fixed matrix level. Weak-operator lower semicontinuity of norm in (7.17) now yields
  $ lr(bar.v.double Phi - rho_t bar.v.double)_(upright("cb")) lt.eq C gamma \, #h(2em) rho_t \( x \) = W \( t \) x W \( t \)^(*) . $
  The representation $rho_t$ is faithful and normal, and its range has two-sided cb gap at most $2 gamma$ from $M$ by (7.5). In particular the reverse ordinary gap required by 5 is small. That proposition supplies a unitary $q_t$ with
  $ lr(bar.v.double q_t - I bar.v.double) lt.eq C gamma \, #h(2em) q_t rho_t \( M \) q_t^(*) = M . $
  Then $n_t = q_t W \( t \)$ is the required unitary normalizer and $lr(bar.v.double n_t - W \( t \) bar.v.double) = lr(bar.v.double q_t - I bar.v.double) lt.eq C gamma$. All estimates and smallness thresholds used only universal constants, which proves the uniform assertion. ◻
]

=== 7.3 Correction within the normalizer group <correction-within-the-normalizer-group>

The preceding construction produces pointwise normalizers close to a modular group. Their selections need not be measurable or continuous. We correct their multiplication law using an invariant mean on the discrete group $bb(R)$. The final comparison with the original modular group will then supply strong continuity.

The quadratic correction follows the averaging method for approximate unitary representations #cite(label("Kazhdan1982")) #cite(label("BurgerOzawaThom2013")). Here the extra requirement is that every corrected unitary still normalizes the prescribed algebra. The local factorization proved next ensures that the averaging iteration preserves this requirement.

#thm([Lemma 7.7.])[
  (Small exact normalizers).  #emph[There are absolute $r_0 \, C_0 > 0$ such that, if $P$ is a separably acting type $upright("III")$ factor, $v in cal(N)_P$, and $lr(bar.v.double v - I bar.v.double) < r_0$, then 
$ v = a b' \, #h(2em) a in cal(U) \( P \) \, quad b' in cal(U) \( P' \) \, #h(2em) lr(bar.v.double a - I bar.v.double) + lr(bar.v.double b' - I bar.v.double) lt.eq C_0 lr(bar.v.double v - I bar.v.double) . $

]
] <lem:small-exact-normalizer>

#proof[
  Write $v = e^(i h)$ by the principal logarithm, with $h = h^(*)$ and $lr(bar.v.double h bar.v.double) lt.eq 2 lr(bar.v.double v - I bar.v.double)$. For $r_0$ small, the norm-convergent logarithm series on $cal(B) \( cal(B) \( H \) \)$ gives
  $ log \( "Ad"_v \) = i "ad"_h . $
  Indeed $"Ad"_v = exp \( i "ad"_h \)$ and $lr(bar.v.double "ad"_h bar.v.double)$ is within the radius where logarithm and exponential are inverse analytic functions. Each term of the logarithm series preserves $P$, since $v P v^(*) = P$. Hence $i "ad"_h$ restricts to a bounded $*$-derivation of $P$.
  The factor $P$ is a simple unital $C^(*)$-algebra, by the same projection argument as in 37. Sakai’s theorem therefore gives a self-adjoint $a_0 in P$ such that $h - a_0 in P'$. A scalar may be subtracted from $a_0$ and added to this commutant element. Choose the scalar at the midpoint of the spectrum of $a_0$. We claim that the resulting $a_0$ has $lr(bar.v.double a_0 bar.v.double) lt.eq lr(bar.v.double h bar.v.double)$.
  For any self-adjoint $a in P$, its spectral diameter is at most $lr(bar.v.double "ad"_a \|_P bar.v.double)$. In fact, choose nonzero spectral projections near the two spectral endpoints and a norm-one partial isometry between nonzero subprojections of them. Compressing $\[ a \, w \]$ by $w^(*)$ shows that its norm is at least the endpoint separation minus the two spectral tolerances. Let those tolerances tend to zero. Apply this to $a_0$, using $lr(bar.v.double "ad"_(a_0) \|_P bar.v.double) = lr(bar.v.double "ad"_h \|_P bar.v.double) lt.eq 2 lr(bar.v.double h bar.v.double)$. After the midpoint shift, $lr(bar.v.double a_0 bar.v.double) lt.eq lr(bar.v.double h bar.v.double)$ and $b'_0 = h - a_0$ has norm at most $2 lr(bar.v.double h bar.v.double)$. They commute, so $v = e^(i a_0) e^(i b'_0)$; these are the required factors, with total displacement at most $3 lr(bar.v.double h bar.v.double)$. ◻
]

In the next proof all operator means use 7 for the discrete group $bb(R)$. Thus arbitrarily selected factors may be averaged separately in $P$ and $P'$, without a measurability assumption.

#thm([Lemma 7.8.])[
  (Correction of normalizer representations).  #emph[There are absolute $e_1 \, C_1 > 0$ such that the following holds. Let $P subset cal(B) \( H \)$ be a separably acting type $upright("III")$ factor. For any family $v_t in cal(N)_P$, $t in bb(R)$, with 
$ e := sup_(t \, s in bb(R)) lr(bar.v.double v_t v_s - v_(t + s) bar.v.double) < e_1 \, $

 there is an exact unitary representation $z : bb(R) arrow.r cal(N)_P$ of the discrete group with 
$ sup_t lr(bar.v.double z_t - v_t bar.v.double) lt.eq C_1 e . $

]
] <lem:normalizer-representation-correction>

#proof[
  Let $m_s$ denote the invariant operator mean just described. Put
  $ F_t \( s \) = v_(t + s) v_s^(*) \, #h(2em) A_t = m_s F_t \( s \) . $
  Every $F_t \( s \)$ is a unitary normalizer and $lr(bar.v.double F_t \( s \) - v_t bar.v.double) lt.eq e$. Hence $lr(bar.v.double A_t - v_t bar.v.double) lt.eq e$. Translation invariance and the exact factorization
  $ F_(t + r) \( s \) = F_t \( r + s \) F_r \( s \) $
  give
  $ A_(t + r) - A_t A_r & = m_s #scale(x: 120%, y: 120%)[\[] \( F_t \( r + s \) - A_t \) \( F_r \( s \) - A_r \) #scale(x: 120%, y: 120%)[\]] \,\
lr(bar.v.double A_(t + r) - A_t A_r bar.v.double) & lt.eq 4 e^2 . $
  The centered terms have norm at most $2 e$, and their means vanish; expanding verifies the first equality with the written operator order. Likewise
  $ I - A_t^(*) A_t = m_s \( F_t \( s \) - A_t \)^(*) \( F_t \( s \) - A_t \) \, $
  so its norm is at most $4 e^2$. Taking polar parts in $cal(B) \( H \)$ alone would not ensure membership in $cal(N)_P$. We instead use the local product structure of exact normalizers.
  By 41, choose, for every $s \, t$,
  $ F_t \( s \) v_t^(*) = a_(t \, s) b'_(t \, s) \, quad a_(t \, s) in cal(U) \( P \) \, quad b'_(t \, s) in cal(U) \( P' \) \, quad lr(bar.v.double a_(t \, s) - I bar.v.double) + lr(bar.v.double b'_(t \, s) - I bar.v.double) lt.eq C_0 e . $
  All these choices can be arbitrary. Their averages $a_t = m_s a_(t \, s) in P$ and $b'_t = m_s b'_(t \, s) in P'$ satisfy
  $ lr(bar.v.double m_s \( a_(t \, s) b'_(t \, s) \) - a_t b'_t bar.v.double) lt.eq 4 C_0^2 e^2 . $
  This follows by expanding the centered product; its two factors have norm at most $2 C_0 e$. Unitarity of the individual factors also gives
  $ lr(bar.v.double I - a_t^(*) a_t bar.v.double) lt.eq 4 C_0^2 e^2 \, #h(2em) lr(bar.v.double I - \( b'_t \)^(*) b'_t bar.v.double) lt.eq 4 C_0^2 e^2 . $
  For small $e$ the averages are invertible, since they are within $C_0 e$ of $I$. Their polar unitaries $hat(a)_t in P$ and $hat(b)'_t in P'$ differ from them by at most $C e^2$, with an absolute $C$: use $lr(bar.v.double \| a_t \| - I bar.v.double) lt.eq lr(bar.v.double a_t^(*) a_t - I bar.v.double) \/ \( 1 + sqrt(1 - 4 C_0^2 e^2) \)$, and similarly on the other side. Therefore
  $ w_t = hat(a)_t hat(b)'_t v_t in cal(N)_P \, #h(2em) lr(bar.v.double w_t - A_t bar.v.double) lt.eq C_2 e^2 . $
  It follows, uniformly in $t \, r$, that
  $ lr(bar.v.double w_t - v_t bar.v.double) lt.eq e + C_2 e^2 \, #h(2em) lr(bar.v.double w_t w_r - w_(t + r) bar.v.double) lt.eq \( 4 + 3 C_2 \) e^2 . $
  For the second inequality use $lr(bar.v.double A_t bar.v.double) lt.eq 1$ and $lr(bar.v.double w_t bar.v.double) = 1$ to compare products, then the preceding bound on the defect of $A$.
  Iterate this operation, always with the same absolute constants. Choose $e_1$ so small that every new defect is at most half the preceding one and every displacement is at most twice the preceding defect. The total displacement is then at most $4 e$. The families converge uniformly in $t$ in operator norm to unitaries $z_t$, satisfying $z_t z_r = z_(t + r)$. The group $cal(N)_P$ is norm closed: if unitaries $u_j arrow.r u$ normalize $P$, norm closure of $P$ gives $u P u^(*) subset P$ and, by applying the same argument to $u_j^(*)$, the reverse inclusion. Thus $z_t in cal(N)_P$ for all $t$. The exact multiplication law implies $z_0 = I$ and $z_(- t) = z_t^(*)$, as required. ◻
]

#proof[
  Put $U_t = Delta_N^(i t)$ and $W \( t \) = Delta_N^(i t) Delta_M^(- i t)$. 40 supplies $n_t in cal(N)_M$ with $sup_t lr(bar.v.double n_t - W \( t \) bar.v.double) lt.eq C gamma$. Set $v_t = n_t Delta_M^(i t)$, so $v_t in cal(N)_M$ and $sup_t lr(bar.v.double v_t - U_t bar.v.double) lt.eq C gamma$. Since $U$ is an exact representation, $sup_(t \, s) lr(bar.v.double v_t v_s - v_(t + s) bar.v.double) lt.eq 3 C gamma$. For sufficiently small universal $gamma$, apply 42 to obtain an exact representation $z_t in cal(N)_M$ with
  $ sup_t lr(bar.v.double z_t - U_t bar.v.double) lt.eq C' gamma . $
  Take the invariant mean $T = m_t z_t U_t^(*)$. It is within $C' gamma$ of $I$ and hence invertible for small $gamma$. For every $s$, translation invariance and the two exact representation laws imply
  $ z_s T U_s^(*) = m_t z_(s + t) U_(s + t)^(*) = T . $
  Its polar unitary $w = T \| T \|^(- 1)$ therefore also satisfies $z_s w = w U_s$. Moreover $lr(bar.v.double w - I bar.v.double) lt.eq 2 lr(bar.v.double T - I bar.v.double) lt.eq 2 C' gamma$. In particular $z_s = w U_s w^(*)$; this proves strong continuity of $z$ without any regularity assumption on the selected normalizers.
  Set $q = w^(*)$. Since $z_s$ normalizes $M$, the intertwining identity gives $U_s \( q M q^(*) \) U_s^(*) = q M q^(*)$ for every $s$. At each matrix level conjugation by $q^(\( k \))$ moves contractions by at most $2 lr(bar.v.double q - I bar.v.double)$. Consequently
  $ d_(upright("cb")) \( q M q^(*) \, N \) lt.eq gamma + 2 lr(bar.v.double q - I bar.v.double) lt.eq C_(upright("mod")) gamma . $
  Enlarging $C_(upright("mod"))$ and reducing $c_(upright("mod"))$ to meet the finitely many universal smallness conditions proves all assertions. ◻
]

== 8 Common crossed products and descent to factors <sec:cores>

The preceding section puts the adjusted tensor pair under one strongly continuous normalizing unitary group. We now pass to its crossed products, compare finite corners there, and descend the resulting conjugacy twice: first to the adjusted tensor pair, and then through the auxiliary tensor factor to the original Hilbert space. Only the crossed product of the algebra whose modular group we use is initially known to be a factor.

=== 8.1 A concrete fixed-point description <a-concrete-fixed-point-description>

Let $P subset.eq cal(B) \( H \)$ be a unital von Neumann algebra on a separable Hilbert space, and let $\( U_s \)_(s in bb(R))$ be a strongly continuous unitary group with $U_s P U_s^(*) = P$. On $cal(K) = L^2 \( bb(R) \, H \)$ define

$ \( lambda_s xi \) \( t \) = xi \( t - s \) \, #h(2em) \( rho_s xi \) \( t \) = xi \( t + s \) \, #h(2em) \( pi \( x \) xi \) \( t \) = U_t^(*) x U_t xi \( t \) . $

We use the same symbol $pi$ for this faithful normal representation of all of $cal(B) \( H \)$. It is a complete isometry: at every matrix level its norm is the essential supremum of unitary conjugates of the input. Write

$ C \( P \, U \) = #scale(x: 120%, y: 120%)[\(] pi \( P \) union { lambda_s : s in bb(R) } #scale(x: 120%, y: 120%)[\)]'' . $

This is the usual concrete crossed product for the action $"Ad" \( U_s \) \|_P$. For a second unital algebra normalized by the same group, both its crossed product and the map $pi$ are on this same space.

#thm([Lemma 8.1.])[
  (Common-action fixed points).  #emph[With this notation, 
#[#set math.equation(numbering: n => "(8.1)")
 $ C \( P \, U \) = #scale(x: 120%, y: 120%)[\(] P overline(⊗) cal(B) \( L^2 \( bb(R) \) \) #scale(x: 120%, y: 120%)[\)]^alpha \, #h(2em) alpha_s = "Ad" \( U_s ⊗ rho_s \) . $ <eq:core-fixed-description>]

 For $\( Q_a xi \) \( t \) = e^(i a t) xi \( t \)$, character conjugation $beta_a = "Ad" \( Q_a \)$ preserves $C \( P \, U \)$, and 
#[#set math.equation(numbering: n => "(8.2)")
 $ C \( P \, U \)^beta = pi \( P \) . $ <eq:core-character-fixed>]

]
] <lem:core-fixed-points>

#proof[
  The generators $pi \( x \)$ and $lambda_r$ lie in $P overline(⊗) cal(B) \( L^2 \( bb(R) \) \)$ and are fixed by every $alpha_s$. For the reverse inclusion, take a fixed operator $X$ in that tensor product. If $f \, g in C_c \( bb(R) \)$, put
  $ lambda \( f \) = integral_(bb(R)) f \( s \) lambda_s thin d s \, #h(2em) Y = lambda \( f \) X lambda \( g \)^(*) . $
  These integrals are understood on vectors. The operator $Y$ remains fixed because translations commute with $U_s ⊗ rho_s$. Define bounded operators from $cal(K)$ to $H$ by
  $ R_(f \, t) xi = integral_(bb(R)) f \( t - s \) xi \( s \) thin d s . $
  They have norm at most $lr(bar.v.double f bar.v.double)_2$ and depend continuously on $t$ in operator norm. On compactly supported vector functions, Fubini’s theorem gives the integral kernel
  #[#set math.equation(numbering: n => "(8.3)")
   $ k \( t \, r \) = R_(f \, t) X R_(g \, r)^(*) \, #h(2em) \( Y xi \) \( t \) = integral_(bb(R)) k \( t \, r \) xi \( r \) thin d r . $ <eq:core-smoothed-kernel>]
  The kernel is bounded and jointly norm continuous. Each value belongs to $P$: the evaluation operators intertwine the constant action of $P'$, and $X$ commutes with that action. Fixedness of $Y$ gives
  $ k \( t + s \, r + s \) = U_s^(*) k \( t \, r \) U_s . $
  For fixed $s$ the identity first holds almost everywhere by testing the two kernels on compactly supported vectors. Norm continuity then makes it hold at every $\( t \, r \)$. Consequently
  #[#set math.equation(numbering: n => "(8.4)")
   $ k \( t \, r \) = U_t^(*) k \( 0 \, r - t \) U_t . $ <eq:core-kernel-covariance>]
  To reconstruct a bounded operator from this kernel inside the generated algebra, use the masks
  $ chi_j \( v \) = \( 1 - \| v \| \/ j \)_(+) #h(2em) \( j gt.eq 1 \) . $
  The function $chi_j$ is the Fourier transform of the probability measure with density
  $ frac(j, 2 pi) (frac(sin \( j a \/ 2 \), j a \/ 2))^2 thin d a \, $
  with the continuous value at $a = 0$. Thus multiplication of an operator kernel by $chi_j \( t - r \)$ is a contraction: it is the weak integral of $"Ad" \( Q_a \)$ against this measure. Let $Y_j$ be the masked operator. Using (8.4) and $rho_v xi \( t \) = xi \( t + v \)$,
  #[#set math.equation(numbering: n => "(8.5)")
   $ Y_j = integral_(bb(R)) chi_j \( v \) pi \( k \( 0 \, v \) \) rho_v thin d v med in C \( P \, U \) . $ <eq:core-kernel-reconstruction>]
  Indeed the integrand has compact support and is strongly continuous, since $v mapsto k \( 0 \, v \)$ is norm continuous. Its vector integral is a strong limit of finite sums of elements of $C \( P \, U \)$. Formula (8.3) verifies the equality on compactly supported vector functions. On these tests the kernels are bounded on a set of finite measure and $chi_j \( t - r \) arrow.r 1$, so dominated convergence gives $Y_j arrow.r Y$ weakly. The uniform norm bound extends this convergence to all vector tests. Hence $Y in C \( P \, U \)$.
  Choose nonnegative $f_n in C_c \( bb(R) \)$ of integral one with supports shrinking to zero. Strong continuity of translations gives $lambda \( f_n \) arrow.r I$ and $lambda \( f_n \)^(*) arrow.r I$ strongly. Applying the preceding conclusion with $f = g = f_n$ gives $lambda \( f_n \) X lambda \( f_n \)^(*) arrow.r X$ strongly. This proves (8.1).
  For the second assertion,
  $ beta_a \( pi \( x \) \) = pi \( x \) \, #h(2em) beta_a \( lambda_s \) = e^(i a s) lambda_s . $
  Thus $beta$ preserves $C \( P \, U \)$. An operator fixed by all $beta_a$ commutes with the scalar multiplication algebra on $L^2 \( bb(R) \)$. If it also belongs to $P overline(⊗) cal(B) \( L^2 \( bb(R) \) \)$, it is multiplication by a bounded measurable $P$-valued field $F \( t \)$. Here and below field measurability is weak operator measurability; on bounded sets, separability of $H$ permits countably many coefficient tests. The remaining $alpha$-fixedness says, for every $s$,
  $ F \( t + s \) = U_s^(*) F \( t \) U_s quad upright("for almost every ") t . $
  It follows that $G \( t \) = U_t F \( t \) U_t^(*)$ is translation invariant in $L^oo \( bb(R) \; cal(B) \( H \) \)$. Such a field is almost everywhere constant. To see this without choosing uncountably many exceptional sets, test against a countable dense family of vector pairs. Each scalar coefficient is translation invariant as an $L^oo$ class; convolving with a smooth compactly supported approximate identity gives continuous translation-invariant functions, hence constants. Their local $L^1$ convergence proves the assertion for the coefficients and then for the field. Since $U_t$ normalizes $P$, the constant value $x$ belongs to $P$. Therefore $F \( t \) = U_t^(*) x U_t$ almost everywhere, which proves (8.2). ◻
]

For each unitary action $V_s$ below, use the discrete invariant mean from 7 and write

$ E_V \( T \) = m_s V_s T V_s^(*) . $

This UCP map fixes invariant operators and preserves every von Neumann algebra invariant under the action.

#thm([Lemma 8.2.])[
  (Completely bounded gap of common crossed products).  #emph[Let $P \, Q subset.eq cal(B) \( H \)$ be normalized by the same group $U$. If $d_(upright("cb")) \( P \, Q \) < gamma$, then 
$ d_(upright("cb")) \( C \( P \, U \) \, C \( Q \, U \) \) lt.eq gamma . $

 The conclusion holds with any strict upper bound in place of $gamma$.]
] <lem:core-gap>

#proof[
  By 6, tensoring the pair with $cal(B) \( L^2 \( bb(R) \) \)$ preserves the upper bound. Average on the common ambient operator algebra using $V_s = U_s ⊗ rho_s$ in 7. For a contraction $X$ in any matrix level of $C \( P \, U \)$, choose a contraction $Y$ in the same matrix level of $Q overline(⊗) cal(B) \( L^2 \( bb(R) \) \)$ within the chosen gap bound. The matrix amplification of $E_V$ fixes $X$, takes $Y$ into $C \( Q \, U \)$ by 43, and preserves both the norm bound and the approximation error. Reverse $P \, Q$. This proves the assertion at every matrix level with the same bound. ◻
]

=== 8.2 A finite corner and its inflation <a-finite-corner-and-its-inflation>

We shall use 21 to check the other corner: its proof first excludes proper isometries by approximation in a finite algebra and then excludes nontrivial central projections by tracial conjugacy averaging. Thus no factor hypothesis on the other crossed product is needed.

#thm([Proposition 8.3.])[
  (Conjugacy through a common crossed product).  #emph[There are an absolute $gamma_0 > 0$ and a nondecreasing function $zeta : \( 0 \, gamma_0 \) arrow.r \( 0 \, oo \)$, with $zeta \( gamma \) arrow.r 0$ as $gamma arrow.b 0$, with the following property. Suppose $P \, Q subset.eq cal(B) \( H \)$ are unital von Neumann algebras on a separable Hilbert space, $d_(upright("cb")) \( P \, Q \) < gamma < gamma_0$, and a strongly continuous unitary group $U$ normalizes both. If $C \( Q \, U \)$ is a type $upright("II")_oo$ factor, then a unitary $a in cal(B) \( H \)$ satisfies 
$ a P a^(*) = Q \, #h(2em) lr(bar.v.double a - I bar.v.double) lt.eq zeta \( gamma \) . $

 No factoriality or modular interpretation of $C \( P \, U \)$ is assumed.]
] <prop:core-descent>

#proof[
  Write $cal(A) = C \( P \, U \)$ and $cal(B) = C \( Q \, U \)$. Use a slightly smaller gap bound if necessary so that 44 gives $d_(upright("cb")) \( cal(A) \, cal(B) \) < gamma$. The semifinite factor $cal(B)$ contains matrix units $\( e_(i j) \)_(i \, j gt.eq 1)$ with $sum_i e_(i i) = I$ strongly and $e = e_11$ finite and nonzero. Here is the usual projection construction. A faithful normal semifinite trace, together with separability of the representation, gives an increasing sequence of finite-trace projections with supremum $I$. Split their successive differences by trace continuity, and group the resulting pieces into countably many projections of one fixed positive finite trace. The infinite total trace ensures that the grouping exhausts $I$. Equal-trace comparison gives the required matrix units. Their weak closed span $S$ is a unital copy of $cal(B) \( ell^2 \)$, hence amenable.
  Apply 2 to $S subset_gamma cal(A)$. For $gamma < 1 \/ 100$ it gives a unitary $w$ with
  $ w S w^(*) subset.eq cal(A) \, #h(2em) lr(bar.v.double w - I bar.v.double) lt.eq 150 gamma . $
  Put $cal(A)_1 = w^(*) cal(A) w$, so $S subset.eq cal(A)_1 ∩ cal(B)$ and
  #[#set math.equation(numbering: n => "(8.6)")
   $ d_(upright("cb")) \( cal(A)_1 \, cal(B) \) < 301 gamma = : kappa . $ <eq:core-aligned-gap>]
  Compression by the common projection $e$ gives
  $ A_0 = e cal(A)_1 e \|_(e cal(K)) \, #h(2em) B_0 = e cal(B) e \|_(e cal(K)) \, #h(2em) d \( A_0 \, B_0 \) < kappa . $
  The algebra $B_0$ is a type $upright("II")_1$ factor. When $kappa < 1 \/ 10$, 21 first makes $A_0$ finite and then makes it a factor. Thus 20 applies to this pair on the separable Hilbert space $e cal(K)$. Choosing its orientation appropriately gives a unitary $v_0$ on $e cal(K)$ with
  $ v_0 A_0 v_0^(*) = B_0 \, #h(2em) lr(bar.v.double v_0 - e bar.v.double) lt.eq eta_(upright("fin")) \( kappa \) . $
  Inflate this unitary using the common matrix units:
  #[#set math.equation(numbering: n => "(8.7)")
   $ V = sum_(i = 1)^oo e_(i 1) v_0 e_(1 i) . $ <eq:core-inflated-unitary>]
  The sum converges strongly and is a unitary, because it is the direct sum of copies of $v_0$ on the orthogonal spaces $e_(i i) cal(K)$. Moreover
  $ lr(bar.v.double V - I bar.v.double) = lr(bar.v.double v_0 - e bar.v.double) \, #h(2em) V e_(i j) = e_(i j) V . $
  For $x in cal(A)_1$, its transported matrix entries $e_(1 i) x e_(j 1)$ belong to $A_0$. The entries of $V x V^(*)$ therefore belong to $B_0$. Its finite matrix compressions lie in $cal(B)$ and converge strongly to $V x V^(*)$; hence $V cal(A)_1 V^(*) subset.eq cal(B)$. The reverse argument gives equality. Thus
  #[#set math.equation(numbering: n => "(8.8)")
   $ Z = V w^(*) \, #h(2em) Z cal(A) Z^(*) = cal(B) \, #h(2em) lr(bar.v.double Z - I bar.v.double) lt.eq 150 gamma + eta_(upright("fin")) \( 301 gamma \) . $ <eq:core-full-unitary>]
  It remains to descend to $H$. Average the character action $beta$ on the entire $cal(B) \( cal(K) \)$, obtaining a unital completely positive map $E_beta$ from 7, with $V_a = Q_a$. By 43, it maps $cal(B)$ into $pi \( Q \)$ and fixes $pi \( x \)$ for every $x in cal(B) \( H \)$. Therefore
  #[#set math.equation(numbering: n => "(8.9)")
   $ F \( x \) = pi^(- 1) #scale(x: 120%, y: 120%)[\(] E_beta \( Z pi \( x \) Z^(*) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) x in P \, $ <eq:core-base-ucp>]
  defines a unital completely positive map $P arrow.r Q$. Since the same map $pi$ is completely isometric on all of $cal(B) \( H \)$,
  $ lr(bar.v.double F - "id"_P bar.v.double)_(upright("cb")) lt.eq 2 lr(bar.v.double Z - I bar.v.double) lt.eq 300 gamma + 2 eta_(upright("fin")) \( 301 gamma \) . $
  Here $"id"_P$ denotes the original inclusion into $cal(B) \( H \)$. The ordinary gap $d \( P \, Q \)$ is less than $gamma$. Apply 5. Its absolute thresholds hold for all sufficiently small $gamma$, because $eta_(upright("fin")) \( t \) arrow.r 0$. Its displacement bound supplies $zeta \( gamma \)$. A constant multiple of $gamma + eta_(upright("fin")) \( 301 gamma \)$, enlarged to a nondecreasing function if needed, is sufficient. This proves the proposition. ◻
]

=== 8.3 Undoing preparation and the auxiliary tensor factor <undoing-preparation-and-the-auxiliary-tensor-factor>

We finish the separable factor case. The continuous-core input used here is the one in 6: the crossed product of a type $upright("III")_1$ factor by the modular action of a faithful normal state is a type $upright("II")_oo$ factor. We apply it only to the algebra whose modular group remains unchanged during alignment #cite(label("Takesaki1973")) Corollary 9.7, p. 297.

#thm([Theorem 8.4.])[
  (Uniform stability of separably acting factors).  #emph[There are an absolute $t_(upright("fac")) > 0$ and a nondecreasing function $eta_(upright("fac")) : \( 0 \, t_(upright("fac")) \) arrow.r \( 0 \, oo \)$ with $eta_(upright("fac")) \( t \) arrow.r 0$ as $t arrow.b 0$ such that the following holds. For every separable complex Hilbert space $H$ and every pair of unital factors $M_0 \, N_0 subset.eq cal(B) \( H \)$ with the same identity and $d \( M_0 \, N_0 \) < t < t_(upright("fac"))$, there is a unitary $u in cal(B) \( H \)$ with 
$ u M_0 u^(*) = N_0 \, #h(2em) lr(bar.v.double u - I_H bar.v.double) lt.eq eta_(upright("fac")) \( t \) . $

 The function and the threshold are independent of the factors, their types, and their representations.]
] <thm:factors>

#proof[
  If either factor is finite, 20 applies, with the roles reversed if necessary. Its finite-neighbor conclusion also shows that for a sufficiently small gap both factors are finite in that case. We may therefore suppose that both are infinite.
  Use 32, retaining its changes of representation explicitly. On $H ⊗ K$ it gives the fixed hyperfinite tensor factor $D subset.eq cal(B) \( K \)$ and unitaries $u_0 in cal(B) \( H \)$ and $v in cal(B) \( H ⊗ K \)$ such that
  $ M = M_0 overline(⊗) D \, #h(2em) N = v #scale(x: 120%, y: 120%)[\(] \( u_0 N_0 u_0^(*) \) overline(⊗) D #scale(x: 120%, y: 120%)[\)] v^(*) \, $
  are a prepared type $upright("III")_1$ pair, and, for absolute constants,
  $ lr(bar.v.double u_0 - I bar.v.double) + lr(bar.v.double v - I bar.v.double) lt.eq C_1 t \, #h(2em) d_(upright("cb")) \( M \, N \) < C_2 t . $
  An enlargement of $C_2$ absorbs strict upper-bound slack. Let $U_s = Delta_N^(i s)$ be the modular group belonging to the common vector in that preparation. By 35, a unitary $q$ satisfies
  $ lr(bar.v.double q - I bar.v.double) lt.eq C_3 t \, #h(2em) P = q M q^(*) upright(" is normalized by every ") U_s \, #h(2em) d_(upright("cb")) \( P \, N \) < C_4 t . $
  The algebra $N$ and its modular group have not changed. Consequently $C \( N \, U \)$ is its type $upright("II")_oo$ modular core. No modular claim about the action on $P$ is necessary. Apply 45 with $gamma = C_4 t$ to obtain
  $ a P a^(*) = N \, #h(2em) lr(bar.v.double a - I bar.v.double) lt.eq zeta \( C_4 t \) . $
  All these operations have taken place on the actual tensor product of the original Hilbert space. Their inverse adjustments give
  #[#set math.equation(numbering: n => "(8.10)")
   $ b = \( u_0^(*) ⊗ I_K \) v^(*) a q \, #h(2em) b \( M_0 overline(⊗) D \) b^(*) = N_0 overline(⊗) D \, $ <eq:core-undo-all>]
  and
  #[#set math.equation(numbering: n => "(8.11)")
   $ lr(bar.v.double b - I bar.v.double) lt.eq \( C_1 + C_3 \) t + zeta \( C_4 t \) = : r \( t \) . $ <eq:core-tensor-displacement>]
  The right side tends to zero universally.
  Choose a unit vector $xi in K$, and let $omega_xi$ be its normal vector state on all of $cal(B) \( K \)$. Slicing the conjugation in (8.10) defines
  $ F_0 \( x \) = \( "id" overline(⊗) omega_xi \) #scale(x: 120%, y: 120%)[\(] b \( x ⊗ I_K \) b^(*) #scale(x: 120%, y: 120%)[\)] \, #h(2em) x in M_0 . $
  This is a unital completely positive map into $N_0$. The slice is defined on the entire ambient tensor product, so comparison with $x ⊗ I_K$ gives at every matrix level
  $ lr(bar.v.double F_0 - "id"_(M_0) bar.v.double)_(upright("cb")) lt.eq 2 lr(bar.v.double b - I bar.v.double) lt.eq 2 r \( t \) . $
  The reverse ordinary gap is less than $t$. A second application of 5 therefore gives the desired conjugating unitary on the original $H$, with displacement at most an absolute constant times $r \( t \)$, for all sufficiently small $t$.
  Choose $t_(upright("fac"))$ below the finite, preparation, modular-alignment, core-descent, and two UCP thresholds just used. Every threshold is absolute, and the only non-linear modulus used here is $eta_(upright("fin"))$, which is uniform and tends to zero. The maximum of $eta_(upright("fin")) \( t \)$ and a sufficiently large constant multiple of $r \( t \)$, enlarged if needed to be positive and nondecreasing, defines $eta_(upright("fac"))$. This establishes the stated uniform quantifiers. ◻
]

== 9 Centers and arbitrary Hilbert spaces <sec:reductions>

We now pass from 46 to arbitrary von Neumann algebras. There are two steps. On a separable Hilbert space, aligning the centers permits a measurable assembly of the factor implementers. On an arbitrary Hilbert space, separable restrictions instead supply a completely positive map into the neighboring algebra. The UCP criterion then gives a unitary on the original Hilbert space. The uniformity of 46 is essential in both steps.

=== 9.1 Aligning the centers <aligning-the-centers>

#thm([Lemma 9.1.])[
  #emph[For unital von Neumann algebras $M \, N subset.eq cal(B) \( H \)$, 
$ d #scale(x: 120%, y: 120%)[\(] Z \( M \) \, Z \( N \) #scale(x: 120%, y: 120%)[\)] lt.eq 3 d \( M \, N \) . $

 Consequently, whenever $d \( M \, N \) < g < 1 \/ 303$, there is a unitary $w in cal(B) \( H \)$ such that 
$ w Z \( M \) w^(*) = Z \( N \) \, #h(2em) lr(bar.v.double w - I bar.v.double) lt.eq 450 g . $

 For $N_0 = w^(*) N w$ one then has $Z \( N_0 \) = Z \( M \)$ and $d \( M \, N_0 \) < 901 g$.]
] <lem:centers-close>

#proof[
  Fix $z in Z \( M \)_1$ and choose $y in N_1$ with $lr(bar.v.double z - y bar.v.double) < g$. For $v in cal(U) \( N \)$, choose $a in M_1$ with $lr(bar.v.double v - a bar.v.double) < g$. Since $z$ commutes with $a$,
  $ lr(bar.v.double \[ z \, v \] bar.v.double) < 2 g \, #h(2em) lr(bar.v.double v y v^(*) - z bar.v.double) lt.eq lr(bar.v.double y - z bar.v.double) + lr(bar.v.double v z v^(*) - z bar.v.double) < 3 g . $
  Dixmier’s averaging theorem for von Neumann algebras #cite(label("BlackadarOperatorAlgebras")) Definition III.2.5.16 and Theorem III.2.5.18 says that the norm-closed convex hull of ${ v y v^(*) : v in cal(U) \( N \) }$ meets $Z \( N \)$. An element of this intersection is a contraction and is within $3 g$ of $z$. Interchanging $M \, N$ and then letting $g arrow.b d \( M \, N \)$ proves the gap estimate.
  The centers are amenable. Apply the mutual conclusion of 2, with near-inclusion bound $3 g$, to obtain $w$. Finally, conjugation by $w$ changes an ordinary gap by at most $2 lr(bar.v.double w - I bar.v.double)$, giving the asserted bound for $N_0$. ◻
]

=== 9.2 The common-center decomposition <the-common-center-decomposition>

We use the following precise form of central decomposition. If $M$ acts on a separable Hilbert space and $Z = Z \( M \)$, there is a standard measure space $\( X \, mu \)$ and a measurable field of separable Hilbert spaces such that

$ H = integral_X^xor H_t thin d mu \( t \) \, #h(2em) Z = L^oo \( X \, mu \) \, #h(2em) M = integral_X^xor M_t thin d mu \( t \) \, $

where $M_t$ is a factor almost everywhere. The measure may be chosen finite and completed. A bounded measurable field with value in $M_t$ almost everywhere represents an element of $M$, and its norm is the essential supremum of its fiber norms. These are the central case of #cite(label("BlackadarOperatorAlgebras")) III.1.6.2–4. For two algebras with the same center, we use the same decomposition of $H$ and the same diagonal algebra. Countably generated $C^(*)$-subalgebras can be represented simultaneously on the fibers; see also #cite(label("BlackadarOperatorAlgebras")) III.5.1.10–14.

#thm([Lemma 9.2.])[
  #emph[Let $M \, N subset.eq cal(B) \( H \)$ act on a separable Hilbert space and have the same center. In their common central decomposition, 
$ d \( M_t \, N_t \) lt.eq d \( M \, N \) quad upright("for almost every ") t . $

]
] <lem:fiber-gap>

#proof[
  Choose separable unital $C^(*)$-subalgebras $A subset.eq M$ and $B subset.eq N$ whose strong closures are $M \, N$. Such subalgebras exist because the strong topology on each bounded operator ball is metrizable and separable when $H$ is separable. Choose countable norm-dense subsets ${ a_j } subset.eq A_1$ and ${ b_j } subset.eq B_1$. Off one null set, their fiber representations satisfy
  $ M_t = A \( t \)'' \, #h(2em) N_t = B \( t \)'' . $
  We first check the unit-ball density needed below. The map $A arrow.r A \( t \)$ is a quotient $*$-homomorphism, possibly with a nonzero kernel. A contraction in $A \( t \)$ has lifts of norm at most $1 + s$ for every $s > 0$. Rescaling these lifts to contractions shows that the image of $A_1$ is norm dense in $A \( t \)_1$. It follows that ${ a_j \( t \) }$ is norm dense in $A \( t \)_1$ and, by Kaplansky density, strongly dense in $\( M_t \)_1$. The same argument applies to $B$.
  Put $d_0 = d \( M \, N \)$. For every $j \, n gt.eq 1$, choose $y_(j \, n) in N_1$ such that
  $ lr(bar.v.double a_j - y_(j \, n) bar.v.double) < d_0 + 1 \/ n . $
  The essential-supremum norm formula and the countability of these choices give a common conull set on which
  $ y_(j \, n) \( t \) in \( N_t \)_1 \, #h(2em) lr(bar.v.double a_j \( t \) - y_(j \, n) \( t \) bar.v.double) lt.eq d_0 + 1 \/ n quad \( j \, n gt.eq 1 \) . $
  Fix such a $t$, an $x in \( M_t \)_1$, and an $n$. Choose a net of $a_j \( t \)$ converging strongly to $x$. Along a subnet, the corresponding $y_(j \, n) \( t \)$ converge weakly to a contraction $y in N_t$. Operator-norm balls are weak-operator closed, so $lr(bar.v.double x - y bar.v.double) lt.eq d_0 + 1 \/ n$. Letting $n$ increase gives $"dist" \( x \, \( N_t \)_1 \) lt.eq d_0$. Make the same countable choices in the opposite direction and discard their null exceptions. This proves both near inclusions on one conull set. ◻
]

#thm([Lemma 9.3.])[
  #emph[In the setting of 48, suppose that for some $a > 0$ and almost every $t$ there is a unitary $v_t in cal(B) \( H_t \)$ satisfying 
$ v_t M_t v_t^(*) = N_t \, #h(2em) lr(bar.v.double v_t - I bar.v.double) < a . $

 Then there is a unitary $v in cal(B) \( H \)$ such that $v M v^(*) = N$ and $lr(bar.v.double v - I bar.v.double) lt.eq a$.]
] <lem:measurable-implementers>

#proof[
  Work on the underlying standard Borel model of $X$, retaining the countable contraction fields $a_j \( t \) \, b_j \( t \)$ from the preceding proof. Choose Borel versions of the dimension function, the trivializations on its countably many level sets, and the countably many contraction fields. Discard a Borel null set containing all exceptions to these identifications, the asserted density and algebraic properties, and the implementer hypothesis. On each remaining dimension stratum, the fibers are identified with one fixed separable Hilbert space $K$. Zero-dimensional fibers contribute nothing to the direct integral and may be omitted. It suffices to select implementers on each of these standard Borel strata.
  The unitary group $cal(U) \( cal(B) \( K \) \)$, with the strong-$*$ topology, is Polish. Fix a dense sequence $\( xi_l \)$ in the unit sphere of $K$. Consider the relation on pairs $\( t \, u \)$ defined by $lr(bar.v.double u - I bar.v.double) lt.eq a$ and the following two families of conditions:
  $ & upright("for every ") j \, m \, k upright(" there is ") q upright(" such that ") max_(l lt.eq m) lr(bar.v.double #scale(x: 120%, y: 120%)[\(] u a_j \( t \) u^(*) - b_q \( t \) #scale(x: 120%, y: 120%)[\)] xi_l bar.v.double) < 1 \/ k \,\
 & upright("for every ") j \, m \, k upright(" there is ") q upright(" such that ") max_(l lt.eq m) lr(bar.v.double #scale(x: 120%, y: 120%)[\(] u^(*) b_j \( t \) u - a_q \( t \) #scale(x: 120%, y: 120%)[\)] xi_l bar.v.double) < 1 \/ k . $
  All these predicates are Borel. Indeed, multiplication of bounded operator fields and strong-$*$ unitary fields is Borel, and the norm condition on $u - I$ is a countable collection of vector-norm tests. The strong density of the contraction fields shows that the first family is equivalent to $u M_t u^(*) subset.eq N_t$, and the second to the reverse inclusion. Thus the relation describes exactly the implementers with the imposed bound. Its sections are nonempty by hypothesis.
  The Jankov–von Neumann uniformization theorem #cite(label("Kechris1995")) Theorem 18.1 gives a selection measurable for the sigma algebra generated by analytic sets, for an analytic relation between standard Borel spaces; our relation is Borel and hence analytic. Analytic sets are universally measurable #cite(label("Kechris1995")) Theorem 21.10, so the selector is measurable for the completed measure $mu$. Its direct integral is a unitary $v$ with $lr(bar.v.double v - I bar.v.double) lt.eq a$. For $x in M$, the field $v_t x_t v_t^(*)$ is a bounded measurable field in $N_t$, so the field-reconstruction part of central decomposition puts $v x v^(*)$ in $N$. The reverse inclusion follows in the same way. ◻
]

#thm([Theorem 9.4.])[
  #emph[For every $a > 0$ there is $delta_(upright("sep")) \( a \) > 0$ such that whenever $M \, N$ are unital von Neumann algebras on a separable Hilbert space and $d \( M \, N \) < delta_(upright("sep")) \( a \)$, there is a unitary $u$ with 
$ u M u^(*) = N \, #h(2em) lr(bar.v.double u - I bar.v.double) < a . $

 The tolerance is independent of the algebras and the representation.]
] <thm:separable-algebras>

#proof[
  The zero Hilbert space is immediate. By 46, choose $tau > 0$ such that any pair of factors on a separable Hilbert space at distance less than $tau$ has an implementer within $a \/ 2$ of the identity. Choose $delta_(upright("sep")) \( a \) > 0$ so small that 47 applies with $g = delta_(upright("sep")) \( a \)$ and
  $ 450 delta_(upright("sep")) \( a \) < a \/ 2 \, #h(2em) 901 delta_(upright("sep")) \( a \) < tau . $
  For a pair satisfying the hypothesis, align the centers by the unitary $w$ in that lemma, and set $N_0 = w^(*) N w$. The common-center pair $M \, N_0$ has distance less than $tau$. By 48, almost every fiber pair has distance less than $tau$ as well. Apply the factor theorem on each fiber and then 49, with bound $a \/ 2$. The resulting unitary $v$ satisfies
  $ v M v^(*) = N_0 \, #h(2em) lr(bar.v.double v - I bar.v.double) lt.eq a \/ 2 . $
  Now $u = w v$ implements the original conjugacy and $lr(bar.v.double u - I bar.v.double) lt.eq lr(bar.v.double w - I bar.v.double) + lr(bar.v.double v - I bar.v.double) < a$. Every tolerance used above is independent of the fibers and of $H$. ◻
]

=== 9.3 Separable tests in an arbitrary representation <separable-tests-in-an-arbitrary-representation>

The preceding theorem provides one uniform unitary bound for all separable restrictions. These restrictions will not be chosen compatibly. Instead, finite collections of operator coefficients will produce a UCP limit map, to which 5 applies.

#thm([Lemma 9.5.])[
  #emph[Let $M \, N subset.eq cal(B) \( H \)$ be unital von Neumann algebras, and let $g > d \( M \, N \)$. Given finite sets $E subset.eq M$, $F subset.eq N$, and $V subset.eq H$ with $V$ containing a nonzero vector, there are separable unital $C^(*)$-subalgebras $A subset.eq M$, $B subset.eq N$ and a nonzero separable closed subspace $K subset.eq H$ such that:]
  + #emph[$E subset.eq A$, $F subset.eq B$, and $V subset.eq K$;]
  + #emph[$K$ reduces both $A$ and $B$;]
  + #emph[$d \( A \, B \) < g$ and 
$ d #scale(x: 120%, y: 120%)[\(] \( A \|_K \)'' \, \( B \|_K \)'' #scale(x: 120%, y: 120%)[\)] < g . $

]
  #emph[Here the restriction homomorphisms are not required to be faithful.]
] <lem:separable-tests>

#proof[
  Choose $r$ with $d \( M \, N \) < r < g$, and start with $A_0 = C^(*) \( E \, I \)$, $B_0 = C^(*) \( F \, I \)$. Suppose that separable unital $A_j subset.eq M$, $B_j subset.eq N$ have been constructed. For each element of a countable norm-dense subset of $\( A_j \)_1$, choose an $N_1$-approximant within $r$, and adjoin all these approximants to $B_j$. In the same way, adjoin to $A_j$ approximants in $M_1$ for a countable dense subset of $\( B_j \)_1$. Let $A_(j + 1) \, B_(j + 1)$ be the unital $C^(*)$-algebras generated by these additions. Put
  $ A = overline(union.big_j A_j)^(thin lr(bar.v.double dot.op bar.v.double)) \, #h(2em) B = overline(union.big_j B_j)^(thin lr(bar.v.double dot.op bar.v.double)) . $
  They are separable and contain the required tests. The stage unit balls are norm dense in the unit balls of these closures: approximate in norm and rescale if necessary. The choices of approximants therefore give $d \( A \, B \) lt.eq r < g$.
  Let $K = overline("span" \( C^(*) \( A \, B \) V \))$. Because the algebra is separable and $V$ finite, $K$ is separable. It contains $V$ and is reducing for both algebras. To transfer the gap through restriction, take $x in \( A \|_K \)_1$. For every $s > 0$ there is a quotient lift $a in A$ with $a \|_K = x$ and $lr(bar.v.double a bar.v.double) lt.eq 1 + s$. The contraction $a \/ \( 1 + s \)$ has a $B_1$-approximant within $r$ plus arbitrary slack. Restricting this approximant gives
  $ "dist" #scale(x: 120%, y: 120%)[\(] x \, \( B \|_K \)_1 #scale(x: 120%, y: 120%)[\)] lt.eq frac(s, 1 + s) + r . $
  Let $s arrow.b 0$ and reverse the roles. Thus $d \( A \|_K \, B \|_K \) lt.eq r$.
  Finally, for a contraction in $\( A \|_K \)''$, Kaplansky density gives a strongly convergent net of contractions from $A \|_K$. Approximate these in $\( B \|_K \)_1$ with errors at most $r$ plus arbitrary slack, and take a bounded weak-operator cluster subnet. Its limit lies in $\( \( B \|_K \)'' \)_1$ and has the same error bound. Interchanging the algebras proves the final assertion. ◻
]

#proof[
  Let $epsilon > 0$. The conclusion of 5 is uniform in the algebras and the Hilbert space, and its implementing-unitary bound tends to zero with the cb error. Choose $a > 0$ and $g_0 > 0$ so small that this proposition gives an implementer within $epsilon$ of the identity whenever the reverse ordinary gap is at most $g_0$ and the cb error of the UCP map is at most $2 a$. All its smallness requirements are included in this choice. Choose
  $ 0 < delta < min { g_0 \, delta_(upright("sep")) \( a \) } . $
  We prove the theorem for any $M \, N subset.eq cal(B) \( H \)$ with $d \( M \, N \) < delta$.
  If $H = { 0 }$, take its identity unitary. Otherwise fix a unit vector $xi_0 in H$ and a number $g$ satisfying
  $ d \( M \, N \) < g < delta_(upright("sep")) \( a \) . $
  Consider the directed set of quadruples $i = \( E_i \, F_i \, V_i \, k_i \)$, where $E_i subset.eq M$, $F_i subset.eq N$, and $V_i subset.eq H$ are finite, $xi_0 in V_i$, and $k_i in bb(N)$ is positive. The order is inclusion in the three finite sets and the usual order in $k_i$.
  For each $i$, apply 51 to obtain $A_i \, B_i \, K_i$. Set
  $ P_i = \( A_i \|_(K_i) \)'' \, #h(2em) Q_i = \( B_i \|_(K_i) \)'' . $
  These are unital von Neumann algebras on the nonzero separable space $K_i$, and $d \( P_i \, Q_i \) < g$. By 50, there is a unitary $u_i in cal(B) \( K_i \)$ with
  $ u_i P_i u_i^(*) = Q_i \, #h(2em) lr(bar.v.double u_i - I bar.v.double) < a . $
  Extend it by the identity on $K_i^perp$ to a unitary $U_i in cal(B) \( H \)$. For all matrix sizes, conjugation satisfies
  #[#set math.equation(numbering: n => "(9.1)")
   $ lr(bar.v.double "Ad" \( U_i \) \|_M - "id"_M bar.v.double)_(upright("cb")) lt.eq 2 lr(bar.v.double U_i - I bar.v.double) < 2 a . $ <eq:finite-test-cb>]
  We next record what the local conjugacy says about the finite tests on the original space. If $x in E_i$, then $K_i$ reduces $x$, and the restriction of $U_i x U_i^(*)$ belongs to $Q_i$ with norm at most $lr(bar.v.double x bar.v.double)$. Kaplansky density approximates this restriction on the finitely many coefficients from $V_i$ by an element of $B_i \|_(K_i)$ of norm at most $lr(bar.v.double x bar.v.double)$ (with arbitrarily small slack if needed). Lift that element through the restriction quotient. Choosing the slack small enough gives $b_(i \, x) in B_i subset.eq N$ such that
  #[#set math.equation(numbering: n => "(9.2)")
   $ lr(bar.v.double b_(i \, x) bar.v.double) lt.eq lr(bar.v.double x bar.v.double) + 1 \, #h(2em) \| chevron.l \( U_i x U_i^(*) - b_(i \, x) \) xi \, eta chevron.r \| < 1 \/ k_i quad \( xi \, eta in V_i \) . $ <eq:finite-test-lift>]
  The displayed coefficients are coefficients on $H$, since all the vectors belong to $K_i$. At this stage the whole conjugated algebra need not lie in $N$; (9.2) is the property that will survive as the tests increase.
  For each $x in M$, the operators $U_i x U_i^(*)$ lie in the weak-operator compact ball of radius $lr(bar.v.double x bar.v.double)$ in $cal(B) \( H \)$. Compactness of the product of these balls gives a subnet for which
  $ F \( x \) = "WOT  - lim"_i U_i x U_i^(*) quad upright("exists for every ") x in M . $
  Linearity and unitality pass to this limit. At each matrix size, positive operators form a weak-operator closed cone, so $F$ is completely positive. Also, the norm ball of radius $2 a lr(bar.v.double X bar.v.double)$ is weak-operator closed for every fixed matrix $X$ over $M$. Taking limits in (9.1) therefore gives
  #[#set math.equation(numbering: n => "(9.3)")
   $ lr(bar.v.double F - "id"_M bar.v.double)_(upright("cb")) lt.eq 2 a . $ <eq:ucp-cluster-close>]
  It remains to verify the range of $F$. Fix $x in M$. Cofinality of the subnet implies that eventually $x in E_i$, so choose $b_(i \, x)$ as in (9.2) on this tail. Every fixed pair $xi \, eta in H$ eventually belongs to $V_i$, while $k_i arrow.r oo$. Hence (9.2) and the definition of $F$ imply $b_(i \, x) arrow.r F \( x \)$ in the weak-operator topology. As $N$ is weak-operator closed, $F \( x \) in N$. This holds for every $x in M$, and proves that $F : M arrow.r N$ is UCP. Normality of this cluster map is neither asserted nor needed.
  The original inclusion $M arrow.r.hook cal(B) \( H \)$ is faithful, normal, and unital. Its range has reverse ordinary gap less than $delta < g_0$ from $N$, and (9.3) supplies the cb bound. Apply 5. It yields a unitary $u in cal(B) \( H \)$ with $u M u^(*) = N$ and $lr(bar.v.double u - I bar.v.double) < epsilon$.
  The choices of $a \, g_0$, and $delta$ depend only on $epsilon$. The intervening choices of finite tests, separable subspaces, and quotient lifts change none of their bounds. Thus the same tolerance works for all algebras, all representations, and all Hilbert spaces, as claimed. ◻
]

== 10 Uniformity and commutator estimates <app:comparison>

The proof distinguishes ordinary norm control, control at every matrix size, and implementation on the original Hilbert space. We compare the uniformity required for these steps with the commutator estimate in the similarity companion, and then record how the small-unitary conclusion controls both matrix gaps and commutants.

=== 10.1 Uniformity over factors and representations <uniformity-over-factors-and-representations>

Fix an abstract type $upright("II")_1$ factor $M$ with separable predual. A stability statement uniform over its representations would assign, for each $epsilon > 0$, a number $delta_M \( epsilon \) > 0$ that works for every faithful normal unital representation $rho : M arrow.r cal(B) \( H \)$ and every unital von Neumann algebra $N subset.eq cal(B) \( H \)$: if $d \( rho \( M \) \, N \) < delta_M \( epsilon \)$, then a unitary within $epsilon$ of the identity conjugates $rho \( M \)$ onto $N$. Even with this representation uniformity, the tolerance may depend on $M$.

The quantifier order for universal stability is stronger: the tolerance must be chosen before the factor as well as before its representation. Positivity of each $delta_M \( epsilon \)$ does not imply

$ inf_M delta_M \( epsilon \) > 0 . $

Consequently, a representation-transfer argument with absolute constants preserves an already universal tolerance but does not by itself remove factor dependence from its input.

In 20, uniformity is obtained before the concluding reductions. The common-position theorem has absolute constants, the boundary argument in 28 gives an isomorphism with an absolute ordinary-norm bound, and 8 supplies an absolute amplification constant. Their combination gives the single modulus $eta_(upright("fin"))$ for all separably acting finite factors. Sections 8 and 9 propagate this uniform control through finite corners, measurable assembly, and separable restrictions.

=== 10.2 Two commutator arguments <two-commutator-arguments>

The amplification theorem needed here concerns selfadjoint implementers of commutators on separably acting type $upright("II")_1$ factors. The similarity companion proves a broader estimate: for every unital von Neumann algebra $P subset.eq cal(B) \( K \)$, every $Y in cal(B) \( K \)$, every integer $n gt.eq 1$, and every $X in M_n \( P \)$,

$ lr(bar.v.double \[ Y^(\( n \)) \, X \] bar.v.double) lt.eq C lr(bar.v.double "ad"_Y \|_P bar.v.double) lr(bar.v.double  bar.v.double) X \, $

where $Y^(\( n \))$ is the diagonal amplification on $K^n$ and $C$ is absolute, with no separability assumption #cite(label("OpenAI2026Similarity")) Theorem 1.2.

Both arguments use cyclic representation estimates and tracial free products to obtain bounds independent of matrix size. In the present paper, the column estimate of 9 controls randomized matrix coefficients. The free-word estimates bound their commutators, while the averaged products converge weakly to a positive scalar multiple of the identity in (3.28). Together these facts yield 8.

The companion’s central intermediate result is a corner estimate. It works in a tracial free product $cal(L) = D * A_0$, where $D$ is a hyperfinite $upright("II")_1$ factor generated by increasing full matrix algebras and $A_0$ is a finite von Neumann algebra with a faithful normal tracial state. Equip $cal(L)$ with the free-product trace. Writing $L_x$ for left multiplication by $x$ on $L^2 \( cal(L) \)$, suppose that $G in cal(B) \( L^2 \( cal(L) \) \)$ commutes with $L_D$ and that, for some $e gt.eq 0$,

$ lr(bar.v.double \[ G \, L_x \] bar.v.double) lt.eq e lr(bar.v.double  bar.v.double) x #h(2em) \( x in p cal(L) p \) \, $

where $p in D$ is a projection of trace $1 \/ m$ for an integer $m gt.eq 2$. For a trace-zero selfadjoint unitary $s in A_0$, the companion bounds the compression of $\[ G \, L_s \]$ to $L^2 \( A_0 \)$ by $C_0 e$, with $C_0$ independent of $m$ #cite(label("OpenAI2026Similarity")) Theorem 3.1. Its proof analyzes invariant tensors of reduced words, approximates operators by right multipliers on small right supports, and obtains the trace-independent bound from a Hankel compression #cite(label("OpenAI2026Similarity")) Sections 3–5. Using Popa’s independence theorem, the companion transfers this estimate to finite factors; passage through a countable amplification treats their arbitrary separable normal representations #cite(label("OpenAI2026Similarity")) Section 6 and Proposition 7.1.

The finite stability proof here uses 8 directly. For the near-identity isomorphism $theta : M arrow.r N$ constructed there, the switch operator on $H xor H$ has commutator with $x mapsto x xor theta \( x \)$ whose off-diagonal entries are $x - theta \( x \)$ and its negative. Applying the amplification theorem to this paired representation converts the ordinary bound on $theta - "id"$ into a cb bound. 4 then supplies the unitary on the original $H$. This identifies the precise role of commutator control in the stability argument.

=== 10.3 Matrix gaps and commutants at the conclusion <matrix-gaps-and-commutants-at-the-conclusion>

#thm([Corollary 10.1.])[
  #emph[For every $epsilon > 0$ there is $delta > 0$, independent of the algebras, their representations, and their Hilbert spaces, such that unital von Neumann algebras $M \, N subset.eq cal(B) \( H \)$ with the same identity and $d \( M \, N \) < delta$ satisfy 
$ d_(upright("cb")) \( M \, N \) < epsilon \, #h(2em) d \( M' \, N' \) < epsilon . $

]
] <cor:uniform-matrix-commutant>

#proof[
  Choose $delta$ from 1 with unitary displacement $epsilon \/ 2$. The resulting unitary satisfies $u M u^(*) = N$ and $lr(bar.v.double u - I bar.v.double) < epsilon \/ 2$. Conjugation by its diagonal amplification identifies the unit balls of $M_n \( M \)$ and $M_n \( N \)$ and moves each contraction by at most $2 lr(bar.v.double u - I bar.v.double)$, independently of $n$. The same estimate applies to the commutants because $u M' u^(*) = N'$. ◻
]

Since $d \( M \, N \) lt.eq d_(upright("cb")) \( M \, N \)$, this corollary shows that the ordinary and completely bounded distances induce the same uniform structure on the unital von Neumann algebras in each $cal(B) \( H \)$, with tolerances uniform over $H$. It also gives uniform continuity of the commutant operation for the ordinary distance. These controls follow at the conclusion from one small implementing unitary; the separate estimates in the proof are what make construction of that unitary possible.


#bibliography("refs.bib", style: "ieee", title: [References])
