#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[Critical bond and site percolation on the cubic lattice]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

In Bernoulli bond percolation on the nearest-neighbor cubic lattice $bb(Z)^3$, each edge is independently open with probability $p$. In Bernoulli site percolation, the independent open bits instead belong to the vertices, and an open path must have every vertex open, including its endpoints. Write $bb(P)_p$ for the law of the model under consideration and define its critical parameter by

$ p_c = inf { p in \[ 0 \, 1 \] : bb(P)_p \( 0 upright(" belongs to an infinite open cluster") \) > 0 } . $

By translation invariance and a countable union over vertices, the same threshold is obtained by asking for the existence of any infinite cluster. The bond and site thresholds are defined separately throughout.

#thm([Theorem 1.1.])[
  #emph[For nearest-neighbor Bernoulli bond percolation on $bb(Z)^3$, there is almost surely no infinite open cluster at the bond critical parameter. The same assertion holds for nearest-neighbor Bernoulli site percolation at the site critical parameter.]
] <thm:main>

Write $theta \( p \) = bb(P)_p \( 0 upright(" belongs to an infinite open cluster") \)$. The theorem gives continuity at the transition: $theta \( p \)$ tends to zero as $p arrow.b p_c$. To see this consequence directly, for $n gt.eq 1$ let $E_n$ be the event that the origin reaches the boundary of the box $\[ - n \, n \]^3 ∩ bb(Z)^3$ by an open path inside that box. Then $bb(P)_p \( E_n \) arrow.b theta \( p \)$ as $n arrow.r oo$. At $p_c$, the theorem makes this limit zero. Given $epsilon > 0$, first choose $n$ with $bb(P)_(p_c) \( E_n \) < epsilon$; since $E_n$ depends on finitely many bits, the same strict inequality holds for $p$ sufficiently close to $p_c$. Thus $theta \( p \) lt.eq bb(P)_p \( E_n \) < epsilon$ there. The proof below establishes critical extinction for both models without using an external criticality theorem.

===== 1.1 History and the three-dimensional obstacle. <history-and-the-three-dimensional-obstacle.>

Broadbent and Hammersley introduced percolation to study transport through a random medium [2]. In two dimensions, Harris’s critical nonpercolation theorem and Kesten’s identification of the square bond threshold established the bond result [9,11]. Russo proved critical nonpercolation for nearest-neighbor site percolation on the square lattice [14] Theorem 2(b). These planar results use geometry that is unavailable for paths in three dimensions.

In sufficiently high dimensions, Hara and Slade established mean-field critical behavior through the lace expansion [8]. Fitzner and van der Hofstad obtained the nearest-neighbor bond range $d gt.eq 11$ [6]. Hara and Slade also noted that their method applies to site percolation [8] p. 335. Heydenreich and Matzke later gave a detailed site lace-expansion treatment, proving the triangle condition in sufficiently high dimensions and its critical nonpercolation consequence [10] Theorem 1.1 and Section 1.3. The explicit bond dimension bound is not a site bound. Benjamini and Schramm formulated the broader criticality question for quasi-transitive graphs with $p_c < 1$ [1] Conjecture 4.

Grimmett and Marstrand proved convergence of slab thresholds to the full-lattice threshold and developed a dynamic renormalization argument using open seeds and sequentially controlled exploration [7]. Duminil-Copin, Sidoravicius, and Tassion subsequently proved critical nonpercolation for bond percolation on slabs [5]. As their discussion explains, extinction at every fixed slab threshold, together with convergence of those thresholds, does not by itself give critical extinction in the full cubic lattice. The proof here obtains the required connections between finite regions from a finite comparison, and fixes all scales before decreasing the percolation parameter.

Leder’s public account of a Lean formalization reports critical bond nonpercolation on every nearest-neighbor lattice $bb(Z)^d$, $d gt.eq 2$ [13]. Its first-contact comparison [13] Section 3.4, (GEN) already implies the finite joint connection inequality for bonds: take the increasing cluster functional to indicate meeting the target set. The subsequent public Kozma–Nitzan exposition explicitly records this consequence and reports stronger finite comparisons [4] “Conjecture 1 from the Lean proof of Conjecture 3”. The related public site exposition reports the independent labelled-hyperedge comparison, a conditioned-covariance hierarchy, and critical site nonpercolation on $bb(Z)^d$ for every $d gt.eq 3$ [3] “One inequality for both models”, “Conditional covariance inequalities”, and “From (1) to the lattice”. These two public expositions describe work produced by AI systems prompted by Ahmed Bou-Rabee. Our purpose here is a self-contained cubic argument, including the finite comparison, explicit relay geometry, and exploration estimates.

===== 1.2 Finite comparison and the proof method. <finite-comparison-and-the-proof-method.>

Our main finite ingredient is a connection inequality for independent, possibly nonuniform hyperedges. For a node $o$ and nonempty node set $A$, it asserts that

$ bb(P) \( o arrow.l.r A \, med o arrow.l.r T \) gt.eq bb(P) \( o arrow.l.r A \) min_(a in A) bb(P) \( a arrow.l.r T \) . quad "(1.1)" $ <intro:comparison>

Here an open hyperedge joins all of its nodes. The inequality implies that if every possible relay in $A$ reaches a target $T$ with probability at least $1 - b$, then the probability of reaching $A$ but missing $T$ is at most $b$. This failure bound also holds for sites, and after any set of bits has been fixed while the remaining bits retain their product law. Thus it remains available during an exploration.

Taking $T$ to be a singleton in (1.1) and enlarging the event on the left gives the multiplicative gluing inequality of Kozma and Nitzan [12] Conjecture 1. They also record that van den Berg and Engelenburg independently considered this inequality. Section 4 of Kozma and Nitzan connects finite comparisons to criticality through renormalization. The proof of (1.1) uses increasing functions of clusters, a nonnegative cone of conditional connection columns, and alternating conditional cluster resampling. Conditional resampling has precedents in percolation correlation inequalities [15] Section 2.1. We prove the required comparison and every lattice relay estimate locally. The general bond criticality theorem does not imply the site assertion: independent site bits become independent hyperedges, and their endpoint convention must be preserved. The finite hyperedge comparison and its stability under fixed bits are useful independently of the lattice application.

===== 1.3 Proof overview. <proof-overview.>

Assume that an infinite cluster exists at $p_c$. Large seed boxes then connect with high probability to each of the 24 quarter-faces of a surrounding cube. Only finitely many radii are needed, so these estimates persist at one parameter $q < p_c$.

The finite comparison lets us extend a connection through a fresh region. The seed and sequential-exploration architecture is related to the dynamic renormalization method of Grimmett and Marstrand [7] Sections 3–4. Here many well-separated entrance points provide independent chances for an open seed, while relay quality is defined using the interior bits alone. A sequence of thirteen elementary geometric moves transfers a connection from the inner box of one coarse cube to that of its neighbor. Finally, we explore cubes indexed by $bb(Z)^2$, retaining a high conditional connection probability for each pending cube. Each processed cube has a uniformly small conditional chance of failure. A planar boundary count then gives a positive chance of infinitely many successful cubes, and hence an infinite open cluster at $q < p_c$, a contradiction. Neither uniqueness of the infinite cluster nor independence of the successful coarse cubes is assumed.

Section 2 proves the finite comparison. Section 3 gives the planar count and fixes the scales. Sections 4 and 5 prove the extension and neighboring-box estimates. Section 6 constructs the exploration and completes the proof.

===== 1.4 Connection conventions. <connection-conventions.>

For a vertex $x$ and vertex set $T$, the notation $x arrow.l.r T$ means that an open path in the specified graph joins $x$ to some vertex of $T$. For two sets, at least one pair of their vertices must be so joined. We permit paths of zero edges. Such a path always gives a self-connection for bonds and hyperedges, but for sites its single vertex must be open. All graphs and hypergraphs in the finite comparison are undirected.

== 2 A finite connection comparison <sec:comparison>

The lattice argument will need to pass from a connection to a set of possible relays to a connection to a target. We prove the finite inequality that makes this passage possible, allowing different probabilities for the independent bits so that the result remains available after some bits have been fixed.

A finite hypergraph has a finite node set and a finite labelled family of nonempty subsets called hyperedges; distinct labels may represent the same subset. Each hyperedge is independently open with its own probability; an open hyperedge joins all its nodes. The cluster $C \( x \)$ always contains $x$, and $C \( S \) = union.big_(x in S) C \( x \)$. All connections in this section are in finite undirected graphs or hypergraphs.

#thm([Proposition 2.1.])[
  (Joint connection comparison).  #emph[In independent percolation on a finite hypergraph, with arbitrary hyperedge probabilities in $\[ 0 \, 1 \]$, let $o$ be a node and let $A \, T$ be node sets with $A eq.not diameter$. Then 
$ bb(P) \( o arrow.l.r A \, med o arrow.l.r T \) gt.eq bb(P) \( o arrow.l.r A \) min_(a in A) bb(P) \( a arrow.l.r T \) . quad "(2.1)" $ <cmp:joint-bound>

]
] <cmp:joint>

For bonds, subtraction immediately turns this inequality into the failure bound needed later. Sites require an additional check because a hypergraph node is always connected to itself, whereas a site self-connection requires an open vertex. We give that check at the end of the section.

The proof of Proposition 2 assigns each cluster meeting an ordered list to its first node in that list. Conditional connection probabilities form the columns of a triangular matrix. The positivity property below will bound the source’s joint connection probability from below by a nonnegative weighted sum of relay-to-target probabilities. The weights will total the probability of reaching the relay set, giving the proposition.

Deleting a node set $w$ means deleting its nodes and every hyperedge meeting it; write $G \\ w$ for the resulting hypergraph. On an exact-cluster event $C \( S \) = w$ of positive probability, the hyperedges of $G \\ w$ retain their independent original laws. Indeed, the event asks that every node of $w$ connect to $S$ within $w$, and that all hyperedges crossing from $w$ to its complement be closed. It tests no hyperedge disjoint from $w$. The same observation applies after an earlier deletion.

#thm([Lemma 2.2.])[
  (Cluster columns).  #emph[Let $G$ be a finite hypergraph whose hyperedges have independent open probabilities strictly less than one. Choose any ordered list of distinct nodes $x_1 \, dots.h \, x_n$; the list need not contain every node. Define 
$ S_k = { x_i : i < k } \, #h(2em) E_k = { C \( x_k \) ∩ S_k = diameter } \, #h(2em) d_k = bb(P) \( E_k \) > 0 \, $

 and let $mu_k$ be the conditional law of $C \( x_k \)$ given $E_k$, regarded as a measure on 
$ cal(D)_k = { U : x_k in U \, med U ∩ S_k = diameter } . $

 For a function $F$ on $cal(D)_k$, let 
$ v_k^F \( i \) = bb(E)_(mu_k) \[ upright(bold(1))_({ x_i in U }) F \( U \) \] \, #h(2em) h_k = v_k^1 \, #h(2em) H = \( h_1 med dots.h.c med h_n \) . $

 If $F$ is nonnegative and increasing under inclusion, then 
$ v_k^F - mu_k \( F \) h_k in "cone" { h_j : k < j lt.eq n } . quad "(2.2)" $ <cmp:cone-relation>

 Here the cone consists of all nonnegative linear combinations, including zero. In particular, $H^(- 1) v_k^F$ is coordinatewise nonnegative.]
] <cmp:cone>

#proof[
  Closing every hyperedge incident to $x_k$ proves $d_k > 0$. The matrix $H$ is unit lower triangular: its $k$th column vanishes above row $k$ and has entry one in row $k$. We prove (2.2) by descending induction on $k$. For $k = n$, both $v_n^F$ and $mu_n \( F \) h_n$ equal $mu_n \( F \) e_n$, where $e_n$ is the $n$th coordinate vector.
  Fix $k < n$ and assume the assertion for every later column. Write $s = x_k$, $S = S_k$, and $W = C \( S \)$. For a set $w supset.eq S$ avoiding $s$, put
  $ c \( w \) = bb(E) #scale(x: 120%, y: 120%)[\[] F \( C^(G \\ w) \( s \) \) #scale(x: 120%, y: 120%)[\]] \, $
  where the expectation uses the original product law on the undeleted hyperedges. Restriction of the same configuration shows that $c \( w \)$ is nonincreasing in $w$.
  ===== 2.1 A first-listed-node decomposition. <a-first-listed-node-decomposition.>
  Fix a row $i$. For $j > k$, let $L_(i j)$ be the event that the first listed node of $C \( x_i \)$ is $x_j$. Condition on an exact value $W = w$ avoiding $s$. Then the mean of $F \( C \( s \) \)$ is $c \( w \)$. If $x_i in.not w$, its cluster contains the listed node $x_i$ and avoids all listed nodes preceding $s$, which belong to $w$. Its first listed node is therefore $s$ precisely when $x_i in C \( s \)$; otherwise exactly one of the events $L_(i j)$ occurs. On $L_(i j)$, condition further on $C \( x_j \) = U$. The set $U$ avoids $s$, and the specification of $L_(i j)$ adds only membership and avoidance conditions on $U$. Exact-cluster conditioning therefore leaves the mean of $F \( C \( s \) \)$ equal to $c \( w union U \)$. Partitioning the expectation $c \( w \)$ and subtracting $c \( w \)$ times the corresponding partition of total probability gives
  $ & bb(E) \[ upright(bold(1))_({ x_i in C \( s \) }) F \( C \( s \) \) divides W = w \]\
 & quad = c \( w \) bb(P) \( x_i in C \( s \) divides W = w \) + sum_(j > k) bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(L_(i j)) { c \( w \) - c \( w union C \( x_j \) \) } divides W = w #scale(x: 120%, y: 120%)[\]] . quad "(2.3)" $ <cmp:partition>
  The expressions involving $c \( w union C \( x_j \) \)$ are evaluated only on $L_(i j)$. If $x_i in w$, all $L_(i j)$ are empty under the conditioning, and both sides vanish.
  For $U$ disjoint from $S$, let $W_U = C^(G \\ U) \( S \)$. Define, for $U in cal(D)_k$,
  $ \( P F \) \( U \) = bb(E) \[ c \( W_U \) \] \, $
  and, for $U$ disjoint from $S union { s }$, define
  $ R_F \( U \) = bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ s in.not W_U }) { c \( W_U \) - c \( W_U union U \) } #scale(x: 120%, y: 120%)[\]] \, quad "(2.4)" $ <cmp:residual>
  with zero integrand when $s in W_U$. The operator $P$ preserves nonnegativity and monotonicity: enlarging $U$ shrinks $W_U$, whereas $c$ is nonincreasing.
  We now average (2.3) conditional on $E_k$. Given $C \( s \) = U$ avoiding $S$, the conditional law of $W$ is that of $W_U$. Thus the first term on the right averages to
  $ bb(E)_(mu_k) \[ upright(bold(1))_({ x_i in U }) \( P F \) \( U \) \] = v_k^(P F) \( i \) . $
  For a residual term, the exact event identity is
  $ E_k ∩ L_(i j) = E_k ∩ E_j ∩ { x_i in C \( x_j \) } . $
  Indeed, a cluster avoiding the earlier listed nodes also avoids their entire clusters. Given $C \( x_j \) = U$ under $E_j$, the conditional law of $W$ is again that of $W_U$, and the remaining restriction $E_k$ is $s in.not W_U$. Consequently the unnormalized residual expectation is
  $ bb(E) #h(-1em) [upright(bold(1))_(E_k ∩ L_(i j)) { c \( W \) - c \( W union C \( x_j \) \) }] = d_j thin bb(E)_(mu_j) \[ upright(bold(1))_({ x_i in U }) R_F \( U \) \] \, $
  where the expression on the left is evaluated only when its indicator is one. Dividing by $d_k$ and summing over $j > k$ proves the column identity
  $ v_k^F = v_k^(P F) + sum_(j > k) d_j / d_k v_j^(R_F) . quad "(2.5)" $ <cmp:column-identity>
  Here and below $R_F$ is restricted to $cal(D)_j$ in the $j$th column. To complete the induction, we show that $R_F$ is nonnegative and increasing and that $P^t F$ converges uniformly to $mu_k \( F \)$.
  ===== 2.2 The residual is increasing. <the-residual-is-increasing.>
  Sample all hyperedge bits once, and use their restrictions after every deletion. For deterministic $U$ disjoint from $S union { s }$, the event $W_U = w$ tests only bits of hyperedges disjoint from $U$ and meeting $w$. Every full-graph hyperedge disjoint from $w$ therefore retains its independent original law after this conditioning, including hyperedges that meet $U$. When $s in.not w$, the two clusters in the following difference consequently have the marginal laws defining $c \( w \)$ and $c \( w union U \)$. Hence $R_F \( U \) = bb(E) \[ D_U \]$, where
  $ D_U = upright(bold(1))_({ s in.not W_U }) {F \( C^(G \\ W_U) \( s \) \) - F \( C^(G \\ \( W_U union U \)) \( s \) \)} \, quad "(2.6)" $ <cmp:residual-sample>
  again interpreted as zero on the excluded event. All clusters at which $F$ is evaluated contain $s$ and avoid $S$.
  The first cluster contains the second, so $D_U gt.eq 0$. To compare two sets $U subset.eq U'$, first note that $W_(U') subset.eq W_U$. On ${ s in.not W_U }$, deleting the smaller set $W_(U')$ makes the first cluster larger. The second cluster has a different monotonicity:
  $ C^(G \\ \( W_U union U \)) \( s \) = C^(G \\ U) \( s \) . $
  Indeed, in $G \\ U$ the source cluster is disjoint from the union $W_U$ of the $S$-clusters, so deleting $W_U$ removes none of its open connections. The same equality holds for $U'$, because $s in.not W_(U')$. Thus the second cluster becomes smaller when $U$ is replaced by $U'$. Both changes increase the difference of the two values of $F$, giving $D_(U') gt.eq D_U$. On ${ s in W_U }$, this inequality follows instead from $D_U = 0$ and $D_(U') gt.eq 0$. Taking expectations proves that $R_F$ is nonnegative and increasing.
  ===== 2.3 Conditional resampling and the limit. <conditional-resampling-and-the-limit.>
  The operator $P$ is a Markov transition: from $U$, first sample $W_U$, then independently sample $C^(G \\ W_U) \( s \)$. Under the joint law of $\( C \( s \) \, W \)$ conditional on $E_k$, these are the successive conditional laws of $W$ given $C \( s \)$ and of $C \( s \)$ given $W$. Hence $mu_k$ is stationary for $P$. Alternating conditional cluster resampling under a separation condition is the method used by van den Berg, Häggström, and Kahn [15] Section 2.1, proof of Theorem 2.1; the cone conclusion here is proved by the following iteration.
  Every transition assigns probability at least
  $ a = product_(e : thin s in e) \( 1 - p_e \) > 0 $
  to the singleton ${ s }$, since closing every incident hyperedge suffices to isolate $s$ in any deletion graph. Thus, for every real function $g$ on the finite state space $cal(D)_k$, subtracting this common mass gives
  $ max P g - min P g lt.eq \( 1 - a \) \( max g - min g \) . $
  Iteration makes the oscillation of $P^t F$ tend to zero. Its $mu_k$-mean remains $mu_k \( F \)$ by stationarity, so
  $ sup_(U in cal(D)_k) \| \( P^t F \) \( U \) - mu_k \( F \) \| lt.eq \( 1 - a \)^t \( max F - min F \) arrow.r 0 . $
  This proves the required uniform convergence, including at states of $cal(D)_k$ with zero $mu_k$-mass.
  By the induction hypothesis, each $v_j^(R_F)$ is a nonnegative combination of $h_j \, dots.h \, h_n$. Equation (2.5) therefore puts $v_k^F - v_k^(P F)$ in the cone on the right of (2.2). All iterates $P^t F$ remain nonnegative increasing, so iteration puts $v_k^F - v_k^(P^t F)$ in that cone as well. The cone is closed, because its generators belong to the basis given by the columns of $H$. Taking the uniform limit proves (2.2). Finally, adding $mu_k \( F \) h_k$ expresses $v_k^F$ as a nonnegative combination of columns of $H$, proving the last assertion. ◻
]

#proof[
  First suppose all probabilities are below one. Use the notation of Lemma 3. For $F \( U \) = upright(bold(1))_({ x_j in U upright(" for some ") j > k })$, isolation of $x_k$ gives $mu_k \( F \) < 1$, and direct inspection of the rows gives
  $ v_k^F - mu_k \( F \) h_k = \( 1 - mu_k \( F \) \) \( h_k - e_k \) \, $
  where $e_k$ is the $k$th coordinate vector. Lemma 3 yields nonnegative coefficients $Gamma_(j k)$ such that
  $ h_k = e_k + sum_(j > k) Gamma_(j k) h_j . $
  With $Gamma$ zero on and above the diagonal, these column identities say $H = I + H Gamma$, or $H^(- 1) = I - Gamma$. Also, for $d = \( d_1 \, dots.h \, d_n \)^(sans(T))$,
  $ H d = upright(bold(1)) \, #h(2em) \( I - Gamma \) upright(bold(1)) = d . quad "(2.7)" $ <cmp:first-node-mass>
  Indeed, the cluster of $x_i$ has first listed node $x_k$ with probability $d_k h_k \( i \)$, and these events partition the sample space.
  If $o in A$, (2.1) is immediate. Otherwise take the list to consist exactly of the nodes of $A$, in any order, followed by $x_n = o$. Set
  $ F \( U \) = upright(bold(1))_({ U ∩ A eq.not diameter \, med U ∩ T eq.not diameter }) \, #h(2em) y_i = bb(E) \[ F \( C \( x_i \) \) \] . $
  Partitioning by the first listed node gives $y = sum_k d_k v_k^F$, where $F$ is restricted to $cal(D)_k$ in each summand. Every restriction is nonnegative increasing, so Lemma 3 gives $\( I - Gamma \) y gt.eq 0$ coordinatewise. In the last row,
  $ y_n gt.eq sum_(i < n) Gamma_(n i) y_i . $
  For $i < n$, $y_i = bb(P) \( x_i arrow.l.r T \)$, while $y_n = bb(P) \( o arrow.l.r A \, med o arrow.l.r T \)$. By (2.7), the nonnegative weights in this row sum to
  $ sum_(i < n) Gamma_(n i) = 1 - d_n = bb(P) \( o arrow.l.r A \) . $
  This proves (2.1). Finally, finite event probabilities are polynomials in the hyperedge parameters, and the minimum in (2.1) is finite. Continuity therefore allows probabilities equal to one as well. ◻
]

#thm([Corollary 2.3.])[
  (Failure comparison).  #emph[Consider independent bond or site percolation on a finite undirected graph, with arbitrary individual probabilities in $\[ 0 \, 1 \]$. For a vertex $o$, vertex sets $A \, T$, and $b in \[ 0 \, 1 \]$, if 
$ bb(P) \( a arrow.l.r T \) gt.eq 1 - b #h(2em) \( a in A \) \, $

 then 
$ bb(P) \( o arrow.l.r A \, med o ↮ T \) lt.eq b . quad "(2.8)" $ <cmp:failure-bound>

 The assertion therefore applies after any deterministic collection of bits has been fixed.]
] <cmp:failure>

#proof[
  The empty-set case $A = diameter$ is immediate. For bonds, Proposition 2 and subtraction give the stronger upper bound $b bb(P) \( o arrow.l.r A \) lt.eq b$.
  For sites, use the incidence construction described in [3] “One inequality for both models”. Create a node $x^(*)$ for every graph vertex $x$ and a connector node for every graph edge. For each site $x$, form a hyperedge consisting of $x^(*)$ and all connector nodes corresponding to edges incident to $x$; its independent open bit is the bit of site $x$. For distinct vertices $x \, z$, connection of $x^(*)$ to $z^(*)$ is equivalent to an open site path from $x$ to $z$. Hypergraph self-connection, however, always holds. Writing $A^(*) \, T^(*)$ for the starred images, we consequently have
  $ bb(P)_(upright("hyp")) \( a^(*) arrow.l.r T^(*) \) gt.eq bb(P)_(upright("site")) \( a arrow.l.r T \) gt.eq 1 - b . $
  On the site event in (2.8), the origin $o$ is open. Its hypergraph connections to starred vertices therefore agree with its site connections, including a possible zero-edge path to itself. This gives the event inclusion
  $ { o arrow.l.r A \, med o ↮ T }_(upright("site")) subset.eq { o^(*) arrow.l.r A^(*) \, med o^(*) ↮ T^(*) }_(upright("hyp")) . $
  Applying Proposition 2 and subtraction to the hypergraph bounds the latter event by $b$, proving the site assertion. Fixed bits are exactly parameters equal to zero or one, already allowed in the statement. ◻
]

== 3 Planar boundaries and finite scales <sec:preliminaries>

We now fix either the bond or the site model. This section supplies a planar boundary count and chooses all the finite scales needed to lower the parameter. The boundary count will be used first to show $p_c < 1$, and then to prove that the adaptive exploration survives.

=== 3.1 A deterministic boundary count <a-deterministic-boundary-count>

An edge of the dual square lattice $bb(Z)^2 + \( 1 \/ 2 \, 1 \/ 2 \)$ crosses exactly one primal edge of $bb(Z)^2$. For a finite set $X subset bb(Z)^2$, its dual edge boundary consists of the dual edges crossing primal edges with exactly one endpoint in $X$.

#thm([Lemma 3.1.])[
  (Boundary cycles).  #emph[There are deterministic families $cal(C)_n$ of simple dual cycles of length $n$, with $\| cal(C)_n \| lt.eq 2 n 3^n$, such that the dual edge boundary of every finite $X subset bb(Z)^2$ containing $0$ includes a cycle in $union.big_(n gt.eq 1) cal(C)_n$. For each cycle in $cal(C)_n$, one can fix at least $n \/ 7$ of its crossed primal edges with pairwise disjoint endpoints.]
] <prelim:contours>

#proof[
  At a dual vertex, the boundary degree counts the membership changes around a primal square, and is therefore even. The finite dual boundary consequently decomposes into edge-disjoint simple cycles: extract a simple cycle whenever an edge remains, and remove its edges, preserving even degrees.
  Along the positive horizontal ray from $0$, the total number of boundary crossings is odd, since membership in $X$ starts at one and eventually becomes zero. At least one cycle in the decomposition has an odd number of positive-ray crossings. The total number of crossings of a closed dual cycle with the whole horizontal line is even, by counting changes of the sign of the height. The selected cycle therefore also crosses the negative ray.
  If its length is $n$, a positive crossing has horizontal coordinate $t + 1 \/ 2$ for some integer $0 lt.eq t < n$: the horizontal distance to a negative crossing is less than $n$. Define $cal(C)_n$ to be all simple length-$n$ cycles having such an anchored crossing and an odd number of positive-ray crossings. There are at most $n$ choices for the anchored edge, two orientations, and at most $3^n$ nonbacktracking continuations. This proves the asserted overcount. Finally, greedily select crossed primal edges in a fixed order, discarding all edges incident to either endpoint of each selection. Each selection discards at most seven edges, including itself, because the primal degree is four. The selected edges have disjoint endpoints and number at least $n \/ 7$. ◻
]

#thm([Lemma 3.2.])[
  #emph[For both models on $bb(Z)^3$, $p_c < 1$.]
] <prelim:pc-below-one>

#proof[
  It suffices to percolate on a coordinate copy of $bb(Z)^2$. In the bond model, if the origin cluster there is finite, all primal edges crossed by its dual boundary are closed. Lemma 5 and a union bound give
  $ bb(P)_p \( 0 upright(" has a finite planar cluster") \) lt.eq sum_(n gt.eq 1) 2 n 3^n \( 1 - p \)^n < 1 $
  for $p < 1$ sufficiently close to one.
  For sites, first separate the event that $0$ is closed. If its open planar cluster is finite, each edge crossed by the boundary cycle has a closed endpoint. For a fixed candidate cycle, select $k gt.eq n \/ 7$ edges with disjoint endpoints as in Lemma 5. The union over choices of one closed endpoint of each edge has probability at most $\[ 2 \( 1 - p \) \]^k$. For $p$ close to one, $2 \( 1 - p \) < 1$, so
  $ bb(P)_p \( 0 upright(" is not in an infinite planar open cluster") \) lt.eq \( 1 - p \) + sum_(n gt.eq 1) 2 n 3^n \[ 2 \( 1 - p \) \]^(n \/ 7) < 1 . $
  Indeed both displayed series are convergent geometric-power series tending to zero as $p arrow.t 1$. This proves the lemma. ◻
]

=== 3.2 Seed boxes and quarter-faces <seed-boxes-and-quarter-faces>

For $u in bb(Z)^3$ and a nonnegative integer $b$, write

$ Lambda_b \( u \) = u + \( \[ - b \, b \]^3 ∩ bb(Z)^3 \) \, #h(2em) Lambda_b = Lambda_b \( 0 \) . $

A #emph[quarter-face] of $Lambda_b \( u \)$ is obtained by setting one coordinate relative to $u$ equal to $b$ or $- b$, and restricting each remaining coordinate to either $\[ 0 \, b \]$ or $\[ - b \, 0 \]$. There are 24 such quarter-faces; overlaps on their boundaries do not matter. More explicitly, for a normal index $i in { 1 \, 2 \, 3 }$, a sign $sigma in { - 1 \, + 1 }$, and signs $epsilon_j in { - 1 \, + 1 }$ for the two indices $j eq.not i$, set

$ F_(i \, sigma)^(\( epsilon_j \)_(j eq.not i)) \( u \, b \) = { u + x : x_i = sigma b \, quad 0 lt.eq epsilon_j x_j lt.eq b med \( j eq.not i \) } . quad "(3.1)" $ <prelim:face-index>

The six choices of $\( i \, sigma \)$ and the four choices of the transverse sign pair enumerate all 24 faces. Figure 1 illustrates this indexing. A bit is #emph[internal] to a vertex set if it is a site in that set, or, for bonds, an edge with both endpoints in that set.

#figure(
  [#raw(block: true, lang: "latex", "\\begin{tikzpicture}[\n  x={(1.10cm,-0.55cm)},\n  y={(-1.10cm,-0.55cm)},\n  z={(0cm,1.18cm)},\n  font=\\small,\n  line join=round,\n  line cap=round,\n  >=stealth,\n  qf edge/.style={black,line width=0.65pt},\n  qf division/.style={black!55,line width=0.45pt}\n]\n  \\fill[black!3] (1,-1,-1)--(1,1,-1)--(1,1,1)--(1,-1,1)--cycle;\n  \\fill[black!6] (-1,1,-1)--(1,1,-1)--(1,1,1)--(-1,1,1)--cycle;\n  \\fill[black!1] (-1,-1,1)--(1,-1,1)--(1,1,1)--(-1,1,1)--cycle;\n\n  \\fill[black!24] (1,0,0)--(1,1,0)--(1,1,1)--(1,0,1)--cycle;\n\n  \\draw[qf division] (1,0,-1)--(1,0,1);\n  \\draw[qf division] (1,-1,0)--(1,1,0);\n  \\draw[qf division] (0,1,-1)--(0,1,1);\n  \\draw[qf division] (-1,1,0)--(1,1,0);\n  \\draw[qf division] (0,-1,1)--(0,1,1);\n  \\draw[qf division] (-1,0,1)--(1,0,1);\n\n  \\draw[qf edge]\n    (1,-1,-1)--(1,1,-1)--(-1,1,-1)--(-1,1,1)\n    --(-1,-1,1)--(1,-1,1)--cycle;\n  \\draw[qf edge] (1,1,1)--(1,1,-1);\n  \\draw[qf edge] (1,1,1)--(-1,1,1);\n  \\draw[qf edge] (1,1,1)--(1,-1,1);\n\n  \\coordinate (qf representative) at (1,0.48,0.56);\n  \\begin{scope}[x=1cm,y=1cm]\n    \\node[anchor=west] (qf label) at (2.70,0.00) {$F_{1,+}^{+,+}$};\n    \\draw[->,line width=0.45pt]\n      (qf label.west)--(2.38,0.00)--(qf representative);\n\n    \\coordinate (qf axes) at (-2.95,-1.63);\n    \\draw[->,line width=0.45pt]\n      (qf axes)--(-2.40,-1.905) node[right,inner sep=1pt] {$x_1$};\n    \\draw[->,line width=0.45pt]\n      (qf axes)--(-3.50,-1.905) node[left,inner sep=1pt] {$x_2$};\n    \\draw[->,line width=0.45pt]\n      (qf axes)--(-2.95,-0.99) node[above,inner sep=1pt] {$x_3$};\n  \\end{scope}\n\\end{tikzpicture}")],
  caption: [Figure 1: Quarter-faces of $Lambda_b \( u \)$, shown schematically for $b > 0$. Each of the three visible faces is divided into four quarter-faces; the three opposite faces are divided in the same way. Thus $3$ normal axes $times thin 2$ normal signs $times thin 4$ transverse sign pairs give $24$ quarter-faces. Boundary overlaps are permitted. The shaded example $F_(1 \, +)^(+ \, +)$ has $x_1 - u_1 = b$ and $0 lt.eq x_2 - u_2 \, x_3 - u_3 lt.eq b$. ],
) <prelim:quarterfaces-figure>

Suppose, towards a contradiction, that at $p = p_c$ an infinite cluster exists with positive probability. Then $0 < p < 1$ by Lemma 6 and the absence of percolation at zero. In fact an infinite cluster exists almost surely. To see this without a uniqueness assumption, the existence event is invariant under changing finitely many bits. Deleting finitely many edges, or finitely many vertices in a locally finite graph, splits an infinite connected component into only finitely many components, at least one of which is infinite. The event is measurable by countably many finite-path tests, and is determined by the bits outside any finite set. Thus it is independent of every finite cylinder event. Finite cylinder events approximate all events in this countable product space in probability, so the existence event is independent of itself and has probability zero or one. It follows that

$ bb(P)_p \( Lambda_m upright(" meets an infinite cluster") \) arrow.r 1 #h(2em) \( m arrow.r oo \) . quad "(3.2)" $ <prelim:seed-infinite>

We also use Harris’s positive-association inequality [9] for increasing events under a finite product of independent bits, and of decreasing events. Here is an elementary proof. For two increasing functions, condition on the last bit. Induction bounds the conditional covariance below by zero. The conditional means are increasing functions of this last bit, whose covariance is nonnegative. The covariance decomposition proves the assertion by induction on the number of bits. The same argument works for decreasing functions, and iteration gives the intersection bound for any finite family of events.

The use of symmetric quarter-face estimates follows the renormalization framework of Kozma and Nitzan [12] Section 4, Lemmas 8–9. The next lemma fixes the geometry before decreasing $p$. Its tolerance $f$ is reserved for the planar contour sum, while $gamma$ bounds the probability of missing one quarter-face. The intermediate tolerances distribute errors in the extension and exploration arguments. Once all scales have been chosen at $p$, finite-event continuity will supply one $q < p$ for the three required radii.

#thm([Lemma 3.3.])[
  (Choice of scales).  #emph[Under the preceding contradiction assumption, there are numbers $f \, delta \, eta \, tau \, gamma in \( 0 \, 1 \)$, positive integers $m \, K \, R \, r$, and $q in \( p \/ 2 \, p \)$ with the following properties. First, $f < 1 \/ 2$ and 
$ sum_(n gt.eq 1) 2 n 3^n \( 2 f \)^(n \/ 7) < 1 . quad "(3.3)" $ <prelim:contour-budget>

 The error parameters satisfy 
$ delta + frac(52 eta, delta) < f \, #h(2em) tau < eta / 4 \, #h(2em) gamma < delta \, #h(2em) frac(2 gamma, tau) < eta / 4 . quad "(3.4)" $ <prelim:budgets>

 Let $M$ be the number of internal bits of $Lambda_m$, and set $rho_0 = \( p \/ 2 \)^(M + 1)$. With $L = K \( 8 m + 5 \)^3$ and $alpha = \( 1 - p \)^L$, we have 
$ frac(4, K rho_0) < eta / 4 \, #h(2em) R > m \, #h(2em) frac(1, alpha \( R - m \)) < eta / 4 \, #h(2em) r > 100 \( R + 1 \) . quad "(3.5)" $ <prelim:scale-inequalities>

 For every $ell in { 2 r \, 2 r + 1 \, 10 r }$, $u in bb(Z)^3$, and quarter-face $F$ of $Lambda_ell \( u \)$, independent parameter-$q$ percolation satisfies 
$ bb(P)_q #scale(x: 120%, y: 120%)[\(] Lambda_m \( u \) arrow.l.r F upright(" within ") Lambda_ell \( u \) #scale(x: 120%, y: 120%)[\)] > 1 - gamma . quad "(3.6)" $ <prelim:quarterface>

]
] <prelim:scales>

#proof[
  The series in (3.3) tends to zero as $f arrow.b 0$, so choose $f$ first. Choose $delta < f$, then $eta$ sufficiently small for the first inequality of (3.4), then $tau$, and finally $gamma$, in that order. By (3.2), choose $m gt.eq 1$ so that the probability that $Lambda_m$ meets no infinite cluster at parameter $p$ is less than $\( gamma \/ 2 \)^24$.
  For every integer $ell > m$, any infinite cluster meeting $Lambda_m$ gives an open path from $Lambda_m$ to the vertex boundary of $Lambda_ell$ inside that cube. Thus the probability of missing the whole boundary is less than $\( gamma \/ 2 \)^24$. By signed coordinate symmetry, all 24 quarter-face miss events have the same probability, say $a_ell$. They are decreasing events of a finite product, so positive association gives
  $ a_ell^24 lt.eq bb(P)_p \( Lambda_m upright(" misses every quarter-face within ") Lambda_ell \) < \( gamma \/ 2 \)^24 . $
  Consequently $a_ell < gamma \/ 2$ for every $ell > m$.
  Now $M$ and $rho_0$ are fixed and positive. Choose $K$, define $L$ and $alpha > 0$, and choose $R$ and then $r$ to satisfy (3.5). All these choices precede the choice of $q$. At each of the three radii $2 r \, 2 r + 1 \, 10 r$, a quarter-face connection event uses finitely many bits, so its probability is a polynomial in the parameter. The strict estimate at $p$, with margin $gamma \/ 2$, therefore persists with margin $gamma$ at some single $q in \( p \/ 2 \, p \)$, simultaneously for all 24 faces and all three radii. Translation invariance gives the same estimates for every center $u$. This proves (3.6). ◻
]

Fix these choices for the rest of the proof. Every later connection estimate uses parameter $q$ on the indicated unrevealed region. Bits outside that region may already have been fixed, a possibility allowed by Corollary 4.

== 4 Extending a connection through a fresh region <sec:extension>

The construction adapts the shell, separated-seed, and conditional-target strategy of Kozma and Nitzan [12] Section 4, Lemma 10. We use the hyperedge failure comparison for both models and define relay quality using the interior bits alone.

We retain the parameters chosen in Lemma 7. A rectangle is a nonempty set of the form

$ B = product_(h = 1)^3 \( \[ a_h \, b_h \] ∩ bb(Z) \) \, #h(2em) a_h \, b_h in bb(Z) \, $

and $B^(\( j \))$ denotes its expansion by $j$ in every coordinate direction. Bits internal to a vertex set mean sites in that set, or bonds with both endpoints in it, according to the model.

#thm([Lemma 4.1.])[
  (Extension estimate).  #emph[Let $G$ be a finite subgraph of $bb(Z)^3$ containing a rectangle $D$ and every lattice edge internal to $D$. Give its bits independent laws, with parameter $q$ on all bits internal to $D$ and arbitrary parameters, including $0$ and $1$, elsewhere. Let $o in V \( G \)$ and $T subset.eq V \( G \)$. Suppose that a rectangle $B$ satisfies 
$ B^(\( R \)) subset.eq D \, #h(2em) o in.not B^(\( R \)) \, $

 and that for every $u in B^(\( R \))$ there is a radius $ell in { 2 r \, 2 r + 1 \, 10 r }$ such that $Lambda_ell \( u \) subset.eq D$ and some quarter-face of this cube is contained in $T$. Then, for connections in $G$, 
$ bb(P) \( o arrow.l.r B \, med o ↮ T \) < eta . quad "(4.1)" $ <ext:conclusion>

]
] <ext:estimate>

#proof[
  We first choose a deterministic layer at which a connection to $B$ usually supplies many possible entry points. We then try disjoint open seed boxes at those points, and use Corollary 4 to pass from a successful seed to $T$.
  #emph[Choosing a layer.] The disjoint closure events used here also appear in Grimmett and Marstrand [7] Section 3, Lemma 3. For $m lt.eq j < R$, expose only the bits internal to the induced graph outside $B^(\( j \))$. Let $Y_j$ be the exterior neighbors of $B^(\( j \))$ reachable from $o$ by an open path in this outside graph, and set $N_j = \| Y_j \|$. Every exterior neighbor $y$ of a rectangle has a unique neighbor $z_y$ inside it. Both endpoints and their edge lie in $B^(\( j + 1 \)) subset.eq D$. Since $o$ is outside $B^(\( R \))$, any path from $o$ to $B$ has a first entry into $B^(\( j \))$, and hence $N_j gt.eq 1$.
  On $1 lt.eq N_j < L$, consider the event that all bonds ${ y \, z_y }$, $y in Y_j$, are closed in the bond model, or that all corresponding sites $z_y$ are closed in the site model. Given the outside bits, these are unexposed parameter-$q$ bits. There are at most $N_j$ distinct bits; repeated sites $z_y$ can only increase the closure probability. Thus its conditional probability is at least
  $ \( 1 - q \)^(N_j) gt.eq \( 1 - p \)^L = alpha . $
  Such a closure prevents every first entry into $B^(\( j \))$. In particular, $N_i = 0$ for all $i < j$, because every exterior neighbor of $B^(\( i \))$ belongs to $B^(\( j \))$. The events consisting of $1 lt.eq N_j < L$ and this closure are therefore pairwise disjoint as $j$ varies. It follows that
  $ sum_(j = m)^(R - 1) bb(P) \( o arrow.l.r B \, med N_j < L \) lt.eq sum_(j = m)^(R - 1) bb(P) \( 1 lt.eq N_j < L \) lt.eq alpha^(- 1) . $
  Fix a deterministic $j in { m \, dots.h \, R - 1 }$ for which
  $ bb(P) \( o arrow.l.r B \, med N_j < L \) lt.eq frac(1, alpha \( R - m \)) . quad "(4.2)" $ <ext:layer>
  Write $C = B^(\( j \))$. Let $xi$ be the configuration of bits internal to $C$, and let $zeta$ be the configuration of bits internal to the induced graph outside $C$. Thus $Y_j$ is determined by $zeta$. For bonds, the remaining bits are the bonds crossing between $C$ and its complement. The configurations $xi$, $zeta$, and these crossing bits are independent. All bits of $xi$ and all crossing bits have parameter $q$, since they lie in $B^(\( j + 1 \)) subset.eq D$. For sites, $xi$ and $zeta$ already partition the bits.
  We will use these two configurations for different purposes. The exterior $zeta$ selects entrances that $o$ has reached, whereas $xi$ determines which relay centers have high conditional probability of reaching $T$. We first estimate relay quality for each fixed entrance, then use independence to apply that estimate to the entrances selected by $zeta$.
  #emph[Defining good relays from $xi$.] For every exterior neighbor $y$ of $C$, choose $v_y$ so that
  $ U_y = Lambda_m \( v_y \) subset.eq C \, #h(2em) z_y in U_y \, #h(2em) parallel v_y - y parallel_oo lt.eq m + 1 . $
  Explicitly, clamp each coordinate of $z_y$ to the corresponding coordinate interval of $C$ shrunk by $m$ at both ends. Those shrunken intervals are nonempty because $j gt.eq m$. Let $O_y$ be the event that every internal bit of $U_y$ is open. Then $O_y$ is determined by $xi$ and $bb(P) \( O_y \) = q^M$. Define
  $ g_y = bb(P) \( v_y arrow.l.r T divides xi \) \, #h(2em) A_xi = { v_y : y upright(" is an exterior neighbor of ") C \, med g_y > 1 - tau } . $
  In this definition the exterior configuration and the crossing bits are still averaged over according to their original product law. In particular, $A_xi$ is determined by $xi$ alone.
  For a fixed $y$, apply the geometric hypothesis at $u = v_y$. The quarter-face estimate (3.6) supplies an increasing event of probability greater than $1 - gamma$ connecting $U_y$ to $T$ inside the specified cube. On its intersection with $O_y$, the center $v_y$ also connects to $T$. Positive association gives
  $ bb(P) \( O_y \, med v_y ↮ T \) lt.eq q^M gamma . $
  Since $O_y$ is determined by $xi$, it follows that
  $ tau thin bb(P) \( O_y \, med g_y lt.eq 1 - tau \) & lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(O_y) \( 1 - g_y \) #scale(x: 120%, y: 120%)[\]]\
 & = bb(P) \( O_y \, med v_y ↮ T \) lt.eq q^M gamma . quad "(4.3)" $ <ext:relay-quality>
  This bounds the chance that a fixed seed is open but its center fails the defining condition for $A_xi$.
  #emph[Selecting reachable entrances using $zeta$.] Condition now on $zeta$. Whenever $N_j gt.eq L$, choose deterministically $K$ members of $Y_j$ at pairwise sup distances greater than $4 m + 2$. This is possible by greedy selection: each chosen vertex excludes at most $\( 8 m + 5 \)^3$ candidates, while $L = K \( 8 m + 5 \)^3$. The corresponding centers have pairwise distances greater than $2 m$, so their boxes $U_y$ are vertex-disjoint.
  Call a selected entrance successful if $O_y$ holds and, for bonds, the crossing bond ${ y \, z_y }$ is open. For sites, $y$ is already open because it is reachable in the outside graph, and the open seed contains $z_y$. In either model a success therefore gives an actual open path from $o$ to $v_y$.
  Given $zeta$, these successes are independent Bernoulli trials with common parameter
  $ c = cases(delim: "{", q^(M + 1) \, & upright("for bonds") \,, q^M \, & upright("for sites") .) #h(2em) c gt.eq rho_0 . $
  Indeed, the boxes use disjoint sets of bits of $xi$, and the selected crossing bonds are distinct and independent of $xi$ and $zeta$. If $S$ counts successes, its conditional variance is at most $K c$. Chebyshev’s inequality gives
  $ bb(P) (S < frac(K c, 2) thin mid(bar.v) thin zeta) lt.eq frac(4, K c) lt.eq frac(4, K rho_0) . quad "(4.4)" $ <ext:success-count>
  Let $Z$ count successful entrances whose centers satisfy $g_y lt.eq 1 - tau$. For each selected $y$, (4.3) gives
  $ bb(P) \( O_y \, med g_y lt.eq 1 - tau divides zeta \) lt.eq frac(q^M gamma, tau) . $
  Indeed, after fixing $zeta$ the selected vertices are fixed, and $O_y ∩ { g_y lt.eq 1 - tau }$ is an event of $xi$, whose law has not changed. For bonds the additional crossing bit is independent and contributes a factor $q$. Summing these bounds gives
  $ bb(E) \[ Z divides zeta \] lt.eq frac(K c gamma, tau) \, #h(2em) bb(P) (Z gt.eq frac(K c, 2) thin mid(bar.v) thin zeta) lt.eq frac(2 gamma, tau) . $
  If $S gt.eq K c \/ 2$ and $Z < K c \/ 2$, some successful entrance has its center in $A_xi$. Thus $o$ reaches $A_xi$. Integrating over $zeta$ and including the low-entry event from (4.2), we conclude that
  $ bb(P) \( o arrow.l.r B \, med o ↮ A_xi \) lt.eq frac(1, alpha \( R - m \)) + frac(4, K rho_0) + frac(2 gamma, tau) . quad "(4.5)" $ <ext:reach-relay>
  #emph[Passing from the relay to the target.] The estimate (4.5) is now under the original law. To control the remaining failure event, condition on $xi$ alone. Then $A_xi$ is a deterministic set, the remaining bits have their product law, and the conditional target probability of each $v_y in A_xi$ is the number $g_y > 1 - tau$ used in its definition. Corollary 4 therefore gives
  $ bb(P) \( o arrow.l.r A_xi \, med o ↮ T divides xi \) lt.eq tau \, $
  including the trivial case $A_xi = diameter$. Integrating this bound, and splitting the desired failure event according to whether $o$ reaches $A_xi$, yields
  $ bb(P) \( o arrow.l.r B \, med o ↮ T \) lt.eq frac(1, alpha \( R - m \)) + frac(4, K rho_0) + frac(2 gamma, tau) + tau < eta . $
  Each of the four terms is less than $eta \/ 4$ by (3.4) and (3.5). ◻
]

== 5 Relaying between neighboring cubes <sec:geometry>

The contraction and translation strategy adapts the quarter-face targets of Kozma and Nitzan [12] Section 4, Lemmas 11–12. We specify thirteen moves that turn the extension estimate into a connection estimate between the present neighboring coarse boxes. The scales $R \, r$ and the parameter $q$ are those of Lemma 7; in particular,

$ r > 100 \( R + 1 \) . quad "(5.1)" $ <geom:separation>

For $v = \( v_1 \, v_2 \) in bb(Z)^2$, set

$ c_v = \( 20 r + 1 \) \( v_1 \, v_2 \, 0 \) \, #h(2em) Q_v = Lambda_(10 r) \( c_v \) \, #h(2em) B_v = Lambda_(4 r) \( c_v \) . quad "(5.2)" $ <geom:boxes>

The cubes $Q_v$ have disjoint vertex sets. If $v \, x$ are nearest neighbors in $bb(Z)^2$, let $I_(v x)$ be the set of lattice edges with one endpoint in $Q_v$ and the other in $Q_x$. Their union $D = Q_v union Q_x$ is a rectangular lattice prism: all edges internal to $D$ are precisely the edges internal to the two cubes together with $I_(v x)$.

#thm([Lemma 5.1.])[
  (Neighboring-box relay).  #emph[Let $v \, x in bb(Z)^2$ be nearest neighbors. Let $G$ be a finite lattice subgraph containing $D = Q_v union Q_x$ and all lattice edges internal to $D$. Consider independent bond or site percolation on $G$, with parameter $q$ on all bits internal to $D$ and arbitrary parameters elsewhere. If $o in V \( G \)$ lies outside $D$, then 
$ bb(P) #scale(x: 120%, y: 120%)[\(] o arrow.l.r B_v \, med o ↮ B_x #scale(x: 120%, y: 120%)[\)] lt.eq 13 eta . quad "(5.3)" $ <geom:relay-bound>

 All connections in this statement are taken in $G$.]
] <geom:relay>

#proof[
  By translation and a signed permutation of coordinates, we may suppose that $c_v = 0$ and $c_x = \( 20 r + 1 \, 0 \, 0 \)$. Thus
  $ D = #scale(x: 120%, y: 120%)[\(] \[ - 10 r \, 30 r + 1 \] times \[ - 10 r \, 10 r \]^2 #scale(x: 120%, y: 120%)[\)] ∩ bb(Z)^3 . quad "(5.4)" $ <geom:prism>
  Indeed, the first-coordinate intervals of the two cubes are $\[ - 10 r \, 10 r \] ∩ bb(Z)$ and $\[ 10 r + 1 \, 30 r + 1 \] ∩ bb(Z)$, whose union has no missing lattice vertices.
  We construct rectangles $P_0 \, dots.h \, P_13$, starting with $P_0 = B_v$ and ending with $P_13 subset.eq B_x$, such that Lemma 8 applies with $B = P_i$ and $T = P_(i + 1)$ for every $0 lt.eq i < 13$. At each translation, the required $R$-expansion of the starting rectangle is accommodated by increasing every half-width by $R$. We first shorten the rectangle in each of its three coordinate directions, leaving room for ten such increases before the final rectangle must fit inside $B_x$. Figure 2 shows these two stages, and Table 1 records the thirteen target rectangles and the radii and orientations used to choose the quarter-faces.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (5.4, 3.36), stroke: (paint: rgb("#808080")))
  rect((5.562, 0), (10.96, 3.36), stroke: (paint: rgb("#808080")))
  content((2.7, 3.056), [$Q_v$])
  content((8.262, 3.056), [$Q_x$])
  line((5.4, 0.42), (5.562, 0.42), stroke: (paint: rgb("#808080")))
  line((5.4, 0.84), (5.562, 0.84), stroke: (paint: rgb("#808080")))
  line((5.4, 1.26), (5.562, 1.26), stroke: (paint: rgb("#808080")))
  line((5.4, 1.68), (5.562, 1.68), stroke: (paint: rgb("#808080")))
  line((5.4, 2.1), (5.562, 2.1), stroke: (paint: rgb("#808080")))
  line((5.4, 2.52), (5.562, 2.52), stroke: (paint: rgb("#808080")))
  line((5.4, 2.94), (5.562, 2.94), stroke: (paint: rgb("#808080")))
  content((5.481, 3.381), [$I_"vx"$], anchor: "south")
  rect((1.62, 1.008), (3.78, 2.352), stroke: (dash: "dashed"))
  rect((7.182, 1.008), (9.342, 2.352), stroke: (dash: "dashed"))
  content((2.7, 2.604), [$P_0=B_v$])
  content((8.262, 2.604), [$B_x$])
  rect((2.093, 1.302), (3.308, 2.058))
  rect((7.587, 1.26), (8.937, 2.1))
  content((2.7, 0.819), [$P_3$])
  content((8.262, 0.819), [$P_13$])
  line((2.7, 1.68), (8.262, 1.68), mark: (end: ">"))
  circle((2.7, 1.68), radius: 0.04233, fill: black)
  circle((3.256, 1.68), radius: 0.04233, fill: black)
  circle((3.812, 1.68), radius: 0.04233, fill: black)
  circle((4.369, 1.68), radius: 0.04233, fill: black)
  circle((4.925, 1.68), radius: 0.04233, fill: black)
  circle((5.481, 1.68), radius: 0.04233, fill: black)
  circle((6.037, 1.68), radius: 0.04233, fill: black)
  circle((6.593, 1.68), radius: 0.04233, fill: black)
  circle((7.15, 1.68), radius: 0.04233, fill: black)
  circle((7.706, 1.68), radius: 0.04233, fill: black)
  circle((8.262, 1.68), radius: 0.04233, fill: black)
  content((5.481, 2.184), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [ten translations])])
  line((1.485, 0.819), (2.093, 1.312), mark: (end: ">"))
  content((1.35, 0.42), [three#linebreak()contractions])
  content((2.7, -0.084), [$c_v$], anchor: "north")
  content((8.262, -0.084), [$c_x$], anchor: "north")
  line((9.788, -0.2835), (10.96, -0.2835), mark: (end: ">"))
  content((10.96, -0.2835), [$x_1$], anchor: "west")
})],
    caption: [Figure 2: A schematic cross-section of the neighboring-box relay, not to scale. The three contraction steps take $P_0$ to $P_3$; the marked centers then make ten translations to $P_13 subset B_x$. Intermediate rectangles are omitted. The last translation has length $2 r + 1$, rather than $2 r$, to match the coarse spacing $20 r + 1$. The narrow gap represents the interface edges between disjoint lattice cubes, not a missing layer of lattice vertices. ],
  ) <geom:figure>
  #figure(
    table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Target
], table.cell(rowspan: 1, colspan: 1)[Center’s first coordinate
], table.cell(rowspan: 1, colspan: 1)[Coordinate half-widths
], table.cell(rowspan: 1, colspan: 1)[Radius
], table.cell(rowspan: 1, colspan: 1)[Normal
]),
  table.cell(rowspan: 1, colspan: 1)[$P_1$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + R \, 4 r + R \, 4 r + R \)$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, inward
],
  table.cell(rowspan: 1, colspan: 1)[$P_2$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 2 R \, 2 r + 2 R \, 4 r + 2 R \)$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$2$, inward
],
  table.cell(rowspan: 1, colspan: 1)[$P_3$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 3 R \, 2 r + 3 R \, 2 r + 3 R \)$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$3$, inward
],
  table.cell(rowspan: 1, colspan: 1)[$P_4$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 4 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_5$
], table.cell(rowspan: 1, colspan: 1)[$4 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 5 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_6$
], table.cell(rowspan: 1, colspan: 1)[$6 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 6 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_7$
], table.cell(rowspan: 1, colspan: 1)[$8 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 7 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_8$
], table.cell(rowspan: 1, colspan: 1)[$10 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 8 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_9$
], table.cell(rowspan: 1, colspan: 1)[$12 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 9 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_10$
], table.cell(rowspan: 1, colspan: 1)[$14 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 10 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_11$
], table.cell(rowspan: 1, colspan: 1)[$16 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 11 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_12$
], table.cell(rowspan: 1, colspan: 1)[$18 r$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 12 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
  table.cell(rowspan: 1, colspan: 1)[$P_13$
], table.cell(rowspan: 1, colspan: 1)[$20 r + 1$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 r + 13 R \) upright(bold(1))$
], table.cell(rowspan: 1, colspan: 1)[$2 r + 1$
], table.cell(rowspan: 1, colspan: 1)[$1$, forward
],
),
    caption: [Table 1: The thirteen interfaces $P_(j - 1) arrow.r P_j$ in the relay. All centers have second and third coordinates zero, and $upright(bold(1)) = \( 1 \, 1 \, 1 \)$. Each listed radius is used about every point of $P_(j - 1)^(\( R \))$. “Inward” means toward zero in that normal coordinate; “forward” means the positive first direction. All transverse signs point toward zero. The proof verifies both target-face and full-cube containment. ],
  )
  ===== 5.1 Three contraction steps. <three-contraction-steps.>
  For $t = 1 \, 2 \, 3$, let $P_t$ be centered at zero with coordinate half-widths
  $ a_(t \, h) = cases(delim: "{", 2 r + t R \, & h lt.eq t \,, 4 r + t R \, & h > t \,) #h(2em) h in { 1 \, 2 \, 3 } . quad "(5.5)" $ <geom:contraction-widths>
  Fix $u in P_(t - 1)^(\( R \))$. Its coordinate bounds are $2 r + t R$ in directions $h < t$ and $4 r + t R$ in directions $h gt.eq t$. In the cube $Lambda_(2 r) \( u \)$, choose a quarter-face normal to coordinate $t$, with its normal sign and both transverse signs directed toward coordinate zero. At a zero coordinate, either sign may be used.
  In the normal direction, the face coordinate has absolute value at most
  $ max { 2 r \, \( 4 r + t R \) - 2 r } = 2 r + t R . $
  In a transverse direction, the face coordinate ranges between a number $a$ and $a - 2 r "sign" \( a \)$, with either sign allowed when $a = 0$. Its absolute value is therefore at most $max { \| a \| \, 2 r }$, which fits the corresponding half-width in (5.5). The chosen quarter-face is consequently contained in $P_t$.
  The full cube $Lambda_(2 r) \( u \)$ has all coordinate absolute values at most $6 r + 3 R < 10 r$, by (5.1), and so lies in $D$. In particular $P_(t - 1)^(\( R \)) subset.eq D$. Since $o in.not D$, the remaining geometric hypothesis of Lemma 8 is also satisfied. This proves its applicability to all three contraction steps. The resulting rectangle is
  $ P_3 = Lambda_(2 r + 3 R) \( 0 \) . quad "(5.6)" $ <geom:contracted>
  ===== 5.2 Ten translation steps. <ten-translation-steps.>
  Define the step lengths and centers by
  $ s_i = cases(delim: "{", 2 r \, & 1 lt.eq i lt.eq 9 \,, 2 r + 1 \, & i = 10 \,) #h(2em) z_0 = 0 \, #h(2em) z_i = \( s_1 + dots.h.c + s_i \, 0 \, 0 \) . quad "(5.7)" $ <geom:translations>
  For $1 lt.eq i lt.eq 10$, set
  $ w_i = 2 r + \( 3 + i \) R \, #h(2em) P_(3 + i) = Lambda_(w_i) \( z_i \) . quad "(5.8)" $ <geom:translated-boxes>
  The $R$-expansion of the preceding rectangle, $P_(2 + i)^(\( R \))$, is centered at $z_(i - 1)$ and has half-width $w_i$. Fix $u$ in that expansion. In $Lambda_(s_i) \( u \)$ choose the quarter-face with forward normal in coordinate $1$, and with both transverse signs directed toward zero. The normal coordinate on this face is $u_1 + s_i$. Relative to the new center $z_i$, its offset is exactly $u_1 - \( z_(i - 1) \)_1$, of absolute value at most $w_i$. Transverse absolute coordinates are at most $max { w_i \, s_i } = w_i$. The equality also holds for the last step, because $13 R gt.eq 1$. Hence this quarter-face is contained in $P_(3 + i)$.
  To check containment of the full radius-$s_i$ cube, note that $0 lt.eq \( z_(i - 1) \)_1 lt.eq 18 r$, $w_i lt.eq 2 r + 13 R$, and $s_i lt.eq 2 r + 1$. Its first coordinate is therefore between
  $ - 4 r - 13 R - 1 quad upright("and") quad 22 r + 13 R + 1 \, quad "(5.9)" $ <geom:translation-bounds>
  and its transverse absolute coordinates are at most $4 r + 13 R + 1$. Condition (5.1) gives $13 R + 1 < 6 r$ and $13 R < 8 r$, so these bounds lie inside the prism (5.4). It follows again that the preceding expanded rectangle lies in $D$ and avoids $o$. The radii used are $2 r$ and $2 r + 1$, both allowed by Lemma 8. Thus all ten translation steps satisfy that Lemma’s hypotheses.
  The final center is $z_10 = \( 9 \( 2 r \) + \( 2 r + 1 \) \, 0 \, 0 \) = c_x$, and the final half-width is $w_10 = 2 r + 13 R < 4 r$. Consequently $P_13 subset.eq B_x$. If $o$ is connected to $P_0$ but not to $P_13$, then for at least one $i in { 0 \, dots.h \, 12 }$ it is connected to $P_i$ but not to $P_(i + 1)$. A union bound and thirteen applications of Lemma 8 now give
  $ bb(P) #scale(x: 120%, y: 120%)[\(] o arrow.l.r B_v \, med o ↮ B_x #scale(x: 120%, y: 120%)[\)] & lt.eq bb(P) #scale(x: 120%, y: 120%)[\(] o arrow.l.r P_0 \, med o ↮ P_13 #scale(x: 120%, y: 120%)[\)]\
 & lt.eq sum_(i = 0)^12 bb(P) #scale(x: 120%, y: 120%)[\(] o arrow.l.r P_i \, med o ↮ P_(i + 1) #scale(x: 120%, y: 120%)[\)] lt.eq 13 eta . $
  No independence between these thirteen connection events is required. ◻
]

== 6 Adaptive exploration and the final contradiction <sec:exploration>

We use the scales from Lemma 7 to construct an infinite open cluster at the parameter $q < p_c$. Recall the coarse cubes and their inner boxes:

$ c_v = \( 20 r + 1 \) \( v_1 \, v_2 \, 0 \) \, #h(2em) Q_v = Lambda_(10 r) \( c_v \) \, #h(2em) B_v = Lambda_(4 r) \( c_v \) \, #h(2em) v in bb(Z)^2 . $

For adjacent coarse vertices $v \, x$, the interface $I_(v x)$ consists of the lattice edges between $Q_v$ and $Q_x$. Different cubes have disjoint vertex sets. We keep the source $o = \( 0 \, 0 \, 0 \)$ in the root cube $Q_0$.

=== 6.1 The exploration and its conditional promise <the-exploration-and-its-conditional-promise>

Retaining conditional connection predictions during adaptive exploration is the method used in Kozma and Nitzan’s proof of Theorem 6 [12] Section 4, equations (30)–(32). Here each pending cube’s unknown bits are reserved until that cube is processed.

Let $cal(I)$ be the event that all bits internal to $Q_0$ are open and, for bonds, that all bits on its four interfaces are open. This event has positive probability because it prescribes finitely many bits and $q > 0$. Write

$ bb(P)_(cal(I)) \( thin dot.op thin \) = bb(P)_q \( thin dot.op divides cal(I) \) . $

Under this law, all bits not prescribed by $cal(I)$ are still independent Bernoulli($q$).

Declare the coarse root good and put its four neighbors in a queue, each with parent the root. A coarse vertex is #emph[visited] once it has been put in the queue; the root is also visited. A queued vertex is #emph[pending] until it is processed. Use a fixed ordering of neighbors whenever vertices are added to the queue, and always process the first pending vertex. No vertex is assigned a parent or queued more than once.

For each pending vertex we will retain a high conditional probability of connection from $o$. The graph used for this prediction follows its parent chain, so that the only bits still needed to decide the connection will be in the pending cube and its incoming interface. Specifically, for a pending vertex $v$, let $G \( v \)$ consist of the cubes on its parent chain back to the root, all edges internal to those cubes, and the interfaces between successive cubes of the chain. We include no other edges, even when nonsuccessive cubes are adjacent. Set

$ H_v = { o arrow.l.r B_v upright(" in ") G \( v \) } . $

The construction will maintain the promise

$ bb(P)_(cal(I)) \( H_v divides upright("revealed history") \) > 1 - delta quad upright("for every pending ") v . quad "(6.1)" $ <exp:promise>

A cube will acquire children only after its own connection is verified and those children satisfy the same promise.

The invariant holds initially. For a root neighbor $v$, choose a quarter-face of $Q_v$ facing $Q_0$. Every vertex of that quarter-face has a neighbor in $Q_0$. By (3.6), the probability that $Lambda_m \( c_v \)$ connects to this quarter-face inside $Q_v$ is greater than $1 - gamma$. Here $Lambda_m \( c_v \) subset.eq B_v$. Such a connection joins $B_v$ to $o$: the root cube and the intervening edge are open in the bond model, while both endpoints of the intervening edge are open in the site model. Since $gamma < delta$, this proves (6.1) for the initial queue.

To process a pending vertex $v$, reveal the bits internal to $Q_v$ and, for bonds, its incoming parent interface, except for bits already known. The ancestor cubes and the interfaces joining them have been revealed at earlier steps, so this determines $H_v$. For each unvisited neighbor $x$ of $v$, extend $G \( v \)$ by $Q_x$, its internal edges, and $I_(v x)$, obtaining a graph $G'$, and compute

$ b_x = bb(P)_(cal(I)) #scale(x: 120%, y: 120%)[\(] o arrow.l.r B_x upright(" in ") G' divides upright("history after this reveal") #scale(x: 120%, y: 120%)[\)] . quad "(6.2)" $ <exp:child-probability>

The number $b_x$ is calculated from the revealed values and the product law of the remaining bits; its computation reveals no bits. Declare $v$ good if $H_v$ holds and $b_x > 1 - delta$ for every such neighbor. In this case, give each unvisited neighbor parent $v$ and add it to the back of the queue. Otherwise declare $v$ bad and add no vertices. Remove $v$ from the queue in either case, and continue until the queue is empty, if this ever occurs.

#thm([Lemma 6.1.])[
  (Freshness and persistence).  #emph[Conditional on any positive-probability finite revealed history, all unrevealed bits are independent Bernoulli($q$). Moreover, (6.1) holds at every step of the exploration.]
] <exp:freshness>

#proof[
  The initialization fixes finitely many bits and leaves the others independent with parameter $q$. At every later step, the preceding revealed values determine which finite set of bits is exposed. Conditioning on the values of this selected set again leaves the remaining bits with their product law. The classifications, queue, parent assignments, and numbers $b_x$ are all functions of revealed values. They therefore add no conditions on the remaining bits. Induction proves the first assertion.
  When $x$ is assigned parent $v$, its graph $G \( x \)$ is precisely the graph $G'$ used to compute $b_x$. The rule for declaring $v$ good therefore establishes (6.1) for $x$ at that time. To prove persistence, it suffices to verify that processing other vertices cannot expose any of the unknown bits of $H_x$.
  All ancestor cubes and their connecting interfaces have already been revealed. Thus the unknown bits of $H_x$ lie in $Q_x$ or, for bonds, on $I_(v x)$. The cubes are vertex-disjoint, so another vertex’s processing does not reveal an internal bit of $Q_x$. Each step also reveals only the processed vertex’s incoming parent interface. Distinct parent links use distinct interfaces. Moreover, a pending vertex has no children, since only processed good vertices acquire them. Hence $I_(v x)$ cannot be revealed by another step while $x$ is pending. If this interface was prescribed at initialization because $v$ is the root, its fixed values simply remain part of the history.
  Consequently, until $x$ is processed, the known bits of $H_x$ stay fixed and its unknown bits retain the same product law. Its conditional connection probability is unchanged. Together with the initial verification, this proves (6.1) at every step. ◻
]

=== 6.2 A uniform bound on bad vertices <a-uniform-bound-on-bad-vertices>

#thm([Lemma 6.2.])[
  #emph[Immediately before any pending vertex is processed, its conditional probability of being declared bad is less than $f$.]
] <exp:conditional-bad>

#proof[
  Condition on a positive-probability history immediately before processing $v$. Let $cal(F)$ denote this history and $cal(F)^(+)$ the history after the prescribed reveal at $v$. The unvisited neighbors to be tested are already determined by $cal(F)$.
  Fix one such neighbor $x$ and the corresponding graph $G'$. Under the conditioning on $cal(F)$, every bit internal to the prism $D = Q_v union Q_x$ has its fresh parameter-$q$ law. To check this carefully, neither cube has been processed: $v$ is pending and $x$ is unvisited. Their interface has not been revealed as a parent link, since that would require $x$ to have been visited or $v$ to have been processed. Neither vertex is the root, so their interface is not one prescribed by initialization. Although an initialized root interface may meet $Q_v$, it is external to $D$. Lemma 10 gives the required independence.
  The graph $G'$ contains every edge internal to this prism, and $o$ lies outside it in the disjoint root cube. All exterior bits have independent laws, with probabilities $0$ or $1$ for known bits and $q$ for unknown bits. Thus Lemma 9 applies. If $C_x = { o arrow.l.r B_x upright(" in ") G' }$, it gives
  $ bb(P)_(cal(I)) \( H_v ∩ C_x^(upright(c)) divides cal(F) \) lt.eq 13 eta \, $
  because $H_v$ implies a connection to $B_v$ in the larger graph $G'$. Notice that the relay estimate is applied #emph[before] revealing $Q_v$, not after conditioning on $H_v$.
  The event $H_v$ is determined by $cal(F)^(+)$, and $b_x = bb(P)_(cal(I)) \( C_x divides cal(F)^(+) \)$. The tower property therefore yields
  $ bb(E)_(cal(I)) \[ upright(bold(1))_(H_v) \( 1 - b_x \) divides cal(F) \] lt.eq 13 eta . $
  On $H_v ∩ { b_x lt.eq 1 - delta }$ the integrand is at least $delta$, so
  $ bb(P)_(cal(I)) \( H_v ∩ { b_x lt.eq 1 - delta } divides cal(F) \) lt.eq frac(13 eta, delta) . $
  There are at most four tests. The promise and a union bound now give
  $ bb(P)_(cal(I)) \( v upright(" is declared bad") divides cal(F) \) lt.eq delta + frac(52 eta, delta) < f \, $
  where the last inequality is (3.4). No independence between the tests is needed. ◻
]

#thm([Lemma 6.3.])[
  #emph[For every deterministic set of $k$ distinct coarse vertices, the probability under $bb(P)_(cal(I))$ that all are processed and declared bad is at most $f^k$.]
] <exp:bad-set>

#proof[
  The assertion is immediate if the set contains the root, which is declared good. Otherwise, fix such a set $S$. For $1 lt.eq j lt.eq k$, let $T_j$ be the processing time of the $j$th member of $S$ to be processed, and set $T_j = oo$ if fewer than $j$ members are ever processed. Let $E_j$ be the event that $T_j < oo$ and these first $j$ members are all declared bad; put $E_0$ equal to the whole sample space.
  For each finite time $t$, the event
  $ { T_j = t } ∩ E_(j - 1) $
  is determined before the reveal at time $t$. Indeed, at that moment one knows the next vertex, how many members of $S$ have already been processed, and whether all of those members were bad. On ${ T_j = t }$ there are exactly $j - 1$ such previous members, so these observations determine $E_(j - 1)$ there. After termination we keep the history constant; events specifying a later processing time are empty. Applying Lemma 11 at time $t$ and summing gives
  $ bb(P)_(cal(I)) \( E_j \) & lt.eq f sum_(t gt.eq 1) bb(P)_(cal(I)) \( T_j = t \, med E_(j - 1) \)\
 & lt.eq f thin bb(P)_(cal(I)) \( E_(j - 1) \) . $
  Iteration yields $bb(P)_(cal(I)) \( E_k \) lt.eq f^k$. Since no vertex is processed twice, $E_k$ is exactly the event in the statement. The proof does not assume that every member of $S$ is eventually processed. ◻
]

=== 6.3 Contours and completion of the proof <contours-and-completion-of-the-proof>

Let $X$ be the set of good coarse vertices, including the root. If $X$ is finite, only finitely many vertices can ever enter the queue: new entries arise only from good vertices, with at most four per vertex. The queue must therefore empty after finitely many steps. Every vertex outside $X$ adjacent to $X$ has then been processed and declared bad. Indeed, the root’s neighbors were all queued at initialization. When any nonroot good vertex was processed, each of its neighbors was either already visited or assigned at that step. Thus every outside neighbor of $X$ is processed before termination and is not good, so it is bad.

Apply Lemma 5 to this finite set $X$, which contains the origin of the coarse lattice. Its boundary contains a cycle of some length $n$ in the deterministic family of at most $2 n 3^n$ candidates. For each candidate, fix the matching of crossed primal edges supplied by that Lemma. It has $k gt.eq n \/ 7$ edges with pairwise disjoint endpoints. If the candidate occurs as a boundary cycle of $X$, every one of these edges has a bad endpoint outside $X$.

For a fixed candidate there are $2^k$ ways to choose one endpoint from each matching edge. Each choice is a deterministic set of $k$ distinct vertices, so Lemma 12 bounds the probability that all chosen vertices are processed bad by $f^k$. Hence the candidate’s probability is at most

$ 2^k f^k = \( 2 f \)^k lt.eq \( 2 f \)^(n \/ 7) \, $

using $2 f < 1$. We have not conditioned on the random set $X$ or on the occurrence of a cycle. Taking the union bound over the deterministic candidate families and using the choice of $f$ in Lemma 7 gives

$ bb(P)_(cal(I)) \( \| X \| < oo \) lt.eq sum_(n gt.eq 1) 2 n 3^n \( 2 f \)^(n \/ 7) < 1 . quad "(6.3)" $ <exp:infinite-good>

Thus, with positive probability under $bb(P)_(cal(I))$, infinitely many coarse vertices are good. Every good nonroot vertex $v$ satisfies the actual connection event $H_v$. The boxes $B_v$ are pairwise disjoint, so these connections put infinitely many lattice vertices in the open cluster of $o$. Therefore

$ bb(P)_q \( o upright(" belongs to an infinite open cluster") \) gt.eq bb(P)_q \( cal(I) \) thin bb(P)_(cal(I)) \( \| X \| = oo \) > 0 . $

This contradicts $q < p_c$. The assumption of critical percolation was therefore false. The construction and all its estimates apply to both bond and site percolation with their respective critical parameters, proving Theorem 1.

The finite computations are not formal proof certificates.

#heading(level: 1)[References]
#bibitem([1])[Itai Benjamini and Oded Schramm. Percolation beyond $bb(Z)^d$, many questions and a few answers. #emph[Electronic Communications in Probability] #strong[1] (1996), 71--82. #link("https://doi.org/10.1214/ECP.v1-978")[doi:10.1214/ECP.v1-978].]
#bibitem([2])[S.~R. Broadbent and J.~M. Hammersley. Percolation processes. I. Crystals and mazes. #emph[Proceedings of the Cambridge Philosophical Society] #strong[53] (1957), no.~3, 629--641. #link("https://doi.org/10.1017/S0305004100032680")[doi:10.1017/S0305004100032680].]
#bibitem([3])[ChatGPT 5.6, prompted by Ahmed Bou-Rabee; exposition and formalization support by Claude Opus 5 and GLM 5.3. #emph[Percolation at criticality]. Public research exposition, updated September 5, 2026. #link("https://nitromannitol.github.io/site-percolation-7d3f2/")[Public exposition].]
#bibitem([4])[ChatGPT 5.6 Sol and Claude Fable 5.1, prompted by Ahmed Bou-Rabee. #emph[Kozma--Nitzan inequalities: proofs and counterexamples]. Public research exposition, updated September 5, 2026. #link("https://nitromannitol.github.io/kn1-verification-b80e9/")[Public exposition].]
#bibitem([5])[Hugo Duminil-Copin, Vladas Sidoravicius, and Vincent Tassion. Absence of infinite cluster for critical Bernoulli percolation on slabs. #emph[Communications on Pure and Applied Mathematics] #strong[69] (2016), no.~7, 1397--1411. #link("https://doi.org/10.1002/cpa.21641")[doi:10.1002/cpa.21641].]
#bibitem([6])[Robert Fitzner and Remco van der Hofstad. Mean-field behavior for nearest-neighbor percolation in $d > 10$. #emph[Electronic Journal of Probability] #strong[22] (2017), paper no.~43, 1--65. #link("https://doi.org/10.1214/17-EJP56")[doi:10.1214/17-EJP56].]
#bibitem([7])[G.~R. Grimmett and J.~M. Marstrand. The supercritical phase of percolation is well behaved. #emph[Proceedings of the Royal Society of London. Series A] #strong[430] (1990), no.~1879, 439--457. #link("https://doi.org/10.1098/rspa.1990.0100")[doi:10.1098/rspa.1990.0100].]
#bibitem([8])[Takashi Hara and Gordon Slade. Mean-field critical behaviour for percolation in high dimensions. #emph[Communications in Mathematical Physics] #strong[128] (1990), no.~2, 333--391. #link("https://doi.org/10.1007/BF02108785")[doi:10.1007/BF02108785].]
#bibitem([9])[Theodore E. Harris. A lower bound for the critical probability in a certain percolation process. #emph[Proceedings of the Cambridge Philosophical Society] #strong[56] (1960), no.~1, 13--20. #link("https://doi.org/10.1017/S0305004100034241")[doi:10.1017/S0305004100034241].]
#bibitem([10])[Markus Heydenreich and Kilian Matzke. Critical site percolation in high dimension. #emph[Journal of Statistical Physics] #strong[181] (2020), 816--853. #link("https://doi.org/10.1007/s10955-020-02607-y")[doi:10.1007/s10955-020-02607-y].]
#bibitem([11])[Harry Kesten. The critical probability of bond percolation on the square lattice equals $1 \/ 2$. #emph[Communications in Mathematical Physics] #strong[74] (1980), 41--59. #link("https://doi.org/10.1007/BF01197577")[doi:10.1007/BF01197577].]
#bibitem([12])[Gady Kozma and Shahaf Nitzan. A reduction of the $theta \( p_c \) = 0$ problem to a conjectured inequality. Preprint, 2024. #link("https://arxiv.org/abs/2401.12397v1")[arXiv:2401.12397v1].]
#bibitem([13])[Justin Leder. #emph[$theta \( p_c \) = 0$ for Bernoulli bond percolation on $bb(Z)^d$ in all dimensions $d gt.eq 2$: a guide to the Lean formalization]. Public research announcement, August 2026. #link("https://github.com/anthropics/formal-math/blob/795efb86f191735c5481675763537cfb4ff37e55/percolation/summary.pdf")[Pinned repository version], commit `795efb86f191`.]
#bibitem([14])[Lucio Russo. On the critical percolation probabilities. #emph[Zeitschrift für Wahrscheinlichkeitstheorie und verwandte Gebiete] #strong[56] (1981), no.~2, 229--237. #link("https://doi.org/10.1007/BF00535742")[doi:10.1007/BF00535742].]
#bibitem([15])[J.~van den Berg, O.~Häggström, and J.~Kahn. Some conditional correlation inequalities for percolation and related processes. #emph[Random Structures & Algorithms] #strong[29] (2006), no.~4, 417--435. #link("https://doi.org/10.1002/rsa.20102")[doi:10.1002/rsa.20102].]


