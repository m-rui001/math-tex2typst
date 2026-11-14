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

#align(center)[#text(size: 16pt, weight: "bold")[Exact Birch--Swinnerton-Dyer Formula \
from Low Selmer Corank]]
#align(center)[OpenAI]
#align(center)[October 3, 2026]

== 1 Introduction <sec:intro>

The Birch–Swinnerton-Dyer formula relates the first nonzero Taylor coefficient of an elliptic curve’s $L$-function
  to its periods, rational points, local components, and Tate–Shafarevich group.
  Knowing the order of vanishing and the finiteness of the Tate–Shafarevich group does not determine that
  coefficient. The problem addressed here is the remaining integral comparison when a full Selmer group has corank
  zero or one.

=== 1.1 Statement and normalization <statement-and-normalization>

Let $E \/ bb(Q)$ be an elliptic curve. For a prime $p$, let $"Sel"_(p^oo) \( E \/ bb(Q) \)$ denote the full
  $p$-power Selmer group, defined using the local Kummer images at every place, and write

$ s_p \( E \) = "corank"_(bb(Z)_p) "Sel"_(p^oo) \( E \/ bb(Q) \) \, wide a \( E \) =
  "ord"_(s = 1) L \( E \, s \) \, wide r \( E \) = "rank" E \( bb(Q) \) . $

Here $L \( E \, s \)$ is the uncompleted Hasse–Weil $L$-function with all its finite Euler factors.
  Its center is $s = 1$. We write

$ "Sha" \( E \/ bb(Q) \) = ker (H^1 \( bb(Q) \, E \) arrow.r product_v H^1 \( bb(Q)_v \, E \)) . $

Choose a global minimal Weierstrass equation and its Neron differential $omega_E$.
  Our real period and finite component factors are

$ Omega_E = integral_(E \( bb(R) \)) \| omega_E \| \, wide
  c_ell \( E \) = \[ E \( bb(Q)_ell \) : E_0 \( bb(Q)_ell \) \] . $

Thus the real period includes both connected components when there are two. No separate real-component factor is used.

We fix the height convention as well. If $x \( P \) = a \/ b$ in lowest terms, $b > 0$, put $h_x \( P \) =
  log max { \| a \| \, b }$ and $h_x \( O \) = 0$. Define

#[#set math.equation(numbering: n => "(1.1)")
 $ H \( P \) = lim_(n arrow.r oo) 4^(- n) h_x \( \[ 2^n \] P \) \, wide B \( P \, Q \) =
   frac(H \( P + Q \) - H \( P \) - H \( Q \), 2) . $ <eq:height-convention>]

For a basis $P_1 \, dots.h \, P_r$ of the full free group $E \( bb(Q) \) \/ E \( bb(Q) \)_(upright("tors"))$,
  set $"Reg"_E = det \( B \( P_i \, P_j \) \)$; in rank zero set $"Reg"_E = 1$.
  In particular $B \( P \, P \) = H \( P \)$. An index-$d$ sublattice has pairing determinant $d^2 "Reg"_E$.

#thm([Theorem 1.1.])[
  #emph[Let $E \/ bb(Q)$ be an elliptic curve and let $q$ be any prime. If $s_q \( E \) in { 0 \, 1 }$, then
$ r \( E \) = a \( E \) = s_q \( E \) \, wide \# "Sha" \( E \/ bb(Q) \) < oo \, $

 and, with $r = r \( E \)$ and the preceding normalizations,
#[#set math.equation(numbering: n => "(1.2)")
 $ frac(L^(\( r \)) \( E \, 1 \), r !) =
   frac(Omega_E "Reg"_E thin \# "Sha" \( E \/ bb(Q) \) product_(ell upright(" finite")) c_ell \( E \), \# E \(
   bb(Q) \)_(upright("tors"))^2) . $ <eq:bsd-main>]

 There are no additional hypotheses on reduction, rational torsion, isogenies, complex multiplication,
   or residual Galois representations.]
] <thm:main>

The rank and finiteness assertions are the unrestricted low-corank converse of [23];
  the two-primary leading-term equality is supplied by [24]. We state these inputs precisely in Section 2.
  The new assertion proved here is the exact valuation of the leading-term formula at every odd prime,
  independently of the prime $q$ in the hypothesis. The low-Selmer-corank hypothesis is essential to the stated
  scope: it is not replaced here by a hypothesis on Mordell–Weil rank alone.

=== 1.2 Historical context and the integral problem <historical-context-and-the-integral-problem>

Birch and Swinnerton-Dyer formulated their conjectures from the relationship between the arithmetic of rational
  points and the behavior of the Euler product [1]. Tate’s account [29] placed the rank prediction and the
  leading-term formula in the broader arithmetic of abelian varieties.
  The leading coefficient contains information that the rank alone cannot see:
  finite local components, torsion, the index of a point lattice,
  and the order of $"Sha"$ must be compared simultaneously.
  Cassels’s isogeny formula [6] explains why this combined expression, rather than any individual factor,
  is the natural arithmetic invariant.

The modularity theorems of Wiles, Taylor–Wiles, and Breuil–Conrad–Diamond–Taylor [32,30,4] supply the analytic
  continuation and functional equation of the $L$-function of every elliptic curve over $bb(Q)$.
  Gross–Zagier’s height formula [12] identifies a derivative of a quadratic base-change $L$-function with the
  height of a Heegner point. Kolyvagin’s Euler-system argument [17] then gives rank equality and finiteness of the
  whole Tate–Shafarevich group in analytic ranks zero and one.
  These results are indispensable here, but their rank and finiteness conclusions do not by themselves identify
  every prime valuation of the leading term.

Iwasawa theory provides a route to those integral refinements.
  Rubin’s main-conjecture theorem for imaginary quadratic fields [25] gives leading-term consequences for CM
  elliptic curves. Kato’s zeta elements and explicit reciprocity law [15] connect modular $L$-values with Galois
  cohomology. In the non-CM setting, the work of Skinner–Urban [27] yields ordinary rank-zero leading-term results
  under residual and ramification hypotheses. Jetchev–Skinner–Wan [14] prove rank-one formulas for semistable
  curves at good primes under irreducibility hypotheses, including ordinary and supersingular settings in their
  stated ranges. These theorems make precise integral comparisons, with their own local and residual assumptions;
  they are not used here as unrestricted odd-primary formulas.

For CM curves, Burungale–Flach [5] prove the full rank-zero BSD formula for their abelian torsion-field class.
  Their rational descent applies to CM elliptic curves over $bb(Q)$.
  That theorem supplies the rank-zero CM input in our final step.
  The unrestricted low-corank converse [23] and the two-primary formula [24] are distinct companion inputs.
  The auxiliary twist-density theorem [22], whose proof uses Smith’s Selmer-distribution results [28],
  permits simultaneous choices of the two imaginary quadratic fields. We state the scope of each input where it is used.

The cohomological language of the proof belongs to the arithmetic duality and Selmer-complex framework [2,20,21].
  In particular, exact local orthogonality and determinant lines organize the local factors;
  they do not remove the need to compute the integral lattices.
  The moving-prime constructions use the Galois-image principles of Serre and Bogomolov [26,3],
  while analytic primitivity uses the elliptic tame-stalk independence proved below by the Chai–Hida rigidity and
  monodromy method [7,13]. The finite-model, switching, and theta methods of [24,23,?] provide the starting
  constructions. The work below extends the relevant comparisons to residual tests and to nonaugmentation theta
  tests with growing $p$-level, and explains why these extensions give an exact center.

=== 1.3 The arithmetic discrepancy <the-arithmetic-discrepancy>

For an elliptic curve of analytic rank at most one, put $r = r \( E \) = a \( E \)$ and define

#[#set math.equation(numbering: n => "(1.3)")
 $ Q_E =
   frac(L^(\( r \)) \( E \, 1 \) thin \# E \( bb(Q) \)_(upright("tors"))^2, r ! thin Omega_E "Reg"_E product_ell
   c_ell \( E \)) \, wide X_p \( E \) = v_p \( Q_E \) - v_p \( \# "Sha" \( E \/ bb(Q) \) \) \,
   $ <eq:normalized-quotient>]

where $v_p \( p \) = 1$. These quantities are defined: the analytic low-rank theorem gives the rank and finiteness
  statements, and the two-primary input gives $Q_E in bb(Q)_(> 0)$.
  The latter applies because the Kummer exact sequence gives $s_2 \( E \) =
  r$ once the whole Tate–Shafarevich group is finite.

Fix an odd prime $p$. The proof has two distinct outputs:

#[#set math.equation(numbering: n => "(1.4)")
 $ X_p \( E \) & gt.eq 0 &  & upright("if ") E upright(" is non-CM and ") a \( E \) lt.eq 1 \,\
X_p \( E \) + X_p \( E^D \) & = 0 &  & upright("for a suitable imaginary quadratic twist") \, $ <eq:intro-inequality>]

where $a \( E \) + a \( E^D \) = 1$. Applying the first inequality to both curves in the second identity gives
  $X_p \( E \) = 0$ in the non-CM case. The same pair identity handles CM curves of analytic rank one after the CM
  rank-zero formula is used. This separation is useful: the first comparison is a one-sided integral statement,
  whereas the second requires a unit, not just an integral quotient.

=== 1.4 Integral comparisons and the role of theta series <integral-comparisons-and-the-role-of-theta-series>

The integral objects are finite free models of Galois cochain diagrams over rings

$ R = bb(Z)_p \[ \[ t \, u_1 \, dots.h \, u_m \] \] . $

The variable $t$ is a genuine cyclotomic or anticyclotomic character variable.
  The $u_i$ are limits of tame characters at varying auxiliary primes.
  Every finite stage retains $T_p E$, the local conditions, and the maps, pairings,
  and homotopies needed for derived specialization. The tame variables make it possible to test and change the
  residual cohomology while retaining an exact integral center.

The first comparison transfers Kato’s modular-symbol construction into these diagrams.
  Complementary local-condition comparisons prove that its normalized determinant coordinate is integral.
  Exact calibration against modular symbols in rank zero and a tame height formula in rank one identifies its
  central valuation with $X_p \( E \)$. This proves (1.4); it does not require the normalized coordinate to be a unit.

For the pair comparison, one works over $K = bb(Q) \( sqrt(D) \)$, where $p$ splits as $w macron(w)$.
  There are two determinant series $L_w \, L_(macron(w))$, obtained by imposing the strict (zero) local condition
  at one of these places and the full (unrestricted) local condition at the other.
  The analytic series $B_w \, B_(macron(w))$ are constructed from bounded CM measures.
  After an integral coefficient descent, the relevant quotients are

$ U_w = B_w \/ L_w \, wide U_(macron(w)) = B_(macron(w)) \/ L_(macron(w)) . $

These formulas initially define elements of a fraction field.
  The first task is to prove that they belong to $R$; the second is to prove that they belong to $R^times$.

Two different tests establish integrality and vertical primitivity.
  Residual cohomology over $"Frac" bb(F)_p \[ \[ upright(bold(u)) \] \]$ makes the determinants regular in the
  tame variables modulo $\( p \, t \)$. At sufficiently ramified finite characters of $t$,
  local-condition comparisons give divisibility after inverting $p$.
  Integral Weierstrass division then gives $L_w divides B_w$ over $R$.
  Independently, linear independence on the ordinary modular curve proves $p divides.not B_w$.
  Thus $U_w$ is integral and has no factor $p$. This does not yet exclude its other irreducible factors.

Theta series are used for that remaining purpose. This part of the proof allows a fixed loss of $p$-adic
  precision. At a characteristic-zero divisor where an undepleted CM period vanishes,
  a theta-to-cusp comparison produces a nonzero class satisfying a one-sided strict condition,
  either for $E$ or for a fixed companion twist. The comparison needs values at a nontrivial test character,
  not just the augmentation. Its proof consequently allows increasing $p$-level and proves a uniform bound for
  position-cut moments. A product-character argument gives the required content bound at every interior test.

The theta implications make every possible quotient factor regular in the tame variables.
  High-character association and the integral character-division test then identify the two quotient ideals,
  including their multiplicities. Adding finitely many further tame variables then makes their possible
  simultaneous strict jumps have codimension at least two. A quotient divisor has codimension one,
  so no such divisor remains. Specializing the added variables to zero is integral, and a unit remains a unit.
  This last fact is what permits an exact central comparison;
  the rationalized theta construction is not itself read as a formula for the order of a finite $p$-primary group.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.923cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[Integral character division#linebreak()$U_w,U_( macron(w) ) in R$, $p "nmid" U_"wU"_( macron(w) )$]])])
  content((0, -2.07), [#box(width: 5.923cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[Theta regularity and character division#linebreak()$(U_w)=(U_( macron(w) ))$]])])
  content((0, -4.14), [#box(width: 5.923cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[New tame directions exclude#linebreak()simultaneous jumps in codimension one]])])
  content((0, -6.213), [#box(width: 5.923cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$U_w,U_( macron(w) ) in R^ times$#linebreak()Exact integral specialization at the center]])])
  line((0, -0.58), (0, -1.48), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -2.66), (0, -3.56), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -4.72), (0, -5.62), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: The pair comparison separates integral divisibility from divisor removal. The theta implication is used on characteristic-zero divisors; the final specialization takes place in the integral ring. ],
) <fig:pair-comparison>

The reusable parts of this argument are the marked residual obstruction calculation,
  the integral character-division test, and the uniform position-cut and product-character estimates.
  Their roles are different: the first controls determinant factors above $p$,
  the second transfers divisibility from highly ramified characters,
  and the third supplies the vanishing implication needed to remove horizontal factors.
  We prove the changes needed for these applications rather than inferring them from the conclusions of the
  companion papers.

=== 1.5 Organization <organization>

Section 2 fixes the arithmetic inputs and the exact height and period comparisons.
  Sections 3 and 4 construct the integral diagrams and establish the residual determinant tests.
  Section 5 proves the single-curve inequality, and Section 6 constructs the integral pair quotients.
  Sections 7 and 8 prove the theta implication, including the increasing-level and nonaugmentation estimates.
  Section 9 removes the quotient divisors. Section 10 computes the central arithmetic volume and completes the
  proof of Theorem 1.

== 2 Arithmetic inputs and exact normalizations <sec:classical>

The two comparisons will be carried out at a fixed odd prime.
  This section explains the reduction to that problem, constructs the quadratic fields used in the pair
  comparison, and records the real arithmetic identity that converts a Heegner-point index into a sum of BSD
  discrepancies. None of these reductions asserts an odd-primary leading-term equality.

=== 2.1 The two low-corank inputs <the-two-low-corank-inputs>

For a number field $M$, the compact local Kummer condition for the Tate lattice $T_p
  E$ is the image of the completed point module

$ E \( M_v \)_p^and = "proj lim"_n E \( M_v \) \/ p^n E \( M_v \) arrow.r H^1 \( M_v \, T_p E \) . $

For discrete coefficients, the local condition is the image of $E \( M_v \) ⊗ bb(Q)_p \/
  bb(Z)_p$ in $H^1 \( M_v \, E \[ p^oo \] \)$. The full Selmer group uses these conditions at every place.
  The Kummer exact sequence is

#[#set math.equation(numbering: n => "(2.1)")
 $ 0 arrow.r E \( bb(Q) \) ⊗ bb(Q)_p \/ bb(Z)_p arrow.r "Sel"_(p^oo) \( E \/ bb(Q) \) arrow.r
   "Sha" \( E \/ bb(Q) \) \[ p^oo \] arrow.r 0 . $ <eq:kummer-exact>]

#thm([Theorem 2.1.])[
  (Unrestricted low-corank converse).  #emph[For every elliptic curve $A \/ bb(Q)$, every prime $q$,
    and $u in { 0 \, 1 }$, the equality $s_q \( A \) = u$ implies
$ a \( A \) = r \( A \) = u \, wide \# "Sha" \( A \/ bb(Q) \) < oo . $

]
] <classical:low-corank>

This is [23] Theorem 1.1. We use its stated conclusion; we do not interpret its rationalized cohomological
  construction as an integral leading-term formula.

#thm([Theorem 2.2.])[
  (Two-primary leading term).  #emph[For every elliptic curve $A \/ bb(Q)$ with $s_2 \( A \) lt.eq 1$,
    the quotient $Q_A$ of (1.3), with the total real period and the full-lattice regulator of (1.1),
    is a positive rational number, and
$ v_2 \( Q_A \) = v_2 \( \# "Sha" \( A \/ bb(Q) \) \) . $

]
] <classical:two-primary>

This is [24] Theorem 1.1. Its role here is exactly the assertion at two, together with positivity and rationality.
  After Theorem 2, (2.1) gives $s_p \( E \) = r \( E \)$ at every prime.
  Thus Theorem 3 applies to the curve in Theorem 1.

We also use the forward analytic theorem, in order to apply these conventions to auxiliary twists chosen by
  analytic nonvanishing.

#thm([Theorem 2.3.])[
  (Analytic rank zero and one).  #emph[If an elliptic curve $A \/ bb(Q)$ has $a \( A \) lt.eq 1$,
    then $r \( A \) = a \( A \)$ and the entire group $"Sha" \( A \/ bb(Q) \)$ is finite.]
] <classical:analytic-low-rank>

This is the Gross–Zagier–Kolyvagin theorem, using modularity [12,17,4].
  By (2.1) and Theorem 3, $Q_A in bb(Q)_(> 0)$ for every such $A$.
  Hence $X_p \( A \)$ is defined for all the twists used below.
  From now on, $p > 2$ is fixed, $v = v_p$ on constants, and we abbreviate $X_p \( A \)$ to $X \( A \)$.

#thm([Proposition 2.4.])[
  (Isogeny invariance).  #emph[Suppose $A$ and $A'$ are isogenous elliptic curves over $bb(Q)$ of analytic rank at
    most one. Then
$ frac(Q_A, \# "Sha" \( A \/ bb(Q) \)) = frac(Q_(A'), \# "Sha" \( A' \/ bb(Q) \)) . $

 In particular $X \( A \) = X \( A' \)$. Over a number field,
   the corresponding analytic-to-arithmetic BSD ratio is likewise invariant under isogeny when the
   Tate–Shafarevich groups are finite. It is compatible with products and restriction of scalars.]
] <classical:isogeny>

#proof[
  These are the arithmetic-volume identities of Cassels and the restriction-of-scalars comparison of Milne [6,19].
    The ratio is formed with the period lattice, full point lattice, torsion, component factors,
    and finite Tate–Shafarevich group; the kernel and cokernel factors of an isogeny cancel in this combined
    ratio. The analytic $L$-function is isogeny invariant. Finiteness in the rational low-rank applications is
    supplied by Theorem 4; it passes to the products and restrictions used here.
    Thus no conjectural equality of either ratio with one is required. ◻
]

=== 2.2 Auxiliary quadratic fields <auxiliary-quadratic-fields>

The pair comparison uses simultaneous nonvanishing for three twists.
  We record precisely the density input used for that choice.

#thm([Theorem 2.5.])[
  (Analytic twist densities).  #emph[For every elliptic curve $A \/ bb(Q)$,
    among nonzero squarefree integers $d$ ordered by $\| d \|$,
    the twists $A^d$ of analytic rank zero and one each have density $1 \/ 2$.
    Consequently the set of $d$ with $a \( A^d \) gt.eq 2$ has density zero.]
] <classical:twist-density>

We use the theorem at the scope stated in [22] Theorem 1.2.
  Its use below requires no uniform estimate as $A$ varies:
  one first chooses one discriminant and then applies the theorem to two fixed curves.
  This is the auxiliary-field argument of [23] Section 2.

#thm([Lemma 2.6.])[
  (Compatible auxiliary fields).  #emph[Let $E \/ bb(Q)$ have conductor $N$ and analytic rank $r in { 0 \, 1 }$.
    There exist coprime negative odd fundamental discriminants $D \, D' < - 4$ such that, for
$ K = bb(Q) \( sqrt(D) \) \, wide F = bb(Q) \( sqrt(D D') \) \, wide L = bb(Q) \( sqrt(D) \, sqrt(D') \) \, $

 the following statements hold.]
  + #emph[Every prime dividing $2 N p$ splits in both imaginary quadratic fields, and $(frac(D, \| D' \|)) = 1$.]
  + #emph[The analytic ranks of $E^D \, E^(D') \, E^(D D')$ are respectively $1 - r \, 1 - r \, r$.]
  + #emph[The extension $L \/ F$ is CM and unramified at every finite place,
    and $L$ has only the roots of unity ${ plus.minus 1 }$.]
  + #emph[One may require $L ∩ bb(Q) \( E \[ p \] \) = bb(Q)$ and, when $E$ has CM, that $L$ not contain its CM field.]
  #emph[Finitely many additional splitting conditions and exclusions of quadratic fields can be imposed.
    Both $L \( E \/ K \, s \)$ and $L \( E^(D') \/ K \, s \)$ have a simple zero at $s = 1$.]
] <classical:auxiliary-fields>

#proof[
  Negative odd fundamental discriminants in an admissible fixed congruence class have positive density.
    Prescribe splitting at $2 N p$, impose any additional splitting conditions,
    and exclude a finite set of quadratic fields. The zero-density exceptional set in Theorem 6 cannot exhaust
    these classes. We can therefore choose $D$ so that $a \( E^D \) lt.eq 1$.
  Keep $D$ fixed. Choose $D'$ prime to $D$, subject to the same splitting conditions and, in addition, $D' equiv -
    1 med \( mod med \| D \| \)$. Together with a sufficiently divisible modulus supported at $2 N
    p$ and any other prescribed primes, these conditions contain admissible classes of positive density.
    Since $\| D' \| equiv 1 med \( mod med \| D \| \)$, quadratic reciprocity gives the required Jacobi symbol.
    Apply Theorem 6 to the two fixed curves $E$ and $E^D$. The union of their exceptional sets still has density
    zero. Thus one can arrange both $a \( E^(D') \) lt.eq 1$ and $a \( E^(D D') \) lt.eq 1$.
  For a fundamental discriminant $b$ prime to $N$, the root-number multiplier is $chi_b \( - N \)$.
    Our splitting and sign prescriptions make this multiplier $- 1$ for $D$ and $D'$, and $+ 1$ for $D D'$.
    The functional equation and the ranks at most one therefore give the ranks in (ii).
    The two quadratic factorizations of the $L$-functions over $K$ prove the last assertion.
  The three quadratic subfields of $L$ have discriminants $D \, D' \, D D'$. The biquadratic discriminant formula yields
  $ \| "disc" L \| = D^2 \( D' \)^2 = "disc" \( F \)^2 . $
  The relative discriminant of $L \/ F$ has norm one, so it is trivial. The field $F$ is real and $L \/ F$ is CM.
    Excluding the finitely many quadratic subfields responsible for additional roots of unity gives the last
    assertion of (iii).
  The finite Galois extension $bb(Q) \( E \[ p \] \) \/ bb(Q)$ has only finitely many quadratic subfields.
    A nontrivial intersection with the biquadratic field $L$ would contain one of the three quadratic subfields of
    $L$. Exclude these possibilities when choosing $D$ and $D'$:
    after $D$ is fixed, prescribing either $bb(Q) \( sqrt(D') \)$ or $bb(Q) \( sqrt(D D') \)$ excludes only
    finitely many choices of $D'$. The same argument excludes the CM field.
    Finite exclusions do not alter the preceding positive-density argument. ◻
]

For the rest of the pair construction, fix such $D \, D' \, K \, F \, L$ and write $E' =
  E^(D')$ for the companion. In particular $p$ splits completely in $L$.
  The rational compact Selmer group over $K$ for each of $E \, E'$ has dimension one.
  Indeed restriction of scalars is isogenous to the product of the corresponding two rational twists,
  whose analytic ranks sum to one and whose Tate–Shafarevich groups are finite.
  A nonzero point in either rank-one line has nonzero local logarithm at both places above $p$:
  the kernel of the local elliptic logarithm on local points is torsion.

=== 2.3 Heegner points and the height formula <heegner-points-and-the-height-formula>

Put $d_K = \| D \|$. Let $f in S_2 \( Gamma_0 \( N \) \)$ be the normalized rational eigenform attached to $E$.
  Choose an oriented ideal of $cal(O)_K$ of norm $N$ with cyclic quotient, and let $P_X$ be the sum,
  once over the ideal class group of $K$, of the associated maximal-order Heegner divisor minus the cusp $oo$ on
  $X_0 \( N \)$. Thus $P_X in J_0 \( N \) \( K \)$. There is no division by the class number.

Let $phi.alt : X_0 \( N \) arrow.r E$ be a rational modular parametrization taking $oo$ to zero.
  We write $phi.alt_(*)$ for its map on degree-zero divisors, and define

#[#set math.equation(numbering: n => "(2.2)")
 $ P_K = phi.alt_(*) P_X \, wide phi.alt^(*) omega_E = c_E f \( q \) thin frac(d q, q) \, wide q =
   e^(2 pi i tau) . $ <eq:manin-constant>]

The nonzero rational constant $c_E$ is retained exactly; no claim that it is a $p$-adic unit is used.
  Write $\( f \, f \)_N$ for the unnormalized Petersson integral on the ordinary $Gamma_0 \( N \)$ quotient, and put

$ A_E = integral_(E \( bb(C) \)) \| omega_E and overline(omega_E) \| . $

Over a number field, $H_(upright("abs"))$ denotes the height of (1.1) formed from the absolute logarithmic
  $x$-height. It restricts to $H$ over $bb(Q)$. On the Jacobian,
  use the Poincare pairing and the orthogonal projector onto the rational newform factor with its restricted
  polarization; denote the resulting absolute diagonal by $H_(upright(a b s \, f))$.

#thm([Theorem 2.7.])[
  (Split Gross–Zagier normalization).  #emph[With the preceding conventions, $D$ odd fundamental, $\( D \, N \) =
    1$, all level primes split, and $cal(O)_K^times = { plus.minus 1 }$, one has
#[#set math.equation(numbering: n => "(2.3)")
 $ frac(sqrt(d_K), 8 pi^2 \( f \, f \)_N) L' \( f \/ K \, 1 \) & = 2 H_(upright(a b s \, f)) \( P_X \) \,\
L' \( E \/ K \, 1 \) & = frac(A_E, sqrt(d_K) thin c_E^2) dot.op 2 H_(upright("abs")) \( P_K \) . $ <eq:classical-gz>]

 In the simple-zero case $P_K$ is nontorsion.]
] <classical:gross-zagier>

The first formula is the conductor-one split Gross–Zagier formula in the normalization used in [12] Chapters I
  and V; the conversion is also recorded in [24] Section 2.
  For clarity, the conversion to the second formula uses the projection formula for $phi.alt_(*)$ and

$ \( deg phi.alt \) A_E = 8 pi^2 c_E^2 \( f \, f \)_N . $

The relative height over $K$ is $\[ K : bb(Q) \] H_(upright("abs")) = 2 H_(upright("abs"))$.
  This explains the factor two in both displays. The canonical height of the origin divisor is
  $H_(upright("abs")) \/ 2$; its Poincare-pairing diagonal is $H_(upright("abs"))$.
  Thus this convention agrees with (1.1), without an additional halving.

=== 2.4 The real arithmetic comparison <the-real-arithmetic-comparison>

The following equality is needed at odd primes. It is an equality of real arithmetic ratios before any valuation
  is taken.

#thm([Proposition 2.8.])[
  (Full-index discrepancy identity).  #emph[Assume $L \( E \/ K \, s \)$ has a simple zero under the hypotheses of
    Theorem 8. Then
#[#set math.equation(numbering: n => "(2.4)")
 $ frac(Q_E, \# "Sha" \( E \/ bb(Q) \)) frac(Q_(E^D), \# "Sha" \( E^D \/ bb(Q) \)) =
   frac(\[ E \( K \) : bb(Z) P_K \]^2, c_E^2 product_ell c_ell \( E \)^2 thin \# "Sha" \( E \/ K \)) .
   $ <eq:real-discrepancy>]

 The index on the right is the full group index, including torsion. Consequently, at any prime $p$, if
$ n_P = v_p #scale(x: 120%, y: 120%)[\(] \[ E \( K \) \/ E \( K \)_(upright("tors")) : bb(Z) overline(P)_K \]
  #scale(x: 120%, y: 120%)[\)] \, wide tau_g = v_p \( \# E \( K \)_(upright("tors")) \) \, $

 then
#[#set math.equation(numbering: n => "(2.5)")
 $ X_p \( E \) + X_p \( E^D \) = 2 \( n_P + tau_g \) - 2 v_p \( c_E \) - 2 sum_ell v_p \( c_ell \( E \) \) -
   v_p \( \# "Sha" \( E \/ K \) \) . $ <eq:classical-discrepancy>]

]
] <classical:discrepancy-identity>

#proof[
  Consider $A = "Res"_(K \/ bb(Q)) E_K$. It is isogenous over $bb(Q)$ to $E times E^D$.
    Its point group and Tate–Shafarevich group are $E \( K \)$ and $"Sha" \( E \/ K \)$,
    and its $L$-function is $L \( E \/ K \, s \)$. Its Neron period is $A_E \/ sqrt(d_K)$.
    To see the discriminant factor, use an integral quadratic basis for $cal(O)_K$ in the restriction of the
    invariant differential; the determinant of the dual Lie lattice has real Jacobian $1 \/ sqrt(d_K)$.
    The differential stays minimal over $K$: primes of bad reduction split, and good reduction stays good.
  The finite component product for $A$ is $product_ell c_ell \( E \)^2$.
    At a bad prime, the two split places each contribute $c_ell \( E \)$.
    At a ramified prime of good reduction, the special restriction fiber is an extension of the good special fiber
    by a vector group and is connected, so there is no extra component factor.
    At the remaining good primes the component factor is one.
    These period and component calculations are the restriction-of-scalars arithmetic comparison [19,24].
  Let $P_0$ generate the full free group $E \( K \) \/ E \( K \)_(upright("tors"))$, and write $P_K =
    m P_0$ modulo torsion. The rank-one regulator for $A$ is $2 H_(upright("abs")) \( P_0 \)$; hence
  $ frac(2 H_(upright("abs")) \( P_K \), "Reg"_A) = m^2 \, wide \[ E \( K \) : bb(Z) P_K \] = \| m \| thin \#
    E \( K \)_(upright("tors")) . $
  Dividing (2.3) by the BSD arithmetic volume just computed gives the right side of (2.4).
    Proposition 5 identifies the same ratio with the product on its left. Taking $v_p$ gives (2.5). ◻
]

In [24] Section 2, this real identity is subsequently evaluated at two.
  The proof above explains why the identity itself applies at any prime:
  neither the restriction-of-scalars calculation nor the Gross–Zagier height identity used a two-primary BSD
  equality. What remains in the present paper is to compute the odd-primary index and Tate–Shafarevich terms on
  the right of (2.5) by an exact integral comparison.

== 3 Integral cohomology and determinant comparisons <sec:models>

Fix an odd prime $p$. The arithmetic comparisons below will take place over power-series rings with coefficients
  in $bb(Z)_p$, before any rationalization. Three features of these comparisons are essential:
  specialization is derived, local conditions retain their torsion,
  and the duality maps are retained together with the complexes. We develop these features first.
  The last part of the section records the specialization criteria that will turn characterwise comparisons into
  integral divisibility.

=== 3.1 Complexes and finite models <complexes-and-finite-models>

Put $T = T_p E$ and $V = T ⊗_(bb(Z)_p) bb(Q)_p$. The Weil pairing identifies $T$ with its Tate dual
  $T^(*) \( 1 \)$. Cohomological Frobenius is arithmetic. Character weights in a theta sum or an Euler factor may
  therefore use the inverse of a cohomological character; each such comparison will specify its convention.
  Character corestriction is the unnormalized sum of translates.
  Its restriction to a field killing the character is the weighted sum with the character giving the required
  inverse equivariance, without division by the degree.

For a number field $F$ and a support $S$ containing the places above $p$ and infinity, write

$ G \( M \) = C^bullet \( G_(F \, S) \, M \) \, wide L_v \( M \) = C^bullet \( F_v \, M \) . $

Here $M$ is a finite free coefficient module, initially over a finite local Artin ring.
  A local condition is a map $U_v arrow.r L_v$. With $Q_v = "cone" \( U_v arrow.r L_v \)$, its Selmer complex is

#[#set math.equation(numbering: n => "(3.1)")
 $ C \( U \, M \) = "fib" (G \( M \) arrow.r xor.big_v Q_v) \, wide "fib" =
   "cone" \[ - 1 \] . $ <models:selmer-complex>]

A full condition is the identity and a strict condition is zero.
  Global duality uses modified localization at infinity. Since $p$ is odd, real Tate complexes are contractible.
  The Euler characteristic of ordinary global cohomology is the negative of the sum of the negative eigenspace
  dimensions at real places and the coefficient ranks at complex places.

The finite-model construction of [24] Section 3, “Finite models and matrix limits” has the following integral
  form. We give the construction because the residual specialization used in Section 4 is not a
  characteristic-zero formal germ.

#thm([Lemma 3.1.])[
  (Finite models and marked operations).  #emph[Consider continuous-cochain diagrams over finite local Artin rings
    of $p$-power characteristic, with finite free coefficient modules and compatible coefficient lifts.
    Assume that residual cohomology dimensions are bounded uniformly,
    and vanish outside a uniformly bounded range for every complex for which a bounded model is required.
    Then the diagrams admit bounded finite free models with derived base change.
    Restriction, unramified inflation, local cones, cup products, invariant maps, conjugation,
    and specified comparison homotopies can be retained simultaneously.]
  #emph[Suppose the scalar rings at the stages identify with every fixed Artin precision of a complete local ring
    $R$ with finite residue field. On a fixed nonprincipal ultrafilter $cal(U)$,
    the model matrices have compatible limits over $R$. Their marked identities survive arbitrary derived base
    change, in particular to residue fields of primes of $R$, including primes containing $p$.
    Fixed-group diagrams whose actions stabilize at every precision compute the actual cohomology of that group.
    A finite diagram may be enlarged on the same stages while retaining its previous models and markings.]
] <models:finite-models>

#proof[
  Continuous cochains with free coefficients over an Artin ring $A$ are flat:
    continuous functions are filtered colimits of finite free modules indexed by finite clopen partitions.
    Tensoring them with a finite scalar module gives the corresponding continuous cochains.
    A flat module over a local Artin ring is free. Indeed, lift a basis modulo the maximal ideal;
    nilpotence proves surjectivity, and flatness followed by nilpotence proves that the kernel is zero.
  Split the residual complex into its cohomology and contractible disks, and lift the graded bases.
    Write $d_0$ for the disk differential and $i \, q \, h$ for the inclusion, projection, and contraction,
    normalized by $h^2 = h i = q h = 0$ and $1 - i q = d_0 h + h d_0$. For $d = d_0 + epsilon.alt$, the formulas
  #[#set math.equation(numbering: n => "(3.2)")
   $ I & = \( 1 + h epsilon.alt \)^(- 1) i \, & Q & = q \( 1 + epsilon.alt h \)^(- 1) \,\
H & = h \( 1 + epsilon.alt h \)^(- 1) \, & d_(upright("small")) & =
  q epsilon.alt \( 1 + h epsilon.alt \)^(- 1) i $ <models:contraction>]
  are finite series in the nilpotent maximal ideal. Substitution, using $d^2 = 0$, gives $d I =
    I d_(upright("small"))$, $Q d = d_(upright("small")) Q$, $Q I = 1$, and $d H + H d = 1 - I Q$.
    The remaining ranks are the residual cohomology dimensions; hence they have the asserted bounds.
    Inserting $I \, Q$ transfers maps, and inserting $H$ transfers their composition homotopies.
    Tensoring the contractions transfers the cup maps and their homotopies.
    Cones may be formed from transferred maps and then contracted.
  Functions lift across coefficient quotients, so the contractions can be chosen compatibly.
    At a fixed precision the matrices belong to finite sets. Their ultrafilter values are therefore defined,
    and all finite matrix identities survive passage to the limit.
    Exact triangles survive by retaining their cone identifications;
    duality survives by retaining its maps and contracting the comparison cones.
    Because the models are free, ordinary tensor of these models is derived tensor.
    No inversion of $p$ enters this argument.
  For a fixed group, compare the limiting model at each precision with a contraction of its actual cochains.
    The two compositions are homotopic to the identities. These comparisons preserve the marked maps.
    Passing to compact inverse limits introduces no $lim^1$ term, by finiteness and compactness.
    When the diagram is enlarged, keep the old contractions, transfer the additional maps,
    and decrease the working precision along the ultrafilter if necessary.
    Any finite list of new identities is then retained at a cofinal sequence of precisions. ◻
]

The hypotheses hold for the diagrams used here. The residual representations belong to a fixed finite list,
  and the support has bounded cardinality. Pass to a fixed finite extension trivializing these representations and
  containing $mu_p$. Kummer theory bounds degree one by the fixed unit and class groups and the bounded number of
  allowed valuations. Inflation–restriction, local and global duality,
  and the odd-primary cohomological-dimension bounds give the remaining bounds.
  Thus the number of moving primes matters, but their ramification degrees need not be bounded.

=== 3.2 Localization and exact orthogonality <localization-and-exact-orthogonality>

At a non-$p$ place where $M$ is unramified, the unramified complex is

$ U_v^(upright("ur")) = \[ M arrow.r^("Frob"_v - 1) M \] quad upright("in degrees ") 0 \, 1 . $

Its quotient in the full local complex is residue cohomology on $M \( - 1 \)$, in degrees $1 \, 2$.
  Allowing such a place globally while imposing $U_v^(upright("ur"))$ gives the original global complex,
  by unramified inflation. These are the usual localization and purity comparisons;
  they hold for the models with their maps, not just for dimensions of cohomology.

For completeness, the $G_(F \, S)$ comparison can be checked after finite covers trivializing residual
  coefficients. In the universal cover, degree-one classes die as torsors.
  Brauer classes die after adjoining sufficient $p$-power roots of unity,
  whose local degrees grow at the finitely many required places, and Picard classes die after principalization.
  Purity, cohomological dimension, and Brauer reciprocity give higher vanishing.
  Real groups have order prime to $p$. This proves the comparison on residual coefficients,
  and the finite-model construction lifts it to all the coefficients in use.

Locally, first take invariants under the pro-prime-to-$p$ kernel of inertia, an exact operation,
  and then use the procyclic tame $p$-inertia resolution. A change of generator $z mapsto
  z^b$ acts on its degree-one term by $\( z^b - 1 \) \/ \( z - 1 \)$.
  If the conjugating powers tend to $1$ at the retained precisions,
  both the powers and these geometric sums tend to $1$. This observation fixes the local comparison when the
  residue cardinalities of moving primes tend to $1$.

After inversion of $p$, at a place with fixed possibly ramified Tate action and varying unramified scalar,
  use residue cochains on $V^(I_v)$. The singular quotient uses $V_(I_v) \( - 1 \)$ in degrees $1 \, 2$.
  Inertia has constant linear algebra before the Frobenius scalar is introduced.
  These unramified conditions contain all $H^0$ and inject into field $H^1$.
  Their paired cup is nullhomotopic through residue cochains.
  On a field fiber their degree-one dimension is $h^0$, and local duality and Euler characteristic zero identify
  their exact complements.

#thm([Lemma 3.2.])[
  (Exact local complements).  #emph[Let paired perfect local maps $U_v arrow.r L_v$ and $U'_v arrow.r
    L'_v$ have a specified nullhomotopy of their cup restriction. Suppose the induced morphism
$ L'_v \/ U'_v arrow.r U_v^or \[ - 2 \] $

 is an equivalence, where $or$ denotes derived linear dual before shifting.
   Then their Selmer complexes are perfect duals with shift $- 3$.
   The localization boundaries for nested such conditions are adjoint under this duality.
   These assertions hold over the model rings and after localization or derived specialization.]
] <models:orthogonality>

#proof[
  Let $G_c$ be the compact-support fiber of global localization.
    Poitou–Tate pairs $G_c$ with the unrestricted dual global complex with shift $- 3$,
    and local Tate duality pairs $L_v \, L'_v$ with shift $- 2$.
    Dualizing $G_c arrow.r C \( U \) arrow.r xor.big_v U_v$ and using the given local equivalences identifies the
    dual fiber with $C \( U' \)$. The same triangle identifies the boundary maps as adjoints.
  At finite precision these are the cup, invariant, and compact trace diagrams of local and global duality
    [20,21]. The top scalar local and compact cohomology groups, in degrees two and three,
    are the coefficient ring; their traces are compatible with reduction and corestriction.
    Retain these maps and the reciprocity homotopy in Lemma 10.
    Perfectness is checked on the residue field and lifted by contracting the comparison cone.
    This also proves compatibility after specialization. For split local complexes the required nullhomotopies are
    checked on the split cohomology; for unramified conditions they are supplied by the residue factorization above. ◻
]

Conjugate transport may identify a coefficient over an imaginary quadratic field with its Tate dual.
  In that convention complements are imposed at conjugate places.
  Under Shapiro, compact and local invariants are compatible with corestriction;
  no factor equal to the quadratic degree is inserted. Exact orthogonality over the testing ring is needed
  throughout. Orthogonality only after passage to its fraction field would not suffice for the determinant comparisons.

=== 3.3 Detection of classes after residual specialization <detection-of-classes-after-residual-specialization>

The models also allow classes to be tested on sequences of Galois elements.
  This will let Chebotarev produce new primes whose first-order effects distinguish specified classes.

#thm([Lemma 3.3.])[
  (Evaluation detection).  #emph[Let $G_R \( M \)$ be an unrestricted limiting global model as in Lemma 10.
    After any field specialization, including $R arrow.r "Frac" \( bb(F)_p \[ \[ upright(bold(u)) \] \] \)$,
    its degree-one cohomology injects into abstract crossed-homomorphism classes on the product of the stage
    absolute Galois groups. The action is obtained by taking entrywise coefficient limits before specialization.
    Invariants are detected in the same way. The assertion holds for a Selmer complex whenever its local
    conditions contain all local $H^0$ and inject into local field $H^1$.]
] <models:evaluations>

#proof[
  Keep the inclusions of the finite models into actual cochains.
    At residual precision a bounded list of group elements detects invariants and detects whether the values of a
    model cocycle have the form $g a - a$ for one $a$ in the coefficient module.
    The bound comes from linear equations in the coefficient space and in the bounded model space.
    Mark the resulting evaluation map to $\[ M arrow.r M^(upright("list")) \]$ in degrees zero and one.
    It is an isomorphism on residual $H^0$ and injective on residual $H^1$.
    Its cone has zero residual cohomology in degrees at most zero.
    A minimal model of the cone therefore has zero terms there.
    This remains true after every field base change and proves the required injection.
  For every sequence of group elements, and every pair or finite tuple of sequences,
    the evaluation matrices have compatible limits. The cocycle and coboundary equations consequently hold on
    their product group. Conjugation identities hold on classes by the marked homotopies.
    The Selmer assertion follows from the localization sequence and the hypotheses on the local maps. ◻
]

Here are two consequences that we will use. If a normal joint kernel $J$ acts trivially on the coefficients,
  restriction gives additive, equivariant evaluations on $J$.
  It detects classes whenever the quotient has vanishing $H^1$.
  A central scalar whose difference from $1$ is invertible gives this vanishing directly from the crossed
  homomorphism identity. In characteristic zero another useful quotient test is a normal subgroup consisting of
  arbitrary sequences in a fixed deep $"SL"_2 \( bb(Z)_p \)$ subgroup,
  with its standard plane action and trivial scalar twists.
  To see vanishing of even abstract $H^1$, use a constant diagonal $\( m \, m^(- 1) \)$,
  with integer $m > 1$ sufficiently close to $1$, to kill the cocycle on the diagonal.
  Conjugation multiplies the upper-unipotent parameter by $m^2$;
  the crossed relation and the $m^2$-power formula then kill the upper unipotent values,
  since the resulting coefficient matrix is invertible. Use the inverse diagonal for lower unipotents,
  and Gaussian factorization for arbitrary sequences. Such a subgroup remains available in a non-CM Tate image in
  the presence of competing data of bounded derived length:
  sufficiently iterated derived groups kill those data and still contain a deep special linear subgroup.

For an absolutely simple coefficient representation with scalar endomorphisms,
  evaluations of independent detected classes span the full tuple of coefficient spaces.
  Otherwise their equivariant span, a submodule of a sum of copies of that simple representation,
  would give a scalar relation among the classes. The same holds jointly for pairwise nonisomorphic simples.
  This statement is valid in the residual fields; it requires neither characteristic-zero semisimplicity of the
  Galois group nor an assertion about polynomial avoidance on a finite field.
  We will use its linear span and bilinearity there.

Finally, a finite table of the evaluations and other continuous arithmetic data factors through a finite quotient
  at each retained precision. Chebotarev realizes it by a Frobenius representative once the prescribed splitting
  conditions are compatible. Adding primes uses unramified inflation with its marked homotopies,
  so evaluations already made are preserved. Cup-primitive equations solved in a field-specialized model are
  interpreted on these evaluation cochains using the same inclusions and homotopies.
  Reciprocity in this use is the transferred arithmetic invariant identity,
  not a reciprocity assertion for an abstract product group.
  Over a fixed finite extension of $bb(Q)_p$, fixed denominators can be cleared and equations lifted to increasing
  precision. Such clearing is used only after inversion of $p$.

=== 3.4 Determinant volumes and switching lemmas <determinant-volumes-and-switching-lemmas>

For a perfect complex define its inverse determinant by

$ cal(D) \( C \) = ⨂_i \( det C^i \)^(\( - 1 \)^(i + 1)) . $

At a DVR $A$, let $d \( C \, y \)$ be the valuation of a generic tensor $y$ relative to a generator of this line.
  A torsion cohomology group of length $b$ in degree $i$ contributes $\( - 1 \)^(i + 1) b$.
  In particular, for a generically acyclic square complex in degrees $1 \, 2$,

#[#set math.equation(numbering: n => "(3.3)")
 $ d \( C \, 1 \) = - v \( det d^1 \) . $ <models:determinant-sign>]

Determinants multiply in exact triangles. Bases and their signs are understood up to integral units.

The following statements give the precise interfaces of the algebra lemmas in [24] Lemmas 3.5 and 3.6.
  Their hypotheses will be verified at the primes where the switches are used.

Here is the local diagram used in both statements. At one place choose conditions

$ U_(-) subset U_f \, U_s subset U_(+) \, wide U_f ∩ U_s = U_(-) \, wide U_f + U_s = U_(+) \, $

whose quotients are split free in degree one:

$ U_f \/ U_(-) = F \[ - 1 \] \, wide U_s \/ U_(-) = S \[ - 1 \] \, wide U_(+) \/ U_(-) = \( F xor S \) \[ - 1 \] . $

The conditions contain all local $H^0$; $U_(+)$ omits local $H^2$.
  Write $C_(-) \, C_f \, C_s \, C_(+)$ for the global complexes with these respective conditions,
  keeping all other places fixed. The localization maps from $H^1 \( C_f \)$ to $F$ and from $H^1 \( C_s \)$ to
  $S$ are denoted by $f$ and $s$. The dual coefficient has the exactly complementary diagram,
  and the mixed pairing between the corresponding finite and transverse quotients is perfect.
  A fiber means derived tensor with the DVR residue field; a generic line has a primitive fiber reduction by
  taking a generator of its saturated kernel in the two-term free model.
  The opposite condition in the line lemma is the complementary condition on the dual coefficient.

#thm([Lemma 3.4.])[
  (Line switch).  #emph[Over a DVR $A$ with residue field $k$,
    suppose local finite and transverse coordinates are split free lines in degree one,
    with perfect mixed pairing. The lower condition contains all $H^0$, the upper condition omits $H^2$,
    and the global lower and upper diagrams have exact complementary duality.
    Assume the finite and transverse global complexes have amplitude $\[ 1 \, 2 \]$ on the generic and residual
    tests. Suppose the finite complex has only a generic degree-one line.
    At a fiber with $dim H^1 \( C_f ⊗_A k \) = h > 1$, assume nonzero finite evaluation both for a primitive
    reduction of that line and for some degree-one class of the opposite condition.
    Then switching lowers the degree-one dimension by one, and leaves one generic degree-one line.
    If integral classes $Y \, Y'$ satisfy $s \( Y' \) = f \( Y \)$ under a unit-volume isomorphism of coordinates, then
$ d \( C_f \, Y \) = d \( C_s \, Y' \) . $

 Successive switches ending at dimension one prove nonnegativity of this common valuation.]
] <models:line-switch>

#proof[
  The generic finite evaluation is nonzero, so the lower complex is generically acyclic.
    In the fiber, reciprocity against the nonzero opposite finite evaluation prohibits a transverse contribution.
    The two localization triangles therefore lower the dimension by one.
    Those same triangles identify the class tensors through the common lower tensor $1$;
    the local isomorphism changes its volume only by a unit. At dimension one the minimal model is a free line in
    degree one, and the integral class has nonnegative coordinate valuation. ◻
]

#thm([Lemma 3.5.])[
  (Square switch).  #emph[In the preceding local diagram over a DVR $A$ with residue field $k$, let $F \,
    S$ be split free planes. Retain all $H^0$ in the lower condition and omit $H^2$ from the upper condition.
    Assume amplitude $\[ 1 \, 2 \]$ for both switched global complexes on their generic and residual tests,
    exact self-duality of the lower and upper diagrams, and perfect mixed pairing.
    The pure finite and transverse planes are isotropic, with their compatible cup nullhomotopies retained.
    On a common plane let $e$ be unimodular alternating and $J$ an integral involution,
    with cross pairing $e \( x \, J y \)$ up to a unit. Suppose the finite complex has generic rank one in degrees
    one and two, with class $Y$ and $f \( Y \) eq.not 0$, and an integral transverse class satisfies $s \( Y' \) =
    J f \( Y \)$ up to a unit. Then the transverse complex has the same generic ranks and
$ d \( C_f \, \( Y \, Y^or \) \) = d \( C_s \, \( Y' \, \( Y' \)^or \) \) \, $

 where the dual tensor uses the pairing functional on degree two.
   If finite evaluation has rank two at a fiber with $dim H^1 \( C_f ⊗_A k \) >
   1$ and is nonzero on a primitive reduction of $Y$, the switch lowers its degree-one dimension by two.
   Ending at dimension one gives nonnegative valuation for the class-functional tensor.]
] <models:square-switch>

#proof[
  Adjunction identifies the annihilator of the upper localization image with that same image,
    so the image is self-annihilating in the four coordinates.
    The two generic classes form a basis of the upper degree-one space.
    In the dual basis of $H^2 \( C_(-) \)$, write $Y^(*) \, \( Y' \)^(*)$ for the functionals normalized to take
    value one on their respective upper basis vectors. These are dual basis vectors,
    distinct from the pairing functionals $Y^or \, \( Y' \)^or$ used in the determinant tensors.
    Choose a rational complement $x$ to $f \( Y \)$ whose boundary is $\( Y' \)^(*)$.
    The cross-pairing gives $e \( x \, J s \( Y' \) \)$ a unit value, and $s \( Y' \) =
    J f \( Y \)$ therefore makes $f \( Y \) and x$ a unit plane volume. The complement need not be integral:
    if both classes are multiplied by a uniformizer $pi.alt$,
    the normalized dual $\( Y' \)^(*)$ and this complement are divided by $pi.alt$.
    Interchanging the planes gives the same volume. Thus both triangles identify the class-functional tensors with
    the same lower tensor, proving the equality. At a rank-two fiber the upper image is exactly the finite plane,
    giving the dimension drop. At the terminal fiber the model is two free lines with zero differential and
    unimodular pairing. The tensor is integral there. Compatible nullhomotopies on the lower comparisons are part
    of exact duality and are retained at all unchanged places. ◻
]

#thm([Lemma 3.6.])[
  (Strict versus finite conditions).  #emph[At a split pair $w \, macron(w)$,
    let $C_(*)$ be strict at $w$ and full at $macron(w)$, and let $C_F$ impose exactly complementary finite
    conditions $U_w \, U_(macron(w))$. Keep all other conditions fixed with conjugate duality.
    Suppose these comparisons are perfect over a DVR, $U_w$ is generically a line in degree one,
    $C_(*)$ is generically acyclic, and $Y in H^1 \( C_F \)$ has nonzero localization.
    If $"loc"_w Y = a e$ in a generic basis $e$ of $U_w$, then
#[#set math.equation(numbering: n => "(3.4)")
 $ d \( C_F \, \( Y \, Y^or \) \) = d \( C_(*) \, 1 \) + 2 #scale(x: 120%, y: 120%)[\(] v \( a \) +
   d \( U_w \, e \) #scale(x: 120%, y: 120%)[\)] . $ <models:strict-finite-volume>]

 Moreover $C_F$ has exactly one generic line in each of degrees one and two.
   Conversely, these line assertions and the nonzero localization imply the strict acyclicity.]
] <models:strict-finite>

#proof[
  Use $C_0$, strict at $w$ and finite at $macron(w)$, and the triangles $C_0 arrow.r C_F arrow.r
    U_w$ and $C_0 arrow.r C_(*) arrow.r L_(macron(w)) \/ U_(macron(w))$.
    The latter quotient is $U_w^or \[ - 2 \]$. Its boundary of $e^(*)$ pairs with $Y$ by $a$.
    The two triangles therefore compare the tensors with a factor $a^2$, and their local lattice volumes are dual.
    This gives the formula and the rank assertions; the converse follows by the same nonzero adjoint boundary.
    This is the determinant calculation of [24] Lemma 3.4. ◻
]

=== 3.5 The Kummer lattice and its volume <the-kummer-lattice-and-its-volume>

At an actual scalar specialization the integral local condition is

$ U_v^(upright("Kum")) = E \( F_v \)_p^and \[ - 1 \] arrow.r C^bullet \( F_v \, T \) . $

The completed point module includes its torsion. Its derived reduction modulo $p^n$ therefore has the invariant
  $p^n$-torsion in degree zero and the finite Kummer image in degree one.
  The Bockstein identifies the former with the integral torsion Kummer classes.
  Finite Kummer orthogonality and derived base change show that these conditions are exact complements.
  More explicitly the cup restriction is null: morphisms from the derived Kummer tensor to scalars in degree two
  are detected in top degree, and finite Kummer pairings vanish for every $n$.
  The resulting local quotient duality is an equivalence on the residue field and hence integrally.

Compact local duality gives

$ 0 arrow.r E \( F_v \)_p^and arrow.r H^1 \( F_v \, T \) arrow.r
  "Hom" \( E^or \( F_v \)_p^and \, bb(Z)_p \) arrow.r 0 . $

In particular at a non-$p$ finite place the compact degree-one cohomology is entirely Kummer.
  Over $F_v \/ bb(Q)_p$, the rational abelian-variety comparison of Bloch–Kato gives

#[#set math.equation(numbering: n => "(3.5)")
 $ "inv"_v \( z union x \) = plus.minus "Tr"_(F_v \/ bb(Q)_p) #scale(x: 120%, y: 120%)[\(] exp^(*) z dot.op log x
   #scale(x: 120%, y: 120%)[\)] . $ <models:log-exp-pairing>]

For $F_v = bb(Q)_p$ and $exp^(*) z = alpha omega_E$, this is $plus.minus alpha log_(omega_E) x$.
  This rational comparison includes bad reduction; it makes no assertion that exponential coordinates are integral
  quotient bases [2].

#thm([Lemma 3.7.])[
  (Local Haar factors).  #emph[For the minimal differential, write $P_ell \( 1 \) = L_ell \( E \, 1 \)^(- 1)$,
    $tau_ell = "length" E \( bb(Q)_ell \) \[ p^oo \]$, and $log_(omega_E) E \( bb(Q)_p \) = p^l bb(Z)_p$. Then
#[#set math.equation(numbering: n => "(3.6)")
 $ tau_ell = v_p \( c_ell P_ell \( 1 \) \) quad \( ell eq.not p \) \, wide tau_p - l =
   v_p \( c_p P_p \( 1 \) \) . $ <models:haar-identities>]

 The connected real period $Omega_0$ on a primitive positive Betti cycle satisfies $Omega_E \/ Omega_0 = \#
   pi_0 \( E \( bb(R) \) \)$, a $p$-adic unit.]
] <models:haar>

#proof[
  The measure of the identity-component points for the minimal differential is the nonsingular residue size
    divided by $ell$, namely $P_ell \( 1 \)$. Multiplication by the component number gives $c_ell P_ell \( 1 \)$.
    Away from $p$, the formal subgroup has pro-$ell$ order and contributes no $p$-primary valuation.
    At $p$, a sufficiently small subgroup is identified by formal logarithm with its additive lattice.
    The $p$-primary part of the logarithm’s finite kernel has size $p^(tau_p)$,
    and its image has measure $p^(- l)$; the prime-to-$p$ kernel contributes a valuation unit.
    This gives the second identity. The real identity follows by translation of the minimal differential across
    the components. ◻
]

#thm([Lemma 3.8.])[
  (Global Kummer volume).  #emph[Let $K$ be imaginary quadratic,
    suppose $E \( K \)$ has rank one and $"Sha" \( E \/ K \)$ is finite,
    and let $C_(upright("Kum"))$ impose the full integral Kummer conditions.
    Put $tau_g = v_p \( \# E \( K \)_(upright("tors")) \)$ and $s_K = v_p \( \# "Sha" \( E \/ K \) \)$.
    For a nontorsion point $P$ let $n_P$ be the valuation of its index in $E \( K \) \/
    E \( K \)_(upright("tors"))$. Then
#[#set math.equation(numbering: n => "(3.7)")
 $ d \( C_(upright("Kum")) \, \( P \, P^or \) \) = 2 n_P + 2 tau_g - s_K . $ <models:kummer-volume-formula>]

]
] <models:kummer-volume>

#proof[
  Derived Kummer reduction gives the usual finite Selmer groups;
    passage to divisible coefficients gives the usual Kummer sequence.
    Whole-Sha finiteness therefore identifies integral degree one with the compact Mordell–Weil module.
    The torsion in degree two is the finite quotient in the compact-to-divisible comparison and has length $s_K$.
    Duality gives torsion length $tau_g$ in degree three, as well as a unimodular pairing on the free parts in
    degrees one and two. The torsion lengths in degrees one, two, three are consequently $tau_g \, s_K \, tau_g$.
    Their inverse-determinant contribution is $2 tau_g - s_K$,
    and the point and its pairing functional each contribute $n_P$.
    This proves the formula, including under conjugate-field duality; compare [24] Section 3,
    “Central Kummer lattices and local measures”. ◻
]

=== 3.6 Bounded series and specialization <bounded-series-and-specialization>

A bounded series has coefficients in a fixed complete DVR, or in its fraction field with one common denominator.
  This condition excludes general formal power series over the fraction field. For measure coefficients we also use

$ cal(V) = W \( overline(bb(F))_p \) \, wide cal(V)^(*) = "proj lim"_j product_(cal(U)) \( cal(V) \/ p^j \) =
  W (product_(cal(U)) overline(bb(F))_p) . $

This is again a complete integer DVR; fixed finite ramification may be adjoined.
  Arithmetic model matrices are first formed over the smaller rings with finite residual coefficients.
  Bounded measures may then use this larger constant ring. Fixed character substitution and fixed finite group
  quotients commute with the limits. A tame cyclic generator is denoted by $1 + u$;
  its relation disappears at every fixed Artin precision when its $p$-power order tends to infinity.

#thm([Lemma 3.9.])[
  (Division from high characters).  #emph[Let $cal(O)$ be one of these complete integer DVRs and let $L \,
    B in cal(O) \[ \[ t \, upright(bold(u)) \] \]$. Suppose $L equiv.not 0 med \( mod med \( pi.alt \, t \) \)$,
    where $pi.alt$ is a uniformizer. If, for every sufficiently high finite $p$-power character $theta$ of $1 +
    t$, the specialization $B \( theta \, upright(bold(u)) \)$ is divisible by $L \( theta \, upright(bold(u)) \)$
    after inversion of $p$, then $L$ divides $B$ integrally. The assertion applies simultaneously to finite
    products of such divisors and after the fixed constant extensions above.]
] <models:series-division>

#proof[
  Choose integers $n_j$, one equal to $1$ and the others with suitably large successive $p$-adic valuations,
    so that restriction to $1 + u_j = \( 1 + x \)^(n_j)$ separates a nonzero leading monomial of the reduction.
    Extend this to a group-power coordinate change. Then $L$ is distinguished, up to a unit,
    in one tame coordinate. Applying this to a product handles a finite list.
    Prescribed characteristic-zero generic ranks and nonvanishings at $t = 0$ may also be retained:
    their leading homogeneous forms in logarithmic coordinates impose finitely many proper conditions on the
    integer choices, which can be avoided within the specified congruences.
  Divide $B$ by the monic Weierstrass polynomial of $L$. At each high $theta$ its distinguished degree is
    unchanged, and its quotient module is $p$-torsion-free. Thus divisibility after inversion of $p$ makes the
    integral remainder zero. Every coefficient of this remainder, considered as a bounded series in $t$,
    vanishes at all high finite characters and is therefore zero by one-variable Weierstrass preparation.
    The argument also applies componentwise to finite coefficient orders embedded in products of DVRs when the
    same residual regularity is retained. It is the proof of [24] Lemma 3.10, with $p$ in place of two. ◻
]

Two further forms of this principle will be useful. First, a nonzero bounded one-variable series has,
  at sufficiently high characters, valuation equal to its minimum coefficient valuation plus the first degree
  attaining that minimum times the valuation of $theta - 1$.
  This is unique dominance; it also proves finite character avoidance for several variables by iteration.

#thm([Lemma 3.10.])[
  (Persistence of poles).  #emph[Suppose integral stage numerators and denominators in a genuine variable converge
    coefficientwise along the ultrafilter, with nonzero limiting denominator.
    If every stage numerator is divisible by its denominator after inversion of $p$,
    each zero of the limiting denominator in the open unit disk is a zero of the limiting numerator with at least
    the same multiplicity.]
] <models:poles>

#proof[
  Coefficientwise converging integral series converge uniformly on smaller closed disks.
    A zero of multiplicity $m$ of a nonzero limiting denominator can be isolated on such a disk.
    Weierstrass preparation there retains its zero count on an ultrafilter-large set.
    If stage numerators are divisible by stage denominators after inversion of $p$,
    the limiting numerator has at least that multiplicity. This pole test permits uncontrolled stage denominators
    because boundedness is imposed on numerator and denominator separately.
    Tame characters, when present, are fixed before this one-variable argument. ◻
]

#thm([Lemma 3.11.])[
  (Points on a horizontal divisor).  #emph[For a characteristic-zero height-one divisor in a bounded
    $bb(Z)_p$-power-series ring, finitely many functions nonzero on that divisor can be kept nonzero at a point
    whose coordinates lie in the open unit disk of a finite extension of $bb(Q)_p$.]
] <models:field-points>

#proof[
  Its prime generator is not divisible by $p$. A weighted coordinate change makes it distinguished in one
    variable. Modulo its Weierstrass polynomial the norms of the finitely many nonzero functions to the remaining
    power-series ring are nonzero. Choose the other coordinates,
    in finite extensions and in their open unit disks, avoiding these norms;
    bounded-series avoidance gives such a choice. A root of the distinguished polynomial is also interior and
    belongs to a finite extension. It gives the required point. ◻
]

#prodef([Remark 3.12.])[
  (Central determinant coordinates).  When the generic and specialized cohomology dimensions agree,
    a determinant coordinate specializes using any surviving set of Gaussian pivots.
    One need not keep a particular rational pivot formula whose denominator vanishes at the point.
    At actual central stage calculations, bounds on torsion lengths and the corresponding rank tests keep suitable
    minors nonzero in the limit. Numerator, denominator, and class coordinates then converge by their finite
    matrix formulas. This is why retaining torsion in the integral models is necessary for central valuations.
] <models:central-pivots>

== 4 Auxiliary primes and residual concentration <sec:vertical>

The characterwise comparisons of the later sections will invert $p$.
  They cannot detect a power of $p$ in a determinant. The purpose of this section is to choose finitely many tame
  variables so that the relevant determinant already has nonzero reduction modulo $p$.
  We do this by making first-order deformations separate every surviving residual Selmer class.
  We give both the arithmetic construction and the residual-field argument, including reducible representations.

=== 4.1 The two coefficient families <the-two-coefficient-families>

Use the fields $K \, F \, L$ and discriminants $D \, D'$ of Section 2.
  In particular $p$ splits completely in $L$, the residual division field is disjoint from $L$,
  and both $E \/ K$ and $E^(D') \/ K$ have rank one and finite Tate–Shafarevich group.
  There will be two separate tuples of auxiliary primes. Over $bb(Q)$ the true variable $t$ is the torsion-free
  cyclotomic variable, and this comparison is used only for a non-CM curve.
  Over $K$ it is the anticyclotomic variable, with

$ Gamma tilde.eq bb(Z)_p $

the maximal free pro-$p$ quotient of the ring-class tower at $p$.
  The order-class exact sequence shows that inertia at either $p$-place has open image in $Gamma$.

Fix supports stable under conjugation. Over $bb(Q)$ include $p$ and all bad primes.
  For $E \/ K$ include only places over split rational primes, including both $p$-places and all bad places.
  For the companion also include the primes dividing $D'$. Any nonsplit place in this extra support has no inertia
  invariant, even on residual composition factors: $E$ has good reduction there,
  whereas the quadratic twist is ramified and $p$ is odd. In each problem over $K$,
  include split good prime ideals whose classes generate the $p$-part of the ideal class group.
  Degree-one representatives exist by Chebotarev. Additional fixed split good primes may be included;
  we may also prescribe exponents at fixed split test primes without adding them to the cohomological support.
  Outside the support the condition is unramified.

A tame variable $u_j$ comes from a sequence of distinct good primes $r_(j \, i)$,
  leaving every finite set and tending $p$-adically to $1$. Over $K$ these primes split completely in $L$.
  Its stage character has cyclic $p$-power order tending to infinity.
  Over $bb(Q)$ it is a conductor-$r_(j \, i)$ cyclotomic character. Over $K$ it is given by a surjection

$ lambda_(j \, i) : "Pic" \( cal(O)_(r_(j \, i)) \) arrow.r bb(Z) \/ p^(n_(j \, i)) bb(Z) $

which is surjective on inertia at each of the two places over $r_(j \, i)$ and satisfies $lambda_(j \, i)^c = -
  lambda_(j \, i)$. A chosen cyclic generator is represented by $1 + u_j$.
  Rational characters of $p$-power order are automatically even.

#thm([Lemma 4.1.])[
  (Auxiliary tuples).  #emph[For any finite list of fixed split support and test primes,
    the tame tuple may be chosen to have the following properties.]
  + #emph[Its limiting elliptic Frobenius actions have determinant one and $V \( gamma_j \) - 1$ invertible.
    Over $K$ the same holds for the companion. The weight character $cal(C)$ used in the theta construction has
    nontorsion value on each $gamma_j$, and its $Gamma$ value is nonzero.]
  + #emph[The vectors of Frobenius exponents in the artificial variables at the prescribed primes are linearly
    independent over $bb(Q)_p$, one vector for each rational prime and with one place chosen in each split pair.
    The list includes the coefficient prime $p$.]
  + #emph[There are at least two moving primes. Each moving inertia group maps onto its own cyclic quotient and
    trivially to the others. All fixed conductors and any prescribed finite set of primes are avoided.]
  #emph[Here $cal(C)$ is the algebraic anticyclotomic character with infinity type one and split conductor used in
    [23] Sections 2 and 4. Finitely many such fixed characters may be treated simultaneously.
    In the rational case the conditions on $cal(C)$ and $Gamma$ are omitted.]
] <vertical:auxiliary-tuples>

#proof[
  First prescribe power-residue data. In the rational case the radicands are the fixed primes themselves.
    In the imaginary case choose ideal-class generators away from the prescribed places,
    generators of their principal power relations, and generators for expressions of the prescribed prime ideals
    in those classes. Include the conjugates. For a split prime $frak(q)$,
    take a class-number power $frak(q)^h = \( a_(frak(q)) \)$.
    The corresponding anticyclotomic residue exponent is, up to its common generator normalization,
    the Kummer exponent of $a_(frak(q)) \/ overline(a_(frak(q)))$.
    These elements are independent by their valuations at the chosen split pairs.
  Their Kummer image over the cyclotomic tower has full $bb(Z)_p$-rank.
    One way to see the required restriction injectivity modulo $p^a$ is to use a central cyclotomic element whose
    scalar differs from $1$ by a unit; such an element exists since $p$ is odd and splits in the fixed fields.
    A further fixed finite extension loses at most a bounded power of $p$.
    A $bb(Z)_p$ relation annihilating the Kummer image would consequently give power relations modulo arbitrarily
    high $p$-powers, contradicting the independent valuations.
    Thus sufficiently deep prescribed exponents can be chosen independently.
  To extend an inertia logarithm across the class group, write the fixed class-group relations in invariant-factor
    form. Require the power-residue exponents to be divisible by the fixed $p$-parts of these invariant factors,
    and divide the relations to assign the values on the ideal generators.
    Principal relations then define the whole character. Anti-invariance is imposed using the conjugate
    generators. The fixed divisions change neither the full rational span of the limiting exponents nor their
    independence. Finite Chebotarev conditions on roots of unity and on this radical list realize these
    power-residue prescriptions. Taking enough moving primes gives the independent row vectors in the assertion.
  We next check compatibility with the elliptic and fixed character conditions.
    Adjoin all $p$-power roots of elements of the base to the cyclotomic tower,
    and consider the joint compact $p$-adic analytic image of the Tate representation and the fixed characters.
    The common Lie quotient with the radical translation group is abelian.
    In the non-CM case it kills the $frak(s l)_2$ factor of the Tate image, by Serre’s open image theorem [26].
    In the CM case, after a fixed extension, the connected Tate image is a torus.
    Conjugation on the remaining abelian analytic quotient is trivial after a finite extension,
    whereas conjugation on radical translations is multiplication by the cyclotomic character.
    Choosing that character different from $1$ proves that the common Lie quotient is zero.
    Hence fixing all radicals removes no Lie dimension from the analytic image.
  Make the prescribed radical data sufficiently deep that an identity neighborhood remains available.
    Its determinant-one Tate projection contains an open special linear subgroup, or an open norm-one CM torus.
    The equation $det \( V \( gamma \) - 1 \) = 0$ is a proper analytic condition there.
    The weight character is nonconstant by its nonparallel labelled $p$-adic exponents,
    and the true anticyclotomic character is nonconstant by its inertia description.
    After shrinking the neighborhood, the torsion condition on the weight is the zero-logarithm locus.
    Avoiding these finitely many proper analytic loci gives the required Frobenius limits.
    The companion has the same Tate action on $G_L$.
  Only finite radical and coefficient tables are used at any stage.
    They can therefore be combined into finite Chebotarev prescriptions with accuracy tending to infinity.
    If a bound on $v_p \( r_(j \, i) - 1 \) - n_(j \, i)$ is required,
    perturb by a sufficiently high power of a fixed near-identity element with nontorsion cyclotomic projection.
    Its radical geometric sums vanish to the required precision,
    while its cyclotomic displacement has valuation $n_(j \, i) + O \( 1 \)$.
    No boundedness of the unramified $p$-local degrees of the full conductor fields is used. ◻
]

Put $R = bb(Z)_p \[ \[ t \, upright(bold(u)) \] \]$ and let $chi$ be the product of the true and artificial
  character scalars. Over $bb(Q)$ let $G$ be the ordinary global complex for $T chi$,
  with the moving places allowed. Over $K$ use the full global complex, also allowing the moving places, and set

$ C_w = "fib" \( G arrow.r L_w^(upright("loc")) \) \, wide w divides p \, $

where the condition at the other $p$-place is full. The residual restriction kills global $H^0$,
  and the complementary restriction at the other $p$-place kills dual $H^0$. Euler characteristic is zero.
  Thus $C_w$ has a square free model in degrees $1 \, 2$; let $L_w$ denote its differential determinant,
  up to a unit. Use $L'_w$ for the companion. Inverting all character conventions gives the same assertions.

#thm([Proposition 4.2.])[
  (Residual concentration).  #emph[After adjoining finitely many more tame variables,
    the separate rational and imaginary tuples satisfy
#[#set math.equation(numbering: n => "(1)")
 $ upright(\( a \)) & G ⊗_R R_(\( p \)) upright(" is a free line in degree one") \;\
upright(\( b \)) & L_w \, L'_w equiv.not 0 med \( mod med \( p \, t \) \) quad
  upright("for both ") w divides p . $ <eq:source-1>]

]
] <vertical:tests>

The proof occupies the rest of the section. We first describe the residual cohomology and its parity,
  then produce a deformation that kills each residual strict space.

=== 4.2 Residual spaces and the scalar primitive <residual-spaces-and-the-scalar-primitive>

Initially specialize to

$ k_r = "Frac" \( bb(F)_p \[ \[ upright(bold(u)) \] \] \) \, wide t = 0 . $

The residual elliptic representation is either absolutely simple or has character constituents.
  Indeed its image contains an element acting with eigenvalues $1 \, - 1$, even after restriction to $G_K$,
  by the disjointness imposed in Section 2. An irreducible plane cannot have a quadratic endomorphism field
  commuting with this element. In the reducible case the two characters are distinct, also over $K$.
  Test each simple constituent, extending the finite coefficient field when necessary,
  and include the $chi$ twist. Its paired Tate dual has the inverse twist.

At every finite place in these tests $H^0 = H^2 = 0$. At fixed split places the nonconstant Frobenius scalar gives
  $H^0 = 0$; at nonsplit exceptional places inertia does so; at a moving place its own inertia variable does so.
  Apply the same argument to the dual to obtain $H^2 = 0$. Away from $p$,
  Euler characteristic zero then makes the full local complex acyclic. Global invariants vanish as well.
  The strict Selmer degree-one spaces consequently inject into unrestricted cohomology by Lemma 12.

Over $bb(Q)$, write $s$ for the dimension of the dual all-strict space.
  Its paired unrestricted primal space has dimension $s + a$,
  where $a$ is the negative dimension of the primal constituent at infinity.
  Killing the former space will kill primal $H^2$. Over $K$,
  pair the $w$-strict space with the dual $macron(w)$-strict space.
  Exact orthogonality and Euler characteristic make their dimensions equal, say $s$.

#thm([Lemma 4.3.])[
  (Scalar localization).  #emph[For the constant roots coefficient,
    global degree-two localization is injective on these residual tests.
    In particular a cup of two paired classes which is locally zero has a global cochain primitive.]
] <vertical:scalar-localization>

#proof[
  At residual arithmetic precision, the dual of the localization kernel is the space of everywhere locally trivial
    constant $bb(F)_p$-characters, by Poitou–Tate. Such a character is unramified everywhere and split at the
    support; it is therefore a class-group character killed by the chosen generating prime classes.
    Over $bb(Q)$ the same group is zero. The scalar representation and its cohomological comparison do not depend
    on the artificial variables. Tensoring its residual diagram with $bb(F)_p \[ \[ upright(bold(u)) \] \]$ and
    then its fraction field preserves this injection. Equivalently retain the injectivity cone in Lemma 10.
    Thus a locally zero degree-two scalar class is zero, giving the primitive. ◻
]

#thm([Lemma 4.4.])[
  (Conjugate parity).  #emph[For an absolutely simple residual elliptic plane over $K$,
    each one-sided strict space above has even dimension. The same alternation statement holds on
    characteristic-zero localizations with unramified conditions at fixed non-$p$ places and constant inertia action.]
] <vertical:parity>

#proof[
  Keep $t = 0$ and lift the residual test to the $\( p \)$-DVR of $bb(Z)_p \[ \[ upright(bold(u)) \] \]$.
    Non-$p$ local complexes are contractible there, since their residual tests are acyclic.
    The remaining one-sided problem is perfect in degrees $1 \, 2$, with conjugate self-duality.
    It is generically acyclic. To check this last assertion, specialize centrally in characteristic zero.
    The moving-place singular determinants are nonzero because $V \( gamma_j \) - 1$ is invertible.
    Inflation therefore gives the fixed-support problem. The simple-zero choices give one compact Selmer line from
    points, and its localization at either $p$-place is nonzero because the local logarithm has torsion kernel.
    At non-$p$ places the rational local elliptic cohomology vanishes by the absence of elliptic invariants,
    local duality, and Euler characteristic zero. The strict–finite triangles of Lemma 15 now give strict
    acyclicity. A nonzero central determinant is nonzero generically.
  We spell out the sign that controls specialization. On the induced coefficient, in its two $K$-coordinates,
    the pairing is
  #[#set math.equation(numbering: n => "(4.1)")
   $ \( \( a \, b \) \, \( a' \, b' \) \) mapsto e \( a \, b' \) + e \( b \, a' \) \, $ <vertical:induced-pairing>]
  where $e$ is the elliptic alternating pairing. This is alternating and Tate-equivariant,
    including under complex conjugation, which swaps the coordinates and reverses $e$.
    Its compact cup gives a graded skew pairing of shift $- 3$. Split-coordinate local conditions are isotropic.
    Unramified conditions have the residue cup nullhomotopy, and contractible local conditions may be replaced by
    zero. At a newly allowed discriminant place the Tate module is unramified over $K$;
    quadratic inertia on the induced coefficient swaps the two coordinates.
    Its invariants form the graph of a character unit. Restriction to this graph has the same residue
    nullhomotopy, since the residue group has cohomological dimension one and the quadratic index is invertible.
    The real Tate terms are zero.
  Graded cup commutativity, the cone cup, and their homotopies are identities at finite $p$-power precision.
    Transfer them by Lemma 10. Antisymmetrization is allowed because $2$ is a unit.
    On a minimal two-term model the resulting perfect pairing between degrees one and two identifies the
    differential with an alternating matrix: if $P$ denotes the degree-three pairing,
    its chain identity gives $P \( x \, d y \) = P \( d x \, y \) = - P \( y \, d x \)$.
    The residual and generic nullities of an alternating matrix have the same parity.
    Generic acyclicity therefore gives even residual nullity.
  This also explains the precise extension of the conjugate Bockstein argument in [24] Lemma 12.1 and Corollary
    12.2. No characteristic-zero division is used in transferring the pairing to the residual field.
    For the later characteristic-zero localizations the same calculation applies with the constant-inertia
    unramified comparisons of Section 3; their nullhomotopies are again the residue ones. ◻
]

=== 4.3 A new tame direction and its lifting obstruction <a-new-tame-direction-and-its-lifting-obstruction>

Adjoin a new split tame prime sequence with logarithm $lambda$.
  Require $lambda$ to vanish at all old places, including the old moving places, at every stage.
  This is achieved by imposing sufficient radical precision on their ideal relations.
  Require also that the old artificial character on its limiting Frobenius $gamma$ have a nonzero exponent.
  When the new variable is set to zero, its local complex is then acyclic over $k_r$;
  unramified inflation identifies the enlarged specialization with the old diagram.

These requirements are compatible with prescribed old evaluations.
  Start with an element fixing all radicals from the base and having the Tate and fixed-character conditions of
  Lemma 22. Adjust the old scalar exponents by old moving-prime inertia.
  Such inertia is trivial on the full Tate module, on the fixed splitting fields and characters,
  and on the true anticyclotomic character. To make an adjustment fix all radicals too,
  multiply an inertia element by its conjugate under an element over the base acting by $- 1$ on $mu_(p^oo)$.
  The radical translations cancel whereas the old abelian character exponents double.
  This factor of two is invertible. Existence of the conjugating element follows from the splitting of $p$ in the
  fixed fields. Make these adjustments term by term, retaining the finite evaluation tables.

#thm([Lemma 4.5.])[
  (Necessary first-order lift test).  #emph[Let $x$ be an old strict class and $d$ a class in its paired opposite
    space. Choose a primitive $u$ of their scalar cup, $d u = x union d$.
    For whole spaces of such classes, fix cochain representatives on bases,
    choose the primitives on pairs of basis elements, and extend these choices bilinearly.
    Suppose $x$ lifts in the new direction, with derivative satisfying $d x_1 = -
    lambda union x$ in the chosen character convention. Put
$ A = \( M_x \( gamma \) - 1 \)^(- 1) x \( gamma \) \, $

 where $M_x$ is the coefficient representation of $x$. Then the Frobenius evaluation $z_gamma$ of $u -
   A union d$ vanishes, up to a common nonzero sign or coordinate factor.
   Over $K$ the necessary equation is its difference with the conjugate evaluation,
   since the conjugate tame logarithm has the opposite sign.
   The test is linear in the new direction and bilinear in $x \, d$,
   and is valid over $k_r$ as well as over the characteristic-zero field tests.]
] <vertical:lift-test>

#proof[
  The primitive exists by Lemma 24. At each $p$-place one of the paired classes is strict,
    with the specified local nullhomotopy; away from $p$ the residual local complexes are acyclic.
    At the later horizontal tests the paired unramified cups instead vanish through the residue complex of
    cohomological dimension one. Thus the cup is locally zero.
    Apply the arithmetic sum of local invariants to the degree-two cochain
  #[#set math.equation(numbering: n => "(4.2)")
   $ x_1 union d - lambda union u \, $ <vertical:primitive-cup>]
  with the simultaneous sign convention making it closed. At old places $lambda$ is zero and the local condition
    removes the remaining cup. At the new place $x \, d \, u$ are unramified.
    The Frobenius-minus-one operator is invertible, and $A$ trivializes $x$ in the residue complex.
    Subtracting this coboundary leaves the unramified scalar cochain $u - A union d$.
    Cup with the tame direction has invariant equal, up to sign, to its Frobenius value.
    Here the Frobenius fixes the $p$-power roots of unity, and the direction is normalized by the power-residue
    exponent in the compatible root basis. The mixed residue–inertia cup is therefore the usual local reciprocity
    pairing. Over $K$ the two places give the indicated difference.
    If several new directions are combined, the logarithm of one is unramified at the other new places and gives
    no additional mixed contribution.
  We verify the residual interpretation explicitly. Mark the old global cochain inclusions and their values on the
    Frobenius sequences, then use the inflation homotopies in adjoining the new primes.
    Their restrictions to new inertia are zero, and the induced residue representatives have the Frobenius values
    just prescribed. The invertible residue operator removes their degree-one cohomology,
    leaving exactly the scalar residue cochain above. Mark its root basis and the mixed cup map too.
    All the coboundary corrections, restriction homotopies, and the compact invariant equation are finite matrix
    identities from actual arithmetic diagrams.
  To use classes over $k_r$, clear their finitely many denominators in $bb(F)_p \[ \[ upright(bold(u)) \] \]$,
    including those in the solution for $u$ and in the inverse residue operator.
    The resulting equations hold in the corresponding localized finite free models.
    Any equation which holds only after that localization becomes an equation over
    $bb(F)_p \[ \[ upright(bold(u)) \] \]$ after multiplication by one more common nonzero parameter denominator.
    Now use the Artin rings $A_b = bb(F)_p \[ \[ upright(bold(u)) \] \] \/ \( upright(bold(u)) \)^b$,
    with the first-order new variables adjoined as needed. The prime $p$ is zero throughout this residual
    calculation. The cochain inclusions and homotopies identify its equations with the corresponding actual stage
    arithmetic identities over $A_b$; no lift of an arbitrary residual solution to $bb(Z) \/ p^n$ is asserted.
    Passing to the limit in $b$ and then inverting the same nonzero parameter denominators proves the stated
    equation over $k_r$. This does not divide by $p$. It also shows that further field extensions preserve the
    test. For characteristic-zero field points one may instead clear fixed scalar denominators and increase the
    arithmetic precision, as in Lemma 10. Thus the primitive computation applies with its residual arithmetic
    identities established explicitly. ◻
]

=== 4.4 Spanning the obstruction matrices <spanning-the-obstruction-matrices>

Choose bases $x_1 \, dots.h \, x_s$ of a strict space and $d_1 \, dots.h \,
  d_(s + a)$ of the paired opposite space in the rational case, or $d_1 \, dots.h \, d_s$ in the imaginary case.
  For a new direction use the fixed pairwise primitives $u_(i j)$ with $d u_(i j) = x_i union d_j$,
  extended bilinearly as above. Its #emph[necessary lift matrix] at Frobenius $gamma$ has $\( i \, j \)$-entry
  $z_gamma \( x_i \, d_j \)$ from Lemma 26, or the conjugate difference there over $K$.
  A lifted class with row of coefficients $alpha$ must satisfy $alpha Z_gamma = 0$.
  Thus a matrix with zero left kernel excludes every nonzero lift in that direction.

#thm([Lemma 4.6.])[
  (Obstruction span).  #emph[For the residual tests above, finitely many new tame directions have necessary lift
    matrices whose linear span contains every $s times \( s + a \)$ matrix over $k_r$ in the rational problem,
    every $s times s$ matrix for a reducible constituent in the imaginary problem, and every alternating $s times
    s$ matrix for an absolutely simple plane in the imaginary problem.
    Previously prescribed Tate actions, radical data, old character actions,
    and acyclicity of the new local complexes can all be retained.]
] <vertical:obstruction-span>

#proof[
  Let $J$ be the termwise joint kernel of the full Tate and old character actions,
    including $L$ and the fixed splitting data over $K$. It is harmless to retain the fixed character data as
    well. On $J$ the evaluations of $x \, d$ are additive. They detect their classes:
    old inertia at one moving prime gives a central element in the quotient image whose scalar difference from $1$
    is invertible. Apply Lemma 12. Independent classes in a simple representation have evaluations spanning their
    full tuple, jointly for nonisomorphic representations.
  In the rational case the opposite representations are already nonisomorphic on old inertia,
    which sees $chi$ and $chi^(- 1)$. In the imaginary reducible case include the conjugate evaluations.
    The resulting four representations are distinct: the elliptic characters are distinct,
    and opposite infinite scalar twists cannot be identified.
    For an absolutely simple plane take $d_j = x_j^c$ under conjugate duality.
    The two oppositely twisted planes are nonisomorphic for the same inertia reason.
  Multiply a chosen Frobenius representative by a commutator $\[ v \, w' \]$ with $v \, w' in J$.
    Since the full Tate action is fixed, both elements fix the cyclotomic tower.
    Their radical actions are translations in an abelian group.
    The commutator therefore fixes all radicals, as well as the Tate and old character data.
    The additive evaluations of $x \, d$ on the commutator are zero,
    so the local correction involving $A$ is unchanged. The primitive equation changes its scalar evaluation by
  #[#set math.equation(numbering: n => "(4.3)")
   $ - e \( x \( v \) \, d \( w' \) \) + e \( x \( w' \) \, d \( v \) \) \, $ <vertical:commutator-change>]
  up to the fixed sign convention.
  Joint spanning and bilinearity now give elementary rectangular matrices in the rational problem and elementary
    square matrices in a character problem. For a plane over $K$, take the conjugate difference.
    With $d_j = x_j^c$, the transposed comparison has the opposite sign by Weil skew-symmetry;
    hence the changes span $E_(i j) - E_(j i)$, the elementary alternating matrices.
    This uses linear span over $k_r$, not an assertion that every vector in that span is a single Galois
    evaluation. Only finitely many commutators are needed to span the finite matrix spaces.
    Differences from the initial Frobenius test belong to the span of the resulting directions,
    so their linear span has the asserted size.
  Realize the required Frobenius representatives by Chebotarev at increasing finite precision,
    preserving the radical and evaluation tables of Lemma 26.
    Normalize all root and tangent bases in the same diagrams.
    A common nonzero sign, or a nonzero scalar multiplying an entire tangent direction, does not change its span.
    For conjugate places use the transported marking, so the two entries are compared with the same normalization. ◻
]

#proof[
  If a tested strict space is zero no new direction is needed.
    Otherwise Lemma 27 supplies a linear combination of directions whose necessary lift test has zero left kernel.
    In the plane case this uses Lemma 25: $s$ is even and an alternating matrix with $s \/
    2$ invertible skew blocks is nonsingular.
  Work in the enlarged residual ring, localized where the old variables have fraction field $k_r$ and all new
    variables are zero. The new local complexes are acyclic at this point,
    so the specialized global diagrams are the old ones. Cancel their unit differential blocks.
    In the remaining minimal complex, the derivative of a lifted degree-one vector in a new tangent direction is
    the first-order differential. A vector in its kernel would pass every necessary cup test.
    The chosen test has zero kernel, so this first-order differential has full column rank in that direction.
    Some maximal minor of the actual differential has a nonzero initial term.
    It is therefore nonzero over the enlarged generic residual field, which kills that strict space.
  Take the union of the finite direction lists for all simple constituents, both sides, and both imaginary curves.
    Each test retains its own slice, since every new local prime was chosen Frobenius-acyclic there.
    Long exact sequences for the residual composition filtration then give the desired vanishing for the original
    representation, including nonsplit extensions.
  Over $bb(Q)$ the dual strict vanishing gives $H^2 = 0$ for the primal full complex.
    Its Euler characteristic is $- 1$, so it has one residual degree-one line.
    Minimality first at $\( p \, t \)$ and then at $\( p \)$ gives a free line over $R_(\( p \))$.
    Over $K$, one-sided $H^1$ and $H^2$ vanish at the generic residual test.
    The square determinant consequently has nonzero reduction modulo $\( p \, t \)$,
    on both sides and for the companion. This is (1). ◻
]

=== 4.5 Further directions and characteristic-zero tests <further-directions-and-characteristic-zero-tests>

The same construction will be needed when removing horizontal divisors.
  We record what can be retained, so that the later commutative algebra need not repeat the arithmetic choices.

Here a #emph[horizontal field test] means the derived fiber over $k \( frak(P) \) =
  "Frac" \( R \/ frak(P) \)$ for a height-one prime $frak(P)$ of $R =
  bb(Z)_p \[ \[ t \, upright(bold(u)) \] \]$ with $p in.not frak(P)$.
  Its local testing ring is the DVR $R_(frak(P))$. This field need not be a finite extension of $bb(Q)_p$.
  The finite-extension interior points of Lemma 20 are points of the divisor at which finitely many specified
  denominators remain nonzero. Comparisons then specialize from the localization of $R \/
  frak(P)$ at those denominators, not from its entire fraction field.
  In an enlargement by new variables $upright(bold(v))$, retaining an old test means localization at
  $\( frak(P) \, upright(bold(v)) \)$ and specialization $upright(bold(v)) = 0$ before its field fiber is taken.

#thm([Lemma 4.7.])[
  (Preservation under enlargement).  #emph[Property (1)(b) persists when further tame primes are adjoined,
    provided each has a nonzero Frobenius exponent in the preceding artificial variables.
    On setting the new variables to zero, unramified inflation identifies the old diagram,
    with the full new-place singular factors retained. Those factors have nonzero reduction on the residual test.]
] <vertical:enlargement>

#proof[
  At the old residual test the new prime has unramified scalar Frobenius involving an old variable with nonzero
    exponent. Its Frobenius-minus-one determinants are nonzero;
    the local complex is acyclic over the residual fraction field.
    The localized full-to-unramified triangle multiplies the determinant by a nonzero residual singular factor.
    Hence specialization of each enlarged determinant remains nonzero at the old residual test,
    which proves the assertion. ◻
]

#thm([Lemma 4.8.])[
  (Directions at horizontal tests).  #emph[Fix finitely many characteristic-zero height-one field tests of a tuple
    satisfying (1)(b), with at least two old artificial variables.
    One may adjoin finitely many tame directions, locally zero on all old support,
    so that the new prime complexes are acyclic at all these fields and the necessary lift tests of Lemma 26
    retain their commutator-spanning property. The construction is compatible with further field extension and
    with the primitive unramified conditions at fixed non-$p$ places.]
] <vertical:horizontal-directions>

#proof[
  At a height-one test at least one old inertia scalar has infinite order:
    two independent variables cannot both specialize to roots of unity on a single prime divisor.
    Adjust the old Frobenius exponents of a new prime as above.
    On a line in an infinite-order coordinate, an elliptic eigenvalue exception excludes only boundedly many
    integer choices. A sufficiently large finite grid in all the old exponents therefore avoids the exceptions for
    the finite list of fields and both representations. Keep the nonzero-exponent requirement,
    all Tate and fixed character conditions, and the radical conditions making the new logarithms zero at old
    places. This gives simultaneous Frobenius acyclicity.
  Exact orthogonality at the old unramified places uses Lemma 11.
    Their cup contributions and first-order contributions vanish through its residue nullhomotopy,
    since the new logarithm is locally zero. Scalar localization is obtained from the constant model and Lemma 24;
    it remains injective after these characteristic-zero specializations.
    The marked cup and primitive proof now gives the lift identity at each field.
    On the joint kernel, evaluations are detected by the central old inertia scalar,
    and the commutator formula (4.3) preserves all the imposed data.
    For any finite list of fields take the union of their direction lists.
    Each retains its own spanning slice; it is unnecessary to prescribe independent matrices at all fields with a
    single prime. Clearing the finitely many denominators and slowing precision preserves the comparison
    identities, also after field extension. ◻
]

The vertical part of the comparison is now fixed integrally.
  The later sections may test horizontal divisibility after inversion of $p$ while retaining the nonzero residual
  determinants in (1).

== 5 The single-curve determinant and its central value <sec:single>

Fix an odd prime $p$. In this section $E \/ bb(Q)$ is non-CM and has analytic rank zero or one.
  The purpose is to prove $X \( E \) gt.eq 0$, where

$ X \( E \) = v_p \( Q_E \) - v_p #scale(x: 120%, y: 120%)[\(] \# "Sha" \( E \/ bb(Q) \)
  #scale(x: 120%, y: 120%)[\)] . $

The rank and finiteness conclusions of Theorem 4 are in force.
  We first construct an integral element of a power-series ring.
  Its value at the trivial character will be computed separately:
  by the dual exponential in rank zero, and by an exact logarithmic comparison in rank one.
  These are different assertions, and both are needed for the inequality.

We use the inverse determinant and the local-condition conventions of Section 3.
  In particular, if a two-term acyclic complex in degrees $1 \, 2$ has determinant of differential $a$,
  then the coordinate of its canonical rational trivialization has valuation $- v_p \( a \)$.
  This sign will account for the local Euler factors below.

=== 5.1 Integral Siegel classes and their period coordinate <single:siegel>

Let $N$ be the conductor of $E$ and $f$ its normalized newform.
  We construct the integral classes needed for the single-curve comparison and determine their exact
  dual-exponential coordinate. The normalization follows the construction in [24] Section 4;
  the coefficient prime in that source is two, so we verify the changes in the construction at an odd prime explicitly.

Let $E_0$ be the optimal elliptic quotient of $J_1 \( N \)$,
  and let $C_(upright("cusp")) subset E_0 \( overline(bb(Q)) \)$ be generated by geometric cusp differences.
  Manin–Drinfeld makes this a finite Galois-stable subgroup.
  Replace the curve within its isogeny class by $E = E_0 \/ C_(upright("cusp"))$;
  Proposition 5 preserves $X \( E \)$. The Abel map, followed by this quotient,
  gives $pi : \( X_1 \( N \) \, D_N \) arrow.r \( E \, O \)$, where $D_N$ is the cusp set;
  the map is independent of the base cusp used for the Abel map.
  Put $T = H^1 \( overline(E) \, bb(Z)_p \) \( 1 \) = T_p E$, using the principal pairing, and $V = T ⊗ bb(Q)_p$.
  For $A = p^k$, $k gt.eq 0$, put $L_0 = N A$ and let $Pi : \( X_1 \( L_0 \) \, D_(L_0) \)
  arrow.r \( E \, O \)$ be the $A$-degeneracy followed by $pi$.
  At the mark $1 \/ L_0$ the degeneracy is $tau mapsto A tau$. Thus, for a minimal differential $omega$,

$ Pi^(*) omega = c_F F thin frac(d q, q) \, wide F \( tau \) = A f \( A tau \) \, wide q = e^(2 pi i tau) \, quad
  c_F in bb(Q)^times . $

Let $a$ be the primitive generator of $H_1 \( E \( bb(C) \) \, bb(Z) \)^(G_(bb(R)))$ oriented by $Omega_0 =
  integral_a omega > 0$. For $xi in upright("SL")_2 \( bb(Z) \)$,
  define $delta_xi in H^1 \( E \( bb(C) \) \, bb(Z) \)$ as the Poincare dual of $Pi_(*) xi { 0 \, oo }$,
  with convention $integral_E omega and delta_xi = integral_(Pi_(*) xi { 0 \, oo }) omega$.

#thm([Lemma 5.1.])[
  (The relative lattice).  #emph[Relative pullback and Poincare duality give an integral Galois map
$ H^1 \( overline(Y_1 \( L_0 \)) \, bb(Z)_p \) \( 1 \) arrow.r T . $

 For $A = 1$, an integral combination $delta = sum_xi n_xi
   delta_xi$ of finitely many symbols satisfies $delta \( a \) = 1$.]
] <single:relative-lattice>

#proof[
  Write $E_0 \( bb(C) \) = bb(C) \/ Lambda_0$. The connected optimal kernel makes the map on integral homology
    onto $Lambda_0$. Quotienting by $C_(upright("cusp"))$ replaces $Lambda_0$ by the lattice generated by it and
    lifts of the cusp images. Relative paths between cusps supply exactly these additional generators.
    Consequently $H_1 \( X_1 \( N \) \( bb(C) \) \, D_N \; bb(Z) \) arrow.r
    H_1 \( E \( bb(C) \) \, bb(Z) \)$ is onto. The Farey triangulation generates the relative group by the Manin
    edges $xi { 0 \, oo }$. The invariant sublattice is saturated, so $a$ is primitive;
    unimodularity of the intersection form now gives the asserted integral combination.
    Pullback by the map of pairs is integral, and relative Poincare duality gives the displayed etale map.
    This is the Betti and relative-cohomology argument of [24] Section 4, “The integral relative lattice”,
    before any choice of coefficient prime; no Hecke projector is involved. ◻
]

We use two level patterns, always with $v_p \( M \) gt.eq 6$.
  In square order, $n_1 = n_2 = M$, $L_0 divides M$, and the row $l = \( l_1 \, l_2 \)$ is $\( 0 \, 1 \) xi$.
  In rectangular order put $b = N \/ p^(v_p \( N \))$, require $\( b \, M \) =
  1$ and $p^(v_p \( L_0 \)) divides M$, and take

$ n_1 = b_1 M \, wide n_2 = b M \, wide l = \( N s \, 1 \) = \( 0 \, 1 \) xi \, $

where $b_1 divides b$ is a product of complete prime powers dividing $b$. The unfilled pattern means $b_1 = 1$.
  The curve $Y \( n_1 \, n_2 \)$ parametrizes elliptic curves with independent points $P \, Q$ of orders $n_1 \,
  n_2$; independence means that they embed $bb(Z) \/ n_1 xor bb(Z) \/ n_2$.
  The maps to the marked curve and the cyclotomic field are specified by

#[#set math.equation(numbering: n => "(5.1)")
 $ C = frac(l_1 n_1, L_0) P + frac(l_2 n_2, L_0) Q \, wide eta_M =
   e_M \( \( n_1 \/ M \) P \, \( n_2 \/ M \) Q \) . $ <single:mark-root>]

The coefficients of $C$ are integers in both patterns; $C$ has order $L_0$, and $eta_M$ is primitive of order $M$.
  Fix compatible roots in the algebraic, complex, and $p$-adic realizations,
  with complex root $e^(2 pi i \/ m)$ at order $m$.

Choose $c \, d > 1$ prime to $6 p n_2$, with $c \, d equiv 1 med \( mod med L_0 \)$.
  On the universal elliptic curve $cal(E)$ let $zws_c theta_(cal(E))$ be Kato’s normalized function of divisor
  $c^2 \( 0 \) - cal(E) \[ c \]$, and put $zws_c g_P = P^(*) zws_c theta_(cal(E))$, $zws_d g_Q =
  Q^(*) zws_d theta_(cal(E))$. Its norm under $\[ s \]$ is itself if $\( s \, c \) = 1$ [15] Sections 1–2.
  At precision $p^j$, replace the orders by $p^j n_1 \, p^j n_2$, and let $P' \,
  Q'$ range over their independent division lifts of $P \, Q$. Take the unnormalized trace of the Kummer cup

#[#set math.equation(numbering: n => "(5.2)")
 $ \( zws_c g_(P') \) union \( zws_d g_(Q') \) ⊗ e_(p^j) \( n_1 P' \, n_2 Q' \)^or . $ <single:K1>]

Here the dual basis sends the displayed primitive root to $1$, so the coefficient is $bb(Z) \/ p^j \( 1 \)$.
  Apply the arithmetic edge map, trace along (5.1), and push to $T \/ p^j$ by Lemma 30.
  Passage to the inverse limit defines a class in
  $H^1 \( G_(bb(Q) \, S) \, T ⊗ bb(Z)_p \[ "Gal" \( bb(Q) \( mu_M \) \/ bb(Q) \) \] \)$,
  for $S$ containing the primes of $p n_2$ and infinity. For a finite character $nu$ of this Galois group,
  send the basis vector at $sigma$ to $nu \( sigma \)$; write $z_nu$ for the result with coefficients in $T ⊗
  bb(Z)_p \[ nu \]$. All traces, including this character push, are unnormalized.

#thm([Proposition 5.2.])[
  (Integrality and traces).  #emph[The classes just constructed are integral away from $p n_2
    oo$ and compatible with division traces and with corestriction as the $p$-part of $M$ grows with $A \, c \,
    d \, xi$ fixed. If $ell divides.not c d n_2 L_0$ is a fresh prime and is adjoined to both orders and the root
    index, the rational norm multiplier is
#[#set math.equation(numbering: n => "(5.3)")
 $ 1 - frac(a_ell \( f \) \[ ell \], ell) + frac(\[ ell \]^2, ell) \, $ <single:good-norm>]

 where $\[ ell \]$ sends the determinant root to its $ell$-th power.
   For $q_0^a parallel b$, $q_0 divides.not b_1$, filling $q_0^a$ into the first row gives,
   at a finite even character $nu$,
#[#set math.equation(numbering: n => "(5.4)")
 $ z_(upright("filled")) = \( 1 - a_(q_0) \( f \) nu \( q_0 \) \/ q_0 \) z_(upright("before")) . $ <single:bad-row>]

 The trace maps themselves are integral in both assertions.]
] <single:siegel-traces>

#proof[
  Further $p$-division gives a Cartesian product of the two lift sets:
    independence is automatic since the old tuple is already a basis at $p$.
    At the old precision the inverse-root twists agree. Base change and the projection formula turn the trace of
    the cup into the cup of the traces, and distribution recovers the old class.
    The mark and lower root also agree when the base $p$-level grows.
    The functions and their inverses are integral away from the level.
    Indeed horizontal valuations follow from their divisors; on a smooth full-level model every geometric fiber
    component meets a cusp, where the Tate leading terms are signs, roots of unity, and powers of $1 -
    zeta$ for nontrivial level roots. These are units away from the level.
    This also checks quotients of level after pullback. The relative open curve has lisse geometric cohomology
    away from this support, vanishing above degree one. Its arithmetic edge map lands in
    $H^1 \( G_(bb(Q) \, S) \, H^1 \( overline(Y \( n_1 \, n_2 \)) \, bb(Z) \/ p^j \) \( 1 \) \)$.
    Edge maps commute with traces and maps of pairs. Finiteness in degree zero gives the Mittag–Leffler property
    needed for compact passage; the subsequent lattice and coefficient maps are integral.
  At $ell$, start with the Cartesian division sets, subtract the tuples whose $ell$-parts lie in a common line $I
    subset cal(E) \[ ell \]$, and add back $ell$ times the double-prime-to-$ell$ lift.
    The zero pair was subtracted $ell + 1$ times, which explains this multiplicity.
    Distribution on $cal(E) \/ I$ identifies the line sums with the good Hecke correspondence.
    Quotient isogenies raise the Weil roots to $ell$, giving $\[ ell \]$ and twist scalar $ell^(- 1)$;
    the relative elliptic push has Hecke eigenvalue $a_ell \( f \)$.
    This last assertion holds for relative maps because pullback has zero endpoint-function coordinates and the
    equality of eigenforms also holds on path integrals. The added-back multiplication isogeny raises the roots to
    $ell^2$; its scalar $ell^(- 2)$, multiplied by $ell$, gives the last term of (5.3).
  For row filling, fix $Q$. A discarded $q_0^a$-division lift of $P$ has its $\[ q_0^(a - 1) \]$-image in the
    order-$q_0$ line $I_Q$. For $rho : cal(E) arrow.r cal(E) \/ I_Q$,
    these lifts are precisely the preimages under $rho \[ q_0^(a - 1) \]$ of the prime-to-$q_0$ point $tilde(P)$
    satisfying $rho^or tilde(P) = P$. Express the other unit by distribution over $rho^or tilde(Q) = Q$.
    The points $tilde(Q)$ have order $n_2$, and their order-$q_0$ lines differ from $ker rho^or$.
    In reverse, the discarded sum is indexed by all lines other than the line of the source mark,
    since $l = \( N s \, 1 \)$. Its branches at mark $1 \/ L_0$ are $tau mapsto \( tau + i \) \/ q_0$, $i med
    mod med q_0$. Thus it is $U_(q_0)$, acting on $A f \( A tau \)$ by $a_(q_0) \( f \)$ because $\( A \, q_0 \) =
    1$. Root translation and inverse twist contribute $nu \( q_0 \) \/ q_0$.
    This proves (5.4), including $q_0 = 2$. The argument reproduces the geometric correspondences of [24]
    Section 4, “Good-prime norms and rectangular filling”; every denominator displayed here is a unit at $p$. ◻
]

We next fix the rational differential coordinate, retaining the absolute normalization needed for divisibility.
  For a nonzero torsion label $P = \[ x tau + y \]$, let $E_P$ be the algebraic weight-one form

$ E_P = - frac(1, 2 pi i) sum_(\( m \, n \) in \( x \, y \) + bb(Z)^2)
  frac(\( "Im" tau \)^w, \( m tau + n \) \| m tau + n \|^(2 w))\|_(w = 0) \, $

where the value is obtained by regular continuation.

#thm([Lemma 5.3.])[
  (Full-level calibration).  #emph[In square order, before projection to the elliptic curve,
    the dual exponential of (5.2) is
#[#set math.equation(numbering: n => "(5.5)")
 $ plus.minus M^(- 2) \( c^2 E_P - c E_(c P) \) \( d^2 E_Q - d E_(d Q) \) thin frac(d q, q) .
   $ <single:full-differential>]

 The sign is determined by cup, pairing, and orientation conventions and is common to the determinant components.]
] <single:kato-calibration>

#proof[
  Initially impose $c \, d equiv 1 med \( mod med M \)$. Apply [15] Theorem 9.5 with $k = 2$, $r = r' = 1$,
    and equal level orders $M \, M$. The prime-support containment is automatic,
    the range conditions are satisfied, and $p divides M$ selects the branch without an additional Euler operator.
    The symmetric power has degree zero. Its negative Tate moment is exactly the inverse determinant
    $e_(p^j) \( M P' \, M Q' \)^or$ on the basis coset of division tuples.
    The weight-one shifted and Fourier-dual forms agree under the fixed conventions [15] Proposition 3.11(1) and
    Section 4.2. The theorem therefore gives proportionality to the two brackets in (5.5).
    We determine the scalar by residues.
  Put $Theta \( t \, q \) = \( 1 - t \) product_(h gt.eq 1) \( 1 - q^h t \) \( 1 - q^h \/ t \)$.
    The normalized Tate function is
  $ zws_c theta \( t \) = \( - 1 \)^(\( c - 1 \) \/ 2) q^(\( c^2 - 1 \) \/ 12) t^(- c \( c - 1 \) \/ 2)
    frac(Theta \( t \, q \)^(c^2), Theta \( t^c \, q \)) . $
  The relation $Theta \( q t \, q \) = - t^(- 1) Theta \( t \, q \)$ verifies periodicity and the divisor;
    multiplication over $\[ s \]$-preimages verifies norm invariance for $\( s \, c \) = 1$.
    These norms fix the constant uniquely: the norms under $\[ 2 \]$ and $\[ 3 \]$ force its third and eighth
    powers to be one. For $0 < x < 1$, $c x in.not bb(Z)$, put
  $ J_c \( x \) = c floor.l c x floor.r - frac(c \( c - 1 \), 2) = c^2 B_1 \( x \) - c B_1 \( { c x } \) \, wide
    B_1 \( x \) = x - 1 / 2 . $
  At $t = q^x zeta$ the leading coefficient is $plus.minus zeta^(J_c \( x \))$,
    and the order is $x J_c \( x \) + \( c^2 - 1 \) \/ 12 - floor.l c x floor.r \( floor.l c x floor.r + 1 \) \/
    2$. The last two terms are integers, since $\( c \, 6 \) = 1$.
  On a determinant component choose the cusp $P = q^(1 \/ M)$, $Q = q^(1 \/ M) zeta_M^u$, with $\( u \, M \) = 1$,
    over $K_0 = bb(Q)_p \( mu_M \)$. Set $M_j = p^j M$ and $K_j = K_0 \( mu_(M_j) \)$.
    Each pair $a_1 \, a_2 in \[ 0 \, M_j \) ∩ \( 1 + M bb(Z) \)$ gives a cusp orbit represented by $P' =
    q^(a_1 \/ M_j)$, $Q' = q^(a_2 \/ M_j) zeta_(M_j)^u$. Translation by the old width eliminates the first root
    index; determinant primitivity makes cyclotomic Galois act freely on the remaining indices.
    There are $p^(2 j)$ such orbits, residue degree $p^j$, and width ratio $M_j \/ M = p^j$,
    accounting for $p^(4 j)$ division tuples. Prime-to-$p$ roots contribute only fixed data.
    With $x = a_1 \/ M_j$, $y = a_2 \/ M_j$, the tame symbol has root exponent $h equiv
    plus.minus u J_d \( y \) a_1 J_c \( x \) med \( mod med p^j \)$.
    All signs have zero Kummer class because $p$ is odd. The inverse twist uses $zeta_(p^j)^(plus.minus a_1 u)$,
    so the twisted residue on $G_(K_j)$ is $plus.minus J_c \( x \) J_d \( y \) \( chi_(upright("cy")) - 1 \) \/
    M_j med \( mod med p^j \)$. Abelian transfer and the exponential series give
  $ frac(chi_(upright("cy"))^(p^j) - 1, p^j M) equiv frac(log chi_(upright("cy")), M) med \( mod med p^j \) . $
  Indeed $log chi_(upright("cy")) in p^(v_p \( M \)) bb(Z)_p$,
    and every term of degree at least two has the required valuation.
    Residue trace sums field transfers without a ramification multiplier.
    Bernoulli distribution gives $sum_(a_i) J_c \( a_i \/ M_j \) = J_c \( 1 \/ M \)$, and likewise for $d$;
    hence the limiting residue is $plus.minus J_c \( 1 \/ M \) J_d \( 1 \/ M \) log chi_(upright("cy")) \/ M$.
    The dual exponential sends $log chi_(upright("cy"))$ to $plus.minus 1$:
    pair with Kummer classes of exponential units and use local reciprocity,
    with field trace in the de Rham pairing. The constant term of $E_P$ is $- B_1 \( x \)$,
    so the two brackets have nonzero constant terms $- J_c \( 1 \/ M \)$, $-
    J_d \( 1 \/ M \)$ for the initial choices. Since $d q \/ q$ has residue $M$, the scalar is $plus.minus M^(- 2)$.
  For arbitrary permitted smoothings use $\( c_0^2 - \[ c_0 \]^(*) \) zws_c theta = \( c^2 - \[ c \]^(*) \)
    zws_(c_0) theta$. Changing a row by $c$ changes its inverse-root basis by $c^(- 1)$,
    so the induced differential operator is $c^2 - c thin upright("mult")_c^(*)$.
    Choose $c_0 equiv 1 med \( mod med M \)$, cancel $c_0^2 - c_0$ rationally, and repeat on the other row.
    This cancellation asserts a rational identity only; it introduces no claim of integral divisibility. ◻
]

#thm([Proposition 5.4.])[
  (The period coordinate).  #emph[In square or unfilled rectangular order,
    for every finite even character $nu$ of conductor dividing $M$,
    the coordinate of $exp^(*) \( z_nu \)$ in $omega$, in compatible field realizations, is
#[#set math.equation(numbering: n => "(2)")
 $ plus.minus Delta_nu frac(L^(\( M \)) \( f \, nu \, 1 \), Omega_0) delta_xi \( a \) \, wide
   Delta_nu = \( c^2 - c nu \( c \)^(- 1) \) \( d^2 - d nu \( d \)^(- 1) \) . $ <eq:source-2>]

 The superscript omits all primes dividing $M$, and the sign is common across symbols.
   In square order with $A = 1$, an integral combination has $delta \( a \) = 1$.
   In rectangular order, some choice of $A = p^k$ and $xi$ with lower row $\( N s \, 1 \)$ has $delta_xi \( a \)
   eq.not 0$.]
] <single:period-law>

#proof[
  Apply the coefficient-prime-independent analytic trace identity of [24] Section 4,
    equation (K5) and proof of “The period formula” to (5.5).
    Its inputs are square order, $L_0 divides M$, mark $1 \/ L_0$, even $nu$, and $c \, d equiv
    1 med \( mod med L_0 \)$, all imposed here. The two rescaled weight-one lattice sums cancel $M^(- 2)$.
    Row reindexing preserves the mark and gives $Delta_nu$; Hecke unfolding has indices prime to $M$ and gives
    $L^(\( M \)) \( f \, nu \, 1 \)$. The relative de Rham push has zero cusp-function coordinates,
    and its pairing with $overline(omega)$ is $plus.minus 2 i "Im" \( integral_(Pi_(*) xi { 0 \, oo }) omega \)
    Delta_nu L^(\( M \)) \( f \, nu \, 1 \)$. Writing $delta_xi = s_0 omega +
    overline(s_0) overline(omega)$ gives $s_0 + overline(s_0) = delta_xi \( a \) \/ Omega_0$, which proves (2).
    These are algebraic differentials and algebraic trace and push maps;
    the same identity therefore gives the specified $p$-adic coordinate.
    Local duality uses field trace, with no character-orbit average.
    For rectangular order fill every missing row prime. Each factor $1 -
    a_(q_0) \( f \) nu \( q_0 \) \/ q_0$ is nonzero since $\| a_(q_0) \( f \) \| lt.eq 1$,
    and is precisely the additional omitted Euler factor at $q_0$.
    Canceling these factors rationally proves (2) before filling.
  The square assertion follows from Lemma 30. For the rectangular assertion take $xi$ with upper row
    $\( 1 \, 0 \)$. The Fricke relation sends the degenerated path from $0$ to $p^k \/ \( N s \)$ to the path from
    $oo$ to $- s \/ p^k$, up to sign. Rohrlich’s theorem in [15] Theorem 13.5(2), with prime support ${ p }$,
    gives a primitive odd character of sufficiently high $p$-power conductor with nonzero central twist.
    Odd characters exist even at $p = 3$, by adjoining a fixed odd tame character to deep wild characters.
    Primitive Gauss–Mellin then makes the weighted sum of these path integrals nonzero.
    If they were all real, complex conjugation would identify the integrals at $s$ and $- s$,
    and their sum against an odd character would vanish. Some imaginary part,
    and therefore the corresponding $delta_xi \( a \)$, is nonzero. ◻
]

Finally, rational norm identities can be made integral after one common nonzero multiplier,
  uniformly over the abelian fields used here. By Serre’s open-image theorem [26],
  the commutator image on $T$ contains a fixed deep special-linear congruence subgroup.
  Its invariants in $T ⊗ bb(Q)_p \/ bb(Z)_p$ have bounded exponent.
  The exact sequence for $T subset T ⊗ bb(Q)_p$ consequently bounds the torsion exponent of $H^1 \( F \, T \)$
  uniformly for these abelian fields $F$. Multiplying a rationally zero norm error by this bound kills it.

=== 5.2 The determinant to be made integral <the-determinant-to-be-made-integral>

Let $S$ contain $p \, oo$ and every bad prime of $E$, and fix the smoothing integers before choosing moving
  primes. Their prime divisors are outside the finite support used for the square classes.
  Take the rational auxiliary tuple of Section 4, with one tame variable for each moving prime and a genuine
  cyclotomic variable $t$. Put

$ R = bb(Z)_p \[ \[ t \, u_1 \, dots.h \, u_k \] \] \, wide M_R = T ⊗_(bb(Z)_p) R \( chi \) . $

Here $chi$ takes the chosen generators to $1 + t$ and $1 + u_j$.
  The complex $G$ is the limiting unrestricted global complex, with the moving primes allowed in its support.
  We retain the finite-stage complexes with their actual cyclotomic tower,
  as well as their reductions modulo every fixed Artin precision.
  Let $z in H^1 \( G \)$ be the smoothed square class with symbol evaluation one and degeneracy $A = 1$.
  At each stage choose the square order $M$ with prime support exactly $S_f$ together with the moving primes,
  and divisible by the required fixed orders. Thus its allowed ramification support and its omitted Euler factors agree.

For a fixed $q in S_f \\ { p }$, define

$ D_q = det (1 - frac(chi \( "Frob"_q \) rho_T \( "Frob"_q \), q) thin mid(bar.v) thin V_(I_q)) . $

The subscript denotes inertia coinvariants. Let $P_q$ denote the inverse local $L$-polynomial at $1$,
  with its unramified scalar argument in the orientation of the period formula.
  The two scalar arguments may be inverse to one another; at the trivial character they agree.
  The polynomials are respectively quadratic at good reduction, signed linear at multiplicative reduction,
  and one at additive reduction. Thus they are integral, including when $p$ divides a Tamagawa number. Moreover

$ D_q \( 0 \) = P_q \( 0 \) = L_q \( E \, 1 \)^(- 1) eq.not 0 . $

We also use the smoothing series $Delta$ of (2). Each of $D_q \, P_q \,
  Delta$ remains nonzero modulo $\( p \, u_1 \, dots.h \, u_k \)$:
  the cyclotomic exponents of the positive integers $q \, c \, d$ are nonzero.
  Consequently these factors have no vertical divisor and are regular in $t$.

#thm([Proposition 5.5.])[
  (Integral normalized coordinate).  #emph[The generic cohomology of $G$ is a line in degree one,
    and $z$ is nonzero on that line. If $U_0 in "Frac" R$ is its coordinate in the inverse determinant relative to
    an integral generator, then
#[#set math.equation(numbering: n => "(3)")
 $ U = U_0 / Delta product_(q in S_f \\ { p }) D_q / P_q med in R \\ { 0 } . $ <eq:source-3>]

]
] <single:integral>

The argument adapts the horizontal comparisons and division method of [24] Section 5,
  “Horizontal line switches” and “Removal of the fixed divisors”. The proof has three parts.
  The concentration assertion (1)(a) treats the divisor $\( p \)$.
  At a characteristic-zero divisor, auxiliary Euler-system derivatives compare the coordinate with a coordinate on
  a free line. Finally, rectangular classes remove the divisors of the smoothing and fixed Euler factors.
  The last step is necessary: integrality of the smoothed class alone does not permit division by $Delta$.

=== 5.3 Horizontal line comparisons <horizontal-line-comparisons>

We use the following three settings. In the first, the coefficient ring is the localization of $R$ at a height-one
  prime avoiding $p Delta product_(q eq.not p) D_q P_q$. In the second,
  all tame parameters have been removed and we use the fraction field of the fixed-support cyclotomic ring.
  In the third, at an actual stage, every tame parameter is specialized to a nontrivial finite $p$-power character
  $eta_j$, while $t$ is retained. Write $eta = product_j eta_j$ and $Lambda_eta =
  bb(Z)_p \[ bold(eta) \] \[ \[ t \] \]$. The third setting uses its generic field or a height-one localization
  not above $p$, and imposes unramified conditions at the old non-$p$ places.
  We require that a fixed Frobenius lift at $p$, trivial in the cyclotomic quotient,
  already kill the dual invariants after twisting by $eta$.
  The nonzero exponent vector at $p$ supplies such specializations.

#thm([Lemma 5.6.])[
  (Line comparison for a smoothed system).  #emph[In any of these three settings,
    suppose that the chosen square or rectangular system class $z_(upright("sys"))$ is generically nonzero.
    Then the global complex has a single generic cohomology line in degree one. At each of the indicated DVRs,
#[#set math.equation(numbering: n => "(4)")
 $ d \( G_(upright("test")) \, z_(upright("sys")) \) gt.eq 0 . $ <eq:source-4>]

 In the third setting, $G_(upright("test"))$ denotes the complex with the unramified old local conditions.]
] <single:line>

#proof[
  We verify the local hypotheses before constructing derivatives.
    In the first setting, dual local invariants vanish at a fixed non-$p$ place by the exclusion of $D_q$.
    At a moving place, invariance under inertia first forces $u_j = 0$;
    the remaining Frobenius equation is nonzero on that divisor because the limiting Frobenius has determinant one
    and trace different from two. At $p$, choose an inertia element generating the cyclotomic quotient and a
    Frobenius lift trivial in that quotient. The first invariance equation is regular in $t$;
    the second is independent of $t$ and nonzero, by the fixed-place exponent condition.
    They have no common height-one component. In the second setting,
    nonconstant cyclotomic action gives the same vanishing. In the third,
    the imposed condition at $p$ gives it directly.
  At an old non-$p$ place in the third setting, inertia acts through a constant representation.
    The unramified condition is residue cochains on inertia invariants.
    Its quotient is residue cochains on inertia coinvariants with twist $\( - 1 \)$, in degrees $1 \, 2$.
    Its differential has determinant
  $ D_(q \, eta) =
    det (1 - frac(chi_t \( "Frob"_q \) rho_(V ⊗ eta) \( "Frob"_q \), q) thin mid(bar.v) thin \( V ⊗ eta \)_(I_q)) . $
  This is nonzero and equals one at a moving conductor where $eta$ is ramified.
    The quotient therefore has zero $H^1$ over the DVR itself.
    This assertion is made before passing to its residue field, where the determinant may vanish.
    The conditions include all $H^0$ and omit $H^2$. Unramified cup products factor through residue cohomology,
    so are zero; local duality and the Euler characteristic give exact complementarity,
    including at the residue field. These are precisely the complex conditions needed by Lemma 13.
  Global invariants vanish by the non-CM open-image argument [26]. We spell out its use on the limiting diagrams.
    In the product of the stage absolute groups, take the joint kernel of the Tate action and the abelian and
    radical data used in the characters. The quotient contains arbitrary sequences from a fixed deep principal
    subgroup of $"SL"_2 \( bb(Z)_p \)$, acting trivially on the latter data.
    Indeed those data have bounded derived length, whereas repeated Lie brackets retain $frak(s l)_2$.
    The evaluation and diagonal-conjugation argument of Lemma 12 shows that restriction to this kernel detects a
    nonzero degree-one class. Its evaluations span the Tate plane by irreducibility.
    Both the primal and the opposite-condition spaces inject into unrestricted global cohomology,
    by the local invariant checks above. Poitou–Tate and the global Euler characteristic now give amplitude $1 \, 2$ and
  $ h = 1 + h^(*) \, $
  where $h \, h^(*)$ are their degree-one dimensions. This remains true after any of the line changes below.
  Choose a fresh sequence of good primes $ell arrow.r 1$ in $bb(Z)_p^times$,
    split to increasing precision on all old scalar data, whose Tate Frobenius tends to
  $ tau = mat(delim: "(", 1, e; 0, 1) \, wide e eq.not 0 . $
  The local degree-one cohomology over the testing DVR splits into the finite line $T \/ \( tau - 1 \) T$,
    measured by Frobenius, and the singular line $ker \( tau - 1 \)$, measured by tame inertia.
    The notation here means scalar extension to the testing ring;
    $e$ is a unit there because $p$ has been inverted. The conjugating power in the inertia relation tends to one.
    The finite line is isotropic by inflation, and a pure singular cocycle has values in the Weil-isotropic
    invariant line. The mixed pairing is perfect. Taking all $H^0$, the respective line in $H^1$,
    and no $H^2$ therefore gives the exact complementary conditions.
  A nonzero primal class and a nonzero dual class can both be made nonzero on the finite line.
    On the joint kernel their evaluations are additive and span the plane.
    Each prohibited zero is a proper affine condition; finitely many such conditions can be avoided in
    characteristic zero. Chebotarev realizes the resulting finite tables at increasing precision.
  The order of the further choices is relevant. At each stage fix the cyclotomic base $K_0 =
    bb(Q) \( mu_M \)$ first. Perturb the desired unipotent element within the available deep special linear
    subgroup so that $v_p det \( 1 - rho_T \( "Frob"_ell \) \)$ is large but finite. Next choose $A_i$ with
  $ A_i - v_p det \( 1 - rho_T \( "Frob"_ell \) \) arrow.r oo \, wide ell equiv 1 med \( mod med p^(A_i) \) . $
  Require exact splitting in $K_0$, all earlier derivative fields,
    and the $p^(A_i)$-th roots of all earlier derivative primes.
    These conditions make the new degree-$p^(A_i)$ conductor-$ell$ field and the earlier derivative fields
    mutually split at their conductors. They are compatible with the finite Tate and evaluation conditions by the
    same open-image argument. A Frobenius lift trivial in the new derivative field is obtained by an inertia adjustment.
  For a set $I$ of derivative primes, norm the system class to the compositum $K_I$ of their degree-$p^(A_i)$
    fields with $K_0$, choose inertia representatives $sigma_ell$ generating their own cyclic factors and trivial
    on the other factors, and apply
  $ D_I^(upright("der")) = product_(ell in I) sum_(j = 1)^(m_ell - 1) j sigma_ell^j \, wide m_ell = p^(A_i) . $
  The good Euler norm at $ell$ is
  $ p_ell = ell^(- 1) det \( 1 - rho_T \( "Frob"_ell \) \) . $
  There is one fixed nonzero $p$-power $L_(*)$ which clears all torsion ambiguities and descent obstructions used
    in a finite switching argument. To see uniformity, the commutator image for a non-CM curve bounds the exponent
    of $\( V \/ T \)^(G_F)$ over all abelian fields $F$ in question.
    This bounds $H^1 \( T \)$-torsion, and also the invariants of $T \/ p^n
    T$ that occur in inflation–restriction. The obstruction and ambiguity groups are killed by the same bounded
    exponent. The identity
  $ \( sigma_ell - 1 \) D_ell^(upright("der")) = m_ell - N_ell \, wide N_ell = sum_(j = 0)^(m_ell - 1) sigma_ell^j \, $
  then makes the derivatives invariant modulo $p^n$, for $n arrow.r oo$ sufficiently slowly.
    Descend to $K_0$, use unnormalized character corestriction, and pass to the marked models.
    We obtain integral classes $Z_I$, with $Z_diameter = L_(*) z_(upright("sys"))$.
  Here is the exact local derivative comparison. Put $m = m_ell$.
    Let $b \, b_ell$ be the lower and upper integral cocycles after all other derivatives, and put $F =
    rho_T \( "Frob"_ell \)$. They vanish on local inertia: good reduction and the Weil bound exclude the
    eigenvalue $ell$ in the relevant inertia cohomology. Put $x = b \( "Frob"_ell \)$, $x_ell =
    b_ell \( "Frob"_ell \)$. The norm identity gives a coboundary $d y$ with
  $ sum_(j = 0)^(m - 1) sigma_ell^j b_ell = p_ell b + d y \, wide \( F - 1 \) y = m x_ell - p_ell x . $
  After adjusting the descended cocycle, its restriction is exactly the derivative of $b_ell$.
    Its finite value tends to zero because the derivative coefficient sum is $m \( m - 1 \) \/ 2$.
    Applying $sigma_ell - 1$ shows that its singular value is $- y$,
    up to the uniformly bounded loss already cleared. Finally
  $ y = m \( F - 1 \)^(- 1) x_ell - ell^(- 1) "adj" \( F - 1 \) x . $
  The first term tends to zero by the chosen margin on $A_i$.
    A lower coboundary $\( F - 1 \) w$ disappears after applying the adjugate in the limit.
    The calculation holds on every translate before character corestriction. Therefore
  #[#set math.equation(numbering: n => "(5.6)")
   $ f \( Z_I \) = 0 \, wide s \( Z_I \) = "adj" \( tau - 1 \) f \( Z_(I \\ { ell }) \) . $ <single:finite-singular>]
  The map between the two lines is multiplication by $plus.minus e$,
    and hence is a unit comparison at the testing DVR. The classes lift to the complexes with the new conditions;
    the inclusion of $H^0$ and the vanishing of the old singular quotients’ $H^1$ give the claimed lifts over the
    DVR itself.
  If $h > 1$ generically, choose the two nonzero evaluations above.
    Equation (5.6) makes the derived primal class nonzero on the singular line.
    Its pairing with the old dual class is then nonzero at this prime and zero at all other places,
    contradicting reciprocity. Thus $h = 1$ generically. At a DVR where the fiber has $h > 1$,
    use the primitive reduction of the generic line and a nonzero fiber dual class.
    The exact line-switch Lemma 13 reduces $h$ by one and preserves the determinant valuation,
    because the comparison in (5.6) is a unit. After finitely many switches the complex is a free line in degree
    one and its class is integral. The factor $L_(*)$ is a unit at this DVR.
    Reading the equalities backwards proves (4). ◻
]

=== 5.4 Removing the smoothing and Euler divisors <removing-the-smoothing-and-euler-divisors>

#proof[
  At $\( p \)$, (1)(a) identifies $G$ with a free line in degree one.
    The class is integral and the normalizing factors are units there.
    This proves nonnegative order at the vertical divisor once generic nonvanishing is known.
  For that nonvanishing, use the second setting in Lemma 35.
    Rohrlich’s finite-support twist nonvanishing, in the form [15] Theorem 13.5(2),
    applies to the fixed weight-two newform and characters with conductor supported at $p$.
    Infinitely many sufficiently ramified even characters have nonzero central value.
    The period formula (2) therefore makes the fixed-support square class generically nonzero:
    a torsion class over the one-variable power-series ring would vanish at all but finitely many such characters.
    Lemma 35 gives one generic line. Setting all $u_j = 0$ in the full diagram adds acyclic singular quotients,
    since the moving Frobenius limits have $det \( 1 - g_j \) eq.not 0$,
    where $g_j$ is the limiting Frobenius at the $j$-th moving prime.
    The good norm relations multiply the class by the nonzero constants $2 - "Tr" \( g_j \)$.
    Thus the full diagram also has a nonzero class on a single generic line.
    The first setting of the lemma now treats every horizontal divisor outside the fixed factors.
  It remains to remove the fixed factors. Express $U = g_0 \/ f_0$ using integral determinant pivot formulas,
    with $f_0 eq.not 0$, and retain integral stage expressions $g_(0 \, i) \, f_(0 \, i)$.
    Specialize the tame variables to finite nontrivial values $u_j = eta_j - 1$,
    avoiding identically zero denominators and the prohibited Frobenius values at $p$.
    These specializations still detect bounded series: repeated one-variable Weierstrass preparation permits
    avoidance of any finite collection of nonzero conditions.
    The conditions also hold at sufficiently precise original stages.
  Fix such a stage and a horizontal prime of $Lambda_eta$. Use a rectangular system with unfilled first row,
    with $b = N_(p')$, and $M$ supported only at $p$ and the active tame conductors.
    Choose a degeneracy $A = p^k$ and a symbol with nonzero evaluation.
    Smoothing integers $c' \, d'$ can be chosen so that $Delta'$ is a unit at this prime.
    Indeed preparation realizes its $t$-value as an algebraic point of the open unit disk.
    Use CRT to choose integers tending to one $p$-adically, congruent to one on the required fixed symbol orders,
    and with a prescribed nontrivial $eta$-value at one active conductor and trivial values at the others.
    All coprimalities can be maintained. At the selected $t$-value,
    the cyclotomic factor tends to one whereas the chosen constant weight is nontrivial,
    so the smoothing factor is eventually nonzero. Fix one such choice while applying the line comparison.
  Call the resulting class $z'$. It has primitive Euler factors away from $p$:
    the only other omitted primes are ramified conductors of $eta$, where the twisted local factor is one.
    The same nonvanishing theorem makes $z'$ generically nonzero.
    Lemma 35 gives its integral determinant order with unramified old conditions.
    On changing those conditions to full, the order changes by $- sum_(q eq.not p) v \( D_(q \, eta) \)$.
  In the common generic full cohomology line the ratio of the square and rectangular classes,
    apart from their nonzero constant symbol ratio, is
  #[#set math.equation(numbering: n => "(5.7)")
   $ frac(Delta product_(q in S_f \\ { p }) P_q, Delta') . $ <single:class-ratio>]
  To verify the identity rather than merely its character values,
    evaluate the two classes at the infinitely many sufficiently ramified cyclotomic characters with nonzero
    central value. Formula (2) gives exactly the displayed ratio; omissions at active conductors contribute one.
    Clearing the generic denominators and applying one-variable preparation proves the identity.
    Squaring first gives the same valuation conclusion if the common orientation sign has not been fixed.
    Consequently the tested quotient $g_(0 \, i) \/ f_(0 \, i)$ has no horizontal pole, that is,
  $ g_(0 \, i) \( t \, bold(eta) - 1 \) \/ f_(0 \, i) \( t \, bold(eta) - 1 \) in Lambda_eta \[ 1 \/ p \] . $
  There is no assertion of a uniform denominator for these stage quotients.
  Every remaining possible pole of $U$ divides a factor regular in $t$.
    For such a factor $H$, take a distinguished representative and divide the integral numerator by $H^a$,
    where $a = v_H \( f_0 \)$. At each permitted finite tame specialization,
    the limiting numerator contains all the zeros of the limiting denominator with their multiplicities.
    This follows from Lemma 19: on a smaller closed disk about a zero,
    the initially integral numerator and denominator converge uniformly,
    and Weierstrass preparation preserves the number of zeros with multiplicity.
    Thus the specialized division remainder is zero. Finite-character detection makes the remainder zero in $R$.
    There are therefore no remaining height-one poles. Since $R$ is factorial, $U in R$, proving the proposition. ◻
]

=== 5.5 A tame height in analytic rank one <a-tame-height-in-analytic-rank-one>

The preceding argument established integrality without identifying the central coordinate.
  In rank one that identification requires the following exact rational equality.
  Return to a fixed support $S$, with no moving primes. Choose its square order to have prime support exactly
  $S_f$. Let $z_b$ be the smoothed class at the trivial character and put

$ d_0 = Delta \( 0 \) product_(q in S_f) P_q \( 1 \) \, wide P_q \( 1 \) = L_q \( E \, 1 \)^(- 1) . $

If the analytic rank is one, (2) makes the central dual exponential zero.
  At non-$p$ places rational elliptic cohomology is zero, by local duality and the Euler characteristic.
  Thus $z_b$ lies in the rational compact Selmer line. Finite $"Sha"$ identifies this line with $E \( bb(Q) \) ⊗
  bb(Q)_p$, so $log_omega z_b$ means its local elliptic logarithm.
  A nontorsion rational point has nonzero local logarithm, since the kernel on local points is torsion.

#thm([Proposition 5.7.])[
  (Exact logarithmic comparison).  #emph[If $"ord"_(s = 1) L \( E \, s \) =
    1$ and $P in E \( bb(Q) \)$ is nontorsion, then
#[#set math.equation(numbering: n => "(5)")
 $ frac(log_omega z_b, \( log_omega P \)^2) = plus.minus d_0 frac(L' \( E \, 1 \), Omega_0 H \( P \)) . $ <eq:source-5>]

 The right-hand quotient is rational, and is interpreted in $bb(Q)_p$.
   The height is exactly the height $H$ fixed in the introduction.]
] <single:logarithm>

Choose $K_b = bb(Q) \( sqrt(- D) \)$, with $- D < - 4$ an odd fundamental discriminant,
  so that all primes of $2 N p$ and the other fixed data split, and $L \( f ⊗ epsilon \, 1 \) eq.not 0$,
  where $epsilon = epsilon_(K_b)$. Lemma 7 applies because $w \( E \) = - 1$.
  Choose an integral polynomial $cal(A)$ in Hecke operators away from $N D
  p$ that kills every other level-$N$ eigensystem and the Eisenstein types unramified away from $N$ with conductor
  dividing $N$, including the weight-two trivial pair, while $cal(A)_f eq.not 0$.
  Also choose a good inert prime $ell divides.not 6 N D p$, away from the Hecke primes occurring in $cal(A)$,
  with $a_f \( ell \) eq.not 0$. Multiplicity one gives the first choice;
  open image and Chebotarev give the second. The finitely many Hecke coefficient tests have indices $n$ prime to
  $N D$, with odd $ell$-valuation.

A horizontal sequence consists of primes $r_i$, integers $m_i arrow.r oo$, and surjections

$ lambda_i : \( bb(Z) \/ r_i bb(Z) \)^times arrow.r bb(Z) \/ p^(m_i) bb(Z) . $

The primes $r_i$ avoid the level, all fixed Hecke primes, and all the finitely many tested indices.
  We require $r_i equiv 1 med \( mod med N D \)$, $r_i arrow.r 1$ in $bb(Z)_p$,
  and splitting in the Hilbert class field of $K_b$. The characters kill $p$, the fixed support,
  smoothing integers, $2 \, 3 \, D$, all tested indices, and the finite model and lift exceptions introduced
  below. Their limiting Tate Frobenius has determinant one and trace $a_(*) eq.not plus.minus 2$,
  with eigenvalues not roots of unity. These characters are automatically even because $p$ is odd.
  Viewed idelically, $lambda_i$ has uniformizer value $lambda_i \( q \)$ at $q eq.not r_i$,
  negative residue character at $r_i$, and zero uniformizer value there. Over an extension it is composed with the norm.

#thm([Lemma 5.8.])[
  (A nonzero height direction).  #emph[The horizontal sequence can be chosen to define bilinear tame heights whose
    rational limits satisfy
$ h_lambda^(K_b) \( P_1 \, P_2 \) = 2 h_lambda^(bb(Q)) \( P_1 \, P_2 \) quad \( P_1 \, P_2 in E \( bb(Q) \) \) \,
  wide h_lambda^(bb(Q)) \( P \, P \) eq.not 0 . $

 These heights are compatible with trace in the second argument.]
] <single:height-direction>

#proof[
  Let $G_y$ be the extension of $E$ by $bb(G)_m$ defined by the Poincare biextension at $y = "pol" \( P \)$.
    Choose a rational lift $B_P$ of $P$. The fiber is a line torsor, so this lift exists.
    Splitting its underlying Tate modules gives an upper-right Galois block $beta \( g \) g_T$;
    $beta$ is the Kummer cocycle of $y$, up to the fixed polarization sign.
    At finite order this follows by identifying division points of $y$ with splittings of the extension and using
    the Weil pairing to compare two splittings. Write the Kummer cocycle of $B_P$ as $\( k \, x \)$. Then
  $ d k = - beta union x . $
  Include all ramification and nonintegrality primes of these data in the finite killed list.
  Adjoin to a fixed normal splitting field all cyclotomic $p$-power roots and all $p$-power radicals of the killed
    primes. Its relative Galois group has bounded derived length,
    so the Tate image over this field still contains a deep $"SL"_2$.
    On the additional Tate kernel the values of $x$ span the plane.
    Indeed nonzero Kummer classes remain nonzero over a fixed finite extension;
    a central homothety in the open Tate image detects them on its kernel.
    The further radical quotient has scalar cyclotomic conjugation,
    so cannot support the irreducible Tate plane as a quotient.
    Choose an element $g$ fixing the splitting and radical data,
    with determinant-one Tate action of the required trace, and
  #[#set math.equation(numbering: n => "(5.8)")
   $ k \( g \) - beta \( g \) g_T \( g_T - 1 \)^(- 1) x \( g \) eq.not 0 . $ <single:height-cocycle>]
  For existence, on the joint kernel the commutator of two elements has $x = beta =
    0$ and $k$-value $plus.minus 2 e \( x \( h_1 \) \, x \( h_2 \) \)$, where $e$ denotes the Weil form.
    Full span supplies a nonzero value. Multiplying the chosen $g$ by such a commutator changes the left side of
    (5.8) without changing its Tate action. Chebotarev and compatible power-residue bases now give the asserted
    $r_i \, lambda_i$.
  We use the biextension construction of [24] Section 6, “Tame heights and trace compatibility”,
    verifying its $p$-power version here. Over an extension containing a ring class field of positive $r_i$-power
    conductor, the normed character is unramified also above $r_i$.
    Indeed the split order class sequence identifies the two residue-unit factors modulo the diagonal and the
    global units ${ plus.minus 1 }$. For units at one specified split place, the other component is one.
    The local norm subgroup therefore has residue in ${ plus.minus 1 }$, which the even character kills.
    Sum the local character valuations of a rational biextension lift relative to its rigidified integral fibers.
    Reciprocity gives independence of the lift, and the two biextension laws give bilinearity.
    On a Jacobian this is the Deligne-pairing intersection formula for disjoint generic supports,
    with the common orientation sign.
  To define the same height downstairs, note that $\# E \( bb(F)_(r_i) \) arrow.r 2 -
    a_(*) eq.not 0$ $p$-adically. One fixed $p^b$ therefore removes every finite $p$-primary reduction part.
    After multiplying the first argument by $p^b$, divide it by $p^(m_i)$ in the uniquely $p$-divisible local
    factor. For lifts $cal(B) \, cal(B)'$ before and after division, apply the local character to
  $ cal(B) \/ \( \[ p^(m_i) \]_1 cal(B)' \) . $
  Changing $cal(B)'$ changes this scalar by a $p^(m_i)$-th power.
    The two laws give bilinearity; comparison with integral lifts gives the unramified construction after
    extension. Norming lifts in the second argument proves trace compatibility.
    Passing to limits and dividing by $p^b$ defines the stated rational heights.
  For the fixed lift $B_P$, all places except $r_i$ contribute zero.
    Put $w_i = \( g_(i \, T) - 1 \)^(- 1) x \( g_i \)$, with $p^b w_i$ integral after enlarging the fixed $b$.
    Correcting division points by this coboundary leaves the fiber cocycle $p^b \( k - beta union w_i \)$.
    Its Frobenius value is the power residue character of the scalar ratio above.
    Thus the limiting height is, up to sign, (5.8), and is nonzero.
    Trace over $K_b \/ bb(Q)$ contributes its degree two. ◻
]

Use the square classes with the additional prime $r_i$, and write $chi_b = \( 1 + u \)^(lambda_i)$.
  Since $lambda_i \( p \) = 0$, the local coefficients at $p$ are split.
  Let $Z_i \( u \)$ be the group polynomial of dual-exponential coordinates in $omega$.
  Local splitting makes every group coefficient pass through the same fixed map $exp^(*) :
  H^1 \( bb(Q)_p \, T \) arrow.r bb(Q)_p omega$. Its image has a fixed denominator lattice,
  so the denominators of $Z_i$ are bounded independently of $i$. Moreover $Z_i \( 0 \) = 0$. For nontrivial characters,

$ Z_i = plus.minus d_0 L \( f \, overline(chi_b) \, 1 \) \/ Omega_0 . $

All these characters are primitive at $r_i$; there is no omitted $r_i$-factor in this formula.
  Write $Z'$ for the linear coefficient of the bounded-series limit.

#thm([Lemma 5.9.])[
  (Cup comparison).  #emph[For the sequence of Lemma 37,
#[#set math.equation(numbering: n => "(6)")
 $ Z' log_omega P = plus.minus \( 2 - a_(*) \) frac(log_omega z_b, log_omega P) h_lambda^(bb(Q)) \( P \, P \) .
   $ <eq:source-6>]

]
] <single:cup>

#proof[
  At stage $i$, write a cocycle modulo $\( p^(m_i) \, u^2 \)$ as $z_0 + u z_1$.
    Then $d z_1 = - lambda_i union z_0$. The good norm relation and one fixed clearing factor permit the adjustment
  $ z_0 = alpha_i beta \, wide alpha_i = plus.minus (1 - frac(a_f \( r_i \), r_i) + 1 / r_i)
    frac(log_omega z_b, log_omega P) . $
  The clearing is uniform because the degree-one torsion has bounded exponent.
    The scalar two-cocycle $z_1 union x + alpha_i lambda_i union k$ is closed.
    Its local invariant at $p$ tends to $Z' log_omega P$, by the logarithm–dual-exponential pairing.
    At the other fixed places the character is killed and the rational local class is a coboundary.
    At $r_i$, use $d w_i = x$ to obtain $alpha_i lambda_i union \( k - beta union w_i \)$.
    Its invariant is $plus.minus alpha_i h_i^(bb(Q)) \( P \, P \)$, by the scalar-ratio computation in Lemma 37.
    The sum of local invariants is zero. Passing to the limit, the Euler factor tends to $2 - a_(*)$, giving (6). ◻
]

=== 5.6 The exact spectral comparison <the-exact-spectral-comparison>

Fix a rational modular parametrization $phi.alt : X_0 \( N \) arrow.r E$, of degree $delta_phi.alt$.
  Let $P_X in J_0 \( N \) \( K_b \)$ be the single oriented Hilbert-class trace based at $oo$, and put $Q_X =
  phi.alt_(*) P_X$. With unnormalized Petersson integral set

$ C_0 = frac(sqrt(D), 8 pi^2 \( f \, f \)_N) . $

Choose a real primitive period $Omega_(upright("tw"))$ for the negative twist. The period relations are

$ C_0 Omega_0 Omega_(upright("tw")) in bb(Q)^times \, wide
  L \( f ⊗ epsilon \, 1 \) \/ Omega_(upright("tw")) in bb(Q)^times . $

The second is modular-symbol rationality. For the first, if $phi.alt^(*) omega = c_phi.alt f thin d q \/ q$,
  the complex area of $E$ is $8 pi^2 c_phi.alt^2 \( f \, f \)_N \/ delta_phi.alt$;
  the twist period is a rational multiple of the anti-invariant period divided by $sqrt(D)$.
  This also specifies the rational normalization in which the following identities are embedded in $bb(Q)_p$.

#thm([Lemma 5.10.])[
  (Spectral-height identity).  #emph[For the horizontal sequence just constructed,
#[#set math.equation(numbering: n => "(7)")
 $ C_0 Omega_0 L \( f ⊗ epsilon \, 1 \) Z' / d_0 = plus.minus \( 2 - a_(*) \)
   frac(h_lambda^(K_b) \( Q_X \, Q_X \), delta_phi.alt) . $ <eq:source-7>]

]
] <single:spectral>

#proof[
  The proof evaluates the same finite differences of kernel coefficients in two ways.
    Projection onto the $f$-block expresses them through $Z'$;
    their intersection interpretation expresses them through $h_lambda^(K_b) \( Q_X \, Q_X \)$.
    Matching the two evaluations, with their constants, gives the identity.
    We first specify the finite-character formulas and then prove their interpolation in the present $p$-power
    direction. They are the complex coefficient and geometric intersection identities in [24] Section 6,
    “The traced coefficient,” “Fricke transformation and unfolding,” and “Intersection realization”.
    Their hypotheses are an odd fundamental discriminant $- D < - 4$, split Heegner level $N$,
    a prime $r divides.not N D$ split in the Hilbert class field with $r equiv 1 med \( mod med N D \)$,
    an even prime-conductor character $chi$ with $chi^2 eq.not 1$, and indices $n r^h$ with $\( n \, N D \) =
    1$ and odd valuation at the chosen inert prime $ell$. None of these identities has a coefficient-prime hypothesis.
  Here are their precise normalizations. Choose integral ideal representatives $C$ of $"Pic" \( cal(O)_(K_b) \)$,
    prime to $D$, and put $a_C = upright(N) C$. Let $e \( x \) = exp \( 2 pi i x \)$ and
  $ theta \( z \) = 1 / 2 sum_C sum_(x in C) e \( upright(N) x thin z \/ a_C \) . $
  Its positive coefficient is $rho \( n \) = sum_(d divides n) epsilon \( d \)$.
    If $theta_chi$ is its Fourier twist, define
  $ E_(chi \, s) \( z \) = 1 / 2 sum_(\( c_1 \, d_1 \) eq.not \( 0 \, 0 \)\
N D divides c_1) epsilon \( d_1 \) macron(chi)^2 \( c_1 \)
  frac("Im" \( z \)^s, \( c_1 z + d_1 \) \| c_1 z + d_1 \|^(2 s)) \, wide I_chi =
  frac(sqrt(D), 2 pi) "Tr"_(N D r^2 \/ N r^2) \( theta_chi E_(chi \, s) \)\|_(s = 0) . $
  Characters are extended by zero at nonunits; the trace is unnormalized. The continuation is holomorphic.
    Poisson summation pairs the odd row weights, eliminates the nonholomorphic modes,
    and permits pairing with cusp tests.
  For every tested index $n$ and $h gt.eq 1$, regard the coefficient at $n
    r_i^h$ as a polynomial $D_(i \, h) \( n \; u \)$ in $bb(Z)_p \[ u \] \/ \( \( 1 + u \)^(p^(m_i)) - 1 \)$:
    in the following sum $r = r_i$ and $chi \( x \) = \( 1 + u \)^(lambda_i \( x \))$.
  #[#set math.equation(numbering: n => "(5.9)")
   $ D_(i \, h) \( n \; u \) = 1 / 2 sum_(C \, med y in C \, med b > 0\
a = upright(N) y \/ a_C > 0\
a + N b = n r^h D) sum_(k l = b\
gcd \( k \, l \, D \) = 1) W \( k \) chi \( a \/ D \) macron(chi)^2 \( N k \) \, $ <single:kernel-coefficient>]
  where
  $ W \( k \) = product_(q divides D\
q divides k) \( l \/ q \) product_(q divides D\
q divides.not k) \( - a_C N k \/ q \) . $
  Write $epsilon.alt_q \( x \) = \( x \/ q \)$. The local partial Fourier transform at $q divides
    D$ has scalar $kappa_q = q^(- 1) tau_q epsilon.alt_q \( - a_C D \/ q \)$, with $tau_q =
    sum_(x med mod med q) epsilon.alt_q \( x \) e \( x \/ q \)$.
    Multiplying the partial traces and the Poisson factor $- 2 pi i \/ D$ leaves common scalar one,
    because the primitive Gauss sum of $epsilon$ is $i sqrt(D)$.
    This explains in particular the factor $1 \/ 2$ in (5.9).
    For a trace matrix $gamma = mat(delim: "(", a_gamma, b_gamma; c_gamma, d_gamma) in Gamma_0 \( N r^2 \)$,
    translation of the theta twist multiplies its weight by $chi \( a_gamma^(- 2) \)$,
    canceled by the Eisenstein row weight $chi^2 \( a_gamma \)$.
    Thus these finite-character computations apply to our characters as soon as $chi^2 eq.not 1$,
    which holds for every nontrivial $p$-power character.
  Use the same marked Artin limits as before to define $D_h \( n \; u \) =
    lim_i D_(i \, h) \( n \; u \)$ and $D'_h \( n \) = \[ u \] D_h \( n \; u \)$.
    Only terms with $a$ a unit at $r$ occur in (5.9). Since $r divides n r^h$, this is equivalent to $k \,
    l$ being units there. The identity $W \( l \) = - W \( k \)$ cancels the divisor-independent terms in the
    derivative of the character weight. Hence $D'_h \( n \)$ is the limit of the masked sum with weight $-
    2 lambda_i \( k \)$.
  For $h gt.eq 0$, define $B_(i \, h) \( n \) in bb(Z) \/ p^(m_i)
    bb(Z)$ by the same sum with the mask removed and character weight replaced by $-
    2 lambda_i \( k \/ r_i^(v_(r_i) \( k \)) \)$. Write $B_h \( n \)$ for its Artin limit, put $B_h \( n \) =
    0$ for $h < 0$, and set $C_h \( n \) = B_h \( n \) - B_(h - 2) \( n \)$.
    Stripping a common power $r^j$ from $a \, b$ shows that, for $h gt.eq 2$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ C_(h + 1) - 2 C_h + C_(h - 1) = D'_(h + 1) + 2 D'_h + D'_(h - 1) . $ <single:mask>]
  For completeness, when the primitive index is positive the $C_h$-multiplicities are $1 \, 4 \, 8 \, 12 \,
    dots.h$; their second differences are $1 \, 2 \, 1$. At primitive index zero they are affine and the second
    difference is zero. The off-$r$ weights do not change, since the primes over $r$ are principal and $r equiv
    1 med \( mod med D \)$. This proves the identity for $bb(Z) \/
    p^(m_i)$-valued weights and then on their limits, with no alteration of constants.
  The symbols $D'_h \, B_h \, C_h$ will also denote these coefficient functions of $n$.
    The Hecke polynomial $cal(A)$ acts on them by the weight-two coefficient rule $\( T_s a \) \( n \) =
    a \( s n \) + s a \( n \/ s \)$, with the second term zero unless $s divides n$.
    All its primes are away from $N D r_i$. The finite set of tested indices was chosen to contain the indices
    needed to evaluate this polynomial at $n = ell$.
  We next project its holomorphic side. At level $N r^2$ use $f_j = r^j f \( r^j z \)$, $0 lt.eq j lt.eq 2$,
    and write $tau \( chi \) = sum_(x med mod med r) chi \( x \) e \( x \/ r \)$.
    The finite-character Fricke and unfolding identities are
  #[#set math.equation(numbering: n => "(5.11)")
   $ frac(\( I_chi \, f_2 \)_(N r^2), \( f \, f \)_(N r^2)) =
     frac(C_0, r + 1) frac(tau \( chi \), tau \( macron(chi) \)) L \( f \, macron(chi) \, 1 \)
     L \( f ⊗ epsilon \, macron(chi) \, 1 \) \, wide \( I_chi \, f_1 \)_(N r^2) = 0 . $ <single:old-pairings>]
  The exact constants arise from the kernel factor $sqrt(D) \/ \( 2 pi \)$, the Fricke factor $r$,
    the Mellin integral $1 \/ \( 4 pi \)$, and the level index $r \( r + 1 \)$.
    At primes of $N$, use the primitive degree-at-most-one polynomial and $epsilon \( q \) = 1$;
    at primes of $D$ the twisted local factor is one; at $r$ both twisted factors are one.
    The total nebentypus is trivial. The conductor-$r$ new cuspidal block is therefore Steinberg, with $U_r =
    plus.minus 1$, and its complementary raises have eigenvalue zero.
    The conductor-$r^2$ cuspidal block has $U_r = 0$. In a ramified Eisenstein pair both characters are ramified
    at $r$, so its $U_r$-eigenvalue is also zero. Thus $U_r^h \( U_r^2 - 1 \)$ kills these blocks for sufficiently
    large $h$. The remaining old blocks come from level $N$; the fixed operator $cal(A)$ kills all of them except
    the $f$-block.
  Write $a_h = a_f \( r^h \)$ and $a = a_f \( r \)$. The normalized Gram matrix of $f_0 \, f_1 \,
    f_2$ has entries $g_(\| i - j \|)$, where
  $ g_0 = 1 \, wide g_1 = frac(a, r + 1) \, wide r g_2 = a g_1 - 1 . $
  The coefficient vector at index $n r^h$, after removing its $n$-factor,
    is $\( a_h \, r a_(h - 1) \, r^2 a_(h - 2) \)$. The coefficient of the Gram row for $f_2$ is
  $ s_h = frac(r^2 a_(h - 2) - g_1 r a_(h - 1), 1 - g_1^2) . $
  Its denominators have bounded $p$-valuation because $a_(*) eq.not plus.minus 2$.
    Set $gamma_h = lim_i \( a_f \( r_i^h \) - a_f \( r_i^(h - 2) \) \)$. The Hecke recurrence gives
  $ lim_i frac(s_h, r_i + 1) = frac(gamma_h, \( a_(*) - 2 \) \( a_(*) + 2 \)) . $
  All factors in (5.11) have bounded group polynomial realizations.
    The Gauss ratio is $tau \( chi \)^2 \/ r$; its coefficients are integral and fixed by $p$-Frobenius because
    $lambda_i \( p \) = 0$, and its limiting augmentation is one. The first $L$-value factor is $Z_i \/ d_0$.
    For the companion, use the even additive modular-symbol sum multiplied by $tau \( macron(chi) \) \/ r$.
    Its denominators are bounded by the fixed relative period lattices. Before Gauss multiplication its augmentation is
  $ r sum_(r divides j) frac(a_(f ⊗ epsilon) \( j \), j) - L \( f ⊗ epsilon \, 1 \) = \( a_f \( r \) - 2 \)
    L \( f ⊗ epsilon \, 1 \) \, $
  by the Hecke recurrence and Mellin continuation. The trivial Gauss sum is $- 1$,
    so its limiting normalized augmentation is $\( 2 - a_(*) \) L \( f ⊗ epsilon \, 1 \) \/
    Omega_(upright("tw"))$. Multiply the finite-character identity by $\( 1 + u \)^2 -
    1$ to remove the excluded character values, pass to bounded-series limits, and cancel the nonzero multiplier.
    Since $Z_i \( 0 \) = 0$, only that companion augmentation contributes to the derivative. We obtain
  #[#set math.equation(numbering: n => "(5.12)")
   $ \[ cal(A) \( D'_(h + 2) - D'_h \) \] \( ell \) =  & plus.minus cal(A)_f a_f \( ell \)
     frac(gamma_(h + 2) - gamma_h, \( a_(*) - 2 \) \( a_(*) + 2 \))\
 & #h(4mm)  dot.op C_0 Omega_0 Z' / d_0 \( 2 - a_(*) \) L \( f ⊗ epsilon \, 1 \) . $ <single:projected-derivative>]
  This interpolation uses bounded denominators, not a coefficient-prime restriction;
    in particular it applies when $p = 3$.
  For the geometric side, the coefficient-prime-independent intersection identity cited above applies at $q
    divides.not 6 N D n r^h$. Its local divisor sum, with weight $-
    2 v_q \( k \)$ and the original factor $1 \/ 2$, is zero unless $q$ is inert, $d_q = v_q \( b \)$ is odd,
    and $epsilon_(K_b \, s) \( - b N a_C \) = 1$ for all $s divides D$,
    where $epsilon_(K_b \, s)$ is the local quadratic norm character of $K_b \/ bb(Q)$ at $s$,
    distinguished from the residue symbols $epsilon.alt_q$ above. When these conditions hold it equals
  $ - frac(1 + d_q, 2) rho \( b \/ q \) 2^(\# { s divides D : s divides b }) . $
  Its negative is the intersection of the oriented ordered Hilbert-class sums, based respectively at $oo$ and $0$,
    with the second acted on by $T_(n r^h)$, weighted by residue degree over $q$.
    The generic supports are disjoint by the odd inert $ell$-valuation.
    The remaining fixed primes have character zero. This yields all the required height contributions except those
    at $r_i$.
  The difference $C_h = B_h - B_(h - 2)$ keeps cyclic paths in the second Hecke divisor;
    its second difference eliminates the two continuing maximal-order paths.
    Every other orbit is a trace from an extension containing a positive-$r$-conductor ring class field.
    After pulling up the first divisor, intersections at $r$ are zero.
    Indeed ordinary CM reduction gives linear or conjugate-semilinear maps over the unramified quadratic
    $ell$-adic algebra, whose norm degrees have even $ell$-valuation;
    they cannot produce the prescribed odd index. Cusps remain disjoint.
    The missing contributions may therefore be added as zeros.
    Lemma 37 now identifies the resulting intersections with full trace heights:
    the normed characters are unramified over exactly the extensions just obtained.
  Applying $cal(A)$ at $ell$ inserts the projector $phi.alt^(*) phi.alt_(*) \/ delta_phi.alt$,
    with scalar $cal(A)_f a_f \( ell \)$. The Hecke second difference acts on the second point with eigenvalue
    $gamma_h$. Thus the geometric side of (5.10), after the additional $h mapsto h + 2$ difference, is
  $ plus.minus cal(A)_f a_f \( ell \) \( a_(*) - 2 \) \( gamma_(h + 2) - gamma_h \)
    frac(h_lambda^(K_b) \( Q_X \, Q_X \), delta_phi.alt) . $
  All projector denominators and the fixed first-argument multiplier $p^b$ cancel in these rational identities.
    Cusp torsion has zero rational height. On the holomorphic side, the coefficients $1 \, 2 \,
    1$ in (5.10) insert $a_(*) + 2$ into (5.12). Cancel $cal(A)_f a_f \( ell \)$ and $gamma_(h + 2) - gamma_h$.
    The latter is nonzero for some sufficiently large $h$, since the limiting eigenvalues are distinct and not
    roots of unity.
    The remaining scalar $\( a_(*) + 2 \) \( 2 - a_(*) \) \/ \( \( a_(*) - 2 \) \( a_(*) + 2 \) \) = - 1$ gives (7). ◻
]

#proof[
  The companion has analytic rank zero. Hence $E \( K_b \) ⊗ bb(Q) = E \( bb(Q) \) ⊗ bb(Q)$,
    and we may write $Q_X = t_P P$ modulo torsion, with $t_P in bb(Q)$.
    The exact split Gross–Zagier formula of Theorem 8, for this single Hilbert-class trace, is
  #[#set math.equation(numbering: n => "(5.13)")
   $ C_0 L' \( f \, 1 \) L \( f ⊗ epsilon \, 1 \) = frac(2 t_P^2 H \( P \), delta_phi.alt) . $ <single:gross-zagier>]
  In particular $t_P eq.not 0$. Trace compatibility gives $h_lambda^(K_b) \( Q_X \, Q_X \) =
    2 t_P^2 h_lambda^(bb(Q)) \( P \, P \)$. The same factor two occurs in (5.13).
    Substituting both identities into (7) gives
  $ Z' = plus.minus d_0 \( 2 - a_(*) \) frac(L' \( f \, 1 \), Omega_0 H \( P \)) h_lambda^(bb(Q)) \( P \, P \) . $
  Compare with (6). The factors $2 - a_(*)$, $h_lambda^(bb(Q)) \( P \, P \)$, and $log_omega P$ are nonzero.
    Their cancellation proves (5), with no unit ambiguity other than the common orientation sign. ◻
]

=== 5.7 The central integral calculation <the-central-integral-calculation>

#thm([Proposition 5.11.])[
  (Central coordinate).  #emph[The element $U$ of Proposition 34 satisfies
#[#set math.equation(numbering: n => "(8)")
 $ X \( E \) = v_p \( U \( 0 \) \) gt.eq 0 . $ <eq:source-8>]

 This holds at every odd coefficient prime, for all reduction types and all residual representations of the non-CM
   curve.]
] <single:center>

#proof[
  Compute first at an actual stage with trivial characters and support $S' = S union { r_1 \, dots.h \, r_k }$. Put
  $ O^j = H^j \( G_(bb(Q) \, S') \, T \) \, quad s_0 = v_p \( \# "Sha" \( E \/ bb(Q) \) \) \, quad tau_g =
    v_p \( \# E \( bb(Q) \)_(upright("tors")) \) \, quad tau_v = v_p \( \# E \( bb(Q)_v \) \[ p^oo \] \) . $
  Let $p^l bb(Z)_p = log_omega E \( bb(Q)_p \)$. The singular quotient $J_p$ of local degree-one cohomology by
    compact Kummer is a free line, perfectly dual to compact Kummer modulo torsion.
    At non-$p$ places Kummer fills compact degree one. Integral Poitou–Tate therefore gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ O^1 arrow.r J_p arrow.r "Sel"_(p^oo) \( E \/ bb(Q) \)^or arrow.r O^2 arrow.r
     xor.big_(v in S'_f) H^2 \( bb(Q)_v \, T \) arrow.r E \( bb(Q) \) \[ p^oo \]^or arrow.r 0 . $ <single:pt>]
  Real Tate terms vanish because $p$ is odd. The local degree-two groups have lengths $tau_v$.
    Also $O^0 = 0$, $"rank" O^1 = 1$, and $"length" O_(upright("tors"))^1 = tau_g$.
  In rank zero, put $j = "length" \( J_p \/ "im" O^1 \)$. Equation (5.14) gives
  $ "length" O^2 = s_0 - j + sum_(v in S'_f) tau_v - tau_g . $
  If $z_i^compose$ is the central stage class and $exp^(*) z_i^compose = alpha_i omega$,
    logarithm–exponential duality gives its valuation in $J_p$ as $v_p \( alpha_i \) + l$.
    Its valuation in $O^1 \/ O_(upright("tors"))^1$ is therefore $v_p \( alpha_i \) + l - j$.
    Adding degree-one torsion and subtracting degree-two torsion gives raw determinant order
  #[#set math.equation(numbering: n => "(5.15)")
   $ v_p \( alpha_i \) + l + 2 tau_g - s_0 - sum_(v in S'_f) tau_v . $ <single:raw-zero>]
  In rank one, let $P$ generate the full free Mordell–Weil group modulo torsion.
    The map from $J_p$ to the dual of the divisible global point subgroup is injective,
    with cokernel of length $v_p \( log_omega P \) - l$. Consequently
  $ "length" O^2 = s_0 + v_p \( log_omega P \) - l + sum_(v in S'_f) tau_v - tau_g . $
  Finite $"Sha"$ identifies $O^1$ with compact global points.
    The free coordinate of the class has valuation $v_p \( log_omega z_i^compose \) - v_p \( log_omega P \)$.
    The same signed torsion sum therefore gives
  #[#set math.equation(numbering: n => "(5.16)")
   $ v_p (frac(log_omega z_i^compose, \( log_omega P \)^2)) + l + 2 tau_g - s_0 -
     sum_(v in S'_f) tau_v . $ <single:raw-one>]
  The logarithm is nonzero by (5). When restoring the moving omissions,
    the good norms multiply the fixed class by $product_r \( 1 - a_f \( r \) \/ r + 1 \/ r \)$,
    with exactly these factors.
  Lemma 16 gives the local Haar identities for the minimal differential:
  $ tau_q = v_p \( c_q P_q \( 1 \) \) quad \( q eq.not p \) \, wide tau_p - l = v_p \( c_p P_p \( 1 \) \) . $
  They include all reduction types: the nonsingular reduction measure is its point count divided by the residue
    cardinality, and the formal logarithm accounts for the finite torsion kernel at $p$.
    Substitute (2) into (5.15), or (5) into (5.16). Every omitted Euler factor cancels against its Haar factor.
    The result in either case is
  $ X \( E \) + v_p \( Delta \( 0 \) \) . $
  In rank one the use of a generator of the full free group makes $H \( P \) = "Reg"_E$.
    The ratio $Omega_E \/ Omega_0$ is a power of two and has zero $p$-valuation.
    Thus neither a Mordell–Weil index nor a real-component factor remains.
  Finally pass from the stage calculation to the central value of the limit.
    The moving local torsion lengths are bounded, because their Frobenius traces tend to values different from
    two. The displayed cohomology formulas bound the remaining torsion lengths.
    Hence determinant pivots of the same ranks survive the limit by Remark 21. The raw valuation is unchanged.
    Each $D_q \/ P_q$ has central value one; division by $Delta \( 0 \)$ leaves $v_p \( U \( 0 \) \) = X \( E \)$.
    Proposition 34 now gives the inequality. ◻
]

== 6 The analytic series and the pair comparison <sec:pair>

Fix an odd prime $p$. We retain the imaginary quadratic field $K$, the auxiliary field $L$,
  and the tuple of tame directions constructed in Sections 2 and 4.
  Thus $p = w macron(w)$ in $K$, every rational prime below the fixed finite support for $E \/ K$ splits in $K$, and

$ R = bb(Z)_p \[ \[ t \, u_1 \, dots.h \, u_d \] \] $

has one genuine anticyclotomic variable $t$. Its group is the maximal free pro-$p$ quotient $Gamma tilde.eq
  bb(Z)_p$ of the ring-class tower at $p$. The variables $upright(bold(u)) = \( u_1 \, dots.h \, u_d \)$ arise
  from the moving tame conductors. Write $L_w in R$ for the determinant of the strict-at-$w$,
  full-at-$macron(w)$ complex, with full conditions at the non-$p$ places of the support.
  It is defined up to an integral unit. The tuple satisfies

$ L_w equiv.not 0 med \( mod med \( p \, t \) \) $

for either choice of $w$, and likewise for the companion curve, by (1).

Our aim here is to construct a bounded analytic series $B_w$, with its exact central value,
  and to prove that $B_w \/ L_w$ is integral and has no factor $p$.
  We will also compare the two choices of $p$-adic place at finite characters.
  These statements retain possible horizontal divisors of the quotient; their removal is the task of Section 9.

Choose a modular parametrization $phi.alt : X_0 \( N \) arrow.r E$, based at the cusp $oo$, and write

$ phi.alt^(*) omega_E = c_E f thin d q_(upright("Tate")) \/ q_(upright("Tate")) . $

The Manin factor $c_E$ will remain in every exact formula.
  Let $S^compose$ be the fixed set of rational primes away from $p$ in the $E \/ K$ comparison.
  These primes split in $K$. Enlarging the fixed support for the companion is allowed;
  it does not change the meaning of $S^compose$ for $E$.

The arguments below include CM curves. The characteristic-zero representations $V \|_(G_K)$ and the analogous
  representation for the companion are absolutely simple. For a non-CM curve this follows from the open image
  theorem [26]. For a CM curve, $K$ and $L$ were chosen to avoid the CM field.
  The two inducing characters remain distinct on the compositum, as is seen from their CM types,
  or from the distinct weights of their $p$-adic avatars. Restriction therefore preserves absolute simplicity in
  this case also.

=== 6.1 Integral primitives on the ordinary locus <integral-primitives-on-the-ordinary-locus>

For every rational prime $q$, put

$ P_q \( Z \) = 1 - a_q / q Z + epsilon.alt_q / q Z^2 \, wide epsilon.alt_q =
  cases(delim: "{", 1 \, & q divides.not N \,, 0 \, & q divides N .) $

At a split prime away from $p$, choose an oriented cyclic level,
  raised as necessary to define the quotient operator $V_q$.
  Normalize $V_q$ by the substitution $q_(upright("Tate")) mapsto q_(upright("Tate"))^q$.
  At $p$ use only the canonical multiplicative cyclic level. On a CM disk at $w$, let

$ G \( X \) = c_E^(- 1) log_(omega_E) phi.alt \( X \) . $

Let $d_(upright("mod"))$ be ordinary modular differentiation:
  on Tate charts it is $q_(upright("Tate")) partial_(q_(upright("Tate")))$,
  and on the Igusa tower it is dual to the Kodaira–Spencer differential in the square of the trivialized invariant
  differential. The following construction adapts the ordinary-locus arguments of [24] Section 8,
  #emph[Integral depleted primitive], #emph[Support of the disk measure],
  and #emph[The exact logarithmic primitive]. We give the argument at odd $p$, including the case $p divides N$.
  Here #emph[ordinary] refers to the elliptic curves parametrized by the modular source.
  It imposes no ordinary-reduction hypothesis on the target $E$:
  the depletion and inverse-derivative limit use the coefficients $a_n$, without choosing a unit root.

#thm([Proposition 6.1.])[
  (Integral logarithmic primitive).  #emph[On the canonical ordinary locus define
$ f^(\[ p \]) = \( 1 - a_p V_p + p epsilon.alt_p V_p^2 \) f \, wide F_0 =
  lim_(j arrow.r oo) d_(upright("mod"))^(\( p - 1 \) p^j - 1) f^(\[ p \]) \, wide F =
  product_(q in S^compose) P_q \( V_q \) F_0 . $

 The limits are integral weight-zero functions. They satisfy
$ d_(upright("mod")) F_0 = f^(\[ p \]) \, wide F = sum_(n gt.eq 1\
\( n \, p product_(q in S^compose) q \) = 1) a_n / n q_(upright("Tate"))^n $

 at a Tate cusp with all cyclic groups of multiplicative type.
   If $z$ is a Serre–Tate coordinate with $z = 1$ at the canonical lift,
   the expansion $F \( z \)$ is the transform of a bounded integral measure $mu$ on $bb(Z)_p$,
   supported on $bb(Z)_p^times$. On every interior CM disk one has the exact identity
#[#set math.equation(numbering: n => "(9)")
 $ F_0 = P_p \( V_p \) G . $ <eq:source-9>]

]
] <pair:primitive>

#proof[
  Work first on a fine full prime-to-$p$ level over $cal(V) = W \( overline(bb(F))_p \)$.
    The ordinary elliptic moduli and Serre–Tate theory [8,16] provide the canonical connected subgroup and the
    Igusa tower trivializing the multiplicative formal group.
    The dual of the Kodaira–Spencer differential, expressed using the square of the trivialized invariant
    differential, defines $d_(upright("mod"))$; on Tate charts it is $q_(upright("Tate"))
    partial_(q_(upright("Tate")))$. For quotient maps we use the target differential whose pullback has the
    corresponding degree factor. These are precisely the ordinary-moduli conventions used in the cited lemmas.
  The initial algebraic pullbacks have bounded denominators on the quasi-compact ordinary formal region,
    including its Tate charts. Integrality can then be tested by successive division by the uniformizer and
    expansion at cusps. The special-fiber determinant components of the fine tame curve are irreducible,
    and every component of a finite trivialization level surjects onto its ordinary component.
    Thus expansions at all trivialization lifts of a multiplicative cusp detect zero reduction on every component.
    Modulo any fixed precision, a section on the completed tower uses a finite level, so the same test applies there.
  The $p$-depletion has no terms whose index is divisible by $p$.
    For $n in bb(Z)_p^times$, the numbers $n^(\( p - 1 \) p^j - 1)$ tend uniformly to $n^(- 1)$.
    The weights $2 \( p - 1 \) p^j$ tend to zero on $bb(Z)_p^times$.
    Consequently the differentiated expansions converge integrally on every trivialization.
    The expansion test just proved gives convergence on the tower.
    The limit is invariant under the full $bb(Z)_p^times$-action on differential trivializations,
    so torsor descent gives $F_0$ on the ordinary formal curve at the fixed fine tame level.
    Its reduction modulo $p$ is consequently a regular function on that curve’s ordinary special fiber.
    The Hecke recursions give the displayed fully depleted expansion of $F$.
    This construction uses the canonical multiplicative $p$-structure, so it also applies when $p divides N$.
  Mahler duality identifies the integral expansion in $z - 1$ with a bounded measure.
    The trace of $F$ along the canonical quotient is zero: on the parameter it is the finite flat map $z mapsto
    z^p$, reducing to Frobenius, and at a Tate cusp the trace kills every prime-to-$p$ exponent.
    Expansion detection therefore gives
  $ sum_(zeta^p = 1) F \( zeta z \) = 0 . $
  In the measure transform this sum multiplies the restriction to $p bb(Z)_p$ by $p$ and kills its complement.
    Uniqueness of transforms and torsion-freeness show that this restriction is zero.
  It remains to identify the constant in the antiderivative.
    The map to $E$ extends by the Neron mapping property on the smooth ordinary charts carrying the canonical
    $p$-subgroup. Such a chart has the same deformation germ as its tame chart:
    a subgroup lifting the connected special subgroup has zero image in the etale quotient and must be the
    canonical multiplicative subgroup. In a Neron residue tube the formal group logarithm,
    translated by the value at the center, is analytic. Multiplication into a smaller formal neighborhood and
    division by that integer gives the same analytic logarithm throughout the interior disk.
    This proves analyticity of $G$, including when the elliptic target has bad reduction.
  The differentials of $F_0$ and $P_p \( V_p \) G$ agree. Indeed differentiating $V_p G$ introduces a factor $p$,
    and differentiating $V_p^2 G$ introduces $p^2$. Their difference is therefore constant on the disk.
    The noncanonical quotient sources of a target $B$ give, by the $T_p$ or $U_p$ correspondence,
  $ sum_(zeta^p = 1) G \( zeta z \) = a_p G \( B \) - epsilon.alt_p G \( V_p B \) . $
  Cuspidal differences are torsion [18,9] and disappear under the logarithm.
    When $p divides N$, the noncanonical quotients retain the required canonical level,
    so the same identity uses $U_p$. It follows that $P_p \( V_p \) G$, like $F_0$, has trace zero.
    The $p$ sources lie in the same residue disk. The trace of their constant difference is consequently $p$ times
    that difference, which is zero in characteristic zero. This proves (9).
    Equivalently the same normalization is the elliptic weight-two case of [23] Section 5,
    #emph[Raw toric periods and the inverse Katz derivative];
    the preceding argument specifies its extension to a potentially bad target and to the canonical $p$-structures
    used here. ◻
]

=== 6.2 CM orbits and exact interpolation <cm-orbits-and-exact-interpolation>

At a finite stage let $s$ be the product of the moving tame conductors; the case $s = 1$ is included.
  The canonical centers have endomorphism order $cal(O)_s$.
  At a primitive root $z = zeta_(p^m)^(thin j)$, $j in \( bb(Z) \/ p^m \)^times$,
  endomorphism lifting gives order $cal(O)_(p^m s)$. The point, with its cyclic level,
  is defined over the ring-class field $H_(p^m s)$: the completed order units preserve the canonical $p$-level and
  the oriented prime-to-$p$ level. Here $cal(O)_K^times = { plus.minus 1 }$.

The kernel of the order-class map to conductor $s$ acts simply transitively on the primitive roots in each disk.
  In Serre–Tate coordinates its action is the ratio of the connected and etale local unit actions.
  The order-class exact sequence thus gives a map

$ eta_Gamma : bb(Z)_p^times arrow.r Gamma $

independent of $s$, with kernel $mu_(p - 1)$ and open image. We use the actual Artin labels for this map.
  Inverting all reciprocity conventions simultaneously makes no change to the assertions below.
  These coordinate facts are the odd-$p$ version of [24] Section 8, #emph[CM disk coordinates]:
  the endomorphism-lifting condition is equality of the two local actions modulo $p^m$,
  and the corresponding class kernel is $\( bb(Z) \/ p^m \)^times$.

Choose compatible ideals $frak(a)$, prime to conductors and levels, representing $"Pic" \( cal(O)_s \)$.
  Let $t_(frak(a)) in Gamma$ be their compatible Artin values and $delta_(frak(a)) in
  bb(Z)_p^times$ the exponents that transport the Serre–Tate frames from the base disk.
  Let $psi_s$ be the tuple character in the finite tame group rings.
  For $y in Gamma$ write $\[ y \]$ for its group-like power of $1 + t$.
  If $mu_(frak(a))$ is the measure in Proposition 41 on the disk indexed by $frak(a)$, define

$ b_s \( t \, upright(bold(u)) \) =
  sum_(frak(a) in "Pic" \( cal(O)_s \)) \[ thin t_(frak(a)) - eta_Gamma \( delta_(frak(a)) \) thin \] thin
  psi_s \( frak(a) \) integral_(bb(Z)_p^times) \[ - eta_Gamma \( x \) \] thin d mu_(frak(a)) \( x \) . $

This is a bounded integral series with finite group-ring tame coefficients.
  Form it with two opposite non-$p$ orientations, using the same canonical $p$-level and underlying disks.
  Passing to the bounded coefficient limits of Section 3 gives $b_w^(+)$, $b_w^(-)$, and $B_w = b_w^(+) b_w^(-)$.
  The coefficient ring is initially $cal(V)^(*) \[ \[ t \, upright(bold(u)) \] \]$, where $cal(V)^(*) =
  W \( overline(bb(F))_p^(thin *) \)$ is the unramified coefficient enlargement defined there.

#thm([Proposition 6.2.])[
  (Finite characters and the center).  #emph[Let $theta$ be a sufficiently high finite character of $Gamma$,
    and let $theta_l = theta compose eta_Gamma$ have primitive conductor $p^m$.
    Put $chi = theta psi_s$, and let $X$ be the point with parameter $zeta_(p^m)$ in the base disk at the original
    primitive level. Then
#[#set math.equation(numbering: n => "(10)")
 $ (sum_(j med mod med p^m) theta_l \( j \) zeta_(p^m)^(thin j)) b_s \( theta \, upright(bold(u)) \) =
   (sum_(rho in "Gal" \( H_(p^m s) \/ K \)) chi \( rho \) G \( X^rho \)) product_(q in S^compose)
   P_q \( chi \( sigma_q \) \) . $ <eq:source-10>]

 The character is extended by zero on nonunits in the Gauss sum,
   and $sigma_q$ is inverse translation by the oriented $V_q$-action.
   Let $b_w^0$ denote the first limiting series formed with $F_0$, without the non-$p$ depletions.
   Then, over the integral coefficient enlargement,
#[#set math.equation(numbering: n => "(11)")
 $ B_w & = upright("unit") dot.op \( b_w^0 \)^2 D \,\
D & = product_(q in S^compose) P_q \( chi \( "Frob"_(v_q) \) \) P_q \( chi \( "Frob"_(v_q) \)^(- 1) \) \,
  $ <eq:source-11>]

 where in this identity $chi$ is the universal power-series character and either place $v_q divides
   q$ may be chosen. For conductor $s = 1$, the central value is
#[#set math.equation(numbering: n => "(12)")
 $ B_w^(s = 1) \( 0 \) = plus.minus c_E^(- 2) log_(omega_E) \( P_K \)^2 P_p \( 1 \)^2 product_(q in S^compose)
   P_q \( 1 \)^2 \, $ <eq:source-12>]

 where $P_K$ is the single Hilbert-class trace of the conductor-one Heegner point under $phi.alt$.]
] <pair:interpolation>

#proof[
  Finite Fourier summation on $\( bb(Z) \/ p^m \)^times$ multiplies the inverse moment of a measure by the
    displayed Gauss sum. Transporting the frame in disk $frak(a)$ changes the root exponent by $delta_(frak(a))$.
    The correction $\[ t_(frak(a)) - eta_Gamma \( delta_(frak(a)) \) \]$ therefore makes its weight exactly the
    Artin character $chi$. The class-kernel description identifies the resulting sum over roots and disk centers
    with the sum over $"Gal" \( H_(p^m s) \/ K \)$.
  Apply (9). For sufficiently large $m$, the $V_p$ and $V_p^2$ terms factor through lower-conductor orbits,
    so their sums against the primitive character vanish. Each remaining quotient $V_q$ translates the orbit by
    $sigma_q$, with its level choices retained. This proves (10), with no averaging factor.
  Atkin–Lehner at the non-$p$ part of the primitive level reverses the non-$p$ orientations.
    On the newform quotient it acts by a sign; the change of base cusp is torsion.
    The raw logarithmic sum therefore changes only by that sign and a translation character.
    The same assertion holds when a subset of the non-$p$ orientations is reversed.
    The translating ideals are prime to $p$, so these translations can be chosen compatibly in the $p$-tower.
    Applying (10) at all high characters, followed by uniqueness for bounded series, gives (11).
    At the moving stages the group-like translations likewise have coefficientwise limits.
  At the trivial character, integration is evaluation at the disk center.
    Formula (9) now retains the $p$-Euler factor, because $V_p$ acts by translation on the conductor-one centers.
    The sum is taken once over the class group. The two orientation sums are translates of the same Hilbert trace
    up to sign. Recalling $G = c_E^(- 1) log_(omega_E) phi.alt$ gives (12). ◻
]

#thm([Lemma 6.3.])[
  (Removal of tame conductor variables).  #emph[Choose each new base disk by a descending isogeny from the
    preceding conductor. Setting a new tame variable equal to zero multiplies each single analytic series by
#[#set math.equation(numbering: n => "(13)")
 $ a_r - chi_(upright("old")) \( "Frob"_(v_r) \) - chi_(upright("old")) \( "Frob"_(v_r) \)^(- 1) . $ <eq:source-13>]

 The notation denotes the limit of the stage coefficients and character values.
   The determinant $L_w$ is multiplied by the square of this factor up to an integral unit.
   These assertions hold successively for any subset of the new variables, including removal of all tame variables.]
] <pair:trace>

#proof[
  The good Hecke correspondence at $r$, after subtracting its two horizontal split translations,
    is the trace from conductor $r s$ to conductor $s$. Its action on the character sum in (10) is (13).
    Transport the frames by polarization. Their exponents are $r_i^(plus.minus 1)$,
    which tend to $1$ modulo every fixed $p^m$. Thus the same identity holds at each fixed sufficiently high
    $theta$, simultaneously in the group rings of the tame variables that remain.
    The expressions defining $b_s$ are bounded as group polynomials.
    We can consequently pass to limits in those group rings; bounded character projectors are not required.
  For the arithmetic determinant, unramified inflation restores the full pair over each removed prime.
    The two singular determinants are the unramified Tate Euler polynomials at that pair.
    Since $r_i arrow.r 1$, their product is the square of (13) up to an integral unit.
    This is an identity of the marked integral determinant triangles, not a comparison after rationalization.
    Iterating with the old tuple fixed proves all the stated specializations.
    The factor need not be a unit at the central specialization. ◻
]

#thm([Lemma 6.4.])[
  (Descent of the analytic ideals).  #emph[The principal ideals generated by $b_w^(+)$, $b_w^(-)$, $b_w^0$,
    and $B_w$ descend to $R$. Each actual series differs from a generator over $R$ by an integral unit.]
] <pair:descent>

#proof[
  Extend arithmetic unramified Frobenius $phi$ at $w$ to fix the cyclotomic $p$-power roots.
    At every finite stage, (10) identifies its action on a raw CM sum with translation by a fixed local Artin
    element: the ring-class extension is abelian over $K$, so this action commutes with all labels.
    The Gauss coordinates are fixed. Passing to limits and testing at high finite characters gives,
    for each series in question,
  $ phi \( b \) = kappa b \, $
  where $kappa$ is group-like of augmentation $1$. On $cal(V)^(*)$, $phi$ is Witt Frobenius.
    There is a unit $e$, with constant coefficient $1$, satisfying $phi \( e \) = kappa e$.
    Solve recursively in total degree: at each step the remaining equation is $phi \( a \) - a = b_0$.
    It is soluble modulo $p$ because the residue field is algebraically closed,
    and successive lifting solves it in $cal(V)^(*)$. Then $b \/ e$ has coefficients fixed by Witt Frobenius,
    hence in $bb(Z)_p$. Products give the assertion for $B_w$.
    We continue to use the actual analytic series for value formulas and the descended generators for height-one
    ideal comparisons. ◻
]

=== 6.3 Primitivity of the analytic series <primitivity-of-the-analytic-series>

The preceding construction controls the period and Euler factors.
  The next argument provides the separate vertical input: no fixed power of $p$ is lost in the analytic series.
  We prove the required tame-stalk independence by ordinary deformation theory and monodromy.

#thm([Proposition 6.5.])[
  (Vertical analytic primitivity).  #emph[For each of the tuples under consideration and either $p$-adic place,
#[#set math.equation(numbering: n => "(14)")
 $ p divides.not B_w . $ <eq:source-14>]

]
] <pair:vertical-primitivity>

#proof[
  We first establish the independence statement in the elliptic case.
    Let $k = overline(bb(F))_p$, let $x$ be an ordinary maximal-order CM point with endomorphism ring $cal(O)_K$,
    and let $cal(R)$ be its algebraic local ring on the prime-to-$p$ modular tower.
    Thus a finite set of elements of $cal(R)$ comes from a common finite tame level;
    we do not replace $cal(R)$ by its completion. For $a_1 \, dots.h \, a_h in bb(Z)_p^times$, consider
  $ Phi : cal(R)^(⊗_k h) arrow.r k \[ \[ z - 1 \] \] \, wide
    f_1 ⊗ dots.h.c ⊗ f_h mapsto product_(i = 1)^h f_i \( z^(a_i) \) . $
  We will prove that $Phi$ is injective when the $a_i$ have pairwise inequivalent ratios under
  $ { alpha \/ macron(alpha) : alpha in K^times \, med alpha upright(" a unit at both primes over ") p } . $
  Suppose the prime kernel of $Phi$ is nonzero and choose $h$ minimal.
    Let $X$ be its irreducible relation locus in the product of the tame towers.
    Its projections to every proper product of factors are dominant by minimality.
    The common CM stabilizer preserves the kernel: its scalar Serre–Tate substitutions commute with all the $a_i$.
    Weak approximation in $K$ makes the ratios of its two local unit actions dense in $bb(Z)_p^times$.
    The local rigidity and normalization argument of [13] Proposition 3.11 and Corollary 3.13 therefore gives a
    finite tame-level model and a normalized branch over $\( x \, dots.h \, x \)$ whose completion is a formal
    subtorus. This branch contains $\( z^(a_1) \, dots.h \, z^(a_h) \)$.
    Write $Y$ for the normalization of the irreducible model.
    Dominance onto $h - 1$ factors and properness give $dim Y = h - 1$.
  Here is the global constraint on that formal subtorus. Pull back the product of the universal elliptic schemes
    to $Y$. The global canonical-coordinate map of [7] Sections 2 and 5 has, on a normal base,
    a cotorsion-free smooth kernel. Its annihilator $cal(N)$ is a smooth cocharacter subsheaf.
    Its rank can be evaluated on the chosen formal branch, where it is $h - 1$.
    The proof of [7] Proposition 5.3, applied to the normalization and this branch,
    consequently gives a dense smooth open $U subset Y$ on which the same rank is $h - 1$.
    The elliptic-factor idempotents of the product abelian scheme place $cal(N)$ inside the direct sum of its $h$
    diagonal Serre–Tate cocharacter lines. Each coordinate projection of $cal(N)$ is nonzero.
    Otherwise that elliptic deformation would be formally constant on $U$,
    contrary to the dominance of the corresponding projection of $X$.
    This construction uses the canonical-coordinate relation sheaf on a normal base;
    the ranks of two-coordinate projections alone do not determine its rank.
  Descend $Y$, $U$, the elliptic schemes, and their canonical-coordinate sheaves to a finite field.
    Suppose first that the $h$ generic elliptic factors are pairwise nonisogenous over an algebraic closure.
    Choose an odd prime $ell eq.not p$. After a finite etale cover of a smaller open $U$,
    all generic endomorphisms are defined and the joint arithmetic algebraic $ell$-adic monodromy group is
    connected. The semisimplicity and isogeny theorems apply to its finitely generated function field [34]
    Theorems 1.2 and 1.4. Each nonconstant elliptic factor has derived monodromy $upright("SL")_2$.
    The Lie algebra of the derived group is a subdirect product of these simple nonabelian Lie algebras.
    The Lie-algebra Goursat argument decomposes it into diagonal blocks:
    the kernel of a projection is an ideal, and a simple factor is either independent or identified with one of
    the preceding simple factors. A block meeting two factors identifies their standard two-dimensional
    representations on the derived group. The connected center acts on these representations by scalar characters
    whose squares agree, because their determinants are equal. The two characters therefore agree.
    The intertwiner is equivariant for the whole connected group,
    and the isogeny theorem over finitely generated fields of characteristic $p$ makes the two generic elliptic
    curves isogenous. Thus no such block is possible, and the derived monodromy group is $upright("SL")_2^h$.
    Passing to the connected group has also removed possible finite quadratic-twist correlations.
    These are the endomorphism and monodromy inputs used in [13] proof of Corollary 3.16.
  Chebotarev gives a closed point $u in U$ at which the elliptic Frobenius traces $c_1 \, dots.h \,
    c_h$ have pairwise distinct squares: the equations $c_i^2 =
    c_j^2$ define proper closed subsets of the monodromy group, whose $h$ derived factors vary independently.
    Let $alpha_i$ be the $p$-adic unit root at $u$, and put $q_u = \# k \( u \)$. If $alpha_i^2 = alpha_j^2$, then
  $ c_i = alpha_i + q_u \/ alpha_i = plus.minus \( alpha_j + q_u \/ alpha_j \) = plus.minus c_j \, $
  a contradiction. Arithmetic Galois descent Frobenius acts on the $i$-th Serre–Tate character line by
    $alpha_i^2$, since that line is the tensor square of the etale Tate line;
    it acts on the cocharacter line by $alpha_i^(- 2)$. These are distinct eigenvalues.
    The stable subspace $cal(N)_u ⊗ bb(Q)_p$ must therefore be a sum of coordinate axes:
    each eigenprojection is a polynomial in Frobenius. Its nonzero projection to every coordinate forces it to
    contain every axis, contradicting its rank $h - 1$.
  There is consequently a generically isogenous pair. Extend its isogeny over a normal finite cover of $Y$;
    homomorphisms between abelian schemes extend over a normal base.
    At a point above the chosen CM branch its specialization is a nonzero $alpha in "End"^0 \( x \) = K$.
    Serre–Tate functoriality and the formal curve in that branch give $a_i \/ a_j = alpha \/ macron(alpha)$,
    up to simultaneous inversion. One may see this before inverting $p$ by clearing denominators in the two local
    actions of $alpha$ and comparing exponents in $k \[ \[ z - 1 \] \]$;
    the map $b mapsto z^b$ from $bb(Z)_p$ is injective. Since $a_i \/ a_j$ is a unit,
    the two valuations of $alpha$ above $p$ agree. Rational scaling makes both zero without changing their ratio.
    This contradicts the stipulated inequivalence and proves injectivity of $Phi$.
    In particular, a sum of functions from distinct slots is constant only if every slot function is constant.
  We now work at $s = 1$, with one of the two non-$p$ orientations.
    The functions here are regular weight-zero ordinary functions at a maximal-order CM point.
    The weight-zero torsor descent in Proposition 41 places their reductions on the tame ordinary special fiber,
    not merely on a finite Igusa cover. The canonical multiplicative $p$-structure has the same deformation germ
    as this tame curve. Their germs therefore belong to the algebraic prime-to-$p$ stalks just considered.
  Suppose $b_1$ is zero modulo $p$. Restrict its measure to the open subgroup $eta_Gamma \( bb(Z)_p^times \)$ of
    $Gamma$. For each contributing class choose $lambda_(frak(a)) in
    bb(Z)_p^times$ with $eta_Gamma \( lambda_(frak(a)) \) = t_(frak(a))$.
    Pushing the measure through $eta_Gamma$ folds it over its kernel $mu_(p - 1)$.
    On transforms the assumed vanishing becomes
  $ sum_(frak(a)) sum_(zeta in mu_(p - 1)) F_(frak(a)) #scale(x: 120%, y: 120%)[\(]
    z^(zeta delta_(frak(a)) \/ lambda_(frak(a))) #scale(x: 120%, y: 120%)[\)] = 0 med \( mod med p \) . $
  The class sum includes exactly those classes that contribute to the indicated open subgroup.
    Pull back by the ideal isogenies that transport the frames to a common prime-to-$p$ level.
    This absorbs $delta_(frak(a))$ into the pulled-back function,
    so the exponent whose slot is to be tested is $zeta \/ lambda_(frak(a))$.
    Combine equivalent slots before applying the injectivity of $Phi$.
    An equivalence $alpha \/ macron(alpha)$ is realized by the germ of a CM quasi-isogeny.
    Since this ratio is a $p$-unit, rational scaling makes the isogeny prime to $p$.
  We describe the slot equivalent to $1$. Put $h = h_K$ and $frak(a)^h = \( x \)$. The class-sequence description gives
  $ lambda_(frak(a))^(thin h) = \( x \/ macron(x) \) xi $
  up to simultaneous inversion, where $xi$ is a torsion unit.
    If $zeta \/ lambda_(frak(a)) = alpha \/ macron(alpha)$, raise to a power killing $xi$ and $zeta$,
    and compare ideal valuations. The group of fractional ideals is torsion-free;
    cancellation of that power and of $h$ shows that a principal scaling of $frak(a)$ is conjugation invariant.
    This is cancellation in the fractional ideal group, not division by $h$ in $bb(Z)_p$.
    Such a class is represented by a product of ramified prime ideals, each used once or omitted.
  Conversely, choose those ramified products as representatives.
    Their squares are rational principal ideals, so their images $t_(frak(a))$ in the torsion-free group $Gamma$
    are zero; we may take $lambda_(frak(a)) = 1$. Only $zeta = plus.minus 1$ can belong to the slot of $1$,
    since a torsion element of $K^times$ is then a sign. The ramified products represent these classes twice,
    paired by complementary subsets. To check the multiplicity, if a ramified product is $\( alpha \)$,
    then $alpha \/ macron(alpha) = plus.minus 1$. The plus sign makes $alpha$ rational and forces the subset to be
    empty; since the discriminant is odd and fundamental, the minus sign makes it a rational multiple of
    $sqrt("disc" \( K \))$ and forces the subset to be full. The scaling between complementary products has
    conjugate ratio $- 1$. Thus the two expansions with exponents $plus.minus
    delta_(frak(a))$ are exactly the two pullbacks indexed by the complementary ramified products.
  This combined function is nonconstant. Indeed pass to a common tame level and choose a Tate cusp at which all
    these prime kernels are multiplicative. They occur at distinct primes, disjoint from the oriented split level,
    so the choices can be made simultaneously; retain multiplicative type for those oriented cyclic groups too.
    The identity translate has first positive Fourier coefficient $1$.
    Every other ramified product has degree greater than one, and its quotient expansion begins at a larger index.
    No cancellation of that coefficient is possible. The injectivity of $Phi$ now contradicts the displayed zero
    sum. Hence the conductor-one series is nonzero modulo $p$ for each orientation.
  Finally apply Lemma 43. Each new factor (13) remains nonzero modulo $p$:
    its true $Gamma$-exponent is nonzero by the tuple construction.
    Its powers therefore vary nontrivially in $bb(F)_p \[ \[ t \] \]$,
    and the displayed Laurent polynomial cannot vanish identically.
    After setting the new variables to zero we obtain a product of nonzero reductions.
    The full series consequently has nonzero reduction, proving (14). ◻
]

=== 6.4 Local comparison at high finite characters <local-comparison-at-high-finite-characters>

Fix a sufficiently high finite character $theta$ of $Gamma$ and put

$ A_theta = bb(Z)_p \[ theta \] \[ \[ upright(bold(u)) \] \] \[ 1 \/ p \] . $

First adjoin the unramified measure coefficients, obtaining

$ tilde(A)_theta = cal(V)^(*) \[ theta \] \[ \[ upright(bold(u)) \] \] \[ 1 \/ p \] . $

Let $A'_theta$ be a finite coefficient extension of this ring containing the Gauss coordinates $mu_(p^m)$ and the
  normal resolvents for the fixed ramified local character fields used below.
  More precisely, take the complete valuation ring of their compositum with $"Frac" \( cal(V)^(*) \[ theta \] \)$,
  form its power-series ring in $upright(bold(u))$, and invert $p$.
  This finite extension is faithfully flat and may depend on $theta$.
  No bound on its ramification as $theta$ varies is asserted or needed.
  Since $p$ is now inverted, these fixed nonzero constants, together with the point-clearing factors, are units.
  They will be allowed only in this characteristic-zero comparison.
  Divisibility of series already in $tilde(A)_theta$ descends along this faithfully flat extension,
  as does equality of their principal ideals. Proposition 45 supplies the separate integral information at $p$.

#thm([Proposition 6.6.])[
  (Divisibility at high finite characters).  #emph[For every sufficiently high finite $theta$,
#[#set math.equation(numbering: n => "(15)")
 $ B_w \( theta \, upright(bold(u)) \) in L_w \( theta \, upright(bold(u)) \) A'_theta . $ <eq:source-15>]

 With the same global character variable, the two nonzero quotients for $w$ and $macron(w)$ are associates in
   $A'_theta$.]
] <pair:finite-divisibility>

To prove the proposition, we first identify the two $p$-local Kummer lines and then express the quotient
  valuations through the all-Kummer determinant. The final step will be a sequence of horizontal switches that
  preserves these valuations.

At a height-one prime of $A_theta$, the moving-place local complexes are acyclic.
  Their inertia detects their own variable $u_j$. On the divisor $u_j = 0$,
  Frobenius-minus-one is still generically invertible: its scalar contains the true exponent of that moving prime,
  whose $theta$-value has arbitrarily high order. For large $theta$,
  even setting the other variables to zero cannot give either of the two elliptic eigenvalue exceptions.
  The cardinality twist tends to $1$.

At fixed $q in S^compose$, replace the full condition by the unramified condition after inverting $p$.
  The conditions are exactly orthogonal, by the local comparison in Section 3.
  The product of the removed singular determinants is $D$ in (11), and is nonzero at these tests.
  The same replacement is available on horizontal height-one localizations of $R$.
  Its strict determinant is therefore $L_w \/ D$, up to a unit.
  This calculation uses the inverse determinant convention throughout.

#thm([Lemma 6.7.])[
  (The two local Kummer lines).  #emph[At each $p$-adic place and after fixing $theta$ as above,
    degree-one local cohomology splits over $A_theta$ into a free Kummer line and its free complementary line.
    The paired Kummer conditions at conjugate places are exactly orthogonal.
    After extension to $A'_theta$, the logarithm identifies the Kummer line with a free line,
    and its value on the weighted CM point classes is (10), with the factor $c_E$ restored for $log_(omega_E)$.
    These assertions hold for bad reduction at $p$ as well.]
] <pair:local-lines>

#proof[
  Let $P_v \/ K_v$ be the finite totally ramified extension cut out by the inertia part of $theta$,
    and separate its unramified part. Write $G_v = "Gal" \( P_v \/ K_v \)$, $cal(O)_theta = bb(Z)_p \[ theta \]$,
    and $Delta = "Gal" \( D_oo^(upright("loc")) \/ K_v \) tilde.eq bb(Z)_p$,
    where $D_j^(upright("loc")) \/ K_v$ is the unramified extension of degree $p^j$.
    Choose its arithmetic Frobenius generator $gamma_(upright("ur"))$.
    The Shapiro coefficient ring before finite-character projection is
  $ cal(O)_theta \[ G_v \] \[ \[ Delta \] \] \[ 1 \/ p \] . $
  Project by the character idempotent corresponding to the chosen cohomological character.
    The resulting scalar ring is $Lambda_theta = cal(O)_theta \[ \[ X \] \] \[ 1 \/ p \]$, with $1 + X =
    gamma_(upright("ur"))$. If $e_(v j) in bb(Z)_p$ are the tame Frobenius exponents at $v$,
    its map to the comparison ring is
  $ Lambda_theta arrow.r A_theta \, wide 1 + X mapsto alpha_v product_(j = 1)^d \( 1 + u_j \)^(e_(v j)) \, quad
    alpha_v = theta_(upright("ur")) \( "Frob"_v \) . $
  The exponent vector is nonzero. Divide it by its largest common power $p^a$,
    then complete the resulting primitive vector to a $upright("GL")_d \( bb(Z)_p \)$ coordinate change.
    In the new group-power coordinates the image is $alpha_v \( 1 + y_1 \)^(p^a)$. The equation
  $ \( 1 + y_1 \)^(p^a) = alpha_v^(- 1) \( 1 + X \) $
  is monic and distinguished of degree $p^a$ in $y_1$. It makes the one-variable substitution finite flat;
    adjoining the remaining variables preserves flatness. The marked local models can therefore be base-changed
    through this map.
  We first control lattices uniformly in $j$, with constants allowed to depend on $theta$.
    A sufficiently small additive lattice exponentiates because the ramification is fixed.
    For an upper bound pass to a fixed extension with semistable reduction.
    The component groups are bounded after adjoining $P_v$ and making unramified base changes.
    Choose $theta$ nontrivial on sufficiently deep inertia over this fixed field.
    After multiplication by the bounded component exponent, inertia acts trivially on the special points of the
    identity component. The Neron base-change map is surjective on these geometric semiabelian points:
    its map on rational auxiliary-adic Tate modules identifies the inertia invariants,
    which are unchanged under finite extension once inertia is unipotent.
    Thus an inertia difference takes points into the formal kernel.
    A further fixed multiple takes them into a small logarithm lattice.
    On the projected eigenspace that difference is a nonzero constant, giving the upper bound.
    Use the unnormalized integral projection to obtain the same bounded-exponent assertion for the torsion
    logarithm kernel. The argument applies to the inverse character as well.
    Trace-dual bounds follow from the bounded different of the fixed ramified extension.
  Integral Kummer and local duality on the Shapiro tower give an exact sequence with ends the compact points and
    the dual of compact points; transitions are norms and dual inclusions.
    Compactness makes the inverse limit exact. One can identify both ends explicitly from trace-compatible
    integral normal generators in the unramified tower. Choose their successive traces compatibly and their total
    trace equal to $1$. Modulo $p$, a unit augmentation generates the cyclic group-algebra module,
    so these are normal generators integrally as well. For the fixed ramified factor use a rational normal basis
    and its bounded trace dual. Before projection, the additive inverse limit is the regular rank-one module over
    $cal(O)_theta \[ G_v \] \[ \[ Delta \] \] \[ 1 \/ p \]$. Apply the finite-character idempotent to this
    additive module. The projected logarithm lattice bounds identify the projected compact point module with it
    after inverting $p$; the projected torsion kernel is killed by the fixed bound already proved.
    Thus the compact point endpoint is free of rank one over $Lambda_theta$.
    The bounded trace-dual comparison gives the same conclusion for its dual endpoint.
    Applying the displayed flat substitution yields the two free lines over $A_theta$.
    The torsion bounds kill higher cohomology; invariants vanish too. The full local complex consequently splits.
    Shapiro compatibility of the cup product, finite Kummer isotropy, and local duality give exact orthogonality,
    including the nullhomotopies in these split complexes.
  Form the logarithmic group polynomials with the unnormalized character weights before making the substitution.
    The normal resolvent on the ramified factor is nonzero; on the unramified factors the compatible resolvent is
    a unit because its total trace is $1$. Thus logarithm is the stated line isomorphism.
    To identify transferred point classes, specialize first to bounded cyclic quotients.
    Freeness with coset bases identifies the substitution with the corresponding finite unramified layer.
    At sufficiently large stages the local ring-class fields contain that layer,
    by the nonzero Frobenius exponent, and contain the fixed ramified character field.
    Trace the stage classes to these fixed local fields and apply the finite-level logarithmic calculation.
    Membership in the Kummer line is detected on all these finite quotients of its free complementary quotient.
    The logarithmic expressions are detected in the same way.
    The fixed-ramification bounds remain valid through the unramified growth at $p$,
    so passage to the bounded limits gives exactly (10). ◻
]

=== 6.5 Horizontal switches and divisibility <horizontal-switches-and-divisibility>

We now compare the order of the analytic series with the arithmetic determinant at a height-one prime $frak(p)$ of
  $A_theta$. Write $v_(frak(p))$ for its normalized valuation.
  Let $Z$ be the Kummer class obtained by unnormalized weighted corestriction of the CM points of conductor $p^m
  s$. One common fixed point multiple clears all descent requirements.
  Use unramified conditions at the fixed non-$p$ support, the two Kummer lines at $p$,
  and full conditions at moving primes. Denote this complex by $C_F$.
  At $frak(p)$ it is self-dual under conjugate transport and the Weil pairing; the moving full complexes are acyclic.

In a basis of the Kummer line at $w$, let $p_0 in A_theta$ be the localization of $Z$. By Lemma 47 and (10),

$ B_w \( theta \, upright(bold(u)) \) = upright("unit in ") A'_theta dot.op p_0^2 D . $

The constants included here are $c_E$, the Gauss sum, and the common clearing factors;
  they are units only because $p$ has already been inverted.
  Both $B_w \( theta \, upright(bold(u)) \)$ and $L_w \( theta \, upright(bold(u)) \)$ are nonzero for all
  sufficiently high $theta$, by primitivity, (1), and bounded-series preparation. Hence $p_0 eq.not 0$.
  The strict comparison shows that the generic ranks of $C_F$ are one in degrees one and two.
  For its point and the calibrated class-functional dual, the determinant triangle gives

#[#set math.equation(numbering: n => "(16)")
 $ d #scale(x: 120%, y: 120%)[\(] C_F \, \( Z \, Z^or \) #scale(x: 120%, y: 120%)[\)] = 2 v_(frak(p)) \( p_0 \) -
   v_(frak(p)) \( L_w \/ D \) . $ <eq:source-16>]

This is the line comparison of [24] Section 3, equation (D),
  with the integral pairings and inverse determinant of Section 3.

#thm([Lemma 6.8.])[
  (Inert derivative coordinates).  #emph[There are fresh inert good prime sequences $ell$, with $ell arrow.r -
    1$ and Tate Frobenius tending to $J = rho_T \( tau \)$ for complex conjugation $tau$,
    for which the limiting local degree-one cohomology splits into finite and transverse planes.
    Their mixed pairing is, up to a unit, $chevron.l x \, J y chevron.r$, and both planes are self-annihilating.
    For each fixed finite sequence of switches, there is a compatible family of descended weighted Kummer classes
    $Z_I$, indexed by the subsets occurring in that sequence, with $Z_diameter = Z$.
    The class $Z_I$ uses the product of the ring-class derivatives $D_ell$ for $ell in I$;
    its local conditions are transverse at $I$ and the original conditions at the other places. These classes satisfy
$ f_(upright("loc")) \( Z_(I union ell) \) = 0 \, wide s_(upright("loc")) \( Z_(I union ell) \) =
  J f_(upright("loc")) \( Z_I \) . $

 All prior local conditions can be retained, with one common point scaling for the classes in the fixed finite
   sequence.]
] <pair:derivatives>

#proof[
  Choose the Frobenius sequence $gamma_i arrow.r tau$ on the full Tate module.
    Then $a_f \( ell \) arrow.r 0$, while $gamma_i^2$ acts trivially on the ring-class fields by the dihedral
    relation. The old characters are unramified at $ell$. In the cyclic inertia resolution the residue conjugating
    power tends to $1$. Thus the limiting full local cohomology is split free.
    Evaluation on $gamma_i^2$ and on a tame generator gives the finite and transverse coordinates.
    Retain invariants in the lower condition and omit $H^2$ in the upper condition,
    as required by the square-switch lemma. Conjugate transport through $gamma_i$,
    together with local reciprocity, gives mixed pairing $chevron.l x \, J y chevron.r$.
    Pure scalar cups vanish and the mixed scalar cup is a unit.
    These are exactly the Weil-plane hypotheses of that lemma.
  Here is the derivative calculation, following [24] Section 9, #emph[Inert derivative identity], equation (K),
    with the odd-$p$ precision specified. The relative ring-class order at an inert prime is $ell + 1$,
    since the only order units are signs. For its generator $sigma_ell$ use
  $ D_ell = sum_(j = 1)^ell j sigma_ell^j . $
  Writing $"Tr"_ell = sum_(j = 0)^ell sigma_ell^j$, the group-ring identity is
  $ \( sigma_ell - 1 \) D_ell = \( ell + 1 \) - "Tr"_ell . $
  If $Y$ is the upper point and $X$ the lower point, the Hecke trace gives $a_ell X$,
    after the common cusp multiple, and supersingular reduction gives $tilde(Y) = F_ell tilde(X)$.
    Choose growing precision $p^a$ slowly enough that $p^a divides ell + 1$, $p^a divides a_ell$, and $gamma_i^2 =
    1$ modulo $p^a$. The group-ring derivative identity then makes the upper Kummer class invariant to that precision.
  Inflation and restriction descend it after a fixed multiple.
    The needed uniform bound on invariant torsion follows from Bogomolov’s homothety theorem [3]:
    take $h in G_K$ scalar sufficiently close to $1$, with square different from $1$.
    The element $h tau h tau$ kills every ring-class action and acts on the Tate module by that scalar squared.
    It bounds torsion over all fields in use. At the old $p$-places,
    descent is unramified and retains the Kummer condition after a fixed component multiple.
    Lang’s theorem handles the connected special points; the formal-group assertion follows from induced additive
    successive quotients and passage to the limit. Component groups remain bounded under unramified base change
    above the fixed ramified extensions. The same argument retains unramified conditions at the old non-$p$
    support. Include all these multiples in one scale for every switched class.
  To verify the coordinates, suppress that scale and choose $p^a Q = X$, $p^a W = D_ell Y$.
    If $b$ is the descended upper cocycle, the crossed identity makes $\( sigma_ell - 1 \) W -
    b \( sigma_ell \)$ fixed by the upper-field subgroup. Multiplication by $p^a$ gives $\( ell + 1 \) Y -
    a_ell X$, so it differs from
  $ \( \( ell + 1 \) \/ p^a \) Y - \( a_ell \/ p^a \) X $
  by bounded-exponent torsion. After reduction, inertia is trivial.
    Thus, to the retained precision, $b \( sigma_ell \)$ gives
  $ \( a_ell - \( ell + 1 \) F_ell \) tilde(Q) = \( F_ell - a_ell \) \( F_ell^2 - 1 \) tilde(Q) \, $
  where the equality is Eichler–Shimura. The lower Kummer cocycle, evaluated on the residue Frobenius $gamma_i^2$,
    has finite coordinate
  $ f_(upright("loc")) \( Z_I \) = \( F_ell^2 - 1 \) tilde(Q) $
  at the retained precision. The displayed value of $b \( sigma_ell \)$ is the transverse coordinate of the upper
    class. Consequently it equals $\( F_ell - a_ell \) f_(upright("loc")) \( Z_I \)$.
    Passing to the prescribed limit gives $F_ell - a_ell arrow.r J$,
    which proves the asserted transverse identity. For the upper finite coordinate,
    $accent(D_ell Y, ̃)$ has an $F_ell^2$-fixed $p^a$-division obtained using $ell \( ell + 1 \) \/ \( 2 p^a \)$
    times $F_ell tilde(X)$; the ambiguity is killed by $F_ell^2 - 1$.
    Reduction detects prime-to-$ell$ torsion, proving the zero finite coordinate.
    The calculation applies on each translate before weighted corestriction,
    with any earlier derivative factors already present. It therefore proves the two identities simultaneously at
    all previous switches and with the identical common scale. ◻
]

#proof[
  We show that (16) is nonnegative at every height-one test.
    If fiber degree one has dimension greater than one, choose two independent classes,
    one being a primitive reduction from the generic line. They admit a rank-two evaluation on the finite plane at
    a suitable inert prime.
  We spell out this detection because the same assertion must hold after previous switches.
    Lemma 12 realizes the fiber classes on the product of the stage Galois groups.
    Restriction to the joint kernel of the full Tate and ring-class actions detects them:
    on the image quotient the central element $h tau h tau$ just used has scalar difference from $1$ invertible.
    Global invariants vanish. The Selmer classes inject into unrestricted cohomology by the local hypotheses,
    and the complexes have amplitude $1 \, 2$ by duality. Let $kappa \( frak(p) \)$ be the testing residue field,
    and write
  $ W = \( V ⊗ kappa \( frak(p) \) \) chi \, wide W^c tilde.eq \( V ⊗ kappa \( frak(p) \) \) chi^(- 1) . $
  Conjugate transport makes these the two summands of the induced representation after adjoining diagonal $tau$;
    the element $tau$ exchanges them through the elliptic involution $J$.
    They are absolutely simple and nonisomorphic: their scalar twists have distinct determinants because the
    inertia character has sufficiently high order. For the two independent classes and their conjugates,
    joint evaluations on the kernel therefore span $W^2 xor \( W^c \)^2$.
    For an element $eta_b$ of that kernel, evaluation on $\( tau eta_b \)^2$ is additive in the kernel
    evaluations. On a tuple $\( a_1 \, a_2 \; b_1 \, b_2 \)$, the operator $1 +
    tau$ followed by projection to $W^2$ gives
  $ \( a_1 + J b_1 \, med a_2 + J b_2 \) . $
  This map is surjective, so its evaluations still span both copies needed for a rank-two test.
    An additive subgroup contains the integer grid generated by any finite spanning set;
    in characteristic zero this grid cannot lie in a proper rank-defect locus. A rank-two choice follows.
    Finite Chebotarev realizes these evaluations to increasing precision by primes whose Frobenius agrees with
    $tau eta_b$.
  Apply Lemma 14, using Lemma 48. The fiber dimension drops by two;
    the generic ranks and the valuation of the point/class-functional tensor are preserved.
    The fiber dimension cannot become zero: upper semicontinuity bounds it below by the generic rank one.
    Thus the repeated two-dimensional drops end at dimension one.
    There the complex is homotopy equivalent to two free lines with zero differential and perfect duality.
    Its integral point tensor has nonnegative determinant valuation. All fixed scales are units at this test.
    Thus (16) is nonnegative. The height-one criterion in the UFD $A_theta$, and its coefficient extension, gives
  $ p_0^2 \/ \( L_w \/ D \) in A'_theta \, $
  which is (15).
  For the association assertion, keep the global character unchanged and perform the same comparison at
    $macron(w)$. At conductor $p^m s$, for large $m$, the canonical connected quotient lowers the Serre–Tate
    parameter order by $p$. It is the unique ascending edge in the CM isogeny graph.
    The required fixed number of cyclic $p$-level edges therefore gives the same level along the class orbit for
    the two choices of $p$-adic place. Their points agree up to the non-$p$ Atkin–Lehner operations and
    translations already considered. The weighted classes differ only by units in $A_theta$;
    the cuspidal differences are killed. Hence the all-Kummer complex and its tensor in (16) are the same up to
    units at every height-one test. The two quotient valuations coincide, and the quotients are associates.
    Contracting the equal principal ideals along the finite faithfully flat coefficient extension gives the same
    association over $tilde(A)_theta$. The high-conductor condition is essential here;
    this argument does not compare two arbitrarily normalized logarithmic lines at a low-conductor specialization. ◻
]

#thm([Corollary 6.9.])[
  (The integral comparison quotient).  #emph[Using the descended analytic ideals, the fraction
$ U_w = B_w \/ L_w $

 is represented by an integral series, and $p divides.not U_w$.
   Removing any newly added tame variables specializes it to the old quotient times an integral unit.
   This includes removal of all tame variables, leaving the genuine anticyclotomic line.]
] <pair:integral-quotient>

#proof[
  By (1), $L_w$ is nonzero modulo $\( p \, t \)$. Lemma 18 therefore applies to Proposition 46.
    For clarity, make $L_w$ distinguished in one tame variable by an integral group-power change and divide $B_w$
    by it integrally. At every sufficiently high character of $t$,
    the remainder is zero after inverting $p$ and extending coefficients to $A'_theta$.
    Faithful flatness descends this vanishing to $tilde(A)_theta$; the monic quotient has no $p$-torsion,
    so it is zero integrally there. Each bounded coefficient of the remainder vanishes at all those characters and
    hence vanishes identically by one-variable Weierstrass preparation. This proves integral divisibility.
    Since $p divides.not B_w$, the integral quotient has no factor $p$.
  Lemma 43 restores the same squared factor in numerator and denominator on setting each new variable to zero.
    That factor is nonzero, and the determinant comparison unit is integral.
    Cancelling in the fraction field proves the asserted specialization identity.
    Integrality of the larger quotient then makes the specialization integral as well.
    There is no loss of precision in this step. ◻
]

We have obtained the integral quotient, its exact specialization law,
  and association of its high-character specializations at the two $p$-adic places.
  Its possible horizontal divisors remain. The next two sections construct the theta implication needed to exclude them.

== 7 Theta congruences at a characteristic-zero point <sec:theta>

Fix the odd prime $p$ and the fields $K \, F \, L$ chosen in Section 2.
  This section supplies the analytic input for the theta implication.
  Its input is a zero of the undepleted series $b_w^0$ of Section 6,
  at a characteristic-zero point of the deformation space. Its output is a sequence of integral ordinary theta
  sections whose constant Fourier–Jacobi coefficients tend uniformly to zero at that point.
  The next section supplies a nonconstant coefficient of bounded valuation and extracts a Selmer class.
  Both parts must use the same finite group characters, including the characters of increasing conductor at $p$.

We retain the CM type induced by the distinguished place $w$ of $K$.
  Write $cal(C)$ for the algebraic character of the norm-one torus of $K \/ bb(Q)$ with infinity type $s mapsto
  s$, and also for its norm pullback to $L \/ F$. Its finite conductor is supported at fixed split places away
  from $p$. Its $p$-avatar is denoted by $hat(cal(C))$. In the distinguished unit position coordinates the avatar
  contributes the first power of the coordinate; after norm pullback it contributes the product of the two
  coordinates. This is the character and the reciprocity normalization of [23] Section 2, “Coefficient, character,
  and measure conventions”. Fix a sufficiently narrow weight branch.
  We require that difference powers of $hat(cal(C))$ on this branch factor through the free anticyclotomic group
  $Gamma$ used in Section 6. Indeed a fixed power kills its finite conductors away from $p$ and its torsion
  character; the anticyclotomic ray-class group unramified away from $p$ has free rank one.
  The resulting character on $Gamma$ has nonzero logarithmic direction,
  as is seen on the distinguished local units. Narrowing this branch does not restrict how large its positive
  integer weights can be.

=== 7.1 Auxiliary tests and the point of evaluation <auxiliary-tests-and-the-point-of-evaluation>

The compact theta source and the target are the unitary groups of

$ A = \( L^2 \, 1_2 \) \, wide W = B xor bb(H) \, wide B = \( L^2 \, b_0 sqrt(D) thin 1_2 \) \, wide bb(H) =
  L e xor L f . $

Here $A$ is Hermitian, $W$ is skew-Hermitian, $b_0 in F^(times \, +)$ is a $p$-unit,
  and the line coefficients have the even valuation required for matched self-dual lattices at nonsplit finite
  places. The auxiliary-field conditions, including $\( D \/ \| D' \| \) = 1$,
  give this choice by the norm-invariant calculation in [23] Equations (4.1)–(4.2).
  The target has signature $\( 3 \, 1 \)$ at both real places of $F$.
  Use the trace additive character and unit self-dual position coordinates at $p$.
  Order the distinguished columns as $\( e \, B_1 \, B_2 \, f \)$, with $e$ in the multiplicative direction.

Let $pi$ be the compact automorphic representation obtained from the weight-two form of $E$ by real quadratic base
  change and Jacquet–Langlands transfer. Its infinity type and central character are trivial.
  Its standard base change to $L$ is cuspidal, because the auxiliary fields avoid the inducing field in the CM
  case. Its elliptic local parameters are tempered. At nonsplit finite places it has the spherical vectors
  prescribed by the matched lattices; the level primes split completely in $L$.
  These are precisely the cuspidality and local hypotheses used for the compact theta and binary period
  constructions in [23] Sections 4–5. We make no assumption on $pi_p$.

#thm([Lemma 7.1.])[
  (Auxiliary tests).  #emph[One may choose two sets of fixed finite theta data with the following properties.
    Their extra rational good primes requiring nonspherical target controls are split completely in $L$,
    are different from $p$, and the two sets are disjoint. Outside these sets and the elliptic bad primes,
    the target tests are spherical. At an unramified-twist Steinberg place the source vector is Iwahori invariant
    and the target test has line-stabilizer parahoric level. At an additive place fixed nonspherical tests are
    permitted.]
  #emph[For either set there are a compact vector $phi in pi^or$ and a finite-order character $d_0$ of $\[ T \] =
    T \( F \) without T \( bb(A)_F \)$, where $T = upright(U) \( L e_2 \)$, such that
$ I_T \( phi \, d_0 \) = integral_(\[ T \]) phi \( s \) d_0 \( s \) thin d s eq.not 0 . $

 They retain the stated spherical and Iwahori conditions, and $d_0$ is unramified there.
   For the two lines $L B_j$ in $B$, let $theta.alt_(j \, d)$ denote the unary theta function with normalized
   position monomial of degree $d$. Its splitting character contributes a fixed shift $c_j$ to the infinity
   weight, with $c_1 + c_2 = 1$. There are compatible characters $xi_(j \, d)$ of weight $d + c_j$ such that,
   when $d_1 + d_2 + 1 = m$,
$ xi_(1 \, d_1) xi_(2 \, d_2) = cal(C)^m d_0 \, wide T_j \( d \) =
  integral_(\[ upright(U) \( 1 \) \]) theta.alt_(j \, d) \( s \) xi_(j \, d) \( s \)^(- 1) thin d s . $

 The tests with unit position support at $p$ can be chosen so that $T_1 \( d_10 \)$ and $T_2 \( d_20 \)$ are
   separately nonzero at positive integers $d_10 \, d_20$. The integer $d_10 + d_20 +
   1$ is divisible by the fixed torsion orders and by an arbitrarily prescribed fixed power of $p$.]
] <theta:auxiliary-data>

#proof[
  The ray-character construction allows its additional conductors at arbitrarily chosen sufficiently deep split
    places: imposing that the ratio of a principal idele to its conjugate be $1$ at such a place removes the
    finite unit obstruction, after which the character extends over the finite ray-class quotient.
    The same construction gives the weight and inverse unary splitting characters.
    Neat level may also be imposed at a new split place. Carry out these choices twice,
    avoiding the finite set already used.
  The required spherical tests at an unmarked split place can be seen in matrix coordinates.
    Choose integral $e \, B_1 \, B_2$ columns, and scale the $f$ column dually to the additive conductor.
    Their mixed position lattice contains the primitive norm-one orbit.
    Conjugate the hyperspecial to these bases if necessary. On a split unary line,
    the integral lattice test is torus-unit invariant and its diagonal Mellin integral is the nonzero central Tate
    integral. The absolute-value half shift in the oscillator and temperedness give its nonzero value;
    fixed volume and uniformizer powers are nonzero. Thus these local tests may be retained in the unary
    nonvanishing construction. At nonsplit places use the matched hyperspecial tests.
    Refining a metaplectic multiplier or cusp level for an auxiliary calculation does not impose a new target
    Hecke control at that place.
  Start with a nonzero compact vector having the required invariances.
    Translate at a free split place until its restriction to $T$ is nonzero.
    More explicitly, the torus supplies determinants, and strong approximation for $upright("SU") \( A \)$ away
    from that split place places the other components in their prescribed compact opens.
    Fourier expansion of this nonzero function on the compact torus quotient gives $d_0$.
    Its unramifiedness at the retained compact places follows from invariance.
    A fixed diagonal translation at $p$ makes the vector invariant under the integral lower unipotent without
    making its torus period zero.
  Apply the simultaneous unary nonvanishing lemma of [23] Lemma 6.2.
    Its inputs here are coherent matched line pairs, unramified data at nonsplit finite places,
    self-dual critical unary characters of parallel infinity weights $d_j + c_j$ with nonnegative remaining type,
    a reduction prime greater than two split completely in $L$, and a split degree-one variation prime.
    Those primes can avoid all the fixed sets just prescribed.
    Inverse variation of the two characters preserves their product.
    The split-line calculation above retains the prescribed unramified tests;
    the one-dimensional local Hom space identifies them with the nonzero local functional.
    At $p$ use the unit-character and unit-cut tests of that lemma.
    Its congruence choice gives the asserted sum of weights. The analyticity branches depend on powers of $cal(C)$
    and on fixed CM scales, not on the new finite-order coefficients; hence they can be narrowed,
    including the $Gamma$ condition above, before making the nonvanishing choices. ◻
]

Include the fixed split primes in both sets in the exponent conditions for the moving-prime tuple.
  Distinct such primes have linearly independent exponent vectors, as specified in the tuple construction.
  They need not be inserted into the depleted set $S^compose$:
  at a primitive strict test, adding an unramified good place does not change the complex.

Write $R = bb(Z)_p \[ \[ t \, upright(bold(u)) \] \]$ for the deformation ring,
  with the fixed coefficient extension understood when needed.
  An interior point is a tuple $z = \( t \, upright(bold(u)) \)$ in the maximal ideal of the integers of a finite
  extension of $bb(Q)_p$. A horizontal divisor is a height-one prime not containing $p$.

For either elliptic representation, a primitive strict test at a specified side $a in { w \,
  macron(w) }$ uses the strict condition at $a$, the full condition at the other $p$-place,
  unramified conditions at the fixed places away from $p$, and the permitted full conditions at moving places.
  We will use open sets where the local invariant groups vanish,
  so the global degree-one cohomology is the corresponding Selmer group.

The fixed-place exceptional polynomials below have two concrete sources.
  A spanning denominator is a nonzero minor of a finite matrix expressing specified Schwartz vectors as
  combinations of controlled translates. A binary separation polynomial is a product of resultants between the
  two-dimensional elliptic factor and the final factors $\| dot.op \|^(- 1 \/ 2) \, \|
  dot.op \|^(1 \/ 2)$ in the standard theta parameter, after norm-power shifts with exponents between $-
  4$ and $4$; its nonvanishing excludes linkage between these factors by the norm powers occurring in the local
  separation test. At a moving prime the inverse fake Euler factor is the degree-two reciprocal of the central
  local Euler factor formed from the bare elliptic Satake parameters and the scalar uniformizer value,
  discarding scalar inertia. These definitions identify the tests needed for point selection before their use in
  the binary comparison.

#thm([Lemma 7.2.])[
  (Choice of a point).  #emph[Let $frak(p)$ be a horizontal divisor on which $b_w^0$ vanishes.
    Fix a strict side for each of the two elliptic representations,
    and suppose both corresponding primitive strict cohomology groups vanish generically on $frak(p)$.
    There is an interior point $z_0 = \( t_0 \, upright(bold(u))_0 \)$ on this divisor,
    over a fixed finite extension $k \/ bb(Q)_p$, retaining their vanishing and the following properties.]
  #emph[The local $H^0 \, H^2$ vanishings at $p$ and the acyclicity of the moving local complexes hold for both
    elliptic representations, with the conjugate and $L$-restricted tests as required.
    One of the two sets of auxiliary tests in Lemma 50 has nonzero fixed-place spanning and binary separation
    denominators at $z_0$. At every moving prime the inverse fake Euler factor can be chosen nonzero in the
    limiting test. Binary separation there can be tested on inertia when the tested character is ramified,
    and on Frobenius when it is unramified.]
] <theta:test-point>

#proof[
  The cohomological conditions are open conditions on the divisor:
    they are the nonvanishing of minors of the finite free models.
    Their generic validity was proved for the horizontal tests in Sections 3 and 6.
    The asserted absence of the two jumps is another such open condition.
  At a fixed split good prime the additional exceptional conditions are zeros of finitely many Laurent polynomials
    in its unramified scalar parameter. These are the spanning denominators of [23] Lemma 6.4 and the Frobenius
    separation resultants of [23] Equation (8.11) and Lemma 8.6.
    They are nonzero at trivial scalar and weight zero. The parameters at the two $F$-places are powers or inverse
    powers of the single parameter at the rational prime. Two different rational primes cannot both give
    exceptional identities on $frak(p)$: their independent exponent vectors make equations fixing both parameters
    to algebraic values have codimension at least two. One may verify this after a finite flat power change of
    multiplicative coordinates, which diagonalizes the two exponent vectors.
    At most one rational prime is therefore identically exceptional,
    and one of the two disjoint auxiliary sets avoids it. Avoid the remaining finitely many zero loci at the point.
  For a moving prime, the inverse fake Euler factor is a polynomial of degree at most two in the character value
    of a uniformizer. Changing the uniformizer by a unit leaves the cleared formula unchanged:
    the only term using the fake factor as an actual Euler factor is multiplied by the unit norm sum,
    on which the character is trivial. If the tested unit character is nontrivial, it has at least three values,
    since $p$ is odd. A unit change avoids the two possible roots.
    If it is identically trivial on the divisor, its own coordinate is $u_j = 0$,
    and the trace condition in the moving-prime construction makes the limiting Euler determinant nonzero.
    The same trace condition gives the Frobenius separation resultants in this case.
    In the ramified case choose a unit with nontrivial tested value;
    it separates the elliptic head from the two trivial inertia eigenvalues. Preserve these finitely many nonvanishings.
  The interior algebraic points are dense in each nonempty affinoid open subset of a characteristic-zero divisor.
    The bounded-series specialization argument therefore supplies $z_0$ outside the listed proper zero loci.
    Enlarge its finite field of definition for the fixed data only. ◻
]

Fix such a point. Label finite ring-class characters so that the toric integral with weight $eta^(- 1)$ has the
  Galois character weight $chi$ in (10). A class character trivial on the base ideles descends along $z mapsto
  z \/ z^c$ to the norm-one torus; pulling back that descended character gives the original class character,
  rather than its square. Pull it to $L$ by norm. There are two simultaneous inverse conventions.
  Choose one once at all places. In the later Galois extraction it gives $V ⊗ chi^(plus.minus 1)$;
  if the inverse occurs, conjugation identifies its strict condition with the opposite strict condition for $chi$.
  For the construction using $macron(w)$ make the conjugate choice.
  Thus the two constructions exchange sides and use the same global scalar character in the determinant problems.

Let $G_i$ be the product of the finite tame groups and $Gamma \/ Gamma^(p^(a_i))$, with $a_i arrow.r oo$,
  and let $nu_i$ be its universal character. Denote the group coefficient ring by $cal(O) \[ G_i \]$,
  allowing finite extensions for the values of Schwartz tests.
  Substitution at $z_0$ is a ring homomorphism modulo a precision tending to infinity.
  For example, $\( 1 + t_0 \)^(p^(a_i)) arrow.r 1$, and the analogous relations hold for the tame variables.
  Integer lifts of exponents give the same value modulo that precision.
  A uniformly bounded group polynomial stays bounded after substitution;
  products and limits of bounded series are respected because tails tend uniformly to zero on every closed
  interior polydisc. Coefficient fields of classical theta sections may vary with $i$.
  Only the field $k$ of the comparison values is fixed.

=== 7.2 The ordinary branch and increasing depth <the-ordinary-branch-and-increasing-depth>

Set $eta = cal(C)^m nu_i$, where $m > 0$ is on the fixed branch.
  With the even splitting characters trivial, the upper theta integral is

$ Theta_(i \, m) \( g \) = integral_(\[ upright(U) \( A \) \]) theta_(Phi_(i \, m)) \( g \, h \) phi \( h \)
  eta^(- 1) \( det h \) thin d h . $

The archimedean Fock vector has determinant degree $m - 1$.
  Its source type is $det^m$, including the vacuum determinant. Its target weight is $\( m \, m \, 1 \; - 1 \)$.
  Use the lattice dual to the monomial lattice in the $2 times 2$ minors,
  so extraction of a monomial does not introduce a binomial coefficient.
  The normalized creation operators and CM periods are those of [23] Section 4, “Frames, periods,
  and unary moments”: creation has leading linear position coordinate,
  and fixed algebraic unit scales are restored after computing in Igusa differential frames.

At both distinguished $p$-places put

#[#set math.equation(numbering: n => "(18)")
 $ Phi_p \( Y \) = phi.alt_p \( Y_(\[ e \, B_1 \]) \) nu_(i \, p) \( det Y_(\[ e \, B_1 \]) \)
   upright(bold(1))_(M_(2 \, 2) \( bb(Z)_p \)) \( Y_(\[ B_2 \, f \]) \) \, wide
   "supp" phi.alt_p subset upright("GL")_2 \( bb(Z)_p \) . $ <eq:source-18>]

The bare function $phi.alt_p$ has fixed depth. The determinant factor cancels the determinant character in source
  integration; hence the source compact and its volume remain fixed.
  Choose $s_i$ large enough for the locally constant tests,
  and use the subgroup $J \( s_i \)$ of upper block type $\( 2 \, 1 \, 1 \)$:
  its upper radical and final two unit groups are full, its head Levi is principal congruence at depth $s_i$,
  and its lower blocks have sufficient depth. This level marks a rank-two flag and frame inside the rank-three
  multiplicative subgroup. It does not mark a splitting of the etale quotient.

#thm([Lemma 7.3.])[
  (Canonical levels).  #emph[At each finite depth $s$, the ordinary branch of the normalization in level
    $J \( s \)$ on which the rank-three flag is multiplicative adds only finite etale character-group flags and
    frames. At a toroidal cusp it does not ramify the center Fourier parameter.
    Every component of this branch meets a compatible ordinary cusp,
    and reduction of all Fourier–Jacobi expansions detects divisibility of an integral section by the uniformizer.
    These assertions hold after every finite coefficient extension,
    with no loss of $p$-adic precision depending on $s$.]
] <theta:canonical-levels>

#proof[
  The multiplicative subgroup of an ordinary $p$-divisible group is canonical at every finite level.
    Cartier duality identifies its subflags and frames with quotients and markings of a finite etale character
    group. Once the rank-three member is this subgroup, the remaining level data are exactly these etale data.
    The full upper radical is what removes any choice of a lift of the etale quotient.
    The corresponding generic-fiber choices form an open and closed branch after normalization.
    Idempotents extend over the ordinary completion; normalization commutes with that completion by excellence.
  At a rank-one boundary the semiabelian object is an extension of a binary abelian object by a torus.
    The preimage of its binary multiplicative torsion is of multiplicative type.
    Its character group and flags are constructed before division by the Raynaud period lattice,
    so they do not involve the center Fourier parameter. The resulting chart covers are finite etale covers of the
    abelian extension-data charts. Pointing such a cover over a strict henselian boundary base makes it an abelian
    scheme and the covering an isogeny, by lifting addition through the etale cover.
    This is the geometric construction in [23] Lemma 7.1, applied separately at depth $s$;
    no numerical bound in its proof depends on $s$.
  The hyperspecial base has ordinary cusps on every component.
    Each connected finite etale component maps onto its base component and consequently meets its cusp charts.
    The expansion principle on these charts detects a zero reduced section.
    Repeated division by a uniformizer proves saturation at every precision.
    These are statements about reduction and etale covers, so finite ramification of the coefficient field changes
    neither the assertion nor the valuation normalized by $v_p \( p \) = 1$. ◻
]

#thm([Lemma 7.4.])[
  (The two $p$-operators).  #emph[For every $i \, m$, the unnormalized right-coset operators
    $U_j = \[ J \( s_i \) "diag" \( 1_j \, p^(- 1) 1_(4 - j) \) J \( s_i \) \]$, $j = 2 \, 3$,
    act on (18) by $p^2$. In weight $\( m \, m \, 1 \; - 1 \)$ the integral ordinary normalization is $p^(- 2)
    U_j$, so both normalized comparison values are $1$.]
] <theta:p-operators>

#proof[
  The upper shifts are indexed by $M_(j \, 4 - j) \( bb(F)_p \)$.
    On the support of the test the head has rank two modulo $p$,
    so the expanding columns can become divisible by $p$ in exactly $p^(\( j - 2 \) \( 4 - j \))$ ways.
    None of these equations changes the head function, including its determinant character.
    The split Weil action supplies $p^(4 - j)$. Their product is $p^(\( j - 1 \) \( 4 - j \)) = p^2$ for $j = 2 \,
    3$. The computation uses the full upper radical and is independent of its opposite depth and of the head
    character’s conductor. ◻
]

At a moving $q$ use the integral open-pivot test

$ upright(bold(1))_(upright("GL")_2 \( cal(O)_q \)) \( Y_(\[ e \, B_1 \]) \) eta_q \( det Y_(\[ e \, B_1 \]) \)
  upright(bold(1))_(M_(2 \, 2) \( cal(O)_q \)) \( Y_(\[ B_2 \, f \]) \) . $

Its equivariance also cancels the source determinant character on the full source compact.
  In particular source integration never divides by the order of a growing character quotient.
  The fixed tests elsewhere are those already specified, or one of finitely many fixed variants.
  The spherical parameter at an unmarked split place is

$ \( pi ⊗ eta \) xor \| dot.op \|^(- 1 \/ 2) xor \| dot.op \|^(1 \/ 2) \, $

by the matched unramified theta calculation of [23] Lemma 4.2 and Equation (4.10).

=== 7.3 A moment bound independent of the position cut <a-moment-bound-independent-of-the-position-cut>

The increasing conductor in (18) requires more than the fixed-level statement of the unary-moment lemma in [23]
  Section 4. We now prove the extension that will be used. An integral position lattice in this statement means
  the lattice in the fixed Igusa frame, before restoring algebraic CM unit scales.
  If those scales are instead included in the coordinates, the norm is taken on the resulting scaled compact
  lattice; a coefficient-field unit is not identified with an element of $bb(Z)_p$.

#thm([Lemma 7.5.])[
  (Bounded cuts of unary moments).  #emph[Fix the integral position lattices, additive characters, Igusa frames,
    and the finite tests away from $p$ used for a finite product of unary theta functions.
    Moving tame tests may have bounded group-ring coefficients and additive Fourier normalizations that are
    $p$-units. At $p$ let $c$ be any locally constant function on the position lattices,
    with coefficients in any finite extension or finite group algebra and $parallel c parallel lt.eq 1$.
    Its conductor is unrestricted.]
  #emph[For every finite polynomial combination $P$ of normalized position moments,
    the value of the corresponding period-normalized theta jets at a fixed integral ordinary CM object satisfies
$ \| cal(J) \( c P \) #scale(x: 120%, y: 120%)[\|]_p lt.eq C thin parallel P parallel_(upright("pos")) . $

 The constant $C$ depends only on the fixed data. It is independent of the moment degrees, the conductor of $c$,
   the moving tame levels, and the coefficient extension. The same bound applies to the canonical cusp expansions
   used to test ordinary integrality. The uncut moment functional is a bounded measure on the compact position
   lattice. When $c$ is invariant under the coordinate signs, inserting $c$ multiplies that measure by $c$.]
] <theta:cut-moments>

#proof[
  We first prove a scalar estimate. If a cut or test has values in a group algebra,
    write it in the group basis and apply the scalar argument to each coefficient.
    Coefficients of products are sums of products, so the ultrametric inequality retains the same bound,
    independently of the group order. In particular we take squares of scalar coefficient jets,
    rather than infer coefficientwise integrality from a square in the group algebra.
  Fix a finite list of scalar cuts and polynomials. All their conductors and degrees are finite.
    Choose the initial integral position frame with first vector in the multiplicative direction at the fixed CM
    object, and use this same finite marking in the level construction.
    For these unary theta functions use the ordinary Hilbert modular Igusa tower with the fixed tame Schwartz
    level and its multiplicative differential trivializations, as in [23] Lemma 4.4.
    At each split $p$-factor the multiplicative height is one.
    Marking its character group at a deeper level is finite etale, and does not mark a lift of the etale quotient.
    Over a toroidal cusp it leaves the Fourier parameter unramified.
    To see which cusps detect this branch, include the toroidal boundary in this construction.
    At a Tate cusp its multiplicative group is the Tate torus,
    and its character-group markings are finite etale unit markings of that torus.
    A connected component of this finite etale cover maps onto its connected base component and hence has a point
    over the chosen ordinary Tate cusp. Choose its adelic cusp representative integral at $p$,
    using Iwasawa decomposition and approximation in the cusp parabolic, and realizing this level marking.
    Relative to the fixed initial position frame, its marked connected vector is $u
    e$ modulo $p^s$ with $u$ a unit, at each Hilbert $p$-factor.
    Its integral symplectic comparison matrix $g$ therefore has lower-left entry divisible by $p^s$.
    In a two-dimensional factor, write $g = mat(delim: "(", a, b; c, d)$.
    Since $a \, d$ are units and $c in p^s bb(Z)_p$, explicitly
  $ g = mat(delim: "(", d^(- 1), b; 0, d) mat(delim: "(", 1, 0; c \/ d, 1) . $
  The second matrix is congruent to the identity in the lower direction.
    Take $s$ at least the stabilizer depth of the finite list of tests. The second matrix then fixes those tests.
    Thus every component has a detecting cusp representative in $B \( bb(Z)_p \)
    "Stab" \( c \)$ relative to the original position frame. No preliminary symplectic transformation of the cut
    is being made. The Fourier interchange of the two directions would mark the etale direction instead and does
    not describe this canonical branch. The scalar Hilbert expansion map on this canonical branch is therefore
    saturated, by the same reduction argument as in Lemma 52.
    This is the scalar Hilbert tower, rather than the unitary target of that lemma.
    We may compare the finite list on one sufficiently deep such level.
    We shall remove every denominator introduced in making that comparison, rather than bound it in terms of the level.
  For integral positions the upper integral unipotent acts through the additive quadratic phase and is in the
    stabilizer with our unit self-dual normalization. The diagonal stabilizer can be made as deep as the local
    constancy of the cuts requires. Smoothness supplies a lower stabilizer of some finite depth;
    equivalently one may choose that depth after bounding the Fourier-transform support of this individual finite
    list. These statements put all the tests on the canonical multiplicative levels just described.
  Here is the effect on moments of these compatible frame changes.
    The preceding construction compares each detecting cusp directly with the fixed CM position frame through
    $B \( bb(Z)_p \) "Stab" \( c \)$. Their effective changes are therefore upper triangular:
    they rescale positions by units, permute the tests, and multiply by unit phases.
    For a diagonal unit $u$, the test reads $phi.alt \( u x \)$,
    while the multiplicative marking changes the differential by $u^(- 1)$.
    The normalized degree-$d$ moment therefore reads $\( u x \)^d$ in the same position coordinate.
    An upper unipotent contributes a phase common to the polynomial moments.
    Thus both the cut and the polynomial are transformed in the same coordinate.
    We use no uniform bound on the Fourier transform of fine cuts at $p$;
    a Fourier interchange with the opposite position direction is not among these compatible changes.
  Consequently the coefficient at index $beta$ of a polynomial combination at such a cusp is
  #[#set math.equation(numbering: n => "(7.1)")
   $ sum_(Q \( x \) = beta) phi.alt \( x \) c \( x \) P \( x \) . $ <theta:position-coefficient>]
  The sum is finite, and $Q$ has unit quadratic coefficient in the normalized position frame.
    It has absolute value at most the fixed bound for $phi.alt$ times $parallel P parallel_(upright("pos"))$.
    The same calculation holds for several positions. Additive transforms away from $p$ have normalization a
    residue-characteristic power or a root of unity and cost only the fixed denominators already included in $C$.
    Moving determinant characters have unit group coefficients.
    The bound in (7.1) is thus independent of every changing depth.
  We justify that saturation applies to these analytic jets.
    At any individual set of degrees and levels, enlarge the tame multiplier level, including the level at two,
    so that products of two base half-weight theta functions are algebraic integral-weight forms.
    Leibniz and Gauss–Manin express products of their normalized jets as rational expressions in jets of the base
    products. There are no horizontal poles: locally in characteristic zero the square of a base theta has even
    divisor, and after removing that divisor an etale square-root frame makes the connection and its fixed
    iterates regular. Cross-products fix the signs and descend these products.
    The logarithmic cusp calculation is the same. Projection to the ordinary unit-root splitting therefore makes
    the square of every finite linear combination an element of the ordinary tower ring with $p$ inverted.
    At an ordinary CM object this splitting agrees with the CM splitting.
    These algebraicity and comparison facts are the finite-level facts proved in the unary-moment argument of [23]
    Lemma 4.4; they require finiteness of the chosen list, not a uniform bound for its depth.
  Let $G$ be such a square, multiplied by the fixed clearing factor predicted by (7.1).
    Its expansions are integral at all compatible cusps. If $pi.alt^r
    G$ is integral with $r$ minimal and positive, every expansion of $pi.alt^r G$ vanishes modulo $pi.alt$.
    By the scalar Hilbert expansion principle just established, its reduction is zero on every component.
    Division by $pi.alt$ contradicts minimality. Thus $r = 0$.
    Evaluation and taking the square root give the claimed bound for the original combination.
    This argument removes its whole initial vertical denominator, even when that denominator depends on the cut.
    It is unchanged over a ramified coefficient extension with the valuation normalized by $v_p \( p \) = 1$.
  For a general cut, separate the parity pieces of the finite tests and polynomial jets with $2^(- r)
    sum_(epsilon in { plus.minus 1 }^r) epsilon^e \[ epsilon \]$.
    These projectors have norm at most one because $p$ is odd.
    In each coordinate write the degree as $e_0 + 2 j$, with $e_0 in { 0 \, 1 }$;
    the corresponding base unary theta has weight $1 \/ 2 + e_0$,
    and its $j$th normalized jet has position factor $x^(e_0) Q \( x \)^j$.
    Carry out the preceding square argument for these parity bases;
    their cross-products supply the common descent. Each expansion still has the form (7.1).
    Thus the estimate applies to arbitrary cuts, including coset cuts obtained by decomposing a matrix determinant
    character; it does not require invariance under the separate signs of its entries.
  With the cut equal to one, the estimate gives a bounded linear functional on all polynomial parity pieces,
    and polynomial density extends it to a bounded measure. For the additional identification of a cut with
    multiplication of this fixed measure, assume that $c$ is sign invariant.
    Approximate it uniformly by sign-invariant polynomials, using symmetrization.
    Apply the same bound to the difference between a cut moment and its polynomial approximation.
    In (7.1) that difference is exactly $phi.alt \( x \) \( c \( x \) - P_n \( x \) \)
    P \( x \)$ in the same frame. Its norm tends to zero. Hence the measure with the cut is $c$ times the uncut
    measure. All these arguments are coefficientwise for finite group algebras,
    so their bounds do not involve the group order. ◻
]

Positive degrees tending to infinity remove the nonunit positions.
  On the units, fixing the torsion component makes $x^d = omega \( x \)^d
  exp \( d log chevron.l x chevron.r \)$ analytic in $d$ on a sufficiently narrow branch.
  Lemma 54 makes this convergence uniform for bounded cuts.
  Restoring fixed CM unit-scale powers preserves the bound and is analytic after narrowing the branch once.
  This is the interpolation of unary periods used for the nonconstant coefficient in the next section.

#thm([Proposition 7.6.])[
  (Integral theta sections).  #emph[There is a fixed integer $c gt.eq
    0$ such that $p^c Theta_(i \, m)$ is an integral ordinary section on the canonical branch,
    coefficientwise in $cal(O) \[ G_i \]$. The same $c$ works for all increasing depths $s_i$,
    all sufficiently large positive weights on the fixed branch, all the fixed test variants,
    and bounded locally constant cuts in the head of (18) that retain the source determinant equivariance on a
    fixed compact. The two trailing columns keep their full integral lattice tests;
    the canonical cusp changes preserve their integral-translation invariance, as proved below.
    Its Fourier–Jacobi coefficients are integral in the monomial-dual differential lattice.]
] <theta:integral-family>

#proof[
  Choose canonical cusp representatives integral at $p$ and preserving the multiplicative member modulo the chosen
    deep level. In the mixed expansion the $f$ column is Fourier-dualized to the position $x$.
    It remains invariant under integral translations: a change of that column affects the head of (18) only at
    depth $s_i$, and preserves the trailing integrality tests.
    The Fourier transform therefore has integral support and introduces no nonunit normalization at $p$.
    Partition the remaining position tests by cosets and decompose them into products of unary tests.
    Their coefficients retain the same supremum bound, so Lemma 54 applies to their monomial moments.
  The column-degree filtration of the differential bundle identifies these moments with the mixed coefficients.
    Binary columns have the normalized unary moments, and the hyperbolic column contributes integral position
    powers. Logarithmic frames and prime-to-$p$ Jacobi torsion evaluations split the required differential
    sequences integrally. These are the mixed-expansion identities of [23] Lemma 4.5;
    the argument above checks the only changing input, the increasing $p$-depth.
  At moving and fixed finite places choose the boundary representatives by approximation,
    with the required integral conditions and the deep $p$-condition simultaneously.
    Detecting Jacobi torsions remain prime to $p$. Source integration has a fixed volume denominator because the
    determinant equivariance cancels the character on the fixed source compact, including at $p$.
    Thus all expansion coefficients have one fixed denominator.
    Saturation on the canonical branch, supplied at every depth by Lemma 52,
    gives the assertion for the sections themselves. This concerns the canonical ordinary lattice;
    it makes no assertion about an unrelated generic-level lattice. ◻
]

=== 7.4 Toric periods and Fourier cancellation at $p$ <toric-periods-and-fourier-cancellation-at-p>

We next identify the limit of the toric period entering the constant term.
  At a split place write $a \( x \) = "diag" \( x \, 1 \)$ and $n \( y \) = mat(delim: "(", 1, y; 0, 1)$.
  In Mellin notation put $chi_p^(upright("Mell")) = eta_p^(- 1)$, and choose the Kirillov function

$ W_(chi_p^(upright("Mell"))) \( a \( x \) \) = \( chi_p^(upright("Mell")) \)^(- 1) \( x \)
  upright(bold(1))_(bb(Z)_p^times) \( x \) . $

This compactly supported function occurs in every generic local elliptic representation.
  With unit-group volume one its central Mellin integral against $chi_p^(upright("Mell"))$ is $1$,
  whether that character is ramified or unramified. Its unit equivariance cancels the torus weight,
  so integration again has fixed volume.

Let $W_0 \( a \( x \) \) = upright(bold(1))_(bb(Z)_p^times) \( x \)$, the canonical $p$-depletion test,
  and let $b_p$ be large enough for the character on units. Finite Fourier inversion in the Kirillov model gives

#[#set math.equation(numbering: n => "(19)")
 $ W_(chi_p^(upright("Mell"))) = p^(- b_p) sum_(j med mod med p^(b_p)) (sum_(x med mod med p^(b_p)\
p divides.not x) \( chi_p^(upright("Mell")) \)^(- 1) \( x \) psi_(upright("add")) \( - x j \/ p^(b_p) \))
  n \( j \/ p^(b_p) \) W_0 . $ <eq:source-19>]

The translations are right translations. Their meaning in CM coordinates is needed before one estimates this expression.

#thm([Lemma 7.7.])[
  (CM translations and bounded Fourier projection).  #emph[Choose connected and etale Tate coordinates $e_p \,
    f_p$ at a split ordinary CM point. The translation $n \( j \/ p^b \)$ gives the lattice
$ bb(Z)_p e_p + bb(Z)_p #scale(x: 120%, y: 120%)[\(] f_p + \( j \/ p^b \) e_p #scale(x: 120%, y: 120%)[\)] . $

 It corresponds, up to a fixed sign and a unit root-basis choice,
   to the Serre–Tate parameter $zeta_(p^b)^(c j)$ with $c in bb(Z)_p^times$,
   and preserves the connected differential frame integrally.
   Suppose $F \( z \) = integral_(bb(Z)_p) z^y thin d mu \( y \)$ for a bounded measure $mu$,
   and $chi$ has conductor dividing $p^b$ on units. For every $delta in bb(Z)_p^times$,
#[#set math.equation(numbering: n => "(7.2)")
 $ p^(- b) sum_(j med mod med p^b) sum_(x in \( bb(Z) \/ p^b \)^times) chi^(- 1) \( x \) zeta_(p^b)^(- x j)
   F \( zeta_(p^b)^(c delta j) \) = integral_(bb(Z)_p^times) chi^(- 1) \( c delta y \) thin d mu \( y \) .
   $ <theta:fourier-cancellation>]

 Its norm is at most $parallel mu parallel$, independently of $b$.]
] <theta:fourier-measure>

#proof[
  An ordinary deformation is the extension of the etale group by the multiplicative group classified by its
    Serre–Tate unit $z$. For $z = zeta_(p^b)^j$, pulling back on the etale generator by $p^b$ makes the extension
    split. Relative to that rational splitting, the compatible roots $zeta_(p^(a + b))^j$ of $z$ shift an etale
    lift at level $a$ by $j \/ p^b$ in the connected coordinate.
    This gives the displayed lattice and parameter; changing the compatible root basis or reciprocity sign gives
    the fixed unit $c$.
  The lattice intersects the connected rational line in precisely $bb(Z)_p e_p$,
    and its image in the etale rational line is precisely $bb(Z)_p f_p$.
    Thus the rational comparison transports the connected lattice integrally,
    not by multiplication by a power of $p$. One can also realize it by canonical connected quotients followed by
    etale quotients with the chosen roots; dividing the resulting isogeny by the common scalar gives the same
    integral connected comparison. Its multiplicative differential changes by a unit.
    Canonical levels in $W_0$ remain canonical, and the rational CM splitting agrees with the ordinary unit-root
    splitting by the CM idempotents. In particular no factor $p^(b m)$ appears in a weight comparison.
  Substitute the measure expression for $F$ into the left side of (7.2).
    The finite sum over $j$ is $p^b$ when $x equiv c delta y med \( mod med p^b \)$ and zero otherwise.
    There is exactly one such unit $x$ if $y$ is a unit, and none if $y$ is not.
    Division by $p^b$ gives the right side. This proves the equality and the bound without estimating the Fourier
    coefficients separately. ◻
]

Let $P_(0 \, i) \( m \)$ and $P_(1 \, i) \( m \)$ be the raw toric periods for the forms of $E$ and $E^(D')$,
  respectively. Their definition is the CM toric sum in [23] Section 5, with (19) at $p$, the raw factors $q -
  1$ and translations $n \( 1 \/ q \)$ at the moving primes, and the oriented fixed local tests specified below.
  Raw means that conductor-class sums are not averaged by their growing orders.

#thm([Proposition 7.8.])[
  (The toric weight limits).  #emph[At every fixed stage $i$,
    the periods $P_(j \, i) \( m \)$ have coefficientwise limits as positive $m$ tends to zero on the chosen
    $p$-adic branch and tends to infinity ordinarily. The limits, as group polynomials,
    have uniformly bounded coefficients as $i$ varies. Up to a fixed nonzero scalar and group-like units,
    the limit of $P_(0 \, i) \( m \)$ is the stage image of the undepleted series $b_w^0$.
    Consequently, when $b_w^0 \( z_0 \) = 0$, weights may be chosen at each stage with arbitrary prescribed
    additional precision so that
$ P_(0 \, i) \( m_i \) \( z_0 \) arrow.r 0 \, wide sup_i \| P_(1 \, i) \( m_i \) \( z_0 \) \|_p < oo . $

]
] <theta:toric-limit>

#proof[
  First keep $i$ and $b_p$ fixed. The CM/Katz comparison and Proposition 41 identify the weight limit for the
    first form with $F_0 = d_(upright("mod"))^(- 1) f^(\[ p \])$ in integral Igusa frames.
    The CM representatives at the moving tame conductor can be chosen with $p$-component one.
    Transport reference algebraic CM frames through their toric calculations and use the corresponding Igusa
    frames for the derivative limit. All degree-dependent comparison factors are then fixed unit powers.
    The translations in (19) preserve those frames by Lemma 56.
    Thus the branch conditions are compatible; no new nonunit raised to the weight is introduced.
  For the disk indexed by $frak(a)$, a prime-to-$p$ isogeny changes the root parameter to
    $zeta_(p^(b_p))^(c delta_(frak(a)) j)$. The unit action $a \( u \)
    n \( j \/ p^(b_p) \)$ changes the index to $u j$. CM reciprocity therefore expresses the unit character in
    (19) through the exponent map $eta_Gamma : bb(Z)_p^times arrow.r Gamma$ of Section 6.
    Formula (7.2) gives the inverse moment label $\[ - eta_Gamma \( y \) - eta_Gamma \( delta_(frak(a)) \) \]$,
    up to the common group-like unit coming from $c$. The represented torus class contributes $\[ t_(frak(a)) \]
    psi_s \( frak(a) \)$. Summing the disk expressions is exactly the formula for the undepleted $b_s^0$ in
    Proposition 42. Changes of basepoint, root basis, or non-$p$ orientation introduce only its fixed sign and
    translation units. This establishes the identification including the global scalar labels.
  For the second form the identical local Fourier calculation suffices for a bound.
    Its fixed toric tests away from $p$ are finite expressions of translates of the primitive form with fixed
    differential constants. Its inverse-derivative functions on the ordinary CM disks give bounded measures.
    Unit restriction, prime-to-$p$ translations, and the raw conductor sums preserve a common bound.
    The first form has the same bound from the explicit $b_s^0$ formula.
    The two limits are therefore uniformly bounded group polynomials.
  There is no assertion here that inverse Fourier transform at all stages has uniformly bounded norm.
    At fixed $i$, its denominator $p^(b_p)$ is fixed, and weight convergence may be taken to any precision before
    letting $i$ grow. Equivalently, characterwise convergence in the fixed characteristic-zero group algebra
    implies coefficientwise convergence with a finite stage-dependent loss,
    which is paid by taking the weight sufficiently close to zero.
    The resulting limiting polynomials have the uniform bound proved above.
    Substitution at the interior point respects their limits.
    Since $b_w^0 \( z_0 \) = 0$, the stage limits for the first period tend to zero there;
    the second limits remain bounded. Approximating each limit to any prescribed stage precision proves the assertion. ◻
]

=== 7.5 The binary comparison and its denominators <the-binary-comparison-and-its-denominators>

At zero Fourier–Jacobi index the mixed expansion sets the hyperbolic position equal to zero.
  Every polynomial containing a hyperbolic-column minor vanishes.
  The remaining determinant monomial gives a binary theta value on $upright(U) \( B \)$.
  At a split finite place its local intertwiner, on the bare source space, is

#[#set math.equation(numbering: n => "(7.3)")
 $ J_v \( Phi \, z \) = integral_(upright("GL")_2 \( F_v \)) Phi \( zws^t h \) \| det h \|_v thin pi_v^or \( h \)
   eta_v^(- 1) \( det h \) z thin d^times h \, wide "vol" upright("GL")_2 \( cal(O)_(F_v) \) = 1 . $ <theta:binary-map>]

The output uses inverse transpose. This is the central Godement–Jacquet zeta map [11],
  with rational continuation when required. The compact-model multiplicity statement of [23] Section 5,
  “The binary scalar and its multiplicity” expresses the global binary map as one scalar times the local maps.
  Its hypotheses here are the spherical nonsplit components and cuspidality of the base change already checked above.

For precision about the comparison being used, write $chi = eta_v^(- 1)$ in the distinguished split coordinate.
  The matrix zeta function and the toric Mellin function are

$ Z_G \( Phi \, c \, chi \, s \) & = integral_(upright("GL")_2 \( F_v \)) Phi \( g \) c \( g \) chi \( det g \) \|
  det g \|^(s + 1 \/ 2) thin d^times g \,\
M \( W \, chi \, s \) & = integral_(F_v^times) W \( a \( x \) \) chi \( x \) \| x \|^(s - 1 \/ 2) thin d^times x . $

Their dual functional equations use the same $gamma \( s \, pi_v ⊗ chi \, psi_(upright("add")) \)$:

$ Z_G \( hat(Phi) \, c^or \, chi^(- 1) \, 1 - s \) & = gamma \( s \, pi_v ⊗ chi \, psi_(upright("add")) \)
  Z_G \( Phi \, c \, chi \, s \) \,\
M \( W^w \, chi^(- 1) \, 1 - s \) & = gamma \( s \, pi_v ⊗ chi \, psi_(upright("add")) \) M \( W \, chi \, s \) . $

The Weyl involution uses trivial central character. These are the normalizations in [23] Equations (5.8) and
  (5.10). They hold for arbitrary smooth twists, including special local representations.
  In the bilinear pairing there is one functional-equation factor,
  with the same orientation on the matrix and toric sides.

The global identity is the equal-rank, anisotropic binary Siegel–Weil/Rallis identity [33,10] combined with the
  two Waldspurger identities [31], with the specific normalization of [23] Equation (5.6).
  The source groups are compact, their base-change parameters cuspidal and tempered,
  their zero-space theta lifts vanish, and the torus characters have the compatible opposite central characters in
  the two bilinear slots. The central standard $L$-value factors as the two central Rankin values for $E$ and
  $E^(D')$ over $K$. Thus these are value identities, not residue or derivative identities.
  Keeping partial $L$-functions and raw exceptional local integrals gives the comparison without dividing by a
  global $L$-value. We record the local changes required by our test point and increasing $p$-depth.

At $p$ the Mellin test above has value exactly one. Since $p$ splits completely in $L$,
  both local matrix gamma factors match the two toric gamma factors, including their conductors.
  They cancel without any bound on their separate valuations.
  The local unramified-twist assumption in the fixed-depth calculation of [23] Section 5 was used to choose its
  Mellin-one test; the test (19) supplies that property for our ramified characters.
  Duality exchanges the distinguished coordinates by unit scales,
  so its remaining factors are character values on units and fixed unit powers.

At a moving prime let $L_q^(upright("fake"))$ be the degree-two unramified central Euler factor formed from the
  uniformizer value of $chi_q^(upright("Mell"))$, ignoring its tame inertia.
  Put $D_q^(upright(f)) = \( L_q^(upright("fake")) \)^(- 1)$. The translated spherical Whittaker expansion gives

#[#set math.equation(numbering: n => "(7.4)")
 $ H_q^(upright(f)) & = D_q^(upright(f)) \( q - 1 \) M \( W \, chi_q^(upright("Mell")) \, 1 \/ 2 \)\
 & = D_q^(upright(f)) sum_(a in bb(F)_q^times) chi_q^(upright("Mell")) \( a \)
   psi_(upright("add")) \( a \/ q \) + \( 1 - D_q^(upright(f)) \) sum_(a in bb(F)_q^times)
   chi_q^(upright("Mell")) \( a \) . $ <theta:moving-clearing>]

Both factors have bounded group coefficients. Our uniformizer choice makes $D_q^(upright(f)) \( z_0 \)$ tend to a
  nonzero value. The additive sum in (7.4) is a unit at the test:
  modulo the maximal ideal all the group elements specialize to one, and its augmentation is $- 1$.
  The plain unit sum tends to zero at the test. It is an integral multiple of the norm element of its own inertia
  group; the geometric-sum formula gives convergence to zero when $u_(j 0) eq.not 0$, and at $u_(j 0) =
  0$ its value is an integral multiple of the group order, which also tends to zero.
  Hence $H_q^(upright(f)) \( z_0 \)$ is nonzero with uniformly bounded valuation.
  The additive sums may lie in varying coefficient fields; no convergence of those unit sums in a fixed finite
  field is required. The period comparison uses these full raw factors.
  No inverse of $q - 1$ or conductor projector remains.

At a fixed split $q eq.not p$, take the oriented toric newvector.
  Its Mellin integral is $L \( 1 \/ 2 \, pi_(j \, q) ⊗ chi_q^(upright("Mell")) \)$, $j = 0 \, 1$,
  up to fixed volume, unit, and monomial factors with bounded inverse at $z_0$.
  Kill fixed $cal(C)^m$ inertia by the weight branch. Divide the binary map (7.3) at $v divides
  q$ by $L \( 1 \/ 2 \, pi_(F \, v)^or ⊗ chi_v^(upright("Mell")) \)$.
  For fixed Schwartz and matrix-coefficient data, the Godement–Jacquet zeta identity says that coefficients of
  this divided map are Laurent polynomials in the unramified parameter.
  Their finitely many coefficients have a fixed denominator.
  Local base change identifies the product over $v divides q$ of the binary Euler factors with the product of the
  two elliptic factors. This includes ramified quadratic base change at $q$, since $K_q$ is split.
  Induction of local epsilon factors matches the gamma products,
  up to the fixed lambda factor for the chosen additive characters.
  Thus the Euler factors of the toric Mellins cancel those moved into the binary scalar.
  This is a rational identity before evaluation, so it holds even when an inverse Euler polynomial vanishes at
  $z_0$; no inversion of that vanishing polynomial is made after specialization.

At fixed places where $K_q$ is nonsplit the variable scalar is locally trivial:
  it is unramified and anticyclotomic of $p$-power order, with $p$ odd.
  The fixed nonzero-pairing tests and no-pole estimates of [23] Section 5 apply,
  including the companion’s ramified toric functional. At all remaining places use spherical normalizations.

Finally, the determinant Fock norm of degree $m - 1$ has ratio $\( m - 1 \) ! m !$ to the vacuum norm.
  The raised quaternionic weight-two vector has the same ratio.
  These factorials cancel in the archimedean comparison. The CM period normalization has weight $2
  m$ at each real embedding on both sides. The remaining frame factors are fixed algebraic unit powers,
  and global measures, adjoint norms, and zeta factors contribute fixed scalars.
  Their algebraicity follows by evaluating any nonzero normalized comparison; if no such comparison exists,
  the cross-multiplied numerator identity is already zero. This is the algebraic, bilinear comparison,
  so the squares below are algebraic squares.

#thm([Proposition 7.9.])[
  (Vanishing of all constant terms).  #emph[Assume $b_w^0 \( z_0 \) = 0$,
    and choose the auxiliary tests and local parameters of Lemma 51.
    After the fixed clearing of Proposition 55, weights $m_i$ may be chosen so that all constant Fourier–Jacobi
    coefficients of $Theta_(i \, m_i)$ at $z_0$ tend uniformly to zero.
    The weights tend to zero on the fixed $p$-adic branch and to infinity ordinarily.
    At each fixed stage they can satisfy arbitrarily strong additional weight-approximation requirements.
    The assertion holds simultaneously for the finitely many fixed variants used for nonconstant content and for
    their integral prime-to-$p$ translates.]
] <theta:boundary-small>

#proof[
  Let $a_(i \, m)$ be any constant coefficient in an integral ordinary frame.
    It is the binary scalar times the local intertwiners applied to the corresponding projected tests.
    Square this expression and use the bilinear comparison just described. After cross-multiplication it has the form
  #[#set math.equation(numbering: n => "(7.5)")
   $ A_(i \, m) thin a_(i \, m)^2 = B_(i \, m) thin P_(0 \, i) \( m \)^2 P_(1 \, i) \( m \)^2 .
     $ <theta:cleared-boundary>]
  Here $A_(i \, m)$ and $B_(i \, m)$ have uniformly bounded group coefficients,
    and $A_(i \, m) \( z_0 \)$ is nonzero with valuation bounded above,
    when $m$ is sufficiently close to zero at stage $i$. We verify that this bound is uniform in the cusp,
    rather than only for the reference binary test.
  At a moving prime the projected test has integral support, depends on reduction modulo $q$,
    and is determinant-equivariant under the full source compact.
    On a deficient-rank stratum the stabilizer determinant surjects onto the inertia group.
    Its group coefficient is therefore an integral multiple of the norm element:
    all coefficients are equal, without division by the group order.
    The remaining untwisted-unit integral is a sum over image lattices.
    Express an exact reduced line or zero image by subtraction from containment conditions.
    Each containment sum is a translate and a power of $q$ times the full-lattice fake Euler series.
    Thus $D_q^(upright(f))$ clears its denominator, while $H_q^(upright(f))$ clears the raw toric factors.
    Their bounded powers have the bounded evaluated valuations just proved.
    This argument also applies to bounded integral sums of pivot translates; powers of $q$ are $p$-units.
  At $p$ the canonical projection has integral matrix support,
    by the Fourier-support calculation in Proposition 55. Its determinant equivariance cancels the source twist on
    a fixed compact under which the bare vector is invariant. Expanding (7.3) by determinant valuation gives the factor
  $ p^(\( m - 1 \) v_p \( det h \)) . $
  Right-coset volume denominators are fixed, even though the target depth grows.
    The translates of the fixed compact automorphic function have bounded sup norm.
    For sufficiently large positive $m$ this integral-matrix series converges with a uniform bound.
    Its finite determinant truncations are the Godement–Jacquet series and hence compute the same rational zeta
    operator. No projector onto a deep $p$-character space is used.
  At a fixed split place the divided intertwiners above have Laurent polynomial bounds on the finite spaces of
    tests. Integral cusp representatives and their fixed variants give the same bound.
    Fixed nonsplit denominators have bounded inverse at $z_0$; unmarked places have spherical normalization.
    Boundary approximation chooses representatives integral at the designated finite places,
    and at $p$ preserving the deep canonical flag. Compact-model evaluations and frame changes therefore introduce
    only the fixed factors and unit character values already accounted for.
    These observations prove the claimed uniformity of (7.5).
  The period identities first hold at actual finite characters.
    Those characters separate the characteristic-zero group algebra,
    so the cross-multiplied identity holds coefficientwise. The uniform bounds permit substitution at $z_0$ to the
    increasing precision for which the finite-group relations hold.
    By Proposition 57, its right side tends to zero, and the valuation of the nonzero left multiplier stays
    bounded. Thus $v_p \( a_(i \, m_i) \( z_0 \) \) arrow.r oo$, uniformly in the coefficient.
    Taking a square root of this valuation inequality merely divides the required precision by two.
  For clarity, the parameters are chosen in the following order.
    Fix the finite group stage and its required $p$-depth. At that stage take the positive weight sufficiently
    close to zero to pay every finite Fourier-inversion loss and approximate the two toric limits to the desired
    precision. Increase its ordinary size to meet the convergent-series and holomorphy requirements.
    Then let the group orders increase and retain a precision tending to infinity more slowly than their relation
    precision and the resulting constant-term precision. Fixed losses are absorbed in this retained precision.
    Additional finitely many weight congruences and lower bounds can be imposed at the first step.
    In particular the degree choices used to retain nonconstant content in Section 8 are compatible with this
    construction. ◻
]

== 8 Content at a character and extraction of a primitive class <sec:extraction>

The boundary calculation in Section 7 is useful only if the theta section itself does not tend to zero at the
  character being tested. We prove this assertion first. We then lift the sections to cusp forms and extract a
  Galois extension. All precision losses in this section are bounded independently of the stage.
  We require only a nonzero extension over a characteristic-zero field, not an integral length formula.

We retain the notation of Section 7. Write $chi$ for the universal scalar character over $K$,
  and $chi_z$ for its specialization at a field test $z$. Its character on $L$ is its restriction,
  equivalently its norm pullback in the idelic description. Write $V' = V ⊗ chi_(D')$ for the companion plane.

For a field test $z$ and $a in { w \, macron(w) }$, let $H_(upright("prim") \, a)^1 \( K \, V chi \; z \)$ mean
  the degree-one group of the marked Selmer complex with strict condition at $a$,
  full condition at the other place above $p$, and unramified condition at every fixed place away from $p$.
  The moving-place conditions are those of the deformation; their local complexes are acyclic at the tests in use.
  Use the same definition for $V'$. This defines these groups on the finite-model field fibers as well as at
  $z_0$. A #emph[jump] means that the indicated group is nonzero.

#thm([Proposition 8.1.])[
  (Theta implication).  #emph[Let $frak(p)$ be a horizontal height-one prime of the deformation ring,
    with the auxiliary tuple conditions of Section 7. If $b_w^0 in frak(p)$, then,
    over $"Frac" \( R \/ frak(p) \)$, at least one of
$ H_(upright("prim") \, a)^1 \( K \, V chi \) \, wide H_(upright("prim") \, a)^1 \( K \, V' chi \) $

 is nonzero. Here $a$ is one fixed side determined by the reciprocity convention of Section 7.
   Replacing $w$ by $macron(w)$ replaces $a$ by its conjugate.
   Both alternatives use the scalar character of the determinant problem.]
] <extraction:theta-implication>

We prove the proposition by contradiction. If both groups vanish over the divisor field,
  the open conditions in Lemma 51 give a point $z_0$ at which both still vanish,
  all required local invariants vanish, and the separation polynomials are nonzero.
  Fix this point for the rest of the section. It is defined over a finite extension $k \/ bb(Q)_p$;
  from now on abbreviate $chi_(z_0)$ to $chi$. The finite characters $nu_i$ are evaluated at $z_0$ modulo
  precisions tending to infinity.

=== 8.1 A positive coefficient at the chosen point <a-positive-coefficient-at-the-chosen-point>

Use the auxiliary vector $phi$, stabilizer character $d_0$, and unary nonvanishing degrees $d_10 \,
  d_20$ of Lemma 50. The stabilizer of $e_1 in A$ is the torus $upright(U) \( L e_2 \)$. Write its nonzero period as

$ I_(upright("stab")) = integral_(\[ upright(U) \( L e_2 \) \]) phi \( s \) d_0 \( s \) thin d s eq.not 0 . $

The one-index unfolding of [23] Lemma 6.1 concerns the primitive index $e_1$ and the integral monomial

$ \[ e \, B_1 \]^(d_1) \[ e \, B_2 \]^(d_2) \, wide d_1 + d_2 + 1 = m . $

The brackets are the indicated two-column determinants. At $Y_e =
  e_1$ they read the second-row coordinates of $B_1 \, B_2$.
  We now specify the changes to its finite tests; the integral monomial lattice is unchanged.

At $p$, put the fixed unary unit test in the second-row $B_1$ coordinate and retain the integer test in $B_2$.
  Multiply by the determinant character in (18). At the $j$th moving prime introduce another copy $v'_j$ of its
  cyclic parameter. Factor the corresponding global character into the slot characters with parameters $v'_j$ and
  $\( 1 + u_j \) \/ \( 1 + v'_j \) - 1$. This factorization is global,
  so it includes their unramified values at the other places.
  Require both heads $Y_(\[ e \, B_1 \])$ and $Y_(\[ e \, B_2 \])$ to be integral and invertible,
  and insert the respective determinant characters. All other entries retain their integral tests.
  For the moment these moving tests have no prescribed target control.

These are bounded integral sums of translates of the original pivot test.
  In fact, write the trailing columns as $Y_(upright("head")) S$, partition $S$ modulo the moving uniformizer,
  and subtract $Y_(upright("head")) S_0$ on a residue class.
  Dilating the remaining trailing coordinates identifies that summand with the pivot test.
  The second invertibility condition is a residue condition on $S_0$;
  its character factor is the character of its invertible residue determinant.
  All coefficients are integral group elements. The scales are powers of the moving residue characteristic,
  hence $p$-units. Although the number of summands may grow,
  their supremum norm and the nonarchimedean bound for their sum do not grow.
  In particular no inverse order of a residue unit group occurs.

At an unramified-twist Steinberg place use a line-stabilizer parahoric on the target and an Iwahori-fixed source
  vector. In split coordinates the test consists of integral columns with the second coordinate of $Y_e$ zero
  modulo the uniformizer. The integral vector–covector pairs with pairing one and this condition form a single
  source-Iwahori orbit: complete the first vector, whose reduction is in the prescribed line,
  by a vector in the kernel of the covector. The two row-two unary tests are therefore spherical.
  At places kept hyperspecial use the single primitive norm-one orbit.
  At the remaining fixed split places, including the additive ones,
  temporarily use the fixed-level tests permitting the one-index unfolding.

Unfolding now separates a row-one Heisenberg theta function from

$ integral_(\[ upright(U) \( L e_2 \) \]) phi \( s \) eta^(- 1) \( s \) theta.alt_(1 \, d_1) \( s b_1 \)
  theta.alt_(2 \, d_2) \( s b_2 \) thin d s . $

Here the determinant character cancels the source character in the compact integration at $p$.
  Thus its increasing conductor does not shrink that integration domain.
  On setting $Y_e = e_1$, its remaining factor is precisely $nu_(i \, p)$ on the row-two $B_1$ unit coordinate.
  The row-one function does not see this factor. At a moving prime, the two heads give the two row-two unit cuts,
  with their separate slot characters; the primitive orbit volume is unchanged.

Assign the true character to the first unary character, and assign the two moving slot characters to the
  corresponding unary characters. With the splitting characters of Lemma 50 their product is $eta d_0$.
  Averaging in $b_1 \, b_2$ against the inverse unary characters therefore gives

#[#set math.equation(numbering: n => "(20)")
 $ I_(upright("stab")) thin T_1 \( d_1 \) T_2 \( d_2 \) . $ <eq:source-20>]

Here

$ T_j \( d \) = integral_(\[ upright(U) \( 1 \) \]) theta.alt_(j \, d) \( s \) xi_j \( s \)^(- 1) thin d s $

is the corresponding unary period. Its assigned scalar parameters are included in $xi_j$ and will be displayed
  when necessary.

This averaging has a fixed denominator. On local torus units the weight cancels the characters in the tests,
  including the deep test at $p$, so the integrand descends through a fixed compact subgroup.
  There are consequently fixed finite torus representatives; by approximation their $p$-components may be one,
  and no new moving component is needed. For each representative the row-one function is nonzero at a fixed
  prime-to-$p$ Jacobi torsion, as in the proof following the cited unfolding lemma.
  The needed Jacobi translations can be integral at $p$: they preserve $e$ and add multiples of $Y_e$ to the $B$
  columns, leaving each determinant twist identically unchanged.
  They preserve the canonical branch and may instead be included in its Fourier trivialization.
  The differential comparison at these torsions is the fixed prime-to-$p$ isogeny comparison.
  Thus a bound for (20) detects the content in the ordinary Fourier–Jacobi lattice,
  without degree-dependent divided powers or conductor-dependent averages.

=== 8.2 The product character in the unary moment measure <the-product-character-in-the-unary-moment-measure>

The extra parameters are needed because the two unary periods need not be simultaneously nonzero at their
  respective trivial moving characters. We first explain why each period is a nonzero analytic function even when
  the true parameter has the prescribed value $t_0$.

All degree variables below lie on the narrow branches fixed in Lemma 50.
  A bounded measure on integral positions gives convergent analytic unit moments on these branches.
  For integer degrees tending to infinity, the nonunit positions have moments tending uniformly to zero.
  Hence the degree limits of the actual $B_2$ integer test are its unit-cut moments.
  The same bound applies after inserting any of the character cuts, by Lemma 54.
  On a closed interior character disk, the finite group power $\( 1 + t \)^(n_i \( x \))$ converges uniformly to
  the true character: if two exponents agree modulo $p^(a_i)$, their power ratio tends uniformly to one.
  The binomial coefficients are integral and $a_i arrow.r oo$.
  The degree-power series have uniform tails after the branch has been narrowed.
  We may therefore pass coefficientwise to limits in the joint degree and character series.

For completeness, the varying coefficient fields cause no compactness assumption here.
  Take bounded arrays in $bb(C)_p$ with seminorm $lim_(cal(U)) \| dot.op \|_p$,
  quotient by the arrays of seminorm zero, and complete the result to a field $cal(K)$.
  An array of positive limiting norm has a bounded inverse on a filter-large set,
  which proves the field assertion before completion. A nonzero element of $cal(K)$ records a uniform upper bound
  on valuation on a filter-large set of stages. Whenever we use such a bound,
  we restrict to that set and relabel the stages; all previous limits are preserved.
  The moment bounds and uniform series tails just established justify the analytic limits in $cal(K)$.
  All evaluation parameters chosen below will nevertheless lie in $bb(Z)_p$ or a fixed finite extension of $k$.

Put the moving slot parameters of $T_1$ equal to zero, and omit its moving unit cuts for the moment.
  There is then a bounded measure $mu$ on the true character group $Gamma tilde.eq bb(Z)_p$,
  with coefficients in a fixed scalar extension, and a nowhere-zero analytic unit factor $u \( d \)$,
  such that its unary period is $u \( d \)$ times the evaluation of $mu$ at

#[#set math.equation(numbering: n => "(21)")
 $ hat(cal(C))^(thin d - d_10) nu_t . $ <eq:source-21>]

The hat denotes the $p$-avatar; the two factors are pulled to $L$ by the norm.
  More explicitly write the degree branch as $d = d_10 + h n$, $n in bb(Z)_p$,
  where the fixed positive integer $h$ kills the finite conductor and torsion factors of $hat(cal(C))$.
  Put $cal(C)_Gamma = hat(cal(C))^(thin h)$, a character of $Gamma$.
  The first factor in (21) means $cal(C)_Gamma^n$; we do not require $hat(cal(C))$ itself to descend to $Gamma$.

Here is the measure identity underlying this assertion. Express the torus integral using its fixed finite
  representatives $r$ with $p$-component one, translate their finite tests to one fixed CM object,
  and evaluate all moments in that object’s fixed frames. Concretely,
  the unary moment construction is linear in the finite Schwartz test.
  For $r$ replace that test by its finite Weil translate, leaving the CM object and its differential and Igusa
  frames fixed. This changes the measure, not the position-power rule or its period normalization.
  The only representative-dependent degree factor outside that measure is the toric character at $r$.
  Let $mu_r$ be the resulting bounded measure on its two unit positions $x = \( x_sigma \)$.
  Absorb the fixed degree $d_10$ and all fixed character factors into $mu_r$.
  The remaining factor of degree $d - d_10$ and true character $t$ is

$ #scale(x: 120%, y: 120%)[\(] hat(cal(C))^(thin d - d_10) nu_t #scale(x: 120%, y: 120%)[\)] \( r \)^(- 1)
  product_sigma x_sigma^(d - d_10) nu_(t \, sigma) \( x_sigma \) . $

By the weight-character convention and CM reciprocity used in Section 7,
  the product on the right is this same character evaluated at the image $theta \( x \) in
  Gamma$ of the local units. In this description $r$ in a character argument denotes the norm-reciprocity image of
  the torus representative in $Gamma$; its finite components outside that quotient were already absorbed into
  $mu_r$. Thus the displayed factor is $#scale(x: 120%, y: 120%)[\(] hat(cal(C))^(thin d - d_10) nu_t
  #scale(x: 120%, y: 120%)[\)] \( r^(- 1) theta \( x \) \)$.
  Push each $mu_r$ forward by $x mapsto r^(- 1) theta \( x \)$ and take their fixed finite weighted sum to obtain
  $mu$. Its norm is bounded by the fixed moment and volume bounds.
  The coordinate and CM-frame powers that were removed are common to the moment evaluation, independent of $r$,
  and give $u \( d \)$. This proves (21) as a measure identity.
  In particular it is not an inference from nonvanishing at augmentation.
  If the local-unit map has image a proper open subgroup of $Gamma$,
  the pushforward construction still gives exactly the same identity, with the corresponding power map.

Let $gamma$ be the generator of $Gamma$ used to define $t$.
  The measure transform $F \( Z \) = integral_Gamma \( 1 + Z \)^(ell \( g \)) thin d
  mu \( g \)$ is a bounded series, where $g = gamma^(ell \( g \))$.
  At $d = d_10 \, t = 0$ its value is nonzero by the auxiliary unary nonvanishing. Hence $F eq.not 0$.
  For fixed $t = t_0$ its argument, in the branch coordinate $n$, is

$ Z \( n \) = \( 1 + t_0 \) cal(C)_Gamma \( gamma \)^n - 1 . $

The logarithm of $cal(C)_Gamma \( gamma \)$ on this branch is nonzero,
  since its local-unit weight has a nonzero logarithmic direction.
  Therefore $Z \( n \)$ is nonconstant on every degree disk.
  If $F \( Z \( n \) \)$ vanished there identically, one-variable analytic uniqueness,
  applied at an interior accumulation point of the distinct $Z \( n \)$, would give $F = 0$.
  This proves nonvanishing of the first period as a function of degree at the prescribed $t_0$.
  The corresponding assertion for $T_2$, which has no true-character factor,
  follows directly from its nonzero value at $d_20$.

Restore the moving unit cuts while leaving each period’s own moving character trivial.
  Subtracting the uniformizer translate of an integer unary test expresses each cut by the factors

$ 1 - alpha_v cal(C) \( gamma_v \)^(plus.minus d) . $

This is the torus-equivariance calculation of [23] equation (6.7).
  It also includes the unramified true-character value in $alpha_v$ for the first period.
  The coefficient $alpha_v$ is a nonzero $p$-unit, independent of $d$ for fixed $t$.
  The tuple conditions make $cal(C) \( gamma_v \)$ nontorsion.
  Each factor is consequently a nonzero analytic function of degree, so neither unary period becomes identically zero.

It follows that, with the original variables fixed at $z_0$, the two analytic functions

$ T_1 \( a \; upright(bold(v))' \) \, wide T_2 #scale(x: 120%, y: 120%)[\(] - 1 -
  a \; \( 1 + upright(bold(u))_0 \) \/ \( 1 + upright(bold(v))' \) - 1 #scale(x: 120%, y: 120%)[\)] $

are nonzero: for the first use $upright(bold(v))' = 0$; for the second use $upright(bold(v))' =
  upright(bold(u))_0$. Their product is nonzero in the ring of analytic functions on a closed polydisk strictly
  inside the open parameter disks and containing both these settings.
  Choose $a in bb(Z)_p$ on its degree branch and $upright(bold(v))'$ in a fixed finite extension at which the
  product is nonzero. To see that such choices suffice even over $cal(K)$,
  vary one coordinate at a time over infinite subsets of that fixed field having interior accumulation points.
  Repeated one-variable uniqueness says that vanishing on their product would force the series to be zero.

Choose positive integers $d_(1 i) \, d_(2 i)$ on the prescribed branches converging respectively to $a \, - 1 -
  a$, with both tending to infinity in the usual order. At each stage their congruences can be made arbitrarily
  accurate and their lower bounds arbitrarily large. Thus $m_i = d_(1 i) + d_(2 i) +
  1$ can simultaneously meet every fixed-stage weight approximation required by Proposition 58.
  The compatibility of the two degree branches was imposed in Lemma 50.
  Equation (20) then has uniformly bounded valuation at $z_0$.

#thm([Lemma 8.2.])[
  (Content with the local controls).  #emph[There are controlled theta sections at $z_0$,
    of weights $m_i$ as above and depths $s_i$, whose constant terms tend uniformly to zero and whose ordinary
    positive Fourier–Jacobi content has valuation bounded above by a constant independent of $i$.]
] <extraction:content>

#proof[
  The preceding argument proves the content assertion for the temporary tests.
    Restore the controls at each fixed split place by the spanning argument of [23] Lemma 6.4.
    At the auxiliary good places its finitely many Laurent denominators are nonzero at $z_0$ by Lemma 51.
    At an additive place the same local rank filtration works at the present unramified scalar.
    A supercuspidal head has no proper Jacquet module. For a ramified principal or special head with elliptic
    determinant trivial on inertia, both inducing-position characters are ramified.
    Neither can match the unramified lower-rank orbit character.
    Thus the lower-rank coinvariants vanish for every unramified scalar,
    and there is no norm linkage between this head and the trailing unramified binary block.
    The open-orbit induction is the unlinked parabolic product, hence irreducible;
    a nontrivially paired pivot generates it. In a fixed finite-level model choose a spanning minor nonzero at
    $z_0$. Cramer’s rule gives the required expression over a Laurent ring with that single minor inverted.
    This supplies the asserted finite denominators at the additive places as well.
  Cross-multiply these expressions before evaluating the group algebras.
    Their clearing factors have nonzero limits at $z_0$ and bounded inverse valuation.
    Prime-to-$p$ target translations preserve ordinary integrality,
    since their differential maps are units and base change of the canonical level is integral.
    This includes the possibly long integral sums at the moving primes:
    the nonarchimedean bound for their coefficients is one, and there is no averaging.
    If every controlled section had content tending to zero, so would every such expression, contradicting (20).
    We may therefore select a controlled section with bounded content at each stage.
    Only a bounded number of kinds of fixed local tests is needed.
    At every upper $\( 2 \, 2 \)$ control retain the two positive binary operators,
    the invertible center expansion and the full last spherical block.
    The pivot calculation is unaffected by a determinant twist on the head.
    Finally Proposition 58 applies to all these bounded test variants simultaneously,
    proving the constant-term assertion. ◻
]

=== 8.3 Cusp lifting with increasing depth <cusp-lifting-with-increasing-depth>

We give the depth dependence of the cusp lifting explicitly. The geometric inputs are [23] Lemmas 7.1–7.2:
  the target has split hyperspecial PEL datum, multiplicative height three and etale height one at $p$,
  and its upper $\( 2 \, 1 \, 1 \)$ level marks a rank-two flag and frame inside the multiplicative rank-three
  flag. The last two unit factors and the upper radical are full. No splitting of the etale quotient is marked.
  These are exactly our levels $J \( s_i \)$.

#thm([Lemma 8.3.])[
  (Uniform cusp congruence).  #emph[After one fixed reduction of precision,
    the sections in Lemma 60 give finite integral operator orders $bb(T)_i^0$ on classical cusp spaces and maps
$ lambda_i^0 : bb(T)_i^0 arrow.r cal(O)_k \/ \( p^(M_i) \) \, wide M_i arrow.r oo . $

 The maps have the tested theta values on the split good and controlled operators.
   Both normalized $p$-operators have value one. No upper bound on $s_i$ is required.]
] <extraction:cusp>

#proof[
  At each depth normalize the good toroidal model in the generic level,
    after the finite extension needed for its cyclotomic frames.
    On its canonical ordinary branch the extra level is finite etale on the Cartier-dual character group of the
    multiplicative subgroup. At a boundary chart this adds a finite etale cover of the abelian extension-data
    scheme and leaves the center Fourier parameter unchanged.
    This description holds for each integer $s_i$; it introduces no division by the degree of that cover.
  A section whose constant terms vanish modulo $p^M$ has positive Fourier–Jacobi indices.
    At such an index the Jacobi line bundle is ample on the abelian chart.
    The differential bundle has its integral column-degree filtration with constant graded pieces,
    so positive cohomology vanishes after tensoring with that ample line bundle.
    This remains true on each finite etale abelian cover. Cohomology and base change lift the positive
    coefficients modulo $p^M$. Neatness removes the finite stabilizers of positive indices,
    permitting transport of lifts along the free index orbits without dividing by an orbit order.
    Formal functions then identifies these lifts with the cusp sheaf on the ordinary open.
    This proves the base-change assertion at each $s_i$ with zero loss of precision,
    also over ramified finite coefficient extensions. Extend by zero on the other ordinary branches.
  Multiply by a sufficiently high power of Hasse to extend across the complement of the ordinary open.
    Local lifts of Hasse differ by a multiple of $p$; sufficiently divisible powers glue modulo $p^M$ and equal
    one in multiplicative differential frames. Serre vanishing after a further ample twist lifts the resulting
    global section to characteristic zero. These exponents may depend on $i \, s_i \, M$;
    the surjectivity statements themselves cost no precision.
    Choose the resulting shift $H_i$ arbitrarily large and tending to zero on every weight branch in use.
    The classical weights are
  $ lambda'_i = \( m_i + H_i \, m_i + H_i \, 1 + H_i \; - 1 - H_i \) . $
  The integral normalized operators remain uniform in depth.
    In Serre–Tate coordinates $q_1 \, q_2 \, q_3$, each graph for $U_j$ adjoins $j$ roots $u_a^p = q_a$.
    Its monomial basis gives
  $ "Tr" #scale(x: 120%, y: 120%)[\(] cal(O) \[ u_1 \, dots.h \, u_j \] \/ \( u_a^p - q_a \)
    #scale(x: 120%, y: 120%)[\)] subset p^j cal(O) . $
  The transported multiplicative flags and frames depend on the graph, not on the chosen roots,
    even when marked modulo $p^(s_i)$. They may therefore be taken outside this trace.
    The differential scalings have lower bounds $lambda'_3 + lambda'_4$ for $j = 2$ and $lambda'_4$ for $j = 3$,
    exactly as in [23] Lemma 7.3. Thus
  $ tilde(U)_2 = p^(- \( 2 + lambda'_3 + lambda'_4 \)) U_2 \, wide tilde(U)_3 = p^(- \( 3 + lambda'_4 \)) U_3 $
  preserve the integral lattice. The graph sum introduces no denominator.
    The Hasse shift changes these exponents by $0 \, - H_i$; its determinant factor changes by exactly the same
    amounts. Take $H_i$ divisible enough that all remaining unit frame factors are one modulo the chosen
    precision. The two comparison values are then one. Prime-to-$p$ operators preserve the lattice and their
    comparison values for the same reason.
  Use the intersection of the classical cusp space with the ordinary integral section module as its lattice.
    It is a full bounded lattice and is saturated for divisibility by $p^M$:
    its definition as an intersection makes this immediate. The commuting integral operators generate an
    $cal(O)_k$-algebra $bb(T)_i^0$ inside the endomorphisms of that lattice over a finite model extension of $k$.
    This is a finite torsion-free $cal(O)_k$-order: the endomorphism lattice is finite over $cal(O)_k$,
    so its submodule generated by the operators is finite. The scalar ring of the order is always $cal(O)_k$;
    only its rank and the field representing the lattice may vary with $i$.
    Denote the lifted section by $frak(s)_i$. If $P$ is any integral polynomial relation among these operators,
    application to that section gives
  $ P \( upright("comparison values") \) thin frak(s)_i equiv 0 med \( mod med p^(M_i) \) . $
  Every polynomial has this precision because all its operators are integral.
    Evaluate a positive coefficient of valuation at most $C$ from Lemma 60.
    The scalar $P \( upright("comparison values") \)$ is divisible by $p^(M_i - C)$.
    It lies in $k$, so the divisibility descends from the evaluation field.
    This is the length-one version of content cancellation, performed at $z_0$ itself.
    The initial clearing, $C$, and the neat descent index are fixed; there is no other loss.
    Decrease and relabel $M_i$, also slowing it so that every evaluated finite group relation holds.
    The scalar evaluation factors through the entire order, giving $lambda_i^0$.
    Its local target selects the residual local summand of that order, on which both $tilde(U)_j$ are units. ◻
]

=== 8.4 Local Galois controls and reduction of the order <local-galois-controls-and-reduction-of-the-order>

The congruence now has to pass to actual cusp eigensystems.
  We retain their local subquotients and inertia identities while removing operator nilpotents,
  so that these identities survive in the common limiting matrix algebra.

Apply [23] Proposition 8.5 at each stage. Its hypotheses are the group $upright(U) \( B + bb(H) \)$,
  discrete holomorphic infinity of weight $lambda'_i$ with the two sufficiently large gaps,
  the indicated split levels, and hyperspecial level at places nonsplit over $F$. These hold here.
  It supplies semisimple four-dimensional representations $rho_pi$ with

$ rho_pi^c tilde.eq rho_pi^or epsilon.alt^(- 3) \,
  wide \( h_1 \, h_2 \, h_3 \, h_4 \) = \( 1 - m_i - H_i \, 2 - m_i - H_i \, 2 - H_i \, 1 + H_i \) $

at a distinguished $p$-place. At split places their Weil–Deligne parameters have the stated local Langlands
  semisimplification and the monodromy upper bound of that proposition.
  They are unramified at nonsplit finite places. These are characteristic-zero statements at each individual level.

The positive Jacquet module at $J \( s_i \)$ allocates unramified characters to its last two slots.
  If their Frobenius roots are $alpha_3 \, alpha_4$, the normalizations just proved give

$ tilde(U)_2 = p^(h_3 + h_4) \/ \( alpha_3 alpha_4 \) \, wide tilde(U)_3 = p^(h_4) \/ alpha_4 . $

Their unit values give slopes $h_3 \, h_4$ for the allocated roots. The other two slopes sum to $h_1 + h_2$.
  The sum of the lowest two slopes is at most this sum and, by weak admissibility, at least $h_1 + h_2$;
  equality gives the contact at dimension two. The same argument with the other two roots and $alpha_3$ gives the
  contact at dimension three. The strict Hodge gaps force strict Newton gaps at these contacts.
  On each low-slope subspace the induced Hodge number is at least the sum of the corresponding lowest Hodge
  weights and at most its Newton number, so equality makes that subspace weakly admissible.
  Its canonicity also retains the descent data after a potentially semistable extension.
  Thus [23] Lemma 8.6 gives a stable flag of dimensions $2 \, 3 \, 4$ with last quotient

$ X_w = epsilon.alt^(- h_4) "unr" \( tilde(U)_3^(- 1) \) $

and, at the conjugate place, a first subline $Y_(macron(w)) = X_w^(- c) epsilon.alt^(- 3)$.
  The character comparisons hold on all local elements, uniformly, with limits $x = epsilon.alt^(- 1)$ and $y =
  epsilon.alt^(- 2)$. This argument uses the two full last unit factors of $J \( s_i \)$,
  its positive Jacquet module, and the weight gaps; none depends on a bound for $s_i$.

We also need binary projections when a Frobenius separation can vanish at $z_0$.
  At a safe auxiliary good place use the full resultant of [23] equation (8.10), which excludes ratios by $Q_v^d$,
  $\| d \| lt.eq 4$, between the head and the final binary roots.
  At an additive place choose an inertia element $iota_v$ for which both comparison head eigenvalues differ from
  one. Such an element exists: elliptic semisimple inertia is nontrivial, has determinant one, and is finite;
  in the ramified special case use an element in the ramifying component.
  At a moving place with nontrivial tested unit character choose a unit on which it is nontrivial;
  both head eigenvalues on it are that scalar. If the unit character is trivial use the Frobenius separation
  retained by Lemma 51.

For an inertia-tested place let $P_(v \, iota) \( Z \)$ be the full degree-four characteristic polynomial.
  Its coefficients belong to the operator order: good split Frobenius coefficients approximate them simultaneously
  on the finitely many systems, and the finite integral operator subalgebra is closed.
  Monic division by $\( Z - 1 \)^2$ gives a quadratic $C_(v \, iota)$ in that order; put $Delta_v =
  C_(v \, iota) \( 1 \)$. On each actual system the remainder is zero,
  since the allocated unramified final Jacquet block supplies two inertia eigenvalues one.
  The tested value of $Delta_v$ is nonzero. Let $Delta$ be the product of these factors and the good-place resultants.

#thm([Lemma 8.4.])[
  (Binary separation at an inertia test).  #emph[On an actual system with $Delta_v eq.not 0$,
    the generalized $1$-primary projection $P_v^(upright("bin"))$ of $rho_pi \( iota_v \)$ is defined and satisfies
$ \( rho_pi \( iota \) - 1 \) P_v^(upright("bin")) = 0 wide \( iota in I_v \) . $

 Together with the Frobenius-separated projections, these identities give an exponent $C_0$ independent of stage
   and depth for which
$ Delta^(C_0) ker \( bb(T)_i^0 arrow.r bb(T)_i \) = 0 \, $

 where $bb(T)_i$ is the image order in characteristic-zero eigensystems.]
] <extraction:binary>

#proof[
  The chosen element has exactly two eigenvalues one, counted with multiplicity.
    Both are already supplied by the final unramified Jacquet block,
    so the complementary Weil positions cannot contain any inertia-trivial constituent.
    Thus the entire inertia-trivial Weil summand is this binary allocation.
    An unramified norm twist does not change inertia, so no segment can cross these allocations.
    The segment classification therefore identifies the allocated final binary representation with its unramified
    spherical block, whose predicted monodromy is zero. It is necessary to check actual monodromy as well:
    the Galois construction in the cited proposition is a direct sum of shifted copies of the Galois
    representations of generic unitary cuspidal factors. Inside one copy,
    the selected local segments have length one; a longer segment would cross the inertia separation or violate
    binary sphericity. Two such unramified length-one data in a generic unitary factor have real exponents in an
    interval of width strictly less than one, so their quotient cannot be $Q_v$. Thus monodromy cannot link them.
    It cannot link different copies, which are direct summands, or link to the head, which is inertia-separated.
    The selected subspace consequently has trivial actual inertia.
    It has dimension two and is precisely the generalized $1$-primary space of the chosen element,
    proving the identity. The projection can be written explicitly.
    Suppress $v$ and write $P_(iota_v) \( Z \) = \( Z - 1 \)^2 C \( Z \)$ and $Delta_v = C \( 1 \)$. The polynomial
  $ E \( Z \) = C \( Z \) #scale(x: 120%, y: 120%)[\(] Delta_v^(- 1) -
    C' \( 1 \) Delta_v^(- 2) \( Z - 1 \) #scale(x: 120%, y: 120%)[\)] $
  is one modulo $\( Z - 1 \)^2$ and zero modulo $C \( Z \)$.
    Consequently $P_v^(upright("bin")) = E \( rho_pi \( iota_v \) \)$.
    This gives an algebraic identity with only powers of $Delta_v$ in its denominator,
    suitable for passage to the limiting corner algebra. The element $iota_v$ need not generate inertia.
  For the order, apply the geometric-lemma filtration on each joint generalized controlled-operator space.
    There are at most $4 !$ allocation terms at each controlled place.
    Taking the required compact Levi invariants and a generalized eigenspace is exact in characteristic zero.
    At an inertia-separated place the two final unramified inducing positions are forced:
    no head position can occupy an unramified slot, because its inertia eigenvalue on $iota_v$ differs from one.
    At a Frobenius-separated place the resultants force the allocation.
    The full spherical binary invariants are one-dimensional,
    so its two operators are scalars on the surviving grade. At $p$ the two contacts force the allocation to the
    $\( 2 \, 1 \, 1 \)$ Levi; both final center operators are scalars there at every depth.
    Permutations inside the head lie in the Levi Weyl group and do not create additional grades.
    Hence the separated generalized space has a single grade and no operator nilpotents.
  On a component where $Delta$ has zero eigenvalue, it acts as zero on every allocation grade and lowers this
    filtration. The bounded number of control places therefore gives a fixed power,
    for example the product of their bounds $24$, killing that component.
    The good spherical algebra is already semisimple; hence the kernel of eigensystem detection vanishes on the
    separated components and is killed by this power on the others.
    This is an operator identity in characteristic zero, and the integral order is torsion-free.
    It therefore holds in $bb(T)_i^0$ itself. ◻
]

The comparison values $lambda_i^0 \( Delta \)$ have uniformly bounded valuation,
  since they tend to the nonzero test values. Cancellation in Lemma 62 costs at most $C_0
  v_p \( lambda_i^0 \( Delta \) \)$. After decreasing precision by one constant we obtain

#[#set math.equation(numbering: n => "(8.1)")
 $ lambda_i : bb(T)_i arrow.r cal(O)_k \/ \( p^(M_i) \) \, wide M_i arrow.r oo . $ <extraction:reduced-orders>]

At a line-stabilizer parahoric the other local control is $"rank" \( rho_pi \( iota \) - 1 \) lt.eq
  1$ and unipotent inertia. Indeed a single-step flag can separate at most two positions in a Steinberg block and
  at most one such block; its predicted monodromy has rank at most one and square zero.
  The Galois monodromy bound gives the same assertion for actual inertia.
  This is also the proof of [23] Lemma 8.8, for either orientation of the line parahoric.

=== 8.5 The limiting corners and the highest-weight line <the-limiting-corners-and-the-highest-weight-line>

The remaining task is to obtain a nonzero extension of the last character by the elliptic constituent of the
  limiting four-dimensional representation. We construct the corner modules encoding these extensions and retain
  the local identities just proved.

We use the finite matrix construction of [23] Section 9, Lemmas 9.1–9.3 over the field test,
  namely with its Artin length equal to one. We record both its hypotheses and the resulting objects.
  Put $B_i = bb(T)_i \[ rho_i \]$, where $rho_i$ is the product of all characteristic-zero systems and stable
  integral lattices are chosen. Characteristic coefficients of all Galois elements lie in $bb(T)_i$.
  The residual coefficient-prime characteristic polynomials are fixed:
  reduction kills every varying group character and every weight-branch difference.
  The ramified supports have bounded cardinality. After one fixed extension killing the residual
  semisimplification, the images are pro-$p$; the global class-field bound for their number of generators depends
  on the fixed extension and number of support places, not their depths.
  Cayley–Hamilton together with the polynomial-identity bound for four-by-four matrices therefore gives a fixed
  number of monomials generating $B_i$ over $bb(T)_i$.

Let $cal(A) = product_(cal(U)) bb(T)_i$ and let $frak(q)$ be the kernel of the compact limit $cal(A) arrow.r
  cal(O)_k$ furnished by (8.1). Set

$ cal(T) = \( cal(A)_(frak(q)) \)^h \, wide lambda : cal(T) arrow.r k \, wide
  cal(B) = \( product_(cal(U)) B_i \) ⊗_(cal(A)) cal(T) . $

The ring $cal(T)$ has residue field $k$: its construction inverts every nonzero constant in $cal(O)_k$. Define

$ cal(D)_0 = product_(cal(U)) product_(pi upright(" at stage ") i) overline(bb(Q))_p \, wide cal(D) =
  cal(D)_0 ⊗_(cal(A)) cal(T) . $

The embeddings $cal(A) arrow.r.hook cal(D)_0$ and $product_(cal(U)) B_i arrow.r.hook
  M_4 \( cal(D)_0 \)$ remain injective under the flat localization and henselization.
  Thus $cal(T) arrow.r.hook cal(D)$ and $cal(B) arrow.r.hook M_4 \( cal(D) \)$ are faithful.
  The first ring $cal(D)_0$ is absolutely flat and reduced;
  localization and etale base change preserve these properties, so $cal(D)$ is also absolutely flat and reduced.
  Its field evaluations are realized in algebraically closed residue ultraproducts of the actual systems,
  with ultrafilters prolonging $cal(U)$. The finite etale choices split in those fields.
  These are the ambient realization statements of [23] Section 9.1. The limiting diagonal blocks are

#[#set math.equation(numbering: n => "(8.2)")
 $ f = V \( - 2 \) chi^(plus.minus 1) \, wide x = epsilon.alt^(- 1) \, wide y =
   epsilon.alt^(- 2) . $ <extraction:blocks>]

Here and below $chi$ is restricted to $G_L$. These identities hold on all sequences of group elements:
  the theta polynomial comparison holds at split good Frobenius elements, $cal(C)^(m_i)$ tends uniformly to one,
  and at each stage Frobenius approximation can be taken more accurate than the chosen precision.
  The blocks are absolutely simple and pairwise distinct; the simplicity of $V \|_(G_L)$ was part of the
  auxiliary-field choice. Write $rho_(*)$ for the representation in $cal(B)$ induced by the arrays $rho_i$,
  on the ultraproduct of the stage Galois groups with their marked local subgroups.

The desired coefficient is $"Hom" \( y \, f \) = V chi^(plus.minus 1)$.
  The direct corner from $y$ to $f$ must be nonzero, while paths through $x$ must not obstruct the triangular
  quotient. This explains the order of the next two lemmas:
  eliminate the cyclotomic $y$-to-$x$ extension, then force the $y$-to-$f$ corner to be nonzero by its highest
  Hodge weight.

The perfect trace pairing on $M_2 \( k \) times k times k$ makes this diagonal representation factor through
  $cal(B)$. Lift the four orthogonal rank-one idempotents by henselian factorization of an element with four
  distinct residual eigenvalues, and lift the inverse matrix units identifying the two $f$ positions.
  For $u \, v in { f \, x \, y }$ let $D_(u v)$ be the finite $cal(T)$-module of a single-entry corner from $v$ to
  $u$. Diagonal corners are $cal(T)$, and

#[#set math.equation(numbering: n => "(8.3)")
 $ lambda \( D_(u v) D_(v u) \) = 0 quad \( u eq.not v \) . $ <extraction:cycles>]

The corner-minor lemma transports a zero determinant of stacked matrices to the corresponding corner identity:
  in each determinant monomial its directed edges decompose into one path from the surplus column to the surplus
  row and diagonal cycles. This description also covers two-by-two minors and is preserved under an algebra map
  from $cal(B)$.

An algebra map from $cal(B)$ to matrices over $k$ gives admissible cochains.
  Indeed its values on the fixed finite monomial generators have one common denominator.
  Choose coefficient expressions on the finite quotients of $B_i$, apply $lambda_i$,
  and approximate those fixed matrix values. This gives continuous matrix functions with increasing uniform
  precision and that one denominator. A relation valid on all sequences is uniformly valid to increasing
  precision; otherwise a violating sequence contradicts it. The same argument applies to local splittings.

We need the comparison in the direction from these admissible cochains to the finite models,
  not only detection of model classes by evaluations. Use the integral contractions $I_i \, Q_i \,
  H_i$ of Lemma 10, with $Q_i I_i = 1$ and $1 - I_i Q_i = d H_i + H_i d$,
  after the evaluated coefficient base change modulo the current precision.
  Clear the one fixed denominator in an admissible cocycle $c_i$.
  Its cocycle defect tends uniformly to zero, so $Q_i c_i$ is a model cocycle to the same increasing precision.
  The model has bounded finite rank over the compact coefficient quotients;
  passing to its coefficient limits gives an actual cocycle over $k$.
  The homotopy identity shows that its image under $I_i$ differs from $c_i$ by the coboundary $d H_i
  c_i$ and an error tending to zero. It therefore represents the original admissible class.
  If the model class were a coboundary, its image would be an admissible coboundary by the same identity.
  Apply the construction to the marked global-local cone, including its local splitting coordinates.
  Its restriction homotopies preserve every specified local condition.
  This proves the required identification with the field tests.
  Thus no bounded local index is an extra hypothesis of this use of the cited matrix lemmas.

#thm([Lemma 8.5.])[
  (The cyclotomic corner).  #emph[The corner modules satisfy $D_(x y) = D_(x f) D_(f y)$.]
] <extraction:cyclotomic>

#proof[
  Let $Q = D_(x y) \/ \( D_(x f) D_(f y) + frak(m) D_(x y) \)$, where $frak(m) = ker lambda$.
    A functional $Q arrow.r k$ gives an extension of $y$ by $x$ with a separate $f$ block;
    all discarded products vanish by (8.3) and the definition of $Q$.
    If its Galois class splits, the splitting is preserved by the algebra generated by the group,
    hence by the corner idempotents, and the functional is zero.
    We thus obtain an injection into admissible $H^1 \( L \, k \( 1 \) \)$.
  At $macron(w)$, stack the matrices $rho_(*) \( g \) - Y_(macron(w)) \( g \)$.
    Their common kernel makes every four-row determinant zero.
    The vanishing of $"Hom"_(G_(L_(macron(w)))) \( y \, f \)$ at $z_0$ and $x eq.not
    y$ supplies three rows with an invertible minor on the competing columns $f_1 \, f_2 \, x$.
    Matrix units allow either $f$ coordinate to be used in either of the two output rows.
    Solve these three equations with $y$ coordinate one. Each remaining equation follows from its vanishing
    four-row corner minor. This gives a local $y$-eigenline, hence a splitting.
    At $w$ apply the transposed argument to the common quotient $X_w$;
    the competing minor uses $"Hom"_(G_(L_w)) \( f \, x \) = 0$.
    These are exactly the local invariant conditions retained in Lemma 51.
    The extension is therefore strict at every place above $p$.
  At a binary place the projection of Lemma 62, or its Frobenius version, is the identity on the $x \,
    y$ extension and makes inertia trivial there. At a parahoric place its two-by-two minors give
    $\( f \( iota \) - 1 \)_(a b) u \( iota \) = 0$ for every entry, where $u$ is the cyclotomic extension entry.
    Some elliptic inertia difference is nonzero. Hence $u \( iota \) = 0$ whenever that difference is nonzero;
    multiplying an element in its kernel by a fixed element outside the kernel and using the cocycle law gives
    zero there too. Elsewhere hyperspecial unramifiedness applies.
    In particular the class is unramified at the moving places and descends by the admissible comparison to the
    fixed field $L$.
  Kummer theory identifies the resulting group with $p$-units tensored with $k$,
    with zero valuations and logarithms at all $p$-places. Zero valuations leave the global units.
    The CM biquadratic field $L$ has unit rank one. A nontrivial fundamental unit has nonzero $p$-adic logarithm
    at a split $p$-place: a unit of $bb(Q)_p$ with zero logarithm is a root of unity,
    and the field embedding is injective. Thus this one-dimensional space has no element with all local logarithms
    zero. The extension vanishes, so $Q = 0$. Nakayama for the finite module $D_(x y) \/ D_(x f)
    D_(f y)$ proves the assertion. ◻
]

#thm([Lemma 8.6.])[
  (Exclusion of the last stable line at arbitrary depth).  #emph[The image of $D_(f y)$ is nonzero in every
    characteristic-zero field evaluation of the ambient ring. Consequently $"Fitt"_(0 \, cal(T)) \( D_(f y) \) = 0$.]
] <extraction:no-line>

#proof[
  If $D_(f y)$ vanished at such a field, then Lemma 63 would make $D_(x y)$ vanish there as well.
    The last idempotent line would be globally stable. The competing-column minor used at $macron(w)$ is a unit in
    $cal(T)$. In a matrix with this last line stable its upper-right column is zero.
    The common $Y_(macron(w))$ kernel, with this competing minor invertible, must therefore be the last line,
    so its character is $Y_(macron(w))$.
  These finite matrix relations pass to a filter-large set of actual systems, as in [23] proof of Lemma 9.5.
    More explicitly, stability uses only the bounded algebra generators; the idempotent, matrix-unit,
    and competing-minor relations use finitely many further matrices.
    The algebraically closed residue ultraproduct realizes the henselian choices,
    so their finite equalities and inequalities hold on actual systems.
    Thus each such system has a global one-dimensional constituent $xi$ restricting to $Y_(macron(w))$.
  The character $xi$ is de Rham and hence an algebraic Hecke character.
    Its conjugate weight sums are parallel, by the relation on the units of the real subfield.
    Its weight at $macron(w)$ is $3 - h_4$, the isolated lowest weight.
    In the construction of the Galois package it cannot belong to a factor of Arthur length greater than one:
    successive copies would also supply an adjacent integer weight, whereas the next weight is separated by $h_4 -
    h_3$. Thus its factor has length one. The strict unitary generic bounds on the unramified cuspidal roots place
    its absolute Frobenius size strictly between $Q$ and $Q^2$ after the cohomological shift.
    A character of parallel conjugate weight sum $j in bb(Z)$ has size $Q^(j \/ 2)$, so $j = 3$.
  In particular the weight of $xi$ at $w$ is $h_4$. Let $F_3
    rho_pi$ be the rank-three local subrepresentation at the second Hodge–Newton contact.
    Its weights are $h_1 \, h_2 \, h_3$, so the $xi$ line cannot be contained in it:
    the de Rham functor is exact and a subrepresentation’s weights occur in this multiset.
    Its map to $rho_pi \/ F_3 rho_pi = X_w$ is therefore nonzero, and is an isomorphism of characters.
    This identifies the entire local character of $xi$ at $w$, including its smooth factor,
    without a bound on conductor. For every local $g$ we now have the exact identity
  $ xi \( g \) xi \( g^c \) = X_w \( g \) Y_(macron(w)) \( g^c \) = epsilon.alt \( g \)^(- 3) . $
  Choose one fixed inertia element $g$ with $epsilon.alt \( g \)$ nontorsion and include $g \,
    g^c$ in the finite matrix list. The preceding identity makes
  $ \( e_y rho_(*) \( g \) e_y \) \( e_y rho_(*) \( g^c \) e_y \) - epsilon.alt \( g \)^(- 3) e_y $
  zero in the field evaluation. It is, however, a unit in $cal(T) e_y$:
    its residue under $lambda$ is $\( epsilon.alt \( g \)^(- 4) - epsilon.alt \( g \)^(- 3) \) e_y eq.not 0$.
    This contradiction proves the nonvanishing of $D_(f y)$. An element annihilating $D_(f y)$ consequently
    vanishes in every ambient field, hence is zero by reducedness and faithfulness.
    The zeroth Fitting ideal of a finite module is contained in its annihilator by the adjugate identity.
    This proves its asserted vanishing. ◻
]

=== 8.6 The extracted class is primitive <the-extracted-class-is-primitive>

Put $M = D_(f y) ⊗_(cal(T) \, lambda) k$. Fitting ideals commute with base change, so Lemma 64 gives $M eq.not 0$.
  A nonzero functional $M arrow.r k$ defines an extension of $y$ by $f$, keeping $x$ as a separate block.
  The only additional path relation is respected because

$ D_(f x) D_(x y) = D_(f x) D_(x f) D_(f y) $

and the first two factors on the right are a crossing cycle, killed by (8.3).
  The other discarded products are killed by the diagonal representation or the same cycle identity.
  Thus this is an algebra representation and yields a nonzero admissible class with coefficients

$ "Hom" \( y \, f \) = V chi^(plus.minus 1) . $

Nonzeroness follows as in Lemma 63: a Galois splitting would be preserved by the full algebra and its idempotents,
  forcing the functional to be zero. The common-kernel argument with rows of types $f \, f \, x \,
  f$ and the same invertible competing minor makes this extension split at every conjugate $p$-place.
  It has the full condition at the other half of the $p$-places.

It remains to check unramifiedness at fixed bad places; this is stronger than the relaxed conclusion used in [23]
  Proposition 9.7. At a binary-controlled place the separated projection is an inertia-fixed projection whose
  image maps identically to the $y$ quotient. Apply it to any lift of that quotient to obtain an inertia-fixed
  lift. The extension class is therefore unramified there.

At an unramified-twist Steinberg place write the extracted inertia matrix, after twisting by $y^(- 1)$, as

$ mat(delim: "(", F \( iota \), c \( iota \); 0, 1) . $

Here $F = V chi^(plus.minus 1)$ has its fixed elliptic unipotent inertia,
  since the scalar is unramified at this fixed place. The two-by-two minors on the $f$ rows and the $f \,
  y$ columns vanish by the parahoric rank bound and the corner-minor identity.
  Consequently $c \( iota \)$ belongs to $"im" \( F \( iota \) - 1 \)$ whenever $F \( iota \) eq.not 1$.
  Write $F \( iota \) = 1 + t_p \( iota \) N$, where $N eq.not 0$ has rank one and $N^2 = 0$.
  Its image $ell$ is fixed by inertia. Choose $h$ with $t_p \( h \) eq.not 0$.
  If $t_p \( iota \) = 0$, apply the already proved assertion to $iota h$ and $h$;
  the cocycle law gives $c \( iota \) in ell$. Hence all values of $c$ lie in $ell$,
  and $c$ is an additive continuous homomorphism from inertia to $ell$.
  In residue characteristic different from $p$, every such homomorphism factors through the one-dimensional tame
  pro-$p$ quotient. Thus $c \( iota \) = t_p \( iota \) v$ for some $v in ell$. Choose $b$ with $N b = v$.
  Then $c \( iota \) = \( F \( iota \) - 1 \) b$, an inertia coboundary.
  The fixed-local admissible comparison supplies an ordinary continuous representative,
  and changing that representative by a coboundary preserves the argument.
  At the other fixed places hyperspecial unramifiedness applies. At moving places retain the allowed full conditions.

Finally descend from $L$ to $K$. Since $\[ L : K \] = 2$ is invertible in $k$, induction gives

$ "Ind"_(G_L)^(G_K) \( V chi^(plus.minus 1) \|_(G_L) \) tilde.eq V chi^(plus.minus 1) xor V' chi^(plus.minus 1) . $

This is an isomorphism of the marked local diagrams. The strict half of the $p$-places descends from $K$;
  the full half does also. At a fixed non-$p$ place, restriction to a finite-index inertia subgroup detects
  unramifiedness in characteristic zero: restriction followed by corestriction is multiplication by its nonzero
  index. Unramified inflation contracts any superfluous fixed support.
  The same identities pass to our admissible cochains and finite models.
  Applying Shapiro’s lemma stagewise and then passing through the marked comparisons therefore decomposes the
  nonzero extracted class into the two primitive one-sided field tests for $V \, V'$;
  at least one component is nonzero. If the inverse scalar occurs,
  complex conjugation identifies this group with the $chi$ group on the opposite side, as fixed in Section 7.
  This contradicts the choice of $z_0$ and proves Proposition 59.

== 9 Removing the divisors of the integral quotient <sec:unit>

Fix the odd prime $p$ and the auxiliary fields of Lemma 7. The integral quotients constructed in Section 6 are

$ R = bb(Z)_p \[ \[ t \, u_1 \, dots.h \, u_d \] \] \, wide U_w = B_w \/ L_w in R \, wide w in { frak(p) \,
  macron(frak(p)) } . $

Here $t$ is the true anticyclotomic parameter. We use the descended generators of the analytic ideals;
  changing a descent generator changes these expressions only by a unit.
  The purpose of this section is to prove that $U_w$ is a unit.
  The distinction between integrality and being a unit is essential:
  the former has been proved by high finite character tests,
  whereas the latter requires the theta implication of Proposition 59.

Write $V_0 = V_p E$ and $V_1 = V_p \( E^(D') \)$. For a horizontal prime $frak(q)$ of $R$,
  meaning a height-one prime different from $\( p \)$, let $C_(a \, J)^(upright("pr"))$ denote the following
  complex over $R_(frak(q))$: the coefficient is $V_a chi$,
  the condition at every fixed non-$p$ place is unramified, the condition at a moving place is full,
  and the condition at a $p$-place is strict if it belongs to $J subset.eq { frak(p) \,
  macron(frak(p)) }$ and full otherwise. Unramified conditions here include their degree-zero terms.
  They are the exact complementary complexes of Section 3, not merely subspaces of rational degree-one cohomology.
  We call a nonzero degree-one cohomology group on a field fiber a #emph[jump].
  Thus $C_(a \, diameter)^(upright("pr"))$ and $C_(a \, { frak(p) \, macron(frak(p)) })^(upright("pr"))$ are
  respectively the both-full and both-strict complexes.

=== 9.1 Which divisors can occur? <which-divisors-can-occur>

We first relate quotient divisors to jumps. This also supplies the regularity needed to use finite characters of
  the true parameter.

#thm([Lemma 9.1.])[
  #emph[At a horizontal height-one prime the primitive one-sided complexes are perfect of amplitude $\[ 1 \, 2 \]$
    and Euler characteristic zero. If $M_(a \, w)$ is the determinant of their differential, then
$ L_(0 \, w) = D_0 M_(0 \, w) \, wide L_(1 \, w) = D_1 M_(1 \, w) $

 up to units in the testing DVR. Here $L_(0 \, w) = L_w$, $L_(1 \, w) = L'_w$,
   and $D_a$ is the product of the singular Euler determinants at the fixed non-$p$ places.
   Every irreducible divisor of either $U_w$ is horizontal and has nonzero reduction modulo $\( p \, t \)$.]
] <unit:quotient-regularity>

#proof[
  The local invariant tests can be checked before replacing the fixed conditions.
    At a $p$-place, an inertia element with nonzero true exponent gives an equation in $t$ for any invariant
    vector. A Frobenius lift gives a second equation with a nonzero exponent vector in the artificial variables.
    No height-one prime can contain both equations. This applies to the coefficient and its dual,
    so local $H^0$ and $H^2$ vanish. At a moving prime, inertia makes the complex acyclic unless its own variable
    is zero. On that divisor the Frobenius determinant is nonzero:
    setting all parameters to zero gives the chosen Tate action without eigenvalue one.
    Hence the moving local complexes are acyclic on every horizontal height-one test.
    Global invariants vanish because the untwisted planes are absolutely simple and a scalar twist cannot create a
    stable line.
  The unramified complexes at the remaining places include $H^0$ and are exact complements under duality.
    The same holds at the companion’s nonsplit ramified places, where the inertia invariants are zero.
    The invariant vanishings, Poitou–Tate duality, and Euler characteristic calculation therefore give the
    asserted amplitude and equal ranks. The localization triangles identify the quotient of a full fixed-place
    condition by its unramified condition with residue cochains on inertia coinvariants,
    twisted by $\( - 1 \)$ and shifted to degrees $1 \, 2$. Its determinant is the corresponding Euler factor.
    Multiplication of determinant lines gives the two displayed identities.
    In particular $v_(frak(q)) \( M_(a \, w) \) gt.eq 0$, and $M_(a \, w)$ vanishes on the field fiber exactly
    when that one-sided complex jumps.
  By (11), at this DVR
  $ U_w = upright("unit") dot.op \( b_w^0 \)^2 \/ M_(0 \, w) . $
  Consequently $v_(frak(q)) \( U_w \) > 0$ implies $v_(frak(q)) \( b_w^0 \) > 0$, even when $D_0$ also vanishes.
    Proposition 59 then gives a one-sided jump for one of the two representations.
    Thus $frak(q)$ divides one of $L_(0 \, frak(p)) \, L_(0 \, macron(frak(p))) \, L_(1 \, frak(p)) \,
    L_(1 \, macron(frak(p)))$. Each of these determinants has nonzero reduction modulo $\( p \, t \)$ by (1).
    A factor of such a determinant also has nonzero reduction modulo $\( p \, t \)$,
    since $R \/ \( p \, t \)$ is a domain. Finally $p divides.not B_w$ by (14); integrality of $U_w$ and $B_w =
    L_w U_w$ imply $p divides.not U_w$. ◻
]

#thm([Lemma 9.2.])[
  (Equality of the two quotient ideals).  #emph[For every auxiliary tuple satisfying the preceding requirements,
#[#set math.equation(numbering: n => "(17)")
 $ \( U_w \) = \( U_(macron(w)) \) $ <eq:source-17>]

 in $R$.]
] <unit:association>

#proof[
  The preceding lemma and factoriality show that $U_w$ has nonzero reduction modulo $\( p \, t \)$:
    it is a unit times a finite product of factors with that property. The same is true for $U_(macron(w))$.
    Proposition 46 says that their specializations at every sufficiently high finite $p$-power character of $t$
    are associates after inverting $p$ and extending the constants.
  Both quotients are bounded integral series, so the regularity just verified is precisely the hypothesis of
    Lemma 18. Apply it first with $\( L \, B \) = \( U_w \, U_(macron(w)) \)$ and then with the two interchanged.
    The characterwise association supplies divisibility, with all multiplicities, in each application.
    The constant extension is faithfully flat; equivalently the integral Weierstrass remainder in that lemma
    vanishes after extension and hence before it. We obtain $U_w divides U_(macron(w))$ and $U_(macron(w)) divides
    U_w$ in $R$. Mutual divisibility in this domain proves (17). ◻
]

=== 9.2 The algebra of simultaneous jumps <the-algebra-of-simultaneous-jumps>

We will add finitely many tame variables. Their first-order cup tests detect liftability of classes.
  The following algebra explains why the available tests exclude a divisor, rather than merely a generic jump.
  We prove the augmented alternating-matrix and tangent-minor lemmas,
  as well as the simultaneous version needed for the two elliptic representations.

#thm([Lemma 9.3.])[
  (Augmented alternating matrices).  #emph[Let $k$ have characteristic zero and let $s gt.eq 1$. On
$ W_s = "Alt"_s \( k \) xor "Mat"_(s \, 2) \( k \) $

 the locus where $\[ A divides B \]$ has rank less than $s$ has codimension at least two.
   If $s_0 \, s_1$ are positive even integers, the locus
$ { \( A_0 \, A_1 \) : det A_0 = det A_1 = 0 } subset.eq "Alt"_(s_0) \( k \) xor "Alt"_(s_1) \( k \) $

 also has codimension at least two.]
] <unit:augmented-alternating>

#proof[
  For the first assertion introduce $\[ v \] in upright(bold(P))^(s - 1)$ and impose $v^(sans(t)) A =
    0$ and $v^(sans(t)) B = 0$. For fixed $\[ v \]$ these are $\( s - 1 \) + 2$ independent linear conditions:
    after a change of basis they are the nontrivial entries of the first row of $A$ and the two entries of the
    first row of $B$. If $N = dim W_s$, the incidence variety has dimension $N - 2$.
    Projection from its projective factor is proper and its image is exactly the rank-defect locus,
    which proves the assertion.
  For a positive even size the determinant of an alternating matrix is a nonzero nonconstant polynomial:
    it vanishes at zero and is nonzero on a block diagonal matrix with blocks $mat(delim: "(", 0, 1; - 1, 0)$.
    Its zero locus is therefore a hypersurface. The two loci in the second assertion involve disjoint coordinate
    sets; their product has codimension two. ◻
]

#thm([Lemma 9.4.])[
  (First-order tests and formal codimension).  #emph[Let $\( A \, frak(m) \, k \)$ be a regular local ring with
    $"char" k = 0$. Let $D : A^s arrow.r A^r$, $r gt.eq s gt.eq 1$, have entries in $frak(m)$,
    and let $D_1$ be its linear part on the tangent space $T_A = "Hom"_k \( frak(m) \/ frak(m)^2 \, k \)$.
    Suppose there is a linear injection $iota : W_s arrow.r T_A$ such that, over every extension field $k' \/ k$,
$ ker D_1 \( iota \( A_0 \, B \) \) subset.eq ker \[ A_0 divides B \]^(sans(t)) . $

 Then the maximal-minor ideal $I_s \( D \)$ has height at least two.]
  #emph[There is also a simultaneous version. Let $D_a : A^(s_a) arrow.r A^(r_a)$, $r_a gt.eq s_a > 0$, for $a =
    0 \, 1$, have zero residue, with $s_a$ even. Suppose a linear injection
$ iota : "Alt"_(s_0) \( k \) xor "Alt"_(s_1) \( k \) arrow.r T_A $

 satisfies, for every extension $k' \/ k$, every $\( A_0 \, A_1 \)$ over $k'$, and each $a = 0 \, 1$,
$ ker #scale(x: 120%, y: 120%)[\(] \( D_a \)_1 \( iota \( A_0 \, A_1 \) \) #scale(x: 120%, y: 120%)[\)] subset.eq
  ker A_a . $

 Then $I_(s_0) \( D_0 \) + I_(s_1) \( D_1 \)$ has height at least two.]
] <unit:tangent-minors>

#proof[
  In the first case the rank-defect locus on the slice is contained in the locus of Lemma 67.
    The full tangent rank-defect locus is a homogeneous closed cone.
    A codimension-one component, after algebraic closure of $k$,
    would have a nonconstant homogeneous defining polynomial $h$.
    Its restriction to the slice is either zero, in which case the entire slice lies in the rank-defect locus,
    or is homogeneous of positive degree, in which case a hypersurface of the slice lies there.
    Both conclusions contradict the codimension-two bound on the slice.
    The tangent rank-defect locus thus has codimension at least two.
  Each nonzero maximal minor of $D_1$ is the degree-$s$ initial form of the corresponding minor of $D$. Hence
  $ I_s \( D_1 \) subset.eq "in"_(frak(m)) I_s \( D \) . $
  The associated graded ring of $A$ is a polynomial ring over $k$,
    and passage to the initial ideal preserves the dimension of the quotient. The asserted height bound follows.
  For the simultaneous assertion use the closed cone defined by the sum of the two tangent minor ideals.
    Its intersection with the slice is contained in the simultaneous alternating-defect locus,
    which has codimension two by the second part of Lemma 67. The same homogeneous restriction argument applies.
    Initial forms of the minors of each size lie in the initial ideal of the sum,
    so the same dimension argument proves the simultaneous assertion. ◻
]

=== 9.3 Adding directions at the possible divisors <adding-directions-at-the-possible-divisors>

There are only finitely many irreducible factors of $U_w U_(macron(w))$.
  For each corresponding old horizontal prime $frak(q)$, write $k_(frak(q)) = "Frac" \( R \/ frak(q) \)$.
  We now apply the arithmetic direction construction to these finitely many fields.
  The new variables will be denoted $y_1 \, dots.h \, y_n$, and $S = R \[ \[ y_1 \, dots.h \, y_n \] \]$.
  For any such enlarged tuple, form its marked global and local models over $S$.
  Over $A_(frak(q)) = S_(\( frak(q) \, upright(bold(y)) \))$ replace the fixed non-$p$ conditions by the
  unramified complexes, using the constant inertia action and varying unramified scalar.
  This defines complexes $tilde(C)_(a \, J)^(upright("pr"))$ over $A_(frak(q))$ with exactly the same conditions
  as $C_(a \, J)^(upright("pr"))$ above. In what follows their jump loci mean the loci where $H^1$ of the derived
  field fiber is nonzero. For the one-sided and both-strict complexes used below,
  amplitude $\[ 1 \, 2 \]$ and nonnegative Euler characteristic identify these with the closed loci defined by
  maximal minors of the degree-one differential.

#thm([Proposition 9.5.])[
  #emph[The new tame directions can be chosen so that, for every such $frak(q)$,
    the following two loci have codimension at least two in $"Spec" S_(\( frak(q) \, upright(bold(y)) \))$:]
  + #emph[the locus where both one-sided primitive complexes for a single representation jump;]
  + #emph[for each allocation of sides, the locus where one one-sided primitive complex for each of $V_0 \, V_1$ jumps.]
  #emph[The old complexes are recovered on setting $upright(bold(y)) = 0$,
    and the determinant and analytic specialization identities of Lemma 43 remain integral identities up to units.]
] <unit:simultaneous-jumps>

#proof[
  There are finitely many old tests, the tuple satisfies (1)(b),
    and at least two independent old inertia variables remain. These are the hypotheses of Lemma 29.
    Apply that lemma to both representations and all old tests.
    It makes each new prime Frobenius-acyclic at every test, retains a nonzero old exponent at that prime,
    and preserves the Tate, weight, radical, and fixed theta prescriptions.
    Its construction also shows that at least one old inertia scalar has infinite order at each test;
    we use that scalar in the evaluation argument below.
  The new logarithms are zero at the old support, including the old moving primes.
    Unramified inflation and the marked comparisons of Lemma 10 identify the specialized complexes with the old
    ones. The same comparisons hold after localization at $\( frak(q) \, upright(bold(y)) \)$ and at all its
    generizations. All local conditions remain exact complements;
    in particular the unramified fixed-place comparisons retain their cup nullhomotopies.
    Their perfect complexes have the amplitudes used below.
  For one representation, the conjugate self-duality and Lemma 25 make a minimal one-sided differential
    alternating. Its generic fiber is acyclic by (1). It follows that every one-sided jump has even dimension.
    If the both-strict degree-one dimension on a field fiber is $s$,
    duality and Euler characteristic make the both-full dimension $s + 2$.
    The two one-sided spaces embed in the both-full space and have intersection the both-strict space.
    In particular, if $s = 0$ they cannot both be nonzero: each would have dimension at least two inside a
    two-dimensional space, and their intersection would then be nonzero.
    Thus the locus in assertion (1) is contained in the both-strict jump locus.
  At the old field $k_(frak(q))$ let $x_1 \, dots.h \, x_s$ be a basis of the both-strict space and let $d_1 \,
    dots.h \, d_(s + 2)$ be a basis of the conjugate both-full space,
    with the first $s$ vectors corresponding to the conjugates of the $x_i$.
    Scalar localization in degree two is injective by the scalar models of Section 4.
    We can therefore form the cup primitives used in Lemma 26.
    For a new direction $lambda$, a first-order correction $x^(\( 1 \))$ to $x$ must satisfy $d x^(\( 1 \)) = -
    lambda union x$. Pairing with $d$ and applying the transferred invariant sum gives the Frobenius test of that
    lemma. At old places $lambda = 0$. At another new prime $lambda$ is unramified;
    after the local acyclic trivialization both factors are unramified, and their invariant cup is zero.
    Thus these tests add linearly when several new directions are used.
  For completeness, their span has precisely the form needed in Lemma 68.
    On the termwise joint kernel of the Tate and old character actions, the evaluations of the $x_i \,
    d_j$ are additive and detect their classes by Lemma 12. The absolutely simple coefficient planes with opposite
    scalar twists are nonisomorphic, as detected on the infinite-order old inertia scalar.
    Joint evaluations therefore span the full tuples. Multiplying a Frobenius address by a commutator
    $\[ v \, v' \]$ in this kernel preserves its Tate and old character values and all radical prescriptions,
    since its action on the radical extension is abelian. The cup-primitive value changes by
  $ - e \( x \( v \) \, d \( v' \) \) + e \( x \( v' \) \, d \( v \) \) \, $
  with the conjugate expression subtracted at the other prime.
    Elementary evaluation pairs consequently span all skew entries in the first $s$ columns and all entries in the
    last two columns. This is the space $\[ A divides B \]$ of Lemma 67.
    Finitely many addresses suffice; finite-precision Chebotarev realizes them with the old markings retained,
    as proved in Lemma 27.
  Put $A = A_(frak(q)) = S_(\( frak(q) \, upright(bold(y)) \))$;
    this is regular local with residue field $k_(frak(q))$ of characteristic zero.
    Cancel the invertible differential blocks there. The both-strict model becomes $D : A^s arrow.r
    A^(s + 2)$ with zero residue. A vector in the kernel of its first-order differential is a liftable class and
    hence is annihilated by the cup tests. Choosing a linear section of their span gives the injected tangent
    slice in Lemma 68. The identities are identities of finite matrices,
    so this kernel inclusion persists over every extension of $k_(frak(q))$.
    That lemma proves codimension at least two. If $s = 0$, the minimal degree-one term is zero and there is no
    jump in this local spectrum. This proves assertion (1).
  For assertion (2) use the two indicated one-sided spaces, of dimensions $s_0 \, s_1$.
    If either is zero there is again no joint jump in the local spectrum. Otherwise both dimensions are even.
    The four coefficient planes, consisting of each representation with each of the two opposite scalar twists,
    are pairwise nonisomorphic. Opposite twists are distinguished by old inertia.
    For the remaining comparison, $V_0 \|_(G_L)$ is absolutely simple.
    An isomorphism $V_0 tilde.eq V_0 ⊗ chi_(L \/ K)$ would restrict to a scalar on $G_L$ by Schur’s lemma,
    and its intertwining equation on the other coset would say that a nonzero scalar equals its negative.
    Such an isomorphism is impossible. This also applies to the twisted planes.
  Joint evaluation spanning and the same commutator calculation therefore provide an independent slice
    $"Alt"_(s_0) xor "Alt"_(s_1)$ for the two one-sided differentials. Apply the simultaneous part of Lemma 68.
    It gives codimension at least two for the joint jump locus, proving assertion (2).
  Finally take the union of the finite direction lists for every old test and every allocation of sides.
    Every new prime was made acyclic at every test. Hence adjoining another list changes none of the old field
    spaces, and the vanishing of the cross-prime invariants proved above preserves each list’s tangent slice.
    This proves the simultaneous assertion. The nonzero old exponent also preserves (1) after adjoining a prime:
    on $upright(bold(y)) = 0$ its singular determinant is nonzero modulo $\( p \, t \)$.
    The remaining tuple prescriptions, including the fixed theta tests, were retained in the finite tables.
    The exact norm and localization identities of Lemma 43 therefore apply to the enlarged tuple. ◻
]

=== 9.4 The integral unit comparison <the-integral-unit-comparison>

We can now exclude every factor, including factors whose high finite-character specializations are units.
  The argument uses specialization in the new tame variables over $bb(Z)_p$.

#thm([Theorem 9.6.])[
  #emph[The two quotients $U_w$ are units. Their specialization with all artificial variables zero gives an
    integral unit comparison between the analytic series and strict determinant on the true anticyclotomic line.]
] <unit:unit-comparison>

#proof[
  Choose the enlargement in Proposition 69 and put tildes on its quotients. By Corollary 49,
  $ tilde(U)_w \( t \, upright(bold(u)) \, 0 \) = epsilon_w \( t \, upright(bold(u)) \)
    U_w \( t \, upright(bold(u)) \) \, wide epsilon_w in R^times . $
  Indeed both numerator and denominator acquire the same square of each factor in (13).
    Those factors are nonzero; cancellation in the fraction field proves the identity,
    and the marked integral determinant triangles make $epsilon_w$ an integral unit.
  Suppose an irreducible $F$ divided one enlarged quotient. It is horizontal by Lemma 65.
    Its specialization $F_0 = F \( t \, upright(bold(u)) \, 0 \)$ is nonzero,
    since it divides the nonzero specialized quotient. It is a nonunit:
    a unit specialization would give a unit constant term of $F$ in the local ring $S$.
    Choose an irreducible factor $f$ of $F_0$ in $R$. The displayed identity makes $f$ an old quotient divisor;
    in particular $f eq.not p$. Moreover $F in \( f \, upright(bold(y)) \)$,
    so $\( F \)$ survives as a height-one prime in $S_(\( f \, upright(bold(y)) \))$.
  Equation (17) for the enlarged tuple shows that $F$ divides both enlarged quotients.
    The calculation in Lemma 65 makes both undepleted analytic series vanish on this prime.
    Applying the two conjugate theta implications, either one representation jumps on both sides,
    or a one-sided complex for each representation jumps. Each possibility is excluded at a height-one prime of
    $S_(\( f \, upright(bold(y)) \))$ by Proposition 69. This contradiction proves that the enlarged quotients are
    units. Their specialization, and the displayed identity, imply that the original quotients are units too.
    If there were no old divisors, the original quotients were already units and the argument requires no enlargement.
  Removing all artificial variables uses the same integral specialization identity.
    The restored factors (13) are nonzero even if they are not units at the center,
    and occur with the same multiplicity on both sides. Their cancellation leaves a unit in
    $bb(Z)_p \[ \[ t \] \]$. No loss of $p$-adic precision occurs in this passage. ◻
]

== 10 The central value and the exact formula <sec:center>

The unit comparison now identifies the central valuation of the strict determinant with the logarithmic expression
  of (12). We compute that determinant in the full Tate lattice.
  This is where the point index, torsion, and every local component number enter the equality.

=== 10.1 The central determinant volume <the-central-determinant-volume>

Keep $p > 2$ fixed. Put $K = bb(Q) \( sqrt(D) \)$ as in Lemma 7,
  and let $P_K in E \( K \)$ be the single Hilbert-class trace used in (12).
  The simple zero of $L \( E \/ K \, s \)$ and Theorem 8 make $P_K$ nontorsion.
  The group $E \( K \)$ has rank one and $"Sha" \( E \/ K \)$ is finite:
  the two rational factors have analytic ranks adding to one,
  and the quadratic restriction-of-scalars isogeny transfers rank and finiteness. Define

$ n_P = v_p #scale(x: 120%, y: 120%)[\(] \[ E \( K \) \/ E \( K \)_(upright("tors")) : bb(Z) overline(P)_K \]
  #scale(x: 120%, y: 120%)[\)] \, quad tau_g = v_p \( \# E \( K \)_(upright("tors")) \) \, quad s_K =
  v_p \( \# "Sha" \( E \/ K \) \) . $

For a rational finite prime $q$ write $tau_q = v_p \( \# E \( bb(Q)_q \) \[ p^oo \] \)$,
  and write $log_(omega_E) E \( bb(Q)_p \) = p^l bb(Z)_p$. All primes in the fixed support $S^compose$ of the
  $E \/ K$ comparison are split in $K$; thus their two local quantities equal the corresponding rational
  quantities. The modular differential factor is the actual rational number $c_E$ in $phi.alt^(*) omega_E =
  c_E f thin d q \/ q$.

#thm([Proposition 10.1.])[
  #emph[Let $C_w^(s = 1) \( 0 \)$ be the actual central strict/full complex after all artificial variables have
    been removed. Its differential determinant satisfies
#[#set math.equation(numbering: n => "(22)")
 $ - v_p \( L_w^(s = 1) \( 0 \) \) & = d \( C_w^(s = 1) \( 0 \) \, 1 \)\
 & = 2 n_P + 2 tau_g - s_K - 2 #scale(x: 120%, y: 120%)[\(] v_p \( log_(omega_E) P_K \) - l +
   tau_p #scale(x: 120%, y: 120%)[\)] - 2 sum_(q in S^compose) tau_q . $ <eq:source-22>]

 Consequently
#[#set math.equation(numbering: n => "(23)")
 $ 2 \( n_P + tau_g \) = s_K + 2 v_p \( c_E \) + 2 sum_q v_p \( c_q \( E \) \) \, $ <eq:source-23>]

 where the last sum ranges over all rational finite primes.]
] <center:exact-factor>

#proof[
  After removal of the artificial variables, the marked arithmetic models compute the fixed-support complex over
    $K$ itself by Lemma 10. Central specialization is derived specialization of its finite free model.
    In particular it retains the finite local Kummer modules and their invariant torsion.
    The strict/full complex is rationally acyclic: the global compact Selmer space is the line generated by $P_K$,
    and its localization at each $p$-place is nonzero, since the kernel of the elliptic logarithm on local points
    is torsion. Exact complementary duality, or Lemma 15, then gives the acyclicity.
    The inverse-determinant convention consequently gives the first line of (22).
  Begin with the all-Kummer complex. By Lemma 17, its class-functional tensor has valuation
  $ d \( C_(upright("Kum")) \, \( P_K \, P_K^or \) \) = 2 n_P + 2 tau_g - s_K . $
  Here the torsion lengths in degrees one, two, three are $tau_g \, s_K \, tau_g$,
    and both occurrences of the point contribute its index $n_P$. Thus this is a calculation on the full lattice.
  First compare the paired $p$-adic Kummer lines with strict at $w$ and full at $macron(w)$,
    keeping the Kummer conditions at every non-$p$ place. Denote this intermediate complex by
    $C_w^(upright(K u m - a w a y))$; it differs from $C_w^(s = 1) \( 0 \)$ only at the non-$p$ support places.
    The unchanged conditions are thus still exact complements, as required by Lemma 15.
    Choose a free local Kummer generator $e$ with logarithm generating $p^l bb(Z)_p$.
    Localization of $P_K$ has free coordinate of valuation $v_p \( log_(omega_E) P_K \) - l$.
    The local Kummer complex also contains degree-one torsion of length $tau_p$;
    its volume in this rational basis is therefore $tau_p$. The two paired localization triangles in (3.4)
    subtract twice the sum of these two quantities, giving
  $ d \( C_w^(upright(K u m - a w a y)) \, 1 \) = 2 n_P + 2 tau_g - s_K -
    2 #scale(x: 120%, y: 120%)[\(] v_p \( log_(omega_E) P_K \) - l + tau_p #scale(x: 120%, y: 120%)[\)] . $
  Now relax the conditions at the non-$p$ support places. At such a place compact $H^1$ is already the completed
    point module, while the quotient of full cochains by the Kummer condition has degree-two torsion of length
    $tau_q$, by local duality. Its inverse-determinant valuation is $- tau_q$.
    Each rational $q in S^compose$ gives two places of $K$, hence a total change $- 2 sum_(q in S^compose) tau_q$.
    These last comparisons use determinant multiplication in localization triangles and do not require full local
    conditions to be self-complementary. Combining the two changes proves (22).
    In particular the torsion term $tau_p$ cannot be discarded by replacing the point module by its free quotient.
  By Theorem 70 the analytic series and strict determinant on the true line differ by an integral unit.
    Their values at $t = 0$ are therefore of the same valuation. Equation (12) gives
  $ v_p \( L_w^(s = 1) \( 0 \) \) = - 2 v_p \( c_E \) + 2 v_p \( log_(omega_E) P_K \) + 2 v_p \( P_p \( 1 \) \) +
    2 sum_(q in S^compose) v_p \( P_q \( 1 \) \) . $
  Every argument of $v_p$ in this display is nonzero. In particular $P_q \( 1 \)$ is a nonzero inverse local Euler
    factor, and the point logarithm is nonzero as observed above.
  Set $h = v_p \( log_(omega_E) P_K \)$, $e_q = v_p \( P_q \( 1 \) \)$, and $c = v_p \( c_E \)$.
    Equating this last expression with the negative of (22), then cancelling $2 h$, gives
  $ 2 n_P + 2 tau_g = s_K + 2 c + 2 \( tau_p - l - e_p \) + 2 sum_(q in S^compose) \( tau_q - e_q \) . $
  The Haar identities of Lemma 16 identify the parentheses with $v_p \( c_p \( E \) \)$ and
    $v_p \( c_q \( E \) \)$, respectively. All bad primes are in the fixed support,
    and every omitted good prime has component number one. This proves (23) with the sum over all finite primes. ◻
]

#thm([Corollary 10.2.])[
  #emph[For every elliptic curve of analytic rank zero or one, including CM curves,
    and for the imaginary twist in Lemma 7,
#[#set math.equation(numbering: n => "(24)")
 $ X \( E \) + X \( E^D \) = 0 . $ <eq:source-24>]

]
] <center:pair-discrepancy>

#proof[
  The full group index in Proposition 9 has valuation
  $ v_p \( \[ E \( K \) : bb(Z) P_K \] \) = n_P + tau_g . $
  Substitute (23) into the resulting valuation identity (2.5). Its right-hand side is zero, proving (24).
    That arithmetic-volume identity already uses the total real periods, full-lattice regulator,
    and height diagonal $H$. The field-degree factor over $K$ is included there; none is appended here. ◻
]

=== 10.2 CM curves and assembly <cm-curves-and-assembly>

The single-curve inequality applies to non-CM curves. The rank-zero CM case instead has the following independent
  input, which we state at its exact scope.

#thm([Lemma 10.3.])[
  #emph[If $E \/ bb(Q)$ has complex multiplication and $L \( E \, 1 \) eq.not 0$,
    the exact BSD formula holds for $E$ with the normalizations of Section 1.]
] <center:cm-zero>

#proof[
  Let $M$ be the CM field. Theorem 1.1 and Corollary 1 of Burungale–Flach [5] give exact BSD for an elliptic curve
    $A \/ F$ with CM by the maximal order of $M$, provided $F \( A_(upright("tors")) \) \/
    M$ is abelian and the associated Hecke $L$-value at one is nonzero.
    We verify these hypotheses after an isogeny over $M$.
  All CM endomorphisms of $E_M$ are defined over $M$. If the endomorphism order is not maximal,
    at each prime $ell$ replace $T_ell E$ by its span under $cal(O)_M ⊗ bb(Z)_ell$ in $V_ell E$.
    These are Galois-stable lattices, equal to the original lattices except at the finitely many primes dividing
    the conductor of the order. Their finite quotients define a finite Galois-stable subgroup of $E$,
    and quotienting gives an elliptic curve $A \/ M$ isogenous to $E_M$ with maximal-order CM.
    Its Tate modules have rank one over the corresponding local CM orders.
    The Galois actions commute with those orders, so their images, and hence the full torsion extension over $M$,
    are abelian.
  Choose a nonzero trace-zero CM endomorphism after multiplying by an integer to make it integral.
    Galois conjugation outside $M$ sends it to its negative. The twisting descent criterion therefore gives a
    $bb(Q)$-isogeny from the quadratic twist $E^M$ to $E$. In particular
  $ L \( E \/ M \, s \) = L \( E \/ bb(Q) \, s \) L \( E^M \/ bb(Q) \, s \) = L \( E \/ bb(Q) \, s \)^2 . $
  This has nonzero value at one. Isogeny does not change that $L$-function,
    and its factorization into the Hecke character and conjugate Hecke character $L$-functions shows that the
    nonvanishing hypothesis of Burungale–Flach holds for $A$.
    Their theorem gives exact BSD over $M$, and isogeny invariance transfers it to $E_M$.
  Finally restriction of scalars is compatible with the BSD arithmetic volume, and
  $ "Res"_(M \/ bb(Q)) E_M med tilde.op_(bb(Q)) med E times E^M med tilde.op_(bb(Q)) med E^2 . $
  Thus the normalized BSD discrepancy for $E$ has square one. It is positive:
    analytic rank zero gives rank zero and finite $"Sha"$, so the two-primary result supplies positivity and
    rationality. It is therefore one. This is the descent argument of Burungale–Flach, Corollary 2,
    using the restriction-of-scalars and isogeny compatibilities of [6,19];
    the preceding lattice argument supplies the additional nonmaximal-order case. ◻
]

#thm([Proposition 10.4.])[
  #emph[For every elliptic curve $E \/ bb(Q)$ of analytic rank zero or one and every odd prime $p$,
$ v_p \( Q_E \) = v_p \( \# "Sha" \( E \/ bb(Q) \) \) . $

]
] <center:odd-valuations>

#proof[
  For a non-CM curve, the single-curve inequality (8) gives $X \( E \) gt.eq 0$.
    Its twist $E^D$ is also non-CM and has the complementary analytic rank,
    so the same inequality gives $X \( E^D \) gt.eq 0$. Their sum is zero by (24); hence $X \( E \) = 0$.
  For a CM curve of analytic rank zero use Lemma 73. For a CM curve of analytic rank one,
    the companion $E^D$ is CM of analytic rank zero. That lemma and (24) again give $X \( E \) = 0$.
    The construction was made for an arbitrary odd $p$, including $p = 3$,
    so the displayed equality holds at every odd prime. ◻
]

#proof[
  Apply the low-corank converse (Theorem 2) at the prime $q$ in the hypothesis.
    It gives $a \( E \) = r \( E \) = s_q \( E \) in { 0 \, 1 }$ and finiteness of the whole
    $"Sha" \( E \/ bb(Q) \)$. The Kummer exact sequence then gives $s_p \( E \) = r \( E \)$ for every prime $p$,
    in particular $s_2 \( E \) lt.eq 1$. The two-primary formula (Theorem 3) gives positivity and rationality of
    $Q_E$ and its correct $2$-adic valuation. Proposition 74 supplies its correct valuation at every odd prime,
    independently of $q$. Consequently the positive rational number $Q_E \/ \#
    "Sha" \( E \/ bb(Q) \)$ has zero valuation at every rational prime.
    Its prime factorization is empty, so it equals one. Substituting the definition of $Q_E$ is exactly the
    asserted real formula, with the total real period and full Mordell–Weil regulator. ◻
]

#heading(level: 1)[References]
#bibitem([1])[B.~J. Birch and H.~P.~F. Swinnerton-Dyer, #emph[Notes on elliptic curves. II], J. Reine Angew. Math.
  #strong[218] (1965), 79--108. #link("https://doi.org/10.1515/crll.1965.218.79")[doi:10.1515/crll.1965.218.79].]
#bibitem([2])[S. Bloch and K. Kato, #emph[$L$-functions and Tamagawa numbers of motives],
  in #emph[The Grothendieck Festschrift], Vol.~I, Progr. Math. #strong[86], Birkhäuser, Boston, 1990, 333--400.
  #link("https://doi.org/10.1007/978-0-8176-4574-8_9")[Publisher's reprint].]
#bibitem([3])[F.~A. Bogomolov, #emph[Points of finite order on an abelian variety], Izv. Akad. Nauk SSSR Ser. Mat.
  #strong[44] (1980), no.~4, 782--804; English translation, Math. USSR-Izv. #strong[17] (1981), no.~1, 55--72.
  #link("https://doi.org/10.1070/IM1981v017n01ABEH001329")[English edition].]
#bibitem([4])[C. Breuil, B. Conrad, F. Diamond, and R. Taylor,
  #emph[On the modularity of elliptic curves over $bb(Q)$: wild $3$-adic exercises], J. Amer. Math. Soc.
  #strong[14] (2001), no.~4, 843--939.
  #link("https://doi.org/10.1090/S0894-0347-01-00370-8")[doi:10.1090/S0894-0347-01-00370-8].]
#bibitem([5])[A.~A. Burungale and M. Flach, #emph[The conjecture of Birch and Swinnerton-Dyer for certain elliptic
  curves with complex multiplication], Cambridge J. Math. #strong[12] (2024), no.~2, 357--415.
  Theorem locators follow #link("https://arxiv.org/abs/2206.09874v3")[arXiv:2206.09874v3], 4 September 2023.]
#bibitem([6])[J.~W.~S. Cassels, #emph[Arithmetic on curves of genus $1$. VIII.
  On conjectures of Birch and Swinnerton-Dyer], J. Reine Angew. Math. #strong[217] (1965), 180--199.
  #link("https://doi.org/10.1515/crll.1965.217.180")[doi:10.1515/crll.1965.217.180].]
#bibitem([7])[C.-L. Chai, #emph[Families of ordinary abelian varieties:
  canonical coordinates, $p$-adic monodromy, Tate-linear subvarieties and Hecke orbits], preprint, 30 July 2003.
  #link("https://www2.math.upenn.edu/~chai/papers_pdf/fam_ord_av.pdf")[Author's manuscript].]
#bibitem([8])[P. Deligne and M. Rapoport, #emph[Les schémas de modules de courbes elliptiques],
  in #emph[Modular Functions of One Variable II], Lecture Notes in Math.
  #strong[349], Springer, Berlin, 1973, 143--316. #link("https://doi.org/10.1007/978-3-540-37855-6_4")[Publisher
  record].]
#bibitem([9])[V.~G. Drinfeld, #emph[Two theorems on modular curves], Funct. Anal. Appl.
  #strong[7] (1973), no.~2, 155--156. #link("https://doi.org/10.1007/BF01078890")[doi:10.1007/BF01078890].]
#bibitem([10])[W.~T. Gan, Y. Qiu, and S. Takeda, #emph[The regularized Siegel--Weil formula (the second term
  identity) and the Rallis inner product formula], Invent. Math. #strong[198] (2014), no.~3, 739--831.
  #link("https://doi.org/10.1007/s00222-014-0509-0")[doi:10.1007/s00222-014-0509-0].]
#bibitem([11])[R. Godement and H. Jacquet, #emph[Zeta Functions of Simple Algebras], Lecture Notes in Math.
  #strong[260], Springer-Verlag, Berlin--Heidelberg, 1972.
  #link("https://doi.org/10.1007/BFb0070263")[doi:10.1007/BFb0070263].]
#bibitem([12])[B.~H. Gross and D.~B. Zagier, #emph[Heegner points and derivatives of $L$-series], Invent. Math.
  #strong[84] (1986), no.~2, 225--320. #link("https://doi.org/10.1007/BF01388809")[doi:10.1007/BF01388809].]
#bibitem([13])[H. Hida, #emph[The Iwasawa $mu$-invariant of $p$-adic Hecke $L$-functions], Ann. of Math.
  (2) #strong[172] (2010), no.~1, 41--137.
  #link("https://doi.org/10.4007/annals.2010.172.41")[doi:10.4007/annals.2010.172.41].]
#bibitem([14])[D. Jetchev, C. Skinner, and X. Wan, #emph[The Birch and Swinnerton-Dyer formula for elliptic curves
  of analytic rank one], Cambridge J. Math. #strong[5] (2017), no.~3, 369--434.
  #link("https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2017/0005/0003/CJM-2017-0005-0003-a002.pdf")[Published
  article].]
#bibitem([15])[K. Kato, #emph[$p$-adic Hodge theory and values of zeta functions of modular forms],
  Astérisque #strong[295] (2004), 117--290. #link("https://www.numdam.org/item/AST_2004__295__117_0/")[Article and
  bibliographic record].]
#bibitem([16])[N.~M. Katz and B. Mazur, #emph[Arithmetic Moduli of Elliptic Curves],
  Annals of Mathematics Studies #strong[108], Princeton University Press, Princeton, NJ, 1985.
  #link("https://doi.org/10.1515/9781400881710")[Publisher's digital edition].]
#bibitem([17])[V.~A. Kolyvagin, #emph[Euler systems], in #emph[The Grothendieck Festschrift], Vol.~II, Progr.
  Math. #strong[87], Birkhäuser, Boston, 1990, 435--483.
  #link("https://doi.org/10.1007/978-0-8176-4575-5_11")[Publisher's reprint].]
#bibitem([18])[Yu.~I. Manin, #emph[Parabolic points and zeta-functions of modular curves], Math. USSR-Izv.
  #strong[6] (1972), no.~1, 19--64.
  #link("https://doi.org/10.1070/IM1972v006n01ABEH001867")[doi:10.1070/IM1972v006n01ABEH001867].]
#bibitem([19])[J.~S. Milne, #emph[On the arithmetic of abelian varieties], Invent. Math.
  #strong[17] (1972), 177--190. #link("https://doi.org/10.1007/BF01425446")[doi:10.1007/BF01425446].]
#bibitem([20])[J.~S. Milne, #emph[Arithmetic Duality Theorems], second edition, BookSurge, 2006.
  #link("https://www.jmilne.org/math/Books/adt.html")[Author's edition and corrections].]
#bibitem([21])[J. Nekovář, #emph[Selmer complexes], Astérisque #strong[310] (2006), viii+559 pp.
  #link("https://www.numdam.org/item/AST_2006__310__R1_0/")[Book].]
#bibitem([22])[OpenAI, #emph[Goldfeld's analytic density conjecture and the $2$-converse for elliptic curves],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Goldfelds-analytic-density-conjecture-and-the-2-converse-for-elliptic-curves-September-23-2026/paper.pdf")[OAI:Goldfelds-analytic-density-conjecture-and-the-2-converse-for-elliptic-curves-September-23-2026],
  2026.]
#bibitem([23])[OpenAI, #emph[The Selmer converse for elliptic curves at every prime],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-Selmer-converse-for-elliptic-curves-at-every-prime-September-24-2026/main.pdf")[OAI:The-Selmer-converse-for-elliptic-curves-at-every-prime-September-24-2026],
  2026.]
#bibitem([24])[OpenAI, #emph[The two-primary Birch--Swinnerton-Dyer formula in Selmer corank at most one],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one-September-24-2026/paper.pdf")[OAI:The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one-September-24-2026],
  2026.]
#bibitem([25])[K. Rubin, #emph[The "main conjectures" of Iwasawa theory for imaginary quadratic fields], Invent.
  Math. #strong[103] (1991), 25--68. #link("https://doi.org/10.1007/BF01239508")[doi:10.1007/BF01239508].]
#bibitem([26])[J.-P. Serre, #emph[Propriétés galoisiennes des points d'ordre fini des courbes elliptiques],
  Invent. Math. #strong[15] (1972), 259--331. #link("https://doi.org/10.1007/BF01405086")[doi:10.1007/BF01405086].]
#bibitem([27])[C. Skinner and E. Urban, #emph[The Iwasawa main conjectures for $upright(G L)_2$], Invent. Math.
  #strong[195] (2014), no.~1, 1--277.
  #link("https://doi.org/10.1007/s00222-013-0448-1")[doi:10.1007/s00222-013-0448-1].]
#bibitem([28])[A. Smith, #emph[The Birch and Swinnerton-Dyer conjecture implies Goldfeld's conjecture],
  #link("https://arxiv.org/abs/2503.17619v1")[arXiv:2503.17619v1], 2025.]
#bibitem([29])[J. Tate, #emph[On the conjectures of Birch and Swinnerton-Dyer and a geometric analog],
  Séminaire Bourbaki #strong[9] (1966), Exp.~306, 415--440.
  #link("https://www.numdam.org/item/SB_1964-1966__9__415_0/")[Article and bibliographic record].]
#bibitem([30])[R. Taylor and A. Wiles, #emph[Ring-theoretic properties of certain Hecke algebras], Ann. of Math.
  (2) #strong[141] (1995), no.~3, 553--572. #link("https://doi.org/10.2307/2118560")[doi:10.2307/2118560].]
#bibitem([31])[J.-L. Waldspurger, #emph[Sur les valeurs de certaines fonctions $L$ automorphes en leur centre de
  symétrie], Compos. Math. #strong[54] (1985), no.~2, 173--242.
  #link("https://www.numdam.org/item/CM_1985__54_2_173_0/")[Article and bibliographic record].]
#bibitem([32])[A. Wiles, #emph[Modular elliptic curves and Fermat's Last Theorem], Ann. of Math.
  (2) #strong[141] (1995), no.~3, 443--551. #link("https://doi.org/10.2307/2118559")[doi:10.2307/2118559].]
#bibitem([33])[S. Yamana, #emph[On the Siegel--Weil formula: The case of singular forms], Compos. Math.
  #strong[147] (2011), no.~4, 1003--1021.
  #link("https://doi.org/10.1112/S0010437X11005379")[doi:10.1112/S0010437X11005379].]
#bibitem([34])[Yu.~G. Zarhin, #emph[Abelian varieties over fields of finite characteristic], Cent. Eur. J. Math.
  #strong[12] (2014), no.~5, 659--674. Theorem locators follow
  #link("https://arxiv.org/abs/1301.5594v4")[arXiv:1301.5594v4], 16 April 2015.]
