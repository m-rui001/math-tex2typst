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

#align(center)[#text(size: 16pt, weight: "bold")[One-sided negative sectional curvature \
and the holomorphic Liouville property]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

For a complex manifold $M$, let $H^oo \( M \)$ denote the algebra of bounded holomorphic functions on $M$.
  We say that $M$ has the #emph[holomorphic Liouville property] when $H^oo \( M \) = bb(C)$.
  The question studied here asks whether negative curvature forces this algebra to contain a nonconstant function.
  More precisely, the one-sided bounded-holomorphic-function question asks whether every complete simply connected
  Kähler manifold of complex dimension at least two satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ "Sec"_g lt.eq - a^2 < 0 $ <eq:one-sided-question>]

admits a nonconstant bounded holomorphic function. Sectional curvature here and throughout the paper means
  curvature on every real two-plane. There is no lower curvature bound in this hypothesis.
  We use the public formulation recorded by Wu and Yau #cite(label("WuYau2020")) p. 103;
  their survey #cite(label("WuYauSurvey2019")) Section 3, p. 9 traces it to Yau’s 1982 Problem 38.

#thm([Theorem 1.1.])[
  #emph[For some finite integer $m gt.eq 2$ there is a domain $cal(T) subset bb(C)^m$,
    diffeomorphic to $bb(R)^(2 m)$, with a complete Kähler metric $g$ such that
$ "Sec"_g lt.eq - 1 \, wide H^oo \( cal(T) \) = bb(C) . $

 The sectional curvatures of $g$ are unbounded below.]
] <thm:main>

The dimension is chosen sufficiently large and then fixed for the entire construction.
  The theorem therefore disproves the universal assertion in the one-sided question.
  Its curvature is unbounded below, so the example leaves separate the bounded-function question under a finite
  two-sided bound $- b^2 lt.eq "Sec"_g lt.eq - a^2 < 0$.

The uniform upper bound is essential to the question. Seshadri, adapting Klembeck’s radial curvature calculations,
  exhibited a complete Kähler metric on $bb(C)^n$ with strictly negative sectional curvature
  #cite(label("Seshadri2006")) Section 3. Since every bounded entire function is constant,
  strict negativity by itself already permits the holomorphic Liouville property.
  In that example some sectional curvatures tend to zero; Theorem 1 retains a uniform negative upper bound.

=== 1.1 Bounded functions, bounded coordinates, and invariant metrics <bounded-functions-bounded-coordinates-and-invariant-metrics>

A biholomorphism to a bounded domain in $bb(C)^m$ supplies $m$ bounded holomorphic coordinate functions whose
  differentials are independent everywhere. More generally, a bounded holomorphic map $M arrow.r
  bb(C)^m$ with nowhere-vanishing Jacobian provides such a tuple, without necessarily being injective.
  Either conclusion implies the existence of a nonconstant bounded holomorphic function.
  The reverse implications require additional information.

The stronger bounded-domain question appears in H. Wu’s work #cite(label("WuNormal1967")) p. 195, question (1).
  Its hypotheses are completeness, simple connectivity, nonpositive real sectional curvature,
  and a uniformly negative upper bound for holomorphic sectional curvature.
  Theorem 1 also gives a negative answer under those hypotheses,
  since a negative upper bound on all real two-planes applies in particular to complex lines.
  Wu and Yau formulate a bounded-pseudoconvex-domain question under two-sided negative real sectional pinching in
  #cite(label("WuYauSurvey2019")) Conjecture 4.3.

Comparisons among intrinsic metrics give another approach to these questions.
  For complete simply connected Kähler manifolds with two-sided negative real sectional pinching,
  Greene and Wu established a complete Bergman metric and a lower comparison with the original metric.
  Wu and Yau recall that result and prove the complementary upper bound #cite(label("WuYau2020")) Theorems 4
  and 6. Under the same hypotheses, #cite(label("WuYau2020"), form: "prose") Corollary 7 compare the Bergman,
  Kobayashi–Royden, and complete negative Kähler–Einstein metrics with the original metric.
  The Bergman metric uses square-integrable holomorphic top forms,
  and the Kobayashi–Royden metric uses holomorphic disks mapped into the manifold.
  After constant rescaling, bounded holomorphic functions give maps from the manifold to the disk.

These latter maps define the Carathéodory infinitesimal pseudometric:
  at each tangent vector, take the supremum of its lengths pulled back from the Poincaré disk metric.
  Every such map on $cal(T)$ is constant by Theorem 1, so this pseudometric vanishes identically.
  The invariant-metric comparisons above contain no Carathéodory nondegeneracy assertion;
  they also require the lower curvature bound absent from our example.

Shcherbina and Zhang construct a domain in $bb(C)^2$ with smooth strictly pseudoconvex boundary that is Kobayashi
  and Bergman complete and has the holomorphic Liouville property #cite(label("ShcherbinaZhang2021")) Main Theorem
  and Section 6. Their argument first forces bounded continuous plurisubharmonic functions to be constant on a
  Wermer-type set and then uses holomorphic uniqueness along slices.
  Here polynomial sampling and phases enforce bounded-function rigidity while the construction also controls
  sectional curvature on every real two-plane. The announced pinched result of Cao and Shaw was withdrawn
  #cite(label("CaoShawWithdrawn")); it is not an input to our proof.

The separate companion #emph[A negatively pinched Kähler threefold without bounded holomorphic coordinates]
  #cite(label("OpenAIPinchedThreefold2026")) Theorem 1.1 constructs a contractible domain in $bb(C)^3$ with a
  complete two-sided negatively pinched Kähler metric and no bounded holomorphic map to $bb(C)^3$ with everywhere
  nonzero Jacobian. That domain retains two nonconstant bounded base-coordinate functions.
  Its conclusion concerns bounded coordinate tuples, whereas Theorem 1 concerns every individual bounded
  holomorphic function. The two proofs are independent; no result of the companion is used below.

=== 1.2 The construction and its main obstacles <the-construction-and-its-main-obstacles>

We first separate curvature from bounded-function rigidity.
  Starting with a smooth strictly plurisubharmonic potential $ell$ on $bb(C)_s^n times bb(C)_y$, consider

#[#set math.equation(numbering: n => "(1.2)")
 $ cal(T) = { \( s \, y \, w \) : "Im" w > ell \( s \, y \) } \, wide g =
   partial macron(partial) \[ - log \( "Im" w - ell \( s \, y \) \) \] . $ <eq:intro-tube>]

The final complex dimension is $m = n + 2$: there are $n$ spatial variables, one fiber variable $y$,
  and the tube variable $w$. If the potential metric of $ell$ is complete and has nonpositive real sectional
  curvature, then the tube metric is complete and satisfies $"Sec"_g lt.eq - 1$.
  Lemma 2 proves this by comparing the curvature with that of complex hyperbolic space.
  Thus we must construct a complete nonpositively curved potential metric while placing selected large holomorphic
  disks in its tube.

The disks detect derivatives of bounded holomorphic functions.
  They lie over finite sets of spatial points obtained from a homogeneous polynomial system $\( H_N \, p_N \)$ of
  degree $N$, where $H_N$ has $n - 1$ components and $p_N$ is scalar.
  The grid consists of selected common zeros of $H_N$ in projective space $bb(P)^(n - 1)$ at which $p_N$ is
  nonzero. We use the standard unitary-invariant Gaussian polynomial ensemble and its determinant-weighted
  zero-density formulas, developed by Bleher, Shiffman, and Zelditch #cite(label("BleherShiffmanZelditch2000"))
  Theorem 2.1 and Sections 2.2 and 2.4. The distribution of random zeros was studied by Shiffman and Zelditch
  #cite(label("ShiffmanZelditch1999")); Shiffman’s later simultaneous-zero theorem
  #cite(label("Shiffman2008Convergence")) Corollary 1.3 includes equidistribution of the unpruned grids used here.
  We prove the needed special cases locally and add quantitative derivative, separation, and lift estimates.

There are on the order of $N^(n - 1)$ projective grid points.
  An affine lift of such a point is a representative $v in bb(C)^n$ normalized by $p_N \( v \) = 1$.
  Its $N$ lifts are $e^(2 pi i q \/ N) v$, $0 lt.eq q < N$, and form a root-of-unity cycle.
  Averaging around a cycle separates Taylor degrees modulo $N$.
  In a sufficiently large fixed dimension, the evaluation vectors of the first few surviving homogeneous terms
  span only a small fraction of the space of values at the grid points.
  Independent phases assigned to the cycles then keep a prescribed low-degree jet uniformly away from that
  subspace. Each testing disk keeps $s$ fixed while varying $y$ and $w$ with a phase-dependent slope.
  Cauchy’s estimate on the large disks turns this separation into exponential decay of the Taylor coefficients of
  $f_w = partial f \/ partial w$ for every bounded holomorphic $f$.
  Repeating each jet test at heights that grow slowly relative to the decay exponent,
  and applying the three-lines theorem, forces $f_w = 0$. The function then descends to a bounded entire function
  on $bb(C)^(n + 1)$ and is constant. Proposition 8 states the exact disk conditions separately from their realization.

The geometric obstacle is to produce those large disks without losing curvature control when their centers and
  directions vary. For the radial fiber we use a partial Legendre transform,
  in the circle-invariant bundle framework of Calabi #cite(label("Calabi1979")) Section 3 and the momentum
  formulation of Hwang and Singer #cite(label("HwangSinger2002")) Section 2.1.
  Our profile varies over the spatial base; the additional spatial-derivative terms must be controlled for every
  real two-plane. The Legendre transform exposes six curvature blocks.
  We test their contraction on Hermitian matrices of rank at most two;
  every real two-plane produces a matrix in this class. This rank restriction keeps all trace losses independent
  of dimension. A steep fiber profile supplies positive margins in the negative curvature tensor.
  They absorb the spatial polynomial wells and small nonholomorphic shear coefficients, from the fiber axis to infinity.

Successive tests require different fiber centers. A direct center motion is not a holomorphic coordinate change
  and can destroy the near-axis estimates. We align the jets of two radial spatial metrics,
  temporarily widen the fiber profile, move the center while this width is available,
  and restore the profile with a controlled constant offset.
  Each period of rapid spatial growth occupies a finite interval and is followed by a capped growth regime,
  so no finite spatial radius is lost to blowup. Finally, every stage reserves bounds for all future wells.
  The local estimates therefore apply to the final potential on entire fibers and preserve every previously
  installed disk.

Sections 2 and 3 establish the curvature transfer and the analytic testing criterion.
  Section 4 derives the Legendre metric and curvature formulas.
  Section 5 gives the profile and shear estimates; Sections 6 and 7 supply the aligned spatial geometry and center
  motion. Section 8 fixes the constants before choosing the dimension, carries out the global recursion,
  proves completeness, and concludes Theorem 1.

=== 1.3 Conventions and uniformity <conventions-and-uniformity>

We measure squared lengths using the Hermitian metric matrix:
  $\| v \|_g^2 = g_(i macron(j)) v^i overline(v^j)$ for the complex components of a real tangent vector.
  In particular a potential $ell$ has metric matrix $\( ell_(i macron(j)) \)$.
  This convention gives sectional curvatures between $- 4$ and $- 1$ for the ball potential $-
  log \( 1 - \| z \|^2 \)$. For the same complex Hessian, the companion #cite(label("OpenAIPinchedThreefold2026"))
  Section 2 uses twice this real metric; its complex-hyperbolic sectional-curvature interval is therefore
  $\[ - 2 \, - 1 \/ 2 \]$. The negative Hermitian curvature tensor is denoted by $C = - R$;
  its coordinate formula and relation to real sectional curvature are given in Section 4.

The symbols $O \( dot.op \)$, $lt.tilde$, and $asymp$ denote respectively a constant-factor bound, an upper bound,
  and two-sided positive bounds. Dependencies are stated when the bound is introduced.
  Tensor jets are measured in fixed affine coordinates at the point, using operator or multilinear norms,
  rather than sums of their entries. Hermitian test matrices carry the Frobenius norm.
  For a rank at most two test $T$ and a Hermitian form $Q$ this gives

$ \| Q : T \| lt.eq sqrt(2) thin parallel Q parallel thin \| T \| . $

The constants that determine the analytic exponent gaps and the eventual dimension are independent of dimension.
  Constants used after the dimension has been fixed may depend on it.
  The order of choices is specified in Section 8; every choice respects that order of dependence.

== 2 The tube transfer <sec:tube>

We first separate the passage to uniformly negative curvature from the construction of the base metric.
  Write $z = \( z^1 \, dots.h \, z^(n + 1) \)$ for the base coordinates and $w = u +
  i v$ for one additional complex coordinate. For a smooth real function $phi.alt$, our metric convention is

#[#set math.equation(numbering: n => "(2.1)")
 $ \| X \|_(g_phi.alt)^2 = sum_(a \, b) phi.alt_(a macron(b)) thin d z^a \( X \) overline(d z^b \( X \)) \, wide
   phi.alt_(a macron(b)) = frac(partial^2 phi.alt, partial z^a partial macron(z)^b) . $ <tube:metric-convention>]

Thus the potential $\| z \|^2$ gives the Euclidean real metric, without an additional factor of two. We use

$ d^c phi.alt = - d phi.alt compose J = i \( macron(partial) phi.alt - partial phi.alt \) \, wide
  2 partial phi.alt = d phi.alt + i thin d^c phi.alt . $

The real curvature tensor is normalized so that $R \( X \, Y \, Y \, X \)$ is the sectional-curvature numerator
  and the unit sphere has positive curvature.

#thm([Lemma 2.1.])[
  (Tube transfer).  #emph[Let $ell : bb(C)^(n + 1) arrow.r bb(R)$ be smooth and strictly plurisubharmonic.
    Suppose that its potential metric $g_ell$, in Convention (2.1),
    is complete and has nonpositive real sectional curvature. Set
#[#set math.equation(numbering: n => "(2.2)")
 $ cal(T)_ell = { \( z \, w \) in bb(C)^(n + 1) times bb(C) : b \( z \, w \) := "Im" w - ell \( z \) > 0 } \, wide
   g_(cal(T)) = g_(- log b) . $ <tube:domain>]

 Then $cal(T)_ell$ is connected and simply connected, indeed diffeomorphic to $bb(R)^(2 n + 4)$,
   and $g_(cal(T))$ is a complete Kähler metric satisfying
$ "Sec"_(g_(cal(T))) lt.eq - 1 . $

 No lower curvature bound on $g_ell$ is required.]
] <tube:transfer>

#proof[
  #emph[Topology and the metric.] The map
  $ \( z \, u \, b \) mapsto \( z \, u + i \( ell \( z \) + b \) \) $
  is a smooth diffeomorphism from $bb(C)^(n + 1) times bb(R) times \( 0 \, oo \)$ onto $cal(T)_ell$.
    The claimed topology follows, for example by using $log b$ as the last real coordinate.
  Let $pi \( z \, w \) = z$. Differentiating the potential gives, as Hermitian forms,
  #[#set math.equation(numbering: n => "(2.3)")
   $ g_(cal(T)) = b^(- 1) pi^(*) g_ell + b^(- 2) partial b ⊗ accent(partial b, ‾) . $ <tube:complex-decomposition>]
  Here $d^c v = - d u$, and consequently
  $ 2 partial b = d b - i \( d u + d^c ell \) . $
  In real notation Equation (2.3) is
  #[#set math.equation(numbering: n => "(2.4)")
   $ #box(stroke: black, inset: 3pt, [$ quad g_(cal(T)) = b^(- 1) pi^(*) g_ell +
     frac(d b^2 + \( d u + d^c ell \)^2, 4 b^2) . quad $]) $ <tube:real-decomposition>]
  The pullback in the first term is implicit when evaluating forms from the base.
    In particular, the sign before $d^c ell$ is positive with the convention above.
    Formula (2.3) is positive definite: its first summand controls the base component,
    and on a vector with zero base component its second summand controls the remaining complex $w$ component.
    Being the complex Hessian of a smooth potential, it is Kähler.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  merge-path({bezier((-3.45, 1.53), (0, 0.8925), (-2.53, 0.3825), (-1.208, 0.4675)); bezier((0, 0.8925), (3.45, 1.232), (1.208, 1.317), (2.53, 0.5525)); line((3.45, 1.232), (3.45, 3.528), (-3.45, 3.528))}, close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((-3.967, 0), (4.025, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.025, 0), [$z$], anchor: "west", padding: 0.1176cm)
  line((-3.852, -0.085), (-3.852, 3.74), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((-3.852, 3.74), [$v$], anchor: "south", padding: 0.1176cm)
  bezier((-3.45, 1.53), (0, 0.8925), (-2.53, 0.3825), (-1.208, 0.4675), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((0, 0.8925), (3.45, 1.232), (1.208, 1.317), (2.53, 0.5525), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((2.07, 0.697), [$v= ell (z)$], anchor: "north", padding: 0.1176cm)
  line((0, 0), (0, 0.8925), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 0.935), (0, 2.592), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((0, 1.764), [$b=v- ell (z)$], anchor: "west", padding: 0.1176cm)
  circle((0, 2.652), radius: 0.05644, fill: black, stroke: none)
  content((0, 2.652), [$(z,w)$], anchor: "south-west", padding: 0.1176cm)
  content((-2.012, 3.017), [$cal(T)_ ell :#h(0.3333em) b>0$])
})],
    caption: [Figure 1: A schematic real slice of the tube. The coordinate $b = v - ell \( z \)$ is the positive vertical gap; $u$ and the other base directions are suppressed. No convexity of the graph is assumed. ],
  ) <tube:geometry>
  #emph[Completeness.] Let $gamma$ be a locally piecewise smooth curve of finite $g_(cal(T))$-length,
    with its parameter tending to an endpoint. Equation (2.4) gives
  $ frac(\| d b \( dot(gamma) \) \|, 2 b) lt.eq \| dot(gamma) \|_(g_(cal(T))) . $
  Thus $log b$ has finite total variation. In particular, along this curve there are constants $0 < b_(-) lt.eq
    b lt.eq b_(+) < oo$, and $b$ has a positive limit. The same metric identity implies
  $ \| \( pi compose gamma \)' \|_(g_ell) lt.eq sqrt(b_(+)) thin \| dot(gamma) \|_(g_(cal(T))) . $
  The base projection therefore has finite length and converges by completeness of $g_ell$.
    Its image has compact closure. On that compact set $\| d^c ell \|_(g_ell)$ is bounded by some constant $C$, so
  $ \| u' \| lt.eq \| \( d u + d^c ell \) \( dot(gamma) \) \| + \| d^c ell \( \( pi compose gamma \)' \) \| lt.eq
    2 b_(+) \| dot(gamma) \|_(g_(cal(T))) + C \| \( pi compose gamma \)' \|_(g_ell) . $
  Hence $u$ also converges. Since $v = b + ell \( z \)$, the curve has a limit in $cal(T)_ell$.
    This finite-length criterion proves metric completeness. Indeed,
    a Cauchy sequence without a limit would have a subsequence whose successive distances are less than $2^(- j)$;
    joining successive points by paths of length less than $2^(1 - j)$ would produce a finite-length curve without
    a limit.
  #emph[The curvature comparison.] For a Hermitian matrix $g = \( g_(a macron(b)) \)$ arising from a Kähler
    potential, denote its Hermitian curvature components by
  #[#set math.equation(numbering: n => "(2.5)")
   $ cal(R)_(a macron(b) c macron(d))^g = - partial_a partial_(macron(b)) g_(c macron(d)) +
     sum_(p \, q) g^(p macron(q)) \( partial_a g_(c macron(q)) \) \( partial_(macron(b)) g_(p macron(d)) \) .
     $ <tube:hermitian-curvature>]
  We record explicitly how these components determine the real sectional numerator in our normalization.
    If $xi^a = d z^a \( X \)$ and $eta^a = d z^a \( Y \)$, set
  $ T^(a macron(b)) = i \( xi^a macron(eta)^b - eta^a macron(xi)^b \) . $
  Expansion of $X = sum_a \( xi^a partial_(z^a) + macron(xi)^a partial_(macron(z)^a) \)$ and similarly of $Y$,
    using the Kähler curvature symmetries, gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ R_g \( X \, Y \, Y \, X \) & = cal(R)^g \( xi \, macron(xi) \, eta \, macron(eta) \) -
     "Re" cal(R)^g \( xi \, macron(eta) \, xi \, macron(eta) \)\
 & = 1 / 2 sum_(a \, b \, c \, d) cal(R)_(a macron(b) c macron(d))^g T^(a macron(b)) T^(c macron(d)) .
   $ <tube:real-complex-curvature>]
  The factor $1 \/ 2$ reflects that the complexification of the real metric satisfies
    $g \( partial_(z^a) \, partial_(macron(z)^b) \) = g_(a macron(b)) \/ 2$.
  Fix a point of the tube over a base point $z_0$. Choose holomorphic Kähler normal coordinates on the base,
    centered at $z_0$, so that $\( ell_(a macron(b)) \)$ is the identity and its first derivatives vanish there.
    Such coordinates follow by a linear normalization followed by a quadratic holomorphic change of coordinates;
    the Kähler symmetry makes the quadratic coefficients symmetric in their two holomorphic indices.
    The mixed terms of total degree three in the potential then vanish.
    Subtracting the real part of a holomorphic polynomial of degree at most three removes its remaining
    nonconstant pure terms. This subtraction is absorbed by a holomorphic translation of $w$:
    if $ell = ell_0 + "Re" H$, replace $w$ by $w - i H$. Thus in the adapted coordinates the base potential has
    three-jet
  $ c + \| z \|^2 . $
  Compare the tube potential at this point with
  #[#set math.equation(numbering: n => "(2.7)")
   $ Phi_0 = - log \( "Im" w - c - \| z \|^2 \) . $ <tube:model-potential>]
  The two metrics and their first derivatives agree at the point.
    Their cubic contractions in Equation (2.5) therefore agree.
    In the fourth potential derivatives the only difference is the term $b^(- 1)
    ell_(a macron(b) c macron(d))$ with all four indices in the base.
    The base cubic contractions vanish in the normal coordinates, so
  #[#set math.equation(numbering: n => "(2.8)")
   $ cal(R)^(g_(cal(T))) - cal(R)^(g_(Phi_0)) = b^(- 1) pi^(*) cal(R)^(g_ell) wide
     upright("at the comparison point") . $ <tube:hermitian-transfer>]
  Applying Equation (2.6) gives the corresponding identity of real sectional numerators:
  #[#set math.equation(numbering: n => "(2.9)")
   $ R_(g_(cal(T))) \( X \, Y \, Y \, X \) & = R_(g_(Phi_0)) \( X \, Y \, Y \, X \)\
 & quad + b^(- 1) R_(g_ell) \( d pi X \, d pi Y \, d pi Y \, d pi X \) . $ <tube:real-transfer>]
  In particular, the extra term is nonpositive for every real pair $X \, Y$.
    This remains true when their base projections are linearly dependent, in which case that term is zero.
    The comparison metrics agree at the point, so the sectional-curvature denominators also agree.
  #emph[The model normalization.] Put $tilde(w) = w - i c$. The Cayley coordinates
  $ \( cal(Z) \, cal(W) \) = (frac(2 z, tilde(w) + i) \, frac(tilde(w) - i, tilde(w) + i)) $
  satisfy
  $ 1 - \| cal(Z) \|^2 - \| cal(W) \|^2 = frac(4 \( "Im" tilde(w) - \| z \|^2 \), \| tilde(w) + i \|^2) . $
  Consequently the potential in Equation (2.7) equals $- log \( 1 - \| cal(Z) \|^2 - \| cal(W) \|^2 \)$ up to a
    pluriharmonic summand and a constant. Our comparison point has $z = 0$.
    A real translation of $tilde(w)$ and a dilation $\( z \, tilde(w) \)
    mapsto \( z \/ sqrt(r) \, tilde(w) \/ r \)$, $r > 0$, are model isometries and place it at $\( 0 \, i \)$,
    which the Cayley map sends to the ball origin.
  Writing $Z$ for all the ball coordinates, expansion of $- log \( 1 - \| Z \|^2 \)$ at zero gives
  $ g_(a macron(b)) \( 0 \) = delta_(a b) \, wide partial g_(a macron(b)) \( 0 \) = 0 \, wide
    cal(R)_(a macron(b) c macron(d))^(g_(Phi_0)) \( 0 \) = - \( delta_(a b) delta_(c d) + delta_(a d) delta_(c b) \) . $
  For real orthonormal $X \, Y$ at the origin, their complex components $xi \,
    eta$ have norm one and satisfy $"Re" chevron.l xi \, eta chevron.r = 0$.
    Write $chevron.l xi \, eta chevron.r = i beta$, where $\| beta \| lt.eq 1$. Equation (2.6) now gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ "Sec"_(g_(Phi_0)) \( X and Y \) = - 1 - 3 beta^2 in \[ - 4 \, - 1 \] . $ <tube:model-sectional>]
  Combining Equations (2.9) and (2.10) proves $"Sec"_(g_(cal(T))) lt.eq - 1$ on all real planes. ◻
]

The same comparison also explains why this construction need not have a lower sectional-curvature bound.

#thm([Corollary 2.2.])[
  #emph[Under the hypotheses of Lemma 2, suppose that $g_ell$ has a real two-plane of strictly negative sectional
    curvature at some point. Then
$ inf "Sec"_(g_(cal(T))) = - oo . $

]
] <tube:negative-plane>

#proof[
  Let $X \, Y$ be an orthonormal basis of such a base plane $sigma$.
    At a point above it with height $b$, the distribution
  $ cal(H) = ker d b ∩ ker \( d u + d^c ell \) $
  is $J$-invariant, and $d pi$ identifies its metric with $b^(- 1) g_ell$.
    If $hat(X) \, hat(Y)$ are the horizontal lifts of $X \, Y$, then $sqrt(b) thin hat(X) \,
    sqrt(b) thin hat(Y)$ are $g_(cal(T))$-orthonormal. Equation (2.9) and the model computation give the exact formula
  $ "Sec"_(g_(cal(T))) \( hat(X) and hat(Y) \) = - 1 - 3 g_ell \( J X \, Y \)^2 + b "Sec"_(g_ell) \( sigma \) . $
  Letting $b arrow.r oo$ proves the assertion. ◻
]

== 3 Polynomial tests for bounded holomorphic functions <sec:analytic>

We will force the $w$-derivative of every bounded holomorphic function $f$ on the tube to vanish.
  The elementary estimate comes from a holomorphic disk through a point $\( s_0 \, zeta \, w_0 \)$:

$ t mapsto \( s_0 \, zeta + t \, w_0 + i alpha b t \) \, wide \| t \| < L \, wide alpha \, L > 0 \, quad \| b \| = 1 . $

If this disk lies in the tube and $\| f \| lt.eq 1$, Cauchy’s inequality gives

$ \| f_y \( s_0 \, zeta \, w_0 \) + i alpha b f_w \( s_0 \, zeta \, w_0 \) \| lt.eq L^(- 1) . $

We must prevent the two derivatives from canceling at many spatial points.
  We arrange those points in root-of-unity cycles and hold $b$ constant on each cycle.
  A finite Fourier average then keeps only Taylor degrees in one residue class.
  The phases will separate the prescribed lowest-degree part of $f_w$ from the first few surviving terms of $f_y$,
  with one phase choice valid for every polynomial of that degree.

The grids constructed below provide equidistributed projective directions for polynomial sampling and cyclic
  affine lifts for this extraction. Their additional separation and shell estimates will be used in Section 8 to
  localize the shear coefficients in disjoint spatial neighborhoods when realizing the disks.
  After constructing the grids and choosing the phases, we formulate the precise disk conditions and prove that
  repeated tests force the holomorphic Liouville property.

Throughout this section, $sigma$ denotes the unitary-invariant probability measure on $bb(P)^(n - 1)$.
  All norms on vectors and derivatives are Euclidean unless indicated otherwise.
  Constants may depend on the fixed dimension $n$; the exponents in the separation estimate below do not.

=== 3.1 Polynomial grids and their affine lifts <polynomial-grids-and-their-affine-lifts>

#thm([Lemma 3.1.])[
  (Homogeneous polynomial grids).  #emph[Fix $n gt.eq 2$. For every sufficiently large integer $N$ one can choose
    a system of homogeneous polynomials of degree $N$,
$ Q_N = \( H_N \, p_N \) : bb(C)^n arrow.r bb(C)^(n - 1) times bb(C) \, $

 with the following properties. These choices can be made along all integers $N arrow.r oo$,
   or along any prescribed sequence of degrees tending to infinity.]
  + #emph[There is a constant $C_n$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ N^(- C_n) lt.eq \| Q_N \( u \) \| lt.eq N wide \( \| u \| = 1 \) . $ <grid:sphere-bounds>]

]
  + #emph[The projective zero set of $H_N$ consists of $M_N = N^(n - 1)$ transverse points.
    A subset $cal(G)_N$ of these points satisfies
$ \| cal(G)_N \| = \( 1 - o \( 1 \) \) M_N \, wide 1 / M_N sum_(xi in cal(G)_N) delta_xi med harpoon.rt med sigma . $

 For every $xi in cal(G)_N$ and every unit representative $u$ of $xi$,
#[#set math.equation(numbering: n => "(3.2)")
 $ N^(- 1) lt.eq \| p_N \( u \) \| lt.eq N \, wide "sing"_min #scale(x: 120%, y: 120%)[\(] D
   H_N \( u \) \|_(u^perp) #scale(x: 120%, y: 120%)[\)] gt.eq N^(- 1) . $ <grid:goodness>]

]
  + #emph[Above each $xi in cal(G)_N$, choose any lift $v_xi$ such that $p_N \( v_xi \) = 1$. All $N$ lifts
$ e^(2 pi i q \/ N) v_xi \, wide 0 lt.eq q < N \, $

 have radii in $\[ N^(- 1 \/ N) \, N^(1 \/ N) \]$. With the absolute choice $k_(*) = 30$,
   the Euclidean balls of radius $2 N^(- k_(*))$ about all these lifts are pairwise disjoint.
   If $v$ is one of the lifts, then
#[#set math.equation(numbering: n => "(3.3)")
 $ \| \( H_N \( z \) \, p_N \( z \) - 1 \) \| gt.eq N^(- k_(*) - 10) quad upright("when") quad
   N^(- k_(*)) lt.eq \| z - v \| lt.eq 2 N^(- k_(*)) . $ <grid:shell-bound>]

 In a neighborhood of radius $4 N^(- k_(*))$ of every such lift,
   the first and second derivatives of $Q_N$ have norm $O_n \( N^5 \)$.]
  #emph[In particular, weak approximation to any prescribed finite collection of continuous test functions,
    with any fixed positive accuracy, can be required by taking $N$ sufficiently large.]
] <grid:polynomials>

#proof[
  We use the standard unitary-invariant Gaussian ensemble of homogeneous polynomials;
    its covariance and conditional zero-density framework appear in
    #cite(label("BleherShiffmanZelditch2000"), form: "prose") Sections 2.2 and 2.4.
    The proof below supplies the needed formulas and all additional quantitative grid properties.
    Randomness is used only to establish existence. A standard circular complex Gaussian has density $pi^(- 1)
    e^(- \| z \|^2)$ on $bb(C)$. Choose the components of $Q_N$ independently, with
  $ Q_N^(\( a \)) \( z \) = sum_(\| beta \| = N) (frac(N !, beta !))^(1 \/ 2) g_(a \, beta) z^beta \, wide
    bb(E) #scale(x: 120%, y: 120%)[\[] Q_N^(\( a \)) \( z \) overline(Q_N^(\( a \)) \( u \))
    #scale(x: 120%, y: 120%)[\]] = \( z dot.op macron(u) \)^N . $
  Here all $g_(a \, beta)$ are independent standard circular complex Gaussians.
    The covariance identity is the multinomial formula. In particular,
    at a unit vector the components of $Q_N$ are independent standard complex Gaussians,
    and the law is invariant under unitary changes of coordinates.
  We first prove (3.1) with probability tending to one. If $A = sup_(\| z \| = 1) \| Q_N \( z \) \|$,
    homogeneity gives $sup_(\| z \| lt.eq 1 + 1 \/ N) \| Q_N \( z \) \| lt.eq e A$.
    Cauchy’s inequality on complex lines therefore bounds the first derivative on the unit sphere by $C N A$,
    with an absolute constant $C$. A sphere net of mesh $c \/ N$, with a sufficiently small absolute $c$,
    consequently contains a point where the norm is at least $A \/ 2$.
    Such a net has $O_n \( N^(2 n - 1) \)$ points. Gaussian tails show
  $ bb(P) \( A > N \) lt.eq C'_n N^(2 n - 1) e^(- c'_n N^2) arrow.r 0 . $
  On the event $A lt.eq N$, the Lipschitz constant on the sphere is at most $C N^2$.
    Use a second net of mesh $c N^(- C_n - 2)$. If the norm somewhere on the sphere is less than $N^(- C_n)$,
    it is less than $2 N^(- C_n)$ at a point of this net. A standard complex Gaussian vector in $bb(C)^n$ has
    probability at most $C'_n r^(2 n)$ of lying in a ball of radius $r$. The union bound is therefore at most
  $ C'_n N^(\( C_n + 2 \) \( 2 n - 1 \) - 2 n C_n) = C'_n N^(- C_n + 4 n - 2) . $
  Choose, for example, $C_n = 8 n$. This proves both sphere bounds with probability tending to one.
  Put $d = n - 1$. Almost surely the projective zeros of the $d$-component system $H_N$ are transverse.
    To see this directly, let $cal(A)$ be its finite-dimensional complex coefficient space.
    Evaluation at any point of $bb(P)^d$ maps $cal(A)$ onto the fiber of $cal(O) \( N \)^(xor d)$.
    Hence the universal zero incidence manifold is smooth, and a coefficient vector is a regular value of its
    projection to $cal(A)$ precisely when the corresponding section has only transverse zeros.
    Sard’s theorem gives a Lebesgue-null exceptional set; the Gaussian law is absolutely continuous.
    Transversality and compactness imply that the zero set is finite.
    The projective Bézout theorem for a zero-dimensional intersection of $d$ hypersurfaces of degrees $N \,
    dots.h \, N$ gives total intersection number $N^d$; every transverse intersection has multiplicity one
    #cite(label("EisenbudHarris2000GeometrySchemes")) Theorem III-71.
    Thus the number of zeros is the deterministic quantity $M_N = N^d$ almost surely.
  We next justify the counting formulas needed for equidistribution.
    They are the one- and two-point, zero-dimensional cases of the correlation formula in
    #cite(label("BleherShiffmanZelditch2000"), form: "prose") Theorem 2.1.
    Our subsequent off-diagonal argument proves the particular convergence needed here;
    the more general simultaneous-zero convergence theorem of
    #cite(label("Shiffman2008Convergence"), form: "prose") Corollary 1.3 supplies a broader context.
    In a holomorphic coordinate chart of $bb(P)^d$, regard the system as a holomorphic map $H_a \( z \)$ depending
    linearly on its coefficients. Locally split those coefficients as $\( a \, b \)$ so that
  $ H_(a \, b) \( z \) = E \( z \) a + R \( z \, b \) \, wide det E \( z \) eq.not 0 . $
  This is possible because evaluation is surjective. The equation $H_(a \, b) \( z \) = 0$ is equivalent to $a =
    A \( z \, b \) := - E \( z \)^(- 1) R \( z \, b \)$. At a zero, with $J = D_z H_(a \, b) \( z \)$,
  $ D_z A = - E \( z \)^(- 1) J . $
  For fixed $b$, the change-of-variables formula with multiplicity for $z mapsto
    A \( z \, b \)$ thus introduces the real Jacobian $\| det E \|^(- 2) \| det J \|^2$.
    Integrating in $b$ against the smooth Gaussian coefficient density yields the one-point zero density
  #[#set math.equation(numbering: n => "(3.4)")
   $ rho_(1 \, N) \( z \) = p_(H_N \( z \)) \( 0 \) thin bb(E) #scale(x: 120%, y: 120%)[\[] \| det D
     H_N \( z \) \|^2 divides H_N \( z \) = 0 #scale(x: 120%, y: 120%)[\]] . $ <grid:one-point-density>]
  The same argument works with a bounded measurable mark multiplying the zero count.
    It first applies to nonnegative marks, and the general bounded case follows by decomposition.
  For two distinct projective points, joint evaluation onto the two fibers is surjective.
    Indeed, powers of linear forms that vanish at one point and not the other give independent prescribed values
    for each component. Solve now for $2 d$ coefficient variables and apply the same change of variables in the
    two point coordinates. The point Jacobian is block diagonal, giving
  #[#set math.equation(numbering: n => "(3.5)")
   $ rho_(2 \, N) \( z \, z' \) =  & p_(\( H_N \( z \) \, H_N \( z' \) \)) \( 0 \, 0 \)\
 & quad dot.op bb(E) #scale(x: 120%, y: 120%)[\[] \| det D H_N \( z \) \|^2 \| det D H_N \( z' \) \|^2 divides
   H_N \( z \) = H_N \( z' \) = 0 #scale(x: 120%, y: 120%)[\]] . $ <grid:two-point-density>]
  Partitions of unity give these formulas on projective space and on the complement of its diagonal, respectively.
    This derivation uses only the coefficient density and ordinary change of variables;
    no independence of zeros has been assumed.
  At a point represented by a unit vector $u$, take affine tangent coordinates $u +
    sum_(j = 1)^d z_j e_j$ with $\( e_j \)$ orthonormal in $u^perp$.
    Differentiating the covariance shows that $H_N \( u \)$ is independent of $N^(- 1 \/ 2) D
    H_N \( u \) \|_(u^perp)$, and that the latter is a $d times
    d$ matrix of independent standard complex Gaussians. At two distinct projective points,
    the cross-covariances of these normalized value and first-derivative data tend to zero locally uniformly off
    the diagonal. More explicitly, on a compact set of pairs with $\| u dot.op macron(v) \| lt.eq rho < 1$,
    they are bounded by a fixed power of $N$ times $rho^(N - 2)$.
    This follows by differentiating $\( u dot.op macron(v) \)^N$ at most once at each point.
    The joint Gaussian covariance consequently converges uniformly there to the direct sum of its one-point
    covariances. Conditional Gaussian covariances given the values zero converge as well.
    Gaussian moments of the fixed polynomials $\| det J \|^2$ and their products therefore converge.
    Equations (3.4) and (3.5) imply that the two-point density, divided by $M_N^2$,
    converges locally uniformly off the diagonal to the product of the normalized one-point densities.
  The exact total number of zeros lets us pass from off-diagonal decorrelation to weak convergence without
    estimating the two-point density near the diagonal. Let
  $ mu_N = 1 / M_N sum_(H_N \( xi \) = 0) delta_xi . $
  Unitary invariance and the deterministic count imply $bb(E) mu_N = sigma$.
    The positive measure $bb(E) \( mu_N ⊗ mu_N \)$ has total mass one.
    Off the diagonal, its density converges to that of $sigma ⊗ sigma$, by the preceding calculation.
    This implies convergence on the whole product: given $epsilon > 0$,
    choose a compact subset of the off-diagonal region having $\( sigma ⊗ sigma \)$-mass greater than $1 -
    epsilon$. Its mass under $bb(E) \( mu_N ⊗ mu_N \)$ is greater than $1 -
    2 epsilon$ for all sufficiently large $N$. At most $2 epsilon$ of the total mass can remain elsewhere.
    Since the diagonal has zero $\( sigma ⊗ sigma \)$-mass, there is no additional limiting mass there. Thus
  $ bb(E) \( mu_N ⊗ mu_N \) harpoon.rt sigma ⊗ sigma . $
  For every continuous test function, its integral against $mu_N$ therefore has variance tending to zero.
    This proves weak convergence to $sigma$ in probability.
  It remains to discard the bad zeros. Use (3.4) with marks.
    If $G$ is a $d times d$ standard complex Gaussian matrix,
    then at a zero the derivative condition in (3.2) fails only when $"sing"_min \( G \) < N^(- 3 \/ 2)$.
    Its expected discarded fraction is
  $
    frac(bb(E) #scale(x: 120%, y: 120%)[\[] \| det G \|^2 bold(1)_({ "sing"_min \( G \) < N^(- 3 \/ 2) })
    #scale(x: 120%, y: 120%)[\]], bb(E) \| det G \|^2) arrow.r 0 . $
  Indeed a Gaussian square matrix is nonsingular almost surely, $\| det G \|^2$ is integrable,
    and dominated convergence applies. The independent polynomial $p_N$ has a standard complex Gaussian value at
    every unit representative. Its two forbidden tails have probability
  $ bb(P) \( \| p_N \| < N^(- 1) \) + bb(P) \( \| p_N \| > N \) = 1 - e^(- N^(- 2)) + e^(- N^2) arrow.r 0 . $
  Markov’s inequality shows that the total discarded fraction tends to zero in probability.
    Removing that fraction does not alter weak convergence. The modulus and singular-value conditions are
    unchanged on multiplying a unit representative by a phase, so they hold for every such representative.
  We may now select deterministic systems. Take a countable uniformly dense family of continuous functions on
    projective space, and impose successively accurate conditions on successively longer finite subfamilies.
    Convergence in probability, the vanishing bad fraction, and the probability-one transversality statement show
    that these conditions and (3.1) have a nonempty intersection for every sufficiently large degree.
    Choose one system from that intersection. A diagonal choice gives all the asserted limits and works equally
    well along any prescribed sequence of degrees.
  We have obtained the projective sampling properties. It remains to provide disjoint neighborhoods in which
    Section 8 can localize its shear coefficients. Fix a good direction and a lift $v$ with $p_N \( v \) = 1$.
    Homogeneity and (3.2) give $N^(- 1 \/ N) lt.eq \| v \| lt.eq N^(1 \/ N)$.
    In the splitting of the domain into the radial complex line and its Hermitian orthogonal complement,
    $D H_N \( v \)$ vanishes on the radial line, while $D p_N \( v \)$ has radial derivative $N \/ \| v \|$.
    The transverse derivative of $H_N$ has least singular value at least $N^(- 4)$ for large $N$:
    the scaling from a unit representative costs at most one additional factor $N$,
    so this is a deliberately weaker bound than necessary. Homogeneity, the sphere upper bound,
    and Cauchy’s inequality at scale $c \/ N$ give first- and second-derivative bounds $O_n \( N^5 \)$ in the
    stated neighborhood. At the lift itself, the transverse first derivatives are $O_n \( N^4 \)$.
    Block inversion therefore gives
  $ parallel D \( H_N \, p_N - 1 \) \( v \)^(- 1) #scale(x: 120%, y: 120%)[parallel] lt.eq N^9 $
  for all sufficiently large $N$. Taylor’s formula, uniformly for $\| z - v \| lt.eq 4 N^(- 30)$, now yields
  $ \| \( H_N \( z \) \, p_N \( z \) - 1 \) \| gt.eq N^(- 9) \| z - v \| - C'_n N^5 \| z - v \|^2 gt.eq 1 /
    2 N^(- 9) \| z - v \| . $
  This proves (3.3). It also excludes every other zero of $\( H_N \, p_N - 1 \)$ within distance $4 N^(- 30)$,
    proving disjointness of the balls about all good lifts. ◻
]

=== 3.2 Choosing phases uniformly for a fixed Taylor order <choosing-phases-uniformly-for-a-fixed-taylor-order>

The grids now supply many separated evaluation points. Their next role is linear algebraic:
  we choose a phase at each projective point so that no fixed-order polynomial jet can be hidden among the first
  few Taylor degrees surviving a root-of-unity average. The independent-phase moment calculation is the same
  quadratic-form identity used for random-phase trace estimates in
  #cite(label("IitakaEbisuzaki2004"), form: "prose"). The additional rank and polynomial superlevel estimates give
  one phase choice uniformly for an entire coefficient space.

#thm([Lemma 3.2.])[
  (Phases separate low-degree jets).  #emph[Fix positive integers $k \, n$, with $n gt.eq 2$, such that
#[#set math.equation(numbering: n => "(3.6)")
 $ sum_(j = 1)^(k - 1) frac(j^(n - 1), \( n - 1 \) !) < 1 / 100 . $ <grid:dimension-choice>]

 Fix a nonnegative integer $h$. For sufficiently large polynomial grids from Lemma 4,
   choose one lift $v_xi$ above each good direction and let $V_N subset
   bb(C)^(cal(G)_N)$ be the space of evaluation vectors of sums of homogeneous polynomials of degrees
$ h \, med h + N \, med dots.h \, med h + \( k - 1 \) N . $

 Let $Pi_N$ be orthogonal projection onto $V_N$ for the unweighted Euclidean point norm.
   There are phases $b_xi$, $\| b_xi \| = 1$, and a constant $delta_h > 0$,
   independent of $N$ and of the chosen lift phases, such that
#[#set math.equation(numbering: n => "(3.7)")
 $ M_N^(- 1 \/ 2) ∥\( 1 - Pi_N \) #scale(x: 120%, y: 120%)[\(] b_xi P \( v_xi \)
   #scale(x: 120%, y: 120%)[\)]_(xi in cal(G)_N)∥ gt.eq delta_h parallel P parallel $ <grid:phase-lower-bound>]

 for every homogeneous polynomial $P$ of degree $h$. Here $parallel P
   parallel$ is any fixed Euclidean norm on its coefficient space, chosen independently of the grid.
   All required grid accuracies and degree thresholds depend only on the fixed $n \, k \, h$ and this norm.]
] <grid:phases>

#proof[
  Dimension gives
  $ frac("rank" Pi_N, M_N) lt.eq N^(1 - n) sum_(j = 0)^(k - 1) binom(h + j N + n - 1, n - 1) < 2 / 100 $
  for all sufficiently large $N$. Indeed its limit is the sum in (3.6).
  There is a number $t_h > 0$ such that, on every sufficiently accurate grid,
    every polynomial with $parallel P parallel = 1$ satisfies
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| P \( v_xi \) \| > t_h quad upright("at at least ") 0.8 M_N upright(" good directions") .
     $ <grid:uniform-superlevel>]
  For completeness, a nonzero homogeneous polynomial has a projective zero set of $sigma$-measure zero.
    In affine charts this is the elementary fact that the zero set of a nonzero complex polynomial has Lebesgue
    measure zero, obtained by induction and Fubini’s theorem.
    Thus, for each norm-one polynomial $P$, some positive threshold has a superlevel set of measure greater than
    $0.9$. Uniform continuity in the coefficients makes the same superlevel estimate, with a smaller threshold,
    valid in a neighborhood of $P$. The coefficient unit sphere is compact,
    so finitely many such neighborhoods suffice and their thresholds have a positive common lower bound.
    Weak convergence of the grid measures applied to these finitely many open superlevel sets gives the estimate
    for unit representatives, with a fixed margin in both threshold and counting proportion.
    Since $\| v_xi \|^h arrow.r 1$ uniformly, it gives (3.8).
    This proof requires only finitely many fixed approximation conditions for the given $h$.
  The projection has $0 lt.eq \( Pi_N \)_(xi xi) lt.eq 1$ and diagonal sum less than $0.02 M_N$.
    Consequently at most $0.04 M_N$ diagonal entries exceed $1 \/ 2$.
    Choose the $b_xi$ temporarily as independent uniform phases. Writing $Q'_N = 1 - Pi_N$, independence gives
  $ & bb(E) [M_N^(- 1) ∥Q'_N #scale(x: 120%, y: 120%)[\(] b_xi P \( v_xi \) #scale(x: 120%, y: 120%)[\)]_xi∥^2]\
 & #h(25mm)  = M_N^(- 1) sum_xi #scale(x: 120%, y: 120%)[\(] 1 - \( Pi_N \)_(xi xi)
   #scale(x: 120%, y: 120%)[\)] \| P \( v_xi \) \|^2 gt.eq 0.38 t_h^2 $
  when $parallel P parallel = 1$. The last inequality uses the intersection of the $0.8
    M_N$ indices in (3.8) with the complement of the at most $0.04 M_N$ high-leverage indices.
  We need a single phase choice for all polynomials, rather than a choice depending on $P$.
    Let $\( e_a \)$ be a fixed orthonormal basis of the degree-$h$ coefficient space, and put $q_a \( xi \) =
    e_a \( v_xi \)$. These evaluations have a common bound depending only on $n \, h$ and the chosen norm.
    The Gram matrix of the random linear map in (3.7) has entries
  $ G_(a b) = M_N^(- 1) sum_(xi \, eta) overline(q_a \( xi \)) thin overline(b_xi) \( Q'_N \)_(xi eta) b_eta
    q_b \( eta \) . $
  Its diagonal-index terms are deterministic. For distinct indices,
    the products $overline(b_xi) b_eta$ are orthonormal in $L^2$ of the phase probability space:
    two such ordered products have nonzero inner product only when their ordered pairs agree.
    In particular, reversal of the pair gives expectation $bb(E) \( overline(b_xi)^(thin 2) b_eta^2 \) = 0$.
    It follows that
  $ bb(E) \| G_(a b) - bb(E) G_(a b) \|^2 & lt.eq C_(n \, h) M_N^(- 2) sum_(xi eq.not eta) \| \( Pi_N \)_(xi eta) \|^2\
 & lt.eq C_(n \, h) M_N^(- 2) "rank" Pi_N = O_(n \, h) \( M_N^(- 1) \) . $
  The Gram matrix has fixed finite size. Chebyshev’s inequality therefore implies that its operator-norm distance
    from its mean tends to zero in probability. Its mean is bounded below by $0.38 t_h^2$ times the identity.
    A phase choice with least eigenvalue at least $0.19 t_h^2$ exists for every sufficiently large grid.
    Taking $delta_h = sqrt(0.19) thin t_h$ proves the assertion.
    All estimates used only absolute values of lift evaluations,
    so the threshold and lower bound are uniform over their arbitrary representative phases. ◻
]

#prodef([Remark 3.3.])[
  For every fixed $k$, condition (3.6) holds in some sufficiently large finite dimension.
    Indeed, with $r = n - 1$, its left side is bounded by $\( k - 1 \)^(r + 1) \/ r !$,
    which tends to zero as $r arrow.r oo$. The argument will use one such fixed dimension,
    not an assertion in every dimension.
] <grid:finite-dimension>

=== 3.3 From disk estimates to the holomorphic Liouville property <from-disk-estimates-to-the-holomorphic-liouville-property>

#thm([Lemma 3.4.])[
  (Root-of-unity extraction).  #emph[Let $0 lt.eq h < N$, and suppose $g$ is holomorphic on a neighborhood of the
    closed ball $\| s \| lt.eq S$, with $\| g \| lt.eq K$ there.
    Write $g = sum_(r gt.eq 0) g_r$ for its homogeneous Taylor expansion at zero. If $R \| v \| < S$, then
$ 1 / N sum_(q = 0)^(N - 1) e^(- 2 pi i h q \/ N) g \( R e^(2 pi i q \/ N) v \) =
  sum_(j gt.eq 0) g_(h + j N) \( R v \) . $

 If $R \| v \| \/ S lt.eq e^(- 0.99 c \/ N)$ and $c gt.eq 1$, truncating the sum after $j = k -
   1$ has error at most $C K e^(- 0.99 k c)$, while retaining just the term $g_h \( R v \)$ has error at most $C K
   e^(- 0.99 c)$. The constant $C$ is absolute, independent of $N \, h \, R \, S$.]
] <grid:frequency>

#proof[
  Cauchy’s inequality on the complex line through $v$ gives
  $ \| g_r \( R v \) \| lt.eq K \( R \| v \| \/ S \)^r . $
  The homogeneous expansion converges absolutely at the evaluation points.
    The finite Fourier average annihilates every degree not congruent to $h$ modulo $N$, giving the identity.
    Put $theta = R \| v \| \/ S$. The first tail is bounded by
  $ K sum_(j = k)^oo theta^(h + j N) lt.eq frac(K e^(- 0.99 k c), 1 - e^(- 0.99 c)) . $
  The case $k = 1$ gives the other estimate. The denominator is bounded away from zero for $c gt.eq 1$. ◻
]

We now convert these finite-dimensional estimates into the analytic condition needed by the geometric
  construction. A large sheared disk bounds a linear combination of the $y$- and $w$-derivatives.
  The phases separate the degree-$h$ part of the latter from the former.
  Heights $D_j$ growing more slowly than the accuracy parameters $c_j$ will let the three-lines theorem turn
  smallness at those heights into vanishing.

#thm([Proposition 3.5.])[
  (A testing criterion for the holomorphic Liouville property).  #emph[Fix constants $p_0 \, p_1 gt.eq
    0$ and $m_0 > p_1$. Choose an integer $k$ and a finite dimension $n gt.eq 2$ so that
#[#set math.equation(numbering: n => "(3.9)")
 $ 0.99 k > p_0 + p_1 + 1 \, wide sum_(r = 1)^(k - 1) frac(r^(n - 1), \( n - 1 \) !) < 0.01 . $ <grid:exponent-choice>]

 Let $\( zeta_j \, h_j \)$ be a sequence of pairs from a countable dense subset of an open disk in $bb(C)$ and the
   nonnegative integers, with every pair repeated infinitely often.
   At stage $j$, choose numbers $R_j gt.eq 1$, $c_j gt.eq 1$, an integer $N_j > h_j$,
   and a grid from Lemma 4 sufficiently large and accurate for Lemma 5 at order $h_j$. Set
$ S_j = R_j e^(c_j \/ N_j) \, wide log N_j lt.eq c_j \/ 100 . $

 Choose heights $D_j$ and positive numbers $alpha_j$ such that
$ alpha_j^(- 1) lt.eq e^(p_1 c_j) \, $

 and, along the repetitions of every fixed pair,
#[#set math.equation(numbering: n => "(3.10)")
 $ c_j arrow.r oo \, wide D_j arrow.r oo \, wide D_j / c_j arrow.r 0 . $ <grid:height-rates>]

 There are phases $b_(j \, xi)$, one per good projective direction and constant throughout its cycle of lifts,
   with the following property.]
  #emph[Let $ell$ be a smooth real function on $bb(C)^n times bb(C)$, and let
$ cal(T) = { \( s \, y \, w \) : "Im" w > ell \( s \, y \) } . $

 Suppose every stage satisfies these conditions:]
  + #emph[On $\| s \| lt.eq S_j$,
#[#set math.equation(numbering: n => "(3.11)")
 $ ell \( s \, zeta_j \) lt.eq D_j - 2 . $ <grid:height-gap>]

]
  + #emph[For every holomorphic $f$ on $cal(T)$ with $\| f \| lt.eq 1$, every $w$ with $"Im" w = D_j$,
    and every $\| s \| = S_j$,
#[#set math.equation(numbering: n => "(3.12)")
 $ \| f_y \( s \, zeta_j \, w \) \| lt.eq e^(p_0 c_j) . $ <grid:sphere-derivative>]

]
  + #emph[For every good direction $xi$, every lift $v = e^(2 pi i q \/ N_j) v_xi$,
    and every $w$ on that height line, the holomorphic disk
#[#set math.equation(numbering: n => "(3.13)")
 $ t mapsto #scale(x: 120%, y: 120%)[\(] R_j v \, med zeta_j + t \, med w +
   i alpha_j b_(j \, xi) t #scale(x: 120%, y: 120%)[\)] \, wide \| t \| < e^(m_0 c_j) \, $ <grid:sheared-disk>]

 is contained in $cal(T)$.]
  #emph[Then every bounded holomorphic function on $cal(T)$ is constant.
    The phases depend only on the grids and their assigned jet orders, not on $ell$, $f$, or $w$.]
] <grid:criterion>

#proof[
  For each stage choose the phases supplied by Lemma 5. Assign its phase to all $N_j$ lifts of the same direction.
    We prove the assertion for a holomorphic function with $\| f \| lt.eq 1$, which suffices by constant rescaling.
  Fix a stage and temporarily omit its subscript. For each $w$ with $"Im" w = D$, put
  $ A \( s \) = f_y \( s \, zeta \, w \) \, wide I \( s \) = i f_w \( s \, zeta \, w \) . $
  Both are holomorphic on a neighborhood of the closed spatial ball $\| s \| lt.eq S$,
    by the strict height margin and compactness. The maximum principle and (3.12) give $\| A \| lt.eq
    e^(p_0 c)$ on the ball. The unit $w$-disk centered at any $\( s \, zeta \, w \)$ in this ball lies in
    $cal(T)$, by (3.11); Cauchy’s inequality gives $\| I \| lt.eq 1$.
    On a sheared disk, the derivative at $t = 0$ is $A \( R v \) + alpha b_xi I \( R v \)$. Thus
  #[#set math.equation(numbering: n => "(3.14)")
   $ \| A \( R v \) + alpha b_xi I \( R v \) \| lt.eq e^(- m_0 c) . $ <grid:node-inequality>]
  Every estimate so far is uniform in the real part of $w$.
  For each good direction take the Fourier average in Lemma 7 over its cycle.
    Since $b_xi$ is constant on that cycle, it factors out of the averaged second term of (3.14).
    The lift radius bound gives
  $ frac(R \| v_xi \|, S) lt.eq exp (frac(log N - c, N)) lt.eq e^(- 0.99 c \/ N) . $
  Let $a$ and $i'$ be the resulting vectors of averaged $A$ and $I$ values, respectively.
    There is a vector $a_0 in V_N$ such that
  $ parallel a - a_0 parallel_oo lt.eq C e^(\( p_0 - 0.99 k \) c) . $
  If $P$ is the homogeneous degree-$h$ Taylor term of the function $s mapsto I \( R s \)$, then
  $ parallel i' - \( P \( v_xi \) \)_xi #scale(x: 120%, y: 120%)[parallel]_oo lt.eq C e^(- 0.99 c) . $
  The averaged node inequalities still have supremum norm at most $e^(- m_0 c)$.
    Apply $1 - Pi_N$ and use $a_0 in V_N$. Since the number of good directions is at most $M_N$,
    conversion from the supremum norm to $M_N^(- 1 \/ 2)$ times Euclidean norm costs at most one.
    Lemma 5 consequently gives
  $ alpha delta_h parallel P parallel & lt.eq e^(- m_0 c) + C e^(\( p_0 - 0.99 k \) c) + C alpha e^(- 0.99 c) \,\
parallel P parallel & lt.eq C_h (e^(\( p_1 - m_0 \) c) + e^(\( p_1 + p_0 - 0.99 k \) c) + e^(- 0.99 c)) . $
  In particular, with the fixed positive number
  $ epsilon = min { m_0 - p_1 \, med 0.99 k - p_0 - p_1 \, med 0.99 } \, $
  we have
  #[#set math.equation(numbering: n => "(3.15)")
   $ parallel P parallel lt.eq C_h e^(- epsilon c) . $ <grid:jet-decay>]
  The constants are independent of the stage once $h$ is fixed.
    This is exactly the uniformity in Lemma 5; the Fourier tail denominator is $1 - e^(- 0.99 c)$, not $1 -
    e^(- 0.99 c \/ N)$. Since every degree-$h$ coefficient of $I \( R s \)$ is $R^h$ times the corresponding
    coefficient of $I \( s \)$ and $R gt.eq 1$, (3.15) bounds each degree-$h$ coefficient of
    $f_w \( s \, zeta \, w \)$ by the same exponential rate.
  We have obtained exponential decay for every coefficient of the prescribed degree,
    uniformly along the entire horizontal $w$-line. It remains to bring that estimate down from the growing
    testing heights to a fixed open part of the tube.
  Fix now a scheduled center $zeta$ and a multiindex $beta$ of length $h$. The coefficient
  $ g_beta \( w \) = frac(1, beta !) partial_s^beta f_w \( 0 \, zeta \, w \) $
  is holomorphic on the whole connected half-plane $"Im" w > ell \( 0 \, zeta \)$.
    At every point of this half-plane a spatial neighborhood is available,
    so the derivative is well-defined and holomorphic there. Choose once a small closed spatial polydisk about
    zero and a number $t_0$ exceeding the supremum of $ell \( s \, zeta \)$ on that polydisk by more than two.
    Cauchy’s inequalities in $s$ and on a unit $w$-disk give
  $ \| g_beta \( w \) \| lt.eq B_beta wide \( "Im" w gt.eq t_0 \) \, $
  where $B_beta$ is independent of every testing stage and of $"Re" w$.
    Along the stages assigned to $\( zeta \, h \)$, (3.15) gives
  $ sup_("Im" w = D_j) \| g_beta \( w \) \| lt.eq C_h e^(- epsilon c_j) . $
  For any fixed $t > t_0$, apply Hadamard’s three-lines theorem #cite(label("Tropp2022")) Theorem 7.13 to the
    horizontal strip between heights $t_0$ and $D_j$, once $D_j > t$.
    Writing $theta_j = \( t - t_0 \) \/ \( D_j - t_0 \)$, it yields
  $ sup_("Im" w = t) \| g_beta \( w \) \| lt.eq B_beta^(thin 1 - theta_j) \( C_h e^(- epsilon c_j) \)^(theta_j) . $
  If $B_beta = 0$ there is nothing to prove. Otherwise, the logarithm of the right side is
  $ log B_beta + frac(t - t_0, D_j - t_0) #scale(x: 120%, y: 120%)[\(] log \( C_h \/ B_beta \) -
    epsilon c_j #scale(x: 120%, y: 120%)[\)] arrow.r - oo $
  by (3.10). Hence $g_beta$ vanishes in the upper half-plane and, by the identity theorem,
    throughout $"Im" w > ell \( 0 \, zeta \)$. Repeating this argument for each order proves that all spatial
    Taylor coefficients of $f_w$ at zero vanish at every scheduled center.
    Dependence of the constants and of the preliminary height $t_0$ on the order causes no difficulty:
    each order has its own infinite sequence, and analytic continuation gives the same full half-plane afterwards.
  To pass from these statements to a common open set, choose a spatial ball about zero and an open subdisk of the
    center disk, both with compact closures. Choose $L$ larger than the supremum of $ell$ on their product.
    On the product with $"Im" w > L$, the function $f_w$ is jointly holomorphic.
    At each scheduled center in the subdisk, all of its spatial Taylor coefficients vanish for every such $w$.
    Taylor uniqueness and the identity theorem on the spatial ball give vanishing on that ball.
    Continuity in $y$ and density of the scheduled centers then give vanishing on the whole product.
    The tube is connected: the coordinates
  $ \( s \, y \, "Re" w \, "Im" w - ell \( s \, y \) \) $
  identify it with $bb(C)^(n + 1) times bb(R) times \( 0 \, oo \)$.
    The several-variable identity theorem therefore gives $f_w = 0$ everywhere on $cal(T)$.
  For every fixed $\( s \, y \)$ the $w$-fiber is a connected half-plane, so $f$ is constant along that fiber.
    It descends to a bounded function $F$ on $bb(C)^(n + 1)$. This descended function is holomorphic:
    near any base point choose a single constant $w_0$ whose imaginary part exceeds the supremum of $ell$ on a
    small base neighborhood, and write $F \( s \, y \) = f \( s \, y \, w_0 \)$ there.
    These local holomorphic definitions agree on overlaps by fiber constancy.
    Liouville’s theorem, applied on complex lines in $bb(C)^(n + 1)$, makes $F$, and therefore $f$, constant. ◻
]

#prodef([Remark 3.6.])[
  Condition (3.12) follows immediately if, at the stated sphere points and heights,
    the unsheared $y$-disk of radius $e^(- p_0 c_j)$ lies in the tube.
    Thus the criterion asks the geometric construction for only three quantitative facts:
    a height bound on a spatial ball, sufficiently wide unsheared disks on its boundary,
    and much wider disks in the prescribed sheared directions at its polynomial nodes.
    The phase choices are made before any bounded holomorphic function is considered.
] <grid:geometric-interface>

== 4 The fiber Legendre transform and its curvature <sec:fiber>

The analytic criterion leaves us a geometric task: construct the base potential while retaining explicit curvature
  margins for later changes. We first derive the metric and its six curvature blocks for a fixed fiber center.
  The partial Legendre transform uses, up to our fixed metric normalization,
  the fiber momentum of the circle-invariant constructions of Calabi and Hwang–Singer #cite(label("Calabi1979"))
  #cite(label("HwangSinger2002")). We allow the radial profile to vary over the spatial base,
  which adds spatial-derivative terms to the curvature. We compute the full tensor before estimating these
  additional terms.

All spatial derivatives in this section are taken with the fiber momentum $tau$ fixed,
  unless a different convention is stated explicitly. The spatial variables are $s = \( s_1 \, dots.h \, s_n \)$,
  and the fiber variable is $y in bb(C)$. Its center $zeta$ is constant in this section.
  Let $q \( x \, s \) > 0$, where $x = log tau$, and choose $F$ by

#[#set math.equation(numbering: n => "(4.1)")
 $ F_x = q^(- 1) \, wide lim_(x arrow.r - oo) \( F \( x \, s \) - x \) = 0 . $ <fiber:F>]

We assume that this normalization is possible, that $F arrow.r + oo$ as $x arrow.r + oo$, and that $q$,
  regarded as a function of $tau$, is smooth at zero with $q \( 0 \, s \) = 1$.
  All these statements are local uniformly in $s$. For smooth real functions $B \, psi$, set

#[#set math.equation(numbering: n => "(4.2)")
 $ U \( s \, tau \) & = B \( s \) + tau psi \( s \) - integral_0^tau F \( log v \, s \) thin d v \,\
rho & = log \| y - zeta \|^2 = F \( log tau \, s \) - psi \( s \) \,\
ell_(upright("rad")) & = U + tau rho = B + integral_0^tau q \( log v \, s \)^(- 1) thin d v . $ <fiber:U>]

The last identity follows by integration by parts; the boundary term $v F \( log v \, s \)$ tends to zero as $v
  arrow.b 0$. Since $F_x > 0$ and its endpoint limits are infinite with the indicated signs,
  (4.2) determines a unique $tau > 0$ for every $y eq.not zeta$.

Hereafter $C = - R$ denotes the negative Hermitian curvature tensor:

#[#set math.equation(numbering: n => "(4.3)")
 $ C_(alpha macron(beta) gamma macron(delta)) = partial_alpha partial_(macron(beta)) g_(gamma macron(delta)) -
   g^(mu macron(nu)) \( partial_alpha g_(gamma macron(nu)) \) \( partial_(macron(beta)) g_(mu macron(delta)) \) .
   $ <fiber:curvature-convention>]

The sectional-curvature sign associated with this convention is verified below; in particular,
  positivity of the relevant contractions of $C$ means nonpositive Riemannian sectional curvature.

#thm([Lemma 4.1.])[
  (Metric and regularity of the Legendre transform).  #emph[Write
$ P = tau q \, wide V = \( B_(i macron(j)) \) \, wide G = \( psi_(i macron(j)) \) \, wide
  h = \( U_(i macron(j)) \) \, wide cal(N) = h_tau . $

 Where $h > 0$, the complex Hessian of $ell_(upright("rad"))$ is
#[#set math.equation(numbering: n => "(4.4)")
 $ h_(i macron(j)) thin d s_i thin d macron(s)_j + P lr(|d log \( y - zeta \) + U_(tau i) thin d s_i|)^2 .
   $ <fiber:metric-form>]

 It is positive off the axis. Its spatial Schur complement is exactly $h$.
   The potential and its complex Hessian extend smoothly across $y = zeta$;
   on that axis the Hessian in the original splitting is $V xor e^psi$, and is positive whenever $V > 0$.]
] <fiber:metric>

#proof[
  Use the holomorphic coordinate $z_0 = log \( y - zeta \)$, so that $rho = z_0 + macron(z)_0$.
    Differentiating $U_tau + rho = 0$ gives
  $ U_(tau tau) = - P^(- 1) \, wide partial_(z_0) tau = P \, wide partial_(s_i) tau = P U_(tau i) . $
  Differentiation of $ell = U + tau rho$ now gives
  $ g_(0 macron(0)) = P \, wide g_(i macron(0)) = P U_(tau i) \, wide g_(i macron(j)) = h_(i macron(j)) +
    P U_(tau i) U_(tau macron(j)) \, $
  which is (4.4). For regularity, write $F = log tau + f \( tau \, s \)$.
    The equation $f_tau = \( q^(- 1) - 1 \) \/ tau$, with $f \( 0 \, s \) = 0$, shows that $f$ is smooth.
    Equation (4.2) becomes $tau e^(f \( tau \, s \)) = e^psi \| y - zeta \|^2$.
    Its derivative with respect to $tau$ at zero is one, so the smooth implicit-function theorem applies.
    In particular, $tau = e^psi \| y - zeta \|^2 + O \( \| y - zeta \|^4 \)$.
    Substitution in (4.2) proves the stated extension and axis metric. ◻
]

We use a local holomorphic change $z_0 mapsto z_0 + f \( s \)$ to make $U_(tau i) = 0$ at a specified point.
  The corresponding change of $U$ is linear in $tau$ with a pluriharmonic spatial coefficient;
  it leaves $h$ and $cal(N)$ unchanged. The quadratic jet of $f$ can also make $U_(tau i k) = 0$ there.
  We call these the tilted logarithmic coordinates. The coordinate changes used to evaluate a jet are held fixed
  while that jet is differentiated.

#thm([Lemma 4.2.])[
  (The six curvature blocks).  #emph[In tilted logarithmic coordinates, the tensor (4.3) has the following blocks:
#[#set math.equation(numbering: n => "(4.5)")
 $ A := C_(0 macron(0) 0 macron(0)) & = P^2 P_(tau tau) - \| partial P \|_h^2 \,\
A_i := C_(i macron(0) 0 macron(0)) & = P #scale(x: 120%, y: 120%)[\(] partial_i
  P_tau - \( cal(N) h^(- 1) partial P \)_i #scale(x: 120%, y: 120%)[\)] \,\
W_(i macron(j)) := C_(i macron(j) 0 macron(0)) & = P #scale(x: 120%, y: 120%)[\(] partial_i partial_(macron(j))
  log P + P_tau cal(N)_(i macron(j)) - P \( cal(N) h^(- 1) cal(N) \)_(i macron(j)) #scale(x: 120%, y: 120%)[\)] \,\
C_(i macron(0) k macron(0)) & = \( nabla_h^(2 \, 0) P \)_(i k) \,\
K_(i k macron(j)) := C_(i macron(j) k macron(0)) & = P nabla_i^h cal(N)_(k macron(j)) + P_i cal(N)_(k macron(j)) +
  P_k cal(N)_(i macron(j)) \,\
L_(i macron(j) k macron(l)) := C_(i macron(j) k macron(l)) & = C_(i macron(j) k macron(l))^h +
  P \( cal(N)_(i macron(j)) cal(N)_(k macron(l)) + cal(N)_(i macron(l)) cal(N)_(k macron(j)) \) . $ <fiber:blockA>]

 Here $C^h$ and $nabla^h$ are the curvature with sign (4.3) and the Kähler connection of the fixed-$tau$ spatial
   metric. Index positions in the products use the indicated Hermitian metric, with the usual conjugations.]
] <fiber:blocks>

#proof[
  In addition to the tilt, first choose spatial coordinates normal for $h$ at the point.
    On functions of $\( s \, tau \)$, physical coordinate derivatives act as
  $ D_i = partial_i + P U_(tau i) partial_tau \, wide D_0 = P partial_tau \, $
  and their conjugates. At the point the complete list of cubic entries needed below is
  #[#set math.equation(numbering: n => "(4.6)")
   $ ell_(00 macron(0)) = P P_tau \, quad ell_(i 0 macron(0)) = P_i \, quad ell_(00 macron(j)) = P_(macron(j)) \,
     quad ell_(i 0 macron(j)) = P cal(N)_(i macron(j)) \, quad ell_(i k macron(0)) = 0 \, quad
     ell_(i k macron(j)) = 0 . $ <fiber:cubics>]
  For example, the identity $P^2 partial_tau U_(tau i) = P_i$,
    obtained by spatial differentiation of $U_(tau tau) = - 1 \/ P$,
    and its conjugate give the second and third entries. Directly differentiating the metric entries before
    evaluating gives
  $ D_0 D_(macron(0)) P & = P \( P_tau^2 + P P_(tau tau) \) \,\
D_i D_(macron(0)) P & = P_i P_tau + P partial_i P_tau \,\
D_i D_(macron(j)) P & = P_(i macron(j)) + P cal(N)_(i macron(j)) P_tau \,\
D_i D_(macron(j)) \( P U_(tau k) \) & = P_i cal(N)_(k macron(j)) + P_k cal(N)_(i macron(j)) +
  P partial_i cal(N)_(k macron(j)) \,\
D_i D_(macron(j)) \( h_(k macron(l)) + P U_(tau k) U_(tau macron(l)) \) & =
  partial_i partial_(macron(j)) h_(k macron(l)) + P cal(N)_(i macron(j)) cal(N)_(k macron(l)) +
  P cal(N)_(i macron(l)) cal(N)_(k macron(j)) . $
  For completeness, the fourth derivative giving the spin block has a cancellation which is useful later.
    Put $a_i = U_(tau i)$. Before evaluation,
  $ ell_(i k macron(0)) = P a_(i k) + P_i a_k + P_k a_i + P P_tau a_i a_k . $
  At the point $a_i = a_(i k) = 0$, while
  $ \( a_i \)_tau = P_i \/ P^2 \, wide \( a_(i k) \)_tau = P_(i k) \/ P^2 - 2 P_i P_k \/ P^3 . $
  Applying $D_(macron(0)) = P partial_tau$ therefore gives $P_(i k)$:
    the two positive terms $P_i P_k \/ P$ cancel the negative doubled term.
  Subtract the cubic contractions in (4.3). For A the vertical contraction is $P
    P_tau^2$ and the spatial one is $\| partial P \|_h^2$. For $A_i$ they are $P_i
    P_tau$ and $P \( cal(N) h^(- 1) partial P \)_i$. For $W$ they are $P_i P_(macron(j)) \/
    P$ and $P^2 \( cal(N) h^(- 1) cal(N) \)_(i macron(j))$. The first combines with $P_(i macron(j))$ to give $P
    partial_i partial_(macron(j)) log P$. For the purely spatial block the contraction is the one defining $C^h$.
    These calculations prove all formulas in normal spatial coordinates.
    Without spatial normalization, the last entry of (4.6) is $partial_i h_(k macron(j))$;
    its contractions replace $P_(i k)$ by $nabla_i^h partial_k P$ and $partial_i
    cal(N)_(k macron(j))$ by $nabla_i^h cal(N)_(k macron(j))$.
    This also verifies the displayed tensorial formulas in general spatial coordinates. ◻
]

The six blocks give the complete tensor, but the desired sign concerns real sectional curvature.
  The next lemma identifies the matrix tests corresponding to real two-planes and records exactly how much of the
  diagonal curvature can absorb each mixed block.

We specify the norm convention needed to keep all subsequent constants independent of $n$.
  The norm of a covariant tensor is its multilinear operator norm on unit vectors in the stated fixed frame.
  The norm of a Hermitian test matrix is its Frobenius norm.
  Thus, for a Hermitian matrix $T$ of rank at most two and a covariant Hermitian form $Q$,

#[#set math.equation(numbering: n => "(4.7)")
 $ \| Q : T \| lt.eq sqrt(2) parallel Q parallel thin \| T \| . $ <fiber:ranknorm>]

Indeed diagonalize $T$; the sum of the absolute values of its at most two nonzero eigenvalues is at most
  $sqrt(2) \| T \|$. The same decomposition bounds a curvature pairing $C \( T \, T \)$ by $2 parallel C
  parallel \| T \|^2$. Contractions of cubic tensors through an inverse metric can instead be regarded as inner
  products of two covectors. Their operator bounds therefore involve no summation factor depending on the dimension.

#thm([Lemma 4.3.])[
  (Real planes and rank-two absorption).  #emph[If $C \( H \, H \) gt.eq
    0$ for every Hermitian contravariant matrix $H$ of rank at most two,
    the underlying real sectional curvatures are nonpositive.
    Write the spatial, cross, and fiber diagonal blocks of $H$ as $T \, b_times \, t$. The contraction has the terms
#[#set math.equation(numbering: n => "(4.8)")
 $ A t^2 + 2 t \( W : T \) + 2 W \( b_times \, macron(b)_times \) + L \( T \, T \) \, $ <fiber:contraction>]

 and its other terms have absolute value at most
#[#set math.equation(numbering: n => "(4.9)")
 $ 2 \| nabla_h^(2 \, 0) P \( b_times \, b_times \) \| + 4 \| t A_i b_times^i \| +
   4 \| \( K : T \) b_times \| . $ <fiber:otherterms>]

 In particular the following quantitative criterion suffices.
   Suppose $A > 0$, $W > 0$, and a nonnegative quadratic form $cal(R) \( T \)$ satisfies
#[#set math.equation(numbering: n => "(4.10)")
 $ L \( T \, T \) - frac(\| W : T \|^2, .98 A) & gt.eq cal(R) \( T \) \,\
\| nabla_h^(2 \, 0) P \( b \, b \) \| & lt.eq 1 / 4 W \( b \, macron(b) \) \,\
\| A_i b^i \| & lt.eq eta sqrt(A W \( b \, macron(b) \)) \,\
\| \( K : T \) b \| & lt.eq eta sqrt(cal(R) \( T \) W \( b \, macron(b) \)) \, $ <fiber:reserve>]

 for all such tests, where $eta lt.eq 1 \/ 100$. Then
#[#set math.equation(numbering: n => "(4.11)")
 $ C \( H \, H \) gt.eq .01 A t^2 + W \( b_times \, macron(b)_times \) + 1 / 2 cal(R) \( T \) . $ <fiber:retained>]

 All constants are independent of dimension.]
] <fiber:ranktwo>

#proof[
  For real vectors with $\( 1 \, 0 \)$ parts $v \, w$, set $H = i \( v ⊗ macron(w) - w ⊗ macron(v) \)$.
    This is Hermitian of rank at most two. Kähler symmetry gives
  $ C \( H \, H \) = 2 { C \( v \, macron(v) \, w \, macron(w) \) - "Re" C \( v \, macron(w) \, v \, macron(w) \) } . $
  Expand $R \( v + macron(v) \, w + macron(w) \, w + macron(w) \, v + macron(v) \)$.
    The only four nonzero terms are the two alternating type patterns and their conjugates.
    In the convention in which a real vector with complex components $v$ has squared length $g_(i macron(j)) v^i
    macron(v)^j$, the complex bilinear extension of the real metric on a holomorphic and an antiholomorphic vector
    is one half the Hermitian pairing. Accordingly the real curvature numerator is $- 1 / 2 C \( H \, H \)$.
    This proves the sign assertion. Expanding a general block matrix $H$ gives (4.8)–(4.9);
    each mixed conjugate pair accounts for its factor two or four. A principal block $T$ has rank at most two.
  For the quantitative assertion use $2 t \( W : T \) gt.eq - .98 A t^2 - \| W : T \|^2 \/ \( .98 A \)$.
    The remaining diagonal coefficient is .02A. The spin term costs at most $W \/ 2$. The other two terms obey
  $ 4 eta \| t \| sqrt(A W) lt.eq .01 A t^2 + 400 eta^2 W \, wide 4 eta sqrt(cal(R) W) lt.eq 1 / 2 cal(R) +
    8 eta^2 W . $
  Since $1.5 - 408 eta^2 gt.eq 1$ when $eta lt.eq 1 \/ 100$, (4.11) follows. ◻
]

#thm([Lemma 4.4.])[
  (Exact perturbation identity).  #emph[In any fixed holomorphic coordinates let $H$ denote the cubic jet viewed
    as a map from two tangent inputs to a covector, and write $H = Gamma g$.
    For a perturbation with $g + Delta g > 0$, the change of the cubic contraction $H g^(- 1) H^(*)$ is exactly
#[#set math.equation(numbering: n => "(4.12)")
 $ Gamma Delta H^(*) + Delta H Gamma^(*) -
   Gamma Delta g
   Gamma^(*) + \( Delta H - Gamma Delta g \) \( g + Delta g \)^(- 1) \( Delta H - Gamma Delta g \)^(*) .
   $ <fiber:perturbformula>]

 Consequently, if $parallel g^(- 1) Delta g parallel$ in metric-unit axes is at most one half,
   the inverse of the perturbed metric is at most twice that of $g$, and
#[#set math.equation(numbering: n => "(4.13)")
 $ parallel Delta C parallel lt.eq  & parallel Delta j^4 ell parallel +
   2 parallel Gamma parallel parallel Delta H parallel + parallel Gamma parallel^2 parallel Delta g parallel\
 & +
   2 parallel g^(- 1)
   parallel \( parallel Delta H parallel + parallel Gamma parallel parallel Delta g parallel \)^2 .
   $ <fiber:perturbbound>]

 The same bound, with an absolute factor, controls rank-two contractions.]
] <fiber:perturbation>

#proof[
  Set $Q = Delta H - Gamma Delta g$. Then $H + Delta H = Gamma \( g + Delta g \) + Q$.
    Multiply out the corresponding cubic contraction and subtract $Gamma g Gamma^(*)$.
    The two cross terms and $Gamma Delta g Gamma^(*)$ combine to give the first three terms in (4.12).
    Taking operator norms gives (4.13). The inverse comparison is the elementary spectral estimate for $I +
    g^(- 1 \/ 2) Delta g g^(- 1 \/ 2)$; the final statement uses (4.7) twice. ◻
]

== 5 A spatially varying quiet fiber profile <sec:quiet>

We now choose a radial fiber profile that tolerates spatial variation of its parameters.
  Its steep part gives the curvature margins needed near the testing disks;
  its logarithmic tail keeps the whole affine fiber available.
  After establishing the scalar estimates, we use the six-block formulas to prove a uniform curvature criterion
  and then show that it survives localized shear terms.

Fix $b_0 gt.eq 1000$ and $K_0 gt.eq 1$; increasing $K_0$ later is allowed.
  Define a positive function $u$ of $tau > 0$ by

#[#set math.equation(numbering: n => "(5.1)")
 $ u = tau exp (integral_0^tau frac(\( 1 + v \)^(- 1 \/ 16) - 1, v) thin d v) . $ <quiet:u>]

It satisfies $u \/ tau arrow.r 1$ at zero and $d log u \/ d log tau = \( 1 + tau \)^(- 1 \/ 16)$.
  It is increasing, is comparable to $tau$ on $\( 0 \, 1 \]$, and tends to a finite positive limit at infinity:
  the last assertion follows by integrating $\( 1 + tau \)^(- 1 \/ 16) d tau \/ tau$ from 1 to infinity.
  More specifically, convexity gives $\( 1 + v \)^(- 1 \/ 16) gt.eq 1 - v \/ 16$, whence $e^(- 1 \/ 16) tau lt.eq
  u lt.eq tau$ for $0 < tau lt.eq 1$. For a real parameter $E$, called the severity, set

#[#set math.equation(numbering: n => "(5.2)")
 $ q = q_0 \( x \, E \) = \( 1 + e^E u \)^(b_0) + K_0^(- 1) log \( 1 + tau \) \, wide x = log tau . $ <quiet:q>]

Constants in this section may depend on $b_0 \, K_0$, but are independent of the spatial dimension.
  A lower threshold for $E$ will always be chosen sufficiently large for these constants.
  The primitive $F$ has the normalization (4.1). Because $q - 1 = O_E \( tau \)$ at zero,
  this normalization exists. Because $q$ grows only linearly in $x$ at the right end, $F arrow.r + oo$ there.

#thm([Lemma 5.1.])[
  (Scalar estimates for the profile).  #emph[Put
$ q_a = \( 1 + e^E u \)^(b_0) \, quad r = r_q = q_x \/ q \, quad D = D_q = \( q_x + q_(x x) \) \/ q =
  r \( 1 + r \) + r_x \, quad e_0 = q_E \/ q . $

 For all sufficiently large $E$ and all $tau > 0$,
#[#set math.equation(numbering: n => "(5.3)")
 $ q gt.eq 1 \, quad q_x > 0 \, quad D gt.eq r \( r + 1 / 2 \) \, quad q_(x x) \/ q_x gt.eq - 1 / 16 \,\
0 < r lt.eq C \, quad \| e_0 \| + \| q_(E E) \/ q \| lt.eq C \, quad \| r_E \| lt.eq C r . $ <quiet:slopes>]

 For $tau lt.eq 1$, the first two quantities in the middle of (5.3) are also at most $C r$. For $1 lt.eq j lt.eq 4$,
#[#set math.equation(numbering: n => "(5.4)")
 $ \| partial_E^j F \| + \| partial_E^j macron(F) \| lt.eq C \, wide macron(F) \( tau \, E \) =
   tau^(- 1) integral_0^tau F \( log v \, E \) thin d v . $ <quiet:Fderivatives>]

 For $0 lt.eq j lt.eq 4$ and $tau gt.eq e^(- E \/ 4)$,
#[#set math.equation(numbering: n => "(5.5)")
 $ \| partial_E^j \( F - macron(F) \) \| lt.eq C e^(- E \/ 4) \, wide \| partial_E^j \( F - macron(F) \) \| lt.eq
   C r . $ <quiet:difference>]

 The following additional estimates will be used:
#[#set math.equation(numbering: n => "(5.6)")
 $ q_x & gt.eq e^E &  & \( e^(- E \/ 4) lt.eq tau lt.eq e^E \) \,\
q & lt.eq C \( e^(b_0 E) + log \( 1 + tau \) \) \, wide q_x gt.eq
  c \( 1 + e^(b_0 E) \( 1 + tau \)^(- 1 \/ 16) \) &  & \( tau gt.eq 1 \) \,\
r & gt.eq .9 b_0 \( 1 + tau \)^(- 1 \/ 16) &  & \( 1 lt.eq tau lt.eq e^(3 b_0 E) \) \,\
q & lt.eq C \, quad q - 1 lt.eq C e^E tau \, quad r asymp e^E tau \, quad
  D asymp e^E tau &  & \( 0 < tau lt.eq 2 e^(- E) \) . $ <quiet:intermediate>]

 In particular $q_x gt.eq c$ for $tau gt.eq e^(- E)$, and $q^(- 1) lt.eq C r$ for $tau gt.eq 2 e^(- E)$.]
] <quiet:scalar>

#proof[
  Write $a = \( 1 + tau \)^(- 1 \/ 16)$, $z = e^E u$, and $q_b = K_0^(- 1) log \( 1 + tau \)$.
    The logarithmic slopes of the two summands of $q$ are
  $ p = frac(\( q_a \)_x, q_a) = b_0 a frac(z, 1 + z) \, wide d = frac(\( q_b \)_x, q_b) =
    frac(tau, \( 1 + tau \) log \( 1 + tau \)) . $
  They satisfy
  $ p_x \/ p gt.eq - 1 / 16 \, wide d_x \/ d = frac(1, 1 + tau) -
    frac(tau, \( 1 + tau \) log \( 1 + tau \)) gt.eq - 1 / 2 . $
  For the second inequality use $log \( 1 + tau \) gt.eq 2 tau \/ \( 2 + tau \)$,
    obtained by differentiation from equality at zero. The derivative of a weighted mean of logarithmic slopes is
    the weighted mean of their derivatives plus their nonnegative variance.
    Hence $r_x gt.eq - r \/ 2$, proving the first bound for $D$.
    Also $\( q_a \)_(x x) \/ \( q_a \)_x = p + p_x \/ p gt.eq -
    1 \/ 16$ and $\( q_b \)_(x x) \/ \( q_b \)_x = \( 1 + tau \)^(- 1) > 0$.
    Taking the weighted mean with weights $\( q_a \)_x \, \( q_b \)_x$ gives the other slope bound.
  Every positive $E$ derivative of $q_a$ of order at most four is bounded by $C q_a min \( 1 \, z \)$.
    Differentiating $q^(- 1)$ thus gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ \| partial_E^j \( q^(- 1) \) \| lt.eq C q_a / q^2 min \( 1 \, z \) \, wide 1 lt.eq j lt.eq
     4 . $ <quiet:reciprocal>]
  Likewise $\( q_a \)_x$ and its $E$ derivative have ratio bounded in absolute value by a profile constant,
    so $\| r_E \| lt.eq C r$. Since $a gt.eq 2^(- 1 \/ 16)$ for $tau lt.eq 1$, comparison with $p$ gives $e_0 \,
    q_(E E) \/ q lt.eq C r$ there. The remaining bounds in (5.3) follow directly from the displayed formulas.
  Differentiate the normalized integral for $F$. For $x lt.eq 0$, use $d x = d log z \/ a$, where $a gt.eq
    2^(- 1 \/ 16)$, in (5.7); the resulting absolute integral is at most
  $ C integral_0^oo frac(min \( 1 \, z \), \( 1 + z \)^(b_0)) thin frac(d z, z) < oo . $
  For $x gt.eq 0$, put $M = e^(b_0 E)$. The positive lower and upper bounds on $u$ for $tau gt.eq
    1$ imply $c M lt.eq q_a lt.eq C M$ and $q gt.eq c M + x \/ K_0$.
    The bound in (5.7) is therefore at most $C M \/ \( c M + x \/ K_0 \)^2$,
    whose integral over $\[ 0 \, oo \)$ is uniformly bounded. This proves (5.4), also for the average by integration.
  Integration by parts gives, including for $j = 0$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ partial_E^j \( F - macron(F) \) = integral_0^1 partial_E^j \( q^(- 1) \) \( log tau + log t \, E \) thin d
     t . $ <quiet:averageidentity>]
  If $tau gt.eq e^(- E \/ 4)$, split at $t = e^(- E \/ 4)$. On the first part the integrand is uniformly bounded.
    On the second part $tau t gt.eq e^(- E \/ 2)$, and $u \( v \) gt.eq
    c min \( v \, 1 \)$ implies $e^E u \( tau t \) gt.eq c e^(E \/ 2)$.
    There the integrand, also for $j = 0$, is at most $C e^(- b_0 E \/ 2)$. This proves the first bound in (5.5).
    For $tau gt.eq 2$, split instead at $t = tau^(- 1 \/ 2)$.
    Monotonicity and the positive finite limit of $u$, together with $log \( 1 + sqrt(tau) \) gt.eq 1 /
    2 log \( 1 + tau \)$, give $q \( log sqrt(tau) \, E \) gt.eq c q \( log tau \, E \)$.
    Thus the integral is at most $C \( tau^(- 1 \/ 2) + q^(- 1) \)$.
    The estimates $q lt.eq C \( M + log tau \)$ and $q_x gt.eq
    c \( 1 + M tau^(- 1 \/ 16) \)$ show that $q tau^(- 1 \/ 2) lt.eq C q_x$ and $1 lt.eq C q_x$;
    hence this last bound is at most $C r$. On $\[ e^(- E \/ 4) \, 2 \]$ the explicit formula for $p$ gives a
    positive lower bound on $r$. This completes (5.5).
  The estimates (5.6) follow from the same two summands of $q$.
    For $1 lt.eq tau lt.eq e^(3 b_0 E)$, the logarithmic summand divided by $q_a$ tends uniformly to zero as the
    lower threshold on $E$ increases; also $z \/ \( 1 + z \) arrow.r 1$ uniformly. This proves (5.6).
    On $\[ e^(- E \/ 4) \, e^E \]$ one has $z gt.eq c e^(3 E \/ 4)$ and $a gt.eq c e^(- E \/ 16)$, so
  $ q_x gt.eq \( q_a \)_x = b_0 a z \( 1 + z \)^(b_0 - 1) gt.eq c exp \( \( 3 b_0 \/ 4 - 1 \/ 16 \) E \) gt.eq e^E . $
  Finally, on $\( 0 \, 2 e^(- E) \]$, the quantity $z$ is comparable to $e^E
    tau$ and remains bounded by a profile constant. The formulas for the first two $x$ derivatives of $q$ then
    give (5.6). Between $2 e^(- E)$ and 1 the same formulas give $q_x gt.eq c$; for $tau gt.eq 1$, use (5.6).
    These statements also prove the two final consequences. ◻
]

The scalar estimates make two tasks compatible: the spatial Schur metric remains positive,
  and the fiber curvature absorbs the trace couplings in a real-plane test.
  The following criterion states the spatial hypotheses needed for both tasks.
  The word #emph[quiet] refers to the smallness of the severity derivatives in the metric of the twist.

#thm([Proposition 5.2.])[
  (Quiet profile criterion).  #emph[There exist positive constants $epsilon.alt \,
    mu$ and a lower threshold $E_min$, depending on the fixed profile constants but not on $n$,
    with the following property. Let $E$ be a smooth spatial function and use $q =
    q_0 \( x \, E \( s \) \)$ with constant center and no shear.
    At a spatial point suppose, in some fixed holomorphic affine coordinates, that:]
  + #emph[$G gt.eq V > 0$. The operator norms of $V \, G$, their inverses, their first and second metric jets,
    and all derivatives of $E$ of orders one through four are at most $e^(epsilon.alt E)$.]
  + #emph[For every Hermitian contravariant matrix $T$ of rank at most two, $C^V \( T \, T \) gt.eq
    e^(- epsilon.alt E) \| T \|^2$, with the norm in those affine coordinates.]
  + #emph[In $G$-unit axes,
$ \| partial E \|_G^2 lt.eq mu \, wide parallel partial accent(partial E, ‾) parallel_G lt.eq mu \, wide
  parallel nabla_h^(2 \, 0) E parallel_G lt.eq mu quad upright("for every ") tau > 0 . $

]
  #emph[If $E gt.eq E_min$, the resulting metric is positive for every $y$ over that spatial point and has
    nonpositive real sectional curvature there. Uniformly in $tau$,
#[#set math.equation(numbering: n => "(5.9)")
 $ cal(N) = \( 1 + O \( mu \) \) G \, wide h asymp V + tau G . $ <quiet:schur>]

 More precisely, off the fiber axis the rank-two curvature calculation retains fixed positive multiples of
#[#set math.equation(numbering: n => "(5.10)")
 $ A t^2 + W \( b_times \, macron(b)_times \) + P \| T \|_(cal(N))^2 +
   bold(1)_({ tau lt.eq e^(- E \/ 4) }) e^(- epsilon.alt E) \| T \|^2 . $ <quiet:margins>]

 Here the fiber blocks use the tilted logarithmic coordinates,
   $\| T \|_(cal(N))$ is its Frobenius norm in $cal(N)$-unit spatial axes,
   and $bold(1)$ denotes the indicated indicator. The meaning of the final hypothesis is noncircular:
   positivity of $h$ follows from the preceding hypotheses and does not use $nabla_h^(2 \, 0) E$.]
] <quiet:profile>

#proof[
  Differentiating $U_tau = psi - F$ gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ cal(N) = G - F_E partial accent(partial E, ‾) - F_(E E) partial E ⊗ accent(partial E, ‾) \, wide h = V +
     tau macron(cal(N)) . $ <quiet:N>]
  The bar denotes averaging from 0 to $tau$. The bounded derivatives in (5.4) give $\( 1 - C mu \) G lt.eq
    cal(N) \, macron(cal(N)) lt.eq \( 1 + C mu \) G$. Choose $mu$ small enough that $C mu < 1 \/ 10$.
    This proves positivity and (5.9).
  We will repeatedly use finite-jet estimates of the following precise kind.
    Differentiating (5.11) at most twice spatially gives sums with at most four derivatives of $E$ and at most
    four $E$ derivatives of $F$ or $macron(F)$. Each summand is a product of a fixed number of the assumed jets.
    The formulas for the inverse, connection, and curvature add a fixed number of inverse metric factors.
    Consequently there is an absolute finite constant $C_(*)$, independent of dimension,
    such that these estimates cost at most $C e^(C_(*) epsilon.alt E)$, with the factors $1 +
    tau$ or $\( 1 + tau \)^(- 1)$ displayed explicitly below.
    This conclusion follows by the product rule and $h^(- 1) lt.eq C e^(epsilon.alt E) \( 1 + tau \)^(- 1) I$;
    it uses operator norms, not sums of tensor entries. The same observation applies after normalizing spatial
    axes by $cal(N)$, because $e^(- epsilon.alt E) I \/ C lt.eq cal(N) lt.eq C e^(epsilon.alt E) I$.
    Enlarge $C_(*)$ once to cover these finitely many products,
    and choose $epsilon.alt > 0$ so small that $C_(*) epsilon.alt < 1 \/ 100$.
    Any profile-dependent multiplicative constants are absorbed by raising $E_min$.
  In $cal(N)$-unit axes define
  #[#set math.equation(numbering: n => "(5.12)")
   $ upright(bold(Y)) = I - tau cal(N)^(1 \/ 2) h^(- 1) cal(N)^(1 \/ 2) . $ <quiet:Y>]
  The displayed formula indicates the normalization; equivalently it is $I - tau h^(- 1)$ after $cal(N) =
    I$ has been imposed in the fixed axes at the point. We claim
  #[#set math.equation(numbering: n => "(5.13)")
   $ parallel upright(bold(Y)) parallel lt.eq r \/ 20 quad \( tau gt.eq 2 e^(- E) \) \, wide upright(bold(Y)) =
     I + O \( e^(- \( 1 - C_(*) epsilon.alt \) E) \) quad \( tau lt.eq 2 e^(- E) \) . $ <quiet:Ybounds>]
  Always $parallel upright(bold(Y)) parallel lt.eq 1 + C mu$, because $h gt.eq
    tau macron(cal(N))$ and $macron(cal(N))$ is close to $cal(N)$.
    On $\[ 2 e^(- E) \, 1 \]$, the explicit slope $p$ in the scalar lemma yields $r gt.eq .35
    b_0$ for all sufficiently large $E$: indeed $u gt.eq e^(- 1 \/ 16) tau$, $z gt.eq 2 e^(- 1 \/ 16)$, $a gt.eq
    2^(- 1 \/ 16)$, and $q_a \/ q gt.eq \( 1 + log 2 \/ K_0 \)^(- 1) gt.eq \( 1 + log 2 \)^(- 1)$.
    The product of these three lower bounds in $p \( q_a \/ q \) =
    b_0 a \[ z \/ \( 1 + z \) \] \( q_a \/ q \)$ exceeds $.35 b_0$. This proves the first bound on that interval.
    For $tau gt.eq 1$, (5.5) gives $parallel macron(cal(N)) - cal(N) parallel_(cal(N)) lt.eq C mu r$.
    Set $h_0 = V + tau cal(N)$. The inverse identity and $h \, h_0 gt.eq
    c tau cal(N)$ show that replacing $h$ by $h_0$ in (5.12) costs at most $C mu r$.
    In the normalized axes $V lt.eq gamma I$, where $gamma = \( 1 - C mu \)^(- 1)$, and hence
  $ parallel I - tau h_0^(- 1) parallel lt.eq frac(gamma, gamma + tau) . $
  This is at most $r \/ 40$ on $\[ 1 \, e^(3 b_0 E) \]$, by (5.6) and $b_0 gt.eq 1000$.
    For $tau > e^(3 b_0 E)$, use $r gt.eq c \/ q$ and $q \/ tau lt.eq
    C \( e^(b_0 E) + log \( 1 + tau \) \) \/ tau$; the supremum of the last expression on this range tends to zero
    with the lower threshold on $E$. Thus the same estimate holds there.
    Decreasing $mu$ pays the inverse-identity error. Finally, if $tau lt.eq 2 e^(- E)$, then $h gt.eq
    V$ and the raw size bounds give $tau parallel cal(N)^(1 \/ 2) h^(- 1) cal(N)^(1 \/ 2) parallel lt.eq
    C tau e^(C_(*) epsilon.alt E)$, proving the second bound.
  Since $P_tau = q \( 1 + r \)$ and $P^2 P_(tau tau) = P q^2 D$, the curvature blocks in Lemma 11 become
  #[#set math.equation(numbering: n => "(5.14)")
   $ frac(W, P q) & = r I + upright(bold(Y)) + q^(- 1) partial macron(partial) log q \,\
P^(- 1) nabla_h^(2 \, 0) P & = e_0 nabla_h^(2 \, 0) E + \( q_(E E) \/ q \) partial E ⊗ partial E . $ <quiet:Wformula>]
  The final term in (5.14) and the spin form divided by $P q$ have norm at most $C mu r$ when $tau gt.eq
    2 e^(- E)$, and at most $C mu$ on the remaining interval.
    This follows from (5.3), the three smallness assumptions on $E$, and $q^(- 1) lt.eq
    C r$ away from the exceptional interval. After decreasing $mu$,
  #[#set math.equation(numbering: n => "(5.15)")
   $ W asymp P q r thin cal(N) quad \( tau gt.eq 2 e^(- E) \) \, wide
     W asymp P q \( 1 + r \) thin cal(N) quad \( tau lt.eq 2 e^(- E) \) \, $ <quiet:Wbounds>]
  and the spin inequality (4.10) holds.
  For the fiber diagonal term,
  $ frac(\| partial P \|_h^2, P q^2 D) lt.eq C mu frac(e_0^2, q D) lt.eq C mu . $
  Here $h gt.eq c tau G$; the final scalar quotient is bounded using $e_0 lt.eq C r$ for $tau lt.eq 1$,
    and $q D gt.eq c q r = c q_x gt.eq c$ for $tau gt.eq 1$. Thus
  #[#set math.equation(numbering: n => "(5.16)")
   $ A = \( 1 + O \( mu \) \) P q^2 D > 0 . $ <quiet:Abounds>]
  In the same normalized axes the cancellation in (4.5) gives
  $ \| A_dot.op \|_(cal(N)) lt.eq C P q sqrt(mu) #scale(x: 120%, y: 120%)[\(] \|
    e_0 \| \( r + parallel upright(bold(Y)) parallel \) + \| r_E \| #scale(x: 120%, y: 120%)[\)] lt.eq
    C P q sqrt(mu) thin r . $
  The last inequality uses $e_0 lt.eq C r$ on the exceptional interval.
    Combining with (5.15) and (5.16), the squared ratio to the dual norm determined by $A W$ is at most $C mu$.
    Consequently (4.10) holds with any fixed desired small $eta > 0$ after decreasing $mu$.
  We next pay the trace coupling. Outside the exceptional interval, (5.13) and (5.14) imply
  $ \| W : T \| lt.eq P q r (\| "tr"_(cal(N)) T \| + sqrt(2) / 16 \| T \|_(cal(N))) . $
  By $D gt.eq r^2$, its cost against .98A is at most
  #[#set math.equation(numbering: n => "(5.17)")
   $ frac(P, .98 \( 1 - C mu \)) (\| "tr"_(cal(N)) T \| + sqrt(2) / 16 \| T \|_(cal(N)))^2 . $ <quiet:tracecost>]
  For $0 lt.eq s lt.eq sqrt(2)$, $\( s + sqrt(2) \/ 16 \)^2 \/ \( 1 + s^2 \) < .8$;
    this can also be checked by differentiating, since its maximum on this interval occurs at the right endpoint.
    Because $T$ has rank at most two, decreasing $mu$ therefore makes (5.17) at most $.85
    P \( \( "tr"_(cal(N)) T \)^2 + \| T \|_(cal(N))^2 \)$. These are exactly the positive symmetrized terms in
    (4.5). On $tau lt.eq 2 e^(- E)$, the bounds $D gt.eq c e^E tau$, $q \, r lt.eq C$,
    and (5.15) instead give a trace cost at most $C e^(- E) \| T \|_(cal(N))^2$.
  To estimate the remaining $C^h$, note from (5.11) that the difference $h - V =
    tau macron(cal(N))$ and its first two jets are at most $C tau e^(C_(*) epsilon.alt E)$.
    On $tau lt.eq e^(- E \/ 4)$, the curvature formula or Lemma 13 consequently gives
  $ \| C^h \( T \, T \) - C^V \( T \, T \) \| lt.eq C tau e^(C_(*) epsilon.alt E) \| T \|^2 lt.eq 1 /
    2 e^(- epsilon.alt E) \| T \|^2 . $
  In the complementary range, the inverse bound and the jet bounds give
  $ \| C^h \( T \, T \) \| lt.eq C \( 1 + tau \) e^(C_(*) epsilon.alt E) \| T \|^2 . $
  This is arbitrarily small compared with $P \| T \|_(cal(N))^2$:
    indeed, for $tau gt.eq e^(- E \/ 4)$, $tau q_a \/ \( 1 + tau \) gt.eq
    e^(2 E)$ after increasing the threshold on $E$, by the explicit power $b_0 gt.eq 1000$;
    normalization of $T$ costs only $e^(C_(*) epsilon.alt E)$.
    On the exceptional interval, its trace cost $C e^(- E) \|
    T \|_(cal(N))^2$ is likewise negligible compared with $e^(- epsilon.alt E) \| T \|^2$.
    We have thus obtained (4.10) with
  #[#set math.equation(numbering: n => "(5.18)")
   $ cal(R) \( T \) gt.eq c P \| T \|_(cal(N))^2 + c bold(1)_({ tau lt.eq e^(- E \/ 4) }) e^(- epsilon.alt E) \|
     T \|^2 \, $ <quiet:Rreserve>]
  before paying the $K$ coupling.
  For that coupling split $K$ into $P nabla^h cal(N)$ and the two terms containing $P_i = P e_0 E_i$.
    The latter have normalized size at most $C P \| e_0 \| sqrt(mu)$;
    their squared dual $W$ norm after pairing with $T$ is at most $C mu P \| T \|_(cal(N))^2$.
    To see this directly outside the exceptional interval, the scalar quotient to bound is $e_0^2 \/ \( q r \)$;
    it is bounded by (5.3) and (5.6). On the exceptional interval replace $r$ in that denominator by $1 + r$,
    which is easier. For $P nabla^h cal(N)$ use three ranges:
  + If $tau lt.eq e^(- E \/ 4)$, then $W gt.eq c P q cal(N)$,
    and the raw jet bounds give squared dual $W$ cost at most $C tau e^(C_(*) epsilon.alt E) \| T \|^2$,
    negligible compared with the second term of (5.18).
  + If $e^(- E \/ 4) lt.eq tau lt.eq e^E$, use $parallel nabla^h cal(N) parallel_(cal(N)) lt.eq
    C e^(C_(*) epsilon.alt E)$. The squared dual cost is at most $C P e^(C_(*) epsilon.alt E) \( q r \)^(- 1) \|
    T \|_(cal(N))^2$. By (5.6) this is negligible compared with the first term of (5.18).
  + If $tau > e^E$, the identity $nabla^h h = 0$ permits
    $ nabla^h cal(N) = nabla^h \( cal(N) - macron(cal(N)) - V \/ tau \) . $
    Equation (5.5), differentiated spatially once, and the raw bounds give a normalized norm at most $C
      e^(- E \/ 4 + C_(*) epsilon.alt E)$. In making this estimate the connection has raw norm at most $C
      e^(C_(*) epsilon.alt E)$, because $h$ has first jets at most $C \( 1 + tau \)
      e^(C_(*) epsilon.alt E)$ and inverse norm at most $C e^(C_(*) epsilon.alt E) \/ \( 1 + tau \)$.
      Since $q r = q_x gt.eq c$, the squared dual $W$ cost is again negligible compared with $P \| T \|_(cal(N))^2$.
  Fix $eta lt.eq 1 \/ 100$ in Lemma 12. Choose $mu$ small enough for the terms proportional to $mu$,
    and then $E_min$ large enough for the exponentially small terms, so that (4.10) holds.
    That lemma proves positivity of every rank-two contraction with the retained margins (5.10),
    and hence nonpositive real sectional curvature. Smoothness and positivity at the axis follow from Lemma 10;
    curvature extends by continuity. ◻
]

To realize the disks of Proposition 8, we need to add a term linear in the fiber variable whose coefficient varies
  over the spatial base. A locally constant coefficient contributes only a pluriharmonic potential.
  The issue is therefore its derivative support, where the estimates below must hold for arbitrarily large fiber radius.

#thm([Proposition 5.3.])[
  (Localized shear perturbations).  #emph[Under the hypotheses of Proposition 15,
    suppose $E$ and the center are constant on the spatial region under consideration.
    Assume also that the first and pure second spatial derivatives of $psi$,
    in the affine coordinates of that proposition, have norms at most $e^(epsilon.alt E)$. Add
$ ell_(upright("sh")) = "Re" \( c_(upright("sh")) \( s \) \( y - zeta \) \) . $

 On the support of its coefficient’s derivatives suppose $psi gt.eq - J$, where $J gt.eq 0$, and
#[#set math.equation(numbering: n => "(5.19)")
 $ parallel j^(lt.eq 4) c_(upright("sh")) parallel lt.eq e^(- C E - J \/ 2) . $ <quiet:shear-small>]

 For a sufficiently large $C$ depending only on the profile and the constants in the quiet criterion,
   this perturbation preserves metric positivity and nonpositive real sectional curvature for all $y$.
   Moreover its metric is at least one half the unperturbed metric,
   and fixed fractions of the curvature margins remain. The choice of $C$ is independent of dimension.]
] <quiet:shear>

#proof[
  Where the coefficient is locally constant the added potential is pluriharmonic, so it changes no metric.
    It remains to estimate the derivative collar in (5.19). Since $E$ is constant, $P_i = 0$, $cal(N) = G$,
    and $h = V + tau G$. The holomorphic tilt used in Lemma 11 has linear and quadratic coefficients bounded by $C
    e^(epsilon.alt E)$, because $U_tau = psi - F$. Its constant term may and will be zero.
    Derivatives through order four of the exponential of this fixed quadratic polynomial at the point cost at most
    $C e^(C epsilon.alt E)$, by the ordinary product rule. These are fixed-order multilinear estimates.
  First consider $tau gt.eq e^(- E)$ in tilted logarithmic coordinates.
    The metric inverse has norm at most $C e^(C epsilon.alt E) \/ tau$.
    By (5.16), (5.15), (5.18), and $q_x gt.eq c$ on this range,
    the retained curvature on a rank-two matrix $H$ is at least
  #[#set math.equation(numbering: n => "(5.20)")
   $ c tau e^(- C_1 E) \| H \|^2 $ <quiet:large-margin>]
  in these fixed coordinates, for a fixed $C_1$. The cubic table (4.6) shows explicitly that the only possibly
    nonzero connection blocks are
  $ Gamma_00^0 = P_tau \, wide Gamma_(i 0)^j = P \( h^(- 1) G \)_i^j \, wide Gamma_(i j)^k = \( Gamma^h \)_(i j)^k . $
  Consequently their operator norm is at most $C e^(C_1 E) q$, since $r$ is bounded.
    Allowing a larger fixed power of $q$ in the following estimates would give the same result.
  The inequality $q gt.eq 1$ and the left normalization imply $F lt.eq x$. Thus
  $ \| y - zeta \| = e^(\( F - psi \) \/ 2) lt.eq e^(- psi \/ 2) sqrt(tau) . $
  After the tilt, all shear jets needed for the metric and curvature, of orders two, three, and four,
    are therefore at most
  #[#set math.equation(numbering: n => "(5.21)")
   $ C sqrt(tau) exp \( \( - C + C_2 \) E \) \, $ <quiet:shear-large-jets>]
  where $e^(- J \/ 2) e^(- psi \/ 2) lt.eq 1$ was used. For every fixed integer $r_1$, the scalar estimate (5.6),
    also valid as an upper bound for small $tau$, gives
  #[#set math.equation(numbering: n => "(5.22)")
   $ sup_(tau gt.eq e^(- E)) q^(r_1) / sqrt(tau) lt.eq C_(r_1) e^(C_(r_1) E) . $ <quiet:log-absorption>]
  Indeed $q^(r_1) lt.eq C_(r_1) \( e^(r_1 b_0 E) + log \( 1 + tau \)^(r_1) \)$;
    on $\[ e^(- E) \, 1 \]$ use $tau^(- 1 \/ 2) lt.eq e^(E \/ 2)$,
    and on $\[ 1 \, oo \)$ the quotient $log \( 1 + tau \)^(r_1) \/ sqrt(tau)$ is bounded.
  For clarity, this bound controls the quadratic perturbation as well as the linear terms.
    Write $delta = e^(- C E)$ and absorb all other fixed $E$ powers into $e^(c E)$.
    The relative metric error is bounded by $delta e^(c E) \/ sqrt(tau)$.
    Each linear curvature error from (4.13), divided by (5.20),
    is bounded by $delta e^(c E) q^(r_1) \/ sqrt(tau)$ for some fixed $r_1$.
    The quadratic contraction error before division by that margin is at most $delta^2 e^(c E) q^(2 r_1)$;
    after division its bound is
  $ delta^2 e^(c' E) (q^(r_1) / sqrt(tau))^2 . $
  Equation (5.22) makes all these quantities arbitrarily small by a single sufficiently large $C$.
    It follows that the metric is at least half its old value and that the curvature errors are smaller than a
    fixed fraction of the retained margin, uniformly on this whole fiber range.
  For $0 < tau lt.eq e^(- E)$, exponentiate the tilted logarithmic coordinate and use the affine fiber coordinate
    with scale $e^(- \( psi \( s_0 \) + E \) \/ 2)$ at the fixed spatial point $s_0$. Denote its value by $z$.
    The zero constant term of the tilt and (5.6) give
  #[#set math.equation(numbering: n => "(5.23)")
   $ \| z \|^2 = e^(E + F) asymp e^E tau . $ <quiet:small-z>]
  For example, $\| F - x \| lt.eq C e^E tau$ follows by integration of $\( q^(- 1) - 1 \) d tau \/
    tau$ on this range, and proves the comparison. The metric blocks in affine coordinates are $h$ and $P \/ \|
    z \|^2$. Both have inverse norm at most $e^(C_3 E)$. The curvature tensor transforms tensorially:
    its fiber diagonal block divides by $\| z \|^4$, its $W$ block by $\| z \|^2$,
    and its spatial block is unchanged. Since
  $ A gt.eq c tau^2 e^E \, wide W gt.eq c tau G \, wide cal(R) \( T \) gt.eq c e^(- epsilon.alt E) \| T \|^2 \, $
  the retained rank-two curvature margin in affine coordinates is at least $e^(- C_3 E) \| H \|^2$,
    after increasing $C_3$.
  The connection in the new coordinates is also bounded by $e^(C_3 E)$, without an apparent singularity at $z =
    0$. Indeed the logarithmic block $Gamma_00^0 = P_tau$ becomes $\( P_tau - 1 \) \/ z$, and $P_tau - 1 =
    O \( e^E tau \)$; thus it is bounded by $C sqrt(e^E tau)$.
    The mixed spatial block becomes $P h^(- 1) G \/ z$, bounded by $e^(C_3 E)$ using (5.23).
    The spatial-output, two-fiber-input block is zero because $P_i = 0$,
    and the spatial connection is already bounded. These checks cover all cubic entries.
    The same bounds extend to zero by the smoothness proved in Lemma 10.
  In these affine coordinates the shear jets of orders two through four are bounded by
  $ e^(- C E - J \/ 2) e^(- \( psi \( s_0 \) + E \) \/ 2) C e^(C_4 epsilon.alt E) lt.eq
    C exp \( - \( C + 1 \/ 2 - C_4 epsilon.alt \) E \) . $
  The estimate includes derivatives of the tilt and uses that $\| z \|$ is bounded on this range.
    Apply Lemma 13, with the inverse metric, connection, and reciprocal margin bounded by fixed powers of
    $e^(C_3 E)$. Increasing the same $C$ makes all relative metric errors and all curvature errors smaller than
    one half their respective retained bounds, including at the axis.
    The estimates overlap at $tau = e^(- E)$, so they cover the entire fiber.
  Finally, all exponents just used arise from derivatives of order at most four,
    a fixed finite number of products in (4.12), and operator norms of linear maps.
    Rank-two contractions introduce only the absolute constants in (4.7).
    None of these operations counts spatial indices. This proves the asserted independence from $n$. ◻
]

== 6 Radial spatial geometry and aligned profiles <sec:radial>

The quiet criterion supplies the testing regions, where $G gt.eq V$.
  A center change requires a different arrangement: $V$ must be close to $lambda G$ with a large scalar $lambda$.
  This section constructs radial spatial metrics that can pass between these arrangements and proves the curvature
  estimate for the aligned regime. Here #emph[aligned] means that their metric jets through order two are close to
  proportional, with the scalar frozen at the evaluation point.

All norms of covariant jets in this section are multilinear operator norms in the stated fixed affine coordinates.
  The norm of a Hermitian contravariant matrix is its Frobenius norm.
  Constants called absolute may depend on a fixed upper bound for the first two derivatives of $kappa$ in $log Y$,
  but not on the spatial complex dimension. This convention is essential when choosing the dimension only after
  the geometric constants.

=== 6.1 The radial clocks <the-radial-clocks>

Write $t = \| s \|^2$, $nu = log t$, and let $B$ and $Psi$ be radial potentials. Put

#[#set math.equation(numbering: n => "(6.1)")
 $ a = B' \( t \) \, wide a_psi = Psi' \( t \) = a \/ lambda \, wide u = log a \,\
Y = frac(d u, d nu) \, wide H = frac(Y, t a_psi) \, wide p = frac(d log a_psi, d u) \, wide kappa =
  frac(d Y \/ d nu, Y \( 1 + Y \)) . $ <radial:definitions>]

Here a prime on a radial potential means differentiation in $t$.
  We use $u$ for this radial variable in this section and $u_s$ in Section 8.
  We write $V = partial accent(partial B, ‾)$ and $G_0 = partial macron(partial) Psi$ for their Hermitian matrices.

These quantities separate the controls needed in the construction.
  The ratio $lambda$ compares the transverse coefficients of $V$ and $G_0$, while $H \/ lambda =
  Y \/ \( t a \)$ is the common scale of the spatial curvature components computed below.
  The evolution equations will give $d Psi \/ d u = 1 \/ H$ and $d nu \/ d u = 1 \/ Y$:
  large $H$ limits the change of the radial twist $Psi$ during growth,
  and large $Y$ limits the spatial radius consumed. We use the first feature to prepare a center change and the
  second to keep each accelerated episode inside a finite radial interval.
  Capped growth then lets the spatial radius continue between successive tests.

#thm([Lemma 6.1.])[
  (Radial evolution).  #emph[Suppose $a \, a_psi \, Y > 0$, $lambda gt.eq 1$, and
#[#set math.equation(numbering: n => "(6.2)")
 $ frac(1, 1 + Y) lt.eq kappa lt.eq 1.1 \, wide frac(d kappa, d log Y) gt.eq - kappa . $ <radial:kappa-assumptions>]

 Then
#[#set math.equation(numbering: n => "(6.3)")
 $ frac(d nu, d u) & = 1 / Y \, & frac(d log Y, d u) & = kappa \( 1 + 1 \/ Y \) \, & frac(d log lambda, d u) & =
   1 - p \,\
frac(d Psi, d u) & = 1 / H \, & frac(d log H, d u) & = kappa \( 1 + 1 \/ Y \) - p - 1 \/ Y . $ <radial:clock-equations>]

 If $Y gt.eq t$ initially, then $Y gt.eq t$ subsequently. With smooth bounded controls $p \,
   kappa$ on each finite $u$ interval, positive solutions have no blowup on that interval.
   A cap of the form $kappa = C_kappa \/ \( 1 + Y \)$, with fixed $C_kappa gt.eq 1$,
   has no blowup at finite $nu$ for the prescribed bounded controls.]
  #emph[If $p = 1$, then
#[#set math.equation(numbering: n => "(6.4)")
 $ frac(d log H, d log Y) = 1 - 1 / kappa . $ <radial:H-logY>]

 In particular, $p = kappa = 1$ holds both $lambda$ and $H$ constant.
   If $kappa gt.eq 1$ on an interval beginning at $u_0$, then the total increase of $nu$ on that interval is at
   most $1 \/ Y \( u_0 \)$, even if its finite $u$ length is arbitrarily large.]
] <radial:odes>

#proof[
  The first three identities follow by changing the independent variable from $nu$ to $u$.
    Since $d Psi \/ d nu = t a_psi$ and $H = Y \/ \( t a_psi \)$, the fourth follows as well.
    Differentiating $log H = log Y - nu - log a_psi$ gives the fifth. The lower bound on $kappa$ implies
  $ frac(d log \( Y \/ t \), d nu) = kappa \( 1 + Y \) - 1 gt.eq 0 . $
  In $u$ time, $d Y \/ d u = kappa \( 1 + Y \) lt.eq 1.1 \( 1 + Y \)$,
    so $Y$ remains finite and positive on each finite interval.
    The remaining variables are obtained by integrating the displayed equations there.
    In a cap, $d Y \/ d nu = C_kappa Y$, which gives the asserted global $nu$ continuation.
    Dividing the last equation of (6.3), with $p = 1$, by the second proves (6.4).
    Finally, $kappa gt.eq 1$ gives $Y \( u \) gt.eq Y \( u_0 \) e^(u - u_0)$, and integration of $d nu \/ d u =
    1 \/ Y$ gives the last assertion. ◻
]

The inequalities in (6.2) allow the smooth changes used later.
  For example, to decrease $kappa$ between two fixed positive values,
  make the change over a sufficiently long fixed interval in $log Y$; then $d log kappa \/ d log Y gt.eq - 1$.
  To pass from $kappa = 1$ to a cap, choose a smooth function $K \( Y \)$ which initially equals $1 + Y$,
  has $0 lt.eq K' lt.eq 1$, and eventually is constant, and put $kappa = K \( Y \) \/ \( 1 + Y \)$.
  The change can be made on a fixed increasing-factor interval of $Y$,
  so its first two $log Y$ derivatives are bounded. Moreover $1 lt.eq K lt.eq 1 + Y$ and

$ Y kappa_Y + kappa = frac(K + Y \( 1 + Y \) K', \( 1 + Y \)^2) gt.eq 0 . $

Thus all inequalities persist, and $H$ is nonincreasing during this change when $p = 1$.

=== 6.2 Curvature and coordinate bounds <curvature-and-coordinate-bounds>

#thm([Lemma 6.2.])[
  (Radial curvature).  #emph[Under (6.2), the negative Hermitian curvature tensor $C^V = - R^V$ satisfies
#[#set math.equation(numbering: n => "(6.5)")
 $ C^V \( T \, T \) gt.eq c thin kappa H / lambda \| T \|_V^2 wide upright("if ") T = T^(*) \, quad "rank" T lt.eq
   2 \, $ <radial:rank-reserve>]

 where $c > 0$ is absolute. Here the subscript $V$ means that the matrix is expressed in $V$-unit axes.]
] <radial:curvature>

#proof[
  At $s = \( sqrt(t) \, 0 \, dots.h \, 0 \)$ the metric has entries
  $ V_(i macron(j)) = a delta_(i j) + a' macron(s)_i s_j \, $
  and its radial and transverse eigenvalues are $a \( 1 + Y \)$ and $a$.
    The unitary symmetry in the transverse variables and the Kähler symmetries leave only a transverse block,
    a radial–transverse bisectional block, and a pure radial entry.
    After removing the common factor $Y \/ \( t a \) = H \/ lambda$, their respective values in $V$-unit axes are
  #[#set math.equation(numbering: n => "(6.6)")
   $ delta_(i j) delta_(k l) + delta_(i l) delta_(k j) \, wide kappa delta_(k l) \, wide D =
     kappa #scale(x: 120%, y: 120%)[\(] 1 + kappa + Y kappa_Y #scale(x: 120%, y: 120%)[\)] .
     $ <radial:curvature-components>]
  For completeness, the transverse coefficient is $a' \/ a^2 = Y \/ \( t a \)$. The radial–transverse coefficient is
  $ frac(d Y \/ d nu, t a \( 1 + Y \)) = kappa frac(Y, t a) . $
  For the pure radial entry, differentiate the logarithm of the radial metric along the radial complex line. Since
  $ frac(d, d nu) log #scale(x: 120%, y: 120%)[\(] a \( 1 + Y \) #scale(x: 120%, y: 120%)[\)] = Y \( 1 + kappa \) \, $
  its second $nu$ derivative divided by $t a \( 1 + Y \)$ is exactly the last expression in (6.6) times
    $Y \/ \( t a \)$. These calculations also follow directly by subtracting the cubic contractions in the Kähler
    curvature formula.
  Write a Hermitian test matrix in radial/transverse blocks as
  $ T = mat(delim: "(", r, b^(*); b, S) . $
  The contraction after removing $Y \/ \( t a \)$ is
  $ D r^2 + 2 kappa r "tr" S + 2 kappa \| b \|^2 + \( "tr" S \)^2 + \| S \|^2 . $
  The assumption on $kappa_Y$ gives $D gt.eq kappa$. Absorb the cross term with $0.9 D r^2$. Its cost is at most
  $ frac(kappa^2, 0.9 D) \( "tr" S \)^2 lt.eq 1.1 / 0.9 \( "tr" S \)^2 . $
  Since $"rank" S lt.eq 2$, $\| "tr" S \| lt.eq sqrt(2) \| S \|$.
    The transverse reserve is therefore at least $5 \| S \|^2 \/ 9$,
    in addition to $0.1 D r^2$ and $2 kappa \| b \|^2$. As $kappa lt.eq 1.1$,
    these bound an absolute positive multiple of $kappa \( r^2 + 2 \| b \|^2 + \| S \|^2 \)$. This proves (6.5). ◻
]

#thm([Lemma 6.3.])[
  (Scaled affine jets).  #emph[Assume (6.2) and $lambda gt.eq 1$.
    Suppose $Y gt.eq 1$, $Y gt.eq t$, the first two derivatives of $kappa$ in $log
    Y$ are bounded by a fixed constant, and
#[#set math.equation(numbering: n => "(6.7)")
 $ \| p - 1 \| + lr(|frac(d p, d log Y)|) + lr(|frac(d^2 p, d \( log Y \)^2)|) lt.eq delta \, wide 0 < delta lt.eq
   1 / 10 . $ <radial:p-close>]

 At a point use $G_0$-unit affine axes divided by $sqrt(H)$. In these axes $G_0 = H^(- 1) I$ at the point.
   The transverse and radial Euclidean axis lengths are
#[#set math.equation(numbering: n => "(6.8)")
 $ sqrt(t / Y) \, wide sqrt(frac(t, Y \( 1 + p Y \))) . $ <radial:axis-lengths>]

 In these fixed coordinates:]
  + #emph[derivatives of $Psi$ and $B$ in orders one through four are bounded by $C \/ H$ and $C lambda \/ H$,
    respectively;]
  + #emph[metric jets through order two of $V - lambda G_0$, with $lambda$ frozen at its value at the point,
    are bounded by $C delta lambda \/ H$;]
  + #emph[derivatives of $u$ in orders one through four are bounded by $C$;]
  + #emph[if a further potential has Euclidean derivatives in orders two through four bounded by $D_e$,
    its Hessian and first two metric jets here are bounded by $C D_e \/ \( a_psi H \)$.]
  #emph[All constants are independent of dimension.]
] <radial:scaled>

#proof[
  The eigenvalues of $G_0$ are $a_psi$ transversely and $a_psi \( 1 + p Y \)$ radially, giving (6.8).
    In these axes $d t$ and $d^2 t$ have operator norms at most $C t \/ Y$, and higher derivatives of $t$ vanish.
    The first bound includes the fact that the only nonzero first derivative is radial;
    thus its axis length includes the extra factor $\( 1 + p Y \)^(- 1 \/ 2)$.
  Set a dot to mean $d \/ d nu$. We have
  $ dot(Y) = kappa Y \( 1 + Y \) = O \( Y^2 \) \, wide dot.double(Y) = O \( Y^3 \) \, wide accent(Y, ⃛) =
    O \( Y^4 \) . $
  The last two estimates use, respectively, the first and second indicated derivatives of $kappa$.
    Also $dot(p) = O \( delta Y \)$ and $dot.double(p) = O \( delta Y^2 \)$. Direct differentiation gives
  $ a' & = a Y \/ t \,\
a'' & = a #scale(x: 120%, y: 120%)[\(] Y^2 - Y + dot(Y) #scale(x: 120%, y: 120%)[\)] \/ t^2 \,\
a''' & = a #scale(x: 120%, y: 120%)[\(] Y^3 - 3 Y^2 + 2 Y + 3 \( Y - 1 \) dot(Y) +
  dot.double(Y) #scale(x: 120%, y: 120%)[\)] \/ t^3 . $
  Consequently $\| a^(\( j \)) \| lt.eq C a \( Y \/ t \)^j$ for $0 lt.eq j lt.eq 3$.
    The same formulas for $a_psi$ use $p Y$ in place of $Y$ and its derivatives.
    They imply the corresponding estimate for $a_psi$, and comparison at the point, where $a = lambda a_psi$,
    improves their difference by the factor $delta$.
  The chain rule for a radial potential in at most four spatial slots is a finite sum of products of its $t$
    derivatives and copies of $d t \, d^2 t$. For a term containing its $l$th $t$ derivative,
    the product of these latter factors is bounded by $C \( t \/ Y \)^l$.
    Since $B^(\( l \)) = a^(\( l - 1 \))$, every such product is at most $C a t \/ Y = C lambda \/ H$,
    and the same argument gives $C \/ H$ for $Psi$. The improved difference estimate proves the metric-jet
    assertion. For $u$, its $t$ derivatives through order four are $O \( \( Y \/ t \)^j \)$,
    by the displayed bounds on $Y$ and its derivatives; the same chain rule proves the third assertion.
    All sums here have a number of terms bounded in terms of the derivative order, not the dimension.
  Finally, the largest axis length in (6.8) is $sqrt(t \/ Y) lt.eq 1$.
    Applying two, three, or four such axes to the extra potential therefore gives at most $C D_e t \/ Y =
    C D_e \/ \( a_psi H \)$. ◻
]

=== 6.3 Constant-center aligned estimates <constant-center-aligned-estimates>

In the remainder of this section the fiber center and severity $E$ are constant, the fiber profile is $q =
  q_0 \( x \, E \)$ from Proposition 15, and no shear is added. We use the fiber notation

$ x = log tau \, quad P = tau q \, quad r = q_x \/ q \, quad D_q = \( q_x + q_(x x) \) \/ q . $

The elementary profile estimates of Lemma 14 give $q gt.eq 1$, $r > 0$, $D_q gt.eq r^2$, and,
  for constants allowed to depend on the fixed profile and $E$,

#[#set math.equation(numbering: n => "(6.9)")
 $ & D_q gt.eq c_E tau quad \( 0 < tau lt.eq 1 \) \, wide q lt.eq C_E quad \( 0 < tau lt.eq 1 \) \,\
 & q \/ D_q lt.eq C q^2 \, wide q lt.eq C_E \( 1 + log tau \) quad \( tau gt.eq 1 \) . $ <radial:profile-bounds>]

These bounds also follow directly from the positive logarithmic summand of $q_0$:
  for $tau gt.eq 1$ it supplies a positive lower bound for $q_x + q_(x x)$,
  whereas the other summand is bounded in $tau$ at fixed $E$.

#thm([Proposition 6.4.])[
  (Aligned profile).  #emph[There is an absolute $delta_0 > 0$ with the following property.
    Fix $sigma > 0$ and take the severity $E$ sufficiently large in terms of $sigma$ and the fixed profile.
    Assume the hypotheses of Lemma 19, with $delta lt.eq delta_0$, and also
$ 1 / 2 lt.eq kappa lt.eq 1.1 \, wide H gt.eq sigma \, wide G = G_0 + G_e \,
  wide \| partial^(\[ j \]) G_e \| lt.eq delta \/ H quad \( 0 lt.eq j lt.eq 2 \) $

 in its scaled affine axes. Here $G = partial macron(partial)
   psi$ and $partial^(\[ j \])$ denotes any real or complex metric jet of order $j$,
   measured as a multilinear operator. Suppose either
#[#set math.equation(numbering: n => "(6.10)")
 $ lambda = 1 \, wide upright("or") wide H gt.eq M_E \( 1 + log lambda \)^2 \, $ <radial:aligned-alternatives>]

 where $M_E$ is sufficiently large depending only on the fixed profile and $E$.
   Then the constant-center fiber potential defines a positive metric with nonpositive real sectional curvature.
   Its spatial Schur complement satisfies $h gt.eq c V$.]
  #emph[More precisely, in scaled spatial axes and the tilted logarithmic fiber coordinate of Lemma 11,
    the contraction of its negative curvature on each Hermitian rank-at-most-two matrix with blocks
    $\( T \, b \, t_f \)$ is bounded below by
#[#set math.equation(numbering: n => "(6.11)")
 $ c (A t_f^2 + W \( b \, macron(b) \) + frac(lambda + tau, H) \| T \|^2 + P \| T \|_G^2) \, $ <radial:aligned-margin>]

 where $c > 0$ can be fixed independently of dimension and the stage parameters once the stated thresholds hold.
   The coefficient $A$ and the form $W$ are those of Lemma 11.]
] <radial:aligned>

#proof[
  Since $q$ has no spatial dependence, $cal(N) = G$ and $h = V + tau G$.
    Lemma 19 shows that, through two metric jets, $h$ differs from the constant multiple $\( lambda + tau \) V \/
    lambda$ by at most $C delta \( lambda + tau \) \/ H$. In particular
  $ h asymp frac(lambda + tau, H) I \, wide Gamma^h = O \( 1 \) . $
  Lemma 18 gives a covariant curvature lower bound $c lambda \| T \|^2 \/ H$ for $V$ in these scaled axes.
    Multiplication of a metric by a positive constant multiplies its covariant curvature by that constant.
    The curvature difference is at most $C delta \( lambda + tau \) \| T \|^2 \/ H$:
    indeed its fourth-derivative term has this bound, and its cubic contractions have the same bound by the
    inverse estimate $\| h^(- 1) \| lt.eq C H \/ \( lambda + tau \)$ and the first-jet bounds.
    Lemma 13 makes this calculation explicit. Reducing $delta_0$ therefore gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ C^h \( T \, T \) gt.eq c frac(lambda + tau, H) \| T \|^2 quad \( "rank" T lt.eq 2 \) . $ <radial:h-margin>]
  Let $theta = lambda \/ \( lambda + tau \)$. The identity $nabla^h \( V + tau G \) = 0$ implies
  $ nabla^h G = theta #scale(x: 120%, y: 120%)[\(] nabla^h G -
    lambda^(- 1) nabla^h V #scale(x: 120%, y: 120%)[\)] \, wide \| nabla^h G \| lt.eq C delta theta \/ H . $
  The curvature table gives $A = P q^2 D_q$, vanishing spin and $A_i$ terms, and $K = P nabla^h G$.
    In $G$-unit normalization it gives
  #[#set math.equation(numbering: n => "(6.13)")
   $ frac(W, P q) = r I + cal(Y) \, wide cal(Y) = V_G \( V_G + tau I \)^(- 1) \, wide
     cal(Y) asymp theta I . $ <radial:W-normalized>]
  Here $V_G$ denotes $V$ expressed in $G$-unit axes; its eigenvalues are $\( 1 + O \( delta \) \) lambda$.
    In particular $W > 0$. Spending a fixed small portion of $W$ on the $K$ coupling costs at most
  $ C delta^2 frac(P theta^2, q H \( r + theta \)) \| T \|^2 lt.eq C delta^2 frac(tau theta, H) \| T \|^2 \, $
  which is an arbitrarily small portion of (6.12) after reducing $delta_0$.
  It remains to pay for $2 t_f \( W : T \)$. Spending $0.98 A t_f^2$ costs $\( W : T \)^2 \/ \( 0.98 A \)$.
    First suppose the second alternative in (6.10) holds. Split the two terms in (6.13) using $\( a + b \)^2 lt.eq
    1.1 a^2 + 11 b^2$. The $r$ term costs at most
  $ 1.1 / 0.98 P \( "tr"_G T \)^2 . $
  The horizontal curvature contains the positive term
  $ P #scale(x: 120%, y: 120%)[\(] \( "tr"_G T \)^2 + \| T \|_G^2 #scale(x: 120%, y: 120%)[\)] . $
  As $\| "tr"_G T \| lt.eq sqrt(2) \| T \|_G$, their difference retains more than $P \| T \|_G^2 \/ 2$.
    The remaining trace cost is at most
  #[#set math.equation(numbering: n => "(6.14)")
   $ C frac(P theta^2, D_q H^2) \| T \|^2 . $ <radial:trace-remainder>]
  For $tau lt.eq 1$, (6.9) bounds $P \/ D_q$ by $C_E$. For $tau gt.eq 1$, it bounds (6.14) by
  $ C_E / H^2 tau theta^2 \( 1 + log tau \)^2 \| T \|^2 lt.eq
    frac(C_E \( 1 + log lambda \)^2, H^2) \( lambda + tau \) \| T \|^2 . $
  For the last inequality, put $z = tau \/ lambda$ and use boundedness of $z \( 1 + z \)^(- 3)$ and
    $z \( 1 + z \)^(- 3) \( log z \)^2$ on $\( 0 \, oo \)$. Taking $M_E$ sufficiently large absorbs this cost into
    a small portion of (6.12).
  Now suppose $lambda = 1$. The profile estimates give, for sufficiently large $E$,
  #[#set math.equation(numbering: n => "(6.15)")
   $ parallel cal(Y) parallel lt.eq r \/ 18 wide \( tau > 2 e^(- E) \) . $ <radial:lambda-one-slope>]
  To see the uniformity of this assertion, $parallel cal(Y) parallel lt.eq \( 1 + C delta \) \/ \( 1 + tau \)$.
    On $2 e^(- E) lt.eq tau lt.eq 1$, the first summand of $q_0$ gives a logarithmic slope bounded below by a
    large fixed multiple of one. On $1 lt.eq tau lt.eq e^(3 b_0 E)$, it gives $r gt.eq
    0.9 b_0 \( 1 + tau \)^(- 1 \/ 16)$ after increasing $E$. Beyond this interval the logarithmic summand gives $r
    gt.eq c \/ q$, which exceeds $40 \/ \( 1 + tau \)$ by its linear-in-$log
    tau$ upper bound and the starting size $tau gt.eq e^(3 b_0 E)$.
    These statements are unchanged by taking $delta_0$ smaller.
  By (6.15), the trace expenditure outside the exceptional interval is at most
  $ P / 0.98 (\| "tr"_G T \| + sqrt(2) / 18 \| T \|_G)^2 . $
  For $0 lt.eq s lt.eq sqrt(2)$, the ratio $\( s + sqrt(2) \/ 18 \)^2 \/ \[ 0.98 \( 1 + s^2 \) \]$ is strictly
    less than one, by an absolute amount. Thus a fixed portion of $P \| T \|_G^2$ remains.
    On $tau lt.eq 2 e^(- E)$, the explicit left-end profile gives $q lt.eq C$, $r lt.eq C$, and $D_q gt.eq
    c tau e^E$, where constants may depend on the fixed profile but not $E$.
    Hence the trace cost is at most $C e^(- E) \| T \|^2 \/ H^2$.
    Since $H gt.eq sigma$, this is a small portion of $\( 1 + tau \) \| T \|^2 \/
    H$ for $E$ sufficiently large in terms of $sigma$.
  All cases retain fixed portions of $A$, $W$, (6.12), and the symmetrized $P G^2$ term, proving (6.11).
    Lemma 12 gives nonpositive real sectional curvature off the fiber axis.
    The metric is positive there and $h gt.eq c V$. Smoothness of the original affine fiber potential and its
    positive limiting metric extend both conclusions across the axis. ◻
]

== 7 Changing the fiber center <sec:centers>

A moving center is not a holomorphic change of coordinates.
  We therefore first widen the fibers, then estimate the actual change of potential as a perturbation in fixed
  holomorphic coordinates. The widening and the metric scales must be chosen in the order specified below.

Throughout this section $p = kappa = 1$ and $Y gt.eq max { 1 \, t }$, so $lambda \, H$ are constant by Lemma 17,
  and $V = lambda G_0$ as metrics, including their jets. We use the scaled affine spatial coordinates of Lemma 19.
  The severity $E$ is constant, and no shear term is present. The old twist has the form

$ psi_(upright("old")) = Psi + psi_e \, wide G_e = partial macron(partial) psi_e \,
  wide \| partial^(\[ j \]) G_e \| lt.eq delta \/ H quad \( 0 lt.eq j lt.eq 2 \) \, $

with $delta$ sufficiently small as in Proposition 20. Suppose also that, throughout the interval being configured,

#[#set math.equation(numbering: n => "(7.1)")
 $ psi_(upright("old")) lt.eq A_(upright("old")) \, wide \| partial^(\[ j \]) psi_(upright("old")) \| lt.eq
   A_(upright("old")) quad \( 1 lt.eq j lt.eq 4 \) $ <center:old-data>]

in these fixed scaled axes at each point. The number $A_(upright("old"))$ is known independently of the target
  sizes of $lambda \, H$. Additive constants already placed in the twist are included in this upper bound.

#thm([Proposition 7.1.])[
  (Center change).  #emph[Choose the profile constants in the following order:
    first the fixed exponent $b_0$ of the quiet profile; then a sufficiently large absolute constant $d_0$;
    and then $K_0$ sufficiently large in terms of $d_0$ and absolute constants specified in the proof.
    Fix $E$ and old data as in (7.1). There is a width parameter $L$,
    chosen using only these data and the fixed profile, such that the following construction is possible.]
  #emph[After choosing $L$, choose a sufficiently large $lambda$, and then a sufficiently large $H$;
    explicitly one can require
#[#set math.equation(numbering: n => "(7.2)")
 $ lambda gt.eq max { e^(3 L) \, Lambda_f } \, wide H gt.eq M_f \( 1 + log lambda \)^2 \, $ <center:target-order>]

 where $Lambda_f \, M_f$ are finite constants determined by the fixed profile, $E \, L$, the old data,
   and $delta$, but not by $lambda \, H$. Over three fixed units of the variable $Psi$,
   one can change from any prescribed constant center in the unit disk to any other such center,
   returning to the original profile $q_0 \( x \, E \)$ at the end.
   The final twist differs from the old twist by a nonnegative constant, possibly very large.]
  #emph[During the change the potential is smooth, its metric is positive and has nonpositive real sectional
    curvature, and the metric bounds $c V$ from below on spatial projection, for a fixed $c > 0$.
    There is no restriction on the cost of the final constant offset.
    All power exponents and smallness tolerances used before choosing the spatial dimension are dimension independent.]
] <center:change>

=== 7.1 The profile deformation and its elementary bounds <the-profile-deformation-and-its-elementary-bounds>

Write $F_x^0 = 1 \/ q_0$ and normalize $F^0 \( x \) - x arrow.r 0$ at the left end.
  We record properties of the concrete quiet profile that will be used here. At fixed $E$,

#[#set math.equation(numbering: n => "(7.3)")
 $ & q_0 gt.eq 1 \, quad \( q_0 \)_x > 0 \, quad \( q_0 \)_(x x) \/ \( q_0 \)_x gt.eq - 1 \/ 16 \,\
 & \| \( q_0 \)_x \| + \| \( q_0 \)_(x x) \| lt.eq C q_0 \, wide q_0 \( x \, E \) lt.eq C_E +
   C \( 1 + max \( x \, 0 \) \) \,\
 & inf_(x gt.eq - 20) \( q_0 \)_x > 0 . $ <center:q-properties>]

Here and below a subscript $E$ permits dependence on $E$ and the already fixed profile.
  The last infimum can be bounded below using just the derivative of $K_0^(- 1) log \( 1 + e^x \)$.
  The inequality for the second derivative follows by differentiating both summands in the quiet profile.
  In particular $\( q_0 \)_x + \( q_0 \)_(x x) gt.eq \( 15 \/ 16 \) \( q_0 \)_x$.

Two endpoint properties are also needed. The function $Q_0 \( v \) = q_0 \( log v \, E \)$ is smooth down to $v =
  0$, with

#[#set math.equation(numbering: n => "(7.4)")
 $ Q_0 \( 0 \) = 1 \, wide Q'_0 \( 0 \) = b_0 e^E + K_0^(- 1) > 0 . $ <center:left-slope>]

At the other end the auxiliary function in the quiet profile tends to a positive finite limit with error
  $O \( e^(- x \/ 16) \)$, so

$ q_0 \( x \, E \) = c_E + x \/ K_0 + O_E \( e^(- x \/ 16) \) quad \( x arrow.r oo \) . $

Integration, using $1 \/ q_0 - K_0 \/ x = O_E \( x^(- 2) \)$, gives

#[#set math.equation(numbering: n => "(7.5)")
 $ F^0 \( x \) = K_0 log x + O_E \( 1 \) \, wide integral_0^L frac(d x, q_0 \( x \, E \)) = K_0 log L +
   O_E \( 1 \) . $ <center:primitive-asymptotic>]

No uniformity in $E$ is asserted or needed in these endpoint constants; $E$ has been fixed before $L$.

Take $L$ large. Choose a smooth function $chi$ with

$ 0 lt.eq chi lt.eq 1 \, quad "supp" chi subset \[ - 20 \, 3 L \] \, quad chi = 1 upright(" on ") \[ 0 \, L \] \,
  quad integral chi = 2 L \, quad chi' gt.eq - 1 \/ 16 \, $

and with its derivatives through any fixed needed order bounded absolutely.
  Such a function is obtained from a fixed rising cutoff, an adjustable plateau,
  and a fixed descending cutoff of length greater than $16$; adjusting the plateau gives the integral exactly.
  Define the increasing inverse map $m = m \( x \)$ by

#[#set math.equation(numbering: n => "(7.6)")
 $ x = m + L - 1 / 2 integral_(- oo)^m chi \( v \) thin d v . $ <center:inverse-map>]

Then

#[#set math.equation(numbering: n => "(7.7)")
 $ 1 lt.eq m' lt.eq 2 \, quad m lt.eq x \, quad m = x - L med \( x lt.eq L - 20 \) \, quad m =
   x med \( x gt.eq X := 3 L \) . $ <center:map-bounds>]

Its derivatives of any fixed order are bounded absolutely. Set

$ q_1 \( x \) = q_0 \( m \( x \) \, E \) lt.eq q_0 \( x \, E \) . $

Since $m'' = chi' \( m \) \( m' \)^3 \/ 2$, putting $a = m' in \[ 1 \, 2 \]$ gives

#[#set math.equation(numbering: n => "(7.8)")
 $ \( q_1 \)_x + \( q_1 \)_(x x) & gt.eq \( q_0 \)_x \( m \) #scale(x: 120%, y: 120%)[\(] a - a^2 \/ 16 -
   a^3 \/ 32 #scale(x: 120%, y: 120%)[\)]\
 & gt.eq 3 / 4 \( q_0 \)_x \( m \) a = 3 / 4 \( q_1 \)_x > 0 . $ <center:q1-positive>]

Also $\| \( q_1 \)_x \| + \| \( q_1 \)_(x x) \| lt.eq C q_1$, with constants independent of $L$.
  These bounds follow from (7.3) and the bounds on $m' \, m''$.

=== 7.2 Offsets during profile interpolation <offsets-during-profile-interpolation>

On the first unit of $Psi$, choose a smooth nondecreasing flat-ended cutoff $beta =
  beta \( Psi \)$ from $0$ to $1$, with fixed bounds on its derivatives through order four. Define

#[#set math.equation(numbering: n => "(7.9)")
 $ q \( x \, beta \) = \( 1 - beta \) q_0 \( x \, E \) + beta q_1 \( x \) \, wide frak(s) = 1 \/ q \,
   $ <center:forward-profile>]

and let $F^beta$ have derivative $F_x^beta = frak(s)$ and left normalization $F^beta - x arrow.r 0$.
  Every such primitive exists, tends to infinity on the right, and differs from $F^0$ by a constant for $x gt.eq
  X$. All spatial derivatives in the rest of this subsection are at fixed $tau = e^x$.

Use an offset $w^(+) \( beta \)$ defined by $w^(+) \( 0 \) = 0$ and

#[#set math.equation(numbering: n => "(7.10)")
 $ \( w^(+) \)' \( beta \) = partial_beta F^beta \( X \) + frac(d_0, 1 - beta + 1 \/ L) \, wide
   D \( x \, beta \) = \( w^(+) \)' \( beta \) - partial_beta F^beta \( x \) . $ <center:offset-definition>]

Here the prime on $w^(+)$ denotes differentiation in $beta$. Since $frak(s)_beta gt.eq 0$ and vanishes for $x gt.eq X$,

#[#set math.equation(numbering: n => "(7.11)")
 $ D gt.eq frac(d_0, 1 - beta + 1 \/ L) . $ <center:D-domination>]

This lower bound can dominate $sup_x \| frak(s)_beta \|$ by any required fixed factor if $d_0$ is sufficiently
  large. Indeed

$ 0 lt.eq frak(s)_beta = \( q_0 - q_1 \) \/ q^2 lt.eq min { \( 1 - beta \)^(- 1) \,
  sup_(x lt.eq X) q_0 \( x \, E \) } . $

By taking $L$ sufficiently large relative to $C_E$, the second entry is at most $C L$ with an absolute $C$.
  The elementary bound $min { z^(- 1) \, C L } lt.eq \( C + 1 \) \/ \( z + 1 \/ L \)$ proves the assertion,
  including $beta = 1$ by continuity.

For later restoration use, on another unit of $Psi$, the reverse mixture $q = \( 1 - beta \) q_1 +
  beta q_0$ with a fresh increasing cutoff. Now $frak(s)_beta lt.eq 0$ and $partial_beta F^beta lt.eq 0$.
  Choose a new offset $w^(-) \( beta \)$ with $w^(-) \( 0 \) =
  0$ and constant positive derivative greater than a sufficiently large fixed multiple of $1 +
  sup_(x \, beta) \| frak(s)_beta \|$. With $D = \( w^(-) \)' - partial_beta F^beta$, the same domination holds.
  No estimate on the size of $w^(-) \( 1 \)$ is required.

Once $L$ is fixed, all the following constants are finite and may be included in a number $C_f$:
  upper bounds for the offsets and their derivatives through order four;
  for $D$ and its first three $beta$ derivatives; for the profile and the finite-order derivatives used below on
  $x lt.eq X$; for their left-end decay coefficients; and the reciprocal lower constants in the positive estimates
  on that interval. To check finiteness at the noncompact left endpoint, both $q_0 - 1$ and $q_1 - 1$,
  with their needed derivatives, are $O_f \( e^x \)$. Thus $beta$ derivatives of $frak(s)$ are $O_f \( e^x \)$,
  and their integrals defining derivatives of $F^beta$ converge.
  In particular $C_f$ may include $e^X$ and large functions of $E \, L$. It is selected before $lambda \, H$.

#thm([Lemma 7.2.])[
  (Curvature during interpolation).  #emph[During either profile switch above,
    keep the center constant and set $psi = psi_(upright("old")) + w^plus.minus \( beta \( Psi \) \)$,
    also including the already frozen offset when making the reverse switch.
    If $lambda$ and then $H$ satisfy sufficiently large thresholds of the form (7.2), the metric is positive,
    $h gt.eq c V$, and its negative curvature has a strictly positive rank-two reserve off the fiber axis.
    These conclusions extend across that axis by continuity.]
] <center:interpolation>

#proof[
  A prime on $beta$ now means differentiation in $Psi$. Direct differentiation of $psi - F^beta$ gives
  #[#set math.equation(numbering: n => "(7.12)")
   $ cal(N) = \( 1 + D beta' \) G_0 + G_e + #scale(x: 120%, y: 120%)[\(] D beta'' +
     D_beta \( beta' \)^2 #scale(x: 120%, y: 120%)[\)] partial Psi ⊗ macron(partial) Psi . $ <center:N-formula>]
  Here $D_beta$ is the derivative at fixed $x$; thus all dependence of the primitive on the spatial cutoff is
    included. The last term and its first two spatial jets are $O \( C_f \/ H^2 \)$,
    because all positive derivatives of $Psi$ in scaled axes are $O \( 1 \/ H \)$.
    The derivatives of the scalar $D beta'$ beyond its value are $O \( C_f \/ H \)$.
    With $d_f = 1 + D beta' gt.eq 1$, these facts show
  $ cal(N) asymp d_f G_0 > 0 \, wide h = V + integral_0^tau cal(N) \( v \) thin d v gt.eq c V . $
  The constants in $asymp$ can be absolute by making $H$ large enough; the value $d_f$ itself is bounded by $C_f$.
  First consider $x lt.eq X$. Since $tau lt.eq e^X$, the first two metric jets of $h - V$ are $O \( C_f \/ H \)$. Hence
  #[#set math.equation(numbering: n => "(7.13)")
   $ Gamma^h = Gamma^(G_0) + O \( C_f \/ lambda \) \, wide C^h \( T \, T \) gt.eq
     c lambda \| T \|^2 \/ H quad \( "rank" T lt.eq 2 \) . $ <center:finite-x-h>]
  The second estimate follows from Lemma 18, the scaled jet estimates, and the curvature perturbation identity,
    taking $lambda gt.double C_f$.
  The mixed form in Lemma 11 is
  $ frac(W, P q) = \( 1 + r \) cal(N) - tau cal(N) h^(- 1) cal(N) + q^(- 1) partial macron(partial) log q . $
  The last term equals
  $ - frak(s)_beta beta' G_0 + O \( C_f \/ H^2 \) . $
  The spin form, divided by $P q$, equals
  $ - frak(s)_beta beta' nabla_h^(2 \, 0) Psi + O \( C_f \/ H^2 \) . $
  In fact $q_beta \/ q^2 = - frak(s)_beta$; the remaining terms contain two first derivatives of $Psi$.
    Lemma 19 and (7.13) give $\| nabla_h^(2 \, 0) Psi \| lt.eq C \/ H$ with absolute $C$.
    Also $\| tau cal(N) h^(- 1) cal(N) \| lt.eq C_f \/ \( lambda H \)$.
    Choose $d_0$ first so that the domination in (7.11) is sufficiently strong in comparison with this absolute
    $C$, and then choose $lambda \, H$ large compared with $C_f$. It follows that
  #[#set math.equation(numbering: n => "(7.14)")
   $ W gt.eq c frac(P q, H) d_f I \, wide \| nabla_h^(2 \, 0) P \( b \, b \) \| lt.eq 1 /
     4 W \( b \, macron(b) \) . $ <center:W-spin>]
  This argument also applies to the reverse mixture, using absolute values of $frak(s)_beta$.
  By (7.8) and convexity of the mixture,
  $ D_q = \( q_x + q_(x x) \) \/ q gt.eq c_f min \( 1 \, tau \) quad \( x lt.eq X \) . $
  Left-end decay and boundedness on the rest of this interval give
  $ \| partial log P \| + \| partial P_tau \| lt.eq C_f min \( 1 \, tau \) \/ H . $
  It follows from the curvature table that
  #[#set math.equation(numbering: n => "(7.15)")
   $ A = \( 1 + o \( 1 \) \) P q^2 D_q \, wide \| A_i \| lt.eq C_f P min \( 1 \, tau \) \/ H \, $ <center:A-control>]
  where the relative error tends uniformly to zero as $lambda \, H$ increase.
    To verify uniformity at $tau = 0$, the subtracted term in $A$ is at most $C_f P^2
    min \( 1 \, tau \)^2 \/ \( lambda H \)$, while the leading term is $P q^2 D_q$.
    The ratio tends to zero uniformly under the stated choices.
    Similarly (7.14) and (7.15) make the $A_i$ coupling arbitrarily small in units $\( A W \)^(1 \/ 2)$.
  Finally $\| K \/ P \| lt.eq C_f \/ H$. Spending fixed portions of $A \, W$ according to Lemma 12 costs at most
  $ C_f frac(P, q H) \| T \|^2 lt.eq C_f / H \| T \|^2 quad upright("for the ") K upright(" coupling") \, wide
    C_f frac(P, D_q H^2) \| T \|^2 lt.eq C_f / H^2 \| T \|^2 quad upright("for the trace coupling") . $
  In these displayed bounds $C_f$ is enlarged to include $e^X$; also $P \/ D_q$ is bounded on $x lt.eq X$,
    including the left endpoint. Both costs are small compared with (7.13).
    Thus fixed fractions of $A$, $W$, and $lambda \| T \|^2 \/ H$ remain.
  Now let $x > X$. Since the two profiles coincide exactly here, $F^beta \( x \) -
    F^0 \( x \)$ is independent of $x$. Consequently $cal(N) = cal(N)_oo$ is independent of $tau$, and
  #[#set math.equation(numbering: n => "(7.16)")
   $ h = V_f + tau cal(N)_oo \, wide V_f = V + integral_0^(e^X) #scale(x: 120%, y: 120%)[\(] cal(N) \( v \) -
     cal(N)_oo #scale(x: 120%, y: 120%)[\)] thin d v . $ <center:finite-tail>]
  There is no infinite tail in this expression. Its first two spatial jets differ from those of $V$ by
    $O \( C_f \/ H \)$. Treating $d_f = 1 + D beta'$ at the point as constant,
    the jets of $cal(N)_oo$ differ from those of $d_f G_0$ by at most $C delta d_f \/ H$,
    after taking $H gt.double C_f \/ delta$; similarly those of $V_f$ differ from $lambda
    G_0$ by a sufficiently small relative amount after taking $lambda gt.double C_f \/ delta$.
  The aligned argument can now be applied with the two spatial scales $lambda$ and $d_f$.
    More explicitly, let $theta_f = lambda \/ \( lambda + tau d_f \)$.
    The comparisons and the identity $nabla^h \( V_f + tau cal(N)_oo \) = 0$ give
  $ C^h \( T \, T \) gt.eq c frac(lambda + tau d_f, H) \| T \|^2 \, wide \| nabla^h cal(N)_oo \| lt.eq
    C delta d_f theta_f \/ H . $
  The $K$ cost is bounded by $C delta^2 \( lambda + tau d_f \) \| T \|^2 \/ H$.
    The $r I$ part of the trace cost uses the same rank-two symmetrized $P cal(N)_oo^2$ reserve as before.
    The remaining cost is at most
  $ C frac(tau q d_f^2 theta_f^2, D_q H^2) \| T \|^2 lt.eq C_f
    frac(\( 1 + log lambda \)^2 \( lambda + tau d_f \), H^2) \| T \|^2 . $
  For the last step, use (6.9) and the scalar inequality from the proof of Proposition 20 with $lambda \/
    d_f$ in place of $lambda$. We have $1 lt.eq d_f lt.eq C_f$ and may require $lambda gt.eq C_f$,
    so the logarithm is bounded by $log lambda$. Taking $H gt.eq
    M_f \( 1 + log lambda \)^2$ with sufficiently large $M_f$ absorbs this last cost.
    Spin and $A_i$ vanish in this region because $q = q_0$ is spatially constant.
  We have proved positivity and nonpositive curvature off the axis, with fixed fractional reserves.
    The profiles are smooth in $tau$ at zero, equal to one there, and have the prescribed left normalization.
    Thus the potential and metric are smooth in the original affine fiber coordinate,
    whose metric at the axis has entries $V \, e^psi$. Curvature extends by continuity. This proves the lemma. ◻
]

=== 7.3 The width gained before moving the center <the-width-gained-before-moving-the-center>

At the end of the first switch freeze $beta = 1$ and the offset, and write $psi = psi_(upright("old")) +
  w^(+) \( 1 \)$. Changing variables in the defining integral gives

#[#set math.equation(numbering: n => "(7.17)")
 $ F^1 \( x \) = L + F^0 \( m \( x \) \) - 1 / 2 integral_(- oo)^(m \( x \)) frac(chi \( v \), q_0 \( v \, E \))
   thin d v . $ <center:F1-formula>]

Both sides have derivative $1 \/ q_1$ and the same left normalization.
  At $x = X$, $m \( X \) = X$, so integration of (7.10) yields

#[#set math.equation(numbering: n => "(7.18)")
 $ w^(+) \( 1 \) = L - 1 / 2 integral_(bb(R)) frac(chi \( v \), q_0 \( v \, E \)) thin d v +
   d_0 log \( 1 + L \) . $ <center:offset-total>]

In particular this offset is nonnegative: the integral is at most $integral chi = 2 L$.

Define the pointwise width scales

$ R_0 = exp #scale(x: 120%, y: 120%)[\(] \( L - psi \) \/ 2 #scale(x: 120%, y: 120%)[\)] \, wide Z =
  exp #scale(x: 120%, y: 120%)[\(] \( F^1 \( x \) - psi \) \/ 2 #scale(x: 120%, y: 120%)[\)] = \| y - zeta \| . $

Because $chi = 1$ on $\[ 0 \, L \]$, (7.5) and (7.18) imply

#[#set math.equation(numbering: n => "(7.19)")
 $ R_0 gt.eq c_(E \, A_(upright("old"))) L^(K_0 \/ 4 - d_0 \/ 2) . $ <center:R-growth>]

Choose $K_0$ so large relative to $d_0$ that $K_0 \/ 4 - d_0 \/ 2 > K_0 \/ 9$.
  Then, for $L$ sufficiently large depending on old data,

#[#set math.equation(numbering: n => "(7.20)")
 $ R_0 gt.eq L^(K_0 \/ 9) \, wide Z gt.eq x^(K_0 \/ 9) quad \( x gt.eq L - 20 \) . $ <center:width-bounds>]

Here is the second bound in detail. At $x = L - 20$, formula (7.17) gives $F^1 = L + F^0 \( - 20 \)$,
  so $Z$ is a fixed old-data multiple of $R_0$. Monotonicity of $F^1$ and (7.19) prove the desired bound on
  $\[ L - 20 \, 3 L \]$, absorbing the fixed factor $3^(K_0 \/ 9)$ by increasing $L$.
  For $x gt.eq 3 L$, the integral in (7.17) has reached its total and cancels the integral in (7.18). Thus exactly

$ F^1 \( x \) - psi = F^0 \( x \) - psi_(upright("old")) - d_0 log \( 1 + L \) . $

The asymptotic (7.5), together with $x gt.eq 3 L$ and the strict exponent inequality already chosen,
  gives the second bound on this remaining interval. These estimates are uniform over the spatial interval because
  only the upper bound in (7.1) was used.

=== 7.4 The actual nonholomorphic center motion <the-actual-nonholomorphic-center-motion>

The preceding calculation has produced width before any center is moved.
  We now spend that width to control the metric and curvature errors of moving the center.
  Two coordinate systems cover the fiber: logarithmic coordinates away from the enlarged core and a scaled affine
  coordinate on the core, including its axis.

On the next unit of $Psi$, hold $q = q_1$ and all offsets fixed,
  and let $zeta$ be a smooth flat-ended convex-combination interpolation of the two prescribed centers.
  Its derivatives through order four as a function of $Psi$ are bounded absolutely.
  By Lemma 19, and $H gt.eq 1$, its spatial derivatives in scaled axes satisfy

#[#set math.equation(numbering: n => "(7.21)")
 $ \| partial^(\[ j \]) zeta \| lt.eq C \/ H wide \( 1 lt.eq j lt.eq 4 \) . $ <center:zeta-jets>]

At a point $s_0$, compare the moving-center potential with the potential obtained by replacing $zeta \( s \)$ by
  the constant $zeta \( s_0 \)$ in a neighborhood. This is a comparison in fixed holomorphic coordinates,
  not a claim that $y - zeta \( s \)$ is a holomorphic coordinate.
  All constants in the following two comparisons may depend on old data, $E$, and the fixed profile,
  but are independent of $L \, lambda \, H$ once the stated thresholds hold.

First suppose $x gt.eq L - 20$. For the frozen center use scaled spatial axes and the tilted logarithmic fiber
  coordinate of Lemma 11. The previous interpolation proof with cutoff constant retains fractions of $A \,
  W$ and the horizontal curvature reserve. On this region $m gt.eq - 20$, so (7.3) and (7.8) give

$ A gt.eq c tau \, wide W gt.eq c tau H^(- 1) I . $

The horizontal reserve is at least $c tau \/ H$: on $x lt.eq X$ use $lambda gt.eq e^X gt.eq tau$ in (7.13),
  and on $x > X$ use the aligned reserve. Consequently the full rank-two curvature contraction is bounded below by
  $c tau \/ H$ times the squared Frobenius norm of the test.
  The metric has the same lower scale and its inverse has norm at most $C H \/ tau$.
  These assertions also follow directly for the metric from $h = V + tau G$ and $P = tau q$.

The polynomial holomorphic tilt has coefficients bounded by the first two old twist derivatives;
  the offset is constant. In these tilted coordinates the frozen connection has norm at most $C q$.
  Indeed the possibly large entries in the cubic table are $P_tau = q + q_x = O \( q \)$ and $P cal(N) h^(- 1) =
  O \( q \)$, whereas $P_i = 0$, the tilted pure holomorphic second spatial derivative vanishes, and $Gamma^h =
  O \( 1 \)$.

Let $Phi$ be the one-variable fiber potential as a function of $rho + psi = log \| y - zeta \|^2 + psi$.
  Its first derivative is $tau$, and differentiation in this argument is $q partial_x$.
  Thus its derivatives of orders one through four have size at most $C tau q^3$. For example

$ Phi'' = tau q \, quad Phi''' = tau q \( q + q_x \) \, quad Phi'''' =
  tau q #scale(x: 120%, y: 120%)[\(] \( q + q_x \)^2 + q \( q_x + q_(x x) \) #scale(x: 120%, y: 120%)[\)] . $

The fixed argument has bounded jets through order four in the chosen frame.
  The difference in its argument after moving the center is

#[#set math.equation(numbering: n => "(7.22)")
 $ log lr(|1 - frac(zeta \( s \) - zeta \( s_0 \), y - zeta \( s_0 \))|)^2 . $ <center:log-argument-difference>]

It vanishes at the evaluation point, and each positive jet contains a derivative of $zeta$ and a denominator of
  size at least $Z$. By (7.21), bounded tilt coefficients, and $H Z gt.eq 1$,
  its jets through order four are $O \( 1 \/ \( H Z \) \)$.
  The chain rule consequently bounds every potential-jet difference through order four by

#[#set math.equation(numbering: n => "(7.23)")
 $ C frac(tau q^3, H Z) . $ <center:outer-jet-error>]

In particular its relative metric error is at most $C q^3 \/ Z$.
  Once this is small, Lemma 13, the bound $Gamma = O \( q \)$,
  and the inverse bound $O \( H \/ tau \)$ show that the curvature error on unit rank-two tests is at most

#[#set math.equation(numbering: n => "(7.24)")
 $ C tau / H (q^5 / Z + q^8 / Z^2) lt.eq C frac(tau q^8, H Z) . $ <center:outer-curvature-error>]

The first term accounts for all linear fourth-jet and cubic-contraction changes,
  and the second is the quadratic inverse-contraction term. Fixed-rank contraction costs only an absolute factor.

For $x gt.eq L - 20$, (7.3) and $m lt.eq x$ give $q = q_1 lt.eq C x$ once $L$ is large relative to $C_E$.
  This constant is independent of $L \, lambda \, H$. Choose, in addition to the earlier requirement,
  $K_0 \/ 9 > 10$. Then (7.20) makes the ratios in (7.23) and (7.24) arbitrarily small compared with the metric
  and curvature reserves by increasing $L$. This choice precedes $lambda \, H$.

It remains to include $x < L - 20$ and the axis itself. Put $v = tau e^(- L)$.
  By (7.7), the fiber potential added to $B$ is exactly $e^L$ times the original smooth radial function,
  now evaluated at

$ \| y - zeta \( s \) \|^2 e^(psi \( s \) - L) . $

This identity follows by changing variables in $integral_0^tau q_1 \( log t \)^(- 1) d t$.
  Use scaled spatial axes and the fixed affine fiber coordinate

$ z = frac(y - zeta \( s_0 \), R_0 \( s_0 \)) . $

At the evaluation point $\| z \|^2 = e^(F^0 \( log v \)) asymp_E v$ for $0 lt.eq v lt.eq e^(- 20)$.
  The comparison is uniform down to zero because $F^0 \( log v \) - log v$ is smooth there.
  The smooth radial function and its derivatives on this fixed compact argument interval have bounds depending
  only on old data and $E$.

For the frozen center, (7.4) gives, with positive old-data constants,

$ A gt.eq c_E tau^2 e^(- L) \, wide W gt.eq c_E tau H^(- 1) I \, $

throughout $0 < v lt.eq e^(- 20)$. For the first inequality,
  the continuous positive ratio of $P^2 P_(tau tau)$ to $tau^2
  e^(- L)$ has a positive limit at zero by $Q'_0 \( 0 \) > 0$; positivity away from zero follows from (7.3).
  For $W$, the term $P q cal(Y) G$ has a positive lower bound of this size because $tau lt.eq
  e^(L - 20)$ and $lambda gt.eq e^(3 L)$. Divide the vertical and cross curvature blocks by $\| z \|^4$ and $\|
  z \|^2$, respectively, on changing from logarithmic to affine fiber coordinates.
  The retained vertical and cross reserves are then at least $c_E e^L$ and $c_E e^L \/ H$.
  The horizontal reserve $c lambda \/ H$ also dominates $c e^L \/ H$.
  The metric has the same smallest scale, so its inverse is bounded by $C_E H \/ e^L$.

Undoing the exponentiated tilt changes the affine fiber variable by $z mapsto e^(theta \( s \)) z$,
  where $theta \( s_0 \) = 0$ and its coefficients are bounded by old twist derivatives.
  Since $\| z \|$ is bounded, the differential and its inverse, and the needed higher jets,
  have old-data bounds independent of $L \, lambda \, H$. This preserves the indicated rank-two lower margin up to
  old-data constants. The connections in these coordinates are bounded: the logarithmic entry transforms to

$ \( P_tau - 1 \) \/ z = O_E \( \| z \| \) \, $

and the spatial-fiber entry is bounded by

$ \| P cal(N) h^(- 1) \| \/ \| z \| lt.eq C_E tau \/ \( lambda \| z \| \) lt.eq C_E \| z \| \, $

using $lambda gt.eq e^L$. The pure vertical-to-spatial entry vanishes before the bounded tilt is undone.
  The remaining spatial entries are bounded by the radial jet estimates.

In this affine frame the moving smooth argument, before applying the fixed smooth radial function, is

#[#set math.equation(numbering: n => "(7.25)")
 $ lr(|z - frac(zeta \( s \) - zeta \( s_0 \), R_0 \( s_0 \))|)^2 e^(psi \( s \) - psi \( s_0 \)) .
   $ <center:affine-argument>]

Its difference from the frozen argument has jets through order four bounded by $C \/ \( H R_0 \)$,
  including at $z = 0$, by (7.21). Therefore the potential jets change by at most $C e^L \/ \( H R_0 \)$.
  The inverse metric and bounded connection estimates give a curvature error at most

#[#set math.equation(numbering: n => "(7.26)")
 $ C e^L / H (R_0^(- 1) + R_0^(- 2)) . $ <center:inner-error>]

By (7.20), this is a small fraction of the $e^L \/ H$ reserve for $L$ sufficiently large,
  independently of the later choices of $lambda \, H$. The metric error is small by the same estimate.
  Smoothness includes the axis, so no limiting logarithmic-coordinate assertion is being used at a singular
  coordinate point.

We have proved that the moving-center metric remains, say,
  at least half the frozen-center metric and that its real sectional curvature is nonpositive.
  Its spatial projection bound is therefore inherited from the frozen Schur bound $h gt.eq c V$.

#proof[
  #emph[Completion of Proposition 21.] Choose $d_0$ to dominate the absolute spin constants in the interpolation
    estimate, and choose $K_0$ so that $K_0 \/ 4 - d_0 \/ 2 > K_0 \/ 9$ and $K_0 \/ 9 > 10$.
    The latter explicit exponent is larger than the exponent $8$ in (7.24).
    For fixed old data and $E$, choose $L$ sufficiently large for (7.20) and for the moving-center metric and
    curvature errors to be less than the retained reserves. Next compute the finite constants $C_f$ for both
    switches and choose $lambda$ and then $H$ according to (7.2), with the larger thresholds needed in Lemma 22.
    This is the required noncircular order of choices.
  Perform the forward switch with constant old center, the center interpolation with frozen profile $q_1$ and
    offset, and finally the reverse switch with constant new center.
    Lemma 22 controls the two switches and the preceding argument controls the actual center motion.
    The cutoffs are flat-ended, so all joins are smooth. At the end the profile is $q_0$,
    the center is the prescribed new constant, and the added offset is $w^(+) \( 1 \) + w^(-) \( 1 \) gt.eq 0$.
    All profiles are at least one, have smooth left endpoints with value one,
    and have normalized primitives tending to infinity on the right;
    thus they define smooth fiber potentials for all affine fiber values throughout.
    The spatial projection bound follows on each part, with a fixed fractional loss during the center motion.
    No bound on the final constant offset is required or asserted. ◻
]

== 8 Assembly of the complete base <sec:assembly>

The local estimates are now available. We must realize infinitely many analytic tests with one finite spatial
  dimension, preserve the earlier tests when adding later wells, and obtain a complete global metric.
  We choose the spatial data and join the local regimes. All tensor and fixed-order derivative estimates in this
  section use operator or multilinear norms in fixed affine coordinates.
  In particular, their leading exponents do not include a trace over the spatial dimension.

#thm([Proposition 8.1.])[
  #emph[For some fixed finite integer $n$, there is a smooth strictly plurisubharmonic potential $ell$ on $bb(C)^n
    times bb(C)$ whose Kähler metric is complete and has nonpositive real sectional curvature.
    The potential satisfies every hypothesis of Proposition 8,
    for a countable dense set of centers in the unit disk and every spatial Taylor order.
    Thus all bounded holomorphic functions on its half-plane tube are constant.]
] <assembly:base>

At each spatial point the fiber potential is recovered from

$ F \( log tau \, s \) = log \| y - zeta \( s \) \|^2 + psi \( s \) $

with the left normalization of Section 4. The radial function $B$ supplies the spatial metric.
  The twist $psi$ starts with a radial background $Psi$: polynomial wells make selected fibers wide,
  and additional radial plurisubharmonic terms control the derivatives of the severity.
  A term $"Re" \( c_(upright("sh")) \( s \) \( y - zeta \( s \) \) \)$ prescribes the sheared disk directions.
  We choose these data in increasing spatial radius. The polynomial wells are the only later additions that extend
  into earlier regions, so their inward tails must be reserved in advance.

The proof occupies this section. A cycle starts on a capped spatial interval, raises the severity,
  performs one test, and raises severity again on a post-test ramp.
  At constant severity it then accelerates the spatial metric, enters the aligned regimes, changes center,
  and restores the spatial parameters. Finally it increases severity while the normalized spatial geometry is
  fixed, until the severity can pay for the next capped interval.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Cap and coast#linebreak()$lambda =1$, $H lt.eq sigma$]]])])
  content((4.6, 0), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Severity trigger#linebreak()raise $E$ to $E_*$]]])])
  content((9.2, 0), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Polynomial test#linebreak()fixed center and severity]]])])
  content((9.2, -2.05), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Post-test ramp#linebreak()reach $E_( upright(p) "ost")$]]])])
  content((4.6, -2.05), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Accelerate growth#linebreak()enter aligned regime]]])])
  content((0, -2.05), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Grow $H$, then $lambda$#linebreak()$E=E_( upright(p) "ost")$]]])])
  content((0, -4.1), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Widen, move, restore#linebreak()hold $kappa =p=1$]]])])
  content((4.6, -4.1), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Return $lambda$ to $1$#linebreak()then lower $H$ to $sigma$]]])])
  content((9.2, -4.1), [#box(width: 3.885cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Severity catch-up#linebreak()before the next cap]]])])
  line((1.943, 0), (2.657, 0), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((6.543, 0), (7.257, 0), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((9.2, -0.635), (9.2, -1.415), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((7.257, -2.05), (6.543, -2.05), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((2.657, -2.05), (1.943, -2.05), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((0, -2.685), (0, -3.465), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((1.943, -4.1), (2.657, -4.1), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((6.543, -4.1), (7.257, -4.1), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((9.2, -4.735), (9.2, -5.215), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((9.2, -5.215), [#text(size: 8pt)[Next stage: cap and coast]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: One stage, in increasing spatial radius. The test is installed while the spatial growth is capped. The intervening growth and center change occupy finite clock intervals. After the reset, severity must catch up with the accumulated spatial scale before the next capped regime can begin. The arrows indicate order, not elapsed radius. ],
) <fig:stage-clock>

We retain the radial notation of Lemma 17:

$ t = \| s \|^2 \, quad nu = log t \, quad a = B' \( t \) \, quad u_s = log a \,\
Y = frac(d u_s, d nu) \, quad a_psi = Psi' \( t \) = a \/ lambda \, quad H = frac(Y, t a_psi) \, quad p =
  frac(d log a_psi, d u_s) . $

Here $H$ is a scalar; the polynomial system below is denoted by $cal(H)$. The evolution equations are

#[#set math.equation(numbering: n => "(8.1)")
 $ frac(d Y, d u_s) & = kappa \( 1 + Y \) \, & frac(d nu, d u_s) & = Y^(- 1) \, & frac(d log lambda, d u_s) & =
   1 - p \,\
frac(d Psi, d u_s) & = H^(- 1) \, & frac(d log H, d u_s) & = kappa \( 1 + Y^(- 1) \) - p -
  Y^(- 1) . $ <assembly:clocks>]

The admissibility and derivative conditions on $kappa \, p$ in the radial lemmas will always be imposed.

=== 8.1 Wells and the order of constants <wells-and-the-order-of-constants>

Fix a sequence $\( zeta_j \, h_j \)$ in which every pair from a fixed countable dense subset of ${ \| y \| <
  1 }$ and $bb(Z)_(gt.eq 0)$ occurs infinitely often. The parameters of a test will be

#[#set math.equation(numbering: n => "(8.2)")
 $ E_(*) = B_(*) c \, wide eta = e^(- c) \, wide N = floor.l e^(gamma E_(*)) floor.r \, wide l = N /
   2 log \( t \/ R^2 \) \, wide S = R e^(c \/ N) . $ <assembly:test-parameters>]

The constants $B_(*) \, gamma$ are fixed below. At each stage $R$ is fixed before $c$.
  For a degree-$N$ system $\( cal(H) \, p_N \)$ from Lemma 4, define

#[#set math.equation(numbering: n => "(8.3)")
 $ W_j \( s \) =
   d log frac(\| cal(H) \( s \/ R \) \|^2 + \| p_N \( s \/ R \) - 1 \|^2 + e^(- 2 c), 1 + e^(- 2 c)) .
   $ <assembly:well>]

The polynomial $p_N$ is unrelated to the radial control $p$.
  The logarithmic sum-of-squares formula shows that $W_j$ is smooth and plurisubharmonic.

#thm([Lemma 8.2.])[
  #emph[There is an absolute exponent $C_(upright("pol"))$ such that, for $t gt.eq 1$ and $1 lt.eq r lt.eq 4$,
#[#set math.equation(numbering: n => "(8.4)")
 $ \| partial^(\[ r \]) W_j \| lt.eq
   C \( n \, d \) exp { C_(upright("pol")) \( max \( l \, 0 \) + c + log N \) } . $ <assembly:well-raw>]

 There is a constant $L_n < oo$ such that, after increasing the degree threshold,
#[#set math.equation(numbering: n => "(8.5)")
 $ \| partial^(\[ r \]) W_j \| lt.eq N^(L_n) wide \( 1 lt.eq r lt.eq 4 \, med l gt.eq L_n log N \) .
   $ <assembly:well-tail>]

 Both statements hold throughout the indicated outer ranges.]
] <assembly:well-bounds>

#proof[
  Homogeneity and the spherical upper bound give $\| \( cal(H) \, p_N \) \( s \/ R \) \| lt.eq N e^l$.
    Cauchy estimates at scale $c_0 sqrt(t) \/ N$ bound its derivatives of order at most four by this quantity
    times a fixed power of $N$, since $t gt.eq 1$. In a differentiated logarithm there are only a fixed number of
    factors and denominator powers; the denominator in (8.3) is at least $e^(- 2 c)$.
    This proves (8.4) with an absolute exponent; fixed-dimensional constants and $d$ affect only its prefactor.
  The spherical lower bound also gives $\| \( cal(H) \, p_N \) \( s \/ R \) \| gt.eq e^l N^(- C_n)$.
    Once $l$ exceeds a sufficiently large multiple of $log N$,
    subtraction of $\( 0 \, 1 \)$ leaves norm at least $e^l N^(- C_n) \/ 2$.
    The factors $e^l$ in derivatives of the logarithm can then be canceled.
    The remaining costs are fixed powers of $N$, with exponents depending on the already fixed $n$.
    Increase $L_n$ to pay them and the degree threshold to pay the prefactor. ◻
]

For each stage we also introduce smooth nonnegative radial plurisubharmonic functions $Z_(j \, upright("in"))$ and
  $Z_(j \, upright("out"))$. They vanish before their stage and eventually become affine nondecreasing functions
  of $nu$. The center changes add offsets that vanish before their change interval and are constant afterwards.
  We seek the final twist in the form

#[#set math.equation(numbering: n => "(8.6)")
 $ psi = Psi + sum_j W_j + sum_j \( Z_(j \, upright("in")) + Z_(j \, upright("out")) \) +
   upright("center-change offsets") . $ <assembly:twist>]

The center is constant except on its change intervals. There is one fiber profile at each spatial point:
  it is $q_0 \( x \, E \( s \) \)$ except during the coordinated switches of Proposition 21.
  Shears occur only in the disjoint test collars. The recursion below will make the well sum converge smoothly on
  compact spatial sets; the other added terms are locally finite.

The constants must provide the three outputs of Proposition 8:
  a fixed-height spatial ball, small unsheared disks on its boundary,
  and large prescribed sheared disks at the nodes. Their exponents determine $k$ and hence the dimension.
  Accordingly we first choose all geometric constants independently of $n$,
  and only then use stagewise size choices to pay dimensional prefactors.

We give the full order of choices. First choose the profile constants, including $d_0 \,
  K_0$ for the center change, then $epsilon.alt \, mu$ for Proposition 15, the shear exponent in Proposition 16,
  and the tolerance $delta$ for Proposition 20. These choices are independent of $n$.
  Use control transitions whose first two derivatives in $log Y$ have absolute bounds.
  Let $C_(upright("rad"))$ dominate the absolute exponents needed for radial raw jets through order four. Choose

#[#set math.equation(numbering: n => "(8.7)")
 $ epsilon.alt_1 lt.double epsilon.alt \/ \( 1 + C_(upright("rad")) \) \, wide
   C_arrow.t gt.double \( 1 + C_(upright("rad")) \) \/ epsilon.alt . $ <assembly:first-constants>]

Choose next

#[#set math.equation(numbering: n => "(8.8)")
 $ m_z gt.eq 10 \( C_(upright("pol")) + 1 \) \, wide B_(*) gt.eq
   frac(C_(*) \( 1 + m_z + C_(upright("pol")) + C_(upright("rad")) \), epsilon.alt_1) \, $ <assembly:second-constants>]

where the absolute $C_(*)$ is large enough for the finitely many raw exponent comparisons below.
  Choose $C_s$ larger than the quiet shear severity exponent,
  and $C_w$ large enough to pay the shell loss and four derivatives of its cutoffs; $C_w > 5 k_(*) +
  20$ suffices for these latter costs after increasing the other fixed constants if necessary.
  Here $k_(*)$ is the absolute separation exponent of the polynomial grids. Choose

#[#set math.equation(numbering: n => "(8.9)")
 $ 0 < gamma lt.double epsilon.alt_1 \, wide gamma B_(*) lt.eq min { .005 \, \( 8 C_w \)^(- 1) } \, wide
   k_b > max { 8 \/ gamma \, 100 \/ epsilon.alt } . $ <assembly:gamma-kb>]

Choose $M_b$ sufficiently large for the ratios in Lemma 26,
  and then $sigma > 0$ sufficiently small for that lemma and Lemma 29.
  These are choices made from fixed constants; in particular $sigma M_b k_b^2 lt.double 1$,
  and $sigma$ pays all quiet smallness requirements involving $C_arrow.t$.
  Severity thresholds can depend on $sigma$. Finally take

#[#set math.equation(numbering: n => "(8.10)")
 $ d gt.eq 8 \( M_b k_b + C_s + 1 \) B_(*) . $ <assembly:depth>]

All constants so far are independent of dimension.

Set

#[#set math.equation(numbering: n => "(8.11)")
 $ m_0 = d \/ 2 \, wide p_0 = 2 d \, wide p_1 = C_s B_(*) + C_w d gamma B_(*) . $ <assembly:test-exponents>]

Then $p_1 lt.eq d \/ 4 < m_0$. Choose an integer $k$ with $.99 k > p_0 + p_1 + 1$,
  and only now fix a finite $n$ sufficiently large that

#[#set math.equation(numbering: n => "(8.12)")
 $ sum_(r = 1)^(k - 1) frac(r^(n - 1), \( n - 1 \) !) < .01 . $ <assembly:dimension>]

Such a finite $n$ exists because $k$ is fixed. The constants $C_n \,
  L_n$ and all dimensional prefactors will be paid by the stagewise choice of large $c$; they do not change (8.11).

=== 8.2 Recursive convention and capped intervals <recursive-convention-and-capped-intervals>

Every estimate for an already configured region is made with an additional allowance of one for the absolute value
  and spatial jets through order four of all future wells. Let $nu_j^(upright("sat"))$ denote the designated
  endpoint of severity saturation at stage $j$, and let

$ K_j = { s : \| s \|^2 lt.eq e^(nu_j^(upright("sat"))) } $

be the entire inner spatial ball ending there. The testing annulus lies beyond this ball. At stage $j$ we impose

#[#set math.equation(numbering: n => "(8.13)")
 $ sup_(s in K_j) \| partial^(\[ r \]) W_j \( s \) \| lt.eq 2^(- j) \, wide 0 lt.eq r lt.eq j +
   4 . $ <assembly:diagonal>]

Each new trigger begins beyond every completed stage, so every already configured region lies in every later
  $K_j$. The omitted well sum therefore has absolute value and spatial jets through order four bounded by $sum_j
  2^(- j) lt.eq 1$ there. Its Hessian is also positive semidefinite. Feasibility is proved below.
  This convention reserves the entire future allowance before selecting any future coefficients.
  We apply the local all-fiber lemmas to the final twist with these allowances;
  we do not infer a uniform curvature statement from small perturbations on compact subsets of the total space.

Initially put

#[#set math.equation(numbering: n => "(8.14)")
 $ a = a_psi = a_(upright("init")) e^t \, quad Y = t \, quad lambda = p = 1 \, quad kappa = \( 1 + Y \)^(- 1) \,
   $ <assembly:initial-data>]

with $a_(upright("init"))$ so large that $H lt.eq sigma$, and choose $B \, Psi$ with equal initial constants.
  Up to a positive scale and an additive constant, this initial spatial potential is the exponential radial
  example of #cite(label("Seshadri2006"), form: "prose") Section 3.
  Take center $zeta_1$ and a constant severity sufficiently large for the initial compact region and the tail
  allowance. The radial curvature formula is strictly positive on nonzero rank-two Hermitian tests at $t = 0$,
  by its limit or by direct differentiation of $a_(upright("init")) e^t$.
  Thus the quiet criterion also applies at the spatial origin.

Before every trigger the radial data will have the form

#[#set math.equation(numbering: n => "(8.15)")
 $ lambda = p = 1 \, wide kappa = frac(C_kappa, 1 + Y) \, wide 1 lt.eq C_kappa lt.eq 1 + Y \, wide H lt.eq
   sigma \, $ <assembly:cap>]

with $C_kappa$ constant on that interval. Then $d Y \/ d nu = C_kappa Y$,
  so the cap can be continued through any prescribed finite interval of $nu$ without a pole.
  All previously generated nonradial twist terms have bounded positive-order Euclidean jets on the entire outer
  range: use (8.5) and the affine $Z$ tails. Hence a cap can also be continued until $a =
  e^(u_s)$ dominates any prescribed bound for those old jets.

Choose the next trigger start $nu_B$ with $Y_B = Y \( nu_B \) gt.double C_kappa$, $e^(nu_B) gt.eq 1$,
  and severity constant there at a value satisfying

#[#set math.equation(numbering: n => "(8.16)")
 $ E_0 gt.eq C_arrow.t u_s \( nu_B \) . $ <assembly:trigger-initial>]

The reset below provides this inequality and any additional fixed threshold. Put

#[#set math.equation(numbering: n => "(8.17)")
 $ xi = Y_B \( nu - nu_B \) \, wide nu_(*) = nu_B + Y_B^(- 1) \, wide R = e^(nu_(*) \/ 2) . $ <assembly:trigger-radius>]

These data precede the choice of $c$. Retain the capped radial data through

#[#set math.equation(numbering: n => "(8.18)")
 $ l = T_(*) + 4 \, wide T_(*) = 10 { c + \( 1 + L_n \) log N } . $ <assembly:post-length>]

For large $c$ this lies inside $nu lt.eq nu_B + 2 \/ Y_B$, since $\( T_(*) + 4 \) \/ N arrow.r 0$.
  Throughout this fixed continuation $Y asymp Y_B$ and $u_s = u_s \( nu_B \) + O \( 1 \)$,
  with constants allowed to depend on the already fixed cap data.

#thm([Lemma 8.3.])[
  #emph[Before choosing $c$ at stage $j$, one can fix $D_j gt.eq j$ such that,
    for every sufficiently large permitted $c$ and every final choice of the reserved tails,
#[#set math.equation(numbering: n => "(8.19)")
 $ ell \( s \, zeta_j \) lt.eq D_j - 2 wide \( \| s \| lt.eq R e^(c \/ N) \) . $ <assembly:height-bound>]

]
] <assembly:height>

#proof[
  On the spatial region following the previous center-change interval,
    the center is $zeta_j$ and $ell \( s \, zeta_j \) = B \( s \)$, including on shear supports.
    The same identity holds on the initial cap at the first stage.
    Thus the bound there follows from the fixed cap continuation up to $nu_B + 2 \/ Y_B$.
    The earlier spatial region is a fixed compact set $K$ with already chosen profiles and centers;
    future stages do not change $q \( x \, s \)$ on $K$. The reservation gives $\| psi -
    psi_(upright("old")) \| lt.eq 1$ there, including the current and all later wells.
    Both centers are in the unit disk, so $\| zeta_j - zeta \( s \) \| lt.eq 2$.
    Choose $A > log 4 + sup_K psi_(upright("old")) + 1$. For each $s in K$, $F \( x \, s \) arrow.r
    oo$ as $x arrow.r oo$. Continuity, a finite cover, and monotonicity in $x$ give a common finite $X$ with
    $F \( X \, s \) > A$ on $K$. Inverting the fiber relation therefore gives $tau lt.eq e^X$.
    Since $q gt.eq 1$, the radial potential is bounded by $sup_K B + e^X$;
    the fixed shear adds at most $2 sup_K \| c_(upright("sh")) \|$.
    At center coincidences this argument is understood by the smooth limit $tau = 0$.
    These bounds are independent of $c$ and of the future wells. Add two and increase to at least $j$. ◻
]

We always require

#[#set math.equation(numbering: n => "(8.20)")
 $ c gt.eq j \( D_j + 1 \) $ <assembly:height-rate>]

in addition to the finitely many current thresholds. Thus $D_j arrow.r oo$ and $D_j \/ c_j arrow.r 0$.

=== 8.3 The severity trigger <the-severity-trigger>

Choose a smooth convex nondecreasing $h_b$ on $\( - oo \, 1 \)$, zero for $xi lt.eq 0$, equal to $-
  log \( 1 - xi \)$ up to an affine function near $1$. To construct it,
  cut on the nonnegative second derivative $\( 1 - xi \)^(- 2)$ smoothly and integrate twice from zero. Use

#[#set math.equation(numbering: n => "(8.21)")
 $ E = E_0 + k_b h_b \( xi \) \, wide Z_(j \, upright("in")) = M_b k_b^2 h_b \( xi \) $ <assembly:trigger>]

until severity is near $E_(*)$. Smoothly saturate $E$ at $E_(*)$ over a unit interval of its argument,
  so that $E = E_(*)$ by $k_b h_b = E_(*) - E_0 + 1$. Derivatives of the saturation function in that argument are
  bounded. Keep the unsaturated convex $Z_(j \, upright("in"))$ slightly longer, and once $k_b h_b gt.eq E_(*) -
  E_0 + 2$, cut off its second derivative nonnegatively over half the remaining gap to $xi = 1$.
  Continue it affinely in $nu$ thereafter. This is a smooth convex nondecreasing function.
  Such a function of $log \| s \|^2$, zero near the origin, is a smooth radial plurisubharmonic function:
  its transverse and radial Hessian entries are its first and second $nu$ derivatives divided by $t$.

Near this cutoff the gap $1 - xi$ is comparable, with fixed stagewise factors,
  to $e^(- \( E_(*) - E_0 \) \/ k_b)$. The final slope is bounded by

#[#set math.equation(numbering: n => "(8.22)")
 $ C M_b k_b^2 Y_B e^(\( E_(*) - E_0 \) \/ k_b) . $ <assembly:trigger-slope>]

The value there is $M_b k_b \( E_(*) - E_0 + O \( 1 + k_b \) \)$.
  Multiplication of (8.22) by the remaining gap to $nu_(*)$ costs only a fixed $O \( M_b k_b^2 \)$,
  and its product with $4 c \/ N$ tends to zero. Thus for large $c$,

#[#set math.equation(numbering: n => "(8.23)")
 $ Z_(j \, upright("in")) lt.eq 2 M_b k_b E_(*) wide \( \| l \| lt.eq 2 c \) . $ <assembly:trigger-value>]

Through saturation, its derivatives and those of $E$ through order four have bounds given by fixed prefactors
  times $\( 1 + Y_B \)^4 e^(4 \( E - E_0 \) \/ k_b)$. The bound with $E_(*)$ also holds for positive-order
  derivatives of the affine tail.

The well satisfies (8.13) after increasing $c$. Indeed throughout severity saturation,

#[#set math.equation(numbering: n => "(8.24)")
 $ l lt.eq - C \( Y_B \, E_0 \) N e^(- E_(*) \/ k_b) . $ <assembly:activation-gap>]

The absolute value on the right grows exponentially in $E_(*)$,
  because $log N tilde.op gamma E_(*)$ and $gamma > 4 \/ k_b$.
  Homogeneity makes the polynomial evaluations on the whole inner ball exponentially small in this quantity.
  Cauchy on a collar of scale $R \/ N$ gives the same conclusion for any fixed derivative order,
  with only powers of $N$ as further costs. The logarithm in (8.3) is then close to zero with all these
  derivatives. We can therefore enforce the bound $2^(- j)$ for its value and derivatives through order $j + 4$.
  This decay pays all fixed exponential-in-$c$ costs needed at stage $j$.

#thm([Lemma 8.4.])[
  #emph[The trigger satisfies the hypotheses of Proposition 15, uniformly for every $tau gt.eq 0$.
    After saturation the same criterion applies through $l = 4 c$,
    including the initial part of the post-test term defined below.]
] <assembly:quiet-check>

#proof[
  For raw estimates use Euclidean axes. Here $t gt.eq 1$, $Y asymp Y_B$, and $log Y_B lt.eq C u_s \( nu_B \)$;
    the last estimate follows by integrating $d log Y \/ d u_s = kappa \( 1 + Y^(- 1) \) lt.eq 2.2$ for $Y gt.eq
    1$. Differentiation of $a' = a Y \/ t$ bounds the required radial metric jets by $e^(C_(upright("rad")) u_s)$.
    Their inverses cost no more. The radial curvature estimate gives
  #[#set math.equation(numbering: n => "(8.25)")
   $ C^V \( T \, T \) gt.eq c kappa H \| T \|_V^2 gt.eq c \( a \/ t \) \| T \|^2 \, $ <assembly:euclidean-curvature>]
  since $V gt.eq a I$ and $kappa H = C_kappa Y \/ \( \( 1 + Y \) t a \) gt.eq c \/ \( t a \)$.
    The initial severity pays these bounds, the old data and the future allowance.
    The trigger cost $e^(4 E \/ k_b)$ fits the quiet raw exponent. The current well is small before saturation.
    Also $G gt.eq V$, since all nonconstant extra twist terms in this interval are plurisubharmonic.
  For the covariant condition, write
  $ cal(B) \( nu \) = B \( e^nu \) \, wide cal(U) \( nu \) = Psi \( e^nu \) + Z_(j \, upright("in")) \( e^nu \) \, $
  and use primes for $nu$ derivatives within this proof. On the severity-varying interval,
  #[#set math.equation(numbering: n => "(8.26)")
   $ cal(U)'' / cal(U)' \, med frac(\| cal(U)''' \|, cal(U)'') \, med cal(B)'' / cal(B)' \, med
     frac(\| cal(B)''' \|, cal(B)'') & lt.eq C sqrt(cal(U)'') \,\
frac(\| E' \|, cal(U)') \, med frac(\| E' \|, sqrt(cal(U)'')) \, med frac(\| E'' \|, cal(U)'') \, med
  frac(\| E''' \|, \( cal(U)'' \)^(3 \/ 2)) & lt.eq epsilon_b \, $ <assembly:connection-ratios>]
  where $epsilon_b$ can be made as small as required. Away from the pole,
    $h_b$ and its relevant derivatives are bounded, whereas $cal(B)' = Y \/ H$ and $cal(B)'' =
    Y \( 1 + Y \) \/ H$. The choice $sigma M_b k_b^2 lt.double 1$ makes these background terms dominate.
    Near the pole let $D_b = Y_B \/ \( 1 - xi \)$. Then
  $ Z'_(j \, upright("in")) asymp M_b k_b^2 D_b \, quad Z''_(j \, upright("in")) asymp M_b k_b^2 D_b^2 \,
    quad \| Z'''_(j \, upright("in")) \| lt.eq C M_b k_b^2 D_b^3 \, $
  and $\| E^(\( r \)) \| lt.eq C k_b^r D_b^r$ for $1 lt.eq r lt.eq 3$, including saturation.
    These prove (8.26) and make (8.26) small by first enlarging $M_b$ and then decreasing $sigma$.
    The fixed intervening interval of $xi$ is covered by the first estimates. We also have $cal(U)'' gt.eq 1$.
  At fixed $tau$, the radial part of the Schur metric is the Hessian of
  $ J_h = cal(B) + tau \( cal(U) - macron(F) \( x \, E \) \) \, $
  where the bar denotes averaging from zero to $tau$ in the $tau$ variable.
    Bounded severity derivatives of $macron(F)$ and (8.26) show that the first two derivatives of $cal(U) -
    macron(F)$ are positively comparable with those of $cal(U)$ and its third derivative is bounded by
    $C \( cal(U)'' \)^(3 \/ 2)$. Use affine axes normalized by the Hessian of $cal(U)$,
    with radial radius $sqrt(t \/ cal(U)'')$ and transverse radii $sqrt(t \/ cal(U)')$.
    At a radial point, the only nonzero holomorphic connection types for a radial Hessian metric are radial–radial
    to radial and radial–transverse to transverse. Differentiation gives the bounds
  #[#set math.equation(numbering: n => "(8.27)")
   $ frac(\| J'''_h \/ J''_h - 1 \|, sqrt(cal(U)'')) \, wide
     frac(\| J''_h \/ J'_h - 1 \|, sqrt(cal(U)'')) . $ <assembly:connection-exact>]
  They are bounded by (8.26). No estimate of a radial/transverse condition number is used.
  Write the remaining Hessian as $tau G_e$, with $G_e gt.eq 0$. Its size and first jets in these axes are bounded:
    old Euclidean bounds are dominated by the large initial $a$,
    and the current and future wells have the reserved absolute bounds.
    The normalizing radii are at most $a^(- 1 \/ 2)$ because this background is at least $V gt.eq a I$.
    If $h_r$ denotes the radial Schur metric, the exact connection difference is, with the usual index placement,
  #[#set math.equation(numbering: n => "(8.28)")
   $ Gamma^h - Gamma^(h_r) = tau \( partial G_e - Gamma^(h_r) G_e \) \( h_r + tau G_e \)^(- 1) .
     $ <assembly:connection-perturbation>]
  Since $h_r gt.eq c tau I$, $tau h^(- 1)$ is uniformly bounded for all $tau > 0$.
    Thus the full connection is uniformly bounded as well.
  In these axes the first derivative of $E$ has norm $\| E' \| \/ sqrt(cal(U)'')$;
    the complex Hessian entries are bounded by $\| E' \| \/ cal(U)'$ and $\| E'' \| \/ cal(U)''$,
    and the only pure second derivative has size $\| E'' - E' \| \/ cal(U)''$.
    Consequently subtracting the connection times the first derivative gives a small $nabla_h^(2 \, 0) E$.
    Since the actual $G$ is at least the normalizing background, the same smallness holds in $G$ units.
    This proves all quiet smallness conditions uniformly in $tau$.
  After saturation, severity derivatives vanish. Through $l =
    4 c$ the well’s raw costs are bounded by $e^(C \( c + log N \))$;
    the post term below has cost at most a fixed multiple of $N^4 e^(2 m_z c)$.
    Both fit $epsilon.alt E_(*)$ by (8.8), while the inverse and radial curvature estimates persist. ◻
]

=== 8.4 Testing disks and the post ramp <testing-disks-and-the-post-ramp>

Choose $c$ sufficiently large that the degree in (8.2) meets the grid accuracy required for $h_j$, and $N > h_j$.
  At every good lift $v$, use a smooth cutoff supported in $\| s -
  R v \| < 2 R N^(- k_(*))$ and equal to one on $\| s - R v \| lt.eq R N^(- k_(*))$. Assign on the inner ball

#[#set math.equation(numbering: n => "(8.29)")
 $ c_(upright("sh")) = alpha b_v \, wide alpha = exp \( - C_s E_(*) - C_w d log N \) \, $ <assembly:shear-amplitude>]

and multiply by the cutoff in the collar. The phases have modulus one,
  are independently assignable by projective direction, and repeat on every lift of that direction.
  The outer balls are disjoint. A cutoff $chi \( \| s - R v \|^2 \/ \( R N^(- k_(*)) \)^2 \)$ has fixed-order
  multilinear derivative bound $C_r \( R N^(- k_(*)) \)^(- r)$ with absolute $C_r$.
  At most one contributes at any point, so there is no factor for the number of nodes or dimension.

On the derivative supports, the shell estimate gives

#[#set math.equation(numbering: n => "(8.30)")
 $ psi gt.eq - 2 d \( k_(*) + 11 \) log N - C_(upright("old")) . $ <assembly:shear-lower>]

Old values are bounded on the fixed cap continuation, future values have the allowance,
  and the trigger term is nonnegative. These balls have $\| l \| lt.eq log N +
  1$ and lie beyond severity saturation. First and pure second derivatives of $psi$ also fit the quiet raw bounds;
  the extra background first-derivative cost is at most $a sqrt(t)$.
  The constants $C_s \, C_w$ pay respectively the severity exponent of Proposition 16 and half the loss (8.30)
  together with the four cutoff derivatives. Large $c$ pays fixed old factors.
  Thus that proposition applies for all fiber radii with metric comparison loss at most $1 \/ 2$.
  Where a shear coefficient is constant, its potential term is pluriharmonic.

At a node the new well is $- 2 d c + O \( 1 \)$; on $\| s \| = S$ it is at most $2 d \( c + log N \) +
  O_d \( 1 \)$. All other values on the fixed continuation are bounded independently of $c$,
  except the trigger term. The post term is still zero. Hence

#[#set math.equation(numbering: n => "(8.31)")
 $ psi_(upright("node")) & lt.eq - 2 d c + 2 M_b k_b B_(*) c + C_(upright("old")) \,\
psi_(upright("sphere")) & lt.eq 2 d \( c + log N \) + 2 M_b k_b B_(*) c +
  C_(upright(o l d \, d)) . $ <assembly:node-twist>]

For a small fixed profile-dependent $c_0 > 0$, the disk

#[#set math.equation(numbering: n => "(8.32)")
 $ \| y - zeta_j \| < c_0 e^(- \( psi + E_(*) \) \/ 2) $ <assembly:fiber-disk>]

has $tau lt.eq e^(- E_(*))$ and radial potential increment at most one.
  Indeed, by the axis estimates in Lemma 14, at $tau = e^(- E_(*))$ the normalized relation gives $F = - E_(*) +
  O \( 1 \)$ uniformly: integrate $1 \/ q - 1 = O \( e^(E_(*)) tau \)$ up to that value of $tau$.
  Monotonicity proves the disk assertion.

At a node the holomorphic shear $w mapsto w + i alpha b_v \( y - zeta_j \)$ has imaginary increment
  $"Re" \( alpha b_v \( y - zeta_j \) \)$, exactly the added potential.
  Writing $z = y - zeta_j$, the clearance on the disk (8.32), over any $w$ with $"Im" w = D_j$, is therefore

$ & "Im" \( w + i alpha b_v z \) - ell \( R v \, zeta_j + z \)\
 & wide = D_j - ell_(upright("rad")) \( R v \, zeta_j + z \) gt.eq D_j - B \( R v \) - 1 gt.eq 1 . $

The last inequality uses (8.19) on the center axis. Thus the shear consumes none of the height margin,
  and the sheared disk lies in the tube. Its logarithmic radius is at least

$ \( d - M_b k_b B_(*) - B_(*) \/ 2 \) c - C_(upright("old")) gt.eq \( 13 d \/ 16 \) c - C_(upright("old")) \, $

which exceeds $m_0 c$ for large $c$. On the sphere there is no shear,
  and Cauchy’s inequality on (8.32) bounds the transverse derivative of a function of modulus at most one by

$ exp { \[ d \( 1 + gamma B_(*) \) + M_b k_b B_(*) + B_(*) \/ 2 \] c + C_(upright(o l d \, d)) } lt.eq e^(p_0 c) . $

Also $alpha^(- 1) lt.eq e^(p_1 c)$. These are precisely the constants (8.11),
  with strict margins to absorb the prefactors. Choose the phases supplied by Proposition 8.
  All geometric estimates hold for arbitrary phases.

For the post ramp, add a smooth convex nondecreasing function $Z_(j \, upright("out"))$ of $l$,
  zero through $2 c$, and equal to $e^(m_z \( l - 2 c \))$ up to affine terms from $2 c + 2$ onward.
  This is obtained by cutting on its positive second derivative and integrating twice.
  Continue through $T_(*) + 2$, then cut off that second derivative nonnegatively so that the function is affine
  after $T_(*) + 3$. Independently turn on the severity slope $B_(*)$ in $l$ over $\[ 4 c \, 4 c + 1 \]$,
  and turn it off over $\[ T_(*) \, T_(*) + 1 \]$. Write $E_(upright("post"))$ for the final value. For large $c$,

#[#set math.equation(numbering: n => "(8.33)")
 $ E gt.eq B_(*) \( c + l \) \/ 10 quad \( 2 c lt.eq l lt.eq T_(*) + 4 \) \, wide E_(upright("post")) gt.eq
   B_(*) T_(*) \/ 2 . $ <assembly:post-severity>]

#thm([Lemma 8.5.])[
  #emph[The quiet criterion holds throughout the post ramp.
    Beyond $l = T_(*) + 4$, the sum of all already generated additive twist terms other than $Psi$ and the
    constant offsets, and each such term individually, has Euclidean positive-order jets through order four
    bounded on the whole outer range by
#[#set math.equation(numbering: n => "(8.34)")
 $ D_(upright("out")) = exp \( epsilon.alt_1 E_(upright("post")) \/ 3 \) . $ <assembly:outer-bound>]

]
] <assembly:post>

#proof[
  Each derivative of a function of $l$ costs a fixed power of $N$.
    Thus $Z_(j \, upright("out"))$ has positive-order bounds through order four of size $C N^4
    e^(m_z max \( 0 \, l - 2 c \))$. These and (8.4) fit the raw quiet exponent by (8.8) and (8.33).
    Other radial and old-data bounds remain fixed on the cap continuation.
    Through $l = 4 c$, severity is constant and the preceding lemma applies.
  Where severity varies, take $cal(U) = Psi + Z_(j \, upright("out"))$.
    Before division by $t$, its transverse and radial Hessian entries have sizes
  $ m_z N e^(m_z \( l - 2 c \)) \, wide \( m_z N \)^2 e^(m_z \( l - 2 c \)) . $
  For $l gt.eq 4 c$, $m_z \( l - 2 c \)$ exceeds $C_(upright("pol")) \( l + c + log N \)$ by a fixed positive
    multiple of $c + l$. Thus this Hessian dominates the current well and its first Hessian jets in normalized
    axes. The affine $Z_(j \, upright("in"))$ tail has coefficient at most a fixed factor times $e^(E_(*) \/ k_b)
    lt.double N$; old terms and future tails are covered as before.
    Moreover $cal(U)'' \/ cal(U)' \, \| cal(U)''' \| \/ cal(U)'' lt.eq C m_z N$,
    while $sqrt(cal(U)'') gt.tilde m_z N e^(m_z \( l - 2 c \) \/ 2)$.
    Severity derivatives of orders $r lt.eq 3$ are at most $C B_(*) N^r$.
    Thus the connection ratios hold and all severity ratios are small.
    Equations (8.27) and (8.28) again prove the pure Hessian condition uniformly for all $tau$.
    Every extra Hessian is positive semidefinite in this interval.
  Past $T_(*) + 4$ the new well satisfies (8.5), and the $Z$ terms are affine in $nu$.
    Their positive-order Euclidean jets are bounded on the entire outer range by their endpoint bounds up to fixed
    constants. Their logarithmic costs are at most $C \( 1 + m_z \) T_(*) + 4 log N +
    C_(upright("old"))$ with an absolute $C$. The absolute constant $C_(*)$ in (8.8) was chosen to pay this
    inequality too. Equation (8.33) then implies (8.34), after increasing $c$ for the finite sum of old bounds,
    the number of generated terms, and dimensional prefactors.
    The dimension-dependent $L_n$ multiplies $T_(*)$ on both sides and changes no leading comparison. ◻
]

=== 8.5 Acceleration, center change, and reset <acceleration-center-change-and-reset>

At constant $E_(upright("post"))$, increase $kappa$ from the cap value to $kappa_(*) =
  1.08$ on a fixed-factor interval of $Y$ after $l = T_(*) + 4$, keeping $lambda = p = 1$.
  The transition can preserve $Y kappa_Y gt.eq - kappa$: multiply the difference between the cap value and
  $kappa_(*)$ by a nondecreasing cutoff in $log Y$. The upward derivative only improves that inequality.
  The $u_s$ increment is bounded in terms of the fixed prior $Y_B$, independently of large $c$.
  Keep $kappa = kappa_(*)$ until

#[#set math.equation(numbering: n => "(8.35)")
 $ u_s = epsilon.alt_1 E_(upright("post")) . $ <assembly:aligned-entry>]

For large $c$ this endpoint lies after the transition and has $H gt.eq sigma$.
  Indeed, with $p = 1$, $d log H \/ d u_s = \( kappa_(*) - 1 \) \( 1 + Y^(- 1) \) gt.eq .08$,
  whereas the initial values at the end of the cap have fixed stagewise bounds as $c arrow.r oo$.

Until (8.35), apply the quiet criterion. The radial raw jets cost $e^(C_(upright("rad")) u_s)$,
  the extra twist jets are bounded by (8.34), and the curvature lower bound follows as in (8.25).
  Severity derivatives vanish. The choices of $epsilon.alt_1$ and $B_(*)$ pay all these estimates.
  At entry $a_psi = e^(epsilon.alt_1 E_(upright("post")))$.
  By the scaled-axis estimate of the radial lemmas, an extra Euclidean Hessian with two further jets bounded by
  $D$ costs at most $C D \/ \( a_psi H \)$ in scaled axes. Consequently at entry and through the later aligned
  intervals,

#[#set math.equation(numbering: n => "(8.36)")
 $ \| j^(lt.eq 2) G_e \|_(upright("scaled")) lt.eq delta \/ H . $ <assembly:aligned-extra>]

Here we leave a fixed fraction of the $delta$ budget for future wells.
  The ratio $D_(upright("out")) \/ a_psi$ is exponentially small at entry and only decreases later,
  since $a_psi$ increases. During an actual profile switch its new offset is accounted for by Proposition 21;
  outside the switch, that offset is constant.

#thm([Lemma 8.6.])[
  #emph[At constant $E_(upright("post"))$ the center can be changed from $zeta_j$ to $zeta_(j + 1)$,
    and the data can then be restored to
$ lambda = p = 1 \, wide kappa = 1 \, wide H = sigma \, $

 using finite clock intervals and only the aligned and center-change regimes.
   The old-twist bounds needed for choosing the profile shift are available independently of the targeted
   $lambda \, H$.]
] <assembly:change-order>

#proof[
  Initially grow $H$ with $kappa = kappa_(*)$ and $p = lambda = 1$.
    Use the $lambda = 1$, $H gt.eq sigma$ alternative of Proposition 20.
    Ultimately we will lower $p$ slightly below one for a bump, thereby increasing $lambda$, and then restore $p =
    1$ and return smoothly to $kappa = 1$.
  We first justify the order in which the targets are chosen.
    During the growth and the bump, $p lt.eq 1$ and $kappa = kappa_(*)$, so $d log H \/ d u_s gt.eq .08$. Thus
  $ integral_(u_(upright("entry")))^oo frac(d u_s, H) lt.eq frac(1, .08 H_(upright("entry"))) . $
  This bounds the total increase of $Psi$ before the final transition independently of the size of either target.
    The transition from $kappa_(*)$ to one takes a fixed $log Y$ interval and leaves $H$ nondecreasing,
    adding another fixed bound to $Psi$. Moreover $kappa gt.eq 1$ gives $d log Y \/ d u_s gt.eq 1$, hence
  $ 0 lt.eq nu - nu_(upright("entry")) = integral frac(d u_s, Y) lt.eq Y_(upright("entry"))^(- 1) $
  through the growth and holding intervals. The old nonradial twists therefore have bounded values on one fixed
    compact spatial interval, independently of the targets. Their scaled derivatives are bounded by the fixed
    Euclidean bounds, since the scaled coordinate radii are at most one.
    Derivatives of $Psi$ in these axes are $O \( 1 \/ H \) lt.eq O \( 1 \/ sigma \)$.
    The forward switch and center move each occupy a fixed amount of the variable $Psi$;
    these amounts can be included in the same bounds. Include the reserved future value and jet allowance as well.
    These are exactly old-twist bounds independent of $lambda \, H$, as required by Proposition 21.
  Choose its shift $L_0$ from these bounds and $E_(upright("post"))$.
    This fixes its profile constants $C_f$ and a sufficient target $lambda$,
    and that target determines a sufficient target $H$. This is the order of parameter selection in
    Proposition 21. The radial path reaches the targets in the other order:
    grow $H$ first until it exceeds every required multiple of
  $ C_(E_(upright("post"))) \( 1 + log lambda \)^2 quad upright("and") quad C_f \( 1 + log lambda \)^2 . $
  Choose a smooth bump of $1 - p gt.eq 0$ with small amplitude and small derivatives in $log Y$,
    and with integral in $u_s$ equal to the desired $log lambda$.
    Such a bump exists by making its middle plateau arbitrarily long;
    the endpoint ramps can have fixed small amplitude and sufficiently long fixed length,
    while the plateau length supplies the remaining integral.
    The conversion $d log Y \/ d u_s = kappa \( 1 + Y^(- 1) \)$ and its bounded derivatives show that bounds
    through order two in $log Y$ follow from the same bounds in $u_s$.
    Throughout this bump $H$ increases, and the already chosen lower bound for $H$ pays the entire range $0 lt.eq
    log lambda \( s \) lt.eq log lambda$. Apply the large-$H$ alternative of Proposition 20.
  Restore $p = 1$ and lower $kappa$ smoothly to one. The downward transition can be made slowly enough in $log
    Y$ that $Y kappa_Y gt.eq - kappa$, with absolute derivative bounds.
    Since $kappa gt.eq 1$ here, $H$ stays large. Now $kappa = p = 1$, so both $H$ and $lambda$ are constant.
    Perform the forward profile switch, the center move, and the reverse switch of Proposition 21.
    Interpolate the two center values by a flat-ended convex combination, keeping the center in the unit disk.
    The old bounds and targets have been chosen in the order just proved.
    The changes take a bounded interval of $Psi$, hence a finite interval of $u_s$ because $d Psi \/ d u_s =
    1 \/ H$ and $H$ is fixed, even though this interval can be very long.
    Restore $q_0$ and retain the new constant offset. The center is now $zeta_(j + 1)$.
    The offset may be arbitrarily large, but it is now constant and changes no derivative of the twist.
    Its value becomes part of the old data when the next testing height is chosen,
    before the next accuracy parameter $c$.
  Raise $kappa$ to $kappa_(*)$ again and use a bump with $1 < p < kappa_(*)$ to bring $log lambda$ down to zero.
    A small positive plateau and fixed ramps give any prescribed finite integral of $p - 1$;
    stop precisely when that integral equals the existing $log lambda$. Thus $lambda$ never falls below one. Also
  $ frac(d log H, d u_s) = kappa_(*) - p + frac(kappa_(*) - 1, Y) > 0 \, $
  so the large-$H$ aligned condition remains valid. Restore $p = 1$.
  Finally reduce $H$ to $sigma$. Transition $kappa$ to $1 \/ 2$, hold there for an adjustable interval,
    then return to one from below. For $p = 1$ the exact relation is
  #[#set math.equation(numbering: n => "(8.37)")
   $ frac(d log H, d log Y) = 1 - kappa^(- 1) . $ <assembly:H-descent>]
  Its value is $- 1$ on the middle plateau. The endpoint transitions have fixed finite effects on $log H$;
    the initial $H$ can be made as large as needed. Choose the plateau length so that the final value is exactly
    $sigma$. Throughout this descent $H gt.eq sigma$, $lambda = 1$, and $1 \/ 2 lt.eq kappa lt.eq kappa_(*)$,
    so the $lambda = 1$ aligned alternative applies. Choose the downward transitions slowly enough to preserve the
    same derivative inequality as above.
  All these intervals have finite $u_s$ or finite $log Y$ length.
    Equations (8.1) show that $Y$ remains finite on each finite $u_s$ interval and that the radius advances by a
    finite positive amount. A putative pole of an indefinitely continued accelerated equation is therefore never
    reached during an episode. This proves the claim. ◻
]

#thm([Lemma 8.7.])[
  #emph[From the endpoint in Lemma 28, severity can be increased and a new cap started so that the next trigger
    has (8.16), while the metric continues to satisfy the quiet criterion.
    The cap can be extended to arbitrarily large spatial radii.]
] <assembly:reset>

#proof[
  The spatial scale $u_s$ may now be enormous, and $E_(upright("post"))$ need not dominate it.
    Proposition 15 permits any fixed holomorphic affine frame at the evaluation point.
    We first use $V$-unit affine axes, where the curvature scale is the fixed $sigma$ and the relevant jets are
    bounded independently of $u_s$. This will justify the initial severity increase before arranging the size
    inequality needed for the next trigger.
  First hold $kappa = p = lambda = 1$ and $H = sigma$. Let $E$ increase smoothly as a function of $u_s$,
    starting at $E_(upright("post"))$, with a fixed flat-ended transition to slope $4 C_arrow.t$.
    Its derivatives through order four in $u_s$ are bounded by constants depending on the fixed parameters,
    not on $sigma$ or the possibly enormous $u_s$ at entry. Continue long enough that
  #[#set math.equation(numbering: n => "(8.38)")
   $ E gt.eq 2 C_arrow.t u_s $ <assembly:catchup>]
  and any desired fixed threshold. The greater slope ensures that this occurs after a finite interval.
  We verify the quiet criterion even before (8.38). Use $V$-unit affine axes.
    The scaled-jet radial estimates give metric jets of orders $r = 1 \,
    2$ bounded by $C H^(r \/ 2)$ in these axes, and scaled derivatives of $u_s$ through order four are bounded by
    an absolute constant. Therefore
  $ \| partial^(\[ r \]) E \|_V lt.eq C H^(r \/ 2) \, wide 1 lt.eq r lt.eq 4 . $
  The extras in (8.36) satisfy the same bounds after this normalization, and $G gt.eq V$.
    For $sigma$ small, the severity terms in $cal(N)$ are small relative to $G$, so $h asymp \( 1 + tau \) V$,
    with first derivatives bounded in these axes by $C \( 1 + tau \) sqrt(H)$.
    Its connection is consequently $O \( sqrt(H) \)$ uniformly in $tau$.
    The first, complex second, and pure covariant second severity derivatives are small for every $tau$.
  The raw curvature margin on this hold is $C^V \( T \, T \) gt.eq c sigma \| T \|^2$ in $V$-unit axes,
    because $kappa = 1$ and $H = sigma$. All other raw data are bounded there by fixed constants.
    The previously chosen $E_(upright("post"))$ exceeds the fixed profile and $sigma$ thresholds,
    so it pays this margin even when it is much smaller than the current $u_s$.
    Thus there is no gap before severity catches up.
  After (8.38), keep the same slope while turning $kappa$ into a cap. Here is an explicit admissible transition.
    If $Y_0$ is its starting clock value, set
  $ A \( Y \) = 1 + Y_0 + integral_(Y_0)^Y eta_0 \( v \/ Y_0 \) thin d v \, wide kappa \( Y \) =
    frac(A \( Y \), 1 + Y) \, $
  where $eta_0$ is smooth, equals one near $1$, decreases nonnegatively to zero,
    and is zero for arguments at least two. For $Y lt.eq Y_0$ use $A = 1 + Y$.
    Then $1 lt.eq A lt.eq 1 + Y$, so $\( 1 + Y \)^(- 1) lt.eq kappa lt.eq 1$. Moreover
  $ Y kappa_Y + kappa = frac(Y A' \( Y \), 1 + Y) + frac(A \( Y \), \( 1 + Y \)^2) gt.eq 0 . $
  The first two derivatives of $kappa$ in $log Y$ have absolute bounds,
    because $Y \/ Y_0$ ranges over a fixed interval while $eta_0$ changes.
    For example, writing $b = Y \/ \( 1 + Y \)$ and $D = Y partial_Y$, one has $D kappa =
    b \( eta_0 - kappa \)$ and $D^2 kappa = b \( 1 - 2 b \) \( eta_0 - kappa \) + b D eta_0$.
    At the end $A$ is the new constant $C_kappa$. Since $kappa lt.eq 1$ and $p = 1$,
    $H$ is nonincreasing and stays at most $sigma$.
  The same normalized jet and connection estimates continue through the transition and the cap.
    To check the raw curvature margin there, note that $Y gt.eq t$:
    it holds initially, and $d log Y \/ d nu = kappa \( 1 + Y \) gt.eq 1$ preserves it.
    Also $u_s gt.eq t$ after choosing the initial constant large enough, since $d u_s \/ d t = Y \/ t gt.eq 1$. Hence
  $ kappa H gt.eq c \/ \( t a \) gt.eq c e^(- 2 u_s) quad \( t gt.eq 1 \) \, $
  and (8.38) with large $C_arrow.t$ pays the quiet lower bound $e^(- epsilon.alt E)$.
    The positive-order extras stay bounded relative to $V$ on an arbitrarily long cap.
    More explicitly, a fixed Euclidean jet bound $D_(upright("out"))$ costs at most
    $C \( D_(upright("out")) \/ a \) H^(r \/ 2)$ in $V$-unit axes for Hessian jets of order $r lt.eq 2$,
    since $a H = Y \/ t gt.eq 1$. The ratio only decreases as $a$ grows.
    Future wells are included in the fixed allowance until their own activations.
  Coast as far in $nu$ as desired. Shortly before the next chosen trigger,
    turn off the severity slope smoothly over a fixed-length $u_s$ interval.
    The margin in (8.38) is sufficient to retain $E_0 gt.eq C_arrow.t
    u_s \( nu_B \)$ after this bounded final increment, by making the cap endpoint large enough.
    The existing raw jet bounds can also be absorbed by making that endpoint large.
    This produces (8.16) and the next cap data. ◻
]

=== 8.6 Global realization and completeness <global-realization-and-completeness>

We now carry out the recursion. At each stage first extend the cap so that its trigger starts beyond all previous
  stages and with $nu_B gt.eq j$. Fix its old-data bounds and testing height by Lemma 25.
  Then choose $c$ large enough for (8.20), the polynomial approximation for $h_j$, (8.13),
  and all the finite thresholds in the trigger, test, post ramp, and aligned entry.
  The later finite center-change targets are chosen in the order proved in Lemma 28. Lemma 29 completes the cycle.
  Thus no clock or already configured profile is determined by an unknown future well.

For completeness, the future allowance is valid in every kind of local regime.
  In a quiet interval, later wells have positive-semidefinite Hessians and bounded absolute jets;
  they preserve $G gt.eq V$, and the preceding connection proof uses exactly these bounds.
  In an aligned or switch interval, their scaled Hessian jets are bounded by $C \/ \( a_psi H \)$,
  which fits the reserved part of $delta \/ H$ at the large chosen $a_psi$.
  In a center move, their values change the radius estimates by at most a fixed factor,
  and their scaled derivatives are within the old-data allowance included before choosing the shift.
  On a shear collar they lower the twist by at most one, already included in the lower bound used for its
  coefficient. Consequently the local lemmas apply to the final infinite twist for every fiber radius,
  even though curvature margins need not have a positive infimum over all fiber radii.

The condition $nu_B gt.eq j$ rules out finite accumulation of stages.
  Any compact spatial set lies before the activation of all sufficiently late wells.
  For a fixed derivative order $r$, those later wells satisfy $\| partial^(\[ r \]) W_j \| lt.eq
  2^(- j)$ once $j + 4 gt.eq r$. The Weierstrass criterion in every derivative order proves compact-smooth
  convergence of $sum_j W_j$. The $Z$ terms and nonconstant offsets are locally finite.
  Flat-ended transitions, finite positive clock evolutions,
  and the prescribed initial data therefore give global smooth spatial data.
  On a compact spatial set the profile is smooth to $tau = 0$ with $q \( 0 \, s \) = 1$; its normalized $F -
  x$ is smooth there as well. The smooth inversion at the fiber center therefore gives a global smooth potential

$ ell \( s \, y \) = ell_(upright("rad")) \( s \, y \) + "Re" #scale(x: 120%, y: 120%)[\(]
  c_(upright("sh")) \( s \) \( y - zeta \( s \) \) #scale(x: 120%, y: 120%)[\)] . $

The shears are absent where the center changes. All local curvature and positivity conclusions apply,
  including the fiber axes by their smooth limits.

We spell out the metric comparison used for completeness.
  In the constant-center regimes the Schur metric is bounded below by a fixed positive multiple of $V$;
  during profile switches, positivity of $cal(N)$ for all $tau$ also gives $h = V +
  integral_0^tau cal(N) thin d v gt.eq V$. The shear and moving-center comparisons can each be chosen to lose at
  most a factor $1 \/ 2$. Their spatial supports are separated,
  so these losses do not multiply over infinitely many stages at a point. Hence a single $c_1 > 0$ satisfies

#[#set math.equation(numbering: n => "(8.39)")
 $ g_ell \( dot(s) \, dot(y) \) gt.eq c_1 V \( dot(s) \, dot(s) \) gt.eq
   c_1 a_(upright("init")) \| dot(s) \|^2 $ <assembly:spatial-completeness>]

everywhere.

A finite-length curve therefore has finite Euclidean spatial variation and remains in a compact spatial set.
  On such a compact set, for large $\| y \|$, the metric is also bounded below by a fixed positive multiple of the
  frozen log-block metric at the point. The tilt coefficients are uniformly bounded in $tau$ there.
  Indeed they are spatial derivatives of $psi - F$: on quiet intervals they use bounded $F_E$;
  on switch intervals they use bounded $F_beta$, which is constant in $x$ past the fixed switch cutoff;
  and on a center move the profile is spatially fixed apart from the already bounded twist.
  There are only finitely many profile episodes on the compact set, and the well sum is smooth.
  Thus some compact-set constant $C_K$ bounds the tilt one-form.

Also $q gt.eq 1$ and $F lt.eq x$, so at sufficiently large $\| y \|$ the fiber value satisfies $tau gt.eq
  1$ and $P = tau q gt.eq 1$, uniformly on the compact spatial set.
  The frozen fiber differential is $d y \/ \( y - zeta \( s \) \)$;
  freezing means that the center has its point value in this comparison.
  The block bound and the triangle inequality imply along the curve, when $\| y \|$ is large,

$ frac(\| d y \|, \| y - zeta \( s \) \|) lt.eq C_K thin d s_(g_ell) + C_K \| d s \| . $

Both terms on the right have finite integral by (8.39). Since $\| zeta \( s \) \| < 1$,
  this bounds the total variation of $log \| y \|$ outside a fixed disk and prevents fiber escape.
  Thus no divergent curve has finite length. Equivalently, a Cauchy sequence lies in a compact Euclidean
  coordinate set, where the smooth positive metric gives convergence. The base metric is complete.

#proof[
  The recursion gives a smooth strictly plurisubharmonic potential on $bb(C)^(n + 1)$,
    with nonpositive real sectional curvature by the local lemmas and completeness by the preceding argument.
    Every required pair $\( zeta \, h \)$ is tested infinitely often.
    The stages satisfy $R gt.eq 1$, $N arrow.r oo$, $c arrow.r oo$, $log N lt.eq .005 c < c \/ 100$, $D_j arrow.r
    oo$, and $D_j \/ c_j arrow.r 0$. Lemma 25 supplies the height bound.
    The node disks, sphere derivative bound, and shear amplitude have the fixed exponents (8.11).
    Their phases were chosen as permitted by Proposition 8, and their geometric realization allows all those
    choices. That proposition proves the asserted Liouville property. ◻
]

#prodef([Remark 8.8.])[
  The potential is necessarily unbounded below, and this can also be seen directly from the disks.
    At a testing node choose $y - zeta_j = - 1 / 2 e^(m_0 c) overline(b_v)$.
    The radial increment is at most one, whereas the shear contributes $- 1 / 2 alpha e^(m_0 c)$. Thus
  $ ell \( s \, y \) lt.eq D_j + 1 - 1 / 2 e^(\( m_0 - p_1 \) c) arrow.r - oo . $
  Here $m_0 > p_1$ and $c \/ \( D_j + 1 \) arrow.r oo$. In particular the elementary holomorphic functions
    $e^(i k w)$, $k > 0$, are unbounded on the tube; they do not contradict its bounded-function conclusion.
] <assembly:potential-unbounded>

#proof[
  #emph[Completion of the proof of Theorem 1.] Apply Lemma 2 to the base just constructed.
    Its tube is connected, complete, and diffeomorphic to Euclidean space, hence simply connected.
    Its real sectional curvatures are at most $- 1$ by that lemma,
    and its bounded holomorphic functions are constant by Proposition 23.
    The complex dimension is the fixed finite $m = n + 2$.
  There is no finite lower sectional-curvature bound. At $s = 0 \, y = zeta_1$,
    the center and profile are constant nearby and there is no shear.
    On the center axis the spatial curvature tensor of the base equals that of $V$:
    the added radial-fiber potential vanishes to second order in $y - zeta_1$,
    and its cubic derivatives with two spatial indices and one fiber index vanish there.
    The initial radial metric has a strictly negative holomorphic-plane curvature in a spatial direction.
    Corollary 3 therefore shows that the tube’s sectional curvatures are unbounded below.
    This proves every assertion of Theorem 1. ◻
]

===== 8.6.1 The two-sided question. <the-two-sided-question.>

Neither this example nor the independent pinched threefold of
  #cite(label("OpenAIPinchedThreefold2026"), form: "prose") Theorem 1.1 decides whether a nonconstant bounded
  holomorphic function must exist under finite two-sided negative real sectional pinching.
  The present curvature is unbounded below, while the threefold retains nonconstant bounded base-coordinate functions.

#bibliography("refs.bib", style: "ieee", title: [References])
