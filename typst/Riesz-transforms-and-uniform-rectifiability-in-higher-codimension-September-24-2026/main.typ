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

#align(center)[#text(size: 16pt, weight: "bold")[Riesz transforms and uniform rectifiability \
in higher codimension]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The quantitative theorem and normalized pairings <sec:background>

Singular integral estimates can detect the geometry of a measure even when its support has no initial
  parametrization. The Riesz transform is a particularly natural test:
  its kernel records the direction between two points as well as their separation.
  We prove that, for an integer-dimensional Ahlfors–David regular measure in the intermediate codimensions,
  its $L^2$ boundedness forces a quantitatively rectifiable support.

Throughout the paper, $d$ and $n$ are positive integers with $n lt.eq d$, and balls are open Euclidean balls.
  A Radon measure is a Borel measure that is finite on compact sets and regular.
  For such a measure $mu$ on $bb(R)^d$, write $E = "supp" mu$ and $D_E = "diam" E$, allowing $D_E = oo$.
  When $E$ is empty, set $D_E = 0$.

#prodef([Definition 1.1.])[
  (Ahlfors–David regularity).  A Radon measure $mu$ on $bb(R)^d$ is #emph[$n$-Ahlfors–David regular] with constant
    $C_(upright("AD")) gt.eq 1$ if
  $ C_(upright("AD"))^(- 1) r^n lt.eq mu \( B \( x \, r \) \) lt.eq
    C_(upright("AD")) r^n wide \( x in E \, quad 0 < r lt.eq D_E \) . $
  We call these positive radii #emph[admissible]. The inequalities have no instances when $D_E = 0$.
] <def:ad>

For $z eq.not 0$ let $K_n \( z \) = z \/ \| z \|^(n + 1)$.
  The hard truncations of the $n$-dimensional Riesz transform are

#[#set math.equation(numbering: n => "(1.1)")
 $ R_(mu \, epsilon) f \( x \) = integral_(\| x - y \| > epsilon) K_n \( x - y \) f \( y \) thin d mu \( y \) \,
   wide epsilon > 0 . $ <eq:hard-truncation>]

We say that the transform is bounded on $L^2 \( mu \)$ with bound $C_(upright(R))$ if,
  for every real scalar $f in L^2 \( mu \)$ and every $epsilon > 0$,
  the integral in (1.1) defines an $bb(R)^d$-valued $L^2 \( mu \)$ function and

#[#set math.equation(numbering: n => "(1.2)")
 $ parallel R_(mu \, epsilon) f parallel_(L^2 \( mu \; bb(R)^d \)) lt.eq
   C_(upright(R)) parallel f parallel_(L^2 \( mu \)) . $ <eq:riesz-bound>]

No pointwise principal-value hypothesis is imposed. For a nontrivial regular support,
  the integrals in (1.1) are absolutely convergent for every $x$ and every $f in L^2 \( mu \)$;
  this follows from Lemma 4 below.

#prodef([Definition 1.2.])[
  (Uniform rectifiability).  An $n$-Ahlfors–David regular measure $mu$ on $bb(R)^d$ is #emph[uniformly
    $n$-rectifiable] if there are $theta > 0$ and $M < oo$ such that, for every $x in E$ and $0 < r lt.eq D_E$,
    there is an $M$-Lipschitz map
  $ g : B_(bb(R)^n) \( 0 \, r \) arrow.r bb(R)^d \, wide mu #scale(x: 120%, y: 120%)[\(] B \( x \, r \) ∩
    g \( B_(bb(R)^n) \( 0 \, r \) \) #scale(x: 120%, y: 120%)[\)] gt.eq theta r^n . $
  The constants are chosen before $x$ and $r$.
] <def:ur>

#thm([Theorem 1.3.])[
  #emph[Let $d gt.eq 4$ and $2 lt.eq n lt.eq d - 2$ be integers.
    Let $mu$ be an $n$-Ahlfors–David regular Radon measure on $bb(R)^d$ satisfying (1.2).
    Then $mu$ is uniformly $n$-rectifiable in the sense of Definition 2.
    Its constants $theta$ and $M$ can be chosen in terms of $d \, n \, C_(upright("AD"))$ and $C_(upright(R))$ alone.]
] <thm:main>

=== 1.1 History and the analytic question <history-and-the-analytic-question>

David and Semmes developed uniform rectifiability as a quantitative form of rectifiability suited to singular
  integrals #cite(label("DavidSemmes1991")) #cite(label("DavidSemmes1993")).
  Among its equivalent descriptions are big pieces of Lipschitz images and a packing condition on balls where the
  support fails to approximate a plane from both sides. Their question asks whether the boundedness of the Riesz
  transform alone forces this geometry for an integer-dimensional regular measure.

Mattila, Melnikov and Verdera established the planar implication using the relation between the Cauchy integral,
  curvature and uniform rectifiability #cite(label("MattilaMelnikovVerdera1996")).
  Curvature methods also give the one-dimensional Riesz-transform implication in higher ambient dimension;
  see #cite(label("Farag2000")) Theorem 4. Nazarov, Tolsa and Volberg proved the codimension-one implication
  #cite(label("NazarovTolsaVolberg2014")). They identify reliance on a maximum principle,
  for which they report no known higher-codimension analogue,
  as the main obstacle to extending their argument #cite(label("NazarovTolsaVolberg2014")) Section 1.
  Mas and Tolsa obtained a characterization in every integer dimension $1 lt.eq
  n < d$ by an $L^2$ bound for the $rho$-variation of the Riesz truncations,
  with $rho > 2$ #cite(label("MasTolsa2014Variation")) Theorem 1.3.
  That hypothesis bounds the pointwise supremum, over decreasing positive sequences $\( epsilon_j \)$, of

$ (sum_j \| R_(mu \, epsilon_(j + 1)) f - R_(mu \, epsilon_j) f \|^rho)^(1 \/ rho) $

in $L^2 \( mu \)$. It controls changes across scales, rather than each truncation separately.
  The present hypothesis is only the common bound (1.2); no variation estimate is assumed.
  The remaining range for this bound-alone question, $1 < n < d - 1$,
  is stated explicitly in #cite(label("Tolsa2026ICM")) Question 4.4.
  Theorem 3 gives a positive answer in that range, with the hard-truncation convention and the ball
  parametrizations stated above.

Principal-value criteria address a different analytic hypothesis.
  For a set of finite $cal(H)^n$ measure, Tolsa characterized ordinary rectifiability by almost-everywhere
  existence of Riesz principal values #cite(label("Tolsa2008PrincipalValues")) Theorem 1.1.
  That result neither assumes only (1.2) nor asserts the quantitative ball-map conclusion considered here.

Two parts of the quantitative-rectifiability literature are especially relevant to the proof.
  The bilateral weak geometric lemma of David and Semmes converts geometric packing into Lipschitz images;
  a precise Euclidean formulation is recalled in #cite(label("Tolsa2015Uniform")) Theorem 2.5.
  Reflectionless-measure methods organize compactness limits for which the Riesz transform has zero oscillation
  against mean-zero tests; see #cite(label("JayeNazarov2018I")).
  We prove the particular limiting and rigidity statements needed here, including their tail normalizations.

Flat subballs and stability of flatness also form the geometric route in Tolsa’s theorem for uniform measures
  #cite(label("Tolsa2015Uniform")) Section 3. There the ball masses are exactly proportional to $r^n$,
  and the stability step uses Preiss’s rigidity at infinity,
  recalled in #cite(label("Tolsa2015Uniform")) Theorem 2.4.
  Here AD regularity gives two-sided comparisons rather than exact ball masses.
  The normalized-height energy and rigidity argument below provides the required propagation without a
  uniform-measure rigidity input.

Section 8 applies the uniform-rectifiability conclusion to obtain variation bounds and almost-everywhere principal
  values for the Riesz transform and the odd $C^2$ kernels specified there.

=== 1.2 The main mechanism <the-main-mechanism>

The analytic difficulty is to propagate geometric flatness to smaller scales.
  We measure the error by the #emph[excess], the scale-normalized $L^2$ distance from an affine $n$-plane.
  Normal heights are the coordinates of the displacement perpendicular to that plane.
  Weak convergence to a plane makes the excess tend to zero;
  propagation requires an error small relative to the initial excess.
  We therefore divide the normal heights by that initial scale before passing to a limit.
  This second limit is taken only when the Riesz pairings against compact mean-zero Lipschitz tests are
  sufficiently small relative to the height scale to vanish after normalization.
  Here the mean is taken against the current measure, not against a presumed limiting plane.
  The use of normal components to measure geometric deviation has a related quantitative form on small-slope
  Lipschitz graphs in #cite(label("Tolsa2008PrincipalValues")) Theorem 1.3.
  Our compactness argument instead works on moving AD-regular measures before any graph parametrization has been
  established.

Testing the transform against an unnormalized normal height times a cutoff produces a positive fractional energy.
  This estimate gives compactness of the normalized heights through their second moments and their integrals
  against Lipschitz tests. It also controls the singular diagonal when passing to a limiting equation.
  The equation holds against mean-zero tests and is therefore interpreted modulo constants.
  Its order-one Fourier symbol, together with weighted integrability at infinity,
  forces each limiting height to be affine. Approximation by an affine graph now improves the original excess at
  the required relative scale.

The remaining argument counts failures of this propagation on dyadic cells of the support,
  nested pieces at successively halved scales. The operator bound supplies descendants whose support is
  bilaterally close to an $n$-plane, except for a family with a uniform packing bound.
  Starting from such a flat descendant, a later failure of flatness forces an intervening cell with detectable
  transform oscillation. A finite counting argument controls these failures even when their scales are widely
  separated. The David–Semmes theorem then gives the maps in Definition 2.

The proof also gives a compactness principle for heights with bounded local fractional energy on measures
  approaching plane measure. Combined with the limiting rigidity equation,
  it yields affine approximation while both the measure and its supporting set vary.
  The renormalized equation is proved with the precise exterior integrability that admits affine functions.
  This is the relevant polynomial-growth setting for fractional operators;
  compare #cite(label("DipierroSavinValdinoci2019")).

The rest of this section fixes the growth, pairing and dyadic conventions and gives a precise proof map.
  Section 2 proves the two packing estimates. Section 3 identifies the limiting plane measure.
  Sections 4 and 5 establish compactness and affine rigidity of the normalized heights.
  Section 6 proves uniform excess propagation, and Section 7 completes the packing argument and Theorem 3.
  Section 8 derives the variation and principal-value consequences.
  Appendix 9 records the geometric convention changes used at the endpoint.

To prepare the analytic argument, we now make the transform available for compactness and for tests that need not
  be $L^2$ inputs on the whole support. We then fix the geometric quantities whose packing will imply Theorem 3.
  The ball-map conclusion has no instances when $D_E = 0$. We therefore work with positive-diameter support in the
  geometric argument and restore the degenerate case in the final proof.
  Constants denoted by $C$ may change between occurrences; their dependencies are stated in each lemma or at the
  start of the argument. We normalize $cal(H)^n$ so that its restriction to an $n$-plane is $n$-dimensional
  Lebesgue measure.

=== 1.3 Global growth and hard truncations <global-growth-and-hard-truncations>

#thm([Lemma 1.4.])[
  #emph[Let $1 lt.eq n lt.eq d$, and let $mu$ be $n$-Ahlfors–David regular with $D_E > 0$. Then
#[#set math.equation(numbering: n => "(1.3)")
 $ mu \( B \( a \, r \) \) lt.eq G r^n wide \( a in bb(R)^d \, med r > 0 \) \, wide G =
   9^d C_(upright("AD")) . $ <eq:global-growth>]

 If $D_E < oo$, then $mu \( bb(R)^d \) lt.eq 9^d C_(upright("AD")) \( D_E \/ 2 \)^n$.
   For every $epsilon > 0$, every $f in L^2 \( mu \)$, and every $a in bb(R)^d$,
   the integral defining $R_(mu \, epsilon) f \( a \)$ is absolutely convergent.]
] <lem:global-growth>

#proof[
  A Radon measure on Euclidean space is concentrated on its support.
    If $D_E < oo$, choose a maximal $D_E \/ 4$-separated subset of $E$.
    The disjoint ambient balls of radius $D_E \/ 8$ around its points lie in a ball of radius $9 D_E \/
    8$ around any fixed point of $E$. Comparison of their $d$-dimensional volumes bounds their number by $9^d$.
    Maximality gives a cover of $E$ by closed balls of radius $D_E \/ 4$,
    hence by open balls of radius $D_E \/ 2$. The asserted total-mass bound follows from AD upper regularity at
    their centers.
  If $mu \( B \( a \, r \) \) > 0$, choose $x in E ∩ B \( a \, r \)$.
    When $2 r lt.eq D_E$, $B \( a \, r \) subset B \( x \, 2 r \)$ and the AD upper bound gives
    $mu \( B \( a \, r \) \) lt.eq 2^n C_(upright("AD")) r^n$.
    When $2 r > D_E$, the preceding total-mass estimate gives $mu \( B \( a \, r \) \) lt.eq
    9^d C_(upright("AD")) r^n$. For $D_E = oo$ only the first case is needed. Since $n lt.eq d$, $2^n lt.eq 9^d$.
  Finally, dyadic annuli and (1.3) give
  $ integral_(\| a - y \| > epsilon) \| K_n \( a - y \) \|^2 thin d mu \( y \) lt.eq
    2^n G epsilon^(- n) sum_(j = 0)^oo 2^(- j n) < oo . $
  Cauchy–Schwarz proves the last assertion. ◻
]

In intermediate lemmas we use measures $sigma$ with an explicit global upper bound $G$ and a lower bound

#[#set math.equation(numbering: n => "(1.4)")
 $ sigma \( B \( x \, r \) \) gt.eq c r^n wide \( x in "supp" sigma \, quad 0 < r lt.eq D_("supp" sigma) \) \,
   $ <eq:lower-growth>]

where $c > 0$. A #emph[fixed analytic class] means that $d \, n \, G \,
  c$ and a hard-truncation operator bound $D_0$ are fixed. Sometimes the lower bound is assumed only inside a
  specified ball; that local restriction will be stated explicitly. Measures with (1.3) have no atoms when $n gt.eq 1$.

=== 1.4 Mean-zero Riesz pairings <mean-zero-riesz-pairings>

For a real compactly supported Lipschitz function $phi$ satisfying $integral phi thin d sigma = 0$,
  choose $a in bb(R)^d$ and $R > 0$ such that $"supp" phi subset B \( a \, R \)$, and put $A = B \( a \, 2 R \)$.
  Define the vector pairing

#[#set math.equation(numbering: n => "(1.5)")
 $ cal(R)_sigma \( phi \) =  & 1 / 2 integral.double_(A times A) K_n \( x - y \) #scale(x: 120%, y: 120%)[\(]
   phi \( x \) - phi \( y \) #scale(x: 120%, y: 120%)[\)] thin d sigma \( x \) d sigma \( y \)\
 & + integral_A integral_(A^c) phi \( x \) #scale(x: 120%, y: 120%)[\(] K_n \( x - y \) -
   K_n \( a - y \) #scale(x: 120%, y: 120%)[\)] thin d sigma \( y \) d sigma \( x \) . $ <eq:pairing-definition>]

The value of the integrand on the diagonal is set to zero.
  A test in a unit vector direction $e$ means $e dot.op cal(R)_sigma \( phi \)$.
  For a vector test the pairing is the sum of its coordinate pairings, with zero mean imposed on each coordinate.
  We call a measure #emph[reflectionless] if this pairing vanishes for every compactly supported Lipschitz test of
  zero measure mean.

#thm([Lemma 1.5.])[
  #emph[Suppose $sigma$ satisfies global upper $n$-growth, with $n gt.eq 1$.
    The integrals in (1.5) converge absolutely, and their sum is independent of $a \, R$.
    For a fixed compact Lipschitz test, the contribution of $\| y - a \| > T$ is $O \( T^(- 1) \)$ as $T arrow.r
    oo$. If the hard truncations have $L^2$ bound $D_0$, smooth truncations with a fixed bounded profile have
    bound at most $D_0 + C G$. Pairings against an indicator of finite measure have a limit as the inner
    truncation tends to zero whenever that indicator equals one on a neighborhood of the compact Lipschitz test’s
    support.]
] <lem:pairings>

#proof[
  The kernel is odd and satisfies
  $ \| K_n \( z \) \| = \| z \|^(- n) \, wide \| nabla K_n \( z \) \| lt.eq C_n \| z \|^(- n - 1) . $
  For $h > 0$, upper growth and a dyadic decomposition toward the origin give
  #[#set math.equation(numbering: n => "(1.6)")
   $ integral_(0 < \| x - y \| < h) \| x - y \|^(1 - n) thin d sigma \( y \) lt.eq
     C_n G h . $ <eq:near-growth-integral>]
  Multiplication by $"Lip" phi$ bounds the diagonal singularity in the first integral of (1.5).
    The second integral is separated from the support of $phi$ at its finite boundary, and for $\| y - a \| gt.eq
    2 R$ the kernel difference is bounded by $C_n R \| y - a \|^(- n - 1)$.
    Summation over exterior annuli proves absolute convergence and the stated tail bound.
  After enlarging to a common localization ball containing both subtraction points,
    changing that point adds a vector independent of $x$, whose integral against $phi$ is zero.
    Changing the localization ball merely moves a finite cross term between the two integrals:
    expanding it, using oddness, and again using $integral phi thin d sigma =
    0$ shows that their sum is unchanged. This calculation can first be made with both an inner and an outer
    cutoff; the estimates just proved justify removing them.
  The difference between a hard cutoff at $s$ and a bounded smooth cutoff that vanishes on $\[ 0 \, s \]$ and
    equals one on $\[ 2 s \, oo \)$ has kernel bounded by $C s^(- n)
    upright(bold(1))_({ s < \| x - y \| < 2 s })$. Both its row and column integrals are bounded by $C G$.
    The Schur test therefore gives the asserted $L^2$ bound. For an indicator input that equals one on a
    neighborhood of the test support, antisymmetrization on a smaller neighborhood has the integrable majorant
    already established. Dominated convergence identifies its limit with the local term in (1.5);
    separated exterior terms have ordinary absolute convergence. ◻
]

For later use, if $"supp" phi subset B \( a \, r \)$, $"Lip" phi lt.eq r^(- 1)$, and $T > 4 r$, the same proof gives

#[#set math.equation(numbering: n => "(1.7)")
 $ lr(|cal(R)_sigma \( phi \) - chevron.l R_sigma upright(bold(1))_(B \( a \, T \)) \, phi chevron.r_sigma|) lt.eq
   C G r / T integral \| phi \| thin d sigma . $ <eq:localized-pairing-tail>]

Here the bracket denotes the limit of the truncated pairing, whose existence follows from Lemma 5.
  It is only this integrated limit that is used. The notation does not assert a pointwise principal value.

=== 1.5 Weak limits and supports <weak-limits-and-supports>

Local weak convergence of Radon measures means convergence of their integrals against every compactly supported
  continuous function. The following facts also apply to the translated and dilated measure
  $sigma_(a \, r) \( F \) = r^(- n) sigma \( a + r F \)$, for $a in bb(R)^d$ and $r > 0$.

#thm([Lemma 1.6.])[
  #emph[Let $sigma_j$ be Radon measures with a common global upper growth bound $G$.
    Suppose $0 in "supp" sigma_j$ and that a common lower bound $c r^n$ holds at support centers up to radii $L_j
    arrow.r oo$. There is a subsequence converging locally weakly to a nonzero measure $sigma$ with global upper
    and lower $n$-growth bounds. The supports converge locally in the following sense:]
  + #emph[each point of $"supp" sigma$ is a limit of points of $"supp" sigma_j$;]
  + #emph[any convergent sequence $x_j in "supp" sigma_j$ has its limit in $"supp" sigma$.]
  #emph[Uniform hard-truncation $L^2$ bounds pass to $sigma$.
    Moreover, if $phi$ is compact Lipschitz with $integral phi thin d sigma = 0$,
    it can be corrected to compact Lipschitz tests $phi_j$ with $integral phi_j thin d sigma_j = 0$ so that
$ cal(R)_(sigma_j) \( phi_j \) arrow.r cal(R)_sigma \( phi \) . $

 The supports and Lipschitz constants of the corrected tests remain uniformly bounded, and $phi_j arrow.r
   phi$ uniformly.]
] <lem:weak-compactness>

#proof[
  Uniform mass bounds on compact balls give sequential compactness by diagonal weak compactness on an exhaustion
    of $bb(R)^d$. The upper growth bound passes to the limit by testing slightly larger balls.
    The lower bound at zero ensures nonzeroness. If $x in "supp" sigma$,
    every fixed neighborhood of $x$ has positive limiting mass and hence meets the approximating supports
    eventually. If $x_j arrow.r x$ and $x_j in "supp" sigma_j$,
    a fixed sufficiently small support ball at $x_j$ has mass at least a fixed positive multiple of its radius to
    the power $n$. A compactly supported bump near $x$, or the Portmanteau inequality on a closed ball,
    transfers this positive mass to the limit. This proves both support assertions and,
    by shrinking and enlarging radii before taking limits, the lower growth bound.
    Only fixed radii are used at this step, so they are less than $L_j$ eventually.
    Harmless dimensional changes in $c \, G$ would also suffice.
  We give the operator-bound argument to account for hard boundaries.
    On a fixed pair of compact supports, the product measures $sigma_j times sigma_j$ converge weakly.
    For all but countably many $epsilon > 0$, the set $\| x - y \| =
    epsilon$ has zero product measure under $sigma times sigma$.
    At such a radius the truncated bilinear form on a compact continuous scalar input and a compact continuous
    $bb(R)^d$-valued dual test passes to the limit. Their $L^2$ norms pass to the limit as well,
    so its bound is the original operator bound. Exhausting space leaves only a countable exceptional set of
    radii. For any specified $epsilon > 0$, choose good radii decreasing to $epsilon$.
    Dominated convergence on compact supports, away from the diagonal,
    gives the same bilinear estimate for the hard cutoff $\| x - y \| > epsilon$.
    Density in $L^2$, together with the $L^2$ integrability of the exterior kernel from Lemma 4,
    identifies the resulting bounded operator with the actual integral for every $L^2$ input.
  Choose a compact Lipschitz bump $eta$ with $integral eta thin d sigma > 0$. For large $j$ put
  $ c_j = frac(integral phi thin d sigma_j, integral eta thin d sigma_j) \, wide phi_j = phi - c_j eta . $
  Then $c_j arrow.r 0$. In (1.5), first restrict both variables to a fixed large ball with null boundary for the
    limit measure, and replace $K_n \( x - y \)$ by the continuous capped kernel $\( x - y \) \/ max { h \, \| x -
    y \| }^(n + 1)$. Weak convergence of product measures gives convergence of the capped pairing on this bounded
    product. The change on $\| x - y \| lt.eq h$ is uniformly $O \( h \)$ by (1.6) and upper growth;
    the exterior is uniformly $O \( T^(- 1) \)$ by Lemma 5. The same estimates apply to the uniformly bounded
    corrected tests. Letting $h arrow.b 0$ and $T arrow.r oo$ proves the pairing assertion. ◻
]

For measures defined on larger and larger balls, the same argument is local:
  each fixed support ball and test eventually lies in the region where the hypotheses hold.
  Tangent measures below are limits of the rescalings $F mapsto r_j^(- n) sigma \( x + r_j F \)$ with $r_j arrow.b
  0$. They are nonzero by lower regularity. Upper and lower growth, bounded smooth annuli,
  and the absence of a flat subball on fixed compact regions pass to such limits with slightly relaxed constants.
  The last assertion follows from the two support statements and finite nets;
  one first asks for strict flatness in a slightly larger ball.

=== 1.6 Flatness and regular dyadic cells <flatness-and-regular-dyadic-cells>

#prodef([Definition 1.7.])[
  For $r > 0$ and a measure $sigma$ with support $F$, let
  $ e_sigma \( a \, r \) & =
    inf_L (r^(- n - 2) integral_(B \( a \, r \)) "dist" \( x \, L \)^2 thin d sigma \( x \))^(1 \/ 2) \,\
b_sigma \( a \, r \) & = inf_L 1 /
  r (sup_(x in F ∩ B \( a \, r \)) "dist" \( x \, L \) + sup_(y in L ∩ B \( a \, r \)) "dist" \( y \, F \)) . $
  Both infima run over affine $n$-planes in $bb(R)^d$, and an empty supremum is zero.
    We call $e$ the #emph[excess] and $b$ the #emph[bilateral flatness number].
] <def:flatness>

The second term in $b$ rules out holes in an approximating plane.
  The excess measures only the support’s squared distance from a plane.
  We use approximate minimizers for either infimum; no attainment is needed.
  Under a rescaling by $r^(- n) sigma \( a + r thin dot.op \)$,
  both quantities at $\( a \, r t \)$ become the corresponding quantities at $\( 0 \, t \)$.

We use the classical dyadic decomposition of an AD-regular set;
  see #cite(label("AzzamMourgoglouVilla2023")) Section 4, p. 12 for its scale and finite-diameter conventions,
  and #cite(label("DavidSemmes1993")) for the construction. We record exactly the properties needed.

#thm([Proposition 1.8.])[
  (Regular dyadic cells).  #emph[If $D_E > 0$, there are a common $mu$-null set $N subset
    E$ and families $cal(D)_k$ of Borel cells in $E \\ N$ such that:]
  + #emph[each $cal(D)_k$ partitions $E \\ N$, and cells of different generations are disjoint or nested;]
  + #emph[writing $ell \( Q \) = 2^(- k)$ for $Q in cal(D)_k$,
    there are centers $z_Q in Q$ and constants $0 < c_0 lt.eq 1 \/ 2$, $C_0 gt.eq 2$ for which
$ \( E \\ N \) ∩ B \( z_Q \, c_0 ell \( Q \) \) subset Q subset E ∩ B \( z_Q \, C_0 ell \( Q \) \) \, wide
  c_1 ell \( Q \)^n lt.eq mu \( Q \) lt.eq C_1 ell \( Q \)^n \; $

]
  + #emph[every non-top cell has one parent, and every cell has finitely many children.
    When $D_E = oo$, all integer generations are available. When $D_E < oo$,
    there is a largest scale $ell_0$ with $D_E lt.eq ell_0 < 2 D_E$, and finitely many cells at that scale.]
  #emph[All constants depend only on $d \, n \, C_(upright("AD"))$.]
] <prop:dyadic-lattice>

In the bounded case, choose the integer $k_0$ with $D_E lt.eq 2^(- k_0) < 2 D_E$.
  Discard original generations coarser than this one. If the original largest scale is finer,
  insert the finitely many intervening generations, each consisting of the single cell $E \\ N$.
  All added scales are comparable to $D_E$, and $mu \( E \) asymp D_E^n$ by regularity and Lemma 4.
  Thus their core, outer-ball and mass bounds hold after adjusting the constants.
  The original top generation is finite, so the finite-children property also holds at the join.
  The scale and core constants can be enlarged or decreased by fixed factors.
  Removing the common null boundary set gives a simultaneous partition at every generation.
  If necessary, move each center a sufficiently small distance into the conull part of its core and decrease
  $c_0$; this puts every center in its own cell. The mass bounds follow from the cores, the outer balls,
  and Lemma 4. Small-boundary estimates are not needed below.

Write $cal(D)$ for the generation-indexed union of the $cal(D)_k$.
  We also call its cells #emph[dyadic cubes]; no Euclidean cubical shape is assumed.
  Cells at different generations remain distinct objects even if their underlying sets coincide.
  A proper descendant means a descendant at a strictly finer generation;
  containment notation for cells in sums or chains includes this generation relation.
  A subfamily $cal(F) subset cal(D)$ is #emph[Carleson with constant $C$] if

#[#set math.equation(numbering: n => "(1.8)")
 $ sum_(Q in cal(F) \, med Q subset P) mu \( Q \) lt.eq C mu \( P \) wide \( P in cal(D) \) .
   $ <eq:carleson-definition>]

All sums are sums of nonnegative terms; proving the inequality for every finite subfamily is sufficient.
  Each generation of descendants partitions its parent up to the common null set.
  Consequently any fixed number of generations contributes at most that number times $mu \( P \)$ to (1.8).

For $J > 1$ and $Q in cal(D)$, define

#[#set math.equation(numbering: n => "(1.9)")
 $ W_J \( Q \) = sup {\| cal(R)_mu \( phi \) \| : phi in "Lip"_c \( bb(R)^d \) \, med
   "supp" phi subset B \( z_Q \, J ell \( Q \) \) \,\
"Lip" phi lt.eq ell \( Q \)^(- 1) \, quad integral phi thin d mu = 0} . $ <eq:oscillation-definition>]

Here $"Lip"_c$ denotes compactly supported Lipschitz functions and $"Lip" phi$ their Lipschitz seminorm.
  The quantity $W_J \( Q \)$ has the same scaling as $mu \( Q \)$.

=== 1.7 Proof map <proof-map>

Our geometric target is the Carleson estimate for

$ { Q in cal(D) : b_mu \( z_Q \, H ell \( Q \) \) > epsilon } \, $

for every $epsilon > 0$ and a fixed sufficiently large $H$.
  The David–Semmes bilateral weak geometric lemma will then supply the Lipschitz images.
  The proof has three analytic stages and one counting stage.

First, the operator bound makes the family $W_J \( Q \) > v ell \( Q \)^n$ Carleson for each fixed $J \, v$.
  It also supplies, outside a second Carleson family, a bilaterally flat descendant within a fixed number of
  generations. These are Propositions 10 and 11.

Second, a sequence whose excess and transform oscillation vanish has a flat limiting measure.
  The plane comparison and reflectionless arguments in Proposition 17 identify that measure as a positive constant
  times plane measure. This is the base measure for the height argument; it does not yet give relative excess decay.

The affine-rigidity statement, Lemma 21, is independent of these measure limits. We use it twice:
  first, its bounded case makes the density of a planar reflectionless measure constant in Lemma 16; later,
  its full weighted form identifies the normalized heights.
  Its proof in Section 5 uses neither planar-measure rigidity nor height compactness,
  so these two applications introduce no circular dependence.

Third, Lemmas 18 and 19 give compactness of heights divided by their initial excess scale.
  Proposition 20 and Lemma 21 identify the common limit as affine.
  Theorem 25 converts that conclusion into a uniform implication:
  small excess over a finite range of larger scales, together with small $W_J$,
  controls excess and bilateral flatness at the next smaller scale.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.335cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Small excess#linebreak()and oscillation]]])])
  content((4.535, 0), [#box(width: 3.335cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Flat limiting#linebreak()measure]]])])
  content((9.07, 0), [#box(width: 3.335cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Heights divided by#linebreak()the excess scale]]])])
  content((9.07, -2.2), [#box(width: 3.335cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Convergent moments#linebreak()and fractional equation]]])])
  content((4.535, -2.2), [#box(width: 3.335cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Affine height#linebreak()limit]]])])
  content((0, -2.2), [#box(width: 3.335cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Relative excess#linebreak()improvement]]])])
  line((1.668, 0), (2.868, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((6.203, 0), (7.403, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((9.07, -0.6), (9.07, -1.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((7.403, -2.2), (6.203, -2.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.868, -2.2), (1.668, -2.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: The second limiting argument retains the size of the incoming error. Its affine conclusion supplies the improvement needed to propagate flatness. The independent weighted-rigidity lemma also identifies the density in the flat limiting measure. ],
) <fig:two-limits>

Finally, start at a flat descendant and follow a chain of cells.
  A later cell with large bilateral flatness must have an intervening oscillation-bad cell.
  Lemma 26 counts these interventions for an arbitrary finite bad family.
  This proves Proposition 27, and the geometric endpoint then completes Theorem 3.

== 2 Analytic oscillation and flat seeds <sec:flat-balls>

This section provides two inputs for the later geometric argument.
  Large oscillations of the Riesz pairing occur on a Carleson family of cubes, and,
  outside another Carleson family, every cube has a bilaterally flat descendant at a uniformly bounded depth.
  We first prove the oscillation estimate by a Bessel inequality for mean-zero Lipschitz tests.
  For the second assertion, two successive tangents give a local alternative:
  absence of a flat ball forces a large annular transform. Differences of local averages then turn that
  alternative into a packing estimate.

Throughout the section $1 lt.eq n < d$, and $mu$ satisfies the AD regularity and operator hypotheses of Theorem 3.
  We use the global upper growth constant $G$ from Lemma 4.
  Constants may depend on $d \, n \, C_(upright("AD")) \, C_(upright(R))$ and the lattice constants;
  additional parameters are indicated when they occur.

=== 2.1 Packing the oscillation tests <packing-the-oscillation-tests>

We use the Lipschitz-test and finite-depth Haar Riesz-system estimates developed in
  #cite(label("NazarovTolsaVolberg2014")) Section 14 and include the estimates with our normalization below.
  The mean-zero Lipschitz test estimate and its oscillation-packing consequence also appear in
  #cite(label("JayeNazarov2013")) Section 5 and Appendix B.

Write $cal(D) \( Q_0 \) = { Q in cal(D) : Q subset Q_0 }$.
  We use the Carleson condition (1.8), the oscillation quantity (1.9), and the cell mass bounds from Proposition 8:

#[#set math.equation(numbering: n => "(2.1)")
 $ c_1 ell \( Q \)^n lt.eq mu \( Q \) lt.eq C_1 ell \( Q \)^n . $ <eq:packing-cell-masses>]

For bounded support, the diameter-truncated lattice has at most one level with $ell \( Q \) > D_E$.
  That level may be included in an exceptional family at Carleson cost one.
  No estimate uses infinitely many scales larger than the support diameter.
  Put $E^(*) = E \\ N$, where $N$ is the common null set in Proposition 8.
  Its partitions and nesting hold exactly on $E^(*)$. Also $E^(*)$ is dense in $E$,
  since every ball centered on $E$ has positive measure.

#thm([Lemma 2.1.])[
  (Bessel estimate for dyadic tests).  #emph[Fix $J > 1$. For each cube in a finite family $cal(A) subset cal(D)$,
    choose one test $phi_Q$ from the class defining $W_J \( Q \)$.
    There is $B_J < oo$, independent of $cal(A)$ and the choices, such that
#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(Q in cal(A)) frac(lr(|integral phi_Q u thin d mu|)^2, ell \( Q \)^n) lt.eq
   B_J integral \| u \|^2 thin d mu wide \( u in L^2 \( mu \) \) . $ <eq:dyadic-test-bessel>]

 For vector-valued $u$ the same constant works with $integral phi_Q u$ replaced by $integral phi_Q chevron.l
   e_Q \, u chevron.r$, where each $\| e_Q \| lt.eq 1$ may be chosen independently.]
] <lem:dyadic-test-bessel>

#proof[
  Put $r_Q = ell \( Q \)$, $w_Q = r_Q^(n \/ 2)$ and $f_Q = phi_Q \/ w_Q$.
    The support and Lipschitz conditions give $\| phi_Q \| lt.eq 2 J$:
    compare a point of its support with a point on the sphere of radius $J r_Q$ where the function vanishes.
    The tests are in $L^1 ∩ L^2$ by compact support. If $r_P lt.eq r_Q$, cancellation in $f_P$ gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ \| chevron.l f_Q \, f_P chevron.r \| & =
     lr(|integral \( f_Q \( x \) - f_Q \( z_P \) \) f_P \( x \) thin d mu \( x \)|)\
 & lt.eq H_J r_P / r_Q w_P / w_Q \, wide H_J = G J^(n + 1) \( 2 J + 1 \)^2 . $ <eq:gram-cancellation>]
  Indeed, on the support of $f_P$ the difference is at most $J r_P \/ \( r_Q w_Q \)$, and
  $ integral \| f_P \| thin d mu lt.eq frac(2 J G \( J r_P \)^n, w_P) . $
  The symmetric estimate follows by reversing $P \, Q$.
  A nonzero inner product requires the two support balls to meet. Fix $Q$ and a finer level $r_P = 2^(- k) r_Q$.
    Every interacting cube $P$ lies in $B \( z_Q \, \( 2 J + C_0 \) r_Q \)$, up to its null boundary.
    Same-level cells are pairwise disjoint, so (2.1) and global upper growth imply
  #[#set math.equation(numbering: n => "(2.4)")
   $ sum_(P upright(" at this level")\
chevron.l f_Q \, f_P chevron.r eq.not 0) r_P^n lt.eq H'_J r_Q^n \, wide H'_J =
  c_1^(- 1) G \( 2 J + C_0 \)^n . $ <eq:gram-fine-mass>]
  At a coarser level $r_P = 2^k r_Q$, the same argument in $B \( z_Q \, \( 2 J + C_0 \) r_P \)$ bounds the number
    of interacting cubes by $H'_J$. These are estimates in the measure dimension $n$.
  Multiply (2.3) by $w_P$. Summing first over a finer level using (2.4),
    and then over a coarser level using its counting bound, gives respectively
  $ sum_(r_P = 2^(- k) r_Q) \| chevron.l f_Q \, f_P chevron.r \| w_P lt.eq H_J H'_J 2^(- k) w_Q \, wide
    sum_(r_P = 2^k r_Q) \| chevron.l f_Q \, f_P chevron.r \| w_P lt.eq H_J H'_J 2^(- k) w_Q . $
  Zero inner products may be discarded. Summing the geometric series therefore yields
  $ sum_(P in cal(A)) \| chevron.l f_Q \, f_P chevron.r \| w_P lt.eq 4 H_J H'_J w_Q . $
  For completeness, a symmetric matrix $\( a_(Q P) \)$ of nonnegative entries with $sum_P a_(Q P) w_P lt.eq
    B w_Q$ satisfies
  $ sum_(Q \, P) a_(Q P) \| t_Q t_P \| lt.eq B sum_Q \| t_Q \|^2 . $
  This follows by applying $2 \| t_Q t_P \| lt.eq \| t_Q \|^2 w_P \/ w_Q + \| t_P \|^2 w_Q \/
    w_P$ and using symmetry. Apply it to $a_(Q P) = \| chevron.l f_Q \, f_P chevron.r \|$.
    The resulting bound for $parallel sum_Q t_Q f_Q parallel_2^2$ gives (2.2) by Hilbert-space duality,
    with $B_J = 4 H_J H'_J$.
  For the vector assertion, write $v_Q = integral f_Q u thin d mu$.
    Then $\| chevron.l e_Q \, v_Q chevron.r \|^2 lt.eq \| v_Q \|^2$.
    Expand the latter in an orthonormal basis, apply the scalar estimate to each coordinate of $u$,
    and sum by Parseval’s identity. The constant is unchanged. ◻
]

#thm([Proposition 2.2.])[
  (Oscillation packing).  #emph[For every $J > 1$ and $v > 0$, the family
$ cal(O) \( J \, v \) = { Q in cal(D) : W_J \( Q \) > v ell \( Q \)^n } $

 is Carleson. Its constant depends only on the fixed data, $J$, and $v$.]
] <prop:oscillation-packing>

#proof[
  Fix $Q_0$, put $L = ell \( Q_0 \)$, and fix the single outer ball
  $ S = B \( z_(Q_0) \, \( C_0 + 2 \) L \) . $
  Let $cal(A) subset cal(O) \( J \, v \) ∩ cal(D) \( Q_0 \)$ be finite.
    For each selected cube write $r_Q = ell \( Q \)$ and choose a witnessing test $phi_Q$ and a unit-bounded
    direction $e_Q$, so that
  $ \| chevron.l e_Q \, cal(R)_mu \( phi_Q \) chevron.r \| > v r_Q^n . $
  For $r_Q lt.eq L \/ \( 2 J \)$ the support of the test lies in $S$, and its distance from $S^c$ is at least $L$.
    With $nu = mu \| S$, cancellation gives
  $ cal(R)_mu \( phi_Q \) - cal(R)_nu \( phi_Q \) = integral phi_Q \( x \)
    integral_(S^c) \[ K_n \( x - y \) - K_n \( z_Q - y \) \] thin d mu \( y \) thin d mu \( x \) . $
  This integral is absolutely convergent. The kernel derivative bound and upper growth on dyadic annuli give
  $ integral_(\| y - z_Q \| gt.eq L) \| y - z_Q \|^(- n - 1) thin d mu \( y \) lt.eq C \( n \) G \/ L . $
  Since $\| x - z_Q \| lt.eq J r_Q$ on the support and $integral \| phi_Q \| thin d mu lt.eq 2 J G \( J r_Q \)^n$,
    it follows that
  #[#set math.equation(numbering: n => "(2.5)")
   $ \| cal(R)_mu \( phi_Q \) - cal(R)_nu \( phi_Q \) \| lt.eq T_J \( r_Q \/ L \) r_Q^n \, wide T_J =
     C \( n \) G^2 J^(n + 2) . $ <eq:oscillation-outer-error>]
  Choose an integer $N gt.eq 1$, depending only on $J \, v$ and the fixed data, with
  $ 2^(- N) lt.eq min { \( 2 J \)^(- 1) \, med v \/ \[ 2 \( T_J + 1 \) \] } . $
  If $Q$ lies at least $N$ generations below $Q_0$, its restricted pairing therefore has magnitude at least
    $\( v \/ 2 \) r_Q^n$ in the direction $e_Q$.
  The same hard-truncated function $R_(mu \, epsilon) 1_S$ can be used for all these fine cubes. For each such cube,
  $ integral phi_Q \( x \) R_(mu \, epsilon) 1_S \( x \) thin d mu \( x \) = 1 /
    2 integral.double_(S times S \, med \| x - y \| > epsilon) \( phi_Q \( x \) - phi_Q \( y \) \) K_n \( x - y \)
    thin d mu \( x \) d mu \( y \) . $
  As $epsilon arrow.b 0$ this converges to $cal(R)_nu \( phi_Q \)$.
    Antisymmetry gives the displayed identity; Lipschitz cancellation and upper growth make its near-diagonal
    majorant integrable. Also $integral phi_Q thin d nu = 0$ because the support lies in $S$.
    Lemma 9 and the hard-truncation bound imply
  $ sum_(Q in cal(A)) lr(|integral phi_Q chevron.l e_Q \, R_(mu \, epsilon) 1_S chevron.r thin d mu|)^2 /
    r_Q^n lt.eq B_J C_(upright(R))^2 mu \( S \) . $
  Restrict the sum to the fine cubes and pass to the limit in this finite sum. We obtain
  $ sum_(Q in cal(A)\
r_Q lt.eq 2^(- N) L) r_Q^n lt.eq 4 v^(- 2) B_J C_(upright(R))^2 mu \( S \) . $
  Now $mu \( S \) lt.eq G \( C_0 + 2 \)^n L^n lt.eq G \( C_0 + 2 \)^n c_1^(- 1) mu \( Q_0 \)$,
    so (2.1) bounds the total mass of the fine cubes by a fixed multiple of $mu \( Q_0 \)$.
    At each of the fewer than $N$ remaining levels, disjointness and containment in $Q_0$ bound the selected
    masses by $mu \( Q_0 \)$. This proves the desired estimate for every finite $cal(A)$, hence for the entire family. ◻
]

=== 2.2 Flat descendants outside a Carleson family <flat-descendants-outside-a-carleson-family>

The second packing estimate provides a small flat region inside every cube outside a Carleson family.
  The allowed depth depends on the desired aperture and flatness, but is uniform over all cubes.

#thm([Proposition 2.3.])[
  (Flat seeds outside a Carleson family).  #emph[For every $A_(upright(F)) gt.eq
    1$ and $eta > 0$ there are an integer $N_(upright(F)) gt.eq
    1$ and a Carleson family $cal(F)$ such that every $Q in cal(D) \\ cal(F)$ has a proper descendant $P subset Q$ with
#[#set math.equation(numbering: n => "(2.6)")
 $ 1 lt.eq "depth"_Q \( P \) lt.eq N_(upright(F)) \, wide b_mu \( z_P \, A_(upright(F)) ell \( P \) \) < eta .
   $ <eq:flat-seed-conclusion>]

 One may also require $B \( z_P \, A_(upright(F)) ell \( P \) \) subset B \( z_Q \, c_0 ell \( Q \) \/ 4 \)$.
   The constants are uniform in $Q$ and the top cube used in the Carleson estimate;
   they depend only on the fixed data, $A_(upright(F))$ and $eta$.]
] <prop:flat-seeds>

We prove this proposition by detecting a large annular transform whenever such a descendant is absent.
  The next lemma supplies the geometric alternative independently of the operator bound;
  the subsequent comparison of averages makes its annular branch available to a Bessel estimate.

==== 2.2.1 The local annular alternative <the-local-annular-alternative>

The argument follows the flat-ball/large-annulus method of Nazarov, Tolsa and Volberg;
  see #cite(label("NazarovTolsaVolberg2014")) Section 10. We give the version needed here in arbitrary
  codimension, with the stated smooth annuli and admissible-radius conventions.

Fix a smooth radial function $chi : bb(R)^d arrow.r \[ 0 \, 1 \]$ which equals one on $overline(B) \( 0 \, 1 \)$
  and vanishes outside $B \( 0 \, 2 \)$. For $r > 0$ put $chi_(a \, r) \( y \) = chi \( \( y - a \) \/ r \)$, and,
  for $0 < r lt.eq R$, define

#[#set math.equation(numbering: n => "(2.7)")
 $ cal(S)_mu \( a \; r \, R \) = integral #scale(x: 120%, y: 120%)[\(] chi_(a \, R) \( y \) -
   chi_(a \, r) \( y \) #scale(x: 120%, y: 120%)[\)] K_n \( a - y \) thin d mu \( y \) .
   $ <eq:smooth-annular-transform>]

This is an absolutely convergent vector integral: its integrand is bounded, compactly supported,
  and zero near $a$. The same definition will be used for any measure with locally finite mass.

#thm([Lemma 2.4.])[
  (A flat ball or a large annulus).  #emph[Fix $0 < kappa < 1 \/ 8$, $epsilon > 0$, and $T > 0$.
    There exists $rho in \( 0 \, kappa \)$, depending only on $d \, n \, C_(upright("AD")) \, G \, kappa \,
    epsilon \, T$, with the following property. For every $a_0 in E$ and $0 < s lt.eq D_E$,
    at least one of the following assertions holds:]
  + #emph[There are $a in E ∩ B \( a_0 \, kappa s \)$ and $rho s lt.eq
    t < kappa s$ such that $b_mu \( a \, t \) < epsilon$.]
  + #emph[There are $a in E ∩ B \( a_0 \, kappa s \)$ and $rho s lt.eq r lt.eq
    R < kappa s$ such that $\| cal(S)_mu \( a \; r \, R \) \| > T$.]
  #emph[The number $rho$ is chosen before $mu$, $a_0$, and $s$. The operator bound is not needed in this lemma.]
] <lem:annular-alternative>

#proof[
  We first prove a qualitative assertion for measures with global upper and lower growth.
    We then localize it by taking a tangent and obtain the uniform radius floor by compactness.
  ===== 2.2.1.1 Support convergence and annular bounds. <support-convergence-and-annular-bounds.>
  We record the elementary convergence facts needed at both stages.
    Suppose $sigma_j$ converge weakly on compact sets to $sigma$, have a common upper growth bound, and satisfy
  #[#set math.equation(numbering: n => "(2.8)")
   $ sigma_j \( B \( x \, t \) \) gt.eq c t^n wide \( x in "supp" sigma_j \, quad 0 < t lt.eq h \) \,
     $ <eq:capped-lower-growth-flat>]
  where $c \, h > 0$ are fixed. On every bounded region their supports converge in both directions,
    with an arbitrarily small enlargement of that region. Indeed,
    if bounded support points $x_j$ stayed a positive distance from $"supp" sigma$,
    a subsequence would converge to such a point $x$. A continuous cutoff near $x$,
    together with (2.8) at a sufficiently small fixed radius,
    would have uniformly positive $sigma_j$ integrals and zero $sigma$ integral.
    Conversely, a ball about a point of $"supp" sigma$ contains a nonnegative compactly supported continuous test
    with positive $sigma$ integral. Its $sigma_j$ integral is eventually positive.
    Finite coverings make both assertions uniform on bounded sets. The limit also has lower growth:
    for $x in "supp" sigma$ and $0 < t lt.eq h$, choose $x_j arrow.r
    x$ and a continuous cutoff equal to one on $B \( x \, t \/ 2 \)$ and supported in $B \( x \, t \)$.
    Eventually $B \( x_j \, t \/ 4 \) subset B \( x \, t \/ 2 \)$,
    so passing the cutoff integrals to the limit gives $sigma \( B \( x \, t \) \) gt.eq c \( t \/ 4 \)^n$.
  In particular, if $a_j in "supp" sigma_j$ tend to $a in "supp"
    sigma$ and the limit is sufficiently flat on $B \( a \, 2 t \)$,
    then the sources are flat on $B \( a_j \, t \)$. For example, for $0 < eta lt.eq 1$,
  #[#set math.equation(numbering: n => "(2.9)")
   $ [b_(sigma_j) \( x \, t \) gt.eq eta upright(" for all nearby support centers and all large ") j] quad
     arrow.r.double quad b_sigma \( a \, 2 t \) gt.eq eta \/ 64 . $ <eq:nonflat-limit-flat>]
  To check the numerical slack, if the last inequality failed,
    choose an $n$-plane whose sum of deviations on $B \( a \, 2 t \)$ is less than $eta t \/ 32$.
    Approximate $a$ by $a_j$ and both supports within $eta t \/ 32$.
    Points of either set in $B \( a_j \, t \)$ and all the points used to approximate them then lie in
    $B \( a \, 2 t \)$. Each of the two deviations for the sources is less than $eta t \/ 8$,
    contradicting $b_(sigma_j) \( a_j \, t \) gt.eq eta$. This reasoning uses only the lower growth at small fixed
    radii; the tested radius $t$ need not be below $h$.
  For fixed $r \, R > 0$, the kernel in (2.7) is continuous with compact support.
    If its center varies from $a_j$ to $a$, the kernels converge uniformly and have a common bounded support.
    The upper growth bound therefore gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ cal(S)_(sigma_j) \( a_j \; r \, R \) arrow.r cal(S)_sigma \( a \; r \, R \) . $ <eq:annular-center-convergence>]
  Here and below support centers in a limit can be approximated by source support centers, as just proved.
  For $u > 0$ define the normalized dilation
  $ sigma_(a \, u) = u^(- n) #scale(x: 120%, y: 120%)[\(] y mapsto \( y - a \) \/ u
    #scale(x: 120%, y: 120%)[\)]_(\#) sigma . $
  A change of variables gives the exact identities
  #[#set math.equation(numbering: n => "(2.11)")
   $ cal(S)_(sigma_(a \, u)) \( b \; r \, R \) & = cal(S)_sigma \( a + u b \; u r \, u R \) \,\
b_(sigma_(a \, u)) \( b \, t \) & = b_sigma \( a + u b \, u t \) . $ <eq:annular-flat-scaling>]
  Thus a bound $\| cal(S)_sigma \( x \; r \, R \) \| lt.eq T$ at all support centers and all positive radii
    survives dilations and compact limits. A global lower bound $b_sigma gt.eq
    eta$ survives a compact limit with the loss $eta mapsto eta \/ 64$.
    The compactness and nonvanishing of normalized dilations follow from Lemma 6:
    upper growth controls the mass on each compact set, and lower growth preserves positive mass in every ball
    about the origin.
  ===== 2.2.1.2 Two tangents reduce the containing dimension. <two-tangents-reduce-the-containing-dimension.>
  Suppose, towards a contradiction, that a nonzero measure $sigma$ satisfies global bounds
  $ c t^n lt.eq sigma \( B \( x \, t \) \) \, wide sigma \( B \( y \, t \) \) lt.eq
    G_1 t^n quad \( x in "supp" sigma \, med y in bb(R)^d \, med t > 0 \) \, $
  that $\| cal(S)_sigma \( x \; r \, R \) \| lt.eq T$ at every support center and all $0 < r lt.eq R$,
    and that $b_sigma \( x \, t \) gt.eq eta > 0$ everywhere. Decreasing $eta$ if necessary, assume $eta lt.eq 1$.
    Let $P$ be a linear subspace containing the support, initially $P = bb(R)^d$.
  The support cannot fill $P$. If it did, upper and lower growth would force $dim P = n$.
    To see this, write $k = dim P$ and cover its unit ball by $O \( u^(- k) \)$ balls of radius $u$.
    For $k < n$, upper growth would make its mass tend to zero.
    For $k > n$, a family of $gt.tilde u^(- k)$ disjoint balls of radius comparable to $u$,
    centered in the unit ball of $P$, would have total mass $gt.tilde u^(n - k)$,
    contradicting the upper bound on a fixed larger ball. When $k = n$,
    the support is an $n$-plane and all its bilateral beta numbers are zero.
    Each possibility contradicts the assumptions.
  Choose $c_1 in P \\ "supp" sigma$ and a nearest support point $a$ to $c_1$.
    Such a point exists because the support is nonempty and closed in finite-dimensional Euclidean space.
    Set $e = a - c_1 in P \\ { 0 }$. The nearest-point inequality implies
  $ 2 chevron.l e \, y - a chevron.r + \| y - a \|^2 gt.eq 0 wide \( y in "supp" sigma \) . $
  After dilation at $a$ by scales $u_j arrow.b 0$ this becomes $2 chevron.l e \, x chevron.r + u_j \| x \|^2 gt.eq
    0$. Pass to a nonzero limit $tau$. The support-convergence argument shows that
  $ "supp" tau subset P ∩ { x : chevron.l e \, x chevron.r gt.eq 0 } \, wide 0 in "supp" tau . $
  This first tangent retains global upper and lower growth, the annular bound $T$, and positive global nonflatness.
  We next use the sign of the normal kernel to take a second tangent. Define
  $ p_e \( x \) = frac(chevron.l e \, x chevron.r_(+), \| x \|^(n + 1)) quad \( x eq.not 0 \) \, wide
    p_e \( 0 \) = 0 \, wide t_(+) = max { t \, 0 } . $
  For $2 r lt.eq R_0$, the weight $chi_(0 \, R_0) - chi_(0 \, r)$ is nonnegative everywhere and equals one when $2
    r lt.eq \| x \| lt.eq R_0$. In fact, inside the $R_0$-ball the outer cutoff is one,
    and outside it the inner cutoff is zero. This argument requires no monotonicity of the cutoff.
    On the support of $tau$,
  $ integral \( chi_(0 \, R_0) - chi_(0 \, r) \) p_e thin d tau = - chevron.l e \,
    cal(S)_tau \( 0 \; r \, R_0 \) chevron.r lt.eq \| e \| T . $
  Given $v > 0$, take $r = min \( v \, R_0 \) \/ 4$ to obtain
  $ integral_(v < \| x \| < R_0) p_e \( x \) thin d tau \( x \) lt.eq \| e \| T . $
  Monotone convergence, using $p_e \( 0 \) = 0$, proves $p_e in L^1 \( tau \|_(B \( 0 \, R_0 \)) \)$.
    This establishes an actual integrability statement before taking the next limit.
  For any fixed $R > 0$, exact scaling gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ integral_(B \( 0 \, R \)) chevron.l e \, x chevron.r_(+) thin d tau_(0 \, u) \( x \) & =
     u^(- n - 1) integral_(B \( 0 \, u R \)) chevron.l e \, y chevron.r_(+) thin d tau \( y \)\
 & lt.eq R^(n + 1) integral_(B \( 0 \, u R \)) p_e \( y \) thin d tau \( y \) arrow.r
   0 wide \( u arrow.b 0 \) . $ <eq:vanishing-normal-moment>]
  The convergence follows from absolute continuity of the integral:
    upper growth and $n > 0$ give $tau \( B \( 0 \, u R \) \) arrow.r 0$.
    Take a nonzero compact limit $nu$ of these second dilations.
    Testing with nonnegative compact continuous cutoffs times $chevron.l e \,
    x chevron.r_(+)$ shows that this continuous nonnegative function vanishes throughout $"supp" nu$.
    The negative normal part already vanishes on every dilated support. Hence
  $ "supp" nu subset Q := P ∩ e^perp \, wide dim Q < dim P . $
  The last inequality uses $e in P \\ { 0 }$: $e$ itself is not in $e^perp$.
    Both tangents retain support in $P$ because their centers lie in $P$.
  The new measure is nonzero, satisfies global upper and lower growth, has annular bound $T$,
    and has global beta lower bound at least $eta \/ 4096$. For definiteness,
    the compactness estimates may multiply the upper constant by $2^n$ and divide the lower constant by $4^n$ at
    each tangent; their precise values are immaterial. Strong induction on $dim P$,
    allowing these constants and the positive beta threshold to vary, gives a contradiction.
    We have proved that a globally regular, globally annular-bounded measure has a flat ball at every prescribed
    positive tolerance.
  ===== 2.2.1.3 Localization and a uniform radius floor. <localization-and-a-uniform-radius-floor.>
  Suppose a measure has global upper growth, lower growth only for $0 < t lt.eq h$,
    and annular bound $T$ for support centers in an open set $U$ with $U ∩ "supp" sigma eq.not diameter$,
    and outer radii below a positive cap. If there were no $eta$-flat ball in $U$ below another positive cap,
    take a tangent at any point of $U ∩ "supp" sigma$. Every fixed normalized radius eventually lies below the
    physical caps, and bounded normalized centers dilate into $U$.
    Equations (2.10)– (2.11) and (2.9) therefore make the annular bound and a positive beta lower bound global on
    the tangent. The lower growth also becomes global, since its normalized cap is $h \/ u_j arrow.r oo$.
    This contradicts the preceding paragraph. Thus the local qualitative alternative holds with no radius floor.
  Normalize the statement of the lemma by $a_0 = 0$, $s = 1$.
    The resulting measures have common global upper growth, origin in their supports,
    and lower growth at all support centers for $0 < t lt.eq 1$.
    If no common $rho$ worked, choose counterexamples $mu_j$ with floors $rho_j arrow.b 0$.
    The uniform mass bounds on compact sets give a locally weakly convergent subsequence,
    by the compactness argument in Lemma 6. The fixed lower bound at zero keeps its limit $nu$ nonzero and puts $0
    in "supp" nu$. The support-convergence argument above transfers the lower bound at radii below a fixed
    positive cap to $nu$. Every fixed annulus with center in $B \( 0 \, kappa \)$ and $0 < r lt.eq
    R < kappa$ eventually lies above the floor $rho_j$. Its transform on the limit is therefore bounded by $T$.
    For every fixed $0 < t < kappa$, the failure of flat balls at radius $t \/ 2$ and (2.9) give
  $ b_nu \( a \, t \) gt.eq min \( epsilon \, 1 \) \/ 64 wide \( a in "supp" nu ∩ B \( 0 \, kappa \) \) . $
  The local qualitative alternative contradicts these two properties.
    This proves the existence of $rho$ before the measure is chosen.
    Finally, (2.11) transports the conclusion back to $a_0 \, s$.
    Only the original lower growth below $s lt.eq D_E$ has been used. ◻
]

==== 2.2.2 From large annuli to flat descendants <from-large-annuli-to-flat-descendants>

The passage from a large annulus to a difference of local averages, and then to a packing estimate,
  follows the mechanism in #cite(label("NazarovTolsaVolberg2014")) Section 15.

The next comparison makes the large-annulus branch of Lemma 12 usable in an $L^2$ packing argument.
  For a positive finite-measure set $A$, write $chevron.l u chevron.r_A = mu \( A \)^(- 1) integral_A u thin d mu$.

#thm([Lemma 2.5.])[
  (Annuli and differences of averages).  #emph[Let $0 < r lt.eq R$,
    let $S$ be a bounded measurable set containing $B \( a \, 2 R \)$,
    and let $A subset B$ be measurable sets of positive finite measure satisfying
$ A subset B \( a \, r \/ 2 \) \, wide B subset B \( a \, R \/ 2 \) \, wide r^n lt.eq M mu \( A \) \, wide
  R^n lt.eq M mu \( B \) . $

 There is a constant
$ E_0 = 3 C_(upright(R)) \( G 2^n M \)^(1 \/ 2) + 3 C \( n \) G \, $

 independent of $r \, R \, R \/ r \, S$ and $epsilon$, such that, for every $0 < epsilon < r \/ 2$,
#[#set math.equation(numbering: n => "(2.13)")
 $
   lr(|cal(S)_mu \( a \; r \, R \) - #scale(x: 120%, y: 120%)[\(] chevron.l R_(mu \, epsilon) 1_S chevron.r_A -
   chevron.l R_(mu \, epsilon) 1_S chevron.r_B #scale(x: 120%, y: 120%)[\)]|) lt.eq E_0 . $ <eq:annular-average-error>]

 In particular, one direction chosen from $cal(S)_mu \( a \; r \, R \)$ witnesses an average gap at least $\|
   cal(S)_mu \( a \; r \, R \) \| - E_0$ for every such $epsilon$.]
] <lem:annular-average-gap>

#proof[
  Decompose the one fixed input as
  $ 1_S = f + g + h \, wide f = chi_(a \, r) \, quad g = chi_(a \, R) - chi_(a \, r) \, quad h = 1_S - chi_(a \, R) . $
  Here $\| g \| \, \| h \| lt.eq 1$, $g$ vanishes on $B \( a \, r \)$, and $h$ vanishes on $B \( a \, R \)$.
    All three functions belong to $L^2 \( mu \)$. Upper growth gives
  $ parallel f parallel_2^2 lt.eq G \( 2 r \)^n \, wide parallel g parallel_2^2 lt.eq G \( 2 R \)^n . $
  Cauchy–Schwarz and the operator bound consequently bound each of
  $ \| chevron.l R_(mu \, epsilon) f chevron.r_A \| \, quad \| chevron.l R_(mu \, epsilon) f chevron.r_B \| \,
    quad \| chevron.l R_(mu \, epsilon) g chevron.r_B \| $
  by $C_(upright(R)) \( G 2^n M \)^(1 \/ 2)$; use $r lt.eq R$ for the middle term.
  If $u in L^2 \( mu \)$, $\| u \| lt.eq 1$, and $u$ vanishes on $B \( a \, t \)$, then for $\| x - a \| lt.eq
    t \/ 2$ and $0 < epsilon < t \/ 2$ there is no truncation boundary on its support.
    The kernel derivative estimate therefore gives
  $ \| R_(mu \, epsilon) u \( x \) - R_(mu \, epsilon) u \( a \) \| lt.eq C \( n \) \| x -
    a \| integral_(\| y - a \| gt.eq t) \| y - a \|^(- n - 1) thin d mu \( y \) lt.eq C \( n \) G . $
  Apply this once to $g$ on $A$, and twice to $h$ on $A$ and $B$.
    Since $R_(mu \, epsilon) g \( a \) = cal(S)_mu \( a \; r \, R \)$,
    expanding the two averages of $R_(mu \, epsilon) \( f + g + h \)$ proves (2.13).
    Finally choose a unit-bounded $e$ with $chevron.l e \, cal(S)_mu \( a \; r \, R \) chevron.r = \|
    cal(S)_mu \( a \; r \, R \) \|$. This choice precedes $epsilon$;
    projecting (2.13) onto $e$ proves the last assertion. ◻
]

#proof[
  Put $L_0 = max { 1 \, 2 C_0 }$ and $M = \( 8 L_0 \)^n \/ c_1$.
    Fix the comparison constant $E_0$ in Lemma 13, with this value of $M$. Apply Lemma 12 with
  $ kappa = c_0 \/ 32 \, wide epsilon.alt_(upright(F)) =
    frac(eta A_(upright(F)), 32 \( A_(upright(F)) + C_0 \)) \, wide T = E_0 + 2 . $
  Let $rho > 0$ be its uniform relative radius. These choices, including $rho$,
    are made before the cube $Q$ is chosen. For now assume $ell \( Q \) lt.eq D_E$ and apply that lemma at $a_0 =
    z_Q$, $s = ell \( Q \)$.
  #emph[The flat branch produces a seed.] Suppose the lemma gives $a in E ∩
    B \( z_Q \, kappa ell \( Q \) \)$ and $rho ell \( Q \) lt.eq
    t < kappa ell \( Q \)$ with $b_mu \( a \, t \) < epsilon.alt_(upright(F))$.
    Choose $b in E^(*) ∩ B \( a \, t \/ 8 \)$, and choose the dyadic scale of $P$ so that
  $ frac(t, 16 \( A_(upright(F)) + C_0 \)) < ell \( P \) lt.eq frac(t, 8 \( A_(upright(F)) + C_0 \)) . $
  Let $P$ be the cell at that scale containing $b$. Both $b in Q$ and $ell \( P \) <
    ell \( Q \)$ follow from the core containment and $t < kappa ell \( Q \)$,
    so exact nesting on $E^(*)$ gives $P subset Q$. Also $\| z_P - b \| lt.eq C_0 ell \( P \)$, whence
  $ B \( z_P \, A_(upright(F)) ell \( P \) \) subset B \( a \, t \) ∩ B \( z_Q \, c_0 ell \( Q \) \/ 4 \) . $
  Choose an affine plane for which the sum of the two deviations in $B \( a \, t \)$ is less than
    $epsilon.alt_(upright(F)) t$. Restricting both suprema to the smaller ball gives
  $ b_mu \( z_P \, A_(upright(F)) ell \( P \) \) < frac(epsilon.alt_(upright(F)) t, A_(upright(F)) ell \( P \)) <
    frac(16 epsilon.alt_(upright(F)) \( A_(upright(F)) + C_0 \), A_(upright(F))) = eta \/ 2 . $
  The lower bound for $t$ bounds the depth of $P$ uniformly.
    For example, any integer $N_(upright(F)) > log_2 \( 16 \( A_(upright(F)) + C_0 \) \/ rho \)$ suffices.
  #emph[Cubes without a flat seed have a large annulus.] Let $cal(F)_1$ be the cubes with $ell \( Q \) lt.eq
    D_E$ for which no seed as in (2.6), with the additional ball containment,
    exists at depth at most $N_(upright(F))$. They must lie in the annular branch. Thus each has radii
  $ rho ell \( Q \) lt.eq r_Q lt.eq R_Q < kappa ell \( Q \) $
  and a center $a_Q$ in the same core with $\| cal(S)_mu \( a_Q \; r_Q \, R_Q \) \| > E_0 + 2$.
    For these fixed positive radii the annular transform is continuous in its center.
    Indeed the annular kernel is zero near its center, is continuous there after extension by zero,
    and has bounded compact support locally uniformly in the center;
    dominated convergence applies using local finiteness. Density of $E^(*)$ therefore permits replacing $a_Q$ by
    $a'_Q in E^(*)$ so close that
  $ \| a'_Q - z_Q \| < 2 kappa ell \( Q \) \, wide \| cal(S)_mu \( a'_Q \; r_Q \, R_Q \) \| > E_0 + 1 . $
  This perturbation uses the strict core and norm margins, and does not change either radius.
  Choose dyadic scales $s_r \, s_R$ with
  $ frac(r_Q, 8 L_0) < s_r lt.eq frac(r_Q, 4 L_0) \, wide frac(R_Q, 8 L_0) < s_R lt.eq frac(R_Q, 4 L_0) \, $
  using the same monotone rounding rule, so $s_r lt.eq s_R$.
    Let $A_Q$ and $B_Q$ be the cells at those scales containing $a'_Q$.
    They are descendants of $Q$ with $A_Q subset B_Q subset Q$. Since a cell at scale $s$ has diameter at most $L_0 s$,
  $ A_Q subset B \( a'_Q \, r_Q \/ 2 \) \, wide B_Q subset B \( a'_Q \, R_Q \/ 2 \) \, quad r_Q^n lt.eq
    M mu \( A_Q \) \, quad R_Q^n lt.eq M mu \( B_Q \) . $
  Fix an integer $I gt.eq 1$ larger than $log_2 \( 8 L_0 \/ rho \)$. The depth of $A_Q$ below $Q$ is at most $I$, and
  #[#set math.equation(numbering: n => "(2.14)")
   $ mu \( Q \) lt.eq H_I mu \( A_Q \) \, wide H_I = \( C_1 \/ c_1 \) 2^(I n) . $ <eq:haar-inner-parent-mass>]
  Neither $M$ nor $E_0$ depends on $rho$; the depth cost $H_I$ is allowed to depend on the now fixed $rho$.
  #emph[Haar Bessel gives the Carleson estimate.] Set
  $ h_Q = mu \( A_Q \)^(1 \/ 2) (frac(1_(A_Q), mu \( A_Q \)) - frac(1_(B_Q), mu \( B_Q \))) . $
  Direct integration gives $integral h_Q thin d mu = 0$ and $parallel h_Q parallel_2^2 = 1 -
    mu \( A_Q \) \/ mu \( B_Q \) lt.eq 1$. This function is supported in $Q$ and is constant almost everywhere on
    every cell at least $I$ generations below $Q$. Partition a finite collection of these functions according to
    the level of $Q$ modulo $I$. Within one class, distinct equal-level parents are disjoint.
    For unequal levels, the gap is at least $I$: the coarser function is constant on the finer parent,
    or their supports are disjoint. The finer function’s mean zero gives orthogonality.
    Bessel’s inequality in each class and summation give
  #[#set math.equation(numbering: n => "(2.15)")
   $ sum_Q lr(|integral h_Q chevron.l e_Q \, u chevron.r thin d mu|)^2 lt.eq
     I parallel u parallel_2^2 $ <eq:bounded-depth-haar-bessel>]
  for vector $u in L^2 \( mu \)$ and independently chosen $\| e_Q \| lt.eq 1$.
    The vector extension follows by the same Parseval argument as in Lemma 9.
  Fix a top cube $Q_0$ and a finite $cal(A) subset cal(F)_1 ∩ cal(D) \( Q_0 \)$.
    Use, for every selected cube, the same set $S = B \( z_(Q_0) \, \( C_0 + 2 \) ell \( Q_0 \) \)$.
    The annular center and radius bounds ensure $B \( a'_Q \, 2 R_Q \) subset S$.
    Choose $e_Q$ from the annular vector as in Lemma 13; then choose a single
  $ 0 < epsilon < 1 / 2 min_(Q in cal(A)) r_Q $
  when the family is nonempty. The average gap is greater than one for every selected $Q$ at this same truncation.
    Consequently
  $ mu \( A_Q \) < lr(|integral h_Q chevron.l e_Q \, R_(mu \, epsilon) 1_S chevron.r thin d mu|)^2 . $
  By (2.14), (2.15), and the operator bound,
  $ sum_(Q in cal(A)) mu \( Q \) lt.eq H_I I C_(upright(R))^2 mu \( S \) lt.eq
    H_I I C_(upright(R))^2 frac(G \( C_0 + 2 \)^n, c_1) mu \( Q_0 \) . $
  The empty family is immediate. Taking the supremum over finite subfamilies proves that $cal(F)_1$ is Carleson.
    Finally add the possible top level with $ell \( Q \) > D_E$ to obtain $cal(F)$.
    Its mass below any top cube is at most the mass of that top cube.
    The seed conclusion and its uniform depth bound hold for every cube outside this family. ◻
]

== 3 Reflectionless limits and compatible normal coordinates <sec:planar-limits>

We first compare two planes using points near both of them.
  This gives one reference plane that controls the errors over a finite range of dyadic radii.
  We then identify the measure obtained when those errors vanish.
  Three assertions enter that identification separately: the limit is supported in a plane,
  its support fills the plane, and its density on that plane is constant.

=== 3.1 Comparison from measured errors <comparison-from-measured-errors>

#thm([Lemma 3.1.])[
  (Comparison of fitting planes).  #emph[Fix $1 lt.eq n lt.eq d$, $G gt.eq 0$, and $c > 0$.
    There are constants $A > 0$ and $0 < epsilon_0 lt.eq 1$, depending only on $n \, d \, G \, c$,
    with the following property. Suppose that $sigma$ has global upper $n$-growth $G$, $R > 0$,
    and $sigma \( B \( 0 \, R \) \) gt.eq c R^n$. If $S \, W$ are affine $n$-planes and $0 < eta lt.eq
    epsilon_0 R$ satisfy
#[#set math.equation(numbering: n => "(3.1)")
 $ integral_(B \( 0 \, R \)) #scale(x: 120%, y: 120%)[\(] "dist" \( x \, S \)^2 +
   "dist" \( x \, W \)^2 #scale(x: 120%, y: 120%)[\)] thin d sigma \( x \) lt.eq c / 2 eta^2 R^n \,
   $ <eq:joint-plane-error>]

 then
#[#set math.equation(numbering: n => "(3.2)")
 $ "dist" \( x \, W \) & lt.eq A eta \( 1 + \| x \| \/ R \) &  & \( x in S \) \,\
\| "dist" \( x \, S \) - "dist" \( x \, W \) \| & lt.eq A eta \( 3 + \| x \| \/ R \) &  & \( x in bb(R)^d \) .
  $ <eq:plane-comparison>]

 The first conclusion also holds with $S$ and $W$ interchanged.]
] <lem:plane-comparison>

#proof[
  Every integral in (3.1) is finite, since its integrand is bounded on the ball and upper growth implies local
    finiteness. Markov’s inequality shows that
  $ F = { x in B \( 0 \, R \) : "dist" \( x \, S \)^2 + "dist" \( x \, W \)^2 < eta^2 } quad
    upright("satisfies") quad sigma \( F \) gt.eq \( c \/ 2 \) R^n . $
  In particular, every point of $F$ is within $eta$ of both planes.
  Here is the quantitative nonconcentration needed to choose points in $F$.
    If $V$ is an affine $k$-plane, $k < n$, and $0 < tau lt.eq 1$, then
  #[#set math.equation(numbering: n => "(3.3)")
   $ sigma { x in overline(B) \( 0 \, R \) : "dist" \( x \, V \) < tau R } lt.eq
     G 2^n 3^k tau R^n . $ <eq:lower-dimensional-tube>]
  Indeed, projection onto $V$, centered at the projection of $0$,
    sends $overline(B) \( 0 \, R \)$ into its intrinsic closed $R$-ball.
    A maximal $tau R$-separated subset of this intrinsic ball has at most $\( 1 + 2 \/ tau \)^k$ points:
    its disjoint open $tau R \/ 2$-balls lie in the $\( R + tau R \/ 2 \)$-ball,
    and comparison of their $k$-dimensional volumes gives this bound. Maximality gives a $tau R$-net.
    Ambient balls of radius $2 tau R$ about its points cover the indicated tube.
    Upper growth gives $G 2^n 3^k tau^(n - k) R^n$, which implies (3.3).
  Choose
  $ tau = min { 1 \, c \/ \[ 4 \( G 2^n 3^n + 1 \) \] } . $
  The tube mass in (3.3) is strictly less than $\( c \/ 2 \) R^n$.
    Thus we can successively choose $p_0 \, dots.h \, p_n in F ∩ "supp" sigma$ such that, for $1 lt.eq j lt.eq n$,
  $ "dist" #scale(x: 120%, y: 120%)[\(] p_j \, p_0 + "span" { p_i - p_0 : 1 lt.eq
    i < j } #scale(x: 120%, y: 120%)[\)] gt.eq tau R . $
  At each step the affine span has dimension less than $n$, and $"supp" sigma$ has full measure.
    Put $v_j = p_j - p_0$. Then $\| v_j \| lt.eq 2 R$. These vectors satisfy
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(j = 1)^n \| t_j \| lt.eq K / R lr(|sum_(j = 1)^n t_j v_j|) \, $ <eq:anchor-conditioning>]
  where $K$ depends only on $n \, tau$. For completeness, define $K_0 = 0$ and $K_(j + 1) =
    K_j \( 1 + 2 \/ tau \) + 1 \/ tau$. Projection perpendicular to the span of the first $j$ vectors bounds the
    last coefficient by the norm of the complete linear combination divided by $tau R$.
    Subtracting its last term enlarges that norm by at most $1 + 2 \/ tau$. Induction proves (3.4) with $K = K_n$.
    It also proves independence of the $v_j$.
  Let $a = pi_S p_0$ and $w_j = pi_S p_j - a$, where $pi_S$ is orthogonal projection.
    We have $\| w_j - v_j \| lt.eq 2 eta$. If $eta \/ R lt.eq 1 \/ \[ 4 \( K + 1 \) \]$, (3.4) and absorption give
  $ sum \| t_j \| lt.eq frac(2 K, R) lr(|sum t_j w_j|) . $
  The $n$ vectors $w_j$ consequently form a basis of the direction of $S$.
    Every projected anchor $a \, a + w_1 \, dots.h \, a + w_n$ lies within $2 eta$ of $W$.
    The orthogonal normal-coordinate map for $W$ is affine and has norm $"dist" \( dot.op \, W \)$.
    Applying this affine map to $x = a + sum t_j w_j$ gives
  $ "dist" \( x \, W \) lt.eq 2 eta + 4 eta sum \| t_j \| lt.eq 2 eta + frac(8 K eta, R) \| x - a \| . $
  Since $\| a \| lt.eq R + eta lt.eq 2 R$, this proves (3.2), for example with $A =
    2 \( 1 + 8 K \)$ and $epsilon_0 = min { 1 \, 1 \/ \[ 4 \( K + 1 \) \] }$.
    All choices preceded $sigma \, R \, S \, W \, eta$.
  Finally, for arbitrary $x$, let $p = pi_S x$. Since $\| pi_S 0 \| lt.eq \| a \| lt.eq
    2 R$ and the linear part of $pi_S$ is a contraction, $\| p \| lt.eq \| x \| + 2 R$. Hence
  $ "dist" \( x \, W \) lt.eq \| x - p \| + "dist" \( p \, W \) lt.eq "dist" \( x \, S \) +
    A eta \( 3 + \| x \| \/ R \) . $
  Interchanging the planes proves (3.2). ◻
]

#thm([Lemma 3.2.])[
  (One reference plane through a finite horizon).  #emph[Fix $0 < gamma < 1 \/ 2$ and the constants $n \, d \,
    G \, c$ of Lemma 14. There are $kappa > 0$ and $M < oo$, depending only on these data and $gamma$, as follows.
    Suppose $K gt.eq 0$ is an integer, $delta > 0$, $delta 2^(gamma K) lt.eq kappa$,
    $sigma$ has global upper growth $G$, and, for $0 lt.eq k lt.eq K$,
$ sigma \( B \( 0 \, 2^k \) \) gt.eq c 2^(k n) \, wide e_sigma \( 0 \, 2^k \) lt.eq delta 2^(gamma k) . $

 Then an affine $n$-plane $S$ satisfies
#[#set math.equation(numbering: n => "(3.5)")
 $ integral_(B \( 0 \, 2^k \)) "dist" \( x \, S \)^2 thin d sigma \( x \) lt.eq
   M delta^2 2^(k \( n + 2 + 2 gamma \)) wide \( 0 lt.eq k lt.eq K \) . $ <eq:fixed-plane-moments>]

]
] <lem:fixed-plane-moments>

#proof[
  Write $b = 2^gamma > 1$ and $R_i = 2^i$. The definition of the infimum in $e_sigma$ and the positivity of $delta
    b^i$ give affine planes $P_i$, $0 lt.eq i lt.eq K$, with
  $ integral_(B \( 0 \, R_i \)) "dist" \( x \, P_i \)^2 thin d sigma lt.eq 2 \( delta b^i \)^2 R_i^(n + 2) . $
  No attainment of a least-squares infimum is required. For $0 lt.eq i < K$,
    restricting the error for $P_(i + 1)$ to $B \( 0 \, R_i \)$ shows that the sum of neighboring errors is at
    most $D \( delta b^i \)^2 R_i^(n + 2)$, where $D = 2 + 2 dot.op 2^(n + 2) b^2$.
    Choose $L > 0$ with $D lt.eq L^2 c \/ 2$, and put $eta_i = L delta R_i b^i$.
    Taking $kappa = epsilon_0 \/ L$ ensures $eta_i lt.eq epsilon_0 R_i$ through the horizon.
    Lemma 14 gives, at the same arbitrary point $x$ in each step,
  $ "dist" \( x \, P_i \) lt.eq "dist" \( x \, P_(i + 1) \) + A L delta b^i \( 3 R_i + \| x \| \) . $
  For $\| x \| lt.eq R_k$, the sum of these errors for $i < k$ is bounded by $B delta R_k b^k$, where
  $ B = A L (frac(3, 2 b - 1) + frac(1, b - 1)) . $
  Indeed, sum the geometric series with ratios $2 b$ and $b$ separately.
    Consequently $"dist" \( x \, P_0 \) lt.eq "dist" \( x \, P_k \) + B delta R_k b^k$ on that ball.
    Squaring, integrating, and using upper growth proves (3.5) with $S = P_0$ and $M = 4 + 2 G B^2$. ◻
]

=== 3.2 Rigidity on the limiting plane <rigidity-on-the-limiting-plane>

We shall use the symmetric fractional operator

#[#set math.equation(numbering: n => "(3.6)")
 $ cal(L) g \( x \) = integral_(bb(R)^n) frac(2 g \( x \) - g \( x + z \) - g \( x - z \), 2 \| z \|^(n + 1)) thin
   d z \, wide g in C_c^oo \( bb(R)^n \) . $ <eq:fractional-operator-definition>]

This integral is absolutely convergent: the numerator is $O \( \| z \|^2 \)$ near zero and is bounded at infinity.
  Lemma 21 proves that a measurable function $v : bb(R)^n arrow.r
  bb(R)$ satisfying $integral \| v \( x \) \| \( 1 + \| x \| \)^(- n - 2) thin d x < oo$ and $integral v cal(L)
  g = 0$ for every compact smooth mean-zero test is affine almost everywhere.
  If $v$ is essentially bounded, it is constant almost everywhere.
  That lemma concerns functions on $bb(R)^n$ and is proved independently of the limiting measures constructed here.

#thm([Lemma 3.3.])[
  (Rigidity of a planar reflectionless measure).  #emph[Let $1 lt.eq n lt.eq d$, let $L$ be an affine $n$-plane,
    and let $sigma$ be a nonzero Radon measure on $bb(R)^d$ supported in $L$. Suppose that $c \, G > 0$ and
$ sigma \( B \( x \, r \) \) lt.eq G r^n quad \( x in bb(R)^d \, med r > 0 \) \, wide
  sigma \( B \( x \, r \) \) gt.eq c r^n quad \( x in "supp" sigma \, med r > 0 \) . $

 Suppose also that $cal(R)_sigma \( phi \) = 0$ for every compactly supported Lipschitz function $phi$ with
   $integral phi thin d sigma = 0$. Assume the hard Riesz truncations are uniformly bounded on $L^2 \( sigma \)$. Then
$ "supp" sigma = L \, wide sigma = theta thin cal(H)^n #h(-0.16667em) harpoon.tr L quad
  upright("for some ") theta > 0 . $

 The same conclusion holds if the operator assumption on $sigma$ is replaced by the following source assumption:
   $sigma_j$ are Radon measures on $bb(R)^d$ converging to $sigma$ against compact continuous tests,
   with a common global upper $n$-growth bound and a common uniform hard-truncation $L^2$ bound.
   With the Euclidean normalization of $cal(H)^n$, the resulting constant satisfies $c \/ omega_n lt.eq
   theta lt.eq G \/ omega_n$, where $omega_n = \| B_(bb(R)^n) \( 0 \, 1 \) \|$.]
] <lem:planar-rigidity>

#proof[
  An affine isometry identifies $L$ with $bb(R)^n$. Under this identification write $mu$ for $sigma$.
    The kernel and its scalar projections commute with this isometry.
    Reflectionlessness passes to $mu$ with its actual measure:
    extend an intrinsic compact Lipschitz test by composing with orthogonal projection and multiplying by an
    ambient compact cutoff equal to one on its trace support. Its integral is unchanged.
    Choose a localization ball containing the extension and use the localization independence of the mean-zero
    pairing from Lemma 5. Thus no density or full-support assertion is needed to make this identification.
  #emph[Full support.] We first derive an annular bound using only growth and reflectionlessness.
    For a test supported in $overline(B) \( a \, R \/ 2 \)$, denote by $P_(a \, R) \( phi \)$ the vector expression
  $ & 1 / 2 integral.double_(B \( a \, R \)^2) K_n \( x - y \) #scale(x: 120%, y: 120%)[\(] phi \( x \) -
    phi \( y \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) d mu \( y \)\
 & wide + integral_(B \( a \, R \)) phi \( x \) integral_(B \( a \, R \)^c) #scale(x: 120%, y: 120%)[\[]
   K_n \( x - y \) - K_n \( a - y \) #scale(x: 120%, y: 120%)[\]] thin d mu \( y \) d mu \( x \) . $
  Both terms are absolutely integrable by the Lipschitz cancellation near the diagonal and the extra power of
    decay in the exterior difference. This expression is defined without a mean-zero assumption;
    on mean-zero tests it equals $cal(R)_mu$. Splitting the larger ball into the smaller ball and its complement,
    and using oddness, gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ P_(a \, R) \( phi \) - P_(a \, r) \( phi \) = (integral phi thin d mu)
     integral_(B \( a \, R \) \\ B \( a \, r \)) K_n \( a - y \) thin d mu \( y \) $ <eq:planar-radius-difference>]
  when $0 < r lt.eq R$ and $"supp" phi subset overline(B) \( a \, r \/ 2 \)$.
    One may first perform the splitting with a finite outer cutoff;
    the integrable exterior differences justify its removal.
  Choose a nonnegative Lipschitz bump equal to one on $B \( a \, s \)$ and zero outside $B \( a \, 2 s \)$,
    and divide it by its $mu$-integral. For $a in "supp" mu$ the resulting function $eta_s$ has integral one and
    satisfies
  $ parallel eta_s parallel_oo lt.eq \( c s^n \)^(- 1) \, wide "Lip" \( eta_s \) lt.eq \( c s^(n + 1) \)^(- 1) \,
    wide \| P_(a \, 4 s) \( eta_s \) \| lt.eq C_n \( G^2 \/ c + G \) = : A . $
  For the last estimate the interior term is at most a constant times
    $\( c s^(n + 1) \)^(- 1) \( G s^n \) \( G s \)$; the exterior term is at most a constant times $G s \/ s$,
    since $integral eta_s thin d mu = 1$. Apply reflectionlessness to $eta_(r \/ 4) -
    eta_(R \/ 4)$ and then use (3.7). It follows that
  $ lr(|integral_(B \( a \, R \) \\ B \( a \, r \)) K_n \( a - y \) thin d mu \( y \)|) lt.eq
    2 A wide \( 0 < r lt.eq R \) . $
  Letting inner radii decrease strictly to $epsilon$ gives the same bound on ${ y : epsilon < \| y - a \| < R }$.
    At fixed $epsilon > 0$ the kernel is integrable there, so this passage does not require zero mass on spheres.
  Suppose now that $z in.not "supp" mu$, and let $a$ be a nearest support point to $z$.
    Translate $a$ to zero and put $e = a - z eq.not 0$. The nearest-point property gives
  $ 2 chevron.l e \, x chevron.r + \| x \|^2 gt.eq 0 wide \( x in "supp" mu \) . $
  Define $p_e \( x \) = max \( 0 \, chevron.l e \, x chevron.r \) \/ \| x \|^(n + 1)$ for $x eq.not 0$,
    and set $p_e \( 0 \) = 0$. Then
  $ p_(- e) \( x \) lt.eq 1 / 2 \| x \|^(1 - n) \, wide p_e \( x \) = chevron.l e \, K_n \( x \) chevron.r +
    p_(- e) \( x \) . $
  Upper growth makes the first majorant integrable on bounded balls:
    its integral on $B \( 0 \, R \)$ is at most $C_n G R$, as follows by dyadic annuli.
    The signed annular bound therefore bounds the nonnegative truncated integrals of $p_e$ on $B \( 0 \, 1 \)$
    uniformly. Monotone convergence proves $p_e in L^1 \( mu \|_(B \( 0 \, 1 \)) \)$.
  Take a weakly convergent subsequence of the normalized blowups $mu_r \( A \) =
    r^(- n) mu \( r A \)$ as $r arrow.b 0$. Upper growth supplies compactness,
    and the lower bound at zero makes the limit $tau$ nonzero.
    These are the conclusions of Lemma 6, applied to the blowups.
    The rescaled quadratic inequality is $2 chevron.l e \, x chevron.r + r \| x \|^2 gt.eq 0$;
    hence $"supp" tau subset { chevron.l e \, x chevron.r gt.eq 0 }$. For every fixed $T > 0$,
  $ integral_(B \( 0 \, T \)) max \( 0 \, chevron.l e \, x chevron.r \) thin d mu_r \( x \) lt.eq
    T^(n + 1) integral_(B \( 0 \, r T \)) p_e \( y \) thin d mu \( y \) arrow.r 0 . $
  Testing with compact nonnegative cutoffs shows that $tau$ is also supported in ${ chevron.l e \,
    x chevron.r lt.eq 0 }$. It is consequently supported on a proper hyperplane in $bb(R)^n$.
    This is impossible for a nonzero measure with upper $n$-growth:
    covering open sets by disjoint dyadic cubes and enclosing each cube in a ball shows that such a measure is
    bounded above by $C_n G' thin d x$, where $G'$ is its growth constant.
    A proper hyperplane has Lebesgue measure zero. This contradiction proves $"supp" mu = bb(R)^n$.
  #emph[A positive bounded density.] The same cube comparison gives $mu = f thin d x$ with $f lt.eq
    C_n G$ almost everywhere. Full support makes the lower ball bound valid at every point.
    Lebesgue differentiation then gives $f gt.eq c \/ omega_n$ almost everywhere.
    Choose a measurable representative with
  #[#set math.equation(numbering: n => "(3.8)")
   $ 0 < c_1 lt.eq f \( x \) lt.eq C_1 < oo wide \( x in bb(R)^n \) . $ <eq:planar-two-sided-density>]
  Changing $f$ on a null set has not changed $mu$.
  #emph[A local representative for the pairing.] Fix a unit direction $u in bb(R)^n$, a center $a$,
    and radii $0 < H$ and $2 H lt.eq R$. Put $B = B \( a \, R \)$ and
  $ T_(epsilon \, B) 1 \( x \) =
    integral_B frac(chevron.l u \, x - y chevron.r, max \( epsilon \, \| x - y \| \)^(n + 1)) thin d mu \( y \) . $
  There is a constant $D_1$, independent of $B$ and $epsilon > 0$, such that
  #[#set math.equation(numbering: n => "(3.9)")
   $ parallel T_(epsilon \, B) 1 parallel_(L^2 \( mu \|_B \)) lt.eq
     D_1 mu \( B \)^(1 \/ 2) . $ <eq:planar-local-cap-bound>]
  For the direct operator hypothesis, subtract the hard truncation.
    The error kernel is bounded by $epsilon^(- n) upright(bold(1))_({ \| x - y \| lt.eq epsilon })$.
    Its row and column integrals are at most $2^n G$, so Schur’s inequality gives (3.9) from the original operator
    bound. Restricting the hard operator to a ball preserves that bound, by extending the input by zero.
  Here is also the justification under the source assumption.
    Work first in $bb(R)^d$ on the ambient ball corresponding to $B$.
    Its boundary has $sigma$-measure zero by (3.8). Restricted source measures therefore converge weakly as finite
    measures. The same Schur estimate gives uniformly bounded capped bilinear pairings on every source
    restriction. For fixed $epsilon > 0$ these pairings pass to the limit against two bounded continuous tests:
    the capped kernel is bounded continuous, as are the squared tests giving their $L^2$ norms.
    Take the input test to be one and the other test to be the capped output for the limiting finite measure.
    That output is bounded continuous, by dominated convergence at this fixed cap.
    The resulting bilinear estimate gives its genuine $L^2$ bound (3.9).
    Isometric pullback gives precisely the displayed intrinsic transform.
    This argument passes no singular kernel through weak convergence.
  Choose a subsequence $epsilon_j arrow.b 0$ along which $T_(epsilon_j \, B)
    1$ converges weakly in $L^2 \( mu \|_B \)$ to $v$. This one subsequence works against every test in that
    Hilbert space. Oddness gives, for bounded Lipschitz $phi$,
  $ integral_B T_(epsilon \, B) 1 thin phi thin d mu = 1 / 2 integral.double_(B^2)
    frac(chevron.l u \, x - y chevron.r \( phi \( x \) - phi \( y \) \), max \( epsilon \, \| x - y \| \)^(n + 1))
    thin d mu \( x \) d mu \( y \) . $
  Removing the cap on the right changes the integral by at most $C_n G "Lip" \( phi \) mu \( B \) epsilon$.
    Thus $v$ represents the actual interior singular pairing. On $B \( a \, H \)$ the function
  $ F \( x \) = integral_(B \( a \, R \)^c) chevron.l u \, K_n \( x - y \) -
    K_n \( a - y \) chevron.r thin d mu \( y \) $
  is well defined and bounded: the kernel difference is at most $C_n \| x - a \| \| y - a \|^(- n - 1)$,
    whose exterior integral is at most $C_n G \| x - a \| \/ R$.
    Fubini now identifies the scalar component of $cal(R)_mu \( phi \)$ with $integral \( v + F \) phi thin d
    mu$ for mean-zero compact Lipschitz tests supported in $B \( a \, H \)$.
  Choose a compact Lipschitz test $eta$ supported in $B \( a \, H \)$ with $integral eta thin d mu = 1$,
    using the positive mass of that ball, and put $b = integral \( v + F \) eta thin d mu$.
    For any smooth compact test $q$ in this smaller ball, reflectionlessness applied to
    $q - \( integral q thin d mu \) eta$ gives $integral \( v + F - b \) q thin d mu = 0$.
    Since $mu = f thin d x$, the fundamental lemma for locally integrable functions applied to $\( v + F - b \)
    f$ proves
  #[#set math.equation(numbering: n => "(3.10)")
   $ v + F = b quad mu upright("-almost everywhere on ") B \( a \, H \) . $ <eq:planar-local-constant>]
  This is a statement about the transform; constancy of $f$ has not yet been used or proved.
  #emph[An unweighted equation and density constancy.] Let $g in
    C_c^oo \( B \( a \, H \) \)$ be real with $integral g thin d x = 0$.
    By (3.8), $g \/ f$ belongs to $L^2 \( mu \|_B \)$. It is therefore an allowed test for the weak convergence,
    even though it need not be Lipschitz. Moreover, $mu$ and Lebesgue measure have the same null sets.
    Testing with $g \/ f$ and using (3.10) yields
  #[#set math.equation(numbering: n => "(3.11)")
   $ lim_j [integral g \( x \) T_(epsilon_j \, B) 1 \( x \) thin d x + integral g \( x \) F \( x \) thin d x] =
     0 . $ <eq:planar-unweighted-local>]
  The subsequence and $b$ were selected before $g$.
  For a compact smooth function $g$, define the scalar test transform
  $ R_u g \( x \) = - 1 /
    2 integral_(bb(R)^n) frac(chevron.l u \, h chevron.r \[ g \( x + h \) - g \( x - h \) \], \| h \|^(n + 1))
    thin d h . $
  The integral is absolutely convergent: the first difference is $O \( \| h \| \)$ near zero,
    and the translated compact supports control infinity. The analogous capped expression equals the capped
    transform of $g$ by translation and reflection. It converges pointwise to $R_u
    g$ and is uniformly bounded on bounded $x$-sets. If $"supp" g subset B \( a \, H \)$ and $integral g = 0$,
    then for $\| x - a \| gt.eq 2 H$ and $epsilon lt.eq H$ the cap is inactive and mean-zero cancellation gives
  $ \| R_(u \, epsilon)^(upright("cap")) g \( x \) \| lt.eq C_n H parallel g parallel_1 \| x - a \|^(- n - 1) . $
  Together these bounds form an integrable majorant independent of small $epsilon$.
    Since $f$ is bounded, dominated convergence applies to $integral f R_(u \, epsilon)^(upright("cap")) g$.
  For $epsilon lt.eq H$, oddness and Fubini identify the expression in brackets in (3.11) with $-
    integral f R_(u \, epsilon)^(upright("cap")) g thin d x$. The local capped product is absolutely integrable.
    For the exterior term, use the centered kernel difference,
    which is absolutely integrable against $\| g \( x \) \| thin d x thin d mu \( y \)$;
    cancel the center term using $integral g = 0$ inside the $x$-integral before integrating over the infinite
    exterior. The open ball and its closed exterior are exact complements.
    Thus no separate divergent exterior integral or omitted boundary term occurs. It follows that
  #[#set math.equation(numbering: n => "(3.12)")
   $ integral_(bb(R)^n) f \( x \) R_u g \( x \) thin d x = 0 wide
     (g in C_c^oo \( bb(R)^n \) \, med integral g = 0) . $ <eq:planar-density-riesz>]
  The ball may be chosen after the test, so this statement has no fixed support restriction.
  Let $u_1 \, dots.h \, u_n$ be an orthonormal basis and $psi in C_c^oo \( bb(R)^n \)$ be real.
    Each $g_i = partial_(u_i) psi$ has integral zero. We claim
  #[#set math.equation(numbering: n => "(3.13)")
   $ sum_(i = 1)^n R_(u_i) \( partial_(u_i) psi \) \( x \) = cal(L) psi \( x \) . $ <eq:planar-riesz-gradient>]
  Indeed, set
  $ Q_x \( t \) = integral frac(psi \( x + t h \) + psi \( x - t h \) - 2 psi \( x \), \| h \|^(n + 1)) thin d h . $
  Scaling gives $Q_x \( t \) = t Q_x \( 1 \)$ for $t > 0$. Differentiation under the integral at $t =
    1$ is justified by second-derivative cancellation near zero; for $1 \/ 2 lt.eq t lt.eq
    2$ the derivative integrand vanishes for all sufficiently large $\| h \|$ at fixed $x$. Consequently
  $ Q_x \( 1 \) = integral frac(D psi \( x + h \) h - D psi \( x - h \) h, \| h \|^(n + 1)) thin d h . $
  Expand $h$ in the orthonormal basis and use the definition of $R_u$ to obtain (3.13).
    Every pairing with bounded $f$ is integrable by the preceding estimates. Summing (3.12) therefore gives
  $ integral f cal(L) psi thin d x = 0 wide \( psi in C_c^oo \( bb(R)^n \) \) . $
  Real and imaginary parts give the same identity for complex tests.
    Boundedness supplies $integral \| f \( x \) \| \( 1 + \| x \| \)^(- n - 2) thin d x < oo$.
    Lemma 21 now makes $f$ affine almost everywhere. A bounded affine function is constant:
    any nonzero linear part is unbounded along a line, and continuity promotes an almost-everywhere bound to an
    everywhere bound. Thus $f = theta$ almost everywhere, with $theta > 0$ by (3.8).
    The original ball bounds give $c lt.eq theta omega_n lt.eq G$, completing the proof. ◻
]

=== 3.3 A common flat limit and its normal coordinates <a-common-flat-limit-and-its-normal-coordinates>

The passage from vanishing mean-zero pairings to a reflectionless weak limit is part of the compactness method of
  Jaye and Nazarov #cite(label("JayeNazarov2018I")). Here the common growth bounds control the singular diagonal
  and exterior tails, as proved in Lemma 6. We combine that local argument with the measured plane errors;
  we do not invoke a classification of arbitrary higher-codimension reflectionless measures.

#thm([Proposition 3.4.])[
  (The flat limit).  #emph[Fix $1 lt.eq n < d$, $c > 0$, $0 < G < oo$, $0 lt.eq D_0 < oo$,
    and $0 < gamma < 1 \/ 2$. Let $mu_j$ be Radon measures on $bb(R)^d$ with $0 in E_j = "supp" mu_j$,
    global upper $n$-growth $G$, and
$ mu_j \( B \( x \, r \) \) gt.eq c r^n quad \( x in E_j \, med 0 < r lt.eq "diam" E_j \) . $

 Assume every hard-truncated Riesz transform on $L^2 \( mu_j \)$ has norm at most $D_0$.
   Let $delta_j > 0$, integers $K_j gt.eq 0$, and $A_j \, v_j > 0$ satisfy
#[#set math.equation(numbering: n => "(3.14)")
 $ delta_j arrow.r 0 \, quad K_j arrow.r oo \, quad delta_j 2^(gamma K_j) arrow.r 0 \,\
2^(K_j) lt.eq "diam" E_j \, quad A_j arrow.r oo \, quad v_j arrow.r 0 . $ <eq:flat-limit-horizons>]

 Suppose
#[#set math.equation(numbering: n => "(3.15)")
 $ e_(mu_j) \( 0 \, 2^k \) lt.eq delta_j 2^(gamma k) wide \( 0 lt.eq k lt.eq K_j \) $ <eq:flat-limit-source-excess>]

 and
#[#set math.equation(numbering: n => "(3.16)")
 $ \| cal(R)_(mu_j) \( phi \) \| lt.eq v_j quad upright("if ") med "Lip" phi lt.eq 1 \, quad
   "supp" phi subset.double B \( 0 \, A_j \) \, quad integral phi thin d mu_j =
   0 . $ <eq:flat-limit-source-oscillation>]

 There is a subsequence, relabeled by $j$, with the following properties.
   All the input sequences are restricted along this same subsequence when we relabel them.
   For each index there are an affine plane $S_j = a_j + L_j \( bb(R)^n \)$, tangent and normal linear isometries
$ L_j : bb(R)^n arrow.r bb(R)^d \, wide N_j : bb(R)^(d - n) arrow.r bb(R)^d \, wide L_j L_j^(*) + N_j N_j^(*) = I \, $

 such that $a_j$ is the point of $S_j$ nearest $0$, $a_j arrow.r 0$, and $L_j arrow.r L_oo$ in operator norm,
   where $L_oo$ is an isometry. Along this same subsequence,
#[#set math.equation(numbering: n => "(3.17)")
 $ mu_j harpoon.rt q \( L_oo \)_(\#) cal(L)^n \, wide frac(c, 4^n omega_n) lt.eq q lt.eq frac(2^n G, omega_n) \,
   wide omega_n = cal(L)^n \( B \( 0 \, 1 \) \) . $ <eq:flat-limit-measure>]

 Here convergence is against continuous compactly supported tests,
   and $cal(L)^n$ in (3.17) denotes Lebesgue measure. The planes obey (3.5) with a single constant $M =
   M \( n \, d \, c \, G \, gamma \)$. In particular, writing $e_i$ for the standard basis of $bb(R)^(d - n)$ and
#[#set math.equation(numbering: n => "(3.18)")
 $ u_(j \, i) \( x \) = chevron.l N_j e_i \, x - a_j chevron.r \, $ <eq:flat-limit-normal-coordinate>]

 we have
#[#set math.equation(numbering: n => "(3.19)")
 $ integral_(B \( 0 \, 2^k \)) \| u_(j \, i) \|^2 thin d mu_j lt.eq
   M delta_j^2 2^(k \( n + 2 + 2 gamma \)) wide \( 0 lt.eq k lt.eq K_j \, 1 lt.eq i lt.eq d - n \) .
   $ <eq:flat-limit-normal-moments>]

 Moreover, on every bounded ball, the supports converge bilaterally to $L_oo \( bb(R)^n \)$:
   each source support point approaches that plane uniformly, and each point of the plane approaches $E_j$ uniformly.]
] <prop:flat-limit>

#proof[
  After discarding finitely many indices, the smallness threshold in Lemma 15 holds.
    That lemma gives $S_j$ and the uniform moment bounds. Each fixed-radius squared-distance integral tends to
    zero: choose a larger fixed dyadic radius first, and then use $K_j arrow.r oo$ and $delta_j arrow.r 0$.
  This integral conclusion also controls all support points in bounded balls.
    If $x_j in E_j ∩ B \( 0 \, R \)$ and $"dist" \( x_j \, S_j \) gt.eq t > 0$,
    the $1$-Lipschitz distance function is at least $t \/ 2$ on $B \( x_j \, min { 1 \, t \/ 2 } \)$.
    This ball lies in $B \( 0 \, R + 1 \)$, and its radius is admissible for all large $j$.
    The lower growth bound therefore forces a fixed positive lower bound on the squared-distance integral there,
    a contradiction. Thus
  #[#set math.equation(numbering: n => "(3.20)")
   $ sup_(x in E_j ∩ B \( 0 \, R \)) "dist" \( x \, S_j \) arrow.r 0 quad
     upright("for every fixed ") R . $ <eq:moving-support-tube>]
  Because $0 in E_j$, the nearest points $a_j$ tend to $0$.
    Choose orthonormal tangent and complementary normal frames $L_j \, N_j$.
    The compactness of the finite-dimensional set of tangent isometries gives a subsequence with $L_j arrow.r
    L_oo$; norm preservation shows that the limit is still an isometry.
    The normal frames are retained along this subsequence; their convergence is not required.
  Lemma 6, followed if necessary by a further subsequence, gives a nonzero limit $nu$ with $0 in "supp" nu$,
    hard truncation bound $D_0$, global upper growth $2^n G$, and
  #[#set math.equation(numbering: n => "(3.21)")
   $ nu \( B \( x \, r \) \) gt.eq 4^(- n) c r^n wide \( x in "supp" nu \, r > 0 \) . $ <eq:flat-limit-lower-growth>]
  All frames and moment bounds are kept along the composition of the two subsequences.
    If $x in "supp" nu$, positivity of compact tests in every neighborhood of $x$ supplies nearby points of $E_j$
    for all large $j$. Together with (3.20), this gives $"dist" \( x \, S_j \) arrow.r 0$.
    On the other hand the affine projections
  $ a_j + L_j L_j^(*) \( x - a_j \) arrow.r L_oo L_oo^(*) x . $
  It follows that $x = L_oo L_oo^(*) x$. At this stage we have proved only $"supp" nu subset L_oo \( bb(R)^n \)$.
  We next verify that this same $nu$ is reflectionless. Let $phi$ be a compactly supported Lipschitz function with
    $integral phi thin d nu = 0$. The pairing-convergence assertion of Lemma 6 provides compact Lipschitz tests
    $phi_j$ of zero $mu_j$-mean, with uniformly bounded supports and Lipschitz constants, such that
  $ cal(R)_(mu_j) \( phi_j \) arrow.r cal(R)_nu \( phi \) . $
  Choose $C gt.eq 1$ bounding their Lipschitz constants. For all sufficiently large $j$,
    their supports lie compactly inside $B \( 0 \, A_j \)$, so (3.16), applied to $phi_j \/ C$,
    gives $\| cal(R)_(mu_j) \( phi_j \) \| lt.eq C v_j arrow.r 0$. Thus $cal(R)_nu \( phi \) = 0$.
    This argument applies to every such test on the measure subsequence already selected above.
  Apply Lemma 16 to this plane-supported limit, using the inherited hard-truncation bound $D_0$.
    It gives $nu = q \( L_oo \)_(\#) cal(L)^n$ with $q > 0$. Its upper growth and (3.21),
    evaluated on a ball centered on the plane, give the two bounds for $q$ in (3.17).
    Since $\| u_(j \, i) \( x \) \| lt.eq \| N_j^(*) \( x - a_j \) \| = "dist" \( x \, S_j \)$,
    the normal moment bounds follow from those of $S_j$.
  Finally, convergence of the affine projections is uniform on bounded sets,
    so (3.20) gives uniform closeness of source support points to the limiting plane.
    Conversely, if points $y_j$ of that plane in a fixed bounded ball stayed a positive distance from $E_j$,
    a subsequence would converge to a point $y$ of the plane.
    A sufficiently small ball about $y$ would then miss $E_j$ for all large $j$.
    A nonnegative compact test in that ball with positive integral against $q \( L_oo \)_(\#)
    cal(L)^n$ contradicts weak convergence. This proves the stated bilateral convergence. ◻
]

In the later contradiction argument we take $gamma = 1 \/ 4$, $delta_j = 2^(- j)$, $K_j = 2 j + 3$, $A_j =
  8 dot.op 2^(K_j)$, and $v_j = delta_j^3$. These choices satisfy $delta_j 2^(gamma K_j) arrow.r
  0$ as well as $delta_j^(- 1) 2^(- K_j) arrow.r 0$. The latter condition will control the normalized exterior
  remainder; it was not needed to identify the unnormalized planar measure.

== 4 Fractional energy compactness on moving measures <sec:height-compactness>

The planar limit identifies the support at order one. To improve the #emph[normalized] excess,
  we must retain the first-order normal displacement. Two ingredients do this:
  a positive energy estimate obtained by testing with an unnormalized height,
  and a finite-partition compactness argument for functions whose underlying measures vary.
  We state the resulting convergence in terms of measures and moments;
  its formulation will also justify the singular limiting equation in the next section.

=== 4.1 A local energy estimate <a-local-energy-estimate>

For a measure $sigma$, a bounded measurable set $U$, and a real measurable function $f$, write

#[#set math.equation(numbering: n => "(4.1)")
 $ cal(E)_(sigma \, U) \( f \) = integral.double_(U times U)
   frac(\| f \( x \) - f \( y \) \|^2, \| x - y \|^(n + 1)) thin d sigma \( x \) d sigma \( y \) \,
   $ <eq:height-energy-definition>]

when this nonnegative integral is finite. Its integrand is assigned value zero on the diagonal.
  Positive-dimensional upper growth implies that singletons have measure zero, so this convention has no effect.

The following statement uses the geometric and moment hypotheses supplied by Proposition 17,
  together with explicit oscillation and horizon conditions.
  The small parameter is denoted by $delta_j$; the integer $K_j$ records the last available dyadic moment.

#thm([Lemma 4.1.])[
  (Energy of a normalized affine height).  #emph[Let $1 lt.eq n < d$, $0 < gamma < 1$,
    and let $mu_j$ be Radon measures on $bb(R)^d$ with $0 in "supp" mu_j$. Suppose that, for fixed $G \, c > 0$,
#[#set math.equation(numbering: n => "(4.2)")
 $ mu_j \( B \( x \, r \) \) & lt.eq G r^n &  & \( x in bb(R)^d \, r > 0 \) \,\
mu_j \( B \( 0 \, r \) \) & gt.eq c r^n &  & \( 0 < r lt.eq "diam" "supp" mu_j \) \, $ <eq:height-growth>]

 and $"diam" "supp" mu_j arrow.r oo$. Let $u_j$ be real affine functions with
#[#set math.equation(numbering: n => "(4.3)")
 $ u_j \( x \) - u_j \( y \) = chevron.l e_j \, x - y chevron.r \, wide \| e_j \| lt.eq 1 \,
   wide \| u_j \( 0 \) \| lt.eq W . $ <eq:height-affine-data>]

 Assume $delta_j > 0$, $delta_j arrow.r 0$, $K_j arrow.r oo$, and
#[#set math.equation(numbering: n => "(4.4)")
 $ 2^(- K_j) / delta_j arrow.r 0 . $ <eq:height-last-radius>]

 Suppose, with a fixed $M < oo$, that
#[#set math.equation(numbering: n => "(4.5)")
 $ integral_(B \( 0 \, 2^k \)) \| u_j \|^2 thin d mu_j lt.eq
   M delta_j^2 2^(\( n + 2 + 2 gamma \) k) wide \( 0 lt.eq k lt.eq K_j \) . $ <eq:height-dyadic-moments>]

 Finally, let $A_j arrow.r oo$ and suppose that every compactly supported Lipschitz function $phi.alt$ with
   $"supp" phi.alt subset B \( 0 \, A_j \)$ and $integral phi.alt thin d mu_j = 0$ satisfies
#[#set math.equation(numbering: n => "(4.6)")
 $ \| cal(R)_(mu_j) \( phi.alt \) \| lt.eq delta_j^3 "Lip" \( phi.alt \) . $ <eq:height-small-oscillation>]

 Then $w_j = u_j \/ delta_j$ has finite local energy, and for every $H < oo$ there is $C_H < oo$,
   independent of $j$, such that
#[#set math.equation(numbering: n => "(4.7)")
 $ integral_(B \( 0 \, H \)) \| w_j \|^2 thin d mu_j + cal(E)_(mu_j \, B \( 0 \, H \)) \( w_j \) lt.eq
   C_H . $ <eq:height-uniform-energy>]

 The eventual bound depends only on $H \, n \, gamma \, G \, c \, M \, W$;
   finitely many initial terms may be included by enlarging $C_H$.]
] <lem:height-energy>

#proof[
  It suffices to consider $H gt.eq 1$. Fix a Lipschitz function $chi$ with $0 lt.eq chi lt.eq 1$,
    $"Lip" \( chi \) lt.eq 2 \/ H$, equal to one on $B \( 0 \, H \)$, and zero outside $B \( 0 \, 3 H \/ 2 \)$.
    Its support lies in $B \( 0 \, 2 H \)$. Choose the smallest dyadic radius $R gt.eq 4 H$, and put $D =
    B \( 0 \, R \)$. All estimates below concern sufficiently large $j$, so that $K_j gt.eq log_2 R$,
    $delta_j lt.eq 1$, $A_j > 2 H$, and the lower estimate in (4.2) is available at radius $H$.
    Constants may depend on the fixed quantities displayed in the lemma and on $H \, R$, but not on $j$.
    We omit the index $j$ temporarily.
  The moment bound at radius $R$ gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ integral_D u^2 thin d mu lt.eq C delta^2 \, wide integral chi^2 thin d mu gt.eq mu \( B \( 0 \, H \) \) gt.eq
     c H^n > 0 . $ <eq:height-cutoff-mass>]
  Define the weighted center and its centered test by
  #[#set math.equation(numbering: n => "(4.9)")
   $ b = frac(integral chi^2 u thin d mu, integral chi^2 thin d mu) \, wide U = u - b \, wide phi.alt =
     chi^2 U . $ <eq:height-centered-test>]
  Cauchy–Schwarz, followed by (4.8), proves
  #[#set math.equation(numbering: n => "(4.10)")
   $ \| b \| lt.eq C delta \, wide integral_D U^2 thin d mu lt.eq C delta^2 \, wide
     integral \| phi.alt \| thin d mu lt.eq C delta \, wide integral \| phi.alt U \| thin d mu lt.eq
     C delta^2 . $ <eq:height-centered-bounds>]
  In particular, these estimates precede any energy bound. The function $phi.alt$ has mean zero.
    It also has a Lipschitz constant bounded independently of $j$:
    on the support of $chi$, $\| U \( x \) \| lt.eq W + 2 H + C$,
    and the product rule for Lipschitz functions gives the bound.
    The same bound across the complement follows because $chi$ vanishes there. Consequently (4.6) implies
  #[#set math.equation(numbering: n => "(4.11)")
   $ \| chevron.l e \, cal(R)_mu \( phi.alt \) chevron.r \| lt.eq C delta^3 . $ <eq:height-tested-pairing>]
  The positive part of this pairing comes from the exact identity
  #[#set math.equation(numbering: n => "(4.12)")
   $ & \( U \( x \) - U \( y \) \) \( chi \( x \)^2 U \( x \) - chi \( y \)^2 U \( y \) \)\
 & #h(12mm)  = \| chi \( x \) U \( x \) - chi \( y \) U \( y \) \|^2 -
   U \( x \) U \( y \) \( chi \( x \) - chi \( y \) \)^2 . $ <eq:height-cutoff-identity>]
  All terms in its integral over $D times D$ are integrable before a quantitative energy estimate is made.
    Indeed, a Lipschitz difference cancels one power of the distance in each factor.
    For every $x in D$, upper growth and dyadic annuli imply
  #[#set math.equation(numbering: n => "(4.13)")
   $ integral_D \| x - y \|^(1 - n) thin d mu \( y \) lt.eq C G R . $ <eq:height-near-row>]
  The integrability of local affine and cutoff energies follows from this bound and the finiteness of
    $mu \( D \)$. For the signed cutoff error, symmetry and $2 \| U \( x \) U \( y \) \| lt.eq U \( x \)^2 +
    U \( y \)^2$ give the sharper estimate
  #[#set math.equation(numbering: n => "(4.14)")
   $ & integral.double_(D times D) \| U \( x \) U \( y \) \|
     frac(\| chi \( x \) - chi \( y \) \|^2, \| x - y \|^(n + 1)) thin d mu \( x \) d mu \( y \)\
 & #h(12mm)  lt.eq C G R "Lip" \( chi \)^2 integral_D U^2 thin d mu lt.eq C delta^2 . $ <eq:height-cutoff-error>]
  This is an estimate from the already known second moment; it assumes no bound on the unknown fractional energy.
  We next separate the local pairing from its exterior remainder. Set $q \( x \, y \) = \| x - y \|^(- n - 1)$.
    The affine identity in (4.3), and the pairing formula in Lemma 5, give
  #[#set math.equation(numbering: n => "(4.15)")
   $ chevron.l e \, cal(R)_mu \( phi.alt \) chevron.r & = 1 /
     2 integral.double_(D times D) \( U \( x \) - U \( y \) \) \( phi.alt \( x \) - phi.alt \( y \) \)
     q \( x \, y \) thin d mu \( x \) d mu \( y \) + upright("Ext") \,\
upright("Ext") & = integral_D phi.alt \( x \) integral_(D^c) #scale(x: 120%, y: 120%)[\[] U \( x \)
  q \( x \, y \) - U \( y \) { q \( x \, y \) - q \( 0 \, y \) } #scale(x: 120%, y: 120%)[\]] thin d mu \( y \) d
  mu \( x \) . $ <eq:height-pairing-split>]
  To obtain the second identity, the base-point subtraction initially also contributes $-
    U \( 0 \) q \( 0 \, y \)$. That term is separately integrable on $D^c$ and disappears because $integral
    phi.alt thin d mu = 0$. The difference multiplying $U \( y \)$ in (4.15) is kept together.
  For $\| x \| lt.eq 2 H$ and $\| y \| gt.eq R$,
  #[#set math.equation(numbering: n => "(4.16)")
   $ q \( x \, y \) lt.eq C \| y \|^(- n - 1) \, wide \| q \( x \, y \) - q \( 0 \, y \) \| lt.eq
     C H \| y \|^(- n - 2) . $ <eq:height-tail-kernel>]
  The global affine bound $\| U \( y \) \| lt.eq \| y \| + W + C$, together with upper growth and (4.16),
    makes the exterior expression absolutely integrable. We may therefore integrate (4.12) and use (4.15) and
    (4.14) to obtain
  #[#set math.equation(numbering: n => "(4.17)")
   $ cal(E)_(mu \, D) \( chi U \) lt.eq 2 \| chevron.l e \, cal(R)_mu \( phi.alt \) chevron.r \| +
     2 \| upright("Ext") \| + C delta^2 . $ <eq:height-energy-reduction>]
  It remains to bound the exterior remainder at the scale of the known second moment. Put $T = 2^K$.
    Upper growth and dyadic annuli give $integral_(D^c) \| y \|^(- n - 1) thin d mu \( y \) lt.eq C \/ R$.
    On a controlled shell $t lt.eq \| y \| < 2 t$, where $t = 2^k$ and $k < K$,
    Cauchy–Schwarz and the moment at radius $2 t$ give
  #[#set math.equation(numbering: n => "(4.18)")
   $ integral_(t lt.eq \| y \| < 2 t) \| U \( y \) \| thin d mu \( y \) lt.eq
     C delta t^(n + 1 + gamma) wide \( t gt.eq R \) . $ <eq:height-shell-first-moment>]
  Here the contribution of $b$ is absorbed using $t gt.eq 1$. Since $gamma < 1$, summing the controlled shells gives
  #[#set math.equation(numbering: n => "(4.19)")
   $ integral_(R lt.eq \| y \| < T) frac(\| U \( y \) \|, \| y \|^(n + 2)) thin d mu \( y \) lt.eq
     C delta sum_(t gt.eq R\
t upright(" dyadic")) t^(gamma - 1) lt.eq C delta . $ <eq:height-controlled-tail>]
  Beyond the actual last controlled radius, use the global affine bound $\| U \( y \) \| lt.eq \| y \| + W + C$.
    Upper growth then gives
  #[#set math.equation(numbering: n => "(4.20)")
   $ integral_(\| y \| gt.eq T) frac(\| U \( y \) \|, \| y \|^(n + 2)) thin d mu \( y \) lt.eq
     C \( T^(- 1) + T^(- 2) \) lt.eq C T^(- 1) . $ <eq:height-uncontrolled-tail>]
  The half-open shells and the closed final exterior cover every point, including their boundary spheres.
    Combining (4.10) with the kernel and tail bounds (4.16)–(4.20) gives the quantitative estimate
  #[#set math.equation(numbering: n => "(4.21)")
   $ \| upright("Ext") \| lt.eq C \( delta^2 + delta T^(- 1) \) . $ <eq:height-exterior-bound>]
  Thus the remote part retains the factor $delta$ supplied by the centered test.
    Replacing that factor by a constant would lose the required normalization.
  The reduction (4.17), the tested-pairing bound (4.11), and (4.21) now yield
  #[#set math.equation(numbering: n => "(4.22)")
   $ cal(E)_(mu \, D) \( chi U \) lt.eq C \( delta^3 + delta^2 + delta T^(- 1) \) . $ <eq:height-unnormalized-energy>]
  On $B \( 0 \, H \)$, $chi = 1$ and the centered difference $U \( x \) - U \( y \)$ is $u \( x \) - u \( y \)$.
    Restriction to this smaller product set and division by $delta^2 > 0$ give
  #[#set math.equation(numbering: n => "(4.23)")
   $ cal(E)_(mu \, B \( 0 \, H \)) \( u \/ delta \) lt.eq C (1 + delta + frac(1, delta T)) .
     $ <eq:height-normalized-bound>]
  The last term is bounded by (4.4). The local $L^2$ estimate follows directly from the moment bound at a fixed
    dyadic radius containing $H$.
  For each of the finitely many omitted indices, $u_j \/ delta_j$ is an ordinary Lipschitz function.
    Upper growth gives its finite $L^2$ norm on every fixed ball, and (4.13) gives its finite local energy.
    Enlarging the bound to cover those indices completes the proof. ◻
]

In our application $delta_j = 2^(- j)$ and $K_j = 2 j + 3$.
  In particular, $delta_j^(- 1) 2^(- K_j) = 2^(- j - 3) arrow.r 0$.
  The conclusion of Lemma 18 is a #emph[bounded] normalized energy; no vanishing of that energy has been asserted.

=== 4.2 Finite partitions on bounded projection regions <finite-partitions-on-bounded-projection-regions>

Fix a linear $n$-plane $L$ through the origin, an isometry $e : bb(R)^n arrow.r L$,
  and the orthogonal coordinate map $pi = e^(*)$, so that $e pi$ is the orthogonal projection onto $L$. Set

#[#set math.equation(numbering: n => "(4.24)")
 $ Q_H = \( - \( H + 1 \) \, H + 1 \)^n \, wide Omega_H = pi^(- 1) \( Q_H \) ∩ B #scale(x: 120%, y: 120%)[\(]
   0 \, \( sqrt(n) + 1 \) \( H + 1 \) #scale(x: 120%, y: 120%)[\)] \, wide H = 0 \, 1 \, 2 \,
   dots.h . $ <eq:height-projection-regions>]

These bounded open sets exhaust $bb(R)^d$. Their intersection with $L$ is $e \( Q_H \)$:
  the closed box $e \( overline(Q)_H \)$ lies strictly inside the ambient bounding ball,
  because $\| e \( z \) \| lt.eq sqrt(n) \( H + 1 \)$ there. Consequently

#[#set math.equation(numbering: n => "(4.25)")
 $ nu \( partial Omega_H \) = 0 quad upright("for") quad nu = q thin e_(\#) cal(L)^n \, quad
   q > 0 . $ <eq:height-region-null-boundary>]

Only the coordinate faces meet the plane on this boundary, and those faces have zero $n$-dimensional volume.

#thm([Lemma 4.2.])[
  (Compactness with moving measures).  #emph[Suppose $mu_j$ are Radon measures with a common global upper
    $n$-growth bound and a common lower bound $c r^n$ at every support point and every admissible radius.
    Suppose also that $"diam" "supp" mu_j arrow.r oo$ and
#[#set math.equation(numbering: n => "(4.26)")
 $ mu_j arrow.r nu = q thin e_(\#) cal(L)^n \, wide q > 0 \, $ <eq:height-flat-measure-limit>]

 against continuous compactly supported tests. Let $w_j^1 \, dots.h \,
   w_j^s$ be finitely many real measurable functions. Assume that each belongs to $L^2$ on bounded balls and has
   integrable local fractional energy, and that for every $R < oo$
#[#set math.equation(numbering: n => "(4.27)")
 $ sup_j sum_(a = 1)^s
   (integral_(B \( 0 \, R \)) \| w_j^a \|^2 thin d mu_j + cal(E)_(mu_j \, B \( 0 \, R \)) \( w_j^a \)) < oo .
   $ <eq:height-compactness-hypothesis>]

 There are one subsequence and measurable functions $v^1 \, dots.h \,
   v^s in L_(upright("loc"))^2 \( L \, nu \)$ such that, on that subsequence,
   for every $H$ and every continuous function $psi$ on the compact set $overline(Omega)_H$,
#[#set math.equation(numbering: n => "(4.28)")
 $ integral_(Omega_H) w_j^a psi thin d mu_j & arrow.r integral_(Omega_H) v^a psi thin d nu \,\
integral_(Omega_H) \| w_j^a \|^2 psi thin d mu_j & arrow.r
  integral_(Omega_H) \| v^a \|^2 psi thin d nu . $ <eq:height-signed-moment-limit>]

 The ordinary restrictions $mu_j \|_(Omega_H)$ also converge weakly to $nu \|_(Omega_H)$ as finite measures on
   $overline(Omega)_H$. In particular,
#[#set math.equation(numbering: n => "(4.29)")
 $ integral_(Omega_H) \| w_j^a \|^2 thin d mu_j arrow.r integral_(Omega_H) \| v^a \|^2 thin d nu .
   $ <eq:height-norm-limit>]

 The subsequence and the functions are common to all these localizations and tests.]
] <lem:moving-compactness>

#proof[
  We give the construction, including the norm convergence.
    On each bounded projection region, fractional energy controls the variance inside small cells.
    A common subsequence of their finitely many averages will recover both first and second moments,
    not just weak convergence of the heights. First, (4.25) and compact support cutoffs imply finite-measure weak
    convergence on each $Omega_H$. Indeed, multiply by a compact continuous cutoff equal to one on
    $overline(Omega)_H$; weak convergence of these finite measures passes to restriction to the continuity set
    $Omega_H$. In particular their masses are bounded.
  We will also use the consequence
  #[#set math.equation(numbering: n => "(4.30)")
   $ sup { "dist" \( x \, L \) : x in "supp" mu_j ∩ B \( 0 \, R \) } arrow.r
     0 quad \( R < oo \) . $ <eq:height-physical-tube>]
  If this failed, some bounded sequence of support points would stay a positive distance from $L$.
    Passing to a subsequence, a fixed small ball about its limit would be disjoint from $L$ and would contain a
    smaller ball about each of those support points. The lower growth bound would give the smaller ball a fixed
    positive mass; its radius is admissible for large $j$. A continuous compact cutoff,
    equal to one on all the smaller balls and supported away from $L$, would then contradict (4.26).
    The cutoff is taken on a larger ambient ball, so the smaller support balls retain their full mass even if they
    cross a localization boundary.
  Fix $H$, and partition the half-open box $\( - \( H + 1 \) \, H + 1 \]^n$ into equal dyadic boxes of side length
    $h = 2 \( H + 1 \) 2^(- k)$. For such a box $D$, set
  $ C_D = Omega_H ∩ pi^(- 1) \( D \) . $
  These finitely many disjoint measurable cells cover $Omega_H$.
    Each cell boundary has $nu$-measure zero, by (4.25) and the nullity of coordinate faces.
    The same holds for intersections of cells from different partition levels. Hence
  #[#set math.equation(numbering: n => "(4.31)")
   $ mu_j \( C_D \) arrow.r nu \( C_D \) = q h^n \, wide mu_j \( C_D ∩ C_(D') \) arrow.r
     nu \( C_D ∩ C_(D') \) . $ <eq:height-cell-mass-limits>]
  For each fixed partition level, all its cell masses are therefore at least $\( q \/ 2 \)
    h^n$ for sufficiently large $j$. This uses positivity on #emph[every] full-plane cell,
    rather than just nonzero total mass. By (4.30), at that same fixed level the actual support points in one cell
    have mutual distance at most $\( sqrt(n) + 2 \) h$ for sufficiently large $j$.
    The entire projection cylinder need not have bounded diameter; only pairs seen by the restricted measure are used.
  For $w_j = w_j^a$, let $m_(j \, D)$ be its average on $C_D$ (zero if the cell has zero mass),
    and let $P_k^j w_j$ be the corresponding step function. The exact variance identity gives
  #[#set math.equation(numbering: n => "(4.32)")
   $ integral_(C_D) \| w_j - m_(j \, D) \|^2 thin d mu_j & =
     frac(1, 2 mu_j \( C_D \)) integral.double_(C_D times C_D) \| w_j \( x \) -
     w_j \( y \) \|^2 thin d mu_j \( x \) d mu_j \( y \)\
 & lt.eq
   C_n q^(- 1) h integral.double_(C_D times C_D) frac(\| w_j \( x \) - w_j \( y \) \|^2, \| x - y \|^(n + 1)) thin
   d mu_j \( x \) d mu_j \( y \) . $ <eq:height-cell-variance>]
  All averages are defined for these sufficiently large indices, and their $L^2$ bounds follow from (4.27).
    The sets $C_D times C_D$ are disjoint subsets of $Omega_H times Omega_H$. Summing (4.32) yields
  #[#set math.equation(numbering: n => "(4.33)")
   $ integral_(Omega_H) \| w_j - P_k^j w_j \|^2 thin d mu_j lt.eq C_H h . $ <eq:height-partition-error>]
  There is no factor counting the cells in this estimate.
  For fixed $H \, k \, D \, a$, Cauchy–Schwarz and the positive limiting cell mass bound $m_(j \, D)^a$.
    A diagonal subsequence therefore makes all these averages converge simultaneously:
    the collection of indices is countable, including all $H \, k$ and the finite set of coordinates $a$.
    Write $m_D^a$ for their limits and $P_(H \, k)^a$ for the corresponding step function on the limiting plane box.
  At fixed levels $k \, l$, expand the squared difference of the two step functions.
    Convergence of the finitely many coefficients, cell masses, and intersection masses in (4.31) gives
  $ integral_(Omega_H) \| P_k^j w_j^a - P_l^j w_j^a \|^2 thin d mu_j arrow.r integral_(Omega_H) \| P_(H \, k)^a -
    P_(H \, l)^a \|^2 thin d nu . $
  The triangle inequality and (4.33) show that the last integral is at most $2 C_H \( h_k + h_l \)$.
    The step functions thus converge in $L^2 \( nu \|_(Omega_H) \)$ to some $v_H^a$.
  The reverse triangle inequality also gives
  $
    lr(|parallel w_j^a parallel_(L^2 \( mu_j \|_(Omega_H) \)) - parallel P_k^j w_j^a parallel_(L^2 \(
    mu_j \|_(Omega_H) \))|) lt.eq \( C_H h_k \)^(1 \/ 2) . $
  For fixed $k$, the step-function norm converges, since its square is the finite sum $sum_D \( m_(j \, D)^a \)^2
    mu_j \( C_D \)$. First let $j arrow.r oo$, then $k arrow.r oo$. This proves (4.29) with $v_H^a$ in place of $v^a$.
  For a continuous $psi$ on $overline(Omega)_H$, the signed testing error from replacing $w_j^a$ by $P_k^j
    w_j^a$ is at most
  $ \( C_H h_k \)^(1 \/ 2) parallel psi parallel_oo mu_j \( Omega_H \)^(1 \/ 2) . $
  For fixed $k$, weak convergence on the continuity cells gives $integral_(C_D) psi thin d mu_j arrow.r
    integral_(C_D) psi thin d nu$. Passing first in $j$, then in $k$, proves (4.28) for $v_H^a$.
  The local limits agree on overlaps. To see this without choosing new subsequences, let $U =
    Omega_H ∩ Omega_J$ and $eta \( x \) = min { 1 \, "dist" \( x \, U^c \) }$.
    This bounded Lipschitz function is positive exactly on $U$.
    For a compactly supported Lipschitz $psi$, use $eta psi$ in the two signed-moment limits.
    The source integrals are identical, since $eta psi$ vanishes outside the overlap. Their limits imply
  $ integral_U eta \( v_H^a - v_J^a \) psi thin d nu = 0 . $
  Compact Lipschitz tests are dense in $L^2 \( nu \|_U \)$, so $eta \( v_H^a - v_J^a \) = 0$ almost everywhere.
    Since $eta > 0$ on $U$, the local limits agree there. Choosing measurable representatives and, on the plane,
    using the first region containing a point now produces one measurable $v^a$ agreeing with every $v_H^a$ almost
    everywhere. Countability of the cover ensures this simultaneous agreement.
  It remains to prove the weighted squared-moment conclusion.
    Fix $H \, a$, and abbreviate $w_j = w_j^a$, $v = v^a$. There are bounded compactly supported ambient Lipschitz
    functions $g$ whose restrictions approximate $v$ in $L^2 \( nu \|_(Omega_H) \)$.
    For completeness, simple functions are dense in this space;
    regularity of finite plane volume approximates their sets by compact and open sets,
    and distance cutoffs approximate their indicators. Extend the resulting plane Lipschitz functions by $pi$,
    and multiply by a fixed ambient compact cutoff equal to one on $overline(Omega)_H$.
  For each such fixed $g$, the norm limit, the signed limit tested against $g$,
    and ordinary weak convergence tested against $g^2$ give
  #[#set math.equation(numbering: n => "(4.34)")
   $ lim_j integral_(Omega_H) \| w_j - g \|^2 thin d mu_j = integral_(Omega_H) \| v -
     g \|^2 thin d nu . $ <eq:height-continuous-approximation>]
  This identity involves $g$, an actual continuous function, on the moving supports. For any continuous weight $psi$,
  $ lr(|integral_(Omega_H) psi \( w_j^2 - g^2 \) thin d mu_j|) & lt.eq parallel psi parallel_oo parallel w_j -
    g parallel_(L^2 \( mu_j \|_(Omega_H) \))\
 & #h(8mm)  dot.op
   (parallel w_j parallel_(L^2 \( mu_j \|_(Omega_H) \)) + parallel g parallel_(L^2 \( mu_j \|_(Omega_H) \))) . $
  The last factor remains bounded for an $L^2$-approximating family $g$, after taking $j arrow.r
    oo$ for each fixed $g$. Ordinary weak convergence handles $psi g^2$.
    Equation (4.34) and Cauchy–Schwarz for the limiting measure then allow $g arrow.r
    v$ in $L^2 \( nu \|_(Omega_H) \)$. This proves (4.28) in the stated order of limits. ◻
]

The lemma may equivalently be read as three finite-measure convergences on each common compact closure:

#[#set math.equation(numbering: n => "(4.35)")
 $ mu_j \|_(Omega_H) med arrow.r med nu \|_(Omega_H) \, wide w_j^a mu_j \|_(Omega_H) med arrow.r med
   v^a nu \|_(Omega_H) \, wide \| w_j^a \|^2 mu_j \|_(Omega_H) med arrow.r
   med \| v^a \|^2 nu \|_(Omega_H) . $ <eq:height-three-measures>]

The middle measures are signed; their total variations are uniformly bounded by Cauchy–Schwarz.
  These statements do not require evaluating an arbitrary representative of $v^a$ against $mu_j$.
  Once the next section identifies $v^a$ with an affine function,
  the same polarization as in (4.34) will give a genuine squared-error limit for that fixed affine representative.

== 5 The renormalized height equation and affine rigidity <sec:fractional-rigidity>

The compactness lemma produces a single limiting height. We now pass the small Riesz pairing to that height,
  keeping the cancellation at infinity throughout the passage.
  The resulting equation is tested only against functions of integral zero.
  That class is sufficient to locate the Fourier transform at the origin and hence to prove that the height is
  affine. Interpreting a fractional operator modulo constants is natural for functions of polynomial growth;
  compare #cite(label("DipierroSavinValdinoci2019")). We prove the measurable weak formulation needed here
  directly, rather than importing a regularity or equivalence statement from a different formulation.

=== 5.1 A fixed normalization for the height pairing <a-fixed-normalization-for-the-height-pairing>

Write $k \( z \) = \| z \|^(- n - 1)$ for $z eq.not 0$. Let $rho$ be a measure with upper $n$-growth,
  and let $w$ be a measurable function with finite local $L^2 \( rho \)$ norm and finite local energy

$ integral.double_(B \( 0 \, T \)^2) \| w \( x \) - w \( y \) \|^2 k \( x - y \) thin d rho \( x \) d
  rho \( y \) < oo wide \( T > 0 \) . $

Suppose also that

#[#set math.equation(numbering: n => "(5.1)")
 $ integral_(\| y \| > T) \| w \( y \) \| thin \| y \|^(- n - 2) thin d rho \( y \) < oo wide \( T > 0 \) .
   $ <eq:height-weighted-tail>]

For a compactly supported Lipschitz function $phi.alt$, choose a bounded measurable set $A$ containing a ball
  $B \( 0 \, R \)$, with $"supp" phi.alt subset B \( 0 \, H \)$ and $2 H < R$. Define

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(B)_(rho \, A) \( w \, phi.alt \) =  & 1 /
   2 integral.double_(A times A) \( w \( x \) - w \( y \) \) \( phi.alt \( x \) - phi.alt \( y \) \) k \( x - y \)
   thin d rho \( x \) d rho \( y \)\
 & + integral.double_(A times A^c) phi.alt \( x \) #scale(x: 120%, y: 120%)[\[] w \( x \) k \( x - y \) -
   w \( y \) { k \( x - y \) - k \( - y \) } #scale(x: 120%, y: 120%)[\]] thin d rho \( x \) d rho \( y \) .
   $ <eq:normalized-height-pairing>]

This expression is defined even when $integral phi.alt thin d rho eq.not 0$.
  The set $A$ and the subtraction point $0$ are part of its normalization.

Both integrals in (5.2) are absolutely convergent. For the interior integral, Cauchy–Schwarz, the Lipschitz bound,
  and upper growth give, for every $h > 0$,

#[#set math.equation(numbering: n => "(5.3)")
 $ & integral.double_(x \, y in A\
\| x - y \| lt.eq h) \| w \( x \) - w \( y \) \| thin \| phi.alt \( x \) -
  phi.alt \( y \) \| k \( x - y \) thin d rho \( x \) d rho \( y \)\
 & #h(15mm)  lt.eq
   C thin "Lip" \( phi.alt \)
   (integral.double_(A^2) \| w \( x \) - w \( y \) \|^2 k \( x - y \) thin d rho \( x \) d rho \( y \))^(1 \/ 2)
   rho \( A \)^(1 \/ 2) h^(1 \/ 2) . $ <eq:height-diagonal-estimate>]

Indeed, the square of the remaining factor is bounded by

$ "Lip" \( phi.alt \)^2 integral.double_(A^2 ∩ { \| x - y \| lt.eq h }) \| x -
  y \|^(1 - n) thin d rho \( x \) d rho \( y \) lt.eq C "Lip" \( phi.alt \)^2 rho \( A \) h . $

The part separated from the diagonal follows from local $L^1$ integrability.
  For $x in "supp" phi.alt$ and $\| y \| gt.eq R$, the mean value theorem gives

#[#set math.equation(numbering: n => "(5.4)")
 $ k \( x - y \) lt.eq C \| y \|^(- n - 1) \, wide \| k \( x - y \) - k \( - y \) \| lt.eq
   C H \| y \|^(- n - 2) . $ <eq:height-kernel-tail>]

The first term is integrable by upper growth and $phi.alt w in L^1 \( rho \)$; the second uses (5.1).

When $integral phi.alt thin d rho = 0$, the value in (5.2) is independent of the sufficiently large localization
  $A$. To see this without subtracting two divergent integrals,
  restrict $rho$ first to a common finite outer ball. Symmetry splits the half double integral into its $A^2$ part
  and the cross term. The added center term integrates to

$ (integral phi.alt thin d rho) (integral_(A^c) w \( y \) k \( - y \) thin d rho \( y \)) = 0 $

in that finite restriction. For two choices of $A$, both expressions therefore equal the same finite double
  integral. Now increase the outer ball; (5.4) and (5.1) permit dominated convergence of each renormalized
  exterior term. This proves the asserted independence.

There is also an exact connection with the vector pairing of Lemma 5. Suppose

#[#set math.equation(numbering: n => "(5.5)")
 $ u \( x \) - u \( y \) = e dot.op \( x - y \) \, wide w = u \/ delta \, wide delta > 0 . $ <eq:affine-source-height>]

Then for a compact Lipschitz test of $rho$-mean zero,

#[#set math.equation(numbering: n => "(5.6)")
 $ cal(B)_(rho \, A) \( w \, phi.alt \) = delta^(- 1) e dot.op cal(R)_rho \( phi.alt \) .
   $ <eq:height-riesz-identification>]

The interior identity follows directly from (5.5). In the exterior, subtraction of $e dot.op K_n \( - y \)$ produces

$ delta^(- 1) #scale(x: 120%, y: 120%)[\[] u \( x \) k \( x - y \) - u \( y \) { k \( x - y \) - k \( - y \) } -
  u \( 0 \) k \( - y \) #scale(x: 120%, y: 120%)[\]] . $

The last term integrates to zero against $phi.alt$. Its exterior kernel is integrable by upper growth and
  separation from $0$, so this cancellation is legitimate. The identity imposes no bound on $w \( 0 \)$.

=== 5.2 Passing to the same limiting height <passing-to-the-same-limiting-height>

#thm([Proposition 5.1.])[
  (The limiting height equation).  #emph[Assume the hypotheses and conclusions of Lemmas 18 and 19 for a scalar
    height. We retain their notation and record the conditions used below.
    Let $mu_j$ converge on compact tests to $nu = q cal(H)^n \|_L$,
    where $q > 0$ and $L$ is an $n$-plane through $0$. Here $cal(H)^n \|_L$ has Euclidean normalization,
    equal to Lebesgue measure in orthonormal coordinates on $L$.
    Let $u_j$ satisfy (5.5) with $\| e_j \| lt.eq 1$, let $w_j = u_j \/ delta_j$,
    and let $v$ be the common limit given by Lemma 19. Suppose $delta_j > 0$, $delta_j arrow.r 0$, $K_j arrow.r
    oo$, and, for some fixed $0 < gamma < 1$ and $M < oo$,
#[#set math.equation(numbering: n => "(5.7)")
 $ integral_(B \( 0 \, 2^k \)) \| u_j \|^2 thin d mu_j lt.eq
   M delta_j^2 thin 2^(k \( n + 2 + 2 gamma \)) quad \( 0 lt.eq k lt.eq K_j \) \, wide
   delta_j^(- 1) 2^(- K_j) arrow.r 0 . $ <eq:height-source-moment>]

 Assume that there are radii $A_j arrow.r oo$ such that, for every $j$ and every compact Lipschitz test $xi$
   supported in $B \( 0 \, A_j \)$ with $integral xi thin d mu_j = 0$,
#[#set math.equation(numbering: n => "(5.8)")
 $ \| cal(R)_(mu_j) \( xi \) \| lt.eq C \( "Lip" xi + 1 \) delta_j^3 . $ <eq:height-source-oscillation>]

 The constant here is independent of $j$ and of the test.]
  #emph[Then $v$ has finite local fractional energy and satisfies
#[#set math.equation(numbering: n => "(5.9)")
 $ integral_L \| v \( x \) \| \( 1 + \| x \| \)^(- n - 2) thin d cal(H)^n \( x \) < oo . $ <eq:limit-height-weight>]

 After identifying $L$ isometrically with $bb(R)^n$, for every compactly supported smooth complex function $g$
   with $integral_(bb(R)^n) g = 0$,
#[#set math.equation(numbering: n => "(5.10)")
 $ integral_(bb(R)^n) v \( x \) cal(L) g \( x \) thin d x = 0 \, wide cal(L) g \( x \) = 1 /
   2 integral_(bb(R)^n) frac(2 g \( x \) - g \( x + h \) - g \( x - h \), \| h \|^(n + 1)) thin d h .
   $ <eq:limit-fractional-equation>]

 The integral on the left is absolutely convergent. The same conclusions hold simultaneously for the finite family
   of normal heights in Lemma 19, without further extraction.]
] <prop:height-equation>

#proof[
  We retain the subsequence already selected in Lemma 19. In the proof below every bounded region and every test
    is chosen after this subsequence and its height $v$.
  #emph[Local energy and singular pairings.] Let $Omega$ be one of the bounded continuity regions used in that
    lemma. On its common compact closure, the three measures
  $ mu_j \|_Omega \, wide w_j mu_j \|_Omega \, wide w_j^2 mu_j \|_Omega $
  converge against continuous functions to the corresponding measures $nu \|_Omega$, $v nu \|_Omega$,
    and $v^2 nu \|_Omega$. Their total variations are uniformly bounded.
    Finite sums of products of continuous functions approximate a continuous function on the product of this
    compact set uniformly. Thus, after replacing $k \( x - y \)$ by $\( max \( h \, \| x - y \| \) \)^(- n - 1)$,
    both the quadratic energy and every bilinear pairing against a fixed bounded Lipschitz test converge.
    For the energy, expand $\( w_j \( x \) - w_j \( y \) \)^2$;
    its three terms use exactly the three measures above. Monotone convergence as $h arrow.b
    0$ shows that the limiting energy is no larger than the common bound from Lemma 18.
    Positive-dimensional upper growth makes the diagonal null.
  Estimate (5.3) applies uniformly to the source and limiting heights on $Omega$.
    The error caused by capping the bilinear kernel is bounded by its absolute integral on $\| x - y \| lt.eq h$.
    Consequently
  #[#set math.equation(numbering: n => "(5.11)")
   $ & integral.double_(Omega^2) \( w_j \( x \) - w_j \( y \) \) \( phi.alt \( x \) - phi.alt \( y \) \)
     k \( x - y \) thin d mu_j \( x \) d mu_j \( y \)\
 & wide arrow.r integral.double_(Omega^2) \( v \( x \) - v \( y \) \) \( phi.alt \( x \) - phi.alt \( y \) \)
   k \( x - y \) thin d nu \( x \) d nu \( y \) . $ <eq:height-local-bilinear-limit>]
  This argument first fixes $h$, then takes $j arrow.r oo$, and finally takes $h arrow.b 0$.
  #emph[Inherited moments and the two exterior errors.] The weak convergence of $w_j^2
    mu_j$ on an enclosing continuity region, tested with nonnegative cutoffs,
    passes (5.7) to the limit at every fixed scale. Changing the radius by at most a factor two gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ integral_(L ∩ B \( 0 \, t \)) \| v \|^2 thin d nu lt.eq
     C t^(n + 2 + 2 gamma) wide \( t gt.eq 1 \) . $ <eq:limiting-height-moments>]
  Each fixed radius eventually lies below $2^(K_j)$; no estimate past that horizon for a fixed sample has been
    used. Cauchy–Schwarz on dyadic shells, followed by summation of $2^(k \( gamma - 1 \))$, now gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ integral_(L ∩ { \| y \| > T }) \| v \( y \) \| thin \| y \|^(- n - 2) thin d nu \( y \) lt.eq
     C T^(gamma - 1) wide \( T gt.eq 2 \) . $ <eq:limiting-height-tail-bound>]
  Together with local $L^2$ integrability and $q > 0$, this proves (5.9).
  Fix $H$ containing the supports of the tests to be considered.
    Their uniform supremum bounds and the local second-moment bound imply uniform bounds on $integral \|
    phi.alt \| thin d mu_j$ and $integral \| phi.alt w_j \| thin d mu_j$.
    For $2 H < T lt.eq 2^(K_j)$, the same shell calculation using (5.7) controls the renormalized exterior
    integral outside $B \( 0 \, T \)$ by
  #[#set math.equation(numbering: n => "(5.14)")
   $ C_phi.alt #scale(x: 120%, y: 120%)[\(] T^(- 1) + T^(gamma - 1) +
     delta_j^(- 1) 2^(- K_j) #scale(x: 120%, y: 120%)[\)] . $ <eq:two-height-tail-errors>]
  Here is the bound beyond the last controlled radius. The affine functions $u_j$ are $1$-Lipschitz.
    The mass of $B \( 0 \, 1 \)$ is bounded below eventually, by convergence to the plane measure,
    so (5.7) implies $\| u_j \( 0 \) \| lt.eq 1 + C delta_j$. Hence $\| u_j \( y \) \| lt.eq C + \| y \|$.
    Upper growth gives
  $ integral_(\| y \| gt.eq 2^(K_j)) \| w_j \( y \) \| \| y \|^(- n - 2) thin d mu_j \( y \) lt.eq
    C delta_j^(- 1) 2^(- K_j) . $
  This bound uses the unnormalized height at $0$; the normalized value $w_j \( 0 \)$ may diverge.
    The $T^(- 1)$ term in (5.14) comes from the $w_j \( x \) k \( x - y \)$ term,
    whose $x$-integral stays on the fixed test support. The kernel difference in (5.4) gives the remaining terms.
    Thus the order is to choose $T$ large and then choose $j$ large.
    The analogous limiting tail tends to zero by (5.13).
  #emph[A common normalization and mean correction.] Take two fixed compact ambient Lipschitz functions
    $phi.alt \, eta$ such that
  $ integral phi.alt thin d nu = 0 \, wide integral eta thin d nu eq.not 0 . $
  Choose one continuity region $A$ containing $B \( 0 \, R \)$ with a positive margin beyond both supports.
    For each of these tests separately,
  #[#set math.equation(numbering: n => "(5.15)")
   $ cal(B)_(mu_j \, A) \( w_j \, phi.alt \) arrow.r cal(B)_(nu \, A) \( v \, phi.alt \) \, wide
     cal(B)_(mu_j \, A) \( w_j \, eta \) arrow.r cal(B)_(nu \, A) \( v \, eta \) .
     $ <eq:fixed-normalization-convergence>]
  For the interior terms this is (5.11). For the exterior terms first restrict $y$ to a larger fixed continuity
    region $B$. The kernels are separated from their singularities on the nonzero test support.
    To justify the restrictions, let $F_h$ be the closed $h$-neighborhood of $partial A union partial B$,
    for small $h > 0$, and choose one bounded continuity region containing all these collars.
    The local second-moment bound, Cauchy–Schwarz, and Portmanteau give
  $ limsup_(j arrow.r oo) integral_(F_h) \| w_j \| thin d mu_j lt.eq
    C #scale(x: 120%, y: 120%)[\(] limsup_(j arrow.r oo) mu_j \( F_h \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)
    lt.eq C nu \( F_h \)^(1 \/ 2) arrow.r 0 wide \( h arrow.b 0 \) . $
  The final limit uses the $nu$-nullity of both boundaries; the same conclusion holds for ordinary mass.
    Thus continuous cutoffs approximate both restrictions, with product errors controlled by these collar masses
    and the other factor’s bounded total variation. Convergence of $mu_j$ and $w_j mu_j$,
    followed by uniform approximation of the continuous kernels by finite sums of product functions,
    now gives the exterior limit on $B$. Finally, (5.14) and (5.13) remove the outer restriction.
    Both convergences in (5.15) concern the normalization (5.2); no Riesz pairing is assigned to a test of nonzero mean.
  Set
  $ c_j = frac(integral phi.alt thin d mu_j, integral eta thin d mu_j) \, wide xi_j = phi.alt - c_j eta . $
  The denominator is nonzero eventually, and compact-test convergence gives $c_j arrow.r 0$.
    Eventually $\| c_j \| lt.eq 1$, so $xi_j$ has a common compact support, a uniform Lipschitz bound,
    and zero mean against the whole $mu_j$. By linearity with the same $A$ and the same subtraction point,
  $ cal(B)_(mu_j \, A) \( w_j \, xi_j \) = cal(B)_(mu_j \, A) \( w_j \, phi.alt \) -
    c_j cal(B)_(mu_j \, A) \( w_j \, eta \) arrow.r cal(B)_(nu \, A) \( v \, phi.alt \) . $
  The bump pairing on the right is already normalized and converges;
    the only required fact about its coefficient is $c_j arrow.r 0$.
    On the other hand, (5.6) and (5.8) give $\| cal(B)_(mu_j \, A) \( w_j \, xi_j \) \| lt.eq
    C_(phi.alt \, eta) delta_j^2 arrow.r 0$. We conclude that
  #[#set math.equation(numbering: n => "(5.16)")
   $ cal(B)_(nu \, A) \( v \, phi.alt \) = 0 wide (integral phi.alt thin d nu = 0) .
     $ <eq:compact-renormalized-height-equation>]
  #emph[Intrinsic tests and the fractional operator.] Let $U : bb(R)^n arrow.r L$ be a linear isometry.
    For a compactly supported intrinsic Lipschitz function $g$,
    choose an ambient radial cutoff $chi$ equal to one on a ball containing $U \( "supp" g \)$,
    and put $phi.alt \( x \) = chi \( x \) g \( U^(*) x \)$. This is a compact ambient Lipschitz test and
    $phi.alt \( U t \) = g \( t \)$ for every $t$. Its plane integral is $q integral g$.
    A nonnegative compact radial bump positive at $0$ supplies the required $eta$.
    Pulling (5.16) back by $U$ and canceling the positive factor $q^2$ therefore gives the same renormalized
    equation for $v \( U t \)$ against every compact intrinsic mean-zero test.
    Localization independence allows us to take $A = B \( 0 \, R \)$ in the intrinsic plane.
    We henceforth write this intrinsic height simply as $v$.
  For completeness, we identify this equation with (5.10). Let $g$ be compactly supported,
    smooth and of integral zero, first real-valued, with support in $B \( 0 \, H \)$; choose $R > 2 H$.
    For $epsilon > 0$, define $cal(L)_epsilon$ by restricting the $h$-integral in (5.10) to $\| h \| gt.eq
    epsilon$. Reflection and translation give the absolutely convergent single-increment formula
  $ cal(L)_epsilon g \( x \) = integral_(\| x - y \| gt.eq epsilon) \( g \( x \) - g \( y \) \) k \( x - y \) thin
    d y . $
  When $epsilon < R - H$, symmetrization on $B \( 0 \, R \)^2$ yields
  $ integral v cal(L)_epsilon g =  & 1 /
    2
    integral.double_(B \( 0 \, R \)^2 ∩ { \| x - y \| gt.eq epsilon }) \( v \( x \) - v \( y \) \) \( g \( x \) -
    g \( y \) \) k \( x - y \) thin d x thin d y\
 & + integral.double_(B \( 0 \, R \) times B \( 0 \, R \)^c)
   g \( x \) \[ v \( x \) k \( x - y \) - v \( y \) { k \( x - y \) - k \( - y \) } \] thin d x thin d y . $
  To justify the exterior equality, integrate the test variable first:
    $integral g = 0$ permits the subtraction of $k \( - y \)$, after which (5.4) makes the product integrable.
    The direct term involving $v \( x \)$ is separately integrable.
    This proves the displayed identity without applying Fubini to the uncancelled exterior height term.
  The interior limit as $epsilon arrow.b 0$ follows from (5.3).
    On bounded $x$, the second difference of $g$ is bounded by $C \| h \|^2$ near $h = 0$,
    giving an $epsilon$-independent bound for $cal(L)_epsilon g$.
    Outside a fixed ball containing the support, the cutoff is irrelevant and $integral g =
    0$ gives $\| cal(L)_epsilon g \( x \) \| lt.eq C_g \( 1 + \| x \| \)^(- n - 2)$ for $0 < epsilon lt.eq 1$.
    Dominated convergence using (5.9) therefore applies also to the left-hand side.
    The resulting identity is $integral v cal(L) g = cal(B)_(d x \, B \( 0 \, R \)) \( v \, g \) = 0$.
    Real and imaginary parts give the complex statement. All steps use the same $v$ and the same preselected
    subsequence, so they apply to every coordinate in a finite normal frame simultaneously. ◻
]

=== 5.3 Affine rigidity under the weighted tail bound <affine-rigidity-under-the-weighted-tail-bound>

We now prove the analytic rigidity statement needed for the limiting heights.
  Its tail hypothesis allows linear growth. Write $cal(S) \( bb(R)^n \)$ for the complex Schwartz space,
  with its usual seminorms given by weighted suprema of derivatives.
  On general Schwartz tests, the same operator is given by

#[#set math.equation(numbering: n => "(5.17)")
 $ cal(L) g \( x \) = - 1 /
   2 integral_(bb(R)^n) frac(g \( x + h \) + g \( x - h \) - 2 g \( x \), \| h \|^(n + 1)) thin d h .
   $ <eq:rigidity-fractional-operator>]

The integral is absolutely convergent: the second difference is $O \( \| h \|^2 \)$ near zero and is bounded for
  large $h$. The value assigned to the integrand at $h = 0$ has no effect.

#thm([Lemma 5.2.])[
  (Weighted affine rigidity).  #emph[Let $n gt.eq 1$, and let $v : bb(R)^n arrow.r bb(R)$ be measurable with
#[#set math.equation(numbering: n => "(5.18)")
 $ integral_(bb(R)^n) \| v \( x \) \| \( 1 + \| x \| \)^(- n - 2) thin d x < oo . $ <eq:rigidity-weighted-tail>]

 Suppose that, for every $g in C_c^oo \( bb(R)^n \; bb(C) \)$ with $integral g = 0$,
#[#set math.equation(numbering: n => "(5.19)")
 $ integral_(bb(R)^n) v \( x \) cal(L) g \( x \) thin d x = 0 . $ <eq:rigidity-compact-equation>]

 Then there are $b in bb(R)$ and a real linear functional $ell : bb(R)^n arrow.r bb(R)$ such that $v \( x \) = b +
   ell \( x \)$ almost everywhere. If $v$ is also essentially bounded, then $ell = 0$.]
] <lem:fractional-rigidity>

#proof[
  We first justify the extension of the test class in (5.19).
    We will then compute the positive Fourier multiplier away from zero, deduce that the height is a polynomial,
    and use the weighted tail bound to exclude degrees at least two. For a Schwartz function $g$ put
  $ p \( g \) = sup_(y in bb(R)^n) \( 1 + \| y \| \)^(n + 3) #scale(x: 120%, y: 120%)[\(] \| g \( y \) \| +
    parallel D^2 g \( y \) parallel #scale(x: 120%, y: 120%)[\)] \, wide M_1 \( g \) =
    integral_(bb(R)^n) \| y \| thin \| g \( y \) \| thin d y . $
  Here $D^2 g$ is the second real derivative, with its operator norm.
    The quantity $p$ is a continuous Schwartz seminorm, and $M_1 \( g \) lt.eq C_n p \( g \)$,
    since $integral \| y \| \( 1 + \| y \| \)^(- n - 3) thin d y < oo$. We claim that
  #[#set math.equation(numbering: n => "(5.20)")
   $ \| cal(L) g \( x \) \| lt.eq C_n p \( g \) \( 1 + \| x \| \)^(- n - 2) wide upright("if ") integral g =
     0 . $ <eq:rigidity-schwartz-decay>]
  Splitting the increment integral at radius one gives $\| cal(L) g \( x \) \| lt.eq C_n p \( g \)$ for every $x$.
    For the spatial decay take $r = \| x \| gt.eq 2$ and $R = r \/ 2$.
    If $\| h \| < R$, the segments from $x$ to $x plus.minus h$ stay outside $B \( 0 \, r \/ 2 \)$.
    Taylor’s formula therefore bounds the near part of (5.17) in absolute value by
  $ C_n p \( g \) r^(- n - 3) integral_(\| h \| < R) \| h \|^(1 - n) thin d h lt.eq C_n p \( g \) r^(- n - 2) . $
  For the far part let $E_x = { y : \| x - y \| gt.eq R }$ and $k \( z \) = \| z \|^(- n - 1)$.
    Translation and reflection give exactly
  $ g \( x \) integral_(\| h \| gt.eq R) k \( h \) thin d h - integral_(E_x) k \( x - y \) g \( y \) thin d y . $
  These integrals are separately absolutely convergent. The first term is bounded by $C_n \| g \( x \) \| \/ r$.
    Using the mean-zero condition in the second term gives the identity
  #[#set math.equation(numbering: n => "(5.21)")
   $ integral_(E_x) k \( x - y \) g \( y \) thin d y = integral_(E_x) #scale(x: 120%, y: 120%)[\(] k \( x - y \) -
     k \( x \) #scale(x: 120%, y: 120%)[\)] g \( y \) thin d y -
     k \( x \) integral_(E_x^c) g \( y \) thin d y . $ <eq:rigidity-far-correction>]
  On $\| y \| lt.eq r \/ 2$, the mean value theorem gives
  $ \| k \( x - y \) - k \( x \) \| lt.eq C_n \| y \| r^(- n - 2) . $
  On $E_x ∩ { \| y \| > r \/ 2 }$, the kernel difference is bounded by $C_n r^(- n - 1)$, whereas
  $ integral_(\| y \| > r \/ 2) \| g \( y \) \| thin d y lt.eq 2 / r M_1 \( g \) . $
  Finally $E_x^c subset { \| y \| > r \/ 2 }$, so the last term in (5.21) has the same bound $C_n r^(- n - 2)
    M_1 \( g \)$. This includes the correction for the omitted ball around $x$. The near and far estimates prove (5.20).
  It follows from (5.18) and (5.20) that $v cal(L) g$ is integrable for every mean-zero Schwartz function, and
  #[#set math.equation(numbering: n => "(5.22)")
   $ lr(|integral v cal(L) g|) lt.eq C_n p \( g \) integral \| v \( x \) \| \( 1 + \| x \| \)^(- n - 2) thin d x .
     $ <eq:rigidity-pairing-continuity>]
  Choose $chi \, rho in C_c^oo \( bb(R)^n \)$ with $chi = 1$ near zero and $integral rho = 1$.
    For a mean-zero Schwartz function $g$ set
  $ g_j \( x \) = chi \( x \/ j \) g \( x \) - (integral chi \( y \/ j \) g \( y \) thin d y) rho \( x \) . $
  Each $g_j$ is compactly supported and has mean zero. The product rule and rapid decrease show
    $chi \( dot.op \/ j \) g arrow.r g$ in every Schwartz seminorm;
    also $integral chi \( y \/ j \) g \( y \) thin d y arrow.r integral g = 0$.
    Thus $g_j arrow.r g$ in Schwartz space. Applying (5.22) to $g_j -
    g$ extends (5.19) to every mean-zero $g in cal(S) \( bb(R)^n \)$.
  We next compute the Fourier multiplier needed for localization away from zero. Use the convention
  $ hat(g) \( xi \) = integral_(bb(R)^n) e^(- 2 pi i x dot.op xi) g \( x \) thin d x \, wide
    cal(F)^(- 1) g \( x \) = integral_(bb(R)^n) e^(2 pi i x dot.op xi) g \( xi \) thin d xi . $
  Define
  $ a_n \( xi \) = integral_(bb(R)^n) frac(1 - cos \( 2 pi xi dot.op h \), \| h \|^(n + 1)) thin d h . $
  This is an absolutely convergent nonnegative integral: quadratic cancellation controls the origin,
    and boundedness of $1 - cos$ controls infinity. If $xi eq.not 0$, the numerator equals $2$ at $h =
    xi \/ \( 2 \| xi \|^2 \)$ and is positive on a neighborhood of that point. Consequently $a_n \( xi \) > 0$.
    Orthogonal changes of variables show that $a_n$ is radial, and the substitution $u =
    t h$ gives $a_n \( t xi \) = t a_n \( xi \)$ for $t > 0$. Hence
  #[#set math.equation(numbering: n => "(5.23)")
   $ a_n \( xi \) = c_n \| xi \| \, wide c_n = a_n \( e_1 \) > 0 . $ <eq:rigidity-positive-symbol>]
  For $g in cal(S) \( bb(R)^n \)$ the full absolute integral required to interchange frequency and increments is finite:
  $ integral_(bb(R)^n) integral_(bb(R)^n) frac(1 - cos \( 2 pi xi dot.op h \), \| h \|^(n + 1)) \| g \( xi \) \|
    thin d h thin d xi = c_n integral_(bb(R)^n) \| xi \| thin \| g \( xi \) \| thin d xi < oo . $
  Fubini’s theorem and the second difference of the exponential therefore give, pointwise in $x$,
  #[#set math.equation(numbering: n => "(5.24)")
   $ cal(L) \( cal(F)^(- 1) g \) \( x \) = c_n integral_(bb(R)^n) e^(2 pi i x dot.op xi) \| xi \| g \( xi \) thin
     d xi . $ <eq:rigidity-fourier-multiplier>]
  The factor $- 2$ in that second difference cancels the factor $- 1 \/ 2$ in (5.17).
  The weighted hypothesis implies $v in L_(upright("loc"))^1$ and defines a tempered distribution
  $ T_v \( g \) = integral_(bb(R)^n) v \( x \) g \( x \) thin d x . $
  Indeed this integral is bounded by $sup_x \( 1 + \| x \| \)^(n + 2) \|
    g \( x \) \|$ times the integral in (5.18). All distributional pairings here are complex bilinear,
    without complex conjugation. Let $S = cal(F)^(- 1) T_v$, so $S \( g \) = T_v \( cal(F)^(- 1) g \)$.
    Take $psi in C_c^oo \( bb(R)^n \\ { 0 } \)$. The function $q \( xi \) = psi \( xi \) \/ \| xi \|$,
    extended by zero near the origin, is smooth and compactly supported.
    Its inverse Fourier transform is Schwartz and has integral $q \( 0 \) = 0$.
    The extended weak equation and (5.24) give
  $ 0 = T_v #scale(x: 120%, y: 120%)[\(] cal(L) \( cal(F)^(- 1) q \) #scale(x: 120%, y: 120%)[\)] =
    c_n T_v \( cal(F)^(- 1) psi \) = c_n S \( psi \) . $
  Thus $S$ is supported at the origin.
  For completeness we prove the point-support consequence; compare #cite(label("Hormander2003")) Theorem 2.3.4.
    Continuity of $S$ on Schwartz space supplies $N in bb(N)$ and $C < oo$ such that
  #[#set math.equation(numbering: n => "(5.25)")
   $ \| S \( g \) \| lt.eq C sum_(\| alpha \| lt.eq N) sup_x \( 1 + \| x \| \)^N \| partial^alpha g \( x \) \| .
     $ <eq:rigidity-finite-order>]
  A Schwartz function vanishing near zero is annihilated by $S$:
    multiply it by expanding compact cutoffs, use the support property, and pass to the Schwartz limit.
    Consequently $S$ has the same value on two Schwartz functions agreeing near zero.
  Suppose now that $partial^alpha g \( 0 \) = 0$ for every $\| alpha \| lt.eq N$.
    Choose $eta in C_c^oo \( B \( 0 \, 2 \) \)$ equal to one near zero and put $eta_epsilon \( x \) =
    eta \( x \/ epsilon \)$. For $0 < epsilon < 1 \/ 2$, Taylor’s formula and the product rule give
  $ sup_x \( 1 + \| x \| \)^N \| partial^alpha \( eta_epsilon g \) \( x \) \| lt.eq
    C_g epsilon^(N + 1 - \| alpha \|) lt.eq C_g epsilon wide \( \| alpha \| lt.eq N \) . $
  To see the power, a derivative of order $j$ falling on the cutoff costs $epsilon^(- j)$,
    while the remaining derivative of $g$, of order $\| alpha \| - j$,
    is $O \( epsilon^(N + 1 - \| alpha \| + j) \)$ on its support.
    Since $S \( g \) = S \( eta_epsilon g \)$, letting $epsilon arrow.b 0$ in (5.25) proves $S \( g \) = 0$.
  It follows that $S$ depends only on the derivatives through order $N$ at zero.
    More explicitly, subtract from $g$ the function
  $ eta \( x \) sum_(\| alpha \| lt.eq N) frac(partial^alpha g \( 0 \), alpha !) x^alpha . $
  The remainder has vanishing jet through order $N$ at zero,
    and therefore there are constants $c_alpha in bb(C)$ such that
  $ S \( g \) = sum_(\| alpha \| lt.eq N) c_alpha partial^alpha g \( 0 \) . $
  Using $T_v \( g \) = S \( hat(g) \)$ and differentiating the Fourier integral of a Schwartz function at zero gives
  $ T_v \( g \) = integral_(bb(R)^n) P \( x \) g \( x \) thin d x \, wide P \( x \) =
    sum_(\| alpha \| lt.eq N) c_alpha \( - 2 pi i x \)^alpha . $
  Every polynomially weighted Schwartz function is integrable,
    so the finite sum and these integrals may be interchanged.
    Since $v$ is locally integrable, equality on compact smooth tests implies $v = P$ almost everywhere.
  Finally, (5.18) implies
  $ integral_(\| x \| gt.eq 1) \| P \( x \) \| thin \| x \|^(- n - 2) thin d x < oo . $
  If $P$ had degree $k gt.eq 2$, its nonzero leading homogeneous part would have absolute value bounded below on a
    nonempty open subset of the unit sphere. On the corresponding cone and for all sufficiently large $r$,
    $\| P \( r theta \) \| gt.eq c r^k$. The last integral would then dominate a positive constant times
  $ integral_(R_0)^oo r^(k - 3) thin d r \, $
  which diverges for $k gt.eq 2$. (For $n = 1$, one uses either of the two rays.) Hence $P$ has degree at most
    one. Taking real parts gives $v = b + ell$ almost everywhere.
    If $\| v \| lt.eq M$ almost everywhere, continuity gives $\| b + ell \( x \) \| lt.eq M$ for every $x$,
    since any open set violating this bound would have positive measure. Evaluating along rays shows $ell = 0$. ◻
]

The same conclusion holds if the compact weak equation is initially known only for real mean-zero tests:
  apply it separately to the real and imaginary parts, using the absolute integrability proved above.

== 6 Relative excess improvement at every scale <sec:excess-propagation>

The preceding section identifies the limiting normal heights as affine functions.
  We now turn that information into approximating planes. Two details matter:
  the heights are integrated against changing measures, and their normal coordinates belong to changing orthogonal
  frames. Polarization first gives strong convergence to fixed affine representatives.
  An explicit graph construction then gives planes with vanishing normalized excess.
  A contradiction argument makes this conclusion uniform in the measure, center, and scale.

Throughout this section, fix integers $1 lt.eq n < d$ and constants $c \, G > 0$ and $D_0 gt.eq 0$.
  We consider Radon measures $sigma$ satisfying

#[#set math.equation(numbering: n => "(6.1)")
 $ sigma \( B \( x \, s \) \) & lt.eq G s^n &  & \( x in bb(R)^d \, med s > 0 \) \,\
sigma \( B \( x \, s \) \) & gt.eq c s^n &  & \( x in "supp" sigma \, med 0 < s lt.eq "diam" \( "supp" sigma \) \) \,\
parallel R_(sigma \, eta) f parallel_(L^2 \( sigma \)) & lt.eq
  D_0 parallel f parallel_(L^2 \( sigma \)) &  & \( eta > 0 \, med f in L^2 \( sigma \) \) . $ <eq:prop-upper>]

The last condition includes existence of the indicated $L^2$ output.
  All truncations and pairings are those defined in Section 1.
  The lower bound in (6.1) is required only at admissible radii; the upper bound in (6.1) holds at every radius.

=== 6.1 Polarization under changing measures <polarization-under-changing-measures>

The first lemma records exactly how the moment convergence from Lemma 19 becomes strong convergence.
  It uses an actual Lipschitz function as its target.

#thm([Lemma 6.1.])[
  (Polarization on a bounded region).  #emph[Let $mu_j$ and $nu$ be finite measures on $bb(R)^d$,
    all concentrated on one bounded set, and suppose that $mu_j$ converges weakly to $nu$.
    Let $w_j in L^2 \( mu_j \)$ and $f in L^2 \( nu \)$. Suppose that
#[#set math.equation(numbering: n => "(6.2)")
 $ integral w_j^2 thin d mu_j arrow.r integral f^2 thin d nu $ <eq:polarization-norm>]

 and, for every compactly supported Lipschitz function $psi$,
#[#set math.equation(numbering: n => "(6.3)")
 $ integral w_j psi thin d mu_j arrow.r integral f psi thin d nu . $ <eq:polarization-moment>]

 If $v : bb(R)^d arrow.r bb(R)$ is globally Lipschitz and $f = v$ almost everywhere for $nu$, then
$ integral \| w_j - v \|^2 thin d mu_j arrow.r 0 . $

]
] <lem:affine-polarization>

#proof[
  Choose a compactly supported Lipschitz cutoff equal to one on a ball containing the common bounded set.
    Its product with $v$ is a compactly supported Lipschitz function $tilde(v)$ agreeing with $v$ on that set.
    Equation (6.3), with $psi = tilde(v)$, gives
  $ integral w_j v thin d mu_j arrow.r integral f v thin d nu = integral f^2 thin d nu . $
  Weak convergence tested against the bounded continuous function $tilde(v)^2$ gives
  $ integral v^2 thin d mu_j arrow.r integral v^2 thin d nu = integral f^2 thin d nu . $
  The restrictions of $v$ belong to the respective $L^2$ spaces because they are bounded on the common set.
    Thus all terms in the identity
  $ integral \| w_j - v \|^2 thin d mu_j = integral w_j^2 thin d mu_j - 2 integral w_j v thin d mu_j +
    integral v^2 thin d mu_j $
  are integrable. Their limits prove the assertion. ◻
]

Let $L : bb(R)^n arrow.r bb(R)^d$ be the isometry onto the limiting plane.
  Use the regions $Omega_m$ of (4.24), with coordinate map $L^(*)$. Each fixed ball lies in some $Omega_m$.
  Lemma 19 supplies weak convergence of the finite restrictions and convergence of their signed and squared moments.

An intrinsic affine function $t mapsto b + M t$ on $L \( bb(R)^n \)$ has the globally Lipschitz representative

#[#set math.equation(numbering: n => "(6.4)")
 $ v \( x \) = b + M L^(*) x . $ <eq:ambient-affine-representative>]

Thus Lemma 22 applies after affine rigidity. No representative of an arbitrary limiting $L^2$ class is evaluated
  against a different measure.

=== 6.2 Normal coordinates and tilted planes <normal-coordinates-and-tilted-planes>

Write $q_0 = d - n$. Let $a_j in bb(R)^d$, and let $L_j : bb(R)^n arrow.r bb(R)^d$ and $N_j : bb(R)^(q_0) arrow.r
  bb(R)^d$ be linear isometries forming a complete orthogonal splitting:

#[#set math.equation(numbering: n => "(6.5)")
 $ L_j^(*) N_j = 0 \, wide L_j L_j^(*) + N_j N_j^(*) = I_(bb(R)^d) . $ <eq:complete-normal-splitting>]

For positive numbers $delta_j$, define the normalized normal height and the tangent projection by

#[#set math.equation(numbering: n => "(6.6)")
 $ w_j \( x \) = delta_j^(- 1) N_j^(*) \( x - a_j \) \, wide P_j x = a_j +
   L_j L_j^(*) \( x - a_j \) . $ <eq:normalized-vector-height>]

#thm([Lemma 6.2.])[
  (Affine heights produce affine planes).  #emph[Let $mu_j$ be measures, let the frames satisfy (6.5),
    and suppose that $delta_j > 0$ tends to zero. Assume
$ sup_j integral parallel w_j parallel^2 thin d mu_j < oo $

 and that, for one fixed affine map $v \( x \) = b + B x$ from $bb(R)^d$ to $bb(R)^(q_0)$,
   each function $parallel w_j - v parallel^2$ is integrable and
$ integral parallel w_j - v parallel^2 thin d mu_j arrow.r 0 . $

 Then there are affine $n$-planes $S'_j$ such that
#[#set math.equation(numbering: n => "(6.7)")
 $ integral (frac("dist" \( x \, S'_j \), delta_j))^2 d mu_j \( x \) arrow.r 0 . $ <eq:tilted-plane-distance-limit>]

 Every integral in this conclusion is finite. No convergence of the normal frames $N_j$ is required.]
] <lem:normal-affine-planes>

#proof[
  The orthogonal decomposition gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ x - a_j = L_j L_j^(*) \( x - a_j \) + delta_j N_j w_j \( x \) \, wide \| x - P_j x \| =
     delta_j parallel w_j \( x \) parallel . $ <eq:physical-normal-error>]
  Since $v$ has Lipschitz constant at most $parallel B parallel$,
  #[#set math.equation(numbering: n => "(6.9)")
   $ integral parallel v \( x \) - v \( P_j x \) parallel^2 thin d mu_j \( x \) lt.eq
     parallel B parallel^2 delta_j^2 integral parallel w_j parallel^2 thin d mu_j arrow.r
     0 . $ <eq:affine-projection-replacement>]
  This estimate also proves integrability of the left side.
    The inequality $parallel u + z parallel^2 lt.eq 2 parallel u parallel^2 + 2 parallel z parallel^2$ now yields
  #[#set math.equation(numbering: n => "(6.10)")
   $ integral parallel w_j \( x \) - v \( P_j x \) parallel^2 thin d mu_j \( x \) arrow.r
     0 . $ <eq:projected-affine-strong>]
  Set $c_j = b + B a_j$, $A'_j = B L_j$, and define
  #[#set math.equation(numbering: n => "(6.11)")
   $ S'_j = { a_j + L_j t + delta_j N_j \( c_j + A'_j t \) :
     t in bb(R)^n #scale(x: 120%, y: 120%)[}] . $ <eq:genuine-tilted-plane>]
  Its direction is the range of $L_j + delta_j N_j A'_j$. By (6.5),
  $ L_j^(*) \( L_j + delta_j N_j A'_j \) = I_(bb(R)^n) . $
  The parametrizing linear map is therefore injective. Its range has dimension $n$,
    and (6.11) is a nonempty affine $n$-plane. This conclusion needs no bound on its slope.
  For a given $x$, choose $t = L_j^(*) \( x - a_j \)$ in (6.11). Since $v \( P_j x \) = c_j + A'_j t$, (6.8) gives
  $ frac("dist" \( x \, S'_j \), delta_j) lt.eq parallel w_j \( x \) - v \( P_j x \) parallel . $
  The squared left side is measurable and dominated by an integrable function.
    Integrating and using (6.10) proves (6.7). ◻
]

Lemma 19 treats the finite family of normal coordinates on one common subsequence.
  Proposition 20 and Lemma 21 identify those same limiting functions without further extraction.

=== 6.3 The sequential improvement <the-sequential-improvement>

#thm([Proposition 6.3.])[
  (Vanishing normalized excess).  #emph[Fix $0 < gamma < 1 \/ 2$.
    Let $mu_j$ satisfy (6.1)–(6.1) with the same constants, and suppose that $0 in "supp" mu_j$.
    Let $delta_j > 0$ and $K_j in bb(N)$ satisfy
#[#set math.equation(numbering: n => "(6.12)")
 $ delta_j arrow.r 0 \, wide K_j arrow.r oo \, wide delta_j 2^(gamma K_j) arrow.r 0 \, wide
   delta_j^(- 1) 2^(- K_j) arrow.r 0 . $ <eq:sequential-horizon-schedule>]

 Assume that $2^(K_j) lt.eq "diam" \( "supp" mu_j \)$ and
#[#set math.equation(numbering: n => "(6.13)")
 $ e_(mu_j) \( 0 \, 2^ell \) lt.eq delta_j 2^(gamma ell) wide \( 0 lt.eq ell lt.eq K_j \) .
   $ <eq:sequential-horizon-excess>]

 Put $A_j = 8 thin 2^(K_j)$. Suppose, for every compactly supported 1-Lipschitz scalar function $phi$ with $"supp"
   phi subset B \( 0 \, A_j \)$ and $integral phi thin d mu_j = 0$, that
#[#set math.equation(numbering: n => "(6.14)")
 $ \| cal(R)_(mu_j) \( phi \) \| lt.eq delta_j^3 . $ <eq:sequential-cubic-oscillation>]

 There is one subsequence along which, for every fixed $r > 0$,
#[#set math.equation(numbering: n => "(6.15)")
 $ frac(e_(mu_j) \( 0 \, r \), delta_j) arrow.r 0 \, wide b_(mu_j) \( 0 \, r \) arrow.r
   0 . $ <eq:sequential-excess-conclusion>]

]
] <prop:normalized-excess-limit>

#proof[
  Admissibility of the growing horizons implies $"diam" \( "supp" mu_j \) arrow.r oo$.
    Lemma 14 and Proposition 17, applied to (6.13), give, after discarding finitely many indices and passing to a
    subsequence, a full constant-density plane limit
  $ mu_j harpoon.rt nu = q cal(H)^n \|_(L \( bb(R)^n \)) \, wide q > 0 \, $
  where $L$ is a linear isometry. They also give approximate fitting planes $S_j = a_j + L_j \( bb(R)^n \)$,
    with $a_j arrow.r 0$ and $L_j arrow.r L$, and fixed-plane moment bounds
  #[#set math.equation(numbering: n => "(6.16)")
   $ integral_(B \( 0 \, 2^ell \)) "dist" \( x \, S_j \)^2 thin d mu_j \( x \) lt.eq
     C_(*) delta_j^2 \( 2^ell \)^(n + 2 + 2 gamma) wide \( 0 lt.eq ell lt.eq K_j \) . $ <eq:prop-fixed-plane-moments>]
  The constant $C_(*)$ is independent of $j$ and $ell$. The fitting planes are approximate minimizers;
    no existence of an exact minimizer is used.
  Choose complementary normal isometries $N_j$ so that (6.5) holds. For $i = 1 \, dots.h \, q_0$, write
  $ u_(j \, i) \( x \) = chevron.l N_j e_i \, x - a_j chevron.r \, wide w_(j \, i) \( x \) =
    delta_j^(- 1) u_(j \, i) \( x \) \, $
  where $\( e_i \)$ is the standard orthonormal basis of $bb(R)^(q_0)$.
    The identity $sum_i u_(j \, i) \( x \)^2 = "dist" \( x \, S_j \)^2$ supplies the normal-coordinate moment
    bounds required by Lemma 18. That lemma and Lemma 19, with a common subsequence as described above,
    give measurable limiting heights $f_i$ on the limiting plane. On every region $Omega_m$, they satisfy
  #[#set math.equation(numbering: n => "(6.17)")
   $ integral_(Omega_m) w_(j \, i)^2 thin d mu_j & arrow.r integral_(Omega_m) f_i^2 thin d nu \,\
integral_(Omega_m) w_(j \, i) psi thin d mu_j & arrow.r integral_(Omega_m) f_i psi thin d nu
  $ <eq:normal-coordinate-norm-limit>]
  for every compactly supported Lipschitz $psi$. All these statements concern the same heights and the same subsequence.
  Proposition 20 gives the mean-zero fractional equation and the weighted tail integrability of each $f_i$.
    Lemma 21 therefore gives a scalar $b_i$ and a linear functional $M_i$ on $bb(R)^n$ such that
  $ f_i \( L t \) = b_i + M_i t quad upright("for almost every ") t in bb(R)^n . $
  Use the ambient affine representative $v_i \( x \) = b_i + M_i L^(*) x$.
    Applying Lemma 22 to the finite restrictions on $Omega_m$ yields
  $ integral_(Omega_m) \| w_(j \, i) - v_i \|^2 thin d mu_j arrow.r 0 . $
  Assemble $v = \( v_1 \, dots.h \, v_(q_0) \) = b + B x$. The Euclidean squared norm is the sum of the squared
    coordinates, so
  #[#set math.equation(numbering: n => "(6.18)")
   $ integral_(Omega_m) parallel w_j - v parallel^2 thin d mu_j arrow.r 0 \, wide
     sup_j integral_(Omega_m) parallel w_j parallel^2 thin d mu_j < oo . $ <eq:vector-affine-strong-limit>]
  Integrability of each coordinate square justifies the finite summation.
  Fix $r > 0$ and choose $m$ with $B \( 0 \, r \) subset Omega_m$. The integrands in (6.18) are nonnegative.
    Restricting them to $B \( 0 \, r \)$ preserves the uniform bound and the zero limit.
    In particular, this step requires no assertion about mass on the sphere $partial B \( 0 \, r \)$.
    Lemma 23, applied to the restrictions on this ball, supplies affine $n$-planes $S'_j$ with
  $ integral_(B \( 0 \, r \)) (frac("dist" \( x \, S'_j \), delta_j))^2 d mu_j \( x \) arrow.r 0 . $
  By the definition of the excess,
  $ 0 lt.eq (frac(e_(mu_j) \( 0 \, r \), delta_j))^2 lt.eq r^(- n - 2) integral_(B \( 0 \, r \))
    (frac("dist" \( x \, S'_j \), delta_j))^2 d mu_j \( x \) . $
  This proves the first limit in (6.15) for every fixed $r$, without another extraction.
  Proposition 17 also gives bilateral convergence of the supports to $L \( bb(R)^n \)$ on every bounded ball.
    This convergence persists on the subsequence used for the height limits.
    For every fixed $r > 0$, both directed deviations in the definition of $b_(mu_j) \( 0 \, r \)$ therefore tend
    to zero when evaluated at the plane $L \( bb(R)^n \)$. Their sum divided by $r$ bounds $b_(mu_j) \( 0 \, r \)$
    from above, which proves the second limit in (6.15). ◻
]

=== 6.4 Uniform propagation at every admissible scale <uniform-propagation-at-every-admissible-scale>

The next theorem is the input used in the cell-packing argument.
  The normalization of its tests agrees with that of $W_J \( Q \)$ after replacing the cell scale by $r$.

#thm([Theorem 6.4.])[
  (Uniform excess propagation).  #emph[Fix $1 lt.eq n < d$, $c \, G > 0$, $D_0 gt.eq 0$, $0 < gamma < 1 \/ 2$,
    and $epsilon > 0$. For every integer $J_0 gt.eq 0$, there is an integer $J gt.eq J_0$,
    depending only on these fixed data, with the following property. Set
#[#set math.equation(numbering: n => "(6.19)")
 $ delta = 2^(- J) \, wide K = 2 J + 3 \, wide A = 8 thin 2^K . $ <eq:uniform-propagation-constants>]

 Let $mu$ satisfy (6.1)–(6.1), let $a in "supp" mu$, and let $r > 0$. Assume
#[#set math.equation(numbering: n => "(6.20)")
 $ 2^K r & lt.eq "diam" \( "supp" mu \) \,\
e_mu \( a \, 2^ell r \) & lt.eq delta 2^(gamma ell) &  & \( 0 lt.eq ell lt.eq K \) \, $ <eq:prop-admissible-horizon>]

 and assume
#[#set math.equation(numbering: n => "(6.21)")
 $ \| cal(R)_mu \( phi \) \| lt.eq delta^3 r^n $ <eq:prop-oscillation-assumption>]

 for every compactly supported scalar function $phi$ satisfying
$ "Lip" \( phi \) lt.eq r^(- 1) \, wide "supp" phi subset B \( a \, A r \) \, wide integral phi thin d mu = 0 . $

 Then
#[#set math.equation(numbering: n => "(6.22)")
 $ e_mu \( a \, r \/ 2 \) lt.eq delta \, wide b_mu \( a \, r \/ 2 \) < epsilon . $ <eq:uniform-propagation-conclusion>]

 Equivalently, the oscillation hypothesis can be stated with $"Lip" \( phi \) lt.eq
   1$ and threshold $delta^3 r^(n + 1)$. The constants $J \, delta \, K \, A$ are chosen before the measure,
   center, and radius. The test radius $A r$ need not be admissible.]
] <thm:excess-propagation>

#proof[
  We first work at center zero and scale one. If the assertion failed, then for each $j gt.eq
    0$ we could choose a measure $mu_j$ satisfying the hypotheses at the index $j + J_0$,
    for which at least one conclusion in (6.22) fails. Thus, with
  $ delta_j = 2^(- \( j + J_0 \)) \, wide K_j = 2 \( j + J_0 \) + 3 \, wide A_j = 8 thin 2^(K_j) \, $
  we would have either $e_(mu_j) \( 0 \, 1 \/ 2 \) > delta_j$ or $b_(mu_j) \( 0 \, 1 \/ 2 \) gt.eq
    epsilon$ at every index. The constants in the growth and operator hypotheses remain $c \, G \,
    D_0$ for this entire sequence. Moreover,
  $ delta_j 2^(gamma K_j) & = 2^(3 gamma) thin 2^(- \( 1 - 2 gamma \) \( j + J_0 \)) arrow.r 0 \,\
delta_j^(- 1) 2^(- K_j) & = 2^(- \( j + J_0 \) - 3) arrow.r 0 . $
  Thus every hypothesis of Proposition 24 holds. On its common subsequence,
    the excess divided by $delta_j$ is eventually less than one and the bilateral beta number is eventually less
    than $epsilon$. This contradicts the selected failure of their conjunction.
    We have obtained one $J gt.eq J_0$ that works for every source measure at center zero and scale one.
  Fix this $J$. For arbitrary $mu \, a \, r$ in the statement, define the normalized measure
  $ sigma = r^(- n) \( T_(a \, r) \)_(\#) mu \, wide T_(a \, r) \( x \) = frac(x - a, r) . $
  The upper and admissible lower growth constants are unchanged, the origin belongs to its support, and $2^K lt.eq
    "diam" \( "supp" sigma \)$. The conjugation of hard truncations under $T_(a \, r)$ preserves the bound $D_0$;
    the truncation parameter $eta$ for $sigma$ corresponds exactly to $r eta$ for $mu$.
    Transporting all affine $n$-planes by this affine bijection gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ e_sigma \( 0 \, s \) = e_mu \( a \, r s \) \, wide b_sigma \( 0 \, s \) =
     b_mu \( a \, r s \) . $ <eq:prop-flatness-covariance>]
  For the first equality, the squared distance contributes $r^(- 2)$, the measure contributes $r^(- n)$,
    and the normalizing radius contributes $s^(- n - 2)$; the result is exactly the expression normalized by
    $\( r s \)^(n + 2)$. The second equality follows directly by scaling both directed distances and the radius by $r$.
  If $psi$ is a compactly supported 1-Lipschitz test in $B \( 0 \, A \)$ with zero $sigma$-mean,
    then $phi \( x \) = psi \( T_(a \, r) x \)$ has Lipschitz constant at most $r^(- 1)$,
    is supported in $B \( a \, A r \)$, and has zero $mu$-mean.
    The homogeneity of the kernel, applied to the renormalized pairing of Lemma 5, gives
  $ cal(R)_sigma \( psi \) = r^(- n) cal(R)_mu \( phi \) . $
  Hence (6.21) supplies the normalized bound $\| cal(R)_sigma \( psi \) \| lt.eq delta^3$.
    The scale-one assertion applies to $sigma$, and (6.23) gives (6.22) for $mu$.
    Finally, multiplying or dividing a test by $r$ proves the equivalence of the two oscillation normalizations. ◻
]

We henceforth fix $gamma = 1 \/ 4$. The smallness parameter in Theorem 25 can be made smaller than any prescribed
  positive constant by increasing $J_0$ before choosing $J$.
  The conclusion is simultaneous in excess and bilateral flatness;
  there is no need to reconcile separately selected thresholds.

== 7 Packing failures and the Lipschitz-image conclusion <sec:packing-endpoint>

We now combine the two exceptional-family estimates with excess propagation.
  A flat descendant starts the propagation; a later failure of bilateral flatness forces an oscillatory ancestor.
  The finite counting argument below converts this implication into a Carleson estimate without requiring selected
  flat descendants to be disjoint.

Throughout this section, $mu$ satisfies the hypotheses of Theorem 3, $E = "supp" mu$ has positive diameter,
  and $cal(D)$ is the lattice of Proposition 8. Write $cal(D) \( R \) = { Q in cal(D) :
  Q subset R }$ and let $k \( Q \)$ be the generation of $Q$, so that $ell \( Q \) = 2^(- k \( Q \))$. Fix

$ H gt.eq 4 \( C_0 + 1 \) \, wide beta_H \( Q \) = b_mu \( z_Q \, H ell \( Q \) \) . $

All constants below are uniform in the support center and scale.
  Their permitted dependencies are $d \, n \, C_(upright("AD")) \,
  C_(upright(R))$ and the explicitly chosen apertures and error thresholds.

=== 7.1 A finite seed-counting lemma <a-finite-seed-counting-lemma>

The next lemma concerns only a nested measurable partition.
  Its role is to count parents by the mass of one selected descendant of each parent.

#thm([Lemma 7.1.])[
  (Finite seed charging).  #emph[Let $R in cal(D)$ and let $cal(F)$ be a finite family of subcubes of $R$.
    For each $Q in cal(F)$, choose a cube $S \( Q \) subset Q$ such that, for fixed $N in bb(N)$ and $M gt.eq 1$,
$ k \( Q \) lt.eq k \( S \( Q \) \) lt.eq k \( Q \) + N \, wide mu \( Q \) lt.eq M mu \( S \( Q \) \) . $

 Let $cal(O) subset cal(D) \( R \)$ satisfy $sum_(T in cal(O)) mu \( T \) lt.eq K mu \( R \)$.
   Suppose that whenever $Q \, Q' in cal(F)$ satisfy
$ k \( S \( Q \) \) < k \( Q' \) \, wide Q' subset S \( Q \) \, $

 there is a cube $T in cal(O)$ with
$ k \( S \( Q \) \) lt.eq k \( T \) < k \( Q' \) \, wide Q' subset T . $

 Then
$ sum_(Q in cal(F)) mu \( Q \) lt.eq M \( N + 1 \) \( 1 + K \) mu \( R \) . $

]
] <lem:seed-charging>

#proof[
  For every eligible ordered pair $\( Q \, Q' \)$, choose one such $T$,
    and let $cal(O)_0$ be the resulting finite set. Make these choices before fixing a point.
    Outside the common null set of lattice boundaries, fix $x in
    R$ and list the parents whose seeds contain $x$ in increasing order of generation.
    Their generations are distinct, because their parents also contain $x$.
  Starting with the first parent $Q_1$, group together every listed parent of generation at most
    $k \( S \( Q_1 \) \)$. This group has at most $N + 1$ members.
    If another parent remains, let $Q_2$ be the first one. Nesting gives $Q_2 subset S \( Q_1 \)$,
    so the chosen charge for $\( Q_1 \, Q_2 \)$ contains $x$ and has generation in
    $\[ k \( S \( Q_1 \) \) \, k \( Q_2 \) \)$. Repeat this procedure.
    The intervals supplying successive charges are disjoint: the next interval starts at $k \( S \( Q_2 \) \)
    gt.eq k \( Q_2 \)$. Thus the number of groups is at most $1 + sum_(T in cal(O)_0) upright(bold(1))_T \( x \)$, and
  $ sum_(Q in cal(F)) upright(bold(1))_(S \( Q \)) \( x \) lt.eq \( N + 1 \)
    (upright(bold(1))_R \( x \) + sum_(T in cal(O)_0) upright(bold(1))_T \( x \)) . $
  Integrating this finite inequality and using the two mass bounds proves the result.
    In particular, overlapping seeds and arbitrarily long gaps between selected generations cause no difficulty. ◻
]

=== 7.2 Propagation along a cube chain <propagation-along-a-cube-chain>

#thm([Proposition 7.2.])[
  (Bilateral flatness has Carleson failures).  #emph[For each $H gt.eq 4 \( C_0 + 1 \)$ and $epsilon > 0$,
    there is a constant $C_(H \, epsilon) < oo$, depending only on $d \, n \, C_(upright("AD")) \,
    C_(upright(R)) \, H \, epsilon$, such that
$ sum_(Q subset R\
beta_H \( Q \) gt.eq epsilon) mu \( Q \) lt.eq C_(H \, epsilon) mu \( R \) wide \( R in cal(D) \) . $

]
] <prop:beta-packing>

#proof[
  We first fix all numerical parameters. Apply Theorem 25 with $gamma = 1 \/ 4$ and output tolerance $epsilon$.
    Write its resulting constants as
  $ delta = 2^(- j_(*)) \, wide K_(*) = 2 j_(*) + 3 \, wide A_(*) = 8 dot.op 2^(K_(*)) . $
  Choose
  $ A_(upright(f)) > H 2^(K_(*)) + 2 C_0 + 1 \, wide 0 < alpha < min {frac(epsilon H, 4) \,
    frac(delta H, 2 sqrt(G + 1))} \, wide J_(upright(o)) > A_(*) H + 2 C_0 + 1 \, wide v = delta^3 / 2 . $
  Here $G lt.eq 9^d C_(upright("AD"))$ is supplied by Lemma 4. Proposition 10 shows that
  $ cal(O) = { T in cal(D) : W_(J_(upright(o))) \( T \) > v ell \( T \)^n } $
  is Carleson; denote its constant by $C_(upright(o))$. Proposition 11,
    with aperture $A_(upright(f))$ and tolerance $alpha \/ \( 2 A_(upright(f)) \)$,
    supplies a Carleson family $cal(C)$, a fixed depth $N$, and, for every $Q in.not cal(C)$,
    a descendant $S \( Q \) subset Q$ at depth at most $N$ with
  $ b_mu \( z_(S \( Q \)) \, A_(upright(f)) ell \( S \( Q \) \) \) < frac(alpha, 2 A_(upright(f))) . $
  A near-minimizing plane $L_S$ consequently satisfies both directed bounds
  #[#set math.equation(numbering: n => "(7.1)")
   $ sup_(E ∩ B \( z_S \, A_(upright(f)) ell \( S \) \)) "dist" \( dot.op \, L_S \) lt.eq alpha ell \( S \) \,
     wide sup_(L_S ∩ B \( z_S \, A_(upright(f)) ell \( S \) \)) "dist" \( dot.op \, E \) lt.eq
     alpha ell \( S \) . $ <eq:seed-plane-bounds>]
  The lattice mass bounds give a uniform $M gt.eq 1$ such that
  #[#set math.equation(numbering: n => "(7.2)")
   $ mu \( Q \) lt.eq M mu \( S \( Q \) \) \, wide M lt.eq C \( d \, n \, C_(upright("AD")) \) 2^(n N) .
     $ <eq:seed-mass-comparison>]
  Before iterating propagation, we ensure its admissible horizon.
    The required condition is $2^(K_(*)) H ell \( S \) lt.eq D_E$.
    If $D_E < oo$, restrict for now to parents satisfying $ell \( Q \) lt.eq D_E \/ B_(*)$, where $B_(*) =
    H 2^(K_(*))$. Every selected seed then satisfies the condition, as do all later radii in its chain.
    If $D_E = oo$, there is no cutoff. This restriction costs only finitely many generations:
    the largest lattice scale lies in $\[ D_E \, 2 D_E \)$, so there are at most $2 +
    ceil.l log_2 B_(*) ceil.r$ omitted generations. At each generation,
    subcubes of a given $R$ are disjoint and have total mass at most $mu \( R \)$.
    We will restore all omitted cubes at this fixed Carleson cost.
  We prove the implication needed by Lemma 26. Let $S$ be one of these flat seeds and let $Q' subset
    S$ be a proper descendant, with $m = k \( Q' \) - k \( S \) > 0$.
    Suppose that every proper ancestor of $Q'$ between $S$ and $Q'$ lies outside $cal(O)$.
    We claim that $beta_H \( Q' \) < epsilon$.
  Keep the center $a = z_(Q')$ fixed throughout the argument.
    Let $T_j$ be the ancestor of $Q'$ of generation $k \( S \) + j$, and set
  $ r_j = H 2^(- j) ell \( S \) = H ell \( T_j \) \, wide 0 lt.eq j lt.eq m . $
  The center belongs to the closure of every $T_j$, so $\| a - z_(T_j) \| lt.eq 2 C_0 ell \( T_j \)$.
    In particular, $B \( a \, 2^(K_(*)) r_0 \) subset B \( z_S \, A_(upright(f)) ell \( S \) \)$.
    The first bound in (7.1) and global upper growth give, for $0 lt.eq i lt.eq K_(*)$,
  #[#set math.equation(numbering: n => "(7.3)")
   $ e_mu \( a \, 2^i r_0 \) lt.eq frac(sqrt(G) thin alpha ell \( S \), 2^i r_0) lt.eq
     delta thin 2^(i \/ 4) . $ <eq:seed-initial-excess>]
  For $j < m$, a compactly supported mean-zero test $phi$ with $"Lip" phi lt.eq
    r_j^(- 1)$ and $"supp" phi subset B \( a \, A_(*) r_j \)$ is admissible in the definition of
    $W_(J_(upright(o))) \( T_j \)$: its support lies in the required enlarged ball, and $r_j gt.eq ell \( T_j \)$.
    Therefore
  #[#set math.equation(numbering: n => "(7.4)")
   $ \| cal(R)_mu \( phi \) \| lt.eq v ell \( T_j \)^n lt.eq delta^3 r_j^n . $ <eq:chain-oscillation>]
  We may now iterate Theorem 25 at the radii $r_0 \, r_1 \, dots.h \, r_(m - 1)$.
    To check the complete horizon at the $j$th step, observe that
  $ 2^i r_j = cases(delim: "{", r_(j - i) \, & i lt.eq j \,, 2^(i - j) r_0 \, & i > j .) $
  In the first case the preceding induction gives excess at most $delta$; in the second,
    (7.3) gives at most $delta 2^(\( i - j \) \/ 4) lt.eq delta 2^(i \/ 4)$.
    Thus all horizon inequalities hold at every step. Together with (7.4), they prove
  $ e_mu \( a \, r_j \) lt.eq delta quad \( 0 lt.eq j lt.eq m \) \, wide
    b_mu \( a \, r_j \) < epsilon quad \( 1 lt.eq j lt.eq m \) . $
  Since $r_m = H ell \( Q' \)$, the claim follows. Notice that no test at the terminal cube $Q'$ was used.
  Fix $R in cal(D)$. Take any finite family $cal(F)$ of remaining subcubes of $R$ with $beta_H \( Q \) gt.eq
    epsilon$, and remove the members of $cal(C)$. For each remaining parent use the seed selected above.
    If $Q' subset S \( Q \)$ and $k \( Q' \) > k \( S \( Q \) \)$, then the just-proved implication,
    applied contrapositively, supplies $T in cal(O)$ with
  $ S \( Q \) supset T supset Q' \, wide k \( S \( Q \) \) lt.eq k \( T \) < k \( Q' \) . $
  Lemma 26 and (7.2) give
  $ sum_(Q in cal(F) \\ cal(C)) mu \( Q \) lt.eq M \( N + 1 \) \( 1 + C_(upright(o)) \) mu \( R \) . $
  Add the Carleson bound for $cal(C)$ and the finite coarse-generation cost.
    Taking the supremum over finite families proves the asserted countable sum.
    Every parameter was fixed before $R$ or any seed was chosen. ◻
]

=== 7.3 From dyadic packing to the bilateral weak geometric lemma <from-dyadic-packing-to-the-bilateral-weak-geometric-lemma>

We spell out the passage to the intrinsic ball condition,
  so the final geometric theorem does not depend on a choice of lattice.
  First, $b_mu$ is Borel on $E times \( 0 \, oo \)$. Indeed,
  the two unnormalized directed deviations on an open ball are jointly lower semicontinuous in its center, radius,
  and affine plane. Points strictly inside a ball persist under small perturbations,
  and points of a limiting plane can be approximated by points of the varying planes.
  Along a convergent sequence of centers and positive radii,
  near-minimizing planes with bounded error have bounded offsets:
  the center belongs to $E$ and its distance to the plane is one of the first directed deviations.
  Compactness of the Grassmannian then supplies a convergent plane subsequence.
  The two lower-semicontinuity inequalities show that their infimum $b_mu$ is lower semicontinuous as well.

Fix $epsilon > 0$, $a in E$, and $0 < R < D_E$. Choose a lattice scale $s$ with $R lt.eq s < 2 R$, and put $s_j =
  2^(- j) s$. For almost every $x$, let $Q_j \( x \)$ be its cube of side scale $s_j$.
  Whenever $s_j \/ 2 < t lt.eq s_j$,

$ B \( x \, t \) subset B \( z_(Q_j \( x \)) \, H s_j \) \, wide b_mu \( x \, t \) lt.eq
  frac(H s_j, t) beta_H \( Q_j \( x \) \) lt.eq 2 H beta_H \( Q_j \( x \) \) . $

Both inequalities follow directly from the two directed deviations;
  the same plane is used before taking the infimum. Integrating over the dyadic scale intervals and then over $E ∩
  B \( a \, R \)$ yields

$ & integral_(E ∩ B \( a \, R \)) integral_0^R upright(bold(1))_({ b_mu \( x \, t \) > epsilon }) thin
  frac(d t, t) thin d mu \( x \)\
 & wide lt.eq \( log 2 \) sum_(Q upright(" at scale ") s_j \, med j gt.eq 0\
Q ∩ B \( a \, R \) eq.not diameter\
beta_H \( Q \) > epsilon \/ \( 2 H \)) mu \( Q \) . $

Group these cubes by their scale-$s$ ancestors $P$. Such a $P$ meets $B \( a \, R \)$ and is contained in
  $B \( a \, \( 1 + 4 C_0 \) R \)$. Applying Proposition 27 to each $P$,
  then summing their disjoint masses and using global growth, proves

#[#set math.equation(numbering: n => "(7.5)")
 $ integral_(E ∩ B \( a \, R \)) integral_0^R upright(bold(1))_({ b_mu \( x \, t \) > epsilon }) thin frac(d t, t)
   thin d mu \( x \) lt.eq C_epsilon R^n . $ <eq:continuous-bwgl>]

This is the #emph[bilateral weak geometric lemma]: for every positive flatness threshold,
  its failures occupy a Carleson set of positions and scales.

=== 7.4 The geometric criterion and the ball-map conclusion <the-geometric-criterion-and-the-ball-map-conclusion>

For clarity, we recall the measure comparison used to apply the geometric criterion. AD regularity with $D_E > 0$ gives

#[#set math.equation(numbering: n => "(7.6)")
 $ c thin cal(H)^n #h(-0.16667em) harpoon.tr E med lt.eq med mu med lt.eq med
   C thin cal(H)^n #h(-0.16667em) harpoon.tr E \, $ <eq:measure-hausdorff-comparison>]

with positive finite constants depending only on the AD data and the Hausdorff-measure normalization.
  Here is a direct justification. Cover a subset of $E$ by sets of arbitrarily small diameter,
  recenter each nonempty set at a point of $E$, and use the upper ball bound.
  Infimizing the cover sums proves the upper inequality. For the reverse inequality,
  let $F subset E$ be bounded and Borel, and let $U$ be an open set containing $F$.
  Cover $F$ by support-centered balls contained in $U$, of radii less than both $D_E \/
  10$ and an arbitrarily small prescribed number. The $5 r$ covering lemma selects disjoint balls $B_i$ whose
  fivefold dilates cover $F$. The lower AD bound gives

$ cal(H)_eta^n \( F \) lt.eq C_n sum_i r_i^n lt.eq C_n C_(upright("AD")) sum_i mu \( B_i \) lt.eq
  C_n C_(upright("AD")) mu \( U \) \, $

Here $cal(H)_eta^n$ denotes Hausdorff content using covers of diameter less than $eta$,
  with the same normalization as $cal(H)^n$; the chosen radii make all fivefold diameters less than $eta$.
  Let $eta arrow.b 0$, use outer regularity, and then exhaust unbounded sets by bounded sets. This proves (7.6).
  In particular $E$ is an $n$-AD-regular set for $cal(H)^n$.
  Write $b_E$ for the bilateral coefficient of Definition 7 with support set $E$, so that $b_E = b_mu$.
  Replacing $d mu$ by $d cal(H)^n$ in (7.5) changes only its constant.

#thm([Theorem 7.3.])[
  (David–Semmes bilateral criterion).  #emph[Let $E subset bb(R)^d$ be closed, of positive diameter,
    and $n$-AD regular with respect to $cal(H)^n$. Suppose that for every $epsilon > 0$ there is $C_epsilon <
    oo$ such that
$ integral_(E ∩ B \( a \, R \)) integral_0^R upright(bold(1))_({ b_E \( x \, t \) > epsilon }) thin frac(d t, t)
  thin d cal(H)^n \( x \) lt.eq C_epsilon R^n quad \( a in E \, med 0 < R < "diam" E \) . $

 Then $E$ has big pieces of uniformly Lipschitz images: there are $theta_0 > 0$ and $L <
   oo$ such that for every $a in E$ and $0 < r < "diam" E$ there is an $L$-Lipschitz map $f :
   B^n \( 0 \, r \) arrow.r bb(R)^d$ for which
$ cal(H)^n #scale(x: 120%, y: 120%)[\(] E ∩ B \( a \, r \) ∩ f \( B^n \( 0 \, r \) \) #scale(x: 120%, y: 120%)[\)]
  gt.eq theta_0 r^n . $

 The constants depend only on the dimensions, AD constants, and the constants in the bilateral weak geometric lemma.]
] <thm:bwgl>

This is the Euclidean David–Semmes criterion #cite(label("DavidSemmes1993")) Chapter II.2;
  see also #cite(label("Tolsa2015Uniform")) Theorem 2.5 for the all-scale formulation and
  #cite(label("BateHydeSchul2023")) Theorem 1.0.4 for finite diameter.
  Appendix 9 verifies the finite-diameter, open-ball and positive-mass conventions needed for this formulation.

#proof[
  If $E$ is empty or a singleton, there is no positive admissible radius,
    and the asserted ball-map conclusion is vacuous. Otherwise Proposition 27 gives (7.5) for every threshold.
    The comparison (7.6) permits application of Theorem 28; its positive image-mass bound also holds with $mu$,
    after changing the positive constant.
  For any $a in E$ and $0 < r lt.eq D_E$, apply this conclusion at $r \/ 2$ and write its map as $f :
    B^n \( 0 \, r \/ 2 \) arrow.r bb(R)^d$. The map
  $ g : B^n \( 0 \, r \) arrow.r bb(R)^d \, wide g \( u \) = f \( u \/ 2 \) \, $
  has the same image and Lipschitz constant at most $L \/ 2$.
    Since $B \( a \, r \/ 2 \) subset B \( a \, r \)$, it captures at least $c theta_0 2^(- n)
    r^n$ of the original measure in $B \( a \, r \)$. This also covers $r = D_E$ when the diameter is finite.
    All constants were chosen before $a$ and $r$, and have only the dependencies asserted in the theorem.
    Thus the uniform ball-map condition in Definition 2 holds. ◻
]

== 8 Variation and principal values <sec:consequences>

The uniform-rectifiability conclusion also allows the forward estimates of Mas and Tolsa to be applied under the
  individual hard-truncation bound (1.2). For a scalar or Euclidean-vector family
  $F = \( F_epsilon \)_(epsilon > 0)$ and $rho > 2$, write

$ V_rho \( F \) \( x \) = sup_(m gt.eq 1\
epsilon_0 > dots.h.c > epsilon_m > 0)
  (sum_(j = 0)^(m - 1) \| F_(epsilon_(j + 1)) \( x \) - F_(epsilon_j) \( x \) \|^rho)^(1 \/ rho) . $

Thus the supremum is over all finite decreasing sequences of positive scales,
  with the Euclidean norm for vector values. Let $K : bb(R)^d \\ { 0 } arrow.r
  bb(R)$ be an odd $C^2$ convolution kernel satisfying, for some finite $C_K > 0$,

#[#set math.equation(numbering: n => "(8.1)")
 $ K \( - z \) = - K \( z \) \, wide \| partial^beta K \( z \) \| lt.eq
   C_K \| z \|^(- n - \| beta \|) quad \( \| beta \| lt.eq 2 \, med z eq.not 0 \) \, $ <eq:variation-kernel>]

and set

$ T_epsilon^(K \, mu) f \( x \) = integral_(\| x - y \| > epsilon) K \( x - y \) f \( y \) thin d mu \( y \) . $

For the smooth family, fix one nondecreasing $phi_(bb(R)) in C^2 \( \[ 0 \, oo \) \; \[ 0 \, oo \) \)$ such that,
  for some finite $C_phi > 0$,

#[#set math.equation(numbering: n => "(8.2)")
 $ upright(bold(1))_(\[ 4 \, oo \)) lt.eq phi_(bb(R)) lt.eq upright(bold(1))_(\[ 1 \/ 4 \, oo \)) \, wide
   upright(bold(1))_(\[ 1 \/ 3 \, 3 \]) lt.eq C_phi \| phi'_(bb(R)) \| . $ <eq:variation-cutoff>]

Put $phi_epsilon \( z \) = phi_(bb(R)) \( \| z \|^2 \/ epsilon^2 \)$ and

$ T_(phi \, epsilon)^(K \, mu) f \( x \) = integral K \( x - y \) phi_epsilon \( x - y \) f \( y \) thin d
  mu \( y \) \, $

where the cutoff kernel is defined to be zero on the diagonal.

#thm([Corollary 8.1.])[
  (Consequences of Mas–Tolsa).  #emph[Let $d gt.eq 4$ and $2 lt.eq n lt.eq d - 2$ be integers,
    and let $mu$ be an $n$-Ahlfors–David regular Radon measure satisfying (1.2).
    Fix $rho > 2$ and a real odd $C^2$ convolution kernel $K$ satisfying (8.1). For every real $f in L^2 \( mu \)$,
#[#set math.equation(numbering: n => "(8.3)")
 $ parallel V_rho \( \( T_epsilon^(K \, mu) f \)_(epsilon > 0) \)
   #scale(x: 120%, y: 120%)[parallel]_(L^2 \( mu \)) lt.eq C_2 parallel f parallel_(L^2 \( mu \)) .
   $ <eq:hard-variation-consequence>]

 The principal value
$ T^(K \, mu) f \( x \) = lim_(epsilon arrow.b 0) T_epsilon^(K \, mu) f \( x \) $

 exists finitely for $mu$-almost every $x$, belongs to $L^2 \( mu \)$, and
$ parallel T_epsilon^(K \, mu) f - T^(K \, mu) f parallel_(L^2 \( mu \)) arrow.r 0 wide \( epsilon arrow.b 0 \) . $

 The vector Riesz family $R_(mu \, epsilon) f$ satisfies the analogous hard-variation bound and has an
   almost-everywhere principal-value limit, with strong convergence in $L^2 \( mu \; bb(R)^d \)$.
   The exceptional null set may depend on $K$ and $f$. These are strong-convergence assertions on each input;
   no operator-norm convergence is asserted.]
  #emph[For the fixed profile (8.2), every real $f in L^p \( mu \)$ with $1 < p < oo$ satisfies
#[#set math.equation(numbering: n => "(8.4)")
 $ parallel V_rho \( \( T_(phi \, epsilon)^(K \, mu) f \)_(epsilon > 0) \)
   #scale(x: 120%, y: 120%)[parallel]_(L^p \( mu \)) lt.eq C_p parallel f parallel_(L^p \( mu \)) .
   $ <eq:smooth-variation-consequence>]

 For every real $f in L^1 \( mu \)$ and $lambda > 0$,
$ mu {x : V_rho \( \( T_(phi \, epsilon)^(K \, mu) f \)_(epsilon > 0) \) \( x \) > lambda} lt.eq C_1 /
  lambda parallel f parallel_(L^1 \( mu \)) . $

 The constants may depend on the dimensions, the fixed $rho$, the kernel bounds, the uniform-rectifiability data,
   and, for the smooth estimates, the chosen profile and $p$ when relevant.]
] <cor:variation>

#proof[
  If $D_E = 0$, the support is empty or a singleton. All the truncated operators above vanish $mu$-almost
    everywhere, so the assertions are immediate. Suppose $D_E > 0$.
    Theorem 3 gives uniform rectifiability, with constants $theta \,
    M$ and admissible radii when the support is bounded. For unbounded support,
    the forward clauses $\( a \) arrow.r.double \( c \)$ and $\( a \)
    arrow.r.double \( b \)$ of Mas–Tolsa’s Theorem 2.3 give, respectively,
    the hard $L^2$ and smooth $L^p$/weak-$\( 1 \, 1 \)$ estimates;
    their Definition 2.1 is precisely the fixed cutoff above,
    and their Theorem 1.3 includes the vector Riesz family #cite(label("MasTolsa2014Variation")).
    Their range $1 lt.eq n < d$ contains the present one. We reduce bounded support to this unbounded setting.
  Suppose $D = D_E < oo$, and fix $a in E$. Since $n < d$, choose an affine $n$-plane $P$ with
    $"dist" \( a \, P \) = 4 D$, and set
  $ sigma = mu + cal(H)^n #h(-0.16667em) harpoon.tr P . $
  For $x in E$, the diameter bound gives $3 D lt.eq "dist" \( x \, P \) lt.eq 5 D$.
    Thus $E$ and $P$ are disjoint and $"supp" sigma = E union P$ is unbounded.
    Lemma 4 and the Euclidean plane-volume bound give
  $ sigma \( B \( z \, r \) \) lt.eq \( 9^d C_(upright("AD")) + omega_n \) r^n wide \( z in bb(R)^d \, med r > 0 \) \, $
  where $omega_n$ is the volume of the unit ball in $bb(R)^n$.
  We verify lower growth and Lipschitz pieces at every support center and radius.
    For centers on $P$, the plane supplies both properties at every radius.
    For $x in E$ and $r lt.eq D$, use the corresponding properties of $mu$.
    If $D < r < 12 D$, the ball $B \( x \, D \/ 2 \)$ lies in $B \( x \, r \)$ and has mass at least
  $ C_(upright("AD"))^(- 1) \( D \/ 2 \)^n gt.eq C_(upright("AD"))^(- 1) 24^(- n) r^n . $
  The uniform-rectifiability map at scale $D \/ 2$ captures at least $theta \( D \/ 2 \)^n gt.eq
    theta 24^(- n) r^n$ in the same ball. Composing that map with $u mapsto D
    u \/ \( 2 r \)$ gives a map on $B_(bb(R)^n) \( 0 \, r \)$ with the same image and Lipschitz constant at most
    $M$. If $r gt.eq 12 D$, the disk in $P$ centered at $pi_P x$ with radius $r \/ 2$ lies in $B \( x \, r \)$,
    since every point $z$ of that disk satisfies
  $ \| z - x \| lt.eq \| z - pi_P x \| + "dist" \( x \, P \) < r \/ 2 + 5 D lt.eq 11 r \/ 12 . $
  This disk has $sigma$-mass at least $omega_n 2^(- n) r^n$ and is the image of $B_(bb(R)^n) \( 0 \, r \)$ under a
    $1 \/ 2$-Lipschitz affine map. These estimates prove that $sigma$ is globally $n$-AD regular and uniformly
    $n$-rectifiable, with constants controlled by the original dimensions, AD data, $theta$, and $M$.
  For any input $f$ in one of the stated $L^p \( mu \)$ spaces, extend it by zero on $P$ to obtain $tilde(f)$.
    Disjointness gives $parallel tilde(f) parallel_(L^p \( sigma \)) = parallel f parallel_(L^p \( mu \))$.
    For every positive truncation and every $x in E$,
  $ T_epsilon^(K \, sigma) tilde(f) \( x \) = T_epsilon^(K \, mu) f \( x \) \, wide
    T_(phi \, epsilon)^(K \, sigma) tilde(f) \( x \) = T_(phi \, epsilon)^(K \, mu) f \( x \) . $
  The vector Riesz truncations have the same identity. Apply the forward estimates to $sigma$ and restrict the
    output to $E$. Since $sigma \|_E = mu$, the identities transfer both the strong bounds and the
    weak-$\( 1 \, 1 \)$ bound to $mu$, with the required constant dependence.
  In either diameter regime, for a real $f in L^2 \( mu \)$, Lemma 4 and the size bound in (8.1) give
  $ integral_(\| x - y \| > epsilon) \| K \( x - y \) \|^2 thin d mu \( y \) lt.eq C epsilon^(- n) . $
  Consequently the displayed hard integrals converge absolutely for every $x$ and tend to zero as $epsilon arrow.r
    oo$. Approximate $f$ in $L^2$ by compactly supported $L^1 ∩ L^2$ inputs $f_j$.
    The same kernel estimate gives pointwise convergence of each positive truncation.
    Taking the supremum over finite sequences gives
  $ V_rho \( \( T_epsilon^(K \, mu) f \)_(epsilon > 0) \) lt.eq
    liminf_(j arrow.r oo) V_rho \( \( T_epsilon^(K \, mu) f_j \)_(epsilon > 0) \) \, $
  so Fatou’s lemma transfers the cited variation bound to the actual integrals for $f$.
    For the smooth formulas, the analogous exterior $L^(p') \( mu \)$ kernel estimate, with $p' =
    p \/ \( p - 1 \) > 1$, and Hölder’s inequality give the same identification for $L^p$ inputs.
    For $L^1$ inputs the cutoff kernel is bounded at each fixed positive scale.
  Let $V = V_rho \( \( T_epsilon^(K \, mu) f \)_(epsilon > 0) \)$. By (8.3), $V$ is finite almost everywhere.
    Finite variation forces the truncations to be Cauchy as $epsilon arrow.b 0$:
    otherwise a decreasing sequence with infinitely many jumps bounded below would make $V$ infinite.
    This proves existence of the finite principal value. The definition gives $\| T_epsilon^(K \, mu) f -
    T_delta^(K \, mu) f \| lt.eq V$ for every $epsilon \, delta > 0$.
    Sending $delta arrow.b 0$ gives $\| T_epsilon^(K \, mu) f - T^(K \, mu) f \| lt.eq V$,
    while sending $delta arrow.r oo$ gives $\| T_epsilon^(K \, mu) f \| lt.eq V$.
    Thus the limit belongs to $L^2 \( mu \)$, and dominated convergence with the majorant $V^2 in
    L^1 \( mu \)$ proves strong $L^2$ convergence. The same argument with Euclidean norms applies to the vector
    Riesz family. ◻
]

== 9 Conventions for the bilateral criterion <app:geometric-conventions>

We justify the precise version of Theorem 28, including positive image mass and bounded supports.
  The argument first transfers our open-ball packing estimate to the metric coefficient used by Bate,
  Hyde and Schul, and then turns one of their bi-Lipschitz pieces into a Lipschitz image of the full parameter ball.

#proof[
  The formulation of Bate, Hyde and Schul uses closed balls and maps defined on all of $bb(R)^n$
    #cite(label("BateHydeSchul2023")) Theorem 1.0.4. If $overline(b)_E$ denotes its closed-ball bilateral
    coefficient, then
  $ overline(b)_E \( x \, t \) lt.eq 2 b_E \( x \, 2 t \) . $
  Indeed, both closed-ball suprema at radius $t$ are bounded by the open-ball suprema at radius $2
    t$ for the same plane. For $R < "diam" \( E \) \/ 2$, enlarging the spatial ball to $B \( a \, 2 R \)$ and
    substituting $s = 2 t$ therefore transfers the Carleson hypothesis of Theorem 28 to closed balls.
    If $D = "diam" \( E \) < oo$ and $D \/ 2 lt.eq R < D$, cover $E$ by a dimensionally bounded number of
    support-centered open balls of radius $D \/ 8$. On each enclosing radius-$D \/ 4$ ball,
    the open-ball estimate controls the transformed integral for $t < D \/ 8$.
    For the remaining $D \/ 8 lt.eq t < R$, the integral is at most $\( log 8 \) cal(H)^n \( E \) lt.eq
    C D^n lt.eq C 2^n R^n$. Thus the closed-ball criterion applies with controlled constants in both diameter
    regimes. AD regularity has the same open/closed-ball equivalence,
    by doubling the radius and using the total-mass bound when that doubled radius exceeds a finite diameter.
  We next pass from Euclidean bilateral flatness to the metric coefficient used in that source’s corona
    decomposition. Its coefficient $xi_E \( a \, t \)$ #cite(label("BateHydeSchul2023")) Definition 3.1.3
    minimizes, over maps from $E ∩ overline(B) \( a \, t \)$ to closed radius-$t$ balls in $n$-dimensional normed
    spaces, the sum of two quantities: the largest pairwise distance distortion divided by $t$,
    and the largest distance from a target-ball point to the image divided by $t$. We claim
  $ xi_E \( a \, t \) lt.eq 36 overline(b)_E \( a \, 2 t \) . $
  Choose an almost-fitting affine plane $L$ whose summed directed error at radius $2 t$ is at most $2 lambda t$,
    with $0 < lambda < 1 \/ 12$. Orthogonal projection, followed by translation, gives $f \( x \) = pi_L \( x \) -
    pi_L \( a \)$ in the Euclidean closed radius-$t$ ball in the direction of $L$.
    Its distance distortion is at most $4 lambda t$. For a target vector $v$ with $\| v \| lt.eq t$,
    the point $y = pi_L \( a \) + \( 1 - 6 lambda \) v$ satisfies $\| y - a \| lt.eq \( 1 - 4 lambda \) t$.
    The bilateral estimate supplies $z in E$ with $\| z - y \| lt.eq 2 lambda t$,
    so $z in overline(B) \( a \, t \)$ and $\| f \( z \) - v \| lt.eq 8 lambda t$.
    Thus $xi_E \( a \, t \) lt.eq 12 lambda$. Letting $lambda$ decrease to the infimum proves the claim when that
    infimum is below $1 \/ 12$. Otherwise the constant map gives $xi_E \( a \, t \) lt.eq 3 lt.eq
    36 overline(b)_E \( a \, 2 t \)$. The same doubling of scales and finite-diameter coarse-scale bound proved
    above now transfer the Carleson estimate to $xi_E$. By #cite(label("BateHydeSchul2023")) Theorem B,
    implication $\( 3 \) arrow.r.double \( 5 \)$, $E$ therefore has the corona decomposition by normed spaces
    required in that source’s positive-mass construction, with controlled constants.
  This corona decomposition supplies the bi-Lipschitz pieces in #cite(label("BateHydeSchul2023"))
    Proposition 9.0.2 and Lemma 9.0.4. Choosing the omitted mass below half the lower AD bound gives a piece $F
    subset E ∩ overline(B) \( a \, s \)$ with $cal(H)^n \( F \) gt.eq
    c s^n > 0$ and a uniformly $K$-bi-Lipschitz map $phi.alt : F arrow.r bb(R)^n$.
    To see directly that a full parameter-ball image suffices,
    fix $p in F$ and put $V = \( phi.alt \( F \) - phi.alt \( p \) \) \/ \( 4 K \)$.
    Then $V subset B^n \( 0 \, s \)$, and $h \( u \) = phi.alt^(- 1) \( 4 K u + phi.alt \( p \) \)$ on $V$ is $4
    K^2$-Lipschitz. Coordinatewise Lipschitz extension gives a map on all of $bb(R)^n$ with constant at most $4
    sqrt(d) K^2$ and image containing $F$. Choose the preceding bi-Lipschitz piece at $s =
    r \/ 2$ and restrict this map to the open ball $B^n \( 0 \, r \)$.
    Its image contains $F$, while $overline(B) \( a \, r \/ 2 \) subset B \( a \, r \)$;
    the mass bound loses only the factor $2^(- n)$. This proves precisely the open-ball formulation of Theorem 28. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
