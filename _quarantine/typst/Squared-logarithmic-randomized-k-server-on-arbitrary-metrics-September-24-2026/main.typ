#set page(paper: "us-letter", margin: (x: 76.5pt, y: 76.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Squared-logarithmic randomized $k$-server \
on arbitrary metrics]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The $k$-server problem asks how to move $k$ servers in a metric space when requests arrive one at a time. A request is a point that must be occupied by a server; the cost is the distance moved. The offline optimum knows all future requests, whereas an online policy must decide from the revealed prefix. We determine the sharp worst-case order of the randomized competitive ratio.

More precisely, let $\( X \, d \)$ be a metric space and let $s = \( s_1 \, dots.h \, s_k \) in X^k$ be the initial positions of $k$ labeled servers. Repeated positions are allowed. To serve $r_t$, a policy chooses one server and moves it to $r_t$, leaving all others fixed. A server already at $r_t$ can be chosen at zero cost. For a finite request sequence $sigma$, let $"cost"_(A \, s) \( sigma \)$ be a policy’s total movement and let $"OPT"_(X \, d \, k \, s) \( sigma \)$ be the minimum such cost with full knowledge of $sigma$. Requests are fixed independently of the policy’s random choices, the usual oblivious-adversary model.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C < oo$ such that, for every integer $k gt.eq 2$, every metric space $\( X \, d \)$ with at least $k + 1$ points, and every $s in X^k$, there exist a randomized online policy $A$ and a finite $B gt.eq 0$ satisfying 
#[#set math.equation(numbering: n => "(1.1)")
 $ bb(E) thin "cost"_(A \, s) \( sigma \) lt.eq C #scale(x: 120%, y: 120%)[\(] log \( k + 1 \) #scale(x: 120%, y: 120%)[\)]^2 "OPT"_(X \, d \, k \, s) \( sigma \) + B $ <eq:main>]

 for every finite request sequence $sigma$. The constant $C$ is independent of every property of the metric. The number $B$ may depend on $\( X \, d \) \, k \, s$, but not on the sequence or its length. The same policy serves all finite sequences and horizons. If the initial positions are distinct, one may take $B = 0$.]
] <thm:main>

There is no finiteness, boundedness, or discreteness assumption on $X$, and no computational-efficiency claim for the policy. Throughout, logarithms are natural.

=== 1.1 Context and previous work <context-and-previous-work>

Manasse, McGeoch, and Sleator introduced the $k$-server problem as a common framework for online service problems #cite(label("MMS88")) #cite(label("MMS90")). They proved the deterministic lower bound $k$ on every metric with more than $k$ points and conjectured that it is attainable. Koutsoupias and Papadimitriou established the $\( 2 k - 1 \)$-competitive work function algorithm #cite(label("KP95")). A recent preprint of Coester, Koutsoupias, and Zbysiński announces a $k$-competitive analysis of that algorithm #cite(label("CKZ26")). The present paper concerns the different asymptotic behavior made possible by randomization against oblivious requests.

Paging, the case of a uniform metric, gave the basic reason to expect such an improvement. Fiat, Karp, Luby, McGeoch, Sleator, and Young proved a harmonic lower bound and a $2 H_k$-competitive randomized marking algorithm #cite(label("FKLMSY91")); McGeoch and Sleator attained the exact bound $H_k = sum_(i = 1)^k i^(- 1)$ #cite(label("MS91")). For weighted paging, Bansal, Buchbinder, and Naor obtained the optimal order $O \( log k \)$ through a fractional primal-dual algorithm and online rounding #cite(label("BBN12")). These results formed part of the evidence for the folklore randomized $k$-server conjecture, which predicted $O \( log k \)$ on every metric.

That conjecture was disproved by Bubeck, Coester, and Rabani #cite(label("BCR23")) Theorem 11 and Proposition 8: there exist $\( k + 1 \)$-point metrics requiring competitive ratio $Omega \( log^2 k \)$, even allowing a fixed additive constant. Their result must be distinguished from a lower bound on every metric. The latter developed through the decomposition and metric Ramsey methods of Karloff, Rabani, and Ravid #cite(label("KRR94")), Blum, Karloff, Rabani, and Saks #cite(label("BKRS00")), Bartal, Bollobás, and Mendel #cite(label("BBM06")), and Bartal, Linial, Mendel, and Naor #cite(label("BLMN05")); Bubeck, Coester, and Rabani ultimately obtained the sharp universal order $Omega \( log k \)$ #cite(label("BCR23")) Corollary 20. Theorem 1 matches the larger, worst-case lower bound. It establishes the sharp squared-logarithmic order after the negative resolution of the original logarithmic conjecture.

The main upper-bound approach passes through hierarchically separated trees. Bartal introduced probabilistic approximation by these metrics #cite(label("Bartal96")) #cite(label("Bartal98")), and Fakcharoenphol, Rao, and Talwar obtained expected distortion $O \( log n \)$ for $n$-point metrics #cite(label("FRT04")). Recursive allocation methods were developed by Coté, Meyerson, and Poplawski #cite(label("CMP08")) and by Bansal, Buchbinder, and Naor #cite(label("BBN10")). Bansal, Buchbinder, Mądry, and Naor then gave the first polylogarithmic bound for arbitrary finite metrics, $O \( log^2 k thin log^3 n thin log log n \)$ #cite(label("BBMN15")). Bubeck, Cohen, Lee, Lee, and Mądry achieved $O \( log^2 k \)$ on HSTs using multiscale entropic regularization #cite(label("BCLLM18")). The static embedding reduction yields $O \( log^2 k log n \)$ on general finite metrics. Its dependence on $n$ does not give a bound in $k$ alone. Coester and Cosson recently made the HST and finite-metric bounds polynomial-time, using a total number of random bits independent of the request length #cite(label("CoesterCosson2026")) Theorem 1 and Corollary 2. Their general finite-metric ratio retains the factor $log n$.

Changing the embedding as requests arrive is also an established direction. The dynamic construction of #cite(label("BCLLM18")) Section 4 gives $O \( log^3 k log \( 1 + Delta \) \)$ on finite metrics, where $Delta$ is the ratio of the largest distance to the smallest positive distance. Lee’s evolving, fusible HST framework used heavy-ball nets to merge clusters near concentrated mass and introduced a fission potential intended to pay for later splits #cite(label("Lee18")) Sections 3.1.2–3.2 and 5.3. Its general competitive-ratio claim was withdrawn after a gap in Section 5.3.2 #cite(label("LeeErratum")). Heavy-ball protection and accounting for changing partitions are methodological antecedents of our construction. Here the partition schedule is driven by the posterior measure of a hidden comparator; it produces a fixed tree of label strings. We prove the required edit and retained-anchor travel estimates in Sections 7 and 8, without invoking a theorem from the withdrawn argument.

Subtree-rank coordinates, internal supermeasures, and fractional-to-integral transfer already play central roles in #cite(label("BBMN15")) #cite(label("BCLLM18")). The use of local ball-mass ratios and their telescoping across scales has a geometric predecessor in measured descent #cite(label("KLMN05")) Lemma 1.7 and Section 1.3. The distributional estimates are converted into a single policy by finite minimax and product compactness.

=== 1.2 Main ingredients <main-ingredients>

We first establish a finite distributional bound. Given a known law of requests, select one offline optimum for each input and use only its posterior distributions conditional on the revealed prefix. This does not reveal the realized future.

The construction starts with partitions of the finite metric at several distance scales. A point’s complete tuple of cell labels identifies a leaf of a fixed tree. The hidden optimum then gives posterior distributions of the server counts below each tree vertex. We use those distributions to allocate fractional server mass on the tree, represent that mass by points of the original metric, and round it to exactly $k$ servers. Changes of the partitions and of the representatives must be charged along with movement of mass through the tree. One logarithm comes from the partition estimate and one from the allocation estimate; rounding and realization preserve their product.

For exposition we prove the reusable allocation theorem first, then construct its partition input. The four components are as follows.

===== 1.2.1 Allocation from subtree count distributions. <allocation-from-subtree-count-distributions.>

On a fixed separated tree, we maintain fractional subtree amounts with movement $O \( log \( k + 1 \) \)$ times that of the hidden comparator. The amounts dominate the serving requirement and are bounded above by a constant multiple of the posterior expected counts. They may park at internal vertices, keeping unused mass above children while their posterior proportions change. The proof uses convex rank functions and slowly varying proportions. A separate rule for a nearly dominant child chooses the allocations to the other children first and gives that child the remaining parent amount, subject to its cap. This fits all children within their rank bounds without an additional logarithm. The resulting allocation theorem applies to general observed hidden trajectories, independently of the later metric embedding.

===== 1.2.2 A compact variational potential. <a-compact-variational-potential.>

The partition analysis uses a finite-dimensional minimum over separated auxiliary sites with positive-part capacity constraints. Concentration forces a nearly full site near the request. A feasible relocation of that site makes the optimal integrand have small positive slope there. Ball-mass ratios and inner moments then telescope over scales, giving a single logarithm in the measure-motion budget. All geometric radii in this argument are fixed numerical multiples of the scale.

===== 1.2.3 Partitions adapted to local mass ratios. <partitions-adapted-to-local-mass-ratios.>

Heavy balls protect highly concentrated requests. Other requests use chronological rosters in doubling qualification tiers. Their first-hit loss depends on a local mass ratio rather than on one worst-case logarithm at every level. Random retirements keep the rosters bounded; a separate short-lived auxiliary roster pays the retirement errors. The resulting finite label sets are fixed independently of the request horizon.

===== 1.2.4 Moving representatives and rounding. <moving-representatives-and-rounding.>

Fractional mass parked at a tree vertex is represented by an anchor in the original metric. Retained anchors can move even when no mass crosses a tree edge. A normalized affine potential and a pointwise sum of parked-mass coefficients pay this travel without multiplying the tree movement by another logarithm. A dynamic balanced-rounding lemma, allowing correlated parent and child states, incurs only an absolute loss.

These components give two logarithms in total. The final step removes the finite-metric additive term by independent episodes and reset blocks, then uses finite-dimensional separation and compactness. This yields a single policy on all finite inputs of an arbitrary metric, including unbounded spaces. A matching simulation handles repeated initial positions.

=== 1.3 Organization <organization>

Section 2 fixes the probabilistic conventions and the movement accounting. Sections 3, 4, and 5 prove the tree allocation theorem. Section 6 develops the variational potential, and Section 7 constructs the changing partitions. Sections 8 and 9 control realization and rounding. Section 10 proves the uniform-policy conclusion.

The geometric and algorithmic estimates are proved below. The final passage to arbitrary spaces uses the standard compactness theorem identified in Section 10; the worst-case lower bound is the result of Bubeck, Coester, and Rabani cited above.

== 2 Finite laws, posterior motion, and the proof architecture <sec:setup>

We first allow the policy to know a finite input law. This permits conditional distributions of an offline optimum, while still forbidding the policy from observing the realized future. The estimate obtained in this setting must have an additive term uniform in the law and horizon. Section 10 uses precisely this uniformity to construct one policy on an arbitrary metric.

=== 2.1 Matching and lazy simulation <matching-and-lazy-simulation>

A configuration is a multiset of $k$ points, with each repeated point counted separately. For two configurations $A = \( a_1 \, dots.h \, a_k \)$ and $C = \( c_1 \, dots.h \, c_k \)$, put

$ sans(M) \( A \, C \) = min_(pi in S_k) sum_(i = 1)^k d \( a_i \, c_(pi \( i \)) \) . $

This distance ignores the labels when matching configurations; an actual server retains its label when it moves. A #emph[simulated] configuration may move several members between requests. Its movement cost is the matching distance between its successive configurations. A policy is #emph[strongly lazy] if it does nothing when a server already occupies the request, and otherwise moves exactly one server to it.

The classical cost-nonincreasing lazy reduction for the same starting configuration is due to Manasse, McGeoch, and Sleator #cite(label("MMS90")) Lemma 1, p. 211. The matching-potential formulation below also permits an arbitrary initial mismatch.

#thm([Lemma 2.1.])[
  (Lazy simulation).  #emph[Suppose a causal sequence of simulated configurations $C_0 \, C_1 \, dots.h \, C_H$ contains the request $r_t$ at each time $t gt.eq 1$. From any actual start $A_0$, a strongly lazy policy serves the same requests and satisfies, pathwise, 
$ "cost" \( A_0 \; r_1 \, dots.h \, r_H \) lt.eq sans(M) \( A_0 \, C_0 \) + sum_(t = 1)^H sans(M) \( C_(t - 1) \, C_t \) . $

 The conclusion also holds if the matching distances on the right are replaced by any larger specified movement costs.]
] <lem:lazy-simulation>

#proof[
  After $C_t$ is revealed, take a minimum matching from $A_(t - 1)$ to $C_t$. If $A_(t - 1)$ does not contain $r_t$, move the actual server matched to a chosen occurrence of $r_t$ in $C_t$ to that point. Keeping the same matching after the move shows that
  $ upright("actual cost at ") t + sans(M) \( A_t \, C_t \) lt.eq sans(M) \( A_(t - 1) \, C_t \) . $
  If the request was already covered, make no move and the inequality holds with equality. Composing minimum matchings gives
  $ sans(M) \( A_(t - 1) \, C_t \) lt.eq sans(M) \( A_(t - 1) \, C_(t - 1) \) + sans(M) \( C_(t - 1) \, C_t \) . $
  Summing and discarding the nonnegative final matching distance proves the claim. Minimum matchings exist because there are only $k !$ permutations, even with repeated positions. Fixed orders resolve all ties, so this procedure is causal. ◻
]

The same pathwise inequality applies to any prescribed simulated trajectory. Causality is needed to obtain an online policy from it; when comparing two offline optima, only the pathwise inequality is used.

We use the shorthand

$ ell = 1 + log \( k + 1 \) . $

All unnamed multiplicative constants below are absolute. Constants may depend on numerical parameters only after those parameters have been fixed once and for all, independently of $k$ and the metric.

#thm([Proposition 2.2.])[
  (Finite distributional estimate).  #emph[There is an absolute $a < oo$ with the following property. For every finite metric $Y$ of positive diameter, every $k gt.eq 2$, and every start $s in Y^k$, there is a finite $D_0 = D_0 \( Y \, k \, s \)$ such that, for every finite horizon $H$ and every probability law on $Y^H$, there is a causal strongly lazy policy satisfying 
#[#set math.equation(numbering: n => "(2.1)")
 $ bb(E) thin "cost" lt.eq a ell^2 bb(E) thin "OPT" + D_0 . $ <eq:finite-law>]

 The policy may depend on the law and horizon. The number $D_0$ does not.]
] <prop:finite-law>

Sections 3–9 prove this proposition. An additive term in those sections is always bounded by a fixed finite function of $Y \, k \, s$ and the finite structures constructed from them. It never depends on the law, horizon, number of histories, or number of updates. We will verify this distinction again when assembling the estimates.

=== 2.2 Hidden comparators and the two parts of a posterior update <hidden-comparators-and-the-two-parts-of-a-posterior-update>

Fix the data of Proposition 3. For each input, choose one optimum trajectory of the $k$ labeled servers, resolving ties by a fixed order. Such a choice exists: each request has only $k$ possible server labels, so a length-$H$ input has only $k^H$ candidate trajectories. The chosen optimum is a hidden random variable determined by the input. Set

$ Q = bb(E) thin "OPT" . $

The policy uses conditional laws of this trajectory, not its hidden realization.

Let $cal(F)_t$ contain the request prefix through time $t$ and the independent random tape used to construct the partitions. It is convenient to include that entire tape from time zero. The rounding procedure will use a separate independent tape that is excluded from $cal(F)_t$. Thus conditioning on $cal(F)_t$ does not alter the true-metric comparator posterior beyond conditioning on the request prefix.

For any old hidden quantity $Z_(t - 1)$, a step has two logically different parts:

$ cal(L) \( Z_(t - 1) divides cal(F)_(t - 1) \) arrow.r^(upright("filtering")) cal(L) \( Z_(t - 1) divides cal(F)_t \) arrow.r^(upright("drift")) cal(L) \( Z_t divides cal(F)_t \) . $

Here $cal(L)$ denotes a probability law, not the pilot potential introduced later. During filtering, an affine functional with coefficients held from time $t - 1$ has zero conditional expected change. A concave functional has nonpositive conditional expected change. During drift, the joint conditional law of $\( Z_(t - 1) \, Z_t \)$ provides a coupling. For embedded quantities, the old variable uses the old map and the new variable uses the new map.

All signed filtering estimates are applied over every step, with old parameters held fixed, #emph[before] selecting resets or partition edits. In particular, no argument conditions a martingale estimate on the later event that a reset is necessary.

For probability estimates concerning random radii or retirements, we use a different conditioning: fix the true input and its comparator trajectory, and average over the partition tape. The relevant insertion schedules will then be deterministic. This does not assert independence after conditioning on the entire tape in $cal(F)_t$.

At a fixed finite horizon all relevant random outcomes can be taken finite. A radius draw need only specify which subset of the finite space is its ball; a roster lifetime has a finite maximum age. Only finitely many insertions can occur. More explicitly, preallocate at most $H$ insertion slots per level and structure, discretize each radius at all pairwise distances in $Y$, and preallocate each entry’s truncated lifetime. This gives a finite-valued relevant tape, even before the centers of the inserted balls are known. Any unused portion of an ambient infinite tape is independent and can be ignored; all fractional states and selected rounding kernels below depend only on this finite projection and the request prefix. Realizing a kernel also uses the current rounded state and the independent rounding randomness. Conditional laws, minimizing choices, and randomized rounding kernels can therefore be specified history by history. Arbitrary continuations are assigned to zero-probability histories.

=== 2.3 The true-metric measure update <the-true-metric-measure-update>

Write $x = r_t$, and designate the server moved by the chosen optimum at this request, including when its movement is zero. Let $mu^(upright("old"))$ be the expected comparator counting measure at time $t - 1$, conditional on $cal(F)_(t - 1)$. At the new conditioning $cal(F)_t$, let $mu^(-)$ and $mu^(+)$ be its counting measures before and after the move, and let $nu$ be the probability law of the designated mover’s old position. Then

#[#set math.equation(numbering: n => "(2.2)")
 $ mu^(+) = mu^(-) - nu + delta_x \, #h(2em) nu lt.eq mu^(-) \, #h(2em) nu \( Y \) = 1 \, #h(2em) e_x = integral_Y d \( x \, y \) thin d nu \( y \) . $ <eq:measure-update>]

Both counting measures have total mass $k$, the measure $mu^(+)$ has at least one unit at $x$, and

$ bb(E) \[ mu^(-) divides cal(F)_(t - 1) \] = mu^(upright("old")) \, #h(2em) bb(E) sum_(t = 1)^H e_(r_t) = Q . $

The expected counting measure of the stationary members is $mu^(+) - delta_x = mu^(-) - nu$, hence is bounded by $mu^(+)$. The separate treatment of this stationary measure and the designated mover will matter in the partition accounting.

=== 2.4 Scales and a logarithmic telescope <scales-and-a-logarithmic-telescope>

Balls are closed. Set $r_0 = "diam" Y$ and

$ r_j = r_0 tau^(- j) \, quad 1 lt.eq j lt.eq J \, #h(2em) 40 r_J < min_(p eq.not q) d \( p \, q \) . $

The separation factor $tau gt.eq 2$ is a sufficiently large absolute constant. Its required lower bounds come from tree allocation and rounding; neither bound depends on $k \, Y \, J$. Once it is fixed, $J$ depends only on $Y$.

#thm([Lemma 2.3.])[
  (Ball-mass telescope).  #emph[Fix $0 < a < b$, a nonnegative measure $mu$, and an offset $c_0 gt.eq 0$. On a consecutive finite interval of scale indices suppose 
$ c lt.eq A_j := c_0 + mu \( B \( x \, a r_j \) \) lt.eq B_j := c_0 + mu \( B \( x \, b r_j \) \) lt.eq K \, #h(2em) c > 0 . $

 If $p gt.eq 1$ is an integer with $tau^p a gt.eq b$, then 
$ sum_j log \( B_j \/ A_j \) lt.eq p log \( K \/ c \) . $

]
] <lem:scale-logarithms>

#proof[
  Extend $A_j$ before the coarsest index of the interval by the value $K$. Ball inclusion gives $B_j lt.eq A_(j - p)$ whenever the shifted index remains in the interval, and the same inequality follows from $B_j lt.eq K$ at the coarse boundary. Thus the sum is at most $sum_j \( log A_(j - p) - log A_j \)$. All interior terms cancel, leaving at most $p$ coarse-end terms minus at most $p$ fine-end terms. Each resulting difference is at most $log \( K \/ c \)$. ◻
]

In every application, $a \, b \, c$ are fixed positive constants and $K = O \( k + 1 \)$, so the bound is $O \( ell \)$. The offset permits its use with $1 + mu \( B \)$ as well as with positive ball masses themselves. Geometric sums of radii, by contrast, cost an absolute multiple of their largest radius and introduce no logarithm.

=== 2.5 Where the two logarithms occur <where-the-two-logarithms-occur>

The allocation theorem begins with a fixed finite tree and a hidden trajectory of $k$ members on its leaves. It constructs subtree amounts $q_v$ satisfying

$ q_(upright("root")) = k \, #h(2em) sum_(i upright(" child of ") v) q_i lt.eq q_v \, #h(2em) q_v lt.eq C_0 m_v \, $

where $m_v$ is the posterior expected hidden subtree count. The inequality in conservation allows #emph[parking] at internal vertices:

$ p_v^compose = q_v - sum_i q_i . $

All parks together have total mass $k$. This freedom is useful: the required leaf still receives at least one unit, but unused mass need not follow rapidly changing posterior proportions down the tree. Figure 1 illustrates this split and the separate movement of its representative.

The construction order is important. Partition schedules use only the true-metric posteriors and chronological ages. They are independent of the later allocation and rounding. Their bounded simultaneous occupancy gives a finite set of labels, chosen independently of the horizon. Full strings of level labels then define a fixed finite prefix tree. We apply the allocation theorem to that tree, control the moving representatives using the domination $q_v lt.eq C_0 m_v$, and round with a further independent tape. Finally Lemma 2 returns to the original one-server movement model.

#figure(
  [#image("fig/parked_tree.pdf.png", width: 94.0%)],
  caption: [Figure 1: A subtree amount is split between its children and a park at its own vertex. The park is included as one more child target during rounding. A fixed tree vertex can have a moving representative in the original metric, so its parked mass requires a separate travel estimate. The picture records conservation and does not assert that the original metric is a Euclidean tree. ],
) <fig:parked-tree>

Let $P$ be expected movement of the mapped hidden comparator on tree leaves, and put

$ V = bb(E) sum_t sum_(v eq.not upright("root")) r_(\| v \| - 1) \| Delta q_v \| . $

The main estimates are

$ P & lt.eq C ell Q + B_P \,\
V & lt.eq C ell P + B_V \,\
bb(E) thin "cost"_(upright("sim")) & lt.eq C \( V + ell P + ell Q \) + B_T . $

Their additive terms have the uniform meaning specified above. Figure 2 displays their dependence.

#figure(
  [#image("fig/budget_flow.pdf.png", width: 98.0%)],
  caption: [Figure 2: Movement accounting. The partitions and the tree allocation each contribute one logarithm. Rounding has an absolute loss. Moving the representatives costs $O \( V + ell P + ell Q \)$, so it preserves the final squared logarithm. All additive terms shown are uniform in the finite input law and horizon. ],
) <fig:budget-flow>

== 3 Allocation on a separated tree: rank data <sec:allocation>

We first solve an allocation problem on a fixed finite tree. The allocation uses conditional distributions of hidden subtree counts. Convex functions of their rank probabilities give compatible lower bounds on the amounts allocated to subtrees. A small, size-dependent change in the functions provides the slack needed to move those amounts slowly.

Let $cal(T)$ be a finite rooted tree whose leaves have depth $J$. Write $\| v \|$ for depth and $i prec v$ when $i$ is a child of $v$. Fix $r_j = r_0 tau^(- j)$, where $r_0 > 0$ and $tau gt.eq 2$. Write $d_T$ for the leaf metric: distinct leaves with last common ancestor of depth $j$ have distance $r_j$. At time $t$ there are $k$ labeled hidden members at leaves, and a leaf $x_t$ known to $cal(F)_t$ is required. Assume that, conditional on $cal(F)_t$, at least one hidden member is at $x_t$ with probability one. Let $N_v \( t \)$ be the number in the subtree of $v$, and put $m_v \( t \) = bb(E) \[ N_v \( t \) divides cal(F)_t \]$. The expected sum of the labeled members’ successive traveled distances is denoted by $P$; it includes their movement from time zero. All conditional distributions below are available from the observed history.

#thm([Theorem 3.1.])[
  (Dominated tree allocation).  #emph[There are absolute constants $C_0 \, C_1$ and $tau_0$ with the following property. For $tau gt.eq tau_0$, the observed histories determine amounts $q_v \( t \)$ satisfying 
#[#set math.equation(numbering: n => "(3.1)")
 $ q_(upright("root")) = k \, #h(2em) 0 lt.eq q_v lt.eq C_0 m_v \, #h(2em) sum_(i prec v) q_i lt.eq q_v \, #h(2em) q_(x_t) gt.eq 1 . $ <eq:allocation-constraints>]

 Moreover, with $ell = 1 + log \( k + 1 \)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ V := bb(E) sum_(t gt.eq 1) sum_(v eq.not upright("root")) r_(\| v \| - 1) \| q_v \( t \) - q_v \( t - 1 \) \| lt.eq C_1 ell P + D_(cal(T)) . $ <eq:allocation-bound>]

 Here sums stop at the chosen finite horizon. The finite constant $D_(cal(T))$ depends only on the fixed tree, radii, and $k$; it can be chosen independently of the input law, horizon, and number of histories. No initial allocation is prescribed.]
] <thm:allocation>

The proof occupies Sections 3–5.

At a vertex $v$, the local task is to distribute its amount $q_v$ among the children without violating their serving lower bounds. We construct child allowances $d_i$, then remove at least $\( sum_i d_i - q_v \)_(+)$ from them; additional removals leave mass parked at $v$. The removal choices must remain stable under posterior fluctuations. Section 4 constructs these choices, and Section 5 proves that the resulting allocations meet their lower bounds and move slowly.

This section supplies the rank lower bounds and the allowances. It uses coarse estimates to control changes of the removal rule’s parameters, and finer estimates for the final allowances. Only the coarse variation will be multiplied by logarithmic potential slopes; keeping these two budgets separate preserves the single factor of $ell$ in the theorem.

Rank coordinates for subtree occupancies also occur in the assignment polytope of #cite(label("BCLLM18")) Section 3.2. Here they are probabilities of the hidden comparator’s occupancies, conditional on the observed history. For $1 lt.eq a lt.eq k$, define the rank probabilities and their filtered values by

$ p_(v a) \( t \) = Pr \( N_v \( t \) < a divides cal(F)_t \) \, #h(2em) p_(v a)^(-) \( t \) = Pr \( N_v \( t - 1 \) < a divides cal(F)_t \) . $

Thus $bb(E) \[ p_(v a)^(-) \( t \) divides cal(F)_(t - 1) \] = p_(v a) \( t - 1 \)$. The drift of this coordinate is $delta_t p_(v a) = p_(v a) \( t \) - p_(v a)^(-) \( t \)$, rather than its entire change between successive observations. For the star at an internal vertex $v$, put

#[#set math.equation(numbering: n => "(3.3)")
 $ E_v = bb(E) sum_(t gt.eq 1) (sum_(i prec v) sum_(a = 1)^k \| delta_t p_(i a) \| + sum_(a = 1)^k \| delta_t p_(v a) \|) . $ <eq:star-drift>]

These local budgets satisfy

#[#set math.equation(numbering: n => "(3.4)")
 $ sum_(v upright(" internal")) r_(\| v \|) E_v lt.eq 6 P . $ <eq:rank-drift-tree>]

Indeed, for two integer counts $n \, n' in { 0 \, dots.h \, k }$,

$ sum_(a = 1)^k \| upright(bold(1))_({ n < a }) - upright(bold(1))_({ n' < a }) \| = \| n - n' \| . $

Use the coupling of successive hidden configurations and conditional expectation to bound each rank drift by the corresponding indicator change. A nonroot vertex of depth $d$ receives weight at most $r_(d - 1) + r_d$ when all stars are summed. If one labeled member moves between leaves with last common ancestor of depth $j$, its indicators change on the two paths strictly below that ancestor. Its total charge is at most

$ 2 sum_(d = j + 1)^J \( r_(d - 1) + r_d \) lt.eq frac(2 \( 1 + tau^(- 1) \), 1 - tau^(- 1)) r_j lt.eq 6 r_j . $

The root count is constant. Summing over the members proves (3.4).

=== 3.1 Explicit rank functions and compatible lower bounds <explicit-rank-functions-and-compatible-lower-bounds>

#thm([Lemma 3.2.])[
  (Rank functions).  #emph[There are absolute constants $p_(*) \, s_(*) \, epsilon.alt_(*) > 0$, with $p_(*) < s_(*) < 1$, and functions $l^beta : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ for $3 lt.eq beta lt.eq 3 + epsilon.alt_(*)$ such that:]
  + #emph[$l^beta$ is convex and nonincreasing, equals $1 - beta p$ on $\[ 0 \, p_(*) \]$, is positive on $\[ 0 \, s_(*) \)$, and is zero on $\[ s_(*) \, 1 \]$;]
  + #emph[$l^beta$ is affine and nonincreasing in $beta$, and the square roots $sqrt(l^beta)$ have a common absolute Lipschitz constant;]
  + #emph[if $g \( p \) = - partial_beta l^beta \( p \)$, then 
#[#set math.equation(numbering: n => "(3.5)")
 $ 1 / 96 l^beta \( p \) lt.eq g \( p \) lt.eq l^beta \( p \) #h(2em) \( p in \[ p_(*) \/ 4 \, 1 \] \) . $ <eq:rank-derivative>]

]
  #emph[One may take $p_(*) = 1 \/ 24$, $s_(*) = 5 \/ 8$, and $epsilon.alt_(*) = 1 \/ 100$.]
] <lem:rank-functions>

#proof[
  Set $t_(*) = s_(*) - p_(*) = 7 \/ 12$ and
  $ A_(*) = 18 / 7 \, #h(2em) c'_(*) = 6 / 49 \, #h(2em) d'_(*) = 1152 / 343 \, #h(2em) b'_(*) = c'_(*) + d'_(*) t_(*) = 102 / 49 . $
  For $0 lt.eq z lt.eq 1 \/ 100$ define
  #[#set math.equation(numbering: n => "(3.6)")
   $ l^(3 + z) \( p \) = cases(delim: "{", 1 - \( 3 + z \) p \, & 0 lt.eq p lt.eq p_(*) \,, \( s_(*) - p \)^2 #scale(x: 120%, y: 120%)[\[] A_(*) - z \( c'_(*) + d'_(*) \( p - p_(*) \) \) #scale(x: 120%, y: 120%)[\]] \, & p_(*) lt.eq p lt.eq s_(*) \,, 0 \, & s_(*) lt.eq p lt.eq 1 .) $ <eq:explicit-rank>]
  The identities
  $ A_(*) t_(*)^2 = 1 - 3 p_(*) \, quad 2 A_(*) t_(*) = 3 \, quad c'_(*) t_(*)^2 = p_(*) \, quad - 2 c'_(*) t_(*) + d'_(*) t_(*)^2 = 1 $
  show that both values and first derivatives match at $p_(*)$. They also show that $g$ is $p$ on the first interval and $\( s_(*) - p \)^2 \( c'_(*) + d'_(*) \( p - p_(*) \) \)$ on the second.
  Writing $x = s_(*) - p$, the middle expression for $l^(3 + z)$ is
  $ \( A_(*) - z b'_(*) \) x^2 + z d'_(*) x^3 . $
  Its two coefficients are nonnegative, with $A_(*) - z b'_(*) > 2$. Consequently it is positive before the cutoff, has nonpositive $p$-derivative, and has positive second derivative. Its value and first derivative are zero at the cutoff. Together with the matching at $p_(*)$, this proves global convexity and monotonicity. On the first interval the function is bounded away from zero, so its square root has bounded derivative. On the middle interval its square root is $x sqrt(A_(*) - z b'_(*) + z d'_(*) x)$, which also has bounded derivative, uniformly in $z$. The matching and cutoff give the global Lipschitz bound.
  For $p in \[ p_(*) \/ 4 \, p_(*) \]$, the quotient $g \( p \) \/ l^(3 + z) \( p \) = p \/ \( 1 - \( 3 + z \) p \)$ lies between $1 \/ 96$ and $1$. On the middle interval the quotient is
  $ frac(b'_(*) - d'_(*) x, A_(*) - z b'_(*) + z d'_(*) x) \, #h(2em) 0 < x lt.eq t_(*) . $
  It is at least $c'_(*) \/ A_(*) = 1 \/ 21$ and at most $b'_(*) \/ \( A_(*) - \( 1 \/ 100 \) b'_(*) \) < 1$. Beyond the cutoff both functions vanish. This proves (3.5). ◻
]

Fix also the broader size function

$ l^(upright("siz")) \( p \) = frac(\( 3 \/ 4 - p \)_(+)^2, \( 3 \/ 4 \)^2) \, #h(2em) L_v^beta = sum_(a = 1)^k l^beta \( p_(v a) \) \, #h(2em) M_v = sum_(a = 1)^k l^(upright("siz")) \( p_(v a) \) . $

Its square root is Lipschitz. Both kinds of functions vanish at one and have value one at zero.

The next comparison is a majorization argument in the sense of Karamata #cite(label("Karamata32")). We include the convex-hinge proof to specify the direction of the comparison and the role of the padded coordinates.

#thm([Lemma 3.3.])[
  (Superadditivity).  #emph[For every internal vertex $v$ and every allowed $beta$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ sum_(i prec v) L_i^beta lt.eq L_v^beta \, #h(2em) sum_(i prec v) M_i lt.eq M_v lt.eq m_v . $ <eq:rank-superadditivity>]

 No independence between child counts is required.]
] <lem:superadditivity>

#proof[
  Suppose there are $d$ children. Pool their $d k$ rank probabilities and sort them increasingly, obtaining a vector $x$. Let $y$ be the parent’s $k$ increasingly ordered rank probabilities followed by $\( d - 1 \) k$ ones. Their total sums agree and equal $d k - m_v$. If the first $n$ coordinates of $x$ contain $n_i$ coordinates from child $i$, those coordinates can be chosen as the first $n_i$ of that child. Since $N_v = sum_i N_i$, conditional expectation gives
  $ sum_(b = 1)^n x_b = sum_i bb(E) \[ \( n_i - N_i \)_(+) divides cal(F)_t \] gt.eq bb(E) \[ \( n - N_v \)_(+) divides cal(F)_t \] = sum_(b = 1)^n y_b . $
  The last identity also holds for $n > k$, precisely because of the padding. For every real $b$, an increasing vector $z$ satisfies
  $ sum_a \( b - z_a \)_(+) = max_(0 lt.eq n lt.eq d k) (n b - sum_(a = 1)^n z_a) . $
  Thus the sum of every convex hinge $\( b - p \)_(+)$ on $x$ is no larger than its sum on $y$. Affine functions have equal sums. Every convex piecewise linear function is an affine function plus a nonnegative linear combination of these hinges. Approximating a continuous convex function by its linear interpolants proves the same comparison for that function. Apply it to $l^beta$ and $l^(upright("siz"))$; the padded ones contribute zero. Finally convexity and the endpoint values give $l^(upright("siz")) \( p \) lt.eq 1 - p$, and $sum_a \( 1 - p_(v a) \) = m_v$. ◻
]

From now on set $c_(*) = 10^(- 4)$; thus $100 c_(*) < l^(upright("siz")) \( s_(*) \) = 1 \/ 36$. Choose an absolute $c_beta > 0$ so small that $c_beta \( 1 + log \( 1 \/ c_(*) \) \) lt.eq epsilon.alt_(*) \/ 2$, and define

#[#set math.equation(numbering: n => "(3.8)")
 $ beta_v = 3 + c_beta / ell log frac(k, max \( M_v \, c_(*) \)) . $ <eq:vertex-beta>]

It belongs to $\[ 3 \, 3 + epsilon.alt_(*) \/ 2 \]$, because $M_v lt.eq k$ and $log \( k \/ c_(*) \) \/ ell lt.eq 1 + log \( 1 \/ c_(*) \)$. The invariant propagated down the tree will be

#[#set math.equation(numbering: n => "(3.9)")
 $ q_v gt.eq L_v^(beta_v) . $ <eq:allocation-lower-bound>]

Superadditivity gives compatible child lower bounds at the parent’s parameter $beta_v$. Since $M_i lt.eq M_v$, the child’s own parameter satisfies $beta_i gt.eq beta_v$, and its required bound is no larger. The resulting difference is the slack available for choosing slowly varying child amounts. We will estimate this difference in terms of the relative child sizes. At the root all ranks are zero, $M_(upright("root")) = k$, and the lower bound is $k$. At a required leaf $p_(v 1) = 0$, so the lower bound is at least one.

=== 3.2 A rank tracker with a bounded affine potential <a-rank-tracker-with-a-bounded-affine-potential>

The input to a star may fluctuate substantially when information is revealed. The following tracker charges only drift, using signed filtering changes before it decides whether to refresh.

#thm([Lemma 3.4.])[
  (Rank tracking).  #emph[Let $p_t \, p_t^(-) in \[ 0 \, 1 \]$ obey $bb(E) \[ p_t^(-) divides cal(F)_(t - 1) \] = p_(t - 1)$, and let $cal(E) = bb(E) sum_t \| p_t - p_t^(-) \|$. If $f gt.eq 0$ has an absolutely bounded Lipschitz constant for $sqrt(f)$, then for $0 < xi < 1 \/ 2$ there is a held estimate $hat(f)_t$ with 
#[#set math.equation(numbering: n => "(3.10)")
 $ \( 1 + xi \)^(- 1) f \( p_t \) lt.eq hat(f)_t lt.eq \( 1 + xi \) f \( p_t \) \, #h(2em) bb(E) sum_t \| hat(f)_t - hat(f)_(t - 1) \| lt.eq C / xi \( cal(E) + 1 \) . $ <eq:rank-relative-tracker>]

 In particular zeros are tracked exactly. A held estimate $hat(p)_t$ refreshed when $\| p_t - hat(p)_(t - 1) \| > delta$ has expected number of refreshes at most $delta^(- 2) \( cal(E) + 1 \)$.]
] <lem:rank-tracking>

#proof[
  Initialize a reference $p^compose = p_0$ and hold $f \( p^compose \)$ until the displayed factor comparison fails, then replace $p^compose$ by $p_t$. With the reference held, use
  $ Phi \( p \; p^compose \) = p \( 1 - p \) + \( p - p^compose \)^2 = \( 1 - 2 p^compose \) p + \( p^compose \)^2 . $
  This is affine in $p$, lies in $\[ 0 \, 1 \]$, and has slope of absolute value at most one. At every step, first evaluate its change from $p_(t - 1)$ to $p_t^(-)$ and then from $p_t^(-)$ to $p_t$, holding the old reference. The former change has conditional expectation zero, and the latter is at most $\| p_t - p_t^(-) \|$. A reference reset then decreases $Phi$ by exactly $\( p_t - p^compose \)^2$. Telescoping gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E) sum_(upright("resets")) \( p_t - p^compose \)^2 lt.eq cal(E) + 1 . $ <eq:rank-reset-credit>]
  For two nonnegative values $a \, b$ failing factor $1 + xi$ comparison,
  $ \( sqrt(a) - sqrt(b) \)^2 = \| a - b \| frac(\| sqrt(a) - sqrt(b) \|, sqrt(a) + sqrt(b)) gt.eq xi / 5 \| a - b \| . $
  The inequality includes the case in which exactly one value is zero. The Lipschitz bound for $sqrt(f)$ therefore implies $\( p_t - p^compose \)^2 gt.eq c xi \| f \( p_t \) - f \( p^compose \) \|$ at every reset, proving (3.10). The same potential proves the absolute-threshold claim, since every reset then releases more than $delta^2$. Filtering was evaluated at every step before the reset test; no expectation was restricted to a selected reset event. ◻
]

Apply the absolute tracker with threshold $p_(*) \/ 8$ to every child rank. A rank is called #emph[core] when its held estimate is at most $p_(*) \/ 2$. After the update, every core rank has $p lt.eq 5 p_(*) \/ 8$, every noncore rank has $p > 3 p_(*) \/ 8$, and every rank with $p < p_(*) \/ 4$ is core. Let $K_t$ count the changed core flags in this star at step $t$, and set

#[#set math.equation(numbering: n => "(3.12)")
 $ n_i = \# { a : a upright(" is core at ") i } \, quad B_i = sum_(a upright(" core at ") i) p_(i a) \, quad S = sum_i B_i \, quad f_i^beta = sum_(a upright(" noncore at ") i) l^beta \( p_(i a) \) . $ <eq:core-data>]

We call $f_i^beta$ the #emph[noncore], or #emph[flex], contribution. The core ranks lie in the affine part of every rank function, so

#[#set math.equation(numbering: n => "(3.13)")
 $ L_i^beta = n_i - beta B_i + f_i^beta \, #h(2em) n_i + sup_beta f_i^beta lt.eq C M_i . $ <eq:core-decomposition>]

For the second bound, a core rank contributes at least $l^(upright("siz")) \( 5 p_(*) \/ 8 \) > 0$ to $M_i$. Any positive $l^beta \( p \)$ has $p < s_(*)$, where $l^(upright("siz")) \( p \) gt.eq 1 \/ 36$ and $l^beta \( p \) lt.eq 1$. These termwise bounds prove the assertion with an absolute constant. In particular,

#[#set math.equation(numbering: n => "(3.14)")
 $ M_i lt.eq 10 c_(*) quad arrow.r.double quad n_i = 0 med upright(" and ") med L_i^beta = f_i^beta = 0 med upright("for all ") beta . $ <eq:inactive-rank-vanishing>]

Also, if the old flags are held while the ranks are filtered and drifted, the resulting old-flag sum always satisfies $B_i lt.eq n_i^(upright("old"))$, even if those old flags no longer describe small current probabilities. This elementary bound will be used at wholesale changes.

=== 3.3 Coarse data, active epochs, and parameter gaps <coarse-data-active-epochs-and-parameter-gaps>

We now describe a schedule local to a star. Its estimates are computed from the final, post-filtering and post-drift, ranks on each step. All elementary term trackers persist throughout the entire process, including times when a child is inactive and times when the schedule below is restarted.

Choose a sufficiently small absolute size tolerance $delta_s > 0$, for example $10^(- 3)$. Track every term of $M_i$ by Lemma 8 with this tolerance, and let $hat(M)_i$ be their sum. A child is either inactive, with $a_i = 0$, or active. Turn an inactive child on when $hat(M)_i gt.eq 5 c_(*)$, setting $a_i = hat(M)_i$. Turn an active child off when $hat(M)_i lt.eq 2 c_(*)$. Otherwise, during an active period hold $a_i$ until factor $1 + delta_s$ comparison with $hat(M)_i$ fails, then replace $a_i$ by $hat(M)_i$. Initialize with the same rules, using either admissible state in the overlap. These choices ensure

#[#set math.equation(numbering: n => "(3.15)")
 $ 0.9 M_i lt.eq a_i lt.eq 1.1 M_i quad upright("at active children") \, #h(2em) M_i gt.eq c_(*) quad upright("if active") \,\
M_i gt.eq 10 c_(*) quad arrow.r.double quad upright("active") . $ <eq:active-size-accuracy>]

By (3.14), an inactive child has no core ranks or positive rank lower bounds.

We also hold an accurate estimate of $X_v = max \( M_v \, c_(*) \)$. For this purpose take a possibly smaller absolute tolerance $delta_p$, track the parent size terms, and clip their sum below at $c_(*)$, obtaining $hat(X)_v$. Hold $H_v$ equal to its last reference value, refreshing upon failure of factor $1 + delta_p$ comparison. Then

$ \( 1 + delta_p \)^(- 2) X_v lt.eq H_v lt.eq \( 1 + delta_p \)^2 X_v . $

Put

#[#set math.equation(numbering: n => "(3.16)")
 $ X_v^(upright("low")) = max { c_(*) \, H_v \/ \( 1 + delta_p \)^2 } \, #h(2em) beta^(+) = 3 + c_beta / ell log k / X_v^(upright("low")) . $ <eq:held-beta-upper>]

Here $X_v^(upright("low")) lt.eq X_v lt.eq k$, and $X_v^(upright("low")) gt.eq X_v \/ \( 1 + delta_p \)^4$. Thus, for any prescribed small absolute $epsilon.alt > 0$, choosing $delta_p$ sufficiently small gives

#[#set math.equation(numbering: n => "(3.17)")
 $ beta_v lt.eq beta^(+) lt.eq beta_v + epsilon.alt \/ ell . $ <eq:beta-upper-error>]

The parameter stays in the allowed interval and changes only when $H_v$ is refreshed.

An #emph[epoch] starts with a #emph[wholesale change], performed initially and whenever $beta^(+)$ changes or the cumulative $ell_1$ variation of the held size vector since the epoch started exceeds $A \/ 100$. Here $A = sum_i a_i$ at the start is held for that epoch. Empty to nonempty or nonempty to empty changes always start a new epoch. At a wholesale change, choose a dominant index $o$ if some $a_o gt.eq 0.85 A$ and $A > 0$. It is unique. Keep that mark until the next wholesale change. All other active indices, or all active indices when there is no mark, are called regular. With a dominant index the regular indices are also called sides. No elementary size or rank tracker is restarted at an epoch boundary.

During a marked epoch, let $T_(upright("side")) = sum_(i eq.not o) a_i$. Set $U = T_(upright("side"))$ at its start. Subsequently hold $U$ until factor $1 + delta_s$ comparison with $T_(upright("side"))$ fails, then refresh it to that side total. This includes transitions to or from zero. When sides exist set $u = U \/ A$; otherwise set $u = 0$. For active children define

#[#set math.equation(numbering: n => "(3.18)")
 $ h_i = 1 + max { 0 \, log \( A \/ a_i \) } quad \( i upright(" regular") \) \, #h(2em) h_o = u quad \( o upright(" dominant") \) . $ <eq:gap-weights>]

The empty active domain needs none of these parameters.

Finally prepare a coarse scale for a marked child. Independently of the fine estimates used below, track every child rank value $l^3 \( p_(i a) \)$ with tolerance $delta_s$, and write its estimate as $hat(l)_(i a)^(upright("coarse"))$. With a dominant index set

#[#set math.equation(numbering: n => "(3.19)")
 $ D = sum_(a upright(" noncore at ") o) hat(l)_(o a)^(upright("coarse")) \; $ <eq:dominant-scale-definition>]

set $D = 0$ when no dominant index exists. All these term trackers run on every child and every rank even when their estimates are not currently used in $D$.

Here is a precise inventory of the coarse charges. Write $a_i^(-) \, a_i^(+)$ for the old and new held sizes on a step, and similarly for other held quantities; these superscripts in this inventory refer to step-end states, not to the filtered hidden configuration. Let $cal(W)_v$ be the wholesale steps after initialization, $cal(H)_v$ the steps at which $H_v$ is refreshed, and $cal(U)_v$ the non-wholesale steps at which $U$ is refreshed. Define the nonnegative charge

#[#set math.equation(numbering: n => "(3.20)")
 $ C_(v \, t) =  & K_t + sum_(i : a_i^(-) eq.not a_i^(+)) \( a_i^(-) + a_i^(+) \) + upright(bold(1))_({ t in cal(H)_v }) \( H_v^(-) + H_v^(+) \)\
 & + upright(bold(1))_({ t in cal(W)_v }) sum_i \( a_i^(-) + a_i^(+) \) + upright(bold(1))_({ t in cal(U)_v }) \( T_(upright("side"))^(-) + T_(upright("side"))^(+) \) + \| D^(+) - D^(-) \| . $ <eq:coarse-charge-definition>]

The side totals in this expression use the unchanged dominant mark on a non-wholesale step. A wholesale change of $U$, including a change of mark, is covered by the wholesale total in the preceding term.

#thm([Lemma 3.5.])[
  (Coarse budgets and parameter gaps).  #emph[The data above satisfy, for an absolute constant $C$ and a finite $D_v^(upright("data"))$ depending only on the fixed star and $k$, 
#[#set math.equation(numbering: n => "(3.21)")
 $ bb(E) sum_t C_(v \, t) lt.eq C E_v + D_v^(upright("data")) . $ <eq:coarse-data-budget>]

 The constant is uniform in the law and horizon. Every active child obeys 
#[#set math.equation(numbering: n => "(3.22)")
 $ 0 lt.eq h_i lt.eq C ell \, #h(2em) beta_i - beta_v gt.eq frac(c_g h_i, ell) $ <eq:parameter-gap>]

 for an absolute $c_g > 0$. If a dominant index and sides are present, then $0 < u < 1 \/ 4$, and with $H = 1 + log \( 1 \/ u \)$ every side satisfies $h_i gt.eq c H$ for an absolute $c > 0$. In addition, $n_i + B_i + sup_beta f_i^beta lt.eq C a_i$ at active children, and all these quantities vanish at inactive children.]
] <lem:parameter-gaps>

#proof[
  We give the amortization details because paying a large size on every small refresh would not suffice. Lemma 8, summed over the fixed collection of size terms, bounds the expected total variation of their estimates by $C E_v$ plus a fixed initialization constant. It bounds $bb(E) sum_t K_t$ in the same way. Constants may depend on the fixed absolute tolerances but never on $k$ or the degree.
  For a scalar estimate $x$ held at a reference $b > 0$, a factor $1 + delta$ failure gives
  $ b + x lt.eq \( 1 + 2 \/ delta \) \| x - b \| . $
  The last difference is bounded by the variation of $x$ since its previous reference setting; these intervals are disjoint. This pays all active to active changes of $a_i$ and all changes of $H_v$. Turning a child on after an off period costs its new size, and is paid by the variation from a previous value at most $2 c_(*)$ to a value at least $5 c_(*)$. The first such event may instead use an initialization charge. For a turn-off, if the last held size exceeds $4 c_(*)$, variation since that setting pays it because the new estimate is at most $2 c_(*)$. Otherwise the charge is at most $4 c_(*)$ and is paid by the traversal from at least $5 c_(*)$ at the start of this on period to at most $2 c_(*)$ at its end. Each on period and each off period is used only once in these latter arguments. They overlap the scalar refresh intervals only a bounded number of times. This proves the budget for all changed-$a_i$ charges. Clipping the parent sum below at $c_(*)$ does not increase its variation, so the same argument applies to $H_v$.
  When $beta^(+)$ changes, the old and new active totals are at most $C \( X_v^(-) + X_v^(+) \) lt.eq C \( H_v^(-) + H_v^(+) \)$, and are therefore paid by that parent refresh. For a wholesale event from the vector-variation test, let $R$ be the cumulative variation since the previous epoch started and let $A$ be that epoch’s initial total. The old total is at most $1.01 A$, the new total is at most $1.01 A + R$, and $R > A \/ 100$. Their sum is consequently at most $203 R$. The intervals of variation assigned to successive epochs are disjoint. If $A = 0$, the new total is at most $R$, and the same conclusion holds. Discarding unused variation credit when a parent refresh intervenes cannot increase its total use. This proves the wholesale budget.
  On a fixed marked epoch, variation of $T_(upright("side"))$ is at most $sum_i \| Delta a_i \|$. The scalar relative-refresh argument pays every $U$ refresh by variation since its previous setting. The actual old side total is within factor $1 + delta_s$ of that reference, so the old plus new side totals have the same bound. A zero crossing is included: the variation then pays the positive reference or positive new total. Setting $U$ at a wholesale change is paid by the wholesale total. Thus all its asserted charges are covered.
  At a non-wholesale step the dominant index is unchanged. The variation of (3.19) is at most the summed variation of its coarse term estimates plus $C K_t$: a changed flag inserts or removes one term, each at most one. At a wholesale step, its old and new values are at most $C \( a_o^(-) + a_o^(+) \)$, interpreted as zero when that mark is absent; this follows from the relative estimates and (3.13). The wholesale totals pay these changes. This proves (3.21).
  For the gaps, at every state of an epoch with $A > 0$ the current active total is in $\[ 0.99 A \, 1.01 A \]$. In an unmarked epoch every child has $a_i lt.eq 0.86 A$. In a marked epoch the marked size is at least $0.84 A$, and the side total is at most $0.16 A$; in particular the mark stays active. Therefore every regular child has $a_i lt.eq 0.86 A$. By (3.15) and superadditivity,
  #[#set math.equation(numbering: n => "(3.23)")
   $ M_v / M_i gt.eq 1 + 9 / 11 frac(sum_(j eq.not i \, med a_j > 0) a_j, a_i) gt.eq 1 + 9 / 11 (frac(0.99 A, a_i) - 1) . $ <eq:size-log-comparison>]
  For $x = A \/ a_i gt.eq 1 \/ 0.86$, the logarithm of the last expression is at least $c \( 1 + log x \)$ for an absolute $c > 0$. To see the uniformity, the ratio to $1 + log x$ is continuous and positive on this interval and tends to one as $x arrow.r oo$; on a sufficiently large tail it is at least $1 \/ 2$, and on the remaining compact interval it has a positive minimum. This proves the regular comparison. For the dominant child, use the first inequality in (3.23), the comparisons $T_(upright("side")) asymp U$, and $a_o lt.eq 1.01 A$ to obtain
  $ log \( M_v \/ M_o \) gt.eq c U \/ A = c u . $
  Here $u lt.eq \( 1 + delta_s \) 0.16 < 1 \/ 4$, so $log \( 1 + c u \) gt.eq c' u$. If no sides exist, $u = 0$ and the claimed inequality is automatic.
  At every active child $M_i gt.eq c_(*)$ and $M_v gt.eq M_i$, so the clipping in (3.8) is inactive at both vertices. Hence
  $ beta_i - beta_v = c_beta / ell log \( M_v \/ M_i \) \, $
  which proves the gap in (3.22). Active held sizes have an absolute positive lower bound and $A lt.eq 1.1 k$, proving $h_i lt.eq C ell$. On a side, $a_i lt.eq T_(upright("side")) lt.eq \( 1 + delta_s \) u A$, whence
  $ h_i gt.eq 1 + log \( 1 \/ u \) - log \( 1 + delta_s \) gt.eq H \/ 2 . $
  The final bounds on core and flex data follow from (3.13), $B_i lt.eq n_i$, and (3.15). Inactivity was addressed in (3.14). ◻
]

=== 3.4 Fine caps and their separate budget <fine-caps-and-their-separate-budget>

The proportions constructed in the next section will use only the coarse data above and the raw core sums $B_i$. The following finer estimates enter only the final allocations. Keeping their variation out of the proportion potentials is necessary for the single factor of $ell$ in Theorem 5.

The parameter gap at a regular child leaves room to track its flex contribution between $f_i^(beta_i)$ and $f_i^(beta_v)$. A marked child can have an arbitrarily smaller gap as its side mass tends to zero. We therefore use a small upper approximation at that child; Section 4 explains how this asymmetry changes the removal rule.

#thm([Lemma 3.6.])[
  (Caps).  #emph[Given a sufficiently small absolute $epsilon.alt_b > 0$, the remaining absolute tolerances can be chosen so that there are caps $d_i = n_i + b_i$, zero on inactive children, with 
#[#set math.equation(numbering: n => "(3.24)")
 $ f_i^(beta_i) lt.eq b_i lt.eq f_i^(beta_v) &  & \( i upright(" regular") \) \,\
T := f_o^(beta_v) lt.eq b_o lt.eq \( 1 + epsilon.alt_b \/ ell \) T \, #h(2em) c_D T lt.eq D lt.eq C_D T &  & \( o upright(" dominant") \) . $ <eq:cap-feasibility>]

 Here $c_D \, C_D > 0$ are absolute, fixed independently of $epsilon.alt_b$ and the fine tolerances; in particular $D = 0$ if and only if $T = 0$. At every child $d_i lt.eq C M_i lt.eq C m_i$. Their variation away from wholesale changes satisfies 
#[#set math.equation(numbering: n => "(3.25)")
 $ bb(E) sum_(t in.not cal(W)_v) sum_i \| d_i \( t \) - d_i \( t - 1 \) \| lt.eq C ell E_v + D_v^(upright("cap")) \, $ <eq:fine-cap-budget>]

 where $D_v^(upright("cap"))$ is uniform in the law and horizon. At wholesale changes the old plus new caps are bounded by $C$ times the old plus new active totals.]
] <lem:caps>

#proof[
  For every rank, at both endpoint parameters $3$ and $3 + epsilon.alt_(*)$, run separate relative trackers with tolerance $rho \/ ell$, where $rho > 0$ is a small absolute constant to be selected. Interpolate their estimates by the convex coefficients expressing $beta^(+)$ between these endpoints, and sum over the current noncore ranks at child $i$. Call the result $tilde(f)_i$. The affinity in $beta$ and the relative endpoint estimates imply
  $ \( 1 + rho \/ ell \)^(- 1) f_i^(beta^(+)) lt.eq tilde(f)_i lt.eq \( 1 + rho \/ ell \) f_i^(beta^(+)) . $
  Every noncore rank has $p > 3 p_(*) \/ 8$, so (3.5) applies to it. Together with (3.17), this yields
  #[#set math.equation(numbering: n => "(3.26)")
   $ \| tilde(f)_i - f_i^(beta_v) \| lt.eq e / ell f_i^(beta_v) \, #h(2em) e lt.eq C \( rho + epsilon.alt \) . $ <eq:flex-estimate-error>]
  For example, $f_i^(beta_v) - f_i^(beta^(+)) = \( beta^(+) - beta_v \) sum_(upright("noncore")) g \( p_(i a) \) lt.eq \( epsilon.alt \/ ell \) f_i^(beta_v)$. If the true sum is zero then both endpoint estimates, and therefore the interpolated sum, are exactly zero, since all the functions have the same cutoff.
  For a regular child, $h_i gt.eq 1$ and the parameter gap gives
  #[#set math.equation(numbering: n => "(3.27)")
   $ f_i^(beta_i) = f_i^(beta_v) - \( beta_i - beta_v \) sum_(upright("noncore")) g \( p_(i a) \) lt.eq \( 1 - gamma \/ ell \) f_i^(beta_v) \, #h(2em) gamma = c_g \/ 96 > 0 . $ <eq:regular-flex-slack>]
  Choose an absolute $0 < lambda_b lt.eq min { gamma \/ 4 \, epsilon.alt_b \/ 4 \, 1 \/ 4 }$, and then choose $rho \, epsilon.alt$ so small that the $e$ in (3.26) is at most $lambda_b \/ 4$. Define
  $ b_i = \( 1 - lambda_b \/ ell \) tilde(f)_i quad \( i upright(" regular") \) \, #h(2em) b_o = \( 1 + lambda_b \/ ell \) tilde(f)_o quad \( o upright(" dominant") \) . $
  For a regular child the upper estimate is at most $f_i^(beta_v)$, because $e lt.eq lambda_b$; the lower estimate is at least $\( 1 - \( lambda_b + e \) \/ ell \) f_i^(beta_v)$, which dominates (3.27). For a dominant child, $\( 1 + lambda_b \/ ell \) \( 1 - e \/ ell \) gt.eq 1$, whereas $\( 1 + lambda_b \/ ell \) \( 1 + e \/ ell \) lt.eq 1 + epsilon.alt_b \/ ell$. This proves the cap comparisons.
  On the noncore range (3.5) also gives
  $ l^(beta_v) lt.eq l^3 = l^(beta_v) + \( beta_v - 3 \) g lt.eq \( 1 + epsilon.alt_(*) \) l^(beta_v) . $
  The coarse tracker defining $D$ therefore satisfies
  $ \( 1 + delta_s \)^(- 1) T lt.eq D lt.eq \( 1 + delta_s \) \( 1 + epsilon.alt_(*) \) T . $
  These choices give the claimed $c_D \, C_D$ and show that their values precede all fine choices. The bound $d_i lt.eq C M_i$ follows from (3.13) and the relative estimates.
  It remains to account for variation. Lemma 8 with tolerance $rho \/ ell$ pays the summed variation of all endpoint estimates by $C ell E_v$ plus a fixed constant. On a non-wholesale step, $beta^(+)$ and the dominant mark are unchanged, so their interpolation coefficients and the factors $1 plus.minus lambda_b \/ ell$ are fixed. Changes of the noncore sets cost at most $C K_t$, as does the variation of $n_i$. An inactive child has zero true endpoint values and hence zero endpoint estimates; setting its cap to zero therefore adds no variation beyond the same term and flag changes. This proves (3.25). At a wholesale step, $d_i^(-) + d_i^(+) lt.eq C \( a_i^(-) + a_i^(+) \)$, including zero inactive values, and summing proves the remaining statement. ◻
]

All the additive terms in this section arise from bounded potentials and bounded initialization charges for a fixed number of rank trackers. There are only $k$ ranks per vertex of the fixed finite tree. The term trackers are never reinitialized when an epoch changes or a tree label reappears. Thus their total additive allowance is uniform over every law and horizon. The coarse allowance (3.21) and the fine allowance (3.25) are separate: only the former will be multiplied by the $O \( ell \)$ slopes of the next section’s potentials.

The remaining construction starts from the caps $d_i$ and distributes the required reduction $#scale(x: 120%, y: 120%)[\(] sum_i d_i - q_v #scale(x: 120%, y: 120%)[\)]_(+)$ between children. The star’s parameters, flags, and proportion trackers can all be updated from its own rank inputs before $q_v$ is known. The actual allocations are then propagated from the root downwards.

== 4 Slow proportions with changing domains <sec:proportions>

We continue the construction at one fixed star $v$, using the parameters of Lemmas 9 and 10. The caps $d_i$ will be reduced to fit the parent amount. This section constructs proportions for those reductions. The construction depends only on the star’s observed rank posteriors and held parameters; the parent amount $q_v$ is not an input.

Write $I$ for the active children, and extend all vectors by zero to the fixed set of children when comparing different times. Recall that $B_i$ is the sum of the current rank probabilities over the core flags, $S = sum_i B_i$, and inactive children have no core flags. If a dominant child $o$ is marked, the other active children are called sides. For regular children and for a marked child with sides, respectively, the held parameters satisfy

#[#set math.equation(numbering: n => "(4.1)")
 $ 1 lt.eq h_i lt.eq C ell quad \( i upright(" regular") \) \, #h(2em) h_o = u = U \/ A in \( 0 \, 1 \) \, #h(2em) H = 1 + log \( 1 \/ u \) \,\
h_i gt.eq c H quad \( i upright(" a side") \) \, #h(2em) sum_(i upright(" regular")) e^(- h_i) lt.eq cases(delim: "{", C \, & upright("no dominant child") \,, C u \, & upright("a dominant child") .) $ <eq:proportion-parameter-facts>]

The last assertion follows from $e^(- h_i) lt.eq a_i \/ A$ and the comparison of $U$ with the side total. These facts hold throughout each epoch. When $I$ is empty there is no proportion to choose. When $I = { o }$, we use $alpha_o = 1$, $u = h_o = 0$, and no side vector. Both potentials below are then defined to be zero. In particular, we never evaluate a denominator with $u = 0$.

=== 4.1 Removal constraints and the simplex tracker <removal-constraints-and-the-simplex-tracker>

Fix a sufficiently small absolute $c_t > 0$ and put $eta_i = c_t h_i \/ ell$. For a nonempty active domain we require

#[#set math.equation(numbering: n => "(4.2)")
 $ alpha_i gt.eq 0 \, #h(2em) sum_(i in I) alpha_i = 1 \, #h(2em) S alpha_i lt.eq \( 1 + eta_i \) B_i quad \( i in I \) . $ <eq:alpha-feasibility>]

This is automatic on a singleton domain.

To see the role of the tolerance $eta_i$, temporarily fix any parent amount $q_v gt.eq L_v^(beta_v)$. Removing the excess $R_0 = \( sum_i d_i - q_v \)_(+)$ in proportions $alpha$ would give $q_i = d_i - R_0 alpha_i$. The cap bounds and superadditivity imply

$ R_0 lt.eq beta_v S + e_o \, #h(2em) 0 lt.eq e_o := b_o - f_o^(beta_v) lt.eq epsilon.alt_b f_o^(beta_v) \/ ell \, $

where $e_o = 0$ without a marked child. For $S > 0$, a regular child’s removal is therefore at most $\( beta_v + e_o \/ S \) \( 1 + eta_i \) B_i$. The term $beta_v B_i$ is already allowed by the core decomposition $L_i^(beta_v) = n_i - beta_v B_i + f_i^(beta_v)$. The parameter gap $beta_i - beta_v$ pays the extra coefficient, provided $S$ is at least a fixed multiple of the dominant flex mass, which is comparable to $D$. At the marked child the error $e_o$ itself can be subtracted from its upper cap, since $alpha_o lt.eq 1$.

When $S$ is small relative to $D$, the ratio $e_o \/ S$ need not be controlled. We then choose side removals $omega_i$ first and give the marked child the remaining parent amount, capped by $d_o$. Superadditivity bounds its uncapped remaining amount below by

$ L_o^(beta_v) + sum_(i eq.not o) \( omega_i - beta_v B_i \) . $

It therefore suffices to bound the total signed shortfall of the side removals below $beta_v B_i$ by a small multiple of $u D \/ ell$; the marked child’s flex slack pays this error. The removals must also stay below $beta_i B_i$ to preserve the side lower bounds. The side tracker below constructs $w$ so that $omega_i = D w_i$ has both properties. Section 5 verifies the two output rules, including their zero cases, and chooses between them by overlapping comparisons of $S$ and $D$.

Near dominance also changes the simplex tracker itself. The marked child’s parameter gap can be only of order $u \/ ell$, forcing $eta_o = c_t u \/ ell$. Its potential must remain effective as $u arrow.b 0$; the different denominator below ensures this. We will also normalize its primitive at $alpha_o = 1$, so changing $u$ costs in proportion to the side sizes rather than the full dominant size.

On every nonsingleton domain set, for $y gt.eq 0$,

#[#set math.equation(numbering: n => "(4.3)")
 $ F_i \( y \) = frac(\( h_i + y \)^2, h_i) quad \( i upright(" regular") \) \, #h(2em) F_o \( y \) = u + H y \( 1 + y \) quad \( o upright(" marked") \) . $ <eq:proportion-denominators>]

#thm([Lemma 4.1.])[
  (Uniform denominator estimates).  #emph[For every nonsingleton domain above, 
#[#set math.equation(numbering: n => "(4.4)")
 $ integral_0^oo frac(d y, F_i \( y \)) lt.eq C \, #h(2em) sum_(i in I) alpha_i F_i #scale(x: 120%, y: 120%)[\(] log \( 1 \/ alpha_i \) #scale(x: 120%, y: 120%)[\)] lt.eq C sum_(i in I) alpha_i h_i $ <eq:denominator-estimates>]

 for every $alpha$ in its unit simplex. A summand at $alpha_i = 0$ means its continuous extension, which is zero. All constants are uniform as $u$ tends to zero.]
] <lem:denominators>

#proof[
  The regular integral equals $1$. For the marked child, split at $1$:
  $ integral_0^1 frac(d y, u + H y \( 1 + y \)) lt.eq frac(log \( 1 + H \/ u \), H) \, #h(2em) integral_1^oo frac(d y, u + H y \( 1 + y \)) lt.eq 1 / H . $
  Since $log \( 1 \/ u \) = H - 1$ and $log \( 1 + H \/ u \) lt.eq H - 1 + log \( 1 + H \) lt.eq 2 H$, these bounds are absolute.
  For the second assertion put $y_i = log \( 1 \/ alpha_i \)$ at positive coordinates. If $i$ is regular and $y_i lt.eq 4 h_i$, its contribution is at most $25 alpha_i h_i$. If $y_i > 4 h_i$, then $h_i gt.eq 1$ and
  $ e^(- y_i) frac(\( h_i + y_i \)^2, h_i) lt.eq C e^(- y_i) y_i^2 lt.eq C e^(- y_i \/ 2) lt.eq C e^(- h_i) . $
  Thus the regular tail is at most $C$ without a marked child and at most $C u$ with one. Without a marked child, $sum_i alpha_i h_i gt.eq 1$, which pays this tail.
  With a marked child use the elementary inequality $e^(- y) y \( 1 + y \) lt.eq C \( 1 - e^(- y) \)$, valid for all $y gt.eq 0$. It follows, including the endpoint $alpha_o = 0$, that
  $ alpha_o F_o #scale(x: 120%, y: 120%)[\(] log \( 1 \/ alpha_o \) #scale(x: 120%, y: 120%)[\)] lt.eq C { alpha_o u + H \( 1 - alpha_o \) } . $
  By (4.1), $sum_i alpha_i h_i$ bounds this last expression up to an absolute factor. It also bounds $u$ up to an absolute factor: its dominant contribution is $alpha_o u$, and its side contribution is at least $c H \( 1 - alpha_o \) gt.eq c u \( 1 - alpha_o \)$. This pays the regular tail and completes the proof. ◻
]

For held parameters and a nonnegative vector $B$, with $S = sum_i B_i$, define

#[#set math.equation(numbering: n => "(4.5)")
 $ g_i^alpha \( a \; B \) & = C_alpha ell integral_0^a frac(S - \( 1 + eta_i \) B_i \/ s, F_i \( log \( 1 \/ s \) \)) thin d s &  & \( i upright(" regular") \) \,\
g_o^alpha \( a \; B \) & = C_alpha ell integral_1^a frac(S - \( 1 + eta_o \) B_o \/ s, F_o \( log \( 1 \/ s \) \)) thin d s \, &  & \( o upright(" marked") \) \,\
G^alpha \( alpha \; B \) & = sum_(i in I) g_i^alpha \( alpha_i \; B \) . $ <eq:alpha-primitive>]

The improper integrals at zero converge by $y = log \( 1 \/ s \)$ and Lemma 11. Consequently these functions extend continuously to the whole simplex. No convexity in $alpha$ is asserted or needed.

We record the bounds needed when parameters change. Uniformly in $alpha$,

#[#set math.equation(numbering: n => "(4.6)")
 $ \| G^alpha \( alpha \; B \) - G^alpha \( alpha \; tilde(B) \) \| lt.eq C ell parallel B - tilde(B) parallel_1 . $ <eq:alpha-input-slopes>]

Here and below changing $B$ also changes $S$ to its sum. Indeed the coefficient of $B_i$ in its own $B_i \/ s$ integral is bounded by $C ell integral_0^oo d y \/ F_i \( y \)$. The sum of the coefficients of $S$ in the regular components has absolute value at most $C ell sum_i alpha_i lt.eq C ell$, because $F_i gt.eq h_i gt.eq 1$. The marked component’s $S$ coefficient is bounded by $C ell integral_(alpha_o)^1 d s \/ \( s F_o \( log \( 1 \/ s \) \) \) lt.eq C ell$. This proves (4.6) without a factor depending on the number of active children.

The component bounds are

#[#set math.equation(numbering: n => "(4.7)")
 $ \| g_i^alpha \( alpha_i \; B \) \| & lt.eq C ell \( S alpha_i + B_i \) &  & \( i upright(" regular") \) \,\
\| g_o^alpha \( alpha_o \; B \) \| & lt.eq C ell (S \( 1 - alpha_o \) + B_(upright("side")) + u S) \, & B_(upright("side")) & = sum_(i eq.not o) B_i . $ <eq:alpha-component-bounds>]

For the second bound, let $L = log \( 1 \/ alpha_o \)$, allowing $L = oo$. The change of variables in (4.5) gives

$ g_o^alpha \( alpha_o \; B \) = - C_alpha ell integral_0^L frac(S \( e^(- y) - 1 \) + B_(upright("side")) - eta_o B_o, F_o \( y \)) thin d y . $

For $0 lt.eq y lt.eq L$, the absolute numerator is at most $S \( 1 - alpha_o \) + B_(upright("side")) + eta_o S$. Since $eta_o = c_t u \/ ell$, Lemma 11 proves the bound. The base point $1$ is responsible for this cancellation; it permits parameter changes to be charged to side sizes even when the dominant size is much larger.

#thm([Lemma 4.2.])[
  (Simplex update).  #emph[Choose $C_alpha$ sufficiently large after fixing $c_t$. For any old vector $alpha^0$ in the same simplex, a global minimizer 
#[#set math.equation(numbering: n => "(4.8)")
 $ alpha^1 in "arg min"_alpha {G^alpha \( alpha \; B \) + S parallel alpha - alpha^0 parallel_1} $ <eq:alpha-minimization>]

 satisfies (4.2) and 
#[#set math.equation(numbering: n => "(4.9)")
 $ S parallel alpha^1 - alpha^0 parallel_1 lt.eq G^alpha \( alpha^0 \; B \) - G^alpha \( alpha^1 \; B \) . $ <eq:alpha-update-payment>]

 The same assertions hold with the automatic singleton rule.]
] <lem:alpha-tracker>

#proof[
  Continuity and compactness give a global minimizer, and comparison with $alpha^0$ gives (4.9). If $S = 0$, then every $B_i = 0$, the potential vanishes identically, and feasibility is automatic. We may retain $alpha^0$. Suppose henceforth that $S > 0$ and the domain is nonsingleton. For a positive coordinate write
  $ gamma_i = frac(C_alpha ell, F_i \( log \( 1 \/ alpha_i \) \)) (S - frac(\( 1 + eta_i \) B_i, alpha_i)) $
  for the derivative of its primitive. If $alpha_i = 0$ and $B_i > 0$, the inward derivative is $- oo$: the negative term has size proportional to $1 \/ \( s F_i \( log \( 1 \/ s \) \) \)$, which tends to infinity as $s arrow.b 0$.
  There must be a coordinate with derivative less than $- 2 S$, with this convention at zero. Otherwise all zero coordinates have $B_i = 0$, and the inequalities $gamma_i gt.eq - 2 S$ give
  #[#set math.equation(numbering: n => "(4.10)")
   $ 1 lt.eq sum_(alpha_i > 0) frac(alpha_i, 1 + eta_i) (1 + frac(2 F_i \( log \( 1 \/ alpha_i \) \), C_alpha ell)) . $ <eq:alpha-derivative-contradiction>]
  There is a fixed bound $eta_i lt.eq eta_max$, so, with $T_alpha = sum_i alpha_i h_i$,
  $ sum_i frac(alpha_i, 1 + eta_i) lt.eq 1 - frac(c_t, 1 + eta_max) T_alpha / ell . $
  The extra sum in (4.10) is at most $C T_alpha \/ \( C_alpha ell \)$ by (4.4). Choose $C_alpha$ so this is less than half the displayed deficit. Since $T_alpha > 0$ on every nonsingleton domain, this is a contradiction, however small $u$ and $T_alpha$ may be.
  If a coordinate violates (4.2), it is positive and has strictly positive primitive derivative. Transfer a small amount $epsilon$ from it to a coordinate whose derivative is below $- 2 S$. These coordinates are distinct and the transfer stays in the simplex. The primitive sum decreases at a rate greater than $2 S$, whereas the movement penalty can increase by at most $2 S epsilon$. At a zero receiving coordinate the one-sided derivative $- oo$ gives the same strict improvement for sufficiently small $epsilon$. This contradicts global minimality and proves feasibility. ◻
]

=== 4.2 The side tracker <the-side-tracker>

When a dominant child has sides, choose a sufficiently small absolute $c_w > 0$ and define

$ theta_i = frac(c_w h_i, ell) \, #h(2em) z_i = frac(a_i, A h_i) quad \( i upright(" a side") \) . $

Both numbers are positive. Fix an absolute $C_w$ larger than $2 sup_i \( beta^(+) + theta_i \)$, with an additional positive margin. The supremum is bounded absolutely by (4.1) and the fixed parameter interval. The side domain is $w_i gt.eq 0$, $sum_i w_i lt.eq C_w$. We require

#[#set math.equation(numbering: n => "(4.11)")
 $ D w_i & lt.eq \( beta^(+) + theta_i \) B_i &  & upright("always") \,\
D w_i & gt.eq beta^(+) B_i - theta_i z_i D &  & upright("if ") S lt.eq 2 D . $ <eq:side-feasibility>]

The total additive slack has the useful bound

#[#set math.equation(numbering: n => "(4.12)")
 $ sum_(i upright(" side")) theta_i z_i = c_w / ell sum_(i upright(" side")) a_i / A lt.eq frac(C c_w u, ell) . $ <eq:side-slack>]

With no sides, $w$ is the zero vector and all these statements use empty sums. When no dominant child is marked, set $D = 0$ for the sole purpose of writing the side movement term.

For fixed side parameters define

#[#set math.equation(numbering: n => "(4.13)")
 $ g_i^w \( w_i \; B_i \, D \) & = C'_w integral_0^(w_i) frac(D s - \( beta^(+) + theta_i \/ 2 \) B_i + D theta_i z_i \/ 2, theta_i \( s + z_i \)) thin d s \,\
G^w \( w \; B \, D \) & = sum_(i upright(" side")) g_i^w \( w_i \; B_i \, D \) . $ <eq:side-primitive>]

These potentials are continuous and affine in $\( B \, D \)$. For explicit bounds, set $L_i = log \( 1 + w_i \/ z_i \)$. Integration gives

#[#set math.equation(numbering: n => "(4.14)")
 $ g_i^w = C'_w {D / theta_i \( w_i - z_i L_i \) + frac(D z_i L_i, 2) - frac(\( beta^(+) + theta_i \/ 2 \) B_i L_i, theta_i)} . $ <eq:side-primitive-explicit>]

Since $a_i \/ A < 1$ for a side, $h_i = 1 + log \( A \/ a_i \)$, and therefore

$ log \( 1 + C_w \/ z_i \) = log (1 + C_w h_i e^(h_i - 1)) lt.eq C h_i . $

Also $0 lt.eq z_i L_i lt.eq w_i$ and $0 lt.eq w_i - z_i L_i lt.eq w_i$. It follows that

#[#set math.equation(numbering: n => "(4.15)")
 $ \| g_i^w \( w_i \; B_i \, D \) \| lt.eq C ell \( D w_i + B_i \) \,\
\| G^w \( w \; B \, D \) - G^w \( w \; tilde(B) \, tilde(D) \) \| lt.eq C ell (parallel B - tilde(B) parallel_1 + \| D - tilde(D) \|) . $ <eq:side-potential-bounds>]

In the second line the coefficient of $D$ is bounded by $C ell sum_i w_i lt.eq C ell$, and the coefficient of each $B_i$ is bounded by $C ell$. Thus no factor counts the sides.

#thm([Lemma 4.3.])[
  (Side update).  #emph[Choose the absolute multiplier $C'_w$ sufficiently large after fixing the small constants. For every old vector $w^0$ in the side domain, a global minimizer 
#[#set math.equation(numbering: n => "(4.16)")
 $ w^1 in "arg min"_w {G^w \( w \; B \, D \) + D parallel w - w^0 parallel_1} $ <eq:side-minimization>]

 satisfies (4.11), and 
#[#set math.equation(numbering: n => "(4.17)")
 $ D parallel w^1 - w^0 parallel_1 lt.eq G^w \( w^0 \; B \, D \) - G^w \( w^1 \; B \, D \) . $ <eq:side-update-payment>]

 This holds for arbitrary nonnegative $B \, D$ with $S = sum_i B_i$, without a requirement that they arise from ranks.]
] <lem:side-tracker>

#proof[
  Compactness gives existence and comparison with $w^0$ gives the payment. Suppose first that $D > 0$, and abbreviate $b = beta^(+)$, $theta = theta_i$, $z = z_i$, and $s = w_i$. At an upper violation, $B_i < D s \/ \( b + theta \)$. The numerator in (4.13) is consequently greater than
  $ frac(D theta, 2) (frac(s, b + theta) + z) . $
  Because $b + theta$ has an absolute upper bound, a large $C'_w$ makes the primitive derivative greater than $2 D$. The violating coordinate is positive and can be decreased while remaining in the side domain. The penalty changes by at most $D$ times this decrease, a contradiction to minimality.
  Having proved upper feasibility, assume $S lt.eq 2 D$. Then
  $ sum_i w_i lt.eq max_i \( b + theta_i \) frac(sum_(i upright(" side")) B_i, D) lt.eq 2 max_i \( b + theta_i \) < C_w . $
  Thus every coordinate has room for a small increase. At a lower violation, $B_i > D \( s + theta z \) \/ b$. Substitution makes the same numerator strictly less than
  $ - frac(D theta, 2) (s / b + z) \; $
  The derivative is therefore less than $- 2 D$ when $C'_w$ is large. Increasing this coordinate strictly improves the objective, again a contradiction. This proves the lower inequality.
  If $D = 0$, the upper inequality is automatic. The lower inequality is required only when $S = 0$, in which case every $B_i = 0$ and it too is automatic. The potential need not vanish when $D = 0 < S$, but minimization and its payment remain valid. If both $D = S = 0$, the potential vanishes, and retaining the old side vector is allowed. The empty side domain consists of its unique zero vector. ◻
]

=== 4.3 Adaptive parameters and domains <adaptive-parameters-and-domains>

The preceding updates will run at every step on which they are defined, regardless of which output rule is subsequently used. We now justify their total movement under all the changes from Section 3.

We use explicitly the following coarse charges, whose expected total is at most $C E_v + D_v$ by (3.21): the number of changed core flags; the sum of old and new $a_i$ at changed size coordinates; the old and new total active sizes at wholesale refreshes; the old and new side totals at changes of $U$; and $\| Delta D \|$ off wholesale steps. Here $D_v$ is finite and may depend on the fixed star and $k$, but is independent of the input law and horizon. Absolute constants may absorb the fixed coarse tolerances. The finely tracked caps $b_i$ are not arguments of either proportion potential.

#thm([Lemma 4.4.])[
  (Adaptive proportion movement).  #emph[There is a causal update schedule satisfying (4.2) and (4.11) after every step, such that 
#[#set math.equation(numbering: n => "(4.18)")
 $ bb(E) sum_(t upright(" not wholesale")) (S_t parallel alpha_t - alpha_(t - 1) parallel_1 + D_t parallel w_t - w_(t - 1) parallel_1) lt.eq C ell E_v + D'_v . $ <eq:proportion-movement>]

 Vectors are extended by zero to the fixed child set. The side term is zero without a dominant child. The simplex term includes the automatic singleton state; an empty active domain contributes zero. The finite constant $D'_v$ is uniform in the law and horizon.]
] <lem:adaptive-proportions>

#proof[
  We give the schedule and its entire accounting. All comparisons below are made on a finite set of child and rank indices.
  ===== 4.3.1 Filtering and drift precede every update decision. <filtering-and-drift-precede-every-update-decision.>
  At the start of step $t$, hold the old proportion states, old parameters, old $D$, and old core flags. First evaluate the potentials with the filtered old hidden counts, and then with the new hidden counts under the new conditioning, still using those old flags and parameters. With these quantities held, each potential is affine in the rank probabilities: for $G^w$, its term linear in the held $D$ is simply constant on these two legs. The signed expected filtering change is therefore zero. By (4.6) and (4.15), the absolute drift change is at most $C ell$ times the sum of absolute child-rank drifts. Summed over all steps, its expectation is at most $C ell E_v$. These statements concern all steps before selecting any refresh or domain-change events.
  Denote the input at the end of this evaluation by $overline(B)$: it uses the final rank probabilities and the old flags. Thus $overline(B)_i lt.eq n_i^(upright("old"))$ even if filtering made the current ranks very different. We now compute the new flags, sizes, and all other held parameters by the rules already given.
  ===== 4.3.2 Wholesale steps. <wholesale-steps.>
  At a wholesale step reinitialize the proportion domains, choose any vector in each new compact domain, and apply the appropriate minimizing updates; use the automatic rules for empty or singleton domains. The absolute old potential, evaluated at $overline(B)$ and old $D$, is at most $C ell$ times the old total active size. To see this for $G^alpha$, sum (4.7) and use $sum_i overline(B)_i lt.eq sum_i n_i^(upright("old")) lt.eq C sum_i a_i^(upright("old"))$. For $G^w$, use (4.15), $parallel w parallel_1 lt.eq C_w$, and $D^(upright("old")) lt.eq C sum_i a_i^(upright("old"))$. The new potential is bounded by the corresponding new total. Thus the entire potential jump at this step is bounded by its coarse wholesale charge times $C ell$. No movement at this step is included in (4.18).
  ===== 4.3.3 Preparing a non-wholesale domain change. <preparing-a-non-wholesale-domain-change.>
  On a non-wholesale step $A$, $beta^(+)$, and the presence and identity of the dominant mark are fixed. Empty/nonempty active transitions are wholesale, and a marked dominant coordinate cannot disappear within its epoch. Let $I^(-)$ and $I^(+)$ be the old and new active domains. Define the synthetic input on the fixed child set by
  #[#set math.equation(numbering: n => "(4.19)")
   $ B_i^(*) = cases(delim: "{", B_i^(upright("new")) \, & i in I^(-) ∩ I^(+) \,, 0 \, & upright("otherwise") \,) #h(2em) S^(*) = sum_i B_i^(*) . $ <eq:synthetic-core-input>]
  If $K_t$ is the number of changed core flags, then
  #[#set math.equation(numbering: n => "(4.20)")
   $ parallel overline(B) - B^(*) parallel_1 lt.eq K_t \, #h(2em) parallel B^(upright("new")) - B^(*) parallel_1 lt.eq K_t \, #h(2em) 0 lt.eq S^(upright("new")) - S^(*) lt.eq K_t . $ <eq:synthetic-core-errors>]
  For common indices, the first discrepancy is just the sum over changed flags, and each rank probability lies in $\[ 0 \, 1 \]$. For an index leaving the active domain, all its new flags are zero, so every old flag there is changed. For an entering index, all its old flags were zero, so every new flag there is changed. These observations prove all three bounds.
  Replace $overline(B)$ by $B^(*)$ and old $D$ by $D^(upright("new"))$, holding the old domains and their other parameters. The input slope bounds charge this potential change to $C ell \( K_t + \| D^(upright("new")) - D^(upright("old")) \| \)$. Run the minimizing updates on the old domains with inputs $\( B^(*) \, S^(*) \, D^(upright("new")) \)$. Denote the resulting vectors by $alpha^1 \, w^1$. Lemmas 12 and 13 apply because their feasibility proofs use only nonnegativity of these inputs and the held parameter bounds. They pay
  #[#set math.equation(numbering: n => "(4.21)")
   $ S^(*) parallel alpha^1 - alpha^(upright("old")) parallel_1 \, #h(2em) D^(upright("new")) parallel w^1 - w^(upright("old")) parallel_1 $ <eq:prepared-movement>]
  by decreases of the respective potentials.
  Next delete departing coordinates and insert zero coordinates at entering indices. If $S^(*) > 0$, a departing coordinate has $B_i^(*) = 0$, so (4.2) forces $alpha_i^1 = 0$. Deletion and zero insertion then preserve the simplex and cause no movement. If $S^(*) = 0$, every $B_i^(*) = 0$, the alpha potential is zero, and we may redistribute the simplex mass to any vector in the new nonempty domain at zero weighted cost. If $D^(upright("new")) > 0$, the upper inequality in (4.11) forces $w_i^1 = 0$ at each departing side. If $D^(upright("new")) = 0$, deletion of side coordinates has zero weighted cost, and their primitive components vanish because $B_i^(*) = D^(upright("new")) = 0$ there. Inserting a coordinate at zero always gives zero component potential. Write $alpha^2 \, w^2$ for the vectors on the new domains after this operation.
  ===== 4.3.4 Changing the held parameters. <changing-the-held-parameters.>
  Continue to use $B^(*)$ and $D^(upright("new"))$. At common regular coordinates the prepared state satisfies
  #[#set math.equation(numbering: n => "(4.22)")
   $ S^(*) alpha_i^2 lt.eq C B_i^(*) \, #h(2em) D^(upright("new")) w_i^2 lt.eq C B_i^(*) quad \( i upright(" a side") \) . $ <eq:prepared-coordinate-bounds>]
  The assertions also hold at inserted zero coordinates, and at $S^(*) = 0$ or $D^(upright("new")) = 0$ with the evident zero left side. The regular parameters $h_i \, eta_i \, F_i$ and, on sides, $theta_i \, z_i$ change only if $a_i$ changes. Bound the absolute old and new component values using (4.7), (4.15), and (4.22). Their jump is at most $C ell B_i^(*) lt.eq C ell n_i^(upright("new")) lt.eq C ell a_i^(upright("new"))$, which is paid by the old-plus-new size charge at that coordinate. Departing and inserted components have already been seen to give zero extra jump.
  For a change in $u$, the prepared alpha vector satisfies
  $ S^(*) \( 1 - alpha_o^2 \) lt.eq C B_(upright("side"))^(*) \, #h(2em) B_(upright("side"))^(*) lt.eq C sum_(i upright(" new side")) a_i^(upright("new")) \, #h(2em) S^(*) lt.eq C A . $
  The first inequality follows by summing prepared side feasibility when $S^(*) > 0$ and is automatic when $S^(*) = 0$; the last uses the new core-size bound and the epoch comparison of total size with $A$. Applying the dominant component bound on both sides of the parameter change shows that its jump is at most
  $ C ell (B_(upright("side"))^(*) + \( u^(upright("old")) + u^(upright("new")) \) S^(*)) lt.eq C ell (U^(upright("old")) + U^(upright("new"))) . $
  This is a side-total charge, not a dominant-size charge. It includes the appearance of the first side or disappearance of the last side. To spell out these endpoints, on a singleton domain the potential is zero. If $S^(*) > 0$, preparation forces all mass onto $o$ when the common side input is zero, and the dominant primitive at $alpha_o = 1$ is zero. If $S^(*) = 0$, the whole alpha potential is zero. Thus assigning the singleton potential to be zero is compatible with the estimates on both sides of either transition. The side vector on an empty side domain is its unique zero vector.
  ===== 4.3.5 The final update and its movement weight. <the-final-update-and-its-movement-weight.>
  With the new domains and parameters now installed, replace $B^(*)$ by $B^(upright("new"))$, paying at most $C ell K_t$ by (4.20) and the input slope bounds. Run the two minimizing updates once more, now starting at $alpha^2 \, w^2$ and using the final inputs. This pays $S^(upright("new")) parallel alpha^(upright("new")) - alpha^2 parallel_1$ and $D^(upright("new")) parallel w^(upright("new")) - w^2 parallel_1$.
  The triangle inequality converts these payments to the differences between the final and old states. The alpha vectors at all these substeps have norm one, hence any two are at distance at most two. The domain-transition movement has weight zero at $S^(*)$. Writing $delta = S^(upright("new")) - S^(*) gt.eq 0$, we obtain
  #[#set math.equation(numbering: n => "(4.23)")
   $ S^(upright("new")) parallel alpha^(upright("new")) - alpha^(upright("old")) parallel_1 & lt.eq S^(*) parallel alpha^1 - alpha^(upright("old")) parallel_1 + S^(upright("new")) parallel alpha^(upright("new")) - alpha^2 parallel_1 + 4 delta \,\
D^(upright("new")) parallel w^(upright("new")) - w^(upright("old")) parallel_1 & lt.eq D^(upright("new")) parallel w^1 - w^(upright("old")) parallel_1 + D^(upright("new")) parallel w^(upright("new")) - w^2 parallel_1 . $ <eq:adaptive-weight-comparison>]
  The first error is at most $4 K_t$. The second inequality needs no change of weight, since both side updates used $D^(upright("new"))$. These statements also cover zero weights and singleton states.
  ===== 4.3.6 Telescoping and uniformity. <telescoping-and-uniformity.>
  Let $cal(G)_t = G_t^alpha + G_t^w$ after the final update. On non-wholesale steps the sum of the paid minimizing movements is at most $cal(G)_(t - 1) - cal(G)_t$, plus the signed old-parameter filtering/drift change and the parameter/input charges just listed. On wholesale steps the same inequality holds with no movement term and with the wholesale charge. Summing over #emph[all] steps retains the zero expected filtering sum; it does not condition that assertion on an adaptively selected subset of steps. Expected drift costs at most $C ell E_v$, and all remaining changes cost at most $C ell$ times the coarse charges. Equation (4.23) therefore gives (4.18), apart from the initial and terminal potential magnitudes.
  Those magnitudes have a uniform finite bound. At a valid state, $sum_i B_i lt.eq sum_i n_i lt.eq C k$, $D lt.eq C k$, $parallel alpha parallel_1 lt.eq 1$, and $parallel w parallel_1 lt.eq C_w$. The component bounds give $\| cal(G)_t \| lt.eq C ell k$, including arbitrarily small positive $u$. Only the fixed collection of rank and parameter trackers contributes the other finite initialization allowances. Their states persist through all epochs and inactive intervals; no new allowance is assigned when a label or coordinate returns. Thus $D'_v$ is independent of the number of steps, histories, refreshes, and domain changes. The schedule uses only current observed posteriors and prior states. Global minimizers can be selected by fixed tie-breaking on the compact finite-dimensional domains, so it is causal. ◻
]

== 5 Feasible outputs and completion of the allocation bound <sec:allocation-finish>

The proportion vectors now satisfy the constraints needed for the two removal rules described in Section 4. We define the outputs, choose the absolute constants that preserve every child’s lower bound, and prove their movement estimate. A hysteresis rule will keep changes between the two formulas within the same movement budget.

All notation in this section is local to a star with parent $v$, unless a sum over stars is displayed. In particular, $S = sum_i B_i$, $d_i = n_i + b_i$, and $T = f_o^(beta_v)$ when a dominant child $o$ exists. Inactive coordinates, including their caps and outputs, are zero. We extend proportion vectors by zero to the fixed child set when comparing two times. A marked child persists throughout its epoch; changes of its identity, and transitions between empty and nonempty active sets, occur only at wholesale steps.

=== 5.1 The output rules and the choice of constants <the-output-rules-and-the-choice-of-constants>

The local data and proportion updates of Sections 3 and 4 do not use the current parent allocation. Perform all of those updates first. Once $q_v$ has been obtained in the top-down traversal, put

#[#set math.equation(numbering: n => "(5.1)")
 $ R_0 = (sum_i d_i - q_v)_(+) . $ <eq:required-holes>]

If there is no active child, put every child output equal to zero. Otherwise there are two possible rules:

#[#set math.equation(numbering: n => "(5.2)")
 $ upright("I:") #h(2em) & q_i = d_i - R_0 alpha_i quad upright("for every active ") i \;\
upright("II:") #h(2em) & q_i = d_i - D w_i quad \( i eq.not o upright(" active") \) \, & q_o = min {d_o \, q_v - sum_(i eq.not o) q_i} . $ <eq:output-rule-one>]

Rule II is defined only when a dominant child exists. With no dominant child we always use Rule I. With a dominant child, the allowed ranges are

#[#set math.equation(numbering: n => "(5.3)")
 $ upright("I requires ") S gt.eq D \/ 2 \, #h(2em) upright("II requires ") S lt.eq 2 D . $ <eq:regime-ranges>]

At initialization and after a wholesale refresh, choose either rule in its allowed range, with a fixed tie rule. On other steps retain the old rule unless it leaves its allowed range. Thus an I-to-II switch occurs only at $S < D \/ 2$, and an II-to-I switch only at $S > 2 D$. The ranges cover all $S \, D gt.eq 0$, including $S = D = 0$.

We specify the dependencies among the absolute constants before verifying these formulas. The rank functions, coarse size tolerances, and parameter gaps give fixed constants

$ 3 lt.eq beta_v lt.eq beta_max \, #h(2em) 0 lt.eq h_i \/ ell lt.eq H_0 \, #h(2em) c_D T lt.eq D lt.eq C_D T \, $

where the last comparison includes the assertion that $D$ and $T$ vanish together. Write $c_g$ for the constant in (3.22). At noncore ranks the parameter derivative is bounded below by a fixed positive multiple of the rank function. Consequently there is an absolute $c_s > 0$ such that, for a dominant child,

#[#set math.equation(numbering: n => "(5.4)")
 $ L_o^(beta_v) - L_o^(beta_o) gt.eq c_s u / ell T . $ <eq:dominant-output-slack>]

Indeed the core contribution to this difference is $\( beta_o - beta_v \) B_o gt.eq 0$. Affinity in the parameter and the derivative comparison give $f_o^(beta_v) - f_o^(beta_o) gt.eq c_f \( beta_o - beta_v \) f_o^(beta_v)$, and the gap is at least $c_g u \/ ell$. This proof also covers $T = 0$ and $u = 0$.

Let $C_z$ be an absolute constant for which (4.12) reads $sum_(i eq.not o) theta_i z_i lt.eq C_z c_w u \/ ell$. Choose $c_t \, c_w \, epsilon.alt_b > 0$ so small that

#[#set math.equation(numbering: n => "(5.5)")
 $ c_t H_0 lt.eq 1 \, #h(2em) beta_max c_t lt.eq c_g \/ 4 \, #h(2em) c_w H_0 lt.eq 1 \, #h(2em) c_w lt.eq c_g \/ 4 \,\
C_z c_w C_D lt.eq c_s \/ 2 \, #h(2em) 4 epsilon.alt_b \/ c_D lt.eq c_g \/ 4 . $ <eq:output-constant-smallness>]

These choices involve only previously fixed absolute constants. Next choose the cap margin $lambda_b$, the parameter error $epsilon.alt$, and the fine tracking tolerance $rho$ as in Lemma 10, decreasing $epsilon.alt$ further so that $epsilon.alt lt.eq c_g \/ 4$. It follows that every side satisfies

#[#set math.equation(numbering: n => "(5.6)")
 $ beta^(+) + theta_i lt.eq beta_v + frac(epsilon.alt + c_w h_i, ell) lt.eq beta_v + frac(c_g h_i, 2 ell) lt.eq beta_i . $ <eq:side-parameter-room>]

Here $h_i gt.eq 1$ on regular coordinates. The cap proof permits arbitrarily small final choices of $epsilon.alt \, rho$ after $lambda_b$ is fixed. The bounded-domain constant $C_w$ and the potential multipliers in Section 4 may now be taken sufficiently large. For instance the required bound on $C_w$ uses only $beta^(+) + theta_i lt.eq beta_max + 1$. This order fixes every local constant independently of $k$, the degree, the depth, and the separation ratio $tau$. We choose $tau$ only after proving the local movement estimate.

#thm([Lemma 5.1.])[
  (Feasibility of the outputs).  #emph[Suppose $q_v gt.eq L_v^(beta_v)$. The selected output rule satisfies 
$ L_i^(beta_i) lt.eq q_i lt.eq d_i lt.eq C M_i lt.eq C m_i \, #h(2em) sum_i q_i lt.eq q_v \, $

 with an absolute constant $C$. In particular every child output is nonnegative. The conclusions include empty active sets, empty side sets, and vanishing values of $S \, D \, T$.]
] <lem:output-feasibility>

#proof[
  Superadditivity at the single parameter $beta_v$ gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ q_v gt.eq L_v^(beta_v) gt.eq sum_i L_i^(beta_v) . $ <eq:parent-lower-for-output>]
  Inactive children have no core ranks and no positive lower-bound terms, so their required lower bounds and their outputs are both zero. For active children, expand $L_i^(beta_v) = n_i - beta_v B_i + f_i^(beta_v)$. Set $e_o = b_o - T$ when a dominant child exists, and $e_o = 0$ otherwise. Lemma 10 implies
  #[#set math.equation(numbering: n => "(5.8)")
   $ 0 lt.eq e_o lt.eq epsilon.alt_b T \/ ell \, #h(2em) R_0 lt.eq beta_v S + e_o . $ <eq:required-hole-bound>]
  To obtain the second inequality, subtract (5.7) from $sum_i d_i$: regular flex caps contribute nonpositive errors, and only the dominant cap can contribute the error $e_o$.
  First consider Rule I with $S > 0$. If there is a dominant child, (5.3) and $D gt.eq c_D T$ give
  #[#set math.equation(numbering: n => "(5.9)")
   $ T lt.eq 2 S \/ c_D \, #h(2em) e_o \/ S lt.eq 2 epsilon.alt_b \/ \( c_D ell \) . $ <eq:rule-one-flex-comparison>]
  The same bound on the error holds with error zero when there is no dominant child. At a regular child, (4.2) and (5.8) yield
  $ R_0 alpha_i lt.eq \( beta_v + e_o \/ S \) \( 1 + eta_i \) B_i . $
  By $eta_i = c_t h_i \/ ell$, $eta_i lt.eq 1$, and (5.5),
  $ \( beta_v + e_o \/ S \) \( 1 + eta_i \) - beta_v & lt.eq beta_max c_t h_i \/ ell + 4 epsilon.alt_b \/ \( c_D ell \)\
 & lt.eq c_g h_i \/ \( 2 ell \) lt.eq beta_i - beta_v . $
  Thus $R_0 alpha_i lt.eq beta_i B_i$, and the lower cap bound gives $q_i gt.eq n_i - beta_i B_i + f_i^(beta_i) = L_i^(beta_i)$. For the dominant coordinate use $alpha_o lt.eq 1$ on the error term:
  $ R_0 alpha_o lt.eq beta_v \( 1 + eta_o \) B_o + e_o lt.eq beta_o B_o + e_o . $
  Here $h_o = u$, so the same small choice of $c_t$ works even for arbitrarily small positive $u$, and gives equality in the relevant error when $u = 0$. Since $b_o - e_o = T gt.eq f_o^(beta_o)$, this proves the dominant lower bound as well.
  If $S = 0$ in Rule I, the presence of a dominant child forces $D = 0$ by its allowed range, and therefore $T = e_o = 0$. Without a dominant child the error is zero by definition. In either case (5.8) gives $R_0 = 0$, so no division by $S$ is used: the outputs are their caps. At regular children the cap lower bound suffices, and at the dominant child $B_o = T = 0$ gives the claim. For any nonempty active set, the simplex identity gives
  $ sum_i q_i = sum_i d_i - R_0 = min {sum_i d_i \, q_v} lt.eq q_v . $
  Every hole is nonnegative, so $q_i lt.eq d_i$; the proved lower bound ensures nonnegativity.
  Now consider Rule II. Its side holes satisfy, by (4.11) and (5.6),
  $ 0 lt.eq D w_i lt.eq \( beta^(+) + theta_i \) B_i lt.eq beta_i B_i . $
  The side lower bounds follow from $b_i gt.eq f_i^(beta_i)$, exactly by subtracting these holes from $n_i + b_i$. Write $q_o^(upright("rem")) = q_v - sum_(i eq.not o) \( d_i - D w_i \)$ for the uncapped remaining amount. The upper flex caps on the sides and (5.7) imply
  $ q_o^(upright("rem")) & gt.eq L_o^(beta_v) + sum_(i eq.not o) \( - beta_v B_i + D w_i \)\
 & gt.eq L_o^(beta_v) - D sum_(i eq.not o) theta_i z_i\
 & gt.eq L_o^(beta_v) - C_z c_w C_D frac(u T, ell) gt.eq L_o^(beta_o) . $
  The second line uses the lower inequality of (4.11), which applies because Rule II has $S lt.eq 2 D$, together with $beta^(+) gt.eq beta_v$. The last line uses (5.4) and (5.5). Independently, $d_o = n_o + b_o gt.eq n_o + f_o^(beta_o) gt.eq L_o^(beta_o)$. Taking the smaller of these two admissible dominant amounts preserves its lower bound. It also gives the parent budget and the upper cap.
  For completeness, when $D = 0$ in Rule II its range forces $S = 0$, and the comparison with $T$ forces $T = 0$. All side holes vanish and (5.8) gives $R_0 = 0$; thus the dominant cap also fits within the remaining budget. When there are no sides, $u = 0$, the side sums are empty, and both rules simply give $q_o = min { d_o \, q_v }$. No side denominator or proportion is needed in this case. An empty active set was already assigned zero outputs. Finally the cap estimate $d_i lt.eq C M_i$, together with $M_i lt.eq m_i$, proves the claimed domination in every case. ◻
]

=== 5.2 Paying for changes of rule <paying-for-changes-of-rule>

We next bound the cost of the hysteresis rule without assuming that the absolute variation of the posterior sum $S$ is small. Fix a finite horizon and let $cal(W)_v$ be the wholesale steps for this star. The coarse charge $C_(v \, t)$ in (3.21) pays core-flag changes, the variation of $D$, and, on wholesale steps, the old plus new active size totals. All of its coefficients are absolute. Define the switch charge

#[#set math.equation(numbering: n => "(5.10)")
 $ J_(v \, t) = cases(delim: "{", D_t \, & t in.not cal(W)_v upright(" is an I-to-II switch") \,, S_t \, & t in.not cal(W)_v upright(" is an II-to-I switch") \,, 0 \, & upright("otherwise") .) $ <eq:switch-charge>]

There is a fixed finite constant $D_v^(upright("sw"))$, independent of the hidden-process law and horizon, for which

#[#set math.equation(numbering: n => "(5.11)")
 $ bb(E) sum_t J_(v \, t) lt.eq C E_v + D_v^(upright("sw")) . $ <eq:switch-budget>]

Here is the full potential accounting for this claim. At the end of a step use

#[#set math.equation(numbering: n => "(5.12)")
 $ Psi_v = cases(delim: "{", D \, & upright("a dominant child exists and the rule is I") \,, S \, & upright("a dominant child exists and the rule is II") \,, 0 \, & upright("no dominant child exists") .) $ <eq:switch-potential>]

Start every step by holding the old rule, mark, flags, and $D$ fixed. On this frozen state, the filtering change of $Psi_v$ is either zero or the filtering change of the sum of the old flagged rank posteriors. Write $F_(v \, t)$ for this signed change. The tower property gives

#[#set math.equation(numbering: n => "(5.13)")
 $ bb(E) \[ F_(v \, t) divides cal(F)_(t - 1) \] = 0 . $ <eq:switch-filtering-zero>]

On the subsequent drift leg, still with those old data fixed, the increase is at most the sum of the absolute child-rank drifts at that step. Denote this nonnegative sum by $e_(v \, t)$; it has $bb(E) sum_t e_(v \, t) lt.eq E_v$.

On a non-wholesale step, changing the core flags changes the old-rule potential by at most the number of changed flags, since each current rank posterior lies in $\[ 0 \, 1 \]$. Updating $D$ changes it by at most $\| Delta D \|$. The other local updates leave this potential unchanged. With the new inputs now in place, an I-to-II switch changes the potential from $D_t$ to $S_t < D_t \/ 2$, a drop of at least $D_t \/ 2$. An II-to-I switch changes it from $S_t$ to $D_t < S_t \/ 2$, a drop of at least $S_t \/ 2$.

On a wholesale step we do not claim switch credit. The old frozen value of $S$, even after filtering and drift, is at most the old number of core flags, and that number is bounded by a constant times the old active size total. The old held $D$ has the same size bound. The newly chosen potential is likewise bounded by a constant times the new active size total. Thus the entire reset of this potential costs at most $C C_(v \, t)$. We obtain on every step the single inequality

#[#set math.equation(numbering: n => "(5.14)")
 $ Psi_v \( t \) - Psi_v \( t - 1 \) lt.eq F_(v \, t) + e_(v \, t) + C C_(v \, t) - 1 / 2 J_(v \, t) . $ <eq:switch-one-step>]

Importantly, $F_(v \, t)$ is included on #emph[every] step before the wholesale and switch tests; it is never multiplied by the indicator of an event chosen from the new posteriors. Taking expectations, summing, and using $Psi_v \( t \) gt.eq 0$ gives (5.11) from (3.21). The initial value is at most $C k$, uniformly over valid states. This proves the asserted independence of law and horizon for this additional constant.

=== 5.3 The local movement estimate <the-local-movement-estimate>

#thm([Lemma 5.2.])[
  (Movement on a star).  #emph[For the outputs above and a fixed star $v$, there is a finite $D_v^(upright("out"))$, depending only on its fixed finite structure and $k$, such that 
#[#set math.equation(numbering: n => "(5.15)")
 $ bb(E) sum_t sum_(i upright(" child of ") v) \| q_i \( t \) - q_i \( t - 1 \) \| lt.eq C_(upright("par")) bb(E) sum_t \| q_v \( t \) - q_v \( t - 1 \) \| + C ell E_v + D_v^(upright("out")) . $ <eq:star-output-movement>]

 Here $C_(upright("par"))$ and $C$ are absolute, independent of $k$, degree, depth, and $tau$. In fact the output estimates below allow $C_(upright("par")) = 1$.]
] <lem:star-movement>

#proof[
  Compare the vectors of holes $zeta_i = d_i - q_i$, adding cap variation at the end. By Lemma 15 these vectors are nonnegative. In Rule I one has
  #[#set math.equation(numbering: n => "(5.16)")
   $ zeta = R_0 alpha \, #h(2em) parallel zeta parallel_1 = R_0 . $ <eq:rule-one-hole-identity>]
  In Rule II let $omega_i = D w_i$ on the sides and $W_(upright("side")) = sum_(i eq.not o) omega_i$. The definition of the dominant output gives the exact identities
  #[#set math.equation(numbering: n => "(5.17)")
   $ zeta_i & = omega_i quad \( i eq.not o \) \, & zeta_o & = \( R_0 - W_(upright("side")) \)_(+) \, & parallel zeta parallel_1 & = max { R_0 \, W_(upright("side")) } . $ <eq:rule-two-hole-identity>]
  Indeed before replacing the signed excess by its positive part the dominant hole equals $\( sum_i d_i - q_v - W_(upright("side")) \)_(+)$, and $W_(upright("side")) gt.eq 0$ allows that replacement. These identities remain valid when $D$, $S$, or the side set vanishes.
  Suppress the time index and use superscripts $- \, +$ for old and new step-end values. On a non-wholesale step the dominant mark, if any, is the same at both times. First suppose both times use Rule I and the active sets are nonempty. Adding and subtracting $R_0^(+) alpha^(-)$, and using $parallel alpha^(-) parallel_1 = 1$, gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ parallel Delta zeta parallel_1 lt.eq \| Delta R_0 \| + R_0^(+) parallel Delta alpha parallel_1 lt.eq \| Delta R_0 \| + C S^(+) parallel Delta alpha parallel_1 . $ <eq:hole-movement-one>]
  The last bound follows from (5.8) and (5.9), with the zero case proved in Lemma 15. If the active sets are empty at both times the hole change is zero. A change between empty and nonempty is wholesale and is treated below.
  If both times use Rule II, the positive-part map is 1-Lipschitz, so (5.17) gives
  #[#set math.equation(numbering: n => "(5.19)")
   $ parallel Delta zeta parallel_1 & lt.eq \| Delta R_0 \| + 2 parallel Delta omega parallel_1\
 & lt.eq \| Delta R_0 \| + 2 D^(+) parallel Delta w parallel_1 + 2 C_w \| Delta D \| . $ <eq:hole-movement-two>]
  For the first line, the change in the side-hole total is at most $parallel Delta omega parallel_1$; the other copy is the change of the side vector itself. For the second, use $Delta \( D w \) = D^(+) Delta w + \( Delta D \) w^(-)$ and $parallel w^(-) parallel_1 lt.eq C_w$. Inserting or deleting a side causes no extra term because these vectors have been extended by zero.
  At an I-to-II switch, $S^(+) < D^(+) \/ 2$, so (5.8) and $T^(+) lt.eq D^(+) \/ c_D$ show $R_0^(+) lt.eq C D^(+)$. The new hole total is at most $max { R_0^(+) \, C_w D^(+) } lt.eq C D^(+)$. The old total is $R_0^(-)$, which is at most $R_0^(+) + \| Delta R_0 \|$. Nonnegativity of the two hole vectors therefore yields
  #[#set math.equation(numbering: n => "(5.20)")
   $ parallel Delta zeta parallel_1 lt.eq C D^(+) + \| Delta R_0 \| . $ <eq:hole-downcross>]
  At an II-to-I switch, $S^(+) > 2 D^(+)$, whence $D^(+) lt.eq S^(+) \/ 2$ and $R_0^(+) lt.eq C S^(+)$. The old total is at most $R_0^(-) + C_w D^(-)$, while the new total is $R_0^(+)$. Using $R_0^(-) lt.eq R_0^(+) + \| Delta R_0 \|$ and $D^(-) lt.eq D^(+) + \| Delta D \|$ gives
  #[#set math.equation(numbering: n => "(5.21)")
   $ parallel Delta zeta parallel_1 lt.eq C S^(+) + C_w \| Delta D \| + \| Delta R_0 \| . $ <eq:hole-upcross>]
  These two arguments bound the full change across a switch without requiring the unused rule to have held at the preceding inputs.
  Finally, positive part is 1-Lipschitz in (5.1), and therefore
  #[#set math.equation(numbering: n => "(5.22)")
   $ \| Delta R_0 \| lt.eq sum_i \| Delta d_i \| + \| Delta q_v \| \, #h(2em) sum_i \| Delta q_i \| lt.eq sum_i \| Delta d_i \| + parallel Delta zeta parallel_1 . $ <eq:cap-parent-variation>]
  Combining all the non-wholesale cases gives one useful pointwise bound, with a single copy of the parent movement:
  #[#set math.equation(numbering: n => "(5.23)")
   $ sum_i \| Delta q_i \| lt.eq  & \| Delta q_v \| + 2 sum_i \| Delta d_i \|\
 & + C (S^(+) parallel Delta alpha parallel_1 + D^(+) parallel Delta w parallel_1 + \| Delta D \| + J_(v \, t)) . $ <eq:output-pointwise-movement>]
  Only defined tracker terms are included. In particular they are zero for an empty active set, and the side term is zero without sides or a dominant child.
  At a wholesale step use the actual output domination directly:
  #[#set math.equation(numbering: n => "(5.24)")
   $ sum_i \| Delta q_i \| lt.eq sum_i \( q_i^(-) + q_i^(+) \) lt.eq C (sum_i a_i^(-) + sum_i a_i^(+)) lt.eq C C_(v \, t) . $ <eq:wholesale-output-movement>]
  There is no per-child or per-epoch initialization charge here; the sum of sizes is exactly the wholesale quantity already paid. Take expectations and sum (5.23) over non-wholesale steps and (5.24) over wholesale steps. The fine cap budget (3.25), the proportion budget (4.18), the coarse budget (3.21), and (5.11) give (5.15). Cap movement is added once; it is never used as an input to a potential having an $O \( ell \)$ input slope. The coefficient of the parent variation in (5.23) is one, which proves the claimed absolute bound on $C_(upright("par"))$. ◻
]

=== 5.4 Uniform initialization and the tree sum <uniform-initialization-and-the-tree-sum>

We record why the finite constants just used are uniform over laws and horizons. For a fixed star there are finitely many rank trackers, namely $k$ ranks per child and the ranks used at the parent. Each elementary reference potential is $p \( 1 - p \) + \( p - p^compose \)^2$ with $p \, p^compose in \[ 0 \, 1 \]$, and hence has a fixed bounded range. Its tracking tolerance is fixed once $k$ is fixed. This bounds all initial and terminal reference allowances uniformly over the posteriors. Superadditivity gives $sum_i M_i lt.eq k$; active size totals and core counts are at most $C k$, and $D lt.eq C k$. The coarse refresh accounting thus has a uniform finite initialization allowance as well.

For the proportion potentials, $parallel alpha parallel_1 = 1$ and $parallel w parallel_1 lt.eq C_w$. The regular component estimates in Section 4 sum to $C ell k$, and the dominant component estimate has that same bound uniformly as $u$ tends to zero. The side-potential components sum to $C ell \( D parallel w parallel_1 + S \) lt.eq C ell k$. Their signed terminal values therefore have a uniform finite lower bound, as required for their telescopes. The switch potential is nonnegative and bounded by $C k$. These bounds use finitely many fixed tracker coordinates and one pair of endpoints for each telescope, never the number of histories, requests, or epochs. Wholesale reinitializations are paid jumps within those same telescopes. Trackers remain attached to the fixed vertices even while their coordinates are inactive; reusing a vertex label never creates a new unpaid endpoint allowance.

Initialize the star data at time zero with the stated tracking rules, run the proportion minimizations, and choose a valid regime. Set $q_(upright("root")) = k$ and propagate the outputs top down. The root has $L_(upright("root"))^(beta_(upright("root"))) = k$, since its hidden count is always $k$. Lemma 15 therefore proves by induction, at initialization and after each step,

$ q_v gt.eq L_v^(beta_v) \, #h(2em) 0 lt.eq q_v lt.eq C_0 m_v \, #h(2em) sum_(i upright(" child of ") v) q_i lt.eq q_v $

for one absolute $C_0$, enlarging it to cover the root. At the required leaf $x$, its hidden count is at least one almost surely under the current posterior. Hence $p_(x 1) = 0$, $l^(beta_x) \( 0 \) = 1$, and $q_x gt.eq 1$. All choices have used only the observed history and its conditional laws.

It remains to sum the movement estimate. Multiply (5.15) for an internal vertex $v$ by $r_(\| v \|)$, and sum over the fixed finite tree. Every nonroot vertex appears exactly once as a child, with weight $r_(\| v \| - 1)$, so the left-hand side is the quantity $V$ in Theorem 5. The root has no movement. At every other internal vertex the parent term has weight $r_(\| v \|) = r_(\| v \| - 1) \/ tau$. Thus

#[#set math.equation(numbering: n => "(5.25)")
 $ V lt.eq C_(upright("par")) / tau V + C ell sum_(v upright(" internal")) r_(\| v \|) E_v + D_(upright("tree")) \, #h(2em) D_(upright("tree")) = sum_(v upright(" internal")) r_(\| v \|) D_v^(upright("out")) < oo . $ <eq:allocation-absorption>]

The rank-drift coupling (3.4) bounds the middle sum by $6 P$, uniformly for $tau gt.eq 2$. Choose any absolute $tau gt.eq max { 2 \, 2 C_(upright("par")) }$; it may be enlarged later to meet the independent rounding requirement. Absorbing the first term yields

$ V lt.eq 12 C ell P + 2 D_(upright("tree")) . $

The constants multiplying movement have no dependence on the depth, degree, number of leaves, or $k$. The finite additive constant may depend on the fixed tree, its radii, and $k$, but the uniform endpoint bounds above show that it is independent of the law and horizon. This proves Theorem 5.

== 6 A compact potential for partition edits <sec:pilot>

The partitions change with the posterior counting measure. We will pay their edits by decreases of a potential, so we must first bound its increases when a comparator member moves. A Lipschitz estimate at each scale would charge the same movement once per level. The improvement comes from local concentration: when almost all nearby mass lies close to the request, a minimizing integrand has a much smaller positive slope there. The errors in this slope estimate sum to one logarithm through ball-mass ratios.

The potential is a minimum of linear functions of the measure. This makes filtering inexpensive by concavity. To control physical movement, we analyze the minimizing functions themselves: concentration forces an auxiliary site of nearly unit weight near the request, and relocating that site bounds its displacement. These two properties give the required slope estimate.

We use the true-metric measures from Section 2. Thus, after the new request $x$ has been revealed,

#[#set math.equation(numbering: n => "(6.1)")
 $ mu^(+) = mu^(-) - nu + delta_x \, #h(2em) nu lt.eq mu^(-) \, #h(2em) nu \( Y \) = 1 \, #h(2em) e_x = integral_Y d \( x \, y \) thin d nu \( y \) \, $ <eq:pilot-mover>]

and both counting measures have total mass $k$. The radii are $r_j = r_0 tau^(- j)$, $1 lt.eq j lt.eq J$, with $tau gt.eq 2$. The expectation of the sum of the quantities $e_x$ is $Q$.

=== 6.1 The finite-dimensional minimization <the-finite-dimensional-minimization>

A #emph[template] consists of fixed numbers $0 < sigma lt.eq 1$, $R gt.eq 256$, and $L gt.eq 0$. Put

$ D_(*) = 10 R \, #h(2em) D_1 = 10 D_(*) = 100 R . $

All distances in the definitions of the following scalar functions are dimensionless:

#[#set math.equation(numbering: n => "(6.2)")
 $ b \( v \) & = max { 0 \, min { 1 \, 2 - v \/ sigma } } \,\
a \( v \) & = cases(delim: "{", min { v^2 \/ sigma^2 \, 1 } \, & 0 lt.eq v lt.eq R \,, 2 - v \/ R \, & R lt.eq v lt.eq 2 R \,, 0 \, & v gt.eq 2 R \,)\
G \( v \) & = max { 0 \, min { 1 \, v \/ D_(*) - 1 } } . $ <eq:pilot-bumps>]

In particular, $b$ is one on $\[ 0 \, sigma \]$ and zero on $\[ 2 sigma \, oo \)$; $a$ is one on $\[ sigma \, R \]$; and $G$ is zero on $\[ 0 \, D_(*) \]$ and one on $\[ 2 D_(*) \, oo \)$. Their Lipschitz constants are, respectively, $1 \/ sigma$, at most $2 \/ sigma$, and $1 \/ D_(*)$. At radius $r$ abbreviate $a_s \( p \) = a \( d \( s \, p \) \/ r \)$, and use the same convention for $b_s \, G_s$.

Let $cal(Z)_r$ be the set of vectors $z = \( z_s \)_(s in Y)$ satisfying

#[#set math.equation(numbering: n => "(6.3)")
 $ & z_s gt.eq 0 \, #h(2em) sum_(s in Y) \( z_s - G_s \( p \) \)_(+) lt.eq 1 quad \( p in Y \) \,\
 & d \( s \, s' \) gt.eq 5 sigma r quad upright("whenever ") s eq.not s' upright(" and ") z_s z_(s') > 0 . $ <eq:pilot-feasible>]

Here $\( u \)_(+) = max { u \, 0 }$. For $g : Y arrow.r \[ 0 \, 1 \]$ with $r "Lip" \( g \) lt.eq L$, define

#[#set math.equation(numbering: n => "(6.4)")
 $ F_z^g \( p \) & = \( 1 + g \( p \) \) (1 - sum_s z_s b_s \( p \)) + 256 sum_s z_s \( 1 + g \( s \) \) a_s \( p \) \,\
cal(L)_r \( mu \, g \) & = r min_(z in cal(Z)_r) integral_Y F_z^g \( p \) thin d mu \( p \) . $ <eq:pilot-integrand>]

The two terms in $F_z^g$ favor a site near concentrated mass. A site at $s$ cancels part of the residual cost inside $B \( s \, sigma r \)$, while its surcharge grows quadratically with distance from $s$ until that distance reaches $sigma r$. The large surcharge makes a site at intermediate distance from a concentration expensive. The factors involving $g$ allow a partition edit to lower the contribution of a site near the request. We will measure that decrease using the old minimizing site vector, with $g$ chosen from the partition structures.

The site vector is an auxiliary object, with no prescribed total weight. Its capacity constraints bound the total weight of nearby sites by one. The gradual cutoff $G$ will let us move a site and repair those constraints by reducing neighboring weights. The separation condition has a different role: it makes the positive supports of the residual bumps $b_s$ disjoint, so that this repair has a cost independent of the number of sites. The template superscript on $cal(L)_r$ is suppressed when it is fixed.

#thm([Lemma 6.1.])[
  (Compactness, concavity, and uniform bounds).  #emph[For every nonnegative measure $mu$ on the finite space $Y$, the minimum in (6.4) exists. For fixed $g$, the function $mu mapsto cal(L)_r \( mu \, g \)$ is concave, and 
#[#set math.equation(numbering: n => "(6.5)")
 $ 0 lt.eq cal(L)_r \( mu \, g \) lt.eq 2 r mu \( Y \) . $ <eq:pilot-size>]

 Every feasible integrand satisfies 
#[#set math.equation(numbering: n => "(6.6)")
 $ 0 lt.eq F_z^g lt.eq 514 \, #h(2em) r "Lip" \( F_z^g \) lt.eq Lambda := L + 1026 \/ sigma . $ <eq:pilot-global-bounds>]

 Moreover, the positive supports of the functions $b_s$ with $z_s > 0$ are pairwise disjoint.]
] <lem:pilot-compact>

#proof[
  Testing capacity at $p = s$ gives $0 lt.eq z_s lt.eq 1$. For each pair with $d \( s \, s' \) < 5 sigma r$, the separation condition is exactly the closed equation $z_s z_(s') = 0$. Thus $cal(Z)_r$ is a closed subset of the finite cube $\[ 0 \, 1 \]^Y$, containing zero. It is compact, and the objective is continuous. Although this set need not be convex, a minimum therefore exists.
  At every point $p$, the weights of all centers in $B \( p \, D_(*) r \)$ sum to at most one, because $G_s \( p \) = 0$ there. Every center contributing to $a_s \( p \)$ or $b_s \( p \)$ lies in that ball. It follows that
  $ 0 lt.eq 1 - sum_s z_s b_s \( p \) lt.eq 1 \, #h(2em) sum_s z_s a_s \( p \) lt.eq 1 . $
  These inequalities give the bound $514 = 2 + 512$ for the integrand, its nonnegativity, and the lower bound in (6.5). Taking $z = 0$ gives the upper bound for the minimum.
  If $d \( p \, q \) lt.eq r$, every center contributing at either endpoint belongs to $B \( p \, \( 2 R + 1 \) r \) subset B \( p \, D_(*) r \)$, so all its weights together sum to at most one. The residual term in (6.4) consequently has Lipschitz bound $\( L + 2 \/ sigma \) \/ r$, and the surcharge term has bound $1024 \/ \( sigma r \)$. If $d \( p \, q \) > r$, the bound $514$ on the range already implies the claimed Lipschitz bound, since $Lambda gt.eq 1026$. Finally, if $b_s \( p \)$ and $b_(s') \( p \)$ are both positive, then $d \( s \, s' \) < 4 sigma r$, contrary to separation for two positive weights.
  For nonnegative measures $mu_0 \, mu_1$ and $0 lt.eq theta lt.eq 1$, every feasible $z$ satisfies
  $ r integral F_z^g thin d \( theta mu_0 + \( 1 - theta \) mu_1 \) gt.eq theta cal(L)_r \( mu_0 \, g \) + \( 1 - theta \) cal(L)_r \( mu_1 \, g \) . $
  Taking the minimum proves concavity. Convexity of $cal(Z)_r$ was not used. ◻
]

=== 6.2 The three local optimality estimates <the-three-local-optimality-estimates>

Fix, for this template, constants satisfying

#[#set math.equation(numbering: n => "(6.7)")
 $ 0 < gamma lt.eq min { sigma \/ 64 \, 1 \/ \( 1 + L \) } \, #h(2em) 0 < delta lt.eq 1 \/ 4112 . $ <eq:pilot-concentration-constants>]

They may be decreased for the applications below. For a point $x$ and a measure $mu$ with $M := mu \( B \( x \, gamma r \) \) > 0$, write

#[#set math.equation(numbering: n => "(6.8)")
 $ h = frac(mu \( B \( x \, D_1 r \) \\ B \( x \, gamma r \) \), M) \, #h(2em) t = 1 / M integral_(B \( x \, gamma r \)) frac(d \( x \, p \), r) thin d mu \( p \) . $ <eq:pilot-shell-moment>]

In particular $0 lt.eq t lt.eq gamma$. The shell ratio $h$ measures mass outside the inner ball, whereas $t$ measures how tightly the inner mass is centered at $x$. Both errors matter: even when $h = 0$, the mass in the inner ball need not lie at $x$. In this subsection $h$ denotes only the shell ratio, not a partition tier.

#thm([Lemma 6.2.])[
  (Local structure and positive slope).  #emph[Assume $h lt.eq delta$, and let $z$ be any minimizer in (6.4). Then the following assertions hold.]
  + #emph[A center $s$ with $sigma r \/ 4 lt.eq d \( s \, x \) lt.eq R r \/ 2$ has $z_s = 0$.]
  + #emph[There is a unique positive center $s$ with $d \( s \, x \) < sigma r \/ 4$. Its weight $z_s$ and normalized displacement $w = d \( s \, x \) \/ r$ satisfy 
#[#set math.equation(numbering: n => "(6.9)")
 $ z_s gt.eq 3 / 4 \, #h(2em) 1 - z_s lt.eq frac(512 gamma, sigma^2) t + 514 h \, #h(2em) w lt.eq \( 5 + L \) \( h + t \) . $ <eq:pilot-local-structure>]

]
  + #emph[If $d \( x \, y \) < sigma r \/ 8$, then 
#[#set math.equation(numbering: n => "(6.10)")
 $ \[ F_z^g \( x \) - F_z^g \( y \) \]_(+) lt.eq C_(upright("loc")) \( h + t \) frac(d \( x \, y \), r) \, $ <eq:pilot-local-slope>]

 where one admissible constant is 
#[#set math.equation(numbering: n => "(6.11)")
 $ C_(upright("loc")) = \( L + 1024 \/ sigma \) \( 514 + 8 \/ sigma \) + frac(1024 \( 5 + L \), sigma^2) . $ <eq:pilot-local-constant>]

]
] <lem:pilot-local>

#proof[
  We perform the calculations in units of $r$; integrals of $F$ therefore omit the common factor $r$ in the potential.
  #emph[Deleting a middle-distance site.] For $sigma \/ 4 lt.eq d \( s \, x \) \/ r lt.eq R \/ 2$ and $p in B \( x \, gamma r \)$, the distance $d \( s \, p \) \/ r$ is at least $sigma \/ 4 - gamma$ and less than $R$. Consequently
  $ a_s \( p \) gt.eq \( 1 \/ 4 - gamma \/ sigma \)^2 gt.eq \( 15 \/ 64 \)^2 . $
  The support of $b_s$ is inside $B \( x \, D_1 r \)$. The coefficient of $z_s$ in the integral objective is therefore at least
  $ 256 integral a_s thin d mu - 2 integral b_s thin d mu gt.eq [225 / 16 - 2 \( 1 + delta \)] M > 0 . $
  Decreasing a weight preserves both constraints in (6.3). A positive such weight would contradict minimality, proving the first assertion.
  #emph[Inserting a unit site.] Clear all weights at centers in $B \( x \, 5 D_(*) r \)$, and put weight one at $x$. Separation holds, since every retained center is farther than $5 D_(*) r$. To check capacity, consider a test point $p$ where the new site’s contribution is positive. Then $d \( p \, x \) < 2 D_(*) r$. Every old center contributing positively at that test satisfies $d \( s' \, p \) < 2 D_(*) r$, because $z_(s') lt.eq 1$ and $G_(s') \( p \) < z_(s')$. Such a center lies in $B \( x \, 4 D_(*) r \)$ and has been cleared. The single new contribution is at most one. At other tests the new site contributes zero and weights have only been removed. Thus the competitor is feasible.
  There is at most one positive old site within $sigma r \/ 4$ of $x$ by separation; denote its weight by $Z$, taking $Z = 0$ if it does not exist. On the entire inner ball its $b$ value is one. Every other positive site has distance greater than $R r \/ 2$ from $x$ by the first assertion, so its $b$ value is zero on the inner ball. The old residual is thus $1 - Z$ there, and the old integrand is at least $1 - Z$. The new integrand there is at most $512 \( d \( x \, p \) \/ r \)^2 \/ sigma^2$, whose integral is at most $512 M gamma t \/ sigma^2$.
  All changed bumps are supported in $B \( x \, \( 5 D_(*) + 2 R \) r \) subset B \( x \, D_1 r \)$. Outside the inner ball the increase is at most $514$ pointwise, by Lemma 17. Minimality of the old vector gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ 1 - Z lt.eq 512 gamma t \/ sigma^2 + 514 h lt.eq 512 gamma^2 \/ sigma^2 + 514 delta lt.eq 1 / 4 . $ <eq:pilot-deficit-proof>]
  Here both last summands are at most $1 \/ 8$ by (6.7). This proves existence, uniqueness, the weight bound, and the deficit bound in (6.9).
  #emph[Relocating that site and repairing capacity.] Write $s$ for this near site and $z = z_s$. The case $w = 0$ already has the desired displacement bound. For $w > 0$, move its weight from $s$ to $x$. Simultaneously replace every other weight $z_i$ with center in $B \( x \, 5 D_(*) r \)$ by $\( z_i - q \)_(+)$, where
  $ q = w \/ D_(*) . $
  If $s eq.not x$, the old weight at $x$ is zero by the just-proved uniqueness. Every other positive center lies beyond $R r \/ 2$ from $x$, so the moved site preserves separation.
  For a capacity test $p$, put
  $ A = \( z - G_s \( p \) \)_(+) \, quad A' = \( z - G_x \( p \) \)_(+) \, quad B = sum_(i eq.not s) \( z_i - G_i \( p \) \)_(+) . $
  When $A' lt.eq A$, capacity can only improve. Otherwise $A' > 0$, and $A' - A lt.eq q$ by the Lipschitz constant of $G$. The same distance calculation as above puts every center contributing to $B$ within $4 D_(*) r$ of $x$, hence among the reduced centers. If $b_i = \( z_i - G_i \( p \) \)_(+)$, its contribution decreases by exactly $min { q \, b_i }$. For any nonnegative finite family $\( b_i \)$,
  #[#set math.equation(numbering: n => "(6.13)")
   $ sum_i min { q \, b_i } gt.eq min { q \, sum_i b_i } . $ <eq:pilot-capacity-repair>]
  Indeed, a summand with $b_i gt.eq q$ proves the inequality immediately; if none exists, the left side is $sum_i b_i$. If $B gt.eq q$, the reductions pay the increase $A' - A$. If $B < q$, all the other contributions vanish and the remaining contribution satisfies $A' lt.eq z lt.eq 1$. This verifies every capacity test, with no dependence on the number of sites.
  For $p$ in the inner ball put $u = d \( s \, p \) \/ r$ and $v = d \( x \, p \) \/ r$. Both are less than $sigma$, so the moved site’s old and new $a$ values are $u^2 \/ sigma^2$ and $v^2 \/ sigma^2$. The triangle inequality gives $u^2 gt.eq w^2 - 2 w v + v^2$: if $v lt.eq w$, square $u gt.eq w - v$; if $v > w$, the right side $\( w - v \)^2$ follows from $u gt.eq v - w$. Consequently, using $L gamma lt.eq 1$,
  $ \( 1 + g \( s \) \) u^2 - \( 1 + g \( x \) \) v^2 & gt.eq \( 1 + g \( s \) \) \( w^2 - 2 w v \) - L w v^2\
 & gt.eq w^2 - \( 4 + L gamma \) w v gt.eq w^2 - 5 w v . $
  The near site’s $b$ value stays one there; all other $b$ values stay zero; and reducing other weights can only lower their surcharges. The integral gain on the inner ball is therefore at least
  #[#set math.equation(numbering: n => "(6.14)")
   $ frac(256 z M, sigma^2) \( w^2 - 5 w t \) . $ <eq:pilot-relocation-gain>]
  For completeness, the pointwise loss outside the inner ball has a bound proportional to $w$, rather than a constant per changed site. Moving the near site’s center changes its residual contribution by at most $2 z w \/ sigma$, and its surcharge by at most $256 z \( 4 \/ sigma + L \) w$. Thus its total increase is at most $z K_0 w$, where
  $ K_0 = 1026 \/ sigma + 256 L . $
  The reduction of other weights can only increase the residual. Since their positive $b$ supports are disjoint, the residual increase is at most $2 q$ at every point. All changes vanish outside $B \( x \, \( 5 D_(*) + 2 R \) r \)$. The shell loss is therefore at most $M h \( z K_0 + 2 \/ D_(*) \) w$. Combining this with (6.14) and minimality, and dividing by the positive quantity $256 z M w \/ sigma^2$, gives
  $ w lt.eq 5 t + sigma^2 / 256 (K_0 + frac(2, z D_(*))) h lt.eq 5 t + \( 5 + L \) h lt.eq \( 5 + L \) \( h + t \) . $
  For the middle inequality, use $z gt.eq 1 \/ 2$, $sigma lt.eq 1$, $D_(*) gt.eq 2560$, and $1026 \/ 256 + 4 \/ \( 256 D_(*) \) < 5$. This proves the last local structural estimate.
  #emph[Positive slope at the request.] Put $v = d \( x \, y \) \/ r < sigma \/ 8$. The near site’s $b$ is one at both points, and all other positive sites have $b = 0$ at both points. The residual part of $F_z^g \( x \) - F_z^g \( y \)$ is consequently at most $L \( 1 - z \) v$. Writing $u = d \( s \, y \) \/ r$, the near-site surcharge difference has positive part at most
  $ frac(512 z, sigma^2) \( w^2 - u^2 \)_(+) lt.eq frac(1024 w, sigma^2) v \, $
  because $\( w^2 - u^2 \)_(+) lt.eq 2 w \| w - u \|$. Every other center contributing an $a$ value at either endpoint is within $\( 2 R + sigma \/ 8 \) r < D_(*) r$ of $x$. Capacity at $x$, including the near site, bounds the total of these other weights by $1 - z$. Their surcharge difference has absolute value at most $1024 \( 1 - z \) v \/ sigma$. Altogether,
  $ \[ F_z^g \( x \) - F_z^g \( y \) \]_(+) lt.eq [\( L + 1024 \/ sigma \) \( 1 - z \) + 1024 w \/ sigma^2] v . $
  Finally (6.12) and $gamma lt.eq sigma \/ 64$ give $1 - z lt.eq \( 514 + 8 \/ sigma \) \( h + t \)$, and the displacement bound proves (6.10) with the stated constant. ◻
]

=== 6.3 Summing the drift over scales <summing-the-drift-over-scales>

#thm([Lemma 6.3.])[
  (Pilot drift bound).  #emph[Fix a template and constants as in (6.7). At each radius let $g_j$ be any function with $0 lt.eq g_j lt.eq 1$ and $r_j "Lip" \( g_j \) lt.eq L$. For measures satisfying (6.1), 
#[#set math.equation(numbering: n => "(6.15)")
 $ sum_(j = 1)^J \[ cal(L)_(r_j) \( mu^(+) \, g_j \) - cal(L)_(r_j) \( mu^(-) \, g_j \) \]_(+) lt.eq C_(upright("dr")) ell e_x . $ <eq:pilot-drift>]

 The constant is independent of $Y$, $k$, $J$, and $tau gt.eq 2$. For example, set 
#[#set math.equation(numbering: n => "(6.16)")
 $ p_0 & = ⌈log_2 \( D_1 \/ gamma \)⌉ \,\
C_(upright("dr")) & = 2056 / gamma + 8224 / sigma + frac(2 Lambda p_0, delta log 2) + 2 C_(upright("loc")) (frac(p_0, log 2) + 2 gamma) . $ <eq:pilot-drift-constant>]

]
] <lem:pilot-drift>

#proof[
  Let $z^(\( j \))$ minimize the old objective at radius $r_j$ and write $F_j = F_(z^(\( j \)))^(g_j)$. Evaluating the new minimum at this vector yields
  #[#set math.equation(numbering: n => "(6.17)")
   $ & cal(L)_(r_j) \( mu^(+) \, g_j \) - cal(L)_(r_j) \( mu^(-) \, g_j \)\
 & #h(15mm)  lt.eq r_j integral_Y \( F_j \( x \) - F_j \( y \) \) thin d nu \( y \) lt.eq r_j integral_Y \[ F_j \( x \) - F_j \( y \) \]_(+) thin d nu \( y \) . $ <eq:pilot-candidate-drift>]
  If $e_x = 0$, the probability measure $nu$ is supported at $x$ and the two counting measures agree. Assume henceforth $e_x > 0$.
  The radii smaller than $2 e_x \/ gamma$ contribute at most
  #[#set math.equation(numbering: n => "(6.18)")
   $ 514 sum_(r_j < 2 e_x \/ gamma) r_j lt.eq 2056 / gamma e_x \, $ <eq:pilot-small-scales>]
  by $tau gt.eq 2$ and (6.6). At every remaining radius, domination by $mu^(-)$ and the definition of $e_x$ give
  #[#set math.equation(numbering: n => "(6.19)")
   $ M_j := mu^(-) \( B \( x \, gamma r_j \) \) gt.eq nu \( B \( x \, gamma r_j \) \) gt.eq 1 - frac(e_x, gamma r_j) gt.eq 1 / 2 . $ <eq:pilot-inner-mass>]
  This is a consecutive range of coarse radii. Define $h_j \, t_j$ there as in (6.8) with $mu = mu^(-)$.
  We record both scale sums explicitly. Set $A_j = mu^(-) \( B \( x \, D_1 r_j \) \) = \( 1 + h_j \) M_j$. For $u gt.eq 0$,
  #[#set math.equation(numbering: n => "(6.20)")
   $ min { 1 \, u } lt.eq frac(log \( 1 + u \), log 2) . $ <eq:pilot-capped-log>]
  For $0 lt.eq u lt.eq 1$ this follows from the chord between the endpoint values of the concave function $log \( 1 + u \)$, and for $u gt.eq 1$ it follows from monotonicity. Since $tau^(p_0) gamma gt.eq D_1$, the mass $A_j$ is at most $M_(j - p_0)$ whenever that coarser index is in the range. Assigning the value $k$ to missing coarser masses gives
  $ sum_j log \( A_j \/ M_j \) lt.eq sum_j \( log M_(j - p_0) - log M_j \) lt.eq p_0 log \( 2 k \) . $
  All interior logarithms cancel; at most $p_0$ boundary differences remain, each between masses in $\[ 1 \/ 2 \, k \]$. This is also the instance of Lemma 4 needed here. Thus
  #[#set math.equation(numbering: n => "(6.21)")
   $ sum_j min { 1 \, h_j } lt.eq frac(p_0, log 2) log \( 2 k \) . $ <eq:pilot-shell-sum>]
  For the moment sum only, order the same radii increasingly as $rho_1 < dots.h.c < rho_n$, with $rho_(i + 1) = tau rho_i$, and set $m_i = mu^(-) \( B \( x \, gamma rho_i \) \)$, $m_0 = 0$, and $Delta_i = m_i - m_(i - 1)$. Partitioning the $j$th inner ball into the successive differences of these balls gives
  $ t_j lt.eq gamma sum_(i lt.eq j) tau^(i - j) Delta_i / m_j . $
  The first difference includes the entire first ball; hence this bound also accounts for any atom already inside that ball. Since $m_j gt.eq m_i$ for $j gt.eq i$, interchanging two finite sums gives
  #[#set math.equation(numbering: n => "(6.22)")
   $ sum_(j = 1)^n t_j & lt.eq gamma sum_(i = 1)^n Delta_i / m_i sum_(j = i)^n tau^(i - j) lt.eq 2 gamma sum_(i = 1)^n Delta_i / m_i\
 & lt.eq 2 gamma (1 + log m_n / m_1) lt.eq 2 gamma \( 1 + log \( 2 k \) \) . $ <eq:pilot-moment-sum>]
  Indeed the first ratio $Delta_1 \/ m_1$ is one, and, for $i gt.eq 2$, $Delta_i \/ m_i lt.eq integral_(m_(i - 1))^(m_i) d u \/ u$. Empty scale ranges require no estimate.
  Call a remaining radius bad if $h_j > delta$. Because $delta < 1$, (6.21) bounds the number of bad radii by $p_0 log \( 2 k \) \/ \( delta log 2 \)$. The global Lipschitz bound gives at most $Lambda e_x$ in (6.17) at each one. At a good radius apply Lemma 18 to points with $d \( x \, y \) < sigma r_j \/ 8$. Their total contribution, summed over good radii and integrated against $nu$, is at most
  $ C_(upright("loc")) e_x [frac(p_0, log 2) log \( 2 k \) + 2 gamma \( 1 + log \( 2 k \) \)] . $
  Here $h_j = min { 1 \, h_j }$ on good radii. For each fixed exceptional point $y$, with $d \( x \, y \) gt.eq sigma r_j \/ 8$, use boundedness instead:
  #[#set math.equation(numbering: n => "(6.23)")
   $ sum_(r_j lt.eq 8 d \( x \, y \) \/ sigma) 514 r_j lt.eq 8224 / sigma d \( x \, y \) . $ <eq:pilot-far-scales>]
  Integrating proves that all exceptional terms together cost at most $8224 e_x \/ sigma$. This bound has no factor counting scales. Combining the estimates, using $1 + log \( 2 k \) lt.eq 2 ell$ and $ell gt.eq 1$, gives precisely (6.15) with (6.16). ◻
]

=== 6.4 Filtering before selecting edits <filtering-before-selecting-edits>

The following formulation will allow both heavy-center edits and the summably weighted tier edits to use the same drift budget. It also fixes the order of conditioning: the filtering estimate is applied at every step with the old coefficients, before selecting any edits.

#thm([Corollary 6.4.])[
  (Budget for summably weighted templates).  #emph[Let templates be indexed by a finite or countable set $I$, with fixed weights $omega_alpha gt.eq 0$. Each template has fixed admissible parameters and the drift constant $C_(upright("dr") \, alpha)$ of Lemma 19. Assume 
$ A := sum_(alpha in I) omega_alpha < oo \, #h(2em) B := sum_(alpha in I) omega_alpha C_(upright("dr") \, alpha) < oo . $

 At each step, filter and drift the counting measure while keeping the previous functions $g_(alpha \, j)$ fixed. Then edit these functions using the new history, retaining their template bounds. Suppose the weighted total potential drop in the edit stage is at least a nonnegative charge $c_t$, taking $c_t = 0$ on steps without edits. Then 
#[#set math.equation(numbering: n => "(6.24)")
 $ bb(E) sum_t c_t lt.eq B ell Q + 2 k A sum_(j = 1)^J r_j lt.eq B ell Q + frac(2 k r_0 A, tau - 1) . $ <eq:pilot-edit-budget>]

 In particular, if $A \, B$ are absolute constants, the multiplicative budget is $O \( ell Q \)$ and the additive bound is independent of the input law and horizon.]
] <cor:pilot-edits>

#proof[
  Let $mu_(t - 1)$ be the previous post-step posterior counting measure. The posterior identity is
  $ bb(E) \[ mu_t^(-) divides cal(F)_(t - 1) \] = mu_(t - 1) . $
  For every old, $cal(F)_(t - 1)$-measurable function $g = g_(t - 1 \, alpha \, j)$, concavity gives
  #[#set math.equation(numbering: n => "(6.25)")
   $ bb(E) \[ cal(L)_(r_j) \( mu_t^(-) \, g \) divides cal(F)_(t - 1) \] lt.eq cal(L)_(r_j) \( mu_(t - 1) \, g \) . $ <eq:pilot-filtering>]
  One can see this directly without any assumption on convexity of site vectors: choose a minimizing vector at $mu_(t - 1)$, use it as a competitor for each refined posterior, and take its conditional expectation. Its objective is linear in the measure and therefore returns exactly the old objective.
  Write $Phi_(t - 1)$ for the weighted total potential after the preceding step, $Phi_t^(-)$ for its value after filtering at old $g$’s, and $hat(Phi)_t$ for its value after drift, still at old $g$’s. Write $Phi_t$ for its value after the edits. The three established bounds are
  $ bb(E) Phi_t^(-) lt.eq bb(E) Phi_(t - 1) \, #h(2em) hat(Phi)_t - Phi_t^(-) lt.eq B ell e_x \, #h(2em) Phi_t lt.eq hat(Phi)_t - c_t . $
  All these potentials are nonnegative and at most $2 k A sum_j r_j$. The same statements hold for a countable family: finite partial sums give the filtering inequality by convergence of nonnegative bounded sums, and the absolute bound by $2 k r_j omega_alpha$ for each potential makes the signed differences summable. The drift bound sums because its weighted constants sum to $B$.
  Taking expectations, summing in $t$, and using $bb(E) sum_t e_x = Q$ proves $bb(E) sum_t c_t lt.eq B ell Q + bb(E) Phi_0 - bb(E) Phi_T$. Dropping the nonnegative terminal value and applying (6.5) yields (6.24). In particular, (6.25) was summed over #emph[all] steps. It was never conditioned on the event that a later edit was selected. ◻
]

For use in verifying the edit hypothesis, if $z$ is an old minimizer at the already updated measure $mu^(+)$, then

#[#set math.equation(numbering: n => "(6.26)")
 $ cal(L)_r \( mu^(+) \, g^(upright("old")) \) - cal(L)_r \( mu^(+) \, g^(upright("new")) \) gt.eq r integral_Y \( F_z^(g^(upright("old"))) - F_z^(g^(upright("new"))) \) thin d mu^(+) . $ <eq:pilot-edit-candidate>]

Thus the next section only needs a lower bound on the gain of the old candidate. In the tier application the template is fixed across tiers and $omega_h = e^(- h)$ for $h = 1 \, 2 \, 4 \, dots.h$. Since these tiers form a subset of the positive integers, $sum_h e^(- h) lt.eq sum_(n gt.eq 1) e^(- n) = 1 \/ \( e - 1 \)$, so both constants in Corollary 20 are bounded independently of the number of tiers.

== 7 Online partitions and the embedded comparator <sec:partitions>

Probabilistic tree embeddings use scale partitions to represent a metric #cite(label("Bartal96")) #cite(label("Bartal98")) #cite(label("FRT04")). Local ball-mass ratios and their logarithmic scale sums are familiar from measured descent #cite(label("KLMN05")) Lemma 1.7 and Section 1.3. Protection by heavy balls and maintenance of separated nets also appear in Lee’s evolving fusible-HST construction #cite(label("Lee18")) Sections 3.1.2–3.2; its withdrawn competitive-ratio claim is discussed in Section 1. Here the changing measure is the posterior of the hidden comparator. The pilot potentials will pay the edits induced by maintaining these partitions.

The partitions at distinct scales need not refine one another. A point’s entire string of scale labels will specify its leaf in a fixed tree. We protect requests where the comparator measure is locally concentrated by large disjoint balls. At the other scales, chronological rosters of smaller balls provide a separation estimate whose coefficient depends on the local mass ratio. The pilot potentials pay changes to both structures.

We use the finite metric, selected labeled comparator, scales, and filtration of Section 2. In particular,

$ r_j = r_0 tau^(- j) \, #h(2em) r_0 = "diam" Y \, #h(2em) 40 r_J < min_(u eq.not v) d \( u \, v \) \, #h(2em) 1 lt.eq j lt.eq J . $

All the numerical constants chosen below are absolute. The constant $tau$ also satisfies the absorption requirements of the allocation and rounding arguments. At a request $x$, the true-metric posterior measures obey

#[#set math.equation(numbering: n => "(7.1)")
 $ mu^(+) = mu^(-) - nu + delta_x \, #h(2em) nu \( Y \) = 1 \, #h(2em) nu lt.eq mu^(-) \, #h(2em) e_x = integral d \( x \, y \) thin d nu \( y \) . $ <eq:partition-mover>]

The selected mover is specified even on a zero move. In particular every ball centered at $x$ has $mu^(+)$-mass at least one, and $bb(E) sum_t e_(x_t) = Q$.

#thm([Proposition 7.1.])[
  (Embedded comparator cost).  #emph[There are finite alphabets $cal(A)_1 \, dots.h \, cal(A)_J$, depending only on $Y \, k$ and the fixed constants, and online random maps 
$ xi_t : Y arrow.r cal(A)_1 times dots.h.c times cal(A)_J $

 with the following properties. Each coordinate cell at level $j$ has diameter at most $40 r_j$ and an anchor within $20 r_j$ of all its points. Thus $xi_t$ is injective. Give the full alphabet tree the leaf distance $r_(j - 1)$ when the first differing coordinate is $j$. For the selected hidden members $X_t^1 \, dots.h \, X_t^k$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ P := bb(E) sum_t sum_(a = 1)^k d_(cal(T)) #scale(x: 120%, y: 120%)[\(] xi_(t - 1) \( X_(t - 1)^a \) \, xi_t \( X_t^a \) #scale(x: 120%, y: 120%)[\)] lt.eq C ell Q + D_(upright("part")) . $ <eq:embedded-cost>]

 Here $C$ is absolute and $D_(upright("part")) < oo$ is independent of the input law and its horizon. A coordinate label common to successive maps has a fixed anchor, except for the explicit heavy-ball reuse below, when its anchor moves by at most $40 r_j$.]
] <prop:embedded-cost>

The maps for a given finite input law may use its true-prefix posteriors. The alphabets and all initialization bounds will be fixed before that law or its horizon is chosen. Two forms of conditioning will be kept separate: pilot potentials use filtering in $cal(F)_t$, whereas ball and retirement probabilities average over the independent partition tape after fixing the whole true input.

=== 7.1 Heavy balls and their edit cost <heavy-balls-and-their-edit-cost>

Use the pilot template of Section 6 with $sigma = 1$, $R = 512$, and Lipschitz bound one for $g$ in scale units. Let $D_H = D_1 = 100 R$. Choose $gamma_H \, delta_H > 0$ small enough for Lemma 18, and also with $gamma_H < 1 \/ 100$, $delta_H < 1 \/ 100$. They may be decreased further to meet the absolute requirement in Section 8. At scale $r$, call the current request #emph[heavy] when

#[#set math.equation(numbering: n => "(7.3)")
 $ mu^(+) \( B \( x \, D_H r \) \) lt.eq \( 1 + delta_H \) mu^(+) \( B \( x \, gamma_H r \) \) . $ <eq:heavy-condition>]

Maintain an initially empty center set $cal(H)$. If the request is heavy and $d \( x \, cal(H) \) > 8 r$, remove all centers within $100 r$ of $x$, and insert $x$. Otherwise leave $cal(H)$ unchanged. Distance to the empty set is infinite. Every inserted center receives a fresh independent uniform radius in $\[ 16 r \, 20 r \]$, held until its removal. These radii affect the balls and their labels, but never the center schedule.

Centers in $cal(H)$ have pairwise distance greater than $100 r$, by induction on insertions. Their balls are therefore disjoint. If a new ball intersects an old ball as subsets of $Y$, reuse that old ball’s label. Otherwise use a fresh label. There is at most one intersected old ball: two such old centers would be at distance at most $80 r$. Moreover, an intersected center is within $40 r$ of $x$, so was removed in this update. The reused label’s anchor consequently moves by at most $40 r$. Intersection is meant in the finite metric itself; no geodesic or ambient ball intersection is needed. Heavy balls have precedence over every other structure at the level. In particular their final key regions are their entire balls.

Write

$ E_x \( r \) = { p in Y : 3 r < d \( p \, x \) lt.eq 120 r } . $

First we pay the mass in this annulus at heavy updates. Let $rho_H$ be zero on $\[ 0 \, 3 \]$, affine from zero to one on $\[ 3 \, 4 \]$, and one thereafter, and set

$ g_(cal(H)) \( p \) = rho_H #scale(x: 120%, y: 120%)[\(] d \( p \, cal(H) \) \/ r #scale(x: 120%, y: 120%)[\)] . $

At a heavy update, apply Lemma 18 to $mu^(+)$ and the old $g$. The inner mass is at least one and the shell ratio is at most $delta_H$. Every minimizing pilot configuration has a site $s$ with $d \( s \, x \) < r \/ 4$ and $z_s gt.eq 1 \/ 2$, and no positive sites at distances in $\[ r \/ 4 \, 256 r \]$ from $x$. The near site’s old $g \( s \)$ is one, because every old center is more than $8 r$ from $x$, and its new value is zero. For every $p in E_x \( r \)$,

$ 2.75 < d \( s \, p \) \/ r lt.eq 120.25 \, $

so its surcharge bump $a_s \( p \)$ equals one. The decrease of this surcharge is at least $128 r mu^(+) \( E_x \( r \) \)$.

An increase of $g \( p \)$ requires removal of a center within $4 r$ of $p$, and cannot occur inside $B \( x \, 3 r \)$, where the new $g$ is zero. Thus every increase is supported at distances in $\( 3 r \, 104 r \]$ from $x$. All possible increasing-coefficient sites have zero weight by the forbidden-site conclusion above. Only the residual term can increase, by at most $r mu^(+) \( E_x \( r \) \)$, since its coefficient lies in $\[ 0 \, 1 \]$. Using the old minimizer as a feasible candidate after the edit proves

$ cal(L)_r \( mu^(+) \, g_(upright("old")) \) - cal(L)_r \( mu^(+) \, g_(upright("new")) \) gt.eq 127 r mu^(+) \( E_x \( r \) \) . $

The all-step filtering and drift telescope of Corollary 20 now gives

#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E) sum_(t \, j : thin cal(H)_j upright(" updates at ") t) r_j mu_t^(+) \( E_(x_t) \( r_j \) \) lt.eq C ell Q + D'_H . $ <eq:heavy-annulus-budget>]

Here and below the constants denoted by $D$ are finite initialization bounds depending only on the fixed finite data. Filtering and drift are summed at the old parameters on every step, before testing whether an update occurs; there is no conditioning of the filtering inequality on the event of an update.

We will use two elementary scale sums repeatedly. Set

$ L_j \( x \) = log frac(mu^(+) \( B \( x \, D_L r_j \) \), mu^(+) \( B \( x \, gamma_L r_j \) \)) \, $

where the absolute constants $D_L > gamma_L > 0$ will be fixed below. Lemma 4, with inner masses at least one and outer masses at most $k$, gives

#[#set math.equation(numbering: n => "(7.5)")
 $ sum_(j = 1)^J L_j \( x \) lt.eq p_L log k \, #h(2em) \# { j : upright("the request is nonheavy at ") j } lt.eq frac(p_H log k, log \( 1 + delta_H \)) lt.eq C ell \, $ <eq:partition-log-sums>]

where $p_L \, p_H$ are fixed positive integers satisfying $tau^(p_L) gamma_L gt.eq D_L$ and $tau^(p_H) gamma_H gt.eq D_H$. For the second bound every nonheavy level contributes more than $log \( 1 + delta_H \)$ to its heavy-template logarithmic ratio. These sums involve one common measure $mu^(+)$ on the step, so the scale telescope applies.

#thm([Lemma 7.2.])[
  (Heavy edits).  #emph[The expected sum of $r_j$ times overall level-key changes caused by heavy edits, evaluated at the hidden members’ old physical positions with the base structures held fixed, is at most $C ell Q + D''_H$.]
] <lem:heavy-edits>

#proof[
  Let $psi$ be the clipped increasing ramp on $\[ 9 \, 10 \]$. For each member at $p$, add the auxiliary potential $r psi \( d \( p \, cal(H) \) \/ r \)$. Sum it over members and levels, and telescope along actual hidden trajectories from one step end to the next. Its initial value is at most $k sum_j r_j$ and it is nonnegative. We bound an edit charge plus the full-step change of this potential.
  Consider first a stationary member $p$ at an update. If $d \( p \, x \) lt.eq 3 r$ and an old center lies within $10 r$ of $p$, both the old and new heavy balls contain $p$. Their intersection forces reuse, so its key does not change and its potential does not increase. If no such old center exists, its old potential is $r$ and its new potential is zero, paying a possible charge of $r$. Outside this inner ball, all affected old or new balls and all changing ramps lie in $B \( x \, 120 r \)$: a removed center is within $100 r$, its ball has radius at most $20 r$, and its ramp has range at most $10 r$. The charge plus potential increase is at most $2 r$, supported in $E_x \( r \)$.
  For the designated mover $y arrow.r x$, its final potential at an update is zero. The same argument pays its charge when $d \( y \, x \) lt.eq 3 r$. Otherwise the unpaid amount is at most $r$, and $sum_(r_j < d \( x \, y \) \/ 3) r_j lt.eq C d \( x \, y \)$. At a step without an update there is no edit charge. On a heavy level a final center is within $8 r$ of $x$, so the final potential is again zero. Only nonheavy levels can have a positive physical-motion change; at each it is at most $d \( x \, y \)$, by the ramp’s Lipschitz bound. Their number is bounded in (7.5).
  The conditional expected stationary counting measure equals $mu^(+) - delta_x$, and in particular is bounded by $mu^(+)$. Consequently (7.4) pays the stationary errors, and the other terms sum to $C ell Q$. Nonnegativity and the stated initial bound complete the telescope. ◻
]

=== 7.2 Chronological rosters and a fixed alphabet <chronological-rosters-and-a-fixed-alphabet>

For the second pilot template choose $sigma > 0$ so small that $3 sigma < 1 \/ 8$ and $10 sigma < gamma_H$, and put $R = 4 D_H$ and $D_L = 100 R$. Choose $0 < gamma_L < sigma$ sufficiently small for this template in Lemma 18. The Lipschitz bound used for its $g$’s will be eight in scale units. In particular $gamma_L < gamma_H$ and $D_L > D_H$.

Let

$ cal(H)_k = { 1 \, 2 \, 4 \, dots.h \, 2^b } \, #h(2em) b = min { n in bb(N) union { 0 } : 2^n gt.eq log k } . $

The symbol $cal(H)_k$ denotes the set of tier parameters and is distinct from the center set $cal(H)$. Smaller tiers have precedence. A request qualifies in tier $h in cal(H)_k$ at scale $r$ if

#[#set math.equation(numbering: n => "(7.6)")
 $ mu^(+) \( B \( x \, D_L r \) \) lt.eq e^h mu^(+) \( B \( x \, gamma_L r \) \) . $ <eq:tier-qualification>]

The last tier always qualifies. Fix an absolute $C_K$, to be chosen large below, and set $K = K_h = ceil.l e^(C_K h) ceil.r$.

Each tier keeps chronological insertion records and a random subroster of balls used by the partition. The insertion test below uses only qualification and chronological ages. Every entry young enough to affect that test is deterministically present; later retirement changes the partition but does not feed back into the insertion schedule. This lets us estimate separation and retirement probabilities with that schedule fixed. The age cutoffs also bound the records relevant to the test and partition.

Each pair $\( j \, h \)$ has an initially empty chronological roster of insertions. The age of an entry centered at $c$ is the number of subsequent insertions in that same roster within distance $20 r$ of $c$. Insert $x$ if and only if it qualifies and there is no chronological entry of current age less than $K$ within $r \/ 2$ of $x$. A noninsertion changes no ages. These tests inspect the chronological records, not their realized survival. Records of age at least $K^2$ can be discarded forever: they cannot affect an insertion test or any future presence.

The #emph[actual] roster used in the partition has the following lifetimes. An entry is present deterministically at ages $0 \, dots.h \, K - 1$. At each increment to an age in ${ K \, dots.h \, K^2 - 1 }$, a still present entry retires with fresh probability $1 \/ K$, independently. It retires compulsorily on reaching age $K^2$. At insertion its persistent radius $V in \[ r \, 2 r \]$ has density

#[#set math.equation(numbering: n => "(7.7)")
 $ f \( v \) = lambda / r frac(e^(- lambda \( v \/ r - 1 \)), 1 - e^(- lambda)) upright(bold(1))_(\[ r \, 2 r \]) \( v \) \, #h(2em) lambda = log \( 1 + K^2 \) . $ <eq:tier-radius-density>]

All entry radii and all lifetime trials are mutually independent. Fresh tape blocks are indexed by level, structure, and insertion ordinal, not by the recyclable label slots. The tier key at a point is the label of its earliest present covering entry, if any. The overall level key is the heavy key if present, otherwise the first applicable tier key, otherwise a fixed singleton key for that point. On a step, do the heavy edit first, followed by the roster edits in increasing tier order; a roster’s retirements and insertion form one edit. Each edit is evaluated at the old physical member positions.

Fixing the entire true input makes all comparator posteriors, heavy-center schedules, roster insertion schedules, and chronological ages deterministic. The schedules use neither radii nor lifetimes, nor allocation or rounding states. In particular conditioning on actual presences still leaves the entry radii independent with law (7.7).

#thm([Lemma 7.3.])[
  (Local age count).  #emph[In a subset of $Y$ of diameter at most $20 r$, there are at most $A$ chronological entries of age less than the positive integer $A$. In particular the bounds are $K$ and $K^2$ at the two age cutoffs, regardless of how many entries have already retired.]
] <lem:roster-count>

#proof[
  If there were $n > A$ such entries, the earliest of them would have at least $n - 1 gt.eq A$ later insertions within $20 r$ of its center, contradicting its age. Repeated centers cause no exception. ◻
]

When a request qualifies, its final tier covers $x$ deterministically. Indeed an insertion supplies an age-zero center at $x$; if there is no insertion, the test supplies an entry of age less than $K$ within $r \/ 2$, and no ages change. That entry is present and its radius is at least $r$. We shall refer to this as the tier’s guaranteed coverage.

#thm([Lemma 7.4.])[
  (Fixed labels and anchors).  #emph[The construction can use fixed finite label pools at each level, independent of the input law and horizon. Labels can be assigned so that distinct current records have distinct labels, including shadowed records, and a freshly chosen label was absent throughout the preceding step and all earlier intermediate states of the current step. The sole exception is the prescribed heavy-ball reuse. Every point with a given current label is within $20 r$ of its anchor; its cell has diameter at most $40 r$. A label common to consecutive maps has the same anchor or is a reused heavy label with anchor displacement at most $40 r$.]
] <lem:fixed-alphabet>

#proof[
  Write $n = \| Y \|$. Applying Lemma 23 to each singleton shows that a tier has at most $M = n K^2$ chronological records of age less than $K^2$. Reserve a record’s label until that age cutoff, even if its actual lifetime has ended or its ball is completely shadowed by earlier structures. This convention bounds all reserved labels by $M$; it does not alter the partition. During a step at most one new record is inserted. The records present at any intermediate time during two consecutive steps belong to their two starting record sets and at most two new records, so their total number is at most $2 M + 2$. A pool of $4 M + 4$ slots suffices to choose a fresh slot outside this entire set whenever needed. A slot released on the previous step is still excluded on the current step. This is a finite implementation of the stated cooldown rule, not a growing list of all historical labels.
  The heavy structure has at most $n$ centers and one insertion per step, so a separate pool of $4 n + 4$ slots works by the same rule, with reuse allowed precisely for the unique intersected ball. Use disjoint pools for different tiers and the heavy structure, and $n$ additional fixed singleton labels. Pool sizes are chosen for every level in advance and do not depend on the realized center schedule. A chronological record that persists keeps its label and center even while shadowed. Thus any common slot can only change its anchor by the explicit heavy reuse.
  Heavy and tier keys are anchored at their centers, and singleton keys at their points. Every key cell is a subset of its defining ball, whose radius is at most $20 r$; restricting by precedence only shrinks it. The diameter and anchor bounds follow. Heavy precedence further implies that a heavy key’s region is its entire ball. Empty key regions cause no difficulty; their reserved anchors and slots are still defined. ◻
]

=== 7.3 Separation in the final map <separation-in-the-final-map>

#thm([Lemma 7.5.])[
  (First hit).  #emph[Fix a true input, a roster at a fixed step, and points $x \, y$ with $d = d \( x \, y \) < r \/ 4$. The probability that the earliest present ball covering either point covers exactly one is at most $C h d \/ r$. The expectation is over the partition tape.]
] <lem:first-hit>

#proof[
  Condition on all presences, leaving the radii independent. For a center $c$, put $a = min { d \( c \, x \) \, d \( c \, y \) }$ and $p_a = Pr \( V gt.eq a \)$. The two distances differ by at most $d$, so separation requires $V in \[ a \, a + d \]$, up to endpoints of probability zero. If $r lt.eq a lt.eq 2 r$, direct integration of (7.7) gives
  $ f \( a \) = lambda / r (p_a + frac(1, e^lambda - 1)) . $
  The density is decreasing, hence
  #[#set math.equation(numbering: n => "(7.8)")
   $ Pr #scale(x: 120%, y: 120%)[\(] V in \[ a \, a + d \] #scale(x: 120%, y: 120%)[\)] lt.eq frac(lambda d, r) (p_a + frac(1, e^lambda - 1)) . $ <eq:radius-separation-tail>]
  For $a < r$, use the maximum density at $r$ and $p_a = 1$; for $a > 2 r$, the left side is zero. Thus the same bound holds when an interval crosses a support endpoint.
  List the present balls in chronological order and let $q_i$ be the probability all balls preceding ball $i$ miss both points. The event that ball $i$ hits at least one has probability $p_(a_i)$, so independence gives
  $ sum_i q_i p_(a_i) = Pr \( upright("some present ball hits ") x upright(" or ") y \) lt.eq 1 . $
  Every potentially hitting center lies within $2 r$ of one of the points. Those centers have diameter at most $4 r + d < 5 r$, and all present entries have age less than $K^2$. There are therefore at most $K^2$ candidates by Lemma 23. Multiplying (7.8) by $q_i$ and summing gives
  $ Pr \( upright("separating first hit") \) lt.eq frac(lambda d, r) (1 + frac(K^2, e^lambda - 1)) = frac(2 lambda d, r) . $
  Finally $lambda = log \( 1 + K^2 \) lt.eq C h$, since $C_K$ is an absolute constant and $h gt.eq 1$. The bound is uniform in the conditioned presences, so it also holds without that conditioning. ◻
]

Let $xi_(t \, j)$ denote the final overall key at level $j$. For every fixed input and every $y in Y$,

#[#set math.equation(numbering: n => "(7.9)")
 $ bb(E)_(upright("tape")) sum_(j = 1)^J r_j upright(bold(1))_({ xi_(t \, j) \( x \) eq.not xi_(t \, j) \( y \) }) lt.eq C ell d \( x \, y \) . $ <eq:final-map-separation>]

To prove this, put $d = d \( x \, y \)$; the case $d = 0$ is immediate. The radii $r_j lt.eq 4 d$ contribute at most $C d$ by geometric summation. At a larger heavy level a final center lies within $8 r$ of $x$, so its ball of radius at least $16 r$ contains both points. There is agreement regardless of its sampled radius.

At a larger nonheavy level, the centers of heavy balls that could contain one of the two points lie within $20 r$ of their union, a set of diameter at most $40 r + d < 41 r$. There is at most one such center. Its uniform radius separates the two points with probability at most $d \/ \( 4 r \)$. Next let $h_(*) \( j \)$ be the first qualifying tier at this level. It supplies guaranteed coverage of $x$. If no heavy ball separates the points and no tier through $h_(*) \( j \)$ has a separating first hit, their overall keys agree: the first structure hitting either hits both, and such a structure exists by guaranteed coverage. Lemma 25 and a union bound therefore give probability at most

$ frac(C d, r) (1 + sum_(h lt.eq h_(*) \( j \)) h) lt.eq frac(C d, r) \( 1 + L_j \( x \) \) . $

Indeed the dyadic sum is less than $2 h_(*) \( j \)$, and the first dyadic value at least $L_j \( x \)$ is at most $2 max { 1 \, L_j \( x \) }$. After multiplying by $r$, sum the additive ones only over nonheavy levels and the logarithms by (7.5). This proves (7.9). In particular the argument does not multiply the number of nonheavy levels by a worst-case tier coefficient; the individual coefficients telescope through the local mass ratios.

=== 7.4 Noncoverage and the cost of roster edits <noncoverage-and-the-cost-of-roster-edits>

#thm([Lemma 7.6.])[
  (Tier edits).  #emph[The expected sum of $r_j$ times overall level-key changes due to roster edits, evaluated at the old physical positions in the stated edit order, is at most $C ell Q + D'_L$.]
] <lem:tier-edits>

#proof[
  For each level and tier use the nonnegative potential
  $ Phi_(j \, h) = r_j sum_(a = 1)^k upright(bold(1))_({ X^a upright(" is not covered by that tier") }) \, $
  ignoring all other structures in the definition of coverage. Telescope from step end to step end, so the potential includes physical movement. The sum of initial values is at most $k \| cal(H)_k \| sum_j r_j$, an allowed fixed initialization bound.
  If there is no insertion, the roster has no edit. Stationary members give zero potential change, and only the mover $y arrow.r x$ can increase the potential. This requires $y$ covered and $x$ uncovered. It is impossible in a qualified tier, by guaranteed coverage. In an unqualified tier, Lemma 25 gives expected positive increase at most $C h d \( x \, y \)$ when $r > 4 d \( x \, y \)$. For $r lt.eq 4 d \( x \, y \)$, the bound follows from the trivial increase at most $r lt.eq 4 h d \( x \, y \)$. Unqualification says $h < L_j \( x \)$, and
  #[#set math.equation(numbering: n => "(7.10)")
   $ sum_(j = 1)^J sum_(h in cal(H)_k : thin h < L_j \( x \)) h lt.eq 2 sum_(j = 1)^J L_j \( x \) lt.eq C ell . $ <eq:unqualified-tier-sum>]
  Thus all noninsertion increases cost at most $C ell Q$.
  At an insertion, let $C_a in { 0 \, r }$ be a member’s overall key charge caused by this tier edit at its old position. Let $U_(-)$ be old tier noncoverage at that position and $U_(+)$ final tier noncoverage at its final physical position. In particular $U_(+) = 0$ for the mover, because the newly inserted ball covers $x$. The following table accounts for the entire quantity $C_a + r \( U_(+) - U_(-) \)$.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Old tier status
], table.cell(rowspan: 1, colspan: 1)[Stationary member
], table.cell(rowspan: 1, colspan: 1)[Designated mover
]),
  table.cell(rowspan: 1, colspan: 1)[First covering entry persists
], table.cell(rowspan: 1, colspan: 1)[$C_a = 0$, $U_(-) = U_(+) = 0$
], table.cell(rowspan: 1, colspan: 1)[$C_a = 0$, $U_(-) = U_(+) = 0$
],
  table.cell(rowspan: 1, colspan: 1)[No covering entry
], table.cell(rowspan: 1, colspan: 1)[$C_a lt.eq r \( 1 - U_(+) \)$, $U_(-) = 1$; total at most zero
], table.cell(rowspan: 1, colspan: 1)[$C_a lt.eq r$, $U_(-) = 1$, $U_(+) = 0$; total at most zero
],
  table.cell(rowspan: 1, colspan: 1)[First covering entry retires
], table.cell(rowspan: 1, colspan: 1)[$C_a lt.eq r$, $U_(-) = 0$, $U_(+) lt.eq 1$; total at most $2 r$
], table.cell(rowspan: 1, colspan: 1)[$C_a lt.eq r$, $U_(-) = U_(+) = 0$; total at most $r$
],
)
]
  For the first row, new entries are appended after all existing ones, so a surviving first coverer keeps the tier key unchanged. Other structures are held fixed during this edit. For the second row, an overall key can change only if this previously uncovered point becomes covered by the tier. These facts also hold when an earlier structure shadows the tier, in which case its charge may simply be zero.
  There is a further zero-error case at a heavy level. If the old position lies in $B \( x \, gamma_H r \)$, the final heavy ball already covers it during all tier edits. Hence $C_a = 0$. The new tier ball covers that position if it is stationary, and covers the final point $x$ if it is the mover. Thus $U_(+) = 0$ and no retirement error is needed in this inner ball.
  We next bound the probability of the exceptional retirement row. Fix the full true input and a point $p$. Conditional on the old realized presences and radii, a pre-edit first coverer at a noncompulsory age can be removed on this step only by its fresh independent trial, of probability at most $1 \/ K$. For compulsory removal use an unconditional bound over the tape. At most $K^2$ chronological candidates of age less than $K^2$ have centers within $2 r$ of $p$. A candidate reaching age $K^2$ must previously have survived the $K^2 - K$ trials at ages $K \, dots.h \, K^2 - 1$. Consequently
  #[#set math.equation(numbering: n => "(7.11)")
   $ Pr_(upright("tape")) \( upright("the old first coverer of ") p upright(" retires") \) lt.eq 1 / K + K^2 \( 1 - 1 \/ K \)^(K^2 - K) lt.eq C / K . $ <eq:actual-retirement-bound>]
  The last inequality follows, for example, from $K^2 \( 1 - 1 \/ K \)^(K^2 - K) lt.eq K^2 e^(- \( K - 1 \)) lt.eq C \/ K$. If $d \( p \, x \) > 22 r$, no covering entry can have its age incremented: its center is within $2 r$ of $p$ but would have to be within $20 r$ of $x$. The retirement probability is then zero. The compulsory part of (7.11) is not asserted conditional on an observed surviving old roster; it averages over the independent tape with the chronological schedule fixed.
  For an insertion at time $t$, level $j$, and tier $h$, write
  #[#set math.equation(numbering: n => "(7.12)")
   $ W_(t \, j \, h) = cases(delim: "{", mu^(+) { p : gamma_H r < d \( p \, x \) lt.eq D_H r } \, & upright("if heavy") \,, mu^(+) \( B \( x \, D_L r \) \) \, & upright("if nonheavy") .) $ <eq:tier-insertion-mass>]
  Although the value at a fixed step and level does not depend on $h$, the indices specify the insertion being charged. The stationary errors are confined to this region, since $D_H > 22$, and the heavy inner ball has zero error. Average (7.11) first over the tape with the full input fixed, and then over input continuations given the true prefix. The insertion event and $W_(t \, j \, h)$ are fixed by that prefix. The expected stationary counting measure is $mu^(+) - delta_x lt.eq mu^(+)$. Thus the expected stationary error is at most $C r W_(t \, j \, h) \/ K$. This averaging statement is conditional only on the true prefix, not on the complete partition tape in $cal(F)_t$.
  At a nonheavy insertion, the mover’s error is also covered by $C r W_(t \, j \, h) \/ K$, since $W_(t \, j \, h) gt.eq mu^(+) \( { x } \) gt.eq 1$. At a heavy insertion, its remaining error is at most $C r \/ K$ and only occurs if $d \( y \, x \) > gamma_H r$. For each tier,
  $ sum_(r_j < d \( x \, y \) \/ gamma_H) frac(C r_j, K_h) lt.eq frac(C d \( x \, y \), K_h) \, #h(2em) sum_(h in cal(H)_k) 1 / K_h lt.eq C . $
  Here the fixed factor $1 \/ gamma_H$ is absorbed into $C$. These mover errors therefore cost at most $C Q$. It remains to prove
  #[#set math.equation(numbering: n => "(7.13)")
   $ bb(E) sum_(t \, j \, h : thin upright("insertion")) frac(r_j W_(t \, j \, h), K_h) lt.eq C ell Q + D_(upright("ins")) . $ <eq:insertion-charge-budget>]
  ===== 7.4.1 An auxiliary short roster. <an-auxiliary-short-roster.>
  We need a potential drop at an insertion to pay the remaining insertion charge. The insertion test excludes young records near $x$, but an older surviving ball may still cover $x$. A potential built from the actual surviving centers would therefore have no guaranteed change there. Instead we use an auxiliary roster containing only entries of age less than $K$. The insertion test then forces a vacant neighborhood of $x$ before the new entry arrives. Random retirement before the age cutoff keeps the expected increases elsewhere small.
  This auxiliary roster uses the same deterministic insertion records and ages. An entry starts present at age zero, has independent retirement probability $1 \/ sqrt(K)$ at each subsequent age increment, and retires compulsorily at age $K$. Its sole output is the deterministic expected function below; it does not enter the partition. Let $rho_L$ be the clipped increasing ramp on $\[ 1 \/ 8 \, 1 \/ 4 \]$, taking value one at infinity, and set
  #[#set math.equation(numbering: n => "(7.14)")
   $ g \( p \) = bb(E)_(upright("short")) rho_L #scale(x: 120%, y: 120%)[\(] d \( p \, cal(S) \) \/ r #scale(x: 120%, y: 120%)[\)] \, $ <eq:short-roster-g>]
  where $cal(S)$ is the set of surviving hypothetical centers. The expectation is over these auxiliary lifetimes, given the chronological schedule. The function $g$ lies in $\[ 0 \, 1 \]$ and has $r "Lip" \( g \) lt.eq 8$; it is a deterministic function of the true prefix, and is unchanged at noninsertions.
  At an insertion the test excludes all old centers of age less than $K$ within $r \/ 2$ of $x$. Every hypothetical survivor has age less than $K$. Hence before insertion $g = 1$ throughout $B \( x \, r \/ 8 \)$, while the new age-zero entry gives $g = 0$ there afterward. Elsewhere couple old and new hypothetical lifetimes by continuing the old trials. If the old ramp at $p$ can increase, a nearest surviving center within $r \/ 4$ of $p$, selected by a fixed tie rule, must retire. Its noncompulsory fresh trial has probability $1 \/ sqrt(K)$. There are at most $K$ possible compulsory candidates within $r \/ 4$ of $p$ by Lemma 23, and a candidate reaching age $K$ must have survived $K - 1$ previous trials. Thus
  #[#set math.equation(numbering: n => "(7.15)")
   $ \( g_(upright("new")) \( p \) - g_(upright("old")) \( p \) \)_(+) lt.eq epsilon_K := K^(- 1 \/ 2) + K \( 1 - K^(- 1 \/ 2) \)^(K - 1) lt.eq C K^(- 1 \/ 2) . $ <eq:short-retirement-bound>]
  The last bound follows by comparing the second term with $K exp \( - \( K - 1 \) \/ sqrt(K) \)$; its ratio to $K^(- 1 \/ 2)$ is bounded over integers $K gt.eq 2$. Only centers within $20 r$ of $x$ change age. Therefore positive changes of $g$ are supported in
  #[#set math.equation(numbering: n => "(7.16)")
   $ B \( x \, 21 r \) \\ B \( x \, r \/ 8 \) . $ <eq:short-positive-support>]
  The auxiliary estimate is $O \( K^(- 1 \/ 2) \)$, whereas the bound used for actual retirements is $O \( K^(- 1) \)$. The exponentially large choice of $K_h$ will make the auxiliary error small enough compared with the insertion gain.
  ===== 7.4.2 The insertion gain in the pilot. <the-insertion-gain-in-the-pilot.>
  Fix an insertion, abbreviate $W = W_(t \, j \, h)$, and let $z$ be an old minimizer of the second-template pilot at $mu^(+)$ and $g_(upright("old"))$. Its residual $R_z \( p \) = 1 - sum_s z_s b_s \( p \)$ lies in $\[ 0 \, 1 \]$. The change of its objective when $g$ is edited is exactly
  #[#set math.equation(numbering: n => "(7.17)")
   $ r integral [Delta g \( p \) R_z \( p \) + 256 sum_s z_s Delta g \( s \) a_s \( p \)] d mu^(+) \( p \) . $ <eq:tier-candidate-change>]
  At a nonheavy level, its positive part is at most $C r W \/ sqrt(K)$. Indeed the residual increase is supported in $B \( x \, 21 r \)$. Any increasing-coefficient site lies in that same ball, and its surcharge support lies in $B \( x \, \( 21 + 2 R \) r \) subset B \( x \, D_L r \)$. At any test point the weights of all sites with nonzero $a_s$ sum to at most one, by the pilot capacity constraint and $2 R < D_(*)$. Now apply (7.15) to both terms of (7.17).
  At a heavy level the same bound holds with the annular definition of $W$, rather than the possibly much larger inner mass. To see this, every possible increasing-coefficient site satisfies $r \/ 8 < d \( s \, x \) lt.eq 21 r$. Since $1 \/ 8 - gamma_H > sigma$ and $21 + gamma_H < R$, its bump $a_s$ equals one throughout $B \( x \, gamma_H r \)$. Its $b_s$-support lies inside $B \( x \, D_H r \)$. Writing $M_H = mu^(+) \( B \( x \, gamma_H r \) \)$, the coefficient of $z_s$ in the old objective, divided by $r$, is at least
  $ 256 M_H - 2 mu^(+) \( B \( x \, D_H r \) \) gt.eq \[ 256 - 2 \( 1 + delta_H \) \] M_H > 0 . $
  Deleting that weight preserves both capacity and separation constraints, so optimality forces $z_s = 0$. Hence no surcharge increases in (7.17); the residual increases only in (7.16), a subset of the heavy annulus in (7.12). Its positive contribution is again at most $C r W \/ sqrt(K)$.
  It remains to exhibit the negative contribution. Put $M_L = mu^(+) \( B \( x \, gamma_L r \) \)$. Qualification and the definition of $W$ give, in both the heavy and nonheavy cases,
  #[#set math.equation(numbering: n => "(7.18)")
   $ M_L gt.eq e^(- h) mu^(+) \( B \( x \, D_L r \) \) gt.eq e^(- h) W . $ <eq:insertion-inner-mass>]
  There are two exhaustive cases.
  If some site $s$ within $3 sigma r$ of $x$ has $z_s gt.eq 1 \/ 2$, then $g \( s \)$ drops from one to zero because $3 sigma < 1 \/ 8$. On the entire heavy annulus $gamma_H r < d \( p \, x \) lt.eq D_H r$, the bump $a_s \( p \)$ equals one: the lower distance is greater than $gamma_H - 3 sigma > sigma$ in scale units, and the upper distance is less than $D_H + 3 sigma < R$. Its surcharge drop is at least $128 r W$ when the request is heavy. When it is nonheavy, failure of (7.3) says that this annulus has mass greater than $delta_H M_H gt.eq delta_H M_L$. The drop is then at least $128 delta_H r M_L gt.eq 128 delta_H r e^(- h) W$.
  If no such site exists, then for every $p in B \( x \, gamma_L r \)$, any contributing $b_s \( p \)$ has its center within $\( 2 sigma + gamma_L \) r < 3 sigma r$ of $x$, and has weight less than $1 \/ 2$. At most one positive site contributes there, since two centers within $2 sigma r$ of the same point would violate their $5 sigma r$ separation. It follows that $R_z \( p \) gt.eq 1 \/ 2$ on this inner ball. The unit drop of $g \( p \)$ there gives a residual decrease at least $r M_L \/ 2 gt.eq r e^(- h) W \/ 2$.
  Combining either negative contribution with the established positive error, and using the old optimum as a candidate for the new minimum, gives absolute $c \, C > 0$ such that
  #[#set math.equation(numbering: n => "(7.19)")
   $ cal(L)_r \( mu^(+) \, g_(upright("old")) \) - cal(L)_r \( mu^(+) \, g_(upright("new")) \) gt.eq r W (c e^(- h) - C / sqrt(K)) . $ <eq:tier-pilot-drop>]
  Choose $C_K$ sufficiently large, once and for all, that for every $h gt.eq 1$,
  $ C e^(- C_K h \/ 2) lt.eq \( c \/ 2 \) e^(- h) \, #h(2em) e^(- C_K h) lt.eq \( c \/ 2 \) e^(- 2 h) . $
  Since $K gt.eq e^(C_K h)$, multiplying (7.19) by $e^(- h)$ yields
  #[#set math.equation(numbering: n => "(7.20)")
   $ e^(- h) #scale(x: 120%, y: 120%)[\[] cal(L)_r \( mu^(+) \, g_(upright("old")) \) - cal(L)_r \( mu^(+) \, g_(upright("new")) \) #scale(x: 120%, y: 120%)[\]] gt.eq \( c \/ 2 \) e^(- 2 h) r W gt.eq frac(r W, K) . $ <eq:weighted-insertion-drop>]
  For each tier apply Corollary 20 with its held function (7.14) and fixed weight $e^(- h)$. The template and Lipschitz constants are the same for all tiers, and $sum_(h in cal(H)_k) e^(- h) lt.eq sum_(n gt.eq 1) e^(- n) < oo$. Thus the filtering and summed drift budgets remain $C ell Q$, with no factor equal to the number of tiers. At noninsertions there is no parameter edit. At insertions (7.20) pays exactly the desired charges. The potentials are nonnegative and their total initial value is at most $2 k sum_j r_j sum_h e^(- h)$. This proves (7.13).
  Finally sum the per-member case table over all insertions, add the noninsertion estimate (7.10), and telescope the noncoverage potentials. The expected retirement errors are covered by (7.13) and the heavy-mover geometric sum. Their terminal nonnegative values can be discarded. This proves the lemma with an initialization bound independent of the law and horizon. ◻
]

=== 7.5 The fixed tree and its posterior interface <the-fixed-tree-and-its-posterior-interface>

#proof[
  Let $cal(A)_j$ be the fixed level alphabet in Lemma 24, and take the tree of all prefixes of words in $cal(A)_1 times dots.h.c times cal(A)_J$, including unused words. Initially the center structures are empty and the map uses singleton labels. At every step map a point to its complete string of final keys. The last-level cell diameter is at most $40 r_J$, less than the minimum nonzero distance of $Y$; hence last-level cells are singletons, giving injectivity and a requested leaf with anchor exactly equal to the actual request.
  For any two words $u \, v$,
  #[#set math.equation(numbering: n => "(7.21)")
   $ d_(cal(T)) \( u \, v \) lt.eq tau sum_(j = 1)^J r_j upright(bold(1))_({ u_j eq.not v_j }) . $ <eq:key-to-tree-charge>]
  Indeed, if their first disagreement is $j$, the left side is $r_(j - 1) = tau r_j$. For each member on each step, first edit all level keys at its old physical position, and then move it to its new position under the final map. The triangle inequality for key disagreements bounds the right side of (7.21) by the heavy edit charges, all tier edit charges, and the final-map physical disagreements. The first two have budgets $C ell Q + D$ by Lemmas 22 and 26. Only the designated mover has a nonzero final physical disagreement; (7.9), applied after fixing the true input and hence that member’s old position, bounds its expected charge by $C ell d \( x \, y \)$. Averaging over inputs and summing proves (7.2); $tau$ is absolute.
  All initialized potentials above are bounded by fixed multiples of $k \( 1 + \| cal(H)_k \| \) sum_j r_j$. Their number of time updates never enters the bound. The finite pools and the full prefix tree likewise depend only on $Y \, k$ and the chosen absolute constants. Consequently the additive constant is uniform over input laws and horizons. ◻
]

For completeness, the coupling used by the allocation theorem is now fully specified. Put

$ N_v \( t \) = \# { a : xi_t \( X_t^a \) upright(" has prefix ") v } \, #h(2em) m_v \( t \) = bb(E) \[ N_v \( t \) divides cal(F)_t \] . $

The final map and the requested leaf are available from the observed true prefix and independent partition tape before virtual service. The requested leaf contains the designated comparator member after drift, with conditional probability one. The filtering substep at time $t$ uses $N_v \( t - 1 \)$ with the #emph[old] map $xi_(t - 1)$, comparing its laws given $cal(F)_(t - 1)$ and $cal(F)_t$. The drift substep compares that same old-map variable with $N_v \( t \)$, both conditioned on $cal(F)_t$, along the hidden labeled coupling whose expected cost is (7.2). In particular the allocation drift budgets are paid by this $P$. No ball-separation or survival probability is asserted after conditioning on the complete tape; those estimates have already been averaged to establish $P$.

For a finite horizon the partition outcomes can, if desired, be encoded on a finite probability space: on finite $Y$, a radius is used only through its ball subset, so its continuous law has finitely many relevant outcomes, and only finitely many insertions and lifetime trials occur. The expected short-roster functions require no additional random observations. The construction therefore meets the finite-data requirements of Theorem 5.

Apply that theorem once to the fixed full tree. Its trackers continue at every vertex when a label becomes unused and later reappears; they are not restarted when a slot is recycled. The resulting bound is $V lt.eq C ell P + D_1$ with a single fixed-tree initialization bound. Partition schedules use only the true-prefix posteriors and chronological ages, so neither these allocations nor the independent rounding randomness feed back into the partition construction.

== 8 Travel of parked mass <sec:travel>

The allocation theorem controls movement between tree vertices. A second cost arises when a vertex retains its key but that key acquires a new anchor in the metric. We pay this cost using the comparator mass in the key, normalized by a slowly updated estimate of its size. The estimate is essential: keeping its coefficient fixed during filtering allows us to use conditional expectation without paying the absolute variation of a posterior.

Throughout this section the tree, label pools, and maps are those of Section 7, and the allocations are supplied by Theorem 5. A state at time $t$ means the state after all updates for that request. Write $mu_t$ for the true-metric posterior counting measure at this state. All multiplicative constants below are absolute. Additive constants may depend on the fixed finite metric, $k$, the scales, and the fixed label pools, but not on the input law or its horizon.

=== 8.1 Parking and valid representatives <parking-and-valid-representatives>

For every tree vertex, including the root and leaves, define its parked mass by

#[#set math.equation(numbering: n => "(8.1)")
 $ p_(t \, v)^compose = q_(t \, v) - sum_(i upright(" child of ") v) q_(t \, i) . $ <eq:park-definition>]

The empty sum at a leaf is zero. Allocation feasibility makes these numbers nonnegative. Telescoping within a subtree gives

#[#set math.equation(numbering: n => "(8.2)")
 $ sum_(w upright(" descendant of ") v) p_(t \, w)^compose = q_(t \, v) \, #h(2em) sum_v p_(t \, v)^compose = k \, $ <eq:park-subtree-total>]

where a vertex counts as its own descendant.

#thm([Lemma 8.1.])[
  (Parked variation and witnesses).  #emph[At every step, 
#[#set math.equation(numbering: n => "(8.3)")
 $ sum_v r_(\| v \|) \| Delta p_v^compose \| lt.eq (1 + 1 / tau) sum_(v eq.not upright("root")) r_(\| v \| - 1) \| Delta q_v \| . $ <eq:park-variation>]

 If $q_(t \, v) > 0$, there is a point of $Y$ whose current key string has prefix $v$. Such a point is called a validity witness for $v$. If $\| v \| = j gt.eq 1$, every validity witness is within $20 r_j$ of the anchor of the last key of $v$.]
] <lem:park-variation>

#proof[
  Taking differences in (8.1) and using the triangle inequality gives
  $ sum_v r_(\| v \|) \| Delta p_v^compose \| & lt.eq sum_v r_(\| v \|) \| Delta q_v \| + sum_v r_(\| v \|) sum_(i upright(" child of ") v) \| Delta q_i \|\
 & = 1 / tau sum_(v eq.not upright("root")) r_(\| v \| - 1) \| Delta q_v \| + sum_(i eq.not upright("root")) r_(\| i \| - 1) \| Delta q_i \| . $
  The root term in the first sum vanishes because its allocation is always $k$. This proves (8.3), including the root’s parked mass. The bound $q_(t \, v) lt.eq C_0 m_(t \, v)$ implies $m_(t \, v) > 0$ whenever $q_(t \, v) > 0$. Since $Y$ is finite, some point mapped below $v$ then has positive posterior counting mass. It is a witness. The anchor-distance assertion is part of Lemma 24: a level key is a heavy ball of radius at most $20 r_j$, a smaller roster ball, or a singleton. ◻
]

Represent a park at a nonroot vertex by its last key’s anchor. Represent the root by one fixed point of $Y$. A balanced integer rounding of $p_(t \, v)^compose$ can be positive only if $p_(t \, v)^compose > 0$, since the floor and ceiling of zero are both zero. Thus the same witness statement will apply to occupied integer parks in Section 9.

Let $Lambda_j^H$ be the fixed pool of heavy-label slots at level $j$. For $lambda in Lambda_j^H$, let $C_(t \, j \, lambda) subset.eq Y$ be the points currently assigned that level key, and let $a_(t \, j \, lambda)$ be its anchor. An absent label has empty region and an arbitrary fixed placeholder anchor. Heavy precedence and disjointness mean that, when present, $C_(t \, j \, lambda)$ is the entire heavy ball carrying the label. Set

#[#set math.equation(numbering: n => "(8.4)")
 $ b_(t \, j \, lambda) & = sum_(\| v \| = j\
upright("last key of ") v = lambda) p_(t \, v)^compose \,\
M_(t \, j \, lambda) & = sum_(\| v \| = j\
upright("last key of ") v = lambda) m_(t \, v) = mu_t \( C_(t \, j \, lambda) \) . $ <eq:label-park-size>]

These definitions use the fixed slots even when they are absent, in which case both quantities are zero. In particular,

#[#set math.equation(numbering: n => "(8.5)")
 $ 0 lt.eq b_(t \, j \, lambda) lt.eq C_0 M_(t \, j \, lambda) \, #h(2em) sum_(j \, lambda in Lambda_j^H) r_j \| Delta b_(j \, lambda) \| lt.eq sum_v r_(\| v \|) \| Delta p_v^compose \| . $ <eq:label-park-domination>]

The second inequality follows by grouping fixed vertex coordinates, then using the triangle inequality. It also holds across label disappearance and reuse.

Let $E_(t \, j \, lambda)$ be the event that the label is present at both successive states and its anchor changes. By Lemma 24, this is an explicit reuse of a heavy label at an intersecting new heavy ball. In particular,

#[#set math.equation(numbering: n => "(8.6)")
 $ upright(bold(1))_(E_(t \, j \, lambda)) d \( a_(t - 1 \, j \, lambda) \, a_(t \, j \, lambda) \) lt.eq 40 r_j upright(bold(1))_(E_(t \, j \, lambda)) . $ <eq:retained-anchor-distance>]

The quantity to be bounded is

#[#set math.equation(numbering: n => "(8.7)")
 $ T_(upright("anchor")) = bb(E) sum_(t \, j \, lambda in Lambda_j^H) r_j b_(t \, j \, lambda) upright(bold(1))_(E_(t \, j \, lambda)) . $ <eq:anchor-travel-definition>]

#thm([Proposition 8.2.])[
  (Retained-anchor travel).  #emph[There is an absolute constant $C$ and a finite constant $D_(upright("anchor"))$, independent of the input law and horizon, such that 
#[#set math.equation(numbering: n => "(8.8)")
 $ T_(upright("anchor")) lt.eq C #scale(x: 120%, y: 120%)[\(] V + ell P + ell Q #scale(x: 120%, y: 120%)[\)] + D_(upright("anchor")) . $ <eq:anchor-travel-bound>]

 Consequently the expected cost of moving the new parked masses with their retained anchors is at most $40 T_(upright("anchor"))$. No multiplicative constant in this statement depends on the number of levels or on $k$.]
] <prop:anchor-travel>

The proof uses a size tracker and a pointwise estimate for its old coefficients. We establish both before analyzing the travel potential.

=== 8.2 An affine size tracker <an-affine-size-tracker>

Put $rho = 6 \/ 5$. For each fixed heavy-label slot maintain a reference $hat(m)_(t \, j \, lambda) in \[ 1 \, k + 1 \]$ for $s_(t \, j \, lambda) = 1 + M_(t \, j \, lambda)$. Initially set the reference equal to $s_(0 \, j \, lambda)$. At each subsequent step, after computing the new membership and posterior size, keep the old reference if

#[#set math.equation(numbering: n => "(8.9)")
 $ rho^(- 1) hat(m)_(t - 1 \, j \, lambda) lt.eq s_(t \, j \, lambda) lt.eq rho hat(m)_(t - 1 \, j \, lambda) \; $ <eq:key-size-comparison>]

otherwise refresh it to $s_(t \, j \, lambda)$. Thus every completed state satisfies the same comparison with its current reference. The tracker continues to run while a slot is absent; recycling a slot does not restart it.

#thm([Lemma 8.3.])[
  (Size-refresh budget).  #emph[If $R_(t \, j \, lambda)$ denotes a refresh, then 
#[#set math.equation(numbering: n => "(8.10)")
 $ bb(E) sum_(t \, j \, lambda in Lambda_j^H) r_j #scale(x: 120%, y: 120%)[\(] hat(m)_(t - 1 \, j \, lambda) + hat(m)_(t \, j \, lambda) #scale(x: 120%, y: 120%)[\)] upright(bold(1))_(R_(t \, j \, lambda)) lt.eq C ell P + D_(upright("size")) \, $ <eq:key-size-refresh-budget>]

 where $C$ is absolute and $D_(upright("size"))$ depends only on the fixed metric, scales, $k$, and label pools.]
] <lem:key-size-refresh>

#proof[
  The payment is a tangent gap, equivalently the Bregman divergence for the convex function $s log s$ #cite(label("Bregman67")). For $u \, s in \[ 1 \, k + 1 \]$, the tangent at $u$ to $f \( s \) = - s log s$ is
  #[#set math.equation(numbering: n => "(8.11)")
   $ T_u \( s \) = f \( u \) + f' \( u \) \( s - u \) = u - \( 1 + log u \) s . $ <eq:entropy-tangent>]
  It is affine in $s$, with slope of absolute value at most $ell$. A refresh $u arrow.r s$ releases
  #[#set math.equation(numbering: n => "(8.12)")
   $ T_u \( s \) - T_s \( s \) = s log \( s \/ u \) - s + u gt.eq frac(\( s - u \)^2, 2 max \( s \, u \)) . $ <eq:entropy-refresh-credit>]
  For completeness, if $s gt.eq u$ the left side equals $integral_u^s \( s - z \) z^(- 1) thin d z$, and if $s lt.eq u$ it equals $integral_s^u \( z - s \) z^(- 1) thin d z$. Bounding the denominator by $max \( s \, u \)$ gives the inequality. At failure of (8.9), $\| s - u \| gt.eq \( 1 - rho^(- 1) \) max \( s \, u \)$, so
  #[#set math.equation(numbering: n => "(8.13)")
   $ T_u \( s \) - T_s \( s \) gt.eq frac(\( 1 - rho^(- 1) \)^2, 4) \( s + u \) = frac(s + u, 144) . $ <eq:entropy-relative-credit>]
  We check the input budget for the weighted sum of these tangents. Let $N_(t \, j \, lambda)^(upright("key"))$ be the actual number of hidden members whose level-$j$ key at time $t$ is $lambda$. Filtering replaces $bb(E) \[ N_(t - 1 \, j \, lambda)^(upright("key")) divides cal(F)_(t - 1) \]$ by $bb(E) \[ N_(t - 1 \, j \, lambda)^(upright("key")) divides cal(F)_t \]$, using the old map and old reference. Its signed contribution has conditional expectation zero. Drift then replaces this old hidden count by the new count, with both conditioned on $cal(F)_t$.
  If a member’s two mapped leaves first differ at level $j_0$, the radius sum of its possible level-key disagreements is at most
  #[#set math.equation(numbering: n => "(8.14)")
   $ sum_(j gt.eq j_0) r_j lt.eq frac(r_(j_0 - 1), tau - 1) = frac(d_T \( upright("old leaf") \, upright("new leaf") \), tau - 1) . $ <eq:key-disagreement-sum>]
  At one level a member changes at most two heavy-slot indicators, one for the departing key and one for the arriving key. Applying this pathwise to the coupled hidden trajectory and then taking conditional expectations gives
  #[#set math.equation(numbering: n => "(8.15)")
   $ bb(E) sum_(t \, j \, lambda in Lambda_j^H) r_j lr(|M_(t \, j \, lambda) - bb(E) \[ N_(t - 1 \, j \, lambda)^(upright("key")) divides cal(F)_t \]|) lt.eq frac(2, tau - 1) P lt.eq 2 P . $ <eq:key-count-drift>]
  Thus the tangents’ expected total signed input increase is at most $2 ell P$.
  The tangents need not be nonnegative. Their endpoint values nevertheless have a uniform bound:
  $ \| T_u \( s \) \| lt.eq \( k + 1 \) \( 1 + ell \) #h(2em) \( 1 lt.eq u \, s lt.eq k + 1 \) . $
  Write $L_H = sum_j r_j \| Lambda_j^H \|$, a finite quantity fixed before the input law or horizon is chosen. The absolute value of the summed tangent potential is at most $\( k + 1 \) \( 1 + ell \) L_H$ at both endpoints. Telescoping its signed changes over every step, and using (8.13), proves (8.10), for example with $C = 288$ and $D_(upright("size")) = 288 \( k + 1 \) \( 1 + ell \) L_H$. Filtering is included on all steps before the decision to refresh; it is not restricted to the adaptively chosen refresh events. ◻
]

=== 8.3 A pointwise bound on old parked coefficients <a-pointwise-bound-on-old-parked-coefficients>

At a completed state, (8.5) and the size comparison give the individual bound

#[#set math.equation(numbering: n => "(8.16)")
 $ b_(j \, lambda) / hat(m)_(j \, lambda) lt.eq rho C_0 frac(M_(j \, lambda), 1 + M_(j \, lambda)) lt.eq rho C_0 . $ <eq:individual-park-coefficient>]

Summing this bound over all levels would introduce the height of the tree. The useful additional constraint is that parks at different depths draw on the same subtree allocations. All finer parks near a point can therefore be charged to comparator mass in a slightly larger ball at a coarser scale. Meanwhile a heavy ball whose anchor is near that point contains a smaller ball and bounds the normalization from below. Comparing these two ball masses will give a logarithmic coefficient sum.

#thm([Lemma 8.4.])[
  (Pointwise parked coefficients).  #emph[Fix any completed fractional state and any $y in Y$. At each level whose heavy-center set has a center within $7 r_j$ of $y$, let $lambda_j$ be its label. Such a center is unique. Then 
#[#set math.equation(numbering: n => "(8.17)")
 $ sum_(j : med d \( y \, a_(j \, lambda_j) \) lt.eq 7 r_j) b_(j \, lambda_j) / hat(m)_(j \, lambda_j) lt.eq C ell \, $ <eq:pointwise-park-coefficients>]

 with an absolute $C$, independent of the state and the number of levels.]
] <lem:park-coefficients>

#proof[
  Call the levels in the sum selected, and abbreviate their numerator to $b_j$. Distinct heavy centers at one level are separated by more than $100 r_j$, proving uniqueness. Their radii are at least $16 r_j$; therefore the selected heavy ball contains $B \( y \, r_j \)$. Heavy precedence and the size comparison imply
  #[#set math.equation(numbering: n => "(8.18)")
   $ hat(m)_(j \, lambda_j) gt.eq rho^(- 1) #scale(x: 120%, y: 120%)[\(] 1 + mu \( B \( y \, r_j \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:park-denominator-lower>]
  Here $mu$ is the posterior counting measure of the fixed state.
  We also have, for every level $j$, the cumulative capacity estimate
  #[#set math.equation(numbering: n => "(8.19)")
   $ sum_(i gt.eq j\
i upright(" selected")) b_i lt.eq C_0 mu \( B \( y \, 67 r_j \) \) . $ <eq:cumulative-park-mass>]
  To prove it, consider each positive park counted on the left. At its depth $i$, a validity witness lies within $20 r_i$ of its anchor, hence within $27 r_i$ of $y$. Group all these parks by their depth-$j$ ancestor $v$. Their sum in each group is at most $q_v$ by (8.2). The group has at least one witness $z$ within $27 r_i lt.eq 27 r_j$ of $y$. Every point with prefix $v$ shares its level-$j$ cell with $z$, and that cell has diameter at most $40 r_j$. All such points therefore belong to $B \( y \, 67 r_j \)$. Regions of distinct depth-$j$ prefixes are disjoint, so their posterior counts sum to at most $mu \( B \( y \, 67 r_j \) \)$. Summing $q_v lt.eq C_0 m_v$ proves (8.19).
  For an explicit scale summation put, at every level,
  $ A_j = 1 + mu \( B \( y \, 67 r_j \) \) \, #h(2em) B_j = 1 + mu \( B \( y \, r_j \) \) . $
  Both are between $1$ and $k + 1$. Extend $B_j = k + 1$ for $j lt.eq 0$. Since $tau gt.eq 2$, the fixed offset $p = 7$ satisfies $tau^p gt.eq 67$, and hence $A_j lt.eq B_(j - p)$. It follows that
  #[#set math.equation(numbering: n => "(8.20)")
   $ sum_(j = 1)^J log \( A_j \/ B_j \) lt.eq sum_(j = 1)^J #scale(x: 120%, y: 120%)[\(] log B_(j - p) - log B_j #scale(x: 120%, y: 120%)[\)] lt.eq p log \( k + 1 \) . $ <eq:park-log-telescope>]
  The final inequality cancels the common middle terms; at most $p$ uncancelled positive terms remain, each at most $log \( k + 1 \)$, and the remaining terms are nonpositive. This includes $J < p$.
  There are at most $p log \( k + 1 \) \/ log 2$ levels with $A_j > 2 B_j$. Their contribution is $O \( ell \)$ by (8.16). Partition the remaining selected levels into groups
  $ G_a = { j : med j upright(" selected") \, med A_j lt.eq 2 B_j \, med 2^a lt.eq A_j < 2^(a + 1) } \, #h(2em) 0 lt.eq a lt.eq floor.l log_2 \( k + 1 \) floor.r . $
  For a nonempty group let $j_a$ be its smallest, hence coarsest, index. By (8.18), every denominator in this group is at least $2^(a - 1) \/ rho$. By (8.19),
  $ sum_(j in G_a) b_j lt.eq C_0 mu \( B \( y \, 67 r_(j_a) \) \) = C_0 \( A_(j_a) - 1 \) lt.eq C_0 2^(a + 1) . $
  Its total coefficient is consequently at most $4 rho C_0$. There are at most $1 + log_2 \( k + 1 \)$ groups, proving (8.17). All these statements hold for each individual state and point, with no averaging and no conditioning on a future request. ◻
]

=== 8.4 Paying retained-anchor motion <paying-retained-anchor-motion>

#proof[
  Use the clipped ramp
  $ kappa \( u \) = cases(delim: "{", 0 \, & u lt.eq 4 \,, \( u - 4 \) \/ 3 \, & 4 < u < 7 \,, 1 \, & u gt.eq 7 .) $
  For a completed state define
  #[#set math.equation(numbering: n => "(8.21)")
   $ Phi_t = sum_(j \, lambda in Lambda_j^H) r_j b_(t \, j \, lambda) / hat(m)_(t \, j \, lambda) integral_(C_(t \, j \, lambda)) kappa #h(-0.16667em) (frac(d \( a_(t \, j \, lambda) \, z \), r_j)) thin d mu_t \( z \) . $ <eq:anchor-potential>]
  This is the posterior expectation of the sum of the same terms over the hidden members assigned to each key. The ramp measures mass away from the anchor. When a heavy label is reused at a new request, the concentrated mass is far from its old anchor and close to its new one, so the anchor change decreases the potential. Dividing by the held key size makes this decrease comparable to $r_j b_(t \, j \, lambda)$, the travel charge, rather than to its product with comparator mass.
  The potential is nonnegative. Moreover, at a completed state the normalized integral is at most $rho$, so
  #[#set math.equation(numbering: n => "(8.22)")
   $ 0 lt.eq Phi_t lt.eq rho sum_(j \, lambda in Lambda_j^H) r_j b_(t \, j \, lambda) lt.eq rho k r_0 . $ <eq:anchor-potential-endpoints>]
  The last inequality follows from (8.2), since each park occurs at just one depth and $r_j lt.eq r_0$.
  We now decompose the change of (8.21) in a specified order. This is an accounting order: the current partition and allocation are already available from the fractional history. Old parameters are held until their indicated substep.
  ===== 8.4.1 Filtering with old membership and all old parameters. <filtering-with-old-membership-and-all-old-parameters.>
  In the hidden-member expression for $Phi_(t - 1)$ retain the old locations, old key map, old anchors, old parks, and old references. Replace conditioning on $cal(F)_(t - 1)$ by conditioning on $cal(F)_t$. The coefficients and the old map are $cal(F)_(t - 1)$-measurable. Thus the tower property makes this signed potential change have conditional expectation zero. We perform this comparison on every step, before any refresh or anchor event is selected.
  ===== 8.4.2 Drift to new membership and new locations. <drift-to-new-membership-and-new-locations.>
  Use the coupled hidden trajectory, now conditioned on $cal(F)_t$, but continue to hold all anchors, parks, and size references at their old values. For a member whose level key changes, its total possible positive change among heavy slots is at most $C r_j$, by (8.16) and $0 lt.eq kappa lt.eq 1$. Summing (8.14) over members and steps pays these terms by $C P$ in expectation. This includes changes to heavy membership caused by partition edits, regardless of physical movement.
  For unchanged membership in a heavy key, the same old anchor appears in both ramp terms. If the old location is $y$ and the new one is $z$, then
  #[#set math.equation(numbering: n => "(8.23)")
   $ r_j b_(j \, lambda)^(upright("old")) / hat(m)_(j \, lambda)^(upright("old")) [kappa #h(-0.16667em) (frac(d \( a_(j \, lambda)^(upright("old")) \, z \), r_j)) - kappa #h(-0.16667em) (frac(d \( a_(j \, lambda)^(upright("old")) \, y \), r_j))]_(+) lt.eq frac(d \( y \, z \), 3) b_(j \, lambda)^(upright("old")) / hat(m)_(j \, lambda)^(upright("old")) upright(bold(1))_({ d \( a_(j \, lambda)^(upright("old")) \, y \) < 7 r_j }) . $ <eq:anchor-unchanged-key-drift>]
  Indeed $kappa$ is $1 \/ 3$-Lipschitz and cannot increase from a point where it already equals one. Lemma 30 bounds the sum of the coefficients on the right by $C ell$, for every old point $y$ and the old fractional state. This pointwise bound remains valid when that $y$ is sampled in the coupling conditional on the new history; we require no independence between the old mover and the new request. Only the designated comparator mover changes physical position on this step. Summing (8.23) therefore costs at most $C ell e_x$ conditionally, and at most $C ell Q$ in total expectation. The entire drift budget is $C \( P + ell Q \)$.
  ===== 8.4.3 Refreshing the size references. <refreshing-the-size-references.>
  At this point each integral uses the new key membership and new posterior locations, but still the old anchor. For one label write this integral as $I$, its new size as $M$, and $s = 1 + M$. Always $0 lt.eq I lt.eq M$. At a refresh from $u = hat(m)^(upright("old"))$ to $s$ the change is
  $ r_j b^(upright("old")) I (1 / s - 1 / u) . $
  If $s gt.eq u$ this is nonpositive. If $s < u$, its positive part is at most $r_j b^(upright("old")) I \/ s lt.eq r_j b^(upright("old"))$. The old completed state gives $b^(upright("old")) lt.eq rho C_0 u$ by (8.16). Hence all positive refresh jumps are at most a constant times the charge in (8.10). This argument does not assume that the new integral is controlled by the old denominator.
  ===== 8.4.4 Updating the parked amounts. <updating-the-parked-amounts.>
  The new size references now satisfy $hat(m)^(upright("new")) gt.eq \( 1 + M \) \/ rho$, whether refreshed or retained. Consequently $I \/ hat(m)^(upright("new")) lt.eq rho$. Replacing $b^(upright("old"))$ by $b^(upright("new"))$ changes the potential by at most $rho r_j \| Delta b \|$ in absolute value. Equations (8.5) and (8.3) give the expected total budget
  #[#set math.equation(numbering: n => "(8.24)")
   $ rho bb(E) sum_(t \, j \, lambda in Lambda_j^H) r_j \| Delta b_(j \, lambda) \| lt.eq rho \( 1 + tau^(- 1) \) V . $ <eq:anchor-park-update-budget>]
  ===== 8.4.5 Updating anchors and collecting the travel payment. <updating-anchors-and-collecting-the-travel-payment.>
  An absent final key has zero integral and zero new parked mass, so choosing its placeholder anchor costs nothing. A newly present key had $b^(upright("old")) = 0$: the fresh-label rule ensures that it was absent from the preceding map. Its anchor initialization can increase the potential by at most
  $ rho r_j b^(upright("new")) = rho r_j \| Delta b \| \, $
  which is another copy of the variation budget (8.24). A retained key with unchanged anchor contributes zero.
  It remains to consider a retained moving heavy label at an update for the request $x$, at radius $r = r_j$. Its new anchor is $x$, its old anchor $a$ satisfies $d \( a \, x \) > 8 r$, and its new key region is the entire new heavy ball $C$. Put
  $ H = mu_t \( B \( x \, gamma_H r \) \) . $
  The served comparator contains $x$, so $H gt.eq 1$. The new heavy ball contains this inner ball and is contained in $B \( x \, D_H r \)$. The heavy condition (7.3) therefore gives
  #[#set math.equation(numbering: n => "(8.25)")
   $ H lt.eq M_(j \, lambda)^(upright("new")) = mu_t \( C \) lt.eq \( 1 + delta_H \) H \, #h(2em) hat(m)_(j \, lambda)^(upright("new")) lt.eq rho \( 1 + M_(j \, lambda)^(upright("new")) \) lt.eq rho \( 2 + delta_H \) H . $ <eq:anchor-heavy-mass-comparison>]
  The last inequality is exactly where the inner mass $H gt.eq 1$ is needed; it accounts for the added one in the normalization.
  On $B \( x \, gamma_H r \)$ the old ramp is one because $d \( a \, z \) > \( 8 - gamma_H \) r > 7 r$, and the new ramp is zero because $d \( x \, z \) lt.eq gamma_H r < 4 r$. Outside this inner ball but inside $C$, the ramp can increase by at most one, and that region has mass at most $delta_H H$. Hence changing $a$ to $x$ changes the unnormalized integral by at most $- \( 1 - delta_H \) H$. With the new park and new reference already in place, (8.25) shows that the potential decreases by at least
  #[#set math.equation(numbering: n => "(8.26)")
   $ frac(1 - delta_H, rho \( 2 + delta_H \)) thin r b_(j \, lambda)^(upright("new")) gt.eq 1 / 4 r b_(j \, lambda)^(upright("new")) . $ <eq:retained-anchor-drop>]
  Here we used the absolute choices $gamma_H < 1 \/ 100$ and $delta_H < 1 \/ 100$. Thus this payment is uniform even when the retained park remains at exactly the same tree vertex.
  Combining the five substeps, summing signed changes over all times, and taking expectations yields
  $ 1 / 4 T_(upright("anchor")) lt.eq bb(E) Phi_0 - bb(E) Phi_T + C \( P + ell Q \) + C ell P + C D_(upright("size")) + C V . $
  The filtering contributions have vanished by conditional expectation; the size-refresh estimate pays their later adaptively selected consequences. Use (8.22) and $ell gt.eq 1$ to obtain (8.8), with an additive constant bounded by $C \( D_(upright("size")) + k r_0 \)$. Finally, (8.6) proves the asserted bound for actual anchor displacement.
  The only scale summations used were the geometric sum (8.14) and the fixed-offset and dyadic sums in Lemma 30. Their constants are independent of the height. The finite label pools enter only the endpoint constant $D_(upright("size"))$, and their persistent tracker states ensure that no initialization allowance is charged again when a label is recycled. ◻
]

== 9 Balanced rounding and realization in the metric <sec:rounding>

Balanced subtree rounding with constant movement loss on separated trees was developed in #cite(label("BBMN15")) Section 5.2. The formulation here also allows internal parks and a prescribed parent total correlated with the old child counts.

The allocation theorem allows mass to stop at internal vertices. We round both subtree amounts and parks, working from the root toward the leaves. At each vertex the already rounded parent fixes an integer total for its children and its park. That total may be correlated with their old counts. Our local kernel first meets the total in every realized state, then repairs the coordinate means by exchanges that preserve each state’s total.

The resulting integer parks can be matched along the tree. Parks matched at different vertices are paid by tree movement; parks matched at the same vertex require the separate anchor-travel estimate when their representative has moved.

Throughout this section, the filtration $cal(F)_t$ contains the request prefix and the independent partition tape, as in Section 3. It excludes a further independent tape used only for rounding. All fractional states and anchors at time $t$ are $cal(F)_t$-measurable. Write

$ p_v^compose \( t \) = q_v \( t \) - sum_(i upright(" child of ") v) q_i \( t \) \, $

where the sum is empty at a leaf. We seek integer subtree counts $n_v \( t \)$ and integer parks $c_v \( t \)$ satisfying

#[#set math.equation(numbering: n => "(9.1)")
 $ n_(upright("root")) \( t \) & = k \, & n_v \( t \) & = c_v \( t \) + sum_(i upright(" child of ") v) n_i \( t \) \,\
n_v \( t \) & in { floor.l q_v \( t \) floor.r \, ceil.l q_v \( t \) ceil.r } \, & bb(E) \[ n_v \( t \) divides cal(F)_t \] & = q_v \( t \) \,\
c_v \( t \) & in { floor.l p_v^compose \( t \) floor.r \, ceil.l p_v^compose \( t \) ceil.r } \, & bb(E) \[ c_v \( t \) divides cal(F)_t \] & = p_v^compose \( t \) . $ <eq:rounding-invariants>]

These requirements concern conditional means given $cal(F)_t$ alone. We do not prescribe the same means after additionally conditioning on the realized rounded ancestors; such requirements would generally be inconsistent with their prescribed integer totals.

=== 9.1 A finite rounding kernel for one star <a-finite-rounding-kernel-for-one-star>

#thm([Lemma 9.1.])[
  (Balanced rounding with a prescribed random total).  #emph[Let $a \, b in \[ 0 \, oo \)^d$, and let $X in bb(Z)_(gt.eq 0)^d$ be a random vector with 
$ X_i in { floor.l a_i floor.r \, ceil.l a_i ceil.r } \, #h(2em) bb(E) X_i = a_i . $

 Put $M = sum_i X_i$. Let $N$ be any random integer, arbitrarily correlated with $X$, such that 
$ N in {⌊sum_i b_i⌋ \, ⌈sum_i b_i⌉} \, #h(2em) bb(E) N = sum_i b_i . $

 There is a randomized kernel from the finite set of states $\( X \, N \)$ to vectors $X'$ such that, in every state and every outcome of the kernel, 
$ X'_i in { floor.l b_i floor.r \, ceil.l b_i ceil.r } \, #h(2em) sum_i X'_i = N . $

 Its coordinate means, averaged over both the original state and the kernel, satisfy 
$ bb(E) X'_i = b_i . $

 With 
$ T = sum_i \| a_i - b_i \| \, #h(2em) I = bb(E) \| N - M \| \, $

 the kernel can be chosen to satisfy 
#[#set math.equation(numbering: n => "(9.2)")
 $ bb(E) parallel X' - X parallel_1 lt.eq 32 T + 11 I . $ <eq:rounding-star-bound>]

 Moreover, for any balanced random total $N$ with the displayed mean, a balanced vector with total $N$ and coordinate means $b_i$ exists without specifying an old vector $X$.]
] <lem:rounding-star>

#proof[
  All expectations in this proof are taken under the given joint distribution; no independence assumption is made. Set $l_i = floor.l b_i floor.r$ and $u_i = ceil.l b_i ceil.r$. Clip $X_i$ into $\[ l_i \, u_i \]$, obtaining $Y_i$. For each coordinate,
  #[#set math.equation(numbering: n => "(9.3)")
   $ bb(E) \| Y_i - X_i \| lt.eq \| a_i - b_i \| . $ <eq:rounding-clip>]
  Indeed, if $a_i lt.eq b_i$, upper clipping is impossible. Lower clipping either does nothing, or $l_i > floor.l a_i floor.r$, in which case every possible $X_i$ is at most $l_i$ and its expected cost is $l_i - a_i lt.eq b_i - a_i$. If $a_i gt.eq b_i$, the symmetric argument applies to upper clipping. This includes integral targets and equality of endpoints. Summing (9.3) gives $bb(E) parallel Y - X parallel_1 lt.eq T$.
  For each state, adjust $Y$ within the integer intervals $\[ l_i \, u_i \]$ until its sum equals the actual value of $N$, obtaining $Z$. The adjustment is always possible: the sums of allowed vectors comprise every integer between $sum_i l_i$ and $sum_i u_i$, and both endpoint integers of $sum_i b_i$ lie in that interval. Increasing coordinates only, or decreasing coordinates only, as needed, costs exactly $\| N - sum_i Y_i \|$. A fixed coordinate order makes this choice deterministic. Thus, writing $L = bb(E) parallel Z - X parallel_1$,
  #[#set math.equation(numbering: n => "(9.4)")
   $ L & lt.eq bb(E) parallel Y - X parallel_1 + bb(E) lr(|N - sum_i Y_i|)\
 & lt.eq 2 T + I \,\
D := sum_i \| bb(E) Z_i - b_i \| & lt.eq sum_i \| bb(E) Z_i - a_i \| + T lt.eq L + T lt.eq 3 T + I . $ <eq:rounding-preliminary>]
  Only the means of $Z$ may now be wrong. Requiring $bb(E) \[ X'_i divides N \] = b_i$ would force $N = sum_i b_i$ on every positive-probability event. We instead repair the means under the given joint law while preserving each state’s actual total.
  To construct this repair by finite optimization, let
  $ H = { i : b_i in.not bb(Z) } \, #h(2em) f_i = b_i - l_i quad \( i in H \) \, #h(2em) s = ⌊sum_(i in H) f_i⌋ . $
  An allowed vector is specified by a subset $A subset.eq H$ of coordinates rounded upward. Its cardinality is $N - sum_i l_i$, and hence is either $s$ or $s + 1$. If $sum_(i in H) f_i$ is integral, only $s$ occurs. The preliminary vector $Z$ specifies such a subset $A_0$ in each original state.
  For every original state $omega = \( X \, N \)$ of positive probability, consider all probability distributions on subsets of the required cardinality for that state. Their product is a nonempty compact finite-dimensional set. A choice in this product is precisely a randomized kernel that keeps the observed total $N$ fixed. Minimize on it
  #[#set math.equation(numbering: n => "(9.5)")
   $ bb(E) \| A triangle.stroked.t A_0 \| + 10 sum_(i in H) \| Pr \( i in A \) - f_i \| . $ <eq:rounding-repair-objective>]
  Here $\| A triangle.stroked.t A_0 \|$ is the number of coordinates changed; it equals the $ell_1$ change of the associated integer vectors. A minimum exists by continuity. Let $p_i = Pr \( i in A \)$ at a minimizer. Since every outcome has the required total,
  $ sum_(i in H) p_i = bb(E) N - sum_i l_i = sum_(i in H) f_i . $
  Consequently, if a discrepancy remains, there are distinct indices $i \, j$ with $p_i > f_i$ and $p_j < f_j$.
  First suppose that a supported state-and-subset pair has $i in A$, $j in.not A$. On a sufficiently small amount $epsilon > 0$ of its probability mass replace $A$ by $A \\ { i } union { j }$. This preserves that state’s total. Choose $epsilon$ no larger than the two discrepancies and the mass of this state-and-subset pair. The sum of marginal discrepancies falls by $2 epsilon$, whereas the first term in (9.5) rises by at most $2 epsilon$. This contradicts minimality.
  In the remaining case, no supported subset contains $i$ without $j$. Because $p_i > f_i > 0$, some supported subset $A$ contains both. Because $p_j < f_j < 1$, some supported subset $B$ contains neither. Their cardinalities differ by at most one. There must therefore be an index $h in B \\ A$: otherwise $B subset.eq A \\ { i \, j }$ would give $\| B \| lt.eq \| A \| - 2$. On equal sufficiently small probability masses $epsilon$ of these two state-and-subset pairs, make the changes
  $ A mapsto A \\ { i } union { h } \, #h(2em) B mapsto B \\ { h } union { j } . $
  Each change occurs within its own original state and preserves that state’s total. The marginal of $h$ does not change, the marginal of $i$ decreases by $epsilon$, and that of $j$ increases by $epsilon$. The Hamming cost in (9.5) rises by at most $4 epsilon$, by the triangle inequality for symmetric difference. The discrepancy penalty falls by $20 epsilon$. Again this is a strict improvement. This argument allows the two subsets to belong to different original states and different values of the rounded parent; it does not alter their probabilities or totals.
  Thus every minimizer has $p_i = f_i$ for all $i in H$. The other coordinates are fixed integers, so the corresponding vector $X'$ has all required means. Comparison with the kernel that always keeps $A_0$ gives
  $ bb(E) parallel X' - Z parallel_1 lt.eq 10 D . $
  Combining with (9.4) proves
  $ bb(E) parallel X' - X parallel_1 lt.eq L + 10 D lt.eq \( 2 T + I \) + 10 \( 3 T + I \) = 32 T + 11 I . $
  For initialization, choose in each state $N$ any allowed subset of the required size, and minimize the same objective relative to that subset. The exchange argument still proves that the minimum has the desired means; it used only the correct mean and the two possible values of $N$. If $H$ is empty, $N = sum_i b_i$ and the sole allowed vector is $b$ itself, so no repair is needed. This proves the initialization assertion as well. ◻
]

=== 9.2 The joint rounding process <the-joint-rounding-process>

We apply Lemma 31 in a fixed order from the root toward the leaves. At an internal vertex $v$, the coordinates of its star are its ordinary children together with one extra coordinate for its park. The target vector is $\( q_i \)_(i upright(" child of ") v)$ together with $p_v^compose$, whose sum is $q_v$. The prescribed integer total is the already generated $n_v$. At a leaf simply set $c_v = n_v$.

At time zero, put $n_(upright("root")) = k$ and use the initialization assertion successively at every internal vertex. The resulting conditional means are those in (9.1), by induction over the fixed order. Consistency holds in every outcome, so summing all parks gives exactly $k$. No movement is charged for this choice of the initial simulated configuration; its mismatch from the actual starting tuple is charged once below.

Consider an update from $t - 1$ to $t$. The old rounding variables are functions of $cal(F)_(t - 1)$ and the independent rounding tape. The fractional algorithm and the requests do not depend on that tape. Therefore revealing $cal(F)_t$ preserves their conditional distribution from $cal(F)_(t - 1)$; in particular,

#[#set math.equation(numbering: n => "(9.6)")
 $ bb(E) \[ n_v \( t - 1 \) divides cal(F)_t \] = q_v \( t - 1 \) \, #h(2em) bb(E) \[ c_v \( t - 1 \) divides cal(F)_t \] = p_v^compose \( t - 1 \) . $ <eq:old-rounding-means>]

Formally, if $U$ denotes the independent rounding tape and $Z = g \( cal(F)_(t - 1) \, U \)$ is one of these variables, its conditional law given $cal(F)_t$ is obtained by integrating $g$ over the unchanged law of $U$. Its dependence on the observed data is already fixed by $cal(F)_(t - 1) subset.eq cal(F)_t$. This also shows why the additional rounding tape must not affect any of the fractional observations.

Condition now on a fractional history through time $t$. At a star $v$, use the joint law of its old child and parking counts and its newly generated parent count $n_v \( t \)$. This is a finite law determined by the known past kernels and the kernels already used above $v$ at this step. The parent count has conditional mean $q_v \( t \)$ by the top-down induction, while (9.6) supplies the old coordinate means. The lemma therefore applies even though this newly generated parent can be correlated with all the old local counts. Select a minimizing finite kernel and sample it at the actual state encountered. Subsequent stars do not change counts already assigned, so the induction gives all of (9.1) jointly.

This description defines causal kernels, rather than merely unrelated couplings at separate times. Each kernel uses the joint law conditional on the fractional history, then acts on the realized local state and parent total. It need not impose its marginal targets separately on the events specifying individual ancestor roundings. At a fixed finite horizon there are only finitely many relevant request and partition outcomes: on $Y$, a radius is needed only through the finite ball it defines, and only finitely many insertion and retirement draws are used. We can therefore choose one minimizing kernel at each relevant history without a measurable-selection issue. Choices at histories of probability zero can be arbitrary balanced continuations. The distributional policy is allowed to depend on the given law and horizon at this stage.

#thm([Proposition 9.2.])[
  (Rounding and metric realization).  #emph[Assume the fractional allocations and anchors constructed in the preceding sections, with $tau gt.eq 22$. They admit a causal rounding satisfying (9.1) for which 
#[#set math.equation(numbering: n => "(9.7)")
 $ N_(upright("rnd")) := bb(E) sum_(t = 1)^H sum_(v eq.not upright("root")) r_(\| v \| - 1) \| n_v \( t \) - n_v \( t - 1 \) \| lt.eq 132 V . $ <eq:rounding-global>]

 Placing the integer parks at their current anchors gives simulated configurations $S_t$ of exactly $k$ members containing each current request. There is a matching of consecutive configurations with expected total cost at most 
#[#set math.equation(numbering: n => "(9.8)")
 $ 120 N_(upright("rnd")) + 40 T_(upright("anchor")) . $ <eq:rounding-realization>]

 Consequently their expected movement is at most $C \( V + ell P + ell Q \) + D$ for an absolute $C$ and a finite additive term $D$ depending only on the fixed finite structure.]
] <prop:rounding>

#proof[
  We first prove the movement estimate in the tree. For an internal vertex $v$ and time $t$, define
  $ T_(v \, t) = sum_(i upright(" child of ") v) \| Delta q_i \( t \) \| + \| Delta p_v^compose \( t \) \| \, #h(2em) I_(v \, t) = bb(E) \[ \| Delta n_v \( t \) \| divides cal(F)_t \] . $
  The local lemma, conditional on $cal(F)_t$, gives
  $ bb(E) [sum_(i upright(" child of ") v) \| Delta n_i \( t \) \| + \| Delta c_v \( t \) \| thin mid(bar.v) thin cal(F)_t] lt.eq 32 T_(v \, t) + 11 I_(v \, t) . $
  Since $p_v^compose = q_v - sum_i q_i$,
  $ T_(v \, t) lt.eq 2 sum_(i upright(" child of ") v) \| Delta q_i \( t \) \| + \| Delta q_v \( t \) \| . $
  Multiply by $r_(\| v \|)$, sum over internal vertices and times, and take expectations. Every nonroot vertex occurs once as an ordinary child, and $Delta q_(upright("root")) = 0$. Thus
  #[#set math.equation(numbering: n => "(9.9)")
   $ bb(E) sum_(t \, v upright(" internal")) r_(\| v \|) T_(v \, t) lt.eq \( 2 + tau^(- 1) \) V . $ <eq:rounding-target-sum>]
  The same weighting of the parent terms gives
  #[#set math.equation(numbering: n => "(9.10)")
   $ bb(E) sum_(t \, v upright(" internal")) r_(\| v \|) I_(v \, t) lt.eq tau^(- 1) N_(upright("rnd")) \, $ <eq:rounding-parent-sum>]
  because the root count is fixed and the internal nonroot vertices are a subset of all nonroot vertices. Dropping the nonnegative parking movements from the local left-hand sides now yields the exact recurrence
  #[#set math.equation(numbering: n => "(9.11)")
   $ N_(upright("rnd")) lt.eq \( 64 + 32 \/ tau \) V + \( 11 \/ tau \) N_(upright("rnd")) . $ <eq:rounding-absorption>]
  All sums are finite. For $tau gt.eq 22$ this gives $N_(upright("rnd")) lt.eq \( 128 + 64 \/ tau \) V lt.eq 132 V$, proving (9.7). In particular, initialization of the rounding does not introduce a new additive variation term. The same absolute $tau$ can satisfy this threshold and the allocation theorem’s absorption threshold.
  We next describe the matching in the tree. Give the edge entering a nonroot vertex $v$ length $r_(\| v \| - 1)$. The consistency identities in (9.1) imply that $n_v \( t \)$ is the total number of integer parks in the subtree at $v$. First match $min { c_v \( t - 1 \) \, c_v \( t \) }$ old and new copies at every identical vertex $v$. The unmatched copies define integer supplies and demands with equal total. Starting at the leaves, cancel supplies against demands whenever they meet, and carry the uncancelled copies to the parent. At the edge entering $v$, the number of copies carried is exactly $\| Delta n_v \( t \) \|$: the signed imbalance in that subtree is $Delta n_v \( t \)$, and after cancellation all remaining copies have the same sign. The root has zero final imbalance. Following each matched pair’s path therefore gives total tree length exactly
  #[#set math.equation(numbering: n => "(9.12)")
   $ sum_(v eq.not upright("root")) r_(\| v \| - 1) \| Delta n_v \( t \) \| . $ <eq:rounding-transport-cost>]
  This also proves the lower bound for any matching, since each subtree’s net imbalance must cross its entering edge. Fixing orders for cancellations makes the chosen matching a function of the current and previous rounded states.
  Every occupied vertex has a current validity witness. Indeed $c_v \( t \) > 0$ implies $p_v^compose \( t \) > 0$, since the only balanced rounding of zero is zero. Hence $q_v \( t \) > 0$, and the allocation domination $q_v \( t \) lt.eq C_0 m_v \( t \)$ implies $m_v \( t \) > 0$. Some point of $Y$ must then have the prefix defining $v$. This is also the witness assertion of Lemma 27. At a nonroot vertex of depth $j$, its witness is within $20 r_j$ of the vertex’s current anchor, by Lemma 24.
  Consider a matched old vertex $u$ and new vertex $v$ with $u eq.not v$. Let their last common prefix be $w$ of depth $j$. If $j gt.eq 1$, choose an old witness $y_(-)$ for $u$ and a new witness $y_(+)$ for $v$. Write $a_(-) \( z \)$ and $a_(+) \( z \)$ for an anchor before and after the step, respectively. Both witnesses use the same depth-$j$ key at $w$ in the two consecutive maps. By the fixed-alphabet construction, its two anchors are either equal or related by an explicit heavy-ball reuse, and in either case
  $ d \( a_(-) \( w \) \, a_(+) \( w \) \) lt.eq 40 r_j . $
  The witnesses are within $20 r_j$ of the corresponding anchors at $w$. They are also within $20 r_(\| u \|)$ and $20 r_(\| v \|)$ of the anchors of their own endpoints. Since both endpoint radii are at most $r_j$, the triangle inequality gives
  #[#set math.equation(numbering: n => "(9.13)")
   $ d \( a_(-) \( u \) \, a_(+) \( v \) \) & lt.eq 20 r_(\| u \|) + 20 r_j + 40 r_j + 20 r_j + 20 r_(\| v \|)\
 & lt.eq 120 r_j . $ <eq:rounding-distinct-anchors>]
  The tree path between distinct endpoints passes through an edge of length $r_j$: this remains true when $w = u$ or $w = v$, since then the path starts with the edge to the next depth. Thus (9.13) is at most $120$ times this path’s tree length. If $j = 0$, both anchors belong to $Y$, so their distance is at most $"diam" \( Y \) = r_0$. Their path crosses an edge of length $r_0$, also when one endpoint is the root. The same bound follows. Only occupied vertices were used in this reasoning; no assertion about distances associated with nonexistent prefixes is needed.
  It remains to pay for the copies matched at one and the same vertex. The root anchor is fixed, so it contributes zero. For a nonroot vertex $v$ of depth $j$, put $h_v = min { c_v \( t - 1 \) \, c_v \( t \) }$. If its anchor moves while both copies are occupied, its last label is retained across the step. Only heavy labels can move in this way, and the displacement is at most $40 r_j$. Write $E_(t \, j \, lambda)$ for the event that label $lambda$ is retained and moves at this step. This event and both anchors are $cal(F)_t$-measurable. Since $h_v lt.eq c_v \( t \)$, regardless of any correlations created by the matching,
  $ bb(E) \[ h_v upright(bold(1))_(E_(t \, j \, lambda)) divides cal(F)_t \] lt.eq p_v^compose \( t \) upright(bold(1))_(E_(t \, j \, lambda)) . $
  Summing first over all depth-$j$ vertices with last label $lambda$ turns the right-hand side into $b_(t \, j \, lambda) upright(bold(1))_(E_(t \, j \, lambda))$, in the notation of Section 8. Summing over labels, levels and times pays the expected cost of all these coincident-vertex matches by $40 T_(upright("anchor"))$. Together with (9.12) and the bound for distinct vertices, this proves (9.8).
  Finally let $x$ be the current request. Its assigned leaf has $q_v gt.eq 1$ by Theorem 5, so balancedness gives $c_v = n_v gt.eq 1$. At level $J$, a point assigned to a ball key is within $20 r_J$ of that key’s center. Since $40 r_J$ is smaller than the least positive distance in $Y$, this point equals the center. A fallback key is anchored at its point as well. The anchor of the request leaf is therefore exactly $x$, and the simulated configuration serves it. The claimed final estimate now follows from (9.7), (9.8), and Proposition 28. ◻
]

=== 9.3 Uniform finite-law synthesis <uniform-finite-law-synthesis>

We can now complete the distributional statement in the setup. We give the additive accounting explicitly because its independence of the horizon is essential for the transfer in the next section.

#proof[
  Fix the finite metric $Y$, the server number $k$ and the initial tuple $s$. Choose the absolute separation factor once, sufficiently large for Theorem 5 and with $tau gt.eq 22$. Fix the scales and the finite alphabets from Lemma 24. These choices depend only on $Y \, k$ and the absolute construction parameters. For a given finite-support input law at a finite horizon, choose its hidden optimal trajectory and carry out the partition, allocation, anchor and rounding constructions. Their interfaces give absolute constants $C_P \, C_A \, C_T$ and finite remainders $D_P \, D_A \, D_T$ such that
  #[#set math.equation(numbering: n => "(9.14)")
   $ P & lt.eq C_P ell Q + D_P \, &  & upright("by Proposition ") upright("7.1") \,\
V & lt.eq C_A ell P + D_A \, &  & upright("by Theorem ") upright("3.1") \,\
T_(upright("anchor")) & lt.eq C_T \( V + ell P + ell Q \) + D_T \, &  & upright("by Proposition ") upright("8.2") . $ <eq:rounding-budget-summary>]
  In particular the conditional laws used by the allocation are those of the hidden members under the final online map. Filtering keeps the old map with the old hidden variable, and drift uses the coupled old and new maps, exactly as required by the first two estimates. Rounding neither changes those observations nor supplies information to the partition rules.
  Here is a census of the fixed objects and their possible endpoint charges in (9.14). Let $cal(T)$ be the full finite prefix tree, let $d_v$ be the number of children of an internal vertex, and let $L_j$ be the number of label slots at level $j$. These numbers can be large. They are fixed before the law and horizon are chosen.
  + At each fixed vertex and rank, the elementary tracking potential is $p \( 1 - p \) + \( p - p^compose \)^2 in \[ 0 \, 1 \]$. There are finitely many such rank, flag and endpoint-function trackers, indexed by the $k$ ranks of the fixed vertices, with the fixed finite number of versions used in the allocation construction. Their tolerances, including the tolerances of order $1 \/ ell$, have already been fixed. The resulting initialization and endpoint charges are finite functions of $k$ and the vertex index, rather than of a trajectory’s number of resets.
    At an internal vertex, the sizes, core sums and cap scales are bounded by fixed multiples of $k$. The proportion variables have the fixed simplex or bounded-$ell_1$ domains used in their definitions. The primitive bounds in Section 4 therefore bound the absolute values of both proportion potentials by a finite quantity, for example $C ell k \( d_v + 1 \)$ after increasing an absolute constant. The switching potential is bounded by $C k$. Initial size and epoch charges likewise involve only these bounded sizes. Multiplying these finitely many bounds by their fixed star weights $r_(\| v \|)$ and by the fixed coefficients in the local estimates gives a finite common choice of $D_A$.
  + At scale $r_j$, each pilot potential lies in $\[ 0 \, 2 r_j k \]$. There is one heavy template and a finite number of tier templates, the latter with their fixed weights $e^(- h)$. The heavy distance-ramp and the tier noncoverage potentials lie in $\[ 0 \, r_j k \]$ for each template. Their initial and terminal contributions are bounded by the corresponding finite sums of $2 r_j k$ and $r_j k$ over levels and tiers, with the fixed coefficients from Section 7. Hence $D_P$ can be chosen uniformly.
  + Each held key size in Section 8 is in $\[ 1 \, k + 1 \]$. The affine tangent potential to $- s log s$, evaluated at an argument and reference in that interval, has absolute value at most $C \( k + 1 \) ell$. The normalized travel potential for a level-$j$ label is nonnegative and at most $C r_j k$, because its parked-mass coefficient $b \/ hat(m)$ is bounded by an absolute constant and its counting integral is at most $k$. The sums
    $ sum_(j = 1)^J L_j r_j \( k + 1 \) ell quad upright("and") quad sum_(j = 1)^J L_j r_j k $
    therefore bound all relevant endpoint terms up to fixed coefficients. They give a finite common choice of $D_T$, including its size-tracker initialization charges.
  + The rounding process has no additional variation remainder, by (9.7). Its initial configuration $S_0$ is a multiset of $k$ points in $Y$. Consequently the initial minimum matching distance from $s$ to $S_0$ is at most $k "diam" \( Y \)$, for every rounding outcome.
  This list uses persistent state at every fixed slot. A rank or key tracker continues through absence and later reappearance of its label; no new initialization allowance is charged when a slot is reused. Epoch changes and normalization refreshes are paid transitions in the preceding estimates. The alphabets have bounded size because each tier and scale has at most $\| Y \| K^2$ relevant roster entries, with fixed additional slots for the label exclusion rule. Fresh random draws at successive insertions do not create fresh tree vertices or fresh potentials. Thus the finite endpoint bounds above hold uniformly over all possible histories, and are summed over slots and templates once. The number of histories, the number of label reuses and the horizon do not enter $D_P \, D_A \, D_T$.
  To make the final combination explicit, put
  $ C_1 = 120 dot.op 132 + 40 C_T \, #h(2em) C_2 = 40 C_T \, #h(2em) C_(*) = C_1 C_A + C_2 . $
  Proposition 32 and (9.14) give
  $ bb(E) \[ upright("simulated movement") \] & lt.eq C_1 V + C_2 ell P + C_2 ell Q + 40 D_T\
 & lt.eq C_(*) ell P + C_2 ell Q + C_1 D_A + 40 D_T\
 & lt.eq \( C_(*) C_P + C_2 \) ell^2 Q + C_(*) ell D_P + C_1 D_A + 40 D_T \, $
  where $ell gt.eq 1$ was used in the last line. Apply Lemma 2 from the actual labeled tuple $s$. It yields a causal strongly lazy policy serving the same requests, with expected cost at most this simulated movement plus the initial matching mismatch. Thus Proposition 3 holds with the absolute constant
  $ a = C_(*) C_P + C_2 $
  and, for example, the finite nonnegative constant
  #[#set math.equation(numbering: n => "(9.15)")
   $ D_0 = C_(*) ell D_P + C_1 D_A + 40 D_T + k "diam" \( Y \) . $ <eq:rounding-finite-additive>]
  All three remainders can be enlarged to nonnegative uniform bounds from the census above. Formula (9.15) consequently depends only on the fixed metric, $k$, the start and the fixed construction; it is independent of the input law and horizon. Repeated starting positions cause no change, since both simulated configurations and the matching simulation treat repeated points as separate copies. ◻
]

== 10 One policy on an arbitrary metric space <sec:transfer>

Proposition 3 produces a policy for each input law on a fixed finite metric. We now remove that dependence in three steps. First, repeated independent episodes remove the additive term when the starting points are distinct. A finite separation argument then gives one policy for any finite collection of inputs. Finally, product compactness gives one policy for all finite inputs, even when the metric space is infinite. We spell out the finite separation argument and the closed constraints used in compactness.

Throughout this section, let $a$ be the absolute constant in Proposition 3, and put

#[#set math.equation(numbering: n => "(10.1)")
 $ ell = 1 + log \( k + 1 \) \, #h(2em) c_(upright("tr")) = 2 a + 1 \, #h(2em) alpha = c_(upright("tr")) ell^2 . $ <eq:transfer-alpha>]

We may enlarge the additive constant of that proposition to ensure $D_0 \( Y \, k \, s \) gt.eq 0$. Its independence of the input law and horizon is essential below.

=== 10.1 Removing the finite-metric additive constant <removing-the-finite-metric-additive-constant>

#thm([Lemma 10.1.])[
  (Episode amplification).  #emph[Let $Y$ be a finite metric space, let $k gt.eq 2$, and let $s = \( s_1 \, dots.h \, s_k \) in Y^k$ have distinct entries. For every finite-support probability law $lambda$ on finite request sequences in $Y$, there is a causal randomized policy $A_lambda$ starting from $s$ such that 
#[#set math.equation(numbering: n => "(10.2)")
 $ bb(E)_(sigma tilde.op lambda) bb(E) #scale(x: 120%, y: 120%)[\[] "cost"_(A_lambda \, s) \( sigma \) #scale(x: 120%, y: 120%)[\]] lt.eq alpha thin bb(E)_(sigma tilde.op lambda) #scale(x: 120%, y: 120%)[\[] "OPT"_s \( sigma \) #scale(x: 120%, y: 120%)[\]] . $ <eq:additive-free-law>]

 The policy can be strongly lazy. The constant $c_(upright("tr"))$ in (10.1) is the same for all $Y$, $s$, and $lambda$.]
] <lem:amplification>

#proof[
  Write $Q = bb(E)_lambda "OPT"_s \( sigma \)$. We first make the episode length deterministic without changing $Q$. Let
  $ L = max #scale(x: 120%, y: 120%)[\(] 1 \, max_(sigma in "supp" lambda) \| sigma \| #scale(x: 120%, y: 120%)[\)] . $
  Extend each nonempty sequence to length $L$ by repeating its last request; extend an empty sequence by $L$ repetitions of $s_1$. Denote the resulting law on $Y^L$ by $macron(lambda)$. For every original sequence $sigma$ and its extension $macron(sigma)$,
  #[#set math.equation(numbering: n => "(10.3)")
   $ "OPT"_s \( macron(sigma) \) = "OPT"_s \( sigma \) . $ <eq:padding-optimum>]
  Indeed, restriction of any service of $macron(sigma)$ to its original prefix gives the lower bound. An optimal service of a nonempty $sigma$ ends with a server at its last request and can serve the extension at zero extra cost. An empty sequence and its extension both have optimum zero. A causal policy designed for $L$ requests can be run on the original sequence and stopped when that sequence ends; its actions on this prefix are identical to its actions on the extension. Thus it is enough to prove the claim for $macron(lambda)$ and then truncate. The policy need not be told the actual stopping time in advance.
  If $Q = 0$, every sequence of positive probability has optimum zero. An optimum is attained because there are only $k^L$ possible strings of server labels. A zero-cost service cannot move any server to a different point, so every request lies among $s_1 \, dots.h \, s_k$. Any strongly lazy policy therefore has zero cost on the law, proving (10.2). We henceforth assume $Q > 0$.
  Set
  $ Delta = "diam" \( Y \) \, #h(2em) delta = min { d \( y \, z \) : y \, z in Y \, med y eq.not z } > 0 \, #h(2em) R = ⌊frac(k Delta, delta)⌋ + 1 . $
  The distinct starting points ensure $Delta > 0$. The reset word is $R$ consecutive copies of $\( s_1 \, dots.h \, s_k \)$, of length $R k$. For every $rho = \( x_1 \, dots.h \, x_L \) in "supp" macron(lambda)$, choose one optimal labeled service from $s$, resolving ties by the lexicographic order of its chosen server labels. Write $C_t \( rho \) in Y^k$ for its configuration after request $t$, and $j_t \( rho \)$ for its chosen label. Here $C_0 \( rho \) = s$; a label is designated even when the move is zero. Define its reverse word to be
  #[#set math.equation(numbering: n => "(10.4)")
   $ rho^arrow.l = #scale(x: 120%, y: 120%)[\(] C_(L - 1 \, j_L) \( rho \) \, C_(L - 2 \, j_(L - 1)) \( rho \) \, dots.h \, C_(0 \, j_1) \( rho \) #scale(x: 120%, y: 120%)[\)] . $ <eq:reverse-word>]
  Starting at $C_L \( rho \)$, this word can be served by moving labels $j_L \, j_(L - 1) \, dots.h \, j_1$ in that order. Before undoing step $t$ the configuration is exactly $C_t \( rho \)$, and its designated move returns it to $C_(t - 1) \( rho \)$. This verifies legality and returns the labeled tuple exactly to $s$, at total cost $"OPT"_s \( rho \)$. The assertion also covers zero moves. The reset word then has zero comparator cost.
  Fix an integer $N gt.eq 1$. Sample $N$ independent words $rho_1 \, dots.h \, rho_N$ from $macron(lambda)$, and concatenate, for each $i$, its forward word $rho_i$, its reverse word $rho_i^arrow.l$, and the reset word. This is a finite-support law on words of the fixed length $N \( 2 L + R k \)$. All its requests are functions of the sampled forward words and the fixed optimal services; in particular, the law is fixed independently of the online policy’s randomness. Following the chosen optimal service and then its reverse in every episode gives
  #[#set math.equation(numbering: n => "(10.5)")
   $ bb(E) "OPT"_s \( upright("concatenated experiment") \) lt.eq 2 N Q . $ <eq:episode-comparator>]
  Proposition 3, followed if necessary by Lemma 2 with zero initial mismatch, gives a strongly lazy causal policy $cal(A)_N$ for this experiment with
  #[#set math.equation(numbering: n => "(10.6)")
   $ bb(E) "cost"_(cal(A)_N \, s) \( upright("experiment") \) lt.eq 2 a ell^2 N Q + D_0 \( Y \, k \, s \) . $ <eq:episode-total>]
  As usual, specify arbitrary causal strongly lazy continuation rules at histories having probability zero under the experiment law.
  Let $F_i$, $H_i$, and $Z_i$ be the costs of $cal(A)_N$ during the forward word, reverse word, and reset word of episode $i$, respectively. Let $A_i$ be its configuration at the end of that reset word, and define
  $ M_i = sans(M) \( A_i \, s \) \, #h(2em) M_0 = 0 . $
  We claim, pathwise, that
  #[#set math.equation(numbering: n => "(10.7)")
   $ M_i lt.eq Z_i #h(2em) \( 1 lt.eq i lt.eq N \) . $ <eq:reset-mismatch>]
  If a complete reset cycle has zero movement, the configuration stays constant throughout that cycle and covers every one of the $k$ distinct points $s_1 \, dots.h \, s_k$. Since there are exactly $k$ servers, its multiset of positions is the starting multiset. Strong laziness keeps this multiset fixed throughout all remaining reset cycles. Consequently, if $M_i > 0$, every reset cycle contains a positive move. Each such move has length at least $delta$, because all positions are in $Y$. Therefore
  $ Z_i gt.eq R delta > k Delta gt.eq sans(M) \( A_i \, s \) = M_i . $
  If $M_i = 0$, (10.7) follows from nonnegativity. The argument requires equality only of multisets, not of the labels occupying the distinct starting points.
  We extract a policy for one forward word. Before receiving any actual requests, choose $I$ uniformly from ${ 1 \, dots.h \, N }$. Conditional on $I = i$, generate $i - 1$ fictitious independent forward words from $macron(lambda)$, together with their fixed reverse and reset words. Using fresh internal randomness independent of these words, simulate $cal(A)_N$ from $s$ through that entire fictitious prefix. This produces its internal state and a virtual configuration at the start of forward episode $i$. For each actual request, now give that request to the virtual policy as its next request. Follow its virtual configurations from the real initial tuple $s$ by the strongly lazy simulation in Lemma 2.
  This defines a causal policy: the fictitious prefix is internal randomness independent of the actual input, the boundary of episode $i$ is known from $i$, $L$, and $R$, and the virtual continuation uses only the actual requests already received. Neither the remainder of the actual word nor its reverse word needs to be generated. After $L$ actual requests, an arbitrary strongly lazy rule extends this policy to all longer inputs.
  When the actual forward word is sampled from $macron(lambda)$, conditional on $I = i$, the virtual evolution through that word has the same law as the evolution of $cal(A)_N$ through forward episode $i$ in the experiment. The true simulation starts with mismatch $M_(i - 1)$ under this identification, where $M_0 = 0$ for $i = 1$. Lemma 2 and (10.7) give
  #[#set math.equation(numbering: n => "(10.8)")
   $ bb(E) "cost"_(upright("extracted") \, s) \( rho \) & lt.eq 1 / N sum_(i = 1)^N bb(E) \( F_i + M_(i - 1) \)\
 & lt.eq 1 / N (sum_(i = 1)^N bb(E) F_i + sum_(i = 1)^(N - 1) bb(E) Z_i)\
 & lt.eq 1 / N bb(E) "cost"_(cal(A)_N \, s) \( upright("experiment") \)\
 & lt.eq 2 a ell^2 Q + frac(D_0 \( Y \, k \, s \), N) . $ <eq:finite-n-amplification>]
  In the third line, the charged forward and preceding reset blocks are disjoint parts of the experiment; reverse-block costs and the last reset-block cost are nonnegative uncharged terms. Truncating to an original unpadded sequence can only reduce this expected cost.
  Finally take
  $ N = max (1 \, ⌈frac(D_0 \( Y \, k \, s \), ell^2 Q)⌉) . $
  Then (10.8) is at most $\( 2 a + 1 \) ell^2 Q$, as asserted. This is a finite choice of $N$ for the given law; no limiting policy is used here. The metric-dependent numbers $R$ and $N$ affect only the auxiliary experiment and not the coefficient in (10.2). ◻
]

=== 10.2 A single policy for a finite collection of inputs <a-single-policy-for-a-finite-collection-of-inputs>

For this and the next subsection fix an arbitrary metric space $X$ and a distinct starting tuple $s in X^k$. Write $\[ k \] = { 1 \, dots.h \, k }$. A decision history at time $t$ consists of the request prefix $\( x_1 \, dots.h \, x_t \)$ and the previously chosen server labels $\( j_1 \, dots.h \, j_(t - 1) \)$. These data determine the current labeled configuration. A behavioral policy assigns a probability vector on $\[ k \]$ to every such history and samples its next label from that vector. It has no horizon parameter.

#thm([Lemma 10.2.])[
  (Finite separation and behavioral conversion).  #emph[For every finite collection $sigma_1 \, dots.h \, sigma_m$ of finite request sequences in $X$, there is a behavioral policy $p$ from $s$ satisfying 
#[#set math.equation(numbering: n => "(10.9)")
 $ bb(E) "cost"_(p \, s) \( sigma_i \) lt.eq alpha "OPT"_s \( sigma_i \) #h(2em) \( 1 lt.eq i lt.eq m \) . $ <eq:finite-family-bound>]

 Its behavioral choices can be defined on all decision histories in $X$.]
] <lem:finite-minimax>

#proof[
  There is nothing to prove for an empty collection. Otherwise let $Y$ be the finite submetric containing all starting points and all points appearing in the sequences. It has positive diameter. Every server position during a legal service is an initial position or a previously requested point: each permitted move is to the current request. Therefore passing from $X$ to $Y$ changes neither the legal label strings nor their costs, and
  #[#set math.equation(numbering: n => "(10.10)")
   $ "OPT"_(Y \, s) \( sigma_i \) = "OPT"_(X \, s) \( sigma_i \) . $ <eq:finite-restriction-optimum>]
  Let $cal(H)_0$ be the finite set of decision histories whose request prefix is a nonempty prefix of some $sigma_i$, with every possible previous label string included. This is the finite distributional minimax principle associated with Yao #cite(label("Yao77")), applied to excess cost. A deterministic policy on this set is a map $pi : cal(H)_0 arrow.r \[ k \]$. There are finitely many such maps; write their set as $cal(D)$. For each $pi in cal(D)$, put
  $ v \( pi \)_i = "cost"_(pi \, s) \( sigma_i \) - alpha "OPT"_s \( sigma_i \) \, #h(2em) K = {sum_(pi in cal(D)) theta_pi v \( pi \) : theta_pi gt.eq 0 \, med sum_(pi in cal(D)) theta_pi = 1} . $
  The set $K subset.eq bb(R)^m$ is compact, being the continuous image of a finite-dimensional compact simplex, and is convex.
  We claim $K ∩ \( - bb(R)_(gt.eq 0)^m \) eq.not diameter$. If not, minimize the continuous function
  $ f \( z \) = sum_(i = 1)^m max \( z_i \, 0 \)^2 $
  over $K$, and let $z_(*)$ be a minimizer. Put $w_i = max \( \( z_(*) \)_i \, 0 \)$. The supposed disjointness implies $w eq.not 0$. For every $z in K$ the segment $z_(*) + t \( z - z_(*) \)$, $0 lt.eq t lt.eq 1$, lies in $K$. The right derivative of $f$ along this segment at $t = 0$ is nonnegative. Since the scalar function $u mapsto max \( u \, 0 \)^2$ is differentiable, including at zero, this says
  $ 2 w dot.op \( z - z_(*) \) gt.eq 0 . $
  It follows that
  #[#set math.equation(numbering: n => "(10.11)")
   $ w dot.op z gt.eq w dot.op z_(*) = sum_i w_i^2 > 0 #h(2em) \( z in K \) . $ <eq:finite-separation>]
  Normalize $w$ to the probability weights $lambda_i = w_i \/ \( sum_j w_j \)$ on the target sequences. Lemma 33, applied on $Y$, supplies a randomized causal policy with nonpositive expected excess cost for this law.
  Every randomized causal policy, restricted to this finite history set, has its vector of expected excess costs in $K$. To see this directly, fix its internal random tape, independent of requests. Run the fixed tape on each of the finitely many request prefixes. This determines a deterministic rule at histories compatible with those runs; assign arbitrary choices at incompatible histories. The resulting member of $cal(D)$ reproduces its actions on every $sigma_i$. There are only finitely many possible rules, so their probabilities form a convex combination of the vectors $v \( pi \)$. Each event defining such a rule is a finite combination of events for choices on fixed finite inputs and is measurable. Consequently the expected excess for the law with weights $lambda_i$ is strictly positive by (10.11), a contradiction. This proves the claim. Choose weights $theta_pi$ whose convex combination lies in the nonpositive orthant. Sampling $pi$ with these weights at the start would give (10.9).
  For later compactness we convert this finite mixture to behavioral choices, without placing any law on requests. This is the perfect-recall conversion of mixed to behavioral strategies #cite(label("Kuhn53")); the formula below makes its request-independent meaning explicit. At a history $h = \( \( x_1 \, dots.h \, x_t \) \, \( j_1 \, dots.h \, j_(t - 1) \) \) in cal(H)_0$, let
  $ cal(D) \( h \) = { pi in cal(D) : pi \( \( x_1 \, dots.h \, x_u \) \, \( j_1 \, dots.h \, j_(u - 1) \) \) = j_u upright(" for every ") u < t } \, #h(2em) Z \( h \) = sum_(pi in cal(D) \( h \)) theta_pi . $
  If $Z \( h \) > 0$, define
  #[#set math.equation(numbering: n => "(10.12)")
   $ p_h \( j \) = frac(sum_(pi in cal(D) \( h \)\
pi \( h \) = j) theta_pi, Z \( h \)) #h(2em) \( j in \[ k \] \) . $ <eq:behavioral-conversion>]
  If $Z \( h \) = 0$, choose any probability vector, for example one concentrated on label $1$. Induction along a fixed request sequence shows that the probability of each label prefix under these choices is the total $theta$-weight of policies consistent with that prefix. Indeed, when this weight is positive the next factor in (10.12) is exactly the ratio of the extended prefix weight to the old weight; when it is zero the prefix is unreachable. Thus the complete label strings, and therefore their costs, have the same law as in the original mixture on each $sigma_i$. Set $p_h$ arbitrarily at histories outside $cal(H)_0$ to obtain the asserted policy on all of $X$. Formula (10.12) conditions only on consistency of past choices along a specified request prefix, not on an assumed distribution of requests. ◻
]

=== 10.3 Compactness over all finite histories <compactness-over-all-finite-histories>

#thm([Lemma 10.3.])[
  (One policy for all finite inputs).  #emph[For every metric space $X$ and every distinct tuple $s in X^k$, there is a single randomized causal policy $A_s$ such that 
#[#set math.equation(numbering: n => "(10.13)")
 $ bb(E) "cost"_(A_s \, s) \( sigma \) lt.eq alpha "OPT"_s \( sigma \) #h(2em) upright("for every finite request sequence ") sigma upright(" in ") X . $ <eq:all-inputs-distinct>]

 For each fixed input its decisions and cost are measurable functions of its internal randomness. Neither its rule nor its randomization depends on an eventual horizon.]
] <lem:compact-policy>

#proof[
  The set of all decision histories is
  $ cal(H) = union.big_(t gt.eq 1) #scale(x: 120%, y: 120%)[\(] X^t times \[ k \]^(t - 1) #scale(x: 120%, y: 120%)[\)] . $
  Let
  $ Delta_k = { \( p \( 1 \) \, dots.h \, p \( k \) \) in \[ 0 \, 1 \]^k : sum_(j = 1)^k p \( j \) = 1 } \, #h(2em) cal(P) = product_(h in cal(H)) Delta_k . $
  Thus a point of $cal(P)$ specifies a behavioral policy at all histories. Each factor $Delta_k$ is compact, so Tychonoff’s theorem makes $cal(P)$ compact in the product topology #cite(label("Kelley55")) Chapter 5, Theorem 13; see also #cite(label("Tychonoff35")). This application uses the usual set-theoretic choice principle and permits an arbitrary index set $cal(H)$.
  First record the exact dependence of a fixed-input expected cost on these coordinates. For $sigma = \( x_1 \, dots.h \, x_m \)$ and a label string $j = \( j_1 \, dots.h \, j_m \) in \[ k \]^m$, let $c_s \( sigma \, j \)$ be its deterministic service cost from $s$. Explicitly, begin with the tuple $s$, replace coordinate $j_t$ by $x_t$ at step $t$, and sum the distances replaced. These costs are finite, even when $X$ is unbounded, since a fixed input and the starting tuple contain only finitely many points. For $p in cal(P)$ the expected cost is
  #[#set math.equation(numbering: n => "(10.14)")
   $ C_sigma \( p \) = sum_(j in \[ k \]^m) c_s \( sigma \, j \) product_(t = 1)^m p_(\( \( x_1 \, dots.h \, x_t \) \, \( j_1 \, dots.h \, j_(t - 1) \) \)) \( j_t \) . $ <eq:cost-polynomial>]
  For the empty sequence this is zero. For any fixed nonempty sequence, it is a polynomial in finitely many coordinates of $p$, hence a continuous function of those coordinates. Consequently the constraint
  #[#set math.equation(numbering: n => "(10.15)")
   $ C_sigma \( p \) lt.eq alpha "OPT"_s \( sigma \) $ <eq:closed-cost-constraint>]
  is closed in those finitely many factors.
  For each finite input $sigma$, let
  $ E_sigma = { p in cal(P) : C_sigma \( p \) lt.eq alpha "OPT"_s \( sigma \) } . $
  These sets are closed by the finite-coordinate continuity just proved. Every finite subcollection has nonempty intersection by Lemma 34: that lemma supplies a behavioral policy defined on all histories which satisfies all the selected constraints. The finite-intersection property in the compact space $cal(P)$ therefore gives
  $ ⋂_sigma E_sigma eq.not diameter . $
  Choose $p$ in this intersection. No bound on the diameter or cardinality of $X$ enters this argument. Boundedness is needed only for the cost of one fixed finite input, which was established before Equation (10.14).
  It remains to realize these choices as one randomized online policy. At each request use the current history $h$ and choose the next label with probabilities $p_h \( 1 \) \, dots.h \, p_h \( k \)$. For example, take independent uniform random numbers in $\[ 0 \, 1 \)$ and choose the first label whose cumulative probability exceeds the next number. Only the revealed request prefix and past labels enter this rule. One can also implement all times on the single probability space $\[ 0 \, 1 \)$ with Lebesgue measure: subdivide its current interval into half-open pieces with relative lengths $p_h \( 1 \) \, dots.h \, p_h \( k \)$, choose the piece containing the initial uniform point, and continue within that piece. Pieces of length zero are empty. On a fixed finite input, the set of seeds giving any specified label prefix is an interval whose length is the product of the corresponding probabilities. Therefore each label choice and the finite total cost are measurable, and their expectation is precisely (10.14).
  In particular, the policy is defined for every history before any input or horizon is chosen. Measurability here is exactly that required for each fixed oblivious input; no probability distribution on the request space, or joint measurability in a random request variable, enters the construction. The inequalities already proved for $p$ give (10.13). ◻
]

=== 10.4 Repeated starting positions and the final bound <repeated-starting-positions-and-the-final-bound>

#proof[
  Fix $k gt.eq 2$, a metric space $\( X \, d \)$ with at least $k + 1$ points, and any labeled starting tuple $s in X^k$, allowing repetitions. Choose a tuple $u in X^k$ of distinct points, and put
  #[#set math.equation(numbering: n => "(10.16)")
   $ D = sans(M) \( s \, u \) = min_(pi upright(" a permutation of ") \[ k \]) sum_(i = 1)^k d \( s_i \, u_(pi \( i \)) \) . $ <eq:initial-matching-distance>]
  Such a tuple exists by the cardinality assumption. The number $D$ is finite, even in an unbounded metric, since it is the minimum of finitely many finite sums.
  For every finite input $sigma$, choose an optimal legal trajectory from $s$. Its existence follows from the finitely many label strings for that input. Apply Lemma 2 to follow this trajectory from the initial tuple $u$. This gives a legal service from $u$ of cost at most $"OPT"_s \( sigma \) + D$. This use of the lemma is a pathwise comparison of offline services and does not require computing that trajectory online. Consequently
  #[#set math.equation(numbering: n => "(10.17)")
   $ "OPT"_u \( sigma \) lt.eq "OPT"_s \( sigma \) + D . $ <eq:offline-start-comparison>]
  By Lemma 35, one online policy $A_u$ from $u$ satisfies (10.13) for every finite input. Run this policy virtually, and follow its configurations from $s$ by Lemma 2. The resulting policy $A$ is causal and can be strongly lazy. Minimum matchings can be selected by a fixed order on the finite set of label permutations, so this simulation also preserves measurability on each fixed input. Pathwise it adds at most $D$ to the virtual cost, and therefore
  #[#set math.equation(numbering: n => "(10.18)")
   $ bb(E) "cost"_(A \, s) \( sigma \) & lt.eq bb(E) "cost"_(A_u \, u) \( sigma \) + D\
 & lt.eq alpha "OPT"_u \( sigma \) + D\
 & lt.eq alpha "OPT"_s \( sigma \) + \( alpha + 1 \) D . $ <eq:repeated-start-bound>]
  The explicit additive constant
  #[#set math.equation(numbering: n => "(10.19)")
   $ B = #scale(x: 120%, y: 120%)[\(] \( 2 a + 1 \) \( 1 + log \( k + 1 \) \)^2 + 1 #scale(x: 120%, y: 120%)[\)] sans(M) \( s \, u \) $ <eq:final-additive-constant>]
  depends only on the metric, $k$, and the fixed choices of starting tuples. It is independent of the input and its length. When $s$ already has distinct entries we may take $u = s$, giving $D = B = 0$.
  Finally, for $k gt.eq 2$ we have $log \( k + 1 \) gt.eq log 3 > 1$ and hence
  $ \( 1 + log \( k + 1 \) \)^2 lt.eq 4 \( log \( k + 1 \) \)^2 . $
  Thus (10.18) proves the theorem with the single absolute constant $C = 4 \( 2 a + 1 \)$ and the finite $B$ in (10.19). All policy choices were fixed for the specified metric and initial tuple, so the same policy serves every finite sequence and every horizon. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
