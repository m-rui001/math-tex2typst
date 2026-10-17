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

#align(center)[#text(size: 16pt, weight: "bold")[Polynomial mixing of the switch chain \
for every graphical degree sequence]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $V = { 1 \, dots.h \, n }$, where $n gt.eq 4$, and let $d = \( d_1 \, dots.h \, d_n \) in { 0 \, dots.h \, n - 1 }^n$ be graphical. Write $Omega_d$ for the nonempty set of simple undirected graphs on $V$ whose labeled degree vector is $d$, and let $pi_d$ be the uniform probability measure on $Omega_d$. A #emph[switch] removes two disjoint edges and inserts a different perfect matching on their four vertices, provided both new edges are absent. This preserves simplicity and every vertex degree.

We use the following precise discrete-time convention. With probability $1 \/ 2$ the chain stays at its current graph. Otherwise it chooses a four-element set $S subset.eq V$ uniformly, and then chooses uniformly one of the six ordered pairs $\( F \, F' \)$ of distinct perfect matchings of the complete graph on $S$. If both edges of $F$ are present and both edges of $F'$ are absent, it replaces $F$ by $F'$; otherwise it stays put. Denote the transition kernel by $P_d$. For probability measures on $Omega_d$, set

$ parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_(G in Omega_d) \| mu \( G \) - nu \( G \) \| \, $

and define

$ t_(upright("mix")) \( d \) = min {t in bb(Z)_(gt.eq 0) : max_(G in Omega_d) parallel P_d^t \( G \, dot.op \) - pi_d parallel_(upright("TV")) lt.eq 1 / 4} . $

#thm([Theorem 1.1.])[
  #emph[For every $n gt.eq 4$ and every graphical degree vector $d$, 
$ t_(upright("mix")) \( d \) lt.eq 2 n^8 . $

 If $\| Omega_d \| > 1$, the spectral gap of $P_d$ is at least $\[ 24 n^2 binom(n, 4) \]^(- 1)$.]
] <thm:main>

#thm([Corollary 1.2.])[
  (Exact uniform sampling).  #emph[There is a uniform randomized algorithm that, given any finite graphical labeled degree vector $d = \( d_1 \, dots.h \, d_n \)$, uses unbiased random bits, terminates almost surely, and outputs a graph chosen exactly uniformly from the simple undirected graphs on ${ 1 \, dots.h \, n }$ with labeled degree vector $d$. Its expected bit running time is bounded by a fixed polynomial in the binary encoding length of $d$.]
] <cor:exact-sampling>

The corollary includes vectors of length less than four, which are handled directly. Section 8 proves it by correcting the finite-time law of the chain. The time bound is in expectation; no polynomial bound on every random execution is asserted.

===== 1.1 History and significance. <history-and-significance.>

Uniform sampling with prescribed degrees provides a basic null model for networks and a natural problem in approximate counting.

Kannan, Tetali, and Vempala initiated the switch-chain program, treated regular bipartite sequences, and raised the possibility of broad applicability [21]. For simple undirected graphs, Cooper, Dyer, and Greenhill established rapid mixing for regular sequences; their corrigendum preserves the polynomial bound with a corrected exponent [6,7]. Feder, Guetz, Mihail, and Saberi studied early irregular families [12], and Greenhill and Sfragara proved rapid mixing under quantitative restrictions on the degrees, correcting and extending Greenhill’s earlier irregular-degree argument [16,17]. Amanatidis and Kleer developed a route through strong stability [1].

Stability conditions for degree-constrained sampling were developed by Jerrum and Sinclair [20] and by Jerrum, McKay, and Sinclair [19]. Erdős, Greenhill, Mezei, Miklós, Soltész, and Soukup subsequently proved rapid mixing for every P-stable family [9]. P-stability requires a polynomial bound, uniform over the family, on the ratio between the number of realizations of nearby perturbed sequences and that of the original sequence. Recent work of Erdős, Miklós, and Soukup [11] and of Erdős, Lippner, Nevo, and Soukup [10] gives further P-stable families from regions in which every admissible degree vector is graphical. These results explain substantial classes of degrees; the theorem here requires only that the individual degree vector be graphical. The modern Kannan–Tetali–Vempala conjecture predicts rapid mixing for every realizable degree specification in each of the bipartite, directed, and simple-undirected models; see [9] Conjecture 1.1. Theorem 1 resolves its simple-undirected formulation affirmatively. Our off-diagonal transition probabilities agree with the simple-undirected kernel displayed in [9] Equation (3.1).

Fu, Qin, and Wang proved the bipartite formulation, equivalently the fixed-margin binary-matrix problem [14]. They compare the swap chain with a two-row heat bath and reduce its spectral analysis to a three-row conditional-projection inequality. We reprove the equivalent variance inequality of their Theorem 5.1, retaining the separation of label assignments and block counts and the adjacent-count coupling developed in their Lemmas 5.2–5.4. A simple undirected graph has a symmetric adjacency matrix, so an arbitrary binary-matrix resampling does not preserve its state space. Our pair resamplings preserve that symmetry by redistributing neighbors between two vertices.

These pair updates belong to the Curveball framework. For binary matrices with fixed margins, Verhelst developed a multiple-swap procedure [26]. Strona, Nappo, Boccacci, Fattorini, and San-Miguel-Ayanz later independently formulated a version called the Curveball algorithm [24,25,5]; Carstens, Berger, and Strona developed its undirected version [4]. They also observed that undirected trades on disjoint vertex pairs can be dependent. The additional estimate here gives quantitative control of those interactions: although an individual disjoint-pair term may be negative, their full sum is positive semidefinite.

For prescribed degrees on arbitrary explicitly listed simple undirected unweighted hosts, OpenAI [22] Corollary 10.1 gives a fully polynomial randomized approximation scheme for counting labeled subgraphs with those degrees and, when feasible, a sampler within total-variation distance $tau$ of their uniform law. For rational $0 < tau < 1$, the sampling bit cost on every execution is polynomial in the full input length and $tau^(- 1)$. These broader-host guarantees do not assert mixing of a host-restricted switch chain: Theorem 1 concerns the complete host, while Corollary 2 gives exact uniform sampling with expected polynomial bit cost.

===== 1.2 Proof strategy. <proof-strategy.>

For an unordered vertex pair $a$, we resample which of its two endpoints receives each neighbor adjacent to exactly one of them. All other adjacencies and the number assigned to each endpoint remain fixed. Each conditional space is therefore a uniform subset slice: all subsets of one fixed size from the available neighbors. Let $E_a$ be its averaging projection, $h_a = I - E_a$, and $H = sum_a h_a$. The central estimate is $H^2 succ.curly.eq H$, where $succ.curly.eq$ denotes the order of quadratic forms. Once the kernel of $H$ is shown to consist of constants, comparison with individual switches gives the stated gap and mixing time.

The reduction from $H$ to its restrictions on triples follows the squared-generator method of Caputo [2] Section 1.1, also used for binary matrices by Fu, Qin, and Wang [14] Lemma 4.1. The expansion groups terms according to whether the two indexing pairs intersect. Caputo’s disjoint terms are controlled by commutation [2] Equation (1.11). Here the undirected trades need a separate estimate; this is where the slice comparison and the disjoint-pair calculation enter.

First, all three pair resamplings on a vertex triple can be represented by updates of a three-row binary matrix with fixed margins. When needed, one extra column records the internal edges of the triple. We prove that the variance of a sum of three row functions is at most twice the sum of their variances. To see the structure behind this estimate, discard columns of sum zero or three. Each remaining column chooses either the row containing its unique one or the row containing its unique zero. We first control these label assignments with their counts fixed, then control the random counts themselves. The resulting variance bound controls all overlapping pair resamplings.

Second, after fixing the data preserved by two disjoint pair resamplings, the dependence between their conditional data has rank at most one. Its negative contribution is bounded by projections onto centered indicators that two neighbors receive the same endpoint. A slice inequality bounds the sum of these projections by the switch energy available on the same slice. Summing cancels the negative contributions and completes the estimate for $H$. The three-row variance inequality and the slice projection comparison are stated separately from the graph argument, making their scope explicit.

===== 1.3 Organization. <organization.>

Section 2 defines the pair resamplings and their conditional projections. Section 3 proves the three-row inequality, and Section 4 applies it to overlapping updates. Section 5 identifies the errors in one disjoint-pair interaction. Section 6 controls their sum by a slice comparison and proves positivity of the full disjoint contribution. Section 7 combines these estimates, proves connectivity, and tracks the comparison and proposal constants through the mixing bound. Section 8 then gives an exact uniform sampler with expected polynomial bit cost. All proof ingredients are supplied in the paper.

== 2 Pair resamplings <sec:setup>

All function spaces below are real. On $Omega_d$, use the inner product $chevron.l f \, g chevron.r = bb(E)_(pi_d) \[ f g \]$ and its norm. For self-adjoint operators, $A succ.curly.eq B$ means $chevron.l f \, \( A - B \) f chevron.r gt.eq 0$ for every $f$. When restricting to a cell of a partition, inner products and expectations use its conditional uniform probability measure.

For an unordered vertex pair $a = { i \, j }$, record

+ every edge with neither endpoint in $a$;
+ whether the edge $i j$ is present;
+ for each $w in.not a$, the number of its neighbors in $a$.

The resulting cells are the #emph[$a$-fibers]. Fix an ordering of the two endpoints of every pair. In one $a$-fiber, call an outside vertex a #emph[singleton] if it has exactly one neighbor in $a$. If there are $N$ such vertices, the degree of the first endpoint specifies the number $q$ assigned to it. Vertices with zero or two neighbors in $a$ have no choice. Hence the fiber is in bijection with all $q$-subsets of its $N$ singleton vertices, uniformly. Every such reassignment preserves all degrees and simplicity; there are no further constraints on the subset. Uniform resampling of this subset is the undirected Curveball trade of [4].

Let $E_a$ be conditional expectation on the partition into $a$-fibers, and put

#[#set math.equation(numbering: n => "(2.1)")
 $ h_a = I - E_a \, #h(2em) H = sum_(a in binom(V, 2)) h_a . $ <eq:pair-operators>]

This is the partition-based heat-bath construction of Dyer, Greenhill, and Ullrich [8] Definition 1.1. Thus $E_a$ and $h_a$ are orthogonal projections. In particular, $H$ is positive semidefinite and kills constants. We shall prove

#[#set math.equation(numbering: n => "(2.2)")
 $ H^2 succ.curly.eq H . $ <eq:H-target>]

The next sections establish the local inequalities needed for this bound. Section 7 identifies the kernel and compares $H$ with the switch chain.

== 3 A variance inequality for three rows <row:section>

The estimate in this section concerns arbitrary binary matrices with three rows and prescribed margins. It will control resamplings on a vertex triple, but does not require a graph interpretation. The equivalent conditional-projection inequality was proved by Fu, Qin and Wang [14] Theorem 5.1. We give a proof using label transpositions and conditional variance, separating the randomness of the labels from that of the block sizes. The count distribution and adjacent-total coupling below correspond to their Lemmas 5.2–5.4; all steps are included here.

The transposition and invariant-coordinate strategy for the fixed-block argument was inspired by the symmetric-group heat-flow method of Carlen, Lieb and Loss [3] Section 2. The variance proof below is self-contained; the three-row inequality and count coupling retain the Fu–Qin–Wang attribution above.

#thm([Lemma 3.1.])[
  (Fixed block sizes).  #emph[Let $\( U_1 \, U_2 \, U_3 \)$ and $\( W_1 \, W_2 \, W_3 \)$ be independent uniform ordered partitions of finite labeled sets $U$ and $W$, with all six block sizes prescribed. For arbitrary real functions $g_i = g_i \( U_i \, W_i \)$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ "Var" #scale(x: 180%, y: 180%)[\(] sum_(i = 1)^3 g_i #scale(x: 180%, y: 180%)[\)] lt.eq 2 sum_(i = 1)^3 "Var" \( g_i \) . $ <row:fixed-variance>]

]
] <row:fixed-blocks>

#proof[
  Subtract the mean from each $g_i$. On the finite conditional space, let
  $ J = sum_tau \( I - T_tau \) \, $
  where $tau$ ranges over transpositions of two labels within $U$ or within $W$, and $T_tau$ acts on functions by permuting those labels. Every $T_tau$ is a self-adjoint involution, so
  #[#set math.equation(numbering: n => "(3.2)")
   $ chevron.l f \, J f chevron.r = 1 / 2 sum_tau bb(E) \( f - T_tau f \)^2 . $ <row:transposition-energy>]
  The permutations of $U$ and $W$ act transitively on the ordered partitions with their prescribed sizes. Since transpositions generate these permutations, the kernel of $J$ consists precisely of constants. This also covers empty blocks and label sets; a one-state space has no nonzero centered functions.
  The space of functions of $\( U_i \, W_i \)$ is invariant under $J$. Indeed, a transposition within $U$ changes such a function only when it exchanges a label in $U_i$ with one outside $U_i$. The resulting block is determined by $U_i$ and the two labels, regardless of which other block contains the outside label. The same observation applies to $W$. Every spectral projection of the finite-dimensional operator $J$ is a polynomial in $J$, and therefore preserves each row-function space. Write $g_i = sum_(lambda > 0) g_(i \, lambda)$ for its orthogonal spectral decomposition. For a fixed transposition, at most two of the three block tuples change. Hence, pointwise,
  $ (sum_i \( g_(i \, lambda) - T_tau g_(i \, lambda) \))^2 lt.eq 2 sum_i \( g_(i \, lambda) - T_tau g_(i \, lambda) \)^2 . $
  Using (3.2) gives
  $ lambda ∥sum_i g_(i \, lambda)∥^2 lt.eq 2 lambda sum_i parallel g_(i \, lambda) parallel^2 . $
  Divide by $lambda > 0$ and sum over the orthogonal eigenspaces to obtain (3.1). ◻
]

#thm([Lemma 3.2.])[
  (Random block sizes).  #emph[Let $m \, alpha_1 \, alpha_2 \, alpha_3$ be nonnegative integers. Give the triples $x = \( x_1 \, x_2 \, x_3 \)$ of nonnegative integers with $x_1 + x_2 + x_3 = m$ probabilities proportional to 
$ product_(i = 1)^3 w_i \( x_i \) \, #h(2em) w_i \( t \) = frac(1, t ! \( t + alpha_i \) !) . $

 For arbitrary real functions $b_i$ of one coordinate, 
#[#set math.equation(numbering: n => "(3.3)")
 $ "Var" #scale(x: 180%, y: 180%)[\(] sum_(i = 1)^3 b_i \( x_i \) #scale(x: 180%, y: 180%)[\)] lt.eq 2 sum_(i = 1)^3 "Var" \( b_i \( x_i \) \) . $ <row:count-variance>]

]
] <row:counts>

#proof[
  The case $m = 0$ is immediate. Suppose $m > 0$. We first compare the distributions of two coordinates with adjacent totals, using the coupling of Fu, Qin and Wang [14] Lemma 5.2. We include the argument. Let $\( Y_s \, Z_s \)$ have probabilities proportional to $w_j \( y \) w_k \( z \)$ on $y + z = s$. For $s gt.eq 1$ and $0 lt.eq y lt.eq s - 1$, the ratio of the probability of $Y_s = y$ to that of $Y_(s - 1) = y$ is a positive constant times
  $ frac(w_k \( s - y \), w_k \( s - 1 - y \)) = frac(1, \( s - y \) \( s - y + alpha_k \)) \, $
  which is nondecreasing in $y$. Reweighting by a nondecreasing function increases expectations of nondecreasing functions: for two such functions $a \, b$ and independent identically distributed $Y \, Y'$, this follows from
  $ "Cov" \( a \( Y \) \, b \( Y \) \) = 1 / 2 bb(E) #scale(x: 120%, y: 120%)[\[] \( a \( Y \) - a \( Y' \) \) \( b \( Y \) - b \( Y' \) \) #scale(x: 120%, y: 120%)[\]] gt.eq 0 . $
  Applying this observation on the common support, and then adding the possible mass at $y = s$, proves $Y_(s - 1) lt.eq_(upright("st")) Y_s$. Interchanging the coordinates also gives $Z_(s - 1) lt.eq_(upright("st")) Z_s$, or equivalently $Y_s lt.eq_(upright("st")) Y_(s - 1) + 1$. Use the same uniform random variable in the inverse distribution functions of $Y_(s - 1)$ and $Y_s$. Writing $Q$ for these quantile functions, the identity $Q_(Y_(s - 1) + 1) \( u \) = Q_(Y_(s - 1)) \( u \) + 1$ shows that both stochastic inequalities hold simultaneously:
  #[#set math.equation(numbering: n => "(3.4)")
   $ Y_(s - 1) lt.eq Y_s lt.eq Y_(s - 1) + 1 . $ <row:covering-coupling>]
  Since these variables are integer-valued, setting $Z$ from its respective total yields a coupling in which exactly one of the two coordinates increases by one.
  Now let $A$ map the direct sum of the three centered marginal function spaces to the centered joint space by $A \( b_1 \, b_2 \, b_3 \) = sum_i b_i \( x_i \)$. The direct sum has squared norm $sum_i parallel b_i parallel^2$. To prove (3.3), it suffices to bound the largest eigenvalue $lambda$ of $A^(*) A$ by $2$. A corresponding nonzero centered eigenvector satisfies
  #[#set math.equation(numbering: n => "(3.5)")
   $ lambda b_i \( t \) = bb(E) [sum_(j = 1)^3 b_j \( x_j \) thin mid(bar.v) thin x_i = t] \, #h(2em) 0 lt.eq t lt.eq m . $ <row:count-eigenvector>]
  Every value $0 \, dots.h \, m$ has positive marginal probability. Therefore
  $ M = max_(i \, thin 0 lt.eq t < m) \| b_i \( t + 1 \) - b_i \( t \) \| $
  is positive: otherwise each component would be constant, and hence zero by centering.
  Conditioning on $x_i = t$ leaves the other two coordinates with total $s = m - t$. For adjacent values $t \, t + 1$, couple those coordinates using (3.4). Exactly one of them decreases by one, so the change in their conditional sum of functions has absolute value at most $M$. Subtracting (3.5) at the two values thus gives
  $ \| \( lambda - 1 \) \( b_i \( t + 1 \) - b_i \( t \) \) \| lt.eq M . $
  Choose $i \, t$ attaining $M$. It follows that $\| lambda - 1 \| lt.eq 1$, and in particular $lambda lt.eq 2$. ◻
]

#thm([Lemma 3.3.])[
  (Three-row variance inequality).  #emph[Fix row and column sums for binary matrices with three rows, and take the uniform distribution on the nonempty set of all matrices with these prescribed margins. Let $S_i$ denote row $i$. For arbitrary real row functions $f_i$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ "Var" #scale(x: 180%, y: 180%)[\(] sum_(i = 1)^3 f_i \( S_i \) #scale(x: 180%, y: 180%)[\)] lt.eq 2 sum_(i = 1)^3 "Var" \( f_i \( S_i \) \) . $ <row:main-variance>]

]
] <row:variance>

#proof[
  Columns of sum $0$ or $3$ are deterministic; remove them and adjust the row sums. Let $U$ index the columns of sum $1$, assigned to the row containing their unique one. Let $W$ index the columns of sum $2$, assigned to the row containing their unique zero. Write $U_i \, W_i$ for the resulting blocks. The nondeterministic information in row $i$ is exactly $\( U_i \, W_i \)$.
  Put $k_i = \| W_i \|$. The adjusted row-sum constraints have the form
  $ \| U_i \| = k_i + delta_i $
  for fixed integers $delta_i$, since that row sum equals $\| U_i \| + \| W \| - k_i$. Conditional on the vector $k$, the assignments on $U$ and $W$ are independent uniform ordered partitions with prescribed block sizes. Lemma 3 therefore applies.
  Counting these partitions shows that the law of $k$ has weights proportional to
  $ product_(i = 1)^3 frac(1, k_i ! \( k_i + delta_i \) !) \, #h(2em) k_i gt.eq 0 \, quad k_i + delta_i gt.eq 0 \, quad sum_i k_i = \| W \| . $
  These conditions are sufficient for feasibility: the two sets of nonnegative block sizes sum to $\| W \|$ and $\| U \|$, respectively. Set
  $ l_i = max \( 0 \, - delta_i \) \, #h(2em) x_i = k_i - l_i \, #h(2em) alpha_i = \| delta_i \| \, #h(2em) m = \| W \| - sum_i l_i . $
  Nonemptiness implies $m gt.eq 0$. The support becomes all nonnegative triples of total $m$, and the weights become $product_i \[ x_i ! \( x_i + alpha_i \) ! \]^(- 1)$. Thus Lemma 4 applies to functions of the individual counts.
  Conditional on $k$, the marginal blocks $U_i$ and $W_i$ are independent uniform subsets of their respective sizes. In particular $bb(E) \[ f_i \( S_i \) divides k \]$ depends only on $k_i$, or equivalently on $x_i$. Applying conditional variance, followed by Lemmas 3 and 4, gives
  $ "Var" #scale(x: 180%, y: 180%)[\(] sum_i f_i \( S_i \) #scale(x: 180%, y: 180%)[\)] & = bb(E) "Var" #scale(x: 180%, y: 180%)[\(] sum_i f_i \( S_i \) thin \| thin k #scale(x: 180%, y: 180%)[\)] + "Var" #scale(x: 180%, y: 180%)[\(] sum_i bb(E) \[ f_i \( S_i \) divides k \] #scale(x: 180%, y: 180%)[\)]\
 & lt.eq 2 sum_i bb(E) "Var" \( f_i \( S_i \) divides k \) + 2 sum_i "Var" \( bb(E) \[ f_i \( S_i \) divides k \] \)\
 & = 2 sum_i "Var" \( f_i \( S_i \) \) \, $
  as required. ◻
]

== 4 Resamplings on a vertex triple <tri:section>

We now transfer the three-row inequality to graph resamplings whose indexing pairs share a vertex. The internal edges of the three vertices must be included in the matrix encoding; Table 1 records the four possible internal edge counts. For $T in binom(V, 3)$, define

$ H_T = sum_(a in binom(T, 2)) h_a . $

The three-row inequality yields the following local spectral bound.

#thm([Proposition 4.1.])[
  #emph[For every vertex triple $T$, one has $H_T^2 succ.curly.eq H_T$.]
] <tri:gap>

#proof[
  Partition $Omega_d$ by recording the graph on $V \\ T$ and, for each $w in.not T$, its number of neighbors in $T$. Every pair resampling indexed by a pair in $T$ preserves these data. Work in one nonempty cell, with its conditional uniform measure. The degree sum in $T$ determines the total number $e in { 0 \, 1 \, 2 \, 3 }$ of edges inside $T$.
  Use a binary matrix with rows indexed by $i in T$ and columns indexed by $w in.not T$, whose entry at $\( i \, w \)$ is the indicator of the edge $i w$. Its column sums are fixed. To encode the internal graph as well, let $s_i$ denote the degree of $i$ within $T$, and augment the matrix as follows.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, left, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$e$
], table.cell(rowspan: 1, colspan: 1)[Internal graph
], table.cell(rowspan: 1, colspan: 1)[Extra column
], table.cell(rowspan: 1, colspan: 1)[Row sum at $i$
]),
  table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[Empty
], table.cell(rowspan: 1, colspan: 1)[None
], table.cell(rowspan: 1, colspan: 1)[$d_i$
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[A single edge
], table.cell(rowspan: 1, colspan: 1)[$s_i$ (sum $2$)
], table.cell(rowspan: 1, colspan: 1)[$d_i$
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[A path
], table.cell(rowspan: 1, colspan: 1)[$s_i - 1$ (sum $1$)
], table.cell(rowspan: 1, colspan: 1)[$d_i - 1$
],
  table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[A triangle
], table.cell(rowspan: 1, colspan: 1)[None
], table.cell(rowspan: 1, colspan: 1)[$d_i - 2$
],
)
]],
    caption: [Table 1: Encoding the internal edges of a triple in a three-row matrix. The extra column, when present, is a distinct labeled column. ],
  )
  For $e = 1$, the extra column marks the endpoints of the sole edge; for $e = 2$, it marks the center of the path. Thus the internal graph is uniquely recovered from the extra column, or is deterministic when $e = 0 \, 3$. Conversely, every binary matrix with the prescribed row and column sums recovers a valid graph in this cell. The row sums give the required degrees in $T$, while the external column sums and the fixed graph on $V \\ T$ give all other degrees. This is a bijection onto the entire fixed-margin matrix space, so its conditional measure is uniform.
  We next identify the conditional operators exactly. Fix $i in T$ and write ${ j \, k } = T \\ { i }$. Within this cell,
  #[#set math.equation(numbering: n => "(4.1)")
   $ E_({ j \, k }) f = bb(E) \[ f divides S_i \] \, $ <tri:conditional-row>]
  where $S_i$ is augmented row $i$. Indeed, the external entries of this row determine $s_i$ from $d_i$, and hence determine its extra entry whenever present. Fixing the row therefore means precisely fixing the external neighbors of $i$. Together with the cell data, these neighbors determine all the ${ j \, k }$-fiber data:
  - the graph away from ${ j \, k }$ is the fixed graph on $V \\ T$, together with the specified external edges at $i$;
  - the indicator of $j k$ is $e - s_i$;
  - the number of neighbors in ${ j \, k }$ of each $w in.not T$ is its recorded number of neighbors in $T$ minus the indicator of $i w$;
  - the number of neighbors in ${ j \, k }$ of $i$ itself is $s_i$.
  Conversely, the pair-fiber data fix all external edges at $i$, and therefore fix $S_i$. The fiber is contained in the cell because the cell data are preserved by the pair resampling. Thus the two conditionings coincide on the full pair fiber, proving (4.1). In particular, when $s_i = 1$, the choice between $i j$ and $i k$ remains free whenever the other constraints permit it; conditioning on the augmented row does not freeze that internal choice.
  Let $P_i f = bb(E) \[ f divides S_i \]$. For a function $f$ centered in the cell, the functions $P_i f$ are centered row functions. Put $b = sum_i parallel P_i f parallel^2$. Orthogonality of $P_i$, Lemma 5, and Cauchy–Schwarz yield
  $ b = ⟨f \, sum_i P_i f⟩ lt.eq parallel f parallel ∥sum_i P_i f∥ lt.eq parallel f parallel sqrt(2 b) . $
  It follows that $b lt.eq 2 parallel f parallel^2$, including when $b = 0$. By (4.1),
  $ chevron.l f \, H_T f chevron.r = 3 parallel f parallel^2 - sum_i parallel P_i f parallel^2 gt.eq parallel f parallel^2 . $
  Thus the self-adjoint operator $H_T$ kills constants and has all its other eigenvalues at least $1$ in this cell. Squaring its eigenvalues proves $H_T^2 succ.curly.eq H_T$ there; the conclusion is also immediate for a singleton cell. Finally, all the operators preserve the cells, so the cellwise inequalities give the claimed inequality on $Omega_d$. ◻
]

== 5 Disjoint pair resamplings <dis:section>

The resamplings indexed by disjoint vertex pairs need not commute: they both alter the four edges between the two pairs. Carstens, Berger, and Strona already noted this dependence of undirected trades [4] Section 2.3 of the arXiv version. We show that one interaction is bounded below by a cross-edge switch term minus two errors. Each error is a projection onto an equal-assignment indicator in one pair fiber. Section 6 will bound the sum of these errors by the available switch energy.

For disjoint vertex pairs $a \, b$, let $T_(a \, b)$ toggle the four edges between $a$ and $b$ when their $2$-by-$2$ cross matrix has every row and column sum one, and leave the graph unchanged otherwise. This map is a degree-preserving involution, and hence acts as a self-adjoint isometry on functions. Define

#[#set math.equation(numbering: n => "(5.1)")
 $ g_(a \, b) = frac(I - T_(a \, b), 2) = g_(b \, a) . $ <sl:def-cross>]

Thus $g_(a \, b)$ is an orthogonal projection.

Fix an $a$-fiber $cal(F)$, and write $b = { k \, l }$. If both $k$ and $l$ are singleton vertices in this fiber, let $x_k \, x_l$ indicate assignment to the first endpoint of $a$, and set

#[#set math.equation(numbering: n => "(5.2)")
 $ z_(k l)^(cal(F)) = upright(bold(1))_({ x_k = x_l }) - bb(P) \( x_k = x_l divides cal(F) \) . $ <sl:def-equality>]

On $cal(F)$, define $R_(a \, b)$ to be orthogonal projection onto the span of $z_(k l)^(cal(F))$, or zero if this function is zero. If either vertex is not a singleton, also use the zero operator. Taking the direct sum over all $a$-fibers defines an orthogonal projection $R_(a \, b)$ on the graph space. Unlike $g_(a \, b)$, this projection is directed: $R_(a \, b)$ and $R_(b \, a)$ use different fibers. Its definition is independent of the chosen ordering of the two endpoints of $a$.

#thm([Proposition 5.1.])[
  (Disjoint-pair interaction).  #emph[For disjoint vertex pairs $a \, b$ and every real function $f$ on $Omega_d$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ 2 chevron.l h_a f \, h_b f chevron.r gt.eq 2 parallel g_(a \, b) f parallel^2 - parallel R_(a \, b) f parallel^2 - parallel R_(b \, a) f parallel^2 . $ <dis:bound>]

]
] <dis:interaction>

#proof[
  Write $a = { i \, j }$ and $b = { k \, l }$, with $i$ and $k$ the first endpoints in the orders used to define the slice projections, and put $O = V \\ \( a union b \)$. Partition $Omega_d$ by recording the graph on $O$, the edges $i j \, k l$, and, separately for each $w in O$, its numbers of neighbors in $a$ and in $b$. Both pair resamplings preserve these data. In particular, each full $a$-fiber or $b$-fiber is contained in a cell of this partition. We prove the inequality on each nonempty cell, using its conditional uniform measure throughout.
  ===== 5.1 The cell and its two conditional expectations. <the-cell-and-its-two-conditional-expectations.>
  Let $A_0 \, B_0 subset.eq O$ be the outside vertices with exactly one neighbor in $a \, b$, respectively. A graph $G$ in the cell is encoded by
  $ M = mat(delim: "(", upright(bold(1))_({ i k in E \( G \) }), upright(bold(1))_({ i l in E \( G \) }); upright(bold(1))_({ j k in E \( G \) }), upright(bold(1))_({ j l in E \( G \) })) \, #h(2em) U subset.eq A_0 \, #h(2em) W subset.eq B_0 \, $
  where $U$ contains those outside singletons assigned to $i$, and $W$ those assigned to $k$. The total $s$ of the four entries of $M$ is fixed by the sum of the degrees in $a$ and the recorded data. Set
  $ r = M_(i k) + M_(i l) \, #h(2em) c = M_(i k) + M_(j k) . $
  For fixed integers $q_0 \, q_1$, the remaining degree constraints are exactly
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| U \| = q_0 - r \, #h(2em) \| W \| = q_1 - c . $ <dis:sizes>]
  Indeed, these equations enforce the degrees of $i \, k$; the degrees of $j \, l$ then follow from the fixed pair totals. Each outside degree is already enforced by the recorded graph and counts. This also proves that every binary matrix of total $s$ and every pair of subsets satisfying (5.4) give a valid graph in the cell. The sets $A_0 \, B_0$ may overlap: the two assignments use different edges and preserve the two recorded neighbor counts separately. Thus overlap adds no constraint. All these encodings have the same probability.
  Within the cell, the full $a$-fiber data are equivalent to $X = \( c \, W \)$. Namely, $c$ and $s - c$ specify the counts from $k \, l$ to $a$, and $W$ specifies all remaining edges not incident to $a$. Together with the cell data this is exactly the defining information of an $a$-fiber. Similarly, the full $b$-fiber data are $Y = \( r \, U \)$. Therefore
  #[#set math.equation(numbering: n => "(5.5)")
   $ E_a = bb(E) \[ thin dot.op divides X \] \, #h(2em) E_b = bb(E) \[ thin dot.op divides Y \] . $ <dis:conditional>]
  Let $cal(A) \, cal(B)$ be the subspaces of functions of $X \, Y$, respectively, with constants included, and let $cal(J) = \( cal(A) + cal(B) \)^perp$. The involution defining $g_(a \, b)$ preserves $X$ and $Y$. Hence its antisymmetric projection kills both subspaces, and, by self-adjointness,
  #[#set math.equation(numbering: n => "(5.6)")
   $ "ran" g_(a \, b) subset.eq cal(J) . $ <dis:g-range>]
  ===== 5.2 Independent cases. <independent-cases.>
  If $s = 0$ or $s = 4$, the cross matrix is fixed and $X \, Y$ are independent. If $s = 1$ or $s = 3$, every feasible combination of its row total $r$ and column total $c$ determines a unique matrix: it specifies the position of its unique one or its unique zero. Since the subset restrictions in (5.4) are separate, $X \, Y$ again have a product law.
  For $s = 2$, all six cross matrices appear in the following display, placed according to their first row sum $r$ and first column sum $c$:
  #[#set math.equation(numbering: n => "(5.7)")
   $ & c = 0 & c = 1 & c = 2\
r = 0 & diameter & 0 & 0\
1 & 1 & diameter\
r = 1 & 0 & 1\
0 & 1 & 1 & 0\
0 & 1 \, quad 0 & 1\
1 & 0 & 1 & 0\
1 & 0\
r = 2 & diameter & 1 & 1\
0 & 0 & diameter . $ <dis:table>]
  Let $m_(r c)$ count the matrices in cell $\( r \, c \)$ of this display: $m_11 = 2$, the four adjacent cells have count one, and the corners have count zero. Write $D_r = { r eq.not 1 }$ and $D_c = { c eq.not 1 }$. The top and bottom matrices realize $D_r$, and the side matrices realize $D_c$, so the two events are disjoint. Call $r = c = 1$ the center; its two matrices are exchanged by $T_(a \, b)$. If both events have positive probability, the center is feasible: occurrence of $D_r$ implies feasibility of a subset $W$ of size $q_1 - 1$, and occurrence of $D_c$ implies feasibility of a subset $U$ of size $q_0 - 1$. Together these subsets realize either central matrix. Thus, if the center is absent, at most one of the events occurs, and the support lies in a single row or column of (5.7); the law of $X \, Y$ is a product. If the center is present but one of the events has probability zero, the same conclusion holds. For example, if $r = 1$ always, then $U$ is uniform of fixed size, independently of $c \, W$; the multiplicity in (5.7) depends only on $c$.
  Whenever $X \, Y$ are independent, both $E_a E_b$ and $E_b E_a$ equal the projection onto constants in the cell. Consequently $h_a h_b$ is the orthogonal projection onto $cal(J)$, and
  $ 2 chevron.l h_a f \, h_b f chevron.r = 2 parallel "proj"_(cal(J)) f parallel^2 gt.eq 2 parallel g_(a \, b) f parallel^2 $
  by (5.6). This is stronger than (5.3).
  ===== 5.3 The remaining correlation has rank one. <the-remaining-correlation-has-rank-one.>
  It remains to consider $s = 2$ when both events and the center have positive probability. Put $p_r = bb(P) \( D_r \)$ and $p_c = bb(P) \( D_c \)$, and define centered unit vectors
  $ u = frac(upright(bold(1))_(D_c) - p_c, sqrt(p_c \( 1 - p_c \))) in cal(A) \, #h(2em) v = frac(upright(bold(1))_(D_r) - p_r, sqrt(p_r \( 1 - p_r \))) in cal(B) . $
  Their correlation is
  #[#set math.equation(numbering: n => "(5.8)")
   $ chevron.l u \, v chevron.r = - rho \, #h(2em) rho = sqrt(frac(p_c p_r, \( 1 - p_c \) \( 1 - p_r \))) in \( 0 \, 1 \) \, $ <dis:rho>]
  since $D_r \, D_c$ are disjoint and $1 - p_c - p_r$ is the positive center probability.
  With the counts $m_(r c)$ associated with (5.7), for every occurring $X = \( c \, W \)$ and each feasible subset $U$ of size $q_0 - r$,
  $ bb(P) #scale(x: 120%, y: 120%)[\(] Y = \( r \, U \) divides X = \( c \, W \) #scale(x: 120%, y: 120%)[\)] = frac(m_(r c), sum_(t = 0)^2 binom(\| A_0 \|, q_0 - t) m_(t c)) \, $
  where a binomial coefficient is zero when its lower index is outside ${ 0 \, dots.h \, \| A_0 \| }$. Thus the conditional law of $Y$ given $X$ depends only on whether $c = 1$. When $c eq.not 1$, necessarily $r = 1$ and $U$ is uniform of size $q_0 - 1$; when $c = 1$, the displayed formula has no dependence on $W$. Symmetrically, the conditional law of $X$ given $Y$ depends only on whether $r = 1$. It follows that
  $ E_a cal(B) subset.eq "span" \( 1 \, u \) \, #h(2em) E_b cal(A) subset.eq "span" \( 1 \, v \) \, #h(2em) E_a v = - rho u \, quad E_b u = - rho v . $
  Let $cal(A)'$ be the centered functions in $cal(A)$ orthogonal to $u$, and define $cal(B)'$ symmetrically. The conditional-expectation inclusions show that $cal(A)' perp cal(B)$ and $cal(B)' perp cal(A)$. We therefore have the orthogonal decomposition
  #[#set math.equation(numbering: n => "(5.9)")
   $ "span" \( 1 \) med xor med cal(A)' med xor med cal(B)' med xor med "span" \( u \, v \) med xor med cal(J) . $ <dis:decomposition>]
  All these summands are invariant under $E_a \, E_b$. The first three contribute zero to $chevron.l h_a f \, h_b f chevron.r$, and $cal(J)$ contributes $parallel "proj"_(cal(J)) f parallel^2$.
  On the plane in (5.9), write the component of $f$ as $x u + y v$. Its images under $h_a$ and $h_b$, respectively, are
  $ y \( v + rho u \) \, #h(2em) x \( u + rho v \) . $
  The parenthesized vectors have squared norm $1 - rho^2$ and mutual inner product $rho \( 1 - rho^2 \)$. Hence the plane contribution obeys
  #[#set math.equation(numbering: n => "(5.10)")
   $ 2 x y rho \( 1 - rho^2 \) gt.eq - \( x^2 + y^2 \) \( 1 - rho^2 \) = - parallel y \( v + rho u \) parallel^2 - parallel x \( u + rho v \) parallel^2 . $ <dis:plane>]
  Here $2 \| x y \| lt.eq x^2 + y^2$ and $0 < rho < 1$ justify the inequality for either sign of $x y$.
  ===== 5.4 The error lines belong to the slice projections. <the-error-lines-belong-to-the-slice-projections.>
  The vector $y \( v + rho u \)$ is the orthogonal projection of the full function $f$ onto the line spanned by $v + rho u$: the spanning vector is orthogonal to $u$, has inner product $1 - rho^2$ with $v$, and all other summands of (5.9) are orthogonal to the plane. The symmetric assertion holds for $x \( u + rho v \)$.
  We claim that the first line belongs to $"ran" R_(a \, b)$. Examine $v + rho u = v - E_a v$ on each $X$-slice, which, by (5.5), is a full global $a$-fiber. If $c eq.not 1$, then $D_r$ is deterministically false and this difference is zero. If $c = 1$, both $k \, l$ are singleton vertices for the pair $a$. Moreover, $D_r$ occurs exactly when their assignments to the two endpoints of $a$ are equal. Writing these assignments as $x_k \, x_l$, on this fiber we have
  $ v - E_a v = frac(upright(bold(1))_({ x_k = x_l }) - bb(P) \( x_k = x_l divides X \), sqrt(p_r \( 1 - p_r \))) . $
  This is a scalar multiple of the centered function defining $R_(a \, b)$, including when that function vanishes. Thus the line belongs to its fiberwise direct-sum range. Likewise the other line belongs to $"ran" R_(b \, a)$. Orthogonal projection onto a subspace has no larger norm than projection onto a containing subspace: if $Pi$ projects onto a line contained in $"ran" R$, then $Pi R = Pi$ and $parallel R f parallel^2 gt.eq parallel Pi R f parallel^2 = parallel Pi f parallel^2$. Consequently
  $ parallel y \( v + rho u \) parallel^2 lt.eq parallel R_(a \, b) f parallel^2 \, #h(2em) parallel x \( u + rho v \) parallel^2 lt.eq parallel R_(b \, a) f parallel^2 . $
  Combining these inequalities with (5.10) and (5.6) proves (5.3) on the cell.
  Finally, $E_a \, E_b \, g_(a \, b)$ preserve the cells. So do $R_(a \, b)$ and $R_(b \, a)$, since their defining full pair fibers are contained in the cells. Averaging the conditional inequalities proves the asserted global inequality. ◻
]

We retain the positive term in Proposition 7 to control the two directed error terms after summation. The estimate needed for that step is, for each fixed $a$,

$ sum_(b : thin b ∩ a = diameter) parallel R_(a \, b) f parallel^2 lt.eq sum_(b : thin b ∩ a = diameter) parallel g_(a \, b) f parallel^2 . $

We prove this estimate next, using the uniform subset structure of each $a$-fiber.

== 6 Controlling the equality projections <sl:section>

We now bound the summed errors in Proposition 7. On each pair fiber, equal-assignment indicators are quadratic functions of the subset coordinates. Their span therefore uses only the degree-one and degree-two parts of the Johnson slice decomposition; see Filmus [13] Lemmas 18 and 24. We verify the required identities directly. After the slice comparison, we return to the graph space and sum the disjoint-pair inequalities.

#thm([Lemma 6.1.])[
  (Equality-indicator projections on a slice).  #emph[Let $N gt.eq 0$ and $0 lt.eq q lt.eq N$ be integers. Give 
$ cal(X)_(N \, q) = {x in { 0 \, 1 }^N : med sum_(i = 1)^N x_i = q} $

 the uniform measure. Let $tau_(i j)$ interchange coordinates $i \, j$, and put 
$ G = 1 / 2 sum_(i < j) \( I - tau_(i j) \) . $

 For each pair $i < j$, let $Q_(i j)$ be orthogonal projection onto the centered function 
$ z_(i j) = upright(bold(1))_({ x_i = x_j }) - bb(P) \( x_i = x_j \) \, $

 with the convention $Q_(i j) = 0$ when $z_(i j) = 0$. Then 
#[#set math.equation(numbering: n => "(6.1)")
 $ S := sum_(i < j) Q_(i j) prec.curly.eq G . $ <sl:operator-comparison>]

]
] <sl:comparison>

#proof[
  Each $\( I - tau_(i j) \) \/ 2$ is an orthogonal projection, so $G$ is positive semidefinite. If all the $z_(i j)$ vanish, the assertion follows immediately. This covers $N lt.eq 2$ and $q in { 0 \, N }$. In the remaining cases $N gt.eq 3$ and $1 lt.eq q lt.eq N - 1$. Writing $r = N - q$, we have
  #[#set math.equation(numbering: n => "(6.2)")
   $ p & := bb(P) \( x_i = x_j \) = frac(q \( q - 1 \) + r \( r - 1 \), N \( N - 1 \)) \,\
1 - p & = frac(2 q r, N \( N - 1 \)) \, #h(2em) parallel z_(i j) parallel^2 = p \( 1 - p \) > 0 . $ <sl:p>]
  All norms of functions in this proof use the uniform measure on the slice.
  Let $M = binom(N, 2)$ and give the pair coefficient space $bb(R)^M$ its usual Euclidean inner product. Define
  $ B c = sum_(i < j) c_(i j) z_(i j) / sqrt(p \( 1 - p \)) . $
  Then $S = B B^(*)$. We analyze its Gram matrix $K = B^(*) B$ using the orthogonal decomposition
  $ cal(C)_0 & = { c : med c_(i j) upright(" is constant") } \,\
cal(C)_1 & = {c : med c_(i j) = u_i + u_j \, quad sum_i u_i = 0} \,\
cal(C)_2 & = {c : med sum_(j eq.not i) c_(i j) = 0 upright(" for every ") i} . $
  Here and below $c_(j i) = c_(i j)$. To verify the decomposition, the map $u mapsto \( u_i + u_j \)_(i < j)$ is injective for $N gt.eq 3$: its kernel vanishes on every triangle, and hence on every vertex. Its image is $cal(C)_0 xor cal(C)_1$, and its orthogonal complement is precisely $cal(C)_2$. Thus the dimensions are $1$, $N - 1$, and $M - N$, respectively. In particular $cal(C)_2 = { 0 }$ when $N = 3$.
  The number of equal coordinate pairs is fixed on the slice:
  $ sum_(i < j) upright(bold(1))_({ x_i = x_j }) = binom(q, 2) + binom(r, 2) . $
  It follows that $B$ kills $cal(C)_0$. Permutation invariance shows that the entries of $K$ depend only on the intersection size of their indexing pairs. Moreover, for a fixed pair $i j$, the sums of coefficients over #emph[other] pairs meeting $i j$, and over pairs disjoint from $i j$, are
  $ & upright("intersection of size one") & upright("disjoint")\
c in cal(C)_1 & \( N - 4 \) c_(i j) & - \( N - 3 \) c_(i j)\
c in cal(C)_2 & - 2 c_(i j) & c_(i j) . $
  Indeed, the first column is the sum of the two row sums minus $2 c_(i j)$; the row sums are $\( N - 2 \) u_i$ on $cal(C)_1$ and zero on $cal(C)_2$. The second column follows because both spaces have zero total coefficient sum. For $N = 3$ there are no disjoint pairs, and the displayed expression on $cal(C)_1$ is zero as required. Consequently $K$ acts by a scalar $mu_1$ on $cal(C)_1$ and, when present, by a scalar $mu_2$ on $cal(C)_2$.
  We first compute $mu_1$. The number of coordinates other than $i$ equal to $x_i$ is
  $ sum_(j eq.not i) upright(bold(1))_({ x_i = x_j }) = \( r - 1 \) + \( 2 q - N \) x_i . $
  For $sum_i u_i = 0$ this gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ sum_(i < j) \( u_i + u_j \) z_(i j) = \( 2 q - N \) sum_i u_i x_i . $ <sl:linear-image>]
  The one- and two-coordinate probabilities of a uniform $q$-subset imply
  $ "Var" #h(-0.16667em) (sum_i u_i x_i) = frac(q r, N \( N - 1 \)) sum_i u_i^2 \, #h(2em) sum_(i < j) \( u_i + u_j \)^2 = \( N - 2 \) sum_i u_i^2 . $
  Using these identities and (6.2) in $parallel B c parallel^2 = mu_1 parallel c parallel^2$ yields
  #[#set math.equation(numbering: n => "(6.4)")
   $ mu_1 = frac(\( 2 q - N \)^2, 2 \( N - 2 \) p) lt.eq N / 2 . $ <sl:mu-one>]
  For the inequality, the difference of the relevant numerators is
  $ N \( N - 2 \) p - \( 2 q - N \)^2 = frac(2 N, N - 1) #scale(x: 120%, y: 120%)[\(] q r - \( N - 1 \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 \, $
  since $q \, r gt.eq 1$ and $q + r = N$.
  The diagonal entries of $K$ are all one, so $"tr" K = M$. Since $K$ is positive semidefinite, for $N gt.eq 4$ we obtain
  #[#set math.equation(numbering: n => "(6.5)")
   $ \( M - N \) mu_2 lt.eq M \, #h(2em) 0 lt.eq mu_2 lt.eq frac(N - 1, N - 3) lt.eq N - 1 . $ <sl:mu-two>]
  This argument is used only when $cal(C)_2$ is present.
  To compare with $G$, set $cal(U)_i = B cal(C)_i$ for $i = 1 \, 2$. These images are orthogonal, since $chevron.l B c \, B d chevron.r = chevron.l c \, K d chevron.r$. On $cal(U)_i$ the operator $S = B B^(*)$ acts by $mu_i$; an image may of course be zero. Direct summation of the transpositions gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ G x_i & = frac(N x_i - q, 2) \,\
G \( x_i x_j \) & = \( N - 1 \) x_i x_j - frac(q - 1, 2) \( x_i + x_j \) . $ <sl:G-linear>]
  For the second identity, only swaps involving exactly one of $i \, j$ contribute. Their sum is
  $ \( N - 2 \) x_i x_j - 1 / 2 \( x_i + x_j \) sum_(k in.not { i \, j }) x_k = \( N - 1 \) x_i x_j - frac(q - 1, 2) \( x_i + x_j \) \, $
  using $x_i^2 = x_i$ and $sum_k x_k = q$.
  By (6.3) and (6.6), $G$ acts on $cal(U)_1$ by $N \/ 2$. For $c in cal(C)_2$, the expansion
  $ z_(i j) = 1 - p - x_i - x_j + 2 x_i x_j $
  shows that $B c$ is proportional to $sum_(i < j) c_(i j) x_i x_j$: the constant and linear terms vanish by the row-zero conditions. Those same conditions cancel the linear terms in (6.6), so $G$ acts on $cal(U)_2$ by $N - 1$. Equations (6.4) and (6.5) therefore give $S prec.curly.eq G$ on $cal(U)_1 xor cal(U)_2$. This space is invariant under the self-adjoint $G$, hence so is its orthogonal complement. On that complement $S = 0$, because $B cal(C)_0 = 0$ and the three coefficient spaces exhaust $bb(R)^M$; meanwhile $G succ.curly.eq 0$. This proves (6.1) on the whole slice.
  For clarity, the possible zero images introduce no additional cases: when $q = 1$ or $q = N - 1$, (6.4) gives $mu_1 = N \/ 2$, and the trace identity gives $mu_2 = 0$ if $N gt.eq 4$; when $q = N \/ 2$, $mu_1 = 0$. For $N = 3$ the second image is absent. At $N = 4 \, q = 2$, the trace identity gives $mu_2 = 3 = N - 1$, so the estimate includes this boundary case with equality. ◻
]

#thm([Corollary 6.2.])[
  (Summed equality-indicator energy).  #emph[For every vertex pair $a$ and every function $f$ on the graph space, 
#[#set math.equation(numbering: n => "(6.7)")
 $ sum_(b : thin b ∩ a = diameter) parallel R_(a \, b) f parallel^2 lt.eq sum_(b : thin b ∩ a = diameter) parallel g_(a \, b) f parallel^2 . $ <sl:graph-comparison>]

]
] <sl:global>

#proof[
  Work first in one $a$-fiber, whose assignments form a uniform $q$-subset slice of its $N$ singleton vertices. If both vertices of $b$ are singleton labels $k \, l$, the involution $T_(a \, b)$ acts on this slice exactly as $tau_(k l)$: it interchanges their assignments when they differ and acts trivially when they agree. Thus $g_(a \, b) = \( I - tau_(k l) \) \/ 2$, while $R_(a \, b) = Q_(k l)$ in the notation of Lemma 8. If either vertex of $b$ is not a singleton, the cross matrix cannot have both column sums equal to one, and both $g_(a \, b)$ and $R_(a \, b)$ vanish on the fiber. Since an orthogonal projection $Q$ satisfies $parallel Q f parallel^2 = chevron.l f \, Q f chevron.r$, the two conditional sums in (6.7) are $chevron.l f \, S f chevron.r$ and $chevron.l f \, G f chevron.r$. Lemma 8 compares them. Both operators preserve the complete $a$-fibers, so averaging these conditional inequalities proves the corollary. ◻
]

#thm([Corollary 6.3.])[
  #emph[The ordered sum 
#[#set math.equation(numbering: n => "(6.8)")
 $ D = sum_(a \, b in binom(V, 2)\
a ∩ b = diameter) h_a h_b $ <dis:D>]

 is self-adjoint and positive semidefinite.]
] <dis:nonnegative>

#proof[
  The two orders of every disjoint pair occur in the sum, proving self-adjointness. Grouping them and applying Proposition 7 gives
  $ chevron.l f \, D f chevron.r & gt.eq sum_({ a \, b } : thin a ∩ b = diameter) #scale(x: 120%, y: 120%)[\(] 2 parallel g_(a \, b) f parallel^2 - parallel R_(a \, b) f parallel^2 - parallel R_(b \, a) f parallel^2 #scale(x: 120%, y: 120%)[\)]\
 & = sum_(a in binom(V, 2)) (sum_(b : thin a ∩ b = diameter) parallel g_(a \, b) f parallel^2 - sum_(b : thin a ∩ b = diameter) parallel R_(a \, b) f parallel^2) gt.eq 0 . $
  The first sum is over unordered pairs of disjoint vertex pairs; the equality uses $g_(a \, b) = g_(b \, a)$. The last inequality is Corollary 9, applied separately for each $a$. ◻
]

== 7 From pair resampling to the switch chain <mix:section>

We now combine the local estimates, identify the kernel of the resulting operator, and compare it with the chain in Theorem 1.

=== 7.1 The global operator inequality <the-global-operator-inequality>

We use the triangle regrouping of Caputo’s squared-generator method [2] Section 1.1, Equations (1.13)–(1.15). The exact correction counts how often each pair belongs to a triple. Here Corollary 10 supplies the disjoint-term positivity that commutation supplies in that framework.

#thm([Proposition 7.1.])[
  #emph[The pair-resampling operator satisfies 
#[#set math.equation(numbering: n => "(7.1)")
 $ H^2 succ.curly.eq H . $ <mix:H-square>]

]
] <mix:global>

#proof[
  Let $D$ be the ordered disjoint-pair sum from Equation (6.8). Every ordered pair of distinct intersecting vertex pairs belongs to the unique triple formed by their union. Each single vertex pair belongs to $n - 2$ triples, and $h_a^2 = h_a$. Expanding the squares therefore gives the exact identity
  #[#set math.equation(numbering: n => "(7.2)")
   $ H^2 = sum_(T in binom(V, 3)) H_T^2 - \( n - 3 \) H + D . $ <mix:expansion>]
  Proposition 6 and Corollary 10 imply
  $ H^2 succ.curly.eq sum_(T in binom(V, 3)) H_T - \( n - 3 \) H = \( n - 2 \) H - \( n - 3 \) H = H . $
  ◻
]

=== 7.2 Connectivity and the kernel <connectivity-and-the-kernel>

We give a direct connectivity argument to ensure that the operator bound controls every centered function. It uses Havel’s classical degree-realization switching argument [18] Theorem 3, with deterministic tie-breaking to select the same realization from every starting graph.

#thm([Lemma 7.2.])[
  #emph[Any two graphs in $Omega_d$ can be joined by a sequence of valid switches.]
] <mix:connectivity>

#proof[
  We transform every realization into the same recursively prescribed graph. Suppose a set of vertices has already been frozen, and let $R$ be the remaining vertex set. The edges involving frozen vertices will no longer change. Write $d_i^R$ for the degrees in the current induced graph on $R$.
  Choose the first vertex $v in R$ in label order. Prescribe its desired neighbors to be the $d_v^R$ vertices of $R \\ { v }$ of highest residual degree, breaking ties by label. If the current neighbors differ from this prescribed set, there are a missing desired neighbor $j$ and an undesired neighbor $i$. Their residual degrees satisfy $d_j^R gt.eq d_i^R$. With neighborhoods taken in the induced graph on $R$, put
  $ A = N_R \( j \) \\ { i } \, #h(2em) B = N_R \( i \) \\ { j } . $
  Removing a possible edge $i j$ subtracts the same amount from both neighborhood sizes, so $\| A \| gt.eq \| B \|$. Moreover $v in B \\ A$. Consequently $A \\ B$ is nonempty. A vertex $k$ in this set is distinct from $v \, i \, j$, and the membership conditions say precisely that $v i \, j k$ are edges while $v j \, i k$ are absent. The valid switch
  $ { v i \, j k } mapsto { v j \, i k } $
  changes no other edge at $v$, so it retains every previously attained desired neighbor and increases their number by one. Repetition therefore realizes the prescribed neighborhood. If fewer than four residual vertices remain, a discrepancy would still force the four distinct vertices just constructed; hence no discrepancy can occur.
  Freeze $v$ and continue on $R \\ { v }$. Its residual degree vector is now determined by the previous vector and the prescribed neighborhood, independently of the starting realization. It is graphical because the current graph realizes it. Inductively, the prescription fixes the same edges from every starting graph. All switches occur entirely among unfrozen vertices, and the procedure terminates after all vertices are frozen. Thus every realization is connected to the same graph. Reversing one of these paths proves the claim. ◻
]

#thm([Corollary 7.3.])[
  #emph[The kernel of $H$ consists exactly of the constant functions. For every real function $f$ on $Omega_d$, 
#[#set math.equation(numbering: n => "(7.3)")
 $ "Var"_(pi_d) \( f \) lt.eq chevron.l f \, H f chevron.r . $ <mix:H-poincare>]

]
] <mix:poincare>

#proof[
  Since the $h_a$ are orthogonal projections,
  $ chevron.l f \, H f chevron.r = sum_(a in binom(V, 2)) parallel h_a f parallel^2 . $
  Its vanishing forces $f$ to be constant on every pair fiber. Every valid switch exchanges two singleton assignments in a pair fiber: take either opposite vertex pair of the toggled four-cycle. Thus $f$ is constant along switches, and Lemma 12 makes it constant on $Omega_d$. The converse is immediate.
  The operator $H$ is positive semidefinite. By Proposition 11, each eigenvalue $lambda$ satisfies $lambda^2 gt.eq lambda$, and hence is either zero or at least one. Its kernel has just been identified, so its restriction to the centered subspace is bounded below by the identity. Subtracting the mean of $f$ gives Equation (7.3). ◻
]

=== 7.3 Comparison with single switches <comparison-with-single-switches>

We compare a whole-fiber resampling with exchanges of two singleton assignments inside that fiber. This is the fiberwise heat-bath comparison principle used by Carstens and Kleer for bipartite switch and Curveball chains [5] Theorems 2 and 7 and Appendix A. The argument below proves the required undirected comparison with its own constant and counts the multiplicity of each switch.

Let $L$ be the unnormalized Laplacian of the switch graph:

#[#set math.equation(numbering: n => "(7.4)")
 $ \( L f \) \( G \) = sum_(G' upright(" a switch neighbor of ") G) #scale(x: 120%, y: 120%)[\(] f \( G \) - f \( G' \) #scale(x: 120%, y: 120%)[\)] . $ <mix:L>]

Each distinct neighbor appears once in this sum.

For a vertex pair $a$, define $J_a$ on each of its fibers by

$ J_a = sum_(1 lt.eq k < ell lt.eq N) \( I - tau_(k ell) \) \, $

where the $N$ singleton vertices have been indexed and $tau_(k ell)$ exchanges their assignments. Combining these operators over all fibers defines $J_a$ on the full graph space.

#thm([Lemma 7.4.])[
  #emph[The operators above satisfy 
#[#set math.equation(numbering: n => "(7.5)")
 $ h_a prec.curly.eq n^2 J_a \, #h(2em) sum_(a in binom(V, 2)) J_a = 2 L \, #h(2em) H prec.curly.eq 2 n^2 L . $ <mix:comparison-bounds>]

]
] <mix:comparison>

#proof[
  First work in one nonconstant uniform $q$-subset fiber with $N$ singleton labels. Let $S_0$ be a uniform $q$-subset and let $sigma$ be an independent uniform permutation of the $N$ labels. Then $sigma S_0$ is uniform and independent of $S_0$, so
  $ "Var" \( f \) = 1 / 2 bb(E) #scale(x: 120%, y: 120%)[\(] f \( S_0 \) - f \( sigma S_0 \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Fix, for each permutation, a decomposition into at most $N$ transpositions, obtained for example by decomposing its cycles. Pad with identities to length $N$. Conditional on $sigma$, every intermediate subset is uniform. Cauchy–Schwarz along the resulting path gives
  $ "Var" \( f \) & lt.eq N^2 / 2 sum_(k < ell) bb(E)_(upright("slice")) #scale(x: 120%, y: 120%)[\(] f - tau_(k ell) f #scale(x: 120%, y: 120%)[\)]^2\
 & = N^2 ⟨f \, sum_(k < ell) \( I - tau_(k ell) \) f⟩ . $
  Indeed, Cauchy–Schwarz costs a factor $N$, and each of the $N$ steps has conditional squared difference bounded by the sum of all transposition squared differences displayed above. Identity steps contribute zero. Constant fibers require no estimate. Since $N lt.eq n$, averaging over fibers proves $h_a prec.curly.eq n^2 J_a$.
  Each switch has two pair-trade realizations, as observed in Lemma 2 of [4]. To check this count in the present notation, consider a particular transition
  $ { u v \, x y } mapsto { u x \, v y } . $
  The four distinct vertices form the toggled cycle $u \, v \, y \, x \, u$. Taking $a = { u \, y }$ exchanges the assignments of singleton vertices $v \, x$; taking $a = { v \, x }$ exchanges those of singleton vertices $u \, y$. These are two occurrences of this transition. They are also the only ones: a singleton transposition toggles precisely the four edges between its indexing pair and the two exchanged singleton vertices. Thus its indexing pair must be one of the two parts of the unique bipartition of the toggled four-cycle. Each choice determines its transposition uniquely. It follows pointwise that $sum_a J_a = 2 L$. Summing the first comparison now proves the last one. ◻
]

Combining Corollary 13 and Lemma 14, we obtain

#[#set math.equation(numbering: n => "(7.6)")
 $ "Var"_(pi_d) \( f \) lt.eq 2 n^2 chevron.l f \, L f chevron.r . $ <mix:L-poincare>]

In particular, if $\| Omega_d \| > 1$, the spectral gap of $L$ is at least $1 \/ \( 2 n^2 \)$.

=== 7.4 The prescribed chain and its mixing time <the-prescribed-chain-and-its-mixing-time>

#proof[
  If $\| Omega_d \| = 1$, the mixing time is zero. Suppose henceforth that $\| Omega_d \| > 1$. For any distinct switch neighbors $G \, G'$, their transition uniquely specifies its four-element vertex set and the ordered pair of removed and added matchings. Under the proposal rule of Section 1,
  $ P_d \( G \, G' \) = 1 / 2 thin 1 / binom(n, 4) thin 1 / 6 = frac(1, 12 binom(n, 4)) . $
  The reverse transition has the same probability, so $pi_d$ is reversible, and the diagonal probabilities give
  #[#set math.equation(numbering: n => "(7.7)")
   $ I - P_d = frac(L, 12 binom(n, 4)) . $ <mix:normalization>]
  By Equation (7.6), the spectral gap of $P_d$ is at least
  #[#set math.equation(numbering: n => "(7.8)")
   $ gamma_0 = frac(1, 24 n^2 binom(n, 4)) . $ <mix:gamma>]
  The holding probability also ensures nonnegative eigenvalues: write $P_d = \( I + Q \) \/ 2$, where $Q$ is the reversible Markov kernel consisting of the proposal step, including rejected proposals. Jensen’s inequality and stationarity show that $Q$ is a contraction on $L^2 \( pi_d \)$, so its eigenvalues lie in $\[ - 1 \, 1 \]$. Thus every eigenvalue of $P_d$ on the centered subspace lies in $\[ 0 \, 1 - gamma_0 \]$, and for a centered function $f$,
  $ parallel P_d^t f parallel lt.eq \( 1 - gamma_0 \)^t parallel f parallel lt.eq e^(- gamma_0 t) parallel f parallel . $
  The density of a point mass at $G$, minus one, has squared norm $\| Omega_d \| - 1$. Reversibility evolves this density by $P_d$. Therefore Cauchy–Schwarz yields, uniformly over starting states,
  #[#set math.equation(numbering: n => "(7.9)")
   $ parallel P_d^t \( G \, dot.op \) - pi_d parallel_(upright("TV")) lt.eq 1 / 2 sqrt(\| Omega_d \|) thin e^(- gamma_0 t) . $ <mix:TV>]
  In particular, total variation is at most $1 \/ 4$ when
  $ t = ⌈24 n^2 binom(n, 4) (log 2 + 1 / 2 log \| Omega_d \|)⌉ . $
  Here and throughout, logarithms are natural. Since there are at most $2^(binom(n, 2))$ labeled simple graphs,
  $ log 2 + 1 / 2 log \| Omega_d \| lt.eq (1 + frac(n \( n - 1 \), 4)) log 2 lt.eq n^2 #h(2em) \( n gt.eq 4 \) . $
  Also $24 n^2 binom(n, 4) lt.eq n^6$. The displayed time is consequently at most $n^8 + 1 lt.eq 2 n^8$, as claimed. ◻
]

== 8 Exact uniform sampling <sec:exact-sampling>

We use the rare residual-mixture construction of Göbel, Liu, Manurangsi, and Pappik [15] Section 3.1, Algorithm 1 and Theorem 6. Their Corollary 15 computes the approximate law by powers of the transition matrix. Exact tabulation is also used in the contingency-table sampler [23] Sections 6.3–6.4. Here we establish the tabulation and bit-cost bounds directly for the rational switch chain.

The idea is to sample from a very accurate finite-time law $p$ most of the time, and to correct its remaining bias on a rare branch. For a suitably small $delta > 0$, we will have $\( 1 - delta \) p lt.eq pi_d$ pointwise. Then

$ r = frac(pi_d - \( 1 - delta \) p, delta) $

is a probability law, and the mixture $\( 1 - delta \) p + delta r$ is exactly $pi_d$. Only the branch of probability $delta$ enumerates the state space and tabulates $p$ to sample from $r$. We choose $delta$ exponentially small enough to pay for that enumeration in expectation; the chain still reaches the required accuracy in polynomially many steps.

#proof[
  We use the usual explicit binary encoding of the degree vector, with delimiters between its entries. Let $n$ be the number of entries of $d$. For $n < 4$, enumerate the at most $2^3$ simple graphs and retain those with the specified labeled degrees. The unbiased integer draw described below samples uniformly from this nonempty constant-size set. We may therefore assume $n gt.eq 4$ and use the notation of Section 1. Havel’s greedy degree-realization procedure [18], with deterministic tie-breaking, constructs one graph $G_0 in Omega_d$ in polynomial bit time.
  ===== 8.1 An accurate rational law. <an-accurate-rational-law.>
  Set
  #[#set math.equation(numbering: n => "(8.1)")
   $ B = binom(n, 2) \, #h(2em) M = \| Omega_d \| lt.eq 2^B \, #h(2em) q = 12 binom(n, 4) \,\
D = 4 B + 10 \, #h(2em) delta = 2^(- D) \, #h(2em) t = ⌈gamma_0^(- 1) \( B + 2 D + 2 \)⌉ \, $ <exact:parameters>]
  where $gamma_0 = \[ 24 n^2 binom(n, 4) \]^(- 1)$ is from Equation (7.8). Thus $D = O \( n^2 \)$ and $t = O \( n^8 \)$. Write $p_G = P_d^t \( G_0 \, G \)$. If $M > 1$, Equation (7.9) gives
  $ parallel p - pi_d parallel_(upright("TV")) lt.eq 1 / 2 sqrt(M) thin e^(- gamma_0 t) lt.eq 1 / 2 thin 2^(B \/ 2) e^(- \( B + 2 D + 2 \)) lt.eq 2^(- 2 D) = delta^2 . $
  The last inequality follows from $2 < e$ and $B \, D gt.eq 0$. If $M = 1$, then $p = pi_d$, so the same bound holds. Applying total variation to the singleton event ${ G }$ gives $p_G lt.eq 1 \/ M + delta^2$. Since $M delta lt.eq 2^(B - D) lt.eq 1$,
  #[#set math.equation(numbering: n => "(8.2)")
   $ \( 1 - delta \) p_G lt.eq frac(1 - delta, M) + \( 1 - delta \) delta^2 lt.eq 1 / M #h(2em) \( G in Omega_d \) . $ <exact:domination>]
  The parameters in Equation (8.1), apart from the analytical quantity $M$, are computable from $n$ in polynomial bit time. The ordinary sampling branch below does not need to know $M$.
  For distinct $G \, H$, the proof of Theorem 1 shows that $q P_d \( G \, H \)$ is one for switch neighbors and zero otherwise. The row sum identity gives
  $ q P_d \( G \, G \) = q - \| { H eq.not G : H upright(" is a switch neighbor of ") G } #scale(x: 120%, y: 120%)[\|] \, $
  which is also a nonnegative integer. Hence $A = q P_d$ is a nonnegative integer matrix whose rows sum to $q$. Starting with the integer point mass $a^(\( 0 \))$ at $G_0$, define
  #[#set math.equation(numbering: n => "(8.3)")
   $ a^(\( s + 1 \)) = a^(\( s \)) A quad \( 0 lt.eq s < t \) . #h(2em) p_G = a_G^(\( t \)) / q^t \, #h(2em) sum_(G in Omega_d) a_G^(\( t \)) = q^t . $ <exact:law>]
  All numerators are nonnegative integers.
  We can tabulate this law exactly when needed. Enumerate all $2^B$ adjacency bit strings and retain exactly those whose labeled degrees are $d$; this also computes $M$. Each degree test has polynomial bit cost. For every retained pair of graphs, the switch-neighbor test and the corresponding entry of $A$ are computable in polynomial bit time. Dense propagation in Equation (8.3) uses at most $t M^2$ integer multiply-add operations. At step $s$, every numerator and every partial nonnegative sum is at most $q^s$ or $q^(s + 1)$, respectively. Their bit lengths are therefore $O \( t log q \)$, which is polynomial in $n$. With, for example, schoolbook integer arithmetic, the complete enumeration and tabulation cost at most
  #[#set math.equation(numbering: n => "(8.4)")
   $ 2^(2 B) "poly" \( n \) $ <exact:tabulation-cost>]
  bit operations. The enumerated graph universe depends only on $n$, not on the accuracy parameter $D$.
  ===== 8.2 Exact correction. <exact-correction.>
  We first specify the elementary random choice used throughout. For an integer $K gt.eq 1$, a uniform element of ${ 0 \, dots.h \, K - 1 }$ is obtained by drawing $ceil.l log_2 K ceil.r$ independent unbiased bits and repeating if the resulting integer is at least $K$; for $K = 1$ use zero bits. Each attempt succeeds with probability greater than $1 \/ 2$, except that a power of two succeeds with probability one. The draw is exact, terminates almost surely, and uses fewer than two attempts in expectation. An attempt has bit cost polynomial in $log \( K + 1 \)$.
  Draw $D$ fresh unbiased bits. If they are not all zero, run exactly $t$ steps of $P_d$ from $G_0$ and output the resulting graph. Each step uses one bit for the holding decision and the preceding integer draw to choose a uniform four-element vertex set and one of the six ordered matching pairs. A four-set can be selected by unranking its index in the lexicographic list, in polynomial bit time. This implements $P_d$ exactly. The branch has output law $p$, terminates almost surely, and has expected polynomial bit cost.
  If the $D$ bits are all zero, perform the exact tabulation above and write $a_G = a_G^(\( t \))$. Form the integer weights
  #[#set math.equation(numbering: n => "(8.5)")
   $ w_G = 2^D q^t - M \( 2^D - 1 \) a_G \, #h(2em) sum_(G in Omega_d) w_G = M q^t . $ <exact:weights>]
  They are nonnegative by Equation (8.2); their sum uses $sum_G a_G = q^t$. Their bit lengths are $O \( D + t log q + log M \)$, again polynomial in $n$. Draw a uniform integer in ${ 0 \, dots.h \, M q^t - 1 }$ and select its interval in the cumulative weights $w_G$. This samples exactly the probability law
  $ r_G = frac(w_G, M q^t) = frac(1 \/ M - \( 1 - delta \) p_G, delta) . $
  Use fresh random bits in all draws after the branch decision. The correction branch has probability $delta$, so the output law is
  #[#set math.equation(numbering: n => "(8.6)")
   $ \( 1 - delta \) p_G + delta r_G = 1 / M #h(2em) \( G in Omega_d \) . $ <exact:mixture>]
  Thus the output is exactly uniform.
  ===== 8.3 Bit cost and termination. <bit-cost-and-termination.>
  Every enumeration and integer computation on the correction branch is finite. All rejection draws terminate almost surely; only finitely many such draws are invoked on either branch. Hence the complete algorithm terminates almost surely. The preprocessing, branch choice, and ordinary branch have expected polynomial bit cost. By Equation (8.4), the conditional expected cost of the correction branch, including its final exact integer draw and cumulative scan, is at most $2^(2 B) "poly" \( n \)$. Its contribution to the unconditional expectation is
  $ delta thin 2^(2 B) "poly" \( n \) = 2^(- 2 B - 10) "poly" \( n \) lt.eq "poly" \( n \) . $
  All loops, graph tests, and integer computations are specified by one algorithm, and the input explicitly lists $n$ degrees. The resulting expected bit bound is therefore a fixed polynomial in the input length. The correction branch may take exponential time, and the rejection draws have unbounded tails; the conclusion is an expected bound, not a polynomial bound on every execution. ◻
]

#heading(level: 1)[References]
#bibitem([1])[G.~Amanatidis and P.~Kleer, #emph[Rapid mixing of the switch Markov chain for strongly stable degree sequences], Random Structures & Algorithms #strong[57] (2020), no.~3, 637--657. #link("https://doi.org/10.1002/rsa.20949")[doi:10.1002/rsa.20949].]
#bibitem([2])[P.~Caputo, #emph[On the spectral gap of the Kac walk and other binary collision processes], ALEA. Latin American Journal of Probability and Mathematical Statistics #strong[4] (2008), 205--222. #link("https://alea.impa.br/articles/v4/04-10.pdf")[Primary article].]
#bibitem([3])[E.~Carlen, E.~H.~Lieb, and M.~Loss, #emph[An Inequality of Hadamard Type for Permanents], Methods and Applications of Analysis #strong[13] (2006), no.~1, 1--18. #link("https://arxiv.org/abs/math/0508096v1")[arXiv:math/0508096v1].]
#bibitem([4])[C.~J.~Carstens, A.~Berger, and G.~Strona, #emph[A unifying framework for fast randomization of ecological networks with fixed (node) degrees], MethodsX #strong[5] (2018), 773--780. #link("https://doi.org/10.1016/j.mex.2018.06.018")[doi:10.1016/j.mex.2018.06.018]. Extended version: #link("https://arxiv.org/abs/1609.05137v3")[arXiv:1609.05137v3]. Numbered sections and lemmas cited here refer to the extended version.]
#bibitem([5])[C.~J.~Carstens and P.~Kleer, #emph[Speeding up Switch Markov Chains for Sampling Bipartite Graphs with Given Degree Sequence], Approximation, Randomization, and Combinatorial Optimization. Algorithms and Techniques (APPROX/RANDOM 2018), Leibniz International Proceedings in Informatics #strong[116], 36:1--36:18. #link("https://doi.org/10.4230/LIPIcs.APPROX-RANDOM.2018.36")[doi:10.4230/LIPIcs.APPROX-RANDOM.2018.36].]
#bibitem([6])[C.~Cooper, M.~Dyer, and C.~Greenhill, #emph[Sampling regular graphs and a peer-to-peer network], Combinatorics, Probability and Computing #strong[16] (2007), no.~4, 557--593. #link("https://doi.org/10.1017/S0963548306007978")[doi:10.1017/S0963548306007978].]
#bibitem([7])[C.~Cooper, M.~Dyer, and C.~Greenhill, #emph[Corrigendum: Sampling regular graphs and a peer-to-peer network], preprint (2012), #link("https://arxiv.org/abs/1203.6111v1")[arXiv:1203.6111v1].]
#bibitem([8])[M.~Dyer, C.~Greenhill, and M.~Ullrich, #emph[Structure and eigenvalues of heat-bath Markov chains], Linear Algebra and its Applications #strong[454] (2014), 57--71. #link("https://doi.org/10.1016/j.laa.2014.04.018")[doi:10.1016/j.laa.2014.04.018].]
#bibitem([9])[P.~L.~Erdős, C.~Greenhill, T.~R.~Mezei, I.~Miklós, D.~Soltész, and L.~Soukup, #emph[The mixing time of switch Markov chains: a unified approach], European Journal of Combinatorics #strong[99] (2022), 103421. #link("https://doi.org/10.1016/j.ejc.2021.103421")[doi:10.1016/j.ejc.2021.103421]. #link("https://arxiv.org/abs/1903.06600v5")[arXiv:1903.06600v5].]
#bibitem([10])[P.~L.~Erdős, G.~Lippner, N.~Nevo, and L.~Soukup, #emph[Any fully graphic region of degree sequences can be sampled rapidly], preprint (2025), #link("https://arxiv.org/abs/2511.13564v1")[arXiv:2511.13564v1].]
#bibitem([11])[P.~L.~Erdős, I.~Miklós, and L.~Soukup, #emph[Fully graphic degree sequences and P-stable degree sequences], Advances in Applied Mathematics #strong[163] (2025), 102805. #link("https://doi.org/10.1016/j.aam.2024.102805")[doi:10.1016/j.aam.2024.102805].]
#bibitem([12])[T.~Feder, A.~Guetz, M.~Mihail, and A.~Saberi, #emph[A Local Switch Markov Chain on Given Degree Graphs with Application in Connectivity of Peer-to-Peer Networks], Proceedings of the 47th Annual IEEE Symposium on Foundations of Computer Science (FOCS 2006), 69--76. #link("https://doi.org/10.1109/FOCS.2006.5")[doi:10.1109/FOCS.2006.5].]
#bibitem([13])[Y.~Filmus, #emph[An Orthogonal Basis for Functions over a Slice of the Boolean Hypercube], Electronic Journal of Combinatorics #strong[23] (2016), no.~1, P1.23. #link("https://doi.org/10.37236/4567")[doi:10.37236/4567].]
#bibitem([14])[W.~Fu, Q.~Qin, and G.~Wang, #emph[Spectral Gap for the Binary Fixed-Margin Swap Chain], preprint (2026), #link("https://arxiv.org/abs/2606.22636v2")[arXiv:2606.22636v2].]
#bibitem([15])[A.~Göbel, J.~Liu, P.~Manurangsi, and M.~Pappik, #emph[Perfect sampling from rapidly mixing Markov chains], preprint (2024), #link("https://arxiv.org/abs/2410.00882v2")[arXiv:2410.00882v2], version~2, December~6, 2024.]
#bibitem([16])[C.~Greenhill, #emph[The switch Markov chain for sampling irregular graphs], Proceedings of the Twenty-Sixth Annual ACM-SIAM Symposium on Discrete Algorithms (SODA 2015), 1564--1572. #link("https://doi.org/10.1137/1.9781611973730.103")[doi:10.1137/1.9781611973730.103].]
#bibitem([17])[C.~Greenhill and M.~Sfragara, #emph[The switch Markov chain for sampling irregular graphs and digraphs], Theoretical Computer Science #strong[719] (2018), 1--20. #link("https://doi.org/10.1016/j.tcs.2017.11.010")[doi:10.1016/j.tcs.2017.11.010]. #link("https://arxiv.org/abs/1701.07101v2")[arXiv:1701.07101v2].]
#bibitem([18])[V.~Havel, #emph[Poznámka o existenci konečných grafů] \[A remark on the existence of finite graphs\], Časopis pro pěstování matematiky #strong[80] (1955), no.~4, 477--480. #link("https://doi.org/10.21136/CPM.1955.108220")[doi:10.21136/CPM.1955.108220].]
#bibitem([19])[M.~Jerrum, B.~D.~McKay, and A.~Sinclair, #emph[When is a graphical sequence stable?], in A.~Frieze and T.~Łuczak (eds.), Random Graphs, vol.~2, Wiley, 1992. #link("https://users.cecs.anu.edu.au/~bdm/papers/DegSeqStable.pdf")[Author-hosted copy].]
#bibitem([20])[M.~Jerrum and A.~Sinclair, #emph[Fast uniform generation of regular graphs], Theoretical Computer Science #strong[73] (1990), no.~1, 91--100. #link("https://doi.org/10.1016/0304-3975(90)90164-D")[doi:10.1016/0304-3975(90)90164-D].]
#bibitem([21])[R.~Kannan, P.~Tetali, and S.~Vempala, #emph[Simple Markov-chain algorithms for generating bipartite graphs and tournaments], Random Structures & Algorithms #strong[14] (1999), no.~4, 293--308. #link("https://doi.org/10.1002/(SICI)1098-2418(199907)14:4%3C293::AID-RSA1%3E3.0.CO;2-G")[doi:10.1002/(SICI)1098-2418(199907)14:4\<293::AID-RSA1\>3.0.CO;2-G]. An extended abstract appeared in Proceedings of SODA 1997, pp.~193--200.]
#bibitem([22])[OpenAI, #emph[A Fully Polynomial Randomized Approximation Scheme for Perfect Matchings in General Graphs], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/A-Fully-Polynomial-Randomized-Approximation-Scheme-for-Perfect-Matchings-in-General-Graphs-September-23-2026/main.pdf")[OAI:A-Fully-Polynomial-Randomized-Approximation-Scheme-for-Perfect-Matchings-in-General-Graphs-September-23-2026], 2026.]
#bibitem([23])[OpenAI, #emph[Exact Uniform Sampling of Contingency Tables with Arbitrary Margins], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Exact-Uniform-Sampling-of-Contingency-Tables-with-Arbitrary-Margins-September-24-2026/main.pdf")[OAI:Exact-Uniform-Sampling-of-Contingency-Tables-with-Arbitrary-Margins-September-24-2026], 2026.]
#bibitem([24])[G.~Strona, D.~Nappo, F.~Boccacci, S.~Fattorini, and J.~San-Miguel-Ayanz, #emph[A fast and unbiased procedure to randomize ecological binary matrices with fixed row and column totals], Nature Communications #strong[5] (2014), 4114. #link("https://doi.org/10.1038/ncomms5114")[doi:10.1038/ncomms5114].]
#bibitem([25])[G.~Strona, D.~Nappo, F.~Boccacci, S.~Fattorini, and J.~San-Miguel-Ayanz, #emph[Corrigendum: A fast and unbiased procedure to randomize ecological binary matrices with fixed row and column totals], Nature Communications #strong[7] (2016), 13086. #link("https://doi.org/10.1038/ncomms13086")[doi:10.1038/ncomms13086].]
#bibitem([26])[N.~D.~Verhelst, #emph[An efficient MCMC algorithm to sample binary matrices with fixed marginals], Psychometrika #strong[73] (2008), no.~4, 705--728. #link("https://doi.org/10.1007/s11336-008-9062-3")[doi:10.1007/s11336-008-9062-3].]


