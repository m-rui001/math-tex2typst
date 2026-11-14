#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[The critical dimension for one-phase Bernoulli minimizers]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a nonnegative function $v in H^1 \( B \)$, where $B subset bb(R)^d$ is a ball, the one-phase Bernoulli energy is

#[#set math.equation(numbering: n => "(1.1)")
 $ J \( v \; B \) = integral_B #scale(x: 120%, y: 120%)[\(] \| nabla v \|^2 +
   upright(bold(1))_({ v > 0 }) #scale(x: 120%, y: 120%)[\)] thin d x . $ <eq:energy>]

A nonnegative $u in H_(upright("loc"))^1 \( bb(R)^d \)$ is a #emph[global minimizer] if $J \( u \; B \) lt.eq
  J \( v \; B \)$ for every ball $B$ and every nonnegative $v in H^1 \( B \)$ with $v - u in H_0^1 \( B \)$.
  The competitors in these comparisons are arbitrary Sobolev functions with the prescribed trace.
  A function is #emph[one-homogeneous] if $u \( r x \) = r u \( x \)$ for every $r > 0$, almost everywhere in $x$.
  The nonzero flat solutions are

$ u \( x \) = \( x dot.op e \)_(+) \, wide \| e \| = 1 . $

Let $d_(*)$ be the least dimension containing a nonzero, nonflat, one-homogeneous global minimizer.

#thm([Theorem 1.1.])[
  #emph[Every nonzero one-homogeneous global minimizer of (1.1) in $bb(R)^d$, $1 lt.eq d lt.eq 6$, is flat.
    There is a nonflat one-homogeneous global minimizer in $bb(R)^7$. Consequently,
$ d_(*) = 7 . $

]
] <thm:main>

A nonnegative $u in H_(upright("loc"))^1 \( D \)$ is a local minimizer in an open set $D subset
  bb(R)^n$ if it satisfies the same comparison on every ball compactly contained in $D$.
  At an interior free-boundary point $x_0$, a #emph[blowup] is a locally uniform limit of $u \( x_0 + r x \) \/
  r$ along radii tending to zero. A point is regular if one such limit is a flat solution, and singular otherwise.
  Write $"Sing" \( u \)$ for the set of singular points in $D$.

#thm([Corollary 1.2.])[
  (Sharp singular-set bound).  #emph[Let $n gt.eq 2$, let $D subset bb(R)^n$ be open,
    and let $u in H_(upright("loc"))^1 \( D \)$ be a nonnegative local minimizer of the one-phase Bernoulli energy
    in $D$. Its interior free boundary is smooth outside $"Sing" \( u \)$.
    This set is empty when $n lt.eq 6$, is locally finite when $n = 7$, and satisfies
$ dim_(upright(H)) "Sing" \( u \) lt.eq n - 7 wide \( n gt.eq 7 \) . $

 For every $n gt.eq 7$, a global minimizer attains this dimension bound.]
] <cor:singular-set>

The upper bound is the standard dimension-reduction consequence of the critical dimension,
  and sharpness follows by taking Cartesian products of the De Silva–Jerison cone with Euclidean space.
  We verify these deductions in Section 8.

The variational theory of the one-phase Bernoulli problem begins with Alt and Caffarelli’s existence and
  regularity theory [1]. Weiss’s monotonicity formula and dimension reduction [18] connect the singularities of
  general minimizers to homogeneous global minimizers; see also [17] Theorem 1.4 and Chapters 9–10.
  Thus the first dimension admitting a nonflat minimizing cone determines both the threshold for singular free
  boundaries and the codimension bound furnished by this theory.
  Our main result answers positively the critical-dimension question whether $d_(*) = 7$.

A second strand of the theory passes from weak free boundaries to classical ones.
  Caffarelli’s Harnack-inequality approach established regularity for Lipschitz free boundaries [2].
  De Silva developed a different improvement-of-flatness argument allowing a nonzero right-hand side [4]
  Theorems 1.1–1.2; this is the approach presented in the regularity chapters of [17].
  Higher regularity has classical antecedents in Kinderlehrer and Nirenberg [14] Theorem 2.
  The version used here, for Lipschitz viscosity solutions, is due to De Silva,
  Ferrari and Salsa [6] Theorem 1.1 and Corollary 1.2. These results make a classification of homogeneous
  minimizing blowups applicable to general local minimizers.

As recalled by Jerison and Savin [13] Introduction, the dimension-three rigidity result for stable homogeneous
  solutions with smooth cross-section is due to Caffarelli, Jerison and Kenig [3].
  Jerison and Savin proved that stable homogeneous solutions with smooth cross-section are flat in dimensions at
  most four [13] Theorem 1.1; their regularity consequence for minimizers [13] Corollary 1.2 gives $d_(*) gt.eq
  5$. Their argument constructs functions of the Hessian satisfying inequalities for the linearized free-boundary
  problem. In the other direction, De Silva and Jerison constructed a nonflat homogeneous global minimizer in
  dimension seven [7] Theorem 1.1, proving $d_(*) lt.eq 7$.
  The minimizing property in that construction is with respect to all Sobolev competitors with the prescribed
  boundary trace. Firester, Tsiamis and Wang also construct further symmetric minimizing one-phase cones,
  including a second example in dimension seven [11] Theorem 1.4.

Recent work further describes cones with symmetry. Firester,
  Tsiamis and Wang [10] Theorem 1.1 prove that their cohomogeneity-one cones with $O \( n - k \) times
  O \( k \)$ symmetry, $1 lt.eq k lt.eq n - 2$, are unstable for $n lt.eq 6$ and strictly stable for $n gt.eq 7$.
  The exclusion proved here applies to globally minimizing cones without a symmetry assumption.

Cone classification also differs from rigidity of arbitrary entire stable solutions.
  Fernández-Real and Serra prove that every global classical stable solution in dimension four is one-dimensional
  [8] Theorem 1.1. Their result removes homogeneity in that dimension.

For an admissible increasing family of nonnegative boundary data,
  Fernández-Real and Yu prove regularity through dimension six for almost every parameter [9] Assumption 1 and
  Theorem 1.3. This is a generic-data result: the increase is required at a fixed linear rate on the positive set
  of the smaller boundary datum.

===== 1.1 The obstacle and the proof strategy. <the-obstacle-and-the-proof-strategy.>

The stability inequality compares the Dirichlet energy of a test function with a curvature term on the free
  boundary. The use of the harmonic Hessian has a geometric precedent in Simons’s second-fundamental-form argument
  for minimal cones [16] Section 6.1, a connection developed explicitly by Jerison and Savin.
  A natural Bernoulli test is a power of the Hessian norm. Jerison and Savin explain why this unweighted choice
  does not give a uniform instability criterion in dimensions four through six:
  the interior and boundary estimates impose different restrictions on the power,
  and their sharp configurations need not agree [13] Section 3.2.
  Their four-dimensional argument uses a more refined function of the Hessian eigenvalues [13] Section 4.

Our proof uses the normalized shape of the Hessian to construct both a scalar test and a separate vector field
  whose divergence controls the test’s energy. The two constructions are chosen together,
  so the interior and boundary estimates retain the same tensor data. The proof has three stages.

First, suppose the first nonflat minimizing cone occurs in dimension five or six.
  Blowups away from its vertex reduce the dimension and are therefore flat.
  Regularity theory makes each component of its spherical positive set smooth,
  and at least one component has nonzero Hessian. A five-dimensional cone can be made independent of one extra
  coordinate without losing minimality. Its spherical link then has precisely two exceptional tips.
  Thus both possible dimensions lead to a domain $Omega subset S^5$ with a smooth regular boundary and, possibly,
  these two tips (Section 2).

Second, let $g$ be the restriction of the resulting cone to the sphere, and set $T = nabla^2 g +
  g "Id"$ and $w = \| T \|$. Where $w > 0$, we construct a positive scalar $h$ from $w$,
  the normalized tensor $T \/ w$, $g$, and $nabla g$, and a vector field $Z$ from the same data and $nabla T \/
  w$. The target inequalities are

$ "div" Z gt.eq \| nabla h \|^2 + 4 h^2 + epsilon.alt_(*) w^(2 a) \, wide N dot.op Z + H h^2 gt.eq 0 \, $

where $a in \( 1 \/ 2 \, 1 \)$ is fixed, $epsilon.alt_(*) > 0$, $N$ points into $Omega$, and $H = -
  T \( N \, N \)$. Spherical stability supplies the reverse integrated comparison between the test’s energy and
  its boundary curvature term. The extra positive mass $epsilon.alt_(*) w^(2 a)$ will give the contradiction.
  The geometry and stability inequality are developed in Section 3.
  We then state the universal tensor inequality and derive the two geometric comparisons;
  the full exact verification follows in Section 6.

Two cancellations make this construction possible. A Laplacian contraction and an antisymmetric curvature
  contraction eliminate fourth derivatives from $"div" Z$. At the boundary,
  reflection in the normal direction removes the derivative components not determined by the boundary conditions.
  The remaining inequalities involve only finitely many normalized tensors.
  We prove them by weighted sums of tensor squares and exact rational remainder bounds,
  with all coefficients and contraction conventions supplied in Appendix 9.

Finally, neither the normalized Hessian nor its derivatives are defined at $w = 0$,
  and suspension introduces singular tips. These sets cannot be discarded without an estimate.
  A regularized Bochner identity gives an integrable weight controlling the derivatives near every Hessian zero.
  The explicit suspension formulas give an integrable power of the distance parameter at both tips.
  Smooth product cutoffs therefore remove both obstructions and make all error terms vanish.
  Section 7 completes the stability contradiction.

===== 1.2 Organization and conventions. <organization-and-conventions.>

Section 2 reduces a hypothetical first nonflat minimizer to a smooth spherical component in dimension six,
  allowing two suspension tips. Section 3 derives the tensor identities and the stability inequality.
  Section 4 states the universal algebraic estimate, and Section 5 derives the pointwise geometric comparison from
  it. Section 6 gives the complete exact verification; Section 7 then removes the cutoffs to obtain the
  contradiction. Section 8 gives the regularity and sharpness consequences. Appendix 9 gives all coefficient data.
  All tensor norms and contractions use orthonormal frames.
  Repeated indices are summed, $Delta = "tr" nabla^2$, and a boundary normal denoted by $N$ points into the
  positive phase. The curvature $H = - T \( N \, N \)$ used below is not divided by the dimension of the boundary.

== 2 Reduction to a smooth link and its suspension <red:section>

We first record the consequences of energy minimality needed to put the argument on a smooth spherical domain.
  Throughout Section 2, a minimizer has the full ballwise Sobolev comparison property defined in Section 1.

=== 2.1 The regularity inputs <red:regularity-inputs>

The ballwise convention also gives comparison on every bounded open set $O subset.double bb(R)^d$:
  extend an $H_0^1 \( O \)$ competitor difference by zero into a ball containing $overline(O)$,
  apply minimality there, and cancel the energy outside $O$.
  Conversely, comparison on bounded open sets includes comparison on balls.
  It is even enough to have comparison against #emph[arbitrary] admissible competitors in every origin-centered
  ball, by the same extension argument. There is no restriction to homogeneous competitors.

The convention that competitors are nonnegative makes no difference to the standard one-phase results.
  If $v - u in H_0^1 \( O \)$ and $u gt.eq 0$, then $v_(+) - u in H_0^1 \( O \)$ and

$ integral_O #scale(x: 120%, y: 120%)[\(] \| nabla v_(+) \|^2 +
  upright(bold(1))_({ v_(+) > 0 }) #scale(x: 120%, y: 120%)[\)] lt.eq
  integral_O #scale(x: 120%, y: 120%)[\(] \| nabla v \|^2 +
  upright(bold(1))_({ v > 0 }) #scale(x: 120%, y: 120%)[\)] . $

For completeness, the assertion about $H_0^1 \( O \)$ follows by approximating $v -
  u$ in $H^1$ by compactly supported smooth functions and applying the continuity of positive-part truncation in
  $H^1$; the truncated differences in the approximation have compact support in $O$.

#thm([Proposition 2.1.])[
  (Regularity and blowups of minimizers).  #emph[Let $d gt.eq 2$ and let $u gt.eq
    0$ be a local minimizer of the one-phase energy with volume coefficient $1$ in an open set $D subset bb(R)^d$.]
  + #emph[There is a locally Lipschitz representative of $u$, and it is harmonic in ${ u > 0 }$.]
  + #emph[If $x_0 in D ∩ partial { u > 0 }$, every sequence $r_j arrow.b 0$ has a subsequence for which
#[#set math.equation(numbering: n => "(2.1)")
 $ u_(x_0 \, r_j) \( y \) := frac(u \( x_0 + r_j y \), r_j) arrow.r U \( y \) $ <red:blowup-sequence>]

 locally uniformly in $bb(R)^d$. The limit is a nonzero, nonnegative, one-homogeneous global minimizer.
   Along a further subsequence the convergence is strong in $H_(upright("loc"))^1$,
   and the positivity indicators converge in $L_(upright("loc"))^1$.]
  + #emph[If one such limit equals $\( y dot.op e \)_(+)$ with $\| e \| = 1$,
    then near $x_0$ the free boundary is a smooth hypersurface and ${ u > 0 }$ is exactly one of its sides.
    The function $u$ is smooth up to that hypersurface from the positive side, and
#[#set math.equation(numbering: n => "(2.2)")
 $ u = 0 \, wide nabla u = N_E quad upright("on the free boundary") \, $ <red:bernoulli>]

 where $N_E$ is the Euclidean unit normal pointing into ${ u > 0 }$.]
] <red:regularity>

#proof[
  #emph[Sources and applicability.] We use the constant-coefficient theory with $Lambda = 1$ in [17].
    For each ball $B subset.double D$, the restriction of $u$ to $B$ minimizes against every $H_0^1 \( B \)$
    competitor difference. Zero extension of differences therefore gives comparison on every $O subset.double B$,
    as required by Definitions 2.11–2.12 there. We apply the local results inside such balls.
    For global minimizers, the containing-ball argument above gives the comparison convention on all bounded open
    sets. Local Lipschitz continuity is Theorem 3.1. Harmonicity also follows directly:
    for a smooth test supported compactly in the positive phase,
    both signs of a sufficiently small additive variation preserve that phase,
    so the Dirichlet first variation vanishes.
  The Lipschitz bound and $u \( x_0 \) = 0$ give locally uniform compactness of the rescalings.
    Proposition 4.1 gives $sup_(B_r \( x_0 \)) u gt.eq kappa r$ for small $r$, with $kappa > 0$,
    so a limit cannot vanish identically. Proposition 6.2 gives strong Sobolev and positivity-indicator
    convergence and the full minimizing property of the limit; Proposition 9.12 gives its one-homogeneity.
    All these statements can be applied in a bounded ball compactly contained in $D$ before taking the rescalings.
    In particular, the assertion about minimality is the minimizing compactness result, including the volume term.
  Definition 6.10 and Corollary 8.2, with the one-sided graph conclusion in Theorem 8.1,
    give a $C^(1 \, alpha)$ regular neighborhood from a single half-space blowup.
    Proposition 7.1 supplies the viscosity Bernoulli condition.
  To justify all subsequent boundary derivatives, use [6] Theorem 1.1 and Corollary 1.2 with $f_(+) = f_(-) =
    0$ and $G \( b \) = 1 + b$. We check the two-phase viscosity condition of [5] Definition 7.1 when $u gt.eq 0$.
    Let $v$ be a comparison touching $u$ at a free-boundary point $x_0$,
    with a $C^2$ interface and $C^2$ branches having nonnegative normal slopes $a$ and $b$ on its positive and
    negative sides. If $v$ touches from below, then $v_(+) lt.eq u$ in a neighborhood.
    For $a > 0$, extend its positive branch to a signed $C^2$ function $phi.alt$,
    negative just across the interface; then $phi.alt lt.eq u$ and touches at $x_0$.
    The one-phase condition gives $a lt.eq 1 lt.eq G \( b \)$; the case $a = 0$ is immediate.
    If $v$ touches from above, the neighborhood inequality $v gt.eq u gt.eq 0$ forces $v = u =
    0$ throughout its nonpositive side, so $b = 0$. A $C^2$ extension $phi.alt$ of its positive branch satisfies
    $phi.alt_(+) gt.eq u$ on both sides and touches at $x_0$.
    Thus the one-phase condition gives $a gt.eq 1 = G \( 0 \)$.
    These uses of the one-phase condition are justified by [17] Definition 7.6 and Proposition 7.1:
    to meet its smooth-test convention, replace each $C^2$ extension by its quadratic Taylor polynomial minus,
    respectively plus, $epsilon \| x - x_0 \|^2$. For any $epsilon > 0$,
    these are smooth lower and upper supports in a sufficiently small neighborhood,
    with the same contact value and gradient.
  The interior equations hold because $u$ is harmonic where positive and identically zero on the interior of its
    zero set. The function $G$ is smooth, strictly increasing and unbounded, with $G \( 0 \) = 1$;
    the cited results allow the negative phase to vanish. The preceding $C^(1 \, alpha)$ one-sided graph satisfies
    the slab flatness hypothesis after rotation and sufficiently small dilation,
    while the local Lipschitz bound is preserved. Theorem 1.1 gives $C^(2 \, gamma)$ regularity,
    and Corollary 1.2 gives smoothness. Local harmonic boundary regularity with zero Dirichlet data [12]
    Theorems 4.30–4.31 and Corollary 4.32 then gives smoothness of $u$ from the positive side.
    These estimates apply after flattening a smooth boundary patch and localizing away from its artificial
    boundary; iteration and Sobolev embedding give every required derivative.
    The Bernoulli condition and nonnegativity give (2.2). ◻
]

As in Section 1, a free-boundary point is regular if it has a half-space blowup and singular otherwise.
  Proposition 3 explains the geometric meaning of regularity.
  Conversely, a smooth one-sided free boundary with (2.2) has a half-space blowup by its first-order Taylor
  expansion. We henceforth use the continuous representative of a minimizer.
  If it is one-homogeneous almost everywhere, it is one-homogeneous everywhere:
  for each fixed $r > 0$, both sides of $u \( r x \) = r u \( x \)$ are continuous and agree almost everywhere.

=== 2.2 Dimension reduction at a nonzero point <red:dimension-reduction>

The next two lemmas give the dimension-reduction steps explicitly; compare [17] Lemmas 10.9–10.10.

#thm([Lemma 2.2.])[
  (Translation invariance of an off-origin blowup).  #emph[Let $u$ be a one-homogeneous global minimizer,
    let $0 eq.not x_0 in partial { u > 0 }$, and let $U$ be any limit in (2.1). Then
$ U \( y + t x_0 \) = U \( y \) wide \( y in bb(R)^d \, med t in bb(R) \) . $

]
] <red:translation>

#proof[
  Write $u_r = u_(x_0 \, r)$. For fixed $t in bb(R)$ and small $r > 0$, set $r' = r \/ \( 1 + r t \) > 0$.
    Homogeneity gives the exact identity
  #[#set math.equation(numbering: n => "(2.3)")
   $ u_r \( y + t x_0 \) =
     frac(u #scale(x: 120%, y: 120%)[\(] \( 1 + r t \) \( x_0 + r' y \) #scale(x: 120%, y: 120%)[\)], r) =
     u_(r') \( y \) . $ <red:rescaling-identity>]
  Let $L$ be a Lipschitz constant for $u$ on a fixed neighborhood of $x_0$.
    Since $u \( x_0 \) = 0$, for $\| y \| lt.eq M$ and small $r$,
  $ \| u_(r') \( y \) - u_r \( y \) \| & lt.eq frac(L \| r - r' \| M, r') + L r M lr(|1 / r' - 1 / r|)\
 & = 2 L M frac(\| r - r' \|, r') = 2 L M \| t \| r . $
  Thus the $r'$ rescalings along the same chosen sequence have the same locally uniform limit as the $r$
    rescalings. Passing to that limit in (2.3) proves the assertion for every fixed $y \, t$.
    No uniqueness of blowups is required. ◻
]

#thm([Lemma 2.3.])[
  (Minimality of a translation-invariant factor).  #emph[Suppose $U \( y \, s \) =
    v \( y \)$ is a global minimizer in $bb(R)^k times bb(R)$, where $v gt.eq
    0$ belongs to $H_(upright("loc"))^1 \( bb(R)^k \)$. Then $v$ is a global minimizer in $bb(R)^k$.]
] <red:factor-minimality>

#proof[
  Suppose that a ball $B subset bb(R)^k$ admits a nonnegative $q in H^1 \( B \)$ with $q - v in H_0^1 \( B \)$ and
  $ J \( v \; B \) - J \( q \; B \) = delta > 0 . $
  Let $psi$ be the zero extension of $q - v$. For $L > 1$, choose $eta_L :
    bb(R) arrow.r \[ 0 \, 1 \]$ equal to $1$ on $\[ - L \, L \]$, equal to $0$ outside $\[ - L - 1 \, L + 1 \]$,
    and linear on each intervening interval. Define
  $ V_L \( y \, s \) = U \( y \, s \) + eta_L \( s \) psi \( y \) . $
  This function is nonnegative: on $B times bb(R)$ it is the convex combination $\( 1 - eta_L \) v + eta_L q$.
    Its difference from $U$ belongs to $H^1$ and has compact support in a sufficiently large ball $cal(B)_L subset
    bb(R)^(k + 1)$, so it belongs to $H_0^1 \( cal(B)_L \)$.
  The energy difference on $B times \[ - L \, L \]$ is $- 2 L delta$. On either transition cylinder, convexity gives
  $ \| nabla_y V_L \|^2 lt.eq \( 1 - eta_L \) \| nabla v \|^2 + eta_L \| nabla q \|^2 \,
    wide \| partial_s V_L \|^2 lt.eq \| q - v \|^2 . $
  The difference of the positivity indicators is at most $1$.
    Hence the sum of the two transition contributions is bounded above by
  $ C = 2 integral_B #scale(x: 120%, y: 120%)[\(] \| nabla q \|^2 + \| q - v \|^2 + 1 #scale(x: 120%, y: 120%)[\)] \, $
  independently of $L$. Outside these three cylinders the energy is unchanged. Thus
  $ J \( V_L \; cal(B)_L \) - J \( U \; cal(B)_L \) lt.eq - 2 L delta + C < 0 $
  for large $L$, contradicting minimality of $U$. ◻
]

In dimension one, every nonnegative one-homogeneous Sobolev function has the form $u \( x \) = b_(+) x_(+) +
  b_(-) \( - x \)_(+)$ with $b_(+) \, b_(-) gt.eq 0$. If both slopes are positive,
  a nonnegative smooth bump $phi.alt$ supported in $\( - R \, R \)$ with $phi.alt \( 0 \) >
  0$ preserves positivity volume and gives

$ J \( u + tau phi.alt \; \( - R \, R \) \) - J \( u \; \( - R \, R \) \) = -
  2 tau \( b_(+) + b_(-) \) phi.alt \( 0 \) + tau^2 integral_(- R)^R \| phi.alt' \|^2 < 0 $

for small $tau > 0$. Thus a nonzero minimizing cone has just one positive slope.
  After reflection write $u \( x \) = b x_(+)$, $b > 0$. The competitors $v_t \( x \) =
  b R \( x - t \)_(+) \/ \( R - t \)$ on $\( - R \, R \)$, $\| t \| < R$,
  have the same trace and energy $b^2 R^2 \/ \( R - t \) + \( R - t \)$.
  Its derivative at the minimizing parameter $t = 0$ is $b^2 - 1 = 0$, so $b = 1$.
  This proves flatness in dimension one directly.

The lower-dimensional classification of Jerison–Savin [13] Theorem 1.1 and Corollary 1.2 and the dimension-seven
  minimizing example of De Silva–Jerison [7] Theorem 1.1 give $5 lt.eq d_(*) lt.eq 7$.
  De Silva–Jerison’s Theorem 1.1 uses the same functional and arbitrary ballwise Dirichlet competitors.
  For the exclusion argument, suppose from now on that

#[#set math.equation(numbering: n => "(2.4)")
 $ d = d_(*) in { 5 \, 6 } \, $ <red:first-dimension>]

and fix a nonzero nonflat one-homogeneous global minimizer $u$ in $bb(R)^d$.

#thm([Proposition 2.4.])[
  (Smooth original link).  #emph[Every point of $partial { u > 0 } \\ { 0 }$ is regular.
    Put $m_o = d - 1$ and $g_o = u \|_(S^(m_o))$. The set ${ g_o > 0 }$ is nonempty and proper,
    has finitely many connected components, and their closures are pairwise disjoint compact smooth manifolds with
    boundary. On each such component $Omega_o$, the restriction of $g_o$ is smooth up to the boundary from within
    $Omega_o$ and satisfies
#[#set math.equation(numbering: n => "(2.5)")
 $ Delta_(S^(m_o)) g_o = - m_o g_o quad upright("in ") Omega_o \, wide g_o = 0 \, quad nabla_(S^(m_o)) g_o =
   N_o quad upright("on ") partial Omega_o \, $ <red:link-equations>]

 where $N_o$ is the inward spherical unit normal. In particular, $partial Omega_o eq.not diameter$.]
] <red:original-link>

#proof[
  At a nonzero free-boundary point $x_0$, choose a blowup $U$ from Proposition 3.
    By Lemma 4, in orthogonal coordinates $bb(R)^d = x_0^perp times bb(R)$ it has the form $U \( y \, s \) =
    v \( y \)$. The factor $v$ is locally Lipschitz, nonnegative, nonzero and one-homogeneous.
    Lemma 5 shows that it is a global minimizer. Since its dimension is $d - 1 < d_(*)$, it is flat.
    Therefore $U$ itself is a half-space solution, and Proposition 3 makes $x_0$ regular.
  The spherical positive set is nonempty by nontriviality. The polar-coordinate formula for the Euclidean
    Laplacian of $u \( r y \) = r g_o \( y \)$ gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ Delta_(bb(R)^d) u \( r y \) = r^(- 1) #scale(x: 120%, y: 120%)[\(] Delta_(S^(m_o)) g_o \( y \) +
     m_o g_o \( y \) #scale(x: 120%, y: 120%)[\)] $ <red:polar-laplacian>]
  in the positive phase. If $g_o > 0$ on the entire sphere,
    integrating the harmonicity identity over the sphere would give $m_o integral g_o = 0$, a contradiction.
    Thus its positive set is proper.
  The conical free boundary has the radial direction tangent to it at every nonzero point:
    the curve $r mapsto r x$ lies in that free boundary. Consequently its smooth hypersurface is transverse to the
    unit sphere, and their intersection is a smooth hypersurface of $S^(m_o)$.
    Its regular charts have the spherical positive phase exactly on one side.
    Each point of the sphere therefore has a neighborhood whose intersection with ${ g_o >
    0 }$ is either connected or empty (using a small ball for points away from the free boundary).
    A finite subcover of the sphere shows that there are only finitely many positive components.
    If two component closures met, their common point would be a free-boundary point;
    the connected positive side of a regular chart there would meet both components, forcing them to coincide.
    The same charts show that each closure is a smooth compact domain.
    Each component has nonempty boundary because the sphere is connected and the positive set is proper.
  Smoothness of $u$ from its positive side gives smoothness of $g_o$ on these closures.
    Equation (2.6) gives the interior equation in (2.5). On the boundary, the radial derivative of $u$ is $g_o =
    0$, so the Euclidean gradient is tangent to the sphere. Equation (2.2) then gives the remaining boundary
    conditions. ◻
]

#thm([Lemma 2.5.])[
  (Selection of a nonflat component).  #emph[There is a component $Omega_o$ in Proposition 6 such that
#[#set math.equation(numbering: n => "(2.7)")
 $ T_o := nabla_(S^(m_o))^2 g_o + g_o "Id" equiv.not 0 quad upright("on ") Omega_o . $ <red:original-hessian>]

 Here $"Id"$ denotes the spherical metric, viewed as a symmetric two-tensor.]
] <red:nonflat-component>

#proof[
  For $y$ in the spherical positive set and $r > 0$,
  $ nabla_(bb(R)^d) u \( r y \) = g_o \( y \) y + nabla_(S^(m_o)) g_o \( y \) . $
  Differentiating this formula, or using Euler’s identity for the radial entries, gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ D^2 u \( r y \) \[ y \, dot.op \] = 0 \, wide D^2 u \( r y \) \[ v_1 \, v_2 \] =
     r^(- 1) T_o \( y \) \[ v_1 \, v_2 \] quad \( v_1 \, v_2 perp y \) . $ <red:ambient-hessian>]
  Suppose that $T_o$ vanished identically on every positive component.
    Then $D^2 u = 0$ on each corresponding connected open cone $D_i$, so $u \( x \) = b_i dot.op x + c_i$ there.
    Homogeneity forces $c_i = 0$, and positivity forces $b_i eq.not 0$.
    Thus $D_i subset H_i := { b_i dot.op x > 0 }$. The set $D_i$ is also closed relative to $H_i$:
    if $x in overline(D_i) ∩ H_i$, continuity gives $u \( x \) = b_i dot.op x > 0$;
    a small positive neighborhood of $x$ meets $D_i$, hence belongs to the same component.
    Since $H_i$ is connected, $D_i = H_i$. The Bernoulli condition at any nonzero point of its boundary gives $\|
    b_i \| = 1$.
  Two disjoint open half-spaces through the origin must have opposite unit normals:
    if their normals are $e \, f$ with $f eq.not - e$, the vector $e + f$ lies in both.
    But opposite half-spaces have spherical closures meeting along the equator $e^perp ∩ S^(m_o)$,
    contrary to the pairwise disjoint closures in Proposition 6.
    Thus there is exactly one positive component, and $u = \( x dot.op e \)_(+)$, contrary to nonflatness.
    This proves (2.7). ◻
]

=== 2.3 Suspension and the working domain <red:suspension-subsection>

#thm([Proposition 2.6.])[
  (Suspension preserves global minimality).  #emph[If $u gt.eq 0$ is a global minimizer in $bb(R)^k$,
    then $tilde(u) \( x \, s \) = u \( x \)$ is a global minimizer in $bb(R)^(k + 1)$.
    If $u$ is the cone in (2.4) with $d = 5$, the singular free-boundary set of $tilde(u)$ is exactly ${ 0 } times
    bb(R)$. For the component chosen in Lemma 7, the corresponding positive component on $S^5$ is
#[#set math.equation(numbering: n => "(2.9)")
 $ tilde(Omega) = { Phi \( t \, y \) := \( sin t thin y \, cos t \) : 0 < t < pi \, med
   y in Omega_o #scale(x: 120%, y: 120%)[}] \, wide tilde(g) \( Phi \( t \, y \) \) =
   sin t thin g_o \( y \) . $ <red:suspension-coordinates>]

 Its boundary consists of the smooth side $Phi \( \( 0 \, pi \) times partial Omega_o \)$ and the two singular
   tips $p_(+) = \( 0 \, 1 \)$ and $p_(-) = \( 0 \, - 1 \)$.]
] <red:suspension>

#proof[
  Fix a ball $cal(B) = B_R \( \( x_c \, s_c \) \) subset bb(R)^(k + 1)$ and a nonnegative $V in
    H^1 \( cal(B) \)$ with $V - tilde(u) in H_0^1 \( cal(B) \)$.
    Extend that difference by zero to $F in H^1 \( bb(R)^(k + 1) \)$. For $\| s - s_c \| < R$, let
  $ B_s = B_(sqrt(R^2 - \( s - s_c \)^2)) \( x_c \) $
  be the horizontal slice. For almost every such $s$, $F \( dot.op \, s \) \|_(B_s) in H_0^1 \( B_s \)$.
    To see the zero-boundary assertion without a trace regularity assumption on $V$,
    approximate $F$ in $H^1 \( bb(R)^(k + 1) \)$ by the zero extensions of functions in $C_c^oo \( cal(B) \)$.
    After passing to a subsequence, Fubini’s Theorem gives convergence of their slices to $F \( dot.op \, s \)$ in
    $H^1 \( bb(R)^k \)$ for almost every $s$. Each approximating slice lies in $C_c^oo \( B_s \)$,
    so the assertion follows by closure.
  For almost every $s$, $V_s = V \( dot.op \, s \)$ is therefore an admissible nonnegative competitor for $u$ in
    $B_s$. Integrating its minimizing inequality and using the nonnegativity of the additional derivative energy,
    we obtain
  $ J \( tilde(u) \; cal(B) \) & = integral_(s_c - R)^(s_c + R) J \( u \; B_s \) thin d s\
 & lt.eq integral_(s_c - R)^(s_c + R) J \( V_s \; B_s \) thin d s lt.eq J \( V \; cal(B) \) . $
  This proves the full ballwise minimizing property, for arbitrary centers and arbitrary admissible Sobolev
    competitors. One-homogeneity and nontriviality are plainly preserved.
    Flatness of $tilde(u)$ would force its half-space normal to have zero last coordinate,
    and would therefore force $u$ to be flat.
  In the conical case, $u \( 0 \) = 0$ and a positive ray approaches the origin, so $0 in partial { u > 0 }$.
    The product identity
  $ partial { tilde(u) > 0 } = partial { u > 0 } times bb(R) $
  shows that all its off-axis points are regular: their positive phase is the product of a smooth one-sided
    regular chart for $u$ and an interval. At any axis point $z_0 = \( 0 \, s_0 \)$, every rescaling is exactly
  $ frac(tilde(u) \( z_0 + r \( x \, s \) \), r) = frac(u \( r x \), r) = tilde(u) \( x \, s \) . $
  This is nonflat, so no axis point is regular. The axis meets $S^5$ only in $p_(+)$ and $p_(-)$.
  Away from these two points, $Phi$ is a smooth product coordinate map from $\( 0 \, pi \) times
    S^4$ to $S^5 \\ { p_(+) \, p_(-) }$. Positivity in these coordinates is precisely $g_o \( y \) > 0$,
    so connected components are as in (2.9). Since $overline(Omega_o)$ is compact,
    its suspended closure is obtained by adding the two endpoints of the interval,
    with each endpoint collapsed to its tip. Its remaining boundary is exactly the stated smooth side. ◻
]

===== 2.3.1 Notation for the remaining argument. <red:working-domain>

Fix the original component $Omega_o subset S^(m_o)$ selected in Lemma 7, where $m_o in { 4 \, 5 }$.
  If $m_o = 5$, set $Omega = Omega_o$, $g = g_o$, and $Sigma = diameter$.
  If $m_o = 4$, set $Omega = tilde(Omega)$, $g = tilde(g)$, and $Sigma = { p_(+) \, p_(-) }$.
  In either case $Omega subset S^5$ is connected, and $g$ comes from a nonnegative one-homogeneous global
  minimizer in $bb(R)^6$. The closure is smooth away from $Sigma$,
  with positive phase on one side of its regular boundary

$ partial_(upright("reg")) Omega := partial Omega \\ Sigma . $

All spherical boundary values below are taken from the positive side.
  Tests on $overline(Omega)$ will be smooth and supported away from $Sigma$.
  Every compact portion of the selected Euclidean cone’s closure that avoids the origin and,
  in the suspended case, the axis is separated from all other positive components.
  This follows from the disjoint compact original closures,
  and in the suspension from the same fact on any closed subinterval of $\( 0 \, pi \)$.
  Consequently the local variations on this component can be made as variations of the global minimizer.
  No minimizing property of the selected component extended by zero is needed.

== 3 Spherical geometry and the stability inequality <geo:section>

Let $Omega_o subset S^(m_o)$, $m_o in { 4 \, 5 }$, be the original component supplied by Proposition 6 and
  Lemma 7. Its closure is a compact smooth manifold with nonempty boundary.
  The function $g_o$ is smooth up to that boundary, is positive in $Omega_o$, and satisfies

$ Delta g_o = - m_o g_o \, wide g_o = 0 \, quad nabla g_o = N_o quad upright("on ") partial Omega_o \, $

where $N_o$ is the inward unit normal. Moreover, $nabla^2 g_o + g_o "Id"$ does not vanish identically.
  We give the identities in a general tangent dimension $m$.
  The compact original component first provides strict gradient and boundary-sign bounds;
  we then transport these bounds to the working link and derive its stability inequality.
  All spherical derivatives below are covariant, and $Delta$ on tensors is the rough Laplacian $"tr" nabla^2$.
  Repeated indices in an orthonormal frame are summed.

=== 3.1 The spherical Hessian and its boundary values <the-spherical-hessian-and-its-boundary-values>

For a smooth solution of $Delta g = - m g$ on a domain in $S^m$, set

#[#set math.equation(numbering: n => "(3.1)")
 $ p = nabla g \, wide T = nabla^2 g + g "Id" \, wide B_(i j k) = nabla_i T_(j k) \, wide w = \| T \| \, wide
   s^2 = g^2 + \| p \|^2 . $ <geo:data>]

The notation $s^2$ denotes the displayed smooth function, including at points where it vanishes.
  If $u \( r y \) = r g \( y \)$ is the homogeneous extension, then in the radial and tangential orthonormal frame

#[#set math.equation(numbering: n => "(3.2)")
 $ D^2 u \( r y \) = r^(- 1) mat(delim: "(", 0, 0; 0, T \( y \)) . $ <geo:ambient-hessian>]

Indeed, Euler’s identity gives $D^2 u thin y = 0$, and differentiation of $nabla_(bb(R)^(m + 1)) u = g y +
  p$ along a tangent vector gives the tangential block $nabla^2 g + g "Id"$ at radius one.
  Homogeneity then gives the factor $r^(- 1)$. The same gradient formula identifies $s^2$ with $\|
  nabla_(bb(R)^(m + 1)) u \|^2$ on the unit sphere.

#thm([Proposition 3.1.])[
  (Interior identities).  #emph[The tensor $T$ is symmetric and trace-free,
    and $B$ is fully symmetric and trace-free in every pair of slots. In particular $"div" T = 0$.
    The following identities hold:
#[#set math.equation(numbering: n => "(3.3)")
 $ nabla_l B_(i j k) - nabla_i B_(l j k) & = delta_(l j) T_(i k) + delta_(l k) T_(i j) - delta_(i j) T_(l k) -
   delta_(i k) T_(l j) \,\
Delta T & = m T \, & Delta w^2 & = 2 m w^2 + 2 \| B \|^2 \,\
nabla_l p_i & = T_(l i) - g delta_(l i) \, & nabla_l g & = p_l \,\
nabla s^2 & = 2 T p \, & Delta s^2 & = 2 w^2 . $ <geo:commutator>]

 On the open set ${ w > 0 }$ one also has
#[#set math.equation(numbering: n => "(3.4)")
 $ nabla_l w = w^(- 1) T_(j k) B_(l j k) \, wide \| nabla w \| lt.eq \| B \| . $ <geo:w-gradient>]

 The inequality $\| nabla \( w^2 \) \|^2 lt.eq 4 w^2 \| B \|^2$ holds everywhere, including at $w = 0$.]
] <geo:interior-identities>

#proof[
  The trace equation is $"tr" T = Delta g + m g = 0$. On the unit sphere the commutation rule for the covector $p$ gives
  $ nabla_i \( nabla^2 g \)_(j k) - nabla_j \( nabla^2 g \)_(i k) = delta_(i k) p_j - delta_(j k) p_i . $
  Adding the derivatives of $g "Id"$ cancels the right side. Thus $T$ is Codazzi:
    $nabla_i T_(j k) = nabla_j T_(i k)$. Together with symmetry in $j \, k$, this proves full symmetry of $B$.
    Differentiating $"tr" T = 0$ shows $B_(i j j) = 0$; full symmetry gives all other traces and hence $"div" T = 0$.
  For clarity, the same curvature convention on a covariant two-tensor is
  $ \( \[ nabla_l \, nabla_i \] T \)_(j k) = delta_(l j) T_(i k) + delta_(l k) T_(i j) - delta_(i j) T_(l k) -
    delta_(i k) T_(l j) . $
  This proves (3.3). Substitute $\( l \, i \, j \, k \) = \( i \, j \, i \, k \)$ there and sum over $i$.
    By symmetry and the zero traces of $B$, the left side is $Delta T_(j k)$, whereas the right side is
  $ m T_(j k) + T_(j k) - T_(j k) - delta_(j k) "tr" T = m T_(j k) . $
  The product rule for $\| T \|^2$ now proves (3.3). The definitions give (3.3) and
  $ nabla_l s^2 = 2 g p_l + 2 p_i \( T_(l i) - g delta_(l i) \) = 2 T_(l i) p_i . $
  Taking the divergence and using $"div" T = 0$ and $"tr" T = 0$ gives $Delta s^2 =
    2 T_(l i) \( T_(l i) - g delta_(l i) \) = 2 w^2$. Finally,
    differentiating $w^2$ and applying Cauchy–Schwarz proves both gradient estimates. ◻
]

#thm([Lemma 3.2.])[
  (Strict gradient bound on the original component).  #emph[On $Omega_o$ one has $s_o^2 < 1$.
    At every boundary point, put
#[#set math.equation(numbering: n => "(3.5)")
 $ H_o = - T_o \( N_o \, N_o \) . $ <geo:H-definition>]

 Then
#[#set math.equation(numbering: n => "(3.6)")
 $ H_o > 0 \, wide T_o p_o = - H_o p_o \, wide w_o > 0 quad
   upright("on ") partial Omega_o . $ <geo:strict-boundary-sign>]

 Consequently $w_o$ has a positive minimum on $partial Omega_o$, and its zero set is a compact subset of $Omega_o$.]
] <geo:gradient-bound>

#proof[
  The boundary conditions give $s_o^2 = 1$ on $partial Omega_o$. By (3.3), $s_o^2$ is subharmonic.
    The maximum principle on the compact closure gives $s_o^2 lt.eq 1$.
    If equality held at an interior point, the strong maximum principle would make $s_o^2$ constant on the
    connected component, and then $Delta s_o^2 = 2 w_o^2$ would imply $T_o equiv 0$. Thus $s_o^2 < 1$ inside.
  The smooth boundary has the interior sphere property at each point.
    The Hopf boundary lemma therefore gives $partial_(N_o) s_o^2 < 0$.
    Since $p_o = N_o$ there, (3.3) identifies this derivative as $2 T_o \( N_o \, N_o \)$, proving $H_o > 0$.
    For a tangent vector $tau$ to $partial Omega_o$, tangential differentiation of $s_o^2 =
    1$ similarly gives $T_o \( tau \, N_o \) = 0$. This proves the eigenvector assertion and $w_o gt.eq H_o > 0$.
    Continuity and compactness of the boundary give a positive minimum of $w_o$ and a neighborhood of the boundary
    disjoint from its zero set. ◻
]

The remaining boundary formulas are local. Thus they apply on the original boundary and,
  once the strict sign has been transported, on the regular side of the suspension.

#thm([Proposition 3.3.])[
  (Boundary jets).  #emph[Suppose $g = 0$, $p = N$, and $T \( N \, N \) = - H < 0$ on a smooth boundary portion,
    where $N$ is inward. Let Greek indices be tangent to this boundary and put
$ frak(h)_(alpha beta) = chevron.l nabla_alpha N \, e_beta chevron.r . $

 Then $T_(N alpha) = 0$, $T_(alpha beta) = frak(h)_(alpha beta)$, and $H = "tr" frak(h)$;
   in particular $H$ is a sum of principal curvatures with the specified convention, without division by $m - 1$.
   If $nabla^partial$ is the boundary connection, all components of $B$ are described, up to permutation of slots, by
#[#set math.equation(numbering: n => "(3.7)")
 $ B_(alpha beta gamma) & = \( nabla_alpha^partial frak(h) \)_(beta gamma) \, & B_(N N alpha) & = - partial_alpha H \,\
B_(N alpha beta) & = T_(N N) T_(alpha beta) - \( T^2 \)_(alpha beta) \, & B_(N N N) & =
  w^2 . $ <geo:even-boundary-jets>]

 The components with an odd number of normal slots are thus determined by the pointwise tensor $T$;
   the other components involve tangential derivatives of curvature.
   The tensor $V$ below encodes this odd-normal part after normalization. Here $w > 0$.
   Define the normalized tensors and eigenvalue
$ A = T \/ w \, wide lambda = T_(N N) \/ w = - H \/ w \, wide S_0 = lambda A - A^2 \, $

 and the symmetric tensor
#[#set math.equation(numbering: n => "(3.8)")
 $ V_(i j k) = p_i \( S_0 \)_(j k) + p_j \( S_0 \)_(k i) + p_k \( S_0 \)_(i j) + p_i p_j p_k . $ <geo:boundary-V>]

 Then $\| p \| = 1$, $A p = lambda p$, $lambda < 0$, $S_0 p = 0$, $"tr" S_0 = - 1$, and $V$ is trace-free.
   The tensors $B \/ w^2$ and $V$ agree in every component with an odd number of normal slots. Moreover,
#[#set math.equation(numbering: n => "(3.9)")
 $ V_(N j k) = \( S_0 + p ⊗ p \)_(j k) \, wide partial_N w = w^2 #scale(x: 120%, y: 120%)[\(] 2 lambda -
   "tr" A^3 #scale(x: 120%, y: 120%)[\)] . $ <geo:normal-w>]

]
] <geo:boundary-jets>

#proof[
  On the boundary, tangential differentiation of $\| p \|^2 = 1$ gives $T_(N alpha) = 0$, and $nabla_alpha p =
    T e_alpha$ because $g = 0$. Since $p = N$ along the boundary, this proves $T_(alpha beta) =
    frak(h)_(alpha beta)$. The trace equation for $T$ gives $"tr" frak(h) = - T_(N N) = H$.
    In differentiating three tangential entries of $T$, the normal connection terms pair with
    $T \( N \, e_alpha \) = 0$. This yields the first formula in (3.7). Likewise,
  $ partial_alpha T \( N \, N \) = B_(alpha N N) + 2 T \( nabla_alpha N \, N \) = B_(alpha N N) \, $
  which proves the second formula by symmetry of $B$.
  For a tangent field $e_alpha$, differentiate $T \( N \, e_alpha \) = 0$ along $e_beta$.
    Since $chevron.l N \, nabla_beta e_alpha chevron.r = - frak(h)_(beta alpha)$, this gives
  $ 0 = B_(beta N alpha) + \( T^2 \)_(beta alpha) - T_(N N) T_(beta alpha) . $
  This proves the first formula in (3.7). Taking its tangential trace gives
  $ sum_alpha B_(N alpha alpha) = T_(N N) sum_alpha T_(alpha alpha) - sum_(alpha \, beta) T_(alpha beta)^2 = -
    T_(N N)^2 - sum_(alpha \, beta) T_(alpha beta)^2 = - w^2 . $
  The zero trace of $B$ then gives $B_(N N N) = w^2$.
  Normalization gives $S_0 p = 0$ and $"tr" S_0 = - \| A \|^2 = - 1$.
    Consequently $V_(i j j) = p_i "tr" S_0 + 2 \( S_0 p \)_i + p_i = 0$.
    In an orthonormal frame with first vector $p = N$, one has $V_(N alpha beta) = \( S_0 \)_(alpha beta)$ and
    $V_(N N N) = 1$. These are exactly the normalized identities (3.7), and $V_(N j k) = S_(0 \, j k) + p_j p_k$.
    Finally, $T$ has only its normal-normal and tangential-tangential blocks,
    so the odd-normal formulas account for the entire contraction $T_(j k) B_(N j k)$. Thus
  $ partial_N w = w^(- 1) T_(j k) B_(N j k) = w^2 A_(j k) \( S_0 + p ⊗ p \)_(j k) = w^2 \( 2 lambda - "tr" A^3 \) \, $
  as asserted. ◻
]

=== 3.2 Transport to a suspension <transport-to-a-suspension>

#thm([Proposition 3.4.])[
  (Suspended data).  #emph[If $m_o = 4$, write $rho = sin t$, $c =
    cos t$ and parameterize the regular part of the suspended component by
$ \( t \, y \) mapsto \( rho y \, c \) \, wide 0 < t < pi \, quad y in Omega_o . $

 Its metric is $d t^2 + rho^2 d s_(S^4)^2$, and $tilde(g) = rho g_o$.
   With $E_0 = partial_t$ and $E_alpha = rho^(- 1) e_alpha$ for a lifted orthonormal frame on $S^4$, the data satisfy
#[#set math.equation(numbering: n => "(3.10)")
 $ tilde(p)_0 & = c g_o \, & tilde(p)_alpha & = \( p_o \)_alpha \, & tilde(s)^2 & = s_o^2 \,\
tilde(T)_00 & = 0 \, & tilde(T)_(0 alpha) & = 0 \, & tilde(T)_(alpha beta) & =
  rho^(- 1) \( T_o \)_(alpha beta) . $ <geo:suspended-first-jets>]

 The only possibly nonzero components of $tilde(B)$ are
#[#set math.equation(numbering: n => "(3.11)")
 $ tilde(B)_(alpha beta gamma) = rho^(- 2) \( B_o \)_(alpha beta gamma) \, wide tilde(B)_(0 alpha beta) =
   tilde(B)_(alpha 0 beta) = tilde(B)_(alpha beta 0) = - c rho^(- 2) \( T_o \)_(alpha beta) . $ <geo:suspended-B>]

 In particular,
#[#set math.equation(numbering: n => "(3.12)")
 $ tilde(w) = rho^(- 1) w_o \, wide \| tilde(B) \|^2 = rho^(- 4) #scale(x: 120%, y: 120%)[\(] \| B_o \|^2 +
   3 c^2 w_o^2 #scale(x: 120%, y: 120%)[\)] \, wide tilde(H) = rho^(- 1) H_o quad
   upright("on the regular side.") $ <geo:suspended-norms>]

 The volume and side-boundary measures are
#[#set math.equation(numbering: n => "(3.13)")
 $ d V = rho^4 thin d t thin d V_o \, wide d sigma = rho^3 thin d t thin d sigma_o . $ <geo:suspended-measures>]

 Every local identity of Proposition 9 holds with $m = 5$, and Proposition 11 holds on the regular side.
   Also $tilde(s)^2 < 1$ inside and $tilde(H) \, tilde(w) > 0$ on that side.]
] <geo:suspension-data>

#proof[
  At a point where the base frame is normal, the warped metric has connection
  $ nabla_(E_0) E_0 = nabla_(E_0) E_alpha = 0 \, wide nabla_(E_alpha) E_0 = \( c \/ rho \) E_alpha \, wide
    nabla_(E_alpha) E_beta = - \( c \/ rho \) delta_(alpha beta) E_0 . $
  The horizontal part of the last expression at other points is the base connection with factor $rho^(- 1)$.
    Differentiating $tilde(g) = rho g_o$ gives (3.10). Its Hessian has entries
  $ \( nabla^2 tilde(g) \)_00 = - rho g_o \, quad \( nabla^2 tilde(g) \)_(0 alpha) = 0 \,
    quad \( nabla^2 tilde(g) \)_(alpha beta) = rho^(- 1) \( nabla_o^2 g_o \)_(alpha beta) + \( c^2 \/ rho \) g_o
    delta_(alpha beta) . $
  Adding $tilde(g) "Id"$ proves (3.10). Differentiating that tensor with the displayed connection gives (3.11);
    entries with two or three zero slots vanish. Each term with exactly one zero slot occurs in three positions,
    which proves the factor $3$ in (3.12).
  The inward normal to the side is the horizontal lift of $N_o$.
    Thus the normal-normal entry of (3.10) gives $tilde(H) = rho^(- 1) H_o$.
    The metric on the side is $d t^2 + rho^2 d s_(partial Omega_o)^2$, proving (3.13).
    The trace of (3.10) is zero, so $Delta tilde(g) = - 5 tilde(g)$.
    The interior identities follow locally from Proposition 9.
    The bounds for $s^2$, $H$ and $w$ follow from the original compact component and (3.10)–(3.12);
    no maximum principle at a tip is used. The local boundary hypotheses and hence Proposition 11 hold on the
    regular side. ◻
]

We now use the unadorned notation $Omega \, g \, p \, T \, B \, w \,
  H$ for the working component in $S^5$ defined at the end of Section 2.
  It is either $Omega_o$ when $m_o = 5$, or the above suspension when $m_o = 4$.
  All boundary integrals mean integrals over the regular boundary,
  with the two tips omitted in the suspended case. The original data retain the subscript $o$ when needed.

=== 3.3 Second variation under compact perturbations <second-variation-under-compact-perturbations>

We derive stability directly from the minimizing property, including its sign and test class.
  The argument works in either original ambient dimension and in the six-dimensional suspension.

#thm([Proposition 3.5.])[
  (Euclidean stability on a component).  #emph[Let $D$ be the selected positivity component of a global minimizing
    cone in $bb(R)^(m + 1)$. Let $phi.alt$ be any real smooth function up to the regular boundary of $D$,
    with compact support in that regular closure away from the vertex and from any other singular points. Then
#[#set math.equation(numbering: n => "(3.14)")
 $ integral_D \| nabla phi.alt \|^2 thin d x gt.eq integral_(partial D) H_E phi.alt^2 thin d sigma_E \, wide
   H_E = - D^2 u \( N_E \, N_E \) \, $ <geo:euclidean-inequality>]

 where $N_E$ is the inward Euclidean unit normal. No restriction is imposed on the boundary trace or normal
   derivative of $phi.alt$.]
] <geo:euclidean-stability>

#proof[
  Every regular free-boundary point has a neighborhood where the positive phase is the single side belonging to
    $D$. Compactness of the boundary portion meeting $"supp" phi.alt$ gives finitely many such neighborhoods and a
    collar separated from every other positivity component and every singular point.
    Choose the collar over a slightly larger boundary portion,
    so that the extension of $phi.alt$ can vanish near its lateral edge.
    Extend $phi.alt$ smoothly across this boundary with compact support in these neighborhoods.
    Also extend the positive side of $u$ smoothly to a function $F$ on the collar,
    with its interior jets unchanged. Since $u = 0$ and $nabla u = N_E$ on the boundary,
    shrinking the collar makes $F$ negative on its exterior side and positive on its interior side.
    Such an extension need only be smooth to finite order sufficient for the expansions below;
    smooth boundary regularity supplies this, and a partition of unity joins the local extensions while preserving
    the interior function and its jets.
  For a real parameter $epsilon$ of either sufficiently small sign,
    use $\( F + epsilon phi.alt \)_(+)$ in the collar, $u + epsilon
    phi.alt$ on the rest of the affected portion of $D$, and $u$ elsewhere. These definitions agree:
    $F = u$ on the interior of the collar, and on the compact interior support outside a smaller collar $u$ has a
    positive minimum. Near the exterior and lateral edges of the modification the function agrees with $u$.
    The resulting competitor $u_epsilon$ is nonnegative, belongs to $H_(upright("loc"))^1$,
    and has compactly supported difference from $u$ in a containing ball.
    It is therefore admissible for the original global minimizer.
    This construction uses no separate minimizing assertion for $D$.
  We compute the change in energy in such a ball. First integrate the perturbed density over the fixed original
    domain $D$, and then account for the signed boundary layer where its positivity set changes.
    The fixed-domain contribution is
  #[#set math.equation(numbering: n => "(3.15)")
   $ & 2 epsilon integral_D chevron.l nabla u \, nabla phi.alt chevron.r thin d x +
     epsilon^2 integral_D \| nabla phi.alt \|^2 thin d x\
 & #h(15mm)  = - 2 epsilon integral_(partial D) phi.alt thin d sigma_E +
   epsilon^2 integral_D \| nabla phi.alt \|^2 thin d x . $ <geo:fixed-domain-variation>]
  Here harmonicity eliminates the interior term and the outward normal is $- N_E$, so $partial_(- N_E) u = - 1$.
    All integrations by parts have compact support on the regular portion.
  Use coordinates $\( y \, xi \)$ obtained by flowing from the original boundary under
  $ V_F = frac(nabla F, \| nabla F \|^2) \, wide xi = F . $
  The denominator is nonzero on a sufficiently small compact collar. At $xi = 0$, $V_F = N_E$.
    If $j \( y \, xi \)$ is the volume Jacobian relative to $d sigma_E \( y \) thin d xi$, then
  #[#set math.equation(numbering: n => "(3.16)")
   $ j \( y \, 0 \) = 1 \, wide partial_xi j \( y \, 0 \) = "div" V_F \( y \, 0 \) = Delta F - 2 F_(N_E N_E) =
     2 H_E . $ <geo:flow-jacobian>]
  The equality $Delta F = 0$ on the original boundary follows from matching the interior second derivatives;
    harmonicity outside $D$ is unnecessary. Moreover,
  $ partial_xi \| nabla F \|^2\|_(xi = 0) = 2 F_(N_E N_E) = - 2 H_E \, $
  and hence
  #[#set math.equation(numbering: n => "(3.17)")
   $ partial_xi #scale(x: 120%, y: 120%)[\[] \( 1 + \| nabla F \|^2 \) j #scale(x: 120%, y: 120%)[\]]\|_(xi = 0) =
     2 H_E . $ <geo:edge-density-derivative>]
  Write $phi.alt_0 = phi.alt \( y \, 0 \)$ and $phi.alt_N = partial_(N_E) phi.alt \( y \, 0 \)$.
    The new zero surface has coordinate $b_epsilon \( y \)$ determined by $b_epsilon +
    epsilon phi.alt \( y \, b_epsilon \) = 0$. The implicit function theorem and $partial_xi
    phi.alt \( y \, 0 \) = phi.alt_N$ give, uniformly on the compact patch,
  #[#set math.equation(numbering: n => "(3.18)")
   $ b_epsilon = - epsilon phi.alt_0 + epsilon^2 phi.alt_0 phi.alt_N + O \( \| epsilon \|^3 \) . $ <geo:moving-edge>]
  Throughout the layer $\| xi \| lt.eq C \| epsilon \|$, its perturbed energy density is
  #[#set math.equation(numbering: n => "(3.19)")
   $ \( 1 + \| nabla \( F + epsilon phi.alt \) \|^2 \) j = 2 + 2 epsilon phi.alt_N + 2 H_E xi +
     O \( epsilon^2 + \| epsilon xi \| + xi^2 \) . $ <geo:layer-density>]
  Integrating this density from $b_epsilon$ to $0$ is the signed correction,
    whether the phase expands or contracts. The terms of order at most two are
  #[#set math.equation(numbering: n => "(3.20)")
   $ integral_(b_epsilon)^0 \( 1 + \| nabla \( F + epsilon phi.alt \) \|^2 \) j thin d xi & = - 2 b_epsilon -
     2 epsilon phi.alt_N b_epsilon - H_E b_epsilon^2 + O \( \| epsilon \|^3 \)\
 & = 2 epsilon phi.alt_0 + epsilon^2 #scale(x: 120%, y: 120%)[\(] - 2 phi.alt_0 phi.alt_N +
   2 phi.alt_0 phi.alt_N - H_E phi.alt_0^2 #scale(x: 120%, y: 120%)[\)] + O \( \| epsilon \|^3 \)\
 & = 2 epsilon phi.alt_0 - epsilon^2 H_E phi.alt_0^2 + O \( \| epsilon \|^3 \) . $ <geo:layer-cancellation>]
  This displays the cancellation of the normal-derivative terms.
    The uniform remainder is integrable over the compact affected boundary.
    Adding (3.15) also cancels the linear terms, leaving
  $ J \( u_epsilon \) - J \( u \) =
    epsilon^2 (integral_D \| nabla phi.alt \|^2 thin d x - integral_(partial D) H_E phi.alt^2 thin d sigma_E) +
    o \( epsilon^2 \) . $
  The energies here are in a ball containing the modification. Minimality and division by $epsilon^2$ prove (3.14). ◻
]

The angular constant comes from the sharp radial Hardy threshold,
  which also enters the cone instability criteria in [13] Propositions 2.1–2.2.
  We include the radial calculation to specify the compact supports and the order of limits.

#thm([Corollary 3.6.])[
  (Spherical stability).  #emph[For every real function $v$ smooth up to the regular boundary of the working
    component $Omega subset S^5$, with compact support in its closure away from the tips if present,
#[#set math.equation(numbering: n => "(3.21)")
 $ integral_(partial Omega) H v^2 thin d sigma lt.eq integral_Omega #scale(x: 120%, y: 120%)[\(] \| nabla v \|^2 +
   4 v^2 #scale(x: 120%, y: 120%)[\)] thin d V . $ <geo:spherical-inequality>]

 The trace of $v$ on the regular boundary is arbitrary.]
] <geo:spherical-stability>

#proof[
  More generally, consider a link component $Omega subset S^m$ with angular tests supported in its regular
    closure, and write $D = { r y : r > 0 \, med y in Omega }$.
    On its regular side the normal is tangent to $S^m$, and (3.2) gives $H_E \( r y \) = r^(- 1) H \( y \)$.
    Polar volume has factor $r^m thin d r$ and side area has factor $r^(m - 1) thin d r$.
    For $zeta in C_c^oo \( \( 0 \, oo \) \)$ and an allowed angular test $v$, put $phi.alt \( r y \) =
    zeta \( r \) v \( y \)$ in Proposition 13. It gives
  $ (integral_0^oo r^(m - 2) zeta^2 thin d r) integral_(partial Omega) H v^2 thin d sigma & lt.eq
    (integral_0^oo r^(m - 2) zeta^2 thin d r) integral_Omega \| nabla v \|^2 thin d V\
 & quad + (integral_0^oo r^m \| zeta' \|^2 thin d r) integral_Omega v^2 thin d V . $
  For each fixed $zeta$ and $v$, the Euclidean support lies in a finite annulus and is separated from the singular
    set and other components, so the preceding second variation applies.
  Set $beta = \( m - 1 \) \/ 2$. For $f_zeta \( r \) = r^beta zeta \( r \)$,
    integration of the cross term gives the radial Hardy identity
  $ integral_0^oo r^m \| zeta' \|^2 thin d r - beta^2 integral_0^oo r^(m - 2) zeta^2 thin d r =
    integral_0^oo r \| f'_zeta \( r \) \|^2 thin d r gt.eq 0 . $
  To approach its constant, choose nonzero $psi in C_c^oo \( bb(R) \)$ and set $zeta_k \( r \) =
    r^(- beta) psi \( \( log r \) \/ k \)$. The substitution $tau = \( log r \) \/ k$ yields
  #[#set math.equation(numbering: n => "(3.22)")
   $ frac(integral_0^oo r^m \| zeta'_k \|^2 thin d r, integral_0^oo r^(m - 2) zeta_k^2 thin d r) = beta^2 + 1 /
     k^2 frac(integral_(bb(R)) \| psi' \|^2 thin d tau, integral_(bb(R)) psi^2 thin d tau) . $ <geo:hardy-limit>]
  Indeed the numerator before division is $k integral_(bb(R)) \( - beta psi + k^(- 1) psi' \)^2 thin d tau$,
    and $integral psi psi' = 0$ by compact support. Divide the separated stability inequality by its positive
    radial factor and let $k arrow.r oo$. In tangent dimension $m = 5$, one has $beta^2 = 4$, proving (3.21).
    The same computation on an original link with $m_o = 4$ would give $9 \/ 4$; the working link always has $m = 5$.
  The order of limits is fixed: for each angular test and each finite $k$, first take $epsilon arrow.r
    0$ in the second variation, and then take $k arrow.r oo$.
    Angular cutoffs used later are removed only after (3.21) has been obtained for each fixed smooth test.
    The collar and the allowable size of $epsilon$ may depend on these fixed supports. ◻
]

== 4 A universal algebraic certificate <sec:certificate>

The comparison needed for the stability inequality is a statement about finite-dimensional tensors.
  We state it with free algebraic data before deriving its geometric consequences.
  All tensor spaces here are over $bb(R)^5$, with the Euclidean inner product and full tensor norm;
  repeated indices range from $1$ to $5$ and are summed. A symmetric tensor is called trace-free if contraction of
  any two slots is zero. We write $"STF"^r \( bb(R)^5 \)$ for the space of symmetric trace-free tensors of rank $r$. Fix

#[#set math.equation(numbering: n => "(4.1)")
 $ a = 29 / 50 \, wide Q = 250000 \, wide epsilon.alt_(*) = 438907 / 12000000 \, wide delta_(*) = 6984137359 /
   31250000000 . $ <cert:constants>]

Let $A$ be a symmetric trace-free matrix with $\| A \|^2 = "tr" A^2 = 1$,
  and let $X$ be a symmetric trace-free three-tensor. Set

$ q_l = X_(l i j) A_(i j) \, wide chi = 1 - \| p \|^2 - g^2 \, $

where $p \, ell in bb(R)^5$ and $g \, w \, z in bb(R)$ are otherwise free.
  In particular, $w$ and $z$ need not be positive. On tensor polynomials in $A \, p \, g \, delta$,
  define $D_l$ by the product rule and

#[#set math.equation(numbering: n => "(4.2)")
 $ D_l A_(i j) = X_(l i j) - q_l A_(i j) \, wide D_l p_i = w A_(l i) - g z delta_(l i) \, wide D_l g = z p_l \,
   wide D_l delta_(i j) = 0 . $ <cert:D>]

This is a first derivative with values in the enlarged polynomial algebra containing $X \, w \, z$;
  no derivative of these new variables is used.

#thm([Proposition 4.1.])[
  (Universal inequalities).  #emph[There are rational tensor polynomials $f \, U_(j k) \, K_(l i j k) \, M_l \,
    P_l$ in $A \, p \, g \, delta$, with the following properties.
    They are equivariant under orthogonal changes of coordinates, with $f$ invariant.
    Their coefficients are specified by Table I in Appendix 9, using the decoding in Section 6.1. Put
$ C_(l i j k) = K_(l i j k) - K_(i l j k) \, wide G_(l i j k) = delta_(l i) U_(j k) + C_(l i j k) . $

 For every choice of the data above with $chi gt.eq 0$,
#[#set math.equation(numbering: n => "(4.3)")
 $ cal(I) :=  & z^2 [5 U_(j k) A_(j k) + C_(l i j k) \( delta_(l j) A_(i k) + delta_(l k) A_(i j) \) - 4 f]\
 & + [D_l G_(l i j k) + \( 2 a - 1 \) q_l G_(l i j k)] X_(i j k)\
 & + w [D_l M_l + \( 2 a + 1 \) q_l M_l] + z [D_l P_l + 2 a q_l P_l]\
 & + f \| ell \|^2 - \( D_l f + 2 a q_l f \) ell_l med gt.eq med
   epsilon.alt_(*) \( z^2 + \| ell \|^2 \) . $ <cert:interior>]

 In particular, $f gt.eq epsilon.alt_(*)$ whenever $g^2 + \| p \|^2 lt.eq 1$.]
  #emph[For every symmetric trace-free unit matrix $A$ and vector $p$ satisfying
$ g = 0 \, wide \| p \| = 1 \, wide A p = lambda p \, wide lambda < 0 \, $

 define
$ S_0 = lambda A - A^2 \, wide V_(i j k) = p_i \( S_0 \)_(j k) + p_j \( S_0 \)_(k i) + p_k \( S_0 \)_(i j) +
  p_i p_j p_k . $

 Then
#[#set math.equation(numbering: n => "(4.4)")
 $ cal(S) := - lambda f + U_(j k) \( S_0 + p ⊗ p \)_(j k) + C_(l i j k) p_l V_(i j k) + p_l M_l med gt.eq med
   delta_(*) . $ <cert:boundary>]

 Moreover, $U$ and $K$ are even in $p$, and $P = 0$ when $g = 0$.]
] <cert:universal>

We prove Proposition 15 in Section 6. First, Section 5 derives its geometric consequences using only the stated
  properties. The calculation explains the Laplacian and skew contractions in $G$, the three coefficients of $q$,
  and the free vector $ell$.

== 5 From the algebraic certificate to a geometric flux <flux:section>

We work on the regular part of the spherical component $Omega subset S^5$ constructed in Section 2, and put

$ Omega_(+) = { x in Omega : w \( x \) > 0 } \, wide a = 29 / 50 . $

All assertions up to the side boundary use derivatives from the positive side.
  In the suspended case the two tips are excluded throughout Section 5.
  We apply the universal inequalities of Proposition 15, whose proof follows in Section 6.
  For its coefficient polynomials $f \, U \, K \, M \, P$, with their stated slot orders, set

#[#set math.equation(numbering: n => "(5.1)")
 $ C_(l i j k) = K_(l i j k) - K_(i l j k) \, wide G_(l i j k) = delta_(l i) U_(j k) + C_(l i j k) . $ <flux:CG>]

Thus $C_(i l j k) = - C_(l i j k)$. No other slot symmetry of $U$ or $K$ will be needed.
  The orthogonal equivariance asserted in Proposition 15 ensures that all the fields defined below are independent
  of the orthonormal frame.

=== 5.1 Normalized differentiation and the fourth derivatives <normalized-differentiation-and-the-fourth-derivatives>

On $Omega_(+)$ define

#[#set math.equation(numbering: n => "(5.2)")
 $ A = T / w \, wide X = B / w \, wide q_l = X_(l j k) A_(j k) . $ <flux:normalized-data>]

The identities of Proposition 9 show that $A in "STF"^2 \( bb(R)^5 \)$, $\| A \| = 1$,
  and $X in "STF"^3 \( bb(R)^5 \)$. Moreover, $g^2 + \| p \|^2 lt.eq 1$,
  so these are admissible data for the interior certificate.
  The homogenizing variable in that certificate is set to $z = 1$ in every geometric application.

#thm([Lemma 5.1.])[
  #emph[At the data (5.2), the derivation $D_l$ of (4.2), evaluated at $z = 1$,
    equals covariant differentiation on every coefficient polynomial in $A \, p \, g \, delta$. In particular,
#[#set math.equation(numbering: n => "(5.3)")
 $ nabla_l w = w q_l \, wide nabla_l A_(i j) = X_(l i j) - q_l A_(i j) \, wide nabla_l p_i = w A_(l i) -
   g delta_(l i) \, wide nabla_l g = p_l . $ <flux:first-derivatives>]

 Furthermore,
#[#set math.equation(numbering: n => "(5.4)")
 $ 1 / w G_(l i j k) nabla_l B_(i j k) = 5 U_(j k) A_(j k) +
   C_(l i j k) \( delta_(l j) A_(i k) + delta_(l k) A_(i j) \) . $ <flux:fourth-elimination>]

]
] <flux:normalized-differentiation>

#proof[
  Differentiating $w^2 = T_(j k) T_(j k)$ gives $nabla_l w = T_(j k) B_(l j k) \/ w = w q_l$.
    The quotient rule then gives the formula for $nabla A$, and $T = nabla^2 g +
    g "Id"$ gives the formula for $nabla p$. In a covariantly constant orthonormal frame at the point under
    consideration these are exactly the generator rules for $D_l$.
    The product rule and compatibility of the connection with contractions prove the assertion for every
    coefficient polynomial. The rules also preserve the normalization constraints:
  $ D_l \( "tr" A \) = 0 \, wide D_l \( \| A \|^2 \) = 2 q_l - 2 q_l = 0 $
  on the admissible data.
  Here $D_l$ is applied only to coefficient polynomials in $A \, p \, g \, delta$.
    Differentiation of the factors $w$ and $X$, which are not coefficient variables, is performed separately.
    In particular, no rule for $D_l X$ or $D_l q$ is being assumed.
  For the $U$ part of (5.4),
  $ 1 / w delta_(l i) U_(j k) nabla_l B_(i j k) = 1 / w U_(j k) Delta T_(j k) = 5 U_(j k) A_(j k) . $
  For the skew part, the curvature identity in Proposition 9 yields
  $ 1 / w C_(l i j k) nabla_l B_(i j k) & = frac(1, 2 w) C_(l i j k) \( nabla_l B_(i j k) - nabla_i B_(l j k) \)\
 & = 1 / 2 C_(l i j k) \( delta_(l j) A_(i k) + delta_(l k) A_(i j) - delta_(i j) A_(l k) - delta_(i k) A_(l j) \)\
 & = C_(l i j k) \( delta_(l j) A_(i k) + delta_(l k) A_(i j) \) . $
  The last equality follows by interchanging the summed indices $l \,
    i$ in the last two terms and using $C_(i l j k) = - C_(l i j k)$.
    Equivalently,
    $C_(l i j k) nabla_l B_(i j k)$ equals $K_(l i j k) \( nabla_l B_(i j k) - nabla_i B_(l j k) \)$;
    thus the factor $1 \/ 2$ belongs to the formula with $C$, not to the formula with $K$.
  This calculation eliminates every undetermined fourth derivative of $g$.
    Indeed, if two possible tensors $nabla_l B_(i j k)$ have the same Laplacian contraction and the same skew
    difference in $l \, i$, their difference has zero contraction with $delta_(l i)
    U_(j k)$ and with $C_(l i j k)$. No constraint on the remaining fourth derivative entries is required. ◻
]

=== 5.2 The square root and the interior comparison <the-square-root-and-the-interior-comparison>

Proposition 15 gives

#[#set math.equation(numbering: n => "(5.5)")
 $ f \( A \, p \, g \) gt.eq epsilon.alt_(*) = 438907 / 12000000 > 0 $ <flux:f-positive>]

on the entire normalized coefficient domain. The verification in Section 6.5 obtains this bound using the free
  algebraic data $X = w = z = 0$. Since $f$ is independent of $w$,
  this permitted algebraic substitution does not impose $w = 0$ on the geometric data:
  the fields below are defined on $Omega_(+)$, where $w > 0$.

Define on $Omega_(+)$

#[#set math.equation(numbering: n => "(5.6)")
 $ h = w^a sqrt(f) \, wide Z_l = w^(2 a) #scale(x: 120%, y: 120%)[\(] G_(l i j k) X_(i j k) + w M_l +
   P_l #scale(x: 120%, y: 120%)[\)] . $ <flux:fields>]

These fields are smooth on $Omega_(+)$ and extend smoothly to each regular side boundary point,
  since $w > 0$ there by Proposition 11.

#thm([Proposition 5.2.])[
  #emph[The scalar $h$ and vector field $Z$ satisfy
#[#set math.equation(numbering: n => "(5.7)")
 $ "div" Z gt.eq 4 h^2 + \| nabla h \|^2 + epsilon.alt_(*) w^(2 a) wide
   upright("on ") Omega_(+) . $ <flux:interior-inequality>]

]
] <flux:interior-comparison>

#proof[
  First,
  $ nabla_l X_(i j k) = 1 / w nabla_l B_(i j k) - q_l X_(i j k) . $
  Applying the product rule to each of the three summands of $Z$, and then using (5.4), gives the exact identity
  #[#set math.equation(numbering: n => "(5.8)")
   $ w^(- 2 a) "div" Z =  & 5 U_(j k) A_(j k) + C_(l i j k) \( delta_(l j) A_(i k) + delta_(l k) A_(i j) \)\
 & + #scale(x: 120%, y: 120%)[\[] D_l G_(l i j k) + \( 2 a - 1 \) q_l G_(l i j k) #scale(x: 120%, y: 120%)[\]]
   X_(i j k)\
 & + w #scale(x: 120%, y: 120%)[\[] D_l M_l + \( 2 a + 1 \) q_l M_l #scale(x: 120%, y: 120%)[\]] + D_l P_l +
   2 a q_l P_l . $ <flux:divergence-identity>]
  Every $D_l$ in Equation (5.8) is evaluated at $z = 1$. The three coefficients of $q$ come respectively from
    differentiating $w^(2 a) X$, $w^(2 a + 1)$, and $w^(2 a)$; in the first expression the quotient $X =
    B \/ w$ contributes $- q_l X$. Thus their values are exactly
  $ 2 a - 1 = 4 / 25 \, wide 2 a + 1 = 54 / 25 \, wide 2 a = 29 / 25 . $
  Put
  $ cal(F)_l = D_l f + 2 a q_l f \, wide ell_(*) = frac(cal(F), 2 f) . $
  Differentiating $h$ and completing the square give, respectively,
  #[#set math.equation(numbering: n => "(5.9)")
   $ nabla_l h = frac(w^a, 2 sqrt(f)) cal(F)_l \, wide \| nabla h \|^2 = frac(w^(2 a), 4 f) \| cal(F) \|^2 \,
     $ <flux:square-root-derivative>]
  and
  $ f \| ell \|^2 - cal(F) dot.op ell = f \| ell - ell_(*) \|^2 - frac(\| cal(F) \|^2, 4 f) . $
  In particular, substituting (5.8) into the interior polynomial $cal(I)$ of (4.3) gives the identity, for every $ell$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ cal(I) \|_(z = 1) = w^(- 2 a) #scale(x: 120%, y: 120%)[\(] "div" Z -
     4 h^2 - \| nabla h \|^2 #scale(x: 120%, y: 120%)[\)] + f \| ell - ell_(*) \|^2 . $ <flux:square-completion>]
  The division by $f$ is justified uniformly by (5.5). Evaluating (4.3) at $ell =
    ell_(*)$ therefore gives the slightly stronger estimate
  $ "div" Z - 4 h^2 - \| nabla h \|^2 gt.eq epsilon.alt_(*) w^(2 a) \( 1 + \| ell_(*) \|^2 \) \, $
  which implies (5.7). ◻
]

=== 5.3 Boundary reflection and the signed flux <boundary-reflection-and-the-signed-flux>

At a regular side boundary point, Proposition 11 gives

$ g = 0 \, quad p = N \, quad \| p \| = 1 \, quad A p = lambda p \, wide lambda = - H / w < 0 . $

As in the boundary certificate, define

#[#set math.equation(numbering: n => "(5.11)")
 $ S_0 = lambda A - A^2 \, wide V_(i j k) = p_i \( S_0 \)_(j k) + p_j \( S_0 \)_(k i) + p_k \( S_0 \)_(i j) +
   p_i p_j p_k . $ <flux:boundary-model>]

#thm([Lemma 5.3.])[
  #emph[At such a point,
#[#set math.equation(numbering: n => "(5.12)")
 $ p_l G_(l i j k) B_(i j k) / w^2 = p_l G_(l i j k) V_(i j k) = U_(j k) \( S_0 + p ⊗ p \)_(j k) +
   C_(l i j k) p_l V_(i j k) . $ <flux:boundary-contraction>]

]
] <flux:boundary-parity>

#proof[
  Let $R = "Id" - 2 p ⊗ p$ be reflection in $p^perp$. Since $A$ is symmetric and $A p = lambda p$,
    it preserves $p^perp$, and hence $R A R^T = A$. Also $R p = - p$.
    Orthogonal equivariance and the even parity in $p$ of $U \, K$, and therefore of $G$, give
  $ R^(⊗ 4) G \( A \, p \, 0 \) = G \( R A R^T \, R p \, 0 \) = G \( A \, - p \, 0 \) = G \( A \, p \, 0 \) . $
  For the three-tensor $F_(i j k) = p_l G_(l i j k)$, contraction commutes with orthogonal transformations, so
  $ R^(⊗ 3) F = \( R p \)_l \( R^(⊗ 4) G \)_(l i j k) = - F . $
  Choose any orthonormal basis with its last vector $p$. A component of a three-tensor with $k$ normal slots is
    multiplied by $\( - 1 \)^k$ under $R^(⊗ 3)$. It follows that $F$ has zero components whenever the number of
    normal slots is even. This assertion concerns the full unsymmetrized tensor $F$; no permutation of its slots,
    and no extra symmetry of $U$ or $K$, has been used.
  For tangent indices $alpha \, beta$, the boundary jet identities give
  $ B_(N alpha beta) / w^2 = lambda A_(alpha beta) - \( A^2 \)_(alpha beta) = \( S_0 \)_(alpha beta) \, wide
    B_(N N N) / w^2 = 1 . $
  Because $S_0 p = 0$, these are precisely the components of $V$ with one or three normal slots,
    including all their permutations. Thus the part of $B \/ w^2$ with an odd number of normal slots equals $V$;
    $V$ itself has no even-normal components. The even-normal components of $B$, which are not determined by $A \,
    p \, g \, w$, have zero contraction with $F$. This proves the first equality in (5.12).
  Finally, $S_0 p = 0$ and $\| p \| = 1$ imply
  $ p_i V_(i j k) = \( S_0 \)_(j k) + p_j p_k . $
  Splitting $G$ according to (5.1) proves the second equality.
    The argument used only the orthogonal splitting $bb(R)^5 = p^perp xor bb(R) p$.
    It therefore applies without any assumption on multiplicities, signs,
    or nonvanishing of the tangential eigenvalues of $A$. ◻
]

#thm([Proposition 5.4.])[
  #emph[On the regular side boundary,
#[#set math.equation(numbering: n => "(5.13)")
 $ N dot.op Z + H h^2 = w^(2 a + 1) cal(S) gt.eq delta_(*) w^(2 a + 1) > 0 \, wide delta_(*) = 6984137359 /
   31250000000 \, $ <flux:signed-boundary-identity>]

 where $cal(S)$ is the boundary polynomial in (4.4). In particular $N dot.op Z + H h^2 gt.eq 0$.]
] <flux:boundary-comparison>

#proof[
  Proposition 15 gives $P = 0$ at the boundary, where $g = 0$. Since $X = B \/ w$, Lemma 18 gives
  $ N dot.op Z & = w^(2 a + 1) (U_(j k) \( S_0 + p ⊗ p \)_(j k) + C_(l i j k) p_l V_(i j k) + p_l M_l) \,\
H h^2 & = - lambda w^(2 a + 1) f . $
  Their sum is exactly $w^(2 a + 1) cal(S)$. The boundary data satisfy all hypotheses of (4.4),
    proving the stated lower bound. The sign is expressed using the inward normal $N$;
    the outward normal used by the divergence theorem is $- N$.
  Only the boundary value of $P$ vanishes. Its derivative term $D_l P_l$ remains in (5.8).
    For example, a monomial $P_l = g Q_l$ has $D_i P_l = p_i Q_l + g D_i Q_l$ at $z = 1$,
    so its derivative need not vanish when $g = 0$. ◻
]

=== 5.4 Uniform estimates for the cutoff argument <uniform-estimates-for-the-cutoff-argument>

#thm([Lemma 5.5.])[
  #emph[There is a finite constant $C$, depending only on the coefficient polynomials, the dimension, $a$,
    and $epsilon.alt_(*)$, such that on $Omega_(+)$
#[#set math.equation(numbering: n => "(5.14)")
 $ \| h \| lt.eq C w^a \, wide \| nabla h \| lt.eq C w^a \( 1 + w + \| X \| \) \, wide \| Z \| lt.eq
   C w^(2 a) \( 1 + w + \| X \| \) . $ <flux:uniform-field-bounds>]

 The constant is independent of $w$, $\| X \|$, and all subsequent cutoff parameters.]
] <flux:field-bounds>

#proof[
  The coefficient domain
  $ { \( A \, p \, g \) : A in "STF"^2 \( bb(R)^5 \) \, med \| A \| = 1 \, med \| p \|^2 + g^2 lt.eq 1 } $
  is compact. The coefficient polynomials and their first derivatives with respect to their coefficient variables
    are therefore uniformly bounded there. Also $\| q \| lt.eq \| X \|$ by Cauchy–Schwarz.
    The rules (5.3) consequently imply
  $ \| D f \| + \| q \| thin \| f \| lt.eq C \( 1 + w + \| X \| \) . $
  Use (5.5) and (5.9) for the estimates on $h$ and $nabla h$, and use (5.6) and the boundedness of $G \, M \,
    P$ for the estimate on $Z$. ◻
]

== 6 Exact verification of the algebraic certificate <sec:certificate-proof>

We return to the free algebraic data of Section 4 to prove Proposition 15. All tensors are again over $bb(R)^5$.
  The scalars $w \, z$ and vector $ell$ are free, and $X$ is an arbitrary symmetric trace-free three-tensor.
  Table I specifies the polynomials $f \, U \, K \, M \, P$, and Table II specifies nonnegative comparison forms.
  For the interior inequality, we compare $cal(I)$ with a positive diagonal quadratic form in
  $\( w \, z \, ell \, X \)$ plus projected tensor squares, and bound the remaining error term by term.
  For the boundary inequality, the analogous comparison uses scalar squares in the four tangential eigenvalues and
  a uniform bound on eleven remainder coefficients. We give the contraction rules and rational bounds in full.

=== 6.1 Tensor monomials and the fixed polynomials <cert:decode>

Here and in Appendix 9, a rank-$r$ tensor monomial is encoded by a word of decimal digits,
  partitioned into triples. Its first triple $h b j$ specifies

$ g^h \( "tr" A^3 \)^b w^(upright(bold(1))_({ j = 1 })) z^(upright(bold(1))_({ j = 2 })) . $

Each later triple $u v k$ specifies an edge carrying the matrix $A^k$, with $A^0 = delta$.
  An endpoint labeled $i in { 0 \, dots.h \, r - 1 }$ is the $i$th free slot, starting with slot zero.
  An endpoint labeled $5$ carries one copy of $p$, and one labeled $6$ carries one copy of $ell$.
  Three incidences of label $7$ are contracted against the three slots of one $X$; three incidences of label $8$,
  if present, use a second copy of $X$. Each occurrence of a vector endpoint is a separate vector factor.
  Matrix entries, vector entries, and tensor entries are multiplied, and all nonfree slots are summed.
  Edges are unoriented because $A$ is symmetric. Permuting the three incidences at an $X$ does not change its
  value because $X$ is symmetric. There are no implicit multiplicities or factorials in this convention.

Write $cal(M)_r \( s \)$ for the tensor encoded by the word $s$. For example,

$ cal(M)_0 \( mono("200550") \) = g^2 \| p \|^2 \, wide cal(M)_4 \( mono("000500520131") \)_(l i j k) =
  p_l p_j A_(i k) \, wide cal(M)_1 \( mono("000771700") \)_l = q_l . $

The digit labels encode slots and must be distinguished from the coordinate indices that are summed from $1$ to $5$.

==== 6.1.1 Table I <cert:table-I>

For $F in { f \, U \, K \, M \, P }$, let $r_F$ be respectively $0 \, 2 \, 4 \, 1 \, 1$,
  with slot orders respectively empty, $\( j \, k \)$, $\( l \, i \, j \, k \)$, $\( l \)$, $\( l \)$.
  If a row of Table I consists of $F \, s \, c$, its contribution is $c cal(M)_(r_F) \( s \) \/ Q$;
  thus each polynomial is given by

#[#set math.equation(numbering: n => "(6.1)")
 $ F = 1 / Q sum_(\( F \, s \, c \) med upright("in Table I")) c thin cal(M)_(r_F) \( s \) . $ <cert:fixed-polynomials>]

Table I contains $34 \, 57 \, 34 \, 74 \, 32$ rows for $f \, U \, K \, M \, P$, respectively.
  Every free slot occurs exactly once in every row, and these rows have no $X \, ell \, w \, z$ factors.
  Every $P$ row has a positive $g$ exponent. Because an edge has two endpoints and $U \, K$ have even rank,
  their numbers of $p$ endpoints are even. This proves the parity assertions of Proposition 15 directly from the
  definitions. The same definitions show that all five polynomials are equivariant under orthogonal changes of
  coordinates, with $f$ invariant.

=== 6.2 The nonnegative comparison polynomials <cert:gram>

The positive tensor squares below have the form of Gram-matrix certificates for polynomial positivity;
  compare [15] Section 3.2. Here all rational polynomials, projection identities,
  and remainder bounds are explicit, and we verify the certificate directly.

A header $mono("@ ") r med upright("kind") med upright("mode")$ in Table II begins a new block;
  consecutive equal headers still designate different blocks.
  For a block of nonnegative rank, write its monomial rows as $s_1 \, dots.h \,
  s_N$ and its rectangular integer coefficient matrix as $\( c_(t c) \)$. Define

$ J_c = 1 / Q sum_(t = 1)^N c_(t c) cal(M)_r \( s_t \) . $

Its contribution to $Gamma$ is

#[#set math.equation(numbering: n => "(6.2)")
 $ rho sum_c chevron.l J_c \, Pi J_c chevron.r \, wide rho =
   cases(delim: "{", 1 \, & upright("mode") = mono("I") \,, chi \, & upright("mode") = mono("B") .) $ <cert:gram-block>]

Here $Pi$ is specified below by $r$ and $upright("kind")$.
  There are nineteen such blocks with a total of $529$ monomial rows.
  Every row has degree one in $\( w \, z \, ell \, X \)$, assigning degree one to each component of these
  variables and degree zero to $A \, p \, g$. Hence $Gamma$ has degree two in these variables.

The two remaining blocks have rank $- 1$ and fourteen rows each.
  In these blocks the four digits of a row word are an exponent $beta = \( beta_1 \, dots.h \, beta_4 \)$,
  encoding $x^beta$ for $x in bb(R)^4$. Both coefficient matrices have five columns. Set

$ J_c \( x \) = 1 / Q sum_t c_(t c) x^(beta_t) \, wide "Av" F \( x \) = 1 /
  24 sum_(pi in S_4) F \( x_(pi \( 1 \)) \, dots.h \, x_(pi \( 4 \)) \) . $

Their sum defines the scalar polynomial

#[#set math.equation(numbering: n => "(6.3)")
 $ Lambda \( x \) = sum_(upright("rank ") - 1 upright(" blocks")) "Av" (rho \( x \) sum_c J_c \( x \)^2) \, wide
   rho \( x \) =
   cases(delim: "{", 1 \, & upright("mode") = mono("I") \,, x_1 + x_2 + x_3 + x_4 \, & upright("mode") =
   mono("H") .) $ <cert:boundary-gram>]

Consequently $Lambda gt.eq 0$ when $sum x_i gt.eq 0$.

==== 6.2.1 Scaled projection operators <cert:projections>

For an arbitrary rank-$r$ tensor $F$, let $F^pi$ denote slot permutation by $pi$.
  We use the averaged symmetrization $"Sym" F = \( r ! \)^(- 1) sum_(pi in S_r) F^pi$.
  The operator $"Tr"_(a b)$ contracts slots $a \, b$ with the Euclidean metric,
  leaving the remaining slots in their original order. The label $mono("none")$ means $Pi = "Id"$.
  The label $mono("anti")$ means

$ Pi F = sum_(pi in S_r) "sgn" \( pi \) F^pi . $

For $mono("sym")$, put $F' = sum_(pi in S_r) F^pi$ and $v = "Tr"_12 F'$. The operators used in Table II are

#[#set math.equation(numbering: n => "(6.4)")
 $ \( Pi F \)_(i j) & = 5 F'_(i j) - delta_(i j) v &  & \( r = 2 \) \,\
\( Pi F \)_(i j k) & = 7 F'_(i j k) - \( delta_(i j) v_k + delta_(i k) v_j + delta_(j k) v_i \) &  & \( r = 3 \) .
  $ <cert:sym2>]

For $r = 3$ and $mono("hook")$, set

#[#set math.equation(numbering: n => "(6.5)")
 $ F' & = 3 \( F + F^(\( 12 \)) \) - sum_(pi in S_3) F^pi \, & v & = "Tr"_12 F' \,\
\( Pi F \)_(i j k) & = 8 F'_(i j k) - \( 2 delta_(i j) v_k - delta_(i k) v_j - delta_(j k) v_i \) . $ <cert:hook>]

#thm([Lemma 6.1.])[
  #emph[All these operators are self-adjoint and positive semidefinite on their entire tensor spaces.
    In particular, $Gamma gt.eq 0$ whenever $chi gt.eq 0$.]
] <cert:positive-projections>

#proof[
  Each slot permutation is orthogonal, with adjoint its inverse.
    Averaging over all permutations, with or without their signs,
    gives the orthogonal projection onto symmetric or alternating tensors.
    Thus $mono("anti")$ is $r !$ times an orthogonal projection.
    For a symmetric matrix $S$, $S - delta "tr" S \/ 5$ is its orthogonal trace-free projection.
    Since $F' = 2 "Sym" F$ in (6.4), that operator is ten times the symmetric trace-free projection.
  For rank three define
  $ \( cal(J) v \)_(i j k) = delta_(i j) v_k + delta_(i k) v_j + delta_(j k) v_i . $
  Then $"Tr"_12 cal(J) v = 7 v$, and for symmetric $S$, $chevron.l S \, cal(J) v chevron.r =
    3 chevron.l "Tr"_12 S \, v chevron.r$. It follows that $S -
    cal(J) \( "Tr"_12 S \) \/ 7$ is the orthogonal projection onto symmetric trace-free tensors.
    Since now $F' = 6 "Sym" F$, (6.4) is $42$ times that projection.
  For completeness, the trace correction in (6.5) can be checked without any representation-theoretic assumptions. Let
  $ S_12 = frac("Id" + \( 12 \), 2) \, wide S = 1 / 6 sum_(pi in S_3) pi \, wide P_0 = S_12 - S . $
  The identities $S_12 S = S S_12 = S$ show that $P_0$ is an orthogonal projection.
    Its image $cal(W)$ consists of first-pair symmetric tensors orthogonal to fully symmetric tensors.
    For $H in cal(W)$,
  $ H_(i j k) = H_(j i k) \, wide H_(i j k) + H_(i k j) + H_(j k i) = 0 . $
  If $v = "Tr"_12 H$, contraction of the second identity gives $"Tr"_13 H = "Tr"_23 H = - v \/ 2$. Define
  $ \( cal(B) v \)_(i j k) = 2 delta_(i j) v_k - delta_(i k) v_j - delta_(j k) v_i . $
  Direct substitution gives $cal(B) v in cal(W)$, $"Tr"_12 cal(B) v = 8 v$, and
  $ chevron.l H \, cal(B) z chevron.r = 2 chevron.l v \, z chevron.r - chevron.l "Tr"_13 H \, z chevron.r -
    chevron.l "Tr"_23 H \, z chevron.r = 3 chevron.l v \, z chevron.r . $
  Therefore $Q_0 H = H - cal(B) \( "Tr"_12 H \) \/ 8$ has all traces zero, and $H -
    Q_0 H$ is orthogonal to every trace-free tensor in $cal(W)$.
    Thus $Q_0$ is the orthogonal projection in $cal(W)$ onto its trace-free part.
    Since $F' = 6 P_0 F$, the hook operator is $48 Q_0 P_0$; $Q_0
    P_0$ is the orthogonal projection in the full tensor space onto that subspace. In particular
  $ chevron.l F \, Pi F chevron.r = 48 \| Q_0 P_0 F \|^2 gt.eq 0 . $
  Finally the weights in (6.2) are nonnegative under the stated constraint. ◻
]

=== 6.3 Exact contraction and differentiation rules <cert:collection>

We give explicit collection rules both to specify the finite calculation and to justify that it is an identity on
  all the constrained tensors. A graph key records the rank, powers of $g \, w \, z$,
  a multiset of trace factors $"tr" A^k$, and a multiset of edges with their powers.
  For purposes of ordering keys, replace endpoint labels $5 \, 6 \, 7 \, 8$ by $- 1 \, - 2 \, - 3 \, - 4$.
  Sort the endpoints of each edge, sort the edge list and trace list,
  and take the lexicographically larger edge list obtained by retaining or exchanging $- 3 \, - 4$.
  A lone cubic tensor is thereby labeled $- 3$. These choices are only ordering conventions:
  exchange of two identical copies of $X$ preserves the value of every graph.

Tensor multiplication takes the disjoint union of graphs, shifts the free slot labels of the second factor,
  and distinguishes any two cubic tensor copies. A contraction of two free slots joins their incident edges.
  If these are different edges, their powers add; if they are the same edge, it becomes a trace $"tr" A^k$.
  The removed free slots are deleted and the others renumbered in order.
  The identities underlying these operations are precisely

$ sum_i \( A^h \)_(a i) \( A^k \)_(i b) = \( A^(h + k) \)_(a b) \, wide sum_i \( A^k \)_(i i) = "tr" A^k . $

Reduce the trace factors of powers $0 \, 1 \, 2$ to $5 \, 0 \, 1$, respectively.
  An edge of power zero connecting two slots of the same $X$ makes the monomial zero.
  Thus every reduction is an equality on the allowed data. Other identities need not be imposed:
  retaining two different keys for functions that happen to agree cannot invalidate either the expansion or the
  later triangle inequality.

The derivative of a path and of a trace is

#[#set math.equation(numbering: n => "(6.6)")
 $ D_l \( A^k \) & = sum_(h = 0)^(k - 1) A^h X_l A^(k - 1 - h) - k q_l A^k \, & \( X_l \)_(i j) & = X_(l i j) \,\
D_l "tr" A^k & = k thin "tr" \( A^(k - 1) X_l \) - k q_l "tr" A^k . $ <cert:path-derivative>]

For $k = 0$ the sums and derivatives are zero. These formulas follow by differentiating each matrix factor using
  (4.2); cyclic invariance of trace makes all $k$ insertion positions on a trace equal.
  In graph form, inserting $X_l$ on an edge of power $k$ splits it into two paths of lengths $h \, k - 1 -
  h$ ending at a new $X$, whose last slot is the derivative index $l$.
  The negative terms from all $A$ factors combine into minus the total $A$ degree times $q_l$ times the original
  graph. Each $p$ endpoint is in turn replaced by $w A_(l dot.op) - g z delta_(l dot.op)$,
  and a factor $g^h$ gives $h z g^(h - 1) p_l$. If an edge has two $p$ endpoints,
  these are two product-rule terms, including their multiplicity when they coincide.

These operations are also sound if traces were simplified first, since

$ D_l "tr" A = 0 \, wide D_l "tr" A^2 = 2 X_(l i j) A_(i j) - 2 q_l \| A \|^2 = 0 . $

Only the original Table I monomials are differentiated, exactly once.
  No already differentiated graph, or graph involving $X \, w \, z$, is differentiated again.
  Thus no unspecified higher derivative enters the calculation.

#thm([Lemma 6.2.])[
  (Closure of the graph calculation).  #emph[The preceding rules evaluate all terms of $cal(I)$ and $Gamma$ by a
    finite sum of scalar graphs. In every intermediate graph a free slot has exactly one incidence,
    each cubic tensor has exactly three incidences, and there are at most two cubic tensors.
    Every resulting scalar graph has degree two in $\( w \, z \, ell \, X \)$.]
] <cert:closure>

#proof[
  The incidence assertions hold for each table row by its decoding. A disjoint union preserves them.
    A permutation only renames free slots. Contracting two free slots removes their unique incidences and joins
    the remaining ends, or closes a trace; it does not change the number of slots of any cubic tensor.
    The derivative insertion described above replaces one edge by two incidences of a new $X$ and supplies its
    third incidence as a new free slot. Trace differentiation does the same with a self-edge.
    The $q_l$ term supplies two incidences on its self-edge and the third at $l$.
    Derivatives of $p$ and $g$ supply a free derivative slot without introducing a cubic tensor.
    These statements prove the incidence assertions by induction over the operations.
  Table I has degree zero and its derivative has degree one in the indicated variables.
    The formula for $cal(I)$ multiplies such derivatives by one further factor,
    or a degree-zero coefficient by two factors. Each Table II row has degree one; projection, contraction,
    and multiplication by $chi$ preserve that degree. Squaring produces degree two.
    In particular no operation used here needs three copies of $X$.
    Termination is immediate from the finite tables, finite permutation sums, and the finite product rule;
    every contraction reduces the number of free slots by two. ◻
]

The linear contribution of each Table I row is obtained by substitution into (4.3), forming $C = K -
  K^(\( 12 \))$ for a $K$ row. One check on the slot order and coefficients is the single row $U =
  A$ with coefficient one. Its interior contribution is

$ 5 z^2 + \| X \|^2 + \( 2 a - 2 \) \| q \|^2 \, $

and its boundary contribution is $2 lambda - "tr" A^3$. To expand a Gram block,
  sum over unordered pairs of rows $s \, t$: the coefficient is $sum_c c_(s c) c_(t c) \/ Q^2$,
  doubled when $s eq.not t$, and the graph polynomial is the contraction of row $t$ with $Pi$ applied to row $s$,
  multiplied by $rho$. This uses self-adjointness of $Pi$ and accounts for every term of (6.2) exactly once.

=== 6.4 Bounds for scalar graphs <cert:bounds>

Put $theta = 4 \/ 5$. We first establish the tensor estimates that will bound each scalar graph,
  retaining the dependence between $p$ and $g$.

#thm([Lemma 6.3.])[
  #emph[For the constrained matrix $A$ and symmetric trace-free tensor $X$,
#[#set math.equation(numbering: n => "(6.7)")
 $ parallel A parallel_(upright("op"))^2 & lt.eq theta \, & \| A^k \|^2 & lt.eq theta^(k - 1) quad \( k gt.eq 1 \) \,\
\| "tr" A^k \|^2 & lt.eq theta^(k - 2) quad \( k gt.eq 2 \) \, & \| "tr" A^3 \|^2 & lt.eq 9 / 20 \,\
\| X : A \|^2 & lt.eq 5 / 7 \| X \|^2 \, & \( X : A \)_i & = X_(i j k) A_(j k) . $ <cert:matrix-bounds>]

 If $h \, b > 0$ and $g^2 + \| p \|^2 lt.eq 1$, then
#[#set math.equation(numbering: n => "(6.8)")
 $ \| g \|^(2 h) \| p \|^(2 b) lt.eq (frac(h, h + b))^h (frac(b, h + b))^b . $ <cert:mixed-bound>]

]
] <cert:tensor-bounds>

#proof[
  Let the eigenvalues of $A$ be $alpha_1 \, dots.h \, alpha_5$. For each $i$,
  $ alpha_i^2 = (sum_(j eq.not i) alpha_j)^2 lt.eq 4 sum_(j eq.not i) alpha_j^2 = 4 \( 1 - alpha_i^2 \) . $
  This proves the operator bound, and $sum_i alpha_i^(2 k) lt.eq
    theta^(k - 1) sum_i alpha_i^2$ proves the Frobenius bound.
    Moreover $\| sum_i alpha_i^k \| lt.eq sum_i \| alpha_i \|^k lt.eq
    theta^(\( k - 2 \) \/ 2) sum_i alpha_i^2$ for $k gt.eq 2$.
  For the sharper cubic bound maximize and minimize $sum_i alpha_i^3$ on the compact set $sum_i alpha_i = 0$,
    $sum_i alpha_i^2 = 1$. The gradients of the two constraints are independent there.
    Lagrange multipliers give $3 alpha_i^2 = mu + 2 nu alpha_i$,
    so an extremum has two distinct eigenvalues (a single value would violate the constraints).
    If their multiplicities are $j \, 5 - j$, the values are, up to simultaneous sign,
  $ sqrt(frac(5 - j, 5 j)) \, wide - sqrt(frac(j, 5 \( 5 - j \))) . $
  Their cubic trace has absolute value $\| 5 - 2 j \| \/ sqrt(5 j \( 5 - j \))$.
    Its square is $9 \/ 20$ for $j = 1 \, 4$ and $1 \/ 30$ for $j = 2 \, 3$, proving (6.7).
  To prove (6.7), fix a vector $zeta$ and symmetrize $zeta ⊗ A$:
  $ B_(i j k) = frac(zeta_i A_(j k) + zeta_j A_(i k) + zeta_k A_(i j), 3) \, wide v = "Tr"_12 B = 2 / 3 A zeta . $
  Expanding the nine terms in $\| B \|^2$ gives $\| B \|^2 = \| zeta \|^2 \/ 3 + 2 \| A zeta \|^2 \/ 3$.
    The symmetric trace-free projection is $F = B - cal(J) v \/ 7$, in the notation of Lemma 21.
    Since $\| cal(J) v \|^2 = 21 \| v \|^2$ and $chevron.l B \, cal(J) v chevron.r = 3 \| v \|^2$,
  $ \| F \|^2 = \| B \|^2 - 3 / 7 \| v \|^2 = 1 / 3 \| zeta \|^2 + 10 / 21 \| A zeta \|^2 lt.eq 5 / 7 \| zeta \|^2 . $
  Symmetry and trace-freeness of $X$ give $chevron.l X : A \, zeta chevron.r = chevron.l X \, F chevron.r$;
    Cauchy–Schwarz and duality prove the claim.
  Finally put $s = g^2 \, t = \| p \|^2$. For $h \, b > 0$, the maximum of $s^h t^b$ on $s \, t gt.eq 0$, $s +
    t lt.eq 1$ lies on $s + t = 1$. Differentiating $h log s +
    b log \( 1 - s \)$ gives the unique interior maximum $s = h \/ \( h + b \)$, proving (6.8).
    If either exponent is zero, the corresponding bound is simply $1$. ◻
]

For a nonzero scalar graph key $t$ of degree two, let

$ y = \( \| w \| \, \| z \| \, \| ell \| \, \| X \| \)^T $

and let $i \, j in { 1 \, 2 \, 3 \, 4 }$ be its two degree-one types,
  counted with multiplicity and ordered so $i lt.eq j$. Let $h$ be its $g$ exponent and $b$ its number of $p$
  endpoints. Define $L_t^2$ as a product of the following rational factors:

+ for each trace $"tr" A^k$, use $theta^(k - 2)$, replacing this by $9 \/ 20$ when $k = 3$;
+ for an edge of power $k$ between distinct vertices, use $theta^k$;
+ for an edge between two slots of the same $X$, use $5 \/ 7$ when $k = 1$ and $theta^(k - 1)$ when $k gt.eq 2$;
+ if $h \, b > 0$, include the right side of (6.8); otherwise include $1$.

Here separate occurrences of a vector endpoint count as distinct vertices;
  thus a $p$–$p$ edge is governed by Item (6.8), not Item (6.8).
  Power-zero self-edges at $X$ have already vanished in the collection rules.

#thm([Lemma 6.4.])[
  (Complete graph bound).  #emph[Every scalar graph retained by Lemma 22 satisfies
#[#set math.equation(numbering: n => "(6.9)")
 $ \| cal(M) \( t \) \| lt.eq L_t y_i y_j $ <cert:monomial-bound>]

 on $g^2 + \| p \|^2 lt.eq 1$.]
] <cert:graph-bound>

#proof[
  First separate all scalar trace factors and use Lemma 23.
    A cubic tensor has at most one self-edge, since such an edge consumes two of its three incidences.
    An edge of power $k gt.eq 2$ reduces that tensor to the vector $v_i = X_(i j k) \( A^k \)_(j k)$,
    for which $\| v \| lt.eq \| X \| thin \| A^k \| lt.eq \| X \| theta^(\( k - 1 \) \/ 2)$.
    For $k = 1$ use (6.7). These reductions leave at most two cubic vertices and no self-edge on either.
  We list all possible connected components of the remaining graph.
    With zero cubic vertices, a component is one edge joining two vectors;
    its contraction is bounded by the operator norm of its matrix times the two vector norms.
    With one cubic vertex, all its three slots end at vector leaves.
    Move each edge matrix onto its vector, and use tensor Cauchy–Schwarz,
    obtaining the norm of $X$ times the three vector norms and the product of the three operator norms.
  If a component contains two cubic vertices, they are joined by $r = 1 \, 2 \,$ or $3$ edges;
    every other slot ends at a vector leaf. Contract these leaves first, obtaining rank-$r$ tensors $Y \,
    Z$ with the same preceding norm bounds. Up to a permutation of their slots, the remaining contraction is
  $ ⟨Y \, \( A^(k_1) ⊗ dots.h.c ⊗ A^(k_r) \) Z⟩ . $
  Its absolute value is at most $\| Y \| \| Z \| product_(s = 1)^r parallel A^(k_s) parallel_(upright("op"))$.
    This includes all three parallel edges when $r = 3$, without a dimension factor.
    If the two cubic vertices have no edge between them, they lie in two components of the one-vertex type already
    treated. These cases are exhaustive: all other vertices have valence one,
    so cannot occur internally on a path, and there are no further cubic vertices.
    The reduced vectors from self-edges are ordinary vector leaves in this classification.
  Multiply the estimates over components. Each original $ell$ or $X$ norm appears once per occurrence,
    all ordinary edge matrices contribute $theta^(k \/ 2)$, and the $p$ endpoints contribute $\| p \|^b$.
    The scalar factors $g^h$ and $\| p \|^b$ are bounded jointly by (6.8).
    Finally the total degree is two, so all remaining $w \, z \, ell \, X$ factors give exactly $y_i y_j$. ◻
]

We can now bound every term left after subtracting the nonnegative comparison forms.
  The graph estimates reduce this remainder to a quadratic form in four magnitudes.
  The next calculation shows that its error is smaller than the reserved positive diagonal terms.

=== 6.5 The interior remainder and its coercive margin <cert:interior-remainder>

Set

#[#set math.equation(numbering: n => "(6.10)")
 $ d = (2 / 25 \, 2 / 25 \, 1 / 4 \, 1) \, wide E = Gamma + sum_(i = 1)^4 d_i y_i^2 - cal(I) . $ <cert:remainders>]

The squared norms in Equation (6.10) are polynomial contractions.
  Expand and collect $E = sum_t e_t cal(M) \( t \)$ by Section 6.3,
  discarding zero coefficients only after their signed contributions have been summed.
  All coefficients are rational. The denominator $Q^2$ suffices:
  Gram terms have that denominator, and the denominators of $a \, d_i$,
  and all Table I coefficients divide it after multiplication by $Q^2$.

For each retained key let $n_t$ be the least nonnegative integer satisfying

#[#set math.equation(numbering: n => "(6.11)")
 $ n_t^2 gt.eq 10^10 L_t^2 \, wide hat(L)_t = n_t / 10^5 . $ <cert:root-rounding>]

There is no floating-point square root in this prescription.
  For a rational $s = 10^10 L_t^2$, compute $n = floor.l sqrt(floor.l s floor.r)
  floor.r$ by integer arithmetic and increase it by one exactly when $n^2 < s$. Form a symmetric matrix $D_0$ by adding

#[#set math.equation(numbering: n => "(6.12)")
 $ frac(\| e_t \| hat(L)_t, 1 + upright(bold(1))_({ i eq.not j })) $ <cert:D0>]

to its $i j$ entry and also its $j i$ entry if $i eq.not j$, starting with zero.
  The factor $1 \/ 2$ in an off-diagonal entry is required because the associated term in $y^T D_0
  y$ is $2 \( D_0 \)_(i j) y_i y_j$. Lemma 24 and the triangle inequality therefore give

#[#set math.equation(numbering: n => "(6.13)")
 $ \| E \| lt.eq y^T D_0 y . $ <cert:error-bound>]

For clarity, the exact finite calculation needed here is the following.
  Decode all rows of Tables I and II; expand the nineteen Gram blocks by unordered row pairs and the finite
  projections (6.4)–(6.5); subtract each Table I contribution to (4.3);
  and add the four contractions with coefficients $d_i$. Use the contraction, derivative,
  and key ordering rules above after each operation. Combine all signed coefficients at equal keys.
  For each nonzero key compute its rational $L_t^2$, perform (6.11), and add (6.12).
  This gives all ten upper-triangular entries as follows:

#[#set math.equation(numbering: n => "(6.14)")
 $ \( i \, j \) & upright("nonzero keys") & 2 dot.op 10^5 Q^2 \( D_0 \)_(i j)\
\( 1 \, 1 \) & 89 & 321268243322644\
\( 1 \, 2 \) & 53 & 96616799870252\
\( 1 \, 3 \) & 123 & 294707669526536\
\( 1 \, 4 \) & 170 & 385792585960684\
\( 2 \, 2 \) & 64 & 269583307398596\
\( 2 \, 3 \) & 85 & 115717471031956\
\( 2 \, 4 \) & 106 & 125155603107368\
\( 3 \, 3 \) & 238 & 605509501361296\
\( 3 \, 4 \) & 414 & 618424270356936\
\( 4 \, 4 \) & 372 & 1004504025266456 $ <cert:exact-interior-sums>]

In particular there are $1714$ nonzero keys. These finite sums use only integer and rational operations and
  comparisons; the complete literal input is in Appendix 9.
  The accompanying program #raw("verification/checks/reproduce.py") implements the specified calculation and
  records the individual coefficients as well as these sums.

Entrywise, (6.14) implies $D_0 lt.eq overline(D)$, where

#[#set math.equation(numbering: n => "(6.15)")
 $ overline(D) = 1 /
   10^5
   mat(delim: "(", 2571, 773, 2358, 3087; 773, 2157, 926, 1002; 2358, 926, 4845, 4948; 3087, 1002, 4948, 8037) .
   $ <cert:upper-matrix>]

For example, this entrywise check consists of comparing each last-column integer in (6.14) with the corresponding
  integer in (6.15) multiplied by $2 Q^2$. Let $nu = \( 2484 \, 1440 \, 996 \, 304 \)^T$. The exact diagonal slacks are

#[#set math.equation(numbering: n => "(6.16)")
 $ (d_i - frac(\( overline(D) nu \)_i, nu_i))_(i = 1)^4 =
   (673 / 18400 \, 438907 / 12000000 \, 2844869 / 24900000 \, 3479389 / 7600000) . $ <cert:slacks>]

For $y_i gt.eq 0$, weighted Young inequalities give

$ 2 y_i y_j lt.eq nu_j / nu_i y_i^2 + nu_i / nu_j y_j^2 \, wide y^T D_0 y lt.eq y^T overline(D) y lt.eq
  sum_i frac(\( overline(D) nu \)_i, nu_i) y_i^2 . $

Use $Gamma gt.eq 0$ in (6.10) and then (6.13). It follows that $cal(I)$ is at least the sum of $y_i^2$ times the
  four positive slacks in (6.16). In particular the coefficients of $z^2$ and $\|
  ell \|^2$ are at least $epsilon.alt_(*)$, proving (4.3). To obtain the stated positivity of $f$, keep $A \, p \,
  g$ fixed, set $X = w = z = 0$, and choose $\| ell \| = 1$. Then $q = 0$, every $D$ term is zero, and $cal(I) = f$.

=== 6.6 Boundary reduction and the eleven coefficients <cert:boundary-remainder>

It remains to verify (4.4). Orthogonal equivariance allows us to take $p =
  e_5$ and to diagonalize $A$ on $p^perp$. Write

#[#set math.equation(numbering: n => "(6.17)")
 $ A = "diag" \( x_1 \, x_2 \, x_3 \, x_4 \, lambda \) \, wide lambda = - sum_(i = 1)^4 x_i \, wide R \( x \) :=
   sum_(i = 1)^4 x_i^2 + (sum_(i = 1)^4 x_i)^2 = 1 . $ <cert:eigenvalues>]

No sign or distinctness condition is imposed on the $x_i$;
  the normal eigenvalue condition is exactly $sum_i x_i > 0$.
  In these coordinates $\( S_0 \)_55 = 0$ and $\( S_0 \)_(alpha alpha) = b_alpha := lambda x_alpha - x_alpha^2$.
  The only nonzero entries of $V$ are $V_555 = 1$ and the three permutations of $V_(5 alpha alpha) = b_alpha$.
  Since $C_(55 j k) = 0$, a direct component formula for the boundary polynomial is therefore

#[#set math.equation(numbering: n => "(6.18)")
 $ cal(S) = - lambda f + U_55 + M_5 +
   sum_(alpha = 1)^4 b_alpha \( U_(alpha alpha) + C_(5 alpha 5 alpha) + C_(5 alpha alpha 5) \) \,
   $ <cert:boundary-components>]

where the fixed polynomials are evaluated at (6.17), $p = e_5 \, g = 0$.
  This formula does not assume additional slot symmetries of $U$ or $K$.

Equivalently, one may contract the boundary expression as a scalar graph and then substitute

#[#set math.equation(numbering: n => "(6.19)")
 $ p dot.op A^k p = (- sum_i x_i)^k \, wide "tr" A^k = sum_i x_i^k + (- sum_i x_i)^k . $ <cert:boundary-substitution>]

For $k = 0$, the latter is $5$ and the former is $1$. The trace reductions $"tr" A = 0$, $"tr" A^2 =
  1$ remain valid on $R = 1$. Thus either (6.18) or (6.19) evaluates the same scalar on all the allowed data.
  Orthogonal invariance under permutations of $p^perp$ shows that $cal(S)$ is symmetric in $x_1 \, dots.h \, x_4$.

Define the boundary remainder on this constraint set by

$ E_b = Lambda + 1 / 4 - cal(S) . $

Expanding the two boundary Gram blocks and the Table I expression gives a polynomial representative with monomials
  of degree at most five. A finite way to check the degree assertion is to use (6.18):
  discard positive $g$ powers, substitute the diagonal matrix and normal vector in each of the $231$ rows,
  and add the displayed terms. All remaining monomials have degree at most five.
  Each boundary $J_c$ has degrees one and two, so its squared terms have degree at most four,
  or five after the $mono("H")$ weight.

The following convention gives a small exact list of its coefficients.
  For an ordinary monomial $x^alpha$ of degree $j lt.eq 5$, replace it by

#[#set math.equation(numbering: n => "(6.20)")
 $ x^alpha R^(floor.l \( 5 - j \) \/ 2 floor.r) . $ <cert:homogenization>]

This preserves its value on $R = 1$ and gives degree four if $j$ is even and degree five if $j$ is odd.
  Perform the replacement before collecting exponents. Because $R$ is symmetric,
  it commutes with permutation averaging. For a nondecreasing exponent vector $beta$ put

$ m_beta \( x \) = "Av" \( x^beta \) . $

Expand (6.20) and sum the coefficients of all exponent vectors whose nondecreasing rearrangement is $beta$.
  Their sum is the coefficient of $m_beta$ after averaging:
  indeed $"Av" \( x^alpha \) = m_beta$ for every member $alpha$ of that orbit, including when exponents repeat.
  Thus sorting exponents and summing coefficients introduces no extra factor of $24$.
  Since $cal(S)$ and the constant are symmetric and $Lambda$ was defined by averaging,
  the resulting averaged polynomial still equals $E_b$ on $R = 1$.

Precisely, using the row-pair expansion of Section 6.3 for the two rank-$- 1$ blocks,
  subtracting the boundary contributions from Table I with denominator $Q$,
  and adding the homogenized constant $1 \/ 4$, one obtains

#[#set math.equation(numbering: n => "(6.21)")
 $ E_b \( x \) = sum_beta e_beta^(\( b \)) m_beta \( x \) quad upright("on ") R = 1 \, $ <cert:boundary-expansion>]

with exactly the following eleven nonzero coefficients:

#[#set math.equation(numbering: n => "(6.22)")
 $ beta & Q^2 e_beta^(\( b \)) & beta & Q^2 e_beta^(\( b \))\
\( 0 \, 0 \, 0 \, 4 \) & - 13479110 & \( 0 \, 0 \, 0 \, 5 \) & 17712712\
\( 0 \, 0 \, 1 \, 3 \) & - 93201124 & \( 0 \, 0 \, 1 \, 4 \) & 151038620\
\( 0 \, 0 \, 2 \, 2 \) & - 78543848 & \( 0 \, 0 \, 2 \, 3 \) & 244636976\
\( 0 \, 1 \, 1 \, 2 \) & - 139986162 & \( 0 \, 1 \, 1 \, 3 \) & 310091962\
\( 0 \, 1 \, 2 \, 2 \) & 445177656 & \( 1 \, 1 \, 1 \, 1 \) & - 4861942\
\( 1 \, 1 \, 1 \, 2 \) & 157995170 &  & $ <cert:eleven-coefficients>]

This coefficient computation consists solely of the explicitly stated substitutions,
  multiplication of ordinary four-variable polynomials, and coefficient addition.
  It is also included in the accompanying exact reproducer.

On $R = 1$ every $\| x_i \| lt.eq 1$, hence $\| m_beta \( x \) \| lt.eq 1$.
  Adding the eleven absolute integer coefficients gives

$ Q^2 sum_beta \| e_beta^(\( b \)) \| = 1656725282 . $

Since $sum_i x_i = - lambda > 0$, (6.3) is nonnegative. It follows from (6.21) that

$ cal(S) = Lambda + 1 / 4 - E_b gt.eq 1 / 4 - 1656725282 / 62500000000 = 6984137359 / 31250000000 = delta_(*) . $

This completes the proof of Proposition 15. The estimate also persists at $lambda = 0$ by continuity;
  repeated tangent eigenvalues cause no singularity in any of the formulas.

The pointwise comparisons and field bounds of Section 5 are therefore established.
  Section 7 now justifies their integration across Hessian zeros and near the suspension tips.

== 7 Hessian zeros, suspension tips, and the contradiction <cut:section>

We now justify the integration of the pointwise comparison.
  Retain the original smooth component $Omega_o subset S^(m_o)$, with $m_o in { 4 \, 5 }$,
  from Proposition 6 and Lemma 7. Its tensor $T_o$ is not identically zero. Write

$ B_o = nabla T_o \, wide w_o = \| T_o \| \, wide cal(Z)_o = { y in overline(Omega)_o : w_o \( y \) = 0 } \, wide
  Omega_(o \, +) = Omega_o \\ cal(Z)_o . $

The tensor $T_o$ is smooth on the compact closure; its norm $w_o$ is continuous there and smooth where it is
  positive. The working domain $Omega subset S^5$ is $Omega_o$ when $m_o = 5$, and its suspension when $m_o = 4$.
  On the regular part of this working domain we use the unadorned notation of Sections 3 and Section 5.
  In particular, $Z$ denotes the flux vector field, whereas $cal(Z)_o$ denotes the original Hessian zero set.
  Set $M_o = parallel w_o parallel_(L^oo \( Omega_o \))$. We fix

$ a = 29 / 50 \, wide epsilon.alt_(*) = 438907 / 12000000 > 0 . $

Interior and boundary integrals use their respective spherical volume and area measures; in the suspension,
  boundary integrals refer to its regular side boundary.

=== 7.1 Weighted integrability on the original component <weighted-integrability-on-the-original-component>

#thm([Lemma 7.1.])[
  (Weighted Bochner estimate).  #emph[The set $cal(Z)_o$ is a compact subset of $Omega_o$, and
#[#set math.equation(numbering: n => "(7.1)")
 $ integral_(Omega_(o \, +)) w_o^(2 a - 2) \| B_o \|^2 thin d V_o < oo . $ <cut:weighted-integrability>]

 Consequently the function
#[#set math.equation(numbering: n => "(7.2)")
 $ D_o \( y \) =
   cases(delim: "{", w_o \( y \)^(2 a) #scale(x: 120%, y: 120%)[\(] 1 + \| B_o \( y \) \| \/ w_o \( y \)
   #scale(x: 120%, y: 120%)[\)]^2 \, & y in Omega_(o \, +) \,, 0 \, & y in cal(Z)_o \,) $ <cut:original-dominator>]

 belongs to $L^1 \( Omega_o \)$.]
] <cut:weighted-bochner>

#proof[
  The boundary conclusion of Lemma 10 gives $w_o > 0$ at every point of $partial Omega_o$.
    Compactness and continuity therefore give a boundary neighborhood on which $w_o$ has a positive lower bound.
    The closed set $cal(Z)_o$ is thus compactly contained in the interior.
    If it is empty, $w_o$ has a positive minimum on the whole compact closure,
    and (7.1) follows immediately from the boundedness of $B_o$.
  Otherwise choose $eta in C_c^oo \( Omega_o \)$ with $0 lt.eq eta lt.eq 1$,
    equal to one on an open neighborhood of $cal(Z)_o$. For $0 < delta lt.eq 1$ put $W_delta = w_o^2 + delta$.
    Although $w_o$ need not be smooth at its zeros, $W_delta$ is smooth and strictly positive.
    The identities in Proposition 9 give
  $ Delta W_delta = 2 m_o w_o^2 + 2 \| B_o \|^2 gt.eq 2 \| B_o \|^2 \, wide \| nabla W_delta \|^2 =
    4 \| chevron.l T_o \, B_o chevron.r \|^2 lt.eq 4 W_delta \| B_o \|^2 . $
  Set $I_delta = integral_(Omega_o) eta W_delta^(a - 1) \| B_o \|^2 thin d V_o$.
    Applying the chain rule to $W_delta^a$ and integrating twice by parts against the compactly supported $eta$ yields
  $ 2 I_delta & lt.eq integral_(Omega_o) eta W_delta^(a - 1) Delta W_delta thin d V_o\
 & = 1 / a integral_(Omega_o) \( Delta eta \) W_delta^a thin d V_o + \( 1 - a \) integral_(Omega_o) eta
   W_delta^(a - 2) \| nabla W_delta \|^2 thin d V_o\
 & lt.eq 1 / a integral_(Omega_o) \( Delta eta \) W_delta^a thin d V_o + 4 \( 1 - a \) I_delta . $
  Since $2 - 4 \( 1 - a \) = 4 a - 2 = 8 \/ 25$, this proves the explicit uniform estimate
  #[#set math.equation(numbering: n => "(7.3)")
   $ 8 / 25 I_delta lt.eq 1 / a \( M_o^2 + 1 \)^a parallel Delta eta parallel_(L^1 \( Omega_o \)) . $ <cut:absorption>]
  As $delta arrow.b 0$, the nonnegative integrands restricted to $Omega_(o \, +)$ increase to $eta
    w_o^(2 a - 2) \| B_o \|^2$ because $a < 1$. Monotone convergence and (7.3) control that integral.
    The compact set $"supp" \( 1 - eta \) subset overline(Omega)_o$ is disjoint from $cal(Z)_o$;
    writing $b_eta > 0$ for the minimum of $w_o$ there, the remaining integral is bounded by
  $ integral_(Omega_(o \, +)) \( 1 - eta \) w_o^(2 a - 2) \| B_o \|^2 thin d V_o lt.eq
    b_eta^(2 a - 2) parallel B_o parallel_(L^2 \( Omega_o \))^2 . $
  Thus all constants in this argument depend only on the fixed original component and its smooth data, on $a$,
    and on the chosen interior cutoff $eta$, and are independent of $delta$. Finally, on $Omega_(o \, +)$,
  $ D_o lt.eq 2 w_o^(2 a) + 2 w_o^(2 a - 2) \| B_o \|^2 . $
  The first term is integrable by compactness, and the second by (7.1).
    No measure, dimension, or regularity property of $cal(Z)_o$ has been used. ◻
]

=== 7.2 Smooth angular cutoffs and the integrated comparison <smooth-angular-cutoffs-and-the-integrated-comparison>

Let $theta.alt in C^oo \( \[ 0 \, oo \) \)$ satisfy $0 lt.eq theta.alt lt.eq 1$, $theta.alt =
  0$ on $\[ 0 \, 1 \]$, and $theta.alt = 1$ on $\[ 2 \, oo \)$. Fix this profile once and for all, and set

$ L_theta.alt = parallel theta.alt' parallel_oo \, wide kappa = 2 L_theta.alt . $

For integers $j gt.eq 3$ define

#[#set math.equation(numbering: n => "(7.4)")
 $ alpha_j \( y \) = theta.alt \( j w_o \( y \) \) \, wide xi_j =
   cases(delim: "{", alpha_j \, & m_o = 5 \,, alpha_j \( y \) beta_j \( t \) \, quad beta_j \( t \) = theta.alt \(
   j sin t \) \, & m_o = 4 .) $ <cut:cutoffs>]

Here $alpha_j$ is defined to be zero at $cal(Z)_o$, consistently with the displayed formula.
  It is smooth on $overline(Omega)_o$: near any zero of $w_o$ it is identically zero,
  and all its transitions occur where $w_o$ is smooth and positive.
  In the suspension, $beta_j$ vanishes on whole neighborhoods of both tips.

Figure 1 displays the two exclusions made by the product cutoff in the suspended case.
  Its transition bands shrink toward the two tips and the original Hessian zero set.
  The weighted estimate above will control the errors produced in all these bands at once.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (11.4, 0.55), fill: rgb("#e1e1e1"), stroke: none)
  rect((0, 0.55), (0.7, 3.15), fill: rgb("#e1e1e1"), stroke: none)
  rect((10.7, 0.55), (11.4, 3.15), fill: rgb("#e1e1e1"), stroke: none)
  rect((1.45, 1.1), (9.95, 3.15), fill: rgb("#e8e8ff"), stroke: none)
  rect((0, 0), (11.4, 3.15), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.7, 0), (0.7, 3.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((10.7, 0), (10.7, 3.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 0.55), (11.4, 0.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.45, 0), (1.45, 3.15), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((9.95, 0), (9.95, 3.15), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 1.1), (11.4, 1.1), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((5.7, 2.05), [#text(size: 9pt)[$xi_j=1$]])
  content((5.7, 2.65), [#text(size: 9pt)[$w_o(y) gt.eq 2"/"j, sin t gt.eq 2"/"j$]])
  content((5.7, 0.26), [#text(size: 9pt)[$xi_j=0$ near the Hessian zero set]])
  content((0.34, 1.9), [#text(size: 9pt)[$xi_j=0$]], angle: 90deg)
  content((11.06, 1.9), [#text(size: 9pt)[$xi_j=0$]], angle: 90deg)
  line((0, 0), (11.85, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((11.85, 0), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 3.55), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0, 3.55), [#text(size: 9pt)[$w_o(y)$]], anchor: "south", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((11.4, 0), [#text(size: 9pt)[$pi$]], anchor: "north", padding: 0.1176cm)
  content((0, 0.55), [#text(size: 9pt)[$1"/"j$]], anchor: "east", padding: 0.1176cm)
  content((0, 1.1), [#text(size: 9pt)[$2"/"j$]], anchor: "east", padding: 0.1176cm)
  content((0, -0.52), [#text(size: 9pt)[$p_+$]], anchor: "north", padding: 0.1176cm)
  content((11.4, -0.52), [#text(size: 9pt)[$p_-$]], anchor: "north", padding: 0.1176cm)
  line((0.7, -0.04), (0.7, -0.72), (2.35, -0.72), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<"))
  content((2.35, -0.72), [#text(size: 9pt)[$t= "arcsin" (1"/"j)$]], anchor: "west", padding: 0.1176cm)
  line((9.95, -0.04), (9.95, -1.23), (8.65, -1.23), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<"))
  content((8.65, -1.23), [#text(size: 9pt)[$t= pi - "arcsin" (2"/"j)$]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: The product cutoff on a suspended component. The horizontal variable is the suspension angle in $Phi \( t \, y \) = \( sin t thin y \, cos t \)$; the two end slices collapse to the tips $p_(+)$ and $p_(-)$. The vertical variable records the value of $w_o \( y \)$, not a coordinate on $Omega_o$. Gray regions have $xi_j = 0$, and the blue region has $xi_j = 1$; the intervening bands contain the smooth transitions. The scales are schematic, and no shape or regularity of the Hessian zero set is represented. ],
) <fig:suspension-cutoff>

On $Omega_(+) = { x in Omega : w \( x \) > 0 }$, use the fields

$ h = w^a sqrt(f \( A \, p \, g \)) \, wide Z_l = w^(2 a) \( G_(l i j k) X_(i j k) + w M_l + P_l \) $

constructed in Section 5. By Lemma 20, there is a fixed $C_F gt.eq 1$ such that

#[#set math.equation(numbering: n => "(7.5)")
 $ \| h \| lt.eq C_F w^a \, wide \| nabla h \| lt.eq C_F w^a \( 1 + w + \| X \| \) \, wide \| Z \| lt.eq
   C_F w^(2 a) \( 1 + w + \| X \| \) . $ <cut:field-estimates>]

The constant depends only on $a$, the dimension $5$, the finitely many coefficients defining $f \, G \, M \, P$,
  and the positive lower bound $f gt.eq epsilon.alt_(*)$. In particular $C_F$ is independent of the cone, $w$,
  $X$, and $j$.

For each fixed $j$, define $v_j = xi_j h$ and $F_j = xi_j^2 Z$ on $Omega_(+)$, and extend them by zero where $w =
  0$. These are smooth on the regular closure of $Omega$ and are supported away from the tips when present.
  The same neighborhood argument as for $alpha_j$ proves smoothness of these extensions;
  it does not require $h$ or $Z$ themselves to extend smoothly across $w = 0$.
  All products below containing one of these cutoff factors or its derivative are likewise understood to be zero
  on $w = 0$. The mass $w^(2 a)$, whose exponent is positive,
  has its ordinary value zero there and involves no normalized tensor.

#thm([Lemma 7.2.])[
  (Integrated comparison).  #emph[For each fixed $j gt.eq 3$,
#[#set math.equation(numbering: n => "(7.6)")
 $ epsilon.alt_(*) integral_Omega xi_j^2 w^(2 a) thin d V lt.eq
   integral_Omega
   (h^2 \| nabla xi_j \|^2 + 2 xi_j h chevron.l nabla h \, nabla xi_j chevron.r - 2 xi_j chevron.l Z \, nabla xi_j
   chevron.r) thin d V . $ <cut:three-errors>]

]
] <cut:integrated-comparison>

#proof[
  The interior comparison of Proposition 17 gives
  $ integral_Omega xi_j^2 \( 4 h^2 + \| nabla h \|^2 + epsilon.alt_(*) w^(2 a) \) thin d V lt.eq
    integral_Omega xi_j^2 "div" Z thin d V . $
  Apply the divergence theorem to the smooth field $F_j$. In the suspension one may first truncate the domain
    inside the two neighborhoods where $F_j$ vanishes; the artificial end boundaries have zero flux.
    On the regular side boundary the outward normal is $- N$.
    Thus the boundary comparison of Proposition 19, $N dot.op Z + H h^2 gt.eq 0$, gives
  $ integral_Omega xi_j^2 "div" Z thin d V & = - integral_(partial Omega) xi_j^2 chevron.l N \,
    Z chevron.r thin d sigma - 2 integral_Omega xi_j chevron.l Z \, nabla xi_j chevron.r thin d V\
 & lt.eq integral_(partial Omega) H \( xi_j h \)^2 thin d sigma - 2 integral_Omega xi_j chevron.l Z \,
   nabla xi_j chevron.r thin d V . $
  Corollary 14 applies to $v_j$ and bounds the boundary integral by
  $ integral_Omega #scale(x: 120%, y: 120%)[\(] \| nabla \( xi_j h \) \|^2 +
    4 xi_j^2 h^2 #scale(x: 120%, y: 120%)[\)] thin d V . $
  Expanding the square and canceling the common terms gives (7.6). ◻
]

Every cancellation above is made before removing the angular cutoff.
  For fixed $j$ and radial index $k$, the tests $zeta_k \( r \)
  v_j$ from Corollary 14 have compact support on the regular Euclidean cone.
  First take the variation parameter $epsilon$ to zero on this fixed support; then let $k arrow.r
  oo$ in Equation (3.22) to obtain the constant $4$. The smooth extension collar and the allowed variation size
  may depend on $j$ and $k$. We now take $j arrow.r oo$ only in Equation (7.6),
  which contains the positive mass and three cutoff errors.
  The energy and boundary terms have already canceled for each fixed $j$.

=== 7.3 Vanishing of all three errors <vanishing-of-all-three-errors>

On $Omega_(o \, +)$, differentiation of $alpha_j$ and $\| nabla w_o \| lt.eq \| B_o \|$ give

#[#set math.equation(numbering: n => "(7.7)")
 $ \| nabla_o alpha_j \| lt.eq kappa frac(\| B_o \|, w_o) . $ <cut:original-cutoff-gradient>]

To see the constant, wherever $theta.alt' \( j w_o \) eq.not 0$ one has $1 < j w_o < 2$, so $j lt.eq 2 \/ w_o$;
  outside this transition region the derivative is zero. The same argument gives

#[#set math.equation(numbering: n => "(7.8)")
 $ \| beta'_j \( t \) \| lt.eq frac(kappa, sin t) . $ <cut:tip-cutoff-gradient>]

At every fixed point of $Omega_(o \, +)$, $alpha_j = 1$ and $nabla_o alpha_j = 0$ for all sufficiently large $j$.
  At every fixed $t in \( 0 \, pi \)$ the corresponding statements hold for $beta_j$.

Write $b_o = \| B_o \| \/ w_o$ on $Omega_(o \, +)$. Let $E_(1 \, j)$, $E_(2 \, j)$, and $E_(3 \, j)$ denote,
  in order, the three signed integrands on the right of (7.6).

First suppose $m_o = 5$, so $Omega = Omega_o$, and set $K_n = 1 + M_o$. Since $X = B_o \/ w_o$,

$ 1 + w + \| X \| lt.eq K_n \( 1 + b_o \) \, wide \| nabla xi_j \| lt.eq kappa \( 1 + b_o \) . $

Equations (7.5) and the preceding bounds give

#[#set math.equation(numbering: n => "(7.9)")
 $ \| E_(1 \, j) \| + \| E_(2 \, j) \| + \| E_(3 \, j) \| lt.eq
   C_F^2 \( kappa^2 + 4 K_n kappa \) D_o . $ <cut:nonsuspended-domination>]

Indeed the three coefficient bounds are respectively $C_F^2 kappa^2$, $2 C_F^2 K_n kappa$, and $2 C_F K_n kappa$,
  and $C_F gt.eq 1$. The dominator is integrable by Lemma 25.
  Each error is eventually zero at every point of $Omega_(o \, +)$, and is defined to be zero on $cal(Z)_o$.
  Dominated convergence therefore makes the right side of (7.6) tend to zero.

Now suppose $m_o = 4$. Write $s_t = sin t$ and use the suspension coordinates $\( t \, y \) in \( 0 \, pi \) times
  Omega_o$. The exact formulas in Proposition 12 give

#[#set math.equation(numbering: n => "(7.10)")
 $ w \( t \, y \) = frac(w_o \( y \), s_t) \, wide \| B \( t \, y \) \|^2 =
   frac(\| B_o \( y \) \|^2 + 3 cos^2 \( t \) w_o \( y \)^2, s_t^4) \, wide d V =
   s_t^4 thin d t thin d V_o . $ <cut:suspension-scaling>]

In particular $Omega_(+) = \( 0 \, pi \) times Omega_(o \, +)$, and there

$ \| X \| = sqrt(b_o^2 + 3 cos^2 t) / s_t lt.eq sqrt(3) / s_t \( 1 + b_o \) . $

The warped metric gives the exact cutoff identity

$ \| nabla xi_j \|^2 = alpha_j^2 \| beta'_j \|^2 + s_t^(- 2) beta_j^2 \| nabla_o alpha_j \|^2 \, $

so (7.7)–(7.8) imply

#[#set math.equation(numbering: n => "(7.11)")
 $ \| nabla xi_j \| lt.eq kappa / s_t \( 1 + b_o \) \, wide 1 + w + \| X \| lt.eq K_s / s_t \( 1 + b_o \) \, wide
   K_s = 1 + M_o + sqrt(3) . $ <cut:suspended-gradient-bounds>]

Multiplying the bounds for the three errors by the volume factor in (7.10) now gives

#[#set math.equation(numbering: n => "(7.12)")
 $ s_t^4 #scale(x: 120%, y: 120%)[\(] \| E_(1 \, j) \| + \| E_(2 \, j) \| + \| E_(3 \, j) \|
   #scale(x: 120%, y: 120%)[\)] lt.eq C_F^2 \( kappa^2 + 4 K_s kappa \) s_t^(2 - 2 a) D_o \( y \) .
   $ <cut:suspended-domination>]

This inequality is initially read on $Omega_(o \, +)$, and both sides are assigned zero on $cal(Z)_o$.
  Its constant depends only on the fixed certificate, $a$, $theta.alt$, and $M_o$, and is independent of $j$, $t$,
  and $y$. It also shows explicitly why the original weighted $\| B_o \|^2$ estimate suffices: by (7.2),

$ s_t^(2 - 2 a) D_o \( y \) lt.eq 2 s_t^(21 \/ 25) #scale(x: 120%, y: 120%)[\(] w_o^(29 \/ 25) +
  w_o^(- 21 \/ 25) \| B_o \|^2 #scale(x: 120%, y: 120%)[\)] quad upright("on ") Omega_(o \, +) . $

The right side is integrable with respect to $d t thin d V_o$, because $21 \/ 25 > - 1$ and (7.1) holds.
  Every error is eventually zero at each fixed $\( t \, y \) in \( 0 \, pi \) times Omega_(o \, +)$.
  Dominated convergence applied to (7.12) therefore makes the right side of (7.6) tend to zero also in the suspension.

#thm([Theorem 7.3.])[
  #emph[The first dimension admitting a nonflat one-homogeneous global minimizer cannot be $5$ or $6$.]
] <cut:exclusion>

#proof[
  If the first dimension were $5$ or $6$, the reductions would provide exactly one of the two working domains just
    considered. In either case, the right side of (7.6) tends to zero. On the original component, however,
  $ 0 < I_o := integral_(Omega_o) w_o^(2 a) thin d V_o < oo . $
  Finiteness follows from boundedness and compactness. Positivity follows from $T_o equiv.not 0$ and continuity,
    which give an open subset of $Omega_o$ on which $w_o > 0$. In the nonsuspended case dominated convergence gives
  $ lim_(j arrow.r oo) integral_Omega xi_j^2 w^(2 a) thin d V = I_o . $
  In the suspended case (7.10) gives instead
  $ lim_(j arrow.r oo) integral_Omega xi_j^2 w^(2 a) thin d V = I_o integral_0^pi \( sin t \)^(4 - 2 a) thin d t =
    I_o integral_0^pi \( sin t \)^(71 \/ 25) thin d t > 0 . $
  Here the dominating mass density is the integrable, everywhere defined function $\( sin t \)^(71 \/ 25)
    w_o^(29 \/ 25)$; its value is zero wherever $w_o = 0$. These strictly positive limits contradict (7.6),
    since $epsilon.alt_(*) > 0$. ◻
]

The known lower-dimensional classification gives $d_(*) gt.eq 5$,
  and the dimension-seven globally minimizing example gives $d_(*) lt.eq 7$, as stated in Section 1.
  Theorem 27 excludes the only two remaining possibilities below $7$.
  Hence $d_(*) = 7$, completing the proof of Theorem 1.

== 8 Regularity and sharpness of the dimension bound <sec:consequences>

We now pass from the classification of homogeneous global minimizers to local free boundaries.
  This step uses the dimension-reduction theorem of Weiss [18],
  in the formulation [17] Theorem 1.4 and Proposition 10.13.

#proof[
  Apply the cited dimension-reduction theorem with volume coefficient one on balls compactly contained in $D$.
    Its inputs are uniform flatness regularity, linear nondegeneracy, compactness of blowups,
    and the fact that all blowup limits are homogeneous global minimizers.
    These are the constant-coefficient results used in Proposition 3; flatness regularity is [17] Theorem 8.1.
    The theorem gives an empty singular set below $d_(*)$, local finiteness in dimension $d_(*)$,
    and Hausdorff dimension at most $n - d_(*)$ above it. Theorem 1 sets $d_(*) = 7$.
    Smoothness at each regular point follows from Proposition 3(iii).
    A countable cover by interior balls gives the assertions on $D$.
  For sharpness, let $U$ be the nonflat global minimizer in $bb(R)^7$ of De Silva and Jerison [7] Theorem 1.1,
    and set $U_n \( x \, y \) = U \( x \)$ on $bb(R)^7 times bb(R)^(n - 7)$.
    Repeated application of Proposition 8 shows that $U_n$ is globally minimizing.
    At each point $\( 0 \, y_0 \)$, every rescaling of $U_n$ is $U_n$ itself,
    by homogeneity and translation invariance in $y$. It cannot be flat:
    a half-space normal would have zero $y$-component, forcing $U$ to be flat.
    Thus ${ 0 } times bb(R)^(n - 7) subset "Sing" \( U_n \)$.
    Its dimension is $n - 7$, and the proved upper bound gives equality. ◻
]

== 9 Complete coefficient tables <app:tables>

The following two tables specify the polynomials used in Section 6.1.1 and the comparison forms in Section 6.2.
  Every coefficient printed below is an integer numerator with denominator

$ Q = 250000 . $

Leading zeroes in monomial codes are significant. All rows and all block headers are included.

=== 9.1 Decoding and block conventions <app:decoding>

For nonnegative rank, read a monomial code in consecutive triples.
  Its first triple $h thin b thin j$ contributes $g^h \( "tr" A^3 \)^b w^(\[ j = 1 \]) z^(\[ j = 2 \])$.
  Each subsequent triple $u thin v thin k$ is an unoriented edge carrying $A^k$, with $A^0 = "Id"$.
  Endpoints $0 \, dots.h \, r - 1$ denote the free slots in order, $5$ denotes a copy of $p$,
  and $6$ a copy of $ell$; three occurrences of $7$ are contracted with one $X$,
  and three occurrences of $8$ with a second copy. Multiply all factors and contract all nonfree slots.
  There are no additional multiplicity factors; see Section 6.1.

In Table I the first field specifies the polynomial, the second its monomial,
  and the third its coefficient numerator. The free-slot orders are $U_(j k)$, $K_(l i j k)$, $M_l$, and $P_l$,
  while $f$ has rank zero. The numbers of rows for $\( f \, U \, M \, P \, K \)$ are
  $\( 34 \, 57 \, 74 \, 32 \, 34 \)$, for a total of $231$.

Each line of Table II beginning with #raw("@") starts a separate block and gives its rank, projection label,
  and multiplier mode. For each coefficient column, sum the monomials with the coefficients in that column divided
  by $Q$ to obtain a tensor $J_c$. For nonnegative rank the block contributes $rho sum_c chevron.l J_c \,
  Pi J_c chevron.r$ to $Gamma$, where the modes #raw("I") and #raw("B") mean $rho = 1$ and $rho = chi =
  1 - \| p \|^2 - g^2$, respectively. The labels #raw("none"), #raw("anti"), #raw("sym"),
  and #raw("hook") specify exactly the operators of Section 6.2.1;
  they do not instruct any further normalization of the coefficients.
  Identical headers in different positions still define distinct blocks.

For rank $- 1$, the four code digits instead give the four individual exponents of $x_1 \, x_2 \, x_3 \, x_4$.
  The block contributes to $Lambda$ the average over all $24$ permutations of $rho sum_c J_c^2$.
  Here #raw("I") means $rho = 1$, while #raw("H") means $rho = sum_i x_i = - lambda$.
  The averaging and boundary normalization $R = sum_i x_i^2 + \( sum_i x_i \)^2 = 1$ are those of Section 6.2.
  Table II contains $21$ blocks: $19$ interior blocks with $529$ rows and two boundary blocks with $14$ rows each,
  hence $557$ coefficient rows in total. Each block retains its own number of coefficient columns.

=== 9.2 Table I: the multiplier coefficients <app:table-I>

The columns below read from top to bottom, first on the left and then on the right.

2

#raw(block: true, lang: "", "f 000 172575762\nf 200 -265322011\nf 400 301491831\nf 600 -44526835\nf 800 14565793\nf 000550 -54772531\nf 200550 219932290\nf 400550 52506144\nf 600550 9630205\nf 000550550 137906751\nf 200550550 106469818\nf 000550550550 -131450161\nf 200550550550 46298458\nf 000550550550550 19137894\nf 000551 119093719\nf 200551 -79672895\nf 400551 -9715716\nf 000550551 -60378744\nf 200550551 14546676\nf 400550551 -57731025\nf 000550550551 156426055\nf 200550550551 -335208469\nf 000550550550551 -114479609\nf 000552 36551855\nf 200552 -61391750\nf 400552 -54261369\nf 000550552 47470176\nf 000551551 38322040\nf 200550552 -123645111\nf 200551551 21745017\nf 000550550552 -27358875\nf 000550551551 -10633583\nf 000551552 -63061863\nf 200551552 -7335033\nU 000500510 209038273\nU 200500510 -16767570\nU 400500510 -283063959\nU 600500510 -30248846\nU 000550500510 -136083135\nU 200550500510 -427782476\nU 400550500510 -31623665\nU 000550550500510 10893857\nU 200550550500510 546331605\nU 000550550550500510 427088076\nU 000011 170760340\nU 200011 -1206356\nU 400011 121148296\nU 600011 41094485\nU 000550011 159740708\nU 000500511 -12972332\nU 200550011 -371328968\nU 200500511 158604412\nU 400550011 323446445\nU 400500511 -150167309\nU 600550011 -71599174\nU 000550550011 -98427304\nU 000550500511 -66406904\nU 000551500510 161528440\nU 200550550011 360663252\nU 200550500511 -17938869\nU 200551500510 84273648\nU 400550550011 -202347674\nU 400550500511 -24865978\nU 400551500510 20187308\nU 000550550550011 -95478557\nU 000550550500511 243609372\nU 000550551500510 -260094552\nU 200550550550011 -175753712\nU 200550550500511 -115703729\nU 200550551500510 -18269297\nU 000550550550550011 52505668\nU 000550550550500511 -136286395\nU 000550550551500510 124924734\nU 000551011 -34002037\nU 200551011 -87426923\nU 400551011 -16110396\nU 000550551011 -51017991\nU 000551500511 182661478\nU 000552500510 -212756173\nU 200550551011 98857514\nU 200551500511 -82275068\nU 200552500510 -68411390\nU 000550550551011 -365742\nU 000550551500511 121156685\nU 000550552500510 65143542\nU 000551551500510 -118149741\nU 000551551011 20474336\nU 000552500511 13163650\nU 200551551011 19565853\nU 200552500511 -13163652\nU 000550552500511 -13163652\nM 000500 119808440\nM 200500 -78615281\nM 400500 58172228\nM 600500 117063991\nM 000550500 -8257673\nM 200550500 -246670620\nM 400550500 546437417\nM 000550550500 -304458502\nM 200550550500 147099465\nM 000550550550500 -259741510\nM 000501 13135177\nM 200501 230900882\nM 400501 503642015\nM 600501 113276750\nM 000550501 284895091\nM 000551500 -41618173\nM 200550501 895262372\nM 200551500 -64307015\nM 400550501 -501973998\nM 400551500 203881659\nM 000550550501 -251554675\nM 000550551500 -68782868\nM 200550550501 -641088126\nM 200550551500 179691016\nM 000550550550501 139784474\nM 000550550551500 -40969083\nM 000502 -24304787\nM 200502 -622936552\nM 400502 268923235\nM 600502 168388434\nM 000550502 -108635150\nM 000551501 318683040\nM 000552500 33990338\nM 200550502 361921940\nM 200551501 153090065\nM 200552500 -747048669\nM 400550502 558178192\nM 400551501 -1665598002\nM 400552500 1296406233\nM 000550550502 411493367\nM 000550551501 -121808407\nM 000550552500 11773023\nM 000551551500 67252403\nM 200550550502 -446325581\nM 200550551501 79505560\nM 200550552500 125885807\nM 200551551500 -19251826\nM 000550550550502 -408356086\nM 000550550551501 2958960216\nM 000550550552500 -2765855048\nM 000550551551500 -39050858\nM 000503 31451284\nM 010500 -111968845\nM 200503 461057708\nM 210500 221824980\nM 400503 -412407021\nM 410500 -101679590\nM 000550503 121978129\nM 000551502 -465236572\nM 000552501 -85409256\nM 000553500 501586157\nM 010550500 189809541\nM 200550503 -457984830\nM 200551502 -131436746\nM 200552501 1156439419\nM 200553500 -438673045\nM 210550500 -199478216\nM 000550550503 -37100467\nM 000550551502 376993983\nM 000550552501 216559416\nM 000550553500 -236527028\nM 000551551501 118549720\nM 000551552500 -289837183\nM 010550550500 -92636597\nP 100500 311718636\nP 300500 -206555629\nP 500500 -10345809\nP 700500 69636002\nP 100550500 -335187565\nP 300550500 141480631\nP 100550550500 -48726916\nP 300550550500 -59898908\nP 100550550550500 -130179927\nP 700501 664922213\nP 100551500 37613817\nP 500550501 2068537473\nP 100550551500 -80492409\nP 300550550501 -3956993330\nP 300550551500 2941040012\nP 100550550550501 -4535791726\nP 100550550551500 2719912082\nP 100552500 59422497\nP 300552500 -112216670\nP 100550552500 160359392\nP 100551551500 -210782200\nP 100551502 -955698012\nP 100552501 289629865\nP 100553500 289477038\nP 300551502 290419431\nP 300552501 -244526547\nP 300553500 -89919120\nP 100550551502 372091130\nP 100550552501 -196017256\nP 100550553500 -130830861\nP 100551551501 223993677\nP 100551552500 -287868455\nK 000500520131 -395492688\nK 200500520131 557130979\nK 400500520131 -208630461\nK 000550500520131 265035499\nK 000500511520530 177271543\nK 200550500520131 -288587200\nK 200500511520530 -18030270\nK 000550550500520131 -29990138\nK 000550500511520530 -153812921\nK 000500511231 142329663\nK 200500511231 -265174093\nK 400500511231 209730769\nK 000550500511231 -47161546\nK 000551500520131 126782841\nK 000500512520530 -310431451\nK 200550500511231 134860957\nK 200551500520131 -72013133\nK 200500512520530 90786861\nK 000550550500511231 -155714998\nK 000550551500520131 4534988\nK 000550500512520530 171186722\nK 000551500511520530 -64357492\nK 000500512231 380733573\nK 200500512231 -425302994\nK 400500512231 164988206\nK 000550500512231 -325733710\nK 000551500511231 -84676007\nK 000552500520131 6581825\nK 200550500512231 449829666\nK 200551500511231 7194909\nK 200552500520131 -6581826\nK 000550550500512231 153898314\nK 000550551500511231 46595618\nK 000550552500520131 -6581826")

=== 9.3 Table II: the comparison coefficients <app:table-II>

The block headers are part of the data.

#raw(block: true, lang: "", "@ 0 none I\n001 12")

#raw(block: true, lang: "", "@ 0 none I\n002 184")

#raw(block: true, lang: "", "@ 1 none I\n000771700 -638806\n000750750701 -983284\n000750751700 1320922\n000750750750501 805293\n000750750701550 1754296\n000600 503057\n000600551 -1946630\n000600550551 1923242\n000651501 -2068563\n000601551 -1021342\n001502 -3593596\n001550502 4994642")

#raw(block: true, lang: "", "@ 1 none B\n000602 1754266\n000601551 -1522955\n000602550 -2522248")

#raw(block: true, lang: "", "@ 2 sym I\n000750700710 1391786 1177679\n200750700710 -635584 -1188129\n000750750700510 -669474 -759226\n200771700510 145856 439798\n000771750500510 -365548 1663410\n000771700550510 333085 -1276634\n000750750750011 898927 557074\n000750750700511 -311872 -891024\n000750750701510 -41287 -1733462\n000750751700510 -93961 1393977\n000750700710551 113136 227458\n000771750011 57792 -1227345\n000771700511 -2146827 33344\n000771701510 -214285 799004\n200771750011 1112073 309389\n200771700511 1556631 843960\n200771701510 -294789 -594312\n000771750550011 -13597 795429\n000771750500511 -329731 1039673\n000771751500510 -836011 1028480\n000771700550511 216212 -603835\n000771700551510 1434254 -827393\n000771701550510 656139 -279125\n000600510 -388425 -131346\n000600550510 -477571 -239908\n000650011 1059131 288654\n000601510 252356 -522796\n200650011 -1055033 202800\n200601510 422375 425949\n000650550011 -1586221 -893296\n000650500511 393362 557037\n000651500510 573436 -1067580\n000600550511 -290759 380780\n000600551510 -876849 -172942\n000651011 16748 -630547\n000601511 18986 878826\n000602510 -32503 767092\n200651011 -572999 -197116\n200602510 -62643 182099\n000651500511 -99714 99762\n000652500510 1165974 -802821\n000601551510 -1273792 -46716\n000602550510 151518 380083\n001500510 -818099 -26218\n201500510 551865 2425759\n201011 807336 716540\n401011 -1809265 -594\n001550011 1952714 -432372\n001500511 -970041 4080275\n201550011 -3494733 -1591876\n201500511 -2942057 1178858\n001550550011 -2197984 152320\n001550500511 -1126597 -3610821\n001551500510 1302795 2046516\n201012 453912 -635196\n001550012 802719 479394\n001500512 1149385 1541894\n001501511 -570358 863506\n102550011 2753121 -35533\n102551011 -7449352 0\n102500512 712433 -1155568\n102501511 -648523 1532248")

#raw(block: true, lang: "", "@ 2 anti I\n000750750700510 -971778 -593070 595799\n000750750700511 1851218 390321 -1032828\n000750751700510 -2221492 -384831 773149\n000771700511 1671121 1696523 -468940\n000771701510 1285532 -64095 -352045\n200771700511 362947 -2582045 -2929678\n200771701510 -181856 1690707 -1313034\n000771750500511 977807 -1459534 1360532\n000771700550511 -1653489 -1171267 -3601252\n000771700551510 1692989 13676 305417\n000600511 912880 512840 1024400\n000600550511 1022451 2751390 2442625\n000601511 2261978 -1322826 -210765\n000602510 2192414 -515944 -180511\n000651500511 2409290 -1068889 -1803516\n000601550511 -1177522 2817530 -34700\n000601551510 1957710 -3140417 -720539\n000602550510 -261398 1630593 -956020\n001500512 -130602 5301163 0\n102500512 -5486646 0 0")

#raw(block: true, lang: "", "@ 2 sym I\n100750700710 386912 590109 2476735 909989\n300750700710 -324620 -1836020 1070522 -709211\n100750750700510 207036 867875 -1315712 -1562386\n100750700710550 -2292260 -2320517 -877238 -137767\n100771700510 679665 129424 -1701690 711883\n300771700510 -691965 -2367998 -600979 1614358\n100771700550510 71429 -500416 812821 -488846\n100750750750011 425332 -329290 685878 -37805\n100750750700511 1670160 798393 1099878 1675685\n100750750701510 618399 661946 -1024107 -525490\n100750751700510 82393 -436965 -872804 890466\n100750700710551 -1425953 113042 -858760 -800516\n100771750011 625914 918398 -1118557 -279579\n100771700511 631990 1190528 -803355 693822\n100600510 747288 856865 765295 19368\n300600510 -196289 641398 -318973 -1435522\n100600550510 -2242557 1145358 1750835 25513\n300600511 -350390 -359430 -160354 -354520\n300601510 -998743 -242982 -243886 303678\n100650500511 1317416 -1625911 1342770 527410\n100651500510 620553 -221636 -278822 -584012\n100600550511 -563526 294802 -1407035 -675807\n100601550510 -1165326 -290961 158430 23084\n100651011 -1073379 74678 -692146 131418\n100601511 610649 -693839 -174161 54662\n100602510 1468661 -1066444 257457 -1866082\n101011 891879 -816951 -355999 -242185\n301011 -128043 -1656108 -3338499 0\n101550011 262135 -1773969 -1081346 1502914\n101012 247618 992865 441378 -984847\n301012 273293 -835560 84484 79079\n101550012 -968245 -1440718 -66260 1176036\n101551011 -540581 4211626 0 0\n101500512 571373 -2763887 -288603 -351329\n101501511 -633764 1126754 22804 -757142\n002500510 2095639 323489 -1897011 484510\n002550500510 -2013271 -345687 1721490 -160235\n002011 -22315 614400 440061 106088\n202011 -789708 -1586444 435018 1192156\n402011 176801 1776607 -935958 110464\n002550011 -752649 2387292 158922 -11589\n002500511 965395 122624 -1704548 -1591006\n202550011 713344 -2161421 1573837 -1092257\n202500511 4263736 0 0 0\n002550550011 651775 -2930070 -692641 103706\n002550500511 -241365 -1063259 672383 277457\n002551500510 -1497924 882585 1136032 805365\n002551011 14258 -733558 -562699 359850\n002500512 -1418407 941987 1726713 -1244268\n002501511 598151 -558439 -599397 139693")

#raw(block: true, lang: "", "@ 2 anti I\n300771700510 -4701036 0\n100750750701510 -1924807 -3971273")

#raw(block: true, lang: "", "@ 2 sym B\n000750700710 1123954 88221 -1701307 30701 738750\n200750700710 270992 1585448 -437804 -115089 -193670\n000750750700510 1172241 -871881 1057083 321028 -649097\n000750700710550 -524706 1366647 827758 -1278231 500667\n000771700510 864484 287922 -68675 62361 -539022\n200771700510 775795 2191982 950393 914569 -166597\n000771700550510 277543 -125661 661263 -1877406 74958\n000750750750011 -334486 169170 -871041 -791399 -94389\n000750750700511 -975320 58917 -494669 -25254 -1254928\n000750750701510 -1503410 -485996 1281582 -196803 63872\n000750751700510 -184521 435306 51628 1182804 106124\n000750700710551 852497 -216529 665736 60101 1484575\n000771750011 169826 196263 532547 536554 -474267\n000771700511 -1010968 -842722 1104099 -283384 -997589\n000771701510 652964 -776198 -18629 -4645 767925\n000600510 -785042 -1594270 -1342680 -873445 1197286\n200600510 -1131334 -822268 -1011918 773265 -1414931\n000600550510 -1127966 720812 -94366 3116158 0\n000650011 -912533 515978 700674 -905482 -690654\n000600511 -885433 -542182 377374 1618276 949245\n000601510 -75331 228090 -522865 124191 -472481\n200601510 225414 309487 730722 372893 -484343\n000650550011 632175 386796 -1057545 494534 31994\n000650500511 -135981 -192395 -255297 -1158355 -1164507\n000600550511 -755722 -515530 -883058 -395726 -81284\n000600551510 219256 808172 -566082 901822 1273544\n000651011 825451 -630349 -288434 160119 -296916\n000602510 -202711 542117 386813 746612 -1023986\n001500510 -772925 -854066 -27932 -390900 -243719\n001011 -224989 -518216 209663 226840 265618\n201011 410735 -748292 -1336059 -978726 -1844315\n001550011 777323 1939452 -296868 137265 -763612\n001500511 1785297 -3689052 0 0 0\n001012 504959 -153386 -533263 -398633 -253956\n201012 33011 404249 365930 -462942 -522985\n001550012 -422915 928502 262771 13083 730837\n001551011 474507 -1487386 -270414 650144 346202\n001500512 3326366 -1640992 -12535 829591 -679038\n001501511 -1859882 817429 -223272 -262739 -290165\n102500510 -478971 -135787 -3191296 0 0\n102011 256382 1937630 -477578 -3953 68002\n302011 -893937 -2987523 1695406 937674 871113\n102550011 282559 3032355 303938 -524882 -396049\n102500511 -5673921 0 0 0 0")

#raw(block: true, lang: "", "@ 2 anti B\n000771700510 -470106 -1867823\n200771700510 -1539213 -3753948\n000771700550510 2293133 3344366\n000750750700511 -1181347 3094806\n000750750701510 -1994876 -336384\n000750751700510 -654677 -388774\n000771700511 4870801 -1507979\n000600510 -786617 -2630683\n000600550511 -1157549 1248692\n001500511 7658597 984973\n001500512 9501737 0")

#raw(block: true, lang: "", "@ 2 sym B\n100750700710 -430860 3401943\n100771700510 2216725 -501573\n100771750011 -324461 488844\n100771700511 -460201 -3052123\n100602510 -29622 190280\n101500510 -345767 -2635854\n101011 1458366 -2486198\n301011 1803625 142753\n101550011 3135810 519582\n101500511 4871812 0\n101012 -1600522 2717619\n002500510 2853790 -389130\n002011 -1177206 1455424\n202011 2486645 -2061003\n002500512 226083 1738130")

#raw(block: true, lang: "", "@ 3 sym I\n000700710720 -113771 255769 111215 -454364\n200700710720 -612356 -336756 260567 -434709\n400700710720 187848 12317 315606 237812\n000750700710520 900121 -709342 -2099958 0\n000700710720550 -430894 -181858 563914 -156096\n200750700710520 437857 -822749 -59817 -296875\n200700710720550 707274 -39518 300182 393708\n000750750700510520 -571399 -327143 1016828 -283559\n000750700710550520 217996 733662 -203570 -157699\n000700710720550550 -129019 -36697 138224 524819\n000771700510520 586900 -74005 -121132 -122868\n000750750700121 -462420 -167189 10152 -995469\n000700710720551 324263 -97555 -31078 79005\n200771700510520 -1704404 645318 -797565 -366568\n200750750700121 -653595 -82465 495776 672582\n000771750500510520 99472 9389 758 -75480\n000771700550510520 -982221 -270970 126195 249382\n000750750750500121 -196787 2174 -150592 189900\n000750750700550121 398559 73300 -15538 1100718\n000750750700510521 1017001 85910 -85403 -114698\n000750750701510520 -2470 224111 433730 114651\n000750751700510520 21519 194168 -176031 -444752\n000750700710551520 -1114090 429871 237715 -60368\n000771700121 304609 294448 -331206 192661\n200771700121 -60418 370467 -581683 931857\n000771750500121 -415651 -57300 1135378 -577\n000771700550121 701709 -266536 -544044 -372\n000771700510521 -659682 506640 659123 405954\n000771701510520 265617 -292435 -404728 -100735\n000750750701121 18224 139410 -137979 40692\n000750751700121 -36447 -278820 275957 -81384\n000600510520 -899921 -1075432 -358643 733633\n200600510520 385602 459559 532440 -174373\n000600550510520 1350470 1101595 130507 -650217\n000600121 -112918 -833408 3283 336677\n200600121 -280772 593983 255592 -62606\n400600121 199724 -44666 -281861 7161\n000650500121 574659 520651 586199 499213\n000600550121 -635944 683654 -461102 -386753\n000600510521 151416 109514 1182094 -86343\n000601510520 -335272 216945 -2525 -226735\n200650500121 -358009 323248 71453 -757989\n200600550121 725371 -296915 -476424 82812\n200600510521 376728 14961 -64841 327020\n200601510520 144429 294432 -112571 364619\n000650550500121 -571391 -817993 -883836 -283605\n000650500510521 368142 287873 71877 531508\n000651500510520 245134 -554713 -13119 -134830\n000600550550121 360296 129561 131379 -204106\n000600550510521 220585 -55552 -310575 123432\n000601550510520 81688 178086 -318606 114806\n000601121 -43340 115549 -299646 274416\n200601121 351342 -257317 287701 -80004\n000651500121 -265 -306814 47933 -190062\n000600551121 24164 -60022 9704 -502077\n000601550121 22042 -133331 497455 -284993\n000601510521 54994 -97006 -456467 154307\n000602510520 316820 377069 385482 2722\n001500510520 175400 -610502 262613 498453\n001500121 270953 1089209 -894330 -1087117\n201500121 -2817754 0 0 0\n001550500121 -64359 -995858 1321040 876172\n001500510521 818582 -1242137 -464133 -352\n001500122 -290488 -749992 533305 -216922\n001501121 228018 121871 -1438294 -159411\n201500122 581286 391875 -432476 -82568\n201501121 759430 457624 -1528682 -569408\n001550500122 -194952 787664 -496482 -263483\n001550501121 -100036 -315655 212934 -135339\n001551500121 4781 339166 1701093 191517\n001500510522 438901 -206515 -1697183 -497546\n001500511521 837267 366075 591534 -903944\n102500510520 -2096422 -555979 -1063939 -332549\n102500121 -1196882 -774162 229623 -968007\n302500121 -158570 2534250 0 0\n102550500121 1589062 64468 561859 -547323\n102500510521 1459032 761992 -18106 1397641\n102501121 -92705 -956776 286224 1637465")

#raw(block: true, lang: "", "@ 3 hook I\n000750700710520 -521222 561024 -561794 1052779 -495550\n200750700710520 71379 -1012982 644900 5650 501292\n000750750700510520 402987 -219447 -626761 -216393 402848\n000750700710550520 -8001 -496420 547496 92579 -59265\n000771700510520 -142929 713981 -67315 234399 244214\n000750750700121 758990 -932613 -95069 -624172 652182\n200771700510520 136872 -2833269 0 0 0\n200750750700121 410563 890616 267929 843072 400842\n000771700550510520 -94358 -1111623 117231 -178880 -873801\n000750750750500121 -516610 372353 -315103 142027 -431781\n000750750700550121 -487810 512416 199453 257643 709868\n000750750700510521 -242753 38245 328922 390069 -260854\n000750750700511520 -124564 146735 159175 478474 -401860\n000750750701510520 103877 -149602 214675 -654790 321761\n000750751700510520 -66938 -586167 -705386 -193823 207964\n000750700710551520 -214009 -58852 -175575 503511 293821\n000771700121 -714002 830419 -553629 -218156 -632060\n200771700121 -1695971 -1249692 262718 -163683 295847\n000771750500121 459356 -462844 600575 1873546 -501623\n000771700550121 -894867 258654 93799 -489902 337300\n000771700510521 -177274 -531780 212834 428441 569484\n000771700511520 659247 -665793 446749 -348691 241301\n000771701510520 -512759 -75335 -171988 709731 -5471\n000750750701121 -175171 -106960 49079 -186227 -41325\n000750751700121 350342 213920 -98158 372454 82649\n000600510520 781928 -857622 -775483 1574702 495170\n200600510520 -436371 772702 420563 -1389626 158574\n000600550510520 -188177 1185337 422173 -697494 89039\n000600121 -174456 -452110 1107721 719114 -339614\n200600121 575087 477162 -1219698 -299117 543378\n400600121 -323376 -218129 -102949 -54388 -553854\n000650500121 27383 -107674 -702286 -330723 1709805\n000600550121 1104948 752674 -1314904 -273205 -486768\n000600510521 -191372 453079 1148360 -743039 213125\n000600511520 -945043 86766 288577 -1327960 1483607\n000601510520 88069 -67576 359002 123744 828607\n200650500121 -1072923 443728 -868707 -247959 -719466\n200600550121 -1416409 -1139165 878506 -381550 -1041027\n200600510521 484829 -407429 -1279351 344883 396416\n200600511520 273822 -83689 -23771 541818 -93062\n200601510520 1269710 -595989 -725521 -508102 -968063\n000650550500121 -912102 -107501 354623 302791 -389373\n000650500510521 146766 -71825 -397270 479290 -588396\n000600550550121 35085 -683028 148446 -371512 68128\n000600550510521 -42888 349274 -901813 393417 522038\n000600550511520 136766 215868 -410901 655309 -328001\n000600551510520 381546 -306483 -220658 713294 -376417\n000601550510520 122129 380094 -201606 29113 -229702\n000601121 -297793 -200797 -357156 151714 83189\n200601121 379667 -316478 1894 27814 -100117\n000651500121 274768 1623518 1095549 -298694 769624\n000600551121 -61936 151106 -600337 -565738 -905939\n000601550121 -382039 -589283 -353162 774352 132457\n000601510521 583607 -307759 150598 -143259 -344160\n000601511520 643712 730410 859370 -337692 -182581\n000602510520 -75121 339094 691943 -1345435 197464\n001500121 -1494181 503416 908836 279260 -884597\n201500121 1193310 -1354927 -782187 -94653 -1775124\n001550500121 888287 156494 -1067876 85686 -251732\n001500510521 -220586 817779 837882 -345286 225358\n001500122 536790 -391686 -101844 -512835 579492\n001501121 -331317 -847838 404838 -187537 756081\n201500122 109188 -545375 679601 -31854 -746597\n201501121 -2043083 -257885 -1617158 -1356106 946843\n001550500122 -145862 317672 46224 -302265 366894\n001550501121 -355398 1797394 -848219 95142 -1825951\n001500510522 451367 -459915 1561510 171732 -1052563\n001500511521 1010744 1710544 667697 2008851 0\n102500121 -2029395 1305940 -1413287 -46785 -1170911\n302500121 67942 284188 2810795 0 0\n102550500121 -3797108 0 0 0 0\n102500510521 407122 508125 -1070203 -734001 129444\n102501121 764808 -802563 -1980310 422533 -196982")

#raw(block: true, lang: "", "@ 3 sym I\n100700710720 763442 201492 207522\n300700710720 95273 -398706 -285657\n100750700710520 -178597 -610639 -380231\n100700710720550 87253 171084 29880\n100750750700121 677852 -480761 -297581\n100700710720551 -131663 307969 -65446\n100771700121 -722948 498495 -744992\n300771700121 -20413 -264875 24427\n100771750500121 -856424 52791 -576220\n100771700550121 -311085 -77567 662311\n100771700510521 -290923 -342609 163397\n100771701510520 967581 380184 518451\n100600121 -62632 -367368 -337983\n300600121 -232214 131223 1210412\n100650500121 535397 253023 618813\n100600550121 -114157 -986522 366025\n100601510520 -222496 -945885 -791072\n100601121 487623 -284646 47079\n100651500121 320106 -419828 145656\n100600551121 -250772 7204 60159\n100601550121 -521317 216628 121550\n100601510521 70667 785595 -223676\n100602510520 -288917 -47520 -555205\n101500121 1657716 1252785 -819550\n301500121 -1268874 -1299493 359066\n101550500121 -1560884 -844675 481939\n101500510521 -948453 -2295369 0\n101501121 -1137151 373989 -1131226\n202500121 2601109 0 0\n002501121 1111694 -645730 556437\n202501121 -793881 1173902 348366\n002550501121 -1007658 503344 -581407")

#raw(block: true, lang: "", "@ 3 hook I\n100750700710520 825602 -647783 -380956 627925\n100750750700121 -609729 889144 939275 -551336\n100771700121 553682 -757497 47709 76332\n300771700121 52101 1440744 -29071 462803\n100771700550121 338103 740201 -1034686 632136\n100771700510521 -868620 -616124 659662 261166\n100771700511520 -1302505 642931 386513 -173661\n100600121 407862 -1621952 12844 -258039\n300600121 -312260 698088 1526313 39006\n100650500121 -1642917 -1068956 -856878 621314\n100600550121 846350 185586 1899285 0\n100600510521 -452723 -233514 -353926 -552612\n100600511520 -735715 -139231 -122756 -1159566\n100601510520 -891337 -1099752 314149 874177\n100601121 -263510 -128947 -308339 -577662\n100600551121 30015 -282112 -262490 -46840\n100601550121 -363384 -588474 -188664 -768767\n100601511520 -104651 121394 -405086 518512\n100602510520 270194 -545783 524591 488199\n101550500121 2823724 701590 -1140106 119387\n101500122 -2379602 158372 532980 -216690\n101501121 3974290 0 0 0\n002500121 2422490 -2159158 0 0\n202500121 -1136051 1092498 316605 375255\n002550500121 -2217477 2065768 28247 56618\n002501121 1268851 -686257 -535256 -751379\n202501121 745085 1046811 125241 528487\n002550501121 995369 1322195 391113 529705\n002551500121 -2047579 -591242 193597 116743\n002500510522 -323862 385594 269999 -545727\n002500511521 1649181 -126174 -960119 202680")

#raw(block: true, lang: "", "@ 3 sym B\n000700710720 846861 -24321\n200700710720 -587033 -427093\n000750700710520 -1965133 -378988\n000700710720550 825913 52688\n000750750700121 553913 -164685\n000771700121 -881954 151526\n200771700121 -146368 443742\n000771750500121 196867 256600\n000771700550121 -174415 371933\n000771700510521 918983 174066\n000771701510520 103141 -271115\n000750750701121 30207 -350636\n000750751700121 -60414 701272\n000600121 -134478 -616847\n200600121 310759 1224961\n000600550121 -456564 -388139\n000600510521 -546360 388670\n000601510520 150147 32880\n000651500121 423955 -143460\n000601510521 -575200 -49553\n001500121 852643 -356042\n201500121 137609 930402\n001550500121 -170265 1104176\n001500510521 -1212241 -484563\n001500122 1303787 -240027\n102500121 470182 -1041354\n102501121 -2194212 0")

#raw(block: true, lang: "", "@ 3 hook B\n000750700710520 176217 -621830 -368016 -355219\n000750750700121 669944 32834 222054 469807\n000750700710521 -120742 -15513 373406 -3228\n000771700121 -478208 110067 -148363 195976\n200771700121 -172500 -1260542 -116598 -977491\n000771750500121 1150872 -528405 947239 -36745\n000771700550121 -696098 -439222 -238840 519754\n000771700510521 220554 -62361 1356486 -44941\n000771700511520 519253 461994 1434358 -90787\n000771701510520 158972 -272179 555240 782647\n000750750701121 62126 429282 35836 -241432\n000750751700121 -124251 -858565 -71672 482863\n000600121 -466987 816933 -112888 482852\n200600121 245653 -1911953 0 0\n000650500121 502203 -461250 -572970 -1626003\n000600550121 114763 177125 41031 -397565\n000601121 -462310 137283 -146876 -357410\n000651500121 557962 98581 -449567 -270660\n000601550121 483182 198409 168823 502176\n000601511520 236903 38024 -575403 43162\n000602510520 -819836 -51597 -494829 -376153\n001500121 -537725 648487 -1190924 372381\n201500121 -158924 -560572 1216153 157041\n001550500121 -776297 -447725 1755130 0\n001500510521 514745 293834 1370684 -929697\n001500122 271133 251595 709127 184032\n001501121 756147 333820 -1452866 -93607\n102500121 -3095117 0 0 0\n102501121 -2016691 -876281 -216593 -1560114")

#raw(block: true, lang: "", "@ 3 sym B\n100700710720 489692 598090\n300700710720 -395941 -186631\n100750700710520 156230 -1702877\n100700710720550 -1161498 117080\n100771700510520 399918 670413\n100750750700121 296147 758447\n100771700121 -612228 -210536\n100600510520 19208 -830671\n100600121 578884 306756\n100600510521 -378724 -222954\n100601121 -379693 84297\n101500121 2749187 0\n101500122 -30164 -776315\n101501121 -1310240 -1277716\n002500510520 741853 689530\n002500121 -840735 1782441\n202500121 1035886 -672361\n002550500121 -1490277 -1501412\n002500510521 859145 -683392\n002501121 -259132 1352466")

#raw(block: true, lang: "", "@ 3 hook B\n100750700710520 -130387 1549320\n100771700510520 -325730 2482101\n100750750700121 509197 -841014\n100771700121 -1556447 1491379\n100600121 90411 -1200728\n300600121 348733 328763\n100600550121 497934 1094517\n100600510521 -324819 -165030\n100600511520 808473 -127941\n100601510520 671603 976248\n101500121 1417347 -444112\n101500122 1223107 1177793\n101501121 -2891915 -774938\n002500121 -3515717 0\n202500121 2603006 -45060\n002550500121 1454140 -2066553\n002500510521 -221322 -2086794\n002501121 -1023409 -1933433")

#raw(block: true, lang: "", "@ -1 none I\n1000 -7510150 892635 2182767 23202 -4016\n0100 -5873297 -966404 1065127 891160 -4153\n0010 -7594462 3164488 32982 23257 -4265\n0001 -6664095 -676125 -2074840 -90371 -141368\n2000 10527925 -1288669 -3350633 0 0\n1100 13562510 -782596 -3072444 -1185008 -525859\n1010 14954300 -3513649 -2045232 175643 711822\n1001 16001742 0 0 0 0\n0200 7976754 1609001 -1608780 -1353027 0\n0110 15395603 -1696042 -847566 -840285 -117247\n0101 12758609 1366427 714605 -471973 827299\n0020 10659228 -4829347 0 0 0\n0011 14311972 -2973496 1455043 -343953 -411843\n0002 9209493 1156789 3285152 176907 213479")

#raw(block: true, lang: "", "@ -1 none H\n1000 2926888 -771909 -672812 -28439 -32476\n0100 2472139 -1224863 -681989 -18744 51971\n0010 2504046 -1123530 -477116 133871 -30159\n0001 2879832 -887584 -486032 142684 52873\n2000 -3960308 1436663 856832 -73562 -8956\n1100 -5950295 2321626 989491 -2064346 0\n1010 -6842585 3562264 2077026 553336 -610276\n1001 -4035267 4405894 0 0 0\n0200 -3909355 1486027 856034 -75355 -19599\n0110 -9334809 0 0 0 0\n0101 -7349996 2169698 1941569 669597 456042\n0020 -3913415 1476575 835966 -92637 -12106\n0011 -6055392 2242925 3499526 0 0\n0002 -3956252 1450146 834863 -93150 -20809")

=== 9.4 Reproduction of the finite arithmetic <app:reproduction>

In the complete source directory accompanying this article, run #raw("make -C build check");
  dependencies and the preserved calculation records are in #raw("verification/checks/README.md").
  The entry point enables assertions, fixes $a = 29 \/ 50$, and checks source pins, literal table transcription,
  and fresh exact outputs from two interior expansions and the boundary, projection, and graph calculations.
  The interior implementations agree on every key, signed coefficient, magnitude assignment, rounded bound,
  and aggregate. The retained provenance records describe the second implementation as separately authored from
  the mathematical specification and frozen before comparison with the first engine’s output.
  That specification already contained the claimed aggregate totals.
  These checks verify finite arithmetic; correspondence between formulas and code, and the analytic argument,
  require mathematical review.

#heading(level: 1)[References]
#bibitem([1])[H.~W. Alt and L.~A. Caffarelli, #emph[Existence and regularity for a minimum problem with free
  boundary], J. Reine Angew. Math. #strong[325] (1981), 105--144.
  #link("https://doi.org/10.1515/crll.1981.325.105")[doi:10.1515/crll.1981.325.105].]
#bibitem([2])[L.~A. Caffarelli, #emph[A Harnack inequality approach to the regularity of free boundaries. Part I:
  Lipschitz free boundaries are $C^(1 \, alpha)$], Rev. Mat. Iberoam. #strong[3] (1987), no.~2, 139--162.
  #link("https://doi.org/10.4171/RMI/47")[doi:10.4171/RMI/47].]
#bibitem([3])[L.~A. Caffarelli, D.~Jerison, and C.~E. Kenig,
  #emph[Global energy minimizers for free boundary problems and full regularity in three dimensions],
  in #emph[Noncompact Problems at the Intersection of Geometry, Analysis, and Topology], Contemp.
  Math., vol.~350, Amer. Math. Soc., Providence, RI, 2004, 83--97.
  #link("https://doi.org/10.1090/conm/350/06339")[doi:10.1090/conm/350/06339].]
#bibitem([4])[D.~De Silva, #emph[Free boundary regularity for a problem with right hand side],
  Interfaces Free Bound. #strong[13] (2011), no.~2, 223--238.
  #link("https://doi.org/10.4171/IFB/255")[doi:10.4171/IFB/255].]
#bibitem([5])[D.~De Silva, F.~Ferrari, and S.~Salsa, #emph[Two-phase problems with distributed sources:
  regularity of the free boundary], Anal. PDE #strong[7] (2014), no.~2, 267--310.
  #link("https://doi.org/10.2140/apde.2014.7.267")[doi:10.2140/apde.2014.7.267].]
#bibitem([6])[D.~De Silva, F.~Ferrari, and S.~Salsa, #emph[Regularity of higher order in two-phase free boundary
  problems], Trans. Amer. Math. Soc. #strong[371] (2019), no.~5, 3691--3720.
  #link("https://doi.org/10.1090/tran/7550")[doi:10.1090/tran/7550]. Author manuscript:
  #link("https://arxiv.org/abs/1701.07868v2")[arXiv:1701.07868v2].]
#bibitem([7])[D.~De Silva and D.~Jerison, #emph[A singular energy minimizing free boundary], J. Reine Angew. Math.
  #strong[635] (2009), 1--21. #link("https://doi.org/10.1515/CRELLE.2009.074")[doi:10.1515/CRELLE.2009.074].]
#bibitem([8])[X.~Fernández-Real and J.~Serra, #emph[The stability conjecture for the Bernoulli problem in
  dimension four], preprint (2026), #link("https://arxiv.org/abs/2609.05669v1")[arXiv:2609.05669v1].]
#bibitem([9])[X.~Fernández-Real and H.~Yu, #emph[Linearized equation and generic regularity in the Alt-Caffarelli
  problem], preprint (2025), #link("https://arxiv.org/abs/2510.18330v1")[arXiv:2510.18330v1].]
#bibitem([10])[B.~Firester, R.~Tsiamis, and Y.~Wang, #emph[Stability inequalities for one-phase cones],
  preprint (2026), #link("https://arxiv.org/abs/2601.16966v1")[arXiv:2601.16966v1].]
#bibitem([11])[B.~Firester, R.~Tsiamis, and Y.~Wang, #emph[Area-minimizing capillary cones], preprint (2026),
  #link("https://arxiv.org/abs/2601.18794v1")[arXiv:2601.18794v1].]
#bibitem([12])[J.~K. Hunter, #emph[Notes on Partial Differential Equations], University of California, Davis,
  revised June 18, 2014. #link("https://www.math.ucdavis.edu/~hunter/pdes/pde_notes.pdf")[Author's lecture notes].]
#bibitem([13])[D.~Jerison and O.~Savin, #emph[Some remarks on stability of cones for the one-phase free boundary
  problem], Geom. Funct. Anal. #strong[25] (2015), no.~4, 1240--1257.
  #link("https://doi.org/10.1007/s00039-015-0335-6")[doi:10.1007/s00039-015-0335-6]. Author manuscript:
  #link("https://arxiv.org/abs/1410.7463v1")[arXiv:1410.7463v1].]
#bibitem([14])[D.~Kinderlehrer and L.~Nirenberg, #emph[Regularity in free boundary problems], Ann. Scuola Norm.
  Sup. Pisa Cl. Sci. (4) #strong[4] (1977), no.~2, 373--391.
  #link("https://www.numdam.org/item/ASNSP_1977_4_4_2_373_0/")[Numdam archive].]
#bibitem([15])[P.~A. Parrilo, #emph[Semidefinite programming relaxations for semialgebraic problems], Math.
  Program., Ser.~B #strong[96] (2003), 293--320.
  #link("https://doi.org/10.1007/s10107-003-0387-5")[doi:10.1007/s10107-003-0387-5].]
#bibitem([16])[J.~Simons, #emph[Minimal varieties in Riemannian manifolds], Ann. of Math.
  (2) #strong[88] (1968), no.~1, 62--105. #link("https://doi.org/10.2307/1970556")[doi:10.2307/1970556].]
#bibitem([17])[B.~Velichkov, #emph[Regularity of the One-phase Free Boundaries],
  Lecture Notes of the Unione Matematica Italiana, vol.~28, Springer, Cham, 2023.
  #link("https://doi.org/10.1007/978-3-031-13238-4")[doi:10.1007/978-3-031-13238-4].]
#bibitem([18])[G.~S. Weiss, #emph[Partial regularity for a minimum problem with free boundary], J. Geom. Anal.
  #strong[9] (1999), no.~2, 317--326. #link("https://doi.org/10.1007/BF02921941")[doi:10.1007/BF02921941].]
