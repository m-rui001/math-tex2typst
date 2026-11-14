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

#align(center)[#text(size: 16pt, weight: "bold")[A pointwise $2$-converse \
for elliptic curves with rational two-torsion]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Birch–Swinnerton-Dyer conjecture predicts that the order of vanishing of the $L$-function of an elliptic curve
  equals its Mordell–Weil rank, and that its Shafarevich–Tate group is finite;
  its refined form also specifies the leading coefficient #cite(label("BirchSwinnertonDyer1965"))
  #cite(label("Tate1966")). For analytic order zero or one,
  the rank equality and finiteness are theorems of Gross–Zagier and Kolyvagin #cite(label("GrossZagier1986"))
  #cite(label("Kolyvagin1990")). The converse problem begins with algebraic information and seeks the
  corresponding analytic order.

The appropriate algebraic hypothesis here is the corank of the full $2$-power Selmer group.
  It records a possible divisible contribution from the Shafarevich–Tate group as well as the Mordell–Weil rank.
  With the usual local Kummer conditions, put

$ s_2 \( E \) = "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ bb(Q) \) . $

Our main result is the following pointwise statement.

#thm([Theorem 1.1.])[
  (The rational-two-torsion $2$-converse).  #emph[Let $E \/
    bb(Q)$ be an elliptic curve with $E \( bb(Q) \) \[ 2 \] eq.not 0$ and $s_2 \( E \) in { 0 \, 1 }$. Then
$ "ord"_(s = 1) L \( E \, s \) = "rank"_(bb(Z)) E \( bb(Q) \) = s_2 \( E \) \, wide
  "Sha" \( E \/ bb(Q) \) upright(" is finite") . $

]
] <thm:main>

The statement includes one rational two-torsion line and full rational two-torsion, CM and non-CM curves,
  every rational isogeny configuration, and every reduction type at $2$ and at the bad primes.
  It is a $2$-converse in this residual range. It does not assert the full Birch–Swinnerton-Dyer
  leading-coefficient formula, nor does a bound $"rank" E \( bb(Q) \) lt.eq 1$ alone imply its Selmer hypothesis.

The broader companion #cite(label("OpenAIGoldfeldTwoConverse2026")) Theorem 1.1 proves the $2$-converse without
  the rational-two-torsion hypothesis. Here we give a separate full treatment of the rational-two-torsion case,
  developing its integral interpolation and finite twist constructions within this paper;
  the broader converse is not an input to the proof.

The converse with the stronger hypotheses $"rank" E \( bb(Q) \) =
  1$ and $"Sha" \( E \/ bb(Q) \)$ finite is known for every elliptic curve over $bb(Q)$;
  see #cite(label("Kim2023SoftConverse")) §1. The fixed-prime problem asks instead whether a low Selmer corank
  alone forces the analytic order. Skinner and Wei Zhang established general rank-one converses at good ordinary
  odd primes under residual and local hypotheses #cite(label("Skinner2020")) #cite(label("Zhang2014Heegner")).
  For odd Eisenstein primes, Castella, Grossi, Lee and Skinner prove the good-reduction converse under a
  local-character restriction #cite(label("CGLS2022")) Theorem E;
  Keller and Yin treat potentially good ordinary reduction without that restriction #cite(label("KellerYin2024"))
  Theorem B. Smith’s theorem gives the $50 \/ 50$ distribution of $2^oo$-Selmer coranks in every fixed
  quadratic-twist family, counting twist parameters of both signs #cite(label("Smith2025"));
  this density statement does not decide a prescribed member.

The CM case includes pointwise results at the prime $2$. Burungale and Tian prove the rank-zero $p$-converse for
  CM curves at every prime #cite(label("BurungaleTian2026")).
  In rank one, Burungale and Skinner treat good ordinary primes and, with a localization hypothesis,
  good supersingular primes #cite(label("BurungaleSkinner2024Appendix")) Theorems A.1 and A.3, Remark A.5.
  The earlier ordinary CM converse of Burungale, Castella, Skinner and Tian retains a Hecke-conductor condition
  #cite(label("BurungaleCastellaSkinnerTian2022")). Kriz’s preprint gives rank-zero and rank-one converses for
  maximal-order CM curves at primes ramified in the CM field,
  including the pointwise $2$-converse for the congruent-number family #cite(label("Kriz2022CM")) Theorems 1.1
  and 10.17(2). These results already treat individual curves in their stated ranges;
  the theorem here includes non-CM curves with rational two-torsion and imposes no reduction condition at $2$.

The proof brings together two arithmetic interpolation constructions and a finite construction with quadratic
  twists. Kato’s zeta classes provide the cyclotomic input #cite(label("Kato2004"));
  Ferrero–Washington’s vanishing theorem controls the residual cyclotomic cohomology
  #cite(label("FerreroWashington1979")). Heegner points and their derivative classes provide the ring-class input,
  following the Euler-system method of Kolyvagin and its cohomological formulation by Howard
  #cite(label("Kolyvagin1990")) #cite(label("Howard2012")).
  We retain integral local conditions and duality maps in the framework of Selmer complexes
  #cite(label("Nekovar2006")). The coefficient tests use the half-integral weight theory of Shimura and
  Waldspurger’s relation between coefficients and central values #cite(label("Shimura1973HalfIntegral"))
  #cite(label("Waldspurger1981")). Their ternary theta construction lies in the definite quaternion framework
  developed by Gross #cite(label("Gross1987Heights")); we use the Weil representation and the reduction
  description of Jetchev and Kane for the weighted Heegner-point tests #cite(label("Weil1964"))
  #cite(label("JetchevKane2010")). Each of these inputs has a precise role;
  none supplies the pointwise conclusion by itself.

Here is the common interpolation problem. Fix the curve that is to be tested,
  and index a finite family of quadratic twists by $x in bb(F)_2^b$, with $x = 0$ denoting that curve.
  Each auxiliary prime divides the twist parameter according to a linear form in $x$.
  We construct these families so that every nonzero address has the required analytic order and a uniform
  normalized valuation bound. An integral interpolation argument then recovers the value or derivative at the
  missing address $0$. The number and sizes of the auxiliary primes may grow with $b$; the valuation bound may not.

For Selmer corank zero, the required nonzero values are central $L$-values.
  Their normalized valuations are measured by coefficients of half-integral weight forms.
  The cyclotomic determinant makes these values part of one integral family,
  and a congruence on a sufficiently large binary cube recovers the missing value.
  This also supplies the even estimate needed to normalize the rank-one construction.

The rank-one construction requires a further preparation.
  Fix a negative quadratic discriminant $h_(*)$ with $L \( E^(\( h_(*) \)) \, 1 \) eq.not 0$.
  For positive $h$ in the prescribed local squareclasses, the genus-character Heegner sum $P_h$ attached to
  $bb(Q) \( sqrt(h h_(*)) \)$ detects a simple zero of $E^(\( h \))$:
  its height measures $L' \( E^(\( h \)) \, 1 \) L \( E^(\( h_(*) \)) \, 1 \)$.
  To normalize the corresponding coefficient tests uniformly,
  we first bound the $2$-divisibility of $P_h$ from below in terms of the prime factors of $h$,
  with a constant independent of their number. For each parameter $h$ of known analytic rank one,
  a different negative companion $k' \( h \)$, with a bounded number of prime factors,
  combines the even estimate with a ring-class lower bound to give this uniform bound.
  Only after that argument do we normalize the odd coefficients and use their minimum-depth values as binary
  nonvanishing tests.

For the return to a prescribed corank-one curve, choose one final negative discriminant $k$ with
  $L \( E^(\( k \)) \, 1 \) eq.not 0$, and fix $K = bb(Q) \( sqrt(k) \)$.
  This companion does not vary with $h$ or with the cube dimension.
  The quadratic corank identity gives $s_2 \( E \/ K \) = 1$.
  We construct families with every new prime split in $K$ for which, at every nonzero address,
  $E^(\( h \))$ has a simple zero and $E^(\( h k \))$ has nonzero central value.
  The two coefficient tests together bound the normalized index of the ring-class Heegner sum over $K$.
  Ring-class interpolation then recovers the derivative at $h = 1$.
  Thus $h_(*)$ defines the detector, $k' \( h \)$ proves its lower bound, and the fixed $k$ permits the final transfer.

The arithmetic difficulty is uniform integral control at the prime $2$.
  Residual irreducibility is unavailable here. On the cyclotomic side we use Kato classes from one fixed
  modular-form lattice, separating rational divisibility from uniform integrality.
  On the ring-class side we retain the full integral Kummer conditions at the bad places and actual maps from
  finite free models to Galois cochains. Heegner derivative operations preserve the determinant valuation even
  when a localized class is divisible by $2$. These constructions give the missing-vertex Theorems 5 and 12.

The finite construction has a different task: it must make the required coefficient tests nonzero at every nonzero
  address simultaneously. The variables are quadratic residue symbols between auxiliary primes.
  Changing one such symbol contracts two prime labels; repeated changes are governed by forests.
  Finite networks of new primes then isolate one address at a time.
  For rank one, the derivative test and its central-value partner may be separately nonzero without taking nonzero
  values on the same assignment of residue symbols. Theorem 57 adjoins prime networks making both tests equal to
  $1$ at every nonzero address.

Figure 1 records the order in which the valuation bounds are obtained and used.
  Section 2 fixes the Selmer and local conventions. Section 3 proves the cyclotomic interpolation statements;
  Sections 4 and 5 construct the ring-class deformation and prove its bounds and transfer theorem.
  Section 6 supplies auxiliary twists with prescribed local behavior and a bounded number of prime factors where
  needed. Sections 7 and 8 give the coefficient tests and finite networks.
  Section 9 assembles these results at the prescribed curve.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 1,
  align: (center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[Even coefficients, finite prime networks and cyclotomic transfer

#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$arrow.bl$
], table.cell(rowspan: 1, colspan: 1)[$arrow.br$
],
  table.cell(rowspan: 1, colspan: 1)[Uniform even estimate
], table.cell(rowspan: 1, colspan: 1)[Corank-zero conclusion
],
  table.cell(rowspan: 1, colspan: 1)[(Proposition 66)
], table.cell(rowspan: 1, colspan: 1)[(Proposition 67)
],
)
]
],
  table.cell(rowspan: 1, colspan: 1)[Even estimate $arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[Fix $h_(*)$ to define $P_h$; choose a bounded-factor companion $k' \( h \)$ Even estimate + ring-class lower bound $arrow.b.double$ Uniform lower bound for the $2$-divisibility of $P_h$ and odd coefficient normalization
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[Fix $k$ with $L \( E^(\( k \)) \, 1 \) eq.not 0$ and put $K = bb(Q) \( sqrt(k) \)$ Odd and even tests + finite prime networks split in $K$ $arrow.b.double$ Simple zeros for $E^(\( h_x \))$ and nonzero values for $E^(\( h_x k \))$ with a common normalized index bound, for every $x eq.not 0$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[Fixed-$K$ ring-class transfer and $s_2 \( E \/ K \) = 1$ $arrow.b.double$ Analytic rank one at the original vertex $x = 0$
],
)
]],
  caption: [Figure 1: The even construction proves the corank-zero case and a uniform estimate; the latter supplies the bound needed to normalize the odd coefficients. The detector partner $h_(*)$ is fixed, the bounded-factor companion $k' \( h \)$ varies only in the lower-bound step, and the final companion $k$ is fixed before the simultaneous families are constructed. The families and auxiliary primes may grow with the cube dimension; the normalized index bound may not. ],
) <fig:proof-roadmap>

== 2 Selmer coranks and fixed local data <sec:preliminaries>

For an elliptic curve $A \/ bb(Q)$, put

$ r \( A \) = "rank"_(bb(Z)) A \( bb(Q) \) \, wide a \( A \) = "ord"_(s = 1) L \( A \, s \) \, wide s_2 \( A \) =
  "corank"_(bb(Z)_2) "Sel"_(2^oo) \( A \/ bb(Q) \) . $

The Selmer group uses the local Kummer image at every place.
  The analytic continuation and functional equation are supplied by modularity #cite(label("BCDT2001")).
  Write $epsilon \( A \) in { 1 \, - 1 }$ for the root number.

#thm([Lemma 2.1.])[
  (The three ranks).  #emph[There is an exact sequence
$ 0 arrow.r A \( bb(Q) \) ⊗ bb(Q)_2 \/ bb(Z)_2 arrow.r "Sel"_(2^oo) \( A \/ bb(Q) \) arrow.r
  "Sha" \( A \/ bb(Q) \) \[ 2^oo \] arrow.r 0 . $

 Consequently
$ s_2 \( A \) = r \( A \) + "corank"_(bb(Z)_2) "Sha" \( A \/ bb(Q) \) \[ 2^oo \] . $

 If $a \( A \) in { 0 \, 1 }$, then $r \( A \) = a \( A \)$ and the whole group $"Sha" \( A \/ bb(Q) \)$ is
   finite. In that case $s_2 \( A \) = a \( A \)$.]
] <pr:ranks>

#proof[
  The Kummer sequences for multiplication by $2^n$, with the local Kummer conditions imposed, give
  $ 0 arrow.r A \( bb(Q) \) \/ 2^n A \( bb(Q) \) arrow.r "Sel"_(2^n) \( A \/ bb(Q) \) arrow.r
    "Sha" \( A \/ bb(Q) \) \[ 2^n \] arrow.r 0 . $
  Their direct limit is the displayed sequence. Taking $bb(Z)_2$-coranks proves the identity.
    The analytic-rank-zero and analytic-rank-one assertions are the Gross–Zagier–Kolyvagin theorem
    #cite(label("GrossZagier1986")) #cite(label("Kolyvagin1990"));
    see also the precise unrestricted forward statement in #cite(label("Skinner2020")) §1. ◻
]

No finite $2$-Selmer dimension will be substituted for $s_2$.
  In particular, $s_2 \( A \) = 1$ does not supply a rational point of infinite order:
  the exact sequence allows a contribution from the divisible part of $"Sha"$.

#thm([Lemma 2.2.])[
  (Parity and change of curve).  #emph[For every elliptic curve $A \/ bb(Q)$,
$ \( - 1 \)^(s_2 \( A \)) = epsilon \( A \) . $

 A rational isogeny preserves $a$, $r$, and $s_2$. If $K = bb(Q) \( sqrt(k) \)$ is quadratic, then
$ s_2 \( A \/ K \) = s_2 \( A \/ bb(Q) \) + s_2 \( A^(\( k \)) \/ bb(Q) \) . $

]
] <pr:invariance>

#proof[
  The $2$-parity assertion is due to Monsky #cite(label("Monsky1996"));
    see also #cite(label("DokchitserDokchitser2010")) Theorems 1.4 and 4.19,
    which states the Selmer-parity result for every prime and credits Monsky for the case $2$.
    For an isogeny and its dual, both composites are multiplication by the degree.
    The corresponding maps on rational points and on Selmer groups respect the Kummer conditions.
    After rationalizing their Tate modules, the maps are inverse up to a nonzero scalar;
    hence the ranks and coranks agree. The equality of $L$-functions is isogeny invariance.
  Over $K$, identify $A^(\( k \))$ with $A$, and let $c$ be the nontrivial element of $"Gal" \( K \/ bb(Q) \)$.
    Restriction and the two conjugation projections $1 + c$ and $1 -
    c$ define maps between the sum of the two Selmer groups over $bb(Q)$ and the Selmer group over $K$ whose
    composites are multiplication by $2$. Functoriality of local Kummer images gives these maps at every place.
    Rationalization therefore gives the stated corank identity.
    This argument does not assert an integral direct-sum decomposition of the Selmer groups. ◻
]

Fix a curve $E \/ bb(Q)$ of conductor $N$. A finite support $S$ always contains the primes dividing $2 N$.
  It may be enlarged by finitely many primes when the fixed construction is prepared.
  A #emph[local filter] consists of a real sign and unit squareclasses at $S$ for the variable fundamental
  discriminant. The filter is imposed on every relevant Fourier index, not just the squarefree indices.
  Its root number is constant. All variable primes lie outside $S$.

For an odd prime $p$, set

$ p^(*) = (frac(- 1, p)) p . $

Nonempty products of distinct $p^(*)$ are odd fundamental discriminants.
  We also admit the empty product $h = 1$, which denotes the untwisted curve rather than a quadratic field.
  For a squarefree product $h$ of such factors, set

$ t_p = dim_(bb(F)_2) E \[ 2 \]^("Fr"_p) \, wide w \( h \) = 1 / 2 sum_(p divides h) t_p . $

In the rational-two-torsion range, $t_p$ is $1$ or $2$. Whenever the $2$-primary group below is finite, write

$ s \( h \) = "length"_(bb(Z)_2) "Sha" \( E^(\( h \)) \/ bb(Q) \) \[ 2^oo \] . $

Thus $s \( h \)$ is a finite length, whereas $s_2 \( E^(\( h \)) \)$ is a corank.
  In particular $s \( h \)$ is defined when $s_2 \( E^(\( h \)) \) = 0$:
  the exact sequence in Lemma 2 and finite generation of the dual Selmer group make its $2$-primary quotient
  finite. This conclusion concerns the $2$-primary group; the low-analytic-rank theorem supplies finiteness of the
  whole group after analytic nonvanishing is proved. Let $v$ be a valuation above $2$, normalized by $v \( 2 \) =
  1$. After the coefficient field has been fixed, its value group is discrete.

The notation $L_(*) \( h \)$ denotes $L \( E^(\( h \)) \, 1 \)
  sqrt(\| h \|)$ divided by the fixed real or imaginary period appropriate to the filter.
  The notation $cal(L) \( h \)$ in Section 3 denotes this same normalized value.
  Every modular parametrization used to form Heegner points is normalized to send the cusp $oo$ to the identity of
  the elliptic curve. Changing among fixed nonzero modular parametrizations, isogenous curves,
  or period conventions contributes only bounded constants to valuations.
  Every such dependence is fixed before a binary cube is allowed to grow.
  Dependence on a growing number of prime factors will always be stated explicitly.

The following ledger records the order of choices used in the proof.
  It distinguishes bounds from the sizes and precisions needed to realize the auxiliary primes.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Data or bound
], table.cell(rowspan: 1, colspan: 1)[Allowed dependence and order of choice
]),
  table.cell(rowspan: 1, colspan: 1)[Fixed arithmetic constants
], table.cell(rowspan: 1, colspan: 1)[The curve, its parametrization and periods, the fixed part of the support,
  and the chosen local classes; these are fixed before the varying prime support or cube dimension.
],
  table.cell(rowspan: 1, colspan: 1)[Varying quadratic companions
], table.cell(rowspan: 1, colspan: 1)[The same data and a bound $A$ for the number of prime factors of the
  companion discriminant; its prime sizes do not enter.
],
  table.cell(rowspan: 1, colspan: 1)[Fixed-companion transfer
], table.cell(rowspan: 1, colspan: 1)[The companion field is fixed before the cube dimension.
  Constants may depend on its fixed base Selmer data, as specified in Section 5.
],
  table.cell(rowspan: 1, colspan: 1)[Finite realization
], table.cell(rowspan: 1, colspan: 1)[Choose the cube dimension and finite networks,
  then the required coefficient precision and a sufficiently late arithmetic stage.
  Prime sizes and stage thresholds may depend on these choices.
],
)
]

== 3 Cyclotomic interpolation for extensions of trivial residual modules <cy:section>

Throughout this section, $E \/ bb(Q)$ is fixed, its conductor is $N$,
  and $E \[ 2 \]$ is an extension of two trivial $bb(F)_2$-modules.
  Write $T = T_2 E$ and $V = T ⊗_(bb(Z)_2) bb(Q)_2$. The word “ordinary” applied to global cohomology below means
  that the real-place modification has not been made. It imposes no ordinary-reduction hypothesis at $2$.

The discriminants considered here are products of distinct signed primes $q^(*) = \( - 1 \/ q \) q$,
  with $q divides.not 2 N$. Fix their sign and local squareclasses at $2 N$. For such a discriminant $h$, put

$ t_q = dim_(bb(F)_2) E \[ 2 \]^("Fr"_q) \, wide 2 w \( h \) = sum_(q divides h) t_q \, wide cal(L) \( h \) =
  frac(sqrt(\| h \|) thin L \( E^(\( h \)) \, 1 \), Omega_E^("sgn" \( h \))) . $

Here fixed nonzero periods in the two period lines have been chosen once.
  Changing these choices changes the bounds below by a constant depending only on $E$.
  Valuations of algebraic central values mean their $2$-adic valuations, with $v_2 \( 2 \) = 1$.
  When $s_2 \( E^(\( h \)) \) = 0$, the group $"Sha" \( E^(\( h \)) \/ bb(Q) \) \[ 2^oo \]$ is finite; set

$ s \( h \) = "length"_(bb(Z)_2) "Sha" \( E^(\( h \)) \/ bb(Q) \) \[ 2^oo \] \, wide D \( h \) =
  v_2 \( cal(L) \( h \) \) - 2 w \( h \) - s \( h \) $

when the central value is nonzero. By Lemma 2, $s \( h \)$ is defined at a corank-zero base even before its
  central value is known to be nonzero. Only the definition of $D \( h \)$ requires that nonvanishing.

We prove the two assertions needed later.

#thm([Theorem 3.1.])[
  (Cyclotomic lower bound).  #emph[There is a constant $C_E$ such that,
    for every allowed $h$ with $L \( E^(\( h \)) \, 1 \) eq.not 0$,
$ v_2 \( cal(L) \( h \) \) med gt.eq med 2 w \( h \) + s \( h \) - C_E . $

 The constant is independent of the number and sizes of the primes dividing $h$.]
] <cy:lower-bound>

#thm([Theorem 3.2.])[
  (Transfer to the missing vertex).  #emph[Let $h_0$ be an allowed discriminant with $s_2 \( E^(\( h_0 \)) \) =
    0$. Suppose that for arbitrarily large $b$ there are a finite set $Q$ of distinct primes $q divides.not 2 N
    h_0$ and linear forms $lambda_q : bb(F)_2^b arrow.r bb(F)_2$ giving
$ h_x = h_0 product_(q in Q) \( q^(*) \)^(lambda_q \( x \)) \, wide x in bb(F)_2^b \, $

 all in the fixed local and sign classes. Suppose that a number $B$, independent of the family, satisfies
$ L \( E^(\( h_x \)) \, 1 \) eq.not 0 \, wide D \( h_x \) lt.eq B wide \( x eq.not 0 \) . $

 Then $L \( E^(\( h_0 \)) \, 1 \) eq.not 0$ and $D \( h_0 \) lt.eq B + C_E$.
   Here $C_E$ is independent of $h_0$, $Q$, and $b$; the dimension needed in the proof is allowed to depend on the
   fixed precision being tested.]
] <cy:missing-vertex>

=== 3.1 The integral scalar family and two algebraic steps <the-integral-scalar-family-and-two-algebraic-steps>

Put

$ Lambda = bb(Z)_2 \[ \[ t \] \] \, wide cal(O) = hat(Lambda_(\( 2 \))) \, wide kappa = cal(O) \/ 2 cal(O) =
  bb(F)_2 \( \( t \) \) . $

The completion defining $cal(O)$ is $2$-adic. An element of $cal(O)$ has, modulo any $2^M$,
  a Laurent expansion with a finite negative part. There is no evaluation homomorphism $cal(O) arrow.r
  bb(Q)_2$ given by $t = 0$. All central evaluations below are made on elements of $Lambda \[ 1 \/ 2 \]$ before
  extending coefficients to $cal(O)$.

For $G = \( bb(Z) \/ 2 bb(Z) \)^b$, index its characters by $x in bb(F)_2^b$,
  and denote character evaluation by a subscript $x$.

The arithmetic construction below will produce a scalar family $u in
  Lambda \[ 1 \/ 2 \] \[ G \]$ with one uniform denominator:

$ 2^(C_(upright("int"))) u in Lambda \[ G \] . $

At a constituent with $s_2 \( E^(\( h_x \)) \) = 0$, its central value $u_x \( 0 \)$ will vanish exactly when
  $L \( E^(\( h_x \)) \, 1 \)$ does; in the nonvanishing case,

$ \| v_2 \( u_x \( 0 \) \) - D \( h_x \) #scale(x: 120%, y: 120%)[\|] lt.eq C_(upright("loc")) . $

Both constants will be independent of the number and sizes of all varying primes,
  including those of the base $h_0$. Integrality gives the lower bound,
  while a congruence between the constant coefficients at $0$ and at some nonzero address gives the missing-vertex
  theorem.

Two different arguments establish the uniform denominator.
  Rational divisibility will show $u_x in Lambda \[ 1 \/ 2 \]$ character by character.
  A fixed integral Kato construction will instead give $2^(C_(upright("int"))) u in
  cal(O) \[ G \]$ before taking characters. The first lemma combines these assertions without a loss depending on
  $\| G \|$; the second supplies the congruence used at the end.

#thm([Lemma 3.3.])[
  (Integral Fourier intersection).  #emph[Suppose $u in cal(O) \[ 1 \/ 2 \] \[ G \]$,
    all $u_x$ belong to $Lambda \[ 1 \/ 2 \]$, and $2^C u in cal(O) \[ G \]$. Then $2^C u in Lambda \[ G \]$.]
] <cy:fourier>

#proof[
  Fourier inversion in characteristic zero expresses every group-basis coefficient of $u$ as a sum of the $u_x$
    divided by $\| G \|$. Thus it belongs to $Lambda \[ 1 \/ 2 \]$.
    The corresponding coefficient of $2^C u$ also belongs to $cal(O)$.
    For a power series with bounded $2$-denominator, nonnegative $cal(O)$-valuation means that every coefficient
    is integral. Consequently $cal(O) ∩ Lambda \[ 1 \/ 2 \] = Lambda$,
    which proves the assertion with the original exponent $C$. ◻
]

The common-zero parity step below is the characteristic-two case of the Chevalley–Warning principle;
  see #cite(label("HeathBrownChevalleyWarning")) Section 1, equation (1). We retain the elementary proof of this step.

#thm([Lemma 3.4.])[
  (Binary congruences).  #emph[Let $z_1 \, dots.h \, z_r in bb(Z)_2 \[ G \]$.
    Given $M gt.eq 1$, if $b > r \( 2^M - 1 \)$, there is an $x eq.not 0$ such that
$ \( z_j \)_x equiv \( z_j \)_0 med \( mod med 2^M \) wide \( 1 lt.eq j lt.eq r \) . $

 The bound depends on the number of tests and their precision, and not on the group-ring coefficients.]
] <cy:binary>

#proof[
  Choose generators of $G$. Every character-value function $z \( x \)$ has an expansion
  $ z \( x \) = a_diameter + sum_(diameter eq.not I subset.eq { 1 \, dots.h \, b }) 2^(\| I \|) a_I
    product_(i in I) x_i \, wide a_I in bb(Z)_2 . $
  This follows by expanding each sign character as a product of factors $1 - 2 x_i$.
    The $j$th binary digit of a $2$-adic integer $a$ is $binom(a, 2^j) med mod med 2$,
    equivalently the coefficient of $Y^(2^j)$ in $\( 1 + Y \)^a$ over $bb(F)_2$.
    On the Boolean cube, the contribution of the monomial $x_I = product_(i in I) x_i$ to this generating function is
  $ 1 + x_I #scale(x: 120%, y: 120%)[\(] \( 1 + Y \)^(2^(\| I \|) a_I) - 1 #scale(x: 120%, y: 120%)[\)] . $
  Its nonconstant terms have $Y$-degree at least $2^(\| I \|)$.
    In a contribution to $Y^(2^j)$, the sum of the quantities $2^(\| I \|)$ used is at most $2^j$.
    Since $\| I \| lt.eq 2^(\| I \|)$, the resulting Boolean polynomial has degree at most $2^j$.
    These formulas for $2$-adic exponents follow either by continuity from nonnegative integers or in each finite
    coefficient quotient.
  Express all $r M$ digit equalities as Boolean equations $P_(i j) \( x \) = 0$.
    Their total degree is at most $r \( 2^M - 1 \)$. The indicator of their common zero set is
    $product_(i \, j) \( 1 + P_(i j) \)$. The remaining count is the Chevalley–Warning degree argument
    #cite(label("Chevalley1935")) #cite(label("Warning1935")).
    A Boolean polynomial of degree less than $b$ has even sum over $bb(F)_2^b$:
    every monomial omits a variable, and summing over that variable gives zero in $bb(F)_2$.
    Hence the number of common zeros is even. Since $0$ is a common zero, another one exists. ◻
]

=== 3.2 The positive global complex <the-positive-global-complex>

The scalar $u$ will be the coordinate of two cohomology classes in an integral determinant line.
  One class comes from the real place and the other from Kato’s construction.
  We first construct the complex and show that its localization at $\( 2 \)$ is free of rank two in degree one.

Let $Gamma = "Gal" \( bb(Q)_oo \/ bb(Q) \)$ be the real cyclotomic $bb(Z)_2$-group and identify its generator with
  $1 + t$. For a binary family, let $psi : G_(bb(Q)) arrow.r G$ be its universal quadratic character:
  evaluation at $x$ is $chi_(h_x \/ h_0)$. Put

$ R = Lambda \[ G \] \, wide bb(T) = T ⊗_(bb(Z)_2) R \, $

with the fixed twist $chi_(h_0)$, the universal twist $psi$, and the inverse cyclotomic action.
  One may replace $G$ by the actual image of $psi$ and subsequently extend scalars.
  In a family in Theorem 5, a nonzero character trivial on that image already gives the conclusion directly.

Let $S$ contain $2 N$, the prime factors of $h_0$, and all the new primes.
  Use continuous cochains with their completed coefficient topology, and set

#[#set math.equation(numbering: n => "(3.1)")
 $ C_S^(+) \( bb(T) \) = "Cone" #scale(x: 120%, y: 120%)[\(] R Gamma \( G_(bb(Q) \, S) \, bb(T) \) arrow.r
   R Gamma \( bb(R) \, bb(T) \) #scale(x: 120%, y: 120%)[\)] \[ - 1 \] . $ <cy:positive>]

The real complex here uses ordinary cochains in nonnegative degrees.
  There are no imposed local conditions at the finite places.

#thm([Lemma 3.5.])[
  (Perfection and the real-place class).  #emph[The complex (3.1) is perfect over $R$ and computes derived
    coefficient specializations. There is a class $a in H^1 \( C_S^(+) \( bb(T) \) \)$ whose rational span is the
    real-place summand. Its integral index in that summand depends only on $E$ and the fixed real sign.]
] <cy:perfect>

#proof[
  Here are the finiteness and coefficient issues in the use of global cochains.
    For a finite coefficient quotient of $R$, continuous cochains are filtered unions of finite products of free
    coefficient modules. Refinement of finite partitions makes these modules flat;
    over an Artin local coefficient ring they are free. For finite residual coefficients,
    global cohomology is finite in each degree, and restriction to the real places is an isomorphism in degrees
    greater than two. The latter is the real-place clause of global duality.
    Thus the residual fiber has bounded amplitude and finite-dimensional cohomology.
    The same amplitude bound holds for every finite coefficient module,
    by a composition series and the cohomology long exact sequence.
  This gives a bounded finite free model as follows. Over the residue field split off the acyclic disks,
    leaving its finitely many cohomology spaces. Lift each invertible disk differential over an Artin coefficient
    quotient and cancel it. Invertibility of a lifted inverse follows from nilpotence of the maximal ideal.
    Equivalently one can perform this on a free resolution; a minimal free model cannot have an additional term
    whose reduction has zero cohomology, because its residual differential is zero.
    Hence the remaining ranks are the finite residual ranks and are bounded independently of the coefficient
    quotient. Minimal models identified by a homotopy equivalence over an Artin local ring are isomorphic.
    Lifting their changes of basis therefore makes these models compatible along $R \/ frak(m)^n$.
    Taking the inverse limit gives a bounded finite free model over $R$.
    The cochain construction with finite free coefficients and the same cancellation also proves derived base
    change. This is a fixed-$S$ argument; it does not assert uniform bounds on the number of generators as $S$ varies.
  All the characters of the family have the same real sign,
    so the action at the real place is the fixed action on $T chi_(h_0)$ extended to $R$.
    Choose a nonzero vector in its integral invariant line. Its connecting image in the fiber is $a$.
    There are no global invariant vectors in the rational elliptic representation,
    and consequently this connecting map is injective rationally. The choice and its index are fixed.
    Notice also that $H^1 \( bb(R) \, bb(T) \)$ is killed by $2$;
    thus twice any ordinary cohomology class lifts to the positive complex.
    These observations use compact global duality, including the real-place extension #cite(label("Nekovar2006"))
    Sections 5.7 and 6.9.1 of the complex formulation in #cite(label("Nekovar2006")) Theorem 6.3.4. ◻
]

#thm([Lemma 3.6.])[
  (Residual concentration).  #emph[There is an isomorphism in the derived category
$ C_S^(+) \( bb(T) \) ⊗_R cal(O) \[ G \] tilde.eq cal(O) \[ G \]^2 \[ - 1 \] . $

]
] <cy:residual>

#proof[
  The ring $cal(O) \[ G \]$ is local, with residue field $kappa$ obtained by setting $2 = 0$ and every $g = 1$.
    Thus the quadratic characters disappear. Since $E \[ 2 \]$ has a filtration with trivial factors,
    it is enough first to compute the positive residual complex for the trivial representation.
  Let $K_n$ be the real cyclotomic layer of degree $d_n = 2^n$.
    The number of finite primes of $K_n$ above a fixed $S$ is bounded with $n$:
    at $2$ there is total ramification, and the Frobenius of each fixed odd prime has nonzero image in $Gamma$.
    The $2$-ranks of the class groups of $K_n$ are also bounded.
    Indeed the cyclotomic $mu$-invariant is zero for this abelian tower #cite(label("FerreroWashington1979"));
    the structure theorem and class-group control identify their $2$-ranks, up to bounded kernels and cokernels,
    with those of the coinvariants of a finitely generated $bb(Z)_2$-module. The same bound holds for $S$-class groups.
  The signature map of units in $K_n$ is surjective. For $n gt.eq 1$,
    let $zeta$ be a primitive $2^(n + 2)$th root and put $epsilon.alt = 1 + zeta + zeta^(- 1)$.
    If $f_1 \( X \) = X^2 - 2$ and $f_(n + 1) \( X \) = f_n \( X^2 - 2 \)$,
    then $f_n$ is the minimal polynomial of $zeta + zeta^(- 1)$ and $f_n \( - 1 \) = - 1$.
    Hence $N_(K_n \/ bb(Q)) \( epsilon.alt \) = - 1$. Its signature vector has odd augmentation.
    The embeddings form a regular set for the cyclic $2$-group $"Gal" \( K_n \/ bb(Q) \)$,
    whose group algebra over $bb(F)_2$ is local. A vector with odd augmentation is a unit in this group algebra,
    so its translates span every signature. For $n = 0$ the assertion follows from the unit $- 1$.
  We now use Kummer theory to isolate the one dimension that survives after inverting $t$.
    Writing $s_n$ for the number of finite support places and $c_n$ for the $2$-rank of the $S$-class group, one has
  $ dim H^1 \( G_(K_n \, S) \, mu_2 \) = d_n + s_n + c_n . $
  The real degree-one restriction is surjective by the signature result.
    In degree two, the Kummer sequence has class-group term of dimension $c_n$ and Brauer term.
    The Brauer invariants at the real and finite support places have their single sum relation.
    Since a finite support place above $2$ is present, restriction of the Brauer term to the real places is
    surjective and has kernel of dimension $s_n - 1$. Thus the degree-two kernel of restriction to infinity is
    bounded. Restriction is an isomorphism in higher degrees by global duality.
    The degree-zero restriction is injective. The cohomology of the positive fiber is therefore bounded in every
    degree except one; its degree-one dimension is $d_n + O_S \( 1 \)$.
  Apply Lemma 8 modulo $2$. Derived specialization to the $n$th layer is specialization modulo $t^(2^n)$.
    For a perfect complex over $bb(F)_2 \[ \[ t \] \]$, the universal-coefficient exact sequence shows that a
    rank-$r$ cohomology module contributes $r 2^n + O \( 1 \)$ to these dimensions;
    the torsion terms contribute only $O \( 1 \)$. It follows that after inverting $t$ the trivial-constituent
    fiber has dimension one in degree one and vanishes in every other degree.
    Extensions preserve this concentration, so the fiber for $E \[ 2 \]$ has dimension two in degree one.
    A minimal finite free complex over the local ring $cal(O) \[ G \]$ has zero residual differentials.
    The concentration just proved forces all its terms except the rank-two term in degree one to vanish.
    No denominator is introduced by this exact freeness statement. ◻
]

=== 3.3 Fixed-form zeta classes and the integral coefficient map <fixed-form-zeta-classes-and-the-integral-coefficient-map>

We need a global class whose denominator stays bounded as the tame support grows.
  For this purpose every auxiliary trace will land in the lattice of one fixed modular form.
  Let $f$ be the fixed weight-two form of $E$, and choose its fixed integral cohomological lattice,
  with the Tate twist making its rational representation $V$.
  Kato’s classes (8.1.2)–(8.1.3), for a fixed symbol $xi in upright("SL")_2 \( bb(Z) \)$,
  exist for arbitrary $m$ and any $S$ containing the prime factors of $m N$.
  The trace in Section 8.9 is a homomorphism into the lattice

$ bb(Z)_2 \[ "Gal" \( bb(Q) \( mu_m \) \/ bb(Q) \) \] ⊗ V_(2 \, bb(Z)_2) \( Y_1 \( N \) \) \( 1 \) . $

Section 8.11 then projects to the lattice of the fixed form. Proposition 8.12 supplies its norm relations.
  These assertions hold at the coefficient prime $2$ #cite(label("Kato2004")) Sections 5.1, 8.1, 8.9–8.12.
  In particular, the auxiliary modular-curve level used to define a trace does not become the level of the
  projected newform.

Choose an isomorphism of the resulting fixed rational representation with $V$.
  A single power $2^(c_E)$ sends its integral lattice into $T$.
  Choose fixed symbols with nonzero projections on the required period lines;
  their existence and the construction with both signs are made explicit in #cite(label("Kato2004")) Sections 13.6
  and 13.9. Taking a fixed linear combination, if needed, costs another fixed denominator.

Here is the coefficient map in this application. Let $m$ be odd and divisible by the conductors of all the tame
  characters in the family, including the odd part of $chi_(h_0)$.
  At a sufficiently large cyclotomic level write $A_(m \, n) = "Gal" \( bb(Q) \( mu_(m 2^n) \) \/ bb(Q) \)$.
  Shapiro identifies the cohomology of the cyclotomic field with global cohomology with induced group-ring
  coefficients. Push the class along the ring homomorphism

#[#set math.equation(numbering: n => "(3.2)")
 $ bb(Z)_2 \[ A_(m \, n) \] arrow.r bb(Z)_2 \[ Gamma_n times G \] \,
   wide \[ sigma \] mapsto chi_(h_0) \( sigma \) \[ sigma \|_(Gamma_n) \] \[ psi \( sigma \) \] .
   $ <cy:coefficient-map>]

Use inverse actions on both sides if this is required by the chosen Shapiro convention.
  This is a homomorphism of integral coefficient modules and acts on actual cohomology classes.
  It requires neither division by $\| G \|$ nor surjectivity of a cohomological specialization map.
  The prime $2$ belongs to the fixed omitted support, so Proposition 8.12 gives exact norm compatibility as $n$
  increases. The pushed classes therefore give an integral smoothed Iwasawa class with coefficients in $bb(T)$,
  up to the single fixed power $2^(c_E)$.

We next remove smoothing. In weight two and with $r = r' = 1$, its factors are

#[#set math.equation(numbering: n => "(3.3)")
 $ \( c^2 - c sigma_c \) \( d^2 - d sigma_d \) . $ <cy:smoothing>]

This is the specialization of #cite(label("Kato2004")) Theorem 6.6 and (4.2.4).
  Choose a fixed $e gt.eq max \( 2 \, v_2 \( N \) \)$, increasing it to accommodate the finitely many fixed symbol
  levels. The Chinese remainder theorem permits $c \, d > 1$, prime to $6 N m$, such that

$ c \, d equiv 1 med \( mod med 3 N_(upright("odd")) m \) \, wide c \, d equiv 1 + 2^e med \( mod med 2^(e + 1) \) . $

Their tame actions in (3.2) are trivial. If $sigma_c$ acts in $Gamma$ as $\( 1 + t \)^(kappa \( c \))$,
  then $v_2 \( kappa \( c \) \) = e - 2$. Modulo the maximal ideal of $cal(O) \[ G \]$ its smoothing factor is

$ 1 - \( 1 + t \)^(kappa \( c \)) eq.not 0 quad upright("in ") bb(F)_2 \( \( t \) \) . $

It is therefore a unit in $cal(O) \[ G \]$. Its central value is $c \( c - 1 \)$, of valuation exactly $e$.
  The same statements hold for $d$ and for inverse-translate conventions.
  Thus unsmoothing introduces neither a $2$-adic denominator at $\( 2 \)$ nor a growing central denominator.
  The integers $c \, d$ vary with $m$; the congruences fix the needed valuations,
  not their exact cyclotomic group elements.

Denote the resulting rational ordinary class by $z_S^(\( 0 \))$.
  Theorem 9.7 of #cite(label("Kato2004")) applies to $k = 2 \, r = r' = 1$.
  In the character constituent $x$, its central reciprocity formula reads

#[#set math.equation(numbering: n => "(3.4)")
 $ v_2 #scale(x: 120%, y: 120%)[\(] exp_2^(*) z_(S \, x)^(\( 0 \)) \( 0 \) #scale(x: 120%, y: 120%)[\)] =
   v_2 \( cal(L) \( h_x \) \) + sum_(q in Q thin \, med q divides.not h_x) v_2 #scale(x: 120%, y: 120%)[\(] \#
   E^(\( h_x \)) \( bb(F)_q \) #scale(x: 120%, y: 120%)[\)] + O_E \( 1 \) $ <cy:reciprocity>]

when the value is nonzero, and a zero central value gives a zero dual exponential.
  Fixed omitted primes are included in the error. To check the normalization,
  the character sum in (3.2) is the unnormalized sum, as in Kato’s trace.
  Its tame quadratic Gauss sum supplies $sqrt(\| h_x \|)$ up to a root of unity.
  Tame conductors and their Gauss sums are $2$-adic units. The period vector is the fixed symbol vector of $f$.
  More explicitly, in the required sign line write the period represented by $delta \( f \, 1 \, xi \)^plus.minus$
  as $c_xi^plus.minus Omega_E^plus.minus$. The nonzero scalar $c_xi^plus.minus$ is fixed:
  the character-sum formula of #cite(label("Kato2004")) Theorem 6.6 uses this same
  $delta \( f \, 1 \, xi \)^plus.minus$ for every tame character.
  The tame character enters through its $L$-value and Gauss sum, not through a newly chosen period vector.
  The comparison with the minimal differential of $E^(\( h_x \))$ at $2$ has bounded valuation,
  because there are only finitely many local twisting classes there. At a good unused prime the omitted factor is

$ 1 - frac(a_q \( E \) chi_(h_x) \( "Fr"_q \), q) + 1 / q = frac(\# E^(\( h_x \)) \( bb(F)_q \), q) \; $

at a good ramified prime the local $L$-factor is $1$. These account for every varying factor in (3.4).

=== 3.4 Rational divisibility and the local Euler corrections <rational-divisibility-and-the-local-euler-corrections>

The fixed-form construction controls the denominator at $\( 2 \)$. We now prove the complementary assertion:
  the determinant coordinate has no pole at any other height-one prime.
  This step is characterwise and uses only rational divisibility. Write $A = Lambda \[ 1 \/ 2 \]$.
  Theorem 12.5(3) of #cite(label("Kato2004")) is a height-one divisibility over $A$;
  its possible local $H^2$ correction comes from Galois cohomology over $bb(Q)_2$.
  The global groups there use $j_(*)$ outside that prime. The stronger integral assertion 12.5(4) is not used.
  In the non-CM case, the large-image input in Kato’s proof follows from the open image theorem
  #cite(label("Serre1972")); see #cite(label("Kato2004")) Remark 12.8, (12.8.2), Theorem 13.4(v),
  and Section 13.13. This is not an additional residual-image hypothesis in Theorem 12.5(3).
  For CM the required rational statement at every prime, including $2$,
  is supplied by #cite(label("BurungaleTian2026")) Theorem 2.6 and Remark 2.7.
  Neither statement asserts uniform integrality in a quadratic group ring.

Fix a character constituent $h$ and write $V_h = V chi_h$.
  Let $C_(j_(*))$ be the rational Iwasawa complex in Kato’s formulation and $C_S$ the rational full global
  complex. At an odd prime put

$ W_q = H^1 \( I_q \, V_h \) . $

The localization triangle has local cone

#[#set math.equation(numbering: n => "(3.5)")
 $ Q_q = R Gamma #scale(x: 120%, y: 120%)[\(] G_(bb(F)_q) \,
   W_q ⊗ A \( Gamma^iota \) #scale(x: 120%, y: 120%)[\)] \[ - 1 \] =
   [W_q ⊗ A arrow.r^(med 1 - gamma_q "Fr"_(W_q) med) W_q ⊗ A] $ <cy:local-block>]

in degrees one and two. Here $gamma_q$ denotes the scalar cyclotomic Frobenius in the chosen convention.
  Its exponent is nonzero. Consequently $D_q = det \( 1 - gamma_q "Fr"_(W_q) \)$ is a nonzero element of $A$,
  and the map in (3.5) is injective. This remains true after localization at a height-one prime dividing $D_q$:
  localization does not mean reduction modulo that prime. Thus

$ H^1 \( Q_q \) = 0 \, wide "length"_(A_(frak(p))) H^2 \( Q_q \)_(frak(p)) = v_(frak(p)) \( D_q \) . $

The long exact sequence gives

#[#set math.equation(numbering: n => "(3.6)")
 $ H^1 \( C_(j_(*)) \) tilde.eq H^1 \( C_S \) \,\
0 arrow.r H^2 \( C_(j_(*)) \) arrow.r H^2 \( C_S \) arrow.r xor.big_(q in S \\ { 2 }) H^2 \( Q_q \) arrow.r
  H^3 \( C_(j_(*)) \) . $ <cy:local-sequence>]

In particular, the length of $H^2 \( C_S \)$ is at most the length of $H^2 \( C_(j_(*)) \)$ plus the sum of the
  local lengths. No assertion that $H^3 \( C_(j_(*)) \)$ vanishes is required here.

At a good unused prime, $W_q = V_h \( - 1 \)$, so, on including the quadratic Frobenius sign in $Z$,

#[#set math.equation(numbering: n => "(3.7)")
 $ D_q = P_q \( Z \) \, wide P_q \( Z \) = 1 - frac(a_q \( E \), q) Z + 1 / q Z^2 . $ <cy:good-euler>]

At a good active prime, inertia acts by $- 1$ on $V_h$. Its rational inertia cohomology is zero, so $W_q =
  0$ and $D_q = 1$.

At fixed bad primes the general expression is $H^1 \( I_q \, V_h \)$ in (3.5).
  Replacing it indiscriminately by $V_h^(I_q) \( - 1 \)$ would be incorrect.
  For example, at split multiplicative reduction,

$ V_h^(I_q) = bb(Q)_2 \( 1 \) \, wide H^1 \( I_q \, V_h \) = bb(Q)_2 \( - 1 \) \, $

and the correct determinant is $1 - gamma_q \/ q$, with nonzero central value.
  The incorrect replacement would give $1 - gamma_q$. In general $D_q \( 0 \) eq.not
  0$ follows from local duality: $H^2 \( bb(Q)_q \, V_h \) = H^0 \( bb(Q)_q \, V_h \)^(*) = 0$,
  since elliptic torsion over a local field is finite. The fixed bad-prime corrections therefore have nonzero
  central values for every reduction type.

Let $z_(upright("BK") \, h)$ denote a generator of the rational Kato zeta line in the real cyclotomic component
  with the fixed sign. Compare it with the fixed-form class only after taking the character constituent.
  In the chosen Euler convention the comparison is

#[#set math.equation(numbering: n => "(3.8)")
 $ z_(S \, h)^(\( 0 \)) = c_h epsilon.alt_h \( t \) E_h^(upright("fix")) \( t \)
   product_(q in Q thin \, med q divides.not h) P_q #scale(x: 120%, y: 120%)[\(] chi_h \( "Fr"_q \) gamma_q
   #scale(x: 120%, y: 120%)[\)] z_(upright("BK") \, h) \, $ <cy:rational-comparison>]

where $c_h in bb(Q)_2^times$ and $epsilon.alt_h$ is a group-like unit of $A$.
  The factor $E_h^(upright("fix"))$ consists of the omitted local $L$-polynomials away from $2$ at primes of $N$
  and the fixed auxiliary support. It ranges over a finite collection,
  because the local twisting classes there are fixed. The primes of $h_0$ are good ramified primes and
  contribute $1$, regardless of their number. These factors have nonzero central values:
  they are good-prime point counts divided by the prime, multiplicative factors $1 minus.plus 1 \/ q$, or $1$.
  They are not being identified with the local cohomology determinants $D_q$ at bad primes;
  any discrepancy there will be cleared by a fixed multiplier below.

Here is the derivation of (3.8). Both global Iwasawa $H^1$ modules have rank one.
  The reciprocity formulas #cite(label("Kato2004")) Theorems 6.6, 9.7, 12.5(1),
  and Lemma 13.10(2) compare the same fixed period vector and the relevant imprimitive $L$-values.
  Their quotient supplies the displayed omitted Euler factors; a good ramified prime contributes $1$.
  Coprime Gauss-sum factorization and the fixed period comparison supply $c_h$ and $epsilon.alt_h$;
  restricting conductor exponents to either fixed parity removes any factor $chi_h \( 2 \)^n$.
  Infinitely many of these tests have nonzero central value by cyclotomic nonvanishing,
  as used in #cite(label("Kato2004")) Theorem 13.5(2). After clearing the finitely many denominators of the scalar
  ratio, the difference is a power series vanishing at infinitely many finite-order characters.
  Weierstrass preparation forces that difference to be zero.
  This proves the generic comparison without identifying the integral lattices of varying twisted newforms.
  The scalar $c_h$ need not have a uniformly bounded $2$-valuation:
  every such scalar is a unit of $A$ and does not affect height-one divisibility over $A$.
  The uniform integral and central bounds instead concern the actual fixed-form class and the fixed period vector
  in (3.4).

Equations (3.6)–(3.7) now show exactly how the imprimitive factors enter divisibility.
  At any height-one $frak(p)$ of $A$, enlarging the global complex increases its degree-two length by at most
  $sum_q v_(frak(p)) \( D_q \)$, whereas multiplying the rank-one zeta generator by $product_q
  D_q$ adds exactly that quantity to its index. To cover Kato’s local correction at $2$,
  multiply the class also by a fixed element $F_2 in Lambda$ divisible over $A$ by the characteristic ideal of the
  relevant local $H_(upright("Iw"))^2$. It may be chosen with $F_2 \( 0 \) eq.not 0$. Indeed derived local control gives

$ H_(upright("Iw"))^2 \( bb(Q)_2 \, T chi_h \)_Gamma ⊗ bb(Q)_2 = H^2 \( bb(Q)_2 \, V_h \) = 0 \, $

so the characteristic ideal has no factor $t$. Local twisting classes at $2$ are fixed,
  and one element covers their finite set.

Likewise any additional fixed Euler factors in the rational comparison can be cleared by a fixed product with
  nonzero central value, using the actual blocks (3.5). Denote the total fixed multiplier by $F_E$.
  Multiplying by it only changes the fixed constants in (3.4) and the integrality bound.
  Set $z_S = F_E z_S^(\( 0 \))$. For this corrected class we have at every height-one $frak(p)$ of $A$

#[#set math.equation(numbering: n => "(3.9)")
 $ "length"_(A_(frak(p))) H^2 \( C_S \)_(frak(p)) lt.eq "length"_(A_(frak(p))) #scale(x: 120%, y: 120%)[\(]
   H^1 \( C_S \) \/ A z_(S \, h) #scale(x: 120%, y: 120%)[\)]_(frak(p)) . $ <cy:divisibility>]

We finish by checking that the chosen Euler convention can be imposed integrally before character evaluation.
  If the original coefficient map uses inverse Frobenius, the varying unused factors change as follows.
  In $cal(O) \[ G \]$, both $P_q \( Z \)$ and $Z^2 P_q \( Z^(- 1) \)$ are units:
  their reductions are nonzero polynomials evaluated at the nonconstant cyclotomic Frobenius. The identity

$ P_q \( Z \) - Z^2 P_q \( Z^(- 1) \) = frac(q - 1, q) \( 1 - Z^2 \) $

shows that their ratio $r_q$ is $1$ modulo $2$. If $g_q$ is the universal inertia element, then

#[#set math.equation(numbering: n => "(3.10)")
 $ U_q = 1 + frac(r_q - 1, 2) \( 1 + g_q \) in cal(O) \[ G \]^times $ <cy:euler-convention>]

is integral. At an active character it is $1$; at an unused character it is $r_q$.
  Its unused central value is $1$, since $Z = plus.minus 1$ there.
  Thus inverse Frobenius conventions can be reconciled before character evaluation,
  without a denominator for each prime. Products of these units have the same property.
  The resulting rational character coordinates have the Euler convention in (3.9).
  We use this convention for $z_S$ from now on; these units alter neither its uniform integrality bound nor its
  central reciprocity values.

=== 3.5 The determinant and its central specialization <the-determinant-and-its-central-specialization>

Choose a basis $upright(bold(e))$ of the invertible $R$-module $det_R^(- 1) C_S^(+) \( bb(T) \)$; $R$ is local,
  so such a basis exists. Lift $2 z_S$ to positive cohomology and take its wedge with $a$.
  The factor $2$ is fixed, and two lifts differ by a real-place class, which does not change this wedge.
  In generic cohomology, the inverse determinant identifies with the exterior square of the rank-two degree-one
  space. Define its scalar coordinate $u$ by

$ a and accent(2 z_S, ̃) = u upright(bold(e)) . $

Here $z_S$ already includes the fixed multiplier $F_E$ above.
  The real-place summand introduces no height-one torsion over $A$.
  Thus (3.9) says that $u_x$ has no pole at any height-one prime of $Lambda$ except possibly $\( 2 \)$.
  Since $Lambda$ is normal,

#[#set math.equation(numbering: n => "(3.11)")
 $ u_x in Lambda \[ 1 \/ 2 \] wide upright("for every ") x . $ <cy:rational-membership>]

On the other hand, the fixed integral trace, (3.2), unsmoothing over $cal(O) \[ G \]$, and Lemma 9 give

$ 2^(C_(upright("int"))) u in cal(O) \[ G \] $

with $C_(upright("int"))$ independent of $S$, $h_0$, $G$, and $b$.
  The determinant identification in a free complex introduces no further index.
  Applying Lemma 6 yields the crucial uniform statement

#[#set math.equation(numbering: n => "(3.12)")
 $ 2^(C_(upright("int"))) u in Lambda \[ G \] . $ <cy:uniform-integrality>]

#thm([Proposition 3.7.])[
  (Central determinant formula).  #emph[There is a constant $C_(upright("loc"))$,
    depending only on the fixed curve and local classes, with the following property.
    If $s_2 \( E^(\( h_x \)) \) = 0$, then $u_x \( 0 \) = 0$ when $L \( E^(\( h_x \)) \, 1 \) = 0$. Otherwise
#[#set math.equation(numbering: n => "(3.13)")
 $ \| v_2 \( u_x \( 0 \) \) - D \( h_x \) #scale(x: 120%, y: 120%)[\|] lt.eq
   C_(upright("loc")) . $ <cy:central-formula>]

 The rational positive complex at $t = 0$ has cohomology only in degree one, of dimension two,
   so these are specializations of the same determinant.]
] <cy:central>

#proof[
  Abbreviate $T_h = T_2 E^(\( h_x \))$ and $A_h = E^(\( h_x \)) \[ 2^oo \]$. Use the integral Kummer subgroup
  $ K_v = "im" #scale(x: 120%, y: 120%)[\(] E^(\( h_x \)) \( bb(Q)_v \)_2^and arrow.r
    H^1 \( bb(Q)_v \, T_h \) #scale(x: 120%, y: 120%)[\)] $
  at every finite place. For $v eq.not 2$ it is all of $H^1 \( bb(Q)_v \, T_h \)$.
    One way to see this integrally is the inverse-limit Kummer exact sequence:
    its quotient is $T_2 H^1 \( bb(Q)_v \, E^(\( h_x \)) \)$,
    which is zero because local Tate duality identifies the $2$-primary local Weil–Châtelet group with the dual of
    the finite $2$-completion of the local point group. At $2$ the quotient
  $ L_2 = H^1 \( bb(Q)_2 \, T_h \) \/ K_2 $
  is a free rank-one $bb(Z)_2$-module. The same Kummer sequence and local Tate duality identify it with the
    $bb(Z)_2$-dual of the free part of $E^(\( h_x \)) \( bb(Q)_2 \)_2^and$.
  The dual exponential identifies $L_2 ⊗ bb(Q)_2$ with the one-dimensional de Rham target.
    Integrally its index depends only on the local curve and the chosen differential.
    This follows from the compatibility of the Kummer map and local Tate duality with the formal elliptic
    logarithm: on a sufficiently small open formal subgroup that logarithm is an isomorphism,
    and its adjoint is the dual exponential. Every elliptic curve over $bb(Q)_2$ has such a formal subgroup,
    irrespective of reduction type. Since only finitely many local twists occur, the indices are uniformly bounded.
  The assumption on the Selmer corank implies that the compact finite Selmer group is torsion and that the
    discrete finite Selmer group has length $s \( h_x \)$. Rational Poitou–Tate consequently identifies ordinary
    global $H^1$ with the singular line at $2$, and gives ordinary global $H^2 = 0$ rationally.
    Adding the real invariant line gives the claimed dimension two in degree one.
    This equals the generic rank, so derived base change of the perfect complex specializes its determinant
    without a change of rational cohomological rank.
  The integral calculation explains the two subtractions in $D \( h_x \)$.
    The index of global localization will cancel; the remaining local terms will cancel the unused Euler factors
    and contribute $2 w \( h_x \)$ at the active primes. Let $J$ be the image of the free part of global
    $H^1 \( G_(bb(Q) \, S) \, T_h \)$ in $L_2$, and put $i = "length" \( L_2 \/ J \)$.
    The compact/discrete Poitou–Tate sequence for the mutually orthogonal Kummer conditions contains
  $ 0 arrow.r L_2 \/ J & arrow.r "Sel"_(2^oo) \( E^(\( h_x \)) \/ bb(Q) \)^or arrow.r H^2 \( G_(bb(Q) \, S) \, T_h \)\
 & arrow.r xor.big_(q in S) H^2 \( bb(Q)_q \, T_h \) arrow.r H^0 \( bb(Q) \, A_h \)^or arrow.r 0 \, $
  with the usual real Tate-cohomology terms inserted. Those terms are killed by $2$ and have dimensions bounded by
    the fixed dimension of $T$. Taking lengths and using local duality gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ "length" H^2 \( G_(bb(Q) \, S) \, T_h \) = s \( h_x \) - i + sum_(q in S) "length" H^0 \( bb(Q)_q \, A_h \) +
     O_E \( 1 \) . $ <cy:pt-length>]
  This sequence is the cohomology consequence of integral Poitou–Tate duality with the finite local conditions;
    see #cite(label("Nekovar2006")) Theorem 6.3.4 and Section 6.9.1,
    with the real Tate-cochain convention of #cite(label("Nekovar2006")) Section 5.7.1.6.
    No unramified condition replaces the Kummer condition at a bad prime.
    Global torsion is bounded by its injection into $E^(\( h_x \)) \( bb(Q)_2 \) \[ 2^oo \]$,
    whose order is bounded by the fixed local twisting classes.
    The finite terms at $2$ and at fixed bad primes are bounded for the same reason.
    Passing between ordinary and positive cohomology changes only these bounded real and global torsion terms.
  Suppose first that the central value is nonzero. The coordinate of $z_(S \, x) \( 0 \)$ in the free global line
    has valuation
  $ v_2 \( exp_2^(*) z_(S \, x) \( 0 \) \) - i + O_E \( 1 \) . $
  For the inverse determinant, torsion in degree two subtracts its length and torsion in degree one adds its
    length. This sign can be checked on the complex $\[ bb(Z)_2 arrow.r^(2^a) bb(Z)_2 \]$ in degrees one and two:
    its inverse determinant lattice maps to $2^a bb(Z)_2$ in the rational determinant.
    A vector’s coordinate thus loses $a$. Using (3.14), the two appearances of $i$ cancel, leaving
  $ v_2 \( u_x \( 0 \) \) = v_2 \( exp_2^(*) z_(S \, x) \( 0 \) \) - s \( h_x \) -
    sum_(q in S) "length" H^0 \( bb(Q)_q \, A_h \) + O_E \( 1 \) . $
  At an active good prime, quadratic inertia acts by $- 1$ on the Tate module.
    Its invariants on $A_h$ are therefore exactly $E \[ 2 \]$, and taking Frobenius invariants gives length $t_q$.
    At an unused good prime, reduction identifies the local $2$-primary torsion with
    $E^(\( h_x \)) \( bb(F)_q \) \[ 2^oo \]$, of length $v_2 \( \# E^(\( h_x \)) \( bb(F)_q \) \)$.
    These unused terms cancel exactly those in (3.4). The active terms, including the primes of $h_0$,
    sum to $2 w \( h_x \)$. All other terms have already been bounded independently of the growing support.
    This proves (3.13).
  If the central value is zero, reciprocity makes the dual exponential zero.
    The rational ordinary specialization then satisfies the finite condition at $2$,
    and it satisfies the finite conditions elsewhere automatically.
    It lies in the rational finite Selmer group, which is zero.
    Its wedge with the real-place class is therefore zero. The constant-rank determinant specialization proves
    $u_x \( 0 \) = 0$. ◻
]

=== 3.6 Proofs of the interpolation theorems <proofs-of-the-interpolation-theorems>

#proof[
  Use the preceding construction for the single discriminant $h$.
    The forward analytic rank-zero theorem gives $s_2 \( E^(\( h \)) \) =
    0$ and finiteness of its Shafarevich–Tate group. By (3.12), $v_2 \( u_h \( 0 \) \) gt.eq -
    C_(upright("int"))$. Proposition 10 then gives $D \( h \) gt.eq - C_(upright("int")) - C_(upright("loc"))$.
    Every constant in the construction came from the fixed form, a fixed real period line,
    or the finite set of local twists at $2 N$. ◻
]

#proof[
  At every nonzero address the forward rank-zero theorem gives Selmer corank zero. Proposition 10 gives
  $ v_2 \( u_x \( 0 \) \) lt.eq B + C_(upright("loc")) wide \( x eq.not 0 \) . $
  Choose an integer $M$ such that $M - C_(upright("int")) > B + C_(upright("loc"))$.
    By (3.12), the constant coefficient of $2^(C_(upright("int"))) u$ belongs to $bb(Z)_2 \[ G \]$.
    For sufficiently large $b$, Lemma 7 gives an $x eq.not 0$ such that
  $ v_2 \( u_x \( 0 \) - u_0 \( 0 \) \) gt.eq M - C_(upright("int")) . $
  It follows that $u_0 \( 0 \)$ is nonzero and $v_2 \( u_0 \( 0 \) \) lt.eq B + C_(upright("loc"))$:
    either failure would contradict the displayed upper bound at this $x$.
    The corank-zero hypothesis at the base and Proposition 10 imply $L \( E^(\( h_0 \)) \, 1 \) eq.not 0$ and
  $ D \( h_0 \) lt.eq B + 2 C_(upright("loc")) . $
  Taking $C_E$ large enough proves both theorems with a common constant.
    In particular no loss proportional to $b$, $\| Q \|$, or the prime count of $h_0$ has entered this argument. ◻
]

== 4 Ring-class interpolation and integral deformations <rl:section>

The ring-class argument has two outputs: a lower bound for the index of a Heegner point at a known simple zero,
  and a transfer of nonvanishing to an unknown base. The first is uniform as the companion field varies with
  bounded ramification; the second fixes that field before a binary family grows.
  We state both outputs before constructing their cochain and evaluation maps.
  Their determinant proofs occupy Section 5.

Fix $E \/ upright(bold(Q))$ of conductor $N$, and write $T = T_2 E$ and $Lambda =
  upright(bold(Z))_2 \[ \[ t \] \]$. The imaginary quadratic field $K =
  upright(bold(Q)) \( sqrt(k) \)$ satisfies the split Heegner hypothesis at $2 N$.
  We omit the two fields with extra units and, when $E$ has complex multiplication, its CM field.
  Let $h$ be a product of distinct signed good odd primes, all split in $K$, with $\( h \, k \) = 1$; $h =
  1$ is allowed. The primes dividing $h$ are called the #emph[active conductor primes].
  The character $chi = chi_h$ is the corresponding quadratic character over $upright(bold(Q))$.

Fix a modular parametrization $pi : X_0 \( N \) arrow.r E$ with $pi \( oo \) = 0$.
  Write $H_c$ for the ring-class field of $K$ of conductor $c$,
  and $y_c$ for the image under $pi$ of a conductor-$c$ CM point, with fixed CM orientations.
  The restriction of $chi_h$ to $G_K$ factors through $"Gal" \( H_(\| h \|) \/ K \)$.
  The primitive weighted Heegner sum is

$ P_h = sum_(sigma in "Gal" \( H_(\| h \|) \/ K \)) chi_h \( sigma \) thin sigma \( y_(\| h \|) \) . $

Through the quadratic-twist identification, it is a point of $E^(\( h \)) \( K \)$.
  When the product of $L \( E^(\( h \)) \, s \)$ and $L \( E^(\( h k \)) \, s \)$ has a simple zero,
  the Heegner-point theorem makes $P_h$ nontorsion and $E^(\( h \)) \( K \)$ has rank one.
  Let $j_h$ be the $2$-adic index valuation of $P_h$ in the free rank-one lattice $E^(\( h \)) \( K \)_2^and \/
  upright("torsion")$. The quantities $w \( h \)$, $s \( h \)$,
  and $s \( h k \)$ have the meanings fixed in Section 2; the two Shafarevich–Tate lengths are finite in this
  simple-zero case.

#thm([Corollary 4.1.])[
  (Ring-class lower bound).  #emph[Every simple-zero ring instance in the stated data satisfies
#[#set math.equation(numbering: n => "(4.1)")
 $ 2 j_h gt.eq 4 w \( h \) + s \( h \) + s \( h k \) - C \( E \, A \) \, wide omega \( k \) lt.eq
   A . $ <rd:ring-lower-equation>]

]
] <rd:ring-lower>

For the second output, fix $K$ and the base $h_0 = 1$. A binary family has the form

#[#set math.equation(numbering: n => "(4.2)")
 $ h_x = product_(q in Q) \( q^(*) \)^(lambda_q \( x \)) \, wide lambda_q : bb(F)_2^b arrow.r
   bb(F)_2 upright(" linear") \, quad x in bb(F)_2^b . $ <rd:binary-data>]

All primes in $Q$ are good, odd, disjoint from the fixed support, and split in $K$.
  All vertices have the same local squareclasses at $2 N$ and the same required real sign.

#thm([Theorem 4.2.])[
  (The fixed-$K$ missing-vertex implication).  #emph[Fix the ring data $E \, K$, with
#[#set math.equation(numbering: n => "(4.3)")
 $ "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ K \) = 1 . $ <rd:base-corank>]

 Suppose binary families (4.2) exist for arbitrarily large $b$,
   and for every nonzero $x$ the product $L \( E^(\( h_x \)) \, s \) L \( E^(\( h_x k \)) \, s \)$ has a simple zero and
#[#set math.equation(numbering: n => "(4.4)")
 $ 2 j_(h_x) - 4 w \( h_x \) - s \( h_x \) - s \( h_x k \) lt.eq B $ <rd:nonzero-bound>]

 with $B$ independent of the family. Then
#[#set math.equation(numbering: n => "(4.5)")
 $ "ord"_(s = 1) #scale(x: 120%, y: 120%)[\(] L \( E \, s \) L \( E^(\( k \)) \, s \)
   #scale(x: 120%, y: 120%)[\)] = 1 . $ <rd:missing-conclusion>]

 This implication does not assume Mordell–Weil rank one or finite Shafarevich–Tate group at the base.]
] <rd:missing-vertex>

To prove these assertions, we compare the Heegner-point indices with integral Selmer determinants.
  The present section constructs the limiting complexes and the maps needed to test their classes at new primes.
  Taking limits of differential matrices alone would not suffice:
  a cycle in the limit may lift only to approximate cycles at finite precision,
  and its localization must still be evaluation of a crossed cocycle.

There are two passages to a limit. In the inner construction $K$ and a finite active support are fixed while an
  auxiliary scalar-conductor prime $r_i$ and the coefficient precision vary.
  Additional inert #emph[derivative primes] will realize evaluations and switch local conditions.
  In the outer construction $K$ and the active support may vary,
  but $omega \( k \)$ and the number of retained derivative primes are bounded.
  This second passage gives the uniform lower bound; the final fixed-$K$ transfer instead uses the bounded
  clearing factor of Proposition 38.

We use

$ A_i = \( upright(bold(Z)) \/ 2^i upright(bold(Z)) \) \[ t \] \/ \( t^i \) . $

The same constructions work over $A_i \[ G \]$ and $Lambda \[ G \]$,
  where $G$ is a fixed finite elementary abelian $2$-group and the additional character has values in $G$.
  Statements uniform in the number of generators of $G$ will be identified separately;
  finite-diagram compactness by itself is a statement for fixed $G$.

=== 4.1 Free models with maps to the original cochains <free-models-with-maps-to-the-original-cochains>

#thm([Lemma 4.3.])[
  (Finite Artin models).  #emph[Let $\( A \, frak(m) \, k \)$ be an Artin local ring,
    and let $D$ be a complex of flat $A$-modules. Suppose $H^(*) \( D ⊗_A k \)$ is finite dimensional and
    supported in $\[ a \, b \]$. There is a bounded finite free complex $C$, with
$ "rank"_A C^j = dim_k H^j \( D ⊗_A k \) \, $

 and a strong deformation retraction
$ i : C arrow.r D \, wide p : D arrow.r C \, wide p i = 1 \, wide 1 - i p = d h + h d . $

 Thus maps to the original complex, as well as maps between finite models, are available.
   Any fixed finite collection of chain maps, homotopies, triangles,
   and perfect pairings can be transported to these models.]
] <rl:finite-model>

#proof[
  Flat modules over an Artin local ring are free, including modules of infinite rank.
    Here is a useful version of the argument. Lift a basis of $M \/ frak(m) M$ to a flat module $M$,
    and map the corresponding free module to $M$. Its cokernel is zero because $frak(m)$ is nilpotent.
    Flatness shows that the kernel has zero reduction, and nilpotence again makes the kernel zero.
  Split the residual complex as its cohomology, with zero differential, plus contractible two-term disks.
    Lift all the graded bases. These lifts are graded isomorphisms:
    an inverse modulo $frak(m)$ lifts to an inverse by a finite geometric series.
    Let $d_0$ be the lifted disk differential and write $d = d_0 + epsilon.alt$.
    All coefficients of $epsilon.alt$ belong to $frak(m)$. For the disk contraction $\( i_0 \, p_0 \, h_0 \)$,
    arrange $h_0^2 = h_0 i_0 = p_0 h_0 = 0$ and $1 - i_0 p_0 = d_0 h_0 + h_0 d_0$.
    The operators $1 + h_0 epsilon.alt$ and $1 + epsilon.alt h_0$ have finite geometric inverses.
    The elementary perturbation identities give the differential
  $ d_C = p_0 epsilon.alt \( 1 + h_0 epsilon.alt \)^(- 1) i_0 $
  on the lifted residual cohomology, and give
  $ i = \( 1 + h_0 epsilon.alt \)^(- 1) i_0 \, quad p = p_0 \( 1 + epsilon.alt h_0 \)^(- 1) \, quad h =
    h_0 \( 1 + epsilon.alt h_0 \)^(- 1) . $
  Substitution, using $\( d_0 + epsilon.alt \)^2 = 0$, proves the asserted contraction identities.
    These calculations are valid for infinite disk sums: each operator is a module homomorphism and every
    geometric series terminates at the nilpotence exponent of $frak(m)$.
  For a map between original complexes use $p' f i$; insert the contraction homotopies when composing maps.
    A quasi-isomorphism between bounded free complexes has a contractible cone and hence a homotopy inverse.
    This gives the stated finite-diagram assertion, including the homotopies expressing triangles and perfect duality. ◻
]

For a profinite group and a finite free coefficient module over $A$, continuous inhomogeneous cochains are flat:
  locally constant functions are the filtered union of the modules of functions on finite clopen partitions,
  and these modules are finite free. Their reduction is the cochain complex with reduced coefficients.
  The same observations apply to restrictions, mapping cones, and local conditions given by finite free complexes.
  In the applications below the groups are Galois groups of totally imaginary number fields or nonarchimedean
  local fields. Their $2$-cohomological dimension and the usual finiteness theorems give the bounded residual
  cohomology required in Lemma 13.

#thm([Lemma 4.4.])[
  (Limits of specified diagrams).  #emph[Suppose diagrams over $A_i$, or over $A_i \[ G \]$,
    have uniformly bounded cohomological amplitudes and graded free ranks,
    and include the chain homotopies and inverses for every asserted identity or equivalence.
    After taking a cofinal subsequence, or a nonprincipal ultrafilter limit,
    their matrices define the same diagram of perfect complexes over $Lambda$, or $Lambda \[ G \]$.]
  #emph[Moreover, the contractions into the original cochains may be retained for the evaluation construction in
    Lemma 19. Adding finitely many new objects or maps does not require changing already chosen models for the old
    objects.]
] <rl:finite-limits>

#proof[
  There are finitely many possible graded ranks. Fix them on an ultrafilter-large set.
    At a fixed precision $j$, all matrix entries belong to the finite ring $A_j$ (or $A_j \[ G \]$),
    so have unique ultrafilter limits. These limits are compatible as $j$ varies.
    Matrix identities, including the homotopy-inverse identities,
    are finite polynomial identities and pass to the limit. New models and maps may be mapped to old models by
    their already fixed contractions. Passing to any slower cofinal precision has the same old limits.
    For the all-sequence evaluation statements below, fix this ultrafilter once and for all,
    and keep the original contraction at every stage. Later arithmetic diagrams must extend these same stages.
    Restriction to an ultrafilter-large set and passage to slower cofinal coefficient precision preserve every old
    evaluation on every old group sequence. An arbitrary later subsequence or a different ultrafilter is not
    allowed in this assertion. Notice that this argument preserves specified arithmetic maps;
    it does not create an arithmetic map from a formal description of its expected properties. ◻
]

===== 4.1.1 Target-side data. <target-side-data.>

The ring-class fields used to construct a class need not have bounded degree.
  Their cochain complexes are not objects of the limiting diagram.
  At each finite stage, first perform descent, Shapiro transfer, the coefficient weighting, and every coset sum.
  These operations give cochains on the fixed target field $K$, with their local lifts.
  Only then apply Lemma 13 to the target global and local complexes and their Selmer cones.

Here is the required inner rank bound. Fix $K$, the active support, a finite set of derivative slots, and,
  when used, $G$. The permitted ramification set $S_i$ consists of this fixed support and a bounded number of
  moving primes. Modulo the maximal ideal of $A_i$ or $A_i \[ G \]$,
  all scalar characters are trivial and the representation is $E \[ 2 \]$.
  Put $F = K \( E \[ 2 \] \)$, a fixed field. Kummer theory bounds $H^1 \( G_(F \, S_i) \, upright(bold(F))_2 \)$
  by the rank of the $S_i$-unit group and the dimension of the fixed group $"Cl" \( F \) \[ 2 \]$.
  Both bounds are uniform: the number of primes above $S_i$ is bounded and passing to the $S_i$-class group only
  decreases the required class-group bound. The fixed finite group $"Gal" \( F \/ K \)$ and inflation–restriction
  then bound $H^1 \( G_(K \, S_i) \, E \[ 2 \] \)$. Degree zero is bounded by two,
  and the global Euler characteristic bounds degree two; higher degrees vanish because $K$ is totally imaginary.
  Local cohomology has uniform bounds as well: the local degrees over $upright(bold(Q))$ are at most two,
  there are only finitely many fixed local conditions at $2 N$,
  and the moving good-prime and derivative complexes have fixed ranks.
  The Selmer-cone exact sequence gives the same conclusion for every target local condition used below.
  Thus Lemma 13 gives uniformly bounded target ranks. This inner bound may depend on the fixed active support and
  is not a bound for a sequence of growing binary families.
  The separate uniform bound after completion at $\( 2 \)$ is Lemma 18;
  binary-family uniformity is obtained only after the elimination in Proposition 38.

For clarity, let $D_i$ be a target cochain complex and write its contraction as $\( iota_i \, p_i \, h_i \)$.
  A transferred cycle $z_i$ is retained as the vector $p_i z_i$.
  Its representative in the original target cochains differs from $z_i$ by the boundary $d h_i z_i$.
  If an arithmetic identity is $z_i - z'_i = d b_i$, retain the target vectors $p_i z_i \, p_i z'_i \, p_i b_i$;
  their identity is exact. For a target comparison map $f_i : D_i arrow.r D'_i$, retain $p'_i f_i iota_i$,
  together with the contraction homotopy. For example,

$ p'_i f_i z_i - p'_i f_i iota_i p_i z_i = d #scale(x: 120%, y: 120%)[\(] p'_i f_i h_i z_i
  #scale(x: 120%, y: 120%)[\)] . $

Apply this also to local lifts in the Selmer cone, specialization comparisons,
  and the homotopies expressing duality and local switches.
  Each specified cycle or boundary witness is a vector in a bounded-rank target term,
  so adds only finitely many coordinates. Boundary witnesses are compressed after transfer and have target rank;
  no list indexed by the ring-class cosets is retained. The lemma therefore retains all these identities without
  retaining a source cochain complex or a growing transfer matrix.
  The original target contractions remain available in degrees zero, one, and two for all-sequence evaluation.
  All operations use the same original stages and ultrafilter;
  a loss of precision is accommodated by one common slower cofinal precision for the entire finite diagram.
  Adding derivative slots means extending each old stage by finitely many target objects,
  not taking a limit with an unbounded number of objects.

=== 4.2 Kummer conditions, including their derived degree zero <kummer-conditions-including-their-derived-degree-zero>

#thm([Lemma 4.5.])[
  (Integral Kummer local condition).  #emph[Let $F$ be a finite extension of a nonarchimedean local field of
    characteristic zero, and let $B \/ F$ be any elliptic curve.
    Put $M_F = B \( F \)_2^and = "proj lim"_n B \( F \) \/ 2^n B \( F \)$. There is a perfect local condition
$ U_F = M_F \[ - 1 \] arrow.r R Gamma \( F \, T_2 B \) . $

 For every $n gt.eq 1$, derived reduction has
$ H^0 \( U_F ⊗^(upright(bold(L))) upright(bold(Z)) \/ 2^n \) = B \( F \) \[ 2^n \] \, wide
  H^1 \( U_F ⊗^(upright(bold(L))) upright(bold(Z)) \/ 2^n \) = B \( F \) \/ 2^n B \( F \) . $

 Its map in degree zero is the isomorphism onto $H^0 \( F \, B \[ 2^n \] \)$,
   and its map in degree one is the finite Kummer injection.
   The condition is its own exact orthogonal complement under local Tate duality.
   These assertions hold at $F divides 2$, for all reduction types, and without a condition on $B \[ 2 \]$.]
] <rl:kummer>

#proof[
  The local analytic description of $B \( F \)$ shows that $M_F$ is a finitely generated
    $upright(bold(Z))_2$-module. Its torsion is the finite group $B \( F \) \[ 2^oo \]$.
    Consequently $M_F$ has a free resolution of length at most one.
    Also $H^0 \( F \, T_2 B \) = 0$, since $B \( F \) \[ 2^oo \]$ has bounded exponent.
    The integral Kummer injection into $H^1 \( F \, T_2 B \)$ therefore defines the displayed morphism using the
    truncation in degrees at most one of $R Gamma \( F \, T_2 B \)$.
  Tensor the free resolution of $M_F$ with $upright(bold(Z)) \/ 2^n$.
    Its two cohomology groups are $M_F \[ 2^n \]$ and $M_F \/ 2^n M_F$.
    The inverse limits of the ordinary Kummer exact sequences identify their maps with the two maps in the
    statement. In particular finite torsion invariants have not been discarded.
  For orthogonality, compose cup product and the Weil pairing with the local invariant map. A morphism
  $ M_F \[ - 1 \] ⊗^(upright(bold(L))) M_F \[ - 1 \] arrow.r upright(bold(Z))_2 \[ - 2 \] $
  is determined by its homomorphism $M_F ⊗ M_F arrow.r upright(bold(Z))_2$:
    the possible $"Tor"_1$ is in degree one and gives no extra degree-zero morphism to this target.
    The indicated homomorphism vanishes, because the finite Kummer image annihilates itself at every level by
    local Tate duality #cite(label("MilneADT2006")) I, Theorem 3.2 and Corollary 3.4.
    Choose a nullhomotopy in free models. The induced morphism
  $ R Gamma \( F \, T_2 B \) \/ U_F arrow.r R "Hom"_(upright(bold(Z))_2) \( U_F \, upright(bold(Z))_2 \) \[ - 2 \] $
  is a quasi-isomorphism. This can be checked after reduction modulo $2$:
    degree one is the perfect pairing of the finite Kummer quotient with the Kummer image,
    and degree two is dual to $B \( F \) \[ 2 \]$. Its perfect cone is therefore zero by derived Nakayama.
    This proves exact orthogonality and also its compatibility with derived reduction.
    The derived duality of the ambient local cochains is #cite(label("Nekovar2006")) Proposition 5.2.4;
    the Kummer condition and its orthogonality have been constructed above.
    No part of the proof uses an ordinary filtration or a classification of reduction types. ◻
]

Where the scalar deformation is trivial, extend this local condition by derived scalar extension to $A_i$ or
  $A_i \[ G \]$. For a finite free coefficient representation $M$ unramified at a good prime $v$,
  use the inflated residue-field complex

$ U_v = \[ thin M arrow.r^("Fr"_v - 1) M thin \] quad upright("in degrees ") 0 \, 1 . $

Its quotient in full local cochains is the singular local complex.
  The full local condition is the identity on local cochains, and its orthogonal strict condition is zero.
  The conditions at a derivative prime are different: once its local cochains have the split model constructed in
  Lemma 25, they are the truncations specified below. Write that model as

$ L_v = D^0 xor \( F_v xor S_v \) \[ - 1 \] xor D^2 \[ - 2 \] \, $

where the differential is zero, $D^0$ is dual to $D^2$, and the finite and transverse planes $F_v \,
  S_v$ are each isotropic. Put

$ U_(upright("str")) = D^0 \, wide U_(upright("rel")) = D^0 xor \( F_v xor S_v \) \[ - 1 \] \, wide U_F =
  D^0 xor F_v \[ - 1 \] \, wide U_S = D^0 xor S_v \[ - 1 \] . $

Then $U_(upright("str"))^perp = U_(upright("rel"))$ and each plane condition is its own orthogonal complement.
  Every displayed condition maps isomorphically onto local $H^0$ and injectively into local $H^1$.
  Thus they satisfy precisely the detection hypotheses used below.
  Lemma 25 proves their finite arithmetic realization and supplies the isotropic-plane nullhomotopies.
  These truncated conditions are not identified with the full local condition.

For a finite permitted set $S$ the Selmer complex is, by definition,

#[#set math.equation(numbering: n => "(4.6)")
 $ C_S =
   "Cone"
   (R Gamma \( G_(K \, S) \, M \) xor xor.big_(v in S) U_v arrow.r xor.big_(v in S) R Gamma \( K_v \, M \)) \[ -
   1 \] . $ <rl:selmer-definition>]

At $2 N$ take the Kummer conditions just constructed. Restriction and localization triangles are the triangles of
  this cone. The finite rings $A_i$ and $A_i \[ G \]$ are Frobenius coefficient rings;
  alternatively the duality maps may be checked after reduction to their residue field.
  Exact local orthogonality and global duality therefore give

#[#set math.equation(numbering: n => "(4.7)")
 $ C_S tilde.eq R "Hom" \( C_S^perp \, A_i \) \[ - 3 \] \, $ <rl:global-duality>]

with the appropriate dual representation. This application uses the orthogonality hypotheses of
  #cite(label("Nekovar2006")) Theorem 6.3.4; the theorem is not being used to assert the existence of a
  varying-prime limit. Complex places contribute zero Tate complexes.
  If the character is inverted by the nontrivial automorphism of $K \/ upright(bold(Q))$,
  conjugate transport followed by the Weil pairing identifies the two representations over the same scalar ring.
  All maps and nullhomotopies in this paragraph are finite diagrams to which Lemma 14 applies.

=== 4.3 The moving conductor character <the-moving-conductor-character>

#thm([Proposition 4.6.])[
  (Finite-precision ring-class characters).  #emph[Fix finitely many split primes of $K$ above odd rational
    primes, outside $2 N$, and orient one prime in each conjugate pair.
    There are distinct split rational primes $r_i$ avoiding all the fixed data and characters
$ xi_i : "Gal" \( H_(r_i) \/ K \) arrow.r upright(bold(Z)) \/ 2^(n_i) upright(bold(Z)) \, wide n_i arrow.r oo \, $

 such that $xi_i$ is surjective on the inertia quotient at $r_i$, is zero at the primes above $2 N$,
   and has odd value at each prescribed oriented prime. We can require $r_i arrow.r 1$ in $upright(bold(Z))_2$ and
#[#set math.equation(numbering: n => "(4.8)")
 $ v_2 \( 2 + a_(r_i) \( E \) \) \, quad v_2 \( 2 - a_(r_i) \( E \) \) \, quad
   v_2 det \( 1 plus.minus "Fr"_(r_i) divides T \) med lt.eq c_E . $ <rl:trace-bound>]

 The constant $c_E$ is independent of the list and of $K$.]
] <rl:characters>

#proof[
  We give the compatibility argument before imposing the Tate condition.
    Choose prime ideals $frak(p)_1 \, dots.h \, frak(p)_s$ with pairwise disjoint conjugate pairs,
    including the oriented prescribed primes and the primes above $2 N$,
    and enough additional split prime ideals to generate $"Cl" \( K \)$.
    Such additional ideals may avoid any fixed finite set. Put weight $w_j =
    1$ at a prescribed odd prime and $w_j = 0$ at every additional prime and every prime above $2 N$.
    The conjugate weight is $- w_j$. Let
  $ R = ker #scale(x: 120%, y: 120%)[\(] upright(bold(Z))^s arrow.r "Cl" \( K \) #scale(x: 120%, y: 120%)[\)] \, $
  choose a basis $m^(\( a \))$ of $R$, and choose $beta_a in K^times$ with $\( beta_a \) =
    product_j frak(p)_j^(m_j^(\( a \)))$.
  Work first over $F_oo = K \( mu_(2^oo) \)$ and adjoin $2^n$-th roots of the finitely many $beta_a \/
    overline(beta)_a$. Prescribe on these roots the multipliers
  #[#set math.equation(numbering: n => "(4.9)")
   $ zeta_(2^n)^(thin - sum_j m_j^(\( a \)) w_j) . $ <rl:kummer-prescription>]
  The minus sign fixes the choice of connecting map in the ring-class sequence and could be reversed throughout.
    These prescriptions respect every Kummer relation. Indeed, if
  $ product_a \( beta_a \/ overline(beta)_a \)^(b_a) in \( F_oo^times \)^(2^n) \, $
  take its valuation at a prime above each $frak(p)_j$ of nonzero weight.
    These odd primes are unramified in $F_oo \/ K$. Thus $2^n$ divides $sum_a b_a
    m_j^(\( a \))$ for each such $j$, proving the required compatibility of (4.9).
    Primes over $2$ have weight zero and impose no division by a ramification index.
    Units impose no additional weighted relation. Kummer duality supplies the prescribed automorphism of the
    radical extension over $F_oo$.
  At a rational prime $r$ split in a sufficiently large finite cyclotomic subfield,
    the power-residue character of $upright(bold(F))_r^times$ is surjective onto $mu_(2^n)$.
    The split ring-class exact sequence is
  $ 1 arrow.r \( cal(O)_K \/ r cal(O)_K \)^times \/ \( upright(bold(Z)) \/ r upright(bold(Z)) \)^times arrow.r
    "Pic" \( upright(bold(Z)) + r cal(O)_K \) arrow.r "Cl" \( K \) arrow.r 1 . $
  There is no unit correction under our exclusion of the extra-unit fields.
    The first group is $upright(bold(F))_r^times$, with a principal relation measured by $beta \/
    overline(beta)$ at the oriented prime over $r$. Consequently (4.9) says exactly that its primitive
    power-residue character extends to the class group with the specified values $w_j$.
    Since the ring-class extension is unramified at $2 N$, value zero on Frobenius means that the resulting local
    character is trivial there. Conjugation acts by inversion.
  We now show that imposing these finitely many radical conditions cannot force either forbidden Tate trace.
    In the non-CM case the image of $G_(K \( mu_(2^oo) \))$ is an open subgroup of
    $"SL"_2 \( upright(bold(Z))_2 \)$, by the open-image theorem #cite(label("Serre1972")).
    Its index in the corresponding fixed-$E$ image changes by at most two when $K$ changes.
    Its commutator subgroup contains a fixed open subgroup $U_E$ of $"SL"_2 \( upright(bold(Z))_2 \)$.
    One may see uniformity by starting with a principal congruence subgroup in the fixed image:
    every index-two subgroup contains its squares, and the commutators of the resulting fixed congruence subgroup
    are open. Because the radical extension over $F_oo$ is abelian, these commutators act trivially on it.
    Hence every permitted Tate coset contains a translate of $U_E$.
  For completeness, in the CM case let $M$ be the CM field.
    The image over $K M \( mu_(2^oo) \)$ contains a fixed open subgroup of the norm-one Cartan;
    the index changes by a bounded factor, as $\[ K M : upright(bold(Q)) \] lt.eq 4$.
    Choose $gamma in G_(K M)$ with $chi_(upright("cyc")) \( gamma \) = 5^4 = 625$. This is possible uniformly:
    the cyclotomic image of $G_(K M)$ has index at most four in $upright(bold(Z))_2^times$,
    so contains fourth powers. On the radical Galois group, conjugation by $gamma$ is raising to $625$,
    because all the radicands lie in $K$. On the Tate image over $K M$, conjugation is trivial. Therefore
  $ gamma u gamma^(- 1) u^(- 625) \, wide u in G_(K M \( mu_(2^oo) \)) \, $
  fixes every prescribed radical and acts on $T$ as $rho_T \( u \)^(- 624)$.
    Raising to the fixed nonzero power $624$ carries an open subgroup of the one-dimensional norm-one Cartan onto
    an open subgroup. This proves the required uniform kernel statement also in the CM case.
    The open Cartan image used here is the CM part of the usual $ell$-adic image theorem #cite(label("Serre1968"))
    Chapter IV, §2.2, Remark.
  On a coset of an open subgroup of $"SL"_2$, trace is not identically $2$ or $- 2$.
    The same holds on a coset of an open norm-one Cartan subgroup;
    on the other Cartan-normalizer component trace is zero. The relevant determinant-one sets are compact and have
    finitely many cosets modulo the fixed open subgroup. Choose in each coset an element whose trace is neither
    forbidden value. The largest of the finitely many resulting valuations is a constant depending only on $E$.
  Finally restrict the prescribed radical automorphism and such a Tate lift to a finite Galois extension,
    including as many roots of unity as required. Chebotarev gives infinitely many rational primes with this
    Frobenius class; choose the place over the prime to realize the chosen representative.
    They split in $K$ and have arbitrarily high prescribed congruence to $1$.
    Since $det \( 1 plus.minus "Fr"_r \) = 1 plus.minus a_r + r$,
    a congruence precision larger than the fixed trace bound gives all of (4.8).
    This is a finite Chebotarev condition at each stage, not a demand that one prime split in an infinite extension. ◻
]

Choose $n_i$ large enough that $1 + t$ has order dividing $2^(n_i)$ in $A_i^times$,
  and put $Psi_i = \( 1 + t \)^(xi_i)$. For example $n_i gt.eq 2 i$ is sufficient.
  After the matrix limits, the inertia exponent at the moving prime is a unit of $upright(bold(Z))_2$,
  and a prescribed oriented Frobenius exponent is odd. We can orient the generator of inertia so its action is
  exactly $1 + t$.

#thm([Lemma 4.7.])[
  (Local height-one tests).  #emph[For the individual coefficient system $T chi_h Psi$,
    use full local conditions at the moving prime $r$ and the active primes dividing $h$,
    without adding primes from a larger binary family. The limiting full local complexes are acyclic over every
    height-one residue field of $Lambda$ of characteristic zero.
    At $\( 2 \)$, with residue field $Omega = upright(bold(F))_2 \( \( t \) \)$, the $r$-complex is acyclic,
    and so are the complexes at active split primes whose prescribed exponent is odd.
    These full conditions therefore agree with their orthogonal conditions on the stated tests.]
] <rl:local-acyclic>

#proof[
  Use tame inertia and unramified Frobenius, or the Hochschild–Serre complex for these two procyclic directions.
    At $r$, inertia minus one is multiplication by $t$ times a unit.
    It is invertible on all the indicated fields except the characteristic-zero fiber $t = 0$.
    There, $r arrow.r 1$, and the two remaining Frobenius differentials have nonzero determinant by (4.8),
    including either sign of the quadratic twist. The bound also ensures that the integral local torsion at this
    central fiber has bounded length.
  At an active odd conductor prime, inertia of the quadratic character acts by $- 1$.
    Its differential is thus $- 2$ and is invertible in characteristic zero.
    In characteristic two the quadratic character disappears.
    At a split prime the Frobenius action is $z B$, where $B in
    "GL"_2 \( upright(bold(F))_2 \)$ and $z = \( 1 + t \)^a$ has odd $a in upright(bold(Z))_2$.
    Its coefficient of $t$ is one, so $z$ is nonconstant. No nonzero polynomial over the finite constant field
    vanishes at $z$. Thus both Frobenius complexes, with operators $z B - 1$ and $q^(- 1) z B - 1$,
    are invertible over $Omega$; here $q = 1$ in the residue field.
    This argument applies also to a reducible residual representation.
  The orthogonal full and strict conditions agree when full local cochains are acyclic.
    Equation (4.7) then gives self-duality. The global degree-zero assertion will follow from the evaluation maps
    in Lemma 19. ◻
]

#thm([Lemma 4.8.])[
  (Uniform residual sizes).  #emph[Suppose $omega \( "disc" K \) lt.eq A$,
    the local twisting classes at $2 N$ belong to a fixed finite list,
    and all active conductor primes are split with odd exponent.
    After localization and completion at $\( 2 \)$, the minimal free ranks of the Selmer complexes are bounded in
    terms of $E \, A$, and the number of retained derivative primes.
    They do not depend on the number of active conductor primes.]
] <rl:residual-bound>

#proof[
  Reduce first over $upright(bold(F))_2 \[ \[ t \] \]$. The quadratic character is now trivial.
    Removing the active conductor primes from the permitted ramification set changes the global complex by their
    singular local complexes. These, and their unramified local complexes, are acyclic after inverting $t$,
    by Lemma 17. The resulting smaller-support complex, including its comparison maps,
    can be constructed at the original Artin stages before taking the limit.
    Its support consists of $2 N \, r$, and the retained derivative primes.
    Its $upright(bold(F))_2 \( \( t \) \)$ cohomology dimensions are bounded by those at $t = 0$:
    choose a minimal finite free model over $upright(bold(F))_2 \[ \[ t \] \]$.
  Here is a uniform bound for the latter residual cohomology.
    Put $F = upright(bold(Q)) \( E \[ 2 \] \)$, a fixed field. Then $F K \/ F$ is at most quadratic.
    Enlarge the allowed set of primes of $F$ by those ramified in $K$.
    Its cardinality is bounded by a constant depending on $E \, A$ and the number of derivative primes.
    Kummer theory bounds the number of generators of the maximal pro-$2$ Galois group over $F$ unramified outside
    this set, using the fixed unit group, the fixed $2$-class group, and the allowed valuations.
    The subgroup defining $F K$ has index at most two; the elementary Schreier bound bounds its generator number.
    Every finite Galois $2$-extension of $F K$ with this ramification has Galois closure of $2$-power degree over
    $F$, so this subgroup indeed controls the required pro-$2$ extensions of $F K$.
  Over $F K$ the residual Tate module is trivial. Restriction and inflation–restriction therefore bound the
    residual $H^1$ over $K$. The $H^0$ bound is immediate, and the global Euler characteristic or global duality
    bounds $H^2$. The local terms at the remaining bounded set have bounded dimensions,
    with degrees of the local fields at most two over the fixed rational local fields.
    At $2 N$ there are only finitely many local quadratic twisting classes.
    The same bounds apply to the Selmer cone. Lemma 13 now bounds the minimal ranks.
    No bound on a torsion exponent is inferred from these rank bounds. ◻
]

=== 4.4 Evaluation on every sequence, rather than only a chosen list <evaluation-on-every-sequence-rather-than-only-a-chosen-list>

#thm([Lemma 4.9.])[
  (All-sequence evaluation).  #emph[Fix $K$ and a sequence of the finite cochain constructions above.
    Keep the contraction maps into the original global cochains.
    Let $Gamma_K = product_i G_K$ and $Gamma = Gamma_K times.r chevron.l tau chevron.r subset product_i
    G_(upright(bold(Q)))$, with simultaneous complex conjugation $tau$.
    Thus $Gamma_K$ has index two in $Gamma$; the larger unrestricted product of rational Galois groups is not used
    for induction. The matrix limit defines a coefficient action of $Gamma_K$ on $Lambda^2$.
    For every field $L$ receiving a map from $Lambda$, there is a natural injection
$ H^1 \( C ⊗_Lambda L \) arrow.r H_(upright("abs"))^1 \( Gamma_K \, L^2 \) \, $

 where the right side denotes abstract crossed-homomorphism classes.
   Degree-zero evaluation likewise injects $H^0 \( C ⊗_Lambda L \)$ into $\( L^2 \)^(Gamma_K)$.
   Here $C$ may be the global complex or a Selmer complex whose local condition maps induce isomorphisms on local
   $H^0$ and injections on local $H^1$. The same statement holds for the induced representation of $Gamma$.]
  #emph[There are evaluation maps on arbitrary sequences, not just on the finite list used to detect cohomology.
    Their degree-two identities remain valid after arbitrary coefficient extension.]
] <rl:evaluation>

#proof[
  Let $C_i$ be a finite model and let $iota_i$ be its chosen map to the original global cochains,
    using the projection from the Selmer cone when appropriate.
    For every $g = \( g_i \)$ and $h = \( h_i \)$ define matrices
  $ e_i^0 : C_i^0 arrow.r A_i^2 \, quad e_(g \, i)^1 : C_i^1 arrow.r A_i^2 \, quad e_(g \, h \, i)^2 :
    C_i^2 arrow.r A_i^2 $
  by evaluating $iota_i$ in degrees zero, one, and two. Their source ranks are fixed and their entries belong to
    $A_i$. Thus each has a coefficientwise ultrafilter limit, for every choice of $g \, h$.
    No diagonal selection over the set of group elements is necessary:
    one fixed ultrafilter defines all these limits. Likewise $rho \( g \) =
    lim_i rho_i \( g_i \)$ is a representation. The original cochain identities imply
  #[#set math.equation(numbering: n => "(4.10)")
   $ e_g^1 d & = \( rho \( g \) - 1 \) e^0 \,\
e_(g \, h)^2 d & = rho \( g \) e_h^1 - e_(g h)^1 + e_g^1 . $ <rl:eval-boundary>]
  All identities pass to the limit because their matrix expressions have finitely many terms.
    A cycle $x in C^1 ⊗ L$ consequently gives the crossed homomorphism $g mapsto e_g^1 \( x \)$,
    and a boundary gives a coboundary.
  We prove injectivity in a way that also controls base change.
    At each finite stage let $k = upright(bold(F))_2$ be the residual field.
    Choose a space of representatives for residual $H^1$. Evaluate pairs $\( c \, m \)$,
    where $c$ is in this space and $m in k^2$, by $b_c \( g \) - \( rho \( g \) - 1 \) m$.
    The intersection of the kernels of all these evaluations consists precisely of pairs $\( 0 \, m \)$ with $m$
    an invariant. Since the vector space is finite dimensional, a list of at most $dim H^1 +
    2$ elements already has this intersection. For these elements evaluation is a chain map
  $ C_i arrow.r D_i = \[ thin A_i^2 arrow.r^(\( \( rho_i \( g_j \) - 1 \) \)_j) \( A_i^2 \)^d thin \] $
  in degrees zero and one, inducing an isomorphism on residual $H^0$ and an injection on residual $H^1$.
    For Selmer complexes this uses the exact sequence of (4.6):
    the indicated local degree-zero isomorphisms give $H^0 \( C_i \) =
    H_(upright("glob"))^0$ and $H^1 \( C_i \) arrow.r.hook H_(upright("glob"))^1$ residually.
  Retain these matrices and their chosen group-element sequences.
    The cone of the limiting map $C arrow.r D$ has zero residual cohomology in degrees at most zero.
    Successively cancel its unit differential blocks. The resulting bounded free cone starts in degree one.
    After every coefficient extension it still starts in degree one;
    the long exact sequence therefore makes $H^1 \( C ⊗ L \) arrow.r H^1 \( D ⊗ L \)$ injective.
    A crossed cocycle that is a coboundary on all of $Gamma_K$ is in particular a coboundary on the detecting
    list, proving the desired injection. The same cone gives an isomorphism on $H^0$ after coefficient extension.
    Since $H^0 \( D ⊗ L \)$ is a subspace of $L^2$, degree-zero evaluation is injective; by (4.10),
    its image is fixed by every element of $Gamma_K$, not merely by the detecting list.
    For induction the same proof has coefficient rank four and the detecting bound is $dim H^1 + 4$. ◻
]

We can now exclude global invariants on the tests of Lemma 17.
  In characteristic two the nontrivial $r$-inertia scalar excludes coefficient invariants.
  In characteristic zero the same argument works unless that scalar is trivial.
  In the latter case $t = 0$, and $T ⊗ upright(bold(Q))_2$ over $G_K$ is absolutely irreducible:
  for non-CM curves this follows from the open image, and for CM curves from the open Cartan and its nontrivial
  normalizer component, since $K$ is not the CM field. Twisting by $chi_h$ does not alter its invariant subspaces.
  The degree-zero injection just proved therefore gives $H^0 = 0$ for the limiting Selmer complex.
  Together with (4.7), this leaves degrees one and two paired and kills degree three as well.

#thm([Lemma 4.10.])[
  (The exact common kernel).  #emph[In the notation of Lemma 19,
    let $H$ be the group of sequences each of whose entries acts trivially on the full Tate module,
    on all ring-class fields of $K$, and on the quadratic characters in use.
    Restriction from the crossed classes in that Lemma to $H$ is injective at every characteristic-zero test.
    It is also injective at the residual $\( 2 \)$ test. The characteristic-zero annihilator needed for this
    assertion can be chosen with a fixed finite $2$-valuation depending only on $E$, also as $K$ varies.]
] <rl:kernel>

#proof[
  The Tate image contains an open subgroup of scalar homotheties,
    both in the CM and non-CM cases #cite(label("Bogomolov1981Points")) §2, Theorem 3 and paragraph 7.
    Choose once and for all $g in G_(upright(bold(Q)))$ with Tate action $u thin 1$, where $u in 1 +
    4 upright(bold(Z))_2$ and $u eq.not 1$. Its square belongs to every quadratic subgroup. Put
  $ z = g^2 tau g^2 tau^(- 1) . $
  The generalized dihedral property of every ring-class extension implies that $z$ is ring-class trivial.
    It is also trivial on every quadratic character, and its Tate action is the fixed scalar $u^4$.
    For every sequence in $Gamma_K$, its commutator with the constant sequence $z$ is in the exact group $H$,
    since its Tate commutator and all its abelian character images are trivial.
    Thus $z$ is central in $Gamma_K \/ H$ and acts on the coefficients by $u^4$.
  Here the elementary central-scalar argument suffices. If a crossed cocycle $b$ is defined on a group with such a
    central element, comparison of $b \( z g \)$ and $b \( g z \)$ gives
  $ \( u^4 - 1 \) b \( g \) = \( g - 1 \) b \( z \) . $
  In characteristic zero this makes $b$ a coboundary. Inflation–restriction then gives injectivity on $H$.
    The valuation of $u^4 - 1$ is fixed.
  In characteristic two use instead, at the $i$-th stage, an inertia element at $r_i$ mapping to the chosen
    generator of $xi_i$. Its Tate action is trivial and its ring-class image commutes with all ring-class images.
    The associated sequence is therefore central modulo $H$, and its coefficient action is $1 + t$.
    Since $t$ is invertible in $upright(bold(F))_2 \( \( t \) \)$, the same calculation applies.
    It is essential here that $H$ is defined by the exact actions at each stage,
    not merely by an action converging to the identity. ◻
]

=== 4.5 The outer characteristic-zero test <the-outer-characteristic-zero-test>

#thm([Proposition 4.11.])[
  (Integral evaluation through the outer limit).  #emph[Let $C_j$ be any family of the preceding limiting
    complexes, completed over $cal(O)_j = hat(Lambda_(\( 2 \)))$, possibly for different quadratic fields $K_j$.
    Suppose their minimal ranks are bounded. Keep their actual evaluation matrices,
    and transport them through the integral contractions to these minimal models.
    For a nonprincipal ultrafilter $cal(U)$, put
$ cal(O)_oo = (product_(cal(U)) cal(O)_j) \/ frak(a) \, wide frak(a) = { \( x_j \) : { j : v_2 \( x_j \) gt.eq
  n } in cal(U) upright(" for every ") n } . $

 Then $cal(O)_oo$ is a DVR with uniformizer $2$ and a characteristic-zero fraction field $L_oo$.
   The outer complex has an injection of its $H^1$ over $L_oo$ into crossed classes on the product of the inner
   sequence groups. Its restriction to the product of their exact common kernels is injective.
   All arbitrary-sequence degree-two evaluation identities survive.
   These conclusions also hold after retaining any fixed finite collection of additional integral diagrams.]
] <rl:outer-evaluation>

#proof[
  A nonzero element of the quotient has a representative whose valuations are bounded on an ultrafilter-large set.
    A finite partition then makes its valuation equal to a single integer $n$ on such a set.
    It is $2^n$ times a unit. Products add these finite valuations, so the quotient is a domain,
    and every nonzero ideal has an element of smallest valuation. It is consequently a DVR.
    The integer $2^n$ is nonzero for every $n$, so its fraction field has characteristic zero.
  For each $j$, all-sequence evaluation maps originally have entries in $Lambda$.
    Extension to $cal(O)_j$ and composition with an integral contraction still give integral matrices.
    Thus evaluation on any sequence of inner group elements has an entrywise image in $cal(O)_oo$.
    Equations (4.10) and (4.10) survive for all such sequences.
    In particular, if an outer cycle is represented by vectors $x_j$ for which $d_j
    x_j$ has valuation tending to infinity, the evaluation of $d_j x_j$ does too:
    the degree-two evaluation matrix is integral. This proves the crossed identity for an outer cycle without
    replacing the $x_j$ by genuine inner cycles.
  Over the inner residue field $Omega_j$, choose a detecting list as in Lemma 19;
    its length is at most $dim_(Omega_j) H^1 \( C_j ⊗ Omega_j \) + "rank" M$. These lengths are bounded.
    Include in the integral diagrams the evaluation map to its two-term complex and a contraction of its cone to a
    complex starting in degree one. Such a contraction uses only unit pivots over $cal(O)_j$ and has bounded
    graded sizes. All its matrices, including inverses and homotopies, are integral and pass to the quotient.
    Its cone still starts in degree one after extension to $L_oo$. This proves injectivity just as in Lemma 19.
  Let $H_j$ be the inner exact kernel. The product of the central elements of Lemma 20 is central modulo
    $product_j H_j$. Its scalar is the same fixed $u^4$ in every component, and $u^4 -
    1$ remains nonzero in $cal(O)_oo$. The explicit central-scalar calculation and inflation–restriction give the
    claimed restriction injection. Additional fixed finite diagrams are treated by the same entrywise operations. ◻
]

#thm([Lemma 4.12.])[
  (Irreducibility on the characteristic-zero tests).  #emph[On an inner or outer characteristic-zero test where
    $Psi^2 eq.not 1$, the four-dimensional representation induced from $T chi Psi$ is absolutely irreducible.
    If $Psi^2 = 1$ on an inner test, it splits as two inequivalent absolutely irreducible quadratic twists.
    In the outer test $Psi$ has infinite order.]
] <rl:irreducibility>

#proof[
  The two induced summands are distinguished by $r$-inertia, whose scalars are $Psi$ and $Psi^(- 1)$.
    On either summand, multiplying the Tate matrices by scalars does not alter invariant subspaces.
    The Tate representation restricted to $G_K$ is absolutely irreducible under the exclusions already specified.
    These facts give absolute irreducibility of the induction when the two inertia characters differ.
  For the outer argument this assertion requires a uniform finite witness.
    The images of the quadratic subgroups have index at most two in the fixed compact $2$-adic Tate image.
    A compact $2$-adic analytic group is topologically finitely generated and hence has only finitely many closed
    subgroups of index at most two. Choose one on an ultrafilter-large set.
    Its absolutely irreducible representation has finitely many matrices spanning $M_2 \( upright(bold(Q))_2 \)$;
    the determinant expressing this spanning property is a fixed nonzero $2$-adic number.
    Every one of these Tate matrices is realized by choices of Galois elements in each component.
    Their accompanying character scalars are units and do not change the spanning assertion.
    Its determinant remains nonzero in $L_oo$. This proves absolute irreducibility in that field.
    Also $1 + t$ has infinite order already in every $Omega_j$:
    for a nonzero integer $n$, the first nonzero term of $\( 1 + t \)^n - 1$ occurs in finite degree.
    It remains a unit modulo $2$ in every component, so no such power becomes one in the outer field.
  If $Psi^2 = 1$, extension across conjugation gives the two quadratic twists.
    They are inequivalent, since a quadratic self-twist of the Tate representation here would make its restriction
    to $G_K$ reducible over an algebraic closure. In the CM case this would force $K$ to be the CM field,
    which was excluded. ◻
]

#thm([Lemma 4.13.])[
  (Simultaneous finite Chebotarev realization).  #emph[For any element $u$ of an exact kernel in Lemma 20,
    derivative primes can be chosen, at increasing finite precision,
    whose rational Frobenius is $tau u$ on all retained data.
    Their finite localization is evaluation on $\( tau u \)^2$.
    The assertion is compatible with the outer construction of Proposition 21 and with any fixed finite list of
    previous derivative operations.]
] <rl:chebotarev-evaluation>

#proof[
  At one Artin stage, a coordinate of a cochain in the image of a finite model is a locally constant function.
    The finitely many coordinates being used factor through one finite quotient of the absolute Galois group.
    Enlarge it to contain the Tate action at the required precision,
    the finitely many ring-class fields and quadratic characters currently in use, and all old finite data.
    Chebotarev realizes the conjugacy class of $tau u$ on this finite quotient,
    with a chosen place realizing the desired representative.
    It gives a rational prime inert in $K$, outside the old finite set.
    Because $u$ is exactly Tate-trivial, its Frobenius tends to $rho_T \( tau \)$; in particular $a_ell arrow.r
    0$ and $ell arrow.r - 1$. Because $u$ is exactly ring-class trivial,
    the square Frobenius on the $K$-prime is the identity on every retained ring-class field.
    The unramified local coordinate is therefore the stated Frobenius-square evaluation.
  Repeat at each finite stage with increasing precision. All conditions remain finite,
    and no density bound or prime-size bound is required. For an outer sequence do this separately for each inner
    sequence, retaining the relevant finite evaluation matrices and degree-two identities before taking the outer
    quotient. Approximate inner cycles cause no problem, by the integrality calculation in Proposition 21.
    Previously imposed finite diagrams are unchanged. ◻
]

In induced-module notation, restriction to the exact kernel is additive.
  For a crossed cocycle $b$ and an exact-kernel element $u$,

$ b \( \( tau u \)^2 \) = \( 1 + tau \) b \( u \) . $

Indeed $tau^2 = 1$, $u$ acts trivially on the coefficients,
  and the cocycle identity cancels the two occurrences of $b \( tau \)$.
  Projection to either induced summand identifies $"im" \( 1 + tau \)$ with a two-dimensional coefficient module,
  also in characteristic two.

#thm([Theorem 4.14.])[
  (The limit and evaluation interface).  #emph[For the ring data fixed at the start of this section,
    retain the finite target-side arithmetic diagrams with their maps to original cochains, homotopies,
    and dualities as in Lemma 14. The moving characters, local conditions,
    and evaluation constructions then have the following simultaneous properties:]
  + #emph[Every specified finite target-side arithmetic diagram admits a bounded free model together with maps to
    its original cochains; the specified maps, homotopies and dualities survive the inner limit.]
  + #emph[At the stated height-one tests the relaxed active local complexes are acyclic,
    and the Selmer duality pairs degrees one and two. Integral Kummer conditions at $2
    N$ include their full derived degree-zero invariants.]
  + #emph[The residual sizes needed for the outer construction are bounded independently of the active conductor
    support, with dependence only on $E$, the bound on $omega \( "disc" K \)$,
    and the number of retained derivative primes.]
  + #emph[Inner and outer $H^1$ are detected by actual crossed cocycles, including on the exact common kernel.
    The evaluations and their degree-two identities can be realized by finite Chebotarev conditions without
    disturbing earlier finite data.]
  #emph[These assertions do not assert an Euler-system reciprocity law or an integral derivative class that has
    not first been constructed at finite level. Once those finite arithmetic diagrams are constructed,
    this Theorem supplies their limit compatibility.]
] <rl:limit-evaluation-package>

#proof[
  Combine Lemmas 13 and 14, Lemma 15, Proposition 16, Lemmas 17 and 18, Lemmas 19 and 20, Proposition 21,
    and Lemma 23. Every passage uses actual integral matrices of bounded size;
    arbitrary evaluations are retained by their original contraction maps,
    not by an inference from a finite list of identities. ◻
]

== 5 Ring-class switches, determinant lattices, and transfer <rd:section>

This section constructs the derivative classes and proves the determinant and transfer statements.
  The arithmetic models, the character $Psi$, and their evaluation maps are those of Lemmas 13, 14, 19, and 20,
  and Propositions 16 and 21. There are two outputs. Corollary 11 bounds a Heegner-point index at a known simple
  zero, uniformly in the conductor and with dependence only on a bound for the number of companion primes.
  Theorem 12 instead fixes the companion field and recovers an unknown base derivative from a family of known
  simple zeros. The first step is an integral switch: adding a derivative prime replaces a finite local condition
  by its singular counterpart without changing the determinant valuation.
  Repeated switches then give the uniform lower bound. For the missing vertex we need more:
  the determinants must occur in one group-ring family with a uniformly bounded clearing factor.
  We construct the arithmetic diagrams before applying these two arguments,
  and verify their specialization and family properties where they are used.

Fix $E \/ bb(Q)$, put $T = T_2 \( E \)$, and normalize $v \( 2 \) = 1$. Let

$ Lambda = bb(Z)_2 \[ \[ t \] \] \, wide cal(O) = hat(Lambda_(\( 2 \))) \, wide Omega = bb(F)_2 \( \( t \) \) . $

For a perfect cohomological complex $C$, use the inverse determinant line

#[#set math.equation(numbering: n => "(5.1)")
 $ cal(D) \( C \) = ⨂_i \( det C^i \)^(\( - 1 \)^(i + 1)) . $ <rd:det-convention>]

In particular, for a complex in degrees one and two this is $det C^1 ⊗ \( det C^2 \)^(- 1)$.
  A basis of this integral line is fixed whenever a determinant coordinate is mentioned.
  Changing it multiplies the coordinate by an integral unit.

The ring data consist of an imaginary quadratic field $K = bb(Q) \( sqrt(k) \)$ split at $2 N$,
  a product $h$ of signed good odd primes split in $K$, and $\( h \, k \) = 1$.
  The fields with extra units and the CM field of $E$ are excluded. Write

#[#set math.equation(numbering: n => "(5.2)")
 $ t_p = dim_(bb(F)_2) E \[ 2 \]^("Fr"_p) \, wide w \( h \) = 1 / 2 sum_(p divides h) t_p . $ <rd:weights>]

Choose the modular parametrization $pi : X_0 \( N \) arrow.r E$ normalized by $pi \( oo \) = 0$,
  translating it by the rational point $- pi \( oo \)$ first if necessary.
  By the Manin–Drinfeld theorem #cite(label("Manin1972")) #cite(label("Drinfeld1973")),
  images of cusp differences are torsion, so one fixed integer kills every cuspidal ambiguity.
  No assertion that an arbitrary translate has torsion value at $oo$ is used.
  The scalar deformation is trivial at $2 N$, has unit exponent on the auxiliary conductor inertia,
  and odd exponent at the indicated split conductor Frobenii.
  Its auxiliary prime $r$ is allowed to change with the precision.
  The trace bound in Proposition 16 is part of the data.

=== 5.1 The local switch and its integral determinant <rd:local-subsection>

#thm([Lemma 5.1.])[
  (The split local model).  #emph[Let a sequence of inert good primes $ell$ have rational Frobenius lifts tending
    on $T$ to a fixed complex conjugation $J$. At the unique prime of $K$ above $ell$, the limiting local complex has
#[#set math.equation(numbering: n => "(5.3)")
 $ H^0 = M \, wide H^1 = F xor S = M xor M \, wide H^2 = M \, $ <rd:local-cohomology>]

 with zero differentials in a free split model. Here $M = T ⊗
   Lambda$ with the relevant scalar coefficient structure. The two degree-one coordinates of a cocycle are
#[#set math.equation(numbering: n => "(5.4)")
 $ f \( c \) = c \( gamma^2 \) \, wide s \( c \) = c \( sigma \) \, $ <rd:coordinates>]

 where $gamma$ is the chosen rational Frobenius lift and $sigma$ is an oriented pro-$2$ tame generator.
   The plane conditions $F = { s = 0 }$ and $S = { f = 0 }$ include $H^0$ and exclude $H^2$.
   Each is its own orthogonal complement for conjugate-Weil duality.
   The strict condition $H^0$ and the relaxed condition $H^0 xor H^1 \[ - 1 \]$ are mutually dual.
   All four inclusions can be equipped with compatible integral duality triangles.]
] <rd:local-model>

#proof[
  The prime-to-$ell$ local cochains are computed by the tame inertia and residue-field directions.
    In these two directions the differentials are formed from inertia minus one and Frobenius minus one,
    with the usual Frobenius action on tame inertia. On $M$, inertia is trivial at the derivative prime.
    The square of a rational Frobenius is trivial on every ring-class character.
    In the limit it is also the identity on $T$, while $ell^2$ tends to one.
    Thus both differentials become zero, giving (5.3).
  Here is a finite-precision check of the pairing, needed at $2$.
    At a retained quotient killed by $2^a$, impose also $q = ell^2 equiv 1 med \( mod med 2^(a + 1) \)$,
    as well as trivial Frobenius-square action on the coefficient module at this quotient.
    The tame two-generator complex then has zero differentials, with the coordinates in (5.4).
    Its degree-one scalar generators are the unramified and tame characters.
    More explicitly, use the presentation $phi.alt sigma phi.alt^(- 1) sigma^(- q) = 1$.
    After augmentation with trivial coefficient action its Fox resolution has terms of ranks $1 \, 2 \, 1$,
    with $d^0 = 0$ and $d^1 = \( 0 \, 1 - q \)$, in the ordered finite and tame coordinates.
    The diagonal from the same resolution has zero pure-finite term, unit mixed terms,
    and pure-tame coefficient $plus.minus binom(q, 2)$. The latter coefficient is the augmented second derivative
    of $sigma^(- q)$ together with its adjacent $sigma$ in the relation.
    Both $1 - q$ and $binom(q, 2)$ vanish modulo $2^a$ under the imposed congruence.
    Thus this is an actual split complex and an actual pure-plane zero pairing at the retained precision.
    The field contains the $2^(a + 1)$-st roots of unity, so $- 1$ is a $2^a$-th power.
    The norm-residue identity $\( x \, x \) = \( x \, - 1 \)$ for the $2^a$-Hilbert symbol therefore makes the
    square of each scalar generator zero. The two generators form a basis;
    local Tate duality makes their cross pairing a unit. The same calculation applies coefficientwise to the free
    Artin coefficient module, including its nilpotent $t$ and quadratic variables.
    Thus the pure plane restrictions are already zero at every retained quotient.
    All these congruences can be imposed simultaneously with the derivative Frobenius conditions by increasing
    their precision. Taking the compatible limit proves integral vanishing of the pure squares.
    It is not deduced from skew symmetry in characteristic two.
  Equivalently, in the limiting tame presentation $phi.alt sigma phi.alt^(- 1) = sigma^q$ with $q arrow.r 1$,
    the rank-$\( 1 \, 2 \, 1 \)$ resolution specializes to the exterior resolution for two procyclic directions.
    The finite Hilbert-symbol calculation specifies the cup product on its split cohomology and rules out a hidden
    square term. Conjugation transports the finite Tate coordinate by $J$ and the singular coordinate by $- J$,
    with possible scalar units coming from the orientations. Consequently the cross pairing is
  #[#set math.equation(numbering: n => "(5.5)")
   $ beta \( x \, y \) = epsilon.alt thin chevron.l x \, J y chevron.r \, wide epsilon.alt in Lambda^times \, quad
     x in F \, med y in S \, $ <rd:cross-pairing>]
  where $chevron.l thin \, thin chevron.r$ is the perfect alternating Weil form.
    This proves the assertions about orthogonal complements. Since the restrictions of this explicit pairing to
    either pure plane are zero as maps of the split complexes, their isotropy homotopies may be chosen to be zero.
    Only a product of two degree-one terms could map to the degree-two local invariant target;
    the degree-zero terms introduce no additional restriction.
    These zero homotopies agree on the strict subcomplex. These are the actual orthogonality data required in the
    Selmer duality construction #cite(label("Nekovar2006")) Theorem 6.3.4;
    the compatibility assertion is therefore an assertion about these displayed complexes and maps.
    Lemma  14 is used to retain this finite diagram together with the unchanged local data. ◻
]

We now construct global classes with these local coordinates,
  using the CM points $y_m in E \( H_m \)$ fixed in Section 4. For the fixed twist put $c = \| h \|$.
  If $I$ is a finite set of derivative primes, put $n = product_(ell in I) ell$;
  the points used for this set have conductor $c r n$.

Let $C_I$ denote the limiting Selmer complex with coefficients $T chi_h Psi$.
  Its local conditions are Kummer at $2 N$, full at the active primes dividing $h$ and at $r$,
  singular at the primes in $I$, and unramified elsewhere. At a new derivative prime $ell in.not I$,
  the unramified condition is the finite plane $F_ell$ of Lemma 25.
  Both plane conditions retain local $H^0$ and omit $H^2$, as in that lemma.
  The next result constructs the class $P_I$ in this complex;
  its two displayed localizations are taken at the newly added prime $ell$.

#thm([Lemma 5.2.])[
  (Descent and the switch at $2$).  #emph[Perform each finite ring-class construction and its weighted transfer
    before retaining its target-side data by the construction following Lemma 14.
    There is one integer $L eq.not 0$, depending on the fixed curve, parametrization and fixed local types,
    such that the classes obtained from the Heegner derivatives of $L$ times the point satisfy,
    for every finite switched set $I$,
#[#set math.equation(numbering: n => "(5.6)")
 $ P_I in H^1 \( C_I \) \, wide f \( P_(I union { ell }) \) = 0 \, wide s \( P_(I union { ell }) \) =
   J f \( P_I \) . $ <rd:switch>]

 The same $L$ works for every number of active and derivative primes.
   The previously imposed singular conditions are retained.]
] <rd:derivative>

#proof[
  We use Kolyvagin’s derivative operators #cite(label("Kolyvagin1990")),
    keeping their integral descent explicit at $2$. Choose the orientations coherently.
    The relative ring-class group at an inert prime $ell$ is cyclic of order $ell + 1$.
    For distinct new primes these groups form a product: the ring-class exact sequence has kernel the product of
    the local residue-unit quotients, and the only global units here are $1 \, - 1$,
    whose images in these quotients are trivial. Choose a generator $sigma_ell$ compatibly with the tame
    orientation in Lemma 25; its pro-$2$ component gives the coordinate $s$ at the retained precision. Set
  $ D_ell = sum_(i = 1)^ell i sigma_ell^i \, wide D_I = product_(ell in I) D_ell . $
  Direct multiplication gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ \( sigma_ell - 1 \) D_ell = \( ell + 1 \) - sum_(i = 0)^ell sigma_ell^i . $ <rd:derivative-identity>]
  The Hecke correspondence and reduction of its CM isogenies give, for every class-group translate,
  #[#set math.equation(numbering: n => "(5.8)")
   $ "Tr" \( y_(c r n) \) = a_ell y_(c r n \/ ell) \, wide tilde(y)_(c r n) =
     "Fr"_ell tilde(y)_(c r n \/ ell) . $ <rd:heegner-relations>]
  These are the point relations, not an application of a residual irreducibility theorem.
    A fixed multiple of the parametrization removes cuspidal terms.
  There is a uniform bound on the $2$-primary torsion over the union of the ring-class fields in use.
    To see this, choose a fixed nonidentity scalar homothety in the $2$-adic Tate image.
    Square a lift so that it belongs to every quadratic subgroup under consideration.
    Multiply it by its conjugate under complex conjugation. Its action on each ring-class field is trivial,
    because conjugation inverts the abelian ring-class action,
    while its action on $T$ is still a fixed nonidentity scalar.
    Write that scalar minus one as $2^e$ times a unit. Then $2^e$ kills the torsion in question.
    The existence of this fixed scalar, including the CM case, is the Tate-image input used in Lemma 20.
  Work first with coefficients modulo $2^a$. Require $a_ell$ and $ell +
    1$ to vanish to a precision substantially larger than $a$.
    Equations (5.7) and (5.8) then make the derivative Kummer class invariant under the relative ring-class group.
    In the inflation–restriction sequence, both the obstruction to descent and the ambiguity of descent are killed
    by $2^e$, since their coefficient module is killed by $2^e$.
    Multiplication by $2^(2 e)$ therefore gives a descent independent of this ambiguity:
    descend $2^e$ times the class and multiply its lift by $2^e$.
    There is no repetition of this factor for individual primes;
    descent is performed once from the field with the complete conductor.
  The target coefficient module is obtained by an integral transfer.
    For a finite Artin coefficient ring $A$, let $Delta = "Gal" \( H_(c r) \/ K \)$,
    through which the finite scalar and quadratic characters factor.
    Shapiro’s cochain map and the coefficient homomorphism
  $ A \[ Delta \] arrow.r A \, wide \[ sigma \] mapsto chi_h \( sigma \) Psi \( sigma \) $
  send the descended class to coefficients $T chi_h Psi$. For a universal quadratic family,
    replace the quadratic value by its group element in $A \[ G \]$, also including the fixed base character.
    Choose inverse actions on both sides when using that Shapiro convention.
    Explicitly, these maps are finite coset sums with the indicated scalar weights;
    there is no division by $\# Delta$. These chain maps, in all degrees, are used at this finite stage.
    Naturality of restriction and Kummer corestriction supplies their local lifts and comparison homotopies.
    Apply the maps to the classes and these witnesses before passing to bounded target models.
    Neither the complex over $H_(c r)$ nor its induced coefficient module $A \[ Delta \]$ is retained in the
    limiting diagram. We check the required target local conditions next.
  At a place over $2 N$ these descent extensions are unramified.
    For the identity component of a Neron model, the obstruction to unramified descent vanishes.
    Indeed, Lang’s theorem gives the assertion on the connected special fiber,
    and the successive formal-group quotients are additive residue-field modules,
    whose unramified cyclic cohomology vanishes by the normal-basis and trace calculation.
    Passing to the inverse limit of these quotients preserves the assertion.
    The remaining obstruction is killed by the geometric component-group order.
    Those orders have a uniform bound over unramified extensions of the finitely many fixed local twisting types.
    Include their product, the descent factor, and the parametrization factor in $L$.
    Thus the descended class has the integral Kummer condition at $2 N$.
    No good-ordinary or semistability condition was used. Transfer with the scalar character preserves this
    condition because $Psi = 1$ there.
  Here is the local calculation, including the division by two.
    Apply the derivatives at all primes other than $ell$, and write $X \,
    Y$ for the resulting lower and upper points. Put $F_ell = "Fr"_ell$.
    The lower field splits at the $K$-prime $\( ell \)$, since that ideal is principal.
    Reduction therefore gives $F_ell^2 tilde(X) = tilde(X)$. Good reduction identifies the prime-to-$ell$ torsion
    with the torsion of the reduced curve. In the following coordinate formulas, $F_ell$ acts on reduced points,
    where it satisfies its Frobenius polynomial. If $Q$ is a $2^a$-division point of $L X$,
    the finite coordinate of its Kummer class is
  #[#set math.equation(numbering: n => "(5.9)")
   $ f = \( F_ell^2 - 1 \) tilde(Q) = #scale(x: 120%, y: 120%)[\(] a_ell F_ell - \( ell + 1 \)
     #scale(x: 120%, y: 120%)[\)] tilde(Q) . $ <rd:finite-formula>]
  We give the descent-cocycle calculation of the other coordinate.
    Choose $Z$ with $2^a Z = L D_ell Y$, and choose the descended cocycle $b$ so that on the upper-field Galois
    group it is $b \( g \) = \( g - 1 \) Z$. A change by the already bounded descent ambiguity has no effect on
    the eventual limit. The crossed identity gives
  $ U = \( sigma_ell - 1 \) Z - b \( sigma_ell \) in E \( H_(c r n) \) . $
  For $g$ in the upper-field Galois group, compare the two expansions of $b \( g sigma_ell \)$; they give $g U =
    U$. Moreover,
  $ 2^a U = L #scale(x: 120%, y: 120%)[\(] \( ell + 1 \) Y - a_ell X #scale(x: 120%, y: 120%)[\)] . $
  Both integers $ell + 1 \, a_ell$ are divisible by $2^a$. Consequently
  $ U_0 = L frac(ell + 1, 2^a) Y - L a_ell / 2^a X $
  is an actual upper-field point with the same $2^a$-multiple as $U$.
    Thus $U - U_0$ is upper-field torsion of bounded exponent.
    This comparison with an actual integer quotient is what bounds the ambiguity;
    arbitrary division points would not give this bound. Reduction makes $sigma_ell$ act trivially and $tilde(Y) =
    F_ell tilde(X)$. Therefore reduction of $b \( sigma_ell \) = - U$ gives its singular coordinate
  #[#set math.equation(numbering: n => "(5.10)")
   $ s = #scale(x: 120%, y: 120%)[\(] a_ell - \( ell + 1 \) F_ell #scale(x: 120%, y: 120%)[\)] tilde(Q)
     $ <rd:singular-formula>]
  up to the uniformly bounded descent torsion already described.
    The Frobenius polynomial yields the exact operator identity
  #[#set math.equation(numbering: n => "(5.11)")
   $ \( F_ell - a_ell \) #scale(x: 120%, y: 120%)[\(] a_ell F_ell - \( ell + 1 \) #scale(x: 120%, y: 120%)[\)] =
     a_ell - \( ell + 1 \) F_ell . $ <rd:exact-frobenius>]
  Thus $s = \( F_ell - a_ell \) f$; when $a_ell$ vanishes at the retained torsion precision, this is $s =
    F_ell f$. Taking the Frobenius limit gives $s = J f$.
  For the new finite coordinate, reduction of the derivative point is
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(i = 1)^ell i F_ell tilde(X) = frac(ell \( ell + 1 \), 2) F_ell tilde(X) . $ <rd:half-factor>]
  The conductor extension at $ell$ is totally ramified, so a Frobenius lift may be chosen in the upper-field local
    Galois group. There the descended cocycle restricts to the Kummer cocycle of the derivative point.
    If $v_2 \( ell + 1 \) gt.eq a + 1$, its displayed reduction is $2^a$ times an $F_ell^2$-fixed point.
    Its finite Kummer coordinate is therefore zero modulo $2^a$. The additional $1$ is essential at $2$.
    It is imposed in the choice of the next precision, and does not multiply the class by a new denominator.
    Bounded torsion ambiguities disappear on passing from $E \[ 2^a \]$ to $E \[ 2^m \]$ with $a - m gt.eq e$.
    Choose $a$ and the Frobenius precision successively faster than $m$.
  The calculation is compatible with every translate in the transfer:
    transport the place and its Frobenius before applying that translate.
    The scalar weight on the lower and upper class is identical.
    Applying the same calculation at each $ell in I$ proves the earlier singular conditions as well.
  Finally complete the weighted transfer at each stage and retain the resulting target Selmer-cone cycles and
    their local lifts. An equality of the transferred local classes gives a boundary witness in the target local
    complex; retain that witness after contraction as well. For instance,
    retain the degree-zero vectors whose boundaries are the differences in the two switch identities.
    Include the split local Fox complexes, their zero isotropy homotopies, and the target comparison matrices.
    The target-side construction in Section 4 proves that this is a bounded diagram for each fixed active support
    and finite switched set. Its bound is independent of the degrees of the ring-class fields.
    When a further derivative prime is selected, extend the same original finite-stage diagram and its contraction
    maps, using the same inner ultrafilter. Do not construct an unrelated cohomologically equivalent old complex.
    The earlier evaluations, including all degree-two cocycle identities,
    are consequently retained by the same contraction maps after each new switch.
    Lemma  14 applies to these extended diagrams. Their limiting classes give (5.6).
    The displayed local formulas agree with the calculation underlying #cite(label("Howard2012"))
    Proposition 1.7.4; Howard’s odd-prime global hypotheses are not being asserted at $2$. ◻
]

===== 5.1.1 The paired arithmetic determinant. <the-paired-arithmetic-determinant.>

All the target classes and comparison maps are constructed in the same finite diagram.
  At each Artin precision, use the character of Proposition 16, the global Selmer cone,
  and the Kummer complexes at $2 N$. At a derivative prime impose enough Frobenius precision for Lemma 26 and also
  $ell^2 equiv 1 med \( mod med 2^(a + 1) \)$ at every retained quotient killed by $2^a$.
  Lemma 25 then gives the finite, singular, strict and relaxed inclusions with their common zero isotropy
  homotopies. Applying the actual global duality morphism (4.7) constructs their integral localization and duality
  triangles. Perform the descent and weighted transfers of Lemma 26 at each finite stage.
  Include their target cycles, local Kummer lifts and target boundary witnesses in this diagram before applying
  Lemmas 13 and 14, using only the target-side data. All remaining maps have bounded target models as both source
  and target; the ring-class source complexes are not among these objects.

A further switch extends these original finite stages, their contractions and their fixed inner ultrafilter.
  Theorem  24 therefore retains the same degree-zero, degree-one and degree-two evaluations and the exact-kernel
  restrictions. In particular, the old evaluations are not replaced by maps on an independently chosen equivalent
  complex.

Here is how a class produces its paired functional. Work over a height-one localization where the full local
  complexes at the active primes and $r$ are acyclic. By Lemma 17 this includes $cal(O)$ and every
  characteristic-zero test used below. These complexes have integral contractions.
  They identify the relaxed Selmer complex with its orthogonal complex;
  at switched primes the plane condition is already self-dual,
  and at $2 N$ the integral Kummer condition is self-dual. Lift the class through this comparison and compose it
  with the retained global duality map. The result is a closed degree-two functional $lambda_I$,
  integral up to the single initial multiplier and any fixed old-support correction.
  Thus it is not an arbitrarily chosen rational cohomology dual.

When the generic cohomology has dimension one in degrees one and two and is zero elsewhere,
  define $u_I$ to be the coordinate of

$ \[ P_I \] ⊗ \[ lambda_I \] in H^1 \( C_I \) ⊗ H^2 \( C_I \)^(*) tilde.eq cal(D) \( C_I \) $

over the fraction field, in the fixed integral determinant basis.
  For an acyclic constituent set this class-dual coordinate to zero.
  The generic functional is determined by the same derived duality at all localizations;
  different local contractions represent that functional, not one cochain asserted to be integral everywhere.
  For $I = diameter$ write $u_h$. The rank-one assertions needed for the arithmetic applications are verified
  below by rational central specialization.

The arithmetic switch must now be compared in these determinant lattices.
  A localized class may be divisible by $2$; the next lemma shows that such a division does not cost a factor at
  each switch.

#thm([Lemma 5.3.])[
  (Exact determinant switch over a DVR).  #emph[Let $O$ be a DVR with fraction field $F_O$.
    Suppose that integral perfect complexes $C_(upright("str")) \, C_F \, C_S \, C_(upright("rel"))$,
    their localization triangles, and their dualities are the base changes of the diagram in Lemma 25.
    Suppose the generic cohomology of these four global complexes is concentrated in degrees one and two,
    that $H^1 \( C_F ⊗ F_O \) = F_O A$, and
$ f \( A \) = v_0 eq.not 0 \, wide s \( B \) = J v_0 \, wide f \( B \) = 0 $

 for a class $B$ in the switched complex. The determinant tensors are formed from each class and its functional
   under these same dualities. Then the switched generic cohomology has rank one, is spanned by $B$, and
#[#set math.equation(numbering: n => "(5.13)")
 $ v_O \( u_F \) = v_O \( u_S \) . $ <rd:valuation-switch>]

 Neither localization is required to be primitive.]
] <rd:det-switch>

#proof[
  For this proof only, cohomology without a coefficient ring means cohomology over $F_O$.
    Nonzero localization of $A$ gives $H^1 \( C_(upright("str")) \) = 0$.
    The relaxed localization image is self-annihilating in $F xor S$, so it has dimension two.
    It contains the two independent vectors $\( v_0 \, 0 \)$ and $\( 0 \, J v_0 \)$ in the opposite planes.
    Its intersections with either plane are therefore exactly one-dimensional. This proves the generic rank assertions.
  Put $V = H^1 \( C_(upright("rel")) \)$, with ordered basis $A \, B$.
    Duality identifies $H^2 \( C_(upright("str")) \)$ with $V^(*)$; denote the dual basis by $A^(*) \, B^(*)$.
    The two integral triangles are
  #[#set math.equation(numbering: n => "(5.14)")
   $ C_(upright("str")) arrow.r C_F arrow.r F \[ - 1 \] arrow.r \, wide C_(upright("str")) arrow.r C_S arrow.r
     S \[ - 1 \] arrow.r . $ <rd:triangles>]
  Their fraction-field exact sequences are
  $ 0 arrow.r F_O A arrow.r F arrow.r^(delta_F) V^(*) arrow.r F_O A^(*) arrow.r 0 $
  and the same sequence with $A \, F \, A^(*)$ replaced by $B \, S \, B^(*)$.
    The boundary is the dual of the relaxed localization. In view of (5.5) and $s \( B \) = J v_0$, it satisfies
  #[#set math.equation(numbering: n => "(5.15)")
   $ delta_F \( x \) = epsilon.alt_F chevron.l x \, v_0 chevron.r B^(*) \, wide
     epsilon.alt_F in O^times . $ <rd:boundary>]
  Choose $x in F ⊗ F_O$ with $delta_F \( x \) = B^(*)$. Then $v_0 and
    x$ has unit volume in the integral determinant lattice $det_O F$,
    because the alternating form on $F$ is unimodular and $chevron.l x \, v_0 chevron.r$ is a unit.
    Although $x$ can be nonintegral, this assertion about its exterior product is an equality of lattices.
    Similarly choose $y in S ⊗ F_O$ mapping to $A^(*)$. The volume of $J v_0 and y$ is a unit in $det_O S$.
  The determinant isomorphisms of the two exact sequences send
  $ A ⊗ \( A^(*) \)^(*) quad upright("and") quad B ⊗ \( B^(*) \)^(*) $
  respectively, up to units and the irrelevant determinant sign, to
  #[#set math.equation(numbering: n => "(5.16)")
   $ \( A^(*) and B^(*) \)^(*) ⊗ \( v_0 and x \) \, wide \( A^(*) and B^(*) \)^(*) ⊗ \( J v_0 and y \) .
     $ <rd:common-tensor>]
  These comparisons take place in $cal(D) \( C_(upright("str")) \) ⊗ det F$ and $cal(D) \( C_(upright("str")) \) ⊗
    det S$. The two plane determinants are identified by a unimodular map.
    Hence the two coordinates have the same valuation.
  This also explains exactly where the finite indices go. For a two-term elementary summand
    $\[ O arrow.r^(pi^d) O \]$ in degrees one and two, its contribution to the coordinate in $cal(D)$ is
    $pi^(- d)$. Such summands, including those arising from nonprimitive localization,
    occur inside the integral isomorphisms (5.14). They are not discarded when writing (5.16).
    All strict torsion contributions are common to the two sides.
    The argument does not ask for an integral complement to $v_0$; for example $v_0 =
    2^d e_1$ is paired with the fractional vector $2^(- d) e_2$, whose exterior product with $v_0$ has unit volume. ◻
]

=== 5.2 Rank reduction and the outer DVR <rd:outer-subsection>

The local switch preserves a determinant valuation. We now use it to reduce the dimension of any larger
  specialized Selmer space until a nonzero minor controls that valuation.
  The first argument handles each characteristic-zero height-one prime.
  A second, outer limit turns a hypothetical sequence of unbounded losses at $\( 2 \)$ into the same rank
  reduction problem.

#thm([Lemma 5.4.])[
  (Selecting a rank-two evaluation).  #emph[Let $cal(G)$ be a group,
    $H$ a normal subgroup acting trivially on an absolutely irreducible representation $W$ over a field $F_O$,
    and suppose that restriction of the relevant cohomology classes to $H$ is injective.
    For two independent classes, their joint evaluations on $H$ span $W xor W$.
    If the finite localization is the rank-two projection supplied by $1 + tau$ on the induced representation,
    some actual evaluation has rank two. One of the two classes may be any prescribed nonzero class.]
] <rd:rank-two>

#proof[
  On $H$ a crossed homomorphism is an additive homomorphism, and its image is equivariant for $cal(G)$.
    A proper submodule of $W xor W$ dominating both factors would impose a nonzero scalar linear relation on the
    two evaluations: the direct sum of two simple modules is semisimple, and $"End"_(cal(G)) \( W \) = F_O$.
    That relation, followed by injectivity of restriction, would contradict independence of the classes.
    Thus the joint span is the whole direct sum. Projecting by $1 +
    tau$ gives all pairs in the two-dimensional finite plane.
  It remains to pass from a span to a single element of the additive evaluation image $U$.
    If the determinant quadratic polynomial $Q$ vanished on $U$, then its polar form $Q \( u + v \) - Q \( u \) -
    Q \( v \)$ would vanish for $u \, v in U$. Consequently
  $ Q #scale(x: 180%, y: 180%)[\(] sum_i a_i u_i #scale(x: 180%, y: 180%)[\)] = sum_i a_i^2 Q \( u_i \) +
    sum_(i < j) a_i a_j #scale(x: 120%, y: 120%)[\(] Q \( u_i + u_j \) - Q \( u_i \) -
    Q \( u_j \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  It would vanish on the entire field span, where it is not the zero polynomial.
    This contradiction proves the assertion. This polarization argument is valid in characteristic two as well. ◻
]

#thm([Proposition 5.5.])[
  (Nonnegative valuations away from $\( 2 \)$).  #emph[Assume the simultaneous diagrams, derivative classes,
    and exact-kernel evaluation maps of Lemmas 19, 20, 25, and 26.
    For a primitive constituent whose generic cohomology has rank at most one in degrees one and two and zero
    elsewhere, its class-dual determinant coordinate belongs to $Lambda \[ 1 \/ 2 \]$.
    This includes a simple-zero constituent and a base with $2^oo$-Selmer corank one.]
] <rd:away-two>

#proof[
  The zero coordinate needs no argument. Otherwise the generic rank is one and the class spans it.
    Localize at a height-one prime $frak(p) eq.not \( 2 \)$, and denote the residue field by $F_O$.
    Its characteristic is zero. Lemma 17, the degree-zero local conditions,
    and duality give zero fiber cohomology in degrees zero and three.
    Canceling unit blocks therefore gives a free DVR model in degrees one and two.
    A primitive vector in its generic kernel has nonzero image in its $frak(p)$-fiber:
    the kernel of a map of free modules over a DVR is saturated. Include this vector in each localization test.
    The two-sign reduction below has the same pattern as #cite(label("Howard2012")) Lemmas 1.5.3 and 1.6.4;
    the integral switch and the evaluation hypotheses needed here at $2$ have been constructed above.
  Suppose first that $Psi^2 eq.not 1$ on $F_O$. Inertia at $r$ distinguishes the two summands of the induced
    representation. The Tate representation over $K$ is absolutely irreducible in characteristic zero:
    this follows from the open Tate image, or from its CM normalizer when $K$ is not the CM field.
    Thus the induced representation is absolutely irreducible.
    If the test Selmer dimension is $s > 1$, Lemma 28 and the finite Chebotarev realization in Lemma 23 give a
    derivative prime with rank-two finite localization, nonzero on the chosen primitive vector.
  Poitou–Tate duality now determines the effect on the fiber.
    The relaxed localization image is a self-annihilating plane.
    It contains the whole finite plane, and hence equals that plane.
    The strict kernel has dimension $s - 2$, and its replacement by the singular condition adds no new class.
    The fiber dimension therefore drops by two. On the generic field, the localization is nonzero,
    so Lemmas 26 and 27 preserve generic rank one, the nonzero derivative class, and the determinant valuation.
  If $Psi^2 = 1$, use conjugation, including its action $\( 1 + t \) mapsto \( 1 + t \)^(- 1)$,
    to split the fiber into two signs. All prior plane conditions are stable under this involution in the split
    local model. The two Galois summands are nonisomorphic absolutely irreducible representations;
    the only CM quadratic self-twist has been excluded. Each sign has one finite and one singular coordinate.
    The local pairing in a sign is a nondegenerate symmetric hyperbolic pairing,
    whose only isotropic lines in characteristic zero are the finite and singular axes.
    If both signs occur globally, choose one class from each,
    including a nonzero component of the primitive vector, to obtain the same rank-two reduction.
  If only one sign occurs and $s > 1$, choose a rank-one finite localization nonzero on that vector.
    In this sign the relaxed image is the finite line. In the other sign its intersection with the finite line is
    zero, and self-duality forces it to be the singular line.
    A switch retains the old strict kernel of dimension $s - 1 gt.eq 1$, introduces the other sign,
    and preserves the total dimension. The next rank-two switch reduces it.
    After finitely many such operations the fiber dimension is one.
    It cannot fall below one, since a primitive vector from the generic rank-one kernel survives after each switch.
  At fiber dimension one, a minimal self-dual model over the DVR has one free term in each of degrees one and two
    and zero differential. The class and paired functional are integral at this height-one prime.
    Their determinant coordinate is therefore integral. Reversing (5.13) proves nonnegative valuation at
    $frak(p)$. Applying this at every height-one prime other than $\( 2 \)$,
    and using that the normal ring $Lambda$ is the intersection of its height-one valuation rings inside its
    fraction field, gives membership in $Lambda \[ 1 \/ 2 \]$.
  For the stated arithmetic instances, the rational central specialization has Selmer dimension one and no
    invariants. Upper semicontinuity bounds the generic dimension by one.
    If the generic class is nonzero, it spans this space. This uses Selmer corank at an unknown base and does not
    replace that corank by Mordell–Weil rank. ◻
]

#thm([Lemma 5.6.])[
  (The terminal minor estimate).  #emph[Let
$ C_i = \[ thin O_i^n arrow.r^(D_i) O_i^n thin \] $

 be based complexes over DVRs with uniformizer $2$, with generic rank-one kernel.
   Let $z_i in ker D_i$ be integral, and let $lambda_i in 2^(- a) \( O_i^n \)^(*)$ annihilate $"im" D_i$,
   where $a$ is fixed. If an $\( n - 1 \)$-minor $Delta_i$ has $v \( Delta_i \) lt.eq b$,
   the determinant coordinate $u_i$ of $z_i ⊗ lambda_i$ satisfies
#[#set math.equation(numbering: n => "(5.17)")
 $ v \( u_i \) gt.eq - a - b . $ <rd:minor-bound>]

]
] <rd:minor>

#proof[
  Permute rows and columns so that the minor is the upper-left block $A_i$.
    Write $D_i = mat(delim: "(", A_i, b_i; c_i, d_i)$. Since its rank is $n - 1$, its Schur complement is zero.
    Over the fraction field, use the triangular basis changes with entries $A_i^(- 1) b_i \,
    c_i A_i^(- 1)$ to leave $A_i$ and a zero one-by-one block. These triangular changes have determinant one.
    If $alpha_i$ is the last coordinate of $z_i$ and $beta_i$ the value of $lambda_i$ on the last target basis
    vector, cancellation gives exactly
  #[#set math.equation(numbering: n => "(5.18)")
   $ u_i = plus.minus frac(alpha_i beta_i, det A_i) . $ <rd:minor-formula>]
  Here $alpha_i in O_i$ and $beta_i in 2^(- a) O_i$. This proves (5.17).
    If $n = 1$, the empty minor is $1$ and the same formula applies. ◻
]

#thm([Proposition 5.7.])[
  (Uniform residual valuation from outer rank reduction).  #emph[Assume all of the following properties of a
    collection of primitive ring instances:]
  + #emph[after any fixed number of switches, minimal $cal(O)$-models have size bounded independently of $h$ and
    of $K$ with $omega \( k \) lt.eq A$;]
  + #emph[the all-sequence evaluation and exact-kernel restriction of Proposition 21,
    and the finite Chebotarev realization of Lemma 23, hold for these models,
    retaining their degree-two cocycle identities;]
  + #emph[the integral localization and duality diagrams and the derivative classes of Lemma 26 survive this same
    outer limit; the class and its closed dual functional have a common bounded clearing exponent.]
  #emph[Then there is $C \( E \, A \)$ such that
#[#set math.equation(numbering: n => "(5.19)")
 $ v_(\( 2 \)) \( u \) gt.eq - C \( E \, A \) $ <rd:residual-bound>]

 for every simple-zero ring instance. The hypotheses refer to a single simultaneous construction.
   In particular, separate abstract models realizing its individual cohomology groups do not establish this
   proposition’s arithmetic applicability.]
] <rd:outer-bound>

#proof[
  The preceding paired-diagram construction supplies the common clearing exponent in the arithmetic application.
    The bound on minimal sizes is Lemma 18; in particular, active conductor primes do not contribute to that size
    after residual localization.
  Suppose that $v_(\( 2 \)) \( u_i \) arrow.r - oo$. All these coordinates are nonzero.
    First put the complexes into square two-term form. At the residual $Omega$-test,
    moving-prime inertia excludes global invariants, and the local degree-zero conditions identify Selmer
    invariants with those global invariants. Thus $H^0 = 0$. The retained self-duality gives $H^3 =
    0$ and equal dimensions in degrees one and two. A minimal $cal(O)$-model therefore has only two free terms,
    of equal rank, in those degrees; all other terms cancel in integral disks.
    Fix a nonprincipal ultrafilter $cal(U)$ and fix the bounded rank on an ultrafilter-large set. Write these models as
  $ C_i = \[ thin O_i^n arrow.r^(D_i) O_i^n thin \] . $
  Transport the class, the uniformly cleared functional, all evaluation matrices,
    and the finitely many retained comparison maps and boundary witnesses through these integral disk
    contractions. Their entries remain integral and their identities remain exact.
    The individual active-place complexes, whose number may grow with the outer instance,
    are not retained as an outer list of objects. Their effect has already been incorporated in the target cone
    and its determinant; only the bounded minimal models and the fixed number of switch diagrams enter this limit.
  Apply Proposition 21 to these models and their retained integral diagrams.
    It gives a DVR $O_oo$ with uniformizer $2$, characteristic-zero fraction field $F_oo$,
    and injective all-sequence evaluation, including restriction to the product of the exact inner kernels.
    The induced representation uses one simultaneous complex conjugation,
    so the sequence group over the quadratic fields has index two in the rational sequence group.
    Lemma  22 gives absolute irreducibility over $F_oo$: the moving inertia character has infinite order,
    and the finite Tate-matrix witness survives the outer quotient.
  The outer complex may have more cohomology than any inner generic complex.
    Its new cycles can be represented by vectors $w_i$ for which $v \( D_i w_i \) arrow.r + oo$,
    without exact inner lifts. The retained degree-two evaluation matrices are integral,
    so the evaluations of $D_i w_i$ also tend to zero. This is the part of Proposition 21 that makes these new
    classes available for the following rank reduction.
  Choose in each inner generic kernel a primitive vector $v_i$.
    Some coordinate is a unit on a set in $cal(U)$, so its outer limit is nonzero.
    Thus the outer kernel has dimension at least one. If that dimension is $s > 1$,
    apply Lemma 28 to two outer classes, one the surviving primitive vector.
    Realize their rank-two evaluation by inner derivative primes.
    This realization only asks for finite quotients at each stage.
    For an approximate inner cocycle one chooses the retained precision below the valuation of its coboundary;
    no exact inner lift of the extra outer class is being assumed.
  More explicitly, retain the original inner index $i$ for outer instance $j$, its ultrafilter $cal(U)_j$,
    and the outer ultrafilter $cal(U)$. Represent the selected kernel element by $u_j = \( u_(j \, i) \)_i$.
    At stage $\( j \, i \)$, apply finite Chebotarev to this actual element and the old finite data to choose
    $ell_(j \, i)$. Adjoin its local complexes, the derivative cocycle and the pairing homotopies to the same
    original stage diagram with its old contractions. Take the same $cal(U)_j$ and then the same $cal(U)$.
    The retained coefficient precision may increase more slowly, but cofinally;
    the earlier maps and their arbitrary evaluations are not reconstructed by an independent choice of subsequence
    or model.
  The localization of $v_i$ is generically nonzero on a set in $cal(U)$: its outer image is nonzero.
    Therefore the original inner spanning class also localizes nontrivially,
    even if its multiple of $v_i$ has large valuation. Lemma 27 preserves each inner determinant valuation
    exactly. On the outer field, the relaxed image is the finite plane and the singular switch lowers $s$ by two,
    by the same localization exact sequence as in Proposition 29.
    The new inner generic kernels again supply primitive vectors, so the outer rank remains at least one.
  Only finitely many switches are necessary: the initial outer rank is bounded and drops by two.
    After each fixed number of switches the required model-size bound remains available.
    At the terminal outer rank one, the outer differential has a nonzero maximal boundary minor.
    Its inner determinants $Delta_i$ have one finite valuation on a set in $cal(U)$, by the definition of $O_oo$.
    Lemma 30 then gives a fixed lower bound on $v \( u_i \)$, a contradiction.
  This proof uses the minor only after rank reduction. Bounded matrix size alone would not suffice:
    the matrices $\[ 2^i \]$ have bounded size and unbounded torsion length.
    In that example the entire matrix becomes zero in the outer quotient;
    the rank-reduction and evaluation hypotheses would have to supply additional arithmetic operations before a
    nonzero terminal minor could be used. ◻
]

=== 5.3 Central specialization and the local indices <rd:specialization-subsection>

The preceding bounds concern the deformed determinant. We next identify its value at $t =
  0$ with the index of the original Heegner point and the finite Shafarevich–Tate lengths.
  The comparison retains the whole integral complex; in particular,
  every active split conductor prime has an explicit local contribution.

#thm([Lemma 5.8.])[
  (Derived specialization at constant rational rank).  #emph[Let $C$ be a perfect $Lambda$-complex and put $C_0 =
    C ⊗_Lambda^(upright(bold(L))) bb(Z)_2$, where $t = 0$. Suppose its generic rational cohomology and its central
    rational cohomology both have dimension one in degrees one and two and are zero in other degrees.
    Put $A = Lambda_(\( t \))$, with residue field $bb(Q)_2$.
    Let $z$ be a degree-one cycle and $lambda$ a closed degree-two functional in a finite free model of
    $C ⊗_Lambda A$, and let $z_0 \, lambda_0$ be their images under $A arrow.r bb(Q)_2$.
    Then the generic determinant tensor $\[ z \] ⊗ \[ lambda \]$ is regular at $\( t \)$ and specializes,
    under the determinant base-change isomorphism, to $\[ z_0 \] ⊗ \[ lambda_0 \]$.
    Its central valuation is computed from the entire integral complex $C_0$, including its torsion cohomology.
    It cannot be computed by substituting the naive quotient of $H^1 \( C \)$ by $t$.]
] <rd:derived-specialization>

#proof[
  Represent $C$ by a bounded free complex. Derived reduction is its termwise reduction,
    so the determinant line itself commutes with specialization. For clarity, the cohomology base-change sequence is
  #[#set math.equation(numbering: n => "(5.20)")
   $ 0 arrow.r H^i \( C \) \/ t H^i \( C \) arrow.r H^i \( C_0 \) arrow.r H^(i + 1) \( C \) \[ t \] arrow.r
     0 . $ <rd:tor-basechange>]
  These last terms are the relevant $"Tor"_1$ terms. Diagonalize the complex over the DVR $A$,
    or over its completion $bb(Q)_2 \[ \[ t \] \]$. A nonunit pivot would create an additional central cohomology
    class in its two adjacent degrees. The assumed constant dimensions exclude such pivots.
    Thus over $bb(Q)_2 \[ \[ t \] \]$ there are only invertible disks and the two free cohomology lines.
    The rational class-dual tensor consequently specializes to the stated central tensor.
    Over $bb(Z)_2$, all elementary divisors of $C_0$, including the torsion supplied by (5.20),
    remain in its determinant isomorphism. This proves the assertion. ◻
]

#thm([Lemma 5.9.])[
  (A ramified good odd place).  #emph[Let $F_v \/ bb(Q)_p$ be unramified, $p eq.not 2$, and let $T' =
    T_2 \( E \) ⊗ chi$, where $E$ has good reduction and $chi$ is ramified quadratic. Then
#[#set math.equation(numbering: n => "(5.21)")
 $ H^0 \( F_v \, T' \) = 0 \, wide H^1 \( F_v \, T' \) = E^chi \( F_v \)_2^and \, wide
   "length"_(bb(Z)_2) H^2 \( F_v \, T' \) = dim_(bb(F)_2) E \[ 2 \]^("Fr"_v) . $ <rd:local-length>]

 The quotient of the full local complex by the integral Kummer condition therefore contributes precisely this last
   length in degree two.]
] <rd:active-local>

#proof[
  The pro-$2$ tame inertia generator acts by $- 1$. Its complex has differential $- 2$,
    so its cohomology is zero in degree zero and $T' \/ 2 T'$ in degree one. Taking residue-field cohomology gives
  $ H^1 \( F_v \, T' \) tilde.eq E \[ 2 \]^("Fr"_v) \, wide
    H^2 \( F_v \, T' \) tilde.eq E \[ 2 \] \/ \( "Fr"_v - 1 \) E \[ 2 \] . $
  The possible residue-cardinality factor on inertia cohomology is one modulo $2$.
    Kernel and cokernel of an endomorphism of a finite vector space have the same dimension,
    proving the length assertion.
  The integral local Kummer exact sequence identifies the $2$-adic completion of the points with all of
    $H^1 \( F_v \, T' \)$. Indeed the inverse Tate module of the local Weil–Chatelet group is zero here:
    local duality identifies its $2$-primary part with the dual of the finite completion of the point group.
    The point completion is finite because the residue characteristic is odd.
    Equivalently, inertia $- 1$ implies that the local $2$-primary torsion is exactly the Frobenius-fixed
    $2$-torsion. The Kummer complex includes the derived invariants of this finite module on reduction,
    as in Lemma 15. The quotient therefore has exactly the degree-two cohomology displayed above. ◻
]

#thm([Proposition 5.10.])[
  (The central determinant formula).  #emph[Suppose the product
$ L \( E^(\( h \)) \, s \) L \( E^(\( h k \)) \, s \) $

 has a simple zero at $s = 1$. Use the primitive Heegner sum $P_h$ and its free-line index $j_h$ defined at the
   start of Section 4, and put
$ s \( h \) = "length"_(bb(Z)_2) "Sha" \( E^(\( h \)) \/ bb(Q) \) \[ 2^oo \] . $

 Use the primitive Selmer determinant coordinate $u_h$ with the fixed class multiplier of Lemma 26.
   For the primitive Selmer diagrams constructed above, we have
#[#set math.equation(numbering: n => "(5.22)")
 $ v \( u_h \( 0 \) \) & = 2 j_h - "length"_(bb(Z)_2) "Sha" \( E^(\( h \)) \/ K \) \[ 2^oo \] -
   2 sum_(p divides h) t_p + O_E \( 1 \)\
 & = 2 j_h - s \( h \) - s \( h k \) - 4 w \( h \) + O_(E \, A) \( 1 \) \, wide omega \( k \) lt.eq
   A . $ <rd:central-value>]

 The first error includes the auxiliary prime and the fixed parametrization multiplier.
   The second has no dependence on the number of primes dividing $h$.]
] <rd:central-formula>

#proof[
  The two rational twists have analytic ranks zero and one.
    The forward low-analytic-rank theorems give finiteness of their whole Shafarevich–Tate groups;
    equivalently the Heegner simple-zero theorem over $K$ gives rank one and finite Shafarevich–Tate group there.
    Thus all finite lengths in this proof refer to known finite groups.
  The specialization comparison is made at each finite stage, before the target data are retained.
    Put $c = \| h \|$. At the split auxiliary prime $r_i$, the point distribution relation is
  $ "Tr"_(H_(c r_i) \/ H_c) \( y_(c r_i) \) = \( a_(r_i) - sigma_(r_i) - sigma_(macron(r)_i) \) y_c \, $
  where the two Artin symbols have inverse ring-class actions.
    At $t = 0$, the scalar character is trivial, while the rational quadratic character has value
    $chi_h \( r_i \)$ on both symbols. The completed weighted sum therefore gives exactly $L m_i P_h$,
    where $m_i = a_(r_i) - 2 chi_h \( r_i \)$.
  This point identity is retained on bounded target complexes as follows.
    Let $C_h^(upright("Kum"))$ be a fixed free model of the ordinary Kummer Selmer complex over $K$,
    and let $b_h$ represent the Kummer class of $P_h$. At the retained coefficient precision,
    enlargement of the ramification set and relaxation at the active and auxiliary primes give a target comparison
    $j_i : C_h^(upright("Kum")) \/ 2^i arrow.r C_i \/ \( t \)$.
    Each retained local condition is an isomorphism on degree zero and an injection on degree one,
    so the Selmer-cone exact sequence injects its degree-one cohomology into global cohomology.
    Kummer naturality and the point relation therefore give, after contraction, a target degree-zero vector $v_i$ with
  $ z_i \( 0 \) - L m_i j_i \( b_h \) = d v_i . $
  Include this vector, the comparison matrix, and the associated local localization triangles in the same target
    diagram. Their ranks are bounded for this fixed $h \, K$, independently of $r_i$ and of $\[ H_(c r_i) : K \]$.
    All statements are reduced to the same slower cofinal precision if needed.
    Lemma 14 now retains the displayed boundary identity. The trace bound gives $v_2 \( m_i \) lt.eq c_E$;
    hence their limit $m in upright(bold(Z))_2$ on the same ultrafilter is nonzero and has $v_2 \( m \) lt.eq
    c_E$. The active local quotients specialize to Lemma 33, and the Kummer conditions at $2 N$,
    including their differential lattices, are unchanged. The central point is therefore nonzero,
    so generic and central rational cohomology both have rank one.
  To specialize the paired functional, choose its representative over $Lambda_(\( t \))$.
    At an active ramified prime, inertia minus one is $- 2$, a unit in this ring.
    At $r$, the central Frobenius determinants are nonzero by the trace bound.
    Their local complexes thus contract over $Lambda_(\( t \))$.
    Composing these contractions with retained global duality gives the same generic functional as the
    contractions over $cal(O)$, and specializes to rational central Kummer duality.
    Lemma 32 applies to this representative; no regularity is claimed for an arbitrary $cal(O)$-cochain
    representing the functional.
  The ordinary integral Kummer complex has compact Selmer cohomology in degree one.
    Its degree-two torsion has length equal to that of the finite quotient of the discrete Selmer group by its
    maximal divisible subgroup. This follows by derived base change to $bb(Q)_2 \/
    bb(Z)_2$ and the exact local Kummer conditions; the base-change terms must be retained.
    Here that quotient is $"Sha" \( E^(\( h \)) \/ K \) \[ 2^oo \]$.
    The free parts of degrees one and two are paired unimodularly by integral duality.
    Torsion in degree one and its dual contribution in degree three have bounded length,
    by the fixed-scalar bound on global torsion.
  For completeness, an elementary divisor of size $2^d$ whose cokernel is in degree $i$ contributes
    $\( - 1 \)^(i + 1) d$ to the coordinate in the inverse determinant.
    Consequently the degree-two Shafarevich–Tate torsion subtracts its length.
    On the free line, a point of index $2^(j_h)$ and its functional each contribute $j_h$, giving $2 j_h$.
  At an active prime $p divides h$, both primes of $K$ above $p$ are governed by Lemma 33, each with length $t_p$.
    Relaxation therefore subtracts exactly $2 t_p$. There is no bound hiding an error at every such prime.
    At $r$, the central scalar character is trivial; the local degree-two determinant has the valuation of $r +
    1 - a_r chi_h \( r \)$ at each split place. The trace condition
  $ v_2 \( 2 - a_r \) \, med v_2 \( 2 + a_r \) lt.eq c_E \, wide v_2 \( r - 1 \) > c_E $
  makes both valuations at most $c_E$. It also bounds the trace multiplier $a_r -
    2 chi_h \( r \)$ on the central point. At primes over $2 N$ the integral Kummer condition is retained.
    The local twisting types form a fixed finite set and $K$ is split there; all comparison indices,
    including those of Neron differential lattices at $2$, are therefore bounded in terms of $E$.
    This proves the first equality, using Lemma 32 to compare the generic tensor with the central tensor.
  We spell out the quadratic comparison needed for the second equality. Set
  $ A_h = "Res"_(K \/ bb(Q)) \( E_K^(\( h \)) \) \, wide B_h = E^(\( h \)) times E^(\( h k \)) . $
  There are isogenies in both directions whose composites are multiplication by $2$.
    The isogeny-invariance identity for the BSD quotient, with finite Shafarevich–Tate groups, is
  #[#set math.equation(numbering: n => "(5.23)")
   $
     frac(\# "Sha" \( A_h \) "Reg" \( A_h \) "Per" \( A_h \) product_p c_p \( A_h \), \# A_h \(
     bb(Q) \)_(upright("tors")) \# A_h^or \( bb(Q) \)_(upright("tors"))) =
     frac(\# "Sha" \( B_h \) "Reg" \( B_h \) "Per" \( B_h \) product_p c_p \( B_h \), \# B_h \(
     bb(Q) \)_(upright("tors")) \# B_h^or \( bb(Q) \)_(upright("tors"))) . $ <rd:isogeny-identity>]
  Regulators and periods are taken with compatible dual and Neron normalizations.
    This is the Cassels–Tate isogeny identity. The elliptic-curve local-measure formula is due to Cassels
    #cite(label("Cassels1965")) Theorem 1.1. For the general abelian-variety identity used here,
    see the proof of #cite(label("MilneADT2006")) I, Theorem 7.3, especially (7.3.1),
    pp. 97–100 and #cite(label("DokchitserDokchitser2010")) Section 4.1.
    This identity requires finite Shafarevich–Tate groups, as already established at these noncentral twists,
    but does not assume the BSD conjecture. The fixed-degree composites bound the rank-one regulator indices,
    the torsion ratios, and the differential and period indices by fixed powers of $2$. The identity is essential:
    a statement that the maps on Shafarevich–Tate groups have kernel and cokernel killed by $2$ would not bound
    their lengths uniformly.
  At every split prime of $K \/ bb(Q)$ the component factors of $A_h$ and $B_h$ agree.
    In particular this cancels all primes dividing $h$. At an odd prime $p divides k$ outside $2 N$,
    the curve over $K$ has good reduction. Its Weil restriction has connected special fiber:
    the reduction of Weil restriction over the ramified quadratic extension is an extension of the good special
    fiber by a connected additive group. Thus its component factor is $1$.
    Of the two rational twists, one is good and the other is ramified quadratic with good original curve.
    The latter has $2$-part of its component number equal to $2^(t_p)$.
    This follows as well from the ramified tame description in Lemma 33:
    its connected reduction is unipotent, and its local $2$-primary torsion is the fixed $2$-torsion.
    At other good nonsplit places the component factors are $1$;
    at $2 N$ there are only the fixed local comparisons. Taking valuations in (5.23) therefore gives
  #[#set math.equation(numbering: n => "(5.24)")
   $ "length" "Sha" \( E^(\( h \)) \/ K \) \[ 2^oo \] = s \( h \) + s \( h k \) + sum_(p divides k) t_p +
     O_E \( 1 \) . $ <rd:sha-comparison>]
  Since $0 lt.eq t_p lt.eq 2$, the sum over $k$ is at most $2 A$.
    Substituting this equality and $2 sum_(p divides h) t_p = 4 w \( h \)$ proves the result. ◻
]

#proof[
  The arithmetic diagrams constructed with Lemma 26, their paired functionals,
    and the model bound of Lemma 18 give the hypotheses of Propositions 29 and 31.
    Those propositions give nonnegative height-one valuations away from $\( 2 \)$ and a lower bound $-
    C \( E \, A \)$ at $\( 2 \)$. Normality of $Lambda$ gives $2^(C \( E \, A \)) u_h in Lambda$.
    Its constant coefficient has valuation at least $- C \( E \, A \)$. Apply (5.22). ◻
]

=== 5.4 The universal correction and bounded clearing <rd:clearing-subsection>

For transfer to a missing vertex, the individual determinant coordinates must belong to one quadratic group-ring
  family. We first remove the Euler factors at primes unused by a character.
  We then clear the remaining denominators with a factor whose central valuation and negative Laurent support are
  bounded independently of the cube size. The base curve and the companion field are fixed in this argument.

Fix $K$ and a binary family (4.2), based at $h_0 = 1$. Put

$ G = \( bb(Z) \/ 2 bb(Z) \)^b \, wide R = Lambda \[ G \] . $

Let $g_q in G$ be the inertia bit: $g_q \( x \) = \( - 1 \)^(lambda_q \( x \))$.
  Augmentation is denoted by subscript $0$.

The universal class is constructed before making any character evaluation. Fix this finite family and $G$.
  At precision $i$ take the Heegner point of conductor $r_i product_(q in Q) q$.
  Let $epsilon : G_K arrow.r G$ be the universal quadratic character.
  In the finite Shapiro transfer of Lemma 26, use the coefficient map

$ A_i \[ "Gal" \( H_(r_i product q) \/ K \) \] arrow.r A_i \[ G \] \,
  wide \[ sigma \] mapsto Psi_i \( sigma \) \[ epsilon \( sigma \) \] \, $

with the same inverse-action convention on both sides. Complete this weighted coset sum to obtain a target
  Selmer-cone cycle over $A_i \[ G \]$, with local lifts and boundary witnesses,
  and then contract these target data. The target-side rank bound applies for this fixed family and gives one
  trace class over $Lambda \[ G \]$. Evaluation at $x$ commutes with the finite coefficient map and every target
  identity, so gives the full trace for that character. If scalar models have already been chosen,
  compare the evaluated model with them through the original target cochains and retain the resulting comparison
  matrices and contraction homotopies. There are only finitely many characters for this fixed $G$.
  At $t = 0$, the universal split-prime multiplier is

$ a_(r_i) - 2 \[ epsilon \( "Fr"_(frak(r)_i) \) \] . $

The conjugate Frobenius values agree because the character values have exponent two.
  Its evaluation at $x$ is $a_(r_i) - 2 chi_(h_x) \( r_i \)$,
  so the central boundary comparison used in Proposition 34 is retained in this same group-ring diagram before
  character evaluation. It includes Euler factors at primes unused by $x$, which the next lemma removes.
  No inverse limit over growing $G$ or growing active support is used in this construction.

The accompanying dual functional is constructed over $cal(O) \[ G \]$, not separately at its characters.
  At a new prime and at $r$, the full local complex is acyclic modulo the maximal ideal by Lemma 17,
  hence has an integral contraction over this local ring. Use these contractions to lift the class to the
  orthogonal Selmer complex, and then apply the retained integral global duality.
  This gives a closed integral functional, up to one fixed old-support power of $2$ when such a support is
  included. The present base is $h_0 = 1$.

#thm([Lemma 5.11.])[
  (Removing unused primes in the group ring).  #emph[Suppose the universal relaxed trace class and its duality
    diagram have been constructed over $R$. There is $eta in cal(O) \[ G \]$ such that $eta
    u_(upright("rel"))$ has each character coordinate equal to the primitive determinant coordinate,
    up to a $Lambda$-unit. The correction has no denominator accumulating with $\# Q$.]
] <rd:unused>

#proof[
  At an unused split prime $q$, write $z$ for the full scalar Frobenius at one orientation.
    Conjugation gives $z^(- 1)$ at the other orientation. The point trace contributes
  $ e_q = a_q - z - z^(- 1) \, $
  whereas relaxation of the singular quotient contributes
  #[#set math.equation(numbering: n => "(5.25)")
   $ l_q = det \( 1 - q^(- 1) z "Fr"_q divides T \) det \( 1 - q^(- 1) z^(- 1) "Fr"_q divides T \) .
     $ <rd:unused-factors>]
  Using reciprocal Frobenius conventions changes only the corresponding unit conventions in the paired
    determinant. The localization triangle gives $u_(upright("rel")) =
    e_q^2 u_(upright("prim")) \/ l_q$ at this unused prime. The square is required because the point and its dual
    both occur.
  Both factors are units in the local ring $cal(O) \[ G \]$.
    To check this it suffices to reduce modulo its maximal ideal, generated by $2$ and the augmentation ideal.
    There the scalar is $\( 1 + t \)^m$ with $m$ odd, and the residual Frobenius polynomial is nonzero at this
    nonconstant scalar. More precisely, before character evaluation the following identity holds modulo $2$:
  #[#set math.equation(numbering: n => "(5.26)")
   $ \( 1 + a_q z + z^2 \) \( 1 + a_q z^(- 1) + z^(- 2) \) = a_q^2 + z^2 +
     z^(- 2) = \( a_q + z + z^(- 1) \)^2 . $ <rd:residual-euler>]
  Thus $l_q \/ e_q^2 - 1 in 2 cal(O) \[ G \]$, and
  #[#set math.equation(numbering: n => "(5.27)")
   $ eta = product_(q in Q) (1 + frac(l_q \/ e_q^2 - 1, 2) \( 1 + g_q \)) in cal(O) \[ G \] . $ <rd:eta>]
  Its factor evaluates to $l_q \/ e_q^2$ when $q$ is unused and to $1$ when $q$ is active. This proves the claim.
    The apparent inertia projector denominator is canceled inside each factor before taking the product. ◻
]

#thm([Lemma 5.12.])[
  (Laurent expansion and simultaneous elimination).  #emph[There is a natural identification
#[#set math.equation(numbering: n => "(5.28)")
 $ cal(O) \/ 2^M cal(O) = \( bb(Z) \/ 2^M bb(Z) \) \( \( t \) \) . $ <rd:laurent>]

 Suppose $A = "diag" \( A_1 \, dots.h \, A_m \)$ has entries in $Lambda$, each residual determinant is nonzero,
   and $"ord"_t \( det overline(A)_j \) lt.eq h$. If $B = A + 2 E$ with $E$ over $Lambda$,
   then every entry of $B^(- 1) med mod med 2^M$ has no term below $t^(- M h)$.
   The same bound holds for a Schur complement $P - Q B^(- 1) S$, where $P \, Q \, S$ have power-series entries.
   The bound is independent of $m$.]
] <rd:schur>

#proof[
  For a denominator $s in Lambda \\ \( 2 \)$, write $s = t^d v + 2 w$, with $v$ a power-series unit.
    Its inverse modulo $2^M$ is its finite geometric expansion about $t^d v$, which has finite negative support.
    Conversely all Laurent series of finite negative support occur after inverting $t$. This proves (5.28).
    It also proves that an element of $cal(O)$ has a unique series $sum a_n t^n$, $a_n in bb(Z)_2$,
    with $v \( a_n \) arrow.r + oo$ as $n arrow.r - oo$, and that its valuation is $min_n v \( a_n \)$.
  Write $det A_j = t^(d_j) v_j + 2 w_j$, with $d_j lt.eq h$, and put
  $ C_j = frac("adj" \( A_j \), t^(d_j) v_j) \, wide C = "diag" \( C_j \) . $
  Each entry of $C$ has pole at most $h$, and $B C = 1 + 2 F$, where entries of $F$ have the same pole bound. Therefore
  #[#set math.equation(numbering: n => "(5.29)")
   $ B^(- 1) equiv C sum_(j = 0)^(M - 1) \( - 2 F \)^j med \( mod med 2^M \) . $ <rd:inverse-expansion>]
  The $j$-th summand has pole at most $\( j + 1 \) h$. Adding more entries in a matrix product cannot worsen this
    pole bound. Multiplication by power-series matrices proves the Schur assertion.
  For a block over $R$ whose augmentation is $A$, the block is invertible over $cal(O) \[ G \]$:
    its residual determinant in the local ring is a unit. Each sign evaluation is $A +
    2 E_x$ with power-series entries, so the same estimate holds at all characters.
    If $S_0 = 0$, its Schur complement has augmentation exactly $P_0$. ◻
]

#thm([Lemma 5.13.])[
  (Clearing a bounded complex).  #emph[Let $D$ be a based complex of finite free $cal(O) \[ G \]$-modules of total
    graded rank at most $r_0$, with $D_0$ defined over $Lambda$.
    Suppose $D_0 ⊗_Lambda^(upright(bold(L))) bb(Z)_2$ has rational cohomology of dimension one in degrees one and
    two, zero elsewhere, and total integral torsion length at most $h_1$.
    Let $z$ be an integral cycle and let $lambda in 2^(- a_0) \( D^2 \)^(*)$ be a closed functional.
    Assume every character constituent is either generically acyclic or has the same generic rank-one pattern;
    in the generically acyclic case its determinant coordinate is defined to be zero.
    Multiplication of these coordinates by any $eta in cal(O) \[ G \]$ is permitted.
    Then there are $f \, d in cal(O) \[ G \]$ such that
#[#set math.equation(numbering: n => "(5.30)")
 $ f_x u_x = d_x \, wide f_0 in Lambda \, wide v \( f_0 \( 0 \) \) lt.eq
   C \( r_0 \, h_1 \, a_0 \) < oo . $ <rd:clearing-equations>]

 If all entries of $D_x$ have bounded negative Laurent support at each precision, uniformly in $b$,
   the same is true of $f_x$. No such bound on $d_x \, z \, lambda \, eta$ is required.]
] <rd:clearing>

#proof[
  Put the central integral complex into elementary-divisor bases over $bb(Z)_2$.
    Its positive pivot valuations sum to at most $h_1$. Lift these constant integral basis changes.
    Formally cancel the same pivot positions upstairs, recording the pivot numerators and all denominators in the
    resulting rational basis changes and determinant comparison. There are at most $r_0$ such operations.
    A product $P$ of sufficiently large, but bounded, powers of their numerators clears every denominator.
    Its degree in the differential entries is bounded in terms of $r_0$;
    its augmentation belongs to $Lambda$ and has central valuation bounded in terms of $r_0 \, h_1$.
  On constituents where $P_x eq.not 0$, the remaining complex is one-by-one in degrees one and two.
    If its differential is nonzero, the cycle identity forces the projected cycle to be zero,
    so the same rational determinant expression gives the stipulated zero coordinate.
    Otherwise the expression is the product of the projected cycle and functional, with the canceled-pivot factor.
    Clearing denominators gives
  $ u_x = 2^(- a_0) eta_x Q_x \/ P_x \, wide Q in cal(O) \[ G \] . $
  Take $f = 2^(a_0) P^2$ and $d = eta P Q$. On a constituent where a pivot first vanishes, $P_x = 0$,
    so both sides of $f_x u_x = d_x$ are zero. Thus the identity holds on every character.
    Since $f$ is a polynomial of bounded degree in the bounded differential entries,
    its central valuation and pole properties follow. All unused-prime corrections and eliminated-block units
    occur in $d$; none is inserted into $f$. ◻
]

#thm([Proposition 5.14.])[
  (The bounded clearing factor for the family).  #emph[Assume the compatible universal Selmer and Heegner diagrams
    and their primitive specializations. Suppose every character constituent of the universal Selmer complex is
    generically acyclic or has generic cohomology of dimension one in degrees one and two and zero elsewhere.
    If the fixed base has $2^oo$-Selmer corank one over $K$, the corrected coordinates of Lemma 35 admit the
    factorization (5.30), with central valuation and fixed-precision pole bounds independent of $b$ and $\# Q$.]
] <rd:family-clearing>

#proof[
  Use the integral universal class and paired functional just constructed.
    To apply Lemma 37, it remains to reduce the complex to bounded size without losing uniform control of its
    negative Laurent powers.
  At augmentation, the localization triangles present the complex as the old complex extended by a direct sum of
    singular local blocks in degrees one and two, one block for each new prime.
    Its differential is upper triangular, with the old complex a subcomplex. This graded model lifts over $R$:
    split disks over the augmentation local ring, identify the minimal parts,
    and lift the invertible basis changes. This is an application of the actual finite diagram construction,
    rather than just an equality of Euler characteristics.
  Each new block has determinant $l_(q \, 0)$. Its residual $t$-order is uniformly bounded.
    In the reducible residual range the residual Frobenius polynomial is $\( X + 1 \)^2$,
    and an odd scalar exponent gives order two at each split place;
    thus order four suffices for the two-place block. Eliminate the entire new block over $cal(O) \[ G \]$.
    By Lemma 36, the resulting complex $D$ has the bounded old size, has augmentation equal to the old complex,
    and has a uniform pole bound at every fixed precision.
  The central cohomology of the old complex is the fixed base Kummer cohomology,
    modified only by the bounded auxiliary-prime terms. Its rational dimension is one in degrees one and two.
    The quotient of the discrete Selmer group by its maximal divisible subgroup is finite because its Pontryagin
    dual is a finitely generated $bb(Z)_2$-module. For this fixed $K \, E$, its length is a finite constant,
    even when the Shafarevich–Tate group itself is not known to be finite.
    Together with global torsion and the trace bound at $r$, this bounds all central torsion lengths of $D_0$.
  Apply Lemma 37. The determinant of the eliminated block is a unit over $cal(O) \[ G \]$,
    so its inverse is an allowed integral multiplier. Include it and $eta$ from (5.27) in the numerator multiplier
    of that lemma. This proves the assertion.
  The dependence here is on fixed $K \, E$; it is different from the uniform $C \( E \, A \)$ of Proposition 31.
    No uniform bound on the finite Selmer quotient as $K$ varies is asserted or needed for the missing-vertex
    argument. ◻
]

#thm([Proposition 5.15.])[
  (Assembly of the arithmetic diagrams).  #emph[For the ring data stated at the start of this section,
    the actual finite Heegner and Selmer constructions satisfy the simultaneous diagram hypotheses of
    Propositions 29, 31, and 34. The bounds needed for the lower-bound argument depend only on $E$,
    the fixed local data, and a bound $A$ on $omega \( k \)$.
    For the binary data (4.2) with fixed $E \, K$ and base Selmer corank one,
    assume in addition that every character constituent of the universal Selmer complex is generically acyclic or
    has generic cohomology of dimension one in degrees one and two and zero elsewhere.
    Then the constructions satisfy all the hypotheses of Proposition 38,
    with bounds independent of the cube dimension and of its new-prime support.]
] <rd:assembly>

#proof[
  The paired arithmetic diagram constructed after Lemma 26 contains the actual weighted target classes,
    local Kummer lifts, target comparison and boundary witnesses, and simultaneous duality triangles.
    The target-side construction gives its inner rank bound for each fixed finite conductor support;
    no ring-class source complex is passed to the limit. Theorem 24 retains their evaluations and exact-kernel
    restrictions. The same-stage extension in Proposition 31 shows explicitly that these data remain compatible
    after each further switch.
  Lemma 18 bounds the minimal models in terms of $E \, A$ and the number of retained derivative primes,
    not the active conductor support. Outer rank reduction uses only a bounded number of switches,
    hence only finitely many of these bounds. The paired functional has the common clearing exponent established
    above. These are the three hypotheses of Proposition 31; the characteristic-zero evaluations and local
    acyclicity give those of Proposition 29. The actual central trace and $Lambda_(\( t \))$-representative,
    together with the local quotients of Lemma 33, were verified in the proof of Proposition 34.
  For a binary family, Section 5.4 constructs the universal trace and its dual functional over the group ring
    before evaluating characters. Lemma 35 then removes the unused-prime factors integrally.
    The bounded complex in Proposition 38 comes from the actual localization triangles and simultaneous Schur
    elimination, with the order-four residual local bound. Its central torsion is controlled by the finite
    quotient of the fixed base Selmer group and the bounded auxiliary-prime terms.
    Together with the stated constituent-rank assumption, these give all the hypotheses of Lemma 37.
  For varying $K$, only its bounded ramification count enters the residual-model and local-comparison constants.
    For the final binary argument $K$ is fixed, so its finite base Selmer quotient may enter the clearing
    constants. At $2 N$ the original Kummer conditions have been retained throughout;
    the construction imposes no ordinary or semistable hypothesis. ◻
]

=== 5.5 Coefficient comparison and the missing vertex <rd:transfer-subsection>

The bounded clearing factor reduces the last step to finitely many coefficient congruences.
  A parity argument on a sufficiently large binary cube makes a nonzero address agree with the base to the
  required precision. If the base derivative were zero, that congruence would contradict the upper bound already
  supplied at every nonzero address.

The common-zero count in the following proof is the characteristic-two Chevalley–Warning principle
  #cite(label("HeathBrownChevalleyWarning")) Section 1, equation (1); its short parity proof is included here.

#thm([Lemma 5.16.])[
  (A nonzero address with prescribed coefficient bits).  #emph[Let $A_1 \( x \) \, dots.h \,
    A_q \( x \)$ be specified Laurent coefficients of sign evaluations of elements of $cal(O) \[ G \]$.
    For $M gt.eq 1$, if
#[#set math.equation(numbering: n => "(5.31)")
 $ b > q \( 2^M - 1 \) \, $ <rd:bit-threshold>]

 there is $x eq.not 0$ with $A_i \( x \) equiv A_i \( 0 \) med \( mod med 2^M \)$ for every $i$.]
] <rd:bits>

#proof[
  Write the element supplying the $i$-th test as $a_i = sum_(g in G) a_(i \, g) \( t \) g$,
    and let $n_i$ be the Laurent degree being tested. Lemma 36 gives integral Laurent coefficients, so
  $ z_i = sum_(g in G) \[ t^(n_i) \] a_(i \, g) \( t \) thin g in bb(Z)_2 \[ G \] . $
  The group $G$ is finite, hence coefficient extraction commutes with character evaluation:
    $\( z_i \)_x = A_i \( x \)$. Apply Lemma 7 to these $q$ integral group-ring elements.
    Its bound is exactly (5.31); no bound on the Laurent degrees or on the coefficients enters this argument. ◻
]

#thm([Lemma 5.17.])[
  (Transfer through the bounded factor).  #emph[Suppose $f \, d in cal(O) \[ G \]$, $u_x in Lambda \[ 1 \/ 2 \]$,
    and $f_x u_x = d_x$ for every character. Suppose $f_0 in Lambda$ and $c = v \( f_0 \( 0 \) \) < oo$.
    If every $f_x med mod med 2^M$ has no powers below $- L \( M \)$, then for
$ M > c \, wide b > \( L \( M \) + 2 \) \( 2^M - 1 \) $

 there is $x eq.not 0$ satisfying
#[#set math.equation(numbering: n => "(5.32)")
 $ v #scale(x: 120%, y: 120%)[\(] u_x \( 0 \) - u_0 \( 0 \) #scale(x: 120%, y: 120%)[\)] gt.eq M -
   2 c . $ <rd:binary-congruence>]

]
] <rd:binary-transfer>

#proof[
  Apply Lemma 40 to the coefficients of $f_x$ in degrees $- L \( M \) \, dots.h \,
    0$ and the constant coefficient of $d_x$. At its nonzero solution,
    all negative coefficients of $f_x$ are divisible by $2^M$,
    and its constant coefficient is congruent to $f_0 \( 0 \)$.
    Hence the latter has valuation $c$, and $v_(cal(O)) \( f_x \) lt.eq c$.
    Since $d_x$ is integral over $cal(O)$, $v_(cal(O)) \( u_x \) gt.eq - c$, and the same holds for $u_0$.
    The Laurent expansion in Lemma 36 then shows that all their coefficients lie in $2^(- c) bb(Z)_2$.
    They have no negative coefficients because they belong to $Lambda \[ 1 \/ 2 \]$.
  The constant-term convolution converges $2$-adically, and gives
  $ \[ t^0 \] d_x equiv \[ t^0 \] f_x thin u_x \( 0 \) med \( mod med 2^(M - c) \) \, wide \[ t^0 \] d_0 =
    f_0 \( 0 \) u_0 \( 0 \) . $
  Use the imposed congruences and divide by $f_0 \( 0 \)$. This proves (5.32).
    The possibly large negative support of $d_x$ was never tested; only its constant coefficient was used. ◻
]

#proof[
  For every character the primitive generic cohomology has rank at most one.
    At nonzero vertices this follows from the simple-zero theorem;
    at zero it follows from (4.3) and rational specialization.
    There are no generic invariants, and duality pairs degrees one and two;
    thus each primitive constituent is acyclic or has exactly the rank-one pattern.
    The unused-prime local blocks are acyclic over the fraction field, by the nonzero factors (5.25).
    The universal Selmer complex has the same generic pattern, as required by Proposition 38.
    With this hypothesis verified, Proposition 39 supplies the compatible universal arithmetic construction.
    By Proposition 29 and Lemma 35, the corrected coordinates belong to $Lambda \[ 1 \/ 2 \]$. Proposition 34 gives
  $ v \( u_x \( 0 \) \) lt.eq B_1 quad \( x eq.not 0 \) $
  for a constant $B_1$ depending only on $B \, E \, K$ and the fixed local data.
  If the base derivative vanished, the Gross–Zagier formula would make the central Heegner sum torsion:
    its canonical height is a fixed nonzero multiple of that derivative.
    Here only the conductor-one formula at the fixed base $h = 1$ is used,
    with the corrected primitive sum and the split Heegner data of #cite(label("CaiShuTian2014")) Theorem 1.1.
    At the base this implies $u_0 \( 0 \) = 0$. Indeed, if the generic rank is zero the coordinate was defined to
    be zero. If the generic rank is one, its central rank is also one by (4.3),
    so Lemma 32 identifies its specialized class with the zero rational Kummer class of that torsion point.
  Proposition 38 supplies $f \, d$ with a common bound $c_(*)$ on $v \( f_0 \( 0 \) \)$ and common pole bounds
    $L \( M \)$. Choose
  $ M > max { c_(*) \, B_1 + 2 c_(*) } $
  and then take $b$ above the threshold of Lemma 41. That lemma gives a nonzero vertex with $v \( u_x \( 0 \) \)
    gt.eq M - 2 c_(*) > B_1$, a contradiction. Thus the base derivative is nonzero.
    The classical split Heegner sign is odd, so the base product has a simple zero. ◻
]

#prodef([Remark 5.18.])[
  (The simultaneous arithmetic interface).  The determinant argument can be reused only with the simultaneous
    arithmetic construction verified in Proposition 39 and Theorem 24.
    Neither the published duality theorem nor the classical Heegner formulas alone supplies that interface.
] <rd:interface-status>

== 6 Auxiliary twists with prescribed local behavior <sec:nonvanishing>

We need auxiliary twists with specified local behavior and nonzero central value or derivative.
  For a fixed witness, no bound on the prime count is needed.
  When the curve itself varies, we also need central-value witnesses with a uniformly bounded number of prime
  factors. In both cases their primes can be chosen beyond any previously specified finite set.

#thm([Proposition 6.1.])[
  (Local witnesses).  #emph[Fix an elliptic curve $A \/ bb(Q)$ and a nonempty filter of fundamental discriminants
    prime to $2 N_A$, with specified real sign and unit squareclasses at finitely many primes.
    If the root number in the filter is $+ 1$, it contains $d$ of arbitrarily large absolute value with
    $L \( A^(\( d \)) \, 1 \) eq.not 0$. If the root number is $- 1$,
    it contains such $d$ with $L' \( A^(\( d \)) \, 1 \) eq.not 0$.
    Any additional finite set of primes may be excluded.]
] <nv:local-witness>

#thm([Proposition 6.2.])[
  (Bounded-factor completion).  #emph[There is an absolute integer $A_0$ with the following property.
    In the positive-root-number case of Proposition 43, one can require $omega \( d \) lt.eq
    A_0$ and require every prime divisor of $d$ to exceed any fixed bound.
    The size threshold for the resulting $d$ may depend on the curve, the filter, and the excluded primes;
    $A_0$ does not.]
] <nv:rough>

The use of a nonnegative first moment and a lower linear sieve to obtain bounded-factor twists goes back to
  Hoffstein–Luo #cite(label("HoffsteinLuo1997")) §2. We retain an arbitrary fixed progression and track an
  absolute factor-count bound without optimizing it. The central moment follows the model of
  #cite(label("RadziwillSoundararajan2015")) Proposition 2, which has a sharper divisor error;
  the derivative calculation adapts the first-moment argument of #cite(label("Iwaniec1990")).
  The enlarged modulus and the absolute exponents needed here are retained in the proof below.

A nonzero first moment alone supplies the derivative witness.
  For the central-value completion, positivity allows us to sieve the first moment,
  so we also need an error term for each prescribed squarefree divisor of the twist parameter.

Write $f$ for the weight-two newform of $A$, normalized so that its central point is $1 \/ 2$,
  and write $lambda \( n \)$ for its normalized Hecke eigenvalues. Thus

$ L \( s \, f ⊗ chi \) = sum_(n gt.eq 1) lambda \( n \) chi \( n \) n^(- s) \, wide \| lambda \( n \) \| lt.eq
  d \( n \) . $

Choose $H$ divisible by $8 N_A$, a reduced residue class $a med mod med H$, and $sigma in { 1 \, -
  1 }$ such that $sigma a equiv 1 med mod med 4$. The required twists have discriminant $sigma n$ with $n >
  0$ squarefree and $n equiv a med mod med H$. A filter is a finite union of such progressions,
  so it suffices to use one of them. Fix a nonnegative smooth nonzero $Phi$ supported in $\( 1 \, 2 \)$.

#thm([Lemma 6.3.])[
  (A fixed-progression moment).  #emph[There are absolute constants $eta > 0$ and $B >
    0$ such that the following assertions hold. For squarefree $b$ prime to $H$, put
$ S_(j \, b) \( X \) = sum_(n > 0 med upright("squarefree")\
n equiv a med \( H \)\
b divides n) L^(\( j \)) \( 1 \/ 2 \, f ⊗ chi_(sigma n) \) Phi \( n \/ X \) . $

 If the common root number is $+ 1$, then
$ S_(0 \, b) \( X \) = c X product_(p divides b) beta_p + O_(f \, H \, Phi) \( b^B X^(1 - eta) \) \, wide c > 0 \,
  quad 0 < beta_p < 1 \, quad beta_p = 1 / p + O \( p^(- 2) \) . $

 The last implied constant is absolute. If the common root number is $- 1$, then
$ S_(1 \, 1) \( X \) = c X log X + c_1 X + O_(f \, H \, Phi) \( X^(1 - eta) \) \, wide c > 0 . $

]
] <nv:moment>

#proof[
  We first control the square-divisor tail, then use Poisson summation to separate a positive main term from a
    power-saving error. Tracking the dependence on the imposed divisor $b$ will give the absolute exponents.
    Let $G \( z \) = e^(z^2)$ and
  $ V_j \( y \) = frac(1, 2 pi i) integral_(\( 2 \)) G \( z \) Gamma \( 1 + z \) y^(- z) frac(d z, z^(j + 1)) . $
  Writing $Q_A = sqrt(N_A) \/ \( 2 pi \)$, the symmetric approximate functional equation in the required sign is
  #[#set math.equation(numbering: n => "(6.1)")
   $ L^(\( j \)) \( 1 \/ 2 \, f ⊗ chi_(sigma n) \) = 2 sum_(u gt.eq 1)
     frac(lambda \( u \) chi_(sigma n) \( u \), sqrt(u)) V_j #h(-0.16667em) (frac(u, Q_A n)) . $ <nv:afe>]
  For $j = 1$, differentiating the completion contributes no central-value term, because that value is zero.
  #emph[Square-divisor truncation.] The quadratic large sieve #cite(label("HeathBrown1995")) Theorem 1 and
    Corollary 1, with the approximate functional equation, gives for fixed $delta > 0$
  #[#set math.equation(numbering: n => "(6.2)")
   $ sum_(0 < t lt.eq Z med upright("squarefree")\
sigma t med upright("fundamental")\
\( t \, 2 N_A \) = 1) \| L \( 1 \/ 2 + delta + i tau \, f ⊗ chi_(sigma t) \) \|^2 lt.double_(f \, rho \, delta)
  Z^(1 + rho) \( 1 + \| tau \| \)^(C_rho) . $ <nv:second>]
  Here the polynomial exponent can be chosen independently of the level.
    To see that square indices cause no extra power, write each coefficient index as $u r^2$ with $u$ squarefree.
    Minkowski’s inequality and the quadratic large sieve bound the square root of the moment of a polynomial of
    length $U$ by
  $ \( Z U \)^(O \( rho' \)) sum_(r lt.eq sqrt(U)) sqrt(Z + U \/ r^2) /
    r lt.double \( Z U \)^(O \( rho' \)) \( sqrt(Z) + sqrt(U) \) . $
  Coprimality restrictions at $r$ are discarded only after taking absolute squares.
    To include both parts of the approximate functional equation, work first with $t asymp T$.
    Their lengths are $U lt.double_f T \( 1 + \| tau \| \)^C$, with rapidly decreasing tails.
    The main coefficients have the additional factor $n^(- delta)$, which improves the partial-summation bound.
    The dual coefficients have $n^delta$ and lose at most $U^delta$,
    whereas their functional-equation multiplier contributes $T^(- 2 delta)$,
    up to a fixed power of $1 + \| tau \|$. The resulting factor is at most
    $T^(- delta) \( 1 + \| tau \| \)^(C_delta)$ and causes no positive power of $T$.
    Mellin inversion separates the smooth $t$-weights; the gamma factors control the resulting integrals and
    tails. Taking the auxiliary large-sieve exponents sufficiently small and summing dyadic intervals proves
    Equation (6.2).
  Let $cal(A)_j \( n \)$ denote the right side of Equation (6.1), also for nonsquarefree $n equiv a med mod med
    H$. Expanding $mu^2 \( n \)$ and retaining divisors $d lt.eq Y$ leaves an error
  #[#set math.equation(numbering: n => "(6.3)")
   $ O_(f \, H \, Phi \, rho) \( X^(1 + rho) \/ Y \) . $ <nv:tail>]
  Indeed write $n = t v^2$, with $t$ squarefree. The omitted terms have $v > Y$,
    and their multiplicity is at most the divisor count of $v$.
    Let $L^(\( v \)) \( s \, f ⊗ chi_(sigma t) \)$ be the primitive-twist $L$-function with its Euler factors at
    primes dividing $v$ removed. For $0 < delta_(upright(M)) < rho \/ 8$, Mellin inversion gives
  $ cal(A)_j \( t v^2 \) = frac(2, 2 pi i) integral_(\( delta_(upright(M)) \)) G \( z \)
    Gamma \( 1 + z \) \( Q_A t v^2 \)^z L^(\( v \)) \( 1 \/ 2 + z \, f ⊗ chi_(sigma t) \) frac(d z, z^(j + 1)) . $
  Choose the large-sieve and divisor exponents smaller still.
    On this line the removed Euler factors cost an arbitrarily small fixed power of $v$.
    Cauchy’s inequality and Equation (6.2) give, for suitably small $rho' > 0$,
  $ sum_(t lt.eq 2 X \/ v^2)^(#h(-0.16667em) *) \|
    L \( 1 \/ 2 + delta_(upright(M)) + i tau \, f ⊗ chi_(sigma t) \) \|
    lt.double_(f \, rho' \, delta_(upright(M))) \( X \/ v^2 \)^(1 + rho') \( 1 + \| tau \| \)^C \, $
  where the star retains the primitive discriminant conditions. The gamma factors control the integral.
    The divisor count, the removed Euler factors, and $X^(delta_(upright(M)))$ are absorbed in $X^rho$,
    leaving $X^(1 + rho) sum_(v > Y) v^(- 2) lt.double X^(1 + rho) \/ Y$.
    The factor $z^(- 2)$ changes only the constant.
  #emph[Poisson summation and the main term.] Only $\( d \, H \) = 1$ occurs, because $n equiv a med mod med
    H$ is a reduced class. For $d lt.eq Y$ put $J = \[ d^2 \, b \]$ and $c_J equiv a J^(- 1) med mod med H$,
    which is therefore defined. Write $u = u_1 q$ with $u_1 divides H^oo$ and $\( q \, H \) = 1$,
    and put $kappa \( u_1 \) = chi_(sigma a) \( u_1 \)$. Define
  $ G_nu \( q \) = sum_(y med mod med q) (y / q) e \( nu y \/ q \) \, quad W_j \( z \, R \) =
    integral_0^oo Phi \( x \) V_j #h(-0.16667em) (frac(z, Q_A x)) e \( - R x \) thin d x \, $
  where $e \( x \) = e^(2 pi i x)$. Put
  $ T_j \( J \) = sum_(n > 0 \, med n equiv a med \( H \)\
J divides n) cal(A)_j \( n \) Phi \( n \/ X \) . $
  Poisson summation in the fixed progression gives the exact identity
  #[#set math.equation(numbering: n => "(6.4)")
   $ T_j \( J \) & = frac(2 X, H J) sum_(u_1 divides H^oo) frac(lambda \( u_1 \) kappa \( u_1 \), sqrt(u_1))
     sum_(\( q \, H \) = 1) frac(lambda \( q \), q^(3 \/ 2)) (frac(sigma J H, q))\
 & #h(14mm)  dot.op sum_(nu in bb(Z)) G_nu \( q \) e \( nu c_J macron(q) \/ H \) W_j #h(-0.16667em)
   (frac(u_1 q, X) \, frac(nu X, H J q)) . $ <nv:poisson>]
  Here $q macron(q) equiv 1 med mod med H$. The arithmetic factor follows directly by applying the Chinese
    remainder theorem to
  $ sum_(x med mod med H q\
x equiv c_J med \( H \)) (x / q) e \( nu x \/ \( H q \) \) = e \( nu c_J macron(q) \/ H \) (H / q) G_nu \( q \) . $
  When $\( q \, J \) > 1$, the additional Jacobi symbol is zero.
  At zero frequency only square $q$ occur. Put
  $ H_p \( z \) = 1 + \( 1 - p^(- 1) \) sum_(r gt.eq 1) lambda \( p^(2 r) \) p^(- r \( 1 + 2 z \)) \, wide H_p =
    H_p \( 0 \) \, $
  $ L_H \( z \) = sum_(u_1 divides H^oo) lambda \( u_1 \) kappa \( u_1 \) u_1^(- 1 \/ 2 - z) \, wide F_J \( z \) =
    product_(p divides.not H J) H_p \( z \) . $
  The zero-frequency term is
  $ frac(2 X, H J) frac(1, 2 pi i) integral_(\( 2 \)) G \( z \) Gamma \( 1 + z \) \( Q_A X \)^z hat(Phi)_0 \( z \)
    L_H \( z \) F_J \( z \) frac(d z, z^(j + 1)) \, quad hat(Phi)_0 \( z \) = integral_0^oo Phi \( x \) x^z thin d x . $
  For the Satake parameters $alpha_p \, alpha_p^(- 1)$, with $\| alpha_p \| = 1$, we have
  $ sum_(r gt.eq 0) lambda \( p^(2 r) \) x^r = frac(1 + x, \( 1 - alpha_p^2 x \) \( 1 - alpha_p^(- 2) x \)) . $
  Thus $F_J$ factors through $L \( 1 + 2 z \, "sym"^2 f \)$ and a correction product convergent near $Re z gt.eq -
    1 \/ 16$. Omitting a prime dividing $J$ removes its correction factor and inserts an inverse symmetric-square
    Euler polynomial; it creates no pole even when $H_p \( z \)$ has zeros.
    The omitted factors cost at most $J^(B_1)$ for an absolute $B_1$.
    Symmetric-square continuation, including the CM case #cite(label("GelbartJacquet1978")) Theorem 9.3 and
    Remark 9.9, and the polynomial strip bounds from its functional equation therefore give an error
    $O_(f \, H \, Phi) \( J^(B_1) X^(1 - 1 \/ 16) \)$ when shifting to $Re z = - 1 \/ 16$.
  The residues have a positive leading coefficient. Indeed
  $ F_p^(upright("ev")) = sum_(r gt.eq 0) lambda \( p^(2 r) \) p^(- r) =
    frac(1 + p^(- 1), \( 1 - alpha_p^2 \/ p \) \( 1 - alpha_p^(- 2) \/ p \)) > 0 \, quad H_p =
    p^(- 1) + \( 1 - p^(- 1) \) F_p^(upright("ev")) > p^(- 1) . $
  The fixed Euler factors are positive at the center, and $L \( 1 \, "sym"^2 f \) >
    0$ by the Rankin–Selberg residue formula. This also holds for CM forms.
    Summing the residue over the square divisor gives, at $p divides.not H b$, the factor $H_p - p^(- 2)$,
    and at $p divides b$ the factor $p^(- 1) - p^(- 2)$. Consequently
  $ beta_p = frac(p - 1, p^2 H_p - 1) = frac(1, 1 + p F_p^(upright("ev"))) = p^(- 1) + O \( p^(- 2) \) . $
  For $j = 1$, the double pole gives $c X log X + c_1 X$ with the same positive leading coefficient.
    Extending the residue sum from $d lt.eq Y$ to all $d$ costs $O \( b^(B_2) X^(1 + rho) \/ Y \)$;
    the $d^(- 2 + rho)$ tail also permits differentiation of that sum.
  #emph[The nonzero frequencies.] It remains to obtain a power saving with polynomial dependence on $J$.
    Put $epsilon.alt_q = 1$ or $i$ according as $q equiv 1$ or $3 med mod med 4$ and $tilde(G)_nu \( q \) =
    epsilon.alt_q^(- 1) G_nu \( q \)$. This is multiplicative in $q$.
    Since $4 divides H$, expand $epsilon.alt_q e \( nu c_J macron(q) \/ H \)$ in characters $psi med mod med H$.
    For $nu eq.not 0$ the resulting Dirichlet series is
  $ D_(psi \, J \, nu) \( s \) = sum_(\( q \, H \) = 1) frac(lambda \( q \), q^s)
    frac(tilde(G)_nu \( q \), sqrt(q)) (frac(sigma J H, q)) psi \( q \) =
    L \( s \, f ⊗ xi_(upright("prim")) \) C_(psi \, J \, nu) \( s \) \, $
  where $xi \( q \) = psi \( q \) \( sigma J H nu \/ q \)$.
    At $p divides.not 2 H J nu$ its local factor is $1 + lambda \( p \) xi \( p \) p^(- s)$;
    dividing by the $upright("GL")_2$ Euler factor leaves a polynomial $1 + O \( p^(- 2 Re s) \)$.
    The bound at primes dividing $nu$ has an absolute exponent.
    Indeed, for an odd prime $p$, put $a = v_p \( nu \)$. Directly summing over the lifts of a residue modulo $p$ gives
  $ G_nu \( p^r \) =
    cases(delim: "{", phi \( p^r \) \, & r upright(" even") \, med r lt.eq a \,, - p^(r - 1) \, & r
    upright(" even") \, med r = a + 1 \,, epsilon.alt_p p^(r - 1 \/ 2) (frac(nu \/ p^(r - 1), p)) \, & r
    upright(" odd") \, med r = a + 1 \,, 0 \, & upright("otherwise") .) $
  For even $r$ this is the Ramanujan sum; for odd $r$ the inner sum of lifts vanishes unless $p^(r - 1) divides
    nu$, after which the primitive quadratic Gauss sum gives the displayed value.
    In particular $\| tilde(G)_nu \( p^r \) \/ p^(r \/ 2) \| lt.eq p^(r \/ 2)$,
    and the local polynomial on $Re s gt.eq 3 \/ 4$ is bounded by $sum_(r gt.eq 0) \( r + 1 \) p^(- r \/ 4) lt.eq
    C_0$ with $C_0$ absolute. The inverse degree-two Euler polynomial is bounded by another absolute constant
    $C_1$. Primes dividing $J$ simply remove the local sum, and have the same bound after multiplication by that
    inverse Euler polynomial. Thus all primes dividing $J nu$ cost at most $\( C_0 C_1 \)^(omega \( J nu \))
    lt.eq \( 2 J \| nu \| \)^C$, for an absolute $C$. The remaining correction product converges absolutely on $Re
    s gt.eq 3 \/ 4$, since its local error is $O \( p^(- 3 \/ 2) \)$.
    Hence the correction is holomorphic on $Re s > 1 \/ 2$ and has the asserted polynomial bound with absolute
    exponent. The conductor of $xi_(upright("prim"))$ is at most $4 H J \| nu \|$,
    and the twisted cuspidal $L$-function is entire. Thus, with absolute $C$,
  $ \| D_(psi \, J \, nu) \( 3 \/ 4 + i tau \) \| lt.double_(f \, H) \( J \| nu \| \)^C \( 1 + \| tau \| \)^C . $
  Integration by parts in both weight variables gives, for fixed $r \, s$ and any $K > 0$,
  $ \| \( z partial_z \)^r \( R partial_R \)^s W_j \( z \, R \) \|
    lt.double_(f \, Phi \, r \, s \, K) \( 1 + z \)^(- K) \( 1 + \| R \| \)^(- K) \( 1 + \| log z \| \) . $
  The logarithm is needed only for $j = 1$ and is $O \( log X \)$ on the actual sums, where $z gt.eq X^(- 1)$.
    For an absolute small $rho > 0$ the sums can therefore be restricted to
  $ u_1 q lt.double X^(1 + rho) \, wide 0 < \| nu \| lt.double_H J X^(2 rho) \, wide q gt.double_H X^(1 - rho) \/ J \, $
  at a negligible cost with polynomial dependence on $J$. A trivial bound $\| G_nu \( q \) \| lt.eq
    q$ gives a polynomial majorant for the discarded tails. To identify the sum to be shifted,
    write $D_(psi \, J \, nu) \( s \) = sum_q gamma \( q \) q^(- s)$.
    On a dyadic range $q asymp T$, take a fixed smooth cutoff $theta.alt$ and put
  $ w_T \( y \) = theta.alt \( y \) W_j #h(-0.16667em) (frac(u_1 T y, X) \, frac(nu X, H J T y)) . $
  Each dyadic $q$-sum after the character expansion is therefore
  $ sum_q frac(gamma \( q \), q) w_T \( q \/ T \) = frac(1, 2 pi i) integral_(\( 1 \)) hat(w)_T \( s \) T^s
    D_(psi \, J \, nu) \( 1 + s \) thin d s \, $
  where $hat(w)_T \( s \) = integral_0^oo w_T \( y \) y^(s - 1) thin d y$.
    The weight bounds permit a contour shift to $Re s = - 1 \/ 4$, giving
  $ O_(f \, H \, Phi) #scale(x: 120%, y: 120%)[\(] \( J \| nu \| \)^C X^(C' rho) T^(- 1 \/ 4)
    #scale(x: 120%, y: 120%)[\)] . $
  There is no residue. Summing over $nu$, over the dyadic ranges,
    and over $u_1$ (for which $sum_(u_1 divides H^oo) \| lambda \( u_1 \) \| \/ sqrt(u_1) < oo$) is bounded,
    up to a further $X^(O \( rho \))$, by
  $ X / J thin J^C \( J X^(2 rho) \)^(C + 1) \( X^(1 - rho) \/ J \)^(- 1 \/ 4) =
    J^(2 C + 1 \/ 4) X^(3 \/ 4 + O \( rho \)) . $
  This gives $O \( J^(B_3) X^(3 \/ 4 + C'' rho) \)$. Choose $rho$ so that this is $O \( J^(B_3) X^(7 \/ 8) \)$.
  #emph[Choosing the truncation.] Since $J lt.eq b d^2$, summing the two contour errors for $d lt.eq Y$,
    and adjoining Equation (6.3), gives
  $ O_(f \, H \, Phi) #scale(x: 120%, y: 120%)[\(] b^(B_4) Y^(2 B_4 + 1) X^(1 - kappa) +
    b^(B_4) X^(1 + rho) \/ Y #scale(x: 120%, y: 120%)[\)] $
  for absolute $kappa > 0$ and $B_4$. Take $Y = X^delta$ with $\( 2 B_4 + 1 \) delta < kappa \/ 2$,
    and then $rho < delta \/ 4$. Both errors have the form in the statement, with absolute positive saving.
    This proves the lemma. ◻
]

#proof[
  For negative root number, Lemma 45 gives a nonzero sum of derivatives in every sufficiently large dyadic
    interval. One derivative is nonzero, and its central zero is already forced by the sign.
  For positive root number, use the nonnegative sequence
  $ a_n = mu^2 \( n \) upright(bold(1))_(n equiv a med \( H \)) L \( 1 \/ 2 \, f ⊗ chi_(sigma n) \) Phi \( n \/ X \) . $
  Its nonnegativity follows from the Waldspurger formula #cite(label("Waldspurger1981")).
    The lemma gives a dimension-one sieve density $beta_p$ and an absolute exponent of distribution:
    choose $theta > 0$ with $\( B + 1 \) theta < eta$ and put $D = X^theta$.
    The total remainder for squarefree $b lt.eq D$ is
  $ O_(f \, H \, Phi) \( D^(B + 1) X^(1 - eta) \) = o \( X \/ log X \) . $
  The density estimate also gives the interval product condition
  $ product_(w lt.eq p < z\
p divides.not H) \( 1 - beta_p \)^(- 1) lt.eq frac(log z, log w) (1 + frac(C_(f \, H), log w))
  wide \( 2 lt.eq w < z \) . $
  Indeed, comparison with $\( 1 - p^(- 1) \)^(- 1)$ contributes a logarithmic error
    $O \( sum_(p gt.eq w) p^(- 2) \)$, and Mertens’ product estimate gives the displayed bound;
    finitely many small primes are absorbed in $C_(f \, H)$. The same comparison gives
  $ product_(p < z\
p divides.not H) \( 1 - beta_p \) asymp_(f \, H) \( log z \)^(- 1) . $
  The lower linear sieve #cite(label("FriedlanderIwaniec2010")) Theorem 11.13, with $z =
    D^(1 \/ s)$ and any fixed $s > 2$, therefore gives positive remaining weight.
    Since $z = X^(theta \/ s)$ tends to infinity, its surviving parameters eventually avoid all primes up to any
    prescribed bound. Every surviving parameter is prime to $H$ and has all other prime factors at least $z$.
    Since $n < 2 X$, its number of prime factors is bounded by any fixed integer greater than $2 s \/
    theta$ for sufficiently large $X$. This proves Proposition 44 and the positive-sign part of Proposition 43.
    Enlarging $H$ and choosing a reduced CRT lift excludes any additional finite prime set. ◻
]

The constants in the size threshold may change when the curve or the support is changed.
  The exponent $theta$ and the factor-count bound do not. In particular,
  a previously chosen twist can be absorbed into the curve before this proposition is applied.

== 7 Coefficient systems and their contraction identities <co:section>

We construct Fourier coefficients detecting central values and Heegner points,
  then use arithmetic lower bounds to normalize their least nonzero valuation.
  The resulting binary tests satisfy the contraction and isolation identities used in Section 8.
  The even lower bound is already available from Section 3; the odd detector is constructed without one,
  and its normalization remains conditional until Proposition 70.

Throughout, $S$ contains $2$ and the primes dividing the conductor $N$.
  A filter prescribes local unit squareclasses at $S$, together with the infinite sign,
  and excludes finitely many further primes. Its indices are $h = sigma D$, where $D$ is positive and squarefree.
  All primes adjoined subsequently are odd, good, and outside the current support.
  Put $F = bb(Q) \( E \[ 2 \] \)$. In the present residual range, $F$ is trivial or quadratic.
  A prime split in $F$ has weight $1$, and a prime inert in $F$, called simple, has weight $1 \/ 2$.
  We write $w \( D \)$ for the sum of these weights. All valuations satisfy $v \( 2 \) = 1$.

We use the theta multiplier cubed for weight $3 \/ 2$. Local unit characters and their associated Dirichlet
  characters are related by the usual inverse idele convention.
  Thus, if a finite Schwartz function satisfies $f \( u x \) = alpha \( u \) f \( x \)$,
  its scalar classical character on the lower-right entry is the Dirichlet character associated to $alpha^(- 1)$.
  This convention removes a possible inverse ambiguity in the formulas below.

=== 7.1 Even coefficients and exact comparison of ratios <even-coefficients-and-exact-comparison-of-ratios>

#thm([Proposition 7.1.])[
  (Even coefficient system).  #emph[Fix an even-sign filter and a nonvanishing index $D_0$ in it.
    There is a holomorphic cuspidal form $g = sum_(n gt.eq 1) a \( n \) q^n$ of weight $3 \/ 2$,
    orthogonal to unary theta series, of level supported on a fixed enlargement of $S$, and characters $eta \,
    psi$ of $2$-power order such that $psi \/ eta = chi_(- sigma)$ and
#[#set math.equation(numbering: n => "(7.1)")
 $ a \( p^2 n \) = #scale(x: 120%, y: 120%)[\(] eta \( p \) a_p \( E \) -
   psi \( p \) \( - n \/ p \) #scale(x: 120%, y: 120%)[\)] a \( n \) -
   p eta \( p \)^2 a \( n \/ p^2 \) wide \( p in.not S \) . $ <co:recurrence>]

 Its coefficients are zero off the unit-squareclass filter.
   After normalization at $D_0$, every squarefree coefficient is rational up to a $2$-power root of unity.
   For two nonzero squarefree coefficients,
#[#set math.equation(numbering: n => "(7.2)")
 $ 2 v #h(-0.16667em) (frac(a \( D \), a \( D_0 \))) = v #h(-0.16667em)
   (frac(L_(*) \( sigma D \), L_(*) \( sigma D_0 \))) . $ <co:exact-ratio>]

 Moreover $a \( D \) eq.not 0$ exactly when $L \( E^(\( sigma D \)) \, 1 \) eq.not 0$.
   Consequently any previously established bound $v \( L_(*) \( sigma D \) \) gt.eq 2 w \( D \) +
   s \( sigma D \) - C$ gives
#[#set math.equation(numbering: n => "(7.3)")
 $ v \( a \( D \) \) gt.eq w \( D \) + 1 / 2 s \( sigma D \) - C_g $ <co:even-bound>]

 with $C_g$ fixed independently of $D$.]
] <co:even>

#proof[
  Use the Shimura packet of $E^(\( - sigma \))$. Its positive index $D$ tests the twist by $chi_(- D)$,
    which is $E^(\( sigma D \))$. The nonvanishing at $D_0$ selects a globally occurring member admitting that
    Fourier functional. Take its spherical vector outside $S$ and its holomorphic vector of weight $3 \/ 2$ at infinity.
  Here is the support-local vector selection. Start with a vector on which the $D_0$ Fourier functional is
    nonzero. Projection under a sufficiently large compact group of upper unipotents to additive frequency $D_0$
    restricts the potentially nonzero unit translates to arbitrarily small neighborhoods of the two solutions of
    $u^2 = 1$. Choose a unit character agreeing with the forced action at $- 1$. It can have $2$-power order:
    the image of $- 1$ is detected in the $2$-primary quotient of the unit group.
    The neighborhoods of $1$ and $- 1$ then contribute with the same sign,
    so this projection preserves the nonzero functional. Upper integral translations act trivially,
    and smoothness gives sufficiently deep lower-unipotent invariance.
    The vector therefore defines a classical form at a level supported on $S$,
    allowing arbitrary depth at $2$ and at the bad primes. The unit-squareclass and coprimality sieves commute
    with good $T \( p^2 \)$, since their conditions are unchanged by multiplication of the index by $p^2$.
    The classical Hecke formula #cite(label("Shimura1973HalfIntegral")) gives (7.1), with $eta = psi chi_(- sigma)$.
  At the level just chosen, let $V$ be the full space of weight-$3 \/
    2$ cusp forms orthogonal to unary theta series, with scalar character $psi$ and good $T \( p^2 \)$ eigenvalues
    $eta \( p \) a_p \( E \)$. It contains the constructed form, whose coefficient at $D_0$ is nonzero.
    For $D \/ D_0$ a unit square at every support prime, Waldspurger’s comparison #cite(label("Waldspurger1981"))
    Corollary 2, pp. 483–484 gives, for every $f in V$,
  $ a_f \( D \)^2 = psi \( D \/ D_0 \) frac(L_(*) \( sigma D \), L_(*) \( sigma D_0 \)) a_f \( D_0 \)^2 . $
  Its hypothesis (H1) follows from the nonzero eigenspace #cite(label("Waldspurger1981")) §I.2, Proposition 2;
    the final paragraph of the comparison proof removes (H2) for these local squareclasses.
    Factoring the displayed quadratic identity in the two coefficient functionals shows that they are proportional
    on all of $V$, with one scalar independent of $f$. This includes oldvectors and their linear combinations;
    if the central value at $D$ vanishes, the first functional is simply zero.
  Choose an algebraic form $g$ in the filtered subspace of $V$ with $a \( D_0 \) eq.not 0$.
    To justify this choice, multiplication by ordinary theta embeds the space into an integral-weight space,
    and divisibility by theta is specified by algebraic cusp conditions
    #cite(label("Ramsey2006HalfIntegral")) §§3–4. The character,
    good-Hecke and filter conditions are algebraic linear conditions as well.
    Since evaluation at $D_0$ is nonzero after extension to $bb(C)$, it is nonzero on some algebraic form.
  Let $u$ be an automorphism of $overline(bb(Q))$ acting on the character values by an odd power $e$,
    and put $nu = eta^(\( e - 1 \) \/ 2)$. The forms $g^u$ and $g ⊗ nu$ have the same scalar character $psi^e =
    psi nu^2$ and the same good eigenvalues $eta \( p \)^e a_p \( E \) = nu \( p \)^2 eta \( p \) a_p \( E \)$;
    here $psi \/ eta$ is quadratic. They belong to one good-Hecke eigenspace at a common level still supported on
    $S$. Applying the preceding proportionality in that nonzero space and normalizing at $D_0$ gives
  $ u \( xi \) = nu \( D \/ D_0 \) xi \, wide xi = a \( D \) \/ a \( D_0 \) . $
  Local square roots of $D \/ D_0$ at the conductor of $eta$ give a value $z$ of $eta$ with $eta \( D \/ D_0 \) =
    z^2$. Then $u \( z \) = z^e$ and $nu \( D \/ D_0 \) = z^(e - 1)$,
    so $xi \/ z$ is fixed by every algebraic automorphism and is rational.
    Moreover the same local-square condition gives $psi \( D \/ D_0 \) = eta \( D \/ D_0 \) = z^2$.
    The comparison therefore reads
  $ \( xi \/ z \)^2 = frac(L_(*) \( sigma D \), L_(*) \( sigma D_0 \)) \, $
  which proves (7.2) since $v \( z \) = 0$. There is no product over the new prime factors:
    the unramified squarefree formula includes both local valuations zero and one.
    No exceptional local representation at $2$ is excluded by the same-local-class comparison.
    The vanishing assertion and (7.3) follow. ◻
]

=== 7.2 A detecting Kummer functional <a-detecting-kummer-functional>

Fix now the positive odd-sign filter and its original support,
  including the auxiliary class-group tests needed for arithmetic realization.
  Choose a fixed negative odd fundamental discriminant $h_(*)$ with $L \( E^(\( h_(*) \)) \, 1 \) eq.not 0$,
  whose local squareclasses agree with those of the filter at $2 N$.
  Adjoin its prime factors to $S$, exclude them from the variable indices,
  and refine the fixed unit tests there as required, all before varying $D$.
  Choose it so that $\| h_(*) \| > 4$ and one of its ramified primes excludes the CM field of $E$, if there is one. Thus

$ K_D = bb(Q) \( sqrt(D h_(*)) \) $

is imaginary, split at $2 N$, and has only the units ${ 1 \, - 1 }$.
  Fix a modular parametrization $phi$ with $phi \( oo \) = 0$ throughout.
  With this normalization the cuspidal constants in its Hecke and Atkin–Lehner relations are torsion;
  see #cite(label("Manin1972")) #cite(label("Drinfeld1973")).
  An arbitrary translation by a rational point is not permitted.

Let $H_D$ be the Hilbert class field of $K_D$. Choose an $cal(O)_(K_D)$-ideal $frak(n)_D$ with $cal(O)_(K_D) \/
  frak(n)_D tilde.eq bb(Z) \/ N bb(Z)$, fixing one orientation at each level prime,
  and let $x_D in X_0 \( N \) \( H_D \)$ be its conductor-one CM point.
  The unramified genus character $chi_D$ attached to $K_D \( sqrt(h_(*)) \) \/
  K_D$ satisfies $chi_D \( \[ frak(a) \] \) = chi_(h_(*)) \( "Norm" frak(a) \)$ on ideals prime to $D h_(*)$.
  Define the unaveraged character sum

$ P_D = sum_(\[ frak(a) \] in "Pic" \( cal(O)_(K_D) \)) chi_D \( \[ frak(a) \] \) phi \( x_D^(\[ frak(a) \]) \) . $

These conductor-one genus sums over the varying fields $K_D$ are distinct from the conductor-$\|
  h \|$ ring-class sums over a fixed field $K$ defined in Section 4.
  The point $P_D$ lies in $E \( bb(Q) \( sqrt(D) \, sqrt(h_(*)) \) \)$,
  with the quadratic interpretation when $D = 1$. Its genus-character component over $K_D$ is the sum of the $D$-
  and $h_(*)$-twist components over $bb(Q)$. The latter has rank zero because $L \( E^(\( h_(*) \)) \, 1 \) eq.not
  0$. Thus the free part of $P_D$ lies in the $D$-twist component, a line when $E^(\( D \))$ has a simple zero.
  We retain the unaveraged sum in the theta comparison; a fixed integer $L$ kills bounded-degree torsion and makes
  its comparison with a rational twist point integral. At a simple zero write $j \( P_D \)$ for its index
  valuation in the free rational twist line, allowing the fixed restriction and projection indices.
  Put $j \( P_D \) = + oo$ if the product derivative vanishes.

#thm([Lemma 7.2.])[
  (Kummer detection, including CM).  #emph[Let $C$ act on $T = T_2 E$ as complex conjugation,
    and choose a nonzero integral row $b : T arrow.r bb(Z)_2$ with $b C = b$.
    For a fixed positive simple-zero witness $D_w$, there are arbitrarily large precisions $M$ and good primes
    $ell$ such that
#[#set math.equation(numbering: n => "(7.4)")
 $ rho_T \( "Fr"_ell \) equiv C med \( mod med 2^M \) \, wide \( h_(*) \/ ell \) = - 1 \, wide \( D_w \/ ell \) =
   1 . $ <co:ell-conditions>]

 Evaluation at Frobenius squared defines an integral homomorphism
$ lambda_M : E \( bb(F)_(ell^2) \) arrow.r bb(Z) \/ 2^M bb(Z) \, wide lambda_M = b kappa_M \, $

 of Frobenius sign $+ 1$. The valuation of $lambda_M \( "red"_ell \( L P_(D_w) \) \)$ is bounded independently of
   $M$, for a fixed nonzero integer $L$ making the twist comparison integral.
   Extra fixed finite-field restrictions can be retained when they agree with the chosen complex-conjugation
   coset, or when a compatible lift has been specified.]
] <co:kummer>

#proof[
  For every elliptic curve $A \/ bb(Q)$, the rational Tate module $V_2 A$ is irreducible.
    Indeed Faltings’ semisimplicity and endomorphism theorem #cite(label("Faltings1983")) §1,
    assertions (a),(b) would turn a proper summand into a nontrivial idempotent in $"End"_(bb(Q)) \( A \) ⊗
    bb(Q)_2 = bb(Q)_2$. The equality of this endomorphism ring with $bb(Z)$ includes CM curves:
    a nonreal CM endomorphism is not defined over $bb(Q)$. The Tate image contains a nonidentity central scalar,
    by the homothety theorem #cite(label("Bogomolov1981Points")) §2, Theorem 3 and paragraph 7.
  Let $Q in A \( bb(Q) \)$ be nontorsion and let $c_Q$ be its division cocycle.
    On the kernel of the Tate action its image is a closed $bb(Z)_2$-submodule of $T_2 A$,
    stable under the full Galois image. If its rational span were zero,
    the rational Kummer class would factor through the Tate image.
    A central scalar $z eq.not 1$ annihilates its first cohomology:
    for a cocycle $c$ the equality of $c \( z g \)$ and $c \( g z \)$ gives $\( z - 1 \) c \( g \) = \( g - 1 \)
    c \( z \)$, so $c$ is a coboundary over $bb(Q)_2$. This contradicts Kummer injectivity and the finite
    generation of $A \( bb(Q) \)$. Irreducibility consequently makes the translation image contain $2^a T_2
    A$ for some $a$. Intersecting with the kernel of additional finite data retains a full lattice.
  Apply this to the rational twist point supplied by $L P_(D_w)$ on $A = E^(\( D_w \))$.
    Since $D_w > 0$, conjugation acts on its Tate module as $C$.
    Modify a conjugation lift by an element of the simultaneous kernel whose translation is $v$.
    The square of the modified element has translation $\( 1 + C \) v$, and $b \( 1 + C \) v = 2 b \( v \)$.
    The full-lattice property allows a choice with a fixed finite nonzero valuation.
    Conjugation acts trivially on $bb(Q) \( sqrt(D_w) \)$ and nontrivially on $bb(Q) \( sqrt(h_(*)) \)$.
    Chebotarev in each finite torsion, division, and character extension gives (7.4) and the chosen finite nonzero
    detection.
  For good $ell$, Lang’s theorem and finite-field Kummer theory give
  $ E \( bb(F)_(ell^2) \) \/ 2^M E \( bb(F)_(ell^2) \) tilde.eq T \/ #scale(x: 120%, y: 120%)[\(] 2^M
    T + \( "Fr"_ell^2 - 1 \) T #scale(x: 120%, y: 120%)[\)] = T \/ 2^M T . $
  This is evaluation of a cocycle at arithmetic Frobenius squared.
    Its equivariance and $b C = b$ prove the sign assertion. Reduction of the division cocycle gives precisely the
    detection already arranged. Finally $det C = - 1$ implies $ell equiv - 1 med \( mod med 2^M \)$. ◻
]

=== 7.3 The finite Schwartz function and its transformation <the-finite-schwartz-function-and-its-transformation>

#thm([Lemma 7.3.])[
  (Explicit weighted theta construction).  #emph[For $ell$ as in Lemma 47,
    the reduced modular parametrization followed by $lambda_M$ admits an integral weighted ternary theta lift.
    After extraction of the coefficients at multiples of $\| h_(*) \|$ it gives a classical holomorphic
    weight-$3 \/ 2$ form $g_M = sum a_M \( n \) q^n$, of level supported on $S union { ell }$,
    with (7.1) modulo $2^M$. The associated characters have $2$-power order and quadratic ratio.
    For squarefree admissible $D$,
#[#set math.equation(numbering: n => "(7.5)")
 $ a_M \( D \) = c_0 thin 2^(omega \( N \)) zeta_M \( D \) lambda_M #scale(x: 120%, y: 120%)[\(]
   "red"_ell \( L P_D \) #scale(x: 120%, y: 120%)[\)] med \( mod med 2^M \) \, $ <co:weighted-comparison>]

 where $zeta_M \( D \)$ is a $2$-power root of unity and $c_0 \, L$ are fixed integers independent of $D \, M \,
   ell$. The extra index restriction at $ell$ is $\( D \/ ell \) = 1$.]
] <co:theta-bridge>

#proof[
  Let $B$ be ramified at $ell$ and infinity, $R$ an Eichler order of level $N$, and $V = B^0$ with $Q \( x \) = -
    x^2 = "Nrd" \( x \)$. The root characters at the fixed level primes below are chosen once.
    Let $cal(O)$ be the valuation ring at a place above $2$ of the field generated by their values.
    The other local weights are quadratic, so this field is independent of $M$ and $ell$.
    In this construction integrality means membership in $cal(O)$, and congruences mean congruences modulo $2^M cal(O)$.
  #emph[The supersingular coefficient function.] The supersingular pairs on $X_0 \( N \)$ are the finite set
  $ X = B^times without hat(B)^times \/ hat(R)^times . $
  This description permits every $N$ prime to $ell$, including arbitrary depth at $2$;
    see #cite(label("JetchevKane2010")) §§1.1–1.2,2.4–2.6. For $z in X$ put $R_z = B ∩ z hat(R) z^(- 1)$.
    Choose $L$ killing the finite subgroup generated by the images of the cuspidal constants in the Atkin–Lehner
    relations, and also all the bounded-degree torsion used below. Then
  $ P_M \( z \) = lambda_M \( L phi_ell \( z \) \) \, $
  where $phi_ell$ is the specialization of $phi$ to the good-reduction special fiber.
    This function has Brandt eigenvalues $a_p \( E \)$ away from $N ell$,
    Atkin–Lehner eigenvalue $w_(p^e)$ at $p^e bar.v.double N$, and eigenvalue $+
    1$ under the right $ell$-uniformizer. These identities are modulo $2^M$.
    Choose any integer lifts of this finite list of values.
  #emph[The local Schwartz weights.] We now define the local functions,
    rather than appealing to an unspecified weighted theta theorem.
    Off $2 N h_(*) ell$ take the characteristic function of $R_p^0$. At $p^e bar.v.double N$, use a model
  $ R_p = {mat(delim: "(", a, b; c, d) : a \, b \, d in bb(Z)_p \, c in p^e bb(Z)_p} . $
  Require the split fundamental unit squareclass and an integral embedding.
    Its action on the cyclic level quotient selects one root $r in bb(Z)_p^times$ of $x^2$.
    Give $x$ weight $alpha_p \( r \)$, where $alpha_p$ is a finite unit character of $2$-power order with
  #[#set math.equation(numbering: n => "(7.6)")
   $ alpha_p \( - 1 \) = w_(p^e) chi_(h_(*)) \( p \)^e . $ <co:root-parity>]
  Such a character exists for either prescribed sign. The root is a locally constant function to any fixed
    character precision: the two idempotents of the split integral quadratic algebra distinguish the two summands
    of the cyclic quotient. Unit scaling $x mapsto u x$ multiplies this weight by $alpha_p \( u \)$,
    and order-unit conjugation preserves it.
  At $2$ require $\( 1 + x \) \/ 2 in R_2$ and $x^2 in bb(Z)_2^(times 2)$.
    If $2 divides N$, the preceding selected-root rule is imposed using $e_x = \( 1 + x \) \/ 2$.
    Its two eigenvalues $\( 1 + r \) \/ 2 \, \( 1 - r \) \/ 2$ differ by the odd unit $r$;
    hence the two idempotents remain distinct modulo $2$. This verifies the construction at every exponent of $2$
    in $N$. Scaling by an odd $u$ preserves integrality, since $\( 1 + u x \) \/ 2 =
    u \( 1 + x \) \/ 2 + \( 1 - u \) \/ 2$. This is an invertible affine change of the operator $e_x$,
    so it preserves its two summands individually. The selected summand is selected by the cyclic level quotient,
    not by declaring its eigenvalue to be $0$ or $1$ modulo $2$.
    On that same summand $x$ acts as $r$ and $u x$ acts as $u r$.
    Even when $u equiv - 1 med \( mod med 4 \)$ interchanges the two eigenvalue parities,
    the root weight therefore changes by exactly $alpha_2 \( u \)$. If $2 divides.not N$ there is no root weight at $2$.
  For $p divides h_(*)$ require $x in M_2 \( bb(Z)_p \)^0$ and $v_p \( Q \( x \) \) = 1$.
    Its reduction is a nonzero nilpotent. Fix $X_0 = mat(delim: "(", 0, 1; 0, 0)$ and define
  $ epsilon.alt_p \( g X_0 g^(- 1) \) = (frac(det g, p)) . $
  The centralizer consists of $mat(delim: "(", a, b; 0, a)$, with determinant $a^2$,
    so this is well-defined on the entire nonzero nilpotent orbit. It obeys
  $ epsilon.alt_p \( u y u^(- 1) \) = \( det u \/ p \) epsilon.alt_p \( y \) \, wide
    epsilon.alt_p \( a y \) = \( a \/ p \) epsilon.alt_p \( y \) . $
  The second equality follows by conjugating $X_0$ by $"diag" \( a \, 1 \)$.
    Set $f_p \( x \) = epsilon.alt_p \( macron(x) \)$ on the specified support.
    Thus the right conjugation character is precisely the local component of $chi_(h_(*)) compose "Nrd"$.
  At $ell$, let $frak(P)$ be the maximal ideal of the maximal order.
    Its residue field is $bb(F)_(ell^2)$, and the reduction of an integral trace-zero element lies on its
    one-dimensional trace-zero line. Fix a nonzero basis vector $beta$ on that line and put
  $ f_ell \( x \) = (t / ell) quad upright("if ") macron(x) = t beta eq.not 0 \, wide f_ell \( x \) = 0 quad
    upright("otherwise") . $
  Order units act trivially by conjugation on the residue field.
    A uniformizer acts by its nontrivial automorphism and sends $beta$ to $- beta$.
    Therefore its multiplier is $- 1$, since $ell equiv - 1 med \( mod med 4 \)$;
    scaling has character $\( u \/ ell \)$. Moreover $beta^2$ is a nonsquare and $-
    1$ is a nonsquare modulo $ell$, so $Q \( x \) = - t^2 beta^2$ is a nonzero square.
    Because $\( \| h_(*) \| \/ ell \) = 1$, the extracted indices automatically satisfy $\( D \/ ell \) = 1$.
    No average over $bb(F)_ell^times$ is used.
  All these functions have compact support and are locally constant.
    Let $f = product f_p$, incorporating any additional fixed unit-squareclass conditions by their characteristic
    functions. Those conditions are stable under unit squares and change none of the scaling characters.
    For $u in hat(R)^times$,
  #[#set math.equation(numbering: n => "(7.7)")
   $ f \( u^(- 1) x u \) = chi_(h_(*)) \( "Nrd" u \)^(- 1) f \( x \) . $ <co:order-equivariance>]
  The product scaling character is even. Indeed its value at $- 1$ is
  $ (product_(p^e bar.v.double N) w_(p^e) chi_(h_(*)) \( p \)^e) chi_(h_(*)) \( - 1 \) \( - 1 \) = 1 \; $
  the parenthesized factor is the even functional sign of $E^(\( h_(*) \))$.
    Denote its associated classical character by $eta_B$. In the inverse-idele convention fixed above,
    if $alpha$ is this finite scaling character, then $eta_B \( d \) =
    alpha \( d \)$ for positive integers $d$ prime to the support:
    the inverse idele character becomes the product of the finite unit values at the lower-right entry.
  #emph[The scalar transformation law.] Here are all the Weil-representation checks needed for scalar modularity.
    For an additive character of conductor $bb(Z)_p$, write $n \( b \) = mat(delim: "(", 1, b; 0, 1)$,
    $m \( u \) = "diag" \( u \, u^(- 1) \)$, and $n^(-) \( c \) = mat(delim: "(", 1, 0; c, 1)$.
    Use a Weyl lift $w$, its compatible self-dual Fourier transform, and the Weil factors $gamma_p \( u \) \,
    gamma_p$ for this additive character. The defining formulas are
  $ omega \( n \( b \) \) f_p \( x \) = upright(bold(e))_p \( b Q \( x \) \) f_p \( x \) \, quad
    omega \( m \( u \) \) f_p \( x \) = gamma_p \( u \) \| u \|_p^(3 \/ 2) f_p \( u x \) \, quad
    omega \( w \) f_p = gamma_p hat(f)_p . $
  They follow from the Weil construction and Poisson summation #cite(label("Weil1964")) I, no. 13.
    Integral $b$ fixes $f_p$, since $Q$ is integral on its support.
    If $f_p$ is invariant under translations by a lattice $L'_p$,
    its Fourier transform is supported on the dual lattice $\( L'_p \)^or$.
    Choose $A_p$ so that $p^(A_p) Q \( \( L'_p \)^or \) subset bb(Z)_p$.
    Then $n \( p^(A_p) b \)$ fixes $hat(f)_p$, and conjugating by $w$ proves that every $n^(-) \( p^(A_p) b \)$
    fixes $f_p$. This argument works without change at $2$ and for all finite character depths.
  Relative to the ordinary theta multiplier cubed, the diagonal Weil factor is $\( det Q \, u \)_p$.
    Indeed diagonalizing $Q$ and multiplying the one-dimensional Weil-index identities #cite(label("Weil1964"))
    II, nos. 25, 28 gives the Hilbert symbol of the product of its three coefficients.
    In a presentation $B = \( - a \, - b \)$ that product is the determinant of $a X^2 + b Y^2 + a b Z^2$,
    namely $\( a b \)^2$. Thus this additional factor is $1$.
    The remaining diagonal action is exactly the scaling character already computed.
    Increasing $A_2$ to the depth needed for the standard metaplectic splitting, the factorization
  $ mat(delim: "(", a, b; c, d) = n^(-) \( c \/ a \) m \( a \) n \( b \/ a \) \, wide c in p^(A_p) bb(Z)_p \,
    a in bb(Z)_p^times \, $
  proves scalar transformation on the required local $Gamma_0$.
    Conjugation by $z$ commutes with these Weil actions and preserves $Q$.
    Consequently the same level and scalar character work for every summand.
    The Gaussian at infinity gives holomorphic weight $3 \/ 2$;
    positive definiteness gives nonnegative exponents at every cusp.
  Choose an integer $c_0$ divisible by every possible $\| R_z^times \|$.
    Such a uniform choice exists because these unit groups embed in $"GL"_4 \( bb(Z) \)$ and their orders are
    bounded. The theta series is
  #[#set math.equation(numbering: n => "(7.8)")
   $ H_M \( n \) = c_0 sum_(z in X) frac(P_M \( z \) chi_(h_(*)) \( "Nrd" z \), \| R_z^times \|) sum_(x in B^0\
Q \( x \) = n) f \( z^(- 1) x z \) . $ <co:theta-sum>]
  Equation (7.7) proves independence of right representatives; rational reduced norms are positive,
    so the norm character is trivial on the left rational action.
    The preceding Weil calculation proves modularity #cite(label("Weil1964")) III, Theorem 6,
    and the choice of $c_0$ proves integral Fourier coefficients.
    More precisely, each $c_0 \/ \| R_z^times \|$ is an integer,
    so changing a lift of $P_M \( z \)$ by $2^M$ changes every coefficient by an element of $2^M cal(O)$.
    No precision is lost to a stabilizer denominator. The chosen integer lifts need satisfy no characteristic-zero
    eigenrelation.
  #emph[The good-prime Hecke relation.] For completeness, the good-prime relation can be checked in a matrix
    order. Neighbors correspond to the lines in $bb(F)_p^2$. A nonzero primitive nilpotent reduction has exactly
    one invariant line. For an integral element of nonzero reduction and norm $n$,
    the number of invariant lines is $1 + \( - n \/ p \)$; zero reduction contributes the additional $p$ lines.
    If a primitive $y$ has $p^2 divides Q \( y \)$, choose a basis in which its reduction is $X_0$.
    Its lower-left entry is divisible by $p^2$, and exactly the neighbor for that invariant line makes $y \/
    p$ integral. These counts partition the three terms of the theta Hecke operator.
    Scaling by $p$ at the support contributes $eta_B \( p \)$,
    and the reduced norm of a Brandt neighbor contributes $chi_(h_(*)) \( p \)$. Thus, with $A \( n \) = H_M \( n \)$,
  $ A \( p^2 n \) + eta_B \( p \) \( - n \/ p \) A \( n \) + p eta_B \( p \)^2 A \( n \/ p^2 \) =
    eta_B \( p \) chi_(h_(*)) \( p \) a_p \( E \) A \( n \) med \( mod med 2^M \) . $
  The orbit-stabilizer weights in (7.8) are exactly the weights in this neighbor count.
    Extracting $a_M \( n \) = H_M \( \| h_(*) \| n \)$ gives $eta = eta_B chi_(h_(*))$ and $psi =
    eta_B \( \| h_(*) \| \/ dot.op \)$, proving (7.1). Fixed-support coefficient sieves are exact zero-or-retain
    operations; they preserve coefficient integrality and commute with this relation.
  #emph[The weighted coefficient comparison.] It remains to prove the weighted comparison;
    modularity alone does not supply it. At $n = \| h_(*) \| D$ the counted elements are precisely the optimal
    embeddings $cal(O)_(K_D) arrow.r.hook R_z$, sending $sqrt(D h_(*))$ to $x$.
    The condition at $2$ is exactly the condition on the integral generator $\( 1 + sqrt(D h_(*)) \) \/ 2$.
    At a level prime there are two orientations. Indeed a stable lattice splits into its two integral idempotent
    summands, and a cyclic quotient of order $p^e$ lies wholly in one summand.
    At $ell$ there are two orientations, the two residue-field embeddings.
    At all remaining primes there is a single local optimal-embedding orbit.
  Fix a rational embedding $x_0$ and an initial orientation tuple $z_0$.
    The orbits with these orientations are indexed by $"Pic" \( cal(O)_(K_D) \)$,
    with representatives $a z_0$ for $a in hat(K)_D^times$. The equality
  $ \( a z_0 \)^(- 1) x_0 \( a z_0 \) = z_0^(- 1) x_0 z_0 $
  shows that the Schwartz weight is constant along that orbit.
    Its remaining relative weight is $chi_(h_(*)) \( "Norm"_(K_D \/ bb(Q)) a \)$,
    exactly the unramified genus character. The reduction correspondence commutes with this ideal-class action and
    remembers the cyclic level subgroup #cite(label("JetchevKane2010")) §2;
    a Galois-equivariant description of the lift, class action and reduction is given in
    #cite(label("CornutJetchev2013")) §3.2, §§4.6, 4.9–4.10 and Corollary 4.1.
    We use these correspondences only for their geometry; the weight identity has just been computed,
    and the multiplicity is computed next.
  An embedding stabilizer is $cal(O)_(K_D)^times = { plus.minus 1 }$.
    An orbit in $R_z$ therefore contains $\| R_z^times \| \/ 2$ elements, giving the factor $1 \/ 2$ in (7.8).
    At $p^e bar.v.double N$, reversing orientation multiplies its Schwartz factor by $alpha_p \( - 1 \) =
    w_(p^e) chi_(h_(*)) \( p \)^e$, and its norm-weighted parametrization value by the same sign.
    At $ell$ both multipliers are $- 1$: one is the residue-line calculation and the other is
    $chi_(h_(*)) \( ell \)$ times the Frobenius eigenvalue $+ 1$.
    Every one of the $2^(omega \( N \) + 1)$ orientation tuples consequently has the same contribution.
    The initial tuple has a $2$-power unit phase. Combining this count with its factor $1 \/
    2$ gives exactly (7.5). There is no division by a class number,
    and none of its rational multipliers grows with $ell$ or the number of factors of $D$. ◻
]

#thm([Proposition 7.4.])[
  (Odd coefficient detection).  #emph[The forms in Lemma 48, after a fixed adjustment of precision, satisfy
$ v \( a_M \( D \) \) gt.eq min { M \, j \( P_D \) - C } \, wide v \( a_M \( D \) \) < M med arrow.r.double med
  j \( P_D \) lt.eq v \( a_M \( D \) \) + C . $

 A visible coefficient detects $a \( E^(\( D \)) \) = 1$, and a fixed positive witness has bounded coefficient
   valuation as $M arrow.r oo$. All constants are independent of $M \, ell \, D$.]
] <co:odd>

#proof[
  Gross–Zagier identifies the height of the genus sum with the product derivative #cite(label("GrossZagier1986")).
    Since $L \( E^(\( h_(*) \)) \, 1 \) eq.not 0$, vanishing of the derivative makes $P_D$ torsion,
    and a nontorsion $P_D$ is equivalent to a simple zero of $E^(\( D \))$.
    The genus sum lies in a biquadratic field, so a fixed integer kills all possible torsion:
    reduce prime-to-residue-characteristic torsion at two fixed good primes of different residue characteristic;
    the residue degrees are at most four. Include that integer in $L$.
    On the free twist line, divisibility by $2^(j \( P_D \))$ remains divisibility after the integral maps of
    reduction and $lambda_M$. Restriction and the two quadratic projections have composite multiplication by $2$,
    so their integral indices have a fixed bound. Equation (7.5) therefore proves both valuation assertions,
    with fixed losses only. Lemma 47 gives the witness. ◻
]

=== 7.4 Minimum depth and integral coefficient operators <minimum-depth-and-integral-coefficient-operators>

We now pass from detection to normalization. For the even source,
  the cyclotomic lower bound gives (7.3) at every nonzero squarefree coefficient.
  For the odd source, assume for now that every simple-zero parameter satisfies

$ j \( P_D \) gt.eq w \( D \) + s \( D \) \/ 2 - C_(*) . $

Proposition 70 will prove this using only the even construction. Proposition 49 then gives

$ v \( a_M \( D \) \) gt.eq min { M \, w \( D \) + s \( D \) \/ 2 - C' } $

at simple zeros, where $s \( D \)$ is defined. At every other odd-sign parameter the product derivative vanishes
  and $a_M \( D \) = 0$ modulo $2^M$. In particular the coarser bound $v \( a_M \( D \) \) gt.eq min { M \,
  w \( D \) - C' }$ holds at every admissible $D$. The remaining coefficient calculus is conditional on these
  lower bounds; it does not establish them.

For the operator and graph arguments, at each actual odd stage we write $S$ for the original fixed support
  together with the primes of $h_(*)$ and the current reduction prime $ell$.
  The latter is stationary during that stage and is never an element of a newly adjoined set $U$.
  Thus every statement below about ramification outside $S union U$ includes $ell$.
  This notation does not change the original fixed data controlling the constants,
  or choose a new minimum when a vertex is omitted.

#thm([Lemma 7.5.])[
  (Stabilized minimum depth).  #emph[Assume the uniform arithmetic lower bounds just stated.
    Each coefficient source defines a binary symbol
#[#set math.equation(numbering: n => "(7.9)")
 $ A \( D \) =
   cases(delim: "{", 1 \, & v \( a \( D \) \) = delta + w \( D \) \,, 0 \, & v \( a \( D \) \) > delta + w \( D \)
   upright(" or ") D upright(" is off the filter") \,) $ <co:symbol>]

 with a fixed minimum normalized depth $delta$ and at least one bounded-weight witness.
   For the odd source $a = a_M$ at an actual stage: the numerical minimum and its divisibility statements
   stabilize at every fixed finite weight bound. The finite symbol tables on arithmetic labels will be stabilized
   separately in Section 9.5. At a unit symbol,
$ v \( L_(*) \( sigma D \) \) lt.eq 2 w \( D \) + O \( 1 \) quad upright("or") quad j \( P_D \) lt.eq w \( D \) +
  O \( 1 \) \, $

 respectively, and the analytic order is respectively zero or one.]
] <co:minimum>

#proof[
  For the even source normalize $a \( D_0 \) = 1$; the phase-removed squarefree coefficients are rational by
    Proposition 46. For the odd source, (7.5) makes every visible squarefree coefficient an integer times a root
    of unity modulo $2^M$. Their finite valuations are therefore integers in both cases,
    not arbitrary elements of a ramified coefficient field’s value group.
    The fractional part of $w \( D \)$ is fixed on the filter,
    because the parity of the number of simple primes is its fixed quadratic discriminant character.
    The lower bounds and a nonzero witness therefore give a minimum for the even source.
  For the odd source choose a nonprincipal ultrafilter on the increasing precisions.
    Minimize $v \( a_M \( D_M \) \) - w \( D_M \)$ over sequences with bounded weight and visible coefficient on
    an ultrafilter-large set. The uniform lower bound, discrete values,
    and fixed witness give a finite attained minimum. At each fixed weight cutoff $W$,
    failure of its divisibility on an ultrafilter-large set would allow a choice of a violating $D_M$ with
    $w \( D_M \) lt.eq W$, contrary to the minimum. Hence every prescribed finite list of these divisibilities
    holds at a sufficiently advanced actual stage. If larger weights arise in a coefficient-integrality check,
    the coarse bound $min { M \, w \( D \) - C }$ already pays any fixed normalization once both $M$ and
    $w \( D \)$ exceed its fixed threshold. This also explains why no infinite-precision modular lift is asserted
    or needed. The last conclusions follow from the two coefficient comparisons. ◻
]

Write $U_p sum c \( n \) q^n = sum c \( p n \) q^n$ and $V_p sum c \( n \) q^n = sum c \( n \) q^(p n)$.
  For a squarefree set $U$ put

#[#set math.equation(numbering: n => "(7.10)")
 $ B_U = 2^(- ceil.l delta + w \( U \) ceil.r) product_(p in U) \( U_p - eta \( p \) V_p \) g \, wide e_U =
   ceil.l delta + w \( U \) ceil.r - delta - w \( U \) . $ <co:BU>]

We call $U$ matching if $e_U = 0$ and opposite if $e_U = 1 \/ 2$.
  These operators introduce each new prime to level exponent one:
  $V_p$ changes the character by $\( p \/ dot.op \)$ and raises the level by $p$, while $U_p =
  U_(p^2) V_p$ on that raised level. Thus the new character is $psi_U = psi product_(p in U) \( p \/ dot.op \)$.

#thm([Lemma 7.6.])[
  (Coefficient bounds and unary removal).  #emph[For the even source let $U$ be arbitrary.
    For the odd source, fix an integer $R gt.eq 1$ and a weight bound $W$;
    all assertions below are made at a sufficiently advanced actual stage,
    simultaneously for every $U$ with $w \( U \) lt.eq W$ and every Fourier index.
    In these respective settings the coefficients of $B_U$ are integral.
    Write uniquely $n = J r m^2$, with $J subset.eq U$, $r$ squarefree, and $\( r \, U \) = 1$.
    The coefficient vanishes unless $D = \( U \/ J \) r$ belongs to the filter, and for the even source otherwise
#[#set math.equation(numbering: n => "(7.11)")
 $ v \( B_U \[ n \] \) gt.eq w \( r \) + 1 / 2 \# { p in J : p upright(" simple") } - e_U . $ <co:BU-bound>]

 At that stage the odd source satisfies this inequality for every $U$ with $w \( U \) lt.eq W$ and every $n$,
   with its right side replaced by its minimum with $R$. In particular the untruncated bound holds on any
   prescribed bounded range of squarefree weights, after choosing $R$ and the stage.
   For a split $p in J$ the difference factor, after its unit phase and one factor of $2$ are removed, has residue
#[#set math.equation(numbering: n => "(7.12)")
 $ c_p \( D \) = frac(a_p \( E \) - \( psi \/ eta \) \( p \) \( - D \/ p \) - 1, 2) med \( mod med 2 \) $ <co:cp>]

 at every square shell. For a simple $p$ this formula holds on the first shell $p divides.not m$.]
  #emph[Choose $i in { 0 \, 1 }$ such that $eta chi_(- 4)^i$ is odd, and set
$ Theta_J = sum_(m > 0\
\( m \, S \) = 1) eta \( m \) chi_(- 4) \( m \)^i m q^(J m^2) . $

 For matching $U$ the modular form
#[#set math.equation(numbering: n => "(7.13)")
 $ H_U = 1 / 2 (B_U - sum_(J subset.eq U\
J upright(" split only")) B_U \[ J \] Theta_J) $ <co:HU>]

 has integral coefficients, with the same stage and weight restriction in the odd case.
   For opposite $U$ put $H_U = B_U$. The new primes in the level of $Theta_J$ have exponent one,
   and its character is $eta chi_(- 4)^i \( - J \/ dot.op \)$.]
] <co:operators>

#proof[
  After removing the powers of $eta \( p \)$, the square-index multipliers in (7.1) are
  $ b_0 = 1 \, quad b_1 = a_p - kappa \, quad b_(s + 1) = a_p b_s - p b_(s - 1) \, wide
    kappa = \( psi \/ eta \) \( p \) \( - D \/ p \) . $
  If $p divides D$, then $kappa = 0$ and $b_s$ alternates between $1$ and $0$ modulo $2$, because $a_p$ is even.
    Thus the difference from $p in U \/ J$ is odd. If $p divides.not D$,
    all $b_s$ are odd and the difference from $p in J$ is even. Subtracting the normalization in (7.10) gives exactly
  $ delta + w \( \( U \/ J \) r \) + \# J - ceil.l delta + w \( U \) ceil.r = w \( r \) + 1 / 2 \# { p in J :
    p upright(" simple") } - e_U . $
  This is an integer on the allowed filter. Its only potential negative value before imposing parity is $-
    1 \/ 2$, so it is nonnegative.
  For the odd source this calculation first applies on a fixed bounded range of squarefree weights,
    with enough precision to pay the fixed normalizing power of $2$.
    To obtain the global truncated assertion, fix $R$ and a bound $W$ for $w \( U \)$.
    The normalizing exponents $ceil.l delta + w \( U \) ceil.r$ are uniformly bounded.
    Above a sufficiently large weight threshold, the coarse bound $min { M \, w \( D \) -
    C }$ from Lemma 50 pays that normalizing power and at least $R$ further factors of $2$,
    once $M$ is large enough. Below the threshold use the stabilized minimum and increase the precision again if
    needed. The recurrence has integral multipliers, so errors modulo $2^M$ remain divisible by $2^M$ at every
    square shell before normalization. Thus at the chosen stage the truncated bound holds at every coefficient for
    every $U$ with $w \( U \) lt.eq W$, giving integrality without asserting an unbounded valuation estimate for a
    fixed finite-precision lift.
  For split $p$, rationality of $E \[ 2 \]$ over $bb(F)_p$ gives $a_p equiv p + 1 med \( mod med 4 \)$.
    With $Delta_s = b_(s + 1) - b_s$, every $Delta_s$ is even and $Delta_(s + 1) = a_p Delta_s - p Delta_(s - 1)$,
    so $Delta_(s + 1) equiv Delta_(s - 1) med \( mod med 4 \)$. Direct calculation gives
  $ Delta_1 - Delta_0 = a_p^2 - a_p kappa - 2 a_p + 2 kappa + 1 - p equiv 0 med \( mod med 4 \) . $
  Consequently every $Delta_s \/ 2$ has the residue in (7.12). At a simple prime only $Delta_0$ is used.
  In matching parity the right side of (7.11) can vanish only when $r = 1$ and $J$ is split only.
    The same recurrence, retaining the character phases, gives $B_U \[ J m^2 \] equiv
    B_U \[ J \] eta \( m \) med \( mod med 2 \)$. The corresponding coefficient of $Theta_J$ has exactly that
    residue, and different squarefree $J$ have disjoint supports.
    The numerator in (7.13) is therefore divisible by the integer $2$,
    not just by the maximal ideal of a ramified character field.
    The ordinary odd-character unary theta transformation and dilation by $J$ give the asserted character and
    level. For the odd source these calculations use the same sufficiently advanced stage,
    uniformly for $w \( U \) lt.eq W$, with precision paying the fixed divisions as in Lemma 50. ◻
]

=== 7.5 Trace operators and omission of a whole rational prime <trace-operators-and-omission-of-a-whole-rational-prime>

The next step turns changing a Frobenius label into a difference of coefficient tests.
  Fix a coefficient valuation ring $cal(O)$, enlarging its field if needed for the finite eigensystem span below,
  and write $frak(m)$ for its maximal ideal. Divisibility by $2^a$ means divisibility in $2^a cal(O)$;
  reduced traces and expansions mean coefficientwise reduction of Fourier expansions modulo $frak(m)$.
  These are different operations; no saturation of the integral module below is assumed.
  The normalized squarefree tests are binary because their phase-removed values are rational $2$-adic integers
  (integer congruences at an odd stage), and every $2$-power root of unity reduces to $1$.

Multiply the form under consideration by $theta = 1 + 2 sum_(m > 0) q^(m^2)$.
  This gives a weight-two form with the same reduced expansion.
  Work in the finite-dimensional sum of its characteristic-zero good Hecke eigensystems,
  retaining old multiplicity spaces and its diamond transforms.
  The associated two-dimensional representations are the usual modular Galois representations for cusp forms
  #cite(label("Deligne1969")), and the sums of the two defining characters for Eisenstein series.
  Their commuting trace and determinant operators are denoted by $t \( u \) \, d \( u \)$.
  Arithmetic Frobenius at a good prime $q$ has trace $T_q$ and determinant $q chevron.l q chevron.r$.
  Let $cal(M)$ be the $cal(O)$-module generated by this weight-two vector and the undivided terms $theta
  B_U \[ J \] Theta_J$, together with all their good-Hecke and diamond translates.

#thm([Lemma 7.7.])[
  (Integral traces).  #emph[The module $cal(M)$ is an integral Fourier lattice preserved by the trace and
    determinant operators. On the coefficientwise reduced trace orbit of the indicated vector,
#[#set math.equation(numbering: n => "(7.14)")
 $ d \( u \) t \( v \) = t \( v \) \, wide t \( u \) t \( v \) = t \( u v \) + t \( u v^(- 1) \) \, wide
   t \( 1 \) = 0 . $ <co:trace-identities>]

 Every coefficient test of a finite product of traces can be performed using distinct fresh primes avoiding the
   tested index. In particular testing $t \( u_1 \) dots.h.c
   t \( u_a \)$ at $n$ becomes testing the original reduced coefficient at $n q_1 dots.h.c q_a$.]
] <co:traces>

#proof[
  We first check integrality of the generators. Diamonds act by scalars on $B_U$ and on each unary term.
    For (7.13), the only apparent denominator is removed by
  $ chevron.l u chevron.r H_U = psi_U \( u \) H_U + 1 / 2 sum_J B_U \[ J \] #scale(x: 120%, y: 120%)[\(]
    psi_U \( u \) - eta \( u \) chi_(- 4) \( u \)^i \( - J \/ u \) #scale(x: 120%, y: 120%)[\)] Theta_J \; $
  the difference of the two characters is zero or twice a unit.
    The same formula applies after multiplication by theta. Good Hecke operators commute with diamonds,
    and their coefficient formula preserves integrality. Thus all generators of $cal(M)$ are integral.
    Finitely many Fourier coefficients inject the ambient finite-dimensional space into a finite-dimensional
    coefficient space, so $cal(M)$ embeds in $cal(O)^r$ for some finite $r$.
    It is consequently a finite, closed $cal(O)$-module. Continuity and simultaneous Chebotarev approximation on
    the finitely many eigensystems approximate $t \( u \)$ and $d \( u \)$ by $T_q$ and $q chevron.l q
    chevron.r$ at every prescribed precision. These operators preserve $cal(M)$, so their limits do as well.
    They act by scalars on each good eigensystem and by the identity on its old multiplicity space,
    which retains the asserted commutation with level operators.
  The formula $\( T_q f \) \[ n \] = f \[ q n \] + q \( chevron.l q chevron.r f \) \[ n \/ q \]$ has no second
    term when $q divides.not n$. Successive distinct fresh primes therefore give the coefficient assertion.
    On a single character system, determinants reduce to $1$ because all characters have $2$-power order and the
    cyclotomic character is odd. On a subtracted vector the displayed diamond formula leaves unary corrections.
    A fresh trace kills each correction modulo the maximal ideal:
    the tested index $n q$ cannot have its prescribed squarefree part $J$ when $q divides.not n J$.
    This continues to hold after further fresh tests. Thus $d \( u \) t \( v \) =
    t \( v \)$ on the reduced trace orbit. Apply the matrix identity
  $ "tr" \( A \) "tr" \( B \) = "tr" \( A B \) + det \( B \) "tr" \( A B^(- 1) \) $
  to each characteristic-zero system and use that determinant identity. Finally $t \( 1 \) = 2$ before reduction. ◻
]

#thm([Lemma 7.8.])[
  (The level-prime inertia identity).  #emph[For $p in U$, choose inertia $tau_p$ on which the new ramified
    quadratic character is $- 1$, and an arithmetic Frobenius lift $phi.alt_p$ in the same decomposition group.
    In characteristic zero,
#[#set math.equation(numbering: n => "(7.15)")
 $ U_p^(\( 2 \)) #scale(x: 120%, y: 120%)[\(] t \( g tau_p phi.alt_p \) -
   t \( g phi.alt_p \) #scale(x: 120%, y: 120%)[\)] = d \( phi.alt_p \) #scale(x: 120%, y: 120%)[\(]
   t \( g tau_p \) - t \( g \) #scale(x: 120%, y: 120%)[\)] . $ <co:inertia-identity>]

 Here $U_p^(\( 2 \))$ extracts $p$-multiples in weight two. The identity commutes with further good traces.]
] <co:inertia>

#proof[
  A constituent old from a level omitting $p$ has trivial inertia, so both differences are zero,
    whatever $U_p^(\( 2 \))$ does on its old multiplicity space.
    Every other constituent has conductor exponent one and primitive ramified quadratic determinant.
    The conductor formula excludes monodromy and identifies it as principal series with one unramified and one
    ramified character. Local compatibility #cite(label("Carayol1986")) Theorem (A),
    after converting its geometric Frobenius convention to the arithmetic convention fixed above,
    identifies its $U_p^(\( 2 \))$ eigenvalue with the Frobenius eigenvalue $lambda$ on the unramified line. Write
  $ rho \( tau_p \) = mat(delim: "(", 1, 0; 0, - 1) \, wide rho \( phi.alt_p \) = mat(delim: "(", lambda, 0; 0, mu) . $
  If $z$ is the lower-right entry of $rho \( g \)$, the two trace differences are $- 2 z mu$ and $- 2 z$.
    Both sides of (7.15) equal $- 2 z lambda mu$. The Eisenstein character pair has the same calculation.
    A unary term is old if $p in.not J$, and has precisely this ramified quadratic character if $p in J$.
    This exhausts the constituents. ◻
]

For the interface below a #emph[label] is the restriction of a Frobenius element to an elementary $2$-extension
  unramified outside the indicated support. Its coordinates are quadratic characters.
  When $F$ is quadratic, choosing one of the two places at a split prime specifies an orientation;
  changing its ramification bit means multiplying by the image of inertia at that place.
  Product labels are the restrictions of products of Frobenius elements, so their quadratic coordinates add.
  Simple primes use rational quadratic labels. Section 8 will realize these labels simultaneously by primes and
  interpret the independent inertia changes as graph edges.

#thm([Proposition 7.9.])[
  (Symbol interface).  #emph[Under the arithmetic lower bounds in Lemma 50,
    the symbols of either coefficient source have the following properties.]
  + #emph[For matching $U$, the trace on split elements factors through the maximal elementary $2$-extension of
    $F$ unramified outside $S union U$. For opposite $U$, traces factor through the corresponding rational
    elementary extension. Adding a split vertex $q$ is read by coefficient $1$ of $t \( "Fr"_q \) H_U$;
    adding a simple vertex is read on the opposite $B_U$.]
  + #emph[Let $p in U$ and $g = "Fr"_q$. Changing one oriented ramification bit at $p$ changes the symbol by
#[#set math.equation(numbering: n => "(7.16)")
 $ A #scale(x: 120%, y: 120%)[\(] \( U \\ { p } \) union { q' } #scale(x: 120%, y: 120%)[\)] \, wide
   "Fr"_(q') tilde.op g phi.alt_p \, $ <co:contraction>]

 unless $p \, q$ are both simple, in which case the change is zero.
   The replacement has the product labels at all retained places.
   Its coefficient system has support $S union \( U \\ { p } \)$:
   the entire rational prime $p$, including both places above it when it splits in $F$, is omitted.]
  + #emph[A split vertex with trivial label in the elementary extension for the other vertices has zero symbol.]
  + #emph[In matching parity, insertion of two simple primes with equal rational labels on the fixed support and
    at the existing split vertices preserves the symbol if $\# E \( bb(F)_q \) \/ 2$ is odd for that label.
    Their mutual simple bits and their incidences with other simple vertices do not affect this statement.]
  #emph[These are coefficient identities. Simultaneous realization of their labels by primes is a separate
    arithmetic construction.]
] <co:symbol-interface>

#proof[
  For an odd source choose the stage in Lemma 51 with cutoff $R gt.eq 2$;
    only these fixed divisibilities and finitely many bounded-weight coefficient tests are needed below.
    Two fresh traces in matching parity, at least one split, add weight at least $3 \/ 2$.
    The allowed valuation in (7.11) is an integer, so it is at least $2$ before the unary division and the result
    vanishes after it. In opposite parity any two fresh traces add weight at least $1$; subtracting $e_U =
    1 \/ 2$ and using integral valuation again gives vanishing. The estimates persist under further tests.
    Hence respectively $t \( g \) t \( u \) = 0$ for split $u$, or $t \( g \) t \( u \) = 0$ for every $u$.
    Applying (7.14) to $t \( g u \) t \( u \)$ gives $t \( g u^2 \) = t \( g \)$.
    The quotient by the subgroup generated by squares is elementary abelian,
    and the Galois systems are unramified off their level. This proves the stated factorization.
    At coefficient $q$ the fresh split weight $1$ pays exactly the division in $H_U$;
    the fresh simple weight $1 \/ 2$ pays exactly $e_U$ in opposite parity. No unary term survives.
    This proves the symbol-reading assertion.
  For contraction, apply (7.15) at coefficient $1$, so that its left side is a coefficient-$p$ test.
    Replace its trace arguments by fresh primes. The first-shell calculation in Lemma 51 gives,
    in each of the split–split, split–simple, and simple–split cases,
  $ c_p \( D' \) A \( D' \) \, wide D' = \( U \/ p \) q' \, quad "Fr"_(q') tilde.op g phi.alt_p . $
  Here the omitted source is exactly $B_V$ or $H_V$, with $V = U \\ { p }$,
    constructed from the same original modular form and the same $eta \, psi \, delta$;
    no new minimum or normalization is chosen. To check the integer powers explicitly, put $n_U = ceil.l delta +
    w \( U \) ceil.r$ and let $m_U$ be $1$ in matching parity and $0$ otherwise.
    After fresh tests kill the unary terms, the first shell relative to the omitted-source test has multiplier
  $ 2^(1 + n_V - n_U - m_U + m_V) c_p \( D' \) . $
  For split $p$ the exponent is zero. For simple $p$ and matching $U$ it is also zero.
    For simple $p$ and opposite $U$ it is one; this is precisely the simple–simple case.
    The character change $psi_U \/ psi_V = \( p \/ dot.op \)$ is already the Legendre factor in this shell
    calculation. The phase is a unit and disappears on reduction.
    Let $q'_0 \, q'_1$ realize $g phi.alt_p \, g tau_p phi.alt_p$, respectively, and put $D'_i = V q'_i$.
    Applying inertia changes the Legendre term in (7.12) by a sign, so $c_p \( D'_1 \) = c_p \( D'_0 \) + 1$.
    Although these Frobenius elements may first be specified in the full current elementary extension,
    their restrictions to the omitted-source extension agree:
    inertia at either place above $p$ is killed in that extension.
    Its original characters are unramified at $p$, and its only new character factors come from $V$.
    Thus it is unramified at the whole rational prime $p$, giving $A \( D'_1 \) = A \( D'_0 \)$.
    If $Delta_(tau_p) A \( U q \)$ denotes the difference of the original tests with Frobenius labels $g
    tau_p$ and $g$, the reduced local identity is now explicitly
  $ Delta_(tau_p) A \( U q \) = c_p \( D'_1 \) A \( D'_1 \) + c_p \( D'_0 \) A \( D'_0 \) = A \( D'_0 \) \, $
  which is (7.16). When both vertices are simple the product Frobenius is split and the first-shell valuation has
    a positive excess; its reduction is zero. The entire-prime assertion follows from the actual support of the
    omitted-$p$ coefficient form, rather than from any convention about a chosen orientation.
    Isolation is the same symbol-reading test with $t \( 1 \) = 0$.
  For the final assertion first use two copies of a single simple Frobenius trace on matching $H_U$.
    Put $b = B_U \[ 1 \]$, $epsilon.alt = chi_(- 4) \( q \)$, and $kappa = \( psi_U \/ eta \) \( q \)$.
    Substitution of (7.1) and of the unary character gives the two terms in the coefficient-$1$ test of $T_q^2$,
    modulo $frak(m)$:
  $ H_U \[ q^2 \] & = frac(b eta \( q \), 2) \( a_q - kappa epsilon.alt - q epsilon.alt^i \) \,\
q \( chevron.l q chevron.r H_U \) \[ 1 \] & = frac(b eta \( q \), 2) q \( kappa - epsilon.alt^(i + 1) \) . $
  Their sum is
  $ frac(b eta \( q \), 2) (a_q + kappa \( q - epsilon.alt \) - q epsilon.alt^i \( 1 + epsilon.alt \)) . $
  For $q equiv 3 med \( mod med 4 \)$ the parenthesized half has residue $a_q \/ 2$; for $q equiv
    1 med \( mod med 4 \)$ it has residue $a_q \/ 2 + 1$. In both cases it is $\# E \( bb(F)_q \) \/
    2$ modulo $2$. Since $b$ reduces to $A \( U \)$, the squared trace has the required coefficient.
    Fresh-prime testing replaces its two copies by distinct primes.
    To pass to any pair with the specified labels, vary one prime at a time.
    After that simple prime is omitted the opposite-parity symbol depends only on rational elementary labels;
    simple–simple changes vanish by the proved contraction rule.
    Thus only the stated support and split-vertex labels matter. ◻
]

== 8 Arithmetic graphs and simultaneous addressing <gr:section>

Fix $b gt.eq 1$. An #emph[address] is a point $x in upright(bold(F))_2^b$;
  a vertex with activation $lambda in \( upright(bold(F))_2^b \)^(*)$ is present at $x$ when $lambda \( x \) = 1$.
  We will adjoin fresh primes with nonzero activations to a given collection of primes.
  The goal is to make one or two binary coefficient tests equal to $1$ at every $x eq.not 0$,
  while retaining all the original primes and their residue data. No new prime is present at $0$.
  The hypothesis is that each test, separately at each nonzero address,
  is a nonzero polynomial in the available residue bits.

The arithmetic identities are those of Proposition 54, conditional on its coefficient lower bounds.
  We first describe and realize their graph data, then state the simultaneous-testing result.
  Its proof uses contraction operators and two finite networks that isolate a prescribed derivative at one address.

=== 8.1 Labels and arithmetic realization <labels-and-arithmetic-realization>

Fix a finite set $S$ of rational primes, containing $2$ and all the ramified primes in the fixed data.
  Let $F$ be either $upright(bold(Q))$ or a quadratic field.
  For the rational two-torsion application $F = upright(bold(Q)) \( E \[ 2 \] \)$;
  the construction with full rational two-torsion also uses a quadratic auxiliary field in place of $F$.
  Include in $S$ primes whose prime ideals generate the class group of $F$,
  and include the infinite places in $S_F$. Put

$ V_S \( F \) = { alpha in F^times \/ F^(times 2) : v_(frak(p)) \( alpha \) equiv
  0 med \( mod med 2 \) upright(" for ") frak(p) in.not S_F } . $

This is a finite-dimensional $upright(bold(F))_2$-space: the valuation sequence expresses it as an extension of
  the finite squareclass group of $S_F$-units by a subgroup of the $2$-torsion of the $S_F$-class group.
  Its Kummer extension is denoted $F_S^(\( 2 \)) = F \( sqrt(V_S \( F \)) \)$.

A #emph[split vertex] is a rational prime $p in.not S$ split in $F$,
  together with a choice $frak(p) divides p$ if $F$ is quadratic. This choice is its #emph[orientation].
  Choose a generator $pi_(frak(p))$ with divisor $frak(p)$ outside $S_F$;
  class-group generation makes this possible. Conjugation supplies the generator for the other orientation, and

#[#set math.equation(numbering: n => "(8.1)")
 $ N_(F \/ upright(bold(Q))) \( pi_(frak(p)) \) = p u_(frak(p)) \, wide
   u_(frak(p)) upright(" a signed rational ") S upright("-unit") . $ <gr:norm>]

For $F = upright(bold(Q))$ use the rational generator $p$.
  A #emph[simple vertex] is an inert rational prime in the quadratic case, with rational generator $p$.
  The fixed label of a split vertex is its Frobenius on $F_S^(\( 2 \))$;
  simple vertices have rational fixed-support labels. A #emph[type] may additionally record the generators’ local
  squareclasses, valuation parities, real signs, and prescribed finite ray conditions at $S_F$.
  Only compatible, individually realizable types will be prescribed.
  A #emph[filter] fixes the total rational labels and sign of the signed-prime product $product_p p^(*)$,
  where $p^(*) = \( - 1 \/ p \) p$.

For a pair of split vertices in the quadratic case there are two independent forward bits:
  the residues of $pi_(frak(p))$ and $overline(pi_(frak(p)))$ at the chosen place of the other vertex.
  Write quadratic residues additively in $upright(bold(F))_2$.
  Reverse bits are determined by Hilbert reciprocity and the fixed types.
  Rational norm bits are determined by summing the two oriented bits and the fixed correction in (8.1).
  When at least one endpoint is simple, or $F = upright(bold(Q))$, there is one rational forward bit.
  Self-residues are never graph data. An #emph[arithmetic graph] is this collection of vertices, types, and bits.
  A split vertex is #emph[primary] when its generator is a square unit at every finite place of $S_F$ and positive
  at all real places. Different symbols may read compatible projections of the same graph,
  for example its rational norm graph. Here compatibility means that the projection forgets fixed-label
  coordinates or takes rational norm data, carries primary vertices to primary vertices,
  and commutes with the omitted-vertex product substitution.
  For the norm projection a single oriented-bit toggle changes the rational bit once.
  We use these arithmetic projections throughout.

#thm([Lemma 8.1.])[
  (Finite realization and product labels).  #emph[Fix finitely many old vertices, with all their mutual data,
    and individually realizable new types. Every prescription of the independent forward bits involving at least
    one new vertex has a realization by distinct fresh primes, avoiding an arbitrary finite set.
    The old vertices and their mutual data remain unchanged. The same holds with further fixed local tests
    included in $S$. A contracted split cluster may be represented by the product of its oriented generators,
    with conjugations prescribed along its contraction tree; its support types and external residue bits are the
    corresponding sums. A cluster containing one simple vertex has the corresponding rational product data.]
  #emph[For a symbol satisfying the omitted-vertex dependence in Proposition 54,
    its value depends only on the graph data. Products in the preceding assertion may therefore be replaced by
    fresh prime representatives without changing the prescribed contracted symbol.]
] <gr:realization>

#proof[
  First note that the listed generators account for all the relevant radicals.
    If $U$ is a finite set of new primes and a squareclass has even valuations outside $S_F union U_F$,
    divide by the generators at the primes of $U_F$ where its valuation is odd.
    The result belongs to $V_S \( F \)$. At an inert rational prime its rational generator has valuation one at
    the unique place of $F$. Thus fixed-support labels and the displayed residue bits determine every Frobenius
    test in an extension with this allowed ramification.
  We describe the prime selection carefully. For a new split vertex take a template $pi_0$ of its prescribed type,
    with prime ideal $frak(p)_0$ away from the old vertices. Weak approximation gives $a in
    F^times$ which is sufficiently close to $1$ at $S_F$, positive at the prescribed real places,
    and has any prescribed nonzero residues at the old prime ideals.
    Choose those residues so that $a pi_0$ has the desired quadratic residues there.
    Use the ray modulus consisting of sufficiently deep powers of the primes of $S_F$, all old prime ideals,
    and the real places. Choose a prime ideal $frak(q)$ in the ray class of $\( a \) frak(p)_0$. Then
  $ frak(q) = \( a beta \) frak(p)_0 \, wide beta equiv 1 med \( mod med upright("ray modulus") \) \, $
  and $pi_(frak(q)) = a beta pi_0$ is the required generator outside $S_F$.
    There are infinitely many such degree-one prime ideals. Indeed,
    the prime-ideal theorem in a ray class gives order $X \/ log X$ prime ideals of norm at most $X$,
    whereas prime ideals of residue degree greater than one contribute only $O \( X^(1 \/ 2) \)$ in a quadratic
    field. Degree one gives a split rational prime, and finite exclusions remove only finitely many choices.
  At an old inert prime with residue field $upright(bold(F))_(p^2)$, prescribe the norm of the nonzero residue.
    The norm onto $upright(bold(F))_p^times$ is surjective, so either rational residue bit is possible.
    For a new simple vertex the requirements are rational congruences, together with the inert class in $F$.
    The Chinese remainder theorem and Dirichlet’s theorem supply fresh primes.
    Successively adjoining vertices proves simultaneous finite realization.
    At every step reciprocity determines the reverse bits: the local Hilbert symbols at the support are fixed,
    and the only other contributions are the two endpoint residues.
    Taking norms gives exactly (8.1), so it imposes no additional independent bit.
  The same argument applies to a product template. Its valuations and local squareclasses at $S_F$ are those of
    the product, and its residues at the remaining vertices multiply.
    The ray-class construction replaces that template by a degree-one prime with those data.
    In a simple cluster we instead use rational congruences for the norm labels.
    No residue at a prime inside the cluster is imposed on its replacement.
  In particular this preserves the rational filter, including its norm correction.
    Write $pi = product_i pi_i$ for the oriented product template and $pi' =
    a beta pi$ for its fresh representative; $a beta$ is a square unit at $S_F$ and positive at its real places.
    The support valuations of $pi'$ and $pi$ agree exactly. Hence
  $ N pi = \( product_i p_i \) u \, wide N pi' = q u $
  with the same signed rational $S$-unit $u$: all its valuations and its sign agree.
    The quotient $q \/ product_i p_i = N \( a beta \)$ is a local square at the rational support.
    Its squareclass at $2$ also identifies $q^(*)$ with $product_i p_i^(*)$ at those fixed tests.
    Thus no free choice of an untracked $S$-unit has entered a product replacement.
  Finally, compare two disjoint realizations with identical graph data.
    Introduce fresh bridge vertices with matching bits to both realizations, and replace vertices one at a time.
    At each replacement the omitted-vertex elementary Frobenius tests agree,
    by the generator description in the first paragraph. The symbol interface gives equal values.
    A preliminary bridge removes any overlap between the original realizations.
    The same reasoning applies to the product replacements. ◻
]

Primary types are realized by the preceding construction, starting with the principal ray class.
  Reciprocity makes their fixed radical labels trivial. Their signed rational contributions are squares at the
  fixed rational tests. If stationary vertices are also to have neutral incidences with an auxiliary,
  include their primes among these local tests. In particular,
  including the support of a fixed quadratic discriminant $k$ ensures that every such primary auxiliary splits in
  $upright(bold(Q)) \( sqrt(k) \)$.

=== 8.2 The simultaneous-testing statement <the-simultaneous-testing-statement>

Separate the given vertices into #emph[terminals] and, if present, stationary external vertices.
  Terminals may be always present or may have nonzero linear activations;
  external vertices have fixed types and incidences throughout.
  At each nonzero address the symbol is a function of the independent bits between the active terminals,
  with those types and external data fixed. We call its unique multilinear polynomial over $upright(bold(F))_2$
  the #emph[terminal polynomial]. Its variables describe formal changes of the terminal bits,
  while the prescribed prime realization supplies a fixed evaluation point.

For a bit $z$ define the finite difference $Delta_z f = f \|_(z = 0) + f \|_(z = 1)$.
  On a multilinear polynomial it is the formal partial derivative.
  In particular, differences commute and $Delta_z^2 = 0$.

#prodef([Definition 8.2.])[
  (Witnesses and permitted partitions).  A #emph[witness] is a finite graph on which the symbol is $1$.
    A graph is #emph[partitionable] for the symbol if its vertices can be partitioned into nonempty clusters,
    each with at most one simple vertex, with a choice of oriented contraction trees whose contracted graph is a
    witness. This definition includes a specified contraction certificate; it makes no assertion about a Selmer group.
] <gr:partitionable>

#thm([Theorem 8.3.])[
  (Address lemma).  #emph[Suppose the binary symbols under consideration depend only on the arithmetic graph data
    and satisfy the contraction, whole-rational-prime omission, and primary-isolation rules of Proposition 54,
    with the realization freedoms of Lemma 55. Contraction includes the product labels and external incidences,
    and the zero rule for two simple vertices. These identities are required only on nonempty configurations and
    for contractions with nonempty output. Fix $b gt.eq 1$ and either of the following terminal arrangements.]
  + #emph[One symbol, a nonempty set of always active terminals,
    and a nonzero polynomial in their independent pair bits.]
  + #emph[One or two symbols on terminals with nonzero linear activations,
    including at least one terminal for every nonzero linear form.
    At each $x eq.not 0$ each symbol separately is a nonzero polynomial in the active terminal bits.
    The symbols may read different compatible projections of a common graph alphabet and may have fixed stationary
    external data.]
  #emph[Suppose also that at each nonzero address the total active terminal data,
    together with any stationary external data, obey the required filter.
    Starting from any fixed realization of the terminal and stationary vertices,
    one can adjoin finitely many fresh primary auxiliary vertices, activated by nonzero linear forms,
    and choose only incidences involving these new vertices so that every symbol equals $1$ at every $x eq.not 0$.
    All data on the original vertices remain unchanged. No auxiliary is present at $0$.
    All auxiliaries may satisfy the fixed splitting and neutral external-incidence conditions incorporated into
    the primary type.]
  #emph[It is enough that a terminal polynomial have a nonzero evaluation or a nonzero iterated edge difference.
    In particular a partitionability certificate suffices for the stationary hypothesis.]
] <gr:address>

The proof has two algebraic steps. Forests of auxiliary vertices act as finite-difference operators on the
  original terminal polynomial. We then build networks whose degree-one terms select a chosen derivative at a
  single address. Applying them to top-degree coefficients will give the simultaneous value $1$,
  independently of the fixed terminal bits.

=== 8.3 From arithmetic contraction to forest operators <from-arithmetic-contraction-to-forest-operators>

#thm([Lemma 8.4.])[
  (Oriented forests).  #emph[Assume the graph-symbol rules stated in Theorem 57.
    Differentiation in a tree of graph bits contracts the tree, adding product labels and external incidences;
    its value is zero if the tree contains two simple vertices.
    Differentiation in any collection of edge variables containing a cycle is zero,
    even when different edges use incompatible relative orientations.
    Two different oriented variables on the same pair count as a cycle of length two.]
] <gr:forest>

#proof[
  The one-edge assertion is precisely the arithmetic contraction rule,
    with product replacements justified by Lemma 55. Induction proves the tree assertion:
    a split–split merger is split, a split–simple merger is simple,
    and the first merger of two components containing simple vertices has zero derivative.
    Along a tree there is a unique choice of relative orientations once one root orientation is fixed.
    Its product template depends on support types and external bits, not on the internal bits being differentiated.
  For clarity, consider first the two variables on a split pair $p \, q$.
    Differentiation in the inertia bit at one place over $p$ gives the symbol formed with the #emph[entire
    rational prime $p$ omitted]. Its elementary extension is unramified at both places over $p$.
    Differentiating in the other oriented bit is therefore zero.
    Repetition of the same variable is zero by $Delta_z^2 = 0$.
    This argument would not follow from omission of only one oriented prime ideal.
  For a longer cycle, first contract a spanning path. By the product-label rule the closing variable has become
    internal to the merged cluster. Its change affects neither the product’s support data nor any incidence to a
    remaining vertex. Equivalently it is an inertia change at an omitted endpoint,
    covered by the preceding unramifiedness argument. Thus its derivative vanishes.
    Possible conjugation of the product generator only changes the induced orientation and does not reintroduce
    that endpoint. Since there is no self-residue among the inputs to the replacement symbol,
    there is no extra closing-edge datum to retain. Additional derivatives commute with this zero derivative.
  For example, contract the aligned edge $12$ in a triangle.
    With $pi_12 = pi_1 pi_2$, the two bits toward vertex $3$ are $t_0 = z_13^0 + z_23^0$ and $t_1 = z_13^1 +
    z_23^1$, up to fixed type corrections. An aligned edge $23$ then differentiates $t_0$;
    a conjugately aligned closing edge $31$ differentiates $t_1$.
    Their mixed derivative is the omitted-endpoint zero just proved.
    If the closing edge is aligned instead, both become the same difference and its square is zero.
    Contracting a longer spanning path reduces to exactly these two alternatives. ◻
]

Fix a realizable baseline terminal graph and let $P$ be its terminal polynomial.
  A #emph[network] consists of additional primary vertices and programmed edges,
  with no direct terminal–terminal edges. All unprogrammed incidences of its primary vertices are neutral.
  Within one network choose one orientation at each terminal and consistently use the corresponding edge
  alignment. Networks may choose different alignments. The #emph[degree] of a contraction is the number of
  terminal vertices it removes by merging them.

#thm([Lemma 8.5.])[
  (Network expansion and its first two degrees).  #emph[A network acts on $P$ by a sum of finite-difference
    operators. A surviving term is a forest in which every component containing a primary vertex meets a terminal.
    A component meeting $t$ terminals acts by a contraction of degree $t - 1$;
    a component containing two simple terminals is zero. Networks on disjoint sets of internal vertices,
    with no edges between those sets, multiply as operators on the same terminal polynomial.
    Consequently an operator of degree greater than $deg P$ annihilates $P$.]
  #emph[Let $Q$ be the grounded Laplacian on the internal vertices:
    $Q_(i j)$ for $i eq.not j$ records the internal edge $i j$, while $Q_(i i)$ is the total incidence at $i$,
    including its terminal edges. Let $\( c_a \)_i$ record the incidence from internal vertex $i$ to terminal $a$.
    All entries are in $upright(bold(F))_2$. The constant and pair-contraction coefficients of the operator are
    respectively
#[#set math.equation(numbering: n => "(8.2)")
 $ det Q \, wide c_a^(sans(t)) "adj" \( Q \) c_b quad \( a eq.not b \) . $ <gr:forest-coefficients>]

 The second coefficient multiplies the terminal difference in the alignment selected by the network.
   A prohibited pair multiplies the zero operator.]
] <gr:network>

#proof[
  Expand the evaluation at the programmed incidences from the graph with all primary incidences zero.
    For a set $E_0$ of programmed bits this is the elementary identity
  $ f \( upright(bold(1)) \) = sum_(T subset.eq E_0) \( Delta_T f \) \( upright(bold(0)) \) . $
  Lemma 58 kills cyclic $T$. A tree component meeting no terminal contracts to an isolated primary vertex,
    and the isolation rule kills it. This includes an untouched primary vertex.
    In any remaining component all primary labels are trivial and all external primary bits at the expansion
    baseline are zero. Its contracted label and its incidences are exactly those obtained by contracting its
    terminal vertices in the original graph. Choose any terminal tree inducing its relative orientations;
    the corresponding terminal differences therefore give the same value.
    Its degree is the number of lost terminal vertices, namely $t - 1$.
    This establishes the operator interpretation, rather than merely a count of possible contraction degrees.
  Expanding two disjoint networks at once gives the composition of these operators:
    the product-label rule gives the same final labels in either order,
    and any cycles created between networks vanish by Lemma 58.
    Ordinary polynomial differentiation now proves the asserted degree bound.
  This argument also explains the compatible projections. Taking norms commutes with every oriented product in a
    forest; primary factors have neutral norm corrections, and each programmed oriented toggle projects to its one
    rational toggle. Thus the projected forest acts by the corresponding differences on the projected
    #emph[original] terminal polynomial at every degree. If projected differences repeat an edge or merge two
    simple clusters, that term is zero. Forgetting fixed-label coordinates plainly commutes with the same
    products. Each projected network therefore acts on the original projected terminal polynomial.
  The determinant counts are instances of the all-minors matrix-tree theorem #cite(label("Chaiken1982")) §1.
    We give the Cauchy–Binet proof in the form needed here, including singular $Q$.
    Let $I$ be the internal vertex set and $A$ the terminal set.
    Write the full Laplacian as $L = D D^(sans(t))$, where a column of the incidence matrix $D$ has ones at its
    edge’s endpoints. Cauchy–Binet applied to $L_(I \, I) = Q$ counts edge sets whose incidence matrix with the
    terminal rows deleted is invertible. Such an edge set is a forest with exactly one terminal in each component:
    a cycle gives dependent columns; a component with no deleted row gives dependent rows;
    and for a tree with one row deleted, leaf removal proves invertibility. These are exactly the degree-zero terms.
  For the pair coefficient apply Cauchy–Binet with row set $I union { a }$ and column set $I union { b }$.
    Each counted forest has one root from $A \\ { a }$ and one from $A \\ { b }$ in each component.
    This requires that $a \, b$ lie together and that every other terminal lie in its own component.
    The corresponding Laplacian minor is
  $ det mat(delim: "(", Q, c_b; c_a^(sans(t)), 0) = c_a^(sans(t)) "adj" \( Q \) c_b . $
  The corner is zero because the network has no direct terminal edge; signs disappear in characteristic two.
    The determinant identity uses the adjugate and so remains valid when $Q$ is singular. ◻
]

=== 8.4 Two networks which select one address <two-networks-which-select-one-address>

Fix a nonzero target $x_(*)$ and a terminal bit $z$ joining two terminals $a_0 \, a_1$ active at $x_(*)$.
  In the moving case assume that some terminal has each nonzero activation form;
  in the stationary case all terminals are always present.

Choose a basis $lambda_1 \, dots.h \, lambda_b$ of the dual space with $lambda_i \( x_(*) \) = 1$ for every $i$.
  To obtain it, choose $lambda_1 \( x_(*) \) = 1$ and replace a basis $mu_2 \, dots.h \,
  mu_b$ of the annihilator of $x_(*)$ by $lambda_1 + mu_2 \, dots.h \, lambda_1 + mu_b$.
  Make $b$ groups of three primary vertices, group $i$ activated by $lambda_i$.
  Since these forms are a basis, all groups are present exactly at $x_(*)$.
  At every other address at least one group is absent. In each physical three-dimensional vertex space choose a
  basis $\( e_i \, u_i \, v_i \)$ with $e_i = \( 1 \, 1 \, 1 \)$.
  Thus the physical coordinate change is block diagonal by groups.

Prescribe a symmetric bilinear form $Q$ by making the $e_i$ orthonormal and orthogonal to all $u_j \, v_j$,
  and putting on the remaining coordinates

#[#set math.equation(numbering: n => "(8.3)")
 $ H \( T \, B \) = mat(delim: "(", 0, T; T^(sans(t)), B) . $ <gr:H>]

Matrix entries in the physical coordinates are denoted by the same letter $Q$.
  For a subset $J$ of active groups, $Q_J$ means its physical principal restriction.
  Define the column $h_i = Q e_i$. It is supported on group $i$:
  in adapted coordinates it is the covector dual to $e_i$, and the coordinate change does not mix groups.
  Its value is independent of $T$ and $B$.

Attach $h_i$ to an anchor terminal with activation $lambda_i$.
  In the stationary case attach it to any fixed terminal instead. The support property gives, on every address,

$ sum_(i in J) h_i \|_J = Q_J upright(bold(1))_J . $

Program internal edges using the off-diagonal physical entries of $Q$.
  A matrix is their grounded Laplacian precisely when the sum of the terminal incidence columns is its row-sum
  vector, so these anchor columns give exactly $Q_J$, including its diagonal.

We shall also attach the same additional column $c$ to $a_0$ and $a_1$.
  In the moving case with distinct activation forms $alpha \, beta$,
  attach $c$ also to a terminal of activation $alpha + beta$; this terminal is inactive at $x_(*)$.
  If $alpha = beta$, no third column is needed. The sum of the additional active columns is zero at every address,
  since $alpha + beta + \( alpha + beta \) = 0$. In the stationary case the two columns cancel directly.
  Coincident terminal roles mean addition of their columns.
  This preserves the prescribed grounded matrix after every restriction.

For a concrete instance, take $b = 1$, target $x_(*) = 1$, and two always-active split terminals $a_0 \,
  a_1$ with selected bit $z$. Label the three primary vertices $1 \, 2 \, 3$, all activated by $x$.
  Choose $e = \( 1 \, 1 \, 1 \)^(sans(t))$, $u = \( 1 \, 0 \, 0 \)^(sans(t))$, $v = \( 0 \, 1 \, 0 \)^(sans(t))$,
  and $T = \( 0 \)$, $B = \( 1 \)$. The form in this adapted basis is $"diag" \( 1 \, 0 \, 1 \)$.
  In physical coordinates $h = Q e = \( 0 \, 0 \, 1 \)^(sans(t))$ and the covector dual to $u$ is
  $c = \( 1 \, 0 \, 1 \)^(sans(t))$. Using $a_0$ as the anchor gives

$ Q = mat(delim: "(", 0, 0, 0; 0, 1, 1; 0, 1, 0) \, wide c_(a_0) = h + c = vec(1, 0, 0) \, wide c_(a_1) = c =
  vec(1, 0, 1) . $

Thus the programmed graph is the path $a_0 #h(-0.16667em) - #h(-0.16667em) 1 #h(-0.16667em) -
  #h(-0.16667em) a_1 #h(-0.16667em) - #h(-0.16667em) 3 #h(-0.16667em) - #h(-0.16667em) 2$.
  Here $det Q = 0$ and $"adj" \( Q \) = u u^(sans(t))$, so $c_(a_0)^(sans(t)) "adj" \( Q \) c_(a_1) = 1$.
  There are only two terminals, so no higher contraction degree occurs:
  the network acts exactly by $Delta_z$ at $1$. At $0$ all three primary vertices are absent,
  and the network acts by the identity.

Write $O_(gt.eq d)$ for a sum of contraction operators of degrees at least $d$; it is a filtration notation,
  not an estimate.

#thm([Lemma 8.6.])[
  (The two address programs).  #emph[With the preceding grounding convention one has the following programs for
    every $b gt.eq 1$.]
  + #emph[A network $cal(S)$ with
$ cal(S)_(x_(*)) = Delta_z + O_(gt.eq 2) \, wide cal(S)_x = 1 + O_(gt.eq 1) quad \( x eq.not x_(*) \) . $

]
  + #emph[Two networks on the same activated sites, indexed by $epsilon in upright(bold(F))_2$, with
$ cal(N)_x^(\( epsilon \)) = 1 + O_(gt.eq 1) \, wide cal(N)_x^(\( 1 \)) + cal(N)_x^(\( 0 \)) =
  cases(delim: "{", Delta_z + O_(gt.eq 2) \, & x = x_(*) \,, O_(gt.eq 2) \, & x eq.not x_(*) .) $

]
  #emph[All nonzero-activation sites are absent at $0$. Unspecified incidences,
    including those to stationary external vertices, may remain neutral.]
] <gr:programs>

#proof[
  For the first program take $T = I + P$, where $P$ is the cyclic permutation matrix on $b$ coordinates,
    and $B$ diagonal with exactly one nonzero entry. A proper principal group restriction of $P$ is a union of
    directed paths, hence nilpotent. Thus $T_J$ is invertible for every proper $J$,
    and so is $H \( T_J \, B_J \)$: its kernel equations first give $v = 0$ and then $u = 0$.
    This includes the empty restriction, whose determinant is $1$.
  On the full group set, both $ker T$ and $ker T^(sans(t))$ are spanned by the all-one vector.
    A radical vector of $H$ has $v = t upright(bold(1))$; summing the equation $T^(sans(t)) u + B v =
    0$ gives $t = 0$ because $upright(bold(1))^(sans(t)) B upright(bold(1)) = 1$.
    Thus the full $Q$ has one-dimensional radical spanned by $r = sum_i u_i$.
    In characteristic two its adjugate is $r r^(sans(t))$. Indeed a rank-$n -
    1$ matrix has a nonzero rank-one adjugate with image its kernel; symmetry identifies the two factors,
    and the only nonzero scalar is $1$. Choose $c$ to be the covector dual to $u_1$, so $c^(sans(t)) r = 1$.
    All anchors pair to zero with $r$. At $x_(*)$ the only columns pairing nontrivially with $r$ are consequently
    those of $a_0 \, a_1$. Formula (8.2) gives zero constant and exactly $Delta_z$ in degree one.
    At every other address the group subset is proper and the constant is $1$.
    When $b = 1$, $I + P = 0$ and $B = \( 1 \)$, so the same radical calculation applies without an exception.
  For the second program let $T = I + L$, where $L$ is the consecutive lower shift, and take $B_epsilon =
    epsilon E_(b b)$. Every group restriction of $T$ is invertible, and block multiplication gives
  #[#set math.equation(numbering: n => "(8.4)")
   $ H \( T \, B \)^(- 1) = mat(delim: "(", T^(- sans(t)) B T^(- 1), T^(- sans(t)); T^(- 1), 0) . $ <gr:inverse>]
  Again take $c$ dual to $u_1$. On a group subset $J$, the change of $c^(sans(t)) Q_J^(- 1) c$ is
  $ #scale(x: 120%, y: 120%)[\(] \( T_J^(- 1) \)_(b 1) #scale(x: 120%, y: 120%)[\)]^2 \, $
  interpreted as zero if $1$ or $b$ is absent. Since $\( I + L_J \)^(- 1) = I + L_J + L_J^2 + dots.h.c$,
    that entry is $1$ precisely when the entire path $1 \, 2 \, dots.h \, b$ is present.
    This is exactly the target address. Pairings involving an anchor do not change:
    $Q_J^(- 1) h_i = e_i$, and the vectors $e_i \, h_i \, c$ do not depend on $epsilon$.
    At the target the balancing terminal is absent, so the only changed pair coefficient is the one for $a_0 \,
    a_1$. Every constant is $1$. Lemma 59 proves the claims, including $b = 1$,
    when the path consists of its single vertex. ◻
]

=== 8.5 Proof of the address lemma <proof-of-the-address-lemma>

#proof[
  Use the prescribed realization of the terminal and stationary vertices as a common baseline for all terminal
    bits. Regard their toggles as common variables, omitting variables invisible to a given symbol.
    A nonzero iterated difference implies that the polynomial is nonzero.
    Conversely, the unique multilinear polynomial of a nonzero function has a top monomial with nonzero
    coefficient. These observations also explain the last assertion using Lemma 58.
    Every nonzero address has an active terminal, and contractions never remove the last vertex.
    Thus only nonempty configurations are used.
  First consider one symbol. At each $x eq.not 0$ let $P_x$ have degree $d_x$ and choose a monomial with
    coefficient $1$ in its top homogeneous part. For each variable of this monomial add a separate singular
    program $cal(S)$ targeted at $x$. Give all these networks disjoint internal vertices.
    At address $x$, its own $d_x$ networks each have zero constant,
    so every surviving term spends at least $d_x$ contraction degrees.
    An extra degree from any network kills $P_x$. Thus only the designated degree-one contractions of its own
    networks and the constant terms of all other networks survive.
    Their value is the chosen top coefficient, namely $1$. A nonzero constant polynomial needs no network and
    already has value $1$. This argument applies equally to always active terminals,
    since Lemma 60 supplies their stationary anchors.
  For two symbols write their polynomials at address $x eq.not 0$ as $P_x \, R_x$, of degrees $d_x \, e_x$,
    and let $P_x^(upright("top")) \, R_x^(upright("top"))$ be their top homogeneous parts.
    Multiply these parts in the ordinary polynomial ring $upright(bold(F))_2 \[ z_1 \, dots.h \, z_m \]$,
    #emph[before] imposing any Boolean relations. That ring is an integral domain,
    so choose a coefficient equal to $1$ at a monomial
  #[#set math.equation(numbering: n => "(8.5)")
   $ M_x = product_z z^(nu_(x z)) \, wide nu_(x z) in { 0 \, 1 \, 2 } \, wide sum_z nu_(x z) = d_x +
     e_x . $ <gr:chosen-monomial>]
  For $nu_(x z) = 2$ add one singular program for $z$ targeted at $x$.
    For $nu_(x z) = 1$ add one nonsingular program for $z$ targeted at $x$,
    with its own choice $epsilon_(x z) in upright(bold(F))_2$.
    All internal vertices of different programs are disjoint. Let
  $ Phi \( epsilon \) = product_(x eq.not 0) #scale(x: 120%, y: 120%)[\(] upright("final evaluation of ") P_x
    #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] upright("final evaluation of ") R_x
    #scale(x: 120%, y: 120%)[\)] . $
  We prove that the sum of $Phi$ over all choices of $epsilon$ is $1$.
    This proves that some single choice has all the required evaluations equal to $1$.
  Expand every program in contraction degree using Lemma 59.
    A singular program targeted at $x$ has zero constant in both factors there,
    so it costs at least one degree in $P_x$ and one in $R_x$.
    A nonsingular program has constant $1$ independent of its choice.
    In the sum over that choice, a term using only its constants in all factors cancels.
    Every remaining term must therefore spend at least one degree somewhere for this program.
    The sum of these minimum costs is exactly
  #[#set math.equation(numbering: n => "(8.6)")
   $ D = sum_(x eq.not 0) \( d_x + e_x \) \, $ <gr:budget>]
  by (8.5). A nonzero term cannot exceed this total: if it did,
    some factor would receive more differences than its degree.
    Hence every surviving term uses every minimum cost exactly.
  It follows that a singular program spends exactly one degree in each factor at its target and zero elsewhere.
    Its degree-one term there is precisely $Delta_z$. Each nonsingular program spends exactly one degree in
    exactly one factor. After summing its choice, that degree-one contribution is zero away from its target,
    and is $Delta_z$ at its target. All other occurrences of these programs contribute their common constant $1$.
    Thus no unknown higher forest coefficient enters the surviving calculation.
  At a fixed address, let $Z_2$ be the variables with exponent two and $Z_1$ those with exponent one.
    The local allocation sum is
  $ sum_(J subset.eq Z_1) \[ z_(Z_2) z_J \] P_x^(upright("top")) thin \[ z_(Z_2) z_(Z_1 \\ J) \]
    R_x^(upright("top")) = \[ M_x \] \( P_x^(upright("top")) R_x^(upright("top")) \) = 1 . $
  Coefficients of the wrong degree in this display are zero.
    Every factor must in fact receive its full degree, since the total is $D$ and none can exceed its own degree.
    Therefore its final derivative is exactly the displayed top coefficient,
    independent of the chosen baseline values. Allocations at different addresses are independent,
    so their product is $1$, as asserted. This also covers a constant factor, whose degree is zero.
    For example, when both top forms are $z$, their ordinary product is $z^2$ and the singular program
    differentiates each factor once; Boolean reduction would lose this allocation.
  In the two-symbol case, choose the program parameters for which $Phi = 1$.
    In either case, apply Lemma 55 to adjoin the resulting finite networks to the fixed original vertices.
    Only new vertices and incidences involving them have been prescribed. The primary types preserve the filters.
    All activations are nonzero linear forms, so no new vertex appears at $0$,
    and the stipulated neutral and splitting conditions persist. ◻
]

The theorem is finite for each $b$; it does not assert a single infinite array of primes.
  For a stabilized symbol, first choose $b$, its finite terminal data, and all the networks above.
  Their total weight and the list of coefficient tests are then finite.
  A sufficiently advanced stage at which the symbol interface holds for that weight range realizes the
  construction. Required precision and the number of auxiliaries may grow with $b$.
  The arithmetic valuation constant attached to a unit symbol must still be supplied by the coefficient
  construction independently of $b$; no determinant or forest count in this section proves that uniformity.

== 9 Assembly at a fixed curve <pw:section>

Fix $E \/ bb(Q)$ with nonzero rational two-torsion. The even construction has two uses:
  it proves the corank-zero case and supplies the uniform estimate needed to normalize the odd coefficients.
  After that normalization, the corank-one argument fixes a nonvanishing companion and constructs the two
  simultaneous coefficient tests required for ring-class transfer.

=== 9.1 Interfaces and conventions <pw:interfaces-section>

We use the fixed-support conventions of Section 2. Thus all variable prime factors are odd primes of good
  reduction, $p^(*) = \( - 1 \/ p \) p$, and a filter fixes the real sign and unit squareclasses at a finite
  support containing $2 N$, with finitely many further exclusions. Recall

$ t_p = dim_(bb(F)_2) E \[ 2 \]^("Fr"_p) \, wide w \( h \) = 1 / 2 sum_(p divides h) t_p . $

Whenever the two-primary group is finite, we write

$ s \( h \) = log_2 \| "Sha" \( E^(\( h \)) \/ bb(Q) \) \[ 2^oo \] \| . $

This includes a base of Selmer corank zero and every parameter of analytic order zero or one.
  It is distinct from $s_2 \( E^(\( h \)) \)$, the Selmer corank.
  The normalized central value is denoted $L_(*) \( h \)$, and $v = v_2$ with $v \( 2 \) = 1$.

Here are the preceding results in the form used below. Their roles are different:
  coefficient units give upper bounds, interpolation returns those bounds to an unknown base,
  and the ring-class lower bound makes the odd normalization possible. The latter step is carried out in Proposition 70.

#thm([Proposition 9.1.])[
  (Collected interfaces).  #emph[The following statements hold for the fixed curve and fixed local data.]
  + #emph[The cyclotomic missing-vertex statement of Theorem 5 applies to any fixed base $h_0$ of Selmer corank
    zero. If arbitrarily large binary cubes based at $h_0$, with no old prime removed,
    have nonzero central values at every other address and satisfy
$ v \( L_(*) \( h_x \) \) - 2 w \( h_x \) - s \( h_x \) lt.eq B quad \( x eq.not 0 \) \, $

 then the base central value is nonzero and satisfies the same inequality with $B$ replaced by $B + C$.
   The constant $C$ depends only on the fixed curve and local data, not on $h_0$, its number of prime factors,
   or the cube dimension. The dimension required for the argument may depend on the base.
   The cyclotomic lower bound at an analytically nonvanishing parameter is also available.]
  + #emph[Corollary 11 has the following uniform form. If $k <
    0$ is an odd fundamental discriminant with at most $A$ prime factors, $K =
    bb(Q) \( sqrt(k) \)$ is neither an extra-unit field nor the CM field, $k$ is a square at $2 N h$,
    and the twists $h \, h k$ have respective analytic orders one and zero,
    then their ring-class Heegner sum has free-line index $j_h \( k \)$ satisfying
#[#set math.equation(numbering: n => "(9.1)")
 $ 2 j_h \( k \) gt.eq 4 w \( h \) + s \( h \) + s \( h k \) - C_(E \, A) . $ <pw:ring-lower-interface>]

 For a fixed such $k$, Theorem 12 applies to cubes based at $h = 1$ whose new primes all split in $K$.
   If $s_2 \( E \/ K \) = 1$ and the nonzero addresses have product analytic order one and uniformly bounded $2
   j_h \( k \) - 4 w \( h \) - s \( h \) - s \( h k \)$, the base product has analytic order one.]
  + #emph[The even coefficient system, exact same-filter square comparison, divided operators,
    and trace identities of Proposition 46 and Lemmas 51, 52, and 53 are available.
    After a uniform lower bound for the relevant point indices has been proved,
    the moving odd coefficient system and its stabilized minimum are available as in Proposition 49 and Lemma 50.
    The resulting unit symbols satisfy the contraction, good-twin, and primary-isolation rules of Proposition 54.
    An even unit gives
#[#set math.equation(numbering: n => "(9.2)")
 $ L_(*) \( h \) eq.not 0 \, wide v \( L_(*) \( h \) \) lt.eq 2 w \( h \) + C \; $ <pw:even-unit-interface>]

 an odd unit gives analytic order one and
#[#set math.equation(numbering: n => "(9.3)")
 $ j \( P_h \) lt.eq w \( h \) + C . $ <pw:odd-unit-interface>]

 The constants are independent of the number and sizes of the variable primes.
   The fixed genus partner used to define $P_h$ is denoted $h_(*)$.]
  + #emph[Arithmetic realization and the forest and address statements of Lemmas 55 and 58 and Theorem 57 hold.
    In particular, separate nonzero terminal polynomials may be addressed simultaneously.
    Primary auxiliaries preserve all fixed local classes, have neutral incidence to specified stationary external
    vertices, and may be required to split in any compatible fixed fields. They contribute no prime at address zero.]
] <pw:interfaces>

#proof[
  These are the cited results, with the arithmetic ring-class hypotheses verified by Proposition 39.
    The even coefficient minimum uses the cyclotomic lower bound;
    the odd detector of Proposition 49 still needs the arithmetic lower bound for Lemma 50.
    Neither interpolation statement nor the even symbol uses that odd normalization. ◻
]

The analytic witnesses and the rough completion used below are supplied by Propositions 43 and 44;
  the latter has an absolute prime-count bound. The bounds in Proposition 61,
  unlike the eventual sizes of the primes chosen by nonvanishing or Chebotarev,
  must be uniform in the parameters indicated there.

#thm([Lemma 9.2.])[
  (Isogeny orientation and coranks).  #emph[Recall that a rational isogeny preserves analytic rank,
    Mordell–Weil rank, and $2^oo$-Selmer corank. If $k$ is a quadratic discriminant and $K = bb(Q) \( sqrt(k) \)$, then
#[#set math.equation(numbering: n => "(9.4)")
 $ s_2 \( E \/ K \) = s_2 \( E \/ bb(Q) \) + s_2 \( E^(\( k \)) \/ bb(Q) \) . $ <pw:quadratic-corank>]

 For every $E \/ bb(Q)$ one has, separately,
#[#set math.equation(numbering: n => "(9.5)")
 $ s_2 \( E \) = r \( E \) + "corank"_(bb(Z)_2) "Sha" \( E \/ bb(Q) \) \[ 2^oo \] . $ <pw:kummer-corank>]

]
] <pw:isogeny-corank>

#proof[
  These are Lemmas 3 and 2. In particular, the quadratic identity is an identity of coranks,
    not an integral direct-sum decomposition. ◻
]

If the isogeny class contains a curve with full rational two-torsion, we use that curve.
  Otherwise choose a rational two-isogeny $E arrow.r E'$ and write $F = bb(Q) \( E \[ 2 \] \)$, $F' =
  bb(Q) \( E' \[ 2 \] \)$; both fields are quadratic. A prime split in $F$ is called split,
  and one inert in $F$ is called simple. Their weights are respectively $1$ and $1 \/ 2$.
  A simple prime is good if it is also inert in $F'$. At such a prime

#[#set math.equation(numbering: n => "(9.6)")
 $ \# E \( bb(F)_p \) equiv 2 med \( mod med 4 \) . $ <pw:good-simple>]

Indeed there is exactly one nonzero rational two-torsion point in the reduction.
  If the group order were divisible by four, its two-primary subgroup would contain a rational point of order
  four. Its image under the two-isogeny would supply on $E'$ a rational two-torsion point different from the dual
  kernel, contradicting inertness in $F'$. Thus the good-twin rule applies.
  When $F = F'$, every simple prime is good. A prime split in $F$ and inert in $F'$ is a #emph[donor]:
  attaching its label to a bad simple label makes that label good.
  This terminology describes finite label operations; the required prime supplies will be constructed below.

=== 9.2 Seeds and finite supplies <pw:seeds-section>

The word “label” below means an individually realizable fixed-support elementary Frobenius label,
  with orientations when required. It does not include a self-residue of a prime generator.
  All contractions and comparisons are those of Proposition 54 and Lemma 58.

#thm([Lemma 9.3.])[
  (Minimum seeds).  #emph[]
  + #emph[In an all-split alphabet, suppose a unit symbol has a nonempty witness.
    At the least positive vertex count $r$ of such a witness, all mutual edge bits are immaterial.
    The symbol is determined by the individual fixed-support labels.
    This remains true if the empty configuration is a unit, provided no contraction to the empty configuration is used.]
  + #emph[In the quadratic case, suppose the symbol has a nonzero witness,
    the alphabet is closed under the allowed contractions, and it contains the good twin operations.
    There are $r gt.eq 0$ and $s_1 gt.eq 1$ such that for every $s gt.eq s_1$ of the permitted simple parity,
    the minimum split count of a unit with $s$ simple vertices is $r$.
    At these counts all edge bits are immaterial. A chosen minimum seed may be padded by arbitrarily many good
    twin pairs.]
] <pw:minimum-seeds>

#proof[
  For the first assertion, a derivative in an edge of an $r$-vertex graph is a symbol on $r - 1$ vertices.
    If $r gt.eq 2$, this graph remains nonempty and has value zero by minimality. If $r = 1$, there is no edge.
    The omitted-vertex description then leaves exactly the fixed-support labels.
  For the second assertion let $r \( s \)$ be the minimum split count at simple count $s$, with value $+
    oo$ when no witness exists. Once a finite value occurs, good-twin insertion gives $r \( s + 2 \) lt.eq
    r \( s \)$. A nonincreasing sequence of nonnegative integers stabilizes. Choose $s_1 gt.eq 1$ in that range.
    A derivative of an edge with a split endpoint reduces the split count and preserves the simple count;
    it is therefore zero at the minimum. A simple–simple derivative is zero by the symbol rule.
    Twin insertion gives the last assertion. ◻
]

Call a list partitionable if some permitted contraction forest has a unit symbol as its output.
  A contraction certificate proves that its terminal polynomial is nonzero:
  the indicated iterated finite difference is nonzero.

#thm([Lemma 9.4.])[
  (Finite label reserves).  #emph[Fix a minimum seed and a finite label alphabet.]
  + #emph[In the all-split rational alphabet, a list with the same total label as the seed and sufficiently many
    copies of its labels is partitionable.]
  + #emph[In the quadratic alphabet, retain $r$ split anchors with the seed labels,
    and suppose the list and seed have the same total rational label on the projection used by the symbol.
    Suppose there are sufficiently many simple vertices of the required parity and sufficiently many split
    reserves of each realizable rational shift. If $F eq.not F'$, also suppose
#[#set math.equation(numbering: n => "(9.7)")
 $ Delta = \# { p : med p upright(" split in ") F upright(" and inert in ") F' } - \# { p : med
   p upright(" inert in ") F upright(" and split in ") F' } > C_0 . $ <pw:donor-balance>]

 Here $C_0$ depends only on the anchors and the reserves. Then all other split vertices can be attached to simple
   vertices so that the result is the minimum seed and good twin pairs.
   The twins may match a prescribed finite enrichment of the rational labels.
   The base simple labels may be specified on any projection on which the required total agrees.]
  #emph[All reserve requirements depend only on the finite alphabets, seed, and projection.
    They do not depend on the original list length.]
] <pw:reserves>

#proof[
  In the first case retain the first $r - 1$ seed labels and merge all other vertices to the last cluster.
    Sufficient copies ensure that this cluster is nonempty. Its label is forced by the total,
    hence is the last seed label. Lemma 63 makes its unknown edges immaterial.
  For the second case, the rational labels of split attachments form the subgroup with trivial $F$-coordinate.
    They act transitively on the simple coset, so every prescribed change of a simple label has a realizable split
    shift. Reserve sufficiently many representatives of every such shift.
    Remove these reserves and the anchors from the donor pool.
    If $F eq.not F'$, (9.7), with $C_0$ exceeding the number removed,
    leaves a distinct donor for each bad simple vertex. Attach these donors; every simple vertex is now good.
    If $F = F'$, this operation was unnecessary.
  Pair equal enriched good labels. By withholding a bounded number of pairs, leave between $s_1$ and $s_1 +
    C_1$ unpaired vertices, with the correct parity; $C_1$ depends only on the number of enriched labels.
    Use reserved shifts to turn the excess unpaired vertices into good pairs and to set the first $s_1 -
    1$ base positions to the desired seed labels. The seed labels themselves need not all be good.
    Attach every remaining nonanchor split vertex to the last base position.
    Its projected label is forced by the total, the anchors, the other base positions, and the twin pairs.
    It is the required last seed label. Each cluster contains one simple vertex,
    so every contraction is permitted. Only a bounded number of reserve shifts was used.
  When incidences to a retained split anchor are needed only to remove twins,
    they can be prescribed after the contracted labels are fixed, by the independent terminal-edge realization.
    Fixed stationary vertices instead enter the finite label enrichment from the outset.
    These two uses do not increase the number of label types with the original list length. ◻
]

#thm([Lemma 9.5.])[
  (Neutral packets).  #emph[For any of the finite reserve problems above with prescribed rational total zero,
    one can choose a finite packet of terminal labels with rational total zero such that every nonempty union of
    copies of the packet has the required supplies. In the quadratic case with $F eq.not F'$,
    its donor surplus may be made arbitrarily large. When $F = F'$,
    every simple label is good and no donor surplus is required.
    Compatible fixed splitting conditions may be included whenever the needed individual labels and shifts remain
    realizable.]
] <pw:packets>

#proof[
  Choose ample copies of every required label, including anchors and shifts.
    In the quadratic case with $F eq.not F'$, add enough donors to exceed all the losses from the other labels and
    the prescribed reserve margin. Duplicate every full label in the resulting list.
    Duplication gives total zero in every rational elementary coordinate and preserves any strict donor surplus.
    Choose the margins so that after reserving the finitely many anchors in any one packet,
    the union of any positive number of packets still meets the reserve requirements.
    All labels are realized by distinct fresh primes; duplication never means repeating an actual prime factor. ◻
]

=== 9.3 The even estimate and the corank-zero case <pw:lower-section>

#thm([Proposition 9.6.])[
  (Partitionable even estimate).  #emph[Fix an even symbol furnished by Proposition 61.
    For every partitionable parameter $h$ on its filter with $s_2 \( E^(\( h \)) \) = 0$,
#[#set math.equation(numbering: n => "(9.8)")
 $ L_(*) \( h \) eq.not 0 \, wide v \( L_(*) \( h \) \) - 2 w \( h \) - s \( h \) lt.eq C . $ <pw:partitionable-bound>]

 The constant depends only on the symbol and fixed local data.]
] <pw:partitionable-even>

#proof[
  If the parameter has no prime factors, a contraction certificate means that the empty symbol itself is a unit.
    Equation (9.2) then proves the assertion directly. Otherwise the stationary terminal set is nonempty.
    Keep the prime factors of $h$ stationary. Their terminal polynomial is nonzero by its contraction certificate.
    The stationary one-symbol case of Theorem 57 gives arbitrarily large binary cubes based at $h$,
    with only primary new primes, whose other addresses have unit symbol.
    Equation (9.2) and $s \( h_x \) gt.eq 0$ give the uniform upper bound required by the cyclotomic transfer.
    The base corank is zero, so that transfer gives (9.8). A base-dependent dimension threshold does not affect
    the asserted constant. ◻
]

The original corank-zero base can now be treated without any odd coefficient system or companion field.

#thm([Proposition 9.7.])[
  (Even original base).  #emph[If $s_2 \( E \) = 0$, then $a \( E \) = 0$.]
] <pw:even-base>

#proof[
  Lemma 3 gives even functional sign. Fix an even symbol on the filter of $1$,
    including all auxiliary class-group tests. If its value at $1$ is a unit,
    analytic nonvanishing is already detected. Otherwise use a nonempty minimum seed in the full-torsion case,
    or a stabilized quadratic seed in the other case.
  For each $b$, assign a neutral packet from Lemma 65 to every nonzero linear form on $bb(F)_2^b$,
    and activate its primes by that form. At every nonzero address at least one packet is active;
    their union satisfies the reserve problem and has a nonzero terminal polynomial.
    At zero no terminal is active. The single-symbol case of Theorem 57 adds primary auxiliaries and makes the
    symbol a unit at every nonzero address. All local classes remain those of $1$.
    Equation (9.2), followed by cyclotomic transfer at the original corank-zero base, gives $a \( E \) = 0$. ◻
]

=== 9.4 The lower bound needed by the odd coefficients <pw:odd-lower-section>

For the odd construction, first fix the original coefficient and class-group support and its unit tests.
  Then choose the genus partner $h_(*)$ as in Section 7, adjoin its prime factors to the support,
  and refine the unit tests there. All variable $h$ avoid this support.
  The positive filter below is this prepared filter, fixed before $h$ varies or the odd coefficients are normalized.

We next use the even estimate at analytically nonvanishing parameters, not the corank-zero conclusion just proved.
  The companion $k' = k' \( h \)$ in this step may vary with $h$, but its number of prime factors will be bounded.
  It is distinct from both the detector’s fixed genus partner $h_(*)$ and the fixed companion used in the final
  ring-class transfer.

At a parameter already known to have analytic rank zero, the estimate (9.8) transfers between either orientation
  of a fixed two-isogeny. The isogeny formula for the BSD quotient gives a bounded change in $s \( h \) +
  2 w \( h \)$. At an active odd good prime the component-group valuation is $t_p$,
  and the two active contributions are included in the two weights.
  At the fixed support only finitely many local twisting classes occur.
  Differential, period, and torsion indices are bounded by the fixed isogeny and its reverse,
  and there is no regulator at rank zero. This uses an isogeny identity for known finite groups,
  not BSD or converse finiteness at an unknown parameter.

#thm([Lemma 9.8.])[
  (A bounded companion for a varying odd parameter).  #emph[Fix a positive odd-sign filter,
    including the coefficient and class-group support used below,
    and a negative genus partner $h_(*)$ with $L \( E^(\( h_(*) \)) \, 1 \) eq.not 0$,
    chosen using Proposition 43 and then excluded from the variable parameters.
    There are constants $A \, C$ such that every $h$ on this filter of analytic order one admits a negative odd
    fundamental discriminant $k'$ for which]
  + #emph[$\( k' \, 2 N h \) = 1$, $k'$ is a square at every place of $2 N h$,
    and $bb(Q) \( sqrt(k') \)$ is nonexceptional;]
  + #emph[$omega \( k' \) lt.eq A$;]
  + #emph[$L \( E^(\( h k' \)) \, 1 \) eq.not 0$ and
#[#set math.equation(numbering: n => "(9.9)")
 $ v \( L_(*) \( h k' \) \) lt.eq 2 w \( h k' \) + s \( h k' \) + C . $ <pw:rough-bound>]

]
] <pw:rough-companion>

#proof[
  At the fixed class-group support and the other fixed label tests,
    prepare an even negative-index symbol for each possible total type at this support,
    and for both isogeny orientations if needed. There are finitely many such preparations.
    The positive index $\| h k' \|$ has nonzero total rational type:
    its negative-discriminant parity is already nontrivial among the tests at $2$.
    Thus in the full-torsion case a unit seed has positive count.
    In the quadratic case use the stabilized seed of Lemma 63.
  When $F eq.not F'$, interchanging the isogeny orientation interchanges the two counts in (9.7).
    Select the orientation with initial balance at least zero.
    The existing donors can then pay for arbitrarily many existing bad simples.
    They do not have to be supplied by new primes.
  Let $R$ be the absolute prime-count bound in Proposition 44.
    Insert in $k'$ a finite dummy supply that meets the anchors, minimum simple count,
    and reserve requirements for every one of the finitely many prepared symbols.
    When $F eq.not F'$, add donor slack paying for every reserved loss, the new dummy bad simples,
    and a further possible loss of $R$ from the later rough factor.
    When $F = F'$, all simple primes, including the later rough primes, are already good;
    only the simple and split-reserve supplies are needed. Add a fresh ramified prime if needed to exclude the
    exceptional imaginary fields. The number of dummy primes is bounded independently of $h$.
    Their labels and initial incidences may be chosen by Lemma 55.
  Absorb $h$ and the dummy product into the curve. Apply Proposition 44 to complete $k'$ by a squarefree factor
    coprime to all primes already used. Prescribe its sign and its local unit classes so that the final $k'$ is an
    odd negative fundamental discriminant, is a square at $2 N h$,
    and has the required original local classes at $2 N$. These conditions give a nonempty reduced progression by
    the Chinese remainder theorem. Its root number is even: since $E^(\( h \))$ has odd sign and $k'$ is negative
    and square at every prime of $2 N h$, the quadratic twist formula multiplies that sign by
    $chi_(k') \( - N_(E^(\( h \))) \) = - 1$. Thus this is the positive-root-number case of Proposition 44 for the
    absorbed curve. Additional fixed primes may be excluded. The proposition makes the central value at $h
    k'$ nonzero with at most $R$ new factors. Its size threshold may depend on $h$ and all these congruences;
    $R$ does not.
  No particular resulting unit class at the auxiliary class-group support was assumed in advance:
    dummy supplies were prepared for every possible total there.
    For the actual total, Lemma 64 makes $h k'$ partitionable.
    Analytic nonvanishing gives Selmer corank zero by the forward theorem.
    Proposition 66 therefore gives (9.9), with the isogeny comparison above if the other orientation was used.
    The finite preparation and the bound on dummy and rough factors give $A \, C$ independent of $h$. ◻
]

#thm([Lemma 9.9.])[
  (Height comparison).  #emph[Here $j_h \( k \)$ is the index of the conductor-$\|
    h \|$ ring-class sum over $bb(Q) \( sqrt(k) \)$, whereas $j \( P_h \)$ is the index of the conductor-one genus
    sum over $bb(Q) \( sqrt(h h_(*)) \)$. With the fixed modular parametrization and the fixed genus partner
    $h_(*)$, the explicit Gross–Zagier formula gives, whenever the relevant factors have analytic orders one and zero,
#[#set math.equation(numbering: n => "(9.10)")
 $ 2 j_h \( k \) - 2 j \( P_h \) = v \( L_(*) \( h k \) \) + O \( 1 \) . $ <pw:height-ratio>]

 For $k$ with bounded prime count as in Lemma 68, the error is uniform in $h \, k$;
   for a fixed $k$ it is uniform in $h$.]
] <pw:height-comparison>

#proof[
  Use the character-sum normalization of the explicit Gross–Zagier formula in #cite(label("CaiShuTian2014"))
    Theorem 1.1. The restriction of $chi_h$ to $bb(Q) \( sqrt(k) \)$ has exact ring-class conductor $\| h \|$:
    each odd prime dividing $h$ splits and retains its ramified quadratic character.
    The genus character over $bb(Q) \( sqrt(h h_(*)) \)$ is unramified,
    so the sum defining $P_h$ has conductor one. Their canonical heights are fixed modular factors times, respectively,
  $ \| h \| sqrt(\| k \|) thin L' \( E^(\( h \)) \, 1 \) L \( E^(\( h k \)) \, 1 \) \, wide
    sqrt(\| h h_(*) \|) thin L' \( E^(\( h \)) \, 1 \) L \( E^(\( h_(*) \)) \, 1 \) . $
  In that theorem the multiplier is $c sqrt(\| D \|)$, the level-discriminant factor is $2^(mu \( N \, D \))$,
    and the unit factor is $\[ cal(O)_c^times : bb(Z)^times \]^2$.
    Here every level prime splits, so $\( N \, D \) = 1$ and $mu \( N \, D \) = 0$;
    the excluded extra-unit fields make the unit factor $1$ in both applications. Take their ratio.
    The derivative and the rank-one regulator cancel; the remaining varying real factor is $sqrt(\| h k \|)$,
    precisely the factor in $L_(*) \( h k \)$. Comparison of the rational free line with its two quadratic
    projections has bounded index because their composites are multiplication by $2$.
    The modular parametrization and the factor involving $h_(*)$ are fixed.
    The level is split and the discriminant and conductor are prime to it;
    no growing conductor-prime product occurs in this normalization.
    Local differential and period comparisons have finitely many possibilities at the fixed support.
    The extra-unit fields have been excluded, and the number of additional places in the varying $k$ case is
    bounded. These observations give the asserted bounded valuation error. ◻
]

#thm([Proposition 9.10.])[
  (Uniform lower bound for the odd detector).  #emph[Every analytically rank-one $h$ in the prepared positive
    filter of Lemma 68 satisfies
#[#set math.equation(numbering: n => "(9.11)")
 $ 2 j \( P_h \) gt.eq 2 w \( h \) + s \( h \) - C . $ <pw:odd-lower-bound>]

 In particular $j \( P_h \) gt.eq w \( h \) - C$ uniformly in $h$ and its prime count.]
] <pw:odd-lower>

#proof[
  Choose $k'$ by Lemma 68. Combine (9.1), (9.10), and (9.9).
    Since the factors are coprime, $w \( h k' \) = w \( h \) + w \( k' \)$, and $w \( k' \) lt.eq
    omega \( k' \) lt.eq A$. Hence
  $ 2 j \( P_h \) & gt.eq 4 w \( h \) + s \( h \) + s \( h k' \) - v \( L_(*) \( h k' \) \) - C\
 & gt.eq 2 w \( h \) + s \( h \) - 2 w \( k' \) - C\
 & gt.eq 2 w \( h \) + s \( h \) - C' . $
  Only even symbols and independently nonvanishing companions were used.
    Thus this proof precedes, and does not assume, the odd minimum-depth normalization. ◻
]

=== 9.5 From the moving odd coefficients to finite graphs <pw:odd-stages>

Proposition 70 now supplies the arithmetic premise of Lemma 50.
  We obtain an odd symbol with fixed minimum normalized depth and the uniform unit bound (9.3).
  To use the finite seed and packet lemmas, we also need to stabilize its graph labels and values,
  not just this numerical depth.

Keep the ultrafilter used in Lemma 50. The intrinsic fixed support includes the genus partner $h_(*)$;
  at an actual stage it also includes the detecting prime $ell$.
  That prime adds at most two places in any fixed quadratic field.
  The unit and class-group description of $V_S \( F \)$ therefore bounds the dimension of the elementary label
  space independently of the stage. At $ell$ the Schwartz function in Lemma 48 uses only the quadratic
  residue-line character: increasing the Kummer precision does not impose a character of growing order on the
  variable primes. The old-support characters are fixed.

Choose bases and restrict to an ultrafilter-large set of stages on which the finite label spaces,
  their addition tables, conjugation and projection maps have one abstract form.
  At every fixed weight bound there are only finitely many typed graphs and symbol truth tables.
  Select the table occurring on an ultrafilter-large set. These selected tables are compatible under restriction
  and define one limit symbol. Its contraction and twin identities follow from the finite-stage identities.
  The witness sequence of Lemma 50 has bounded weight, hence takes only finitely many graph types in this
  alphabet; one type is a witness in the selected limit table.

If the empty configuration is a unit, a sufficiently advanced actual stage already detects analytic order one at
  $h = 1$. Otherwise the limit witness is nonempty, so Lemma 63 supplies the minimum seeds and stabilized simple
  count needed below. Fix them in this remaining case; Lemmas 64 and 65 apply to their finite label alphabets.
  Every particular contraction or twin comparison uses only a bounded graph.
  Its selected truth table agrees with the actual symbol on an ultrafilter-large set of stages.
  Thus any prescribed finite collection of such comparisons holds at one sufficiently advanced stage.

Later we will add the fixed support of a separate companion and the label projection read by its even test.
  Once compatible lifts have been verified, we may stabilize this finite enrichment by restricting the #emph[same]
  ultrafilter. This preserves the intrinsic odd symbol, its minimum, and its chosen seeds.
  The actual stage is selected only after the cube dimension and all its finite networks have been chosen:
  their maximum weight gives a finite list of table and precision requirements.
  No intersection over all weight bounds, and no single stage working for every cube dimension, is required.

=== 9.6 A nonempty split-field symbol with full two-torsion <pw:split-section>

We give the extra argument required when $E \[ 2 \]$ is rational.
  It addresses the possibility that the usual even minimum is attained only at the empty configuration after
  restricting all new primes to split in the companion field.

#thm([Lemma 9.11.])[
  (Recurrence congruences).  #emph[Let $p$ be odd, $a equiv p + 1 med \( mod med 4 \)$, and let
$ b_0 = 1 \, quad b_1 = a - kappa \, quad b_(s + 1) = a b_s - p b_(s - 1) . $

 If $kappa = plus.minus 1$, then $b_(s + 1) - b_s$ is even and
$ frac(b_(s + 1) - b_s, 2) equiv frac(a - kappa - 1, 2) med \( mod med 2 \) quad \( s gt.eq 0 \) . $

 If $kappa = 0$, put $b_(- 1) = 0$; then $b_s - b_(s - 1)$ is odd for every $s gt.eq 0$.
   Finally, for $kappa = 1$, if $a equiv p + 1 med \( mod med 2^m \)$ then $b_s equiv
   p^s med \( mod med 2^m \)$ for every $s gt.eq 0$.]
] <pw:recurrence>

#proof[
  Modulo $2$ the recurrence is $b_(s + 1) = b_(s - 1)$. Its initial values prove the parity assertions.
    For $d_s = b_(s + 1) - b_s$, the recurrence for $d_s$ is the same.
    Directly, $d_1 - d_0 equiv \( p - 1 \) \( p - kappa \) equiv 0 med \( mod med 4 \)$ when $kappa =
    plus.minus 1$. Thus $d_s \/ 2$ is constant modulo $2$. The last assertion follows by substituting the sequence
    $p^s$ in the recurrence and checking its first two terms. ◻
]

#thm([Lemma 9.12.])[
  (Nonempty $K$-split witness).  #emph[Suppose $E \[ 2 \]$ is rational.
    Choose a negative unit $k$ of a fixed even symbol for $E$,
    prime to all previous fixed support and to the ramification support of $E \[ 8 \]$.
    Put $K = bb(Q) \( sqrt(k) \)$, chosen nonexceptional. Let $S_0$ contain the complete fixed support of the
    coefficient system, $2 N$, the primes of $k$, and primes generating the class group of $K$.
    On the positive filter of $1$ square at $S_0$, there is an even unit test on nonempty products of primes split
    in $K$ with these properties:]
  + #emph[it has a nonempty witness;]
  + #emph[it satisfies the oriented split contraction and primary-isolation rules over $K$,
    for contractions with nonempty output;]
  + #emph[a unit at $D$ implies
#[#set math.equation(numbering: n => "(9.12)")
 $ L \( E^(\( k D \)) \, 1 \) eq.not 0 \, wide v \( L_(*) \( k D \) \) lt.eq 2 omega \( D \) +
   C_k . $ <pw:split-unit-bound>]

]
  #emph[This conclusion uses the integral trace and local identities in Proposition 61(3).]
] <pw:split-witness>

#proof[
  If the ordinary coefficient test already has a nonempty split witness, there is nothing to construct.
    Otherwise we first obtain an additional trace congruence modulo $8$.
    That congruence makes one further division of the coefficient form integral.
    We verify its contraction identities, then use a prime inert in $K$ to force a nonzero test at a split prime.
  #emph[Extra depth if the ordinary test has no witness.] Use the ordinary even coefficient form for
    $E^(\( k \))$, normalized by $a \( 1 \) = 1$. The positive filter is chosen so that $k
    D$ lies in the original negative filter. Since $k$ attains its least normalized depth,
    the exact ratio comparison of Proposition 46 gives
  #[#set math.equation(numbering: n => "(9.13)")
   $ v \( a \( D \) \) gt.eq omega \( D \) $ <pw:split-basic-depth>]
  at every allowed squarefree $D$. The factor $\| k \|$ cancels from this ratio;
    one is not subtracting unrelated bounded-error inequalities.
  If equality holds at a nonempty product of $K$-split primes, use the usual even bit,
    projected from oriented $K$-labels to rational labels. It has all the required properties by Proposition 54.
    We therefore assume for the rest of the proof that equality never occurs there.
    By the rational-phase assertion in Proposition 46, normalization by $a \( 1 \) =
    1$ makes each nonzero squarefree coefficient a rational number times a root of unity.
    Its valuation is an integer, not just an element of the possibly ramified coefficient field’s discrete value
    group. Thus strict inequality implies
  #[#set math.equation(numbering: n => "(9.14)")
   $ v \( a \( D \) \) gt.eq omega \( D \) + 1 quad upright("for every nonempty allowed all-") K
     upright("-split ") D . $ <pw:split-extra-depth>]
  Write $g = sum a \( n \) q^n$ for the form. Its characters satisfy $psi \/ eta = chi_(- 4)$, so $eta$ is odd.
    For a set $U$ of $K$-split primes put
  $ B_U = 2^(- \| U \|) product_(p in U) \( U_p - eta \( p \) V_p \) g \, wide Theta_J =
    sum_(m > 0 \, med \( m \, S_0 \) = 1) eta \( m \) m q^(J m^2) . $
  All expansions retain the prescribed support sieves. The ordinary divided form is
  $ H_U = 1 / 2 (B_U - sum_(J subset.eq U) B_U \[ J \] Theta_J) . $
  Here $B_U \[ J \]$ denotes its coefficient at the squarefree index $J$.
  #emph[The resulting trace congruence.] We first prove
  #[#set math.equation(numbering: n => "(9.15)")
   $ a_p \( E^(\( k \)) \) equiv p + 1 med \( mod med 8 \) quad
     upright("for every allowed good ") p upright(" split in ") K . $ <pw:split-mod8>]
  Apply the ordinary $H_({ p })$ trace at a Frobenius lift $phi.alt_p$,
    testing coefficient $p^2$ after theta multiplication. The form $H_({ p })$ is already integral,
    and $theta equiv 1 med \( mod med 2 \)$; hence theta multiplication does not alter any of its reduced
    coefficients after these divisions. On the conductor-one ramified principal-series part the identity is
  $ U_p^2 t \( phi.alt_p \) = U_p^3 + d \( phi.alt_p \) U_p . $
  On the unraised unary part it is the ordinary good-prime coefficient identity.
    These are the only two types in this expression. Consequently
  $ \( t \( phi.alt_p \) f \) \[ p^2 \] = f \[ p^3 \] + \( d \( phi.alt_p \) f \) \[ p \] . $
  Replace the trace by a fresh split prime $p'$ with the same finite data, including every support-unit test.
    At each rational quadratic character unramified outside $S_0$,
    a Frobenius lift at $p$ has the character value of $p$. Hence the matched $p'$ has the same value,
    and $p p'$ has value $1$. Equivalently, $p'$ has the same unit squareclasses as $p$ at all places of $S_0$,
    so their product is square at all of them, including $2$.
    Since $phi.alt_p in G_K$, the new prime is also split in $K$.
    Its coefficient on the left tests $p p'$; by (9.14) it is zero modulo the maximal ideal after the two
    divisions. The determinant term on the right is zero: the unary summand at $p$ has the same character and
    cancels there.
  On the right, the indices $p$ and $p^3$ in $B_({ p })$ have underlying squarefree index $1$;
    they involve only $a \( 1 \) \, a \( p^2 \) \, a \( p^4 \)$.
    The $J = diameter$ unary term has no coefficient at either nonsquare index.
    Thus no other squarefree coefficient contributes there. For $a = a_p \( E^(\( k \)) \)$,
    the phase-free square coefficients are $1 \, a - 1 \, a \( a - 1 \) - p$.
    Hence the remaining coefficient is, up to a unit,
  $ H_({ p }) \[ p^3 \] = frac(a^2 - 2 a - p + 1 - p \( a - 2 \), 4) = frac(\( a - 1 \) \( a - p - 1 \), 4) . $
  It is zero modulo $2$. Full rational two-torsion makes $a$ even, so $a - 1$ is odd; this proves (9.15).
    No individual total filter condition on $p$ was needed: its matched prime $p'$ makes $p p'$ lie on the filter,
    and the square-index terms on the right come from $1$.
  #emph[One further integral division.] Now define
  #[#set math.equation(numbering: n => "(9.16)")
   $ tilde(H)_U = 1 / 4 (B_U - sum_(J subset.eq U) B_U \[ J \] Theta_J) . $ <pw:four-divided-form>]
  We verify integrality at every coefficient. Write a test index uniquely as $J r m^2$,
    where $J subset.eq U$ and $r$ is squarefree and disjoint from $U$.
    The underlying squarefree coefficient is at $D = \( U \/ J \) r$.
    Removing the unit phases, a prime of $U \/ J$ contributes an odd factor $b_s - b_(s - 1)$ with $kappa = 0$,
    and a prime of $J$ contributes $b_(s + 1) - b_s$ with $kappa = \( D \/ p \)$. Thus
  #[#set math.equation(numbering: n => "(9.17)")
   $ v \( B_U \[ J r m^2 \] \) gt.eq omega \( r \) $ <pw:shell-valuation>]
  by (9.13), with one additional unit of valuation when $D$ is nonempty and all its primes split in $K$.
  If $r eq.not 1$ and all primes of $D$ split in $K$, the last inequality is at least $omega \( r \) + 1 gt.eq 2$.
    If $D$ contains an inert prime, then $r$ contains at least two:
    the total rational $K$-character is trivial on the filter, and all primes of $U$ split.
    Then (9.17) is again at least $2$. No unary term has this squarefree part.
    This proves divisibility by $4$ for $r eq.not 1$.
  Suppose $r = 1$ and $J eq.not U$. Then $D = U \/ J$ is nonempty and all split, so $B_U \[ J \]$ is even.
    This cancellation can be checked without dividing by a leading multiplier, which may be zero.
    Factor from both shell coefficients the common phase and the scalar $2^(- \| U \| + \| J \|) a \( U \/ J \)$,
    whose valuation is at least $1$ by (9.14). The remaining factors are the odd differences at $U \/ J$,
    the integral divided differences at $J$, and the ordinary square-index factors outside $U$.
    By Lemma 71, their product is congruent modulo $2$ to the product of their leading values,
    even when one of those values is zero modulo $2$. Since $m$ is odd,
    multiplication by $m$ preserves this congruence. The common scalar supplies the second factor $2$.
    Retaining the phase $eta \( m \)$ therefore gives
  $ B_U \[ J m^2 \] equiv B_U \[ J \] eta \( m \) m med \( mod med 4 \) . $
  This is exactly the cancellation with $B_U \[ J \] Theta_J$.
  Finally let $J = U$, so $D = 1$. At a prime outside $U$ the recurrence gives $b_s equiv
    p^s med \( mod med 4 \)$. At a prime of $U$, (9.15) gives $b_s equiv p^s med \( mod med 8 \)$, and hence
  $ frac(b_(s + 1) - b_s, 2) equiv frac(a_p - 2, 2) thin p^s med \( mod med 4 \) . $
  Multiplying these congruences, again retaining the phases, gives $B_U \[ U m^2 \] equiv
    B_U \[ U \] eta \( m \) m med \( mod med 4 \)$. This proves integrality in the last case and establishes (9.16).
  For the trace argument we specify the integral module being used. Write $psi_U$ for the character of $B_U$.
    The character of $Theta_U$ is also $psi_U$, so its diamond correction is zero.
    For the proper subsets the diamond formula is
  $ chevron.l u chevron.r tilde(H)_U = psi_U \( u \) tilde(H)_U +
    sum_(J subset.neq U) frac(B_U \[ J \], 2) frac(psi_U \( u \) - eta \( u \) \( - J \/ u \), 2) Theta_J . $
  Each $B_U \[ J \] \/ 2$ here is integral, and each divided character difference is zero or a unit.
    Let $tilde(cal(M))_U$ be the $cal(O)$-module generated by $theta tilde(H)_U$ and $theta \( B_U \[ J \] \/ 2 \)
    Theta_J$ for $J subset.neq U$, together with all their good-Hecke and diamond translates.
    Its generators are integral by this formula and the good-Hecke coefficient formula.
    The finite-module and Chebotarev-continuity argument of Lemma 52 therefore applies to $tilde(cal(M))_U$.
    A fresh trace kills every displayed unary correction after coefficientwise reduction,
    also after further fresh tests. Thus the same coefficientwise reduced determinant and trace identities hold on
    the required orbit.
  #emph[The contraction and isolation identities.] On $theta tilde(H)_U$,
    two fresh traces in $G_K$ give zero after reduction at every coefficient.
    To see this, start with an arbitrary test index $J r m^2$ and choose the two fresh primes outside that index
    and the level. The filter imposes $chi_K \( D \) = 1$; since $U$ is all split,
    the number of inert factors in $r$ is either zero or at least two.
    The fresh traces replace $r$ by $r q_1 q_2$, with both $q_i$ split.
    In the first case the valuation after division by $4$ is at least $omega \( r \) + 2 + 1 - 2 = omega \( r \) +
    1 gt.eq 1$. In the second case it is at least $omega \( r \) + 2 - 2 = omega \( r \) gt.eq 2$.
    The unary terms disappear under these fresh tests. Additional fresh $G_K$ traces only improve these estimates,
    so vanishing holds on the entire reduced trace orbit. The trace identity therefore gives
  $ t \( g u^2 \) = t \( g \) wide \( g \, u in G_K \) $
  on this reduced trace orbit. Thus the tests factor through the elementary extension of $K$ unramified off the level.
  A single fresh $K$-split trace at coefficient $1$ reads the bit
  #[#set math.equation(numbering: n => "(9.18)")
   $ tilde(A) \( D \) = (2^(- omega \( D \) - 1) a \( D \) upright(" with its phase removed")) med mod med
     2 $ <pw:deeper-bit>]
  for a nonempty all-split configuration. The contraction rule follows from the same integral local identity as in
    Lemma 53. For completeness its first shell, with $p in U$ and a fresh trace $q$,
    has underlying configuration $D' = \( U \/ p \) q$, which is still nonempty, and its reduction is
  $ c_p \( D' \) tilde(A) \( D' \) \, wide c_p \( D' \) = frac(a_p - \( D' \/ p \) - 1, 2) med mod med 2 . $
  Changing the oriented inertia bit changes $c_p$ once. The omitted-prime identity gives the product label and
    removes the entire rational prime $p$ from the new ramification support.
    Consequently its repeated contraction has precisely the forest interpretation of Lemma 58.
    An omitted-vertex label equal to the identity has trace zero, which is primary isolation.
    No contraction to the empty configuration has occurred.
  #emph[A nonempty witness for the deeper test.] It remains to prove that this deeper test has a witness.
    Fresh ramification gives $K subset.eq.not bb(Q) \( E \[ 8 \] \)$.
    By Chebotarev there is a good prime $p$ inert in $K$ and trivial on the original $E \[ 8 \]$. Then
  $ p equiv 1 med \( mod med 8 \) \, wide a_p \( E^(\( k \)) \) equiv - 2 med \( mod med 8 \) . $
  On $tilde(H)_diameter$, whose coefficient at $1$ is zero, test $t \( u \)^2$ at coefficient $1$, where $u =
    "Fr"_p$. The square coefficient and matching unary character give, up to a unit,
  $ frac(a_p \( E^(\( k \)) \) - 1 - p, 4) med mod med 2 = 1 . $
  The determinant term at coefficient $1$ cancels. In characteristic two, $t \( u^2 \) = t \( u \)^2$,
    so a single trace in $G_K$ is nonzero. A fresh prime realizing this finite trace test is split in $K$.
    Moreover $u^2$ is trivial on every rational quadratic character,
    so the prime lies on the required total rational filter. It is a nonempty witness for (9.18).
    Finally the exact coefficient ratio gives (9.12), with the additional depth at most one. ◻
]

#thm([Lemma 9.13.])[
  (Orientation correction).  #emph[Let $K$ be imaginary quadratic,
    let $S_0$ contain $2$ and its ramification support, and let $V_0$ be the elementary label space over $K$
    unramified off $S_0$. Complex conjugation acts on $V_0$ by $c$.
    If the rational total of an oriented prime configuration is zero on every rational quadratic character
    unramified off $S_0$, then its oriented total belongs to $\( 1 + c \) V_0$.
    A reserved supply containing every label allows its orientations to be flipped to realize any prescribed
    change in $\( 1 + c \) V_0$.]
] <pw:coinvariants>

#proof[
  Complex conjugation has order two outside $G_K$, so $G_(bb(Q)) = G_K times.r chevron.l c chevron.r$.
    A $c$-invariant quadratic character of $G_K$ extends by giving $c$ value zero.
    At a rational prime outside $S_0$, inertia lies in $G_K$ and the character is trivial there;
    thus its extension remains unramified outside $S_0$. The assumed total therefore annihilates $\( V_0^(*) \)^c$.
  For a finite vector space with involution, the annihilator of $ker \( 1 + c^(*) \) = \( V_0^(*) \)^c$ is
    $"im" \( 1 + c \)$. This proves the first assertion. Flipping a vertex of label $v$ changes its oriented label
    from $v$ to $c v$, and hence changes the total by $\( 1 + c \) v$.
    Reserve one representative for every preimage needed to express the desired element of the image.
    Their independent flips give the second assertion. These flips preserve every rational norm label. ◻
]

=== 9.7 The corank-one original base <pw:assembly-section>

#thm([Proposition 9.14.])[
  (Odd original base).  #emph[If $s_2 \( E \) = 1$, then $a \( E \) = 1$.]
] <pw:odd-base>

#proof[
  Parity gives odd functional sign. Use the normalized odd limit symbol on the positive filter of $1$ from
    Section 9.5, with its fixed support, genus partner $h_(*)$, and chosen ultrafilter.
    If it detects the base, a sufficiently advanced actual stage proves the result.
    Otherwise choose its nonempty minimum seed. The moving detecting prime $ell$ is not an extra fixed support
    requirement.
  #emph[Fixing the companion.] Choose a separate even symbol for negative discriminants square at $2 N$,
    excluding the fixed odd support, the relevant torsion ramification, and the exceptional imaginary fields.
    Choose a unit $k$ of that symbol. Then $L \( E^(\( k \)) \, 1 \) eq.not 0$.
    Fix this $k$ and $K = bb(Q) \( sqrt(k) \)$ for the rest of the proof, before choosing any cube dimension.
    Its fresh ramification makes it independent of the old fixed label extensions.
    At sufficiently advanced stages $ell$ avoids $k$. The intrinsic odd label tests continue to omit the primes of $k$.
  We construct common terminal packets, individually split in $K$,
    such that the odd terminal polynomial and an even terminal polynomial testing $h
    k$ are separately nonzero at each nonzero address. They need not have a common unit evaluation yet;
    the address lemma will supply that step.
  #emph[The quadratic residual case.] First suppose $F \, F'$ are quadratic.
    Keep the original even symbol evaluated on $h k$, treating the vertices of $k$ as stationary external data.
    Enrich the rational labels of the $h$-vertices by the primes of $k$.
    Their total there and at the even support is required to be zero.
    Let $V$ be the resulting rational elementary label space, including the $F \,
    F'$ and $K$ coordinates and all relations among these characters.
    The allowed simple labels form the affine set ${ v in V : chi_F \( v \) = 1 \, med chi_K \( v \) = 0 }$,
    in additive notation. The difference of any two of its elements belongs to $ker chi_F ∩ ker chi_K$,
    precisely the realizable rational labels of the permitted split attachments.
    Translation by this subgroup is therefore transitive. The fields $F \,
    F'$ are unramified outside the old support, whereas $K$ has a fresh ramified prime;
    thus $K$ is independent of their compositum. When $F eq.not F'$,
    this realizes both the good-simple pattern $\( 1 \, 1 \, 0 \)$ and the donor pattern $\( 0 \, 1 \, 0 \)$ in
    their three coordinates. When $F = F'$, all simple labels are good.
  For the old odd projection, take a normal closure of its finite label extension at any stage with $ell$ avoiding
    $k$. It is unramified outside the old support and $ell$. Once $ell$ avoids $k$,
    a prime ramified in $K$ remains outside that set. Hence $K$ has trivial intersection with this normal closure,
    and every old odd label can be realized together with splitting in $K$.
    This applies also to oriented split anchors over $F$. The added stationary $k$ coordinates may have relations,
    but they are already included in $V$; they do not impose extra requirements on the omitted odd projection.
    These compatible lifts let us stabilize the common alphabet and its projection maps on the same ultrafilter,
    as in Section 9.5. The intrinsic odd minimum and seed are unchanged.
    Choose the following packets in this fixed abstract alphabet, before selecting an actual stage.
  Use packets with sufficiently large simple supply and reserves in this kernel,
    and with donor slack when $F eq.not F'$. For the even test, take no split anchors.
    If the fields are distinct, correct all bad simples to good ones; if they coincide,
    every simple is already good. Pair equal enriched labels, and retain a nonempty good base pair.
    Use reserves to match the pair and the remaining good pairs,
    and attach every leftover split vertex to the last base position. Its label is forced by total zero.
    The output is a collection of good twin pairs, each matching also at every split vertex of $k$.
    Twin insertion into the unit at $k$ proves that this output has even symbol one.
    Thus the even terminal polynomial is nonzero.
  For the odd test, project away the newly added tests at $k$.
    The same packets contain enough split anchors, simple vertices and reserve shifts to contract to the
    stabilized odd seed and good pairs, by Lemma 64. Its total on that projection is the prescribed zero total.
    Incidences between the retained anchors and the good pairs can be set after contraction,
    by independent edge choices. The odd polynomial is therefore nonzero as well.
    This odd test does not include the stationary vertices of $k$.
  #emph[Full rational two-torsion.] Now suppose the curve has full rational two-torsion.
    Use the even test of Lemma 72, with $K$-oriented labels on its support $S_0$, and let $v_1 \, dots.h \,
    v_r$ be a minimum nonempty witness. Its oriented total $v_1 + dots.h.c + v_r$ lies in $\( 1 + c \) V_0$,
    by Lemma 73. This even test uses the oriented elementary extension of $K$,
    whereas the odd test reads only its rational projection; the even contraction rule is needed only for nonempty
    outputs. Every odd seed label lifts to a $K$-split prime because $K$ was freshly ramified outside its
    intrinsic support. Each even label also has a compatible lift to the common alphabet.
    Stabilize the finite common alphabet and projections on the same ultrafilter,
    preserving the intrinsic odd symbol as in Section 9.5.
  Choose packets containing ample copies of every needed even label,
    all odd seed labels on their rational projection, and orientation-shifting reserves.
    Arbitrary pairs of projected labels need not lift: take a union of sufficiently many compatible lifts for each
    projection separately. Duplicate each full label, so the packet has rational total zero.
  For the even contraction, retain anchors with labels $v_1 \, dots.h \, v_(r - 1)$.
    After reserving these anchors, use orientation flips to make the total equal to $sum v_i$;
    this is possible by Lemma 73. In a contraction certificate these flips are choices of conjugations along the
    forest, as permitted by Lemma 55; they do not change the common terminal data separately at different
    addresses. Merge all remaining vertices into the last cluster. Its label is $v_r$.
    The cluster is nonempty, and the minimum nonempty count makes the output a unit independently of its mutual
    edges. For the odd contraction, use its rational projection.
    Retain all but the last odd seed label and merge the remainder.
    Total zero gives the last label, so this is also a unit. Orientation corrections for the even test did not
    change these rational labels.
  #emph[Simultaneous addressing and an actual stage.] Now fix $b$ and put a sufficient common packet at every
    nonzero linear form on $bb(F)_2^b$. Each nonzero address has two separately nonzero terminal polynomials.
    In the fixed abstract alphabet, Theorem 57 gives finite primary-auxiliary networks making both symbols one
    there. Require their primary types to split in $K$ (and $F$ in the quadratic case) and to be neutral at the
    stationary primes of $k$. They are primary at every support coordinate used by either projection,
    so both symbol identities apply to the same common graph data.
  Let $W_b$ bound all graph weights required by these finite networks.
    A finite intersection of ultrafilter-large sets supplies an actual stage with the same truth table through
    $W_b$, all required divisibilities and trace identities, and sufficient precision for the prescribed
    divisions. The moving prime also avoids the fixed companion $k$.
    Realize the resulting finite graph at that stage using Lemma 55.
    All active products $h$ are positive and square at the fixed tests, and all their primes split in $K$.
    No auxiliary appears at address zero. The depth constant and fixed companion remain unchanged as $b$ grows.
  #emph[Returning to the original curve.] At every nonzero address the analytic orders of $E^(\( h \))$ and
    $E^(\( h k \))$ are respectively one and zero. The odd unit bound, the even unit bound (or (9.12)),
    and Lemma 69 with fixed $k$ give
  $ 2 j_h \( k \) lt.eq 4 w \( h \) + C . $
  The finite Sha lengths at these addresses are nonnegative, so this also bounds $2 j_h \( k \) - 4 w \( h \) -
    s \( h \) - s \( h k \)$ from above.
  At address zero, $L \( E^(\( k \)) \, 1 \) eq.not 0$ gives $s_2 \( E^(\( k \)) \) = 0$ by the forward theorem.
    Lemma 62 therefore gives $s_2 \( E \/ K \) = 1$. Ring-class missing-vertex transfer now makes the base product
    $L \( E \, s \) L \( E^(\( k \)) \, s \)$ have a simple zero.
    Its second factor is nonzero at $1$, and hence $a \( E \) = 1$. ◻
]

#proof[
  Use Lemma 62 to choose the indicated isogeny orientation before constructing either coefficient system.
    The even coefficient system and cyclotomic transfer give both Proposition 66 and the corank-zero conclusion of
    Proposition 67. The bounded varying companion, ring-class lower bound,
    and height comparison then establish Proposition 70. This discharges the arithmetic premise before the odd
    normalization and finite-graph construction of Section 9.5.
  For the corank-one case, Proposition 74 fixes a nonvanishing even companion before the cube dimension,
    constructs simultaneous unit vertices, and applies ring-class transfer at the original base.
    This gives $a \( E \) = s_2 \( E \)$ in both cases. The established Gross–Zagier–Kolyvagin implication in
    analytic rank zero or one gives $r \( E \) = a \( E \)$ and finiteness of the whole Shafarevich–Tate group.
    Equation (9.5) remains the underlying corank identity throughout.
    In particular, neither a finite two-Selmer dimension nor Mordell–Weil rank was substituted for the original
    Selmer corank hypothesis. ◻
]

#prodef([Remark 9.15.])[
  (The prescribed base).  The final companion has Selmer corank zero because it was chosen with nonzero central
    value. Thus (9.4) supplies the required corank over $K$; it is not an additional companion hypothesis.
    Only the finite realizations and their precisions change as the cube grows.
    The valuation constants remain fixed, so transfer applies to the prescribed original curve without deleting a
    density-zero set of bases.
] <pw:status>

#bibliography("refs.bib", style: "ieee", title: [References])
