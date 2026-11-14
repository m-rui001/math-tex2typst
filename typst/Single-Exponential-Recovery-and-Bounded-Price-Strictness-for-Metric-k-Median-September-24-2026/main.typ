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

#align(center)[#text(size: 16pt, weight: "bold")[Single-exponential recovery and bounded-price strictness \
for metric $k$-median]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <main:introduction>

Metric $k$-median asks for a small set of facilities serving a finite set of clients.
  The input consists of finite sets $D$ of clients and $F$ of available facilities,
  distances given by a finite rational metric on their locations, and a positive integer $k$.
  For a nonempty $S subset.eq F$ set

$ "cost" \( S \) = sum_(p in D) d \( p \, S \) \, wide d \( p \, S \) = min_(s in S) d \( p \, s \) \, wide
  "opt"_k = min_(1 lt.eq \| S \| lt.eq k) "cost" \( S \) . $

A feasible solution opens at most $k$ facilities. Clients and candidate facilities are specified separately;
  they may share locations. We write $n = \| D \|$ and $N = \| D \| + \| F \|$.

This paper develops two tools for respecting that budget.
  The first recovers a good solution from an anchor that represents all but a small number of comparison clusters
  accurately. Its running time is single-exponential in the number of exceptions,
  making logarithmically many exceptions tractable. The second gives an elementary proof of bounded-price
  strictness for one fixed execution of a facility-opening process.
  The recovery and execution arguments combine into a randomized approximation below $2$ on arbitrary finite
  rational metrics.

=== 1.1 Recovery from an anchor <recovery-from-an-anchor>

Fix a comparison solution $O subset.eq F$ of size $h$ and cost $P > 0$.
  Assign every client to a nearest member of $O$, using fixed priorities for ties,
  and write $C_i$ for the clients assigned to $i in O$ and $P_i = sum_(p in C_i) d \( p \, i \)$.
  Clusters may be empty. An #emph[anchor] is a supplied feasible set $S subset.eq F$ of the same size $h$.
  Partition $O$ into good and bad centers. For each good center $i$,
  a #emph[proxy] is a facility $phi.alt_i in S$, with the proxies pairwise distinct.
  Put $P_g = sum_(i upright(" good")) P_i$. The recovery promise bounds the total proxy-assignment cost by $P_g +
  mu P$, where $mu$ is a fixed accuracy parameter. The comparison solution,
  its partition and the proxy map certify this promise; the algorithm is not given any of them.

The precise recovery theorem uses a normalized representation:
  clients and facilities have disjoint indices, distances between distinct indices are positive integers,
  and their maximum is bounded by a fixed polynomial in $N$.
  The fixed polynomial and accuracy parameters may affect the running-time degree.

#thm([Theorem 1.1.])[
  (Refined recovery).  #emph[Let $D$ and $F$ be disjoint indexed sets in a metric whose distances between distinct
    indices are positive integers bounded by a fixed polynomial in $N = \| D \| + \| F \|$.
    Fix $epsilon > 0$ and $0 < L_0 < oo$, and choose a fixed rational parameter
$ 0 < mu lt.eq min { 1 \/ 4 \, epsilon \/ 12 } . $

 Let $S subset.eq F$ have cardinality $h gt.eq 1$. Suppose there exists a comparison solution $O subset.eq
   F$ of cardinality $h$ and cost $P > 0$, with a partition into good and bad centers and distinct proxies
   $phi.alt_i in S$ for the good centers, such that
#[#set math.equation(numbering: n => "(1.1)")
 $ sum_(i med upright("good")) sum_(p in C_i) d \( p \, phi.alt_i \) lt.eq P_g + mu P \, wide m := \| { i : i med
   upright("bad") } \| lt.eq L_0 log N . $ <ref:proxy-hypothesis>]

 Given $S$, $mu$, $L_0$, and a failure parameter $zeta in \( 0 \, 1 \)$,
   a randomized algorithm returns $hat(S) subset.eq F$ with
$ \| hat(S) \| lt.eq h quad upright("always") \, wide "cost" \( hat(S) \) lt.eq \( 1 + 2 \/ e + epsilon \) P quad
  upright("with probability at least ") 1 - zeta . $

 Its running time is polynomial in $N$ and $log \( 1 \/ zeta \)$ for the fixed parameters.
   The algorithm is not given $O$, $P$, the partition, or its proxies.]
] <ref:recovery>

The running time is single-exponential in the allowed number of bad centers.
  In particular, Theorem 17 gives factor $1.97$ with proxy error $P \/ 100$ and at most $M_0$ bad centers in time

$ exp \( O \( M_0 \) \) "poly" \( N \) log \( 2 \/ zeta \) . $

Local optimality of the anchor is not part of either recovery promise.
  Section 3 proves one way to produce such proxies from local optimality and separation.
  Declaring all centers bad also gives the promise when $h = O \( log N \)$.

The normalized promise matters. Theorem 1 does not assert that the proxies of an arbitrary original metric retain
  their accuracy after distances are capped and rounded. The general-metric application below instead constructs
  its anchors #emph[after] normalization and proves a separate transfer of the final cost bound.

=== 1.2 A compatible execution and its global application <a-compatible-execution-and-its-global-application>

The other tool concerns client budgets produced by the logarithmic-surplus construction of Cohen-Addad, Grandoni,
  Lee, Schwiegelshohn and Svensson #cite(label("CGLSS2026")).
  At target cardinality $h$, that construction uses $h$ paid regular facilities and $O \( log N \)$ free copies,
  apart from a small-price endpoint handled separately. A free copy is a labeled leaf attached to an available
  facility. Replacing each copy by its underlying facility produces a real solution without increasing connection cost.

The analysis must use one final price, one set of final copy lengths, and the budgets of one actual replay.
  Let $lambda$ be its regular opening payment and $alpha_p$ the final budget of client $p$.
  For a client set $C$ served by a comparison facility $i$, put $P_C = sum_(p in C) d \( i \, p \)$.
  The usual dual comparison charges at most $lambda + 2 P_C$ to this set.
  Lemma 22 proves that, for each fixed $T > 0$, the condition $lambda lt.eq T P_C$ improves this to

$ sum_(p in C) alpha_p lt.eq lambda + \( 2 - c \( T \) \/ 2 \) P_C \, wide c \( T \) > 0 \, $

with constants and execution hypotheses stated there. Crucially,
  the entire opening payment $lambda$ remains available. Summing such inequalities can therefore improve
  connection cost while still paying for all $h$ regular openings.

Bounded-price strictness itself is established prior work.
  The factor-revealing analysis of Cohen-Addad, Grandoni, Lee and Schwiegelshohn #cite(label("CGLS2026"))
  Appendix B gives a stronger numerical gap, and its finite dual also applies when the phase variables are not
  ordered and the first-connection constraint is omitted. Our suffix-maximum and complementary-slack argument is
  an alternative self-contained proof. Its role here is to connect that phenomenon to the final valid-sequence
  replay, including free openings, witness supersets and simultaneous phase updates.
  Section 7 proves the local replay guarantees and supplies the free-opening case needed in the final-dual argument.

The two tools give the following application on the original input metric.
  Its factor is an absolute constant; its significance here is the way the recovery and payment arguments enforce
  the budget together. The separate companion #emph[The approximation threshold for metric $k$-median]
  #cite(label("OpenAIThreshold2026")) Theorem 1.1 proves a deterministic $\( 1 + 2 \/ e + epsilon \)$
  approximation for every fixed $epsilon > 0$ on this general facility model.
  The recovery, execution and global application proofs below are independent of that graph-rounding argument.

#thm([Theorem 1.2.])[
  (Global application).  #emph[There is an absolute constant $sigma > 0$ with the following property.
    For every fixed $a > 0$, a randomized polynomial-time algorithm for metric $k$-median always returns a set $S
    subset.eq F$ with $\| S \| lt.eq k$ and satisfies
$ Pr #h(-0.16667em) {"cost" \( S \) lt.eq \( 2 - sigma \) "opt"_k} gt.eq 1 - \( \| D \| + \| F \| + 2 \)^(- a) . $

 The same algorithm can be chosen to satisfy $bb(E) "cost" \( S \) lt.eq \( 2 - sigma \) "opt"_k$.
   The running time is polynomial in the bit length of the finite rational metric input.
   Its degree may depend on the fixed constants.]
] <main:theorem>

=== 1.3 Prior work and the relation to these methods <prior-work-and-the-relation-to-these-methods>

The development of metric $k$-median approximations includes LP rounding
  #cite(label("CharikarGuhaTardosShmoys2002")), primal-dual and Lagrangian methods
  #cite(label("JainVazirani2001")), dual-fitting greedy facility location #cite(label("JMS2002"))
  #cite(label("JainEtAl2003")), and bounded-exchange local search #cite(label("Arya2004")).
  These methods expose different aspects of the budget: a facility-location price controls a weighted opening
  cost, whereas $k$-median requires a cardinality bound on every output.
  Li and Svensson’s pseudo-approximation reduction #cite(label("LiSvensson2016")) and subsequent bi-point rounding
  #cite(label("ByrkaEtAl2017")) #cite(label("GowdaEtAl2023")) provided major advances in translating relaxed
  solutions into feasible ones. More recent iterative randomized rounding gives another route through this issue
  #cite(label("ByrkaEtAl2026")).

The closest algorithmic predecessor here is the $\( 2 + epsilon \)$ approximation of Cohen-Addad et
  al. #cite(label("CGLSS2026")), announced at STOC 2025; we use the full version of 19 May 2026.
  Its construction combines logarithmic facility surplus with recovery for instances whose optimum is sensitive to
  deleting a center. We retain that architecture and use its valid-sequence merging construction as an external
  input. Sections 7–9 state its exact interface, justify our scale and precision choices,
  and prove the replay properties used in the application.

The recovery track is also a substantial adaptation of that work.
  Its Section 4.1.1 obtains almost exact proxies outside exceptional clusters,
  drawing on the structural local-search analysis of Cohen-Addad and Schwiegelshohn
  #cite(label("CohenAddadSchwiegelshohn2017")). Its Sections 4.2–4.4 sample leaders by distance,
  guess facility balls, attach leaf dummies and remove original centers;
  Section 4.6 completes these choices by partition-constrained submodular optimization.
  We prove the proxy statement under an explicit scale hypothesis, interleave the leader and removal steps,
  and amortize their radius guesses through disjoint sets of clients.
  An exact subset dynamic program handles removal destinations without a sampled ball,
  while a submodular surrogate handles destinations represented by proxies or balls.
  These changes yield the single-exponential exceptional-count bound used here.

The factor $1 + 2 \/ e$ in recovery has an established FPT antecedent in Cohen-Addad, Gupta, Kumar,
  Lee and Li #cite(label("CGKLL2019")). Their leader/ball construction and submodular savings formulation explain
  the appearance of the $1 - 1 \/ e$ gain. The continuous-greedy method and partition rounding are due to Vondrák
  and to Călinescu, Chekuri, Pál and Vondrák #cite(label("Vondrak2008")) #cite(label("CCPV2011"));
  we give the finite categorical implementation needed for our surrogate.
  Dai, Li and Peng #cite(label("DaiLiPeng2026")) give a recent related FPT construction.
  The $k^(O \( k \))$ dependence in these FPT bounds does not become polynomial merely by setting $k =
  O \( log N \)$. The distinction addressed by our recovery theorem is the dependence on the number of bad
  comparison clusters, under its stated proxy promise.

=== 1.4 Proof overview <proof-overview>

The recovery proof begins with a real anchor $S$ and uses a comparison set $O$ only to identify a favorable random
  history. When local search is used to create the anchor, weighted swaps protect the distinct good proxies and
  bound the cost carried by the bad clusters. A geometric threshold argument then bounds their number; see Section 3.

For recovery itself, a state consists of surviving members of $S$ and leaf dummies attached to sampled clients.
  Each step samples a client in proportion to its distance from this reference set and then either adds a guessed
  ball around it or removes its currently serving original facility.
  A population radius, computable from the input and guessed comparison cost, controls the radius menu.
  Large menu indices can occur only at disjoint client sets whose total comparison cost pays for them.
  Their total probability loss is thus $exp \( - O \( m \) \)$, even when the original distance range is large.
  Section 4 proves this amortization and sums the likelihoods of all favorable adaptive histories.
  Saving every prefix lets the algorithm use a useful stopping state without knowing the comparison partition.

Section 5 turns each prefix into a real solution. Suppose $a$ bad clusters have balls and a set $Q$ of original
  centers has already been removed. The analysis identifies $m - \| Q \|$ further removals and at most $m -
  a$ destinations at comparison centers without balls. A subset dynamic program optimizes those destinations.
  For the others, choosing one facility per ball maximizes a monotone submodular saving,
  including the cost of the remaining removals. The construction adds at most $m$ real facilities after removing
  $m$ original ones, so every candidate respects the original budget.
  The comparison centers are used to bound the optimized surrogate, never as algorithm advice.

The sharper analysis in Section 6 uses two successive stopping rules for the same sampling experiment.
  At the first stop, reference cost is small both on nearby uncovered clients and on clients served by original
  centers that still need removal. The guide then adds balls without making further removals.
  The latter client set can only shrink. Its fractions measured at the first stop distinguish the clusters needing
  another ball from those already cheap enough. Keeping these fractions in the completion estimate gives the $1 +
  2 \/ e + epsilon$ guarantee.

The execution track begins in Section 7. We fix the surplus construction’s final price and copy lengths,
  then replay only its final valid sequences. One client-budget potential pays regular openings,
  and exact maximality of each phase gives a no-overbidding inequality at actual atomic boundaries.
  The final-dual proof treats regular and free openings separately.
  All three conclusions therefore refer to the same budget vector.
  Section 8 orders client removals and forms a suffix maximum.
  Two complementary slack estimates show that near equality in every budget inequality would force incompatible
  early and late behavior. This gives the bounded-price gap uniformly in the number of clients.

Finally, Sections 9–10 join the tracks. Let $L = O \( log N \)$ bound the surplus.
  If lowering the budget from $k$ to $k - 2 L$ changes optimum cost little, the target $k -
  L$ leaves room for the surplus; anchoring and bounded-price strictness improve the cost below $2$.
  Otherwise a nearby cardinality has expensive single-center deletions.
  Its optimum is sufficiently separated for anchoring to leave only $O \( L \)$ bad clusters,
  and recovery is polynomial. For $k lt.eq 2 L$ all clusters may be declared bad.
  The algorithm computes the candidates from both cases and keeps the cheapest, without testing optimum costs.
  The normalization of Section 2 and a bounded-cost local-search fallback give both the probability and the
  expectation conclusions on the original metric.

== 2 Conventions and reduction to bounded integral distances <pre:section>

For a nonempty set $H subset.eq F$, write

$ d \( p \, H \) = min_(x in H) d \( p \, x \) \, wide "cost" \( H \) = sum_(p in D) d \( p \, H \) \, wide
  "opt"_r = min_(H subset.eq F\
1 lt.eq \| H \| lt.eq r) "cost" \( H \) . $

We use $n = \| D \|$ and $N = n + \| F \|$. We use $log \( N + 2 \)$ for logarithmic factors in the instance size.
  Constants may depend on fixed accuracy parameters, but not on the input.
  The expression $exp \( O \( m \) \)$ always has an input-independent constant in the exponent.

We assume $F eq.not diameter$ and $k gt.eq 1$. Empty client sets have cost zero.
  When $k gt.eq \| F \|$, opening every facility is optimal.
  When $k gt.eq n$, choose a nearest available facility for each client;
  their union has at most $n$ elements and attains the sum of the individual lower bounds.
  We may consequently restrict the nontrivial analysis to

#[#set math.equation(numbering: n => "(2.1)")
 $ 1 lt.eq k < n \, wide k lt.eq \| F \| . $ <pre:nontrivial>]

If a set has fewer than a desired number of facilities, it can be padded from $F$ without increasing cost.
  Whenever exact cardinalities are used for comparison, this padding is understood and will be specified at the
  relevant construction.

Fix nearest assignments whenever a solution is considered.
  For a comparison solution $O$ of size $h$, its cluster at $i in O$ is denoted $C_i$, and

$ n_i = \| C_i \| \, wide d_p^(*) = d \( p \, O \) \, wide P_i = sum_(p in C_i) d_p^(*) \, wide P = "cost" \( O \) . $

Clusters may be empty. A cluster mean $macron(d)_i = P_i \/ n_i$ is used only when $n_i > 0$.
  A local solution is denoted $S$, with $s_p = d \( p \, S \)$. Assignment ties are broken by fixed priorities.
  When the reference set is enlarged only by adding points, its old points retain their relative priority.
  Thus the clients assigned to any fixed subset of old points can only disappear from that subset.

The body of the proof first treats disjoint indexed client and facility sets with positive integer distances
  between distinct points, bounded by a fixed polynomial in $N$.
  In particular every nonempty comparison solution has integral cost at least $n$.
  The polynomial bound may have a fixed coefficient depending on an accuracy parameter.
  It is fixed before the surplus algorithm is invoked.

#thm([Lemma 2.1.])[
  (Metric rounding and transfer).  #emph[Fix rational $0 < epsilon_0 lt.eq 1$.
    Suppose a polynomial-time algorithm for the bounded integral instances just described always returns at most
    $k$ facilities of cost at most $5 "opt"_k$, and, with probability at least $1 - p$,
    returns cost at most $A "opt"_k$, where $A lt.eq 5$. Then a randomized polynomial-time algorithm for arbitrary
    finite rational metric instances always returns at most $k$ facilities of cost at most $5 \( 1 + epsilon_0 \)
    "opt"_k$ and, with probability at least $1 - p$, returns cost at most $A \( 1 + epsilon_0 \) "opt"_k$.
    The bounded integral distances needed are at most $ceil.l 20 n^2 \/ epsilon_0 ceil.r + 1$.]
] <pre:rounding>

#proof[
  Detect zero optimum first. It occurs exactly when every client location contains an available facility and the
    number of distinct client locations is at most $k$. More generally,
    if repeated indexed points are initially represented by zero distances,
    use their zero-distance equivalence classes for this test.
    Opening one facility in each relevant class gives cost zero.
  Suppose the optimum cost $P^(*)$ is positive. Guess a positive client–facility distance $M$ from the input;
    there are at most $n \| F \|$ possibilities. For the correct guess,
    $M$ is the largest assigned distance in some fixed optimum, so
  #[#set math.equation(numbering: n => "(2.2)")
   $ M lt.eq P^(*) lt.eq n M . $ <pre:M-range>]
  Set
  $ u = frac(epsilon_0 M, n) \, wide C = ceil.l 20 n^2 \/ epsilon_0 ceil.r + 1 . $
  Separate client and facility copies when a point serves both roles. For distinct indexed points $x \, y$ set
  $ d_M \( x \, y \) = min { C \, max { 1 \, ceil.l d \( x \, y \) \/ u ceil.r } } \, wide d_M \( x \, x \) = 0 . $
  This is a metric. Indeed, ceiling is monotone and subadditive on nonnegative arguments;
    enforcing the lower bound one on distinct points and applying a common cap preserve the triangle inequality.
    For a triangle with repeated indices the assertion is immediate.
    For three distinct indices it follows by applying these two monotone,
    subadditive operations to the original triangle inequality.
    These observations also cover distinct copies whose original distance is zero.
  The original optimum, evaluated in $d_M$, has cost at most $P^(*) \/ u + n$.
    Thus for the correct guess the new optimum $Q^(*)$ satisfies
  #[#set math.equation(numbering: n => "(2.3)")
   $ Q^(*) lt.eq P^(*) \/ u + n lt.eq n^2 \/ epsilon_0 + n . $ <pre:rounded-optimum>]
  The assumed algorithm’s output has rounded cost at most $5 Q^(*) < C$.
    Choose nearest rounded assignments for that output. None of their edges has rounded length $C$,
    because the whole sum is smaller than $C$. On every selected edge, therefore, $d \( x \, y \) lt.eq
    u thin d_M \( x \, y \)$. The original nearest-assignment cost is no larger than that of these assignments.
    The output consequently has original cost at most
  $ 5 u Q^(*) lt.eq 5 \( P^(*) + u n \) lt.eq 5 \( 1 + epsilon_0 \) P^(*) \, $
  using Equation (2.2). On the successful event the same argument replaces $5$ by $A$.
  Run the algorithm for every positive guess and return the feasible output with the least original cost.
    It is at least as good as the output of the correct guess, so no union bound over guesses is needed.
    All sets returned respect the budget. Sorting distances, taking ceilings,
    and constructing the rounded matrices require polynomial-bit rational arithmetic.
    The number of guesses is polynomial, and the rounded distance bound is a fixed polynomial for fixed $epsilon_0$. ◻
]

The factor-five requirement in Lemma 3 is supplied by always retaining a local-search fallback; see Lemma 5.
  The algorithm eventually returns the cheapest of its feasible candidates.
  This ensures that failure of a sampling event never causes unbounded cost.

== 3 Local search and anchored comparison clusters <loc:section>

We first prove the two local statements used by both branches of the algorithm.
  The geometric arguments apply to any finite metric. The bounded integral distance assumption is needed only for
  the polynomial running time of exact local descent. Exchanges of bounded size are standard in local-search
  analysis #cite(label("Arya2004")) Sections 3.3–3.4. Our weighted comparison adapts the nearest-facility routing
  proof of Gupta and Tangwongsan #cite(label("GuptaTangwongsan2008")) while protecting the specified proxies.
  The anchoring argument adapts the disjoint-region and incoming-client analysis of
  #cite(label("CohenAddadSchwiegelshohn2017")) and #cite(label("CGLSS2026")) Section 4.1.1.
  We prove the particular scale hypothesis and error bound needed here,
  for a comparison solution that need not be optimal.

=== 3.1 Local optimality and weighted exchanges <local-optimality-and-weighted-exchanges>

Fix an integer $r$ with $1 lt.eq r lt.eq \| F \|$. A set $S subset.eq
  F$ of size $r$ is a #emph[width-$5$ local optimum] if no exchange removing at most five facilities and adding at
  most five facilities produces a set of size $r$ with strictly smaller cost.
  We also use exchanges whose resulting set is nonempty and has fewer than $r$ facilities:
  any such set can be padded to size $r$ by restoring removed facilities,
  without increasing its cost or the width of the exchange.

#thm([Lemma 3.1.])[
  (Exact local descent).  #emph[Suppose all distances are integers at most $B$,
    where $B$ is bounded by a fixed polynomial in $N = n + \| F \|$.
    From any nonempty initial set of $r$ facilities, a width-$5$ local optimum of size $r$ can be found in
    polynomial time, with no increase in cost.]
] <loc:descent>

#proof[
  Enumerate all sets of at most five facilities to remove and all sets of at most five facilities to add,
    checking those exchanges that leave exactly $r$ facilities.
    There are $O \( N^10 \)$ pairs, and each resulting cost can be evaluated in polynomial time.
    Perform any strict improvement and repeat. Every cost is an integer between zero and $n B$,
    so at most $n B$ strict improvements are performed.
  For completeness, consider an exchange with removal set $R subset.eq S$, addition set $A subset.eq F$,
    $\| R \| \, \| A \| lt.eq 5$, and nonempty result $T = \( S \\ R \) union A$ of size at most $r$.
    All facilities in $S \\ T$ belong to $R$, and $\| S \\ T \| gt.eq r - \| T \|$.
    Restoring any $r - \| T \|$ of them gives a set of size $r$,
    still differing from $S$ by at most five removals and five additions, with cost at most $"cost" \( T \)$.
    Thus the final local optimum also rules out every improving exchange of this form. ◻
]

Let $O subset.eq F$ be a comparison set of size $h$, where $1 lt.eq h lt.eq \| S \|$, and put $P =
  "cost" \( O \) > 0$. Fix nearest-facility assignments to both $O$ and $S$, using arbitrary fixed rules for ties.
  For $i in O$, write $C_i$ for its assigned client set and define

$ n_i = \| C_i \| \, wide d_p^(*) = d \( p \, O \) \, wide s_p = d \( p \, S \) \, wide P_i = sum_(p in C_i) d_p^(*) . $

Write $s \( p \) in S$ for the assigned local facility, so $d \( p \, s \( p \) \) = s_p$.
  Empty sets $C_i$ are permitted. Given a partition $O = O_g dot(union) O_b$, define

$ P_g = sum_(i in O_g) P_i \, quad P_b = sum_(i in O_b) P_i \, quad S_g = sum_(i in O_g) sum_(p in C_i) s_p \,
  quad S_b = sum_(i in O_b) sum_(p in C_i) s_p . $

For each good center $i in O_g$, suppose a proxy $phi.alt_i in S$ has been specified,
  with these proxies pairwise distinct. Set

$ D_g = sum_(i in O_g) sum_(p in C_i) d \( p \, phi.alt_i \) . $

#thm([Lemma 3.2.])[
  (Weighted swap bound).  #emph[Under the preceding hypotheses, if $S$ is a width-$5$ local optimum and $u =
    6 \/ 5$, then
#[#set math.equation(numbering: n => "(3.1)")
 $ S_b + u S_g lt.eq \( 1 + 2 u \) P_b + u D_g . $ <loc:strong-swap>]

 Consequently,
#[#set math.equation(numbering: n => "(3.2)")
 $ "cost" \( S \) lt.eq u D_g + \( 1 + 2 u \) P_b . $ <loc:swap-bound>]

 In particular, for any comparison set $O$ of size at most $\| S \|$, $"cost" \( S \) lt.eq \( 17 \/ 5 \) P lt.eq 5 P$.]
] <loc:swap>

#proof[
  Protect the proxy set $Phi = { phi.alt_i : i in O_g }$, meaning that no exchange below removes any member of
    $Phi$. Write $g = \| O_g \|$, $m = \| O_b \|$, and $q = \| S \\ Phi \|$.
    Distinctness of the proxies and $h lt.eq \| S \|$ imply
  $ q = \| S \| - g gt.eq h - g = m . $
  If $m = 0$, every client can use its proxy, so $S_g lt.eq D_g$ and both inequalities follow.
    Assume henceforth that $m > 0$; in particular an unprotected facility exists.
  For every $i in O_b$, choose a nearest facility $nu \( i \) in S$ to $i$.
    Retain this choice for the routing argument. Separately define an image $psi \( i \) in S \\ Phi$:
    if $nu \( i \)$ is unprotected, take $psi \( i \) = nu \( i \)$; if $nu \( i \)$ is protected,
    take any unprotected facility as $psi \( i \)$. Thus the image used to organize exchanges need not be the
    nearest facility used for routing.
  Let $a$ be the number of nonempty image classes of $psi$.
    A class of size $t$ receives its image facility together with $t -
    1$ auxiliary unprotected facilities that are not images of any bad center.
    These sets of facilities can be chosen disjointly across classes:
    the total number of auxiliary facilities needed is $m - a$, whereas the number available is $q - a gt.eq m -
    a$. Facilities in these allocated sets will be called slots.
  We give a nonnegative weighting of feasible exchanges. For an image class $I subset.eq O_b$ of size $t lt.eq 5$,
    make the single exchange of weight one that removes its $t$ slots and adds every center in $I$.
    For a class of size $t > 5$, for each $i in I$ and each of the $t - 1$ auxiliary slots,
    make the exchange that removes that slot and adds $i$, with weight $1 \/ \( t - 1 \)$.
    These are exchanges of width at most five. Their results are nonempty and have size at most $\| S \|$,
    even when an added facility already belongs to $S$: they are interpreted as actual set unions,
    and Lemma 4’s padding observation applies. Local optimality therefore gives a nonnegative cost change for
    every one of them.
  Every bad center is added in exchanges of total weight exactly one.
    A slot allocated to a class of size at most five has removal weight one.
    In a class of size $t > 5$, the image slot is never removed and each auxiliary slot has removal weight
  $ frac(t, t - 1) lt.eq 6 / 5 = u . $
  Unallocated facilities are never removed. Thus every facility in $S$ has total removal weight at most $u$.
  We also need a preservation property. In every exchange that does not add a particular bad center $i$,
    its remembered nearest facility $nu \( i \)$ survives. If $nu \( i \)$ is protected,
    this is part of the construction. Otherwise $nu \( i \) = psi \( i \)$ is the image slot of $i$’s class.
    A small-class exchange that removes this slot adds all centers of the class, including $i$;
    a large-class exchange never removes it. Other classes have disjoint slots.
    This proves the property, including when $O ∩ S eq.not diameter$.
  Consider a client $p in C_i$ with $i in O_b$. In every exchange that adds $i$, route $p$ to $i$,
    at cost change $d_p^(*) - s_p$. In any other exchange retain its old assignment if possible.
    If its old facility is removed, use the preserved facility $nu \( i \)$, for which
  $ d \( p \, nu \( i \) \) & lt.eq d_p^(*) + d \( i \, nu \( i \) \)\
 & lt.eq d_p^(*) + d \( i \, s \( p \) \) lt.eq 2 d_p^(*) + s_p . $
  The weighted sum of these upper bounds for $p$ is therefore at most
  $ d_p^(*) - s_p + 2 u d_p^(*) . $
  Here the first term uses total addition weight one. For the other exchanges we upper-bound their removal weight
    by the full removal weight of $s \( p \)$, which is at most $u$; the extra charge $2 d_p^(*)$ is nonnegative.
    Removing and immediately adding back the same facility only reduces the need for this extra charge.
  For a client $p in C_i$ with $i in O_g$, keep the old assignment unless its serving facility is removed,
    in which case use the protected proxy $phi.alt_i$. Nearest assignment in $S$ gives $d \( p \, phi.alt_i \) -
    s_p gt.eq 0$, so its weighted cost change is at most $u \( d \( p \, phi.alt_i \) - s_p \)$.
  Each described routing is feasible for its exchange. Summing the upper bounds on cost change,
    and using nonnegativity of every actual cost change, yields
  $ 0 lt.eq P_b - S_b + 2 u P_b + u \( D_g - S_g \) . $
  This is (3.1). Since $u gt.eq 1$, it implies (3.2). Declaring every center bad gives the final assertion. ◻
]

=== 3.2 Anchoring at any fixed accuracy <anchoring-at-any-fixed-accuracy>

For $h gt.eq 2$ define the separation of a comparison center by

$ "sep"_i = min_(j in O \\ { i }) d \( i \, j \) \, wide ell = \| S \| - h gt.eq 0 . $

In a metric, $"sep"_i > 0$. The next theorem is existential:
  the algorithm will not need to find its partition or proxies.

#thm([Theorem 3.3.])[
  (Anchoring).  #emph[Let $S$ be a width-$5$ local optimum, and let $O$ be a comparison set with $2 lt.eq
    h = \| O \| lt.eq \| S \|$ and $P = "cost" \( O \) > 0$. Suppose $b > 0$ satisfies
#[#set math.equation(numbering: n => "(3.3)")
 $ b (ell + \| { i in O : n_i "sep"_i < b } #scale(x: 120%, y: 120%)[\|]) lt.eq 10 P . $ <loc:scale-condition>]

 For every fixed $mu in \( 0 \, 1 \]$, there is a partition $O =
   O_g dot(union) O_b$ and distinct proxies $phi.alt_i in S$ for $i in O_g$ such that, with $m = \| O_b \|$,
#[#set math.equation(numbering: n => "(3.4)")
 $ sum_(i in O_g) sum_(p in C_i) d \( p \, phi.alt_i \) lt.eq P_g + mu P \, wide m lt.eq C_mu P / b \,
   $ <loc:anchoring-conclusion>]

 where the finite constant
#[#set math.equation(numbering: n => "(3.5)")
 $ J_mu = ⌈40 / mu⌉ \, wide C_mu = 10 + 600 / mu thin 2^(J_mu - 1) $ <loc:anchoring-constant>]

 depends only on $mu$.]
] <loc:anchoring>

#proof[
  Set
  $ V_i = sum_(p in C_i) \( s_p + d_p^(*) \) \, wide q_0 = \| { i in O :
    n_i "sep"_i < b } #scale(x: 120%, y: 120%)[\|] . $
  The all-bad case of Lemma 5 gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ sum_(i in O) V_i = "cost" \( S \) + P lt.eq 6 P . $ <loc:V-bound>]
  Call a center #emph[short] if $n_i "sep"_i < b$. In particular, every empty comparison cluster is short.
  ===== 3.2.1 Selecting a threshold. <selecting-a-threshold.>
  Let $t_a = \( mu \/ 100 \) 2^(- a)$ for $0 lt.eq a < J_mu$.
    At threshold $t_a$, declare $i$ good precisely when it is not short and $V_i lt.eq t_a b$,
    and let $m_a$ be the resulting number of bad centers. For a fixed nonshort center $i$,
    the geometric tail of those values $t_a b$ that are strictly less than $V_i$ has sum at most $2 V_i$. Consequently,
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_(a = 0)^(J_mu - 1) t_a b \( m_a + ell \) & lt.eq 2 \( mu \/ 100 \) b \( q_0 + ell \) + 2 sum_(i in O) V_i\
 & lt.eq \( 12 + mu \/ 5 \) P . $ <loc:threshold-average>]
  The first term accounts for short centers and surplus facilities at every threshold;
    the second accounts for all other bad centers. Since $J_mu gt.eq 40 \/ mu$ and $mu lt.eq 1$,
    the average of the left-hand summands is at most
  $ mu / 40 \( 12 + mu \/ 5 \) P lt.eq 61 / 200 mu P < frac(mu P, 2) . $
  Choose a threshold $t = t_a$ attaining at most this average, and use its good/bad partition. Thus
  #[#set math.equation(numbering: n => "(3.8)")
   $ t b \( m + ell \) lt.eq frac(mu P, 2) \, wide 0 < t lt.eq mu / 100 lt.eq 1 / 100 . $ <loc:selected-threshold>]
  Every nonshort bad center has $V_i > t b$. By (3.3) and (3.6),
  $ m lt.eq q_0 + frac(sum_i V_i, t b) lt.eq (10 + 6 / t) P / b lt.eq C_mu P / b . $
  This proves the count bound.
  ===== 3.2.2 Proxy geometry and the number of crowded balls. <proxy-geometry-and-the-number-of-crowded-balls.>
  For each good $i$, choose a nearest facility $phi.alt_i in S$ to $i$, and write $r_i = d \( i \, phi.alt_i \)$.
    Such a center has $n_i > 0$. For every $p in C_i$, nearest choice and the triangle inequality give $r_i lt.eq
    d \( i \, s \( p \) \) lt.eq d_p^(*) + s_p$. Hence
  #[#set math.equation(numbering: n => "(3.9)")
   $ n_i r_i lt.eq V_i lt.eq t b \, wide r_i lt.eq t "sep"_i . $ <loc:proxy-distance>]
  Consider the open balls in the ambient metric
  $ B_i = { x : d \( i \, x \) < "sep"_i \/ 4 } \, wide i in O_g . $
  They contain their respective proxies. They are pairwise disjoint:
    for distinct $i \, j in O$, both separations are at most $d \( i \, j \)$,
    so the sum of the ball radii is at most $d \( i \, j \) \/ 2$;
    membership in both balls would contradict the triangle inequality. In particular the proxies are distinct.
  There are $h - m$ good balls and $\| S \| = h + ell$ local facilities.
    Every good ball contains at least one local facility. Because the balls are disjoint,
    the number of them containing at least two local facilities is at most
  $ \| S \| - \( h - m \) = m + ell . $
  Call these balls crowded. All other good balls contain exactly their one proxy as a local facility.
  ===== 3.2.3 Charging the assignment excess. <charging-the-assignment-excess.>
  We upper-bound the sum of $d \( p \, phi.alt_i \) - d_p^(*)$ over all good clusters using three contributions.
    Individual excesses may be negative; only their total upper bound is needed.
  First, for a good center with a crowded ball, the triangle inequality and (3.9) give
  $ sum_(p in C_i) #scale(x: 120%, y: 120%)[\(] d \( p \, phi.alt_i \) -
    d_p^(*) #scale(x: 120%, y: 120%)[\)] lt.eq n_i r_i lt.eq t b . $
  The total contribution from crowded balls is therefore at most $t b \( m + ell \)$.
  Second, suppose $B_i$ contains exactly one local facility and $p in
    C_i$ is assigned in $S$ to a facility other than $phi.alt_i$.
    That facility lies outside $B_i$, including possibly on its boundary, and therefore
  $ d_p^(*) + s_p gt.eq d \( i \, s \( p \) \) gt.eq "sep"_i \/ 4 . $
  The excess of this client is at most
  $ d \( p \, phi.alt_i \) - d_p^(*) lt.eq r_i lt.eq 4 t \( d_p^(*) + s_p \) . $
  Summing over these clients gives a total at most $4 t sum_i V_i$.
  Third, consider the remaining clients of the singleton balls, namely those assigned to their own proxy.
    For such a good center $i$, put
  $ A_i = { p in C_i : s \( p \) = phi.alt_i } \, wide I_i = { p in D \\ C_i : s \( p \) = phi.alt_i } . $
  We claim that
  #[#set math.equation(numbering: n => "(3.10)")
   $ sum_(p in A_i) \( s_p - d_p^(*) \) lt.eq r_i \| I_i \| . $ <loc:incoming-swap>]
  If $i = phi.alt_i$, the left side is zero. Otherwise $i in.not S$,
    since a nearest facility to a facility already in $S$ is that facility itself. Exchange $phi.alt_i$ for $i$.
    Send all clients previously assigned to $phi.alt_i$ to $i$ and keep all other assignments.
    Clients in $A_i$ have change $d_p^(*) - s_p$; each incoming client in $I_i$ has change at most $r_i$.
    Local optimality implies $0 lt.eq sum_(p in A_i) \( d_p^(*) - s_p \) + r_i \| I_i \|$, proving (3.10).
    This also explains why overlap between $O$ and $S$ creates no exception to the argument.
  For $p in I_i$, let $j eq.not i$ be its assigned comparison center.
    The path from $i$ to $j$ through $phi.alt_i$ and $p$ gives
  $ d_p^(*) + s_p gt.eq d \( i \, j \) - r_i gt.eq \( 1 - t \) "sep"_i . $
  Together with (3.9), this bounds its incoming charge by
  $ r_i lt.eq frac(t, 1 - t) \( d_p^(*) + s_p \) . $
  The proxies are distinct and the local assignment is fixed.
    Thus a client is incoming at at most one charged proxy, and summing (3.10) gives a total at most
    $frac(t, 1 - t) sum_i V_i$ for the third contribution.
  Combining the three contributions proves
  $ D_g - P_g & lt.eq t b \( m + ell \) + (4 t + frac(t, 1 - t)) sum_i V_i\
 & lt.eq frac(mu P, 2) + (24 t + frac(6 t, 1 - t)) P . $
  Since $t lt.eq 1 \/ 100 < 1 \/ 2$, the last parenthesis is at most $36 t lt.eq \( 9 \/ 25 \) mu < mu \/ 2$.
    This proves $D_g lt.eq P_g + mu P$ and finishes the proof.
    Empty comparison clusters were counted among the bad centers throughout and never required division by $n_i$. ◻
]

For the main approximation theorem we henceforth use the specialization $mu = 1 \/ 100$ and the absolute constant

#[#set math.equation(numbering: n => "(3.11)")
 $ C_0 := C_(1 \/ 100) = 10 + 60000 dot.op 2^3999 . $ <loc:main-count-constant>]

Thus $C_0$ is fixed before any choice of the later algorithm parameters $v$ and $L$.
  Theorem 6 gives $D_g lt.eq P_g + 0.01 P$ and $m lt.eq C_0 P \/ b$ with this one choice.
  The same proof supplies smaller fixed proxy error in the refined recovery theorem by choosing a different fixed $mu$.

Two consequences will be useful. If $\| S \| = h$, the number of facilities of $S$ outside the distinct proxy set
  is exactly $m$, including when some bad comparison clusters are empty.
  Also, if the main specialization satisfies $P_b lt.eq P \/ 10$, then Lemma 5 gives

#[#set math.equation(numbering: n => "(3.12)")
 $ "cost" \( S \) lt.eq 6 / 5 \( P - P_b + 0.01 P \) + 17 / 5 P_b lt.eq 1.432 P < 1.6 P . $ <loc:small-bad-cost>]

Finally, when all centers are declared bad, the proxy condition is vacuous and $m = h$;
  that use of Lemma 5 needs no separation assumption and applies also to $h = 1$.

== 4 Joint sampling of leaders and removals <sam:section>

This section constructs the prefixes used by the recovery algorithm.
  Its input is a real solution $S$, an upper bound $M_0$ on the number of bad comparison centers,
  and guesses for two integers $P$ and $m$. The comparison solution, its partition,
  and its proxies are used only in the analysis. For each guess,
  the algorithm samples a client proportionally to its current reference distance.
  A fair coin selects an attempt to add a guessed ball centered at that client or to delete its assigned original
  center. Every valid prefix is saved for completion; the comparison-dependent stopping rules below certify that
  one such prefix is useful.

Distance-proportional sampling has a general clustering antecedent in #cite(label("ArthurVassilvitskii2007"))
  Section 5. The closer predecessor here is the recovery construction of #cite(label("CGLSS2026"))
  Sections 4.2–4.4, which samples leaders, guesses balls and deletes original centers.
  Our experiment interleaves these operations. The population radii and their amortized menu cost are what make
  the dependence on the number of bad clusters single-exponential.

All distances in the instance considered here are positive integers between distinct indexed points,
  with a polynomial upper bound. The reduction to this case is proved in the preliminaries.

Fix, for the analysis, a comparison solution $O$ with $\| O \| = \| S \| = h$ and $"cost" \( O \) = P > 0$.
  Fix nearest assignments to $O$, write $C_i$ for the cluster of $i in O$, and put

$ n_i = \| C_i \| \, wide P_i = sum_(p in C_i) d_p^(*) \, wide d_p^(*) = d \( p \, O \) \, wide macron(d)_i =
  P_i \/ n_i quad \( n_i > 0 \) . $

Give an empty cluster mean zero. Let $cal(G)$ and $cal(B)$ be the good and bad centers, respectively,
  and suppose that $m = \| cal(B) \|$ and there are distinct proxies $phi.alt_i in S$, $i in cal(G)$, such that

#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(i in cal(G)) sum_(p in C_i) d \( p \, phi.alt_i \) lt.eq P_g + 0.01 P \, wide P_g =
   sum_(i in cal(G)) P_i . $ <sam:proxy-hypothesis>]

Thus

#[#set math.equation(numbering: n => "(4.2)")
 $ S_0 = S \\ { phi.alt_i : i in cal(G) } \, wide \| S_0 \| = m . $ <sam:nonproxy-set>]

The set $S_0$ need not be found. If $m = 0$, the proxies exhaust $S$ and Equation (4.1) already gives
  $"cost" \( S \) lt.eq 1.01 P$. In what follows $m gt.eq 1$. The main recovery algorithm uses $kappa = 10^(- 6)$.
  Some geometric and probabilistic lemmas below allow any fixed rational $0 < kappa lt.eq
  1$ so that they can also be used for the accuracy refinement.

=== 4.1 Computable radii and reference metrics <computable-radii-and-reference-metrics>

For a client $w$ and $q gt.eq 0$, let $cal(D) \( w \, q \) = { p in D : d \( w \, p \) lt.eq
  q }$ be the closed client ball. Define

#[#set math.equation(numbering: n => "(4.3)")
 $ r^0 \( w \) = min { q gt.eq 0 : q \| cal(D) \( w \, q \) \| gt.eq P \/ m } . $ <sam:r0-definition>]

This radius depends only on the guessed $P \, m$ and the input metric.

#thm([Lemma 4.1.])[
  (The computable radius).  #emph[If $d_1 lt.eq dots.h.c lt.eq d_n$ are the client distances from $w$,
    including the zero distance from $w$ to itself, then
#[#set math.equation(numbering: n => "(4.4)")
 $ r^0 \( w \) = min_(1 lt.eq j lt.eq n) max { d_j \, P \/ \( m j \) } > 0 . $ <sam:r0-formula>]

 In particular the minimum in Equation (4.3) is attained and its closed ball satisfies the defining population
   inequality. Suppose that $A subset.eq cal(B)$ and each $i in A$ has a client $w_i in C_i$ with $r_i =
   d \( w_i \, i \) lt.eq a macron(d)_i$, where $a > 0$. Then
#[#set math.equation(numbering: n => "(4.5)")
 $ r^0 \( w_i \) & lt.eq \( a + 2 \) macron(d)_i + frac(2 P, m n_i) \,\
sum_(i in A) n_i r^0 \( w_i \) & lt.eq \( a + 2 \) sum_(i in A) P_i +
  frac(2 \| A \|, m) P lt.eq \( a + 4 \) P . $ <sam:leader-radius-sum>]

 The last bound is $5.2 P$ when $a = 1.2$, and is at most $5.5 P$ when $a lt.eq 3 \/ 2$.]
] <sam:computable-radius>

#proof[
  For every $j$, the number $q_j = max { d_j \, P \/ \( m j \) }$ has at least $j$ clients in its closed ball and
    $q_j j gt.eq P \/ m$, so it is feasible. Conversely, if $q$ is feasible and $j = \| cal(D) \( w \, q \) \|$,
    then $j gt.eq 1$, $d_j lt.eq q$, and $P \/ \( m j \) lt.eq q$. Hence $min_j q_j lt.eq q$.
    These two observations prove Equation (4.4), attainment, and positivity.
  For a selected leader the cluster is nonempty. At least $n_i \/ 2$ of its clients have $d_p^(*) lt.eq
    2 macron(d)_i$: otherwise their distances alone would sum to more than $P_i$.
    When $macron(d)_i = 0$ all clients have zero distance, so the same assertion holds.
    These clients are within $\( a + 2 \) macron(d)_i$ of $w_i$.
    At radius $\( a + 2 \) macron(d)_i + 2 P \/ \( m n_i \)$ their population certifies feasibility in
    Equation (4.3). Multiply the resulting bound by $n_i$ and sum.
    Distinct leaders here belong to distinct bad clusters, so $\| A \| lt.eq m$ and $sum_(i in A) P_i lt.eq P$. ◻
]

Let $Delta > 0$ be the diameter of the original metric on $D union F$.
  Adjoin a permanent point $delta_oo$ at distance $Delta$ from every original point.
  For each selected pair $\( w_i \, R_i \)$ with $R_i > 0$,
  adjoin a distinct leaf $delta_i$ at $w_i$ with edge length $R_i$.
  This leaf construction is used in #cite(label("CGLSS2026")) Section 4.3.1;
  we record its metric and tie-breaking properties for the present process. Write $Lambda = { delta_i : i in A }$ and

#[#set math.equation(numbering: n => "(4.6)")
 $ H = \( S \\ Q \) union Lambda union { delta_oo } \, wide cal(F)_i = { x in F : d \( w_i \, x \) lt.eq
   R_i } . $ <sam:reference>]

Here $Q$ is the set of original centers removed so far. The labels $i in A$ describe a correct prefix;
  the algorithm stores only the list of leaders, radii, and leaves.

#thm([Lemma 4.2.])[
  (Dummy distances and ties).  #emph[The construction above extends the original metric without changing its
    distances. For every original point $x$,
$ d \( x \, delta_i \) = d \( x \, w_i \) + R_i \, wide d \( delta_oo \, delta_i \) = Delta + R_i . $

 If $R_i gt.eq d \( w_i \, O \)$, then $d \( x \, delta_i \) gt.eq d \( x \, O \)$ for every original point $x$.
   If $x_i in cal(F)_i$, then $d \( x \, x_i \) lt.eq d \( x \, delta_i \)$ for every original point $x$.
   Every nonempty real solution similarly dominates the permanent dummy.]
  #emph[There is a fixed assignment rule, independent of $O \, S_0$, and $Q$,
    such that after any state in which further operations only add leaves,
    the client set assigned to any fixed subset of surviving original centers can only shrink.]
] <sam:dummy-metric>

#proof[
  One may first form the complete graph on the original metric points with their metric edge lengths and join
    $delta_oo$ to all of them by edges of length $Delta$. A path through $delta_oo$ cannot shorten an original
    distance, since its two adjacent edges have total length $2 Delta$.
    Taking the resulting shortest-path metric and then attaching leaves proves the distance formulas and all
    triangle inequalities. In particular, for different leaves the distance is $R_i + d \( w_i \, w_j \) + R_j$.
  The distance-to-set function is $1$-Lipschitz. More directly, $d \( x \, O \) lt.eq d \( x \, w_i \) +
    d \( w_i \, O \) lt.eq d \( x \, delta_i \)$, whereas $d \( x \, x_i \) lt.eq d \( x \, w_i \) +
    d \( w_i \, x_i \) lt.eq d \( x \, delta_i \)$. Every original facility is within $Delta$ of each original
    client, which proves the permanent-dummy assertion for a nonempty solution.
  Fix an order on the original facilities, put the permanent dummy after them, and order leaves by creation time.
    Assign each client to the first nearest available reference point in this order.
    Leaf addition preserves the distances and relative order of all existing choices.
    A client whose chosen reference point was outside a given fixed subset of original centers cannot begin to
    choose a point in that subset after more choices are added.
    This proves the assertion simultaneously for every such subset, including a subset unknown to the algorithm. ◻
]

All actual assignments below use this rule. Write $J_s$ for the clients assigned to an original center $s in
  S \\ Q$, and put

$ W \( H \) = sum_(p in D) d \( p \, H \) . $

The reference is always nonempty because of $delta_oo$.

=== 4.2 A finite radius experiment <a-finite-radius-experiment>

We first specify a radius experiment that does not test any condition involving the unknown comparison solution.
  Given $w$, put $q = r^0 \( w \)$ and define the integers

$ M_kappa & = ceil.l 10 \/ kappa ceil.r + 1 \, & J_(kappa \, m) & = 1 + ceil.l 2 m \/ kappa ceil.r \,\
E_kappa & = min { e in bb(Z)_(gt.eq 0) : \( 1 + kappa \)^e gt.eq 10 } . $

Choose one of the following three menus with probability $1 \/ 3$ each.

+ Choose $j$ uniformly from ${ 1 \, dots.h \, M_kappa }$ and set $R = j kappa q$.
+ If $Lambda eq.not diameter$, let $D_Lambda = d \( w \, Lambda \)$, choose $e$ uniformly from ${ 0 \, dots.h \,
  E_kappa }$, and set $R = D_Lambda \/ \( 1 + kappa \)^e$. If $Lambda = diameter$,
  this menu is undefined and ends the run.
+ Choose $j in { 1 \, dots.h \, J_(kappa \, m) }$ with probability
  $ frac(2^(- j), sum_(u = 1)^(J_(kappa \, m)) 2^(- u)) = frac(2^(J_(kappa \, m) - j), 2^(J_(kappa \, m)) - 1) \, $
  and set $R = j kappa q$.

All radii in these menus are positive. The algorithm may discard a branch if its facility ball is empty.
  The first two menus have a number of entries depending only on the fixed $kappa$;
  the third has $O_kappa \( m \)$ entries.

For the analysis, call a radius #emph[correct] at $w$ if, for $r = d \( w \, O \)$,

#[#set math.equation(numbering: n => "(4.7)")
 $ r lt.eq R lt.eq \( 1 + kappa \) r + kappa r^0 \( w \) . $ <sam:upward-radius>]

On any history with correct previous radii, Lemma 8 gives $D_Lambda gt.eq r$ whenever $Lambda$ is nonempty.
  Set $D_Lambda = + oo$ when it is empty, solely for the following analysis.
  We prescribe a correct menu and entry as follows:

- If $r lt.eq 10 q$, use menu (1) with $j = max { 1 \, ceil.l r \/ \( kappa q \) ceil.r }$.
- If $r > 10 q$ and $D_Lambda lt.eq 10 r$, use menu (2) with the largest $e lt.eq
  E_kappa$ for which $D_Lambda \/ \( 1 + kappa \)^e gt.eq r$.
- If $r > 10 q$ and $D_Lambda > 10 r$, use menu (3) with $j = ceil.l r \/ \( kappa q \) ceil.r$.

The first entry belongs to its stated range and satisfies $r lt.eq R lt.eq r + kappa q$, including $r = 0$.
  In the second case $r lt.eq D_Lambda lt.eq 10 r$, so the prescribed exponent exists and gives $r lt.eq
  R lt.eq \( 1 + kappa \) r$. The next lemma proves that all prescribed third-menu entries also lie in their
  finite range. Thus these prescriptions are analytical choices among actual branches,
  not tests performed by the algorithm.

#thm([Lemma 4.3.])[
  (Amortized radius guesses).  #emph[Fix $0 < kappa lt.eq 1$.
    Consider a sequence with at most $m$ ball additions, each using the prescribed correct radius above,
    and suppose that every previously added leaf remains present at every later addition.
    Arbitrary removals of original centers may occur between additions.
    Among additions using the third prescribed menu, the closed client balls $cal(D) \( w \, r^0 \( w \) \)$ are
    pairwise disjoint. Writing $r = d \( w \, O \)$ and $q = r^0 \( w \)$ for these additions, one has
#[#set math.equation(numbering: n => "(4.8)")
 $ sum_(upright("third menu")) r / q lt.eq frac(10 m, 9) \, wide sum_(upright("third menu")) j lt.eq
   (frac(10, 9 kappa) + 1) m . $ <sam:third-menu-budget>]

 Consequently each prescribed third-menu index is at most $J_(kappa \, m)$.
   There is a constant $c_kappa in \( 0 \, 1 \]$ such that the product of the probabilities of all prescribed
   menu-and-entry choices is at least
#[#set math.equation(numbering: n => "(4.9)")
 $ c_kappa^m thin 2^(- \( 10 \/ \( 9 kappa \) + 1 \) m) = exp \( - O_kappa \( m \) \) . $ <sam:menu-probability>]

 These statements do not require a fixed order of additions or a fixed rule for selecting their leaders.]
] <sam:radius-budget>

#proof[
  Consider two third-menu additions, with the first earlier than the second,
    and give their quantities subscripts $a \, b$. Suppose a client belongs to both closed client balls. Then
  $ d \( w_a \, w_b \) lt.eq q_a + q_b < frac(r_a + r_b, 10) . $
  Both inequalities $q_a < r_a \/ 10$ and $q_b < r_b \/ 10$ are strict because these are third-menu additions.
    Lipschitzness of distance to $O$ gives $\| r_a - r_b \| < \( r_a + r_b \) \/ 10$,
    and hence $9 \/ 11 < r_a \/ r_b < 11 \/ 9$. The earlier persistent leaf is an available competitor in
    $D_Lambda$ at the later step. Its correct radius therefore gives
  $ D_Lambda & lt.eq d \( w_b \, w_a \) + R_a\
 & < frac(r_a + r_b, 10) + \( 1 + kappa \) r_a + kappa r_a \/ 10\
 & lt.eq (1 / 10 + 11 / 9 (11 / 10 + frac(11 kappa, 10))) r_b < 3 r_b < 10 r_b . $
  Here the penultimate strict inequality uses $kappa lt.eq 1$.
    This contradicts the condition for prescribing the third menu at $b$.
    Thus the client sets are disjoint; no ambient space containing whole geometric balls is needed.
  For a third-menu addition every $p in cal(D) \( w \, q \)$ satisfies $d \( p \, O \) gt.eq r -
    d \( w \, p \) gt.eq r - q > 0.9 r$. The attained population inequality from Lemma 7 gives $\|
    cal(D) \( w \, q \) \| gt.eq P \/ \( m q \)$. Disjointness now implies
  $ P = sum_(p in D) d \( p \, O \) gt.eq 0.9 sum_(upright("third menu")) r thin \| cal(D) \( w \, q \) \| gt.eq
    frac(0.9 P, m) sum_(upright("third menu")) r / q . $
  Cancel $P > 0$ to obtain the first bound in Equation (4.8). For every third-menu entry,
  $ j = ceil.l r \/ \( kappa q \) ceil.r lt.eq r \/ \( kappa q \) + 1 . $
  There are at most $m$ additions, so the second bound follows. In particular,
  $ j lt.eq frac(10 m, 9 kappa) + 1 lt.eq frac(2 m, kappa) + 1 lt.eq J_(kappa \, m) . $
  Availability follows inductively: a proposed third-menu addition is disjoint from previous ones using only their
    radii, so the same population argument certifies its prescribed index before its radius is selected.
  Set
  $ c_kappa = min {frac(1, 3 M_kappa) \, frac(1, 3 \( E_kappa + 1 \)) \, 1 / 3} . $
  The prescribed choice in either of the first two menus has probability at least $c_kappa$.
    In the third it has probability at least $c_kappa 2^(- j)$, since the normalizing sum is less than one.
    Multiplication and Equation (4.8) prove Equation (4.9). If fewer than $m$ additions occur,
    replacing their number by $m$ only weakens the lower bound. ◻
]

=== 4.3 The experiment and adaptive guides <the-experiment-and-adaptive-guides>

The radius estimate has removed any aspect-ratio loss from a sequence of correct guesses.
  It remains to show that the random client draws can supply suitable leaders and removals with constant progress
  probability at each step. We first give a likelihood argument that allows these suitable choices to depend on
  the whole past history.

For guessed $P \, m$ the actual experiment starts with $Q = diameter$ and no leaves.
  It records its initial state and every subsequent valid state as a candidate prefix.
  For at most $2 m$ steps it performs the following operation.

+ Compute $H$, its nearest assignments, and $W \( H \)$. If $W \( H \) = 0$, end this run.
+ Sample $w in D$ with probability $d \( w \, H \) \/ W \( H \)$ and independently choose ball mode or removal
  mode, with probability $1 \/ 2$ each.
+ In ball mode, run the finite radius experiment. If it is defined and $cal(F) \( w \, R \) = { x in F :
  d \( w \, x \) lt.eq R }$ is nonempty, append its ball and leaf.
  In removal mode, remove the reference point assigned to $w$ if it belongs to $S \\ Q$, and add it to $Q$.
  An undefined operation ends the run.
+ End the run if it would have more than $m$ balls or more than $m$ removals; otherwise record its new state.

Only recorded states satisfying these observable size restrictions need be sent to completion.
  Prefixes on which no feasible completion exists can be discarded.
  The experiment never tests membership in $S_0$, the identity of a comparison cluster,
  or a comparison-dependent stopping condition.

#thm([Lemma 4.4.])[
  (Adaptive guided trajectories).  #emph[Fix $O \, P \, m$, $0 < kappa lt.eq 1$,
    and a number $rho in \( 0 \, 1 \]$ independent of the instance size.
    Suppose an analytical guided process uses the same initial state and, at each of its nonterminal histories,
    does the following:]
  + #emph[From that history it deterministically specifies ball mode or removal mode and a set of eligible clients
    such that, under the actual weighted client draw and fair mode choice,
    the joint probability of this event is at least $rho$.]
  + #emph[It draws the client from the actual law conditioned on that event.
    It performs exactly the actual update for the sampled outcome.
    Thus a removal deletes the original reference center assigned to that client,
    which must be a previously unremoved member of $S_0$. A ball addition has a leader in a previously uncovered
    bad cluster and uses its prescribed correct menu and entry.]
  #emph[Suppose the guide stops after at most $2 m$ steps on every supported trajectory.
    Leaves are retained throughout, and there are at most $m$ ball additions and $m$ removals.
    The eligible sets, modes, and stopping rules may depend on the entire preceding augmented history and on $O$;
    they may also have several successive stages, with their stage determined by that history.
    Then the actual experiment records a terminal state of this guide with probability at least
#[#set math.equation(numbering: n => "(4.10)")
 $ rho^(2 m) c_kappa^m 2^(- \( 10 \/ \( 9 kappa \) + 1 \) m) =
   exp \( - O_(kappa \, rho) \( m \) \) . $ <sam:guided-likelihood>]

 The same conclusion, with a changed constant in the exponent,
   holds with a polynomial-time implementation using a bounded number of random bits per operation.]
] <sam:probability>

#proof[
  First use the exact rational distributions. Include the sampled client, mode, menu,
    and menu entry in the history; entries irrelevant to a removal are omitted.
    Fix a guide-supported nonterminal history $gamma$. Let $E_gamma$ be its prescribed mode-and-client event and
    let $p_gamma gt.eq rho$ be that event’s probability in the actual experiment.
    For a particular eligible client, the ratio of its actual mode-and-client probability to its guided
    conditional probability is exactly $p_gamma$. For a ball addition multiply this ratio by the probability of
    its prescribed menu and entry, since the guide makes that choice deterministically.
    Correct upward radii ensure that the ball contains the corresponding comparison center.
    Thus no supported operation is rejected for an empty facility ball or for exceeding the observable limits.
  Along any terminal guided trajectory $gamma$ of length at most $2 m$, multiply these conditional ratios.
    Lemma 9 applies to its full adaptive sequence and bounds the product of its menu losses.
    Consequently the actual cylinder probability of $gamma$ is at least the right-hand side of Equation (4.10)
    times its guided probability. The terminal guided histories form a prefix-free family:
    once the guide’s stopping rule holds, it makes no further draws.
    Their corresponding cylinders in the actual history tree are therefore disjoint.
    Summing over them, and using that the guide stops with total probability one, proves the bound.
    This summation does not select one fixed sequence of leaders;
    it integrates over every client history generated by the guide.
    Nor does it require the actual algorithm to know the stopping predicate:
    it records all prefixes, including the terminal one on every one of these cylinder events.
  For the finite-bit assertion, the rational-arithmetic and dyadic implementation proved below preserves the
    probability of every elementary transition from below by a factor $1 \/ 2$.
    At most $2 m$ such factors change Equation (4.10) by at worst $2^(- 2 m)$, which has the asserted form. ◻
]

=== 4.4 Near clients and the main stopping rule <near-clients-and-the-main-stopping-rule>

The following elementary bound also allows a variable cutoff.

#thm([Lemma 4.5.])[
  (Near-client witnesses).  #emph[Let $n_i > 0$, $a > 1$, and $N_i \( a \) = { p in C_i : d_p^(*) lt.eq
    a macron(d)_i }$. For any nonempty reference set in a metric extension, set $T_i \( a \) =
    sum_(p in N_i \( a \)) d \( p \, H \)$. Then
#[#set math.equation(numbering: n => "(4.11)")
 $ \| N_i \( a \) \| gt.eq \( 1 - 1 \/ a \) n_i \, wide d \( i \, H \) lt.eq a macron(d)_i +
   frac(T_i \( a \), \( 1 - 1 \/ a \) n_i) . $ <sam:general-near-bound>]

 For the main cutoff $N_i = N_i \( 1.2 \)$ and $T_i = sum_(p in N_i) d \( p \, H \)$ one also has
#[#set math.equation(numbering: n => "(4.12)")
 $ d \( i \, H \) lt.eq 1.02 macron(d)_i + frac(60 T_i, n_i) \, wide d \( p \, H \) lt.eq 1.85 d_p^(*) +
   frac(60 T_i, n_i) quad \( p in C_i \\ N_i \) . $ <sam:far-client-bound>]

]
] <sam:near-clients>

#proof[
  If $macron(d)_i > 0$, fewer than $n_i \/ a$ clients have distance strictly greater than $a macron(d)_i$,
    by summing their distances. If $macron(d)_i = 0$, all clients belong to $N_i \( a \)$.
    This proves the population bound in both cases. Choose a client in $N_i \( a \)$ minimizing its reference
    distance; that distance is at most $T_i \( a \) \/ \| N_i \( a \) \|$.
    The triangle inequality through this client proves Equation (4.11).
  Apply the population argument with cutoff $1.02 = 51 \/ 50$.
    The set of clients with $d_p^(*) lt.eq 1.02 macron(d)_i$ has at least $n_i \/ 51 gt.eq
    n_i \/ 60$ members and is contained in $N_i$. Its member of minimum reference distance gives the first
    inequality in Equation (4.12). For $p in.not N_i$, one has $d_p^(*) > 1.2 macron(d)_i$, so
  $ d \( p \, H \) lt.eq d_p^(*) + d \( i \, H \) lt.eq (1 + 1.02 / 1.2) d_p^(*) + frac(60 T_i, n_i) =
    1.85 d_p^(*) + frac(60 T_i, n_i) . $
  If the mean is zero, there are no clients outside $N_i$, and this last assertion is vacuous. ◻
]

A #emph[correct main state] has $Q subset.eq S_0$, a set $A subset.eq cal(B)$ of distinct covered centers,
  and exactly one correct ball per $i in A$, with leader $w_i in N_i$.
  Let $B = cal(B) \\ A$ be the uncovered bad centers and put

#[#set math.equation(numbering: n => "(4.13)")
 $ T_(upright("near")) \( H \) & = sum_(i in B) sum_(p in N_i) d \( p \, H \) \,\
R^(*) & = S_0 \\ Q \, wide I \( H \) = sum_(s in R^(*)) sum_(p in J_s) d \( p \, H \) . $ <sam:stopping-quantities>]

For empty clusters let $N_i = diameter$ and $T_i = 0$. The analytical stopping rule is

#[#set math.equation(numbering: n => "(4.14)")
 $ T_(upright("near")) \( H \) lt.eq kappa P \, wide I \( H \) lt.eq kappa P . $ <sam:stopping-rule>]

#thm([Lemma 4.6.])[
  (Sampling mass).  #emph[At every correct main state with $kappa = 10^(- 6)$,
#[#set math.equation(numbering: n => "(4.15)")
 $ W \( H \) lt.eq 3.42 P + 61 T_(upright("near")) \( H \) . $ <sam:weight-bound>]

 If the first stopping inequality fails, the joint event of sampling a client in $union.big_(i in B)
   N_i$ and choosing ball mode has probability at least
#[#set math.equation(numbering: n => "(4.16)")
 $ rho_kappa = frac(kappa, 2 \( 3.42 + 61 kappa \)) > 0 . $ <sam:progress-constant>]

 If the first stopping inequality holds and the second fails,
   the same lower bound holds for sampling a client assigned to $R^(*)$ and choosing removal mode.]
] <sam:sampling-mass>

#proof[
  Every proxy remains in $S \\ Q$ because $Q subset.eq S_0$.
    The reference distances of good clients therefore sum to at most $P_g + 0.01 P$.
    For a covered bad cluster, its leaf gives the pointwise bound
  #[#set math.equation(numbering: n => "(4.17)")
   $ d \( p \, H \) lt.eq d_p^(*) + r_i + R_i wide \( p in C_i \) . $ <sam:covered-client-bound>]
  Use Equation (4.7), $r_i lt.eq 1.2 macron(d)_i$, and Lemma 7 to obtain, with $P_A = sum_(i in A) P_i$,
  $ sum_(i in A) sum_(p in C_i) d \( p \, H \) lt.eq \( 3.4 + 1.2 kappa \) P_A + 5.2 kappa P . $
  For an uncovered nonempty cluster, retain its near-client cost $T_i$ and sum Equation (4.12) over the others.
    Their number is at most $n_i$, so this cluster contributes at most $1.85 P_i + 61 T_i$.
    Empty clusters contribute zero. With $P_B = sum_(i in B) P_i$ this yields
  $ W \( H \) & lt.eq P_g + 0.01 P + \( 3.4 + 1.2 kappa \) P_A + 5.2 kappa P + 1.85 P_B +
    61 T_(upright("near")) \( H \)\
 & lt.eq \( 3.41 + 6.4 kappa \) P + 61 T_(upright("near")) \( H \) < 3.42 P + 61 T_(upright("near")) \( H \) . $
  Here $P_g + P_A + P_B = P$.
  If $T = T_(upright("near")) \( H \) > kappa P$, the ball event has probability
  $ frac(T, 2 W \( H \)) gt.eq frac(T, 2 \( 3.42 P + 61 T \)) gt.eq rho_kappa . $
  If instead $T lt.eq kappa P$ and $I \( H \) > kappa P$, then $W \( H \) lt.eq \( 3.42 + 61 kappa \) P$.
    The removal event has probability
  $ frac(I \( H \), 2 W \( H \)) > frac(kappa, 2 \( 3.42 + 61 kappa \)) = rho_kappa . $
  In either nonterminal case $W \( H \) > 0$, so the client distribution is defined. ◻
]

#thm([Theorem 4.7.])[
  (A successful sampling prefix).  #emph[Assume the equal-size comparison setup and Equation (4.1), with $1 lt.eq
    m lt.eq M_0$, and use $kappa = 10^(- 6)$. Given $S$ and the correct guesses $P \, m$,
    one run of the actual experiment has, with probability at least $exp \( - C_kappa m \)$ for an absolute
    constant $C_kappa < oo$, a recorded prefix with the following properties:]
  + #emph[$Q subset.eq S_0$, and the balls correspond to distinct $i in A subset.eq cal(B)$, one per such cluster,
    with $w_i in N_i$ and
$ r_i = d \( w_i \, i \) = d \( w_i \, O \) lt.eq R_i lt.eq \( 1 + kappa \) r_i + kappa r^0 \( w_i \) . $

 Consequently $i in cal(F)_i$ and $sum_(i in A) n_i r^0 \( w_i \) lt.eq 5.2 P$.]
  + #emph[For $H$ in Equation (4.6), $B = cal(B) \\ A$, $R^(*) = S_0 \\ Q$, and the nearest assignment sets $J_s$,
$ sum_(i in B) sum_(p in N_i) d \( p \, H \) lt.eq kappa P \, wide
  sum_(s in R^(*)) sum_(p in J_s) d \( p \, H \) lt.eq kappa P . $

]
  + #emph[The reference retains every good proxy. The covered-client bound in Equation (4.17) holds,
    and for each uncovered nonempty cluster the far-client bound in Equation (4.12) holds with $T_i =
    sum_(p in N_i) d \( p \, H \)$.]
  #emph[The run has at most $2 m + 1$ recorded prefixes and takes polynomial time for fixed $kappa$,
    with rational numbers of polynomial bit length. Neither its input nor its stopping decisions require $O$,
    its partition, the proxies, or $S_0$.]
] <sam:successful-prefix>

#proof[
  Define the guide as follows. At a correct state satisfying Equation (4.14), stop.
    Otherwise, if the first inequality fails, condition the actual client-and-mode draw on ball mode and a client
    in $union.big_(i in B) N_i$. Such a client has a unique assigned comparison cluster $i in B$;
    add it to $A$ with the prescribed correct radius and its leaf.
    If only the second inequality fails, condition on removal mode and a client assigned to $R^(*)$,
    and delete that original center. Lemma 12 supplies the same fixed positive lower bound $rho_kappa$ on both
    conditioning events. Every guided ball addition covers a new nonempty bad cluster,
    and every guided removal deletes a new member of $S_0$. Thus all its states remain correct and all good
    proxies persist.
  There are at most $m$ possible removals and at most $m$ distinct clusters that can receive balls.
    If all nonempty bad clusters have received balls and all of $S_0$ has been removed,
    both stopping quantities are zero. More generally, a nonterminal state always has one of the progress
    operations just described. Each such operation increases $\| A \| + \| Q \|$ by one, a quantity at most $2 m$.
    The guide therefore stops within $2 m$ steps. Empty bad clusters can remain in $B$ throughout;
    they never contribute to the stopping quantities or to any division by $n_i$.
  Apply Lemma 10 with $rho = rho_kappa$. Its exponential probability bound gives a recorded terminal prefix,
    and the guide’s invariants give all the stated properties, including Lemma 7 for the radius sum.
    The arithmetic and running-time assertions follow from the implementation below. ◻
]

=== 4.5 Enumeration, precision, and running time <enumeration-precision-and-running-time>

Here are full implementation details for the finite experiments above.
  Let the largest original distance be the positive integer $Delta$.
  For every comparison solution $P$ is an integer satisfying $1 lt.eq P lt.eq n Delta$.
  Enumerating this whole range and $m in { 1 \, dots.h \, min { floor.l M_0 floor.r \,
  h } }$ includes the correct pair. The $m = 0$ candidate is simply $S$.
  These ranges have polynomial size on the integral instance,
  and the experiment for any guessed pair has the same polynomial running-time bound,
  whether or not that guess is correct.

Equation (4.4) computes $r^0 \( w \)$ by sorting $n$ original integer distances and taking the minimum of $n$
  rational numbers. Thus it has polynomial bit length. The first and third menus multiply it by a rational $j
  kappa$, with $j = O_kappa \( m + 1 \)$. The relative menu uses a distance $d \( w \, w' \) +
  R'$ to an existing leaf and divides it by $\( 1 + kappa \)^e$, where $e lt.eq
  E_kappa$ is fixed independently of the input size. In a sequence of at most $2 m$ steps,
  each such dependency therefore increases numerator and denominator bit lengths by at most the bit length of one
  original distance plus a constant depending on $kappa$. All radii have polynomial bit length,
  including on incorrect histories. Distances to leaves, reference minima, client assignments, the total weight,
  and facility-ball membership are consequently computable in polynomial time with rational arithmetic.
  Taking a common denominator for a polynomial number of polynomial-bit weights still uses polynomially many bits:
  the product of their denominators is already such a common denominator, and its bit length is the sum of theirs.

For completeness, exact rational distributions need not be implemented by an unbounded rejection loop.
  At a state, enumerate the full finite one-step outcomes: a client and removal mode, or a client, ball mode,
  menu, and entry. Include undefined choices as outcomes that end the run.
  This is a polynomial number of outcomes for fixed $kappa$, and their exact rational probabilities $p_1 \,
  dots.h \, p_t$ have polynomial bit length. Choose an integer $b$ such that $2^(- b) lt.eq
  p_j \/ 2$ for every positive $p_j$; polynomial bit length makes a polynomial value of $b$ sufficient and
  computable. Assign to outcome $j$ initially $floor.l 2^b p_j floor.r$ of the $2^b$ equiprobable binary strings,
  and assign the leftover strings to any one outcome. The resulting dyadic probability is at least $p_j \/
  2$ for every positive $p_j$. Cumulative integer counts implement the draw using exactly $b$ random bits and
  polynomial arithmetic. All actual transitions retain their specified form,
  and Lemma 10 already accounts for the factor $1 \/ 2$ lost at each transition.
  This proves a polynomial worst-case running-time bound with a bounded number of random bits.

Finally, the factor $exp \( O_kappa \( m \) \)$ is polynomial when $m lt.eq M_0 =
  O \( log N \)$ and $kappa$ is fixed. Repeating the experiment $exp \( O_kappa \( M_0 \) \)
  log \( 1 \/ zeta \)$ times makes the probability of missing all successful prefixes at most $zeta$.
  Each run saves only $2 m + 1$ states. The completion procedure can therefore examine every saved state,
  retain its cheapest feasible output together with the fallback $S$,
  and amplify its own additional success probability without ever recognizing the analytical stopping conditions.

== 5 Completing sampled prefixes and recovering the budget <comp:section>

This section turns the sampled balls into a solution with the original number of facilities.
  Two kinds of removal destinations are treated separately:
  destinations represented by proxies or balls, and destinations at bad comparison facilities for which no ball
  has been sampled. The separation allows the latter destinations to use their actual distances without paying for
  a ball around each of them. We first give the submodular optimization argument,
  then the completion construction, and finally its application to the endpoint of Theorem 13.
  The construction adapts the guessed-ball savings formulation of #cite(label("CGKLL2019")) Section 2.3 and the
  joint addition/removal surrogate of #cite(label("CGLSS2026")) Section 4.6.
  The blue destination optimization below separates centers without sampled balls from the remaining submodular
  choices. The finite maximization proof is a specialization of continuous greedy and partition rounding
  #cite(label("CCPV2011")) Theorem 1.1 and Section 3.3. We prove the complete optimization,
  realization and recovery statements needed here.

=== 5.1 A finite partition-constrained maximization procedure <a-finite-partition-constrained-maximization-procedure>

For a finite set $E$, a function $g : 2^E arrow.r bb(R)_(gt.eq 0)$ is #emph[normalized] if $g \( diameter \) = 0$,
  #emph[monotone] if $g \( U \) lt.eq g \( V \)$ whenever $U subset.eq V$, and #emph[submodular] if

$ g \( U union { e } \) - g \( U \) gt.eq g \( V union { e } \) -
  g \( V \) wide \( U subset.eq V \, med e in.not V \) . $

We write $Delta_e g \( U \) = g \( U union { e } \) - g \( U \)$, with value zero when $e in U$.
  A partition constraint permits at most one element from each part of a specified partition $E =
  E_1 union.sq dots.h.c union.sq E_a$.

#thm([Lemma 5.1.])[
  (Categorical continuous greedy with explicit error).  #emph[Let $g$ be a normalized, monotone,
    submodular function given by an exact value oracle, and let $E$ have a partition into $a$ parts.
    For every $0 < epsilon < 1 - 1 \/ e$, a randomized algorithm uses $"poly" \( \| E \| \, a \, 1 \/ epsilon \)$
    oracle calls and returns a feasible $X$ satisfying
$ bb(E) \[ g \( X \) \] gt.eq \( 1 - 1 \/ e - epsilon \) max { g \( Y \) : \| Y ∩ E_j \| lt.eq
  1 upright(" for all ") j } . $

 Every random draw can be made using a bounded polynomial number of fair bits.
   If the parts are nonempty, filling unoccupied parts preserves the guarantee.
   In particular, one obtains the factor $0.62$; more generally,
   for every fixed rational $theta > 1 \/ e$ with $theta < 1$, one obtains expected gain at least $1 -
   theta$ times the maximum.]
] <comp:partition-max>

#proof[
  Empty parts may be discarded. Write $q = \| E \|$, let $g_max$ denote the maximum in the statement,
    and compute $M_1 = max_(e in E) g \( { e } \)$ using $q$ oracle calls.
    If $E$ is empty or $M_1 = 0$, submodularity and telescoping give $g \( Y \) lt.eq sum_(e in Y) g \( { e } \) =
    0$ for every $Y$, so the conclusion is immediate. Otherwise $a gt.eq 1$ and $0 < M_1 lt.eq g_max$.
  For vectors $x gt.eq 0$ with $sum_(e in E_j) x_e lt.eq 1$,
    independently in each part select $e$ with probability $x_e$,
    and select nothing with the remaining probability. Let $R_x$ be the resulting feasible random set and
    $G \( x \) = bb(E) \[ g \( R_x \) \]$. Multilinearity across the parts gives
  #[#set math.equation(numbering: n => "(5.1)")
   $ partial_e G \( x \) = bb(E) #scale(x: 120%, y: 120%)[\[] Delta_e g \( R_x \\ E_j \)
     #scale(x: 120%, y: 120%)[\]] \, wide e in E_j . $ <comp:categorical-derivative>]
  Every integrand is between zero and $M_1$. For a fixed feasible maximizer $O_g$,
    monotonicity and submodularity give, for every $R_x$,
  $ g_max - g \( R_x \) lt.eq sum_(e in O_g) Delta_e g \( R_x \) lt.eq
    sum_(e in O_g) Delta_e g \( R_x \\ E_(j \( e \)) \) . $
  The last inequality also holds when $e in R_x$, since its left summand is then zero. Thus
  #[#set math.equation(numbering: n => "(5.2)")
   $ sum_(j = 1)^a max_(e in E_j) partial_e G \( x \) gt.eq g_max - G \( x \) . $ <comp:derivative-direction>]
  Choose a dyadic rational $tau$ of bit length $O \( log \( 2 \/ epsilon \) \)$ with $min { epsilon \/ 8 \,
    1 \/ 16 } lt.eq tau lt.eq min { epsilon \/ 4 \, 1 \/ 8 }$ and let $T$ be the smallest power of two at least
    $a^2 \/ tau$. Starting at $x^(\( 0 \)) = 0$, perform $T$ steps.
    At step $t$, estimate every derivative in Equation (5.1), choose a largest estimated derivative in each part,
    and add $1 \/ T$ to each chosen coordinate. Let $v^(\( t \))$ be the zero–one vector of chosen coordinates.
    At time $t$ every part has total mass $t \/ T$, so all iterates and all segments $x^(\( t \)) +
    u v^(\( t \))$, $0 lt.eq u lt.eq 1 \/ T$, are feasible.
  There are $Q_0 = T q$ derivative estimates. For each estimate take the mean of
  $ L = ⌈frac(Q_0 a^2, 4 tau^3)⌉ $
  independent samples of its marginal. Each sample has variance at most $M_1^2 \/ 4$.
    Chebyshev’s inequality shows that the probability of error greater than $tau M_1 \/ a$ is at most $tau \/
    Q_0$. This assertion holds conditionally on every preceding choice,
    because fresh samples are used at the current iterate. The union bound therefore shows that all estimates are
    accurate with probability at least $1 - tau$, even though the iterates are adaptive.
    On this event, the chosen direction obeys
  #[#set math.equation(numbering: n => "(5.3)")
   $ nabla G \( x^(\( t \)) \) dot.op v^(\( t \)) gt.eq g_max - G \( x^(\( t \)) \) -
     2 tau M_1 . $ <comp:estimated-direction>]
  For completeness, the finite step has a controlled integration error.
    Couple a categorical draw at $x$ and at $x + u v$ by changing a part’s outcome only when the additional mass
    $u$ assigned to its selected coordinate is used. Such a change occurs with probability $u$ in each part.
    For a derivative with its own part omitted, the probability that any other part changes is at most $a u$.
    Since the marginal in Equation (5.1) lies in $\[ 0 \, M_1 \]$, its expectation changes by at most $a u M_1$.
    Summing over the $a$ selected coordinates and integrating for $0 lt.eq u lt.eq 1 \/ T$ gives,
    with the slightly looser bound convenient below,
  $ G \( x^(\( t + 1 \)) \) - G \( x^(\( t \)) \) gt.eq frac(g_max - G \( x^(\( t \)) \) - 2 tau M_1, T) -
    frac(a^2 M_1, T^2) gt.eq frac(g_max - G \( x^(\( t \)) \) - 3 tau M_1, T) . $
  Iterating from $G \( 0 \) = 0$ yields
  $ G \( x^(\( T \)) \) gt.eq #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - 1 \/ T \)^T
    #scale(x: 120%, y: 120%)[\)] \( g_max - 3 tau M_1 \) gt.eq \( 1 - 1 \/ e - 3 tau \) g_max . $
  Here $g_max - 3 tau M_1 gt.eq 0$. Sample the final categorical set independently after the estimates.
    On estimation failure its gain is still nonnegative. Consequently its unconditional expected gain is at least
  $ \( 1 - tau \) \( 1 - 1 \/ e - 3 tau \) g_max gt.eq \( 1 - 1 \/ e - 4 tau \) g_max
    gt.eq \( 1 - 1 \/ e - epsilon \) g_max . $
  All categorical probabilities in this algorithm have denominator $T$; one uniform integer in ${ 0 \, dots.h \,
    T - 1 }$ therefore samples each part exactly using $log_2 T$ fair bits.
    The oracle count and the number of such draws are polynomial in the stated parameters.
    In the present application oracle values are rational numbers of polynomial bit length,
    so the arithmetic also takes polynomial time. Monotonicity justifies filling parts.
    Finally $1 - 1 \/ e > 0.6321$, so an error smaller than $0.0121$ gives $0.62$.
    For the last assertion choose a rational $epsilon$ with $0 < epsilon lt.eq theta - 1 \/ e$. ◻
]

=== 5.2 The blue optimization and the red surrogate <the-blue-optimization-and-the-red-surrogate>

Fix $\| S \| = \| O \| = h gt.eq 1$ and an injective proxy map $i mapsto phi.alt_i in
  S$ for the good members of $O$. Let $m > 0$ be the number of bad members and let $S_0$ be the $m$ members of $S$
  not used as proxies. Consider a prefix with $Q subset.eq S_0$ and one ball

$ cal(F)_i = { x in F : d \( w_i \, x \) lt.eq R_i } $

for each $i$ in a subset $A$ of the bad centers. Assume $i in cal(F)_i$, put $r_i = d \( w_i \, i \)$,
  and let $B$ be the remaining bad centers. The algorithm sees the balls but not their indices in $O$.
  As in the sampling section, $delta_i$ is the leaf at distance $R_i$ from $w_i$, $Lambda = { delta_i : i in A }$,
  and $delta_oo$ is the permanent dummy. Thus

$ H = \( S \\ Q \) union Lambda union { delta_oo } . $

Keep the fixed nearest assignments in $H$. For a real $s in S \\ Q$,
  write $J_s$ for its assigned clients and $w'_s = \| J_s \|$.

Set $a = \| A \|$, $c = m - a$, and $r = m - \| Q \|$. The eventual count is illustrated in Figure 1:
  the completion removes $r$ more original facilities and adds at most $a + c = m$ real destinations.
  We now optimize their choices.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.403cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Real anchor#linebreak() $S subset.eq F$#linebreak()$|S|=h$]]])])
  content((5.103, 0), [#box(width: 4.403cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Sampled reference#linebreak() $h-|Q|$ real facilities#linebreak()$a$ leaves and one#linebreak()permanent dummy]]])])
  content((10.21, 0), [#box(width: 4.403cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Real completion#linebreak() remove $r=m-|Q|$ more#linebreak()add at most $a+c=m$#linebreak()keep at most $h$ facilities]]])])
  line((2.201, 0), (2.901, 0), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((7.304, 0), (8.004, 0), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((5.103, -2.346), [#box(width: 15.04cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$ h-|Q|-r+a+c=h$ before merging repeated choices.#linebreak() Ball destinations: at most $a$; destinations without a ball: at most $c=m-a$.]]])])
})],
  caption: [Figure 1: The facility count in completion. The reference contains virtual leaves, but the output contains only members of $F$. A chosen facility in a ball replaces its leaf; a nonempty real solution dominates the permanent dummy. The removals are distinct, while additions are set unions, so overlaps and repeated destinations only reduce the count. The figure describes accounting, not a Euclidean embedding or a disjointness assumption on facility balls. ],
) <fig:completion-budget>

Color every member of $S \\ Q$ green, red, or blue independently.
  Green has probability $1 \/ 2$ and each of red and blue has probability $1 \/ 4$, so two fair bits suffice.
  Enumerate all nonnegative counts $b_(upright("red")) + b_(upright("blue")) = r$.
  A count with too few candidates of a required color is infeasible and is discarded.

The following blue-label construction adapts the color-coding method of
  Alon–Yuster–Zwick #cite(label("AlonYusterZwick1995")) Section 3, Lemma 3.1.
  The weighted block recurrence and its routing-cost analysis are given here.
  For a fixed count $b = b_(upright("blue")) > 0$, assign each blue candidate an independent label in $\[ b \]$.
  It suffices to use a dyadic distribution whose probability for every label is at least $1 \/ \( 2 b \)$:
  sample a uniform integer in ${ 0 \, dots.h \, 2^(ceil.l log_2 b ceil.r) -
  1 }$ and use one plus its remainder modulo $b$. For a nonempty $U subset.eq \[ b \]$, define

#[#set math.equation(numbering: n => "(5.4)")
 $ C \( U \) = min_(x in F) sum_(ell in U) min_(s upright(" blue")\
"label" \( s \) = ell) w'_s d \( s \, x \) . $ <comp:blue-block>]

A missing label makes this value infinite. For every block also store minimizing witnesses $x$ and one removal
  candidate of each label. The subset dynamic program

$ D \( 0 \, diameter \) = 0 \, wide D \( t \, U \) = min_(diameter eq.not V subset.eq U)
  #scale(x: 120%, y: 120%)[\(] C \( V \) + D \( t - 1 \, U \\ V \) #scale(x: 120%, y: 120%)[\)] $

has all other zero-block states infinite; a minimum over an empty collection is also infinite.
  Take $K = min_(1 lt.eq t lt.eq c) D \( t \, \[ b \] \)$, and discard the branch if $K = oo$.
  It selects exactly one blue removal per label and at most $c$ destination facilities.
  If $b > 0$ and $c = 0$ the branch is infeasible. If $b = 0$, set $K =
  0$ and select no blue removal or destination, including when $c = 0$.

The block costs require at most $2^b "poly" \( N \)$ work,
  and the dynamic program requires $O \( c 3^b \)$ additional arithmetic operations.
  It is exact for this labeled optimization: every feasible routing partitions the labels by destination and hence
  has cost at least a corresponding sum of block minima; conversely each finite partition has the stored witnesses
  realizing its value. Distinct labels select distinct removals, because a candidate has only one label.
  Different blocks may use the same destination, which only reduces the number of distinct facilities opened.

Let $E = union.sq.big_(i in A) E_i$ consist of disjoint copies of the facilities in the balls, with $E_i =
  { \( i \, x \) : x in cal(F)_i }$. Distances to a subset of $E$ mean distances to its underlying facilities.
  Ball intersections cause no identification between these copies. For a feasible $X subset.eq E$, put

$ Z = { s : s upright(" green") } union Lambda union { delta_oo } $

and define the finite surrogate

#[#set math.equation(numbering: n => "(5.5)")
 $ Psi \( X \) = K + sum_(p in D) min { d \( p \, H \) \, d \( p \, X \) } +
   "small"_(b_(upright("red"))) { w'_s d \( s \, Z union X \) : s upright(" red") } . $ <comp:surrogate>]

Here $d \( p \, diameter \) = oo$, and $"small"_q$ denotes the sum of the $q$ smallest entries, with $"small"_0 = 0$.

#thm([Lemma 5.2.])[
  (Surrogate realization and submodularity).  #emph[For every finite branch and feasible $X$,
    one can construct a nonempty real solution $U_X subset.eq F$ with $\| U_X \| lt.eq
    h$ and $"cost" \( U_X \) lt.eq Psi \( X \)$. Moreover $g \( X \) = Psi \( diameter \) -
    Psi \( X \)$ is normalized, nonnegative, monotone, and submodular on all subsets of $E$.]
] <comp:surrogate-properties>

#proof[
  Select the $b_(upright("red"))$ red removals attaining the last term of Equation (5.5),
    and use the blue removals and destinations stored by the dynamic program.
    Fill every unused ball with an arbitrary facility in that ball.
    Let $X_(upright("fill"))$ be the underlying filled facility set, $Y_(upright("blue"))$ the blue destinations,
    and $R_(upright("red")) \, R_(upright("blue"))$ the two removal sets. Form
  $ U' = #scale(x: 120%, y: 120%)[\(] S \\ \( Q union R_(upright("red")) union R_(upright("blue")) \)
    #scale(x: 120%, y: 120%)[\)] union X_(upright("fill")) union Y_(upright("blue")) . $
  These are set unions. Since the removal sets are disjoint and have total size $r$,
    and the additions have total size at most $a + c = m$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ \| U' \| lt.eq h - \| Q \| - r + a + c = h . $ <comp:cardinality>]
  This inequality permits repeated ball choices, overlapping balls, coincidences with retained facilities,
    and reopening any member of $Q$ or either removal set. Pad $U'$ to size $h$, if necessary, obtaining $U_X$.
    Padding is possible because $h lt.eq \| F \|$ and makes $U_X$ nonempty.
    Only now invoke domination of the permanent dummy: any real center is within the original diameter of every
    original point. A filled center in $cal(F)_i$ similarly satisfies $d \( y \, X_(upright("fill")) \) lt.eq
    d \( y \, w_i \) + R_i = d \( y \, delta_i \)$ for any original point $y$.
    Every point of $Z$ therefore has its distance from original points attained or improved by the final solution.
  For a client whose minimum in the base term uses $X$, the distance is already attained by $U_X$.
    Otherwise use its fixed assignment in $H$. A retained real center or a dummy is covered by the preceding
    argument. If its assigned center $s$ is removed red, triangle inequality bounds its new distance by
    $d \( p \, H \) + d \( s \, Z union X \)$. If it is removed blue, use $d \( p \, H \) +
    d \( s \, y_s \)$ for its stored destination $y_s$. Charging these additional distances to all $w'_s$ clients
    of a removed center is an upper bound even when some of their base minima use $X$.
    Summing proves $"cost" \( U_X \) lt.eq Psi \( X \)$.
  For submodularity, each client’s base-cost saving is
  $ d \( p \, H \) - min { d \( p \, H \) \, d \( p \, X \) } = max #scale(x: 120%, y: 120%)[\(] 0 \,
    max_(x in X) { d \( p \, H \) - d \( p \, x \) } #scale(x: 120%, y: 120%)[\)] . $
  The maximum of fixed offers has decreasing marginal gains and is monotone.
    If there are no red candidates the red term is zero. Otherwise choose a common $C gt.eq
    max_(s upright(" red")) w'_s d \( s \, Z \)$, and write
  $ v_s \( X \) = C - w'_s d \( s \, Z union X \) = max #scale(x: 120%, y: 120%)[\(] C - w'_s d \( s \, Z \) \,
    max_(x in X) { C - w'_s d \( s \, x \) } #scale(x: 120%, y: 120%)[\)] . $
  The scores $v_s \( X \)$ lie in $\[ 0 \, C \]$. The sum of the $q =
    b_(upright("red"))$ smallest red costs equals $q C$ minus the sum $V_q \( X \)$ of the $q$ largest scores.
    If $C = 0$ or $q = 0$ this term is constant. Otherwise, counting scores above each level gives
  $ V_q \( X \) = integral_0^C min #scale(x: 120%, y: 120%)[\(] q \, \| { s : v_s \( X \) gt.eq
    t } \| #scale(x: 120%, y: 120%)[\)] thin d t . $
  At a fixed level $t$, each selected $x$ covers a fixed set of red centers,
    in addition to a fixed baseline covered set. The marginal of adding $x$ to its coverage count truncated at $q$
    is the minimum of the number of newly covered centers and the remaining capacity below $q$.
    Both numbers can only decrease when the previously selected set grows.
    The integrand is therefore monotone and submodular, and so is its integral.
    The red saving is $V_q \( X \) - V_q \( diameter \)$. Adding the base savings establishes the assertion.
    Identical offers from copies in different balls preserve this reasoning. ◻
]

=== 5.3 A completion inequality with arbitrary slack <a-completion-inequality-with-arbitrary-slack>

We have constructed a computable surrogate, proved that its savings are submodular,
  and realized every feasible choice without exceeding the facility budget.
  We now analyze one favorable color-and-label event. The following statement retains the exact base contribution
  outside the intended removals, which is essential to the refined recovery argument.

#thm([Theorem 5.3.])[
  (Completion of a prefix).  #emph[In the prefix setting above, fix a rational $1 \/ e < theta < 1$. Define
$ R^(*) = S_0 \\ Q \, wide J = union.big_(s in R^(*)) J_s \, wide I = sum_(p in J) d \( p \, H \) \, wide X^(*) =
  { \( i \, i \) : i in A } . $

 For $p in C_i$, let
#[#set math.equation(numbering: n => "(5.7)")
 $ c_p =
   cases(delim: "{", d \( p \, phi.alt_i \) \, & i upright(" good") \,, d_p^(*) + theta \( r_i + R_i \) \, & i in
   A \,, d_p^(*) \, & i in B \,) wide b_p = theta d \( p \, H \) + \( 1 - theta \) min { d \( p \, H \) \,
   d \( p \, X^(*) \) } . $ <comp:client-charges>]

 There is an algorithm, using only $S \, m \, Q$ and the given balls,
   whose outputs always have at most $h$ real facilities and whose work is $exp \( O \( m \) \)
   "poly" \( N \, 1 \/ \( theta - 1 \/ e \) \)$, with polynomial dependence also on the input bit length.
   There is an event in its color and label choices of probability at least $exp \( - O \( m \) \)$ such that,
   for every realization of those choices in the event, its output $U$ satisfies
#[#set math.equation(numbering: n => "(5.8)")
 $ bb(E) \[ "cost" \( U \) \] lt.eq 2 I + sum_(p in J) c_p + sum_(p in.not J) b_p . $ <comp:completion-bound>]

 The expectation is over the remaining optimization randomness.
   For good clients $b_p lt.eq c_p$; for clients of $A$ also $b_p lt.eq c_p$;
   for clients of $B$ one always has $b_p lt.eq d \( p \, H \)$.
   No upper bound on $"cost" \( H \)$, proxy error, or ball radii is needed for this theorem beyond containment of
   $i$ in its designated ball.]
] <comp:completion>

#proof[
  For each feasible count branch, apply Lemma 14 to the function in Lemma 15, with error at most $theta - 1 \/ e$,
    and construct the corresponding $U_X$. Keep the cheapest constructed solution, including $S$ as a fallback.
    For the fixed branch under consideration, the gain guarantee and the feasibility of $X^(*)$ imply
  #[#set math.equation(numbering: n => "(5.9)")
   $ bb(E) \[ "cost" \( U \) \] lt.eq bb(E) \[ Psi \( X \) \] lt.eq
     theta Psi \( diameter \) + \( 1 - theta \) Psi \( X^(*) \) . $ <comp:convex-surrogate>]
  It remains to identify a suitable branch and bound this convex combination.
  For each $s in R^(*)$, minimize the following mixed distance over all comparison destinations,
    resolving ties by a fixed rule:
  #[#set math.equation(numbering: n => "(5.10)")
   $ M_s =
     min
     cases(delim: "{", d \( s \, phi.alt_i \) \, & i upright(" good") \,, \( 1 - theta \) d \( s \, i \) + theta
     #scale(x: 120%, y: 120%)[\(] d \( s \, w_i \) + R_i #scale(x: 120%, y: 120%)[\)] \, & i in A \,, d \( s \,
     i \) \, & i in B .) $ <comp:mixed-distance>]
  Require $s$ to be red for either of the first two destination types and blue for the third.
    Require every proxy used in the first type to be green. The requirements are consistent:
    $R^(*) subset.eq S_0$ whereas all proxies lie outside $S_0$.
    At most $r$ removal centers and at most $r$ proxy destinations receive specified colors,
    so the event has probability at least $4^(- 2 m)$. All other proxies may have any color;
    if the optimization removes one of them, its displacement is paid by the surrogate just as for any other
    removed center.
  Use the count branch equal to the sizes of these designated red and blue sets.
    If the designated blue count is $b > 0$, require their labels to be distinct.
    Its conditional probability is at least
  $ b ! \( 2 b \)^(- b) gt.eq \( 2 e \)^(- b) . $
  The inequality follows, for example, from $log \( b ! \) gt.eq integral_1^b log x thin d x = b log b - b + 1$.
    For $b = 0$ the event has probability one. The blue comparison assigns each designated blue removal to its
    chosen member of $B$. Grouping equal destinations uses at most $\| B \| = c$ blocks,
    so it is feasible for Equation (5.4) and the dynamic program.
    Consequently its $K$ is at most the sum of designated blue charges $w'_s M_s$.
    In particular the successful branch is never infeasible.
  For the designated red subset, at $X = diameter$ a proxy destination is green and a ball destination has its
    leaf in $Z$. At $X = X^(*)$ the corresponding true ball center is also available.
    At each of these two arguments, the optimized sum of smallest red costs is no greater than the sum over this
    same designated red subset. Therefore their convex combination, together with $K$, is at most
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(s in R^(*)) w'_s M_s . $ <comp:removal-comparison>]
  The minimizing red subset need not be the same at the two arguments;
    the fixed designated subset is an admissible upper bound at both.
  For $p in J_s ∩ C_i$ offer its own cluster as a destination in Equation (5.10).
    In the good and uncovered cases, triangle inequality gives respectively $M_s lt.eq d \( p \, H \) +
    d \( p \, phi.alt_i \)$ and $M_s lt.eq d \( p \, H \) + d_p^(*)$. In the covered case it gives
  $ M_s & lt.eq \( 1 - theta \) d \( s \, i \) + theta \( d \( s \, w_i \) + R_i \)\
 & lt.eq d \( p \, H \) + \( 1 - theta \) d_p^(*) + theta \( d_p^(*) + r_i + R_i \) = d \( p \, H \) + c_p . $
  Although $M_s$ is chosen once for all clients of $J_s$, it is no larger than every offered value.
    Summing therefore bounds Equation (5.11) by $I + sum_(p in J) c_p$.
    The base terms of the convex combination contribute at most a further $I$ on $J$,
    and contribute exactly $b_p$ on its complement. Together with Equation (5.9) this proves Equation (5.8).
  For a good client $d \( p \, H \) lt.eq d \( p \, phi.alt_i \)$ since $Q subset.eq S_0$.
    For a covered client, $d \( p \, H \) lt.eq d_p^(*) + r_i + R_i$ and $d \( p \, X^(*) \) lt.eq d_p^(*)$,
    yielding $b_p lt.eq c_p$. The bound for $B$ follows from the definition of $b_p$.
    All complexity statements follow from the $r + 1$ count branches, the subset dynamic program, and Lemma 14.
    The number of copied facilities is at most $a \| F \| lt.eq N^2$,
    and the surrogate can be evaluated using distance lookups and sorting.
    The color and label constructions use bounded numbers of fair bits.
    Combining their probabilities gives the claimed $exp \( - O \( m \) \)$ event. ◻
]

=== 5.4 A quantitative recovery guarantee <a-quantitative-recovery-guarantee>

#thm([Theorem 5.4.])[
  (Single-exponential recovery).  #emph[Suppose $\| S \| = \| O \| = h gt.eq 1$, $P = "cost" \( O \) > 0$,
    and $O$ has an injective proxy map into $S$ for its good centers such that
$ sum_(i upright(" good")) sum_(p in C_i) d \( p \, phi.alt_i \) lt.eq P_g + 0.01 P . $

 Assume the number $m$ of bad centers is at most a supplied bound $M_0$.
   On the positive bounded integral instances used in the body of the proof,
   for every $0 < zeta < 1$ an algorithm knowing only $S \, M_0 \,
   zeta$ returns a real solution of size at most $h$ and cost at most $1.97 P$ with probability at least $1 -
   zeta$. Its running time is
$ exp \( O \( M_0 \) \) "poly" \( N \) log \( 2 \/ zeta \) . $

 In particular this is polynomial time for every fixed constant in $M_0 = O \( log N \)$.
   Local optimality of $S$ is not an additional hypothesis of this theorem.]
] <comp:recovery>

#proof[
  If $m = 0$, the cost of $S$ is at most the displayed proxy-assignment cost, hence at most $1.01 P$.
    The algorithm always retains $S$ as a candidate. Suppose henceforth $m > 0$, and fix $kappa =
    10^(- 6)$ and $theta = 0.38$. Run the sampling procedure of Theorem 13 for at most $2 m$ steps,
    examining every prefix. Its successful prefix has the structure used in Theorem 16, and satisfies
  $ I lt.eq kappa P \, wide T_i := sum_(p in N_i) d \( p \, H \) \, quad sum_(i in B) T_i lt.eq kappa P \, wide
    N_i = { p in C_i : d_p^(*) lt.eq 1.2 macron(d)_i } . $
  Here $macron(d)_i = P_i \/ n_i$ for $n_i > 0$; empty clusters contribute no clients and no terms with
    denominator $n_i$. The same theorem gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ r_i lt.eq 1.2 macron(d)_i \, wide R_i lt.eq \( 1 + kappa \) r_i + kappa r^0 \( w_i \) \, wide
     sum_(i in A) n_i r^0 \( w_i \) lt.eq 5.2 P \,\
d \( p \, H \) lt.eq 1.85 d_p^(*) + 60 T_i \/ n_i quad \( i in B \, med p in C_i \\ N_i \) . $ <comp:main-endpoint>]
  Apply Theorem 16. Good clients, whether inside or outside $J$, contribute at most their proxy-assignment cost.
    Covered bad clients contribute at most
  $ sum_(i in A)
    [P_i + theta n_i #scale(x: 120%, y: 120%)[\(] \( 2 + kappa \) 1.2 macron(d)_i + kappa r^0 \( w_i \)
    #scale(x: 120%, y: 120%)[\)]] . $
  For a remaining bad cluster, clients in $J$ cost at most $d_p^(*)$;
    clients outside $J$ and inside $N_i$ contribute at most $d \( p \, H \)$, whose sum is bounded by $T_i$;
    the other clients are bounded by the last line of Equation (5.12).
    Thus their total is at most $1.85 sum_(i in B) P_i + 61 sum_(i in B) T_i$.
    Including the two copies of $I$ gives the conditional expectation
  $ bb(E) \[ "cost" \( U \) \] & lt.eq 2 kappa P + P_g + 0.01 P\
 & quad +
   sum_(i in A)
   [P_i + theta n_i #scale(x: 120%, y: 120%)[\(] \( 2 + kappa \) 1.2 macron(d)_i + kappa r^0 \( w_i \)
   #scale(x: 120%, y: 120%)[\)]] + 1.85 sum_(i in B) P_i + 61 kappa P\
 & lt.eq [1 + 0.38 \( 2 + 10^(- 6) \) 1.2 + 0.01 + 63 dot.op 10^(- 6) + 0.38 dot.op 5.2 dot.op 10^(- 6)] P\
 & = 1.922065432 P < 1.94 P . $
  In the second inequality the covered-cluster coefficient $1 + 0.38 \( 2 + kappa \) 1.2 =
    1.912000456$ bounds both the good coefficient $1$ and the uncovered coefficient $1.85$.
  The output cost is nonnegative. Markov’s inequality therefore gives,
    conditional on the successful prefix and the color and label event,
  $ Pr { "cost" \( U \) lt.eq 1.97 P } gt.eq 1 - 1.94 / 1.97 = 3 / 197 . $
  The sampling event has probability $exp \( - O_kappa \( m \) \)$ by Theorem 13;
    the completion event has probability $exp \( - O \( m \) \)$.
    Their product with $3 \/ 197$ is at least $exp \( - C m \)$ for an absolute constant $C$ after enlarging $C$,
    since $kappa$ is fixed and $m gt.eq 1$. These are conditional bounds for every successful prefix,
    so they combine without an independence assumption between its shape and the required colors.
  The algorithm need not know the comparison solution, its partition, its proxies, or $P$.
    It enumerates $1 lt.eq m lt.eq min { M_0 \, h }$ and all integer cost guesses $1 lt.eq P lt.eq n Delta$,
    where $Delta$ is the maximum original distance of the bounded integral instance.
    One guess equals the true $P$. For each guess repeat the full sampling and completion experiment $ceil.l
    exp \( C M_0 \) log \( 1 \/ zeta \) ceil.r$ times, taking the best feasible candidate over all prefixes and
    all guesses, including $S$. The chance that every trial for the correct guess fails is at most $zeta$.
    The number of cost guesses is polynomial in $N$, each sampling trial has polynomial work,
    and completion contributes only $exp \( O \( m \) \) "poly" \( N \)$. The stated running time follows.
    All branches, including incorrect guesses, discard prefixes with $\| Q \| > m$ or more than $m$ balls,
    empty facility balls, or impossible counts, and obey Equation (5.6); the fallback also has size $h$.
    Consequently the budget holds on every outcome. The algorithm retains the minimum actual cost without testing
    any condition involving $O$ or recognizing successful events. ◻
]

== 6 Sharper recovery when few clusters are unanchored <ref:section>

The recovery construction admits a sharper analysis when its proxy error is small.
  Its polynomial running time still requires logarithmically many bad clusters.
  Throughout this section distances have the positive integral,
  polynomially bounded representation defined in Section 2, and $N = \| D \| + \| F \|$.

Theorem 1, stated in the introduction, is proved here. The approximation factor has its antecedent in the FPT
  algorithm of #cite(label("CGKLL2019")) Section 2.3; the task here is to obtain it under the explicit proxy
  promise with single-exponential dependence on the number of bad clusters.
  The proof uses the same sampling experiment and completion algorithm as Sections 4–5,
  with a two-stage guide and a sharper accounting of client charges.

We use the notation $P_i = sum_(p in C_i) d_p^(*)$, and put $macron(d)_i = P_i \/ n_i$ when $n_i > 0$.
  Empty clusters have mean zero and all the near sets below are empty. Fix

#[#set math.equation(numbering: n => "(6.1)")
 $ a_1 = 1 + mu \, wide a_2 = 3 / 2 \, wide q = 1 - 1 / a_1 = frac(mu, 1 + mu) \, wide kappa = mu^3 \, wide 1 /
   e < theta lt.eq 1 / e + mu \, $ <ref:parameters>]

where $theta$ is rational. For $z in { 1 \, 2 }$ define

$ N_i^z = { p in C_i : d_p^(*) lt.eq a_z macron(d)_i } . $

All these parameters are fixed before the input is processed.
  The choice of $theta$ is available in Lemma 14; the resulting completion guarantee is Theorem 16.

=== 6.1 A guide with two stopping rules <a-guide-with-two-stopping-rules>

Assume for now that $m > 0$, and let

$ S_0 = S \\ { phi.alt_i : i med upright("good") } \, wide \| S_0 \| = m . $

As in the sampling construction, a state consists of a set $Q subset.eq
  S_0$ of deleted original centers and balls indexed by a set $A$ of distinct bad centers.
  The ball for $i in A$ has a leader $w_i in C_i$, radius $R_i$,
  and leaf dummy $delta_i$ attached to $w_i$ with edge length $R_i$.
  Write $r_i = d \( w_i \, i \) = d \( w_i \, O \)$ and

$ H = \( S \\ Q \) union { delta_i : i in A } union { delta_oo } \, wide B = { i : i med upright("bad") } \\ A . $

Here $delta_oo$ is the permanent diameter dummy of the sampling construction.
  The computable scale and the correct radius guarantee are

#[#set math.equation(numbering: n => "(6.2)")
 $ r^0 \( w \) & = min { z gt.eq 0 : z \| { p in D : d \( w \, p \) lt.eq z } \| gt.eq P \/ m } \,\
r_i & lt.eq R_i lt.eq \( 1 + kappa \) r_i + kappa r^0 \( w_i \) . $ <ref:radius>]

Every original-center assignment uses one fixed tie order; new dummies are appended to that order.
  Denote by $J_s \( H \)$ the clients assigned to $s in S \\ Q$.
  These assignments are defined by the state, whereas the identities of $S_0 \, A \, B$ are used only by the guide.

#thm([Lemma 6.1.])[
  (Two-stage endpoint).  #emph[The blind sampling procedure,
    run for at most $2 m$ steps and retaining all prefixes, has probability at least $exp \( - O_mu \( m \) \)$ of
    producing a prefix with the following properties.]
  #emph[There is an earlier prefix $H^0$, with covered set $A^1$ and remaining bad set $B^0$,
    at which the deleted set is the final set $Q$. Put
$ R^(*) = S_0 \\ Q \, wide J^0 = union.big_(s in R^(*)) J_s \( H^0 \) \, wide T_i =
  sum_(p in N_i^1) d \( p \, H^0 \) quad \( i in B^0 \) . $

 Then
#[#set math.equation(numbering: n => "(6.3)")
 $ sum_(i in B^0) T_i lt.eq kappa P \, wide sum_(p in J^0) d \( p \, H^0 \) lt.eq kappa P . $ <ref:first-stop>]

 For each nonempty cluster $i in B^0$, define $f_i = \| C_i ∩ J^0 \| \/ n_i$.
   All balls added after $H^0$ correspond to a set $A^2 subset.eq { i in B^0 : n_i > 0 \, med f_i < 1 \/ 3 }$,
   and their leaders lie in $N_i^2$; the leaders for $A^1$ lie in $N_i^1$.
   At the final prefix, set $A = A^1 union A^2$, $B = B^0 \\ A^2$, and $J = union.big_(s in R^(*)) J_s \( H \)$. We have
#[#set math.equation(numbering: n => "(6.4)")
 $ J subset.eq J^0 \, wide sum_(p in J) d \( p \, H \) lt.eq kappa P \, wide sum_(i in B : n_i > 0\
f_i < 1 \/ 3) sum_(p in N_i^2) d \( p \, H \) lt.eq kappa P . $ <ref:second-stop>]

 Every ball satisfies Equation (6.2), and the collection satisfies
#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(i in A) n_i r^0 \( w_i \) lt.eq 11 / 2 P . $ <ref:radius-sum>]

 The earlier prefix and the conditions defining it need not be recognized by the algorithm.]
] <ref:two-stage>

#proof[
  The proof specifies a guide inside the same blind sampling procedure.
    For every prescribed mode and eligible client set, the guide draws from the actual law conditioned on that
    event and uses the correct radius-menu entry specified in Lemma 9. At a state of its first stage, write
  $ T \( H \) = sum_(i in B) sum_(p in N_i^1) d \( p \, H \) \, wide I \( H \) =
    sum_(s in S_0 \\ Q) sum_(p in J_s \( H \)) d \( p \, H \) . $
  If $T \( H \) > kappa P$, the guide chooses a ball step whose sampled client belongs to $N_i^1$ for some $i in
    B$. If $T \( H \) lt.eq kappa P$ but $I \( H \) > kappa P$,
    it chooses a removal step whose sampled client is assigned to a member of $S_0 \\ Q$.
    It stops this stage as soon as both inequalities hold in the other direction.
  Here are the probability bounds needed to invoke the general guide lemma.
    Lemma 11 gives $\| N_i^1 \| gt.eq q n_i$ for every nonempty uncovered cluster, and hence
  #[#set math.equation(numbering: n => "(6.6)")
   $ d \( i \, H \) lt.eq a_1 macron(d)_i + frac(sum_(p in N_i^1) d \( p \, H \), q n_i) . $ <ref:near-bound>]
  Indeed, take a member of $N_i^1$ of minimum distance to $H$ and use the triangle inequality.
    Summing the resulting bound for all clients of an uncovered cluster gives
  $ sum_(p in C_i) d \( p \, H \) lt.eq \( 1 + a_1 \) P_i + 1 / q sum_(p in N_i^1) d \( p \, H \) . $
  Good clients have their proxies available. A client of a covered cluster can use its dummy at distance at most
    $d_p^(*) + \( 2 + kappa \) a_2 macron(d)_i + kappa r^0 \( w_i \)$.
    Since every leader used in either stage has $r_i lt.eq a_2 macron(d)_i$,
    Lemma 7 bounds the sum of the last radius terms by $\( 11 \/ 2 \) kappa P$.
    Thus throughout the first stage the total sampling weight $W \( H \) =
    sum_(p in D) d \( p \, H \)$ satisfies the convenient bound
  #[#set math.equation(numbering: n => "(6.7)")
   $ W \( H \) lt.eq 6 P + T \( H \) \/ q . $ <ref:weight>]
  For example, the coefficient of cluster cost before the additive proxy and radius errors is at most
    $1 + \( 2 + kappa \) a_2$, and $1 + \( 2 + kappa \) a_2 + mu + \( 11 \/ 2 \) kappa < 6$ for $0 < mu lt.eq 1 \/ 4$.
  The procedure samples proportionally to this weight and chooses its mode with probability $1 \/ 2$.
    When $T \( H \) > kappa P$, the joint event prescribed by the guide has probability at least
  $ frac(T \( H \), 2 \( 6 P + T \( H \) \/ q \)) gt.eq rho_mu := frac(kappa, 2 \( 6 + kappa \/ q \)) > 0 . $
  When only the removal condition fails, its joint event has the same lower bound by Equation (6.7).
    A zero total weight already satisfies both stopping conditions.
    At the first stop call the state $H^0$ and use the notation of the statement; this proves Equation (6.3).
  In the second stage the guide deletes no further original centers. The eligible centers are fixed using $H^0$:
    they are precisely the nonempty $i in B^0$ with $f_i < 1 \/ 3$.
    While the final sum in Equation (6.4) exceeds $kappa P$, the guide adds a ball whose leader is in $N_i^2$ for
    an eligible, still uncovered center $i$. All reference distances can only decrease after $H^0$, so
  $ W \( H \) lt.eq W \( H^0 \) lt.eq \( 6 + kappa \/ q \) P . $
  The prescribed joint event therefore again has probability at least $rho_mu$.
    Its termination gives the last inequality in Equation (6.4).
  The reference set only grows during this stage, and the order between old choices is fixed.
    A client that was assigned outside the fixed set $R^(*)$ cannot become assigned to it upon adding choices.
    Consequently $J subset.eq J^0$, and monotonicity of distances gives the internal-cost bound in Equation (6.4).
  Across both stages each step either deletes a fresh member of $S_0$ or covers a fresh bad center.
    Thus there are at most $2 m$ steps in total. All leaves persist across the transition.
    Lemma 9 therefore applies once to the entire trajectory: its disjoint-ball amortization bounds the sum of
    costly radius-menu indices across both stages. Correct radii satisfy Equation (6.2),
    and Lemma 7 gives Equation (6.5) because $a_1 lt.eq a_2 = 3 \/ 2$.
    The joint progress probabilities just proved and the global radius budget meet the hypotheses of Lemma 10.
    That lemma gives the claimed $exp \( - O_mu \( m \) \)$ probability.
    In particular, its guide may switch stages using the unobserved state $H^0$:
    the actual procedure continues its ordinary sampling and mode choices and retains every prefix. ◻
]

=== 6.2 The completion charges <the-completion-charges>

Fix a successful endpoint from Lemma 18. Apply Theorem 16 with parameter $theta$ and the surrogate $Psi$ defined
  there. Its comparison choice in the copied ball parts is $X^(*) = { \( i \, i \) : i in A }$,
  with distances evaluated at the underlying facilities. Conditional on its successful colors and labels,
  it returns a solution of cardinality at most $h$, and its expected cost is at most

#[#set math.equation(numbering: n => "(6.8)")
 $ 2 I + sum_(p in J) c_p + sum_(p in.not J) b_p \, wide I = sum_(p in J) d \( p \, H \) \, $ <ref:completion-bound>]

where, for $p in C_i$,

$ c_p =
  cases(delim: "{", d \( p \, phi.alt_i \) \, & i med upright("good") \,, d_p^(*) + theta \( r_i + R_i \) \, & i
  in A \,, d_p^(*) \, & i in B \,) wide b_p = theta d \( p \, H \) + \( 1 - theta \) min { d \( p \, H \) \,
  d \( p \, X^(*) \) } . $

As usual a distance to the empty set is $+ oo$. Keeping the exact expression for $b_p$ permits different estimates
  on the two groups of covered clusters.

#thm([Lemma 6.2.])[
  (Refined charge bound).  #emph[For the endpoint above, the cost bound in Equation (6.8) is at most
#[#set math.equation(numbering: n => "(6.9)")
 $ (1 + 2 theta a_1 + mu + 11 kappa + kappa / q) P lt.eq \( 1 + 2 \/ e + 6 mu \) P . $ <ref:explicit-bound>]

]
] <ref:charges>

#proof[
  For each cluster let $C_i^(upright("chg"))$ denote the sum of its $c_p$ terms on $J$ and its $b_p$ terms outside
    $J$. We account for these charges first, and then for $2 I$.
  ===== 6.2.1 Good clusters. <good-clusters.>
  Their proxies remain in $H$, so $b_p lt.eq d \( p \, H \) lt.eq d \( p \, phi.alt_i \)$.
    Together with the definition of $c_p$, their total charge is at most $P_g + mu P$.
  ===== 6.2.2 Clusters covered in the first stage. <clusters-covered-in-the-first-stage.>
  For $i in A^1$, the comparison choice $X^(*)$ offers center $i$, and its dummy gives $d \( p \, H \) lt.eq
    d_p^(*) + r_i + R_i$. Thus both types of client charge are at most $d_p^(*) + theta \( r_i + R_i \)$.
    Since $r_i lt.eq a_1 macron(d)_i$,
  #[#set math.equation(numbering: n => "(6.10)")
   $ C_i^(upright("chg")) lt.eq \( 1 + 2 theta a_1 \) P_i + theta kappa a_1 P_i +
     theta kappa n_i r^0 \( w_i \) . $ <ref:first-covered>]
  ===== 6.2.3 Clusters covered in the second stage. <clusters-covered-in-the-second-stage.>
  For a nonempty $i in A^2$, put $x_i = \| C_i ∩ J \| \/ n_i lt.eq f_i < 1 \/ 3$.
    On $J$ use the ball charge with $r_i lt.eq a_2 macron(d)_i$.
    Outside $J$, use the center $i$ offered by $X^(*)$ and the first-stage estimate in Equation (6.6) at $H^0$:
  $ b_p lt.eq d_p^(*) + theta (a_1 macron(d)_i + frac(T_i, q n_i)) . $
  It follows that
  #[#set math.equation(numbering: n => "(6.11)")
   $ C_i^(upright("chg")) & lt.eq P_i + theta #scale(x: 120%, y: 120%)[\(] 2 a_2 x_i + \( 1 - x_i \) a_1
     #scale(x: 120%, y: 120%)[\)] P_i + theta kappa a_2 x_i P_i + theta kappa x_i n_i r^0 \( w_i \) +
     frac(theta \( 1 - x_i \) T_i, q)\
 & lt.eq \( 1 + 2 theta \) P_i + theta kappa a_2 x_i P_i + theta kappa x_i n_i r^0 \( w_i \) + T_i /
   q . $ <ref:second-covered>]
  For the last inequality, $2 a_2 - a_1 = 2 - mu > 0$ and
  #[#set math.equation(numbering: n => "(6.12)")
   $ 2 a_2 x_i + \( 1 - x_i \) a_1 lt.eq 3 f_i + \( 1 - f_i \) \( 1 + mu \) lt.eq 5 / 3 + frac(2 mu, 3) lt.eq
     2 . $ <ref:second-coefficient>]
  In particular this coefficient estimate uses the fraction at the first stop and the inclusion $J subset.eq J^0$.
  ===== 6.2.4 Remaining clusters with $f_i gt.eq 1 \/ 3$. <remaining-clusters-with-f_ige13.>
  Clients in $J$ have charge $d_p^(*)$. Clients in $J^0 \\ J$ have $b_p lt.eq d \( p \, H \) lt.eq
    d \( p \, H^0 \)$. For the at most $\( 2 \/ 3 \) n_i$ clients outside $J^0$, use $b_p lt.eq
    d \( p \, H \) lt.eq d_p^(*) + a_1 macron(d)_i + T_i \/ \( q n_i \)$. Consequently
  #[#set math.equation(numbering: n => "(6.13)")
   $ C_i^(upright("chg")) lt.eq (1 + 2 / 3 a_1) P_i + T_i / q + E_i^(+) \, wide E_i^(+) =
     sum_(p in C_i ∩ \( J^0 \\ J \)) d \( p \, H^0 \) . $ <ref:uncovered-large>]
  The sum of $E_i^(+)$ over this group of clusters is at most $kappa P$ by Equation (6.3).
  ===== 6.2.5 Remaining clusters with $f_i < 1 \/ 3$. <remaining-clusters-with-f_i13.>
  Again clients in $J$ have charge $d_p^(*)$. For clients outside $J$ that lie in $N_i^2$,
    retain the base bound $b_p lt.eq d \( p \, H \)$. Every other client outside $J$ has $d_p^(*) > a_2
    macron(d)_i$, whence
  $ b_p lt.eq d_p^(*) + a_1 macron(d)_i + frac(T_i, q n_i) lt.eq (1 + 2 / 3 a_1) d_p^(*) + frac(T_i, q n_i) . $
  Thus
  #[#set math.equation(numbering: n => "(6.14)")
   $ C_i^(upright("chg")) lt.eq (1 + 2 / 3 a_1) P_i + T_i / q + E_i^(-) \, wide E_i^(-) =
     sum_(p in \( C_i ∩ N_i^2 \) \\ J) d \( p \, H \) . $ <ref:uncovered-small>]
  The sum of $E_i^(-)$ over these remaining eligible clusters is at most $kappa P$ by Equation (6.4).
    Empty clusters have zero charge and require none of the divisions above.
  ===== 6.2.6 Summing the errors once. <summing-the-errors-once.>
  The main coefficient for every bad cluster is bounded by $1 + 2 theta a_1$:
    this follows from $a_1 gt.eq 1$ and $theta > 1 \/ e > 1 \/ 3$.
    The $T_i \/ q$ terms in Equations (6.11), (6.13), and (6.14) concern disjoint subsets of $B^0$.
    Their total is therefore at most $kappa P \/ q$. The radius errors from Equations (6.10) and (6.11) together
    are at most
  $ theta kappa
    (a_1 sum_(i in A^1) P_i + a_2 sum_(i in A^2) x_i P_i + sum_(i in A^1) n_i r^0 \( w_i \) + sum_(i in A^2) x_i
    n_i r^0 \( w_i \)) lt.eq 7 theta kappa P lt.eq 7 kappa P . $
  Here $a_1 lt.eq a_2 = 3 \/ 2$, $x_i lt.eq 1$, and Equation (6.5) are used globally.
    The two negligible base-cost sums contribute at most $2 kappa P$, and $2 I lt.eq 2 kappa P$.
    Along with the proxy error, these bounds establish the bound by the first expression in Equation (6.9).
  Finally, Equation (6.1) implies
  $ 2 theta a_1 + mu + 11 kappa + kappa / q lt.eq 2 / e + (3 + 2 / e) mu + 3 mu^2 + 12 mu^3 lt.eq 2 / e + 6 mu . $
  For the last step, $mu lt.eq 1 \/ 4$ gives $3 mu^2 + 12 mu^3 lt.eq \( 3 \/ 2 \) mu$, and $3 + 2 \/ e +
    3 \/ 2 < 6$. In particular the cumulative sampling and radius errors are $O \( kappa + kappa \/ q \) P =
    O \( mu^2 \) P$; the linear error comes from the proxies, $a_1 - 1$, and $theta - 1 \/ e$. ◻
]

=== 6.3 Extraction, running time, and scope <extraction-running-time-and-scope>

#proof[
  The algorithm retains $S$ as a feasible candidate. When $m = 0$,
    Equation (1.1) gives $"cost" \( S \) lt.eq \( 1 + mu \) P$, which suffices.
    For $m > 0$, first consider the branch with the correct guesses of $P$ and $m$.
    Lemma 18 produces a suitable prefix with probability at least $exp \( - O_mu \( m \) \)$.
    Completion is attempted at every prefix. Theorem 16 supplies the needed colors and labels with probability
    $exp \( - O \( m \) \)$ and always respects the cardinality bound. Conditional on these choices, Lemma 19 gives
  $ bb(E) \[ "cost" \( hat(S) \) \] lt.eq \( 1 + 2 \/ e + 6 mu \) P lt.eq \( 1 + 2 \/ e + epsilon \/ 2 \) P . $
  By nonnegativity of cost, Markov’s inequality therefore gives conditional probability at least
  $ 1 - frac(1 + 2 \/ e + epsilon \/ 2, 1 + 2 \/ e + epsilon) = frac(epsilon, 2 \( 1 + 2 \/ e + epsilon \)) > 0 $
  of meeting the stated target. One full trial consequently succeeds with probability
    $exp \( - O_(mu \, epsilon) \( m \) \)$.
  If $Delta$ is the largest distance in the scaled input, then the unknown integer $P$ belongs to ${ 1 \,
    dots.h \, n Delta }$. Try all these values and all $m lt.eq min { h \, floor.l L_0 log N floor.r }$.
    The sampling menus are finite and have polynomial bit complexity by Lemmas 7 and 9;
    their single-exponential probability cost has already been accounted for over the whole trajectory.
    Each completion uses $exp \( O \( m \) \) "poly" \( N \)$ work for fixed $theta$, by Theorem 16.
    Repeating the trials $exp \( O_(mu \, epsilon) \( L_0 log N \) \) log \( 1 \/ zeta \)$ times,
    with the constant enlarged if necessary, makes the failure probability at most $zeta$.
    All enumerations, repetitions, and prefix completions therefore take polynomial time for the fixed parameters.
    Take the cheapest feasible candidate; no successful guide, stopping state, coloring,
    or comparison solution needs to be identified. ◻
]

The proxy accuracy in Theorem 1 is supplied by the parameterized anchoring theorem whenever its hypotheses hold.
  Specifically, Theorem 6 gives error $mu P$ and bad count at most $C_mu P \/ b$, with the finite constant

$ C_mu = 10 + 600 / mu thin 2^(ceil.l 40 \/ mu ceil.r - 1) . $

Thus if $P \/ b = O \( log N \)$, its output satisfies the required logarithmic bound,
  with a constant depending on $mu$. Declaring every comparison cluster bad also gives the hypothesis when $h =
  O \( log N \)$. The low-sensitivity part of the main argument supplies no logarithmic bound on this bad count.
  Its guarantee therefore remains the fixed improvement below $2$ proved there;
  Theorem 1 sharpens the recovery component within the scope of Equation (1.1).

== 7 The surplus construction and its execution certificate <imp:section>

This section specifies the external algorithmic input and derives the history properties used below.
  The input is the construction of Cohen-Addad, Grandoni, Lee, Schwiegelshohn,
  and Svensson #cite(label("CGLSS2026")), in the version arXiv:2503.10972v2 dated 19 May 2026.
  We use its logarithmic-surplus construction and its robust dual analysis.
  The strictness proof below will be applied to the resulting certificate.

Throughout this section, clients and facilities are distinct indexed points,
  all distances between distinct original indices are positive integers bounded by a fixed polynomial in $N =
  n + \| F \|$, and $n > 0$. Fix a sufficiently small rational $v in \( 0 \, 1 \/ 6 \)$ and put

$ delta = 3 v \, wide K = 1 + v^2 \, wide lambda = 2 f > 0 \, wide \[ x \]^(+) = max { x \, 0 } . $

The parameter $v$ is the small parameter denoted by $epsilon$ in the source’s Section 3;
  the final approximation slack in its Theorem 1.2 need not have the same value.

=== 7.1 The sequence data and the external result <the-sequence-data-and-the-external-result>

A free copy $tilde(i)$ of a regular facility $i in F$ has a specified length $u \( tilde(i) \) gt.eq 0$.
  Attach it as a leaf at $i$. Thus

$ d \( p \, tilde(i) \) = d \( p \, i \) + u \( tilde(i) \) \, wide d \( tilde(i) \, tilde(j) \) =
  u \( tilde(i) \) + d \( i \, j \) + u \( tilde(j) \) $

for distinct copies. Zero-length leaves may be identified metrically while retaining their labels for accounting.
  In particular all triangle inequalities used below hold. Each copy’s length is fixed throughout the execution
  considered here.

Here is the relevant sequence definition, stated with our notation.
  At phase value $z$ and a set $W$ of facilities define

$ A_W = { j in D : z < \( 1 - delta \) d \( j \, W \) } \, wide I_W = D \\ A_W . $

The convention $d \( j \, diameter \) = + oo$ is used only when every client is active.
  A regular facility $i$ is $eta$-openable relative to $\( z \, W \)$ if there are bids $\( tau_j \)_(j in A_W)$
  satisfying

#[#set math.equation(numbering: n => "(7.1)")
 $ tau_j & = z &  & \( j in A_W \, med d \( i \, j \) > v z \) \,\
z lt.eq tau_j & lt.eq
  min { K z \, \( 1 - delta \) d \( j \, W \) } &  & \( j in A_W \, med d \( i \, j \) lt.eq v z \) \,
  $ <imp:near-bids>]

and the payment and dual conditions

#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(j in A_W) \[ tau_j - \( 1 - delta \) d \( i \, j \) \]^(+) & +
   sum_(j in I_W) \[ \( 1 - delta \) d \( j \, W \) - \( 1 - delta \) d \( i \, j \) \]^(+)\
 & gt.eq lambda - n eta \, $ <imp:opening-payment>]

#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(j in A_W) \[ tau_j - d \( i_0 \, j \) \]^(+) +
   sum_(j in I_W) \[ tau_a - 2 d \( i_0 \, j \) - d \( i_0 \, a \) \]^(+) lt.eq
   lambda wide \( i_0 in F \, med a in A_W \) . $ <imp:opening-dual>]

Testing $i_0 in F$ also tests free copies: replacing $i_0$ by a free copy only increases the distances subtracted
  in (7.3). These are Definition 3 of #cite(label("CGLSS2026"));
  $0$-openable means openable with the exact payment requirement.

Suppose the actual set at the start of a phase is $Q$. A phase sequence $H = \( a_1 \, dots.h \, a_s \)$ is
  $eta$-valid if every entry is either a free copy or a regular facility $eta$-openable against some witness

$ W_t supset.eq Q union { a_1 \, dots.h \, a_(t - 1) } \, $

and no unopened regular facility is $0$-openable against the actual set $Q union { a_1 \, dots.h \,
  a_s }$ after the sequence. This last requirement is maximality for #emph[exact] openability,
  even when $eta > 0$. A solution of valid sequences consists of such sequences at successive phase values $1 \,
  K \, K^2 \, dots.h$ and ends with all clients inactive. This is Definition 4 of #cite(label("CGLSS2026")).

#thm([Theorem 7.1.])[
  (Surplus construction).  #emph[For the metric range above and fixed $v$,
    the construction underlying Theorem 1.2 of #cite(label("CGLSS2026")) can be run in polynomial time at any
    target $2 lt.eq h lt.eq \| F \|$. With precision $eta = 2^(- N)$, its output has one of the following forms.]
  + #emph[A solution of $eta$-valid sequences with exactly $h$ distinct regular facilities and at most $L =
    O_v \( log N \)$ free copies, for some final price $f > 0$ and specified final copy lengths.]
  + #emph[A solution of $0$-valid sequences containing only regular facilities, at price $f = N^(- 2)$,
    with at most $h$ facilities.]
  #emph[One common integer $L$ can be used for all targets on an instance.
    For every regular opening, the algorithm also returns its witness set and certified bids.]
] <imp:cglss>

The merging procedure is the external ingredient: Algorithm 3 (#smallcaps[LogAdaptive]), Definitions 3–4,
  and Section 3.5 (#smallcaps[MergeSolutions]) of #cite(label("CGLSS2026")).
  Its target counts regular facilities before projection of free copies.
  Section 7.3 justifies the price range, precision, interpolation endpoints and copy lengths used here;
  these choices are part of the stated construction.

Before that verification, we prove what follows from any valid-sequence output of either form.
  Fix its final price and copy lengths and replay only its returned sequences.
  The preceding interpolation search is not part of this history.
  The next lemma derives all budget inequalities from this replay,
  including the final dual and its free-opening case. Its no-overbidding invariant will also justify the disabling
  length in Section 7.3.

=== 7.2 One execution supplies all the inequalities <one-execution-supplies-all-the-inequalities>

#thm([Lemma 7.2.])[
  (Surplus solution with a compatible history).  #emph[Given valid sequences of either output form in Theorem 20,
    with their price, fixed copy lengths, opening witnesses and certified bids,
    a polynomial-time replay produces final budgets $\( alpha_p \)_(p in D)$ and a real solution $U subset.eq
    F$ of size at most $h + L$ with the following properties.]
  #emph[The history replays the #emph[final] sequences using their fixed final price and fixed final copy lengths.
    Each atomic step opens one facility or performs one simultaneous phase update.
    Its actual pre-step and post-step open sets satisfy $Q_t^(-) subset.eq Q_t^(+)$,
    and these sets accumulate throughout the history. We call a client’s transition to inactivity its removal from
    the active set. Let $t \( p \)$ be the step at which $p$ becomes inactive and $z_p$ the phase value
    immediately #emph[before] that step. At this pre-step state all active clients have budget $z_p$, and
#[#set math.equation(numbering: n => "(7.4)")
 $ z_p & lt.eq \( 1 - delta \) d \( p \, Q_(t \( p \))^(-) \) \,\
alpha_p & lt.eq K z_p \,\
\( 1 - delta \) d \( p \, Q_(t \( p \))^(+) \) & lt.eq alpha_p lt.eq K z_p . $ <imp:active-threshold>]

 The distance on the left of (7.4) cannot increase at any later step.
   If $I_t$ is the actual inactive set just before step $t = t \( p \)$, then, for every regular facility $i in F$,
#[#set math.equation(numbering: n => "(7.5)")
 $ sum_(j in.not I_t) \[ z_p - d \( i \, j \) \]^(+) +
   sum_(j in I_t) \[ \( 1 - delta \) d \( j \, Q_t^(-) \) - d \( i \, j \) \]^(+) lt.eq lambda . $ <imp:no-overbid>]

 For these same final budgets, the dual inequality is
#[#set math.equation(numbering: n => "(7.6)")
 $ sum_(p in D) \[ alpha_p - 2 d \( i \, p \) \]^(+) lt.eq lambda wide \( i in F \) . $ <imp:dual>]

]
  #emph[In the normal branch the history opens exactly $h$ paid regular facilities before projecting free copies, and
#[#set math.equation(numbering: n => "(7.7)")
 $ \( 1 - delta \) "cost" \( U \) + h \( lambda - N eta \) lt.eq sum_(p in D) alpha_p \, wide eta =
   2^(- N) . $ <imp:payment>]

 In the small-price branch, $\| U \| lt.eq h$, $lambda = 2 \/ N^2$, $eta = 0$, and, writing $r = \| U \|$,
   the stronger exact-payment inequality is
#[#set math.equation(numbering: n => "(7.8)")
 $ \( 1 - delta \) "cost" \( U \) + r lambda lt.eq sum_(p in D) alpha_p . $ <imp:small-payment>]

 In particular its paid term can be dropped. For every nonempty real comparison solution $H subset.eq F$ one also has
#[#set math.equation(numbering: n => "(7.9)")
 $ sum_(p in D) alpha_p lt.eq \| H \| lambda + 2 "cost" \( H \) . $ <imp:comparison>]

]
] <imp:surplus-history>

#proof[
  Fix the supplied valid sequences, price and copy lengths. This proof uses their validity.
    No facility deletion, change of price, or movement of a free copy during the construction’s search is used as
    a step of this history. Write $beta_j$ for a transient budget, reserving $alpha_j$ for its final value.
    Initialize $Q = diameter$, $z = 1$, and $beta_j = 1$ for all clients.
  ===== 7.2.1 Witness sets and actual updates. <witness-sets-and-actual-updates.>
  At a regular opening with witness $W supset.eq Q$, one has $A_W subset.eq A_Q$ and $I_Q subset.eq I_W$.
    Use the certified bid $tau_j$ for $j in A_W$ and the unchanged bid $z$ for $j in A_Q \\ A_W$.
    Budgets of already inactive clients stay fixed. Every actual active client whose budget increases lies within
    $v z$ of the newly opened regular facility. It therefore immediately becomes inactive, since
  $ \( 1 - delta \) d \( j \, Q union { i } \) lt.eq \( 1 - delta \) v z < z lt.eq tau_j . $
  Consequently every client remaining active has its old budget $z$.
    At a free opening no budgets increase and the same conclusion holds.
    At a phase update, with old value $z$, each active budget becomes
  $ beta'_j = min { K z \, \( 1 - delta \) d \( j \, Q \) } \; $
  clients reaching the second value become inactive, and all others have budget $K z$, the next phase value.
    This proves inductively both the common active budget and the identity $A = A_Q$ at every atomic boundary.
    It gives the strict form of (7.4) whenever the right side is finite.
  When a regular opening inactivates a client, its final bid is at most $K
    z_p$ and at least its new scaled connection distance. Inactivation during a free opening has final bid exactly
    $z_p$. At inactivation during a phase update, the final bid equals the scaled connection distance and is at
    most $K z_p$. In every case the bid is frozen after removal from the active set.
    This proves (7.4)–(7.4), using the old phase value also for a phase-update removal.
    Since $Q$ only grows in the fixed metric extension, later connection distances cannot increase.
    Several removals in one atomic step all use the same pre-step value and pre-step set;
    an ordering of tied clients does not insert fictitious intermediate states.
  ===== 7.2.2 No overbidding at actual atomic boundaries. <no-overbidding-at-actual-atomic-boundaries.>
  We include the invariant argument corresponding to Claim 10, Equation (33),
    in Appendix A.2 of #cite(label("CGLSS2026")). At a boundary set $c_j = \( 1 - delta \) d \( j \, Q \)$ and define
  $ B_i = sum_(j in A) \[ z - d \( i \, j \) \]^(+) + sum_(j in I) \[ c_j - d \( i \, j \) \]^(+) . $
  Initially $B_i = 0$ because all client–facility distances are at least one.
    An opening cannot increase any client’s term. Old inactive clients have smaller or unchanged $c_j$;
    an active client that stays active keeps $z$; and an active client that becomes inactive has new $c_j lt.eq
    z$. The latter assertion holds even if its bid increased,
    because an increased bid is possible only within $v z$ of the opening facility.
    A free opening has the same monotonicity without bid increases.
    This proves preservation at opening steps, including openings witnessed by supersets.
  Consider a phase update after a maximal phase sequence. For its old active set put $b_j \( t \) = min { t \,
    c_j }$ for $z lt.eq t lt.eq K z$, and define
  $ B_i \( t \) = sum_(j in A) \[ b_j \( t \) - d \( i \, j \) \]^(+) + sum_(j in I) \[ c_j - d \( i \, j \) \]^(+) . $
  At $t = K z$ this is precisely the invariant after the simultaneous update, including newly inactive clients.
    If some $B_i \( K z \) > lambda$, continuity gives a first $t_(*)
    in \[ z \, K z \]$ at which some such facility $i$ has $B_i \( t_(*) \) = lambda$;
    choose the first crossing among all regular facilities. Then $B_(i_0) \( t_(*) \) lt.eq
    lambda$ for every $i_0 in F$. Such an $i$ is unopened, since a facility in $Q$ has $B_i \( t \) =
    0$ for all these $t$.
  Offer $tau_j = b_j \( t_(*) \)$ for $d \( i \, j \) lt.eq v z$ and $tau_j = z$ otherwise.
    These bids satisfy the two update restrictions. For an outside client, $delta d \( i \, j \) gt.eq
    3 v^2 z gt.eq v^2 z$, so
  $ z - \( 1 - delta \) d \( i \, j \) gt.eq b_j \( t_(*) \) - d \( i \, j \) . $
  For a nearby client this comparison holds immediately with $z$ replaced by $b_j \( t_(*) \)$.
    Also $\[ c_j - \( 1 - delta \) d \( i \, j \) \]^(+) gt.eq \[ c_j - d \( i \, j \) \]^(+)$ for an inactive
    client. Thus these bids pay at least $B_i \( t_(*) \) = lambda$.
    Finally, for every $a in A$, $j in I$, and $i_0 in F$, the triangle inequality and $tau_a lt.eq c_a$ give
  $ tau_a - d \( i_0 \, a \) - 2 d \( i_0 \, j \) & lt.eq \( 1 - delta \) d \( j \, Q \) - d \( i_0 \, j \)\
 & = c_j - d \( i_0 \, j \) . $
  Since $tau_j lt.eq b_j \( t_(*) \)$ for active $j$, the left side of (7.3) is at most $B_(i_0) \( t_(*) \) lt.eq
    lambda$. Hence $i$ is $0$-openable against the actual set $Q$, contradicting maximality.
    This proves the invariant through phase updates and establishes (7.5) at precisely the required states.
  ===== 7.2.3 Payment with witness supersets. <payment-with-witness-supersets.>
  The certificate’s payment can be checked directly by a potential argument;
    this is the accounting in Lemma A.1 and Equation (32) of #cite(label("CGLSS2026")).
    First compare a regular opening’s witness payments with its actual payments.
    For $j in A_Q \\ A_W$ we have $z gt.eq \( 1 - delta \) d \( j \, W \)$, whence
  $ \[ z - \( 1 - delta \) d \( i \, j \) \]^(+)
    gt.eq \[ \( 1 - delta \) d \( j \, W \) - \( 1 - delta \) d \( i \, j \) \]^(+) . $
  For $j in I_Q$, replacing $W$ by $Q subset.eq W$ only increases the available saving.
    Clients in $A_W$ keep their certified bids. Therefore (7.2) remains valid against the #emph[actual] prefix
    with the extended actual bids.
  Let $r_Q$ count regular facilities opened in the actual prefix. At every boundary consider
  $ cal(P) = sum_(j in I) #scale(x: 120%, y: 120%)[\(] beta_j - \( 1 - delta \) d \( j \, Q \)
    #scale(x: 120%, y: 120%)[\)] - r_Q \( lambda - n eta \) . $
  Initially it is zero. At a regular opening, already inactive clients contribute their nonnegative connection
    savings. For an old active client a positive contribution $\[ tau_j - \( 1 - delta \) d \( i \, j \) \]^(+)$
    makes it inactive, and its new slack $tau_j - \( 1 - delta \)
    d \( j \, Q union { i } \)$ is at least that contribution.
    The total increase before the paid-facility term is therefore at least $lambda - n eta$.
    At a free opening, old inactive slacks can only increase and new inactive slacks are nonnegative.
    At a phase update, the new inactive clients have zero slack, while the old terms and $r_Q$ are unchanged.
    Thus $cal(P) gt.eq 0$ always. At termination, writing $V$ for the final virtual facilities and $r$ for its
    regular count, this gives
  #[#set math.equation(numbering: n => "(7.10)")
   $ \( 1 - delta \) sum_(j in D) d \( j \, V \) + r \( lambda - n eta \) lt.eq
     sum_(j in D) alpha_j . $ <imp:virtual-payment>]
  ===== 7.2.4 The final dual on this replay. <the-final-dual-on-this-replay.>
  We prove (7.6) for the budgets just constructed. The source defines this execution in Section 3.4 and
    immediately before Appendix A.1. Its final-dual statement is Lemma A.2, used to prove Theorem 3.10.
    Our argument follows Lemmas A.2–A.3 and Equations (34)–(38) of #cite(label("CGLSS2026")) Appendix A.2,
    whose regular-opening argument already handles witness supersets.
    We give the rows explicitly, including the case where the first facility that freezes the comparison facility
    is free. That case needs the no-overbidding invariant in place of an opening-dual condition.
  Fix $i in F$, write $d_j = d \( i \, j \)$, and put
  $ D^(*) = { j in D : alpha_j > 2 d_j } \, wide m = \| D^(*) \| . $
  There is nothing to prove if $m = 0$. Order $D^(*)$ by removal step,
    breaking ties by nondecreasing final budget $alpha_j$, and then arbitrarily between equal budgets.
    Write $j prec k$ and $j succ.curly.eq k$ for this order. This auxiliary order is specific to the present dual
    proof; it imposes no restriction on the arbitrary order of simultaneous removals allowed in the later
    strictness argument. In particular it does not create intermediate states within an atomic step.
  An opening of $h$ at phase value $z$ #emph[freezes] $i$ if $d \( i \, h \) lt.eq \( 1 + 3 v \) z \/ 2$.
    We use only the first such opening, if there is one. We first establish the following row for each contributor
    $k$ removed strictly before that opening, or for every $k in D^(*)$ if no opening freezes $i$:
  #[#set math.equation(numbering: n => "(7.11)")
   $ sum_(j in D^(*)\
j succ.curly.eq k) \[ alpha_k - d_j \]^(+) + sum_(j in D^(*)\
j prec k) \[ alpha_k - 2 d_j - d_k \]^(+) lt.eq lambda . $ <imp:pre-freeze-row>]
  The elementary comparison used below is that, for a nonempty actual prefix $Q$,
    $c_j = \( 1 - delta \) d \( j \, Q \)$, and $u lt.eq c_k$,
  #[#set math.equation(numbering: n => "(7.12)")
   $ u - 2 d_j - d_k lt.eq c_j - d_j . $ <imp:triangle-row>]
  Indeed, $d \( k \, Q \) lt.eq d_k + d_j + d \( j \, Q \)$, and multiplication by $1 - delta lt.eq
    1$ proves the assertion. When $Q = diameter$ there are no inactive clients,
    so none of the applications to inactive clients below is needed.
  Suppose first that $k$ is removed by opening $h$ at phase value $z$, before $i$ is frozen.
    No contributor can have its budget increased by this opening:
    such an increase would require $d \( h \, j \) lt.eq v z$, whereas
  $ 2 d_j gt.eq 2 d \( i \, h \) - 2 d \( h \, j \) > \( 1 + v \) z gt.eq K z gt.eq alpha_j \, $
  contradicting $j in D^(*)$. Thus $alpha_k = z$. Apply no overbidding at the actual boundary immediately before
    the opening. Every $j succ.curly.eq k$ is then active, so its term is exactly $\[ alpha_k - d_j \]^(+)$.
    A $j prec k$ removed in the same opening is also still active at this boundary,
    and its term $\[ z - d_j \]^(+)$ dominates $\[ alpha_k - 2 d_j - d_k \]^(+)$.
    Any remaining $j prec k$ is already inactive; actual activity of $k$ gives $alpha_k = z < c_k$,
    so (7.12) gives the required domination for $j$. Discarding noncontributors proves (7.11).
  Suppose instead that a simultaneous phase update removes $k$, with old phase value $z$.
    Use the no-overbidding invariant at the actual #emph[post-update] boundary.
    The set $Q$ is unchanged and $alpha_k = c_k lt.eq K z$. Clients still active have budget $K z$,
    which dominates the budget appearing in either term of (7.11). For an inactive $j prec k$, use (7.12).
    An inactive $j succ.curly.eq k$ must have been removed in this same update.
    Therefore $c_j = alpha_j gt.eq alpha_k$, where the last inequality is precisely the reason for the
    final-budget tie rule. Its invariant term dominates $\[ alpha_k - d_j \]^(+)$.
    This proves (7.11) also for phase-update removals.
  If no opening freezes $i$, sum (7.11) over all $k in D^(*)$. Replace each positive part by its argument.
    Each budget has coefficient $m$. If $j$ has rank $q$, its distance occurs with coefficient $q +
    2 \( m - q \) + \( q - 1 \) = 2 m - 1$. Hence
  $ m sum_(j in D^(*)) alpha_j - \( 2 m - 1 \) sum_(j in D^(*)) d_j lt.eq m lambda \, $
  which implies $sum_(j in D^(*)) \( alpha_j - 2 d_j \) lt.eq lambda$.
  It remains to consider a first freezing opening $h$ at phase value $z$.
    Let $Q \, A \, I$ be the actual state immediately before it,
    and let $b_j$ be the extended actual bid used at this opening:
    certified bids for witness-active clients and $z$ for the other active clients if $h$ is regular, and $b_j =
    z$ for all $j in A$ if $h$ is free. Every $j in A ∩ D^(*)$ is removed at this opening and has $alpha_j = b_j$.
    To see this, suppose that $j$ remains active. Then $z lt.eq b_j < \( 1 - delta \) d \( j \, h \)$.
    Every later actual prefix, and thus every later witness, contains $h$.
    Phase updates and certified bid updates are consequently capped by $\( 1 - delta \) d \( j \, h \)$;
    unchanged active bids also satisfy this bound. It follows that $alpha_j lt.eq \( 1 - delta \) d \( j \, h \)$. But
  $ 2 d_j gt.eq 2 d \( j \, h \) - \( 1 + 3 v \) z > #scale(x: 120%, y: 120%)[\(]
    2 - \( 1 + 3 v \) \( 1 - delta \) #scale(x: 120%, y: 120%)[\)] d \( j \, h \) = \( 1 + 9 v^2 \)
    d \( j \, h \) > alpha_j \, $
  a contradiction. This argument applies to free and regular openings and uses only containment of the actual
    prefix in future witnesses.
  Write $R = I ∩ D^(*)$. These contributors precede the freezing opening, so they retain all rows (7.11).
    If $h$ is regular, let $W supset.eq Q$ be its witness and set
  $ P = A_W ∩ D^(*) \, wide T = \( A \\ A_W \) ∩ D^(*) . $
  For $j in P$ the certified bid equals $alpha_j$, whereas for $j in T$ the unchanged actual bid gives $alpha_j =
    z$. Restricting (7.3) to contributors gives, for every $k in P$,
  #[#set math.equation(numbering: n => "(7.13)")
   $ sum_(j in P) \[ alpha_j - d_j \]^(+) + sum_(j in R union T) \[ alpha_k - 2 d_j - d_k \]^(+) lt.eq
     lambda . $ <imp:witness-freeze-row>]
  For each $k in T$, apply actual no overbidding immediately before the opening.
    The active budget is $z = alpha_k$, and $k$ is actually active, so $alpha_k < c_k$.
    Using (7.12) for inactive clients gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ sum_(j in P union T) \[ alpha_k - d_j \]^(+) + sum_(j in R) \[ alpha_k - 2 d_j - d_k \]^(+) lt.eq
     lambda . $ <imp:unchanged-freeze-row>]
  Thus actual-active but witness-inactive contributors use the actual invariant,
    without assuming that the two active sets coincide.
  If $h$ is free, set $P = diameter$ and $T = A ∩ D^(*)$. The preceding freezing argument shows that every $k in
    T$ is removed by this free opening with $alpha_k = z$. The same actual pre-opening invariant and (7.12) prove
    (7.14) for each such $k$. No witness or opening-dual condition is needed for the free opening.
    This supplies the free first-freezing case omitted by the invocation of an opening-dual condition in the cited
    proof.
  In either case put $r = \| R \|$, $p = \| P \|$, and $t = \| T \|$, so $m = r + p + t$.
    Sum (7.11) for $k in R$, (7.13) for $k in P$, and (7.14) for $k in T$,
    replacing every positive part by its argument. Each budget has coefficient $m$:
    for $R$ and $T$ it occurs $m$ times in its own row, and for $P$ it occurs in the first sum of each of the $p$
    rows indexed by $P$ and $m - p$ times in its own second sum. The distance coefficients are
  $ upright("client class") & upright("coefficient calculation") & upright("coefficient")\
j in R upright(", rank ") q upright(" in ") R & q + 2 \( r - q \) + \( q - 1 \) + 2 p + 2 t & 2 m - 1\
j in T & r + 2 p + t + r & 2 m - t\
j in P & r + t + p + \( r + t \) & 2 m - p . $
  Consequently
  $ m sum_(j in D^(*)) alpha_j - \( 2 m - 1 \) sum_(j in R) d_j - \( 2 m - t \) sum_(j in T) d_j - \( 2 m - p \)
    sum_(j in P) d_j lt.eq m lambda . $
  Every displayed distance coefficient is at most $2 m$; subtracting the remaining nonnegative distance terms and
    dividing by $m$ proves
  $ sum_(j in D) \[ alpha_j - 2 d \( i \, j \) \]^(+) = sum_(j in D^(*)) \( alpha_j - 2 d_j \) lt.eq lambda . $
  This is (7.6) for the same final budgets used in the payment argument.
    It also holds for each free copy by distance domination, although only $i in F$ is needed here.
  ===== 7.2.5 Projection and cardinality. <projection-and-cardinality.>
  Project each free copy of $i$ to $i$ and discard duplicate locations, giving $U subset.eq F$.
    For every client, $d \( j \, U \) lt.eq d \( j \, V \)$, so projection can only decrease cost.
    In the normal branch $r = h$ before projection and $\| U \| lt.eq h + L$;
    substituting into (7.10) and using $n lt.eq N$ proves (7.7).
    Coincident projected locations do not reduce the number $h$ of paid regular facilities in that inequality.
    In the unmerged branch there are no free copies, $r = \| U \| lt.eq h$, and $eta = 0$, giving (7.8).
    Finally assign every client to its nearest facility of a nonempty $H$. For each $i in H$, the elementary bound
  $ sum_(j upright(" assigned to ") i) alpha_j lt.eq 2 sum_(j upright(" assigned to ") i) d \( i \, j \) +
    sum_(j in D) \[ alpha_j - 2 d \( i \, j \) \]^(+) $
  and (7.6) give (7.9) upon summation. All statements therefore use one and the same history and budgets. ◻
]

=== 7.3 Instantiating the construction <imp:instantiation>

We now verify the choices needed for Theorem 20. The merging procedure itself is that of #cite(label("CGLSS2026"))
  Section 3.5. It uses at most three free copies per phase and stops at exactly the target number of regular
  facilities. We check its endpoints and parameter transfers for the metric range and precision used here.

===== 7.3.1 Price range and precision. <price-range-and-precision.>

Initialize at $f = N^(- 2)$ and retain the source’s upper price $4 n M$, where $M$ bounds all original distances.
  At this upper endpoint, the first opening in an unmerged execution satisfies $n K z gt.eq lambda = 8 n M$,
  since every active bid is at most $K z$. Hence $z > M$, that opening makes all clients inactive,
  and the total subsequent switching payment is at most $n M < lambda$.
  The upper-endpoint solution therefore has one facility, as required to bracket $h gt.eq 2$.
  At the lower endpoint only cardinality is tested: if the unmerged run has at most $h$ facilities,
  return it as the small-price alternative. Section 9 proves its cost bound using strictness.

Perform each binary search to parameter difference at most $eta \/ 2$, where $eta = 2^(- N)$.
  A price difference of at most $eta \/ 2$ changes $lambda = 2 f$ by at most $eta lt.eq n eta$;
  a copy-length difference of at most $eta \/ 2$ changes the total payment by at most $n eta \/ 2$.
  Thus the source’s parameter-transfer argument supplies the stated $eta$-valid sequences, including when $n = 1$.
  The source maintains a common $eta$-valid prefix of earlier phases and transfers a current $0$-valid phase
  across one changed parameter #cite(label("CGLSS2026")) Section 3.5.
  Thus the per-opening validity tolerance is not compounded from phase to phase.

The transfer also preserves the unrelaxed opening-dual condition.
  Here is the scaled comparison needed when a client becomes inactive under a changed copy length,
  completing the corresponding calculation in #cite(label("CGLSS2026")) Section 3.5.1, Claim 2.
  Use the new metric $d$ and witness $W$, and put $t = 1 - delta$.
  If $j$ was active and becomes witness-inactive while $ell$ remains witness-active,
  the former active bid $tau_j$, old phase value $z$, and new clipped bid $tau'_ell$ satisfy

$ tau_j & gt.eq z gt.eq t thin d \( j \, W \)\
 & gt.eq t thin d \( ell \, W \) - t thin d \( j \, ell \)\
 & gt.eq tau'_ell - d \( j \, i_0 \) - d \( ell \, i_0 \) wide \( i_0 in F \) . $

Subtracting $d \( i_0 \, j \)$ and taking positive parts shows that the former active term dominates the new
  inactive dual term. The scaled distance $t thin d \( j \, W \)$, rather than $d \( j \, W \)$,
  is what the transfer hypothesis supplies. Together with clipping of surviving active bids,
  this is the dual comparison; the payment tolerance is not added to the dual inequality.

Witnesses and bids can be retained explicitly through the merge.
  Deleting an earlier entry preserves the superset relation for an inherited witness;
  a parameter transfer clips its inherited bids at the new caps;
  and a newly completed entry uses its actual prefix. These are polynomial-size certificates.
  Fix deterministic LP and tie-breaking choices in the source’s completion subroutine when comparing two
  interpolation endpoints.

===== 7.3.2 Paid counts at interpolation endpoints. <paid-counts-at-interpolation-endpoints.>

At a zero-length-copy endpoint, a regular facility and its free copy are geometrically coincident but have
  different paid counts. In particular, the corresponding continuations can differ by one regular facility;
  the geometric endpoint identities in #cite(label("CGLSS2026")) Section 3.5.2, Case 2; Section 3.5.3,
  Claim 5 and Case 3 must not be used as equalities of paid counts.
  Test each endpoint explicitly for the target count $h$. If an endpoint has count $h$, return it;
  otherwise a change by one cannot pass from strictly below $h$ to strictly above $h$.
  This gives the needed integer bracketing for the interpolation while preserving exactly $h$ paid regular
  facilities in the normal branch. No claim of exactly $h$ distinct projected facilities is used.

===== 7.3.3 Disabling copies and bounding the phase count. <disabling-copies-and-bounding-the-phase-count.>

Replace the fixed disabling length $10 M$ used for free copies in the source’s Section 3.5 by $20 N M$.
  This ensures that the endpoint of a copy-length search has no effect except the copy’s label.
  Indeed, the no-overbidding invariant in Lemma 21 depends only on valid sequences.
  For any active client $j$ at any atomic boundary it implies $\[ z - d \( i \, j \) \]^(+) lt.eq
  lambda$ for every regular $i$, and hence

$ z lt.eq M + lambda lt.eq Z := M + 8 N M . $

An inactive client’s scaled connection distance is at most its frozen budget, which is at most $K Z$.
  Since $v < 1 \/ 6$ and $N gt.eq 3$,

$ K Z lt.eq 37 / 36 \( M + 8 N M \) < 10 N M < \( 1 - delta \) 20 N M . $

A copy of length $20 N M$ therefore cannot inactivate an active client, bind any bid cap at most $K z$,
  or reduce an inactive client’s connection distance. These observations apply also to witness sets:
  their scaled inactive connection distances are at most $z$, and their active bid caps are at most $K z$.
  The disabling endpoint consequently leaves all subsequent openability tests and updates unchanged.

All these parameters have polynomial bit length. Their binary searches remain polynomial.
  The bound $z lt.eq Z$ and geometric phase growth give $O_v \( log N \)$ possible active phase indices,
  uniformly over the search range. Multiplying a common phase bound by the source’s at most three free copies per
  phase gives the asserted uniform $L$.

===== 7.3.4 Precision and parameter order. <precision-and-parameter-order.>

The total payment error in the normal branch is

#[#set math.equation(numbering: n => "(7.15)")
 $ e = h N eta lt.eq N^2 2^(- N) . $ <imp:precision>]

For every fixed $v > 0$ there is a fixed $N_v$ such that $N^2 2^(- N) lt.eq v$ for all $N gt.eq N_v$.
  Every positive integral comparison cost $P$ is at least one, so $e lt.eq v P$ in that range.
  The binary representation of $eta$ has $O \( N \)$ bits. Increasing the constant in $L =
  O_v \( log N \)$ can place every $N < N_v$ in the branch $k lt.eq 2 L$,
  where the logarithmic recovery procedure is used instead.
  Thus constants in the local and strictness arguments can be chosen first, then $v$,
  then the common surplus bound and its fixed-size enlargement.
  No dependence of those earlier constants on $L$ is introduced.

== 8 Strictness at a bounded opening price <str:section>

Bounded-price strictness was quantified in the factor-revealing analysis of #cite(label("CGLS2026")) Appendix B,
  Corollary 2, following the JMS dual-fitting framework #cite(label("JMS2002")) #cite(label("JainEtAl2003")).
  That work proves the gap $1 \/ \[ 4 \( 7 + 3 T \) \]$ for its JMS program.
  Moreover, its fixed-size dual construction in Appendix B.1–B.3 applies to the relaxed scalar inequalities used
  below: it does not need either ordered phase variables or the first-connection constraint.
  It gives a stronger gap than the constant we will use. The contribution of this section is a different
  elementary proof, through a suffix maximum and two slack bounds,
  followed by an explicit transfer to the fixed valid-sequence replay.
  We retain a small explicit gap because that is sufficient for the payment argument.

Write $\[ x \]_(+) = max { x \, 0 }$. The following argument uses the history of one fixed final valid sequence
  from Lemma 21. In particular, all prices, free-copy lengths, budgets,
  and client-removal times below belong to that one replay. Put $t = 1 - delta$ and $K = 1 + v^2$.
  The opened sets in the replay increase, although the algorithm that finds the final sequence need not have this
  monotonicity.

#thm([Lemma 8.1.])[
  (Bounded-price strictness).  #emph[For $T > 0$ define
#[#set math.equation(numbering: n => "(8.1)")
 $ B = T + 2 \, wide rho = frac(1, 200 B) \, wide c \( T \) = rho^2 / 100 > 0 . $ <str:constants>]

 Assume $0 lt.eq delta < 1$, $0 < v lt.eq 1$, and
#[#set math.equation(numbering: n => "(8.2)")
 $ v^2 lt.eq frac(c \( T \), 6 \( T + 2 \)) . $ <str:v-condition>]

 For any regular facility $i in F$ and nonempty client set $C subset.eq D$ of positive cost $P_C =
   sum_(p in C) d \( i \, p \)$, the history in Lemma 21 satisfies
#[#set math.equation(numbering: n => "(8.3)")
 $ lambda lt.eq T P_C quad arrow.r.double quad sum_(p in C) alpha_p lt.eq lambda +
   (2 - frac(c \( T \), 2)) P_C . $ <str:conclusion>]

 The set $C$ need not be a cluster of the algorithm or of an optimal solution.]
] <str:strictness>

#proof[
  We first turn the replay inequalities into a scalar suffix inequality.
    After normalizing the cluster cost, two lower bounds on its slack rule out a small total deficit:
    a tail index would force a large suffix maximum, while an early interval would then carry too much slack.
    The last step transfers the resulting gap to final budgets.
  #emph[Client-removal order and a suffix inequality.] Index the $q = \| C \|$ clients as $1 \, dots.h \,
    q$ by their removal step in the fixed replay, breaking ties within an atomic step arbitrarily.
    This order is used only for the present suffix proof; the final-dual proof in Section 7 sorts tied removals by
    final budget. For client $p$, let $Q_p^(-)$ denote the opened set immediately before its removal step,
    and let $z_p$ be the phase value at that pre-step state. Thus clients removed in one atomic step have the same
    $Q_p^(-)$ and $z_p$. Set
  $ d_p = d \( i \, p \) \, wide a_p = z_p / K . $
  The imported history properties are
  #[#set math.equation(numbering: n => "(8.4)")
   $ z_p lt.eq t thin d \( p \, Q_p^(-) \) \, wide alpha_p lt.eq K z_p \, wide t thin d \( p \, Q_p^(+) \) lt.eq
     K z_p \, $ <str:history-used>]
  where $Q_p^(+)$ is the immediately post-step opened set, together with nonincreasing distances after that step.
    The pre-step no-overbidding inequality at $i$ is
  #[#set math.equation(numbering: n => "(8.5)")
   $ sum_(j upright(" active")) \[ z_p - d \( i \, j \) \]_(+) +
     sum_(j upright(" inactive")) \[ t thin d \( j \, Q_p^(-) \) - d \( i \, j \) \]_(+) lt.eq
     lambda . $ <str:no-overbid>]
  All sums in Equation (8.5) initially range over $D$.
  For $j < p$ define
  $ r_(j p) =
    cases(delim: "{", t thin d \( j \, Q_p^(-) \) \/ K \, & j upright(" is already inactive before the step of ")
    p \,, z_p \, & j upright(" is removed in the same atomic step as ") p .) $
  For fixed $j$, this quantity is nonincreasing as $p > j$ advances.
    Indeed it is constant within the removal step of $j$; at the first subsequent step,
    Equation (8.4) gives $t thin d \( j \, Q_p^(-) \) \/ K lt.eq z_j$; and thereafter the opened set only grows.
    This explains why the value for a tied removal is $z_p$, even though the scaled variable used elsewhere is $a_p$.
  If $j$ is already inactive, the triangle inequality in the fixed metric extension and Equation (8.4) give
  $ r_(j p) gt.eq t / K #scale(x: 120%, y: 120%)[\(] d \( p \, Q_p^(-) \) -
    d \( p \, j \) #scale(x: 120%, y: 120%)[\)] gt.eq a_p - t / K \( d_p + d_j \) gt.eq a_p - d_p - d_j . $
  For a tied removal the same conclusion follows from $r_(j p) = z_p gt.eq a_p$. Consequently, with
  $ A_p = max_(s gt.eq p) \( a_s - d_s \) \, $
  monotonicity implies, for every $j < p$ and $s gt.eq p$,
  $ r_(j p) gt.eq r_(j s) gt.eq a_s - d_s - d_j \, wide upright("and hence") wide r_(j p) gt.eq A_p - d_j . $
  The contribution of $j < p$ in Equation (8.5) is at least $\[ r_(j p) - d_j \]_(+)$:
    this is immediate for a tied removal, and follows from $K gt.eq 1$ for an inactive client.
    Each $j gt.eq p$ is active in the pre-step state of $p$, including all tied removals,
    and contributes at least $\[ a_p - d_j \]_(+)$. Dropping clients outside $C$ therefore proves
  #[#set math.equation(numbering: n => "(8.6)")
   $ sum_(j gt.eq p) \[ a_p - d_j \]_(+) + sum_(j < p) \[ A_p - 2 d_j \]_(+) lt.eq
     lambda wide \( 1 lt.eq p lt.eq q \) . $ <str:suffix>]
  #emph[Two slack bounds and their exact sum.] Divide all costs, phases, and budgets by $P_C$,
    retaining their notation. Now $sum_j d_j = 1$ and $lambda lt.eq T$. Write $D_(p - 1) = sum_(j < p) d_j$ and define
  #[#set math.equation(numbering: n => "(8.7)")
   $ E_p = lambda + 1 + D_(p - 1) + \( p - 1 \) d_p - q a_p . $ <str:slack-definition>]
  Expanding $\[ x \]_(+) = x + \[ - x \]_(+)$ in Equation (8.6) yields
  #[#set math.equation(numbering: n => "(8.8)")
   $ E_p med & gt.eq \( p - 1 \) \( A_p - a_p + d_p \) + sum_(j gt.eq p) \[ d_j - a_p \]_(+) +
     sum_(j < p) \[ 2 d_j - A_p \]_(+)\
 & gt.eq \( p - 1 \) \( A_p - a_p + d_p \) gt.eq 0 . $ <str:slack-envelope>]
  Alternatively, first replace $A_p$ in Equation (8.6) by its lower bound $a_p - d_p$, and then expand. This gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ E_p gt.eq sum_(j gt.eq p) \[ d_j - a_p \]_(+) + sum_(j < p) \[ 2 d_j + d_p - a_p \]_(+) gt.eq
     sum_j \[ d_j - a_p \]_(+) . $ <str:slack-truncation>]
  In the sum of $D_(p - 1) + \( p - 1 \) d_p$ over $p$, the coefficient of $d_j$ is $\( q - j \) + \( j - 1 \) =
    q - 1$. Thus the following identity is exact:
  #[#set math.equation(numbering: n => "(8.10)")
   $ overline(E) := 1 / q sum_(p = 1)^q E_p = lambda + 2 - 1 / q - sum_(p = 1)^q a_p . $ <str:slack-identity>]
  #emph[A small deficit would concentrate neither distance nor slack.] For a contradiction suppose
  $ Delta := lambda + 2 - sum_p a_p < c \, wide c = c \( T \) . $
  Equations (8.8) and (8.10) imply
  #[#set math.equation(numbering: n => "(8.11)")
   $ 0 lt.eq overline(E) = Delta - 1 \/ q < c \, wide 1 \/ q < c \, wide q > 1 \/ c > 4 \/ rho . $ <str:small-deficit>]
  The function $F \( x \) = sum_j \[ d_j - x \]_(+)$ is convex and nonincreasing.
    Since Equation (8.10) also gives $sum_p a_p lt.eq lambda + 2 - 1 \/ q < B$,
    Jensen’s inequality and Equation (8.9) imply
  #[#set math.equation(numbering: n => "(8.12)")
   $ F \( B \/ q \) lt.eq F (1 / q sum_p a_p) lt.eq 1 / q sum_p F \( a_p \) lt.eq overline(E) < c . $ <str:jensen>]
  For every index set $J$ with $\| J \| lt.eq 2 rho q$, it follows that
  #[#set math.equation(numbering: n => "(8.13)")
   $ sum_(j in J) d_j lt.eq \| J \| B \/ q + F \( B \/ q \) < 2 rho B + c = 1 / 100 + c < 1 /
     50 . $ <str:small-set-mass>]
  #emph[Finding a tail index with both required bounds.] Equation (8.12) shows that fewer than $c q \/
    B$ indices have $d_j > 2 B \/ q$, because each such index contributes more than $B \/ q$ to $F \( B \/ q \)$.
    Equation (8.11) shows that fewer than $10 c q$ indices have $E_j > 1 \/ 10$. Put $r = floor.l rho q floor.r$.
    The tail of exactly $r$ indices is larger than the union of these two exceptional sets: indeed
  $ r / q gt.eq rho - 1 / q > rho - c > \( 10 + 1 \/ B \) c . $
  For the last strict inequality, $B > 2$ and $rho < 1 \/ 400$ give $\( 11 + 1 \/ B \) c < 12 rho^2 \/ 100 < rho$.
    Hence some $s in { q - r + 1 \, dots.h \, q }$ satisfies
  #[#set math.equation(numbering: n => "(8.14)")
   $ d_s lt.eq 2 B \/ q \, wide E_s lt.eq 1 \/ 10 . $ <str:tail-index>]
  The suffix starting at $s$ has at most $r lt.eq rho q$ indices, so Equation (8.13) gives $D_(s - 1) > 49 \/ 50$.
    Also $\( q - s + 1 \) d_s lt.eq r \( 2 B \/ q \) lt.eq 2 rho B = 1 \/ 100$.
    Rearranging Equation (8.7) therefore yields
  #[#set math.equation(numbering: n => "(8.15)")
   $ q \( a_s - d_s \) = lambda + 1 + D_(s - 1) - \( q - s + 1 \) d_s - E_s > lambda + 1.87 > lambda +
     1.8 . $ <str:tail-large>]
  #emph[An early interval forces too much slack.] Consider the integer interval
  $ I = { ceil.l rho q ceil.r \, dots.h \, floor.l 2 rho q floor.r } . $
  For $p in I$, the prefix of length $p - 1$ has at most $2 rho q$ indices.
    Using $E_p \, d_p gt.eq 0$ and Equation (8.13) gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ q \( a_p - d_p \) = lambda + 1 + D_(p - 1) - \( q - p + 1 \) d_p - E_p < lambda + 1.02 . $ <str:early-small>]
  Every $p in I$ precedes $s$: indeed $p lt.eq 2 rho q < \( 1 - rho \) q + 1 lt.eq q - r + 1 lt.eq s$.
    Thus $A_p gt.eq a_s - d_s$, and Equations (8.8), (8.15), and (8.16) imply
  $ E_p gt.eq \( p - 1 \) \( A_p - a_p + d_p \) > frac(0.7 \( p - 1 \), q) . $
  To check the integer rounding, set $x = rho q > 4$. Then
  $ \| I \| = floor.l 2 x floor.r - ceil.l x ceil.r + 1 > x - 1 > x \/ 2 \, wide p - 1 gt.eq ceil.l x ceil.r -
    1 gt.eq x - 1 > x \/ 2 quad \( p in I \) . $
  Consequently
  $ overline(E) gt.eq 1 / q sum_(p in I) E_p > 0.7 / q^2 x / 2 x / 2 = 0.175 rho^2 > rho^2 / 100 = c \, $
  contradicting Equation (8.11). We have proved $sum_p a_p lt.eq lambda + 2 - c$.
  #emph[Returning to the final budgets.] By Equation (8.4), $alpha_p lt.eq K^2 a_p$.
    As $v lt.eq 1$, $K^2 - 1 = 2 v^2 + v^4 lt.eq 3 v^2$, whence
  $ sum_p alpha_p lt.eq K^2 sum_p a_p lt.eq lambda + 2 - c + \( K^2 - 1 \) B lt.eq lambda + 2 - c \/ 2 $
  by Equation (8.2). Multiplication by $P_C$ proves Equation (8.3). ◻
]

== 9 The low sensitivity case <sur:section>

The goal in this section is to turn a small change in optimum cost under budget reduction into a strict
  improvement below $2$. We start from the surplus solution, improve it by local search,
  and use its same replay to bound the opening price. If the bad clusters carry little cost,
  the weighted swap bound suffices. Otherwise enough of their cost has bounded price for strictness to improve the
  total while preserving every regular-facility payment.

We now fix the parameters used for this part of the algorithm.
  Let $C_0 = C_(1 \/ 100)$ be the constant in Theorem 6; explicitly, the construction there permits

$ C_0 = 10 + 60000 thin 2^3999 . $

Set $T = 200 C_0$ and $c = c \( T \)$ as in Lemma 22. Choose a fixed positive rational $v$ in the range of
  Theorem 20 satisfying

#[#set math.equation(numbering: n => "(9.1)")
 $ v lt.eq min {1 / 12 \, c / 1000} \, wide v^2 lt.eq frac(c, 6 \( T + 2 \)) \, wide delta =
   3 v . $ <sur:parameter-choices>]

Fix $0 < xi lt.eq 1$; the final assembly will choose it smaller still.
  Choose a fixed integer $N_(*)$ so large that for every $N gt.eq N_(*)$,

#[#set math.equation(numbering: n => "(9.2)")
 $ N^2 2^(- N) lt.eq v \, wide 2 \/ N lt.eq c \/ 200 . $ <sur:size-threshold>]

Such an $N_(*)$ exists because $N^2 2^(- N) arrow.r 0$ and $2 \/ N arrow.r 0$.
  Enlarge the common integer surplus bound to satisfy $L gt.eq max { 1 \,
  N_(*) }$ as well as the bound of Theorem 20. It still has order $O_v \( log \( N + 2 \) \)$,
  with all preceding constants fixed. In particular, an instance with $k > 2 L$ has $N gt.eq
  k > 2 N_(*)$ and obeys Equation (9.2). Instances of the finitely many smaller sizes fall into the
  small-cardinality branch of the final assembly.

#thm([Proposition 9.1.])[
  (Low sensitivity).  #emph[With these fixed parameters, suppose $k > 2 L$ and
#[#set math.equation(numbering: n => "(9.3)")
 $ "opt"_(k - 2 L) lt.eq \( 1 + xi \) "opt"_k . $ <sur:sensitivity>]

 Put $h = k - L$. In polynomial time one can compute a real facility set $S$ of size $k$ with
#[#set math.equation(numbering: n => "(9.4)")
 $ "cost" \( S \) lt.eq (2 - c / 100) "opt"_h lt.eq (2 - c / 100) \( 1 + xi \) "opt"_k . $ <sur:conclusion>]

 The algorithm does not need to test Equation (9.3).]
] <sur:low-sensitivity>

#proof[
  Since $L gt.eq 1$ and $k > 2 L$, we have $h gt.eq 2$ and $h - L = k - 2 L gt.eq 1$.
    Apply Theorem 20 at target $h$, then replay its output using Lemma 21 to obtain the real set $U$ and its
    compatible budgets. In either output branch, $\| U \| lt.eq h + L = k$.
    Pad $U$ to size $k$ using members of $F$, and run width-$5$ local search starting there; call its output $S$.
    Padding is possible because $k lt.eq \| F \|$, and
  #[#set math.equation(numbering: n => "(9.5)")
   $ \| S \| = k \, wide "cost" \( S \) lt.eq "cost" \( U \) . $ <sur:local-start>]
  This is polynomial time on the bounded integral metric, as in Lemma 4.
    Fix an optimum $O$ of size $h$, padding if necessary, and write $P = "opt"_h > 0$, $C_i = { p :
    p upright(" is assigned to ") i in O }$, $n_i = \| C_i \|$, and $P_i = sum_(p in C_i) d \( i \, p \)$.
  #emph[The unmerged small-price branch.] Suppose the output is the unmerged solution at $lambda = 2 \/ N^2$,
    with at most $h$ facilities. Its payment guarantee is
  $ \( 1 - delta \) "cost" \( U \) lt.eq sum_(p in D) alpha_p . $
  Every nonempty cluster has $P_i gt.eq 1$ in the positive integral metric, so $lambda lt.eq 2 lt.eq T P_i$.
    Apply Lemma 22 to all nonempty clusters. Empty clusters contribute no budgets.
    There are at most $h$ nonempty clusters, and therefore
  $ \( 1 - delta \) "cost" \( U \) & lt.eq h lambda + \( 2 - c \/ 2 \) P\
 & lt.eq (2 - c \/ 2 + c \/ 200) P . $
  Here $h lambda lt.eq 2 \/ N lt.eq c \/ 200 lt.eq \( c \/ 200 \) P$, because $h lt.eq N$ and $P gt.eq 1$. Finally
  $ c / 200 + \( 2 - c \/ 100 \) delta lt.eq c / 200 + 6 v lt.eq frac(11 c, 1000) < frac(49 c, 100) = c / 2 - c /
    100 . $
  It follows that $"cost" \( U \) lt.eq \( 2 - c \/ 100 \) P$,
    and Equation (9.5) proves the desired conclusion in this branch.
    This argument uses only the payment bound with its opening term dropped and the strictness just proved.
  #emph[Dual comparison with an arbitrary real solution.] It remains to consider the normal branch,
    whose replay has exactly $h$ paid regular facilities. Put $e = h N eta$, where $eta = 2^(- N)$.
    Equation (9.2) ensures $e lt.eq v lt.eq v P$. The payment and dual inequalities of Lemma 21 are
  #[#set math.equation(numbering: n => "(9.6)")
   $ \( 1 - delta \) "cost" \( U \) + h lambda - e lt.eq sum_p alpha_p \, wide
     sum_p \[ alpha_p - 2 d \( i \, p \) \]_(+) lt.eq lambda quad \( i in F \) . $ <sur:payment-dual>]
  For any nonempty real set $H subset.eq F$, assign clients to nearest centers of $H$.
    For its cluster at $i$, the inequality $alpha_p lt.eq 2 d \( i \, p \) + \[ alpha_p - 2 d \( i \, p \) \]_(+)$
    gives, upon summing,
  #[#set math.equation(numbering: n => "(9.7)")
   $ sum_p alpha_p lt.eq \| H \| lambda + 2 "cost" \( H \) . $ <sur:any-H>]
  Combining Equations (9.6) and (9.7) and dropping the nonnegative connection term gives
  #[#set math.equation(numbering: n => "(9.8)")
   $ \( h - \| H \| \) lambda lt.eq 2 "cost" \( H \) + e . $ <sur:price-comparison>]
  Use for $H$ an optimum with $h - L = k - 2 L$ centers. Equation (9.3) and monotonicity of the optimum imply
    $"cost" \( H \) lt.eq \( 1 + xi \) "opt"_k lt.eq \( 1 + xi \) P$, and hence
  #[#set math.equation(numbering: n => "(9.9)")
   $ L lambda lt.eq 2 \( 1 + xi \) P + e . $ <sur:surplus-price>]
  #emph[Short clusters and simultaneous removals.] Set $b = lambda \/ 8$, and for $i in O$ let $"sep"_i =
    min_(j in O \\ { i }) d \( i \, j \)$. Call $i$ short if $n_i "sep"_i < b$;
    let $N_(upright("short"))$ be the number of short centers.
    Fix a nearest other center $nu \( i \)$ for every $i in O$.
    Color all centers independently with two colors, and select the short centers of the first color whose
    designated neighbor $nu \( i \)$ has the second color. Each short center is selected with probability $1 \/
    4$, so some coloring gives a set $R$ with
  $ N' := \| R \| gt.eq N_(upright("short")) \/ 4 . $
  For every $i in R$, $nu \( i \) in.not R$. Thus $O \\ R$ is nonempty,
    and all clients of $C_i$ can be rerouted to $nu \( i \)$ with total increase at most $n_i "sep"_i < b$.
    Keeping all other assignments proves
  $ "cost" \( O \\ R \) lt.eq P + b N' . $
  Empty clusters cause no difficulty: their rerouting increase is zero. Apply Equation (9.8) to $H = O \\ R$:
  $ lambda N' lt.eq 2 P + 2 b N' + e . $
  As $2 b = lambda \/ 4$, we obtain
  #[#set math.equation(numbering: n => "(9.10)")
   $ lambda N_(upright("short")) lt.eq 4 lambda N' lt.eq 32 / 3 P + 16 / 3 e . $ <sur:short-price>]
  Equations (9.9) and (9.10) now show explicitly that
  #[#set math.equation(numbering: n => "(9.11)")
   $ b \( L + N_(upright("short")) \) & lt.eq (19 / 12 + xi / 4) P + 19 / 24 e lt.eq 10 P . $ <sur:anchoring-scale>]
  For the last inequality use $xi lt.eq 1$, $e lt.eq v P$, and $v lt.eq 1 \/ 12$.
    Since $\| S \| - h = L$, Equation (9.11) is precisely the scale hypothesis of Theorem 6 with tolerance $1 \/ 100$.
  #emph[The bad-cluster count and cost dichotomy.] Apply Theorem 6 to $S \, O \, b$.
    We obtain distinct proxies in $S$ for the good centers, with total proxy assignment cost at most $P_g +
    P \/ 100$, and $m$ bad centers satisfying
  #[#set math.equation(numbering: n => "(9.12)")
   $ m lambda = 8 m b lt.eq 8 C_0 P . $ <sur:bad-price>]
  Write $P_b = sum_(i upright(" bad")) P_i$ and $P_g = P - P_b$.
    If $P_b lt.eq P \/ 10$, Lemma 5, with $u = 6 \/ 5$, gives
  $ "cost" \( S \) lt.eq 6 / 5 \( P_g + P \/ 100 \) + 17 / 5 P_b lt.eq 1.432 P < (2 - c / 100) P \, $
  where $c < 1$ follows from Equation (8.1).
  Otherwise $P_b > P \/ 10$. Let
  $ cal(B)_T = { i in O : i upright(" bad and ") lambda lt.eq T P_i } \, wide Q = sum_(i in cal(B)_T) P_i . $
  For every bad center excluded from $cal(B)_T$, $P_i < lambda \/ T$. Equation (9.12) and $T = 200 C_0$ therefore imply
  $ sum_(i upright(" bad")\
i in.not cal(B)_T) P_i lt.eq m lambda \/ T lt.eq P \/ 25 \, wide Q > P \/ 10 - P \/ 25 = 3 P \/ 50 > P \/ 20 . $
  Every member of $cal(B)_T$ has a nonempty positive-cost cluster, so Lemma 22 applies there.
    For each of the other centers, the cluster version of Equation (9.7) gives $sum_(p in C_i) alpha_p lt.eq
    lambda + 2 P_i$, including empty clusters. Summing over all $h$ centers of $O$ proves
  #[#set math.equation(numbering: n => "(9.13)")
   $ sum_p alpha_p lt.eq h lambda + 2 P - c / 2 Q lt.eq h lambda + (2 - c / 40) P . $ <sur:summed-gain>]
  The full $h lambda$ in Equation (9.13) cancels the full $h lambda$ in Equation (9.6), giving
  $ \( 1 - delta \) "cost" \( U \) lt.eq (2 - c / 40) P + e . $
  To divide by $1 - delta$, note that
  $ e / P + \( 2 - c \/ 100 \) delta lt.eq v + 6 v lt.eq frac(7 c, 1000) < frac(3 c, 200) = c / 40 - c / 100 . $
  Thus $"cost" \( U \) lt.eq \( 2 - c \/ 100 \) P$, and Equation (9.5) proves the first inequality in
    Equation (9.4). Finally $P = "opt"_h lt.eq "opt"_(h - L) lt.eq \( 1 + xi \)
    "opt"_k$ proves its second inequality. All choices made by the algorithm were the imported construction,
    padding, and local search; $O$, the coloring, and the good/bad partition are used only in the proof. ◻
]

== 10 The stability dichotomy and the final algorithm <asm:section>

We now combine the two constructions. The distinction between the cases is used only to analyze the candidates:
  the algorithm computes all candidates without knowing any optimum cost.

=== 10.1 Choosing the constants <choosing-the-constants>

Take $C_0$ from Equation (3.11), put $T = 200 C_0$, and let $c = c \( T \) > 0$ be given by Equation (8.1).
  Fix the rational constants

#[#set math.equation(numbering: n => "(10.1)")
 $ gamma = min { 3 \/ 100 \, c \/ 100 } \, wide xi = epsilon_0 = gamma \/ 16 \, wide sigma =
   gamma \/ 4 . $ <asm:constants>]

In particular $0 < gamma < 1$. The choice of $epsilon_0$ fixes the polynomial distance bound in Lemma 3 before the
  external surplus construction is invoked. Choose $v$ as in Equation (9.1),
  then choose $N_(*)$ and the common integer $L$ as in Equation (9.2) and the paragraph following it. Thus

$ L = O \( log \( N + 2 \) \) \, wide L gt.eq 1 \, $

where all hidden constants are fixed independently of the input.
  There is no dependence of $C_0 \, T \, c \, gamma \, xi$, or $epsilon_0$ on $L$.
  This order also accommodates the fixed coefficient in the rounded distance bound.

#thm([Lemma 10.1.])[
  (A sensitive cardinality).  #emph[Suppose $k > 2 L$, $0 < xi lt.eq 1$, and
$ "opt"_(k - 2 L) > \( 1 + xi \) "opt"_k . $

 Put $beta = xi \/ \( 4 L \)$. There is an integer $h'$ with $k - 2 L < h' lt.eq k$ such that
#[#set math.equation(numbering: n => "(10.2)")
 $ "opt"_(h' - 1) gt.eq \( 1 + beta \) "opt"_(h') \, wide "opt"_(h') lt.eq \( 1 + xi \) "opt"_k .
   $ <asm:sensitive-ratios>]

 For an optimum $O$ of size $h'$, of cost $P = "opt"_(h')$, every comparison cluster satisfies
#[#set math.equation(numbering: n => "(10.3)")
 $ n_i "sep"_i gt.eq beta P \, wide "sep"_i = d \( i \, O \\ { i } \) . $ <asm:separation>]

]
] <asm:sensitive>

#proof[
  All optimum costs in the integral model are positive. Since $log \( 1 + xi \) gt.eq xi \/ 2$ for $0 lt.eq
    xi lt.eq 1$ and $log \( 1 + beta \) < beta$,
  #[#set math.equation(numbering: n => "(10.4)")
   $ \( 1 + beta \)^(2 L) < exp \( xi \/ 2 \) lt.eq 1 + xi . $ <asm:product-bound>]
  The product of the $2 L$ ratios $"opt"_(r - 1) \/ "opt"_r$, for $k - 2 L < r lt.eq k$, is greater than $1 + xi$.
    Hence at least one ratio is at least $1 + beta$. Choose the largest such index $h'$.
    Every later ratio is less than $1 + beta$, and their product is at most $\( 1 + beta \)^(2 L) < 1 +
    xi$ (the empty product is one). This proves both inequalities in Equation (10.2).
  We have $h' gt.eq k - 2 L + 1 gt.eq 2$. For $i in O$, reroute all its clients to a nearest other member of $O$
    and keep the remaining assignments. This constructs an $\( h' - 1 \)$-center solution of cost at most $P +
    n_i "sep"_i$. The first inequality in Equation (10.2) gives $P + n_i "sep"_i gt.eq \( 1 + beta \) P$,
    proving Equation (10.3). In particular no cluster of this optimum is empty. ◻
]

=== 10.2 Candidates on the bounded integral instance <candidates-on-the-bounded-integral-instance>

#thm([Proposition 10.2.])[
  (Integral-instance algorithm).  #emph[With the constants above,
    for every $0 < zeta < 1$ there is a randomized algorithm which always returns at most $k$ facilities and cost
    at most $5 "opt"_k$, and with probability at least $1 - zeta$ returns cost at most
#[#set math.equation(numbering: n => "(10.5)")
 $ \( 2 - gamma \) \( 1 + xi \) "opt"_k . $ <asm:integral-guarantee>]

 Its running time is polynomial in $N$ and $log \( 2 \/ zeta \)$ for the fixed constants and the fixed polynomial
   distance bound.]
] <asm:integral>

#proof[
  Compute a width-$5$ local optimum $S_k$ of size $k$ and retain it as a candidate.
    Lemmas 4 and 5 give polynomial time and $"cost" \( S_k \) lt.eq 5 "opt"_k$.
    Every other retained candidate will also satisfy the budget, and we return the least-cost candidate.
  If $k lt.eq 2 L$, apply Theorem 17 to $S_k$ with the supplied count bound $M_0 =
    2 L$ and failure parameter $zeta$. For its analysis, take an optimum of size $k$ and declare every cluster
    bad. Then $m = k lt.eq M_0$, and the proxy condition is vacuous.
    Recovery gives cost at most $1.97 "opt"_k$ with probability at least $1 - zeta$.
    Since $1.97 lt.eq 2 - gamma$, this implies Equation (10.5), including the case $k = 1$.
  Suppose now that $k > 2 L$. Compute the candidate of Proposition 23 with target $h = k - L$.
    In addition, for every integer $h'$ with $k - 2 L < h' lt.eq k$,
    compute a width-$5$ local optimum $S_(h')$ of size $h'$ and apply Theorem 17 with
  #[#set math.equation(numbering: n => "(10.6)")
   $ M_0 = ⌈frac(4 C_0 L, xi)⌉ \, wide upright("failure parameter ") zeta . $ <asm:count-bound>]
  These calls require only the computed local sets, $M_0$, and $zeta$.
    They enumerate their unknown comparison costs internally.
    All their feasible outputs have at most $h' lt.eq k$ centers.
  If $"opt"_(k - 2 L) lt.eq \( 1 + xi \) "opt"_k$, Proposition 23 gives cost at most
  $ \( 2 - c \/ 100 \) \( 1 + xi \) "opt"_k lt.eq \( 2 - gamma \) \( 1 + xi \) "opt"_k . $
  This conclusion is deterministic.
  Otherwise, let $h'$ be supplied by Lemma 24, take an optimum $O$ of size $h'$, and put $P = "opt"_(h')$, $b =
    beta P$. The local set $S_(h')$ has no surplus relative to $O$.
    Equation (10.3) says that no center is short at scale $b$,
    so the left side of the scale condition in Theorem 6 is zero.
    With tolerance $1 \/ 100$, that theorem supplies distinct good proxies with total assignment cost at most
    $P_g + P \/ 100$, and
  $ m lt.eq C_0 P \/ b = C_0 \/ beta = 4 C_0 L \/ xi lt.eq M_0 . $
  The recovery call at this particular $h'$ therefore has, with probability at least $1 - zeta$, cost at most
  $ 1.97 P lt.eq 1.97 \( 1 + xi \) "opt"_k lt.eq \( 2 - gamma \) \( 1 + xi \) "opt"_k . $
  The algorithm need not recognize this index or its success event:
    its returned minimum is no worse than this candidate. Only this one call must succeed,
    so there is no union-bound loss over the other indices.
  Both supplied count bounds are $O \( log \( N + 2 \) \)$.
    There are at most $N$ cardinality choices; the local searches and the surplus construction are polynomial,
    and the recovery calls have polynomial time by Theorem 17.
    Keeping $S_k$ proves the unconditional factor-five bound. ◻
]

=== 10.3 General metrics and the expected guarantee <general-metrics-and-the-expected-guarantee>

#proof[
  Handle the elementary cases and zero optimum as in Section 2.
    Apply Lemma 3 with the fixed $epsilon_0 = gamma \/ 16$ and the algorithm of Proposition 25.
    The successful approximation factor on the original rational metric is at most
  $ \( 2 - gamma \) \( 1 + xi \) \( 1 + epsilon_0 \) = \( 2 - gamma \) \( 1 + gamma \/ 16 \)^2 lt.eq 2 - gamma \/ 2 . $
  For the last inequality, expand the product:
  $ \( 2 - gamma \) \( 1 + gamma \/ 16 \)^2 = 2 - 3 / 4 gamma - 15 / 128 gamma^2 - 1 / 256 gamma^3 lt.eq 2 -
    gamma \/ 2 . $
  The transferred unconditional bound is $5 \( 1 + epsilon_0 \) "opt"_k < 6 "opt"_k$.
  For the prescribed fixed $a > 0$, choose a rational failure parameter
  $ 0 < zeta lt.eq min { \( N + 2 \)^(- ceil.l a ceil.r) \, gamma \/ 24 } . $
  It has polynomial bit length and $log \( 2 \/ zeta \) = O_a \( log \( N + 2 \) \)$ with fixed constants.
    The least original-cost candidate over all rounding guesses is no worse than the candidate for the correct
    guess. Hence its probability of exceeding $\( 2 - gamma \/ 2 \) "opt"_k$ is at most $zeta
    lt.eq \( N + 2 \)^(- a)$. Since $sigma = gamma \/ 4$, this proves the asserted probability bound.
    Finally, split expectation according to that successful event and use the unconditional cost bound:
  $ bb(E) "cost" \( S \) lt.eq \( 2 - gamma \/ 2 \) "opt"_k +
    6 zeta "opt"_k lt.eq \( 2 - gamma \/ 4 \) "opt"_k = \( 2 - sigma \) "opt"_k . $
  Every candidate is a real facility set of size at most $k$.
    All enumerations and arithmetic have polynomial bit complexity, as established in the reduction, sampling,
    and completion proofs. This completes the theorem. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
