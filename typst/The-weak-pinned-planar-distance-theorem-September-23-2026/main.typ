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

#align(center)[#text(size: 16pt, weight: "bold")[The weak pinned planar distance theorem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a finite set $P subset bb(R)^2$ and a point $x in P$, write

$ D_x \( P \) = { lr(bar.v.double y - x bar.v.double)_2 : y in P \\ { x } } . $

The weak pinned Erdős distinct-distance conjecture asserts that, for every $epsilon > 0$,
  every sufficiently large $n$-point planar set has a point $x$ with $\| D_x \( P \) \| gt.eq n^(1 - epsilon)$.
  Erdős explicitly stated this question in 1957 #cite(label("Erdos1957")) Problem 16;
  the modern terminology appears, for example, in #cite(label("WeakPinned2025")) Conjecture 4.7.
  We resolve it positively by proving a uniform assertion about distance multiplicities at their individual pins.
  Its consequence will give the stated number of distances at all but $o \( n \)$ pins.

For distinct $x \, y in P$, define the #emph[distance fiber size]

$ k_P \( x \, y \) = \| { z in P \\ { x } : lr(bar.v.double z - x bar.v.double)_2 =
  lr(bar.v.double y - x bar.v.double)_2 } #scale(x: 120%, y: 120%)[\|] . $

This counts $y$ itself. Different pairs use their own source point $x$;
  the definition does not pool pairs having one common numerical distance. For $n gt.eq 2$ and $s > 0$, put

$ F_n \( s \) = sup_(P subset bb(R)^2\
\| P \| =
  n)
  frac(\| { \( x \, y \) in P^2 : x eq.not y \, med k_P \( x \, y \) gt.eq n^s } #scale(x: 120%, y: 120%)[\|],
  n \( n - 1 \)) . $

#thm([Theorem 1.1.])[
  #emph[For every fixed $s > 0$, one has $F_n \( s \) arrow.r 0$ as $n arrow.r oo$.]
] <thm:main>

No hypothesis on separation, general position, or the coordinates is imposed.
  The convergence is uniform over all configurations. Its exponent $s$ is fixed;
  the theorem supplies no explicit rate of decay.

#thm([Corollary 1.2.])[
  #emph[For every fixed $epsilon > 0$,
$ sup_(P subset bb(R)^2\
\| P \| = n) frac(\| { x in P : \| D_x \( P \) \| < n^(1 - epsilon) } #scale(x: 120%, y: 120%)[\|], n) arrow.r 0 . $

 In particular, every sufficiently large $n$-point planar set has a pin determining at least $n^(1 - epsilon)$
   distinct nonzero distances.]
] <cor:pins>

#proof[
  For $epsilon gt.eq 1$, every pin in a set of at least two points already has at least one distance.
    Suppose $0 < epsilon < 1$, and take $s = epsilon \/ 2$. At a pin with fewer than $n^(1 - epsilon)$ distance
    classes, fewer than $n^(1 - epsilon + s)$ neighbors lie in classes of size less than $n^s$.
    Each such pin therefore contributes at least $n - 1 - n^(1 - epsilon \/ 2)$ pairs counted by $F_n \( s \)$.
    If there are $b$ such pins, then, for all sufficiently large $n$,
  $ b / n lt.eq frac(\( n - 1 \) F_n \( epsilon \/ 2 \), n - 1 - n^(1 - epsilon \/ 2)) arrow.r 0 . $
  The bound is independent of $P$. ◻
]

=== 1.1 Background and significance <background-and-significance>

Erdős initiated the planar distinct-distance and repeated-distance problems in 1946 #cite(label("Erdos1946")).
  The global distinct-distance problem asks for the minimum size of the union $union.big_(x in P) D_x \( P \)$.
  The square lattice gives sets for which this union has size at most a constant multiple of $n \/
  sqrt(log n)$ #cite(label("Erdos1946")) Theorem 1. Guth and Katz proved that every planar $n$-point set
  determines at least a constant multiple of $n \/ log n$ distances #cite(label("GuthKatz")) Theorem 1.1.
  Their conclusion concerns the union; the pinned question requires the distances to have a common source.

The development of pinned bounds combined incidence geometry with increasingly effective counting and entropy
  estimates. Solymosi and Tóth proved a pinned lower bound of order $n^(6 \/ 7)$ #cite(label("SolymosiToth"))
  Theorem 1. Tardos improved this exponent using entropy inequalities for patterns of sums and differences
  #cite(label("Tardos2003")). Katz and Tardos refined that method to obtain every exponent below

$ frac(48 - 14 e, 55 - 16 e) = 0.864137 dots.h $

#cite(label("KatzTardos")). These results guarantee one pin in every configuration.
  The sharper pinned conjecture asks for order $n \/ sqrt(log n)$ distances at a pin;
  see #cite(label("LundPetridis")) Introduction. Lund and Petridis also explain the distinction between the real
  planar problem and pinned-distance theorems over other fields.

Theorem 1 controls the multiplicity of a distance chosen by sampling a distinct ordered pair.
  Corollary 2 makes its almost-every-pin consequence explicit and resolves the weak pinned conjecture.
  An exceptional set is necessary: if $P$ consists of points on a circle and its center,
  the center sees just one nonzero distance.

=== 1.2 The proof in outline <the-proof-in-outline>

Assuming that Theorem 1 fails, we first choose a sequence with nearly maximal density of pairs in large distance
  fibers. Section 2 extracts a directed graph of these pairs while controlling how much of a fiber can lie in a
  small subset. Transfer for real closed fields preserves every distance equality and disequality and puts each
  finite configuration in a number field #cite(label("RCFTransfer")) Theorems 3.1 and 4.1.
  Neither the field nor its degree is fixed.

The proof then studies distance multiplicities through two coordinate maps.
  For $x = \( u \, v \)$, set $Z_1 \( x \) = u + i v$ and $Z_2 \( x \) = u - i v$. Squared distance factors as

$ lr(bar.v.double x - y bar.v.double)_2^2 = \( Z_1 \( y \) - Z_1 \( x \) \) \( Z_2 \( y \) - Z_2 \( x \) \) . $

Thus on a distance fiber at $x$, the second coordinate is a fractional linear function of the first.
  The normalized product formula balances the logarithms of nonzero coordinate differences across all absolute
  values of the number field #cite(label("ProductFormula")) Theorem 7.15.
  At other complex embeddings the two maps need not be conjugates; the algebraic factorization remains valid.

We turn this balance into an identity for finite nested partitions.
  At each absolute value, points are grouped according to closeness.
  Randomly shifted and rotated square grids provide nested partitions at the complex embeddings.
  At any level, a cell containing more than half the points, called a #emph[giant], is replaced by its complement,
  with multiplicities retained. The resulting overlap of two #emph[distinct] points,
  summed over all levels and absolute values, is the sum of a function of the first point and a function of the
  second. This additive identity is the main use of arithmetic in the proof.

Randomly shifted square dissections appear in Arora’s Euclidean approximation algorithms #cite(label("Arora1998"))
  Section 2.1. Nested partitions and their associated trees also occur in probabilistic metric approximation,
  as in the work of Fakcharoenphol, Rao and Talwar #cite(label("FakcharoenpholRaoTalwar2003")).
  Their approximation controls multiplicative distortion. Here the required grid estimate has a pair-independent
  mean additive error in logarithmic depth; this specific property permits the product-formula cancellation.

We measure the total scale by the integrated distinct-pair overlaps and the average lengths of levels spent
  outside giant cells. The next step is to compare the uniform distribution on a fiber with the uniform
  distribution on the whole configuration. The extremal subset estimate controls cells that contain a source and a
  substantial fraction of its fiber. For an actual partition cell containing only a small fraction,
  the other coordinate supplies the missing control: without grid errors,
  its source cell at the complementary level contains the rest of the fiber.
  Together these estimates make the small-cell contribution negligible relative to one plus the total scale (Section 4).

We then compare three laws on distinct ordered pairs: the uniform law within a fiber,
  a law with one fiber-uniform and one ambient-uniform marginal, and the uniform law on the whole configuration.
  The first minus twice the second plus the third has zero total mass and zero sum of its marginals.
  Its integral against the additive overlap kernel therefore vanishes.
  Expanding the cell probabilities gives a squared discrepancy between fiber mass and uniform mass,
  together with explicit finite-population corrections. Large support sizes and the small-cell estimate control
  these corrections. Section 5 establishes the resulting variance bound,
  both for fibers and for the sources of edges ending at a target. The use of distinct pairs is essential:
  singleton cells persist through an infinite range of levels,
  over which even a small diagonal error could not be integrated.

After passing to a subsequence, this nonnegative scale either grows without bound or stays bounded.
  In the first case, we retain cells whose mass and complementary mass are both bounded below.
  They give weighted finite rooted trees with total length comparable to the scale.
  The fiber relation and the fiber variance bound make the source-to-target distance in one tree close to the
  root-to-target distance in the other. The latter depends only on the target.
  Transport on the trees, using the incoming-law variance bound,
  lets us replace two sources arriving at the same target by independent uniform points.
  After replacing the target law as well, the expected absolute difference of their distances to that target would
  be negligible relative to the total overlap scale. An elementary geometric bound for trees contradicts this
  conclusion (Section 6).

If the overlap scale stays bounded, one complex embedding can be normalized so that the two coordinate
  distributions have non-atomic limits. The fiber and incoming-neighbor estimates yield a family of Möbius maps
  carrying one limiting coordinate law to the other. The first source coordinate is independent of the entire
  target pair; the second source coordinate need not be. To remove the latter dependence,
  fix a target pair and sample a point from the first limiting coordinate law.
  Its image under the fiber map has the second limiting law.
  The fiber equation writes the negative logarithm of the distance from that image to the second target coordinate
  as a difference of logarithmic distances from the sampled point to the first source and target coordinates,
  up to an additive constant. Independence lets the first source coordinate approach the first target coordinate.
  This difference then collapses in probability under the fixed sampling law,
  whereas the image’s logarithmic target-distance law has positive spread even after additive constants are
  discarded. Section 7 makes this contradiction precise.

The tree-transport formula is a standard sum of the imbalances across tree edges #cite(label("TreeTransport"))
  Section 2, Equation (5); we prove its finite form and the conditional comparisons needed here.
  Weak compactness and Portmanteau provide subsequential probability laws #cite(label("WeakCompactness"))
  Proposition 5.3 and Theorems 4.2, 3.2. The local arguments must additionally establish non-atomicity,
  independence of the source parameter, and preservation of the fiber map.
  These properties connect the standard tools to the additive overlap identity and its exact variance consequence.

Section 2 prepares the extremal graph and its sampling laws.
  Section 3 constructs the partitions and proves the additive identity.
  Sections 4 and 5 establish the overlap and variance estimates.
  Sections 6 and 7 exclude the two scale regimes and complete the proof of Theorem 1.

== 2 A graph of large distance classes <sec:extremal>

Suppose that the conclusion of Theorem 1 fails. We first extract a positive-density directed graph whose edges
  belong to large distance classes. The extraction also controls how much of a class can lie in a small subset of
  vertices. These two properties will allow us to compare distance classes with the uniform distribution on the
  whole set.

Put

$ Theta \( t \) = limsup_(n arrow.r oo) F_n \( t \) \, wide s_(*) = sup { t > 0 : Theta \( t \) > 0 } . $

Each function $F_n$, and hence $Theta$, is nonincreasing.
  Moreover, $F_n \( t \) = 0$ for $t gt.eq 1$, since a distance class has at most $n - 1$ points.
  Our supposition therefore gives $0 < s_(*) lt.eq 1$. Fix

#[#set math.equation(numbering: n => "(2.1)")
 $ 0 < c < s_(*) \/ 3 \, wide max { c \, \( 1 - c \) s_(*) } < s < s_(*) \, wide c < gamma < s \, $ <eq:ext-parameters>]

choosing $s$ to be a continuity point of $Theta$. Such a choice is possible because the indicated interval is
  nonempty and a monotone function has at most countably many discontinuities.
  Set $theta = Theta \( s \) > 0$; positivity follows from $s < s_(*)$ and monotonicity.
  These parameters remain fixed throughout the proof. All asymptotic estimates below refer to the sequence of
  configurations constructed in Proposition 4, or to a subsequence of it.
  Their constants may depend on these fixed parameters, but not on the configurations or their coordinates.

We record the uniformity consequence of continuity that will be used twice in the extraction.

#thm([Lemma 2.1.])[
  #emph[If $r_N arrow.r s$ and $M_N arrow.r oo$, then
$ sup_(m gt.eq M_N) \( F_m \( r_N \) - theta \)_(+) arrow.r 0 \, $

 where the supremum is over integer $m gt.eq 2$ and $\( u \)_(+) = max { u \, 0 }$.]
] <lem:ext-tail>

#proof[
  Given $epsilon.alt > 0$, continuity permits a fixed $delta > 0$ such that $Theta \( s - delta \) < theta +
    epsilon.alt \/ 2$. For sufficiently large $m$, $F_m \( s - delta \) lt.eq Theta \( s - delta \) +
    epsilon.alt \/ 2$, by the definition of limsup. For sufficiently large $N$, we have $r_N gt.eq s -
    delta$ and all $m gt.eq M_N$ are in this range. Monotonicity now bounds every $F_m \( r_N \)$ by $theta +
    epsilon.alt$. ◻
]

Here are the probability laws associated with a nonempty directed graph $E subset { \( x \, y \) in P^2 :
  x eq.not y }$ on an $n$-point set $P$. Partition its edges into #emph[fibers]:
  edges lie in the same fiber when they have the same source and the same squared distance.
  Write $x_e$ for the source of a fiber $e$, $F_e subset P \\ { x_e }$ for its target set, and $k_e = \| F_e \|$.
  Let $d^(-) \( y \)$ denote the number of incoming edges at $y$.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Law
], table.cell(rowspan: 1, colspan: 1)[Definition
]),
  table.cell(rowspan: 1, colspan: 1)[$alpha$
], table.cell(rowspan: 1, colspan: 1)[Uniform probability measure on $P$.
],
  table.cell(rowspan: 1, colspan: 1)[$pi$
], table.cell(rowspan: 1, colspan: 1)[Uniform probability measure on the $n \( n - 1 \)$ distinct ordered pairs in $P$.
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[Uniform probability measure on $E$,
  with source and target marginals $q_X$ and $q_Y$.
],
  table.cell(rowspan: 1, colspan: 1)[$mu_e$
], table.cell(rowspan: 1, colspan: 1)[Uniform probability measure on $F_e$.
],
  table.cell(rowspan: 1, colspan: 1)[$rho_y$
], table.cell(rowspan: 1, colspan: 1)[Uniform probability measure on the incoming neighbors of $y$,
  defined when $d^(-) \( y \) > 0$.
],
)
]

To sample $q$, one can first choose $e$ with probability $k_e \/ \| E \|$ and then choose $y$ according to $mu_e$,
  setting $x = x_e$. We write $bb(E)_e$ for expectation with these fiber weights.
  Equivalently, one can choose $y$ according to $q_Y$ and then $x$ according to $rho_y$.
  All these laws are attached to the finite graph; they do not depend on any of the absolute values introduced later.

#thm([Proposition 2.2.])[
  #emph[Under the supposition above, there is a sequence of finite sets $P subset
    bb(R)^2$ of real algebraic points, with $n = \| P \| arrow.r oo$, and nonempty directed graphs $E$ on $P$,
    with the following properties. Their densities $d_n = \| E \| \/ \[ n \( n - 1 \) \]$ tend to $theta$,
    and every fiber has $k_e gt.eq n^(s - o \( 1 \))$, uniformly in $e$. For a fixed constant $B_0$,
#[#set math.equation(numbering: n => "(2.2)")
 $ q lt.eq B_0 pi \, wide q_X \, q_Y lt.eq B_0 alpha \, wide
   frac(q_X + q_Y, 2) gt.eq \( 1 - o \( 1 \) \) alpha $ <eq:ext-domination>]

 pointwise, and
#[#set math.equation(numbering: n => "(2.3)")
 $ q_Y { y : d^(-) \( y \) < n^gamma } = O \( n^(gamma - 1) \) = o \( 1 \) . $ <eq:ext-small-degree>]

 Finally, put $lambda_n = 1 \/ log n$. For every subset $C subset P$, with $m = \| C \|$ and $p_e = mu_e \( C \)$,
#[#set math.equation(numbering: n => "(2.4)")
 $ bb(E)_e thin upright(bold(1))_C \( x_e \) p_e upright(bold(1))_({ p_e gt.eq lambda_n }) lt.eq
   cases(delim: "{", \( 1 + o \( 1 \) \) pi \( C^2 \) \, & m > n^(1 - c) \,, o \( 1 \) pi \( C^2 \) \, & m lt.eq
   n^(1 - c) .) $ <eq:subset>]

 All the errors are uniform in vertices, fibers, and subsets wherever these occur.]
] <prop:graph>

#proof[
  We construct the graph, prove that deleting low-degree vertices cannot remove half the configuration,
    and then prove the subset estimate.
  ===== 2.1 Preserving the exact distance pattern. <preserving-the-exact-distance-pattern.>
  For fixed $N$, the numerator defining $F_N \( s \)$ takes values in the finite set ${ 0 \, 1 \, dots.h \,
    N \( N - 1 \) }$. Its maximum is therefore attained, without any compactness assertion about configurations.
    Choose a sequence $N arrow.r oo$ on which $F_N \( s \) arrow.r theta$ and an attaining configuration for each $N$.
  Each such configuration can be replaced by one with real algebraic coordinates without changing any distance
    class. To see this, label its points by $1 \, dots.h \, N$ and use coordinate variables $\( u_i \, b_i \)$.
    Write $D_(i j) = \( u_i - u_j \)^2 + \( b_i - b_j \)^2$. Require $D_(i j) > 0$ for $i < j$, and prescribe,
    for every two unordered pairs, the equality $D_(i j) = D_(k l)$ or the disequality $D_(i j) eq.not
    D_(k l)$ that holds in the original configuration. These are finitely many polynomial conditions over $bb(Q)$;
    a disequality can be expressed as $\( D_(i j) - D_(k l) \)^2 > 0$.
    Their existential sentence holds over $bb(R)$ and therefore over the real algebraic numbers,
    by transfer for real closed fields #cite(label("RCFTransfer")) Theorems 3.1 and 4.1.
    The resulting points are distinct and retain the exact distance equality pattern.
    In particular every class size, and hence the value attaining $F_N \( s \)$, is unchanged.
    The real threshold $N^s$ need not enter the transferred system:
    its comparison with each preserved integer class size is unchanged.
    No bound on the degrees or heights of these coordinates is imposed.
  ===== 2.2 Deleting vertices and small fibers. <deleting-vertices-and-small-fibers.>
  On this algebraic configuration, initially keep every edge counted by $F_N \( s \)$.
    Each initial fiber has at least $N^s$ edges. Define
  $ K_N = frac(N^s, log N) \, wide f_N = frac(log K_N, log N) = s - frac(log log N, log N) \, wide m_0 =
    ceil.l N \/ 2 ceil.r . $
  For all sufficiently large $N$, $f_N > 0$. By Lemma 3,
  $ b_N := max_(m_0 lt.eq m lt.eq N) \( F_m \( f_N \) - theta \)_(+) arrow.r 0 . $
  Put
  $ t_N = b_N + \| F_N \( s \) - theta \| + frac(1, log N) \, wide eta_N = sqrt(t_N) . $
  Thus $eta_N arrow.r 0$, and eventually $theta - eta_N > 0$.
  Whenever a remaining nonempty fiber has fewer than $K_N$ edges, discard it.
    Also, if the current vertex count is $m$ and a vertex has the sum of its outgoing and incoming degrees less
    than $2 \( theta - eta_N \) \( m - 1 \)$, delete that vertex and all its incident edges.
    Clean out small fibers after each vertex deletion, and continue until all degree lower bounds hold.
  There are at most $N \( N - 1 \) \/ N^s$ initial fibers. Restricting vertices never splits a source-distance
    fiber, and each initial fiber can be discarded only once, at a cost below $K_N$.
    Thus all fiber cleanups together cost at most $N \( N - 1 \) \/ log N$ edges.
    Suppose that the process reaches $m_0$ vertices. Put $A_N = N \( N - 1 \)$ and $B_N = m_0 \( m_0 - 1 \)$.
    The total cost of vertex deletions is less than
  $ 2 \( theta - eta_N \) sum_(m = m_0 + 1)^N \( m - 1 \) = \( theta - eta_N \) \( A_N - B_N \) . $
  After cleanup, the number of remaining edges is therefore at least
  $ F_N \( s \) A_N - \( theta - eta_N \) \( A_N - B_N \) - frac(A_N, log N) . $
  Its excess over $\( theta + b_N \) B_N$ is at least
  $ eta_N \( A_N - B_N \) - t_N A_N = eta_N A_N (1 - B_N / A_N - eta_N) > 0 $
  for large $N$, because $B_N \/ A_N arrow.r 1 \/ 4$. On the other hand,
    every remaining edge belongs to a fiber of size at least $K_N = N^(f_N) gt.eq m_0^(f_N)$.
    Its density is therefore bounded above by $F_(m_0) \( f_N \) lt.eq theta + b_N$, a contradiction.
  The process consequently stops on a set $P$ of size $n > m_0$,
    with a graph $E$ whose nonempty fibers have size at least $K_N$.
    Summing the degree lower bounds, and applying the definition of $b_N$ to the remaining graph, gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ theta - eta_N lt.eq d_n lt.eq F_n \( f_N \) lt.eq theta + b_N . $ <eq:ext-density>]
  Here the upper bound applies because $K_N gt.eq n^(f_N)$.
    Thus $d_n arrow.r theta$ and $k_e gt.eq K_N gt.eq n^(s - o \( 1 \))$ uniformly in $e$.
  ===== 2.3 The probability bounds. <the-probability-bounds.>
  For every edge, $q \( x \, y \) \/ pi \( x \, y \) = 1 \/ d_n$, so $B_0 =
    2 \/ theta$ works in the first inequality of (2.2) for large $n$.
    Summing over one coordinate gives the upper marginal bounds. At every vertex, the degree lower bound gives
  $ frac(q_X \( x \) + q_Y \( x \), 2) gt.eq frac(theta - eta_N, d_n) alpha \( x \) gt.eq
    frac(theta - eta_N, theta + b_N) alpha \( x \) = \( 1 - o \( 1 \) \) alpha \( x \) . $
  Only the sum of the two marginals is bounded below; separate lower bounds are not needed.
    The targets of small incoming degree satisfy
  $ q_Y { y : d^(-) \( y \) < n^gamma } lt.eq frac(n thin n^gamma, \| E \|) = O \( n^(gamma - 1) \) \, $
  which proves (2.3) since $gamma < s < 1$.
  ===== 2.4 Large fibers inside subsets. <large-fibers-inside-subsets.>
  It remains to prove (2.4). Define
  $ T_n = lambda_n K_N = frac(N^s, log N log n) . $
  Since $N \/ 2 < n lt.eq N$, there is a sequence $delta_n arrow.r 0$ such that $T_n gt.eq n^(s - delta_n)$;
    in particular, $T_n arrow.r oo$. Multiplying the left side of (2.4) by $\|
    E \|$ counts exactly the edges $\( x_e \, y \) in C^2$ for which $\| F_e ∩ C \| gt.eq lambda_n k_e$.
    Every counted pair therefore satisfies
  $ k_C \( x_e \, y \) gt.eq \| F_e ∩ C \| gt.eq T_n . $
  A nonzero contribution requires $m - 1 gt.eq T_n$, because the source is in $C$ and is excluded from its own
    distance class. Thus all bounded subsets contribute zero for sufficiently large $n$; the cases $m = 0 \,
    1$ give zero at every $n$.
  For $m > n^(1 - c)$, the positive exponent $s - delta_n$ gives $T_n gt.eq n^(s - delta_n) gt.eq
    m^(s - delta_n)$. By Lemma 3, $F_m \( s - delta_n \) lt.eq theta + o \( 1 \)$ uniformly in all these sizes.
    Dividing the resulting pair count by $\| E \|$ yields
  $ bb(E)_e thin upright(bold(1))_C \( x_e \) p_e upright(bold(1))_({ p_e gt.eq lambda_n }) lt.eq
    frac(theta + o \( 1 \), d_n) frac(m \( m - 1 \), n \( n - 1 \)) = \( 1 + o \( 1 \) \) pi \( C^2 \) . $
  For $m lt.eq n^(1 - c)$, choose a fixed $s'$ with $s_(*) < s' < s \/ \( 1 - c \)$, possible by (2.1).
    For sufficiently large $n$,
  $ T_n gt.eq n^(s - delta_n) gt.eq n^(\( 1 - c \) s') gt.eq m^(s') . $
  The definition of $s_(*)$ gives $Theta \( s' \) = 0$, hence $F_m \( s' \) arrow.r 0$ as $m arrow.r oo$.
    Every contributing subset has $m gt.eq T_n + 1$, so
  $ sup_(m gt.eq T_n + 1) F_m \( s' \) arrow.r 0 \, $
  where again only integer sizes are considered. Dividing this pair bound by $\| E \|$ gives $o \( 1 \)
    pi \( C^2 \)$ uniformly over all contributing small subsets; the other subsets contribute zero.
    This also covers $s' > 1$, when the corresponding pair count is identically zero. ◻
]

We henceforth work with the sequence in Proposition 4. In particular, every $k_e gt.eq
  n^gamma$ for sufficiently large $n$. The graph and its sampling laws are now fixed.
  The next section builds partitions adapted to the two factors of squared Euclidean distance;
  Equation (2.4) will later control their small cells.

== 3 Arithmetic and nested partitions <sec:hierarchies>

We now turn the distance equalities in the prepared graph into an exact identity for overlaps of distinct pairs.
  The two ingredients are the factorization of a squared planar distance and the product formula in a number
  field. Nested partitions let us express their logarithms through nonnegative overlap lengths.

=== 3.1 Two coordinates at every place <two-coordinates-at-every-place>

Fix one of the algebraic configurations supplied by Proposition 4.
  Take a number field $K subset bb(C)$ containing all its coordinates and $upright(i) = sqrt(- 1)$.
  For a point $x = \( u \, b \)$ set

$ Z_1 \( x \) = u + upright(i) b \, wide Z_2 \( x \) = u - upright(i) b . $

Both maps are injective, because $u \, b$ are real in the given embedding.
  Their differences remain nonzero under every field embedding of $K$.
  At another complex embedding the two coordinates need not be complex conjugates;
  their injectivity and the algebraic factorization below are the properties we use.
  For distinct $x \, y$ the squared distance factors in $K$ as

#[#set math.equation(numbering: n => "(3.1)")
 $ t \( x \, y \) = \( Z_1 \( y \) - Z_1 \( x \) \) \( Z_2 \( y \) - Z_2 \( x \) \) . $ <eq:hier-factor>]

Let $v$ run over the places of $K$. At a finite place above a prime $p$,
  use the absolute value extending $\| p \|_p = p^(- 1)$ and put
  $sigma_v = \[ K_v : bb(Q)_p \] \/ \[ K : bb(Q) \]$. All archimedean places are complex, since $upright(i) in K$;
  there use ordinary complex modulus and $sigma_v = 2 \/ \[ K : bb(Q) \]$.
  The normalized product formula #cite(label("ProductFormula")) Theorems 7.14–7.15 and Lemma 8.6 reads

#[#set math.equation(numbering: n => "(3.2)")
 $ sum_v sigma_v log \| z \|_v = 0 quad \( z in K \\ { 0 } \) \, wide sum_(v divides oo) sigma_v =
   1 . $ <eq:hier-product>]

The weights convert the norm-based finite absolute values and squared complex moduli in that reference to the
  absolute values used here, after division by $\[ K : bb(Q) \]$. Here and below logarithms are natural.
  For a fixed configuration only finitely many finite places make any coordinate difference $Z_j \( x \) -
  Z_j \( y \)$ a nonunit: each nonzero element of $K$ has nonzero valuation at only finitely many prime ideals,
  and there are finitely many differences.

At a place $v$, define the #emph[raw depths]

$ i_j \( x \, y \) = - log \| Z_j \( x \) - Z_j \( y \) \|_v quad \( x eq.not y \) \, wide j = 1 \, 2 . $

The place is suppressed in this notation. On a fiber $F_e$ with source $x_e$ and squared distance $t_e$,
  Equation (3.1) gives

#[#set math.equation(numbering: n => "(3.3)")
 $ i_1 \( x_e \, y \) + i_2 \( x_e \, y \) = h_e \, wide h_e = - log \| t_e \|_v \, wide y in F_e . $ <eq:hier-fiber>]

The number $h_e$ is finite and independent of the choice of $y$ in the fiber.

=== 3.2 Nested grids and their error <nested-grids-and-their-error>

At a finite place, put $d_j \( x \, y \) = i_j \( x \, y \)$ for distinct points.
  The ultrametric inequality makes $d_j \( x \, y \) gt.eq r$ an equivalence relation.
  At a complex place we obtain the same nesting property from square grids, with a controlled error in the depth.

Independently of all vertex and fiber sampling, choose independently a uniformly random orientation and $xi$
  uniform on $\[ 0 \, log 2 \)$. The grid side lengths are $l_m = e^xi 2^m$, $m in bb(Z)$.
  Choose a shift uniform modulo $l_0$ in each oriented axis.
  To obtain the shift modulo $l_(m + 1)$ from that modulo $l_m$, for $m gt.eq 0$,
  add either $0$ or $l_m$ with equal probabilities, independently at every step and in each axis.
  For $m < 0$ reduce the initial shift modulo $l_m$. Every shift is uniform modulo its side length,
  and the resulting half-open square grids are nested. Use such a grid family for each coordinate $j$.
  Randomly shifted recursive square dissections also appear in Arora’s Euclidean approximation algorithms
  #cite(label("Arora1998")) Section 2.1.

For distinct points, let $d_j \( x \, y \)$ be minus the logarithm of the smallest grid side at which their images
  share a cell. In both the finite and complex cases put $d_j \( x \, x \) = + oo$ and $Delta_j \( x \, y \) =
  d_j \( x \, y \) - i_j \( x \, y \)$ for $x eq.not y$.

The three depth quantities have distinct roles:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Meaning for a distinct pair
]),
  table.cell(rowspan: 1, colspan: 1)[$i_j \( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[Raw logarithmic depth, $- log \| Z_j \( x \) - Z_j \( y \) \|_v$
],
  table.cell(rowspan: 1, colspan: 1)[$d_j \( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[Sharing depth in the nested hierarchy
],
  table.cell(rowspan: 1, colspan: 1)[$Delta_j \( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[Hierarchy error, $d_j \( x \, y \) - i_j \( x \, y \)$
],
)
]

#thm([Lemma 3.1.])[
  #emph[At every complex place the depths are almost surely finite on distinct pairs.
    The distribution of $Delta_j \( x \, y \)$ is independent of the distinct pair, the place,
    and the configuration. Its finite mean is an absolute constant $kappa$, and absolute constants $C_0 \,
    b_0 > 0$ satisfy
#[#set math.equation(numbering: n => "(3.4)")
 $ Pr #scale(x: 120%, y: 120%)[\(] \| Delta_j \( x \, y \) \| > u #scale(x: 120%, y: 120%)[\)] lt.eq
   C_0 e^(- b_0 u) wide \( u gt.eq 0 \) . $ <eq:grid-error>]

 At finite places $Delta_j = 0$.]
] <lem:hier-grid>

#proof[
  Write $R > 0$ for the separation of the two complex values,
    and $\( a \, b \)$ for their displacement along the oriented axes.
    At side length $l$, a uniform shift gives sharing probability
  $ \( 1 - \| a \| \/ l \)_(+) \( 1 - \| b \| \/ l \)_(+) . $
  Sharing is impossible if $l < R \/ sqrt(2)$, whereas separation has probability at most
    $\( \| a \| + \| b \| \) \/ l lt.eq sqrt(2) R \/ l$. The separation events decrease as the grids become
    coarser and their probabilities tend to zero. The pair therefore eventually shares a cell almost surely,
    and there is a smallest sharing scale.
  Write $Delta = d_j \( x \, y \) + log R$. The lower bound on a sharing side gives $Delta lt.eq log sqrt(2)$.
    For $u gt.eq 0$, let $l$ be the largest grid side no larger than $R e^u$, so $l > R e^u \/ 2$.
    On ${ Delta < - u }$ the pair is separated at that side; hence
  $ Pr \( Delta < - u \) lt.eq 2 sqrt(2) e^(- u) . $
  This proves (3.4) and a uniform first absolute moment.
  For any real $u$, the event ${ Delta gt.eq u }$ is sharing at the largest side $l lt.eq R e^(- u)$.
    The law of $l \/ R$ depends only on $u$, by the uniform logarithmic phase,
    and the displacement direction relative to the axes is uniform.
    The sharing formula therefore makes the entire law of $Delta$ independent of the pair.
    The construction uses countably many random variables and cell tests,
    so the depths and all these events are measurable. ◻
]

=== 3.3 Removing the giant cell <removing-the-giant-cell>

Discard the null event on which any distinct-pair depth is not finite.
  For either type of place let $Pi_j \( r \)$ be the partition with pair-sharing criterion $d_j \( x \, y \) gt.eq
  r$, for $r in bb(R)$. These partitions are nested as $r$ increases.
  Call a cell a #emph[giant] if its size exceeds $n \/ 2$, and denote the unique such cell, when it exists,
  by $G_j \( r \)$. Replace that cell by its complement and keep all other cells.
  The resulting family $cal(C)_j \( r \)$ is a multiset: if the complement is itself one other cell,
  it occurs twice. Every member $C$ has $alpha \( C \) lt.eq 1 \/ 2$. Figure 1 illustrates why multiplicities matter.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.125, 1.317), [#text(size: 9pt)[Original partition, $n=8$]])
  rect((0, 0), (2.55, 0.85), fill: rgb("#f2f2f2"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  rect((2.89, 0), (4.59, 0.85), fill: rgb("#ebebff"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((1.275, 0.425), [#text(size: 9pt)[$\{1,2,3,4,5\}$]])
  content((3.74, 0.425), [#text(size: 9pt)[$\{6,7,8\}$]])
  content((1.275, -0.3825), [#text(size: 9pt)[Giant $G$]])
  content((3.74, -0.3825), [#text(size: 9pt)[$C$]])
  line((4.803, 0.425), (5.567, 0.425), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.905, 1.317), [#text(size: 9pt)[Transformed multiset]])
  rect((5.78, 0), (7.48, 0.85), fill: rgb("#ebebff"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  rect((7.99, 0), (9.69, 0.85), fill: rgb("#ebebff"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((6.63, 0.425), [#text(size: 9pt)[$\{6,7,8\}$]])
  content((8.84, 0.425), [#text(size: 9pt)[$\{6,7,8\}$]])
  content((6.63, -0.3825), [#text(size: 9pt)[$P without G$]])
  content((8.84, -0.3825), [#text(size: 9pt)[$C$]])
})],
  caption: [Figure 1: Replacing a giant cell by its complement can duplicate an existing cell. Both occurrences are retained in every overlap sum. ],
) <fig:giant>

This replacement removes the overlap of all pairs at very coarse scales.
  Its cost is a function of each endpoint separately, which will disappear when pair laws with the same combined
  marginals are compared. Define

$ M_j & = sup { r : G_j \( r \) upright(" exists") } \,\
S_j \( x \) & = integral_({ r : G_j \( r \) upright(" exists") }) upright(bold(1))_({ x in.not G_j \( r \) }) thin
  d r \,\
L_j \( x \, y \) & = integral_(bb(R)) sum_(C in cal(C)_j \( r \)) upright(bold(1))_C \( x \)
  upright(bold(1))_C \( y \) thin d r wide \( x eq.not y \) . $

#thm([Lemma 3.2.])[
  #emph[For each realized hierarchy on $n gt.eq 2$ points, the displayed quantities are finite and,
    for distinct $x \, y$,
#[#set math.equation(numbering: n => "(3.5)")
 $ d_j \( x \, y \) = M_j + L_j \( x \, y \) - S_j \( x \) - S_j \( y \) . $ <eq:depth>]

 They are integrable over the grids. At every finite place where all distinct coordinate differences are units,
   $M_j = S_j = L_j = 0$.]
] <lem:hier-depth>

#proof[
  Suppress $j$, and let $d_(-)$ and $d_(+)$ be the minimum and maximum of the finitely many distinct-pair depths.
    Below $d_(-)$ the partition has only the cell $P$; above $d_(+)$ it has only singletons.
    A giant at any level has a giant ancestor at every coarser level.
    Thus a giant exists on an initial ray with endpoint $M in \[ d_(-) \, d_(+) \]$,
    up to an immaterial endpoint convention.
  Let $o \( r \) = upright(bold(1))_({ d \( x \, y \) gt.eq r })$, $g \( r \) =
    upright(bold(1))_({ G \( r \) upright(" exists") })$, and $t \( r \) =
    sum_(C in cal(C) \( r \)) upright(bold(1))_C \( x \) upright(bold(1))_C \( y \)$.
    Expanding the giant indicator through its complement gives the pointwise identity
  $ o \( r \) - g \( r \) = t \( r \) -
    upright(bold(1))_({ G \( r \) upright(" exists") \, med x in.not G \( r \) }) -
    upright(bold(1))_({ G \( r \) upright(" exists") \, med y in.not G \( r \) }) . $
  The integral of the left side is $d \( x \, y \) - M$. Each term on the right vanishes outside
    $\[ d_(-) \, d_(+) \]$ on a distinct pair, and $t \( r \) lt.eq 2$.
    Consequently integration proves (3.5), with bounds
  $ 0 lt.eq S \( x \) lt.eq d_(+) - d_(-) \, quad 0 lt.eq L \( x \, y \) lt.eq 2 \( d_(+) - d_(-) \) \,
    quad \| M \| lt.eq max \( \| d_(-) \| \, \| d_(+) \| \) . $
  These bounds are grid integrable by Lemma 5, since the configuration has finitely many pairs and finite raw
    depths. At a finite place with all raw depths zero, $d_(-) = d_(+) = 0$, proving the final assertion.
    Ties change neither the identity nor any integral. ◻
]

The empty complement of $P$ and singleton occurrences contribute zero to every distinct-pair overlap.
  We do not define $L_j \( x \, x \)$: singleton cells persist to arbitrarily fine scales,
  so its integral would be infinite.

=== 3.4 The exact overlap identity <the-exact-overlap-identity>

For a nonnegative or integrable quantity depending on the place and grids, write

$ ⟨H⟩ = sum_v sigma_v bb(E)_(upright("grids")) H \, wide cal(I) \( g \) = ⟨sum_(j = 1)^2 integral_(bb(R))
  sum_(C in cal(C)_j \( r \)) g thin d r⟩ . $

There is no grid randomness at finite places. The integrand $g$ may also depend on the coordinate, level,
  and cell occurrence. All sums over $cal(C)_j \( r \)$ retain multiplicity.
  These notations do not assert finiteness for an arbitrary $g$;
  finiteness will be established for each expression used.

Set

$ S^(*) \( x \) = ⟨S_1 \( x \) + S_2 \( x \)⟩ \, wide L^(*) \( x \, y \) = ⟨L_1 \( x \, y \) +
  L_2 \( x \, y \)⟩ quad \( x eq.not y \) . $

Lemma 6 and the finite set of nonunit places show that these quantities, and $⟨M_1 + M_2⟩$, are finite.
  For each distinct pair, the product formula and Lemma 5 give

$ ⟨d_1 \( x \, y \) + d_2 \( x \, y \)⟩ = 2 kappa . $

Taking expectations in (3.5) is therefore legitimate and yields the promised additive identity

#[#set math.equation(numbering: n => "(3.6)")
 $ L^(*) \( x \, y \) = b_(*) + S^(*) \( x \) + S^(*) \( y \) quad \( x eq.not y \) \, wide b_(*) =
   2 kappa - ⟨M_1 + M_2⟩ . $ <eq:additive>]

In particular, any signed law on distinct pairs with zero total mass and zero sum of its two marginals has zero
  integral against $L^(*)$. This consequence is exact; no error from sampling a diagonal pair is involved.

The three nonnegative finite scales used below are

#[#set math.equation(numbering: n => "(3.7)")
 $ W_2 = cal(I) #scale(x: 120%, y: 120%)[\(] pi \( C^2 \) #scale(x: 120%, y: 120%)[\)] =
   bb(E)_pi L^(*) \( x \, y \) \, wide A = bb(E)_alpha S^(*) \( x \) \, wide W = W_2 + A . $ <eq:hier-scales>]

Thus $W_2$ measures distinct-pair overlap after the giant is replaced,
  while $A$ measures the average time spent outside the giant.
  Equation (3.6) relates these scales to the graph and fiber laws.
  Every absolute grid-error bound remains uniform in $K$, since its archimedean weights sum to one.

== 4 Small cells and fiber mass <sec:smallcells>

We now combine the subset estimate with the overlap identity.
  The goal is to show that cells of size at most $n^(1 - c)$ carry only $o \( W + 1 \)$ of the off-diagonal
  overlap. The main issue is a cell containing a source but only a small fraction of its fiber;
  the paired coordinate will control this contribution.

First, Equation (3.6) and the uniform marginals of $pi$ give $W_2 = b_(*) + 2 A$.
  If $\( q_X + q_Y \) \/ 2 gt.eq \( 1 - epsilon.alt_n \) alpha$, where $epsilon.alt_n arrow.r 0$, then

$ bb(E)_q L^(*) \( x \, y \) = W_2 + sum_(x in P) #scale(x: 120%, y: 120%)[\(] q_X \( x \) + q_Y \( x \) -
  2 alpha \( x \) #scale(x: 120%, y: 120%)[\)] S^(*) \( x \) . $

Since $S^(*) gt.eq 0$ and $q lt.eq B_0 pi$, it follows that

#[#set math.equation(numbering: n => "(4.1)")
 $ W_2 - o \( 1 \) A lt.eq cal(I) #scale(x: 120%, y: 120%)[\(] q \( C^2 \) #scale(x: 120%, y: 120%)[\)] =
   bb(E)_q L^(*) \( x \, y \) lt.eq B_0 W_2 . $ <eq:q-overlap>]

For a current cell occurrence $C$, write $a = alpha \( C \)$ and $p = mu_e \( C \)$;
  the latter depends on the fiber $e$. Define

$ T \( lambda \) = cal(I) (bb(E)_e upright(bold(1))_C \( x_e \) p thin upright(bold(1))_({ p < lambda })) . $

This is finite, since its integrand is at most $q \( C^2 \) = bb(E)_e upright(bold(1))_C \( x_e \) mu_e \( C \)$.

#thm([Lemma 4.1.])[
  #emph[For the prepared graph and its hierarchies, if $0 < lambda < 1 \/ 2$, $2 \/ n lt.eq tau lt.eq 1$,
    and $H gt.eq 1$, then
#[#set math.equation(numbering: n => "(4.2)")
 $ T \( lambda \) lt.double (lambda / tau^2 + lambda) W_2 + tau A + lambda H + e^(- b_1 H) \, $ <eq:small-fiber>]

 where $b_1 > 0$ is absolute. The implicit constant depends only on $B_0$ and the absolute constants in Equation (3.4).]
] <lem:small-fiber>

#proof[
  We separate large cells, complements of giants, and actual small cells. For a set of size $m gt.eq 2$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ frac(alpha \( C \)^2, 2) lt.eq pi \( C^2 \) = frac(m \( m - 1 \), n \( n - 1 \)) lt.eq
     alpha \( C \)^2 . $ <eq:sc-pair-comparison>]
  If $a gt.eq tau$, then $m gt.eq 2$ and the integrand of $T \( lambda \)$ is at most $lambda lt.eq
    2 lambda pi \( C^2 \) \/ tau^2$. These occurrences contribute at most $2 lambda W_2 \/ tau^2$.
    If $C$ is the complement occurrence of a giant and $a < tau$, its contribution is at most
  $ q \( C^2 \) lt.eq B_0 pi \( C^2 \) lt.eq B_0 tau a . $
  The integral of $a$ over the giant-complement occurrences is $A$, so their contribution is at most $B_0 tau A$.
    These two classes retain the multiplicities of the transformed family.
  It remains to treat actual nongiant cells of mass less than $tau$.
    Fix a place, a coordinate $j$, and the two entire realized hierarchies.
    Let $j'$ be the other coordinate and set $H_v = H$ at archimedean places, $H_v = 0$ otherwise.
    For a fiber $e$ with source $x = x_e$, let $U$ be the actual $j$-cell containing $x$ at level $r$,
    and put $p = mu_e \( U \)$. We retain only the levels with $U$ nongiant, $alpha \( U \) < tau$,
    and $p < lambda$. Without grid errors, a fiber point outside the source cell in coordinate $j$ lies inside the
    source cell at the complementary level $h_e - r$ in coordinate $j'$.
    We use two nearby levels in the latter coordinate to measure failures of this complementarity. Define the cells
  $ V_(-) = Pi_(j') \( h_e - r - H_v \) \( x \) \, wide V_(+) = Pi_(j') \( h_e - r + H_v \) \( x \) \, $
  where $Pi_j \( t \) \( x \)$ denotes the cell of $x$ in $Pi_j \( t \)$. Thus $V_(+) subset.eq V_(-)$.
    The two errors are
  $ D^(-) = mu_e #scale(x: 120%, y: 120%)[\(] P \\ \( U union V_(-) \) #scale(x: 120%, y: 120%)[\)] \, wide
    D^(+) = mu_e \( U ∩ V_(+) \) . $
  The fiber identity makes these errors small after integration.
    For a fixed fiber point $y$, write $d = d_j \( x \, y \)$ and $d' = d_(j') \( x \, y \)$.
    Its contribution to $D^(-)$ occurs when $d < r < h_e - H_v - d'$,
    and its contribution to $D^(+)$ occurs when $h_e + H_v - d' lt.eq r lt.eq d$. Hence
  $ integral D^(-) thin d r & = bb(E)_(y tilde.op mu_e) \( h_e - d - d' - H_v \)_(+) \,\
integral D^(+) thin d r & = bb(E)_(y tilde.op mu_e) \( d + d' - h_e - H_v \)_(+) . $
  Their sum is the expectation of $\( \| Delta_j \( x \, y \) + Delta_(j') \( x \, y \) \| - H_v \)_(+)$,
    since $i_j \( x \, y \) + i_(j') \( x \, y \) = h_e$. At nonarchimedean places it is zero.
    At archimedean places Equation (3.4) and the union bound give
  $ Pr #scale(x: 120%, y: 120%)[\(] \| Delta_j + Delta_(j') \| > u #scale(x: 120%, y: 120%)[\)] lt.eq
    2 C_0 e^(- b_0 u \/ 2) . $
  Integrating this tail, averaging over fibers, and using $sum_(v divides oo) sigma_v = 1$, we obtain
  #[#set math.equation(numbering: n => "(4.4)")
   $ ⟨bb(E)_e integral \( D^(-) + D^(+) \) thin d r⟩ lt.double e^(- b_1 H) . $ <eq:sc-errors>]
  No independence of the two errors is required.
  We now split the retained levels into three cases. In each change of level below the fiber is fixed,
    so $h_e$ is constant; both realized hierarchies are held fixed over all levels before any averaging.
  #emph[Case 1: $V_(-)$ is nongiant.] Since $mu_e \( V_(-) \) + D^(-) gt.eq 1 - p > 1 \/ 2$,
  $ p lt.eq 2 lambda #scale(x: 120%, y: 120%)[\(] mu_e \( V_(-) \) + D^(-) #scale(x: 120%, y: 120%)[\)] . $
  After discarding the other restrictions, change levels to $r' = h_e - r - H_v$.
    Sharing a nongiant cell in the $j'$-hierarchy contributes to $L_(j')$,
    so the main term is bounded by $2 lambda bb(E)_q L_(j')$.
    Summing over coordinates and places gives at most $2 B_0 lambda W_2$.
    The error is bounded by Equation (4.4), since $2 lambda < 1$.
  #emph[Case 2: $V_(-)$ is giant and $V_(+)$ is not.] For a fixed source $x$,
    the levels at which its cell in the $j'$-hierarchy is giant form an initial interval, by nesting.
    The two levels defining $V_(-)$ and $V_(+)$ straddle its endpoint,
    so the allowed $r$ have length at most $2 H_v$. As $p < lambda$, this costs at most $2 lambda H_v$ per fiber.
    Summing and averaging gives at most $4 lambda H$.
  #emph[Case 3: $V_(+)$ is giant.] This is the remaining case, since $V_(+) subset.eq V_(-)$. Here
  $ p = D^(+) + mu_e \( U \\ V_(+) \) . $
  The first term is covered by Equation (4.4). In the second change levels to $r' = h_e - r + H_v$ for each fiber.
    At a fixed new level, every counted pair has $y in.not G_(j') \( r' \)$ and shares an actual $j$-cell of size
    less than $tau n$ at some original level.
  For a fixed target $y$, let $N_j \( y \)$ be the union of all actual $j$-cells containing $y$ whose size is less
    than $tau n$, over all levels. These cells form a nested chain of subsets of the finite set $P$,
    so $\| N_j \( y \) \| < tau n$ (with empty union allowed).
    Thus all the possible sources of this target lie in $N_j \( y \) \\ { y }$,
    even though their selected levels depend on the fiber. Each edge belongs to exactly one fiber and retains
    weight $1 \/ \| E \|$ after the level change. The mass at $r'$ is therefore at most
  $ & sum_(y in.not G_(j') \( r' \)) sum_(x in N_j \( y \) \\ { y }) q \( x \, y \)\
 & #h(1cm)  lt.eq frac(B_0, n \( n - 1 \)) sum_(y in.not G_(j') \( r' \)\
N_j \( y \) eq.not diameter) \( \| N_j \( y \) \| - 1 \) lt.eq
  B_0 tau alpha #scale(x: 120%, y: 120%)[\(] P \\ G_(j') \( r' \) #scale(x: 120%, y: 120%)[\)] . $
  In the last step, $\| N_j \( y \) \| - 1 lt.eq tau \( n - 1 \)$ because $tau lt.eq 1$.
    Integrating, summing coordinates and averaging gives $B_0 tau A$.
  The three cases, the initial split, and Equation (4.4) prove Equation (4.2).
    Threshold ties affect only endpoints of level intervals. All rearranged integrands are nonnegative,
    so Tonelli’s theorem applies. ◻
]

We can now discard the small cells in the overlap scale. Recall $lambda_n = 1 \/ log n$.
  Taking $tau = lambda_n^(1 \/ 3)$ and $H = lambda_n^(- 1 \/ 2)$ in Lemma 7 gives

$ T \( lambda_n \) lt.double lambda_n^(1 \/ 3) W + lambda_n^(1 \/ 2) + e^(- b_1 lambda_n^(- 1 \/ 2)) = o \( W + 1 \) . $

Define

$ W_(2 \, upright("sm")) = cal(I) #scale(x: 120%, y: 120%)[\(] pi \( C^2 \)
  upright(bold(1))_({ \| C \| lt.eq n^(1 - c) }) #scale(x: 120%, y: 120%)[\)] . $

Split $cal(I) \( q \( C^2 \) \)$ according to whether $mu_e \( C \) < lambda_n$.
  Equation (2.4), whose errors are uniform in every subset $C$, bounds the other part by

$ \( 1 + o \( 1 \) \) \( W_2 - W_(2 \, upright("sm")) \) + o \( 1 \) W_(2 \, upright("sm")) . $

Adding $T \( lambda_n \) = o \( W + 1 \)$ and comparing with Equation (4.1) yields

#[#set math.equation(numbering: n => "(4.5)")
 $ W_(2 \, upright("sm")) = o \( W + 1 \) . $ <eq:small-overlap>]

This estimate holds before passing to either a bounded or an unbounded subsequence of $W$.

== 5 Variance from off-diagonal sampling <sec:variance>

We now use the additive overlap identity to compare the mass of a cell under a fiber law with its mass under the
  uniform law. The same argument will apply to the conditional law of sources arriving at a target.
  It is essential to sample distinct pairs throughout: the hierarchy has an infinite range of singleton levels,
  so a small diagonal error cannot be integrated indiscriminately.

#thm([Lemma 5.1.])[
  #emph[Let $cal(F)$ be a finite family of probability measures $nu$,
    each uniform on a subset $B subset P$ of size $k gt.eq n^gamma$.
    Give the family nonnegative weights, independent of places and grids, of total mass at most one,
    and write $bb(E)_(cal(F))$ for the weighted sum. Suppose $bb(E)_(cal(F)) nu lt.eq M alpha$ pointwise,
    where $M$ is fixed. For each transformed cell occurrence $C$, put $m = \| C \|$, $a = alpha \( C \)$, and $p =
    nu \( C \)$. Then
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(I) #h(-0.16667em)
   (bb(E)_(cal(F)) [\( p - a \)^2 upright(bold(1))_({ m > n^(1 - c) }) + p^2 upright(bold(1))_({ m lt.eq n^(1 -
   c) \, med p gt.eq 2 \/ k })]) & lt.eq C_M #scale(x: 120%, y: 120%)[\(] n^(c - gamma) W_2 +
   W_(2 \, upright("sm")) #scale(x: 120%, y: 120%)[\)]\
 & = o \( W + 1 \) . $ <eq:variance-quant>]

 The constant $C_M$ depends only on $M$.]
] <lem:variance>

The first term measures discrepancy from $alpha$ on cells large enough for the finite-population corrections to be
  negligible. On a small cell, the second term measures $nu$-mass only when $B ∩ C$ contains at least two points:
  a one-point intersection contributes no distinct-pair overlap within $B$.

#proof[
  The proof uses an exact signed identity for pair probabilities, followed by separate estimates on large cells,
    small cells, and singletons. The integer $k gt.eq n^gamma > 1$ is at least two.
    Let $P_B$ be the uniform law on distinct ordered pairs from $B$.
    Define another law $R_B$ on distinct pairs as follows. First take $X$ uniformly from $B$.
    If $k < n$, then, conditionally on $X$, take $Y$ uniformly from $B \\ { X }$ with probability $k \/ n$,
    and uniformly from $P \\ B$ otherwise. If $B = P$, define $R_B = P_B = pi$ directly;
    the outside branch has zero probability and need not be defined.
  The first marginal of $R_B$ is $nu$, and its second marginal is exactly $alpha$.
    Indeed, a point $y in B$ receives mass
  $ \( k - 1 \) 1 / k k / n frac(1, k - 1) = 1 / n \, $
  and a point $y in.not B$ receives mass $k \( 1 \/ k \) \( \( n - k \) \/ n \) \/ \( n - k \) = 1 \/ n$.
    Thus the signed measure $P_B - 2 R_B + pi$ has total mass zero.
    Its first and second marginals are $alpha - nu$ and $nu - alpha$, respectively, so their sum is zero.
    The additive overlap identity (3.6) gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ cal(I) #scale(x: 120%, y: 120%)[\(] P_B \( C^2 \) - 2 R_B \( C^2 \) +
     pi \( C^2 \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:variance-cancel>]
  This identity involves finite integrals. For fixed $n$, any probability law on distinct pairs is bounded by
    $n \( n - 1 \) pi$ pointwise, so each of the three nonnegative terms has a finite integral because $W_2 < oo$.
    The family weights are independent of places and grids; hence we may average (5.2) over the family.
  We calculate the three cell probabilities before making any estimates.
    Writing $b = \| B ∩ C \|$, so that $p = b \/ k$, gives
  $ P_B \( C^2 \) & = frac(b \( b - 1 \), k \( k - 1 \)) = p^2 - frac(p \( 1 - p \), k - 1) \,\
R_B \( C^2 \) & = p (k / n frac(b - 1, k - 1) + frac(m - b, n)) = a p - k / n frac(p \( 1 - p \), k - 1) \,\
pi \( C^2 \) & = frac(m \( m - 1 \), n \( n - 1 \)) = a^2 - frac(a \( 1 - a \), n - 1) . $
  The middle identity also holds when $k = n$, by the direct definition of $R_B$.
    Therefore, with $H_B \( C \) = P_B \( C^2 \) - 2 R_B \( C^2 \) + pi \( C^2 \)$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ H_B \( C \) = \( p - a \)^2 + (frac(2 k, n) - 1) frac(p \( 1 - p \), k - 1) -
     frac(a \( 1 - a \), n - 1) . $ <eq:variance-finite>]
  Write $overline(H) = bb(E)_(cal(F)) H_B$ and $omega = bb(E)_(cal(F)) 1 lt.eq 1$.
    In the averaged formula, the last term in (5.3) is multiplied by $omega$.
  First suppose $m > n^(1 - c)$. Since $1 \/ \( k - 1 \) lt.eq 2 n^(- gamma)$, $1 \/ \( n - 1 \) lt.eq
    2 n^(- gamma)$, and $bb(E)_(cal(F)) p lt.eq M a$, Equation (5.3) implies
  $ overline(H) \( C \) gt.eq bb(E)_(cal(F)) \( p - a \)^2 - 2 \( M + 1 \) n^(- gamma) a . $
  For every $m gt.eq 2$ we have
  #[#set math.equation(numbering: n => "(5.4)")
   $ 1 / 2 a^2 lt.eq pi \( C^2 \) lt.eq a^2 . $ <eq:variance-pair-comparison>]
  Here $a > n^(- c)$, so $n^(- gamma) a lt.eq 2 n^(c - gamma) pi \( C^2 \)$. Hence
  #[#set math.equation(numbering: n => "(5.5)")
   $ overline(H) \( C \) gt.eq bb(E)_(cal(F)) \( p - a \)^2 -
     4 \( M + 1 \) n^(c - gamma) pi \( C^2 \) . $ <eq:variance-large>]
  Next suppose $2 lt.eq m lt.eq n^(1 - c)$. If $p gt.eq 2 \/ k$, then $b gt.eq 2$ and
  $ P_B \( C^2 \) = p^2 frac(k, k - 1) frac(b - 1, b) gt.eq 1 / 2 p^2 . $
  Since $P_B \( C^2 \)$ is always nonnegative, this proves $P_B \( C^2 \) gt.eq 1 /
    2 p^2 upright(bold(1))_({ p gt.eq 2 \/ k })$ for every $B$. Also $R_B \( C^2 \) lt.eq a p$, and therefore
  $ bb(E)_(cal(F)) R_B \( C^2 \) lt.eq M a^2 lt.eq 2 M pi \( C^2 \) . $
  Discarding the nonnegative term $omega pi \( C^2 \)$ yields
  #[#set math.equation(numbering: n => "(5.6)")
   $ overline(H) \( C \) gt.eq 1 / 2 bb(E)_(cal(F)) #scale(x: 120%, y: 120%)[\[] p^2
     upright(bold(1))_({ p gt.eq 2 \/ k }) #scale(x: 120%, y: 120%)[\]] - 4 M pi \( C^2 \) . $ <eq:variance-small>]
  Finally, if $m = 0$ or $m = 1$, all three pair probabilities vanish exactly.
    For a singleton, $p$ is either zero or $1 \/ k$, so the small-cell term in the conclusion vanishes too;
    a singleton cannot satisfy $m > n^(1 - c)$. This exact cancellation treats the infinite singleton tails.
    We never integrate the separate correction terms in (5.3) over those tails.
  Integrate (5.5) and (5.6) on their respective regions, use the exact zero on empty and singleton cells,
    and apply (5.2). The result is
  $ cal(I) #h(-0.16667em)
    (bb(E)_(cal(F)) [\( p - a \)^2 upright(bold(1))_({ m > n^(1 - c) }) + 1 / 2 p^2 upright(bold(1))_({ m lt.eq
    n^(1 - c) \, med p gt.eq 2 \/ k })]) lt.eq 4 \( M + 1 \) n^(c - gamma) W_2 + 4 M W_(2 \, upright("sm")) . $
  The nonnegative left-hand terms are integrable by these pointwise bounds and the integrability of $overline(H)$
    and the displayed errors. Doubling the bound proves (5.1), with $C_M = 8 \( M + 1 \)$.
  All the cell estimates hold for arbitrary subsets of $P$.
    They therefore include giant complements and count repeated cell occurrences with their original multiplicity.
    In the special case $B = P$, the signed expression and the large-cell variance are zero;
    the small-cell term may equal $a^2$, which is absorbed by $2 pi \( C^2 \)$ as above.
    Finally, $c < gamma$, $W_2 lt.eq W$, and Equation (4.5) give (5.1). ◻
]

We will use Lemma 8 for two families. For the fiber laws $mu_e$, with weights $k_e \/ \| E \|$,
  the weights sum to one and

$ bb(E)_e mu_e = q_Y lt.eq B_0 alpha . $

Their support sizes satisfy $k_e gt.eq n^(s - o \( 1 \)) gt.eq n^gamma$ for all sufficiently large $n$,
  since $gamma < s$.

For the incoming laws $rho_y$, retain the targets whose incoming degree $d_y$ is at least $n^gamma$,
  and use weights $q_Y \( y \) = d_y \/ \| E \|$. Their weighted mean is dominated by $q_X$:

$ sum_(y : d_y gt.eq n^gamma) q_Y \( y \) rho_y lt.eq q_X lt.eq B_0 alpha . $

Each retained law is uniform on its $d_y$ incoming sources, and the family weights have total mass at most one.
  Both families are defined by the same finite graph at every place, as required by the lemma.
  The omitted targets have total mass

#[#set math.equation(numbering: n => "(5.7)")
 $ sum_(y : d_y < n^gamma) q_Y \( y \) lt.eq frac(n^(1 + gamma), \| E \|) = O \( n^(gamma - 1) \) = o \( 1 \) \,
   $ <eq:variance-omitted>]

because the edge density tends to $theta > 0$ and $gamma < 1$.
  Thus the cell-mass estimates apply both to outgoing fibers and to almost all incoming conditional laws.
  These are the two distributions that the remaining argument must compare with $alpha$.

== 6 The case of unbounded overlap scale <sec:unbounded>

The scale $W = W_2 + A$ is finite and nonnegative for each configuration.
  Every counterexample sequence therefore has a bounded-$W$ subsequence or a subsequence on which $W arrow.r oo$.
  We treat the latter here; Section 7 treats the bounded alternative. Suppose, then, that $W arrow.r oo$.
  We will derive a contradiction from the variance estimate and the equation defining each fiber.
  First we show that a positive fraction of $W$ comes from cells whose uniform masses stay away from zero.
  These cells define finite weighted trees. Transport on the trees will turn the fiber equation into an impossible
  assertion about three independent uniform vertices. Throughout this section, $o \( W + 1 \) = o \( W \)$.

=== 6.1 Extracting cells of positive mass <extracting-cells-of-positive-mass>

We first claim that

#[#set math.equation(numbering: n => "(6.1)")
 $ W_2 gt.eq c_1 W $ <eq:unb-overlap-scale>]

for some fixed $c_1 > 0$ and all sufficiently large $n$. At a fixed place and choice of grids, abbreviate $S =
  S_1 + S_2$ and $L = L_1 + L_2$. Choose a fiber $e$ with its edge-induced weight and then choose $Y \,
  Y'$ independently with law $mu_e$. Equation (3.5) and the constant raw depth sum on the fiber give

$ S \( Y \) = M_1 + M_2 - S \( x_e \) - h_e + L \( x_e \, Y \) - Delta_1 \( x_e \, Y \) - Delta_2 \( x_e \, Y \) . $

All source–neighbor pairs are distinct. Thus the first-moment bound from (3.4),
  the normalization of the archimedean weights, and (4.1) imply

$ ⟨bb(E) \| S \( Y \) - S \( Y' \) \|⟩ lt.eq 2 ⟨bb(E)_q L \( x \, y \)⟩ + O \( 1 \) = O \( W_2 \) + O \( 1 \) . $

To compare this with $A$, we use the pointwise bound

#[#set math.equation(numbering: n => "(6.2)")
 $ S^(*) \( x \) gt.eq A - 2 W_2 wide \( n > 2 \) . $ <eq:potential>]

Indeed, the average of $L^(*) \( x \, y \)$ over the $n - 1$ labels $y eq.not x$ equals

$ W_2 + frac(n - 2, n - 1) #scale(x: 120%, y: 120%)[\(] S^(*) \( x \) - A #scale(x: 120%, y: 120%)[\)] \, $

and is nonnegative. Hence $⟨bb(E) S \( Y \)⟩ gt.eq A - 2 W_2$. Consequently

#[#set math.equation(numbering: n => "(6.3)")
 $ ⟨bb(E) min { S \( Y \) \, S \( Y' \) }⟩ gt.eq A - O \( W_2 \) - O \( 1 \) . $ <eq:unb-min-lower>]

For two nonnegative lists $\( a_1 \, a_2 \)$ and $\( b_1 \, b_2 \)$,

$ min { a_1 + a_2 \, b_1 + b_2 } lt.eq sum_(i \, j = 1)^2 min { a_i \, b_j } . $

Indeed, if the first sum is smaller, then $sum_j min { a_i \, b_j } gt.eq a_i$ for each $i$.
  Moreover, nesting of the giants gives, for almost every $u > 0$,

$ { z : S_i \( z \) > u } = P \\ G_i \( M_i - u \) . $

A vertex which leaves the giant at level $r_z < M_i$ has $S_i \( z \) = M_i - r_z$;
  one which never leaves has $S_i \( z \) = 0$. This proves the displayed identity,
  with only finitely many possible threshold ties. Conditional independence of $Y \,
  Y'$ and $a b lt.eq \( a^2 + b^2 \) \/ 2$ now give

#[#set math.equation(numbering: n => "(6.4)")
 $ ⟨bb(E) min { S \( Y \) \, S \( Y' \) }⟩ lt.eq 2 ⟨sum_(i = 1)^2 bb(E)_e integral_(r < M_i)
   mu_e \( P \\ G_i \( r \) \)^2 thin d r⟩ . $ <eq:unb-min-upper>]

To bound the right side, write $p = mu_e \( C \)$ and $a = alpha \( C \)$ for a giant-complement occurrence.
  If $\| C \| > n^(1 - c)$, use $p^2 lt.eq 2 \( p - a \)^2 + 2 a^2$, the variance estimate (5.1), and $a^2 lt.eq
  2 pi \( C^2 \)$. For smaller complements with $p gt.eq 2 \/ k_e$, use the second term of (5.1).
  The remaining terms satisfy $p^2 lt.eq 2 n^(- gamma) p$. Since $bb(E)_e p = q_Y \( C \) lt.eq B_0 a$,
  their integral is $O \( n^(- gamma) A \)$. In particular, this last error is charged to $A$,
  the finite integral of the complement masses. We obtain

$ ⟨bb(E) min { S \( Y \) \, S \( Y' \) }⟩ lt.eq O \( W_2 \) + o \( W \) + O \( n^(- gamma) A \) . $

Together with (6.3), this proves $A lt.eq O \( W_2 \) + o \( W \) + O \( 1 \)$, and hence (6.1).
  Equation (4.1) also gives $cal(I) \( q \( C^2 \) \) gt.double W$.

We next restrict the masses of the cells we use. For a fixed $0 < delta < 1 \/ 4$,
  split the contribution of $a lt.eq delta$ according to $p < 2 delta$ or $p gt.eq 2 delta$.
  In the latter case $p lt.eq p^2 \/ \( 2 delta \)$ and $p - a gt.eq p \/ 2$.
  On large cells this is controlled by the first variance term; on small cells, $p gt.eq 2 delta gt.eq
  2 \/ k_e$ eventually, so the second variance term applies. Therefore

$ cal(I) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ a lt.eq delta }) q \( C^2 \)
  #scale(x: 120%, y: 120%)[\)] lt.eq T \( 2 delta \) + o_delta \( W \) lt.eq O \( delta^(1 \/ 3) W \) +
  o_delta \( W \) . $

For the last inequality apply Lemma 7 with $lambda = 2 delta$, $tau = lambda^(1 \/ 3)$ and any fixed $H gt.eq 1$.
  The terms depending only on $delta \, H$ are $o_delta \( W \)$.
  The implicit constant in $O \( delta^(1 \/ 3) W \)$ is independent of $delta$.
  We may thus choose $delta$ sufficiently small once and for all, and then let $n arrow.r oo$, to obtain

#[#set math.equation(numbering: n => "(6.5)")
 $ cal(I) \( upright(bold(1))_({ a > delta }) \) gt.double W \, wide
   cal(I) \( upright(bold(1))_({ a gt.eq delta \/ 4 }) \) lt.double_delta W . $ <eq:cut-mass>]

The first inequality uses $q \( C^2 \) lt.eq 1$. For the second, when $n$ is large, $a gt.eq
  delta \/ 4$ implies $pi \( C^2 \) gt.eq a^2 \/ 2 gt.eq delta^2 \/ 32$.
  All cutoffs below use this fixed $delta$; in particular, a bound $O_delta \( 1 \)$ is $o \( W \)$ along the
  present subsequence.

Choose a Lipschitz function $w : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ satisfying

$ w \( u \) = w \( 1 - u \) \, wide w = 0 upright(" on ") \[ 0 \, delta \/ 2 \] union \[ 1 - delta \/ 2 \, 1 \] \,
  wide w = 1 upright(" on ") \[ delta \, 1 - delta \] . $

For the original partitions, define

$ ell_j = integral_(bb(R)) sum_(B in Pi_j \( r \)) w \( alpha \( B \) \) thin d r . $

Replacing a giant by its complement preserves every summand by symmetry, with occurrences still counted separately. Thus

#[#set math.equation(numbering: n => "(6.6)")
 $ W lt.double ⟨ell_1 + ell_2⟩ lt.double_delta W . $ <eq:unb-total-length>]

For either family of measures in Lemma 8, we shall use

#[#set math.equation(numbering: n => "(6.7)")
 $ ⟨bb(E)_(cal(F)) sum_(j = 1)^2 integral_(bb(R)) sum_(B in Pi_j \( r \))
   [\| w \( nu \( B \) \) - w \( alpha \( B \) \) \| + w \( alpha \( B \) \) \| nu \( B \) - alpha \( B \) \|] d
   r⟩ = o \( W \) . $ <eq:cut-approx>]

The first term lets us replace cut weights defined by the fiber laws with those defined by the uniform law.
  The second controls the weighted mass imbalance that will appear in the transport comparison.
  Here the family of incoming laws retains only targets with at least $n^gamma$ incoming neighbors,
  as in Section 5. To prove (6.7), note first that its integrand is unchanged under $\( p \, a \)
  mapsto \( 1 - p \, 1 - a \)$. Work therefore with the transformed cells.
  On $a gt.eq delta \/ 4$, all cells are large for large $n$; the Lipschitz bound, Cauchy–Schwarz, (6.5),
  and (5.1) give $o \( W \)$. On $a < delta \/ 4$, the second summand vanishes,
  and the first can be nonzero only if $p > delta \/ 2$. For large cells, $1 lt.eq 16 delta^(- 2) \( p - a \)^2$;
  for small cells, $1 lt.eq 4 delta^(- 2) p^2$ and $p gt.eq 2 \/ k$ eventually.
  The same variance estimate again gives $o \( W \)$.

=== 6.2 Distances obtained from the hierarchy <distances-obtained-from-the-hierarchy>

We have retained a positive total amount of cells, and the masses of those cells are close to their $alpha$-masses
  in the fiber average. We now use these cells as cuts defining a distance. For $nu = alpha$ or $mu_e$, put

$ D_j^nu \( a_0 \, a_1 \) = integral_(bb(R)) sum_(B in Pi_j \( r \)) \| upright(bold(1))_B \( a_0 \) -
  upright(bold(1))_B \( a_1 \) \| thin w \( nu \( B \) \) thin d r . $

We also allow a formal endpoint $oo$, setting $upright(bold(1))_B \( oo \) = 0$ for every cell.
  These quantities are finite for all sufficiently large $n$.
  On the initial ray the only cell is $P$, of weight $w \( 1 \) = 0$; on the final ray all cells are singletons,
  of $nu$-mass either $0$, $1 \/ n$, or $1 \/ k_e$, so their weights vanish too.

For distinct $a_0 \, a_1 in P$ we have

#[#set math.equation(numbering: n => "(6.8)")
 $ D_j^nu \( a_0 \, a_1 \) = integral_(bb(R)) w #scale(x: 120%, y: 120%)[\(] nu { z : d_j \( a_1 \, z \) -
   d_j \( a_0 \, z \) gt.eq u } #scale(x: 120%, y: 120%)[\)] thin d u . $ <eq:projection>]

Indeed, set $d_0 = d_j \( a_0 \, a_1 \)$. Nestedness implies that if $d_j \( a_1 \, z \) > d_0$,
  then $d_j \( a_0 \, z \) = d_0$, and conversely with the indices exchanged.
  Otherwise the two depths to $z$ agree. For $u > 0$ the event in (6.8) is the $a_1$-cell at level $d_0 + u$.
  For $u < 0$ its complement is the $a_0$-cell at level $d_0 - u$, up to strict versus weak threshold ties.
  There are only finitely many finite depths, so those ties have zero Lebesgue measure.
  Splitting the integral at zero and using $w \( t \) = w \( 1 - t \)$ gives exactly the two cell contributions
  above their common depth $d_0$. The depth difference is $+ oo$ at $z = a_1$ and $- oo$ at $z = a_0$;
  no difference $oo - oo$ occurs. Directly from the cell definition, we also have

#[#set math.equation(numbering: n => "(6.9)")
 $ D_j^nu \( oo \, y \) = integral_(bb(R)) w #scale(x: 120%, y: 120%)[\(] nu { z : d_j \( y \, z \) gt.eq
   u } #scale(x: 120%, y: 120%)[\)] thin d u . $ <eq:unb-root-projection>]

For an edge $\( x \, y \)$ in fiber $e$, put $j' = 3 - j$. The fiber equation implies, for $z in F_e$,

$ Z_(j') \( z \) = Z_(j') \( x \) + frac(t_e, Z_j \( z \) - Z_j \( x \)) . $

Consequently, for $z eq.not y$ in this fiber,

$ Z_(j') \( z \) - Z_(j') \( y \) =
  frac(t_e #scale(x: 120%, y: 120%)[\(] Z_j \( y \) - Z_j \( z \) #scale(x: 120%, y: 120%)[\)], \( Z_j \( z \) -
  Z_j \( x \) \) \( Z_j \( y \) - Z_j \( x \) \)) \, $

and hence

#[#set math.equation(numbering: n => "(6.10)")
 $ i_(j') \( y \, z \) = i_j \( y \, z \) - i_j \( x \, z \) + h_e - i_j \( x \, y \) . $ <eq:unb-raw-fiber>]

This identity converts one of the projected distances into a root distance in the other coordinate.
  Here are the details, including the diagonal atom. Under $z tilde.op mu_e$, compare

$ U \( z \) = d_(j') \( y \, z \) \, wide V \( z \) = d_j \( y \, z \) - d_j \( x \, z \) + h_e - i_j \( x \, y \) . $

For $z eq.not y$, Equation (6.10) gives

$ \| U \( z \) - V \( z \) \| lt.eq \| Delta_(j') \( y \, z \) \| + \| Delta_j \( y \, z \) \| + \|
  Delta_j \( x \, z \) \| . $

At $z = y$, both variables are $+ oo$, so their indicators at every finite threshold agree; $z =
  x$ has zero $mu_e$-mass. Tonelli’s theorem therefore gives the precise bound

$ integral_(bb(R)) \| Pr \( U gt.eq u \) - Pr \( V gt.eq u \) \| thin d u lt.eq
  sum_(z in F_e \\ { y }) mu_e \( z \) \| U \( z \) - V \( z \) \| . $

Translation of the threshold by $h_e - i_j \( x \, y \)$ does not change the integral of the weighted tail.
  Apply the Lipschitz bound for $w$, (6.8), and (6.9). After averaging over $e$, $y tilde.op mu_e$,
  grids and places, we obtain

$ ⟨bb(E)_q \| D_j^(mu_e) \( x \, y \) - D_(j')^(mu_e) \( oo \, y \) \|⟩ = O_delta \( 1 \) . $

The error estimate is valid for these sampling laws because (3.4) bounds the grid first moment uniformly for every
  distinct pair. All vertex laws are independent of the grids;
  nonarchimedean errors vanish and the archimedean weights sum to one.

Changing $mu_e$ to $alpha$ changes any one of its cut distances by at most $integral sum_B \|
  w \( mu_e \( B \) \) - w \( alpha \( B \) \) \| thin d r$, independently of the endpoints.
  Thus (6.7), with $D_j = D_j^alpha$, yields

#[#set math.equation(numbering: n => "(6.11)")
 $ ⟨bb(E)_q \| D_j \( x \, y \) - D_(j') \( oo \, y \) \|⟩ = o \( W \) . $ <eq:fiber-tree>]

The remaining task is to replace the edge law in this equation by independent uniform vertices and then exploit
  the geometry of the cut distances.

=== 6.3 Transport to independent uniform vertices <transport-to-independent-uniform-vertices>

Each $D_j$ is the path distance on a finite weighted tree, allowing zero-length edges.
  To see this, take the distinct cells of the nested partitions as vertices, root the inclusion tree at $P$,
  and connect each proper cell $B$ to its least strict supercell. Give this edge length

$ l_j \( B \) = integral_(bb(R)) upright(bold(1))_({ B in Pi_j \( r \) }) w \( alpha \( B \) \) thin d r . $

The points of $P$ are singleton leaves. An edge is crossed by their connecting path exactly when its cell
  separates them, proving the cut formula for $D_j$. The total edge length is exactly $ell_j$.
  The formal endpoint is represented by the root, since the root-cell weight is zero.

For probabilities $rho \, alpha$ on the leaves, let $sans(T)_j \( rho \, alpha \)$ be the least expected
  $D_j$-distance among couplings of the two laws. The tree transport formula is

#[#set math.equation(numbering: n => "(6.12)")
 $ sans(T)_j \( rho \, alpha \) = sum_(B eq.not P) l_j \( B \) \| rho \( B \) - alpha \( B \) \| =
   integral_(bb(R)) sum_(B in Pi_j \( r \)) w \( alpha \( B \) \) \| rho \( B \) -
   alpha \( B \) \| thin d r . $ <eq:unb-transport>]

This standard formula is the finite-tree form of #cite(label("TreeTransport")) Section 2, Equation (5).
  It has a short direct proof. Across the edge above $B$, any coupling must move at least $\| rho \( B \) -
  alpha \( B \) \|$ units of mass. Conversely, first match common mass at each leaf.
  Work upward, matching surplus mass from child subtrees to deficits in other child subtrees,
  and send only the remaining imbalance toward the parent. Across each edge the total mass moved is precisely its
  absolute imbalance; the root imbalance is zero. Decomposing these finitely many transfers into leaf-to-leaf
  paths gives a coupling attaining the displayed cost. Zero-length edges do not affect the argument.

By $q_Y = bb(E)_e mu_e$, convexity and (6.7) give

#[#set math.equation(numbering: n => "(6.13)")
 $ ⟨sans(T)_j \( q_Y \, alpha \)⟩ = o \( W \) \, wide ⟨bb(E)_(q_Y) sans(T)_j \( rho_y \, alpha \)⟩ =
   o \( W \) . $ <eq:unb-two-costs>]

For the second estimate, first apply (6.7) to targets with at least $n^gamma$ incoming neighbors.
  The omitted $q_Y$-mass is $O \( n^(gamma - 1) \) = o \( 1 \)$, independent of the hierarchy.
  Every transport cost is at most $ell_j$, so its omitted contribution is $o \( 1 \) ⟨ell_j⟩ = o \( W \)$ by (6.6).

The conditional source law in Equation (6.11), given the target $y$, is $rho_y$.
  We keep this conditioning while coupling the sources to the uniform law.
  Fix a hierarchy for a moment and put $F \( x \, x' \, y \) = \| D_j \( x \, y \) - D_j \( x' \, y \) \|$.
  If $Y tilde.op q_Y$ and $X \, X'$ are independent with conditional law $rho_Y$, then

$ bb(E) F \( X \, X' \, Y \) lt.eq 2 bb(E)_q \| D_j \( x \, y \) - D_(j') \( oo \, y \) \| . $

For each $y$, use two independent copies of an optimal coupling of $rho_y$ to $alpha$, replacing $X \,
  X'$ by $U \, U'$. Conditional on $y$, the new points are independent with law $alpha$;
  since that law does not depend on $y$, they are also independent of $Y$.
  The triangle inequality bounds the change in $F$ by the sum of the two transport distances.
  Next optimally couple $Y tilde.op q_Y$ to $V tilde.op alpha$, independently of $U \, U'$.
  Moving the last argument of $F$ costs at most twice its transport distance. We have proved the pointwise inequality

$ bb(E)_(alpha^(⊗ 3)) F & lt.eq 2 bb(E)_q \| D_j \( x \, y \) - D_(j') \( oo \, y \) \|\
 & quad + 2 bb(E)_(q_Y) sans(T)_j \( rho_y \, alpha \) + 2 sans(T)_j \( q_Y \, alpha \) . $

Its right side consists of explicit finite cut sums, so no selection of couplings across places or random grids is
  required. Integrating and using (6.11) and (6.13) gives

#[#set math.equation(numbering: n => "(6.14)")
 $ ⟨bb(E)_(x \, x' \, y med upright("iid") med alpha) \| D_j \( x \, y \) - D_j \( x' \, y \) \|⟩ =
   o \( W \) . $ <eq:iid-tree>]

=== 6.4 A lower bound for tree distance fluctuations <a-lower-bound-for-tree-distance-fluctuations>

We finish with an elementary fact whose constants do not depend on the shape of the tree.

#thm([Lemma 6.1.])[
  #emph[Let a finite tree have nonnegative edge lengths of total sum $L$, with path pseudometric $d$,
    and let $alpha$ be a probability on its vertices. Suppose every edge of positive length separates two sets
    each having $alpha$-mass at least $delta \/ 2$, where $0 < delta < 1$.
    If $X \, X' \, Y$ are independent with law $alpha$, then
$ bb(E) \| d \( X \, Y \) - d \( X' \, Y \) \| gt.eq frac(delta^2, 32 \( ceil.l 16 \/ delta ceil.r + 1 \)) L . $

]
] <lem:unb-tree-fluctuation>

#proof[
  There is nothing to prove if $L = 0$. For every fixed $y$,
    the expected distance from $X$ to $y$ is at least $delta L \/ 2$:
    each positive edge separates $y$ from mass at least $delta \/ 2$. Since all distances are at most $L$,
  $ Pr { d \( X \, y \) gt.eq delta L \/ 4 } gt.eq delta \/ 4 . $
  Traverse the tree in a closed walk crossing each edge twice, of total length $2 L$.
    Partition this walk into at most $M = ceil.l 16 \/ delta ceil.r +
    1$ intervals of length at most $delta L \/ 8$, and assign each vertex to an interval containing one chosen
    visit. The resulting classes have diameter at most $delta L \/ 8$. Thus
  $ Pr { d \( X' \, Y \) lt.eq delta L \/ 8 } gt.eq sum_(r = 1)^M alpha \( C_r \)^2 gt.eq 1 \/ M . $
  Conditional on $Y$, the far event for $X$ and the near event for $X'$ are independent.
    The far probability is uniformly at least $delta \/ 4$, so both events occur with probability at least
    $delta \/ \( 4 M \)$. On their intersection the absolute difference of the distances is at least $delta L \/
    8$, proving the claim. ◻
]

In the tree for $D_j$, every positive edge has both side masses greater than $delta \/ 2$,
  by the support condition on $w$. Apply Lemma 9 with $L = ell_j$, sum over $j = 1 \, 2$,
  and average over places and grids. Equations (6.6) and (6.14) give $W lt.double o \( W \)$, a contradiction.
  This excludes every subsequence on which $W arrow.r oo$.

== 7 Bounded scale and a limiting fiber map <sec:bounded>

It remains to exclude a subsequence on which $W$ is bounded.
  We will choose one complex embedding and normalize each coordinate so that the uniform laws have nonatomic
  limits. The variance estimate will give the same limits for the fiber laws and for the conditional incoming
  laws. The exact fiber equation then forces a family of Möbius maps between these limits that cannot exist.

=== 7.1 A selected embedding and normalized limits <a-selected-embedding-and-normalized-limits>

At an archimedean place $v$, define the nonnegative local scale

$ T_v = bb(E)_(upright("grids")) sum_(j = 1)^2 #scale(x: 120%, y: 120%)[\(] bb(E)_pi L_j +
  bb(E)_alpha S_j #scale(x: 120%, y: 120%)[\)] . $

Let $V_v$ be the sum of the local integrals on the left of (5.1),
  for the fiber family and the retained incoming family, including both coordinates and grid expectations but
  omitting the place weight. Since $W$ is bounded, Lemma 8 gives

$ sum_(v divides oo) sigma_v T_v lt.eq C \, wide sum_(v divides oo) sigma_v V_v = eta_n arrow.r 0 . $

The archimedean weights sum to one. The places with $T_v lt.eq 2 C + 1$ have total weight at least $1 \/ 2$,
  so one of them satisfies $V_v lt.eq 2 eta_n$. Choose such a place for each $n$.
  This argument requires no lower bound on an individual place weight.
  Henceforth all coordinates and grids in this section refer to the selected embedding.

Equation (3.5) and the grid error bound (3.4) imply, for $j = 1 \, 2$,

$ bb(E)_(upright("grids")) bb(E)_pi \| i_j \( x \, y \) - M_j \| lt.eq
  bb(E)_(upright("grids")) bb(E)_pi #scale(x: 120%, y: 120%)[\(] L_j \( x \, y \) + S_j \( x \) +
  S_j \( y \) + \| Delta_j \( x \, y \) \| #scale(x: 120%, y: 120%)[\)] = O \( 1 \) . $

Set $m_j = bb(E)_pi i_j \( x \, y \)$. For each realized grid, $\| m_j - M_j \| lt.eq bb(E)_pi \| i_j - M_j \|$,
  and thus $bb(E)_pi \| i_j - m_j \| = O \( 1 \)$. Normalize the coordinates by

$ U_j \( x \) = e^(m_j) Z_j \( x \) + b_j \, $

where the translation $b_j$ will be chosen below. We have

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E)_pi \| log \| U_j \( x \) - U_j \( y \) \| #scale(x: 120%, y: 120%)[\|] lt.eq C_1 . $ <eq:bounded-log>]

Only distinct pairs occur here.

Write $alpha_n^j = \( U_j \)_(*) alpha$ for the empirical coordinate laws. Equation (7.1) implies

$ \( alpha_n^j ⊗ alpha_n^j \) { \| z - z' \| > R } lt.eq frac(C_1, log R) wide \( R > 1 \) . $

Choose a fixed $R_0 > 1$ making this bound less than $1 \/ 2$.
  Averaging over a center at an empirical point gives a radius-$R_0$ disk containing at least half the mass.
  Choose $b_j$ to move that center to zero. If $R > 2 R_0$,
  pairs between this disk and the complement of the radius-$R$ disk have distance at least $R \/ 2$, so

#[#set math.equation(numbering: n => "(7.2)")
 $ alpha_n^j { \| z \| > R } lt.eq frac(2 C_1, log \( R \/ 2 \)) . $ <eq:bounded-tail>]

For every center $z_0 in bb(C)$ and $0 < r < 1 \/ 2$, a similar use of (7.1) gives

#[#set math.equation(numbering: n => "(7.3)")
 $ alpha_n^j \( B \( z_0 \, r \) \)^2 lt.eq 1 / n + frac(C_1, log \( 1 \/ \( 2 r \) \)) . $ <eq:bounded-ball>]

Indeed the diagonal mass of independent pairs in the ball is at most $1 \/ n$,
  and every remaining pair has distance at most $2 r$.

Let $S = hat(bb(C))$ be the Riemann sphere with its chordal metric,
  and write $cal(P) \( S \)$ for its probability measures. The space of probability measures on a compact metric
  space is compact and metrizable for weak convergence #cite(label("WeakCompactness")) Proposition 5.3 and
  Theorem 4.2. We also use the open-set inequality in the Portmanteau theorem #cite(label("WeakCompactness"))
  Theorem 3.2. Passing to a common subsequence, let $alpha_n^j arrow.r.double beta_j$ on $S$, for $j = 1 \, 2$.
  Apply Portmanteau to the open spherical sets ${ \| z \| > R } union { oo }$ in (7.2); then let $R arrow.r oo$.
  This shows $beta_j { oo } = 0$. Apply it to open disks in (7.3), then let $r arrow.b 0$.
  Each $beta_j$ is therefore a nonatomic probability measure on $bb(C)$.

=== 7.2 The variance estimate determines the limiting laws <the-variance-estimate-determines-the-limiting-laws>

For either family from Lemma 8, put $nu_n^j = \( U_j \)_(*) nu$, and write $mu phi =
  integral phi thin d mu$ for a measure $mu$ and a continuous test $phi$.
  We claim that every $phi in C \( S \)$ satisfies

#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E)_(cal(F)) lr(|integral phi thin d nu_n^j - integral phi thin d beta_j|) arrow.r 0 . $ <eq:test-convergence>]

The family weights may sum to less than one; each member $nu$ is still a probability measure.
  In both applications, $bb(E)_(cal(F)) nu lt.eq B alpha$ for a fixed $B$.

Here are the details converting integrated cell variance into (7.4).
  Push every realized grid through the same normalization $z mapsto e^(m_j) z + b_j$.
  This shifts its levels by $- m_j$ and leaves integration over all levels unchanged.
  Fix $R > 0$ and $0 < epsilon.alt < 1$. At normalized levels in the interval

$ I_epsilon.alt = \[ - log epsilon.alt \, - log epsilon.alt + 1 \] \, $

the actual square cells have sides between $epsilon.alt \/ \( 2 e \)$ and $epsilon.alt$.
  At most $N = N \( R \, epsilon.alt \)$ squares meet the radius-$R$ disk, uniformly in the grid and the level.
  For each such actual cell $B'$, let $C$ be its transformed occurrence:
  $C = B'$ unless $B'$ is the giant, in which case $C = P \\ B'$. Since both measures have mass one,

$ \| nu \( B' \) - alpha \( B' \) \| = \| nu \( C \) - alpha \( C \) \| . $

Occurrences are retained with multiplicity. For those with $\| C \| > n^(1 - c)$, Cauchy–Schwarz over the family,
  grids, unit level interval, and at most $N$ occurrences gives an integrated sum of mean absolute discrepancies
  at most $sqrt(N V_v)$. For the others, including an empty giant complement,

$ bb(E)_(cal(F)) \| nu \( C \) - alpha \( C \) \| lt.eq \( B + 1 \) alpha \( C \) lt.eq \( B + 1 \) n^(- c) . $

Approximate $phi$ on each of these squares by its value at any point of the square.
  Its oscillation is at most $omega_phi \( sqrt(2) epsilon.alt \)$,
  where $omega_phi$ is a uniform modulus of continuity in the spherical metric.
  The remaining squares lie outside the radius-$R$ disk, and their mean family mass is at most $B alpha_n^j { \|
  z \| > R }$. Integrating the resulting test-function estimate over grids and the unit interval gives

#[#set math.equation(numbering: n => "(7.5)")
 $ bb(E)_(cal(F)) \| nu_n^j phi - alpha_n^j phi \| lt.eq  & 2 omega_phi \( sqrt(2) epsilon.alt \) + \( B + 1 \)
   parallel phi parallel_oo alpha_n^j { \| z \| > R }\
 & + parallel phi parallel_oo #scale(x: 120%, y: 120%)[\(] sqrt(N V_v) + \( B + 1 \) N n^(- c)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:bounded-test-bound>]

For fixed $R \, epsilon.alt$, let $n arrow.r oo$; then let $R arrow.r oo$ and $epsilon.alt arrow.b 0$.
  Equation (7.2) and $alpha_n^j arrow.r.double beta_j$ prove (7.4).
  For the incoming laws, restoring all omitted targets changes a mean test discrepancy by at most $2 parallel phi
  parallel_oo$ times their $o \( 1 \)$ total $q_Y$-mass. Thus (7.4) holds in full $q_Y$-expectation for $rho_y$ as well.

We have obtained the same nonatomic coordinate limits for typical fibers and for typical incoming laws.
  The first conclusion will preserve the fiber equation in a limit;
  the second will allow its source coordinate to vary independently of its target.

=== 7.3 The joint limit and its fiber equation <the-joint-limit-and-its-fiber-equation>

For a $q$-edge $\( x \, y \)$ in fiber $e$, consider the joint random object

$ #scale(x: 120%, y: 120%)[\(] U_1 \( x \) \, U_2 \( x \) \, U_1 \( y \) \,
  U_2 \( y \) \, \( U_1 \)_(*) mu_e \, \( U_2 \)_(*) mu_e #scale(x: 120%, y: 120%)[\)] med in med S^4 times
  cal(P) \( S \)^2 . $

Take a subsequential weak limit $Q$, and denote its four coordinate entries by $\( a \, b \, a' \, b' \)$.
  The last two entries equal $\( beta_1 \, beta_2 \)$ almost surely.
  To justify this simultaneously for all tests, choose a countable dense sequence $\( f_r \)$ in the unit ball of
  $C \( S \)$. The metric

$ d \( mu \, beta \) = sum_(r gt.eq 1) 2^(- r) \| mu f_r - beta f_r \| $

defines weak convergence. Equation (7.4) on finitely many tests, followed by a bound on the series tail,
  gives convergence of this metric to zero in mean for each fiber projection. Passing to $Q$ proves the assertion.

The inequality $q lt.eq B_0 pi lt.eq 2 B_0 alpha ⊗ alpha$ implies that each limiting same-coordinate pair law is
  dominated by $2 B_0 beta_j ⊗ beta_j$. Indeed the inequality passes to the limit against every nonnegative
  continuous test on $S^2$. Since $beta_j$ is nonatomic and gives infinity mass zero, we have

$ a \, b \, a' \, b' in bb(C) \, wide a eq.not a' \, quad b eq.not b' \, wide a' in "supp" beta_1 \, quad
  b' in "supp" beta_2 quad Q upright("-almost surely") . $

Moreover, $a$ has law $beta_1$ independently of the joint pair $\( a' \, b' \)$.
  For $f in C \( S \)$ and $g in C \( S^2 \)$, conditioning on the actual target vertex gives

$ &
  lr(|bb(E)_q f \( U_1 \( x \) \) g \( U_1 \( y \) \, U_2 \( y \) \) - \( beta_1 f \) bb(E)_(q_Y) g \( U_1 \(
  y \) \, U_2 \( y \) \)|)\
 & #h(15mm)  lt.eq parallel g parallel_oo bb(E)_(q_Y) lr(|integral f thin d \( U_1 \)_(*) rho_y - beta_1 f|) arrow.r 0 $

by (7.4). Such products determine the joint measure on $S times S^2$, proving this independence.
  Keeping both target coordinates together in $g$ is what allows us to fix the entire target pair in the final
  obstruction.

On the open domain of finite quadruples with $a eq.not a'$ and $b eq.not b'$,
  put $t' = \( a' - a \) \( b' - b \)$. We next obtain

#[#set math.equation(numbering: n => "(7.6)")
 $ beta_2 = Phi_(*) beta_1 \, wide Phi \( z \) = b + frac(t', z - a) quad \( z in S \) \, wide
   Q upright("-almost surely") . $ <eq:mobius>]

For each prelimit edge, its two fiber projection measures are related by this Möbius formula,
  with its four coordinates in place of $\( a \, b \, a' \, b' \)$.
  Indeed, normalization multiplies the original fiber product by $e^(m_1 + m_2)$,
  and evaluation at $y$ identifies the new product as $\( U_1 \( y \) - U_1 \( x \) \) \( U_2 \( y \) - U_2 \( x \) \)$.

To pass the equality to the limit, note that the matrix

$ mat(delim: "(", b, t' - a b; 1, - a) $

represents $Phi$ on the sphere and has determinant $- t' eq.not 0$.
  The map is jointly continuous in its parameters and sphere variable, including at its pole.
  Thus its pushforward acts continuously on probability measures with the weak topology,
  as is seen by testing continuous functions and using uniform continuity on compact parameter neighborhoods.
  The equality graph is relatively closed over the stated open domain.
  Its complement within that domain is open in the ambient joint space and has zero mass in every prelimit law.
  Portmanteau gives it zero $Q$-mass. The domain itself has full $Q$-mass, proving (7.6).

=== 7.4 A nonatomic obstruction to the fiber maps <a-nonatomic-obstruction-to-the-fiber-maps>

The following elementary observation completes the argument.
  The second source coordinate $b$ may depend on the other coordinates.
  In the proof it contributes only an additive constant to a logarithmic distance,
  so the independence already proved for $a$ is sufficient.

#thm([Lemma 7.1.])[
  #emph[Let $beta_1 \, beta_2$ be nonatomic probability measures on $bb(C)$.
    There is no probability law on finite quadruples $\( a \, b \, a' \, b' \)$ such that, almost surely,
$ a eq.not a' \, wide b eq.not b' \, wide a' in "supp" beta_1 \, wide b' in "supp" beta_2 \, $

 $a$ has law $beta_1$ independently of $\( a' \, b' \)$, and
$ beta_2 = (z mapsto b + frac(\( a' - a \) \( b' - b \), z - a))_(*) beta_1 $

 as measures on the Riemann sphere.]
] <lem:bounded-mobius>

#proof[
  For a finite real random variable $X$ and a continuous nonnegative function $w$ supported in a compact
    subinterval of $\( 0 \, 1 \)$, define
  $ J_w \( X \) = integral_(bb(R)) w #scale(x: 120%, y: 120%)[\(] Pr \( X gt.eq u \) #scale(x: 120%, y: 120%)[\)]
    thin d u . $
  This is finite: the tail probability tends to one at $- oo$ and zero at $+ oo$,
    so the integrand vanishes outside a bounded interval. It is unchanged when a constant is added to $X$.
    We will also use the fact
  #[#set math.equation(numbering: n => "(7.7)")
   $ X_k arrow.r 0 upright(" in probability") quad arrow.r.double quad J_w \( X_k \) arrow.r
     0 . $ <eq:bounded-collapse>]
  Indeed choose $delta > 0$ such that $w$ vanishes outside $\[ delta \, 1 - delta \]$.
    For any $epsilon.alt > 0$, eventually $Pr \( \| X_k \| gt.eq epsilon.alt \) < delta$.
    For $u gt.eq epsilon.alt$ the upper tail is below $delta$, and for $u lt.eq - epsilon.alt$ it is above $1 -
    delta$. Hence $0 lt.eq J_w \( X_k \) lt.eq 2 epsilon.alt parallel w parallel_oo$, proving (7.7).
  Choose continuous weights $w_l : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$, for integers $l gt.eq 3$,
    each supported inside $\( 0 \, 1 \)$ and equal to one on $\[ 1 \/ l \, 1 - 1 \/ l \]$.
    Write $Phi$ for the map in the statement. For $z eq.not a \, a'$,
  $ Phi \( z \) - b' = \( b' - b \) frac(a' - z, z - a) \, wide - log \| Phi \( z \) - b' \| =
    log frac(\| z - a \|, \| z - a' \|) - log \| b' - b \| . $
  Nonatomicity removes the exceptional points. The pushforward identity and translation invariance of $J_(w_l)$ give
  #[#set math.equation(numbering: n => "(7.8)")
   $ integral_(bb(R)) w_l #h(-0.16667em) (beta_1 #h(-0.16667em) {z : log frac(\| z - a \|, \| z - a' \|) gt.eq
     u}) thin d u = integral_(bb(R)) w_l #h(-0.16667em) (beta_2 { z : - log \| z - b' \| gt.eq u }) thin d u .
     $ <eq:tail-width>]
  All random variables here are finite almost surely, so the integrals are finite.
    They are measurable in their parameters: define the logarithmic kernels arbitrarily at coincidences,
    where the measures vanish, and apply measurability of parameter integrals to the resulting Borel functions.
  The equality in (7.8) depends only on $\( a \, a' \, b' \)$. Intersect the full-measure sets for all $l$.
    The independence assumption and Fubini’s theorem imply that, for almost every target pair $\( a' \, b' \)$,
    all these equalities hold for $beta_1$-almost every $a$. Fix such a target pair in the stated supports.
  For $Z$ of law $beta_2$, the variable $- log \| Z - b' \|$ is nonconstant.
    More explicitly, nonatomicity gives $r_0 > 0$ for which $p = beta_2 { \| z - b' \| gt.eq r_0 } > 0$,
    and support membership gives $0 < r < r_0$ for which $q = beta_2 { \| z - b' \| < r } > 0$.
    For $- log r_0 < u < - log r$ its upper tail lies in $\[ q \, 1 - p \]$.
    Choose one $l$ with $1 \/ l lt.eq min \( p \, q \)$. The right side of (7.8) is then strictly positive.
  The full-$beta_1$-measure equality set contains a sequence $a_k eq.not a'$ tending to $a'$,
    since $a' in "supp" beta_1$ and $beta_1 { a' } = 0$. For $z$ outside the null countable set ${ a' \, a_1 \,
    a_2 \, dots.h }$,
  $ log frac(\| z - a_k \|, \| z - a' \|) arrow.r 0 . $
  Thus these variables converge to zero in $beta_1$-probability.
    By (7.7), the left side of (7.8), for the fixed $l$ just chosen, tends to zero.
    The right side is a fixed positive number, a contradiction. ◻
]

The law $Q$ constructed above satisfies every hypothesis of Lemma 10, so a bounded-$W$ subsequence is impossible.
  Section 6 ruled out a subsequence with $W arrow.r oo$. Every sequence of nonnegative real numbers has a bounded
  subsequence or a subsequence tending to infinity. Therefore the graph sequence from Proposition 4 cannot exist.
  The assumption that $Theta \( s \) > 0$ somewhere was false, so $F_n \( s \) arrow.r 0$ for each fixed $s > 0$.
  This proves Theorem 1.

#bibliography("refs.bib", style: "ieee", title: [References])
