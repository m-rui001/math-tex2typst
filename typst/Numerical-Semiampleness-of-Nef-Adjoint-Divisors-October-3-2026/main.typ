#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Numerical-Semiampleness-of-Nef-Adjoint-Divisors-October-3-2026]]
#align(center)[OpenAI]
#align(center)[October 3, 2026]

== 1 Introduction <sec:introduction>

A nef divisor has nonnegative degree on every curve. A semiample divisor has a positive Cartier multiple generated
  by global sections, and therefore defines a morphism to a projective variety.
  The passage from numerical positivity to such a morphism is central to the minimal model program.
  For an ordinary log canonical divisor, this is the abundance problem.
  Adding an arbitrary nef divisor changes the natural conclusion:
  one must allow replacement by a numerically equivalent divisor.

We call a rational Cartier divisor #emph[numerically semiample] if it is numerically equivalent to a semiample
  rational Cartier divisor on the same variety. Here numerical equivalence means equality of degrees on all
  integral curves. We prove the following statement.

#thm([Theorem 1.1.])[
  #emph[Let $\( X \, B \)$ be a projective klt $bb(Q)$-pair over an algebraically closed field of characteristic
    zero. Suppose that $K_X + B$ is pseudo-effective, and let $M$ be a nef $bb(Q)$-Cartier divisor on $X$. If
$ D = K_X + B + M $

 is nef, then there is a semiample $bb(Q)$-Cartier divisor $L$ on $X$ such that $D equiv L$.]
] <thm:main>

The rationality assumptions apply to the boundary and the nef summand;
  in particular the latter is a divisor on $X$ itself. The proof uses the log-abundance theorem of [28]
  Theorem 1.1 and the terminating minimal-model programs of [29] Theorem 1.1 and Section 3.3.
  Their precise forms are stated in Section 2.

Theorem 1 contains the Generalised Abundance Conjecture formulated by Lazić–Peternell [22],
  where the nef summand is Cartier. Numerical equivalence is necessary even in dimension one.
  Indeed, a nontorsion degree-zero line bundle on a complex elliptic curve is nef and numerically trivial,
  but none of its positive powers has a nonzero section. Since the canonical bundle of the curve is trivial,
  this is an example with $B = 0$ in Theorem 1. For the ordinary adjoint,
  Fukuda’s theorem [15] Theorem 0.1 shows that a semiample numerical representative makes $K_X +
  B$ itself semiample. For $M = 0$, the conclusion is therefore equivalent to ordinary klt abundance,
  which is an input to this proof.

#thm([Corollary 1.2.])[
  #emph[Let $\( X \, B \)$ be a projective klt $bb(Q)$-pair in characteristic zero with $K_X + B equiv 0$.
    Every nef $bb(Q)$-Cartier divisor on $X$ is numerically semiample.]
] <cor:cy>

#proof[
  For a nef divisor $M$, the divisor $K_X + B + M$ is nef and numerically equivalent to $M$. Apply Theorem 1. ◻
]

=== 1.1 Background and the role of the present argument <background-and-the-role-of-the-present-argument>

The generalized-pair formalism retains a nef divisor on a higher birational model as part of the adjoint data.
  Birkar–Zhang [4] developed effective birationality for these polarized pairs,
  extending the tools used to study Iitaka fibrations. The canonical bundle formula of Ambro [1] is one source of
  such nef data. In this paper the original nef summand descends to $X$,
  but a minimal-model program forces us to keep track of it as a fixed nef divisor on a higher model.

Lazić–Peternell [22] formulated generalized abundance as a numerical extension of abundance and related it to
  semiampleness on varieties with trivial canonical class. Their Theorem B,
  assuming termination of flips and abundance in dimensions at most $n$,
  proves numerical semiampleness when the ordinary adjoint has positive numerical dimension.
  Its numerical-dimension-zero case also assumes their Semiampleness Conjecture.
  Their Corollaries C and D give unconditional results for surfaces and for threefolds with ordinary adjoint of
  positive numerical dimension. These results identify the main remaining positivity issue:
  an arbitrary nef summand on a variety with trivial canonical class need not supply sections directly.

Subsequent work has addressed numerical nonvanishing, which asks for an effective numerical representative,
  and refinements of numerical semiampleness. Lazić–Peternell [23] Theorems B and C obtained numerical
  nonvanishing under additional numerical or metric hypotheses and, in the metric case,
  conjectural MMP and abundance assumptions. For a Cartier nef summand,
  Chaudhuri [8] Corollary 3 proved generalized abundance when the nef-reduction base of $D$ has dimension two and
  $K_X + B$ is effective, or when that base has dimension three and $kappa \( K_X + B \) > 0$.
  Here nef reduction contracts the curves of degree zero through very general points;
  its precise properties are recalled in Section 2. On surfaces,
  Fontanari [10] Theorem 1.4 proved actual semiampleness when the nef summand is Cartier and its numerical class
  is not proportional to that of the ordinary adjoint.

The birational reductions below follow [22] Sections 4–7.
  The companion results [28,29] supply ordinary log abundance and the existence of the particular terminating
  programs required in those reductions. The further ingredient proved here is that a nef divisor of full nef
  dimension on a klt Calabi–Yau pair is big. Full nef dimension means that every curve through a very general
  point has positive degree. Bigness is stronger: it requires the volume of the divisor to be positive.
  The gap between these two conditions is the geometric issue addressed by the proof.

Our treatment adapts the moving-jet and Frobenius arguments of [28] Sections 7–9.
  The moving-point method has antecedents in the local-positivity work of Ein–Küchle–Lazarsfeld [9].
  The finite-data comparison uses Frobenius jets, as studied by Mustaţă–Schwede [26],
  the canonical filtrations of Sun and Kitadai–Sumihiro [30,18], and Langer’s control of Frobenius slopes [20].
  We reproduce the comparison proof with its uniformity conditions.
  The adaptation to an arbitrary nef summand occurs in the geometric exclusions preceding it:
  the polarized birationality theorem of Birkar–Zhang gives curves of bounded degree,
  contradicting a growing integral lower bound for their degrees.
  We give explicit proofs of those exclusions, including the case of correspondences between finite covers.

=== 1.2 Structure of the proof <structure-of-the-proof>

There are two simultaneous induction statements. The first says that $K_X + B +
  c M$ is big for every rational $c > 0$ whenever one positive combination of $K_X +
  B$ and $M$ has positive degree on all curves through a very general point.
  The second says that the positive part of $K_X + B + M$ on a suitable smooth birational model is rational and
  numerically semiample. The positive part is the divisor left after removing the asymptotically fixed prime
  divisors. When the original adjoint is nef, it has no such negative part,
  and the second assertion descends to Theorem 1.

Section 3 sets up this induction. A pair of compatible minimal-model programs retains both a semiample ordinary
  adjoint and a nearby nef generalized adjoint. Positive Iitaka dimension then permits induction on the fibres.
  The remaining full-dimension case is a klt Calabi–Yau pair.

Sections 4 and 5 treat the essential terminal case with trivial canonical bundle.
  If a nef Cartier divisor $L$ of full nef dimension were not big,
  its ample approximations could be rescaled to bounded volume while their degrees on very general curves tend to
  infinity. The bounded-degree obstruction controls the base loci of moving jet kernels.
  It produces a small vanishing-order bound on the variety itself and a large jet system on a projective bundle
  over its square. Section 6 shows that these two conclusions are incompatible.
  The comparison is made on fixed complex data before reduction to positive characteristic.

Section 7 passes through an index-one cover and a boundary perturbation to obtain the full-dimension assertion for
  all klt Calabi–Yau pairs. Section 8 proves the positive-part assertion by nef reduction and the canonical bundle
  formula, then descends numerical semiampleness to the original variety and to any algebraically closed field of
  characteristic zero.

== 2 Conventions and birational inputs <sec:preliminaries>

Varieties are integral and projective over an algebraically closed field of characteristic zero unless stated
  otherwise. A $bb(Q)$-pair $\( X \, B \)$ consists of a normal variety, an effective rational boundary $B$,
  and a rational Cartier divisor $K_X + B$. We use log discrepancies:
  on a resolution $h : Y arrow.r X$, the equality $K_Y + B_Y = h^(*) \( K_X + B \)$ assigns log discrepancy $1 -
  b_E$ to a prime divisor with coefficient $b_E$ in $B_Y$. The pair is klt if all log discrepancies are positive,
  and log canonical if they are nonnegative. We use the standard cone, contraction, negativity,
  and resolution theorems as in [19,3].

The symbols $tilde.op_(bb(Q))$ and $equiv$ denote rational linear and numerical equivalence.
  A divisor is pseudo-effective if its numerical class is in the closure of the cone generated by effective
  divisors, and big if its class lies in the interior of that cone. Its Iitaka dimension is denoted by $kappa$.
  Over $bb(C)$, a very general point means a point outside a specified countable union of proper closed subsets.

For a nef divisor $N$, its nef reduction is an almost holomorphic dominant rational map with connected compact
  general fibres, on which $N$ is numerically trivial, such that every curve through a very general point not
  contracted by the map has positive $N$-degree [2]. Its base dimension is the #emph[nef dimension]
  $n \( X \, N \)$. Thus $n \( X \, N \) = dim X$ precisely when every curve through a very general point has
  positive $N$-degree. This numerical condition does not assert bigness.

For a pseudo-effective real divisor $D$ on a smooth variety and a prime divisor $Gamma$,
  fix an ample divisor $A$ and set

$ sigma_Gamma \( D \) = lim_(delta arrow.b 0) inf { "mult"_Gamma D' : D' gt.eq 0 \, med D' tilde.op_(bb(R)) D +
  delta A } . $

These numbers are independent of $A$ and depend only on the numerical class of $D$.
  The divisorial Zariski decomposition is

$ N_sigma \( D \) = sum_Gamma sigma_Gamma \( D \) Gamma \, wide P_sigma \( D \) = D - N_sigma \( D \) . $

The sum has finite support. A nef divisor has $N_sigma \( D \) = 0$.
  Further properties from [27,22] are recorded at their point of use in Section 8.

#thm([Lemma 2.1.])[
  #emph[Let $D$ be a pseudo-effective rational Cartier divisor on a projective complex variety $X$.
    Every integral curve through a sufficiently very general point has nonnegative $D$-degree.]
] <lemma:pseudo-vg>

#proof[
  Fix an ample Cartier divisor $A$ and positive rational numbers $delta_i arrow.r 0$.
    Each $D + delta_i A$ is big, so there is an effective rational divisor $E_i tilde.op_(bb(Q)) D + delta_i A$.
    Choose a point outside $union.big_i "Supp" E_i$. A curve through it is contained in none of these supports;
    hence $\( D + delta_i A \) dot.op C gt.eq 0$ for every $i$. Let $i arrow.r oo$. ◻
]

We state explicitly the companion results used throughout.
  We require existence of a terminating choice of program, rather than termination of every sequence of flips.

#thm([Theorem 2.2.])[
  (Log abundance, [28] Theorem 1.1).  #emph[Let $\( X \, B \)$ be a projective log canonical $bb(Q)$-pair over an
    algebraically closed field of characteristic zero. If $K_X + B$ is nef, then it is semiample.]
] <input:abundance>

For the next input a nef rational Cartier b-divisor is specified by a nef rational Cartier divisor on a projective
  birational model; it is pulled back unchanged on all higher models.
  Its trace on a lower model is its pushforward and need not be nef.
  Generalized discrepancies are defined by pulling back the adjoint while keeping this fixed nef data.

#thm([Theorem 2.3.])[
  (Minimal-model programs, [29] Theorem 1.1 and Section 3.3).  #emph[Let $\( X \, B + upright(bold(M)) \)$ be a
    projective generalized klt $bb(Q)$-pair over $bb(C)$, with $X$ $bb(Q)$-factorial and with fixed nef rational
    Cartier b-divisor data. If $K_X + B + M_X$ is pseudo-effective,
    there is a terminating choice of its minimal-model program,
    with $bb(Q)$-factorial generalized klt models and a nef endpoint.
    The program extracts no divisors and generalized log discrepancies do not decrease.
    On a common resolution of its initial and final models, the pullback of the initial adjoint is the pullback of
    the final adjoint plus an effective divisor exceptional over the final model.]
] <input:models>

The ordinary klt case follows by taking the nef data to be zero.
  In that case Theorem 4 makes the endpoint a good minimal model.
  The moving-center and Frobenius results used from [28] are stated separately in Sections 4 and 6;
  neither theorem above asserts abundance for a nonzero generalized nef summand.

== 3 Reduction of full nef dimension to Calabi–Yau pairs <sec:reduction>

We work over $bb(C)$ until the final descent argument. The reductions in this section follow the strategy of
  Lazić–Peternell [22] Sections 4 and 5. We use the terminating programs in Theorem 5,
  together with the abundance input Theorem 4, to make the precise reductions needed below.
  The essential point is to retain control of two adjoints:
  an ordinary semiample adjoint and a nearby generalized nef adjoint.

=== 3.1 The induction statements <the-induction-statements>

For a projective klt $bb(Q)$-pair $\( X \, B \)$ and a nef $bb(Q)$-Cartier divisor $M$ on $X$, write

$ T = K_X + B . $

Suppose that $T$ is pseudo-effective. We will use the condition that, for some $a in bb(Q)_(> 0)$,

#[#set math.equation(numbering: n => "(3.1)")
 $ \( T + a M \) dot.op C > 0 quad upright("for every integral curve ") C
   upright(" through a very general point of ") X upright(".") $ <eq:full-condition>]

The divisor $T + a M$ need not be nef. By Lemma 3, Condition (3.1) holds whenever $M$ has full nef dimension.
  When $T + a M$ is nef, the condition says exactly that its nef dimension is $dim X$.

We prove the following two assertions together, by induction on $n$.
  The notation $P_sigma$ denotes the positive part of the divisorial Zariski decomposition;
  its properties used in the proof are recalled in Section 8.

*$\( P_n \)$* If $\( X \, B \)$ is a projective klt $bb(Q)$-pair of dimension $n$, $T = K_X +
  B$ is pseudo-effective, $M$ is a nef $bb(Q)$-Cartier divisor on $X$, and (3.1) holds, then $T +
  c M$ is big for every $c in bb(Q)_(> 0)$.
*$\( Z_n \)$* If $\( X \, B \)$ and $M$ have the same hypotheses, without (3.1),
  then there is a projective birational morphism $w : W arrow.r X$ from a smooth projective variety such that
  $ P_sigma #scale(x: 120%, y: 120%)[\(] w^(*) \( T + M \) #scale(x: 120%, y: 120%)[\)] $
  is a rational divisor numerically equivalent to a semiample $bb(Q)$-divisor on $W$.

Both assertions hold in dimensions zero and one. In dimension one,
  pseudo-effectivity of $T$ and nefness of $M$ mean that their degrees are nonnegative.
  Condition (3.1) makes every positive combination have positive degree, hence be ample.
  A divisor of degree zero is numerically equivalent to zero, and a divisor of positive degree is ample.
  These observations also give $\( Z_1 \)$, since a nef divisor has zero negative part.
  On a point the assertions use the usual conventions.

Fix $n gt.eq 2$, and assume $\( P_j \)$ and $\( Z_j \)$ for $j < n$.
  At any stage we may replace $X$ by a small projective $bb(Q)$-factorialization.
  The ordinary adjoint pulls back crepantly, $M$ pulls back to a nef divisor,
  and (3.1) persists by using points in the isomorphism locus. Bigness descends under this birational pullback.
  A smooth model proving $\( Z_n \)$ for the $bb(Q)$-factorialization also proves it for $X$.
  We therefore impose $bb(Q)$-factoriality when running the programs below.

=== 3.2 Keeping a semiample adjoint fixed <keeping-a-semiample-adjoint-fixed>

We first record the elementary ray comparison used in the second program.
  The nef part of a generalized pair in this argument is the fixed nef $bb(Q)$-Cartier b-divisor determined by $M$
  on the original variety. Its trace on a later model need not be nef.

#thm([Lemma 3.1.])[
  #emph[Let $\( V \, Delta + upright(bold(N)) \)$ be a projective generalized klt $bb(Q)$-pair of dimension $n$,
    with effective boundary, $bb(Q)$-factorial $V$, and nef rational Cartier b-divisor data.
    Every $\( K_V + Delta + N_V \)$-negative extremal ray has an integral rational curve generator $C$ for which
$ - 4 n lt.eq \( K_V + Delta + N_V \) dot.op C < 0 . $

 The contraction, and the flip when it is small, can be realized using an ordinary klt adjoint negative on the
   same ray. Birational MMP outputs remain $bb(Q)$-factorial.
   On a common resolution of a birational step, the pullback of the input generalized adjoint equals the pullback
   of its output transform plus an effective divisor exceptional over the output.]
] <lemma:generalized-ray-bound>

#proof[
  Set $G = K_V + Delta + N_V$, and fix a $G$-negative extremal ray.
    For an ample rational divisor $A$ on $V$, choose $eta > 0$ rational and small enough that $G +
    eta A$ is still negative on the ray and
  $ - \( G + eta A \) dot.op gamma gt.eq - 1 / 2 G dot.op gamma $
  for its nonzero classes $gamma$. We may represent $G + eta A$ as an ordinary klt adjoint.
    Here is the reason this remains valid when the nef b-divisor does not descend to $V$.
  Choose a projective log resolution $h : V' arrow.r V$ carrying its nef part $N'$ and write
  $ K_(V') + Delta' + N' = h^(*) G . $
  The coefficients of $Delta'$ are strictly less than one. The resolution can be chosen with an effective
    exceptional divisor $F$ such that $- F$ is $h$-ample. For sufficiently small rational $epsilon > 0$,
    the divisor $N' + eta h^(*) A - epsilon F$ is ample. A general effective rational representative of this ample
    class can be chosen with sufficiently small coefficients that, after adding $epsilon F$,
    it preserves the sub-klt condition of $Delta'$. Its pushforward, added to $Delta$,
    is effective and defines a klt boundary $Theta$ on $V$ with
  $ K_V + Theta tilde.op_(bb(Q)) G + eta A . $
  The crepant equality can be checked upstairs: its difference is exceptional and relatively numerically trivial,
    hence zero by negativity.
  The ordinary cone theorem now gives a rational curve generator $C$ with $0 < - \( G + eta A \) dot.op C lt.eq
    2 n$. The preceding comparison yields $- G dot.op C lt.eq 4 n$.
    The contraction $c : V arrow.r S$ is the contraction of the same ray for this ordinary klt pair.
    Since its relative Picard number is one, there is a rational $lambda > 0$ such that $G -
    lambda \( K_V + Theta \)$ is numerically trivial over $S$.
    The Cartier descent statement for an ordinary klt extremal contraction, after clearing denominators,
    gives a rational Cartier divisor $D_S$ with
  $ G - lambda \( K_V + Theta \) tilde.op_(bb(Q)) c^(*) D_S . $
  In the small case, let $c^(+) : V^(+) arrow.r S$ be the ordinary flip. Taking strict transforms gives
  $ G^(+) tilde.op_(bb(Q)) lambda \( K_(V^(+)) + Theta^(+) \) + \( c^(+) \)^(*) D_S \, $
  which is ample over $S$. Thus the ordinary flip is also the flip of $G$.
    The ordinary contraction and flip preserve $bb(Q)$-factoriality on the birational output.
    Their effective exceptional adjoint comparison, multiplied by $lambda$, gives the asserted comparison for $G$,
    since the terms pulled back from $S$ cancel. With the nef b-divisor fixed,
    this comparison is also the improvement of generalized discrepancies used below. ◻
]

#thm([Lemma 3.2.])[
  #emph[Let $\( X \, B \)$ be a projective $bb(Q)$-factorial klt $bb(Q)$-pair of dimension $n$, let $T = K_X +
    B$ be pseudo-effective, and let $M$ be a nef $bb(Q)$-Cartier divisor on $X$. Suppose (3.1) holds.
    Then there are a birational contraction $X arrow.r.dashed Y$, a number $s_0 in bb(Q)_(> 0)$,
    and a common smooth projective resolution
$ X arrow.l^p W arrow.r^q Y $

 with the following properties. If $B_Y$ and $N$ denote the transforms of $B$ and $M$, and $U = K_Y + B_Y$, then]
  + #emph[$\( Y \, B_Y \)$ is klt and $bb(Q)$-factorial, $U$ is semiample, and $kappa \( Y \, U \) =
    kappa \( X \, T \) gt.eq 0$;]
  + #emph[$N$ is pseudo-effective, and $U + s_0 N$ is nef of full nef dimension;]
  + #emph[there are effective $q$-exceptional rational divisors $E_0 \, E_1$ on $W$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ p^(*) T = q^(*) U + E_0 \, wide p^(*) \( T + s_0 M \) = q^(*) \( U + s_0 N \) + E_1 . $ <eq:two-comparisons>]

]
] <lemma:two-nef-model>

#proof[
  By Theorem 5, there is a terminating $T$-MMP, ending on a $bb(Q)$-factorial klt pair $\( Y_0 \, B_0 \)$ with nef
    adjoint $U_0 = K_(Y_0) + B_0$. Theorem 4 makes $U_0$ semiample.
    The effective exceptional comparisons for the program give
  $ kappa \( X \, T \) = kappa \( Y_0 \, U_0 \) gt.eq 0 . $
  Let $N_0$ be the transform of $M$. It is the trace on $Y_0$ of the fixed nef b-divisor determined by $M$ on $X$.
  Because this first program has finitely many steps, there is a rational $s >
    0$ such that every one of them remains negative for the transform of $T + u M$,
    for every rational $u in \( 0 \, s \]$. Choose $s$ also small enough to retain the strict sign on the flipped
    side of each flip. These are therefore programs for the corresponding generalized klt pairs:
    they start generalized klt on $X$, and their discrepancies improve at each step.
    In particular, $\( Y_0 \, B_0 + s upright(bold(M)) \)$ is generalized klt.
    Pushforward to a $bb(Q)$-factorial model preserves pseudo-effectivity, so $N_0$ is pseudo-effective.
  For completeness, this last numerical assertion applies also to birational contractions with flips.
    On a common resolution, numerical pushforward to a $bb(Q)$-factorial target is well defined:
    if a divisor upstairs is numerically trivial, its difference from the pullback of its pushforward is
    exceptional and relatively numerically trivial, and the negativity lemma makes that difference zero.
    Effective approximation then proves preservation of pseudo-effectivity.
  Choose $d > 0$ so that $d U_0$ is Cartier and globally generated. Choose a rational $s_0 in \( 0 \, s \)$ such that
  #[#set math.equation(numbering: n => "(3.3)")
   $ frac(1 - s_0 \/ s, d) > 4 n s_0 / s . $ <eq:small-nef-coefficient>]
  The generalized adjoint $U_0 + s_0 N_0$ is pseudo-effective.
    Apply Theorem 5 to obtain a terminating program for it. We claim that every step is $U_0$-trivial and is also
    negative for the generalized adjoint with coefficient $s$,
    where throughout this claim the symbols denote their transforms.
  Suppose the claim holds up to the next step, and denote the current transforms by $U_i \, N_i$.
    Then $d U_i$ is still Cartier and free, and the pair with nef b-divisor coefficient $s$ is generalized klt.
    For a $\( U_i + s_0 N_i \)$-negative ray, the equality
  $ U_i + s_0 N_i = \( 1 - s_0 \/ s \) U_i + \( s_0 \/ s \) \( U_i + s N_i \) $
  and nefness of $U_i$ show that the ray is $\( U_i + s N_i \)$-negative.
    Choose its rational curve generator $C$ by Lemma 6. If $U_i dot.op C > 0$,
    then integrality of $d U_i$ gives $U_i dot.op C gt.eq 1 \/ d$, whence
  $ \( U_i + s_0 N_i \) dot.op C gt.eq frac(1 - s_0 \/ s, d) - 4 n s_0 / s > 0 \, $
  a contradiction. Thus $U_i$ is trivial on the ray.
  The morphism defined by $d U_i$ is constant on every fibre of the extremal contraction and factors through it.
    Its descended line bundle is globally generated; pulling it to the flipped model, when there is a flip,
    gives the transform of $d U_i$. Hence that transform is again Cartier and free,
    with equal pullbacks on a common resolution. Since the step is also negative for coefficient $s$,
    generalized klt singularities with that coefficient persist.
    This proves the claim by induction through the finite program.
  Let $Y$ be its output. The ordinary adjoint $U$ is crepant throughout the second program,
    so $\( Y \, B_Y \)$ is klt, $U$ is semiample, and its Iitaka dimension equals that of $T$.
    The generalized adjoint $U + s_0 N$ is nef. Combining the pullback comparisons of the two programs gives (3.2)
    with effective $q$-exceptional divisors. The transform $N$ remains pseudo-effective.
  It remains to prove full nef dimension. Suppose instead that the nef reduction of $U +
    s_0 N$ has a positive-dimensional very general compact fibre $F$.
    Shrink the base of the almost holomorphic map so that these compact fibres lie entirely in its morphism locus.
    The image in $Y$ of the exceptional locus of $q$ has codimension at least two.
    A general fibre $F$ meets each of its components in codimension at least two, or not at all:
    discard the images of components that do not dominate the nef-reduction base,
    and use the fibre dimension theorem for the others. We may therefore choose a curve $C subset
    F$ through a very general point, avoiding this exceptional image.
    If $dim F > 1$, take sufficiently general complete intersections in $F$ through that point; if $dim F = 1$,
    take $F$ itself.
  Choose the point also in the common isomorphism locus of the birational contraction and with the very general
    conditions of (3.1) transported from $X$. Since $U$ is nef and $N$ is pseudo-effective, Lemma 3 gives
  $ U dot.op C = N dot.op C = 0 \, $
  because their positive combination has degree zero on $F$.
    The strict lift $tilde(C) subset W$ avoids $E_0$ and $E_1$. Both equalities in (3.2) then give
  $ p^(*) T dot.op tilde(C) = p^(*) M dot.op tilde(C) = 0 . $
  The curve $p \( tilde(C) \)$ passes through the chosen very general point of $X$ and contradicts (3.1). ◻
]

=== 3.3 Positive Iitaka dimension and the remaining case <positive-iitaka-dimension-and-the-remaining-case>

The preceding construction leaves only one obstruction to bigness:
  the ordinary semiample adjoint may define a map to a point.
  If it defines a positive-dimensional base, the induction hypothesis handles its fibres.

#thm([Proposition 3.3.])[
  #emph[Assume $\( P_j \)$ for $j < n$. Let $\( X \, B \)$ be a projective klt $bb(Q)$-pair of dimension $n$,
    let $T = K_X + B$ be pseudo-effective, and let $M$ be a nef $bb(Q)$-Cartier divisor on $X$.
    If (3.1) holds and $kappa \( X \, T \) > 0$, then $T + c M$ is big for every $c in bb(Q)_(> 0)$.]
] <prop:full-positive>

#proof[
  After a small $bb(Q)$-factorialization, apply Lemma 7. Let $h : Y arrow.r
    S$ be the contraction defined by the semiample divisor $U$.
    There is an ample rational divisor $A_S$ on $S$ with $U tilde.op_(bb(Q)) h^(*) A_S$, and $dim S =
    kappa \( X \, T \) > 0$. Put $Q = U + s_0 N$.
  If a very general fibre $F$ has positive dimension, it has dimension strictly less than $n$.
    The restriction pair $\( F \, B_Y \|_F \)$ is klt and
  $ K_F + B_Y \|_F tilde.op_(bb(Q)) U \|_F tilde.op_(bb(Q)) 0 . $
  Moreover, $Q \|_F$ is nef of full nef dimension. Indeed, a very general point of a very general $F$ can be
    chosen outside the countable union excluded in the full-nef-dimension assertion for $Q$ on $Y$.
    Since $U \|_F equiv 0$, the divisor $N \|_F$ is nef. Apply $\( P_(dim F) \)$ to this restriction pair and $s_0
    N \|_F$ to conclude that $Q \|_F$ is big. When the fibre dimension is zero, relative bigness is automatic.
  Thus $Q$ is big over $S$. To justify the passage to the generic fibre,
    fix an ample Cartier divisor $H$ on $Y$ and shrink $S$ so that $h$ is flat.
    For every positive integer $ell$ clearing the denominators of $Q$, upper semicontinuity makes the locus
  $ { s in S : H^0 \( F_s \, cal(O)_(F_s) \( \( ell Q - H \) \|_(F_s) \) \) eq.not 0 #scale(x: 120%, y: 120%)[}] $
  closed. Bigness on a very general fibre puts its base point in one of these countably many loci.
    Choose that point outside every locus that is proper; the locus containing it must then be all of $S$.
    On the generic fibre, $ell Q$ is consequently the sum of the ample divisor $H$ and an effective divisor,
    which proves the asserted relative bigness. A relatively big divisor becomes big after adding a sufficiently
    large pullback of an ample divisor on the base; equivalently,
    apply the usual relative form of Kodaira’s lemma [3] Lemma 3.2.1. It follows that
  $ Q + b U = \( 1 + b \) U + s_0 N $
  is big for some rational $b > 0$. Equation (3.2) then shows that $\( 1 + b \) T + s_0 M$ is big.
  Finally, fix $c > 0$ rational and choose $lambda > 0$ rational with $lambda \( 1 + b \) < 1$ and $lambda s_0 <
    c$. Then
  $ T + c M = lambda #scale(x: 120%, y: 120%)[\(] \( 1 + b \) T + s_0 M #scale(x: 120%, y: 120%)[\)] +
    #scale(x: 120%, y: 120%)[\(] 1 - lambda \( 1 + b \) #scale(x: 120%, y: 120%)[\)] T + \( c - lambda s_0 \) M . $
  The first summand is big and the other two are pseudo-effective. Their sum is big, as required. ◻
]

#thm([Proposition 3.4.])[
  #emph[Assume $\( P_j \)$ for $j < n$. Suppose that on every projective klt $bb(Q)$-pair $\( V \, Delta \)$ of
    dimension $n$ with $K_V + Delta equiv 0$, every nef $bb(Q)$-Cartier divisor of full nef dimension is big.
    Then $\( P_n \)$ holds.]
] <prop:reduction-cy>

#proof[
  Use a small $bb(Q)$-factorialization and Lemma 7. The nonnegative Iitaka dimension of $T$ is either positive,
    in which case Proposition 8 applies, or zero. In the latter case,
    semiampleness of $U$ implies $U tilde.op_(bb(Q)) 0$. The pair $\( Y \, B_Y \)$ is therefore a klt Calabi–Yau
    pair. The nef divisor $U + s_0 N$ has full nef dimension, so it is big by the stated hypothesis.
    The second equality in (3.2) gives bigness of $T + s_0 M$.
    The positive-combination argument at the end of Proposition 8 gives bigness of $T +
    c M$ for every rational $c > 0$. ◻
]

Consequently, the remaining work for $\( P_n \)$ is the full-nef-dimension statement on klt Calabi–Yau pairs.
  Theorem 17 establishes its terminal, zero-boundary form. We then pass from that form to all klt Calabi–Yau pairs
  in Section 7.

== 4 Bounded-degree curves and moving jet kernels <sec:jet-tools>

The geometric argument will produce subvarieties with bounded degree and bounded canonical intersection.
  We first explain how these bounds contradict a growing lower bound for the degrees of curves.
  We then record the moving-center results from [28] that supply the required subvarieties.
  All varieties in this section are over $bb(C)$.

=== 4.1 The bounded-degree obstruction <the-bounded-degree-obstruction>

#thm([Lemma 4.1.])[
  (Bounded-degree curves).  #emph[For every integer $f gt.eq
    1$ there is an integer $m_f > 0$ with the following property.
    Let $Y$ be a smooth integral projective variety of dimension $f$,
    let $D_0$ be a reduced simple normal crossing divisor or the zero divisor,
    and let $L_0$ be a nef integral Cartier divisor of full nef dimension on $Y$.
    Suppose that $P_0$ is a nef rational Cartier divisor and that $r \, C_0 \, C_1$ are positive real numbers satisfying
$ 0 < P_0^f lt.eq C_0 \, wide P_0 - r L_0 upright(" is nef") . $

 If $A_0 = K_Y + D_0 + L_0$ is big and
#[#set math.equation(numbering: n => "(4.1)")
 $ A_0 dot.op P_0^(f - 1) lt.eq C_1 P_0^f \, $ <j:adjoint-ratio>]

 then
#[#set math.equation(numbering: n => "(4.2)")
 $ r lt.eq \( m_f C_1 \)^(f - 1) C_0 . $ <j:bounded-curve-obstruction>]

 The integer $m_f$ depends only on $f$, and not on the variety or the divisors.
   For dimensions $1 lt.eq f lt.eq n$, one may replace all $m_f$ by a single integer $m$ depending only on $n$.]
] <lemma:bounded-curves>

#proof[
  The pair $\( Y \, D_0 \)$ is log canonical, its boundary coefficients belong to ${ 0 \, 1 }$,
    and its nef polarizing divisor $L_0$ has Cartier index one.
    By [4] Theorem 1.3, an integer $m_f$ depending only on these data makes $\| m_f A_0 \|$ birational.
    Here $A_0$ is integral Cartier, so no rounding or additional denominator is involved.
  Resolve the base ideal by a projective birational morphism $mu : tilde(Y) arrow.r Y$, with $tilde(Y)$ smooth,
    and write
  $ mu^(*) \( m_f A_0 \) = H + F \, $
  where $H$ is the basepoint-free moving part and $F$ is effective.
    The morphism defined by $H$ is birational onto its image; in particular $H$ is nef and big.
    In the rest of this proof, $P_0$ and $L_0$ denote their pullbacks to $tilde(Y)$.
    Effectivity of $F$ and nefness of $P_0$ give
  #[#set math.equation(numbering: n => "(4.3)")
   $ H dot.op P_0^(f - 1) lt.eq m_f C_1 P_0^f . $ <j:moving-adjoint-degree>]
  For $f gt.eq 2$, put $s_i = P_0^(f - i) dot.op H^i$ for $0 lt.eq i lt.eq f$.
    Both divisors are nef and big, so the $s_i$ are positive.
    The Khovanskii–Teissier inequalities [21] Corollary 1.6.3(i) and Example 1.6.4 $s_i^2 gt.eq
    s_(i - 1) s_(i + 1)$ show that the ratios $s_i \/ s_(i - 1)$ decrease. Hence
  #[#set math.equation(numbering: n => "(4.4)")
   $ P_0 dot.op H^(f - 1) lt.eq P_0^f (frac(H dot.op P_0^(f - 1), P_0^f))^(f - 1) lt.eq \( m_f C_1 \)^(f - 1)
     C_0 . $ <j:mixed-degree>]
  Choose a very general point $y in tilde(Y)$ over the isomorphism opens of both $mu$ and the morphism defined by
    $H$. We also choose $mu \( y \)$ in the very general locus that tests full nef dimension of $L_0$.
    Pull back $f - 1$ general hyperplanes through the image of $y$ under the morphism defined by $H$.
    This subsystem has only the base point $y$, so the general members meet properly and define an effective curve
    cycle of class $H^(f - 1)$; the component $C$ through $y$ is a curve because their local equations are
    independent at $y$. Nefness gives
  $ P_0 dot.op C lt.eq P_0 dot.op H^(f - 1) . $
  The curve $C$ is not contracted by $mu$, and its image passes through the chosen very general point.
    Full nef dimension and integrality therefore give $L_0 dot.op C gt.eq 1$.
    Since $P_0 - r L_0$ is nef, we obtain $P_0 dot.op C gt.eq r$, which proves (4.2).
  If $f = 1$, take $C = Y$ directly. Then $P_0 dot.op Y gt.eq r L_0 dot.op Y gt.eq r$,
    and the required bound is $r lt.eq C_0$. Finally, [4] Theorem 1.3 applies to every multiple of its prescribed
    integer. A common multiple of the finitely many integers $m_1 \, dots.h \,
    m_n$ therefore gives the last assertion. ◻
]

In particular, the hypotheses of Lemma 10 cannot hold along a sequence with $r arrow.r oo$ and with $C_0 \,
  C_1$ bounded, even if the varieties and divisors vary. The following observation explains how full nef dimension
  and pseudo-effectivity of the canonical divisor pass to the moving subvarieties used below.

#thm([Lemma 4.2.])[
  (Very general images).  #emph[Let $X$ be a normal integral projective variety that is not uniruled,
    and let $L$ be a nef Cartier divisor of full nef dimension on $X$.
    There is a complement $X^compose$ of a countable union of proper closed subsets of $X$ with the following
    property. If $Y$ is a smooth integral projective variety and $g : Y arrow.r
    X$ is generically finite onto a positive-dimensional image meeting $X^compose$,
    then $g^(*) L$ has full nef dimension, $Y$ is not uniruled, and $K_Y$ is pseudo-effective.]
] <j:very-general-images>

#proof[
  Choose $X^compose$ so that every curve through any of its points has positive $L$-degree and no rational curve
    meets $X^compose$. The first condition is the very general characterization of full nef dimension.
    For the second, rational curves are parametrized by countably many algebraic families;
    the closure of the evaluation image of each such family is proper because $X$ is not uniruled.
  Since $g \( Y \)$ meets $X^compose$, it is contained in none of the closed sets excluded in its definition.
    A very general point of $Y$ thus maps into $X^compose$ and lies in the quasi-finite locus of $g$.
    Every curve through such a point has a curve as its image, so its $g^(*) L$-degree is positive.
    This proves full nef dimension. A covering family of rational curves on $Y$ would similarly give a nonconstant
    rational curve meeting $X^compose$, a contradiction. The pseudo-effectivity of $K_Y$ now follows from [6]. ◻
]

=== 4.2 Subadjunction and high-multiplicity components <subadjunction-and-high-multiplicity-components>

We use the following five results from the section #emph[Tools for moving base components] of [28].
  Their hypotheses distinguish generic information along a center from global information about the ambient
  variety. Intersections on an integral subvariety are computed after pullback to its normalization and a smooth
  projective resolution. A base ideal is #emph[isolated at the generic point] of a subvariety when its
  localization there is primary for the maximal ideal.

#thm([Lemma 4.3.])[
  (Numerical generic subadjunction, [28], Lemma 7.1).  #emph[Let $Z$ be a projective $bb(Q)$-factorial klt
    variety, let $Theta gt.eq 0$ be a rational divisor, and let $V subset Z$ be integral of dimension $f > 0$.
    Suppose that $\( Z \, Theta \)$ is log canonical at the generic point of $V$ and has a divisor of log
    discrepancy zero with center $V$. If $P$ is a nef rational Cartier divisor on $V$ and $rho : V^(*) arrow.r
    V$ is a smooth projective resolution factoring through its normalization, then
$ K_(V^(*)) dot.op \( rho^(*) P \)^(f - 1) lt.eq \( K_Z + Theta \) \|_V dot.op P^(f - 1) . $

]
] <j:subadjunction>

Only generic log canonicity is required. The proof in [28] uses the dlt modification of [13] Theorem 2.10,
  whose truncated boundary leaves an effective surplus supported over the non-lc locus.
  On a minimal stratum over $V$, adjunction gives a pair that is klt over the generic point of its connected-fiber
  base. This suffices for the klt-trivial canonical bundle formula and its b-nef moduli divisor [12]
  Definition 3.1 and Theorem 3.5. The effective discriminant, the moduli divisor,
  and finite ramification have nonnegative intersections with the pulled-back nef class.
  The comparison uses canonical Weil cycles, so it requires no $bb(Q)$-Gorenstein assumption on the normalization
  of $V$.

#thm([Lemma 4.4.])[
  (A base component of high multiplicity, [28], Lemma 7.2).  #emph[Let $Z$ be a projective $bb(Q)$-factorial klt
    variety of dimension $d$, let $R$ be a nef rational Cartier divisor,
    and let $k > 0$ be an integer such that $k R$ is Cartier.
    Let $0 eq.not cal(H) subset H^0 \( Z \, cal(O)_Z \( k R \) \)$ be a linear subspace with proper base locus and
    base ideal $frak(b)$. Suppose that $V$ is an integral base-locus component of dimension $f < d$,
    isolated at its generic point $eta_V$, and that $eta_V in Z_(upright("sm"))$.
    Let $frak(m)$ be the maximal ideal of $cal(O)_(Z \, eta_V)$.
    If $frak(b) cal(O)_(Z \, eta_V) subset frak(m)^h$ for an integer $h > 0$,
    there are a rational number $0 < c lt.eq \( d - f \) k \/ h$ and an effective rational divisor $Theta
    tilde.op_(bb(Q)) c R$ such that $\( Z \, Theta \)$ is log canonical at $eta_V$ and has a log canonical place
    centered on $V$. The degree and canonical bounds are
#[#set math.equation(numbering: n => "(4.5)")
 $ R^f dot.op V & lt.eq \( k \/ h \)^(d - f) R^d \,\
K_(V^(*)) dot.op R^(f - 1) & lt.eq \( K_Z + c R \) \|_V dot.op R^(f - 1) wide \( f > 0 \) \, $ <j:base-bounds>]

 where $V^(*)$ is a smooth projective resolution. The degree bound also holds for $f = 0$.]
] <j:base-component>

The degree estimate is the local multiplicity bound $h^(d - f)$ combined with successive general cuts by the given
  linear series. The boundary is obtained by averaging general members with total coefficient equal to the generic
  log canonical threshold of $frak(b)$. Thus it is an actual divisor to which Lemma 12 applies.

=== 4.3 Full jet kernels and restriction to a fiber <full-jet-kernels-and-restriction-to-a-fiber>

#thm([Lemma 4.5.])[
  (Moving multiplicity, [28], Lemma 7.3).  #emph[Let $Z$ be an integral projective variety of dimension $d$,
    let $R$ be a nef, big, semiample rational Cartier divisor,
    and fix an integer $k > 0$ such that $k R$ is Cartier. Choose positive real numbers $tau_0 < dots.h.c <
    tau_d$ with consecutive gap $delta > 0$. For $x in Z_(upright("sm"))$, put
$ cal(H)_i \( x \) = H^0 #scale(x: 120%, y: 120%)[\(] Z \,
  cal(O)_Z \( k R \) ⊗ frak(m)_x^(ceil.l k tau_i ceil.r) #scale(x: 120%, y: 120%)[\)] . $

 Suppose that for very general $x$ all these spaces are nonzero and the base locus of $cal(H)_0 \( x \)$ has a
   positive-dimensional component through $x$. If $k delta gt.eq 4$, then,
   after an algebraic parameter extension and restriction to nonempty opens,
   there are an integral parameter variety $T$ with a dominant marked-point map $x : T arrow.r Z_(upright("sm"))$,
   a fixed index $i in { 0 \, dots.h \, d - 1 }$, and a family of integral subvarieties $V_t$ containing
   $x \( t \)$ and common to the base loci of $cal(H)_i \( x \( t \) \)$ and $cal(H)_(i + 1) \( x \( t \) \)$.
   In particular, the incidence
$ Gamma = { \( t \, z \) : z in V_t } subset T times Z $

 dominates $Z$.]
  #emph[For general $t$, the dimension $f$ of $V_t$ lies in $\[ 1 \, d - 1 \]$,
    $V_t$ is an isolated component of the higher base locus at its generic point,
    and the entire higher-kernel base ideal is contained there in the ordinary power $cal(I)_(V_t)^h$, where
$ h = ceil.l k delta \/ 2 ceil.r \, wide k \/ h lt.eq 2 \/ delta . $

 The incidence base ideal is likewise contained in $cal(I)_Gamma^h$ on a dense open of $Gamma$.
   These containments are taken in the smooth ambient open. If $Z$ is also $bb(Q)$-factorial and klt, then
#[#set math.equation(numbering: n => "(4.6)")
 $ R^f dot.op V_t & lt.eq \( 2 \/ delta \)^(d - f) R^d \,\
K_(V_t^(*)) dot.op R^(f - 1) & lt.eq \( K_Z + c R \) \|_(V_t) dot.op R^(f - 1) \, wide 0 < c lt.eq
  2 \( d - f \) \/ delta . $ <j:moving-bounds>]

 The top intersection on $V_t$ is positive when $V_t$ meets the open on which the big semiample contraction is an
   isomorphism.]
] <j:moving-kernel>

The use of the full kernels matters: differentiation in the parameter lowers vanishing at the moving mark and
  still gives a global section in the lower kernel. Incidence dominance makes these parameter directions span the
  normal directions. The vanishing of all derivatives of order less than $h$ then gives the ordinary-power
  containment, which can be restricted to general fibers as follows.

#thm([Lemma 4.6.])[
  (Restriction of an isolated base ideal, [28], Lemma 7.4).  #emph[In the setting of Lemma 14, let $g : Z arrow.r
    B$ be a morphism. There is a dense open of the incidence with the following property.
    Choose $\( t \, z \)$ in this open, put $b = g \( z \)$, and suppose that $V_t$ is smooth over a smooth open
    of its actual image at $z$. Let $F$ be the reduced component through $z$ of the scheme fiber of $V_t arrow.r
    g \( V_t \)$. Near $z$ in $Z_b$, the restricted higher-kernel base ideal has support exactly $F$ and is
    contained in the ordinary power $cal(I)_F^h$.]
  #emph[If $F$ is proper in an integral ambient fiber component containing it,
    the restricted series is nonzero there and $F$ is an isolated base component at its generic point.
    Applying Lemma 13 on that ambient component additionally requires its projectivity, $bb(Q)$-factoriality,
    klt singularities, and smoothness at the generic point of $F$.]
] <j:fiber-restriction>

Here the fiber is chosen through a general incidence point.
  The statement does not assert the same conclusion for an arbitrary special fiber.
  Smoothness over the actual image identifies the restricted ideal of $V_t$ with the reduced ideal of $F$ locally;
  this is what preserves ordinary powers.

The $bb(Q)$-factoriality needed for the base-component estimates can also be supplied by a small projective
  $bb(Q)$-factorialization $sigma : Z' arrow.r Z$ of a klt ambient variety.
  This passage is made only for components that meet the isomorphism open of $sigma$.
  Their strict transforms retain the generic base-ideal and multiplicity conditions for the pulled-back series,
  and the testing class $sigma^(*) R$ is nef. Since $K_(Z') = sigma^(*) K_Z$,
  projection formula gives the same degree and canonical-intersection bounds on a common resolution.
  The pullback testing class need not be ample; nefness is the property used in these estimates.
  Passing to higher resolutions does not change the canonical intersections,
  because their additional exceptional divisors have zero intersection with the pulled-back testing class to the
  required power.

=== 4.4 Finite covers with a fixed branch complement <finite-covers-with-a-fixed-branch-complement>

A bound on the degree of a branched cover does not make the possible covers finite.
  The final companion input supplies the needed fixed branch complement from a family whose branch divisors do not
  sweep the base.

#thm([Lemma 4.7.])[
  (Finite covers after excluding sweeping branch divisors, [28],
    Lemma 7.5).  #emph[Let $Y$ be a normal integral projective variety, let $cal(V) arrow.r
    T$ be a smooth projective family with integral fibers over an integral parameter variety, and let $g :
    cal(V) arrow.r Y$ be a morphism. Suppose that the general fiber maps $g_t : V_t arrow.r
    Y$ are dominant and generically finite of degree at most a fixed integer $e$.]
  #emph[After a finite parameter extension and shrinking, spread the geometric generic components of the zero
    divisor of the relative Jacobian over $Y_(upright("sm"))$ to divisors $cal(R)_1 \, dots.h \,
    cal(R)_N$ in $cal(V)$. Retain this notation after the base change.
    Let $I$ consist of the indices $j$ for which $overline(g_t \( \( cal(R)_j \)_t \))$ is a divisor in $Y$ for
    general $t$. Assume that
$ overline(g \( cal(R)_j \)) eq.not Y wide \( j in I \) . $

 After shrinking again, there is a smooth nonempty open $Y^compose subset
   Y$ over which every general finite normal Stein cover of $g_t$ is finite étale.
   Only finitely many such normal covers of $Y$ occur, up to isomorphism over $Y$.
   The conclusion holds simultaneously for finitely many projections;
   the open and the finite lists may depend on all fixed parameters of the family.]
] <j:finite-covers>

To see the role of the hypothesis, remove $Y_(upright("sing"))$ and the finitely many proper image closures
  $overline(g \( cal(R)_j \))$ for $j in I$. Every branch prime of a general Stein cover is accounted for by one
  of these relative Jacobian components. Purity therefore makes the restricted covers étale.
  The fundamental group of the resulting smooth complex variety is finitely generated,
  so it has only finitely many covers of degree at most $e$.
  Finally, a finite normal cover of $Y$ is determined by its function field,
  hence by its restriction to this fixed open.

== 5 Jets on a terminal variety with trivial canonical class <sec:geometry>

The reduction to a Calabi–Yau pair leaves a positivity problem for a nef divisor:
  full nef dimension must imply bigness. We first treat the case with trivial canonical bundle and terminal
  singularities. The argument follows the scalar and two-slot jet constructions of [28] Sections 7–8.
  Its geometric exclusions differ from the nonvanishing argument there:
  lower-dimensional instances of $\( P_j \)$ and the polarized effective birationality theorem replace the
  exclusions for a canonical nonvanishing counterexample.

#thm([Theorem 5.1.])[
  #emph[Let $n gt.eq 2$, and assume $\( P_j \)$ for $j < n$.
    Let $X$ be a projective $bb(Q)$-factorial terminal complex variety of dimension $n$ with $K_X tilde.op 0$.
    If $L$ is a nef Cartier divisor on $X$ with full nef dimension, then $L$ is big.]
] <thm:terminal-big>

The proof occupies this section and Section 6. Assuming that $L$ is not big,
  we obtain two contrasting jet estimates: sections on $X$ have small normalized vanishing order,
  whereas a projective bundle over $X times X$ admits a large jet system.
  The Frobenius comparison will show that these estimates are incompatible.

=== 5.1 Normalization and the curve obstruction <normalization-and-the-curve-obstruction>

Throughout this section suppose that $X \, L$ form a counterexample to Theorem 17.
  Fix an ample Cartier divisor $A$ on $X$ and a positive rational number $epsilon.alt$ such that

#[#set math.equation(numbering: n => "(5.1)")
 $ \( 14 epsilon.alt \)^n < 1 / 4 \, wide 80 epsilon.alt < 3 / 4 . $ <j:epsilon>]

Let $t > 0$ tend to zero along a sequence of rational numbers. Since $L$ is nef and not big, $L^n = 0$.
  We may therefore choose positive integers $r = r \( t \)$ satisfying

#[#set math.equation(numbering: n => "(5.2)")
 $ P = P_t = r \( L + t A \) \, wide r arrow.r oo \, wide P^n arrow.r epsilon.alt^n . $ <eq:scaling>]

For example, round $epsilon.alt \/ \( \( L + t A \)^n \)^(1 \/ n)$ to the nearest positive integer.
  The divisor $P$ is ample and rational Cartier, and $P - r L$ is nef. After discarding finitely many terms, we have

#[#set math.equation(numbering: n => "(5.3)")
 $ epsilon.alt^n / 2 lt.eq P^n lt.eq 2 epsilon.alt^n . $ <j:volume-window>]

Every curve through a very general point of $X$ has positive integral $L$-degree, hence $P$-degree at least $r$.
  Thus a covering family of curves of bounded $P$-degree will give a contradiction.

We specify how the same obstruction applies to subvarieties and covers.
  A resolution $W arrow.r X$ has an effective canonical divisor:
  pull back a nowhere-zero canonical form on the smooth locus of $X$ and use terminality.
  Hence $W$, and therefore $X$, is not uniruled [6]. By Lemma 11,
  if a smooth projective variety $Y$ maps generically finitely to a positive-dimensional subvariety containing a
  sufficiently very general point of $X$, then $Y$ is not uniruled and the pulled-back Cartier divisor $L_Y$ has
  full nef dimension. In particular, $K_Y$ is pseudo-effective.
  If $f = dim Y < n$, the induction hypothesis $\( P_f \)$ applied to $\( Y \, 0 \)$ gives

#[#set math.equation(numbering: n => "(5.4)")
 $ K_Y + L_Y med upright("big") . $ <j:lower-big>]

All occurrences of “very general” below include the fixed conditions of Lemma 11.

Consequently, for $f < n$ it suffices to find on such a $Y$ a nef testing divisor $P_Y$ with

$ 0 < P_Y^f lt.eq C_0 \, wide P_Y - r L_Y med upright("nef") \, wide K_Y P_Y^(f - 1) lt.eq C P_Y^f \, $

where $C_0 \, C$ are independent of $t$. Indeed $L_Y P_Y^(f - 1) lt.eq P_Y^f \/ r$, so Lemma 10 applies.
  We will also use that lemma in dimension $n$, after proving the required bigness separately.
  For the rest of this section, a bound is called uniform if it is independent of $t$;
  it may depend on parameters fixed before $t$ tends to zero.
  Since the dimensions lie in a finite range, Lemma 10 excludes all such configurations once $r$ is sufficiently large.

=== 5.2 The scalar jet estimate <the-scalar-jet-estimate>

Put $rho = \( P^n \)^(1 \/ n)$. The first estimate bounds the vanishing order of every section at a very general
  point; it is stronger than a bound on a single fixed linear system.

#thm([Lemma 5.2.])[
  #emph[In the setting of (5.2), for all sufficiently small $t$ and at a very general point $x in X$,
    every nonzero section of $k P$, where $k$ is a positive integer and $k P$ is Cartier, satisfies
#[#set math.equation(numbering: n => "(5.5)")
 $ "ord"_x \( s \) lt.eq 4 k rho . $ <j:scalar-order>]

]
] <lemma:scalar-bound>

#proof[
  Suppose that violations occur for arbitrarily small $t$. Fix such a $t$.
    At a very general point a violation for some $k$ implies that the corresponding complete jet kernel is nonzero
    at the general point. Indeed the kernel ranks are algebraic rank conditions on the smooth locus,
    and there are only countably many choices of $k$ and of the required integral order.
    Raising the violating section to powers allows $k$ to be arbitrarily large and divisible.
  Choose $n + 1$ levels
  $ tau_i = 3 / 2 rho + i delta quad \( 0 lt.eq i lt.eq n \) \, wide delta = frac(2 rho, n) . $
  They all lie strictly between $rho$ and $4 rho$. For a sufficiently large divisible $k$,
    their full jet kernels are nonzero and $k delta gt.eq 4$.
    The lowest kernel has a positive-dimensional base component through its marked point.
    Otherwise that point would be an isolated base component of multiplicity at least $h_0 =
    ceil.l k tau_0 ceil.r$. The zero-dimensional case of Lemma 13 would give
  $ 1 lt.eq \( k \/ h_0 \)^n P^n < 1 \, $
  a contradiction.
  Lemma 14 now supplies a moving family of proper base components $V$,
    with dominant incidence and dimension $1 lt.eq f < n$. On a resolution $V^(*)$, write $P_V \,
    L_V$ for the restrictions followed by pullback. The lemma gives
  $ 0 < P_V^f lt.eq \( 2 \/ delta \)^(n - f) P^n \, wide K_(V^(*)) P_V^(f - 1) lt.eq c P_V^f \, wide 0 < c lt.eq
    frac(2 \( n - f \), delta) . $
  Here the canonical term of the ambient variety vanishes because $K_X tilde.op 0$.
    The volume window (5.3) bounds $delta$ above and away from zero, so these are uniform estimates.
    The incidence point may be chosen over a very general point of $X$.
    Thus (5.4) gives bigness of $K_(V^(*)) + L_V$, and $P_V - r L_V$ is nef. Lemma 10 contradicts $r arrow.r oo$. ◻
]

=== 5.3 The projective bundle and its volume <the-projective-bundle-and-its-volume>

We now seek a jet system whose order is much larger than the scalar bound.
  The additional direction comes from the fibres of a projective bundle;
  its two summands keep track of the two copies of $X$. For a divisor on $X$, subscripts $1 \,
  2$ denote pullback from the two factors of $X times X$. Set

#[#set math.equation(numbering: n => "(5.6)")
 $ Z = bb(P) #scale(x: 120%, y: 120%)[\(] cal(O)_X \( L \)_1 xor cal(O)_X \( L \)_2 #scale(x: 120%, y: 120%)[\)]
   arrow.r^pi X times X \, wide xi = c_1 \( cal(O)_Z \( 1 \) \) \, wide R = P_1 + P_2 + q xi \, $ <eq:bundle>]

where $q$ is a positive integer to be fixed shortly. We use the convention $pi_(*) cal(O)_Z \( a \) =
  "Sym"^a \( cal(O)_X \( L \)_1 xor cal(O)_X \( L \)_2 \)$ for $a gt.eq 0$.
  The tautological class $xi$ is nef, and $R$ is ample. The product and projective-bundle descriptions show that
  $Z$ is klt. The two natural sections, called the axes, have classes $xi - L_1$ and $xi - L_2$.
  The canonical bundle formula gives

#[#set math.equation(numbering: n => "(5.7)")
 $ K_Z tilde.op - upright("(sum of the two axes)") . $ <j:axes-canonical>]

We call the complement of the axes the torus open.

The fibre of either projection $Z arrow.r X$ over a smooth point is, up to a constant one-dimensional factor,

$ Z_(upright("sl")) = bb(P) \( cal(O)_X xor cal(O)_X \( L \) \) \, wide R_(upright("sl")) = P + q xi . $

Its axes have classes $xi$ and $xi - L$, and its canonical divisor is again minus their sum.
  The slice is projective and klt. In particular it has the singularity hypotheses needed to apply the
  base-component estimates, using a small $bb(Q)$-factorialization if necessary as explained after Lemma 14.

Write $d = 2 n + 1$. There are positive constants depending only on $n$ such that,
  for each fixed $q$ and all sufficiently small $t$,

#[#set math.equation(numbering: n => "(5.8)")
 $ c_n q epsilon.alt^(2 n) lt.eq R^d lt.eq C_n q epsilon.alt^(2 n) \, wide R_(upright("sl"))^(n + 1) lt.eq
   C_(upright("sl") \, n) q epsilon.alt^n . $ <j:bundle-volumes>]

To see this, expand in nef classes and use

$ pi_(*) \( xi^j \) = sum_(a = 0)^(j - 1) L_1^a L_2^(j - 1 - a) quad \( j gt.eq 1 \) . $

The term containing exactly one $xi$ is $\( 2 n + 1 \) binom(2 n, n) q \( P^n \)^2$, giving the lower bound.
  For the upper bound, every occurrence of $L_i$ can be bounded in mixed nef intersections by $P_i \/ r$.
  After factoring out $q$, the remaining powers of $q \/ r$ are bounded by one once $r gt.eq q$.
  There are only finitely many terms depending on $n$. The slice calculation is the same,
  using $pi_(*) \( xi^j \) = L^(j - 1)$. Together with (5.3), this proves (5.8).

For a nef rational Cartier divisor $R$ and a smooth point $z$, its #emph[Seshadri constant] is

$ epsilon \( R \; z \) = inf_(C in.rev z) frac(R dot.op C, "mult"_z C) \, $

where $C$ ranges over integral curves through $z$. Thus a lower bound for this constant controls degree relative
  to multiplicity at the point.

#thm([Proposition 5.3.])[
  #emph[For a suitable fixed positive integer $q$, and all sufficiently small $t$ in (5.2),
    there is a smooth point $z in Z$ in the torus open, lying over smooth points of both factors, such that
#[#set math.equation(numbering: n => "(5.9)")
 $ epsilon \( R \; z \) > 2 n + 2 . $ <j:large-seshadri>]

 More generally, for any prescribed dense open subsets $U_1 \, U_2$ of the smooth locus of $X$,
   the point may be chosen over $U_1 times U_2$. In particular,
   these opens may be the isomorphism loci of fixed resolutions of $X$.]
] <prop:large-seshadri>

We prove the proposition in the remainder of this section. Choose a positive rational gap $delta$ such that

#[#set math.equation(numbering: n => "(5.10)")
 $ \( 2 \/ delta \)^n C_(upright("sl") \, n) epsilon.alt^n < 1 . $ <j:slice-gap>]

Next choose $q$ so large that $d + 1$ increasing levels of gap $delta$,
  with lowest level strictly greater than $2 n + 2$, lie strictly below $\( c_n q epsilon.alt^(2 n) \)^(1 \/ d)$.
  These choices precede the limit $t arrow.r 0$.

Fix the prescribed opens $U_1 \, U_2$, if any. Suppose that (5.9) fails throughout their smooth torus preimage for
  arbitrarily small $t$. For any such $t$, asymptotic Riemann–Roch and the elementary jet count at a smooth point
  show that all the full kernels at the chosen levels are nonzero for sufficiently large divisible $k$.
  Indeed the highest level has $d$-th power smaller than $R^d$.
  Failure of (5.9) supplies, through each very general point,
  a curve with degree divided by multiplicity smaller than the lowest level.
  Every section in the lowest kernel vanishes identically on that curve:
  otherwise its intersection with the curve is at least its vanishing order times the curve’s multiplicity,
  contradicting the degree inequality. Thus the lowest base locus has a positive-dimensional component through the
  mark. Take $k delta gt.eq 4$ and apply Lemma 14.

We obtain a family of proper integral components $V subset Z$ whose incidence dominates $Z$.
  For its general members, of dimension $f$, the estimates are

#[#set math.equation(numbering: n => "(5.11)")
 $ 0 < R^f dot.op V & lt.eq \( 2 \/ delta \)^(d - f) R^d \,\
K_(V^(*)) R^(f - 1) & lt.eq \( K_Z + c R \) \|_V R^(f - 1) \, wide 0 < c lt.eq
  2 \( d - f \) \/ delta . $ <j:total-component-bounds>]

Here and below classes on a resolution are understood by pullback. The positivity follows from ampleness of $R$.
  General members meet the torus open, so (5.7) makes the ambient canonical contribution nonpositive.
  All constants in these bounds are uniform now that $q \, epsilon.alt \, delta$ have been fixed.

=== 5.4 Excluding positive-dimensional slice fibres <excluding-positive-dimensional-slice-fibres>

We first constrain the two projections of $V$ to $X$. For either projection,
  consider the component $F$ of a general fibre of $V arrow.r
  "im" \( V arrow.r X \)$ through a general incidence point.
  Choose that incidence point in the opens of Lemma 15, over very general points of both factors of $X$,
  and in the smooth torus open. We claim that

#[#set math.equation(numbering: n => "(5.12)")
 $ dim F in.not { 1 \, dots.h \, n } . $ <j:no-intermediate-fibre>]

Suppose instead that $1 lt.eq f_(upright("sl")) = dim F lt.eq n$.
  The ambient fibre is $Z_(upright("sl"))$, of dimension $n + 1$.
  The restriction lemma gives a nonzero restricted subseries with $F$ an isolated base component and base ideal
  contained generically in $cal(I)_F^h$, where $h = ceil.l k delta \/ 2 ceil.r$.
  Generic smoothness is imposed over the actual image of $V$;
  this is why a general fibre through the incidence point was chosen.
  The point is also smooth in the ambient slice. Applying Lemma 13 on that slice gives

#[#set math.equation(numbering: n => "(5.13)")
 $ 0 < R_(upright("sl"))^(f_(upright("sl"))) dot.op F & lt.eq \( 2 \/ delta \)^(n + 1 - f_(upright("sl")))
   R_(upright("sl"))^(n + 1) \,\
K_(F^(*)) R_(upright("sl"))^(f_(upright("sl")) - 1) & lt.eq \( K_(Z_(upright("sl"))) + c R_(upright("sl")) \) \|_F
  R_(upright("sl"))^(f_(upright("sl")) - 1) \, $ <j:slice-bounds>]

with $c lt.eq 2 \( n + 1 - f_(upright("sl")) \) \/ delta$.
  Cartier multiples are chosen before restriction, so the constant line from the fixed factor causes no change in
  this calculation.

Let $W_0 subset X$ be the image of $F$ in the other factor. There are three cases:
  $F$ is generically finite over a proper subvariety of $X$;
  $F$ contains the projective-line fibres over its image; or $F$ is a multisection over all of $X$.

===== 5.4.1 A generically finite map to a proper subvariety. <a-generically-finite-map-to-a-proper-subvariety.>

If $F arrow.r W_0$ is generically finite and $dim W_0 < n$, use $P_Y =
  R_(upright("sl")) \|_(F^(*))$ and the pullback $L_Y$ from $X$.
  The first inequality in (5.13) gives a uniform positive volume bound.
  Since $F$ meets neither axis generically, its ambient canonical term is nonpositive.
  Hence the second inequality gives a uniform canonical-intersection ratio. Moreover $P_Y - r L_Y$ is nef.
  The image $W_0$ contains the very general projection of the incidence point, so (5.4) applies.
  Lemma 10 excludes this case for large $r$.

===== 5.4.2 A projective-line bundle over a proper subvariety. <a-projective-line-bundle-over-a-proper-subvariety.>

If $F arrow.r W_0$ is not generically finite, its general fibre has dimension one.
  Since the ambient projection is a projective-line bundle and $F$ is integral, $F$ is the full bundle over $W_0$.
  Write $w = dim W_0 = f_(upright("sl")) - 1$. If $w = 0$, then $F$ is a projective-line fibre and
  $R_(upright("sl")) dot.op F = q$. The first inequality in (5.13), together with (5.8) and (5.10), gives

$ q lt.eq \( 2 \/ delta \)^n R_(upright("sl"))^(n + 1) lt.eq \( 2 \/ delta \)^n C_(upright("sl") \, n) q
  epsilon.alt^n < q \, $

which is impossible.

Suppose $w > 0$. Resolve $W_0$ to $W_0^(*)$ and take as a resolution of $F$ the induced projective bundle $p_0 :
  F^(*) arrow.r W_0^(*)$. Its relative canonical divisor is $- 2 xi + p_0^(*) L$,
  exactly the restriction of $K_(Z_(upright("sl")))$. Cancelling this term in (5.13) gives

#[#set math.equation(numbering: n => "(5.14)")
 $ p_0^(*) K_(W_0^(*)) R_(upright("sl"))^w lt.eq c R_(upright("sl"))^(w + 1) dot.op F . $ <j:saturated-canonical>]

The divisor $K_(W_0^(*))$ is pseudo-effective by the very general point condition.
  On expanding the left side and pushing down, its term with exactly one $xi$ is $w q K_(W_0^(*)) P^(w - 1)$;
  every other nonzero term is nonnegative, since it pairs the pseudo-effective canonical divisor with nef classes.
  On the right, the same expansion used for (5.8) gives

#[#set math.equation(numbering: n => "(5.15)")
 $ \( w + 1 \) q P^w dot.op W_0 lt.eq R_(upright("sl"))^(w + 1) dot.op F lt.eq C'_n q P^w dot.op W_0 \,
   $ <j:saturated-volume>]

using $r gt.eq q$. The slice degree bound and the first inequality in (5.15) bound $0 < P^w dot.op W_0$ uniformly.
  Equations (5.14)–(5.15) also give

$ K_(W_0^(*)) P^(w - 1) lt.eq frac(c C'_n, w) P^w dot.op W_0 . $

Apply (5.4) and Lemma 10 on $W_0^(*)$ with the pullbacks of $P \, L$. This excludes the second case.

===== 5.4.3 A multisection over $X$. <a-multisection-over-x.>

The only remaining possibility is that $f_(upright("sl")) = n$ and $F arrow.r
  X$ is generically finite of degree $e > 0$. Intersect $F$ with each of the two Cartier axes and push the
  resulting cycles down to $X$. This gives effective integral Weil divisors $D_1 \, D_2$.
  The axes do not contain $F$, and their classes differ by $L$; projection of the associated rational section,
  or equivalently its norm, gives

#[#set math.equation(numbering: n => "(5.16)")
 $ D_1 - D_2 tilde.op plus.minus e L . $ <j:signed-L>]

For either axis $S$, the classes $R_(upright("sl")) - q S$ and $R_(upright("sl")) - P$ are nef.
  Intersecting with the effective cycle $S dot.op F$ and then using nefness on $F$ yields

#[#set math.equation(numbering: n => "(5.17)")
 $ q D_i P^(n - 1) lt.eq q S dot.op F dot.op R_(upright("sl"))^(n - 1) lt.eq
   R_(upright("sl"))^n dot.op F . $ <j:axis-degrees>]

Thus both axis-image degrees are uniformly bounded.

Set $G = D_1 + D_2$. It is $bb(Q)$-Cartier because $X$ is $bb(Q)$-factorial.
  Choose $b > 0$ rational sufficiently small that $\( X \, b G \)$ is klt. We claim

#[#set math.equation(numbering: n => "(5.18)")
 $ kappa \( K_X + b G \) > 0 . $ <j:positive-boundary-kappa>]

The Iitaka dimension is at least zero, since $K_X + b G tilde.op_(bb(Q)) b G$.
  If it were zero, Theorems 5 and 4 would give a finite ordinary MMP to a good model $Y$ with transformed adjoint
  rationally linearly trivial. The transform of $K_X$ is linearly trivial as well.
  Consequently the effective transform of $G$ is zero: all its components have been contracted.
  On a common resolution $a : U arrow.r X$, $b_Y : U arrow.r Y$,
  relation (5.16) then expresses $a^(*) L$ up to rational linear equivalence as a signed $b_Y$-exceptional divisor
  $E$. Divisors exceptional over $X$ are also exceptional over $Y$, since the MMP extracts none.
  Nefness of $a^(*) L$ and the negativity lemma imply $E lt.eq 0$. Its class is also pseudo-effective.
  A nonzero anti-effective divisor has negative intersection with a sufficiently high power of an ample divisor,
  so $E = 0$. This contradicts full nef dimension of $L$, and proves (5.18).

The already proved positive-Iitaka-dimension case (Proposition 8) now gives

$ K_X + b G + L med upright("big") . $

Its full-positivity hypothesis holds because $L$ has full nef dimension and $K_X + b G$ is pseudo-effective.
  Take a log resolution $a : Y arrow.r X$ of $G$ and let $D_0$ be the reduced simple normal crossings divisor
  consisting of the strict support of $G$ and every exceptional divisor.
  Decrease $b$ if necessary; Proposition 8 still applies. Terminality and the support of $a^(*) G$ then give

$ K_Y + D_0 + a^(*) L med gt.eq med a^(*) \( K_X + b G + L \) $

up to rational linear equivalence and an effective difference.
  Indeed the finitely many exceptional discrepancies are positive,
  and decreasing $b$ makes each coefficient of $b thin a^(*)
  G$ no larger than the corresponding coefficient of $K_Y - a^(*) K_X + D_0$. Hence the left side is big.

Test on $Y$ with $a^(*) P$. Exceptional divisors contribute zero to intersection with $\( a^(*) P \)^(n - 1)$,
  and $K_X tilde.op 0$. The degree of the reduced strict support is no larger than $G P^(n - 1)$,
  bounded by (5.17); also $L P^(n - 1) lt.eq P^n \/ r$. Since (5.3) bounds $P^n$ away from zero,
  we obtain a uniform constant $C$ such that

$ \( K_Y + D_0 + a^(*) L \) \( a^(*) P \)^(n - 1) lt.eq C \( a^(*) P \)^n . $

Lemma 10, now with its reduced boundary $D_0$, gives the final contradiction. This proves (5.12).

Thus a general moving component $V$ has fibre dimension either zero or $n + 1$ over its image in either factor.
  Fibre dimension $n + 1$ would make $V$ the full inverse image of its image in that factor.
  Since $V$ is proper, the image has dimension at most $n - 1$,
  so the other projection would have fibre dimension between $1$ and $n$, already excluded.
  Both projections of $V$ are therefore generically finite onto their images, and $dim V lt.eq n$.
  If $dim V < n$, the bounds (5.11), the nef class $R - r L_i$, and (5.4) again contradict Lemma 10.
  Only $n$-dimensional correspondences, dominant over both factors, remain.

=== 5.5 Correspondences and their branch divisors <correspondences-and-their-branch-divisors>

For these remaining $V$, (5.11) gives uniform bounds

#[#set math.equation(numbering: n => "(5.19)")
 $ R^n dot.op V lt.eq C \, wide K_(V^(*)) R^(n - 1) lt.eq c R^n dot.op V lt.eq C \, $ <j:correspondence-bounds>]

after increasing $C$. Each projection has bounded degree: $R - P_i$ is nef, and $P^n$ is bounded below.

For each fixed $t$, resolve the general members in their algebraic family and shrink the parameter space so that
  the resolutions form a smooth projective family with integral fibres and morphisms to $X$ in both slots.
  The dominant incidence and all numerical bounds persist. Finite extensions of the parameter space are allowed.
  Over $X_(upright("sm"))$, name the components of the relative Jacobian divisors as in Lemma 16.
  Consider a component whose image on a general member is a divisor $J subset X$.

Such divisors $J$ cannot sweep $X$. If they did, choose a general one through a very general point.
  Let $E_J$ be a ramification divisor over it on the corresponding $V^(*)$.
  Pullback of a canonical form from $X$ gives an effective canonical divisor on $V^(*)$.
  Regularity follows by factoring through a resolution of $X$ and using its canonical singularities;
  the coefficient of $E_J$ is positive because its image meets $X_(upright("sm"))$ generically.
  The difference $R - P_i$ is nef, so (5.19) and projection formula bound

$ 0 < d_J := P^(n - 1) dot.op J lt.eq C . $

On a resolution $J^(*)$, Lemma 12, applied to $\( X \, J \)$ at the generic point of $J$, gives

#[#set math.equation(numbering: n => "(5.20)")
 $ K_(J^(*)) P^(n - 2) & lt.eq \( K_X + J \) dot.op J dot.op P^(n - 2)\
 & = J^2 P^(n - 2) lt.eq frac(\( J P^(n - 1) \)^2, P^n) lt.eq C' d_J . $ <j:branch-canonical>]

The pair is lc at that generic point because $X$ is normal and hence smooth there.
  The middle inequality is the Hodge index inequality, applied on a resolution and obtained by ample approximation
  of the pulled-back testing class. It does not require $J$ to be nef.
  The final constant is uniform by the volume lower bound and the bound for $d_J$.

Since $J$ sweeps $X$, its resolution satisfies the very general point conditions used in (5.4).
  With testing class $P \|_(J^(*))$, whose top self-intersection is $d_J$,
  Equation (5.20) gives precisely the hypotheses of Lemma 10 in dimension $n - 1$.
  This contradiction excludes sweeping branch divisors.

Lemma 16 now gives, for each slot and this fixed $t$, only finitely many possible finite normal Stein covers of
  $X$, up to isomorphism over $X$. The point of the preceding step is that degree bounds alone would not give this
  conclusion: non-sweeping branch images provide a fixed smooth branch complement for the family.
  Neither that complement nor the resulting finite lists need be uniform in $t$.

=== 5.6 Fixed covers and an abelian model <fixed-covers-and-an-abelian-model>

Each $V^(*)$ maps birationally to both of its normal Stein covers,
  and hence determines a graph of a birational map between a pair of covers in the finite lists.
  We explain why some such fixed pair has a family of graphs dominating its product.
  Restrict the finite set of pairs to those realized by at least one original member $V^(*)$ satisfying (5.19).
  The original incidence dominates $Z$, so the projected incidences for these pairs cover a dense open of $X times
  X$. For a fixed pair, graphs of birational maps lie in countably many Hilbert schemes.
  Stratify these schemes so that the fibres are integral and flat and both projections are birational;
  the latter conditions may be tested by dominance and degree one after shrinking.
  Because $bb(C)$ is uncountable, a dense open of $X times X$ cannot be covered by countably many proper closed
  subsets. Thus, for one fixed pair $T_1 \, T_2$, some integral graph family has dominant evaluation to $X times
  X$. Since $T_1 times T_2$ is finite over $X times X$ and has the same dimension,
  this evaluation is dominant onto $T_1 times T_2$ as well.

Both covers are non-uniruled because they are finite over $X$.
  The birational-group theorem of Hanamura [17] Theorems 2.1–2.2,
  in the form recalled in [5] Proposition 3.7 and Theorems 3.8–3.9,
  implies that they are birational to an abelian variety. Here are the details of the application.
  Identify the two covers birationally by one map in the family.
  On a suitable smooth projective birational model of the resulting non-uniruled variety,
  the reduced birational group is a group scheme locally of finite type,
  with identity component an abelian variety acting regularly.
  Conjugate the graph family to this model and shrink again to obtain a flat family of integral graphs.
  By the flat-graph representability statement, its reduced integral parameter space maps to the reduced
  birational group. Its connected image lies in one translate of the identity component.
  Product-dominant evaluation therefore gives a dense orbit for that abelian identity component.
  The orbit is a quotient of an abelian variety by a stabilizer, hence is itself an abelian variety.
  The fixed cover is birational to it. This is the birational-group part of the fixed-cover argument in [28]
  Proposition 6.11; no canonical nonvanishing conclusion from that proposition is being used.

This structural conclusion depends only on the two covers.
  We may therefore return to an original member $V^(*)$ belonging to this pair, which retains (5.19),
  and resolve further to obtain a birational morphism

$ p_0 : V^(*) arrow.r A_0 $

to an abelian variety. Higher resolutions do not change the canonical intersection with the pulled-back
  $\( n - 1 \)$-st power of $R$. Let $L_0$ be the pullback of $L$ from either slot.
  It is nef, Cartier, and of full nef dimension. We claim

#[#set math.equation(numbering: n => "(5.21)")
 $ K_(V^(*)) + L_0 med upright("big") . $ <j:abelian-big>]

The pushforward $N_0 = \( p_0 \)_(*) L_0$ is pseudo-effective on $A_0$, and is therefore nef.
  Indeed translations make the pseudo-effective and nef cones of an abelian variety coincide.
  If $N_0$ were not big, the standard description of nef line bundles on abelian varieties would give a
  positive-dimensional abelian subvariety on whose translates $N_0$ is numerically trivial.
  One can see this from the semipositive Hermitian form of the numerical class:
  its kernel is rational for the lattice, since the alternating form of the integral Cartier class is integral,
  and therefore defines an abelian subvariety. A general translate meets the image of the exceptional locus of
  $p_0$ in codimension at least two, if at all. Complete-intersection curves in that translate can thus be chosen
  through very general points and avoiding this image. Their lifts have $L_0$-degree zero,
  contradicting full nef dimension. Hence $N_0$ is big.

By the negativity lemma,

$ p_0^(*) N_0 - L_0 = E_0 gt.eq 0 $

is exceptional. The canonical divisor of $V^(*)$ has an effective representative $E_K$ with positive coefficient
  along every $p_0$-exceptional divisor, because the target is smooth with trivial canonical bundle.
  Choose a rational $0 < u < 1$ sufficiently small that $E_K - u E_0 gt.eq 0$. Then

$ K_(V^(*)) + u L_0 tilde.op_(bb(Q)) u p_0^(*) N_0 + \( E_K - u E_0 \) $

is big. Adding the nef divisor $\( 1 - u \) L_0$ proves (5.21).

We may now apply Lemma 10 in dimension $n$ on $V^(*)$, with testing class $R$ and empty boundary.
  The bounds (5.19) give both the top intersection bound and the canonical ratio, while $R -
  r L_0$ is nef and (5.21) supplies bigness. This final contradiction excludes the correspondence case.

===== 5.6.1 Conclusion of the proof of Proposition 19. <conclusion-of-the-proof-of-proposition-proplarge-seshadri.>

The alternatives for every moving base component have been exhausted:
  first its slice fibres, then components of dimension less than $n$, sweeping branch divisors,
  and finally the fixed covers. In each case the contradiction comes from Lemma 10 with constants uniform in $t$.
  The finite cover lists were used only for one fixed $t$, and their sizes do not enter the degree bounds.
  Thus failures of (5.9) cannot occur along a sequence $t arrow.r 0$.
  This proves the proposition, including the additional open conditions on the chosen point. $square.stroked.tiny$

We have now constructed, under the hypothetical failure of Theorem 17,
  the scalar estimate of Lemma 18 and the projective-bundle estimate of Proposition 19.
  The next section fixes one sufficiently small value of $t$ and places these data in the finite-data Frobenius
  comparison.

== 6 Frobenius comparison <sec:frobenius>

The scalar estimate of Lemma 18 and the projective-bundle estimate of Proposition 19 will now give the
  contradiction needed for Theorem 17. Their incompatibility is expressed by the following theorem about fixed
  complex data. It is the finite-data Frobenius theorem of [28] Theorem 9.1.
  We give its proof, including the bounds that must be uniform when the residual characteristic varies.

The argument compares two orders of vanishing of one determinant.
  Ordinary jets make the determinant nonzero after reduction to positive characteristic.
  A small polarization bounds the rank on the diagonal, forcing high vanishing at each diagonal point.
  A fixed movable curve on a point blowup bounds the vanishing of every section of each determinant factor and
  gives the opposite inequality.

=== 6.1 The finite-data statement <the-finite-data-statement>

For a vector bundle on a smooth projective curve, its slope is degree divided by rank.
  The least and greatest Harder–Narasimhan slopes are denoted by $mu_min$ and $mu_max$.
  For a line bundle on a smooth variety, to generate jets through order $a$ at a point means surjectivity to its
  stalk modulo the $\( a + 1 \)$-st power of the maximal ideal.

#thm([Theorem 6.1.])[
  (Finite-data Frobenius incompatibility).  #emph[Let $W$ be a smooth connected projective complex variety of
    dimension $n gt.eq 2$. Let $D \, H$ be rational Cartier divisors, with $H$ ample,
    let $S$ be an integral Cartier divisor, and fix an integer $q > 0$ and real numbers $r > 1$,
    $epsilon.alt > 0$. Suppose
#[#set math.equation(numbering: n => "(6.1)")
 $ H^n lt.eq \( 2 epsilon.alt \)^n \, wide K_W H^(n - 1) lt.eq 2 H^n \/ r \, wide \( 2 D + q S \) H^(n - 1) lt.eq
   4 H^n \,\
\( 14 epsilon.alt \)^n < 1 / 4 \, wide 80 epsilon.alt < 3 / 4 . $ <fr:intersection-bounds>]

 Assume that the following fixed data exist.]
  + #emph[A smooth integral complete-intersection flag from $W$ to a curve $C$,
    whose successive divisor classes are $h_i = l_i H$ for fixed positive integers $l_i$ for which $l_i
    H$ is Cartier, with $mu_min \( Omega_W^1 \|_C \) gt.eq 0$.]
  + #emph[On the projective bundle
$ Z = bb(P) #scale(x: 120%, y: 120%)[\(] cal(O)_W \( S \)_1 xor cal(O)_W \( S \)_2 #scale(x: 120%, y: 120%)[\)]
  arrow.r W times W \, wide xi = c_1 \( cal(O)_Z \( 1 \) \) \, wide M = D_1 + D_2 + q xi \, $

 use the convention that the direct image of $cal(O)_Z \( a xi \)$ is the $a$-th symmetric power of the displayed
   sum for $a gt.eq 0$; subscripts indicate pullback from the corresponding factor of $W times W$.
   The two axes are the sections defined by the two summands.
   A smooth point $z_(*)$ in their complement and finitely many sections of $k_0 M$,
   for some integer $k_0 > 0$ with $k_0 D$ Cartier, generate jets through order $\( 2 n + 2 \) k_0$ at $z_(*)$.]
  + #emph[A point $x in W$, its blowup $pi_x : hat(W) arrow.r W$ with exceptional divisor $J$, and a curve class
$ gamma = f_(*) \( A_1 dots.h.c A_(n - 1) \) \, $

 where $f : V arrow.r hat(W)$ is one fixed birational morphism, $V$ is smooth integral projective,
   and the $A_i$ are ample integral Cartier divisors, such that $J dot.op gamma > 0$ and
#[#set math.equation(numbering: n => "(6.2)")
 $ pi_x^(*) \( D + K_W \/ 2 + lambda S \) dot.op gamma lt.eq
   40 epsilon.alt J dot.op gamma wide \( 0 lt.eq lambda lt.eq q \) . $ <fr:movable-input>]

 It suffices to check the two endpoints in this affine inequality.]
  #emph[These data cannot coexist.]
] <thm:finite-data>

The point $x$ is independent of the two base coordinates of $z_(*)$.
  No nefness is required of $D \, S$, or $K_W$, and the theorem does not assume that $K_W$ is pseudo-effective.
  Its hypotheses specify the flag and the movable curve class themselves.
  All these data will be fixed before the residual characteristic tends to infinity.

=== 6.2 Reduction and Frobenius jets <fr:reduction>

We begin the proof of Theorem 20 by spreading its hypotheses and converting the fixed ordinary jets into jets of
  order proportional to the residual characteristic. Put $Lambda = product_(i = 1)^(n - 1) l_i$. The flag satisfies

#[#set math.equation(numbering: n => "(6.3)")
 $ \[ C \] = Lambda H^(n - 1) \, wide h_i dot.op C = l_i Lambda H^n . $ <fr:flag-degrees>]

Choose one sufficiently ample integral Cartier divisor $T_0$ so that every $T_0 + a S$, for integers $0 lt.eq
  a lt.eq \( k_0 - 1 \) q$, has a section nonvanishing at each of the two base coordinates of $z_(*)$.
  Fix these finitely many sections. All models, morphisms, divisors, points, the flag,
  the complete-intersection witness for $gamma$, and the jet and filler sections spread over an integral finitely
  generated $bb(Z)$-algebra of characteristic zero. Shrink its spectrum so that the fibers and flag are smooth
  projective and geometrically integral, the birational morphisms remain birational,
  the fixed ample bundles remain ample, and the finite jet surjection and nonvanishings persist.
  Birationality is preserved by spreading an isomorphism between dense opens.
  All displayed intersection numbers are constant.

We also preserve $mu_min \( Omega_W^1 \|_C \) gt.eq 0$. One way is to spread its characteristic-zero
  Harder–Narasimhan filtration, make all its factors locally free,
  and use openness of their semistability on curves; their degrees and ranks are fixed.
  Equivalently, a single relative ample twist globally generates the curve bundle.
  Every quotient of rank $a$ then has degree bounded below by $- a d$ for a fixed integer $d$.
  A negative-degree quotient therefore has one of finitely many ranks and degrees.
  The proper relative Quot schemes for those Hilbert polynomials have images missing the generic point:
  after removal of torsion, a negative-degree coherent quotient there would give a negative-degree vector-bundle
  quotient. Removing those finitely many images proves the same openness assertion directly.

This base has closed points in arbitrarily large characteristics.
  Take algebraic closures of their residue fields and exclude denominator primes.
  Retain the notation for the reductions. The curve $gamma$ continues to pair nonnegatively with every effective
  divisor: pull that divisor back under the fixed birational morphism and intersect with its fixed ample divisors.
  This tests effective divisors on the reduction itself. No specialization of a characteristic-zero effective cone
  is used.

#thm([Lemma 6.2.])[
  #emph[For a sufficiently large residual characteristic $p$, set
$ N_p = floor.l p \/ k_0 floor.r \, wide B_p = k_0 N_p D + T_0 . $

 The sections of $p q xi + B_(p \, 1) + B_(p \, 2)$ generate jets through order $\( 2 n + 2 \) k_0
   N_p$ at $z_(*)$. In particular, they surject onto the quotient of its local ring by the $p$-th powers of all
   regular parameters.]
] <fr:positive-characteristic-jets>

#proof[
  Multiply $N_p$ copies of the fixed jet system. Every monomial of total degree at most $\( 2 n + 2 \) k_0
    N_p$ is a product of $N_p$ monomials of degree at most $\( 2 n + 2 \) k_0$.
    Taking sections with those leading monomials gives a triangular system, ordered by total degree.
    Starting at degree zero and removing the error in each successive degree proves the required jet surjection.
    This argument takes place in the local ring and never divides by factorials.
  Put $d_p = \( p - k_0 N_p \) q$, so $0 lt.eq d_p lt.eq \( k_0 - 1 \) q$.
    Among the sections fixed before reduction, choose
  $ u_0 in H^0 \( W \, cal(O)_W \( T_0 \) \) \, wide v_(d_p) in H^0 \( W \, cal(O)_W \( T_0 + d_p S \) \) $
  nonzero at the first and second base coordinates of $z_(*)$, respectively.
    Their tensor product belongs to the summand of first-slot weight zero in the projective-bundle formula;
    its fiber monomial is the $d_p$-th power of the second coordinate.
    It defines a section of $d_p xi + T_(0 \, 1) + T_(0 \, 2)$ nonzero at $z_(*)$,
    since $z_(*)$ lies off both axes. Multiplying the product jet system by this section changes its divisor from
    $N_p k_0 M$ to $p q xi + B_(p \, 1) + B_(p \, 2)$. Multiplication is invertible on the local jet algebra.
    Only the finitely many previously fixed values of $d_p$ occur.
  Since $dim Z = 2 n + 1$, the quotient by the $p$-th powers of regular parameters has top total degree
    $\( 2 n + 1 \) \( p - 1 \)$. For large $p$ this is at most $\( 2 n + 2 \) k_0 N_p$.
    The underlying ordinary/Frobenius ideal comparison is also recorded in [26] proof of Proposition 2.12,
    Equation (2.8). ◻
]

=== 6.3 Full rank from the two-slot jets <fr:full-rank>

Let $F : W arrow.r W'$ be relative Frobenius to the base-field twist. It is finite flat because $W$ is smooth.
  Write $S'$ for the twist of $S$, so $F^(*) S' = p S$, and define

$ cal(E) = F_(*) cal(O)_W \( B_p \) \, wide s = "rk" cal(E) = p^n \, wide R = s^2 . $

For integers $0 lt.eq a lt.eq q$, put $U_a = H^0 \( W \, cal(O)_W \( B_p + p a S \) \)$.
  Projection formula gives an evaluation map on $W' times W'$:

#[#set math.equation(numbering: n => "(6.4)")
 $ xor.big_(a + b = q\
a \, b gt.eq 0) U_a ⊗ U_b ⊗ cal(O) \( - a S'_1 - b S'_2 \) arrow.r
  cal(E) times.square cal(E) . $ <fr:two-slot-evaluation>]

#thm([Lemma 6.3.])[
  #emph[The map in (6.4) has generic rank $R$.]
] <fr:generic-rank>

#proof[
  Trivialize the two summands defining $Z$ near the selected base points.
    Let $z$ be the torus coordinate, whose value at $z_(*)$ is $z_0 eq.not 0$.
    By the projective-bundle formula, the sections in Lemma 21 are weight polynomials in $z$ with weight-$j$
    coefficients in
  $ H^0 \( W \, B_p + j S \) ⊗ H^0 \( W \, B_p + \( p q - j \) S \) \, wide 0 lt.eq j lt.eq p q . $
  Let $A_(*)$ be the tensor product of the local algebras of the two base Frobenius fibers.
    The local quotient in Lemma 21 is
  $ A_(*) \[ z \] \/ \( z^p - z_0^p \) \, $
  free over $A_(*)$ with basis $1 \, z \, dots.h \, z^(p - 1)$. Project to the coefficient of $1$ in this basis.
    Exactly the weights $j = p a$ survive, with multipliers $z_0^(p a)$.
    Their coefficients are the values of the corresponding summands of (6.4),
    in the chosen frames and the induced twisted frames. As the full jet map is surjective,
    these coefficients span $A_(*)$, of dimension $p^(2 n) = R$.
    Thus the evaluation has full rank at this pair of base points, and hence generically.
    The calculation uses a basis over the possibly nonreduced algebra $A_(*)$,
    so reducedness of the Frobenius fibers is unnecessary. ◻
]

The jet calculation at $z_(*)$ proves generic full rank; the diagonal estimate below will be tested at
  $\( x' \, x' \)$, obtained from the separately fixed point $x$.

=== 6.4 Sections on the Frobenius diagonal <fr:filtration>

The Frobenius fiber product has the cartesian square

(6.5)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Delta_F = W times_(W') W$])
  content((2.256, 0), [$W$])
  content((0, -1.239), [$W$])
  content((2.256, -1.239), [$W' .$])
  line((0.864, 0), (1.92, 0), mark: (end: ">"))
  content((1.392, 0.2266), [#text(size: 0.73em)[$upright("pr")_2$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.4668, -0.6193), [#text(size: 0.73em)[$upright("pr")_1$]])
  line((2.256, -0.2725), (2.256, -0.9661), mark: (end: ">"))
  content((2.578, -0.6193), [#text(size: 0.73em)[$F$]])
  line((0.336, -1.239), (1.788, -1.239), mark: (end: ">"))
  content((1.062, -1.465), [#text(size: 0.73em)[$F$]])
})

Its reduced subscheme is the diagonal $W$. Put

$ cal(L)_p = cal(O)_(Delta_F) \( B_(p \, 1) + B_(p \, 2) + p q S_1 \) . $

Write $h = F compose upright("pr")_1 = F compose upright("pr")_2 : Delta_F arrow.r W'$. On this fiber product,

$ cal(O) \( p S_1 \) tilde.eq h^(*) cal(O)_(W') \( S' \) tilde.eq cal(O) \( p S_2 \) . $

Consequently every pair of weights $a + b = q$ gives the same line bundle:

$ cal(O)_(Delta_F) \( B_(p \, 1) + B_(p \, 2) + p a S_1 + p b S_2 \) tilde.eq cal(L)_p . $

On the diagonal of $W' times W'$, every source twist of (6.4) becomes $- q S'$.
  Finite base change and projection formula identify the twisted target as

$ \( cal(E) ⊗ cal(E) \) \( q S' \) tilde.eq h_(*) cal(L)_p . $

The product sections defining the columns restrict to global sections of this one bundle $cal(L)_p$.
  Their values at a diagonal point therefore lie in the image of $H^0 \( Delta_F \, cal(L)_p \)$ in the
  corresponding fiber of $h_(*) cal(L)_p$. This proves that the rank at every diagonal point is at most

#[#set math.equation(numbering: n => "(6.6)")
 $ h^0 \( Delta_F \, cal(L)_p \) . $ <fr:diagonal-rank-upper>]

For a rank-$n$ bundle $V$ in characteristic $p$, denote by $A_j \( V \)$ the degree-$j$ part of its symmetric
  algebra modulo the $p$-th powers of local generators. This construction is independent of frame:
  the $p$-th power of a linear combination is the sum of the $p$-th powers in characteristic $p$.
  Each $A_j \( V \)$ is locally free and a quotient of $V^(⊗ j)$. Set

$ u = n \( p - 1 \) \, wide e_j = "rk" A_j \( V \) \, wide sum_(j = 0)^u e_j = p^n . $

Filtering $cal(L)_p$ by powers of the ideal of the reduced diagonal in $Delta_F$ gives the graded bundles

#[#set math.equation(numbering: n => "(6.7)")
 $ cal(G)_j = cal(O)_W \( 2 B_p + p q S \) ⊗ A_j \( Omega_W^1 \) \, wide 0 lt.eq j lt.eq u . $ <fr:diagonal-graded>]

Indeed, in smooth local coordinates the algebra is generated by parameter differences with their $p$-th powers
  zero, and its degree-one conormal is $Omega_W^1$. This coordinate calculation can be made étale locally or in
  completions and identifies the global associated graded. This is the diagonal-ideal form of the canonical
  Frobenius filtration [18] Corollary 3.5. The same calculation, using only the bundle from the second factor,
  filters $F^(*) cal(E)$ with pieces [30] Theorem 3.7

#[#set math.equation(numbering: n => "(6.8)")
 $ cal(O)_W \( B_p \) ⊗ A_j \( Omega_W^1 \) . $ <fr:Frob-pullback-graded>]

Complementary multiplication is a perfect pairing, giving

#[#set math.equation(numbering: n => "(6.9)")
 $ A_(u - j) \( V \) tilde.eq A_j \( V \)^or ⊗ \( det V \)^(p - 1) . $ <fr:socle-pairing>]

On monomials, each exponent vector pairs with its complement to $\( p - 1 \, dots.h \, p - 1 \)$.
  The top line transforms by the character $\( det V \)^(p - 1)$:
  this is immediate on diagonal matrices and hence identifies the character of $upright("GL")_n$ on that line.

=== 6.5 A uniform bound for the diagonal rank <fr:rank-bound>

We bound the sections of every graded bundle in (6.7) by its rank times the same scalar polynomial in $p$.
  This uniformity lets us sum the ranks of the graded pieces without an additional factor for their number.
  We begin with a slope bound on the fixed curve; here slope means ordinary degree divided by rank.

#thm([Lemma 6.4.])[
  #emph[There is a constant $c gt.eq 0$, independent of the sufficiently large residual characteristic $p$ and of
    $j$, such that for $V = Omega_W^1 \|_C$ one has
$ mu_max \( A_j \( V \) \) lt.eq \( p - 1 \) K_W dot.op C + n c . $

]
] <fr:truncated-slope>

#proof[
  Write $F_C$ for absolute Frobenius of $C$. Langer’s instability estimate [20] Corollary 2.5 gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ L_min \( V \) := lim_(e arrow.r oo) p^(- e) mu_min \( F_C^(e *) V \) gt.eq - frac(c, p - 1) . $ <fr:Langer-min>]
  To make the uniformity explicit, let $g$ be the fixed genus of $C$.
    One can choose a nef line bundle $A_C$ of degree at most $d_g = max { 4 g - 2 \,
    0 }$ such that $T_C ⊗ A_C$ is globally generated; for $g lt.eq 1$, take $A_C = cal(O)_C$. Langer’s bound is
  $ mu_min \( V \) - L_min \( V \) lt.eq frac(\( "rk" V - 1 \) deg A_C, p - 1) . $
  Since $"rk" V = n$ and $mu_min \( V \) gt.eq 0$, we may take $c = \( n - 1 \) d_g$, independently of the reduction.
  We also need, for every integer $i gt.eq 0$,
  #[#set math.equation(numbering: n => "(6.11)")
   $ mu_min \( V^(⊗ i) \) gt.eq i L_min \( V \) . $ <fr:tensor-min>]
  Fix $p$ and $i$. Choose a line bundle $A_e$ of degree $- mu_min \( F_C^(e *) V \) + O \( 1 \)$,
    rounded up with a fixed genus-dependent additive constant, so that $F_C^(e *) V ⊗ A_e$ is globally generated.
    This follows from Serre duality: after subtracting any point,
    its minimum slope can be made greater than $2 g \( C \) - 2$,
    which annihilates $H^1$ and makes evaluation at that point surjective.
    For every vector-bundle quotient $Q$ of $V^(⊗ i)$, the bundle $F_C^(e *) Q ⊗
    A_e^(⊗ i)$ is then globally generated. Consequently
  $ p^e mu \( Q \) + i deg A_e gt.eq 0 . $
  Divide by $p^e$ and let $e arrow.r oo$ to prove (6.11). This limit is taken for each fixed $p \, i$;
    there is no interchange of Frobenius-iteration and characteristic limits.
  Since $A_(u - j) \( V \)$ is a quotient of $V^(⊗ \( u - j \))$, the perfect pairing (6.9) yields
  $ mu_max \( A_j \( V \) \) & = \( p - 1 \) deg det V - mu_min \( A_(u - j) \( V \) \)\
 & lt.eq \( p - 1 \) K_W dot.op C + frac(\( u - j \) c, p - 1)\
 & lt.eq \( p - 1 \) K_W dot.op C + n c . $
  ◻
]

The divisors $B_p - p D = T_0 - \( p - k_0 N_p \) D$ range over a fixed finite list.
  Combining (6.1), (6.3), and Lemma 23 therefore gives, uniformly for $0 lt.eq j lt.eq u$,

#[#set math.equation(numbering: n => "(6.12)")
 $ mu_max \( cal(G)_j \|_C \) & lt.eq p \( 4 + 2 \/ r \) Lambda H^n + O \( 1 \)\
 & lt.eq M_p := 7 p Lambda H^n + c_0 \, $ <fr:common-slope-bound>]

where $c_0 gt.eq 0$ is fixed. The coefficient $7$ provides harmless room in this common bound.

#thm([Lemma 6.5.])[
  #emph[For all sufficiently large $p$,
$ h^0 \( Delta_F \, cal(L)_p \) lt.eq R #scale(x: 120%, y: 120%)[\(] 7^n H^n +
  O \( 1 \/ p \) #scale(x: 120%, y: 120%)[\)] < R \/ 4 . $

 The error constant is independent of the filtration index $j$.]
] <fr:diagonal-sections>

#proof[
  Write the fixed flag as
  $ W = W_n supset W_(n - 1) supset dots.h.c supset W_1 = C \, wide
    W_(n - k) in \| h_k \|_(W_(n - k + 1)) quad \( 1 lt.eq k lt.eq n - 1 \) . $
  At step $k$, fix the preceding nonnegative integers $b_1 \, dots.h \, b_(k - 1)$ and put
  $ cal(F)_k = cal(G)_j \|_(W_(n - k + 1)) #scale(x: 180%, y: 180%)[\(] -
    sum_(i < k) b_i h_i #scale(x: 180%, y: 180%)[\)] . $
  For each $b_k gt.eq 0$, the divisor restriction sequence is
  $ 0 arrow.r cal(F)_k \( - \( b_k + 1 \) h_k \) arrow.r cal(F)_k \( - b_k h_k \) arrow.r
    cal(F)_k \( - b_k h_k \) \|_(W_(n - k)) arrow.r 0 . $
  Iterating it for $b_k = 0 \, 1 \, dots.h$ and then proceeding to the next member of the flag bounds the section
    space by
  #[#set math.equation(numbering: n => "(6.13)")
   $ h^0 \( W \, cal(G)_j \) lt.eq sum_(b_1 \, dots.h \, b_(n - 1) gt.eq 0) h^0
     (C \, cal(G)_j \|_C #scale(x: 180%, y: 180%)[\(] - sum_i b_i h_i \|_C #scale(x: 180%, y: 180%)[\)]) .
     $ <fr:flag-lattice-sum>]
  At each stage the remainder is zero after sufficiently negative ample twisting.
    Its stopping index need not be uniform in $j \, p$ or in the preceding twists:
    enlarging the nonnegative finite sums to the displayed lattice sum preserves the inequality.
  A summand in (6.13) vanishes when $sum_i b_i \( h_i dot.op C \) > M_p$,
    because then its maximum slope is negative. Each nonzero summand has at most $e_j \( M_p + 1 \)$ sections.
    Indeed, evaluation at $floor.l M_p floor.r + 1$ distinct points is injective;
    the kernel has negative maximum slope after subtracting those points. By (6.3) it follows that
  #[#set math.equation(numbering: n => "(6.14)")
   $ h^0 \( W \, cal(G)_j \) & lt.eq e_j \( M_p + 1 \) product_(i = 1)^(n - 1) (1 + frac(M_p, l_i Lambda H^n))\
 & = e_j p^n #scale(x: 120%, y: 120%)[\(] 7^n H^n + O \( 1 \/ p \) #scale(x: 120%, y: 120%)[\)] .
   $ <fr:common-flag-polynomial>]
  The leading coefficient follows from $Lambda = product_i l_i$.
    More importantly, the whole scalar polynomial on the first line is the same for every $j$.
  Sum over the filtration in (6.7). The ranks satisfy $sum_j e_j = p^n$,
    so (6.14) gives the asserted bound with $R = p^(2 n)$. There is no extra factor for the number of graded
    pieces. Finally
  $ 7^n H^n lt.eq \( 14 epsilon.alt \)^n < 1 \/ 4 $
  by (6.1), proving the strict inequality for all large $p$. ◻
]

=== 6.6 The two orders of the determinant <fr:determinant>

Choose $R$ generically independent columns of (6.4) from bases of its source vector spaces.
  Their determinant is a nonzero section

$ 0 eq.not sigma in H^0 \( W' times W' \, cal(Q)_1 times.square cal(Q)_2 \) $

of an actual external-product line bundle. To specify its factors,
  let $m_i$ be the sum of the weights of the $R$ chosen columns in slot $i$.
  The target determinant is $\( det cal(E) \)^s times.square \( det cal(E) \)^s$,
  and the chosen source determinant is $cal(O) \( - m_1 S' \) times.square cal(O) \( - m_2 S' \)$. Thus

$ cal(Q)_i = \( det cal(E) \)^(⊗ s) ⊗ cal(O)_(W') \( m_i S' \) \, wide lambda_i = m_i \/ R . $

Every column weight lies between $0$ and $q$, so $0 lt.eq lambda_i lt.eq q$ independently of the columns chosen.

Under the numerical identification with the base-field twist,

#[#set math.equation(numbering: n => "(6.15)")
 $ frac(c_1 \( cal(Q)_i \), R) = frac(c_1 \( cal(E) \), s) + lambda_i S = B_p / p + frac(p - 1, 2 p) K_W +
   lambda_i S \, wide 0 lt.eq lambda_i lt.eq q . $ <fr:slot-determinant-class>]

The Frobenius first-Chern-class identity is also [30] Lemma 4.2; it is an identity of rational divisor classes.
  For the second equality, use (6.8). Complementary degrees in (6.9) have total first Chern class $e_j \( p - 1 \)
  K_W$. Summing gives

$ sum_j c_1 \( A_j \( Omega_W^1 \) \) = frac(s \( p - 1 \), 2) K_W . $

Thus $c_1 \( F^(*) cal(E) \) = s B_p + s \( p - 1 \) K_W \/ 2$,
  and Frobenius pullback of twisted divisor classes multiplies by $p$, as required.

For $0 lt.eq lambda lt.eq q$, the fixed movable inequality gives

$ \( D + K_W \/ 2 + lambda S \) dot.op gamma lt.eq 40 epsilon.alt J dot.op gamma \, $

where pullback by $pi_x$ is understood. This concerns only intersections of fixed divisors and the fixed
  complete-intersection witness, so it remains true on the reduction.
  The class in (6.15) differs from its left-hand divisor at $lambda = lambda_i$ by

$ 1 / p #scale(x: 120%, y: 120%)[\(] B_p - p D - K_W \/ 2 #scale(x: 120%, y: 120%)[\)] . $

Its numerator belongs to the fixed finite list $T_0 - a D - K_W \/ 2$, $a in { 0 \, dots.h \, k_0 - 1 }$.
  The resulting error after intersection with $gamma$ is therefore $O \( p^(- 1) \)$,
  uniformly over the selected determinant columns.

Let $x'$ be the twisted point and let $0 eq.not tau_i in H^0 \( W' \, cal(Q)_i \)$.
  The strict transform of its effective divisor on the blowup at $x'$ pairs nonnegatively with the twist of
  $gamma$. Since $J dot.op gamma > 0$, it follows that

#[#set math.equation(numbering: n => "(6.16)")
 $ frac("ord"_(x') \( tau_i \), R) lt.eq 40 epsilon.alt + O \( 1 \/ p \) . $ <fr:slot-order>]

The constant is uniform in the columns and in $tau_i$. This argument tests sections on the reduction itself;
  it does not require them to lift to characteristic zero.

Künneth identifies the space containing $sigma$ with $H^0 \( W' \, cal(Q)_1 \) ⊗ H^0 \( W' \, cal(Q)_2 \)$.
  Choose bases adapted to the orders of vanishing at $x'$ in each factor.
  In each degree their leading terms are linearly independent.
  Tensor products of these leading terms remain independent in each bidegree of the two disjoint sets of
  parameters; terms of different bidegrees cannot cancel. Every nonzero tensor consequently has order at most the
  sum of the two maximum basis orders. Applying (6.16), we obtain

#[#set math.equation(numbering: n => "(6.17)")
 $ "ord"_(\( x' \, x' \)) sigma lt.eq R #scale(x: 120%, y: 120%)[\(] 80 epsilon.alt +
   O \( 1 \/ p \) #scale(x: 120%, y: 120%)[\)] . $ <fr:determinant-order-upper>]

On the other hand, (6.6) and Lemma 24 bound the matrix rank at $\( x' \, x' \)$ by a number strictly smaller than
  $R \/ 4$. Trivialize its line bundles near that point. Invertible constant row operations make more than $3 R \/
  4$ rows vanish at the point. Each entry of those rows belongs to the maximal ideal,
  so every term of the determinant has order at least $3 R \/ 4$. Therefore

#[#set math.equation(numbering: n => "(6.18)")
 $ "ord"_(\( x' \, x' \)) sigma gt.eq 3 R \/ 4 . $ <fr:determinant-order-lower>]

Equations (6.17) and (6.18) contradict $80 epsilon.alt < 3 \/ 4$ for sufficiently large $p$.

This contradiction proves Theorem 20. The full-rank calculation used $z_(*)$,
  while the diagonal estimate holds at every point and was tested at the separately chosen $x$.
  The errors were controlled by one fixed finite list of divisor classes and one fixed flag polynomial.
  Thus their constants do not depend on $p$, the filtration index, or the chosen columns.

=== 6.7 Application to the terminal case <fr:application>

We return to Theorem 17. Thus $X$ is a projective terminal $bb(Q)$-factorial variety of dimension $n gt.eq
  2$ with $K_X tilde.op 0$, and $L$ is a nef Cartier divisor of full nef dimension. Assume that $L$ is not big.
  Recall the ample rational divisors $P = r \( L + t A \)$,
  where $A$ is a fixed ample Cartier divisor and $t > 0$ tends to zero, with

$ r arrow.r oo \, wide P^n arrow.r epsilon.alt^n \, wide rho = \( P^n \)^(1 \/ n) . $

The positive rational number $epsilon.alt$ was chosen so that $\( 14 epsilon.alt \)^n < 1 \/ 4$ and $80
  epsilon.alt < 3 \/ 4$. Choose the integer $q$ supplied by Proposition 19,
  and then choose $t$ sufficiently small that this proposition and Lemma 18 apply, that $r > q + 1$,
  and that $P^n < \( 2 epsilon.alt \)^n$. We now fix $t$, and therefore also $P \, r \,
  rho$ and the projective bundle in (5.6). Every remaining choice is made over $bb(C)$ before reducing to positive
  characteristic.

===== 6.7.1 The divisors and the flag. <the-divisors-and-the-flag.>

Choose a smooth projective resolution $w : W arrow.r X$ and set

$ D = w^(*) P \, wide S = w^(*) L \, wide H_0 = w^(*) P . $

The divisor $S$ is integral Cartier, and $H_0$ is nef and big.
  Since $X$ is terminal and $K_X tilde.op 0$, there is an integral effective $w$-exceptional divisor $E$ with $K_W
  tilde.op E$. The projection formula and the nefness of $P - r L$ give

$ K_W H_0^(n - 1) = 0 \, wide \( 2 D + q S \) H_0^(n - 1) lt.eq \( 2 + q \/ r \) H_0^n . $

At $H_0$, the inequalities $K_W H_0^(n - 1) < 2 H_0^n \/ r$ and $\( 2 D + q S \) H_0^(n - 1) < 4
  H_0^n$ are strict. Thus, by continuity of intersection products,
  a sufficiently small rational ample perturbation $H = H_0 + eta A_W$,
  with $A_W$ an ample Cartier divisor on $W$ and $eta > 0$, satisfies

$ H^n lt.eq \( 2 epsilon.alt \)^n \, wide K_W H^(n - 1) lt.eq 2 H^n \/ r \, wide \( 2 D + q S \) H^(n - 1) lt.eq
  4 H^n . $

This gives (6.1).

The canonical divisor of $W$ is pseudo-effective. Generic semipositivity of the cotangent bundle,
  originating in [25] and used here in the form [7] Theorem 2.1,
  together with restriction to sufficiently general complete-intersection curves [24] Theorem 6.1,
  gives a smooth integral flag with successive divisor classes $l_i H$,
  for sufficiently large divisible integers $l_i$, such that

$ mu_min \( Omega_W^1 \|_C \) gt.eq 0 . $

This is the flag in Hypothesis (i) of Theorem 20.

===== 6.7.2 The finite jet system. <the-finite-jet-system.>

On the bundle of (5.6), write $R = P_1 + P_2 + q xi$. The divisor $R$ is ample:
  $xi$ is nef and relatively ample, and $P_1 + P_2$ is the pullback of an ample divisor on $X times X$.
  Proposition 19 supplies a smooth point $z_(*)$ in the complement of the two axes with

$ epsilon \( R \; z_(*) \) > 2 n + 2 . $

The point can be chosen over the open set where $w$ is an isomorphism.
  Choose a rational number $a$ strictly between $2 n + 2$ and $epsilon \( R \; z_(*) \)$.
  On the blowup $b : tilde(Z) arrow.r Z$ at $z_(*)$, with exceptional divisor $G$, the rational divisor $b^(*) R -
  a G$ is ample. For sufficiently large divisible $k_0$, Serre vanishing gives

$ H^1 #scale(x: 120%, y: 120%)[\(] tilde(Z) \, cal(O)_(tilde(Z)) \( k_0 b^(*) R - k_0 a G \)
  #scale(x: 120%, y: 120%)[\)] = 0 . $

Since $z_(*)$ is smooth, the sections on the thickened exceptional divisor $k_0 a
  G$ identify with the jet quotient at $z_(*)$ modulo $frak(m)_(z_(*))^(k_0 a)$, in a local frame for $k_0 R$.
  The restriction sequence therefore shows that sections of $k_0 R$ generate jets through order $k_0 a - 1$,
  and hence through order $\( 2 n + 2 \) k_0$. Increase the divisibility of $k_0$ to make $k_0 P$ Cartier.
  Pulling these sections to

$ Z_W = bb(P) #scale(x: 120%, y: 120%)[\(] cal(O)_W \( S \)_1 xor cal(O)_W \( S \)_2 #scale(x: 120%, y: 120%)[\)]
  arrow.r W times W $

preserves the jets at the corresponding point, because the induced map $Z_W arrow.r
  Z$ is an isomorphism near that point. The pulled-back divisor is $D_1 + D_2 + q xi$.
  We have obtained the finite system required in Hypothesis (ii).

===== 6.7.3 The movable curve class. <the-movable-curve-class.>

Choose a very general point $x in W$ outside the exceptional locus, with image in the locus where Lemma 18 holds.
  Let $pi_x : hat(W) arrow.r W$ be its blowup and $J$ its exceptional divisor. The rational divisor

$ D^(+) = 2 D + E $

is big. For every sufficiently divisible positive integer $m$,
  normality of $X$ and exceptionality of $E$ give $w_(*) cal(O)_W \( m E \) = cal(O)_X$.
  Thus every section of $m D^(+)$ comes from a section of $2 m P$,
  multiplied by the section of the fixed divisor $m E$. Since $x in.not "Supp" E$, Lemma 18 implies

#[#set math.equation(numbering: n => "(6.19)")
 $ "ord"_x \( s \) \/ m lt.eq 8 rho < 16 epsilon.alt wide #scale(x: 120%, y: 120%)[\(] 0 eq.not s in
   H^0 \( W \, cal(O)_W \( m D^(+) \) \) #scale(x: 120%, y: 120%)[\)] . $ <fr:application-order>]

It follows that

#[#set math.equation(numbering: n => "(6.20)")
 $ pi_x^(*) D^(+) - 40 epsilon.alt J quad upright("is not pseudo-effective") . $ <fr:application-not-pe>]

Indeed, if it were pseudo-effective, a convex combination with the big divisor $pi_x^(*)
  D^(+)$ would make $pi_x^(*) D^(+) - c J$ big for any rational $c$ with $16 epsilon.alt < c < 40 epsilon.alt$.
  A nonzero section of a sufficiently divisible multiple would then give a section violating (6.19).

By the duality between pseudo-effective divisors and strongly movable curves [6],
  the strict separation in (6.20) is detected by a class

$ gamma = f_(*) \( A_1 dots.h.c A_(n - 1) \) \, wide f : V arrow.r hat(W) \, $

where $V$ is smooth projective, $f$ is birational, and the $A_i$ are ample integral Cartier divisors.
  To obtain this form, first choose a generating strongly movable class with negative pairing,
  then approximate its ample real classes by rational ones and clear denominators. We have

$ \( pi_x^(*) D^(+) \) dot.op gamma < 40 epsilon.alt J dot.op gamma . $

The left side is nonnegative, because $pi_x^(*) D^(+)$ is pseudo-effective, so $J dot.op gamma > 0$.

For every $0 lt.eq lambda lt.eq q$,

$ D^(+) - \( D + K_W \/ 2 + lambda S \) tilde.op_(bb(R)) w^(*) \( P - lambda L \) + E \/ 2 $

is pseudo-effective: $P - lambda L = \( P - r L \) + \( r - lambda \) L$ is nef and $E$ is effective.
  Pulling back to $hat(W)$ and pairing with $gamma$ therefore gives

$ pi_x^(*) \( D + K_W \/ 2 + lambda S \) dot.op gamma lt.eq \( pi_x^(*) D^(+) \) dot.op gamma < 40 epsilon.alt J
  dot.op gamma . $

This proves Hypothesis (iii). All the hypotheses of Theorem 20 now hold for one fixed collection of complex data,
  a contradiction. Hence $L$ is big, completing the proof of Theorem 17.

== 7 Completion of the full-dimension induction <sec:completion>

Theorem 17 treats varieties with terminal singularities and linearly trivial canonical divisor.
  We now pass to klt Calabi–Yau pairs and complete the full-dimension assertion.
  The boundary perturbation below follows the reduction in [22] Section 7:
  an effective representative of a small boundary perturbation plus the nef divisor allows ordinary log abundance
  to be applied to a multiple of that nef divisor.

#thm([Proposition 7.1.])[
  #emph[Let $n gt.eq 2$, and assume $\( P_j \)$ for every $j < n$, together with Theorems 4 and 5.
    Let $\( X \, B \)$ be a projective klt $bb(Q)$-pair over $bb(C)$ of dimension $n$,
    and let $M$ be a nef $bb(Q)$-Cartier divisor on $X$. Suppose that $T = K_X + B$ is pseudo-effective and that,
    for some rational $a > 0$,
$ \( T + a M \) dot.op C > 0 $

 for every integral curve $C$ through a very general point of $X$. Then $T + c M$ is big for every rational $c > 0$.]
] <prop:full-all>

#proof[
  Proposition 8 proves the assertion when $kappa \( T \) > 0$.
    Proposition 9 reduces the remaining case to the following claim in dimension $n$:
  #[#set math.equation(numbering: n => "(7.1)")
   $ \( X \, B \) upright(" projective klt") \, wide K_X + B equiv 0 \,\
M upright(" nef and ") bb(Q) upright("-Cartier of full nef dimension") quad arrow.r.double quad
  M upright(" big") . $ <eq:completion-cy-claim>]
  We prove this claim first with $B = 0$ and then with arbitrary boundary.
    We may take a small projective $bb(Q)$-factorialization throughout:
    the adjoint and $M$ pull back, full nef dimension is preserved on the isomorphism locus,
    and bigness of the pullback implies bigness downstairs.
  #emph[The case of zero boundary.] Suppose that $X$ is klt and $K_X equiv 0$.
    Theorem 4 makes $K_X$ semiample, hence $K_X tilde.op_(bb(Q)) 0$.
    Indeed, a semiample numerically trivial divisor defines a morphism with zero-dimensional image,
    so a sufficiently divisible multiple is linearly trivial.
  Take the global index-one cover
  $ pi : X^(upright("ind")) arrow.r X $
  associated with a trivialization of the smallest positive multiple of $K_X$ that is linearly trivial.
    This is a finite quasi-étale cover, and
  $ K_(X^(upright("ind"))) = pi^(*) K_X tilde.op 0 . $
  The cover is klt. Since its canonical divisor is Cartier, its log discrepancies are positive integers,
    hence at least one; it therefore has canonical singularities.
    These are the standard index-one cover properties for klt varieties;
    see [19] Definition 5.19 and Proposition 5.20. By the crepant terminalization theorem [3] Corollary 1.4.3,
    there is a projective birational morphism
  $ h : tilde(X) arrow.r X^(upright("ind")) $
  with $tilde(X)$ terminal and $bb(Q)$-factorial and $K_(tilde(X)) = h^(*) K_(X^(upright("ind")))$.
    In particular, $K_(tilde(X))$ is Cartier and linearly trivial, as required by Theorem 17.
  Set $tilde(M) = \( pi compose h \)^(*) M$. This divisor is nef and has full nef dimension.
    To verify the latter assertion, choose a very general point upstairs outside the exceptional locus of $h$ and
    above the very general locus used for $M$. Every curve through this point has a curve as its image in $X$,
    and the projection formula gives strictly positive $tilde(M)$-degree.
    A positive Cartier multiple of $tilde(M)$ is therefore big by Theorem 17.
    Bigness is detected by a dominant generically finite pullback, so $M$ is big on $X$.
  #emph[Introducing the boundary.] Now let $\( X \, B \)$ satisfy the hypotheses of (7.1), with $B eq.not 0$.
    Theorem 4 gives
  $ K_X + B tilde.op_(bb(Q)) 0 . $
  Choose a rational $alpha > 0$ sufficiently small that $\( X \, \( 1 + alpha \) B \)$ remains klt, and put
  $ T_(*) = K_X + \( 1 + alpha \) B tilde.op_(bb(Q)) alpha B . $
  Thus $T_(*)$ is pseudo-effective and $kappa \( T_(*) \) gt.eq 0$. The full condition holds for $T_(*)$ and $M$:
    for a curve $C$ through a point outside $"Supp" B$, we have $T_(*) dot.op C = alpha B dot.op C gt.eq 0$,
    whereas $M dot.op C > 0$ if that point is very general. We will show that $T_(*) +
    M$ is big without using the conclusion of the present proposition.
  If $kappa \( T_(*) \) > 0$, this follows from Proposition 8.
    Suppose instead that $kappa \( T_(*) \) = 0$, and apply Lemma 7 to $\( X \, \( 1 + alpha \) B \)$ and $M$.
    Write $Y$ for its final model, $B_Y$ and $N$ for the transforms of $B$ and $M$, and
  $ U = K_Y + \( 1 + alpha \) B_Y . $
  The output has $U tilde.op_(bb(Q)) 0$ and, for some rational $s > 0$, the divisor $U +
    s N$ is nef of full nef dimension. The maps in the construction extract no divisors,
    so pushing forward the rational linear equivalence $K_X + B tilde.op_(bb(Q)) 0$ also gives
  $ K_Y + B_Y tilde.op_(bb(Q)) 0 . $
  Subtracting these two equivalences shows that $alpha B_Y tilde.op_(bb(Q)) 0$.
    Since $B_Y$ is effective on a projective variety, intersection with a sufficiently ample complete-intersection
    curve forces $B_Y = 0$. The ordinary pair on $Y$ is therefore klt with zero boundary and $K_Y tilde.op_(bb(Q))
    0$. Moreover, $N$ is nef of full nef dimension, because $U + s N equiv s N$.
    The zero-boundary case just proved makes $N$, and hence $U + s N$, big.
  On a common smooth resolution, with maps $p$ to $X$ and $q$ to $Y$,
    the effective exceptional comparison from the reduction is
  $ p^(*) \( T_(*) + s M \) = q^(*) \( U + s N \) + E \, wide E gt.eq 0 . $
  It follows that $T_(*) + s M$ is big. Choose a positive rational $lambda$ with $lambda < min { 1 \, 1 \/ s }$. Then
  $ T_(*) + M = lambda \( T_(*) + s M \) + \( 1 - lambda \) T_(*) + \( 1 - lambda s \) M $
  is big, since the first summand is big and the other two are pseudo-effective.
    We have thus established bigness of $T_(*) + M$ in both cases.
  Choose an effective $bb(Q)$-divisor $G$ with
  $ G tilde.op_(bb(Q)) T_(*) + M tilde.op_(bb(Q)) alpha B + M . $
  For a sufficiently small rational $u > 0$, the divisor
  $ Delta_u = \( 1 - u alpha \) B + u G $
  is effective and $\( X \, Delta_u \)$ is klt. To see this explicitly,
    take $u alpha < 1$ and choose $u$ small enough that $\( X \, B + u G \)$ is klt on a fixed log resolution;
    then $Delta_u lt.eq B + u G$. Its adjoint satisfies
  $ K_X + Delta_u tilde.op_(bb(Q)) K_X + B + u \( G - alpha B \) tilde.op_(bb(Q)) u M . $
  This adjoint is nef, so Theorem 4 makes it semiample. Consequently $M$ itself is semiample.
    The morphism given by a free multiple of $M$ has zero-dimensional general fiber:
    a positive-dimensional fiber through a very general point would contain a curve of $M$-degree zero,
    contrary to full nef dimension. That morphism is therefore generically finite onto its image, and $M$ is big.
    This proves (7.1) for all klt Calabi–Yau pairs.
  Proposition 9 now supplies the case $kappa \( T \) = 0$, while Proposition 8 supplies $kappa \( T \) > 0$.
    These exhaust the possibilities furnished by the minimal-model and abundance inputs for a pseudo-effective klt
    adjoint, and establish the proposition. ◻
]

== 8 Positive parts and numerical semiampleness <sec:positive>

We complete the simultaneous induction by proving the following positive-part statement.

#thm([Proposition 8.1.])[
  #emph[For every projective klt $bb(Q)$-pair $\( X \, B \)$ over $bb(C)$ with $K_X +
    B$ pseudo-effective and every nef $bb(Q)$-Cartier divisor $M$ on $X$,
    there is a smooth projective birational model $w : W arrow.r X$ such that
$ P_sigma #scale(x: 120%, y: 120%)[\(] w^(*) \( K_X + B + M \) #scale(x: 120%, y: 120%)[\)] $

 is rational and numerically equivalent to a semiample $bb(Q)$-divisor.]
] <prop:positive-part>

For the inductive step, fix such $\( X \, B \)$ and $M$ with $dim X = n gt.eq 2$, and put $T = K_X + B$.
  We assume $\( Z_j \)$ for $j < n$ and use $\( P_n \)$ from Proposition 25.
  Following the positive-part method of Lazić–Peternell [22] Theorem 5.3,
  we first make a sufficiently large adjoint nef. Full nef dimension then gives bigness by $\( P_n \)$;
  otherwise its nef reduction permits the nef summand to descend to a lower-dimensional base.

=== 8.1 Positive parts under the required comparisons <positive-parts-under-the-required-comparisons>

We will repeatedly use the following properties of Nakayama’s divisorial Zariski decomposition [27].

#thm([Lemma 8.2.])[
  #emph[The following assertions hold.]
  + #emph[Let $p : V arrow.r X$ be a projective birational morphism from a smooth projective variety to a normal
    projective variety. If $D$ is a pseudo-effective $bb(Q)$-Cartier divisor on $X$ and $E$ is an effective
    $p$-exceptional rational divisor, then
$ P_sigma \( p^(*) D + E \) = P_sigma \( p^(*) D \) . $

]
  + #emph[Let $f : V arrow.r S$ be a surjective morphism of smooth projective varieties,
    and let $D$ be a pseudo-effective rational divisor on $S$. If $P_sigma \( D \)$ is nef, then
$ P_sigma \( f^(*) D \) = f^(*) P_sigma \( D \) . $

]
  + #emph[For rational divisors on a fixed smooth projective variety,
    rationality and numerical semiampleness of the positive part depend only on the numerical class of the divisor.]
] <lemma:positive-properties>

#proof[
  The first two statements are [22] Lemmas 2.4 and 2.5; the first allows the target $X$ to be normal.
    For the third, each asymptotic divisorial order $sigma_Gamma \( D \)$ depends only on the numerical class.
    Thus numerically equivalent divisors have the same negative part as an actual real divisor.
    For rational $D \, D'$ with $D equiv D'$,
  $ P_sigma \( D' \) - P_sigma \( D \) = D' - D . $
  Consequently one positive part is rational if and only if the other is,
    and the two positive parts are numerically equivalent. ◻
]

In particular, a positive part that is rational and numerically semiample is nef,
  so these properties persist on higher smooth models. Suppose that on a common smooth resolution of a birational
  contraction one has

#[#set math.equation(numbering: n => "(8.1)")
 $ p^(*) D equiv q^(*) D' + E \, $ <eq:positive-transfer>]

where $D \, D'$ are pseudo-effective rational Cartier divisors and $E$ is effective and $q$-exceptional.
  If a smooth model over the target has rational numerically semiample positive part for $D'$,
  take a higher common resolution dominating that model. The second part of Lemma 27 pulls that positive part to
  the common resolution. Its first and third parts, applied to (8.1), give the same conclusion for $D$.
  This is the comparison that will be used at each birational step.

=== 8.2 An MMP trivial on the nef divisor <an-mmp-trivial-on-the-nef-divisor>

#thm([Lemma 8.3.])[
  #emph[Let $\( X \, B \)$ be a projective $bb(Q)$-factorial klt $bb(Q)$-pair of dimension $n$, with $T = K_X +
    B$ pseudo-effective, and let $L$ be a nef Cartier divisor on $X$.
    If $m$ is an integer greater than $2 n$, there is a terminating $\( T + m L \)$-MMP whose every step is
    $L$-trivial and is an ordinary $T$-negative step. On its output, the transform of $L$ is Cartier and nef,
    and the transform of $T + m L$ is nef.]
] <lemma:large-nef-adjoint>

#proof[
  Use Theorem 5 for the generalized klt pair whose nef data are $m L$ on $X$.
    Its adjoint $T + m L$ is pseudo-effective. Suppose inductively that on the current model the ordinary pair is
    klt and the transform, still denoted by $L$, is Cartier and nef.
    Every $\( T + m L \)$-negative extremal ray is $T$-negative.
    By the ordinary length bound, it has a rational curve generator $C$ with $0 < - T dot.op C lt.eq 2 n$.
    If $L dot.op C > 0$, integrality gives
  $ \( T + m L \) dot.op C gt.eq - 2 n + m > 0 \, $
  which is impossible. Hence $L dot.op C = 0$.
  The Cartier descent statement in the ordinary cone and contraction theorem gives a Cartier divisor on the
    contraction base whose pullback is $L$. It is nef: lift any curve on the base to a curve dominating it and use
    the projection formula. In a flip its pullback to the flipped variety is therefore again Cartier and nef.
    The relative signs of $T + m L$ are those of $T$, so the flip is also an ordinary flip for the klt pair.
    Thus the inductive hypotheses persist. The terminating program supplied by Theorem 5 has all the stated
    properties. ◻
]

Apply the lemma after a small $bb(Q)$-factorialization, with $L =
  m_0 M$ for an integer $m_0 > 0$ making $L$ Cartier. The program is $M$-trivial,
  so on a common resolution its ordinary adjoint comparison also gives

$ p^(*) \( T + M \) = q^(*) \( T' + M' \) + E \, $

where $E$ is effective and exceptional over the output. The transformed ordinary adjoint $T'$ remains
  pseudo-effective, and $M'$ is nef. By (8.1), it suffices to prove $\( Z_n \)$ on that output.
  We may consequently retain the notation $X \, B \, T \, M \, L$ and assume in addition that

#[#set math.equation(numbering: n => "(8.2)")
 $ T + m L upright(" is nef") . $ <eq:large-adjoint-nef>]

=== 8.3 The case of full nef dimension <the-case-of-full-nef-dimension>

Suppose first that $T + m L$ has full nef dimension. Then (3.1) holds, and $\( P_n \)$ shows that $T + M$ is big.
  Write, by Kodaira’s lemma,

$ T + M tilde.op_(bb(Q)) A_1 + G_1 \, $

where $A_1$ is ample and $G_1 gt.eq 0$ is rational. Choose a rational $v >
  0$ sufficiently small that $\( X \, B + v G_1 \)$ is klt.
  Since $M + v A_1$ is ample, a general effective rational representative $A'$ of this divisor can be chosen with
  sufficiently small coefficients that $\( X \, B + v G_1 + A' \)$ is klt. Its adjoint satisfies

#[#set math.equation(numbering: n => "(8.3)")
 $ K_X + B + v G_1 + A' tilde.op_(bb(Q)) \( 1 + v \) \( T + M \) . $ <eq:big-ordinary-boundary>]

It is big and has a good minimal model: one may use the big-case theorem of [3], or combine Theorems 5 and 4.
  On a common resolution, the left side of (8.3) is the pullback of a semiample divisor plus an effective
  exceptional divisor. Its positive part is therefore the semiample pullback.
  Dividing by $1 + v$ proves $\( Z_n \)$ in this case.

=== 8.4 Descent along a nef reduction <descent-along-a-nef-reduction>

We treat the remaining case, where the nef dimension of $T + m L$ is strictly smaller than $n$. Let

$ X arrow.r.dashed Z $

be its nef reduction, with $Z$ normal and projective. A very general compact fibre $F$ is contained in the
  morphism locus and has positive dimension. On this fibre,

$ \( T + m L \) \|_F equiv 0 . $

The restriction $T \|_F$ is pseudo-effective. To see this,
  choose effective rational approximations to $T$ after adding positive ample perturbations tending to zero,
  and choose $F$ outside the countably many exceptional choices for these approximations.
  Their restrictions are effective, and their classes approach $T \|_F$.
  After a resolution of $F$ the same argument applies to the pullbacks.
  As $L \|_F$ is nef and $T \|_F equiv - m L \|_F$, both divisors are numerically trivial.
  Indeed, intersect this equality with an ample complete-intersection curve on a smooth resolution of $F$.
  Pseudo-effectivity makes the left side nonnegative and nefness makes the right side nonpositive.
  Their common value is zero, and a nef divisor with zero intersection against an ample complete-intersection
  curve is numerically trivial.

Restriction to a sufficiently general fibre gives a klt pair $\( F \, B \|_F \)$ with adjoint $T \|_F$.
  By Theorem 4, its numerically trivial adjoint is semiample, hence

#[#set math.equation(numbering: n => "(8.4)")
 $ K_F + B \|_F tilde.op_(bb(Q)) 0 . $ <eq:fibre-adjoint-trivial>]

These restrictions are made where the almost holomorphic nef reduction is a morphism.
  Normality and the klt restriction statement hold after shrinking the base;
  alternatively they follow by restricting a log resolution over a general smooth open.
  Numerical triviality, initially obtained for very general fibres,
  also follows on a general fibre by the constancy of the relevant intersection numbers in this family.

We next use the birational descent of nef divisors [22] Lemma 3.1.
  After resolving the nef reduction and modifying its base birationally, it supplies a diagram

$ X arrow.l^p X_1 arrow.r^f Z_1 $

in which $X_1 \, Z_1$ are smooth and projective, $p$ is birational, $f$ is a contraction,
  and there is a rational divisor $M_1$ on $Z_1$ with

#[#set math.equation(numbering: n => "(8.5)")
 $ p^(*) M equiv f^(*) M_1 . $ <eq:nef-descent>]

The divisor $M_1$ is nef, since its pullback is numerically equivalent to the nef divisor $p^(*)
  M$ and nefness descends under a surjective morphism. We may take a further log resolution of the pair on top
  without affecting (8.5).

Write the crepant boundary as $B_1^(+) - B_1^(-)$, with effective rational divisors of disjoint support, so that

$ K_(X_1) + B_1^(+) - B_1^(-) = p^(*) \( K_X + B \) . $

Set $B_1 = B_1^(+)$ and $E = B_1^(-)$. Since the original boundary is effective, $E$ is $p$-exceptional.
  Klt singularities make all coefficients of $B_1$ less than one, and its support is simple normal crossings.
  Thus $\( X_1 \, B_1 \)$ is klt and

#[#set math.equation(numbering: n => "(8.6)")
 $ K_(X_1) + B_1 = p^(*) T + E \, wide E gt.eq 0 . $ <eq:resolved-boundary>]

In particular its adjoint is pseudo-effective.

If $F_1$ is a general fibre of $f$, it maps birationally onto the corresponding compact fibre $F$ of the nef
  reduction. Every component of $E$ that meets $F_1$ restricts to an exceptional divisor over $F$:
  for a centre dominating the base, codimension at least two is preserved on the general fibre,
  and the other centres are avoided. Equations (8.4) and (8.6) therefore show that

#[#set math.equation(numbering: n => "(8.7)")
 $ kappa #scale(x: 120%, y: 120%)[\(] F_1 \, \( K_(X_1) + B_1 \) \|_(F_1) #scale(x: 120%, y: 120%)[\)] =
   0 . $ <eq:fibre-kappa-zero>]

The restriction is an effective exceptional divisor up to rational linear equivalence.
  Equivalently, its section spaces are those of the trivial divisor on the normal fibre $F$.
  In particular the general fibre pair has pseudo-effective adjoint and has a good minimal model by Theorems 5 and 4.

=== 8.5 A relative good model and a lower-dimensional adjoint <a-relative-good-model-and-a-lower-dimensional-adjoint>

At this point the nef summand comes from $Z_1$, while the ordinary adjoint has Iitaka dimension zero on its
  general fibres. We use a relative good model to express that ordinary adjoint as a pullback from a variety of
  dimension less than $n$.

The relative log canonical ring of the rational klt pair $\( X_1 \, B_1 \)$ over $Z_1$ is finitely generated.
  More precisely, for a positive integer $r$ making $r \( K_(X_1) + B_1 \)$ Cartier, its Veronese algebra

$ xor.big_(ell gt.eq 0) f_(*) cal(O)_(X_1) #scale(x: 120%, y: 120%)[\(] ell r \( K_(X_1) + B_1 \)
  #scale(x: 120%, y: 120%)[\)] $

is a finitely generated $cal(O)_(Z_1)$-algebra. This is the relative finite-generation theorem for rational klt
  pairs, in the form [11] Theorem 1.4, obtained from the finite-generation theorem of [3] and the canonical-bundle
  reduction of Fujino–Mori [14] Theorem 5.2. Together with the good minimal models of the very general closed
  fibres established above, this verifies both hypotheses of [16] Theorem 2.12.
  That theorem gives a good minimal model over $Z_1$; the termination statement for an MMP with scaling once a
  good model exists, [16] Corollary 2.9, supplies a relative program

$ \( X_1 \, B_1 \) arrow.r.dashed \( X_2 \, B_2 \) . $

Thus $X_2$ is projective and $bb(Q)$-factorial, $\( X_2 \, B_2 \)$ is klt, and $K_(X_2) +
  B_2$ is semiample over $Z_1$. This application uses very general closed fibres over $bb(C)$ and requires no
  change of the ground field to a geometric generic field.

By (8.5), we may replace the nef term numerically by $f^(*) M_1$ before making the positive-part comparisons.
  This pullback is trivial on every step of the relative program and is carried unchanged from the base.
  The ordinary adjoint remains pseudo-effective by numerical pushforward.

Let

$ X_2 arrow.r^g Z_2 arrow.r^j Z_1 $

be the relative semiample fibration of $K_(X_2) + B_2$, with $g$ a contraction.
  Its construction gives a $j$-ample $bb(Q)$-Cartier divisor $A_2$ on $Z_2$ such that

#[#set math.equation(numbering: n => "(8.8)")
 $ K_(X_2) + B_2 tilde.op_(bb(Q)) g^(*) A_2 . $ <eq:relative-iitaka>]

The relative program preserves Iitaka dimension on the general fibres,
  by its effective exceptional pullback comparisons. From (8.7), the relative Iitaka dimension is zero. Hence

$ dim Z_2 = dim Z_1 < n . $

Apply Ambro’s canonical bundle formula consequence [1] Theorem 0.2 to (8.8). Its hypotheses hold:
  $\( X_2 \, B_2 \)$ is a projective klt pair with effective rational boundary,
  $g$ is a contraction to a normal projective variety, and the ordinary adjoint is rationally linearly pulled back
  from a $bb(Q)$-Cartier divisor. It gives an effective rational boundary $B_(Z_2)$ such that
  $\( Z_2 \, B_(Z_2) \)$ is klt and

#[#set math.equation(numbering: n => "(8.9)")
 $ K_(X_2) + B_2 tilde.op_(bb(Q)) g^(*) \( K_(Z_2) + B_(Z_2) \) . $ <eq:base-adjoint>]

The base adjoint is pseudo-effective. One direct verification, using only the inputs already in force,
  is as follows. The pseudo-effective ordinary adjoint on $X_2$ has a good minimal model by Theorems 5 and 4;
  it therefore has a nonzero section in a sufficiently divisible positive multiple.
  Since $g_(*) cal(O)_(X_2) = cal(O)_(Z_2)$, the projection formula and (8.9) identify this section space with the
  corresponding section space on $Z_2$. Thus $K_(Z_2) + B_(Z_2)$ even has an effective rationally linearly
  equivalent divisor.

We are now in the setting of $\( Z_(dim Z_2) \)$: the pair on the base is klt with pseudo-effective adjoint,
  and $j^(*) M_1$ is a nef rational Cartier divisor. There is consequently a smooth projective birational model
  $w_2 : W_2 arrow.r Z_2$ on which

$ P_sigma #scale(x: 120%, y: 120%)[\(] w_2^(*) \( K_(Z_2) + B_(Z_2) + j^(*) M_1 \) #scale(x: 120%, y: 120%)[\)] $

is rational and numerically semiample. Resolve the main component of $X_2 times_(Z_2)
  W_2$ to obtain a smooth projective variety $V$ mapping birationally to $X_2$ and surjectively to $W_2$.
  Since the displayed positive part is nef, the pullback formula of Lemma 27, together with (8.9),
  proves the same positive-part assertion on $V$ for

$ K_(X_2) + B_2 + g^(*) j^(*) M_1 . $

Take a common resolution dominating both $V$ and $X_1$. The relative MMP compares $K_(X_1) + B_1$ with $K_(X_2) +
  B_2$ by adding an effective divisor exceptional over $X_2$.
  The $M_1$ terms have equal pullbacks, since they come from the relative base.
  The comparison (8.1) therefore proves the positive-part assertion on a smooth model over $X_1$ for $K_(X_1) +
  B_1 + f^(*) M_1$. Finally, (8.5) and (8.6) give

$ K_(X_1) + B_1 + f^(*) M_1 equiv p^(*) \( T + M \) + E \, $

where $E$ is effective and $p$-exceptional. Another application of Lemma 27 proves $\( Z_n \)$ on a smooth model
  over the original $X$.

#proof[
  #emph[Completion of the proof of Proposition 26.] The preceding argument proves $\( Z_n \)$ from $\( P_n \)$ and
    the lower-dimensional assertions. Together with Proposition 25 and the dimension-zero and dimension-one cases,
    it completes the simultaneous induction. ◻
]

=== 8.6 Descent to the original variety <descent-to-the-original-variety>

The positive-part statement is birational, whereas the main theorem requires a semiample representative on the
  original variety. The following descent uses the rational singularities of klt pairs;
  it is the numerical semiampleness statement of [22] Lemma 2.14.

#thm([Lemma 8.4.])[
  #emph[Let $p : W arrow.r X$ be a projective birational morphism from a smooth projective variety to a normal
    projective variety with rational singularities, over $bb(C)$. Let $D$ be a $bb(Q)$-Cartier divisor on $X$.
    If $p^(*) D$ is numerically equivalent to a semiample $bb(Q)$-divisor on $W$,
    then $D$ is numerically equivalent to a semiample $bb(Q)$-Cartier divisor on $X$.]
] <lemma:numsemiample-descent>

#proof[
  Choose a semiample rational divisor $A_W$ with $A_W equiv p^(*) D$.
    After clearing denominators, the difference of the corresponding line bundles is numerically trivial.
    Numerically trivial line bundles modulo $"Pic"^0 \( W \)$ are torsion.
    Thus, after increasing a positive integer $r$, we have
  $ cal(O)_W \( r A_W \) tilde.eq p^(*) cal(O)_X \( r D \) ⊗ P_W quad upright("with ") P_W in "Pic"^0 \( W \) . $
  Rational singularities identify $"Pic"^0 \( X \)$ with $"Pic"^0 \( W \)$ by pullback.
    Write $P_W = p^(*) P_X$ and set $cal(A)_X = cal(O)_X \( r D \) ⊗ P_X$.
    Then $p^(*) cal(A)_X tilde.eq cal(O)_W \( r A_W \)$.
  A positive power of the line bundle on the right is globally generated.
    Since $p_(*) cal(O)_W = cal(O)_X$, the projection formula identifies its sections with those of the same power
    of $cal(A)_X$. These sections generate downstairs: a failure at any point of $X$ would remain a failure at
    every point above it. Hence $cal(A)_X$ is semiample. A Cartier divisor representing $cal(A)_X$,
    divided by $r$, is semiample and numerically equivalent to $D$, because $P_X$ is algebraically trivial. ◻
]

We can now prove Theorem 1 over $bb(C)$. Its divisor $D = K_X + B + M$ is nef, so

$ P_sigma \( w^(*) D \) = w^(*) D $

on every smooth birational model. Proposition 26 makes this pullback numerically semiample.
  A klt variety has rational singularities, so Lemma 29 gives the required semiample rational Cartier divisor on $X$.

=== 8.7 Algebraically closed fields of characteristic zero <algebraically-closed-fields-of-characteristic-zero>

We finish by transferring the result to the ground fields in the statement of Theorem 1.
  The very general points used in the proof were needed only over $bb(C)$;
  numerical semiampleness itself descends by a finite-type parameter argument.

#thm([Lemma 8.5.])[
  #emph[Let $k_0 subset K$ be an extension of algebraically closed fields of characteristic zero.
    Let $X_0$ be a normal projective variety over $k_0$, and let $D_0$ be a $bb(Q)$-Cartier divisor.
    If its pullback $D_K$ to $X_K$ is numerically equivalent to a semiample $bb(Q)$-Cartier divisor,
    then $D_0$ has that property over $k_0$.]
] <lemma:field-transfer>

#proof[
  Clear denominators in $D_0$ and in a semiample representative over $K$,
    and take a further multiple which is globally generated. Its difference from the corresponding multiple of
    $D_K$ is numerically trivial. After another positive multiple this difference belongs to $"Pic"^0 \( X_K \)$,
    since numerical triviality modulo $"Pic"^0$ is torsion. We have therefore fixed an integer $r >
    0$ and a line bundle $P_K in "Pic"^0 \( X_K \)$ such that
  $ cal(O)_(X_K) \( r D_K \) ⊗ P_K $
  is globally generated.
  Choose a $k_0$-point of $X_0$ and rigidify line bundles there.
    The finite-type scheme $"Pic"^0 \( X_0 \)$ then has a Poincaré family.
    Tensor this family by the fixed line bundle $cal(O)_(X_0) \( r D_0 \)$.
    The set of parameters for which the resulting line bundle is globally generated is constructible.
    Indeed, stratify the parameter scheme so that the zeroth direct image is locally free and cohomology and base
    change hold. On each stratum use the evaluation map; the image in the parameter space of the support of its
    cokernel is closed, because projection from $X_0$ is proper.
    Its complement is the globally generated locus on that stratum.
  Formation of the Picard scheme and of this constructible condition commutes with the field extension.
    The locus is nonempty after extension to $K$, by the chosen $P_K$, and is consequently nonempty over $k_0$.
    As $k_0$ is algebraically closed, it has a $k_0$-point. The corresponding globally generated line bundle,
    represented by a Cartier divisor and divided by $r$, is the desired semiample rational divisor numerically
    equivalent to $D_0$. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Let $k$ be the given algebraically closed field of characteristic
    zero. Descend $X \, B \, M$, the required rational Cartier structures,
    and a projective embedding to a finitely generated subfield of $k$.
    Let $k_0 subset k$ be its algebraic closure inside $k$, and choose an embedding $k_0 arrow.r.hook bb(C)$.
  The hypotheses persist under the resulting algebraically closed field extensions.
    For klt singularities this follows from a log resolution, which can be included among the descended data.
    Nefness is invariant under field extension, since it can be tested by ampleness after arbitrarily small
    rational ample perturbations. Pseudo-effectivity is invariant for the same reason with bigness in place of
    ampleness: a rational divisor is pseudo-effective exactly when all its positive rational ample perturbations
    are big, and bigness is preserved and reflected by extension of the section spaces.
    These tests show both that the descended data satisfy the hypotheses and that their complex extension does.
  The result over $bb(C)$ supplies a semiample numerical representative of $K_X + B + M$ after this extension.
    Lemma 30 descends it to $k_0$. Extending that representative to $k$ preserves global generation of a suitable
    multiple and numerical equivalence. It is the required semiample $bb(Q)$-Cartier divisor on the original variety. ◻
]

#heading(level: 1)[References]
#bibitem([1])[F.~Ambro, #emph[The moduli $b$-divisor of an lc-trivial fibration], Compos. Math.
  #strong[141] (2005), no.~2, 385--403. #link("https://doi.org/10.1112/S0010437X04001071")[DOI].]
#bibitem([2])[Th.~Bauer, F.~Campana, Th.~Eckl, S.~Kebekus, Th.~Peternell, S.~Rams, T.~Szemberg, and L.~Wotzlaw,
  #emph[A reduction map for nef line bundles], in #emph[Complex Geometry:
  Collection of Papers Dedicated to Hans Grauert], Springer, Berlin, 2002, pp.~27--36.
  #link("https://doi.org/10.1007/978-3-642-56202-0_2")[DOI].]
#bibitem([3])[C.~Birkar, P.~Cascini, C.~D.~Hacon, and J.~McKernan,
  #emph[Existence of minimal models for varieties of log general type], J. Amer. Math. Soc.
  #strong[23] (2010), no.~2, 405--468. #link("https://doi.org/10.1090/S0894-0347-09-00649-3")[DOI].]
#bibitem([4])[C.~Birkar and D.-Q.~Zhang, #emph[Effectivity of Iitaka fibrations and pluricanonical systems of
  polarized pairs], Publ. Math. Inst. Hautes Études Sci. #strong[123] (2016), 283--331.
  #link("https://doi.org/10.1007/s10240-016-0080-x")[DOI].]
#bibitem([5])[J.~Blanc, #emph[Algebraic structures of groups of birational transformations],
  in #emph[Algebraic Groups: Structure and Actions] (M.~Bilen Can, ed.), Proc.~Sympos.~Pure Math.
  #strong[94], American Mathematical Society, Providence, RI, 2017, pp.~17--30.
  #link("https://algebra.dmi.unibas.ch/blanc/articles/structurebir.pdf")[Author-hosted published offprint].]
#bibitem([6])[S.~Boucksom, J.-P.~Demailly, M.~Păun, and Th.~Peternell,
  #emph[The pseudo-effective cone of a compact Kähler manifold and varieties of negative Kodaira dimension],
  J.~Algebraic Geom. #strong[22] (2013), no.~2, 201--248.
  #link("https://doi.org/10.1090/S1056-3911-2012-00574-8")[DOI].]
#bibitem([7])[F.~Campana and M.~Păun, #emph[Orbifold generic semi-positivity:
  an application to families of canonically polarized manifolds],
  Ann.~Inst.~Fourier (Grenoble) #strong[65] (2015), no.~2, 835--861. #link("https://doi.org/10.5802/aif.2945")[DOI].]
#bibitem([8])[Priyankur Chaudhuri, #emph[An inductive approach to generalized abundance using nef reduction], C.
  R. Math. Acad. Sci. Paris #strong[361] (2023), 417--421. #link("https://doi.org/10.5802/crmath.420")[DOI].]
#bibitem([9])[L.~Ein, O.~Küchle, and R.~Lazarsfeld, #emph[Local positivity of ample line bundles], J.
  Differential Geom. #strong[42] (1995), no.~2, 193--219. #link("https://doi.org/10.4310/jdg/1214457231")[DOI].]
#bibitem([10])[Claudio Fontanari, #emph[A remark on generalized abundance for surfaces], Eur. J. Math.
  #strong[10] (2024), article~7. #link("https://doi.org/10.1007/s40879-023-00716-y")[DOI].]
#bibitem([11])[O.~Fujino, #emph[Birkar--Cascini--Hacon--McKernan], author notes, version~1.02, 28 November 2009,
  Theorem~1.4. #link("https://www.math.kyoto-u.ac.jp/~fujino/BCHM01.pdf")[Author's notes].]
#bibitem([12])[O.~Fujino and Y.~Gongyo, #emph[On the moduli $b$-divisors of lc-trivial fibrations], Ann. Inst.
  Fourier (Grenoble) #strong[64] (2014), no.~4, 1721--1735. #link("https://doi.org/10.5802/aif.2894")[DOI].]
#bibitem([13])[O.~Fujino and K.~Hashizume, #emph[Existence of log canonical modifications and its applications],
  Eur. J. Math. #strong[9] (2023), no.~1, Paper No.~13, 32~pp.
  #link("https://doi.org/10.1007/s40879-023-00598-0")[DOI].]
#bibitem([14])[O.~Fujino and S.~Mori, #emph[A canonical bundle formula], J. Differential Geom.
  #strong[56] (2000), no.~1, 167--188.]
#bibitem([15])[S.~Fukuda, #emph[An elementary semi-ampleness result for log canonical divisors], Hokkaido Math. J.
  #strong[40] (2011), no.~3, 357--360. #link("https://doi.org/10.14492/hokmj/1319595860")[DOI].]
#bibitem([16])[C.~D.~Hacon and C.~Xu, #emph[Existence of log canonical closures], Invent. Math.
  #strong[192] (2013), no.~1, 161--195. #link("https://doi.org/10.1007/s00222-012-0409-0")[DOI].
  Numbering follows arXiv:1105.1169v3.]
#bibitem([17])[M.~Hanamura, #emph[Structure of birational automorphism groups, I:
  non-uniruled varieties], Invent.~Math. #strong[93] (1988), no.~2, 383--403.
  #link("https://doi.org/10.1007/BF01394338")[DOI].]
#bibitem([18])[Y.~Kitadai and H.~Sumihiro, #emph[Canonical filtrations and stability of direct images by Frobenius
  morphisms], Tohoku Math. J. (2) #strong[60] (2008), no.~2, 287--301.
  #link("https://doi.org/10.2748/tmj/1215442876")[DOI].]
#bibitem([19])[J.~Kollár and S.~Mori, #emph[Birational geometry of algebraic varieties],
  Cambridge Tracts in Mathematics, vol.~134, Cambridge University Press, Cambridge, 1998.
  #link("https://doi.org/10.1017/CBO9780511662560")[DOI].]
#bibitem([20])[A.~Langer, #emph[Semistable sheaves in positive characteristic], Ann. of Math.
  (2) #strong[159] (2004), no.~1, 251--276. #link("https://doi.org/10.4007/annals.2004.159.251")[DOI].]
#bibitem([21])[R.~Lazarsfeld, #emph[Positivity in Algebraic Geometry I: Classical Setting:
  Line Bundles and Linear Series], Ergebnisse der Mathematik und ihrer Grenzgebiete, vol.~48,
  Springer-Verlag, 2004.
  #link("https://www.math.stonybrook.edu/~roblaz/Reprints/Laz.PAG.Chapt1.pdf")[Author-hosted Chapter~1].]
#bibitem([22])[V.~Lazić and Th.~Peternell, #emph[On Generalised Abundance, I], Publ. Res. Inst. Math. Sci.
  #strong[56] (2020), no.~2, 353--389. #link("https://doi.org/10.4171/PRIMS/56-2-3")[DOI].
  Numbering follows arXiv:1808.00438v2, 6 September 2018.]
#bibitem([23])[Vladimir Lazić and Thomas Peternell, #emph[On Generalised Abundance, II], Peking Math. J.
  #strong[3] (2020), no.~1, 1--46. #link("https://doi.org/10.1007/s42543-019-00022-1")[DOI].]
#bibitem([24])[V.~B.~Mehta and A.~Ramanathan, #emph[Semistable sheaves on projective varieties and their
  restriction to curves], Math.~Ann. #strong[258] (1982), no.~3, 213--224.
  #link("https://doi.org/10.1007/BF01450677")[DOI].]
#bibitem([25])[Y.~Miyaoka, #emph[Deformations of a morphism along a foliation and applications],
  in #emph[Algebraic Geometry, Bowdoin, 1985] (Brunswick, Maine, 1985), Proc.~Sympos.~Pure Math.
  #strong[46], Part~1, American Mathematical Society, Providence, RI, 1987, pp.~245--268.
  #link("https://doi.org/10.1090/pspum/046.1/927960")[DOI].]
#bibitem([26])[M.~Mustaţă and K.~Schwede, #emph[A Frobenius variant of Seshadri constants], Math. Ann.
  #strong[358] (2014), nos.~3--4, 861--878. #link("https://doi.org/10.1007/s00208-013-0976-4")[DOI].
  Numbering follows arXiv:1203.1081v1.]
#bibitem([27])[N.~Nakayama, #emph[Zariski-decomposition and abundance], MSJ Memoirs, vol.~14,
  Mathematical Society of Japan, Tokyo, 2004.]
#bibitem([28])[OpenAI, #emph[Log abundance in characteristic zero],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Log-abundance-in-characteristic-zero-September-24-2026/paper.pdf")[OAI:Log-abundance-in-characteristic-zero-September-24-2026],
  2026.]
#bibitem([29])[OpenAI, #emph[Minimal models and Mori fibre spaces for generalized log canonical $bb(Q)$-pairs],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Minimal-models-and-Mori-fibre-spaces-for-generalized-log-canonical-Q-pairs-September-24-2026/paper.pdf")[OAI:Minimal-models-and-Mori-fibre-spaces-for-generalized-log-canonical-Q-pairs-September-24-2026],
  2026.]
#bibitem([30])[X.~Sun, #emph[Direct images of bundles under Frobenius morphism], Invent. Math.
  #strong[173] (2008), no.~2, 427--447. #link("https://doi.org/10.1007/s00222-008-0125-y")[DOI].
  Numbering follows arXiv:math/0611360v2.]
