#set page(paper: "us-letter", margin: (x: 75.2pt, y: 75.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A uniform influence bound for hypergraph properties]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $r gt.eq 3$ and $n gt.eq r$ be integers, write $\[ n \] = { 1 \, dots.h \, n }$, and put $E_(n \, r) =
  binom(\[ n \], r)$. An element of ${ 0 \, 1 }^(E_(n \, r))$ represents a simple $r$-uniform hypergraph.
  A #emph[hypergraph property] is a Boolean function on this space that is invariant under every permutation of
  $\[ n \]$. For $0 < p < 1$, give the coordinates the independent Bernoulli$\( p \)$ law,
  and denote expectation and variance by $bb(E)_p$ and $"Var"_p$.

For an edge $e$, let $x_(e arrow.l b)$ be $x$ with its $e$-coordinate set to $b$.
  Define the #emph[pivotal influence] of $e$ and the #emph[total influence] of $f$ by

$ I_(e \, p) \( f \) = Pr_p #scale(x: 120%, y: 120%)[\(] f \( x_(e arrow.l 1) \) eq.not f \( x_(e arrow.l 0) \)
  #scale(x: 120%, y: 120%)[\)] \, wide I_p \( f \) = sum_(e in E_(n \, r)) I_(e \, p) \( f \) . $

The probability in the first expression is over the other coordinates;
  it does not include an additional factor of $p \( 1 - p \)$.
  All logarithms are natural, and $n$ always counts vertices.

#thm([Theorem 1.1.])[
  #emph[For every integer $r gt.eq 3$ there is a finite constant $C_r$ such that, for every integer $n gt.eq r$,
    every $0 < p < 1$, and every hypergraph property $f : { 0 \, 1 }^(E_(n \, r)) arrow.r { 0 \, 1 }$,
#[#set math.equation(numbering: n => "(1.1)")
 $ "Var"_p \( f \) lt.eq frac(C_r, \( log n \)^(r \/ \( r - 1 \))) I_p \( f \) . $ <eq:main>]

 No monotonicity assumption is required.]
] <thm:main>

The theorem measures how vertex symmetry forces sensitivity to edge changes.
  If the probability of a property stays bounded away from zero and one,
  its total influence must grow at least as $\( log n \)^(r \/ \( r - 1 \))$.

A property is #emph[increasing] if changing coordinates from $0$ to $1$ cannot decrease its value,
  and #emph[nontrivial] if it is not constant. For a nontrivial increasing property, put $q \( p \) =
  bb(E)_p f$ and define $p_a = inf { p in \[ 0 \, 1 \] : q \( p \) gt.eq a }$ for $0 < a < 1$.
  For fixed $0 < epsilon < 1 \/ 2$, its #emph[threshold width] is $p_(1 - epsilon) - p_epsilon$.
  Friedgut and Kalai conjectured that this width is at most
  $O_(r \, epsilon) \( \( log n \)^(- r \/ \( r - 1 \)) \)$ for every increasing $r$-uniform hypergraph
  property [5] Section 5, p. 2999. Their formulation counts edge coordinates rather than vertices; for fixed $r$,
  $log binom(n, r) tilde.op r log n$ as $n arrow.r oo$. Corollary 5 proves this conjectured bound by
  integrating (1.1), with an explicit dependence on $epsilon$.

===== 1.1 Context and attribution. <context-and-attribution.>

Kahn, Kalai, and Linial [6] established a fundamental link between Fourier analysis and the influences of Boolean
  functions. For a function invariant under a transitive group on $M$ coordinates,
  their theorem gives a total-influence lower bound of order $"Var"_(1 \/ 2) \( f \) log
  M$ at the uniform measure. Bourgain, Kahn, Kalai, Katznelson,
  and Linial [3] extended the influence method to product spaces.
  Friedgut and Kalai [5] used influence inequalities to prove sharp thresholds for increasing families with
  transitive symmetry. For hypergraph properties, the induced action on the $binom(n, r)$ edge coordinates is
  transitive. The richer structure of vertex permutations, however,
  contains more information than this single transitivity statement.

Bourgain and Kalai [4] Corollary 4.1 studied how group actions on sets of coordinates improve influence estimates.
  For fixed $r$ and every $eta > 0$, their result gives a lower bound of order
  $"Var"_(1 \/ 2) \( f \) \( log n \)^(r \/ \( r - 1 \) - eta)$ for the total influence of a hypergraph property
  at the uniform measure. Their influence results already allow nonmonotone functions.
  Kelman, Kindler, Lifshitz, Minzer, and Safra obtained further estimates for group-invariant functions [7].
  For graph properties, these give $I_(1 \/ 2) \( f \) gt.eq
  c "Var"_(1 \/ 2) \( f \) \( log n \)^2 \/ \( log log n \)^2$ for sufficiently large $n$;
  see the arXiv version cited in [7] Section 7.4. The present proof uses vertex symmetry through restrictions:
  all edges touching a vertex block remain free, and only edges wholly outside the block are fixed.
  This is the method of the companion manuscript #emph[A Sharp Threshold Bound for Monotone Graph Properties] [9]
  Theorem 1.2 and Sections 2–3, which establishes the corresponding variance bound with denominator
  $\( log n \)^2$ for graph properties, uniformly in $p$ and without monotonicity.
  We reproduce its Fourier estimate and restriction argument in full.
  The additional combinatorial step replaces the graph degree estimate by its $r$-uniform counterpart,
  producing the exponent $r \/ \( r - 1 \)$.

===== 1.2 Proof strategy. <proof-strategy.>

Put $sigma = sqrt(p \( 1 - p \))$ and $alpha = r \/ \( r - 1 \)$.
  The Fourier expansion for the Bernoulli product measure is indexed by sets $S$ of hyperedges.
  Its squared nonconstant coefficients sum to the variance;
  weighting them by $\| S \|$ gives $sigma^2 I_p \( f \)$. Thus the influence controls high degrees.
  The task is to bound the remaining mass using symmetry.

For large $n$, choose a uniformly random block $B$ of $m$ vertices, with $m$ about $sqrt(n)$,
  and leave free all edges meeting $B$. Every permutation within $B$ survives an assignment to the other
  coordinates, and every free-edge orbit has at least $m$ elements.
  Section 2 bounds the restricted Fourier mass up to a degree $k$ proportional to $sigma log
  m$ by $m^(- 1 \/ 4)$ times the restricted total influence.
  Its linear dependence on influence allows averaging over the assigned coordinates.

Regard a nonempty Fourier index $S$ as an $r$-uniform hypergraph with $s$ edges.
  It has a vertex of positive degree at most $r s^(\( r - 1 \) \/ r)$.
  For $s lt.eq L = \( k \/ r \)^alpha$, this degree is at most $k$.
  The event that $B$ meets the union of these edges only at that vertex has probability comparable to $m \/
  n$ and leaves between one and $k$ support edges free. After averaging over the assignments and $B$,
  the restricted total influence is at most $\( r m \/ n \) I_p \( f \)$, so the two factors of $m \/ n$ cancel.
  Section 3 thereby controls the original Fourier mass up to degree $L$.

Since $L$ is of order $\( sigma log n \)^alpha$, the remaining mass is at most $sigma^2 I_p \( f \) \/ L$,
  with coefficient of order $sigma^(2 - alpha) \( log n \)^(- alpha)$.
  The positive exponent $2 - alpha$ makes this bound uniform in $p$.
  Section 4 completes the estimate and derives the threshold consequence.

== 2 A Fourier estimate for small individual influences <sec:fourier>

We first work on an arbitrary finite coordinate set $J$. Our objective is to control low-degree Fourier mass when
  every individual influence is small relative to the total.
  We follow the elementary argument in [9] Lemma 2.1; its analytic ingredient is a two-to-four norm estimate of
  the type underlying the classical hypercontractive inequalities [2,1].
  The proof below includes the dependence on the bias.

Fix $0 < p < 1$ and put $sigma = sqrt(p \( 1 - p \))$. For $i in J$ and $A subset.eq J$, define

$ chi_i \( x \) = frac(x_i - p, sigma) \, wide chi_A \( x \) = product_(i in A) chi_i \( x \) \, wide
  chi_diameter = 1 . $

Independence, zero means, and unit second moments show that the $chi_A$ form an orthonormal basis.
  Write $hat(h) \( A \) = bb(E)_p \[ h chi_A \]$. Throughout this section,
  norms and expectations use this product law, and $I_i \( h \)$ and $I \( h \)$ denote pivotal and total
  influence on $J$.

For Boolean $h$, let $Delta_i h$ be the function on the other coordinates obtained by subtracting the section at
  $x_i = 0$ from the section at $x_i = 1$. Direct expectation in coordinate $i$ gives

$ hat(h) \( A union { i } \) = sigma accent(Delta_i h, ̂) \( A \) wide \( A subset.eq J \\ { i } \) . $

Because $Delta_i h in { - 1 \, 0 \, 1 }$, Parseval’s identity yields

#[#set math.equation(numbering: n => "(2.1)")
 $ sum_(S subset.eq J) \| S \| hat(h) \( S \)^2 = sigma^2 I \( h \) \, wide "Var"_p \( h \) =
   sum_(diameter eq.not S subset.eq J) hat(h) \( S \)^2 . $ <eq:parseval>]

In particular, this identity uses no sign condition on $Delta_i h$.

#thm([Lemma 2.1.])[
  (Low-degree mass).  #emph[Let $m gt.eq 2$ be real and let $h : { 0 \, 1 }^J arrow.r { 0 \,
    1 }$ satisfy $I_i \( h \) lt.eq I \( h \) \/ m$ for every $i in J$. With $k = sigma log m \/ 64$, one has
#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(1 lt.eq \| S \| lt.eq k) hat(h) \( S \)^2 lt.eq m^(- 1 \/ 4) I \( h \) . $ <eq:low>]

 The sum is empty when $k < 1$.]
] <lem:low>

#proof[
  We will use a two-to-four norm estimate to bound low-degree projections of the differences $Delta_i h$.
    Set $rho = sigma \/ 4$ and define the linear operator $T$ by $T chi_A = rho^(\| A \|) chi_A$. We first prove
  #[#set math.equation(numbering: n => "(2.3)")
   $ parallel T g parallel_4 lt.eq parallel g parallel_2 $ <eq:24>]
  for every real-valued function $g$ on the product space. For one coordinate, $\| chi_i \| lt.eq
    1 \/ sigma$ and $bb(E) chi_i^2 = 1$ imply $\| bb(E) chi_i^3 \| lt.eq 1 \/ sigma$ and $bb(E) chi_i^4 lt.eq
    1 \/ sigma^2$. For real $a \, b$, expansion and $2 \| a b^3 \| lt.eq a^2 b^2 + b^4$ give
  $ bb(E) \( a + rho b chi_i \)^4 & lt.eq a^4 + 6 rho^2 a^2 b^2 + frac(2 rho^3, sigma) \( a^2 b^2 + b^4 \) +
    rho^4 / sigma^2 b^4\
 & = a^4 + frac(13 sigma^2, 32) a^2 b^2 + frac(9 sigma^2, 256) b^4 lt.eq \( a^2 + b^2 \)^2 \, $
  where the last inequality uses $sigma lt.eq 1 \/ 2$.
  To extend this estimate to the product, induct on $\| J \|$,
    starting with the constant functions when $J$ is empty. Write $g = a + b chi_i$, where $a \,
    b$ depend on the remaining coordinates, and use $T$ for the operator on those coordinates as well.
    The one-coordinate estimate, applied pointwise, followed by the $L^2$ triangle inequality gives
  $ parallel T g parallel_4^2 lt.eq parallel \( T a \)^2 + \( T b \)^2 parallel_2 lt.eq
    parallel T a parallel_4^2 + parallel T b parallel_4^2 lt.eq parallel a parallel_2^2 +
    parallel b parallel_2^2 = parallel g parallel_2^2 . $
  This proves (2.3).
  Let $P_(lt.eq k)$ be the orthogonal projection onto the span of $chi_A$ with $\| A \| lt.eq k$.
    For every $u$ in this span,
  $ parallel u parallel_4 lt.eq parallel T^(- 1) u parallel_2 lt.eq rho^(- k) parallel u parallel_2 . $
  Taking the supremum of $\| bb(E) \[ g u \] \|$ over unit $L^2$ vectors in this span,
    and applying Hölder’s inequality, therefore gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ parallel P_(lt.eq k) g parallel_2 lt.eq rho^(- k) parallel g parallel_(4 \/ 3) . $ <eq:projection>]
  These inequalities are valid for real $k gt.eq 0$, with no rounding required.
  Each nonempty Fourier support is counted at least once when summed over its coordinates.
    Using the difference identity and enlarging the resulting degree cutoff from $k - 1$ to $k$, we obtain
  #[#set math.equation(numbering: n => "(2.5)")
   $ sum_(1 lt.eq \| S \| lt.eq k) hat(h) \( S \)^2 & lt.eq sigma^2 sum_(i in J) parallel P_(lt.eq k) Delta_i h
     parallel_2^2\
 & lt.eq sigma^2 rho^(- 2 k) sum_(i in J) I_i \( h \)^(3 \/ 2) . $ <eq:derivative-mass>]
  Here each projection acts on the coordinates other than $i$, and $parallel Delta_i h parallel_(4 \/ 3)^2 =
    I_i \( h \)^(3 \/ 2)$ because $\| Delta_i h \|$ is an indicator.
  The function $sigma log \( 4 \/ sigma \)$ is increasing on $\( 0 \, 1 \/ 2 \]$ and is at most $2$.
    Hence $rho^(- 2 k) lt.eq m^(1 \/ 16)$. If $I \( h \) lt.eq m^(1 \/ 4)$, then $I_i \( h \)^(1 \/ 2) lt.eq
    m^(- 3 \/ 8)$, so (2.5) is at most $sigma^2 m^(- 5 \/ 16) I \( h \) lt.eq m^(- 1 \/ 4) I \( h \)$.
    If $I \( h \) > m^(1 \/ 4)$, the right side of (2.2) exceeds $1$,
    whereas its left side is at most $"Var"_p \( h \) lt.eq 1 \/ 4$. ◻
]

== 3 Restriction to a vertex block <sec:restriction>

Return to a hypergraph property $f$ on $E = E_(n \, r)$ and fix the bias $p$, with $sigma = sqrt(p \( 1 - p \))$.
  Its Fourier coefficients use the basis of Section 2, with $J = E$.
  The restriction method of [9] Lemma 3.1 and Proposition 3.2 preserves a large permutation group after
  conditioning. We first obtain an averaged estimate for restricted Fourier degrees,
  and then relate those degrees to the sizes of the original supports.

For a vertex set $B subset.eq \[ n \]$, write

$ F_B = { e in E : e ∩ B eq.not diameter } $

for the edge coordinates that remain free.

#thm([Lemma 3.1.])[
  (Averaged restriction estimate).  #emph[Let $r + 1 lt.eq m lt.eq n$ be integers and set $k = sigma log m \/ 64$.
    For $B$ chosen uniformly among the $m$-subsets of $\[ n \]$,
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(S subset.eq E) Pr_B \( 1 lt.eq \| S ∩ F_B \| lt.eq k \) hat(f) \( S \)^2 lt.eq
   m^(- 1 \/ 4) frac(r m, n) I_p \( f \) . $ <eq:block>]

]
] <lem:block>

#proof[
  Fix $B$ and an assignment $y$ to the coordinates in $E \\ F_B$.
    Denote the resulting Boolean function on $F_B$ by $f_y$. Every permutation supported on $B$ fixes each edge
    outside $F_B$ individually, and consequently fixes $y$. Thus $f_y$ is invariant under all these permutations,
    regardless of the assignment.
  An edge with $j$ vertices in $B$ has an orbit of size $binom(m, j)$:
    its outside part is fixed and its inside part can be any $j$-subset of $B$.
    Since $1 lt.eq j lt.eq r < m$, this size is at least $m$.
    The free product measure is invariant under the same permutations, so influences are equal within each orbit.
    It follows that
  $ I_e \( f_y \) lt.eq I \( f_y \) \/ m wide \( e in F_B \) . $
  Lemma 2 therefore applies to every $f_y$.
  Average its conclusion over the product law of $y$. For $A subset.eq F_B$, the Fourier expansion of $f$ gives
  $ hat(f_y) \( A \) = sum_(D subset.eq E \\ F_B) hat(f) \( A union D \) chi_D \( y \) . $
  Orthonormality in the assigned coordinates yields
  $ bb(E)_y #scale(x: 120%, y: 120%)[\[] hat(f_y) \( A \)^2 #scale(x: 120%, y: 120%)[\]] =
    sum_(D subset.eq E \\ F_B) hat(f) \( A union D \)^2 . $
  Also $bb(E)_y I_e \( f_y \) = I_(e \, p) \( f \)$ for every $e in F_B$, by conditioning the disagreement event.
    Consequently
  $ sum_(S : thin 1 lt.eq \| S ∩ F_B \| lt.eq k) hat(f) \( S \)^2 lt.eq
    m^(- 1 \/ 4) sum_(e in F_B) I_(e \, p) \( f \) . $
  Finally average over $B$. For each fixed edge $e$, a union bound on its $r$ vertices gives $Pr_B \( e in F_B \)
    lt.eq r m \/ n$, proving (3.1). ◻
]

The next lemma extends the graph capture argument of [9] Lemma 3.3 to identify the hypergraph supports detected by
  this estimate. Here a support $S$ is itself a set of distinct $r$-edges;
  its vertex union contains no isolated vertices.

#thm([Lemma 3.2.])[
  (Capturing a support at one vertex).  #emph[Let $n gt.eq r gt.eq 3$ and $1 lt.eq m lt.eq n$ be integers,
    let $k > 0$, and put
$ alpha = frac(r, r - 1) \, wide L = \( k \/ r \)^alpha . $

 Suppose
#[#set math.equation(numbering: n => "(3.2)")
 $ r L frac(m - 1, n - 1) lt.eq 1 / 2 . $ <eq:capture-condition>]

 For a uniform $m$-subset $B$ of $\[ n \]$ and every $S subset.eq E_(n \, r)$ with $1 lt.eq \| S \| lt.eq L$,
#[#set math.equation(numbering: n => "(3.3)")
 $ Pr_B \( 1 lt.eq \| S ∩ F_B \| lt.eq k \) gt.eq frac(m, 2 n) . $ <eq:capture>]

]
] <lem:capture>

#proof[
  Fix such an $S$, write $s = \| S \|$, and let $V = union.big_(e in S) e$ and $v = \| V \|$.
    Because $s lt.eq binom(v, r) lt.eq v^r$, the average degree of the hypergraph with edge set $S$ is at most
  $ frac(r s, v) lt.eq r s^(\( r - 1 \) \/ r) lt.eq k . $
  Choose a vertex $u in V$ of degree $d_S \( u \)$ between $1$ and $k$.
    This choice depends only on $S$, before $B$ is sampled.
  Conditional on $u in B$, each other vertex lies in $B$ with probability $\( m - 1 \) \/ \( n - 1 \)$.
    The union bound and $v lt.eq r s lt.eq r L$ therefore give
  $ Pr_B \( B ∩ V = { u } \) & gt.eq m / n (1 - \( v - 1 \) frac(m - 1, n - 1))\
 & gt.eq frac(m, 2 n) . $
  On this event, the edges of $S$ meeting $B$ are exactly those containing $u$.
    Thus $\| S ∩ F_B \| = d_S \( u \) in \[ 1 \, k \]$. ◻
]

The captured set need not consist of a single edge: the block meets one support vertex,
  and retains every support edge incident with it. Also the vertex $u$ may vary with $S$,
  since (3.3) is a separate probability bound for each nonnegative summand in (3.1).

Combining Lemmas 3 and 4 gives, whenever their hypotheses hold,

#[#set math.equation(numbering: n => "(3.4)")
 $ sum_(1 lt.eq \| S \| lt.eq L) hat(f) \( S \)^2 lt.eq 2 r m^(- 1 \/ 4) I_p \( f \) . $ <eq:captured-mass>]

If $L < 1$, this conclusion holds because the sum is empty.
  Otherwise, restrict the nonnegative sum in (3.1) to $1 lt.eq \| S \| lt.eq
  L$ and divide by the lower bound $m \/ \( 2 n \)$. This completes the transfer from restricted degree $k$ to
  original degree $\( k \/ r \)^(r \/ \( r - 1 \))$.

== 4 The uniform bound and its threshold consequence <sec:completion>

We now choose the block size so that (3.4) controls the low-degree part of the variance.
  The weighted Parseval identity will control the remaining degrees.

#proof[
  Fix $r gt.eq 3$ and write $alpha = r \/ \( r - 1 \)$. Choose an integer $N_r > r$ such that, for every $n gt.eq
    N_r$ and $m = floor.l sqrt(n) floor.r$,
  #[#set math.equation(numbering: n => "(4.1)")
   $ m gt.eq r + 1 \, wide log m gt.eq 1 / 3 log n \,\
r \( log n \)^alpha n^(- 1 \/ 2) lt.eq 1 / 2 \, wide m^(- 1 \/ 4) \( log n \)^alpha lt.eq 1 . $ <eq:large-n>]
  Such an $N_r$ exists: $m$ is asymptotic to $sqrt(n)$, and any fixed power of $log
    n$ grows more slowly than a positive power of $n$. In particular, the choice is independent of $p$ and $f$.
  Assume first that $n gt.eq N_r$, and set
  $ sigma = sqrt(p \( 1 - p \)) \, wide k = frac(sigma log m, 64) \, wide L = \( k \/ r \)^alpha . $
  Both cutoffs are positive. Since $k \/ r lt.eq log n$ and
  $ frac(m - 1, n - 1) lt.eq frac(sqrt(n) - 1, n - 1) = frac(1, sqrt(n) + 1) lt.eq n^(- 1 \/ 2) \, $
  the third condition in (4.1) implies (3.2). Thus (3.4) and the fourth condition in (4.1) give
  #[#set math.equation(numbering: n => "(4.2)")
   $ sum_(1 lt.eq \| S \| lt.eq L) hat(f) \( S \)^2 lt.eq frac(2 r, \( log n \)^alpha) I_p \( f \) . $ <eq:low-final>]
  For the remaining degrees, (2.1) gives
  $ sum_(\| S \| > L) hat(f) \( S \)^2 lt.eq 1 / L sum_S \| S \| hat(f) \( S \)^2 = sigma^2 / L I_p \( f \) . $
  The decisive bias dependence is
  #[#set math.equation(numbering: n => "(4.3)")
   $ sigma^2 / L = frac(\( 64 r \)^alpha sigma^(2 - alpha), \( log m \)^alpha) lt.eq
     frac(\( 192 r \)^alpha, \( log n \)^alpha) . $ <eq:bias-cancellation>]
  Indeed $2 - alpha = \( r - 2 \) \/ \( r - 1 \) > 0$, $sigma lt.eq 1$, and $log m gt.eq \( log n \) \/ 3$.
    This estimate remains valid at arbitrarily small positive $sigma$.
    If $L < 1$, the low-degree sum is empty and the same tail estimate bounds the whole variance.
  Adding the two parts proves (1.1) for $n gt.eq N_r$ with constant $2 r + \( 192 r \)^alpha$.
    For $r lt.eq n < N_r$, (2.1) gives $"Var"_p \( f \) lt.eq sigma^2 I_p \( f \) lt.eq I_p \( f \) \/ 4$.
    Therefore a valid choice for all $n$ and $p$ is
  $ C_r = max {2 r + \( 192 r \)^alpha \, thin frac(\( log N_r \)^alpha, 4)} . $
  ◻
]

We finish with the threshold consequence stated in the introduction.
  Recall that $q \( p \) = bb(E)_p f$ and $p_a = inf { p in \[ 0 \, 1 \] : q \( p \) gt.eq a }$.

#thm([Corollary 4.1.])[
  #emph[For a nontrivial increasing property of $r$-uniform hypergraphs on $n gt.eq r$ vertices, where $r gt.eq
    3$, and every $0 < epsilon < 1 \/ 2$,
$ p_(1 - epsilon) - p_epsilon lt.eq frac(2 C_r, \( log n \)^(r \/ \( r - 1 \))) log frac(1 - epsilon, epsilon) . $

]
] <cor:threshold>

#proof[
  The Margulis–Russo identity relates pivotal influences to the probability derivative; see [8], [10] Lemma 3,
    and [5] Lemma 2.2. Here it follows directly by giving each coordinate its own bias:
    the expectation is affine in each bias separately, and its partial derivative in coordinate $e$ is
    $bb(E)_p \[ f \( x_(e arrow.l 1) \) - f \( x_(e arrow.l 0) \) \]$.
    Monotonicity identifies this with $I_(e \, p) \( f \)$. Differentiating along the common bias gives
    $q' \( p \) = I_p \( f \)$.
  Nontrivial monotonicity gives $q \( 0 \) = 0$ and $q \( 1 \) = 1$.
    Some pair of configurations differing in one coordinate has different values,
    so its pivotal event has positive probability for every $0 < p < 1$.
    Hence $q' \( p \) > 0$ there, and the stated quantiles exist uniquely. Theorem 1 implies
  $ frac(q' \( p \), q \( p \) \( 1 - q \( p \) \)) gt.eq frac(\( log n \)^(r \/ \( r - 1 \)), C_r) . $
  Integrating from $p_epsilon$ to $p_(1 - epsilon)$, using the antiderivative $log \( q \/ \( 1 - q \) \)$,
    proves the claim. ◻
]

#heading(level: 1)[References]
#bibitem([1])[W. Beckner, Inequalities in Fourier analysis, #emph[Annals of Mathematics] #strong[102] (1975), 159--182.]
#bibitem([2])[A. Bonami, Étude des coefficients de Fourier des fonctions de $L^p \( G \)$,
  #emph[Annales de l'Institut Fourier] #strong[20] (1970), no.~2, 335--402.]
#bibitem([3])[J. Bourgain, J. Kahn, G. Kalai, Y. Katznelson, and N.
  Linial, The influence of variables in product spaces, #emph[Israel Journal of Mathematics] #strong[77] (1992),
  55--64.]
#bibitem([4])[J. Bourgain and G. Kalai, Influences of variables and threshold intervals under group symmetries,
  #emph[Geometric and Functional Analysis] #strong[7] (1997), 438--461.]
#bibitem([5])[E. Friedgut and G. Kalai, Every monotone graph property has a sharp threshold,
  #emph[Proceedings of the American Mathematical Society] #strong[124] (1996), 2993--3002.]
#bibitem([6])[J. Kahn, G. Kalai, and N. Linial, The influence of variables on Boolean functions,
  in #emph[Proceedings of the 29th Annual Symposium on Foundations of Computer Science], IEEE, 1988, 68--80.]
#bibitem([7])[E. Kelman, G. Kindler, N. Lifshitz, D. Minzer, and M.
  Safra, Towards a proof of the Fourier-Entropy Conjecture?,
  #emph[Geometric and Functional Analysis] #strong[30] (2020), 1097--1138. See also arXiv:1911.10579v2, May 7, 2020.]
#bibitem([8])[G. A. Margulis, Probabilistic characteristics of graphs with large connectivity,
  #emph[Problems of Information Transmission] #strong[10] (1974), 174--179.]
#bibitem([9])[OpenAI, #emph[A Sharp Threshold Bound for Monotone Graph Properties],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-Sharp-Threshold-Bound-for-Monotone-Graph-Properties-September-25-2026/paper.pdf")[OAI:A-Sharp-Threshold-Bound-for-Monotone-Graph-Properties-September-25-2026],
  2026.]
#bibitem([10])[L. Russo, On the critical percolation probabilities,
  #emph[Zeitschrift für Wahrscheinlichkeitstheorie und verwandte Gebiete] #strong[56] (1981), 229--237.]
