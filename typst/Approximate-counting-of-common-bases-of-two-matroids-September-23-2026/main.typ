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

#align(center)[#text(size: 16pt, weight: "bold")[Approximate counting of common bases of two matroids]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A #emph[matroid] $M$ on a finite set $E$ is a family $cal(I)$ of independent sets containing $diameter$,
  closed under taking subsets, and satisfying augmentation:
  if $I \, J in cal(I)$ and $\| I \| < \| J \|$, then $I union { e } in cal(I)$ for some $e in J \\ I$.
  The rank of $A subset.eq E$ is the largest size of an independent subset of $A$.
  A #emph[basis] is a maximal independent subset of $E$; augmentation implies that all bases have size
  $"rk"_M \( E \)$. An #emph[independence oracle] reports whether a queried subset is independent.

Our input consists of two matroids $M_1 \, M_2$ of the same rank $r$ on the explicitly enumerated ground set
  $\[ n \] = { 1 \, dots.h \, n }$, supplied by fixed exact independence oracles.
  Each query is an $n$-bit subset indicator. We count an oracle call separately from the bit operations needed to
  construct the query and process the answer. Writing $cal(B) \( M \)$ for the set of bases of $M$,
  the quantity to be estimated is

$ Z \( M_1 \, M_2 \) = \| cal(B) \( M_1 \) ∩ cal(B) \( M_2 \) \| . $

The required approximation has relative error at most $epsilon.alt$ with failure probability at most $delta$.
  A fully polynomial randomized approximation scheme, or FPRAS,
  achieves this guarantee with polynomial dependence on the input size, $epsilon.alt^(- 1)$,
  and $log delta^(- 1)$. We prove such a result in the oracle model,
  with a work bound on every execution rather than only in expectation.

#thm([Theorem 1.1.])[
  #emph[There is a single randomized oracle algorithm with the following guarantee.
    Given independence oracles for arbitrary rank-$r$ matroids $M_1 \, M_2$ on $\[ n \]$,
    and rational $epsilon.alt \, delta in \( 0 \, 1 \)$, it outputs a nonnegative rational $hat(Z)$ such that
$ bb(P) #scale(x: 120%, y: 120%)[\[] \( 1 - epsilon.alt \) Z \( M_1 \, M_2 \) lt.eq
  hat(Z) lt.eq \( 1 + epsilon.alt \) Z \( M_1 \, M_2 \) #scale(x: 120%, y: 120%)[\]] gt.eq 1 - delta . $

 If $Z \( M_1 \, M_2 \) = 0$, its output is always zero. On every execution,
   the number of oracle calls and the number of other bit operations are bounded by a fixed polynomial in
$ n \, wide ell \, wide epsilon.alt^(- 1) \, wide log delta^(- 1) \, $

 where $ell$ is the binary encoding length of $n \, r \, epsilon.alt \, delta$.
   The algorithm uses only independent unbiased random bits and does not require a representation of either matroid.]
] <thm:main>

The theorem also yields an FPRAS for counting common independent sets of prescribed, unrestricted,
  or maximum cardinality, even when the two matroid ranks differ,
  and an almost-uniform sampler for each of these families.
  The sampler decides emptiness exactly and, for a nonempty family, returns a feasible member on every execution,
  with polynomial dependence on the inverse total-variation tolerance.
  The full counting and sampling guarantees are stated and proved in 10 in 9.

===== 1.1 Background and significance. <background-and-significance.>

Matroid intersection admits a deterministic polynomial-time optimization algorithm in the independence-oracle
  model [14,20]. Counting common bases contains two prominent special cases.
  Taking the matroids equal gives the number of bases of one matroid.
  For a bipartite graph with equal vertex-class sizes, take the ground set to be its edges and impose,
  in each matroid, the constraint of using at most one edge at each vertex on one side.
  These are partition matroids. When there are no isolated vertices,
  their common bases are exactly the perfect matchings; an isolated vertex makes that matching count zero.
  Jerrum, Sinclair, and Vigoda gave an FPRAS for the permanent of a nonnegative matrix,
  which includes this bipartite matching problem [16].

For a single matroid, early sampling and counting results relied on negative dependence.
  Feder and Mihail established efficient sampling and approximate counting for balanced matroids,
  including regular matroids [15]. Anari, Oveis Gharan, and Rezaei later proved rapid mixing for homogeneous
  strongly Rayleigh distributions [5]. The latter condition requires a fixed-cardinality distribution whose
  multiaffine generating polynomial is real stable, meaning that it is nonzero whenever all variables have
  positive imaginary parts. These hypotheses do not hold for all matroids.
  Anari, Liu, Oveis Gharan, and Vinzant removed such restrictions for single-matroid counting by developing
  high-dimensional walks for log-concave polynomials, obtaining an independence-oracle FPRAS [3].

For intersections, earlier approaches gave coarser approximations or required additional algebraic information.
  Barvinok and Samorodnitsky used random linear optimization to obtain coarse estimates of logarithms of
  set-system cardinalities; their optimization-oracle framework applies to common bases through matroid
  intersection [7] arXiv version 2, Sections 2.1–2.2 and Theorem 3.1.
  Anari and Oveis Gharan obtained exponential-factor approximations from real-stable polynomials supplied by
  evaluation oracles [4]; Straszak and Vishnoi developed capacity bounds with stability and
  representation-dependent qualifications [21]. Such polynomial evaluations are not furnished by an independence
  oracle. Anari, Oveis Gharan, and Vinzant then gave a deterministic polynomial-time $2^(O \( r \))$-factor
  approximation for common bases of arbitrary rank-$r$ independence-oracle matroids [6].
  Their relative-approximation scheme has $2^(O \( r \))$ dependence in its running time,
  so it becomes fully polynomial when $r = O \( log n \)$ but does not give an unrestricted-rank FPRAS [6] arXiv
  version 2, Theorem 1.3 and Corollary 1.4.

Efficient sampling and approximate counting were also obtained for strongly Rayleigh distributions under a
  constant number of partition constraints, with access to individual coefficients and a suitable initial support
  element [2] Section 1.3, version 3. Neither the constant number of parts nor the stronger stability hypothesis
  is available for the arbitrary paired matroid construction used here.
  Cryan, Guo, and Mousa explicitly asked for a rapidly convergent Markov chain for uniform sampling of common
  bases or common independent sets [12] arXiv version 4, Introduction.
  The question of an FPRAS for two arbitrary independence-oracle matroids is explicitly recorded in Liu’s
  dissertation [19] Section 13.2, Problem 1. 1 gives an affirmative answer to that formulation.

===== 1.2 Proof strategy. <proof-strategy.>

We encode a common basis as a basis of a rank-$n$ matroid on $2
  n$ elements that chooses one element from each of $n$ prescribed pairs.
  To maintain strictly positive weights, an $n$-set $S$ of rank deficiency $d = n -
  "rk" \( S \)$ receives weight $q^d$, with $q$ decreasing from $1$ to an exponentially small rational.
  An $n$-set choosing one element from every pair is called a #emph[transversal].
  The total weight of transversals is initially known and approaches the desired count as $q$ decreases.

The chain must move between transversals whose selected elements may differ in many pairs.
  Nonbasis transversals can have very small weight, so positivity and connectivity alone do not give the
  polynomial quantitative bounds needed for counting. We enlarge the state space by allowing one empty pair and
  one doubly occupied pair; their ordered indices specify a #emph[defect type].
  A positive multiplier for each type balances its total weight against the transversal total.
  The chain makes one-element exchanges, with Metropolis acceptance probabilities determined by these multiplied
  weights. Balancing defect classes and learning their weights through interpolation follows the permanent
  algorithm of Jerrum, Sinclair, and Vigoda [16].

The algebraic input is the homogeneous Tutte theorem of Brändén and Huh [9].
  Applied to the matroid and its dual, it yields two complementary tools:
  inequalities between defect totals, and a transport inequality between conditional distributions.
  The transport compares two choices of a missing slot in a partition into singleton and two-element slots.
  It recursively assigns balanced signed demands, bounds the cost of splitting a slot by a quadratic form with at
  most one positive direction, and realizes the final demands by exchange flows.
  Transport between conditional laws also underlies the local Poincaré framework of Chen, Feng, Ju, Miao, Yin,
  and Zhang [10]. Here the transport is constructed by signed currents whose energy is controlled by the
  omitted-element quadratic forms.

These tools bound variation visible on individual transversals and on the means of defect types.
  They need not bound arbitrary variation within a defect type. This distinction dictates the simulation argument:
  we prove rapid mixing for the #emph[trace], which records successive visits to transversals,
  and a separate variance bound for the type indicators and ratio observables actually averaged by the algorithm.
  Chen, Vigoda, and Yang used partition-restricted Poincaré inequalities to control hole-pattern frequency
  estimates in the permanent algorithm [11]. Here the variance bound also retains individual transversal values,
  and we combine it with trace mixing. A #emph[warm start] is a starting law bounded pointwise by a controlled
  multiple of the stationary law. Fresh independent restarts along the annealing schedule supply these starts even
  though the multipliers are learned adaptively from earlier observations.

All partition sums, conditioning trees, and flows appearing in the proof are analytical devices.
  The algorithm evaluates individual state weights by oracle rank computations and learns the required multipliers
  from observations of an explicit chain.

===== 1.3 Organization. <organization.>

2 gives the paired reduction and the positive weights. 3 derives the quadratic signature inequalities,
  and 4 proves the missing-slot transport bound. 5 obtains transversal variance and the observable Poincaré
  inequality. 6 turns them into time-average and trace-chain estimates.
  7 assembles the annealing algorithm and analyzes its error,
  and 8 establishes the bounded-bit oracle implementation and completes the proof of 1.
  9 derives the counting and sampling consequences for common independent sets.

== 2 The paired-ground-set reduction <sec:reduction>

We first replace common bases by transversal bases of one matroid.
  This gives a single rank-deficiency weight that can be evaluated using the two input oracles.
  The positive-weight state space will contain all transversals and all sets with one empty pair and one full pair.

Augmentation implies that every maximal independent subset of $A$ has size $"rk"_M \( A \)$.
  Thus a greedy scan computes an original matroid’s rank with at most $n$ independence queries.
  The dual matroid $M^(*)$ has as bases the complements of the bases of $M$, and its rank is

#[#set math.equation(numbering: n => "(1)")
 $ "rk"_(M^(*)) \( A \) = \| A \| - "rk"_M \( E \) + "rk"_M \( E \\ A \) . $ <eq:dualrank>]

Indeed, extending a maximal independent subset of $E \\ A$ to a basis minimizes the number of basis elements in
  $A$; this minimum is $"rk"_M \( E \) - "rk"_M \( E \\ A \)$.
  Maximizing the number of elements of $A$ in a basis complement gives (1).

Make two copies of $\[ n \]$, with corresponding elements denoted $x_i \, y_i$,
  and use the paired reduction of Anari, Oveis Gharan, and Vinzant [6] arXiv version 2, Section 7, Equation (13):

$ V = { x_1 \, y_1 \, dots.h \, x_n \, y_n } \, wide K = M_1 xor M_2^(*) . $

Here $M_1$ is on the $x$-copy and $M_2^(*)$ on the $y$-copy.
  The matroid $K$ has rank $n$; a set is independent in this direct sum exactly when its restrictions to the two
  copies are independent in their respective matroids. A #emph[transversal] is an $n$-set that contains exactly
  one element of each pair ${ x_i \, y_i }$. For $A subset.eq \[ n \]$, the associated transversal is

$ S \( A \) = { x_i : i in A } union { y_i : i in.not A } . $

It is a basis of $K$ if and only if $A$ is a basis of both $M_1$ and $M_2$.
  To see this, independence of an $n$-set in the direct sum forces each summand to attain its rank,
  and dual bases are basis complements.

If $n = 0$, the algorithm returns $1$. Otherwise, the deterministic matroid-intersection algorithm tests whether a
  common independent set of size $r$ exists; if none exists, we return $0$.
  This algorithm uses polynomially many independence queries and polynomial additional work [20] Section 41.2,
  Theorem 41.4; the promised matroid axioms, exact oracles,
  and explicit ground set are its required input hypotheses. Henceforth

#[#set math.equation(numbering: n => "(2)")
 $ n gt.eq 1 \, wide Z \( M_1 \, M_2 \) gt.eq 1 . $ <eq:feasible>]

For $0 < q lt.eq 1$ and every $S in binom(V, n)$, define

#[#set math.equation(numbering: n => "(3)")
 $ d \( S \) = n - "rk"_K \( S \) \, wide f_q \( S \) = q^(d \( S \)) . $ <eq:rankweights>]

These weights are strictly positive. Let $Omega_0$ be the set of all transversals.
  Fixed-cardinality weights proportional to $q^(- "rk" \( S \))$ already appear in the log-concave-polynomial
  framework of Anari, Liu, Oveis Gharan, and Vinzant [3] arXiv version 3, Theorem 1.6.
  Here the additional restriction to paired occupancy classes is central.
  For distinct $i \, j in \[ n \]$, let $Omega_(i j)$ consist of the $n$-sets for which pair $i$ is empty,
  pair $j$ is full, and every other pair is singly occupied. Set

#[#set math.equation(numbering: n => "(4)")
 $ cal(T) = { 0 } union { i j : i \, j in \[ n \] \, med i eq.not j } \, wide Omega =
   union.sq.big_(T in cal(T)) Omega_T \, wide c_T \( q \) = sum_(S in Omega_T) f_q \( S \) . $ <eq:types>]

The order of the indices in $i j$ matters. In particular, $c_0 \( q \)$ sums over all transversals,
  including those that are not bases. We suppress $q$ when it is fixed.

== 3 Quadratic signature inequalities <sec:algebra>

The counting argument uses two consequences of the rank weights:
  relations between the total weights of defect types, and a quadratic bound for the transport construction.
  Both follow from a single signature property, applied to the polynomial of selected elements and to the
  polynomial of omitted elements.

We use the following consequence of the Lorentzian theory.
  A polynomial has the #emph[quadratic signature property] if every homogeneous quadratic obtained from it by
  partial differentiation and nonnegative linear substitutions has a Hessian with at most one positive eigenvalue.
  The zero polynomial is allowed, as are substitutions that identify variables or set them to zero.
  Coefficients throughout this section are nonnegative.

#thm([Theorem 3.1.])[
  (Brändén–Huh).  #emph[For a matroid $N$ on a ground set $E$ and $0 < q lt.eq 1$, the polynomial
$ T_(q \, N) \( z_0 \, z \) = sum_(A subset.eq E) q^(- "rk"_N \( A \)) z_0^(\| E \| - \| A \|) product_(a in A) z_a $

 is Lorentzian. Lorentzian polynomials are closed under partial derivatives and nonnegative linear substitutions,
   and a quadratic Lorentzian polynomial has a Hessian with at most one positive eigenvalue.
   In particular, $T_(q \, N)$ has the quadratic signature property.]
] <thm:BH>

The statements used here are [9] Theorem 4.10, Theorem 2.10, and Corollary 2.11,
  together with the defining quadratic signature. We need no other facts about Lorentzian polynomials.
  The connection between derivative Hessians and spectral estimates for matroid walks was developed by Anari, Liu,
  Oveis Gharan, and Vinzant [3] arXiv version 3, Proposition 4.1.
  Here we use the quadratic forms to construct transport on the restricted paired state space.

Write $z^S = product_(a in S) z_a$ and form

#[#set math.equation(numbering: n => "(5)")
 $ F \( z \) = sum_(S in binom(V, n)) f_q \( S \) z^S \, wide F^or \( z \) =
   sum_(S in binom(V, n)) f_q \( V \\ S \) z^S . $ <eq:bothpolynomials>]

Both have the quadratic signature property. Indeed,

$ F = frac(q^n, n !) partial_(z_0)^(thin n) T_(q \, K)\|_(z_0 = 0) . $

Since $\| V \| = 2 n$ and $"rk" K = n$, (1) gives $"rk"_(K^(*)) \( S \) = "rk"_K \( V \\ S \)$ for $\| S \| = n$;
  the same formula with $K^(*)$ gives $F^or$.

We will repeatedly extract the coefficient of exponent exactly one in a variable, deleting that variable.
  This operation is $G mapsto \( partial_z G \) \|_(z = 0)$, so it preserves the quadratic signature property.
  In particular, after identifying the two variables of a pair, it imposes exactly one selected element in that pair.

=== 3.1 Relations between defect totals <relations-between-defect-totals>

We first derive inequalities that remain valid after fixing any partial transversal.
  They will control the choice of a conditioning pair and the cost of transferring a defect mean to a transversal mean.

A partial transversal assignment $sigma$ prescribes one element in each of some pairs,
  requiring its inclusion and its mate’s exclusion. Let $z_sigma$ be the total weight of transversals respecting
  $sigma$. For distinct unassigned pairs $i \, j$, let $c_(i j)^sigma$ be the total weight respecting $sigma$ with
  pair $i$ empty, pair $j$ full, and all other unassigned pairs singly occupied.
  The empty assignment has $z_diameter = c_0$ and $c_(i j)^diameter = c_(i j)$. All these totals are positive.

#thm([Lemma 3.2.])[
  #emph[For distinct unassigned indices $i \, j$,
#[#set math.equation(numbering: n => "(6)")
 $ 4 c_(i j)^sigma c_(j i)^sigma lt.eq z_sigma^2 . $ <eq:coefficientpair>]

 For distinct unassigned indices $i \, j \, k$,
#[#set math.equation(numbering: n => "(7)")
 $ c_(i j)^sigma c_(j k)^sigma lt.eq z_sigma c_(i k)^sigma . $ <eq:coefficient>]

]
] <lem:coefficient>

#proof[
  In $F$, differentiate in the elements selected by $sigma$, set both variables of each assigned pair to zero,
    and identify the two variables in every unassigned pair. The resulting polynomial has $z_sigma$ and
    $c_(i j)^sigma$ as the coefficients of the corresponding occupancy patterns.
  For the first inequality, extract exponent one in all variables other than $i \, j$.
    The remaining quadratic has Hessian
  $ mat(delim: "(", 2 c_(j i)^sigma, z_sigma; z_sigma, 2 c_(i j)^sigma) . $
  Its positive diagonal and at-most-one-positive-eigenvalue property force its determinant to be nonpositive.
  For the second inequality, extract exponent one in all variables other than $i \, j \, k$,
    and then differentiate once in the variable of pair $k$. The Hessian $A$ of the resulting quadratic satisfies
  #[#set math.equation(numbering: n => "(8)")
   $ A_(j j) = 2 c_(i j)^sigma \, quad A_(i k) = 2 c_(j k)^sigma \, quad A_(i j) = z_sigma \, quad A_(j k) =
     2 c_(i k)^sigma . $ <eq:tripleHessian>]
  Here and below we use the elementary fact that, if a real symmetric form $A$ has at most one positive eigenvalue
    and $e^top A e > 0$, then it is negative semidefinite on ${ v : v^top A e = 0 }$.
    A positive vector in that orthogonal subspace would otherwise span with $e$ a positive definite
    two-dimensional subspace. This is the one-positive-direction form of the reverse Cauchy–Schwarz principle;
    see [8] Lemma 3.
  Apply this fact with $e = e_j$, since $A_(j j) > 0$. The Schur complement
  $ B_(u v) = A_(u v) - frac(A_(u j) A_(j v), A_(j j)) wide \( u \, v in { i \, k } \) $
  is negative semidefinite. Cauchy–Schwarz for $- B$ and nonnegativity of the entries of $A$ give
  $ A_(i k) & lt.eq frac(A_(i j) A_(j k), A_(j j)) +
    sqrt((A_(i j)^2 / A_(j j) - A_(i i)) (A_(j k)^2 / A_(j j) - A_(k k)))\
 & lt.eq 2 frac(A_(i j) A_(j k), A_(j j)) . $
  Substituting (8) proves the second inequality. ◻
]

== 4 A transport inequality <sec:transport>

Our goal is to bound the difference of two weighted means by the energy of one-element exchanges.
  The two classes differ in which singleton slot is missing.
  Allowing holes in the other slots makes it possible to connect these classes with a controlled signed flow.

Fix $q in \( 0 \, 1 \]$ and write $f = f_q$ throughout this section.
  We state the main lemma in a form that permits conditioning and regrouping elements into slots.
  Its proof uses only the quadratic signature property of $F^or$ and positivity of $f$.

Partition $V$ into fixed included elements $B$, fixed excluded elements $C$, two distinct singleton slots $p \,
  d$, and $m$ ordinary two-element slots $E_1 \, dots.h \, E_m$. We identify each singleton slot with its element.
  Assume

#[#set math.equation(numbering: n => "(9)")
 $ \| B \| + 1 + m = n . $ <eq:slotsizes>]

It follows that $\| C \| = n - 1 - m$. The slots need not be pairs from the original pairing.
  In particular, $p \, d$ may lie in the same original pair.

Let $cal(X)$ consist of the $n$-sets obtained by including $B$, excluding $C$, leaving exactly one of the $m +
  2$ slots empty, and selecting one element from each other slot.
  For a missing slot $h$, write $cal(X)_h$ for its class and let $h \( S \)$ be the missing-slot label of $S$.
  Give each slot $h$ a positive multiplier $W_h$; a vertex $S in cal(X)_h$ has multiplied weight $W_h f \( S \)$.
  For an element $i in E_t$, also write $W_i = W_t$; for $i = p$ or $i = d$,
  $W_i$ is the multiplier of that singleton slot. Join two vertices whenever they differ by one element exchange,
  and give each undirected edge conductance

$ kappa \( S \, S' \) = min { W_(h \( S \)) f \( S \) \, W_(h \( S' \)) f \( S' \) } . $

For $H : cal(X) arrow.r bb(R)$, put

$ D_(cal(X)) \( H \) = sum_({ S \, S' } upright(" edge")) kappa \( S \, S' \) #scale(x: 120%, y: 120%)[\(]
  H \( S \) - H \( S' \) #scale(x: 120%, y: 120%)[\)]^2 . $

Let $s_p \, s_d$ be the unmultiplied weight totals of $cal(X)_p$ and $cal(X)_d$, and let $overline(H)_p \,
  overline(H)_d$ be the means of $H$ on these classes with weights $f$.
  For each ordinary slot $t$, let $v_t$ be the total weight of the $n$-sets that include $B$, exclude $C$,
  miss both $p$ and $d$, contain both elements of $E_t$, and contain one element of each other ordinary slot.
  These latter sets define totals only; they need not belong to $cal(X)$.
  The subscript $t$ records the doubled ordinary slot in $v_t$ and the missing ordinary slot in $cal(X)_t$.

#thm([Lemma 4.1.])[
  (Transport).  #emph[With the notation above,
#[#set math.equation(numbering: n => "(10)")
 $ \( overline(H)_p - overline(H)_d \)^2 lt.eq
   (frac(1, s_p W_p) + frac(1, s_d W_d) + frac(2, s_p s_d) sum_(t = 1)^m v_t / W_t) D_(cal(X)) \( H \) .
   $ <eq:transport>]

]
] <lem:transport>

#proof[
  Orient the edges arbitrarily. We seek a signed edge flow $J$ whose divergence (net outgoing current) at $S$ is
    $f \( S \) \/ s_p$ on $cal(X)_p$, $- f \( S \) \/ s_d$ on $cal(X)_d$, and zero elsewhere.
    Summation by parts and Cauchy–Schwarz would then give
  #[#set math.equation(numbering: n => "(11)")
   $ \( overline(H)_p - overline(H)_d \)^2 & = (sum_(e = \( S \, S' \)) J \( e \) \( H \( S \) - H \( S' \) \))^2\
 & lt.eq (sum_e frac(J \( e \)^2, kappa \( e \))) D_(cal(X)) \( H \) \, $ <eq:flowcriterion>]
  where each undirected edge occurs once with its chosen orientation.
    It suffices to bound this flow energy by the coefficient in (10).
    This passage from a signed flow to an energy bound is the standard electrical-network duality [13]
    Section 1.3.5, 2006 web edition. We first assign balanced demands recursively and then route them within
    cliques at the leaves. Process the ordinary slots in the order $1 \, dots.h \, m$.
  ===== 4.1 A recursive system of balanced demands. <a-recursive-system-of-balanced-demands.>
  After $k$ slots have been processed, a node of the recursion is a set
  $ R = { p \, d } union { a_1 \, dots.h \, a_k } \, wide a_t in E_t . $
  For each $i in R$, let $s_i \( R \)$ be the total weight of the sets that include $B union \( R \\ { i } \)$,
    contain no other elements of the displayed slots, and choose one element from each unprocessed slot.
    The elements of $C$ remain excluded. We associate real numbers $h_i \( R \)$ to the holes $i in
    R$ and maintain balance
  #[#set math.equation(numbering: n => "(12)")
   $ sum_(i in R) s_i \( R \) h_i \( R \) = 0 . $ <eq:balance>]
  At the root, $R = { p \, d }$, set $h_p = 1 \/ s_p$ and $h_d = - 1 \/ s_d$.
    The quantity $s_i \( R \) h_i \( R \)$ is the signed demand assigned to hole $i$;
    thus $h_i \( R \)$ is demand per unit weight.
  Suppose that the next slot is $E_t = { a \, b }$. The two child nodes are $R union { a }$ and $R union { b }$.
    For an old hole $i in R$, abbreviate $s_i^l = s_i \( R union { l } \)$, so that
  $ s_i^a + s_i^b = s_i \( R \) . $
  The new-hole totals $s_a \( R union { a } \)$ and $s_b \( R union { b } \)$ count the same sets:
    all of $R$ is included and slot $E_t$ is empty. Denote their common positive value by $u$.
    Keep $h_i$ unchanged for old holes, and define
  #[#set math.equation(numbering: n => "(13)")
   $ h_l \( R union { l } \) = - 1 / u sum_(i in R) h_i \( R \) s_i^l \, wide l in { a \, b } . $ <eq:newhole>]
  Balance holds in both children. The two newly introduced values have sum zero, by balance in the parent.
  Define the potential at level $k$ by
  $ Phi_k = sum_(R upright(" at level ") k) med sum_(i in R) frac(s_i \( R \) h_i \( R \)^2, W_i) . $
  At the leaves this quantity will bound the energy needed to realize the demands.
    Write $X = sum_(i in R) h_i \( R \) s_i^a$ for the current split.
    The two new values are $- X \/ u$ and $X \/ u$. Old-hole contributions are conserved,
    so the contribution of this split to the potential increase is $2 X^2 \/ \( u W_t \)$.
    We next bound this cost by a quadratic form.
  ===== 4.2 The quadratic bound on each split. <the-quadratic-bound-on-each-split.>
  For an unprocessed slot $t$, define a symmetric matrix $V_t \( R \)$ on $R$, with zero diagonal.
    For $i eq.not j$, its $i j$ entry is the weight total obtained by including $B union \( R \\ { i \, j } \)$,
    including both elements of $E_t$, and choosing one element from each other unprocessed slot;
    all other displayed elements and all of $C$ are excluded. At the root,
  #[#set math.equation(numbering: n => "(14)")
   $ \( V_t \( { p \, d } \) \)_(p d) = v_t . $ <eq:rootV>]
  For the next slot $E_t = { a \, b }$, construct a quadratic from $F^or$,
    whose variables record omitted elements. Differentiate in $C$ and in the unchosen element of each of the $k$
    processed slots, and set these variables and the variables of $B$ to zero.
    In each unprocessed slot other than $t$, identify its two variables and extract exponent one.
    The remaining degree is
  $ n - \( n - 1 - m + k \) - \( m - k - 1 \) = 2 . $
  Call its Hessian $A$. Its active variables are exactly $R union { a \, b }$.
    They have not been identified and remain multiaffine, so every diagonal entry of $A$ is zero.
    The off-diagonal entries are read as follows; here $i \, j in R$ are distinct,
    and every active element not listed as omitted is selected:
  #[#set math.equation(numbering: n => "(15)")
   $ upright("active omissions") & upright("selected elements of ") E_t & upright("Hessian entry")\
i \, j & a \, b & A_(i j) = \( V_t \( R \) \)_(i j)\
i \, b & a & A_(i b) = s_i^a\
i \, a & b & A_(i a) = s_i^b\
a \, b & diameter & A_(a b) = u $ <eq:transportHessian>]
  Thus $V_t \( R \)$ is the old–old block of $A$, and $A$ has at most one positive eigenvalue by the quadratic
    signature property.
  Let $e = e_a + e_b$. Then $e^top A e = 2 u > 0$, so $A$ is negative semidefinite on its $A$-orthogonal
    complement. Extend $h = \( h_i \( R \) \)_(i in R)$ by zero on $a \, b$.
    Both $h$ and $e_a - e_b$ lie in this orthogonal complement:
    for $h$ this is (12), and for $e_a - e_b$ it follows from the zero diagonals. With $X$ as defined above, we have
  $ h^top A \( e_a - e_b \) = - 2 X \, wide \( e_a - e_b \)^top A \( e_a - e_b \) = - 2 u . $
  Cauchy–Schwarz for the negated form therefore gives
  #[#set math.equation(numbering: n => "(16)")
   $ frac(2 X^2, u) lt.eq - h^top V_t \( R \) h . $ <eq:splitbound>]
  This is a bound on the cost of introducing the new hole. It uses nonpositivity only on the $A$-orthogonal
    complement of $e$, not on the entire space of hole values.
  ===== 4.3 A conserved quantity for future slots. <a-conserved-quantity-for-future-slots.>
  If $t'$ is processed later than $t$, then
  #[#set math.equation(numbering: n => "(17)")
   $ sum_(l in { a \, b }) h \( R union { l } \)^top V_(t') \( R union { l } \) h \( R union { l } \) =
     h \( R \)^top V_(t') \( R \) h \( R \) . $ <eq:futureconservation>]
  For entries between old holes, the two child totals add to the parent total because slot $t$ is singly occupied.
    An entry between an old hole and the new hole is the same in both children: slot $t$ is then empty.
    The corresponding cross terms cancel because the two new $h$ values are opposite. The new diagonal is zero.
    This proves the identity.
  Thus the quadratic expression for a future slot is conserved when an earlier slot is split.
    The potential itself can increase; the identity lets us sum the bounds for that increase using the original
    root data.
  By (16), the potential increase at node $R$ is at most $- h \( R \)^top V_t \( R \) h \( R \) \/ W_t$.
    Repeated use of (17) gives, just before slot $t$ is processed,
  $ sum_(R upright(" at level ") t - 1) h \( R \)^top V_t \( R \) h \( R \) =
    h \( { p \, d } \)^top V_t \( { p \, d } \) h \( { p \, d } \) = - frac(2 v_t, s_p s_d) . $
  The total increase at this level is therefore at most $2 v_t \/ \( s_p s_d W_t \)$. Summing over the slots gives
  #[#set math.equation(numbering: n => "(18)")
   $ Phi_m lt.eq Phi_0 + frac(2, s_p s_d) sum_(t = 1)^m v_t / W_t = frac(1, s_p W_p) + frac(1, s_d W_d) +
     frac(2, s_p s_d) sum_(t = 1)^m v_t / W_t . $ <eq:potentialbound>]
  ===== 4.4 Realizing the demands by edge flows. <realizing-the-demands-by-edge-flows.>
  At a leaf $R$, each hole $i in R$ gives the vertex $S_i = B union \( R \\ { i } \)$, and $s_i \( R \) =
    f \( S_i \)$. These vertices form a clique of allowed exchanges.
    Give $S_i$ prescribed divergence $g_i = f \( S_i \) h_i \( R \)$; their sum is zero.
    Choose a hub maximizing $W_i f \( S_i \)$. On the edge from each nonhub $S_i$ to the hub,
    send signed current $g_i$. The hub automatically has the prescribed divergence,
    and the energy of this clique flow is
  $ sum_(i upright(" nonhub")) frac(g_i^2, W_i f \( S_i \)) lt.eq sum_(i in R) frac(f \( S_i \) h_i \( R \)^2, W_i) . $
  Every used edge determines its leaf: the union of its endpoints is $B union R$.
    Thus distinct leaf flows use disjoint edges, and their total energy is at most $Phi_m$.
    Edges that flip a selected element within an ordinary slot without changing the hole are unused.
  An endpoint vertex in $cal(X)_p$ or $cal(X)_d$ has a unique leaf representation.
    Its divergence is respectively $f \( S \) \/ s_p$ or $- f \( S \) \/ s_d$, since the root values of $h_p \,
    h_d$ never change. A vertex missing an ordinary slot has exactly two leaf representations,
    corresponding to the two choices of the element of that slot in $R$.
    These representations have the same choices in every other slot and therefore the same recursion prefix before
    their missing slot is processed. Their two $h$ values were introduced with opposite signs in (13) and
    thereafter remained unchanged; the vertex weight $f \( S \)$ is the same in both representations.
    Its divergences cancel. 1 shows this cancellation and the distinction between shared vertices and disjoint
    used edges.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$R_0=\{p,d\}$\(root\)#linebreak()$h_p=1"/"s_p, h_d=-1"/"s_d$]])
  content((0, -1.15), [#text(size: 9pt)[$R$]])
  line((0, -0.4643), (0, -0.9357), stroke: (thickness: 0.5pt, miter-limit: 10, dash: "dashed"), mark: (end: ">"))
  content((0.1058, -0.575), [#text(size: 9pt)[common prefix]], anchor: "west", padding: 0.1058cm)
  content((0, -2.05), [#text(size: 9pt)[process $E_t=\{a,b\}$]])
  content((-3.35, -2.35), [#text(size: 9pt)[$R union \{a\}$#linebreak()$h_a=-X"/"u$]])
  content((3.35, -2.35), [#text(size: 9pt)[$R union \{b\}$#linebreak()$h_b=X"/"u$]])
  line((-0.2328, -1.233), (-2.665, -2.105), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: ">"))
  line((0.2328, -1.233), (2.744, -2.133), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: ">"))
  content((-3.35, -3.7), [#text(size: 9pt)[$L_a=R union \{a\} union U$]])
  content((3.35, -3.7), [#text(size: 9pt)[$L_b=R union \{b\} union U$]])
  line((-3.35, -2.809), (-3.35, -3.435), stroke: (thickness: 0.5pt, miter-limit: 10, dash: "dashed"), mark: (end: ">"))
  line((3.35, -2.809), (3.35, -3.435), stroke: (thickness: 0.5pt, miter-limit: 10, dash: "dashed"), mark: (end: ">"))
  content((0, -3.05), [#text(size: 9pt)[same later choices $U$#linebreak()$h_a,h_b$ unchanged]])
  content((0, -5.05), [#box(inset: 0.1764cm, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S=B union R union U$\(slot $t$ empty\)#linebreak()total divergence $0$]]])])
  line((-2.693, -3.965), (-1.291, -4.53), stroke: (thickness: 0.5pt, miter-limit: 10, dash: "dashed"))
  content((-1.816, -4.375), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$-f(S)X"/"u$]]])], anchor: "east")
  line((2.693, -3.965), (1.291, -4.53), stroke: (thickness: 0.5pt, miter-limit: 10, dash: "dashed"))
  content((1.816, -4.375), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$+f(S)X"/"u$]]])], anchor: "west")
  content((0, -4.05), [#text(size: 9pt)[divergence contributions]])
  content((0, -6.15), [#text(size: 9pt)[Each used edge in a leaf $L$ satisfies $S_i union S_j=B union L$.#linebreak()Used edges determine their leaf; vertices may be shared.]])
})],
    caption: [Figure 1: The recursive split and cancellation of an ordinary-hole divergence. Here $X = sum_(i in R) h_i \( R \) s_i^a$, and $u$ is the common new-hole total. Let $U$ contain one selected element from every ordinary slot processed after $t$. Using the same $U$ gives the two leaves $L_a \, L_b$ and their shared state $S = B union R union U$. Its two divergence contributions cancel. The lines describe analytical construction and contributions, not chain transitions or current directions. Leaf flows may share vertices but use disjoint edges; states missing $p$ or $d$ each have one leaf representation. The algorithm does not compute this recursion. ],
  ) <fig:transport>
  The resulting flow has the required divergences and energy at most $Phi_m$. Equations (11) and (18) prove (10).
    The construction also covers $m = 0$, when there is only the root clique. ◻
]

== 5 A chain and its observable Poincaré bound <sec:chain>

We now apply transport to a Metropolis chain on transversals and defect states.
  The target is a variance bound that retains all values on transversals and only the mean within each defect
  class. We prove its two components separately before combining them.

Fix $q in \( 0 \, 1 \]$. For each defect type $i j$, choose a positive multiplier $w_(i j)$, and define

#[#set math.equation(numbering: n => "(19)")
 $ lambda \( S \) =
   cases(delim: "{", f_q \( S \) \, & S in Omega_0 \,, w_(i j) f_q \( S \) \, & S in Omega_(i j) \,) wide Lambda =
   sum_(S in Omega) lambda \( S \) \, wide pi \( S \) = frac(lambda \( S \), Lambda) . $ <eq:chainweights>]

The conditional law on transversals is $mu \( S \) = f_q \( S \) \/ c_0$ for $S in Omega_0$;
  it does not depend on the multipliers. Call the multipliers #emph[good] if

#[#set math.equation(numbering: n => "(20)")
 $ 1 / 4 w_(i j)^(*) lt.eq w_(i j) lt.eq 4 w_(i j)^(*) \, wide w_(i j)^(*) = c_0 / c_(i j) . $ <eq:good>]

For good multipliers,

#[#set math.equation(numbering: n => "(21)")
 $ Lambda lt.eq 5 n^2 c_0 \, wide pi \( Omega_0 \) gt.eq frac(1, 5 n^2) \, wide pi \( Omega_(i j) \) gt.eq
   frac(1, 20 n^2) . $ <eq:typemasses>]

Indeed each defect has total multiplied weight between $c_0 \/ 4$ and $4 c_0$, and there are $n \( n - 1 \)$ defects.

===== 5.1 The Metropolis chain. <the-metropolis-chain.>

At a state $S$, stay put with probability $1 \/ 2$. Otherwise choose uniformly and independently $a in S$ and $b
  in V \\ S$, and propose $S' = S \\ { a } union { b }$. Reject if $S' in.not Omega$;
  otherwise accept with probability $min { 1 \, lambda \( S' \) \/ lambda \( S \) }$.
  Write $P$ for its transition matrix.

This is a reversible chain with stationary law $pi$. It is irreducible:
  any two transversals are connected by flips within pairs,
  and each defect can reach a transversal by moving an element from its full pair to its empty pair.
  All these transitions have positive probability. It is lazy, with $P \( S \, S \) gt.eq 1 \/ 2$.

For $H : Omega arrow.r bb(R)$, define the unnormalized energy

#[#set math.equation(numbering: n => "(22)")
 $ D \( H \) = sum_({ S \, S' }\
S \, S' in Omega \, med \| S triangle.stroked.t S' \| = 2) min { lambda \( S \) \,
  lambda \( S' \) } #scale(x: 120%, y: 120%)[\(] H \( S \) - H \( S' \) #scale(x: 120%, y: 120%)[\)]^2 . $ <eq:D>]

Each undirected edge is counted once. The Dirichlet form is

#[#set math.equation(numbering: n => "(23)")
 $ cal(E) \( H \) = chevron.l H \, \( I - P \) H chevron.r_pi = frac(D \( H \), 2 n^2 Lambda) . $ <eq:Dirichlet>]

Here $chevron.l G \, H chevron.r_pi = sum_S pi \( S \) G \( S \) H \( S \)$.

=== 5.1 Variation on transversals <variation-on-transversals>

The first application recursively conditions the transversal law.
  At each node, the defect-total inequalities select a pair for which the transport coefficient is bounded,
  and variance decomposition assembles the resulting estimates.

#thm([Lemma 5.1.])[
  #emph[For good multipliers and every $H : Omega arrow.r bb(R)$,
#[#set math.equation(numbering: n => "(24)")
 $ "Var"_mu H lt.eq C_(upright(p)) frac(D \( H \), c_0) \, wide C_(upright(p)) =
   n \( 1 + 8 n \) . $ <eq:transversalvariance>]

]
] <lem:transversalvariance>

#proof[
  We construct a binary tree that successively conditions the transversal law.
    We choose each branching pair to control the transport coefficient at that node.
    At a node with partial assignment $sigma$, set
  $ a_(i j) = c_(i j)^sigma / z_sigma c_(j i) / c_0 quad \( i eq.not j upright(" unassigned") \) . $
  3, used both conditionally and with the global indices reversed, gives
  #[#set math.equation(numbering: n => "(25)")
   $ a_(i j) a_(j i) lt.eq 1 / 16 \, wide a_(i j) a_(j k) lt.eq
     a_(i k) quad \( i \, j \, k upright(" distinct") \) . $ <eq:scores>]
  Draw an arc $i arrow.r j$ when $a_(i j) > 1$. There is no two-cycle,
    and arcs are transitive on distinct vertices. A shortest directed cycle of length at least three would
    therefore have a shorter cycle. The graph is acyclic and has a sink $k$. Thus
  #[#set math.equation(numbering: n => "(26)")
   $ c_(k t)^sigma / z_sigma c_(t k) / c_0 lt.eq 1 quad upright("for every other unassigned pair ") t . $ <eq:sink>]
  If only one pair remains, take that pair and the condition is vacuous.
    Branch by specifying which element of pair $k$ is chosen.
  Apply 4 with the assignment $sigma$ fixed, the two elements of pair $k$ as singleton slots $p \, d$,
    and the other unassigned pairs as ordinary slots. The class $cal(X)_p$ selects $d$,
    and $cal(X)_d$ selects $p$. They are the two children, so $s_p + s_d = z_sigma$ and $W_p = W_d = 1$.
    If ordinary slot $t$ is empty, pair $k$ is full; hence $W_t = w_(t k)$. Also $v_t = c_(k t)^sigma$.
    Goodness and (26) imply
  #[#set math.equation(numbering: n => "(27)")
   $ v_t / W_t lt.eq 4 frac(c_(k t)^sigma c_(t k), c_0) lt.eq 4 z_sigma . $ <eq:sinkbound>]
  Let $D_sigma \( H \)$ be the sum in (22) over all edges whose endpoints respect $sigma$.
    The transport graph is a subgraph of this graph with the same unnormalized conductances.
    Multiplying (10) by $s_p s_d \/ z_sigma$ therefore yields
  #[#set math.equation(numbering: n => "(28)")
   $ frac(s_p s_d, z_sigma) \( overline(H)_p - overline(H)_d \)^2 lt.eq
     (1 + 2 / z_sigma sum_t v_t / W_t) D_sigma \( H \) lt.eq \( 1 + 8 n \) D_sigma \( H \) . $ <eq:nodevariance>]
  Unnormalized variance decomposition at every node says that $c_0 "Var"_mu
    H$ is the sum of the left side of (28) over all internal nodes; the leaves are singleton transversals.
    At any fixed depth, the sets of vertices respecting different nodes are disjoint.
    Indeed, two nodes inherit contradictory choices at the pair where their paths first diverged,
    even though later choices of branching pair may differ. Hence the sum of $D_sigma \( H \)$ at that depth is at
    most $D \( H \)$. There are $n$ internal depths, giving (24). ◻
]

=== 5.2 Means of defect classes <means-of-defect-classes>

The second application connects a whole defect class to a transversal event of probability at least one quarter.
  The preceding variance bound then connects that conditional mean to the full transversal mean.

Let $overline(H)_T = bb(E)_pi \[ H divides Omega_T \]$. Within each type the multiplier is constant,
  so this is also the conditional mean for unmultiplied weights $f_q$.

#thm([Lemma 5.2.])[
  #emph[Assume the multipliers are good, and let $H : Omega arrow.r bb(R)$.
    For each defect type $i j$ there is an event $cal(A) subset.eq
    Omega_0$ obtained by prescribing the selected elements in pairs $i \, j$, with $mu \( cal(A) \) gt.eq 1 \/ 4$.
    Its conditional mean $overline(H)' = bb(E)_mu \[ H divides cal(A) \]$ satisfies
#[#set math.equation(numbering: n => "(29)")
 $ \( overline(H)_(i j) - overline(H)' \)^2 lt.eq C_(upright(d)) frac(D \( H \), c_0) \, wide C_(upright(d)) = 8 +
   32 n \, $ <eq:defecttransfer>]

 and
#[#set math.equation(numbering: n => "(30)")
 $ \( overline(H)' - overline(H)_0 \)^2 lt.eq 4 "Var"_mu H . $ <eq:conditionalmean>]

]
] <lem:defecttransfer>

#proof[
  Among the four assignments at pairs $i \, j$, choose one whose transversal total is at least $c_0 \/ 4$.
    Denote its chosen elements by $a_i \, a_j$ and their mates by $b_i \, b_j$,
    and let $cal(A)$ be this transversal event. In 4, set
  $ B = { a_j } \, wide C = { b_i } \, wide p = a_i \, wide d = b_j \, $
  and use the remaining original pairs as ordinary slots. The singleton slots now belong to different original
    pairs. For any ordinary slot $E_t = { x_t \, y_t }$, the following display records the selected elements in
    pairs $i \, j \, t$. Here $u_t$ is either element of $E_t$, and every other ordinary pair is singly occupied:
  $ & upright("pair ") i & upright("pair ") j & upright("pair ") t\
cal(X)_p & diameter & { a_j \, b_j } & { u_t }\
cal(X)_d & { a_i } & { a_j } & { u_t }\
cal(X)_t & { a_i } & { a_j \, b_j } & diameter\
upright("sets counted by ") v_t & diameter & { a_j } & E_t $
  Thus $cal(X)_p = Omega_(i j)$ and $cal(X)_d = cal(A)$, giving
  $ s_p = c_(i j) \, quad W_p = w_(i j) \, quad s_d gt.eq c_0 \/ 4 \, quad W_d = 1 . $
  For an ordinary hole $t$, the class $cal(X)_t$ is contained in $Omega_(t j)$,
    with the choice $a_i$ fixed at pair $i$, so $W_t = w_(t j)$. The sets counted by $v_t$ lie outside $cal(X)$:
    both singleton slots are missing and $E_t$ is doubled. In the original pairing they form the subset of
    $Omega_(i t)$ with $a_j$ selected, so $v_t lt.eq c_(i t)$.
  The first two terms of the coefficient in (10) are each at most $4 \/ c_0$.
    For each ordinary slot, goodness and 3 give
  $ frac(2 v_t, s_p s_d W_t) lt.eq frac(8 c_(i t) c_(t j), c_(i j) s_d c_0) lt.eq 8 / s_d lt.eq 32 / c_0 . $
  The transport subgraph again uses the unnormalized conductances in $D$, so (29) follows.
    Finally, since $mu \( cal(A) \) gt.eq 1 \/ 4$, Jensen’s inequality on $cal(A)$ gives (30). ◻
]

Define $sans(Q)$ on functions on $Omega$ by retaining every value on $Omega_0$ and replacing the values on each
  defect class by that class’s conditional mean. It is the orthogonal projection in $L^2 \( pi \)$ onto the
  functions that are constant on each defect class. It fixes constants and preserves expectations.
  This is the block-averaging operator for the partition with one singleton block for each transversal and one
  block for each defect class. The bound below is a partition-restricted Poincaré inequality in the sense of [11]
  Definition 4.

The inequality below controls $sans(Q) H$, not every fluctuation of $H$ within a defect class.
  This is precisely the distinction needed for the two simulation estimates in 6.

#thm([Proposition 5.3.])[
  (Observable Poincaré inequality).  #emph[For good multipliers and every $H : Omega arrow.r bb(R)$,
#[#set math.equation(numbering: n => "(31)")
 $ "Var"_pi \( sans(Q) H \) lt.eq K_(upright("obs")) cal(E) \( H \) \, wide K_(upright("obs")) =
   2000 n^6 . $ <eq:observable>]

]
] <prop:observable>

#proof[
  Bound the variance by the squared deviation from $overline(H)_0$. By Lemma 5.1, Lemma 5.2,
  $ "Var"_pi \( sans(Q) H \) & lt.eq pi \( Omega_0 \) "Var"_mu H +
    sum_(i j) pi \( Omega_(i j) \) \( overline(H)_(i j) - overline(H)_0 \)^2\
 & lt.eq "Var"_mu H + 2 C_(upright(d)) frac(D \( H \), c_0) + 8 "Var"_mu H\
 & lt.eq \( 9 C_(upright(p)) + 2 C_(upright(d)) \) frac(D \( H \), c_0) . $
  Using (21), (23), the final expression is at most
  $ 10 n^4 \( 72 n^2 + 73 n + 16 \) cal(E) \( H \) lt.eq 1610 n^6 cal(E) \( H \) < 2000 n^6 cal(E) \( H \) . $
  ◻
]

== 6 Two consequences for simulation <sec:probability>

We need two controls of the chain: accurate time averages of observables fixed by $sans(Q)$,
  and mixing of the trace that records successive visits to $Omega_0$.
  The averages learn type probabilities and annealing ratios;
  the trace supplies warm transversal starts for those averages.
  The proofs use finite reversible-chain facts about correlated averages, traces, and return times;
  see [1] Sections 2.7.1 and 4.4.1, Corollary 2.24. We include the arguments to retain their exact normalizations
  and warm-start hypotheses.

=== 6.1 Time averages from a warm start <time-averages-from-a-warm-start>

The stationary estimate is the restricted-Poincaré empirical-average bound of Chen, Vigoda,
  and Yang [11] Theorem 5(ii) and Section 3.6. Its dual-energy argument also has the earlier antecedent of Kipnis
  and Varadhan [18] Section 3. We include the finite-chain proof and extend it to a warm start by domination of
  trajectory laws.

For probability distributions $nu \, pi$ on a finite set, write $nu lt.eq U pi$ to mean pointwise domination.
  Such a start is called $U$-warm.

#thm([Lemma 6.1.])[
  #emph[Suppose the multipliers are good. If $G = sans(Q) G$ and a trajectory $\( X_t \)$ of $P$ starts with law
    $nu lt.eq U pi$, then for every integer $N gt.eq 1$,
#[#set math.equation(numbering: n => "(32)")
 $ bb(E)_nu [(1 / N sum_(t = 0)^(N - 1) G \( X_t \) - bb(E)_pi G)^2] lt.eq
   frac(2 U K_(upright("obs")) "Var"_pi G, N) . $ <eq:MSE>]

]
] <lem:timeaverages>

#proof[
  First start in stationarity and put $g = G - bb(E)_pi G$. For any $H$, orthogonality of the projection and (31) imply
  $ \| chevron.l g \, H chevron.r_pi \|^2 = \| chevron.l g \, sans(Q) H chevron.r_pi \|^2 lt.eq
    "Var"_pi G thin "Var"_pi \( sans(Q) H \) lt.eq K_(upright("obs")) "Var"_pi G thin cal(E) \( H \) . $
  On the mean-zero subspace $I - P$ is invertible, because $P$ is finite and irreducible.
    Take $H = \( I - P \)^(- 1) g$ and use $cal(E) \( H \) = chevron.l g \, H chevron.r_pi$. This gives
  #[#set math.equation(numbering: n => "(33)")
   $ chevron.l g \, \( I - P \)^(- 1) g chevron.r_pi lt.eq K_(upright("obs")) "Var"_pi G . $ <eq:resolvent>]
  Reversibility makes $P$ self-adjoint, and laziness puts its eigenvalues on the mean-zero subspace in
    $\[ 0 \, 1 \)$. Indeed $P = \( I + R \) \/ 2$ for a reversible stochastic matrix $R$,
    whose spectrum lies in $\[ - 1 \, 1 \]$. Consequently,
  $ chevron.l g \, \( I - P \)^(- 1) g chevron.r_pi = sum_(t gt.eq 0) chevron.l g \, P^t g chevron.r_pi \, wide
    chevron.l g \, P^t g chevron.r_pi gt.eq 0 . $
  In the variance of the stationary average, the coefficient of each of these covariances is at most $2 \/ N$.
    This proves (32) for $U = 1$. Finally, $nu lt.eq U pi$ implies the same domination for the entire trajectory
    law. Applying it to the nonnegative squared error proves the general case. ◻
]

=== 6.2 The trace on transversals <the-trace-on-transversals>

Set $A = Omega_0$. Starting from $x in A$, let $tau_A^(+) = min { t gt.eq 1 : X_t in A }$.
  The #emph[trace transition] $P_A \( x \, y \) = bb(P)_x \( X_(tau_A^(+)) = y \)$ records the next visit to $A$,
  including a possible visit at time one. All hitting and return times have finite expectation,
  since the underlying chain is finite and irreducible. For completeness,
  from every state there is a positive-probability path to $A$ of bounded length;
  taking the minimum of these finitely many positive path probabilities gives a geometric tail in blocks of that length.

#thm([Lemma 6.2.])[
  #emph[With good multipliers, $P_A$ is reversible with stationary law $mu$, irreducible, and lazy.
    Its inverse spectral gap is at most $18 n^4$. In particular, for every integer $s gt.eq 0$,
#[#set math.equation(numbering: n => "(34)")
 $ lr(|frac(P_A^s \( x \, y \), mu \( y \)) - 1|) lt.eq
   frac(exp \( - s \/ \( 18 n^4 \) \), min_(z in A) mu \( z \)) quad \( x \, y in A \) . $ <eq:tracemixing>]

 If a trace step begins with a law $nu lt.eq U mu$, its expected number of underlying transitions is at most
#[#set math.equation(numbering: n => "(35)")
 $ frac(U, pi \( A \)) lt.eq 5 U n^2 . $ <eq:returncost>]

]
] <lem:trace>

#proof[
  For $h : A arrow.r bb(R)$, let $H$ be its harmonic extension:
    $H = h$ on $A$ and $H \( x \) = bb(E)_x \[ h \( X_(tau_A) \) \]$ off $A$, where $tau_A = min { t gt.eq 0 :
    X_t in A }$. Conditioning on the first step gives
  $ \( I - P \) H = 0 med upright(" off ") A \, wide \( \( I - P \) H \) \|_A = \( I - P_A \) h . $
  For two such extensions, symmetry of $I - P$ implies symmetry of $I - P_A$ in $L^2 \( mu \)$, since $pi \|_A =
    pi \( A \) mu$. Thus $P_A$ is reversible and $mu$ is stationary.
    Irreducibility follows by tracing paths in the original chain, and $P_A \( x \, x \) gt.eq
    P \( x \, x \) gt.eq 1 \/ 2$. Taking the same extension in both slots gives
  #[#set math.equation(numbering: n => "(36)")
   $ cal(E) \( H \) = pi \( A \) chevron.l h \, \( I - P_A \) h chevron.r_mu . $ <eq:traceenergy>]
  Because $pi \( A \) = c_0 \/ Lambda$, (23) gives $D \( H \) \/ c_0 = 2 n^2 cal(E) \( H \) \/ pi \( A \)$.
    Applying 5 to $H$ therefore yields
  $ "Var"_mu h lt.eq 2 n^2 C_(upright(p)) chevron.l h \, \( I - P_A \) h chevron.r_mu \, wide
    2 n^2 C_(upright(p)) lt.eq 18 n^4 . $
  This proves the spectral-gap bound. Laziness makes every nonconstant trace eigenvalue nonnegative.
    Applying the centered operator norm bound to the point densities at $x \, y$,
    whose centered $L^2 \( mu \)$ norms are at most $mu \( x \)^(- 1 \/ 2) \, mu \( y \)^(- 1 \/ 2)$, gives
  $ lr(|frac(P_A^s \( x \, y \), mu \( y \)) - 1|) lt.eq
    frac(\( 1 - 1 \/ \( 18 n^4 \) \)^s, sqrt(mu \( x \) mu \( y \))) \, $
  which implies (34).
  To prove the cost statement, start a return excursion with distribution $mu$ and let $v \( z \)$ be the expected
    number of visits to $z$ at times $0 \, dots.h \, tau_A^(+) - 1$.
    Multiplying $v$ by $P$ shifts these expected occupations to times $1 \, dots.h \, tau_A^(+)$.
    The initial and final laws are both $mu$, so $v P = v$. By uniqueness of the stationary law,
    $v$ is a scalar multiple of $pi$. Since $v \|_A = mu$, that scalar is $1 \/ pi \( A \)$.
    Summing over $z$ proves $bb(E)_mu tau_A^(+) = 1 \/ pi \( A \)$.
    Domination of the starting law gives the factor $U$, and (21) finishes (35). ◻
]

== 7 Annealing and learning the multipliers <sec:algorithm>

The initial transversal weight is known at $q = 1$. We estimate its successive ratios as $q$ decreases,
  while learning multipliers that keep every type sufficiently frequent.
  The trace supplies a fresh warm start for each estimation phase,
  and the observable variance bound controls the resulting averages.
  The frequency-ratio updates and balancing of defect totals adapt the interpolation strategy of Jerrum, Sinclair,
  and Vigoda [16]; the warm restarts below use the trace and observable estimates proved here.

We first specify a run with constant success probability using exact rational random choices.
  The next section gives a bounded-bit implementation and amplification.
  The feasibility test in 2 is performed before these runs.

=== 7.1 Parameters and the schedule <parameters-and-the-schedule>

Let $b$ be the least nonnegative integer with $2^(- b) lt.eq epsilon.alt \/ 10$, and set

#[#set math.equation(numbering: n => "(37)")
 $ rho = 1 - frac(1, 2 n) \, wide L = 2 n \( n + b \) \, wide q_j = rho^j med \( 0 lt.eq j lt.eq L \) \, wide
   eta = frac(epsilon.alt, 32 \( L + 1 \)) . $ <eq:schedule>]

The restart and estimation routines use three integer parameters:

#[#set math.equation(numbering: n => "(38)")
 $ tau & = 20 n^4 #scale(x: 120%, y: 120%)[\(] n \( L + 1 \) + 2 #scale(x: 120%, y: 120%)[\)] \,\
B_(upright("restart")) & = 2000 \( L + 1 \)^2 n^2 tau \,\
N_(upright("av")) & = ⌈frac(10^10 \( L + 1 \) n^14, eta^2)⌉ . $ <eq:parameters>]

Here $tau$ is the number of trace transitions at each restart stage,
  $B_(upright("restart"))$ caps the total underlying transition attempts in one restart,
  and $N_(upright("av"))$ is the number of observations in one estimation phase.
  We make no attempt to optimize these polynomial bounds.

Bernoulli’s inequality and $1 - x lt.eq e^(- x)$ give

#[#set math.equation(numbering: n => "(39)")
 $ rho^n gt.eq 1 / 2 \, wide rho^(2 n) lt.eq e^(- 1) < 1 / 2 \, wide 2^(- L) lt.eq q_L lt.eq
   2^(- \( n + b \)) . $ <eq:schedulebounds>]

For every state and every $j < L$,

#[#set math.equation(numbering: n => "(40)")
 $ 1 / 2 lt.eq frac(f_(q_(j + 1)) \( S \), f_(q_j) \( S \)) = rho^(d \( S \)) lt.eq 1 . $ <eq:stepweight>]

The same inequalities hold for each ratio $c_T \( q_(j + 1) \) \/ c_T \( q_j \)$.
  Thus the ideal multiplier $w_(i j)^(*) = c_0 \/ c_(i j)$ changes by a factor between $1 \/ 2$ and $2$ per phase.
  Write $mu_j$ for the transversal law at $q_j$. Equation (40) also gives

#[#set math.equation(numbering: n => "(41)")
 $ mu_j lt.eq 2 mu_(j + 1) . $ <eq:mudrift>]

=== 7.2 One run <one-run>

At $q_0 = 1$, $mu_0$ is uniform on the $2^n$ transversals, $c_0 = 2^n$, and $c_(i j) =
  2^(n - 2)$ whenever a defect type exists. Initialize $w_(i j)^(\( 0 \)) = 4$.
  Store every subsequent phase’s multipliers as they are learned.

The observations used to learn these multipliers also reveal the preceding trajectory’s endpoint.
  After conditioning on that history, the endpoint need not satisfy the polynomial warm-start bound needed below.
  Each phase therefore generates a fresh starting transversal from the known law $mu_0$,
  through the stored parameter levels and with independent randomness.

For $j = 0 \, dots.h \, L - 1$, perform the following steps. Any abort mentioned below returns zero from the run.

+ #strong[Restart to obtain a warm transversal.] Start from a uniform transversal, using $n$ fair bits.
  For $a = 1 \, dots.h \, j$, perform $tau$ trace transitions at parameter $q_a$ with the stored multipliers
  $w^(\( a \))$. Each trace transition is implemented by running the underlying Metropolis chain until the next
  visit to $Omega_0$, at a strictly positive time. The endpoint of one stage is the starting transversal of the
  next. Before attempting an underlying transition, reserve one unit from a budget of $B_(upright("restart"))$ for
  this entire restart; if no unit remains, abort before drawing any bits for that transition.
  For $j = 0$, simply use the initial uniform transversal. All randomness for this restart is independent of the
  previous phase history.
+ #strong[Estimate type probabilities and a ratio.] Using fresh random bits,
  run the chain from that transversal at $q_j \, w^(\( j \))$ and observe $N_(upright("av"))$ consecutive states,
  including the starting state. Let $hat(p)_T$ be the empirical average of $upright(bold(1))_(Omega_T)$ for every
  type $T in cal(T)$, and let $hat(u)$ be the empirical average of
  #[#set math.equation(numbering: n => "(42)")
   $ G_j \( S \) = upright(bold(1))_(Omega_0) \( S \) rho^(d \( S \)) . $ <eq:ratioobservable>]
  Abort if any $hat(p)_T$ is zero.
+ #strong[Record the ratio and update the multipliers.] Set
  #[#set math.equation(numbering: n => "(43)")
   $ hat(R)_j = hat(u) / hat(p)_0 . $ <eq:updates>]
  If $j + 1 < L$, set, for every defect type,
  #[#set math.equation(numbering: n => "(44)")
   $ w_(i j)^(\( j + 1 \)) = w_(i j)^(\( j \)) hat(p)_0 / hat(p)_(i j) . $ <eq:weightupdate>]
  This estimates the current ideal multiplier; the superscript $j + 1$ records the phase in which it will be used.
    The factor-two drift in the ideal multiplier permits using an accurate estimate at the next parameter while
    retaining the factor-four bound in (20).

If every phase completes, output

#[#set math.equation(numbering: n => "(45)")
 $ hat(Z) = 2^n product_(j = 0)^(L - 1) hat(R)_j . $ <eq:estimator>]

=== 7.3 Warm restarts and estimation error <warm-restarts-and-estimation-error>

Condition on any complete previous phase history in which all stored multipliers are good at their respective
  parameters. Under this conditioning the fresh restart uses fixed kernels and independent randomness,
  starting from the known law $mu_0$. Analyze the uncapped restart and its subsequent observations;
  the capped process agrees whenever the restart finishes within its cap.

Uniformly over all phases and all transversals, (39) gives

#[#set math.equation(numbering: n => "(46)")
 $ mu_j \( S \) gt.eq q_L^n / 2^n gt.eq 2^(- n \( L + 1 \)) . $ <eq:minmu>]

By 9 and (38), after $tau$ trace transitions the density relative to the current $mu_a$ lies between $1 \/
  2$ and $3 \/ 2$, from any initial distribution. Indeed,

$ exp #scale(x: 120%, y: 120%)[\(] - tau \/ \( 18 n^4 \) #scale(x: 120%, y: 120%)[\)] thin 2^(n \( L + 1 \)) lt.eq
  1 / 2 . $

At the start of each stage the law is at most $4 mu_a$: at the previous parameter it is at most twice that
  parameter’s transversal law, and (41) costs at most a further factor of two.
  For the first stage the starting law is exactly $mu_0$. Pointwise domination by $4
  mu_a$ persists through the stage because $mu_a$ is stationary for its trace.
  Thus (35), applied at each trace step, implies

#[#set math.equation(numbering: n => "(47)")
 $ bb(E) \[ upright("underlying transitions in the restart") \] lt.eq 20 n^2 L tau . $ <eq:restartmean>]

Markov’s inequality yields

#[#set math.equation(numbering: n => "(48)")
 $ bb(P) \[ upright("restart exceeds ") B_(upright("restart")) \] lt.eq frac(L, 100 \( L + 1 \)^2) lt.eq
   frac(1, 32 \( L + 1 \)) . $ <eq:restartfailure>]

The endpoint law of the uncapped restart is at most $2 mu_j$, including the case $j = 0$.
  Since $pi \( Omega_0 \) gt.eq 1 \/ \( 5 n^2 \)$, it is at most $10 n^2 pi$,
  where $pi$ is the enlarged chain’s stationary law at the current parameters.
  Every type indicator and $G_j$ belongs to the range of $sans(Q)$ and takes values in $\[ 0 \, 1 \]$.
  Their stationary means are

#[#set math.equation(numbering: n => "(49)")
 $ p_T = pi \( Omega_T \) \, wide u = p_0 R_j \, wide R_j =
   frac(c_0 \( q_(j + 1) \), c_0 \( q_j \)) . $ <eq:stationarymeans>]

All these means are at least $1 \/ \( 20 n^2 \)$, by (21), (40).
  8 bounds the mean squared error of each empirical average around its stationary mean by

#[#set math.equation(numbering: n => "(50)")
 $ frac(40000 n^8, N_(upright("av"))) . $ <eq:averageMSE>]

There are $n \( n - 1 \) + 2 lt.eq 2 n^2$ observables. Applying Markov’s inequality to each squared error and
  taking a union bound gives

#[#set math.equation(numbering: n => "(51)")
 $ bb(P) #scale(x: 120%, y: 120%)[\[] upright("some relative error exceeds ") eta #scale(x: 120%, y: 120%)[\]] &
   lt.eq 2 n^2 frac(40000 n^8, N_(upright("av"))) frac(400 n^4, eta^2)\
 & lt.eq frac(0.0032, L + 1) lt.eq frac(1, 32 \( L + 1 \)) . $ <eq:estimationfailure>]

Both error probabilities were bounded in the uncapped experiment.
  Their union contains failure of the actual phase, since the two simulations agree whenever the restart finishes
  within its cap. When neither event occurs, all empirical type probabilities are positive and no zero-count abort
  occurs.

=== 7.4 Induction on learned weights <induction-on-learned-weights>

On a phase with all relative errors at most $eta$, the exact identity

$ w_(i j)^(\( j \)) p_0 / p_(i j) = frac(c_0 \( q_j \), c_(i j) \( q_j \)) $

shows that (44) estimates the current ideal multiplier within factors $\( 1 - eta \) \/ \( 1 + eta \)$ and its
  reciprocal. These factors lie between $1 \/ 2$ and $2$. The ideal multiplier changes by at most a factor of two
  at the next parameter, so the new multipliers are good for phase $j + 1$.

Initialization is ideal. Conditional on any previously successful history, (48),
  (51) bound the next phase’s failure probability by $1 \/ \[ 16 \( L + 1 \) \]$.
  Induction and a union bound over all $L$ phases therefore give

#[#set math.equation(numbering: n => "(52)")
 $ bb(P) \[ upright("some restart abort or inaccurate phase") \] lt.eq 1 / 16 . $ <eq:analyticfailure>]

=== 7.5 Accuracy of the product <accuracy-of-the-product>

On the complementary event in (52),

#[#set math.equation(numbering: n => "(53)")
 $ frac(1 - eta, 1 + eta) lt.eq hat(R)_j / R_j lt.eq frac(1 + eta, 1 - eta) . $ <eq:ratioerror>]

Since $eta < 1 \/ 2$ and $log \( \( 1 + eta \) \/ \( 1 - eta \) \) lt.eq 4 eta$, the telescoping product satisfies

$ e^(- 4 L eta) lt.eq frac(hat(Z), c_0 \( q_L \)) lt.eq e^(4 L eta) . $

Here $c_0 \( q_0 \) = 2^n$. Equation (37) gives $4 L eta lt.eq epsilon.alt \/ 8$, and for $0 < epsilon.alt < 1$,

#[#set math.equation(numbering: n => "(54)")
 $ \( 1 - epsilon.alt \/ 4 \) c_0 \( q_L \) lt.eq hat(Z) lt.eq \( 1 + epsilon.alt \/ 4 \) c_0 \( q_L \) .
   $ <eq:productaccuracy>]

Every transversal basis of $K$ has weight one; every other transversal has weight at most $q_L$.
  Therefore, writing $Z = Z \( M_1 \, M_2 \)$,

#[#set math.equation(numbering: n => "(55)")
 $ Z lt.eq c_0 \( q_L \) lt.eq Z + 2^n q_L lt.eq Z + epsilon.alt \/ 10 lt.eq \( 1 + epsilon.alt \/ 10 \) Z \,
   $ <eq:contamination>]

where the final inequality uses the feasibility test, $Z gt.eq 1$. Combining (54), (55) gives

$ \( 1 - epsilon.alt \) Z lt.eq hat(Z) lt.eq \( 1 + epsilon.alt \) Z . $

Thus the run using exact random choices has success probability at least $15 \/ 16$.

== 8 Oracle implementation, bit bounds, and amplification <sec:implementation>

We now implement the run with independent fair bits and bound all work on every execution,
  including those with inaccurate estimates or aborts.

=== 8.1 States and oracle weights <states-and-oracle-weights>

Represent a state by its $2 n$-bit indicator. Its occupancy pattern, a proposed exchange,
  and membership in $Omega$ can be computed in polynomial time.
  For $S subset.eq V$, let $S_x \, S_y subset.eq \[ n \]$ be its positions in the two copies. The required rank is

#[#set math.equation(numbering: n => "(56)")
 $ "rk"_K \( S \) = "rk"_(M_1) \( S_x \) + \| S_y \| - r + "rk"_(M_2) \( \[ n \] \\ S_y \) . $ <eq:oracleweight>]

Both original ranks are computed greedily. This takes at most $2 n$ original independence queries,
  with polynomial overhead for constructing their $n$-bit indicators.
  Consequently no oracle other than the two given independence oracles is needed.

=== 8.2 Sizes of the rational numbers <sizes-of-the-rational-numbers>

The integer $b$ in (37) is $O \( ell \)$ and can be found using shifts and binary comparisons.
  Thus $L$ is polynomial in $n \, ell$. The integers $tau \, B_(upright("restart")) \,
  N_(upright("av"))$ are polynomial in $n \, ell \, epsilon.alt^(- 1)$, since $eta^(- 1) =
  32 \( L + 1 \) epsilon.alt^(- 1)$.

We may store unreduced numerator–denominator pairs throughout.
  If $C_T$ is a type count among the $N_(upright("av"))$ observations,
  then the multiplier update is multiplication by $C_0 \/ C_(i j)$.
  A zero denominator causes an abort before division. After at most $L$ phases,
  all multiplier numerators and denominators have bit length

#[#set math.equation(numbering: n => "(57)")
 $ O #scale(x: 120%, y: 120%)[\(] 1 + L log \( N_(upright("av")) + 1 \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:multiplierbits>]

This bound holds even when the empirical estimates are inaccurate.

For $0 lt.eq d lt.eq n$, the observable $rho^d$ has common denominator $\( 2 n \)^n$ and integer numerator
  $\( 2 n - 1 \)^d \( 2 n \)^(n - d)$. If $X_t$ denotes the $t$th observation in phase $j$ and $C_0 >
  0$ counts the transversals among those observations, the exact implementation is

#[#set math.equation(numbering: n => "(58)")
 $ A_j = sum_(0 lt.eq t < N_(upright("av"))\
X_t in Omega_0) \( 2 n - 1 \)^(d \( X_t \)) \( 2 n \)^(n - d \( X_t \)) \, wide hat(R)_j =
  frac(A_j, \( 2 n \)^n C_0) . $ <eq:integeraccumulator>]

The accumulator has bit length $O \( log \( N_(upright("av")) + 1 \) + n log \( 2 n \) \)$.
  The rational product (45) has bit length

#[#set math.equation(numbering: n => "(59)")
 $ O #scale(x: 120%, y: 120%)[\(] n + L log \( N_(upright("av")) + 1 \) +
   L n log \( 2 n \) #scale(x: 120%, y: 120%)[\)] . $ <eq:outputbits>]

Finally, $q_j^d = \( \( 2 n - 1 \) \/ \( 2 n \) \)^(j d)$ has numerator and denominator bit length
  $O \( 1 + L n log \( 2 n \) \)$. Together with (57), this bounds the sizes of state weights,
  acceptance fractions, and all comparisons by a fixed polynomial.
  Each state weight is formed directly from its rank deficiency, the stored multiplier of its type,
  and $q_j^(d \( S \))$. Integer arithmetic on these lengths, including multiplication, division, and comparison,
  takes polynomial bit operations.

=== 8.3 Exact rational choices with bounded trials <exact-rational-choices-with-bounded-trials>

To draw uniformly from ${ 0 \, dots.h \, v - 1 }$, use $ceil.l log_2 v
  ceil.r$ unbiased bits and reject values at least $v$. For $v = 1$, return zero without drawing bits.
  With unrestricted trials the distribution is exactly uniform,
  and every trial succeeds with probability at least $1 \/ 2$.
  A rational acceptance probability $a \/ v$ is implemented by checking whether this uniform integer is less than
  $a$. The denominators have polynomial bit length by the preceding subsection.

With the restart attempt caps, a run uses at most

#[#set math.equation(numbering: n => "(60)")
 $ M = 3 L \( B_(upright("restart")) + N_(upright("av")) \) $ <eq:drawcount>]

uniform-integer calls: two for the proposed exchange and one for its acceptance, per underlying transition.
  Laziness and initial uniform transversals use fair bits directly.
  Choose the least positive integer $D_(upright("bits"))$ satisfying

#[#set math.equation(numbering: n => "(61)")
 $ M 2^(- D_(upright("bits"))) lt.eq 1 \/ 32 . $ <eq:bitcap>]

Allow at most $D_(upright("bits"))$ trials in each uniform-integer call; if all fail,
  abort the run and return zero. The cap is $O \( 1 + log M \)$.
  Couple this procedure with the unrestricted-trial one using the same random bits up to an abort.
  Conditional on the previous history, a call exceeds its cap with probability at most
  $2^(- D_(upright("bits")))$, even if its denominator depends on that history.
  A union bound over (60) therefore bounds the coupling failure probability by $1 \/ 32$.

Combining this with (52), the bounded run succeeds with probability at least

#[#set math.equation(numbering: n => "(62)")
 $ 1 - 1 / 16 - 1 / 32 = 29 / 32 > 3 / 4 . $ <eq:runsuccess>]

Every execution has at most $L \( B_(upright("restart")) + N_(upright("av")) \)$ underlying transition attempts,
  including any attempt interrupted by a bit-cap abort. If $h_max$ is the polynomial bound on the bit lengths of
  uniform-integer denominators established above, the total number of random bits is at most

$ n L + L \( B_(upright("restart")) + N_(upright("av")) \) + M D_(upright("bits")) h_max . $

The first two terms cover initial transversals and laziness.
  Together with (56) and the rational size bounds, this proves polynomial oracle and bit-operation bounds for a
  run. In particular, exceptional histories affect success probability but cannot cause an unbounded execution.

=== 8.4 Amplification and completion of the proof <amplification-and-completion-of-the-proof>

Let $b_delta$ be the least nonnegative integer with $2^(- b_delta) lt.eq delta$, and perform $J = 10 b_delta +
  1$ independent bounded runs after the feasibility pretest. Return their rational median.
  The number $J$ is odd and is $O \( 1 + log delta^(- 1) \)$.

For each run let $X$ be its failure indicator relative to the desired interval
  $\[ \( 1 - epsilon.alt \) Z \, \( 1 + epsilon.alt \) Z \]$. By (62), $bb(E) \[ 2^X \] lt.eq 5 \/ 4$.
  Independence and Markov’s inequality imply

$ bb(P) \[ upright("at least half the runs fail") \] lt.eq (frac(5, 4 sqrt(2)))^J lt.eq 2^(- b_delta) lt.eq delta \, $

using $\( 5 \/ \( 4 sqrt(2) \) \)^10 < 1 \/ 2$. If a strict majority of estimates lie in the desired interval,
  so does their median. Computing $b_delta$ and comparing rational estimates costs polynomial bit operations,
  including the dependence on $ell$.

For an infeasible input the deterministic pretest returns zero.
  If $n = 0$, the unique common basis is empty and the initial output is one.
  For all remaining ranks, including $r = 0$ and $r = n$, the preceding argument applies.
  Every output is a nonnegative rational, and all complexity bounds are uniform over the two promised independence
  oracles. This proves 1.

== 9 Counting and sampling common independent sets <sec:intersection>

The equal-rank common-bases theorem also gives counting and sampling algorithms for common independent sets when
  the input ranks differ. Truncation reduces prescribed-cardinality counting to common bases;
  self-reduction then supplies sampling.

#thm([Corollary 9.1.])[
  (Common independent sets).  #emph[Let $M_1 \, M_2$ be arbitrary matroids on an explicitly enumerated ground set
    $\[ n \]$, supplied by fixed exact independence oracles with $n$-bit subset queries. Their ranks may differ.
    For an integer $k$, let $cal(C)_k$ consist of the $k$-element subsets of $\[ n \]$ independent in both
    matroids, and put
$ cal(C) = union.big_(j = 0)^n cal(C)_j \, wide h = max_(I in cal(C)) \| I \| \, wide cal(C)_max = cal(C)_h . $

 The maximum $h$ is well defined because $diameter in cal(C)$.
   Each family $cal(F) in { cal(C)_k \, cal(C) \, cal(C)_max }$ has the following algorithms.]
  + #emph[Given rational $epsilon.alt \, delta in \( 0 \, 1 \)$,
    a randomized oracle algorithm returns a nonnegative rational $hat(N)$ satisfying
$ bb(P) #scale(x: 120%, y: 120%)[\[] \( 1 - epsilon.alt \) \| cal(F) \| lt.eq
  hat(N) lt.eq \( 1 + epsilon.alt \) \| cal(F) \| #scale(x: 120%, y: 120%)[\]] gt.eq 1 - delta . $

 If $cal(F) = diameter$, an exact pretest returns $0$ before randomization.
   On every execution, oracle calls and other bit operations are bounded by a fixed polynomial in $n \, ell \,
   epsilon.alt^(- 1) \, log delta^(- 1)$.]
  + #emph[Given rational $theta in \( 0 \, 1 \)$, a randomized oracle algorithm decides emptiness exactly.
    If $cal(F) = diameter$, it returns a distinguished symbol $tack.t$.
    Otherwise it returns $S in cal(F)$ on every execution, and its output law satisfies
$ d_(upright("TV")) #scale(x: 120%, y: 120%)[\(] cal(L) \( S \) \,
  "Unif" \( cal(F) \) #scale(x: 120%, y: 120%)[\)] = 1 / 2 sum_(I in cal(F))
  lr(|bb(P) \[ S = I \] - frac(1, \| cal(F) \|)|) lt.eq theta . $

 On every execution, oracle calls and other bit operations are bounded by a fixed polynomial in $n \, ell \,
   theta^(- 1)$.]
  #emph[Here $ell$ is the binary encoding length of the numerical inputs to the algorithm in question,
    including $k$ only for $cal(C)_k$. Both algorithms use only the two given independence oracles and independent
    unbiased random bits.]
] <cor:intersection>

The counting-to-generation principle for self-reducible families is classical [17] Section 6.
  The direct argument below records the exact independence-oracle interface, the total-variation error,
  and the work bound on every execution.

#proof[
  #strong[Counting by truncation.] Use the deterministic matroid-intersection algorithm [20] Section 41.2,
    Theorem 41.4, already invoked in 2, to find the maximum common independent-set size $h$.
    Its input permits different ranks and requires only the promised matroid axioms, a common explicit ground set,
    and exact independence oracles. If $k < 0$ or $k > h$, then $cal(C)_k$ is empty, so return $0$ for its count.
    If $k = 0$, return $1$. For $0 < k lt.eq h$, define the truncation $T_k \( M_i \)$ by declaring $J$
    independent exactly when it is independent in $M_i$ and $\| J \| lt.eq k$.
    Both truncations have rank exactly $k$: a common independent set of size $h$ contains an independent $k$-set
    in each matroid. Their common bases are therefore precisely $cal(C)_k$.
    A truncation query uses at most one original independence query and a cardinality check,
    so 1 applies with the required oracle and bit bounds even if the original ranks differ.
  For $cal(C)$, estimate each $\| cal(C)_j \|$, $0 lt.eq j lt.eq h$,
    with relative error $epsilon.alt$ and failure probability $delta \/ \( h + 1 \)$,
    and add the nonnegative rational estimates. With probability at least $1 - delta$,
    all estimates satisfy their relative bounds simultaneously. Adding those bounds gives
  $ \( 1 - epsilon.alt \) \| cal(C) \| lt.eq sum_(j = 0)^h hat(N)_j lt.eq \( 1 + epsilon.alt \) \| cal(C) \| . $
  There are at most $n + 1$ terms. For $cal(C)_max$, use the prescribed-cardinality procedure at $k = h$.
    The families $cal(C)$ and $cal(C)_max$ are always nonempty; when $h = 0$, both consist only of the empty set.
    The feasibility tests thus handle every zero-count case exactly.
    Since $log \( \( h + 1 \) \/ delta \) = O \( log \( n + 1 \) + log delta^(- 1) \)$,
    the confidence allocation preserves the stated fully polynomial counting bound.
  #strong[Exact feasibility during self-reduction.] For sampling, first perform the same exact emptiness test,
    returning $tack.t$ if the requested family is empty. If $n = 0$, return $diameter$.
    Otherwise initialize $A = D = diameter$. Maintain disjoint sets $A \, D$ of included and excluded elements,
    with $A$ common independent and at least one requested set consistent with these choices,
    and let $R = \[ n \] \\ \( A union D \)$ be the remaining ground set.
    Define $N_i$ on $R$ by declaring, for $J subset.eq R$,
  #[#set math.equation(numbering: n => "(63)")
   $ J upright(" independent in ") N_i quad arrow.l.r.double quad
     A union J upright(" independent in ") M_i . $ <eq:intersectionminor>]
  The empty set is independent because $A$ is, and heredity and augmentation follow from those of $M_i$.
    Thus $N_i$ is a matroid, namely the restriction to $R$ of the contraction $M_i \/ A$.
    After relabeling $R$, an exact query to either residual minor uses one original query and polynomial work to
    construct its $n$-bit indicator.
  If $R = diameter$, return $A$. Otherwise let $e$ be the least element of $R$.
    The exclusion branch has included set $A$ and excluded set $D union { e }$.
    Before constructing the inclusion branch, test whether $A union {
    e }$ is independent in both original matroids; if not, that branch is empty.
    Otherwise that branch has included set $A union { e }$ and excluded set $D$,
    and (63) again supplies valid minor oracles. The remaining ground set in either branch is $R \\ { e }$.
    For a prescribed original cardinality $t$, including the case $t = h$ for maximum-cardinality sampling,
    the branch with decision $b in { 0 \, 1 }$ has as many completions as the residual pair has common independent
    sets of size $t - \| A \| - b$. The prescribed-cardinality pretest above decides exactly whether this count is
    zero; the original target $t$ stays fixed throughout the recursion.
    For unrestricted cardinality, the branch count is the all-cardinalities count of the residual pair;
    it is positive whenever the branch’s included set is common independent.
    These descriptions partition the current feasible completions into two smaller instances,
    at least one of which is nonempty.
  #strong[Branch probabilities and sampling error.] Let $a_0 \, a_1$ be their true counts.
    For comparison, the ideal recursion with access to these counts chooses the inclusion branch with probability
    $p = a_1 \/ \( a_0 + a_1 \)$; induction on $\| R \|$ shows that it is uniform on the requested family.
    The actual recursion follows the unique feasible branch deterministically when only one exists.
    When both are feasible, obtain fresh estimates $hat(a)_0 \, hat(a)_1$ from the appropriate counter,
    each with relative tolerance and failure probability
  $ alpha = frac(theta, 4 n) \, wide beta = frac(theta, 8 n) . $
  If $hat(a)_0 + hat(a)_1 = 0$, set $hat(p) = 0$; this selects a known-feasible branch.
    Otherwise set $hat(p) = hat(a)_1 \/ \( hat(a)_0 + hat(a)_1 \)$.
    This rule does not mistake a zero estimate on an inaccurate run for proof that a branch is empty.
  Let $s$ be the least nonnegative integer with $2^(- s) lt.eq theta \/ \( 4 n \)$, and put
  $ p_s = 2^(- s) floor.l 2^s hat(p) floor.r . $
  Use exactly $s$ fresh unbiased bits to obtain a uniform integer in ${ 0 \, dots.h \, 2^s -
    1 }$ and choose inclusion when it is less than $2^s p_s$.
    This implements $p_s$ with $\| p_s - hat(p) \| < 2^(- s)$, without an unbounded rejection procedure.
  When both estimates are accurate, write $hat(a)_b = a_b \( 1 + u_b \)$ with $\| u_b \| lt.eq alpha$.
    Since $a_0 \, a_1 > 0$,
  $ \| hat(p) - p \| =
    frac(a_0 a_1 \| u_1 - u_0 \|, \( a_0 + a_1 \) #scale(x: 120%, y: 120%)[\(] a_0 \( 1 + u_0 \) + a_1 \( 1 +
    u_1 \) #scale(x: 120%, y: 120%)[\)]) lt.eq frac(alpha, 2 \( 1 - alpha \)) lt.eq alpha \, $
  where the last inequality uses $alpha < 1 \/ 2$. Conditional on every shared history of the ideal and actual
    recursions, fresh randomness makes the probability that either estimate is inaccurate at most $2 beta$.
    Couple their next decisions; the conditional probability that they separate is at most
  $ alpha + 2 beta + 2^(- s) lt.eq frac(3 theta, 4 n) . $
  This also holds at a forced decision, where the probability is zero.
    A sequential coupling over at most $n$ decisions now gives
  $ d_(upright("TV")) #scale(x: 120%, y: 120%)[\(] cal(L) \( S \) \,
    "Unif" \( cal(F) \) #scale(x: 120%, y: 120%)[\)] lt.eq n #scale(x: 120%, y: 120%)[\(] alpha + 2 beta +
    2^(- s) #scale(x: 120%, y: 120%)[\)] lt.eq frac(3 theta, 4) < theta . $
  The exact branch tests keep every output in the requested family, including on executions with inaccurate estimates.
  Finally, each sampling step uses at most two counter calls and polynomial exact matroid-intersection work.
    An all-cardinalities counter uses at most $n + 1$ common-bases calls.
    The derived parameters satisfy $alpha^(- 1) = 4 n \/ theta$, $log beta^(- 1) =
    O \( 1 + log n + log theta^(- 1) \)$, and $s = O \( 1 + log n + log theta^(- 1) \)$.
    Their binary encodings have polynomial length, and $s$ can be found by shifts and rational comparisons.
    The every-execution bound in 1 bounds the lengths of the returned rationals; summing at most $n +
    1$ such rationals, forming $hat(p)$, and computing its dyadic rounding therefore take polynomial bit
    operations. Together with (63), these observations give the asserted oracle and bit bounds on every execution. ◻
]

#heading(level: 1)[References]
#bibitem([1])[David Aldous and James Allen Fill. . Unfinished monograph, 2002, recompiled 2014.
  #link("https://www.stat.berkeley.edu/~aldous/RWG/book.html").]
#bibitem([2])[Yeganeh Alimohammadi, Nima Anari, Kirankumar Shiragur, and Thuy-Duong Vuong.
  Fractionally log-concave and sector-stable polynomials: Counting planar matchings and more.
  arXiv:2102.02708, version~3, April 3, 2023; first posted 2021. #link("https://arxiv.org/abs/2102.02708v3").]
#bibitem([3])[Nima Anari, Kuikui Liu, Shayan Oveis Gharan, and Cynthia Vinzant. Log-concave polynomials II:
  High-dimensional walks and an FPRAS for counting bases of a matroid. , 199(1):259--299, 2024.
  #link("https://doi.org/10.4007/annals.2024.199.1.4"). Preprint locators refer to arXiv version~3, January 18,
  2019: #link("https://arxiv.org/abs/1811.01816v3").]
#bibitem([4])[Nima Anari and Shayan Oveis Gharan. A generalization of permanent inequalities and applications in
  counting and optimization. arXiv:1702.02937, version~1, February 9, 2017.
  #link("https://arxiv.org/abs/1702.02937v1").]
#bibitem([5])[Nima Anari, Shayan Oveis Gharan, and Alireza Rezaei.
  Monte Carlo Markov chain algorithms for sampling strongly Rayleigh distributions and determinantal point
  processes. In #emph[29th Annual Conference on Learning Theory],
  volume~49 of #emph[Proceedings of Machine Learning Research], pages 103--115. PMLR, 2016.
  #link("https://proceedings.mlr.press/v49/anari16.html").]
#bibitem([6])[Nima Anari, Shayan Oveis Gharan, and Cynthia Vinzant. Log-concave polynomials, I:
  Entropy and a deterministic approximation algorithm for counting bases of matroids. , 170(16):3459--3504, 2021.
  #link("https://doi.org/10.1215/00127094-2020-0091"). Preprint locators refer to arXiv version~2, November 5,
  2018: #link("https://arxiv.org/abs/1807.00929v2").]
#bibitem([7])[Alexander Barvinok and Alex Samorodnitsky. Random weighting, asymptotic counting,
  and inverse isoperimetry. , 158:159--191, 2007. #link("https://doi.org/10.1007/s11856-007-0008-8").
  Preprint version~2, June 4, 2003: #link("https://arxiv.org/abs/math/0302177v2").]
#bibitem([8])[Petter Brändén and June Huh. Hodge--Riemann relations for Potts model partition functions.
  arXiv:1811.01696, version~2, February 11, 2019; first posted 2018. #link("https://arxiv.org/abs/1811.01696v2").]
#bibitem([9])[Petter Brändén and June Huh. Lorentzian polynomials. , 192(3):821--891, 2020.
  #link("https://doi.org/10.4007/annals.2020.192.3.4").]
#bibitem([10])[Xiaoyu Chen, Weiming Feng, Zhe Ju, Tianshun Miao, Yitong Yin, and Xinyuan Zhang.
  Faster mixing of the Jerrum--Sinclair chain. arXiv:2504.02740, version~1, April 3, 2025.
  #link("https://arxiv.org/abs/2504.02740v1").]
#bibitem([11])[Xiaoyu Chen, Eric Vigoda, and Xiongxin Yang.
  Faster FPRAS for the permanent via restricted Poincaré inequalities and coupled flows.
  arXiv:2608.26599, version~1, August 27, 2026. #link("https://arxiv.org/abs/2608.26599v1").]
#bibitem([12])[Mary Cryan, Heng Guo, and Giorgos Mousa. Modified log-Sobolev inequalities for strongly log-concave
  distributions. , 49(1):506--525, 2021. #link("https://doi.org/10.1214/20-AOP1453").
  Preprint locators refer to arXiv version~4, August 8, 2020: #link("https://arxiv.org/abs/1903.06081v4").]
#bibitem([13])[Peter G. Doyle and J. Laurie Snell. . Web edition dated July 5, 2006,
  derived from the 1984 MAA book. #link("https://math.dartmouth.edu/~doyle/docs/walkspdf/walks.pdf").]
#bibitem([14])[Jack Edmonds. Matroid intersection. In #emph[Discrete Optimization I],
  volume~4 of #emph[Annals of Discrete Mathematics], pages 39--49. North-Holland, 1979.
  #link("https://doi.org/10.1016/S0167-5060(08)70817-3").]
#bibitem([15])[Tomás Feder and Milena Mihail. Balanced matroids.
  In #emph[Proceedings of the Twenty-Fourth Annual ACM Symposium on Theory of Computing], pages 26--38.
  Association for Computing Machinery, 1992. #link("https://doi.org/10.1145/129712.129716").]
#bibitem([16])[Mark Jerrum, Alistair Sinclair, and Eric Vigoda.
  A polynomial-time approximation algorithm for the permanent of a matrix with nonnegative entries. ,
  51(4):671--697, 2004. #link("https://doi.org/10.1145/1008731.1008738").]
#bibitem([17])[Mark R. Jerrum, Leslie G. Valiant, and Vijay V. Vazirani.
  Random generation of combinatorial structures from a uniform distribution. , 43(2--3):169--188, 1986.
  #link("https://doi.org/10.1016/0304-3975(86)90174-X").]
#bibitem([18])[Claude Kipnis and S. R. S. Varadhan. Central limit theorems for additive functionals of reversible
  Markov chains and applications. , 132:65--70, 1985. #link("https://www.numdam.org/item/AST_1985__132__65_0/").]
#bibitem([19])[Kuikui Liu. . PhD thesis, University of Washington, 2023. Section 13.2, Problem 1, p. 197.
  #link("https://kuikuiliu.github.io/files/dissertation.pdf").]
#bibitem([20])[Alexander Schrijver. , volume~24 of #emph[Algorithms and Combinatorics]. Springer, Berlin, 2003.
  #link("https://homepages.cwi.nl/~lex/co/").]
#bibitem([21])[Damian Straszak and Nisheeth K. Vishnoi. Real stable polynomials and matroids:
  Optimization and counting. arXiv:1611.04548, version~1, November 14, 2016.
  #link("https://arxiv.org/abs/1611.04548v1").]
