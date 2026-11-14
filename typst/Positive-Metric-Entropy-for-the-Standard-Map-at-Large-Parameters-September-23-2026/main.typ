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

#align(center)[#text(size: 16pt, weight: "bold")[Positive Metric Entropy for the Standard Map \
at Large Parameters]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $m$ be normalized Lebesgue area on $bb(T)^2 = bb(R)^2 \/ bb(Z)^2$.
  The standard sine map is the area-preserving diffeomorphism

#[#set math.equation(numbering: n => "(1.1)")
 $ f_k \( x \, y \) = #scale(x: 120%, y: 120%)[\(] x + y + k sin \( 2 pi x \) \, thick y +
   k sin \( 2 pi x \) #scale(x: 120%, y: 120%)[\)] med \( mod med bb(Z)^2 \) \, wide k in bb(R) . $ <main:map>]

We consider its Kolmogorov–Sinai entropy $h_m \( f_k \)$ for this fixed invariant measure.
  The distinction between topological complexity and chaos visible to area is essential:
  a hyperbolic set may have zero area, and even full Hausdorff dimension does not imply positive area.

#thm([Theorem 1.1.])[
  #emph[There exists $k_0 > 0$ such that
$ h_m \( f_k \) > 0 wide upright("for every ") k gt.eq k_0 . $

 Equivalently, for every such $k$ the largest Lyapunov exponent of $f_k$ is positive on a set of positive $m$-measure.]
] <main:entropy>

In particular the parameter set with positive metric entropy contains an interval of positive length.
  Thus 1 resolves affirmatively Sinai’s positive metric entropy conjecture in the formulation of Berger and Turaev
  [2] Conjecture 0.4, and gives the stronger all-sufficiently-large-parameter conclusion.
  This large-parameter formulation is also recorded by Obata [14].
  Berger and Turaev’s recurrence $\( x \, y \) mapsto \( 2 x - y + a sin \( 2 pi x \) \, x \)$ is conjugate to
  (1.1) by $\( x \, y \) mapsto \( x \, x - y \)$, with $a = k$.
  The assertion concerns both parameter measure and, at each parameter, phase-space area.
  It makes no claim of ergodicity, almost-everywhere positive exponents, or a uniform positive lower bound on entropy.

=== Context <context>

The standard map arose as a model of conservative instability [7].
  Its large-parameter regime combines strong local expansion with recurrent losses of derivative growth.
  Duarte’s large-parameter analysis constructs hyperbolic basic sets and exhibits elliptic-island and tangency
  phenomena in the standard family [8]. Gorodetski [9] obtained transitive invariant sets of full Hausdorff
  dimension for a residual set of large parameters. These results reveal extensive deterministic structure,
  but neither hyperbolic sets nor full dimension imply positive area;
  residual parameter sets also need not have positive Lebesgue measure.

Other entropy results use different measures or notions. Obata [14] established uniqueness of the measure of
  maximal entropy for sufficiently large standard-map parameters, without identifying that measure with area.
  Oliveira [15] Theorem 5.1 proved positive topological entropy for every $k > 0$ with $k eq.not 2 \/
  pi$ in the normalization of (1.1). Positive topological entropy does not by itself give positive entropy for the
  specific invariant measure $m$. Berger and Turaev [2] proved Herman’s positive-entropy conjecture by
  conservative perturbations, including perturbations near standard maps;
  these are not restricted to amplitude changes in (1.1). Related hyperbolicity is available for Anosov-driven
  skew products with standard-map fibers [1] and randomly perturbed standard maps [6].
  Coupling, noise, and smooth perturbation change the dynamical system or its probability law.
  The question here concerns Lebesgue area for the exact, fixed sine map at each sufficiently large amplitude.

We use the established entropy formula, not a new entropy theory.
  For a smooth area-preserving diffeomorphism of the compact torus,
  the multiplicative ergodic theorem [16] gives almost-everywhere Lyapunov exponents.
  The determinant-one condition makes them $lambda_(+) \( z \)$ and $- lambda_(+) \( z \)$,
  with $lambda_(+) \( z \) gt.eq 0$. The entropy formula of Pesin,
  in the absolutely continuous invariant-measure form [17,12,13], gives

#[#set math.equation(numbering: n => "(1.2)")
 $ h_m \( f_k \) = integral_(bb(T)^2) lambda_(+) \( z \) thin upright(d) m \( z \) . $ <main:pesin>]

The map is $C^oo$, the manifold is compact without boundary,
  and $m$ is an absolutely continuous invariant probability.
  The derivative and inverse-derivative logarithms are bounded at each fixed parameter,
  so all integrability hypotheses hold. Neither ergodicity nor a prior assumption of nonzero exponents is
  required. Consequently the task is to prove positivity of $lambda_(+)$ on positive area.

#thm([Corollary 1.2.])[
  (Nonuniformly hyperbolic ergodic component).  #emph[For each $k gt.eq
    k_0$ there is a measurable $f_k$-invariant set $E = E \( k \)$ with $m \( E \) >
    0$ such that $\( E \, m \( E \)^(- 1) m \|_E \, f_k \)$ is ergodic and $f_k$ has one positive and one negative
    Lyapunov exponent almost everywhere on $E$. For some integer $N = N \( k \, E \) gt.eq 1$,
    there is a measurable partition $E = E_0 union.sq dots.h.c union.sq E_(N - 1)$ such that $f_k \( E_j \) =
    E_(j + 1 med mod med N)$ and $\( E_j \, m \( E_j \)^(- 1) m \|_(E_j) \, f_k^N \)$ is Bernoulli for every $j$.
    All invariance and partition statements are modulo $m$-null sets; each $E_j$ has area $m \( E \) \/ N > 0$.]
] <main:components>

#proof[
  Fix $k gt.eq k_0$ and let $H_k$ be the invariant Oseledets set where $lambda_(+) > 0$.
    It has positive area by 1, while $det D f_k = 1$ makes the other exponent $- lambda_(+) < 0$ there.
    The normalized restriction $nu_k = m \( H_k \)^(- 1) m \|_(H_k)$ is an absolutely continuous invariant
    probability on the compact torus, with no zero Lyapunov exponents.
    Pesin’s ergodic and Bernoulli decomposition theorems, as stated in [11] Theorems 3.3–3.4,
    apply to $nu_k$ and give a positive-$nu_k$ ergodic component $E$ and its finite cyclic partition.
    Since $nu_k \( E \) = m \( E \) \/ m \( H_k \) > 0$, the component has positive area;
    normalizing $nu_k$ on $E$ or on a partition piece agrees with normalizing $m$.
    Area preservation gives $m \( E_j \) = m \( E \) \/ N$. ◻
]

=== Proof mechanism <proof-mechanism>

The proof has two quantitative inputs and a multiscale conclusion.
  In transfer coordinates the derivative is a product of determinant-one matrices $T_(i \, j)$.
  With the one-step bound $M = 2 pi k + 4$, put $g \( i \, j \) = log_M ∥T_(i \, j)∥$.
  The bound $0 lt.eq g \( i \, j \) lt.eq \| i - j \|$ and the triangle inequality make $g$ a stationary
  semimetric on orbit time. We track the expected shortfall $1 -
  bb(E) g \( 0 \, n \) \/ n$ from maximal growth at each length $n$.

First, 4 bounds the probability that two long segments grow nearly at the maximal rate but their concatenation
  almost completely cancels. A cancellation supplies a linearized solution that is small at both endpoints.
  Matched expansion scales on its two sides give many local tests.
  A uniform analytic scarcity estimate, including the degenerate cases of nearly cancelling reciprocal cosines,
  converts those tests into exponential probability decay. Finite-time direction and tangency geometry in the
  standard family has precedents in [4]; the matched-scale scarcity estimate used here is proved below,
  rather than imported from that work.

Second, 9 gives a weighted product estimate for observations near opposite ends of a rapidly growing segment.
  Finite Dirichlet problems construct two transverse contracting graph families.
  Their uniformly controlled slice Jacobians yield the estimate by changes of variables.
  This step does not presume mixing or independence of orbit segments.
  For comparison, Blumenthal [5] obtains fixed-parameter correlation bounds that are useful over a finite
  parameter-dependent time range. Those bounds do not supply the weighted estimate across fast bridges in (5.2),
  which applies at arbitrary sufficiently large bridge lengths; its restriction to fast bridges is essential.

Suppose now that arbitrarily large parameters had zero exponent almost everywhere.
  The shortfall at every fixed length tends to zero as the parameter grows,
  whereas at each fixed zero-exponent parameter it tends to one as the length grows.
  Cancellation scarcity bounds how much this shortfall can jump when the length doubles.
  We can therefore select a range of dyadic lengths over which it first increases and normalize by the small
  terminal shortfall. Rescaling the distance arrays produces measures that are locally finite away from the affine
  arrays $d \( s \, t \) = w \| s - t \|$, where every interval grows at one common linear rate.
  The bridge estimate restricts which slow intervals can coexist with a fast connecting segment.
  Together with cancellation scarcity and a four-point inequality,
  it leaves three kinds of nonaffine limit arrays: an entirely slow array,
  or one with one or two exterior unit-speed rays.

The final comparison uses a capped shortfall: it is linear with a small slope near zero,
  and equals one on uniformly slow intervals. Sum its whole-interval value minus the average of its two
  half-interval values over the selected dyadic lengths. This telescopes to a positive normalized terminal value,
  since the initial contribution vanishes. The limiting sum decomposes into the backward dilates of the terminal
  measure and a translation- and dilation-invariant remainder.
  The first contribution is strictly less than that same terminal value:
  a nonzero terminal measure retains a slow interval visible at arbitrarily fine scales.
  The invariant remainder’s contribution is nonpositive. For its two-ray shapes,
  translation and dilation averaging compare fine-scale occupancy of the slow interval with the smaller capped
  loss over long crossing intervals. These two bounds contradict the positive telescoping balance.

Passing to the limit in that balance is itself a proof obligation.
  Vague convergence away from affine arrays does not control weighted mass approaching them.
  The cap is flat at slow affine speeds; the bridge estimate removes intermediate affine speeds;
  and cancellation truncation controls the remaining unit-speed array.
  Thus the same quantitative inputs govern both the nonaffine shapes and the mass that might otherwise escape them.

2 fixes the transfer coordinates and growth conventions. Section 3,
  Section 4 prove cancellation scarcity and its local analytic estimate.
  5 supplies the finite-graph product estimate. 6 constructs the dyadic limit measures;
  7 classifies their support, and 8 completes the capped-deficit balance.
  These quantitative ingredients are proved in the form needed here;
  no external standard-map entropy assertion or independence hypothesis is imported.

== 2 Transfer matrices and growth shortfalls <sec:setup>

Throughout the proof the parameter $k$ is positive and sufficiently large. Set

#[#set math.equation(numbering: n => "(2.1)")
 $ K = 2 pi k \, wide M = K + 4 \, wide phi.alt \( x \) = 2 x + k sin \( 2 pi x \) \, wide v \( x \) =
   phi.alt' \( x \) = 2 + K cos \( 2 pi x \) . $ <setup:parameters>]

Growth logarithms are to base $M$. Natural logarithms are retained in the definitions of entropy and Lyapunov
  exponents. Constants denoted by $C$ may increase from one occurrence to the next.
  Unless a dependence is specified, constants in large-$M$ estimates do not depend on the orbit,
  the integer times, or $M$.

Write $\( x_i \, y_i \) = f_k^i \( z \)$ for all $i in bb(Z)$, and put $q_i = x_i in bb(T)$.
  The identity $x_i - y_i = x_(i - 1)$ shows that the fixed torus automorphism $\( x \, y \)
  mapsto \( x \, x - y \)$ replaces the state by $\( q_i \, q_(i - 1) \)$.
  It preserves normalized area, and the recurrence becomes

#[#set math.equation(numbering: n => "(2.2)")
 $ q_(i + 1) = phi.alt \( q_i \) - q_(i - 1) med \( mod med 1 \) . $ <setup:recurrence>]

When varying an orbit locally we choose initial real lifts and iterate this same recurrence over $bb(R)$,
  without reducing modulo one. Its linear recurrence is

#[#set math.equation(numbering: n => "(2.3)")
 $ binom(u_(i + 1), u_i) = A_i binom(u_i, u_(i - 1)) \, wide A_i =
   mat(delim: "(", v \( q_i \), - 1; 1, 0) . $ <setup:transfer>]

For $a \, b in bb(Z)$, let $T_(a \, b)$ carry the linearized pair at time $a$ to the pair at time $b$.
  Thus $T_(a \, c) = T_(b \, c) T_(a \, b)$ and $T_(b \, a) = T_(a \, b)^(- 1)$.

All matrix and vector norms are Euclidean unless otherwise stated. Every transfer matrix has determinant one.
  A real two-dimensional determinant-one matrix has singular values $D \, D^(- 1)$ with $D gt.eq 1$; in particular

#[#set math.equation(numbering: n => "(2.4)")
 $ ∥T_(a \, b)∥ = ∥T_(b \, a)∥ \, wide 1 lt.eq ∥T_(a \, b)∥ lt.eq M^(\| b - a \|) . $ <setup:norm-bounds>]

Indeed both $A_i$ and $A_i^(- 1)$ have Euclidean norm at most $M$. The same bound holds in the maximum norm:
  their largest absolute row sum is at most $K + 3 < M$. Also

#[#set math.equation(numbering: n => "(2.5)")
 $ \| phi.alt' \| lt.eq M \, wide \| phi.alt^(\( p \)) \| lt.eq C_p M quad \( p gt.eq 2 \) $ <setup:derivatives>]

for every fixed derivative order $p$. These estimates apply equally on all real lifts.
  The fixed change of coordinates does not alter Lyapunov exponents,
  since conjugating a derivative product by a fixed invertible matrix changes its logarithmic norm by a bounded amount.

The probability $bb(P)$ and expectation $bb(E)$ always refer to normalized area of the initial state.
  At every fixed time $i$, the pair $\( q_i \, q_(i - 1) \)$ has uniform product distribution on $bb(T)^2$.
  The process is stationary under all integer time shifts. This does not assert independence of coordinates
  observed at different times.

We record growth and its expected shortfall by

#[#set math.equation(numbering: n => "(2.6)")
 $ g \( i \, j \) = log_M ∥T_(i \, j)∥ \, wide e_n = bb(E) [1 - frac(g \( 0 \, n \), n)] quad \( n gt.eq 1 \) .
   $ <scale:distance-deficit>]

The transfer identities make $g$ a stationary semimetric on orbit time:
  it is symmetric, vanishes on the diagonal, and satisfies the triangle inequality.
  Distinct times may have zero distance. The one-step bound gives

#[#set math.equation(numbering: n => "(2.7)")
 $ 0 lt.eq g \( i \, j \) lt.eq \| i - j \| \, $ <scale:distance-bound>]

so $e_n in \[ 0 \, 1 \]$ measures the average loss from the upper growth rate over an interval of length $n$.
  These definitions do not assume that Lyapunov exponents vanish;
  that assumption enters only in the contradiction argument of 6.

For nonzero vectors $a \, b in bb(R)^2$, the symbol $a and b$ denotes their determinant.
  For unit vectors its absolute value is the absolute sine of their angle and depends only on their unoriented
  lines. The absolute sines satisfy

#[#set math.equation(numbering: n => "(2.8)")
 $ \| a and c \| lt.eq \| a and b \| + \| b and c \| $ <setup:sine-triangle>]

for unit vectors: express the two outer vectors in the orthonormal basis given by $b$ and a perpendicular vector,
  and expand their determinant.

The following elementary observation will repeatedly convert a small total growth deficit into good growth on many
  subintervals.

#thm([Lemma 2.1.])[
  (Shortfall count).  #emph[Let $z_0 \, dots.h \, z_N$ be real numbers with $z_j - z_(j - 1) lt.eq 1$, and set
$ cal(D) = N - \( z_N - z_0 \) = sum_(j = 1)^N #scale(x: 120%, y: 120%)[\(] 1 - z_j +
  z_(j - 1) #scale(x: 120%, y: 120%)[\)] . $

 For $c < 1$, the number of indices $j$ for which some $0 lt.eq l < j$ satisfies $z_j -
   z_l < c \( j - l \)$ is at most $C cal(D) \/ \( 1 - c \)$, with an absolute constant $C$.
   The same conclusion holds for the number of indices $j$ with some $j < l lt.eq N$ satisfying $z_l -
   z_j < c \( l - j \)$.]
] <setup:shortfall-count>

#proof[
  For each bad index choose one witnessing interval. Its length is a positive integer,
    and the sum of the nonnegative step shortfalls over it exceeds $\( 1 - c \)$ times its length.
    Select disjoint intervals greedily in decreasing order of length,
    discarding each interval that intersects one already selected.
    Regard intervals as half-open when deciding disjointness,
    so that the sums of shortfalls over selected intervals have disjoint sets of steps.
  Every discarded interval meets a selected interval of at least its length and is contained in the concentric
    threefold enlargement of that selected interval. The bad endpoints are therefore covered by these
    enlargements. An interval of integer length $L gt.eq 1$ has at most $3 L +
    1$ integer points in its threefold enlargement. If the selected lengths are $L_1 \, dots.h \, L_s$,
    the number of bad indices is at most $4 sum_r L_r$. Disjointness and nonnegativity give $\( 1 - c \) sum_r L_r
    lt.eq cal(D)$. This proves the first statement, and the same selection applied to the forward witnessing
    intervals proves the second. ◻
]

We will use the count both for logarithms of vector norms, whose one-step increments are at most one by (2.4),
  and for the logarithms of successive maximum norms of solutions of (2.3).
  Neither use requires a lower bound on each individual increment.

== 3 Nearly full-rate cancellations <can:section>

The first estimate concerns two long products which expand rapidly when viewed from their common endpoint,
  although their concatenation has little growth. Such a configuration forces a linearized solution to be small at
  both distant endpoints. We use this solution to locate many pairs of comparable expansion scales on the two
  sides of the common endpoint.

#thm([Theorem 3.1.])[
  (Cancellation estimate).  #emph[There are constants $delta > 0$, $C < oo$, $gamma > 0$,
    and $M_0 < oo$ such that, for every $M gt.eq M_0$, every $i in bb(Z)$, and every $n in bb(N)$,
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(P)
   mat(delim: "{", min #scale(x: 120%, y: 120%)[\(] log_M ∥T_(i \, i - n)∥ \, log_M ∥T_(i \, i + n)∥
   #scale(x: 120%, y: 120%)[\)] gt.eq \( 1 - delta \) n \,; log_M ∥T_(i - n \, i + n)∥ lt.eq delta n) lt.eq
   C exp \( - gamma n \) . $ <can:event-bound>]

 All four constants are independent of the center, the length, and the parameter $M$ in the indicated range.]
] <can:theorem>

Throughout this section and the next, fix

#[#set math.equation(numbering: n => "(3.2)")
 $ c = 99 / 100 . $ <can:c>]

Constants used before the final choice of $delta$ are independent of $delta$, $n$, and $M$,
  unless a dependence is stated explicitly.

=== 3.1 A solution small at both endpoints <a-solution-small-at-both-endpoints>

By stationarity it is enough to consider $i = 0$. Suppose the event in (3.1) occurs. Write

$ D_(-) = ∥T_(0 \, - n)∥ \, wide D_(+) = ∥T_(0 \, n)∥ \, $

and let $a_(-)$ and $a_(+)$ be unit most-expanded input directions for these two products.
  If $b$ is a unit vector perpendicular to $a_(-)$, then

$ ∥T_(0 \, - n) b∥ = D_(-)^(- 1) \, wide ∥T_(0 \, n) b∥ gt.eq D_(+) lr(|a_(-) and a_(+)|) . $

The first equality uses determinant one: the singular values of either product are its norm and the reciprocal of
  its norm. Applying the full product to the vector $T_(0 \, - n) b$ gives

$ ∥T_(- n \, n)∥ gt.eq D_(-) D_(+) lr(|a_(-) and a_(+)|) \, wide lr(|a_(-) and a_(+)|) lt.eq
  M^(- \( 2 - 3 delta \) n) . $

Resolving $b$ in the singular input directions of $T_(0 \, n)$ also gives the upper bound

$ ∥T_(0 \, n) b∥ lt.eq D_(+)^(- 1) + D_(+) lr(|a_(-) and a_(+)|) lt.eq 2 M^(- \( 1 - 3 delta \) n) . $

The left endpoint has the smaller bound $D_(-)^(- 1)$. Thus the solution of the linearized recurrence with central
  pair $b$ is small at both endpoints. One of its entries at times $0$ and $-
  1$ has absolute value at least $1 \/ sqrt(2)$. Choose that time $e in { 0 \, -
  1 }$ and divide the whole solution by its value there. The normalized solution satisfies

#[#set math.equation(numbering: n => "(3.3)")
 $ u_e = 1 \, wide ∥\( u_0 \, u_(- 1) \)∥ lt.eq sqrt(2) \, wide ∥\( u_n \, u_(n - 1) \)∥ \,
   med ∥\( u_(- n) \, u_(- n - 1) \)∥ lt.eq 3 M^(- \( 1 - 3 delta \) n) . $ <can:small-solution>]

This construction will be used only as an existence statement;
  no measurable selection of a singular direction is required.

=== 3.2 Outward paths and good indices <outward-paths-and-good-indices>

Fix $e$ and $q_e$. Use $theta = q_(e - 1)$ as the other circle coordinate, so that $q_(e + 1) =
  phi.alt \( q_e \) - theta$ modulo one. The two outward paths are

$ q_j^(-) = q_(e - j) \, wide q_j^(+) = q_(e + j) wide \( j gt.eq 0 \) . $

On either path the positions and every linearized solution obey the same second-order recurrence.
  In calculations involving just one path, omit its sign and write $q_j \, u_j \, v_j = v \( q_j \)$, with $u_0 =
  1$. Define

#[#set math.equation(numbering: n => "(3.4)")
 $ t_0 = 0 \, wide t_1 = 1 \, wide t_(j + 1) = v_j t_j - t_(j - 1) . $ <can:t-definition>]

For local real lifts of the positions,

$ partial_theta q_j^(-) = t_j^(-) \, wide partial_theta q_j^(+) = - t_j^(+) . $

The sign difference comes solely from the initial positions at index one.
  It does not change the recurrence or its Wronskian identity:

#[#set math.equation(numbering: n => "(3.5)")
 $ u_(j - 1) t_j - u_j t_(j - 1) = 1 wide \( j gt.eq 1 \) . $ <can:wronskian>]

Indeed the expression on the left is one at $j = 1$ and the recurrence preserves it.
  A common normalized solution on the two paths has

#[#set math.equation(numbering: n => "(3.6)")
 $ u_1^(-) + u_1^(+) = v \( q_e \) . $ <can:center-equation>]

Conversely, two outward solutions with value one at index zero and satisfying (3.6) assemble into a solution of
  the original recurrence across the center.

On each path the two small endpoint entries in (3.3) are indexed by $N - 1 \, N$.
  More explicitly, the forward and backward lengths are $N_(+) = n - e$ and $N_(-) = n + e + 1$, respectively:
  one is $n$ and the other is $n + 1$. Define pair-growth logarithms

$ tau_j = log_M max \( lr(|t_j|) \, lr(|t_(j - 1)|) \) \, wide upsilon_j =
  log_M max \( lr(|u_j|) \, lr(|u_(j - 1)|) \) quad \( 1 lt.eq j lt.eq N \) . $

Both pairs are nonzero, so these logarithms are defined. The bounds for one step and its inverse in the maximum
  norm give

#[#set math.equation(numbering: n => "(3.7)")
 $ lr(|tau_(j + 1) - tau_j|) lt.eq 1 \, wide lr(|upsilon_(j + 1) - upsilon_j|) lt.eq 1 . $ <can:log-increments>]

#prodef([Definition 3.2.])[
  An index $2 lt.eq j lt.eq N - 2$ is #emph[good] for the selected normalized solution if
  #[#set math.equation(numbering: n => "(3.8)")
   $ tau_j - tau_l & gt.eq c \( j - l \) &  & \( 1 lt.eq l < j \) \,\
tau_(j + 1) - tau_j & gt.eq c \,\
upsilon_j - upsilon_(j + 1) & gt.eq c \, & upsilon_(j + 1) - upsilon_(j + 2) & gt.eq c . $ <can:good>]
  For a path extending beyond a selected index, the same inequalities define goodness without reference to a
    particular terminal length $N$.
] <can:good-definition>

#thm([Lemma 3.3.])[
  #emph[There is a constant $A$ such that, on each outward path associated to (3.3),
    the number of indices in ${ 2 \, dots.h \, N - 2 }$ which are not good is at most
#[#set math.equation(numbering: n => "(3.9)")
 $ frac(A \( delta n + 1 \), 1 - c) . $ <can:bad-count>]

 The estimate holds uniformly for $M gt.eq e$.]
] <can:many-good>

#proof[
  At index $N$, (3.5) and the endpoint bound imply
  $ 1 lt.eq 2 max \( lr(|u_N|) \, lr(|u_(N - 1)|) \) max \( lr(|t_N|) \, lr(|t_(N - 1)|) \) \, $
  and hence
  $ tau_N gt.eq \( 1 - 3 delta \) n - log_M 6 \, wide upsilon_N lt.eq - \( 1 - 3 delta \) n + log_M 3 . $
  Since $tau_1 = 0$, $upsilon_1 gt.eq 0$, and $N - 1 lt.eq n$, the total shortfalls of the paths $tau$ and $-
    upsilon$ satisfy
  $ sum_(j = 1)^(N - 1) #scale(x: 120%, y: 120%)[\[] 1 - \( tau_(j + 1) - tau_j \) #scale(x: 120%, y: 120%)[\]] &
    lt.eq 3 delta n + log 6 \,\
sum_(j = 1)^(N - 1) #scale(x: 120%, y: 120%)[\[] 1 - \( upsilon_j - upsilon_(j + 1) \)
  #scale(x: 120%, y: 120%)[\]] & lt.eq 3 delta n + log 3 . $
  Every summand is nonnegative by (3.7). Apply 3 to $tau$ to count indices where the first line of (3.8) fails.
    An individual increment smaller than $c$ costs at least $1 - c$ from the relevant shortfall sum.
    This counts failures of the second line; applied to $- upsilon$,
    it counts failures of either of the two inequalities in the last line,
    with a factor of at most two because a single increment can be tested at two neighboring indices.
    Summing these bounds proves (3.9). ◻
]

At a good index let $L_j = lr(|t_j|)$. The first line of (3.8) with $l = j -
  1$ makes $t_j$ the dominant entry of its pair, and the next increase makes $t_(j + 1)$ dominant at the next
  pair. Consequently

#[#set math.equation(numbering: n => "(3.10)")
 $ L_j = M^(tau_j) \, wide lr(|t_l|) lt.eq L_j M^(- c \( j - l \)) quad \( 1 lt.eq l < j \) \,\
lr(|t_(j + 1)|) gt.eq M^c L_j . $ <can:good-t>]

The two decreases for the $u$-pairs similarly give

$ lr(|u_(j + 1)|) lt.eq M^(- c) lr(|u_j|) lt.eq M^(- 2 c) lr(|u_(j - 1)|) . $

Using (3.5) and $lr(|t_(j - 1) \/ t_j|) lt.eq M^(- c)$, we obtain, after increasing a fixed lower bound for $M$,

#[#set math.equation(numbering: n => "(3.11)")
 $ lr(|u_(j - 1)|) L_j lt.eq 1 + M^(- 2 c) lr(|u_(j - 1)|) L_j \, wide lr(|u_(j - 1)|) lt.eq 2 / L_j . $ <can:good-u>]

For $t_j eq.not 0$, let $R_j$ be the initial value at index one of the solution having value one at index zero and
  value zero at index $j$. This solution exists and is unique:
  changing its initial value at index one by $a$ changes its value at index $j$ by $a t_j$.
  Its value at index $j - 1$ is $1 \/ t_j$, by (3.5). Its value at index $j + 1$ is therefore $- 1 \/ t_j$, which proves

$ R_(j + 1) - R_j = frac(1, t_j t_(j + 1)) . $

For any normalized solution, varying its initial value at index one also gives $u_1 - R_(j + 1) =
  u_(j + 1) \/ t_(j + 1)$. At a good index, (3.10), (3.11) thus yield

#[#set math.equation(numbering: n => "(3.12)")
 $ u_1 & = R_(j + 1) + u_(j + 1) / t_(j + 1)\
 & = R_j + frac(1, t_j^2 \( v_j - t_(j - 1) \/ t_j \)) + O (M^(- 3 c) / L_j^2) . $ <can:boundary-expansion>]

The implied constant is absolute and does not depend on the index.

=== 3.3 Matching the two expansion scales <matching-the-two-expansion-scales>

1 depicts the two outward paths and one selected pair with comparable logarithmic derivative scales,
  as in the following lemma.

#thm([Lemma 3.4.])[
  #emph[There are fixed constants $delta_0 > 0$, $c_1 > 0$, $C_1 < oo$,
    and $n_(*) < oo$ with the following property. If $0 < delta lt.eq delta_0$ is fixed,
    increasing $n_(*)$ if necessary, every configuration in (3.3) with $n gt.eq
    n_(*)$ has at least $c_1 n$ pairs $\( j_m^(+) \, j_m^(-) \)$ of good indices such that both index sequences
    increase strictly and
#[#set math.equation(numbering: n => "(3.13)")
 $ lr(|tau_(j_m^(+))^(+) - tau_(j_m^(-))^(-)|) lt.eq 3 / 5 . $ <can:matching-condition>]

 The collection of all possible increasing index-pair patterns for a given $n$ has cardinality at most
   $exp \( C_1 n \)$.]
] <can:matching>

#proof[
  Choose a small fixed $beta > 0$, for example $beta = 10^(- 3)$.
    By (3.9), choosing $delta_0$ sufficiently small and then $n_(*)$ sufficiently large makes the bad-index count
    on each path at most $beta n$. The total-shortfall estimate also gives, at every index,
  $ j - 1 - 3 delta n - log 6 lt.eq tau_j lt.eq j - 1 . $
  Shrink $delta_0$ once more and increase $n_(*)$ so that, for $n \/ 3 lt.eq j lt.eq n \/ 2$,
    the corresponding $tau_j$ lies in $\[ n \/ 4 \, 3 n \/ 4 \]$, while on the minus path
  $ tau_(N - 2)^(-) gt.eq tau_N^(-) - 2 > 3 n \/ 4 + 1 . $
  There are at least $n \/ 6 - 2 - beta n$ good plus indices in this range.
  For each such index put $a = tau_j^(+)$. Starting from $tau_1^(-) = 0$,
    let $k$ be the first minus index with $tau_k^(-) gt.eq a$.
    We have $tau_(k - 1)^(-) < a lt.eq tau_k^(-)$ and $tau_k^(-) - tau_(k - 1)^(-) lt.eq 1$.
    Thus at least one of these two values is within $1 \/ 2$ of $a$.
    The chosen index is in ${ 2 \, dots.h \, N - 2 }$: the large lower bound on $a$ excludes the first two
    indices, and the displayed lower bound at $N - 2$ provides the upper bound.
    If the chosen minus index is bad, discard this plus index.
  Good plus indices $j < j'$ have $tau_(j')^(+) - tau_j^(+) gt.eq c \( j' - j \)$.
    At most two such logarithms can belong to an interval of length one, since $2 c > 1$.
    A fixed bad minus index can therefore be responsible for at most two discarded plus indices.
    At least $n \/ 6 - 2 - 3 beta n$ candidates remain.
  Thin these candidates in increasing plus order by retaining the first one,
    then retaining the next whose plus logarithm is at least two larger than the last retained logarithm,
    and continuing. Since successive candidate logarithms are separated by at least $c$,
    each retention removes at most three candidates. A fixed positive fraction of $n$ remains; for example,
    decreasing the fraction if necessary, one may fix $c_1 = 10^(- 2)$.
    The matched minus logarithms increase strictly, because each is within $1 \/
    2$ of the corresponding plus logarithm and the retained plus logarithms have gaps at least two.
    For two good minus indices, increasing index implies strictly increasing logarithm by (3.8).
    Strict increase of their logarithms therefore forces strict increase of their indices as well.
    The matching error is at most $1 \/ 2$, which implies (3.13).
  Each path contains at most $n + 1$ available indices. An increasing paired pattern is determined by a subset of
    the indices on each path, with the two subsets of equal cardinality paired in order.
    There are at most $2^(2 n + 2)$ such choices. Enlarging an absolute $C_1$ gives the stated exponential bound. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (-5, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 0), (5, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((-4.6, 0), radius: 0.05292, fill: black, stroke: none)
  circle((-2, 0), radius: 0.05292, fill: black, stroke: none)
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  circle((2.6, 0), radius: 0.05292, fill: black, stroke: none)
  circle((4.6, 0), radius: 0.05292, fill: black, stroke: none)
  content((0, 0), [$q_e$], anchor: "south", padding: 0.1176cm)
  content((-2, 0), [$q_(e-j_m^-)$], anchor: "south", padding: 0.1176cm)
  content((2.6, 0), [$q_(e+j_m^+)$], anchor: "south", padding: 0.1176cm)
  content((-4.6, 0), [left endpoint], anchor: "south", padding: 0.1176cm)
  content((4.6, 0), [right endpoint], anchor: "south", padding: 0.1176cm)
  line((-2, -0.15), (-2, -0.65), (2.6, -0.65), (2.6, -0.15), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0, -0.65), [a matched pair: $ "lvert" log_M L_(j_m^-)^- - log_M L_(j_m^+)^+ "rvert" lt.eq 3"/"5$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The two paths are followed outward from a fixed central position. Matched indices need not be equally far from the center; their derivatives with respect to the other central coordinate have comparable logarithmic size. ],
) <can:wing-figure>

=== 3.4 The local input <the-local-input>

The analytic fact used at each matched pair is the following uniform scarcity statement. Its proof occupies 4.

#thm([Lemma 3.5.])[
  (Local scarcity).  #emph[For every $eta > 0$ there are $eta' > 0$ and $M_eta <
    oo$ such that the following holds for $M gt.eq M_eta$. Fix $q_e$, a base coordinate $theta_(*)$,
    and indices $j_(+) \, j_(-) gt.eq 2$ on the two outward paths.
    Suppose both indices are good at $theta_(*)$ for a common normalized solution,
    and their logarithms satisfy (3.13). Let
$ L_(+) = lr(|t_(j_(+))^(+) \( theta_(*) \)|) \, wide L_(-) = lr(|t_(j_(-))^(-) \( theta_(*) \)|) \, wide L =
  max \( L_(+) \, L_(-) \) . $

 Let $cal(S) subset \[ - 1 \, 1 \]$ consist of the $h$ for which, at $theta = theta_(*) + h \/ L$,
   the same two indices are good for some common solution with $u_e = 1$.
   The solution is allowed to depend on $h$, and neither endpoint smallness nor a new matching condition is
   required at these other points. Then
#[#set math.equation(numbering: n => "(3.14)")
 $ lr(|{ x in bb(R) : "dist" \( x \, cal(S) \) < eta' }|) lt.eq eta . $ <can:scarcity-bound>]

 Here and below the size of a subset of the line or circle denotes its Lebesgue measure.
   The constants are uniform over the central position, the base coordinate, and the selected indices.]
] <can:local-scarcity>

=== 3.5 From local scarcity to exponential decay <from-local-scarcity-to-exponential-decay>

#proof[
  Fix once and for all a sufficiently small $delta > 0$ allowed by 7.
    Its constants $c_1 \, C_1 \, n_(*)$ are now fixed. Choose $eta > 0$ so small that
  #[#set math.equation(numbering: n => "(3.15)")
   $ 5 eta < 1 \, wide c_1 log frac(1, 5 eta) > C_1 + 1 . $ <can:eta-choice>]
  Obtain $eta'$ and $M_eta$ from 8. Increase a fixed lower bound $M_0$ so that all estimates above hold,
    that $M_0 gt.eq M_eta$, and that
  #[#set math.equation(numbering: n => "(3.16)")
   $ M_0^(- c) < 1 / 4 \, wide M_0^(- c) \/ 5 < eta' . $ <can:radius-choice>]
  These choices are independent of $n$, of the center, and of $M gt.eq M_0$.
  Fix $e in { 0 \, - 1 }$ and $q_e$. It is enough to consider patterns containing exactly $r =
    ceil.l c_1 n ceil.r$ pairs, since a longer pattern can be truncated.
    For a fixed such increasing pattern, let $cal(F)$ be the set of $theta$ admitting one common normalized
    solution with all of the following properties: the original central pair has norm at most $sqrt(2)$;
    both endpoint pairs satisfy (3.3); and every pair of selected indices is good and satisfies (3.13).
    We emphasize that one solution must satisfy all conditions of a pattern at once.
  The set $cal(F)$ is measurable, in fact compact. To see this without selecting solutions,
    parameterize the original central pair by its entry other than the fixed entry $u_e = 1$.
    The norm bound puts that parameter in $\[ - 1 \, 1 \]$. All later solution entries and all recurrence
    coefficients depend continuously on this parameter and on the circle coordinate $theta$.
    Each pair entering a logarithm is nonzero, by invertibility of the recurrence.
    The endpoint, goodness, and matching conditions are closed inequalities on the compact product of the circle
    with $\[ - 1 \, 1 \]$. Their projection is therefore compact.
  For $theta in cal(F)$ and $1 lt.eq m lt.eq r$, define
  $ L_m \( theta \) = max (lr(|t_(j_m^(+))^(+) \( theta \)|) \, lr(|t_(j_m^(-))^(-) \( theta \)|)) \, wide
    s_m \( theta \) = L_m \( theta \)^(- 1) \, $
  and let
  $ V_m = union.big_(theta in cal(F)) B #scale(x: 120%, y: 120%)[\(] theta \,
    s_m \( theta \) \/ 10 #scale(x: 120%, y: 120%)[\)] $
  be an open subset of the circle. Goodness at the later of two selected indices gives, separately on both paths,
  $ lr(|t_(j_(m + 1)^plus.minus)^plus.minus \( theta \)|) gt.eq
    M^(c \( j_(m + 1)^plus.minus - j_m^plus.minus \)) lr(|t_(j_m^plus.minus)^plus.minus \( theta \)|) . $
  Since both index sequences increase strictly,
  #[#set math.equation(numbering: n => "(3.17)")
   $ s_(m + 1) \( theta \) lt.eq M^(- c) s_m \( theta \) \, wide s_m \( theta \) lt.eq M^(- c) . $ <can:radius-decay>]
  For fixed $M \, n$, these positive radii also have a positive lower bound:
    the one-step norm bound gives $lr(|t_j|) lt.eq M^(j - 1) lt.eq M^n$ at all indices in question, so $s_m gt.eq
    M^(- n)$.
  We claim
  #[#set math.equation(numbering: n => "(3.18)")
   $ lr(|V_(m + 1)|) lt.eq 5 eta lr(|V_m|) wide \( 1 lt.eq m < r \) . $ <can:cover-contraction>]
  Select disjoint balls from the family defining $V_m$ as follows.
    At each stage select a remaining ball whose radius is at least half the supremum of the remaining radii,
    and remove all remaining balls meeting it. Assign each removed ball to this selected ball.
    All selected balls are disjoint and have a fixed positive lower radius,
    so only finitely many can be selected on the circle; the procedure must exhaust the family.
    Every assigned ball meets its selected ball and has radius at most twice that of the selected ball.
  Consider one selected center $theta_(*)$ and write $s = s_m \( theta_(*) \)$.
    The centers of its assigned balls are at circle distance at most $3 s \/ 10$ from $theta_(*)$.
    The window of radius $s$ is an injective lift interval by (3.16), (3.17).
    All assigned centers belong to $cal(F)$, so they are successful for the same selected pair of indices in the
    local test based at $theta_(*)$. A next-level ball centered at an assigned $theta$ has radius at most
  $ frac(s_(m + 1) \( theta \), 10) lt.eq frac(M^(- c) s_m \( theta \), 10) lt.eq frac(M^(- c) s, 5) . $
  After rescaling the lifted coordinate by $1 \/ s$, the union of all these next-level balls is contained in the
    $eta'$-neighborhood of the successful set in 8, by (3.16). It therefore has unscaled length at most $eta s$.
    Summing over selected balls proves
  $ lr(|V_(m + 1)|) lt.eq eta sum_(upright("selected")) s =
    5 eta sum_(upright("selected")) lr(|B \( theta_(*) \, s \/ 10 \)|) lt.eq 5 eta lr(|V_m|) \, $
  as claimed. The ball selected at a center is included in its own assigned group,
    so no next-level balls have been omitted.
  Since $cal(F) subset V_m$ for every $m$ and $lr(|V_1|) lt.eq 1$, iteration gives
  $ lr(|cal(F)|) lt.eq \( 5 eta \)^(r - 1) lt.eq \( 5 eta \)^(- 1) exp (- c_1 n log frac(1, 5 eta)) . $
  There are at most $exp \( C_1 n \)$ patterns. By (3.15), their union has circle measure at most $C
    exp \( - gamma n \)$ for a fixed $gamma > 0$, uniformly in the fixed coordinate $q_e$.
    The coordinate pair $\( q_e \, q_(e - 1) \)$ has normalized product Lebesgue law.
    Integrating the conditional bound over $q_e$ and summing the two choices of $e$ therefore gives the same form
    of bound for the original event, for every $n gt.eq n_(*)$.
    Every point of that event is covered, by (3.3), Lemma 3.4.
    Finally enlarge $C$ to cover the finitely many positive integers $n < n_(*)$,
    whose event probabilities are at most one. Stationarity restores every center $i$. ◻
]

== 4 Local scarcity at matched scales <loc:section>

This section proves 8. We use its two outward paths and the notation established in the cancellation argument.
  In particular, $c = 99 \/ 100$, the central coordinate is fixed, and the variable is $theta = q_(e - 1)$.
  The selected indices are denoted by $j_(+)$ and $j_(-)$. Every assertion concerning an interval in $theta$ uses
  real lifts of the recurrence. The constants below are independent of the selected indices and of the base
  configuration.

The central relation in (3.6) will become, after rescaling,
  an approximate identity between a cubic polynomial and two shifted reciprocal-cosine terms.
  A positive-measure Hausdorff limit of the closures of successful sets would force an analytic identity.
  We rule out that identity even when the two reciprocal terms nearly cancel or one phase slope tends to zero.
  The derivative estimates in the first two subsections provide the uniform remainders needed for these two
  degeneracies.

=== 4.1 Control on a single rescaled path <control-on-a-single-rescaled-path>

Fix either outward path and write $j$ for its selected index. Put

$ L_j = lr(|t_j \( theta_(*) \)|) \, wide xi = L_j \( theta - theta_(*) \) \, wide D =
  frac(thin upright(d), thin upright(d) xi) . $

The initial position $q_0$ is constant and $q_1$ is affine in $xi$, with derivative $plus.minus L_j^(- 1)$.
  By (3.10), the base linearized solution satisfies

#[#set math.equation(numbering: n => "(4.1)")
 $ lr(|t_l \( theta_(*) \)|) / L_j lt.eq M^(- c \( j - l \)) quad \( 1 lt.eq l lt.eq j \) . $ <loc:base-growth>]

We will prove, throughout $lr(|xi|) lt.eq 1$, that

#[#set math.equation(numbering: n => "(4.2)")
 $ lr(|q_l \( xi \) - q_l \( 0 \)|) + lr(|D q_l \( xi \)|) & lt.eq C M^(- c \( j - l \)) \,\
lr(|D^p q_l \( xi \)|) & lt.eq C_p M^(- p c \( j - l \)) M^(1 - p c) quad \( 2 lt.eq p lt.eq 5 \) \,
  $ <loc:first-derivatives>]

for $0 lt.eq l lt.eq j$. The terms with $l = 0$ vanish.

Write $B_l = M^(- c \( j - l \))$ and $Delta_l = q_l \( xi \) - q_l \( 0 \)$.
  Taylor’s formula for the recurrence, followed by propagation with the base linearized matrices, gives

#[#set math.equation(numbering: n => "(4.3)")
 $ lr(|Delta_l|) lt.eq lr(|xi|) lr(|t_l \( theta_(*) \)|) / L_j +
   C sum_(d = 1)^(l - 1) M^(l - d) lr(|Delta_d|)^2 . $ <loc:nonlinear-comparison>]

Here the quadratic error at site $d$ is at most $C M lr(|Delta_d|)^2$, and the remaining $l - d -
  1$ steps have norm at most $M^(l - d - 1)$. For $l = 1$ the estimate $lr(|Delta_l|) lt.eq
  2 B_l$ follows directly from (4.1). If it holds for all earlier indices, the sum in (4.3) is bounded by

$ 4 C B_l^2 sum_(a gt.eq 1) M^(\( 1 - 2 c \) a) . $

Since $B_l lt.eq 1$ and $1 - 2 c < 0$, this is at most $B_l$ for all sufficiently large $M$.
  Induction proves the required displacement bound, uniformly in $j$.

Compare $D q_l \( xi \)$ with the base variation $plus.minus t_l \( theta_(*) \) \/ L_j$.
  Their initial data agree. Their difference is propagated by the base matrices with forcing

$ #scale(x: 120%, y: 120%)[\(] v \( q_d \( xi \) \) - v \( q_d \( 0 \) \) #scale(x: 120%, y: 120%)[\)] D
  q_d \( xi \) \, $

whose absolute value is at most $C M lr(|Delta_d|) lr(|D q_d|)$.
  Induction with $lr(|D q_d|) lt.eq 2 B_d$ therefore uses the same geometric sum and proves (4.2).

For completeness, the higher derivative induction uses the recurrence at the varied orbit.
  For $p gt.eq 2$ it has the form

$ D^p q_(l + 1) = v \( q_l \) D^p q_l - D^p q_(l - 1) + F_(p \, l) \, $

where $F_(p \, l)$ is a finite sum, with coefficients depending only on $p$, of terms

$ phi.alt^(\( s \)) \( q_l \) product_(i = 1)^s D^(m_i) q_l \, wide 2 lt.eq s lt.eq p \, quad m_i gt.eq 1 \, quad
  sum_(i = 1)^s m_i = p . $

Each $m_i$ is strictly smaller than $p$. The first derivative bound and the induction hypothesis give
  $lr(|D^(m_i) q_l|) lt.eq C_(m_i) B_l^(m_i)$, since $M^(1 - m_i c) lt.eq 1$ whenever $m_i gt.eq 2$.
  Consequently $lr(|F_(p \, l)|) lt.eq C_p M B_l^p$. The initial higher derivatives at sites $0 \, 1$ vanish.
  Propagation by the varied matrices gives

$ lr(|D^p q_l|) lt.eq C_p sum_(d = 1)^(l - 1) M^(l - d) B_d^p lt.eq
  C_p B_l^p sum_(a gt.eq 1) M^(\( 1 - p c \) a) lt.eq C'_p B_l^p M^(1 - p c) . $

This proves (4.2) successively for $p = 2 \, 3 \, 4 \, 5$.

At the selected site $D q_j \( 0 \) = plus.minus 1$. The case $p = 2$ shows that

$ D q_j \( xi \) = D q_j \( 0 \) + O \( M^(1 - 2 c) \) . $

It follows, for all sufficiently large $M$, that

#[#set math.equation(numbering: n => "(4.4)")
 $ lr(|t_j \( xi \)|) gt.eq L_j \/ 2 \, wide lr(|t_l \( xi \)|) lt.eq
   C L_j M^(- c \( j - l \)) quad \( l < j \) . $ <loc:varied-t>]

The quotient

#[#set math.equation(numbering: n => "(4.5)")
 $ E = t_(j - 1) / t_j = frac(D q_(j - 1), D q_j) quad upright("satisfies") quad lr(|D^p E|) lt.eq
   C_p M^(- c) quad \( 0 lt.eq p lt.eq 4 \) . $ <loc:quotient>]

Indeed the denominator is bounded away from zero. Every derivative of its reciprocal of order at most four is
  bounded by the already proved bounds through $D^5 q_j$. Every derivative of the numerator through order four
  contains a derivative of $q_(j - 1)$ and has a factor at most $C M^(- c)$. The product rule proves (4.5).

=== 4.2 A fourth derivative bound for the boundary value <a-fourth-derivative-bound-for-the-boundary-value>

Fourth-order control makes the boundary value replaceable by a cubic polynomial with a small remainder.
  The remainder must remain negligible even after normalizing the first nonzero correction when the two
  reciprocal-cosine terms nearly cancel.

Let $R_j$ be the initial value at site $1$ of the solution $U$ with $U_0 = 1$ and $U_j = 0$.
  This solution exists throughout our interval because $t_j$ does not vanish. We claim that, with $rho = 4 \/ 5$,

#[#set math.equation(numbering: n => "(4.6)")
 $ L_j^2 lr(|D^4 R_j|) lt.eq C M^(- 2 - rho) . $ <loc:boundary-fourth>]

Consider the $\( j - 1 \)$-by-$\( j - 1 \)$ tridiagonal matrix $B$ with diagonal $v \( q_a \)$, $1 lt.eq a lt.eq
  j - 1$, and both adjacent diagonals equal to $- 1$. Its determinant is $t_j$:
  expansion along the last row gives the same recursion and initial conditions as those for $t$.
  The interior boundary problem is $B U = e_1$, so $R_j = \( B^(- 1) \)_11$.
  More explicitly, its inverse $G = B^(- 1)$ is

#[#set math.equation(numbering: n => "(4.7)")
 $ G_(a b) = t_(min \( a \, b \)) U_(max \( a \, b \)) . $ <loc:green>]

To check this formula, fix column $b$. Its entries solve the homogeneous recurrence except at row $b$,
  and are zero at the boundary sites $0 \, j$. At row $b$ the output of $B$ is $t_(b + 1) U_b - t_b U_(b + 1) =
  1$, by the constant Wronskian and the data $t_0 = 0 \, t_1 = 1 \, U_0 = 1$.
  Thus the column is precisely $B^(- 1) e_b$.

At the right boundary the same Wronskian gives $U_(j - 1) = 1 \/ t_j$. Backward propagation and (4.4) yield

#[#set math.equation(numbering: n => "(4.8)")
 $ L_j lr(|U_a|) lt.eq 2 M^(j - a - 1) . $ <loc:boundary-backwards>]

For $d_a = j - a gt.eq 1$, (4.7), (4.4), (4.8) therefore give

#[#set math.equation(numbering: n => "(4.9)")
 $ lr(|G_(a b)|) lt.eq C M^(min \( d_a \, d_b \) - 1 - c max \( d_a \, d_b \)) . $ <loc:green-size>]

The chain rule and the bounds for derivatives of $q_a$ also give

#[#set math.equation(numbering: n => "(4.10)")
 $ lr(|D^p v \( q_a \)|) lt.eq C_p M^(1 - c p d_a) quad \( 1 lt.eq p lt.eq 4 \) . $ <loc:potential-derivatives>]

In fact every term contains a derivative of $v$ bounded by $C_p M$ and derivatives of $q_a$ whose total order is $p$.

Starting with $D G = - G \( D B \) G$, differentiate three more times and take the $\( 1 \, 1 \)$ entry.
  The result is a finite linear combination, with fixed integer coefficients, of sums of terms

#[#set math.equation(numbering: n => "(4.11)")
 $ U_(a_1) \( D^(p_1) v_(a_1) \) G_(a_1 a_2) \( D^(p_2) v_(a_2) \) dots.h.c
   G_(a_(s - 1) a_s) \( D^(p_s) v_(a_s) \) U_(a_s) \, wide p_i gt.eq 1 \, quad sum_(i = 1)^s p_i =
   4 . $ <loc:inverse-chains>]

Here $v_a = v \( q_a \)$, $1 lt.eq s lt.eq 4$, and each site index is summed independently from $1$ to $j - 1$.
  This form follows inductively: differentiating a potential factor increases its derivative order,
  whereas differentiating any inverse factor inserts another $- G \( D B \) G$. Also $G_(1 a) = U_a$ because $t_1 = 1$.

Put $d_i = j - a_i$. After multiplication by $L_j^2$, the exponent of $M$ bounding a term of (4.11) is

$ H & = - 1 + d_1 + d_s + sum_(i = 1)^(s - 1) #scale(x: 120%, y: 120%)[\(] min \( d_i \, d_(i + 1) \) -
  c max \( d_i \, d_(i + 1) \) #scale(x: 120%, y: 120%)[\)] - c sum_(i = 1)^s p_i d_i\
 & lt.eq - 1 + 2 min_i d_i - \( 3 c - 2 \) sum_(i = 1)^s p_i d_i\
 & lt.eq - 1 - 47 / 100 sum_(i = 1)^s p_i d_i . $

For the first inequality, write each adjacency term as $-
  lr(|d_i - d_(i + 1)|) + \( 1 - c \) max \( d_i \, d_(i + 1) \)$.
  The total variation is at least $d_1 + d_s - 2 min_i d_i$, while the sum of maxima is at most $2 sum_i d_i lt.eq
  2 sum_i p_i d_i$. For the last inequality use $4 min_i d_i lt.eq sum_i p_i d_i$ and $c = 99 \/ 100$.
  Summing over sites is harmless: for every composition of $4$,

$ sum_(d_1 \, dots.h \, d_s gt.eq 1) M^(- 1 - \( 47 \/ 100 \) sum_i p_i d_i) =
  M^(- 1) product_(i = 1)^s frac(M^(- \( 47 \/ 100 \) p_i), 1 - M^(- \( 47 \/ 100 \) p_i)) lt.eq C M^(- 72 \/ 25) . $

There are only finitely many such compositions and chain types. Since $72 \/ 25 > 2 + 4 \/ 5$, this proves (4.6).

=== 4.3 The cubic relation at successful points <the-cubic-relation-at-successful-points>

Return to the two paths and put $L = max \( L_(j_(+)) \, L_(j_(-)) \)$, $h = L \( theta - theta_(*) \)$.
  Number the paths so that the first has the larger base scale.
  Write $Q_i \( h \)$ for their selected positions and $E_i \( h \)$ for the quotients in (4.5).
  With $b_i = Q'_i \( 0 \)$ and $d_i = Q''_i \( 0 \)$, the preceding estimates imply

#[#set math.equation(numbering: n => "(4.12)")
 $ Q_i \( h \) & = z_i + b_i h + 1 / 2 d_i h^2 + cal(E)_i \( h \) \, & ∥cal(E)_i∥_(C^1 \( \[ - 1 \, 1 \] \)) &
   lt.eq C lr(|b_i|)^3 M^(1 - 3 c) \,\
lr(|d_i|) & lt.eq C lr(|b_i|)^2 M^(1 - 2 c) \, & lr(|b_1|) & = 1 \, quad lr(|b_2|) = r in \[ M^(- 3 \/ 5) \, 1 \] \,\
lr(|partial_h^p E_i|) & lt.eq C_p M^(- c) lr(|b_i|)^p &  & \( 0 lt.eq p lt.eq 4 \) . $ <loc:phase-taylor>]

The scale change is $xi = \( L_(j_i) \/ L \) h = lr(|b_i|) h$. It also gives, for $2 lt.eq p lt.eq 5$,

#[#set math.equation(numbering: n => "(4.13)")
 $ lr(|Q_i^(\( p \))|) lt.eq C_p lr(|b_i|)^p M^(1 - p c) \, wide
   lr(|Q'_i|) asymp lr(|b_i|) . $ <loc:scaled-phase-derivatives>]

At a successful point there is a common solution with central value $1$,
  and its two outward values at site $1$ add to $v \( q_e \)$. Apply (3.12) to both paths at that point.
  Since $lr(|t_(j_i) \( theta \)|) = L lr(|Q'_i \( h \)|)$ and $v \( Q_i \) - E_i =
  K \( cos \( 2 pi Q_i \) + \( 2 - E_i \) \/ K \)$, multiplication by $K L^2$ yields

$ K L^2 (v \( q_e \) - sum_(i = 1)^2 R_(j_i) \( theta \)) =
  sum_(i = 1)^2 frac(1, \( Q'_i \)^2 \( cos \( 2 pi Q_i \) + \( 2 - E_i \) \/ K \)) + O \( r^(- 2) M^(1 - 3 c) \) . $

The error bound uses (4.13) to compare the varied $t_(j_i)$ with their base sizes.
  Replace the left side by its cubic Taylor polynomial $P \( h \)$ at $0$.
  The contribution of each $R_(j_i)$ to the Taylor remainder is at most

$ C K L^2 lr(|b_i|)^4 L_(j_i)^(- 2) M^(- 2 - rho) = C K lr(|b_i|)^2 M^(- 2 - rho) . $

Consequently every successful $h in \[ - 1 \, 1 \]$ satisfies

#[#set math.equation(numbering: n => "(4.14)")
 $ P \( h \) =
   sum_(i = 1)^2 frac(1, \( Q'_i \( h \) \)^2 \( cos \( 2 pi Q_i \( h \) \) + \( 2 - E_i \( h \) \) \/ K \)) +
   O \( M^(- 1 - rho) + r^(- 2) M^(1 - 3 c) \) . $ <loc:cubic-relation>]

The polynomial may depend on the configuration. Its degree is at most three.
  The displayed error is uniform on the successful set, and tends to zero uniformly over all configurations,
  since $r^(- 2) M^(1 - 3 c) lt.eq M^(- 77 \/ 100)$.

=== 4.4 Polynomial extraction from a Hausdorff limit <polynomial-extraction-from-a-hausdorff-limit>

Consider any sequence of configurations with $M arrow.r oo$ and nonempty successful sets $cal(S)_M$.
  Pass to a subsequence on which their closures converge in Hausdorff distance to a nonempty compact set $F
  subset \[ - 1 \, 1 \]$. We prove that $F$ has measure zero. Suppose to the contrary that it has positive measure.

We record precisely the compactness argument for the polynomials that will be used below.
  Suppose, after an indicated subtraction or multiplication of (4.14),
  a polynomial $P_M^(*)$ of degree at most three agrees at successful points, up to an error tending to zero,
  with functions converging uniformly on every compact subinterval of $\[ - 1 \, 1 \]$ away from a fixed finite
  set of limiting poles in that interval. Choose four distinct points of $F$ outside those poles.
  Hausdorff convergence and approximation of points in the closure supply successful points converging to these
  four points. The values of $P_M^(*)$ there are bounded. The associated Vandermonde matrices converge to an
  invertible matrix, so all four coefficients of $P_M^(*)$ are bounded.
  Pass to a further subsequence on which the polynomials converge coefficientwise.
  For every point of $F$ away from the poles the same approximation argument shows equality with the limiting
  function. In particular, equality holds on a set of positive measure.
  Clearing the finitely many denominator factors used in that case gives an identity between real analytic
  functions on $bb(R)$: the difference has an accumulation point of zeros and hence vanishes identically.
  Passing to further subsequences throughout does not change the fixed Hausdorff limit $F$.

=== 4.5 Nonzero limiting slopes and opposite cosines <nonzero-limiting-slopes-and-opposite-cosines>

First suppose that $r$ has a positive limit $r_0$. Take convergent subsequences of the phases modulo integers and
  of the slopes. The first slope has a fixed sign after a further subsequence, so write its value as $b in { -
  1 \, 1 }$. By (4.12), (4.12), the two terms on the right of (4.14) converge, away from their limiting poles, to

$ sec \( 2 pi \( z + b h \) \) + r_0^(- 2) sec \( 2 pi \( z' + b' h \) \) \, wide lr(|b'|) = r_0 . $

Polynomial extraction and multiplication by both cosines show that the zero sets of these cosines on $bb(R)$
  coincide: at a zero of either cosine, the other must vanish because its coefficient is positive.
  Their zero sets are arithmetic progressions with respective spacings $1 \/ \( 2 lr(|b|) \)$ and
  $1 \/ \( 2 lr(|b'|) \)$, so $r_0 = 1$. The two cosines are therefore equal or opposite.
  Equality would leave twice a secant, which cannot equal a polynomial,
  as multiplication by the cosine and evaluation at one of its zeros shows. Only the opposite case remains.

Reflect the second phase if necessary and translate it by an odd half-integer.
  The resulting phase $tilde(Q)_2$ has the same limiting affine phase as $Q_1$, while

$ cos \( 2 pi Q_2 \) = - cos \( 2 pi tilde(Q)_2 \) \, wide \( Q'_2 \)^2 = \( tilde(Q)'_2 \)^2 . $

By (4.12),

#[#set math.equation(numbering: n => "(4.15)")
 $ tilde(Q)_2 - Q_1 = p \( h \) + O_(C^1) \( M^(1 - 3 c) \) \, wide deg p lt.eq 2 \,
   wide ∥p∥_(upright("coeff")) arrow.r 0 . $ <loc:phase-difference>]

Here $∥p∥_(upright("coeff"))$ is the maximum absolute value of its three coefficients. Define

$ ell = max \( ∥p∥_(upright("coeff")) \, K^(- 1) \) . $

Then $ell arrow.r 0$, but every error of order $M^(1 - 3 c) = M^(- 197 \/ 100)$ is $o \( ell \)$.
  The error in (4.14) is also $o \( ell \)$ in the present case, since $r arrow.r 1$ and $rho > 0$.

We expand on a compact subinterval away from the zeros of the common limiting cosine. Put

$ f \( x \, y \) = y^(- 2) sec \( 2 pi x \) \, wide A = 2 pi \( z_1 + b_1 h \) . $

The denominators in (4.14) stay uniformly away from zero there for large $M$.
  Their shifts are $2 \/ K + O \( M^(- c) \/ K \)$. Expanding the reciprocals, with their respective cosine signs,
  gives the sum of the two terms as

$ & f \( Q_1 \, Q'_1 \) - f \( tilde(Q)_2 \, tilde(Q)'_2 \)\
 & quad - 2 / K (\( Q'_1 \)^(- 2) sec^2 \( 2 pi Q_1 \) + \( tilde(Q)'_2 \)^(- 2) sec^2 \( 2 pi tilde(Q)_2 \)) +
   o \( ell \) . $

The reciprocal expansion has error $O \( K^(- 2) + M^(- c) \/ K \) = o \( ell \)$.
  It is essential to subtract the two $f$ terms at the actual common phase before replacing that phase by an
  affine one. Taylor expansion of $f$, using (4.15), gives

$ f \( Q_1 \, Q'_1 \) - f \( tilde(Q)_2 \, tilde(Q)'_2 \) = - f_x \( Q_1 \, Q'_1 \) p - f_y \( Q_1 \, Q'_1 \) p' +
  o \( ell \) . $

Indeed the quadratic error is $O \( ell^2 \)$ and the phase remainder is $O \( M^(1 - 3 c) \)$.
  Moreover $\( Q_1 \, Q'_1 \) = \( z_1 + b_1 h \, b_1 \) + O \( M^(1 - 2 c) \)$;
  replacing the derivatives of $f$ by their values at this affine pair produces only $O \( ell M^(1 - 2 c) \) =
  o \( ell \)$. Similarly, the preceding $K^(- 1)$ term can be evaluated at the common affine pair with error
  $o \( K^(- 1) \)$. We conclude that (4.14) becomes

#[#set math.equation(numbering: n => "(4.16)")
 $ P \( h \) = frac(2 p', b_1^3) sec A - frac(2 pi p, b_1^2) sin A thin sec^2 A - frac(4, K b_1^2) sec^2 A +
   o \( ell \) . $ <loc:opposite-expansion>]

Divide by $ell$ and take a subsequence such that $p \/ ell arrow.r
  macron(p)$ coefficientwise and $K^(- 1) \/ ell arrow.r beta$.
  At least one is nonzero, because $max \( ∥p \/ ell∥_(upright("coeff")) \, K^(- 1) \/ ell \) = 1$.
  Polynomial extraction now applies to $P \/ ell$. Multiply its limiting identity by $b^2
  cos^2 \( 2 pi \( z + b h \) \)$ and evaluate at every zero of that cosine. One obtains

#[#set math.equation(numbering: n => "(4.17)")
 $ 2 pi macron(p) \( h \) sin \( 2 pi \( z + b h \) \) + 4 beta = 0 quad
   upright("at every cosine zero.") $ <loc:alternating-obstruction>]

The zeros form an unbounded arithmetic progression and their sine values alternate between $1$ and $- 1$.
  Thus $macron(p)$ is bounded on that progression and must be constant.
  The alternating signs then force both that constant and $beta$ to be zero, contradicting their normalization.
  This excludes every positive limiting slope.

=== 4.6 A vanishing second slope <a-vanishing-second-slope>

It remains to treat $r arrow.r 0$. After a subsequence, the first term of (4.14) converges away from its poles to
  $sec \( 2 pi \( z + b h \) \)$, with $lr(|b|) = 1$. Write the second term as

#[#set math.equation(numbering: n => "(4.18)")
 $ g \( h \) = frac(1, r^2 S \( h \)) \, wide S \( h \) = (frac(Q'_2 \( h \), r))^2
   (cos \( 2 pi Q_2 \( h \) \) + frac(2 - E_2 \( h \), K)) \, wide w =
   max \( lr(|S \( 0 \)|) \, r \) . $ <loc:slow-denominator>]

Uniformly on $\[ - 1 \, 1 \]$,

#[#set math.equation(numbering: n => "(4.19)")
 $ lr(|S^(\( m \))|) lt.eq C_m r^m quad \( 1 lt.eq m lt.eq 4 \) . $ <loc:slow-derivatives>]

To see every derivative involved, set $a = Q'_2 \/ r$. Then $a$ is bounded and bounded away from zero, and

$ lr(|a^(\( m \))|) lt.eq C_m r^m M^(1 - \( m + 1 \) c) lt.eq C_m r^m quad \( 1 lt.eq m lt.eq 4 \) $

by (4.13). The derivatives through order four of the cosine factor are $O \( r^m \)$ by the chain rule;
  those of the shift are bounded by $C_m r^m M^(- c) \/ K$ by (4.12). The product rule proves (4.19).
  This is the point requiring the fifth derivative of $Q_2$.

If $w arrow.r 0$, there is also the sharper fact

#[#set math.equation(numbering: n => "(4.20)")
 $ lr(|S' \( 0 \)|) / r arrow.r 2 pi . $ <loc:slow-nonzero-slope>]

Indeed $a \( 0 \)^2 = 1$ and $lr(|Q'_2 \( 0 \)|) = r$. The cosine with its shift equals $S \( 0 \) arrow.r 0$,
  so $lr(|sin \( 2 pi Q_2 \( 0 \) \)|) arrow.r 1$. Differentiating the factor $a^2$ contributes
  $O \( r w M^(1 - 2 c) \) = o \( r \)$; differentiating the shift contributes $O \( r M^(- c) \/ K \) =
  o \( r \)$. The remaining contribution is $- 2 pi sin \( 2 pi Q_2 \( 0 \) \) Q'_2 \( 0 \)$,
  which proves the assertion.

Take a subsequence on which $r \/ w$ has a limit. If this limit is positive, then $w arrow.r 0$,
  and Taylor’s formula gives

$ frac(S \( h \), w) = frac(S \( 0 \), w) + frac(S' \( 0 \), w) h + O \( r^2 \/ w \) . $

Here $r^2 \/ w lt.eq r arrow.r 0$. The coefficients are bounded; by (4.20),
  a further subsequence gives a limiting affine polynomial $A_0 \( h \)$ with nonzero slope.
  Multiply (4.14) by $r^2 w$. Its first term and its error tend to zero locally away from the fast poles,
  while its second term converges to $1 \/ A_0 \( h \)$ away from the one possible zero of $A_0$.
  Polynomial extraction would therefore give a polynomial of degree at most three equal to $1 \/ A_0$.
  Multiplication by $A_0$ and evaluation at its real zero is a contradiction.

We may consequently assume $r \/ w arrow.r 0$. Then $w = lr(|S \( 0 \)|)$ eventually, and

#[#set math.equation(numbering: n => "(4.21)")
 $ frac(S \( h \), S \( 0 \)) = 1 + O \( r \/ w \) arrow.r 1 quad
   upright("uniformly on ") \[ - 1 \, 1 \] . $ <loc:almost-constant-denominator>]

In particular $S$ has no zeros there for large $M$. Let $T_3 g$ be the cubic Taylor polynomial of $g$ at $0$.
  If $w$ stays bounded away from zero, the reciprocal derivative formula and (4.19) give $g^(\( 4 \)) =
  O \( r^2 \)$ uniformly. Thus $g - T_3 g = O \( r^2 \)$. Subtracting $T_3
  g$ from (4.14) leaves only the fast secant in the limit. It cannot agree with a cubic polynomial,
  by multiplication by its cosine and evaluation at a zero.

The last case is $w arrow.r 0$ and $r \/ w arrow.r 0$. To track also the possibly large remainder of $g$,
  differentiate explicitly:

#[#set math.equation(numbering: n => "(4.22)")
 $ g^(\( 4 \)) = 1 /
   r^2
   (frac(24 \( S' \)^4, S^5) - frac(36 \( S' \)^2 S'', S^4) + frac(6 \( S'' \)^2 + 8 S' S''', S^3) - S'''' /
   S^2) . $ <loc:reciprocal-fourth>]

By (4.19), (4.20), $S' \( h \) \/ S' \( 0 \) = 1 + O \( r \)$ uniformly.
  Together with (4.21), this makes the first term in (4.22) equal to

$ \( 24 + o \( 1 \) \) frac(S' \( 0 \)^4, r^2 S \( 0 \)^5) . $

Relative to that term, the remaining three displayed contributions are respectively $O \( w \)$, $O \( w^2 \)$,
  and $O \( w^3 \)$: for example the first ratio is bounded by $C lr(|S|) lr(|S''|) \/ lr(|S'|)^2 lt.eq C w$.
  All these comparisons are uniform on $\[ - 1 \, 1 \]$. Put

$ a_M = frac(S' \( 0 \)^4, r^2 S \( 0 \)^5) . $

Taylor’s formula with integral remainder, valid on both sides of zero, now yields

#[#set math.equation(numbering: n => "(4.23)")
 $ g \( h \) - T_3 g \( h \) = a_M h^4 + o \( lr(|a_M|) \) quad
   upright("uniformly on ") \[ - 1 \, 1 \] . $ <loc:quartic-remainder>]

If $lr(|a_M|) arrow.r oo$, subtract $T_3 g$ from (4.14) and divide by $a_M$.
  The fast term tends to zero away from its poles and the original error also tends to zero after this division.
  Polynomial extraction would identify a polynomial of degree at most three with $h^4$, which is impossible.
  Otherwise pass to a subsequence with $a_M arrow.r a in bb(R)$.
  Without division, the same subtraction gives a limiting identity between a cubic polynomial and

$ sec \( 2 pi \( z + b h \) \) + a h^4 . $

Move the quartic term to the polynomial side and multiply by the cosine.
  Evaluation at any of its zeros again gives a contradiction. These alternatives exhaust the vanishing-slope case.

=== 4.7 Uniform neighborhoods of successful sets <uniform-neighborhoods-of-successful-sets>

We have proved that every Hausdorff limit of nonempty closures of successful sets along $M arrow.r
  oo$ has measure zero. This implies the uniform assertion of 8,
  including the neighborhood width in its statement. Indeed, if the assertion failed for some $eta > 0$,
  then for every integer $n$ one could choose $M_n gt.eq n$ and a successful set $cal(S)_n
  subset \[ - 1 \, 1 \]$ such that

$ "Leb"_(bb(R)) { x : "dist" \( x \, cal(S)_n \) < 1 \/ n } > eta . $

These sets are nonempty. Compactness of the nonempty compact subsets of $\[ - 1 \, 1 \]$ for Hausdorff distance
  supplies a subsequence of their closures with limit $F$. For every $epsilon > 0$, eventually

$ { x : "dist" \( x \, cal(S)_n \) < 1 \/ n } subset { x : "dist" \( x \, F \) < epsilon } . $

Thus every $epsilon$-neighborhood of $F$ has measure at least $eta$.
  Continuity of Lebesgue measure from above for these bounded neighborhoods implies $"Leb"_(bb(R)) \( F \) gt.eq
  eta$, contrary to the result just proved. The empty successful set satisfies the claimed estimate automatically.
  This completes the proof of 8.

== 5 A product estimate across a fast bridge <bridge:section>

The second estimate compares observations near opposite ends of a long interval on which the transfer matrix grows
  almost at its maximum rate. The comparison comes from two transverse families of contracting graphs in the
  middle of the interval. All measures in this section are the normalized area measure,
  expressed in the coordinates $\( q_i \, q_(i - 1) \)$ when convenient,
  whenever they define probabilities or expectations. Label lengths and slice integrals use ordinary
  one-dimensional Lebesgue measure in their displayed coordinates.

For distinct integers $d \, e$, write

#[#set math.equation(numbering: n => "(5.1)")
 $ frak(h)_(d \, e) = 1 - frac(log_M ∥T_(d \, e)∥, lr(|d - e|)) . $ <bridge:shortfalls>]

These quantities belong to $\[ 0 \, 1 \]$. An observation with bound $\( R \, L \, B \)$ means a function of at
  most $R$ such quantities whose defining function on $\[ 0 \, 1 \]^R$ has absolute value at most $B$ and
  Lipschitz constant at most $L$ for the maximum norm. Allowing fewer than $R$ arguments is harmless.
  The defining functions and the integer indices may vary from one application to another,
  provided these bounds are preserved. Equivalently, these bounds may be imposed only on the realized range
  $cal(R) subset.eq \[ 0 \, 1 \]^R$ of the arguments. Indeed,
  a function $f$ on that range extends by $u mapsto inf_(v in cal(R)) \( f \( v \) + L ∥u - v∥_oo \)$;
  clipping this extension to $\[ - B \, B \]$ preserves its values on $cal(R)$ and its Lipschitz bound.

#thm([Theorem 5.1.])[
  (Product estimate across a fast bridge).  #emph[There are absolute constants $c_b in \( 0 \, 1 \)$, $kappa > 0$,
    and $sigma > 0$ with the following property. Fix observation bounds $\( R \, L \, B \)$ and a threshold $h >
    0$. For sufficiently large $M$ and sufficiently large $n = b - a$, let $W \,
    H$ be observations with these bounds, with $W gt.eq 0$. All indices occurring in one observation are within
    $kappa n$ of $a$, and all indices occurring in the other are within $kappa n$ of $b$.
    Either assignment of $W \, H$ to the two ends is allowed. Then
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E) #h(-0.16667em) [upright(bold(1))_({ log_M ∥T_(a \, b)∥ gt.eq c_b n }) W upright(bold(1))_({ H > h })]
   lt.eq C #scale(x: 120%, y: 120%)[\(] bb(E) W + M^(- sigma n) #scale(x: 120%, y: 120%)[\)]
   bb(P) \( H > h \/ 2 \) . $ <bridge:product>]

 The constants $c_b \, kappa \, sigma$ are independent of the observation bounds and threshold.
   The constant $C$ and the lower size requirements for $M \, n$ may depend on $\( R \, L \, B \)$ and $h$,
   but not on the indices, the defining functions, or the bridge location.]
] <bridge:theorem>

We first construct the graphs needed in the proof. Finite-time contracting directions and curves have been
  developed in stable-manifold constructions under weak hyperbolicity hypotheses [10].
  Here the graphs are level sets of a distant orbit coordinate, obtained from finite Dirichlet problems;
  we prove their extent and transverse distortion directly. We use $c = 0.98$ throughout the construction.
  A direction is understood modulo sign.

#thm([Lemma 5.2.])[
  (Contracting graphs and their distortion).  #emph[For sufficiently large $M$, suppose $B_(+) gt.eq 2$ and,
    at a fixed state with central coordinates $\( x \, y \) = \( q_0 \, q_(- 1) \)$,
#[#set math.equation(numbering: n => "(5.3)")
 $ D_l := ∥T_(0 \, l)∥ gt.eq M^(c l) wide \( 1 lt.eq l lt.eq B_(+) \) . $ <bridge:prefix-growth>]

 For at least one choice $j in { B_(+) - 1 \, B_(+) }$ there is a smooth graph through this state,
   parametrized by $q_(- 1) = y + r$, $lr(||) r lt.eq 1 \/ 4$, on which the lifted coordinate $q_j$ is fixed.
   On this graph,
#[#set math.equation(numbering: n => "(5.4)")
 $ lr(|q_p \( r \) - q_p \( 0 \)|) + lr(|frac(thin upright(d) q_p \( r \), thin upright(d) r)|) lt.eq
   C M^(- 0.8 \( p + 1 \)) wide \( 0 lt.eq p < j \) . $ <bridge:graph-contraction>]

 The corresponding endpoint pair at time $B_(+)$ changes by at most $C M^(- 0.8 \( B_(+) - 1 \))$.
   The partial derivative $partial q_j \/ partial q_0$, with $q_(- 1)$ held independent,
   is nonzero throughout the graph, and the absolute values of this partial derivative at any two points of the
   graph have a ratio between two absolute positive constants.]
  #emph[For a fixed choice of $j$, one may require the closed eligibility condition
#[#set math.equation(numbering: n => "(5.5)")
 $ lr(|partial q_j \/ partial q_0|) gt.eq D_(B_(+)) \/ 3 quad upright("at the initial point") . $ <bridge:row-choice>]

 The graphs depend continuously on eligible initial points.
   There is an identical backward statement, with almost horizontal graphs in $\( x \, y \)$,
   obtained by using $\( q_(- 1) \, q_0 \)$ as the ordered initial pair.]
] <bridge:graphs>

#proof[
  Let $s_l$ be a most contracted unit input direction for $T_(0 \, l)$.
    Since a single inverse step has norm at most $M$,
  $ ∥T_(0 \, l) s_(l + 1)∥ lt.eq M / D_(l + 1) . $
  The projection onto the expanded input direction for $T_(0 \, l)$ therefore gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ lr(|s_(l + 1) and s_l|) lt.eq frac(M, D_l D_(l + 1)) . $ <bridge:direction-step>]
  The absolute sine between two unoriented lines satisfies the triangle inequality.
    Summing (5.6), and using (5.3), yields
  $ lr(|s_(B_(+)) and s_l|) lt.eq C M^(1 - c - 2 c l) wide \( 1 lt.eq l lt.eq B_(+) \) . $
  Resolve $s_(B_(+))$ into the singular input directions for $T_(0 \, l)$.
    Using $D_l lt.eq M^l$ as well as its lower bound gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ ∥T_(0 \, l) s_(B_(+))∥ lt.eq M^(- c l) + C M^(l + 1 - c - 2 c l) lt.eq C M^(- 0.94 l) . $ <bridge:stable-prefix>]
  The last inequality follows from $1 - c + \( 1 - 2 c \) l = 0.02 - 0.96 l lt.eq - 0.94 l$ for $l gt.eq 1$.
  The first component of an input vector becomes the second component after one step.
    Thus (5.7) at $l = 1$ shows that $s_(B_(+))$ is nearly vertical.
    Let $t$ solve the variational recurrence with $t_(- 1) = 0$, $t_0 = 1$.
    Horizontal input has a projection bounded away from zero onto the expanded input direction for
    $T_(0 \, B_(+))$. For large $M$, at least one of the two coordinates $t_(B_(+))$ and $t_(B_(+) - 1)$
    consequently has magnitude at least $D_(B_(+)) \/ 3$. Choose the corresponding $j$.
    This proves that the two closed choices in (5.5) cover the states under consideration.
  The row of $T_(0 \, B_(+))$ selecting $q_j$ has norm at least $lr(|t_j|) gt.eq D_(B_(+)) \/ 3$,
    and its value on $s_(B_(+))$ has magnitude at most $D_(B_(+))^(- 1)$.
    Its kernel direction therefore differs from $s_(B_(+))$ by $O \( D_(B_(+))^(- 2) \)$.
    Normalize that direction so that its second component is 1, and let $U$ denote its variational solution.
    Then $U_(- 1) = 1$, $U_j = 0$, and, for $0 lt.eq p < j$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ lr(|U_p|) lt.eq C M^(- 0.9 \( p + 1 \)) . $ <bridge:linear-dirichlet>]
  Indeed, apply (5.7) at $l = p + 1$ to its main component. The error component is bounded by
  $ C M^(p + 1) D_(B_(+))^(- 2) lt.eq C M^(- 0.96 \( p + 1 \)) \, $
  because $p + 1 lt.eq B_(+)$. Normalization changes these bounds only by an absolute factor.
  We now solve the nonlinear boundary problem. Let $xi_p$ be the change of the lifted position $q_p$,
    with boundary data $xi_(- 1) = r$ and $xi_j = 0$. The tridiagonal matrix on $0 \, dots.h \, j -
    1$ with diagonal $v \( q_p \)$ and adjacent entries $- 1$ has determinant $t_j eq.not 0$. Its inverse is
  #[#set math.equation(numbering: n => "(5.9)")
   $ G_(l p) = t_(min \( l \, p \)) U_(max \( l \, p \)) . $ <bridge:green>]
  For completeness, the proposed column solves the homogeneous recurrence except at its source.
    At that source the output is 1, because the Wronskian $t_(p + 1) U_p -
    t_p U_(p + 1)$ equals its boundary value 1. Both boundary values of the proposed column are zero.
    This verifies (5.9) directly.
  Subtract the original orbit recurrence from the new one, and move the nonlinear Taylor remainder to the right
    side. With its sign absorbed into $F_p$, the boundary problem becomes
  #[#set math.equation(numbering: n => "(5.10)")
   $ xi_l = U_l r + sum_(p = 0)^(j - 1) G_(l p) F_p \( xi_p \) \, wide lr(|F_p \( u \)|) lt.eq C M u^2 \, quad
     lr(|F'_p \( u \)|) lt.eq C M lr(||) u . $ <bridge:fixed-point>]
  Use the finite-dimensional weighted norm
  $ ∥xi∥_(*) = max_(0 lt.eq l < j) M^(0.8 \( l + 1 \)) lr(|xi_l|) . $
  On a ball of fixed radius $R_0$, the Lipschitz bound for the nonlinear part of (5.10),
    before weighting its output at index $l$, is bounded by a constant depending on $R_0$ times
  $ sum_(p lt.eq l) M^(p - 0.9 \( l + 1 \) + 1 - 1.6 \( p + 1 \)) +
    sum_(p > l) M^(l - 0.9 \( p + 1 \) + 1 - 1.6 \( p + 1 \)) . $
  Here $lr(|t_p|) lt.eq M^p$ and (5.8) were used. After multiplying by $M^(0.8 \( l + 1 \))$, the exponents are,
    respectively,
  $ - 0.1 \( l + 1 \) - 0.6 \( p + 1 \) \, wide 1.8 \( l + 1 \) - 2.5 \( p + 1 \) . $
  Their sums tend uniformly to zero as $M$ tends to infinity, independently of $j$.
    The linear term $U r$ has bounded weighted norm for $lr(||) r lt.eq 1 \/ 4$.
    Choose $R_0$ larger than twice this bound and then choose $M$ large.
    The right side of (5.10) maps this ball to itself and is a contraction there.
    Its unique fixed point gives the desired graph on the whole parameter interval.
  The same estimates show that $I - G "diag" \( F'_p \( xi_p \) \)$ has a uniformly bounded inverse in this
    weighted norm. Multiplication by the original Dirichlet matrix identifies it with the varied linearized
    Dirichlet problem. Consequently that problem is invertible,
    and the finite-dimensional implicit function theorem gives smooth dependence on $r$.
    Differentiating (5.10) solves with right side $U$, which has bounded weighted norm. This proves (5.4).
    The contraction and its fixed point also depend continuously on the eligible initial data:
    all the coefficients are continuous there, and the contraction constant and ball are uniform.
    This proves the asserted continuous dependence.
  If $j = B_(+)$, the endpoint pair estimate follows directly from the fixed boundary value and (5.4).
    If $j = B_(+) - 1$, the recurrence and the fixed value of $q_(B_(+) - 1)$ give $xi_(B_(+)) = -
    xi_(B_(+) - 2)$, proving the same estimate without an extra factor of $M$.
  It remains to control transverse distortion. At the varied orbit let $t_p \( r \)$ again have initial values
    $t_(- 1) \( r \) = 0$, $t_0 \( r \) = 1$. Invertibility of the varied Dirichlet problem gives $t_j \( r \)
    eq.not 0$. The graph derivative $U_p \( r \) = thin upright(d) q_p \( r \) \/ thin upright(d)
    r$ has boundary values 1 and 0 at indices $- 1 \, j$ and solves that varied problem.
    Its Green diagonal is therefore $t_p \( r \) U_p \( r \)$.
    Differentiating the determinant of the varied Dirichlet matrix gives the exact identity
  #[#set math.equation(numbering: n => "(5.11)")
   $ frac(thin upright(d), thin upright(d) r) ln lr(|t_j \( r \)|) =
     sum_(p = 0)^(j - 1) t_p \( r \) U_p \( r \)^2 phi.alt'' \( q_p \( r \) \) . $ <bridge:determinant-distortion>]
  The derivative of a diagonal entry is $phi.alt'' \( q_p \( r \) \) U_p \( r \)$,
    explaining the second factor of $U_p$. Since $lr(|t_p \( r \)|) lt.eq M^p$ for every varied orbit,
    (5.4) bounds the absolute value of (5.11) by
  $ C sum_(p gt.eq 0) M^p M^(- 1.6 \( p + 1 \)) M = C sum_(p gt.eq 0) M^(- 0.6 \( p + 1 \)) lt.eq C . $
  Integration over $lr(||) r lt.eq 1 \/ 4$ proves the bounded-ratio claim.
  For backward evolution set $tilde(q)_p = q_(- 1 - p)$. The recurrence has the same form in these variables.
    At step $l$ its ordered pair is the swapped original pair at time $- l$,
    and the initial pair is $\( q_(- 1) \, q_0 \)$. Swapping coordinates is an isometry,
    so the backward growth hypotheses and all norm estimates are identical.
    The resulting graphs vary $q_0$ and have small slope in the $q_(- 1)$ coordinate. ◻
]

#proof[
  We first find many usable middle times. On the bridge event choose a unit vector realizing $∥T_(a \, b)∥$ and
    follow its norms along the bridge. The increments of their logarithms to base $M$ are at most 1,
    and their total shortfall from 1 is at most $\( 1 - c_b \) n$.
    By 3, if $c_b$ is sufficiently close to 1, at least $eta n$ indices $i$ in the middle third,
    for an absolute $eta > 0$, satisfy
  #[#set math.equation(numbering: n => "(5.12)")
   $ ∥T_(i \, i + l)∥ & gt.eq M^(c l) &  & \( 1 lt.eq l lt.eq b - i \) \,\
∥T_(i \, i - l)∥ & gt.eq M^(c l) &  & \( 1 lt.eq l lt.eq i - a \) . $ <bridge:middle-eligibility>]
  In detail, remove indices admitting a forward interval starting there or a forward interval ending there whose
    average log increment is less than $c$. The counting bound removes at most $C \( 1 - c_b \)
    n \/ \( 1 - c \)$ indices. At a retained index, the chosen vector bounds the forward operator norm on either
    kind of interval from below. On an interval ending at $i$,
    use also equality of the forward and inverse operator norms to obtain the second inequality in (5.12).
    For large $n$, the integer rounding of the middle third does not affect a fixed positive proportion.
  It suffices to establish (5.2), with a uniform constant, when the bridge indicator is replaced by the indicator
    of (5.12) for one fixed middle index $i$. Indeed, the bridge indicator is at most $\( eta n \)^(- 1)$ times
    the sum of these middle-index indicators; multiplying by the nonnegative weight and summing then costs only an
    absolute constant.
  Shift $i$ to time 0. Put $B_(+) = b - i$ and $B_(-) = i - a$; both are at least $n \/ 3 - O \( 1 \)$.
    Apply 10 forward and backward. There are two possible endpoint-coordinate choices in each direction.
    We work with one fixed pair of choices and eventually sum over the four possibilities.
    Write $Q \( x \, y \)$ for the lifted forward coordinate held fixed,
    and $F \( x \, y \)$ for the lifted backward coordinate held fixed.
    On forward graphs $Q_x eq.not 0$; on backward graphs $F_y eq.not 0$.
    For large $M$, all forward slopes $lr(|thin upright(d) x \/ thin upright(d) y|)$ and backward slopes
    $lr(|thin upright(d) y \/ thin upright(d) x|)$ are less than a common absolute number $a_0 < 1 \/ 2$.
    The relevant transverse partial derivatives have uniformly bounded absolute ratios along each graph.
  ===== 5.1 Transport of endpoint observations. <transport-of-endpoint-observations.>
  Along a forward graph the endpoint pair at time $b$ changes by at most $C M^(- 0.8 \( B_(+) - 1 \))$.
    A single forward or inverse map is $M$-Lipschitz on the lifted coordinates.
    Thus pair differences throughout the window of radius $kappa n$ about $b$ are at most
  $ C M^(kappa n + O \( 1 \)) M^(- 0.8 \( B_(+) - 1 \)) . $
  The one-step matrix difference is at most $C M$ times the position difference.
    Since forward and inverse product norms agree, the endpoints of each observation interval may first be put in
    increasing order. For a product of length at most $2 kappa n$,
    the telescoping product identity therefore bounds its matrix difference by a length factor times
  $ C M^(3 kappa n + O \( 1 \)) M^(- 0.8 \( B_(+) - 1 \)) . $
  Every product norm compared here is at least 1. The elementary inequalities $lr(|∥∥ A - ∥∥ B|) lt.eq ∥A -
    B∥$ and $lr(|log u - log v|) lt.eq lr(|u - v|)$ for $u \, v gt.eq
    1$ consequently give the same exponential control for the normalized logarithms in (5.1).
    The positive integer interval lengths in their denominators cause no additional loss.
  Choose fixed $kappa \, sigma > 0$ with
  #[#set math.equation(numbering: n => "(5.13)")
   $ 3 kappa + sigma < 0.8 \/ 3 . $ <bridge:error-exponents>]
  The strict margin absorbs the length factor and the bounded powers of $M$ when $n$ is large.
    After increasing the size requirements to account for the observation bounds,
    each observation at the forward end changes by at most
  #[#set math.equation(numbering: n => "(5.14)")
   $ delta_n = C M^(- sigma n) $ <bridge:observation-error>]
  along a forward graph. The same statement holds for an observation at the backward end along a backward graph.
    All these estimates are uniform in the chosen middle index, endpoint-coordinate choices,
    and observation indices. Increase $M \, n$ further so that $delta_n < h \/ 2$.
  2 shows the two transverse coordinate families used next.
    It depicts the change of variables, not the motion of an orbit.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (5.74, 3.69), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (6.027, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#acacac"))))
  content((6.027, 0), [#text(size: 9pt)[$x$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 3.977), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#acacac"))))
  content((0, 3.977), [#text(size: 9pt)[$y$]], anchor: "south", padding: 0.1176cm)
  line((0, 1.845), (5.74, 1.845), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((0, 1.845), [#text(size: 9pt)[$y_c$]], anchor: "east", padding: 0.1176cm)
  line((4.428, 0), (4.428, 3.69), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((4.428, 0), [#text(size: 9pt)[$u$]], anchor: "north", padding: 0.1176cm)
  bezier((0.164, 0.9594), (5.576, 1.238), (2.05, 1.033), (3.772, 1.173), stroke: (paint: rgb("#a75224"), thickness: 0.8pt, miter-limit: 10))
  bezier((0.164, 1.656), (5.576, 2.017), (2.05, 1.747), (3.772, 1.968), stroke: (paint: rgb("#a75224"), thickness: 0.8pt, miter-limit: 10))
  bezier((0.164, 2.386), (5.576, 2.657), (2.05, 2.476), (3.772, 2.591), stroke: (paint: rgb("#a75224"), thickness: 0.8pt, miter-limit: 10))
  bezier((2.46, 0.1476), (2.509, 3.551), (2.345, 1.107), (2.608, 2.206), stroke: (paint: rgb("#1c4b76"), thickness: 1.2pt, miter-limit: 10))
  circle((2.517, 1.845), radius: 0.05997, fill: rgb("#1c4b76"), stroke: none)
  content((2.517, 1.845), [#text(fill: rgb("#1c4b76"))[#text(size: 9pt)[$s$]]], anchor: "north-west", padding: 0.1176cm)
  line((2.419, 1.099), (2.567, 2.55), stroke: (paint: rgb("#1c4b76"), thickness: 0.8pt, miter-limit: 10))
  content((2.255, 2.567), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#1c4b76"))[#text(size: 9pt)[$D_s$]]]])], anchor: "east")
  circle((4.428, 1.968), radius: 0.05997, fill: rgb("#a75224"), stroke: none)
  content((4.428, 1.968), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#a75224"))[#text(size: 9pt)[$Theta_s(u,y)$]]]])], anchor: "west")
  content((2.608, 3.542), [#text(fill: rgb("#1c4b76"))[#text(size: 9pt)[forward $Q$-level]]], anchor: "south", padding: 0.1176cm)
  content((4.707, 2.665), [#text(fill: rgb("#a75224"))[#text(size: 9pt)[backward $F$-levels]]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 2: Coordinate schematic for the bridge change of variables, not an orbit plot. A forward level is labelled at $y = y_c$ by $s$; the eligible slice $D_s$ is swept across the square along transverse backward levels to the coordinate $\( u \, Theta_s \( u \, y \) \)$. ],
  ) <bridge:sweep-figure>
  ===== 5.2 Forward labels and their area. <forward-labels-and-their-area.>
  Assume first that $H$ is at the forward end and $W$ at the backward end.
    Cover the middle-time torus by the finitely many closed squares of a grid of side $s_0 =
    1 \/ 32$ in a fundamental domain. Overlaps on boundaries have area zero and cause no problem for an upper
    bound. Fix one square $I_x times I_y$ and choose $y_c in I_y$.
    All position functions in this square and its small neighborhood are computed from the same real lifted
    recurrence starting at $\( x \, y \)$.
  Every forward graph through an eligible point in the square extends over all of $I_y$, with a margin,
    since its parameter range has length $1 \/ 2$ and $s_0 < 1 \/ 4$.
    Label it by its intercept $s$ at $y = y_c$ and write it as $\( X \( s \, y \) \, y \)$.
    Two such graphs which meet have the same value of $Q$ and coincide locally because $Q_x eq.not 0$.
    They then coincide on the whole common interval: the coincidence set is both open, by implicit uniqueness,
    and closed, by continuity. In particular distinct labels have disjoint images at every fixed $y$.
  Let $E$ be the labels of forward graphs through forward-eligible points of this square for which $H gt.eq h$.
    We use closed eligibility conditions, including (5.5). They and $H gt.eq
    h$ define a compact subset of the closed square. Continuous dependence of the graph in 10 makes its intercept
    a continuous function of the initial point. Thus $E$ is compact.
    The graph is uniquely determined by its intercept, so these constructions define $X$ unambiguously on $E times I_y$.
  For these labels, every point of the graph over $I_y$ has $H > h \/ 2$ by (5.14). The identity
  $ Q \( X \( s \, y \) \, y \) = Q \( s \, y_c \) $
  and implicit differentiation give
  #[#set math.equation(numbering: n => "(5.15)")
   $ X_s \( s \, y \) = frac(Q_x \( s \, y_c \), Q_x \( X \( s \, y \) \, y \)) . $ <bridge:label-jacobian>]
  The derivative in (5.15) is interpreted through a local smooth extension when $E$ has empty interior;
    the existence of that extension is justified below. The distortion assertion of 10 bounds its absolute value
    above and below by positive constants.
  The map $\( s \, y \) mapsto \( X \( s \, y \) \, y \)$ on $E times
    I_y$ is injective and has Jacobian comparable to 1. Its image stays in a fixed bounded lift:
    the small slope bounds the displacement from the square by an absolute constant.
    Projection of this bounded lift to the torus has bounded multiplicity. Change of variables therefore yields
  #[#set math.equation(numbering: n => "(5.16)")
   $ lr(||) E lt.eq C bb(P) \( H > h \/ 2 \) . $ <bridge:label-area>]
  The factor $lr(|I_y|) = s_0$ has been absorbed into the constant.
  ===== 5.3 A transverse sweep for the weight. <a-transverse-sweep-for-the-weight.>
  Fix $s in E$. Let $D_s subset.eq I_y$ consist of the parameters $y$ for which
    $z \( y \) = \( X \( s \, y \) \, y \)$ lies in the square and is backward-eligible in the fixed backward
    endpoint choice. This is a compact set. Carry each $z \( y \)$ along its backward graph to first coordinate $u
    in I_x$, and denote the resulting second coordinate by $Theta_s \( u \, y \)$.
    The carry is defined throughout $I_x$, with a margin.
  For each fixed $u$, the map $y mapsto Theta_s \( u \, y \)$ is injective on $D_s$.
    If two carried points agreed, their backward graphs would coincide throughout $I_x$ by regular-level
    uniqueness. A single such graph cannot meet the chosen forward graph in two distinct points:
    two intersections would satisfy both $lr(|Delta x|) lt.eq a_0 lr(|Delta y|)$ and $lr(|Delta y|) lt.eq
    a_0 lr(|Delta x|)$, forcing equality of the points. This proves the asserted injectivity.
  The equation defining the carry is
  $ F \( u \, Theta_s \( u \, y \) \) = F \( X \( s \, y \) \, y \) . $
  Differentiation with respect to the starting parameter gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ partial_y Theta_s \( u \, y \) =
     frac(F_y \( z \( y \) \) + F_x \( z \( y \) \) X_y \( s \, y \), F_y \( u \, Theta_s \( u \, y \) \)) .
     $ <bridge:sweep-jacobian>]
  The ratio of the two $F_y$ terms is uniformly bounded above and below along the backward graph.
    Moreover $lr(|F_x \/ F_y|) lt.eq a_0$ at its starting point, since $- F_x \/ F_y$ is its slope,
    and $lr(|X_y|) lt.eq a_0$. Hence the absolute value of (5.17) is uniformly bounded above and below by positive
    constants.
  The endpoint observation estimate gives, for all $u in I_x$ and $y in D_s$,
  $ W \( X \( s \, y \) \, y \) lt.eq W \( u \, Theta_s \( u \, y \) \) + delta_n . $
  Apply change of variables to the injective map $\( u \, y \) mapsto \( u \, Theta_s \( u \, y \) \)$ on $I_x
    times D_s$. Its image lies in a bounded lift. Since $W gt.eq 0$,
    its integral over that image is at most a fixed multiple of $bb(E) W$.
    Using (5.17) and then dividing by $lr(|I_x|)$ gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ integral_(D_s) W \( X \( s \, y \) \, y \) thin thin upright(d) y lt.eq
     C #scale(x: 120%, y: 120%)[\(] bb(E) W + M^(- sigma n) #scale(x: 120%, y: 120%)[\)] .
     $ <bridge:conditional-weight>]
  ===== 5.4 Changes of variables on the eligible subsets. <changes-of-variables-on-the-eligible-subsets.>
  Here are details ensuring that the preceding changes of variables do not require the eligible sets to have
    interior. Consider first one forward graph with label $s$.
    It is a compact regular level arc over $I_y$ and extends with a margin beyond this interval.
    The partial derivative $Q_x$ is nonzero on the arc. The implicit function theorem in finitely many overlapping
    charts along the arc therefore continues it smoothly for intercepts in an open neighborhood of $s$.
    The continued level is prescribed by $Q \( s' \, y_c \)$ for each nearby intercept $s'$.
    Uniqueness in the overlapping charts makes these local continuations consistent.
    Every nearby eligible label follows the same continuation,
    because its regular graph passes through that intercept. Thus $X$ on $E times
    I_y$ is locally the restriction of a smooth function of $\( s \, y \)$, and (5.15) holds at all required points.
  For the transverse sweep, fix $s$ and a point of $D_s$. Its backward graph is likewise a compact regular arc,
    with $F_y eq.not 0$, extending with margin over $I_x$. The same continuation argument applies to the smoothly
    varying starting points $\( X \( s \, y \) \, y \)$ on the fixed forward graph.
    It gives a local smooth extension of $Theta_s \( u \, y \)$ in both variables,
    agreeing with all nearby eligible carries by uniqueness. The maps used in both area comparisons are
    consequently restrictions of local smooth diffeomorphisms, with the displayed nonvanishing Jacobians.
  A countable cover by such charts can be split into disjoint Borel pieces.
    On each piece ordinary change of variables applies to its measurable subset;
    the images of the pieces are disjoint because the full restricted maps are injective.
    Summing proves the formulas on the compact eligible domains.
    This also establishes the measurability of all integrands and swept regions used above.
    No extension of eligibility to a neighborhood is assumed.
  ===== 5.5 Completion of the area comparison. <completion-of-the-area-comparison.>
  Every point of the fixed square satisfying both eligibility conditions and $H >
    h$ belongs to a forward graph with label in $E$. Change variables from $x$ to this label at each $y$,
    using (5.15). Drop conditions other than square membership and backward eligibility,
    which is allowed because the weight is nonnegative. The desired weighted integral over this square and this
    pair of choices is bounded by
  $ C integral_E integral_(D_s) W \( X \( s \, y \) \, y \) thin thin upright(d) y thin thin upright(d) s . $
  Combining (5.18), (5.16) bounds this by the right side of (5.2).
  If $H$ is at the backward end, begin instead with the labels of the almost horizontal backward graphs and sweep
    them in the $x$ direction to bound their label measure by $bb(P) \( H > h \/ 2 \)$.
    For each such graph, transport its eligible points along the almost vertical forward graphs to estimate $W$.
    The proof just given applies with $x \, y$ and $Q \, F$ interchanged:
    the graph extents, distortion bounds, small-slope injectivity argument,
    and local chart construction are the same. This proves the estimate for the other assignment of the two
    observations as well.
  Finally sum over the finitely many squares and the at most four endpoint-coordinate choices.
    The constants remain uniform. Average over the usable middle indices as explained after (5.12).
    This establishes (5.2) and completes the proof. ◻
]

== 6 Product distances and measures across scales <sec:scales>

Suppose, toward a contradiction, that there is a sequence of parameters $k arrow.r +
  oo$ for which the top Lyapunov exponent vanishes almost everywhere.
  All limits in this section are taken along this sequence, passing to subsequences when indicated,
  except where a fixed-parameter limit in orbit length is explicitly specified.
  The structural constants in Theorem 3.1, Theorem 5.1 are fixed throughout;
  the bridge estimate’s auxiliary constants may depend on its observation bounds.
  Use the growth semimetric $g$ and expected shortfall $e_n$ from (2.6);
  their parameter dependence remains suppressed. At each parameter in the sequence,
  the zero-exponent assumption and bounded convergence give

#[#set math.equation(numbering: n => "(6.1)")
 $ e_n arrow.r 1 wide \( n arrow.r oo \) . $ <scale:long-deficit>]

By contrast, the shortfall at every fixed length tends to zero as the parameter grows.
  We will select a dyadic range in which the shortfall first increases,
  and sum the loss between each whole interval and its two halves over that range.
  This sum telescopes, but its limiting mass must still be controlled near arrays with one constant growth rate.
  The local tests and measures below are designed to retain that mass.

=== 6.1 Four-point comparison and truncation <four-point-comparison-and-truncation>

#thm([Lemma 6.1.])[
  (Four-point comparison).  #emph[Fix a base index $i$ and write
$ D_j = ∥T_(i \, j)∥ \, wide R_(j p) = M^(g \( j \, p \) - g \( i \, j \) - g \( i \, p \)) . $

 There is an absolute constant $C_0 gt.eq 1$ such that, for every orbit, every sufficiently large parameter,
   and every choice of integer indices,
#[#set math.equation(numbering: n => "(6.2)")
 $ R_(j p) lt.eq C_0 max { R_(j l) \, R_(l p) } . $ <scale:R-fourpoint>]

]
] <scale:fourpoint>

#proof[
  Choose a most expanded unit input direction $a_j$ for $T_(i \, j)$; if $D_j = 1$,
    any singular direction may be used. Set
  $ Q_(j p) = max { \| a_j and a_p \| \, D_j^(- 2) \, D_p^(- 2) } . $
  We claim
  #[#set math.equation(numbering: n => "(6.3)")
   $ Q_(j p) lt.eq R_(j p) lt.eq 3 Q_(j p) . $ <scale:R-comparison>]
  To obtain the sine lower bound, use a unit input at the base perpendicular to $a_p$.
    Its norm at $p$ is $D_p^(- 1)$, whereas its norm at $j$ is at least $D_j \| a_j and a_p \|$.
    The transfer from $p$ to $j$ therefore has norm at least $D_j D_p \| a_j and a_p \|$. The inequalities
  $ ∥T_(p \, j)∥ gt.eq D_j \/ D_p \, wide ∥T_(p \, j)∥ gt.eq D_p \/ D_j $
  give the other two lower bounds; the second uses equality of the norms of a determinant-one matrix and its inverse.
  For the upper bound, transport a unit vector from $p$ back to the base.
    Its components along $a_p$ and $a_p^perp$ have absolute values at most $D_p^(- 1)$ and $D_p$, respectively. Also
  $ ∥T_(i \, j) a_p^perp∥ lt.eq D_j \| a_j and a_p \| + D_j^(- 1) . $
  It follows that
  $ R_(j p) lt.eq D_p^(- 2) + \| a_j and a_p \| + D_j^(- 2) \, $
  proving (6.3). By (2.8), $Q_(j p) lt.eq 2 max { Q_(j l) \, Q_(l p) }$, so $C_0 = 6$ is permissible. ◻
]

#thm([Lemma 6.2.])[
  (Truncation of a cancellation).  #emph[Fix integers $i$, $n gt.eq 1$, and $1 lt.eq s lt.eq n$, and put
$ L = i - n \, quad R = i + n \, quad L' = i - s \, quad R' = i + s \, $

$ D = n - min { g \( i \, L \) \, g \( i \, R \) } \, wide ell = g \( i \, L \) + g \( i \, R \) - g \( L \, R \) . $

 Use the quantities $R_(u v)$ of 11 with base $i$. Then
#[#set math.equation(numbering: n => "(6.4)")
 $ g \( i \, L' \) \, g \( i \, R' \) & gt.eq s - D \,\
R_(L' R') & lt.eq C_0^2 max { R_(L R) \, M^(- 2 s + 2 D) } . $ <scale:cut-wings>]

 There is a constant $A$ independent of the parameter and indices such that the cut cancellation loss satisfies
#[#set math.equation(numbering: n => "(6.5)")
 $ g \( i \, L' \) + g \( i \, R' \) - g \( L' \, R' \) gt.eq min { ell \, 2 s - 2 D } - A \, $ <scale:cut-loss>]

 and consequently
#[#set math.equation(numbering: n => "(6.6)")
 $ g \( L' \, R' \) lt.eq 2 s - min { ell \, 2 s - 2 D } + A . $ <scale:cut-full>]

]
] <scale:truncation>

#proof[
  The triangle inequality and (2.7) give
  $ g \( i \, L' \) gt.eq g \( i \, L \) - g \( L \, L' \) gt.eq \( n - D \) - \( n - s \) = s - D \, $
  and similarly on the right. In particular,
  $ R_(L L') lt.eq M^(\( n - s \) - \( n - D \) - \( s - D \)) = M^(- 2 s + 2 D) \, wide R_(R R') lt.eq
    M^(- 2 s + 2 D) . $
  Apply (6.2) twice along the chain $L' \, L \, R \, R'$ to obtain (6.4).
    Taking negative base-$M$ logarithms gives (6.5), with any fixed upper bound for $2 log_M C_0$ as $A$.
    Such a bound is uniform after imposing, for example, $M gt.eq 2$.
    Finally, each cut wing has length at most $s$, which yields (6.6). ◻
]

#thm([Lemma 6.3.])[
  (Doubling bound).  #emph[For all sufficiently large parameters and every integer $n gt.eq 1$,
#[#set math.equation(numbering: n => "(6.7)")
 $ e_n lt.eq e_(2 n) lt.eq C e_n + C / n \, $ <scale:doubling-equation>]

 with a constant independent of $n$ and the parameter.]
] <scale:doubling>

#proof[
  Use the notation of 12. Both $D$ and $ell$ are nonnegative, and $ell lt.eq 2 n$.
    Let $delta > 0$ be the fixed constant in 4. Choose a fixed $H$ sufficiently large that
  $ ell > H \( 1 + D \) \, wide s = floor.l ell \/ 2 floor.r quad arrow.r.double quad s gt.eq 1 \, quad 2 D +
    A lt.eq delta s . $
  This is possible since $s gt.eq ell \/ 2 - 1$. Also $s lt.eq n$ and $2 s lt.eq ell$. Thus (6.4), (6.6) imply
  $ min { g \( i \, i - s \) \, g \( i \, i + s \) } gt.eq \( 1 - delta \) s \, wide g \( i - s \, i + s \) lt.eq
    2 D + A lt.eq delta s . $
  This is the event bounded by 4, with spacing $s$. On the part where this integer $s$ is selected, $ell < 2 s +
    2$. Writing the constants of that theorem as $C_(upright("can")) \, gamma > 0$, we obtain
  $ bb(E) #scale(x: 120%, y: 120%)[\[] ell thin upright(bold(1))_({ ell > H \( 1 + D \) })
    #scale(x: 120%, y: 120%)[\]] lt.eq C_(upright("can")) sum_(s = 1)^oo \( 2 s + 2 \) e^(- gamma s) lt.eq C . $
  The complementary contribution is at most $H \( 1 + bb(E) D \)$, hence
  #[#set math.equation(numbering: n => "(6.8)")
   $ bb(E) ell lt.eq C \( 1 + bb(E) D \) . $ <scale:mean-cancellation>]
  Stationarity gives
  $ bb(E) D lt.eq bb(E) \[ n - g \( i \, L \) \] + bb(E) \[ n - g \( i \, R \) \] = 2 n e_n \, wide e_(2 n) =
    e_n + frac(bb(E) ell, 2 n) . $
  These identities and (6.8) prove the result. In particular the lower inequality uses only $ell gt.eq 0$. ◻
]

=== 6.2 Selecting the first growing deficit <selecting-the-first-growing-deficit>

#thm([Lemma 6.4.])[
  (Critical scales).  #emph[Along the assumed zero-exponent parameter sequence, there are powers of two $n_0 =
    n_0 \( K \)$ and $N = N \( K \) > n_0$, and numbers $epsilon.alt = e_N$, such that
#[#set math.equation(numbering: n => "(6.9)")
 $ n_0 arrow.r oo \, wide epsilon.alt arrow.r 0 \, wide epsilon.alt n_0 arrow.r oo \, $ <scale:selected-limits>]

 and, for every fixed integer $m in bb(Z)$ (once the lengths below are positive integers),
#[#set math.equation(numbering: n => "(6.10)")
 $ e_(2^m n_0) = o \( epsilon.alt \) \, wide e_(2^m N) = O_m \( epsilon.alt \) . $ <scale:selected-boundaries>]

 All scale sums below run over powers of two.]
] <scale:selection>

#proof[
  First, for every fixed integer $a gt.eq 1$, we have $e_a arrow.r 0$ as $K arrow.r oo$.
    To see this, fix $0 < zeta < 1$. The uniform marginal law of each $q_i$ implies
  $ bb(P) { \| v \( q_i \) \| < M^(1 - zeta) } arrow.r 0 . $
  Indeed $v \( x \) = 2 + K cos \( 2 pi x \)$, and the length of the set on which $\| cos \( 2 pi x \) \|
    lt.eq \( M^(1 - zeta) + 2 \) \/ K$ tends to zero. A union bound therefore shows that,
    with probability tending to one, all $a$ coefficients in the product satisfy $\| v \( q_i \) \| gt.eq
    M^(1 - zeta)$. Start the linear recurrence with $\( u_0 \, u_(- 1) \) = \( 1 \, 0 \)$.
    On this event, for $M$ large, induction gives
  $ \| u_(j + 1) \| gt.eq \( M^(1 - zeta) - 1 \) \| u_j \| gt.eq \| u_j \| quad \( 0 lt.eq j < a \) . $
  Consequently $g \( 0 \, a \) \/ a gt.eq log_M \( M^(1 - zeta) - 1 \)$ there.
    The deficit always lies in $\[ 0 \, 1 \]$, so $limsup_(K arrow.r oo) e_a lt.eq zeta$.
    Letting $zeta arrow.b 0$ proves the claim.
  Choose powers of two $n_0 arrow.r oo$ sufficiently slowly that $e_(n_0) arrow.r 0$,
    by diagonal selection over the fixed lengths $1 \, 2 \, 4 \, dots.h$. Set
  $ theta_K = \( n_0^(- 1) + e_(n_0) \)^(1 \/ 2) . $
  For all sufficiently large $K$, $e_(n_0) < theta_K < 1$. By (6.1), there is a first power of two $N gt.eq
    n_0$ for which $e_N > theta_K$. It satisfies $N > n_0$ and $e_(N \/ 2) lt.eq theta_K$. Applying 13 once gives
  $ theta_K < epsilon.alt = e_N lt.eq C theta_K + C \/ n_0 arrow.r 0 . $
  Also $epsilon.alt n_0 gt.eq theta_K n_0 gt.eq sqrt(n_0) arrow.r oo$. For fixed $m gt.eq 0$, iteration of 13 yields
  $ e_(2^m n_0) lt.eq C_m \( e_(n_0) + n_0^(- 1) \) = C_m theta_K^2 = o \( epsilon.alt \) \, $
  and
  $ e_(2^m N) lt.eq C_m \( epsilon.alt + N^(- 1) \) = O_m \( epsilon.alt \) . $
  For a fixed negative $m$, the lengths $2^m n_0$ and $2^m N$ are eventually positive integers.
    Dyadic monotonicity bounds their deficits by $e_(n_0) = o \( epsilon.alt \)$ and $e_N = epsilon.alt$,
    respectively. This proves every assertion. ◻
]

=== 6.3 A compact space of distance arrays <a-compact-space-of-distance-arrays>

The next construction records shortfall increments as measures on rescaled distance arrays.
  Its output will be locally finite limits away from affine arrays, together with a dilation balance;
  the discarded affine part requires separate control in the final argument.

Let $cal(D) = bb(Z) \[ 1 \/ 2 \]$ denote the dyadic rational numbers.
  Define $X$ to be the set of symmetric semimetric arrays $d : cal(D) times cal(D) arrow.r \[ 0 \, oo \)$ satisfying

#[#set math.equation(numbering: n => "(6.11)")
 $ d \( s \, t \) lt.eq \| s - t \| + 2 . $ <scale:ambient-bound>]

Give $X$ the topology of pointwise convergence. It is a closed subset of a countable product of compact intervals,
  and hence is compact and metrizable. Its compact subset of affine arrays is

$ cal(A) = { d_w : 0 lt.eq w lt.eq 1 } \, wide d_w \( s \, t \) = w \| t - s \| . $

These are precisely the arrays of this form that belong to $X$:
  the bound at arbitrarily large separations forces $w lt.eq 1$. Write $cal(U) = X \\ cal(A)$.

For a positive integer $n$, define the random array

#[#set math.equation(numbering: n => "(6.12)")
 $ g_n \( s \, t \) = frac(g \( floor.l n s floor.r \, floor.l n t floor.r \), n) wide \( s \, t in cal(D) \) .
   $ <scale:rescaled-array>]

It belongs to $X$, since its distances are at most $\| s - t \| + 1 \/ n$. Introduce the finite measures

#[#set math.equation(numbering: n => "(6.13)")
 $ mu_K = epsilon.alt^(- 1) sum_(n_0 lt.eq n < N\
n upright(" a power of ") 2) "Law" \( g_n \) \, wide nu_K = epsilon.alt^(- 1) "Law" \( g_N \) \, wide xi_K =
  epsilon.alt^(- 1) "Law" \( g_(n_0) \) . $ <scale:prelimit-measures>]

Their total masses need not remain bounded. We will obtain limits on $cal(U)$ by controlling local departures from
  affinity.

For an interval $I = \[ s \, t \]$ with distinct dyadic endpoints, let $I_l \,
  I_r$ be its left and right halves and define continuous functions on $X$ by

#[#set math.equation(numbering: n => "(6.14)")
 $ h \( I \) = 1 - frac(d \( s \, t \), t - s) \, wide J \( I \) = h \( I \) -
   frac(h \( I_l \) + h \( I_r \), 2) \, wide V \( I \) = #scale(x: 120%, y: 120%)[\(] h \( I_l \) -
   h \( I_r \) #scale(x: 120%, y: 120%)[\)]^2 . $ <scale:tests>]

The functions $J \( I \)$ and $V \( I \)$ are nonnegative on all of $X$.
  The first assertion is the triangle inequality. The shortfall $h \( I \)$ itself need not be nonnegative on all
  of $X$. It does belong to $\[ 0 \, 1 \]$ on a sample $g_n$ whenever the endpoints multiplied by $n$ are
  integers. For any fixed dyadic interval, this alignment holds at every scale $n gt.eq
  n_0$ occurring here once $K$ is sufficiently large.

#thm([Lemma 6.5.])[
  (Bounds for local tests).  #emph[Let $I$ have dyadic endpoints and length $p = 2^m$, where $m in bb(Z)$ is fixed. Then
#[#set math.equation(numbering: n => "(6.15)")
 $ integral #scale(x: 120%, y: 120%)[\(] J \( I \) + V \( I \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d)
   mu_K = O_I \( 1 \) . $ <scale:sum-test-bound>]

 Uniformly over the individual dyadic scales $n_0 lt.eq n lt.eq N$,
#[#set math.equation(numbering: n => "(6.16)")
 $ epsilon.alt^(- 1) bb(E) #scale(x: 120%, y: 120%)[\[] h \( I \) \( g_n \) + J \( I \) \( g_n \) +
   V \( I \) \( g_n \) #scale(x: 120%, y: 120%)[\]] = O_I \( 1 \) . $ <scale:individual-test-bound>]

 At the initial scale the stronger bound holds:
#[#set math.equation(numbering: n => "(6.17)")
 $ epsilon.alt^(- 1) bb(E) #scale(x: 120%, y: 120%)[\[] h \( I \) \( g_(n_0) \) + J \( I \) \( g_(n_0) \) +
   V \( I \) \( g_(n_0) \) #scale(x: 120%, y: 120%)[\]] = o \( 1 \) . $ <scale:initial-test-bound>]

 All three statements concern sufficiently large $K$, so that the indicated endpoints and half-endpoints align.]
] <scale:local-mass>

#proof[
  By stationarity,
  $ bb(E) h \( I \) \( g_n \) = e_(p n) \, wide bb(E) J \( I \) \( g_n \) = e_(p n) - e_(p n \/ 2) . $
  Summation over consecutive dyadic scales gives the exact identity
  #[#set math.equation(numbering: n => "(6.18)")
   $ sum_(n_0 lt.eq n < N\
n upright(" a power of ") 2) bb(E) J \( I \) \( g_n \) = e_(p N \/ 2) - e_(p n_0 \/ 2) . $ <scale:J-telescope>]
  By 14 and dyadic monotonicity, its nonnegative right side is $O_I \( epsilon.alt \)$.
  Put $a = h \( I_l \)$, $b = h \( I_r \)$, and $macron(h) = \( a + b \) \/ 2$.
    At the aligned sampled arrays, $0 lt.eq macron(h) lt.eq h \( I \) lt.eq 1$, and therefore
  $ frac(V \( I \), 4) & = frac(a^2 + b^2, 2) - macron(h)^2\
 & lt.eq frac(a^2 + b^2, 2) - h \( I \)^2 + 2 J \( I \) . $
  Write $b_q = bb(E) #scale(x: 120%, y: 120%)[\[] \( 1 - g \( 0 \, q \) \/ q \)^2
    #scale(x: 120%, y: 120%)[\]]$ for integer $q gt.eq 1$. By stationarity and another dyadic telescoping,
  $ 1 / 4 sum_n bb(E) V \( I \) \( g_n \) lt.eq b_(p n_0 \/ 2) - b_(p N \/ 2) +
    2 #scale(x: 120%, y: 120%)[\(] e_(p N \/ 2) - e_(p n_0 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
    b_(p n_0 \/ 2) + 2 e_(p N \/ 2) . $
  Here and in this display only, the unqualified sum is over the scales in (6.18).
    Since $0 lt.eq b_q lt.eq e_q$, the last expression is $O_I \( epsilon.alt \)$. This proves (6.15).
  At any single aligned scale, $J \( I \) lt.eq h \( I \)$ and $V \( I \) = \( a - b \)^2 lt.eq a + b$.
    Hence the expectation in (6.16) is at most $2 e_(p n) + 2 e_(p n \/ 2)$.
    Dyadic monotonicity bounds these terms by the corresponding terminal-scale deficits,
    which are $O_I \( epsilon.alt \)$ by 14. At $n = n_0$ they are $o \( epsilon.alt \)$, again by that lemma,
    including its consequence for negative shifts. ◻
]

#thm([Lemma 6.6.])[
  (Detection of affinity).  #emph[As $I$ ranges over intervals with dyadic endpoints and power-of-two length,
    the common zero set of $J \( I \) + V \( I \)$ is exactly $cal(A)$.
    Consequently, every compact subset $F subset cal(U)$ admits finitely many such intervals $I_1 \, dots.h \,
    I_b$ and a number $c_F > 0$ such that
#[#set math.equation(numbering: n => "(6.19)")
 $ sum_(a = 1)^b #scale(x: 120%, y: 120%)[\(] J \( I_a \) + V \( I_a \) #scale(x: 120%, y: 120%)[\)] gt.eq
   c_F quad upright("on ") F . $ <scale:finite-test-cover>]

]
] <scale:affinity-tests>

#proof[
  Every affine array annihilates these tests. Conversely, suppose they all vanish.
    For one of the stated intervals $I$, the equalities $J \( I \) = V \( I \) =
    0$ say that its two halves have the same speed as $I$ and that their distances add to the full distance.
    Repeating this argument shows that every edge of every dyadic subdivision of $I$ has distance $w_I$ times its
    length, with $w_I = d \( s \, t \) \/ \( t - s \)$. The triangle inequality gives the same upper bound between
    any two subdivision nodes. Applying the triangle inequality across the full interval,
    using those nodes as intermediate points, gives the reverse bound, and therefore equality.
    Every dyadic point of $I$ is a subdivision node at some level.
    Apply this argument to $\[ - 2^a \, 2^a \]$ for arbitrarily large integers $a$.
    The common pair $0 \, 1$ fixes one speed on all these intervals, so the array is globally affine.
    The ambient bound forces that speed to lie in $\[ 0 \, 1 \]$.
  For the last assertion, each point of $F$ has a positive test.
    The corresponding open sets cover $F$, and a finite subcover suffices.
    Their sum has a positive minimum on the compact set $F$. ◻
]

=== 6.4 Locally finite limits and their symmetries <locally-finite-limits-and-their-symmetries>

The limiting inequality (6.21) is the zero-hyperbolic Gromov-product condition:
  after identifying points at zero semimetric distance, $B_v \( s \, t \) \/
  2$ is the Gromov product based at $v$; see [3] Section 2.2, Definition 2.10.
  The determinant-one estimate and the passage to the limiting arrays are proved here;
  no real-tree representation theorem is used.

#thm([Proposition 6.7.])[
  (Limits away from affinity).  #emph[After passing to a subsequence,
    the restrictions of $mu_K$ and $nu_K$ to $cal(U)$ converge vaguely to locally finite nonnegative Borel
    measures $mu$ and $nu$, respectively. Moreover,
#[#set math.equation(numbering: n => "(6.20)")
 $ xi_K arrow.r 0 quad upright("vaguely on ") cal(U) . $ <scale:initial-negligible>]

 The measures $mu$ and $nu$ are supported on the closed class $X_0 subset
   X$ consisting of arrays satisfying $d \( s \, t \) lt.eq \| s - t \|$ and the inequalities
#[#set math.equation(numbering: n => "(6.21)")
 $ B_v \( s \, t \) gt.eq min { B_v \( s \, p \) \, B_v \( p \, t \) } \, wide B_v \( s \, t \) = d \( v \, s \) +
   d \( v \, t \) - d \( s \, t \) $ <scale:tree-inequality>]

 for every $v \, s \, t \, p in cal(D)$. Every member of $X_0$ extends uniquely to a continuous semimetric on
   $bb(R)$, obeying the same inequalities at all real arguments. Both limiting measures are invariant under
$ \( tau_r d \) \( s \, t \) = d \( s + r \, t + r \) wide \( r in cal(D) \) . $

 For every interval $I$ as in 15,
#[#set math.equation(numbering: n => "(6.22)")
 $ integral \( J \( I \) + V \( I \) \) thin thin upright(d) mu < oo \, wide
   integral \( h \( I \) + J \( I \) + V \( I \) \) thin thin upright(d) nu < oo . $ <scale:limiting-test-bound>]

 In particular,
#[#set math.equation(numbering: n => "(6.23)")
 $ integral h \( \[ 0 \, 1 \] \) thin thin upright(d) nu lt.eq 1 . $ <scale:terminal-shortfall>]

]
] <scale:limits>

#proof[
  For each compact $F subset cal(U)$, combine (6.19) with (6.15),
    (6.16) to obtain uniform bounds on $mu_K \( F \)$ and $nu_K \( F \)$.
    Using (6.17) instead gives $xi_K \( F \) = o \( 1 \)$. The latter proves (6.20),
    since a continuous compactly supported test is bounded and has compact support.
  Here is an explicit way to extract the local limits. Fix a compatible metric on $X$ and let $a \( d \) =
    "dist" \( d \, cal(A) \)$. Choose a continuous nondecreasing function $chi : \[ 0 \, oo \)
    arrow.r \[ 0 \, 1 \]$ equal to zero on $\[ 0 \, 1 \/ 2 \]$ and to one on $\[ 1 \, oo \)$.
    Set $chi_j \( d \) = chi \( 2^j a \( d \) \)$. These functions increase to one on $cal(U)$,
    have compact support there, and satisfy $chi_(j + 1) = 1$ on $"supp" chi_j$.
    The finite measures $chi_j mu_K$ and $chi_j nu_K$ have bounded total masses for each $j$.
    Weak compactness for finite measures on compact metric spaces, followed by a diagonal extraction,
    gives weak limits for all of them. Their restrictions agree on the open regions where the corresponding
    cutoffs are one: this follows by testing against continuous functions supported in such a region,
    for which the prelimit integrals agree. These compatible restrictions define locally finite measures on
    $cal(U)$. Every compactly supported continuous function is supported where some $chi_j$ is one,
    so these are the asserted vague limits.
  For completeness, the support restrictions survive despite the possibly unbounded total masses.
    The arrays $g_n$ satisfy $g_n \( s \, t \) lt.eq \| s - t \| + 1 \/ n$.
    Taking logarithms in (6.2), then dividing by $n$, shows that their version of (6.21) has error at most
    $\( log_M C_0 \) \/ n$. These errors are bounded uniformly by $C \/ n_0$ at every sampled scale.
    Any fixed strict violation, by a fixed positive margin, is thus absent from every sampled array once $K$ is
    large. Testing on compact subsets of its open violation set shows that it has zero limiting measure.
    There are countably many dyadic arguments and positive rational margins,
    which proves the stated support assertion. For an array with $d \( s \, t \) lt.eq \| s - t \|$,
    the semimetric inequality gives
  $ \| d \( s \, t \) - d \( s' \, t' \) \| lt.eq \| s - s' \| + \| t - t' \| . $
  It therefore has a unique jointly continuous extension to real arguments; all its inequalities extend by continuity.
  For fixed $r in cal(D)$, each prelimit law is invariant under $tau_r$ once $n_0 r$ is an integer.
    Indeed $floor.l n \( s + r \) floor.r = floor.l n s floor.r + n r$,
    and stationarity applies simultaneously to the array. The map $tau_r$ is a homeomorphism of $X$ preserving
    $cal(A)$, so it preserves compact support in $cal(U)$. Invariance therefore passes to the vague limits.
  Finally, multiply any nonnegative test $J \( I \) + V \( I \)$ by $chi_j$, pass to the vague limit,
    and use (6.15). Monotone convergence as $j arrow.r oo$ gives the first bound in (6.22).
    For $nu$ use (6.16) in the same way. Although $h \( I \)$ is not nonnegative everywhere on $X$,
    it is nonnegative on the aligned samples and on the supported limiting class $X_0$;
    these facts justify the cutoff bounds and monotone convergence for that term as well.
    In the case $I = \[ 0 \, 1 \]$ the uncut terminal integral is exactly $e_N \/ epsilon.alt = 1$, giving (6.23). ◻
]

Define the dilation

#[#set math.equation(numbering: n => "(6.24)")
 $ \( S d \) \( s \, t \) = frac(d \( 2 s \, 2 t \), 2) . $ <scale:dilation>]

It is a continuous map from $X$ into $X$ and fixes every affine array.
  Its inverse need not map all of $X$ into $X$, but on $X_0$ it is the homeomorphism

$ \( S^(- 1) d \) \( s \, t \) = 2 d \( s \/ 2 \, t \/ 2 \) . $

Both maps preserve $X_0 ∩ cal(U)$.

#thm([Proposition 6.8.])[
  (Positive dilation decomposition).  #emph[On $cal(U)$, with the measures supported on $X_0$ as above,
#[#set math.equation(numbering: n => "(6.25)")
 $ S_(*) mu = mu + nu . $ <scale:measure-balance>]

 There is a locally finite nonnegative measure $mu_oo$, invariant under $S$ and every dyadic translation, such that
#[#set math.equation(numbering: n => "(6.26)")
 $ mu = mu_oo + sum_(j = 1)^oo \( S^(- j) \)_(*) nu \, wide S_(*) mu_oo = mu_oo . $ <scale:measure-decomposition>]

 The series is a series of positive measures dominated by $mu$.]
] <scale:decomposition>

#proof[
  The floor convention in (6.12) gives the exact identity $S g_n = g_(2 n)$. Hence, as finite measures on $X$,
  #[#set math.equation(numbering: n => "(6.27)")
   $ S_(*) mu_K = mu_K + nu_K - xi_K . $ <scale:finite-measure-balance>]
  To pass to the local limits, observe that $S^(- 1) \( cal(A) \) = cal(A)$:
    multiplication by two permutes the dyadic rationals, so $S d = d_w$ implies $d = d_w$.
    If $F subset cal(U)$ is compact, its preimage under $S$ is closed in compact $X$ and disjoint from $cal(A)$,
    hence compact in $cal(U)$. Thus $S$ is proper on $cal(U)$,
    and composition with $S$ preserves continuous compactly supported tests there.
    Vague convergence and (6.20) now give (6.25).
  We may henceforth work on $X_0 ∩ cal(U)$, where $S$ is invertible.
    Applying its inverse to (6.25) and iterating gives, for every $b gt.eq 1$,
  $ mu = \( S^(- b) \)_(*) mu + sum_(j = 1)^b \( S^(- j) \)_(*) nu . $
  The increasing positive partial sums are dominated by $mu$.
    Their limit $lambda = sum_(j gt.eq 1) \( S^(- j) \)_(*) nu$ is therefore a locally finite measure.
    On relatively compact Borel sets define $mu_oo = mu - lambda$.
    The definitions agree on overlaps and extend by exhaustion to a locally finite nonnegative measure;
    this construction avoids subtracting infinite total masses. Monotone convergence for the positive series yields
  $ S_(*) lambda = nu + lambda . $
  Subtract this identity from (6.25) on relatively compact sets to obtain $S_(*) mu_oo = mu_oo$.
  For $r in cal(D)$ and $j gt.eq 1$, the identity
  $ tau_r S^(- j) = S^(- j) tau_(r \/ 2^j) $
  and translation invariance of $nu$ show that every summand of $lambda$ is invariant under $tau_r$.
    The same holds for their sum and, by local subtraction from the translation-invariant measure $mu$,
    for $mu_oo$. This proves all assertions. ◻
]

== 7 Support restrictions and the geometry of limiting distances <shape:section>

Throughout this section we retain the sequence of parameters, scales, and measures constructed in Lemma 6.4,
  Proposition 6.7. In particular, all limiting arrays belong to $X_0$,
  and all measures are considered on $cal(U) = X \\ cal(A)$. As before, $cal(D)$ denotes the dyadic rationals.
  The constants $delta$ and $c_b$ are those fixed in Theorem 3.1, Theorem 5.1;
  neither depends on the scales or the parameter sequence.

For $d in X_0$, let $P_d$ be the set of times having no open neighborhood on which $d \( x \, y \) = w \| x -
  y \|$ for some constant $w$, and let $Q_d$ be the set of times having no open neighborhood on which
  $d \( x \, y \) = \| x - y \|$. These sets are closed, and $P_d subset Q_d$.
  Here and below a property of the distance on an interval concerns every pair of points in that interval.

#thm([Proposition 7.1.])[
  (Support exclusions).  #emph[There is a measurable set of full measure for $mu$, $nu$,
    and $mu_oo$ on which the following statements hold for every real choice of their arguments.]
  + #emph[There do not exist $r in bb(R)$ and $t > 0$ such that
#[#set math.equation(numbering: n => "(7.1)")
 $ d \( r - t \, r \) > \( 1 - delta \) t \, wide d \( r \, r + t \) > \( 1 - delta \) t \, wide
   d \( r - t \, r + t \) < delta t . $ <shape:forbidden-triple>]

]
  + #emph[If $s in P_d$ and $t in Q_d$, then
#[#set math.equation(numbering: n => "(7.2)")
 $ d \( s \, t \) lt.eq c_b \| t - s \| . $ <shape:slow-pair>]

]
  #emph[The same statements hold almost everywhere for every positive measure appearing in the decomposition of 18.]
] <shape:exclusions>

#proof[
  First fix $r \, t in cal(D)$, $t > 0$. For all sufficiently large $K$,
    $n r$ and $n t$ are integers at every scale $n gt.eq n_0$ in our sums.
    The event (7.1) for $g_n$ is contained in the cancellation event of 4, at center $n r$ and spacing $n t$.
    Consequently its $mu_K$-mass is at most
  $ C / epsilon.alt sum_(n_0 lt.eq n < N)^(upright("dyadic")) e^(- gamma t n) lt.eq C_t /
    epsilon.alt e^(- gamma t n_0) arrow.r 0 . $
  The last conclusion follows from $epsilon.alt n_0 arrow.r oo$ in 14. The event is open in $X$.
    To pass to a locally finite limit, test its indicator from below by nonnegative continuous functions with
    compact support in $cal(U)$. This shows that its $mu$-mass is zero.
    Taking the countable union over $r \, t in cal(D)$ and then using continuity of $d$ excludes every real
    triple: strict inequalities at a real center and spacing persist at nearby dyadic ones.
  We record explicitly the weighted consequence of the bridge estimate needed for the second exclusion.
    Fix a bridge $\[ u \, v \]$ with dyadic endpoints and length $r = v - u > 0$.
    Fix a power-of-two interval $I$ in the allowed window about one endpoint and another such interval $I'$ in the
    allowed window about the other endpoint. The two endpoints can be interchanged. Put
  $ W = J \( I \) + V \( I \) \, wide H = h \( I' \) \, $
  and fix a threshold $eta > 0$. These are fixed bounded Lipschitz functions of finitely many shortfalls,
    and $W gt.eq 0$. All their endpoints align with the integer times at every scale in the sum once $K$ is large.
    By (6.16) and Markov’s inequality,
  $ sup_(n_0 lt.eq n < N)^(upright("dyadic")) bb(P) \( H \( g_n \) > eta \/ 2 \) lt.eq C_(I' \, eta) epsilon.alt . $
  Applying 9 at the integer bridge length $r n$, summing, and using 15, we obtain
  #[#set math.equation(numbering: n => "(7.3)")
   $ & integral upright(bold(1))_({ d \( u \, v \) > c_b r \, med H > eta }) W thin thin upright(d) mu_K\
 & wide lt.eq
   C epsilon.alt
   [integral W thin thin upright(d) mu_K + 1 / epsilon.alt sum_(n_0 lt.eq n < N)^(upright("dyadic")) M^(- sigma r
   n)] arrow.r 0 . $ <shape:weighted-bridge>]
  Indeed the first bracketed term is bounded, and the second tends to zero:
    the exponential sum is at most $2 M^(- sigma r n_0)$ for all sufficiently large $K$,
    whereas $1 \/ epsilon.alt = o \( n_0 \)$. All constants and thresholds in this application are fixed before
    $K$ tends to infinity. The lower bounds on $M$ and on bridge length in 9 therefore hold eventually;
    no uniformity over varying test intervals is being assumed.
  Suppose now that (7.2) fails for some $s in P_d$, $t in Q_d$. Necessarily $s eq.not t$.
    Choose nearby distinct dyadic bridge endpoints so that their distance still exceeds $c_b$ times their temporal
    separation. The endpoints can be chosen close enough to $s \,
    t$ that sufficiently small neighborhoods of these two times fit in the respective bridge windows.
    Some test $J \( I \) + V \( I \)$ with power-of-two length and dyadic endpoints contained in the first
    neighborhood is positive. To see this, choose such an interval containing $s$ in its interior.
    If the tests for it and all its dyadic subdivisions vanished, successive subdivision, equal half speeds,
    and equality in the triangle inequality would make $d$ affine on that interval, contrary to $s in P_d$.
    In the second neighborhood there is similarly a power-of-two interval $I'$ with $h \( I' \) > 0$.
    In fact exact unit distance between the endpoints of any interval forces exact unit distance on every
    subinterval, by the triangle inequality and $d \( x \, y \) lt.eq \| x - y \|$;
    hence an interval containing $t$ in its interior cannot have zero shortfall.
  Choose a positive rational $eta < h \( I' \)$. The resulting strict bridge and shortfall conditions define an
    open set. By (7.3), its $W mu$-mass is zero, using compactly supported continuous tests in $cal(U)$ as above.
    Its part with $W > 0$ therefore has zero $mu$-mass. There are only countably many choices of the bridge,
    the two tests, their orientation, and the rational threshold.
    Every violation is covered by one of these choices, proving (7.2) simultaneously for all real $s \, t$.
  Both properties are invariant under every translation and positive dilation of time,
    including the corresponding division of distances by the dilation factor.
    The measure inequality $\( S^(- 1) \)_(*) nu lt.eq mu$ from 18 consequently transfers them to $nu$.
    All the other component measures are dominated by $mu$, so they inherit them as well.
    This also provides a measurable full-measure set: the exceptional sets were covered by countably many
    measurable strict tests before extension to real arguments. ◻
]

The local-to-global propagation below uses this zero-hyperbolic Gromov-product framework [3] Section 2.2,
  with an explicit argument on the semimetric arrays rather than an invocation of a theorem about geodesic real trees.

#thm([Proposition 7.2.])[
  (Shape classification).  #emph[Every nonaffine array in $X_0$ satisfying 19 has one of the following forms:]
  + #emph[every secant has speed at most $c_b$;]
  + #emph[there is one exterior ray of exact unit speed, and the complementary closed half-line has all secant
    speeds at most $c_b$;]
  + #emph[there are two exterior rays of exact unit speed, separated by a closed interval $\[ a \, b \]$ of
    positive length, and every secant contained in $\[ a \, b \]$ has speed at most $c_b$.]
  #emph[The second possibility includes either orientation.
    These descriptions do not assert additivity of distances across the slow part.
    The three temporal configurations are illustrated in 3.]
] <shape:classification>

#proof[
  We first show that a connected component $U$ of $bb(R) \\ P_d$ is affine with a single speed throughout.
    Its local speeds agree on overlapping neighborhoods, and hence are a common $w
    in \[ 0 \, 1 \]$ by connectedness. A compact subinterval of $U$ has a sufficiently fine partition $x_0 <
    dots.h.c < x_m$ such that each consecutive triple lies in a local affine neighborhood.
    When $w = 0$, the triangle inequality immediately gives $d \( x_0 \, x_m \) = 0$.
    When $w > 0$, propagate additivity inductively. Suppose it holds from $x_0$ through $x_j$,
    and use the four-point inequality of (6.21) at base $v = x_j$ in its limiting form
  #[#set math.equation(numbering: n => "(7.4)")
   $ B_v \( x \, z \) gt.eq min { B_v \( x \, y \) \, B_v \( y \, z \) } \, wide B_v \( x \, z \) =
     d \( v \, x \) + d \( v \, z \) - d \( x \, z \) . $ <shape:tree-inequality>]
  The inductive additivity gives $B_v \( x_0 \, x_(j - 1) \) = 2 d \( x_(j - 1) \, x_j \) > 0$,
    whereas local additivity gives $B_v \( x_(j - 1) \, x_(j + 1) \) = 0$.
    Apply (7.4) to the latter pair with intermediate point $x_0$.
    Nonnegativity of $B_v$ forces $B_v \( x_0 \, x_(j + 1) \) = 0$, exactly the next additivity statement.
    The first two steps are already locally affine. Thus $d \( x_0 \, x_m \) = w \( x_m - x_0 \)$,
    and varying the compact subinterval proves the claim. In particular $P_d eq.not diameter$ for a nonaffine array.
  Suppose a component $U$ has speed $w > c_b$. It has at least one finite endpoint $s in P_d$, since $U =
    bb(R)$ would imply affinity. If $w < 1$, every interior point $t in U$ belongs to $Q_d$.
    Continuity at the endpoint gives $d \( s \, t \) = w \| t - s \|$, contradicting (7.2). Therefore $w = 1$.
    Such a component cannot have two finite endpoints: they would both belong to $P_d subset Q_d$,
    and their unit mutual speed would again contradict (7.2).
    Hence every component of speed greater than $c_b$ is an exterior unit ray; there are at most two.
  Let $I$ be the closed complement of these rays. It is the whole line, a closed half-line,
    or a closed bounded interval. For $x < y$ in $I$, if $\[ x \, y \] ∩ P_d$ is empty,
    the two points lie in a component of speed at most $c_b$.
    Otherwise let $p$ and $q$ be the first and last points of $\[ x \, y \] ∩ P_d$.
    The portions from $x$ to $p$ and from $q$ to $y$ have speed at most $c_b$,
    by the component claim and continuity. The middle portion satisfies the same bound by (7.2), because $p \,
    q in P_d subset Q_d$. The triangle inequality gives $d \( x \, y \) lt.eq c_b \( y - x \)$.
    The only case not yet settled is a bounded slow interval of length zero; 21 below excludes it. ◻
]

#thm([Lemma 7.3.])[
  (Loss across two rays).  #emph[Suppose there are two exterior unit rays with slow interval $\[ a \, b \]$,
    and put $L = b - a$. Then $L > 0$, and, with the fixed constant
#[#set math.equation(numbering: n => "(7.5)")
 $ C_(*) = 2 + 6 / delta \, $ <shape:cross-constant>]

 every $z in bb(R)$ and $t > 0$ satisfy
#[#set math.equation(numbering: n => "(7.6)")
 $ 0 lt.eq 1 - frac(d \( z \, z + t \), t) lt.eq frac(C_(*) L, t) . $ <shape:cross-bound>]

 The shortfall is zero whenever the interval is wholly in either closed unit ray.]
] <shape:crossloss>

#proof[
  For the moment permit $L = 0$. Write $x_u = a - u$, $y_v = b + v$, where $u \, v gt.eq 0$, and put $D =
    d \( a \, b \) lt.eq L$. Set
  $ s = frac(u + v - D - d \( x_u \, y_v \), 2) . $
  If $s lt.eq 0$, the absolute shortfall of $\[ x_u \, y_v \]$ is at most $L + D lt.eq 2 L$. Suppose $s > 0$.
    The reverse triangle inequalities imply $d \( x_u \, y_v \) gt.eq u - D - v$ and $d \( x_u \, y_v \) gt.eq v -
    D - u$, so that $s lt.eq min { u \, v }$. At base $a$ the unit rays and triangle inequalities give
  $ B_a \( x_u \, x_s \) & = 2 s \,\
B_a \( x_u \, y_v \) & gt.eq u + \( v - D \) - d \( x_u \, y_v \) = 2 s \,\
B_a \( y_v \, y_s \) & gt.eq \( v - D \) + \( s - D \) - \( v - s \) = 2 s - 2 D . $
  Twice applying (7.4) yields $B_a \( x_s \, y_s \) gt.eq 2 s - 2 D$.
    As $d \( a \, x_s \) = s$ and $d \( a \, y_s \) lt.eq D + s$, it follows that
  #[#set math.equation(numbering: n => "(7.7)")
   $ d \( x_s \, y_s \) lt.eq 3 D lt.eq 3 L . $ <shape:matched-ray-distance>]
  Use the temporal midpoint $m = \( a + b \) \/ 2$ and spacing $t_(*) = s + L \/ 2$. Its two wing distances obey
  $ d \( x_s \, m \) \, med d \( m \, y_s \) gt.eq s - L \/ 2 . $
  If $L > 0$ and $s > 3 L \/ delta$, these bounds are strictly greater than $\( 1 - delta \)
    t_(*)$ and (7.7) is strictly less than $delta t_(*)$. This is the forbidden triple of (7.1).
    If $L = 0$, every $s > 0$ produces that same strict contradiction. Thus always $s lt.eq 3 L \/ delta$.
    A full crossing interval has absolute shortfall
  $ \( u + L + v \) - d \( x_u \, y_v \) = L + D + 2 s lt.eq C_(*) L . $
  An interval meeting only part of the slow interval has absolute shortfall at most twice the length of that part.
    For example, if $x < a lt.eq y lt.eq b$, then $d \( x \, y \) gt.eq \( a - x \) -
    d \( a \, y \) gt.eq \( a - x \) - \( y - a \)$, giving loss at most $2 \( y - a \)$.
    The other orientation is identical. An interval inside $\[ a \, b \]$ has loss at most its length,
    hence at most $L$, and intervals in the unit rays have zero loss. This proves (7.6) in every case.
    If $L = 0$, these conclusions would give exact unit distance between every pair of times, an affine array.
    Nonaffinity therefore forces $L > 0$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-4.62, 2.7), [#text(size: 9pt)[No unit ray]], anchor: "east", padding: 0.1176cm)
  line((-4.2, 2.7), (4.2, 2.7), stroke: (paint: rgb("#acacac"), thickness: 3.0pt, miter-limit: 10))
  content((0, 2.7), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[all secants have speed $lt.eq c_b$]]])])
  content((-4.62, 1.5), [#text(size: 9pt)[One unit ray]], anchor: "east", padding: 0.1176cm)
  line((-1.05, 1.5), (-4.2, 1.5), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((-1.05, 1.5), (4.2, 1.5), stroke: (paint: rgb("#acacac"), thickness: 3.0pt, miter-limit: 10))
  circle((-1.05, 1.5), radius: 0.05644, fill: black, stroke: none)
  content((-2.73, 1.5), [#text(size: 9pt)[unit speed]], anchor: "south", padding: 0.1176cm)
  content((1.575, 1.5), [#text(size: 9pt)[slow half-line]], anchor: "south", padding: 0.1176cm)
  content((-1.05, 1.5), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1176cm)
  content((-4.62, 0), [#text(size: 9pt)[Two unit rays]], anchor: "east", padding: 0.1176cm)
  line((-1.05, 0), (-4.2, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((-1.05, 0), (1.05, 0), stroke: (paint: rgb("#acacac"), thickness: 3.0pt, miter-limit: 10))
  line((1.05, 0), (4.2, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((-1.05, 0.55), (1.05, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((0, 0.55), [#text(size: 9pt)[$L=b-a>0$]], anchor: "south", padding: 0.1176cm)
  circle((-3.465, 0), radius: 0.05644, fill: black, stroke: none)
  circle((-1.05, 0), radius: 0.05644, fill: black, stroke: none)
  circle((0, 0), radius: 0.05644, fill: black, stroke: none)
  circle((1.05, 0), radius: 0.05644, fill: black, stroke: none)
  circle((3.465, 0), radius: 0.05644, fill: black, stroke: none)
  content((-3.465, 0), [#text(size: 9pt)[$x_s=a-s$]], anchor: "north", padding: 0.1176cm)
  content((-1.05, 0), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$m$]], anchor: "north", padding: 0.1176cm)
  content((1.05, 0), [#text(size: 9pt)[$b$]], anchor: "north", padding: 0.1176cm)
  content((3.465, 0), [#text(size: 9pt)[$y_s=b+s$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 3: The possible temporal regions in 20; the one-ray picture may also be reflected. A slow region need not be affine. In the bottom picture, excessive loss between the exterior rays would produce the symmetric forbidden triple $\( x_s \, m \, y_s \)$ used in 21. The diagram describes time regions, not an embedding of the semimetric. ],
) <shape:figure>

== 8 A capped deficit and the final balance <end:section>

The cap will compare the slow interval of a limiting shape at fine and coarse scales.
  It must equal one on uniformly slow secants. For a two-ray shape,
  (7.6) makes the shortfall of a long crossing interval small;
  a sufficiently small slope of the cap near zero will make its averaged coarse contribution smaller than the
  fine-scale occupancy of the slow interval. This is an integrated comparison,
  not a pointwise sign assertion for the observable below.

Choose a fixed $alpha > 0$ so small that $10 C_(*) alpha < 1$.
  Choose a smooth nondecreasing function $Phi : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ such that

#[#set math.equation(numbering: n => "(8.1)")
 $ Phi \( u \) = alpha u med upright("near ") 0 \, wide Phi \( u \) =
   1 quad \( 1 - c_b lt.eq u lt.eq 1 \) . $ <end:cap>]

For completeness, one can choose a nonnegative smooth derivative equal to $alpha$ near zero, zero near $1 - c_b$,
  and with integral one on $\[ 0 \, 1 - c_b \]$, by adding a nonnegative bump supported strictly between the two
  endpoint neighborhoods. Integrating and continuing constantly gives (8.1).
  Positivity near zero and compactness give constants $0 < c_Phi lt.eq C_Phi < oo$ with

#[#set math.equation(numbering: n => "(8.2)")
 $ c_Phi u lt.eq Phi \( u \) lt.eq C_Phi u wide \( 0 lt.eq u lt.eq 1 \) . $ <end:linear-bounds>]

Extend $Phi$ smoothly to the real line, keeping it linear immediately to the left of zero.
  The extension only defines continuous tests on $X$; the arrays used below have the relevant shortfalls in
  $\[ 0 \, 1 \]$.

Write $h_t \( z \) = 1 - d \( z \, z + t \) \/ t$, and abbreviate $J = J \( \[ 0 \, 2 \] \)$ and $V =
  V \( \[ 0 \, 2 \] \)$. Define

#[#set math.equation(numbering: n => "(8.3)")
 $ G \( d \) = Phi \( h_2 \( 0 \) \) - 1 / 2 Phi \( h_1 \( 0 \) \) - 1 / 2 Phi \( h_1 \( 1 \) \) . $ <end:G-definition>]

If $a = h_1 \( 0 \)$, $b = h_1 \( 1 \)$, and $macron(a) = \( a + b \) \/ 2$, then $h_2 \( 0 \) = macron(a) +
  J$ and $V = \( a - b \)^2$. The mean value theorem followed by the second-order symmetric Taylor bound yields

#[#set math.equation(numbering: n => "(8.4)")
 $ \| G \| lt.eq parallel Phi' parallel J + 1 / 8 parallel Phi'' parallel V lt.eq C \( J + V \) \, $ <end:G-bound>]

where the derivative norms can be taken on the compact argument range of these three tests on $X$.
  In particular $G$ is $mu$-integrable by (6.22).

At the terminal scale, $integral h_1 \( 0 \) thin thin upright(d) nu_K = 1$.
  After a subsequence, (8.2) therefore gives a limit

#[#set math.equation(numbering: n => "(8.5)")
 $ H_Phi = lim_K integral Phi \( h_1 \( 0 \) \) thin thin upright(d) nu_K \, wide c_Phi lt.eq H_Phi lt.eq
   C_Phi . $ <end:H-definition>]

There are three steps to the contradiction. First, dyadic telescoping will give $integral G thin thin upright(d)
  mu = H_Phi$, with no loss of weighted mass to $cal(A)$. Then the positive decomposition of 18 separates this
  integral into a terminal contribution and the contribution of the invariant remainder.
  We prove that the former is strictly less than $H_Phi$ and the latter is nonpositive.
  The cap’s two prescribed behaviors enter precisely in these comparisons.

#thm([Proposition 8.1.])[
  (Exact limiting balance).  #emph[With the preceding choices,
#[#set math.equation(numbering: n => "(8.6)")
 $ integral G thin thin upright(d) mu = H_Phi > 0 . $ <end:balance-equation>]

]
] <end:balance>

#proof[
  Stationarity makes the two half-interval terms in (8.3) have equal expectation.
    Since $h_2 \( 0 \; g_n \) = h_1 \( 0 \; g_(2 n) \)$, summing over the dyadic scales gives exactly
  $ integral G thin thin upright(d) mu_K = integral Phi \( h_1 \( 0 \) \) thin thin upright(d) nu_K - 1 /
    epsilon.alt bb(E) Phi \( h_1 \( 0 \; g_(n_0) \) \) . $
  The final term tends to zero by (6.17), (8.2). Thus these integrals converge to $H_Phi$.
    We must show that this mass does not escape to $cal(A)$ under vague convergence.
  The measures $J mu_K$ and $V mu_K$ have uniformly bounded total mass on the compact space $X$,
    and the signed measures $G mu_K$ have uniformly bounded total variation by (8.4). Take simultaneous weak limits
  $ J mu_K arrow.r lambda_J \, wide V mu_K arrow.r lambda_V \, wide G mu_K arrow.r eta . $
  On $cal(U)$ they agree with $J mu$, $V mu$, and $G mu$ respectively:
    multiply any compactly supported continuous test there by the indicated continuous weight.
    We show that $eta \|_(cal(A)) = 0$ by treating all three ranges of affine speeds.
    Write $d_w \( s \, t \) = w \| s - t \|$.
  ===== 8.1 Speeds $0 lt.eq w lt.eq c_b$. <speeds-0le-wle-c_b.>
  Both $Phi'$ and $Phi''$ vanish at every shortfall $1 - w$ in this compact speed range,
    including its boundary $w = c_b$. For each $rho > 0$ there is an open neighborhood $U_rho$ of ${ d_w : 0 lt.eq
    w lt.eq c_b }$ on which the Taylor argument for (8.4) gives
  $ \| G \| lt.eq rho \( J + V \) . $
  Indeed all arguments between the three relevant shortfalls are then uniformly close to $\[ 1 - c_b \, 1 \]$,
    where both derivatives vanish. For a continuous test supported in $U_rho$,
    pass this domination to the weak limits. It implies $\| eta \| \|_(U_rho) lt.eq
    rho \( lambda_J + lambda_V \) \|_(U_rho)$. The latter positive measure is finite on $X$.
    Letting $rho$ decrease to zero shows that $eta$ has zero restriction to this compact set of affine arrays.
  ===== 8.2 Speeds $c_b < w < 1$. <speeds-c_bw1.>
  Choose a fixed positive dyadic $R$ so large that the endpoint windows of the bridge $\[ 0 \, R \]$ contain
    $\[ 0 \, 2 \]$ and $\[ R \, R + 1 \]$ respectively; for example require $kappa R > 2$.
    Put $W = J + V$ and $H = h \( \[ R \, R + 1 \] \)$. For each positive rational $eta_0$, the open set
  $ U_(eta_0) = { d : d \( 0 \, R \) > c_b R \, med h \( \[ R \, R + 1 \] \) > eta_0 } $
  has $W mu_K$-mass tending to zero by (7.3). The open-set inequality for weak convergence of positive measures
    gives $\( lambda_J + lambda_V \) \( U_(eta_0) \) = 0$. Each $d_w$ in the current speed range belongs to such a
    set by taking $0 < eta_0 < 1 - w$. This countable cover and (8.4) show that $eta$ vanishes on all intermediate
    affine speeds. Notice that the threshold is fixed separately for each test;
    no threshold uniform as $w arrow.t 1$ is needed.
  ===== 8.3 The speed $w = 1$. <the-speed-w1.>
  Near $d_1$, all three arguments in (8.3) are in the linear part of $Phi$, so $G = alpha J$.
    It remains to prove $lambda_J \( { d_1 } \) = 0$. Fix an inverse power of two $q in \( 0 \, 1 \)$.
    For the product over $\[ 0 \, 2 n \]$, with center $n$, put
  $ D = n - min { g \( 0 \, n \) \, g \( n \, 2 n \) } \, wide ell = g \( 0 \, n \) + g \( n \, 2 n \) -
    g \( 0 \, 2 n \) = 2 n J \( g_n \) . $
  The quantities $D \/ n$ and $ell \/ n$ are continuous tests of $g_n$, both zero at $d_1$.
    Thus the condition $2 q - 2 D \/ n > ell \/ n$ defines an open neighborhood $U_q$ of $d_1$.
    Eventually $s = q n$ is an integer at every scale in the sum.
    On $U_q$, the truncation estimate of 12 gives, with its fixed additive constant $A$,
  $ ell lt.eq ell_(upright("cut")) + A \, wide J lt.eq q J \( \[ 1 - q \, 1 + q \] \) + frac(A, 2 n) . $
  The shorter-interval test telescopes exactly, by stationarity:
  $ integral J \( \[ 1 - q \, 1 + q \] \) thin thin upright(d) mu_K = frac(e_(q N) - e_(q n_0), epsilon.alt) lt.eq
    1 \, $
  where dyadic monotonicity gives $e_(q N) lt.eq e_N = epsilon.alt$.
    Also $epsilon.alt^(- 1) sum_n n^(- 1) = O \( \( epsilon.alt n_0 \)^(- 1) \) = o \( 1 \)$. Since $J gt.eq 0$,
  $ integral_(U_q) J thin thin upright(d) mu_K lt.eq q + o \( 1 \) . $
  The open-set inequality now gives $lambda_J \( U_q \) lt.eq q$, so $lambda_J \( { d_1 } \) lt.eq q$.
    First take the fixed weak limit and then let $q$ decrease through inverse powers of two to obtain zero.
    The local identity $G = alpha J$ transfers this conclusion to $eta$.
  These cases cover $cal(A)$. Weak convergence on compact $X$ preserves the total mass of the signed measures,
    so $eta \( X \) = H_Phi$. As $eta \|_(cal(A)) = 0$ and $eta \|_(cal(U)) = G mu$, this is (8.6). ◻
]

=== 8.1 The terminal measure and its backward dilates <the-terminal-measure-and-its-backward-dilates>

The decomposition in 18, together with (8.4), gives an absolutely convergent identity

#[#set math.equation(numbering: n => "(8.7)")
 $ integral G thin thin upright(d) mu = integral G thin thin upright(d) mu_oo +
   sum_(j = 1)^oo integral G \( S^(- j) d \) thin thin upright(d) nu \( d \) . $ <end:integrated-decomposition>]

More precisely, the sum of the integrals of $\| G \( S^(- j) d \) \|$ is at most $integral \| G \| thin thin
  upright(d) mu$, so all the subsequent rearrangements of these component integrals are justified.

#thm([Lemma 8.2.])[
  (Strict bound for the terminal contribution).  #emph[The series in (8.7) satisfies
#[#set math.equation(numbering: n => "(8.8)")
 $ sum_(j = 1)^oo integral G \( S^(- j) d \) thin thin upright(d) nu \( d \) < H_Phi . $ <end:terminal-strict>]

]
] <end:terminal>

#proof[
  Nonnegative compact cutoffs exhausting $cal(U)$, the terminal prelimit identities, and monotone convergence imply
  #[#set math.equation(numbering: n => "(8.9)")
   $ integral h_1 \( 0 \) thin thin upright(d) nu lt.eq 1 \, wide
     integral Phi \( h_1 \( 0 \) \) thin thin upright(d) nu lt.eq H_Phi . $ <end:terminal-bounds>]
  For each integer $m gt.eq 0$, subdivision and the triangle inequality give
  $ h_1 \( 0 \) gt.eq 2^(- m) sum_(r = 0)^(2^m - 1) h_(2^(- m)) \( r 2^(- m) \) . $
  Dyadic translation invariance of $nu$ therefore implies $integral h_(2^(- m)) \( 0 \) thin thin upright(d) nu
    lt.eq 1$. The same shortfalls inserted into $Phi$ have finite integrals, bounded by $C_Phi$.
  Set $A_m = integral Phi \( h_(2^(- m)) \( 0 \) \) thin thin upright(d) nu$.
    Translation invariance at the shift $2^(- j)$ gives
  $ integral G \( S^(- j) d \) thin thin upright(d) nu = A_(j - 1) - A_j . $
  Absolute convergence of the series implies convergence of $A_m$. Fatou’s lemma yields
  #[#set math.equation(numbering: n => "(8.10)")
   $ sum_(j = 1)^oo integral G \( S^(- j) d \) thin thin upright(d) nu & lt.eq A_0 -
     integral liminf_(m arrow.r oo) Phi \( h_(2^(- m)) \( 0 \) \) thin thin upright(d) nu\
 & lt.eq H_Phi - integral liminf_(m arrow.r oo) Phi \( h_(2^(- m)) \( 0 \) \) thin thin upright(d) nu .
   $ <end:terminal-fatou>]
  If $nu = 0$, the series is zero and (8.5) proves the strict conclusion.
    Otherwise every shape in its full-measure support has a slow interval with nonempty interior by Proposition
    7.2, Lemma 7.3. There is a dyadic $z$ in that interior. For all sufficiently large $m$,
    the interval $\[ z \, z + 2^(- m) \]$ is slow, so $Phi \( h_(2^(- m)) \( z \) \) = 1$ by (8.1).
  The measurable sets
  $ E_z = { d : Phi \( h_(2^(- m)) \( z \) \) = 1 upright(" for every sufficiently large ") m } \, wide z in cal(D) \, $
  cover this full-measure support. At least one has positive $nu$-measure,
    and translation invariance gives $nu \( E_0 \) = nu \( E_z \) > 0$.
    Consequently the subtracted integral in (8.10) is positive.
    It is finite by Fatou’s lemma and the bound $A_m lt.eq C_Phi$. This proves (8.8) in all cases. ◻
]

=== 8.2 The translation- and dilation-invariant remainder <the-translation--and-dilation-invariant-remainder>

We next give the measurable and local-finiteness details needed to integrate over shapes.
  A dyadic interval whose endpoint distance equals its length has exact unit speed throughout,
  by the triangle inequality and the Lipschitz bound. Thus the local unit-speed set is the union of the interiors
  of those countably many intervals. More directly, define extended-real endpoint functions on $X_0$ by

#[#set math.equation(numbering: n => "(8.11)")
 $ a \( d \) & = sup { r in cal(D) : d \( p \, q \) = q - p upright(" for all ") p \, q in cal(D) \, p < q < r } \,\
b \( d \) & = inf { r in cal(D) : d \( p \, q \) = q - p upright(" for all ") p \, q in cal(D) \,
  r < p < q } . $ <end:left-endpoint>]

Use $sup diameter = - oo$ and $inf diameter = + oo$. Each ray condition is a countable intersection of closed
  secant conditions, so $a \, b$ are measurable. On our nonaffine shapes a finite $a$ is exactly the right
  endpoint of the exterior left unit ray, and a finite $b$ is exactly the left endpoint of the exterior right unit
  ray. They obey, for $r in cal(D)$,

#[#set math.equation(numbering: n => "(8.12)")
 $ a \( tau_r d \) = a \( d \) - r \, quad b \( tau_r d \) = b \( d \) - r \, wide a \( S d \) = a \( d \) \/ 2 \,
   quad b \( S d \) = b \( d \) \/ 2 . $ <end:endpoint-covariance>]

Thus the three shape classes and the length $L = b - a$ on the two-ray class are measurable and transform as asserted.

#thm([Lemma 8.3.])[
  (Nonpositive invariant contribution).  #emph[The invariant remainder satisfies
#[#set math.equation(numbering: n => "(8.13)")
 $ integral G thin thin upright(d) mu_oo lt.eq 0 . $ <end:remainder-bound>]

]
] <end:remainder>

#proof[
  On an entirely slow shape, each shortfall in (8.3) is at least $1 - c_b$,
    so all three capped values equal one and $G = 0$.
  Consider next shapes with exactly one unit ray. First take the orientation with a left unit ray and finite
    interface $a$. For a bounded interval $\[ A \, B \]$ of possible interface locations,
    choose one fixed dyadic secant strictly to the left of $A$ and a second strictly to the right of $B$.
    Their speed ratios on every such shape are respectively $1$ and at most $c_b$.
    The arrays with these two prescribed closed conditions form a compact subset of $X_0$ disjoint from $cal(A)$:
    an affine array would have the same speed on both secants.
    Local finiteness of $mu_oo$ on $cal(U)$ therefore implies finite mass for interfaces in $\[ A \, B \]$.
  Push the restriction of $mu_oo$ to this shape class forward by $a$,
    obtaining a measure $lambda$ on $bb(R)$ finite on bounded intervals. Its invariances, from (8.12), give
  $ lambda \( \[ 0 \, 1 \) \) = lambda \( \[ 0 \, 2 \) \) = lambda \( \[ 0 \, 1 \) \) +
    lambda \( \[ 1 \, 2 \) \) = 2 lambda \( \[ 0 \, 1 \) \) . $
  The first equality uses $S$-invariance; the last uses translation by one.
    Finiteness forces $lambda \( \[ 0 \, 1 \) \) = 0$, and integer translates covering $bb(R)$ show that this
    entire shape class has zero mass. The same argument with left and right reversed treats the other one-ray
    class. Half-open intervals make the argument valid without any advance assumption about endpoint atoms.
  It remains to consider the two-ray class. Restrict to the length band
  $ mu_(*) := mu_oo \|_({ upright("two rays") \, med 1 lt.eq L < 2 }) . $
  This measure is invariant under dyadic translations. Its left endpoint has finite intensity on bounded
    intervals, as follows explicitly. Partition any bounded range of possible $a$ into finitely many bins
    $\[ k \/ 4 \, \( k + 1 \) \/ 4 \]$. In each bin the fixed secant $\[ \( k + 1 \) \/ 4 \, \( k + 2 \) \/ 4 \]$
    lies in $\[ a \, b \]$, since $L gt.eq 1$, and hence has ratio at most $c_b$.
    A fixed dyadic secant to the left of the whole bounded range has ratio one.
    The two conditions again put each bin’s arrays inside a compact subset of $cal(U)$.
    A finite union gives the claimed finite intensity. The right endpoint also has finite intensity on bounded
    intervals because $1 lt.eq b - a < 2$ bounds $a$ whenever it bounds $b$.
  Neither endpoint intensity has an atom. If the mass at some point were positive,
    dyadic translation invariance would give the same positive mass to infinitely many distinct points in a
    bounded interval, contradicting local finiteness. Define the finite number
  $ I_0 = mu_(*) { 0 lt.eq a < 1 } . $
  Every integer interval of length one has this same endpoint mass.
  For $j in bb(Z)$, let $B_j$ be the two-ray band $2^j lt.eq L < 2^(j + 1)$.
    Since $S$ divides lengths by two and preserves $mu_oo$,
  $ mu_oo \|_(B_j) = \( S^(- j) \)_(*) mu_(*) . $
  The bands are disjoint and cover the two-ray class. Integrability of $\| G \|$ permits reindexing $j$ to $- j$,
    yielding
  #[#set math.equation(numbering: n => "(8.14)")
   $ integral_(upright(t w o med r a y s)) G thin thin upright(d) mu_oo =
     sum_(j in bb(Z)) integral G \( S^j d \) thin thin upright(d) mu_(*) \( d \) \, wide
     sum_(j in bb(Z)) integral \| G \( S^j d \) \| thin thin upright(d) mu_(*) < oo . $ <end:band-series>]
  Put $F_j = integral Phi \( h_(2^j) \( 0 \) \) thin thin upright(d) mu_(*)$. These quantities are finite.
    Indeed 21 makes the integrand zero unless $\[ 0 \, 2^j \]$ meets $\[ a \, b \]$, which requires $- 2 lt.eq
    a lt.eq 2^j$; the endpoint intensity on this bounded interval is finite.
    Translation invariance at the dyadic shift $2^j$ gives
  #[#set math.equation(numbering: n => "(8.15)")
   $ integral G \( S^j d \) thin thin upright(d) mu_(*) = F_(j + 1) - F_j . $ <end:F-difference>]
  The absolute convergence in (8.14) implies that $F_j$ has finite limits both as $j arrow.r -
    oo$ and as $j arrow.r + oo$.
  For the fine-scale limit, use the dominating integrable function $upright(bold(1))_({ - 2 lt.eq a lt.eq 1 })$
    for $j lt.eq 0$. Off the null sets ${ a = 0 }$ and ${ b = 0 }$, if $a < 0 < b$,
    then $\[ 0 \, 2^j \]$ is contained in the slow interval for all sufficiently negative $j$,
    and the capped shortfall equals one. If zero lies outside the slow interval,
    the small interval is eventually in a unit ray and its shortfall is zero. Dominated convergence therefore gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ F_(upright("fine")) := lim_(j arrow.r - oo) F_j = mu_(*) { a < 0 < b } gt.eq mu_(*) { - 1 lt.eq a < 0 } =
     I_0 . $ <end:fine-limit>]
  The inequality uses $L gt.eq 1$; possible equality endpoints have zero mass.
  For the coarse-scale limit, (7.6) gives $0 lt.eq h_t \( 0 \) lt.eq 2 C_(*) \/ t$ throughout this band.
    Once $t$ is sufficiently large, all these shortfalls lie in the linear region of (8.1),
    uniformly in the shape. Hence
  $ integral Phi \( h_t \( 0 \) \) thin thin upright(d) mu_(*) lt.eq frac(2 alpha C_(*), t) thin mu_(*) { -
    2 lt.eq a lt.eq t } . $
  For the large dyadic integers $t = 2^j$, atomlessness and integer translation invariance make the last mass
    $\( t + 2 \) I_0$ (the weaker bound $\( t + 3 \) I_0$ would also suffice). Thus
  #[#set math.equation(numbering: n => "(8.17)")
   $ F_(upright("coarse")) := lim_(j arrow.r + oo) F_j lt.eq 2 alpha C_(*) I_0 . $ <end:coarse-limit>]
  Summing (8.15) and applying (8.16), (8.17) now proves
  $ integral_(upright(t w o med r a y s)) G thin thin upright(d) mu_oo = F_(upright("coarse")) -
    F_(upright("fine")) lt.eq - \( 1 - 2 alpha C_(*) \) I_0 lt.eq 0 . $
  This argument also covers $I_0 = 0$; in that case integer translates of ${ 0 lt.eq a < 1 }$ show that $mu_(*) =
    0$. Together with the entirely slow and one-ray cases, this establishes (8.13). ◻
]

#thm([Theorem 8.4.])[
  (Contradiction and eventual positive entropy).  #emph[There is no sequence $k arrow.r +
    oo$ along which the largest Lyapunov exponent of $f_k$ is zero almost everywhere. Consequently 1 holds.]
] <end:contradiction>

#proof[
  Under the supposed zero-exponent sequence, all the preceding measures and identities were constructed.
    Combining (8.7), (8.8), (8.13) gives
  $ integral G thin thin upright(d) mu < H_Phi \, $
  contradicting the exact balance (8.6).
  For every parameter, the top Lyapunov exponent exists almost everywhere and is nonnegative,
    since the derivative cocycle has determinant one. If positivity on a set of positive area failed at
    arbitrarily large positive parameters, the exponent would therefore be zero almost everywhere at each member
    of a sequence tending to $+ oo$, which has just been excluded.
    There is consequently a finite $k_0$ such that, for every $k > k_0$,
    the top exponent is positive on a set of positive normalized area.
    Increasing the threshold gives the same statement for every $k gt.eq k_0$.
    The entropy formula (1.2) gives $h_m \( f_k \) > 0$ for every such $k$.
    In particular the measurable parameter interval $\[ k_0 + 1 \, k_0 + 2 \]$ has positive one-dimensional
    Lebesgue measure and satisfies the required assertion. ◻
]

#heading(level: 1)[References]
#bibitem([1])[P.~Berger and P.~D.~Carrasco, #emph[Non-uniformly hyperbolic diffeomorphisms derived from the
  standard map], Communications in Mathematical Physics #strong[329] (2014), no.~1, 239--262.
  #link("https://doi.org/10.1007/s00220-014-1932-1")[doi:10.1007/s00220-014-1932-1].]
#bibitem([2])[P.~Berger and D.~Turaev, #emph[On Herman's positive entropy conjecture],
  Advances in Mathematics #strong[349] (2019), 1234--1288.
  #link("https://doi.org/10.1016/j.aim.2019.04.002")[doi:10.1016/j.aim.2019.04.002].]
#bibitem([3])[M.~Bestvina, #emph[Real trees in topology, geometry, and group theory], arXiv:math/9712210v1 (1997).
  #link("https://arxiv.org/abs/math/9712210v1")[arXiv:math/9712210v1].]
#bibitem([4])[K.~Bloor and S.~Luzzatto, #emph[Some remarks on the geometry of the standard map],
  International Journal of Bifurcation and Chaos #strong[19] (2009), no.~7, 2213--2232.
  #link("https://doi.org/10.1142/S0218127409024025")[doi:10.1142/S0218127409024025].]
#bibitem([5])[A.~Blumenthal, #emph[Statistical properties for compositions of standard maps with increasing
  coefficient], Ergodic Theory and Dynamical Systems #strong[41] (2021), no.~4, 981--1024.
  #link("https://doi.org/10.1017/etds.2019.115")[doi:10.1017/etds.2019.115].]
#bibitem([6])[A.~Blumenthal, J.~Xue, and L.-S.~Young, #emph[Lyapunov exponents for random perturbations of some
  area-preserving maps including the standard map], Annals of Mathematics #strong[185] (2017), no.~1, 285--310.
  #link("https://doi.org/10.4007/annals.2017.185.1.5")[doi:10.4007/annals.2017.185.1.5].]
#bibitem([7])[B.~V.~Chirikov, #emph[A universal instability of many-dimensional oscillator systems],
  Physics Reports #strong[52] (1979), no.~5, 263--379.
  #link("https://doi.org/10.1016/0370-1573(79)90023-1")[doi:10.1016/0370-1573(79)90023-1].]
#bibitem([8])[P.~Duarte, #emph[Plenty of elliptic islands for the standard family of area preserving maps],
  Annales de l'Institut Henri Poincaré. Analyse non linéaire #strong[11] (1994), no.~4, 359--409.
  #link("https://www.numdam.org/item/AIHPC_1994__11_4_359_0/")[Official article record].]
#bibitem([9])[A.~Gorodetski, #emph[On stochastic sea of the standard map],
  Communications in Mathematical Physics #strong[309] (2012), no.~1, 155--192.
  #link("https://doi.org/10.1007/s00220-011-1365-z")[doi:10.1007/s00220-011-1365-z].]
#bibitem([10])[M.~Holland and S.~Luzzatto, #emph[Stable manifolds under very weak hyperbolicity conditions],
  Journal of Differential Equations #strong[221] (2006), no.~2, 444--469.
  #link("https://doi.org/10.1016/j.jde.2005.07.013")[doi:10.1016/j.jde.2005.07.013].]
#bibitem([11])[A.~Katok, in collaboration with K.~Burns, #emph[Infinitesimal Lyapunov functions,
  invariant cone families and stochastic properties of smooth dynamical systems],
  Ergodic Theory and Dynamical Systems #strong[14] (1994), 757--785.
  #link("https://doi.org/10.1017/S0143385700008142")[doi:10.1017/S0143385700008142].]
#bibitem([12])[R.~Mañé, #emph[A proof of Pesin's formula], Ergodic Theory and Dynamical Systems #strong[1] (1981),
  no.~1, 95--102. #link("https://doi.org/10.1017/S0143385700001188")[doi:10.1017/S0143385700001188].]
#bibitem([13])[R.~Mañé, #emph[Errata to A proof of Pesin's formula],
  Ergodic Theory and Dynamical Systems #strong[3] (1983), no.~1, 159--160.
  #link("https://doi.org/10.1017/S0143385700001863")[doi:10.1017/S0143385700001863].]
#bibitem([14])[D.~Obata, #emph[Uniqueness of the measure of maximal entropy for the standard map],
  Commentarii Mathematici Helvetici #strong[96] (2021), no.~1, 79--111.
  #link("https://doi.org/10.4171/CMH/508")[doi:10.4171/CMH/508].]
#bibitem([15])[F.~Oliveira, #emph[Positive topological entropy for the Standard Map], arXiv:2404.02209v2 (2024).
  #link("https://arxiv.org/abs/2404.02209")[arXiv:2404.02209].]
#bibitem([16])[V.~I.~Oseledets, #emph[A multiplicative ergodic theorem.
  Lyapunov characteristic numbers for dynamical systems], Transactions of the Moscow Mathematical Society
  #strong[19] (1968), 197--231. #link("https://www.mathnet.ru/eng/mmo214")[Official bibliographic record].]
#bibitem([17])[Ya.~B.~Pesin, #emph[Characteristic Lyapunov exponents and smooth ergodic theory],
  Russian Mathematical Surveys #strong[32] (1977), no.~4, 55--114.
  #link("https://doi.org/10.1070/RM1977v032n04ABEH001639")[doi:10.1070/RM1977v032n04ABEH001639].]
