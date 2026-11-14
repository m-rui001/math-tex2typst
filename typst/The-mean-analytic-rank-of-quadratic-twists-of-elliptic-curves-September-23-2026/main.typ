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

#align(center)[#text(size: 16pt, weight: "bold")[The mean analytic rank of quadratic twists of elliptic curves]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Goldfeld’s mean-rank conjecture predicts that the average central order of vanishing in a quadratic-twist family
  is $1 \/ 2$ #cite(label("Goldfeld1979")) p. 113, Conjecture (B).
  The issue addressed here is the contribution of rare twists of large analytic rank:
  knowing the densities of ranks zero and one does not determine the mean without control of this contribution.

Let $E \/ bb(Q)$ be an elliptic curve. For a nonzero squarefree integer $d$,
  write $E^(\( d \))$ for its quadratic twist, and put

$ cal(D) \( Y \) = { d in bb(Z) : 0 < \| d \| lt.eq Y \, med d upright(" squarefree") } \, wide
  a \( E^(\( d \)) \) = "ord"_(s = 1) L \( E^(\( d \)) \, s \) . $

Both signs of $d$ are included. We call $a$ the analytic rank and write $r \( E^(\( d \)) \) =
  "rank"_(bb(Z)) E^(\( d \)) \( bb(Q) \)$ for the algebraic or Mordell–Weil rank.
  Outside the explicitly algebraic statements below, rank means analytic order of vanishing.

#thm([Theorem 1.1.])[
  #emph[For every elliptic curve $E \/ bb(Q)$,
$ lim_(Y arrow.r oo) frac(1, \# cal(D) \( Y \)) sum_(d in cal(D) \( Y \)) a \( E^(\( d \)) \) = 1 / 2 . $

]
] <thm:mean>

Theorem 1 resolves positively Goldfeld’s mean analytic-rank conjecture in this signed squarefree counting
  convention. It applies without restrictions on complex multiplication, rational torsion, rational isogenies,
  or reduction type.

The analytic density theorem #cite(label("OpenAIAnalyticDensityV2")) Theorem 1.2 states that,
  for this same family and every $E \/ bb(Q)$,

#[#set math.equation(numbering: n => "(1.1)")
 $ frac(\# { d in cal(D) \( Y \) : a \( E^(\( d \)) \) = j }, \# cal(D) \( Y \)) arrow.r 1 /
   2 wide \( j = 0 \, 1 \) . $ <eq:density-input>]

For the analytic mean theorem, (1.1) is the only input from the companion manuscript identified in the
  bibliography. A zero-density exceptional family can still contribute to a rank-weighted average.
  The new assertion needed for the mean is the following tail estimate, whose proof is independent of (1.1).

#thm([Theorem 1.2.])[
  #emph[For every elliptic curve $E \/ bb(Q)$, there are constants $C_E > 0$ and an integer $R_E gt.eq
    1$ such that, for every integer $R gt.eq R_E$,
$ limsup_(Y arrow.r oo) 1 / Y sum_(d in cal(D) \( Y \)\
a \( E^(\( d \)) \) > R) a \( E^(\( d \)) \) lt.eq C_E / R . $

]
] <thm:tail>

Together, (1.1) and Theorem 2 show that

$ sum_(d in cal(D) \( Y \)\
a \( E^(\( d \)) \) gt.eq 2) a \( E^(\( d \)) \) = o_E \( Y \) . $

For each fixed sufficiently large integer $R$, (1.1) makes the complement of ranks zero and one have density zero,
  so ranks $2$ through $R$ contribute $o_(E \, R) \( Y \)$.
  For the remaining ranks, use the height limsup in Theorem 2 and then let $R$ tend to infinity.
  This order of limits will be made explicit in Section 6.

=== 1.1 Algebraic-rank moments <algebraic-rank-moments>

The same signed squarefree family has the following algebraic-rank moment limits.
  This consequence uses the companion’s density conclusions and its density-one equality of analytic and algebraic
  ranks, together with the exponential-moment bound of Koymans and Smith.
  It does not use the analytic tail estimate of Theorem 2.

#thm([Corollary 1.3.])[
  (Fixed algebraic-rank moments).  #emph[Fix an elliptic curve $E \/ bb(Q)$. For every fixed real $t$,
$ lim_(Y arrow.r oo) frac(1, \# cal(D) \( Y \)) sum_(d in cal(D) \( Y \)) exp #h(-0.16667em)
  #scale(x: 120%, y: 120%)[\(] t thin r \( E^(\( d \)) \) #scale(x: 120%, y: 120%)[\)] = frac(1 + e^t, 2) . $

 For every fixed positive integer $m$,
$ lim_(Y arrow.r oo) frac(1, \# cal(D) \( Y \)) sum_(d in cal(D) \( Y \)) r \( E^(\( d \)) \)^m = 1 / 2 . $

]
] <cor:algebraic-moments>

The proof appears in Section 7.

All parameters $t$ and moment orders $m$ in Corollary 3 are fixed before $Y arrow.r oo$.
  The corollary concerns algebraic ranks only: it gives no higher analytic-rank moments,
  no uniformity for parameters varying with $Y$, and no moment limit for thin polynomial subfamilies.

=== 1.2 History and significance <history-and-significance>

Goldfeld’s original question concerns the change of rank when a fixed elliptic curve is viewed over quadratic
  fields. Under Birch–Swinnerton-Dyer, that change is the central order of the associated quadratic twist.
  His Conjecture (B) formulates the average directly in terms of this analytic order,
  using quadratic-field discriminants ordered by absolute value #cite(label("Goldfeld1979")) pp. 113–114.
  Here the counting parameter is instead the signed squarefree integer $d$ in $cal(D) \( Y \)$.
  The rank-zero/rank-one density prediction describes the smallest orders allowed by the two functional-equation
  signs. The mean prediction also requires the larger orders, however sparse, to have negligible total contribution.

Conditional analytic estimates illustrate both aspects of the problem.
  Heath-Brown proved an upper bound $3 \/ 2 + o \( 1 \)$ for smooth averages over fundamental discriminants
  coprime to the conductor, separately for each functional-equation sign #cite(label("HeathBrown2003")) Theorem 3.
  His nonnegative compactly supported weight selects one sign of the discriminant,
  and his Riemann-hypothesis assumption concerns every quadratic twist,
  including those not coprime to the conductor. Under the same twistwise Riemann-hypothesis assumption,
  Miller and Wong bounded higher analytic-rank moments and obtained exponentially decreasing large-rank counting
  tails #cite(label("MillerWong2012")) Theorem 1.1 and Corollary 1.2.
  Their weighted sums run over integer parameters, with possible repeated squareclasses;
  the weight selects one parameter sign without fixing the functional-equation sign.
  Their tail estimate fixes the rank threshold before taking the height limit.
  Fiorilli obtained the exact mean $1 \/ 2$ over signed squarefree parameters coprime to the conductor,
  assuming the Riemann hypothesis for elliptic-curve $L$-functions and an additional averaged cancellation
  hypothesis for nonreal zeros #cite(label("Fiorilli2016")) Theorem 1.1 and Hypothesis M.
  Thus this exact conditional mean uses more than the Riemann hypothesis.

A different route to densities comes from Selmer groups. Smith proved that, for every rational elliptic curve,
  the full $2$-power Selmer corank is zero or one with density $1 \/ 2$ each,
  using signed integer twist parameters #cite(label("Smith2025")) Theorem 1.1.
  His analytic density corollary assumes Birch–Swinnerton-Dyer #cite(label("Smith2025")) Corollary 1.2.
  The companion’s $2$-converse supplies the analytic implication needed for (1.1) in the signed squarefree
  convention. Theorem 2 addresses the additional rank-mass question independently of that density argument.

Koymans and Smith prove exponential moment bounds for Mordell–Weil rank in polynomial quadratic-twist families
  #cite(label("KoymansSmith2026")) Theorem 1.4. The specialization in the proof of Corollary 3 supplies the needed
  algebraic tail control. Such bounds do not supply an analytic-rank identity or higher analytic-rank moments.

Hanners claims the full Birch–Swinnerton-Dyer conjecture for every rational elliptic curve
  #cite(label("Hanners2026")) Theorems 28.1, 39.4 and 39.5. We do not use this claim.
  The unresolved point is how the bridge conditions supported by tests on eighteen curves in Section 39.1 are
  established for every rational elliptic curve, as required by the transfer in Section 39.2.
  This is not a refutation of the claimed theorem.

Modularity provides the analytic continuation and functional equation for every curve in the argument
  #cite(label("BreuilConradDiamondTaylor2001")) Theorem A. Our estimates use these analytic properties and the
  local coefficient bounds. The proof invokes neither the Birch–Swinnerton-Dyer conjecture nor the generalized
  Riemann hypothesis.

Earlier work on a fixed elliptic curve already connected derivative moments to nonvanishing and analytic-rank
  averages. Perelli and Pomykała proved first-derivative nonvanishing results and bounds for the sum of analytic
  ranks #cite(label("PerelliPomykala1997")); Pomykała extended this nonvanishing approach to higher derivatives of
  fixed order in a congruence-restricted twisting family #cite(label("Pomykala1997")).
  In the family of weight-two newforms of varying prime level, Kowalski, Michel,
  and VanderKam combined high completed derivatives, mollification,
  and consecutive derivative orders to control both functional-equation signs.
  Their passage from these nonvanishing counts to rank-weighted tails also uses a separate bound for the second
  moment of analytic rank #cite(label("KowalskiMichelVanderKam2000")) Sections 2, 4, and 8.
  In the present quadratic-twist argument the derivative order grows with height.
  This uniformity, together with a pointwise rank bound, controls the rank mass beyond the available counting
  range without requiring a bounded second analytic-rank moment.

Second moments of the twist $L$-functions themselves supply the analytic comparison used below.
  For full-level holomorphic Hecke forms of weight divisible by four,
  Soundararajan and Young obtained the second-moment asymptotic over positive discriminants $8 d$,
  with $d$ odd and squarefree, under GRH for the twists, the Riemann zeta function,
  and the symmetric-square $L$-function #cite(label("SoundararajanYoung2010")) Theorem 1.2.
  Li proved the asymptotic unconditionally in this full-level setting #cite(label("Li2022")) Theorem 1.1.
  We adapt the Fourier-cutoff and prime-square inflation mechanism in Li’s proof,
  establishing the needed logarithmic bounds for our finite family of arbitrary elliptic curves with its conductor
  and bad-prime factors retained. Neither asymptotic is an input to the argument.

=== 1.3 The analytic argument <the-analytic-argument>

The starting point is the exact identity of Lemma 13, forced by the vanishing of a derivative of order $k$ of the
  completed $L$-function. Its Dirichlet-series weight is obtained by exponentially smoothing a $k$-th power of a
  truncated logarithm. Near the square root of the conductor, at lengths of order $X$ for twists of height $X$,
  this weight suppresses the late terms. The approximation $\( 1 - u \)^k approx e^(- k u)$ for $u =
  O \( 1 \/ k \)$ motivates mollification: at $u = log n \/ log X$,
  the exponential corresponds to a small positive shift from the center of the $L$-function.
  A short approximation to its inverse Euler product then makes the first weighted piece close to a positive main
  term. We split the weighted series using smooth cutoffs into finite pieces and a terminal series,
  use progressively shorter mollifiers as the lengths of the finite pieces increase,
  and estimate the terminal series without mollification.

Two features make the resulting estimates uniform for $k$ as large as a fixed power of $log X$.
  First, a Poisson argument and inflation give unmollified second moments with only powers of logarithms
  (Propositions 6 and 7). The inflation mechanism is related to Li’s work on quadratic twists
  #cite(label("Li2022")) Lemmas 2.7 and 3.1, Proposition 3.2;
  we prove the estimate needed here for the entire fixed finite family of curves,
  including its local factors at bad primes. Second, Proposition 26 gives mean-square bounds for the mollified
  finite pieces in a model that replaces odd-prime character values by independent variables with their
  complete-residue distributions. The mean-square estimates use the whole probability space,
  without discarding exceptional outcomes. Proposition 12 transfers these bounds to integer averages.
  Separately, Proposition 20 compares the mollifiers with positive reciprocal Euler products on most integer
  parameters and relates these products to one another. We can then remove the mollifiers and compare every piece
  with the same positive product: the first piece dominates the later pieces and the terminal series.
  The resulting nonzero sum contradicts the completed-derivative identity whenever the rank exceeds the derivative
  order of matching parity. Consecutive orders cover both signs.

For admissible twists of height $X$, Proposition 27 proves a bound $O_E \( X \/ k^2 \)$ for the number of ranks
  exceeding $k$, uniformly up to $k = \( log X \)^(3 \/ 5)$.
  A conductor-uniform Jensen bound (Lemma 28) gives the pointwise estimate $a \( E^(\( d \)) \) =
  O_E \( log X \)$. The count at the largest permissible $k$ then controls the remaining rank mass,
  and summation of the integer tails proves Theorem 2. The numerical exponents used in the length partition leave
  ample room between the comparison error and the later thresholds; their optimization is not needed.

The sections follow the inputs required by this argument.
  Section 2 fixes the finite auxiliary family and the integer residue model.
  Section 3 proves the moments and the comparison with that model.
  Section 4 constructs the completed-derivative weights and bounds their terminal series.
  Section 5 constructs the short mollifiers and proves the model estimates.
  Section 6 combines them into the counting and rank-weighted tail bounds,
  and uses the companion density theorem only in the final deduction of the mean.
  Section 7 proves the separate algebraic-rank moment corollary.

=== 1.4 Conventions <conventions>

Implied constants may depend on the original curve $E$, on fixed smooth functions,
  and on a specified fixed order of differentiation. They do not depend on the varying height, derivative order,
  or scale index unless this is explicitly stated. We write $tau \( n \)$ for the divisor function and use the
  Fourier kernel $e^(- 2 pi i x y)$ when applying Poisson summation.
  All sufficiently large lower thresholds for the integer $k$ are chosen after the fixed analytic exponents and
  smoothness orders.

== 2 Twist families and the integer model <sec:setup>

We first reduce upper bounds for arbitrary twists to a fixed finite family of curves with coprime twisting
  parameters. This gives exact conductor formulas while preserving the bounds for nonnegative sums needed later.
  We then define the probability model for complete integer residue averages.

We use unitary normalization:

$ L_F \( s \) = L \( F \, s + 1 \/ 2 \) = sum_(n gt.eq 1) lambda_F \( n \) n^(- s) \, wide q_F = "cond" \( F \) \,
  wide C_F = frac(sqrt(q_F), 2 pi) . $

The series converges absolutely in $Re s > 1$. Modularity and the local rules for the Hasse–Weil $L$-function give
  real multiplicative coefficients and inverse Euler factors

#[#set math.equation(numbering: n => "(2.1)")
 $ 1 - lambda_F \( p \) p^(- s) + xi_(F \, p) p^(- 2 s) \, wide xi_(F \, p) =
   upright(bold(1))_(p divides.not q_F) . $ <eq:setup-euler>]

At a good prime the two factor parameters have modulus one by Hasse’s bound #cite(label("Silverman2009"))
  Chapter V, Theorem 2.3.1(a). At a multiplicative prime there is one parameter, of modulus $p^(- 1 \/ 2)$,
  and at an additive prime the factor is one #cite(label("DokchitserAnni2014")) Definitions 17–18 and Theorem 19.
  In particular,

#[#set math.equation(numbering: n => "(2.2)")
 $ \| lambda_F \( n \) \| lt.eq tau \( n \) . $ <eq:setup-coefficients>]

The completed function

$ Lambda_F \( s \) = C_F^s Gamma \( s + 1 \/ 2 \) L_F \( s \) $

is entire of finite order and satisfies

#[#set math.equation(numbering: n => "(2.3)")
 $ Lambda_F \( s \) = epsilon.alt_F Lambda_F \( 1 - s \) \, wide epsilon.alt_F in { 1 \, - 1 } . $ <eq:setup-fe>]

Analytic continuation and the functional equation follow from modularity
  #cite(label("BreuilConradDiamondTaylor2001")) Theorem A and the standard completion
  #cite(label("Silverman2009")) Appendix C, Theorems 16.3–16.4.
  The standard finite-order bounds follow, for example, from the split Mellin integral of the modular cusp form
  and its Fricke transform. They also give polynomial growth in every fixed vertical strip for each fixed curve
  $F$, independently of the averaged estimates proved below.
  Indeed, enclose the strip in $a lt.eq Re s lt.eq b$, with $a lt.eq - 1$ and $b gt.eq 2$.
  Absolute convergence bounds $L_F$ on the right boundary; (2.3) and Stirling’s formula give $L_F \( a + i t \)
  lt.double_(F \, a) \( 1 + \| t \| \)^(1 - 2 a)$ on the left boundary.
  Take $A = 1 - a$ and an integer $N > 1 - 2 a$, so that $L_F \( s \) \/ \( s + A \)^N$ is bounded on both
  boundaries. For $epsilon > 0$ and $0 < kappa < pi \/ \( b - a \)$, multiply this quotient by

$ exp {- epsilon cos (kappa (s - frac(a + b, 2)))} . $

The multiplier has modulus at most one on the vertical boundaries and at most
  $exp \( - c epsilon cosh \( kappa Im s \) \)$ on the horizontal sides, for a fixed $c > 0$.
  This dominates the finite-order growth. The maximum principle on expanding rectangles,
  followed by $epsilon arrow.b 0$, therefore gives $L_F \( sigma + i t \)
  lt.double_(F \, a \, b) \( 1 + \| t \| \)^N$ on the strip.
  These individual bounds justify contour displacements. Their constants may depend on the fixed curve;
  estimates uniform in the varying twist parameters will be proved separately.

=== 2.1 A finite family closed under reduction <a-finite-family-closed-under-reduction>

Fix the primes

$ S = { p : p divides 2 q_E } \, wide Q_S = product_(p in S) p . $

Let $cal(F)$ be the finite set, up to $bb(Q)$-isomorphism,
  of curves obtained from $E$ by twisting by signed squarefree products of primes in $S$.
  The curve $E$ is included. Every $F in cal(F)$ has good reduction outside $S$.

Call a signed squarefree integer $d$ #emph[admissible] if

$ d equiv 1 med \( mod med 4 \) \, wide \( d \, Q_S \) = 1 . $

For a dyadic $X$, put

$ cal(A) \( X \) = { d : d upright(" admissible") \, med X lt.eq \| d \| < 2 X } . $

#thm([Lemma 2.1.])[
  #emph[For every $F in cal(F)$ and signed squarefree $b$, there are $F' in cal(F)$ and an admissible $d$ such that
$ F^(\( b \)) tilde.eq \( F' \)^(\( d \)) \, wide \| d \| lt.eq \| b \| . $

 The correspondence can be chosen to have bounded multiplicity, uniformly in $b$.
   Every sum of nonnegative functions of these twists can therefore be bounded by a fixed multiple of the
   corresponding sums over $cal(F)$ and admissible parameters of no greater height.]
] <setup:reduction>

#proof[
  Write $b = b_S b_0$, where $b_S > 0$ is the product of the primes of $S$ dividing $b$.
    Then $b_0$ is odd and prime to $Q_S$. Choose $epsilon in { 1 \, - 1 }$ so that $d = epsilon b_0 equiv
    1 med \( mod med 4 \)$, and put $F' = F^(\( epsilon b_S \))$.
    Quadratic twisting depends only on the square class and composes by multiplication of square classes.
    Thus $F'$ is in $cal(F)$ and $\( F' \)^(\( d \)) tilde.eq F^(\( b \))$.
    Moreover $\| d \| = \| b \| \/ b_S lt.eq \| b \|$. There are at most $2^(\| S \| + 1)$ choices of the signed
    $S$-part. Possible coincidences among the finitely many curves only change this fixed multiplicity. ◻
]

#thm([Lemma 2.2.])[
  #emph[For $F in cal(F)$ and admissible $d$,
#[#set math.equation(numbering: n => "(2.4)")
 $ L_(F^(\( d \))) \( s \) = sum_(n gt.eq 1) lambda_F \( n \) chi_d \( n \) n^(- s) \, wide q_(F^(\( d \))) =
   q_F \| d \|^2 \, wide chi_d \( n \) = (d / n) . $ <eq:setup-twist>]

 Here the symbol is the Kronecker symbol and $d = 1$ has the untwisted convention.
   For an arbitrary signed squarefree $b$, the same good-prime twisting rule holds at primes outside $S$:
   the local trace is multiplied by $\( b \/ p \)$ when $p divides.not b$,
   and the local factor is one when $p divides b$.]
] <setup:local-factors>

#proof[
  We compute the inverse local Euler factors using geometric Frobenius on the inertia invariants of the dual of
    the rational Tate module, and the conductor as the Artin conductor #cite(label("DokchitserAnni2014"))
    Definitions 17–18 and Theorem 19. The rational Tate-module representation of a quadratic twist is the original
    representation tensored with the corresponding quadratic character.
    This follows from the isomorphism over the twisting extension,
    whose conjugate differs by the scalar automorphism $\[ - 1 \]$.
  An unramified scalar twist preserves the conductor and multiplies Frobenius eigenvalues on inertia invariants by
    the character value. Since an admissible $d$ is an odd fundamental discriminant,
    its character is unramified at every prime of $S$. At a prime $p divides d$,
    the representation of $F$ is unramified and the quadratic character is tamely ramified.
    The tensor product has no inertia invariants, Swan conductor zero, and Artin conductor exponent two.
    At all other primes the scalar twist is unramified. Computing the inertia-invariant Euler factors and the
    conductor gives (2.4). For an arbitrary squarefree $b$, these same computations apply at odd primes outside
    $S$, regardless of the character’s behavior at two. ◻
]

The constants in what follows are chosen uniformly over the finite set $cal(F)$.
  The nonincreasing height in Lemma 4 is useful in the second-moment induction:
  a dual squarefree parameter of absolute value at most $M \/ 2$ remains in a smaller dyadic block after reduction.

=== 2.2 Complete integer averages <complete-integer-averages>

Fix $c in { 1 \, - 1 }$. For $m in bb(Z)$, define a completely multiplicative formal character on positive integers by

$ z_m \( 2 \) = c \, wide z_m \( p \) = (m / p) quad \( p upright(" odd") \) . $

Let $Z$ be the completely multiplicative random model with $Z \( 2 \) =
  c$ and independent odd-prime values distributed by

#[#set math.equation(numbering: n => "(2.5)")
 $ bb(P) \( Z \( p \) = 0 \) = 1 / p \, wide bb(P) \( Z \( p \) = 1 \) = bb(P) \( Z \( p \) = - 1 \) =
   frac(1 - 1 \/ p, 2) . $ <eq:setup-model>]

For every polynomial involving only finitely many prime values,
  its expectation is the average over a complete residue system for the corresponding odd-prime periods.
  This follows from the Chinese remainder theorem and the equal numbers of nonzero quadratic residues and
  nonresidues modulo each odd prime.

We use this model for averages over all integers $m$. Nonnegative estimates can subsequently be restricted to
  admissible squarefree $d$, separated into the two classes $chi_d \( 2 \) = c$; on either class, $z_d \( n \) =
  chi_d \( n \)$ for every $n$.

== 3 Poisson summation and logarithmic second moments <analytic:section>

We retain the finite family $cal(F)$, the fixed set $S$, and the unitary normalization from Lemmas 4 and 5.
  In particular, $\| lambda_F \( n \) \| lt.eq tau \( n \)$, all local parameters have modulus at most one,
  and reduction of a squarefree twisting parameter to an admissible one does not increase its absolute value.
  All constants in this section are uniform in $F in cal(F)$.

Our first aim is to bound the second moments of the twist functions and their localized Dirichlet polynomials with
  only logarithmic losses. For a compactly supported smooth function $G$ on $\( 0 \, oo \)$, write

$ P_d \( N \, t \; G \) = sum_(n gt.eq 1) lambda_F \( n \) chi_d \( n \) n^(- 1 \/ 2 - i t) G \( n \/ N \) . $

All dyadic parameters below belong to ${ 1 \, 2 \, 4 \, dots.h }$.

#thm([Proposition 3.1.])[
  (Logarithmic second moments).  #emph[There are fixed positive integers $A \, B$ such that,
    for every dyadic $M gt.eq 1$, every $F in cal(F)$, every $t in bb(R)$, and $1 \/ 2 lt.eq sigma lt.eq 2$,
#[#set math.equation(numbering: n => "(3.1)")
 $ 1 / M sum_(d med upright("admissible")\
M lt.eq \| d \| < 2 M) \| L_(F^(\( d \))) \( sigma + i t \) \|^2 lt.double_(cal(F))
  log^B \( 3 M \) \( 1 + \| t \| \)^A . $ <analytic:L-moment>]

 For arbitrary signed squarefree twisting parameters and $H gt.eq 1$,
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(0 < \| h \| lt.eq H\
h med upright("squarefree")) \| L_(F^(\( h \))) \( sigma + i t \) \|^2 lt.double_(cal(F)) H
  log^B \( 3 H \) \( 1 + \| t \| \)^A . $ <analytic:prefix-moment>]

]
] <analytic:moment>

#thm([Proposition 3.2.])[
  (Dirichlet-polynomial second moments).  #emph[With the same fixed integers $A \, B$,
    every fixed smooth $G$ of compact support in $\( 0 \, oo \)$ satisfies
#[#set math.equation(numbering: n => "(3.3)")
 $ 1 / M sum_(d med upright("admissible")\
M lt.eq \| d \| < 2 M) \| P_d \( N \, t \; G \) \|^2 lt.double_(cal(F) \, G)
  log^B \( 3 M \) \( 1 + \| t \| \)^A \( 1 + N \/ M \)^A wide \( N > 0 \) . $ <analytic:polynomial-bound>]

 The bound is uniform for fixed uniformly smooth families of weights with common compact support.]
] <analytic:polynomial-moment>

We prove these estimates by induction on the twisting height $M$.
  Poisson summation turns a polynomial mean square into a sum of products of twist $L$-functions at dual
  squarefree parameters. To put those parameters below the current height,
  we first enlarge the family by replacing $d$ with $d p^2$, where $p asymp P$.
  The new averaging height is $U = M P^2$. A weight with compact Fourier support then restricts the dual
  parameters to size $O \( N^2 \/ \( M P^2 \) \)$, which is at most $M \/ 2$ for a sufficiently large $P$.
  Recovering the original squarefree average costs $O \( P log \( 2 P \) \)$.
  The nonzero-frequency estimate gains $P^(- 2)$, so after recovery its recursive coefficient contains $N
  log \( 2 P \) \/ \( M P \)$. We choose $P$ as a sufficiently large fixed power of
  $log \( 3 M \) \( 1 + N \/ M \) \( 1 + \| t \| \)$, with a large fixed leading constant,
  to make this coefficient small. The approximate functional equation and a strip estimate then close the
  induction for the $L$-functions themselves. The compact Fourier support construction and prime-square inflation
  are related to Li’s treatment of quadratic twists #cite(label("Li2022")).

The arithmetic preparation below keeps its arithmetic exponents independent of the number of weight derivatives.
  Once the induction is closed, we sum all dual frequencies to compare short polynomial averages with the integer
  model. The polynomial moment bound will also control the unmollified terminal series in Section 4.

=== 3.1 The normalized Gauss sums <the-normalized-gauss-sums>

Put $e \( x \) = exp \( 2 pi i x \)$. For an odd positive integer $l$, set

$ tau_h \( l \) = sum_(a med mod med l) (a / l) e \( a h \/ l \) \, wide epsilon.alt_l =
  cases(delim: "{", 1 & l equiv 1 med \( mod med 4 \) \,, i & l equiv 3 med \( mod med 4 \) \,) wide B_h \( l \) =
  frac(tau_h \( l \), epsilon.alt_l sqrt(l)) . $

We use $B_h \( 1 \) = 1$. The square root is positive. These are the normalized quadratic Gauss sums of
  #cite(label("Soundararajan2000")) Section 2.2, Lemma 2.3:
  in that notation, $B_h \( l \) = G_h \( l \) \/ sqrt(l)$.
  We give the formulas and their proof in the present normalization.

#thm([Lemma 3.3.])[
  (Exact Gauss-sum formulas).  #emph[For fixed $h$, the function $l mapsto
    B_h \( l \)$ is multiplicative on odd positive integers, and
#[#set math.equation(numbering: n => "(3.4)")
 $ B_(- h) \( l \) = (frac(- 1, l)) B_h \( l \) \, wide epsilon.alt_l B_h \( l \) = frac(1 + i, 2) B_h \( l \) +
   frac(1 - i, 2) B_(- h) \( l \) . $ <analytic:phase>]

 If $h eq.not 0$, $p$ is odd, $t = v_p \( h \)$, and $v gt.eq 1$, then
#[#set math.equation(numbering: n => "(3.5)")
 $ B_h \( p^v \) =
   cases(delim: "{", p^(v \/ 2) \( 1 - p^(- 1) \) \, & v upright(" even") \, med v lt.eq t \,, - p^(v \/ 2 -
   1) \, & v upright(" even") \, med v = t + 1 \,, p^(\( v - 1 \) \/ 2) (frac(h \/ p^(v - 1), p)) \, & v
   upright(" odd") \, med v = t + 1 \,, 0 \, & upright("otherwise") .) $ <analytic:prime-powers>]

 Consequently $B_h \( p^v \) = 0$ for $v > t + 1$ and $\| B_h \( p^v \) \| lt.eq p^(v \/ 2)$.
   If $t = 0$, only $v = 1$ can survive and $B_h \( p \) = \( h \/ p \)$.
   If $t = 1$, only $v = 2$ can survive and $B_h \( p^2 \) = - 1$.]
] <analytic:gauss>

#proof[
  For coprime odd $l_1 \, l_2$, the Chinese remainder theorem, followed by a change of variable in each Gauss sum, gives
  $ tau_h \( l_1 l_2 \) = (l_1 / l_2) (l_2 / l_1) tau_h \( l_1 \) tau_h \( l_2 \) . $
  Quadratic reciprocity says that the displayed product of symbols is
    $epsilon.alt_(l_1 l_2) \/ \( epsilon.alt_(l_1) epsilon.alt_(l_2) \)$. This proves multiplicativity.
    Substituting $a mapsto - a$ proves the first identity in (3.4);
    the second follows by considering the two residue classes of $l$ modulo four.
  For even $v$, the Jacobi symbol modulo $p^v$ is the indicator of the units. Thus
  $ tau_h \( p^v \) = sum_(a med mod med p^v) e \( a h \/ p^v \) -
    sum_(b med mod med p^(v - 1)) e \( b h \/ p^(v - 1) \) \, $
  which equals $p^v - p^(v - 1)$ when $p^v divides h$, equals $- p^(v - 1)$ when $p^(v - 1) bar.v.double h$,
    and otherwise vanishes. Here $epsilon.alt_(p^v) = 1$. For odd $v$, write $a = y +
    p z$ with $y$ modulo $p$ and $z$ modulo $p^(v - 1)$. The $z$-sum vanishes unless $p^(v - 1) divides h$; in that case
  $ tau_h \( p^v \) = p^(v - 1) sum_(y med mod med p) (y / p) e #scale(x: 120%, y: 120%)[\(]
    y \( h \/ p^(v - 1) \) \/ p #scale(x: 120%, y: 120%)[\)] . $
  This is zero if $p^v divides h$. Otherwise the quadratic Gauss-sum formula makes it $p^(v - 1) epsilon.alt_p
    sqrt(p) thin #scale(x: 120%, y: 120%)[\(] frac(h \/ p^(v - 1), p) #scale(x: 120%, y: 120%)[\)]$.
    Since $epsilon.alt_(p^v) = epsilon.alt_p$ for odd $v$, division by $epsilon.alt_(p^v) p^(v \/ 2)$ gives (3.5). ◻
]

For later use, fix once and for all the arithmetic exponent

#[#set math.equation(numbering: n => "(3.6)")
 $ C_(upright("ar")) = 256 . $ <analytic:arithmetic-exponent>]

This exponent will not change when we require more derivatives of a weight or more decay in an imaginary direction.

#thm([Lemma 3.4.])[
  (Two-variable Euler factorization).  #emph[Let $r$ be positive and odd, and write $h = h_1 h_2^2 eq.not 0$,
    where $h_1$ is signed squarefree and $h_2 gt.eq 1$. For $nu in { 1 \, - 1 }$, the series
$ cal(G)_(h \, r)^nu \( s_1 \, s_2 \) = sum_(n_1 \, n_2 gt.eq 1\
n_1 \, n_2 med
  upright("odd")) frac(lambda_F \( n_1 \) lambda_F \( n_2 \) B_(nu h) \( r n_1 n_2 \), n_1^(s_1) n_2^(s_2)) $

 initially converges in a right half-plane and continues to $Re s_1 \, Re s_2 > 1 \/ 2$ as
#[#set math.equation(numbering: n => "(3.7)")
 $ cal(G)_(h \, r)^nu \( s_1 \, s_2 \) = L_(F^(\( nu h_1 \))) \( s_1 \) L_(F^(\( nu h_1 \))) \( s_2 \)
   cal(Q)_(h \, r)^nu \( s_1 \, s_2 \) . $ <analytic:euler-factorization>]

 For $0 < b lt.eq 1 \/ 4$ and $Re s_i gt.eq 1 \/ 2 + b$,
#[#set math.equation(numbering: n => "(3.8)")
 $ \| cal(Q)_(h \, r)^nu \( s_1 \, s_2 \) \| lt.double_(cal(F)) b^(- C_(upright("ar"))) r^(C_(upright("ar")))
   tau \( h_2 \)^(C_(upright("ar"))) . $ <analytic:euler-bound>]

 The function $cal(Q)$ is holomorphic in these open half-planes.]
] <analytic:euler>

#proof[
  For an odd prime put $e_p = v_p \( r \)$ and $t_p = v_p \( h \)$.
    Multiplicativity expresses the series as the product of the local sums
  $ T_p \( s_1 \, s_2 \) = sum_(a \, b' gt.eq 0) lambda_F \( p^a \) lambda_F \( p^(b') \)
    B_(nu h) \( p^(e_p + a + b') \) p^(- a s_1 - b' s_2) . $
  The symbol $b'$ here is an integer exponent, distinct from the real shift $b$.
    No division by $B_(nu h) \( p^(e_p) \)$ is made; that quantity may vanish.
    Write $D_p^(*) \( s \)$ for the inverse local factor of the elliptic curve $F^(\( nu h_1 \))$.
    The correction factor at $p$ is $T_p \( s_1 \, s_2 \) D_p^(*) \( s_1 \) D_p^(*) \( s_2 \)$.
    At two it is just $D_2^(*) \( s_1 \) D_2^(*) \( s_2 \)$, because the summation indices are odd.
  There are three types of odd prime. If $p in.not S$ and $p divides.not r h$,
    put $chi = \( nu h \/ p \) = \( nu h_1 \/ p \)$ and $x_i = p^(- s_i)$. The local formulas give exactly
  $ T_p = 1 + lambda_F \( p \) chi \( x_1 + x_2 \) \, wide D_p^(*) \( s_i \) = 1 - lambda_F \( p \) chi x_i + x_i^2 . $
  Multiplication cancels both terms of total degree one. The sum of the absolute values of all polynomial
    coefficients before cancellation is at most $5 dot.op 4 dot.op 4 = 80$.
    Therefore the correction is $1 + O \( 80 p^(- 1 - 2 b) \)$, uniformly in the imaginary parts.
  If $p in.not S$, $p divides.not r$, and $t_p = 1$, the twisting curve has a trivial local factor at $p$. By (3.5),
  $ T_p = 1 - lambda_F \( p^2 \) \( x_1^2 + x_2^2 \) - lambda_F \( p \)^2 x_1 x_2 = 1 + O \( 10 p^(- 1 - 2 b) \) . $
  In particular these primes do not produce a cost for every prime factor of the squarefree part $h_1$.
  The remaining odd primes lie in $S$ or divide $r h_2$. The support in (3.5) gives $e_p + a + b' lt.eq t_p +
    1$ for every nonzero summand, except that $B_(nu h) \( 1 \) = 1$ is already covered when $e_p = a = b' = 0$. Hence
  $ \| T_p \| lt.eq p^(e_p \/ 2) sum_(a + b' lt.eq t_p + 1) \( a + 1 \) \( b' + 1 \) lt.eq
    p^(e_p \/ 2) \( t_p + 3 \)^4 . $
  Each inverse local factor has modulus at most $\( 1 + p^(- 1 \/ 2) \)^2$,
    so the product of the two costs at most $9$. Writing $u_p = v_p \( h_2 \)$, we have $t_p lt.eq 2 u_p + 1$.
    If $u_p gt.eq 1$, the bound $9 \( 2 u_p + 4 \)^4 lt.eq \( u_p + 1 \)^17$ absorbs this cost into a fixed
    divisor power, with $p^(e_p \/ 2)$ absorbed by $r$. If $u_p = 0$ and $e_p gt.eq 1$,
    the cost is at most $9 dot.op 4^4 p^(e_p \/ 2) lt.eq p^(8 e_p)$ for $p gt.eq 3$.
    If $u_p = e_p = 0$, this is one of the fixed primes of $S$, whose cost is a fixed constant.
    The factor at two is bounded by $\( 1 + 2^(- 1 \/ 2) \)^4$.
  The nonexceptional product is bounded by
  $ exp (80 sum_p p^(- 1 - 2 b)) lt.eq zeta \( 1 + 2 b \)^80 lt.double b^(- 80) . $
  Combining the estimates proves (3.8) with the stated $C_(upright("ar"))$.
    The nonexceptional correction product converges normally on compact subsets of $Re s_i > 1 \/ 2$;
    all exceptional factors are polynomials. Multiplication by the entire twist $L$-functions therefore gives the
    claimed continuation. This argument never divides by a global $L$-value. ◻
]

=== 3.2 A weighted Poisson estimate <a-weighted-poisson-estimate>

The Euler factorization identifies the twist functions that occur at nonzero frequencies.
  We now turn it into a weighted comparison formula: the zero frequency gives the integer residue average,
  and the remaining frequencies are bounded by those twist functions.
  This is a quadratic Poisson method used in #cite(label("Soundararajan2000")) Section 2.4, Lemma 2.6,
  with the weights and normalization specified below.

Fix a compact interval $\[ a_0 \, a_1 \] subset \( 0 \, oo \)$ for the first two scaled variables.
  The third variable ranges over $bb(R)$. For an integer $D gt.eq 0$, a convenient finite seminorm is

$ parallel W parallel_(D \, *) = max_(alpha + beta + gamma lt.eq D) sup_(y_1 \, y_2 \, x) \( 1 + \| x \| \)^D
  lr(|partial_(y_1)^alpha partial_(y_2)^beta partial_x^gamma W \( y_1 \, y_2 \, x \)|) . $

The functions under consideration vanish outside $\[ a_0 \, a_1 \]^2$ in the first two variables and have the
  indicated finite decay and smoothness in the third. Requiring a larger fixed $D$ below causes no change to
  $C_(upright("ar"))$.

#thm([Lemma 3.5.])[
  (Poisson estimate).  #emph[Let $U > 0$, let $r$ be odd and positive,
    and let $N_i$ be bounded below by a fixed positive constant. Fix $0 < b lt.eq 1 \/ 4$. In the expression
#[#set math.equation(numbering: n => "(3.9)")
 $ 1 / U sum_(m in bb(Z)) sum_(n_1 \, n_2 gt.eq 1\
n_1 \, n_2 med
  upright("odd")) frac(lambda_F \( n_1 \) lambda_F \( n_2 \), \( n_1 n_2 \)^(1 \/ 2) n_1^(i t_1) n_2^(i t_2))
  (frac(m, r n_1 n_2)) W \( n_1 \/ N_1 \, n_2 \/ N_2 \, m \/ U \) \, $ <analytic:poisson-average>]

 Poisson summation gives the zero frequency, namely the complete-residue average integrated in $x$,
   together with the nonzero frequencies. For every fixed $J_1 > 0$,
   a sufficiently large fixed seminorm order $D$ bounds the absolute contribution of frequency $h =
   h_1 h_2^2 eq.not 0$ by
#[#set math.equation(numbering: n => "(3.10)")
 $ & C_(J_1 \, cal(F)) parallel W parallel_(D \, *) \( N_1 N_2 \)^(- 1 \/ 2 + b) b^(- C_(upright("ar")))
   r^(C_(upright("ar"))) tau \( h_2 \)^(C_(upright("ar"))) (1 + frac(\| h \| U, r N_1 N_2))^(- J_1)\
 & #h(8mm)  dot.op sum_(nu = plus.minus 1) integral_(bb(R)^2)
   frac(product_(i = 1)^2 \| L_(F^(\( nu h_1 \))) \( 1 \/ 2 + b + i \( t_i + v_i \) \) \|, \( 1 + \| v_1 \| + \|
   v_2 \| \)^(J_1)) thin d v_1 thin d v_2 . $ <analytic:nonzero-mode>]

 If the Fourier transform of $W$ in $x$ is supported in a fixed interval $\[ - C_W \, C_W \]$,
   all modes with $\| h \| > C_W a_1^2 r N_1 N_2 \/ U$ vanish exactly.]
] <analytic:poisson>

#proof[
  Our Fourier convention is $hat(W) \( y_1 \, y_2 \, xi \) =
    integral_(bb(R)) W \( y_1 \, y_2 \, x \) e \( - x xi \) thin d x$.
    Applying Poisson summation in each residue class modulo $l = r n_1 n_2$ gives exactly
  $ 1 / U sum_m (m / l) W \( y_1 \, y_2 \, m \/ U \) = sum_(h in bb(Z)) frac(tau_h \( l \), l)
    hat(W) \( y_1 \, y_2 \, h U \/ l \) . $
  Thus the normalized frequency factor is
  $ 1 / sqrt(n_1 n_2) frac(tau_h \( r n_1 n_2 \), r n_1 n_2) =
    frac(epsilon.alt_(r n_1 n_2) B_h \( r n_1 n_2 \), sqrt(r) thin n_1 n_2) . $
  Use (3.4) to replace the numerator by a fixed linear combination of $B_h$ and $B_(- h)$.
  Put $rho = h U \/ \( r N_1 N_2 \)$ and
  $ V_h \( y_1 \, y_2 \) = hat(W) \( y_1 \, y_2 \, rho \/ \( y_1 y_2 \) \) \, wide tilde(V)_h \( z_1 \, z_2 \) =
    integral_0^oo #h(-0.16667em) integral_0^oo V_h \( y_1 \, y_2 \) y_1^(z_1) y_2^(z_2) frac(d y_1 d y_2, y_1 y_2) . $
  On any fixed bounded range of real parts, Fourier integration by parts in $x$,
    followed by Mellin integration by parts in $y_1 \, y_2$, yields
  #[#set math.equation(numbering: n => "(3.11)")
   $ \| tilde(V)_h \( z_1 \, z_2 \) \| lt.double_(J_1) parallel W
     parallel_(D \, *) \( 1 + \| rho \| \)^(- J_1) \( 1 + \| Im z_1 \| + \| Im z_2 \| \)^(- J_1) .
     $ <analytic:mellin-kernel>]
  To see why differentiation causes no arithmetic loss, each derivative of $rho \/ \( y_1 y_2 \)$ contributes a
    bounded multiple of $rho$ on the fixed compact support. For any fixed number of such derivatives,
    take that many additional integrations by parts in $x$. The powers of $rho$ are then absorbed by its Fourier
    decay. All other factors are bounded functions of $y_1 \, y_2$.
  Mellin inversion first on right lines expresses the $nu$ part of the mode as
  $ frac(1, sqrt(r) \( 2 pi i \)^2) integral #h(-0.16667em) integral tilde(V)_h \( z_1 \, z_2 \) N_1^(z_1)
    N_2^(z_2) cal(G)_(h \, r)^nu \( 1 + i t_1 + z_1 \, 1 + i t_2 + z_2 \) thin d z_1 thin d z_2 . $
  Move both lines to $Re z_i = - 1 \/ 2 + b$. Lemma 9 and the entire continuation of the twist functions show that
    no pole is crossed. Polynomial growth in fixed strips, together with a larger fixed order in (3.11),
    makes the horizontal segments tend to zero. The scale factor is $\( N_1 N_2 \)^(- 1 \/ 2 + b)$.
    Applying (3.8) and (3.11), and discarding $r^(- 1 \/ 2) lt.eq 1$, proves (3.10).
    The final assertion follows directly from the support of $hat(W)$ before Mellin inversion. ◻
]

Whenever unrestricted positive indices occur, write $n = 2^a n'$ with $n'$ odd.
  For $z_m \( 2 \) = c$ the factor taken outside an odd-index sum is $lambda_F \( 2^a \) c^a
  2^(- a \( 1 \/ 2 + i t \))$. Its absolute values have the uniformly convergent majorant

#[#set math.equation(numbering: n => "(3.12)")
 $ sum_(a gt.eq 0) \( a + 1 \) 2^(- a \/ 2) < oo . $ <analytic:two-sum>]

The new length is $N \/ 2^a$; a nonempty localized sum has this length bounded below by a constant depending only
  on $\[ a_0 \, a_1 \]$.

=== 3.3 Closing a logarithmic second-moment induction <closing-a-logarithmic-second-moment-induction>

#proof[
  We give a simultaneous induction for all $F in cal(F)$. The induction hypothesis at smaller dyadic heights is
  #[#set math.equation(numbering: n => "(3.13)")
   $ 1 / M' sum_(d med upright("admissible")\
M' lt.eq \| d \| < 2 M') \| L_(F^(\( d \))) \( sigma + i t \) \|^2 lt.eq
  K log^B \( 3 M' \) \( 1 + \| t \| \)^A wide \( M' < M \) . $ <analytic:induction-hypothesis>]
  The constant $K$, common to the finite family, will be selected last.
    Since the reduction in Lemma 4 does not increase height and has bounded multiplicity, this hypothesis implies
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_(0 < \| h_1 \| lt.eq H\
h_1 med upright("squarefree")) \| L_(F^(\( nu h_1 \))) \( 1 \/ 2 + b + i v \) \|^2 lt.eq
  C_(cal(F)) K H log^B \( 3 M \) \( 1 + \| v \| \)^A quad \( 1 lt.eq H lt.eq M \/ 2 \) . $ <analytic:inductive-prefix>]
  Indeed all admissible images lie in earlier dyadic blocks, whose lengths have sum at most $2 H$.
    If $H < 1$, the sum is empty. In particular the arguments below at $M = 1$ require no induction input.
  #emph[The polynomial average at inflated height.] First we prove a polynomial estimate with a small coefficient
    in front of $K$. Put $L = log \( 3 M \)$, $T = 1 + \| t \|$, and let $N > 0$. Choose $P$ sufficiently large, with
  #[#set math.equation(numbering: n => "(3.15)")
   $ P gt.eq C_(cal(F) \, G) \( 1 + N \/ M \) . $ <analytic:inflation-condition>]
  Let $cal(P)$ consist of the primes $p in \[ P \, 2 P \]$ outside $S$.
    For a sufficiently large fixed lower threshold on $P$, the elementary dyadic prime estimate of Erdős
    #cite(label("Erdos1932")) §6, equation (10) gives $\| cal(P) \| gt.double P \/ log \( 2 P \)$.
  Choose a fixed nonnegative Schwartz function $Phi$ that is at least one on $\[ - 8 \, 8 \]$ and has compactly
    supported Fourier transform. For completeness, take a nonzero even real smooth bump $g$ in frequency space
    with $integral g > 0$. Its inverse Fourier transform $f$ is real, Schwartz, and nonzero near zero.
    A sufficiently small dilation makes $f \( alpha x \)$ nonzero throughout $\[ - 8 \, 8 \]$;
    a fixed multiple of $f \( alpha x \)^2$ then has the required properties.
    Its Fourier transform is a compactly supported convolution.
  Put $U = M P^2$. For $c = plus.minus 1$ use the formal character $z_m$ with $z_m \( 2 \) = c$,
    and let $P_m^c \( N' \, t \; G \)$ be the corresponding polynomial. We claim, uniformly for $0 < N' lt.eq N$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ 1 / U sum_(m in bb(Z)) Phi \( m \/ U \) \| P_m^c \( N' \, t \; G \) \|^2 & lt.eq
     C_G log^(C_0) \( 3 M + 3 N \) (1 + C_(A \, B \, cal(F) \, G) K frac(N, M P^2) L^B T^A) \,
     $ <analytic:inflated-moment>]
  where we may fix $C_0 = 512$, independently of $A \, B$ and of the required smoothness orders.
  To prove the claim, apply Lemma 10 with $r = 1$ to the expansion of the square,
    first separating powers of two by (3.12). Take $b = 1 \/ \( 10 log \( 3 M + 3 N \) \)$.
    For the zero mode the complete-residue mean vanishes unless the odd part of $n_1 n_2$ is a square,
    and its absolute value is at most one. Inserting $\( n_1 n_2 \)^(- b)$ at the bounded cost $\( C_G N \)^(2 b)
    lt.double_G 1$ majorizes the resulting sum by an Euler product. At an odd prime this product has factor
  $ sum_(a \, b' gt.eq 0\
a + b' med upright("even")) \( a + 1 \) \( b' + 1 \) p^(- \( a + b' \) \( 1 \/ 2 + b \)) = 1 +
  O \( 100 p^(- 1 - 2 b) \) . $
  For example this follows by putting $z = p^(- 1 \/ 2 - b) lt.eq 3^(- 1 \/ 2)$ in $1 /
    2 \( \( 1 - z \)^(- 4) + \( 1 + z \)^(- 4) \)$ and bounding its terms of degree at least two.
    The prime two costs a bounded factor by (3.12). The zero mode is therefore $O_G \( b^(- 100) \)$.
  For the nonzero modes, denote the two odd lengths by $N_1 \, N_2$. The Fourier support restricts the frequencies to
  $ 0 < \| h \| lt.eq H_0 = C_Phi N_1 N_2 \/ \( M P^2 \) . $
  Increasing the constant in (3.15) ensures $H_0 lt.eq M \/ 2$ for every such pair of lengths.
    For fixed $h_2$, Cauchy–Schwarz and (3.14) bound the sum over $h_1$ occurring in (3.10) by
  $ lt.double_(cal(F)) K H_0 / h_2^2 L^B \( 1 + \| t + v_1 \| \)^(A \/ 2) \( 1 + \| - t + v_2 \| \)^(A \/ 2) . $
  This formula is only used when $H_0 \/ h_2^2 gt.eq 1$; otherwise that sum is empty. Choose $J_1 > A + 4$.
    Since $1 + \| plus.minus t + v \| lt.eq T \( 1 + \| v \| \)$, the integral in $v_1 \, v_2$ is $O_A \( T^A \)$. Also
  #[#set math.equation(numbering: n => "(3.17)")
   $ sum_(h_2 gt.eq 1) frac(tau \( h_2 \)^(C_(upright("ar"))), h_2^2) < oo . $ <analytic:square-factor-sum>]
  One proof of this convergence is its Euler product: its local factor is $1 +
    O_(C_(upright("ar"))) \( p^(- 2) \)$, since $sum_(a gt.eq 1) \( a + 1 \)^(C_(upright("ar"))) p^(- 2 a)
    lt.double_(C_(upright("ar"))) p^(- 2)$ uniformly for $p gt.eq 2$.
    Consequently the nonzero contribution is bounded by
  $ lt.double_(A \, B \, cal(F) \, G) b^(- C_(upright("ar"))) K L^B T^A \( N_1 N_2 \)^(- 1 \/ 2 + b) H_0
    lt.double_(A \, B \, cal(F) \, G) log^(C_0) \( 3 M + 3 N \) K frac(N, M P^2) L^B T^A . $
  Here $\( N_1 N_2 \)^b lt.double_G 1$ and $sqrt(N_1 N_2) lt.double_G N$.
    The sums of the factors from two converge by (3.12). This proves (3.16).
    If the Fourier support contains no nonzero frequency, the same proof uses only its zero-mode part.
  #emph[Recovering the squarefree average.] Now inflate an admissible parameter by setting $m = d p^2$.
    If $c = chi_d \( 2 \)$, multiplicativity gives the exact identity
  #[#set math.equation(numbering: n => "(3.18)")
   $ P_d \( N \, t \; G \) = sum_(a gt.eq 0) lambda_F \( p^a \) chi_d \( p \)^a p^(- a \( 1 \/ 2 + i t \))
     P_(d p^2)^c \( N \/ p^a \, t \; G \) . $ <analytic:inflation-identity>]
  Indeed $z_(d p^2) \( n \)$ deletes all positive powers of $p$ and agrees with $chi_d \( n \)$ on integers prime
    to $p$; reinstating their Euler coefficients gives the original sum.
    If $p divides d$, the terms with $a gt.eq 1$ vanish, so the identity also covers that case.
  Equip pairs $\( d \, p \)$, with $M lt.eq \| d \| < 2 M$, $chi_d \( 2 \) = c$, and $p in cal(P)$,
    with squared norm $\( M \| cal(P) \| \)^(- 1) sum_(d \, p) \| dot.op \|^2$.
    The map $\( d \, p \) mapsto d p^2$ is injective: in the prime factorization of its absolute value the only
    exponent exceeding one occurs at $p$, and is either two or three. Moreover $\| d p^2 \| < 8 U$.
    Thus the $a = 0$ term has norm at most
  $ (frac(U, M \| cal(P) \|))^(1 \/ 2) sup_(0 < N' lt.eq N)
    (1 / U sum_m Phi \( m \/ U \) \| P_m^c \( N' \, t \; G \) \|^2)^(1 \/ 2)
    lt.double \( P log \( 2 P \) \)^(1 \/ 2) cal(B)^(1 \/ 2) \, $
  where $cal(B)$ denotes the right side of (3.16). For $a gt.eq 1$ fix $p$ before summing in $d$.
    The weaker bound $sum_d \| P_(d p^2)^c \( N \/ p^a \, t \; G \) \|^2 lt.eq
    U cal(B)$ gives pair norm at most $\( a + 1 \) P^(1 - a \/ 2) cal(B)^(1 \/ 2)$. Minkowski’s inequality and
  $ sum_(a gt.eq 1) \( a + 1 \) P^(- a \/ 2) lt.double P^(- 1 \/ 2) $
  show that these terms together have norm $O \( P^(1 \/ 2) cal(B)^(1 \/ 2) \)$. Summing the two choices of $c$ proves
  #[#set math.equation(numbering: n => "(3.19)")
   $ 1 / M sum_d \| P_d \( N \, t \; G \) \|^2 & lt.double_G log^(C_0) \( 3 M + 3 N \) P log \( 2 P \)
     (1 + C_(A \, B \, cal(F) \, G) K frac(N, M P^2) L^B T^A) . $ <analytic:deinflated-moment>]
  Here is an explicit noncircular choice of exponents. Set
  #[#set math.equation(numbering: n => "(3.20)")
   $ C_0 & = 512 \, wide C_1 = C_0 + 32 \, wide C_2 = C_0 + C_1 + 4 \,\
R & = C_2 + 4 \, wide C_3 = 3 C_2 + 10 \, wide A = B = 2 \( C_3 + 20 \) . $ <analytic:exponent-choices>]
  The letter $R$ in this proof denotes a fixed contour abscissa;
    it is unrelated to a rank truncation threshold used later in the paper. For any prescribed $epsilon > 0$, choose
  #[#set math.equation(numbering: n => "(3.21)")
   $ P = P_0 \[ L \( 1 + N \/ M \) T \]^(C_1) . $ <analytic:choice-P>]
  Once $A \, B$ and the fixed weight family have been selected, a sufficiently large $P_0$ ensures (3.15) and gives
  #[#set math.equation(numbering: n => "(3.22)")
   $ 1 / M sum_d \| P_d \( N \, t \; G \) \|^2 & lt.eq C_(*) \[ L \( 1 + N \/ M \) T \]^(C_2)\
 & quad + epsilon K L^(B - 10) T^(A - 4) \( 1 + N \/ M \)^(- 4) . $ <analytic:small-recursion>]
  The constant $C_(*)$ can depend on $P_0$ and the chosen fixed data, but not on $K \, M \, N \, t$.
    For explicit verification, put $q = 1 + N \/ M$ and $D_0 = L q T$. Then $log \( 3 M + 3 N \) lt.double L q$ and
  $ frac(log \( 2 P \), P) lt.eq frac(log \( 2 P_0 \) + C_1, P_0) D_0^(- C_1 + 1) . $
  The recursive coefficient in (3.19) is therefore at most a fixed multiple of
  $ frac(log \( 2 P_0 \) + C_1, P_0) K L^(B + C_0 - C_1 + 1) T^(A - C_1 + 1) q^(C_0 - C_1 + 2) . $
  Our value of $C_1$ leaves at least the losses $10 \, 4 \, 4$ displayed in (3.22).
    Its prefactor can be made smaller than $epsilon$. The nonrecursive term is bounded by $C_(*)
    D_0^(C_0 + C_1 + 1)$ and hence by the stated $C_2$ power.
    In particular $C_2$ was fixed before $A \, B \, epsilon \, P_0 \, K$.
  #emph[Reconstructing the central-line values.] We next reconstruct $L$ on the central line.
    Choose a fixed smooth dyadic partition $G_0$ with common compact support in $\( 0 \, oo \)$,
    so that $sum_(N = 1 \, 2 \, 4 \, dots.h) G_0 \( n \/ N \) = 1$ for every integer $n gt.eq 1$.
    Let $C_d = sqrt(q_F) \| d \| \/ \( 2 pi \)$ and define
  $ I_d \( t \) = frac(1, 2 pi i) integral_(\( R \)) L_(F^(\( d \))) \( 1 \/ 2 + i t + w \) C_d^w
    frac(Gamma \( 1 + i t + w \), Gamma \( 1 + i t \)) e^(w^2) / w thin d w . $
  Moving the contour to $Re w = - R$ crosses only the residue $L_(F^(\( d \))) \( 1 \/ 2 + i t \)$,
    because the completed function is entire. Apply its functional equation on the new line and replace $w$ by $-
    w$. One obtains the exact approximate functional equation
  #[#set math.equation(numbering: n => "(3.23)")
   $ L_(F^(\( d \))) \( 1 \/ 2 + i t \) = I_d \( t \) + omega_d \( t \) I_d \( - t \) \, wide omega_d \( t \) =
     epsilon.alt_d C_d^(- 2 i t) frac(Gamma \( 1 - i t \), Gamma \( 1 + i t \)) \, quad \| omega_d \( t \) \| =
     1 . $ <analytic:afe-identity>]
  The Gaussian makes the contour displacement legitimate. Initially, on $Re w = R$,
    the Dirichlet series is absolutely convergent, so we may insert the dyadic partition.
  For $0 lt.eq c lt.eq R$, Stirling’s formula uniformly gives
  #[#set math.equation(numbering: n => "(3.24)")
   $ lr(|frac(Gamma \( 1 + c + i \( t + v \) \), Gamma \( 1 + i t \))|) lt.double_R
     T^c \( 1 + \| v \| \)^(R + 1 \/ 2) e^(pi \| v \| \/ 2) . $ <analytic:gamma-quotient>]
  Indeed the quotient of the exponential factors is at most $e^(pi \| v \| \/ 2)$, and
  $ frac(\( 1 + \| t + v \| \)^(c + 1 \/ 2), \( 1 + \| t \| \)^(1 \/ 2)) lt.eq T^c \( 1 + \| v \| \)^(c + 1 \/ 2) . $
  The same estimates with $1 + \| t + v \|$ also cover bounded ordinates, including $v$ near $- t$.
    Thus the bound is uniform as $c$ tends to zero. For a fixed dyadic piece the polynomial is finite,
    so its contour can be moved to any $0 < c lt.eq R$. Multiplying (3.24) by $\|
    e^(\( c + i v \)^2) \|$ absorbs its $v$-factors into $O_R \( e^(- v^2 \/ 2) \)$ and yields
  #[#set math.equation(numbering: n => "(3.25)")
   $ \| L_(F^(\( d \))) \( 1 \/ 2 + i t \) \| lt.double_(R \, cal(F)) sum_(nu = plus.minus 1) sum_N
     integral_(bb(R)) frac(e^(- v^2 \/ 2), \| c_N + i v \|) (frac(M T, N))^(c_N) \|
     P_d \( N \, nu t + v \; G_0 \( y \) y^(- c_N) \) \| thin d v . $ <analytic:afe-pieces>]
  There is no use of the desired moment to justify this representation:
    on the initial fixed line $R$, the elementary bound $\| P_d \( N \, t \; G \) \| lt.double_G sqrt(N)
    log \( 2 + N \)$ makes the sum of the long pieces converge, since $R > 1 \/ 2$.
    Finitely many shorter pieces can then be moved separately.
    The moment estimates below also show convergence after taking the family norm.
  Use
  $ c_N = frac(1, log \( 3 M T \)) quad \( N lt.eq M T^2 \) \, wide c_N = R quad \( N > M T^2 \) . $
  Apply (3.22) uniformly to the fixed smooth family $G_0 \( y \) y^(- c)$, $0 lt.eq c lt.eq R$,
    and use Minkowski in (3.25). We spell out the two contributions.
    For the nonrecursive square-root term and $N lt.eq M T^2$,
  $ \[ L \( 1 + N \/ M \) \( 1 + \| nu t + v \| \) \]^(C_2 \/ 2) lt.double L^(C_2 \/ 2)
    T^(3 C_2 \/ 2) \( 1 + \| v \| \)^(C_2 \/ 2) . $
  There are $O \( log \( 3 M T^2 \) \)$ such dyadic pieces, $\( M T \/ N \)^(c_N) lt.eq e$ for $N gt.eq 1$,
    and $1 \/ \| c_N + i v \| lt.eq log \( 3 M T \)$. Since both logarithms are $O \( L T \)$,
    their squared total cost gives at most $C_(* *) \( L T \)^(3 C_2 + 4)$ in the mean square.
    For the long pieces put $q' = N \/ M > T^2$. Then
  $ sum_(q' > T^2) (T / q')^R \( q' \)^(C_2 \/ 2) lt.double_R T^(- R + C_2) \, $
  where $q'$ runs over a dyadic progression. Including the outside factor $L^(C_2 \/ 2)
    T^(C_2 \/ 2)$ again fits within $C_(* *) \( L T \)^(C_3)$ by (3.20).
  For the recursive square-root term, the short dyadic sum satisfies
  $ sum_(N lt.eq M T^2) \( 1 + N \/ M \)^(- 2) lt.double log \( 3 M \) = L . $
  The Gaussian absorbs $\( 1 + \| v \| \)^(\( A - 4 \) \/ 2)$, so the resulting norm is at most
  $ C_(A \, R \, cal(F)) sqrt(epsilon K) thin L^(B \/ 2 - 5) T^(A \/ 2 - 2) thin L log \( 3 M T \) lt.double
    C_(A \, R \, cal(F)) sqrt(epsilon K) thin L^(B \/ 2) T^(A \/ 2) . $
  For the long pieces we have the stronger estimate
  #[#set math.equation(numbering: n => "(3.26)")
   $ sum_(q' > T^2) (T / q')^R \( 1 + q' \)^(- 2) lt.double_R T^(- R - 4) \, $ <analytic:long-recursive-sum>]
  which gives the same bound. Squaring the total norm now proves
  #[#set math.equation(numbering: n => "(3.27)")
   $ 1 / M sum_d \| L_(F^(\( d \))) \( 1 \/ 2 + i t \) \|^2 lt.eq C_(* *) \( L T \)^(C_3) +
     C_dagger epsilon K L^B T^A . $ <analytic:central-recursion>]
  Here $C_dagger$ depends on $A \, R \, cal(F)$ but not on $P_0 \, K \, M \, t$; $C_(* *)$ may depend on $P_0$.
    This independence is essential when choosing the constants.
  #emph[Closing the induction in the strip.] It remains to extend the estimate to the strip without a factor for
    the number of twists. Form the vector
  $ upright(bold(V))_F \( s \) = #scale(x: 120%, y: 120%)[\(] M^(- 1 \/ 2) L_(F^(\( d \))) \( s \)
    #scale(x: 120%, y: 120%)[\)]_d $
  in the finite-dimensional Euclidean space indexed by the current admissible block.
    On $Re s = 2$ its squared norm is bounded by an absolute constant:
    each $L$-value has modulus at most $sum_n tau \( n \) n^(- 2) = zeta \( 2 \)^2$,
    and the number of parameters is $O \( M \)$. On $Re s = 1 \/ 2$, (3.27) gives the stated vector norm bound.
  For each constant unit vector $u$ apply the scalar strip principle to
  $ f_u \( s \) = frac(chevron.l upright(bold(V))_F \( s \) \, u chevron.r, \( 1 + s \)^(A \/ 2)) . $
  Here $A$ is even by (3.20). On both boundaries $\| 1 + s \| asymp 1 + \| Im s \|$,
    with constants independent of the number of twists. The scalar boundary bound is therefore at most
  $ C_A #scale(x: 120%, y: 120%)[\(] C_(* *) L^(C_3) + C_dagger epsilon K L^B +
    1 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  For clarity, finite-order growth suffices for the strip principle:
    multiply $f_u \( s \)$ by $exp { - rho cos \( s - 5 \/ 4 \) }$, with $rho > 0$.
    Its modulus is at most one on the strip boundaries and it decays faster than every finite-order growth bound
    on horizontal sides, since $cos \( Re s - 5 \/ 4 \) > 0$ for $1 \/ 2 lt.eq Re s lt.eq 2$.
    Apply the maximum principle on rectangles and then let their heights tend to infinity and $rho$ decrease to
    zero. Taking the supremum over unit vectors at the desired point gives
  #[#set math.equation(numbering: n => "(3.28)")
   $ parallel upright(bold(V))_F \( sigma + i t \) parallel_2^2 lt.eq
     C_(upright("st")) #scale(x: 120%, y: 120%)[\(] C_(* *) L^(C_3) + C_dagger epsilon K L^B +
     1 #scale(x: 120%, y: 120%)[\)] T^A \, wide 1 \/ 2 lt.eq sigma lt.eq 2 . $ <analytic:strip-recursion>]
  This argument has no dimension-dependent loss.
  The choice order is now explicit. Fix the family, the elementary arithmetic exponent, $C_0 \, C_1 \, C_2 \, R \,
    C_3 \, A \, B$ as above, and then all needed fixed kernel orders.
    Next choose $0 < epsilon < \( 4 C_(upright("st")) C_dagger \)^(- 1)$,
    choose $P_0$ to obtain (3.22) for the entire weight family,
    and finally choose $K$ so large that $C_(upright("st")) \( C_(* *) L^(C_3) + 1 \) lt.eq
    K L^B \/ 2$ for every $L gt.eq log 3$. This is possible because $B > C_3$ and $C_(* *)$ is independent of $K$.
    Equation (3.28) proves (3.13) at height $M$. At $M = 1$, all dual sums used above are empty,
    so this also establishes the initial step. The simultaneous induction is complete.
  The induction just completed uses the fixed weight family $G_0 \( y \) y^(- c)$, $0 lt.eq c lt.eq R$.
    For any other fixed smooth compactly supported $G$, repeat the polynomial argument through (3.22),
    using the established $L$-function bound at smaller heights.
    The constants $P_0$ and $C_(*)$ may now depend on $G$, while $K \, A \, B$ remain fixed.
    Since $A \, B > C_2$, this proves (3.3), with the asserted uniformity for fixed uniformly smooth weight
    families. Finally use Lemma 4, bounded multiplicity, and a sum over admissible dyadic blocks of total length
    $O \( H \)$ to obtain (3.2). No analytic-density input has entered the argument. ◻
]

=== 3.4 Short polynomials and auxiliary multipliers <short-polynomials-and-auxiliary-multipliers>

The second moments are now available at every height. We use them to bound the complete sum of nonzero Poisson
  frequencies, retaining the zero frequency as an exact independent-model average.
  The resulting comparison permits a short polynomial multiplier, as required for the mollifiers below.

Fix a nonnegative smooth function $Psi$ compactly supported in ${ x : 0 < \| x \| < oo }$, with $Psi \( x \) gt.eq
  1$ when $1 lt.eq \| x \| lt.eq 2$. Fix $c in { 1 \, - 1 }$.
  The formal character $z_m$ and the independent variables $Z$ always have value $c$ at two.
  At odd primes their model law is

$ bb(P) \( Z \( p \) = 0 \) = 1 / p \, wide bb(P) \( Z \( p \) = 1 \) = bb(P) \( Z \( p \) = - 1 \) =
  frac(1 - 1 \/ p, 2) . $

They are extended completely multiplicatively. This is a model for complete integer residue averages.

#thm([Lemma 3.6.])[
  (Summation of all dual frequencies).  #emph[For fixed $B gt.eq 0$, $J_1 > 1$, and $Q > 0$,
#[#set math.equation(numbering: n => "(3.29)")
 $ sum_(T = 1 \, 2 \, 4 \, dots.h) T log^B \( 3 T \) \( 1 + T \/ Q \)^(- J_1) lt.double_(B \, J_1)
   cases(delim: "{", Q^(J_1) \, & 0 < Q < 1 \,, Q log^B \( 3 Q \) \, & Q gt.eq 1 .) $ <analytic:dyadic-frequency-bound>]

 In particular the first bound is at most a constant times $Q$.]
] <analytic:frequency-sum>

#proof[
  If $Q < 1$, bound $\( 1 + T \/ Q \)^(- J_1)$ by $\( Q \/ T \)^(J_1)$.
    The remaining series is $sum_(j gt.eq 0) 2^(- \( J_1 - 1 \) j) log^B \( 3 dot.op 2^j \) < oo$.
    For $Q gt.eq 1$, the part $T lt.eq Q$ is bounded by $log^B \( 3 Q \) sum_(T lt.eq Q) T lt.double Q
    log^B \( 3 Q \)$. For the remaining part choose the first dyadic $T_0 > Q$, so $Q < T_0 lt.eq 2 Q$,
    and write $T = 2^j T_0$. The summand is at most
  $ C_B Q thin 2^(- \( J_1 - 1 \) j) #scale(x: 120%, y: 120%)[\(] log^B \( 3 Q \) + \( j + 1 \)^B
    #scale(x: 120%, y: 120%)[\)] . $
  Both resulting geometric series converge. This estimates the infinite frequency tail before any logarithm is
    replaced by $log X$. ◻
]

#thm([Proposition 3.7.])[
  (Comparison with the independent model).  #emph[Let $ell = log X$, where $X$ is sufficiently large, and let
$ c_1 ell^(- 1 \/ 10) lt.eq Delta lt.eq 1 / 2 $

 for a fixed $c_1 > 0$. There are fixed constants $eta \, c_2 > 0$ for which the following holds. Let
$ S_V \( x \) = sum_(n gt.eq 1) frac(lambda_F \( n \) V \( n \), sqrt(n)) thin w_x \( ell^(- 1) log n \) \, wide
  H_V = sum_(r' lt.eq R_0) h \( r' \) V \( r' \) \, $

 where $V = z_m$ or $Z$. Suppose that $S_V$ has length at most $X^(1 - Delta)$, that
#[#set math.equation(numbering: n => "(3.30)")
 $ 1 lt.eq R_0 lt.eq X^(eta Delta) \, wide sum_(r' lt.eq R_0) \| h \( r' \) \| lt.eq C_H R_0^2 \,
   $ <analytic:multiplier-conditions>]

 and that $w_x$ and a function $A \( x \)$ have bounds by a fixed power of $ell$ for all derivatives up to a
   sufficiently large fixed order. For $w_x$ these bounds are required after smooth dyadic localization in $n$,
   on the scaled variables $n \/ N$ and $x$ in a fixed neighborhood of $"supp" Psi$.
   They may in particular follow from bounds in $u = ell^(- 1) log n gt.eq 0$ and $x$,
   with a smooth extension at $n = 1$. Then
#[#set math.equation(numbering: n => "(3.31)")
 $ & 1 / X sum_(m in bb(Z)) Psi \( m \/ X \) \| H_(z_m) S_(z_m) \( m \/ X \) - A \( m \/ X \) \|^2\
 & #h(8mm)  = integral_(bb(R)) Psi \( x \) thin bb(E) \| H_Z S_Z \( x \) - A \( x \) \|^2 thin d x +
   O #scale(x: 120%, y: 120%)[\(] exp \( - c_2 Delta ell \) #scale(x: 120%, y: 120%)[\)] .
   $ <analytic:model-comparison>]

 The constants and the sufficiently large $X$ threshold are uniform when the stated support, coefficient,
   and derivative bounds are uniform. They do not depend on $Delta$ or on an index parametrizing such weights.
   One may take
#[#set math.equation(numbering: n => "(3.32)")
 $ C' = C_(upright("ar")) + 1 = 257 \, wide eta = frac(1, 4 \( 4 + 2 C' \)) \, wide c_2 = 1 /
   2 . $ <analytic:comparison-constants>]

]
] <analytic:comparison>

#proof[
  Put $L = X^(1 - Delta)$. If the length hypothesis specifies only that the integer coefficients vanish for $n >
    L$, multiply the interpolating weight by $rho_(+) \( n \/ L \)$,
    where $rho_(+)$ is a fixed smooth function equal to one on $\( - oo \, 1 \]$ and zero on $\[ 2 \, oo \)$.
    This preserves every integer coefficient and gives real support in $n lt.eq 2 L$.
    On a dyadic scale meeting the transition, $N \/ L$ is bounded,
    so derivatives of $rho_(+) \( N y \/ L \)$ add only fixed constants to the assumed scaled seminorm bounds.
    Thus all nonempty localized lengths satisfy $N_i lt.double L$.
  Expand the square on the left of (3.31). A term involving two multiplier indices $r'_1 \,
    r'_2$ has character factor $z_m \( r'_1 r'_2 n_1 n_2 \)$.
    Its odd multiplier part is an integer $r lt.eq R_0^2$. Powers of two contribute only fixed signs.
    Split powers of two out of $n_1 \, n_2$, and insert smooth dyadic partitions in their odd parts.
    Each resulting term has exactly the form (3.9) with $U = X$, $t_1 = t_2 = 0$,
    and a weight $W$ whose required seminorm is $O \( ell^(D_1) \)$ for a fixed $D_1$.
    The independent factors coming from the powers of two satisfy (3.12).
    Cross terms with $A \( x \)$ are covered by using an index supported just at one:
    choose a fixed smooth function supported in $\( 1 \/ 2 \, 3 \/ 2 \)$ and equal to one at one.
    The identity $lambda_F \( 1 \) = 1$ then puts them in the same form.
    The term $\| A \|^2$ is covered by two such indices. Its derivatives obey the same fixed polynomial bounds.
  The zero frequency is exactly the model expression. In fact, for an odd prime and $v gt.eq 1$,
  $ 1 / p^v sum_(a med mod med p^v) (a / p^v) =
    cases(delim: "{", 0 & v upright(" odd") \,, 1 - p^(- 1) & v upright(" even") \,) = bb(E) Z \( p \)^v . $
  For $v = 0$ both sides are one. Chinese remaindering gives independence at distinct odd primes,
    and the value at two is already fixed. The integral of the zero-frequency smooth amplitude is thus the
    corresponding term on the right of (3.31).
  It remains to estimate the nonzero frequencies. Fix an odd multiplier $r$ and localized odd lengths $N_1 \,
    N_2$, and set
  $ b = frac(1, 10 ell) \, wide Q = frac(r N_1 N_2, X) . $
  Only nonempty lengths need be considered, so $N_i$ is bounded below by a fixed positive constant.
    Also $N_i lt.double X^(1 - Delta)$, whence $\( N_1 N_2 \)^b lt.double 1$.
    Proposition 6 is available at every height. For a dyadic frequency range $T lt.eq \| h \| < 2 T$, write $h =
    h_1 h_2^2$. For fixed $h_2$, the parameter $h_1$ lies in $0 < \| h_1 \| < 2 T \/ h_2^2$.
    Cauchy–Schwarz and (3.2) imply
  $ & sum_(T lt.eq \| h \| < 2 T\
h = h_1 h_2^2) tau \( h_2 \)^(C_(upright("ar"))) product_(i = 1)^2 \| L_(F^(\( nu h_1 \))) \( 1 \/ 2 + b + i v_i \) \|\
 & quad lt.double T log^B \( 3 T \) \( 1 + \| v_1 \| \)^(A \/ 2) \( 1 + \| v_2 \| \)^(A \/ 2)
   sum_(h_2 lt.eq sqrt(2 T)) frac(tau \( h_2 \)^(C_(upright("ar"))), h_2^2)\
 & quad lt.double T log^B \( 3 T \) \( 1 + \| v_1 \| \)^(A \/ 2) \( 1 + \| v_2 \| \)^(A \/ 2) . $
  This inequality applies separately to each $nu$; it includes both signs of $h$.
    Choose $J_1 > A + 4$ in (3.10), and then fix the corresponding smoothness order.
    Its vertical integral is convergent. The remaining sum is bounded, by Lemma 11, by
  $ lt.double ell^(D_2) r^(C_(upright("ar"))) \( N_1 N_2 \)^(- 1 \/ 2)
    cases(delim: "{", Q^(J_1) & Q < 1 \,, Q log^B \( 3 Q \) & Q gt.eq 1 .) $
  When $Q gt.eq 1$ we have $Q lt.double X$ using $r lt.eq R_0^2$, (3.30), and $eta < 1$;
    hence $log \( 3 Q \) lt.double ell$. When $Q < 1$ use $Q^(J_1) lt.eq Q$.
    In both regimes the error for this localized pair is therefore
  #[#set math.equation(numbering: n => "(3.33)")
   $ lt.double ell^(D_3) r^(C') sqrt(N_1 N_2) / X \, wide C' = C_(upright("ar")) +
     1 . $ <analytic:localized-comparison-error>]
  The increase from $C_(upright("ar"))$ to $C'$ is only the factor $r$ in $Q$, not a smoothness loss.
    Notice that this argument controls arbitrarily large dual frequencies as well as the case $Q < 1$.
  There are $O \( ell \)$ possible nonempty dyadic pieces for each main index.
    Their cost is a fixed logarithmic power. Summing the coefficients from powers of two by (3.12) costs only a
    constant. The two multiplier coefficient sums and the bound $r lt.eq R_0^2$ cost at most
  $ \( 1 + sum \| h \( r' \) \| \)^2 R_0^(2 C') lt.double_(C_H) R_0^(4 + 2 C') . $
  Since $sqrt(N_1 N_2) \/ X lt.double X^(- Delta)$, including the terms with an index at one, the full error is
  #[#set math.equation(numbering: n => "(3.34)")
   $ lt.double ell^(D_4) X^(- Delta) R_0^(4 + 2 C') lt.eq ell^(D_4) exp \( - 3 Delta ell \/ 4 \) .
     $ <analytic:total-comparison-error>]
  Our choices in (3.32) give the last inequality. The power $D_4$ is fixed before choosing $X$.
    Because $Delta ell gt.eq c_1 ell^(9 \/ 10)$, for one sufficiently large $X$ the factor $ell^(D_4)$ is at most
    $exp \( Delta ell \/ 4 \)$. This proves (3.31) with $c_2 = 1 \/ 2$. ◻
]

The endpoint at $n = 1$ in this proposition needs no extension to a fixed negative interval in $u$.
  Extend a dyadically localized weight only to, say, $n gt.eq 1 \/ 2$.
  In the coordinate $log n = ell u$ this is a fixed interval,
  and smooth cutoffs there introduce at most fixed powers of $ell$ in $u$ derivatives.
  On a dyadic scale, repeated differentiation of $w_x \( log \( N y \) \/ ell \)$ instead introduces powers of
  $1 \/ ell$ and bounded powers of $1 \/ y$. Thus the required finite seminorm bounds are precisely those in the
  proposition, even at the first piece.

== 4 Completed derivatives and their weights <sec:weights>

A large analytic rank forces a completed derivative to vanish.
  For the matching functional-equation sign, we express that vanishing as an exact weighted-series identity,
  partition the series into short pieces, and bound the remaining infinite piece using the second moments of
  Section 3. The short pieces will be treated by mollification in Section 5.

Fix a curve $F$ in the finite family $cal(F)$, write $lambda = lambda_F$, and put $C_F = sqrt(q_F) \/ \( 2 pi \)$.
  The variable $x$ will range over a fixed compact subset $cal(K)$ of $bb(R) \\ { 0 }$,
  chosen large enough to contain the support of the averaging weight in Proposition 12.
  Derivative bounds in $x$ are understood on a fixed compact neighborhood of $cal(K)$ disjoint from zero.
  All constants below may depend on this compact set and on the fixed finite family.

The order of choices is as follows. First fix the exponents in Proposition 7,
  and all the finite orders of differentiation needed for Proposition 12, the Mellin inversion below,
  and the subsequent Fourier estimates. Next choose a sufficiently large fixed integer $k_0$.
  Finally choose one lower bound for $X$, valid simultaneously for all the integers

#[#set math.equation(numbering: n => "(4.1)")
 $ ell = log X \, wide k_0 lt.eq k lt.eq floor.l ell^(3 \/ 5) floor.r . $ <weights:range>]

The estimates in this section respect this order. In particular,
  the number of derivatives is never allowed to increase with $k$ or $X$.

=== 4.1 The exact completed derivative identity <the-exact-completed-derivative-identity>

For $k gt.eq 1$, $x eq.not 0$, and real $u$, define

#[#set math.equation(numbering: n => "(4.2)")
 $ W_(k \, x) \( u \) = integral_0^oo e^(- v) (1 - u + frac(log \( C_F \| x \| v \), ell))_(+)^k thin d v \, wide
   y_(+) = max \( y \, 0 \) . $ <weights:W>]

For every fixed choice of the parameters the integral is finite.
  The weighted sum below is an infinite, absolutely convergent smoothed Dirichlet series;
  its individual short pieces will be finite sums.

#thm([Lemma 4.1.])[
  (Completed derivative identity).  #emph[Let $d$ be admissible, $X lt.eq \| d \| < 2 X$, and $x = d \/ X$. Set
$ g_d \( z \) = L_(F^(\( d \))) \( 1 \/ 2 + z \) \( C_F \| d \| \)^z Gamma \( 1 + z \) \, wide epsilon.alt_d =
  "sign" \( F^(\( d \)) \) . $

 Then $g_d$ is entire, $g_d \( - z \) = epsilon.alt_d g_d \( z \)$, and
#[#set math.equation(numbering: n => "(4.3)")
 $ cal(S)_d & := sum_(n gt.eq 1) frac(lambda \( n \) chi_d \( n \), sqrt(n)) W_(k \, x) \( ell^(- 1) log n \)\
 & = frac(k !, ell^k) frac(1, 2 pi i) integral_(\( 2 \)) g_d \( z \) frac(d z, z^(k + 1)) .
   $ <weights:completed-integral>]

 More precisely,
#[#set math.equation(numbering: n => "(4.4)")
 $ #scale(x: 120%, y: 120%)[\(] 1 + epsilon.alt_d \( - 1 \)^k #scale(x: 120%, y: 120%)[\)] cal(S)_d =
   ell^(- k) g_d^(\( k \)) \( 0 \) . $ <weights:exact-derivative>]

 Consequently, if $a \( F^(\( d \)) \) > k$ and $epsilon.alt_d = \( - 1 \)^k$, then
#[#set math.equation(numbering: n => "(4.5)")
 $ sum_(n gt.eq 1) frac(lambda \( n \) chi_d \( n \), sqrt(n)) W_(k \, d \/ X) \( ell^(- 1) log n \) =
   0 . $ <weights:zero>]

]
] <weights:vanishing>

#proof[
  The completed function is
  $ Lambda_d \( s \) = \( C_F \| d \| \)^s Gamma \( s + 1 \/ 2 \) L_(F^(\( d \))) \( s \) . $
  Thus $g_d \( z \) = \( C_F \| d \| \)^(- 1 \/ 2) Lambda_d \( 1 \/ 2 + z \)$.
    Its entireness and reflection law follow from those of $Lambda_d$.
  For $T > 0$, Mellin inversion gives
  $ frac(1, 2 pi i) integral_(\( 2 \)) T^z / z^(k + 1) thin d z = frac(\( log T \)_(+)^k, k !) . $
  Insert the absolutely convergent Dirichlet series for $L_(F^(\( d \))) \( 1 \/ 2 + z \)$,
    and use $Gamma \( 1 + z \) = integral_0^oo e^(- v) v^z thin d v$.
    On this line all exchanges are absolutely convergent: the series is dominated by $sum_n tau \( n \)
    n^(- 5 \/ 2)$, and the other two factors to be integrated are dominated by $e^(- v) v^2$ and $\| 2 +
    i t \|^(- k - 1)$. The result is (4.3), because
  $ ell^(- 1) log \( C_F \| d \| v \/ n \) = 1 - ell^(- 1) log n + ell^(- 1) log \( C_F \| x \| v \) . $
  This argument, or the same computation with absolute coefficient values,
    also proves absolute convergence of the series.
  Let $I_(+)$ and $I_(-)$ denote the integrals of $g_d \( z \)
    z^(- k - 1) \/ \( 2 pi i \)$ on the upward oriented lines $"Re" z = 2$ and $"Re" z = - 2$.
    Shifting between these lines crosses only the pole at zero, and gives
  $ I_(+) - I_(-) = frac(g_d^(\( k \)) \( 0 \), k !) . $
  The horizontal integrals tend to zero: in this fixed strip the uncompleted $L$-function has polynomial growth,
    while the gamma factor has exponential decay on horizontal segments tending to infinity.
    Apparent gamma poles on the real axis are removable in $g_d$.
    Changing $z$ to $- z$, with orientations included, gives
  $ I_(-) = \( - 1 \)^(k + 1) epsilon.alt_d I_(+) . $
  Multiplication by $k ! \/ ell^k$ proves (4.4). Finally, the completing factor is holomorphic and nonzero at
    zero. Hence $a \( F^(\( d \)) \) > k$ implies $g_d^(\( k \)) \( 0 \) = 0$,
    and the stipulated sign makes the coefficient on the left of (4.4) equal to two. ◻
]

=== 4.2 Partition and derivative estimates <partition-and-derivative-estimates>

Fix a $C^oo$, nondecreasing function $f_(*) : bb(R) arrow.r \[ 0 \, 1 \]$ which is zero on $\( - oo \, 1 \/ 4 \]$
  and one on $\[ 1 \/ 2 \, oo \)$. Define

#[#set math.equation(numbering: n => "(4.6)")
 $ J = ⌊frac(log ell, 10 log 2)⌋ \, wide delta_j = 2^(- j) \, wide F_j \( u \) =
   f_(*) \( \( 1 - u \) \/ delta_j \) quad \( 0 lt.eq j lt.eq J \) . $ <weights:scales>]

In particular, for sufficiently large $X$,

#[#set math.equation(numbering: n => "(4.7)")
 $ J gt.eq 1 \, wide ell^(- 1 \/ 10) lt.eq delta_J < 2 ell^(- 1 \/ 10) \, wide frac(k, ell delta_j) lt.eq
   ell^(- 3 \/ 10) quad \( 0 lt.eq j lt.eq J \) . $ <weights:scale-bounds>]

Set

#[#set math.equation(numbering: n => "(4.8)")
 $ w_(0 \, x) \( u \) & = F_0 \( u \) W_(k \, x) \( u \) \,\
w_(j \, x) \( u \) & = \( F_j \( u \) - F_(j - 1) \( u \) \) W_(k \, x) \( u \) &  & \( 1 lt.eq j lt.eq J \) \,\
w_(* \, x) \( u \) & = \( 1 - F_J \( u \) \) W_(k \, x) \( u \) . $ <weights:partition>]

These weights sum exactly to $W_(k \, x)$. For $V = chi_d \, z_m$, or $Z$, write

#[#set math.equation(numbering: n => "(4.9)")
 $ S_(j \, V) \( x \) & = sum_(n gt.eq 1) frac(lambda \( n \) V \( n \), sqrt(n)) w_(j \, x) \( ell^(- 1) log n \) \,\
S_(* \, V) \( x \) & = sum_(n gt.eq 1) frac(lambda \( n \) V \( n \), sqrt(n)) w_(* \, x) \( ell^(- 1) log n \) .
  $ <weights:S>]

The first definition includes $j = 0$. All the formal character values in these definitions have modulus at most
  one. The sums through $j = J$ have length at most $X^(1 - delta_j \/ 4)$, and

#[#set math.equation(numbering: n => "(4.10)")
 $ "supp" w_(j \, x) subset \[ 1 - delta_j \, 1 - delta_j \/ 4 \] quad \( 1 lt.eq j lt.eq J \) .
   $ <weights:short-support>]

Indeed $F_j - F_(j - 1)$ vanishes when $1 - u lt.eq delta_j \/ 4$ or $1 - u gt.eq delta_j$.
  The terminal weight is supported in $u gt.eq 1 - delta_J \/ 2$.

#thm([Lemma 4.2.])[
  (Fixed-order weight bounds).  #emph[Fix an integer $r gt.eq 0$, and then take $k_0 gt.eq r + 2$.
    For $a \, b gt.eq 0$, $a + b lt.eq r$, uniformly in (4.1), $x in cal(K)$, and the indicated arguments, one has
#[#set math.equation(numbering: n => "(4.11)")
 $ \| partial_u^a partial_x^b w_(j \, x) \( u \) \| & lt.eq
   C_r \( k \/ delta_j \)^r delta_j^k &  & \( 1 lt.eq j lt.eq J \, med u in bb(R) \) \,\
\| partial_u^a partial_x^b w_(0 \, x) \( u \) \| & lt.eq C_r k^r &  & \( u gt.eq - log 2 \/ ell \) .
  $ <weights:short-derivatives>]

 There is also $c > 0$, independent of $r \, k \, X$, such that, with $delta = delta_J$ and $n = e^(ell u) > 0$,
#[#set math.equation(numbering: n => "(4.12)")
 $ \| partial_u^a partial_x^b w_(* \, x) \( u \) \| lt.eq C_r \( k \/ delta \)^r delta^k e^(- c n \/ X) .
   $ <weights:terminal-derivatives>]

 Changing the fixed compact neighborhood of $cal(K)$ changes only the constants.]
] <weights:derivatives>

#proof[
  It is convenient first to differentiate using $D_x = x partial_x$. For
  $ h = 1 - u + ell^(- 1) log \( C_F \| x \| v \) $
  and $a + b lt.eq r$, differentiation under the integral gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ partial_u^a D_x^b h_(+)^k = \( - 1 \)^a ell^(- b) \( k \)_(a + b) h_(+)^(k - a - b) \,
     $ <weights:power-derivative>]
  where $\( k \)_t = k \( k - 1 \) dots.h.c \( k - t + 1 \)$.
    The choice $k gt.eq r + 2$ ensures enough continuous derivatives at $h = 0$;
    domination for differentiating follows from the estimates below.
    Ordinary $x$-derivatives are fixed linear combinations of $x^(- b) D_x^i$, $i lt.eq b$,
    and therefore satisfy the same bounds on our compact set.
  Suppose $1 - u lt.eq delta'$, where $delta' > 0$. For $0 lt.eq t lt.eq r$, write $m = k - t > 0$ and $a_t =
    m \/ \( ell delta' \)$. The elementary inequality $\( 1 + q \)_(+)^m lt.eq e^(m q)$, valid for every real $q$, gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ h_(+)^m lt.eq \( delta' \)^m \( C_F \| x \| v \)^(a_t) . $ <weights:gamma-majorant>]
  If $delta' = delta_j$, then $0 < a_t lt.eq ell^(- 3 \/ 10)$ by (4.7), so
  $ integral_0^oo e^(- v) \( C_F \| x \| v \)^(a_t) thin d v = \( C_F \| x \| \)^(a_t) Gamma \( 1 + a_t \) lt.eq C . $
  The bound is uniform once $X$ is large enough that $a_t lt.eq 1$.
    Thus, on $1 - u lt.eq delta_j$, a derivative of $W_(k \, x)$ involving at most $r$ differentiations is bounded
    by a constant times $k^r delta_j^(k - r)$. The cutoff derivatives of order $q$ cost $O_r \( delta_j^(- q) \)$.
    More precisely, each Leibniz term with $t$ derivatives hitting $W$ and $q$ hitting a cutoff has $t + q lt.eq
    r$, and is at most
  $ C_r k^t delta_j^(k - t - q) lt.eq C_r \( k \/ delta_j \)^r delta_j^k . $
  This proves (4.11).
  For $u gt.eq - log 2 \/ ell$, use instead $delta' = 1 + log 2 \/ ell$.
    Now $\( delta' \)^k lt.eq exp \( k log 2 \/ ell \) lt.eq 2$ for large $X$, and $a_t lt.eq k \/ ell lt.eq
    ell^(- 2 \/ 5)$. The same argument and the fixed derivative bounds for $F_0$ prove (4.11).
  On the support of the terminal cutoff, or any nonzero derivative of it, $1 - u lt.eq delta_J \/ 2 lt.eq
    delta_J$. Moreover $h > 0$ implies
  $ v > frac(n, C_F \| x \| X) . $
  Retain half the exponential in the integral. Uniformly on our compact set,
  #[#set math.equation(numbering: n => "(4.15)")
   $ integral_({ h > 0 }) e^(- v) \( C_F \| x \| v \)^(a_t) thin d v & lt.eq
     e^(- n \/ \( 2 C_F \| x \| X \)) \( C_F \| x \| \)^(a_t) integral_0^oo e^(- v \/ 2) v^(a_t) thin d v\
 & = e^(- n \/ \( 2 C_F \| x \| X \)) \( C_F \| x \| \)^(a_t) 2^(1 + a_t) Gamma \( 1 + a_t \) lt.eq
   C e^(- c n \/ X) . $ <weights:retained-exponential>]
  Here $a_t = \( k - t \) \/ \( ell delta_J \) lt.eq ell^(- 3 \/ 10)$,
    so $2^(1 + a_t) Gamma \( 1 + a_t \)$ is bounded independently of $k$.
    The same Leibniz calculation now proves (4.12). All integrands used for differentiation are dominated on
    compact sets by the displayed integrable majorants, which also justifies (4.13) under the integral. ◻
]

#thm([Corollary 4.3.])[
  (Comparison interface).  #emph[For every fixed derivative order $r$,
    the short weights satisfy the smoothness assumptions of Proposition 12 with derivative bounds $ell^(C_r)$,
    uniformly in $j \, k \, X$. They have length $X^(1 - Delta_j)$, with
$ Delta_j = delta_j \/ 4 \, wide 1 / 4 ell^(- 1 \/ 10) lt.eq Delta_j lt.eq 1 / 4 . $

 The deterministic term
#[#set math.equation(numbering: n => "(4.16)")
 $ s = k \/ ell \, wide A_x = \( C_F \| x \| \)^s Gamma \( 1 + s \) $ <weights:Ax>]

 has uniformly bounded derivatives of each fixed order on $cal(K)$,
   and is bounded above and below by positive constants. The endpoint enlargement at $n =
   1$ can be made inside the fixed range $n gt.eq 1 \/ 2$.]
] <weights:comparison-interface>

#proof[
  The bounds $k lt.eq ell^(3 \/ 5)$ and $delta_j^(- 1) lt.eq ell^(1 \/ 10)$ make (4.11) polynomial in $ell$.
    Choose a fixed smooth function $chi$ equal to zero on $\( - oo \, - log 2 \]$ and equal to one on
    $\[ 0 \, oo \)$. For the comparison alone, replace $w_(0 \, x) \( u \)$ on the real line by
  $ tilde(w)_(0 \, x) \( u \) = chi \( ell u \) w_(0 \, x) \( u \) . $
  It agrees with the original weight at every positive integer $n = e^(ell u)$,
    and its extra derivatives cost only fixed powers of $ell$, by (4.11).
    Its left support is $u gt.eq - log 2 \/ ell$, exactly the enlargement $n gt.eq 1 \/ 2$.
    For $j gt.eq 1$, the weights already vanish on a neighborhood of $u lt.eq 0$.
    After a fixed smooth dyadic localization $n = N y$, the operator $y partial_y$ acts as $ell^(- 1) partial_u$,
    so the same bounds give all the required seminorms in the scaled variables.
    The endpoint extension has therefore taken place in $log n$; no extension to a fixed negative value of $u$ is used.
  Finally $0 < s lt.eq ell^(- 2 \/ 5)$, while $C_F \| x \|$ lies in a fixed positive compact interval.
    The formula for $A_x$, its derivatives in $x$, and the continuity and positivity of $Gamma \( 1 + s \)$ give
    the assertions concerning $A_x$. ◻
]

=== 4.3 The terminal mean square <the-terminal-mean-square>

We use the following consequence of Proposition 7. For general $X$,
  cover $\[ X \, 2 X \)$ by at most two dyadic blocks whose heights are comparable to $X$;
  the normalization and polynomial factors in that proposition then change by fixed constants only.
  For any fixed smooth compactly supported function $G$ on $\( 0 \, oo \)$, there are fixed exponents $A \, B$ such that

#[#set math.equation(numbering: n => "(4.17)")
 $ 1 / X sum_(d med upright("admissible")\
X lt.eq \| d \| < 2 X)
  lr(|sum_(n gt.eq 1) frac(lambda \( n \) chi_d \( n \), sqrt(n)) thin n^(- i t) G \( n \/ N \)|)^2 lt.double_G
  ell^B \( 1 + \| t \| \)^A \( 1 + N \/ X \)^A . $ <weights:moment-interface>]

Its applicability includes the fixed enlarging bump used below.

#thm([Proposition 4.4.])[
  (Terminal mean square).  #emph[There is a fixed exponent $C_T$, chosen before $k_0$, such that uniformly in (4.1),
#[#set math.equation(numbering: n => "(4.18)")
 $ 1 / X sum_(d med upright("admissible")\
X lt.eq \| d \| < 2 X) \| S_(* \, chi_d) \( d \/ X \) \|^2 lt.double ell^(C_T) delta_J^(2 k) .
  $ <weights:terminal-square>]

 The same estimate holds after restricting the summation to either value of $chi_d \( 2 \)$.]
] <weights:terminal>

#proof[
  Choose a smooth dyadic partition with a fixed $rho in C_c^oo \( \( 1 \/ 2 \, 2 \) \)$ satisfying
  $ sum_(N in { 1 \, 2 \, 4 \, dots.h }) rho \( n \/ N \) = 1 wide \( n gt.eq 1 \) . $
  For example one may start with a smooth nonincreasing function equal to one on $\( 0 \, 1 \]$ and zero on
    $\[ 2 \, oo \)$, and take its difference at arguments $y$ and $2 y$;
    choosing its transition strictly inside $\( 1 \, 2 \)$ gives the asserted compact support.
    Fix also $G in C_c^oo \( \( 0 \, oo \) \)$ equal to one on $"supp" rho$. Put
  $ T_N \( y \, x \) = rho \( y \) w_(* \, x) \( ell^(- 1) log \( N y \) \) \, wide hat(T)_N \( t \, x \) =
    integral_0^oo T_N \( y \, x \) y^(i t) frac(d y, y) . $
  Select once and for all integers $r > A \/ 2 + 2$ and $D > A \/ 2 + 2$, and then choose $k_0 gt.eq r + 2$.
    If derivatives required elsewhere are of higher order, increase this fixed $r$ first.
    By Lemma 14, differentiation on the $y$-scale through order $r$ gives
  $ lr(|\( y partial_y \)^a T_N \( y \, x \)|) lt.double_r ell^(C_r) delta_J^k e^(- c' N \/ X)
    wide \( 0 lt.eq a lt.eq r \) \, $
  uniformly in $x in cal(K)$. There is no boundary term when integrating by parts in $log y$. Consequently,
  #[#set math.equation(numbering: n => "(4.19)")
   $ sup_(x in cal(K)) \| hat(T)_N \( t \, x \) \| lt.double_(r \, D) ell^(C_r)
     delta_J^k \( 1 + N \/ X \)^(- D) \( 1 + \| t \| \)^(- r) . $ <weights:terminal-kernel>]
  In passing from the exponential to $\( 1 + N \/ X \)^(- D)$, the constant depends on the fixed $D$, not on $k$.
  Mellin inversion now expresses the $N$-piece of the terminal sum as
  $ frac(1, 2 pi) integral_(bb(R)) hat(T)_N \( t \, d \/ X \) N^(i t) P_d \( N \, t \) thin d t \, wide
    P_d \( N \, t \) = sum_(n gt.eq 1) frac(lambda \( n \) chi_d \( n \), sqrt(n)) thin n^(- i t) G \( n \/ N \) . $
  Indeed $G \( n \/ N \) T_N \( n \/ N \, x \) = T_N \( n \/ N \, x \)$. Define the normalized family norm by
  $ parallel B_d parallel_(2 \, X) = (1 / X sum_(d med upright("admissible")\
X lt.eq \| d \| < 2 X) \| B_d \|^2)^(1 \/ 2) . $
  We bound the kernel uniformly before applying the family moment. For each fixed $t$,
  $ parallel hat(T)_N \( t \, d \/ X \) P_d \( N \, t \) parallel_(2 \, X) lt.eq
    sup_(x in cal(K)) \| hat(T)_N \( t \, x \) \| parallel P_d \( N \, t \) parallel_(2 \, X) . $
  Minkowski’s inequality, followed by (4.17) and (4.19), therefore yields
  $ parallel S_(* \, chi_d) \( d \/ X \) parallel_(2 \, X) & lt.double ell^(C_r + B \/ 2) delta_J^k
    sum_(N = 1 \, 2 \, 4 \, dots.h) \( 1 + N \/ X \)^(- D + A \/ 2)
    integral_(bb(R)) \( 1 + \| t \| \)^(- r + A \/ 2) thin d t\
 & lt.double ell^(C_r + B \/ 2 + 1) delta_J^k . $
  The integral converges by the fixed choice of $r$. There are $O \( ell \)$ dyadic terms with $N lt.eq X$,
    and those with $N > X$ form a convergent geometric tail by the choice of $D$.
    All sums and integrals can first be truncated; the displayed integrable majorants justify passage to the
    limit. Squaring proves (4.18), for example with $C_T = 2 C_r + B + 2$.
    This exponent depends only on choices made before $k_0$. Restricting the family can only decrease the
    nonnegative sum. ◻
]

#thm([Lemma 4.5.])[
  (Uniform absorption of the terminal loss).  #emph[After increasing the fixed $k_0$,
    one sufficiently large lower bound on $X$ makes
#[#set math.equation(numbering: n => "(4.20)")
 $ 1 / X sum_(d med upright("admissible")\
X lt.eq \| d \| < 2 X) \| S_(* \, chi_d) \( d \/ X \) \|^2 lt.double 2^(- 3 J k \/ 2) $ <weights:terminal-small-square>]

 simultaneously for all $k$ in (4.1). Moreover, for any fixed $c \, L > 0$, the comparison errors obey
#[#set math.equation(numbering: n => "(4.21)")
 $ e^(- c Delta_j ell) lt.eq k^(- L) 2^(- L j k) wide \( 0 lt.eq j lt.eq J \) $ <weights:comparison-absorption>]

 for one sufficiently large lower bound on $X$.]
] <weights:terminal-small>

#proof[
  The ratio of the right side of (4.18) to $2^(- 3 J k \/ 2)$, apart from its fixed implied constant, is
  $ ell^(C_T) 2^(- J k \/ 2) . $
  For $J gt.eq 1$ this decreases with $k$, so throughout the permitted range it is at most its value at the fixed
    integer $k_0$. The floor in the definition of $J$ gives
  $ ell^(C_T) 2^(- J k \/ 2) lt.eq ell^(C_T) 2^(- J k_0 \/ 2) lt.eq 2^(k_0 \/ 2) ell^(C_T - k_0 \/ 20) . $
  Choose $k_0 > 20 C_T$ after $C_T$ is fixed. The last expression then tends to zero with $X$.
    In particular the choice of a single $X$-threshold works for the entire $k$-range.
  For the second assertion, $Delta_j ell gt.eq ell^(9 \/ 10) \/ 4$, whereas uniformly in the same range
  $ L log k + L j k log 2 = O_L \( ell^(3 \/ 5) log ell \) = o \( ell^(9 \/ 10) \) . $
  Taking logarithms proves (4.21). ◻
]

== 5 Block mollifiers and independent-model mean squares <sec:model>

We seek polynomial multipliers that make the first short piece close to the positive quantity $A_x$ from (4.16),
  while keeping the later pieces small. The construction has two separate tasks:
  control the multipliers on most integers, and prove mean-square bounds on the entire independent model.
  Their combination will allow the first piece to dominate the weighted-series identity.

Fix a member $F$ of the finite family $cal(F)$ and a value $c in { - 1 \, 1 }$ at the prime $2$,
  and write $lambda = lambda_F$ and $xi_p = xi_(F \, p)$. The constants in this section are uniform in these two
  choices. We use the integer characters $z_m$ and the independent variables $Z$ defined above; in particular,
  at an odd prime

$ bb(P) \( Z \( p \) = 0 \) = p^(- 1) \, wide bb(P) \( Z \( p \) = 1 \) =
  bb(P) \( Z \( p \) = - 1 \) = \( 1 - p^(- 1) \) \/ 2 \, wide Z \( 2 \) = c . $

All model norms below are norms on this entire probability space. We use the parameters and weights of Section 4:

$ ell = log X \, wide k_0 lt.eq k lt.eq ell^(3 \/ 5) \, wide J = ⌊frac(log ell, 10 log 2)⌋ \, wide delta_j =
  2^(- j) \, wide s = k \/ ell . $

Here $k$ is an integer. We always take $X$ sufficiently large that $J gt.eq 1$ and $0 < s lt.eq 1$.
  The scaled variable $x$ ranges over a fixed compact subset $cal(X)$ of $bb(R) \\ {
  0 }$ containing the support of the averaging weight. Constants may depend on this compact set,
  the fixed cutoff $f_(*)$, and $cal(F)$.

The shift $s$ comes from the weight of the first piece. Replacing the truncated power in (4.2) by its exponential
  reference gives the exact integral

$ integral_0^oo e^(- v) exp #scale(x: 120%, y: 120%)[\(] - k u +
  s log \( C_F \| x \| v \) #scale(x: 120%, y: 120%)[\)] thin d v = A_x e^(- k u) . $

At $u = log n \/ ell$, the reference weight is therefore $A_x n^(- s)$.
  This suggests a multiplier approximating the inverse Euler product at the real shift $s$.
  Lemma 25 and the final Fourier argument will quantify the replacement in the required norm;
  the reference calculation alone does not replace the weighted series.

=== 5.1 Elementary prime estimates and local factors <elementary-prime-estimates-and-local-factors>

We shall repeatedly use the elementary estimate $pi \( y \) lt.double y \/ log \( 2 y \)$. One proof starts with

$ sum_(n < p lt.eq 2 n) log p lt.eq log binom(2 n, n) lt.eq 2 n log 2 . $

Summing on dyadic intervals gives $sum_(p lt.eq y) log p lt.double y$; separating $p lt.eq
  sqrt(y)$ then proves the asserted estimate for $pi \( y \)$.
  Partial summation gives the following consequences, with absolute constants:

#[#set math.equation(numbering: n => "(5.1)")
 $ sum_(p lt.eq y) 1 / p & lt.double 1 + log log \( 3 y \) \,\
sum_(a < p lt.eq b) 1 / p & lt.double 1 + log frac(log b, log a) quad \( 2 lt.eq a lt.eq b \) \,\
sum_(p > Y) p^(- 1 - 2 a) & lt.double integral_(2 a log Y)^oo e^(- v) / v thin d v lt.double 1 +
  log^(+) frac(1, a log Y) wide \( 0 < a lt.eq 1 \, med Y gt.eq 2 \) . $ <model:prime-mass>]

Here $log^(+) t = max \( 0 \, log t \)$. If $a log Y gt.eq 1 \/ 2$, we also have

$ integral_(2 a log Y)^oo e^(- v) / v thin d v lt.double frac(e^(- 2 a log Y), a log Y) . $

For clarity, the first bound in (5.1) follows by integrating $t^(- 1 - 2 a)$ against $d pi \( t \)$,
  discarding the nonpositive boundary term at $Y$, and using $1 + 2 a lt.eq 3$.
  We also need, for $0 < a lt.eq 1$ and $h gt.eq a$,

#[#set math.equation(numbering: n => "(5.2)")
 $ sum_p frac(min \( 1 \, h log p \), p) p^(- 2 a) lt.double 1 + log \( 1 + h \/ a \) . $ <model:prime-transition>]

Here is a direct verification. If $h lt.eq 1$, primes with $log p lt.eq 1 \/ h$ contribute at most

$ h sum_(p lt.eq e^(1 \/ h)) frac(log p, p) lt.double 1 . $

Between $1 \/ h$ and $1 \/ a$ the reciprocal-prime mass is $O \( 1 + log \( h \/ a \) \)$ by (5.1);
  primes beyond $e^(1 \/ a)$ contribute $O \( 1 \)$ by (5.1). Empty ranges are omitted.
  If $h > 1$, discard the minimum and use the same estimates to obtain $O \( 1 + log \( 1 \/ a \) \)$,
  which is bounded by the right side of (5.2).

For any real character value $V \( p \) in { - 1 \, 0 \, 1 }$ define

#[#set math.equation(numbering: n => "(5.3)")
 $ D_p \( b \, V \) = 1 - lambda \( p \) V \( p \) p^(- 1 \/ 2 - b) + xi_p V \( p \)^2 p^(- 1 - 2 b) \, wide
   Re b gt.eq 0 . $ <model:inverse-local>]

The local parameter bound gives a factorization $D_p \( b \, V \) =
  product_(nu = 1)^2 \( 1 - alpha_(p \, nu) V \( p \) p^(- 1 \/ 2 - b) \)$, where $\| alpha_(p \, nu) \| lt.eq
  1$ and zero parameters are permitted. Consequently

#[#set math.equation(numbering: n => "(5.4)")
 $ \( 1 - p^(- 1 \/ 2) \)^2 lt.eq \| D_p \( b \, V \) \| lt.eq \( 1 + p^(- 1 \/ 2) \)^2 . $ <model:local-bounds>]

For real $b gt.eq 0$, the value of $D_p \( b \, V \)$ is positive:
  at a good prime its two factors are complex conjugates (or both positive real),
  and at a bad prime its nontrivial factor is positive. These facts apply equally to $V = Z$ and $V = z_m$.

=== 5.2 Construction, length, and the simultaneous product event <construction-length-and-the-simultaneous-product-event>

Radziwiłł and Soundararajan use disjoint prime blocks, truncated exponential polynomials,
  and relative truncation estimates in their study of central values of quadratic twists
  #cite(label("RadziwillSoundararajan2015")) Sections 3, 8, and 9.
  Here we truncate products of inverse local Euler factors by total degree and estimate shifted norms over the
  full integer model defined in Section 2.

Put

$ Y_j = X^(delta_j^2 \/ sqrt(k)) \, wide P_j^(upright("eu")) \( V \) =
  product_(p lt.eq Y_j) D_p \( s \, V \)^(- 1) quad \( 0 lt.eq j lt.eq J \) . $

Since $s log Y_0 = sqrt(k)$, the prime-tail estimate (5.1) makes $sum_(p > Y_0)
  p^(- 1 - 2 s)$ exponentially small. This sum will control the residual Euler product in mean square.
  For the later pieces, the available multiplier length decreases as their lengths approach $X$.
  The smaller cutoffs $Y_j$ will keep the truncated products within the comparison allowance
  $X^(eta delta_j \/ 4)$. In the estimates for these later pieces,
  the weight factor $delta_j^k$ will absorb fixed polynomial losses in $k$ and $2^j$.
  In the stated range $log Y_J gt.eq ell^(1 \/ 2)$, so every $Y_j$ exceeds $2$ for a single sufficiently large $X$
  threshold. For $i gt.eq 0$ let

$ I_(j i) = { p : Y_j^(2^(- i - 1)) < p lt.eq Y_j^(2^(- i)) } \, wide m_(j i) = ceil.l k^(1 \/ 4) + j + i ceil.r . $

We omit empty blocks. They form a disjoint partition of the primes at most $Y_j$, and (5.1) gives

#[#set math.equation(numbering: n => "(5.5)")
 $ sum_(p in I_(j i)) p^(- 1) lt.eq C $ <model:block-mass>]

uniformly in $j \, i \, k \, X$. Indeed, when the lower endpoint is at least $2$,
  the ratio of the logarithms of the endpoints is $2$; otherwise a nonempty block has upper endpoint less than $4$. Set

#[#set math.equation(numbering: n => "(5.6)")
 $ K_(j i) \( V \, z \) & =
   product_(p in I_(j i)) (1 - lambda \( p \) V \( p \) p^(- 1 \/ 2 - s) z + xi_p V \( p \)^2 p^(- 1 - 2 s) z^2) \,\
T_(j i) \( V \) & = sum_(b = 0)^(m_(j i)) \[ z^b \] K_(j i) \( V \, z \) \, & H_j \( V \) & =
  product_i T_(j i) \( V \) . $ <model:mollifier-definition>]

The coefficient extraction in this definition is followed by evaluation at $z = 1$.

#thm([Lemma 5.1.])[
  (Length and coefficients).  #emph[The polynomial $H_j$ has an expansion
$ H_j \( V \) = sum_(r lt.eq R_j) h_j \( r \) V \( r \) \, wide \| h_j \( r \) \| lt.eq
  tau \( r \) r^(- 1 \/ 2) \, wide sum_r \| h_j \( r \) \| lt.double R_j^2 \, $

 where, for a fixed constant $C_(upright("len")) > 0$, one may take
#[#set math.equation(numbering: n => "(5.7)")
 $ R_j = exp (C_(upright("len")) \( k^(1 \/ 4) + j + 1 \) ell delta_j^2 \/ sqrt(k)) . $ <model:length-bound>]

 For every fixed $eta > 0$, a sufficiently large fixed $k_0$ ensures $R_j lt.eq
   X^(eta delta_j \/ 4)$ for all $0 lt.eq j lt.eq J$ and all $k$ in the stated range.
   Thus $H_j$ satisfies the multiplier hypotheses of Proposition 12, with $Delta = delta_j \/ 4$.]
] <model:mollifier-length>

#proof[
  In a block, a chosen monomial has prime exponents $e_p in { 0 \, 1 \, 2 }$ whose sum is at most $m_(j i)$.
    Its integer index is therefore at most $exp \( m_(j i) 2^(- i) log Y_j \)$. Since
  $ sum_(i gt.eq 0) m_(j i) 2^(- i) lt.eq sum_(i gt.eq 0) \( k^(1 \/ 4) + j + i + 1 \) 2^(- i) = 2 k^(1 \/ 4) +
    2 j + 4 \, $
  we obtain (5.7). Unique factorization shows that each index occurs in exactly one prime-exponent pattern.
    The truncations only delete patterns. A surviving coefficient is a product of local coefficients $1$, $-
    lambda \( p \) p^(- 1 \/ 2 - s)$, or $xi_p p^(- 1 - 2 s)$,
    and hence is bounded by $tau \( r \) r^(- 1 \/ 2 - s) lt.eq tau \( r \) r^(- 1 \/ 2)$. For example,
  $ sum_(r lt.eq R) tau \( r \) r^(- 1 \/ 2) = sum_(a b lt.eq R) \( a b \)^(- 1 \/ 2) lt.eq
    2 sqrt(R) sum_(a lt.eq R) 1 / a lt.double sqrt(R) log \( 2 R \) lt.double R^2 wide \( R gt.eq 1 \) . $
  Finally,
  $ frac(log R_j, ell delta_j \/ 4) lt.eq 4 C_(upright("len")) #scale(x: 120%, y: 120%)[\(]
    k^(- 1 \/ 4) + \( j + 1 \) 2^(- j) k^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
    8 C_(upright("len")) k^(- 1 \/ 4) . $
  Here $\( j + 1 \) 2^(- j) lt.eq 1$. Thus the fixed choice $k_0
    gt.eq \( 8 C_(upright("len")) \/ eta \)^4$ suffices simultaneously for all $j$.
    The coefficient estimate and this length bound verify both multiplier conditions of Proposition 12. ◻
]

#thm([Lemma 5.2.])[
  (Prime-sum moments for the integer model).  #emph[Let $cal(I)$ be any set of primes at most $Y_0$, and put
$ B_(cal(I)) \( V \) = sum_(p in cal(I)) lambda \( p \) V \( p \) p^(- 1 \/ 2 - s) . $

 If $k_0$ is a sufficiently large absolute constant, then
#[#set math.equation(numbering: n => "(5.8)")
 $ 1 / X sum_(X lt.eq \| m \| < 2 X) \| B_(cal(I)) \( z_m \) \|^64 lt.double (1 + sum_(p in cal(I)) 1 / p)^32
   $ <model:64th-moment>]

 uniformly in $cal(I) \, k \, X$.]
] <model:integer-moments>

#proof[
  First omit the deterministic prime $2$ and write $a_p = lambda \( p \) p^(- 1 \/ 2 - s)$.
    On expanding the model moment, any odd prime that occurs just once has zero expectation.
    Group the remaining terms by their partition of the $64$ positions into $q lt.eq
    32$ parts of sizes at least two. Since $\| a_p \| lt.eq 2$, for every part of size $r gt.eq
    2$ we have $\| a_p \|^r lt.eq 2^(r - 2) \| a_p \|^2$. Summing the distinct-prime choices and then discarding
    distinctness bounds the moment by
  $ C sum_(q = 1)^32 (sum_(p in cal(I)) \| a_p \|^2)^q lt.double (1 + sum_(p in cal(I)) 1 / p)^32 . $
  Restoring the prime $2$ changes only the constant, by $\| u + v \|^64 lt.eq
    2^63 \( \| u \|^64 + \| v \|^64 \)$ and $\| a_2 c \| lt.eq sqrt(2)$.
  For completeness the passage to integers needs no estimate for primes in progressions.
    For each ordered $64$-tuple of primes, the product of its character values is periodic modulo the product of
    its odd primes, which is at most $Y_0^64$. Its absolute value is at most one.
    The arithmetic mean over the two integer intervals $X lt.eq \| m \| < 2
    X$ differs from its complete-residue mean by $O \( Y_0^64 \/ X \)$.
    The complete-residue mean is exactly the independent-model mean,
    by the Chinese remainder theorem and the counts of $0 \, 1 \, - 1$ for the Legendre symbol.
    There are at most $Y_0^64$ tuples and each coefficient has absolute value at most $2^64$.
    Thus the discrepancy between that arithmetic mean and the model moment is
  $ O \( Y_0^128 \/ X \) = O \( X^(- 1 + 128 \/ sqrt(k)) \) = O \( X^(- 1 \/ 2) \) $
  after requiring $sqrt(k_0) gt.eq 256$. Since the number of integers in these intervals is $O \( X \)$,
    this proves (5.8) with its normalization by $X$. If endpoints are not integers,
    the same period-counting argument changes only its absolute constant. ◻
]

#thm([Proposition 5.3.])[
  (Simultaneous product event).  #emph[Except for $O \( X k^(- 2) \)$ integers in $X lt.eq \| m \| < 2 X$,
    the following inequalities hold simultaneously:
#[#set math.equation(numbering: n => "(5.9)")
 $ 1 / 2 lt.eq H_j \( z_m \) P_j^(upright("eu")) \( z_m \) & lt.eq 2 &  & \( 0 lt.eq j lt.eq J \) \,\
frac(P_0^(upright("eu")) \( z_m \), P_j^(upright("eu")) \( z_m \)) & gt.eq
  2^(- j k \/ 8) &  & \( 1 lt.eq j lt.eq J \) \,\
P_0^(upright("eu")) \( z_m \) & gt.eq 2^(- J k \/ 8) . $ <model:good-mollifier>]

 The implied constant and the lower threshold $k_0$ do not depend on $k \, j \, X$.]
] <model:good-event>

#proof[
  For a block $I = I_(j i)$ write $B = B_I \( z_m \)$. The elementary expansion $log \( 1 + w \) = w +
    O \( \| w \|^2 \)$ at all sufficiently large primes, together with (5.5), gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ sup_(\| z \| = 2) \| K_(j i) \( z_m \, z \) \| lt.eq e^(2 \| B \| + C) \, wide K_(j i) \( z_m \, 1 \) gt.eq
     e^(- \| B \| - C) . $ <model:pointwise-block>]
  The finitely many smaller primes are included using (5.4) at $z =
    1$ and the direct upper bound $product_nu \( 1 + 2 p^(- 1 \/ 2) \)$ on $\| z \| = 2$;
    they change $C$ by an absolute amount. Thus no nonvanishing assertion on the radius-two circle is required.
    Cauchy’s coefficient estimate now gives, with $m = m_(j i)$,
  $ frac(\| T_(j i) \( z_m \) - K_(j i) \( z_m \, 1 \) \|, K_(j i) \( z_m \, 1 \)) lt.eq C 2^(- m) e^(3 \| B \|) . $
  If every block satisfies $\| B_(I_(j i)) \( z_m \) \| lt.eq m_(j i) \/ 100$,
    the last quantity is at most $C e^(- c m_(j i))$ for a fixed $c > 0$.
    The sum over $i$ is $O \( e^(- c \( k^(1 \/ 4) + j \)) \)$.
    By enlarging $k_0$, the product over blocks of the ratios $T_(j i) \( z_m \) \/
    K_(j i) \( z_m \, 1 \)$ lies between $1 \/ 2$ and $2$. Since $product_i
    K_(j i) \( z_m \, 1 \) = \( P_j^(upright("eu")) \( z_m \) \)^(- 1)$, this proves (5.9) on the specified event.
    The number excluded, divided by $X$, is at most
  $ C sum_(j = 0)^J sum_(i gt.eq 0) \( k^(1 \/ 4) + j + i \)^(- 64) lt.double \( k^(1 \/ 4) \)^(- 62) =
    k^(- 31 \/ 2) lt.double k^(- 2) \, $
  by Lemma 19 and (5.5). The sum may be extended to all $i$ because only nonempty blocks impose an event.
  The real logarithm is available by positivity, and the same local expansion,
    including the finitely many small primes separately, gives for every prime set $cal(I)$
  #[#set math.equation(numbering: n => "(5.11)")
   $ log product_(p in cal(I)) D_p \( s \, z_m \)^(- 1) = B_(cal(I)) \( z_m \) +
     O (sum_(p in cal(I)) p^(- 1)) . $ <model:log-product>]
  For $Y_j < p lt.eq Y_0$, (5.1) bounds this reciprocal mass by $C \( 1 + j \)$, since $log Y_0 \/ log Y_j = 4^j$.
    For $p lt.eq Y_0$ it is at most $C \( 1 + J \)$: indeed $log log Y_0 lt.eq log ell$,
    and $log ell < 10 \( J + 1 \) log 2$. Require that the corresponding prime sums have absolute values at most
    $\( log 2 \) j k \/ 16$ and $\( log 2 \) J k \/ 16$, respectively.
    Once $k_0$ dominates the fixed drift constants in (5.11), these requirements imply (5.9) and (5.9).
    Their total exceptional proportion is at most
  $ C sum_(j = 1)^J frac(\( 1 + j \)^32, \( j k \)^64) + C frac(\( 1 + J \)^32, \( J k \)^64) lt.double k^(- 64) . $
  Combining the exceptional sets proves the proposition. ◻
]

=== 5.3 Euler-product norms on the full model <euler-product-norms-on-the-full-model>

The preceding proposition controls the multipliers on most integers.
  We now prove the model norms needed for arithmetic comparison, including the contribution of every event.
  We first estimate exact Euler products, and then replace each complete block by its degree truncation with a
  summable relative error.

To avoid any limiting interchange, fix for now a finite real cutoff $Q gt.eq Y_0$ and put

#[#set math.equation(numbering: n => "(5.12)")
 $ cal(L)_Q \( b \) = product_(p lt.eq Q) D_p \( b \, Z \)^(- 1) \, wide Re b > 0 . $ <model:finite-Euler>]

All bounds in this subsection are independent of $Q$. At fixed $Q$ the product has the absolutely convergent expansion

#[#set math.equation(numbering: n => "(5.13)")
 $ cal(L)_Q \( b \) = sum_(n gt.eq 1\
p divides n arrow.r.double p lt.eq Q) lambda \( n \) Z \( n \) n^(- 1 \/ 2 - b) . $ <model:finite-expansion>]

Absolute convergence follows by multiplying the finitely many local geometric series;
  their absolute sums are bounded by $product_(p lt.eq Q) \( 1 - p^(- 1 \/ 2 - Re b) \)^(- 2)$.

#thm([Lemma 5.4.])[
  (Exact shifted products).  #emph[Let $0 < s \, alpha lt.eq 1$, $b = alpha + i t$, and $Y_j gt.eq 2$.
    If $h = alpha + s + \| t \|$ and $a = min \( alpha \, s \)$, then
#[#set math.equation(numbering: n => "(5.14)")
 $ parallel \( P_j^(upright("eu")) \)^(- 1) cal(L)_Q \( b \) parallel_2 lt.double \( 1 + h \/ a \)^C
   (1 + frac(1, alpha log Y_j))^C . $ <model:general-exact-norm>]

 At the real point $b = s$, with $j = 0$ and the parameters of this section,
#[#set math.equation(numbering: n => "(5.15)")
 $ parallel \( P_0^(upright("eu")) \)^(- 1) cal(L)_Q \( s \) - 1 parallel_2^2 lt.double e^(- 2 sqrt(k)) /
   sqrt(k) . $ <model:exact-distance>]

]
] <model:exact-shifts>

#proof[
  We first give the local cancellation with its dependence on $b$.
    Write $r = p^(- 1 \/ 2)$, $u = p^(- s)$, $v = p^(- b)$, and $M = min \( 1 \, h log p \)$.
    The mean-value formula for the exponential and the trivial bound imply
  #[#set math.equation(numbering: n => "(5.16)")
   $ \| u - v \| lt.double M \( u + \| v \| \) . $ <model:local-difference>]
  By (5.4), uniformly for every prime,
  $ D_p \( b \, Z \)^(- 1) - 1 = O \( r \| v \| \) . $
  Subtract the two inverse polynomials and use this last estimate to obtain
  #[#set math.equation(numbering: n => "(5.17)")
   $ frac(D_p \( s \, Z \), D_p \( b \, Z \)) = 1 + lambda \( p \) Z \( p \) r \( v - u \) +
     O #scale(x: 120%, y: 120%)[\(] r^2 \| v - u \| \( u + \| v \| \) #scale(x: 120%, y: 120%)[\)] .
     $ <model:local-ratio-expansion>]
  For odd $p$, the displayed linear term has expectation zero.
    Expanding the squared absolute value, and using $M^2 lt.eq M$ and $\( u + \| v \| \)^2 lt.eq
    2 \( u^2 + \| v \|^2 \)$, therefore gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ bb(E) lr(|frac(D_p \( s \, Z \), D_p \( b \, Z \))|)^2 lt.eq exp {C /
     p min \( 1 \, h log p \) \( p^(- 2 s) + p^(- 2 alpha) \)} . $ <model:local-shift-cost>]
  The constants in the error in (5.17) are uniform even at the small primes,
    because $\( 1 - 2^(- 1 \/ 2) \)^2$ is a common positive lower bound for the denominator.
    At the deterministic prime $2$ the local ratio has a fixed upper bound by (5.4).
  For odd primes outside the mollifier, the expansion
  $ D_p \( b \, Z \)^(- 1) = 1 + lambda \( p \) Z \( p \) p^(- 1 \/ 2 - b) + O \( p^(- 1 - 2 alpha) \) $
  and centering give
  #[#set math.equation(numbering: n => "(5.19)")
   $ bb(E) \| D_p \( b \, Z \)^(- 1) \|^2 lt.eq exp \( C p^(- 1 - 2 alpha) \) . $ <model:unmatched-local-cost>]
  Independence multiplies the local second moments exactly.
    Sum (5.18) by (5.2), using both $a = s$ and $a = alpha$ there, and sum (5.19) by (5.1).
    Taking a square root proves (5.14).
  For the distance estimate there is exact cancellation below $Y_0$. Set
  $ U = \( P_0^(upright("eu")) \)^(- 1) cal(L)_Q \( s \) = product_(Y_0 < p lt.eq Q) D_p \( s \, Z \)^(- 1) \,
    wide Xi = sum_(p > Y_0) p^(- 1 - 2 s) . $
  This is a positive real random variable. The same expansion gives
  $ bb(E) D_p \( s \, Z \)^(- 1) = 1 + O \( p^(- 1 - 2 s) \) \, wide bb(E) D_p \( s \, Z \)^(- 2) = 1 +
    O \( p^(- 1 - 2 s) \) . $
  The first error may have either sign. Nevertheless, the elementary product bound $\| product \( 1 + e_p \) -
    1 \| lt.eq exp \( sum \| e_p \| \) - 1$ and independence show that
  #[#set math.equation(numbering: n => "(5.20)")
   $ bb(E) U = 1 + O \( Xi \) \, wide bb(E) U^2 = 1 + O \( Xi \) . $ <model:residual-moments>]
  Indeed (5.1) and $s log Y_0 = sqrt(k)$ give
  $ Xi lt.double integral_(2 sqrt(k))^oo e^(- v) frac(d v, v) lt.double e^(- 2 sqrt(k)) \/ sqrt(k) \, $
  so $Xi$ is uniformly small after choosing $k_0$. Finally,
  $ parallel U - 1 parallel_2^2 = bb(E) U^2 - 2 bb(E) U + 1 lt.double Xi . $
  This uses both moment estimates in (5.20) and proves (5.15). ◻
]

#thm([Lemma 5.5.])[
  (Relative truncation in mean square).  #emph[For every $b$ with $Re b > 0$, uniformly in $Q gt.eq Y_0$,
#[#set math.equation(numbering: n => "(5.21)")
 $ parallel \( H_j - \( P_j^(upright("eu")) \)^(- 1) \) cal(L)_Q \( b \) parallel_2 lt.eq
   (exp (C sum_i 2^(- m_(j i))) - 1) parallel \( P_j^(upright("eu")) \)^(- 1) cal(L)_Q \( b \) parallel_2 .
   $ <model:relative-error>]

 In particular the relative factor is $O \( 2^(- k^(1 \/ 4) - j) \)$.]
] <model:relative-truncation>

#proof[
  For a block $I = I_(j i)$ let $cal(L)_I \( b \) = product_(p in I) D_p \( b \, Z \)^(- 1)$.
    We claim there are fixed positive constants $c_(*) \, C_(*)$ such that
  #[#set math.equation(numbering: n => "(5.22)")
   $ parallel K_(j i) \( Z \, 1 \) cal(L)_I \( b \) parallel_2 gt.eq c_(*) \, wide
     sup_(\| z \| = 2) parallel K_(j i) \( Z \, z \) cal(L)_I \( b \) parallel_2 lt.eq
     C_(*) . $ <model:block-two-norms>]
  For the first assertion, at a large odd prime the exact local ratio is
  $ frac(D_p \( s \, Z \), D_p \( b \, Z \)) = 1 + lambda \( p \) Z \( p \) p^(- 1 \/ 2) \( p^(- b) - p^(- s) \) +
    O \( p^(- 1) \) . $
  The centered linear term shows that its local second moment is $1 + O \( p^(- 1) \)$;
    for all sufficiently large primes it is at least $1 - C \/ p gt.eq 1 \/ 2$.
    Their product is bounded below by $exp \( - 2 C sum_(p in I) 1 \/ p \)$,
    which is a fixed positive constant by (5.5). At each of the finitely many smaller primes, including $2$,
    (5.4) gives the pointwise lower bound
  $ lr(|frac(D_p \( s \, Z \), D_p \( b \, Z \))|) gt.eq
    frac(\( 1 - p^(- 1 \/ 2) \)^2, \( 1 + p^(- 1 \/ 2) \)^2) > 0 . $
  Their finite product is also bounded below. This proves the first assertion of (5.22).
  For the second, on $\| z \| = 2$ the local quotient is
  $ frac(1 - lambda \( p \) Z \( p \) p^(- 1 \/ 2 - s) z + xi_p Z \( p \)^2 p^(- 1 - 2 s) z^2, D_p \( b \, Z \)) =
    1 + lambda \( p \) Z \( p \) p^(- 1 \/ 2) \( p^(- b) - z p^(- s) \) + O \( p^(- 1) \) $
  at large odd primes, uniformly in $z$ and $b$. Its second moment is $1 + O \( p^(- 1) \)$,
    and therefore its product is bounded above, again by (5.5).
    At small primes use the direct numerator upper bound and (5.4).
    The numerator is permitted to vanish; only an upper bound has been used on this circle.
  Apply Cauchy’s coefficient formula to the polynomial $z mapsto K_(j i) \( Z \, z \)
    cal(L)_I \( b \)$ with values in $L^2$. For $m = m_(j i)$, Minkowski’s inequality and (5.22) give
  $ parallel \( T_(j i) \( Z \) - K_(j i) \( Z \, 1 \) \) cal(L)_I \( b \) parallel_2 lt.eq
    C_(*) sum_(h > m) 2^(- h) lt.eq C_(*) 2^(- m) . $
  Dividing by the positive lower bound in (5.22) makes this a relative error $epsilon_i = C 2^(- m_(j i))$.
  To see explicitly how relative errors combine, put $A_i = K_(j i) \( Z \, 1 \) cal(L)_I \( b \)$ and $B_i =
    T_(j i) \( Z \) cal(L)_I \( b \)$. Then $parallel B_i - A_i parallel_2 lt.eq
    epsilon_i parallel A_i parallel_2$ and $parallel B_i parallel_2 lt.eq \( 1 + epsilon_i \) parallel A_i
    parallel_2$. Variables belonging to distinct blocks and to the residual primes $Y_j < p lt.eq
    Q$ are independent. In the telescoping identity for $product B_i - product A_i$,
    the norm of each product of factors on distinct blocks is the product of their norms.
    Thus its relative norm, also including the independent residual product, is at most
  $ sum_i epsilon_i product_(h < i) \( 1 + epsilon_h \) = product_i \( 1 + epsilon_i \) - 1 lt.eq
    exp (sum_i epsilon_i) - 1 . $
  This proves (5.21), without a factor equal to the number of blocks.
    Finally $sum_i 2^(- m_(j i)) lt.eq 2^(1 - k^(1 \/ 4) - j)$. ◻
]

#thm([Proposition 5.6.])[
  (The shifted norms).  #emph[There are fixed $C \, c_0 > 0$ such that,
    uniformly for every real $theta$ and every cutoff $Q gt.eq Y_0$,
#[#set math.equation(numbering: n => "(5.23)")
 $ parallel H_0 \( Z \) cal(L)_Q \( s \/ 2 + i theta s \) parallel_2 & lt.double \( 1 + \| theta \| \)^C \,\
parallel H_0 \( Z \) cal(L)_Q \( s \) - 1 parallel_2 & lt.double e^(- c_0 k^(1 \/ 4)) \,\
parallel H_j \( Z \) cal(L)_Q \( \( 1 + i theta \) \/ ell \) parallel_2 &
  lt.double \( 1 + \| theta \| \)^C \( k 2^j \)^C wide \( 0 lt.eq j lt.eq J \) . $ <model:half-shift>]

]
] <model:shifted-norms>

#proof[
  In (5.14), first take $alpha = s \/ 2$, $t = theta s$, and $j = 0$.
    Then $h \/ min \( alpha \, s \) = 3 + 2 \| theta \|$ and $alpha log Y_0 = sqrt(k) \/ 2$.
    This proves (5.23) with the exact multiplier; use Lemma 22 to replace it by $H_0$.
    For (5.23), take $alpha = 1 \/ ell$ and $t = theta \/ ell$. Since $k gt.eq 1$,
  $ h \/ min \( alpha \, s \) = 1 + k + \| theta \| \, wide alpha log Y_j = delta_j^2 \/ sqrt(k) . $
  The bound follows from (5.14) after increasing the fixed exponent $C$, and then from relative truncation.
    Finally, (5.15) bounds the distance from one for the exact multiplier and also bounds its norm.
    The triangle inequality and (5.21) give
  $ parallel H_0 cal(L)_Q \( s \) - 1 parallel_2 lt.double 2^(- k^(1 \/ 4)) +
    e^(- sqrt(k)) k^(- 1 \/ 4) lt.double e^(- c_0 k^(1 \/ 4)) . $
  ◻
]

=== 5.4 Fourier representations and the first weight <fourier-representations-and-the-first-weight>

We have obtained bounds for the mollified finite Euler products at the three shifts needed below.
  Fourier inversion now converts these bounds into estimates for the actual weights.
  For the first piece, the main term is $A_x$. Its estimate combines the power-to-exponential comparison with the
  cutoff tail and the exponentially small mollifier error.

We use the Fourier convention

$ hat(g) \( theta \) = integral_(bb(R)) g \( y \) e^(i theta y) thin d y \, wide g \( y \) =
  frac(1, 2 pi) integral_(bb(R)) hat(g) \( theta \) e^(- i theta y) thin d theta . $

The following elementary bound includes negative real arguments, which occur inside the gamma integral.

#thm([Lemma 5.7.])[
  (Global approximation of the truncated power).  #emph[For each fixed nonnegative integer $r$, if $k gt.eq 2 r +
    4$, then for every $z in bb(R)$,
#[#set math.equation(numbering: n => "(5.24)")
 $ lr(|frac(d^r, d z^r) (\( 1 - z \/ k \)_(+)^k - e^(- z))|) lt.eq C_r /
   k \( 1 + \| z \| \)^2 e^(- z) . $ <model:global-power-bound>]

]
] <model:global-power-approximation>

#proof[
  For $z < k$ the derivative of the power is
  $ \( - 1 \)^r frac(\( k \)_r, k^r) \( 1 - z \/ k \)^(k - r) \, wide \( k \)_r =
    k \( k - 1 \) dots.h.c \( k - r + 1 \) \, $
  and it is zero for $z gt.eq k$. The formula is continuous through $z =
    k$ in the derivative orders under consideration. For $z < k$,
    the logarithm of its ratio in absolute value to $e^(- z)$ is
  $ log \( \( k \)_r \/ k^r \) + z + \( k - r \) log \( 1 - z \/ k \) . $
  The last two terms have derivative $\( r - z \) \/ \( k - z \)$, so their maximum over $z < k$ is at $z = r$.
    It follows at once that the absolute ratio is at most $e^r$.
    For $\| z \| gt.eq sqrt(k)$ this bound and $k^(- 1) \( 1 + \| z \| \)^2 gt.eq 1$ prove (5.24).
    For $\| z \| < sqrt(k)$ we have $\| z \/ k \| lt.eq 1 \/ 2$.
    Taylor’s formula for $log \( 1 - z \/ k \)$ and $log \( \( k \)_r \/ k^r \) =
    O_r \( k^(- 1) \)$ bound the displayed logarithm by
  $ O_r #scale(x: 120%, y: 120%)[\(] k^(- 1) \( 1 + \| z \| \)^2 #scale(x: 120%, y: 120%)[\)] . $
  This quantity is bounded in this range; applying $\| e^w -
    1 \| lt.eq \| w \| e^(\| w \|)$ proves the result there too.
    All estimates hold for negative $z$ as well as positive $z$. ◻
]

#thm([Lemma 5.8.])[
  (Fourier error for the first piece).  #emph[Define
$ A_x = \( C_F \| x \| \)^s Gamma \( 1 + s \) \, wide E_x \( y \) = w_(0 \, x) \( y \/ k \) -
  A_x e^(- y) quad \( y gt.eq 0 \) . $

 For every required fixed integer $r$, there is an extension $g_x$ of $e^(y \/ 2) E_x \( y \)$ from $y gt.eq
   0$ to $bb(R)$ such that
#[#set math.equation(numbering: n => "(5.25)")
 $ \| hat(g)_x \( theta \) \| lt.double_r k^(- 1) \( 1 + \| theta \| \)^(- r) . $ <model:first-Fourier-decay>]

 The constants are uniform in $x \, k \, X$ after choosing $k_0$ depending on $r$.
   The quantities $A_x$ are bounded above and below by positive fixed constants.]
] <model:first-Fourier-error>

#proof[
  Write $q = C_F \| x \|$, which lies in a fixed compact subinterval of $\( 0 \, oo \)$.
    The exact weight definition gives
  $ W_(k \, x) \( y \/ k \) = integral_0^oo e^(- v) (1 - frac(y - s log \( q v \), k))_(+)^k thin d v \, $
  whereas
  $ integral_0^oo e^(- v) e^(- y + s log \( q v \)) thin d v = A_x e^(- y) . $
  For every fixed $M$, the logarithmic moments
  #[#set math.equation(numbering: n => "(5.26)")
   $ integral_0^oo e^(- v) \( q v \)^s \( 1 + \| s log \( q v \) \| \)^M thin d v lt.eq C_M $ <model:gamma-log-moments>]
  are uniform for $0 < s lt.eq 1$: on $0 < v lt.eq 1$, bound $v^s lt.eq 1$ and $s \| log v \| lt.eq \| log v \|$;
    on $v gt.eq 1$, use $v^s lt.eq v$ and the exponential decay.
    Lemma 24 and differentiation under this dominated integral now imply, for $0 lt.eq h lt.eq r$ and $y gt.eq - 2$,
  #[#set math.equation(numbering: n => "(5.27)")
   $ lr(|frac(d^h, d y^h) (W_(k \, x) \( y \/ k \) - A_x e^(- y))|) lt.double_r k^(- 1) \( 1 + y^2 \) e^(- y) .
     $ <model:gamma-power-error>]
  In particular the proof uses (5.24) when $y - s log \( q v \)$ is negative and arbitrarily large in absolute value.
  The cutoff $F_0 \( y \/ k \)$ is one for $y lt.eq k \/ 2$, zero for $y gt.eq 3 k \/ 4$,
    and its $h$th derivative in $y$ is $O_h \( k^(- h) \)$. Write
  $ E_x \( y \) = F_0 \( y \/ k \) #scale(x: 120%, y: 120%)[\(] W_(k \, x) \( y \/ k \) -
    A_x e^(- y) #scale(x: 120%, y: 120%)[\)] + \( F_0 \( y \/ k \) - 1 \) A_x e^(- y) $
  also for $y gt.eq - 2$. By (5.27), after multiplication by $e^(y \/ 2)$ the first term and its first $r$
    derivatives have $L^1 \( \[ - 2 \, oo \) \)$ norm $O_r \( k^(- 1) \)$.
    The second term is supported in $y gt.eq k \/ 2$ and has these norms $O_r \( e^(- k \/ 4) \)$.
    Choose a fixed smooth function $rho$ equal to zero for $y lt.eq - 2$ and one for $y gt.eq - 1$, and extend by
  $ g_x \( y \) = rho \( y \) e^(y \/ 2) E_x \( y \) \, $
  with zero value to the left of $- 2$. All derivatives through order $r$ have $L^1 \( bb(R) \)$ norm
    $O_r \( k^(- 1) \)$. Integration by parts $r$ times and the bound without integration by parts give (5.25).
    Lastly, continuity and positivity of $q^s Gamma \( 1 + s \)$ on the compact parameter set $q
    in \[ q_(-) \, q_(+) \]$, $0 lt.eq s lt.eq 1$, give the two bounds for $A_x$. ◻
]

#thm([Proposition 5.9.])[
  (Independent-model estimates for the weight pieces).  #emph[With the weights and sums $S_(j \, Z) \( x \)$
    defined in Section 4, there is a fixed exponent $C_5$ such that
#[#set math.equation(numbering: n => "(5.28)")
 $ parallel H_0 \( Z \) S_(0 \, Z) \( x \) - A_x parallel_2 & lt.double k^(- 1) \,\
parallel H_j \( Z \) S_(j \, Z) \( x \) parallel_2 & lt.double \( k 2^j \)^(C_5) delta_j^k
  wide \( 1 lt.eq j lt.eq J \) . $ <model:first-piece-norm>]

 These bounds are uniform in $x in cal(X)$ and over the entire range $k_0 lt.eq k lt.eq ell^(3 \/ 5)$,
   with one fixed $k_0$ and one sufficiently large $X$ threshold.]
] <model:main-model-estimates>

#proof[
  Choose a finite cutoff $Q$ exceeding $Y_0$ and the lengths of all the short polynomials $S_(j \, Z)$, $0 lt.eq
    j lt.eq J$. This is the only requirement on $Q$; Proposition 23 is uniform in its choice.
    For $j gt.eq 1$, set $g_(j \, x) \( u \) = e^u w_(j \, x) \( u \)$.
    The support is contained in $\[ 1 - delta_j \, 1 - delta_j \/ 4 \] subset \[ 1 \/ 2 \, 1 \]$.
    The fixed-order derivative bounds in Lemma 14 and integration by parts give, for each required fixed $r$,
  #[#set math.equation(numbering: n => "(5.29)")
   $ \| hat(g)_(j \, x) \( theta \) \| lt.double_r \( k \/ delta_j \)^(C_r)
     delta_j^k \( 1 + \| theta \| \)^(- r) . $ <model:later-Fourier-decay>]
  Fourier inversion and (5.13) give the exact identity
  #[#set math.equation(numbering: n => "(5.30)")
   $ S_(j \, Z) \( x \) = frac(1, 2 pi) integral_(bb(R)) hat(g)_(j \, x) \( theta \)
     cal(L)_Q \( \( 1 + i theta \) \/ ell \) thin d theta . $ <model:later-Fourier-representation>]
  Indeed every nonzero weight coefficient has index below the chosen cutoff and hence occurs in (5.13);
    all other indices contribute zero after inversion. At this fixed finite $Q$,
    absolute convergence of the Dirichlet expansion and the integrable kernel justify interchanging the sum and
    integral. Multiply by $H_j$ and use Minkowski’s inequality, (5.23), and (5.29), taking $r > C + 2$.
    Their integral is $O \( \( k \/ delta_j \)^(C_r) \( k 2^j \)^C delta_j^k \)$,
    which proves (5.28) after fixing $C_5$.
  For the first piece, Lemma 25 and the same finite-product expansion give
  #[#set math.equation(numbering: n => "(5.31)")
   $ S_(0 \, Z) \( x \) - A_x cal(L)_Q \( s \) = frac(1, 2 pi) integral_(bb(R)) hat(g)_x \( theta \)
     cal(L)_Q \( s \/ 2 + i theta s \) thin d theta . $ <model:first-Fourier-representation>]
  To check the scaling, at an integer index $n$ put $y = k log n \/ ell = s log n gt.eq 0$.
    Fourier inversion for $g_x$ then reads
  $ w_(0 \, x) \( log n \/ ell \) - A_x n^(- s) = frac(1, 2 pi) integral hat(g)_x \( theta \)
    n^(- s \/ 2 - i theta s) thin d theta \, $
  which is exactly the coefficient identity needed in (5.31).
    Use (5.23) and (5.25) with $r > C + 2$ to bound the norm of (5.31) after multiplication by $H_0$ by
    $O \( k^(- 1) \)$. By (5.23),
  $ parallel H_0 S_(0 \, Z) - A_x parallel_2 lt.eq parallel H_0 \( S_(0 \, Z) - A_x cal(L)_Q \( s \) \)
    parallel_2 + A_x parallel H_0 cal(L)_Q \( s \) - 1 parallel_2 lt.double k^(- 1) +
    e^(- c_0 k^(1 \/ 4)) lt.double k^(- 1) . $
  This proves (5.28).
  All smoothness orders used here are fixed after the absolute exponent in Proposition 23,
    and before choosing $k_0$. The derivative estimates for the weights, the inequality $s lt.eq ell^(- 2 \/ 5)$,
    and the lower bound $delta_J gt.eq ell^(- 1 \/ 10)$ then give a single $X$ threshold for the whole parameter
    range. We have not used the event of Proposition 20 anywhere in these model norm arguments.
    Nor is a passage to an infinite Euler cutoff required: the coefficient identities hold for every sufficiently
    large finite $Q$, and all norm estimates are uniform in that cutoff. ◻
]

== 6 Nonvanishing and the rank-weighted tail <sec:tail>

We now combine the transferred model estimates, the integer product event,
  and the terminal mean square to count large orders of vanishing.
  A separate bound for each individual rank then converts this count into the rank-weighted tail.
  The companion density theorem enters only in the final subsection, after the tail theorem is proved.
  The constants and the fixed lower threshold $k_0$ are increased finitely many times in this section.
  All choices depend only on the fixed family and the already fixed smoothness orders.

=== 6.1 Counting large orders of vanishing <counting-large-orders-of-vanishing>

#thm([Proposition 6.1.])[
  #emph[There are $k_0$, $X_0$, and $C$, depending on $E$, such that for every $F in cal(F)$,
    every dyadic $X gt.eq X_0$, and every integer
$ k_0 + 1 lt.eq k lt.eq \( log X \)^(3 \/ 5) \, $

 one has
$ \# { d in cal(A) \( X \) : a \( F^(\( d \)) \) > k } lt.eq C X k^(- 2) . $

]
] <tail:count>

#proof[
  Write $ell = log X$, and first consider the functional-equation sign $\( - 1 \)^k$, with $k_0 lt.eq k lt.eq
    ell^(3 \/ 5)$. Fix $c = plus.minus 1$, and use the weights and partition of Section 4.
    We write $P_j^(upright("eu"))$ for the positive Euler products of Section 5.
  Corollary 15 and Lemma 18 permit Proposition 12 to be applied to $H_j S_j$, for $0 lt.eq j lt.eq J$,
    with $Delta = delta_j \/ 4$. By the first assertion of Proposition 26,
    outside $O \( X \/ k^2 \)$ integers in $X lt.eq \| m \| < 2 X$,
  #[#set math.equation(numbering: n => "(6.1)")
   $ \| H_0 \( z_m \) S_(0 \, z_m) \( m \/ X \) - A_(m \/ X) \| < 1 / 2 A_(m \/ X) . $ <eq:tail-main-good>]
  Indeed $A_x = \( C_F \| x \| \)^s Gamma \( 1 + s \)$ is bounded above and below by positive constants on the
    fixed $x$-range, uniformly for $s = k \/ ell lt.eq ell^(- 2 \/ 5)$.
    Chebyshev’s inequality applies to the transferred $O \( k^(- 2) \)$ mean-square error.
    The exponentially small comparison error is absorbed uniformly.
  For $1 lt.eq j lt.eq J$, the second model estimate gives
  $ 1 / X sum_m Psi \( m \/ X \) \| H_j \( z_m \) S_(j \, z_m) \( m \/ X \) \|^2 lt.double \( k 2^j \)^(2 C_5)
    2^(- 2 j k) + e^(- c delta_j ell) lt.double 2^(- 3 j k \/ 2) . $
  The last inequality follows first by increasing fixed $k_0$ to absorb the polynomial factor.
    For the comparison error, use
  $ delta_j ell gt.eq ell^(9 \/ 10) \, wide j k lt.double ell^(3 \/ 5) log ell \, $
  and then increase one $X_0$ for all the permitted $k \, j$. The terminal estimate of Lemma 17 gives
  $ 1 / X sum_(d in cal(A) \( X \)) \| S_(* \, chi_d) \( d \/ X \) \|^2 lt.double 2^(- 3 J k \/ 2) . $
  Chebyshev and summation of the resulting geometric probabilities imply,
    outside $O \( X \/ k^2 \)$ further admissible parameters,
  #[#set math.equation(numbering: n => "(6.2)")
   $ \| H_j \( chi_d \) S_(j \, chi_d) \( d \/ X \) \| lt.eq 2^(- j k \/ 2) quad \( 1 lt.eq j lt.eq J \) \,
     wide \| S_(* \, chi_d) \( d \/ X \) \| lt.eq 2^(- J k \/ 2) . $ <eq:tail-other-good>]
  Here $sum_(j gt.eq 1) 2^(- j k \/ 2) lt.double k^(- 2)$ after fixing $k_0$, and $J gt.eq
    1$ for sufficiently large $X$.
  Intersect these events with the event in Proposition 20. Its additional exceptional set is also
    $O \( X \/ k^2 \)$. On the intersection,
  $ 1 / 2 lt.eq H_j P_j^(upright("eu")) lt.eq 2 \, wide P_j^(upright("eu")) lt.eq
    2^(j k \/ 8) P_0^(upright("eu")) \, wide 1 lt.eq 2^(J k \/ 8) P_0^(upright("eu")) . $
  Choose a fixed $a_(*) > 0$ with $A_x gt.eq a_(*)$ for all the parameters. Equation (6.1) yields
  $ \| S_(0 \, chi_d) \( d \/ X \) \| gt.eq a_(*) / 4 P_0^(upright("eu")) . $
  Equation (6.2) yields
  $ sum_(j = 1)^J \| S_(j \, chi_d) \( d \/ X \) \| + \| S_(* \, chi_d) \( d \/ X \) \| lt.eq
    P_0^(upright("eu")) (2 sum_(j = 1)^J 2^(- 3 j k \/ 8) + 2^(- 3 J k \/ 8)) . $
  For a sufficiently large fixed $k_0$, the last parenthesis is less than $a_(*) \/ 4$.
    The entire weighted sum is therefore nonzero. Lemma 13 excludes the simultaneous conditions
    $a \( F^(\( d \)) \) > k$ and $epsilon.alt_(F^(\( d \))) = \( - 1 \)^k$.
    Including both values of $c$, we have proved
  #[#set math.equation(numbering: n => "(6.3)")
   $ \# { d in cal(A) \( X \) : a \( F^(\( d \)) \) > k \, med
     epsilon.alt_(F^(\( d \))) = \( - 1 \)^k } lt.double X k^(- 2) . $ <eq:tail-parity-count>]
  For the other functional-equation sign, apply (6.3) at $k - 1$.
    A rank exceeding $k$ also exceeds $k - 1$, and $\( k - 1 \)^(- 2) lt.double k^(- 2)$. This proves the proposition. ◻
]

=== 6.2 A uniform bound for an individual rank <a-uniform-bound-for-an-individual-rank>

#thm([Lemma 6.2.])[
  #emph[Uniformly for $F in cal(F)$ and $d in cal(A) \( X \)$,
$ a \( F^(\( d \)) \) lt.double_E log \( 3 X \) . $

]
] <tail:jensen>

#proof[
  Put $L = L_(F^(\( d \)))$ and $C_d = C_F \| d \|$. On $Re s = 5$,
    absolute convergence and (2.2) give a uniform bound. On $Re s = - 1$, the functional equation is
  $ L \( s \) = epsilon.alt_(F^(\( d \))) C_d^(thin 1 - 2 s) frac(Gamma \( 3 \/ 2 - s \), Gamma \( 1 \/ 2 + s \))
    L \( 1 - s \) . $
  At $s = - 1 + i t$, the modulus of the gamma quotient equals
  $ \| \( - 1 \/ 2 + i t \) \( 1 \/ 2 + i t \) \( 3 \/ 2 + i t \) \| . $
  Since $L \( 2 - i t \)$ is uniformly bounded,
  $ \| L \( - 1 + i t \) \| lt.double_E X^3 \( 1 + \| t \| \)^3 . $
  Apply the strip principle to $L \( s \) \/ \( s + 2 \)^4$ on $- 1 lt.eq Re s lt.eq 5$.
    To see that the possibly conductor-dependent finite-order growth in the strip introduces no new constant,
    first multiply by
  $ exp #h(-0.16667em) (- epsilon cos frac(pi \( s - 2 \), 12)) \, wide epsilon > 0 . $
  Its modulus is at most one on this strip and decays faster than any finite-order growth as $\| Im s \| arrow.r
    oo$. The maximum principle on expanding rectangles gives the bound from the two vertical sides.
    Letting $epsilon$ decrease to zero shows that $L \( s \) \/ \( s + 2 \)^4 lt.double_E
    X^3$ throughout the strip. In particular, the maximum of $\| L \|$ on the closed disk $\| s - 2 \| lt.eq
    5 \/ 2$ is $O_E \( X^3 \)$.
  At the center, the Euler factors and their parameter bounds give
  $ \| L \( 2 \) \| gt.eq product_p \( 1 + p^(- 2) \)^(- 2) = (frac(zeta \( 4 \), zeta \( 2 \)))^2 > 0 . $
  Jensen’s formula, with inner radius $2$ and outer radius $5 \/ 2$,
    therefore bounds the number of zeros in the inner disk, counted with multiplicity,
    by $O_E \( log \( 3 X \) \)$. The point $1 \/ 2$ lies in that inner disk. This proves the result. ◻
]

=== 6.3 Summing the integer tails <summing-the-integer-tails>

#proof[
  We first work in $cal(A) \( X \)$ for a fixed $F in cal(F)$. Let
  $ T_(F \, X) \( k \) = \# { d in cal(A) \( X \) : a \( F^(\( d \)) \) > k } \, wide K =
    floor.l \( log X \)^(3 \/ 5) floor.r . $
  For an integer $R gt.eq k_0 + 1$ and $X$ large enough that $K > R$, the elementary integer-tail bound gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ sum_(d in cal(A) \( X \)\
a \( F^(\( d \)) \) > R) a \( F^(\( d \)) \) & lt.eq R T_(F \, X) \( R \) +
  sum_(k = R)^(K - 1) T_(F \, X) \( k \) + C_E log X thin T_(F \, X) \( K \)\
 & lt.double_E X / R + X \( log X \)^(- 1 \/ 5) . $ <eq:tail-dyadic-mass>]
  For ranks between $R + 1$ and $K$, the first two terms count the rank exactly.
    For ranks exceeding $K$, the last term bounds the remaining mass by Lemma 28.
    Proposition 27 supplies every counting estimate used here.
    In particular the last term is $O_E \( X log X \/ K^2 \) = O_E \( X \( log X \)^(- 1 \/ 5) \)$.
    The constant in (6.4) is independent of $R$.
  For completeness, fix $R$ and cover $0 < \| d \| lt.eq Y$ by dyadic blocks.
    Enlarge the last partial block to a full block, using nonnegativity.
    The sum of their left endpoints is less than $2 Y$. The finitely many blocks below the threshold for (6.4)
    contribute a finite number $B_(E \, R)$. For the error term in the remaining blocks, split at $X = sqrt(Y)$.
    The smaller blocks contribute $O_E \( sqrt(Y) \)$, and in the larger ones $log X gt.eq 1 / 2 log Y$. Consequently
  $ sum_(d med upright("admissible")\
0 < \| d \| lt.eq Y\
a \( F^(\( d \)) \) > R) a \( F^(\( d \)) \) lt.eq B_(E \, R) + frac(C_E Y, R) +
  O_E #scale(x: 120%, y: 120%)[\(] sqrt(Y) + Y \( log Y \)^(- 1 \/ 5) #scale(x: 120%, y: 120%)[\)] . $
  After division by $Y$ and passage to the limsup, the desired $C_E \/ R$ bound holds for each $F in cal(F)$.
    Lemma 4, its bounded multiplicity, and the finite maximum of these constants prove the same bound for every
    original signed squarefree parameter of $E$. ◻
]

=== 6.4 The mean <the-mean>

#proof[
  Write $N \( Y \) = \# cal(D) \( Y \)$ and let $N_j \( Y \)$ count the parameters of analytic rank $j$.
    The elementary squarefree sieve gives
  $ N \( Y \) = 2 sum_(n lt.eq Y) mu \( n \)^2 = frac(2 Y, zeta \( 2 \)) + O \( sqrt(Y) \) . $
  Indeed, expand $mu \( n \)^2 = sum_(r^2 divides n) mu \( r \)$, interchange the finite sums,
    and bound the omitted tail of $sum_r mu \( r \) \/ r^2 = 1 \/ zeta \( 2 \)$.
  By the analytic density theorem (1.1), $N_0 \( Y \) \/ N \( Y \) arrow.r
    1 \/ 2$ and $N_1 \( Y \) \/ N \( Y \) arrow.r 1 \/ 2$. Thus $N \( Y \) - N_0 \( Y \) - N_1 \( Y \) =
    o \( Y \)$. For every fixed integer $R gt.eq R_E$,
  $ sum_(d in cal(D) \( Y \)\
2 lt.eq a \( E^(\( d \)) \) lt.eq R) a \( E^(\( d \)) \) lt.eq R #scale(x: 120%, y: 120%)[\(] N \( Y \) -
  N_0 \( Y \) - N_1 \( Y \) #scale(x: 120%, y: 120%)[\)] = o_(E \, R) \( Y \) . $
  Theorem 2 now implies
  $ limsup_(Y arrow.r oo) 1 / Y sum_(d in cal(D) \( Y \)\
a \( E^(\( d \)) \) gt.eq 2) a \( E^(\( d \)) \) lt.eq C_E / R . $
  Let $R arrow.r oo$. The left side is zero by nonnegativity.
    The total rank sum is consequently $N_1 \( Y \) + o_E \( Y \)$. Dividing by $N \( Y \)$ proves the limit $1 \/ 2$. ◻
]

== 7 Algebraic-rank moments <sec:algebraic>

We now prove Corollary 3. The inputs are the companion density and rank-equality theorem and the
  exponential-moment estimate of Koymans and Smith. The latter bounds the contribution of the density-zero
  exceptional set for every fixed exponential parameter or moment order; the analytic tail theorem is not needed.

#proof[
  Put $N \( Y \) = \# cal(D) \( Y \)$, $r_d = r \( E^(\( d \)) \)$,
    and let $N_j^(upright("alg")) \( Y \)$ count the parameters with $r_d = j$.
    The rank-equality conclusion of the companion density theorem #cite(label("OpenAIAnalyticDensityV2"))
    Theorem 1.2, together with its analytic rank-zero and rank-one densities, gives
  $ frac(N_j^(upright("alg")) \( Y \), N \( Y \)) arrow.r 1 / 2 wide \( j = 0 \, 1 \) . $
  Indeed, analytic and algebraic ranks agree outside a density-zero set,
    so their rank-$j$ counts differ by $o \( N \( Y \) \)$. Consequently
  $ cal(B) \( Y \) = { d in cal(D) \( Y \) : r_d gt.eq 2 } quad upright("satisfies") quad \# cal(B) \( Y \) =
    o \( N \( Y \) \) . $
  For the next bound, $E^(\( v \))$ for any nonzero integer $v$ denotes the twist determined by its squareclass,
    so the integer sum may repeat squareclasses. Theorem 1.4 of Koymans and Smith
    #cite(label("KoymansSmith2026")), specialized to $F = bb(Q)$, $A = E$, one variable, and $P \( u \) = u$,
    gives a constant $C_E > 0$ such that for every fixed $kappa > 0$,
  $ frac(1, 2 Y) sum_(v in bb(Z)\
0 < \| v \| lt.eq Y) exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] kappa thin "rank"_(bb(Z))
  E^(\( v \)) \( bb(Q) \) #scale(x: 120%, y: 120%)[\)] lt.eq
  exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] exp \( C_E kappa \) #scale(x: 120%, y: 120%)[\)] $
  for all sufficiently large $Y$, with the threshold allowed to depend on $kappa$.
    Their integer box already includes both signs, and $P \( v \) eq.not 0$ excludes exactly $v = 0$.
    Restricting this nonnegative sum to $cal(D) \( Y \)$, and using $N \( Y \) tilde.op 2 Y \/ zeta \( 2 \)$,
    gives for each fixed $kappa > 0$
  #[#set math.equation(numbering: n => "(7.1)")
   $ limsup_(Y arrow.r oo) frac(1, N \( Y \)) sum_(d in cal(D) \( Y \)) e^(kappa r_d) lt.eq
     zeta \( 2 \) exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] exp \( C_E kappa \)
     #scale(x: 120%, y: 120%)[\)] < oo . $ <eq:algebraic-exp-bound>]
  For fixed $t > 0$, Cauchy–Schwarz and (7.1) at $kappa = 2 t$ give
  $ frac(1, N \( Y \)) sum_(d in cal(B) \( Y \)) e^(t r_d) lt.eq
    (frac(\# cal(B) \( Y \), N \( Y \)))^(1 \/ 2)
    (frac(1, N \( Y \)) sum_(d in cal(D) \( Y \)) e^(2 t r_d))^(1 \/ 2) arrow.r 0 . $
  For fixed $t < 0$, the same exceptional average is at most $\# cal(B) \( Y \) \/ N \( Y \)$, since $r_d gt.eq
    0$; for $t = 0$ the full average is identically one. The contributions from ranks zero and one are
    $N_0^(upright("alg")) \( Y \) \/ N \( Y \)$ and $e^t N_1^(upright("alg")) \( Y \) \/ N \( Y \)$,
    proving the exponential limit.
  Finally, for each fixed positive integer $m$, one has $x^(2 m) lt.double_m e^x$ for $x gt.eq 0$.
    A second Cauchy–Schwarz application and (7.1) at $kappa = 1$ therefore give
  $ frac(1, N \( Y \)) sum_(d in cal(B) \( Y \)) r_d^m lt.eq
    (frac(\# cal(B) \( Y \), N \( Y \)))^(1 \/ 2)
    (frac(1, N \( Y \)) sum_(d in cal(D) \( Y \)) r_d^(2 m))^(1 \/ 2) arrow.r 0 . $
  The rank-zero contribution is zero and the rank-one contribution is $N_1^(upright("alg")) \( Y \) \/ N \( Y \)$,
    proving the power-moment limit without differentiating a limiting exponential-moment formula. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
