#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The two-primary Birch--Swinnerton-Dyer formula \
in Selmer corank at most one]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Birch and Swinnerton-Dyer conjecture relates the leading term of the $L$-function of an elliptic curve to its rational points, local component groups, and Tate–Shafarevich group. Its rank assertion and its exact leading-term assertion are distinct: a proof that a Heegner point is nontorsion does not determine the index of that point or the order of the Tate–Shafarevich group. This distinction is particularly important at the prime two, where real components and integral eigenspace indices contribute to the formula.

We establish the two-primary formula for every elliptic curve over $bb(Q)$ whose usual two-power Selmer group has corank zero or one. This resolves the two-primary leading-term assertion of the Birch and Swinnerton-Dyer conjecture in that Selmer-corank range. It also gives the pointwise converse from the Selmer-corank bound to analytic rank at most one. The theorem concerns the two-primary part of the leading term; it makes no assertion about higher Selmer corank or the remaining prime parts.

=== 1.1 Statement and normalizations <statement-and-normalizations>

Let $E \/ bb(Q)$ be an elliptic curve. We use the Selmer group with the usual local Kummer conditions, including the real place, and write

$ s_2 \( E \) = "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ bb(Q) \) . $

Let $omega_E$ be a global minimal Néron differential, let $c_ell \( E \)$ be the finite Tamagawa numbers, and put

$ Omega_E = integral_(E \( bb(R) \)) \| omega_E \| \, #h(2em) T_E = E \( bb(Q) \)_(upright("tors")) . $

Thus $Omega_E$ integrates over every real component. For reduced $x \( P \) = a \/ b$, set $h_x \( P \) = log max \( \| a \| \, \| b \| \)$, with $h_x \( O \) = 0$, and define

$ H \( P \) = lim_(m arrow.r oo) 4^(- m) h_x \( \[ 2^m \] P \) \, #h(2em) B \( P \, Q \) = frac(H \( P + Q \) - H \( P \) - H \( Q \), 2) . $

In particular $B \( P \, P \) = H \( P \)$. Here $H$ is the canonical height attached to $2 \[ O \]$; the canonical height attached to $\[ O \]$ is $H \/ 2$. The regulator $"Reg"_E$ is the determinant of $B$ on a $bb(Z)$-basis of $E \( bb(Q) \) \/ T_E$, and is one in rank zero. Replacing this lattice by a subgroup of index $m$ multiplies the regulator by $m^2$. This is the regulator convention in [8] Section 1; its compatibility with the relative Gross–Zagier height is explained in Section 2. All constant valuations are normalized by $v_2 \( 2 \) = 1$.

#thm([Theorem 1.1.])[
  #emph[Let $E \/ bb(Q)$ be any elliptic curve with $s_2 \( E \) lt.eq 1$. Then 
$ r := "rank" E \( bb(Q) \) = "ord"_(s = 1) L \( E \, s \) = s_2 \( E \) \, #h(2em) \# "Sha" \( E \/ bb(Q) \) < oo . $

 Moreover, 
$ Q_E = frac(L^(\( r \)) \( E \, 1 \) thin \( \# T_E \)^2, r ! thin Omega_E "Reg"_E product_(ell med upright("finite")) c_ell \( E \)) in bb(Q)_(> 0) \, #h(2em) v_2 \( Q_E \) = v_2 #scale(x: 120%, y: 120%)[\(] \# "Sha" \( E \/ bb(Q) \) #scale(x: 120%, y: 120%)[\)] . $

 There is no restriction on $E \[ 2 \]$ or on the reduction of $E$ at two.]
] <thm:main>

#thm([Corollary 1.2.])[
  (An any-prime input criterion).  #emph[Let $E \/ bb(Q)$ be an elliptic curve. Suppose that, for some prime $p$, its full $p$-power Selmer group with the usual local Kummer conditions at every place satisfies 
$ s_p \( E \) := "corank"_(bb(Z)_p) "Sel"_(p^oo) \( E \/ bb(Q) \) lt.eq 1 . $

 Then all conclusions of Theorem 1 hold, with common rank $r = s_p \( E \)$.]
] <cor:any-prime-bsd>

#proof[
  By [45] Theorem 1.1, $"rank" E \( bb(Q) \) = r := s_p \( E \)$ and the whole group $"Sha" \( E \/ bb(Q) \)$ is finite. The Kummer exact sequence at two is
  $ 0 arrow.r E \( bb(Q) \) ⊗ \( bb(Q)_2 \/ bb(Z)_2 \) arrow.r "Sel"_(2^oo) \( E \/ bb(Q) \) arrow.r "Sha" \( E \/ bb(Q) \) \[ 2^oo \] arrow.r 0 . $
  Taking coranks gives $s_2 \( E \) = "rank" E \( bb(Q) \) = r lt.eq 1$, so Theorem 1 applies. ◻
]

There is also a density consequence of Theorem 1. Combining it with the signed-squarefree Selmer-corank densities in [44] proof of Theorem 1.2 gives the exact two-primary formula for a density-one set of quadratic twists of each fixed $E \/ bb(Q)$. The common analytic and Mordell–Weil rank is zero or one, with each value having density $1 \/ 2$; see Corollary 140.

=== 1.2 History and the integral difficulty <history-and-the-integral-difficulty>

The conjecture grew out of the computations of Birch and Swinnerton-Dyer [4]. The modularity theorem developed from the semistable case of Wiles and Taylor–Wiles [61,59] to all elliptic curves over $bb(Q)$ [7]. Together with the work of Gross–Zagier and Kolyvagin, it shows that analytic rank zero or one implies the corresponding rational rank and finiteness of the whole Tate–Shafarevich group [7,27,33]. These analytic low-rank theorems are inputs here. The converse from the full two-power Selmer group, and the exact leading coefficient at two, require additional integral information. Cassels established the isogeny comparison for elliptic curves; Tate formulated its abelian-variety extension, including the restriction-of-scalars comparison used below [16,58].

At odd primes, exact leading-term formulas in analytic ranks zero and one were established under residual and local hypotheses by Skinner–Urban, Wei Zhang, and Jetchev–Skinner–Wan, through Iwasawa main conjectures and the integral theory of Heegner points [57,62,28].

The CM theory provides a substantial part of the exact-formula history. Elliptic units and Rubin’s imaginary-quadratic main conjectures supply its Iwasawa-theoretic background [51]. Johnson-Leung–Kings establish the individual-character main conjecture without prime exceptions [29]; Burungale–Flach use this input to prove full BSD for every CM elliptic curve over $bb(Q)$ of analytic rank zero [11]. Burungale–Tian’s rank-zero $p$-converse, valid for every prime, then shows that the CM Selmer-corank-zero case already follows from these results [13].

For CM curves of analytic rank one, Li–Tian–Yan–Zhu prove the exact two-primary formula under good ordinary reduction at two. Their Theorem 1.2 combines this formula with earlier ordinary CM two-converse results, including the work of Burungale–Castella–Skinner–Tian [38,10]. The direct CM comparison below also treats Selmer corank one at every other reduction type at two, and supplies the paired determinant comparison used in the non-CM argument.

For non-CM curves, and for explicit CM twist families, the prime two has required separate methods. Zhao developed lower bounds and combinatorial equality criteria for two-adic central-value valuations [63]. Coates–Li–Tian–Zhai prove full BSD for specified rank-zero twists of $X_0 \( 49 \)$, together with rank-one and finiteness results for other restricted twists [18]. Cai–Li–Zhai propagate the exact two-part in rank-zero twist families under base-curve and local hypotheses [14]. Shu–Zhai obtain exact rank-zero and rank-one two-part formulas for families satisfying rational two-isogeny, base-formula, and splitting conditions [55]. These results establish important special cases. For curves without rational two-torsion, Kriz–Li propagate the exact two-part in rank-zero and rank-one twist families under a Heegner-logarithm unit condition and further local and base-formula hypotheses [36] Theorem 5.1. The present theorem permits every residual image and every reduction type at two.

Kato’s zeta elements and explicit reciprocity law connect integral Galois cohomology to modular periods [30]. The zeta-element constructions of Burungale–Skinner–Tian–Wan give further low-rank applications with prime and local hypotheses [12]. Our proof uses Kato’s full-level reciprocity law in a precise weight-two specialization, while proving the integral primitivity statements required at two. The logarithm-squared comparison belongs to the framework proposed by Perrin-Riou and developed at odd semistable primes by Bertolini–Darmon–Venerucci [47,3]. Depleted CM primitives and square-logarithm formulas have their antecedents in Bertolini–Darmon–Prasanna [2]. Here these comparisons are combined with separate integral arguments at two.

Determinant lines and the Tamagawa-number formulation provide the language for these comparisons [32,5]; Selmer complexes and Bockstein pairings organize their first-order variation [43]. Finite–singular comparisons also form a basic part of the theory of Kolyvagin systems [39]. The finite models, exact switch volumes, and dyadic alternation needed here are proved below, with explicit treatment of real cohomology.

The integral difficulty is easy to describe. An Euler-system construction may produce a point or a determinant generator only after multiplication by a fixed nonzero integer. Such a bound can prove rank and finiteness, but its unknown two-adic valuation cannot determine $v_2 \( Q_E \)$. We therefore separate two operations. Horizontal comparisons, made at height-one primes where two is invertible, allow fixed clearing denominators. Residual concentration supplies the remaining integrality, and an independent primitivity argument is needed at the closed point. For example, for a rational coordinate $U$ over $bb(Z)_2 \[ \[ u \] \]$, nonnegative orders at every height-one prime imply $U in bb(Z)_2 \[ \[ u \] \]$. The stronger conclusion that $U$ is a unit requires its constant term to be odd. Our determinant comparisons keep these steps separate and retain the local Euler, real-component, and lattice factors through specialization.

=== 1.3 The three comparisons <the-three-comparisons>

Write $"an" \( A \) = "ord"_(s = 1) L \( A \, s \)$, and, when $"an" \( A \) lt.eq 1$, define

$ X \( A \) = v_2 #h(-1em) (frac(L^(\( "an" \( A \) \)) \( A \, 1 \) thin \( \# A \( bb(Q) \)_(upright("tors")) \)^2, "an" \( A \) ! thin Omega_A "Reg"_A product_q c_q \( A \) thin \# "Sha" \( A \/ bb(Q) \))) . $

The classical analytic low-rank theorem makes $X \( A \)$ well-defined. For a quadratic twist parameter $a$, write $A^a$, allowing $a = 1$, and write $N_A$ for the conductor. The proof is organized around the following assertions.

#thm([Proposition 1.3.])[
  (Positive comparison).  #emph[Let $A \/ bb(Q)$ be non-CM. If $"an" \( A \) lt.eq 1$, then $X \( A \) gt.eq 0$. Suppose a positive fundamental discriminant $a$ prime to $2 N_A$, or $a = 1$, satisfies $"an" \( A^a \) lt.eq 1$ and $X \( A^a \) = 0$. Then $s_2 \( A \) lt.eq 1$ implies $"an" \( A \) = s_2 \( A \)$ and $X \( A \) = 0$.]
] <prop:positive>

#thm([Proposition 1.4.])[
  (Split-pair anchor).  #emph[Let $A \/ bb(Q)$ be non-CM. There exist a fundamental discriminant $h$ prime to $2 N_A$, allowing $h = 1$, and an imaginary quadratic field of discriminant $k$ prime to $2 h N_A$, in which all primes dividing $2 h N_A$ split, such that 
$ "an" \( A^h \) + "an" \( A^(h k) \) = 1 \, #h(2em) X \( A^h \) + X \( A^(h k) \) = 0 . $

]
] <prop:anchor>

#thm([Proposition 1.5.])[
  (CM comparison).  #emph[If $A \/ bb(Q)$ has complex multiplication and $s_2 \( A \) lt.eq 1$, then $"an" \( A \) = s_2 \( A \)$ and $X \( A \) = 0$.]
] <prop:cm>

These propositions have complementary roles. The anchor supplies two twists with a vanishing sum of discrepancies; nonnegativity makes each discrepancy zero. Since $k < 0$, one member of the pair is an allowed positive twist, providing the input for the transfer in Proposition 3. The CM comparison treats the remaining curves directly. Section 16 completes this deduction, including the classical rank, finiteness, and rationality inputs.

=== 1.4 Proof structure and reusable constructions <proof-structure-and-reusable-constructions>

The positive comparison uses the actual integral relative-symbol lattice of a modular elliptic quotient, an unnormalized Siegel-unit period law, and determinant-preserving finite/singular line switches. A tame height calculation gives the rank-one logarithmic identity without an ordinary-reduction hypothesis. At an initially unknown center, a Selmer Bockstein detects the first derivative before analytic rank is assumed.

For the split-pair anchor, finite two-descent supplies a twist and a split imaginary quadratic field over which the usual Selmer corank is one. We compare a determinant strict at one place above two with a product of two depleted CM-disk logarithmic measures. Ring-class derivatives provide square switches. An integral unit comparison, together with the independently obtained corank-one condition, makes the central Heegner trace nontorsion and yields the exact split formula.

The residual primitivity argument depends on the residual image: scalar constituents for rational two-torsion, a CM comparator for imaginary $S_3$, ray units for a cyclic cubic image, and a real-component detector for real $S_3$. The last argument uses an alternating determinant and a Pfaffian cofactor lift divisible by a product of local factors, even when those factors are not coprime.

Several constructions apply beyond their immediate branches: marked finite free cochain models that retain specialization and cup products; exact line and square switches with specified determinant volumes; bounded-series division from high-character tests; conjugate Bockstein alternation at two; and the integral Pfaffian cofactor lift. We give the hypotheses of these constructions explicitly. Figure 1 records the part of the proof order that prevents the unit and rank arguments from being used circularly.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite models, exact periods,#linebreak()horizontal derivatives]]])])
  content((-3.25, -1.8), [#box(width: 5.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Positive comparison:#linebreak()nonnegativity and unit transfer]]])])
  content((3.25, -1.8), [#box(width: 5.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Split comparison:#linebreak()Selmer corank one and a unit#linebreak()give a nonzero central point]]])])
  content((3.25, -3.8), [#box(width: 5.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite Selmer seeds and#linebreak()residual primitivity:#linebreak()split-pair anchors]]])])
  content((-3.25, -4.5), [#box(width: 5.323cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[A positive unit anchor;#linebreak()transfer to the original curve]]])])
  line((-0.8687, -0.4811), (-2.381, -1.319), stroke: (thickness: 0.4pt), mark: (end: ">"))
  line((0.8687, -0.4811), (2.031, -1.125), stroke: (thickness: 0.4pt), mark: (end: ">"))
  line((3.25, -2.475), (3.25, -3.125), stroke: (thickness: 0.4pt), mark: (end: ">"))
  line((-3.25, -2.281), (-3.25, -4.019), stroke: (thickness: 0.4pt), mark: (end: ">"))
  line((0.5883, -4.087), (-0.5883, -4.213), stroke: (thickness: 0.4pt), mark: (end: ">"))
})],
  caption: [Figure 1: Logical order in the non-CM proof. Nonnegativity precedes the anchor. The Hecke-field rank test used by the comparators starts with a classically known simple analytic product and does not use a residual unit conclusion. The direct CM argument is treated separately. ],
) <fig:logic>

===== 1.4.1 Navigation. <navigation.>

Section 2 fixes the classical inputs and exact Gross–Zagier factors; Section 3 proves the common cochain and determinant lemmas. Sections 4–7 prove Proposition 3, with the unknown-rank Bockstein argument in Section 7.3. Sections 8–9 establish the split determinant, its horizontal divisibility, and the central rank test. The reducible anchor is completed in Section 10. Section 11 proves Proposition 5 and the CM comparison used later. After the alternation calculation in Section 12, the imaginary $S_3$, real $S_3$, and cyclic-cubic anchors are proved in Sections 13, 14, and 15, respectively. Section 16 assembles these branches.

Our notation is local to each construction when a field, coefficient ring, or modular factor changes. Orders at height-one primes refer to the corresponding discrete valuation rings; valuations of dyadic constants always retain the normalization $v_2 \( 2 \) = 1$.

== 2 Classical facts and normalizations <sec:classical>

=== 2.1 Analytic low-rank inputs and parity <analytic-low-rank-inputs-and-parity>

We use modularity of elliptic curves over $bb(Q)$ [7] and the Gross–Zagier–Kolyvagin theorem: analytic order zero or one gives the corresponding rational rank and finiteness of the whole Tate–Shafarevich group [27,33]. This implication will be applied after the analytic order has been established.

Two quadratic-twist nonvanishing results supply the auxiliary analytic inputs. For a primitive weight-two form of trivial central character, Friedberg–Hoffstein supplies central values with prescribed local behavior and compatible sign [25]; see also [1] Theorem 10.6. In particular, when the base form has odd functional sign, we may choose an odd fundamental imaginary discriminant, split at the level and at any indicated finite additional primes, whose twist has nonzero central value. When the base central value is nonzero, the Bump–Friedberg–Hoffstein and Murty–Murty derivative nonvanishing results supply imaginary Heegner twists with a simple zero [9,42].

The auxiliary fields may be chosen to have only the units $plus.minus 1$. For a fundamental discriminant $b$ coprime to the level $N$, the twist changes the functional sign by $chi_b \( - N \)$, where $chi_b$ is the associated Dirichlet character. Every local prescription below respects this sign condition.

Finally, the modular-symbol period theorem gives rationality of central values after division by modular periods. Their nonnegativity for elliptic newforms follows from the positivity theorem for self-dual symplectic forms; see [37].

#thm([Lemma 2.1.])[
  (Two-primary parity).  #emph[For every elliptic curve $A \/ bb(Q)$, 
$ \( - 1 \)^(s_2 \( A \)) = w \( A \) . $

 For a quadratic field $K = bb(Q) \( sqrt(k) \)$, 
$ s_2 \( A \/ K \) = s_2 \( A \) + s_2 \( A^k \) . $

 Moreover, $dim_(bb(F)_2) "Sel"_2 \( A \) - dim_(bb(F)_2) A \( bb(Q) \) \[ 2 \] - s_2 \( A \)$ is a nonnegative even integer. These statements do not require finiteness of $"Sha" \( A \)$.]
] <lem:classical-parity>

#proof[
  Kramer’s quadratic-extension parity comparison [34] and the Kramer–Tunnell local root-number/norm-index theorem [35], including the dyadic results of [21,22,17], give by the Hilbert product formula
  $ \( - 1 \)^(s_2 \( A \) + s_2 \( A^b \)) = w \( A \) w \( A^b \) . $
  Parity computed by finite two-descent agrees with Selmer-corank parity after subtracting the rational two-torsion dimension. Indeed, the Cassels–Tate pairing modulo divisibles is alternating, since the elliptic polarization is represented by the rational divisor $\[ O \]$ [41] Remark I.6.11 [48] Theorem 5 and Corollary 7.
  Calibrate the displayed relative parity equality using a coprime twist of sign plus with nonzero central value, supplied by the nonvanishing theorem. When the sign must change, take a negative discriminant split at the level. The analytic rank-zero theorem gives $s_2 = 0$ for this twist, so its Selmer parity equals its functional sign. The relative equality then proves the first assertion for $A$.
  Restriction and induction give the rational decomposition over a quadratic field. The associated isogeny preserves the rational Kummer Selmer conditions, proving the displayed corank identity. Finally the same alternating pairing gives the stated even difference between finite Selmer dimension and Selmer corank. ◻
]

=== 2.2 Gross–Zagier with absolute heights <grosszagier-with-absolute-heights>

We use the conductor-one Gross–Zagier theorem at a coprime split level, with the normalization in [27] Chapter I, (4.3) and (6.4); Chapter V, Theorem (2.1); see also [15,19]. The following choices fix the trace, polarization, and height factors needed in the determinant comparison.

Let $f in S_2 \( Gamma_0 \( N \) \)$ be the normalized primitive eigenform, and let $K$ have odd fundamental discriminant $- D < - 4$, prime to $N$, with all level primes split. Choose an oriented ideal of norm $N$ with cyclic quotient. Let $P_X in J_0 \( N \) \( K \)$ be the Hilbert-class trace of the associated maximal-order Heegner point minus the cusp $oo$; the trace sums once over the class group. Write $\( f \, f \)_N$ for the unnormalized Petersson integral on the ordinary $Gamma_0 \( N \)$-quotient.

Project to the rational newform orbit orthogonally on the Jacobian, up to isogeny, and use the #emph[restricted] polarization. Since Rosati fixes the real Hecke field, its embeddings split the resulting height pairing. Denote the diagonal at the embedding corresponding to $f$ by $H_(upright(a b s \, f))$. Here absolute logarithmic heights are divided by the field degree, and the pairing uses the Poincaré principal-pairing convention.

#thm([Theorem 2.2.])[
  (Split Gross–Zagier formula).  #emph[With the preceding hypotheses and units modulo signs one, 
#[#set math.equation(numbering: n => "(GZ)")
 $ frac(sqrt(D), 8 pi^2 \( f \, f \)_N) thin L' \( f \/ K \, 1 \) = 2 H_(upright(a b s \, f)) \( P_X \) . $ <eq:GZ>]

]
] <thm:classical-gz>

The pairing in the relative formula is over $K$, before division by $\[ K : bb(Q) \]$; this accounts for the factor two in (GZ). The ordinary pairing on the orbit projections is the sum of the pairings at the Hecke embeddings.

For a rational modular parametrization $phi.alt : X_0 \( N \) arrow.r E$, put $phi.alt^(*) omega_E = c_E f thin d q \/ q$, where $q = exp \( 2 pi i tau \)$, and let $P = phi.alt_(*) P_X$. Then

#[#set math.equation(numbering: n => "(GZ-E)")
 $ L' \( E \/ K \, 1 \) = frac(integral_(E \( bb(C) \)) \| omega_E and macron(omega)_E \|, sqrt(D) thin c_E^2) dot.op 2 H_(upright("abs")) \( P \) . $ <eq:GZ-E>]

Indeed, the projection formula divides the pushed-forward pairing by $deg phi.alt$, while pullback of the differential gives

$ \( deg phi.alt \) integral_(E \( bb(C) \)) \| omega_E and macron(omega)_E \| = 8 pi^2 c_E^2 \( f \, f \)_N . $

These two degree factors cancel in (GZ-E).

The absolute Poincaré-pairing diagonal is $H_(upright("abs")) \( P \) = lim_j 4^(- j) h_(x \, upright("abs")) \( 2^j P \)$. The origin divisor has canonical height $H_(upright("abs")) \/ 2$, and the Poincaré height uses its bilinearization #emph[without] another halving. Thus this is the height convention fixed in the introduction. The factor two from the relative height over $K$ remains present.

We will compare (GZ-E) with the BSD arithmetic volume using the exact Manin, Tamagawa, and full-index factors for this single Hilbert trace. This uses the height theorem; equality with the BSD arithmetic volume is the further assertion to be proved.

=== 2.3 The split discrepancy identity <the-split-discrepancy-identity>

Assume now that $L \( E \/ K \, s \)$ has a simple zero at one. The classical elliptic theorem and isogeny give finiteness of the relevant Tate–Shafarevich groups. Apply the abelian-variety isogeny invariance of the BSD arithmetic volume [58] Theorem 2.1, extending the elliptic comparison of Cassels [16], to

$ "Res"_(K \/ bb(Q)) E_K tilde.op E times E^k . $

We compute that volume on the restriction of scalars as follows.

The Néron restriction has period $integral \| omega_E and macron(omega)_E \| \/ sqrt(D)$. The differential remains minimal: bad places split, and good reduction remains good. Coordinates in an integral quadratic basis give the dual Lie-volume lattice; its real Jacobian contributes the quadratic discriminant. Components at bad primes contribute $c_ell \( E \)^2$. At ramified primes of good reduction, the special restriction fiber is connected, with a vector kernel over the good special fiber. Finally, the points and Tate–Shafarevich group are those over $K$, and the principal dual height diagonal is $2 H_(upright("abs"))$.

#thm([Corollary 2.3.])[
  (The full-index discrepancy).  #emph[Under these assumptions, the single Hilbert-class trace satisfies 
#[#set math.equation(numbering: n => "(G)")
 $ X \( E \) + X \( E^k \) = v_2 #h(-1em) (frac(\[ E \( K \) : bb(Z) P \]^2, c_E^2 thin product_ell c_ell \( E \)^2 med \# "Sha" \( E \/ K \))) . $ <eq:G>]

 Here $\[ E \( K \) : bb(Z) P \]$ is the full group index, including torsion.]
] <cor:classical-G>

#proof[
  Apply (GZ-E), then divide the analytic leading term by the arithmetic volume just computed. The squared full index converts the point height to the full Mordell–Weil regulator and retains the torsion factor. Taking $v_2$ gives (G). ◻
]

The quantities defining $X$ in the allowed analytic ranks are indeed positive rationals individually: in rank one take a nonvanishing split imaginary companion and use (GZ-E) and the rational elliptic rank-zero result for the other factor (or the modular period ratios). Here equality of arithmetic volumes on restriction and the product is over $bb(R)$, with #emph[total] real periods. The isogeny formula likewise allows changes of the rational curve in its isogeny class, or of its twists by induced isogenies, once in these analytic ranks. The general corank condition is itself isogeny-invariant without knowing these ranks.

== 3 Finite cochain models and determinant comparisons <sec:foundations>

The determinant arguments use cohomology at moving finite levels, together with local conditions, cup products, and distinguished classes. We first construct finite free models that retain these maps under passage to a limit. We then prove the evaluation and determinant comparisons used to change local conditions. The final two subsections compute the central Kummer volumes and give the bounded-series tests needed for specialization.

We use local Tate duality and global Poitou–Tate duality, including compact support with Tate modification at real places; see [41]. The mapping-fiber and Bockstein language is that of Selmer complexes [43]. At two, the standing hypotheses in that reference impose a totally imaginary base field; our ordinary-positive and Tate-real comparisons over $bb(Q)$ are given explicitly below. The other standard inputs are étale localization and purity, Shapiro’s Lemma, and arithmetic cohomological dimension and finiteness theorems.

A global support $S$ for a number field $F$ includes the primes over 2 and the archimedean places; a list just of finite allowed primes leaves the archimedean places understood. Write $G_(F \, S)$ for the unramified-outside-$S$ quotient. Frobenius in a coefficient action means arithmetic Frobenius. Translating that action to a weight on a CM translate, group polynomial, or Euler product can therefore introduce an inverse variable; the weights in each comparison use the same convention.

For finite or compact 2-primary coefficients $M$, $G \( M \)$ and $L_v \( M \)$ denote the unrestricted global and local continuous cochain complexes for the indicated support. We also write $C_(upright("glob")) \( M \)$ and $C_v \( M \)$. A Selmer complex with local maps $U_v arrow.r L_v$ is

$ C \( U \, M \) = upright("fib") #scale(x: 120%, y: 120%)[\(] G \( M \) arrow.r xor.big_v Q_v #scale(x: 120%, y: 120%)[\)] \, #h(2em) Q_v = upright("cone") \( U_v arrow.r L_v \) \; $

we use cohomological mapping fibers (cone shifted by $- 1$). “Strict” and “full” usually mean $U_v = 0$ and $L_v$, respectively, at the indicated place only. “Finite” will refer to a Kummer or an unramified/Frobenius condition as specified. We omit terms imposing no condition. A separate positive complex over $bb(Q)$ uses the mapping fiber of restriction to #strong[ordinary] $C^bullet \( bb(R) \, M \)$. Complex places do not contribute local conditions. By dual on coefficients we mean Tate dual (linear dual with twist (1), or compact/discrete duals as appropriate). Write $P^or$ on complexes for the derived linear dual with #emph[no] shift unless specified.

=== 3.1 Finite models with marked arithmetic maps <finite-models-with-marked-arithmetic-maps>

Some parameters come from a fixed tower, while others come from cyclic extensions whose conductors move. Both are treated at finite Artin precision. For the moving parameters, the limit is taken on the matrices of the arithmetic diagrams; it is not cohomology of a new infinite-conductor Galois group.

For example, a cyclic generator of order $2^m$, written $1 + u$, gives the relation $\( 1 + u \)^(2^m) - 1$. At the fixed precision $\( 2^n \, u^n \)$ this relation vanishes for all sufficiently large $m$. Thus the growing cyclic group rings have the same finite precisions as $bb(Z)_2 \[ \[ u \] \]$. The following lemma carries the cochain maps, as well as the coefficient rings, through this passage.

#thm([Lemma 3.1.])[
  (Finite models and matrix limits).  #emph[Consider diagrams of the global, local, and mapping-fiber cochain complexes above over finite local Artin coefficient rings of 2-power characteristic, with modules finite free (and compatible lifts), in systems with fixed finite residue field and only boundedly many moving places. Assume the dimensions of the residual cohomology of each complex to be modeled are uniformly bounded per degree; if a bounded perfect model is used integrally, assume these dimensions vanish outside uniformly bounded degrees as well. Then the following constructions can be made by cochain contractions.]
  + #emph[There are degreewise finite free minimal models with ordinary base change, bounded where indicated. Continuous actions over complete rings at a stage can be treated with compatible contractions. Tensoring a model of a free coefficient also computes cochains with its tensor by any fixed finite scalar module with trivial Galois action (at compact precision, or with completed finite module).]
  + #emph[Suppose on a fixed nonprincipal ultrafilter on a sequence of stages the scalar precisions identify, by reduction, with every fixed finite Artin precision of a complete local limiting ring $R$. Here and below arbitrary such increasing precisions cofinal with powers of the maximal ideal can be used. Transfer cochain diagrams at the stages and take matrix limits at all fixed precisions. The resulting finite free models retain maps, homotopies, exact triangles (with their identifications), specified cycles and cup-product/duality diagrams when marked as below. Any fixed continuous integral parameter substitution commutes with this construction. Fixed-group diagrams whose coefficient actions already stabilize mod each precision in this identification compute the actual cohomology and maps. One can extend a previously taken diagram by further moving-prime operations on the #emph[same] stages and ultrafilter, retaining previous models and maps; one can work to a slower cofinal precision for the extensions.]
] <lem:foundations-finite>

===== 3.1.1 Arithmetic hypotheses for the models. <arithmetic-hypotheses-for-the-models.>

The concrete limit rings for arithmetic diagrams will be power series over finite $2$-adic integer rings, or over a fixed finite complete local algebra, possibly after base change. The number of moving primes counts distinct places, not ramification degrees.

On global complexes the residual bounds required here, for a fixed residual representation up to a bounded filtration by fixed ones, follow by a fixed finite extension killing those representations and Kummer theory there (and Hochschild–Serre or inflation bounds and duality). For instance valuations allowed in squareclasses increase by only a bounded number of coordinates; degree two is bounded by Poitou–Tate. The local bounds use the usual local theory; degrees above two globally contribute only real cohomology and restriction to all real places there is an isomorphism. In particular positive complexes with no other conditions have the requisite bounded range, and over a totally imaginary field the ordinary global complexes do too.

#proof[
  #emph[Contraction at finite precision.] Continuous cochains with free coefficients at finite precision are flat-term (filtered colimit over finite clopen partitions); reduction or tensor of the terms is ordinary cochains. Over a local Artin ring flat modules are free: lift a residue basis, use nilpotence for surjectivity and then flatness for the kernel modulo the maximal ideal followed by nilpotence again. Residually split the vector-space complex into its cohomology with zero differential and a sum of disks (a differential isomorphism with bases in adjacent degrees), and lift the graded bases. Let $d_0$ be the pure disk differential in them, $i \, p \, h$ the inclusion, projection and contraction with $h^2 = h i = p h = 0 \, med 1 - i p = d_0 h + h d_0$. For the actual $d = d_0 + epsilon.alt$, use
  $ I & = \( 1 + h epsilon.alt \)^(- 1) i \, & P & = p \( 1 + epsilon.alt h \)^(- 1) \,\
H & = h \( 1 + epsilon.alt h \)^(- 1) \, & d_(upright("small")) & = p epsilon.alt \( 1 + h epsilon.alt \)^(- 1) i . $
  These are the disk contraction formulas (multiplication using $d_0 epsilon.alt + epsilon.alt d_0 + epsilon.alt^2 = 0$ gives $d I = I d_(upright("small")) \, P d = d_(upright("small")) P \, P I = 1 \, d H + H d = 1 - I P$); the series are finite in the nilpotent ideal.
  #emph[Compatible diagrams.] Bases of continuous cochains at successive quotients can be lifted compatibly by surjectivity on functions; the resulting maps of inverse limits give the same identities. Transfers of maps insert $I \, P$; compositions have the homotopies from $H$. Analogously transfer multilinear cup maps in the required degrees by tensoring the contractions. For a mapping cone/fiber one can use the cone/fiber of a transferred map with the induced homotopy equivalences, or its minimal contraction. Acyclic reductions of cones can be retained with contracting homotopies.
  #emph[Matrix limits and fixed-group comparison.] Ranks and all finite scalar entries used in these identities have simultaneous ultrafilter values, degree by degree and compatibly by reduction; zero regions of minimal models remain zero. For fixed-group comparison at each compact scalar quotient one can compare to a further fixed contraction for the ordinary cochains at that quotient by composing inclusions and projections. On cohomology the inverse isomorphisms are between finite groups and compatible across quotients by the actual cochain reductions. The same comparisons commute with the marked maps (or one transfers the comparison homotopies on the fixed models too). Passing to compact inverse limits has no $lim^1$ issue, by finiteness/compactness.
  Extensions of a diagram use the old contractions on the needed old objects on ultrafilter-large sets at each precision (matrix bases can be padded or stabilized per degree). One may choose a slower single cofinal working precision on these sets. At no point does one define a new infinite-conductor profinite Galois group and posit Poitou–Tate on it. ◻
]

=== 3.2 Localization and compatible duality <localization-and-compatible-duality>

===== 3.2.1 Change of support. <change-of-support.>

Over a totally imaginary field the arithmetic $S$-integer scheme computes $G_(F \, S)$-cohomology for our lisse systems. Indeed the 2-primary comparison is checked residually after finite covers trivializing coefficients; in the universal such cover higher cohomology of $bb(F)_2 = mu_2$ vanishes. Degree one is the torsor criterion, and in degree two use Picard modulo 2 and Brauer. Brauer classes die by even local degrees eventually at all of $S_f$ in the cyclotomic tower (also at odd residue cardinalities, which have infinite order), then Picard classes by Hilbert principalization. Higher degrees vanish already over imaginary layers (use localization to the generic point and purity, cohomological dimension, and in degree three surjectivity of Brauer residues away from $S$ by Brauer reciprocity since $S_f eq.not diameter$).

Thus allowing additional odd places where a coefficient is unramified changes the full complex by the sum of local singular quotients, i.e. local cochains modulo the inflated

$ \[ M arrow.r^(upright("Fr") - 1) M \] #h(2em) \( 0 \, 1 \) . $

Inflation into the new global problem imposing just these unramified conditions there is the quasi-isomorphism (étale localization and local excision); fixed conditions elsewhere commute with it. The same works at compact precisions and limits. At unramified coefficients a singular block can be computed as the residue cochains on $M \( - 1 \)$ shifted by $- 1$. More generally local computations at odd places discard the exact-invariants pro-(prime-to-2) kernel of inertia, then use procyclic $2$-inertia and residue cohomology. The inertia differential in degrees 0,1 uses generator minus one; under a power $z mapsto z^b$ the change on the generator cochain uses $\( z^b - 1 \) \/ \( z - 1 \)$ in completed procyclic notation. These are finite-model formulas (the usual two-term procyclic resolution, followed by the residue Frobenius fiber), so when the conjugating power tends to 1 the change term tends to 1 on finite precisions with pro-2 action. Unramified conditions after inverting 2 at odd places with fixed possibly ramified Tate action will be described separately.

===== 3.2.2 Cup products and traces. <cup-products-and-traces.>

On an imaginary base retain full global, full finite local $L = xor.big L_v$ and compact $G_c = upright("fib") \( G arrow.r L \)$ diagrams. Cup/invariant give a perfect pairing of $G_c$ with the dual coefficient’s unrestricted $G'$ of shift $- 3$, and of $L \, L'$ of shift $- 2$; the connecting $L arrow.r G_c \[ 1 \]$ is adjoint to localization, up to orientation of fibers. These are standard Poitou–Tate/local duality over the residue field, and hold over the scalar rings with free coefficient models as well.

More explicitly transfer the cup maps, invariant and compact trace (to scalars in degrees two locally and three globally), and the reciprocity/adjunction diagram including its homotopies. The traces on scalar cochains with twist (1) can be taken at finite precision first: top cohomology is the scalar ring by the invariant or compact invariant theorem, compatibly and linearly under reduction (dually the constant degree-zero invariants of the finite dual); higher cohomology vanishes. Thus on minimal models the top degree term for each trace is one copy with zero incoming differential and the trace gives a morphism there.

The compact map and local invariants agree on boundaries in this diagram by the ordinary compact-support triangle. The resulting cup morphisms lift residual perfectness to equivalences by the finite models. Equivalently, for the full compact/global adjunction use the cone cochain cup into compact scalar cochains, and trace; restriction on the unrestricted factor then pairs with local boundary by the local trace. These equivalences and the triangle adjunction survive the matrix limit and base changes. One may incorporate conjugate field transport in the identification of the second coefficient with a Tate dual (e.g. an anticyclotomic scalar twist); in that convention exact complementary conditions must be tested at the corresponding conjugate places.

#thm([Lemma 3.2.])[
  (Complementary local conditions).  #emph[If paired perfect local maps $U arrow.r L \, med U' arrow.r L'$ (possibly only over a localized test ring after the limit) have a paired restriction nullhomotopy and induce $L' \/ U' tilde.eq U^or \[ - 2 \]$, the two Selmer complexes are perfect duals with shift $- 3$.]
] <lem:foundations-duality>

#proof[
  Dualize $G_c arrow.r C \( U \) arrow.r U$ and use the localization adjunction to identify the dual fiber. The comparison boundaries for nested local conditions with compatible orthogonality data are localization adjoints by the same triangles. The local equivalence can be checked on residue fields by perfectness; when the local pieces are split free in cohomology, the invariant restriction morphism is tested just in total degree two. We specify nullhomotopies or their existence from degree/amplitude or unramified factorizations when used; exact Selmer orthogonality on a DVR does not follow just from two generic dimensions. ◻
]

===== 3.2.3 The real place. <the-real-place.>

Over $bb(Q)$, integral calculations without a perfectness assertion for full dual pairs use ordinary positive models and finite Poitou–Tate (modified Tate at the real place in that duality). In 2-inverted comparisons the real term of the positive-complex triangle contributes just the invariant module, in degree one in the determinant of the fiber. Ordinary global complexes then have the imaginary-base comparisons above: one can first include diagrams by restriction/induction to $bb(Q) \( i \)$, whose ramification is allowed, and project by the two maps after inverting 2. Restriction/corestriction and Shapiro are cochain identities up to homotopy, transferred in the finite diagrams, so the ordinary models, even if originally unbounded at real cohomology, become perfect direct summands there. Alternatively use the splitting of induced coefficient morphisms with denominator 2. This proves the duality and unramified inflation comparisons in that setting; the averaging scalar in adjunction is invertible there.

A different integral use over $bb(Q)$ is with Shapiro coefficients from a quadratic imaginary field, when ramification of that field is allowed. The modified real term of such a coefficient is contractible even integrally. The paired Shapiro cup pushed by trace to scalar cochains uses local/compact invariant #strong[compatible with corestriction], not twice the invariants over the imaginary base. Compact scalar cochains here use modified Tate localization at infinity. They can still be used degreewise for their degree-three trace as above (top cohomology by finite Poitou–Tate); the bounded dual pair and comparison maps for the induced coefficients equivalently identify by Shapiro. At discriminant primes newly allowed one retains the unramified Kummer/cochain conditions over the imaginary field as appropriate.

===== 3.2.4 Character pushforward. <character-pushforward.>

Twisted classes obtained by a coefficient character map on an induced group-ring coefficient are unnormalized traces. Concretely, restricting the resulting corestriction up to a field trivializing that character gives the sum over translates with the character weights, not division by the group order. This applies at finite precisions, including when 2 is not inverted. Conversely at a fixed characteristic-zero character one may compare local conditions using its projected summand before further inverse limits if projector denominators are then bounded.

=== 3.3 Evaluations and Frobenius tests <evaluations-and-frobenius-tests>

#thm([Lemma 3.3.])[
  (Detection by evaluations).  #emph[For the limiting unrestricted global $H^1$, after scalar specialization even to height-one residue fields, there is an injection by evaluations into abstract crossed homomorphism classes on $cal(G)_F = product_i G_F$, where $i$ runs over the stages. The action on a fixed-rank module is given by entrywise ultrafilter limits before specialization.]
] <lem:foundations-evaluation>

#proof[
  Retain the model inclusions into the actual global cochains. Evaluations on every sequence of group elements, pairs of sequences, and higher tuples have simultaneous matrix limits. They preserve the cochain equations, so degree-one cycles give crossed homomorphisms on $cal(G)_F$.
  It remains to show that evaluation detects their cohomology classes after specialization. At each residual stage a bounded finite list of group elements detects invariants and whether a model cocycle is a single coboundary. These are linear equations on bounded-dimensional spaces. The resulting evaluation map to
  $ E = \[ M arrow.r M^(upright("list")) \] #h(2em) upright("in degrees ") 0 \, 1 $
  is therefore an isomorphism on residual $H^0$ and injective on residual $H^1$. For its unshifted mapping cone $K$, writing $k$ for the residue field, the long exact sequence gives
  $ H^(- 1) \( K ⊗ k \) = H^0 \( K ⊗ k \) = 0 . $
  The complexes start in degree zero, so a degreewise minimal model of $K$ has no terms in degrees at most zero. This remains true after every field base change. The same long exact sequence now proves the required $H^1$-injection at the specialized field. No upper boundedness of the ordinary real cochains is needed for this low-degree argument.
  Conjugation and comparison identities on evaluations hold on classes by the transferred homotopies. A Selmer $H^1$ likewise injects whenever its local maps include full $H^0$ and inject in $H^1$ at the field being tested. ◻
]

===== 3.3.1 Detection on a kernel. <detection-on-a-kernel.>

Let $cal(H)$ be a normal joint kernel acting trivially on the coefficients. Restriction to $cal(H)$ gives additive, equivariant evaluations. Inflation–restriction shows that these detect classes if $H^1 \( cal(G)_F \/ cal(H) \, M \) = 0$. One sufficient condition is a central scalar whose difference from one is invertible, by the crossed-homomorphism identity.

===== 3.3.2 The open-image criterion. <the-open-image-criterion.>

A second criterion applies in characteristic zero. Suppose the quotient contains, as a normal subgroup, the product

$ cal(S) = product_i upright("SL")_2^b \( bb(Z)_2 \) $

of a fixed deep principal congruence subgroup, acting on the standard plane by the limiting matrices, with all scalar twists trivial on $cal(S)$. Then

$ H^0 \( cal(S) \, M \) = H^1 \( cal(S) \, M \) = 0 \, $

where $H^1$ denotes even abstract group cohomology. These vanishings imply the required vanishing on the quotient.

To prove them, choose the constant diagonal $D = "diag" \( m \, m^(- 1) \)$, with an integer $m > 1$ sufficiently close to one. The matrix $D - 1$ is invertible. Adjust a cocycle to vanish at $D$; commutation with $D$ then makes it vanish on every sequence of diagonal elements. For an upper-unipotent sequence $U$, conjugation by $D$ gives the integer power $U^(m^2)$. The crossed identity gives

$ (D - sum_(j = 0)^(m^2 - 1) U^j) x \( U \) = 0 . $

This triangular matrix is invertible: its diagonal entries are $m - m^2$ and $m^(- 1) - m^2$. Using $D^(- 1)$ gives the same conclusion for lower unipotents. Gaussian factorization into lower-unipotent, diagonal, and upper-unipotent factors works termwise inside the same principal congruence subgroup. Hence it works for arbitrary sequences, and the cocycle vanishes on $cal(S)$.

This subgroup is available for an open elliptic Tate image when the competing data have uniformly bounded derived length over a fixed finite field extension. A sufficiently iterated closed derived subgroup kills those data and contains a deep $upright("SL")_2$ in the Tate image, by Lie brackets first in the open matrix group and then in $frak(s l)_2$. The depth can be chosen uniformly at the stages.

===== 3.3.3 Joint evaluations and Frobenius selection. <joint-evaluations-and-frobenius-selection.>

On a simple coefficient space with scalar endomorphisms, the joint evaluations of linearly independent classes detected by that restriction span a full tuple space. A proper span, by equivariance and semisimplicity of a sum of copies of the simple, would impose a scalar linear relation. In characteristic zero additive evaluations then permit simultaneous nonidentically-zero polynomial tests (integer combinations). Even in characteristic two, if full span gives rank two somewhere for a #emph[linear] pair-coordinate test, additivity gives rank two on the kernel evaluations: a homogeneous quadratic vanishing on an additive subgroup vanishes on its field span by polarization.

Finally by Chebotarev a Frobenius sequence can agree with a selected sequence of elements on all old evaluation matrices and other designated finite continuous data to increasing precision: continuous functions at each Artin precision factor through finite sets on finite quotients, and one uses a chosen representative over the prime. In inert-prime tests of squares one uses the desired coset and takes normal closures of the bounded-precision data over the base. Additional splitting and determinant prescriptions will need actual compatibility, which will be checked in each use. This procedure preserves old evaluations when enlarging support (with unramified initial condition at a new place via the localization comparisons).

=== 3.4 Determinant volumes and complementary changes <determinant-volumes-and-complementary-changes>

We use the determinant-line formalism for perfect complexes [32], with the inverse convention specified below. The complementary-condition switches are related to finite–singular comparisons in [39] Section 1.2; the following proofs retain their exact local determinant volumes.

Use the line

$ cal(D) \( C \) = ⨂_i \( det C^i \)^(\( - 1 \)^(i + 1)) $

for a perfect complex (the inverse of the cohomological determinant), and its canonical exact-triangle and cohomology identifications, ignoring harmless determinant signs. For a DVR with valuation $v$, $d \( C \, x \)$ is the valuation of the coefficient of a generic tensor $x$ relative to a generator of $cal(D) \( C \)$; an infinite value is allowed for zero. A torsion elementary divisor in cohomological degree $i$ of length $b$ contributes $\( - 1 \)^(i + 1) b$, in uniformizer units of value one, to $d$ on free cohomology bases. For a square $\[ F arrow.r^delta G \]$ in degrees 1,2 with finite-length cohomology, $d \( C \, 1 \) = - v \( det delta \)$. These statements follow immediately by splitting into elementary-divisor blocks. For a self-duality of shift $- 3$ pairing degrees 1 and 2 of rank one generically, $\( Y \, Y^or \)$ will denote the determinant tensor of a degree-one class $Y$ with its pairing functional on degree two.

#thm([Lemma 3.4.])[
  (The strict–finite determinant comparison).  #emph[Comparisons of local conditions $U subset V$ give a triangle $C \( U \) arrow.r C \( V \) arrow.r V \/ U$. Suppose at a split pair of places one complex $C_(*)$ uses strict at $w$, full at $macron(w)$; $C_F$ uses exact orthogonal $U_w \, U_(macron(w))$, keeping other exact orthogonal conditions, with conjugate duality (so $Q_(macron(w)) tilde.eq U_w^or \[ - 2 \]$). Assume perfect comparisons including duals over our DVR, and generic $U_w$ a line in degree one only. Write $C_0$ for strict at $w$, $U_(macron(w))$ at $macron(w)$. We have 
$ C_0 arrow.r C_F arrow.r U_w \, #h(2em) C_0 arrow.r C_(*) arrow.r Q_(macron(w)) . $

 Over the fraction field suppose $C_(*)$ acyclic and a class $Y in H^1 \( C_F \)$ has nonzero localization in $H^1 \( U_w \)$. The triangles show $C_F$ has only a line in each of degrees 1,2 and degree one maps isomorphically onto that localization line. Conversely these line assertions force strict acyclicity (using duality: the boundary from $Q_(macron(w))$ is then nonzero by adjunction). Write $"loc"_w Y = p e$ for a fraction-field basis $e$. Exactly 
#[#set math.equation(numbering: n => "(D)")
 $ d \( C_F \, \( Y \, Y^or \) \) = d \( C_(*) \, 1 \) + 2 #scale(x: 120%, y: 120%)[\(] v \( p \) + d \( U_w \, e \) #scale(x: 120%, y: 120%)[\)] . $ <eq:D>]

]
] <lem:foundations-D>

#proof[
  For $x = partial \( e^(*) \) in H^2 \( C_0 \)$ by the second triangle, $x$ pairs after projection with $Y$ by $p$, by the same adjunction. Thus up to signs the two tensors compared via $C_0$ give $p^2 x^(*) ⊗ e \, med x^(*) ⊗ e^(*)$, respectively; the two local lattice volumes are dual. The computation works also for rationally imposed local conditions in compatible triangle volumes defined by assigning a DVR determinant lattice on $U_w$ and the dual one on $Q_(macron(w))$. ◻
]

=== 3.5 Line and square switches <line-and-square-switches>

A switch changes the condition at one newly allowed place. Fix nested local conditions $U_(-) subset U_(+)$, and intermediate conditions $U_f \, U_s$ whose quotients over $U_(-)$ give a direct-sum decomposition of $U_(+) \/ U_(-)$. Over the test DVR, assume these two quotients are free and concentrated in degree one. Their coordinates are called finite and transverse (pure singular), and denoted $f \, s$. Let $C_(-) \, C_(+) \, C_f \, C_s$ be the four resulting global complexes. The local conditions form the diagram

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$U_-$])
  content((1, 1.366), [$U_f$])
  content((1, -1.366), [$U_s$])
  content((2, 0), [$U_+$])
  line((0, 0), (1, 1.366), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  line((0, 0), (1, -1.366), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  line((1, 1.366), (2, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  line((1, -1.366), (2, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
})
$#h(2em) U_(+) \/ U_(-) tilde.eq \( U_f \/ U_(-) \) xor \( U_s \/ U_(-) \) .$

We assume complementary dualities: the upper problem is dual to the lower problem for the dual coefficient, and conversely. The local pairing is perfect between the two coordinate spaces, and each pure condition is self-annihilating against its corresponding condition on the dual side. The global complexes have amplitude $1 \, 2$ over the generic field and each indicated fiber field. The local splitting and complementary duality hypotheses hold at both fields; the lemmas distinguish the further generic and fiber dimension assumptions.

In the applications, the lower condition contains all local $H^0$, and the upper condition contains both degree-one coordinates but no local $H^2$. Thus the lower condition is generally not the zero complex. Keeping this degree-zero term is what makes the changed global $H^1$ inject into unrestricted cohomology.

#thm([Lemma 3.5.])[
  (Line switch).  #emph[Assume that the local quotient ranks are $1 \, 1$. Suppose $C_f$ has just one generic cohomology line in degree one. At the fiber, if $h = dim H^1 \( C_f \) > 1$, arrange nonzero finite evaluations for both a primitive fiber reduction of that generic line and some degree-one class for the old dual condition. Then the switch lowers the fiber dimension from $h$ to $h - 1$, and $C_s$ again has a single generic cohomology line in degree one. If $Y \, Y'$ are classes for the finite and transverse conditions and $s \( Y' \) = f \( Y \)$ under an isomorphism of the two local lines of unit determinant volume, then 
$ d \( C_f \, Y \) = d \( C_s \, Y' \) . $

 If successive switches carry integral classes to a fiber of dimension one, this common coordinate has nonnegative valuation.]
] <lem:foundations-line>

#proof[
  Then the generic finite evaluation is nonzero and $C_(-)$ generically acyclic. On the fiber no transverse contribution can enter (it must annihilate the nonzero finite opposite evaluation by reciprocity), so $H^1 \( C_s \)$ has dimension $h - 1$ there by the triangles. Generically the triangle from lower gives again a line in $C_s$, evaluating isomorphically on the local singular line.
  If classes $Y \, Y'$ in $C_f \, C_s$ have $s \( Y' \)$ equal to $f \( Y \)$ via a unit-volume line isomorphism, then
  $ d \( C_f \, Y \) = d \( C_s \, Y' \) $
  by the two triangles from $C_(-)$ (same tensor 1 there). Extra unchanged terms with a fixed trivialization need not be included in this notation.
  Thus in a sequence of such switches with integral classes at the test DVR and nonzero generic evaluations, when $h = 1$ the coordinate is integral (the complex is then just a free line by the minimal fiber model), and gives nonnegativity also backwards. ◻
]

#thm([Lemma 3.6.])[
  (Square switch).  #emph[Assume that the local quotient ranks are $2 \, 2$, in the self-dual global setting with exact lower/upper duality. The localization image for upper in the four coordinates is self-annihilating: its annihilator is the kernel of the boundary into $H^2 \( C_(-) \)$, by adjunction, hence is the same image. Suppose $C_f$ has generic rank one in degree one with a class $Y$ and nonzero $f \( Y \) = v_0$; then $H^1 \( C_(-) \)$ there vanishes. Suppose $Y'$ for $C_s$ has $s \( Y' \) = J v_0$ up to a unit, where $J$ is an integral involution on a common coordinate plane, and the cross pairing of either plane with the other is $chevron.l x \, J y chevron.r$ up to a unit using a unimodular alternating plane form (interchanging the variables or transporting by $J$ gives the same condition up to units). Then $Y \, Y'$ are a generic basis in upper by the half-dimension assertion, $C_s$ has again generic rank one in degrees 1 and 2, and 
$ d \( C_f \, \( Y \, Y^or \) \) = d \( C_s \, \( Y' \, \( Y' \)^or \) \) . $

 If the finite evaluation has rank two at a surplus-dimension fiber and is nonzero on the primitive generic class, the switch lowers the fiber dimension by two. A sequence ending at dimension one gives a nonnegative determinant valuation whenever the classes and exact self-dualities are integral at the test DVR.]
] <lem:foundations-square>

#proof[
  We have $H^2 \( C_(-) \) = k_(upright("gen")) Y^(*) xor k_(upright("gen")) \( Y' \)^(*)$ using upper/lower duality over the fraction field $k_(upright("gen"))$. The finite coordinate boundary pairs to zero against $Y$; take a complement $x$ of $v_0$ mapping to $\( Y' \)^(*)$. Then $v_0 and x$ has unit plane volume by the cross pairing and the local identity. Likewise on the transverse plane interchanging the two classes. Thus the two triangles compare the class-functional tensors to the same lower tensor $\( Y^(*) and \( Y' \)^(*) \)^(*)$ times unit plane volumes.
  This comparison requires compatible duality adjunctions, as in the preceding diagram discussion. At a split-in-cohomology switch place with conditions in degrees 0,1 they may be used simultaneously: isotropic restrictions admit compatible nullhomotopies on the lower comparisons (there is no ambiguity of a morphism into scalars in degree three on those tensor products). Unchanged local conditions retain the same choices. The comparison also permits volume changes from disjoint rational local modifications when these are defined by compatible triangles.
  If at a surplus-dimension fiber one arranges rank two on the old finite plane (including a nonzero evaluation of the primitive reduction), the upper localization image there is the finite plane itself. Thus the switch drops $h = dim H^1 \( C_f \)$ by two, while generically the two classes give the determinant comparison just stated.
  Iteration to $h = 1$ gives nonnegative valuation for the class-functional tensor over the DVR if exact self-duality and integral classes hold there: at that fiber minimality and generic dimensions give two free lines with zero differential, paired integrally perfectly. In these switches a primitive reduction exists in a two-term DVR model before switching whenever there is a generic line: its kernel is saturated and reduction gives a nonzero fiber class. ◻
]

===== 3.5.1 The local switch coordinates. <the-local-switch-coordinates.>

The cross calculations will use, for example, tame evaluations at inert auxiliary primes whose residue cardinalities over a quadratic field tend to 1, with trivial local action to increasing precision. Degree one then splits by evaluation on a residue Frobenius lift and a tame generator, using the inertia/residue cochains; the two axes are isotropic for a trivial-limit scalar cup. For the inertia square cup one can retain enough roots-of-unity precision: the pure-inertia additive character at any fixed precision (Frobenius value zero) factors through cyclic inertia of much greater 2-power order since the Frobenius conjugating power is 1 to that greater precision. The cyclic scalar $H^2$ products inflate to zero there. The mixed scalar cup is a unit with dual local bases. Conjugate transport via an inert rational Frobenius preserves axes using its square as residue lift, multiplying the inertia-generator argument by a unit; thus inserts its Tate transport on the other plane. We give the action hypotheses where applying this.

A related pure field parity computation is for two Lagrangian conditions whose sum modulo intersection is a symmetric split plane in degree one (characteristic zero). The same upper/lower adjunction makes the upper image a self-annihilating line there, necessarily one of the two axes; switching between them thus changes $dim H^1$ by one in parity.

=== 3.6 Central Kummer lattices and local measures <central-kummer-lattices-and-local-measures>

===== 3.6.1 Kummer conditions and their duality. <kummer-conditions-and-their-duality.>

At a finite place $v$, for an elliptic curve with coefficient $T = T_2 E$, use the local complex $U_v = E \( F_v \)_2^and \[ - 1 \]$ when imposing the full integral ordinary Kummer condition. It maps to $L_v$ by the Kummer map and lower truncation (integral $H^0 \( F_v \, T \) = 0$). Its derived reductions have image all $E \[ 2^n \] \( F_v \)$ in degree zero and exact finite Kummer in degree one, injectively: this follows by ordinary Kummer and the Bockstein on torsion invariants, taking them to their integral Kummer classes.

These are exact orthogonal complexes under local duality. The cup restriction is nullhomotopic over $bb(Z)_2$ (morphisms from the derived Kummer tensor to scalars in degree two are detected on its $H^2$, and the Kummer pairings vanish modulo all $2^n$). After a nullhomotopy the local quotient duality map is an equivalence, checked by finite Kummer orthogonality and the invariants and their duals at the residue field.

On compact cohomology the familiar sequence reads

$ 0 arrow.r E \( F_v \)_2^and arrow.r H^1 \( F_v \, T \) arrow.r "Hom" \( E^or \( F_v \)_2^and \, bb(Z)_2 \) arrow.r 0 \, $

by finite duality. Thus at odd finite places the compact $H^1$ is entirely Kummer (as also at real places by the ordinary Kummer sequence, since Weil–Châtelet there has exponent two).

The singular free coordinate at a rational dyadic place after inverting 2 uses Bloch–Kato local duality and its abelian variety comparison [5] Sections 3.7–3.11: finite Kummer is the log line, and cup against it on the Tate dual is evaluation of $exp^(*)$ against the Kummer logarithm. Thus for $exp^(*) z = alpha omega_E$ at $bb(Q)_2$ the invariant against a Kummer class $x$ is $plus.minus alpha log_(omega_E) x$. More generally use the differential/tangent and trace pairing. This is a rational comparison at the local prime, not a claim that $alpha$ is an integral quotient generator.

#thm([Lemma 3.7.])[
  (The global Kummer volume).  #emph[For the actual all-finite Kummer complex $C_(upright("Kum"))$ over an imaginary quadratic $K$, with enough support, derived base change to finite coefficients gives the usual Selmer in degree one by these assertions, and likewise passage to divisible coefficients. If $"Sha" \( E \/ K \)$ is finite, degree one integrally is the compact Mordell–Weil module, degree-two torsion has length $s_K = v_2 \( \# "Sha" \( E \/ K \) \)$ (the residual finite quotient in the change to $bb(Q)_2 \/ bb(Z)_2$), and degree-three torsion has length $tau_g = v_2 \( \# E \( K \)_(upright("tors")) \)$ by self-duality. The free parts in degrees one and two pair unimodularly. Thus for rank one, with $n_P$ the index valuation on the free line of a global point $P$, 
#[#set math.equation(numbering: n => "(Kum)")
 $ d \( C_(upright("Kum")) \, \( P \, P^or \) \) = 2 n_P + 2 tau_g - s_K . $ <eq:Kum>]

 These valuations also use conjugate-field duality if indicated (the self-duality remains integral).]
] <lem:foundations-kummer>

#proof[
  The Kummer and duality descriptions above give torsion lengths $tau_g \, s_K \, tau_g$ in degrees one, two, and three. Their signed sum in the inverse determinant convention is $2 tau_g - s_K$. The free point and its pairing functional each contribute its index valuation $n_P$. This gives (Kum). ◻
]

===== 3.6.2 Local measure factors. <local-measure-factors.>

Write $P_ell \( 1 \) = L_ell \( E \, 1 \)^(- 1)$. For a rational minimal differential at finite primes put $tau_ell = v_2 \( \# E \( bb(Q)_ell \) \[ 2^oo \] \)$ and $log_(omega_E) E \( bb(Q)_2 \) = 2^l bb(Z)_2$. Haar measures give

$ tau_ell = v_2 \( c_ell P_ell \( 1 \) \) quad \( ell eq.not 2 \) \, #h(2em) tau_2 - l = v_2 \( c_2 P_2 \( 1 \) \) . $

Indeed the connected-point measure is the nonsingular residue size divided by $ell$ (the small kernel from the formal group), giving $P_ell \( 1 \)$; at 2 use the formal-log lattice with torsion kernel.

At $bb(R)$, $H^1 \( bb(R) \, T \) = E \( bb(R) \)_2^and$ records the component factor, and a primitive Betti invariant cycle $a$ has absolute period $Omega_0$ equal to the connected period, so that $Omega_E = \# pi_0 E \( bb(R) \) dot.op Omega_0$.

=== 3.7 Bounded-series specialization and division tests <bounded-series-specialization-and-division-tests>

We record four specialization principles used with these volumes. All series in these principles are bounded: their coefficients lie in a fixed complete DVR, or in its fraction field with one common denominator. This condition is stronger than belonging to the unrestricted formal series ring over the fraction field.

#prodef([Remark 3.8.])[
  (Specialization of determinant coordinates).  If a generic determinant coordinate is defined by concentration in given degrees (in particular a free degree-one cohomology determinant), at a prime where the corresponding field dimensions are the same, Gaussian pivot comparison/minimality over the local ring permits specializing the coordinate identity, even if a previous set of rational pivots vanished. In stage comparisons one may keep the pivot minors nonzero by convergence to a #emph[fixed] finite specialization, and if the resulting ranks agree, numerator, denominator and class coordinates converge by their matrix formulas. Conversely bounded torsion-length and rank tests at scalar specializations (DVR constants) keep pivots of the corresponding size nonzero in the limit.
] <rem:foundations-pivots>

#prodef([Remark 3.9.])[
  (Scalar limits of measures).  Measures can have coefficients in $cal(V) = W \( overline(bb(F))_2 \)$ and the constant limits can then be taken in $cal(V)^(*) = "proj lim"_n product_(cal(U)) \( cal(V) \/ 2^n \)$ for the fixed ultrafilter $cal(U)$. This is still a complete integer DVR (nonzero elements have a finite first nonzero precision and divide uniquely by that many uniformizer factors to units). Fixed finite extensions can be embedded and used similarly with their ramification. Uniformly bounded denominators disappear after inverting 2 there. Bounded group-ring values at cyclic orders tending to infinite 2-power depth give bounded power series by reduction, $1 + u$ being a chosen generator variable. Substituting a fixed finite character (with scalar enlargement), or passing to a fixed finite group quotient, commutes with these limits. Arithmetic model matrices themselves use the smaller compact rings before further base change.
] <rem:foundations-measures>

#thm([Lemma 3.10.])[
  (Tame division from character tests).  #emph[In a DVR-integer bounded power-series ring in $t \, upright(bold(u))$, a divisor $L$ with nonzero reduction at uniformizer $= t = 0$ becomes distinguished up to a unit in one tame variable after a tame group-power coordinate change. The change may retain any fixed finite list of characteristic-zero generic ranks and nonvanishings at $t = 0$. If a bounded series $B$ is divisible by $L$ after inverting two at every sufficiently high two-power character in $t$, then $L divides B$ integrally.]
] <lem:foundations-series>

#proof[
  Specialize a line $1 + u_j = \( 1 + x \)^(n_j)$, one $n_j = 1$ and others successively very highly 2-divisible to separate a lexicographically leading monomial on reduction (assign the dominant lex coordinates largest $2^(v_2 \( n_j \))$ in its weighted order, large relative to the lower-coordinate orders of the chosen monomial). This works simultaneously for a finite list by using the product. The line extends to a coordinate change. To retain the indicated characteristic-zero generic ranks and nonvanishings at $t = 0$, in formal log coordinates use leading homogeneous polynomials, choosing the free integers $n_j$ avoiding finitely many proper conditions compatibly with the prescribed valuations. The same regularity test applies over a finite local coefficient order by its closed-point reduction. If a bounded $B$ is divisible by $L$ after inverting 2 at every sufficiently high $2$-power character in $t$, then Weierstrass division in that tame variable proves $L divides B$ integrally. At those specializations the divisor remains regular of the same degree (evaluation always means the parameter is generator value minus one); the monic polynomial quotient has no 2-torsion, so the integral remainder vanishes there. Its bounded coefficients vanish identically by one-variable Weierstrass. One may check vanishing componentwise where the coefficient order embeds in a product of DVRs preserving the residual regularity. In general bounded nonzero series conditions in several variables can be avoided by finite-order tests by iterating the one-variable assertion (also with remaining unspecialized variables). For a nonzero bounded one-variable series the valuation at high 2-power characters is eventually the minimum coefficient valuation plus the first degree attaining it times the valuation of the parameter, by unique dominance. ◻
]

#thm([Lemma 3.11.])[
  (The pole test).  #emph[Let $cal(O)$ be a complete dyadic integer DVR. Suppose $f_i \, g_i in cal(O) \[ \[ t \] \]$ converge coefficientwise along the fixed ultrafilter to $f \, g in cal(O) \[ \[ t \] \]$, with $f eq.not 0$. Assume, on a filter-large set of stages, that $f_i eq.not 0$ and 
$ g_i \/ f_i in cal(O) \[ \[ t \] \] \[ 1 \/ 2 \] . $

 No uniform bound on the denominators of these quotients is required. Every zero of $f$ in the open unit disk, taken in an algebraic closure of $"Frac" cal(O)$, is a zero of $g$ with at least the same multiplicity.]
] <lem:foundations-poles>

#proof[
  The common integral coefficient bound makes coefficientwise convergence uniform on every smaller closed disk. Let $alpha$ be a zero of $f$ of multiplicity $m$, and pass to a finite scalar extension containing $alpha$. If $g = 0$, there is nothing to prove. Otherwise choose, after a further finite extension if needed, a sufficiently small closed disk about $alpha$ containing no other zero of $f$ or $g$, and with neither series vanishing on its boundary. After translation and rescaling, the dominant coefficient computes the Weierstrass degree on that disk. Uniform convergence preserves this degree for both series on a filter-large set. Thus $f_i$ has exactly $m$ zeros there, while the number of zeros of $g_i$ equals the multiplicity of $g$ at $alpha$. Stage divisibility forces the latter number to be at least $m$, proving the assertion. ◻
]

We apply this lemma after fixing the tame characters. If a denominator factor is distinguished in $t$, all its zeros lie in the open unit disk. The lemma therefore makes the integral division remainder by each required power of that factor vanish at every admissible tame-character test. When the tests exclude only finitely many nonidentical vanishing conditions, the bounded-series uniqueness argument above makes the remainder vanish identically.

== 4 A Siegel-unit period and lattice calculation <sec:siegel>

This section constructs the integral smoothed classes used in the positive comparison and determines their periods. The three ingredients have distinct roles. A quotient that kills cusp differences gives a full integral modular-symbol lattice. Siegel-unit distributions give integral classes and trace maps. Explicit reciprocity and an archimedean calculation determine their rational differential coordinates, including every smoothing and Euler factor. The integral divisibility of the normalized determinant will be proved in the subsequent sections.

=== 4.1 The elliptic quotient and its relative lattice <the-elliptic-quotient-and-its-relative-lattice>

Fix an elliptic modular isogeny class of conductor $N$, with normalized newform $f$. Let $E_0$ be the elliptic optimal quotient of $J_1 \( N \)$, so that the quotient map has connected kernel. Let $C_(upright("cusp"))$ be the subgroup of $E_0 \( overline(bb(Q)) \)$ generated by the images of all geometric cusp differences, and put

$ E' = E_0 \/ C_(upright("cusp")) . $

Manin–Drinfeld makes $C_(upright("cusp"))$ finite, and its Galois stability makes this a $bb(Q)$-isogeny [23]. If $D_N$ is the cusp set, the Abel map followed by this quotient gives

$ pi : \( X_1 \( N \) \, D_N \) arrow.r \( E' \, O \) $

over $bb(Q)$. Changing the base cusp changes the Abel map by a cusp difference, so the resulting map is independent of that choice.

Allow $A = 1$ or $A = 2^k$, put $L = N A$, and let

$ Pi : \( X_1 \( L \) \, D_L \) arrow.r \( E' \, O \) $

be the $A$-degeneracy followed by $pi$. The degeneracy quotients by the cyclic subgroup of order $A$ in the marking and pushes the marked point forward. At the mark $1 \/ L$, it is $tau mapsto A tau$. Thus, for a nonzero rational invariant differential $omega$ on $E'$,

$ Pi^(*) omega = c_F F thin frac(d q, q) \, #h(2em) F \( tau \) = A f \( A tau \) \, #h(2em) q = e^(2 pi i tau) \, #h(2em) c_F in bb(R)^times . $

The form $f$ has rational coefficients and trivial character and is pulled back from $X_0 \( N \)$. The marked levels are fine: weight-two cuspidality on $X_0 \( N \)$ in particular gives $N gt.eq 5$.

Write

$ Lambda_B = H_1 \( E' \( bb(C) \) \, bb(Z) \) \, #h(2em) T = H^1 \( overline(E)' \, bb(Z)_2 \) \( 1 \) . $

The principal pairing identifies $T = T_2 \( E' \)^or \( 1 \)$ with $T_2 E'$. Choose a generator $a$ of the real-invariant sublattice of $Lambda_B$, oriented so that $integral_a omega = Omega_0 > 0$. This is the connected real period. The cycle $a$ is primitive and, under the comparison identifications, gives a basis of $T^(G_(bb(R)))$. For $xi in upright("SL")_2 \( bb(Z) \)$, let $delta_xi in H^1 \( E' \( bb(C) \) \, bb(Z) \)$ be Poincaré dual to $Pi_(*) xi { 0 \, oo }$, with orientation fixed by

$ integral_(E' \( bb(C) \)) omega and delta_xi = integral_(Pi_(*) xi { 0 \, oo }) omega . $

#thm([Lemma 4.1.])[
  (The integral relative lattice).  #emph[There is an integral Galois-equivariant map 
$ H^1 \( overline(Y_1 \( L \)) \, bb(Z)_2 \) \( 1 \) arrow.r T $

 dual to pullback on relative cohomology. When $A = 1$, there are finitely many integers $n_xi$ such that 
$ delta = sum_xi n_xi delta_xi \, #h(2em) delta \( a \) = 1 . $

]
] <lem:siegel-lattice>

#proof[
  Pullback by the map of pairs $Pi$ is integral. Relative Poincaré duality gives the displayed map; no rational Hecke projector is involved. Its differential coordinate for the dual exponential, with the Tate-twist de Rham comparison, is paired by the cup invariant with the ordinary finite Kummer logarithm on $E'$.
  For the lattice assertion, write $E_0 \( bb(C) \) = bb(C) \/ Lambda_0$. Connectedness of the kernel of $J_1 \( N \) arrow.r E_0$ makes the map on integral first homology onto $Lambda_0$. The quotient by $C_(upright("cusp"))$ replaces $Lambda_0$ by the lattice $Lambda_B$ generated by $Lambda_0$ and lifts of the cusp images. Relative cusp paths supply exactly these additional generators. Hence
  $ H_1 \( X_1 \( N \) \( bb(C) \) \, D_N \; bb(Z) \) arrow.r Lambda_B $
  is surjective. The Farey triangulation generates the relative group by Manin edges $xi { 0 \, oo }$. Their images therefore generate $Lambda_B$ integrally.
  The invariant sublattice is the kernel of complex conjugation minus one on a free integral lattice and is saturated; its generator $a$ is primitive. Unimodularity of the intersection pairing on $Lambda_B$ then makes evaluation on $a$ surjective on $H^1 \( E' \( bb(C) \) \, bb(Z) \)$. An integral combination of the Poincaré duals of the Manin edges consequently has evaluation one. ◻
]

=== 4.2 Level patterns and integral smoothed classes <level-patterns-and-integral-smoothed-classes>

We use the following two patterns of orders. The dyadic valuation of $M$ will always be sufficiently large; for example, $v_2 \( M \) gt.eq 6$ suffices for the reciprocity calculation below.

+ In #emph[square order], $n_1 = n_2 = M$, with $L divides M$. Set $l = e_2 xi$, where $e_2 = \( 0 \, 1 \)$.
+ In #emph[rectangular order], $n_1 = M$, $n_2 = b M$, where $b = N_(upright("odd"))$, $\( b \, M \) = 1$, and $2^(v_2 \( L \)) divides M$. Set $l = \( N s \, 1 \) = e_2 xi$. When filling the first row, also allow $n_1 = b_1 M$, where $b_1 divides b$ is a product of some of the full prime powers dividing $b$.

On $Y \( n_1 \, n_2 \)$, let $P \, Q$ be the independent marked points of the indicated orders on the universal elliptic curve. Independence means that they define an embedding of the indicated product of cyclic groups. The mark and determinant used for projection are

$ C = l_1 \( n_1 \/ L \) P + l_2 \( n_2 \/ L \) Q \, #h(2em) eta_M = e_M #scale(x: 120%, y: 120%)[\(] \( n_1 \/ M \) P \, \( n_2 \/ M \) Q #scale(x: 120%, y: 120%)[\)] . $

Both coefficients in $C$ are integers, including in the rectangular case, and $C$ has order $L$. The determinant $eta_M$ is a primitive $M$-th root of unity. Fix compatible primitive roots in algebraic, dyadic, and complex embeddings, using $e^(2 pi i \/ m)$ in the complex embedding.

Trace to $Y_1 \( L \) times "Spec" bb(Q) \( mu_M \)$, and then use Lemma 20. For a finite character $nu$ of $"Gal" \( bb(Q) \( mu_M \) \/ bb(Q) \)$, the summand whose root is $zeta_M^sigma$ receives weight $nu \( sigma \)$. This is an unnormalized trace: equivalently, take the group-coefficient trace and send its basis vector at $sigma$ to $nu \( sigma \)$. For period calculations, trivialize the finite twist after restriction using the specified embeddings. Reversing the Galois convention replaces the argument character consistently by its inverse.

Choose $c \, d > 1$ prime to $6 n_2$. On the variable elliptic curve $E$, write

$ zws_c g_P = P^(*) zws_c theta_E \, #h(2em) zws_d g_Q = Q^(*) zws_d theta_E $

for the canonical smoothed Siegel units. The divisor of $zws_c theta_E$ is $c^2 \( 0 \) - E \[ c \]$; its norm under $\[ s \]$ is itself when $\( s \, c \) = 1$. These are the normalized distributions of [30]. Norm compatibility under an isogeny of degree prime to $c$ follows from the divisor and uniqueness of this normalization: the norms under $\[ 2 \]$ and $\[ 3 \]$ commute with the isogeny. The Tate formula in the proof below also checks the normalization directly.

At stage $j$, replace the orders by $2^j n_1 \, 2^j n_2$ and let $P' \, Q'$ map to $P \, Q$ under multiplication by $2^j$. Before the mark and determinant projection, the class is the edge image of the unnormalized trace, at precision $2^j$, of

#[#set math.equation(numbering: n => "(K1)")
 $ \( zws_c g_(P') \) union \( zws_d g_(Q') \) med ⊗ med e_(2^j) \( n_1 P' \, n_2 Q' \)^or . $ <eq:K1>]

Parentheses denote Kummer classes. The dual basis sends the displayed primitive root to $1$, so the total coefficient is $bb(Z) \/ 2^j \( 1 \)$.

#thm([Proposition 4.2.])[
  (Integral classes and dyadic compatibility).  #emph[The classes obtained from (K1) are integral for support containing the primes of $2 n_2$ and infinity. They are compatible with the dyadic division traces and, after the mark and determinant projection, with corestriction as the dyadic part of $M$ increases with $c \, d \, A \, xi$ fixed. The projected smoothed classes on $bb(Q)$, with group or character coefficients, admit integral lifts to ordinary positive cohomology.]
] <prop:siegel-integral>

#proof[
  A further dyadic division gives a Cartesian product of the two sets of division lifts. Independence remains automatic, since the old tuple is already a basis at 2. At the old precision the inverse-root twist agrees. Base change and the projection formula identify the trace of the cup on this product with the cup of the two traces. Siegel-unit distribution then recovers the old class.
  The evaluated units and their inverses are integral away from the level. Horizontal valuations follow from their divisors. For vertical valuations, use smooth full-level models with cusps, on which every good geometric fiber component meets a cusp. The Tate expansion has leading factors consisting of signs, roots of unity, and powers of $1 - zeta$ for nontrivial level roots; all are units away from the level. A quotient of level can be checked after pullback to such a model.
  The smooth proper pair and its residue sequence show that geometric cohomology of the relative open curve is lisse away from this support and vanishes above degree one. The arithmetic degree-two to degree-one edge map therefore lands integrally in
  $ H^1 #h(-1em) (G_(bb(Q) \, S) \, H^1 \( overline(Y \( n_1 \, n_2 \)) \, bb(Z) \/ 2^j \) \( 1 \)) . $
  Here degree-one cohomology of a lisse sheaf on the integer base is fundamental-group cohomology; over a field this is the Hochschild–Serre edge map. Edge maps, maps of pairs, and traces commute. Passage to compact degree-one classes uses finiteness, or the Mittag–Leffler property in degree zero. The lattice push and the Shapiro coefficient push are integral, so neither requires a Hecke-idempotent or group-projector denominator.
  The same Cartesian-lift calculation proves compatibility when the base dyadic part of $M$ increases: the lower mark and determinant root agree. For the positive lift, first retain the Shapiro coefficient at the full cyclotomic level. This field is imaginary, and the induced coefficient has zero ordinary real $H^1$. After pushing coefficients, the global class consequently has zero real restriction and lifts to the mapping fiber defining positive cohomology. Compatible lifts in a tower can be chosen by compactness of the finite-degree cohomology groups at finite precision. Rational wedge with the real boundary basis is independent of the choice of lift. ◻
]

=== 4.3 Full-level reciprocity and cusp calibration <full-level-reciprocity-and-cusp-calibration>

For a nonzero torsion label $P = \[ x tau + y \]$, let $E_P$ be the algebraic weight-one Eisenstein form represented analytically by

$ - frac(1, 2 pi i) sum_(\( m \, n \) in \( x \, y \) + bb(Z)^2) frac(\( "Im" tau \)^w, \( m tau + n \) \| m tau + n \|^(2 w))\|_(w = 0) \, $

where evaluation at zero means regular continuation. Fix Fourier and orientation conventions consistently throughout.

#thm([Proposition 4.3.])[
  (The full-level differential).  #emph[In square order, the dual exponential of the inverse-root-twisted trace (K1), before cuspidal projection, is on each determinant component a scalar multiple of 
#[#set math.equation(numbering: n => "(K2)")
 $ \( c^2 E_P - c E_(c P) \) \( d^2 E_Q - d E_(d Q) \) thin frac(d q, q) . $ <eq:K2>]

 The scalar is 
#[#set math.equation(numbering: n => "(K3)")
 $ plus.minus M^(- 2) \, $ <eq:K3>]

 with one common sign determined by the cup, pairing, and orientation conventions. The statement holds for all $c \, d$ prime to $6 M$.]
] <prop:siegel-reciprocity>

#proof[
  #emph[The explicit reciprocity input.] Use the full-level product formula of [30] Theorem 9.5, specialized to $k = 2$ and $r = r' = 1$. The containment of prime supports required there is automatic at square level. The condition $1 lt.eq r lt.eq k - 1$, with one of $r \, r'$ equal to $k - 1$, is satisfied. We are in its case $p divides M$, so no additional Euler operator occurs. The theorem applies at $p = 2$. This is the full-level theorem; the projected theorem [30] Theorem 9.7 is not needed to obtain (K2).
  Initially take $c \, d equiv 1 med \( mod med M \)$. The symmetric-power coefficient has degree zero. The étale two-unit symbol regulator is the Kummer cup, and the negative Tate specialization over the full dyadic division tuples uses
  $ e_(2^j) \( M P' \, M Q' \)^or . $
  It is the determinant-to-the-power-$- 1$ moment. Thus the test is a full-level basis coset: every lift remains a basis tuple at 2. On the differential side no raising or polynomial-coefficient operator remains. At weight one the shifted and symplectic Fourier-dual Eisenstein forms agree under the consistent conventions; see [30] Proposition 3.11(1) and §4.2, or the Kronecker functional equation. Both labels are nonzero. The smoothing on the first row is $c^2 - c thin upright("mult")_c^(*)$, and similarly on the second row. For the initial smoothing choices the two brackets in (K2) are scalar multiples of the individual forms. Only this proportionality is needed from explicit reciprocity; we now determine its scalar.
  For completeness, the matrix form of this specialization uses a residue coset
  $ mat(delim: "(", a, b; d', e) med \( mod med M \) $
  with primitive determinant. Its two arguments are
  $ frac(a tau + b, M) \, #h(2em) frac(d' tau + e, M) . $
  At precision $2^j$, the matrices lift this coset modulo $2^j M$. In the compatible cyclotomic basis, the inverse twist in (K1) is the inverse determinant of the lift modulo $2^j$, up to the fixed orientation. The determinant need not be restricted to a single lift. This agrees with the distribution formula [60] §2.3.3, Theorem 1.4, and Proposition 5.5 at $\( k \, j \) = \( 2 \, 1 \)$; its depth condition $v_p \( M \) gt.eq v_p \( 2 p \)$ is satisfied here. The Bloch–Kato dual exponential identification used in the present proof is the original one in Kato’s theorem.
  #emph[The normalized theta function.] Put
  $ Theta \( t \, q \) = \( 1 - t \) product_(h gt.eq 1) \( 1 - q^h t \) \( 1 - q^h \/ t \) \, #h(2em) Theta \( q t \, q \) = - t^(- 1) Theta \( t \, q \) . $
  The normalized function is
  $ zws_c theta_E \( t \) = \( - 1 \)^(\( c - 1 \) \/ 2) q^(\( c^2 - 1 \) \/ 12) t^(- c \( c - 1 \) \/ 2) frac(Theta \( t \, q \)^(c^2), Theta \( t^c \, q \)) . $
  It is periodic and has the required divisor. To check its norm normalization, take the $\[ s \]$-preimages $t^(1 \/ s) q^(h \/ s) zeta_s^j$, $0 lt.eq h \, j < s$, with $\( s \, c \) = 1$. The numerator theta factors multiply, before taking the $c^2$-th power, to $Theta \( t \, q \)$. After taking the product over $j$, the denominator factors are $Theta \( q^(c h) t^c \, q^s \)$, $0 lt.eq h < s$. Write
  $ c h = h' + s k_h \, #h(2em) 0 lt.eq h' < s . $
  The inverse quasiperiod factors have $t^c$-exponent and sign exponent
  $ sum_h k_h = \( c - 1 \) \( s - 1 \) \/ 2 \, $
  and their $q$-exponent is
  $ sum_h (h' k_h + frac(s k_h \( k_h - 1 \), 2)) = frac(\( c^2 - 1 \) \( s - 1 \) \( 2 s - 1 \), 12) - frac(\( c - 1 \) s \( s - 1 \), 4) . $
  Together with the prefactors, this proves exact norm invariance. The divisor and these normalizing norms determine the function uniquely: their quotient is constant, and the norms for $\[ 2 \]$ and $\[ 3 \]$ force that constant to have both its third and eighth powers equal to one.
  For $0 < x < 1$, $c x in.not bb(Z)$, set
  $ J_c \( x \) = c floor.l c x floor.r - frac(c \( c - 1 \), 2) = c^2 B_1 \( x \) - c B_1 \( { c x } \) \, #h(2em) B_1 \( x \) = x - 1 / 2 . $
  At $t = q^x zeta$, the leading coefficient is $plus.minus zeta^(J_c \( x \))$, and the $q$-order is
  $ x J_c \( x \) + frac(c^2 - 1, 12) - frac(floor.l c x floor.r \( floor.l c x floor.r + 1 \), 2) . $
  The final two terms are integers.
  #emph[Residues and field transfer.] On any determinant component choose the cusp represented in Tate notation by
  $ P = q^(1 \/ M) \, #h(2em) Q = q^(1 \/ M) zeta_M^u \, #h(2em) u in \( bb(Z) \/ M \)^times . $
  Extend scalars to $K_0 = bb(Q)_2 \( mu_M \)$. Its width is $M$. Put $M_j = 2^j M$ and $K_j = K_0 \( mu_(M_j) \)$. For each
  $ a_1 \, a_2 in \[ 0 \, M_j \) ∩ \( 1 + M bb(Z) \) \, $
  there is one cusp orbit over $K_0$ with representative
  $ P' = q^(a_1 \/ M_j) \, #h(2em) Q' = q^(a_2 \/ M_j) zeta_(M_j)^u \, $
  width $M_j$, and residue field $K_j$. Indeed, once the old labels are fixed, translations by the old width identify the second-index lifts above $0 \, u$ in orbits of size $2^j$. Determinant primitivity makes cyclotomic Galois act freely on the resulting orbits with order $2^j$. The odd-order roots contribute only the fixed unramified data. There is no additional choice of simultaneous sign after fixing the old tuple. As a degree check, the $2^(2 j)$ cusp orbits, residue degrees $2^j$, and ramification degrees $2^j$ account for all $2^(4 j)$ division tuples.
  Set $x = a_1 \/ M_j$, $y = a_2 \/ M_j$. Use the width-order $M_j "ord"_q$. The residue of the untwisted cup is the Kummer class of the tame symbol, hence of $zeta_(M_j)^h$, where
  $ h equiv plus.minus u J_d \( y \) a_1 J_c \( x \) med \( mod med 2^j \) . $
  The coefficient signs have exponents from $- 1$ divisible by $2^j$. The inverse twist uses the root $zeta_(2^j)^(plus.minus a_1 u)$. Consequently the twisted residue on $G_(K_j)$ is the additive character
  $ plus.minus h \( a_1 u \)^(- 1) frac(chi_(upright("cy")) - 1, M_j) med \( mod med 2^j \) . $
  Here $chi_(upright("cy"))$ is the dyadic cyclotomic character; the odd part of the roots is already fixed. Transfer to $G_(K_0)$ replaces the cyclotomic expression by
  $ frac(chi_(upright("cy"))^(thin 2^j) - 1, M_j) equiv frac(log chi_(upright("cy")), M) med \( mod med 2^j \) . $
  The equality on the cyclotomic quotient is the abelian transfer formula, and the congruence follows from $v_2 \( M \) gt.eq 2$. Residue trace sums these residue-field transfers without a ramification-index multiplier. Bernoulli distribution gives
  $ sum_(a_1) J_c \( a_1 \/ M_j \) = J_c \( 1 \/ M \) \, #h(2em) sum_(a_2) J_d \( a_2 \/ M_j \) = J_d \( 1 \/ M \) . $
  The limiting residue, also the residue of the edge class by localization, is therefore
  $ plus.minus J_c \( 1 \/ M \) J_d \( 1 \/ M \) frac(log chi_(upright("cy")), M) . $
  Étale and de Rham residues for $H^1 \( 1 \)$ compare by sending the logarithmic differential of a parameter to residue one. The dual exponential on $H^1 \( K_0 \, bb(Q)_2 \)$ sends $log chi_(upright("cy"))$ to $plus.minus 1$. This follows by pairing with Kummer classes of exponential units and local reciprocity, with field trace in the de Rham pairing.
  On the Eisenstein side, the constant term of $E_(\[ x tau + y \])$, for $0 < x < 1$, is $- B_1 \( x \)$. One can obtain it by integrating in the second summation coordinate before the prefactor: the constant coefficient is the value at $w = 0$ of
  $ - i frac(sqrt(pi) thin Gamma \( 1 \/ 2 + w \), Gamma \( 1 + w \)) \( "Im" tau \)^(- w) #scale(x: 120%, y: 120%)[\[] zeta \( 2 w \, x \) - zeta \( 2 w \, 1 - x \) #scale(x: 120%, y: 120%)[\]] \, $
  where $zeta \( s \, x \)$ is the Hurwitz zeta function. The two brackets in (K2) thus have constant terms $- J_c \( 1 \/ M \)$ and $- J_d \( 1 \/ M \)$, both nonzero for the initial choices. Since $d q \/ q$ has residue $M$ at this cusp, the proportionality factor is exactly $plus.minus M^(- 2)$. The orientation is common to all components.
  #emph[Arbitrary smoothing integers.] In multiplicative group notation, divisor and norm normalization give
  $ \( c_0^2 - \[ c_0 \]^(*) \) thin zws_c theta_E = \( c^2 - \[ c \]^(*) \) thin zws_(c_0) theta_E . $
  Multiplying the first label by $c$ in (K1) changes the inverse twist basis by $c^(- 1)$. The induced operator is therefore $c^2 - c thin upright("mult")_c^(*)$. Apply the two smoothing operators and cancel the nonzero scalar $c_0^2 - c_0$ for $c_0 equiv 1 med \( mod med M \)$; do the same on the other row. This is a cancellation in the rational differential identity. It makes no assertion of integral divisibility by that scalar. Row multiplication may permute components, which is why a common calibration was used. The formula follows for every $c \, d$ prime to $6 M$. ◻
]

=== 4.4 The norm relations <the-norm-relations>

#thm([Proposition 4.4.])[
  (Good-prime norms and rectangular filling).  #emph[For either order pattern, adjoining a fresh prime $ell divides.not c d n_2 L$ to both orders and to $M$ gives, after the elliptic projection, the rational norm multiplier 
$ 1 - frac(a_ell \( f \) \[ ell \], ell) + frac(\[ ell \]^2, ell) . $

 The trace defining this norm is integral. At complete splitting in a lower abelian field the scalar is $det \( 1 - rho_T \( upright("Fr")_ell \) \) \/ ell$.]
  #emph[In rectangular order, let $q_0^a parallel b$, $q_0 divides.not b_1$. At a finite even field character $nu$ of conductor dividing $M$, filling $q_0^a$ into the first row gives the rational identity 
$ z_(upright("filled")) = #scale(x: 120%, y: 120%)[\(] 1 - a_(q_0) \( f \) nu \( q_0 \) \/ q_0 #scale(x: 120%, y: 120%)[\)] z_(upright("before")) . $

]
] <prop:siegel-norms>

#proof[
  #emph[The fresh good prime.] Before requiring independence at $ell$, the two division sets are Cartesian. Their norm is the old cup (K1), with mark, inverse twist, and lower root agreeing, also through the dyadic tower. Subtract the lifts whose $ell$-parts both lie in a fixed order-$ell$ line $I_0$, sum over these lines, and add back $ell$ times the double-prime-to-$ell$ lift. This is inclusion–exclusion: the zero pair belongs to all $ell + 1$ lines.
  For a subtracted line put $rho : E arrow.r tilde(E) = E \/ I_0$. Distribution identifies the summed cup with that on $tilde(E)$ at the unique prime-to-$ell$ points $tilde(P) \, tilde(Q)$ mapping to the old points by $rho^or$; the relevant lifts were their $rho$-preimages. Reversing the description gives old valid tuples on $tilde(E)$, with arbitrary line $ker rho^or$, mapping to $E$ by quotient and pushing the mark forward. Relative to the source, the Weil roots downstairs are raised to $ell$. This gives the field translation $\[ ell \]$ and the inverse-twist scalar $1 \/ ell$.
  This is the good Hecke correspondence, and it acts on the marked elliptic push by $a_ell \( f \)$. Indeed, pull back the relative forms $Pi^(*) omega \, Pi^(*) macron(omega)$ along the quotient and sum on the source; $F \, macron(F)$ are the corresponding Hecke eigenforms. Equality holds also for integrals along the lifted paths, with zero endpoint-function coordinates. It is consequently an equality of rational relative Betti maps, and then of rational étale maps. Thus no additional boundary projection is needed.
  The added-back lifts use multiplication by $ell$, of degree $ell^2$, and roots raised to $ell^2$. A possible diamond operator on the mark acts trivially on this push, by the same relative-form calculation. The resulting multiplier is the one in the statement. All maps used before and after the edge map are ordinary pullbacks and unnormalized traces on fiber products. At complete splitting, $\[ ell \] = 1$, and
  $ 1 - frac(a_ell \( f \), ell) + 1 / ell = frac(det \( 1 - rho_T \( upright("Fr")_ell \) \), ell) . $
  When integral derivative comparisons require removal of an error that vanishes rationally, one common nonzero integer suffices in the non-CM case. Indeed, over the abelian fields in question, the torsion of $H^1 \( T \)$ has bounded exponent. By the open Tate image [54], the commutator image contains a fixed deep special-linear congruence subgroup; its invariants on $\( T ⊗ bb(Q)_2 \) \/ T$ have bounded exponent. The usual cohomology sequence gives the asserted bound on $H^1 \( T \)$-torsion.
  #emph[Filling a bad-prime row.] Keep $Q$ and take the $q_0^a$-division lifts of $P$. The mark, the determinant map to the $M$-th roots, and the inverse-root twist agree. Without the rank condition at $q_0$, their sum is the old cup. A discarded lift is one whose $q_0$-part has its $\[ q_0^(a - 1) \]$-image in the order-$q_0$ line $I_Q$ of the $Q$-subgroup. Put $rho : E arrow.r tilde(E) = E \/ I_Q$. These discarded lifts are exactly the preimages under $rho \[ q_0^(a - 1) \]$ of the unique prime-to-$q_0$ point $tilde(P)$ satisfying $rho^or tilde(P) = P$. Their norm is $zws_c g_(tilde(P))$.
  Express $zws_d g_Q$ by the Kummer sum over $rho^or tilde(Q) = Q$. Each solution has order $n_2$. Indeed, by counting, $rho^or tilde(E) \[ q_0^a \]$ is the subgroup of $E \[ q_0^a \]$ whose $\[ q_0^(a - 1) \]$-image belongs to $I_Q$. Primitivity of $Q$ also gives $I_(tilde(Q)) eq.not ker rho^or$. These descriptions continue to hold at the upper dyadic stages in (K1).
  In reverse, the discarded sum is therefore indexed by old valid tuples on $tilde(E)$ and all lines $H_0 eq.not I_(tilde(Q))$, with quotient by $H_0$. Because $l = \( N s \, 1 \)$, the line $I_(tilde(Q))$ is also the order-$q_0$ line of the source mark. The roots are raised to $q_0$, which is a unit on the shared field and twist indices. This marked correspondence is $U_(q_0)$: at mark $1 \/ L$, its branches are $tau mapsto \( tau + i \) \/ q_0$, $i med mod med q_0$, omitting exactly the line of the mark. It acts on $F$ by $a_(q_0) \( f \)$, since $A$ is a power of 2. The translation of the root and the inverse twist thus give the stated factor $a_(q_0) \( f \) nu \( q_0 \) \/ q_0$ for the discarded sum. Subtracting it proves the filling identity. ◻
]

=== 4.5 The unnormalized elliptic period law <the-unnormalized-elliptic-period-law>

#thm([Proposition 4.5.])[
  (The period formula).  #emph[Use square order or first-row-unfilled rectangular order $b_1 = 1$. Suppose $c \, d equiv 1 med \( mod med L \)$, and let $nu$ be an even finite character of $"Gal" \( bb(Q) \( mu_M \) \/ bb(Q) \)$. For the projected, weighted class $z_nu$, the coefficient of its dual exponential relative to $omega$ is 
#[#set math.equation(numbering: n => "(K4)")
 $ plus.minus Delta_nu thin frac(L^(\( M \)) \( f \, nu \, 1 \), Omega_0) thin delta_xi \( a \) \, #h(2em) Delta_nu = \( c^2 - c nu \( c \)^(- 1) \) \( d^2 - d nu \( d \)^(- 1) \) . $ <eq:K4>]

 Here $L^(\( M \)) \( f \, nu \, s \)$ twists the Fourier coefficients by $nu$ and omits every prime dividing $M$. Scalars are compared in the algebraic differential realizations and the fixed embeddings. The sign is common across the symbols. No character-orbit average occurs.]
] <prop:siegel-period>

#proof[
  #emph[The square-order trace.] By Proposition 22, after tracing to the marked level the coefficient of $d q \/ q$ is
  #[#set math.equation(numbering: n => "(K5)")
   $ frac(plus.minus Delta_nu, \( 2 pi i \)^2) sum_(U = mat(delim: "(", h, j; m, n) in M_2 \( bb(Z) \) \, #h(0em) \( det U \, M \) = 1\
l U equiv \( 0 \, 1 \) med mod med L) frac(nu \( det U \), \( h tau + j \) \( m tau + n \)) . $ <eq:K5>]
  Regularize by multiplying the summand by
  $ y_tau^(u + v) \| h tau + j \|^(- 2 u) \| m tau + n \|^(- 2 v) \, #h(2em) y_z = "Im" z \, $
  and continuing to $\( u \, v \) = \( 0 \, 0 \)$. The row labels in a fiber over the mark $1 \/ L$ satisfy exactly these congruences, for every embedding of the determinant root; the target mark stays the same as that embedding varies. The Weil pairing is the determinant up to the common orientation, which has no effect for even $nu$. There is no simultaneous minus identification within this marked fiber. The two rescaled lattice sums contribute $M^2$, canceling the $M^(- 2)$ in (K3). Multiplication of a row label by $c$ or $d$ preserves the mark and, after reindexing its determinant weight, produces the corresponding factor of $Delta_nu$.
  #emph[Hecke unfolding.] Pair the sum with $macron(F)$ in $d x thin d y$. For positive determinant $b_0$, unfold by the right $Gamma_1 \( L \)$-action. The substitution $z = U tau$ contributes $b_0^(- 1 - u - v)$ times
  $ cal(J)_(F \|_2 U^(- 1)) \( u \, v \) = integral_(cal(H)) overline(\( F \|_2 U^(- 1) \) \( z \)) frac(y_z^(u + v), z \| z \|^(2 u)) thin d x_z thin d y_z \, $
  where the weight-two slash operator includes the determinant factor. The matrices $"adj" \( xi U \)$ give the left $Gamma_1 \( L \)$-cosets of determinant $b_0$ with first column $\( 1 \, 0 \)^(upright("tr")) med mod med L$. These map bijectively to the usual $Gamma_0 \( L \)$ Hecke cosets, where the first entry is allowed to be any unit: because $\( b_0 \, L \) = 1$, a left $Gamma_0 \( L \)$-matrix can normalize that entry to 1, uniquely modulo $Gamma_1 \( L \)$. The slash sum is therefore $a_(b_0) \( f \) F \|_2 xi$. There is no extra $- I$ stabilizer in $Gamma_1 \( L \)$.
  For negative determinants, flip the first row. This gives the subtraction with
  $ xi' = J xi J \, #h(2em) J = "diag" \( - 1 \, 1 \) . $
  Thus, without the prefactor in (K5), the paired expression is
  $ L^(\( M \)) \( f \, nu \, 1 + u + v \) #scale(x: 120%, y: 120%)[\(] cal(J)_(F \|_2 xi) - cal(J)_(F \|_2 xi') #scale(x: 120%, y: 120%)[\)] \( u \, v \) . $
  #emph[Continuation and the archimedean factor.] Start in the region $v > u > 1$. Each Kronecker series has moderate-growth meromorphic continuation and is regular at zero in this situation; pairing with a cusp form therefore permits continuation. In the unfolded expression, first hold $v > 3$ fixed and continue to $u = 0$. For $G = F \|_2 xi$ or $F \|_2 xi'$,
  $ \| G \( z \) \| lt.eq C \/ y_z \, $
  and $G$ has zero periodic mean and decays at infinity. The integral converges for $0 < "Re" u < v$. On horizontal tails, integrate by parts using a bounded periodic primitive, which is also $O \( 1 \/ y_z \)$ at small height. This permits the limit $u = 0$. On bounded horizontal intervals, the displayed growth bound, multiplied by $y_z^(u + v)$, gives local domination.
  At $u = 0$, the integral in $x_z$, apart from $y_z^v$, is $- 2 pi i thin overline(G \( 2 i y_z \))$: this follows termwise from the positive Fourier modes. Cuspidality then permits continuation of the remaining integral to $v = 0$, yielding
  $ cal(J)_G \( 0 \, 0 \) = pi thin overline(integral_0^(i oo) G \( z \) thin d z) . $
  Write $I = integral_0^(i oo) \( F \|_2 xi \) \( z \) thin d z$. The integral for $xi'$ is $- macron(I)$, since the coefficients of $f$ are real. Since
  $ frac(d q, q) and frac(d macron(q), macron(q)) = - 8 pi^2 i thin d x thin d y \, $
  the wedge pairing of the traced differential with $Pi^(*) macron(omega)$ is
  $ plus.minus 2 i thin "Im" \( A_Pi \) thin Delta_nu L^(\( M \)) \( f \, nu \, 1 \) \, #h(2em) A_Pi = c_F \( 2 pi i \) I . $
  #emph[Projection to the elliptic differential.] The relative pullback has zero cusp-function coordinates. Cutoff primitives vanishing at the cusps introduce no boundary term when paired with a differential having at worst logarithmic poles. The push is dual to this pullback, with the same trace convention on both curves. Write $delta_xi = s_0 omega + macron(s)_0 macron(omega)$. Then
  $ integral_(E') omega and delta_xi = A_Pi \, #h(2em) 2 i thin "Im" \( A_Pi \) = \( s_0 + macron(s)_0 \) integral_(E') omega and macron(omega) \, #h(2em) s_0 + macron(s)_0 = frac(delta_xi \( a \), Omega_0) . $
  The projected differential is on the Hodge line. These identities prove (K4) in square order, with consistent sign for all symbols.
  This comparison of complex and dyadic scalars is algebraic: the modular differentials with the specified weights are algebraic, and trace and push are algebraic de Rham operations. After restriction to a field trivializing the character, dual exponential uses the same weighted sum. Its local duality uses field trace, not the average of that trace.
  #emph[Rectangular order.] Apply the filling identity of Proposition 23 one full prime power $q_0^a parallel b$ at a time. This fills the first row to square level $b M$, with determinant weight inflated to that level. Each factor
  $ 1 - a_(q_0) \( f \) nu \( q_0 \) \/ q_0 $
  is nonzero at a finite character, since $\| a_(q_0) \( f \) \| lt.eq 1$. It is exactly the extra omitted bad-prime Euler factor at $q_0$. Canceling these factors in the rational period identity for square level gives (K4) with omissions at $M$, as asserted. This cancellation proves a rational differential formula. The integral fresh-prime trace for the rectangular system was constructed separately in Proposition 23. ◻
]

=== 4.6 Choices of symbols and positive quadratic twists <choices-of-symbols-and-positive-quadratic-twists>

#thm([Lemma 4.6.])[
  (A nonzero rectangular symbol).  #emph[In rectangular order one can choose $A = 2^k$ and $xi in upright("SL")_2 \( bb(Z) \)$ with lower row $\( N s \, 1 \)$ so that $delta_xi \( a \) eq.not 0$.]
] <lem:siegel-rectangular-symbol>

#proof[
  Take the upper row to be $\( 1 \, 0 \)$. After the degeneracy, the path runs from $0$ to $2^k \/ \( N s \)$. The Fricke relation for $f$ identifies the integral of $2 pi i f$ along it, up to sign, with the integral from $oo$ to $- s \/ 2^k$. For some $k$, these latter integrals cannot all be real. Indeed, Rohrlich’s finite-support twist nonvanishing [50], in the form [30] Theorem 13.5(2), applies with prime support ${ 2 }$. One can equivalently fix the odd quadratic character $eta = chi_(- 4)$ and vary primitive even characters of the real cyclotomic tower: multiplying a character of conductor $2^k$, $k gt.eq 3$, by $eta$ preserves that conductor and makes it odd. Thus there is a primitive odd character $nu$ of sufficiently high dyadic conductor with $L \( f \, macron(nu) \, 1 \) eq.not 0$.
  Set $lambda \( r \) = integral_oo^r 2 pi i f \( z \) thin d z$. The primitive additive Gauss–Mellin formula is
  $ sum_(s med mod med 2^k) nu \( s \) lambda \( - s \/ 2^k \) = nu \( - 1 \) tau \( nu \) L \( f \, macron(nu) \, 1 \) \, #h(2em) tau \( nu \) = sum_(s med mod med 2^k) nu \( s \) e^(2 pi i s \/ 2^k) . $
  Its right-hand side is nonzero. If all the indicated integrals were real, the identity $lambda \( - r \) = overline(lambda \( r \))$, which follows from the real Fourier coefficients, would make them unchanged under $s mapsto - s$. Their sum against the odd character $nu$ would then vanish. This contradiction gives a nonzero imaginary part. The path pairing in the proof of Proposition 24 then gives $delta_xi \( a \) eq.not 0$. ◻
]

#thm([Corollary 4.7.])[
  (Primitive evaluation and positive twisting).  #emph[For the square construction with $A = 1$, one may use an integral combination of symbols with $delta \( a \) = 1$ and common smoothing integers. If a fixed positive fundamental quadratic character $chi_h$, prime to $2 N$, is included in the field weight, the integral coefficient identification with the twist $E' ""^(thin h)$ transports (K4) to the corresponding twist-period formula, with its actual smoothing factors and omissions.]
] <cor:siegel-positive-twist>

#proof[
  The first assertion is Lemma 20 and linearity. Include the conductor of $chi_h$ in $M$. The weighted coefficient with this fixed factor identifies integrally with the coefficient for $E' ""^(thin h)$ by the geometric twist isomorphism. Choose this isomorphism compatibly over $bb(R)$; positivity of $h$ makes the primitive real-invariant cycles correspond up to sign. If $omega$ pulls back to $b_h omega_h$, then the transported exponential coefficient relative to $omega_h$ is multiplied by $b_h$, while
  $ Omega_(0 \, h) = Omega_0 \/ \| b_h \| . $
  The omitted-support $L$-value on the twist uses the remaining character. Thus both sides of (K4) transport with the same factor, up to the common sign. The coefficient construction is the weighted integral trace, so no division by a quadratic projector is made. ◻
]

The period in (K4) remains $Omega_0$. The factor $\# pi_0 \( E' \( bb(R) \) \)$ converting it to the total real period enters through real Kummer cohomology in the arithmetic determinant comparison.

== 5 The integral positive determinant <sec:positive-determinant>

We construct the integral determinant used in Proposition 3. The construction has three parts: a residual test controls the divisor $\( 2 \)$, finite–singular switches control the other divisors away from the fixed local factors, and character evaluations remove the remaining possible poles. The central specialization is computed here in analytic rank zero; Section 7 treats rank one and a center of initially unknown analytic rank. Throughout the construction itself, no analytic-rank hypothesis is imposed.

=== 5.1 Parameters and the determinant statement <parameters-and-the-determinant-statement>

We work with the non-CM curve $E'$, the square classes (K1) with $A = 1$, and the integral symbol combination constructed in Section 4. Optionally we compare simultaneously with the twist $E' ""^(\( h \))$, $h > 0$ fundamental prime to $2 N$.

Fix a finite support $S$ containing $oo$, $2$, the primes dividing $N$, and the support of the fixed twist when one is used. Write $S_f$ for its finite part. Take fixed $c \, d > 1$ prime to $6 product_(q in S_f) q$, congruent to 1 modulo the necessary fixed orders ($N$ and also $h$ if used). They can be avoided at all varying primes below. Use square orders $M$ whose support is exactly the indicated finite support, including auxiliary places when required, and which are divisible by the requisite fixed orders. Their $2$-parts form a genuine tower.

Throughout $T$ in a branch denotes the self-dual Tate lattice for the curve being tested ($E'$ or $E' ""^(\( h \))$); geometrically the lattices identify with the fixed quadratic scalar inserted as in (K4). Write $V = T ⊗ bb(Q)_2 \, med W = T \/ 2 T$.

At stages $i$ use a bounded tuple $R_i = \( r_(1 \, i) \, dots.h \, r_(k \, i) \)$ of new distinct odd good primes. Ultimately $k gt.eq 1$ is fixed on the limit and $r_(j \, i) arrow.r 1$ dyadically. Use an even surjective $2$-power cyclic quotient of conductor $r_(j \, i)$ for each variable there, orders tending to arbitrarily high depth, and include all these primes in the allowed and omitted support. With the true real cyclotomic $bb(Z)_2$-direction we use the limit ring

$ B = bb(Z)_2 \[ \[ t \, u_1 \, dots.h \, u_k \] \] \, $

the scalar $chi$ on chosen generators being $1 + t \, 1 + u_j$ respectively. The scalars are first defined at each finite stage, with the finite-order relations on the tame generators, and then passed to Artin matrix limits as in Section 3. We retain models also over the stage rings with actual $t$-variable before those limits. Let $M_chi = T chi$ denote the coefficient and $z$ the smoothed Kato class via the group-coefficient map, on the full global problem at support $S union R_i$. Orient all evaluations as in weighted corestriction; we allow the consistent inverse variable on the period-law side depending on conventions.

In simultaneous comparisons include a fixed order-two group-ring variable first for $chi_h$ and apply its two evaluations to common diagrams (so in the twist branch the fixed factor then goes into $T$). Both evaluations are taken over the finite local group order; no division by two is used to project onto a character.

Use the limiting positive complex

$ C^(+) = upright("fib") #scale(x: 120%, y: 120%)[\(] C_(upright("glob")) \( M_chi \) arrow.r C_(bb(R)) \( M_chi \) #scale(x: 120%, y: 120%)[\)] $

with ordinary real cochains. It is perfect by the finite-model construction of Section 3. The class $z$ lifts integrally to positive $H^1$ by the imaginary level observation of (K1), also using compactness to take compatible tower lifts. The connecting image of the real basis $a$ (transported as given even for the positive twist) is integral there. These operations can precede the two order-two evaluations when used.

#thm([Proposition 5.1.])[
  (Integral positive determinant).  #emph[The auxiliary tuples $R_i$ can be chosen with the following properties. The construction permits one prescribed sequence among their entries, provided that it satisfies the varying-support and cyclic-quotient conditions above, splits on $W$ and in the fixed twisting field, and has a limiting Tate Frobenius matrix of determinant one and trace different from two.]
  #emph[The complex $C^(+) ⊗_B B_(\( 2 \))$ is a free module of rank two in degree one, up to homotopy. Generically over $B$, the tensor $a and z$ is nonzero and gives a coordinate $U_(upright("raw")) in "Frac" B$ relative to a generator of $cal(D) \( C^(+) \)$. In a simultaneous twist comparison the generator is inherited from the common diagram before the two character evaluations. The tensor is independent of the positive lift of $z$ after passing to the fraction field.]
  #emph[Define the normalized coordinate by 
#[#set math.equation(numbering: n => "(L1)")
 $ U = U_(upright("raw")) / Delta product_(q in S_f\
q eq.not 2) D_q / P_q \, #h(2em) D_q = det \( 1 - chi \( upright("Fr")_q \) rho_T \( upright("Fr")_q \) \/ q divides V_(I_q) \) . $ <eq:L1>]

 Here $I_q$ indicates inertia and the subscript in $V_(I_q)$ takes coinvariants. $P_q$ is the #emph[actual] local inverse $L$-polynomial at 1 of the curve being tested with the unramified scalar twist in the period-law orientation. $Delta$ is the smoothing factor of (K4) with the actual field weight including the fixed character if present. All exponents in this formula are the limiting exponents. There is no $D \/ P$ correction for a moving place. The assertion is that $U in B \\ { 0 }$. If the construction is made simultaneously for $E'$ and a positive fundamental twist $E' ""^(\( h \))$, the two reductions of $U$ differ by a unit of $B \/ 2 B$. In particular, they are simultaneously units at the closed point.]
] <prop:positive-determinant:integral>

We prove the proposition through the next three subsections. The distinction between the divisor $\( 2 \)$ and the horizontal divisors will allow the latter argument to use fixed clearing powers of two without losing the former.

#thm([Lemma 5.2.])[
  (The fixed factors).  #emph[The factors $Delta \, D_q \, P_q$ in (L1) are integral and remain nonzero modulo two after all tame parameters are set to zero. Each $D_q \/ P_q$ has central value one and reduces to a group-like unit in the residual fraction field.]
] <lem:positive-determinant:factors>

#proof[
  All indicated fixed polynomials and smoothing factors are integral, nonzero modulo 2 even upon $u_1 = dots.h.c = u_k = 0$. Indeed each of the real cyclotomic exponents of $q \, c \, d$ here is nonzero, and $D_q \, P_q$ use the same type of elliptic polynomial in possibly opposite orientations (good quadratic, signed multiplicative linear, or trivial additive). This follows from the ordinary local Tate description: unramified action at good primes, quotient coinvariant unramified sign line at multiplicative primes, no rational coinvariant at additive primes. It uses the already twisted curve if testing that branch. Palindromicity gives the asserted residual unit, and the two orientations agree at the central specialization, giving ratio one. ◻
]

=== 5.2 Auxiliary primes and residual concentration <subsec:positive-determinant:residual>

#thm([Lemma 5.3.])[
  (Residual concentration).  #emph[The auxiliary primes in Proposition 27 can be chosen so that the positive complex is free of rank two in degree one over $B_(\( 2 \))$, up to homotopy. The two raw determinant tensors in a simultaneous positive-twist comparison have identical reductions in the residual fraction field.]
] <lem:positive-determinant:residual>

#proof[
  #emph[Required local tests.]
  All added primes split on $W$ and in the fixed twisting field, and their arithmetic Tate Frobenius matrices have ultrafilter limits $g_j$ with determinant 1 and trace $eq.not 2$ (use chosen local embeddings). This includes the required hypothesis for the distinguished prime.
  Use Frobenius lifts there and at the other moving primes trivial in their #emph[own] tame cyclic field, and inertia generators taking the chosen generator values. Write $e_(j l) in bb(F)_2$ for the bit of the Legendre symbol $\( r_(j \, i) \/ r_(l \, i) \)$ for $j eq.not l$ (stagewise), symmetric by reciprocity. We arrange the following two properties.
  + For each $q in S_f$, the limiting unramified tame-scalar exponent vector at $q$ is nonzero.
  + If $W$ is irreducible, at the stages on the filter, for common generic $lambda_j in overline(bb(F))_2^times$, the following residual $W ⊗ overline(bb(F))_2$ Selmer problem is zero: unramified at fixed finite and other nonmoving places, unrestricted at infinity, and at the moving places
    #[#set math.equation(numbering: n => "(L2)")
     $ f_j = b_j s_j \, #h(2em) b_j = lambda_j^(- 1) sum_(l eq.not j) e_(j l) lambda_l \, #h(2em) f_j = x \( upright("Fr")_j \) \, quad s_j = x \( sigma_j \) \, $ <eq:L2>]
    with $sigma_j$ the indicated tame generator. If $W$ is reducible use just one dummy prime in addition to the distinguished prime if used; when there are two, require their mutual bit to be one.
  #emph[The dummy prime and the fixed-place exponents.] First add the dummy prime. To achieve (i), prescribe over the field of $W \, chi_h$ (where used) and the $2$-cyclotomic tower simultaneous nonzero Kummer exponents on compatible $2$-power roots of each $q in S_f$, using accuracy tending to infinity. Each coordinate can indeed be nonzero: otherwise the pure cyclotomic tower would have only bounded-degree further radical extensions for that $q$, hence none (the bounded image on the compatible roots there is a finite subgroup of $bb(Z)_2 \( 1 \)$). Even all positive radicals of $q$ cannot lie in the abelian tower, by Eisenstein and nonreal conjugates.
  Joint nonzero values now follow by additivity, and the bit with the distinguished prime remains free by its separate new ramification (take bit zero when $W$ irreducible). In tame residue characters at the chosen primes the power residue exponents thus have bounded valuations (normalization of a cyclic generator only changes by units).
  Trace nonexceptionality can simultaneously be kept with $v_2 \( 2 - "tr" g_j \)$ bounded: within the kernel of such bounded-derived-length constraints the Tate image contains a fixed deep $upright("SL")_2$ by open image [54] and closed iterated commutators as in the evaluation construction of Section 3. Its perturbations can keep the trace off 2 uniformly for a compact set of starting matrices. Chebotarev now gives stage choices to increasing precision, split also to the needed cyclotomic depths.
  #emph[Killing the irreducible residual Selmer space.] We next arrange (ii) when $W$ is irreducible. Work first over $bb(F)_2$, initially and at new primes with all mutual bits zero, so $f_j = 0$. Write $F \, F^(*)$ for the resulting Selmer and exact-annihilator Selmer subspaces in global $H^1 \( W \)$, using the Weil pairing. At fixed odd places unramified is self-annihilator by isotropy, dimension $h^0$, duality and the local Euler formula. At 2 unramified is isotropic of dimension $h^0$ with annihilator two dimensions bigger. At the moving split primes the planes $f \, s$ pair by the mixed Weil pairing up to unit, separately isotropic (scalar Hilbert pairing alternating since $r_j equiv 1 med mod med 4$). At infinity the dual condition is strict. Thus by Wiles’s dimension formula (Poitou–Tate, subtracting ordinary $h^0$ at each local place)
  $ h^(*) = h + delta \, #h(2em) h = dim F \, #h(2em) h^(*) = dim F^(*) \,\
delta = cases(delim: "{", 1 & upright("if complex conjugation acts nontrivially on ") W \,, 0 & upright("otherwise") .) $
  Indeed in the first case real $h^0 = 1 \, h^1 = 0$; in the second both equal 2. At a new prime with zero bits, switching there from unramified to $f = 0$ gives
  $ h_(upright("new")) lt.eq h - "rank" upright("loc")_r F + 2 - "rank" upright("loc")_r F^(*) . $
  The strict kernel is unchanged by inflation and the new singular coordinate must annihilate old dual evaluations. This bound works also with changed fixed conditions and their exact duals.
  At a new split prime evaluations can be prescribed arbitrarily on a joint $upright("End")_(G_(bb(Q))) W$-independent set of residual classes. Indeed restriction to the joint kernel of $W$ and the pro-2 abelian data for bits, cyclotomic and fixed-twist splitting detects these classes: the quotient has a normal subgroup of order three with no invariants. Additive joint evaluations there form a submodule of a sum of the simple $W$, hence surject by independence. The bits with old primes are freely imposed by disjoint quadratic ramification over the fixed split fields. Evaluation fields do not upset the trace-limit freedom by the same bounded-derived-length argument. Take Chebotarev representatives as above. Dimensions are uniformly bounded for a bounded tuple, so choices and a bounded iteration based initially on a bounded dimension can be fixed in pattern along the filter.
  For cyclic cubic image the spaces with the stated zero-bit conditions are $bb(F)_4$-spaces via that endomorphism field (annihilators also stable); if $h > 0$ arrange rank two over $bb(F)_2$ on both.
  For $S_3$ image arrange ranks $min \( 2 \, h \) \, min \( 2 \, h^(*) \)$ simultaneously by choosing a basis including the intersection. This drops $h$ until zero except possibly $h = h^(*) = 1$.
  If the lines then coincide, the intersection problem (unramified at 2 and strict at infinity) has dual of dimension three (by the formula) containing that line. Switch at a new prime evaluating nontrivially on the line and surjectively on this larger dual. The same bound kills the intersection and keeps $h = h^(*) lt.eq 1$.
  Once the two lines are independent, add a zero-bit prime $A'$ evaluating the generators on nonparallel vectors $v \, w$, respectively. If after switching $h > 0$ persists, both spaces still have dimension one and the singular coordinates at $A'$ of their new respective generators are $w \, v$, by vanishing of strict kernels and orthogonality.
  Add now a last prime $B'$ evaluating trivially on both new lines but with bit 1 with $A'$, others zero. With $x = lambda_(B') \/ lambda_(A')$ the conditions are $f_(A') = x s_(A') \, med s_(B') = x f_(B')$, recovering the preceding problem at $x = 0$. Its generator cannot lift modulo $x^2$: pair the linear coefficient globally with the preceding dual generator, giving $chevron.l w \, v chevron.r eq.not 0$ at $A'$ and zero at every other place. The modified local equations form a matrix over $k' \[ \[ x \] \]$ on these fixed global and local spaces. A nonzero generic solution could be scaled to an integral solution with nonzero reduction. That reduction would be a nonzero multiple of the preceding one-dimensional Selmer generator, and rescaling would give the forbidden lift modulo $x^2$. Thus we have vanishing on a nonempty open as required.
  All avoidance polynomials can be fixed along the filter by bounded dimensions and finite base field; we work with $lambda_j$ in a sufficiently large common finite $k' \/ bb(F)_2$.
  #emph[A one-parameter residual test.] Set $A = k' \[ \[ z_0 \] \]$ and specialize
  $ 2 = t = 0 \, #h(2em) u_j = lambda_j z_0 . $
  In the irreducible case choose $\( lambda_j \)$ in the nonempty open set furnished by (ii); in the reducible case retain the one- or two-prime configuration specified there. Choose the vector also so that each fixed finite place in (i) has nonconstant unramified scalar. The latter conditions are nonempty: the first nonzero term of the scalar is determined by the least valuation of its nonzero exponent vector, and cancellation excludes a proper closed condition on the $lambda_j$.
  Over $k' \( \( z_0 \) \)$, Frobenius at a fixed finite place consequently has no invariants, on either coefficient. At a moving place the nontrivial inertia scalar gives the same conclusion. Local duality also gives $H^2 = 0$ at every finite place. These are statements about the local limit models: at fixed places the coefficient actions stabilize at every precision; at moving places the inertia/residue models give the assertions. Evaluation on these local groups also shows that global $H^0$ vanishes.
  #emph[The remaining global obstruction.] It remains to kill the kernel of finite localization on ordinary degree-one cohomology of the dual coefficient. Here is the precise Poitou–Tate reduction. At a finite stage and scalar precision $A \/ \( z_0^n \)$, write $K_n$ for that dual strict-at-finite kernel. Subscripts $n$ below denote the corresponding finite-precision complexes. Finite Poitou–Tate gives
  $ dim_(k') H^2 \( C_n^(+) \) lt.eq sum_(v in S_f union R_i) dim_(k') H^2 \( L_(v \, n) \) + dim_(k') K_n \, $
  and bounds $dim_(k') H^3 \( C_n^(+) \)$ by the dual global invariant dimension; higher positive cohomology vanishes. To see the first bound, the cokernel of ordinary $H^1$-restriction to the real place is dual to the real image of $K_n$. The kernel of $H^2$-restriction to the real place maps to the finite local $H^2$’s, with kernel dual to the everywhere-locally-zero subspace of $K_n$. These two contributions together have dimension at most $dim K_n$. Ordinary and Tate-modified real terms agree in the positive degrees used here. A perfect coefficient-ring functional identifies the finite duals in this calculation.
  Apply this inequality stagewise and then to the limit matrices. For a finitely generated $A$-module, the dimension of its reduction modulo $z_0^n$ is its free rank times $n$, up to a bounded term. The local vanishings just proved therefore remove the local contributions after division by $n$. The strict-finite kernel is likewise measured by its mapping-fiber model; finite local $H^0$ has rank zero. Consequently a rank-zero dual strict-finite kernel implies that $C^(+) ⊗_A k' \( \( z_0 \) \)$ is concentrated in degree one.
  #emph[Reduction of the dual kernel.] Let $N$ be the full saturated preimage of this kernel in ordinary dual $H^1$ over $A$, including its torsion. Saturation and the cohomology base-change sequence inject $N \/ z_0 N$ into residual ordinary $H^1$. At each fixed finite place its image is unramified: inertia acts constantly, so a restriction that becomes a coboundary after multiplication by a power of $z_0$ has residual coefficient a coboundary on inertia.
  At a moving place the tame cocycle relation on the limit is
  $ \( chi^(- 1) \( sigma_j \) - 1 \) x \( upright("Fr")_j \) = \( chi^(- 1) \( upright("Fr")_j \) - 1 \) x \( sigma_j \) . $
  Indeed, discard prime-to-two inertia and use $r_j arrow.r 1$ in the Frobenius conjugation relation, including its cocycle sum. Dividing by $z_0$ and reducing gives (L2). These conditions are retained in the finite diagrams: at a fixed place finitely many inertia evaluations detect a coboundary, and at a moving place the two displayed evaluations were marked. Thus the residual tests apply to the reduction of $N$, not merely to unrelated stage classes. In the irreducible case (ii) gives $N \/ z_0 N = 0$, hence $N = 0$.
  #emph[The reducible case.] For a trivial constituent, residual classes unramified away from the moving finite places are spanned by $\[ r_j \]$, since $r_j equiv 1 med \( mod med 8 \)$. Their evaluations are the Legendre bits in (L2), with own-prime Frobenius bit zero. With one prime, or with two primes of mutual bit one, the solution space has dimension one. The saturated preimage $N$ already contains the torsion cocycle $\( chi^(- 1) - 1 \) \/ z_0$, with nonzero reduction; it can be defined compatibly at one higher precision. Since this torsion class occupies the sole allowed residual dimension, $N$ has free rank zero. The preceding Poitou–Tate argument gives positive concentration for a trivial constituent. Exact triangles for extensions then give concentration for $W$.
  #emph[Concentration and twist comparison.] Matrix cancellation now gives concentration over the full residual fraction field, and then over $B_(\( 2 \))$. The Euler characteristic of $C^(+)$ is $- 2$: evaluate a stage at constant characteristic-zero coefficients, where the ordinary global Euler characteristic is $- 1$ and the real invariant line contributes one more subtraction. Thus the minimal model over $B_(\( 2 \))$ is a free rank-two module in degree one. The integral tensor $a and z$ has nonnegative valuation there; the fixed factors are units at $\( 2 \)$.
  In the simultaneous twist construction the common diagram, determinant basis, and classes give identical raw reductions in the residual fraction field. The smoothing reductions agree too. After the remaining height-one tests prove $U in B$, the group-like residual factors $D_q \/ P_q$ therefore show that the two reductions of $U$ differ by a unit of $B \/ 2 B$. ◻
]

At this point integrality has been proved only at $\( 2 \)$. We next prove generic nonvanishing and control all horizontal divisors; the closed-point unit comparison in Proposition 27 will then follow from the residual comparison just obtained.

=== 5.3 Horizontal line switches <subsec:positive-determinant:horizontal>

We use three characteristic-zero tests. Each has its own diagram and its own old local conditions:

#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Source
], table.cell(rowspan: 1, colspan: 1)[Test ring
], table.cell(rowspan: 1, colspan: 1)[Old finite conditions
], table.cell(rowspan: 1, colspan: 1)[Use
]),
  table.cell(rowspan: 1, colspan: 1)[(i) Moving $B$-limit
], table.cell(rowspan: 1, colspan: 1)[$B_(frak(p))$
], table.cell(rowspan: 1, colspan: 1)[Full at every finite place
], table.cell(rowspan: 1, colspan: 1)[Divisibility away from fixed factors
],
  table.cell(rowspan: 1, colspan: 1)[(ii) Fixed support, no $R_i$
], table.cell(rowspan: 1, colspan: 1)[$"Frac" bb(Z)_2 \[ \[ t \] \]$
], table.cell(rowspan: 1, colspan: 1)[Full at every finite place
], table.cell(rowspan: 1, colspan: 1)[Generic nonvanishing
],
  table.cell(rowspan: 1, colspan: 1)[(iii) Fixed stage, character $eta$
], table.cell(rowspan: 1, colspan: 1)[$\( Lambda_eta \)_(frak(q))$ and its fraction field
], table.cell(rowspan: 1, colspan: 1)[Unramified at odd places, full at two
], table.cell(rowspan: 1, colspan: 1)[Removal of fixed divisors
],
)
]

In (i), $frak(p)$ is a height-one prime satisfying $frak(p) divides.not 2 Delta product_(q in S_f \, thin q eq.not 2) D_q P_q$. In (iii), take one sufficiently deep original stage and specialize every variable at $r_(j \, i)$ to a nontrivial finite character; we call these characters active. Their product is $eta$, and $Lambda_eta = bb(Z)_2 \[ eta \] \[ \[ t \] \]$, with the true cyclotomic parameter retained. The test prime $frak(q)$ is horizontal of height one. Additional restrictions on $eta$, and the square or rectangular class used in that test, are specified below.

The fixed positive quadratic scalar, if active, goes into $T$. Write $cal(O)$ for a test DVR here, or use just its fraction field for a generic-only test; $2$ is invertible. Use the #strong[ordinary] global problem (no real condition after inverting 2). In determinant valuation for a positive full complex concentrated as asserted, this simply removes the invariant real basis term: the ordinary real complex after base change is the free invariant line in degree zero, with basis $a$, since all these characters are even. Thus the coordinate of $a and z$ has the same valuation as the ordinary determinant coordinate using $z$. All dualities and inflation comparisons here are after the model limit and $2$-inversion as in Section 3 (one can use the comparisons via $bb(Q) \( i \)$). For a fixed-stage or fixed-support true tower, later switches use a new sequence/ultrafilter internal to the test, keeping its original diagram before switches; true-tower comparisons at the base are then unchanged.

#thm([Lemma 5.4.])[
  (Horizontal switching).  #emph[In any of the three test settings, let $z_(upright("sys"))$ be the indicated square or rectangular class, satisfying the old local conditions. If its generic image is nonzero, the ordinary complex has a single generic cohomology line, in degree one. At every indicated horizontal test DVR the determinant coordinate of $z_(upright("sys"))$ has nonnegative valuation.]
] <lem:positive-determinant:horizontal>

#proof[
  #emph[Old local conditions and duality.] We first check cohomology at the old places, over both the generic and residue fields when a DVR is being tested.
  - In the first test dual local $H^0$ vanishes at every finite place of the old support. At fixed odd $q$ this follows from $D_q$ (duality of inertia-invariants with coinvariants, including the Tate twist).
    At 2 choose an inertia element mapping to a generator in the real cyclotomic direction, and a Frobenius lift trivial in that direction. The invariance equations then require the simultaneous vanishing of a nonzero polynomial up to a unit in $t$ alone (monic after writing the determinant condition with the inverse scalar cleared), and a nonzero series independent of $t$. The latter uses property (i) of the tame exponents in the residual construction and constant Tate action of the chosen element. The first is regular in $t$, so its distinguished polynomial has no factor independent of $t$. It therefore has no height-one prime factor in common with the second series, by Weierstrass division.
    At a moving $r_(j \, i)$ invariance on inertia requires $u_j = 0$; on that divisor the Frobenius determinant condition is not identically satisfied, by $det \( g_j \) = 1 \, "tr" g_j eq.not 2$ on setting scalars centrally. These calculations test the actual local models (fixed groups by coefficient stabilization, moving odd primes by the inertia/residue complexes or Frobenius and inertia evaluations).
    In the second, generic $t$-test the same dual vanishing at fixed places uses inertia at 2 and nonconstant $t$-Frobenius scalar at every odd $q$.
  - In the third test we require the active characters such that already a fixed Frobenius lift at 2 trivial in the cyclotomic direction kills dual invariants, by its action with the constant part of the scalar.
    At each old odd $q$ of the fixed-test support (including all now-fixed tame variable places), put the inflated residue cochains on the inertia invariant block for the unramified complex condition, similarly dually. This is well-defined here after inverting 2 with base change to both fields. Indeed inertia action of $V ⊗ eta$ is constant; after exact prime-to-2 kernel invariants on inertia, the two-term procyclic $2$-inertia linear algebra is constant, split in cohomology over the rational coefficient space before imposing residue Frobenius. The quotient relative to the unramified condition computes residue cochains on the inertia coinvariants with negative Tate twist in degrees $1 \, 2$, by this calculation and inertia truncation (Frobenius conjugation on the generator evaluation modulo coinvariant relations inserts $q^(- 1)$). The same formulas hold on the local models in subsequent switches. Its determinant of differential up to unit is
    $ D_(q \, eta) = det \( 1 - chi_t \( upright("Fr")_q \) rho_(V ⊗ eta) \( upright("Fr")_q \) \/ q divides \( V ⊗ eta \)_(I_q) \) \, $
    where $chi_t$ denotes the $t$-scalar. This is nonzero by nonconstant cyclotomic action (and equals 1 at active tame variable conductors, by good reduction there). The quotient has zero $H^1$ over the DVR itself by injectivity, though possibly not on its residue field.
    These local conditions include all $H^0$ and inject in $H^1$ there also. They give exact complementary dualities over the DVR: nullhomotope the cup via its unramified inflation factorization (residue cohomological dimension one with free models). Over a field the two unramified $H^1$ dimensions equal the respective $H^0$’s; by local duality and the local Euler characteristic zero these are orthogonal complements. This and inclusion of all invariants, no $H^2$, checks the quotient duality equivalence by base change.
  In all tests global invariants vanish (also dually) by the open-image evaluation argument below. Global Euler characteristic in the problems is $- 1$, by the ordinary formula, or computing the positive-model Euler characteristic $- 2$ stagewise at constant characteristic-zero coefficients and restoring the real term. Unramified conditions at odd places of the third test have Euler correction zero. Consequently the cohomology on the fields has amplitude $1 \, 2$ by duality and exact orthogonality, with
  $ h = 1 + h^(*) \, $
  where $h \, h^(*)$ denote primal and exact-annihilator dual dimensions in degree one. Both degree-one spaces inject into ordinary unrestricted global $H^1$ (dual strict uses the old dual local invariant vanishing where full old conditions are imposed). These assertions continue to hold with finitely many new line conditions in the argument.
  #emph[Local lines at a switching prime.] Switch at fresh good primes $ell = ell_i$ tending to 1 in $bb(Z)_2^times$, splitting on all base scalar data to increasing precision, with Tate Frobenius limiting to
  $ tau = mat(delim: "(", 1, e; 0, 1) \, #h(2em) e eq.not 0 \, $
  deep in an open-image special linear subgroup. Here $i$ runs over stages of the relevant limit (internal stages in the second and third tests). Inertia acts trivially. On the limit DVR the local complex is split free on cohomology in $0 \, 1 \, 2$; degree one has axes the finite and singular lines
  $ f : med M_(cal(O)) \/ \( tau - 1 \) M_(cal(O)) \, #h(2em) s : med ker \( tau - 1 divides M_(cal(O)) \) \, $
  by evaluation on a Frobenius lift and a tame inertia generator respectively; $M_(cal(O))$ denotes the coefficient there. Indeed $e$ is a unit, and one uses the unramified and singular blocks from inertia/residue cochains (the conjugation exponent tends to 1). In particular the pure singular evaluation class sending inertia to the invariant basis and Frobenius to zero can already be computed to growing precisions with $ell equiv 1$, Frobenius action $equiv tau$. The two pure lines, taking in addition all $H^0$ but not $H^2$, are self-annihilating against their respective opposite versions under the identification by the Weil form (inverse scalar there, also trivial locally in the limit). For the finite line use inflation isotropy; for the pure singular line the just-described cocycles take values along the same Weil-isotropic invariant line, giving the limiting cup zero also. Perfectness then follows by local duality (the mixed pairing is perfect); these are exact orthogonal complex conditions since local cohomology splits, using nullhomotopies as in Section 3. Use likewise lower taking only degree zero and upper taking both coordinates in addition, exact opposites. The finite condition identifies by inflation with proceeding without allowing this prime. Each intermediate line condition has Euler correction zero and takes in all $H^0$.
  #emph[Selection of the switching primes.] For $cal(G) = product_i G_(bb(Q))$ take the product $cal(H)$ of the exact kernels of Tate action together with metabelian data $cal(E)_i$, containing $bb(Q)^(upright("ab"))$ and the $2$-power roots of all old derivative primes (it suffices to take their composite). The scalar actions in use factor through those data. The image quotient contains as a normal subgroup arbitrary sequences of a fixed deep $upright("SL")_2^b \( bb(Z)_2 \)$ in the Tate action alone, trivial on $cal(E)_i$, by open image for the non-CM curve and closed iterated commutators. Choose $tau$ as above in that subgroup (using its constant sequence). Thus by the product-group evaluation and diagonal-vanishing argument in Section 3, global $H^0$ vanishes on all fields in question; restrictions to $cal(H)$ detect crossed global classes. On $cal(H)$ these evaluations are additive, and for a nonzero class the evaluations span the plane by equivariance and absolute irreducibility. These statements apply separately to primal and dual, whose Selmer degree-one classes inject as above.
  If on the fiber $h > 1$ with a sole generic line already established, choose the nonzero fiber class from a primitive reduction of that line, and some nonzero degree-one dual class. In a generic-only surplus-rank test below instead take a specified nonzero primal class and some nonzero dual class. In a product-group coset of $cal(H)$ having action $tau$ and trivial metabelian action, we can simultaneously make both evaluations nonzero modulo $\( tau - 1 \)$: each is a proper affine avoidance test on the additive evaluations, possible jointly by integer combinations in characteristic zero. Coboundary adjustments do not affect the tests. We require Frobenius agreement with the resulting sequence on the old diagram evaluations to growing precisions.
  #emph[The depth margin for descent.] Keep a full finite abelian base $K_0 = bb(Q) \( mu_(M_i) \)$ per stage for the Kato constructions with $2$-part sufficiently deep for cofinal base scalar precisions, fixed before adding derivative primes. This contains any fixed scalar fields needed for the weighted trace and uses the chosen old omitted support as specified for each system (in square order include the moving primes just once).
  Within the necessary termwise finite open constraints one can still keep $cal(E)_i$-action exactly trivial while perturbing $tau$ by arbitrarily deep special linear elements so $v_2 det \( 1 - rho_T \)$ is large but finite. Indeed intersecting an open subgroup with that metabelian kernel still gives open image inside a deep special linear subgroup; one may perturb in the lower unipotent. #strong[Then] choose $A_i$ much larger still. Chebotarev gives $ell_i$ with agreements to the requisite finite precisions, splitting in $K_0$ and in all previously chosen derivative fields, with $ell_i equiv 1 med mod med 2^(A_i)$, and with
  $ v_2 det \( 1 - rho_T \( upright("Fr")_(ell_i) \) \) arrow.r oo \, #h(2em) A_i - v_2 det \( 1 - rho_T \( upright("Fr")_(ell_i) \) \) arrow.r oo . $
  Impose also splitting on $2^(A_i)$-th roots of all previous derivative primes. Thus those primes split in the new degree $s_ell = 2^(A_i)$ subfield of $bb(Q) \( mu_(ell_i) \)$ (the new derivative field). Exclude old places, primes of smoothing integers and all level primes already present. This realizes the two nonzero tests by choosing the place representatives (cf. Chebotarev on evaluation matrices in Section 3). A Frobenius lift trivial also in the new derivative field can be used, by inertia adjustment invisible on the old data needed.
  Further additions keep previous choices and diagram comparisons, reducing to slower cofinal precisions if needed. Splitting in $K_0$ and the mutual splitting at all other derivative primes here are exact at each stage, not just limiting trace conditions.
  #emph[Derivative classes and descent.] For the square or rectangular Kato system being used, keep its base orders/mark/symbols/smoothings and add each derivative prime once to both orders and the determinant index. For $I$ a subset of such primes at the current stage let $K_I \/ K_0$ be the composite with their derivative fields. Trace first to $K_I$, with $T$-coefficients denoted throughout by their identification there (so transport by the fixed quadratic twist is allowed, trivial as a character over $K_0$). Let $c_I$ denote the integral resulting class, using (K1). Write $sigma_ell$ for a tame inertia representative mapping to a generator on its own cyclic derivative factor and trivial on all the other factors. Consider
  $ D_I^(upright("der")) c_I \, #h(2em) D_I^(upright("der")) = product_(ell in I) D_ell^(upright("der")) \, #h(2em) D_ell^(upright("der")) = sum_(j = 1)^(s_ell - 1) j sigma_ell^j . $
  The good Euler norm of Proposition 23, pushed by trace to these fields, gives norm down at $ell$ with scalar $p_ell = ell^(- 1) det \( 1 - rho_T \( upright("Fr")_ell \) \)$; the projection of the field translation is trivial there by the splitting. This is integral equality after a uniform fixed nonzero multiple $L_0$. Indeed $H^0 \( \( T ⊗ bb(Q)_2 \) \/ T \)$ over #strong[all] these abelian fields has bounded exponent by the commutator image, which bounds the torsion ambiguity in $H^1 \( T \)$; inflation into unrestricted cohomology is injective in degree one. All norm calculations can thus be made with the required enlarged supports also.
  Work modulo $2^n$, $n arrow.r oo$ sufficiently slowly that $s_ell \, med p_ell equiv 0 med mod med 2^n$ and $A_i > n$ for all current factors (using each one’s chosen depth). The identities $\( sigma_ell - 1 \) D_ell^(upright("der")) = s_ell - N_ell$, $N_ell$ the cyclic sum, then show $L_0 D_I^(upright("der")) c_I$ invariant modulo $2^n$.
  Multiply by a further fixed integer $L_1 eq.not 0$ for descent by inflation-restriction: the obstruction in degree two of the finite group with coefficients $\( T \/ 2^n \)^(G_(K_I))$, and similarly inflation ambiguity, are killed by a bounded power of 2 by the same open-image argument. This applies on unramified-outside-allowed-support groups (including the derivative ramification). Write $L_(*) = L_0 L_1$, the same for all subsets.
  Descend $L_(*) D_I^(upright("der")) c_I$ modulo $2^n$ to $K_0$, then weighted corestrict from $K_0$ to the global deformation coefficients (trivialize the scalar over $K_0$ at the working precisions). Taking limits gives integral ordinary classes $Z_I$ with $Z_diameter = L_(*) z_(upright("sys"))$, where $z_(upright("sys"))$ is the original system’s base class. Here for the empty set we simply use the original representative; compatibility with the true $t$-tower uses the $2$-power compatibilities of (K1).
  Choices need not give an Euler system of descents in $t$: reduce as needed to cofinal Artin quotients, taking representatives to cycles on the models there and matrix limits. This preserves any previously chosen lower-subset classes through inflation. The weighted corestriction has no division by the group order.
  #emph[The finite–singular comparison.] We give the local comparison, allowing the moduli $2^n$ to be decreased cofinally. At $ell in I$ take #strong[integral] cocycles $b \, b_ell$ on $G_(K_(I - { ell })) \, G_(K_I)$ respectively, for lower and upper classes after applying $L_(*)$ and #emph[all other] derivatives. Write $sigma = sigma_ell \, med m = s_ell \, med Phi = upright("Fr")_ell$ a lift trivial on $K_I$, and $F = rho_T \( Phi \)$.
  Both cocycles vanish on the respective local inertias: inertia acts trivially on $T$, and even over the upper cyclic ramification $H^1 \( I_(upright("loc")) \, T \)^Phi = 0$ by good reduction and Weil (no eigenvalue $ell$; the residue degree here is one). This applies at conjugate places as well. Put $x = b \( Phi \) \, x_ell = b_ell \( Phi \)$. On $G_(K_I)$ the exact norm equality gives, for some $y in T$,
  $ sum_(j = 0)^(m - 1) \( sigma^j b_ell \) \( u \) = p_ell b \( u \) + \( u - 1 \) y \, #h(2em) \( F - 1 \) y = m x_ell - p_ell x . $
  Here a translate conjugates the argument and acts on the coefficient. All the translates in the sum have the same value on $Phi$, by the inertia vanishing and trivial inertia action. Also $sigma^m b_ell = b_ell$ as cocycles by the same vanishing on $sigma^m$.
  Let $B_I$ be the mod-$2^n$ descended cocycle before weighted corestriction. On the upper subgroup adjust by a coboundary (adjusting also on the whole group of $K_0$) to make its restriction equal to $D_ell^(upright("der")) b_ell$. Its value on $Phi$ after adjustment is zero by $m \( m - 1 \) \/ 2 equiv 0$. Applying $sigma - 1$ on these restrictions gives, for $u in G_(K_I)$,
  $ \( u - 1 \) B_I \( sigma \) = - \( u - 1 \) y med mod med 2^n \, $
  using the crossed identity, the norm calculation and $sigma^m b_ell = b_ell$. Thus $B_I \( sigma \) equiv - y$ losing at most bounded $2$-power precision by the invariant bound, independently of that coboundary adjustment. Now
  $ y = m \( F - 1 \)^(- 1) x_ell - ell^(- 1) upright("adj") \( F - 1 \) x . $
  The first term vanishes in the limit by the margin on the determinant valuation. And $x$ agrees, up to a coboundary coordinate $\( F - 1 \) w$ at the common precision, with $B_(I - { ell }) \( Phi \)$. Such changes disappear after applying $upright("adj") \( F - 1 \)$ in the limit.
  Upon restriction of weighted corestriction to $G_(K_0)$, one obtains the sum of translates with weights. On #strong[each translate] the same calculation applies with the same local representatives: the translated lower/upper classes still have the derivative and norm identities in cohomology (all factor actions commute there by abelianness), and inertia vanishing holds. Hence after summation and limit
  #[#set math.equation(numbering: n => "(L3)")
   $ f \( Z_I \) = 0 \, #h(2em) s \( Z_I \) = upright("adj") \( tau - 1 \) f \( Z_(I - { ell }) \) quad upright("at ") ell . $ <eq:L3>]
  All congruences here concern singular evaluations with trivial coefficient inertia and finite evaluations modulo Frobenius coboundaries. They therefore carry to the cohomology maps on the limiting models, then to the DVR or test field. The verification can likewise be made at each old $ell in I$ separately to keep the pure singular conditions there.
  The line map in (L3) is a unit isomorphism over $cal(O)$ (off-diagonal $plus.minus e$). The $Z_I$ lift in cohomology over the DVR with the prescribed pure conditions: degree zero is included and degree-one coordinates have the prescribed image. In the third test their old odd-place lifts to unramified conditions before residue-field specialization are automatic by zero $H^1$ of the singular quotient over the DVR. The same facts apply using just generic fields.
  #emph[Propagation of determinant divisibility.] If in a generic test $z_(upright("sys")) eq.not 0$, there is no surplus $h > 1$ there: evaluate it and an old nonzero dual class as above at a first fresh prime; by (L3) the derivative is then nonzero transverse, contradicting local cup reciprocity with that dual class (whose finite localization there is nonzero).
  In a DVR test with the single generic line and nonzero class established, proceed successively if $h > 1$ on the fiber. At each new prime start with unramified inflation, arrange the two evaluations as above on the fiber (so also nonzero generic primal evaluation), and switch by the #strong[Line switch] comparison. This drops $h$ by one preserving generic nonvanishing of the class by (L3). The ordinary determinant valuations are exactly equal along the comparisons with the new derivatives; there is no bound lost at this DVR.
  When $h = 1$ the terminal complex is a free line in degree one up to homotopy and the terminal class is integral. Since $L_(*)$ is a unit here, backwards we obtain
  #[#set math.equation(numbering: n => "(L4)")
   $ d \( C_(upright("old")) \, z_(upright("sys")) \) med gt.eq med 0 . $ <eq:L4>]
  Here $C_(upright("old"))$ is the initial ordinary problem in the switch sequence, with the degree-one lift when unramified conditions are imposed. The clearing factor $L_(*)$ is a fixed power of two up to a unit, and is a unit at each DVR used here. Consequently the equality of determinant valuations in the switches gives exactly (L4). ◻
]

#thm([Corollary 5.5.])[
  (Generic nonvanishing and the first divisibilities).  #emph[The positive complex has only degree-one generic cohomology, of dimension two, and $a and z eq.not 0$. The coordinate $U$ has nonnegative order at every height-one prime outside the fixed factors $2 Delta product_(q in S_f \, thin q eq.not 2) D_q P_q$.]
] <cor:positive-determinant:generic>

#proof[
  Apply first the fixed-support $t$-test with square order and $z_(upright("sys")) = z$ there. Its ordinary class is generically nonzero: otherwise a nonzero bounded series annihilates it and it specializes to zero rationally off finitely many finite-order characters. This contradicts (K4) and cyclotomic twist nonvanishing [50], in the form of [30] Theorem 13.5(2), at high characters, including with the fixed quadratic twist when in use. Thus the test gives $h = 1$ generically.
  Now specialize the $B$-diagram at $u_j = 0$ for all $j$, retaining generic $t$. The moving places have unramified action there and acyclic singular quotient (cyclotomic Frobenius scalar tends to 1, residue sizes tend to 1 and $det \( 1 - g_j \) eq.not 0$). Inflation thus compares isomorphically with the fixed-support problem. Moreover the augmented ordinary square class is that from fixed support times nonzero limiting Euler factors: apply the fresh good norms removing the $r_(j \, i)$ sequentially at trivial tame weight, with bounded torsion clearing as above; $chi_h$ if used is split there, and the factors tend to $2 - "tr" g_j$.
  Hence there is a single ordinary line with nonzero class on this specialized generic line. By deformation, or using also the positive concentration at $B_(\( 2 \))$, we have generically on full $B$ just the two-dimensional degree one in $C^(+)$, with $a and z eq.not 0$ (the specialized generic $t$-test has these same dimensions). This holds also for analytically unknown center.
  The first, $B$-DVR test now gives (L4) for the ordinary full complex there, hence nonnegative order for (L1) away from $\( 2 \)$ and the indicated fixed factors. ◻
]

=== 5.4 Removal of the fixed divisors <subsec:positive-determinant:division>

#thm([Lemma 5.6.])[
  (Division at the fixed factors).  #emph[The coordinate $U$ has nonnegative order at every horizontal height-one prime dividing $Delta product_(q in S_f \, thin q eq.not 2) D_q P_q$.]
] <lem:positive-determinant:division>

#proof[
  #emph[Finite-character tests.]
  Represent $U = g_0 \/ f_0$ with integral series $f_0 \, g_0$, $f_0 eq.not 0$, by determinant pivot formulas from the positive diagram, incorporating the factors of (L1). Retain their stage expressions $g_(0 \, i) \, f_(0 \, i)$ before passage from the actual $t$-towers with finite tame orders. These use the integral smoothed lifts and basis choices; they compute the indicated rational coordinate when the pivots work with the same ranks.
  Test at $u_j = eta_j - 1$ for finite $2$-power roots $eta_j eq.not 1$, requiring $f_0 \( dot.op \, bold(eta) - 1 \) eq.not 0$ and dual nonexceptionality on the Frobenius lift at 2 as in the third switching test. The latter is a nonidentical vanishing avoidance condition by the nonzero limiting tame-scalar exponent vector there. These tests still detect nonzero bounded series conditions on the tame variables by iterated one-variable Weierstrass. At each such test we have all the required finite characters and 2-local constant-scalar agreement at sufficiently precise original stages on the filter.
  #emph[A rectangular system with the primitive odd factors.] Fix one such stage for the third test. To retain the precise primitive odd factors use (K1), (K4) in the #strong[rectangular] first-row-unfilled case. Take $b = N_(upright("odd"))$ and $M$ supported only at 2 and the odd ramified places of the constant field weight (all active variable conductors and any active fixed quadratic ramification). These are coprime to $b$; use sufficiently high $2$-part and a true $2$-power tower. Choose $A = 2^k \, xi$ with $delta_xi \( a \) eq.not 0$ as in Lemma 25.
  At any given height-one $frak(q)$ of $Lambda_eta$ not over 2, take smoothing $c' \, d'$ whose factors $Delta'$ are units there. Indeed $t$ at such a divisor can be realized at an algebraic point of the open unit disk by preparation. Take a CRT sequence tending dyadically to 1, congruent to 1 on required fixed symbol orders, respecting coprimalities and realizing a fixed nontrivial constant weight on an active variable conductor (values trivial on all others and any fixed quadratic factor). This uses the disjointness of the active variable conductors from those fixed levels. The $t$-scalar tends to 1; thus the vanishing equation in the smoothing is avoided.
  Keep the choices fixed while switching. Write $z'$ for this system. It has no extra odd imprimitive losses at the base finite cyclotomic characters: (K4) gives the law with $L^(\( 2 \))$ since all omitted odd places are at ramified scalar characters of good-$f$ primes. In particular its generic class is nonzero by the same cyclotomic nonvanishing theorem. The rectangular good Euler norm is exactly of the requisite kind. Thus generic single-line concentration for the unramified-old-odd problem, and (L4) with $z'$ at $frak(q)$, follow by the third switching test. The same generic concentration holds on relaxing to full, since old odd singular quotient differentials have nonzero determinants.
  #emph[Comparison of the two classes.] In this common generic full cohomology line the original square system differs from $z'$ by
  $ frac(Delta thin product_(q in S_f \, med q eq.not 2) P_q, Delta') $
  times a nonzero constant, using the stage specializations for these factors. Indeed evaluate at infinitely many high $t$-characters with central nonvanishing, using (K4) in the #strong[same] representation with compatible weighted realizations; any geometric quadratic identification is common. The two exponential coordinates have precisely the displayed ratio times the fixed symbol ratio, up to signs. Odd omissions at the active variable conductors make no change. Generic ratios specialize in ordinary cohomology off at most finitely many such values, by clearing denominators, so the identity follows by one-variable Weierstrass (one can square to ignore signs). In particular the square raw coordinate uses a single generic ordinary line also on the tested stages.
  On relaxation from the unramified-old-odd complex to full, determinant valuation changes for $z'$ by the sum of $d \( Q_q \, 1 \) = - v_(frak(q)) \( D_(q \, eta) \)$ for those singular quotients. These determinants are 1 at active variable conductors, and are precisely the specialized stage $D_q$’s at fixed odd places.
  Consequently (L4), the ratio comparison, and the ordinary real basis give
  $ frac(g_(0 \, i) \( dot.op \, bold(eta) - 1 \), f_(0 \, i) \( dot.op \, bold(eta) - 1 \)) med in med bb(Z)_2 \[ eta \] \[ \[ t \] \] \[ 1 \/ 2 \] . $
  Here we use all the horizontal height-one primes, allowing $z'$ or its smoothing choices to vary among them. On large stages the chosen pivots indeed have nonzero denominator generically on the test, by coefficientwise convergence and $f_0 \( dot.op \, bold(eta) - 1 \) eq.not 0$, and ranks agree as just proved. No bound on a comparison constant or uniform $2$-denominator is being asserted, and this step uses no separate primitive-form characteristic-ideal divisibility theorem.
  #emph[Integral Weierstrass division.] The remaining possible prime divisors of poles divide $Delta \, D_q \, P_q$ at fixed odd corrections (or the smoothing alone); every such factor is regular in $t$ over $bb(Z)_2 \[ \[ upright(bold(u)) \] \]$ as observed after (L1).
  For each irreducible such factor $H_0$ use its distinguished representative, and $H_0^a divides f_0$ with $a = v_(H_0) \( f_0 \)$. At the above tests it stays distinguished. All its tested zeros to that multiplicity belong to $g_0 \( dot.op \, bold(eta) - 1 \)$, by the integral numerator/denominator zero-persistence test in Section 3 (convergence on smaller disks and the stage containment).
  Thus the integral division remainder of $g_0$ by $H_0^a$ in $t$ vanishes at every such test, hence identically. This rules out the remaining horizontal poles. ◻
]

#proof[
  Lemma 29 proves concentration and nonnegative order at $\( 2 \)$. Corollary 31 proves generic nonvanishing and the required divisibility away from the fixed factors, and Lemma 32 treats those factors. The ring $B$ is normal, so these height-one tests give $U in B$. Generic nonvanishing gives $U eq.not 0$. Finally, the common raw reduction of Lemma 29, the common smoothing reduction, and Lemma 28 show that the two integral reductions differ by a unit. They therefore have the same closed-point unit status, as asserted. ◻
]

=== 5.5 The central value in Selmer corank zero <subsec:positive-determinant:rank-zero>

#thm([Lemma 5.7.])[
  (Corank-zero central specialization).  #emph[For either branch $A_0$ of the construction, if $upright("an") \( A_0 \) = 0$, then the normalized determinant satisfies 
#[#set math.equation(numbering: n => "(L5)")
 $ v_2 U \( 0 \) = X \( A_0 \) . $ <eq:L5>]

 In particular $X \( A_0 \) gt.eq 0$. If only $s_2 \( A_0 \) = 0$ is known and $U$ is a unit, then $L \( A_0 \, 1 \) eq.not 0$, and hence $X \( A_0 \) = 0$.]
] <lem:positive-determinant:rank-zero>

#proof[
  #emph[Compact and discrete Selmer lattices.]
  For the central calculation first work at the actual trivial-parameter specialization at stages, for the curve of the branch, denoted temporarily by $A_0$. Put $S' = S union R_i$, $O^j = H^j \( G_(bb(Q) \, S') \, T \)$, $R_(bb(R))^j = H^j \( bb(R) \, T \)$. Suppose $s_2 \( A_0 \) = 0$, which in particular holds for analytic rank zero.
  Put $s_0 = "length" "Sha" \( A_0 \/ bb(Q) \) \[ 2^oo \] < oo$, and write $tau_g \, tau_v$ for lengths of global and finite local $2$-primary point torsion. Lengths here are over $bb(Z)_2$. The usual discrete Selmer has length $s_0$. At compact coefficients the singular quotient by Kummer of local degree one is zero at odd and real places, and at 2 it is $J_2$ free of rank one, dual to compact Kummer modulo torsion.
  With $j_2 = "length" \( J_2 \/ "im" O^1 \)$, integral Poitou–Tate gives
  $ 0 lt.eq j_2 lt.eq s_0 \, #h(2em) "length" O^2 = s_0 - j_2 + "length" R_(bb(R))^2 + sum_(v in S'_f) tau_v - tau_g . $
  Indeed the exact sequence goes from $O^1$ to the local singular quotient, the dual of discrete Selmer, $O^2$, the sum of local degree-two groups and the dual of global point torsion, ending surjectively. This uses modified real localization in Poitou–Tate (agreeing with ordinary real terms in those positive degrees), finite Kummer duality and passage to compact/discrete limits. At odd good places outside support unramified discrete $H^1$ is already zero, giving the usual Selmer.
  Also $O^0 = 0 \, med "rank" O^1 = 1 \, med "length" O_(upright("tors"))^1 = tau_g$, by the Euler and invariant formulas.
  #emph[The determinant and local volume factors.] Assume first that the analytic rank is zero. Then $z$ has nonzero singular localization by (K4); write $z$ also for its ordinary image. The positive complex with the integral real boundary basis and lift then gives raw valuation
  #[#set math.equation(numbering: n => "(5.1)")
   $ d \( C^(+) \, a and z \) & = "length" \( O^1 \/ bb(Z)_2 z \) - "length" O^2 - "length" R_(bb(R))^1 + "length" R_(bb(R))^2\
 & = v_2 \( z \, J_2 \) + 2 tau_g - s_0 - sum_(v in S'_f) tau_v - "length" R_(bb(R))^1 \, $ <eq:positive-determinant:raw-center>]
  where $v_2 \( z \, J_2 \)$ measures the singular image in that lattice. The first equality uses the long exact positive sequence through degree three: dividing degree one by the image of the real basis gives the kernel to $R_(bb(R))^1$, and positive degree three is the cokernel to $R_(bb(R))^2$. The second uses $"length" \( O^1 \/ bb(Z)_2 z \) = tau_g + v_2 \( z \, J_2 \) - j_2$.
  By the differential/log duality and Haar computation of the central lattices, for minimal $omega$, $exp^(*) z = alpha omega \, med log_omega A_0 \( bb(Q)_2 \) = 2^b bb(Z)_2$, we have $v_2 \( z \, J_2 \) = v_2 \( alpha \) + b$, and
  $ tau_2 - b = v_2 \( c_2 L_2 \( A_0 \, 1 \)^(- 1) \) \, #h(2em) tau_q = v_2 \( c_q L_q \( A_0 \, 1 \)^(- 1) \) quad \( q eq.not 2 \) . $
  The $R_(bb(R))^1$ length inserts the real component factor. Thus the trivial-parameter law of (K4) on the indicated curve ($Delta \( 0 \)$, omitted support $S'_f$, connected period, evaluation 1) gives exactly $X \( A_0 \) + v_2 Delta \( 0 \)$ for the raw valuation.
  #emph[Specialization of the limit determinant.] These ranks and the determinant calculation pass to the limit at the center. Indeed the moving finite torsion lengths stay bounded by the trace-limit conditions. The formulas above bound $O^2$, hence also positive degrees two and three; torsion in positive degree one injects into ordinary torsion. Pivots of the same ranks therefore work on the limiting specialization, allowing comparison of determinant and cycle entries there by bounded-denominator Gaussian formulas. Thus the raw valuation is unchanged in analytic rank zero, and the fixed $D_q \/ P_q$ have central ratio 1, proving (L5).
  #emph[An initially unknown analytic center.] In particular $X \( A_0 \) gt.eq 0$ in analytic rank zero. If only $s_2 \( A_0 \) = 0$ is known but $U$ is a unit, the same torsion bounds and ranks apply regardless of analytic nonvanishing. If $L \( A_0 \, 1 \) = 0$, then $z$ has trivial rational singular image by (K4), hence is ordinary torsion at the stages, so $a and z = 0$ rationally there and also at the limiting center, a contradiction (all fixed corrections and smoothing have nonzero central values). Thus $L \( A_0 \, 1 \) eq.not 0$; now (L5) applies and gives $X \( A_0 \) = 0$. ◻
]

In rank one, computing the same determinant requires a comparison of the Kato class with a regulator generator. Section 6 proves that comparison, and Section 7 applies it.

== 6 A tame horizontal logarithmic comparison <sec:tame>

We prove a first-derivative comparison in a tame character direction. Its weak form shows that the derivative vanishes when the projected Heegner trace is torsion, without assuming analytic rank one. Its rank-one form then identifies the logarithm of the Kato class with the classical leading coefficient, with its exact rational normalization.

=== 6.1 The comparison and its horizontal data <the-comparison-and-its-horizontal-data>

Let $E \/ bb(Q)$ be the non-CM curve on the branch under consideration, with primitive newform $f$, conductor $N$, rational differential $omega$, and absolute primitive real Betti-cycle period $Omega_0$. Thus $E$ may be the chosen modular quotient or its indicated positive twist. The CM adaptations will be made in the CM comparison. Fix a support $S$ containing $2 \, oo$, the bad primes, and the fixed orders and smoothing data. Write $S_f$ for its finite part. We use the Kato system (K1), (K4) at symbol evaluation $1$, at this support and after adjoining one prime; supplementary primes can be removed by norm. Let $z$ be its base smoothed class in ordinary cohomology, and put

#[#set math.equation(numbering: n => "(6.1)")
 $ d_0 = plus.minus Delta \( 0 \) product_(q in S_f) L_q \( f \, 1 \)^(- 1) eq.not 0 . $ <tame:d0>]

The smoothing and omitted Euler factors in this expression are the actual ones on the branch. All signs below come from a consistent choice of orientation. We identify $T = T_2 E$ and $T^or \( 1 \)$ by the principal polarization, and use $log_omega$ on finite classes on either side.

#thm([Theorem 6.1.])[
  (Tame logarithmic comparison).  #emph[Suppose $"an" \( E \) = 1$, and let $P in E \( bb(Q) \)$ be nontorsion. Then 
#[#set math.equation(numbering: n => "(T1)")
 $ frac(log_omega z, \( log_omega P \)^2) = plus.minus d_0 thin frac(L' \( f \, 1 \), Omega_0 H \( P \)) . $ <eq:T1>]

 The complex-side quotient is rational, and is viewed in a fixed dyadic embedding. Here $H$ is the height fixed in the introduction.]
] <tame:logarithm>

The logarithm-squared relation in (T1) belongs to the framework proposed by Perrin-Riou [47] Section 3.3. Bertolini–Darmon–Venerucci prove such a relation, up to a nonzero rational factor, at odd semistable primes [3] Theorem A. The tame comparison below determines the stated dyadic normalization.

For the auxiliary construction we require only that $w \( E \) = - 1$. Choose an imaginary quadratic field $K$, of odd fundamental discriminant $- D < - 4$, split at $2 N$ and all further required fixed primes, such that

$ L \( f ⊗ epsilon \, 1 \) eq.not 0 \, #h(2em) epsilon = epsilon_K . $

The local prescriptions and nonvanishing are those of the classical twist theorem recalled above [25]. Put $O = cal(O)_K$. Choose an integral polynomial $cal(A)$ in finitely many $T_p$, with $p divides.not 2 N D$, which has eigenvalue $cal(A)_f eq.not 0$ at $f$ and kills every other eigensystem at level $N$. Include among the systems to be killed the Eisenstein types unramified away from $N$, of conductor dividing $N$, and the weight-two trivial pair. Multiplicity one and rational characteristic or minimal polynomials give such a polynomial after clearing denominators.

Choose also $ell divides.not 6 N D$, away from the operators in $cal(A)$, inert in $K$, with $a_f \( ell \) eq.not 0$. This is possible by Chebotarev and the open-image theorem: the inert condition specifies an open coset in the Tate image, on which trace is not identically zero [54]. All coefficient tests below use a fixed finite collection of indices prime to $N D$, with odd $ell$-valuation, and powers of one moving prime $r = r_i$.

#prodef([Definition 6.2.])[
  (Horizontal data).  A horizontal sequence consists of primes $r_i$, integers $m_i arrow.r oo$, and even surjective residue exponents
  $ lambda_i : \( bb(Z) \/ r_i \)^times arrow.r bb(Z) \/ 2^(m_i) \, $
  with the following properties. The primes avoid the fixed data, $r_i equiv 1 med \( mod med N D \)$, $r_i arrow.r 1$ dyadically, and $r_i$ splits in the Hilbert class field of $K$ and in any fixed twisting field in use. The characters kill every prime of $S_f$ and of the fixed smoothing integers $c \, d$, including $2$. We may require them also to kill any specified finite list, in particular $3$, the primes of $D$, the tested indices and Hecke operators, and the bad primes of the fixed models and lifts below. Chosen arithmetic Frobenius lifts converge in the Tate representation to a determinant-one element with trace $a_(*) eq.not plus.minus 2$ and with two eigenvalues that are not roots of unity.
  As a global character, $lambda_i$ has value $lambda_i \( q \)$ on a uniformizer at $q eq.not r_i$, is zero at infinity, and is the negative residue character at $r_i$, with uniformizer value zero. Characters over extensions are obtained by norm.
] <tame:data>

We use the simultaneous Artin limits of the arithmetic diagram conventions, and write $t = 1 + u$ in this section. At a character evaluation, $chi \( x \) = t^(lambda_i \( x \))$. Let $z_i$ be the Kato classes with coefficients in $bb(Z)_2 \[ t \] \/ \( t^(2^(m_i)) - 1 \)$, on the Tate dual with the scalar action, or its inverse, as prescribed by orientation. Their local coefficients at $2$ are split, since $lambda_i \( 2 \) = 0$. Let $Z_i \( t \)$ denote the polynomial of dual-exponential coordinates relative to $omega$. Invert the variable if necessary so that

#[#set math.equation(numbering: n => "(6.2)")
 $ z_i \( 1 \) & = e_r z \, #h(2em) e_r = 1 - a_f \( r \) \/ r + 1 \/ r \,\
Z_i \( t \) & = d_0 thin L \( f \, macron(chi) \, 1 \) \/ Omega_0 #h(2em) \( "ord" chi > 2 \) . $ <tame:reciprocity>]

The first equality is rational in cohomology. These are the good-prime norm relation and (K4) at square order, with unnormalized weights. There is no omitted $r$-factor at the displayed primitive characters. The positive quadratic realization, if present, uses the same relations because $r$ splits in that fixed field. The sign from (K3)–(K5) is common at each stage; fix it in $d_0$ in the limit. Ordinary local coordinates apply coefficient by coefficient, so these classes and scalar polynomials have bounded denominators. We have $Z_i \( 1 \) = 0$, and denote the limiting linear coefficient by $Z'$.

Let $P_X in J_0 \( N \) \( K \)$ be the single Hilbert-class trace based at $oo$, with the oriented ideal $frak(n)$ of norm $N$ used in (GZ). Fix a rational modular parametrization $phi.alt : X_0 \( N \) arrow.r E$, of degree $delta$, and put

$ Q_X = phi.alt_(*) P_X \, #h(2em) C = frac(sqrt(D), 8 pi^2 \( f \, f \)_N) . $

The Petersson integral here is unnormalized.

#thm([Proposition 6.3.])[
  (Spectral-height comparison).  #emph[For the horizontal data of Definition 35, and the tame height defined below, one has 
#[#set math.equation(numbering: n => "(6.3)")
 $ C Omega_0 L \( f ⊗ epsilon \, 1 \) Z' / d_0 = plus.minus \( 2 - a_(*) \) thin frac(h_lambda^K \( Q_X \, Q_X \), delta) . $ <tame:spectral-identity>]

 This assertion requires the odd functional sign and the nonzero companion value, but does not assume $"an" \( E \) = 1$ or that $E \( bb(Q) \)$ spans the rational Selmer group. In particular, if $Q_X$ is torsion, then $Z' = 0$.]
] <tame:spectral>

We construct the directions and heights first. The analytic and intersection calculations then prove Proposition 36. Only afterward will we use analytic rank one to deduce Theorem 34.

=== 6.2 Directions, biextensions, and cup reciprocity <directions-biextensions-and-cup-reciprocity>

We first isolate the choice of a character direction from its height interpretation. The group-theoretic input is a nonzero cohomology class and a primitive for its polarized self-cup. This also permits the same choice when the class is not known to come from a rational point.

#thm([Lemma 6.4.])[
  (A direction detecting a self-cup primitive).  #emph[Let $V = T_2 E ⊗ bb(Q)_2$, and let $x in Z^1 \( G_(bb(Q) \, S) \, V \)$ represent a nonzero class. Let $beta$ be a cocycle on the Tate dual representing $"pol" \( \[ x \] \)$, and suppose that a continuous cochain $k in C^1 \( G_(bb(Q) \, S) \, bb(Q)_2 \( 1 \) \)$ satisfies 
$ d k = - beta union x . $

 Fix a finite normal extension $F \/ bb(Q)$ enforcing the splitting and congruence conditions of Definition 35, including the Hilbert class field of $K$, the fixed twisting data, and $E \[ 2 \]$. Let $cal(P)$ be a finite list of rational primes containing the fixed support to be killed, and put 
$ L = F #scale(x: 120%, y: 120%)[\(] mu_(2^oo) \, thin q^(1 \/ 2^n) : q in cal(P) \, med n gt.eq 1 #scale(x: 120%, y: 120%)[\)] . $

 There is $g in G_L$ whose Tate action $g_T$ has determinant one, trace $a_(*) eq.not plus.minus 2$, and non-root-of-unity eigenvalues, such that 
#[#set math.equation(numbering: n => "(6.4)")
 $ eta = k \( g \) - beta \( g \) g_T \( g_T - 1 \)^(- 1) x \( g \) eq.not 0 . $ <tame:eta>]

 The horizontal data can be chosen with Frobenius lifts converging to $g$ on these cochains and all fixed data, and with residue characters vanishing on $cal(P)$.]
] <tame:cochain-direction>

#proof[
  After rescaling $x \, beta$ by one common dyadic integer and $k$ by its square, compactness makes all three cochains integral. Their fixed-support condition makes them unramified at the moving primes.
  #emph[The Tate image and the additive evaluations.] The quotient defining $L \/ F$ has bounded derived length. The open-image theorem and iterated closed commutators therefore leave a deep subgroup of $upright("SL")_2 \( bb(Z)_2 \)$ in the image of $G_L$: the corresponding iterated Lie brackets contain $frak(s l)_2$.
  Restriction of $\[ x \]$ to $G_F$ is nonzero, since restriction followed by corestriction is multiplication by $\[ F : bb(Q) \]$. Its restriction to $G_(F \( T \))$ is still nonzero: otherwise it would inflate from the open Tate image, whose first cohomology on $V$ vanishes by a central homothety. On $G_(F \( T \))$ its values are additive and equivariant, so irreducibility makes their span the full Tate plane.
  The same holds on $G_(L \( T \))$. Indeed, if the restriction there were zero, those additive evaluations would factor through $"Gal" \( L \( T \) \/ F \( T \) \)$. Since $F \( T \)$ contains all dyadic roots of unity, this radical quotient has cyclotomic conjugation. A deep special-linear subgroup consequently acts trivially on that quotient, whereas it has no trivial quotient on the standard plane. This contradicts the full span just obtained. Irreducibility again makes the restricted span the full plane.
  #emph[The scalar detected by the direction.] Choose $g in G_L$ with the asserted Tate action, for example in a deep split torus. On the joint Tate kernel coboundaries vanish, so $beta$ agrees with $"pol" \( x \)$. The cochain identity gives, up to the fixed sign,
  $ k \( h_1 h_2 \) = k \( h_1 \) + k \( h_2 \) + chevron.l x \( h_1 \) \, x \( h_2 \) chevron.r . $
  A commutator there has $x = beta = 0$ and $k$-value $plus.minus 2 chevron.l x \( h_1 \) \, x \( h_2 \) chevron.r$. The full span supplies a nonzero such value. Multiplying $g$ by this commutator changes $eta$ without changing its Tate action or its $x \, beta$ values. This gives (6.4). Only nonvanishing is used; the factor $2$ is retained.
  #emph[Frobenius and residue characters.] Chebotarev gives primes $r_i$ and Frobenius lifts $g_i$ approaching $g$ on all the fixed data, with roots and radicals fixed to depths sufficient for $m_i$. Choose $r_i equiv 1 med \( mod med 2^(m_i + 1) \)$. In compatible primitive-root bases define
  #[#set math.equation(numbering: n => "(6.5)")
   $ a^(\( r_i - 1 \) \/ 2^(m_i)) equiv zeta_(2^(m_i))^(lambda_i \( a \)) med \( mod med r_i \) #h(2em) \( r_i divides.not a \) . $ <tame:residue-exponent>]
  These residue exponents are surjective and define even characters. Fixing the prescribed radicals makes them vanish on $cal(P)$, and the Frobenius conditions give all the remaining horizontal data. ◻
]

#thm([Lemma 6.5.])[
  (A direction with nonzero height).  #emph[If $P in E \( bb(Q) \)$ is nontorsion, the horizontal data can be chosen so that $h_lambda^(bb(Q)) \( P \, P \) eq.not 0$.]
] <tame:direction>

#proof[
  Write $y = "pol" \( P \)$. Let $G_y$ be the Barsotti–Weil extension of $E$ by $bb(G)_m$ defined by the Poincaré biextension at $y$, and choose $B in G_y \( bb(Q) \)$ above $P$. Such a lift exists because its fiber is a line torsor over $bb(Q)$. Choose a splitting of the underlying modules $T_2 G_y = bb(Z)_2 \( 1 \) xor T$; its Galois matrix has off-diagonal block $beta \( g \) g_T$, where $beta in Z^1 \( T^or \( 1 \) \)$. This is, up to the fixed sign, the Kummer class of $y$. To see the identification integrally, at order $b$ the torsor of division points $b y' = y$ maps to the torsor of splittings by pushing out $G_(y') \[ b \]$ along the $b$-power map on the kernel. Changing $y'$ by $b$-torsion changes the splitting by its Weil pairing. These identifications commute with reduction.
  The Kummer cocycle of $B$ therefore has coordinates $\( k \, x \)$, with $x$ the Kummer class of $P$, and
  #[#set math.equation(numbering: n => "(6.6)")
   $ d k = - beta union x . $ <tame:biextension-cocycle>]
  The data and representatives are unramified outside fixed support, by good integral models and the étaleness of division by $2$ away from that support. The class of $x$ is nonzero because $P$ is nontorsion. Lemma 37 supplies horizontal data with $eta eq.not 0$. The height construction in the next lemma identifies $h_lambda^(bb(Q)) \( P \, P \) = plus.minus eta$, proving the assertion. ◻
]

#thm([Lemma 6.6.])[
  (Tame heights and trace compatibility).  #emph[Let $F' supset K$ contain the ring class field $H_(r^j)$, $j gt.eq 1$. The norm of $lambda_i$ to $F'$ is finite-unramified. On the polarized abelian varieties in use it defines a bilinear biextension height $h_i^(F')$ modulo $2^(m_i)$. After multiplying the first argument by one fixed power of $2$, there are compatible heights on $E \/ K$ and $E \/ bb(Q)$, even at the ramified character place $r_i$. Their rational limits satisfy trace compatibility and 
$ h_lambda^K \( P_1 \, P_2 \) = 2 h_lambda^(bb(Q)) \( P_1 \, P_2 \) #h(2em) \( P_1 \, P_2 in E \( bb(Q) \) \) . $

 For the data in Lemma 38, $h_lambda^(bb(Q)) \( P \, P \) = plus.minus eta$.]
] <tame:heights>

#proof[
  At either split place of $r$, a local unit whose image dies in the ring class quotient must be a diagonal congruence modulo $r^j$, up to the global units ${ plus.minus 1 }$. This follows directly from the idele description for the order $bb(Z) + r^j O$. Local Artin reciprocity and norm show that the even character becomes unramified over $H_(r^j)$, and hence over $F'$. It was already unramified elsewhere. Bad reduction and fixed model primes have character zero.
  Choose any rational lift in the Poincaré biextension at the two arguments, with polarization on the second. Sum the local character valuations of this lift relative to the rigidified integral fibers at good places. Reciprocity makes the sum independent of the lift. The two integral biextension laws give bilinearity and adjoint compatibilities. On a relative Jacobian, degree-zero horizontal divisors with disjoint generic support compute this valuation, up to the common sign, by their intersection lengths. Indeed the Poincaré line under self-duality is the Deligne pairing, or its inverse according to orientation, and the change of its symbol lattice is exactly the intersection. Adding a whole vertical fiber has zero pairing with a degree-zero divisor. Only models outside the fixed killed support are needed.
  For the downstairs heights, observe that
  $ \# E \( bb(F)_(r_i) \) = r_i + 1 - a_f \( r_i \) arrow.r 2 - a_(*) eq.not 0 . $
  Its two-adic valuation is bounded. Choose $2^b$ which removes all these finite two-primary parts, so the scaled first argument $X$ lies in the uniquely $2$-divisible factor of the local points. For a lift $cal(B)$ at $\( X \, Y \)$, use at $r_i$ the character of the scalar
  $ cal(B) \/ \( \[ 2^(m_i) \]_1 cal(B)' \) \, $
  where $cal(B)'$ is any lift at $\( \[ 2^(m_i) \]^(- 1) X \, Y \)$, and division is in that factor. The biextension law makes this independent of the choice and bilinear modulo $2^(m_i)$. If the normed character becomes unramified in an extension, compare with integral lifts to recover the valuation definition there. Division in the first argument can be performed downstairs; norming the lifts and scalar ratios, using the second biextension law, proves compatibility with trace in the second argument. At other places this is integral trace compatibility. Taking limits and dividing by $2^b$ defines the rational heights. The field degree gives the stated factor $2$ on rational arguments.
  For the final assertion choose the fixed lift $B$ above $P$, scaled in the first direction. It is integral away from killed places, so only $r_i$ contributes. Put
  $ w_i = \( g_(i \, T) - 1 \)^(- 1) x \( g_i \) . $
  Unramifiedness gives $d w_i = x$ locally; enlarge $b$ so $2^b w_i$ is integral for every $i$. Subtracting the coboundary of $\( 0 \, 2^b w_i \)$ from the Kummer cocycle of $B$ produces invariant division points of the scaled first argument, in its uniquely divisible factor. Its remaining fiber coordinate is the unramified cocycle $2^b \( k - beta union w_i \)$. More concretely, a corrected division point differs from any rational lift above the divided base point by a root of the scalar ratio defining the height. Its Frobenius value in the root basis of (6.5) is precisely the residue character, up to the fixed sign; the valuation part of unramified Kummer is divisible by the root order. Passing to the limit and dividing by $2^b$ gives $h_lambda^(bb(Q)) \( P \, P \) = plus.minus eta$. ◻
]

#thm([Lemma 6.7.])[
  (Cup reciprocity in analytic rank one).  #emph[If $"an" \( E \) = 1$ and $P in E \( bb(Q) \)$ is nontorsion, then 
#[#set math.equation(numbering: n => "(T2)")
 $ Z' log_omega P = plus.minus \( 2 - a_(*) \) frac(log_omega z, log_omega P) h_lambda^(bb(Q)) \( P \, P \) . $ <eq:T2>]

]
] <tame:cup>

#proof[
  In analytic rank one, the classical theorem gives rational rank one and finite $"Sha"$. The base dual exponential of $z$ is zero by (K4). At odd finite places the rational $H^1$ of the Tate coefficients is zero, by vanishing of invariants and dual invariants and the local Euler characteristic. Thus $z$ lies in the rational Selmer line. Also $log_omega P eq.not 0$, since the kernel of the local logarithm consists of torsion.
  Work modulo $2^(m_i)$ and $u^2$, and write a cocycle for $z_i$ as $z_0 + u z_1$. Then
  $ d z_1 = - lambda_i union z_0 . $
  Use the opposite sign throughout for the inverse scalar action. After one fixed common multiplier, the rational norm relation and Selmer line allow a coboundary adjustment with
  $ z_0 = alpha_i beta \, #h(2em) alpha_i = plus.minus e_r thin frac(log_omega z, log_omega P) . $
  The integral $H^1$-torsion in this adjustment has bounded exponent by global torsion finiteness. Suppressing that common multiplier, the root-coefficient two-cocycle
  $ z_1 union x + alpha_i lambda_i union k $
  is closed by (6.6). Its local invariant at $2$ tends to $Z' log_omega P$, by logarithm–dual-exponential local duality. Here localization has split ordinary group coefficients before differentiation, so all pairings are made on ordinary lifts with only fixed denominators. At the other fixed places the character is zero and the residual contribution has bounded torsion order; away from the support and $r_i$, the cup is unramified.
  At $r_i$, the trivialization $d w_i = x$ replaces this cocycle in cohomology by $alpha_i lambda_i union \( k - beta union w_i \)$. Local cup reciprocity identifies its invariant, up to sign, with $alpha_i$ times the fiber character computed in Lemma 39. Global reciprocity, followed by the limit and $e_r arrow.r 2 - a_(*)$, proves (T2). ◻
]

=== 6.3 The holomorphic kernel <the-holomorphic-kernel>

The height and cup constructions are now in place. To prove Proposition 36, we compare the two sides of its identity through Fourier coefficients of a weight-two modular form. Its projection to the $f$-component will give the product involving $Z'$; its character derivative will give a weighted intersection of Heegner divisors. The restriction to indices with odd valuation at the inert prime $ell$ will make those divisors disjoint.

Choose a real primitive period $Omega_(upright("tw"))$ for $E^(- D)$, with a rational differential. We will compare complex identities in a dyadic embedding using

#[#set math.equation(numbering: n => "(6.7)")
 $ C Omega_0 Omega_(upright("tw")) in bb(Q)^times \, #h(2em) L \( f ⊗ epsilon \, 1 \) \/ Omega_(upright("tw")) in bb(Q)^times . $ <tame:period-rationality>]

The second assertion is modular-symbol rationality. For the first, the complex integral of $\| omega and macron(omega) \|$ is a rational multiple of $Omega_0$ times the primitive absolute anti-invariant period. If $phi.alt^(*) omega = c_phi.alt f thin d q \/ q$, then this integral is $8 pi^2 c_phi.alt^2 \( f \, f \)_N \/ delta$, with $c_phi.alt in bb(Q)^times$. The negative-twist period is a rational multiple of the anti-invariant period divided by $sqrt(D)$. These facts give (6.7).

Choose integral ideals $C_0$, prime to $D$, representing $"Pic" \( O \)$. Put $a_C = upright(N) C_0$ and $Q_C \( x \) = upright(N) x \/ a_C$, and define

#[#set math.equation(numbering: n => "(6.8)")
 $ theta \( z \) = 1 / 2 sum_(C_0) sum_(x in C_0) e \( Q_C \( x \) z \) \, #h(2em) e \( w \) = exp \( 2 pi i w \) . $ <tame:theta>]

This weight-one form on $Gamma_0 \( D \)$ has character $epsilon$ and positive coefficients $rho \( n \) = sum_(d divides n) epsilon \( d \)$. The factor $1 \/ 2$ removes the two generators of a principal ideal; our restriction $- D < - 4$ ensures there are no additional units. For $"ord" chi > 2$, let $theta_chi$ be its Fourier twist, of character $epsilon chi^2$, and set

#[#set math.equation(numbering: n => "(6.9)")
 $ E_(chi \, s) \( z \) & = 1 / 2 sum_(\( c_1 \, d_1 \) eq.not \( 0 \, 0 \)\
N D divides c_1) epsilon \( d_1 \) macron(chi)^2 \( c_1 \) frac("Im" \( z \)^s, \( c_1 z + d_1 \) \| c_1 z + d_1 \|^(2 s)) \,\
I_chi & = frac(sqrt(D), 2 pi) "Tr"_(N D r^2 \/ N r^2) \( theta_chi E_(chi \, s) \)\|_(s = 0) . $ <tame:kernel>]

The row letters $c_1 \, d_1$ here have no connection to the smoothing integers. The trace is the unnormalized modular-form trace.

#thm([Lemma 6.8.])[
  #emph[The continuation in (6.9) at $s = 0$ is a holomorphic weight-two form of level $N r^2$, with trivial character.]
] <tame:holomorphic>

#proof[
  Begin with the row sum in its domain of absolute convergence. Row transformation gives the character opposite to that of $theta_chi$. At every integral cusp transform, the row weights are periodic and odd under simultaneous change of sign. The $c_1 = 0$ sum is regular at $s = 0$ by oddness and Dirichlet continuation. For $c_1 > 0$, combine the two signs and apply Poisson summation to the second variable.
  The zero frequency is a periodic Dirichlet sum at $2 s$, times $y^(- s)$ and an integral factor regular at zero; the odd part of that integral cancels. At a nonzero frequency the relevant transform is that of
  $ \( u_0 + i c_1 y \)^(- 1) \| u_0 + i c_1 y \|^(- 2 s) . $
  After rescaling, shift to the lines $"Im" \( u_0 \/ \( c_1 y \) \) = plus.minus 1 \/ 2$ and integrate by parts. The differentiated tails are absolutely convergent and give exponential decay in $c_1 y$ times the absolute frequency, uniformly near $s = 0$. At zero only positive frequencies survive, by the pole in the lower half-plane. The resulting constants and positive modes are holomorphic. This reasoning also justifies continuation against cusp tests, as required in the unfolding below. ◻
]

=== 6.4 The partial trace at the discriminant primes <the-partial-trace-at-the-discriminant-primes>

We will express the coefficient of $q^(n r_i^h)$ in $I_chi$ as the group polynomial $D_(i \, h) \( n \)$ in the following lemma. We compute these coefficients at

$ m = n r^h \, #h(2em) h gt.eq 1 \, quad r divides.not n \, quad \( n \, N D \) = 1 \, quad v_ell \( n \) med upright("odd") . $

The finite list of $n$’s includes those generated by applying $cal(A)$ at $n = ell$. For a rational prime $p divides D$, put

$ epsilon.alt_p \( a \) = \( a \/ p \) \, #h(2em) tau_p = sum_(a med mod med p) epsilon.alt_p \( a \) e \( a \/ p \) . $

Thus $epsilon.alt_p$ is a residue symbol, distinguished below from the local norm character $epsilon_(K \, p)$.

#thm([Lemma 6.9.])[
  (The traced coefficient).  #emph[At the indicated character evaluation, the coefficient of $q^(n r^h)$ in $I_chi$ is 
#[#set math.equation(numbering: n => "(6.10)")
 $ D_(i \, h) \( n \) & = 1 / 2 sum_(C_0 \, med y_0 in C_0 \, med b > 0\
a = upright(N) y_0 \/ a_C > 0\
a + N b = n r^h D) med sum_(k l = b\
gcd \( k \, l \, D \) = 1) W \( k \) chi \( a \/ D \) macron(chi)^2 \( N k \) \,\
W \( k \) & = product_(p divides D\
p divides k) epsilon.alt_p \( l \) product_(p divides D\
p divides.not k) epsilon.alt_p \( - a_C N k \) . $ <tame:coefficient-formula>]

 Only terms with $a$ a unit at $r$ occur. Its linear coefficient is the same masked sum with the character factor replaced by $- 2 lambda_i \( k \)$.]
] <tame:coefficient>

#proof[
  #emph[The local theta transform.] The dual of the lattice $\( C_0 \, Q_C \)$ is $\( 1 \/ sqrt(- D) \) C_0$. For $p divides D$, write $d = D \/ p$. The $p$-primary discriminant subgroup is represented by $x = d y \/ sqrt(- D)$, $y in C_0$. Since $C_0$ is prime to $p$, conjugation is the identity on its residue field, and $upright(N) y equiv t^2 med \( mod med p \)$ for the residue $t$ of $y$. Its quadratic form is therefore
  $ Q_C \( x \) = frac(d thin upright(N) y, p a_C) \, #h(2em) q_p t^2 \/ p \, quad q_p equiv d \/ a_C med \( mod med p \) . $
  The square class of $q_p$ is that of $\( a_C d \)^(- 1)$.
  Let $S_0 = mat(delim: "(", 0, - 1; 1, 0)$ and $T_0 = mat(delim: "(", 1, 1; 0, 1)$. Choose $a equiv - 1 med \( mod med p \)$ and $a equiv 0 med \( mod med \( D \/ p \) N r^2 \)$. The word $T_0^a S_0 T_0^a S_0^(- 1) T_0^a$ is $S_0$ modulo $p$ and identity on the other components. The finite theta transform has
  $ T_(x \, y) = delta_(x \, y) zeta^(q_p x^2) \, #h(2em) F_s \( x \, y \) = p^(- 1 \/ 2) zeta^(s 2 q_p x y) \, #h(2em) zeta = e \( 1 \/ p \) \, med s = plus.minus 1 . $
  The scalar in the $S_0$-operator cancels against its inverse. Thus the word on this component is $T^(- 1) F_s T^(- 1) F_(- s) T^(- 1)$, whose $\( x \, z \)$-entry is
  $ 1 / p sum_y zeta^(- q_p \( x^2 + y^2 + z^2 \) + s 2 q_p y \( x - z \)) = 1 / p sum_y zeta^(- q_p y^2) zeta^(- 2 q_p x z) . $
  Completing the square proves the equality. In particular its zero row and zero column are constant. Counting squares in $bb(F)_p$ gives the exact scalar
  #[#set math.equation(numbering: n => "(6.11)")
   $ kappa_p = 1 / p sum_y e \( - q_p y^2 \/ p \) = p^(- 1) tau_p epsilon.alt_p \( - a_C D \/ p \) . $ <tame:kappa>]
  The other primary components are unchanged. Hence the partial $S_0$-branch replaces the local lattice by $frak(p)^(- 1) C_0$, with scalar $kappa_p$.
  #emph[Trace representatives and character weights.] For a subset $J$ of the primes dividing $D$, put $D_J = product_(p in J) p$, $D_I = D \/ D_J$. The partial words just constructed give a representative $gamma_J in Gamma_0 \( N r^2 \)$ which is $S_0$ at the primes of $J$ and identity at the others. Its branch of the trace has representatives $gamma_J T_0^j$, where $j$ runs through the residues modulo $D_J$ and is zero modulo $D_I$. The product has Fourier denominators dividing $D_J$. Summing these translations therefore kills nonintegral indices and multiplies an integral index $m$ by $D_J$. This is one factor $p$ for each partial branch.
  To track the Fourier twist, write $gamma = mat(delim: "(", A, B; C_gamma, D_gamma)$, where $r^2 divides C_gamma$, and $n \( x \/ r \) = mat(delim: "(", 1, x \/ r; 0, 1)$. Direct multiplication gives
  $ n \( x \/ r \) gamma = gamma' n \( z' \/ r \) \, #h(2em) z' equiv x D_gamma A^(- 1) equiv x A^(- 2) med \( mod med r \) . $
  Taking $x \, z'$ divisible by $N D$ makes $gamma'$ integral and $gamma' equiv gamma med \( mod med D \)$. Thus $gamma' gamma^(- 1) in Gamma \( D \)$ acts trivially on the untwisted theta form. Expressing $theta_chi$ by translates weighted by $macron(chi) \( x \) \/ tau \( macron(chi) \)$, the coefficient of index $U in D^(- 1) bb(Z)$ is consequently multiplied by
  $ tau \( macron(chi) \)^(- 1) sum_(x med mod med r) macron(chi) \( x \) e \( U z' \/ r \) = chi \( U \) chi \( A^(- 2) \) . $
  The representatives divisible by $D$ make this finite sum unambiguous for the fractional index. Characters are extended by zero.
  For the Eisenstein rows, old and new coordinates satisfy $\( c_0 \, d_0 \) = \( c_1 \, d_1 \) gamma^(- 1)$, so $c_0 equiv c_1 A^(- 1) med \( mod med r \)$. The factor $macron(chi)^2 \( c_0 \) = macron(chi)^2 \( c_1 \) chi^2 \( A \)$ cancels the extra theta factor. We retain $chi \( U \) macron(chi)^2 \( c_1 \)$. At an identity prime $p divides D$, the row has $p divides c_1$ and weight $epsilon.alt_p \( d_1 \)$. At a partial $S_0$-prime it has $p divides d_1$ and weight $epsilon.alt_p \( c_1 \)$. Also $N divides c_1$.
  #emph[Poisson summation and its scalar.] For $c_1 > 0$, a positive frequency has $V = c_1 l \/ D$, $l > 0$. Poisson summation at $s = 0$ gives $- 2 pi i \/ D$ times the positive finite Fourier transform. Indeed the transform of $\( c_1 z + u_0 \)^(- 1)$, closed clockwise in the lower half-plane, is $- 2 pi i thin e \( c_1 l z \/ D \)$. CRT evaluates the finite transform as
  $ product_(p divides D\
p in.not J) tau_p epsilon.alt_p \( \( D \/ p \) l \) product_(p in J) epsilon.alt_p \( c_1 \) . $
  Multiplying by $D_J product_(p in J) kappa_p$, and by $sqrt(D) \/ \( 2 pi \)$, leaves
  $ frac(- i, sqrt(D)) (product_(p divides D) tau_p epsilon.alt_p \( D \/ p \)) product_(p divides D\
p in.not J) epsilon.alt_p \( l \) product_(p in J) epsilon.alt_p \( - a_C c_1 \) . $
  Here the local cancellation is
  $ frac(p kappa_p, tau_p epsilon.alt_p \( D \/ p \)) epsilon.alt_p \( c_1 \) = epsilon.alt_p \( - a_C c_1 \) . $
  The parenthesized product is the primitive Gauss sum $i sqrt(D)$ of $epsilon$, since $D equiv 3 med \( mod med 4 \)$. Thus the common scalar is exactly one.
  #emph[The lattice restrictions.] Put $y_0 = sqrt(- D) thin x$, $a = D U = upright(N) y_0 \/ a_C$, $c_1 = N k$, and $b = k l$. Then $a + N b = m D$. The zero frequency $V = 0$ contributes nothing: the index $m$ cannot be a theta norm because its $ell$-valuation is odd. Also $a = 0$ would imply $N divides m D$, impossible since $\( m \, N D \) = 1$ and $N > 1$. At an identity prime, $p divides k$; the relation forces $p divides a$, which is exactly the extra theta condition $y_0 in frak(p) C_0$. The Fourier factor requires $p divides.not l$. At a partial prime, $p divides.not k$, while $l$ is unrestricted. Thus $J = { p divides D : p divides.not k }$, the restriction is $gcd \( k \, l \, D \) = 1$, and the remaining scalar is $W \( k \)$. The sole factor $1 \/ 2$ is the original theta normalization. This proves (6.10).
  Since $r divides m$, the relation $a + N b = m D$ makes $a$ a unit at $r$ exactly when $b$ is a unit. In that case $k \, l$ are both units. Thus $chi \( a \/ D \)$ gives precisely the stated mask. For a divisor pair, the ratio of the local factors of $W \( l \)$ and $W \( k \)$ is $epsilon.alt_p \( - a_C N \)$. If neither divisor is divisible by $p$, use the norm congruence $epsilon.alt_p \( - a_C N b \) = 1$ to obtain the same ratio. Hence
  $ W \( l \) = - W \( k \) \, #h(2em) epsilon \( - a_C N \) = - 1 . $
  The latter uses $epsilon \( a_C \) = 1$, since $a_C$ is an ideal norm, and $epsilon \( N \) = 1$, since the level primes split. The derivative of the character weight is $lambda_i \( U \) - 2 lambda_i \( N \) - 2 lambda_i \( k \)$. The first two terms are independent of the divisor $k$ and cancel by antisymmetry. This leaves $- 2 lambda_i \( k \)$. ◻
]

Define $B_h \( n \)$, also for $h = 0$, by the same sum without the mask, replacing its character weight by $- 2 lambda_i \( k \/ r^(v_r \( k \)) \)$. Put

$ C_h \( n \) = B_h \( n \) - B_(h - 2) \( n \) quad \( h gt.eq 1 \) \, #h(2em) B_(- 1) = 0 . $

These notations may also denote their limits. A prime on $D_h$ will mean the limiting derivative. At the working residue precision, the unmasked sum has the decomposition

$ B_h \( n \) = sum_(q eq.not r) lambda_i \( q \) B_(h \, q) \( n \) \, $

where $B_(h \, q) \( n \)$ is the same sum with weight $- 2 v_q \( k \)$. This follows by factoring $k \/ r^(v_r \( k \))$ into rational primes, and the identity passes to the limit. We will identify $- B_(h \, q)$ with a local intersection. Thus $D'_h$ is supplied by the holomorphic kernel, while $B_h$ has an intersection interpretation. The next recurrence removes the mask between them. The difference defining $C_h$ will correspond to the cyclic part $T_(r^h) - T_(r^(h - 2))$ of the Hecke correspondence, with $T_(r^(- 1)) = 0$.

#thm([Lemma 6.10.])[
  (Removal of the mask).  #emph[For $h gt.eq 2$, 
#[#set math.equation(numbering: n => "(T4)")
 $ C_(h + 1) \( n \) - 2 C_h \( n \) + C_(h - 1) \( n \) = D'_(h + 1) \( n \) + 2 D'_h \( n \) + D'_(h - 1) \( n \) . $ <eq:T4>]

]
] <tame:mask>

#proof[
  Strip the common power $r^j$ from $a \, b$, writing
  $ a = a^compose r^j \, quad b = b^compose r^j \, quad h = h_0 + j \, quad min \( v_r a^compose \, v_r b^compose \) = 0 . $
  The off-$r$ weights do not change: $r equiv 1 med \( mod med D \)$, and the two primes over $r$ are principal, so their parts can be inserted freely in $\( y_0 \) \/ C_0$. With the off-$r$ choices fixed, there are $1 + j + v_r a^compose$ allocations between the two split primes in the theta norm, and $1 + j + v_r b^compose$ allocations in the divisor pair $k l = b$. Their product gives the multiplicity in $B_h$:
  $ \( 1 + j + v_r a^compose \) \( 1 + j + v_r b^compose \) . $
  If $h_0 > 0$, both primitive entries are units; the resulting $C_h$-multiplicities, beginning at $h_0$, are $1 \, 4 \, 8 \, 12 \, dots.h$, whereas the masked derivative has multiplicity one only at $h_0$. Their second difference has the coefficients $1 \, 2 \, 1$ displayed in (T4). If $h_0 = 0$, the $C_h$-multiplicities are affine for $h gt.eq 1$, and there are no masked terms there. These contributions have zero second difference, proving the formula. ◻
]

=== 6.5 The spectral evaluation <the-spectral-evaluation>

We first compute the holomorphic side of the recurrence. Applying $cal(A)$, evaluating at $n = ell$, and taking the difference $h mapsto h + 2$ removes every component except the oldforms attached to $f$. Pairing those oldforms with the kernel expresses the result in terms of $Z'$ and the nonzero companion value.

Write $a_h = a_f \( r^h \)$, $a^(upright("pr")) = a_f \( r \)$, and

$ gamma_h = lim_i #scale(x: 120%, y: 120%)[\(] a_f \( r_i^h \) - a_f \( r_i^(h - 2) \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( h gt.eq 1 \) \, $

where $a_f \( r^(- 1) \) = 0$. These limits satisfy the determinant-one recurrence with trace $a_(*)$.

#thm([Lemma 6.11.])[
  (The projected holomorphic coefficient).  #emph[For all sufficiently large $h$, 
#[#set math.equation(numbering: n => "(T5)")
 $ #scale(x: 120%, y: 120%)[\[] cal(A) \( D'_(h + 2) - D'_h \) #scale(x: 120%, y: 120%)[\]] \( ell \) =  & cal(A)_f a_f \( ell \) frac(gamma_(h + 2) - gamma_h, \( a_(*) - 2 \) \( a_(*) + 2 \)) C Omega_0 thin Z' / d_0\
 &  dot.op \( 2 - a_(*) \) L \( f ⊗ epsilon \, 1 \) . $ <eq:T5>]

]
] <tame:spectral-coefficient>

#proof[
  #emph[Isolation of the $f$-block.] Apply $cal(A)$ by the usual Hecke formulas on coefficients, evaluate at $n = ell$, and difference by $h mapsto h + 2$. On $I_chi$ this uses $U_r^h \( U_r^2 - 1 \)$. A cuspidal representation of conductor exponent one at $r$ has the signed Steinberg eigenvalue; its complementary raises have zero eigenvalue. The displayed operator annihilates both for large $h$. Conductor exponent two has $U_r = 0$. Eisenstein series with a ramified pair at $r$ likewise have $U_r = 0$. All remaining unwanted old types, including the holomorphic special forms of the trivial pair, are killed by $cal(A)$. Thus only the $f$-block remains. Good Hecke adjoints and multiplicity one permit its coefficients to be computed by pairings against cusp tests.
  #emph[Fricke transformation and unfolding.] At level $N r^2$ use
  $ f_j = r^j f \( r^j z \) \, #h(2em) 0 lt.eq j lt.eq 2 . $
  Choose integers $d_1 \, d_2 \, d_3$ with
  $ W_r = mat(delim: "(", r d_1, d_2 \/ r; r d_3, r) \, #h(2em) d_2 \, d_3 equiv 0 med \( mod med N D \) \, quad d_3 equiv 1 med \( mod med r \) \, quad r^2 d_1 - d_2 d_3 = 1 . $
  Such choices follow from CRT. This determinant-one normalization of the exact-divisor matrix sends $f_2$ to $f$ and fixes $f_1$, by level-$N$ modularity. Use the same matrix before the trace at level $N D r^2$. The identity
  $ n \( x \/ r \) W_r = gamma' n \( z' \/ r \) \, #h(2em) z' equiv - x^(- 1) med \( mod med r \) $
  for unit $x$, with $x \, z' equiv 0 med \( mod med N D \)$ and integral $gamma' equiv 1 med \( mod med D \)$, gives
  $ theta_chi \| W_r = frac(tau \( chi \), tau \( macron(chi) \)) theta_(macron(chi)) . $
  On the Eisenstein rows, write $\( v \, w \)$ for the old coordinates. Clearing $r$ gives
  $ v' = r^2 \( v d_1 + w d_3 \) \, #h(2em) w' = v d_2 + r^2 w . $
  These are a bijection onto the rows with $N D r^2 divides v'$: the inverse formulas are
  $ v = v' - d_3 w' \, #h(2em) w = d_1 w' - d_2 v' \/ r^2 . $
  The new weights are $epsilon \( w' \) macron(chi)^2 \( w' \)$, and the scalar is $r^(1 + 2 s)$.
  Group the row greatest common divisors $b_1$, which are prime to $D r$. The primitive row sum has level $N_1 D r^2$, where $N_1 = N \/ gcd \( N \, b_1 \)$. The terms with $N_1 < N$ pair to zero by newness of $f$. This is also true against $f_1$: tracing down at the $N$-factor in either degeneracy gives the corresponding zero trace. The extra levels are coprime to $N$, so CRT separates the cosets; conjugation by $"diag" \( r \, 1 \)$ for $f_1$ is integral on those representatives and permutes the same $N$-coset data.
  The remaining gcd factor is $L^(\( N \)) \( epsilon macron(chi)^2 \, 1 + 2 s \)$. Unfold the primitive rows on $Gamma_0 \( N D r^2 \)$, counting the two signs once. The $f_1$-pairing is zero because its Fourier support is disjoint from that of $theta_(macron(chi))$. The $f$-pairing has integral factor $Gamma \( 1 + s \) \/ \( 4 pi \)^(1 + s)$ and Dirichlet series
  $ sum_(j gt.eq 1) frac(a_f \( j \) rho \( j \) macron(chi) \( j \), j^(1 + s)) . $
  The Hecke recurrences identify this series with the product of the two twisted $L$-series divided by the row gcd factor. At $p divides N$, use $epsilon \( p \) = 1$ and the degree-at-most-one primitive local polynomial; at $p divides D$ the ramified twist factor is $1$, and at $r$ both factors are $1$. Since $\( f \, f \)_(N r^2) = r \( r + 1 \) \( f \, f \)_N$, evaluation at $s = 0$ gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ frac(\( I_chi \, f_2 \)_(N r^2), \( f \, f \)_(N r^2)) & = frac(C, r + 1) frac(tau \( chi \), tau \( macron(chi) \)) L \( f \, macron(chi) \, 1 \) L \( f ⊗ epsilon \, macron(chi) \, 1 \) \,\
\( I_chi \, f_1 \)_(N r^2) & = 0 . $ <tame:old-pairings>]
  In particular the factors $sqrt(D) \/ \( 2 pi \)$, $r$, $1 \/ \( 4 pi \)$, and the level index $r \( r + 1 \)$ give exactly $C \/ \( r + 1 \)$.
  #emph[The oldform Gram matrix.] In the basis $f_0 \, f_1 \, f_2$, the normalized Gram matrix is $\( g_(\| i - j \|) \)$, where
  $ g_0 = 1 \, #h(2em) g_1 = frac(a^(upright("pr")), r + 1) \, #h(2em) r g_2 = a^(upright("pr")) g_1 - 1 . $
  These follow from norm under translation and cyclic-coset averaging, with eigenvalues for $T_r$ and $T_(r^2) - 1$. At $h gt.eq 2$, the coefficient vector after removing the $ell$-factor is $\( a_h \, r a_(h - 1) \, r^2 a_(h - 2) \)$. The recurrence $a_h = a^(upright("pr")) a_(h - 1) - r a_(h - 2)$ shows that it lies in the span of the Gram rows for $f_1 \, f_2$. The coefficient of the second of these rows is
  $ s_h = frac(r^2 a_(h - 2) - g_1 r a_(h - 1), 1 - g_1^2) . $
  The denominator has bounded dyadic valuation, since $a_(*) eq.not plus.minus 2$. Taking the limit and using the determinant-one recurrence gives
  #[#set math.equation(numbering: n => "(6.13)")
   $ lim_i frac(s_h, r_i + 1) = frac(gamma_h, \( a_(*) - 2 \) \( a_(*) + 2 \)) . $ <tame:gram-limit>]
  #emph[Interpolation at the central character.] All the factors in this old-block calculation admit polynomials with bounded denominators. The Gauss ratio is $tau \( chi \)^2 \/ r$. The Gauss polynomials have coefficients in $bb(Z)_2$: Frobenius on the $r$-th roots fixes them because $lambda_i \( 2 \) = 0$. At the trivial character each Gauss polynomial has value $- 1$, so the limiting augmentation of the ratio is $1$.
  For $L \( f \, macron(chi) \, 1 \) \/ Omega_0$ use $Z_i \/ d_0$. For $L \( f ⊗ epsilon \, macron(chi) \, 1 \) \/ Omega_(upright("tw"))$ use the even part of the $chi$-weighted additive modular-symbol sum at the units $x \/ r$, in positive Fourier Mellin convention, multiplied by $tau \( macron(chi) \) \/ r$. Before Gauss multiplication, its nontrivial value is $tau \( chi \) L \( f ⊗ epsilon \, macron(chi) \, 1 \) \/ Omega_(upright("tw"))$. At the trivial character its value is
  $ \( a^(upright("pr")) - 2 \) L \( f ⊗ epsilon \, 1 \) \/ Omega_(upright("tw")) . $
  Indeed summing the additive twists over the nonzero residues gives
  $ r sum_(r divides j) frac(a_(f ⊗ epsilon) \( j \), j) - L \( f ⊗ epsilon \, 1 \) = \( a^(upright("pr")) - 2 \) L \( f ⊗ epsilon \, 1 \) \, $
  by the Hecke recurrence and $epsilon \( r \) = 1$, with Mellin continuation understood. The fixed relative period lattices and the Manin–Drinfeld theorem bound the denominators [23]. Multiplying by the trivial Gauss value $- 1$ and letting $r arrow.r 1$ therefore gives augmentation
  $ \( 2 - a_(*) \) L \( f ⊗ epsilon \, 1 \) \/ Omega_(upright("tw")) . $
  Use (6.7) to compare all the products in the fixed dyadic embedding.
  The character identities hold outside order at most two. In the characteristic-zero cyclic group ring, evaluation at all characters is injective. Multiplying the difference of the two sides by $t^2 - 1$ also kills its evaluations at the two excluded characters, so gives a group-ring identity. The denominators of both sides are bounded, hence this identity passes to the bounded power-series limit. That ring is a domain, so its nonzero factor $t^2 - 1$ can now be canceled. Differentiating the resulting identity uses $Z_i \( 1 \) = 0$, so only the central value of the second factor is needed. Equations (6.12) and (6.13), with the difference $h mapsto h + 2$, now give exactly (T5). ◻
]

=== 6.6 The unmasked intersection calculation <the-unmasked-intersection-calculation>

We now compute the local sums $B_(h \, q) \( n \)$ in the decomposition of $B_h \( n \)$. Their weights are $- 2 v_q \( k \)$. The divisor calculation below gives their values, and Proposition 46 identifies their negatives with the corresponding intersections of the Hilbert-class divisors. Only $q divides.not 6 N D m$ need be considered: all remaining prime factors, and the finitely many bad model and fixed CM-data primes, have been killed by $lambda_i$. We may enlarge that fixed list whenever a model or ideal representative is chosen.

#thm([Lemma 6.12.])[
  (The local divisor sum).  #emph[Fix $C_0 \, y_0 \, b$ in the unmasked sum, and put $d_q = v_q \( b \)$. Its contribution with weight $- 2 v_q \( k \)$, including the factor $1 \/ 2$, is zero unless $q$ is inert, $d_q$ is odd, and $epsilon_(K \, p) \( - b N a_C \) = 1$ for every $p divides D$. In that case it is 
#[#set math.equation(numbering: n => "(T6)")
 $ - frac(1 + d_q, 2) thin rho \( b \/ q \) thin 2^(\# { p divides D : p divides b }) . $ <eq:T6>]

]
] <tame:local-divisor>

#proof[
  Since $gcd \( k \, l \, D \) = 1$, a full prime power at $p divides D$ lies on one side of the divisor pair. Put all these powers initially on $l$’s side. Then $W \( k \) = - epsilon \( k \)$. Moving $p^(d_p)$ to the other side changes the sign by
  $ epsilon.alt_p \( - b N a_C \/ p^(d_p) \) product_(s divides D\
s eq.not p) epsilon.alt_s \( p^(d_p) \) \, $
  which is the local norm sign $epsilon_(K \, p) \( - b N a_C \)$, by the product formula. At the primes $p divides D$ not dividing $b$, that sign is already positive by the norm congruence. Thus the allocations at the discriminant primes vanish unless all signs are positive, and otherwise contribute $2^(\# { p divides D : p divides b })$.
  The remaining allocations are ordinary $epsilon$-weighted divisors. For $d = d_q$, set
  $ A_q \( d \) = sum_(j = 0)^d epsilon \( q \)^j \, #h(2em) M_q \( d \) = sum_(j = 0)^d \( - 2 j \) epsilon \( q \)^j . $
  If $q$ is split, or if $q$ is inert and $d$ is even, then $M_q \( d \) = - d A_q \( d \)$. The weighted sum is therefore proportional to the undifferentiated sum, which is zero by $W \( l \) = - W \( k \)$. If $q$ is inert and $d$ is odd, then $M_q \( d \) = d + 1$; all the other local factors give $rho \( b \/ q \)$, whose $q$-factor is one. The initial minus sign and the factor $1 \/ 2$ give (T6). ◻
]

#thm([Proposition 6.13.])[
  (Intersection realization).  #emph[The negative of the local sum in Lemma 45, summed over $C_0 \, y_0 \, b$, is the intersection of the oriented Hilbert-class sum based at $oo$ with $T_m$ of the same sum based at $0$, at the places of $K$ over $q$, weighted by their residue degrees over $q$.]
] <tame:intersection>

#proof[
  The generic supports are disjoint because $v_ell \( m \)$ is odd and $ell$ is inert. The cusps are disjoint at the good model places under consideration and retain their types under the prime-to-$N$ Hecke correspondences; CM points have potentially good reduction, so there are no cusp intersections there.
  At a split good prime $q$, the endomorphism algebra of the ordinary CM reduction is $K$. A matching homomorphism would be linear or conjugate-semilinear over $K_ell$, between Tate lattices free of rank one over $O_ell$. Its degree has even $ell$-valuation, contradicting the choice of $m$. The intersection is consequently zero in this case.
  Suppose $q$ is inert. Write $cal(W) = W \( overline(bb(F))_q \)$. After omitting the killed bad definition and ramification primes of the fixed CM objects and level data, we have good lifts over $cal(W)$. Classical CM describes the Hilbert orbit, with its fixed type and orientation, by tensoring one object with ideal representatives $I$; the level subgroup is cut out by $frak(n)$.
  #emph[Coarse intersections and lifting lengths.] For each ordered pair of such objects, its intersection over $cal(W)$ is one half the sum, over degree-$m$ homomorphisms of their reductions respecting level, of the individual lifting lengths. Here is the normalization. Since $q divides.not m$, every subgroup of order $m$ in the reduction lifts uniquely, and $T_m$ uses all these subgroups with their multiplicities. After passage to a fine auxiliary level, each deformation disk is smooth with tame automorphism action, since $q gt.eq 5$. The coarse disk is the quotient by this action modulo its generic kernel ${ plus.minus 1 }$. Averaging an integral parameter with its tangent character linearizes the effective action. The tangent character is faithful: a tame kernel acting trivially on the parameter would act trivially on the disk, contrary to the generic automorphism group. The valuation of the coarse-parameter difference is therefore the sum of the framed congruence lengths over these translates. A framed congruence is exactly a lift of the specified special isomorphism. Thus counting all special isomorphisms gives division by $2$. At an inert prime the residue degree over $bb(Q)$ is $2$; this cancels that division in the weighted intersection of the proposition.
  This is the proper-intersection formula of [19] Theorem 5.1; its hypotheses hold here because $\( m \, N \) = 1$ and the inert-$ell$ norm obstruction excludes generic intersections. We retain the calculation to identify its precise weight in the present divisor sum.
  #emph[The quaternion lattice.] Let $cal(R)$ be the supersingular maximal order of the base object. Its quaternion algebra has the description
  $ cal(B) = K + K j_0 \, #h(2em) j_0 x = macron(x) j_0 \, #h(2em) j_0^2 = - c_(upright(B)) < 0 . $
  At a finite prime $s eq.not q$, choose a generator of the base Tate lattice over $O_s$. Maximality identifies $cal(R)_s$ with its full integral endomorphisms, and $j_0$ acts as $b_s$ times conjugation, with $upright(N) b_s = - c_(upright(B))$. At $q$ use the unique division maximal order; $v_q \( c_(upright(B)) \)$ is odd. The fractional ideal $frak(c)$ defined by
  $ v b_s in O_s med \( s eq.not q \) \, #h(2em) c_(upright(B)) upright(N) v in q bb(Z)_q $
  has norm $q \/ c_(upright(B))$.
  For tensor objects indexed by $I \, J_1$, the integral Hom lattice is $J_1 cal(R) I^(- 1)$, with degree $\( upright(N) I \/ upright(N) J_1 \)$ times reduced norm. The degree factor follows from the tensor inclusion isogenies of ideals of given norms, also after reduction. Count pairs by writing $J_1 = C_0 I$. For $u_0 + v j_0$ in rational Hom, put $y_0 = sqrt(- D) thin u_0$, $z_0 = sqrt(- D) thin v$. The lattice and level conditions become
  #[#set math.equation(numbering: n => "(6.14)")
   $ y_0 in C_0 \, #h(2em) z_0 in macron(frak(n)) frak(c) C_0 I \/ macron(I) \,\
y_0 + z_0 b_p thin macron(i)_p \/ i_p equiv 0 med \( mod med frak(p) \) #h(2em) \( p divides D \) \, $ <tame:quaternion-lattice>]
  where $i_p$ generates $I$ locally. To check this, away from $q$ test
  $ u_0 t + v b_s \( macron(i)_s \/ i_s \) macron(t) in C_(0 \, s) #h(2em) \( t in O_s \) . $
  At étale places the linear and antilinear conditions separate. The split level condition on $frak(n)^(- 1) O_s \/ O_s$ adds the factor $macron(frak(n))$ on the antilinear side. At an odd ramified prime, set $v_s^(*) = v b_s macron(i)_s \/ i_s$. Testing on $1 \, sqrt(- D)$ requires $u_0 + v_s^(*)$ and $sqrt(- D) \( u_0 - v_s^(*) \)$ to be integral; these are the two inverse-different conditions and the extra congruence in (6.14). Here $C_(0 \, s) = O_s$. At $q$, integrality separates because the linear and antilinear norm valuations have opposite parities.
  The degree identity is
  $ D m a_C = upright(N) y_0 + c_(upright(B)) upright(N) z_0 . $
  Set
  $ Z = \( z_0 \) \/ \( macron(frak(n)) frak(c) C_0 I \/ macron(I) \) \, #h(2em) b = q thin upright(N) Z . $
  Because $upright(N) frak(c) = q \/ c_(upright(B))$, this gives $a + N b = m D$, with $a = upright(N) y_0 \/ a_C$, exactly as in the coefficient formula. Neither component vanishes: a purely linear map violates the inert-$ell$ degree condition, whereas a purely antilinear map would force $N divides m D$.
  #emph[Genus conditions and the number of maps.] Fix $y_0 \, C_0$. For an ideal $Z$ of norm $b \/ q$, the condition that a generator $z_0$ exist is that $\[ Z macron(frak(n)) frak(c) C_0 \]$ be a square. Its norm is $b N a_C \/ c_(upright(B))$. At $p divides D$, the quaternion algebra splits, so $- c_(upright(B))$ is a local norm. After moving the ideal away from $D$ by principal scaling, Gauss genus theory identifies the square condition with
  $ epsilon_(K \, p) \( - b N a_C \) = 1 #h(2em) \( p divides D \) . $
  If soluble, there are $2^(\# { p divides D } - 1)$ classes $I$, and two generators $z_0$ for each before the congruences. At $p divides b$ the congruence in (6.14) is automatic. At the other discriminant primes the nonzero residues match up to a sign.
  These signs are jointly equidistributed. Replacing $I$ by $frak(p) I$ leaves $I \/ macron(I)$ unchanged and flips the generator-ratio sign only at $p$. Principal changes of representative transport $z_0$ by the corresponding quotient with its conjugate and preserve the test. The relation obtained by multiplying all ramified ideals is the principal ideal $\( sqrt(- D) \)$; its transport changes the generator by $sqrt(- D) \/ overline(sqrt(- D)) = - 1$. Thus that relation is absorbed by the two generator choices. Of the $2^(\# { p divides D })$ pairs, the $\# { p divides D : p divides.not b }$ nonautomatic signs leave $2^(\# { p divides D : p divides b })$ possibilities. Summing over ideals $Z$ gives
  $ 2^(\# { p divides D : p divides b }) rho \( b \/ q \) $
  homomorphisms per summand. Moreover $d_q$ is odd, since $b = q thin upright(N) Z$ and ideal norms have even valuation at an inert prime.
  #emph[The length of a lift.] Each counted homomorphism has lifting length $\( 1 + d_q \) \/ 2$. Use the Grothendieck–Messing filtration criterion and Serre–Tate theory over $cal(W) \/ q^j$, with the canonical nilpotent divided powers on $q$; here $q gt.eq 5$. The integral first crystalline cohomology splits into two unramified CM lines. Up to units, Frobenius has
  $ F \( e_1 \) = e_2 \, #h(2em) F \( e_2 \) = q e_1 \; $
  the Hodge summand is $e_2$. Source and target have the same CM type. The antilinear component interchanges the lines, say $e_1 mapsto A e_2$, $e_2 mapsto B e_1$. Commutation with Frobenius gives $v_q \( B \) = v_q \( A \) + 1$. Their sum is $d_q$, the determinant valuation of this component, so preservation of the Hodge line modulo $q^j$ is exactly
  $ j lt.eq v_q \( B \) = frac(1 + d_q, 2) . $
  Prime-to-$q$ level adds no lifting obstruction. This is also the inert lifting exponent in [19] Corollary 7.15. Combining the map count, this length, and the residue-degree cancellation gives the negative of (T6), with its stated normalization. ◻
]

=== 6.7 Geometric comparison and the logarithmic formula <geometric-comparison-and-the-logarithmic-formula>

#proof[
  By Proposition 46, $B_h \( n \)$ computes, up to the common sign, the partial character-weighted intersection away from $r$. We explain why the combinations in (T4) compute the full heights. In particular, we do not impose an unramified-character description downstairs at $r$.
  The difference $C_h \( n \) = B_h \( n \) - B_(h - 2) \( n \)$ corresponds to $T_n \( T_(r^h) - T_(r^(h - 2)) \)$ on the second divisor. Only cyclic $r^h$-paths remain: a noncyclic kernel contains full $r$-torsion and factors through multiplication by $r$. Exactly two cyclic kernels at each full CM object remain at maximal order, one on each split factor. Their Hilbert sums are both the original sum, independently of $h gt.eq 1$, including the corresponding cusp degrees. The second difference on the left of (T4) removes these terms.
  Every remaining Heegner orbit before $T_n$ has conductor a positive power $r^j$. Indeed a cyclic over-lattice that remained maximal locally would be $O_r$-stable and lie on one split factor. Ring class theory therefore places its field of definition over $K$ over $H_(r^j)$. Write the orbit with its multiplicity as a trace from such a field $F'$, including its own cusp subtraction, and pull the first divisor up by the projection formula. The $r$-intersections of these pulled-up terms are zero. Their reductions are ordinary, since $r$ is split, and both objects before $T_n$ have full order at $ell$. A matching homomorphism of degree $n$ would violate the same linear or conjugate-semilinear norm obstruction at the inert prime $ell$. The cusps also contribute nothing. We may consequently add the $r$-place intersections as zero. The character over $F'$ is now unramified, so Lemma 39 identifies the sum with $h_i^(F')$, using the normalized norm valuations in the projection formula.
  Applying $cal(A)$ to (T4) at $n = ell$ inserts $cal(A) T_ell$ between the height arguments. The prime-to-$N r$ Hecke recurrences in $n$ commute with the cyclic-path expansion already made. On the Jacobian,
  $ cal(A) T_ell = frac(cal(A)_f a_f \( ell \), delta) phi.alt^(*) phi.alt_(*) $
  rationally: $phi.alt^(*) phi.alt_(*) \/ delta$ is the orthogonal projector onto the elliptic factor. Biextension functoriality over each $F'$ projects the pairing to $E$, with this scalar; only fixed denominators are cleared. Multiply the first argument by the fixed $2^b$ of Lemma 39, and retrace the second to $K$.
  The resulting second arguments on $E$ are the indicated Hecke second differences of $Q_X$, up to bounded-order cusp torsion. Each cyclic operator has eigenvalue $a_f \( r^h \) - a_f \( r^(h - 2) \)$. After passage to the limit and the additional difference $h mapsto h + 2$, the geometric side is
  #[#set math.equation(numbering: n => "(6.15)")
   $ plus.minus cal(A)_f a_f \( ell \) \( a_(*) - 2 \) \( gamma_(h + 2) - gamma_h \) thin frac(h_lambda^K \( Q_X \, Q_X \), delta) . $ <tame:geometric-side>]
  Here the second difference uses $gamma_(h + 1) - 2 gamma_h + gamma_(h - 1) = \( a_(*) - 2 \) gamma_h$. Cusp torsion disappears in rational heights; the fixed multipliers cancel in these rational equalities.
  On the other side, apply (T5) at $h + 1 \, h \, h - 1$, with coefficients $1 \, 2 \, 1$, as required by (T4). The determinant-one recurrence now inserts the factor $a_(*) + 2$. If $alpha \, alpha^(- 1)$ are the limiting eigenvalues, then $gamma_h = alpha^h + alpha^(- h)$. Their distinct non-root-of-unity property ensures that $gamma_(h + 2) - gamma_h eq.not 0$ for a sufficiently large $h$. Cancel this quantity and $cal(A)_f a_f \( ell \) eq.not 0$. The remaining scalar
  $ frac(\( a_(*) + 2 \) \( 2 - a_(*) \), \( a_(*) - 2 \) \( a_(*) + 2 \)) = - 1 $
  on the holomorphic side gives exactly (6.3). If $Q_X$ is torsion its rational height is zero, while $C Omega_0 L \( f ⊗ epsilon \, 1 \) eq.not 0$; hence $Z' = 0$. No rational spanning assertion has entered this proof. ◻
]

#prodef([Remark 6.14.])[
  The spectral comparison itself requires neither a nonzero cohomology class nor the prescription $eta eq.not 0$. Omitting these data from the open-image and Chebotarev construction still gives all the spectral hypotheses of Definition 35. One may also impose extra fixed cochain data, as in the unknown-center argument below. Proposition 36, and in particular its torsion implication, applies to every such direction. This is the form used at an initially unknown analytic center.
] <tame:unknown-rank-direction>

#proof[
  Now assume $"an" \( E \) = 1$. The companion has analytic rank zero, so the classical low-rank theorem gives the rational rank decomposition over $K$. In particular $Q_X$ is a rational multiple of $P$ modulo torsion; write $Q_X = t_P P$ in $E \( K \) ⊗ bb(Q)$. The exact split Gross–Zagier normalization (GZ)–(GZ-E) gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ C L' \( f \, 1 \) L \( f ⊗ epsilon \, 1 \) = frac(2 H_(upright("abs")) \( Q_X \), delta) = frac(2 t_P^2 H \( P \), delta) . $ <tame:classical-height>]
  This is the single Hilbert-class trace and the absolute Poincaré-height diagonal, with the restricted polarization; see [27] Chapters I and V and [15]. Together with (6.7), it also proves the rationality of $L' \( f \, 1 \) \/ \( Omega_0 H \( P \) \)$.
  Choose the direction of Lemma 38, so that $h_lambda^(bb(Q)) \( P \, P \) eq.not 0$. By Lemma 39,
  $ h_lambda^K \( Q_X \, Q_X \) = 2 t_P^2 h_lambda^(bb(Q)) \( P \, P \) . $
  Substitution of (6.16) into (6.3) therefore gives
  #[#set math.equation(numbering: n => "(T3)")
   $ Z' = plus.minus d_0 \( 2 - a_(*) \) thin frac(L' \( f \, 1 \), Omega_0 H \( P \)) h_lambda^(bb(Q)) \( P \, P \) . $ <eq:T3>]
  The factor $2$ from field extension is the same factor as in (6.16); neither is discarded. Finally combine (T3) with the cup reciprocity formula (T2). Since $2 - a_(*)$, $h_lambda^(bb(Q)) \( P \, P \)$, and $log_omega P$ are nonzero, cancellation yields (T1). ◻
]

== 7 Completion of the positive comparison <sec:positive-completion>

We complete the proof of Proposition 3. All curves in this section are non-CM. We first compute the central value of (L1) when the analytic rank is already one. Together with the rank-zero calculation, this transfers a unit from the positive twist to the prescribed curve.

For an initially unknown center of Selmer corank one, we then choose a tame direction in which the Selmer Bockstein is nonzero. Along that direction the unit determinant forces the singular localization of the Kato class to have a simple zero. The torsion test in Proposition 36 converts its nonzero derivative into analytic rank one. This argument uses a compact Selmer class before knowing that it is generated by a rational point.

Isogeny invariance from Section 2 allows us to work with $E'$, transporting the positive anchor hypothesis to $E' ""^(\( h \))$ when $h$ is the given discriminant. Use the square orders, true $2$-towers, symbols with $A = 1$, and fixed $c \, d$ of the positive determinant construction. Include each moving prime once in the orders, and include the fixed twist in the fixed support when it is used. Thus Proposition 23 removes any moving prime at its trivial-variable specialization, with the other parameters still allowed. All auxiliary sequences retain the splitting and trace bounds of (L1). The option to prescribe one of them will supply the Bockstein direction.

=== 7.1 Central specialization in analytic rank one <central-specialization-in-analytic-rank-one>

#thm([Lemma 7.1.])[
  (The rank-one central value).  #emph[Suppose a branch $A_0$ of the positive determinant construction has analytic rank one. Then $U \( 0 \) eq.not 0$ and 
$ v_2 U \( 0 \) = X \( A_0 \) . $

 Thus (L5) holds in both analytic ranks zero and one.]
] <lem:positive-completion:rank-one>

#proof[
  #emph[The compact Selmer line.] Let $A_0$ be $E'$ or the indicated positive twist. Work with the notation $O^j \, R_(bb(R))^j \, J_2 \, tau_g \, tau_q \, b$ of Lemma 33, at the actual stages (so $S' = S union R_i$, $omega$ minimal on $A_0$). Write $P$ for a rational point generating the free Mordell–Weil lattice, and $s_1 = v_2 \( \# "Sha" \( A_0 \/ bb(Q) \) \)$, finite by the low analytic rank theorem.
  The Poitou–Tate map from $J_2$ to the dual of the discrete Selmer group is injective. Indeed its composite with the dual of $A_0 \( bb(Q) \) ⊗ bb(Q)_2 \/ bb(Z)_2$ is evaluation by compact point localization. Log duality and $log_omega P eq.not 0$ make this composite injective, with cokernel of length $v_2 \( log_omega P \) - b$. The Kummer exact sequence adds the finite quotient of length $s_1$, so the cokernel into the dual Selmer has length $s_1 + v_2 \( log_omega P \) - b$.
  The preceding term in Poitou–Tate is the singular image of ordinary $O^1$, which must therefore be zero. At the other places compact $H^1$ is already Kummer. Global Kummer and finiteness of $"Sha"$ now identify $O^1$ with the compact Mordell–Weil group, and the remaining terms of Poitou–Tate give
  $ O^1 & = A_0 \( bb(Q) \)_2^and \,\
"length" O^2 & = s_1 + v_2 \( log_omega P \) - b + "length" R_(bb(R))^2 + sum_(q in S'_f) tau_q - tau_g . $
  #emph[Removing the moving Euler factors.] Write $z_i^compose$ for the ordinary image after specializing all $B$-parameters centrally on the given branch. The moving omitted factors there are $e_r = 1 - a_(A_0) \( r \) \/ r + 1 \/ r$; the fixed twist in the comparison is split at these primes. Removing them all gives the fixed-support class $z$ of the tame calculation, with $z_i^compose = \( product_(r in R_i) e_r \) z$ rationally after inflation, by the norm and tower relations. In particular by (T1)
  #[#set math.equation(numbering: n => "(P1)")
   $ v_2 #h(-1em) (frac(log_omega z_i^compose, \( log_omega P \)^2)) = v_2 #h(-1em) (Delta \( 0 \) thin product_(q in S'_f) L_q \( A_0 \, 1 \)^(- 1) dot.op frac(L' \( A_0 \, 1 \), Omega_0 H \( P \))) . $ <eq:P1>]
  Here $Delta \( 0 \)$ is the evaluated smoothing including any fixed quadratic scalar. To use (T1) at the stripped base one makes #emph[its own] choice of horizontal sequence if necessary, killing the fixed support and fixed data required there and adapting to the point $P$ on this actual curve; it need not be any current variable of $B$.
  #emph[The determinant valuation.] The first equality in (5.1) still applies, since $O^1$ has a line, with nonzero $z_i^compose$ rationally by (P1), and $O^2$ is torsion. Now $"length" \( O^1 \/ bb(Z)_2 z_i^compose \) = v_2 \( log_omega z_i^compose \/ log_omega P \) + tau_g$. Thus the raw valuation is
  $ v_2 #h(-1em) (frac(log_omega z_i^compose, \( log_omega P \)^2)) + b + 2 tau_g - s_1 - sum_(q in S'_f) tau_q - "length" R_(bb(R))^1 = X \( A_0 \) + v_2 \( Delta \( 0 \) \) \, $
  by the Haar and real-component computations. Here $upright("Reg")_(A_0) = H \( P \)$ on the full free lattice. Just as at rank zero these are bounded-torsion-length central specializations: the moving $tau_r$ are bounded, since $r arrow.r 1$ and the Tate trace limits are not 2 there. The displayed cohomology formulas and positive triangle bound positive torsion and keep the rational degree-one dimension two with other degrees zero. Thus pivots for those dimensions work at the center of the limit diagram also; the class determinant specializes there and has the same finite valuation. The fixed corrections have central ratio 1. This proves (L5) in analytic rank one. ◻
]

#thm([Corollary 7.2.])[
  (Positivity and transfer of a central unit).  #emph[The following assertions hold for a non-CM curve $A$.]
  + #emph[If $upright("an") \( A \) lt.eq 1$, then $X \( A \) gt.eq 0$.]
  + #emph[Suppose the positive twist hypothesis of Proposition 3 holds, without assuming the analytic rank of $A$. Then the positive determinant of $E'$ is a unit for every completed auxiliary-prime construction permitted by Proposition 27, including those with one prescribed admissible sequence. If $s_2 \( E' \) = 0$, then $upright("an") \( E' \) = 0$ and $X \( E' \) = 0$.]
] <cor:positive-completion:unit>

#proof[
  Integrality in Proposition 27, the central equality (L5) in both ranks, and isogeny invariance prove the lower bound. Under the positive twist hypothesis, the central value of $U$ on that branch has valuation zero. Since $B$ is local, $U$ is a unit on that branch. By the simultaneous construction and reduction-unit transfer for (L1), $U$ at $E'$ is then a unit as well. If the given twist is trivial we simply have the unit directly. This conclusion works for any of the completed choices in that construction, including with the prescribed-sequence option. Thus for $s_2 \( E' \) = 0$, Lemma 33 gives analytic nonvanishing and $X \( E' \) = 0$. ◻
]

=== 7.2 A direction for the unknown corank-one center <subsec:positive-completion:direction>

Assume now $s_2 \( E' \) = 1$ and the positive anchor hypothesis. Write $E = E'$ for the untwisted branch, and use $f \, N \, T$ as in Section 6. Two-primary parity gives odd functional sign; the rational Mordell–Weil rank is still unknown.

Choose $K \, cal(A) \, ell$ and the other fixed data of the tame spectral-height comparison, including the nonvanishing companion. Include the anchor’s twisting field among the splitting constraints. We will prescribe the first auxiliary sequence $r_(1 \, i) = r_i$, with residue character $lambda_i$, to satisfy Definition 35 and a nonzero Bockstein condition. In particular its character kills all primes of $S_f \, c \, d$. We establish this compatibility before completing the auxiliary tuple.

#thm([Lemma 7.3.])[
  (A primitive for the self-cup).  #emph[Let $x$ be a cocycle representing a nonzero class in the rational compact Selmer line at fixed support, with coefficients $T ⊗ bb(Q)_2$, and let $beta = "pol" \( x \)$ on the Tate dual. There is a continuous scalar $1$-cochain $k$ on $G_(bb(Q) \, S)$ such that 
$ d k = - beta union x . $

 After multiplying $x \, beta$ by the same nonzero dyadic integer and $k$ by its square, all three cochains can be taken integral.]
] <lem:positive-completion:self-cup>

#proof[
  The inverse limit of the finite Selmer groups fits into the Kummer sequence with the rational-point completion and the Tate module of $"Sha"$. Its rational dimension is therefore the corank $s_2 = 1$ of the usual divisible-coefficient Selmer group. These local conditions may be imposed on $G_(bb(Q) \, S)$, since at good odd places outside $S$ they are unramified.
  The class of $beta union x$ vanishes locally by Kummer isotropy. Moreover, $H^2 \( G_(bb(Q) \, S) \, bb(Q)_2 \( 1 \) \)$ injects into the sum of local cohomology groups by Poitou–Tate: the opposite everywhere-locally-zero kernel for $bb(Q)_2$ is unramified everywhere and vanishes by class field theory. Thus the global cup is a coboundary, giving $k$. Compactness bounds the denominators of these continuous cochains. Rescale $x \, beta$ together and $k$ quadratically to make them integral. No rational-point representative of $x$ is required. ◻
]

Fix a nonzero compact Selmer class and cochains $x \, beta \, k$ as in Lemma 50.

As in the choice of direction for (T2), let $cal(P)$ be the finite list of rational primes at which the residue characters are required to vanish, and set

$ L = F #scale(x: 120%, y: 120%)[\(] mu_(2^oo) \, thin q^(1 \/ 2^n) : q in cal(P) \, med n gt.eq 1 #scale(x: 120%, y: 120%)[\)] . $

Here $F \/ bb(Q)$ is finite normal and enforces the fixed splitting and congruence conditions, including the Hilbert class field, the fixed twist data and $E \[ 2 \]$.

#thm([Lemma 7.4.])[
  (A compatible nonzero direction).  #emph[The prescribed auxiliary sequence can be chosen to satisfy the spectral-height hypotheses of Section 6 and the fixed splitting conditions for both positive-determinant branches. Its Frobenius lifts can be chosen to tend on the fixed data to an element $g in G_L$ whose Tate action $g_T$ has determinant one, trace $a_(*) eq.not plus.minus 2$, and two non-root-of-unity eigenvalues, and which satisfies 
#[#set math.equation(numbering: n => "(P2)")
 $ k \( g \) - beta \( g \) g_T \( g_T - 1 \)^(- 1) x \( g \) eq.not 0 . $ <eq:P2>]

]
] <lem:positive-completion:direction>

#proof[
  Apply Lemma 37 to the nonzero compact Selmer class and its self-cup primitive from Lemma 50, with the displayed field $L$. Its hypotheses require only a nonzero cohomology class and these fixed-support cochains. The prescribed list includes every spectral-height condition and the fixed data of both branches.
  The lemma gives $g$ satisfying (P2) and horizontal Frobenius/residue-character data approaching it. Splitting on $E \[ 2 \]$ and in the twisting field, together with the determinant-one trace condition, also gives the prescribed-prime hypotheses of Proposition 27. Write $v = u_1$, so the Galois scalar is $\( 1 + v \)^(lambda_i)$, up to the consistent inverse orientation. ◻
]

Complete $R_i$ after this choice by Lemma 29 (notably its mutual-bit dummy choice when the scalar-constituent test has two primes). It does not matter if $lambda_i$ fails to kill the supplementary $r_(j \, i) \, j eq.not 1$. Their trace-limit and splitting conditions still hold. Corollary 49 therefore gives a unit $U$ on the $E$-branch with this prescribed variable included.

=== 7.3 The Selmer Bockstein is nonzero <subsec:positive-completion:bockstein>

Pass from $B$ to the germ $cal(R) = bb(Q)_2 \[ \[ v \] \]$ by setting every other parameter to zero. Let $C_(upright("glob"))$ be the ordinary limiting global complex on this germ. At $2$ its coefficient is constant because $lambda_i \( 2 \) = 0$. We may therefore impose the scalar extension of the rational Kummer line in degree one. Denote the resulting Selmer complex by $C_f^(upright("Sel"))$, and the local quotient by $J$. There are no local invariant terms, so $J$ is a free singular line in degree one, measured by dual exponential, and

$ C_f^(upright("Sel")) arrow.r C_(upright("glob")) arrow.r J $

is the local-condition triangle. Polarization identifies the use of $T$ with that of $T^or \( 1 \)$, with the indicated scalar twist.

No other local conditions are needed. At the closed point, every odd finite local complex in use is rationally acyclic. For a moving place, the unramified local model has both $g_j - 1$ and $g_j \/ lim_i r_(j \, i) - 1$ invertible. Unramified inflation thus identifies closed-point ordinary cohomology with the fixed-support problem. The model and inflation comparisons of Section 3, after inverting $2$, also give perfectness over $cal(R)$.

At the closed point, exact Selmer orthogonality and Poitou–Tate give one line in each of degrees one and two: the degree-one dimension is $s_2 = 1$, and global and local invariant vanishings exclude the remaining degrees. A minimal model over $cal(R)$ consequently has the form

$ \[ thin cal(R) arrow.r^(delta \( v \)) cal(R) thin \] quad upright("in degrees ") 1 \, 2 \, #h(2em) delta \( 0 \) = 0 . $

The first-order differential $delta' \( 0 \)$ is the Selmer Bockstein. The next lemma proves that it is nonzero.

#thm([Lemma 7.5.])[
  (Nonzero Selmer Bockstein).  #emph[For the direction of Lemma 51, $"ord"_v delta \( v \) = 1$. In particular, $C_f^(upright("Sel"))$ is generically acyclic over $cal(R)$.]
] <lem:positive-completion:bockstein>

#proof[
  Suppose that $delta \( v \)$ has order at least two, including the possibility that it vanishes identically. Then the central class $beta$ lifts to the Selmer problem over $cal(R) \/ v^2$. We first realize this hypothetical lift on finite-stage cochains, then test it by cup reciprocity.
  #emph[Realizing the first-order lift.] After a fixed nonzero dyadic multiplier $m$ and passage to a slower cofinal precision, the lift gives cocycles on $G_(bb(Q) \, S union R_i)$ with the deformed coefficients,
  $ b_i \( v \) = m beta + v z_(1 \, i) med \( mod med \( 2^(n_i) \, v^2 \) \) \, #h(2em) n_i lt.eq m_i \, #h(2em) n_i arrow.r oo \, $
  with the following two properties:
  #[#set math.equation(numbering: n => "(7.1)")
   $ d z_(1 \, i) = - m lambda_i union beta med \( mod med 2^(n_i) \) \, #h(2em) "inv"_2 \( z_(1 \, i) union x \) arrow.r 0 . $ <eq:positive-completion:stage-lift>]
  Use $- lambda_i$ instead throughout for the inverse scalar action. These derivatives are consequences of the hypothetical lift; they are not Kato classes.
  Here are the finite-model details. After the one-variable specialization, transfer restriction at $2$ to constant local models; the coefficients there are already split at each stage. At dual-number precision retain the cup with the fixed $x$, the local invariant map on root coefficients, and the global model image of the inflated central $beta$. A rational lift is a model cocycle modulo $v^2$ whose constant term represents $beta$. Adjust it by a deformed coboundary to match that model image, then clear one fixed common denominator.
  The cycle and constant-term equations pass to stage representatives modulo $\( 2^(n_i) \, v^2 \)$ at a slower cofinal precision, by the marked finite-model construction. Include these representatives back into actual cochains. The central contraction homotopy expresses the difference of their constant terms from $m beta$ as a coboundary. Lift the adjusting degree-zero cochain and subtract its deformed coboundary. The constant term is now exactly $m beta$, so the coefficient of $v$ in the cocycle equation gives the first identity in (7.1).
  On the constant local models at $2$, the derivative of the hypothetical Selmer lift is rationally finite. Its cup invariant against $x$ is therefore zero by Kummer isotropy. The marked cup and invariant maps make the stage invariants converge to this value. The last coboundary adjustment does not change them because $lambda_i = 0$ locally at $2$. This proves the second assertion in (7.1) using actual finite-stage cochains.
  #emph[The closed scalar cocycle.] Suppress the index on $z_(1 \, i)$. The cochain
  #[#set math.equation(numbering: n => "(P3)")
   $ z_1 union x + m lambda_i union k $ <eq:P3>]
  is closed: its two differentials cancel by $d z_1 = - m lambda_i union beta$ and $d k = - beta union x$. At $2$, the second term is zero and the first has invariant tending to zero by (7.1). At the other fixed places, $lambda_i$ vanishes and the rational $x$ is a coboundary, so one common multiplier kills their local contributions. Outside the allowed support the cup is unramified.
  #emph[The moving local invariants.] At every moving prime there is a bounded-denominator local cochain $w_(j \, i)$ with $d w_(j \, i) = x$: since $x$ is unramified, take
  $ w_(j \, i) = \( rho_T \( "Fr"_(j \, i) \) - 1 \)^(- 1) x \( "Fr"_(j \, i) \) . $
  The trace bounds give the common denominator. After clearing it, (P3) is locally cohomologous to $m lambda_i union \( k - beta union w_(j \, i) \)$. The second factor is an unramified root-coefficient cocycle. At a supplementary prime the character $lambda_i$ is also unramified, hence
  $ "inv"_(r_(j \, i)) #scale(x: 120%, y: 120%)[\(] m lambda_i union \( k - beta union w_(j \, i) \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( j eq.not 1 \) . $
  At the distinguished prime $r_i$, local cup reciprocity and the residue-exponent choice instead give
  $ "inv"_(r_i) #scale(x: 120%, y: 120%)[\(] m lambda_i union \( k - beta union w_(1 \, i) \) #scale(x: 120%, y: 120%)[\)] arrow.r plus.minus m eta eq.not 0 \, $
  with the same fixed denominator clearing understood. To see the normalization, at the working precision the local field contains the relevant roots of unity. An unramified root cocycle is the Kummer class of a unit, and its Frobenius value records raising the residue unit to $\( r_i - 1 \) \/ 2^(n_i)$. This is exactly the additive residue exponent defining $lambda_i$, in the compatible root basis. Frobenius convergence gives the scalar $eta$ of (P2).
  All other local invariants tend to zero. The nonzero limit at $r_i$ contradicts the global sum-of-invariants law for the closed cocycle (P3). Thus $delta \( v \)$ has order one. ◻
]

=== 7.4 Detection of the analytic zero <detection-of-the-analytic-zero>

#proof[
  #emph[Completion of the proof of Proposition 3.] The inequality and the corank-zero implication were proved in Corollary 49. Suppose $s_2 \( E \) = 1$, and use the direction and the unit constructed above. By Lemma 52, the local-condition triangle gives a single generic degree-one line for the ordinary global problem on this germ. Restoring the ordinary real triangle gives just degree one of dimension two for the positive complex. These are the same dimensions as on the full ring $B$, so the generic determinant identity defining $U$ specializes to $"Frac" cal(R)$, changing pivots if necessary.
  The real basis generates the constant real contribution, and every correction factor in (L1) is a unit in the germ. Write $z^(upright("all"))$ for the Kato class with all supplementary moving primes still present. The local-condition triangle and the inverse determinant convention now give
  #[#set math.equation(numbering: n => "(7.2)")
   $ 0 = "ord"_v U & = d_(cal(R)) \( C_f^(upright("Sel")) \, 1 \) + d_(cal(R)) \( J \, "loc"_(upright("sing")) z^(upright("all")) \)\
 & = - 1 + "ord"_v \( exp^(*) z^(upright("all")) \) . $ <eq:positive-completion:simple-exponential>]
  Thus the dual exponential has a simple zero, in any fixed nonzero rational differential coordinate.
  Remove the supplementary primes at each stage by the good Euler norm, with the true cyclotomic variable trivial and the conductor-$r_i$ variable retained. The Euler polynomials restoring those primes may have nontrivial unramified scalar values, but their limiting central values are $2 - "tr" g_j eq.not 0$. They are therefore units in $cal(R)$. The rational norm identities pass to the local scalar polynomials and their limits: the Euler factors are integral, and the split local dual-exponential coordinates have uniformly bounded denominators. Consequently the one-prime horizontal comparison also has a simple zero, and its derivative $Z'$ is nonzero, up to a possible variable inversion.
  If $L' \( f \, 1 \) = 0$, the nonzero companion value and (GZ) make $phi.alt_(*) P_X$ torsion. Proposition 36 would then give $Z' = 0$, a contradiction. Its torsion implication requires no rational spanning point, and the prescribed direction satisfies all its field, eigenvalue, and residue-character conditions. Since the functional sign is odd, we conclude that $L' \( E \, 1 \) eq.not 0$ and $upright("an") \( E \) = 1$.
  We may now apply Lemma 48. The unit $U$ gives $X \( E \) = 0$; the classical low-rank theorem gives the corresponding rational rank and finiteness of $"Sha"$. Isogeny invariance transports these conclusions from $E'$ to the original curve. ◻
]

This proves Proposition 3. We next establish the split-pair anchor of Proposition 4 and the CM comparison of Proposition 5.

== 8 Split Heegner determinants and paired logarithmic measures <sec:split-measures>

The split-pair anchor requires an integral comparison over an imaginary quadratic field. We first construct its strict determinant and paired logarithmic measure. Section 9 compares them and proves the following proposition. The variables $t \, u$ and the auxiliary primes introduced below are independent of those in the positive comparison.

#thm([Proposition 8.1.])[
  (Reducible split-product comparison).  #emph[Let $E \/ bb(Q)$ be a non-CM elliptic curve with $E \( bb(Q) \) \[ 2 \] eq.not 0$, and put $N = upright("cond") \( E \)$. Let $d equiv 7 med \( mod med 16 \)$ be prime and suppose that every prime dividing $2 N$ splits in $K = bb(Q) \( sqrt(- d) \)$. If $s_2 \( E \/ K \) = 1$, then $L \( E \/ K \, s \) = L \( E \, s \) L \( E^(- d) \, s \)$ has a simple zero at $1$, and 
$ X \( E \) + X \( E^(- d) \) = 0 . $

 If the product is already known to have a simple zero at $1$, the same valuation identity holds without separately assuming the Selmer corank condition.]
] <split-measures:reducible-input>

The superscript $- d$ denotes a quadratic twist. In the corank-one assertion, we do not assume the existence of a nontorsion point: this will follow from the determinant comparison at the tame center.

=== 8.1 The strict determinant and its residual order <the-strict-determinant-and-its-residual-order>

Until explicitly enlarged below, the setting is the geometric one in Proposition 53: $E$ is non-CM with rational two-torsion, $d$ is prime and congruent to $7 med \( mod med 16 \)$, and every prime of $2 N$ splits in $K$. The constructions and lemmas in this section impose no Selmer-corank hypothesis.

We fix embeddings for CM and 2-adic evaluations and a place $w$ over 2 (the connected prime in our CM convention), writing $macron(w)$ for the conjugate. Let $cal(O)_j = bb(Z) + j cal(O)_K$ with ring class field $H_j$, $h = h \( K \)$, and $Gamma tilde.eq bb(Z)_2$ the maximal free pro-2 quotient of $"proj lim"_m "Pic" \( cal(O)_(2^m) \)$. We use class groups as Galois labels by ring class reciprocity. Take $Psi_t$ the tautological character on $Gamma$ with generator value $1 + t$, pulled back to a Galois character over $K$.

Here $h$ is odd by quadratic genus theory, and $cal(O)_K^times = { plus.minus 1 }$. The order class group exact sequence uses, at 2, the ratio between the unit groups at the two primes modulo the order conductor. This gives the description of $Gamma$ and surjective inertia at either dyadic place.

At a split odd prime $q$, the Frobenius exponents at its two places in $Gamma$ are opposite and nonzero: taking the $h$-th power of a place ideal uses the ratio of a principal generator and its conjugate, which is not a root of unity. Conjugation in all our ring class character groups acts by inversion.

Use $T = T_2 E$, with Tate duality given by the Weil pairing. The strict complex is full at all allowed places except $w$:

$ C \( t \) = upright("fib") #scale(x: 120%, y: 120%)[\(] R Gamma \( G_(K \, S) \, T \[ \[ t \] \] \( Psi_t \) \) arrow.r R Gamma \( K_w \, T \[ \[ t \] \] \( Psi_t \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) S = { v : v divides 2 N } . $

All complexes and limiting operations use the finite models of Section 3. The strict complex has a square free model in degrees $1 \, 2$; the same assertion will hold for its two-variable analogue. Indeed the residual representation has two trivial constituents. For each constituent, restriction to $w$ kills global degree-zero constants, and the complementary restriction detects dual constants, giving no degree-three cohomology. The full local complex at $w$ subtracts exactly the global Euler-characteristic contribution. The assertions for $T \/ 2 T$ follow by its filtration and lift to the free model.

Write $L_(upright("alg")) \( C \)$ for the determinant of the model differential, defined up to a coefficient-ring unit. At a valuation where it is nonzero, our inverse-determinant convention gives

$ d \( C \, 1 \) = - v #scale(x: 120%, y: 120%)[\(] L_(upright("alg")) \( C \) #scale(x: 120%, y: 120%)[\)] . $

#thm([Lemma 8.2.])[
  (Scalar residual order).  #emph[For an odd prime $q divides N$, let $b_q in bb(Z)_2 \\ { 0 }$ be the $Gamma$-Frobenius exponent at one of the places over $q$, and put $g_q = 2^(v_2 \( b_q \))$. Then 
#[#set math.equation(numbering: n => "(A1)")
 $ "ord"_t overline(L)_(upright("alg")) \( C \( t \) \) = 4 sum_(q divides N\
q eq.not 2) g_q . $ <eq:A1>]

]
] <split-measures:residual-order>

#proof[
  Let $w^h = \( alpha \)$ as ideals, $alpha = \( a + b sqrt(- d) \) \/ 2$, $a^2 + d b^2 = 2^(h + 2)$. Both $a \, b$ are odd: otherwise $alpha$ would have the same reduction at both primes over 2, impossible. Each odd prime of $b$ has $\( 2 \/ q \) = 1$ (here $q$ denotes that prime), by the norm equation and $h$ odd; hence $b equiv plus.minus 1 med mod med 8$. For $h gt.eq 3$, $a^2 equiv 9 med mod med 16$, and the unit $macron(alpha)$ at $w$ is congruent to $a$ modulo 8. For $h = 1$ we have $d = 7$, and the unit root of $X^2 plus.minus X + 2$ is again $plus.minus 3 med mod med 8$.
  Thus $- 1 \, 2 \, macron(alpha)$ give a basis of local squareclasses there. They are also a basis of global squareclasses with only dyadic support (odd $h$). With trivial scalar $bb(F)_2$ and no odd places yet allowed, the strict problem is acyclic: restriction to $w$ is an isomorphism in degree one by that basis and in degree zero on constants, so use the above amplitude and Euler characteristic.
  On either individual residual constituent with scalar twist $overline(Psi)_t$, now adding the two places over each odd $q divides N$ gives singular blocks by the unramified inflation comparison. Each has determinant over $bb(F)_2 \[ \[ t \] \]$ of order $g_q = 2^(v_2 \( b_q \))$ in $t$, $b_q in bb(Z)_2$ the exponent at one place over $q$. Indeed Frobenius-minus-one on the scalar inertia $H^1$ coefficient is $\( 1 + t \)^(plus.minus b_q) - 1$ (the cardinality twist reduces to one). Extension of the two constituents is only needed at full support. There are two places over each $q$ and two residual constituents, so summing these orders gives (A1). Determinant multiplicativity for the residual filtration allows the two constituents to form a nonsplit extension. ◻
]

Retain the generator $alpha$ of $w^h$ chosen in the proof.

=== 8.2 A transverse tame parameter <a-transverse-tame-parameter>

#thm([Lemma 8.3.])[
  (Auxiliary primes and Frobenius exponents).  #emph[There is a sequence of split good primes $r_i$, leaving every fixed finite set, with principal places $R_i = \( pi_i \)$, such that:]
  + #emph[$pi_i$ tends to $1$ at both dyadic places, and its residue modulo $sqrt(- d)$ is a nonzero nonsquare;]
  + #emph[$sqrt(2)$ exists and is a nonsquare modulo $R_i$, and $\( q \/ r_i \) = - 1$ for every odd $q divides N$;]
  + #emph[the Tate Frobenius at $R_i$ tends to a matrix $g$ with $det g = 1$ and $a_(*) := "tr" \( g \) eq.not 2$.]
  #emph[The Sylow-2 ring-class character at conductor $r_i$ has odd Frobenius exponents at the odd places over $N$, and exponents of valuation exactly one at $w \, macron(w)$.]
] <split-measures:auxiliary-primes>

#proof[
  For existence, prescribe a compatible ray class action over $K$ of moduli $2^m sqrt(- d)$, using principal ideals with generators having residues 1 at the 2’s and a fixed nonsquare at the ramified prime. This fixes 2-power roots of unity by norm. $K \( i \, root(4, 2) \) \/ K$ is dihedral of order 8 (disjoint quadratic data); its maximal abelian subfield is 2-cyclotomic in the sense of being contained in $K \( mu_(2^oo) \)$. Thus its nontrivial commutator element can be prescribed compatibly with the ray condition. The $sqrt(q)$’s are independently switchable by their new disjoint ramification.
  The full constraint field has finite commutator image over $K$, so the subgroup fixing it has Tate image containing a finite-index part of the closed commutator of the image over $K$. This includes an open subgroup in determinant one by the non-CM open-image theorem [54]. The coset therefore permits trace different from 2. After fixing such an element, Chebotarev to increasing precisions (degree-one places with chosen lifts) gives the sequence; in particular $r_i arrow.r 1$ 2-adically.
  The Sylow-2 quotient of $"Pic" \( cal(O)_(r_i) \)$ is cyclic of order $2^(v_2 \( r_i - 1 \))$ by the unit ratio at $r_i$ and odd class number. Use its group-ring Galois character $Psi_(u \, i)$ with generator value $1 + u$. Its quadratic quotient is $K \( sqrt(r_i) \)$ (pull back the discriminant character by norm, trivial on the defining principal order relations).
  At the places over odd $q divides N$, Frobenius exponents in this variable are odd: for $frak(q)^h = \( x \)$, the ratio $x \/ macron(x) med mod med R$ has symbol $\( q \/ r \) = - 1$.
  At $w \, macron(w)$ the exponents have valuation exactly one. Indeed $alpha med mod med R$ is square by Hilbert reciprocity on $\( alpha \, pi_i \)$, primary $pi_i$ at both 2’s and units at other odd places. Thus $alpha \/ macron(alpha)$ is a square with nonsquare root $alpha \/ \( sqrt(2) \)^h med mod med R$; both roots have the same symbol. Inertia at either place over $r$ surjects onto the cyclic quotient, while $Psi_t \( upright("Fr")_R \) arrow.r 1$ since $pi_i$ is increasingly primary. ◻
]

Fix the sequence from Lemma 55 and retain its generator choices and group-ring characters $Psi_(u \, i)$. Put $n_i = v_2 \( r_i - 1 \)$ and

$ Lambda_i = bb(Z)_2 \[ \[ t \] \] \[ u \] \/ #scale(x: 120%, y: 120%)[\(] \( 1 + u \)^(2^(n_i)) - 1 #scale(x: 120%, y: 120%)[\)] . $

At stage $i$, let $C_i$ be the strict complex with coefficients $T ⊗ Lambda_i$, scalar action $Psi_t Psi_(u \, i)$, and the two places over $r_i$ additionally allowed in full. It is still strict at $w$. Since $n_i arrow.r oo$, the displayed relation disappears at every fixed Artin precision. The finite-model construction on the fixed ultrafilter therefore gives a matrix limit over $bb(Z)_2 \[ \[ t \, u \] \]$, which we denote by $C_r \( t \, u \)$, with determinant $L_(upright(a l g \, r))$. Thus the subscript $r$ on a limiting object denotes the chosen auxiliary sequence; in a stage calculation we write $r = r_i$ and $R = R_i$.

#thm([Lemma 8.4.])[
  (Transverse regularity).  #emph[The determinants satisfy 
#[#set math.equation(numbering: n => "(A2)")
 $ L_(upright(a l g \, r)) \( t \, 0 \) = \( 2 - a_(*) \)^2 L_(upright("alg")) \( C \( t \) \) dot.op upright("unit") \, $ <eq:A2>]

 and 
#[#set math.equation(numbering: n => "(A3)")
 $ L_(upright(a l g \, r)) \|_(\( 2 \, t \) = 0) eq.not 0 . $ <eq:A3>]

]
] <split-measures:transverse>

#proof[
  At $u = 0$, unramified inflation supplies two singular local differentials with Tate matrices $g - 1$, up to conjugation and determinant units. The cardinality twist tends to one, and $det \( g - 1 \) = 2 - a_(*)$. This proves (A2).
  For (A3), set $2 = t = 0$ and consider each trivial residual constituent with its $u$-scalar twist over $D_0 = bb(F)_2 \[ \[ u \] \]$. Discard the odd $q divides N$ for generic acyclicity on the constituent, by the singular inflation comparison using the nontrivial unramified scalar there.
  In the remaining strict problem, at $u = 0$ degree one injects into unrestricted cohomology and has basis $pi_i \, macron(pi)_i$ (radical classes, primary at $w$, using the preceding dyadic basis). This notation identifies such classes by the ultrafilter.
  Suppose the two-term differential over $D_0$ has a nontrivial free kernel; its saturation gives $c in H^1$ reducing nontrivially. Lifting modulo $u^2$ forces the global cup of that reduction with $chi = \[ r_i \]$, the linear scalar character coefficient, to vanish.
  At $R$ both basis elements pair nontrivially with $chi$. Indeed $r equiv 1 med mod med 8$, and $macron(pi)_i med mod med R$ has symbol $\( 2 B \/ r \) = - 1$, $2 B = "Tr" \( pi_i \)$. Here $B$ is an integer, $B equiv 1 med mod med 4$ by primarity, $4 r = \( 2 B \)^2 + d gamma^2$; at every odd prime $q divides B$ we have $\( r \/ q \) = \( d \/ q \)$ with both units (norm and the ramified-prime condition). Quadratic reciprocity also for possible $B < 0$ gives $\( B \/ r \) = \( B \/ d \) = - 1$. Since the local $\( r \, r \)$ Hilbert symbol is trivial and $r = pi_i macron(pi)_i$, this proves the assertion. Hence $c$ reduces in global cohomology to $chi$.
  In unrestricted global cohomology put
  $ D_chi = frac(Psi_u - 1, u) . $
  This is a twisted cocycle: at a finite stage it is defined by retaining one additional coefficient precision. It reduces to $chi$. The coefficient exact sequence for multiplication by $u$ therefore gives an integral class $z$ such that
  $ \[ c \] - \[ D_chi \] = u \[ z \] . $
  Only existence of this quotient is needed; unrestricted $H^1$ need not be $u$-torsion-free.
  At $w$, $D_chi + u z$ is a boundary, and $Psi_u = 1 + u^2 upright("ur") med mod med u^3$ with $upright("ur")$ the nontrivial unramified quadratic additive character. Thus $macron(z)_w = upright("ur")$ (boundaries are divisible by $u^2$).
  At $macron(w)$, lifting $macron(z)$ modulo $u^3$ with the same leading coefficient forces $macron(z)_(macron(w)) union upright("ur") = 0$, hence even valuation as a radical.
  These linear-term obstruction and boundary calculations hold on actual cochains to fixed Artin precisions by the finite models; fixed dyadic local actions here stabilize modulo each precision in the ultrafilter sense. The available global radical classes are generated by
  $ - 1 \, quad 2 \, quad macron(alpha) \, quad pi_i \, quad macron(pi)_i . $
  The class $macron(z)$ has even valuations at both dyadic places: at $w$ this follows because its image is unramified, and at $macron(w)$ from the cup obstruction. These two valuation conditions remove the generators $2 \, macron(alpha)$, since $h$ is odd. Thus only $- 1 \, pi_i \, macron(pi)_i$ remain. The unramified class at $w$ is the radical class of $5$, whereas $pi_i \, macron(pi)_i$ are local squares and the remaining image is contained in the line generated by $- 1$. This contradiction rules out a free kernel on either scalar constituent, proving (A3). ◻
]

=== 8.3 Integral depleted primitives on the ordinary locus <integral-depleted-primitives-on-the-ordinary-locus>

The next three subsections construct the measures that will be compared with these determinants. Their scope is broader than the residual calculations above: the primitive, disk-measure, and interpolation constructions apply to a primitive weight-two newform of trivial character and an imaginary quadratic field with units ${ plus.minus 1 }$, split at $2$, at the primitive level, and at the odd support $S^compose$ specified below. The modular-abelian-quotient variant uses a fixed characteristic-zero coefficient projection. We return to the rational-two-torsion and prime-discriminant hypotheses in the final trace and residual-order calculation.

The use of depleted primitives to express CM sums in terms of Heegner logarithms has its antecedents in Bertolini–Darmon–Prasanna [2] Sections 3.8 and 5.3. We give the integral dyadic construction with the local and parametrization factors used in our comparisons.

Use a modular parametrization $phi.alt : X_0 \( N \) arrow.r E$, $phi.alt \( oo \) = 0$, $phi.alt^(*) omega_E = c_E f thin d q_(upright("Tate")) \/ q_(upright("Tate"))$ for the normalized primitive form $f$. We give the ordinary-locus calculation also in the variant for a primitive weight-two newform of trivial character: there use Abel–Jacobi from its actual level with base cusp, projected to the corresponding modular abelian quotient up to isogeny, and the logarithm functional pulling back to $f thin d q_(upright("Tate")) \/ q_(upright("Tate"))$ at the chosen coefficient embedding. Denote this value function by $G$ on CM disks, so $G = c_E^(- 1) log_(omega_E) phi.alt$ for $E$. Cuspidal differences are torsion [23] and hence are killed by the logarithm. Coefficient extensions and comparisons using $G$ itself here are in characteristic zero.

Let $S^compose$ consist of the odd rational primes of the chosen support (for the current input, the odd primes dividing $N$); for the measure construction it can include additional split primes. Write

$ P_ell \( Z \) = 1 - a_ell / ell Z + epsilon.alt_ell / ell Z^2 \,\
epsilon.alt_ell = cases(delim: "{", 1 \, & ell upright(" does not divide the primitive level") \,, 0 \, & ell upright(" divides the primitive level") .) $

where $a_ell = a_ell \( f \)$. Fix split tame cyclic level orientations at the CM points, extending them to raised powers for quotient operators when needed. At 2 use the canonical connected cyclic level only. With $V_ell$ normalized by Tate expansion $q_(upright("Tate")) mapsto q_(upright("Tate"))^ell$, form

$ f^(\[ 2 \]) & = \( 1 - a_2 V_2 + 2 epsilon.alt_2 V_2^2 \) f \,\
F_0 & = d_(upright("mod"))^(- 1) f^(\[ 2 \]) = lim_(j arrow.r oo) d_(upright("mod"))^(thin 2^j - 1) f^(\[ 2 \]) \, #h(2em) F = product_(ell in S^compose) P_ell \( V_ell \) thin F_0 . $

Here $d_(upright("mod"))$ is ordinary modular differentiation; on a trivialized Tate chart it is $q_(upright("Tate")) partial_(q_(upright("Tate")))$.

#thm([Lemma 8.5.])[
  (Integral depleted primitive).  #emph[The displayed limit defining $F_0$ converges to an integral weight-zero function on the ordinary locus, including when $2 divides N$, and $d_(upright("mod")) F_0 = f^(\[ 2 \])$. At a Tate cusp with cyclic $mu$-level, 
$ F_0 = sum_(m gt.eq 1\
2 divides.not m) a_m / m q_(upright("Tate"))^m \, #h(2em) F = sum_(m gt.eq 1\
\( m \, thin 2 product_(ell in S^compose) ell \) = 1) a_m / m q_(upright("Tate"))^m . $

 Congruences between such fully depleted primitives can be checked by their Tate expansions on a common raised tame level, also for tuples of coefficient components relative to a fixed coefficient lattice.]
] <split-measures:integral-primitive>

#proof[
  Work on the smooth ordinary formal curve of a fine full odd auxiliary level sufficiently large for the tame data, over $cal(V) = W \( overline(bb(F))_2 \)$ (and extend constants as needed). Use the canonical finite flat $2$-level from the multiplicative part, and the étale Igusa tower trivializing the multiplicative formal group and its differential. We use the ordinary deformation and tame elliptic moduli theory of [20,31]: the multiplicative part lifts over the ordinary deformations (its dual is étale); these trivialization covers extend étale on the ordinary compactified charts, with the multiplicative trivialization on Tate charts.
  The log Kodaira–Spencer differential given by the square of the trivialized differential gives $d_(upright("mod"))$ by its dual derivation on scalar functions; derivations lift along the étale levels and the completion. This uses the elliptic Kodaira–Spencer isomorphism on the fine prime-to-2 curve, with $d q_(upright("Tate")) \/ q_(upright("Tate"))$ normalization and unit cusp widths there. It raises equivariant weights by two. $V_2$ uses the quotient by the first connected subgroup with canonical choices on the result (for weight computations take target differential with pullback twice the source differential); $V_ell$ similarly uses the first subgroup in raised cyclic $ell$-level with the stated Tate normalization.
  Pullbacks of the algebraic characteristic-zero forms along the indicated ordinary maps have bounded denominator: these are rigid sections on the quasi-compact ordinary formal region, holomorphic also on cusp charts (the connected level and quotient on Tate curves give the usual Tate-level choices). One can first bound on a finite formal-affine covering in the Hodge lattice, before trivializing.
  Integrality, once some bound exists, can be checked by expansion at all trivialization lifts of a $mu$-cyclic test cusp in each tame determinant component. Indeed the prime-to-2 full level special curve is smooth with geometrically connected determinant components. Each special Igusa component at any fixed finite height surjects onto its ordinary component, and formal expansions there detect vanishing of the special-fiber section. An integral section on the completed infinite tower uses just finite height modulo each precision. This gives the integrality test by division one uniformizer factor at a time. Choose the full-level cusps so that all the nested cyclic tame choices involved are of $mu$-type.
  The weights of the inverse-derivative sequence tend 2-adically to zero, so expansion weight factors on all differential trivializations tend uniformly to 1. Its odd-exponent expansion converges uniformly modulo each scalar precision and the even terms vanish. The same expansion test on differences gives integral convergence on the tower; invariance of the limit descends it to weight zero (étale torsor descent levelwise modulo finite precisions). Also $d_(upright("mod")) F_0 = f^(\[ 2 \])$. The Hecke recursions give the displayed depleted expansions. The same argument checks lattice congruences on a common raised tame level. For a tuple of coefficient components, first allow a common initial denominator and then apply the argument in coordinates for the prescribed lattice. ◻
]

For the reducible input we also use the combination at $1 \, V_2 \, V_2^2$ with coefficients $1 \, - 3 \, 2$ of $- 1 \/ 24 + sum_(n gt.eq 1) sigma_1 \( n \) q_(upright("Tate"))^n$, the weight-two modular Eisenstein 2-depletion (the usual level-raised combination of the weight-two Eisenstein series). Denote its weight-zero antiderivative by $F_(upright("Eis") \, 0)$. Since $a_n equiv sigma_1 \( n \) med mod med 2$ off $2 N$ by residual Frobenius and Hecke recursions, $F med mod med 2$ equals the fully depleted Eisenstein function, using $1 - \( ell + 1 \) V_ell \/ ell + V_ell^2 \/ ell$ at each $ell in S^compose$ on $F_(upright("Eis") \, 0)$.

=== 8.4 Disk measures and exact logarithmic identities <disk-measures-and-exact-logarithmic-identities>

On an ordinary Serre–Tate disk choose the multiplicative coordinate $z$ with $z = 1$ at the canonical lift. We use $cal(F) \( z \)$ for the disk expansion of any of the weight-zero 2-depleted functions above; this notation distinguishes the disk expansion from the global function.

#thm([Lemma 8.6.])[
  (Support of the disk measure).  #emph[There is a bounded integral measure $mu$ on $bb(Z)_2$ with 
$ cal(F) \( z \) = integral_(bb(Z)_2) z^x thin d mu \( x \) . $

 It is supported on $bb(Z)_2^times$.]
] <split-measures:unit-support>

#proof[
  The integral expansion in $z - 1$ defines the measure by Mahler duality. We claim that
  $ cal(F) \( z \) + cal(F) \( - z \) = 0 . $
  The points $z \, - z$ are the two lifts over the same canonical degree-two quotient $B$. The Serre–Tate pairing on étale and dual étale bases gives the relation $z_(upright("target"))^e = z_(upright("source"))^c$ with the étale and connected factors $e \, c$ of the isogeny.
  Trace along the connected quotient morphism vanishes by expansion at Tate cusps (all exponents odd). More explicitly one does the trace on the tame ordinary curve, transporting tame data by the quotient. This is a finite-flat square correspondence: the quotient map reduces to Frobenius on the identified special tame curves, is locally a square map in deformation parameters, and the Tate map on cusp charts. Finiteness likewise lifts from the special Frobenius on the adic formal curves. Its trace identity on weight-zero functions follows by the same $mu$-cusp detection (the two Tate expansions with opposite root arguments, and source cyclic choices still $mu$-type). The left side is the transform of the measure whose multiplier is $1 + \( - 1 \)^x$. Uniqueness of the transform and torsion-freeness of the coefficients show that the restriction of $mu$ to $2 bb(Z)_2$ is zero. This proves the support assertion. ◻
]

#thm([Lemma 8.7.])[
  (The exact logarithmic primitive).  #emph[The modular logarithm $G$ is analytic on each interior ordinary CM disk, and on these disks 
#[#set math.equation(numbering: n => "(M1)")
 $ F_0 = P_2 \( V_2 \) G . $ <eq:M1>]

 With the branch of the logarithm satisfying $log 2 = 0$, the Eisenstein primitive is 
$ F_(upright("Eis") \, 0) = - 1 / 48 log (frac(Delta^2 V_2^2 Delta, \( V_2 Delta \)^3)) . $

]
] <split-measures:logarithmic-primitive>

#proof[
  The log $G$ used on such interior disks about CM reductions is analytic on the disk, with the prescribed group-log values at algebraic points. One justification, also for abelian projections, is by Néron extension on smooth charts. Near an interior ordinary tame point use the algebraic relative subgroup scheme of the fine elliptic moduli, i.e. the finite-flat-subgroup Hilbert moduli in the universal $2^b$-torsion, for subgroups of order $2^b$ if the level requires it. It is of finite presentation and smooth over the trait at the canonical-subgroup special point: in Artin deformations there the subgroup must map trivially to the étale quotient (by étaleness and its special connectedness), so the unique lift over any ordinary elliptic deformation is the multiplicative subgroup. Thus the chart has the same smooth deformation germ as the tame chart.
  On its smooth open neighbourhood our characteristic-zero map to the abelian variety extends by the Néron property (in the generic fiber use the map on the cyclic locus; other subgroup types, if present, are open and closed and can use a constant). One may enlarge the local base first. Thus the disk maps into a single Néron tube, where log differences from the center are analytic by the formal group. On smaller closed disks one may first multiply into the small log range, giving the same analytic group log by division. This suffices for all level choices and their quotient disks here.
  To prove (M1), compare differentials. They agree by the parametrization differential, quotient pullbacks and the expansion normalization above ($V_2 G$ differentiates with the extra Tate factor 2, $V_2^2 G$ with factor 4; these differential identities also follow by expansion on the ordinary curve). The possible constant is zero by summing over $z \, - z$. Indeed the two sources can be seen as the two quotients of $B$ by noncanonical order-two subgroups, with inherited cyclic tame data. The $T_2$ or $U_2$ action gives
  $ G \( z \) + G \( - z \) = a_2 G \( B \) - epsilon.alt_2 G \( V_2 B \) . $
  For level at 2 these two noncanonical kernels are exactly the $U_2$ quotients, retaining canonical $2$-level on the result. This Hecke normalization on divisors pulls back the usual differential operator on forms; cuspidal terms are torsion. Thus $P_2 \( V_2 \) G$ also has trace zero in the pair.
  For the Eisenstein assertion, roots of unity are killed by the logarithm and $log 2 = 0$. The displayed weight-zero discriminant ratio is nonvanishing on the interior disks, with analytic log (the normalized variation of an analytic unit on an open disk from its center has values in principal units, e.g. by its Newton polygon). The differentials agree by the log derivative of $Delta$. The norm of the ratio in the source pair is one by the Tate identity $Delta \( q \) Delta \( - q \) = - Delta \( q^2 \)^3 \/ Delta \( q^4 \)$; use the same correspondence expansion (the Tate orders of the ratio cancel at canonical cusps). This fixes the remaining disk constant and proves the Eisenstein identity. ◻
]

=== 8.5 Ring-class orbits and interpolation <ring-class-orbits-and-interpolation>

We next assemble the disk measures along a ring-class orbit. Use $s = 1$ or $s = r_i$ as odd conductor here; the construction works also at odd products of auxiliary good primes coprime to the split levels, with conductor-$s$ ring class weights denoted by $psi_s$ (here trivial or $Psi_(u \, i)$). In this description $K$ can more generally have units just signs, split at the support $2 \, S^compose$, and $Gamma \, Psi_t$ defined as above (inertia at the 2’s of finite index by the class sequence). Fix a CM point of order $cal(O)_s$, with the chosen split cyclic tame orientations, and its translates indexed by $frak(a) in "Pic" \( cal(O)_s \)$.

#thm([Lemma 8.8.])[
  (CM disk coordinates).  #emph[The conductor-$s$ CM points are canonical lifts. In their Serre–Tate disks, the points $z = zeta_(2^m)^j$, for $j$ odd, have endomorphism order $cal(O)_(2^m s)$ and are defined over $H_(2^m s)$ with the specified cyclic level. The kernel of the order-class map to conductor $s$ acts on them through the unit ratio $\( bb(Z) \/ 2^m bb(Z) \)^times$, simply transitively on the primitive roots in each disk. Its inverse-limit map to $Gamma$ is a fixed map $eta : bb(Z)_2^times arrow.r Gamma$, independent of $s$.]
] <split-measures:cm-coordinates>

#proof[
  The conductor-$s$ points are canonical lifts because reduction is ordinary at the split prime, the endomorphisms split the $2$-divisible directions, and the Serre–Tate parameter must be one by the endomorphism lifting relation. Consequently the geometric special end ring is exactly $cal(O)_s$ (all such endomorphisms lift at the trivial parameter). Make the disk evaluations over the completed unramified base, enlarging constants if needed for the form coefficients. Choose Serre–Tate generators in both directions by polarization. For each $frak(a)$ use a prime-to-$2 s$ and prime-to-level ideal action as representative, viewed also at higher 2-conductors. Write $delta_(frak(a)) in bb(Z)_2^times$ for its Serre–Tate exponent from the base (connected divided by étale factor); take the identity at the trivial label.
  Points at $z = zeta_(2^m)^(thin j)$, $j$ odd for a primitive $zeta_(2^m)$, have endomorphisms $cal(O)_(2^m s)$: among endomorphisms of the reduction the two local actions must agree modulo $2^m$. Canonical cyclic $2$-level is preserved by the order, as are the oriented tame groups. Thus by the main theorem of CM these $X_0$-points are defined over $H_(2^m s)$: the units of the completed endomorphism order stabilize the cyclic level.
  Prime-to-level ideal actions transport the groups (including the canonical group at 2) and the disk parameters by the isogeny exponent. In particular the kernel of lowering the order class map to conductor $s$, the unit ratios $\( bb(Z) \/ 2^m \)^times$, acts simply transitively on the primitive roots in a disk.
  For an ideal principal below, extending to $\( gamma \)$, the exponent is the local ratio $gamma_w \/ gamma_(macron(w))$ up to reversing conventions (action by the corresponding endomorphism on the underlying conductor-$s$ reduction). Thus in the inverse limit the exponent on the order-class kernel maps to $Gamma$ by one fixed $eta : bb(Z)_2^times arrow.r Gamma$, independent of $s$ by the order class sequence. Here isogeny actions in all labels are identified by their actual Artin actions on the CM orbit, inverting ideals consistently if required by reciprocity. The cyclic $2$-level throughout is the canonical connected subgroup; there is no independent variation of a $2$-level structure along the orbit. ◻
]

Fix henceforth the Serre–Tate generators and compatible ideal representatives used in Lemma 60. Write $delta_(frak(a)) in bb(Z)_2^times$ for their connected-to-étale isogeny exponents, with $delta_1 = 1$.

Write $\[ y \]$ for the group-like $t$-power series of $y in Gamma$, using additive notation within $Gamma$. Let $mu_(frak(a))$ be the measure of $F$ on the corresponding disk. The chosen ideal representative acts compatibly at all higher dyadic conductors; let $t_(frak(a)) in Gamma$ be the image of this Artin action in $Gamma$. With these fixed representatives, form

$ b_s \( t \, u \) = sum_(frak(a)) \[ thin t_(frak(a)) - eta \( delta_(frak(a)) \) thin \] thin psi_s \( frak(a) \) integral_(bb(Z)_2^times) \[ - eta \( x \) \] thin d mu_(frak(a)) \( x \) $

(without $u$ for $s = 1$). This is bounded-integral, with conductor-$s$ variables in finite cyclic group rings. Use it twice, with all odd orientations opposite but same base points and parameter choices on the underlying elliptic disks; write $B_s = b_s^(+) b_s^(-)$, $B = B_1$, $B_r = lim B_(r_i)$ over the constant enlargement using $cal(V)^(*)$ in the integral series conventions.

#thm([Proposition 8.9.])[
  (Character and central interpolation).  #emph[Let $theta$ be a sufficiently high finite character of $Gamma$, and let $theta_l = theta compose eta$ have primitive conductor $2^m$. Let $X$ be the point with $z = zeta_(2^m)$ in the base disk, at the original primitive level, and put $chi = theta psi_s$. Then 
#[#set math.equation(numbering: n => "(M2)")
 $ (sum_(j med upright("odd") med mod med 2^m) theta_l \( j \) zeta_(2^m)^j) b_s \( theta \, u \) = (sum_(rho in "Pic" \( cal(O)_(2^m s) \)) chi \( rho \) thin G \( X^rho \)) product_(ell in S^compose) P_ell \( chi \( sigma_ell \) \) . $ <eq:M2>]

 Here $sigma_ell$ is the inverse class translation for the oriented $V_ell$, namely one of the two Frobenius classes. At the trivial character in $t$, the corresponding identity is the sum over $"Pic" \( cal(O)_s \)$ of the disk-center logarithms, with its odd Euler factors and the additional factor $P_2 \( psi_s \( sigma_2 \) \)$. For the elliptic curve $E$, when $S^compose$ is precisely the set of odd primes dividing $N$, this gives 
#[#set math.equation(numbering: n => "(M3)")
 $ B \( 0 \) = plus.minus c_E^(- 2) log_(omega_E) \( P \)^2 product_(ell divides 2 N) P_ell \( 1 \)^2 \,\
P = sum_(rho in "Pic" \( cal(O)_K \)) phi.alt \( X_1^rho \) in E \( K \) . $ <eq:M3>]

 where $X_1$ is a split Heegner point of conductor one.]
] <split-measures:interpolation>

#proof[
  The class-group exact sequence makes $theta$ factor through conductor $2^m$. Fourier summation over odd $j$ gives (M2): by Lemma 58, its nonzero Gauss sum multiplies the inverse-character moment of each disk measure. The corrected weight within disk $frak(a)$ at $zeta_(2^m)^j$ is $theta \( t_(frak(a)) \) theta_l \( j \/ delta_(frak(a)) \) psi_s \( frak(a) \)$, precisely the full character value by the parameter description. Each tame $V_ell$ translates the orbit at raised level with the requisite orientations retained after lowering. In (M1), $V_2 \, V_2^2$ disappear by primitivity (same quotient in the pair).
  The two primitive sums of $G$ at opposite odd orientations differ only by a translation character unit and a sign: the Atkin–Lehner operation at the full odd part of the primitive level has this eigenlaw up to killed cusps, reverses all original odd choices and translates the orbit by the indicated odd ideals, preserving canonical level at 2.
  At $t = 0$ there is instead the disk-center version: sum once over $"Pic" \( cal(O)_s \)$ with weights $psi_s$; the same Euler translations occur at the odd primes, and an additional $P_2 \( psi_s \( sigma_2 \) \)$ at the inverse connected-isogeny translation by the canonical centers. This follows by augmentation and (M1). Taking $s = 1$, the two orientation sums differ by a sign and a translation of the same Hilbert-class trace, giving (M3). The factor $c_E^(- 2)$ is retained exactly; no assertion that $c_E$ is a 2-adic unit is used. ◻
]

=== 8.6 Trace compatibility and residual primitivity <trace-compatibility-and-residual-primitivity>

For each conductor $r_i$, choose the base disk by a descending order-$r_i$ isogeny from the conductor-one base point, using a non-eigenline. Transport the Serre–Tate generators by polarization so that the exponent is $r_i^(plus.minus 1)$. In this subsection $B_r$ is formed using these compatible base disks.

#thm([Lemma 8.10.])[
  (The split trace and residual order).  #emph[Return to the geometric setting of Proposition 53, without imposing its Selmer-corank hypothesis, and take $S^compose$ to be exactly the odd primes dividing $N$. For the auxiliary sequence of Lemma 55, 
#[#set math.equation(numbering: n => "(M4)")
 $ B_r \( t \, 0 \) = \( a_(*) - 2 \)^2 B \( t \) \, $ <eq:M4>]

 and 
#[#set math.equation(numbering: n => "(M5)")
 $ "ord"_t overline(B) = 4 sum_(q divides N\
q eq.not 2) g_q . $ <eq:M5>]

]
] <split-measures:trace-residual>

#proof[
  Return to the scalar residual test setting. For conductor $r_i$ use a base disk chosen by an order-$r_i$ descending isogeny from the conductor-one base (non-eigenline), transporting generators so the Serre–Tate exponent is $r_i^(plus.minus 1)$ by polarization. Thus for fixed $m$ above, the evaluation basepoint is eventually also the corresponding $r_i$-descendant (the exponent is one modulo $2^m$). Trace down that conductor at $u = 0$ in (M2) gives multiplier $a_(r_i) - 2$ eventually, by the good-prime Hecke relation subtracting the two split prime-ideal translations, whose $theta$-values become exactly 1. The two orientations give its square. Applying the high-character identity test to infinitely many such $theta$ proves (M4).
  Finally compute modulo 2 at $s = 1$ by the Eisenstein congruence on the disks. The odd depletions on each measure contribute $1 - \( q + 1 \) \[ plus.minus b_q \] \/ q + \[ plus.minus 2 b_q \] \/ q$ at $q$, by translation as above (test at high characters by the same Fourier summation), of residual order $2 g_q$.
  The measure using just $F_(upright("Eis") \, 0)$ has unit value at the center, which is its unweighted CM trace. Indeed the product of $V_2 Delta \/ Delta$ over the conductor-one class orbit is $\( alpha \/ 2^h \)^12 = macron(alpha)^(- 12)$, viewing $alpha$ at the chosen embedding with $w$ connected. The connected isogeny permutes the classes, normalizing differential pullback by 2 in $V_2$; the ordinary isogeny pullback factors for independently chosen differentials have product the principal-generator factor around the cycles, altogether $plus.minus alpha$. Similarly the product of $V_2^2$-ratios is $macron(alpha)^(- 24)$. Thus the log-ratio trace with factor $- 1 \/ 48$ is $- log \( macron(alpha) \) \/ 4$, odd by the dyadic basis congruence above. Thus the Eisenstein measure before the odd depletions is a unit at the center. Each odd depletion contributes order $2 g_q$ to each of the two orientations, which proves (M5). ◻
]

The matching residual orders (A1) and (M5) will identify an integral divisibility quotient as a unit. The transverse test (A3) permits the horizontal divisibilities needed for that step to be lifted back to the integral two-variable ring.

== 9 Local comparisons on horizontal tests of the split determinant <sec:split-local>

We retain the split imaginary field, the moving split primes, and the determinants and measures of Section 8. In particular, for the reducible split-product input, $E$ is non-CM, $E \( bb(Q) \) \[ 2 \] eq.not 0$, $K = bb(Q) \( sqrt(- d) \)$ with $d equiv 7 med \( mod med 16 \)$ prime, and every prime of $2 N$ splits in $K$. The primes $r_i$, their limiting Tate matrix $g$, and $a_(*) = "tr" g eq.not 2$ satisfy the conditions used in (A2)–(A3). Until the rank argument at the center, no hypothesis about analytic rank is imposed.

We first compare local conditions after specializing to a high finite dyadic character. The resulting horizontal divisibility will be returned to the integral two-variable ring; the residual tests then make the quotient a unit. The center arguments are separated into a rank deduction from $s_2 \( E \/ K \) = 1$ and an exact valuation calculation once the product has a simple zero. Finally, we isolate a characteristic-zero Heegner rank test whose proof uses only the derivative identities and reciprocity.

The local logarithm and inert derivative constructions also have a variant for a fixed two-dimensional Hecke component of the Tate module of a modular abelian variety. We state the extra hypotheses where that variant is used, with fixed denominators for its coefficient projector and polarization. The integral unit comparison in this section uses the reducible residual calculations of Section 8.

=== 9.1 Odd local conditions and projected dyadic Kummer lines <odd-local-conditions-and-projected-dyadic-kummer-lines>

Specialize $C_r \( t \, u \)$ at sufficiently high finite $theta$ in $t$; put $Theta = bb(Z)_2 \[ "im" theta \]$, $A_0 = Theta \[ \[ u \] \]$, $A = A_0 \[ 1 \/ 2 \]$, a regular one-dimensional UFD. Denote the limiting twisted coefficient by $M$, with scalar $chi = theta Psi_u$ in stage/limit notation. Work on arithmetic diagrams over $A$; on the measure side denote the analogously 2-inverted integer power-series ring using extended constants (with $cal(V)^(*)$ and fixed finite additional scalars as needed) by $A'$. The conductor depth $m$ of (M2) is fixed throughout any one such varying-prime test. We require $theta$ of order greater than four on dyadic inertia and still nontrivial on inertia over any indicated fixed local extension.

#thm([Lemma 9.1.])[
  (Odd local conditions).  #emph[At the places over the moving primes $r$, the full local complexes are acyclic over $A$. At each fixed odd place $v$, the characteristic-zero unramified condition 
$ U_v = \[ M^(I_v) arrow.r^(upright("Fr")_v - 1) M^(I_v) \] #h(2em) upright("in degrees ") 0 \, 1 $

 contains local $H^0$, injects into local $H^1$, and is exactly complementary to the corresponding condition on the conjugate Tate dual. The product of the singular determinants at the two places over $q in S^compose$ is, up to a unit, 
$ D_q = P_q \( chi \( upright("Fr")_v \) \) P_q \( chi \( upright("Fr")_v \)^(- 1) \) . $

 These factors are nonzero in the present horizontal test.]
] <split-local:odd>

#proof[
  At the places of $r$, use the inertia/residue calculation on limits: a pro-2 tame generator acts with difference $u$ (up to unit); where this vanishes on a residue field, the residue Frobenius and its singular twist have action-minus-one invertible by $r_i arrow.r 1 \, med "tr" g eq.not 2$ and $theta \( upright("Fr")_R \) arrow.r 1$.
  At each fixed odd place $v$, replace the full condition by $U_v$. Its quotient in the full local complex is represented, for cohomology and determinant purposes, by
  $ \[ thin M_(I_v) \( - 1 \) arrow.r M_(I_v) \( - 1 \) thin \] #h(2em) \( 1 \, 2 \) $
  with Frobenius differential. Indeed the scalar is unramified and the Tate inertia differential (after discarding the pro-(prime-to-2) kernel) has constant free invariant and coinvariant spaces after inverting 2. Relative to its degree-zero invariants the inertia cochains have just the singular degree-one space with the cardinality twist. These calculations can be taken first over the fixed local groups at compact precisions before inverting 2, with inflation using lattice invariants, and the descriptions hold also on characteristic-zero field tests over $A$. Thus $U_v$ includes local $H^0$ and injects in $H^1$.
  For the exact complementary conditions on conjugate duals, cup on unramified restrictions factors through unramified cochains (null for the invariant map), and the orthogonality quasi-isomorphism can be checked on residue fields using the displayed dimensions, local duality and the degree-zero invariants. For example the unramified $H^1$ dimension is the full invariant $H^0$ dimension; local Euler characteristic is zero. The product of the two singular determinants over $q in S^compose$ is up to units
  $ D_q = P_q \( chi \( upright("Fr")_v \) \) P_q \( chi \( upright("Fr")_v \)^(- 1) \) \, $
  nonzero here by the Frobenius-exponent choice. For multiplicative reduction the coinvariant line has arithmetic Frobenius $a_q = plus.minus 1$; for additive reduction there is no coinvariant line in characteristic zero. ◻
]

#thm([Lemma 9.2.])[
  (Projected Kummer lines).  #emph[At each $v = w \, macron(w)$ there is a projected Kummer condition $U_v$, a split free line in $H^1 \( K_v \, M \) \[ - 1 \]$ (placed in degree one) mapping into $R Gamma \( K_v \, M \)$, over $A$. Here $H^1 \( K_v \, M \)$ and the full complex refer to the limiting local model; the latter is itself split free of rank two in degree one only. The lines are exactly self-annihilating with conjugate transport and Weil pairing. The same assertion holds for a fixed characteristic-zero Hecke plane of a modular abelian variety, after allowing fixed denominators for the coefficient projector and polarization. It also holds with several conductor variables, provided at least one of their dyadic Frobenius exponents is nonzero. The high finite character must remain nontrivial on inertia after every fixed extension used to obtain semiabelian reduction.]
] <split-local:dyadic-lines>

#proof[
  We construct the lines and prove exact orthogonality before defining their logarithmic coordinates.
  #emph[The local Shapiro tower.]
  Put $F_v = K_v = bb(Q)_2$, and let $D_j \/ F_v$ here denote the unramified extension of degree $2^j$ (field notation at $v$). In the present case the local $theta$-field $P_v \/ F_v$ is cyclic totally ramified. The $u$-action is unramified with Frobenius value $\( 1 + u \)^b$ for $v_2 \( b \) = 1$. Use first the Shapiro scalar
  $ Theta \[ "Gal" \( P_v \/ F_v \) \] \[ \[ "Gal" \( D_oo \/ F_v \) \] \] $
  with tautological character, $1 + s_0$ the Frobenius generator in the unramified factor. Local cohomology is inverse cohomology over $H_j^(upright("loc")) = P_v D_j$ with corestriction. Project the finite factor by $\[ sigma \] mapsto theta \( sigma \)$ (idempotent splitting after inverting 2) and substitute $1 + s_0 = \( 1 + u \)^b$, a finite flat change by Weierstrass or a cyclic-generator change. This computes exactly the desired diagram after these changes: fixed local groups/actions are available by stabilization at each finite precision, and Shapiro, free coefficient models and the fixed projector denominator apply there and in compact inverse limits.
  More generally for several conductor variables unramified at $v$, split $theta$ if needed locally as a totally ramified cyclic-field character $theta_P$ (on $P_v$) times a finite unramified $theta_U$, by the abelian local description. Use the finite factor for $theta_P$, and substitute for $1 + s_0$ the product of $theta_U \( upright("Fr")_v \)$ and the conductor-variable Frobenius powers. Provided some exponent is nonzero, the change is again flat, finite flat after adjoining the other variables.
  #emph[Uniform bounds for logarithmic lattices.] At local finite levels the integral Kummer sequence on $H^1$ with Tate coefficients has ends $cal(A) \( H_j^(upright("loc")) \)_2^and$ and $"Hom"_(bb(Z)_2) \( cal(A)^or \( H_j^(upright("loc")) \)_2^and \, bb(Z)_2 \)$ for the abelian variety $cal(A) = E$, or on full modules before a newform projection; identify via polarization allowing fixed denominators for other varieties. Transitions are norm and dual restriction. Compactness permits exact limits. After finite-character projection the log and dual lattices compare to corresponding additive lattices in the Lie spaces and their trace duals up to #strong[bounded] 2-powers uniformly in $j$, and projected log torsion kernel has bounded exponent (one can use the unnormalized projector). Both $theta_P^(plus.minus 1)$ have this property. Here and below, “bounded” means independent of the unramified degree $2^j$. The constants may depend on the fixed character $theta$, its ramified field $P_v$, the fixed extension used for semiabelian reduction, the abelian variety, and its coefficient projector. Uniformity as $theta$ varies is not needed for these characteristic-zero tests.
  Indeed a uniform small lattice exponentiates by fixed ramification, using a model first over $P_v$, then its unramified extensions.
  For the upper and torsion bounds extend to the compositum with a fixed Galois $L \/ F_v$ of semiabelian reduction. Component exponents there are bounded since after $L P_v$ the extensions are unramified. An inertia element $nu$ over $L$, chosen with $theta_P \( nu \) eq.not 1$, acts trivially on geometric points of the special identity component there.
  To see this last fact one can use the special-fiber maps from the Néron model over $L$. On identity components they are surjective on geometric points: on auxiliary odd-adic Tate modules rationally they identify inertia invariants (Néron reduction over maximal unramified fields is surjective with odd-divisible formal kernel without odd torsion, and components are finite), unchanged under finite base extension by semistable unipotent inertia. Both components are semiabelian by the semistable reduction criterion, so these Tate images suffice for surjectivity. Thus $nu$ indeed fixes the special points by functoriality from $L$.
  After a common component multiple, $\( nu - 1 \)$ of any point therefore enters the formal group, and a uniform further multiple enters the small log range. This proves both upper and torsion bounds on applying the finite projectors (their eigenvalue difference from 1 costs only a fixed denominator). The dual log comparison uses the dual of the torsion-free log lattice, and the different denominator is bounded.
  #emph[Normal bases and free local cohomology.] Now $cal(O)_(H_j^(upright("loc"))) = cal(O)_(P_v) ⊗_(bb(Z)_2) cal(O)_(D_j)$. Use trace-compatible integral normal bases on the unramified tower. More explicitly, choose $beta_0 = 1$ and choose successively $beta_j in cal(O)_(D_j)$ with
  $ "Tr"_(D_j \/ D_(j - 1)) \( beta_j \) = beta_(j - 1) . $
  The unramified trace is surjective, so this is possible. The total trace of $beta_j$ is a unit. Modulo $2$, the trace operator for the cyclic group of order $2^j$ is the top power of its generator minus one. Nonzero total trace therefore makes $overline(beta)_j$ a generator of the residue-field module over the cyclic group algebra. Lifting gives an integral normal basis, and the chosen bases are trace-compatible.
  Use also a rational normal basis on the fixed finite factor. The projected norm-limit Kummer terms on both ends therefore become free via log and its dual after inverting $2$. On the dual end, use the trace-dual lattice; a self-dual normal basis is unnecessary. The transition dual to inclusion is again trace in additive coordinates, and the different of the fixed ramified extension contributes only a fixed denominator. Sandwiching the lattices between fixed multiples is compatible with these limits by compactness.
  Degree zero of the full cohomology upstairs vanishes, and the projected degree-two inverse cohomology vanishes after inverting 2 by local duality and the uniform projected torsion bounds. For an elliptic plane the two free ends have rank one each. The same holds on each Hecke-field plane and differential embedding for its modular abelian variety, by characteristic-zero projection (all projector, isogeny and polarization losses there are fixed). Thus $H^1$ is itself split free with a direct Kummer line: its two free rank-one ends form an exact sequence, and the quotient is projective.
  #emph[Exact orthogonality.] Cup on conjugately paired Kummer lines vanishes, by Shapiro on finite group quotients using ordinary Kummer cups of translates, then on the inverse limits and under the scalar changes. Hence by ranks and perfect local duality this gives exact orthogonality, also on field tests. The restrictions from the split degree-one lines admit isotropy nullhomotopies, so this is an assertion about the local complexes and their comparison triangles, rather than just the dimensions of their generic cohomology. ◻
]

#thm([Lemma 9.3.])[
  (Logarithmic coordinate and finite-level transfer).  #emph[The scalar-extended Kummer line at $w$ has an $A'$-linear isomorphism $lambda_w$ given by weighted logarithms. At finite cyclic quotients of the conductor variables, this line specializes to the usual projected Kummer condition. A sequence of corestricted twisted classes satisfying the finite-level Kummer conditions to growing precision therefore belongs to the limiting Kummer line. For classes arising from global points, $lambda_w$ is the unnormalized character-weighted orbit sum of their logarithms.]
] <split-local:log-transfer>

#proof[
  For $E$ use $log = log_(omega_E)$; more generally on a Hecke plane take a nonzero corresponding differential defined over the coefficient extension. With evaluations in the fixed embedding, $lambda_w$ is the line functional which, before the Frobenius-variable substitution, takes a Shapiro Kummer system at $w$ to the group-ring sums
  $ y_j mapsto sum_(sigma in "Gal" \( P_w D_j \/ F_w \)) theta_P \( sigma \) \( 1 + s_0 \)^(k \( sigma \)) log \( sigma y_j \) med \( mod med \( 1 + s_0 \)^(2^j) - 1 \) \, $
  where $k \( sigma \)$ is the unramified exponent. Extend linearly on coefficients. The convention comes from restricting the character corestriction back up; group multiplication on the Shapiro scalar sends the point-system by the inverse Galois action. These sums respect trace and kill the wrong finite-character components. They are bounded after fixed denominators by the lattice comparison; unramified values may use our completed unramified constants.
  This gives the line isomorphism claimed: for example a small-log generator before projection uses a fixed small factor times the product of a rational normal generator for $P_w$ and the above unramified normal generators. Its evaluation is a nonzero constant times a power-series unit. Indeed the finite cyclic normal resolvent at the embedding is nonzero: after scalar extension, the circulant matrix of a rational normal basis is invertible, and its determinant is the product of the character resolvents. Conjugate coordinates are permuted up to units. The unramified group sum has augmentation $"Tr"_(D_j \/ F_w) \( beta_j \) = 1$ at every finite level, so its inverse limit is a power-series unit.
  #emph[Specialization and membership.] We explain how this comparison detects membership and logarithms on transferred arithmetic classes. At simultaneous cyclic group quotients of order $2^k$ in the conductor variables with at least one Frobenius exponent nonzero at 2, the unramified substitution uses cyclic order $2^(k - min v_2 \( b_j \))$ for large $k$, $b_j$ the exponents. It is from the corresponding group ring by free scalar extension there (coset bases, and rescaling by the fixed $theta_U$ factor if present). The Kummer line specializes, after inverting 2, exactly to the corresponding projected Kummer conditions at those finite levels: use the trace-compatible small-log generators above and ordinary Kummer dimensions under Shapiro.
  Suppose as here the stage base ring class fields for $2^m$ and the tame conductor together locally contain $P_v D_n$ for every fixed $n$ on large stage sets. This follows from containing the $theta$-field and the increasing unramified layers by the Frobenius condition. A corestricted twisted class locally Kummer at the stages up to growing precision then lies in $U_v$ in the test. Indeed at each fixed cyclic quotient its localization is obtained by first norming to these fixed fields by transitivity (and summing the several local terms, with group translates/weights). Thus it specializes into finite-level projected Kummer by the fixed-group comparisons, closedness and congruences at growing coefficient precision there.
  Vanishing in the complementary quotient of $H^1$ is detected on all such finite group quotients (bounded power series, clearing fixed denominators).
  #emph[Compatibility with point logarithms.] For an un-differenced class from global points this also computes its $lambda_w$-value by the unnormalized full orbit sum of logs with character weights. Grouping as above uses actual trace logs in a fixed local extension at each fixed quotient; Kummer congruences at growing precision imply log congruences there, so even the limit into $cal(V)^(*)$ with fixed extensions agrees with the indicated evaluation. Every projection used here has a fixed denominator. The orbit sums are unnormalized throughout, including as the cyclic quotients increase. ◻
]

#thm([Lemma 9.4.])[
  (The unramified center).  #emph[Set $t = 0$ and localize, after inverting $2$, at the tame center $\( u \)$. At both dyadic places the full local complex again has a direct Kummer line and a complementary quotient line in degree one. They specialize to the ordinary Kummer condition and its quotient at $u = 0$. After the same measure-side scalar extension used for $lambda_w$, the weighted logarithm is a line isomorphism over the center local ring, and the transfer and membership assertions of Lemma 65 hold there. These assertions require no ramified-character hypothesis.]
] <split-local:unramified-center>

#proof[
  Use just the unramified Shapiro tower. A uniform polynomial in its Frobenius action with value nonzero at 1, times a fixed scalar, now bounds the log comparison in both directions and kills the possibly unbounded reduction torsion. Indeed first use the component order, which is bounded under unramified Néron base change. On the special identity component, the abelian Frobenius polynomial annihilates the abelian part; its roots have complex absolute value $sqrt(2)$. For a torus split over a residue extension of degree $e$, one may use $F^e - 2^e$; the unipotent part is killed by a fixed power of $2$. For an elliptic curve these are respectively the good-reduction Frobenius polynomial, the toric polynomial, and the scalar $2$ in the additive case. Multiplying the relevant factors and, if necessary, another fixed scalar gives a polynomial $Q \( F \)$ with $Q \( 1 \) eq.not 0$. None of the Frobenius polynomial factors has a root-of-unity zero. This enters the formal group, and a further fixed scalar enters the small formal log lattice at all levels.
  Thus the map from a fixed small additive lattice by exponentiation, compatible with norm and inclusion, has cokernel killed by such a bound, as does the dual comparison with the opposite action; degree-two projected cohomology is controlled by the same torsion bound. For general varieties likewise use the abelian Frobenius polynomial, the torus Frobenius relation and a characteristic power on the unipotent part.
  After localizing (Frobenius corresponds to the unramified group generator or its inverse) we again have exact Kummer/quotient lines on the plane, specializing to ordinary Kummer and quotient at the center by small-log normal generators. Weighted log is a line isomorphism there, and finite-level transfer and membership work as above after first multiplying by the Frobenius polynomial bound (which is invertible at the center). All the bounds canceled in this argument are units at the characteristic-zero center. The assertion is consequently local near that center; it does not assert an unramified logarithmic isomorphism over the entire power-series ring. ◻
]

=== 9.2 The inert derivative identities <the-inert-derivative-identities>

Here is the derivative used on the characteristic-zero test just described. We detail the point and descent part in a form we can also use on a weight-two primitive Hecke plane with trivial nebentypus. There work first with points and full two-Tate coefficients on an actual modular abelian factor $cal(A)$ for the newform orbit, then make coefficient projections in characteristic zero. Parametrization maps, Hecke order choices, polarizations or other fixed changes to commensurable lattices can use fixed denominators, always with a #emph[common] scale for the points being compared. For instance we can use an actual Hecke-stable abelian subvariety and multiply the orbit projector into it by an integer. Write $a_ell$ for the good Hecke endomorphism/scalar. One can compute with the integral good Hecke action before making further isogeny/lattice changes. For our current problem simply take $cal(A) = E$.

Use here lower base fields $H_(b_i)$, $b_i = 2^m r_i$, base points as in (M2) with one fixed orientation and original primitive level, and scalar weights $chi$ factoring through these fields at each working precision. The point construction works also for base conductor one and more generally the products of a fixed dyadic conductor with prime-to-level moving tame conductors as above, with fields of units just signs (i.e. $cal(O)_K^times = { plus.minus 1 }$), keeping any indicated other fixed Kummer places away from the moving conductors. Add finitely many sequences of fresh rational primes $ell = ell_i$ inert in $K$, avoiding level, conductors and all already used primes at the stages. Take local Frobenius lifts over $bb(Q)$ denoted $gamma = gamma_i$. In each sequence require

$ ell arrow.r - 1 \, #h(2em) a_ell arrow.r 0 \, #h(2em) rho \( gamma \) arrow.r J \, #h(2em) J^2 = 1 \, $

at dyadic precisions in the ultrafilter, using the #strong[full] Tate of $cal(A)$ for the divisibilities and Frobenius-square closeness. (We also write $J$ for the induced matrix on a plane in use; it may depend on the sequence of primes.) We will in particular choose $J = rho \( tau \)$ for complex conjugation $tau$ in the present problem.

We can slow working precisions so that $2^(a + 1) divides ell + 1$, $a_ell$ is divisible by $2^a$ as an endomorphism, and $gamma^2$ is trivial on $cal(A) \[ 2^a \]$, with $a$ cofinal. In the complex-conjugation approximation on the full newform factor the trace condition holds on all the Hecke field components (complex conjugation is odd and an involution). High enough divisibility in the maximal order at 2 gives the stated divisibility in the good Hecke order by a fixed index bound.

#thm([Lemma 9.5.])[
  (The finite and transverse planes).  #emph[At an auxiliary inert prime satisfying the preceding full-Tate approximation conditions, the limiting local complex has split free cohomology 
$ M \, #h(2em) M xor M \, #h(2em) M quad upright("in degrees ") 0 \, 1 \, 2 . $

 Here $M$ denotes the underlying coefficient plane. The finite and transverse conditions have complementary pure degree-one coordinates, both include degree zero, and both omit degree two. They are exactly self-annihilating for conjugate duality. Their mixed pairing is, up to a unit, $chevron.l x \, J y chevron.r$, where $chevron.l med \, med chevron.r$ is the alternating Tate pairing. The corresponding lower and upper conditions have the exact complementary dualities required for the square switch.]
] <split-local:inert-planes>

#proof[
  Write $f_(upright("loc")) \( z \) = z \( gamma^2 \)$, $s_(upright("loc")) \( z \) = z \( sigma_ell \)$ in limiting degree one at this new place of $K$, for an inertia element $sigma_ell$ generating tame 2-inertia (in its pro-2 quotient) and the whole relative ring-class inertia of order $ell + 1$ to be used at $ell$. The prime $\( ell \)$ splits completely in the prime-to-$ell$ lower conductor fields by the principal ideal/order criterion, so the base scalar character is trivial there.
  Also $gamma^2$ acts trivially on #emph[all] the ring class fields of $K$, even at upper conductor, by generalized dihedral action.
  In the limit the full local complex is split with free cohomology $M \, M xor M \, M$ in degrees 0,1,2, with the indicated degree-one coordinates (here $M$ in the local coordinates means the underlying coefficient plane). Indeed discard prime-to-2 inertia kernel as in the local calculations; action is trivial locally modulo increasing precision and the tame conjugating power $ell^2$ tends to 1. Thus the inertia/residue cohomology or procyclic resolutions give the free coordinates, with zero differentials in the limit. Unramified inflation is the finite plane ($s_(upright("loc")) = 0$); the transverse plane uses $f_(upright("loc")) = 0$, including degree zero and omitting degree two as for the finite plane. They fit the lower/upper comparisons in the square switch.
  In particular under conjugate transport the pure planes are self-annihilating, and the cross pairing is, up to a unit, $chevron.l x \, J y chevron.r$ by the Tate alternating plane form. Indeed the pure scalar cups are zero as in the local calculation following the square switch, and the mixed scalar cup is a unit. Transport at the place can use $gamma$ instead of global conjugation by the inner identification on the cochains; it fixes the Frobenius argument, and changes the tame argument by the $ell^(plus.minus 1)$-power; on coefficients there is the Tate transport with possible scalar character unit. This yields exact complementary dualities also for lower/upper and their triangles (with split local comparisons); for untwisted coefficients one also has the ordinary nonconjugated version with pairing $chevron.l x \, y chevron.r$. For $T_2 E$ use the unimodular integral plane form, and after inverting 2 any fixed constant plane-form normalization on a characteristic-zero polarized Hecke component costs only units in horizontal valuations. The local identity itself below does not require inverting $2$ in the Tate limit. ◻
]

#thm([Lemma 9.6.])[
  (CM derivatives and uniform descent).  #emph[For a finite collection of auxiliary inert prime sequences satisfying the full-Tate approximation conditions, choose the CM points compatibly over their conductor-product ring class fields. After multiplication by one common nonzero integer $L$, their derivative Kummer classes descend to the lower conductor fields to arbitrarily high retained $2$-power precision. They satisfy Kummer conditions at the fixed places over $2 N$, and unramified conditions at the fixed odd places after a further common component multiple. The same construction applies to a fixed modular abelian factor before characteristic-zero coefficient projection.]
] <split-local:descent>

#proof[
  #emph[The conductor-product system.] For a subset $I$ of switched primes at a stage, use CM points with conductor $b_i product_(ell in I) ell$, obtained by simultaneous product quotients of the base point by one descending isogeny at each $ell$, transporting the level. These choices can extend the previous ones when adding a switch. They are defined over the corresponding upper ring class fields by CM reciprocity: the order changes as stated at the new inert primes, transported level still has stabilizer containing the completed order units. The relative groups over $H_(b_i)$ are products of independent cyclic inertia groups of orders $ell + 1$; this is the order class exact sequence and Chinese remaindering, using the unit hypothesis. In particular choose the above generators independently from inertia, acting trivially on the fields with $ell$ omitted.
  At an upper and omit-$ell$ lower pair of points $Y \, X$ respectively in $cal(A)$, one has
  $ upright("Tr")_ell Y = a_ell X \, #h(2em) tilde(Y) = F_ell tilde(X) \, $
  where the first formula if needed is after killing fixed cuspidal torsion, tilde is good reduction at the chosen prime, and $F_ell$ is arithmetic residue Frobenius.
  These identities work for all matching translates. The trace traverses all the cyclic lines in the good Hecke correspondence, since $ell$ is inert and prime to lower conductor. Reduction below is supersingular; all the degree-$ell$ quotients there reduce via Frobenius with the transported prime-to-$ell$ data. This gives the second relation at the modular point and hence on the abelian image (avoid any fixed primes of bad models/maps). Use maps based at a rational cusp. Also $F_ell^2 - a_ell F_ell + ell = 0$ on the abelian factor of good reduction by the good Eichler–Shimura relation (it can be checked on the rational Tate realization).
  #emph[Derivative operators and global descent.] Use
  $ D_I = product_(ell in I) D_ell \, #h(2em) D_ell = sum_(j = 1)^ell j sigma_ell^j . $
  The Kummer of the upper point acted on by $D_I$, modulo $2^a$ after a common cusp/point multiplier, is invariant relatively by $\( sigma_ell - 1 \) D_ell = ell + 1 - upright("Tr")_ell$ and the divisibilities.
  A further uniform multiple descends it to $H_(b_i)$ in cohomology. Indeed $cal(A) \[ 2^oo \]$ invariants over these upper fields have bounded exponent. Take an element $h in G_K$ acting by a near-one scalar with square not one on $T_2 cal(A)$ by Bogomolov’s homothety theorem for an abelian variety over a number field [6]. If the scalar is $c$, then $h tau h tau$ acts by $c^2$ on the full Tate module. It fixes every ring class field: the image of $tau h tau$ is the inverse of the image of $h$ in every ring class quotient. Consequently $c^2 - 1$ kills all the $2$-power torsion defined over any of the upper fields. Its valuation is fixed, giving the required uniform exponent bound.
  In inflation–restriction, both the obstruction to descending a relatively invariant Kummer class and the ambiguity of its descent have coefficients in these torsion invariants. They are therefore killed by a fixed power of $2$. Multiplying by that power gives descent; reducing the coefficient precision by a further fixed amount removes its ambiguity. The resulting retained precision still tends to infinity. These losses are independent of the moving primes and are absorbed into the common point multiplier.
  #emph[Descent at the fixed places.] At $2 N$ the upper extension for these derivatives is unramified relative to the base, with base component exponents uniformly bounded. In fact the ring class fields for the conductor products are composita over the Hilbert field by the same order class description; at 2 the base is thus unramified above a fixed ramification field (fixed $m$), and at fixed prime-to-conductor odd support the base itself is unramified over $K$. Use unramified Néron base change.
  The kernel on local Weil–Châtelet in unramified descent is killed by the component group order: for connected points the cyclic unramified $H^1$ vanishes by Lang on the reduction and the induced additive successive quotients on the formal kernel (unramified residue normal bases, then passage up the complete filtration). Thus a uniform additional multiple ensures the local Kummer condition modulo $2^a$ on the base there. At fixed odd places as above another component multiple gives unramified Kummer by 2-divisibility of connected points over the maximal unramified field and lifting.
  At good places outside allowed support and all derivative primes, the descended class is already unramified since inertia doesn’t change going upstairs and prime-to-residue Kummer there is unramified. Use a common multiplier $L eq.not 0$ incorporating the fixed losses. Across further switches the bounds allow common scales. If a scale is enlarged, it is enlarged on all classes in the same comparison. Thus each matched derivative relation uses the same $L$ on its two sides. For a fixed finite sequence of switches, all losses can be incorporated in one such nonzero $L$. ◻
]

After descent, weight-corestrict to $K$ with $chi$, and transfer by the finite models, giving classes $Z_I$. The weights are the unnormalized character-corestriction weights fixed above.

#thm([Proposition 9.7.])[
  (Inert derivative identity).  #emph[Fix a finite collection of auxiliary inert prime sequences satisfying the full-Tate approximation conditions above Lemma 67. Over the lower conductor fields $H_(b_i)$, form the compatible CM points and derivative operators $D_I$ of Lemma 68, using its common nonzero multiplier $L$ for this collection. Let $Z_I$ be their descended, $chi$-weighted corestrictions to $K$, transferred to the limiting coefficient model. In the finite and singular coordinates $f_(upright("loc")) \, s_(upright("loc"))$ of Lemma 67, at a newly switched prime $ell in.not I$ one has 
#[#set math.equation(numbering: n => "(K)")
 $ s_(upright("loc")) \( Z_(I union { ell }) \) = J f_(upright("loc")) \( Z_I \) \, #h(2em) f_(upright("loc")) \( Z_(I union { ell }) \) = 0 \, $ <eq:K>]

 and the transverse condition in the second identity holds at every switched prime. The identities persist after any fixed equivariant projection onto a Hecke plane, with its denominators absorbed in the common $L$.]
] <split-local:derivative>

#proof[
  #emph[The singular coordinate.] Check the identities before corestriction. Apply the other derivatives to $Y \, X$ first and keep the notation; the matching trace and reduction relations still hold. Choose divisions
  $ 2^a Q = L X \, #h(2em) 2^a Z = L D_ell Y $
  so the respective descended cocycles restrict to their Kummer coboundary expressions upstairs (absorb changes by a torsion coboundary). Thus the finite evaluation below at $gamma^2$ reduces to $\( F_ell^2 - 1 \) tilde(Q)$. Write $b$ for the upper descended cocycle on $G_(H_(b_i))$. Then
  $ U = \( sigma_ell - 1 \) Z - b \( sigma_ell \) $
  is fixed by the upper-field subgroup. Indeed, for an element $g$ of that subgroup, normality gives $sigma_ell^(- 1) g sigma_ell$ in the same subgroup, and the cocycle identities together with $b \( g \) = \( g - 1 \) Z$ yield $g U = U$.
  Multiplication by $2^a$ gives
  $ 2^a U = L #scale(x: 120%, y: 120%)[\(] \( ell + 1 \) Y - a_ell X #scale(x: 120%, y: 120%)[\)] . $
  The endomorphism divisibilities ensure that
  $ L (frac(ell + 1, 2^a) Y - a_ell / 2^a X) $
  is itself an upper-field point. Its difference from $U$ is $2^a$-torsion defined over that field, whose exponent is bounded by Lemma 68. Inertia acts trivially in reduction. Hence $b \( sigma_ell \)$ reduces, ignoring bounded-exponent torsion, to
  $ \( a_ell - \( ell + 1 \) F_ell \) tilde(Q) = \( F_ell - a_ell \) \( F_ell^2 - 1 \) tilde(Q) . $
  The equality follows directly from the Eichler–Shimura polynomial:
  $ \( F_ell - a_ell \) \( F_ell^2 - 1 \) = F_ell \( F_ell^2 - a_ell F_ell \) - F_ell + a_ell = a_ell - \( ell + 1 \) F_ell . $
  Projection to the retained precision kills the bounded-exponent errors. Prime-to-$ell$ torsion injects under good reduction, so the reduction computation determines the Tate coordinate. Since $F_ell - a_ell$ tends to $J$, it gives the first identity in (K).
  #emph[The transverse condition.] For the other identity $b \( gamma^2 \)$ reduces to $\( F_ell^2 - 1 \) tilde(Z)$, and $accent(L D_ell Y, ̃) = L ell \( ell + 1 \) F_ell tilde(X) \/ 2$, with $F_ell^2 tilde(X) = tilde(X)$. Because $2^(a + 1) divides ell + 1$, an $F_ell^2$-fixed $2^a$-division of this reduced point is explicitly
  $ L frac(ell \( ell + 1 \), 2^(a + 1)) F_ell tilde(X) . $
  Any other division differs from it by $2^a$-torsion. The imposed Frobenius-square condition makes $F_ell^2 - 1$ kill that ambiguity to the retained precision. Hence the finite coordinate of the derived class vanishes.
  These calculations work on every translate from the base group over $K$ (commuting on the points with the relative action), before summing with character weights. Local actions make the coboundary choices in the coordinates immaterial to retained precision. This proves (K). Repeating the calculation at an earlier switched prime, with all the other derivative operators already applied, gives the same vanishing there. A fixed equivariant change to a projected coefficient commutes with the calculation; its denominators are cleared in the common $L$.
  Old cochains/classes in successive comparisons can always be used by unramified inflation and reduction to slower precisions; (K) only uses the matched restrictions of the descended classes. ◻
]

#thm([Corollary 9.8.])[
  (Selmer membership and the logarithmic comparison).  #emph[For the horizontal test currently considered the $Z_I$ over $A$ lie in the Selmer problems with $U_v$ at $2 N$, full at $r$, and the switched planes as indicated (finite at additional unswitched derivative places). For $Z = Z_diameter$, their logarithmic comparison with the paired measure is 
#[#set math.equation(numbering: n => "(B1)")
 $ B_r \( theta \, u \) = epsilon.alt thin lambda_w \( "loc"_w Z \)^2 product_(q in S^compose) D_q \, #h(2em) epsilon.alt in \( A' \)^times . $ <eq:B1>]

]
] <split-local:point-measure>

#proof[
  Corestriction preserves the unramification just checked away from dyadic and moving support. At odd bad places the inertia restriction class vanishes at every compact precision, hence in the local model (inertia cochains here can be taken on the fixed group; no inverse-limit obstruction from the finite invariants); use inflation.
  At 2 use the finite-level Kummer membership check in the preceding local comparisons. Thus the global classes lift, uniquely in degree one since the maps of the conditions include $H^0$ and inject in degree one.
  For $Z = Z_diameter$, the logarithm comparison of Lemma 65, together with (M2) in both orientations, gives (B1).
  The Shapiro weights evaluate the full $L$-scaled class sums, the opposite primitive-level orientation differs by Atkin–Lehner and a translation, and the Gauss sums, $c_E \, L$ are fixed nonzero constants with 2 inverted. The two Euler translations at each odd prime multiply exactly with the conjugate arguments. The bounded logarithmic lattice comparisons justify all these limits while retaining the unnormalized sums over the varying class groups. ◻
]

=== 9.3 Horizontal divisibility and the integral unit quotient <horizontal-divisibility-and-the-integral-unit-quotient>

#thm([Proposition 9.9.])[
  (The horizontal determinant inequality).  #emph[For a sufficiently high finite character $theta$, suppose $B_r \( theta \, u \) eq.not 0$. Impose the unramified conditions $U_v$ at the fixed odd places and the Kummer conditions at both dyadic places, and call the resulting Selmer complex $C_F$. Let $Z = Z_diameter$ and write $"loc"_w Z = p_0 e$ for a basis $e$ of the Kummer line over $A$. Put 
$ L_(upright("prim")) = frac(L_(upright(a l g \, r)) \( theta \, u \), product_(q in S^compose) D_q) . $

 At every height-one valuation $v$ of $A$, the complex has generic cohomology of rank one in each of degrees one and two, and 
#[#set math.equation(numbering: n => "(D2)")
 $ d \( C_F \, \( Z \, Z^or \) \) = 2 v \( p_0 \) - v \( L_(upright("prim")) \) gt.eq 0 . $ <eq:D2>]

 The same conclusion holds for the Hecke-plane variant provided its strict determinant is nonzero, its point-measure and local comparisons satisfy the same hypotheses, its restriction to $G_K$ is absolutely irreducible, and the stated high-character condition holds.]
] <split-local:horizontal>

#proof[
  #emph[The strict comparison.] Take the high-$theta$ test over $A$ as above; $L_(upright(a l g \, r)) \( theta \, u \) eq.not 0$ by (A3). First replace the odd bad full conditions by $U_v$ there, still using strict at $w$, full at $macron(w)$; this strict problem is generically acyclic since the removed singular blocks are. Put
  $ L_(upright("prim")) = L_(upright(a l g \, r)) \( theta \, u \) #scale(x: 180%, y: 180%)[\/] product_(q in S^compose) D_q . $
  Thus at each height-one DVR of $A$ the strict problem has $d \( - \, 1 \) = - v \( L_(upright("prim")) \)$. Now write $C_F$ for the problem using $U_v$ also at both dyadic places. If $B_r \( theta \, u \) eq.not 0$, (B1) gives nonzero localization of $Z$; writing $"loc"_w Z = p_0 e$ for an $A$-basis $e$ on that Kummer line, (D) applies by the local comparisons. Thus $C_F$ has generic ranks one and one, and (D) gives the equality in (D2).
  #emph[Detecting two independent fiber classes.] We prove nonnegativity at every such DVR by the square-switch test of Section 3, using (K). At the generic and DVR-fiber fields all Selmer degree-one spaces used in the square switch inject into unrestricted degree one and thus into abstract crossed classes on $cal(G)_K = product_i G_K$ by the evaluation lemma. Global invariants are zero and so are the Selmer degree zeros. Exact duality using conjugate transport gives amplitude in degrees 1 and 2; this works also on the paired lower and upper conditions at the extra inert places described above (old diagrams identified via unramified inflation).
  In detail let $k_0$ be the fiber field at this DVR. At a step with old finite condition, degree-one generic rank one and nonzero generic derived point class $Y = Z_I$, suppose $H^1$ on the fiber has dimension $> 1$. Take two independent classes there including a primitive reduction from the generic line in the two-term model. Use Shapiro also abstractly into the induction on $cal(G) = cal(G)_K times.r chevron.l tau chevron.r$, with diagonal conjugation. The two $M$-planes of the induction over $cal(G)_K$ are absolutely simple: already constant $G_K$ sequences act on Tate via the absolutely irreducible representation (non-CM open image), up to the scalar twists. Their determinants are unequal: the two summands have scalar twists $chi$ and $chi^(- 1)$, and equality of their determinants would force $chi^4 = 1$, contrary to the high dyadic inertia condition. The involution $tau$ exchanges these nonisomorphic absolutely simple summands, so the induction is itself absolutely simple. This check works just the same given Tate absolute simplicity over $K$ on a Hecke plane and the stated high-character condition. For a non-CM elliptic curve the required characteristic-zero absolute simplicity follows from the open image theorem [54].
  Take the product kernel $cal(H)$ of all termwise full Tate and ring class actions within $cal(G)_K$, normal also under $tau$. Restriction detects the crossed classes since the constant element $h tau h tau$ used in the descent is central modulo $cal(H)$ and acts by a scalar whose difference from 1 is invertible here. Thus joint evaluations of the two classes on $cal(H)$ span two copies of the induction by the simple-module evaluation test. On $\( tau eta \)^2$ for $eta in cal(H)$ these evaluations are additive in $eta$, given by $1 + tau$ on the evaluations at $eta$. Projection back to the original summand over $cal(G)_K$ consequently still spans its two copies. Some $eta$ gives rank two there, by the quadratic determinant test.
  #emph[A switch preserving the determinant valuation.] By Chebotarev choose new good inert primes with $gamma_i$ agreeing with $tau eta_i$ to the required increasing precisions on the previous evaluation data and full Tate actions. Then $J = rho \( tau \)$, and in the old problem inflated to the new finite plane the $f_(upright("loc"))$ evaluation is exactly the above test on the fiber. Hence its rank there is two; it is nonzero also generically (use the primitive class) and so tests $Y$ generically nontrivially.
  The new derivative class belongs to the transverse problem and gives exactly (K), with previous plane conditions retained. The compatible square switch comparison now preserves the class-functional valuation at this DVR and cuts fiber dimension by two, retaining generic rank one and a nonzero class there. Continue on the same ultrafilter. At each step the fiber dimension drops by two, whereas the nonzero generic class persists, so the dimension remains at least one. After finitely many steps there is no surplus and both degree-one and degree-two fiber dimensions are one.
  For completeness, at this terminal DVR the minimal model has one free term in each of degrees one and two. The generic cohomology is also one-dimensional in each degree, so its differential is zero. Exact self-duality identifies these two free cohomology lines as integral duals. The terminal derived class is integral, hence its class-functional tensor has nonnegative valuation. The square-switch equalities carry that valuation back to $\( Z \, Z^or \)$. All common fixed-scale multipliers are units in the horizontal DVR, since $2$ has been inverted. This proves (D2). ◻
]

#thm([Corollary 9.10.])[
  (Integral unit comparison).  #emph[For the reducible split-product construction, 
$ B_r = L_(upright(a l g \, r)) thin U_r \, #h(2em) U_r in cal(V)^(*) \[ \[ t \, u \] \]^times . $

 Likewise $B \/ L_(upright("alg")) \( C \( t \) \)$ is a unit in $cal(V)^(*) \[ \[ t \] \]$.]
] <split-local:unit>

#proof[
  For each sufficiently high $theta$ with $B_r \( theta \, u \) eq.not 0$, Proposition 71 gives $p_0^2 \/ L_(upright("prim")) in A$ by the height-one valuation criterion in the regular UFD $A$. By (B1) and the logarithmic line isomorphism,
  $ B_r \( theta \, u \) in L_(upright(a l g \, r)) \( theta \, u \) A' . $
  This is automatic if $B_r \( theta \, u \) = 0$. Weierstrass division in $u$ using (A3) and the high-character remainder test therefore prove
  $ B_r in L_(upright(a l g \, r)) thin cal(V)^(*) \[ \[ t \, u \] \] $
  integrally. By (M4) and (A2) at $u = 0$, cancelling the same nonzero $\( a_(*) - 2 \)^2$, $B$ is likewise divisible by $L_(upright("alg")) \( C \( t \) \)$. By (M5) and (A1), the reductions modulo $2$ of its numerator and denominator have the same finite order in $t$. Their integral quotient therefore has nonzero constant coefficient modulo $2$, and is a unit. More explicitly, specializing the two-variable quotient at $u = 0$, relations (M4) and (A2) identify it with $B \/ L_(upright("alg")) \( C \( t \) \)$ up to an integral unit, after cancellation of the same nonzero factor $\( a_(*) - 2 \)^2$. Thus its specialization at $u = 0$ is a unit. Its constant coefficient at $\( t \, u \) = \( 0 \, 0 \)$ is consequently a unit, proving that $B_r \/ L_(upright(a l g \, r))$ is already a unit in the two-variable ring. ◻
]

=== 9.4 The center: rank detection and the exact arithmetic factor <the-center-rank-detection-and-the-exact-arithmetic-factor>

#thm([Proposition 9.11.])[
  (Rank detection from Selmer corank one).  #emph[Under the hypotheses of Proposition 53, assume $s_2 \( E \/ K \) = 1$. The conductor-one Hilbert trace $P$ in (M3) is nontorsion. Consequently $L \( E \/ K \, s \)$ has a simple zero at $s = 1$.]
] <split-local:center-rank>

#proof[
  We work at $t = 0$, retaining the tame variable $u$. The nonvanishing of the specialization of a Selmer generator is part of the argument, so no central localization hypothesis is imposed. Localize on that tame line at the $\( u \)$-DVR after inverting 2 (and similarly for extended coefficients on the measure side, still testing order in $u$). Both series there are nonzero by (A3) and the unit equality. The odd fixed-place complexes are contractible near this test center: at $u = 0$ they vanish by local duality, the odd-place Euler formula and absence of rational Tate invariants. The added $r$-places likewise vanish by construction ($2 - a_(*) eq.not 0$). At $2$ use Lemma 66, which supplies the Kummer lines and logarithmic isomorphism at the center DVR. Let $C_F$ now use these two Kummer conditions, and $Z \( u \)$ be the global Kummer class by weighted traces of the conductor-$r_i$ CM points (disk centers, original level); it belongs to those conditions. The $t = 0$ measure formula following (M2) gives there
  $ B_r \( 0 \, u \) = upright("unit") dot.op lambda_w \( "loc"_w Z \( u \) \)^2 . $
  Indeed this is the disk-center logarithm with both orientations as before, retaining additional connected-2 Euler translations, all Euler factors units at this DVR by their values at $u = 0$. For taking the limit of the weighted logs one may first multiply by the polynomial bound of the unramified comparison, evaluated on the group power translating by Frobenius (or its inverse as appropriate). This moves the actual log points into uniformly bounded lattices and specializes to a nonzero scalar at the center. At each fixed cyclic quotient the resulting sums agree in the limit with the line-functional values by corestricting first to the fixed unramified levels, as in the local membership and log checks. Thus one cancels only units of this DVR in asserting the identity.
  #emph[The two free central cohomology lines.] Strict generic acyclicity, the nonzero logarithm, and (D) again apply. They now give generic ranks one and one for $C_F$ and $d \( C_F \, \( Z \( u \) \, Z \( u \)^or \) \) = 0$, by the unit quotient and the log isomorphism.
  The special fiber is also of ranks one and one only: the two lines specialize to usual Kummer; the new allowed $r$-places at $u = t = 0$ cause no characteristic-zero change by unramified inflation and local acyclicity. We therefore have the actual ordinary rational Selmer in degree one by fixed-diagram comparison, so use $s_2 \( E \/ K \) = 1$ and duality. Let $R$ denote this characteristic-zero $\( u \)$-DVR. Its special fiber has just one cohomology line in each of degrees one and two. A minimal free model for $C_F$ over $R$ therefore has the form
  $ \[ thin R arrow.r^delta R thin \] #h(2em) upright("in degrees ") 1 \, 2 . $
  The generic cohomology already has rank one in both degrees, which forces $delta = 0$. Hence both cohomology groups are free lines over $R$, paired perfectly by the integral duality over $R$.
  Choose a generator $y$ of the degree-one line and write $Z \( u \) = a \( u \) y$, with $a \( u \) in R$. The class-functional determinant tensor then has valuation $2 v_u \( a \( u \) \)$: the two free lines are integral duals and $y$ has unit determinant volume. Its valuation is zero by the unit comparison. Thus $a \( u \)$ is a unit, and
  $ Z \( 0 \) eq.not 0 . $
  This establishes nonvanishing in global cohomology at the specialization from the Selmer-corank hypothesis.
  The specialized class $Z \( 0 \)$ is $\( a_(*) - 2 \)$ times the Kummer of the Hilbert trace $P$ of (M3), up to any common point multiplier used: at the stages trace over the order-$r_i$ layer gives the good Hecke trace less the two horizontal translates before the Hilbert sum; cuspidal torsion is harmless. These are equalities via inflation of the true old classes at constant coefficients, so pass by the finite diagrams. The factor $a_(*) - 2$ and the common point multiplier are nonzero in characteristic zero. It follows that $P$ is nontorsion. Formula (GZ-E), with the split twist sign, now shows that the product has a simple zero [27,15]. ◻
]

#thm([Proposition 9.12.])[
  (The exact factor at the center).  #emph[In the reducible split-product setting, assume that $L \( E \/ K \, s \)$ has a simple zero at $1$, either as a hypothesis or by Proposition 73. Then 
$ X \( E \) + X \( E^(- d) \) = 0 . $

 In the notation of (Kum), the exact arithmetic identity producing this equality is 
#[#set math.equation(numbering: n => "(E)")
 $ 2 \( n_P + tau_g \) = 2 v_2 \( c_E \) + 2 sum_ell v_2 \( c_ell \) + s_K . $ <eq:E>]

]
] <split-local:exact-factor>

#proof[
  Compute at the one-variable center $C \( t \) \|_(t = 0)$. Here we have rank one and finite Tate–Shafarevich over $K$ by classical Gross–Zagier–Kolyvagin and the quadratic isogeny [27,33], with $P$ spanning and having nonzero local log.
  Impose integral Kummer $U_v$ at odd places of the support first, keeping strict/full at $w \, macron(w)$; denote the resulting complex by $C_(*)$. This is rationally acyclic by the converse line comparison of (D) with all-Kummer. Thus $C \( 0 \)$ is rationally acyclic too by local duality at the added full places.
  Use $v = v_2$, $n_P \, tau_g \, s_K \, l \, tau_ell$ as for (Kum) and the Haar comparisons (in particular $s_K = v_2 \( \# "Sha" \( E \/ K \) \)$). At $w$ a degree-one free basis with log $2^l$ has $d \( U_w \, e \) = tau_2$. At each odd place over $q divides N$, the full-place quotient is the shifted dual of integral Kummer with only degree-two torsion of length $tau_q$. Thus
  $ d \( C_(*) \, 1 \) & = 2 n_P + 2 tau_g - s_K - 2 #scale(x: 120%, y: 120%)[\(] v \( log_(omega_E) P \) - l + tau_2 #scale(x: 120%, y: 120%)[\)] \,\
- v \( L_(upright("alg")) \( C \) \( 0 \) \) & = d \( C \( 0 \) \, 1 \) = d \( C_(*) \, 1 \) - 2 sum_(q in S^compose) tau_q \, $
  by (D), (Kum) and the comparison triangles. The integral unit quotient in Corollary 72 specializes at $t = 0$, so
  $ v \( L_(upright("alg")) \( C \) \( 0 \) \) = v \( B \( 0 \) \) . $
  Formula (M3) evaluates the right-hand side as
  $ v \( B \( 0 \) \) = - 2 v \( c_E \) + 2 v \( log_(omega_E) P \) + 2 sum_(ell divides 2 N) v \( P_ell \( 1 \) \) . $
  Combining the displayed determinant comparisons with this equality cancels the two logarithm valuations and yields
  $ 2 \( n_P + tau_g \) = s_K + 2 v \( c_E \) + 2 \( tau_2 - l \) + 2 sum_(q in S^compose) tau_q - 2 sum_(ell divides 2 N) v \( P_ell \( 1 \) \) . $
  The Haar identities
  $ tau_2 - l = v \( c_2 \) + v \( P_2 \( 1 \) \) \, #h(2em) tau_q = v \( c_q \) + v \( P_q \( 1 \) \) quad \( q eq.not 2 \) $
  cancel every Euler factor and give exactly (E). The two places of $K$ above each odd support prime account for the factor $2$ in the singular determinant contribution; the dyadic Kummer volume retains $tau_2 - l$.
  Finally, $n_P$ is the index valuation in the full free Mordell–Weil lattice and $tau_g$ records its torsion. Therefore
  $ n_P + tau_g = v \( \[ E \( K \) : bb(Z) P \] \) \, $
  and (G) identifies (E) with $X \( E \) + X \( E^(- d) \) = 0$. Together with Proposition 73, this proves Proposition 53. ◻
]

=== 9.5 A characteristic-zero Heegner rank test <a-characteristic-zero-heegner-rank-test>

The next result supplies the low analytic rank Selmer input on the Hecke components used later. Its proof uses Gross–Zagier, the inert derivative identity of Proposition 69, and global reciprocity. It is independent of the horizontal determinant inequality, the residual unit comparison, and the rank deduction at an initially unknown center.

#thm([Proposition 9.13.])[
  (Characteristic-zero Heegner rank test).  #emph[Let $f$ be a normalized primitive weight-two newform of trivial nebentypus and level $N_f$, and let $cal(A)$ be its modular abelian factor. Let $K$ have odd fundamental discriminant $- D < - 4$, prime to $N_f$, and suppose every prime dividing $N_f$ splits in $K$. Thus $cal(O)_K^times = { plus.minus 1 }$, and the split height formula (GZ) applies. Let $F_f$ be a finite extension of $bb(Q)_2$ containing the image of a fixed Hecke coefficient embedding, and let $V_f$ be the corresponding two-dimensional Tate representation over $F_f$, allowing a further finite scalar extension when needed. Assume $V_f \|_(G_K)$ absolutely irreducible. Then 
#[#set math.equation(numbering: n => "(K0)")
 $ L \( f \/ K \, s \) med upright("has a simple zero at ") 1\
arrow.r.double quad H_f^1 \( K \, V_f \) = F_f y \, #h(2em) y eq.not 0 \, #h(2em) tau y = - w \( f \) y \, $ <eq:K0>]

 where $y$ is the Kummer class of the projected Hilbert trace. The Selmer notation on the right means ordinary Kummer finite conditions, with conjugate rational twist components over $bb(Q)$ recovered by quadratic isogeny. In particular the summand whose $L$-function has nonzero central value has zero such Selmer and the simple-zero summand rank one, since $w \( f \)$ is the functional sign over $bb(Q)$ and the split product sign is minus. Dual Tate via a polarization gives the same assertions rationally. The conclusion concerns the characteristic-zero Selmer rank at the indicated coefficient. For a general $cal(A)$, no assertion of finiteness for its entire prime-primary Tate–Shafarevich group is included.]
] <split-local:heegner-rank>

#proof[
  #emph[The Heegner class and its sign.]
  Formula (GZ) gives a nonzero projected Hilbert point up to torsion [27,15]; its Kummer class $y$ projects nontrivially on $V_f$. The rational Mordell–Weil space for the newform orbit is a vector space over its Hecke field. A nonzero vector stays nonzero after scalar extension through each embedding of that field; scalar extension to a field is faithful. Kummer injectivity is Hecke-equivariant, so the projected Kummer class is nonzero at the specified $2$-adic coefficient embedding.
  Conjugation reverses all level orientations in the Hilbert sum. This agrees up to ideal translation with the full Fricke action (divide by the oriented level subgroup and use the dual subgroup); base cusp differences are torsion. The Fricke eigenvalue is $- w \( f \)$, giving the asserted sign $s_y$ for $y$.
  #emph[Local signs and simultaneous evaluations.] Apply (K) at base conductor one, with no scalar twists, working with the usual untwisted Tate pairings and variable inert primes. Use the alternating plane pairing on $V_f$; up to coefficients this comes from the polarized ordinary pairing and Hecke projection (Rosati fixes the field). The initial problems therefore use exact orthogonal conditions. At fixed places descent gives ordinary Kummer by the proof above (it only needs fixed base local ramification here).
  Switched places use the two pure planes; all these conditions are conjugation stable in the limit. At a new place with $gamma_i$ tending to complex conjugation on full Tate, the action of global conjugation on localizations of classes is $J = rho \( tau \)$ in $f_(upright("loc"))$ and $- J$ in $s_(upright("loc"))$, by the same comparison with $gamma_i$ and tame transport. In this proof a “new prime” means a fresh auxiliary prime sequence with its limiting arithmetic diagram, as in Proposition 69. All finite and singular coordinates, local pairings, and reciprocity comparisons below are taken in those compatible limiting diagrams.
  Because complex conjugation is odd on a weight-two Tate plane, each eigenspace of $J$ is one line. Write $M_(+)$ and $M_(-)$ for those lines. The alternating pairing vanishes on either line with itself and is nondegenerate between the two lines.
  For any nonzero conjugation eigenclasses of sign $s_x$ in a current Selmer problem, finite evaluation at a new place can be made nonzero simultaneously for finitely many such classes. Use again the product kernel $cal(H)$ and cochain evaluations; restriction is injective by the same central element (now even on the plane alone), and the evaluations of each class span the simple plane. On $\( tau eta \)^2 \, med eta in cal(H)$, its values are $\( 1 + s_x J \)$ of those evaluations, since conjugation comparison is on classes and coboundaries restrict trivially there. Thus they span the corresponding sign line $M_(s_x)$. Explicitly, on the joint kernel, where the coefficient action is trivial,
  $ x #scale(x: 120%, y: 120%)[\(] \( tau eta \)^2 #scale(x: 120%, y: 120%)[\)] = \( 1 + s_x J \) x \( eta \) . $
  The same formula is valid on the cohomology classes because conjugation comparison holds on classes and coboundaries restrict trivially to that kernel. By additivity in characteristic zero, simultaneous nonzero tests for finitely many classes exist; use Chebotarev as above, retaining all the data including closeness on the full $cal(A)$. This works also in the extended diagrams with earlier switches.
  #emph[Excluding the opposite sign.] Suppose an initial nonzero Selmer class $x$ has sign $- s_y$. Choose a first prime at which both $x$ and $y$ have nonzero finite evaluations. Then
  $ f_(upright("loc")) \( y \) in M_(s_y) \\ { 0 } \, #h(2em) f_(upright("loc")) \( x \) in M_(- s_y) \\ { 0 } . $
  The derivative of $y$ (using common nonzero scaling by $L$ here) has singular evaluation $J$ times its nonzero finite evaluation. Pair the derivative with $x$. At the new prime the mixed local cup is nonzero, because its singular vector $J f_(upright("loc")) \( y \)$ lies in $M_(s_y) \\ { 0 }$, opposite to the nonzero finite vector of $x$. Every other local cup vanishes by the self-annihilating conditions. Global cup reciprocity says that the sum of these invariants is zero, a contradiction.
  #emph[Excluding a second line of the same sign.] The initial Selmer space is therefore wholly in sign $s_y$. Suppose its dimension exceeds one, and choose a first prime at which $y$ evaluates nontrivially. Some nonzero old class $x$ is in the finite evaluation kernel since the evaluation is in just one $J$-line. Its finite and singular coordinates at this prime are both zero, so it lies in the common lower condition and persists in the transverse problem, still in sign $s_y$. The new derivative $y'$ has nonzero singular coordinate $J f_(upright("loc")) \( y \) in M_(s_y)$. Conjugation acts as $- J$ on this coordinate, so the $- s_y$-eigenprojection of $y'$ is nonzero. At a second prime, make the finite evaluations of $x$ and that eigenprojection nonzero simultaneously. Differentiate the full class $y'$, using its place in the derivative system. By (K), its twofold derivative has singular coordinate $J f_(upright("loc")) \( y' \)$. The component of this vector in $M_(- s_y)$ is nonzero and pairs nontrivially with $f_(upright("loc")) \( x \) in M_(s_y) \\ { 0 }$. Any component in $M_(s_y)$ pairs to zero with $f_(upright("loc")) \( x \)$, so it cannot cancel the nonzero contribution.
  At the first prime, both classes remain in the transverse condition, which is self-annihilating. At all fixed places the Kummer conditions are retained. Thus the second prime gives the only nonzero local cup invariant, again contradicting reciprocity. The Selmer space is exactly the line generated by $y$, with sign $s_y = - w \( f \)$, proving (K0). ◻
]

#prodef([Remark 9.14.])[
  (Use with quadratic companions).  For a primitive form with an individual nonzero central value, the quadratic-twist nonvanishing results supply a split imaginary companion with a simple zero. For an individual simple zero, they supply such a companion with nonzero central value, under the stated local and sign-compatible prescriptions [25,9]. Proposition 75 applies whenever the resulting restriction of the Tate plane remains absolutely irreducible.
  In particular the latter simplicity hypothesis on the Tate action holds for a CM form when $K$ is distinct from its inducing quadratic field and the two inducing characters remain distinct on the compositum; it also holds for a characteristic-zero lift of an absolutely irreducible residual plane over $K$. We will check the relevant bases below. Thus (K0) supplies these characteristic-zero Selmer rank comparisons directly from the Heegner derivative construction and does not require a residual Euler-system bound.
] <split-local:rank-companions>

== 10 Selmer seed for the reducible split-pair anchor <sec:reducible>

We prove Proposition 4 for a non-CM elliptic curve $E \/ bb(Q)$ with $E \( bb(Q) \) \[ 2 \] eq.not 0$. The construction has two stages. First, finite two-descent produces a rational twist, possibly followed by an isogeny, whose ordinary two-Selmer group consists only of torsion classes. A further imaginary twist then gives ordinary Selmer corank one over a split quadratic field. The determinant comparison of Sections 8 and 9 supplies the analytic conclusion and the exact leading-coefficient identity only after these finite constructions are complete.

All dimensions in this section are over $bb(F)_2$. We call

$ d_2 \( C \) = dim "Sel"_2 \( C \/ bb(Q) \) - dim C \( bb(Q) \) \[ 2 \] $

the #emph[pure dimension]. Twisting factors will be products of distinct signed primes

$ p^(*) = \( - 1 \)^(\( p - 1 \) \/ 2) p \, #h(2em) p divides.not 2 N_E . $

Such a product is an odd fundamental discriminant; the empty product, interpreted as $1$, is also allowed unless explicitly excluded.

#thm([Proposition 10.1.])[
  (Finite Selmer seed).  #emph[There are a permitted twisting factor $h$ and an elliptic curve $E_0$, isogenous over $bb(Q)$ to $E^h$, with rational two-torsion and 
#[#set math.equation(numbering: n => "(seed)")
 $ dim upright("Sel")_2 \( E_0 \) = dim E_0 \( bb(Q) \) \[ 2 \] . $ <eq:seed>]

]
] <prop:reducible-seed>

The proposition will follow from the full-rational-plane construction and the one-line construction below. Neither construction uses analytic nonvanishing or finiteness of the Tate–Shafarevich group.

=== 10.1 Labels and finite changes of local conditions <labels-and-finite-changes-of-local-conditions>

At each stage let $S$ contain $2 \, oo$, all bad primes of the current curve, the original excluded primes, and all previously used twisting primes. We may enlarge $S$, for example to contain the support of the coefficients of a chosen equation. Set

$ H = H \( S \) & = chevron.l - 1 \, q : q in S upright(" finite") chevron.r subset bb(Q)^times \/ bb(Q)^(times 2) \,\
m & = dim H = 1 + \# { q in S : q upright(" finite") } = \| S \| \,\
V & = xor.big_(v in S) bb(Q)_v^times \/ bb(Q)_v^(times 2) . $

A fresh prime $p_i$ has a #emph[label] $l_i in H^(*)$, given by evaluation of the radical characters at its Frobenius. Write $e_(i j)$ for the additive Legendre symbol of $p_j^(*)$ at $p_i$, for $i eq.not j$.

#thm([Lemma 10.2.])[
  (Realization of labels and edges).  #emph[There is a linear map $xi : H^(*) arrow.r V$ such that $"loc"_S \( p_i^(*) \) = xi \( l_i \)$, and the map 
$ \( z \, y \) mapsto "loc"_S \( z \) + xi \( y \) \, #h(2em) H xor H^(*) arrow.r V \, $

 is injective. Arbitrary finite label lists and edge values are realizable by distinct fresh primes, subject only to 
$ e_(i j) + e_(j i) = l_i \( - 1 \) l_j \( - 1 \) . $

]
] <lem:reducible-labels>

#proof[
  Quadratic reciprocity determines the localization of $p_i^(*)$ at each odd place of $S$. At $2$, its squareclass is determined by the symbol of $2$, since $p_i^(*) equiv 1 med \( mod med 4 \)$; its real sign is determined by the symbol of $- 1$. These descriptions are linear in $l_i$, giving $xi$. Global Hilbert reciprocity gives
  $ chevron.l "loc"_S \( z \) \, xi \( y \) chevron.r = y \( z \) #h(2em) \( z in H \, med y in H^(*) \) . $
  The subspace $"loc"_S H$ is isotropic: outside $S$, both arguments are odd local units and their Hilbert symbols are trivial. If $"loc"_S \( z \) + xi \( y \) = 0$, pairing with this subspace first gives $y = 0$, and valuations and sign then give $z = 0$. Notice also that $dim V = 2 m$.
  The displayed edge relation is quadratic reciprocity in signed-prime notation. Choose the primes successively. Their labels prescribe congruence classes at the fixed support, while the edges to earlier primes prescribe additional quadratic-residue classes. The Chinese remainder theorem and Dirichlet’s theorem realize these prescriptions; reciprocity then determines precisely the reverse edges. This also realizes every label list. ◻
]

We identify two-torsion modules across quadratic twists. Local duality makes their Kummer conditions self-orthogonal for the Weil pairing; conditions for dual isogenies are orthogonal complements. At infinity we use the usual $H^1$. At a good odd prime not ramified in a twist, the Kummer condition is the full unramified condition.

#thm([Lemma 10.3.])[
  (Finite change inequalities).  #emph[Suppose self-orthogonal local conditions on a fixed self-dual module are changed at finitely many places. Let $b_0$ be the sum of the old local dimensions modulo the intersections with the new conditions, and let $j_0$ be the rank of old Selmer localization in that sum. Then 
$ dim "Sel"_(upright("new")) lt.eq dim "Sel"_(upright("old")) + b_0 - 2 j_0 . $

 For a pair of dual scalar problems, suppose transverse lines are switched at $n$ odd places of local dimension two. If their old localization ranks are $j \, j_(*)$, then the first Selmer dimension increases by at most $n - j - j_(*)$, and the difference of the two Selmer dimensions is unchanged. These statements include unramified old conditions at newly allowed primes.]
] <lem:reducible-change>

#proof[
  The quotients of the old and new conditions by their intersections pair perfectly. Their global localization images annihilate one another by reciprocity. The common strict kernel has dimension $dim "Sel"_(upright("old")) - j_0$, while the new localization image has dimension at most $b_0 - j_0$. This proves the first inequality. The same calculation for orthogonal scalar problems gives $n - j - j_(*)$.
  For the difference assertion, compare each configuration with the one in which the first local conditions are enlarged to the full local spaces. Finite Poitou–Tate duality identifies the image of the enlarged global Selmer group in the local quotient with the annihilator of the old dual image. The difference of the two Selmer dimensions therefore increases by the sum of the local dimension increases. That sum is the same for either of the transverse-line configurations, proving the assertion. These are the strict/relaxed localization calculations of finite duality; see also [40] Lemma 3.2 and Proposition 3.3 and [41]. ◻
]

=== 10.2 The full rational plane <the-full-rational-plane>

Suppose first that $W = E \[ 2 \]$ is constant. Prescribe $sum_i l_i$ for the initial $S$, and consider nonempty products $h = product_i p_i^(*)$ with that sum. We choose the sum so that $E^h$ has even functional sign. The coprime twist sign formula permits this, for example by requiring local squareclasses to be trivial at level primes and choosing the sign of $h$ appropriately. These fixed local squareclasses make the Kummer condition at $S$ independent of the chosen primes. By the parity statement of Section 2, every twist in this family has even pure dimension.

Use additive notation for characters, with $mu_2$ identified with $bb(F)_2$. Kummer evaluations on halves of $t in W$ for the untwisted curve are homomorphisms into $W$, linear in $t$ and unramified outside $S$. Their value at a label $l$ defines an operator $B \( l \)$; thus $B in H ⊗ "End" \( W \)$.

#thm([Lemma 10.4.])[
  (The finite graph model).  #emph[For $h = product_(i = 1)^n p_i^(*)$ in this family, every global two-Selmer class has unique coordinates $w in H ⊗ W$ and $u_i in W$. They satisfy 
#[#set math.equation(numbering: n => "(graph)")
 $ upright("loc")_S \( w \) + sum_i xi \( l_i \) ⊗ u_i & in L := xor.big_(v in S) "im" \( delta_(2 \, E^h \, v) \) med subset V ⊗ W \,\
w \( l_i \) & = B \( l_i \) u_i + sum_(j eq.not i) e_(i j) \( u_i + u_j \) #h(2em) \( 1 lt.eq i lt.eq n \) . $ <eq:graph>]

 Here $L$ is fixed throughout the family. The torsion subspace is $u_i = t \, med w = B t$, for $t in W$, and the dimension of the solution space modulo that subspace is the pure dimension.]
] <lem:reducible-graph>

#proof[
  The radicals supported at $S$ and the new signed primes give independent coordinates on the global classes unramified outside their union. This gives the coordinates in the statement and its boundary condition at $S$.
  At a new prime $p_i$, the untwisted two-power torsion is unramified because the curve has good reduction. Twisting makes a ramified inertia generator act by negation. Its invariant two-power torsion is therefore exactly $W$. The two-adic completion of the local points is this torsion group: the remaining open subgroup is pro-$p_i$. On a half of $t in W$, the twisted Kummer cocycle has inertia value $t$ and Frobenius value
  $ B \( l_i \) t + chi_h \( "Fr"_(p_i) \) t . $
  Comparing with the global coordinates sets $t = u_i$. The contribution of $p_i^(*)$ itself occurs on both sides and cancels; the other radical contributions give exactly the site equation in (graph). The nonempty ramification set likewise forces the global two-primary torsion to be exactly $W$. Its Kummer coordinates are $u_i = t \, w = B t$, as asserted. ◻
]

For a line $A = bb(F)_2 a subset W$, put $phi.alt : E arrow.r E \/ A$ and define $f_A in H$ by

$ f_A \( l \) = B \( l \) a med mod med A \, $

identifying $W \/ A$ with $bb(F)_2$. Also put $k_A = dim \( L ∩ \( V ⊗ A \) \)$.

#thm([Lemma 10.5.])[
  (Orientation by isogeny).  #emph[We may replace $E$ by a rationally isogenous curve with full rational two-torsion, and apply that isogeny to all its twists, so that 
#[#set math.equation(numbering: n => "(orient)")
 $ k_A lt.eq m #h(2em) upright("for every ") f_A = 0 . $ <eq:orient>]

 The conductor and the prescribed family of local squareclasses are preserved.]
] <lem:reducible-orientation>

#proof[
  The image in $E \/ A$ of a half of $a$ is an additional two-torsion point. It is rational exactly when $B \( - \) a$ takes values in $A$. Thus $f_A = 0$ exactly when $E \/ A$ has full rational two-torsion.
  The map $H^1 \( A \) arrow.r H^1 \( W \)$ is injective. Projecting a two-Kummer class to $H^1 \( W \/ A \)$ tests divisibility of the point by the dual isogeny; inside the kernel, the classes are precisely the images of the $phi.alt$-Kummer condition. Consequently $L ∩ \( V ⊗ A \)$ is the sum of the local isogeny Kummer spaces. Since the rational kernel has order two at each place, $k_A - m$ is the two-valuation of the product over $S$ of local cokernel orders divided by local kernel orders for $phi.alt : E^h arrow.r \( E \/ A \)^h$.
  When $f_A = 0$, this product equals the target/source ratio of $Omega product_q c_q$. Indeed, the product over all places has that value by Haar change of variables: the finite Néron volumes are $c_q \/ L_q \( E^h \, 1 \)$, the Euler factors are isogeny-invariant, and the pullback scalar on differentials cancels by the product formula. At unused good odd primes the local ratio is one, by the unramified isogeny Kummer condition. At used primes $p_i$, both two-primary point completions have order four and the map has kernel of order two, so the ratio is again one. The product at $S$ is fixed by the prescribed local squareclasses. This argument uses the total real period.
  Consider the connected graph of full-rational curves joined to the starting curve by full-to-full two-isogenies. Every vertex is good outside $S$; Shafarevich finiteness makes this graph finite up to rational isomorphism. After one allowed twist, choose a vertex maximizing the relative two-valuation of $Omega product_q c_q$; its ratios to the other vertices are rational by the preceding calculation. At every outgoing full-to-full isogeny the target/source valuation is nonpositive, which is (orient). Isogenies preserve the conductor, and the same inequality holds throughout the prescribed family. ◻
]

#thm([Lemma 10.6.])[
  (Full-plane minimization).  #emph[For the oriented curve of Lemma 81, some allowed nonempty twist has pure dimension zero. In particular, Proposition 77 holds when the initial curve has full rational two-torsion.]
] <lem:reducible-full-seed>

#proof[
  Choose a label list containing at least $2 m + 2$ copies of every element of $H^(*)$. Adjust multiplicities to obtain the prescribed total label. Among all admissible edge assignments, minimize the pure dimension $d$ in (graph). Lemma 78 realizes each assignment by primes, so the minimum is even. Suppose for a contradiction that $d gt.eq 2$, and fix a minimizing graph.
  We will vary only the edges. Minimality first forces all differences $u_i + u_j$ of pure solutions into one line $A subset W$. Edge switches preserving that line then give more independent site errors than the boundary condition at $S$ permits. The orientation inequality (orient) closes the argument when $f_A = 0$.
  ===== 10.2.1 Even edge switches. <even-edge-switches.>
  For a nonzero even-weight vector $v in bb(F)_2^n$, relax the site equations by allowing errors $v_i y$, with $y in W$. The resulting solutions map to $W xor W$ by
  $ \( w \, \( u_i \) \, y \) mapsto \( x \, y \) \, #h(2em) x = sum_i v_i u_i . $
  Let $U$ be their image. It is isotropic for the nondegenerate form
  $ \( \( x \, y \) \, \( x' \, y' \) \) mapsto e \( x \, y' \) + e \( y \, x' \) \, $
  where $e$ is the Weil form on $W$. To see this, apply global reciprocity to two relaxed solutions. At a changed site the error adds an unramified class with Frobenius value $v_i y$, while inertia remains $u_i$. The cross terms are exactly the displayed form by local Hilbert duality. Kummer–Kummer and unramified–unramified terms vanish, and every other local condition remains self-orthogonal. Hence $dim U lt.eq 2$.
  The original graph imposes $y = 0$. Toggle both directed edges on each pair inside the support of $v$. Its even weight makes the change in the $i$-th equation equal to $v_i x$, so the toggled graph imposes $y = x$. The two graphs share the strict kernel $x = y = 0$, which contains their common torsion coordinates. If $x$ had rank two on the old pure solution space, then $U = W xor 0$, and the toggled graph would lose both those dimensions. This contradicts minimality. Thus every even-sum map $x$ has rank at most one on the pure solution space.
  ===== 10.2.2 A common image line. <a-common-image-line.>
  These maps form a linear family and are jointly injective. Indeed, if all even sums vanish, the $u_i$ are constant; subtracting the associated torsion coordinates makes them all zero. The site equations then give $w \( l_i \) = 0$ at every label, whence $w = 0$.
  A linear family of rank-at-most-one maps either has a common image line or has a common domain functional: two rank-one tensors with both factors independent have a rank-two sum. The second possibility contradicts joint injectivity on a space of dimension $d gt.eq 2$. There is therefore a common image line $A = bb(F)_2 a$. Pairwise even sums show that, after subtracting torsion, every solution can be represented by $u_i = t_i a$. Projection of the site equations to $W \/ A$ gives
  $ macron(w) \( l_i \) = t_i f_A \( l_i \) . $
  All labels occur, so $macron(w)$ vanishes on $ker f_A$ and is a multiple of $f_A$. Subtracting the torsion coordinates in direction $a$, when necessary, gives representatives satisfying
  $ w in H ⊗ A \, #h(2em) t_i = 0 quad upright("if ") f_A \( l_i \) = 1 . $
  ===== 10.2.3 The image line persists under the switch. <the-image-line-persists-under-the-switch.>
  Take an even $v$ whose evaluation on the pure group is nonzero. Its strict pure kernel has dimension $d - 1$. Since $dim U lt.eq 2$, and $U$ already contains a nonzero horizontal line, its intersection with the diagonal has dimension at most one. The toggled pure dimension is therefore at most $d$; minimality makes it exactly $d$. It is another minimizing graph. The shared strict pure space has dimension $d - 1 gt.eq 1$. Any nonzero vector in that space has some nonzero even-sum evaluation, by joint injectivity, and that evaluation belongs to the image lines of both graphs. Thus their image line is the same $A$.
  The toggled graph consequently supplies a solution with nonzero $y = x = a$. Normalizing it by torsion as above gives the same restrictions on $w \, t_i$, while its error in the old graph is $\( v_i a \)_i$.
  ===== 10.2.4 The dimension contradiction. <the-dimension-contradiction.>
  Let $D_A$ be the space of coordinates with these restrictions and the boundary condition at $S$, leaving the site errors unrestricted. The errors automatically lie in $A$: their projection is $t_i f_A \( l_i \) = 0$. The error map from $D_A$ for the original graph has rank at least $n - 1$. Indeed it contains $\( v_i a \)_i$ for every nonzero-evaluating even $v$, and these vectors span the even-weight hyperplane. To justify the latter assertion, the vanishing evaluations form a proper linear subspace of that hyperplane, whose complement spans the whole hyperplane.
  The kernel of the error map has dimension $d + i_T$, where $i_T = 1$ if $f_A = 0$ and $i_T = 0$ otherwise. These are precisely the restricted torsion coordinates remaining after the pure quotient. Put
  $ n_1 = \# { i : f_A \( l_i \) = 1 } \, #h(2em) r = m - upright(bold(1))_(f_A eq.not 0) . $
  The allowable label sums $sum_i t_i l_i$ have rank $r$, since the allowable labels span $ker f_A$. By Lemma 78, the boundary value is injective on the pair $\( w \, sum_i t_i l_i \)$. The kernel contributed by the $t_i$ thus has dimension $n - n_1 - r$, while the boundary image has dimension at most $k_A$. We obtain
  $ n - 1 + d + i_T lt.eq dim D_A lt.eq n - n_1 - r + k_A . $
  If $f_A eq.not 0$, the repeated labels and $k_A lt.eq dim V = 2 m$ make this impossible. If $f_A = 0$, it gives $d lt.eq k_A - m lt.eq 0$ by (orient), again a contradiction. The minimum is therefore zero, proving the lemma. ◻
]

=== 10.3 The one-line seed <the-one-line-seed>

#thm([Lemma 10.7.])[
  (One-line construction).  #emph[Proposition 77 also holds when $dim E \( bb(Q) \) \[ 2 \] = 1$.]
] <lem:reducible-one-line>

#proof[
  If a full-rational curve is available by a rational two-isogeny, use Lemma 82 on that curve. Otherwise first take an even-functional-sign twist away from $2 N_E$, possibly the trivial twist, using the same local prescriptions. Denote the current curve by $E$ and enlarge $S$ to include all current and original exclusions. Choose a model
  $ E : y^2 = x \( x^2 + a x + b \) \, #h(2em) D = a^2 - 4 b \, $
  with kernel $A = chevron.l T chevron.r$, $T = \( 0 \, 0 \)$, and two-isogeny $phi.alt : E arrow.r E \/ A$. The standard quotient equation is
  $ E \/ A : y^2 = x \( x^2 - 2 a x + D \) . $
  It follows from this equation, or the duplication law, that the remaining two-torsion fields of the source and target are respectively $bb(Q) \( sqrt(D) \)$ and $bb(Q) \( sqrt(b) \)$. Thus $D \, b$ are both nonsquare. Write $W = E \[ 2 \]$ and $hat(phi.alt)$ for the dual isogeny. The module $W$ is an extension of the scalar module $W \/ A$ by $A$ with extension character $D$. Quadratic twisting preserves both two-torsion modules and these squareclasses: a twist by $h'$ replaces $\( a \, b \)$ by $\( h' a \, \( h' \)^2 b \)$.
  ===== 10.3.1 The isogeny Selmer groups. <the-isogeny-selmer-groups.>
  Let $u \, u_(*)$ be the dimensions of $"Sel"_phi.alt \, "Sel"_(hat(phi.alt))$, viewed as radical groups supported at $S$. They contain the nontrivial classes $D \, b$, respectively: these are the connecting classes of the opposite kernel points, whose preimages are two-torsion. For $F = "Sel"_2 \( E \)$, projection to $W \/ A$ gives
  $ beta \( F \) subset "Sel"_(hat(phi.alt)) \, #h(2em) b in beta \( F \) \, #h(2em) F_A := ker \( beta \|_F \) tilde.eq "Sel"_phi.alt \/ chevron.l D chevron.r . $
  These assertions follow from the Kummer diagrams for the factorization of multiplication by two; $delta_2 \( T \)$ gives the inclusion of $b$. For completeness, a lift of a kernel class to $H^1 \( bb(Q) \, A \)$ is locally in the $phi.alt$-condition: its local two-Kummer point is divisible by $hat(phi.alt)$, and the ambiguity in the $phi.alt$-connecting class is the image of the dual kernel under the same connecting map. Globally this ambiguity is $chevron.l D chevron.r$. Even-sign parity and the one rational two-torsion point imply that $dim F$ is odd at this stage and at every subsequent stage.
  ===== 10.3.2 The new local conditions. <the-new-local-conditions.>
  Each step twists by fresh signed primes whose labels sum to zero. Lemma 78 makes the twisting product a local square at all old places of $S$, preserving the even sign. Use only labels with $D \( l_i \) = 0$. The ramified-twist two-primary local point completion is then the Frobenius-fixed two-torsion of each curve, by goodness and the inertia-negation argument in Lemma 80.
  If $b \( l_i \) = 1$, the new $phi.alt$-condition is zero: the source completion has order four, the target completion order two, and the map has kernel of order two. If $b \( l_i \) = 0$, the new conditions for both isogenies are lines transverse to their old unramified lines. In fact a nonkernel two-torsion point in the target has a preimage in four-torsion under the twisted isogeny with nonzero double. Inertia acts by negation on this preimage, producing a ramified Kummer class; the same argument applies on the opposite side. In either case the two-Kummer plane for $W$ is transverse to its old unramified plane, by the inertia calculation in (graph).
  ===== 10.3.3 Reducing the scalar Selmer dimensions. <reducing-the-scalar-selmer-dimensions.>
  There are two cases.
  + If $D \, b$ are independent squareclasses, use pairs of equal labels with $D \( l \) = 0 \, b \( l \) = 1$. The new zero $phi.alt$-conditions impose vanishing inside the old Selmer group, without admitting new ramified classes. These labels span $D^perp$ on the current support. Whenever $u > 1$, one therefore evaluates nontrivially on $"Sel"_phi.alt \/ chevron.l D chevron.r$, and the corresponding pair decreases $u$. This reaches $u = 1$.
  + If $D = b$ as squareclasses, exchange the isogeny and its dual if necessary so that $u lt.eq u_(*)$. Equality of the squareclasses is preserved. While $u gt.eq 3$, choose labels $l \, l' \, l + l' in D^perp$ with evaluation rank two on both isogeny Selmer groups. Such a choice exists: choose a two-plane modulo $chevron.l D chevron.r$ in each group, prescribe isomorphisms from these planes to $bb(F)_2^2$ agreeing on their intersection, and extend to their sum and then to the full radical space. The resulting two functionals are $l \, l'$.
    Both sets of local lines switch transversely. By Lemma 79, the difference $u - u_(*)$ remains fixed and
    $ u_(upright("new")) lt.eq u + 3 - 2 - 2 < u . $
    Thus the orientation persists, and iteration reaches $u lt.eq 2$.
  Enlarge $S$ after each step to contain the new primes.
  ===== 10.3.4 A rank-three evaluation on the full Selmer group. <a-rank-three-evaluation-on-the-full-selmer-group.>
  Now suppose $dim F gt.eq 3$. Again use a repeated label pair $l \, l$. In case (i), take $D \( l \) = 0 \, b \( l \) = 1$, so $u = 1$ is maintained. In case (ii), the equality $dim F_A = u - 1$ gives $dim beta \( F \) gt.eq 2$. Choose $l in D^perp$ nonzero on $beta \( F \)$, and also nonzero on some $x in "Sel"_phi.alt \\ chevron.l D chevron.r$ if $u = 2$. These at most two nonvanishing requirements modulo $chevron.l D chevron.r$ are compatible over $bb(F)_2$. At the two new places, the old dual evaluation is nonzero, and the old primal evaluation is nonzero when $u = 2$. The transverse-line inequality therefore keeps $u_(upright("new")) lt.eq 2$.
  We claim that Frobenius representatives for the pair can be chosen so that evaluation of $F$ in $W xor W$ has rank at least three. Their actions on $W$ are trivial. Their common projection to $W \/ A$ is the same nonzero functional $beta \( - \) \( l \)$; in case (i), its nonvanishing follows from $b in beta \( F \)$. On the kernel of this functional, which has dimension at least two, evaluations take values in $A$. The subspace $F_A$ has dimension at most one; if it has dimension one, its diagonal evaluation in $A xor A$ is nonzero by the condition imposed using $x$.
  Here is the remaining freedom in those $A$-coordinates. Let $cal(N)$ be the kernel of all characters in $H$, and restrict the cocycles to $cal(N)$. They become additive $A$-valued characters there, and every class in $F_A$ restricts to zero. Conversely, a class whose restriction vanishes factors through the elementary quotient $H^(*)$. The square relation for its cocycle is
  $ D \( z \) thin beta \( z \) = 0 #h(2em) \( z in H^(*) \) \, $
  where $beta$ here denotes its projected character. As $D eq.not 0$, this forces $beta = 0$: two nonzero linear functionals cannot have identically zero product. The kernel of restriction is therefore exactly $F_A$.
  It follows that the restrictions of $F \/ F_A$ are independent additive characters and realize arbitrary joint values. Multiplying a Frobenius representative of label $l$ by elements of $cal(N)$ varies the $A$-coordinate by any functional modulo $F_A$, independently at the two primes. All data are finite and continuous, so Chebotarev realizes these prescriptions at fresh primes outside $S$. If $F_A = 0$, choose two independent functionals on the kernel of the projected functional. If $dim F_A = 1$, choose two distinct extensions of its fixed nonzero functional; they are independent over $bb(F)_2$. Thus the $A xor A$-evaluation has rank two on that kernel. Adding the common projected functional gives the claimed total rank of at least three.
  The self-dual change inequality at these two places now gives
  $ dim F_(upright("new")) lt.eq dim F + 4 - 2 dot.op 3 = dim F - 2 . $
  The scalar Selmer bounds already achieved are retained. Iterating reaches $dim F = 1$, since it is always odd and contains the torsion contribution. This proves (seed), with the accumulated squarefree twisting product and any chosen rational isogeny. ◻
]

#proof[
  Apply Lemma 82 or Lemma 83, according to the rational two-torsion of the initial curve. All twisting primes are fresh and avoid the original $2 N_E$, so their product has the required discriminant and coprimality properties. ◻
]

=== 10.4 A split imaginary partner and the analytic conclusion <a-split-imaginary-partner-and-the-analytic-conclusion>

#thm([Proposition 10.8.])[
  (Split imaginary Selmer partner).  #emph[For $h \, E_0$ in Proposition 77, there is a fresh prime $d equiv 7 med \( mod med 16 \)$ such that $K = bb(Q) \( sqrt(- d) \)$ splits all primes of $2 h N_E$, and 
$ d_2 \( E_0^(- d) \) = s_2 \( E_0^(- d) \) = 1 \, #h(2em) s_2 \( E_0 \) = 0 \, #h(2em) s_2 \( E_0 \/ K \) = 1 . $

]
] <prop:reducible-partner>

#proof[
  Resume notation $E$ for the original curve and put $W = E_0 \[ 2 \]$. Choose $S$ for $E_0$ containing $2 \, oo$ and all primes of $h N_E$; in the one-line case also include the support of its final model, whose coefficients we again denote by $a \, b \, D$. Choose a new prime $d equiv 7 med \( mod med 16 \)$ whose Frobenius acts as complex conjugation on $bb(Q) \( sqrt(H) \)$. These prescriptions are compatible: the elementary subfield of $bb(Q) \( mu_16 \)$ is contained in $bb(Q) \( mu_8 \)$, on which the exponent $7$ acts as complex conjugation. We will add one further compatible condition in a case below. Signed-prime reciprocity makes $- d$ a square at every odd finite place of $S$, and $- d equiv 1 med \( mod med 8 \)$ gives the same conclusion at $2$. The two-Kummer conditions of $E_0$ and $E_0^(- d)$ thus change only at $oo \, d$, and Frobenius at $d$ acts on $W$ as conjugation. Quadratic twisting preserves the global rational two-torsion dimension, so every change of Selmer dimension gives the same change of pure dimension.
  ===== 10.4.1 Nontrivial conjugation on $W$. <nontrivial-conjugation-on-w.>
  If conjugation is nontrivial, it is the nontrivial Jordan block in dimension two over $bb(F)_2$. Hence $H^1 \( bb(R) \, W \) = 0$, while the old unramified condition at $d$ has dimension one. Lemma 79 bounds the increase of the pure dimension by one.
  ===== 10.4.2 Trivial conjugation on $W$. <trivial-conjugation-on-w.>
  Otherwise $W$ is full locally at both places. The planes at $d$ switch transversely. At infinity the conditions are complementary lines in $H^1 \( bb(R) \, W \) tilde.eq W$. Indeed, on the two-adic Tate lattice, complex conjugation $c$ is identity modulo two and has determinant $- 1$. The rank-one projectors $\( 1 + c \) \/ 2$ and $\( 1 - c \) \/ 2$ are therefore integral and give a direct decomposition. Kummer evaluation on halves of $W$, namely $\( c - 1 \) \/ 2$, spans the negative-eigenlattice line modulo two; the negative twist spans the other line. Local duality shows that these are the full real Kummer conditions.
  Thus $b_0 = 3$ in Lemma 79. Starting from (seed), it suffices to obtain $j_0 gt.eq 1$, or equivalently a nonzero localization of an old global torsion two-Kummer class. This already occurs at infinity if $W$ is globally full. It also occurs if the unique rational kernel point $T = \( 0 \, 0 \)$ lies outside the real identity component.
  ===== 10.4.3 The remaining quartic prescription. <the-remaining-quartic-prescription.>
  In the remaining one-line case, $T$ is the greatest root of the real cubic, whose component contains infinity. Hence $a \, b \, D > 0$ and $a > 2 sqrt(b)$, with $b \, D$ nonsquare. Prescribe in addition that Frobenius at $d$ flip $sqrt(a + 2 sqrt(b))$, while fixing $sqrt(b) \, sqrt(D)$, as the earlier prescription already requires. The duplication law gives the halves of $T$ as
  $ x = plus.minus sqrt(b) \, #h(2em) y^2 = b \( a plus.minus 2 sqrt(b) \) . $
  Since $sqrt(D)$ is fixed, the two conjugate square roots flip simultaneously. The corresponding half $Q$ is sent to $- Q$, so its Kummer value is $- 2 Q = T eq.not 0$. Thus the additional prescription gives the required nonzero torsion localization at $d$.
  To verify compatibility, let $L$ be the splitting field generated by $sqrt(b) \, sqrt(D) \, sqrt(a + 2 sqrt(b))$. It contains the conjugate square root by the norm relation. Put $P = bb(Q) \( sqrt(H) \, mu_16 \)$. If $b \, D$ are independent squareclasses, the two conjugate radicands over $bb(Q) \( sqrt(b) \)$ are independent squareclasses: their norm is $D$, and their product $D$ is still nonsquare in that field. Conjugacy exchanges the independent sign actions, so their simultaneous flip is a commutator. It therefore fixes $L ∩ P$ and can be adjusted freely over the prescribed abelian data, which already fix $sqrt(b) \, sqrt(D)$.
  If $D = b$ as squareclasses, the radicand is still nonsquare by its norm, and $L$ is cyclic quartic. A lift of the nontrivial automorphism of $bb(Q) \( sqrt(b) \)$ also flips $sqrt(D)$, so its square is the simultaneous flip. The unique quadratic subfield of $L$ is $bb(Q) \( sqrt(b) \)$. If $L subset.not P$, then $L ∩ P = bb(Q) \( sqrt(b) \)$, so the central flip can be chosen freely over the already prescribed data. In the containment case, $L$ is totally real because $a plus.minus 2 sqrt(b) > 0$. The square subgroup of $"Gal" \( P \/ bb(Q) \)$ has order two: the radical extension has exponent two, and the cyclotomic factor contributes the square acting by exponent $9$ on $mu_16$. The prescribed Frobenius on $P$ differs from complex conjugation by this nontrivial square. Every cyclic quartic quotient has a nontrivial square subgroup, so this element acts nontrivially on $L$. Since conjugation is trivial on the totally real field $L$, the prescribed Frobenius gives exactly the required flip. Chebotarev now supplies $d$ satisfying all prescriptions.
  We have proved in every case that $d_2 \( E_0^(- d) \) lt.eq 1$. The coprime split imaginary twist changes the functional sign, so pure-dimension parity makes this dimension exactly one. The finite-Selmer bound and corank parity then give $s_2 \( E_0^(- d) \) = 1$, while (seed) gives $s_2 \( E_0 \) = 0$. Finally, quadratic decomposition of the ordinary Selmer coranks gives $s_2 \( E_0 \/ K \) = 1$. ◻
]

#thm([Corollary 10.9.])[
  (The reducible split-pair anchor).  #emph[Proposition 4 holds for every non-CM elliptic curve over $bb(Q)$ with rational two-torsion.]
] <cor:reducible-anchor>

#proof[
  Apply the reducible split-product comparison of Sections 8 and 9 to $E_0 \, K$ from Proposition 84. The curve remains non-CM, its level and $2$ split in $K$, and its ordinary Selmer corank over $K$ is one. That comparison gives a simple zero of the product and, by (E) and (G),
  $ "an" \( E_0 \) + "an" \( E_0^(- d) \) = 1 \, #h(2em) X \( E_0 \) + X \( E_0^(- d) \) = 0 . $
  At this point both factors have analytic rank at most one, so the classical theorem gives finiteness of their Tate–Shafarevich groups. We may therefore use the isogeny arithmetic-volume comparison of Section 2 to transfer these conclusions from $E_0$ and $E_0^(- d)$ to $E^h$ and $E^(- h d)$.
  Every signed-prime product used to form $h$ was squarefree, odd, and coprime to $2 N_E$, with the empty product allowed. The fresh prime $d$ avoids its support, and $K$ splits all primes of $h N_E$ as well as $2$. Thus $k = - d$ and $h$ satisfy all discriminant, coprimality, and splitting requirements of Proposition 4. ◻
]

== 11 CM period and determinant comparison <sec:cm>

This section proves the CM comparison, Proposition 5, and the paired CM determinant formula needed for the imaginary $S_3$ anchor. There are two distinct rank arguments. First, under a #emph[known] simple analytic zero, the Heegner argument (K0) supplies the Selmer line and permits an exact period and logarithm calculation. Second, starting only with $s_2 \( E \) = 1$, a tame Bockstein test detects a simple zero. The paired formula belongs to the first argument and is independent of the second.

=== 11.1 CM realizations and period normalization <cm-realizations-and-period-normalization>

Let $L$ be an imaginary quadratic field and let $f$ be a primitive weight-two CM newform induced from $L$, with trivial nebentypus and level $N$. Write $F$ for its Hecke field and $F_c = F L$. We use either of the following realizations:

+ $A = e_f J_0 \( N \)$, with $e_f$ the rational orbit projector, the polarization $lambda_A$ restricted from $J_0 \( N \)$, and the algebraic eigendifferential $omega$ pulling back to $f thin d q \/ q$;
+ a CM elliptic curve $A \/ bb(Q)$, with its principal polarization, its primitive newform $f$, $F = bb(Q)$, and a minimal Néron differential $omega$.

In the first case the projector and maps to the orbit factor are taken up to isogeny. Fix compatible complex and dyadic embeddings of the algebraic data. After enlarging the dyadic coefficient field when necessary, write $cal(O)$ for its ring of integers and $pi$ for a uniformizer.

Rosati fixes $F$. The polarization pairings, their rational inverses on dual Tate modules, and the Poincaré height pairing therefore have $F$-valued versions whose traces to $bb(Q)$ are the ordinary pairings. At a single coefficient embedding one computes the pairing by projecting one argument and applying the ordinary pairing.

#thm([Lemma 11.1.])[
  (CM realizations).  #emph[The field $F$ is real, the Hecke-character value field is $F_c$, and the characteristic-zero Tate plane at each Hecke embedding is absolutely irreducible over $bb(Q)$. The variety $A$ is $bb(Q)$-simple, with endomorphism algebra $F$; over $L$ its endomorphism algebra is $F_c$, and its CM type is induced from $L$.]
] <cm:realization>

#proof[
  By classical CM and theta-series theory [52] Theorems 1.1 and 1.4, $N$ is divisible by the primes ramified in $L$; the Hecke character $phi$ has type $\( 1 \, 0 \)$ in the convention $phi \( \( x \) \) = x$ near 1 modulo the conductor (exchange orientations if necessary). Its conjugate-source character equals its complex conjugate, by purity and the trivial determinant character of the form: on rational arguments $n$ away from the modulus, $phi \( \( n \) \) = n chi_L \( n \)$ for positive $n$. Thus $F$ is real.
  The field of values of $phi$ on good ideals is $F_c$. Indeed an automorphism fixing $F \, L$ changes it at most by a finite character, and leaves split-prime traces and products unchanged. Interchanging the two values at a split prime cannot give a root-of-unity ratio (power up to ray principal ideals). Thus the finite character is trivial by Chebotarev, and the reverse generation follows by traces and ray-principal values.
  The Tate realizations are inductions of the character lines by the CM theorem [49] Sections 3–4, or by traces at good primes and semisimplicity. On each Hecke embedding the representation over $bb(Q)$ is absolutely irreducible and the two lines over $L$ differ to infinite order. For distinct embeddings the planes are inequivalent, so also no lines between them can coincide over $L$.
  Faltings’ theorem [24] implies that $A$ is $bb(Q)$-simple with endomorphism algebra $F$, and over $L$ its endomorphisms have algebra $F_c$. Indeed this latter algebra contains $F$; locally at all finite coefficient places its base changes are the commutants of the separate character pairs, the quadratic étale algebras of $F_c \/ F$ by the character-value description. This determines the quadratic étale algebra globally. The $F$-Lie algebra over $bb(Q)$ has rank one, so the action of the full field on it over $L$ induces CM type from $L$. ◻
]

Write $V = H_(upright(B))^1 \( A \)$ and orient labels so that

$ V ⊗_F F_c = V_alpha xor c V_alpha \, quad F_c gamma = V_alpha \, quad \[ omega \]_(upright("per")) = p_gamma thin gamma . $

Here $c$ is the real involution acting linearly (and its étale transport from a chosen complex conjugation), $gamma$ a coefficient basis of one CM eigensummand, and the last equality uses the chosen complex component and ordinary integration into Betti cohomology. In compatible étale notation use

$ T_alpha = cal(O) gamma \( 1 \) \, #h(2em) M^(*) = T_alpha xor c T_alpha = "Ind"_(G_L)^(G_(bb(Q))) T_alpha . $

The rationalized $M^(*)$ is dual abelian Tate ($T_2 \( A^or \)$ with projection and enlarged scalars). Put $mu = chevron.l gamma \, c gamma chevron.r_F$ by the inverse polarization Betti pairing; in the projected Jacobian case this uses the cup of the two pullbacks to the curve. Indeed the projector is orthogonal, so the inverse pairing for the restricted polarization is just the pullback pairing via that projector. The corresponding dual-Tate alternating polarization form divided by $mu$ is unimodular on $M^(*)$ (in compatible twist bases, ignoring sign). In the projected newform normalization we have

#[#set math.equation(numbering: n => "(C1)")
 $ mu p_gamma^2 = - i thin 8 pi^2 \( f \, f \)_N \, $ <eq:C1>]

with cup sign chosen accordingly: $c \[ omega \] = \[ macron(omega) \]$ on this component, and the integral of the wedge computes exactly the stated Petersson pairing, with no Hecke-field trace multiplicity.

#thm([Lemma 11.2.])[
  (A CM lift of an imaginary residual plane).  #emph[If an $S_3$ residual plane $W \/ bb(F)_2$ has imaginary quadratic subfield $L$, there is a form $f$ as above for which $M^(*) \/ pi tilde.eq W ⊗_(bb(F)_2) cal(O) \/ pi$.]
] <cm:residual-lift>

#proof[
  Start with a large rational conjugation-invariant modulus containing the discriminant; prescribe a multiplicative residue character $eta \( n \) = chi_L \( n \)$ on rational units and $eta \( e \) = e^(- 1)$ on global units. For sufficiently divisible modulus the images intersect only at $plus.minus 1$, compatibly. Extend to all residues that are units. Prescribe $x eta \( x \)$ on the group of prime-to-modulus principal ideals $\( x \)$; extend to prime-to-modulus fractional ideals by extracting roots. This gives type $\( 1 \, 0 \)$ with trivial determinant character on the theta form (at its primitive level), cuspidal by non-invariance.
  The residual inducing character of the plane has odd order and is inverted by conjugation. Multiply the Grössencharacter by a finite odd Teichmüller character to arrange that the new residual inducing character equals the desired order-three one. This uses abelian class field theory to twist by the quotient (or inverse according to realizations). The finite character is anticyclotomic and is trivial on rational positive arguments off the modulus (split pairs by inversion, inert primes by inversion and odd order). Thus it does not change the determinant character. The two residual orientations give the same induction. ◻
]

=== 11.2 Elliptic-unit inputs <elliptic-unit-inputs>

We use the norm-compatible rational elliptic-unit system $z_(2^oo frak(f))$ in the ray towers of $L$, with the normalization in [11] Sections 3–4.

#thm([Theorem 11.3.])[
  (Individual-character elliptic-unit comparison).  #emph[Let $Gamma tilde.eq bb(Z)_2^2$ be the free pro-$2$ factor of the ray-tower group, let $Lambda_(cal(O)) = cal(O) \[ \[ Gamma \] \]$, and let $Lambda \( chi \) \( 1 \)$ have the finite-character and regular variable actions of [11] Section 4.1. If $frak(f)_chi divides frak(f)$, then, inside generic rank-one cohomology, 
$ Lambda_(cal(O)) z_(2^oo frak(f)) = det_(Lambda_(cal(O)))^(- 1) R Gamma #scale(x: 120%, y: 120%)[\(] cal(O)_L \[ 1 \/ 2 frak(f) \] \, Lambda \( chi \) \( 1 \) #scale(x: 120%, y: 120%)[\)] . $

 For the character motive of type $\( 1 \, 0 \)$ in the ideal-character convention of Lemma 86, a modulus divisible by its conductor, and a compatible Betti vector $gamma$, elliptic-unit reciprocity gives the period equation 
$ "per" #scale(x: 120%, y: 120%)[\(] exp^(*) z \( gamma \) #scale(x: 120%, y: 120%)[\)] = L_(2 frak(f)) \( macron(phi) \, 1 \) gamma $

 on the holomorphic component, with the corresponding labeling of $phi$. The equation includes the case of a zero $L$-value.]
] <cm:external-units>

The determinant assertion is the Johnson-Leung–Kings theorem in the form of [11] Theorem 4.1, applied to one finite character at a time. That theorem includes $p = 2$. The period equation is Kato’s reciprocity law [30] Proposition 15.9, in the CM formulation [11] Proposition 3.1. The latter uses infinity type $\( - 1 \, 0 \)$ in its convention; here the ideal-character convention is $phi \( \( x \) \) = x$ for $x$ sufficiently close to $1$ modulo the conductor. In an abelian-variety realization the period map is ordinary integration into Betti cohomology, projected at the embedding extending the chosen embedding of the CM-type field. No factor two or base-field trace is inserted in this period map.

We also use the distribution relations of this elliptic-unit system. Dropping a fresh good prime ideal $Q$ inserts $1 - upright("Fr")_Q^(- 1)$ for the arithmetic action on units. Auxiliary-ideal operators give integral smoothed units; the smoothing ideal is prime to $6$ and to all moduli. Dyadic conductor powers may be increased throughout. These are the Robert-unit/Siegel-function distributions with the normalization of [11] Sections 3.2 and 4.1.

The modulus $frak(f)$ always contains the CM conductor and the additional allowed support. Character maps on units and on twisted cohomology are unnormalized coefficient push-forwards.

#thm([Lemma 11.4.])[
  (Specialization under concentration).  #emph[Let $psi$ be an additional finite allowed character, possibly trivial. Suppose that 
$ R Gamma #scale(x: 120%, y: 120%)[\(] cal(O)_L \[ 1 \/ 2 frak(f) \] \, T_alpha psi #scale(x: 120%, y: 120%)[\)] \[ 1 \/ 2 \] $

 has a one-dimensional $H^1$ and no other cohomology. Then the unsmoothed elliptic-unit class satisfies 
#[#set math.equation(numbering: n => "(C2)")
 $ cal(O) z \( T_alpha psi \) = cal(D) #scale(x: 120%, y: 120%)[\(] R Gamma \( cal(O)_L \[ 1 \/ 2 frak(f) \] \, T_alpha psi \) #scale(x: 120%, y: 120%)[\)] . $ <eq:C2>]

 Here the determinant is identified with the rational cohomology line. No nonvanishing hypothesis on a complex $L$-value is required.]
] <cm:specialization>

#proof[
  Split the ray-tower group into its torsion and free factors. Choose $Lambda \( chi \)$ from the torsion character of $T_alpha psi$ before the Tate twist, and evaluate the free factor at the remaining character. The conductor of $chi$ away from $2$ is accounted for by finite inertia. Increase the dyadic part of $frak(f)$, by cofinality, until the full divisibility $frak(f)_chi divides frak(f)$ holds. Use the vector $gamma$ as basis, enlarging $cal(O)$ if necessary.
  Write
  $ C_Lambda = R Gamma #scale(x: 120%, y: 120%)[\(] cal(O)_L \[ 1 \/ 2 frak(f) \] \, Lambda \( chi \) \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Let $frak(q)$ be the characteristic-zero specialization prime of $Lambda_(cal(O))$. The residue-field complex at $frak(q)$ is concentrated in one line in degree one by hypothesis. Cancellation in a minimal perfect model therefore identifies the localized complex itself with one free term in that degree. Consequently the generic determinant generator of Theorem 88 specializes to its actual cohomological push-forward. This comparison may be made first with a smoothing multiplier nonzero at $frak(q)$, and then with the rational unsmoothed class.
  The integral determinant line specializes by derived base change:
  $ cal(D) \( C_Lambda \) ⊗_(Lambda_(cal(O))) cal(O) tilde.eq cal(D) #scale(x: 120%, y: 120%)[\(] R Gamma \( cal(O)_L \[ 1 \/ 2 frak(f) \] \, T_alpha psi \) #scale(x: 120%, y: 120%)[\)] . $
  The specialization of the chosen elliptic-unit determinant generator has just been identified, after inverting $2$, with the distinguished class $z \( T_alpha psi \)$. Hence equality of these lattices is precisely (C2). The arithmetic/étale comparison and finite models on the imaginary base justify the displayed cohomological base change. The argument uses concentration rather than the nonzero-$L$-value hypothesis of [11] Proposition 4.1. ◻
]

#thm([Lemma 11.5.])[
  (Shapiro and the CM period equation).  #emph[Suppose $psi$ comes from a Dirichlet character on $bb(Q)$, is locally trivial at $2$, and the omissions are conjugation-stable. Allow all ramification primes and write $z$ also for the Shapiro class in $M^(*) psi$ over $bb(Q)$. After trivializing at $2$ by a compatible geometric Artin basis, 
#[#set math.equation(numbering: n => "(C3)")
 $ exp^(*) z = frac(L_(2 frak(f)) \( f \, psi^plus.minus \, 1 \), p_gamma) thin omega . $ <eq:C3>]

 The sign $plus.minus$ fixes the reciprocal convention on the finite character; one may invert the variable throughout.]
] <cm:period-transfer>

#proof[
  The notation for omissions here and later means omit the indicated prime ideals over $L$ from its character $L$-function (below whole sets over rational primes, giving omitted factors of the primitive newform twist).
  Apply the reciprocity equation of Theorem 88 to the type $\( 1 \, 0 \)$ character modified by the finite twist, using $gamma ⊗ e_psi$ with $e_psi$ an Artin basis normalized on the identity label, in compatible Betti and étale comparisons. Indeed this motive over $L$ occurs with coefficients on $H^1 \( "Res"_(H \/ L) A_H \)$, for $H$ cutting out the finite character, projecting the CM and finite Artin factors.
  To compare to the CM realization in the reciprocity law one needs only rational isomorphisms: the type $\( 1 \, 0 \)$ character motive is realized on isogeny factors via Weil restriction of CM elliptic curves (Hecke-character construction), and the projected Tate character lines agree. Faltings’ theorem [24], projected over $L$, then supplies an algebraic map with extended number-field coefficients, nonzero on this component (tensor at the chosen prime then choose a nonzero map before completion), hence an isomorphism for the period comparisons.
  The cohomology push of units twists exactly by the indicated vector, as tensor twisting and taking images compose. Conjugating the Hecke character in the law gives the same modular $L$-series, with the consistent finite norm-character twist. Under Shapiro, restriction and projection to $V_alpha$ preserve $exp^(*)$; restriction compatibility uses the trace in local duality, without a doubling. Only one base embedding over 2 contributes to the $H^0 \( Omega \)$ of this component, the one matching the holomorphic period, also when $2$ is nonsplit, after extending scalars.
  An Artin de Rham basis, evaluated geometrically over the splitting field on this label, uses a nonzero algebraic factor $b$ times $e_psi$; its complex and dyadic comparisons there use the two embeddings of the very same $b$. It thus cancels when taking the scalar relative to $omega$ by the stated local trivialization. This proves (C3); the coefficient push-forward is unnormalized.
  Similarly for a fixed quadratic character split at 2 one may think of $B = A^epsilon$ with transported polarization, basis, and $omega$; with these geometric identifications (extend base scalars for $omega$ if needed) the denominator is again $p_gamma$. ◻
]

#strong[Smoothing and Euler factors.]In moving sequences use a fixed nonzero smoothing, denoted by $Delta$ at character evaluations, to give integral bounded cohomology, before any finite traces. Its Euler-system multiplier can be kept constant and nonzero in (C3) by killing the norm of the smoothing ideal by the moving Dirichlet characters (difference of the norm and the auxiliary translate multiplier, nonzero by CM purity). A fixed denominator-clearing integer if used here is included in that same $Delta$.

The norm relation on dropping a good prime ideal $Q$, after twisting by $gamma$, at total splitting in the remaining finite tower uses the single factor $1 - rho_(T_alpha) \( upright("Fr")_Q \) \/ upright(N) Q$: transporting $gamma$ across the inverse-Frobenius translate inserts precisely its Frobenius scalar. Similarly with additional finite twists. At a good split rational prime $r$, dropping both ideals at trivial new character thus gives $1 - a_r \/ r + 1 \/ r$ (for the actual form on the fixed branch).

=== 11.3 The horizontal logarithm at a known simple zero <the-horizontal-logarithm-at-a-known-simple-zero>

Let $B = A$, or let $B$ be a fixed quadratic twist of $A$ split at $2$. Write $f_B$, $N_B$, and $lambda_B$ for its primitive form, level, and polarization, and transport $omega$ in the twist. Let $S_f$ contain $2$ and all necessary bad and ramified primes. For the unsmoothed Shapiro class with these omissions write $z_B$, and put

$ e_S = product_(q in S_f) L_q \( f_B \, 1 \)^(- 1) . $

#thm([Lemma 11.6.])[
  (Nonvanishing of the eigendifferential logarithm).  #emph[For every nontorsion $P in B \( bb(Q) \)$, one has $log_omega P eq.not 0$.]
] <cm:log-nonzero>

#proof[
  The Tate characters and Faltings’ theorem [24] identify $B$, up to $F$-equivariant isogeny, with the orbit factor of $f_B$. Good-prime traces show that its Hecke field is still $F$. In particular $B$ is $bb(Q)$-simple.
  Multiply $P$ into the domain of the $2$-adic logarithm. Its full logarithm is nonzero: the logarithm is injective on a sufficiently small formal neighborhood, so a point in its kernel is torsion. If $log_omega P = 0$, this nonzero full logarithm lies in the proper algebraic subspace $ker omega$ of the Lie algebra. The $p$-adic analytic subgroup theorem [26] Theorem 2.2 gives an algebraic subgroup $H$ containing this multiple of $P$, with $"Lie" H subset.eq ker omega$. The Zariski closure of the subgroup generated by a rational nontorsion point is defined over $bb(Q)$; by $bb(Q)$-simplicity it is all of $B$. Thus $H = B$, contradicting the properness of $ker omega$. ◻
]

#thm([Proposition 11.7.])[
  (Horizontal CM logarithm).  #emph[Suppose that $L \( f_B \, s \)$ has a simple zero at $1$. Then the rational compact Selmer group at the chosen coefficient embedding is one-dimensional, generated by any nontorsion rational point $P$ after extension of scalars. Write $z_B = alpha lambda_(B \, *) \( P \)$ in projected Kummer notation. With the absolute $F$-valued Poincaré height pairing, 
#[#set math.equation(numbering: n => "(C4)")
 $ alpha = plus.minus e_S log_omega P thin frac(L' \( f_B \, 1 \), p_gamma H_(lambda_B \, F) \( P \, P \)) . $ <eq:C4>]

 The height-normalized complex expression is interpreted dyadically through the algebraic comparison in the proof.]
] <cm:tame-log>

#proof[
  Choose a split Heegner imaginary companion $K'$ with nonzero central value, as in (T1), at level $N_B$. It differs from $L$: a prime ramified in $L$ divides $N_B$ and must split in $K'$. The induced plane remains absolutely irreducible over $K'$, because its two characters are still distinct on the compositum. The Heegner argument (K0), applied to the known simple product zero, gives the rational Selmer line. The nonzero rational-sign Hilbert trace and Kummer injectivity give $dim_F B \( bb(Q) \)_(bb(Q)) = 1$. By (C3), the class $z_B$ belongs to that Selmer line. Indeed, its dual exponential vanishes, and odd local $H^1$ vanishes by local Tate-torsion finiteness and duality. Lemma 91 gives $log_omega P eq.not 0$.
  #strong[Choice of primes and the exponential coordinate.]
  Take the auxiliary index prime $ell$ there inert in $K'$, split in $L$, away from the operators and bad primes. Such $ell$ has $a_(f_B) \( ell \) eq.not 0$ by the ray principal value argument. Use primes $r_i$ and even tame characters from $lambda_i : \( bb(Z) \/ r_i \)^times arrow.r bb(Z) \/ 2^(m_i)$, $m_i arrow.r oo$, with the prescriptions of the horizontal comparison, splitting also in a fixed finite normal $F_0$ containing $L$, the twisting data, Hilbert class field of $K'$, and fields imposing fixed congruences. Kill fixed support, smoothing norms and the additional finite list of primes as there. Take smoothed classes from (C3) in the corresponding group coefficients (include the split pair of ideals at $r_i$), with polynomial exponential coordinate $Z_i$ orienting the variable to interpolate $macron(chi)$ for characters $chi = t^(lambda_i)$. These classes and the exponential polynomials have bounded denominators, by split group coefficients at 2. For the primitive characters used in (T4)–(T5) they evaluate on the exponential side as $Delta e_S L \( f_B \, macron(chi) \, 1 \) \/ p_gamma$, by (C3); at $t = 1$ the ordinary class is $Delta e_r z_B$, $e_r = 1 - a_(f_B) \( r_i \) \/ r_i + 1 \/ r_i$. In particular $Z_i \( 1 \) = 0$. Write $Z \( v \)$ for the resulting bounded-denominator coefficientwise limit of $Z_i \( 1 + v \)$, and $Z'$ for its linear coefficient.
  #strong[Frobenius and height transversality.]We can prescribe $r_i arrow.r 1$ and limiting Frobenius $g$ with no root-of-unity Tate eigenvalue on any dyadic component, determinant one on each plane. In fact add to $F_0$ all dyadic roots of unity and dyadic radicals of the primes to be killed, obtaining $D_0$. Its maximal abelian part over $F_0$ has bounded exponent over the cyclotomic tower, by conjugation on the translations by one fixed cyclotomic scalar differing from one. Each CM character has infinite image over $F_0$ on the cyclotomic kernel (otherwise compare conjugation transports using normality and inversion on the infinite anti-ratio). The image is therefore still infinite on $G_(D_0)$, by abelianness over $F_0$.
  Avoid the finitely many characters’ torsion preimages simultaneously (closed with empty interior). Frobenii approximating such $g in G_(D_0)$ are realized by Chebotarev, with the roots and radicals split to sufficient simultaneous depth; use the same primitive root/residue exponent convention as before. Write $a_(*)$ for the limiting trace on the chosen plane.
  We can additionally arrange a nonzero $F$-height $h_lambda^(bb(Q)) \( P \, P \)$ for this tame limit character, with polarization $lambda_B$ and the specified coefficient projection in this notation. Indeed form the biextension lifts used before with first argument $P$ (Kummer $x$ in full Tate), taking linear combinations of dual arguments by rational $F$-endomorphisms and scalar extension so as to project to our embedding (clear fixed denominators).
  The resulting block and fiber cochains $beta \, k$ have $d k = - beta union x$, with $beta$ representing the projected $lambda_(B \, *) \( P \)$ up to sign; ordinary evaluations with $x$ compute the projected pairing. The projected $x$ remains nonzero on $G_(F_0 \( T_2 B \))$, by finite-extension restriction in characteristic zero and central homothety vanishing on the image. A homothety acts simultaneously by a nonidentity scalar $m$: multiply an element over $F_0$ of cyclotomic value $m eq.not 1$ by its complex-conjugation transport. Adding the radical tower cannot kill the restriction: its translation quotient has conjugation by this element of homothety action according to the cyclotomic scalar $m^2$, precluding such a nonzero continuous equivariant map. The joint kernel is normal over $bb(Q)$; the projected $x$-values there span the plane. The commutator of two elements there has zero $x \, beta$, and its $k$-value is up to sign twice the projected symplectic pairing of the $x$-values, hence can be nonzero. This adjusts $g$, preserving the preceding requirements, to give
  $ k \( g \) - beta \( g \) g_T \( g_T - 1 \)^(- 1) x \( g \) eq.not 0 $
  where $g_T$ is the action on Tate. The division calculation of (T2), valid on each of the biextensions in the combination and with $\( g_T - 1 \)^(- 1)$ bounded on all components at the approximating primes, gives $h_lambda^(bb(Q)) \( P \, P \)$ equal to this value up to sign. All retrace rules for these heights use just the two Poincaré laws; norm is unramified over the same ring class fields of $K'$, and pre-division downstairs uses the uniform 2-part bound for the residue-group size of $B$.
  #strong[The cohomological derivative.]The cup computation modulo the squared parameter, as in (T2), gives
  #[#set math.equation(numbering: n => "(11.1)")
   $ Z' log_omega P = plus.minus Delta \( 2 - a_(*) \) alpha h_lambda^(bb(Q)) \( P \, P \) . $ <cm:eq:cup-derivative>]
  Indeed after a fixed multiplier the degree-one derivative term of the cocycle satisfies $d z_1 = - lambda_i union z_0$ up to character orientation with $z_0 = plus.minus Delta e_r alpha beta$; make the adjustment in full dual Tate with coefficients if needed, the cohomological equality being by the norm and Selmer line and torsion bounded. Cup with $x$ and add the corresponding $lambda_i union k$. At 2 the cup uses ordinary differential evaluation (projected class against $x$), and at $r_i$ one trivializes $x$ by the bounded-denominator Frobenius divisions, giving exactly the fiber calculation; remaining local terms have limit zero as before.
  #strong[The spectral and intersection derivative.]Use the holomorphic and intersection calculation of (T3)–(T6) at level $N_B$, on the block of $f_B$. It yields
  #[#set math.equation(numbering: n => "(11.2)")
   $ C_B p_gamma L \( f_B ⊗ epsilon_(K') \, 1 \) frac(Z', Delta e_S) & = plus.minus \( 2 - a_(*) \) h_(upright("pr"))^(K') \( P_0 \, P_0 \) \,\
C_B & = frac(sqrt(\| "disc" K' \|), 8 pi^2 \( f_B \, f_B \)_(N_B)) . $ <cm:eq:spectral-derivative>]
  Here $P_0$ is the projected Hilbert trace on the Jacobian orbit factor with its restricted polarization, and $h_(upright("pr"))$ is the corresponding $F$-valued tame height at the chosen embedding. The two comparison steps are as follows.
  + Use the isolating Hecke polynomial before (T5) with algebraic coefficients, clearing fixed denominators. The Gram and difference calculation is identical at the indicated embedding. For the second $L$-factor use a Betti period $p'$ for the primitive companion form as in (C1) and the same additive modular-symbol polynomials. It differs from $p_gamma$ by a nonzero algebraic multiple by quadratic twisting, isogeny and the CM eigen-differentials. Likewise $p_gamma$ is algebraically proportional to the Betti period in (C1) at level $N_B$. Thus $C_B p_gamma p'$ is algebraic; the period-normalized companion modular symbols have bounded denominators by the fixed relative period lattices (Manin–Drinfeld and the CM Betti line). These facts justify the bounded-coefficient interpolation and differentiation giving (T5), now with $p_gamma \, Delta e_S$ in place of $Omega_0 \, d_0$.
  + The finite intersection matching is on the same modular curve and oriented Hilbert orbit of $K'$, before projection. Inserting the Hecke projector into the pairing applies the restricted orbit polarization split by $F$ (no divisor by a map degree in this notation). One can project by linear combinations of the correspondences after the unramified pull-ups in that proof. Dividing the scaled first argument downstairs on the orbit factor and retracing over $K'$ then works by the same biextension rules and the uniform residue torsion bound from the Frobenius choices. This gives (11.2) after the cancellation in (T4).
  This spectral calculation uses the Hilbert trace itself and the nonzero companion value. It does not use $P$, the Selmer-line identification, or the nonzero-height prescription.
  #strong[Comparison with the absolute height.]In the simple-zero case, (GZ) gives
  $ C_B L' \( f_B \, 1 \) L \( f_B ⊗ epsilon_(K') \, 1 \) = 2 H_(upright("pr")) \( P_0 \, P_0 \) \, $
  with the absolute projected pairing. An $F$-equivariant isogeny to $B$ sends $P_0$ into $F P$ rationally (also by the sign and rank in (K0)); its pullback of $lambda_B$ differs from the restricted polarization by an element of $F^times$. Thus $H_(upright("pr")) \( P_0 \, P_0 \) \/ H_(lambda_B \, F) \( P \, P \)$ is nonzero algebraic, and $h_(upright("pr"))^(K') \( P_0 \, P_0 \)$ is twice that multiple of $h_lambda^(bb(Q)) \( P \, P \)$, by bilinearity, adjunction and extension from $bb(Q)$ to $K'$. Consequently the complex height-normalized $L' \/ p_gamma$ in (C4) is interpreted dyadically by an algebraic scalar, and the two derivative computations imply (C4), cancelling the nonzero factors. This uses (GZ) with its absolute-height normalization. ◻
]

#thm([Corollary 11.8.])[
  (The torsion-trace implication).  #emph[In the CM elliptic setting, suppose only that the functional sign is odd. Choose a split Heegner companion $K'$ with nonzero central value and form the same horizontal exponential coordinate $Z$. The prime choices need satisfy the spectral conditions above, but need not satisfy the additional prescription involving a rational point $P$. If the projected Hilbert trace $P_0$ is torsion, then $Z' = 0$.]
] <cm:torsion-trace>

#proof[
  The spectral calculation (11.2) remains valid: its proof used neither a simple zero of $L \( f_B \, s \)$ nor a point generating the Selmer line. For torsion $P_0$, its tame height on the right is zero. All factors multiplying $Z'$ on the left are nonzero, including $L \( f_B ⊗ epsilon_(K') \, 1 \)$. Hence $Z' = 0$. ◻
]

=== 11.4 Central formulas in known analytic rank at most one <central-formulas-in-known-analytic-rank-at-most-one>

Let $E \/ bb(Q)$ be CM, and put $M = T_2 \( E^or \) ⊗ cal(O)$. Use the unsmoothed class $z = z_E$ with fixed support as in (C2)–(C4). Let $a$ be a primitive invariant Betti homology vector and $a^(*) \( 1 \)$ its polarization image on dual Tate.

#thm([Lemma 11.9.])[
  (The exact CM lattice index).  #emph[If $E$ has analytic order zero or one, then 
#[#set math.equation(numbering: n => "(C5)")
 $ d #scale(x: 120%, y: 120%)[\(] C^(+) \( M \) \, a^(*) \( 1 \) and z #scale(x: 120%, y: 120%)[\)] = v_2 \( gamma \( a \) \) . $ <eq:C5>]

]
] <cm:lattice-index>

#proof[
  Ordinary global cohomology of $M$ (or $M^(*)$, commensurable with it) rationally has a line in degree one only. Indeed Kummer Selmer has the rank given by classical GZK; strict dual localization has zero kernel inside it by nonzero local log in rank one, and local $H^2$ at finite places vanishes by dual invariant vanishing. Thus Poitou–Tate kills rational $H^2$ globally and the ranks follow by Euler characteristic. By (C2) and Shapiro, a determinant generator for the positive complex of $M^(*)$, written in generic cohomology, is $\( gamma - c gamma \) \( 1 \) and z$, the first vector denoting real boundary and the second lifted rationally. Indeed the real action on $M^(*)$ is regular with a free invariant basis as indicated, taking the twist sign into account.
  We normalize $v_2 \( 2 \) = 1$. To calculate the index, the positive Euler length of a finite quotient in comparing these lattices is minus its module length. Filter it residually (use a common sublattice or scalar multiple); constituents by CM semisimplification are trivial or irreducible induced from one nontrivial residual line on $L$, the conjugate line then being its inverse. For a trivial constituent this Euler calculation is global squareclasses and Brauer reciprocity: positive $h^1 \, h^2$ are $\| S_f \| \, \| S_f \| - 1$, respectively, including the ordinary real restriction in defining positive, and there are no other terms. The arithmetic-cohomology comparison for squareclasses/Brauer follows as in the diagram conventions (the universal cover contains imaginary layers). For the induced line use Shapiro and the ordinary Euler characteristic $- 1$ on $L$, with one real invariant line further removed. Additivity proves the length claim. The determinant change of module bases from $M$ to $M^(*)$ has valuation $v_2 \( mu \)$ by actual polarization unimodularity; thus the change of $d$ on fixed positive tensors from $M^(*)$ to $M$ is $+ v_2 \( mu \)$, by the length calculation. And $a^(*) = plus.minus \( gamma \( a \) \/ mu \) \( gamma - c gamma \)$ before twist, by evaluation duality and anti-invariance. This proves (C5). ◻
]

#thm([Corollary 11.10.])[
  (The CM leading coefficient in known low rank).  #emph[If $E \/ bb(Q)$ is CM and $"an" \( E \) lt.eq 1$, then $X \( E \) = 0$.]
] <cm:known-low-rank>

#proof[
  In rank zero (C3) gives for $exp^(*) z$ the scalar $e_S L \( E \, 1 \) \/ p_gamma$ relative to $omega$. In rank one (C4) gives, using any free Mordell–Weil basis $P$,
  $ v_2 (frac(log_omega \( lambda_(E \, *)^(- 1) z \), \( log_omega P \)^2)) = v_2 (e_S frac(L' \( E \, 1 \), p_gamma H \( P \))) $
  in the period-normalized sense there. Since $p_gamma gamma \( a \) = plus.minus Omega_0$ (connected period), these are exactly the log/Haar inputs of the central positive calculations giving (L5) and (P1), with a common multiplier of valuation $v_2 \( gamma \( a \) \)$ and no smoothing. Explicitly the determinant raw valuation formula there uses the integral real boundary basis $a^(*) \( 1 \)$, subtracts $sum_(v in S_f) tau_v + "length" H^1 \( bb(R) \, T_2 E \)$ and the dyadic $"Sha"$-length, adds $2 tau_g$, and inserts $v_2$ of the above scalar (exponential scalar at rank zero) plus the local log-image exponent $b$. Haar absorbs $v_2 \( e_S \)$ and $b$, giving the Tamagawa factors and the real component correction to the #emph[whole] period. Thus $d \( C^(+) \( M \) \, a^(*) \( 1 \) and z \) = X \( E \) + v_2 \( gamma \( a \) \)$. This calculation extends scalars by flatness, and if the generic elements require denominators to lift integrally the length formula applies first to a multiple, then by homogeneity. Comparing to (C5) proves $X \( E \) = 0$. The basis $P$ used here is a basis of the full Mordell–Weil group modulo torsion; the calculation therefore uses the regulator stipulated in Theorem 1. ◻
]

#thm([Corollary 11.11.])[
  (CM corank zero).  #emph[If $E \/ bb(Q)$ is CM and $s_2 \( E \) = 0$, then $"an" \( E \) = 0$ and $X \( E \) = 0$.]
] <cm:corank-zero>

#proof[
  Poitou–Tate gives rational concentration of ordinary global cohomology in one degree-one line. The zero Selmer hypothesis makes its map to the dyadic singular quotient injective, hence nonzero. By (C2), $z$ generates that line; by (C3), its nonzero singular localization implies $L \( E \, 1 \) eq.not 0$. Apply Corollary 95. ◻
]

=== 11.5 The paired CM determinant under a simple analytic zero <the-paired-cm-determinant-under-a-simple-analytic-zero>

#thm([Proposition 11.12.])[
  (Paired CM comparison).  #emph[Let $A = e_f J_0 \( N \)$ have the normalization (C1). Suppose $K$ has odd fundamental discriminant $- D < - 4$, splitting $2 N$, and $L \( f \/ K \, s \)$ has a simple zero at 1. Use $S$ above finite rational primes splitting in $K$, including $2 N$ in the prime-support sense, archimedean places understood, and $e_S$ for the omission multiplier of $f$ over $bb(Q)$. Put $P = e_f P_X$ on $A \( K \)_(bb(Q))$ for the Hilbert trace of (GZ). Over $K$ consider the complex $C_(*)$ on $M^(*)$. Fix one of the two primes $w divides 2$, impose the strict condition there, and impose full conditions at every other finite prime of the support, including $macron(w)$. Then $C_(*)$ is rationally acyclic and its characteristic determinant has valuation 
#[#set math.equation(numbering: n => "(C-pair)")
 $ - d \( C_(*) \, 1 \) = 2 v_2 \( e_S log_(omega \, w) P \) . $ <eq:C-pair>]

 The differential in this identity is the normalized newform differential, as in (M3).]
] <cm:paired>

#proof[
  Only the assumed simple zero of $L \( f \/ K \, s \)$, the Heegner rank argument (K0), and the known-simple-zero comparison of Proposition 92 are used here. In particular, this proof does not use the CM corank-one converse proved below.
  #strong[Concentration and the integral induction sequence.]
  Here $K eq.not L$ and the plane remains absolutely irreducible over $K$ as in (C4). (K0) gives ranks $0 \, 1$ on the even, odd functional-sign constituents over $bb(Q)$, the latter generated on primal Tate by $P$ in Kummer, viewed as a rational point up to denominator of the sign-appropriate curve/variety by untwisting ($- w \( f \)$ conjugation sign). Logarithm on that generator is nonzero as before. Thus ordinary global cohomology for each constituent over $bb(Q)$, on $M^(*)$ or its quadratic twist by $epsilon_K$, has just a line in degree one rationally by the same Poitou–Tate test. Initially include also the primes of $D$, writing $e \, e'$ for the resulting omission multipliers of $f \, f ⊗ epsilon_K$. (C2) gives generators $z_0 \, z_1$ for these inverse determinants by Shapiro from $L$. The integral induction exact sequence with summands (as sub and quotient) $M^(*) \, M^(*) epsilon_K$ on diagonal and difference, and Shapiro from $K$, then give $"res" z_0 and "res" z_1 \/ 2$ as ordinary inverse determinant generator over $K$. Indeed anti-diagonal insertion, corresponding to twisted restriction, composes to twice the identity on the quotient.
  #strong[The localized determinant.]By (C3) and (C4), localization of this pair at $w$ is rationally an isomorphism on degree-one spaces, by nonzero exponential on the rank-zero factor and finite nonzero Kummer log on the other; local cohomology likewise has no other degrees rationally. Its inverse determinant volume is self-dual via the cup and invariant using the alternating Tate form divided by $mu$, by integral local duality. Hence the $d$-value of this localized wedge is the valuation of the cross pairing of the two localized vectors (including division of the wedge by 2). Indeed the discriminant of the determinant pairing on that basis is up to sign the square of the cross value since the finite vector is isotropic. The triangle for strict thus gives before removing $D$
  $ - d \( C_(* \, upright("big")) \, 1 \) = v_2 (frac(e e' thin \( log_(omega \, w) P \)^2 L' \( f \/ K \, 1 \), 2 mu p_gamma^2 H_(lambda_A \, F) \( P \, P \))) . $
  The mixed cup before division by $mu$ evaluates the dual exponential against primal Kummer log by $lambda_A^(- 1)$ in the $F$-pairing. The sign-appropriate twist in (C3) or (C4) is identified geometrically over $K$ and at $w$, with the indicated $omega \, p_gamma$, and transports the #emph[absolute] pairing unchanged. The exact period cancellation is
  $ frac(L' \( f \/ K \, 1 \), 2 mu p_gamma^2 H_(lambda_A \, F) \( P \, P \)) = frac(plus.minus i, sqrt(D)) \, $
  by (C1) and (GZ). It is a dyadic unit because $D$ is odd.
  #strong[Removing the discriminant primes.]Removing the primes of $D$ by localization subtracts the valuations of just their $f$-Euler multipliers (good unramified representation over each ramified place, singular Frobenius block on $M^(*) \( - 1 \)$; the twist Euler factors there are 1). The remaining primes contribute $e_S^2$ since split, proving (C-pair). This proves the claimed determinant formula. ◻
]

=== 11.6 Horizontal divisors of the elliptic-unit class <horizontal-divisors-of-the-elliptic-unit-class>

The remaining CM converse needs two kinds of information about an elliptic-unit determinant coordinate. The individual-character theorem controls its values at finite characters. The following lemma controls its divisors away from two. Its hypothesis of generic concentration will be established by the Bockstein argument in the next subsection.

#thm([Lemma 11.13.])[
  (Horizontal nonnegativity for elliptic units).  #emph[Let $E \/ bb(Q)$ be CM by $L$, with character lattice $T_alpha$, and fix a support $S_f$ containing two and all bad primes. Choose good primes $r_i$ split in $L$, tending to one dyadically, and even surjective residue characters 
$ lambda_i : \( bb(Z) \/ r_i bb(Z) \)^times arrow.r bb(Z) \/ 2^(m_i) bb(Z) \, #h(2em) m_i arrow.r oo . $

 Suppose these characters kill the fixed support and smoothing norms, and the Tate Frobenii at $r_i$ tend to a determinant-one element with no root-of-unity eigenvalues. Use the compatible residue exponents and finite-precision limits of the CM horizontal construction above; no analytic-rank hypothesis is imposed here.]
  #emph[Put $R = cal(O) \[ \[ v \] \]$, and let $C$ be the limiting ordinary global complex over $L$ on $T_alpha$, with scalar action $\( 1 + v \)^(lambda_i)$ or its consistent inverse, allowing the fixed support and both places over $r_i$. Let $Y$ be the elliptic-unit class with one fixed nonzero smoothing multiplier, including a fixed integer clearing denominators when needed. Suppose $C$ has one generic cohomology line in degree one and no other generic cohomology, and that $Y$ is nonzero on this line. For an integral generator of $cal(D) \( C \)$, write $U in "Frac" \( R \)$ for the coordinate of $Y$. Then 
$ "ord"_(frak(p)) U gt.eq 0 #h(2em) upright("for every height-one ") frak(p) subset R upright(" with ") 2 in.not frak(p) . $

]
] <cm:horizontal-nonnegative>

#proof[
  We work over the DVR $R_(frak(p))$, for a height-one prime $frak(p)$ not containing $2$, and prove nonnegativity by successive line switches over $L$. On the fiber of $R_(frak(p))$, all local dual invariants at the original allowed finite places vanish: at fixed places by constant local Tate torsion finiteness, at old moving places by inertia if $v eq.not 0$ and the Frobenius conditions if $v = 0$. Global invariants also vanish by the kernel calculation below. Thus for the current primal problem (initially full), with unramified or transverse conditions as below at auxiliary new places and complementary conditions on the Tate-dual problem, we have $h = dim H^1 = 1 + h^(*)$ on the fiber by Euler and Poitou–Tate, where $h^(*)$ is the dual Selmer dimension in degree one, injecting into global cohomology also (full local $H^0$ included on the switch planes). The Euler assertion persists under switches by the equal local quotient ranks; unramified inflation recovers the old complexes.
  If $h > 1$, we arrange a fresh place $Q = Q_i$ outside the current support, splitting in stage scalar fields and in preceding derivative fields, with $upright(N) Q arrow.r 1$, Tate Frobenius tending to 1, and with both a primitive reduction of the generic primal cohomology line and some nonzero dual fiber class evaluating nontrivially on its Frobenius. Over $R_(frak(p))$ the local evaluations are a split finite axis (value on Frobenius) and a singular axis (on a tame generator), of rank one each; conditions include degree zero and omit degree two. Each pure axis pairs trivially with the same opposite-side axis, with perfect mixed pairing: the limit action is trivial, one uses increasing roots-of-unity precision and the tame/invariant computation of the diagram conventions. Thus these are the local comparisons of Lemma 13, with the unramified plane the pure finite one.
  #strong[Class-group corrections in the auxiliary ray fields.] Denote by $B_i \/ L$ the base cyclic extension from $lambda_i$, totally ramified at both places over $r_i$. Preceding switches will use cyclic $F_Q \/ L$ of order $s_Q = 2^(A_i)$ (parameters possibly different per $Q$), totally ramified just at $Q$, unramified elsewhere, with each auxiliary place split in the base and all the other derivative fields. Choose fixed prime ideals $I_j$ giving cyclic generators of the class group (cyclic factors with orders $h_j$), $I_j^(h_j) = \( x_j \)$. For old auxiliary $Q$ choose $\( y_Q \) = Q product I_j^(- n_j)$. Avoid these $I_j$ in choosing new places. Include in $D_i \/ L$ all $2$-power roots of unity, dyadic radicals of $x_j \, y_Q$, and $B_i$ and all old $F_Q$. Splitting at a new place to sufficiently high finite depth on this data permits $F_(Q_(upright("new")))$ as indicated of any required finite $2^A$ order for that depth: take a primitive residue exponent killing units and all $x_j \, y_Q$, prescribe it on principal ideals, and extend to ideals away from the modulus by killing $I_j$, which respects the class-power relations. It kills each old $Q$; ray reciprocity gives the assertion and total ramification from the residue image. Roots for killing the finite global units can be included by the roots-of-unity congruence.
  #strong[Evaluation injectivity with uniform auxiliary data.] In the product evaluation on $product_i G_L$ for global cohomology classes in these problems, restriction is injective to the exact joint kernel fixing all $D_i$ and the constant Tate actions termwise. In fact set $K_T$ the extension by the character and cyclotomic Tate actions, abelian over $L$ (here $T = T_alpha$). Its intersection with $D_i^0 := L \( mu_(2^oo) \) B_i product_Q F_Q$ is just $L \( mu_(2^oo) \)$, by unramifiedness at these good odd places and separate total ramification of the cyclic factors. Indeed the inertias surject separately to those whole factors alone, which are jointly independent by the same ramification. The abelian part of $D_i$ over $L$ has bounded exponent over $D_i^0$, by one fixed nonidentity cyclotomic action on its radical translation subgroup over $D_i^0$. Consequently the Tate image over $D_i$ still contains fixed powers (uniformly in $i$) of the image over $L \( mu_(2^oo) \)$. To see this extend an automorphism of $K_T$ over the latter tower identically on $D_i^0$ and then lift to the compositum with the abelian part; the bounded power kills that part, hence kills $D_i ∩ K_T$. This gives a lift fixing $D_i$. The $T$-character on the cyclotomic kernel has infinite image by the CM character argument. Thus some sequence trivial on the $D_i$ acts by a fixed infinite-order scalar on $T$ (inverse on the dual), central in the product quotient by the joint kernel. This proves injection by the central scalar test in characteristic zero, using also finite-list evaluation injectivity of the diagram conventions, and proves global invariant vanishing. On that kernel the values of the two indicated classes to be tested are additive, and neither test is identically zero; take them simultaneously nonzero.
  #strong[Chebotarev and precision margins.] Keeping elements trivial on the $D_i$, perturb the resulting choices by arbitrarily deep powers of the preceding scalar lifts, so as to approach Tate identity with $rho_T - 1$ valuation tending to infinity but finite. Powers may preserve all finite old cochain congruences to increasing precision. Take $A_i$ much larger still. Chebotarev at finite levels now gives $Q_(upright("new"))$ with the stated evaluations and splitting data including residue prescriptions, with
  #[#set math.equation(numbering: n => "(11.3)")
   $ v_2 \( upright(N) Q_(upright("new")) - 1 \) > A_i \, #h(2em) A_i - v_2 \( F_i - 1 \) arrow.r oo \,\
v_2 \( F_i - 1 \) arrow.r oo \, #h(2em) F_i = rho_T \( upright("Fr")_(Q_(upright("new"))) \) . $ <cm:eq:precision>]
  All fields and class prescriptions may use deeper finite precision in $D_i$ as necessary after choosing $A_i$. The Frobenius used on old evaluations is unaffected by a local inertia adjustment at the new place. This proves the required compatibility inductively; the new conductor adds just one prime #emph[ideal] at a time in the norm over $L$.
  #strong[Derivative classes and bounded descent.] For subsets $I$ of places switched so far, use smoothed elliptic-unit classes evaluated first in $T$ over $H_I = B_i product_(Q in I) F_Q$, with support $Q in I$ added to the base support and the corresponding elliptic-unit conductors. Apply to them $product_(Q in I) frak(D)_Q$, $frak(D)_Q = sum_(j = 1)^(s_Q - 1) j sigma_Q^j$, with $sigma_Q$ the image of an oriented tame generator at $Q$. At total splitting in all other fields the lower norm on deleting $Q$ uses $p_Q = 1 - F_i \/ upright(N) Q$ (with $F_i$ at this $Q$), so $p_Q \/ \( F_i - 1 \) arrow.r - 1$. These are the elliptic-unit smoothing, twist and prime-ideal Euler distributions specified at (C2)–(C3). The group-ring identity $\( sigma_Q - 1 \) frak(D)_Q = s_Q - N_Q$ ($N_Q$ the group sum) gives global invariance in reduced cohomology to increasing precision, by the norm relation and the margins.
  Uniformly on $H_I$, invariants in $T \/ 2^n$ and $H^1 \( T \)$-torsion are killed by a fixed nonzero multiplier (disjoint Tate data by total ramification as above). Thus any rational-versus-integral torsion errors in exact norm comparisons can first be killed in integral cohomology, and another fixed multiplier makes the invariant reduced classes descend to $B_i$ by inflation-restriction (obstruction in cohomology of bounded-exponent invariants). These choices are common across subsets; uniqueness loss is likewise bounded.
  Weight-corestrict the descended classes from $B_i$ by the horizontal character, modulo increasing Artin precisions. Denote the resulting limit classes by $Y_I$, with $Y_diameter$ the common multiple of $Y$; they can be used successively with old choices retained, slowing working precisions if needed.
  #strong[The exact finite–singular interchange.] For $Q in I$ these have the relations in the limit
  #[#set math.equation(numbering: n => "(11.4)")
   $ f_(upright("loc")) \( Y_I \) = 0 \, #h(2em) s_(upright("loc")) \( Y_I \) = plus.minus f_(upright("loc")) \( Y_(I - { Q }) \) $ <cm:eq:interchange>]
  in integral axes as above. Indeed before descent, with other derivatives applied and the common multiplier understood, use integral cocycles $b_Q$ upstairs and $b$ below (over $H_(I - { Q })$ and restricted up). They vanish on their respective local inertias above $Q$: the local coefficients are unramified, the residue cardinality is still $upright(N) Q$, and $F_i eq.not upright(N) Q$, excluding any nonzero inertia map to torsion-free $T$. Use $sigma_Q$ lifted in inertia, so $rho_T \( sigma_Q \) = 1$ and $b_Q \( sigma_Q^(s_Q) \) = 0$. Take the residue lift $upright("Fr")$ trivial in all the stage finite cyclic fields here (adjust by inertia in the totally ramified factor). The exact norm identity on upper global cochains has
  #[#set math.equation(numbering: n => "(11.5)")
   $ N_Q b_Q = p_Q b + d e \, #h(2em) \( F_i - 1 \) e = s_Q b_Q \( upright("Fr") \) - p_Q b \( upright("Fr") \) $ <cm:eq:cochain-norm>]
  for some integral $e$, by the cohomological distributions and unramified evaluations. We can work separately with $Q$ outermost in the derivative (orders commute on classes). Also $\( sigma_Q - 1 \) frak(D)_Q b_Q = s_Q b_Q - N_Q b_Q$ holds on cochains up there, since the extra inner action by $sigma_Q^(s_Q)$ fixes this cocycle. Match the upper restriction of the reduced descended cocycle with $frak(D)_Q b_Q$ up to coboundary. Applying $sigma_Q - 1$ identifies the coboundary of its value at $sigma_Q$ with $- d e$ modulo precision (the mismatch coboundary is $sigma_Q$-fixed). Invariant errors cost bounded precision, so its value tends congruentially to $- e$. The exact displayed equation, taken before reduction, makes this agree up to sign in the limit with $b \( upright("Fr") \)$ by the margins, which also calculates the lower descent value there (a coboundary adjustment costs a term divisible by $F_i - 1$). On $upright("Fr")$ itself the upper derivative $frak(D)_Q b_Q$ has value $s_Q \( s_Q - 1 \) b_Q \( upright("Fr") \) \/ 2$, tending to zero, and descent adjustment again disappears. Total splitting makes the same argument hold on all translates with their transported generators, since the cyclic fields are abelian over $L$. Thus the weighted traces retain these identities. Unswitching conditions at other new places not in a given subset are unramified for the corresponding classes by support. The cohomology classes with the indicated local coordinates lift to the stated Selmer problems over the test DVR by the localization triangles.
  #strong[Reversing the switches.] This is the unit line isomorphism on evaluations needed in the line switch, with classes integral at the test DVR. By the nonzero primal and dual tests, each such switch drops $h$ by one on its fiber, preserving the generic line and its nonzero derivative by the triangles from the lower condition. Iterate with the new primes as above. At $h = 1$ integrality gives nonnegative order of the derivative coordinate there (one-line minimal complex). Reversing the determinant equalities proves $"ord"_(frak(p)) U gt.eq 0$, since the common multiplier is a unit here. ◻
]

=== 11.7 The CM converse from Selmer corank one <the-cm-converse-from-selmer-corank-one>

#thm([Proposition 11.14.])[
  (CM corank one).  #emph[If $E \/ bb(Q)$ is CM and $s_2 \( E \) = 1$, then $"an" \( E \) = 1$ and $X \( E \) = 0$.]
] <cm:corank-one>

#proof[
  #strong[An abstract Selmer class and a transverse tame direction.]
  Parity gives odd functional sign. We will construct a tame exponential series $Z \( v \)$ with $Z \( 0 \) = 0$ and prove $Z' \( 0 \) eq.not 0$. Corollary 93 will then make the Hilbert trace nontorsion, so Gross–Zagier will detect the analytic simple zero. The argument for $Z' \( 0 \) eq.not 0$ has two parts: a nonzero Selmer Bockstein gives a simple zero of the finite Selmer determinant, and elliptic-unit comparisons make the ordinary determinant coordinate a unit at the same characteristic-zero center.
  Choose a nonvanishing split companion $K'$ and the spectral data of Corollary 93. At this stage no simple analytic zero or rational point spanning the Selmer line is assumed. Use a single tame prime sequence $r_i$ there with variable $v$, order $2^(m_i) arrow.r oo$, action by $\( 1 + v \)^(lambda_i)$ or its inverse. We impose additionally (P2). More explicitly take $x \, beta \, k$ as in the unknown-center test (P2)–(P3), on primal and polarization-dual actual Tate over $bb(Q)$ and scalar twist (1) respectively, unramified-data cochains outside fixed support $S$, integral up to fixed scalings. Here $x eq.not 0$ in rational Selmer, $beta = "pol" \( x \)$, $d k = - beta union x$, which exists by Poitou–Tate and local Kummer isotropy as there. Identify rationally the dual Tate with $M^(*)$ after extending coefficients. On the kernel fixing full Tate as well as $F_0$, roots and prime radicals of the (C4), the $x$-values span the plane: the argument there (central homothety over $F_0$, exclusion of factoring the remaining values through cyclotomically conjugated translations, normality and absolute irreducibility) needs only nonzero cohomology of $x$.
  Choose $g$ fixing the required auxiliary data and with determinant one and nonroot eigenvalues as there, and adjust by a joint-kernel commutator to achieve
  #[#set math.equation(numbering: n => "(11.6)")
   $ k \( g \) - beta \( g \) g_T \( g_T - 1 \)^(- 1) x \( g \) eq.not 0 . $ <cm:eq:transverse-selmer>]
  The adjustment works by the same cochain identity. Choose $r_i \, lambda_i$ by approximation to this $g$, with all requirements of the CM horizontal sequence above, including splitting in $L \, F_0$, increasing residue-root/radical precision and killing fixed support and smoothing norms.
  #strong[The ordinary and finite limiting complexes.]Use the perfect limiting ordinary global complex $C$ over $R = cal(O) \[ \[ v \] \]$ on $T_alpha$ over $L$ with this scalar action, allowing fixed support and both places above $r_i$; equivalently by Shapiro use $M^(*)$ over $bb(Q)$. Include the smoothed elliptic-unit class $Y$, whose exponential coordinate at the split variable specialization local at 2 (that is, the scalar action there is trivial for the whole variable) is the bounded-denominator series $Z$ obtained by the (C4), applied to this sequence. Smoothing is fixed nonzero as in that calculation. All comparisons here use the ordinary finite free and cup diagrams specified earlier. At fixed places the variable is trivial; at the two old moving places there is primitive inertia exponent, and at $v = 0$ the determinant-one Frobenius prescription and norm limit 1 make both ordinary local complexes rationally acyclic with unramified terms also acyclic. Thus unramified inflation there recovers fixed-support global cohomology rationally at the center.
  #strong[The order-one Bockstein.]Over the DVR $R_(\( v \))$ impose further at 2 the constant Kummer line on the induced representation, giving $C_F$. Local cohomology there is the constant plane in degree one, with singular quotient measured by $exp^(*)$. At $v = 0$ Poitou–Tate gives just cohomology lines in degrees 1 and 2 for $C_F$, by corank one and invariant vanishing (odd local terms acyclic). Its single minimal differential has order one. To prove this, suppose instead that its order were at least two (including the case of zero differential). Then $beta$ lifts on induced coefficients modulo $v^2$, with finite localization at 2. This gives the same closed-cochain test as (P3) over $bb(Q)$, now with no supplementary primes. Namely after a common multiplier, stage representatives modulo $v^2 \, 2^(n_i)$ to slower cofinal precision have constant term the fixed multiple of $beta$; their derivative $z_1$ gives $z_1 union x$ plus the corresponding multiple of $lambda_i union k$ closed. Here identify commensurable lattices by maps with bounded denominators. The lift and adjustment are by the contractions and constant-term coboundary lift as in (P3), retaining the dyadic localization and cup with $x$ on constant local models there. Thus its invariant tends to zero at 2; other fixed places contribute zero after limit by bounded coboundary denominators (at infinity up to bounded torsion), and outside support the cochain is unramified. At $r_i$, trivializing unramified $x$ by bounded-denominator $w_i = \( g_(i \, T) - 1 \)^(- 1) x \( g_i \)$ as there, $g_i$ arithmetic Frobenius, gives the prescribed nonzero invariant limit from $lambda_i union \( k - beta union w_i \)$, up to orientation and nonzero multiplier. This uses exactly the primitive compatible residue exponent and Frobenius convergence, and contradicts global reciprocity. This proves the order assertion, without assuming a global point spans.
  #strong[Specialization at high-order characters.] Let $J$ be the constant dyadic singular quotient, a free line in degree one. The order-one differential makes $C_F$ generically acyclic, so the triangle $C_F arrow.r C arrow.r J$ identifies the generic cohomology of $C$ with this single line. Write $U in "Frac" R$ for the determinant coordinate of $Y$, using a generator of $cal(D) \( C \)$. For all fixed roots of unity $zeta$ of sufficiently high 2-power order we have
  #[#set math.equation(numbering: n => "(11.7)")
   $ v_2 U \( zeta - 1 \) = v_2 Delta \, $ <cm:eq:high-character>]
  with the fixed smoothing. Indeed nonzero pivots for the generic cohomology dimensions remain nonzero at these evaluations by one-variable preparation. At such a fixed root the actual character at stages is eventually allowed and the corresponding matrices converge with bounded pivot denominators, so those stage complexes have the same rational concentration (Euler characteristic $- 1$). Their coordinates then satisfy the valuation test by (C2) separately, increasing dyadic powers of the modulus if needed, and use the same $Delta$ since the smoothing norm is killed. Determinant base change and coefficient limits now give the assertion, including generic nonvanishing of $U$. This uses the one-character determinant theorem as specified above, not an integral comparison across the whole tame group.
  #strong[The determinant coordinate at the center.] The Bockstein calculation and (11.7) verify respectively generic concentration and nonvanishing of $Y$. Lemma 98 therefore applies to this very horizontal sequence. It gives nonnegative order for $U$ at every height-one prime not over two.
  Here is the one-variable consequence of these two comparisons. Write, by Weierstrass preparation,
  $ U = pi^a epsilon \( v \) frac(P \( v \), Q \( v \)) \, #h(2em) epsilon in R^times \, $
  where $P \, Q$ are coprime distinguished polynomials and $a in bb(Z)$. Horizontal nonnegativity forces $Q = 1$. For roots of unity of sufficiently high two-power order, the leading term of $P$ gives
  $ v_2 U \( zeta - 1 \) = a thin v_2 \( pi \) + deg \( P \) thin v_2 \( zeta - 1 \) . $
  Equation (11.7) makes this expression constant as $v_2 \( zeta - 1 \)$ tends to zero. Hence $deg \( P \) = 0$, and in particular $"ord"_v U = 0$.
  #strong[Detection of the simple zero.] Over $R_(\( v \))$ the triangle from $C_F$ to $C$ now gives
  #[#set math.equation(numbering: n => "(11.8)")
   $ 0 = - 1 + "ord"_v Z \, $ <cm:eq:center-order>]
  using the simple differential test and the constant singular line. Hence $Z' eq.not 0$. Corollary 93 now shows that the projected Hilbert trace is nontorsion. The Gross–Zagier formula (GZ), with the nonzero companion central value, gives $"an" \( E \) = 1$. Corollary 95 then gives $X \( E \) = 0$. ◻
]

Corollary 96 and Proposition 99 prove the CM comparison, Proposition 5. The paired statement, Proposition 97, remains available under its separate simple-analytic-zero hypothesis.

== 12 Conjugate alternation test <sec:alternation-imaginary>

The parity needed for residual concentration is a consequence of an alternating Bockstein pairing. We first prove that assertion integrally, including at quadratic ramification primes, and then apply it to the imaginary $S_3$ case of Proposition 4. Throughout, the finite-precision diagrams and compatible limits are those of Section 3; all comparisons are made at the stages before passing to a limit. Over an imaginary quadratic $K$ consider $T chi$, $T$ a free plane from $bb(Q)$ with a perfect alternating determinant form $e : T ⊗ T arrow.r R \( 1 \)$, $chi$ an anticyclotomic character. Here $R$ can be our complete scalar integer or order/power-series ring; Galois actions, including their quadratic-base compatibilities and the form, come from actual stage actions at finite precisions. Allow the quadratic ramification primes in inducing. Write

$ V = "Ind"_K^(bb(Q)) \( T chi \) = V_1 xor V_2 \, #h(2em) B \( \( a \, b \) \, \( a' \, b' \) \) = e \( a \, b' \) + e \( b \, a' \) . $

The copies over $K$ use opposite scalar twists; a fixed complex conjugation $c$ interchanges them with the ordinary $T$-action. This is the conjugate Tate pairing; Shapiro pushes the corresponding cup by trace to the compact scalar invariant over $bb(Q)$, compatible as in the diagram discussion (no factor two). The real Tate complex for $V$ is contractible integrally.

Use the following local conditions for $V$:

+ One unrestricted coordinate at a split prime pair, with the other coordinate strict; a zero local condition is also allowed.
+ At each newly allowed odd discriminant prime $q$, assume that $T$ is good and unramified and that $chi$ is unramified over $K$, and impose the unramified cochains over $K$.

For the latter one can equivalently use residue cochains over $bb(Q)_q$ on the $V$-inertia invariants (evaluation by Shapiro on the original summand, same residue field). In fact quadratic inertia acts by a swap $\( a \, b \) mapsto \( delta b \, delta^(- 1) a \)$; the invariants are the graph $b = delta^(- 1) a$, with $delta$ a character unit, compatible by reduction. Cup here has the unramified isotropy trivialization (residue cochains of 2-cohomological dimension one); on a split coordinate cup is identically zero on the condition. These give the usual compact cup on the Selmer complex. Split coordinates and the stated unramified conditions are exact self-orthogonals: check locally also by Shapiro over $K$, for the latter using residue-field-coefficient duality, unramified inclusion of all degree zero and injection in degree one, and the odd local Euler formula (unramified $H^1$ has dimension $h^0$, complementary to the dimension of the dual unramified space). Then use finite models to lift the orthogonality isomorphism. Zero conditions need not be self-orthogonal in using the test by itself.

#thm([Lemma 12.1.])[
  (Conjugate Bockstein alternation).  #emph[With the coefficient module, local conditions, and isotropy data just specified, let $s in R$ be a regular scalar. On degree one for coefficients mod $s$, with $partial$ the Bockstein from mod $s^2$, one has 
#[#set math.equation(numbering: n => "(H1)")
 $ chevron.l x \, partial x chevron.r = 0 . $ <eq:H1>]

]
] <alternation-imaginary:alternation>

#proof[
  #emph[The central extension.] On $V_(s^2) times R_(s^2) \( 1 \)$, with subscripts denoting reductions, use the law
  $ \( a \, b \, z \) \( a' \, b' \, z' \) = \( a + a' \, b + b' \, z + z' + e \( a \, b' \) \) . $
  Its commutator is $B$. The actions over $K$ are diagonal as above. If $C$ denotes the action of complex conjugation on $T$, then $e \( C a \, C b \) = - e \( a \, b \)$, and the lift of $c$ is
  $ \( a \, b \, z \) mapsto \( C b \, C a \, - z + e \( a \, b \) \) . $
  Equivalently, its central coordinate is $c \( z - e \( a \, b \) \)$. Alternation of $e$ shows directly that this preserves the group law, is an involution, and respects conjugation of the $G_K$-actions. On the vectors $s V_s$ the lift $y mapsto \( s y \, 0 \)$ is now additively and equivariantly split; conjugation by a lift with underlying vector $v$ adds $s B \( v \, y \)$ to the central coordinate.
  #emph[Global and local defects.] Write $x$ also for a global crossed cocycle. Take a cochain lift to this group, with a linear-coordinate lift as in computing the Bockstein. Its product defect $tilde(x) \( g \) g tilde(x) \( h \) tilde(x) \( g h \)^(- 1) = \( s y \( g \, h \) \, delta_x \( g \, h \) \)$ uses the global Bockstein $y$; associativity gives $d delta_x = - s B \( x union y \)$. Write locally $x_v = X + d a_v$ with $X$ the cocycle in the prescribed local condition (at the real place use zero and ordinary positive-degree representatives). Make a reference lift $A_v^(- 1) tilde(X) \( g \) g A_v$, using lifts of $a_v \, X$ from the linear Bockstein calculation, the latter inside the allowed vectors with central coordinate zero. In the unramified case use the lifted invariant graph; inertia is trivial on the graph-with-center since $e \( a \, delta^(- 1) a \) = 0$ and the place is odd. If the defect of $tilde(X)$ is $\( s Y \, delta_U \)$, the reference-lift defect is $\( s Y \, delta_U - s B \( a_v \, Y \) \)$. Here $delta_U$ is zero for coordinate or zero conditions, unramified in the graph case. Write the actual localized global lift as $\( s b_v \, ell_v \)$ times the reference lift. Direct multiplication gives
  $ y_v = Y + d b_v \, #h(2em) delta_(x \, v) = delta_U - s B \( a_v \, Y \) + d ell_v + s B \( x_v union b_v \) \, $
  where $b_v$ on the linear side denotes the Bockstein localization homotopy. Choose a primitive $p_0$ for $B \( X union Y \)$, zero on split/zero conditions and in residue cochains for the unramified condition (there its degree-two ambiguity is exact). Then $delta_U + s p_0$ is locally exact, again by residue cohomological dimension in the latter case. The compact pairing uses $B \( x union y \)$ with local primitives
  $ p_0 + B \( a_v union Y \) - B \( x_v union b_v \) $
  by the mapping fibers with these isotropy data. At infinity the ordinary local computation supplies the needed Tate primitive relations in positive degrees. The formulas show that multiplying this compact class by $s$ into the mod-$s^2$ compact cochains gives zero. Compact invariant is scalar-compatible, and $R \/ \( s \) arrow.r R \/ \( s^2 \)$ by $s$ is injective, proving (H1).
  #emph[Finite-precision passage to limits.] For limit systems in this calculation, transfer the Shapiro models, localization triples, compact cup and trace as in the finite-model lemma, including unramified null via the residue cochains. Choose in limit free models the linear lifts of the Selmer complex data modulo $s^2$ with differentials $s$ times the chosen Bockstein data. Use every fixed Artin precision also of $R \/ \( s^2 \)$ and its further mod-$s$ reduction. The equations in finite models then hold over those rings on stage sets in the ultrafilter. Transferring back by the compatible cochain maps gives actual local and global linear cochains at that precision, in particular $d tilde(x)_(upright("lin")) = s y \, med tilde(x)_(upright("lin") \, v) - tilde(X)_(upright("lin")) - d tilde(a)_v = s b_v$, with the indicated cochain equations already satisfied modulo $s$. Graph/residue or coordinate cochains use their true lifts and maps in this procedure. The calculation killing $s$ times the compact cup therefore applies even if this precision has a further annihilator for $s$: it multiplies using the square-zero image ideal and these linear equations. Passage to the full reductions proves (H1). At places where both a more general local condition and the full local complex become contractible after a localization one can replace that condition by zero for the localized test. The pairings restrict compatibly (the zero restriction needs no isotropy correction); lift from the replaced integral complex mod $s$ after clearing a scalar unit of the localization and invert again. Likewise one may base change first to an integral power-series curve as in our specialization conventions. ◻
]

#thm([Corollary 12.2.])[
  (Parity of special and generic ranks).  #emph[For a perfect two-term DVR complex in degrees $1 \, 2$ with perfect self-duality of shift $- 3$, arising from the preceding local conditions and satisfying (H1), the generic and special first-cohomology dimensions have the same parity.]
] <alternation-imaginary:parity>

#proof[
  Choose a uniformizer $pi.alt$ and $s = pi.alt^N$, where $N$ is at least the length of every finite elementary divisor. The allowed scalar base changes permit this choice. Modulo $s$, duality between $H^1$ and $H^2$ is perfect, since the principal Artin ring is self-injective. For a differential block $pi.alt^a$, with $a lt.eq N$, the degree-one group is $pi.alt^(N - a) R \/ pi.alt^N$, the degree-two group is $R \/ pi.alt^a$, and the Bockstein sends the class of $pi.alt^(N - a)$ to the class of $1$. It is therefore an isomorphism on the two groups of this block, whereas it vanishes on free-lifting classes. Thus the alternating Bockstein form on $H^1$ has radical given by the free-lifting part and gives a perfect alternating pairing on the quotient (injectivity there and length equality with its dual). Splitting hyperbolic pairs of maximal order shows the number of finite nonunit divisors is even, as required. ◻
]

== 13 The imaginary $S_3$ anchor <alternation-imaginary:anchor-section>

#thm([Proposition 13.1.])[
  (Imaginary $S_3$ anchor).  #emph[Proposition 4 holds for every non-CM elliptic curve $E \/ bb(Q)$ whose residual image is $S_3$ and whose quadratic residual subfield is imaginary.]
] <alternation-imaginary:anchor>

The proof has three separate tasks: choose a CM comparator with known simple analytic product, arrange ordinary Selmer corank one for a twist of $E$, and transfer an integral determinant unit from the comparator. The Selmer seed alone is not used to infer analytic rank.

=== 13.1 The comparator and the ordinary Selmer seed <the-comparator-and-the-ordinary-selmer-seed>

#thm([Lemma 13.2.])[
  (Choice of comparator).  #emph[Let $W = E \[ 2 \]$ have image $S_3$ and imaginary quadratic subfield $L$. There exist a primitive CM newform $f_0$ of weight two and trivial nebentypus, lifting $W$ on the plane $M^(*)$ of Section 11, and an imaginary quadratic field $K$ of odd fundamental discriminant $k < - 4$, such that 
$ L \( f_0 \, 1 \) eq.not 0 \, #h(2em) "ord"_(s = 1) L \( f_0 \/ K \, s \) = 1 \, #h(2em) q divides 2 N_E N_(f_0) arrow.r.double q upright(" splits in ") K . $

 Moreover, $K eq.not L$, and $W \|_(G_K)$ still has image $S_3$.]
] <alternation-imaginary:comparator>

#proof[
  Suppose $E$ is non-CM with $W = E \[ 2 \]$ having image $S_3$ and imaginary quadratic subfield $L$. Use a CM newform $f_0$ lifting $W$ on $M^(*)$ as constructed in the CM comparison. Quadratic twists retain this lifting property; take $L \( f_0 \, 1 \) eq.not 0$, then take imaginary $K$ of odd fundamental discriminant $k < - 4$ splitting $2 N_E N_(f_0)$ with $L \( f_0 \/ K \, s \)$ having a simple zero at 1. These choices use the nonvanishing theorems in Section 2, with their compatible sign and local splitting prescriptions [25,9]. If desired, the comparator may first be twisted by a quadratic character ramified at every prime of $2 N_E$ where the form’s original level was good, locally trivial at primes already dividing that level (squareclass approximation). Those good local representations become ramified. Use a subsequent coprime twist split at that level with archimedean sign chosen for functional sign plus, for value nonvanishing. Thus all splitting primes required for derivative nonvanishing can be included in the actual level. Use the primitive form after twisting. Since $L$ ramifies within its level, $K eq.not L$, $W \|_(G_K)$ still has full image. ◻
]

#thm([Lemma 13.3.])[
  (Simultaneous Selmer seed).  #emph[For the field $K$ above, there is a squarefree product $h$ of fresh primes congruent to $1 med \( mod med 8 \)$, coprime to $2 N_E k$ and split in $K$, such that 
$ dim_(bb(F)_2) "Sel"_2 \( E^h \/ bb(Q) \) + dim_(bb(F)_2) "Sel"_2 \( E^(h k) \/ bb(Q) \) = 1 \, #h(2em) s_2 \( E^h \/ K \) = 1 . $

]
] <alternation-imaginary:selmer-seed>

#proof[
  We construct $h$ by successive fresh twists. The two curves $E \, E^k$ have opposite signs and no rational two-torsion, hence opposite finite two-Selmer dimension parities by 2-parity and Cassels alternation. Twist each time by a fresh positive good prime local square at all old relevant places, splitting in $K$ and on $W$; signs and conditions away from the new prime are unchanged. There on both curves the unramified plane switches to a transverse plane (Kummers of invariant two-torsion on the ramified twist evaluate surjectively on inertia, untwisted halves unramified and twist inertia negating them). By reciprocity and exact Kummer orthogonality the dimension change is $lt.eq 2 - 2 j$ on either curve for old evaluation rank $j$ there: new singular contributions annihilate the finite evaluations and the kernel is old strict there. Frobenius evaluations can be prescribed on a basis of the span of both Selmers in $H^1 \( bb(Q) \, W \)$: restriction to the joint kernel of $W$ and abelian congruence data detects classes by the normal $C_3$ without invariants, and additive joint evaluations span by absolute simplicity (the ground field is just $bb(F)_2$). Use Chebotarev; the simultaneous residual evaluation statement is also the one in [40] Lemma 3.5. First evaluate with rank two on the odd group until it has dimension one. Then whenever the even group has dimension at least two evaluate with rank two on it and rank one on the odd group simultaneously (possible even for a line inside the even group). The resulting dimensions $0 \, 1$ and quadratic isogeny with parity give the assertion. ◻
]

In the remainder of this section, $E$ denotes the replacement $E^h$. The product $h$ will be restored when we conclude the proof of Proposition 102.

=== 13.2 Paired measures and strict complexes <paired-measures-and-strict-complexes>

Use both $T = T_2 E ⊗ cal(O)$ and $T = M^(*)$ for $f_0$ over common dyadic integers $cal(O)$ with uniformizer $pi$, and common split rational support $S_f$ containing 2 and both level supports. For $M^(*)$ use the unimodular alternating form $e$ normalized by $mu^(- 1)$ as at (C1), and use $lambda_A$ in sending Heegner Kummers on $A = e_(f_0) J$ to dual Tate projected to this plane ($log_omega$ on them incorporates $lambda_A^(- 1)$, with $omega$ as there). For each plane use the strict complex (strict only at $w divides 2$ in $K$, full at all other finite allowed places), and paired CM-disk measures with character variables:

+ $1 + t$ is the free anticyclotomic direction of the orders of 2-power conductor in $K$.
+ The finitely many variables $1 + u_j$ come from cyclic quotients for varying inert primes $r_j$, which are also allowed in the support. Their order conductors are $r_j$, their characters are primitive on relative inertia, and their quotient orders $2^(m_j)$ tend to infinity.

All measure and arithmetic limits are on common stages; write $R = cal(O) \[ \[ t \, upright(bold(u)) \] \]$ on the arithmetic side and use the unramified constant limit with fixed further scalars as before for measures. The strict complex with total scalar twist has square amplitude 1,2 (residual invariant vanishing over $K$, Poitou–Tate and global and dyadic Euler characteristics); denote its determinant by $D$. Denote the measure product by $B = b^(+) b^(-)$, depleting at exactly $S_f$. The letters $D \, B$ refer separately to the two coefficient planes; when comparing them we write $D_E \, B_E$ and $D_0 \, B_0$. Indeed (M1)–(M3) apply as described there with odd conductor $s = product_j r_j$; the 2-part from the split order class sequence uses the unit ratios with image in the free direction of fixed finite index, compatibly through the odd conductors. Use common underlying disk/class and Serre–Tate data and compatible tame orientations across levels, canonical connected level at 2. At conductor $s$ take basepoints by simultaneous descending cyclic quotients from a conductor-one split point, transporting the level. The fully depleted Tate expansions, their integral congruence test, and the common residual Hecke data $W$ give

$ B_E equiv B_0 med \( mod med pi \) \, #h(2em) D_E equiv epsilon.alt D_0 med \( mod med pi \) \, quad epsilon.alt in \( R \/ pi R \)^times \, $

after the common coefficient extension and compatible choices of determinant bases. The second congruence follows from the identical residual coefficient and local diagrams.

The auxiliary primes will be chosen so that

$ r_j arrow.r - 1 \, quad r_j upright(" inert also in ") L \, quad rho_(M^(*)) \( gamma_j \) arrow.r J_j \, med J_j^2 = 1 \, #h(2em) a_(r_j) \( E \) arrow.r a_(j \, *) eq.not 0 \, $

where $gamma_j$ denotes sequences of rational Frobenius lifts. The CM trace $a_(r_j) \( f_0 \) = 0$, the full CM Tate involution limit follows also by induction and determinant, and $gamma_j^2$ acts trivially on all ring fields of $K$.

#thm([Lemma 13.4.])[
  (CM local factorization).  #emph[For auxiliary primes satisfying these prescriptions, put $v_j = \( 1 + u_j \)^(alpha_j) - 1$, where $alpha_j in bb(Z)_2^times$ is the relative inertia exponent. Replacing the full local condition by the pure singular condition on the CM problem removes a factor $v_j^2$ from its strict determinant. Each paired measure vanishes when $u_j = 0$.]
] <alternation-imaginary:local-factors>

#proof[
  For $M^(*)$ the limiting local tame/Frobenius cochains split into
  $ U_(s \, j) = \[ M arrow.r^(v_j) M \] med \( 0 \, 1 \) \, #h(2em) Q_j = \[ M arrow.r^(plus.minus v_j) M \] med \( 1 \, 2 \) \, quad v_j = \( 1 + u_j \)^(alpha_j) - 1 \, quad alpha_j in bb(Z)_2^times $
  with $M$ the scalar-extended plane locally. Use the two procyclic resolutions as in our diagram conventions ($r_j^2 arrow.r 1$); $alpha_j$ uses tame generators $sigma_j$ generating also full relative cyclic inertia of order $r_j + 1$. At the center $U_(s \, j)$ imposes the pure singular plane as for (K), i.e. for coordinates $s_(upright("loc")) \, f_(upright("loc"))$ by evaluation at $sigma_j \, gamma_j^2$ it sets $f_(upright("loc")) = 0$, includes degree zero and omits degree two. Using all the $U_(s \, j)$ instead of full there on the CM problem gives
  #[#set math.equation(numbering: n => "(I1)")
   $ D = upright("unit") dot.op D_s product_j v_j^2 . $ <eq:I1>]
  The modified complex too has square amplitude 1,2 by residual duality (pure plane orthogonality as for (K), including at residual precision as checked in the square switch). Also $u_j divides b^plus.minus$ on that problem: set $u_j = 0$, trace over the inert conductor step at high $t = theta$ in (M2). Each point is a descendant from omit-$r_j$ conductor by this inert prime with transported level (canonical 2-subgroup preserved); the relative trace is Hecke with multiplier zero, and remaining weights descend. Bounded-series testing proves the assertion. ◻
]

=== 13.3 Exact central switches on the CM comparator <exact-central-switches-on-the-cm-comparator>

We now set $t = upright(bold(u)) = 0$ on the CM plane $M^(*)$. For an initial segment $I$ of the auxiliary primes, impose the pure singular condition at the primes in $I$, and the unramified condition at the auxiliary primes not yet switched. Write $D_(upright(s t r i c t \, I))$ for the resulting strict determinant. Replacing the strict/full dyadic pair by the two rational Kummer lines gives a complex $C_(F \, I)$. The determinant volumes for this rational modification are assigned by (D), with the logarithm basis at $w$ and its conjugate dual.

Let $P$ be the projected Hilbert trace and let $Y_I$ be its descended derivative classes from Proposition 69, transported to dual Tate by $lambda_A$. Use a common nonzero multiplier $H$ for all descent, cusp, projection, and lattice denominators, so $Y_diameter = H lambda_A \( P \)$. The logarithm of a dual-Tate class here means the logarithm after applying $lambda_A^(- 1)$, as above. Initially, Proposition 97 gives

$ D_(upright("pre")) := D_(upright(s t r i c t \, diameter)) eq.not 0 \, #h(2em) v_2 \( D_(upright("pre")) \) = 2 v_2 \( e_S log_(omega \, w) P \) \, #h(2em) e_S = product_(q in S_f) P_q \( 1 \) . $

The following lemma identifies the two evaluations needed to preserve this central comparison at each switch. The finite and singular coordinates are the evaluations at $gamma_j^2$ and $sigma_j$, respectively. The derivative identity on the CM plane is

#[#set math.equation(numbering: n => "(I2)")
 $ s_(upright("loc")) \( Y_(I + j) \) = J_j f_(upright("loc")) \( Y_I \) \, #h(2em) I + j = I union { j } . $ <eq:I2>]

#thm([Lemma 13.5.])[
  (Exact central switch).  #emph[Suppose the auxiliary primes satisfy the Frobenius prescriptions above. At each step $I arrow.r I union { j }$, require nonzero finite evaluations of $Y_I$ and of a class $z$ of opposite conjugation sign in the problem obtained from $C_(F \, I)$ by relaxing both dyadic conditions. Then at every step the strict complex is rationally acyclic, $C_(F \, I)$ has cohomological ranks $\( 1 \, 1 \)$, and $Y_I$ spans degree one with nonzero logarithms at both dyadic places. Moreover, 
#[#set math.equation(numbering: n => "(I3)")
 $ 2 v_2 \( log_(omega \, w) Y_I \) - v_2 \( D_(upright(s t r i c t \, I)) \) = 2 v_2 \( H log_(omega \, w) P \) - v_2 \( D_(upright("pre")) \) . $ <eq:I3>]

]
] <alternation-imaginary:central-switch>

#proof[
  Proceed inductively; Proposition 107 will construct primes satisfying both evaluations. Before switching a new prime, its unramified condition recovers the old diagram by inflation. Initially $H^1 \( C_(F \, diameter) \)$ is the Heegner line with nonzero logs by (C-pair). The finite problem has ordinary and conjugate self-duality over the fraction field, since the fixed odd local complexes are acyclic. These are the initial rank and duality assertions needed for the induction.
  For these derivatives one applies $D_I^(upright("der")) = product_(j in I) sum_(a = 1)^(r_j) a sigma_j^a$ to the upper projected point, descends its Kummer class modulo increasing precision, and traces the Hilbert field to $K$. Equation (K) applies on full actual abelian Tate before projection and $lambda_A$: the Frobenius-square divisibilities hold on the whole CM variety, all CM Hecke eigenvalues here are zero, and descent uses fixed base local ramification. This gives (I2), finite Kummer at two, pure singular conditions on $I$, and unramified conditions at the unswitched auxiliary primes. Increase $H$ on all compared classes together if further switches require it; bounded invariants remove the descent ambiguities, as in Proposition 69.
  Inductively let $Y_I$ span $H^1 \( C_(F \, I) \)$ with nonzero dyadic logs. The conjugation-stable conditions make this line an eigenspace. Relaxing both dyadic conditions adds two local quotient lines, exchanged by conjugation. Their boundary onto $H^2 \( C_(F \, I) \)$ is dual to the nonzero finite localization. Its kernel therefore supplies a class $z$ of the opposite sign; the isotropy choices may be made equivariant by averaging over the fraction field.
  By hypothesis, the evaluations of $Y_I$ and $z$ at the next prime are nonzero and lie in opposite $J_j$-eigenlines. The identity (I2) and the square switch preserve ranks one and one, with $Y_(I + j)$ spanning degree one. Cup reciprocity against $z$ forces a nonzero dyadic localization of $Y_(I + j)$: the mixed cup at the new prime is nonzero and every other odd contribution vanishes. Conjugation stability of the new line then gives nonzero logarithms at both dyadic places. Equation (D) restores strict acyclicity. In particular the final modified determinant satisfies $D_s \( 0 \, upright(bold(0)) \) eq.not 0$.
  For the exact valuation, the left side of (I3) is the class-functional valuation with the assigned dyadic volumes. Their comparison triangles are compatible with the separate odd switches; the adjunctions needed here are over the fraction field. At the new prime the mixed pairing is a unit times $e \( x \, J_j y \)$. Thus (I2) and the square switch, with the integral plane-coordinate volumes, preserve this class-functional valuation. Its initial value is the right side of (I3), including the common multiplier $H$. ◻
]

=== 13.4 Residual concentration and compatible prime choices <residual-concentration-and-compatible-prime-choices>

#thm([Proposition 13.6.])[
  (Compatible primes and residual concentration).  #emph[A finite collection of auxiliary prime sequences can be chosen to satisfy all prescriptions of Lemmas 105 and 106, to have nonzero fixed-place Frobenius exponents in one tame variable, and to satisfy 
$ D \|_(t = pi = 0) eq.not 0 $

 for both the CM comparator and the elliptic curve. The non-CM limiting traces $a_(j \, *)$ can all be required to be nonzero.]
] <alternation-imaginary:concentration>

#proof[
  We construct the primes inductively, retaining three properties of the chosen tuple:
  + The first cohomology of the central CM finite problem is a line generated by $Y_I$, with nonzero dyadic logarithms, and its strict determinant is nonzero.
  + The first tame variable has nonzero Frobenius exponent at one place above each prime of $S_f$.
  + Each chosen prime is inert in both $K$ and $L$, has the required CM involution limit, and has nonzero limiting trace on $E$.
  The initial central assertion is (C-pair). At each new prime we impose the two central evaluations of Lemma 106 to preserve it. After the first prime, we also impose a residual rank-two evaluation whenever the residual dimension is positive. We first show that these requirements force termination, and then prove that they can all be met simultaneously.
  #emph[Dimension reduction.] Choose the first prime $r_0$ with the nonzero fixed-place exponents in $u_0$. At $t = 0$, consider the DVR at $\( pi \)$ of $cal(O) \[ \[ upright(bold(u)) \] \]$. Write $h$ for the degree-one dimension of the full-at-added-primes strict problem on its residue field. The central invariant and (I1) make the generic problem acyclic. Fixed odd local complexes are acyclic over this DVR: their nonconstant unramified scalar has no invariants or dual invariants against the fixed residual matrices, and the odd local Euler characteristic is zero. The added inert local complexes are acyclic by their inertia scalars; the dyadic degree-zero terms vanish by the Frobenius test. Thus conjugate duality is perfect.
  To apply (H1) after inducing over $bb(Q)$, allow the quadratic ramification primes with the unramified conditions in that lemma. The coefficient is good there and the scalar unramified over $K$; unramified inflation recovers the same global problem. At the acyclic odd places use the zero replacement allowed in that lemma. Corollary 101 now makes $h$ even. The curve has the identical residual problem and hence the same dimension.
  If $h gt.eq 2$ add a variable with evaluations of two independent strict classes of rank two in the finite plane at that new place (initial $u_j = 0$, residue generic field of the old variables with $t = 0$). Over that field localization and duality are exact with either pure plane: the local action at this new place is trivial in the limit, and conjugate transport with pure cups and mixed pairing is as at (K). Thus changing to the pure singular plane drops $h$ by two as in the square switch (the upper image is exactly the finite plane). This switched problem is a specialization of the problem using $U_(s \, j)$ before setting $u_j = 0$; with $u_j$ also generic that condition and full give the same cohomology. Hence the new generic residual dimension is at most $h - 2$ by the perfect models. Even parity at each step then terminates with
  $ D \|_(t = pi = 0) eq.not 0 . $
  It remains to justify the simultaneous choices used in this induction. The first prime must supply the fixed-place exponents. Every later prime must supply the residual rank-two evaluation when $h > 0$. At every step the two central evaluations preserve the first invariant, and the non-CM trace must stay nonzero. The following constructions impose these requirements in that order without losing the earlier ones.
  #emph[Ring-class characters and the first variable.] In $"Pic" \( cal(O)_K \)$ take cyclic factor generators represented by prime ideals $I_d$ at distinct split primes outside the support and away from use, by Chebotarev. Write $I_d^(h_d) = \( x_d \)$ for their order relations. For the chosen $v$’s put $\( y_v \) = v product I_d^(- n_(v d))$. At inert $r_j arrow.r - 1$ with $2^(m_j) divides r_j + 1$, use the $2^(m_j)$-power residue symbol on $bb(F)_(r_j^2)^times$ with compatible roots at the chosen place; it kills rational residues and maps onto the cyclic roots of that order. Require zero exponents on $x_d$; then by the order class sequence the residue character extends killing the $I_d$’s on the ring class group, with exponents at $v$ given up to conventions by $y_v$. This produces the specified independent conductor variables (their relative inertia groups for the different primes multiply, using units just signs).
  Take $gamma_j$ approaching elements $g_i = c eta_i$ ($i$ indexes stages) where $eta_i in G_K$ fixes $W \, mu_(2^oo)$. Thus $g_i$ is also in the inert $L$-coset. Exponents on the above numbers of $K^times$ are read modulo $2^(m_j)$ from the Kummer translations by $g_i^2$, i.e. translations by $eta_i$ minus their values by $eta_i$ on the conjugate numbers. At the first step we can prescribe zero on $x_d$ and all differences nonzero on $y_v$ with fixed values as required. Indeed the numbers and their conjugates are jointly multiplicatively independent by valuations, and Kummer images on the specified kernel are open in the full tuple space (use valuations after the finite extension and rational restriction injectivity on passing to the cyclotomic tower by a central nonidentity cyclotomic scalar). Take these initial $eta_i$ constant. At subsequent steps instead require $eta_i$ trivial also on all the radicals, giving zeros on the class relations again.
  #emph[Residual evaluations.] In the residual tests for those subsequent steps use the evaluation groups $cal(G)_K = product_i G_K \, med cal(G) = cal(G)_K times.r chevron.l c chevron.r$ of the diagram conventions. Degree one in question injects into unrestricted crossed classes (in particular by dyadic invariant vanishing just checked). Take the termwise product kernel $cal(H)$ over $K$ of $W$, ring-class and cyclotomic data and the radicals just used (including conjugates). Restriction here detects the classes. Before radicals the quotient has a normal product of the $C_3$’s (other data abelian over $K$), whose diagonal $C_3$ kills its invariants and abstract $H^1$; and a lift fixing the cyclotomic data acts trivially by conjugation on radical translations, so these give no equivariant homomorphisms either. The conjugate induction is absolutely simple since $W$ is absolutely simple over $K$ and the two scalar twists differ in determinant (already by the infinite-order image using $u_0$). Joint evaluations on $cal(H)$ thus span both copies of the induction for the two classes, by abstract Shapiro and the simple evaluation test. Evaluation on $\( c eta \)^2 \, med eta in cal(H)$ acts via $1 + c$ and projection back to the first summands, additively and still spanning both tested planes. Some $eta$ therefore gives rank two by the quadratic determinant test.
  #emph[Nonzero traces on the elliptic curve.] Now perturb either choice of $g$ by products of squares within $cal(H)$, preserving the residual test as well as any exact radical prescriptions. We can thus ensure $a_(j \, *) eq.not 0$ on $E$, since these kernels contain uniformly an open determinant-one piece on the curve’s Tate data (non-CM open image with bounded-derived-length excluded data as in the evaluation discussion). Products of squares there still contain such a piece, so the coset trace is not identically zero even on limiting matrices. Preserve the nonvanishing by keeping henceforth $E \[ 2^a \]$ actions fixed to sufficient fixed depth.
  #emph[The two characteristic-zero evaluations.] Lastly use squares within the deeper kernel fixing also $E \[ 2^a \]$ and full CM Tate of $A$. For the two central rational classes $Y_I \, z$ of the required opposite signs, evaluation still detects each by restriction here. Indeed these Selmer classes with finite or relaxed dyadic conditions inject into abstract crossed classes as before. A constant element $h_0 c h_0 c$, with $h_0 in G_(K L \( E \[ 2^a \] \))$ of cyclotomic value a fixed integer $m > 1$, acts by homothety $m$ on CM Tate and $M^(*)$ (diagonal CM characters with product cyclotomic, swapped by $c$), trivially on ring fields and the other designated finite data. It is central modulo the pre-radical kernel. And it acts on radical translations by the integer $m^2$; so even abstract equivariant homomorphisms from the additional kernel to the plane vanish. Thus evaluations of either detected class on the deeper kernel span the simple characteristic-zero plane over $K$. Multiplying $g$ by squares there adjusts evaluations at $g^2$ for a sign-$epsilon.alt$ class by $2 \( 1 + epsilon.alt J_j \)$ applied to its kernel evaluations, additively: conjugation by $g$ uses the eigenlaw on classes, with coboundaries trivial here. These projected changes span the required eigenline for each. Hence in characteristic zero the two nonzero tests can be met together without changing previous requirements.
  Chebotarev at increasing precision now gives the primes, retaining the previous cochain evaluations and all stated field and Frobenius prescriptions, including the exact class-relation zeros to cofinal symbol depth. Local generators can be taken from inertia with the needed relative cyclic action. This validates (I2)–(I3) and the residual-dimension induction simultaneously (central and residual cocycles use their respective finite diagrams, extended before limits). ◻
]

=== 13.5 Leading coefficient and divisibility tests <leading-coefficient-and-divisibility-tests>

For the CM comparator, Lemma 105 already gives integral canceled series

$ tilde(B) = frac(B, product_j u_j^2) \, #h(2em) tilde(D) = frac(D, product_j u_j^2) . $

Indeed $v_j \/ u_j$ is a unit. The central switches give $tilde(D) \( 0 \, upright(bold(0)) \) eq.not 0$. We compare these two scalar values before proving divisibility of the full series.

#thm([Lemma 13.7.])[
  (The central mixed coefficient).  #emph[For $f_0$, with $I$ the set of all tame indices and with the same common multiplier $H$ as in Lemma 106, one has 
#[#set math.equation(numbering: n => "(I4)")
 $ v_2 (frac(b^plus.minus, product u_j)\|_(t = upright(bold(u)) = 0)) = v_2 \( e_S log_(omega \, w) Y_I \/ H \) . $ <eq:I4>]

 Consequently both $tilde(B) \( 0 \, upright(bold(0)) \)$ and $tilde(D) \( 0 \, upright(bold(0)) \)$ are nonzero, and their ratio is a dyadic unit: 
$ v_2 #h(-1em) (frac(tilde(B) \( 0 \, upright(bold(0)) \), tilde(D) \( 0 \, upright(bold(0)) \))) = 0 . $

]
] <alternation-imaginary:mixed-coefficient>

#proof[
  We retain the descent multiplier throughout the coefficient calculation. At $t = 0$ use the disk-center formula of (M1)–(M3) with $Psi_(upright(bold(u)))$ the tame weights. Euler operators all act by translations, and opposite original-level sums differ up to sign and unit translation by Atkin–Lehner as there. The projected point at conductor $product r_j$ in the sum is denoted $X_I$.
  To check the positive-orientation formula with additive congruences, first multiply the stage formula by $H G \( Psi_(upright(bold(u))) \( upright("Fr")_w \)^(- 1) \)$, where $G$ is a fixed Frobenius polynomial with $G \( 1 \) eq.not 0$ sending all points on the actual abelian factor over dyadic unramified local fields into the small formal-log range. Use unramified Néron base change, component order, the abelian and toric Frobenius relations and a characteristic power for unipotent reduction, then a fixed integer in the formal range as in the unramified log comparison. Here $upright("Fr")_w$ uses the corresponding CM class action. Thus the weighted logs are now of translates of $G \( upright("Fr")_w \) H X_I$, uniformly bounded and with log congruences for division up to the same fixed loss. All coefficients with a variable dropped from the weighted sum vanish by the inert Hecke traces.
  Work modulo increasing precision with each $u_j^2 = 0$ (group powers map there, absorbing fixed Euler denominators). Write the labels as Hilbert representatives times $product_j sigma_j^(k_j)$. In the mixed coefficient only weights $product_j alpha_(j \, i) k_j$ contribute ($alpha_(j \, i)$ stage exponents): expanding the product of exponents of the full labels, all other terms drop at least one relative weight and use trace zero. Euler multipliers contribute just $e_S$. The resulting additive sum without these unit exponents and Euler multipliers is the log on the Hilbert-label sum of translates of $G \( upright("Fr")_w \) H D_I^(upright("der")) X_I$. Its limit is $G \( 1 \) log_omega Y_I$. Indeed restriction back up of the traced descended class is exactly the corresponding Hilbert sum before $G$ in Kummer modulo growing precision. This comparison takes place on full actual abelian Tate after the common multiplier and before final lattice projection/$lambda_A$; the descended trace classes at $w$ are represented by local Kummers as in the descent proof. Thus the point congruence after restriction is modulo division in the upper #strong[unramified] local fields, so transfers to a uniform additive congruence after $G$. On the base-field local point $G$ acts by $G \( 1 \)$; base logs of such finite-level representatives converge to the localization log along the cohomology models at the fixed group (Kummer injection and compactness), with the stated polarization convention. Passing precisions therefore computes the mixed coefficient. On the series side multiplying by the group polynomial likewise uses only $G \( 1 \)$ in that coefficient, by the $u_j$-divisibilities. Cancelling yields (I4), also at the opposite orientation (same Euler constants). More explicitly, (I3) and the initial value of $D_(upright("pre"))$ give
  $ v_2 \( D_(upright(s t r i c t \, I)) \) = 2 v_2 \( log_omega Y_I \) - 2 v_2 \( H \) + 2 v_2 \( e_S \) . $
  By (I4), this is the valuation of $tilde(B) \( 0 \, upright(bold(0)) \)$, and it is finite because the central derivative has nonzero logarithm. Equation (I1) identifies $tilde(D) \( 0 \, upright(bold(0)) \)$ with $D_(upright(s t r i c t \, I))$ up to a unit. The two scalar values therefore have the same valuation. This proves the stated central ratio, retaining every power of two in $H$. ◻
]

#thm([Proposition 13.8.])[
  (Integral quotient and its unit value).  #emph[Embed the arithmetic coefficient ring into the common integral measure coefficient ring. For each of the two coefficient planes, $D divides B$ in the resulting integral series ring, and both quotients in that ring are units.]
] <alternation-imaginary:unit>

#proof[
  We first establish integral divisibility, then use the central scalar ratio to prove that the quotient is a unit. At high finite $t = theta$ use $cal(A) = cal(O) \( theta \) \[ \[ upright(bold(u)) \] \] \[ 1 \/ 2 \]$, where $cal(O) \( theta \)$ is the integer ring after extension; test at its height-one DVRs as in (B1), (D2). We spell out the applicability here.
  + The split dyadic Kummer lines and weighted log identification over extended constants of the local comparisons there apply. The $upright(bold(u))$-actions are unramified with some nonzero Frobenius exponent by construction. Thus the substitution from the unramified Shapiro tower (after splitting $theta$ locally as the ramified-field character and unramified part) is flat as discussed there. Local Heegner fields of the combined conductor contain the fixed ramified character field and arbitrarily large fixed unramified layers eventually, since they cut $theta$ and have the growing unramified orders. High $theta$ is nontrivial on inertia after the indicated fixed reduction extensions. These are precisely the hypotheses for bounded Kummer/log transfer also on projected abelian Tate and several-variable cyclic quotients.
  + Fixed odd singular determinants removed in imposing the characteristic-zero unramified conditions multiply to $D_(upright("odd")) = product_(q in S_f \, med q eq.not 2) P_q \( chi \( upright("Fr")_v \) \) P_q \( chi \( upright("Fr")_v \)^(- 1) \)$ up to units, $chi = theta Psi_(upright(bold(u)))$, $v divides q$. Use the local coinvariant computation of (B1) (for the CM form this is the usual good/bad local Euler factor on the induced character realization; inertia has finite image and the Hecke $L$-function gives the Frobenius polynomial on its unramified part). None vanish on a whole $u_j = 0$, by the all-zero tame specialization and Frobenius weights. The added inert locals are acyclic on the test except possibly on the CM branch at primes $\( u_j \)$. Indeed away from these divisors tame inertia alone suffices; on the curve branch the Frobenius-square limit minus one is also invertible by $a_(j \, *) eq.not 0$, determinant $- 1$ on the original Frobenius limit, and all the scalar weights trivial on its square.
  + Formula (M2) on these conductors and the weighted-log identification give (B1) in the form $B \( theta \, upright(bold(u)) \) = upright("unit") dot.op p_0^2 D_(upright("odd"))$ over extended 2-inverted constants. Here $p_0 in cal(A)$ is the localized weighted Heegner class coordinate at $w$ on the free Kummer line, up to common point/descent multipliers (using the unnormalized class sums). Membership and log comparisons are on finite cyclic quotients before the unramified limits exactly as in the local comparison, with no division by a growing degree. In the exceptional $\( u_j \)$ tests on $f_0$, (I1) has order exactly two at $u_j$ for high $theta$, since $D_s \( 0 \, upright(bold(0)) \) eq.not 0$. The $u_j$-divisibilities of both $b^plus.minus$ hence show $p_0^2 \/ \( D \( theta \) \/ D_(upright("odd")) \)$ has no pole there (order in $u_j$ is unchanged by extending constants).
  + At every other test, if $B \( theta \) eq.not 0$, apply the square switch proof of (D2) with that primitive divisor $D \( theta \) \/ D_(upright("odd"))$ (nonzero by residual regularity). All local lines/conditions and duality at old places apply by the preceding comparisons. Degree zeros vanish by Tate absolute irreducibility over $K$ (even before scalar character, on either plane), and Selmer $H^1$’s inject into unrestricted crossed classes including at surplus fibers. The new derivative primes for this test are #emph[additional] inert primes, tending to conjugation on full Tate data as at (K), not changing the variables. That proof applies on the modular abelian factor also, with fixed dyadic conductor and old moving conductors unramified at the required fixed places, high-character Kummer membership as above. For each surplus test the conjugate induction on the fiber is absolutely simple by Tate simplicity and distinct twisted determinants (high dyadic inertia in $theta$). Restriction to product kernels fixing full Tate and ring-class data detects evaluations by the same central homothety trivial on ring fields used at (D2); hence squares of elements $c eta$ with $eta$ there provide rank-two evaluations including one of a primitive reduction, as in that proof. Thus (K) and exact plane comparisons give the nonnegative class-functional valuation at the DVR by switching to minimal fiber rank with integral classes (fixed multipliers are units). This says $p_0^2 \/ \( D \( theta \) \/ D_(upright("odd")) \)$ has no pole here either.
  Consequently normality and (B1) give $B \( theta \) in \( D \( theta \) \)$ after inverting two in the extended series ring; this is automatic if $B \( theta \) = 0$. Residual regularity at $t = 0$, a tame Weierstrass change, and the high-character remainder test give $D divides B$ integrally for both planes.
  Let $U_0 = B_0 \/ D_0$ be the integral CM quotient. Canceling the common $product_j u_j^2$ gives $tilde(B) = U_0 tilde(D)$, so its constant coefficient is the scalar ratio computed in Lemma 108. It is a dyadic unit, and hence $U_0$ is a unit. Finally the congruences $B_E equiv B_0$ and $D_E equiv epsilon.alt D_0 med \( mod med pi \)$, together with $D_0 med mod med pi eq.not 0$, identify the quotient reductions by cancellation. Thus the elliptic quotient is also a unit. ◻
]

=== 13.6 The ordinary center and the exact product formula <the-ordinary-center-and-the-exact-product-formula>

#proof[
  Use the unit identity of Proposition 109 first at $t = 0$ on a group-power tame line retaining generic nonvanishing and nonzero dyadic Frobenius exponent, localized at its characteristic-zero origin. The rank-detection argument in the proof of Proposition 73 applies there, with the following local checks: dyadic conditions use the unramified Kummer and log comparisons at that DVR, specializing to usual Kummer. All odd local complexes are contractible there including the inert moving ones by $a_(j \, *) eq.not 0$. Thus the all-dyadic-finite problem has special rank one by $s_2 \( E \/ K \) = 1$ and inflation, with only the paired lines in special cohomology. The $t = 0$ log formula gives the square of the weighted trace localization up to units there (all Euler terms nonzero at the origin by their weights); again one may first multiply by the Frobenius bound of the unramified comparison. Strict generic acyclicity and nonzero log then give the generic line assertions by (D), and zero valuation of the class-functional tensor by the unit equality. Hence the global class specializes nontrivially exactly as in the rank implication there. This specialization is the Heegner Hilbert trace on the curve times $product_j a_(j \, *)$ (and any fixed nonzero class multiplier), by the inert Hecke relations. By (GZ-E) the curve’s split product therefore has a simple zero and hence finite Tate–Shafarevich over $K$.
  At the all-zero center, let $F_j$ be the limiting Frobenius matrix on the curve at the $j$-th inert prime. It has $det F_j = - 1$ and $"tr" F_j = a_(j \, *)$, so
  $ det \( F_j^2 - 1 \) = det \( F_j - 1 \) det \( F_j + 1 \) = - a_(j \, *)^2 . $
  The full-to-unramified singular block is in degrees $1 \, 2$, with Frobenius square and residue size tending to one. Its determinant therefore has valuation $2 v_2 \( a_(j \, *) \)$. Inflation identifies the remaining strict complex with the original strict complex. On the numerator (M3) the inert traces in each orientation give exactly the same valuation multipliers. Cancelling therefore gives the equality of valuations for the true strict complex and paired conductor-one log used at (E), now with support $S_f$ (the calculation there includes extra split good primes just the same way by Haar). Thus (E) and (G) give $X \( E \) + X \( E^k \) = 0$, with the general split odd discriminant $k < - 4$; here the split Gross–Zagier normalization and isogeny comparison are as specified at (GZ-E). Restoring the original notation, this proves
  $ "an" \( E^h \) + "an" \( E^(h k) \) = 1 \, #h(2em) X \( E^h \) + X \( E^(h k) \) = 0 . $
  The product $h$ is an odd positive fundamental discriminant, or $1$, prime to $2 N_E$; the odd negative discriminant $k$ is prime to $2 h N_E$, and every prime dividing $2 h N_E$ splits in $K$. These are precisely the requirements of Proposition 4. ◻
]

== 14 The real $S_3$ anchor and the detector at infinity <sec:real>

Suppose that $W = E \[ 2 \]$ has image $S_3$ and that its quadratic sign field $L$ is real. Complex conjugation then acts trivially on $W$: its image has order at most two, and the only even permutation of that order in $S_3$ is the identity. We prove the remaining $S_3$ case of Proposition 4.

#thm([Proposition 14.1.])[
  (The real $S_3$ anchor).  #emph[There are a fundamental discriminant $h$ prime to $2 N_E$, allowing $h = 1$, and an imaginary quadratic field $K$ of discriminant $- d$ prime to $2 h N_E$, in which every prime dividing $2 h N_E$ splits, such that 
$ "an" \( E^h \) + "an" \( E^(h \( - d \)) \) = 1 \, #h(2em) X \( E^h \) + X \( E^(h \( - d \)) \) = 0 . $

]
] <real:anchor>

The new ingredient is a nonzero residual functional on the real components of a Fricke twist of a modular Jacobian. To use that functional, we construct an integral global class by a Pfaffian cofactor calculation. The horizontal logarithm calculation and the integral denominator calculation are kept separate until the final specialization.

=== 14.1 The level and an elliptic starting pair <the-level-and-an-elliptic-starting-pair>

The representation $W$ is absolutely simple. Over $bb(F)_4$ it is induced from a cubic character $psi$ of $G_L$, and the nontrivial automorphism $iota$ of $L \/ bb(Q)$ inverts $psi$. Write $d_L > 0$ for the fundamental discriminant of $L$.

#thm([Lemma 14.2.])[
  (A level supporting the real character).  #emph[The character $psi$ is a character of an ordinary ring class group of $L$. If $b$ is its ring conductor, then its character conductor ideal is $b cal(O)_L$, and the odd part of the Artin conductor of $W$ is $d_L^(upright("odd")) \( b^(upright("odd")) \)^2$. Choose a good prime $ell_0 equiv 3 med \( mod med 4 \)$, outside the conductor support, whose Frobenius on $W$ is a $3$-cycle. Then 
#[#set math.equation(numbering: n => "(14.1)")
 $ n = 2^delta d_L^(upright("odd")) \( b^(upright("odd")) ell_0 \)^2 \, #h(2em) delta = v_2 \( d_L \) med mod med 2 $ <real:level-formula>]

 satisfies $bb(Q) \( sqrt(n) \) = L$, and $psi$ factors through $"Pic" \( bb(Z) \[ sqrt(n) \] \)$.]
] <real:level>

#proof[
  The character has no conductor at infinity, since its order is three. It kills rational ideles: anti-invariance makes its value on a rational idele equal to its inverse, and an element of order dividing both two and three is trivial. At split primes the two conductor exponents agree. At a ramified odd prime a positive conductor exponent is even. Indeed conjugation acts trivially on residue units and by $\( - 1 \)^j$ on the last contributing principal-unit layer of index $j$; anti-invariance forces $j$ to be odd, so the conductor exponent $j + 1$ is even. If $2$ ramifies in $L$, wild inertia in the $S_3$ image contains a transposition. Its normalizer has order two, so the decomposition group has order two and the cubic character is unramified there. If $2$ is unramified in $L$, the character exponents at two are at most one, by tameness.
  These local statements give conductor $b cal(O)_L$. Triviality on the local units at the corresponding ray depth, together with triviality on rational units, implies triviality on the units of the order of conductor $b$. Thus $psi$ factors through its ordinary ring class group. Lift $psi$ to characteristic zero and use the conductor formula for induction. The inertia-invariant dimensions agree after reduction, including for an order-two subgroup; the odd wild-invariant dimensions agree as well. This gives the asserted odd Artin conductor.
  Chebotarev supplies $ell_0$: the prescribed $3$-cycle and the condition $ell_0 equiv 3 med \( mod med 4 \)$ are compatible because $L$ is real. Formula (14.1) preserves the squareclass of $d_L$. The conductor of $bb(Z) \[ sqrt(n) \]$ contains all required odd factors and also contains two when $d_L$ is odd. These are exactly the remaining possible character-conductor factors. ◻
]

Put $X = X_0 \( n \)$, $J = J_0 \( n \)$, and let $w_n$ be the Fricke involution.

#thm([Lemma 14.3.])[
  (A pair with Selmer corank one).  #emph[There is an odd fundamental discriminant $h$, prime to $2 n N_E$ and allowing $h = 1$, such that $E_0 = E^h$ has trivial two-Selmer group. There is also a fresh prime $d equiv 7 med \( mod med 8 \)$ such that $K = bb(Q) \( sqrt(- d) \)$ splits every prime dividing $2 n h N_E$, $W \( upright("Fr")_d \)$ is a $3$-cycle, and 
$ s_2 \( E_0 \/ K \) = 1 . $

 The class number of $K$ is odd and its units are precisely the signs.]
] <real:selmer-pair>

#proof[
  First take an odd fundamental signed twist, prime to $2 n N_E$, with functional sign plus; use a split negative discriminant if the sign must change. Since $W$ has no rational invariants, the two-Selmer dimension is even by the parity comparison of Section 2. While this dimension is at least two, take a positive good prime $p equiv 1 med \( mod med 4 \)$, locally square at all earlier support, with trivial Frobenius on $W$, at which two independent old classes have rank-two joint finite evaluation. Such a prime exists: restriction to the kernel of $W$ and of the abelian congruence data detects the classes by the normal $C_3$ without invariants. The joint evaluation image is additive over $bb(F)_2$, and absolute simplicity and independence make it simultaneously full. Chebotarev then imposes the required evaluation and congruences.
  At the new prime the old unramified plane and the new twist Kummer plane are transverse. The Kummers of the two-torsion points give the two inertia coordinates: untwisted halves are unramified, whereas twist inertia negates them. Reciprocity makes the new ramification images annihilate the old evaluations. The remaining kernel is the common strict Selmer group, so the dimension drops by two. Iterating produces $E_0 = E^h$ with trivial two-Selmer group.
  Choose $d$ by Chebotarev and quadratic reciprocity. The residue conditions expressing splitting of all primes of $2 n h N_E$ in $K$ force $d$ to split in $L$, which is compatible with a $3$-cycle on the abelian intersection. Genus theory gives odd class number, and $d equiv 7 med \( mod med 8 \)$ excludes extra units. The local conditions for $E_0$ and $E_0^(- d)$ agree at every finite place: at the old support this follows from splitting, and at $d$ the local cohomology vanishes by the cycle Frobenius. At infinity one Kummer line can change. The twist’s two-Selmer dimension is therefore at most one; the coprime split twist sign and parity make it exactly one. Quadratic induction now gives $s_2 \( E_0 \/ K \) = 1$. ◻
]

=== 14.2 A Hecke eigenfunctional on real components <a-hecke-eigenfunctional-on-real-components>

Use a maximal-order split-level Heegner point of this $K$ on $X$ as in (GZ). For its single Hilbert trace subtract the trace of the cusp at infinity, writing $Y in J \( K \)$ for the result. Put $Y' = \( T_ell - ell - 1 \) Y$ for another good prime outside $2 n d$ with cycle Frobenius. It is represented by applying that difference to the trace alone, with no cusps. This is a $sigma = w_n c$-real divisor, $c$ complex conjugation: both operations reverse orientations and permute the ideal labels into the reversed orbit (the Fricke quotient translates by a level ideal).

#thm([Proposition 14.4.])[
  (The detector at infinity).  #emph[There is an $bb(F)_2$-linear functional 
#[#set math.equation(numbering: n => "(R0)")
 $ Theta : H^1 \( chevron.l sigma chevron.r \, T_2 J \) arrow.r bb(F)_2 \, quad Theta T_p = "tr" W \( upright("Fr")_p \) Theta med \( p divides.not 2 n \) \, #h(2em) Theta \( \[ Y' \] \) eq.not 0 . $ <eq:R0>]

 where $\[ Y' \]$ denotes the twisted real Kummer class.]
] <real:detector>

#proof[
  The Betti exponential sequence and its 2-adic period lattice identify this group with the components of $J \( bb(C) \)^sigma$, or its quotient by norms, compatibly with Kummer. We will assign a weight to each real circle of $X$, show that the resulting divisor count is a Hecke eigenfunctional, and evaluate it on the Hilbert trace.
  #emph[Weights on the real circles.]
  A $sigma$-fixed interior point gives an anti-linear isogeny $S$ of the elliptic torus, of degree $n$ and with the specified cyclic kernel: compose the quotient map with the anti-complex Fricke identification. Since $S^2 = n$, the rational period lattice is a line over $L$, with $sqrt(n)$ acting by $S$. Identifying this line with $L$ gives a fractional ideal $I subset L$, well-defined up to $L^times$, with multiplier order $O supset O_0 := bb(Z) \[ sqrt(n) \]$.
  The ideal $I$ is locally invertible over $O$. Indeed, locally scale a quadratic-order lattice into the maximal order, with both minimal valuations zero in the split case. It can then be scaled by a unit to contain 1, avoiding at most two proper residual subspaces. A lattice between $bb(Z)_p$ and the maximal order that contains 1 is an order. This gives the asserted invertibility over the multiplier order, and hence a class $a = \[ I \] in "Pic" \( O \)$. No odd prime $p$ divides $\[ O : O_0 \]$: otherwise the form of nested quadratic orders gives $p divides n$ and makes $S$ scalar modulo $p$, hence zero, contradicting its cyclic kernel.
  Use the extension map $"Pic" \( O_0 \) arrow.r "Pic" \( O \)$ to test whether $psi$ descends to $O$. Give the point weight zero if it does not; if it does, continue to denote the descended character by $psi$ and give the point weight
  $ theta = psi \( a \) + psi \( a \)^(- 1) $
  in characteristic two. Replacing $S$ by $- S$ conjugates the ideal class and therefore preserves this weight. There is no order-two elliptic stabilizer modulo signs: multiplication by $i$ cannot preserve the level at $ell_0$. Multiplying $S$ by a possible order-three elliptic automorphism, up to sign, conjugates it by a level automorphism up to sign, since the anti-complex isogeny inverts these scalars. Thus these choices also preserve the weight.
  The weights are constant on each real circle. On a compact local uniformizing chart, trivialize the integral period lattice. The anti-linear maps of fixed degree have bounded norm, so only finitely many integral matrices occur. Each branch therefore has constant ideal-class data; at a branch meeting the possible choices have the same weight by the preceding sign and automorphism calculation. No cusp is fixed: its denominator divisor of $n$ is unchanged by $c$ and exchanged with its Fricke complement by $w_n$, whereas $n$ is nonsquare.
  #emph[From circle weights to a component functional.] There exists a real point: on the chosen Hilbert orbit $sigma$ acts on the conductor-one labels by $z mapsto a_0 z^(- 1)$ for a fixed $a_0$. The class number is odd, so $z^2 = a_0$ has exactly one solution. Denote the corresponding fixed CM point by $x$. Every invariant line bundle class therefore has a real divisor: use the fiber at $x$ to lift the real action with square one, then apply real Riemann–Roch after adding a sufficiently large multiple of $x$.
  For such a divisor, count its points on each real circle modulo two, multiply by that circle’s weight $theta$, and add. A principal invariant divisor is the divisor of a function that can be scaled to be real; its parity on each circle is even. Norm divisors also have zero count. The weighted count consequently descends to degree-zero divisor classes and vanishes on the identity component, which consists of norms. This defines the required component functional.
  #emph[The Hecke eigenlaw and the Hilbert trace.] We can compute the Hecke action at generic real points, since small motions preserve the component counts both before and after the correspondence. Nonreal pairs contribute zero. On the unbranched locus without automorphisms modulo signs, real lifts under $T_p$ correspond to $S$-stable $p$-lines. At inert $p$ there are none. At split $p$, the descended anti-isogenies give the two prime-ideal translates of $I$, with the same multiplier order. If $psi$ descends to this order and $frak(p) divides p$, their weights add to
  $ #scale(x: 120%, y: 120%)[\(] psi \( frak(p) \) + psi \( frak(p) \)^(- 1) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] psi \( a \) + psi \( a \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  If $psi$ does not descend, all these weights are zero. This proves $Theta T_p = "tr" W \( upright("Fr")_p \) Theta$.
  It remains to compute the weight of $x$. The character $psi$ factors through its multiplier order $O$. The only case not already settled by the odd-index argument is nonzero character conductor at two when $n$ and $d_L$ are odd. Here $S$ interchanges the two parts of the split $cal(O)_K ⊗ bb(Z)_2$-lattice invertibly, by anti-linear scalar conjugation. It cannot be scalar modulo two, so the overorder index is odd in this case as well.
  The CM action of $sqrt(- d)$ anticommutes with $S$. On $L$ it therefore has the form $beta iota$. Its image $beta I^iota subset I$ is an $O$-submodule of index $d$. The prime $d$ splits in $L$ and is prime to the order conductor, so this image is $frak(d) I$ for one of the primes $frak(d)$ above $d$. Taking ideal classes gives
  $ \[ frak(d) \] a = \[ I^iota \] = a^(- 1) \, #h(2em) \[ frak(d) \] = a^(- 2) . $
  The choice of $d$ gives $psi \( frak(d) \) eq.not 1$, whence $theta \( x \) = 1$. All other points in the Hilbert orbit occur in nonreal pairs. Since the detector prime $ell$ has cycle Frobenius and $ell + 1$ is even, applying $T_ell - ell - 1$ leaves this count equal to one. This proves (R0). ◻
]

=== 14.3 The integral Hecke module <the-integral-hecke-module>

Use the anemic cusp Hecke algebra at this level (all $T_p \, med p divides.not 2 n$). By (R0) it has the maximal ideal of $W$; write $A$ for its completed factor and $M = \( T_2 J \)_A$. It is a reduced order finite free over $bb(Z)_2$ with residue $bb(F)_2$. Here and below we use ordinary newform theory and the modular abelian factors with their Tate realizations and level/conductor compatibility.

#thm([Lemma 14.5.])[
  (The rank-two Hecke module).  #emph[There is a free rank-two $A$-module $P$, with Galois action of cyclotomic determinant and residual representation $W$, such that 
#[#set math.equation(numbering: n => "(14.2)")
 $ M = P ⊗_A D . $ <real:morita>]

 Here Galois acts only on $P$, $D$ is a multiplicity lattice free over $bb(Z)_2$, and $P$ rationally carries the primitive newform representations in the Hecke factor. No freeness of $D$ over $A$ is asserted or needed. All these primitive forms are non-CM. Their levels equal the specified level away from $2 \, ell_0$; at $2 divides n$ they are Steinberg. The only possible multiplicity increase comes from $ell_0^2$-raising a form unramified at $ell_0$.]
] <real:packet>

#proof[
  Rational plane traces of group elements belong to $A$ reducing to traces of $W$, by density. Componentwise reductions have semisimplification $W$ after residue extension by trace and determinant, hence are absolutely irreducible. Choose four group elements spanning the residual matrix algebra (by absolute simplicity); their trace Gram determinant is a unit. They therefore span all the Galois matrices integrally, a free rank-four algebra acting on $M$, reducing to the matrix algebra. Lift a primitive residual matrix idempotent by completeness. Its associated left ideal is free rank two and the algebra acts as all matrices on it by Nakayama. This gives the assertions including the decomposition (matrix Morita equivalence); $D$ is free over $bb(Z)_2$, not required free over $A$.
  All occurring primitive forms are non-CM (else on an imaginary quadratic field the Tate reductions semisimplify reducibly, impossible for $W$). Their levels away from $2 \, ell_0$ are exactly the given one since residual conductor is a lower bound (inertia invariants, and odd wild invariants). At $ell_0$ exponent one is impossible by cycle Frobenius versus Steinberg with trivial nebentypus. Also at $2 divides n$ no old form of good level occurs. Otherwise its modular abelian variety of good reduction at two would yield a finite flat model of the local $W$: it occurs as a global two-torsion subquotient, by the rational Tate realizations and lattice independence of reduction semisimplification (the chosen coefficient embedding reduces to a scalar extension of $W$). Take closures and quotients over the DVR. The unique local line would give a finite flat subgroup of order two, thus $mu_2$ or $bb(Z) \/ 2$ over $bb(Z)_2$ (order-two finite flat classification). The nontrivial generic point of the quotient extends by properness, so lifting it gives the residual quadratic radical by a torsor under that subgroup, a unit or unramified radical. This contradicts $v_2 \( d_L \) = 3$ with decomposition of order two. Thus $2$ is purely Steinberg then. The only multiplicity increase is possible by $ell_0^2$-raising a primitive form unramified there. ◻
]

Fix a unimodular determinant form on $P$. We will use the detector by factoring the projected Hilbert trace as

$ Y = a p \, $

where $p$ is an integral global class fixed by $sigma = w_n c$ and $a$ belongs to the coefficient order, after the flat extension used for measures. If $a$ has zero residue, applying $T_ell - ell - 1$ and restricting to infinity contradicts (R0). The construction below must therefore control the integral class $p$, not just its rational span. The Pfaffian supplies a global lift; the subsequent logarithm and denominator comparisons make its specialization integral.

=== 14.4 Parity and the Pfaffian strict system <parity-and-the-pfaffian-strict-system>

#thm([Lemma 14.6.])[
  (Parity on the primitive components).  #emph[If $g$ is one of the primitive components or its quadratic twist and has odd functional sign, its two-adic characteristic-zero Kummer Selmer dimension over $bb(Q)$ at the chosen embedding is odd.]
] <real:parity>

#proof[
  Choose an odd imaginary discriminant $k'$ splitting $2 N_g N_(E_0)$ with $L \( g ⊗ chi_(k') \, 1 \) eq.not 0$, by the split sign and twist nonvanishing as at the outset. This last form has zero Selmer rank there: use (K0) with a further imaginary split Heegner companion giving simple twist zero by derivative nonvanishing. The Tate absolute irreducibility required holds over any such imaginary field (residual $W$ with real quadratic $L$). This uses the split Gross–Zagier input to (K0).
  Over the field of $k'$ use one full and one strict condition at each split pair over $2 N_g N_(E_0)$, comparing a Tate lattice for $g$ and the elliptic $T_2 E_0$ at a common scalar DVR. Use (H1) on induction including good unramified conditions at the odd discriminant places. These are perfect self-dual problems in degrees $1 \, 2$ (residual invariant vanishing, injectivity for conditions in degree zero and duality), with identical residual diagrams. Thus the characteristic-zero strict-pair dimensions have equal parities. Odd local factors are acyclic in characteristic zero by invariant vanishing for the abelian Tate realization and the odd Euler formula. At the split dyadic pair the full/strict plane and the plane of finite Kummer lines meet in a line, with no local invariants; both are Lagrangian in degree one for the conjugate pairing, which is symmetric (cup sign and alternating determinant form, with conjugate local invariants identified). For the form the finite lines are exact orthogonals by abelian polarization and Hecke projection, with Lie dimension one. Thus passing to the ordinary Selmer problem flips parity by the symmetric-plane comparison of the arithmetic diagram conventions. The ordinary dimension on $E_0$ there is odd by quadratic induction, elliptic parity and split sign. Hence also on $g$; decomposing by quadratic induction with the twist Selmer rank zero gives the claim. ◻
]

Return to $K$ of discriminant $- d$. Allow a fixed finite set $S$ of split rational primes containing those of $2 n N_(E_0)$; the place over $d$ when included for induction always has the original unramified condition. Use the split anticyclotomic free $2$-direction $1 + t$, with strict at $w divides 2$ as before, and also product character variables $1 + u_j$ from the 2-Sylows at varying good inert prime conductors $q_j arrow.r - 1$ two-adically. Add the conductor places to allowed support. By units and odd class number the relative cyclic Sylows have orders $2^(v_2 \( q_j + 1 \))$, with primitive relative inertia actions, independent across the primes. All systems here use the finite models and common-stage extensions/limits of the arithmetic diagram conventions as in the other split construction. Put $R = A \[ \[ t \, upright(bold(u)) \] \]$, with total scalar character $chi$ on the arithmetic coefficient $P chi$. The full strict determinant below will use strict at $w$, full elsewhere over finite allowed places (not relaxing ramification at $d$). Define the modified complex $C$ by the following local conditions.

- keep that dyadic pair; at each odd pair of $S$ put one full coordinate (chosen with $chi \( upright("Fr")_v \) = xi_q$ equal to the positive CM orientation’s inverse-translation weight as at (M2)), the other zero;
- use a first inert prime $q_0$ with $W \( gamma_0 \)$ a 3-cycle ($gamma_j$ rational Frobenius lift notation), giving an acyclic full local complex already by residual testing;
- at each $q_j \, med j > 0$ require $W \( gamma_j \) = 1$ and nonzero limiting Tate trace on all components and also on $E_0$. Write $Phi_j = lim rho_P \( gamma_j \) \, med alpha_j = "tr" Phi_j$ (also at $j = 0$, with unit trace). Then $det Phi_j = - 1$, $Phi_j^2 - 1 = alpha_j Phi_j$, and $gamma_j^2$ is trivial on all ring class fields of $K$ (inversion coset). One has a tame/Frobenius Koszul local complex on $m_j \, alpha_j Phi_j$, $1 + m_j = \( 1 + u_j \)^(b_j)$ for a unit $b_j in bb(Z)_2^times$, with terms
  $ P_R arrow.r \( P_R \)_s xor \( P_R \)_f arrow.r P_R $
  in degrees $0 \, 1 \, 2$. Indeed use the two procyclic calculations of the diagram conventions ($q_j^2 arrow.r 1$). For a summand line $l subset P_R$, impose the subcomplex $U_j$ on $l arrow.r l_s xor \( Phi_j l \)_f arrow.r Phi_j l$.

#thm([Lemma 14.7.])[
  (The modified local conditions).  #emph[For $j > 0$, the subcomplex $U_j$ splits off and is exactly self-orthogonal for conjugate local duality. The resulting complex $C$ has a perfect self-duality and a minimal square model $delta_C : F arrow.r G$ in degrees $1 \, 2$. The full strict problem also has square amplitude $1 \, 2$.]
] <real:local-conditions>

#proof[
  The complex $U_j$ and its degree-two-shifted dual, and the two analogues for a complementary line, are Koszul models of $R \/ \( alpha_j \, m_j \) \[ - 2 \]$ (regular sequence even over the order). Pairing morphisms are thus determined on $H^2$, which can be checked on $H^2 \, H^0$ pairing after reduction to that quotient (last-term cohomologies commute with reduction here). Then the local $K$-action is trivial, conjugate transport via $gamma_j$ is by $Phi_j$ up to scalar unit, and $e \( Phi_j l \, Phi_j l \) = 0$ with the opposite entries for complementary lines units by the determinant form $e$. Indeed the last term gives the tame-residue class up to unit trace normalization by the procyclic cochains and local duality at each quotient precision; Shapiro cup uses the invariant over $K_v$, not twice that map. This proves nullhomotopy and quotient duality over $R$.
  Thus $C$ has perfect self-duality and a minimal square model $delta_C : F arrow.r G$ in degrees $1 \, 2$ by residual invariant vanishing over $K$, injectivity of the local condition maps on $H^0$, and duality. The full strict complex also has square amplitude $1 \, 2$ as before (dual invariant vanishing, and strict at $w$ removes the global Euler contribution). ◻
]

#thm([Proposition 14.8.])[
  (Residual transversality).  #emph[The moving inert primes can be chosen so that 
#[#set math.equation(numbering: n => "(R1)")
 $ \( det delta_C \) \|_(t = frak(m)_A = 0) eq.not 0 $ <eq:R1>]

 and likewise for the full strict determinants on $P$ and $T_2 E_0$.]
] <real:transversality>

#proof[
  #emph[Frobenius weights at fixed places.] At $q_0$ require that the Frobenius exponents in $u_0$ at #emph[every] fixed place over $S$ are nonzero. Indeed take principal generators $x_v$ for the $h \( K \)$-th ideal powers of one chosen place at each split prime. Along inert $q_0 arrow.r - 1$ the power symbol of order $2^a divides q_0 + 1$, $a arrow.r oo$, kills rational residues and reads the translations on $2^a$-roots by $gamma_0^2$. Thus by ring class reciprocity and odd $h \( K \)$ it detects the exponents via $x_v$. Take lifts approaching $c eta \, med eta in G_K$ fixing the cyclotomic data and with cycle image giving $W \( c eta \)$ a cycle (compatible on the abelian intersection). On its square the translations are differences on conjugate numbers. Vary $eta$ within the deeper kernel of $W$; the Kummer tuples for the $x_v$ and their conjugates there with cyclotomic fixed have open image by independent valuations even after the finite extension (rational Kummer restriction survives the cyclotomic tower by a central nonidentity scalar). Thus all differences can be kept nonzero; apply Chebotarev. At the residual generic field in the $u$’s with $t = 0$ this gives vanishing local $H^0$ at both dyadic places and acyclicity at fixed odd allowed support.
  #emph[Parity of the residual problem.] After each step including $q_0$ the residual generic strict $H^1$ there has even dimension $h_(upright("res"))$. Indeed compare with $E_0$ over $bb(Z)_2 \[ \[ upright(bold(u)) \] \]$ at $t = 0$, using the fixed strict/full coordinates of $C$ and full at moving support. Apply the parity test (H1) first at the DVR of $\( 2 \)$, then along a characteristic-zero line germ at zero (start on an integral group-power line retaining generic ranks). At these localizations the moving inert terms are acyclic (inertia scalars or dummy-cycle at the first test, nonzero corresponding Tate traces at the characteristic-zero center). Thus the problem is self-dual there with square amplitude as above; pull back to the zero conditions at those places for (H1). At the characteristic-zero center use unramified inflation to remove the added places (unramified terms there acyclic too), getting the fixed-place problem. Here strict dimension is even by $s_2 \( E_0 \/ K \) = 1$ and the symmetric-plane dyadic parity flip above. This gives even residual generic dimension as claimed, since modified and full and the curve’s and packet’s problems agree there by acyclicity at varying and fixed odd allowed places.
  #emph[Rank reduction.] While $h_(upright("res")) gt.eq 2$, add another $q_j$ as specified with old residual rank-two evaluation in the finite plane of two independent old classes there. Initially omit its variable (unramified inflation). At $u_j = 0$ in the old residual generic field the new local action is trivial; take the pure singular plane instead of the finite one (with degree zero included, degree two omitted). These conditions are self-annihilating as in the square switch (pure cup calculation for $q_j^2 arrow.r 1$, conjugate transport by $gamma_j$ preserving the two axes). Thus rank two gives a drop by two. This change deforms in the residual coefficients to using the auxiliary local condition $\[ P_R arrow.r \( P_R \)_s \]$ in degrees $0 \, 1$, differential $m_j$ (other Koszul differential zero there). Generically with $u_j$ added it and the full and modified conditions give identical cohomology by acyclicity. Consequently the new $h_(upright("res"))$ is no greater than the switched dimension by the finite free models.
  #emph[Simultaneous evaluation and nonzero traces.] For existence of that choice use the product evaluations as in the imaginary case, taking $gamma_j$ approximating $c eta$ with $eta$ in the termwise product kernel $cal(H)$ of $W$, cyclotomic and all old ring-field data over $K$. Old residual strict classes inject into unrestricted crossed classes there on the product of the $G_K$’s. The conjugate induction (adding constant $c$ to that product) is absolutely simple by absolute simplicity over $K$ and distinct determinants of the scalar twists (infinite order already via $u_0$). Restriction to $cal(H)$ detects classes: the quotient contains a normal product of the $C_3$’s acting in $W$ alone (other data abelian over $K$), whose diagonal $C_3$ is central in that product without invariants, killing also its abstract $H^1$. Thus joint evaluations on $cal(H)$ span full copies. Evaluation on $\( c eta \)^2$ then projects via $1 + c$ to the original plane coordinates, still additively with full span. Some determinant is nonzero by the quadratic polarization test.
  Perturb by products of squares within $cal(H)$ without changing the residual test. This can ensure all the nonzero limiting traces simultaneously. Indeed each characteristic-zero projection on $G_K$ has Zariski closure containing $upright("SL")_2$. To see it, irreducibility is already ensured by $W$. If the identity group were solvable it would be toral (the normal unipotent radical acts trivially); potential scalars are excluded by the unequal Hodge–Tate weights. The two torus lines would then be preserved over a quadratic field for the full rational-base representation, necessarily $L$ by residual irreducibility over other quadratic fields. But geometric one-dimensional characters over the real quadratic field have parallel weights: by local algebraicity of one-dimensional de Rham characters (classical abelian Hodge–Tate character theorem), their powers on small units at two, at the two embeddings combined, must be parallel by testing a power of a global infinite-order unit (inertia characters away from two have finite image). The two line characters interchanged over $bb(Q)$ would therefore have equal weights, impossible. This proves the Zariski assertion by the two-dimensional algebraic subgroup classification.
  The constant second derived subgroup of $G_K$ is available in $cal(H)$ termwise, since the excluded data have derived length at most two. Its projections and the groups generated by its squares still have closures Zariski containing $upright("SL")_2$, by brackets/group commutators and squaring there. Thus on the simultaneous compact closure each trace-zero test on the coset of the limiting matrices has empty interior (every finite-index projection still Zariski contains the connected $upright("SL")_2$). Avoid them all and approximate by a product of squares. Chebotarev at increasing precision as in the evaluation lemma now achieves the requirements. Even parity and the successive drops prove (R1). ◻
]

Put $s_C = det delta_C$. It is regular in $R$, by (R1) and the embedding of the reduced coefficient order into its integer components. Let $K_b : G arrow.r F^or$ be the degree-two component of the compact pairing.

#thm([Lemma 14.9.])[
  (An integral alternating presentation).  #emph[There is an integral matrix $H$ such that 
#[#set math.equation(numbering: n => "(14.3)")
 $ K' = K_b + delta_C^t H quad upright("is invertible") \, #h(2em) K' delta_C quad upright("is alternating") . $ <real:alternating-presentation>]

 The common rank of $F \, G$ is even. The element 
$ cal(P) = "Pf" \( K' delta_C \) $

 is regular and remains nonzero after reduction in (R1). Its Pfaffian adjugate, denoted $\# \( K' delta_C \)$, satisfies 
$ \# \( K' delta_C \) K' delta_C = cal(P) thin 1 . $

]
] <real:pfaffian>

#proof[
  Set $B = delta_C^(- t) K_b$. Its reduction modulo integral matrices is an alternating linking form with values in $R \[ 1 \/ s_C \] \/ R$. For the diagonal assertion, test $g in G$ by $s_C delta_C^(- 1) g med mod med s_C$; its Bockstein from reduction modulo $s_C^2$ is represented by $g$. After inverting all $alpha_j$, $j > 0$, or all $m_j$, $j > 0$, both the nonstandard conditions and their full local complexes are acyclic. Replace them, and the dummy-prime condition, by zero and apply (H1), with the scalar clearing allowed there. The diagonal values of $B$ are therefore integral in both localizations. The products $product_(j > 0) alpha_j$ and $product_(j > 0) m_j$ form a regular sequence, so these localizations intersect in $R$. If there are no such primes no intersection argument is needed. The same linking pairing supplies the alternating off-diagonal relations.
  Consequently $B_(i i) in R$ and $B_(i j) + B_(j i) in R$. Choose $H_(i i) = - B_(i i)$, and, for each unordered pair of distinct indices, choose the two integral entries of $H$ to cancel $B_(i j) + B_(j i)$. Then $B + H$ is literally alternating. No division by two is involved. Since
  $ K' delta_C = delta_C^t \( B + H \) delta_C \, $
  this proves alternation. Minimality gives $delta_C = 0$ modulo the maximal ideal, while perfectness makes $K_b$ invertible there. Thus $K'$ is invertible. Since $det delta_C$ is regular, the alternating matrix has even size, and $det \( K' delta_C \) = cal(P)^2$ proves the asserted regularity and residual nonvanishing. The adjugate identity is the usual integral polynomial identity for Pfaffians. ◻
]

=== 14.5 Cofactors and divisibility by all auxiliary traces <cofactors-and-divisibility-by-all-auxiliary-traces>

Set $t = 0$. The arithmetic finite-model construction allows us to use the matrices for $P$ also on $M = P ⊗_A D$, by tensoring with $D$. We also allow the flat integer coefficient extensions used for the measures. Tensor factors are suppressed in the formulas.

#thm([Lemma 14.10.])[
  (The cofactor lift).  #emph[Let $eta$ be a closed degree-one input at $w$, and let $beta : C_w \[ - 1 \] arrow.r C$ be the strict-place boundary map. Put 
#[#set math.equation(numbering: n => "(14.4)")
 $ y = \# \( K' delta_C \) K' beta eta . $ <real:lift-formula>]

 There is a global cycle $z$, obtained from $y$ by integral maps and an integral correction multiplied by $cal(P)$, such that 
$ delta_C y = cal(P) thin beta eta \, #h(2em) "loc"_w z = cal(P) eta $

 in cohomology, after a consistent choice of sign. If a scalar $c$ clears $eta$, it also clears this construction of $z$.]
] <real:cofactor-lift>

#proof[
  The Pfaffian adjugate identity implies
  $ delta_C \# \( K' delta_C \) K' = cal(P) thin 1 . $
  It can first be checked after inverting $s_C$, where it is the inverse-matrix identity, and then holds integrally by regularity. It remains true under every subsequent specialization, including one where the specialized differential is singular.
  Map back to the fiber model at $w$, where $beta$ is the shifted local inclusion, and include the comparison homotopies. Projection to the problem relaxed at $w$ gives a global cycle after subtracting $cal(P)$ times the corresponding integral nullhomotopy value on $eta$. The fiber equation gives the asserted localization. Choose an unrestricted global minimal model with no degree-zero term. All comparison maps and corrections are integral before being applied to $eta$. Changing $beta eta$ by $delta_C v$ changes $y$ by $cal(P) v$, by the same adjugate identity, which also accounts for changes of representatives. Linearity proves the clearing assertion. ◻
]

We isolate the algebra that keeps the full product of the auxiliary traces. In particular these traces need not be relatively prime.

#thm([Lemma 14.11.])[
  (Pfaffian divisibility with repeated factors).  #emph[Let $R_0$ be a commutative ring, let $sans(A) \, sans(B)$ be alternating matrices of even size, and let $Delta = "diag" \( d_1 \, dots.h \, d_(2 r) \)$. Suppose 
$ sans(A) = Delta sans(B) Delta \, #h(2em) v = Delta b \, #h(2em) L = H Delta $

 with all matrices integral. The target of $L$ may be any $R_0$-module. If $Q_Delta = product_k d_k$, then 
#[#set math.equation(numbering: n => "(14.5)")
 $ "Pf" \( sans(A) \) & = Q_Delta "Pf" \( sans(B) \) \,\
L \# sans(A) thin v & = Q_Delta H \# sans(B) thin b . $ <real:weighted-pfaffian-id>]

 Thus $L \# sans(A) thin v + "Pf" \( sans(A) \) c$ is divisible by $Q_Delta$ for every integral $c$. Neither regularity nor coprimality of the $d_k$ is required.]
] <real:weighted-pfaffian>

#proof[
  Every matching in the Pfaffian uses each index exactly once, proving (14.5). An entry of the Pfaffian adjugate is a signed Pfaffian minor with two indices omitted. Restoring their two diagonal factors gives, entrywise, the polynomial identity
  $ Delta \# sans(A) Delta = Q_Delta \# sans(B) . $
  Multiplication by $H$ and $b$ proves (14.5). These identities are polynomial, so remain valid after every specialization and after tensoring with any module. ◻
]

#thm([Proposition 14.12.])[
  (Integral cofactor divisibility).  #emph[Further specialize $u_j = 0$ for every $j > 0$, so that the coefficient ring is $R_1 = A \[ \[ u_0 \] \]$. For an integral input $eta$, the global coordinates of the cycle in Lemma 119 are divisible by 
#[#set math.equation(numbering: n => "(R2)")
 $ Q_(upright("aux")) = product_(j > 0) alpha_j . $ <eq:R2>]

 For an input cleared by $c$, the same assertion holds for $c z$. The assertion also holds with multiplicity coefficients $D$.]
] <real:cofactor-divisibility>

#proof[
  #emph[A common local condition.] At each specialized moving place, compare $U_j$ with the finite unramified low condition $P_(R_1) arrow.r \( P_(R_1) \)_f$. Their common subcondition is $l arrow.r \( Phi_j l \)_f$, in degrees $0 \, 1$. Quotienting by that common condition leaves rank-one differential blocks $alpha_j$, in degrees $0 \, 1$ for the low condition and $1 \, 2$ for $U_j$. Let $C_B \, C_0$ be the strict-pair problems with the low and common conditions. The low problem is exactly self-dual: the unramified cup is null, and the residual local test gives quotient duality. It has a minimal square model $delta_B : F_B arrow.r G_B$ in degrees $1 \, 2$. Its size is even. To see this at the residual closed point, remove the specialized places by unramified inflation and remove the acyclic dummy place. The resulting residual complex agrees with the elliptic fixed-support problem over $bb(Z)_2$. Identity (H1) and the characteristic-zero strict-pair parity used in Proposition 117 give even closed-point dimension.
  Take the fiber of the map from $C_B$ to the low quotients, and then extend by the high quotients contributed by the $U_j$. This gives an integral model for the specialized $C$:
  #[#set math.equation(numbering: n => "(14.6)")
   $ delta_L : F_B xor R_1^m xor R_1^m arrow.r G_B xor R_1^m xor R_1^m \,\
delta_L = mat(delim: "(", delta_B, 0, a; e_0, T_alpha, k_0; 0, 0, T_alpha) \, #h(2em) T_alpha = "diag" \( alpha_j \)_(j > 0) . $ <real:block-model>]
  Here $m$ is the number of places and signs have been absorbed in the bases. The first two blocks model $C_0$ and project to $C_B$. All maps in this construction are the local-condition comparisons.
  #emph[Transport of the alternating presentation.] The model (14.6) splits over the local ring into a minimal part and unit differential disks. The derived comparison with the original specialized model, which is still minimal, is a degreewise isomorphism on the minimal parts: a homotopy equivalence of minimal free complexes is an isomorphism after reduction and hence before reduction. Pull back $K'$ there. Both minimal sizes are even, so the remaining number of unit ranks is even; equip those disks with a unimodular hyperbolic alternating pairing. We obtain an invertible $K_L$ such that $K_L delta_L$ is alternating. Moreover $K_L$ differs from the actual compact-cup component by $delta_L^t$ times an integral matrix. This is the form of the linking modification and of a homotopy difference on two-term models; the unit disks are contractible.
  Pfaffian and adjugate congruence formulas transport the lift, up to a scalar unit and $cal(P)$-multiples of integral corrections. The disk block has unit Pfaffian. Projection to the minimal part therefore transports the lift formula itself, without inverting the specialized differential. Boundary entries that differ by a differential change the lift by a $cal(P)$-multiple, as in Lemma 119. The transferred global homotopies have the same property, because $delta_C y = cal(P) beta eta$ and the global model has no degree-zero term. By naturality the boundary entry in the large model is the image of the common boundary in $C_0^2$.
  #emph[The factors on rows, inputs, and projections.] We verify the three factorizations needed for Lemma 120: one for the alternating matrix, one for the boundary input, and one for projection to global cochains. Let $r_i$ be a low extra column and $e_i$ its low row. Then $delta_L r_i = alpha_i e_i$. For every $g in C_0^2$, the $r_i$-coordinate of $K_L g$ is divisible by $alpha_i$. Indeed the compact cup restricted to $C_0$, whether pulled back through this model or through $C_B$, agrees up to homotopy. Keep the unchanged isotropy nullhomotopies identical. On each changed common condition, which has free terms only in degrees $0 \, 1$, their difference has no degree-three tensor component and hence no ambiguity. The projection to $C_B$ kills $r_i$, and every homotopy or linking-modification term on $r_i ⊗ g$ factors through $delta_L r_i = alpha_i e_i$.
  Set $sans(A) = K_L delta_L$. All entries incident to $r_i$ therefore contain $alpha_i$. More precisely, for two distinct low indices,
  $ sans(A)_(r_i \, r_j) = alpha_j \( K_L e_j \)_(r_i) in alpha_i alpha_j R_1 . $
  This product assertion is essential when traces share factors. Let $Delta$ have entry $alpha_i$ at $r_i$ and entry one at all other indices. The preceding factorizations give an alternating integral $sans(B)$ with $sans(A) = Delta sans(B) Delta$. The boundary vector $v = K_L beta eta$ is $Delta b$, since $beta eta in C_0^2$. Finally the underlying global projection has the form $H Delta$: on $C_0$ it factors through $C_B$ up to homotopy, and, since the target has no degree-zero term, its value on $r_i$ is an integral map applied to $delta_L r_i = alpha_i e_i$.
  Lemma 120 now shows that the projected adjugate lift and every Pfaffian correction contain the full product $Q_(upright("aux"))$. This proves (R2). All maps and factorizations are integral before tensoring with $D$; they therefore remain factorizations afterward. The constant traces act injectively on that multiplicity lattice by rational semisimplicity and integer torsion-freeness. Applying the argument to $c eta$ proves the clearing assertion. ◻
]

#thm([Lemma 14.13.])[
  (Inflation at the center).  #emph[At the all-zero center, inflation from fixed support identifies the integral degree-one global groups, including with $M$ coefficients, and is compatible with the transport actions.]
] <real:center-inflation>

#proof[
  At every added prime the singular block in unramified inflation is an injective Frobenius differential in degrees $1 \, 2$. It is the limiting trace times an invertible matrix, since $q_j^2 arrow.r 1$. The same injectivity holds with multiplicity coefficients. The comparison triangles therefore identify degree-one cohomology integrally; the finite diagrams preserve the actions. ◻
]

=== 14.6 Paired and Pfaffian divisibilities <paired-and-pfaffian-divisibilities>

The passage from primitive components back to the Hecke order will use the following elementary form of Weierstrass division.

#thm([Lemma 14.14.])[
  (Divisibility over a coefficient order).  #emph[Let $B arrow.r.hook product_lambda B_lambda$ be an injective map of complete Noetherian local rings, with each component map local. Put $R_B = B \[ \[ upright(bold(z)) \, x \] \]$ and $R_lambda = B_lambda \[ \[ upright(bold(z)) \, x \] \]$. Suppose $f in R_B$ is $x$-distinguished up to a unit, of degree $d$. Then 
#[#set math.equation(numbering: n => "(14.7)")
 $ R_B \/ \( f \) arrow.r product_lambda R_lambda \/ \( f_lambda \) $ <real:quotient-injection>]

 is injective. If $B$ and all $B_lambda$ are two-torsion-free, divisibility of an integral series by $f_lambda$ in each $R_lambda \[ 1 \/ 2 \]$ implies divisibility already in $R_B$.]
  #emph[If initially $f in B \[ \[ t \, upright(bold(u)) \] \]$ and $f \|_(t = frak(m)_B = 0) eq.not 0$, the distinguished hypothesis can be achieved by a change of tame variables alone, leaving $t$ fixed.]
] <real:order-descent>

#proof[
  Write $f = u F$, where $u$ is a unit and $F$ is monic and distinguished of degree $d$. For $g in R_B$, divide it by $F$: write $g = F q_0 + r$ with $deg_x r < d$, and set $q = u^(- 1) q_0$. Then $g = f q + r$. Since the component maps are local, $F_lambda$ remains distinguished of the same degree and $u_lambda$ remains a unit. If $g_lambda in \( f_lambda \)$, uniqueness of division gives $r_lambda = 0$. Injectivity on the coefficient rings gives $r = 0$, proving (14.7). Moreover
  $ R_B \/ \( f \) tilde.eq B \[ \[ upright(bold(z)) \] \]^(xor d) $
  as a module, and the same holds on every component. These quotients are two-torsion-free under the stated hypothesis, so a class that vanishes after inverting two already vanishes integrally.
  For the final assertion, let $h$ be the nonzero residual series in the tame variables. Choose the lexicographically least exponent $\( a_1 \, dots.h \, a_s \)$ in its support. Take $N_s = 1$ and, successively, $N_i > sum_(j > i) a_j N_j$. The chosen exponent is the unique one of least weighted degree for these weights. Thus $h \( x^(N_1) \, dots.h \, x^(N_(s - 1)) \, x \) eq.not 0$. The triangular change $u_i mapsto u_i + x^(N_i)$ for $i < s$, with $u_s = x$, makes $f$ distinguished up to a unit over $B \[ \[ t \, u_1 \, dots.h \, u_(s - 1) \] \]$. This also works over the finite residue field $bb(F)_2$. ◻
]

Take determinants $s_F \, s_(*)$ of the full strict problems for $P \, T_2 E_0$ respectively. Use the paired measures (M1)–(M2) over $cal(V)^(*)$ in the same limits, odd conductor the product of the current inert primes including the dummy, with canonical connected level at 2 and depleting exactly at $S$. Take base centers by simultaneous descending cyclic quotients from a conductor-one point with transported level; use common orientations and underlying points/parameters for comparisons. Write $b^plus.minus$ for the two opposite odd orientations, and use a subscript $*$ for the elliptic $E_0$ normalized form. For the packet use the $A$-tuple of primitive normalized forms (of their respective true levels). Indeed their fully depleted antiderivative on common raised level has expansion

$ sum_(\( m \, product_(q in S) q \) = 1) T_m q_(upright("Tate"))^m \/ m \, $

so gives integral $A$-coefficients by the expansion comparison at (M1) with a basis lattice of $A$ (first allow bounded coefficient denominator). Likewise the measures agree residually with the elliptic ones. Extend power-series coefficients by the unramified integer limit as before; the extended coefficient order for $A$ is still local with the corresponding residual map ($A$ itself has residue $bb(F)_2$).

#thm([Proposition 14.15.])[
  (Paired and Pfaffian division).  #emph[The quotients 
#[#set math.equation(numbering: n => "(R3)")
 $ V_A = b^(+) b^(-) \/ s_F \, #h(2em) V_(*) = b_(*)^(+) b_(*)^(-) \/ s_(*) \, #h(2em) R_b = b^(+) \/ cal(P) $ <eq:R3>]

 are integral in the power-series rings just described. If $V_(*)$ is a nonunit, then $R_b$ is a nonunit.]
] <real:division>

#proof[
  #emph[The full paired quotients.] First take a high finite character $theta$ in $t$ and use either $E_0$ or a characteristic-zero primitive component $f$ of $A$. The divisibility after inverting 2 for the full quotients is exactly the (B1)–(D2) comparison, at all height-one tests of the multi-tame-variable arithmetic ring with 2 inverted. We check the application here.
  - Strict generic acyclicity is by (R1). The added inert locals are contractible at these tests by the nonzero limiting traces on each problem (and the two procyclic blocks); at odd fixed $q$ the unramified replacement accounts for $P_q^f \( xi_q \) P_q^f \( xi_q^(- 1) \)$ by the singular-block calculation before (B1), with $P_q^f$ the primitive Euler polynomial in the normalization at (M1). Both are generically nonzero by the nonconstant powers in $u_0$.
  - At 2 use the several-variable high-character Shapiro/Kummer calculation of the local comparisons: Frobenius has a nonzero $u_0$-exponent, with all the $u$-actions unramified there, giving the indicated flat substitution. Base ring fields locally contain each required fixed unramified layer eventually and the $theta$-field; ramification stays bounded at this fixed character depth. Thus log identification and transfer use the unnormalized weighted sums as at (B1); use full modular abelian factors then project, with fixed coefficient denominators.
  - Use extra derivative primes and the points at the primitive level exactly as in (K) and (D2), with base conductor $2^a product q_j$ here for fixed dyadic depth $a$. The relative inertia description holds by the order class sequence with our unit hypothesis; base ramification at fixed places stays bounded (composita as in (K)), and no Kummer restriction at the existing moving inert primes is required. Absolute simplicity of the Tate plane over $K$ already follows from $W$, and $chi^4 eq.not 1$ by high dyadic inertia. Thus the full-factor homothety test, rank-two addresses, and comparisons via (K) prove the nonnegative valuation in (D2) at each height-one DVR if the measure product is nonzero. Primitive orientation sums differ by Atkin–Lehner as in (M2), giving (B1) with the two Euler translations just stated. Consequently over the arithmetic ring the square of the localization coefficient is divisible by the odd-unramified-replaced strict determinant, by all those valuations; after extended log identification this gives the full divisibility for $b_f^(+) b_f^(-)$ by $\( s_F \)_f$, and analogously on $E_0$.
  For each sufficiently high $theta$, residual regularity in (R1) permits distinguished division in a tame coordinate. The quotient by that distinguished denominator is two-torsion-free, so the horizontal divisibility gives integral divisibility at the character. Apply Weierstrass division before evaluating $theta$. Its bounded remainder vanishes at all sufficiently high characters, and hence vanishes identically by the bounded-series character test. Lemma 123 checks this conclusion on the integer components and descends it to the coefficient order. Therefore $V_A \, V_(*)$ are integral.
  #emph[Comparison with the Pfaffian.] For the $A$ problem, work before specialization on a primitive component $f$, and put $S^compose = S \\ { 2 }$. There are #emph[integral power-series units] $epsilon_f \, eta_f$ such that
  #[#set math.equation(numbering: n => "(14.8)")
   $ b_f^(-) product_(q in S^compose) P_q^f \( xi_q \) & = epsilon_f b_f^(+) product_(q in S^compose) P_q^f \( xi_q^(- 1) \) \,\
frac(\( s_F \)_f, cal(P)_f^2) & = eta_f product_(q in S^compose) frac(P_q^f \( xi_q^(- 1) \), P_q^f \( xi_q \)) . $ <real:opposite-orientations>]
  Indeed in (M2) the primitive Atkin–Lehner at the full odd level part relates the sums by sign and translation by the relevant oriented prime ideals of that part (group powers in the variables, preserving canonical level at 2). The Gauss and parameter bases use the same underlying points and choices. Thus the cross identity with this unit holds at all sufficiently high characters, which suffices by boundedness.
  For the determinant the moving modified-vs-full complementary rank-one Koszul blocks have determinant units (regular sequence $m_j \, alpha_j$, acyclic in codimension one on integer components). At each fixed odd pair one adds the full complex at the place of $xi_q^(- 1)$. At level-good $q$ the singular over finite Frobenius determinant gives exactly the ratio up to unit. At minimal ramified transposition inertia, conductor one means Steinberg and the inertia difference has a unit pivot by the residual action, giving free invariant and coinvariant lines integrally with Frobenius $q a_q \, a_q$, $a_q = plus.minus 1$; thus again the stated ratio. At inertia containing $C_3$ there is acyclicity by residual testing and no Euler line. And at the level-raising prime $ell_0$ the full complex is acyclic integrally by residual Frobenius, and the Euler polynomials units (level-good with odd trace, or exponent two with no invariant line; a line would force unipotent inertia of conductor at most one). These exhaust the cases by the level construction. Pfaffian-square differs by unit from the modified determinant, proving the identity by triangles.
  Combining these identities gives
  $ V_(A \, f) = epsilon_f eta_f^(- 1) (b_f^(+) / cal(P)_f)^2 . $
  Normality on each integer component makes $b_f^(+) \/ cal(P)_f$ integral. Residual regularity of $cal(P)$, established in Lemma 118, and Lemma 123 then give $R_b$ in the coefficient order itself. Merely knowing integrality on its normalization would not suffice without this quotient-injectivity argument.
  #emph[Nonunits.] The numerator congruences and identical residual strict diagrams show that $V_A$ and $V_(*)$ agree modulo the residual map up to a unit: cancel their common nonzero residual denominator. Thus a nonunit $V_(*)$ makes $V_A$ a nonunit. If $R_b$ were a unit, the displayed component identities, whose multipliers are integral units, would make $V_A$ a unit on every integer component. Every maximal ideal of those integral components contracts to the unique maximal ideal of the coefficient order; an element in that maximal ideal cannot become a unit on a component. This contradiction proves the nonunit assertion and completes (R3). ◻
]

It remains to construct an integral $sigma$-fixed global class $p$ with $Y = R_b \( 0 \) p$. The next two comparisons have different roles: the horizontal logarithm identifies the global lift after inverting two, while the integral clearing calculation controls its remaining dyadic denominator.

=== 14.7 Horizontal logarithms at the anticyclotomic center <horizontal-logarithms-at-the-anticyclotomic-center>

In what follows set $t = 0$ first, keeping all the $upright(bold(u))$. Put

$ x = chi \( upright("Fr")_w \) \, #h(2em) xi_2 = x^(- 1) . $

Both dyadic characters are now unramified, with opposite exponents; the $u_0$-exponent of $x$ is nonzero. Work for now after 2-inversion on the plane $T$ of a primitive $f$ occurring in $P$, realized also by its modular abelian variety $cal(A)_f$. True level at two is good or of exponent one as above. Fixed isogeny/projector and lattice denominators are allowed in this paragraph and the following #emph[horizontal] calculations. Use the Lie line with log coordinate pulling back (by the chosen projection from the primitive level) to $f thin d q_(upright("Tate")) \/ q_(upright("Tate"))$. We work over DVRs of height one on the 2-inverted integer power-series ring after extending constants as on the measure side. Finite further coefficient extensions to split the projections/polynomials can be used, component by component (orders then scale by ramification at a test). Also allow the DVR of a characteristic-zero group-power line germ at zero retaining nonconstant $x$.

#thm([Lemma 14.16.])[
  (The horizontal local logarithm).  #emph[There are perfect local maps $U_w \, U_(macron(w))$, exact orthogonals over the test DVR. At the generic field they are lines in degree one injecting in full local cohomology (of rank two in degree one only). At $w$ we identify that generic line by weighted log and claim 
#[#set math.equation(numbering: n => "(R4)")
 $ d \( U_w \, e_log \) = v \( P_2^f \( x^(- 1) \) \) $ <eq:R4>]

 for the generic basis of log coordinate one. On the test residue field the maps inject in degree zero with no negative degrees in the conditions. At the characteristic-zero center on the line germ they give the ordinary finite Kummer lines; full local cohomology there is also concentrated in degree one.]
] <real:local-log>

#proof[
  #emph[The unramified parameter and the coefficient plane.] As in the high-character calculation, do unramified Shapiro first on $D_j \/ bb(Q)_2$ of degree $2^j$, with universal Frobenius value $1 + s$; then use $1 + s = x$, or the opposite for the conjugate condition. This agrees with the local finite models by stabilization at every precision. The log identification uses $sum_k \( 1 + s \)^k F^k$ on log points, in cyclic-quotient notation with $F$ arithmetic Frobenius, evaluated at our fixed embedding before extending on coefficients. Frobenius on the underlying point system itself thus translates the sums by $\( 1 + s \)^(- 1)$.
  At good level $cal(A)_f$ has good reduction by modular local compatibility. The relation of special Frobenius with Hecke at 2 gives roots of $Z^2 - a_2 Z + 2$ on the chosen coefficient projection. We use the standard Newton and connected/étale descriptions of the good-reduction 2-divisible group: unit-root rank is étale rank (Frobenius invertible on that part), with arithmetic action on the lifted étale Tate, and the two slopes here sum to one. Indeed use the Frobenius polynomial relation on reduction by good Eichler–Shimura, on the plane in Dieudonné theory; polarization with the good Hecke field self-adjoint also gives slope symmetry on that plane. In the case of a unit root $lambda$ this gives
  $ 0 arrow.r T^(+) arrow.r T arrow.r T^(-) arrow.r 0 \, #h(2em) T^(-) = eta_lambda \, #h(2em) T^(+) = eta_lambda^(- 1) \( 1 \) $
  by taking the étale quotient and using the determinant. Here $eta_lambda$ is the unramified character of arithmetic value $lambda$, which in this good case isn’t a root of unity by purity. Without a unit root the étale projection is zero and both slopes are strictly between zero and one.
  At true exponent one the primitive factor has semistable purely toric reduction at 2, by semistable reduction and the toric rank criterion on auxiliary Tate modules (Steinberg compatibility, unipotent inertia with monodromy rank half). Use Tate–Raynaud uniformization. We get the same sequence, with $lambda = a_2 = plus.minus 1$: the periods and torus cocharacters are identified rationally by valuation, their Frobenius sign on the factor being the Steinberg quotient sign, as also computed on the inertia coinvariants of auxiliary Tate. The torus splits over a fixed unramified extension (the sign over at most the quadratic extension). After unramified splitting, valuation of the period extension on the plane is nonzero, by that full-rank valuation isomorphism. Throughout, pair the two graded pieces by the determinant form (polarization plane form up to scalar constant).
  In the cases with $T^plus.minus$, use provisionally
  $ U_w^compose = upright("fib") #scale(x: 120%, y: 120%)[\(] C_w \( T^(+) chi \) arrow.r C_(upright("ur")) \( T^(-) chi^(- 1) \)^or \[ - 2 \] #scale(x: 120%, y: 120%)[\)] med arrow.r med C_w \( T chi \) \, $
  using local duality and the ordinary two-term unramified complex in degrees $0 \, 1$. This condition itself (as a complex) is a free log line in degree one over the horizontal test ring. Indeed unramified inflation on an unramified coefficient includes $H^0$ isomorphically and injects on $H^1$ on every fiber; the cone has no degrees below one already by the residual lattice test over the universal ring. Also $H^0$ on $T^(+) chi$ vanishes on every characteristic-zero field test by cyclotomic inertia (degree-zero evaluations inject after base change by the finite cochain models). Hence duality and local Euler characteristic give just a line in degree one on these fields for $U_w^compose$. Before field tests, $H^1 \( U_w^compose \) = H^1 \( C_w \( T^(+) chi \) \)$ since the dual target has injective Frobenius differential in degrees $1 \, 2$. These checks also apply over the 2-inverted universal unramified ring before substitution.
  #emph[Uniform logarithm bounds.] Weighted logarithm identifies this line up to a unit of the ring with two inverted and constants extended. This is a horizontal statement; it makes no assertion that a fixed two-power lattice denominator is an integral unit. The required uniform bounds are as follows. In good reduction let $T^compose$ denote the formal/connected Tate of the actual variety. Formal Kummer embeds the completed formal points at each $D_j$ in $H^1 \( D_j \, T^compose \)$ with torsion-free cokernel (the cokernel injects in a Tate module by Kummer exactness). Indeed formal points over the algebraic closure are 2-divisible: divisions in the variety can be adjusted to reduction zero using geometric torsion, surjecting onto special-fiber torsion points by finite flatness. The ordinary $T^(+)$-projection of that inclusion spans rationally at every $D_j$: formal Lie has rank one on the embedding, and $H^1$ on $T^(+)$ has the corresponding dimension by local Euler characteristic and $lambda^(2^j) eq.not 1$. Thus compatible cohomology tuples on a lattice of $T^(+)$ come from formal Kummer up to a #strong[fixed] projection/lattice denominator. More explicitly, map back after such a fixed multiple into $T^compose$ with scalar extension; the image lands rationally in formal Kummer so integrally there by saturation before projecting, and preimages there are unique. Formal logs are bounded above with torsion kernel of bounded exponent over all the unramified layers, and cover a uniform small additive Lie lattice, by the formal log and exponential on a small ball (a bounded power of 2 suffices to enter it).
  In the toric case compute instead with the torus Kummers for $T^(+)$. In the split layers multiplicative Kummer gives all the degree-one groups; the valuation coordinates die in the inverse norm limit (multiplication by the growing degrees), and the units give the same formal estimates. On our projection the cocharacter action is just the sign as above; fixed unramified splitting or lattice descent thus costs only constants. The Lie map of uniformization is an isomorphism; a fixed multiple of formal abelian points also lifts to small torus points, compatibly with trace by their log coordinates.
  Pass by compact inverse cohomology at integral arithmetic precision. Trace-compatible integral normal generators $z_j in cal(O)_(D_j)$ with unit total trace give free inverse additive lattices over the arithmetic unramified power-series ring, as in the high-character comparison. Thus after fixed denominators, $H^1$ of our pointed condition over that ring with 2 inverted is identified by log systems with the inverse Lie line; the bounds above and compact exact limits control torsion and indices. The resolvent of the $z_j$, namely the inverse group sum with weights $\( 1 + s \)^k$, is an integer-series unit over extended constants by its augmentation. This gives the asserted unit log evaluation (also after substitution; the free line complex pulls back). In particular a compatible formal Kummer system from $cal(A)_f$ belongs to the condition generically, with log evaluated this way.
  #emph[The horizontal divisor and specialization.] Except in the good ordinary case at $x = lambda^(- 1)$ on the test residue field, take $U_w = U_w^compose$, and take $U_(macron(w))$ its exact orthogonal by the pairing fiber. In that exceptional case take $U_(macron(w)) = U_(macron(w))^compose$ analogously instead, and $U_w$ its exact orthogonal. These choices have the isotropy nullhomotopies by construction. The orthogonal fits in a triangle from the full $C \( T^(+) ⊗ upright("scalar") \)$ at that place with quotient $C_(upright("ur")) \( T^(-) ⊗ upright("scalar") \)$: it is the pullback of that unramified map along the projection by duality of the filtration. Hence there is degree-zero injectivity on all fibers. In the exceptional case $C_w \( T^(+) chi \) tilde.eq U_w^compose$ at this DVR since $lambda eq.not lambda^(- 1)$; the quotient contributes $+ v \( 1 - lambda x \)$ to (R4). At all other tests (R4) needs exponent zero (toric polynomial $1 - a_2 \/ \( 2 x \)$; in good ordinary case use $2 x^2 P_2^f \( x^(- 1) \) = \( 1 - lambda x \) \( 1 - 2 x \/ lambda \)$). At the characteristic-zero center the good ordinary assertion follows by the formal Kummer description. For toric $lambda = 1$ at the center, $U_w^compose$ uses the units line via removing the valuation by the dual unramified cup. It injects as usual finite Kummer despite the period relation by the nonzero period valuation; there are no Tate invariants. For $lambda = - 1$ there is no exceptional phenomenon there and the torus line likewise gives the Kummer line. The orthogonal then specializes to opposite finite by abelian local duality.
  #emph[The nonordinary case.] In good nonordinary reduction use the inverse Kummer line at $w$ as in the earlier projected log comparisons, then its exact orthogonal. Here there is no étale part rationally on that projection; costs from reduction are bounded uniformly by a projector denominator. Indeed the geometric étale 2-power points on reduction are divisible, so an integral multiple of the projector killing their rational Tate module annihilates the whole geometric 2-primary point group (after the coefficient extension); use endomorphisms before and after reduction. Thus after this bounded loss over any $D_j$ we can use formal points for upper log and torsion estimates, and small-log lower bounds are uniform as well. Integral Kummer and dual on the full variety as in the high-character proof then give, after 2-inversion and projection, two ends of the $H^1$ sequence free over the unramified-variable ring (additive normal bases by log and trace dual log), with $H^2$ zero by the torsion bounds. Thus the local complexes are themselves just split degree-one planes with direct Kummer lines, and evaluation is a log isomorphism on the projected inverse Kummer line. It specializes to Kummer at zero by the small-log generators, so its orthogonal likewise does. Both polynomial roots (in the Frobenius eigenvalue convention) have positive slope, giving exponent zero required in (R4). This completes the local comparison. ◻
]

=== 14.8 An input with an integral clearing factor <an-input-with-an-integral-clearing-factor>

At $t = 0$, still, let $Y \( upright(bold(u)) \)$ be the Kummer of the positive-orientation conductor-$product q_j$ trace on $J$ with the $chi$-weights (stage/limit notation). Use the level $n$, canonical connected choice at 2, and subtract the $oo$-cusp on the original point before weighted corestriction. Project to $M$. Use the finite models of the cofactor calculation with constants extended as on the measure side. In the corresponding projected Lie of $J$ set

$ cal(L) = product_(q in S) B_q^(- 1) a_1^A \, #h(2em) B_q = 1 - \( cal(T)_q \/ q \) xi_q + \( epsilon.alt_(q \, n) \/ q \) xi_q^2 \, $

where $cal(T)_q = T_q$ if $q divides.not n$, $U_q$ otherwise, $epsilon.alt_(q \, n) = 1 \, 0$ respectively. These are Lie operators with the usual dual action on differentials. $a_1$ is the tangent vector extracting the first expansion coefficient of a pulled-back differential (coefficient of $d q_(upright("Tate"))$), with superscript denoting Hecke projection.

#thm([Lemma 14.17.])[
  (An integrally controlled logarithmic input).  #emph[There is a closed input $zeta$ in the degree-one $w$-model, in the generic Kummer lines of Lemma 125 on all primitive projections, whose weighted logarithm is $cal(L)$. There is a scalar clearing series $c$ for $zeta$ such that 
$ overline(c) \( u_0 \) := c \|_(2 = u_j = 0 med \( j > 0 \)) eq.not 0 . $

 The construction and clearing assertion are compatible with the multiplicity comparison $M = P ⊗_A D$.]
] <real:input-clearing>

#proof[
  #emph[The Néron tangent lattice.] The tangent vector $a_1$ belongs to the Néron Lie lattice. To see this, take a smooth cusp chart above $oo$ with fine full auxiliary prime-to-two tame level. The only possible extra level at two is the canonical multiplicative subgroup of the Tate curve, since $2 parallel n$ when two divides $n$. The cusp model for generalized elliptic curves with prime-to-two and canonical $Gamma_0 \( 2 \)$ level is smooth there, over unramified constants, with parameter width prime to two [31,20]. The cusp Abel map extends from the generic fiber by the Néron mapping property. Pulling back invariant differentials proves the assertion, since the width factor is a unit. The Hecke operators preserve the Néron lattice, and the anemic idempotent projection is integral.
  On the projected lattice, the scalar series $det \( 2 B_2 \)$ and $det B_q$ for odd $q in S$ remain nonzero on the residual $u_0$-line. Their arguments are nonconstant by the choice of Frobenius weights. At two, use the monic quadratic term if $2 divides.not n$; if $2 divides n$, use $cal(T)_2^2 = 1$, by the Steinberg assertion of Lemma 114. Thus
  $ c_0 = det \( 2 B_2 \) product_(q in S \\ { 2 }) det B_q $
  is a scalar series with nonzero residual restriction, and the adjugate formulas show $c_0 cal(L) in 2 "Lie"_J$. The factor two is explicit: $B_2^(- 1) = 2 \( 2 B_2 \)^(- 1)$.
  #emph[Formal logarithms with a residual nonzero multiplier.] Choose smooth Néron formal coordinates over $bb(Z)_2$ and an integral tangent basis. For unramified integer coordinates $y$,
  #[#set math.equation(numbering: n => "(14.9)")
   $ frac(log \( 2 y \), 2) equiv y + H F \( y \) med \( mod med 2 \) \, $ <real:formal-log-mod-two>]
  where $H$ is a constant residual matrix and $F$ is arithmetic Frobenius. Here $2 y$ means substitution of the doubled coordinate vector in the formal logarithm. Indeed its derivatives are integral. For a monomial of total degree $k$, the denominator valuation is bounded by the valuation of the greatest common divisor of its exponents; after the substitution and division by two, its valuation is at least $k - 1 - v_2 \( k \)$. Only the linear and pure quadratic terms can survive modulo two. The pure squares give $F \( y \)$ on unramified residue fields, proving (14.9).
  Let $h \( Z \) in bb(Z)_2 \[ Z \]$ lift $det \( 1 + H Z \)$. Apply the adjugate of $1 + H F$ modulo two, and then the logarithm isomorphism on the small formal ball with coordinates in $4 cal(O)_(D_j)$. It follows that the logarithms of formal points cover
  $ 2 h \( F \) "Lie"_J \( cal(O)_(D_j) \) $
  at every unramified layer $D_j$. For a trace-compatible integral normal generator $z_j$ and an integral tangent vector $a$, choose preimages of $2 h \( F \) z_j a$. These preimages can be chosen norm-compatibly: any finite set of norm constraints is solved by choosing at the highest layer and norming down, and the fibers are compact. Compactness then solves all constraints simultaneously.
  Kummer theory and unramified Shapiro give cycles with logarithmic coordinates $2 h \( x^(- 1) \) a$, multiplied by the unit normal resolvent of Lemma 125. This also holds on finite character tests. Since $overline(h)$ has constant term one and $x$ is nonconstant on the residual $u_0$-line, $overline(h) \( x^(- 1) \)$ is not the zero series. Combine the cycles linearly with $c_0 cal(L) in 2 "Lie"_J$, and divide by the scalar product $c_0 h \( x^(- 1) \)$ and by the unit resolvent. This constructs $zeta$ with a clearing series having nonzero residual restriction. The unrestricted Tate cochains, their maps to the finite models, and the tensor comparison with $D$ are used before these scalar combinations, so the assertion also holds on $M$. ◻
]

=== 14.9 The global class and its integral specialization <the-global-class-and-its-integral-specialization>

Lift $zeta$ by Lemma 119 to a global class $z$, with the sign chosen so that its localization is $cal(P) zeta$. The defining logarithm of $zeta$ will identify this lift with the weighted Heegner class as follows.

#thm([Proposition 14.18.])[
  (Identification with the Heegner class).  #emph[Over the generic fields, 
#[#set math.equation(numbering: n => "(R5)")
 $ Y \( upright(bold(u)) \) = R_b z . $ <eq:R5>]

]
] <real:heegner-identity>

#proof[
  We first verify the logarithmic identity at $w$.
  For each $f$ at true level $N_f divides n$ use the projected primitive-quotient pushforwards $pi_i$ from degeneracy maps, just $i = 0$ unless $n = N_f ell_0^2 \, med ell_0 divides.not N_f$, and $0 lt.eq i lt.eq 2$ then (argument multiplied by $ell_0^i$ in analytic uniformization). They give rational coordinates on $M$ by newform theory. Normalize with the same primitive log for each, i.e. pullback on differentials
  $ omega_i = ell_0^i f \( q_(upright("Tate"))^(ell_0^i) \) d q_(upright("Tate")) \/ q_(upright("Tate")) . $
  Then exactly
  $ pi_i cal(L) = xi_(ell_0)^i #scale(x: 180%, y: 180%)[\/] product_(q in S) P_q^f \( xi_q \) $
  in these coordinates (numerator one for $i = 0$). At unchanged good or minimal levels use the eigenlaw. In the old case evaluate $\( 1 - U_(ell_0) xi_(ell_0) \/ ell_0 \)^(- 1)$ on differentials with a formal symbol first, using $a_1 U_(ell_0)^k \( omega_i \) = a_(ell_0^k) \( omega_i \)$; good Hecke recursion gives exactly the displayed rational multiplier.
  On the conductor centers $pi_0$ uses the CM level at $N_f$; the other projections use $i$ successive oriented $ell_0$-translations before the primitive pushforward, multiplying log weights by $xi_(ell_0)^i$, with the same orientations as in (M2). Also the connected $V_2$-quotient there is arithmetic $F = upright("Fr")_w$, by Frobenius on the ordinary reductions including the transported tame data and uniqueness of canonical lifts. Hence the inverse weight is $x^(- 1)$. Thus the disk-center version of (M1)–(M2) gives
  $ "loc"_w Y \( upright(bold(u)) \) = b^(+) zeta $
  over the generic fields.
  To justify transfer here one may first test finite tame character tuples away from the input denominator and polynomial zeros. Nonzero generic minors of the cochain matrices including a putative nonboundary can simultaneously be retained by the bounded-series test on finite characters. At such a fixed tuple the local character field is unramified cyclic $D_j$, contained locally in the stage base ring fields eventually by the Frobenius exponents. The specialized localization, restricted to $D_j$, is projected Kummer, whose log evaluated at our embedding is the limit of the full weighted orbit sums. Indeed norm first to $D_j$ by transitivity grouping the translations; by fixed-group comparison Kummer congruences there give log congruences at increasing precision (fields and projector losses now fixed). These are sums, not averages. Likewise the formal systems for $zeta$ evaluate by their weighted logs. This detects the projected finite-character Kummer line: after restriction the log lies in the corresponding character subspace, so the other $D_j$-embeddings are translates with unit weights; restriction itself is injective in characteristic zero. Thus the center formula of (M2) proves the cohomological identity at those tests by all the $pi_i$, hence generically. Strict generic acyclicity by (R1) gives uniqueness from this localization (other non-dyadic allowed terms acyclic there), proving (R5). ◻
]

#thm([Lemma 14.19.])[
  (Horizontal integrality and Fricke invariance).  #emph[Before further specialization, the global coordinates of $z$ are integral after inverting two. Its all-zero specialization is invariant under $w_n c$, componentwise. On a primitive component whose ordinary characteristic-zero Selmer dimension over $K$ exceeds one, this specialization vanishes.]
] <real:horizontal-integrality>

#proof[
  On any $f$ and test DVR as in (R4), let $C_H$ use those dyadic conditions and both unramified conditions at each fixed odd pair. Moving odd local terms are contractible by their nonzero component traces, including on the fibers $u_j = 0$; the place over $d$ introduces no defect because its Frobenius is a cycle. The degree-zero injections on fibers and global invariant vanishing therefore give amplitude $1 \, 2$. Here invariant vanishing follows from the evaluation comparison and absolute simplicity over $K$, also after the scalar twist. The prescribed local conditions give exact conjugate self-duality over the DVR.
  We first show that generic $H^1 \( C_H \)$ is a line mapping isomorphically to the finite line at $w$. All odd local terms are generically acyclic. With both dyadic places full, global duality makes the localization image self-annihilating for the symmetric conjugate pairing. Write $V_w \, V_(macron(w))$ for the full generic local cohomology planes. Strict acyclicity identifies the image with the graph of a map $A_w : V_w arrow.r V_(macron(w))$, with zero global localization kernel. Write $b$ for the cross pairing of these local planes. For a vector $x$ in the finite line at $w$, isotropy gives
  $ 0 = chevron.l \( x \, A_w x \) \, \( x \, A_w x \) chevron.r = 2 b \( x \, A_w x \) . $
  Two is invertible in this horizontal test, so $A_w x$ lies in the annihilator of that line, namely the chosen opposite finite line. This proves the assertion about $H^1 \( C_H \)$. The same argument applies on the line germ when the generic ranks and nonconstant fixed-place weights are retained.
  Write $p_0$ for a generator of $H^1 \( C_H \)$, $tau$ for the degree-two torsion length, so $d \( C_H \, \( p_0 \, p_0^or \) \) = - tau$ by exact duality. With the same odd unramified conditions but strict/full dyadically, the strict determinant valuation is
  $ 2 v \( cal(P)_f \) - 2 sum_(q in S^compose) v \( P_q^f \( xi_q \) \) . $
  Indeed pass from full at the odd places of $S$ as in (B1) (both singular factors), using the ratio $\( s_F \)_f \/ cal(P)_f^2$ proved at (R3). Now (D) and (R4) give
  $ v \( cal(P)_f \) = tau \/ 2 + v \( log "loc"_w p_0 \) + sum_(q in S) v \( P_q^f \( xi_q \) \) . $
  In particular the generic $z_i = pi_i z$ is the unrestricted global image of a multiple of $p_0$ of exponent $tau \/ 2$, by the local coordinate formula and uniqueness. It is integral here. With no degree-zero unrestricted global term, this gives coordinate integrality after inverting 2 by normality on every integer component; the order and multiplicities split after this inversion with constants sufficiently extended.
  Take also a group-power line through zero retaining all the indicated generic conditions by general integer slopes, and apply the same calculation at its characteristic-zero center DVR. The special degree one now gives the usual Kummer Selmer on $f$ over $K$, by (R4), odd characteristic-zero acyclicity there and unramified inflation. Thus $z_i \( 0 \)$ lies in that space, and is zero if its rank exceeds one ($tau > 0$). In the rank-one case complex conjugation on that Selmer line is the primitive Fricke sign. Indeed the two ranks over $bb(Q)$ for $f \, f ⊗ chi_(- d)$ add by quadratic induction, and the member with odd functional sign has odd rank by the form parity above; the Fricke sign equals minus the functional sign of $f$. Moreover $z_i = xi_(ell_0)^i z_0$ on the generic primitive coordinates by the same uniqueness. At old level $w_n$ exchanges pushforwards $i \, 2 - i$ with precisely the primitive Fricke action (commuting degeneracy and Fricke on the analytic arguments). Thus $z \( 0 \)$ is $w_n c$-invariant, componentwise. ◻
]

The last passage to integral coefficients uses two different kinds of denominator control. We record the elementary intersection that combines them.

#thm([Lemma 14.20.])[
  (Removing the last denominator).  #emph[Let $cal(O)$ be a discrete valuation ring of residue characteristic two, with uniformizer $pi.alt$, and let $B = cal(O) \[ \[ u \] \]$. Let $N$ be a finite free $B$-module. If $v in N \[ 1 \/ pi.alt \]$, $c v in N$, and the image of $c in B$ in $\( cal(O) \/ pi.alt \) \[ \[ u \] \]$ is nonzero, then $v in N$.]
] <real:denominator-intersection>

#proof[
  Write $v = pi.alt^(- a) v_0$ in coordinates. The condition is $c v_0 in pi.alt^a N$. Multiplication by the nonzero residual series $overline(c)$ is injective on each coordinate of $N \/ pi.alt N$, so $v_0 in pi.alt N$. Repeating the argument $a$ times gives $v_0 in pi.alt^a N$, as required. Equivalently, $B \[ 1 \/ pi.alt \] ∩ B \[ 1 \/ c \] = B$ in its fraction field. ◻
]

#thm([Proposition 14.21.])[
  (Primitivity detected at infinity).  #emph[The paired elliptic quotient $V_(*)$ of (R3) is an integral unit.]
] <real:primitivity>

#proof[
  Specialize first $u_j = 0$ for $j > 0$, and put
  $ z_0 = z \|_(u_j = 0 med \( j > 0 \)) \, #h(2em) c_1 = c \|_(u_j = 0 med \( j > 0 \)) \, #h(2em) Q = product_j alpha_j . $
  The factor $alpha_0$ is a unit. Let $N$ be the module of global coordinates over the remaining scalar series ring in $u_0$, including the multiplicity lattice. It is free over that scalar ring. The two preceding constructions give
  $ z_0 \/ Q in N \[ 1 \/ 2 \] \, #h(2em) c_1 z_0 \/ Q in N . $
  The first inclusion is horizontal integrality and the nonvanishing of every constant trace. The second is the cofactor divisibility (R2) applied after clearing the input. By Lemma 126, $overline(c)_1 eq.not 0$ on the residual $u_0$-line. Lemma 129 therefore gives $z_0 \/ Q in N$.
  Its value at $u_0 = 0$ is an integral global class $p$ over the extended integers. Lemma 122 identifies it with a class at fixed support. It is $w_n c$-invariant by Lemma 128; the action comparison uses the same inflation identification in characteristic zero. The integral global $H^1$ is torsion-free, with no degree-zero term, so this invariance also holds integrally.
  At this center (R5) consequently gives
  $ Y = R_b \( 0 \) thin p $
  integrally in Kummer cohomology on the packet at fixed support. Indeed the added inert traces contribute exactly $product_j alpha_j$ on $M$ by the good Hecke correspondences ($T_(q_j) oo = \( q_j + 1 \) oo$), taking the limits of actual $T_(q_j)$ and unramified inflation. Cancel rationally then use torsion-freeness.
  Invariant classes descend integrally to the twist of $M$ by $w_n$ along $K \/ bb(Q)$, by inflation–restriction ($M^(G_K) = 0$); one can use unrestricted absolute groups for this descent. Flat extended coefficients commute with invariants and cohomology on the fixed-support models, so one descends there before scalar combinations. Apply $T_ell - ell - 1$ for the detector prime to the equality and restrict the descended classes to infinity. On the left this gives the projected $\[ Y' \]$, since the invariant actual point $Y'$ itself has the twisted Kummer and descent is unique. But $Theta$ of (R0) sees that projection nontrivially and is Hecke-linear via the residue map. A nonunit $V_(*)$ would put $R_b \( 0 \)$ in the extended maximal ideal by (R3), giving zero detector value on the right. This contradicts (R0); therefore $V_(*)$ is a unit. ◻
]

=== 14.10 The simple zero and the exact product factor <the-simple-zero-and-the-exact-product-factor>

#proof[
  Use this unit equality first on a tame line at $t = 0$ retaining generic strict acyclicity and nonconstant dyadic exponents, at the characteristic-zero center DVR. The rank-detection argument in the proof of Proposition 73 applies, with the following local checks: all other finite allowed places are locally contractible at that germ including the new ones by nonzero elliptic traces. The dyadic comparisons use the unramified Kummer/log version near the center (valid for general reduction there). The disk-center identity at (M2) gives the weighted Hilbert/ring trace localization square up to units (all Euler factors nonzero at the center). Thus ordinary dyadic finite conditions give generic paired lines by (D), with zero class-functional valuation by the unit quotient. Their special ranks are also one by $s_2 \( E_0 \/ K \) = 1$ and inflation. Hence the class specializes nontrivially, i.e. the conductor-one Hilbert trace on $E_0$ is nontorsion (again times all the extra inert traces, nonzero). This yields a simple product zero by (GZ-E).
  Finally evaluation of the unit equality at the all-zero center integrally cancels exactly the squared trace factors: for each added inert place changing full to unramified there removes the degree-$\( 1 \, 2 \)$ singular block of determinant valuation $2 v_2 \( a_(j \, *) \)$, $a_(j \, *)$ the corresponding elliptic limiting trace, by Frobenius square minus one (norm tending to 1). On the logs in each orientation the trace at that conductor gives multiplier $a_(j \, *)$. Thus for the true strict complex versus paired formula (M3) we have precisely the equality used at (E), now for $E_0$ with support $S$ (the Haar calculation includes extra split good primes identically). Acyclicity over characteristic zero at this center follows as there since the point spans with nonzero dyadic log. Hence (E) and (G) give $X \( E_0 \) + X \( E_0^(- d) \) = 0$, proving the split-pair anchor here with the discriminants chosen above. This uses the split Gross–Zagier conventions at the outset. ◻
]

== 15 Split-pair anchor: cyclic cubic <sec:cyclic>

We treat the last residual image by an Eisenstein comparator. The integral calculation has two parts: a primitive ray-unit determinant and its realization as a pair of CM-disk logarithms. Both use full character-weighted sums, so the comparison retains their dyadic indices.

=== 15.1 The Selmer seed and the comparator <the-selmer-seed-and-the-comparator>

Let $E_0 \/ bb(Q)$ be non-CM with residual image $C_3$, and put $W = E_0 \[ 2 \]$. Over $bb(F)_4$, the representation splits into characters lifted by $rho \, rho^(- 1)$, where $rho$ is a primitive even Dirichlet character of order three and odd conductor $m$. We use arithmetic character conventions and coefficients $cal(O) = bb(Z)_2 \[ mu_3 \]$.

#thm([Lemma 15.1.])[
  (Cyclic-cubic Selmer seed).  #emph[There are a prime $d equiv 7 med \( mod med 8 \)$, a field $K = bb(Q) \( sqrt(- d) \)$, and a positive fundamental discriminant $h$, allowing $h = 1$, such that:]
  + #emph[every prime dividing $2 m N_(E_0)$ splits in $K$, and $rho \( d \) eq.not 1$;]
  + #emph[$h$ is a product of fresh primes congruent to one modulo eight, good for $E_0$, split in $K$, and prime to $d$;]
  + #emph[the finite two-Selmer dimensions of $E_0^h$ and $E_0^(- d h)$ are zero and one, in some order. In particular, $s_2 \( E_0^h \/ K \) = 1$.]
  #emph[The field $K$ has only the units $plus.minus 1$ and has odd class number.]
] <cyclic:seed>

#proof[
  The cubic prescription $rho \( d \) eq.not 1$ is independent of the quadratic splitting prescriptions, so Chebotarev supplies $d$. The discriminant of $K$ is $- d$, with a single prime factor; genus theory gives odd class number. The congruence at eight gives splitting at two.
  The two twists $E_0 \, E_0^(- d)$ have opposite Selmer parities, as in the imaginary $S_3$ construction. Twist simultaneously at fresh good primes which are local squares at the old places, split in $K$, and split on $W$. The ramified Kummer condition there is transverse to the old finite condition: it is obtained by taking halves of invariant two-torsion. Reciprocity shows that a switch lowers the Selmer dimension by at least two when the old finite evaluation has rank two, and does not increase it when that evaluation has rank one.
  We can make these prescriptions simultaneously. The space $W$ is a line over its endomorphism field $bb(F)_4$. On the joint kernel of $W$ and the abelian congruence data, evaluations test arbitrary linear maps on the $bb(F)_4$-span of the chosen cohomology classes. Restriction detects the classes because of the nontrivial central scalar. The joint evaluations span, and additivity together with cubic equivariance makes the actual image an $bb(F)_4$-subspace.
  For two $bb(F)_2$-independent classes, a rank-two evaluation is possible even if they are proportional over $bb(F)_4$: their ratio then lies outside $bb(F)_2$. If they are independent over $bb(F)_4$, either of the two ratios in $bb(F)_4 \\ bb(F)_2$ gives rank two. At most one of these ratios kills a specified third nonzero class in their span; if that class is outside the span, prescribe its evaluation separately. We may therefore cut the odd Selmer dimension to one and then the even dimension to zero, keeping nonzero evaluation on the odd line during the second stage. Chebotarev realizes the required evaluations with all the stated local square conditions. Parity, the absence of rational two-torsion, and quadratic induction now give $s_2 \( E_0^h \/ K \) = 1$. ◻
]

For the rest of this section put $E = E_0^h$. In particular, $K$ splits every prime dividing $2 N_E$. No analytic-rank assertion is being made at this stage.

Retain the true free $t$-direction and several order-conductor variables $u_j$ at good inert primes $r_j arrow.r - 1$ two-adically, independent cyclic Sylow quotients as before. Write $Psi$ for the total scalar twist. Take the strict-at-$w$ determinant over $K$ (full elsewhere at allowed finite places), with old split rational support $S$ containing 2 and the primes of $N_E m$; additionally allow the $r_j$. Use this both on $T_2 E ⊗ cal(O)$ and on

$ T_1 xor T_2 = cal(O) \( 1 \) rho xor cal(O) rho^(- 1) $

Here $T_2$ standing alone in the comparator denotes its second summand, and $rho$ restricts by norm. In both coefficient systems we include the scalar twist $Psi$. Write $D_E \, D$ respectively for the determinants. The strict complex has square amplitude $1 \, 2$, including on each summand (no residual global invariants on either side, and usual global and $w$-Euler formulas). The residual determinants agree up to unit by identical diagrams.

Use also the classical weight-two primitive Eisenstein form of level $m^2$, trivial nebentypus and coefficients

$ a_l \/ l = sum_(b e = l) rho \( b \) rho^(- 1) \( e \) \/ e $

(zero on multiples of conductor primes), with no constant at $oo$. Use both fully $S$-depleted antiderivatives (opposite tame orientations), and for it we need just weighted CM disk-center traces on setting $t = 0$; take order conductor $s = product r_j$ at the stages. Write $B = b^(+) b^(-)$ for this $t = 0$ product and $B_E$ for the curve’s paired measure including $t$. Then $B_E \( 0 \, upright(bold(u)) \) equiv B med mod med 2$ over extended constants as at (M1)–(M2). Indeed use common split data and level raising for the quotient operators, the same class-label translates and the canonical connected choices. The ordinary modular expansion proof there applies equally to this holomorphic modular form; its fully depleted primitive has Tate coefficients $a_l \/ l$ off the support, integral and congruent as required by good residual Frobenius and Hecke recursion, and zero elsewhere. The comparator Euler polynomials in the tame operators and in the log formula below are

$ P_q \( Z \) = \( 1 - rho \( q \) Z \) \( 1 - rho^(- 1) \( q \) Z \/ q \) \, #h(2em) P_q = 1 med upright("if ") q divides m . $

=== 15.2 Residual regularity and horizontal divisibility <residual-regularity-and-horizontal-divisibility>

#thm([Lemma 15.2.])[
  (Addressed conductor variables).  #emph[The inert prime sequences and order-conductor variables can be chosen so that 
$ rho \( r_j \) = 1 \, #h(2em) a_(r_j) \( E \) arrow.r a_(j \, *) eq.not 0 \, #h(2em) D \|_(2 = t = 0) eq.not 0 . $

 Moreover, the old split places have nonzero Frobenius exponents, and each new place has a primitive relative inertia exponent.]
] <cyclic:addressing>

#proof[
  #emph[Addressing the old places.] Begin with a prime-sequence $r_0$ giving nonzero $u_0$-Frobenius exponents at the two places of each old $q in S$. Indeed use the power residue symbols at $r_0$ of 2-power order tending to infinity dividing $r_0 + 1$ (they kill rational residues, and give primitive relative inertia; the kernel of lowering order and the odd class number give the conductor quotients). On principal generators of the class-number powers of one place at each $q$, nonzero exponents can be forced by taking rational Frobenius lifts $gamma_0$ near $c eta$, with $eta in G_K$ fixing $rho \, mu_(2^oo)$.
  Their squares read the power symbols as in the preceding anchors, giving differences of Kummer translations on those numbers and their conjugates. These numbers are independent by valuations, and restriction to the specified kernel retains rational Kummer independence (central cyclotomic scalar); hence the tuple translation image is open. We may preserve all differences nonzero and also force the nonzero elliptic limiting trace by varying over the kernel of these extra radicals (non-CM open image with competing data of bounded derived length as in the evaluation comparison). Apply Chebotarev with increasing precisions.
  #emph[Eliminating residual cohomology.] After each step in the generic residual field at $t = 0$, the twisted $T_1 \, T_2$ strict $H^1$’s have equal dimension: fixed odd locals are acyclic by the Frobenius exponents or inertia, moving locals by nonconstant inertia, so the two problems are exact conjugate duals up to shift and have Euler characteristic zero.
  When this dimension is nonzero, arrange nonzero Frobenius-square evaluations of one class from each at the next prime (start there with $u_j = 0$, old problem via unramified inflation). The finite lines switch to transverse singular lines, dropping dimension by at least one on each (old opposite finite evaluations kill any new transverse contribution by duality).
  Here the local limit is split on each summand residually by the tame/Frobenius calculation: with the new scalar as well it has inertia difference $\( 1 + u_j \)^(b_j) - 1 \, med b_j in bb(Z)_2^times$, Frobenius difference zero ($gamma_j^2$ trivial on ring fields), residue conjugating power tending to one. Thus the pure lines at this specialization have the exact cross orthogonality of the inert switch, and the singular condition including degree zero is the specialization of the isolated inertia block in degrees $0 \, 1$. Off $u_j = 0$ generically it and full give the same cohomology. The dimension drop therefore persists as an upper bound in the new generic field by the finite free models.
  #emph[Realizing the evaluations.] For these choices use $gamma_j$ approaching $c eta_i$ at the stages $i$, where $eta = \( eta_i \)$ belongs to the product kernel over $K$ of ring-class and cyclotomic data and $rho$. Indeed the classes above inject into unrestricted crossed classes (notably $H^0 \( K_w \) = 0$ in that residual test) by the evaluation lemma. Their restrictions are detected on this kernel since its product quotient is abelian with a nonidentity scalar.
  For each line the evaluations on $\( c eta \)^2$ are additive and span on the tested class: conjugate kernel evaluations cannot identically cancel the original ones as they transform under distinct characters (inverse varying scalar, already infinite order via $u_0$). One can thus achieve both nonvanishings (union of two proper kernels).
  Perturb by products of squares there preserving the test, to force nonzero elliptic limiting trace: a uniform open determinant-one piece of the curve’s Tate image is available on that kernel as above, also after generating by squares. Chebotarev with the prescribed evaluations now works. This proves the desired arrangements by iteration. ◻
]

#thm([Lemma 15.3.])[
  (Curve divisibility).  #emph[With these choices, $D_E divides B_E$ in the integral power-series ring.]
] <cyclic:divisibility>

#proof[
  For the curve, the integral divisibility $D_E divides B_E$ now holds by the high-$theta$ horizontal argument (B1), (D2) and residual regularity. To reiterate the hypotheses here: the added inert locals are contractible on characteristic-zero tests by nonzero limiting Tate traces on the rational Frobenius lifts (determinant tending to $- 1$), and the fixed odd singular factors and the two Kummer log lines give (B1) by (M2), the nonzero Frobenius-exponent substitution, and high dyadic inertia as in the several-conductor-variable argument.
  Local fields of the Heegner orbits contain the prescribed finite ramified character field and growing unramified layers, with bounded ramification at fixed depth. The switches of (D2) use additional derivative primes as in (K) retaining these base conductors, with Tate absolute irreducibility over $K$ by non-CM open image and distinct inverse-twist determinants on the high-character fibers. Thus the determinant valuation test and Weierstrass remainder proof there apply without a residual absolute simplicity hypothesis. ◻
]

Take $t = 0$ and a group-power tame line $1 + u_j = \( 1 + v \)^(n_j)$ retaining residual determinant nonvanishing and nonzero exponents on each old Frobenius and each relative inertia. The integral series tests allow all these conditions. For all fixed sufficiently high roots $1 + v$ of 2-power order we will prove for the comparator

#[#set math.equation(numbering: n => "(Y1)")
 $ v_2 \( B \) = v_2 \( D \) . $ <eq:Y1>]

It suffices to prove this at actual stages large on the ultrafilter, with the resulting fixed-order scalar character denoted by $chi$: the determinant valuations stabilize by residual regularity and Weierstrass, and bounded measure evaluations pass at these fixed scalar precisions as well. The stage strict determinants are in particular nonzero. The character is unramified at old support with high order on those Frobenius values, and is nontrivial with high order on inertia at every added prime; $gamma_j^2$ acts trivially on it.

=== 15.3 Primitive ray coordinate of the comparator <primitive-ray-coordinate-of-the-comparator>

Fix such a stage and character. Write $S'$ for the finite allowed places of $K$, $s = product_j r_j$, and

$ tau = rho chi \, #h(2em) frak(f) = \( m s \) \, #h(2em) e_S = product_(frak(q) divides S \, med frak(q) divides.not m) \( 1 - tau \( upright("Fr")_(frak(q)) \) \) . $

Write $cal(O) \( tau \)$ for the coefficient ring obtained from $cal(O)$ by adjoining the values of $tau$. Here $frak(f)$ is the exact conductor by split primitivity at $m$ and nontriviality at the new inert primes. Let $z_(upright("ray")) in H^1 \( K \, "Frac" \( cal(O) \( tau \) \) \( 1 \) tau \)$, with support $S'$, be the unnormalized weighted Kummer trace from the ray field of $frak(f)$ using a Siegel function $g$ at a primitive $cal(O)_K \/ frak(f)$-division generator of a maximal-order CM elliptic curve. We use the standard Siegel function $g_(a \, b)$ (point $a tau_(upright("mod")) + b$ in modular-parameter coordinates), leading $q_(upright("Tate"))^(B_2 \( a \) \/ 2)$ up to phases in its product for $0 < a < 1$; $B_2$ is the second Bernoulli polynomial. Take a power defining the modular unit without root ambiguity, then divide its rational Kummer class by that power. We use the classical Siegel-function transformation laws and the main theorem of CM (see [46] Section 2.2): on changing bases or acting on the elliptic curves with the point, these functions transform with the torsion labels up to roots of unity (on determinant actions the Tate phases transform as the roots of unity). Thus the powers can be taken in the ray field, with ray classes acting by the ideal isogenies, and replacing the generator/base label only translates the sum or changes killed roots.

The unit powers have integrality and invertibility off level divisors at integral CM $j$’s. Equivalently this follows by taking symmetric polynomials of all modular conjugates (also for inverses), with no interior poles, and using the Siegel products at cusps to check integrality of the polynomials in $j$ away from the level.

#thm([Proposition 15.4.])[
  (Primitive ray determinant).  #emph[The class 
$ z_S = e_S z_(upright("ray")) $

 is a basis of the inverse determinant of the unrestricted global complex on $cal(O) \( tau \) \( 1 \) tau$, with support $S'$, over the dyadic character integers. Rationally this determinant is its single $H^1$-line.]
] <cyclic:ray-basis>

#proof[
  #emph[Regular representations and the class-number formula.] First do the determinant and regulator comparisons for regular representations in the cyclic tower over $K$ cut out by $tau$. At an intermediate field $F$ these use by Shapiro the $2$-adic $bb(Z)_2 \( 1 \)$ complex over $F$ for $S'$ inverted. Its $H^1$ is compact $S'$-units, $H^2$ is given by $S'$-ideal classes (2-part) and the sum-zero lattice $Y_(S')^0 ⊗ bb(Z)_2$ of invariants, and other cohomology vanishes (Kummer, Brauer reciprocity). Here $Y_V$ denotes the label lattice on places of $F$ in a set $V$. Thus relative to free unit and invariant bases the generator of the inverse determinant has coefficient of valuation $v_2 \( h_(S') \/ w_F \)$ (class number over torsion). Compare now by the ordinary real regulator
  $ "units"_(S' \, F) ⊗ bb(R) med tilde.eq med \( Y_oo xor Y_(S') \)_(bb(R))^0 \, $
  taking $- 2 log \| dot.op \|$ at complex labels (one embedding per label extending the chosen embedding of $K$) and valuations times log norms at finite ones. Cancel the degree-two invariant coordinates by the exact sequence of label lattices
  $ 0 arrow.r Y_(S')^0 arrow.r \( Y_oo xor Y_(S') \)^0 arrow.r Y_oo arrow.r 0 . $
  The last map is projection to the infinite labels. It is surjective because $S' eq.not diameter$: any total degree at infinity can be balanced at one finite label. No choice of a splitting enters the determinant comparison. Thus an inverse-determinant tensor $r$ on rational cohomology bases and a basis tensor $b_oo$ on $Y_oo$ have signed comparison factor $j \( r \, b_oo \)$ (coefficient of the image of $r$). By the classical $S'$-truncated Dedekind class number formula at zero, leading zeta value divided by this factor is rational, of valuation
  $ v_2 \( b_oo upright(" relative to lattice basis") \) - d \( C_F \, r \) . $
  Indeed on ordinary free unit, invariant and label lattice bases this is just $h_(S') \/ w_F$ up to sign after cancelling the regulator.
  Under intermediate field restriction all these comparisons commute: normalized logs and Brauer invariants extend with local degree multipliers, at infinity just unweighted injection by subgroup sums on labels.
  #emph[The integral primitive quotient.] Quotient to the primitive powers of $tau$, whose order is $3 dot.op 2^a$ say. First remove the part trivial on the cubic subgroup by subgroup-sum injection; in the remaining module remove the $2^(a - 1)$-part by the analogous injection (polynomial $1 + X^(2^(a - 1))$ in the 2-power factor). Thus the quotient lattice is the cyclotomic integers with group map $g mapsto tau \( g \)$. More explicitly, put $G = C_3 times C_(2^a)$, let $N_3$ be the subgroup sum for $C_3$, and let $X$ generate the two-power factor. The two coefficient sequences are
  $ 0 arrow.r bb(Z)_2 \[ C_(2^a) \] arrow.r^(med N_3 med) bb(Z)_2 \[ G \] arrow.r bb(Z)_2 \[ mu_3 \] \[ C_(2^a) \] arrow.r 0 \,\
0 arrow.r bb(Z)_2 \[ mu_3 \] \[ C_(2^(a - 1)) \] arrow.r^(med 1 + X^(2^(a - 1)) med) bb(Z)_2 \[ mu_3 \] \[ C_(2^a) \] arrow.r bb(Z)_2 \[ mu_(3 dot.op 2^a) \] arrow.r 0 . $
  The high-order character ensures $a gt.eq 1$.
  These sequences on regular modules and their successive quotients give integral determinant triangles, with the subgroup-sum maps using restriction under Shapiro. Rationally the same sequences identify the quotient regulator comparisons by the preceding compatibility, including on infinity lattices by the subgroup sums. Hence by multiplying/dividing the preceding equalities we have the same determinant-ratio valuation rule for this primitive part, using as zeta leading value the product of $L'_(S') \( tau^i \, 0 \)$ on primitive powers. Indeed these characters have a simple zero individually (Hecke functional equations and central-side-at-one nonvanishing by Dedekind factorization for the finite characters), with no extra zero from truncation.
  Rationally in cohomology only the character-field unit line in degree one remains, since there are no corresponding $S'$-invariant coordinates ($tau$ nontrivial at every allowed place). On infinity labels, in any primitive embedding the map of a pushed-forward ordinary unit to the regulator coordinate uses
  $ - 2 sum_g tau \( g \) log \| g \( u \) \| $
  with the corresponding embedded character. Indeed index the regular labels by embedding composed with $g$; Shapiro inverse corestricts with identity-label basis, and group-ring multiplication acts inversely on the unit. Norming first from the ray field therefore uses exactly such full sums over the ray labels on $z_(upright("ray"))$.
  #emph[The ray coordinate and the limit formula.] Each primitive embedding on $z_S$ now gives precisely a primitive $L'_(S') \( 0 \)$-coordinate, up to roots/signs and consistent permutation of embeddings. Indeed each ray partial zeta for an integral prime-to-$frak(f)$ representative $frak(a)$ is a norm scale times the shifted sum of $\| x \|^(- 2 s_1)$ over $1 + \( m s \) frak(a)^(- 1)$; there is no nontrivial global unit congruent to one. Its value at $s_1 = 0$ vanishes and derivative is $- 2 log \| g \|$ at the shift generator on the corresponding maximal-order lattice. This is the shifted Epstein–Kronecker limit formula. To check its normalization against the ray invariant, write $frak(f) ∩ bb(Z) = f_(bb(Z)) bb(Z)$ and take its defining power $N = 12 f_(bb(Z))$. In the notation of [46] Section 2.2 and Equation (2.4), the invariant is $g^N$ up to a phase, and the congruence-unit number $w_(frak(f))$ is one here. The factor $- N^(- 1) log \| g^N \|^2$ is therefore exactly $- 2 log \| g \|$. The rational Kummer class was divided by this same defining power. For example after scaling to lattice $\( tau_(upright("mod")) \, 1 \)$ move the shift to $a tau_(upright("mod")) + b \, med 0 < a < 1$; Poisson summation in the second coordinate gives in the derivative the constant mode $2 pi "Im" \( tau_(upright("mod")) \) B_2 \( a \)$ and other modes
  $ sum_(n in bb(Z) \, thin l gt.eq 1) 2 / l e^(- 2 pi l \| n + a \| "Im" \( tau_(upright("mod")) \)) cos \( 2 pi l \( b + \( n + a \) "Re" \( tau_(upright("mod")) \) \) \) \, $
  exactly that product-log. Varying $frak(a)$ uses the ray conjugates by CM reciprocity, and $e_S$ supplies the extra omitted Euler terms. Ideal-action inversion conventions at most permute primitive powers here and replace Euler omissions by their inverse-character versions, of ratio a root of unity.
  Use the tensor formed from $z_S$ times a $bb(Z)$-basis of the cyclotomic-integer lattice as $r$, and the same lattice basis on infinity as $b_oo$. These are rational comparisons (units from powers before dividing, not a rational structure inferred from real logs). Their real determinant comparison therefore has exactly the absolute value of the primitive leading-value product. This gives $d \( C_(upright("prim")) \, r \) = 0$ over $bb(Z)_2$. There is only one prime above 2 in the coefficient field $bb(Q) \( mu_(3 dot.op 2^a) \)$. Let $F_2$ be its dyadic completion and write $z_S = a e$ for a generator $e$ of the character determinant lattice. On restriction of scalars the index is the norm of $a$, and
  $ v_2 #scale(x: 120%, y: 120%)[\(] N_(F_2 \/ bb(Q)_2) \( a \) #scale(x: 120%, y: 120%)[\)] = \[ F_2 : bb(Q)_2 \] v_2 \( a \) . $
  The norm-index valuation just computed is zero, so $v_2 \( a \) = 0$. This proves the individual determinant-basis assertion. Further coefficient enlargements preserve it. ◻
]

=== 15.4 The local logarithm lattice and the strict determinant <the-local-logarithm-lattice-and-the-strict-determinant>

Write $ell_w$ for local untwisted log after restriction to the local unramified character field $P_w \/ bb(Q)_2$ of $tau$ and evaluation in the chosen embedding. Strict nonvanishing already arranged thus gives $ell_w z_S eq.not 0$. Put

$ a_w = v_2 \( 1 - tau \( upright("Fr")_w \) \) = v_2 \( 1 - tau \( upright("Fr")_(macron(w)) \) \) lt.eq 1 $

(using the high Frobenius-power test).

#thm([Lemma 15.5.])[
  (Unramified logarithm lattice at two).  #emph[The evaluated free logarithm lattice of $H^1 \( K_w \, cal(O) \( tau \) \( 1 \) tau \)$ has valuation $1 + a_w$. Its torsion and the local $H^2$ each have normalized length $a_w$. Consequently, the strict determinant on this summand has valuation 
$ v_2 \( ell_w z_S \) - 1 - a_w . $

]
] <cyclic:local-log>

#proof[
  Put $A = cal(O) \( tau \)$ and $P = P_w$. Restriction identifies the local $H^1$ integrally with the twisted invariants of $P_2^(times \, and) ⊗ A$: the integral $H^0$ of the Tate twist upstairs is zero. The valuation subgroup contributes no invariants. The sign torsion contributes normalized length $a_w$, and local duality gives the same length for $H^2$.
  Set $Gamma = "Gal" \( P \/ bb(Q)_2 \)$, $U^1 = 1 + 2 cal(O)_P$, and $U^2 = 1 + 4 cal(O)_P$. On tensor products with $A$, let $Gamma$ act diagonally, using the character twist on $A$. The logarithm identifies $U^2$ with $4 cal(O)_P$. An integral normal basis makes this an induced $Gamma$-lattice, also after the character twist; in particular $H^1 \( Gamma \, U^2 ⊗ A \) = 0$. Thus
  $ 0 arrow.r \( U^2 ⊗ A \)^Gamma & arrow.r \( U^1 ⊗ A \)^Gamma\
 & arrow.r \( \( cal(O)_P \/ 2 \) ⊗ A \)^Gamma arrow.r 0 $
  is exact. The last term is isomorphic as an $A$-module to $A \/ 2 A$, so has normalized length one. Evaluation of the smaller logarithm lattice has valuation exactly two: the character resolvent of an integral normal generator is a unit, since the normal-basis circulant matrix is invertible over the integers.
  The sign torsion, of length $a_w$, is killed by the logarithm and has trivial intersection with $U^2$. The free logarithm lattice is therefore enlarged from the smaller lattice by length $1 - a_w$. Its valuation is $2 - \( 1 - a_w \) = 1 + a_w$. Finally, in the global–local determinant triangle the local torsion terms have equal lengths and cancel. Proposition 134 then gives the stated strict determinant valuation. ◻
]

#thm([Proposition 15.6.])[
  (Comparator determinant).  #emph[At every stage and high-order character selected above, 
#[#set math.equation(numbering: n => "(Y2)")
 $ v_2 \( D \) = 2 v_2 \( ell_w z_(upright("ray")) \) + sum_(q in S \, thin v_0 divides q) v_2 \( P_q \( chi \( upright("Fr")_(v_0) \) \) \) . $ <eq:Y2>]

 The two terms above the rational prime two sum to $2 a_w - 2$.]
] <cyclic:determinant>

#proof[
  The conjugate dual strict problem has the same valuation by duality. Passing back from its zero to full odd allowed places on $T_2 chi$ adds at each unramified old odd place $v_0 divides q$ the length difference
  $ v_2 \( 1 - q \/ beta \) - v_2 \( 1 - beta \) \, #h(2em) beta = \( rho^(- 1) chi \) \( upright("Fr")_(v_0) \) \, $
  by $H^2 \, H^1$ torsion respectively.
  There is integral acyclicity at primes of $m$ by cubic inertia. At each new inert place the difference is zero: $H^1$-torsion there uses discrete invariants on the coefficient modulo its lattice, with Frobenius lift $gamma_j^2$ acting trivially, hence has length the valuation of inertia scalar minus one; the dual $H^2$-length is the same ($r_j^2$ sufficiently close to 1 here). These complexes are all rationally acyclic by the character tests. Since $v_2 \( 1 - tau \( upright("Fr")_(v_0) \) \) = v_2 \( 1 - beta \)$, adding these terms to Lemma 135 and substituting $z_S = e_S z_(upright("ray"))$ gives (Y2). At two, each polynomial has valuation $a_w - 1$: its first factor has valuation $a_w$, and its second factor has valuation $- 1$. The two places therefore contribute $2 a_w - 2$, as asserted. ◻
]

=== 15.5 Comparator disk centers <comparator-disk-centers>

The primitive log to be used for the Eisenstein form in the disk formula is

$ G = - frak(g) \( rho \)^(- 1) sum_(alpha \, beta in \( bb(Z) \/ m \)^times med \/ med upright(s i m u l .) med plus.minus) rho \( alpha beta \) log g_(alpha \/ m \, beta \/ m) \( m tau_(upright("mod")) \) \, #h(2em) frak(g) \( rho \) = sum_b rho \( b \) e^(2 pi i b \/ m) . $

#thm([Lemma 15.7.])[
  (Eisenstein primitive).  #emph[The function $G$ has Tate coefficients $a_l \/ l$, and its three degree-two quotient logs sum to $a_2 G$. Hence $P_2 \( V_2 \) G$ is the two-depleted antiderivative on the ordinary CM disks.]
] <cyclic:eisenstein-primitive>

#proof[
  Transfer constants accordingly to the embedding used; the Gauss factor is a 2-adic unit. Evaluate thus on the middle curve of the cyclic $m^2$-chain, the two axes being generators of the dual-previous and next subgroups with a fixed Weil pairing. Inverse scalings make no difference. The log Tate expansion at the cyclic $mu$-level cusp has exactly coefficients $a_l \/ l$: the two opposite progressions in each Siegel product with the simultaneous sign quotient retain one copy of each progression, then sum by Gauss over $beta$. Leading $q_(upright("Tate"))$-powers cancel since $sum_beta rho \( beta \) = 0$; root phases have log zero.
  In particular the differential agrees with the prescribed modular-form differential. Also the sum of logs at the three degree-two quotients is $a_2 G$, with no constant. Indeed at the Tate cusp use the two square-root expansions and square expansion giving this by Hecke recursion. The differential identity extends algebraically, and this constant-log comparison is of modular-unit combinations: zero differential gives a zero divisor combination, hence a scalar combination of integral divisor relations, reducing to logs of constants checked at the same cusp. One can pull to a fine cover with the relevant branches for this test, taking powers to remove root ambiguities. The logs are analytic on the ordinary interior disks. Thus the two-source trace argument of (M1) applies, and $P_2 \( V_2 \) G$ is precisely the 2-depleted antiderivative there. ◻
]

At the stage character this gives the two primitive weighted order-conductor sums of $G$, multiplied by the Euler polynomials in the inverse translations on the respective orientations. The polynomial-factor valuation sum is exactly the sum in (Y2) (opposite choices at odd primes; at 2 repeating the connected choice doesn’t change the valuation).

#thm([Lemma 15.8.])[
  (Order labels and ray labels).  #emph[In either orientation, the primitive weighted order-conductor sum of $G$ has valuation $v_2 \( ell_w z_(upright("ray")) \)$.]
] <cyclic:ray-labels>

#proof[
  The middle-curve passage translates the order-$s$ labels by a fixed split ideal. The $\( alpha \, beta \)$ yield every primitive $m$-division generator over the order modulo sign, since the axes are split. Under actual CM Galois action over $K$ pairing-normalized frames on the axes transform by scalings of product the mod-$m$ cyclotomic value; thus the weights $rho \( alpha beta \)$ transform by exactly the cubic norm character.
  Parametrize the middle curves of order conductor $s$ by maximal-order curves quotiented by one line at each inert $r_j$, transporting the split groups. This gives all the labels exactly by CM and the order class group (relative transitivity on all the lines, units just signs). Pairing-frame transport from below has here just a fixed extra degree scaling from $s$. Through these isogenies the Siegel log sums over all preimages of the torsion point, without averaging (for a cyclic quotient multiply the products for the Tate multiplicative kernel, and use basis change, up to killed phases).
  Terms omitting any $r_j$-component trace to zero by nontriviality of $chi$ on its line labels. In the surviving terms, each nonzero $r_j$-division point lies on exactly one of the $r_j + 1$ lines. Each line supplies $r_j - 1$ nonzero points, giving $\( r_j + 1 \) \( r_j - 1 \) = r_j^2 - 1$ labels. These are exactly the primitive $cal(O)_K \/ \( r_j \)$-coordinates by inertness.
  The label identification can be made explicitly on each maximal-order CM curve. Choose representatives for the $m$-division generators modulo simultaneous sign. The Chinese remainder decomposition combines such a generator with one nonzero $r_j$-division point for every $j$ to give a primitive $cal(O)_K \/ \( m s \)$-coordinate modulo units. Conversely, each nonzero $r_j$-coordinate determines its unique $bb(F)_(r_j)$-line, recovering the quotient-curve label. Changing the chosen $m$-representative negates all the $r_j$-coordinates simultaneously. Thus there is exactly one global sign identification, and these are all the ray labels above the Hilbert classes.
  Their ring-order weights use the natural line-quotient curves, and with the frame weights thus give exactly the full $rho chi$ on the labels by CM action, up to translation (ideals labelled here by actual Artin action). This works on either orientation. Hence we have up to units precisely the ray log on $z_(upright("ray"))$, which likewise uses the full sum after restricting weighted corestriction.
  Even primitive conjugates under convention changes have the same valuation: coefficient automorphisms at the unique dyadic prime extend locally and act on the underlying Siegel logs by a ray translation ($K_w = bb(Q)_2$). ◻
]

Combining Proposition 136 with Lemmas 137 and 138 proves (Y1).

=== 15.6 The cyclic-cubic anchor <the-cyclic-cubic-anchor>

#thm([Proposition 15.9.])[
  #emph[For the original curve $E_0$, the discriminants $h$ and $- d$ of Lemma 131 satisfy 
$ "an" \( E_0^h \) + "an" \( E_0^(- d h) \) = 1 \, #h(2em) X \( E_0^h \) + X \( E_0^(- d h) \) = 0 . $

 Thus Proposition 4 holds for cyclic-cubic residual image.]
] <cyclic:anchor>

#proof[
  #emph[The integral unit.] By (Y1), the restrictions of $B \, D$ to the chosen tame line have the same finite residual Weierstrass order: evaluate at sufficiently high two-power roots and apply the valuation test. The residual congruences $B_E \( 0 \, upright(bold(u)) \) equiv B med \( mod med 2 \)$ and $D_E equiv D med \( mod med 2 \)$, with determinant bases chosen up to units, give the same equality of orders for the curve. Lemma 133 makes $B_E \/ D_E$ integral. Its residual restriction has order zero, so its constant term is a unit and therefore $B_E \/ D_E$ is a unit in the full local power-series ring.
  #emph[The rank-one center.] Apply the rank-detection argument from the proof of Proposition 73 at $t = 0$, on the transverse tame line through the characteristic-zero origin. Lemma 131 gives $s_2 \( E \/ K \) = 1$. The dyadic comparison is the unramified Kummer/logarithm comparison, and all other allowed finite terms are acyclic there; for the moving inert terms this uses $a_(j \, *) eq.not 0$. Formula (M2) identifies the center log square. Together with the unit quotient $B_E \/ D_E$, it gives zero valuation of the finite class-functional tensor. Both special cohomology lines have rank one, so the Heegner class specializes nontrivially. The exact Gross–Zagier formula (GZ-E) now gives a simple zero of $L \( E \/ K \, s \)$. In particular each elliptic factor has analytic rank at most one, and its discrepancy $X$ is defined.
  #emph[The exact central value.] Evaluate the same unit equality at the all-zero origin. At every added inert prime, the singular unramified-inflation determinant contributes valuation $2 v_2 \( a_(j \, *) \)$; the two oriented point traces contribute the same squared multiplier $a_(j \, *)^2$. They cancel integrally, as in the preceding anchors. Formula (E), now with precisely the support $S$, and the arithmetic-volume identity (G) yield
  $ X \( E \) + X \( E^(- d) \) = 0 . $
  The real period and Gross–Zagier height are the exact normalizations of (GZ). Returning to $E = E_0^h$ gives both asserted equalities. Finally, $h$ is an odd fundamental discriminant prime to $2 N_(E_0)$, and $- d$ is prime to $2 h N_(E_0)$, whose prime factors all split in $K$. These are precisely the discriminant conditions in Proposition 4. ◻
]

== 16 Conclusion <sec:conclusion>

#proof[
  #emph[Completion of Proposition 4.] The residual cases treated above are exhaustive. If $A \[ 2 \]$ is reducible, its invariant line contains a nonzero rational two-torsion point, and Section 10 supplies the anchor. Otherwise the image is an irreducible subgroup of $"GL"_2 \( bb(F)_2 \) tilde.eq S_3$, hence is $C_3$ or $S_3$. The $S_3$ case divides according to whether its quadratic sign field is imaginary or real; these are handled in Sections 13 and 14. Proposition 139 handles $C_3$.
  Each construction gives an odd fundamental discriminant $h$, allowing one, prime to $2 N_A$, and an imaginary fundamental discriminant $k$ prime to $2 h N_A$, with every prime dividing $2 h N_A$ split in the corresponding quadratic field. It first proves a simple zero of the product $L \( A^h \, s \) L \( A^(h k) \, s \)$, and then proves $X \( A^h \) + X \( A^(h k) \) = 0$ with both discrepancies defined. These are all the assertions of Proposition 4. ◻
]

The Positive comparison, Proposition 3, was completed in Section 7; the CM comparison, Proposition 5, was completed in Section 11. We can therefore finish the proof for the original curve.

#proof[
  Let $E \/ bb(Q)$ satisfy $s_2 \( E \) lt.eq 1$. Suppose first that $E$ is non-CM. Proposition 4 gives $h \, k$ with
  $ "an" \( E^h \) + "an" \( E^(h k) \) = 1 \, #h(2em) X \( E^h \) + X \( E^(h k) \) = 0 . $
  Both analytic orders are nonnegative integers, so each is at most one. By the first part of Proposition 3, both terms in the second equality are nonnegative. Hence
  $ X \( E^h \) = X \( E^(h k) \) = 0 . $
  The discriminants $h \, k$ are odd and coprime. Their product is again a fundamental discriminant, and exactly one of $h \, h k$ is positive because $k < 0$. Denote that positive member by $a$, allowing $a = 1$. It is prime to $2 N_E$, and $"an" \( E^a \) lt.eq 1$, $X \( E^a \) = 0$. The second part of Proposition 3, applied to the original curve $E$, therefore gives
  $ "an" \( E \) = s_2 \( E \) \, #h(2em) X \( E \) = 0 . $
  For a CM curve, Proposition 5 gives the same conclusion directly.
  In either case the analytic order is zero or one. The classical Gross–Zagier–Kolyvagin theorem gives
  $ "rank" E \( bb(Q) \) = "an" \( E \) = s_2 \( E \) \, #h(2em) \# "Sha" \( E \/ bb(Q) \) < oo $
  for the whole Tate–Shafarevich group, not just its two-primary part [27,33]. The period rationality in rank zero, and the split Gross–Zagier and arithmetic-volume comparisons in rank one, give $Q_E in bb(Q)_(> 0)$, as established in Section 2. By the definition of the discrepancy,
  $ 0 = X \( E \) = v_2 #h(-1em) (frac(Q_E, \# "Sha" \( E \/ bb(Q) \))) \, $
  which is precisely $v_2 \( Q_E \) = v_2 \( \# "Sha" \( E \/ bb(Q) \) \)$.
  Throughout, $Omega_E$ is the period over the whole real group, and $"Reg"_E$ is computed on the full Mordell–Weil lattice with the height pairing specified in Section 1. Thus the equality contains the real-component contribution and every point-index square required by the stated normalization. The residual classification and the dyadic local comparisons cover every residual representation and every reduction type at two. ◻
]

#thm([Corollary 16.1.])[
  (Exact two-primary BSD for almost all quadratic twists).  #emph[Fix an elliptic curve $E \/ bb(Q)$. For each nonzero squarefree integer $d$, write $E^d$ for the quadratic twist of $E$ by $d$, and put 
$ cal(D) \( X \) & = { d in bb(Z) : 0 < \| d \| lt.eq X \, med d upright(" squarefree") } \,\
cal(D)_j \( E \; X \) & = { d in cal(D) \( X \) : s_2 \( E^d \) = j } #h(2em) \( j = 0 \, 1 \) . $

 Then 
$ lim_(X arrow.r oo) frac(\# cal(D)_j \( E \; X \), \# cal(D) \( X \)) = 1 / 2 #h(2em) \( j = 0 \, 1 \) . $

 For every nonzero squarefree $d$ with $s_2 \( E^d \) = j in { 0 \, 1 }$, put $F = E^d$. Then 
$ "rank" F \( bb(Q) \) = "ord"_(s = 1) L \( F \, s \) = s_2 \( F \) = j \, #h(2em) \# "Sha" \( F \/ bb(Q) \) < oo \, $

 and 
$ Q_F = frac(L^(\( j \)) \( F \, 1 \) thin \( \# T_F \)^2, j ! thin Omega_F "Reg"_F product_(ell med upright("finite")) c_ell \( F \)) in bb(Q)_(> 0) \, #h(2em) v_2 \( Q_F \) = v_2 #scale(x: 120%, y: 120%)[\(] \# "Sha" \( F \/ bb(Q) \) #scale(x: 120%, y: 120%)[\)] . $

 Here the period, regulator, torsion, and Tamagawa factors have the normalizations fixed before Theorem 1. In particular, the exact two-primary formula holds on the density-one union of these subfamilies, whose common ranks are respectively zero and one. The density is in the full signed squarefree family for fixed $E$; the formula asserts equality only at the prime two.]
] <cor:quadratic-twist-density>

#proof[
  The proof of Theorem 1.2 in [44] gives density $1 \/ 2$ for each of the usual full $2$-power Selmer coranks zero and one among the signed squarefree parameters ordered by absolute value. Its $c_2$ is $s_2$ here, since both use the usual local Kummer conditions at every place. This gives the two displayed density limits. For every twist in either subfamily, Theorem 1 applied to $F = E^d$ gives all the pointwise assertions. The two disjoint subfamilies have densities summing to one. ◻
]

#heading(level: 1)[References]
#bibitem([1])[U.~K. Anandavardhanan and D. Prasad, #emph[A local-global question in automorphic forms], Compos. Math. #strong[149] (2013), 959--995. #link("https://www.math.iitb.ac.in/~dprasad/comp2013.pdf")[Author manuscript].]
#bibitem([2])[M. Bertolini, H. Darmon, and K. Prasanna, #emph[Generalized Heegner cycles and $p$-adic Rankin $L$-series], with an appendix by B. Conrad, Duke Math. J. #strong[162] (2013), no.~6, 1033--1148. #link("https://doi.org/10.1215/00127094-2142056")[doi:10.1215/00127094-2142056].]
#bibitem([3])[M. Bertolini, H. Darmon, and R. Venerucci, #emph[Heegner points and Beilinson--Kato elements: A conjecture of Perrin-Riou], Adv. Math. #strong[398] (2022), article 108172. #link("https://doi.org/10.1016/j.aim.2021.108172")[doi:10.1016/j.aim.2021.108172].]
#bibitem([4])[B.~J. Birch and H.~P.~F. Swinnerton-Dyer, #emph[Notes on elliptic curves. II], J. Reine Angew. Math. #strong[218] (1965), 79--108. #link("https://doi.org/10.1515/crll.1965.218.79")[doi:10.1515/crll.1965.218.79].]
#bibitem([5])[S. Bloch and K. Kato, #emph[$L$-functions and Tamagawa numbers of motives], in #emph[The Grothendieck Festschrift], Vol.~I, Progr. Math. #strong[86], Birkhäuser, 1990, 333--400. #link("https://doi.org/10.1007/978-0-8176-4574-8_9")[Reprint].]
#bibitem([6])[F.~A. Bogomolov, #emph[Points of finite order on an abelian variety], Izv. Akad. Nauk SSSR Ser. Mat. #strong[44] (1980), 782--804; English translation, Math. USSR-Izv. #strong[17] (1981), 55--72. #link("https://doi.org/10.1070/IM1981v017n01ABEH001329")[English edition].]
#bibitem([7])[C. Breuil, B. Conrad, F. Diamond, and R. Taylor, #emph[On the modularity of elliptic curves over $bb(Q)$: wild $3$-adic exercises], J. Amer. Math. Soc. #strong[14] (2001), no.~4, 843--939. #link("https://doi.org/10.1090/S0894-0347-01-00370-8")[doi:10.1090/S0894-0347-01-00370-8].]
#bibitem([8])[J.~P. Buhler, B.~H. Gross, and D.~B. Zagier, #emph[On the conjecture of Birch and Swinnerton-Dyer for an elliptic curve of rank $3$], Math. Comp. #strong[44] (1985), 473--481. #link("https://doi.org/10.2307/2007967")[doi:10.2307/2007967].]
#bibitem([9])[D. Bump, S. Friedberg, and J. Hoffstein, #emph[Nonvanishing theorems for $L$-functions of modular forms and their derivatives], Invent. Math. #strong[102] (1990), 543--618. #link("https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf")[Article].]
#bibitem([10])[A. Burungale, F. Castella, C. Skinner, and Y. Tian, #emph[$p^oo$-Selmer groups and rational points on CM elliptic curves], Ann. Math. Québec #strong[46] (2022), no.~2, 325--346. #link("https://doi.org/10.1007/s40316-022-00203-y")[doi:10.1007/s40316-022-00203-y].]
#bibitem([11])[A. Burungale and M. Flach, #emph[The conjecture of Birch and Swinnerton-Dyer for certain elliptic curves with complex multiplication], Cambridge J. Math. #strong[12] (2024), no.~2, 357--415. The theorem numbering used here is that of #link("https://arxiv.org/abs/2206.09874v2")[arXiv:2206.09874v2] (2022).]
#bibitem([12])[A. Burungale, C. Skinner, Y. Tian, and X. Wan, #emph[Zeta elements for elliptic curves and applications], #link("https://arxiv.org/abs/2409.01350v2")[arXiv:2409.01350v2] (2024).]
#bibitem([13])[A.~A. Burungale and Y. Tian, #emph[A rank zero $p$-converse to a theorem of Gross--Zagier, Kolyvagin and Rubin], Ann. of Math. (2) #strong[203] (2026), no.~1, 1--13. #link("https://doi.org/10.4007/annals.2026.203.1.1")[doi:10.4007/annals.2026.203.1.1].]
#bibitem([14])[L. Cai, C. Li, and S. Zhai, #emph[On the $2$-part of the Birch and Swinnerton-Dyer conjecture for quadratic twists of elliptic curves], J. Lond. Math. Soc. #strong[101] (2020), 714--734. #link("https://doi.org/10.1112/jlms.12284")[doi:10.1112/jlms.12284].]
#bibitem([15])[L. Cai, J. Shu, and Y. Tian, #emph[Explicit Gross--Zagier and Waldspurger formulae], Algebra Number Theory #strong[8] (2014), no.~10, 2523--2572. #link("https://msp.org/ant/2014/8-10/ant-v8-n10-p05-s.pdf")[Article].]
#bibitem([16])[J.~W.~S. Cassels, #emph[Arithmetic on curves of genus $1$. VIII. On conjectures of Birch and Swinnerton-Dyer], J. Reine Angew. Math. #strong[217] (1965), 180--199. #link("https://doi.org/10.1515/crll.1965.217.180")[doi:10.1515/crll.1965.217.180].]
#bibitem([17])[K. Česnavičius and N. Imai, #emph[The remaining cases of the Kramer--Tunnell conjecture], Compos. Math. #strong[152] (2016), no.~11, 2255--2268. #link("https://doi.org/10.1112/S0010437X16007624")[doi:10.1112/S0010437X16007624].]
#bibitem([18])[J. Coates, Y. Li, Y. Tian, and S. Zhai, #emph[Quadratic twists of elliptic curves], Proc. Lond. Math. Soc. #strong[110] (2015), 357--394. #link("https://doi.org/10.1112/plms/pdu059")[doi:10.1112/plms/pdu059].]
#bibitem([19])[B. Conrad, #emph[Gross--Zagier revisited], with an appendix by W.~R. Mann, in #emph[Heegner Points and Rankin $L$-Series], H. Darmon and S.-W. Zhang (eds.), Math. Sci. Res. Inst. Publ. #strong[49], Cambridge University Press, 2004, 67--163. #link("https://math.stanford.edu/~conrad/papers/gzfinal.pdf")[Author manuscript dated February 11, 2003].]
#bibitem([20])[P. Deligne and M. Rapoport, #emph[Les schémas de modules de courbes elliptiques], in #emph[Modular Functions of One Variable II], Lecture Notes in Math. #strong[349], Springer, 1973, 143--316. #link("https://link.springer.com/book/10.1007/978-3-540-37855-6")[Publisher record].]
#bibitem([21])[T. Dokchitser and V. Dokchitser, #emph[On the Birch--Swinnerton-Dyer quotients modulo squares], Ann. of Math. (2) #strong[172] (2010), no.~1, 567--596. #link("https://doi.org/10.4007/annals.2010.172.567")[doi:10.4007/annals.2010.172.567].]
#bibitem([22])[T. Dokchitser and V. Dokchitser, #emph[Root numbers and parity of ranks of elliptic curves], J. Reine Angew. Math. #strong[658] (2011), 39--64. #link("https://doi.org/10.1515/crelle.2011.060")[doi:10.1515/crelle.2011.060].]
#bibitem([23])[V.~G. Drinfeld, #emph[Two theorems on modular curves], Funct. Anal. Appl. #strong[7] (1973), no.~2, 155--156. #link("https://doi.org/10.1007/BF01078890")[doi:10.1007/BF01078890].]
#bibitem([24])[G. Faltings, #emph[Endlichkeitssätze für abelsche Varietäten über Zahlkörpern], Invent. Math. #strong[73] (1983), 349--366. #link("https://doi.org/10.1007/BF01388432")[doi:10.1007/BF01388432].]
#bibitem([25])[S. Friedberg and J. Hoffstein, #emph[Nonvanishing theorems for automorphic $L$-functions on $upright(G L) \( 2 \)$], Ann. of Math. (2) #strong[142] (1995), no.~2, 385--423. #link("https://doi.org/10.2307/2118638")[doi:10.2307/2118638].]
#bibitem([26])[C. Fuchs and D.~H. Pham, #emph[The $p$-adic analytic subgroup theorem revisited], $p$-Adic Numbers Ultrametric Anal. Appl. #strong[7] (2015), no.~2, 143--156. #link("https://doi.org/10.1134/S2070046615020065")[doi:10.1134/S2070046615020065]\; #link("https://arxiv.org/abs/1502.00768v1")[arXiv:1502.00768v1].]
#bibitem([27])[B.~H. Gross and D.~B. Zagier, #emph[Heegner points and derivatives of $L$-series], Invent. Math. #strong[84] (1986), 225--320. #link("https://doi.org/10.1007/BF01388809")[doi:10.1007/BF01388809].]
#bibitem([28])[D. Jetchev, C. Skinner, and X. Wan, #emph[The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one], Cambridge J. Math. #strong[5] (2017), no.~3, 369--434. #link("https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2017/0005/0003/CJM-2017-0005-0003-a002.pdf")[Article].]
#bibitem([29])[J. Johnson-Leung and G. Kings, #emph[On the equivariant main conjecture for imaginary quadratic fields], J. Reine Angew. Math. #strong[653] (2011), 75--114. #link("https://doi.org/10.1515/CRELLE.2011.020")[doi:10.1515/CRELLE.2011.020].]
#bibitem([30])[K. Kato, #emph[$p$-adic Hodge theory and values of zeta functions of modular forms], Astérisque #strong[295] (2004), 117--290. #link("https://www.numdam.org/item/AST_2004__295__117_0/")[Article and bibliographic record].]
#bibitem([31])[N.~M. Katz and B. Mazur, #emph[Arithmetic Moduli of Elliptic Curves], Annals of Mathematics Studies #strong[108], Princeton University Press, 1985.]
#bibitem([32])[F. Knudsen and D. Mumford, #emph[The projectivity of the moduli space of stable curves. I: Preliminaries on "det" and "Div"], Math. Scand. #strong[39] (1976), 19--55. #link("https://doi.org/10.7146/math.scand.a-11642")[doi:10.7146/math.scand.a-11642].]
#bibitem([33])[V.~A. Kolyvagin, #emph[Euler systems], in #emph[The Grothendieck Festschrift], Vol.~II, Progr. Math. #strong[87], Birkhäuser, 1990, 435--483. #link("https://link.springer.com/book/10.1007/978-0-8176-4575-5")[Publisher record].]
#bibitem([34])[K. Kramer, #emph[Arithmetic of elliptic curves upon quadratic extension], Trans. Amer. Math. Soc. #strong[264] (1981), no.~1, 121--135. #link("https://doi.org/10.1090/S0002-9947-1981-0597871-8")[doi:10.1090/S0002-9947-1981-0597871-8].]
#bibitem([35])[K. Kramer and J. Tunnell, #emph[Elliptic curves and local $epsilon.alt$-factors], Compos. Math. #strong[46] (1982), no.~3, 307--352. #link("https://www.numdam.org/item/CM_1982__46_3_307_0/")[Article].]
#bibitem([36])[D. Kriz and C. Li, #emph[Goldfeld's conjecture and congruences between Heegner points], Forum Math. Sigma #strong[7] (2019), e15, 80 pp. #link("https://doi.org/10.1017/fms.2019.9")[doi:10.1017/fms.2019.9].]
#bibitem([37])[E. Lapid and S. Rallis, #emph[On the nonnegativity of $L \( 1 / 2 \, pi \)$ for $upright(S O)_(2 n + 1)$], Ann. of Math. (2) #strong[157] (2003), no.~3, 891--917. #link("https://doi.org/10.4007/annals.2003.157.891")[doi:10.4007/annals.2003.157.891].]
#bibitem([38])[Y. Li, Y. Tian, X. Yan, and X. Zhu, #emph[On the Birch-Swinnerton-Dyer conjecture for rational elliptic curves with complex multiplication and analytic rank one], Pure Appl. Math. Q., online publication (2025). #link("https://doi.org/10.4310/PAMQ.251115004959")[doi:10.4310/PAMQ.251115004959]\; #link("https://xiuwuzhu.com/pub/cmbsd.pdf")[author manuscript].]
#bibitem([39])[B. Mazur and K. Rubin, #emph[Kolyvagin systems], Mem. Amer. Math. Soc. #strong[168] (2004), no.~799, viii+96 pp. #link("https://doi.org/10.1090/memo/0799")[doi:10.1090/memo/0799].]
#bibitem([40])[B. Mazur and K. Rubin, #emph[Ranks of twists of elliptic curves and Hilbert's tenth problem], Invent. Math. #strong[181] (2010), 541--575. #link("https://doi.org/10.1007/s00222-010-0252-0")[doi:10.1007/s00222-010-0252-0].]
#bibitem([41])[J.~S. Milne, #emph[Arithmetic Duality Theorems], second edition, BookSurge, 2006. #link("https://www.jmilne.org/math/Books/adt.html")[Author's edition and corrections].]
#bibitem([42])[M.~R. Murty and V.~K. Murty, #emph[Mean values of derivatives of modular $L$-series], Ann. of Math. (2) #strong[133] (1991), no.~3, 447--475. #link("https://doi.org/10.2307/2944316")[doi:10.2307/2944316].]
#bibitem([43])[J. Nekovář, #emph[Selmer complexes], Astérisque #strong[310] (2006), viii+559 pp. #link("https://www.numdam.org/item/AST_2006__310__R1_0/")[Book].]
#bibitem([44])[OpenAI, #emph[Goldfeld's analytic density conjecture and the $2$-converse for elliptic curves], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Goldfelds-analytic-density-conjecture-and-the-2-converse-for-elliptic-curves-September-23-2026/paper.pdf")[OAI:Goldfelds-analytic-density-conjecture-and-the-2-converse-for-elliptic-curves-September-23-2026], 2026.]
#bibitem([45])[OpenAI, #emph[The Selmer converse for elliptic curves at every prime], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-Selmer-converse-for-elliptic-curves-at-every-prime-September-24-2026/main.pdf")[OAI:The-Selmer-converse-for-elliptic-curves-at-every-prime-September-24-2026], 2026.]
#bibitem([46])[H. Oukhaba, #emph[Index formulas for ramified elliptic units], Compos. Math. #strong[137] (2003), no.~1, 1--22. #link("https://doi.org/10.1023/A:1023667807218")[doi:10.1023/A:1023667807218].]
#bibitem([47])[B. Perrin-Riou, #emph[Fonctions $L$ $p$-adiques d'une courbe elliptique et points rationnels], Ann. Inst. Fourier #strong[43] (1993), no.~4, 945--995. #link("https://doi.org/10.5802/aif.1362")[doi:10.5802/aif.1362].]
#bibitem([48])[B. Poonen and M. Stoll, #emph[The Cassels--Tate pairing on polarized abelian varieties], Ann. of Math. (2) #strong[150] (1999), no.~3, 1109--1149. #link("https://doi.org/10.2307/121064")[doi:10.2307/121064]\; #link("https://math.mit.edu/~poonen/papers/sha.pdf")[corrected author version, August 23, 2014].]
#bibitem([49])[K.~A. Ribet, #emph[Galois representations attached to eigenforms with Nebentypus], in #emph[Modular Functions of One Variable V], J.-P. Serre and D.~B. Zagier (eds.), Lecture Notes in Math. #strong[601], Springer, 1977, 17--52. #link("https://doi.org/10.1007/BFb0063943")[doi:10.1007/BFb0063943].]
#bibitem([50])[D.~E. Rohrlich, #emph[$L$-functions and division towers], Math. Ann. #strong[281] (1988), 611--632. #link("https://doi.org/10.1007/BF01456842")[doi:10.1007/BF01456842].]
#bibitem([51])[K. Rubin, #emph[The "main conjectures" of Iwasawa theory for imaginary quadratic fields], Invent. Math. #strong[103] (1991), 25--68. #link("https://doi.org/10.1007/BF01239508")[doi:10.1007/BF01239508].]
#bibitem([52])[M. Schütt, #emph[CM newforms with rational coefficients], Ramanujan J. #strong[19] (2009), 187--205. #link("https://doi.org/10.1007/s11139-008-9147-8")[doi:10.1007/s11139-008-9147-8]. The theorem numbering used here is that of #link("https://arxiv.org/abs/math/0511228v5")[arXiv:math/0511228v5] (2008).]
#bibitem([53])[J.-P. Serre, #emph[Abelian $ell$-Adic Representations and Elliptic Curves], W.~A. Benjamin, 1968.]
#bibitem([54])[J.-P. Serre, #emph[Propriétés galoisiennes des points d'ordre fini des courbes elliptiques], Invent. Math. #strong[15] (1972), 259--331. #link("https://www.college-de-france.fr/media/jean-pierre-serre/UPL5874918517843398173_Serre_proprie_te_s_galoisiennes_des_courbes_elliptiques.pdf")[Article].]
#bibitem([55])[J. Shu and S. Zhai, #emph[Generalized Birch lemma and the $2$-part of the Birch and Swinnerton-Dyer conjecture for certain elliptic curves], J. Reine Angew. Math. #strong[775] (2021), 117--143. #link("https://arxiv.org/abs/2102.11808v1")[arXiv:2102.11808v1].]
#bibitem([56])[J.~H. Silverman, #emph[The Arithmetic of Elliptic Curves], second edition, Graduate Texts in Mathematics #strong[106], Springer, 2009. #link("https://doi.org/10.1007/978-0-387-09494-6")[doi:10.1007/978-0-387-09494-6].]
#bibitem([57])[C. Skinner and E. Urban, #emph[The Iwasawa main conjectures for $upright(G L)_2$], Invent. Math. #strong[195] (2014), 1--277. #link("https://doi.org/10.1007/s00222-013-0448-1")[doi:10.1007/s00222-013-0448-1].]
#bibitem([58])[J. Tate, #emph[On the conjectures of Birch and Swinnerton-Dyer and a geometric analog], Séminaire Bourbaki, Vol.~9, exp.~306 (1965/66), 415--440. #link("https://numdam.org/item/SB_1964-1966__9__415_0.pdf")[Article].]
#bibitem([59])[R. Taylor and A. Wiles, #emph[Ring-theoretic properties of certain Hecke algebras], Ann. of Math. (2) #strong[141] (1995), no.~3, 553--572. #link("https://doi.org/10.2307/2118560")[doi:10.2307/2118560].]
#bibitem([60])[S. Wang, #emph[Le système d'Euler de Kato], #link("https://arxiv.org/abs/1211.3767v1")[arXiv:1211.3767v1] (2012).]
#bibitem([61])[A. Wiles, #emph[Modular elliptic curves and Fermat's Last Theorem], Ann. of Math. (2) #strong[141] (1995), no.~3, 443--551. #link("https://doi.org/10.2307/2118559")[doi:10.2307/2118559].]
#bibitem([62])[W. Zhang, #emph[Selmer groups and the indivisibility of Heegner points], Cambridge J. Math. #strong[2] (2014), no.~2, 191--253. #link("https://doi.org/10.4310/CJM.2014.v2.n2.a2")[doi:10.4310/CJM.2014.v2.n2.a2].]
#bibitem([63])[C. Zhao, #emph[A criterion for elliptic curves with lowest $2$-power in $L \( 1 \)$], Math. Proc. Cambridge Philos. Soc. #strong[121] (1997), 385--400. #link("https://doi.org/10.1017/S0305004196001247")[doi:10.1017/S0305004196001247].]


