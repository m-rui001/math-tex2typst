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

#align(center)[#text(size: 16pt, weight: "bold")[A power saving for planar unit distances]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a finite set $X subset bb(R)^2$, write

$ u \( X \) = \# { { x \, y } subset X : med lr(bar.v.double x - y bar.v.double)_2 =
  1 #scale(x: 120%, y: 120%)[}] \, wide u \( n \) = max_(X subset bb(R)^2\
\| X \| = n) u \( X \) . $

Thus pairs are unordered and their endpoints are distinct. We prove a fixed power saving over the exponent $4 \/ 3$.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $0 < C < oo$ and $1 lt.eq beta < 4 \/ 3$ such that $u \( n \) lt.eq
    C n^beta$ for every nonnegative integer $n$.]
] <thm:main>

1 gives a positive answer to the question whether this upper exponent can be lowered by a fixed amount:
  equivalently, $u \( n \) = O \( n^(4 \/ 3 - delta) \)$ for an absolute $delta > 0$.
  All constants are independent of the configuration.

=== 1.1 The unit-distance problem and earlier methods <the-unit-distance-problem-and-earlier-methods>

Erdős introduced the repeated-distance problem in 1946 #cite(label("erdos1946")).
  Rescaling a configuration turns any specified positive distance into a unit distance,
  so the problem concerns the largest possible multiplicity of one distance.
  His lattice construction gives the lower bound $n^(1 + c \/ log log n)$ for a positive constant $c$ and
  sufficiently large $n$ #cite(label("erdos1946")) Theorem 2.
  Spencer, Szemerédi and Trotter established the upper bound $u \( n \) =
  O \( n^(4 \/ 3) \)$ in 1984 #cite(label("sst1984")). Székely gave a crossing-number proof and a general
  incidence theorem for families of curves #cite(label("Szekely1997")) Theorems 4 and 8.
  The crossing inequality was developed independently by Ajtai, Chvátal,
  Newborn and Szemerédi and by Leighton #cite(label("ajtaiEtAl1982")) #cite(label("leighton1983")).
  Székely’s incidence theorem applies to points and unit circles using two elementary properties:
  two unit circles meet in at most two points, and two points belong to at most two unit circles.
  Later work improved the leading constant #cite(label("agostonPalvolgyi2022")) and described the structure of
  configurations near the extremal incidence scale #cite(label("katzSilier2026")).
  Pach, Raz and Solymosi connected the problem to rigidity and obtained a logarithmic improvement conditional on a
  rigidity conjecture #cite(label("pachRazSolymosi2026")) Conjecture 7 and Theorem 8.

The historical unit-distance conjecture of Erdős proposed the stronger bound $u \( n \) = n^(1 + o \( 1 \))$.
  An OpenAI construction disproved it by giving at least $n^(1 + epsilon)$ unit distances,
  for some fixed $epsilon > 0$, along an unbounded sequence of sizes #cite(label("openaiUnitLower2026"))
  Theorem 1.1. Alon et al. gave a simplified account and explained the construction’s number-theoretic ancestry
  #cite(label("alonEtAl2026")) Sections 1.2–1.3. They credit the class-group ideas to Michel, Soundararajan,
  Ellenberg and Venkatesh. The construction combines these ideas with Golod–Shafarevich number-field towers having
  prescribed splitting, including the tower-cutting method of Hajir,
  Maire and Ramakrishna #cite(label("ellenbergVenkatesh2007")) #cite(label("golodShafarevich1964"))
  #cite(label("hajirMaireRamakrishna2021")). Sawin sharpened the construction to $u \( n \) gt.double
  n^1.014114$ along an unbounded sequence of sizes #cite(label("sawin2026")) Theorem 1.
  These are construction lower bounds. Theorem 1 bounds every configuration from above,
  leaving a gap between the known exponents.

Our proof begins with the same point–circle incidence interpretation.
  Random cuttings isolate a piece of the incidence graph with controlled degrees;
  their sampled-cell construction belongs to the framework of Clarkson and Clarkson–Shor
  #cite(label("Clarkson1987")) #cite(label("ClarksonShor1989")). The next ingredient is information:
  two points sampled as neighbors of one center share little information.
  Entropy methods already played a role in the distinct-distance estimates of Tardos and Katz–Tardos
  #cite(label("Tardos2003")) #cite(label("KatzTardos")). In particular,
  the conditional-copy argument of Katz–Tardos retains the marginal law when resampling within a class.
  Here that principle enters a short-history prediction lemma whose tests may depend on a neighboring center.
  Its exact conditional laws and the independence of the fresh test are proved in 3.

The arithmetic input is the normalized product formula #cite(label("ProductFormula")).
  We use the associated absolute height of algebraic numbers:
  the weighted sum of the positive parts of their logarithmic absolute values.
  The product formula converts relations between unit-edge jumps into bounds summed over all absolute values.
  The proof then combines these bounds with prediction and, at its last stage,
  algebraic independence and quadratic extensions. The intermediate statements connecting probability,
  height and algebra are proved in the paper.

=== 1.2 The proof in outline <the-proof-in-outline>

Suppose that no fixed power saving exists. Set $t = n^(1 \/ 3)$ along a sequence of counterexamples,
  so their ordered unit pairs number $t^(4 - o \( 1 \))$. The following steps produce a contradiction.

===== 1.2.1 An incidence graph and its sampling laws. <an-incidence-graph-and-its-sampling-laws.>

Use two copies of the configuration as points and unit-circle centers.
  An edge joins a point to a center at unit distance. Algebraic specialization preserves these equations and
  distinctness. In 2 we restrict this graph to a piece with controlled degrees and an expansion estimate that
  limits the fraction of edges captured by small vertex subsets.
  Throughout, a random edge is uniform on the retained graph, so its vertex marginals are proportional to degrees.
  A #emph[wedge] is sampled by choosing a center with this marginal and then two of its neighbors independently.
  Its endpoint mutual information—the relative entropy of their joint law from the product of their marginals—is
  $o \( log t \)$.

===== 1.2.2 Prediction from a short history. <prediction-from-a-short-history.>

A test assigns a finite code to each point. A history records its codes at a short list of previous tests.
  Given an original point, sample a prediction from the point marginal conditional on having the same history,
  and sample a neighboring center from the original point. The prediction keeps the original point marginal.
  The information bound allows a history to be fixed for which the prediction’s answers are sufficiently
  compatible with the sampled center at a fresh test, independent of this whole experiment.
  Section 3 proves this statement for general finite point–center laws and then adapts it to the coordinate tests
  used below.

===== 1.2.3 Arithmetic scale and the bounded case. <arithmetic-scale-and-the-bounded-case.>

In the complex coordinates $z = x + i y$ and $w = x - i y$, a unit edge has jumps $d$ and $d^(- 1)$.
  At an absolute value $v$ and a real threshold $s$, record the bit $upright(bold(1))_({ - log \| d \|_v > s })$.
  Let $f \( v \, s \)$ be the smaller of the fractions of edges with bit zero and bit one.
  The scale $S$ is the integral of $f$ over all thresholds, summed with the normalized place weights.
  Thus $S$ measures how much the logarithmic edge-jump profiles vary.

If $S$ stays bounded, the product formula transfers this control to heights of normalized point coordinates.
  At a fresh complex embedding, quantization tests produce a predicted point separated from the original point,
  but approximately satisfying the unit equations at three of its neighbors.
  The three normalized jumps are also separated in that embedding.
  A determinant calculation excludes this configuration. Section 4 proves the required height bounds and this
  contradiction; the remaining case is $S arrow.r oo$.

===== 1.2.4 Common and rare levels. <common-and-rare-levels.>

The same thresholds give each vertex two labels, recording closeness in its two coordinates;
  their pair is called its state. Except for an integrated error of $O \( 1 \)$,
  exactly one label agrees across an edge, and the bit tells us which one.
  Call levels common when both bits have appreciable frequency, and rare when one bit has small frequency.
  The rare levels with large consistency error have total length $o \( S \)$ and can be removed.
  On the remaining rare levels one coordinate label occurs at almost every vertex;
  its exceptions are measured by their total level length.

For two edges sharing a point or sharing a center, assign scores that reward certain matches of the other
  endpoints and charge bit disagreements. The product formula bounds their integrals in 5.
  The prediction lemma and the elementary geometry of two coordinate labels give lower bounds on common levels,
  while the rare-level terms cancel when the two orientations are added. One step requires care:
  concentration of the predicted states on a row (a fixed first label), a column (a fixed second label),
  or at most two states must be transferred to the actual point,
  even when that support is selected using sampled histories.
  Lemma 24 proves this comparison under the actual edge and history laws.
  Section 6 concludes that common levels contribute negligibly to center-wedge variation,
  but a positive amount of point-exception mass remains on rare levels.

===== 1.2.5 Height-weighted extraction. <height-weighted-extraction.>

The remaining mass provides many endpoint pairs $\( p \, r \)$ of wedges,
  each with a chosen center $q$ and ratio $lambda_(p r) = \( z_p - z_q \) \/ \( z_r - z_q \)$.
  The logarithms of these ratios are approximately differences of profiles attached to the two endpoints.
  Consequently, on a complete rectangle of retained pairs, the alternating product

$ frac(lambda_(p r) lambda_(p' r'), lambda_(p r') lambda_(p' r)) $

has small height. Section 7 produces a dense graph where all individual ratios have height at least $J \/ 3$,
  with $J arrow.r oo$, and every rectangle product has height $o \( J \)$.
  The selection first removes errors in their height-weighted measure, then chooses a common height band:
  small exceptional probability alone would not control lost height.
  Pairs on any unit circle containing many points are removed as well.

===== 1.2.6 An algebraic obstruction. <an-algebraic-obstruction.>

Section 8 rules out this dense pair graph. In a field formed from the sequence,
  elements of height $o \( J \)$ form a relatively algebraically closed subfield.
  The rectangle products lie in this subfield, while the individual ratios are transcendental over it.
  We select a fixed complete bipartite pattern on plane or curve loci.
  Over the field generated by the defining coefficients of these loci,
  its positions have no polynomial relations beyond those required by the loci.
  Differentiation over the negligible-height subfield then gives a finite system involving radicals derived from
  the pair-distance identity.

After adjoining one side’s positions and derivative data,
  a point on the other side still has the independence required by its locus.
  For each radicand we construct, over this enlarged coefficient field,
  a valuation that is odd on that radicand and zero on the others.
  These valuations permit independent sign changes of the square roots.
  An unused sign change contradicts the differentiated equations.
  The popular-unit-circle exclusion removes the case in which the required square-class independence fails.

The proof excludes every sequence whose unit-distance counts approach the exponent $4 \/ 3$,
  establishing the existence of a fixed positive gap without estimating its size.

Throughout the proof, asymptotic notation refers to the chosen sequence $t arrow.r oo$.
  Constants denoted by $c \, C$ may change between occurrences. All logarithms are natural.
  Every appeal to a slowly varying parameter will be made after the quantities it must dominate have been specified.

== 2 An incidence piece and its probability laws <sec:incidence>

The input to this section is a sequence of planar configurations with $t = n^(1 \/ 3) arrow.r
  oo$ and at least $t^(4 - o \( 1 \))$ ordered unit pairs. We construct an unbalanced incidence graph whose
  degrees are controlled on both sides. Its edge law has a uniform expansion estimate,
  including for arbitrarily small sets. We then prove two consequences of that estimate and show that the
  endpoints of a random two-edge path have mutual information $o \( log t \)$.

Such an input sequence exists if 1 fails. Indeed, for each $j gt.eq 2$, failure of a bound with exponent $4 \/ 3 -
  1 \/ j$ allows the constant in that bound to be chosen large enough to force a counterexample with $n gt.eq j$.
  Its ordered unit-pair count is at least $n^(4 \/ 3 - 1 \/ j) = t^(4 - 3 \/ j)$.
  Passing to an increasing sequence of sizes gives the claimed input.
  We use separate copies of the configuration as points and as centers of unit circles,
  so its ordered unit pairs are exactly the incidences between these two copies.

=== 2.1 Preserving incidences under algebraic specialization <preserving-incidences-under-algebraic-specialization>

Later arguments use number-field absolute values. The following specialization permits this without losing any of
  the unit pairs.

#thm([Lemma 2.1.])[
  #emph[Let $x_1 \, dots.h \, x_n$ be distinct points of $bb(R)^2$,
    and let $cal(E)$ be any collection of pairs $\( i \, j \)$ for which
    $lr(bar.v.double x_i - x_j bar.v.double)_2 = 1$. There are distinct points $x'_1 \, dots.h \,
    x'_n$ with real algebraic coordinates, arbitrarily close to the respective original points,
    such that $lr(bar.v.double x'_i - x'_j bar.v.double)_2 = 1$ for every $\( i \, j \) in cal(E)$.]
] <inc:specialization>

#proof[
  Fix a neighborhood of each original point and choose a rational open rectangle containing that point inside its
    neighborhood. For variables $X_i = \( X_(i \, 1) \, X_(i \, 2) \)$, impose membership in these rectangles,
    the equations
  $ \( X_(i \, 1) - X_(j \, 1) \)^2 + \( X_(i \, 2) - X_(j \, 2) \)^2 = 1 wide \( \( i \, j \) in cal(E) \) \, $
  and the strict inequalities
  $ \( X_(i \, 1) - X_(j \, 1) \)^2 + \( X_(i \, 2) - X_(j \, 2) \)^2 > 0 wide \( i eq.not j \) . $
  This finite system has rational coefficients and a real solution, namely the original configuration.
    The transfer principle for real closed fields #cite(label("RCFTransfer")) Theorems 3.1 and 4.1 gives a
    solution in the field of real algebraic numbers. The equations preserve the required unit pairs,
    the inequalities preserve distinctness, and the rectangles give the prescribed closeness. ◻
]

We henceforth apply this lemma separately to each configuration.
  Extra unit pairs created by the specialization are harmless;
  all subsequent graphs may retain only the incidences under consideration.

=== 2.2 Cuttings and the incidence bound <cuttings-and-the-incidence-bound>

For finite sets $cal(P)$ of points and $cal(Q)$ of distinct unit-circle centers,
  let $I \( cal(P) \, cal(Q) \)$ denote the number of incidences.
  Two distinct unit circles meet in at most two points. Also, two distinct points lie on at most two unit circles:
  their possible centers are intersections of the two unit circles centered at the points.
  These two facts provide the pair-counting bounds used below.
  The cutting proof uses the random-sampling principle for regions with bounded defining data developed by
  Clarkson #cite(label("Clarkson1987")) Section 4. We give the circle boundary conventions explicitly so that
  every retained point belongs to its assigned open region.

#thm([Lemma 2.2.])[
  #emph[Let $cal(P)$ be a finite planar point set and let $cal(Q)$ be a nonempty set of $l$ distinct unit circles.
    For every $R gt.eq 1$, sample $s = ceil.l C R log \( 2 + l \)
    ceil.r$ circles independently and uniformly with replacement,
    where $C$ is a sufficiently large absolute constant. With probability at least $9 \/ 10$,
    after deleting the points on sampled circles, all remaining points can be assigned to at most
    $C' \( 1 + s^2 \)$ open regions, each of which intersects at most $l \/ R$ of the original circles.
    Each assigned point belongs to its assigned region.]
] <inc:cutting>

#proof[
  Choose an auxiliary horizontal direction before taking the sample.
    Require that an input point and an intersection point of two original circles have different horizontal
    coordinates unless they are the same point. Require also that an input point have a horizontal coordinate
    different from that of a horizontal extremum of an original circle, unless it is that extremum.
    Only finitely many directions are excluded. For the latter assertion,
    if $c$ is a circle center and $p$ is a point, an equality with an extremal abscissa has the form $e
    dot.op \( p - c \) = plus.minus 1$ for a unit horizontal direction $e$,
    and has at most finitely many solutions in $e$. This auxiliary direction does not change the coordinates used
    elsewhere in the proof.
  Ignore repetitions among the sampled circles. Express each sampled circle as its upper and lower semicircle
    graphs on their open horizontal domains. The event points are their horizontal extrema and all their pairwise
    intersections, including tangencies. Between consecutive event abscissas,
    the graphs have fixed vertical order; consecutive graphs, with infinite outer boundaries allowed, bound open gaps.
  Sweep these gaps from left to right. Continue a gap across an event abscissa precisely when its two boundary
    graphs and their adjacency continue unchanged and its closed limiting vertical segment contains no event
    point. Otherwise start a new piece on the right. Each resulting piece is the open region between two fixed
    semicircle graphs, or infinite boundaries, over an open interval. It contains no part of a sampled circle.
    In particular, a continued gap has no start, end, tangency or crossing inside it at the abscissa across which
    it continues. An input point at an event abscissa must, by the choice of direction,
    itself be an event point and therefore lies on a sampled circle.
    Thus every point not deleted is in one of the open pieces.
  There are $O \( 1 + s^2 \)$ pieces, including in the presence of multiple intersections or several events with
    the same abscissa. A new right-hand gap can start only if an event point lies in its closed limiting vertical
    segment. If $c_x$ distinct sampled circles pass through an event point $x$,
    only $O \( 1 + c_x \)$ right-hand gaps can have this property, by their vertical ordering.
    Summing over event points costs $O \( s + s^2 \)$: extrema contribute $O \( s \)$,
    and at an intersection with $c_x gt.eq 2$ one may charge $c_x$ to $2 binom(c_x, 2)$,
    while each pair of circles has at most two intersections.
    This also covers extrema that coincide with intersections.
    There is only a constant number of initial unbounded gaps.
  Finally, all possible pieces have a description from the full circle set using a bounded number of circles.
    Each of their two horizontal endpoints is an extremal or intersection abscissa, or infinity;
    each boundary graph is specified by a circle and a sign, or is infinite.
    Consequently at most $C_0 \( 1 + l \)^6$ candidate regions can occur, with an absolute constant $C_0$.
    For any fixed candidate region intersecting more than $l \/ R$ circles,
    the probability that no sampled circle intersects it is at most
  $ \( 1 - 1 \/ R \)^s lt.eq e^(- s \/ R) \, $
  with the evident interpretation when $R = 1$. An actual open piece avoids every sampled circle.
    A union bound over the candidate regions, with $C$ sufficiently large,
    therefore gives the asserted conflict bound with failure probability at most $1 \/ 10$. ◻
]

#thm([Proposition 2.3.])[
  #emph[For $m$ distinct points and $l$ distinct unit circles in the plane,
#[#set math.equation(numbering: n => "(2.1)")
 $ I lt.eq C log^2 \( 2 + m + l \) #scale(x: 120%, y: 120%)[\(] m^(2 \/ 3) l^(2 \/ 3) + m +
   l #scale(x: 120%, y: 120%)[\)] \, $ <inc:incidence-bound>]

 where $C$ is an absolute constant. In particular, when $m \, l$ are bounded by a fixed power of $t$,
   the logarithmic factor is $\( log t \)^(O \( 1 \))$.]
] <inc:incidence>

#proof[
  Székely’s point–curve incidence theorem #cite(label("Szekely1997")) Theorem 8 gives the stronger bound $I =
    O \( m^(2 \/ 3) l^(2 \/ 3) + m + l \)$ when distinct curves meet in at most two points and distinct points
    belong to at most two curves. Distinct unit circles satisfy both hypotheses.
    If simple curves are taken to be arcs, cut each circle at two points outside the finite input point set;
    the resulting $2 l$ arcs satisfy the same pair bounds and preserve every incidence.
    The logarithmically weakened form (2.1) follows, including the empty-set cases. ◻
]

=== 2.3 Degree control and a maximizing rectangle <degree-control-and-a-maximizing-rectangle>

We now use the cutting to obtain the prescribed imbalance,
  and then choose a rectangle of the incidence graph that cannot gain too much edge density by further
  restriction. This last maximization supplies both expansion and lower degree bounds.

#thm([Proposition 2.4.])[
  #emph[From a sequence of $n = t^3$ real planar points with at least $t^(4 - o \( 1 \))$ ordered unit pairs,
    one can obtain real algebraic point and center sets $P \, Q$, and a nonempty graph $E subset.eq P times
    Q$ consisting of unit incidences, with the following properties.
    There is a parameter $a = a \( t \) > 0$ such that $a arrow.r 0$, $a log t arrow.r oo$, and
#[#set math.equation(numbering: n => "(2.2)")
 $ \| P \| = t^(1 + 2 a + o \( a \)) \, wide \| Q \| = t^(2 + a + o \( a \)) \, wide \| E \| =
   t^(2 + 2 a + o \( a \)) . $ <inc:scales>]

 Writing $d \( p \) \, d \( q \)$ for graph degrees, uniformly over all vertices,
#[#set math.equation(numbering: n => "(2.3)")
 $ d \( p \) = t^(1 + o \( a \)) \, wide d \( q \) = t^(a + o \( a \)) . $ <inc:degrees>]

 The uniform law on $E$ has marginals $mu \( p \) = d \( p \) \/ \| E \|$ and $kappa \( q \) =
   d \( q \) \/ \| E \|$ satisfying
#[#set math.equation(numbering: n => "(2.4)")
 $ mu \( p \) gt.eq frac(gamma, \| P \|) \, wide kappa \( q \) gt.eq frac(gamma, \| Q \|) \, wide gamma = 27 /
   50 = 0.54 . $ <inc:marginal-atoms>]

 Set $eta = gamma - 1 / 2 = 1 \/ 25$. There is a single sequence $xi_t arrow.r 0$ such that,
   for every $F subset.eq P$ and $G subset.eq Q$, with counting fractions $u = \| F \| \/ \| P \|$ and $v = \|
   G \| \/ \| Q \|$,
#[#set math.equation(numbering: n => "(2.5)")
 $ bb(P)_E \( p in F \, q in G \) lt.eq sqrt(u v) #scale(x: 120%, y: 120%)[\(] \( u v \)^eta +
   xi_t #scale(x: 120%, y: 120%)[\)] . $ <inc:expansion>]

 The sequence $xi_t$ is independent of the chosen subsets.]
] <inc:piece>

#proof[
  First use 2. Choose $a arrow.r 0$ sufficiently slowly that the initial incidence count is at least
    $t^(4 - o \( a \))$ and every fixed power of $log t$ is $t^(o \( a \))$. In particular $a log t arrow.r oo$.
    Apply 3 with $R = t^(1 - a)$ and $s = O \( t^(1 - a) log t \)$. There are $t^3$ points and circles.
    Incidences on the sampled circles number at most $s t^3$,
    and incidences at deleted points with other circles number at most $2 s t^3$.
    Thus the deletion costs $O \( t^(4 - a) log t \) = o \( t^(4 - o \( a \)) \)$.
  Each remaining region meets at most $t^(2 + a)$ circles. Further split its assigned point set into sets of size
    at most $2 t^(1 + 2 a)$. The total number of resulting pieces is at most the original region count plus
    $O \( t^3 \/ t^(1 + 2 a) \)$, hence at most $t^(2 - 2 a + o \( a \))$.
    Some piece has at least $t^(2 + 2 a - o \( a \))$ incidences.
    Denote its two vertex sets temporarily by $P_0 \, Q_0$, and its edge count by $e_0$. At this stage
  $ \| P_0 \| lt.eq 2 t^(1 + 2 a) \, wide \| Q_0 \| lt.eq t^(2 + a) \, wide t^(2 + 2 a - o \( a \)) lt.eq
    e_0 lt.eq t^(2 + 2 a + o \( a \)) \, $
  where the upper bound follows from (2.1).
  Choose $b = o \( a \)$ so slowly that $b log t arrow.r oo$ and $b$ dominates all exponent errors in these
    estimates and the logarithmic factor in (2.1). Delete point vertices of degree greater than $t^(1 + b)$,
    and center vertices of degree greater than $t^(a + b)$, with degrees measured before these deletions.
    The counts of such vertices are at most
  $ t^(1 + 2 a - b \/ 2) quad upright("and") quad t^(2 + a - b \/ 2) \, $
  respectively, for all sufficiently large $t$. Apply (2.1) to the excessive vertices on one side and all vertices
    on the other. In either case the mixed term is at most $t^(2 + 2 a - b \/ 3 + o \( b \))$;
    the two linear terms are bounded by $t^(1 + 2 a + o \( b \)) + t^(2 + a + o \( b \))$.
    Their sum is $o \( e_0 \)$. Both deletions therefore retain $t^(2 + 2 a + o \( a \))$ edges and give the
    degree upper bounds $t^(1 + o \( a \))$, $t^(a + o \( a \))$.
    Dividing the retained edge count by these two upper bounds shows that both retained vertex counts attain their
    stated upper scales within $t^(o \( a \))$. Relabel this trimmed graph as $\( P_0 \, Q_0 \, E_0 \)$.
  For subsets of these trimmed vertex sets, let $u \, v$ be their respective counting fractions and let $w$ be
    their captured edge fraction. The incidence bound and the maximum-degree bounds give,
    with one uniform factor $T_t = t^(o \( a \))$,
  #[#set math.equation(numbering: n => "(2.6)")
   $ w & lt.eq T_t #scale(x: 120%, y: 120%)[\(] \( u v \)^(2 \/ 3) + t^(- a) v +
     t^(- 1) u #scale(x: 120%, y: 120%)[\)] \,\
w & lt.eq T_t min \( u \, v \) . $ <inc:preliminary-expansion>]
  Taking the minimum with the degree bounds separately in the two linear terms, and using $min \( x \, y \) lt.eq
    sqrt(x y)$, yields
  #[#set math.equation(numbering: n => "(2.7)")
   $ w lt.eq T_t sqrt(u v) #scale(x: 120%, y: 120%)[\(] \( u v \)^(1 \/ 6) +
     2 t^(- a \/ 2) #scale(x: 120%, y: 120%)[\)] \, $ <inc:preliminary-square-root>]
  after increasing $T_t$ if necessary. For example, $min \( t^(- a) v \, u \) lt.eq t^(- a \/ 2) sqrt(u v)$;
    the other linear term uses $t^(- 1 \/ 2) lt.eq t^(- a \/ 2)$ for large $t$.
  Put $tau = t^(- a \/ 8)$. Among all induced rectangles with counting fractions $u \, v gt.eq
    tau$ and captured edge fraction $w$, maximize
  $ frac(w, \( u v \)^gamma) \, wide gamma = 27 / 50 . $
  We choose $gamma > 1 \/ 2$ so that a bound by $\( u v \)^gamma$ improves on $sqrt(u v)$ for small sets.
    The inequality $gamma < 2 \/ 3$, where $2 \/ 3$ is the incidence exponent in (2.6),
    will ensure that the maximizing rectangle retains the scales (2.2).
    This is a maximum over a nonempty finite family, and its value is at least one because the full rectangle is
    feasible. Write $U \, V$ for the maximizing counting fractions and $W$ for its captured edge fraction. We claim
  #[#set math.equation(numbering: n => "(2.8)")
   $ U \, V \, W gt.eq t^(- o \( a \)) . $ <inc:winning-fractions>]
  Indeed (2.7) gives
  $ 1 lt.eq T_t (\( U V \)^(2 \/ 3 - gamma) + 2 t^(- a \/ 2) \( U V \)^(- eta)) . $
  By feasibility, $U V gt.eq t^(- a \/ 4)$, so the second term on the right is at most $2
    t^(- 49 a \/ 100 + o \( a \))$, which tends to zero. If $U V lt.eq
    t^(- c a)$ along a subsequence for any fixed $c > 0$, the first term tends to zero as well, since $2 \/ 3 -
    gamma = 19 \/ 150 > 0$. This is impossible. Thus $U V gt.eq t^(- o \( a \))$,
    which implies the same for each of $U \, V$, and $W gt.eq \( U V \)^gamma$ gives the claim for $W$.
  Let $\( P \, Q \, E \)$ be this maximizing rectangle, retaining precisely its edges from the trimmed graph.
    The scale estimates (2.2) and the degree upper bounds survive by (2.8).
    For further subsets with fractions $u \, v$ inside $P \, Q$, optimality gives
  $ bb(P)_E \( F \, G \) lt.eq \( u v \)^gamma $
  whenever $U u \, V v gt.eq tau$. Otherwise $u v lt.eq tau \/ min \( U \, V \) = t^(- a \/ 8 + o \( a \))$.
    Apply (2.7) with the old fractions $U u \, V v$ and divide by $W$.
    Uniformly in all such infeasible subsets, this gives
  $ bb(P)_E \( F \, G \) lt.eq t^(o \( a \)) sqrt(u v) #scale(x: 120%, y: 120%)[\(] \( u v \)^(1 \/ 6) +
    2 t^(- a \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq xi_t sqrt(u v) \, $
  where one may take $xi_t = t^(- a \/ 48 + o \( a \)) arrow.r 0$,
    with the exponent error depending only on the chosen rectangle and the previous uniform bounds.
    Combining the feasible and infeasible cases proves (2.5). Empty subsets satisfy it trivially.
  Finally (2.8) implies that removing any single vertex of the maximizing rectangle remains feasible for all
    sufficiently large $t$. Optimality with a point $p$ removed gives
  $ 1 - mu \( p \) lt.eq \( 1 - \| P \|^(- 1) \)^gamma lt.eq 1 - gamma \| P \|^(- 1) \, $
  the last inequality following from concavity. The center comparison is identical.
    This proves (2.4), and multiplying by $\| E \|$ supplies the lower degree bounds in (2.3). ◻
]

In particular, the minimum degree on either side tends to infinity, and $max_p mu \( p \) = t^(- 1 + o \( 1 \))$.
  The lower marginal bounds also convert (2.5) to the form needed for probability laws.
  For $h = mu \( F \)$, $k = kappa \( G \)$, we have $\| F \| \/ \| P \| lt.eq h \/ gamma$,
  $\| G \| \/ \| Q \| lt.eq k \/ gamma$, and hence

#[#set math.equation(numbering: n => "(2.9)")
 $ bb(P)_E \( F \, G \) lt.eq C sqrt(h k) #scale(x: 120%, y: 120%)[\(] \( h k \)^eta +
   xi_t #scale(x: 120%, y: 120%)[\)] \, $ <inc:marginal-expansion>]

with a fixed absolute $C$. The same $xi_t$ works for all subsets.

=== 2.4 Matching labels and uniformly rare sets <matching-labels-and-uniformly-rare-sets>

We will repeatedly assign finite labels to the vertices, with no bound on the number of labels.
  Expansion says that if almost all edges match, one label occupies almost all the mass.
  A second application of expansion makes the error proportional to the actual mismatch,
  even when that mismatch is smaller than $xi_t$.

#thm([Lemma 2.5.])[
  #emph[For the sequence of edge laws in 5, there are absolute constants $s_0 > 0 \,
    C < oo$ and an index after which the following holds uniformly for every pair of label maps $ell_P : P arrow.r
    cal(A)$, $ell_Q : Q arrow.r cal(A)$ into a finite set. If
$ s = bb(P)_E #scale(x: 120%, y: 120%)[\(] ell_P \( p \) eq.not ell_Q \( q \) #scale(x: 120%, y: 120%)[\)] lt.eq
  s_0 \, $

 some label $a_0 in cal(A)$ satisfies
$ mu { ell_P eq.not a_0 } + kappa { ell_Q eq.not a_0 } lt.eq C s . $

 Moreover, for independent $p \, p' tilde.op mu$, at every value of $s$,
#[#set math.equation(numbering: n => "(2.10)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] ell_P \( p \) eq.not ell_P \( p' \) #scale(x: 120%, y: 120%)[\)] lt.eq
   C s . $ <inc:point-label-mismatch>]

 The analogous statement holds for independent centers of law $kappa$.]
] <inc:matching>

#proof[
  Let $u_i \, v_i$ be the counting fractions of the two classes with label $i$, including zero fractions.
    Sum (2.5) over the matched rectangles. Cauchy–Schwarz gives $sum_i sqrt(u_i v_i) lt.eq 1$, and therefore
  $ 1 - s lt.eq max_i \( u_i v_i \)^eta + xi_t . $
  For sufficiently small fixed $s_0$ and sufficiently large $t$,
    one label $a_0$ thus has both counting fractions arbitrarily close to one.
    Apply (2.5) to either complementary class against the whole opposite side. The marginal exception masses
  $ h = mu { ell_P eq.not a_0 } \, wide k = kappa { ell_Q eq.not a_0 } $
  are then as small as any prescribed fixed constant, uniformly over the label maps.
    This first conclusion need not be proportional to $s$.
  To obtain proportionality, put $J = bb(P)_E \( ell_P eq.not a_0 \, ell_Q eq.not a_0 \)$.
    By (2.9) and $sqrt(h k) lt.eq \( h + k \) \/ 2$, we may choose the preceding constants so that $J
    lt.eq \( h + k \) \/ 4$. The events on which exactly one endpoint has label $a_0$ are mismatches, so
  $ s gt.eq h + k - 2 J gt.eq 1 / 2 \( h + k \) . $
  This proves the first assertion, including when $s = 0$, with no additive error.
    Two independent point labels differ with probability at most $2 h$, giving (2.10) for small $s$.
    For $s > s_0$, the bound follows by increasing $C$ so that $C s_0 gt.eq 1$. The center assertion is identical. ◻
]

Define the #emph[wedge law] on triples $\( p \, q \, r \) in P times Q times
  P$ by first choosing $q tilde.op kappa$ and then independently choosing $p \,
  r$ according to the conditional edge law given $q$. Explicitly,

#[#set math.equation(numbering: n => "(2.11)")
 $ bb(P) \( p \, q \, r \) =
   cases(delim: "{", \( \| E \| d \( q \) \)^(- 1) \, & \( p \, q \) \, \( r \, q \) in E \,, 0 \, &
   upright("otherwise") .) $ <inc:wedge-law>]

Each point marginal is $mu$, and each of the two point–center marginals is the uniform edge law.

#thm([Lemma 2.6.])[
  #emph[Let $delta_t arrow.r 0$ be any nonnegative sequence.
    The estimates below hold uniformly over all indicated subsets,
    with error factors depending only on $delta_t \, xi_t$ and the fixed constants in (2.9):]
  + #emph[If $F subset.eq P$, $G subset.eq Q$, and $h = mu \( F \) lt.eq delta_t$, while $k =
    kappa \( G \)$ is arbitrary, then
#[#set math.equation(numbering: n => "(2.12)")
 $ bb(P)_E \( F \, G \) lt.eq C \( delta_t^eta + xi_t \) sqrt(h k) = o \( 1 \) sqrt(h k) . $ <inc:one-small-set>]

 The same assertion holds with the sides interchanged.]
  + #emph[If also $k lt.eq delta_t$, then
#[#set math.equation(numbering: n => "(2.13)")
 $ bb(P)_E \( F \, G \) lt.eq C / 2 \( delta_t^(2 eta) + xi_t \) \( h + k \) =
   o \( 1 \) \( h + k \) . $ <inc:joint-rare-edge>]

]
  + #emph[If $F subset.eq P$ and $h = mu \( F \) lt.eq delta_t$, then under the wedge law,
#[#set math.equation(numbering: n => "(2.14)")
 $ bb(P) \( p in F \, r in F \) = o \( 1 \) h . $ <inc:joint-rare-wedge>]

]
  #emph[In particular, the error factors may be taken outside sums or integrals over any family of sets whose
    marginal masses obey the same uniform bound $delta_t$.]
] <inc:rare>

#proof[
  The first two assertions follow directly from (2.9), using $h k lt.eq delta_t$ in the first case and $h k lt.eq
    delta_t^2$ and $sqrt(h k) lt.eq \( h + k \) \/ 2$ in the second.
  For the third, let $g \( q \) = bb(P) \( p in F divides q \)$, so that $bb(E)_kappa g =
    h$ and the probability in question is $bb(E)_kappa g^2$. There is nothing to prove when $h = 0$.
    For any $d in \( 0 \, 1 \]$, put $G_d = { q : g \( q \) > d }$.
    Markov’s inequality gives $kappa \( G_d \) lt.eq h \/ d$. Splitting at this threshold,
  $ bb(E)_kappa g^2 lt.eq d h + bb(E)_kappa \[ g upright(bold(1))_(G_d) \] = d h + bb(P)_E \( F \, G_d \) lt.eq
    h [d + C d^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] \( delta_t^2 \/ d \)^eta + xi_t #scale(x: 120%, y: 120%)[\)]] . $
  Choose $d = d_t arrow.r 0$ sufficiently slowly that $delta_t^(2 eta) d_t^(- 1 \/ 2 - eta) arrow.r
    0$ and $xi_t d_t^(- 1 \/ 2) arrow.r 0$. The bracket then tends to zero, independently of $F$.
    This proves the uniform assertion and hence its integrated form. ◻
]

=== 2.5 The information carried by a wedge <the-information-carried-by-a-wedge>

The small point side and the two-center codegree bound together ensure that the two point endpoints of a wedge
  share little information. We record the atom estimates as well,
  since they later convert a probability of wedges into a count of distinct point pairs.

For probability laws $a \, b$ on the same finite set, define their relative entropy by

#[#set math.equation(numbering: n => "(2.15)")
 $ upright(D ""_(upright("KL"))) \( a bar.v.double b \) = sum_x a \( x \) log frac(a \( x \), b \( x \)) \,
   $ <inc:relative-entropy>]

with a zero summand when $a \( x \) = 0$ and value $+ oo$ if $a \( x \) > 0 = b \( x \)$.

#thm([Lemma 2.7.])[
  #emph[For the wedge law (2.11), let $d_(min \, Q) = min_(q in Q) d \( q \)$. If $p eq.not r$, then
#[#set math.equation(numbering: n => "(2.16)")
 $ bb(P) \( p \, r \) lt.eq frac(2, \| E \| d_(min \, Q)) = t^(- 2 - 3 a + o \( a \)) . $ <inc:wedge-atoms>]

 The diagonal probability is
#[#set math.equation(numbering: n => "(2.17)")
 $ bb(P) \( p = r \) = frac(\| Q \|, \| E \|) = t^(- a + o \( a \)) = o \( 1 \) . $ <inc:wedge-diagonal>]

 The mutual information of the point endpoints satisfies
#[#set math.equation(numbering: n => "(2.18)")
 $ D := upright(D ""_(upright("KL"))) #scale(x: 120%, y: 120%)[\(] cal(L) \( p \, r \) thin bar.v.double thin mu ⊗
   mu #scale(x: 120%, y: 120%)[\)] = o \( log t \) . $ <inc:information-bound>]

]
] <inc:entropy>

#proof[
  For fixed $p \, r$, summing (2.11) gives
  $ bb(P) \( p \, r \) = frac(1, \| E \|) sum_(q : \( p \, q \) \, \( r \, q \) in E) frac(1, d \( q \)) . $
  There are at most two summands when $p eq.not r$, proving the off-diagonal estimate by (2.2)–(2.3).
    Summing instead over the diagonal yields
  $ bb(P) \( p = r \) = frac(1, \| E \|) sum_(q in Q) frac(d \( q \), d \( q \)) = frac(\| Q \|, \| E \|) . $
  The asymptotics follow from the same estimates and $a log t arrow.r oo$.
  For a finite random variable $X$, write $sans(H) \( X \) = - sum_x bb(P) \( X = x \) log bb(P) \( X = x \)$,
    with $0 log 0 = 0$. Every off-diagonal atom is at most $M_t = 2 \/ \( \| E \| d_(min \, Q) \)$.
    Dropping the nonnegative diagonal entropy contributions therefore gives
  $ sans(H) \( p \, r \) gt.eq #scale(x: 120%, y: 120%)[\(] 1 -
    bb(P) \( p = r \) #scale(x: 120%, y: 120%)[\)] log \( 1 \/ M_t \) gt.eq \( 2 - o \( 1 \) \) log t . $
  On the other hand, $sans(H) \( p \) = sans(H) \( r \) lt.eq log \| P \| = \( 1 + o \( 1 \) \) log t$.
    Expanding the definition of relative entropy gives
  $ 0 lt.eq D = sans(H) \( p \) + sans(H) \( r \) - sans(H) \( p \, r \) = o \( log t \) \, $
  as required. ◻
]

We retain this graph and these probability laws for the rest of the proof:
  the uniform edge law, its point and center marginals, and the wedge law.
  The expansion consequences hold for every finite labeling and every sufficiently small exceptional set,
  with constants independent of any tests subsequently assigned to the vertices.

== 3 Prediction from short histories <sec:prediction>

The incidence reduction supplies a probability law on point–center pairs whose point endpoints in a random wedge
  have mutual information $D = o \( log t \)$. We now turn this information bound into predictions from short
  histories of point tests. The prediction uses only the history of the point;
  its accuracy is measured against a test that may depend on the center.
  We first prove this statement for an arbitrary finite probability law and then give the two forms needed for
  coordinate quantization and coordinate equality.

The proof sums the information contributed by successive tests.
  Since that sum is at most $D$, a sufficiently long history leaves little new dependence on average.
  Related short conditioning arguments occur in Ahlswede’s wringing method #cite(label("Ahlswede1982")) Section 4,
  Lemma 3. Here the proof must additionally compare each endpoint with its own posterior law and leave the next
  test independent of the selected history.

=== 3.1 The probability laws and the entropy comparison <the-probability-laws-and-the-entropy-comparison>

Let $P \, Q$ be finite nonempty sets and let $omega \( p \, q \)$ be a probability mass function on $P times Q$,
  with marginals $mu$ and $kappa$. Delete atoms of zero marginal mass. Write

$ omega \( p divides q \) = frac(omega \( p \, q \), kappa \( q \)) \, wide omega \( q divides p \) =
  frac(omega \( p \, q \), mu \( p \)) . $

The associated wedge law and its point-pair marginal are

#[#set math.equation(numbering: n => "(3.1)")
 $ Omega \( p \, q \, r \) = kappa \( q \) omega \( p divides q \) omega \( r divides q \) \, wide
   pi \( p \, r \) = sum_(q in Q) Omega \( p \, q \, r \) . $ <pred:wedge-law>]

Both marginals of $pi$ are $mu$. Relative entropy is defined in (2.15). For finite probability laws $a \, b$, set

$ "TV" \( a \, b \) = 1 / 2 sum_x \| a \( x \) - b \( x \) \| . $

The information available to the argument is

#[#set math.equation(numbering: n => "(3.2)")
 $ D = upright(D ""_(upright("KL"))) \( pi bar.v.double mu ⊗ mu \) . $ <pred:information>]

It is finite, since $pi \( p \, r \) > 0$ implies $mu \( p \) mu \( r \) > 0$.

We use the standard chain rule for relative entropy #cite(label("CoverThomas2006")) Theorem 2.5.3:

#[#set math.equation(numbering: n => "(3.3)")
 $ upright(D ""_(upright("KL"))) \( a_(X Y) bar.v.double b_(X Y) \) =
   upright(D ""_(upright("KL"))) \( a_X bar.v.double b_X \) +
   sum_x a_X \( x \) upright(D ""_(upright("KL"))) \( a_(Y divides x) bar.v.double b_(Y divides x) \) .
   $ <pred:chain-rule>]

Nonnegativity and the chain rule imply that applying a deterministic map cannot increase relative entropy:
  adjoin the map to the outcome and then discard the nonnegative conditional term.
  We also use Pinsker’s inequality #cite(label("CoverThomas2006")) Lemma 11.6.1,
  which in our natural-logarithm convention is

#[#set math.equation(numbering: n => "(3.4)")
 $ 2 "TV" \( a \, b \)^2 lt.eq upright(D ""_(upright("KL"))) \( a bar.v.double b \) . $ <pred:pinsker>]

Finally, total variation controls bounded expectations by

#[#set math.equation(numbering: n => "(3.5)")
 $ \| bb(E)_a F - bb(E)_b F \| lt.eq 2 lr(bar.v.double F bar.v.double)_oo "TV" \( a \, b \) . $ <pred:tv-expectation>]

A test $T$ is a random element of a probability space, independent of $\( p \, q \, r \)$,
  which specifies a code map $c_T : P arrow.r \[ M \]$, where $\[ M \] = { 1 \, dots.h \, M }$.
  The test space may be infinite; all maps and integrands below are assumed measurable.
  Only finite probability laws of codes are used. All vector norms and inner products in this section are
  Euclidean. For a fixed history map $H : P arrow.r cal(H)$, put

#[#set math.equation(numbering: n => "(3.6)")
 $ mu_h \( x \) = frac(mu \( x \) upright(bold(1))_({ H \( x \) = h }), mu \( H = h \)) quad
   upright("when ") mu \( H = h \) > 0 . $ <pred:posterior-point>]

Its values on histories of zero mass are immaterial.

#thm([Lemma 3.1.])[
  (Prediction device).  #emph[Let $omega \, pi \, D$ be as in (3.1)–(3.2), let $K \, M gt.eq 1$ be integers,
    and let $T_1 \, dots.h \, T_K$ be independent tests with the same law as $T$.
    Each test specifies, in addition to $c_T$, a feature map $f_T : \[ M \] arrow.r
    bb(R)^d$ and a coefficient map $g_T : Q arrow.r bb(R)^d$, for an integer $d gt.eq 1$ and constants $B \,
    B' gt.eq 0$, satisfying
$ lr(bar.v.double f_T \( c \) bar.v.double) lt.eq B \, wide lr(bar.v.double g_T \( q \) bar.v.double) lt.eq B' $

 for all codes, centers and tests. Choose $J$ uniformly from $\[ K \]$, independently of all tests,
   and retain only the strict prefix
$ H \( p \) = \( c_(T_1) \( p \) \, dots.h \, c_(T_(J - 1)) \( p \) \) . $

 Conditioned on $J \, T_1 \, dots.h \, T_(J - 1)$, let $T$ be a fresh test and define
$ m_(T \, h) = sum_(x in P) mu_h \( x \) f_T \( c_T \( x \) \) . $

 Then
#[#set math.equation(numbering: n => "(3.7)")
 $ bb(E)_(J \, T_1 \, dots.h \, T_(J - 1) \, T)
   lr(|bb(E)_(\( p \, q \) tilde.op omega) chevron.l f_T \( c_T \( p \) \) - m_(T \, H \( p \)) \, g_T \( q \)
   chevron.r|) lt.eq 4 B B' (D / K)^(1 \/ 4) . $ <pred:device-bound>]

 Every realized history has at most $M^(K - 1)$ values. In particular,
   a history can be fixed before drawing the fresh test so that its average absolute discrepancy in (3.7) is at
   most the right side.]
] <pred:device>

#proof[
  First freeze all $K$ tests. Apply their complete transcript map to both coordinates of the pair $\( p \, r \)$.
    The actual transcript law is the image of $pi$; the reference law is the image of $mu ⊗ mu$.
    Data processing bounds their relative entropy by $D$. For $j in \[ K \]$,
    write $H_j$ for the transcript strictly before step $j$. Conditional on prefixes $\( h \, h' \)$,
    the reference next-code law is exactly
  $ b_(j \, h \, h') = \( c_(T_j) \)_(*) mu_h med ⊗ med \( c_(T_j) \)_(*) mu_(h') . $
  Here $mu_h$ is formed with $H_j$. Let $a_(j \, h \, h')$ denote the actual conditional law of the next two
    codes. All prefix pairs of positive actual probability have positive reference probability.
    Iterating (3.3) therefore gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ sum_(j = 1)^K bb(E)_(\( p \, r \) tilde.op pi) upright(D ""_(upright("KL"))) #scale(x: 120%, y: 120%)[\(]
     a_(j \, H_j \( p \) \, H_j \( r \)) bar.v.double b_(j \, H_j \( p \) \, H_j \( r \))
     #scale(x: 120%, y: 120%)[\)] lt.eq D . $ <pred:conditional-kl>]
  Consequently, by (3.4) and Cauchy–Schwarz,
  #[#set math.equation(numbering: n => "(3.9)")
   $ 1 / K sum_(j = 1)^K bb(E)_(\( p \, r \) tilde.op pi) "TV" #scale(x: 120%, y: 120%)[\(]
     a_(j \, H_j \( p \) \, H_j \( r \)) \, b_(j \, H_j \( p \) \, H_j \( r \)) #scale(x: 120%, y: 120%)[\)] lt.eq
     sqrt(frac(D, 2 K)) . $ <pred:conditional-tv>]
  For this fixed test sequence and step $j$, subtract the prediction belonging to each point’s own prefix:
  $ U_j \( p \) = f_(T_j) \( c_(T_j) \( p \) \) - sum_x mu_(H_j \( p \)) \( x \) f_(T_j) \( c_(T_j) \( x \) \) . $
  The norm is at most $2 B$. Under each reference conditional product,
    both residuals are centered and independent, so the conditional expectation of $chevron.l U_j \( p \) \,
    U_j \( r \) chevron.r$ is zero. This inner product has absolute value at most $4 B^2$. Thus (3.5) and (3.9) imply
  #[#set math.equation(numbering: n => "(3.10)")
   $ 1 / K sum_(j = 1)^K bb(E)_(\( p \, r \) tilde.op pi) chevron.l U_j \( p \) \, U_j \( r \) chevron.r lt.eq
     8 B^2 sqrt(frac(D, 2 K)) . $ <pred:residual-variance>]
  Each summand is nonnegative, for conditional independence in the wedge law gives the exact identity
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E)_(\( p \, r \) tilde.op pi) chevron.l U_j \( p \) \, U_j \( r \) chevron.r =
     bb(E)_(q tilde.op kappa) ∥bb(E)_(p tilde.op omega \( dot.op divides q \)) U_j \( p \)∥^2 . $ <pred:wedge-square>]
  It follows, by Cauchy–Schwarz first over $q$ and then over the tests and step,
    that the average absolute discrepancy is at most
  $ B' (8 B^2 sqrt(frac(D, 2 K)))^(1 \/ 2) lt.eq 4 B B' \( D \/ K \)^(1 \/ 4) . $
  Everything proved so far holds after averaging the initially frozen tests.
    The residual at step $j$ uses only $T_1 \, dots.h \, T_j$.
    Since the tests are independent and identically distributed,
    its joint law with the strict prefix is unchanged when $T_j$ is replaced by a fresh test after that prefix.
    This proves (3.7). Finally average over the strict prefixes and choose one attaining at most the average.
    There are at most $M^(j - 1) lt.eq M^(K - 1)$ possible histories for a prefix of length $j - 1$. ◻
]

The important comparison in this proof is conditional on two possibly different histories.
  The reference law uses the first endpoint’s prediction at the first coordinate and the second endpoint’s
  prediction at the second. No independence of the actual endpoints after their histories have been specified is
  asserted. Their independence is used only conditional on the center, in (3.11).

=== 3.2 Acceptance tests and the prediction coupling <acceptance-tests-and-the-prediction-coupling>

#thm([Corollary 3.2.])[
  (Finite-code acceptance).  #emph[In the setting of 9, suppose each test specifies a set $cal(A)_T \( q \)
    subset.eq \[ M \]$ of accepted codes for every $q in Q$. Put
$ s_0 = bb(E)_T bb(P)_(\( p \, q \) tilde.op omega) { c_T \( p \) in.not cal(A)_T \( q \) } . $

 There is a fixed strict-prefix history $H$, with at most $M^(K - 1)$ values, such that
#[#set math.equation(numbering: n => "(3.12)")
 $ bb(E)_T sum_(p \, q) omega \( p \, q \) sum_x mu_(H \( p \)) \( x \)
   upright(bold(1))_({ c_T \( x \) in.not cal(A)_T \( q \) }) lt.eq s_0 +
   4 sqrt(M) \( D \/ K \)^(1 \/ 4) . $ <pred:acceptance-bound>]

 The fresh test $T$ is independent of the fixed history construction.]
] <pred:acceptance>

#proof[
  Use $f_T \( c \) = e_c in bb(R)^M$, of norm one, and use the acceptance indicator vector as $g_T \( q \)$,
    of norm at most $sqrt(M)$. Actual and predicted failure probabilities differ by the negative of their
    acceptance probabilities. Averaging (3.7) and then fixing a strict prefix proves the assertion. ◻
]

We record the sampling laws used with this result. For any fixed history $H$ and integer $r gt.eq 1$,
  draw one point, one prediction, and $r$ neighbors according to

#[#set math.equation(numbering: n => "(3.13)")
 $ bb(P) { p \, hat(p) \, q_1 \, dots.h \, q_r } = mu \( p \) mu_(H \( p \)) \( hat(p) \) product_(j = 1)^r
   omega \( q_j divides p \) \, $ <pred:shared-prediction-law>]

and draw the fresh test independently of this entire tuple.
  The two point marginals are both $mu$, each $\( p \, q_j \)$ has law $omega$,
  and each $q_j$ has marginal $kappa$. In particular each pair $\( p \, hat(p) \)$ is independent of the fresh
  test, although its two points need not be independent. These assertions follow by summing (3.13),
  using $sum_(p : H \( p \) = h) mu \( p \) mu_h \( x \) = mu \( x \) upright(bold(1))_({ H \( x \) = h })$.
  For every fixed history,

#[#set math.equation(numbering: n => "(3.14)")
 $ bb(P) { p = hat(p) } = sum_h frac(sum_(p : H \( p \) = h) mu \( p \)^2, mu \( H = h \)) lt.eq \| H \( P \) \|
   max_p mu \( p \) . $ <pred:point-collision>]

Given $H \( p \)$, the prediction is independent of all neighbors in (3.13).
  Applying a union bound to (3.12) therefore bounds the chance that at least one of the $r$ acceptance comparisons
  rejects this #emph[same] predicted point at the same fresh test by
  $r \( s_0 + 4 sqrt(M) \( D \/ K \)^(1 \/ 4) \)$. The union bound needs no independence of the rejection events.

There is also a useful equivalent way to draw the point pair:
  draw $h$ with probability $mu \( H = h \)$, then draw two points independently from $mu_h$.
  This again has both marginals $mu$, and its collision probability satisfies (3.14).
  Once $H$ is fixed, this pair law can be used unchanged for every fresh test.
  Sampling a second object from the first object’s fiber also appears in the entropy argument of Katz and Tardos
  #cite(label("KatzTardos")) Section 2, proof of Lemma 1; the identities above specify the marginals and
  independent test needed here.

For the coordinate-quantization application, a test will be an independently chosen field embedding,
  a code will specify bounded coordinate bins together with an overflow code,
  and $cal(A)_T \( q \)$ will consist of codes achieved by actual neighbors of $q$.
  The exact hypotheses needed from that construction are a fixed finite alphabet of size $M$ and acceptance of
  every actual edge, so $s_0 = 0$. If $K = o \( log t \)$, $D \/ K = o \( 1 \)$, and $max_p mu \( p \) lt.eq
  t^(- 1 + o \( 1 \))$, then the prediction failure and the collision probability both tend to zero.
  Formula (3.13) with $r = 3$ is the simultaneous three-neighbor experiment.
  Geometric estimates valid for all couplings with these marginals remain valid for each fixed history.
  More generally, additional nonnegative error quantities can be averaged together with the prediction error
  before choosing a prefix; this always leaves the test fresh.

=== 3.3 Equality of one coordinate <equality-of-one-coordinate>

The next application allows an arbitrarily large set of state labels without paying for its size in the feature
  norm. A state is a pair in a product $cal(A) times cal(B)$.
  For a state $y = \( a \, b \)$, define its #emph[strict cross]

#[#set math.equation(numbering: n => "(3.15)")
 $ R_y = { \( a' \, b' \) : \( a' = a upright(" and ") b' eq.not b \)
   upright(" or ") \( a' eq.not a upright(" and ") b' = b \) } . $ <pred:strict-cross>]

Thus exactly one coordinate agrees. A fresh test specifies state maps
  $y_T \( x \) = \( A_T \( x \) \, B_(1 \, T) \( x \) \)$ for all $x in P union Q$.
  Only the finitely many labels attained on these vertex sets need be retained.
  The labels and their equality relations are assumed measurable in $T$.

#thm([Corollary 3.3.])[
  (Prediction of strict crosses).  #emph[Let $omega \, pi \, D$ be as above, let $K gt.eq 1 \, L gt.eq
    2$ be integers, and let $T$ be an independent random test giving the state maps just described. Set
$ s_0 = bb(E)_T bb(P)_(\( p \, q \) tilde.op omega) { y_T \( p \) in.not R_(y_T \( q \)) } . $

 There exists a fixed history $H : P arrow.r cal(H)$, with $\| H \( P \) \| lt.eq L^(2 K)$,
   for which the laws of the #emph[true], unhashed states
$ nu_(h \, T) = \( y_T \)_(*) mu_h $

 satisfy
#[#set math.equation(numbering: n => "(3.16)")
 $ bb(E)_T bb(E)_(\( p \, q \) tilde.op omega) \[ 1 - nu_(H \( p \) \, T) \( R_(y_T \( q \)) \) \] lt.eq s_0 + 4 /
   L + 18 \( D \/ K \)^(1 \/ 4) . $ <pred:cross-bound>]

 The history is formed from earlier tests and does not use $T$.]
] <pred:cross>

#proof[
  Augment each test by two fresh independent random maps from its attained coordinate labels into $\[ L \]$,
    assigning independent uniform values to distinct labels. Numbering attained labels by their first occurrence
    in a fixed vertex order makes this construction measurable.
    Use the same map on both vertex sets for each coordinate,
    and use independent maps for the two coordinates and for different tests.
    The point code is its two hashed coordinates, so the alphabet has size $M = L^2$.
    For a code $\( a \, b \) in \[ L \]^2$, use the feature
  $ f \( a \, b \) = \( e_a \, e_b \, e_(\( a \, b \)) \) in bb(R)^L xor bb(R)^L xor bb(R)^(L^2) \, wide
    lr(bar.v.double f \( a \, b \) bar.v.double) = sqrt(3) . $
  For the hashed center state $\( a_q \, b_q \)$, use
  $ g \( q \) = \( e_(a_q) \, e_(b_q) \, - 2 e_(\( a_q \, b_q \)) \) \, wide
    lr(bar.v.double g \( q \) bar.v.double) = sqrt(6) . $
  Their inner product is $upright(bold(1))_({ a = a_q }) + upright(bold(1))_({ b = b_q }) -
    2 upright(bold(1))_({ \( a \, b \) = \( a_q \, b_q \) })$,
    exactly the indicator of the hashed strict-cross relation.
    Therefore 9 compares its actual and predicted probabilities with error at most $4
    sqrt(18) \( D \/ K \)^(1 \/ 4)$, averaged over strict prefixes and the fresh augmented test.
  For any two fixed true states, hashing preserves an equality,
    and creates an equality between two unequal coordinate labels with probability $1 \/ L$.
    Thus a true strict-cross indicator differs from its hashed indicator with probability at most $2 \/ L$.
    This applies both to the actual state pair and to the predicted pair:
    conditional on the earlier prefix, the fresh true test and the chosen vertices,
    the current hashes are still independent uniform maps. In particular the predicted point is sampled by (3.6)
    using no current hash. Comparing actual true, actual hashed, predicted hashed,
    and predicted true failures gives, in that order, total extra error at most $4 \/ L +
    4 sqrt(18) \( D \/ K \)^(1 \/ 4)$. Average the current test and current hashes before fixing a prefix,
    and use $4 sqrt(18) < 18$. The resulting true-state expression no longer involves the current hashes.
    Its history has at most $\( L^2 \)^(K - 1) lt.eq L^(2 K)$ values. ◻
]

One form of 11 that will be convenient is an integrated version.
  Let $cal(T)$ be a measurable family of state tests with finite measure $W$,
  and let $m \( tau \)$ bound actual strict-cross failure at $tau$.
  For $W > 0$, sample $T$ from the normalized measure $thin upright(d) tau \/ W$. The resulting fixed history satisfies

#[#set math.equation(numbering: n => "(3.17)")
 $ integral_(cal(T)) bb(E)_(\( p \, q \) tilde.op omega) \[ 1 - nu_(H \( p \) \, tau) \( R_(y_tau \( q \)) \) \]
   thin upright(d) tau lt.eq integral_(cal(T)) m \( tau \) thin upright(d) tau +
   W #scale(x: 120%, y: 120%)[\(] 4 \/ L + 18 \( D \/ K \)^(1 \/ 4) #scale(x: 120%, y: 120%)[\)] .
   $ <pred:integrated-cross>]

For $W = 0$, the assertion holds with the empty history. In the later level application,
  $cal(T)$ is the common-level set with its weighted level measure,
  and $m$ is the incidence inconsistency probability. Consistency implies the strict-cross relation,
  which is the only geometric hypothesis needed for (3.17).
  We suppress the test subscript and write $nu_h$ when the level being tested is fixed.

=== 3.4 Choosing the history length <choosing-the-history-length>

There is no conflict between small prediction error and a subpolynomial number of histories.
  Write $T_0 = log t$, and suppose $D = o \( T_0 \)$. For example, take

$ K = ⌈sqrt(\( D + 1 \) T_0)⌉ . $

Then $K arrow.r oo$, $K = o \( T_0 \)$, and $D \/ K arrow.r 0$.
  For a fixed alphabet this gives $M^K = t^(o \( 1 \))$. For hashing one may additionally take

$ L = ⌊exp sqrt(T_0 \/ K)⌋ . $

Eventually $L gt.eq 2$, $L arrow.r oo$, and $K log L = o \( T_0 \)$, so $L^(2 K) = t^(o \( 1 \))$.
  These statements require no quantitative rate for $D \/ T_0$.
  If a later argument requires an integer $k arrow.r oo$ satisfying $k K log L =
  o \( T_0 \)$ and $k^20 eta_t arrow.r 0$ for an additional positive sequence $eta_t arrow.r 0$, it suffices to choose

$ k = ⌊min {(frac(T_0, K log L))^(1 \/ 2) \, eta_t^(- 1 \/ 40)}⌋ . $

Further finitely many slow-growth requirements can be imposed by taking a smaller such diverging sequence.
  Thus the prediction lemma supplies both vanishing error and the small history counts required in the subsequent
  geometric arguments.

== 4 Heights and coordinate tests <sec:heights>

We apply the prediction device to the incidence pieces of 5. Their coordinates are real algebraic numbers.
  The first task is to measure the variation of edge directions simultaneously at all absolute values of a number
  field. We will prove that this variation cannot remain bounded.
  We then construct coordinate labels whose agreement records a threshold comparison, with a bounded total error.

Write

$ z_x = x_1 + i x_2 \, wide w_x = x_1 - i x_2 $

for a point or center $x = \( x_1 \, x_2 \)$. For every edge $e = \( p \, q \)$, put

#[#set math.equation(numbering: n => "(4.1)")
 $ d_e = z_p - z_q \, wide w_p - w_q = d_e^(- 1) . $ <ht:jumps>]

The second equality follows from the unit-distance equation, and in particular $d_e eq.not 0$.
  Distinct real points have distinct $z$-coordinates and distinct $w$-coordinates.
  These nonzero differences remain nonzero under every field embedding.
  At an embedding other than the original one, we use the two embedded coordinates separately;
  they need not be complex conjugates.

=== 4.1 A weighted product formula <a-weighted-product-formula>

For each configuration choose a finite normal number field $cal(N)$ containing all its coordinates and $i$,
  and let $d_(cal(N)) = \[ cal(N) : bb(Q) \]$. The following construction allows repeated absolute values;
  the repetitions make their weights particularly simple.

#thm([Lemma 4.1.])[
  (Weighted absolute values).  #emph[There is a countable collection of absolute-value entries $v$ on $cal(N)$,
    each of weight $1 \/ d_(cal(N))$, with the following properties.
    Its archimedean entries are $\| u \|_v = \| sigma \( u \) \|$ for the $d_(cal(N))$ embeddings $sigma :
    cal(N) arrow.r bb(C)$, so their total weight is one. All other entries are nonarchimedean.
    For each nonzero $u in cal(N)$, only finitely many nonarchimedean entries have $\| u \|_v eq.not 1$, and
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_v^(*) log \| u \|_v = 0 . $ <ht:product-formula>]

 Here and below a star denotes the sum with the stated weights.]
] <ht:product>

#proof[
  Use the classification of number-field places and the product formula #cite(label("ProductFormula"))
    Theorems 7.14–7.15. At a finite place $frak(p)$ above a rational prime $ell$,
    normalize the genuine absolute value by $\| ell \|_(frak(p)) = ell^(- 1)$,
    and put $n_(frak(p)) = \[ cal(N)_(frak(p)) : bb(Q)_ell \]$, where $cal(N)_(frak(p))$ is the completion.
    Use $n_(frak(p))$ copies of this absolute value, each of weight $1 \/ d_(cal(N))$.
    Milne’s local normalization formula #cite(label("ProductFormula")) Lemma 8.6 converts his finite-place value
    to $\| dot.op \|_(frak(p))^(n_(frak(p)))$. His complex-place value is squared modulus,
    so we instead use ordinary modulus once for each embedding, counting conjugate embeddings separately.
    Taking logarithms of the product formula and dividing by $d_(cal(N))$ proves (4.2).
    There are exactly $d_(cal(N))$ embeddings, giving archimedean weight one.
    Finally, the principal fractional ideal of any nonzero $u$ has finitely many prime factors
    #cite(label("ProductFormula")) Theorem 3.20; at every other finite place $\| u \|_v = 1$. ◻
]

Define $log^(+) r = max \( 0 \, log r \)$ for $r > 0$ and $log^(+) 0 = 0$. Set $h \( 0 \) = 0$, and put

$ h \( u \) = sum_v^(*) log^(+) \| u \|_v wide \( u eq.not 0 \) . $

#thm([Lemma 4.2.])[
  (Height inequalities).  #emph[The value $h \( u \)$ is independent of the chosen finite normal field and of the
    extensions of the prime absolute values in 12. For $u in cal(N)^times$,
#[#set math.equation(numbering: n => "(4.3)")
 $ h \( u^(- 1) \) = h \( u \) \, wide sum_v^(*) \| log \| u \|_v \| = 2 h \( u \) . $ <ht:height-inversion>]

 For arbitrary $u \, v in cal(N)$,
#[#set math.equation(numbering: n => "(4.4)")
 $ h \( u v \) lt.eq h \( u \) + h \( v \) \, wide h \( u + v \) lt.eq h \( u \) + h \( v \) +
   log 2 . $ <ht:height-inequalities>]

 If a random $X in cal(N)$ is independent of a uniformly sampled embedding $sigma : cal(N) arrow.r bb(C)$, then,
   for $B > 1$ and $0 < r < 1$,
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(P) { \| sigma \( X \) \| > B } & lt.eq frac(bb(E) h \( X \), log B) \,\
bb(P) { X eq.not 0 \, med \| sigma \( X \) \| < r } & lt.eq frac(bb(E) h \( X \), log \( 1 \/ r \)) . $ <ht:large-tail>]

]
] <ht:height>

#proof[
  For a finite extension $L \/ cal(N)$, the decomposition into completions #cite(label("ProductFormula"))
    Proposition 8.2 gives $sum_(frak(q) divides frak(p)) \[ L_(frak(q)) : cal(N)_(frak(p)) \] = \[ L : cal(N) \]$. Hence
  $ sum_(frak(q) divides frak(p)) frac(\[ L_(frak(q)) : bb(Q)_ell \], \[ L : bb(Q) \]) =
    frac(\[ cal(N)_(frak(p)) : bb(Q)_ell \], \[ cal(N) : bb(Q) \]) . $
  The extended absolute values restrict to the chosen normalization on $cal(N)$,
    so the finite-place contribution of any $u in cal(N)$ is unchanged.
    Each embedding of $cal(N)$ has $\[ L : cal(N) \]$ extensions, giving the same conclusion at infinity.
    A common finite normal overfield compares any two field choices.
    The place list includes all normalized extensions with their local-degree multiplicities,
    so their enumeration involves no further choice. This proves height independence; $h \( 0 \) = 0$ is fixed.
  The product formula equates the sums of positive and negative logarithms, giving (4.3).
    Multiplication gives the first height inequality termwise.
    The triangle inequality contributes at most $log 2$ at an archimedean entry and no constant at a
    nonarchimedean entry; the total archimedean weight is one.
    This proves the second inequality, including zero summands by the stated convention.
    For the tail estimates, the average positive logarithm over embeddings is at most $h \( X \)$.
    For $X eq.not 0$, its average negative logarithm is at most $h \( X^(- 1) \) = h \( X \)$.
    Markov’s inequality proves both assertions. ◻
]

=== 4.2 Thresholds and their total variation <sec:levels>

For every entry $v$ define

$ n_e \( v \) = - log \| d_e \|_v . $

Choose a finite closed interval $I_v = \[ ell_v \, u_v \]$ containing $0$ and all $n_e \( v \)$,
  enlarged so that for distinct $p \, p' in P$,

#[#set math.equation(numbering: n => "(4.6)")
 $ ell_v lt.eq - log \| z_p - z_(p') \|_v \, wide u_v gt.eq log \| w_p - w_(p') \|_v . $ <ht:range>]

All the differences here are nonzero. By 12, we can take $I_v = \[ 0 \, 0 \]$ at all but finitely many entries.
  Define the level space $cal(L)$ to be the disjoint union of the ${ v } times I_v$, with weighted Lebesgue measure:

$ integral_(cal(L)) g := sum_v^(*) integral_(ell_v)^(u_v) g \( v \, s \) thin upright(d) s . $

We usually suppress the domain $cal(L)$ in an integral. At a level $\( v \, s \)$ put

#[#set math.equation(numbering: n => "(4.7)")
 $ Y_e \( v \, s \) & = upright(bold(1))_({ n_e \( v \) > s }) \, & pi \( v \, s \) & =
   bb(P)_E { Y_e \( v \, s \) = 1 } \,\
f \( v \, s \) & = min \( pi \( v \, s \) \, 1 - pi \( v \, s \) \) \, & S & = integral f . $ <ht:levels>]

Enlarging any $I_v$ further does not change $S$, because all edge bits agree outside the range of the $n_e \( v \)$.

The choice of threshold turns distance between logarithmic profiles into bit disagreement.
  For independent uniform edges $e \, e'$, Tonelli’s theorem and (4.3) give

#[#set math.equation(numbering: n => "(4.8)")
 $ 2 bb(E)_(e \, e') h \( d_e \/ d_(e') \) = bb(E)_(e \, e') sum_v^(*) \| n_e \( v \) - n_(e') \( v \) \| =
   2 integral pi \( 1 - pi \) lt.eq 2 S . $ <ht:independent-profiles>]

=== 4.3 Excluding bounded total variation <excluding-bounded-total-variation>

We first use matching labels to transfer height control from edges to points.
  The argument is useful because it bounds heights of differences before any translation has been chosen.

#thm([Lemma 4.3.])[
  (Transferring edge heights).  #emph[Suppose a probability law $omega$ on two finite vertex sets $P times Q$,
    with point marginal $mu$, has the following property: for all assignments of finite labels to its vertices,
    two independent $mu$-points disagree with probability at most $C_0$ times the edge disagreement probability.
    For any coordinate $U : P union Q arrow.r cal(N)$,
$ bb(E)_(p \, p' tilde.op mu) h \( U_p - U_(p') \) lt.eq C_1 #scale(x: 120%, y: 120%)[\(]
  bb(E)_(\( p \, q \) tilde.op omega) h \( U_p - U_q \) + 1 #scale(x: 120%, y: 120%)[\)] \, $

 where $C_1$ depends only on $C_0$.]
] <ht:transfer>

#proof[
  Fix an entry $v$ and $s gt.eq 0$. At a nonarchimedean entry give two vertices the same label if their
    $U$-coordinates differ by at most $e^s$ in absolute value.
    The strong triangle inequality makes this an equivalence relation.
    At an archimedean entry, use the cell of a square grid in $bb(C)$ of side $e^s$,
    shifted by a uniformly random fractional vector. Only the labels occurring on the finite vertex set matter.
  For complex numbers whose distance is $a$, the probability of different grid cells is at most
  $ min \( 1 \, sqrt(2) thin a e^(- s) \) . $
  Indeed a mismatch in either real coordinate has probability at most its coordinate distance divided by the side
    length, and the two coordinate distances sum to at most $sqrt(2) a$.
    Its integral over $s gt.eq 0$ is at most $C \( 1 + log^(+) a \)$.
    At a nonarchimedean entry the integral of mismatch is exactly $log^(+) \| U_p - U_q \|_v$,
    with value zero for a zero difference. Thus the integrated edge mismatch, averaged over shifts at infinity,
    is at most $C \( bb(E)_(\( p \, q \) tilde.op omega) h \( U_p - U_q \) + 1 \)$.
  Apply the assumed label inequality at each fixed level and shift.
    For a point pair at a nonarchimedean entry, mismatch is exactly the event $\| U_p - U_(p') \|_v > e^s$.
    At infinity, distance greater than $sqrt(2) e^s$ forces mismatch for every shift.
    Integration of these tail events bounds the point-pair height,
    with an additional $log sqrt(2)$ from the total archimedean weight. This proves the result. ◻
]

#thm([Proposition 4.4.])[
  (The bounded alternative is impossible).  #emph[For a sequence of the incidence pieces in 5,
    with the level spaces and quantities $S$ in (4.7), no subsequence has $S$ bounded. Consequently $S arrow.r oo$.]
] <ht:bounded>

#proof[
  Suppose $S lt.eq S_0$ on a subsequence. All constants in this proof may depend on the fixed $S_0$.
    By (4.8), there is an edge value $d_0$ such that
  $ bb(E)_E h \( d_e \/ d_0 \) lt.eq S_0 . $
  Temporarily replace the two coordinates by $z \/ d_0$ and $d_0 w$.
    Their edge jumps are $D_e = d_e \/ d_0$ and $D_e^(- 1)$, whose mean heights are at most $S_0$.
    6 supplies the label hypothesis of 14. Applying it to both coordinates bounds the sum of the two mean
    point-pair difference heights. Averaging over the second point then chooses $p_0 in
    P$ such that the translated coordinates
  $ Z_x = \( z_x - z_(p_0) \) \/ d_0 \, wide W_x = d_0 \( w_x - w_(p_0) \) $
  satisfy a fixed bound on $bb(E)_mu \( h \( Z_p \) + h \( W_p \) \)$.
    Since $Z_q = Z_p - D_(p q)$ and $W_q = W_p - D_(p q)^(- 1)$ on an edge, 13 also bounds the center means.
    Thus there is a fixed $C_h < oo$ with
  #[#set math.equation(numbering: n => "(4.9)")
   $ bb(E)_mu \( h \( Z_p \) + h \( W_p \) \) + bb(E)_kappa \( h \( Z_q \) + h \( W_q \) \) +
     bb(E)_E \( h \( D_e \) + h \( D_e^(- 1) \) \) lt.eq C_h . $ <ht:normalized-means>]
  The edge identity is still $\( Z_p - Z_q \) \( W_p - W_q \) = 1$.
  We next give the selection argument, keeping the embedding independent of the points it tests.
    For #emph[any] fixed finite history map $H$ on $P$, use the joint law
  #[#set math.equation(numbering: n => "(4.10)")
   $ mu \( p \) thin mu \( hat(p) divides H \( hat(p) \) = H \( p \) \) product_(j = 1)^3
     bb(P) \( q_j divides p \) \, $ <ht:coupling>]
  and independently choose a uniformly random embedding $sigma$.
    Both $p$ and $hat(p)$ have marginal $mu$; each $q_j$ has marginal $kappa$;
    and each $\( p \, q_j \)$ has the original edge law. In particular, the three jumps $D_j =
    D_(p q_j)$ have the correct individual edge marginals. No assertion of mutual independence of these jumps is
    needed. The height inequality bounds $bb(E) h \( Z_(hat(p)) - Z_p \)$ and each $bb(E)
    h \( D_j - D_l \)$ using only (4.9). These bounds are uniform in $H$.
  Choose a fixed $B gt.eq 2$ so large that, by (4.5), the probability that any of
  $ Z_p \, W_p \, Z_(hat(p)) \, W_(hat(p)) \, \( Z_(q_j) \, W_(q_j) \, D_j \, D_j^(- 1) \)_(j = 1)^3 $
  has embedded absolute value greater than $B$ is less than $1 \/ 100$.
    Then choose a fixed $0 < r < 1$ so small that (4.5) makes the probability of any of
  $ & p eq.not hat(p) \, quad \| sigma \( Z_(hat(p)) - Z_p \) \| < r \,\
 & D_j eq.not D_l \, quad \| sigma \( D_j - D_l \) \| < r wide \( 1 lt.eq j < l lt.eq 3 \) $
  less than $1 \/ 100$ in total. The equalities have deliberately been excluded from these small-difference
    events. These estimates hold for every $H$ because they were integrated over a fresh independent embedding
    using only the fixed marginal bounds.
  Choose now
  #[#set math.equation(numbering: n => "(4.11)")
   $ 0 < tau < min (1 \, frac(r^4, 128 B^5)) . $ <ht:mesh>]
  At an embedding, encode each point by quantizing the real and imaginary parts of both $Z_p \,
    W_p$ in $\[ - B - 1 \, B + 1 \]$, in half-open intervals of length at most $tau$.
    Add an overflow code for points outside this box, using an endpoint convention to make a partition.
    This is a finite alphabet of size $M = M \( B \, tau \)$ independent of $t$ and of the field degree.
    An acceptance test at $q$ asks whether the point code is attained by some actual neighbor of $q$.
    The actual point on an edge always passes.
  By 8, $D = o \( log t \)$. Choose $K arrow.r oo$ with $K = o \( log t \)$ and $D \/ K arrow.r 0$.
    Apply 10 to independent uniform embeddings as tests. It gives a fixed strict-prefix history map with at most
    $M^(K - 1) = t^(o \( 1 \))$ values for which the predicted acceptance failure at a fresh embedding is
    $o \( 1 \)$. The choice of history is made after averaging the prediction failure over that fresh embedding;
    the embedding itself is not fixed. The geometric error bounds just proved remain valid for this selected history.
  Use this $H$ in (4.10), with one common prediction $hat(p)$ and three independently sampled neighbors of $p$.
    Each pair $\( hat(p) \, q_j \)$ has the prediction law in the acceptance estimate,
    so all three tests pass outside probability $o \( 1 \)$ by a union bound. Moreover
  #[#set math.equation(numbering: n => "(4.12)")
   $ bb(P) \( hat(p) = p \) =
     sum_(h : mu \( H = h \) > 0) frac(sum_(p : H \( p \) = h) mu \( p \)^2, mu \( H = h \)) lt.eq \| H \( P \) \|
     max_p mu \( p \) = t^(- 1 + o \( 1 \)) . $ <ht:collisions>]
  For $j eq.not l$, the conditional uniform neighbor law gives $bb(P) \( q_j = q_l \) lt.eq 1 \/ min_p d \( p \) =
    o \( 1 \)$. Distinct centers have distinct $Z$-coordinates, so $q_j eq.not q_l$ implies $D_j eq.not D_l$.
    The degree and atom estimates used here follow from 5. Combining all these estimates gives positive
    probability that all three tests pass, all displayed quantities are bounded by $B$, and
  #[#set math.equation(numbering: n => "(4.13)")
   $ \| sigma \( Z_(hat(p)) - Z_p \) \| gt.eq r \, wide \| sigma \( D_j - D_l \) \| gt.eq
     r quad \( j < l \) . $ <ht:separation>]
  Fix such an outcome and suppress $sigma$ from the notation.
    Successful acceptance provides, for each $j$, a genuine neighbor of $q_j$ in the same code as $hat(p)$.
    Since the latter has coordinates bounded by $B$, this is a nonoverflow code,
    and the two complex coordinate errors are at most $sqrt(2) tau$.
    Comparing with that neighbor’s exact edge equation gives
  $ \| \( Z_(hat(p)) - Z_(q_j) \) \( W_(hat(p)) - W_(q_j) \) - 1 \| lt.eq 8 B tau . $
  Set $Delta Z = Z_(hat(p)) - Z_p$ and $Delta W = W_(hat(p)) - W_p$.
    Subtracting the exact equation for $\( p \, q_j \)$ yields
  $ Delta Z \/ D_j + Delta W D_j + Delta Z Delta W = E_j \, wide \| E_j \| lt.eq 8 B tau . $
  Subtract the equation with $j = 1$ from those with $j = 2 \, 3$.
    The coefficient matrix for $\( Delta Z \, Delta W \)$ has determinant
  #[#set math.equation(numbering: n => "(4.14)")
   $ det mat(delim: "(", D_2^(- 1) - D_1^(- 1), D_2 - D_1; D_3^(- 1) - D_1^(- 1), D_3 - D_1) =
     frac(\( D_1 - D_2 \) \( D_1 - D_3 \) \( D_2 - D_3 \), D_1 D_2 D_3) . $ <ht:determinant>]
  Its absolute value is at least $r^3 \/ B^3$ by (4.13). Each matrix entry is at most $2 B$,
    and each right-hand side is at most $16 B tau$. Cramer’s rule therefore gives
  $ \| Delta Z \| lt.eq frac(64 B^5 tau, r^3) < r \/ 2 \, $
  contradicting (4.13). This excludes every bounded subsequence of $S$ and proves the proposition. ◻
]

=== 4.4 Coordinate states on the original levels <coordinate-states-on-the-original-levels>

We now return to the original coordinates $z \, w$, intervals $I_v$, and thresholds $n_e$. By 15, $S arrow.r oo$.
  At a level $\( v \, s \)$ give each vertex $x$ a state

$ y_x \( v \, s \) = \( A_x \( v \, s \) \, B_(1 \, x) \( v \, s \) \) . $

At a nonarchimedean entry, $A_x$ is the equivalence class for $\| z_x - z_(x') \|_v lt.eq e^(- s)$,
  and $B_(1 \, x)$ is that for $\| w_x - w_(x') \|_v lt.eq e^s$.
  At an archimedean entry associated with $sigma$, $A_x$ is the half-open square-grid cell containing
  $sigma \( z_x \)$ at side length $e^(- s)$, and $B_(1 \, x)$ is the cell containing $sigma \( w_x \)$ at side
  length $e^s$. For each of these two grids choose a fractional shift in $\[ 0 \, 1 \)^2$ and use that same
  fractional shift, scaled with the side length, at every level of the entry.

For a state $y = \( a \, b \)$ its strict cross is

#[#set math.equation(numbering: n => "(4.15)")
 $ R_y = { \( a' \, b' \) : upright("exactly one of ") a' = a upright(" and ") b' =
   b upright(" holds") } . $ <ht:strict-cross>]

Call an edge #emph[consistent] at a level if $Y_e = 1$ and exactly its $A$-labels agree, or if $Y_e =
  0$ and exactly its $B_1$-labels agree. Thus consistency implies that the endpoint states satisfy strict cross,
  and also specifies which coordinate agrees. Define

#[#set math.equation(numbering: n => "(4.16)")
 $ m \( v \, s \) = bb(P)_E { e upright(" is inconsistent at ") \( v \, s \) } \, wide m_e =
   integral upright(bold(1))_({ e upright(" is inconsistent") }) . $ <ht:inconsistency>]

#thm([Lemma 4.5.])[
  (State consistency).  #emph[The fractional shifts can be fixed so that
#[#set math.equation(numbering: n => "(4.17)")
 $ integral m = bb(E)_E m_e = O \( 1 \) \, $ <ht:inconsistency-budget>]

 with an absolute constant. At each nonarchimedean entry every edge is consistent outside finitely many threshold
   levels. If two vertices have matching $A$-labels, then
$ \| z_x - z_(x') \|_v lt.eq c_v e^(- s) \; $

 matching $B_1$-labels similarly implies $\| w_x - w_(x') \|_v lt.eq c_v e^s$, where $c_v =
   1$ at nonarchimedean entries and $c_v = sqrt(2)$ at archimedean entries.
   All the level functions can be chosen measurable.]
] <ht:states>

#proof[
  At a nonarchimedean entry, $n_e > s$ means $\| d_e \|_v < e^(- s)$ and $\| d_e^(- 1) \|_v > e^s$,
    so exactly $A$ agrees. For $n_e < s$ the two conclusions reverse.
    Only $s = n_e$ is excluded, a null set for the level measure.
  At infinity, put $r = \| s - n_e \|$. The smaller coordinate jump divided by its grid scale is $e^(- r)$,
    so its mismatch probability under a uniform shift is at most $sqrt(2) e^(- r)$.
    The larger jump divided by its scale is $e^r$; it cannot lie in the same cell once $r gt.eq log sqrt(2)$,
    by the diameter of a half-open square. Consequently the expected inconsistency indicator is at most
  $ upright(bold(1))_({ \| s - n_e \| lt.eq log sqrt(2) }) + sqrt(2) e^(- \| s - n_e \|) . $
  Its integral over the full real line is bounded by an absolute constant,
    and hence so is its integral over $I_v$. Sum over entries using total archimedean weight one,
    then average over edges. There are only finitely many archimedean shifts to choose at each index,
    so averaging fixes shifts satisfying (4.17).
  The match implications follow directly from the equivalence classes and the square diameter.
    For measurability, label nonarchimedean classes by the first vertex in a fixed ordering of $P union Q$,
    and use integer cell indices at infinity. All class comparisons are threshold comparisons and all cell indices
    are measurable functions of $s$. ◻
]

We have obtained a space of tests of finite measure with minority mass $S arrow.r oo$,
  while the integrated discrepancy between an edge’s threshold bit and its two coordinate agreements remains
  $O \( 1 \)$. This makes that discrepancy negligible relative to $S$.

== 5 Level decomposition and difference budgets <sec:budgets>

We now use $S arrow.r oo$, as guaranteed by 15. Our inputs are the expanding incidence graph,
  the threshold bits $Y_e \( v \, s \) = upright(bold(1))_({ n_e \( v \) > s })$,
  and the coordinate states $y_x = \( A_x \, B_(1 \, x) \)$ of 16.
  Recall that an edge is consistent when precisely its $A$ labels match if its bit is $1$,
  and precisely its $B_1$ labels match if its bit is $0$. The inconsistency probability $m \( v \, s \)$ satisfies
  $integral m = O \( 1 \)$. The purpose of this section is to compare two-edge samples at a point or a center.
  Their integrated scores will have a small upper bound from the product formula and a lower bound recording
  exceptions to dominant coordinate labels. These bounds also hold after conditioning point stars on a short list
  of histories.

All level integrals use the weighted measure of 4.2. In particular $f =
  min \( bb(P)_E \( Y = 0 \) \, bb(P)_E \( Y = 1 \) \)$ and $S = integral f$.
  Write $d_(P \, min) = min_(p in P) d \( p \)$ and $d_(Q \, min) = min_(q in Q) d \( q \)$.

=== 5.1 Parameters, rare levels, and histories <parameters-rare-levels-and-histories>

The parameters must make prediction errors small even after taking several samples,
  while keeping the number of possible histories small relative to a point degree.

#thm([Lemma 5.1.])[
  (Parameter choice).  #emph[There are integers $K \, L \, k arrow.r oo$ such that
#[#set math.equation(numbering: n => "(5.1)")
 $ K log L & = o \( log t \) \, & D \/ K & = o \( 1 \) \,\
k K log L & = o \( log t \) \, & k^20 (\( D \/ K \)^(1 \/ 4) + L^(- 1) + S^(- 1) + d_(Q \, min)^(- 1)) & =
  o \( 1 \) . $ <bud:KL>]

 Set $epsilon.alt = k^(- 1 \/ 16)$ and $e_t = \( D \/ K \)^(1 \/ 4) + L^(- 1)$.
   Then $k^3 \/ S = o \( 1 \)$, $k^(3 + 1 \/ 16) e_t = o \( 1 \)$, and $k = t^(o \( 1 \))$.]
] <bud:parameters>

#proof[
  The incidence estimates give $D = o \( log t \)$ and $d_(Q \, min) arrow.r oo$.
    For example, first take $K = ceil.l sqrt(\( D + 1 \) log t) ceil.r$ and then choose $L arrow.r
    oo$ with $log L tilde.op sqrt(log t \/ K)$. These choices give (5.1).
    Both $K log L \/ log t$ and the parenthesized expression in (5.1) tend to zero.
    Choosing $k arrow.r oo$ sufficiently slowly gives (5.1). Its stated consequences follow directly;
    in particular $k = o \( log t \)$ since $K log L arrow.r oo$. ◻
]

Define the common, damaged, and good rare levels, respectively, by

$ cal(C) = { f gt.eq epsilon.alt } \, wide cal(B) = { f < epsilon.alt \, med m > 1 \/ k } \, wide cal(G) =
  { f < epsilon.alt \, med m lt.eq 1 \/ k } . $

Their first two widths satisfy

#[#set math.equation(numbering: n => "(5.2)")
 $ W_c := integral upright(bold(1))_(cal(C)) lt.eq S \/ epsilon.alt \, wide W_b :=
   integral upright(bold(1))_(cal(B)) lt.eq k integral m = O \( k \) = o \( S \) . $ <bud:widths>]

At each place, $cal(C)$ is an interval, possibly empty or of zero length:
  the function $s mapsto bb(P)_E \( n_e \( v \) > s \)$ is nonincreasing.

At a good rare level let $r in { 0 \, 1 }$ be the minority bit, which is unique for all sufficiently large $t$.
  On every consistent majority-bit edge the $B_1$ labels match if $r = 1$, and the $A$ labels match if $r = 0$.
  Thus the mismatch probability of this coordinate is at most $f + m$.
  By 6 it has a label $ell$ whose two marginal exception probabilities have sum $O \( f + m \)$.
  Fix one such label measurably, and let $I_x \( v \, s \)$ indicate that the relevant coordinate of $x$ differs
  from $ell$. Write

$ h_P \( v \, s \) = bb(E)_mu I_p \( v \, s \) \, quad h_Q \( v \, s \) = bb(E)_kappa I_q \( v \, s \) \, quad
  H_x^(*) = integral_(cal(G)) I_x \( v \, s \) . $

Here and below $I_x$ is used only on $cal(G)$. Fixed orderings of the finite vertex sets settle all choices of
  labels, so measurability causes no additional restriction.

#thm([Lemma 5.2.])[
  (Exception mass and joint exceptions).  #emph[Uniformly on $cal(G)$,
#[#set math.equation(numbering: n => "(5.3)")
 $ h_P + h_Q lt.eq C \( f + m \) = o \( 1 \) \, wide f lt.eq h_P + h_Q + m . $ <bud:exception-comparison>]

 Consequently
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E)_mu H_p^(*) + bb(E)_kappa H_q^(*) = O \( S \) . $ <bud:first-moments>]

 Furthermore, with $\( p \, q \, r \)$ the ordinary wedge law,
#[#set math.equation(numbering: n => "(5.5)")
 $ integral_(cal(G)) bb(P)_E \( I_p = I_q = 1 \) = o \( S \) \, wide integral_(cal(G)) bb(P) \( I_p = I_r = 1 \) =
   o \( S \) . $ <bud:joint-exceptions>]

]
] <bud:rare-moments>

#proof[
  The first inequality was just proved, and its right side is uniformly $O \( epsilon.alt + 1 \/ k \) =
    o \( 1 \)$. If both endpoints have the dominant label, a consistent edge has the majority bit.
    Every minority-bit edge therefore has an exceptional endpoint or is inconsistent,
    proving the second inequality. Integrating and using $integral m = O \( 1 \)$ proves (5.4) because $S arrow.r oo$.
  For the joint errors, apply 7 with the uniform marginal bound $a_t = C \( epsilon.alt + k^(- 1) \) arrow.r
    0$ from (5.3). Its edge estimate gives $bb(P)_E \( I_p = I_q = 1 \) = o \( 1 \) \( h_P + h_Q \)$,
    and its ordinary-wedge estimate gives $bb(P) \( I_p = I_r = 1 \) = o \( 1 \) h_P$.
    These are exactly the edge and wedge laws used here. Both multipliers are uniform over all levels in $cal(G)$,
    so they can be taken outside the integrals. Equation (5.4) then gives (5.5). ◻
]

We next apply the prediction device only to common levels.
  When $W_c > 0$, sample a fresh level from their normalized measure and use 11.
  An inconsistent edge accounts for every true strict-cross failure.
  We obtain a fixed history map $H$ with $\| H \( P \) \| lt.eq L^(2 K)$ such that,
  writing $nu_h$ for the true-state law of a point of marginal $mu$ conditional on history $h$ at the fresh level,

#[#set math.equation(numbering: n => "(5.6)")
 $ k^3 integral_(cal(C)) bb(E)_E \[ 1 - nu_(H \( p \)) \( R_(y_q) \) \] = o \( S \) . $ <bud:prediction-error>]

Indeed the integral before multiplication by $k^3$ is at most $integral_(cal(C)) m + O \( W_c e_t \)$,
  and 17 and (5.2) apply. If $W_c = 0$, take the empty history, and the assertion is vacuous.

For each center $q$, a #emph[template] is an ordered list $theta = \( h_1 \, dots.h \, h_k \)$ obtained by
  sampling $k$ independent neighbors of $q$ and recording their histories.
  Let $a \( q \, theta \) = bb(P) \( theta divides q \)$. The number $M$ of possible templates satisfies

#[#set math.equation(numbering: n => "(5.7)")
 $ M lt.eq L^(2 K k) = t^(o \( 1 \)) . $ <bud:template-count>]

The history map is already fixed. Thus $a \( q \, theta \)$ uses no fresh level. In the joint law

#[#set math.equation(numbering: n => "(5.8)")
 $ omega \( p \, q \, theta \) = frac(upright(bold(1))_({ \( p \, q \) in E }), \| E \|) a \( q \, theta \) \,
   $ <bud:joint-law>]

the point $p$ and the template are independent conditional on $q$.

=== 5.2 Three fixed pair experiments <three-fixed-pair-experiments>

We use three ways to sample a base and two opposite endpoints:

+ $Q$: sample $q tilde.op kappa$, then $p \, r$ independently from the conditional edge law at $q$;
+ $P$: sample $p tilde.op mu$, then $q \, q'$ independently from the conditional edge law at $p$;
+ $P theta$: sample $\( p \, theta \)$ from its marginal under $omega$, then $q \,
  q'$ independently from $omega \( q divides p \, theta \)$.

Only positive-mass bases are used. In each experiment write $x$ for the base vertex, $y_1 \,
  y_2$ for its opposite endpoints, and $Y_1 \, Y_2$ for the corresponding edge bits.
  The base in the third experiment includes $theta$. At a level let $rho =
  bb(P) \( Y_1 = 1 divides upright("base") \)$ under the full indicated law.
  These laws are fixed across all levels. Define

#[#set math.equation(numbering: n => "(5.9)")
 $ C_i = integral_(cal(C)) bb(E)_(upright("base")) \[ 2 rho \( 1 - rho \) \] \, wide i in { Q \, P \,
   P theta } . $ <bud:variations>]

#thm([Lemma 5.3.])[
  (Marginals and diagonal pairs).  #emph[Each edge slot of each experiment, after averaging its base,
    has the original uniform law on $E$. For every $p in P$, the conditional probability of $q =
    q'$ in the $P theta$ experiment, averaged over $theta$ conditional on $p$, is at most $M \/ d \( p \)$.]
] <bud:pair-laws>

#proof[
  The first assertion is immediate for ordinary stars. For the third,
    the $\( p \, q \)$ marginal of (5.8) is the edge law since $sum_theta a \( q \, theta \) = 1$;
    sampling a conditional slot preserves this marginal. More explicitly,
    a slice of positive probability $w_theta = sum_(p \, q) omega \( p \, q \, theta \)$ has one-edge law
    $omega \( p \, q \, theta \) \/ w_theta$ and must be averaged with weight $w_theta$.
    One can also attach a template independently at a $Q$ base:
    conditional on $\( q \, theta \)$ its two point neighbors still have their original law,
    and its single-slot law in each slice is the same as for $P theta$.
  Fix $p$ and put $a_p \( theta \) = bb(P) \( theta divides p \)$. For $a_p \( theta \) > 0$,
  $ omega \( q divides p \, theta \) =
    frac(upright(bold(1))_({ \( p \, q \) in E }) a \( q \, theta \), d \( p \) a_p \( theta \)) lt.eq
    frac(1, d \( p \) a_p \( theta \)) . $
  Its collision probability is at most its largest atom. Multiplying by $a_p \( theta \)$ and summing over at most
    $M$ positive-mass templates gives the asserted bound pointwise in $p$. ◻
]

We now define scores that reward matching opposite endpoints and charge differing bits.
  If $Y_1 = Y_2 = 1$, let $N$ be the event that the $B_1$ labels of $y_1 \, y_2$ match; if $Y_1 = Y_2 = 0$,
  let $N$ instead mean that their $A$ labels match; set $N$ to be false when the bits differ.
  Thus $N$ concerns the coordinate which a consistent edge of that bit does not share with its base.
  For independent bits with parameter $rho$, equality has probability $rho^2 + \( 1 - rho \)^2$,
  whereas disagreement has probability $2 rho \( 1 - rho \)$. The former is larger except at $rho = 1 \/ 2$.
  Thus, when equal bits force $N$, a reward slightly above one near balance and slightly below one elsewhere can
  give a positive expected score. The decrease away from balance also makes room for the increase in the
  integrated upper bound below. 6 will identify the configurations in which equal bits force the required match. Set

$ delta = 1 / 100 \, wide lambda = delta^2 / 2 \, wide c \( rho \) =
  cases(delim: "{", 1 + lambda \, & \| rho - 1 / 2 \| lt.eq delta \,, 1 - lambda \, & \| rho - 1 / 2 \| > delta .) $

The scalar $lambda$ is a score coefficient; it is unrelated to the edge ratios $lambda_(p r)$ introduced later.
  At a good rare level write $r$ for the minority bit. The score is

$ upright("score") =
  cases(delim: "{", 2 I_x upright(bold(1))_({ Y_1 = Y_2 = r \, thin N }) \, & upright("at a good rare level") \,,
  c \( rho \) upright(bold(1))_({ Y_1 = Y_2 \, thin N }) \, & upright("at a common level") \,, 0 \, &
  upright("at a damaged level")) - upright(bold(1))_({ Y_1 eq.not Y_2 }) . $

Let $D_i$ be the expectation of this score integrated over all levels in experiment $i$.

The next estimate is the placewise mechanism behind the score bound.
  It identifies exactly when the coefficient $1 + lambda$ can spend more than the available interval length.

#thm([Lemma 5.4.])[
  (Two intervals and a central window).  #emph[Let $b lt.eq b'$, $T gt.eq 0$,
    and $J$ be an interval of finite length, with any choice of included endpoints.
    Put $I_(-) = \[ b - T \, b \]$, $I_(+) = \[ b' \, b' + T \]$, and $a = \| J ∩ I_(-) \| + \| J ∩ I_(+) \|$,
    where $\| dot.op \|$ denotes length. For $0 < lambda < 1$,
#[#set math.equation(numbering: n => "(5.10)")
 $ #scale(x: 120%, y: 120%)[\[] \( 1 - lambda \) 2 T + 2 lambda a - 2 T #scale(x: 120%, y: 120%)[\]]_(+) lt.eq
   lambda \| J \| thin upright(bold(1))_({ b \, b' in "int" J }) . $ <bud:central-envelope>]

 If $X$ has any probability law on $bb(R)$, and $\| bb(P) \( X > s \) - 1 \/ 2 \| lt.eq delta$ throughout $J$, then
#[#set math.equation(numbering: n => "(5.11)")
 $ bb(P) \( X in "int" J \) lt.eq 2 delta . $ <bud:interior-mass>]

]
] <bud:intervals>

#proof[
  The left side of (5.10) is $\[ 2 lambda \( a - T \) \]_(+)$.
    For it to be positive both intersections must have positive length, since either has length at most $T$.
    As $J$ is an interval, this puts both $b \, b'$ in its open interior, also when $b = b'$.
    Moreover $a lt.eq 2 T$ and $a lt.eq \| J \|$, since $I_(-)$ and $I_(+)$ have disjoint interiors.
    Hence $2 \( a - T \) lt.eq a lt.eq \| J \|$. For (5.11), take $u < v$ in the interior. Then
  $ bb(P) \( u < X lt.eq v \) = bb(P) \( X > u \) - bb(P) \( X > v \) lt.eq 2 delta . $
  Exhausting the open interior by such intervals proves the claim. The empty-interior case is immediate.
    This proof makes no assumption about atoms at either endpoint of $J$. ◻
]

1 illustrates why positive excess in 20 requires both thresholds to lie inside the central window.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.45, 0), (9.63, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((9.63, 0), [$s$], anchor: "west", padding: 0.1176cm)
  rect((0, 0.1125), (2.7, 0.4125), fill: rgb("#dedeff"), stroke: none)
  rect((2.7, 0.1125), (5.4, 0.4125), fill: rgb("#e8e8e8"), stroke: none)
  rect((5.4, 0.1125), (8.1, 0.4125), fill: rgb("#dedeff"), stroke: none)
  line((0, 0.2625), (2.7, 0.2625), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((5.4, 0.2625), (8.1, 0.2625), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((1.35, 0.7125), [$I_-$])
  content((4.05, 0.7125), [different bits])
  content((6.75, 0.7125), [$I_+$])
  line((0, -0.06), (0, 0.075), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.075), [$b-T$], anchor: "north", padding: 0.1176cm)
  line((2.7, -0.06), (2.7, 0.075), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.7, -0.075), [$b$], anchor: "north", padding: 0.1176cm)
  line((5.4, -0.06), (5.4, 0.075), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.4, -0.075), [$b'$], anchor: "north", padding: 0.1176cm)
  line((8.1, -0.06), (8.1, 0.075), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.1, -0.075), [$b'+T$], anchor: "north", padding: 0.1176cm)
  line((1.08, -0.75), (7.02, -0.75), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  line((1.08, -0.6375), (1.08, -0.8625), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  line((7.02, -0.6375), (7.02, -0.8625), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  content((4.05, -0.825), [central window $J$], anchor: "north", padding: 0.1176cm)
  line((2.7, -0.4875), (2.7, -0.7875), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((5.4, -0.4875), (5.4, -0.7875), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
})],
  caption: [Figure 1: The intervals $I_(-) = \[ b - T \, b \]$ and $I_(+) = \[ b' \, b' + T \]$, with $b lt.eq b'$ and $T gt.eq 0$, flank the bit-difference interval. The central window $J$ in 20 creates excess only if its total overlap with the two flanks exceeds $T$; then both thresholds lie strictly inside $J$. ],
) <fig:budget-intervals>

#thm([Proposition 5.5.])[
  (Upper score budget).  #emph[For each $i in { Q \, P \, P theta }$,
#[#set math.equation(numbering: n => "(5.12)")
 $ D_i lt.eq o \( S \) + 10 delta^2 lambda C_i . $ <bud:upper-equation>]

]
] <bud:upper>

#proof[
  First fix a base and two distinct opposite endpoints, and write $d \, d'$ for their incident jumps.
    Distinct real endpoints have distinct $z$ coordinates, so $d eq.not d'$. At a place $v$ let
  $ b = min \( n_e \( v \) \, n_(e') \( v \) \) \, quad b' = max \( n_e \( v \) \, n_(e') \( v \) \) \, quad u = -
    log \| d - d' \|_v \, quad alpha = u - b . $
  The two opposite-endpoint coordinate differences are $d - d'$ and $1 \/ d - 1 \/ d'$ up to signs. Therefore
  #[#set math.equation(numbering: n => "(5.13)")
   $ - log \| \( d - d' \) \( 1 \/ d - 1 \/ d' \) \|_v = 2 alpha - \( b' - b \) . $ <bud:place-identity>]
  All thresholds lie within the chosen level interval, so the integrated bit-difference charge at this place is
    exactly $b' - b$.
  Let $c_v = log 2$ at archimedean entries and $c_v = 0$ otherwise.
    The triangle inequality gives $alpha gt.eq - c_v$, hence $T_v := alpha + c_v gt.eq 0$.
    Equality of a grid label at infinity bounds the corresponding difference by $sqrt(2)$ times the grid scale;
    at a finite place a matching label bounds it by the scale itself.
    If both bits are $1$, a positive charge requires $s < b$ and a $B_1$ match, which gives
  $ s gt.eq b' - alpha - c_v gt.eq b - T_v . $
  If both bits are $0$, the analogous $A$ match gives $s gt.eq b'$ and $s lt.eq b + alpha + c_v lt.eq b' + T_v$.
    Thus all positive charges lie in
  #[#set math.equation(numbering: n => "(5.14)")
   $ I_(-) = \[ b - T_v \, b \] \, wide I_(+) = \[ b' \, b' + T_v \] . $ <bud:positive-intervals>]
  Enlarging to these full intervals is legitimate even if part of them lies outside the chosen level interval.
  Suppose a rare positive is counted with minority bit $1$ at a threshold $s_0$.
    Then $s_0 < b$ and $bb(P)_E \( n_e \( v \) > s_0 \) < epsilon.alt$.
    By monotonicity every common level and every level with minority bit $0$ lies below $s_0$;
    none can produce a positive charge in $I_(+)$. All minority-$1$ positive charges lie in $I_(-)$ by definition.
    The case of a rare positive with minority bit $0$ is symmetric.
    Thus, if any rare positive is counted, all positive charges are on one side,
    their coefficients are at most $2$, and their total is at most $2 T_v$.
  Otherwise only common positives remain. For this fixed base put
  $ J_v = { s : \( v \, s \) in cal(C) \, med \| rho \( v \, s \) - 1 \/ 2 \| lt.eq delta } . $
  This is an interval because the conditional edge law is fixed across levels and both restrictions are intervals.
    Extend the coefficient $1 - lambda$ across both full intervals in (5.14),
    increasing it by $2 lambda$ on $J_v$. 20 bounds the excess over $2 T_v$ by
  $ lambda \| J_v \| thin upright(bold(1))_({ n_e \( v \) \, n_(e') \( v \) in "int" J_v }) . $
  This expression is also a valid excess bound in the rare-positive case, when no excess is needed.
    Combining it with the negative charge and (5.13), then summing over places,
    cancels the logarithm by the product formula for the fixed nonzero element
    $\( d - d' \) \( 1 \/ d - 1 \/ d' \)$. The additive allowance is $2 sum_v^(*) c_v = 2 log 2$.
    Places of zero level width can be included in this sum: their positive and negative charges vanish and the
    same upper bound still holds.
  Now average this bound over the fixed-base independent pair law, restricting to distinct pairs.
    Dropping that restriction only in the nonnegative excess term,
    (5.11) bounds its expectation by $4 delta^2 lambda \| J_v \|$.
    Boundary atoms are not counted; distinct jumps with equal thresholds cause no exception to this argument.
    On $J_v$, $2 rho \( 1 - rho \) gt.eq 2 \( 1 \/ 4 - delta^2 \)$.
    Averaging over bases and places therefore bounds the distinct-pair contribution by
  $ O \( 1 \) + frac(4 delta^2 lambda, 2 \( 1 \/ 4 - delta^2 \)) C_i lt.eq O \( 1 \) + 10 delta^2 lambda C_i . $
  It remains to bound equal endpoints, to which the product formula was not applied.
    Their positive score is at most $2 \( W_c + H_x^(*) \)$ for a base vertex $x$,
    and their negative score is zero. The ordinary collision probabilities are $1 \/ d \( q \)$ and $1 \/
    d \( p \)$. For templated stars 19 gives the bound $M \/ d \( p \)$ pointwise in $p$.
    Consequently their total contributions are at most, respectively,
  $ 2 / d_(Q \, min) \( W_c + bb(E)_kappa H_q^(*) \) \, quad 2 / d_(P \, min) \( W_c + bb(E)_mu H_p^(*) \) \, quad
    frac(2 M, d_(P \, min)) \( W_c + bb(E)_mu H_p^(*) \) . $
  Each is $o \( S \)$ by Lemma 5.1, Lemma 5.2, (5.7), and $d_(P \, min) = t^(1 + o \( a \))$.
    In particular multiplication by an unbounded $H_p^(*)$ requires only its first moment,
    since the collision estimate holds for every $p$. Finally $O \( 1 \) = o \( S \)$. ◻
]

The upper budget is insensitive to whether the star lies at a point or a center.
  The next lower bound keeps track of that orientation. Its two main terms will cancel when one point-star score
  is added to one center-star score.

#thm([Proposition 5.6.])[
  (Rare-level lower budget).  #emph[For each of the three pair experiments,
    let $x$ be its star vertex and $y$ an opposite endpoint. Its score integrated outside $cal(C)$ is at least
#[#set math.equation(numbering: n => "(5.15)")
 $ 2 bb(E) H_x^(*) - 2 bb(E) H_y^(*) - o \( S \) \, $ <bud:rare-lower-equation>]

 where both expectations use the original edge marginals on the appropriate sides.
   In particular this is $2 bb(E)_kappa H_q^(*) - 2 bb(E)_mu H_p^(*) - o \( S \)$ for $Q$,
   and its opposite main term for either $P$ or $P theta$.]
] <bud:rare-lower>

#proof[
  At a good rare level denote the inconsistency indicator in slot $j$ by $M_j$.
    If $I_x = 1$, both other endpoints are normal, and both edges are consistent,
    their dominant-coordinate labels match each other but differ from the base’s.
    Both bits must therefore be the minority bit and the required nonshared coordinate matches.
    The positive score is consequently at least
  $ 2 I_x - 2 I_x I_(y_1) - 2 I_x I_(y_2) - 2 M_1 - 2 M_2 . $
  If both opposite endpoints are normal and both edges consistent,
    their bits agree regardless of whether the base is exceptional.
    Hence the negative charge is at most $I_(y_1) + I_(y_2) + M_1 + M_2$. Average these two pointwise bounds.
    Each slot has the original edge marginal by 19, even with templates.
    The integrals of the joint terms $I_x I_(y_j)$ are $o \( S \)$ by (5.5);
    the inconsistency integrals are $O \( 1 \)$. This gives (5.15) on $cal(G)$.
    On $cal(B)$ there are no positives and the negative score is at least $- 1$, whose total cost is $W_b =
    o \( S \)$. ◻
]

== 6 Common levels and positive rare mass <sec:common>

We use the histories, templates and three star scores constructed in 5.
  The first objective is to show that common levels contribute only $o \( S \)$ bit variation at a center.
  The second is to show that the point exceptions on good rare levels retain a positive fraction of $S$.
  Both conclusions come from comparing the upper and lower star budgets,
  but the comparison first requires a precise description of the states permitted by a template.

Throughout this section, $S arrow.r oo$, the parameters satisfy 17, and $H$ is the fixed history map from (5.6).
  At a level, $nu_h$ denotes the distribution of the true state $\( A \, B_1 \)$ of a point sampled from $mu$
  conditional on $H = h$. Dependence on the level is suppressed. For a state $y = \( a \, b \)$, its strict cross is

$ R_y = { \( u \, v \) : \( u = a \, med v eq.not b \) med upright("or") med \( u eq.not a \, med v = b \) } . $

A row means a set with fixed first coordinate; a column has fixed second coordinate.
  These conventions do not refer to a geometric direction in the plane.

=== 6.1 From sampled histories to the actual point <from-sampled-histories-to-the-actual-point>

For a center $q$, define the mixture of predictions

$ tilde(nu)_q = bb(E)_(p divides q) nu_(H \( p \)) . $

For its template $theta = \( h_1 \, dots.h \, h_k \)$, define the finite set of candidate center states

#[#set math.equation(numbering: n => "(6.1)")
 $ cal(Y)_theta = { y upright(" a center state") : nu_(h_j) \( R_y \) gt.eq 1 -
   k^(- 2) upright(" for every ") 1 lt.eq j lt.eq k } . $ <com:candidates>]

The actual state $y_q$ is usually a candidate: the union bound and Markov’s inequality give,
  after integration on $cal(C)$,

#[#set math.equation(numbering: n => "(6.2)")
 $ integral_(cal(C)) bb(P) \( y_q in.not cal(Y)_theta \) lt.eq
   k^3 integral_(cal(C)) bb(E)_E \[ 1 - nu_(H \( p \)) \( R_(y_q) \) \] = o \( S \) . $ <com:actual-candidate>]

We also need every candidate to have large mass under $tilde(nu)_q$.
  The following elementary sampling bound supplies this uniformity.
  For its first assertion, we specialize the $epsilon$-net double-sampling argument to strict crosses
  #cite(label("HausslerWelzl1987")) Lemmas 3.4–3.5. The strict-cross trace bound, the weighted-law formulation,
  and the subsequent posterior-support transfer are established here.

#thm([Lemma 6.1.])[
  (Sampling strict crosses).  #emph[Let $nu$ be a probability measure on a finite product set and let $X_1 \,
    dots.h \, X_k$ be independent samples from $nu$. For $0 < alpha < 1$ and $k alpha gt.eq 8$,
$ bb(P) #scale(x: 120%, y: 120%)[\(] exists y : nu \( R_y \) < 1 - alpha \, med X_1 \, dots.h \,
  X_k in R_y #scale(x: 120%, y: 120%)[\)] lt.eq 2 \( 2 k + 1 \)^2 thin 2^(- k alpha \/ 2) . $

 Consequently, when $k$ is sufficiently large, the templates in (6.1) satisfy
#[#set math.equation(numbering: n => "(6.3)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] exists y in cal(Y)_theta : tilde(nu)_q \( R_y \) < 1 -
   k^(- 1 \/ 4) divides q #scale(x: 120%, y: 120%)[\)] lt.eq
   4 \( 2 k + 1 \)^2 thin 2^(- k^(3 \/ 4) \/ 2) $ <com:mixture>]

 at each level, uniformly in $q$.]
] <com:ghost>

#proof[
  Adjoin independent samples $X_(k + 1) \, dots.h \, X_(2 k)$.
    If the first $k$ samples admit a cross as in the event, select one by a fixed ordering.
    For this selected cross, the number of misses among the new samples has mean $k beta$, where $beta =
    nu \( R_y^c \) > alpha$, and variance at most $k beta$. Thus the probability of fewer than $k alpha \/
    2$ misses is at most $4 \/ \( k beta \) lt.eq 1 \/ 2$. It suffices to bound twice the probability that some
    cross contains the first half and misses at least $k alpha \/ 2$ of the second half.
  Condition on the pooled $2 k$ samples and split their indices uniformly into two halves.
    A cross induces at most $\( 2 k + 1 \)^2$ different subsets of these indices:
    its first coordinate can agree with one of at most $2 k$ observed coordinates, or none,
    and the same holds for its second coordinate. If a pattern has $m$ misses,
    the probability that they all fall in the second half is zero for $m > k$, and otherwise is
  $ frac(k \( k - 1 \) dots.h.c \( k - m + 1 \), \( 2 k \) \( 2 k - 1 \) dots.h.c \( 2 k - m + 1 \)) lt.eq 2^(- m) . $
  The union bound proves the first assertion. Repeated sampled states cause no problem,
    since the argument concerns the indexed samples.
  For the second assertion, after sampling the histories independently given $q$,
    independently sample a state from each corresponding $nu_(h_j)$.
    Before the histories are revealed these states are independent with law $tilde(nu)_q$.
    If a candidate violating the required conclusion exists, select one as a function of the template.
    Conditional on that template, all the synthetic states lie in its cross with probability at least $1 -
    k dot.op k^(- 2) = 1 - 1 \/ k$. Apply the first assertion with $alpha = k^(- 1 \/ 4)$ and divide by $1 - 1 \/ k$. ◻
]

Since $W_c lt.eq k^(1 \/ 16) S$, the integral of the failure probability in (6.3) is $o \( S \)$.
  A candidate therefore constrains the mixture of predicted states.
  To constrain the actual point, we will use only rows, columns and sets of at most two states.
  This restriction is essential to the next argument.

#thm([Lemma 6.2.])[
  (Transfer for restricted supports).  #emph[Fix a level and the joint edge–template law
$ bb(P) \( p \, q \, theta \) = bb(P)_E \( p \, q \) bb(P) \( theta divides q \) . $

 Let $0 < eta < 1 \/ 2$. As a function of $\( q \, theta \)$, select a support $U \( q \, theta \)$ that is a row,
   a column, or a set of at most two states. On an event $G$ determined by $\( q \, theta \)$, suppose
$ tilde(nu)_q \( U \( q \, theta \) \) gt.eq 1 - 3 eta^2 . $

 Then the actual point state $X \( p \)$ satisfies
$ bb(P) #scale(x: 120%, y: 120%)[\(] G \, med X \( p \) in.not U \( q \, theta \) #scale(x: 120%, y: 120%)[\)]
  lt.eq 8 eta . $

 The support type and its coordinates may depend on both $q$ and $theta$.]
] <com:transfer>

#proof[
  Conditional on $\( q \, theta \)$, the history of the actual point has its ordinary conditional law given $q$,
    because the template is independent of the point given $q$. Hence on $G$,
  $ bb(E) \[ nu_(H \( p \)) \( U \( q \, theta \)^c \) divides q \, theta \] lt.eq 3 eta^2 . $
  The event that this support has $nu_(H \( p \))$-mass less than $1 - eta$ therefore has probability at most $3 eta$.
  For each history $h$, define three exceptional sets using only $nu_h$.
    If a row has mass at least $1 - eta$, it is unique, and the first exceptional set is its complement.
    If no such row exists, the first exceptional set is empty. Define the second set in the same way for columns.
    Their masses are at most $eta$ each.
  If a set of at most two states has mass at least $1 - eta$, put
  $ M_h = { x : nu_h \( x \) > eta } $
  and take $M_h^c$ as the third exceptional set. Every set $U$ of at most two states and mass at least $1 -
    eta$ contains $M_h$: omitting an atom of mass greater than $eta$ would violate that mass bound.
    Choosing one such $U$ also gives
  $ nu_h \( M_h^c \) lt.eq nu_h \( U^c \) + nu_h \( U \\ M_h \) lt.eq eta + 2 eta = 3 eta . $
  If no such $U$ exists, the third exceptional set is empty.
    The union of the three exceptional sets thus has mass at most $5 eta$.
  The actual point has marginal law $mu$, under which its state conditional on $H =
    h$ has distribution exactly $nu_h$. Consequently the probability of this union of exceptional sets is at most
    $5 eta$ under the entire edge–template law. Outside it and the earlier nonconcentration event,
    the actual state belongs to whichever permitted support was selected.
    Adding the two error bounds proves the result. ◻
]

In the application, at most three candidates will be chosen by a fixed ordering at each level and template.
  Outside the failure event bounded in (6.3), the intersection of their crosses has mixture mass at least $1 -
  3 k^(- 1 \/ 4)$. When this intersection is contained in a row or a column, use that row or column as $U$;
  when it has size at most two, use the intersection itself. With $eta = k^(- 1 \/ 8)$, 24 costs at most

$ 8 k^(- 1 \/ 8) W_c lt.eq 8 k^(- 1 \/ 16) S = o \( S \) . $

An empty intersection cannot have the asserted mixture mass for large $k$.
  The proof has used the actual point marginal only for exceptional events defined by the history and level.
  It has made no assertion about the law of the actual state after additionally conditioning on a selected support.

=== 6.2 Classification and suppression of common variation <classification-and-suppression-of-common-variation>

We now apply this transfer to the finite geometry of strict crosses.
  Two distinct center states in one row, say $\( a \, b \)$ and $\( a \, b' \)$, have common cross

#[#set math.equation(numbering: n => "(6.4)")
 $ R_(\( a \, b \)) ∩ R_(\( a \, b' \)) = { \( a \, v \) : v in.not { b \, b' } } . $ <com:row-intersection>]

A third center state outside that row cuts this intersection down to at most one point.
  The corresponding assertions hold for columns. If two states $\( a \, b \)$ and $\( a' \, b' \)$ differ in both
  coordinates, their common cross is

#[#set math.equation(numbering: n => "(6.5)")
 $ R_(\( a \, b \)) ∩ R_(\( a' \, b' \)) = { \( a \, b' \) \, \( a' \, b \) } . $ <com:corners>]

Three states whose first coordinates are all distinct and whose second coordinates are all distinct have empty
  common cross. Indeed each of the two points in (6.5) fails to share a coordinate with the third state.
  These observations give an exhaustive classification: a candidate set is empty, is a singleton,
  contains two distinct states sharing a coordinate, or consists of states with pairwise distinct coordinates.
  In the shared-coordinate case, either all candidates lie in that row or column, or a third lies outside it.
  In the pairwise-distinct case there are either two candidates or at least three.

2 shows the two-corner case: either endpoint state together with the bit determines the state at the other endpoint.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.7975, 0), (3.697, 0), (-0.7975, 2.3), (3.697, 2.3), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.575), (0, 2.875), (2.9, -0.575), (2.9, 2.875), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.1098, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.9, 2.3), radius: 0.1098, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.9, 0), radius: 0.1247, fill: rgb("#0000a6"), stroke: none)
  circle((0, 2.3), radius: 0.1247, fill: rgb("#0000a6"), stroke: none)
  content((-0.9096, -0.4069), [$y_1=(a,b)$])
  content((3.986, 2.707), [$y_2=(a',b')$])
  content((3.66, -0.4072), [$(a,b')$])
  content((-0.7596, 2.707), [$(a',b)$])
  content((0, 1.15), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$Y=0$]])], angle: 90deg)
  content((2.9, 1.15), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$Y=0$]])], angle: 90deg)
  content((1.45, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$Y=1$]])])
  content((1.45, 2.3), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$Y=1$]])])
})],
  caption: [Figure 2: Two candidate center states differing in both coordinates admit exactly two point states in their common strict cross. The filled points are those opposite corners. Within this four-state configuration, the bit of a consistent edge and the state at either endpoint determine the state at the other endpoint. Rows have fixed first label and columns have fixed second label. The diagram displays coordinate equalities of states, not geometric positions of the original plane points. ],
) <com:fig-crosses>

Declare a single edge with its template bad at a common level if its state test is inconsistent,
  if $y_q in.not cal(Y)_theta$, if the event inside the probability in (6.3) occurs,
  or if the restricted-support transfer fails for the witnesses specified by this classification.
  The witnesses are two states sharing a coordinate, with a third outside that row or column when one exists;
  two states differing in both coordinates; or three states with pairwise distinct coordinates.
  Empty candidate sets and empty witness intersections have no good edges.
  All choices are deterministic functions of the level and template.
  The preceding estimates and the integrated inconsistency bound give

#[#set math.equation(numbering: n => "(6.6)")
 $ integral_(cal(C)) bb(P) \( p \, q \, theta upright(" is bad") \) = o \( S \) . $ <com:bad-mass>]

The comparisons below must use the full conditional bit probability $rho$ in the definition of the scores.
  We never remove bad edges and renormalize that law. In particular the discontinuity of $c \( rho \)$ at $1 \/ 2
  plus.minus delta$ introduces no error.

Here is the numerical estimate used in the two-corner case.
  For every $0 lt.eq rho lt.eq 1$, with $delta = 0.01$, $lambda = delta^2 \/ 2$, and $c$ as in 5,

#[#set math.equation(numbering: n => "(6.7)")
 $ c \( rho \) #scale(x: 120%, y: 120%)[\(] rho^2 + \( 1 - rho \)^2 #scale(x: 120%, y: 120%)[\)] -
   2 rho \( 1 - rho \) & = \( 2 rho - 1 \)^2 + \( c \( rho \) - 1 \) #scale(x: 120%, y: 120%)[\(]
   rho^2 + \( 1 - rho \)^2 #scale(x: 120%, y: 120%)[\)]\
 & gt.eq lambda \/ 2 . $ <com:score-polynomial>]

For $\| rho - 1 \/ 2 \| lt.eq delta$, discard the first square and use $rho^2 + \( 1 - rho \)^2 gt.eq 1 \/ 2$.
  Outside that interval the expression is at least $4 delta^2 - lambda > lambda \/ 2$.

#thm([Proposition 6.3.])[
  (Common variation).  #emph[For the center-star and point–template-star experiments of 19,
#[#set math.equation(numbering: n => "(6.8)")
 $ C_Q + C_(P theta) = o \( S \) . $ <com:variation-eq>]

 Moreover their rare exception means satisfy
#[#set math.equation(numbering: n => "(6.9)")
 $ bb(E)_kappa H_q^(*) lt.eq bb(E)_mu H_p^(*) + o \( S \) . $ <com:center-rare>]

]
] <com:variation>

#proof[
  Fix a common level. For each template of positive probability, let $pi_theta = bb(P) \( theta \)$ and $b_theta =
    bb(P) \( upright("bad edge") divides theta \)$, with both probabilities taken under the joint law in 24.
    In the center-star experiment, condition on $theta$ and then sample $q$ by its actual conditional law.
    The two points are still independent with their ordinary law given $q$.
    In the point–template-star experiment, sample $p$ conditional on $theta$,
    then two independent centers given $\( p \, theta \)$. Each slot in either experiment has the same conditional
    single-edge law $bb(P) \( p \, q divides theta \)$. Therefore a pair with at least one bad slot has
    probability at most $2 b_theta$ in either experiment.
  Write $V_Q \( theta \)$ and $V_(P theta) \( theta \)$ for the corresponding averages of $2
    rho \( 1 - rho \)$ over bases in this slice, and write $d_Q \( theta \) \,
    d_(P theta) \( theta \)$ for its two common-level expected scores.
    Each $V$ is at most $1 \/ 2$, and either score is at least the negative of its variation. We prove
  #[#set math.equation(numbering: n => "(6.10)")
   $ d_Q \( theta \) + d_(P theta) \( theta \) gt.eq lambda / 4 #scale(x: 120%, y: 120%)[\(] V_Q \( theta \) +
     V_(P theta) \( theta \) #scale(x: 120%, y: 120%)[\)] - C b_theta $ <com:slice-score>]
  with an absolute constant $C$. All coefficients in a common score are bounded by $1 + lambda$,
    so charging a pair with a bad slot always costs at most an absolute multiple of its probability.
  #emph[An empty candidate set.] Every edge is bad, so $b_theta = 1$,
    and the boundedness of the scores proves (6.10) on increasing $C$.
  #emph[One candidate state.] At a fixed point–template base, two good edges have the same center state.
    Consistency forces their bits to agree, and the nonshared coordinate of their center states matches.
    Thus this star score is at least $1 - lambda - O \( b_theta \)$ after averaging over its bases.
    The center-star score is at least $- 1 \/ 2$. Their sum is at least $1 \/ 2 - lambda - O \( b_theta \)$,
    which implies (6.10) because the two variations sum to at most one.
  #emph[Two candidates sharing a coordinate, and all candidates in that row or column.] The transfer using (6.4)
    places every good point in the same row or column. If it is a row,
    every good edge has matching $A$-coordinates and hence bit $1$, by consistency;
    in the column case every good edge has bit $0$. A bit difference in either pair experiment therefore requires
    a bad slot. This gives $V_Q \( theta \) + V_(P theta) \( theta \) lt.eq 4 b_theta$.
    The lower score bound $d_i gt.eq - V_i$ now proves (6.10).
  #emph[Two candidates sharing a coordinate, and a third outside that row or column.] The three witness crosses
    intersect in at most one state. If the intersection is empty, all edges are bad.
    Otherwise all good point states equal that one state. At a center base,
    two good edges consequently have equal bits and the required nonshared-coordinate match.
    Its score is at least $1 - lambda - O \( b_theta \)$, and the other score is at least $- 1 \/ 2$.
    The same estimate as in the singleton case applies.
  #emph[No coordinate shared by distinct candidates.] If there are at least three candidates,
    their common cross is empty and all edges are bad. Otherwise there are exactly two candidates.
    The good point states lie in their two opposite corners from (6.5).
    At either type of base, a good edge’s bit determines the state at the other endpoint.
    Thus two good edges with equal bits have the required collision.
    For the full conditional probability $rho$ at that base, their expected score is at least the left side of
    (6.7), less an absolute multiple of the probability of a bad slot.
    After averaging bases, each score is at least $lambda \/ 2 - O \( b_theta \)$, which proves (6.10).
  This completes the classification. Multiply (6.10) by its actual slice weight $pi_theta$, sum,
    and integrate over common levels. The error is $C integral_(cal(C)) sum_theta pi_theta b_theta =
    o \( S \)$ by (6.6). This argument allows individual $b_theta$ to be large;
    no inverse slice weight or number of templates enters. The common contributions to $D_Q +
    D_(P theta)$ are therefore at least
  $ lambda / 4 \( C_Q + C_(P theta) \) - o \( S \) . $
  The lower bounds in 22 outside common levels cancel their main terms,
    because the two star vertices are on opposite sides. Hence
  $ lambda / 4 \( C_Q + C_(P theta) \) - o \( S \) lt.eq D_Q + D_(P theta) lt.eq
    10 delta^2 lambda \( C_Q + C_(P theta) \) + o \( S \) \, $
  where the last inequality is 21. Since $10 delta^2 < 1 \/ 4$, this proves (6.8).
  Finally the common contribution to $D_Q$ is at least $- C_Q$. 22 and 21 therefore give
  $ 2 bb(E)_kappa H_q^(*) - 2 bb(E)_mu H_p^(*) - C_Q - o \( S \) lt.eq D_Q lt.eq 10 delta^2 lambda C_Q + o \( S \) . $
  Use $C_Q = o \( S \)$ to obtain (6.9). ◻
]

=== 6.3 A second score forces positive rare mass <a-second-score-forces-positive-rare-mass>

We have suppressed common variation at centers. To show that point exceptions remain on rare levels,
  suppose temporarily that their mean is $o \( S \)$. 25 then gives the same bound for center exceptions.
  We will show that common variation is also small at ordinary point stars.
  Once both ordinary star variations are small, expansion forces the edge bit itself to be almost constant at
  nearly every level, contradicting $S = integral f$.

For a probability measure $nu$ on states, let $nu_A \, nu_(B_1)$ denote its coordinate marginals,
  with squared norms equal to the sums of squares of their atom masses. Define

#[#set math.equation(numbering: n => "(6.11)")
 $ T =
   integral_(cal(C)) bb(E)_mu
   [lr(bar.v.double \( nu_(H \( p \)) \)_A bar.v.double)_2^2 + lr(bar.v.double \( nu_(H \( p \)) \)_(B_1)
   bar.v.double)_2^2 - 1] . $ <com:T>]

These norms count coordinate matches between two independent predicted points with the same history.
  Unlike the preceding star scores, $T$ uses no center.

#thm([Lemma 6.4.])[
  (The two-prediction score).  #emph[If $bb(E)_mu H_p^(*) = o \( S \)$, then $T lt.eq o \( S \)$.]
] <com:prediction-score>

#proof[
  Choose a history with its marginal probability, then two independent points $p' \,
    p''$ from $mu$ conditional on that history. This is one fixed coupling throughout all levels,
    and each point marginal is $mu$. At a level, the expected value of
  $ F \( p' \, p'' \) = upright(bold(1))_({ A \( p' \) = A \( p'' \) }) +
    upright(bold(1))_({ B_1 \( p' \) = B_1 \( p'' \) }) - 1 $
  is the integrand in (6.11).
  For a distinct pair put $Z = z_(p') - z_(p'')$ and $W = w_(p') - w_(p'')$, both nonzero.
    At a place with level interval $\[ l \, u \]$, the endpoint conditions from (4.6) say $l lt.eq -
    log \| Z \|_v$ and $u gt.eq log \| W \|_v$. The $A$-match can hold only for $s lt.eq - log \| Z \|_v +
    O_v \( 1 \)$, and the $B_1$-match only for $s gt.eq log \| W \|_v - O_v \( 1 \)$.
    Here the constants vanish at nonarchimedean places and are absolute at infinity. Therefore
  $ integral_l^u F \( p' \, p'' \) thin upright(d) s lt.eq - log \| Z \|_v - log \| W \|_v + O_v \( 1 \) . $
  The product formula, and total archimedean weight one, show that the integral over all levels is at most an
    absolute constant.
  At a good rare level where neither point is exceptional, their dominant coordinate labels match, so $F gt.eq 0$.
    In general at such a level
  $ F gt.eq - upright(bold(1))_({ p' upright(" exceptional") }) - upright(bold(1))_({ p'' upright(" exceptional") }) . $
  The contribution on damaged levels is at least $- W_b$. Removing all noncommon levels from the full integral
    consequently gives, for each distinct pair,
  $ integral_(cal(C)) F \( p' \, p'' \) lt.eq O \( 1 \) + H_(p')^(*) + H_(p'')^(*) + W_b . $
  On the diagonal the common-level integral is exactly $W_c$. Its probability under the selected coupling is
  $ sum_(p in P) frac(mu \( p \)^2, mu \( H^(- 1) \( H \( p \) \) \)) lt.eq \| H \( P \) \| max_p mu \( p \) =
    t^(- 1 + o \( 1 \)) . $
  Here $\| H \( P \) \| lt.eq L^(2 K) = t^(o \( 1 \))$ and the marginal degree bounds were proved in 2.
    Since $W_c lt.eq k^(1 \/ 16) S$ and $k = t^(o \( 1 \))$, its contribution is $o \( S \)$.
    Average the bound for distinct pairs, using the two marginals $mu$, $W_b = o \( S \)$, and $S arrow.r oo$.
    This proves $T lt.eq 2 bb(E)_mu H_p^(*) + o \( S \) = o \( S \)$. ◻
]

#thm([Proposition 6.5.])[
  (Positive rare mass).  #emph[The good rare point exceptions satisfy
#[#set math.equation(numbering: n => "(6.12)")
 $ liminf_(t arrow.r oo) frac(bb(E)_mu H_p^(*), S) > 0 . $ <com:rare-positive-eq>]

]
] <com:rare-positive>

#proof[
  If the conclusion fails, restrict to a subsequence on which $bb(E)_mu H_p^(*) = o \( S \)$.
    By (6.9), also $bb(E)_kappa H_q^(*) = o \( S \)$, and 26 gives $T lt.eq o \( S \)$.
  At a common level declare an ordinary edge bad if its test is inconsistent or if $nu_(H \( p \)) \( R_(y_q) \) <
    1 - k^(- 2)$. Its integrated probability is $o \( S \)$, because Markov’s inequality bounds the second
    contribution by $k^2 integral_(cal(C)) bb(E)_E \[ 1 - nu_(H \( p \)) \( R_(y_q) \) \] = o \( S \)$.
    Fix a point $p$ and this level. Write $b_p$ for its conditional bad-edge probability, $nu = nu_(H \( p \))$,
    $zeta = k^(- 2)$, and
  $ tau \( nu \) = lr(bar.v.double nu_A bar.v.double)_2^2 + lr(bar.v.double nu_(B_1) bar.v.double)_2^2 - 1 . $
  Let $cal(Y)_p$ be the states of its good neighbors. Every such state has $nu \( R_y \) gt.eq 1 - zeta$,
    and the actual point state belongs to each $R_y$, by consistency.
    Let $d_P \( p \)$ be the common-level score at this ordinary point star,
    using its full bit probability $rho_p$. We claim
  #[#set math.equation(numbering: n => "(6.13)")
   $ d_P \( p \) + tau \( nu \) gt.eq lambda / 4 thin 2 rho_p \( 1 - rho_p \) -
     C \( b_p + zeta \) . $ <com:second-slice-score>]
  As before, a pair with a bad slot costs only $O \( b_p \)$; its probability is at most $2 b_p$.
    The strict-cross classification proves the claim as follows.
  If $cal(Y)_p$ is empty, $b_p = 1$, while $d_P \( p \) gt.eq - 1 \/ 2$ and $tau \( nu \) gt.eq - 1$,
    so the claim holds for an absolute $C$.
  If $cal(Y)_p = { \( a \, b \) }$, put $r = nu_A \( a \)$, $s = nu_(B_1) \( b \)$.
    Since $r + s gt.eq nu \( R_(\( a \, b \)) \) gt.eq 1 - zeta$,
  $ tau \( nu \) gt.eq r^2 + s^2 - 1 gt.eq 1 / 2 \( 1 - zeta \)^2 - 1 gt.eq - 1 / 2 - zeta . $
  Two good neighbors have the same state and bit, so $d_P \( p \) gt.eq 1 - lambda - O \( b_p \)$.
    Their sum has the positive lower bound needed for (6.13).
  If two states share a row, their common cross is in that row, of $nu$-mass at least $1 - 2 zeta$.
    Thus $tau \( nu \) gt.eq \( 1 - 2 zeta \)^2 - 1 gt.eq - 4 zeta$.
    If every state is in that row, the actual point lies there too,
    since it belongs to the crosses of both distinct states. All good edges consequently have bit $1$.
    Their full-law variation is at most $2 b_p$, and $d_P \( p \) gt.eq - 2 b_p$, proving the claim in this case.
    Columns give bit $0$ and the same estimates. If there is a third state outside the row or column,
    the three crosses have intersection of size at most one and mass at least $1 - 3 zeta$.
    It must be a singleton for large $k$. Both marginals then have an atom of at least that mass, giving
  $ tau \( nu \) gt.eq 2 \( 1 - 3 zeta \)^2 - 1 gt.eq 1 - 12 zeta . $
  Together with $d_P \( p \) gt.eq - 1 \/ 2$, this is more than sufficient.
  Finally suppose no coordinate is shared by distinct states in $cal(Y)_p$.
    Three such states are impossible, since the actual point belongs to all their crosses and their intersection
    is empty. In the remaining case there are two states differing in both coordinates.
    The two opposite corners carry $nu$-mass at least $1 - 2 zeta$.
    Each coordinate marginal therefore has at least that mass on a set of size two, so
  $ tau \( nu \) gt.eq 2 dot.op frac(\( 1 - 2 zeta \)^2, 2) - 1 gt.eq - 4 zeta . $
  The actual point is one of those corners. Its bit determines the good neighbor state;
    hence (6.7) gives $d_P \( p \) gt.eq lambda \/ 2 - O \( b_p \)$. This completes the proof of (6.13).
  Average (6.13) over $p$ and integrate on common levels. The bad-edge integral is $o \( S \)$,
    and $zeta W_c lt.eq k^(- 31 \/ 16) S = o \( S \)$. The result is
  $ \( upright("common contribution to ") D_P \) + T gt.eq lambda / 4 C_P - o \( S \) . $
  The noncommon contribution to $D_P$ is at least $- o \( S \)$ by 22,
    under the present assumptions on both exception means. Therefore
  $ lambda / 4 C_P - o \( S \) lt.eq D_P + T lt.eq 10 delta^2 lambda C_P + o \( S \) \, $
  and again $10 delta^2 < 1 \/ 4$ yields $C_P = o \( S \)$.
  To finish, let $V_P \, V_Q$ be the ordinary star variations at any fixed level.
    Assign to each vertex its conditional majority bit, breaking ties in a fixed way.
    The probability that the bit on an incident edge differs from this label is at most the corresponding average
    variation, because $min \( rho \, 1 - rho \) lt.eq 2 rho \( 1 - rho \)$.
    Thus the two endpoint labels disagree on an edge with probability at most $V_P + V_Q$.
    When that sum is small, the matching-label consequence of expansion in 6 gives one bit label with total
    marginal exception probability $O \( V_P + V_Q \)$. The edge bit differs from it with probability
    $O \( V_P + V_Q \)$ as well. When the sum is not small the same bound follows from $f lt.eq 1 \/ 2$,
    with a larger absolute constant. Consequently
  $ f lt.eq C \( V_P + V_Q \) $
  uniformly for all sufficiently large $t$. Integrating on common levels gives $integral_(cal(C)) f lt.eq
    C \( C_P + C_Q \) = o \( S \)$.
  On good rare levels, the minority-bit probability is bounded by the two marginal exception probabilities and the
    inconsistency probability, as in 18. Its integral is $o \( S \)$ under the present assumptions.
    Damaged levels contribute at most $W_b \/ 2 = o \( S \)$. Thus $S = integral f = o \( S \)$, a contradiction.
    This proves (6.12). ◻
]

The positive rare mass is a first-moment statement. To extract many pairs at a single height scale,
  7 next controls its large-height tail and removes errors in height-weighted measure before selecting a band.
  Throughout that selection, the center-star variation bound $C_Q =
  o \( S \)$ remains available under the original wedge law.

== 7 Extracting multiplicatively organized pairs <sec:extraction>

We now use Proposition 6.3, Proposition 6.5: the ordinary center-star variation satisfies $C_Q = o \( S \)$,
  whereas the point exception mass satisfies $liminf bb(E)_mu H_p^(*) \/ S > 0$.
  Here $S arrow.r oo$, and the parameters, levels, and exception indicators are those of 5.
  Our objective is a graph on two copies of $P$ whose edges carry ratios of unit jumps.
  These ratios will have large height, while their alternating products around every complete rectangle have
  negligible height.

Throughout this section an #emph[ordinary wedge] is sampled by taking $q$ with law $kappa$ and then taking $p \,
  r$ independently and uniformly among its neighbors in $E$. Its two point marginals are $mu$.
  We retain the notation $W_c$ for the width of common levels, $W_b$ for the width of damaged rare levels,
  and $m_(p q)$ for the integrated inconsistency indicator of the edge $p q$. In particular,

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E)_mu H_p^(*) + bb(E)_kappa H_q^(*) = O \( S \) \, wide bb(E)_E m_(p q) = O \( 1 \) \, wide W_c lt.eq
   S \/ epsilon.alt \, wide W_b = o \( S \) \, quad epsilon.alt = k^(- 1 \/ 16) . $ <ext:inputs>]

All integrals over levels include the prescribed place weights.

=== 7.1 A pointwise estimate and its tail consequence <a-pointwise-estimate-and-its-tail-consequence>

The first-moment bound in (7.1) alone does not prevent all exception mass from being carried by extremely rare
  points. We obtain the needed tail control by applying the product formula separately to each distinct pair of
  neighbors of a point.

#thm([Lemma 7.1.])[
  (Pointwise rare-level estimate).  #emph[For every $p in P$ and every pair of distinct neighbors $q \, q' in Q$,
#[#set math.equation(numbering: n => "(7.2)")
 $ 2 H_p^(*) lt.eq 3 #scale(x: 120%, y: 120%)[\(] H_q^(*) + H_(q')^(*) + m_(p q) +
   m_(p q') #scale(x: 120%, y: 120%)[\)] + W_c + W_b + 2 log 2 . $ <ext:pointwise-bound>]

]
] <ext:pointwise>

#proof[
  At a good rare level, let $X \, U \, V$ be the exception indicators of $p \, q \, q'$, and let $I \,
    I'$ be the inconsistency indicators of the two edges. Write $P_(+)$ for the rare positive charge in the
    point-star score: it equals two when $p$ is exceptional, both bits are minority bits,
    and the two neighbors have matching nonshared coordinates; otherwise it is zero.
    Write $N = \| Y_(p q) - Y_(p q') \|$. If $U = V = I = I' = 0$, the two bits are the same function of $X$:
    they are both majority bits for $X = 0$, and both minority bits for $X = 1$.
    In the latter case the nonshared coordinate of both neighbors has the dominant label, so $P_(+) = 2$.
    Consequently, pointwise,
  $ P_(+) gt.eq 2 X - 2 \( U + V + I + I' \) \, wide N lt.eq U + V + I + I' \, $
  and hence
  #[#set math.equation(numbering: n => "(7.3)")
   $ P_(+) - N gt.eq 2 X - 3 \( U + V + I + I' \) . $ <ext:local-rare-score>]
  In particular, a simultaneous exception at $p$ and at a neighbor is charged directly to the neighbor indicator.
  For completeness, the upper bound for this rare-only score is also pointwise.
    Put $d = z_p - z_q$, $d' = z_p - z_(q')$. These jumps are distinct and nonzero.
    At a place $v$, sort their thresholds as $b lt.eq b'$, and set
  $ u = - log \| d - d' \|_v \, wide alpha = u - b \, wide T_v =
    cases(delim: "{", alpha + log 2 \, & v upright(" archimedean") \,, alpha \, & v upright(" nonarchimedean") .) $
  The triangle inequality makes $T_v gt.eq 0$. Matching coordinates in a square cell of side length $r$ gives
    distance at most $sqrt(2) r$, and matching nonarchimedean labels gives distance at most $r$.
    Thus positive charges with both bits one lie within $\[ b - T_v \, b \]$,
    and positive charges with both bits zero lie within $\[ b' \, b' + T_v \]$.
  Only one of these two intervals can contain a rare positive charge.
    Indeed every level where zero is the minority bit precedes every level where one is the minority bit.
    A zero-bit rare positive would require a threshold at least $b'$,
    while a one-bit rare positive would require a later threshold strictly less than $b$, which is impossible.
    The total rare positive charge at this place is therefore at most $2 T_v$.
    The all-level negative charge is $b' - b$, because the level interval contains both thresholds. Moreover,
  $ - log \| \( d - d' \) \( 1 \/ d - 1 \/ d' \) \|_v = 2 alpha - \( b' - b \) . $
  Summing over places, the product formula cancels this last expression.
    The archimedean weights sum to one, so the rare positives minus the all-level negative charge total at most $2
    log 2$.
  Integrating (7.3) gives a lower bound for that same score.
    Outside the good rare levels there are no positive terms, and the negative charge is at most $W_c + W_b$.
    Comparing the lower and upper bounds proves (7.2). ◻
]

#thm([Lemma 7.2.])[
  (Tail control).  #emph[Let $R_0 = epsilon.alt^(- 2) = k^(1 \/ 8)$. Then
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E)_mu #scale(x: 120%, y: 120%)[\[] H_p^(*) upright(bold(1))_({ H_p^(*) > R_0 S })
   #scale(x: 120%, y: 120%)[\]] = o \( S \) . $ <ext:tail-bound>]

]
] <ext:tail>

#proof[
  Choose an absolute $C_0$ for which each of the two exception expectations in (7.1) is at most $C_0 S$,
    for all sufficiently large indices. Put
  $ T = { p : H_p^(*) > R_0 S } \, wide A_t = bb(E)_mu \[ H_p^(*) upright(bold(1))_T \] \, wide d_(P \, min) =
    min_(p in P) d \( p \) . $
  On $T$, the deterministic last three terms of (7.2) have sum at most $H_p^(*)$, eventually, since
  $ frac(W_c + W_b + 2 log 2, R_0 S) lt.eq epsilon.alt + frac(W_b + 2 log 2, R_0 S) = o \( 1 \) . $
  After absorbing them, we may cap each neighbor height at $H_p^(*)$:
  #[#set math.equation(numbering: n => "(7.5)")
   $ H_p^(*) lt.eq 3 #scale(x: 120%, y: 120%)[\(] min \( H_p^(*) \, H_q^(*) \) + min \( H_p^(*) \, H_(q')^(*) \) +
     m_(p q) + m_(p q') #scale(x: 120%, y: 120%)[\)] \, wide p in T \, $ <ext:capped-pointwise>]
  for distinct $q \, q'$. If a cap changes a term, that capped term already equals $H_p^(*)$ and suffices for this
    inequality; otherwise the preceding inequality is unchanged.
  Sample $p$ with law $mu$ and two neighbors independently and uniformly given $p$.
    Restrict the left side to distinct neighbors. The exact conditional probability of distinctness is $1 -
    1 \/ d \( p \)$. On the nonnegative right side we can drop this restriction. Thus
  #[#set math.equation(numbering: n => "(7.6)")
   $ \( 1 - d_(P \, min)^(- 1) \) A_t lt.eq 6 bb(E)_E \[ min \( H_p^(*) \, H_q^(*) \) upright(bold(1))_T \] +
     C_m \, $ <ext:tail-average>]
  where $C_m$ is an absolute upper bound for $6 bb(E)_E m_(p q)$.
    This calculation uses the distinctness probability at each individual point,
    so it remains valid even when its exception mass is very large.
  We estimate the capped expectation by layer cake. For $u gt.eq 0$ let
  $ F_u = { p : H_p^(*) > max \( u \, R_0 S \) } \, wide G_u = { q : H_q^(*) > u } \, $
  and write $h_P \( u \) = mu \( F_u \)$, $h_Q \( u \) = kappa \( G_u \)$.
    The marginal version of the expansion estimate from 2, with $eta = gamma - 1 \/ 2 > 0$, is
  $ bb(P)_E \( F \, G \) lt.eq sqrt(mu \( F \) kappa \( G \))
    [gamma^(- \( 1 + 2 eta \)) \( mu \( F \) kappa \( G \) \)^eta + gamma^(- 1) xi_t] . $
  Because $h_P \( u \) lt.eq C_0 \/ R_0$ and $h_Q \( u \) lt.eq 1$, the same multiplier
  $ theta.alt_t = gamma^(- \( 1 + 2 eta \)) \( C_0 \/ R_0 \)^eta + gamma^(- 1) xi_t = o \( 1 \) $
  works at every threshold $u$, including thresholds where the center set has full measure.
    Tonelli’s theorem and Cauchy–Schwarz now give
  $ bb(E)_E \[ min \( H_p^(*) \, H_q^(*) \) upright(bold(1))_T \] & =
    integral_0^oo bb(P)_E \( F_u \, G_u \) thin upright(d) u\
 & lt.eq theta.alt_t (integral_0^oo h_P \( u \) thin upright(d) u)^(1 \/ 2)
   (integral_0^oo h_Q \( u \) thin upright(d) u)^(1 \/ 2)\
 & = theta.alt_t sqrt(A_t bb(E)_kappa H_q^(*)) lt.eq theta.alt_t sqrt(C_0 A_t S) . $
  The first integral equals the unknown tail first moment $A_t$,
    including its contribution below the threshold $R_0 S$. Since $d_(P \, min) arrow.r oo$, (7.6) implies eventually
  $ 1 / 2 A_t lt.eq 6 theta.alt_t sqrt(C_0 A_t S) + C_m lt.eq 1 / 4 A_t + 36 C_0 theta.alt_t^2 S + C_m . $
  The last step is Young’s inequality. Consequently
  $ A_t / S lt.eq 144 C_0 theta.alt_t^2 + frac(4 C_m, S) arrow.r 0 \, $
  as required. ◻
]

=== 7.2 Point profiles and a common height band <point-profiles-and-a-common-height-band>

We next express a wedge’s jump ratio as a difference of profiles attached to its two point endpoints.
  On a good rare level $\( v \, s \)$, let $X_x \( v \, s \) =
  I_x \( v \, s \)$ be the exception indicator of the vertex $x$ from 5, and let $sigma \( v \, s \) =
  1$ when one is the minority bit and $- 1$ when zero is the minority bit.
  Define a real-valued profile, indexed by places, by

#[#set math.equation(numbering: n => "(7.7)")
 $ a_p \( v \) = integral_(s : thin \( v \, s \) upright(" is")\
upright("good rare")) sigma \( v \, s \) X_p \( v \, s \) thin upright(d) s . $ <ext:profile-definition>]

For a place profile $b$, write $lr(bar.v.double b bar.v.double)_1 = sum_v^(*) \| b \( v \) \|$.

#thm([Lemma 7.3.])[
  (Wedge profiles).  #emph[For an ordinary wedge $\( p \, q \, r \)$,
    there are nonnegative random variables $E_1 \, E_2$, with $bb(E) E_1 + bb(E) E_2 = o \( S \)$, such that
#[#set math.equation(numbering: n => "(7.8)")
 $ lr(bar.v.double \( n_(p q) - n_(r q) \) - \( a_p - a_r \) bar.v.double)_1 & lt.eq E_1 \,\
lr(bar.v.double n_(p q) - n_(r q) bar.v.double)_1 & gt.eq H_p^(*) + H_r^(*) - E_2 . $ <ext:profile-error>]

 Here $n_(p q) \( v \) = - log \| z_p - z_q \|_v$.]
] <ext:profiles>

#proof[
  Let $cal(G)$ denote the good rare levels, and let $I_(p q)$ be the levelwise inconsistency indicator.
    At a level in $cal(G)$, write $b in { 0 \, 1 }$ for the majority bit. Consistency gives
  $ Y_(p q) = b + sigma \( X_p + X_q \) $
  unless both endpoints are exceptional or the edge is inconsistent.
    In all cases the absolute residual in this identity is at most $2 \( X_p X_q + I_(p q) \)$.
    Subtracting the identities for the two edges cancels the center contribution. At each place,
  $ n_(p q) \( v \) - n_(r q) \( v \) = integral \( Y_(p q) - Y_(r q) \) thin upright(d) s \, $
  since both bits are single thresholds inside the level interval. It follows that (7.8) holds with
  $ E_1 = integral_(cal(C)) \| Y_(p q) - Y_(r q) \| + W_b +
    2 integral_(cal(G)) \( X_p X_q + X_r X_q + I_(p q) + I_(r q) \) . $
  Its mean is $o \( S \)$: the first term averages to $C_Q = o \( S \)$,
    the joint edge exceptions have integrated expectation $o \( S \)$, and the remaining bounds are in (7.1).
  There is also the exact identity
  $ lr(bar.v.double n_(p q) - n_(r q) bar.v.double)_1 = integral \| Y_(p q) - Y_(r q) \| . $
  On a good rare level with exactly one exceptional point endpoint, a normal center, and two consistent edges,
    the bits differ. More explicitly, at every good rare level,
  $ \| Y_(p q) - Y_(r q) \| gt.eq X_p + X_r - 2 \( X_p X_r + X_p X_q + X_r X_q + I_(p q) + I_(r q) \) . $
  If none of the terms subtracted is present, this is the preceding observation; if any is present,
    the right side is nonpositive. Integrating proves (7.8) with
  $ E_2 = 2 integral_(cal(G)) \( X_p X_r + X_p X_q + X_r X_q + I_(p q) + I_(r q) \) . $
  The integrated joint point exceptions on a wedge and joint edge exceptions are $o \( S \)$, by 18.
    Thus $bb(E) E_2 = o \( S \)$ as well. ◻
]

The next selection makes these average error bounds uniform before choosing a dyadic band.
  This order matters because the probability of the eventual band tends to zero.

#thm([Lemma 7.4.])[
  (A band of accurate wedges).  #emph[There are a constant $c > 0$, independent of $t$ along the fixed sequence,
    a sequence $delta_t arrow.r 0$, and scales $J arrow.r oo$ such that a set of ordinary wedges of probability at least
#[#set math.equation(numbering: n => "(7.9)")
 $ frac(c, R_0 log \( 2 R_0 \)) = t^(- o \( 1 \)) $ <ext:band-mass>]

 satisfies, uniformly on the set,
#[#set math.equation(numbering: n => "(7.10)")
 $ J lt.eq H_p^(*) + H_r^(*) lt.eq 2 J \, wide E_1 + E_2 lt.eq
   delta_t \( H_p^(*) + H_r^(*) \) . $ <ext:band-conditions>]

 Every such wedge has $p eq.not r$.]
] <ext:band>

#proof[
  Set $W = H_p^(*) + H_r^(*)$ and $Z = E_1 + E_2$. By 27, choose $c_0 > 0$,
    independent of $t$ along the fixed sequence, such that $bb(E) W gt.eq 4 c_0 S$ eventually.
    Choose $delta_t arrow.r 0$ sufficiently slowly that $bb(E) Z \/ delta_t = o \( S \)$.
    Before selecting any band, discard wedges with $Z > delta_t W$. Their lost weight is at most
  $ bb(E) \[ W upright(bold(1))_({ Z > delta_t W }) \] lt.eq frac(bb(E) Z, delta_t) = o \( S \) . $
  Also discard $W < c_0 S$, losing at most $c_0 S$. If $W > 2 R_0 S$,
    its larger summand exceeds $R_0 S$ and is at least $W \/ 2$. Thus 29 gives
  $ bb(E) \[ W upright(bold(1))_({ W > 2 R_0 S }) \] lt.eq 2
    bb(E) \[ H_p^(*) upright(bold(1))_({ H_p^(*) > R_0 S }) \] +
    2 bb(E) \[ H_r^(*) upright(bold(1))_({ H_r^(*) > R_0 S }) \] = o \( S \) . $
  The surviving weighted mass is at least $2 c_0 S$, whereas every surviving wedge has $W lt.eq 2 R_0 S$.
    Its probability is therefore at least $c_0 \/ R_0$.
  Partition $\[ c_0 S \, 2 R_0 S \]$ into at most $1 + ceil.l log_2 \( 2 R_0 \/ c_0 \) ceil.r =
    O \( log \( 2 R_0 \) \)$ dyadic bands, using half-open endpoints except at the final endpoint.
    One band has the probability in (7.9); if $J$ is its lower endpoint, then $J gt.eq c_0 S arrow.r oo$,
    and (7.10) holds. The parameter hierarchy gives $k = t^(o \( 1 \))$,
    so the lower bound in (7.9) is indeed $t^(- o \( 1 \))$. Finally, if $p = r$, the left side of (7.8) is zero,
    whereas its right side is at least $\( 1 - delta_t \) W > 0$ for all sufficiently large indices.
    Such a wedge cannot survive. ◻
]

=== 7.3 Removing common unit circles and choosing witnesses <removing-common-unit-circles-and-choosing-witnesses>

The algebraic argument will require that a retained pair does not lie on a common unit circle containing many
  points of $P$. This exclusion must concern all real unit circles, including those whose centers do not belong to $Q$.

#thm([Lemma 7.5.])[
  (Popular-circle deletion).  #emph[Call a real unit circle #emph[popular] if it contains at least $t^(9 \/ 10)$
    points of $P$. The ordinary wedge probability of $p \, r$ lying on a common popular circle is at most
#[#set math.equation(numbering: n => "(7.11)")
 $ t^(- 3 \/ 5 + o \( 1 \)) + t^(- 9 \/ 5 + o \( 1 \)) + frac(2, min_(q in Q) d \( q \)) . $ <ext:circle-cost>]

 This is $o \( 1 \/ \( R_0 log \( 2 R_0 \) \) \)$. In particular,
   removing such wedges from the set in 31 preserves the lower probability bound (7.9), after decreasing its constant.]
] <ext:circles>

#proof[
  Write $M$ for the number of popular circles. Every pair of distinct real points lies on at most two unit
    circles. Counting pairs on popular circles therefore gives
  $ M binom(ceil.l t^(9 \/ 10) ceil.r, 2) lt.eq 2 binom(\| \| P, 2) \, wide M lt.eq t^(1 \/ 5 + o \( 1 \)) \, $
  using $\| \| P = t^(1 + o \( 1 \))$. The set $P_(upright("mult"))$ of points on at least two popular circles has
    size at most $2 binom(M, 2) lt.eq t^(2 \/ 5 + o \( 1 \))$,
    because distinct circles intersect in at most two points. The degree bounds give
  $ max_p mu \( p \) lt.eq t^(- 1 + o \( 1 \)) \, wide max_q kappa \( q \) lt.eq t^(- 2 + o \( 1 \)) . $
  Consequently wedges hitting $P_(upright("mult"))$ at either point endpoint have probability at most
    $t^(- 3 \/ 5 + o \( 1 \))$. Centers in $Q$ whose own unit circle is popular number at most $M$;
    wedges with such a center have probability at most $t^(- 9 \/ 5 + o \( 1 \))$.
  To bound the remaining bad wedges, fix $p in.not P_(upright("mult"))$ and a center $q$ whose own circle is not
    popular, in the original sampling law. The point $p$ belongs to at most one popular circle.
    If there is one, it differs from the unit circle centered at $q$, since the latter is not popular.
    Their intersection has at most two points. In this original law, $r$ is a uniform neighbor of $q$,
    so the probability that it shares a popular circle with $p$ is at most $2 \/ d \( q \)$,
    even before requiring $r in.not P_(upright("mult"))$. This proves (7.11).
  For the comparison with the selected band, recall $R_0 = k^(1 \/ 8)$, $k = t^(o \( 1 \))$,
    and the explicit requirement $k^20 \/ min_q d \( q \) arrow.r 0$ in 17.
    The first two terms of (7.11), multiplied by $R_0 log \( 2 R_0 \)$, tend to zero by a fixed power of $t$.
    For the third term,
  $ frac(R_0 log \( 2 R_0 \), min_q d \( q \)) = frac(k^(1 \/ 8) log \( 2 k^(1 \/ 8) \), k^20)
    frac(k^20, min_q d \( q \)) arrow.r 0 . $
  This establishes the required relative loss bound. ◻
]

We can now forget the probability weights and retain an ordinary graph.
  The estimates already hold separately for every surviving wedge,
  so choosing one center for each endpoint pair preserves them.

#thm([Proposition 7.6.])[
  (Organized pair graph).  #emph[For the incidence graphs and levels constructed above, there are $J arrow.r oo$,
    a sequence $omega_t arrow.r 0$, and a simple bipartite graph $cal(E)$ between two copies of $P$,
    each of size at most $t^(1 + o \( 1 \))$, with at least $t^(2 - o \( 1 \))$ edges,
    having the following properties. Each edge $\( p \, r \)$ has distinct endpoints and an assigned center $q =
    q \( p \, r \) in Q$ with $p q \, r q in E$. Set
$ lambda_(p r) = frac(z_p - z_(q \( p \, r \)), z_r - z_(q \( p \, r \))) . $

 No edge has both endpoints on any real unit circle containing at least $t^(9 \/ 10)$ points of $P$.
   Uniformly over the edges and complete rectangles of $cal(E)$,
#[#set math.equation(numbering: n => "(7.12)")
 $ \( z_p - z_r \) \( w_p - w_r \) & = 2 - lambda_(p r) - lambda_(p r)^(- 1) \,\
h \( lambda_(p r) \) & gt.eq J \/ 3 \,\
h #h(-0.16667em) (frac(lambda_(p r) lambda_(p' r'), lambda_(p r') lambda_(p' r))) & lt.eq
  omega_t J . $ <ext:pair-identity>]

 In the last line all four indicated edges are required to be present; their assigned centers need not agree.
   The edge ratios $lambda_(p r)$ are unrelated to the fixed score constant $lambda$.]
] <ext:pairs>

#proof[
  Take the band from 31, and remove the wedges excluded by 32.
    Its probability remains at least $c \/ \( R_0 log \( 2 R_0 \) \) = t^(- o \( 1 \))$,
    and all its endpoint pairs are distinct. For any fixed off-diagonal pair $\( p \, r \)$,
    its ordinary wedge probability is
  $ sum_(q : thin p q \, r q in E) frac(1, \| \| E thin d \( q \)) lt.eq frac(2, \| \| E min_q d \( q \)) . $
  Here the sum has at most two terms, since two distinct real points have at most two unit-circle centers.
    The retained wedges therefore contain at least
  $ frac(c \| \| E min_q d \( q \), 2 R_0 log \( 2 R_0 \)) gt.eq t^(2 - o \( 1 \)) $
  distinct ordered endpoint pairs, using $\| \| E = t^(2 + 2 a + o \( a \))$ and $min_q d \( q \) =
    t^(a + o \( a \))$. These pairs form $cal(E)$. Choose one surviving witnessing center for each pair.
  For its two jumps $d = z_p - z_q$, $d' = z_r - z_q$, the exact unit equations give $w_p - w_q =
    1 \/ d$ and $w_r - w_q = 1 \/ d'$. Hence
  $ \( z_p - z_r \) \( w_p - w_r \) = \( d - d' \) \( 1 \/ d - 1 \/ d' \) = 2 - d \/ d' - d' \/ d \, $
  proving (7.12). The product formula gives
  $ 2 h \( lambda_(p r) \) = sum_v^(*) \| log \| lambda_(p r) \|_v \| =
    lr(bar.v.double n_(p q) - n_(r q) bar.v.double)_1 gt.eq \( 1 - delta_t \) J \, $
  so (7.12) holds for all sufficiently large indices.
  Finally, put
  $ b_(p r) \( v \) = log \| lambda_(p r) \|_v + a_p \( v \) - a_r \( v \) . $
  By (7.8) and (7.10), $lr(bar.v.double b_(p r) bar.v.double)_1 lt.eq 2 delta_t J$,
    uniformly on all retained edges. On a complete rectangle, the unary profiles cancel, leaving
  $ log lr(|frac(lambda_(p r) lambda_(p' r'), lambda_(p r') lambda_(p' r))|)_v = b_(p r) \( v \) +
    b_(p' r') \( v \) - b_(p r') \( v \) - b_(p' r) \( v \) . $
  Its weighted absolute sum is at most $8 delta_t J$. Another use of the product formula bounds its height by $4
    delta_t J$, proving (7.12) with $omega_t = 4 delta_t$. The popular-circle exclusion holds by construction. ◻
]

== 8 The algebraic obstruction <sec:algebra>

The preceding section produced many pairs whose edge ratios have large height,
  although their multiplicative defects around rectangles have negligible height.
  We now show that this is impossible. The argument uses a fixed complete bipartite pattern.
  Its positions will be sufficiently independent to separate several square roots,
  whereas differentiation of the rectangle relations will force a dependence between them.

Here and below a unit circle means a circle of radius exactly one in the original real plane.
  For a point $p = \( x_p \, y_p \)$, retain the coordinates $z_p = x_p + i y_p$ and $w_p = x_p - i y_p$.

#thm([Proposition 8.1.])[
  (Obstruction to multiplicative rectangles).  #emph[There is no sequence with the following properties.
    At index $n$, let $t_n arrow.r oo$, let $J_n arrow.r oo$,
    and let $P_n subset bb(R)^2$ be a finite set of algebraic points with $\| P_n \| lt.eq t_n^(1 + o \( 1 \))$.
    Let $G_n subset P_n times P_n$ be a bipartite graph, using two copies of $P_n$,
    with at least $t_n^(2 - o \( 1 \))$ edges. To each edge $\( p \, r \)$ assign a nonzero algebraic number
    $lambda_(p r)$. Suppose that, for an absolute $c > 0$,
#[#set math.equation(numbering: n => "(8.1)")
 $ \( z_p - z_r \) \( w_p - w_r \) & = 2 - lambda_(p r) - lambda_(p r)^(- 1) \,\
h \( lambda_(p r) \) & gt.eq c J_n \,\
h (frac(lambda_(p r) lambda_(p' r'), lambda_(p r') lambda_(p' r))) & = o \( J_n \) $ <alg:distance>]

 uniformly over edges and complete rectangles, respectively.
   Finally, suppose that no edge has both endpoints on a unit circle containing at least $t_n^(9 \/ 10)$ points of
   $P_n$. Here $h$ is the absolute height from 13.]
] <alg:obstruction>

We prove the proposition through a sequence of algebraic constructions.
  Assume its data exist, and suppress the index when this causes no ambiguity.
  At each index choose a finite normal number field $F_n$ containing all coordinates, ratios and $i$.
  By 13, this choice does not affect the height. In the application from 33,
  take the field $cal(N)$ already used there: every ratio is a quotient of coordinate differences.

=== 8.1 Negligible height as a field of constants <negligible-height-as-a-field-of-constants>

Fix a nonprincipal ultrafilter $frak(u)$ on $bb(N)$: a collection of subsets closed under finite intersection and
  supersets, containing the cofinite sets and exactly one part of every finite partition.
  Such a collection is obtained by extending the cofinite filter to a maximal proper filter.
  Call a set of indices #emph[large] if it belongs to $frak(u)$.
  Two sequences are identified when they agree on a large set. Write

$ F = product_(n arrow.r frak(u)) F_n \, wide cal(U) = product_(n arrow.r frak(u)) bb(C) \, $

where $F_n$ is the number field just chosen. These are characteristic-zero fields, with $F subset cal(U)$:
  the inverse of a nonzero class is defined coordinatewise on its large set of nonzero entries.
  The field $cal(U)$ is algebraically closed. Indeed, a polynomial of fixed positive degree has that degree on a
  large set, and choosing one complex root at each such index supplies a root in $cal(U)$.
  Complex conjugation also acts coordinatewise on $cal(U)$.

We use limits only along $frak(u)$. Thus $a_n = o \( J_n \)$ means that ${ n : \| a_n \| < epsilon
  J_n }$ is large for every $epsilon > 0$. A graph count is called #emph[full] if it is at least
  $t_n^(2 - o \( 1 \))$ in this sense. Define

$ k_0 = { \[ u_n \] in F : h \( u_n \) = o \( J_n \) #scale(x: 120%, y: 120%)[}] . $

#thm([Lemma 8.2.])[
  #emph[The set $k_0$ is a subfield of $F$, and every element of $F$ algebraic over $k_0$ belongs to $k_0$.]
] <alg:small-height-field>

#proof[
  The height inequalities
  $ h \( u v \) lt.eq h \( u \) + h \( v \) \, wide h \( u + v \) lt.eq h \( u \) + h \( v \) + log 2 \, wide
    h \( u^(- 1) \) = h \( u \) quad \( u eq.not 0 \) $
  prove the field assertion, since $J_n arrow.r oo$. These statements do not depend on representatives,
    and $h \( 0 \) = 0$.
  Suppose that $u in F$ satisfies $u^m + a_(m - 1) u^(m - 1) + dots.h.c + a_0 =
    0$ with $a_r in k_0$ and fixed $m gt.eq 1$. At each finite index where the equation holds,
    the nonarchimedean triangle inequality gives $\| u \|_v lt.eq max \( 1 \, max_r \| a_r \|_v \)$.
    At infinity the same estimate holds with the additional factor $m$:
    if $\| u \|_v > 1$, divide the equation by $\| u \|_v^(m - 1)$.
    Since the total weight of the infinite places is one,
  $ h \( u \) lt.eq sum_(r = 0)^(m - 1) h \( a_r \) + log m . $
  This estimate holds on a large set of indices. Its right side is $o \( J_n \)$, proving the claim. ◻
]

In particular, any edge ratio selected from the graphs is transcendental over $k_0$, by (8.1).
  The rectangle defects in (8.1), in contrast, belong to $k_0^times$.
  We next select finitely many edges whose positions retain enough algebraic independence to exploit this distinction.

=== 8.2 A complete grid with generic positions <a-complete-grid-with-generic-positions>

We first restrict the graph to plane or bounded-degree curve loci of minimum total dimension among those retaining
  a full edge count. This restriction will give uniform bounds for the vertices satisfying additional polynomial
  equations, allowing us to choose a complete grid whose limiting positions have no relations,
  beyond the locus equations, over the field generated by their coefficients.

We use two standard algebraic facts. First, for every field $K$,
  $K \[ Z \, W \]$ is a unique factorization domain #cite(label("stacksUFD")) Lemma 10.120.10.
  A polynomial in $W$ with coefficients in $K \[ Z \]$ is primitive if its coefficients have no common nonconstant
  factor. Gauss’s lemma then identifies factorization of primitive polynomials in $K \[ Z \] \[ W \]$ with
  factorization over $K \( Z \)$: clear denominators and cancel common prime factors of the coefficients.
  In particular, an irreducible polynomial in $K \[ Z \, W \]$ of positive $W$-degree remains irreducible in
  $K \( Z \) \[ W \]$. Two primitive polynomials that are scalar multiples over $K \( Z \)$ differ by an element
  of $K^times$.

Second, two distinct irreducible plane curves of degrees at most $D$, over an algebraically closed field,
  have at most $D^2$ common points. Indeed their projective closures have the same degrees and no common
  component, so Bézout’s theorem bounds the sum of their intersection multiplicities by $D^2$
  #cite(label("fultonCurves")) Section 5.3. Every affine intersection contributes at least one.
  We will apply this both over $bb(C)$ at finite indices and over the algebraically closed field $cal(U)$.

By a locus at an index we mean either the whole $\( z \, w \)$-plane or the zero set of a nonconstant irreducible
  polynomial in $bb(C) \[ z \, w \]$ whose degree has a fixed bound along the sequence.
  Its dimension is two or one, respectively. Among pairs of such locus sequences retaining a full number of graph
  edges, choose one of minimal total dimension. A minimum exists since the pair of planes is available and the
  possible total dimensions are $2 \, 3 \, 4$. Finite partitions let us fix all degrees and normalize one nonzero
  coefficient of each curve equation on a large set. Denote the limiting loci in $cal(U)^2$ by $V_1 \, V_2$,
  their dimensions by $d_1 \, d_2$, and the field generated over $bb(Q)$ by their normalized equation coefficients
  and $i$ by $B_0$. There are finitely many such coefficients, so $B_0$ is countable.
  It is a subfield of $cal(U)$, and need not be a subfield of $F$.

Each limiting curve equation is irreducible over $cal(U)$.
  Otherwise a factorization into positive-degree factors would give, from finitely many coefficient sequences,
  a factorization at a large set of indices. The degrees of its factors are bounded by the degree of the equation,
  so there is no unbounded factorization to consider.

Each finite curve contains $t_n^(1 - o \( 1 \))$ retained real points:
  divide the full edge count by the upper bound for the other vertex set.
  Its image under $\( z \, w \) mapsto \( overline(w) \, overline(z) \)$ shares all these points.
  The bounded intersection fact forces the two curves to be equal on a large set.
  The limiting curve has the same symmetry. Neither coordinate projection is constant,
  since a curve with constant $z$ would be a line $z = c$, whose symmetric image $w =
  overline(c)$ is a different line. Thus every curve equation has positive degree in both variables.

The loci cannot both be the same unit circle. To check the exact meaning of this assertion,
  suppose their limiting equations, after normalization, were

#[#set math.equation(numbering: n => "(8.2)")
 $ \( z - u \) \( w - v \) = 1 . $ <alg:unit-circle>]

Equality of its finitely many coefficients holds at a large set of finite indices.
  The symmetry gives $v = overline(u)$, again an exact coordinatewise identity on a large set.
  Hence the finite loci there are the same real unit circle.
  Both vertex sets on it have size $t_n^(1 - o \( 1 \)) > t_n^(9 \/ 10)$,
  contradicting the deletion hypothesis in 34. This reasoning concerns equality in the ultraproduct;
  ordinary convergence of a radius to one would not imply (8.2).

Restrict the graph to these loci and prune it to minimum degree $t_n^(1 - o \( 1 \))$ on both sides.
  Explicitly, if its initial edge and total vertex counts are $e_n \, v_n$,
  repeatedly remove vertices of degree less than $e_n \/ \( 2 v_n \)$. Fewer than $e_n \/ 2$ edges are removed.
  The remaining graph still has a full count, both vertex sets have size $t_n^(1 + o \( 1 \))$,
  and the asserted minimum degree holds.

#thm([Lemma 8.3.])[
  (Uniform avoidance and a generic grid).  #emph[For every fixed $N \, j gt.eq 1$,
    one can choose a complete $N$-by-$j$ grid in the pruned graphs on a large set of indices so that its limiting
    vertices $p_1 \, dots.h \, p_N in V_1$ and $r_1 \, dots.h \, r_j in V_2$ have the following property.
    Select both coordinates of each vertex on a plane locus and its $z$-coordinate on a curve locus.
    All the resulting $N d_1 + j d_2$ coordinates are algebraically independent over $B_0$.
    The other coordinates on a curve are algebraic over these coordinates and $B_0$. In particular,
#[#set math.equation(numbering: n => "(8.3)")
 $ "trdeg"_(B_0 \( r_1 \, dots.h \, r_j \)) B_0 \( r_1 \, dots.h \, r_j \, p_1 \, dots.h \, p_N \) =
   N d_1 . $ <alg:joint-degree>]

 The selected coordinates and edge ratios belong to $F$.]
] <alg:generic-grid>

#proof[
  First, on a side whose locus is the plane, for each fixed degree bound $D$ there is a $b_D >
    0$ such that every nonzero polynomial of degree at most $D$, even with coefficients depending on $n$,
    vanishes at at most $t_n^(1 - b_D)$ pruned vertices on a large set of indices.
    If this failed, choose at each index a polynomial maximizing its number of zeros among the finite vertex set.
    A maximum is attained because there are only finitely many subsets of that set.
    Failure of every fixed saving means that its zero count is $t_n^(1 - o \( 1 \))$ along $frak(u)$.
    One of at most $D$ irreducible factors then contains $t_n^(1 - o \( 1 \))$ vertices.
    Their minimum degree supplies $t_n^(2 - o \( 1 \))$ edges after restricting this side to a bounded-degree
    curve, contradicting minimality. This proves the uniform assertion.
    On a curve side, a nonzero polynomial of degree $D$ in the selected $z$-coordinate has at most $D$ zeros among
    the vertices, since real points have distinct $z = x + i y$.
  Let the two pruned set sizes be $m \, n'$ and their edge density be $delta$.
    Independent uniform vertices $p_1 \, dots.h \, p_N$ have a common-neighbor fraction $X$ on the other side.
    Averaging degrees there and applying Jensen gives $bb(E) X gt.eq delta^N$.
    Therefore the number of ordered complete grids, initially allowing repetitions, is
  #[#set math.equation(numbering: n => "(8.4)")
   $ m^N \( n' \)^j bb(E) X^j gt.eq m^N \( n' \)^j delta^(N j) = t_n^(N + j - o \( 1 \)) . $ <alg:grid-count>]
  Consider a fixed nonzero polynomial in the selected coordinates with coefficients in $B_0$.
    Choose representatives of its coefficients. Its vanishing among all ordered vertex tuples,
    before requiring edges, has a power saving:
  #[#set math.equation(numbering: n => "(8.5)")
   $ \# { upright("tuples at which the test vanishes") } lt.eq t_n^(N + j - b) $ <alg:test-count>]
  on a large set, for some $b > 0$ depending on the test. Here is an induction that also handles moving
    coefficients. View the polynomial as a polynomial in the last point block,
    and select one nonzero coefficient polynomial in the earlier blocks.
    The earlier tuples annihilating this coefficient have a power saving by induction.
    At every other earlier tuple, the remaining polynomial is nonzero, with a fixed degree bound.
    The uniform plane estimate, or the bounded root count for a curve block, bounds its zeros.
    Multiply by the upper bounds $t_n^(1 + o \( 1 \))$ for the other block sizes and slightly decrease the saving.
    The starting case is exactly the one-block estimates. The finitely many coefficient identities and nonzero
    denominators involved hold on a large set.
  There are countably many nonzero polynomial tests over $B_0$. Enumerate them as $T_1 \, T_2 \, dots.h$.
    For each fixed $s$, (8.4) and (8.5), with a finite union bound,
    show that on a large set some grid avoids all the first $s$ tests.
    At index $n$, choose the largest feasible prefix length $s_n lt.eq n$, and choose a grid avoiding that prefix.
    Include the validity of all representatives and denominators of a prefix in its feasibility requirement.
    If no prefix is feasible, use arbitrary number-field coordinates at that index.
    For every fixed $s$, the set where $n gt.eq s$ and the first $s$ tests are feasible is large; hence $s_n gt.eq
    s$ on a large set. Each fixed polynomial test is therefore nonzero in the limiting grid.
    Only finite intersections of large sets were used.
  For a curve equation $f \( z \, w \) = 0$, its positive $w$-degree and the transcendence of $z$ show that $w$ is
    algebraic over $B_0 \( z \)$. This proves all the transcendence assertions.
    The vertices and the assigned ratios at each chosen finite grid lie in $F_n$, so their classes lie in $F$. ◻
]

For a plane locus $V$ over a field $cal(B)$, define its function field to be $cal(B) \( V \) =
  cal(B) \( z \, w \)$. For a curve with irreducible equation $f$,
  define it to be the fraction field of $cal(B) \[ z \, w \] \/ \( f \)$.
  A point on $V$ is called generic over $cal(B)$ if its coordinates have transcendence degree $dim V$ over that field.

We record explicitly how generic coordinates identify a function field.
  If $B_0 subset cal(B) subset cal(U)$ and a point on a locus $V$ has transcendence degree $dim V$ over $cal(B)$,
  then evaluation at that point embeds $cal(B) \( V \)$ into $cal(U)$.
  For the plane this is algebraic independence. For a curve, its equation $f$ is irreducible even over $cal(U)$,
  hence over $cal(B)$. Its coefficients when viewed as a polynomial in $w$ have no common factor of positive
  degree in $z$. They cannot all vanish at an abscissa in $cal(U)$:
  a common root would give a linear common factor over $cal(U)$, contradicting irreducibility.
  If $z$ were algebraic over $cal(B)$, the nonzero specialized equation would make $w$ algebraic as well.
  Thus $z$ is transcendental. Gauss’s lemma makes $f$ irreducible over $cal(B) \( z \)$,
  so every polynomial relation at the point is a multiple of $f$.
  Every nonzero denominator in the function field consequently evaluates to a nonzero element.
  The same argument applies to a point after adjoining the other grid points to $cal(B)$, using 36.

=== 8.3 Differentiation and the surviving generic point <differentiation-and-the-surviving-generic-point>

Take $N = 20$ and $j = 5$ in 36, and write $lambda_(i ell)$ for the edge ratios. Define

$ g_i = lambda_(i 1) \, wide h_ell = lambda_11 / lambda_(1 ell) \, wide chi_(i ell) =
  frac(lambda_(i ell) lambda_11, lambda_(i 1) lambda_(1 ell)) . $

The rectangle condition gives $chi_(i ell) in k_0^times$, and

#[#set math.equation(numbering: n => "(8.6)")
 $ lambda_(i ell) = g_i h_ell^(- 1) chi_(i ell) . $ <alg:factorization>]

Repeated rows or columns would violate the algebraic independence just proved; all vertices on either side are distinct.

#thm([Lemma 8.4.])[
  #emph[There is a $k_0$-derivation $partial : F arrow.r F$ such that $partial lambda_(i ell) eq.not
    0$ for every grid edge.]
] <alg:derivation>

#proof[
  A derivation is an additive map satisfying the product rule;
    being a $k_0$-derivation means that it vanishes on $k_0$.
    Each $lambda_(i ell)$ is transcendental over $k_0$ by 35.
    Put it in a transcendence basis of $F \/ k_0$, prescribe its derivative to be one and those of the other basis
    elements to be zero, and extend by the quotient rule to the rational function field.
    Since the characteristic is zero, this derivation extends uniquely over the algebraic extension to $F$
    #cite(label("conradSeparability")) Theorems 1.5 and 4.1. For an infinite algebraic extension,
    take the compatible extensions to its finite subextensions;
    uniqueness makes them agree on overlaps #cite(label("conradSeparability")) Section 5.
  We have thus obtained a witness derivation nonzero on each chosen ratio.
    The derivations form an $F$-vector space. A linear combination of the finitely many witnesses is nonzero on
    all ratios provided its coefficients avoid the zeros of a product of finitely many nonzero linear forms.
    This product is a nonzero polynomial over the infinite field $F$, so such coefficients exist. ◻
]

Put

$ A_i = frac(partial g_i, g_i) \, wide A'_ell = frac(partial h_ell, h_ell) \, wide
  H_i = \( partial x_(p_i) \, partial y_(p_i) \) \, wide U_ell = \( partial x_(r_ell) \, partial y_(r_ell) \) . $

The derivation kills $i$, which is algebraic over $bb(Q) subset k_0$. Define

$ L_ell \( z \, w \) = \( z - z_(r_ell) \) \( w - w_(r_ell) \) \, wide R_(i ell) = lambda_(i ell)^(- 1) -
  lambda_(i ell) . $

Differentiating (8.1) and (8.6) gives

#[#set math.equation(numbering: n => "(8.7)")
 $ 2 \( p_i - r_ell \) dot.op \( H_i - U_ell \) & = R_(i ell) \( A_i - A'_ell \) \,\
R_(i ell)^(thin 2) & = L_ell \( p_i \) #scale(x: 120%, y: 120%)[\(] L_ell \( p_i \) - 4 #scale(x: 120%, y: 120%)[\)] \,\
A_i - A'_ell & eq.not 0 . $ <alg:differential>]

Here the dot denotes the bilinear expression $x u + y v$ in the ordinary two coordinates, with no conjugation.
  The second identity follows by squaring $lambda^(- 1) - lambda$, and the third by 37.

We now form a coefficient field containing the right-hand positions and their derivative data.
  Let $K_0$ be the subfield of $cal(U)$ consisting of all elements algebraic over

$ B_0 \( r_1 \, dots.h \, r_j \, U_1 \, dots.h \, U_j \, A'_1 \, dots.h \, A'_j \) . $

This field is algebraically closed: roots in $cal(U)$ of polynomials over it are still algebraic over the
  displayed field. We do not adjoin $k_0$ to $K_0$.

#thm([Lemma 8.5.])[
  #emph[Some $p = p_i$ has transcendence degree $d_1$ over $K_0$,
    and evaluation identifies the function field $K_0 \( V_1 \)$ with $K_0 \( p \)$.]
] <alg:surviving-point>

#proof[
  Over $B_0 \( r_1 \, dots.h \, r_j \)$, all the left positions jointly have transcendence degree $N d_1$,
    by (8.3). The right velocities and scalars consist of at most $3 j$ elements.
    Adjoining them and then taking algebraic closure can reduce that transcendence degree by at most $3 j$. Therefore
  #[#set math.equation(numbering: n => "(8.8)")
   $ "trdeg"_(K_0) K_0 \( p_1 \, dots.h \, p_N \) gt.eq N d_1 - 3 j . $ <alg:dimension-accounting>]
  If no individual point had degree $d_1$, subadditivity would bound the left side by $N \( d_1 - 1 \)$.
    This contradicts $N > 3 j$. The function-field assertion is the evaluation argument following 36,
    with $cal(B) = K_0$. ◻
]

The velocity data may depend arbitrarily on the left positions. The degree count above allows those correlations.
  No derivative of a locus equation has been used, and none of its coefficients is being asserted constant for the
  original derivation.

We have reduced the proof to one generic point $p$. Write $M = K_0 \( V_1 \) = K_0 \( p \)$, $R_ell = R_(i ell)$, and

$ D_ell = L_ell \( L_ell - 4 \) in M . $

The next step proves directly over this enlarged field that these radicands are independent modulo squares.

=== 8.4 A separate odd valuation for each radicand <a-separate-odd-valuation-for-each-radicand>

An integer-valued valuation of $M$ is a map $v : M^times arrow.r bb(Z)$ with $v \( a b \) = v \( a \) +
  v \( b \)$ and $v \( a + b \) gt.eq min { v \( a \) \, v \( b \) }$, where $v \( 0 \) = + oo$.
  Our valuations will count the order of a zero at a chosen point or along an irreducible polynomial.
  The aim is to give each radicand one simple zero that none of the others shares.

#thm([Lemma 8.6.])[
  #emph[For every $ell in { 1 \, dots.h \, j }$ there is an integer-valued valuation $v_ell$ of $M$ such that
$ v_ell \( D_ell \) = 1 \, wide v_ell \( D_m \) = 0 quad \( m eq.not ell \) . $

 Consequently the classes of $D_1 \, dots.h \, D_j$ are independent in $M^times \/ \( M^times \)^2$.]
] <alg:private-valuations>

#proof[
  An odd valuation detects a nonsquare because the valuation of a square is even.
    We construct the stated valuations over $K_0$ in each possible locus case.
    All noncoincidences used in the constructions will first be proved from the original joint genericity over $B_0$.
  #emph[The left locus is the plane.] The polynomial
  $ Q_ell = \( z - z_(r_ell) \) \( w - w_(r_ell) \) - 4 $
  is irreducible in $K_0 \[ z \, w \]$. It is primitive as a polynomial in $w$,
    because its leading coefficient $z - z_(r_ell)$ is coprime to its constant coefficient,
    and is linear over $K_0 \( z \)$. The polynomials $Q_ell$ are distinct,
    as comparison of the coefficients of $z$ and $w$ recovers their centers.
    None divides any $L_m = \( z - z_(r_m) \) \( w - w_(r_m) \)$.
    The exponent of $Q_ell$ in a rational function is therefore the required valuation.
  #emph[The left locus is a curve, and either the loci differ or its $z$-projection has degree at least two.] Let
    $f \( z \, w \)$ be its irreducible equation and set $a = z_(r_ell)$.
    The coordinate $a$ is transcendental over $B_0$. Consequently the leading coefficient of $f$ in $w$ does not
    vanish at $a$, and $f \( a \, w \)$ has simple roots: the coprimality of $f \, f_w$ over $B_0 \( z \)$,
    after clearing denominators, excludes multiple roots at this transcendental abscissa.
  If $V_2 eq.not V_1$, the anchor $r_ell$ is not on $V_1$. Indeed it is generic on $V_2$,
    which is either the plane or a different irreducible curve. Choose any root $b$ of $f \( a \, w \)$.
    Then $b eq.not w_(r_ell)$. If $V_2 = V_1$ and the projection degree is at least two,
    choose a root other than $w_(r_ell)$, again obtaining $b eq.not w_(r_ell)$. In both cases
  $ s_ell = \( a \, b \) in V_1 \, wide f_w \( a \, b \) eq.not 0 \, wide b eq.not w_(r_ell) . $
  The ordinate $b$ is algebraic over $B_0 \( a \)$. Since $K_0$ contains $a$ and is algebraically closed, $b in K_0$.
  For $m eq.not ell$, original joint genericity implies that $r_m$ remains generic on $V_2$ over
    $B_0 \( s_ell \)$. Adjoining the sheet ordinate is an algebraic extension of adjoining $a$,
    so it does not reduce the transcendence degree of this independent anchor.
    Neither coordinate of $r_m$ equals the corresponding coordinate of $s_ell$:
    both projections of a curve are nonconstant, and the assertion for a plane is immediate.
    Thus $L_m \( s_ell \) eq.not 0$. Also $L_m \( s_ell \) eq.not 4$.
    Otherwise generic evaluation would force $V_2$ to lie in
  $ \( z - a \) \( w - b \) = 4 . $
  The plane cannot do so. If $V_2$ is a curve, this irreducible circle equation must be proportional to its
    defining equation. Normalize the coefficient of $z w$ to one.
    The coefficient of $w$ then recovers $- a$ from coefficients in $B_0$,
    contradicting the transcendence of $a$ over $B_0$. These are nonvanishing statements in $cal(U)$;
    placing more of their entries in $K_0$ cannot change them.
  To obtain the valuation over $K_0$, introduce an indeterminate $T$ and solve
  $ f \( a + T \, b + c_1 T + c_2 T^2 + dots.h.c \) = 0 $
  recursively in $K_0 \[ \[ T \] \]$. At each step the coefficient of the new unknown is $f_w \( a \, b \) eq.not
    0$, so the solution exists uniquely. This gives an embedding $K_0 \( V_1 \) arrow.r.hook K_0 \( \( T \) \)$.
    Indeed $z$ maps to the transcendental element $a + T$, and irreducibility of $f$ over $K_0 \( z \)$ shows that
    its only polynomial kernel is $\( f \)$. Now
  $ L_ell = T #scale(x: 120%, y: 120%)[\(] b - w_(r_ell) + O \( T \) #scale(x: 120%, y: 120%)[\)] $
  has order one, while $L_ell - 4$ and all $L_m \( L_m - 4 \)$, $m eq.not ell$, have nonzero constant terms.
    The order in $T$ is the required valuation.
  #emph[Both loci are the same curve with projection degree one.] The symmetry of this curve shows that the other
    projection has degree one as well. Its irreducible equation therefore has degree one in each variable.
    Solving for $w$ gives either
  #[#set math.equation(numbering: n => "(8.9)")
   $ w = e z + e' \, wide e eq.not 0 \, $ <alg:line-form>]
  or
  #[#set math.equation(numbering: n => "(8.10)")
   $ \( z - u \) \( w - v \) = b \, wide b eq.not 0 . $ <alg:fractional-form>]
  The constants here belong to $B_0$. To see the classification directly, write the equation as $a z w + c z +
    d w + e_0 = 0$. If $a = 0$, both linear coefficients are nonzero.
    If $a eq.not 0$, complete the product; its constant is nonzero by irreducibility.
    In (8.10), $b eq.not 1$, by the exact unit-circle exclusion (8.2).
  In the line case, writing $a_ell = z_(r_ell)$,
  $ L_ell = e \( z - a_ell \)^2 . $
  Thus $L_ell - 4$ has two distinct simple zeros. Choose one, say $z = a_ell + c$ with $c^2 = 4 \/ e$,
    and let $s_ell$ be the corresponding point on the line. Its coordinates are algebraic over $B_0 \( a_ell \)$.
    For an independent anchor $r_m$, the conditions $L_m \( s_ell \) =
    0$ or $4$ would make $a_m$ one of finitely many elements algebraic over this field.
    This contradicts the joint genericity. Since $L_ell = 4$ at the chosen zero,
    order at that abscissa in the rational function field $K_0 \( z \)$ gives the required valuation.
  In the fractional-linear case, put $zeta = \( z - u \) \/ \( a_ell - u \)$, where $a_ell - u eq.not 0$.
    Direct substitution gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ L_ell = - b frac(\( zeta - 1 \)^2, zeta) . $ <alg:fractional-distance>]
  The equation $L_ell - 4 = 0$ is equivalent to
  $ b zeta^2 + \( 4 - 2 b \) zeta + b = 0 . $
  Its discriminant is $16 \( 1 - b \) eq.not 0$, and its two roots are nonzero because $b eq.not 0$.
    Hence they give simple zeros of $L_ell - 4$ at finite points with $z eq.not u$.
    The corresponding point $s_ell$ is algebraic over $B_0 \( a_ell \)$.
    As a function of the other anchor abscissa $a_m$, its squared distance to that anchor is
  $ - b frac(\( z_(s_ell) - a_m \)^2, \( z_(s_ell) - u \) \( a_m - u \)) . $
  This is a nonconstant rational function: its numerator has degree two and its denominator degree one,
    and $z_(s_ell) eq.not u$. Its values cannot be zero or four at the transcendental $a_m$ over
    $B_0 \( s_ell \)$. Thus the simple zero is shared by no other radicand,
    and order at its abscissa again gives the valuation over $K_0 \( z \)$.
  These cases exhaust the possibilities. In each, a nonempty product $product_(ell in I)
    D_ell$ has valuation one at any $v_ell$ with $ell in I$, and therefore is not a square. ◻
]

The excluded value $b = 1$ illustrates why the deletion of popular unit circles was necessary. In that case

$ L_ell \( L_ell - 4 \) = (frac(zeta^2 - 1, zeta))^2 . $

Thus the private odd valuations would fail on a common unit circle.
  For all the retained cases they were constructed after passing to $K_0$;
  no preservation of nonsquares under enlargement of the coefficient field has been assumed.

=== 8.5 An unused sign change <an-unused-sign-change>

We use the quadratic case of Kummer theory over the characteristic-zero field $M$.
  If $D_1 \, dots.h \, D_j in M^times$ have independent classes modulo squares and $R_ell^2 = D_ell$, then

$ \[ M \( R_1 \, dots.h \, R_j \) : M \] = 2^j \, $

and every choice of signs of the $R_ell$ is induced by an automorphism fixing $M$ #cite(label("milneFields"))
  Theorem 5.30 and Remark 5.32. The hypotheses hold because $M$ contains both square roots of unity and has
  characteristic different from two. Independence of the square classes is required in this same field $M$,
  as proved in 39.

Apply this fact with the radicands of 39, and let $cal(M) = M \( R_1 \, dots.h \, R_j \) subset cal(U)$,
  using the actual roots from (8.7). Write $H = H_i$, $A = A_i$ for the surviving point. We have the equations

#[#set math.equation(numbering: n => "(8.12)")
 $ 2 \( p - r_ell \) dot.op H - R_ell A = 2 \( p - r_ell \) dot.op U_ell - R_ell A'_ell \, wide 1 lt.eq ell lt.eq
   j . $ <alg:linear-system>]

Their right-hand positions, velocities and scalars belong to $K_0$.

First suppose the three rows $p - r_1 \, p - r_2 \, p - r_3$ have rank two.
  The determinant of the first three equations in the unknowns $H_x \, H_y \,
  A$ is a linear combination of $R_1 \, R_2 \, R_3$ over $M$.
  At least one coefficient is nonzero, because these coefficients, up to nonzero numerical factors and signs,
  are the two-by-two minors of the three position rows. Independent sign changes show that distinct single
  radicals are linearly independent over $M$. Thus the determinant is nonzero.
  Cramer’s rule places the existing solution $H_x \, H_y \, A$ in $M \( R_1 \, R_2 \, R_3 \)$.
  The automorphism of $cal(M)$ that changes only the sign of $R_4$ fixes these unknowns.
  Apply it to the fourth equation in (8.12) and subtract. Since $R_4 eq.not 0$, it follows that $A = A'_4$,
  contradicting (8.7).

We verify when the rank condition can fail. If $V_2$ is a plane or a curve other than a line,
  the three independent generic anchors are noncollinear. Indeed the first two are distinct,
  and a generic third point can lie on their line only if its locus is contained in that line,
  by generic evaluation. Three noncollinear anchors make the three position rows have rank two for every $p$.
  If $V_2$ is a line, its first two anchors are distinct. The rows have rank two unless $p$ belongs to that line.
  Since $p$ is generic on $V_1$ over $K_0$, this last possibility requires $V_1 = V_2$ to be the same line.

In that remaining case choose a nonzero direction vector $v in K_0^2$ for the line, and write $p - r_ell =
  s_ell v$, with $s_ell in M^times$. Nonzero row factors follow from distinctness of the points.
  Only the scalar $h = v dot.op H$ enters (8.12). The first two equations in $h \, A$ have determinant

$ 2 \( s_2 R_1 - s_1 R_2 \) eq.not 0 \, $

again by independence of the single radicals. Thus $h \, A in M \( R_1 \, R_2 \)$.
  Changing only the sign of $R_3$ in the third equation gives $A = A'_3$, the same contradiction.
  The line has nonconstant projections, as established above;
  in the form (8.9) its direction has nonzero squared length proportional to $e eq.not 0$.

This proves 34. All sign changes were applied inside the finite radical field $cal(M)$,
  after Cramer’s rule located the unknowns there. No automorphism of the whole field $F$,
  or compatibility of an automorphism with $partial$, is required.

#proof[
  If no absolute power saving existed, the sequence reduction in 2 would give configurations with
    $t^(4 - o \( 1 \))$ ordered unit pairs. Specialization and restriction would give the incidence pieces used
    throughout the proof. Their height scales $S$ have a bounded subsequence or a subsequence tending to infinity.
    The bounded alternative is excluded by 15. In the unbounded alternative, 33 supplies the graphs, scales $J$,
    edge ratios, uniform height bounds and popular-circle deletion required by 34.
    That proposition excludes the other alternative. Hence some fixed exponent below $4 \/
    3$ admits a uniform bound. Increasing the exponent to at least one preserves this bound and keeps it below
    $4 \/ 3$. Enlarging the positive constant covers the finitely many remaining sizes $n gt.eq 2$,
    and passing from ordered to unordered pairs only changes the constant. The cases $n = 0 \, 1$ are immediate.
    This proves the theorem. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
