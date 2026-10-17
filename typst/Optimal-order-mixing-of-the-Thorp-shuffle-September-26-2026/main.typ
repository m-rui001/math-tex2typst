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

#align(center)[#text(size: 16pt, weight: "bold")[Optimal-order mixing of the Thorp shuffle]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

A single card can become uniformly distributed long before a shuffled deck is close to uniform. The Thorp shuffle makes this distinction particularly clear. Split a deck into two equal halves, pair cards that occupy corresponding positions, and choose the order of each pair by an independent fair coin. Interleaving the pairs produces the new deck. For a deck of size $n = 2^d$, every individual card is uniform after $d$ shuffles. The question is how much longer it takes to randomize the joint order of all $n$ cards.

We prove that a constant multiple of $d$ shuffles suffices. Let $q_d$ denote the law of one complete shuffle as a permutation of the positions, and let $U_n$ be uniform on the symmetric group $S_n$. Convolution is the law of composition of independent permutations, and

$ parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_g \| mu \( g \) - nu \( g \) \| . $

Write $t_(upright("mix")) \( d \)$ for the least nonnegative integer $t$ at which $parallel q_d^(* t) - U_n parallel_(upright("TV")) lt.eq 1 \/ 4$.

#thm([Theorem 1.1.])[
  (Optimal-order mixing).  #emph[As $d arrow.r oo$, 
$ parallel q_d^(* \( 1600 d \)) - U_n parallel_(upright("TV")) arrow.r 0 . $

 For every integer $t gt.eq 0$, 
$ parallel q_d^(* t) - U_n parallel_(upright("TV")) gt.eq 1 - frac(2^(t n \/ 2), n !) . $

 Consequently the mixing time at distance $1 \/ 4$ satisfies 
$ t_(upright("mix")) \( d \) gt.eq ⌈2 / n log_2 frac(3 n !, 4)⌉ = 2 d - O \( 1 \) \, #h(2em) t_(upright("mix")) \( d \) = Theta \( d \) . $

]
] <thm:mixing>

One step in this theorem is one complete physical shuffle. Changing the initial deck translates the permutation law, so its distance from uniform is unchanged. The upper bound is asymptotic in $d$; the constant $1600$ is an explicit choice in the proof, not a proposed sharp constant. Determining a leading constant or a cutoff remains a separate question.

The full-law conclusion controls every statistic of the final deck and, in particular, the joint positions of any deterministic selection of cards, by contraction of total variation under a map. It also shows that this shuffle produces an approximately uniform permutation using $O \( n log n \)$ independent fair bits: each of the $O \( log n \)$ steps uses $n \/ 2$ bits. The support bound identifies the same order of randomness as necessary for this construction.

=== 1.1 History and related work <history-and-related-work>

Thorp introduced the model in his 1973 study of the effects of nonrandom shuffling on Faro [19] Section 3.1. Its simple pairwise rule conceals a difficult question about dependence across the whole deck. For dyadic decks, Morris obtained the first bound polynomial in $d$, namely $O \( d^44 \)$, using evolving sets and a chameleon process that tracks conditional card probabilities [10]. Montenegro and Tetali sharpened this analysis to $O \( d^29 \)$ by spectral-profile and evolving-set methods [9] Theorems 6.14–6.15.

A second line of attack used relative entropy. Morris related entropy decay to pairwise card collisions and obtained $O \( \( log n \)^4 \)$ shuffles for every even $n$ [12]. He then proved $O \( d^3 \)$ for $n = 2^d$ by a stronger contraction over a block of $d$ shuffles [13]. Theorem 1 attains the logarithmic order discussed in Jonasson’s notes [7] Section 5 for dyadic decks. The corresponding optimal-order question for arbitrary even deck sizes is not addressed by the cube argument here.

Card marginals have also been studied for their own sake and for cryptography. Morris, Rogaway and Stegers analyzed the joint images of ordered input lists in their construction of enciphering schemes on small domains [14] Theorem 1. Czumaj and Vöcking proved that $O \( \( log n \)^2 \)$ Thorp shuffles mix any fixed fraction of the cards strictly below one, using non-Markovian couplings and butterfly-network estimates [2]. Our first stage needs a different, averaged guarantee: after $200 d$ shuffles, the joint positions of a uniformly sampled list of $7 n \/ 8$ labels are close to uniform on average over the list. The passage from these averaged marginals to the full law is a separate part of the proof.

The conditional-flow method has several predecessors. In the original Thorp analysis, Morris used a chameleon process to represent the law of a tagged card conditional on the set-valued trajectory of a collection containing that card; the conditional probabilities average across available pairs and are transported across pairs with only one available position [10] Section 4, Lemma 3. Hoang, Morris and Rogaway later used conditional squared energy and a sequential total-variation comparison to analyze the swap-or-not shuffle [5] Section 3, Theorem 3 and Lemma 4. Their uniformly random keys make the next partner uniform over the underlying group. Here the directions are prescribed cyclically. The exact identity retaining only one sweep of noise, together with independence of the two opposite halves during the intervening updates, provides the needed contraction.

For the final passage to the group, we use complete reducibility and Schur orthogonality, together with the tableau description and hook-length formula for symmetric-group degrees [4,18]. The inverse-degree summability needed here is a special case of a stronger theorem of Liebeck and Shalev [8] Theorem 2.6; we give an elementary proof of the required case. The final total-variation comparison is the finite-group Fourier method of Diaconis and Shahshahani [3] Section 3, Lemma 14. The additional step here is to turn bounds on complementary card marginals into operator bounds for matrix Fourier transforms, using a common trimming and the span of one vector’s orbit under a block subgroup.

=== 1.2 Proof overview <proof-overview>

Label positions by binary strings of length $d$, the vertices of a cube. Undoing a deterministic cyclic rotation turns successive shuffles into switch layers along successive coordinate directions: the two positions in one switch differ only in the active bit. A sweep through all $d$ directions takes $d$ physical shuffles. Section 2 gives this change of frame and proves the support lower bound.

For the upper bound, first choose an ordered list of $7 n \/ 8$ labels uniformly and independently of the shuffle. Expose these cards one at a time. Conditional on the paths already exposed, the next card has a probability distribution on the remaining positions. On a switch with two remaining positions its masses are averaged; on a switch with only one remaining position its mass follows the route fixed by the exposed path. Subtracting the uniform distribution on the remaining positions gives a centered flow.

A full sweep of coordinate averages annihilates every mean-zero vector. The actual conditional update differs from coordinate averaging only by noise with conditional mean zero on switches with one available position. Consequently the expected squared norm at the present time is an exact weighted sum of noise contributions from the preceding sweep, as proved in Section 3. To control those contributions, Section 4 looks back from the next active direction through the $d - 1$ other directions. These updates act independently inside the two opposite halves. A flow value in one half is therefore independent of the availability of its partner in the other half, conditional on the history at the start of this interval. A random list leaves a positive fraction of available positions in both halves with high probability. This yields a scalar energy recurrence and then the averaged marginal estimate of Proposition 5 at time $200 d$.

The second stage recovers the dependencies involving the omitted cards. Partition the labels into eight equal blocks, choosing the partition so that the eight complementary marginals have small total error. Each marginal is a distribution on cosets of the subgroup that permutes its omitted block. Removing a small amount of probability makes all eight coset densities bounded under one common law. Restrict an irreducible representation of $S_n$ to the product of these eight subgroups. Each tensor constituent has at least one factor of small degree. Even with arbitrary multiplicity, the orbit of a single vector under the corresponding block subgroup spans a space of controlled dimension. Averaging projections onto its translates then bounds each Fourier operator. Sections 5 and 6 supply the degree estimate and this transfer; Section 7 combines eight independent time intervals of $200 d$ shuffles and handles parity to complete the proof.

The companion on random coordinate frames gives an independent $32800 d$ proof [17] Theorem 1.1. The conditional-information companion obtains bounds uniform over specified input lists [15] Theorem 1.1, while the Fourier companion develops general transfers from complementary coset bounds [16] Theorem 1.1. The present proof uses none of these results: its cyclic-coordinate estimate and eight-block transfer are proved here.

== 2 The model and the support obstruction <sec:model>

Let $d gt.eq 1$ be an integer. Identify the positions with $V = bb(F)_2^d$, write $e_1 \, dots.h \, e_d$ for its standard basis, and label each card by its initial position. A permutation maps a label to its current position; composition means $\( g h \) \( x \) = g \( h \( x \) \)$. With

$ R \( x_1 \, dots.h \, x_d \) = \( x_2 \, dots.h \, x_d \, x_1 \) \, $

one physical shuffle is $R S$, where $S$ independently fixes or swaps each pair ${ x \, x + e_1 }$. Thus its action is

$ \( x_1 \, u \) mapsto \( u \, x_1 + xi_u \) \, $

with independent fair bits $xi_u$.

Let $S_1 \, S_2 \, dots.h$ be independent copies of $S$. If $Y_t = R S_t Y_(t - 1)$ is the physical permutation, started from $Y_0 = upright("id")$, and $X_t = R^(- t) Y_t$, then

$ X_(t + 1) = Q_t X_t \, #h(2em) Q_t = R^(- t) S_(t + 1) R^t . $

The $Q_t$ are independent matching switches in the directions $i_t = 1 + \( t med mod med d \)$, since $R^(- t) e_1 = e_(i_t)$. A block whose length is a multiple of $d$ ends in the physical frame. We analyze this cyclic-coordinate process, writing $Pi_t = X_t$.

During one full sweep each coordinate of a given card is refreshed exactly once by a coin fair conditional on the card’s earlier path. These refreshed bits form a uniform binary string. Restoring the deterministic rotation preserves uniformity, proving the one-card assertion in the introduction.

Uniform measure is invariant under every position permutation. Starting from any fixed deck translates the law started at the identity and leaves its total-variation distance from uniform unchanged. Moreover, $t$ shuffles have at most $2^(t n \/ 2)$ possible coin strings. Their support $A$ therefore gives

$ parallel q_d^(* t) - U_n parallel_(upright("TV")) gt.eq q_d^(* t) \( A \) - U_n \( A \) gt.eq 1 - frac(2^(t n \/ 2), n !) . $

Distance at most $1 \/ 4$ forces $2^(t n \/ 2) gt.eq 3 n ! \/ 4$, proving the rounded lower bound. The inequalities $\( n \/ e \)^n lt.eq n ! lt.eq n^n$ give its asymptotic form.

For completeness, mixing exists in each fixed dimension. A full coordinate sweep has positive probability of being the identity, and of making any specified single cube-edge transposition. Edge transpositions on the connected cube generate $S_n$. Every permutation can therefore be obtained in some number of sweeps; identity sweeps pad these representations to one common length. The kernel at that length assigns positive mass to every group element and hence dominates a positive multiple of $U_n$. Iteration proves convergence. This finite-dimensional observation does not assert the numerical bound $1600 d$ for every $d$.

== 3 A conditional flow with one sweep of memory <sec:flow>

Choose an ordered list $\( c_1 \, dots.h \, c_k \)$ of distinct labels independently of the shuffle. We will ultimately average over uniform lists, but first fix the list. For $0 lt.eq ell < k lt.eq n$, expose the trajectories of its first $ell$ cards, and call the next card the tagged card. Let $cal(F)_s$ be the sigma-field generated by the list and the exposed paths through time $s$. Let $B_s$ be the positions not occupied by those $ell$ cards, so $m = \| B_s \| = n - ell$ is constant. Define

$ p_s \( x \) = bb(P) { Pi_s \( c_(ell + 1) \) = x divides cal(F)_s } \, #h(2em) w_s \( x \) = p_s \( x \) - 1 / m upright(bold(1))_(B_s) \( x \) . $

The vector $w_s$ is supported on $B_s$, has total sum zero, and has squared norm at most one. Averaging and transport also underlie Morris’s chameleon representation [10] Section 4, Lemma 3. The next lemma identifies the unexposed coins directly for labeled trajectories.

#thm([Lemma 3.1.])[
  (Path cylinders and conditional flow).  #emph[For every feasible specification of the exposed paths through a time $T$, the visited time–edge coins are fixed and all other coins remain independent and fair. On a matching edge with two free positions the conditional masses are averaged; on an edge with one free position its mass follows the known free route. These rules also transport the uniform mass on $B_s$ to that on $B_(s + 1)$. For $s lt.eq T$, conditioning on the full exposed paths gives the same tagged-card law at time $s$ as conditioning on $cal(F)_s$.]
] <lem:path-cylinder>

#proof[
  To verify the cylinder assertion, fix any feasible specification of the exposed paths through a terminal time $T$. The paths determine the visited time-edge pairs and the coin value at every visited pair. Conversely, prescribing these values forces the specified paths, by induction on time: the next position of an exposed card depends only on the coin of its present edge. If two exposed cards share an edge, feasibility gives the same prescribed coin. The path event is therefore a cylinder in the independent coin array. Conditional on it, unvisited coins remain independent and fair.
  It follows that an edge with two free positions averages their tagged-card masses. An edge with one free position transports its mass to the uniquely free output specified by the exposed card’s next position. These updates also carry the uniform vector on $B_s$ to the uniform vector on $B_(s + 1)$. Future prescribed coins involve later time coordinates of the array; they do not alter the earlier free coins. Consequently the law at time $s$, even if initially defined by conditioning on all exposed paths through $T$, equals this $cal(F)_s$-measurable forward flow. In particular we may use its adaptedness below. Averaging and transport do not increase squared norm. The initial centered point mass has squared norm $1 - 1 \/ m lt.eq 1$, which proves the stated bound on $w_s$. Figure 1 depicts the two updates. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2, 2.6), [#text(size: 9pt)[Two free positions]])
  circle((0, 1.7), radius: 0.3, fill: rgb("#ffffff"), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0.3), radius: 0.3, fill: rgb("#ffffff"), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10))
  content((-0.604, 1.7), [#text(size: 9pt)[$u$]])
  content((-0.604, 0.3), [#text(size: 9pt)[$v$]])
  circle((4, 1.7), radius: 0.3, fill: rgb("#ffffff"), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10))
  circle((4, 0.3), radius: 0.3, fill: rgb("#ffffff"), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10))
  content((5.08, 1.7), [#text(size: 9pt)[$(u+v)"/"2$]])
  content((5.08, 0.3), [#text(size: 9pt)[$(u+v)"/"2$]])
  line((0.3071, 1.7), (3.693, 1.7), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#144567"))))
  line((0.2898, 1.599), (3.71, 0.4014), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#144567"))))
  line((0.2898, 0.4014), (3.71, 1.599), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#144567"))))
  line((0.3071, 0.3), (3.693, 0.3), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#144567"))))
  content((2, -0.35), [#text(size: 9pt)[Unrevealed fair switch]])
  content((8.8, 2.6), [#text(size: 9pt)[One free position]])
  circle((7.3, 1.7), radius: 0.3, fill: rgb("#ffffff"), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10))
  circle((7.3, 0.3), radius: 0.15, fill: rgb("#595959"), stroke: none)
  content((6.696, 1.7), [#text(size: 9pt)[$u$]])
  circle((10.3, 1.7), radius: 0.15, fill: rgb("#595959"), stroke: none)
  circle((10.3, 0.3), radius: 0.3, fill: rgb("#ffffff"), stroke: (paint: rgb("#144567"), thickness: 0.4pt, miter-limit: 10))
  content((10.9, 0.3), [#text(size: 9pt)[$u$]])
  line((7.578, 1.57), (10.02, 0.4298), stroke: (paint: rgb("#144567"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#144567"))))
  line((7.442, 0.3664), (10.16, 1.634), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  content((8.8, -0.35), [#text(size: 9pt)[Switch fixed by the observed path]])
})],
  caption: [Figure 1: The conditional flow on one matching edge. Open circles are free positions; filled circles contain an exposed card. A switch with two free positions averages the centered masses $u \, v$. With one free position, the observed path fixes the switch and transports the centered mass $u$. The latter case produces the martingale noise before the switch is revealed. ],
) <fig:conditional-flow>

Let $A_i$ average a function across every coordinate-$i$ pair, and write $x^(\( i \)) = x + e_i$. Put

$ E_s = bb(E) parallel w_s parallel_2^2 \, #h(2em) L_s = sum_x w_s \( x \)^2 upright(bold(1))_({ x^(\( i_s \)) in.not B_s }) \, #h(2em) b_s = bb(E) L_s . $

Here the expectation includes the initial list when it is random. Before the next exposed positions are revealed, the transport choices on edges with one free position are independent fair coins. Hence

#[#set math.equation(numbering: n => "(3.1)")
 $ w_(s + 1) = A_(i_s) w_s + xi_s \, #h(2em) bb(E) \( xi_s divides cal(F)_s \) = 0 . $ <eq:h-1>]

On a one-free-position edge whose free endpoint is $x$, its noise is

$ plus.minus frac(w_s \( x \), 2) \( delta_x - delta_(x^(\( i_s \))) \) \, $

where $delta_x$ is unit mass at $x$, and the signs are independent on distinct such edges. Other edges contribute no noise.

#thm([Lemma 3.2.])[
  (One-sweep energy identity).  #emph[For every $t gt.eq d$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ E_t = sum_(j = 1)^d 2^(- j) b_(t - j) . $ <eq:h-2>]

]
] <lem:energy-memory>

#proof[
  Expand (3.1) over the last $d$ layers. The product of all $d$ coordinate averages maps a vector to its spatial mean, so it annihilates $w_(t - d)$. Noise terms from distinct times have zero expected cross products: the later term has conditional mean zero and the intervening averages are deterministic. At a fixed time, noises on distinct edges also have zero expected cross products, because their signs are independent conditional on the exposed past. The noise created at time $t - j$ is followed by averaging in $j - 1$ distinct coordinates other than its own. Its two masses spread over disjoint subcubes, each of size $2^(j - 1)$. The resulting squared norm is $2^(- j) w_(t - j) \( x \)^2$. Summing these contributions proves (3.2). ◻
]

== 4 Why the recent noise contracts <sec:contraction>

We bound the recent-noise term $b_s$ in terms of the energy $E_s$, then use the resulting decay to control ordered card marginals.

Fix $s gt.eq d - 1$, put $a = s - d + 1$, and let $H_0 \, H_1$ be the two halves defined by coordinate $i_s$. The updates from $a$ to $s$ use every other coordinate once and do not cross these halves. Conditional on $cal(F)_a$, the initial free sets $B_a ∩ H_h$ and centered flows $w_a \|_(H_h)$ are fixed, and the future switch arrays in the two halves are independent. The pair $\( B_s ∩ H_h \, w_s \|_(H_h) \)$ is determined by this initial state and the switch array inside $H_h$.

Every position at time $a$ in a half is marginally uniform in that half after the intervening $d - 1$ updates: each of its remaining coordinates is refreshed by a conditionally fair coin. Summing this endpoint probability over the free positions at time $a$ gives, for every $y in H_(1 - h)$,

$ bb(P) { y in B_s divides cal(F)_a } = frac(\| B_a ∩ H_(1 - h) \|, n \/ 2) . $

For $x in H_h$, the random variables $w_s \( x \)^2$ and $upright(bold(1))_({ x^(\( i_s \)) in B_s })$ depend on opposite future arrays. Their conditional independence therefore yields

#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E) [sum_(x in H_h) w_s \( x \)^2 upright(bold(1))_({ x^(\( i_s \)) in B_s }) thin mid(bar.v) thin cal(F)_a] = frac(\| B_a ∩ H_(1 - h) \|, n \/ 2) bb(E) [sum_(x in H_h) w_s \( x \)^2 thin mid(bar.v) thin cal(F)_a] . $ <eq:h-3>]

The values of the flow and the free set within one half need not be independent.

Now take a uniform random initial list, independent of the shuffle, and suppose $m gt.eq n \/ 8$. For every fixed realization of the shuffle, the image of the uniformly chosen free set is uniform among the $m$-subsets of $V$. Thus $B_a$ is unconditionally a uniform $m$-subset. Its count in either half has mean $m \/ 2$, and

#[#set math.equation(numbering: n => "(4.2)")
 $ bb(P) { \| B_a ∩ H_h \| < m \/ 4 } lt.eq e^(- m \/ 32) . $ <eq:h-4>]

For completeness we give the bounded-difference exponential-moment argument of Hoeffding and Azuma [6,1] in this setting. Expose the uniform subset in random order and use the Doob martingale for its final half-count. Changing the next draw can be coupled with the remaining completion by exchanging the two possible drawn points; the increment has absolute value at most one. A centered random variable in an interval of length two has exponential moment at most $e^(theta^2 \/ 2)$: for $psi \( theta \) = log bb(E) e^(theta Z)$, the second derivative is a tilted variance at most one, and integration from zero proves the bound. Conditional multiplication over the $m$ martingale increments gives $bb(E) e^(theta \( M_m - M_0 \)) lt.eq e^(m theta^2 \/ 2)$. Markov’s inequality and minimization in $theta$ give the lower-tail bound $e^(- u^2 \/ \( 2 m \))$; use $u = m \/ 4$ to obtain (4.2).

With

$ beta = 1 / 16 \, #h(2em) eta = 2 e^(- n \/ 256) \, $

both half densities in (4.1) are at least $beta$, except on an $cal(F)_a$-measurable event of probability at most $eta$. The exceptional event may be correlated with the energy. Since the energy is at most one, (4.1), summed over the halves, nonetheless gives

#[#set math.equation(numbering: n => "(4.3)")
 $ b_s lt.eq \( 1 - beta \) E_s + eta . $ <eq:h-5>]

This uses an unconditional exceptional probability and does not claim concentration conditional on the exposed paths.

Let $gamma = 31 \/ 32 = 1 - beta \/ 2$. Equations (3.2) and (4.3) imply

#[#set math.equation(numbering: n => "(4.4)")
 $ E_t lt.eq gamma^(t - 2 d) + eta / beta = (31 / 32)^(t - 2 d) + 32 e^(- n \/ 256) . $ <eq:h-6>]

For $t lt.eq 2 d$ the bound follows from $E_t lt.eq 1$. For $t > 2 d$, use induction in (3.2); all indices $t - j$ are at least $d$. The geometric contribution is at most $gamma^(t - 2 d)$, because

$ \( 1 - beta \) sum_(j = 1)^oo \( 2 gamma \)^(- j) = frac(1 - beta, 2 gamma - 1) = 1 . $

The constant contribution is at most $\( 1 - beta \) eta \/ beta + eta = eta \/ beta$. This proves (4.4).

We next turn the energy estimate into a bound on the positions of an ordered list. We use the sequential comparison of Morris [11] Section 5.3, Lemma 12, also given by Morris, Rogaway and Stegers [14] Appendix A, Lemma 2. It applies to any law on distinct-position tuples; $U_(upright("inj"))$ denotes the uniform law on such tuples.

#thm([Lemma 4.1.])[
  (Sequential total variation).  #emph[For a random tuple $\( Z_1 \, dots.h \, Z_k \)$ of distinct positions, 
#[#set math.equation(numbering: n => "(4.5)")
 $ parallel cal(L) \( Z_1 \, dots.h \, Z_k \) - U_(upright("inj")) parallel_(upright("TV")) lt.eq sum_(j = 1)^k bb(E) ∥cal(L) \( Z_j divides Z_1 \, dots.h \, Z_(j - 1) \) - U_(V \\ { Z_1 \, dots.h \, Z_(j - 1) })∥_(upright("TV")) . $ <eq:h-7>]

 Every expectation is under the actual prefix law. Refining the conditioning in a summand can only increase its expected distance, provided the refining sigma-field contains the prefix.]
] <lem:sequential-tv>

#proof[
  At the $j$th step compare the actual joint $j$-tuple with the law that samples its first $j - 1$ coordinates from their actual distribution and appends a uniform available position. Their distance is exactly the $j$th summand. Applying this same uniform extension kernel to a uniform prefix gives a uniform $j$-tuple and cannot increase total variation. The triangle inequality and induction prove (4.5). The uniform comparison law is prefix-measurable, so the tower property and convexity of total variation prove the refinement assertion. ◻
]

#thm([Proposition 4.2.])[
  (Averaged ordered marginals).  #emph[Let $n = 2^d$, $T = 200 d$, and $1 lt.eq k lt.eq 7 n \/ 8$. Choose an ordered list $C = \( c_1 \, dots.h \, c_k \)$ uniformly among all lists of distinct labels, independently of the shuffle. Then 
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E)_C ∥cal(L) #scale(x: 120%, y: 120%)[\(] \( Pi_T \( c_1 \) \, dots.h \, Pi_T \( c_k \) \) divides C #scale(x: 120%, y: 120%)[\)] - U_(upright("inj"))∥_(upright("TV")) & lt.eq epsilon_n \,\
epsilon_n := n^(3 \/ 2) / 2 sqrt(\( 31 \/ 32 \)^(198 d) + 32 e^(- n \/ 256)) & = O \( n^(- 5 \/ 2) \) . $ <eq:h-8>]

]
] <prop:averaged-marginal>

#proof[
  First fix $C$ and apply Lemma 4 to $Z_j = Pi_T \( c_j \)$. In its $j$th summand, condition further on the paths through time $T$ of the first $j - 1$ cards. These paths determine the prefix of endpoints, so the lemma’s refinement assertion applies.
  Let $w_T^(\( j \))$ be the resulting centered flow, with $ell = j - 1$ and $m_j = n - j + 1$. Its conditional distance is $1 / 2 parallel w_T^(\( j \)) parallel_1$. Averaging over both the list and the shuffle, Cauchy–Schwarz gives
  $ 1 / 2 bb(E)_(C \, upright("shuffle")) parallel w_T^(\( j \)) parallel_1 lt.eq 1 / 2 sqrt(m_j thin bb(E)_(C \, upright("shuffle")) parallel w_T^(\( j \)) parallel_2^2) . $
  Each stage leaves at least $n \/ 8$ free positions, so (4.4) applies to the expectation under this joint law, for every $j lt.eq k$. Since $m_j lt.eq n$ and $k lt.eq n$, summing the last display proves the bound in (4.6). Finally, $198 log_2 \( 32 \/ 31 \) > 8$ gives $\( 31 \/ 32 \)^(198 d) lt.eq n^(- 8)$, which proves the stated asymptotic estimate. ◻
]

The bound averages over the input list. We will use that average to choose a single partition into eight blocks for which all eight complementary marginals have small total error.

The remaining question concerns the full permutation, including dependencies involving the omitted cards. We now pass to representations of $S_n$. Restricting a representation to the subgroups that permute labels within the eight blocks separates it into tensor factors. At least one factor is small enough that the span generated by a single vector remains controlled, even when that factor occurs with multiplicity. This converts the marginal estimates into bounds on the Fourier matrices of a slightly trimmed law. First we prove the dimension estimate needed to sum those bounds; then we carry out the trimming and orbit-span argument.

== 5 The representation degrees needed for the lift <sec:degrees>

The transfer needs two properties of symmetric-group representation degrees. A uniform bound on their reciprocal sum will control orbit dimensions for the label-block subgroups in Proposition 7. Decay of the sum away from the trivial and sign representations will control the full-group Fourier error in Section 7. We prove both properties here.

Let $lambda tack.r s$ be a partition of $s$, represented by its Young diagram, whose row lengths are the parts of $lambda$. Write $f^lambda$ for the degree of the corresponding irreducible representation of $S_s$. A standard Young tableau fills the diagram with $1 \, dots.h \, s$, increasing along each row and column. We use the classical facts that $f^lambda$ counts these tableaux, is unchanged by transposing the diagram, and satisfies the hook-length formula

$ f^lambda = frac(s !, product_(z in lambda) h \( z \)) \, $

where $h \( z \)$ counts the box $z$ together with the boxes to its right and below it. The row $\( s \)$ and column $\( 1^s \)$ give the trivial and sign representations, respectively [18,4].

#thm([Lemma 5.1.])[
  (Reciprocal representation degrees).  #emph[The reciprocal-degree sums satisfy 
#[#set math.equation(numbering: n => "(5.1)")
 $ C_1 := sup_(s gt.eq 1) sum_(lambda tack.r s) \( f^lambda \)^(- 1) < oo \, #h(2em) sum_(lambda tack.r s\
lambda in.not { \( s \) \, \( 1^s \) }) \( f^lambda \)^(- 1) arrow.r 0 quad \( s arrow.r oo \) . $ <eq:h-9>]

]
] <lem:reciprocal-degrees>

Stronger asymptotics for every fixed positive inverse-degree exponent were proved by Liebeck and Shalev [8] Theorem 2.6. The elementary proof below gives all the summability used here.

#proof[
  First, let $p \( u \)$ be the number of partitions of $u$. The identity
  $ sum_(v gt.eq 0) p \( v \) x^v = product_(j gt.eq 1) \( 1 - x^j \)^(- 1) $
  gives $p \( u \) lt.eq e^(3 sqrt(u))$ for $u gt.eq 1$: evaluate at $x = e^(- 1 \/ sqrt(u))$, when the logarithm of the product is
  $ sum_(r gt.eq 1) frac(1, r \( e^(r \/ sqrt(u)) - 1 \)) lt.eq sqrt(u) sum_(r gt.eq 1) r^(- 2) lt.eq 2 sqrt(u) \, $
  and multiplying by $x^(- u)$ bounds its $u$th coefficient as claimed.
  For a diagram of size $s$, let $L$ be the larger of its first row and column lengths. Transpose so its first row has length $L$, and put $u = s - L$. If $1 lt.eq u lt.eq s \/ 4$, then
  $ f^lambda gt.eq binom(L, u) gt.eq \( L \/ u \)^u gt.eq 3^u . $
  For the first inequality place labels $1 \, dots.h \, u$ in the first $u$ top-row boxes; choose any $u$ labels from the remaining $L$ labels for the lower diagram, filling it in row-major order; and fill the remaining top row increasingly. Every lower column lies under one of the first $u$ top boxes, so all column and row inequalities hold. There are at most $2 p \( u \)$ shapes with this tail size, including transposes. Their reciprocal contributions are bounded by the summable sequence $2 p \( u \) 3^(- u)$; for each fixed positive $u$, the binomial lower bound tends to infinity with $s$. Dominated convergence makes the whole contribution tend to zero.
  If $u > s \/ 4$ and $L gt.eq s \/ 8$, retain the top row and the first $b = floor.l s \/ 16 floor.r$ boxes below it, read row by row from top to bottom and left to right. The retained boxes form a Young diagram. Every standard tableau of the retained diagram extends to the full diagram by filling the remaining boxes in the same row order with the larger labels. In the retained diagram, fix $1 \, dots.h \, b$ in the first $b$ top-row boxes and choose the $b$ lower labels from the remaining $L$ labels, as above. Since $L gt.eq 2 b$, this gives
  $ f^lambda gt.eq binom(L, b) gt.eq 2^b $
  for all sufficiently large $s$. There are at most $e^(3 sqrt(s))$ diagrams, so their reciprocal contribution tends to zero. If $L < s \/ 8$, every hook has length less than $s \/ 4$; the hook formula and $s ! gt.eq \( s \/ e \)^s$ give $f^lambda gt.eq \( 4 \/ e \)^s$, again dominating the partition count. These cases cover all shapes except the row and column. Their degrees are one, so the full sums tend to two. The finitely many initial sums are finite, which also proves the uniform bound in (5.1). At $s = 1$, the row and column coincide and are counted once. ◻
]

== 6 From eight large marginals to the whole group <sec:lift>

Assume $d gt.eq 3$, put $G = S_n$, and let $mu = q_d^(* \( 200 d \))$. Choose a uniform ordered partition $\( M_1 \, dots.h \, M_8 \)$ of the labels into blocks of size $n \/ 8$. Each complement is a uniform subset of size $7 n \/ 8$. Giving it an independent uniform order yields exactly the list in (4.6), and changing that order does not change the total-variation distance. Therefore some deterministic partition has

#[#set math.equation(numbering: n => "(6.1)")
 $ delta_n := sum_(a = 1)^8 parallel cal(L) \( mu upright(" on ") V \\ M_a \) - U_(upright("inj")) parallel_(upright("TV")) lt.eq 8 epsilon_n = o \( 1 \) . $ <eq:h-10>]

Fix that partition. Let $H_a$ be the subgroup of all permutations that fix every label outside $M_a$. Two maps $g \, g'$ agree on the complement exactly when $g' = g h$ for some $h in H_a$. Thus the complementary image tuple identifies the left coset $g H_a$, and its uniform law is the coset pushforward of uniform measure on $G$.

For each $a$, remove every coset $C in G \/ H_a$ with $mu \( C \) > 2 \| H_a \| \/ \| G \|$, and let $E$ be what remains after all eight removals. A bad coset satisfies $mu \( C \) lt.eq 2 \( mu \( C \) - \| H_a \| \/ \| G \| \)$. The sum of positive excesses is its marginal total-variation distance, so the union bound gives

$ M := mu \( E \) gt.eq 1 - 2 delta_n . $

For all sufficiently large $n$, we have $M gt.eq 1 \/ 2$ and may define the conditional probability law $nu = mu \( dot.op divides E \)$. Then

#[#set math.equation(numbering: n => "(6.2)")
 $ parallel nu - mu parallel_(upright("TV")) = 1 - M = o \( 1 \) \, #h(2em) nu \( g H_a \) lt.eq 2 / M frac(\| H_a \|, \| G \|) lt.eq 4 frac(\| H_a \|, \| G \|) . $ <eq:h-11>]

A coset removed for that subgroup has no retained mass; every other coset had the required original cap. This proves the same cap for all eight systems under one common law. Consequently, for every nonnegative function that is constant on the cosets of any one $H_a$, its expectation under $nu$ is at most four times its uniform expectation. The next proposition applies this comparison to projections onto orbit spans.

We use finite-dimensional complex Hilbert spaces. The operator norm is $parallel B parallel_(upright("op"))$, and the Hilbert–Schmidt norm is $parallel B parallel_(upright("HS"))^2 = "tr" \( B^(*) B \)$ with ordinary, unnormalized trace. Write $hat(H)_a$ for the set of equivalence classes of irreducible representations of $H_a$. For a probability measure $nu$ on $G$ and a unitary representation $rho$, define $hat(nu) \( rho \) = sum_g nu \( g \) rho \( g \)$.

#thm([Proposition 6.1.])[
  (Eight-block Fourier bound).  #emph[Let $n$ be a positive multiple of eight, and partition the labels of $G = S_n$ into sets $M_1 \, dots.h \, M_8$ of size $n \/ 8$. For each $a$, let $H_a$ be the subgroup fixing every label outside $M_a$. Suppose a probability measure $nu$ on $G$ satisfies 
$ nu \( g H_a \) lt.eq 4 frac(\| H_a \|, \| G \|) #h(2em) \( g in G \, med 1 lt.eq a lt.eq 8 \) . $

 Then every irreducible unitary representation $rho$ of $G$, of degree $D$, satisfies 
#[#set math.equation(numbering: n => "(6.3)")
 $ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq A D^(- 5 \/ 16) \, #h(2em) A = sqrt(32 C_1) . $ <eq:h-12>]

]
] <prop:orbit-lift>

#proof[
  The disjoint block subgroups form $H = H_1 times dots.h.c times H_8$. The restriction of $rho$ to $H$ decomposes orthogonally into spaces
  $ \( V_(pi_1) ⊗ dots.h.c ⊗ V_(pi_8) \) ⊗ cal(A)_(bold(pi)) \, $
  where the last space records arbitrary multiplicity and $H$ acts trivially on it. Every occurring tensor type has product of factor degrees at most $D$; assign its whole isotypic space to one factor whose degree is at most $D^(1 \/ 8)$. This gives an orthogonal decomposition $V_rho = E_1 xor dots.h.c xor E_8$. Each $E_a$ is $H$-invariant, and all the $H_a$-irreducible types occurring in it have degree at most $D^(1 \/ 8)$.
  Fix $u_a in E_a$, and let $W_a = "span" { rho \( h \) u_a : h in H_a }$. Let $u_(a \, pi)$ be the projection of $u_a$ onto the full $H_a$-isotypic component $V_pi ⊗ cal(A)_pi$, with $b = dim pi$. Its orbit lies in the image of
  $ "End" \( V_pi \) arrow.r V_pi ⊗ cal(A)_pi \, quad Q mapsto \( Q ⊗ I \) u_(a \, pi) . $
  Its dimension is at most $b^2$, independently of multiplicity. Grouping all equivalent copies first, and counting each irreducible type once, (5.1) gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ dim W_a lt.eq sum_(pi in hat(H)_a\
dim pi lt.eq D^(1 \/ 8)) \( dim pi \)^2 lt.eq D^(3 \/ 8) sum_(pi in hat(H)_a) \( dim pi \)^(- 1) lt.eq C_1 D^(3 \/ 8) . $ <eq:h-13>]
  The uniformity of $C_1$ applies to every block size.
  The space $W_a$ is $H_a$-invariant, so $rho \( g \) W_a$ depends only on $g H_a$. If $P_W$ denotes orthogonal projection, Schur’s lemma and the trace give
  $ bb(E)_(g tilde.op U_G) P_(rho \( g \) W_a) = frac(dim W_a, D) I . $
  Indeed this average commutes with $rho \( G \)$, and its trace is $dim W_a$. Applying the assumed coset cap to the nonnegative coset-constant function $parallel P_(rho \( g \) W_a) z parallel^2$, we obtain
  $ \| chevron.l z \, hat(nu) \( rho \) u_a chevron.r \|^2 & lt.eq bb(E)_(g tilde.op nu) \| chevron.l z \, rho \( g \) u_a chevron.r \|^2\
 & lt.eq parallel u_a parallel^2 bb(E)_(g tilde.op nu) parallel P_(rho \( g \) W_a) z parallel^2\
 & lt.eq 4 frac(dim W_a, D) parallel u_a parallel^2 parallel z parallel^2 lt.eq 4 C_1 D^(- 5 \/ 8) parallel u_a parallel^2 parallel z parallel^2 . $
  For $u = sum_a u_a$, sum these bounds after taking square roots, and use $sum_a parallel u_a parallel lt.eq sqrt(8) parallel u parallel$. This proves (6.3). ◻
]

== 7 Eight convolution factors and the final comparison <sec:completion>

The final comparison uses the finite-group Fourier method of Diaconis and Shahshahani [3] Section 3. The shuffle law is not constant on conjugacy classes, so we retain matrix norms throughout. By (6.2) and Proposition 7, the nearby law $nu$ has the required Fourier operator bound. We first show that $nu^(* 8)$ is close to uniform, then compare it with the law of eight independent intervals of $200 d$ shuffles, $mu^(* 8) = q_d^(* \( 1600 d \))$.

#proof[
  #emph[Completion of the proof of Theorem 1.] With our Fourier normalization, every probability measure $sigma$ on $G$ obeys
  #[#set math.equation(numbering: n => "(7.1)")
   $ 4 parallel sigma - U_G parallel_(upright("TV"))^2 lt.eq sum_(rho eq.not upright(bold(1))) D_rho parallel hat(sigma) \( rho \) parallel_(upright("HS"))^2 . $ <eq:h-14>]
  For clarity, Cauchy–Schwarz bounds the left side by $\| G \| sum_g \| sigma \( g \) - \| G \|^(- 1) \|^2$. The regular-character orthogonality identity gives, for every real mass function $a$,
  $ sum_rho D_rho ∥sum_g a \( g \) rho \( g \)∥_(upright("HS"))^2 = sum_(g \, h) a \( g \) a \( h \) sum_rho D_rho "tr" \( rho \( h \)^(*) rho \( g \) \) = \| G \| sum_g a \( g \)^2 . $
  Apply this to $a = sigma - U_G$; its trivial coefficient is zero and uniform measure has zero transform in every nontrivial irreducible. This proves (7.1), with the ordinary, unnormalized Hilbert–Schmidt norm fixed in Section 6.
  Convolution multiplies Fourier matrices. The operator norm is submultiplicative and $parallel B parallel_(upright("HS")) lt.eq sqrt(D) parallel B parallel_(upright("op"))$, without any normality assumption. Therefore the nonsign, nontrivial contribution for $sigma = nu^(* 8)$ is at most
  $ sum_(rho eq.not upright(bold(1)) \, upright("sgn")) D_rho parallel hat(nu) \( rho \)^8 parallel_(upright("HS"))^2 & lt.eq A^16 sum_(rho eq.not upright(bold(1)) \, upright("sgn")) D_rho^(2 - 16 \( 5 \/ 16 \))\
 & = A^16 sum_(rho eq.not upright(bold(1)) \, upright("sgn")) D_rho^(- 3) arrow.r 0 \, $
  by (5.1), since $D^(- 3) lt.eq D^(- 1)$.
  The sign representation has degree one and requires a separate argument. In the final physical shuffle of a positive-time block, condition on every coin but one. Flipping that last coin changes the resulting permutation by a transposition, so the original block law $mu$ has zero expected sign. Since $nu = mu upright(bold(1))_E \/ M$,
  $ \| hat(nu) \( upright("sgn") \) \| = 1 / M lr(|sum_(g in.not E) mu \( g \) upright("sgn") \( g \)|) lt.eq frac(1 - M, M) arrow.r 0 . $
  Its contribution in (7.1) after eight factors also tends to zero. Thus $parallel nu^(* 8) - U_G parallel_(upright("TV")) arrow.r 0$.
  Finally, replacing independent convolution factors one at a time costs at most their individual total-variation distances. By (6.2),
  $ parallel mu^(* 8) - U_G parallel_(upright("TV")) lt.eq 8 \( 1 - M \) + parallel nu^(* 8) - U_G parallel_(upright("TV")) arrow.r 0 . $
  Each convolution factor represents $200 d$ physical shuffles, so $mu^(* 8) = q_d^(* \( 1600 d \))$. Translation invariance gives the same bound from every deterministic initial deck. Together with the support inequality and fixed-dimensional convergence already proved, this completes the theorem. ◻
]

#heading(level: 1)[References]
#bibitem([1])[K. Azuma, #emph[Weighted sums of certain dependent random variables], Tôhoku Mathematical Journal (2) 19 (1967), no.~3, 357--367, #link("https://doi.org/10.2748/tmj/1178243286")[doi:10.2748/tmj/1178243286].]
#bibitem([2])[A.~Czumaj and B.~Vöcking, #emph[Thorp shuffling, butterflies, and non-Markovian couplings], Automata, Languages, and Programming, Lecture Notes in Computer Science 8572, Springer, 2014, 344--355. #link("https://doi.org/10.1007/978-3-662-43948-7_29")[doi:`10.1007/978-3-662-43948-7_29`].]
#bibitem([3])[P.~Diaconis and M.~Shahshahani, #emph[Generating a random permutation with random transpositions], Zeitschrift für Wahrscheinlichkeitstheorie und verwandte Gebiete 57 (1981), 159--179. #link("https://doi.org/10.1007/BF00535487")[doi:10.1007/BF00535487].]
#bibitem([4])[P.~Etingof, O.~Golberg, S.~Hensel, T.~Liu, A.~Schwendner, D.~Vaintrob, and E.~Yudovina, #emph[Introduction to Representation Theory], Student Mathematical Library, vol.~59, American Mathematical Society, 2011. Author's lecture-note version, January 10, 2011: #link("https://math.mit.edu/~etingof/replect.pdf").]
#bibitem([5])[V. T. Hoang, B. Morris, and P. Rogaway, #emph[An enciphering scheme based on a card shuffle], Advances in Cryptology---CRYPTO 2012, Lecture Notes in Computer Science 7417, Springer, 2012, 1--13. The cited Section 3, Theorem 3, and Lemma 4 refer to #link("https://arxiv.org/abs/1208.1176v2")[arXiv:1208.1176v2], 21 November 2014.]
#bibitem([6])[W. Hoeffding, #emph[Probability inequalities for sums of bounded random variables], Journal of the American Statistical Association 58 (1963), no.~301, 13--30, #link("https://doi.org/10.1080/01621459.1963.10500830")[doi:`10.1080/01621459.1963.10500830`].]
#bibitem([7])[J.~Jonasson, #emph[The Mathematics of Card Shuffling], course notes, April 2009, Section~5. #link("https://www.math.chalmers.se/~jonasson/convrates.pdf").]
#bibitem([8])[M.~W.~Liebeck and A.~Shalev, #emph[Fuchsian groups, coverings of Riemann surfaces, subgroup growth, random quotients and random walks], Journal of Algebra 276 (2004), no.~2, 552--601. #link("https://doi.org/10.1016/S0021-8693(03)00515-5")[doi:`10.1016/S0021-8693(03)00515-5`]. Author version: #link("https://wwwf.imperial.ac.uk/~mwl/fuchs.pdf").]
#bibitem([9])[R. Montenegro and P. Tetali, #emph[Mathematical aspects of mixing times in Markov chains], Foundations and Trends in Theoretical Computer Science 1 (2006), no.~3, 237--354, #link("https://doi.org/10.1561/0400000003")[doi:10.1561/0400000003].]
#bibitem([10])[B.~Morris, The mixing time of the Thorp shuffle, #emph[SIAM Journal on Computing] #strong[38] (2008), no.~2, 484--504. #link("https://doi.org/10.1137/050636231")[doi:10.1137/050636231]. Preprint: #link("https://arxiv.org/abs/math/0507307v1"), 15 July 2005. The cited Section~4, Lemma~3 refers to this preprint version.]
#bibitem([11])[B.~Morris, The mixing time for simple exclusion, #emph[Annals of Applied Probability] #strong[16] (2006), no.~2, 615--635. #link("https://doi.org/10.1214/105051605000000728")[doi:10.1214/105051605000000728]. Electronic reprint: #link("https://arxiv.org/abs/math/0405157v2"), 12 July 2006.]
#bibitem([12])[B.~Morris, Improved mixing time bounds for the Thorp shuffle and $L$-reversal chain, #emph[Annals of Probability] #strong[37] (2009), no.~2, 453--477. #link("https://doi.org/10.1214/08-AOP409")[doi:10.1214/08-AOP409]. Preprint: #link("https://arxiv.org/abs/0802.0339").]
#bibitem([13])[B.~Morris, Improved mixing time bounds for the Thorp shuffle, #emph[Combinatorics, Probability and Computing] #strong[22] (2013), no.~1, 118--132. #link("https://doi.org/10.1017/S0963548312000478")[doi:10.1017/S0963548312000478]. Preprint: #link("https://arxiv.org/abs/0912.2759").]
#bibitem([14])[B. Morris, P. Rogaway, and T. Stegers, #emph[How to encipher messages on a small domain: deterministic encryption and the Thorp shuffle], Advances in Cryptology---CRYPTO 2009, Lecture Notes in Computer Science 5677, Springer, 2009, 286--302, #link("https://doi.org/10.1007/978-3-642-03356-8_17")[doi:10.1007/978-3-642-03356-8\_17]. Theorem 1 and Appendix A, Lemma 2, are cited from the #link("https://www.cs.ucdavis.edu/~rogaway/papers/thorp.pdf")[author's conference text]. A later journal version is #emph[Deterministic encryption with the Thorp shuffle], Journal of Cryptology 31 (2018), no.~2, 521--536, #link("https://doi.org/10.1007/s00145-017-9262-z")[doi:10.1007/s00145-017-9262-z].]
#bibitem([15])[OpenAI, #emph[Conditional information under deterministic coordinate sweeps], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026/main.pdf")[OAI:Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026], 2026.]
#bibitem([16])[OpenAI, #emph[From partial permutation information to Fourier bounds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/From-partial-permutation-information-to-Fourier-bounds-September-26-2026/main.pdf")[OAI:From-partial-permutation-information-to-Fourier-bounds-September-26-2026], 2026.]
#bibitem([17])[OpenAI, #emph[Random coordinate frames and partial permutation laws], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Random-coordinate-frames-and-partial-permutation-laws-September-26-2026/main.pdf")[OAI:Random-coordinate-frames-and-partial-permutation-laws-September-26-2026], 2026.]
#bibitem([18])[B.~E.~Sagan, #emph[The Symmetric Group: Representations, Combinatorial Algorithms, and Symmetric Functions], second edition, Graduate Texts in Mathematics, vol.~203, Springer, 2001. #link("https://doi.org/10.1007/978-1-4757-6804-6")[doi:10.1007/978-1-4757-6804-6].]
#bibitem([19])[E.~O.~Thorp, Nonrandom shuffling with applications to the game of Faro, #emph[Journal of the American Statistical Association] #strong[68] (1973), no.~344, 842--847. #link("https://doi.org/10.1080/01621459.1973.10481434")[doi:10.1080/01621459.1973.10481434].]


