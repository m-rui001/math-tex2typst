#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Conditional information under deterministic coordinate sweeps]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

What remains random in a shuffle after the paths of many cards have been observed? For the Thorp shuffle, the answer is especially concrete. On a pair containing two unobserved positions, the conditional masses of an additional card are averaged. On a pair containing one observed position, the remaining mass is transported to the uniquely available output. Observing more paths therefore changes an averaging process into a random mixture of averaging and transport. This paper estimates the information retained by that conditional process.

The positions are the vertices of $V = bb(F)_2^d$, with $n = 2^d$. One physical Thorp shuffle independently switches each pair in one coordinate direction and rotates the coordinates. Undoing these rotations gives a process $\( Pi_t \)$ that uses the coordinate directions in a fixed cyclic order. A sweep consists of $d$ such layers, hence $d$ physical shuffles. We label cards by their initial positions; $Pi_t \( a \)$ is the position of card $a$ at time $t$. All starting decks considered below are deterministic. Total variation has the normalization $parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_x \| mu \( x \) - nu \( x \) \|$. Write $q_d$ for the law of one physical shuffle on $S_n$ and $U_(S_n)$ for the uniform law. The threshold-$1 \/ 4$ mixing time is

$ t_(upright("mix")) \( d \) = min { t in bb(Z)_(gt.eq 0) : parallel q_d^(* t) - U_(S_n) parallel_(upright("TV")) lt.eq 1 \/ 4 } . $

Convolution represents independent successive shuffles. Relabeling the deterministic starting deck leaves its distance from uniform unchanged.

Thorp introduced the shuffle in a study of nonuniform human shuffling and its consequences for Faro [18,9]. Its simple description conceals a difficult full-deck mixing problem: the transitions are nonreversible, and uniformity of individual card positions does not control their joint order. Morris’s first polynomial bound for $n = 2^d$, circulated in 2005 and published in 2008, gave $O \( d^44 \)$ physical shuffles [9]. His proof combined evolving sets with a chameleon process for a forward–backward version of the shuffle. Montenegro and Tetali retained Morris’s contraction estimate and sharpened the mixing analysis using spectral profiles and evolving sets, obtaining $O \( d^29 \)$ in 2006 [8] Theorems 6.14–6.15.

Morris subsequently developed an entropy method that reduces mixing estimates to local interactions between pairs of cards. It yielded $O \( \( log n \)^4 \)$ physical shuffles for every even $n$ [11], followed by $O \( d^3 \)$ for $n = 2^d$ [12]. These arguments decompose the entropy of a permutation into conditional one-card contributions and analyze the reverse shuffle. They make explicit why information remaining after other cards are exposed is central to the full-deck problem.

Ordered Thorp marginals also arise in the small-domain enciphering analysis of Morris, Rogaway and Stegers [13] Theorem 1. For each fixed $0 < epsilon < 1$, their estimate gives $O_epsilon \( d \)$ physical shuffles for specified lists of at most $n^(1 - epsilon)$ cards. Czumaj and Vöcking [2] reached lists containing any fixed fraction less than one of the deck: a non-Markovian coupling on butterfly networks gives $O \( \( log n \)^2 \)$ physical shuffles. Their full-permutation algorithm adds empty cards and removes them afterwards; its chain therefore differs from the unchanged labeled deck considered here.

A closely related conditional-energy strategy appears in the swap-or-not analysis of Hoang, Morris and Rogaway [5] Section 3, Theorem 3 and Lemma 4. They control a centered squared error for the next card and sum the resulting conditional errors along an ordered list. Their matching is selected by a fresh uniform group key at each round, and their contraction is averaged over those keys. Here the coordinate directions are prescribed cyclically, while the switch coins remain random. We condition explicitly on preceding cards’ complete paths. The resulting transport-and-average flow admits an exact one-sweep memory identity, and independent coordinate blocks control its remaining noise. Thus the common sequential comparison is retained, while the contraction comes from the geometry of the deterministic schedule.

===== 1.1 Conditional information and the first mixing result. <conditional-information-and-the-first-mixing-result.>

For a fixed set $B$ of observed labels, let $cal(H)_t$ record its paths through time $t$, and let $V_t = V \\ Pi_t \( B \)$ be the available positions. For a further label $a in.not B$, the basic object is

$ f_t \( x \) = Pr { Pi_t \( a \) = x divides cal(H)_t } - frac(upright(bold(1))_(V_t) \( x \), \| V_t \|) . $

It is a sum-zero vector supported on $V_t$. Its energy $bb(E) parallel f_t parallel_2^2$ controls the expected error in the conditional law of $a$. Revealing additional cards successively converts this scalar estimate into information about an ordered list. An average over random lists need not bound every specified list, and an unconditional marginal estimate need not survive conditioning on another family of paths.

Our first result gives uniform bounds for specified lists and then recovers the full permutation. Here $"inj" \( \[ k \] \, V \)$ denotes ordered $k$-tuples of distinct positions.

#thm([Theorem 1.1.])[
  (Fixed lists and a full-deck consequence).  #emph[Uniformly over deterministic starting decks and specified ordered lists of distinct labels, the following hold as $d arrow.r oo$:]
  + #emph[At time $256 d$, the images of any $k lt.eq 7 n \/ 8$ labels have total-variation distance $o \( 1 \)$ from $"Unif" \( "inj" \( \[ k \] \, V \) \)$.]
  + #emph[At time $1024 d$, the images of any $k lt.eq 15 n \/ 16$ labels have total-variation distance at most $n^(- 3 \/ 2)$, for all sufficiently large $d$.]
  + #emph[The full permutation law satisfies $parallel q_d^(* \( 2048 d \)) - U_(S_n) parallel_(upright("TV")) arrow.r 0$.]
] <thm:first-main>

The full-deck conclusion has the optimal order in $d$: the support of $t$ shuffles has size at most $2^(t n \/ 2)$, which gives $t_(upright("mix")) \( d \) gt.eq 2 d - O \( 1 \)$, whereas the theorem gives $t_(upright("mix")) \( d \) lt.eq 2048 d$ for all sufficiently large $d$. Section 2 gives the exact lower bound.

Section 3 proves the two fixed-list estimates locally. For the full-deck conclusion it uses the trimming, isotypic and reciprocal-degree statements from #emph[From partial permutation information to Fourier bounds] [14], with their hypotheses stated at the application. These inputs complete the first route through the paper. The companion #emph[Optimal-order mixing of the Thorp shuffle] [15] gives a separate local $1600 d$ proof. The $1600 d$ application in Section 6.3 instead uses the Fourier companion’s random-partition transfer.

The first extension keeps paths that have already been observed as part of the information in the conclusion. Fix $0 < p < 1$, a set $B$ of base labels, and a disjoint ordered list $\( a_1 \, dots.h \, a_k \)$, with $\| B \| + k - 1 lt.eq p n$. Section 4 proves that a fixed number $2 b \( p \)$ of sweeps gives, with $T = 2 b \( p \) d$, for all sufficiently large $d$ depending only on $p$,

$ bb(E) ∥cal(L) #scale(x: 120%, y: 120%)[\(] \( Pi_T \( a_j \) \)_(j = 1)^k divides cal(H)_T #scale(x: 120%, y: 120%)[\)] - "Unif" #scale(x: 120%, y: 120%)[\(] "inj" \( \[ k \] \, V_T \) #scale(x: 120%, y: 120%)[\)]∥_(upright("TV")) lt.eq k n^(- 4) . $

Here $cal(H)_T$ and $V_T$ refer only to the base labels $B$. The error is averaged over their actual paths; it is not asserted for every possible history. The estimate holds in either coordinate order and survives coarsening that retains $V_T$. Its scalar input allows every deterministic sum-zero vector on the available set, so the contraction can be restarted at a later observation time.

===== 1.2 Why a deterministic sweep contracts. <why-a-deterministic-sweep-contracts.>

Let $i_t$ be the coordinate used at time $t$, and let $P_i$ average all coordinate-$i$ pairs. The conditional vector obeys $f_(t + 1) = P_(i_t) f_t + xi_t$, where $xi_t$ is centered given the past. The product of a full cycle of $P_i$ annihilates every sum-zero vector. Thus the present energy consists entirely of noise generated during the preceding sweep. Each noise contribution has an exact geometric weight. To bound its size, condition just after the previous use of the current coordinate. The observed-card densities in its two halves are nearly balanced, and the intervening switch arrays in those halves are independent. A squared mass in one half can therefore be separated from the event that its opposite partner is occupied. This controls the new noise without replacing the prescribed directions by independent random directions.

There are two ways to develop this signed flow further. Sections 5 and 6 compare balance for fixed and randomly sampled lists, identify the noise weights in Walsh coordinates, and construct pointwise endpoint bounds on events known before the next card is exposed. Sections 7–9 retain block sums, variances and pair differences. A first sweep spreads the available positions and signed mass among coordinate blocks; independent evolution inside those blocks makes the next sweep contract. Section 10 uses an additional symmetry of the completed-sweep law to contract after every subsequent sweep, rather than restarting a two-sweep argument from each realized configuration.

===== 1.3 Entropy, simultaneous constraints, and sparse paths. <entropy-simultaneous-constraints-and-sparse-paths.>

The first scalar estimate already gives arbitrarily small inverse-power relative entropy for every specified list omitting a fixed fraction of the labels; see (3.7). The later entropy arguments retain different structure rather than strengthen that conclusion. Section 10 keeps the contribution of each level in a coordinate-block hierarchy. Section 11 compares block sums with the preceding cycle’s row variances. Section 12 instead keeps all remaining conditional card laws in one vector array, whose energy bounds the entropy contribution of a uniformly sampled next label. Its Fourier application permits the well-controlled omitted domains to depend on the sampled permutation.

Partition one half of the labels into color classes. A corresponding constraint specifies every label’s image in the other half and the image set of each color class. Section 13 constructs one retained law whose bounds hold for every such choice of color classes. This simultaneous statement cannot be obtained by applying a small mean error under each rare color constraint. Section 14 instead retains the position sets of three groups and their internal permutations; its transfer needs forward and reverse information and a separate parity cancellation.

Sections 15 and 16 show why even a relative-entropy bound polynomial in $d$ can be useful. It controls the representations of large degree after a small amount of mass is discarded. A separate calculation with the unique paths through one true sweep controls the remaining representations: an alternating sum cancels whenever one prescribed path uses switches disjoint from all the others. The two sections obtain the entropy input from different collision processes and give different Fourier norm estimates. Section 17 returns to a fixed set of $h gt.eq n \/ 8$ hidden labels. After five sweeps, two walkers independent conditional on the observed paths, from any pair of available starting positions, occupy the same final position with probability at least $\( 1 - n^(- 1 \/ 100) \) \/ h$, averaged over those paths. Following possible partner positions backward proves this entrywise bound for the averaged collision matrix. It implies a signed-energy contraction, but that contraction alone already follows from the first half-density estimate.

These later methods supply distinct conditional statements and proofs, rather than a sequence of improved mixing constants. Their full-deck applications state the particular Fourier inputs from [14] at the point of use. The delayed-symmetry input in Section 14 comes from #emph[Random coordinate frames and partial permutation laws] [16]. The proof of Theorem 1 requires none of these later sections.

== 2 The coordinate process and conditional revelation <sec:prelim>

Write $G = "Sym" \( V \) tilde.equiv S_n$. Permutations map labels to positions, and $\( g h \) \( x \) = g \( h \( x \) \)$. For independent group-valued variables $g tilde.op mu$, $h tilde.op nu$, their product has law $mu * nu$. Let $R \( x_1 \, dots.h \, x_d \) = \( x_2 \, dots.h \, x_d \, x_1 \)$. One physical shuffle is $R S$, where $S$ independently fixes or swaps every pair in direction $e_1$. If $Y_t$ is the physical permutation, then

$ Pi_t = R^(- t) Y_t \, #h(2em) Pi_(t + 1) = Q_t Pi_t \, #h(2em) i_t = 1 + \( t med mod med d \) \, quad "(2.1)" $ <eq:frames:cyclic>

where the $Q_t$ are independent fair matching switches in direction $e_(i_t)$. At multiples of $d$, the moving frame is the identity. Independent blocks of whole sweeps therefore have their physical shuffle convolution laws. A deterministic change of starting deck right-translates each law, preserving distance from uniform:

$ sup_(g_0) parallel cal(L) \( Y_t divides Y_0 = g_0 \) - U_(S_n) parallel_(upright("TV")) = parallel q_d^(* t) - U_(S_n) parallel_(upright("TV")) . quad "(2.2)" $ <eq:worst-state>

We use counting measure for vector norms, natural logarithms unless marked otherwise, and unnormalized trace for Hilbert–Schmidt norms. For probabilities $p \, q$ on a finite set, relative entropy is $D \( p bar.v.double q \) = sum_x p \( x \) log \( p \( x \) \/ q \( x \) \)$, with $0 log 0 = 0$ and value $+ oo$ if $p$ charges an atom on which $q$ vanishes. The entropy of $p$ is $H \( p \) = - sum_x p \( x \) log p \( x \)$.

#thm([Lemma 2.1.])[
  (Conditional path flow).  #emph[Fix observed labels and a different tagged label, independently of the switches. Conditional on any feasible specification of the observed paths through time $T$, the coins on edges not visited by those paths remain independent and fair. The conditional tag law at time $s lt.eq T$ is computed using the paths through $s$ only. It averages masses on edges with two available positions and transports mass on an edge with one available position to its uniquely available output. This rule also carries uniform measure on the available set to uniform measure on the next available set.]
] <lem:marginal-averaging>

#proof[
  A feasible path specification prescribes exactly one coin value at each visited time–edge pair. Necessity is immediate. Conversely, chronological induction shows that those prescribed values force the specified paths; no other coin is constrained. The event is thus a cylinder in the independent coin array. Its restriction after time $s$ specifies only later time–edge coins: the observed positions at time $s$ are already fixed by the path prefix. These later constraints are independent of all earlier coins, so they do not alter the conditional tag law at time $s$. On unvisited pairs, averaging over a fresh fair coin gives the stated rule; visited pairs transport the remaining endpoint. This proves the prefix-measurable update. The uniform vector has equal masses on every available endpoint, so it obeys the same rule. This is the path-flow principle of [15] Lemma 3.1. ◻
]

#thm([Lemma 2.2.])[
  (Sequential comparison).  #emph[ Let $\( Z_1 \, dots.h \, Z_k \)$ be an injective random tuple in a finite set $V$. Its distance from the uniform injective tuple is at most 
$ sum_(j = 1)^k bb(E) ∥cal(L) \( Z_j divides Z_1 \, dots.h \, Z_(j - 1) \) - "Unif" \( V \\ { Z_1 \, dots.h \, Z_(j - 1) } \)∥_(upright("TV")) . $

 Each expectation uses the actual prefix law. It may be bounded by conditioning further on earlier paths, provided the available endpoint set is already determined by the prefix. More generally, let $cal(A)$ be additional base information and let $A subset.eq V$ be an $cal(A)$-measurable set, with the tuple supported on $"inj" \( \[ k \] \, A \)$. The same statement holds conditional on $cal(A)$, replacing $V$ by $A$, and can then be averaged over $cal(A)$.]
] <lem:sequential-tv>

#proof[
  Compare laws with an actual prefix and a suffix filled by uniform sampling without replacement. Two consecutive laws differ only in the next conditional sampling kernel; adding their common suffix cannot increase variation distance. Summing the differences gives the displayed bound. Conditional convexity proves the full-path and base-information variants. This is the comparison in [15] Lemma 4.1. The basic sequential inequality also appears in Morris’s exclusion-process analysis [10] Section 5.3, Lemma 12 and in Morris, Rogaway and Stegers [13] Lemma 2 and Appendix A. ◻
]

For later use, the elementary support obstruction is

$ parallel q_d^(* t) - U_(S_n) parallel_(upright("TV")) gt.eq 1 - frac(2^(t n \/ 2), n !) #h(2em) \( t in bb(Z)_(gt.eq 0) \) . quad "(2.3)" $ <eq:support>

Indeed $t$ physical shuffles use $t n \/ 2$ fair bits, so their support has at most $2^(t n \/ 2)$ elements. Uniform measure assigns it at most that many divided by $n !$. Consequently the threshold-$1 \/ 4$ mixing time is at least $ceil.l \( 2 \/ n \) log_2 \( 3 n ! \/ 4 \) ceil.r = 2 d - O \( 1 \)$. More explicitly, $n ! gt.eq \( n \/ e \)^n$ gives

$ t_(upright("mix")) \( d \) gt.eq 2 d - 2 log_2 e + 2 / n log_2 \( 3 \/ 4 \) . quad "(2.4)" $ <mart:lower-exact>

For $t lt.eq d$ the distance is at least $1 - \( e \/ sqrt(n) \)^n$. For fixed $d$ the chain does converge: identity sweeps and any single cube-edge transposition have positive probability; cube-edge transpositions generate $S_n$, and padding with identity sweeps yields a common positive minorization.

#thm([Lemma 2.3.])[
  (Concentration).  #emph[Suppose $F$ depends on independent variables, and changing variable $j$ changes $F$ by at most $c_j$. For $u gt.eq 0$, either tail at distance $u$ from its mean has probability at most $exp \( - 2 u^2 \/ sum_j c_j^2 \)$. For a martingale whose successive increments have absolute values at most $c_j$, either tail is at most $exp \( - u^2 \/ \( 2 sum_j c_j^2 \) \)$. If all $c_j$ vanish the variable is constant.]
] <lem:concentration>

#proof[
  For a random variable $Z$ in an interval of length $c$, the second derivative of $log bb(E) e^(theta Z)$ is a tilted variance, at most $c^2 \/ 4$. Integration twice gives $bb(E) e^(theta \( Z - bb(E) Z \)) lt.eq e^(theta^2 c^2 \/ 8)$. Expose the independent variables successively. The corresponding Doob martingale difference has conditional range of length at most $c_j$: two choices of the next variable change each possible conditional completion by at most $c_j$. Multiplying the conditional exponential bounds and optimizing in $theta$ proves the first assertion. An absolute increment bound $c_j$ instead gives conditional range of length at most $2 c_j$, proving the second. These are the exponential arguments of Hoeffding and Azuma [6,1]. ◻
]

In particular, independent $\[ 0 \, 1 \]$ variables give either tail $e^(- 2 u^2 \/ r)$ for a sum of $r$ terms. For a uniform $m$-subset of an even set, expose its points in random order. Coupling two possible next draws by exchanging their identities in the remaining completion shows that the Doob martingale for the final half-count has increments bounded by one. Its mean is $m \/ 2$, so the probability that its count in a specified half is below $m \/ 4$ is at most $e^(- m \/ 32)$. These concentration estimates will be applied before conditioning on full observed paths.

== 3 A complete adapted-noise argument <sec:first-route>

Our first goal is to control a specified list of cards, uniformly over its starting positions. We keep the deterministic coordinate schedule. The conditional error is generated by transport across pairs with one available position, and all earlier error is erased after one sweep. We will first turn this finite memory into a scalar recurrence and then substitute the resulting list estimate into a precise Fourier transfer.

=== 3.1 The exact noise and covariance identities <the-exact-noise-and-covariance-identities>

Write $x^i = x + e_i$ for the coordinate-$i$ partner of $x in V$, and define $\( P_i f \) \( x \) = \( f \( x \) + f \( x^i \) \) \/ 2$. The operators $P_i$ commute, and their product over all coordinates projects onto constant vectors.

Fix a collection of blocker labels and a different tagged label. The starting labels may be deterministic, or may be sampled independently of the switches and then revealed. Let $V_t$ be the positions unoccupied by blockers, and write $m = \| V_t \|$. Given the revealed starting labels and the blocker paths through time $t$, let $p_t$ be the conditional law of the tagged position and define

$ f_t \( x \) = p_t \( x \) - frac(upright(bold(1))_(V_t) \( x \), m) \, #h(2em) a_t = bb(E) parallel f_t parallel_2^2 . $

Thus $f_t$ vanishes off $V_t$, sums to zero, and $parallel f_t parallel_2^2 = parallel p_t parallel_2^2 - 1 \/ m lt.eq 1$. This is the same type of centered second moment used in the swap-or-not analysis [5] Section 3; here its evolution is governed by the prescribed coordinate schedule.

By Lemma 2, the conditional vector is computable from the blocker-path prefixes, even if the complete blocker paths are given. Positions in $V_t$ are #emph[available]; all other positions are occupied by blockers. On a pair with two available input positions, the two entries are averaged. On a pair with one available input position, its entry is transported to the unique available output position. A pair with no available input position carries zero. The same rule transports the uniform vector $upright(bold(1))_(V_t) \/ m$.

The same linear update can start from any deterministic real vector $f_0$ supported on $V_0$ and satisfying $sum_x f_0 \( x \) = 0$. This more general vector need not be a difference of probabilities. Every update preserves its sum and support, and averaging or transport gives the pathwise bound

$ parallel f_t parallel_2^2 lt.eq parallel f_0 parallel_2^2 . quad "(3.1)" $ <noise:pathwise-contraction>

The next two lemmas apply to this signed-vector evolution. For the conditional tagged law above, $parallel f_0 parallel_2^2 = 1 - 1 \/ m lt.eq 1$.

#thm([Lemma 3.1.])[
  (Finite memory of the centered noise).  #emph[For either the conditional tagged vector or the signed-vector evolution just defined, put 
$ xi_t = f_(t + 1) - P_(i_t) f_t \, #h(2em) w_t = bb(E) sum_(x in V) f_t \( x \)^2 upright(bold(1))_({ x^(i_t) in.not V_t }) . $

 Then $xi_t$ is conditionally centered given the past, and 
$ bb(E) parallel xi_t parallel_2^2 & = 1 / 2 w_t \,\
a_t & = sum_(j = 1)^d 2^(- j) w_(t - j) quad \( t gt.eq d \) \,\
a_(t + 1) & = 1 / 2 \( a_t + w_t - 2^(- d) w_(t - d) \) lt.eq 1 / 2 \( a_t + w_t \) quad \( t gt.eq d \) . quad "(3.2)" $ <noise:noise-energy>

 Moreover, if $C_t = bb(E) \[ f_t f_t^(sans(T)) \]$ and $e_x$ is the unit vector at $x$, then the exact covariance recursion is 
$ C_(t + 1) & = P_(i_t) C_t P_(i_t)\
 & quad + 1 / 4 sum_({ x \, z } : z = x^(i_t)) bb(E) #h(-1em) [upright(bold(1))_({ \| { x \, z } ∩ V_t \| = 1 }) \( f_t \( x \) + f_t \( z \) \)^2] \( e_x - e_z \) \( e_x - e_z \)^(sans(T)) \, quad "(3.3)" $ <noise:covariance>

 where the last sum is over unordered pairs.]
] <noise:memory>

#proof[
  Use either the blocker-prefix filtration or the larger filtration containing the initial selection and all switch coins already used. The vector $f_t$ is measurable for either; the larger filtration does not redefine the path-conditioned law $p_t$. On a pair with one available position $x$, its contribution to $xi_t$ is $plus.minus f_t \( x \) \( e_x - e_(x^(i_t)) \) \/ 2$, with a fair sign. The signs for different pairs are conditionally independent. On the other pairs the noise is zero. This proves conditional centering, (3.2), and (3.3); the cross term between $P_(i_t) f_t$ and $xi_t$ also has conditional mean zero.
  Unroll $f_(s + 1) = P_(i_s) f_s + xi_s$ over the last $d$ updates. The initial term is zero because its coordinate averages include every direction. Noises created at different times are orthogonal in expectation, even after the subsequent deterministic operators, by conditional centering. A pair difference created at time $t - j$ is followed by $j - 1$ averages in distinct other directions. Its endpoints spread over two disjoint subcubes of size $2^(j - 1)$, so its squared norm is multiplied by $2^(- \( j - 1 \))$. Different pair noises at one time have zero cross terms in expectation by their independent signs, even if the propagated supports overlap. Consequently
  $ a_t = sum_(j = 1)^d 2^(- \( j - 1 \)) bb(E) parallel xi_(t - j) parallel_2^2 \, $
  which proves (3.2). Subtracting one half of that identity from its version at $t + 1$ gives (3.2). Equivalently, taking traces after expanding (3.3) gives these same weights: the factor $1 \/ 4$ multiplies the squared pair-difference norm $2 dot.op 2^(- \( j - 1 \))$, giving exactly $2^(- j)$. ◻
]

The next elementary comparison will be used repeatedly. If for all $s gt.eq s_0$ one has $w_s lt.eq rho a_s + eta$, with $0 lt.eq rho < 1$, then (3.2) implies

$ a_t lt.eq rho sum_(j = 1)^d 2^(- j) a_(t - j) + eta #h(2em) \( t gt.eq s_0 + d \) . quad "(3.4)" $ <noise:comparison-recurrence>

For any $1 \/ 2 < gamma < 1$ with $rho \/ \( 2 gamma - 1 \) lt.eq 1$, the comparison

$ a_t lt.eq a_0 gamma^(t - t_0) + frac(eta, 1 - rho) \, #h(2em) t_0 gt.eq s_0 + d \, quad "(3.5)" $ <noise:comparison-solution>

holds for all $t gt.eq 0$: it is immediate up to $t_0$ from $a_t lt.eq a_0$; after that, induction uses $rho sum_(j gt.eq 1) \( 2 gamma \)^(- j) = rho \/ \( 2 gamma - 1 \)$ and $sum_(j = 1)^d 2^(- j) lt.eq 1$.

=== 3.2 Uniform marginals from the preceding coordinate split <uniform-marginals-from-the-preceding-coordinate-split>

We first keep the initial blockers completely arbitrary. The previous use of a coordinate makes the blocker counts in its two halves nearly equal, and the intervening layers separate the two sources of randomness.

#thm([Lemma 3.2.])[
  (Half-density bound for arbitrary blockers).  #emph[Fix $0 < alpha lt.eq 1$, assume that at least $alpha n$ positions are available, and let $f_0$ be any deterministic sum-zero vector supported on those positions. Set 
$ delta = alpha / 2 \, #h(2em) eta_n = 2 exp #h(-1em) (- frac(alpha^2 n, 4)) \, #h(2em) gamma = 1 - alpha / 4 . $

 Uniformly over deterministic starting positions and choices of labels, 
$ w_s & lt.eq \( 1 - delta \) a_s + eta_n parallel f_0 parallel_2^2 quad \( s gt.eq d \) \,\
a_t & lt.eq (gamma^(t - 2 d) + eta_n / delta) parallel f_0 parallel_2^2 quad \( t gt.eq 0 \) . quad "(3.6)" $ <noise:half-energy>

]
] <noise:halves>

#proof[
  The preceding update in direction $i_s$ is $s - d arrow.r s - d + 1$. Conditional on the blocker configuration immediately before that update, the blocker count in one coordinate half afterwards is a constant from two-blocker pairs plus a sum of at most $n \/ 2$ independent fair Bernoulli variables from mixed pairs. Its mean is half the total blocker count. If either half has blocker fraction greater than $1 - alpha \/ 2$, its count differs from this mean by at least $alpha n \/ 4$. Hoeffding’s bound therefore gives probability at most $2 e^(- alpha^2 n \/ 4)$ for this event.
  Condition now on the blocker paths just after that preceding update. The next $d - 1$ updates use all other coordinates, acting independently in the two halves. The value $f_s \( x \)$ is computed from the history in the half of $x$ only. Its opposite partner $x^(i_s)$ is in the other half. Every blocker in that other half has uniform one-card marginal there after these $d - 1$ coordinate updates, because each bit is refreshed once. Thus the partner-blocker indicator is conditionally independent of $f_s \( x \)^2$, and its conditional mean is that half’s earlier blocker fraction. On histories with both fractions at most $1 - delta$, summing over $x$ bounds the conditional contribution by $1 - delta$ times the conditional energy. On the remaining histories use $parallel f_s parallel_2^2 lt.eq parallel f_0 parallel_2^2$. This proves the first inequality. Apply (3.5), with $rho = 1 - delta$, $t_0 = 2 d$, and $2 gamma - 1 = 1 - delta$, to obtain the second. ◻
]

#thm([Proposition 3.3.])[
  (Two uniform large-list estimates).  #emph[For every sufficiently large $d$, the following estimates hold uniformly over specified ordered lists and deterministic starting decks.]
  + #emph[At time $1024 d$, the images of any at most $15 n \/ 16$ labels have total-variation distance at most $n^(- 3 \/ 2)$ from a uniform injective tuple.]
  + #emph[At time $256 d$, the images of any at most $7 n \/ 8$ labels have total-variation distance $o \( 1 \)$ from a uniform injective tuple.]
] <noise:uniform-marginals>

#proof[
  For the first assertion use $alpha = 1 \/ 16$ in Lemma 6. At $T = 1024 d$, $gamma^(T - 2 d) lt.eq e^(- 1022 d \/ 64)$, so $a_T lt.eq 2 n^(- 6)$ eventually. For the second use $alpha = 1 \/ 8$, giving $gamma = 31 \/ 32$ and
  $ a_(256 d) lt.eq e^(- 254 d \/ 32) + 16 eta_n \, #h(2em) n^3 a_(256 d) = o \( 1 \) . $
  In each case expose the list in order. For its next card take the preceding labels as blockers. Conditional on their complete paths, its distance from uniform on the remaining positions is $parallel f_T parallel_1 \/ 2$, whose expectation is at most $sqrt(n a_T) \/ 2$. Conditioning on just their endpoints can only decrease this expected distance, by convexity, since the uniform reference on available positions depends only on those endpoints. Interpolate between laws with a true prefix and a suffix extended uniformly without replacement. Adjacent laws differ by at most the preceding expected one-card error; summing at most $n$ errors gives $n^(3 \/ 2) sqrt(a_T) \/ 2$. The first bound is at most $n^(- 3 \/ 2)$ and the second tends to zero. This proves both assertions. ◻
]

===== 3.2.1 Uniform entropy as a consequence. <uniform-entropy-as-a-consequence.>

The same estimate gives more than total variation. Fix $0 < alpha < 1$ and $A > 0$. There is an integer $C = C \( alpha \, A \)$ such that, for every specified ordered list $\( a_1 \, dots.h \, a_k \)$ with $k lt.eq \( 1 - alpha \) n$, and uniformly over deterministic starting decks,

$ D #h(-1em) (cal(L) \( \( Pi_(C d) \( a_j \) \)_(j = 1)^k \) thin mid(bar.v.double) thin "Unif" \( "inj" \( \[ k \] \, V \) \)) = O \( n^(- A) \) . quad "(3.7)" $ <noise:uniform-entropy>

Indeed, for a probability vector $p$ on $m$ points, $log u lt.eq u - 1$ gives $D \( p bar.v.double "Unif"_m \) lt.eq m parallel p - "Unif"_m parallel_2^2$. The entropy chain rule sums this bound for the successive conditional cards. Conditioning further on the preceding paths can only increase the mean entropy, by convexity, since the uniform reference depends only on their endpoints. With $m_j = n - j + 1$ and $f_T^(\( j \))$ the path-conditioned error for the $j$th card, the tuple entropy is at most

$ sum_(j = 1)^k m_j bb(E) parallel f_T^(\( j \)) parallel_2^2 lt.eq n^2 (gamma^(T - 2 d) + eta_n / delta) \, #h(2em) gamma = 1 - alpha / 4 \, quad delta = alpha / 2 \, $

by Lemma 6. Choose $C$ so that $gamma^(C - 2) < 2^(- \( A + 2 \))$ and put $T = C d$; the exponential $eta_n$ term is negligible. Thus later entropy calculations provide alternative contraction mechanisms and more detailed intermediate identities; small entropy for a fixed list is already a consequence of the half-density argument.

=== 3.3 Conventions and the first full-deck application <sec:probability-completion>

The scalar calculation has now proved the two list assertions of Theorem 1. The remaining step recovers the joint order of the omitted labels as well. We first state the probability completion used here and in later applications, and then give the exact isotypic input for this route. Completions involving subprobabilities, opposite orientations, kernels or different factor laws retain their separate arguments at the point of use.

We use the characteristic-zero irreducible representations of $S_n$, indexed by partitions $lambda tack.r n$ and realized unitarily. Write $lambda_1$ for the first-row length and $lambda'_1$ for the first-column length. The row $\( n \)$ gives the trivial representation, and the column $\( 1^n \)$ gives sign; for $n gt.eq 2$ these are exactly the dimension-one representations. The standard background is in [17,4].

===== 3.3.1 Probability completion. <probability-completion.>

For a measure $h$ on $S_n$ and an irreducible unitary representation $rho_lambda$ of dimension $D_lambda$, use the mass transform $hat(h) \( lambda \) = sum_g h \( g \) rho_lambda \( g \)$ and the ordinary, unnormalized Hilbert–Schmidt norm. Fourier matrices multiply in convolution order. For every probability law $sigma$, finite-group Plancherel gives

$ 4 parallel sigma - U_(S_n) parallel_(upright("TV"))^2 lt.eq sum_(lambda eq.not \( n \)) D_lambda parallel hat(sigma) \( lambda \) parallel_(upright("HS"))^2 . quad "(3.8)" $ <eq:c-plancherel>

This is the finite-group upper-bound method of Diaconis and Shahshahani [3] Section 2 and Lemma 14. Indeed Cauchy–Schwarz bounds the left side by $n ! sum_g \| sigma \( g \) - 1 \/ n ! \|^2$, which Plancherel identifies with the right side.

Suppose $mu \, nu$ are probability laws with $parallel mu - nu parallel_(upright("TV")) lt.eq delta_n = o \( 1 \)$ and $\| hat(nu) \( upright("sgn") \) \| = o \( 1 \)$. Let $p gt.eq 1$ be a fixed integer, independent of $n$. Setting $sigma = nu^(* p)$ gives

$ 4 parallel nu^(* p) - U_(S_n) parallel_(upright("TV"))^2 lt.eq sum_(lambda eq.not \( n \)) D_lambda parallel hat(nu) \( lambda \)^p parallel_(upright("HS"))^2 . quad "(3.9)" $ <sweeps:completion>

An operator bound $parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq K D_lambda^(- alpha)$ gives the nonlinear summand bound

$ D_lambda parallel hat(nu) \( lambda \)^p parallel_(upright("HS"))^2 lt.eq K^(2 p) D_lambda^(2 - 2 p alpha) . $

A squared Hilbert–Schmidt bound $parallel hat(nu) \( lambda \) parallel_(upright("HS"))^2 lt.eq K D_lambda^(- beta)$ instead gives

$ D_lambda parallel hat(nu) \( lambda \)^p parallel_(upright("HS"))^2 lt.eq K^p D_lambda^(1 - p beta) . $

Here $K \, alpha \, beta$ are fixed for the application. An $n$-dependent prefactor that is uniformly bounded for all sufficiently large $n$ may be replaced by a fixed upper bound $K$. The first estimate uses $parallel M parallel_(upright("HS")) lt.eq sqrt(D_lambda) parallel M parallel_(upright("op"))$; the second uses Hilbert–Schmidt submultiplicativity. Neither requires normality. If the resulting sum over $D_lambda > 1$ tends to zero, the sign assumption and (3.8) give $parallel nu^(* p) - U_(S_n) parallel_(upright("TV")) = o \( 1 \)$. Replacing $p$ factors one at a time costs at most $p delta_n$, by contraction under convolution with a probability law. Hence $mu^(* p)$ has the same limit.

In our applications $mu$ is the position-increment law of a block of $T$ physical shuffles, where $T$ is a positive integer divisible by $d$. Independent such blocks contain whole sweeps and have product law $mu^(* p) = q_d^(* \( p T \))$, by (2.1). Each block has zero expected sign: changing one fair switch while fixing every other coin changes its endpoint permutation by a transposition. Thus a nearby probability $nu$ has $\| hat(nu) \( upright("sgn") \) \| lt.eq 2 delta_n$. If $nu$ is obtained by conditioning on a retained event of probability $z > 0$, one also has the bound $\( 1 - z \) \/ z$, since the unconditioned sign expectation is zero. These statements hold also for an event on switch settings rather than on endpoints. Equation (2.2) then supplies uniformity over deterministic starting decks.

===== 3.3.2 The fixed-list application. <the-fixed-list-application.>

We use the following exact case of the isotypic transfer proved in [14] Lemma 2.3 and Proposition 3.5. We state its data explicitly to distinguish it from the operator-norm transfers used later.

Partition the labels into $b$ disjoint nonempty blocks and let $H_i$ permute block $i$ while fixing its complement. For a nonnegative measure $h$ of mass at most one on $S_n$, suppose

$ h \( g H_i \) lt.eq B \/ \[ S_n : H_i \] #h(2em) \( g in S_n \, med 1 lt.eq i lt.eq b \) . $

With the Fourier convention just fixed, the transfer gives

$ parallel hat(h) \( lambda \) parallel_(upright("HS"))^2 lt.eq b B C_2 D_lambda^(- 1 + 4 \/ b) \, #h(2em) C_2 = sup_(m gt.eq 1) sum_(tau tack.r m) D_tau^(- 2) < oo . quad "(3.10)" $ <eq:first-isotypic>

All restriction multiplicities are included, and the trace defining $parallel dot.op parallel_(upright("HS"))$ is not normalized. The same companion proves

$ sum_(lambda tack.r n : thin D_lambda > 1) D_lambda^(- 2) arrow.r 0 quad "(3.11)" $ <eq:first-degree-sum>

in [14] Lemma A.2.

Apply the $256 d$ assertion to the complements of eight equal blocks, and let $mu = q_d^(* \( 256 d \))$. The sum $delta_n$ of their eight marginal errors tends to zero. The endpoint tuple on a complement specifies precisely a left coset $g H_i$: two permutations agree on that complement exactly when they differ by multiplication on the right by $H_i$. Delete every coset whose mass exceeds twice its uniform mass, simultaneously for all eight subgroups. A deleted coset $C$ satisfies $mu \( C \) lt.eq 2 \( mu \( C \) - U \( C \) \)$, so the total deleted mass is at most $2 delta_n$. Let $z$ be the retained mass and $nu$ the normalized retained law. Then

$ z gt.eq 1 - 2 delta_n \, #h(2em) parallel nu - mu parallel_(upright("TV")) = 1 - z = o \( 1 \) \, #h(2em) nu \( g H_i \) lt.eq frac(2, z \[ S_n : H_i \]) lt.eq frac(4, \[ S_n : H_i \]) $

for sufficiently large $n$. The same retained law satisfies every cap. Equation (3.10), with $b = 8$ and $B = 4$, therefore gives $parallel hat(nu) \( lambda \) parallel_(upright("HS"))^2 lt.eq 32 C_2 D_lambda^(- 1 \/ 2)$.

Use the squared Hilbert–Schmidt case of the probability completion with $K = 32 C_2$, $beta = 1 \/ 2$ and $p = 8$. The contribution of $D_lambda > 1$ for $sigma = nu^(* 8)$ is at most

$ sum_(D_lambda > 1) D_lambda parallel hat(nu) \( lambda \)^8 parallel_(upright("HS"))^2 lt.eq \( 32 C_2 \)^8 sum_(D_lambda > 1) D_lambda^(- 3) = o \( 1 \) . $

The final equality follows from (3.11).

The original block law has zero expected sign, so $\| hat(nu) \( upright("sgn") \) \| lt.eq 2 parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$. The probability completion therefore proves $parallel nu^(* 8) - U_(S_n) parallel_(upright("TV")) arrow.r 0$ and bounds the replacement cost by $8 parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$. The original eight blocks take $8 dot.op 256 d = 2048 d$ physical shuffles, and (2.2) makes the estimate uniform over all deterministic starts. This completes Theorem 1.

== 4 Joint information conditional on base paths <sec:base-paths>

A marginal estimate with no conditioning does not describe what remains random after a prescribed set of paths has been observed. The next theorem supplies that stronger information. Its reference law depends on the observed endpoints, and its error is averaged over the actual law of the observed paths. This is the form needed when a subsequent construction reveals a color-occupancy history.

#thm([Theorem 4.1.])[
  (A joint estimate given base paths).  #emph[Fix $0 < p < 1$, and put 
$ q = frac(1 + p, 2) \, #h(2em) rho = frac(1 + q, 2) = frac(3 + p, 4) \, #h(2em) c_p = - 1 / 8 log_2 rho \, #h(2em) b = b \( p \) = ⌈10 / c_p⌉ . $

 Run independent fair matching switches on $V = bb(F)_2^d$ in any fixed cyclic order of its $d$ coordinate directions, from any deterministic starting deck. Let $n = 2^d$, $T = 2 b d$, and fix a set $B$ of $r_0$ labels and an ordered list $\( a_1 \, dots.h \, a_k \)$ of other distinct labels, where $r_0 + k - 1 lt.eq p n$. Write $cal(H)_B$ for the full labeled paths of $B$ through time $T$, and $A_B = V \\ Pi_T \( B \)$. For all sufficiently large $d$ (depending only on $p$), 
$ bb(E) ∥cal(L) #scale(x: 120%, y: 120%)[\(] \( Pi_T \( a_j \) \)_(j = 1)^k divides cal(H)_B #scale(x: 120%, y: 120%)[\)] - "Unif" #scale(x: 120%, y: 120%)[\(] "inj" \( \[ k \] \, A_B \) #scale(x: 120%, y: 120%)[\)]∥_(upright("TV")) lt.eq k n^(- 4) . quad "(4.1)" $ <eq:base-path-joint>

 The same assertion holds with $cal(H)_B$ replaced by any coarser sigma field that determines $A_B$. In particular it holds in the reverse cyclic coordinate order, and hence for the inverse permutation of a block of $2 b$ complete sweeps, with the base paths observed in that reversed process. The empty-list error is zero.]
] <thm:base-path-joint>

The proof first contracts a scalar vector uniformly over every deterministic observed set. We then reveal the additional list one card at a time, retaining the base paths throughout. The next lemma also allows an arbitrary deterministic sum-zero input vector, not just the centered point mass used in the first route. The half-density estimate already controls the noise of such a vector. Combining it with the one-step memory inequality contracts the energy during every layer of the second sweep. The resulting bound can then be restarted from each realized available set and vector.

#thm([Lemma 4.2.])[
  (Uniform two-sweep contraction).  #emph[Declare any $r lt.eq p n$ labels observed. Let $f_0$ be a deterministic real vector, supported on the available positions, with sum zero. Propagate $f_0$ by the conditional transport-and-average rule given the observed paths, and extend it by zero on occupied positions. For all sufficiently large $d$, 
$ bb(E) parallel f_(2 d) parallel_2^2 lt.eq n^(- c_p) parallel f_0 parallel_2^2 . $

 Consequently, for every positive integer $a$, 
$ bb(E) parallel f_(2 a d) parallel_2^2 lt.eq n^(- a c_p) parallel f_0 parallel_2^2 . $

 All norms use counting measure on $V$.]
] <lem:base-path-energy>

#proof[
  Use the layer numbering of Section 3: layer $s$ takes $f_s$ to $f_(s + 1)$. Put $a_s = bb(E) parallel f_s parallel_2^2$ and let $w_s$ be the blocked energy in Lemma 5. With $alpha = 1 - p$ and $eta_n = 2 exp \( - \( 1 - p \)^2 n \/ 4 \)$, Lemma 6 gives
  $ w_s lt.eq q a_s + eta_n parallel f_0 parallel_2^2 #h(2em) \( s gt.eq d \) . $
  The identity (3.2) therefore yields
  $ a_(s + 1) lt.eq rho a_s + 1 / 2 eta_n parallel f_0 parallel_2^2 #h(2em) \( s gt.eq d \) . quad "(4.2)" $ <eq:base-noise>
  Since $a_d lt.eq parallel f_0 parallel_2^2$, iterating over layers $d \, d + 1 \, dots.h \, 2 d - 1$ gives
  $ a_(2 d) lt.eq (rho^d + frac(eta_n, 2 \( 1 - rho \))) parallel f_0 parallel_2^2 lt.eq n^(- c_p) parallel f_0 parallel_2^2 $
  for sufficiently large $d$. Here $rho^d = n^(- 8 c_p)$, and the exponential error is smaller than every fixed inverse power of $n$.
  At each later two-sweep boundary, condition on the observed paths only up to that boundary. The available set and propagated vector are then fixed, while future switch coins remain independent and fair. The estimate is uniform in this set and vector, so its conditional version iterates to give the second assertion. This conditioning on the past is distinct from the full-path conditional law used to define a tagged vector: prefix measurability identifies that vector, but the energy estimate averages over the future observed paths. ◻
]

#proof[
  For one unobserved tag, start with its point mass minus uniform measure on the $n - r$ available positions. Its squared norm is $1 - 1 \/ \( n - r \) lt.eq 1$. The preceding lemma and $b c_p gt.eq 10$ show that its endpoint conditional law, given all $r$ observed paths, has expected variation distance at most
  $ 1 / 2 bb(E) parallel f_T parallel_1 lt.eq 1 / 2 sqrt(n bb(E) parallel f_T parallel_2^2) lt.eq 1 / 2 n^(- 9 \/ 2) lt.eq n^(- 4) $
  from uniform on the endpoint available set.
  For the list, at step $j$ regard $B union { a_1 \, dots.h \, a_(j - 1) }$ as observed. Its size is at most $p n$, so the preceding expected one-card bound applies to this enlarged observed set. Averaging over the paths of $a_1 \, dots.h \, a_(j - 1)$ while keeping their endpoints and the base paths can only decrease the expected variation distance: the comparison law depends on those endpoints alone. For each fixed base history, the sequential comparison lemma then bounds the joint error by the sum of the one-card errors, averaged under the actual prefix law. One may see this directly by replacing the last sampling kernel by uniform sampling from the available set, and then replacing earlier kernels in reverse order. Each replacement costs its expected conditional error; all kernels appended after it are contractions in total variation. Averaging also over the base history gives (4.1).
  If a coarser sigma field determines the endpoint available set, the same uniform reference is constant on each of its atoms. Conditional convexity therefore gives the asserted coarsening. No step in the scalar argument depended on which cyclic order was chosen. Finally, the inverse of a switch block reverses its independent involutive layers. Starting that reversed sequence from a deterministic deck gives the inverse increment law, with its own observed base paths, and proves the reverse-order conclusion. ◻
]

== 5 Random domains and predictable endpoint bounds <sec:noise-extensions>

The fixed-list proof is complete. An independent random choice of observed labels gives concentration in coordinate subcubes much smaller than a half-cube. A second refinement builds endpoint caps on one common event, giving simultaneous pointwise control of the conditional probabilities.

=== 5.1 Random blockers and disjoint subcubes <random-blockers-and-disjoint-subcubes>

When labels are sampled uniformly, every unconditioned available set is a uniform subset of its prescribed size. This allows concentration in subcubes much smaller than half the cube. It yields a different route to averaged marginal bounds.

#thm([Lemma 5.1.])[
  (Decorrelation across preceding-coordinate subcubes).  #emph[Suppose the blockers are a uniform subset of starting labels, chosen independently of the shuffle, and $m$ labels remain unblocked. Fix $f_t$ to be the centered conditional vector of a tagged unblocked card, so $parallel f_t parallel_2^2 lt.eq 1$, and let $1 lt.eq L < d$. At time $s gt.eq L$, partition $V$ into subcubes varying the $L$ directions used by layers $s - L \, dots.h \, s - 1$. If, with probability at least $1 - eta$, each such subcube at time $s - L$ has a fraction at least $r$ of available positions, then 
$ w_s lt.eq \( 1 - r \) a_s + eta . $

]
] <noise:subcubes>

#proof[
  Condition on the initial label choice and all switch history through $s - L$. Each of these subcubes now evolves with its own independent coins. The update rule for $f$ is local, so $f_s \( x \)^2$ depends on the coins in the subcube of $x$. Its partner $x^(i_s)$ lies in a different subcube, since the current coordinate has not been used among the preceding $L$ coordinates. The indicator that the partner is available is conditionally independent of $f_s \( x \)^2$. Its conditional mean is the old density of available positions in its subcube: averaging in each of that subcube’s $L$ coordinates makes the expected occupancy constant. On the asserted event this gives the factor $1 - r$. On its complement the sum of squared masses is at most one. Averaging proves the result. The argument uses unconditional concentration of the old available set, rather than claiming that it is uniform after path conditioning. ◻
]

#thm([Proposition 5.2.])[
  (Averaged complements with arbitrary fixed density).  #emph[Let $b gt.eq 2$ be a fixed power of two, $q = 1 \/ b$, $T = 100 b d$, and $A subset.eq V$ be a uniform subset of size $n - n \/ b$. If $mu$ is the time-$T$ permutation law, then 
$ bb(E)_A ∥cal(L)_(g tilde.op mu) \( g \|_A \) - "Unif" \( "inj" \( A \, V \) \)∥_(upright("TV")) = o \( 1 \) . quad "(5.1)" $ <noise:averaged-injections>

]
] <noise:averaged-general>

#proof[
  Choose a uniform ordered list with underlying set $A$. At any exposure index, the earlier labels are blockers and the next label is tagged; the number of available positions is at least $q n$. Put $L = floor.l d \/ 2 floor.r$. At every fixed time the available set is unconditionally uniform, since a shuffle permutation independent of the initial selection preserves uniform subset sampling. Its chance of having fraction below $q \/ 2$ in any one of the preceding-coordinate subcubes is at most
  $ eta_d = n \( n + 1 \) e^(- q 2^L \/ 8) . quad "(5.2)" $ <noise:binomial-conditioned-tail>
  Indeed sample independent Bernoulli indicators of parameter $m \/ n$, then condition their total to equal $m$. This conditioning gives a uniform $m$-subset, and the conditioning event has probability at least $1 \/ \( n + 1 \)$: the value $m$ is a mode of the binomial distribution with parameter $m \/ n$. The degenerate parameter one is immediate. Before conditioning, the lower-tail Chernoff bound for a subcube of size $2^L$ is at most $e^(- q 2^L \/ 8)$. A union bound over at most $n$ subcubes proves (5.2).
  Lemma 10 gives $w_s lt.eq rho a_s + eta_d$ for $s gt.eq L$, with $rho = 1 - q \/ 2$. Set $t_0 = d + L$ and $theta = 1 - q \/ 8$. Since $rho \/ \( 2 theta - 1 \) < 1$, the comparison induction gives
  $ a_t lt.eq theta^(t - t_0) + 2 eta_d \/ q . $
  At $T = 100 b d$ the geometric term is at most $exp \( - \( 100 b - 1.5 \) q d \/ 8 \)$, and hence $a_T = o \( n^(- 5) \)$ uniformly in the exposure index. The sequential comparison used in Proposition 7, now averaged over the initial list, bounds its mean tuple distance by $n^(3 \/ 2) sqrt(a_T) \/ 2 = o \( 1 \)$. The order of the chosen starting labels does not affect the distance for their restriction map, proving (5.1). ◻
]

The preceding argument already includes a random list of $3 n \/ 4$ labels. For this density, a direct exponential moment gives another tail bound without introducing independent Bernoulli variables and conditioning on their total. We record that calculation with the energy rate used in the four-subgroup application below.

#thm([Proposition 5.3.])[
  (A direct moment bound for three quarters of the labels).  #emph[At $T = 1000 d$, the mean total-variation distance for the images of a uniform ordered list of $3 n \/ 4$ starting labels from a uniform injective tuple tends to zero. In its conditional one-card construction, 
$ w_s lt.eq 7 / 8 a_s + eta_d quad \( s gt.eq L \) \, #h(2em) eta_d = n (\( 7 \/ 4 \) 2^(- 7 \/ 8))^(2^L) \, quad L = floor.l d \/ 2 floor.r \, quad "(5.3)" $ <noise:covariance-tail>

 and $a_T = o \( n^(- 10) \)$.]
] <noise:covariance-marginal>

#proof[
  The density of available positions is at least $1 \/ 4$. If $B_C$ counts blockers in a fixed preceding-coordinate subcube $C$, uniform sampling gives
  $ bb(E) 2^(B_C) = bb(E) product_(x in C) \( 1 + upright(bold(1))_({ x upright(" blocked") }) \) lt.eq sum_(J subset.eq C) \( 3 \/ 4 \)^(\| J \|) = \( 7 \/ 4 \)^(\| C \|) . $
  Markov’s inequality therefore bounds the probability that $B_C$ exceeds $7 \| C \| \/ 8$ by $\( \( 7 \/ 4 \) 2^(- 7 \/ 8) \)^(\| C \|)$. Union over at most $n$ subcubes and Lemma 10 prove (5.3). The base is strictly less than one. Using the exact covariance recursion (3.3), or its trace identity (3.2), gives
  $ a_t lt.eq \( 31 \/ 32 \)^(t - 2 d) + 8 eta_d . $
  The comparison is valid because $\( 7 \/ 8 \) \/ \( 2 \( 31 \/ 32 \) - 1 \) = 14 \/ 15 < 1$ and $\( 7 \/ 8 \) 8 + 1 = 8$. At $T = 1000 d$ this is $o \( n^(- 10) \)$. The expected conditional variation per list entry is at most $sqrt(m a_T) \/ 2 lt.eq sqrt(n a_T) \/ 2$. Summing as before proves the claimed mean tuple bound. ◻
]

=== 5.2 Predictable endpoint bounds <predictable-endpoint-bounds>

Small expected variation can be turned into bounded coset densities by trimming. A second construction produces these bounds directly on one common high-probability event. The event for the next card must be measurable before that card’s path is exposed.

#thm([Proposition 5.4.])[
  (A common subprobability with predictable coset bounds).  #emph[For all sufficiently large $d$, let $T = 2048 d$ and let $mu$ be its permutation law. There is a partition $D_1 \, dots.h \, D_8$ of the starting positions into sets of size $n \/ 8$ and a subprobability $0 lt.eq f lt.eq mu$ such that 
$ sum_g f \( g \) gt.eq 1 - 8 n^(- 11) \, #h(2em) f \( g H_i \) lt.eq 2 frac(\| H_i \|, \| G \|) quad \( g in G \, med 1 lt.eq i lt.eq 8 \) \, quad "(5.4)" $ <noise:predictable-cap>

 where $H_i = "Sym" \( D_i \)$ fixes the complement pointwise.]
] <noise:predictable-cosets>

#proof[
  Choose a uniform ordered partition and independently uniform orders of its eight complements. For one of these random orders and a fixed exposure index, let earlier labels be blockers, put $p = 1 \/ 8$, and use the centered vector $f_t$ already defined. Unconditionally its available set is uniform and has size at least $p n$.
  Write $s = ell d + j$, with $ceil.l d \/ 2 ceil.r lt.eq j lt.eq d - 1$. Conditional on the history at $ell d$, the first $j$ coordinate updates evolve independently in their $j$-dimensional subcubes. The argument of Lemma 10, with this pass boundary in place of $s - L$, gives $w_s lt.eq \( 1 - p \/ 2 \) a_s + delta_n$, where
  $ delta_n = n exp \( - p^2 sqrt(n) \/ 16 \) . $
  For completeness, in a subcube of size $r$ let $B$ count blockers. For every $theta.alt > 0$, expansion over subsets and sampling without replacement give
  $ bb(E) e^(theta.alt B) lt.eq \[ 1 + \( 1 - p \) \( e^theta.alt - 1 \) \]^r . $
  Take $theta.alt = p \/ 4$ and use $e^theta.alt - 1 lt.eq theta.alt + theta.alt^2$. The logarithm of the Markov bound for $B > \( 1 - p \/ 2 \) r$ is at most
  $ r { - theta.alt \( 1 - p \/ 2 \) + \( 1 - p \) \( theta.alt + theta.alt^2 \) } lt.eq - r p^2 \/ 16 . $
  Here $r = 2^j gt.eq sqrt(n)$, and a union bound proves the displayed $delta_n$. At all other times simply use $w_s lt.eq a_s$.
  Starting with $a_d lt.eq 1$, the one-step memory inequality (3.2) now contracts by $1 - p \/ 4$ at each late step, and otherwise does not increase except for the additive bound. There are $\( 2048 - 1 \) floor.l d \/ 2 floor.r$ late steps after time $d$. Thus
  $ a_T lt.eq \( 1 - p \/ 4 \)^(2047 floor.l d \/ 2 floor.r) + T delta_n lt.eq n^(- 18) quad "(5.5)" $ <noise:predictable-energy>
  eventually. For the last inequality one may use $floor.l d \/ 2 floor.r gt.eq d \/ 3$ and $p \/ 4 = 1 \/ 32$.
  For each query define $E_a = { parallel f_T parallel_2 lt.eq n^(- 3) }$. Its failure probability is at most $n^(- 12)$ by (5.5). There are at most $8 n$ queries, so their simultaneous success has probability at least $1 - 8 n^(- 11)$, averaging over the initial choices and the shuffle. Fix choices of partition and orders attaining at least this probability. Let $f \( g \)$ be the probability of permutation $g$ together with simultaneous success. This proves its domination and mass assertion.
  It remains to prove its pointwise coset bounds. In one fixed order, let $cal(B)_a$ reveal the full paths through $T$ of the first $a$ labels. The event $E_a$ for query $a$ depends only on $cal(B)_(a - 1)$, since the initial tag is fixed and its conditional law is computed from earlier paths. On this event the conditional probability of a specified next endpoint is at most
  $ frac(1, n - a + 1) + n^(- 3) lt.eq frac(1 + n^(- 2), n - a + 1) . $
  For specified distinct endpoints, let $S_a$ be the event that the $a$th card reaches its specified endpoint. In the product of $upright(bold(1))_(S_a) upright(bold(1))_(E_a)$, condition first on $cal(B)_(n - n \/ 8 - 1)$ and remove the last factor using this bound; then continue backwards. All previous factors are measurable at the conditioning step. This proves that the probability of the specified endpoint list together with all its good events is at most
  $ \( 1 + n^(- 2) \)^(n - n \/ 8) frac(\( n \/ 8 \) !, n !) lt.eq 2 frac(\| H_i \|, \| G \|) . $
  The subprobability $f$ also requires the other orders’ good events, so it is bounded by this probability. A coset $g H_i$ specifies exactly this complement endpoint list, proving (5.4). ◻
]

=== 5.3 The four corresponding full-permutation applications <the-four-corresponding-full-permutation-applications>

The information just obtained has three different forms: a uniform list estimate, an average over lists, and one subprobability with predictable pointwise caps. They enter distinct Fourier arguments. The statements below preserve the quantitative conclusions of those arguments; all times count physical shuffles.

#thm([Theorem 5.5.])[
  #emph[For the Thorp shuffle on $n = 2^d$, each of the following methods proves worst-start total-variation convergence to uniform at the indicated time:]
  + #emph[the sixteen-subgroup orbit-span argument at $8192 d$;]
  + #emph[predictable coset caps at $16384 d$;]
  + #emph[diagram peeling at $400 dot.op 2^22 d$;]
  + #emph[the covariance and four-subgroup coefficient argument at $16000 d$.]
  #emph[The $2048 d$ fixed-list and isotypic route was completed in Section 3.]
] <noise:mixing>

#proof[
  Write $C_u = sup_(m gt.eq 1) sum_(tau tack.r m) D_tau^(- u)$ for the finite constants proved in [14] Theorem 6.3. For the separate peeling argument put $C_(upright("peel")) = 512^2$. As before, every untrimmed positive-time shuffle block has zero sign expectation. All the lifting statements invoked below are proved independently in [14].
  For the $1024 d$ law, apply the first part of Proposition 7 with $b = 16$ blocks. Use the sequential trimming operation in Lemma 2.3 of [14]: reduce each coset mass exceeding its uniform mass to that mass. Each reduction preserves the earlier caps, and the total mass removed is at most $epsilon = b n^(- 3 \/ 2)$. The resulting subprobability $f lt.eq mu$ has mass $z gt.eq 1 - epsilon$ and caps one. Thus $nu = f \/ z$ satisfies $parallel nu - mu parallel_(upright("TV")) lt.eq epsilon$ and has cap two when $epsilon lt.eq 1 \/ 2$. Proposition 3.2 of [14] bounds the operator norm by $A D^(- 3 \/ 8)$, $A = sqrt(2 b C_2)$. Since $parallel B^8 parallel_(upright("HS")) lt.eq sqrt(D) parallel B parallel_(upright("op"))^8$, the nonsign sum is at most $A^16 sum_(D > 1) D^(2 - 6) = o \( 1 \)$. Its sign coefficient has absolute value at most $2 b n^(- 3 \/ 2)$. The same probability comparison proves mixing at $8 dot.op 1024 d$.
  For the predictable construction, let $f lt.eq mu$ be supplied by Proposition 13, and put $z = sum f$. Proposition 3.5 of [14], with $B = 2 \, b = 8$, gives $parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq 16 C_2 D^(- 1 \/ 2)$. Eight powers again leave an inverse-cube dimension sum. Its sign coefficient is bounded by $1 - z = o \( 1 \)$ and its trivial coefficient is $z$. More explicitly, for any fixed $R$,
  $ parallel f^(* R) - z^R U_G parallel_1^2 lt.eq sum_(rho eq.not upright("triv")) D_rho parallel hat(f) \( rho \)^R parallel_(upright("HS"))^2 . quad "(5.6)" $ <noise:subprob-plancherel>
  Thus the right side tends to zero for $R = 8$. The differences $mu^(* R) - f^(* R)$ and $U_G - z^R U_G$ have $ell^1$ norms $1 - z^R = o \( 1 \)$, since the former is nonnegative. This proves mixing after $8 dot.op 2048 d$.
  For peeling, take $b = 2^22$ and $T = 100 b d$ in Proposition 11. A uniform equal-size partition has uniformly distributed complements, so averaging selects one deterministic partition whose sum of complement errors is $o \( 1 \)$. Heavy-coset deletion gives a subprobability $eta lt.eq mu$ of mass $1 - o \( 1 \)$ and cap two. Since $b gt.eq 4 \( C_(upright("peel")) + 2 \)$, Corollary C.6 of [14] implies
  $ sum_(D_rho > 1) D_rho parallel hat(eta) \( rho \)^4 parallel_(upright("HS"))^2 lt.eq \( 6 b \)^4 sum_(D_rho > 1) D_rho^(1 - 4 \( 1 - \( C_(upright("peel")) + 2 \) \/ b \)) = o \( 1 \) \, $
  because the exponent is at most $- 2$ and Theorem 6.3 of [14] applies. The trivial and sign coefficients, and restoration of missing mass, are handled exactly by (5.6). The total physical time is $4 T = 400 dot.op 2^22 d$.
  Finally, Proposition 12 selects, by the same averaging argument, a deterministic partition into four blocks with complement errors summing to $o \( 1 \)$ for the $1000 d$ law. Trim to a subprobability $eta$ of mass $1 - o \( 1 \)$ and cap two. Proposition C.3 of [14] gives $parallel hat(eta) \( rho \) parallel_(upright("op")) lt.eq C D^(- 1 \/ 8)$. After sixteen factors the nontrivial nonsign sum is at most
  $ C^32 sum_(rho eq.not upright("triv") \, "sgn") D^(2 - 16 \/ 4) = C^32 sum_(rho eq.not upright("triv") \, "sgn") D^(- 2) = o \( 1 \) . $
  Again parity and missing mass are controlled as above. This proves the covariance route at $16 dot.op 1000 d = 16000 d$.
  All blocks contain a whole number of sweeps. The moving frame therefore returns to the physical coordinates, and independent blocks have the convolution laws used above. Equation (2.2) supplies worst-start uniformity in every case. The lower obstruction is (2.3); it is independent of which upper-bound method is used. ◻
]

== 6 Fixed domains, random domains, and Walsh coordinates <mart:section>

The finite-memory weights admit a second explanation: count the Walsh characters whose last active coordinate was updated at each preceding layer. We give that derivation first, then compare two ways of obtaining the opposite-half balance used in Section 3. A fixed domain acquires balance from the preceding switch layer; a random domain also has balance by sampling without replacement. The resulting table records the quantitative inputs used by several distinct Fourier transfers. Random sampling is needed for the smaller-subcube argument of Section 5, but it is not needed to obtain the half-density bounds in this section.

We retain $V = { 0 \, 1 }^d$, $n = 2^d$, and $G = "Sym" \( V \)$. In the cyclic coordinate frame, layer $s$ uses $i_s = 1 + \( s med mod med d \)$. The position permutation in that frame is $Pi_s$. A sweep consists of $d$ layers; at every sweep boundary the frame is the physical position frame.

=== 6.1 Walsh coordinates of the adapted flow <mart:flow-section>

Fix an ordered list $\( x_1 \, dots.h \, x_k \)$ of distinct input positions and expose the paths of its first $ell$ cards. The list may be deterministic or sampled independently of the shuffle. The next card is the tagged card. Let $cal(F)_s$ contain the list and the exposed paths through time $s$, and let $V_s$ be the set of positions not occupied by exposed cards. Its size is $m = n - ell$. Given a terminal time $T$, define

$ p_s \( x \) = bb(P) \( Pi_s \( x_(ell + 1) \) = x divides cal(F)_T \) \, #h(2em) f_s = p_s - m^(- 1) upright(bold(1))_(V_s) quad \( 0 lt.eq s lt.eq T \) . $

These are the available set and centered vector of Section 3. Lemma 2 applies with the exposed cards as blockers: although $p_s$ conditions on complete paths, it has an $cal(F)_s$-measurable version. Thus $f_s$ has sum zero, is supported on $V_s$, and has squared norm at most one.

Use the coordinate average $P_i$ from Section 3, and write $x^(\( i \)) = x xor e_i$ for the partner of $x$. In the following expectations we sample the shuffle and, when applicable, the initial list; we do not fix its terminal exposed paths. Set

$ a_s = bb(E) parallel f_s parallel_2^2 \, #h(2em) L_s = sum_x f_s \( x \)^2 upright(bold(1))_({ x^(\( i_s \)) in.not V_s }) \, #h(2em) w_s = bb(E) L_s . $

With this notation, Lemma 5 reads

$ f_(s + 1) = P_(i_s) f_s + xi_s \, #h(2em) bb(E) \( xi_s divides cal(F)_s \) = 0 . quad "(6.1)" $ <mart:noise-update>

On each edge with exactly one available position $x$, its noise is $plus.minus f_s \( x \) \( delta_x - delta_(x^(\( i_s \))) \) \/ 2$, with independent fair signs on distinct such edges. All other edges contribute zero noise. For every $t gt.eq d$,

$ a_t = sum_(j = 1)^d 2^(- j) w_(t - j) . quad "(6.2)" $ <mart:energy>

Equivalently, with $D_s = bb(E) parallel xi_s parallel_2^2 = w_s \/ 2$, $a_t = sum_(j = 1)^d 2^(- \( j - 1 \)) D_(t - j)$. There is also a coordinate-frequency proof, using the finite Boolean version of the Walsh character basis [19]. It avoids expanding the vector recursion and identifies the same weights by counting the last update of each character.

#thm([Lemma 6.1.])[
  (Walsh derivation).  #emph[For $A subset.eq { 1 \, dots.h \, d }$, define $hat(f)_s \( A \) = sum_x f_s \( x \) \( - 1 \)^(sum_(i in A) x_i)$. If $i_s in.not A$, then $hat(f)_(s + 1) \( A \) = hat(f)_s \( A \)$. If $i_s in A$, then 
$ bb(E) #scale(x: 120%, y: 120%)[\(] hat(f)_(s + 1) \( A \)^2 divides cal(F)_s #scale(x: 120%, y: 120%)[\)] = L_s . quad "(6.3)" $ <mart:walsh-update>

 These identities imply (6.2).]
] <mart:walsh>

#proof[
  A character omitting the active coordinate is constant on every updated edge, and the update preserves the sum on that edge. A character containing the active coordinate has opposite values at the endpoints. An edge with two available positions contributes zero after averaging. Each edge with one available position contributes its entry times an independent centered sign. The conditional second moment is therefore $L_s$.
  At time $t gt.eq d$, every nonempty character has a last update among the previous $d$ layers. Exactly $2^(d - j)$ subsets have their last update at time $t - j$: they include that coordinate, omit the $j - 1$ more recent coordinates, and choose arbitrarily among the other $d - j$. The empty coefficient is zero. Parseval, with normalization $parallel f parallel_2^2 = n^(- 1) sum_A hat(f) \( A \)^2$, now gives (6.2). ◻
]

=== 6.2 Opposite halves and large marginals <mart:balance-section>

The remaining input to the scalar recurrence is a gain when an available position meets another available position. The masses and the available set are generally correlated. The needed independence holds across the two halves during the $d - 1$ intervening coordinate updates.

#thm([Lemma 6.2.])[
  (Half-space factorization).  #emph[Fix $s gt.eq d - 1$, put $a = s - d + 1$, and let $H_0 \, H_1$ be the two halves defined by coordinate $i_s$. Conditional on $cal(F)_a$, for $h in { 0 \, 1 }$, 
$ bb(E) #h(-1em) [sum_(x in H_h) f_s \( x \)^2 upright(bold(1))_({ x^(\( i_s \)) in V_s }) thin mid(bar.v) thin cal(F)_a] = frac(\| V_a ∩ H_(1 - h) \|, n \/ 2) bb(E) #h(-1em) [sum_(x in H_h) f_s \( x \)^2 thin mid(bar.v) thin cal(F)_a] . quad "(6.4)" $ <mart:half-factorization>

 If both half densities at time $a$ are at least $beta$ except on an $cal(F)_a$-measurable event of probability at most $eta$, then 
$ w_s lt.eq \( 1 - beta \) a_s + eta . quad "(6.5)" $ <mart:noise-bound>

]
] <mart:halves>

#proof[
  The updates from $a$ through $s - 1$ visit each coordinate other than $i_s$ once and never cross the two halves. Given the initial history, the future switch arrays in the halves are independent of that history and of each other. Starting from the now known restrictions of $V_a$ and $f_a$, both the exposed paths and the forward flow inside one half are measurable functions of that half’s switch array alone. The cylinder description in Lemma 2 leaves its unvisited switches independent, so computing the conditional flow introduces no dependence on the other half. The flow value at $x$ uses only the array in its own half, whereas the opposite partner’s membership in $V_s$ uses the other array. In that other half, each exposed card is marginally uniform after these $d - 1$ layers, since each remaining bit has been refreshed with a fair bit. Distinctness of the card positions gives the stated expected available density. This proves (6.4). Subtract the available-partner contribution from $a_s$ and use $parallel f_s parallel_2^2 lt.eq 1$ on the exceptional event to obtain (6.5). ◻
]

We record the two sources of balance, as they yield different uniformity statements about the initial domain.

#thm([Lemma 6.3.])[
  (Fixed and random initial domains).  #emph[Suppose $m gt.eq n \/ q$, where $q gt.eq 1$ is a fixed integer.]
  + #emph[For every deterministic initial list, (6.5) holds for $s gt.eq d$ with $beta = 1 \/ \( 2 q \)$ and $eta = 2 exp \( - n \/ \( 8 q \) \)$.]
  + #emph[If the initial list is uniformly random and independent of the shuffle, it holds for $s gt.eq d - 1$ with $beta = 1 \/ \( 2 q \)$ and either of the valid bounds 
$ eta = 2 exp \( - n \/ \( 32 q \) \) \, #h(2em) eta = 2 \( n + 1 \) exp #h(-1em) (- frac(\( 1 - log 2 \) n, 4 q)) . $

]
  + #emph[In the random-list setting it also holds with $beta = 1 \/ \( 4 q \)$ and $eta = 2 exp \( - c n \/ q \)$ for an absolute $c > 0$, using the weaker requirement $\| V_a ∩ H_h \| gt.eq m \/ 8$.]
] <mart:balance>

#proof[
  For the first assertion, $a = s - d + 1 gt.eq 1$ is the time immediately after the preceding update in coordinate $i_s$. Given the history before that update, either half’s available count is $A + "Bin" \( L \, 1 \/ 2 \)$, where $2 A + L = m$ and $L lt.eq m$. A deviation below $m \/ 4$ has probability at most $exp \( - m \/ 8 \)$ by the independent bounded-difference estimate for the $L$ fair choices. The union bound handles both halves. Each half with at least $m \/ 4$ available positions has available density at least $1 \/ \( 2 q \)$.
  For a random list, $V_a$ is unconditionally a uniform $m$-subset, because a fixed permutation maps a uniform subset to a uniform subset. This statement is unconditional; no independence of $f_a$ and $V_a$ is asserted. A half count has mean $m \/ 2$. Its Doob martingale under sequential sampling without replacement has increments of absolute value at most one: changing the next draw can be coupled with the remaining completion by exchanging those two sites. The bounded-increment martingale inequality gives probability at most $exp \( - m \/ 32 \)$ for a downward deviation of $m \/ 4$, proving the first displayed choice.
  For the other choice, sample independent Bernoulli variables with parameter $m \/ n$ and condition their total to equal $m$. The latter event has probability at least $1 \/ \( n + 1 \)$ since $m$ is a binomial mode; the case $m = n$ is deterministic. Before conditioning, a half count $X$ satisfies $bb(E) 2^(- X) lt.eq e^(- m \/ 4)$. Thus $bb(P) \( X < m \/ 4 \) lt.eq exp \( - \( 1 - log 2 \) m \/ 4 \)$. Condition and sum over the two halves.
  Finally, failure of the $m \/ 8$ balance forces at least $k = ceil.l 7 m \/ 8 ceil.r$ of the $m$ sampled sites into one half. For any specified $k$ sample indices the probability is at most $2^(- k)$. The union bound gives $2 binom(m, k) 2^(- k)$, which is at most $2 e^(- c m)$: use $binom(m, m - k) lt.eq \( 8 e \)^(m \/ 8)$ and $\( 7 \/ 8 \) log 2 - \( 1 \/ 8 \) log \( 8 e \) > 0$. Lemma 16 now proves all three assertions. ◻
]

#thm([Lemma 6.4.])[
  (Scalar decay and sequential comparison).  #emph[If (6.5) holds for every $s gt.eq d$, then for any $gamma in \[ 1 - beta \/ 2 \, 1 \)$, 
$ a_t lt.eq gamma^(t - 2 d) + eta \/ beta #h(2em) \( t gt.eq 0 \) . quad "(6.6)" $ <mart:decay-bound>

 At time $T$, the total-variation distance of the images of a list of $k$ cards from the uniform injection is at most the sum of the expected conditional tagged distances. Each such summand is at most $1 / 2 sqrt(m a_T) lt.eq 1 / 2 sqrt(n a_T)$. The estimates hold for each deterministic list under the first balance assertion, and on average over lists under the other assertions.]
] <mart:decay>

#proof[
  Apply (3.5) with $rho = 1 - beta$, $s_0 = d$, $t_0 = 2 d$, and $a_0 lt.eq 1$. The condition on $gamma$ is exactly $\( 1 - beta \) \/ \( 2 gamma - 1 \) lt.eq 1$. For each list entry, Cauchy–Schwarz bounds the mean path-conditioned variation by $1 / 2 bb(E) parallel f_T parallel_1 lt.eq 1 / 2 sqrt(m a_T)$. Lemma 3 sums these errors: its uniform reference depends only on the previously exposed endpoints, so its path-conditioning version applies. Averaging this inequality over an independently sampled list gives the random-domain assertion. ◻
]

#thm([Proposition 6.5.])[
  (Quantitative marginal estimates).  #emph[The following choices give the indicated energy bounds uniformly over the sequential indices, and hence the corresponding large-marginal estimates. In each row $q$ is fixed and at most $n - n \/ q$ cards are observed. The letters $C_(upright("fix")) \, L \, C \, b_0$ denote fixed integers satisfying the displayed conditions.]
  table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[#emph[Input used]
], table.cell(rowspan: 1, colspan: 1)[#emph[$q$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$beta$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$gamma$]
], table.cell(rowspan: 1, colspan: 1)[#emph[Time and energy]
]),
  table.cell(rowspan: 1, colspan: 1)[#emph[fixed]
], table.cell(rowspan: 1, colspan: 1)[#emph[$16$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \/ 32$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$127 \/ 128$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$T = C_(upright("fix")) d$, $a_T = O \( n^(- 6) \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[fixed]
], table.cell(rowspan: 1, colspan: 1)[#emph[$8$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \/ 16$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$63 \/ 64$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$T = 512 d$, $a_T = O \( n^(- 7) \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[random]
], table.cell(rowspan: 1, colspan: 1)[#emph[$32$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \/ 64$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$127 \/ 128$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$T = L d$, $a_T = O \( n^(- 10) \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[random]
], table.cell(rowspan: 1, colspan: 1)[#emph[$8$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \/ 16$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$31 \/ 32$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$T = 200 d$, $a_T = O \( n^(- 8) \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[random]
], table.cell(rowspan: 1, colspan: 1)[#emph[$256$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \/ 1024$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2047 \/ 2048$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$T = C d$, $a_T = o \( n^(- 4) \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[random]
], table.cell(rowspan: 1, colspan: 1)[#emph[$64$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \/ 128$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$511 \/ 512$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$T = b_0 d$, $a_T = O \( n^(- 5) \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[random]
], table.cell(rowspan: 1, colspan: 1)[#emph[$K = 8192$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \/ \( 2 K \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 - 1 \/ \( 8 K \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$T = \( 100 K + 2 \) d$, $a_T = o \( n^(- 4) \)$]
],
)
  #emph[The integer choices are 
$ \( 127 \/ 128 \)^(C_(upright("fix")) - 2) lt.eq 2^(- 6) \, quad \( 127 \/ 128 \)^(L - 2) lt.eq 2^(- 10) \, quad \( 2047 \/ 2048 \)^(C - 2) < 2^(- 4) \, quad \( 511 \/ 512 \)^(b_0 - 2) lt.eq 2^(- 5) . $

 The first two rows will be used for prescribed lists, and the other rows on average over uniform initial lists. In fact the fixed-domain part of Lemma 17 also proves every energy bound in the table for each prescribed list: it has at least the displayed $beta$ and an exponentially small exceptional term. The distinction in the table records the information used by the transfers below. In particular the eight-block random-domain row has average marginal distance $O \( n^(- 5 \/ 2) \)$, and the $64$-block row has distance $O \( n^(- 1) \)$.]
] <mart:marginals>

#proof[
  Apply Lemmas 17 and 18. The $256$-block row uses the $m \/ 8$ threshold; the other rows use $m \/ 4$. The exceptional terms are exponentially small in $n$. For the numerical choices, $\( 63 \/ 64 \)^(510 d) = O \( 2^(- 7 d) \)$ and $\( 31 \/ 32 \)^(198 d) lt.eq 2^(- 8 d)$, since $198 log_2 \( 32 \/ 31 \) > 8$. In the last row the geometric term is at most $exp \( - 100 d \/ 8 \) = o \( 2^(- 4 d) \)$. The sequential estimate multiplies $sqrt(n a_T) \/ 2$ by at most $n$, giving the claimed errors. ◻
]

=== 6.3 Using the marginal bounds on the full permutation group <mart:applications>

We now specify how each row of Proposition 19 supplies a full-deck bound. This passage uses the abstract results of #emph[From partial permutation information to Fourier bounds] [14]. We state the needed bounds at their point of use. They use the mass transform $hat(nu) \( rho \) = sum_(g in G) nu \( g \) rho \( g \)$ and unnormalized Hilbert–Schmidt norm. For $u > 0$, put $C_u = sup_(m gt.eq 1) sum_(tau in hat(S_m)) \( dim tau \)^(- u)$. Theorem 6.3 of [14] gives $C_u < oo$ and $sum_(rho eq.not upright(bold(1)) \, "sgn") \( dim rho \)^(- u) = o \( 1 \)$ as $n arrow.r oo$.

For a partition into $q$ equal blocks, retain the subgroups $H_i = "Sym" \( D_i \)$ and left-coset convention of Section 3.3. A fixed-list bound supplies every such partition; an averaged bound supplies one by averaging the sum of its $q$ complementary marginal errors. In either case write that sum as $delta_n = o \( 1 \)$.

We use the common trimming operations from [14] Lemma 2.3. Heavy-coset deletion and normalization give a probability within $o \( 1 \)$ of the block law, with cap $B \/ \[ G : H_i \]$ for $B = 3$ or $4$. Successive excess trimming instead gives a subprobability of mass at least $1 - delta_n$ and cap one. Heavy-coset deletion without normalization gives mass $1 - o \( 1 \)$ and cap two. Each operation produces one measure satisfying all the caps simultaneously.

#thm([Proposition 6.6.])[
  (Quantitative applications of the martingale bounds).  #emph[Use the integer parameters specified in Proposition 19. Every total time in Table 1 gives worst-start total-variation convergence to uniform as $d arrow.r oo$.]
] <mart:application-times>

The table distinguishes a bound on the operator norm from one on the #emph[squared], unnormalized Hilbert–Schmidt norm. For its first three rows using squared Hilbert–Schmidt bounds, the exact inequalities are

$ D parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 & lt.eq 9 q C_2 D^(4 \/ q) &  & \( q = 16 \, med B = 3 \) \,\
parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 & lt.eq q C_2 D^(- 1 + 6 \/ q) &  & \( q = 8 \, med B = 1 \) \,\
parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 & lt.eq 4 q C_16 D^(- 1 + 18 \/ q) &  & \( q = 64 \, med B = 4 \) . quad "(6.7)" $ <mart:hs16>

Here $nu$ denotes the retained measure specified in the corresponding row, and $D = dim rho$. The constants in the other rows are also independent of $n$, except for $M = 1 - o \( 1 \)$, the retained probability in the random-partition construction.

#figure(
  table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Transfer and retained law
], table.cell(rowspan: 1, colspan: 1)[Fourier bound
], table.cell(rowspan: 1, colspan: 1)[$r$
], table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[Total time$\/ d$
]),
  table.cell(rowspan: 1, colspan: 1)[Transfer and retained law
], table.cell(rowspan: 1, colspan: 1)[Fourier bound
], table.cell(rowspan: 1, colspan: 1)[$r$
], table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[Total time$\/ d$
],
  table.cell(rowspan: 1, colspan: 1)[Random partition, $q = 8$; probability, mass $M$ before conditioning
], table.cell(rowspan: 1, colspan: 1)[$upright("op") : med 2 / M sqrt(16 C_1) D^(- 5 \/ 16)$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$- 3$
], table.cell(rowspan: 1, colspan: 1)[$1600$
],
  table.cell(rowspan: 1, colspan: 1)[Coefficient space, $q = 16$; probability, cap $3$
], table.cell(rowspan: 1, colspan: 1)[HS squared: (6.7)
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$- 2$
], table.cell(rowspan: 1, colspan: 1)[$4 C_(upright("fix"))$
],
  table.cell(rowspan: 1, colspan: 1)[Pointwise character, $q = 8$; subprobability, cap $1$
], table.cell(rowspan: 1, colspan: 1)[HS squared: (6.7)
], table.cell(rowspan: 1, colspan: 1)[$16$
], table.cell(rowspan: 1, colspan: 1)[$- 3$
], table.cell(rowspan: 1, colspan: 1)[$8192$
],
  table.cell(rowspan: 1, colspan: 1)[Global isotypic, $q = 64$; probability, cap $4$
], table.cell(rowspan: 1, colspan: 1)[HS squared: (6.7)
], table.cell(rowspan: 1, colspan: 1)[$32$
], table.cell(rowspan: 1, colspan: 1)[$- 22$
], table.cell(rowspan: 1, colspan: 1)[$32 b_0$
],
  table.cell(rowspan: 1, colspan: 1)[Coefficient average, $q = 32$; probability, cap $4$
], table.cell(rowspan: 1, colspan: 1)[$upright("op") : med 8 / 3 sqrt(C_1) D^(- 5 \/ 16)$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$- 3$
], table.cell(rowspan: 1, colspan: 1)[$8 L$
],
  table.cell(rowspan: 1, colspan: 1)[Orbit average, $q = 256$; probability, cap $4$
], table.cell(rowspan: 1, colspan: 1)[$upright("op") : med 4 sqrt(C_32) D^(- 1 \/ 4)$
], table.cell(rowspan: 1, colspan: 1)[$72$
], table.cell(rowspan: 1, colspan: 1)[$- 34$
], table.cell(rowspan: 1, colspan: 1)[$72 C$
],
  table.cell(rowspan: 1, colspan: 1)[Small-index character, $K = q = 8192$; subprobability, cap $2$
], table.cell(rowspan: 1, colspan: 1)[$upright("HS")^2 : med 2 K C_1 D^(- 1 + 1026 \/ K)$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq - 1$
], table.cell(rowspan: 1, colspan: 1)[$3276808$
],
),
  caption: [Table 2: Fourier substitutions for the marginal bounds. The column $r$ counts independent blocks; $kappa$ bounds the exponent of $D$ in their nonsign Plancherel summand, up to a fixed factor. ],
)

#proof[
  All Fourier bounds in the table are exact cases of [14]: Proposition 5.1 for the first row; Proposition 4.4 for the coefficient and pointwise-character rows; Proposition 3.5 for the global isotypic row; Propositions C.1 and C.2 for the two projection averages; and Theorem 7.3 for the last row. The last transfer uses a one-dimensional character of index at most $b^1024$ in every block type of degree $b$, which gives $\( 1024 + 2 \) \/ K = 1026 \/ 8192 < 1 \/ 4$ in its displayed bound.
  The first row uses the averaged complementary-coset estimate at $200 d$ directly. Its transfer constructs a conditional probability law and keeps the partition random inside the coefficient estimate; it does not select a deterministic partition there. All other rows use the selected partition and the indicated common trimming.
  For an operator bound $A D^(- beta)$, the probability completion of Section 3.3 gives a nonsign summand $A^(2 r) D^(2 - 2 r beta)$. For a squared Hilbert–Schmidt bound $A D^(- beta)$, it gives $A^r D^(1 - r beta)$. Substitution gives the column $kappa$. Every displayed upper exponent is negative, so the corresponding reciprocal-degree sum tends to zero. In particular the pointwise-character and small-index rows use subprobabilities; they need the same norm calculation with their mass retained.
  To finish those two rows, let $z = nu \( G \) = 1 - o \( 1 \)$. Since the original shuffle block has zero sign expectation, the retained subprobability has sign coefficient at most $1 - z$. Equation (5.6) makes $parallel nu^(* r) - z^r U_G parallel_1 = o \( 1 \)$, while restoring the missing mass costs $1 - z^r lt.eq r \( 1 - z \)$ in each of the two positive measures. For the probability rows, closeness to the original block law gives sign coefficient $o \( 1 \)$ and permits replacement of the $r$ factors, as in Section 3.3.
  Finally multiply the corresponding block length from Proposition 19 by $r$. For the last row this is $4 \( 100 dot.op 8192 + 2 \) d = 3276808 d$. All block lengths are multiples of $d$, so their convolutions are physical shuffle blocks. Translation by a deterministic starting deck preserves distance from uniform. ◻
]

== 7 Conditional weights for the cyclic coordinate schedule <cycles:section>

The deterministic coordinate schedule admits estimates that do not use an auxiliary change to random directions. We first give several two-sweep estimates for arbitrary initial available sets and signed weights. They yield uniform mixing of any prescribed list omitting a fixed positive fraction of the cards. We then track the bitwise difference of two conditional weights. This autocorrelation gives predictable marginal caps in both coordinate orders; a two-sided Fourier transfer turns those caps into a $2052 d$ bound.

Throughout this section $n = 2^d$, $V = bb(F)_2^d$, and $G = "Sym" \( V \)$. A #emph[sweep] means the $d$ consecutive coordinate layers $1 \, dots.h \, d$ in the rotating frame of (2.1). At a sweep boundary this frame agrees with the physical position frame. The arguments also hold after any permutation of the coordinate order, including its reversal. All norms on real vectors on $V$ below use counting measure.

=== 7.1 Signed weights on the available set <cycles:weights>

Let $F subset.eq V$ be a moving set of available positions and put $h = upright(bold(1))_F$. Attach a real vector $f$ supported on $F$. A coordinate layer updates each matching pair as follows: with two available endpoints, replace their weights by their average; with one available endpoint, place its flag and weight at one of the two endpoints with equal probabilities; with no available endpoint, leave both weights zero. The choices on distinct pairs are independent. This preserves $\| F \|$ and $sum_x f \( x \)$, and never increases $parallel f parallel_2^2$. Write $A_j$ for ordinary averaging across coordinate $j$, and $B_i = A_i dots.h.c A_1$, with $B_0 = I$. Conditional on the past,

$ bb(E) \( f_(upright("new")) divides h \, f \) = A_j f \, #h(2em) bb(E) \( h_(upright("new")) divides h \, f \) = A_j h \, #h(2em) bb(E) \( f_(upright("new"))^2 divides h \, f \) lt.eq A_j \( f^2 \) quad "(7.1)" $ <cycles:mean-update>

pointwise. The first two identities follow by inspecting the three pair types. For the last, two weights at available endpoints satisfy $\( \( a + b \) \/ 2 \)^2 lt.eq \( a^2 + b^2 \) \/ 2$, and the other cases are equalities.

This process includes the centered conditional distribution of one card after the trajectories of several other cards have been exposed. Write $X_t \( a \)$ for the location of the card started at $a$ in the cyclic coordinate frame. More precisely, if $j$ cards are observed through time $t$, let $cal(F)_t$ be their trajectory field, $F_t$ their complement, and $a$ a further initial label. Then

$ f_t \( x \) = Pr \( X_t \( a \) = x divides cal(F)_t \) - frac(upright(bold(1))_(F_t) \( x \), n - j) quad "(7.2)" $ <cycles:conditional-weight>

has exactly the transition law above by Lemma 2, applied with the observed cards as blockers. The same rule transports the uniform vector on the available set. The process is adapted to $cal(F)_t$; it is not obtained by conditioning its transitions on a future event. Its initial energy is at most one. The real weights considered here have broader scope than this application: they may be any deterministic signed vector supported on the initial available set. The contraction statements below retain that scope, with their stated zero-sum hypotheses.

#thm([Lemma 7.1.])[
  (From signed-weight energy to list mixing).  #emph[Fix $p in \( 0 \, 1 \)$ and an integer $R gt.eq 1$. Suppose every deterministic zero-sum weight configuration on an available set with $\| F \| gt.eq p n$ satisfies $bb(E) parallel f_(2 d) parallel_2^2 lt.eq kappa_d parallel f_0 parallel_2^2$ over two sweeps. After $2 R$ sweeps the images of any fixed ordered list of at most $\( 1 - p \) n$ distinct initial labels have total-variation distance at most 
$ 1 / 2 n^(3 \/ 2) kappa_d^(R \/ 2) quad "(7.3)" $ <cycles:list-error>

 from the uniform distinct-position list.]
] <cycles:list>

#proof[
  Successive conditioning at two-sweep boundaries gives $bb(E) parallel f_(2 R d) parallel_2^2 lt.eq kappa_d^R$ for the centered conditional law of each next card, exposing all preceding cards. There are always at least $p n$ available positions. Cauchy–Schwarz bounds its expected conditional variation distance by $1 / 2 sqrt(n kappa_d^R)$. Conditioning on the preceding endpoints alone can only decrease this expectation: the uniform reference on available positions is already measurable from those endpoints, and the conditional law is the conditional expectation of the path-conditioned law. Finally interpolate between joint laws with a true prefix of length $j$ and uniform sampling without replacement thereafter. Consecutive laws differ by the conditional error at the next card, averaged under the actual prefix law. Summing at most $n$ such errors proves the bound. ◻
]

=== 7.2 Coarse averaging and the energy of a second sweep <cycles:coarse>

We first give an independent noise-based argument. It controls coarse block averages by a martingale expansion, then uses the remaining coordinates of a second sweep to remove energy. The following subsection will obtain sharper block moments from the transverse fibers instead.

#thm([Proposition 7.2.])[
  (Coarse-energy contraction).  #emph[For $\| F \| gt.eq n \/ 8$ and $sum_x f \( x \) = 0$, the signed-weight process satisfies, for all sufficiently large $d$, 
$ bb(E) parallel f_(2 d) parallel_2^2 lt.eq n^(- 1 \/ 256) parallel f_0 parallel_2^2 . quad "(7.4)" $ <cycles:coarse-contraction>

 Consequently $4096$ sweeps mix every fixed list of at most $7 n \/ 8$ cards with variation error at most $1 / 2 n^(- 5 \/ 2)$.]
] <cycles:coarse-prop>

#proof[
  Let $m = floor.l 3 d \/ 4 floor.r$ and $p = \| F_0 \| \/ n$. At layer $j$ of a sweep,
  $ f_j = A_j f_(j - 1) + xi_j . $
  Conditional on the past, $xi_j$ is the sum, over pairs ${ u \, v }$ with exactly one available endpoint $u$, of independent centered vectors $plus.minus f_(j - 1) \( u \) \( e_u - e_v \) \/ 2$. Here $e_x$ denotes the unit vector at a position $x$. Expanding the entire sweep, the centered noise terms at different times are orthogonal in second moment, even after applying deterministic averaging operators. Moreover $parallel B_m \( e_u - e_v \) parallel_2^2 lt.eq 2 dot.op 2^(- m)$, and all coordinate averages commute. Since $B_d f_0 = 0$, and writing $f^(*) \, h^(*)$ for the output,
  $ bb(E) parallel B_m f^(*) parallel_2^2 lt.eq d 2^(- m) parallel f_0 parallel_2^2 \, #h(2em) bb(E) parallel B_m h^(*) - p upright(bold(1)) parallel_2^2 lt.eq d 2^(- m) n . quad "(7.5)" $ <cycles:coarse-moments>
  For the second inequality use the same expansion for flags and $parallel h_0 parallel_2^2 = p n lt.eq n$. Energy monotonicity bounds each layer’s sum of squared noise coefficients by the initial energy.
  A level-$m$ block varies in coordinates $1 \, dots.h \, m$. If one such block has a fraction of available positions below $1 \/ 16$, the second squared norm in (7.5) is at least $2^m \/ 256$. Thus the event $cal(G)$ that all these blocks have density at least $1 \/ 16$ satisfies $Pr \( cal(G)^c \) lt.eq 256 d n 2^(- 2 m)$.
  Condition on the output of sweep one. Before coordinate $j$ of sweep two, distinct level-$\( j - 1 \)$ blocks have used disjoint fresh coins. In particular the two endpoints $x \, y$ of the next pair have independent flag-weight data, whose means are the entries of $B_(j - 1) h^(*) \, B_(j - 1) f^(*)$. Their energy loss is exactly
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] h \( y \) f \( x \)^2 + h \( x \) f \( y \)^2 - 2 f \( x \) f \( y \) #scale(x: 120%, y: 120%)[\)] . $
  On $cal(G)$, for $j > m$ both flag means are at least $1 \/ 16$. The sum of the expected cross products over the pairs is at most $1 / 2 parallel B_(j - 1) f^(*) parallel_2^2 lt.eq 1 / 2 parallel B_m f^(*) parallel_2^2$. The conditional expected energy therefore contracts by $31 \/ 32$ at each such step, with additive term $1 / 2 parallel B_m f^(*) parallel_2^2$. Iterating this recurrence, and using monotonicity on $cal(G)^c$, gives
  $ bb(E) parallel f_(2 d) parallel_2^2 lt.eq (\( 31 \/ 32 \)^(d - m) + 16 d 2^(- m) + 256 d n 2^(- 2 m)) parallel f_0 parallel_2^2 . quad "(7.6)" $ <cycles:coarse-factor>
  Each term is $o \( n^(- 1 \/ 256) \)$: for the first use $\( 31 \/ 32 \)^(d - m) lt.eq e^(- d \/ 128)$, while the others have powers at least $3 \/ 4$ and $1 \/ 2$, up to polynomial factors in $d$. This proves (7.4). Iterating $2048$ two-sweep blocks gives energy $n^(- 8)$, and Lemma 21 gives the stated marginal error. ◻
]

=== 7.3 Block statistics and the exact merge <cycles:block-core>

A level-$j$ block fixes coordinates $j + 1 \, dots.h \, d$ and varies the first $j$; write $cal(B)_j$ for this partition into blocks of size $2^j$. Its transverse fibers fix the first $j$ coordinates and vary the rest. The first $j$ layers act inside the blocks. Once those layers are fixed, the remaining layers act independently in the transverse fibers. Writing a site as $\( a \, b \)$, the prefix $a$ indexes the fibers and the suffix $b$ indexes the blocks. Each block meets each fiber once, as in Figure 1. This crossing of the two partitions gives both a small signed block sum and a concentrated available count at the end of a sweep.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.441, -0.2088), (3.591, 0.2088), fill: rgb("#e8e8ff"))
  rect((1.701, -0.2088), (2.499, 1.949), fill: rgb("#ffeddb"))
  rect((-0.441, -0.2088), (3.591, 0.2088), stroke: (paint: rgb("#0000a6")))
  rect((1.701, -0.2088), (2.499, 1.949), stroke: (paint: rgb("#bf6000")))
  circle((0, 0), radius: 0.07056, fill: black)
  circle((0, 0.58), radius: 0.07056, fill: black)
  circle((0, 1.16), radius: 0.07056, fill: black)
  circle((0, 1.74), radius: 0.07056, fill: black)
  circle((1.05, 0), radius: 0.07056, fill: black)
  circle((1.05, 0.58), radius: 0.07056, fill: black)
  circle((1.05, 1.16), radius: 0.07056, fill: black)
  circle((1.05, 1.74), radius: 0.07056, fill: black)
  circle((2.1, 0), radius: 0.07056, fill: black)
  circle((2.1, 0.58), radius: 0.07056, fill: black)
  circle((2.1, 1.16), radius: 0.07056, fill: black)
  circle((2.1, 1.74), radius: 0.07056, fill: black)
  circle((3.15, 0), radius: 0.07056, fill: black)
  circle((3.15, 0.58), radius: 0.07056, fill: black)
  circle((3.15, 1.16), radius: 0.07056, fill: black)
  circle((3.15, 1.74), radius: 0.07056, fill: black)
  content((0, -0.29), [$00$], anchor: "north")
  content((1.05, -0.29), [$01$], anchor: "north")
  content((2.1, -0.29), [$10$], anchor: "north")
  content((3.15, -0.29), [$11$], anchor: "north")
  content((-0.525, 0), [$00$], anchor: "east")
  content((-0.525, 0.58), [$01$], anchor: "east")
  content((-0.525, 1.16), [$10$], anchor: "east")
  content((-0.525, 1.74), [$11$], anchor: "east")
  content((1.575, -0.986), [prefix $a$])
  content((-1.365, 0.87), [#page_rotate(-90deg)[suffix $b$]])
  content((3.99, 0.058), [one level-$k$ block], anchor: "west")
  content((3.99, 1.45), [one transverse fiber], anchor: "west")
  line((3.938, 0.058), (3.623, 0.058), mark: (end: ">"))
  line((3.938, 1.45), (2.541, 1.45), mark: (end: ">"))
})],
  caption: [Figure 1: The case $d = 4$, $k = 2$. The first $k$ layers act within the horizontal blocks. After those layers are fixed, the remaining layers evolve independently in the vertical fibers. Each horizontal block receives one final site from every fiber. ],
) <cycles:transverse-figure>

#thm([Lemma 7.3.])[
  (Statistics after one sweep).  #emph[Fix $0 < epsilon lt.eq 1$. Start a sweep from deterministic $\( F \, f \)$ with $\| F \| gt.eq epsilon n$, $sum_x f \( x \) = 0$, and energy $E_0 = parallel f parallel_2^2$. Denote its output by $\( F^(*) \, f^(*) \)$ and write $S_B = sum_(x in B) f^(*) \( x \)$ and $m_B = \| F^(*) ∩ B \|$. For $B in cal(B)_j$, of size $s = 2^j$, 
$ bb(E) S_B^2 lt.eq \( s \/ n \) E_0 \, #h(2em) Pr \( m_B < epsilon s \/ 2 \) lt.eq e^(- epsilon^2 s \/ 2) . quad "(7.7)" $ <sweeps:block-variance>

 The second bound can alternatively be replaced by $exp \[ - \( 1 \/ 2 - e^(- 1) \) epsilon s \]$.]
] <sweeps:block-statistics>

#proof[
  Condition on the configuration after coordinate $j$. The remaining layers use independent switch arrays in the $s$ transverse fibers, each of size $n \/ s$. The final entry at the one site where a fiber meets $B$ has conditional mean equal to that fiber’s mean signed weight and second moment at most its mean squared weight, by (7.1). The sum of these means is $\( s \/ n \) sum_x f \( x \) = 0$. Independence between fibers therefore bounds the conditional second moment of $S_B$ by $\( s \/ n \)$ times the energy at the conditioning time, which is at most $E_0$.
  The availability indicators at those $s$ sites are likewise independent under this conditioning. Their total mean is $mu = \| F \| s \/ n gt.eq epsilon s$. Hoeffding’s inequality (Lemma 4) bounds a downward deviation of at least $epsilon s \/ 2$ by $e^(- epsilon^2 s \/ 2)$. Alternatively, for their sum $J$, independence gives $bb(E) e^(- J) lt.eq e^(- \( 1 - e^(- 1) \) mu)$, and hence $Pr \( J < mu \/ 2 \) lt.eq e^(- \( 1 \/ 2 - e^(- 1) \) mu)$. ◻
]

The next identity describes how a sweep uses these block statistics. Its inputs are deterministic at the start of that sweep; no independence between blocks of a preceding sweep’s output is required.

#thm([Lemma 7.4.])[
  (The block-merging identity).  #emph[Start a sweep deterministically. Suppose two sibling blocks have size $s$, available counts $m_0 \, m_1$ and signed sums $S_0 \, S_1$. Let $overline(E)_0 \, overline(E)_1$ be their expected energies after their internal coordinates have been updated. The expected energy after their merging coordinate is 
$ \( 1 - m_1 \/ \( 2 s \) \) overline(E)_0 + \( 1 - m_0 \/ \( 2 s \) \) overline(E)_1 + S_0 S_1 \/ s . quad "(7.8)" $ <sweeps:merge-eq>

]
] <sweeps:merge>

#proof[
  The child blocks use independent switch arrays before merging. The averaging identities in (7.1) give, at each site of child $i$, expected availability $m_i \/ s$ and expected signed weight $S_i \/ s$. No equality between the individual sites’ second moments is needed. On an edge with weights $a \, b$ and availability indicators $q_a \, q_b$, the energy loss is $\( q_b a^2 + q_a b^2 - 2 a b \) \/ 2$. Independence across children and summation over their $s$ paired sites give expected loss
  $ frac(m_1 overline(E)_0 + m_0 overline(E)_1 - 2 S_0 S_1, 2 s) \, $
  which proves the identity. ◻
]

=== 7.4 Transverse block sampling and zero block sums <cycles:zero-block>

The next argument first removes the small component that is constant on the available positions of each block. The remaining component has zero expected weight at each site in the latter half of the next sweep.

#thm([Proposition 7.5.])[
  (Blockwise centered contraction).  #emph[For $p = 1 \/ 16$, arbitrary $\| F \| gt.eq p n$, and zero-sum $f$, two sweeps satisfy (7.4). After $2048$ sweeps every fixed list of at most $15 n \/ 16$ labels has variation error at most $1 / 2 n^(- 1 \/ 2)$.]
] <cycles:centered-prop>

#proof[
  Put $k = floor.l d \/ 2 floor.r$, $L = 2^k$, and $M = 2^(d - k)$, and denote the first-sweep output by $\( F^(*) \, f^(*) \)$. Sum the moment bound in Lemma 23 over the $M$ level-$k$ blocks. Its exponential tail, using $1 \/ 2 - e^(- 1) > 1 \/ 8$, and a union bound give
  $ Pr \( cal(G)^c \) lt.eq M e^(- p L \/ 8) \, #h(2em) bb(E) sum_B S_B^2 lt.eq parallel f_0 parallel_2^2 \, #h(2em) cal(G) = { \| F^(*) ∩ B \| gt.eq p L \/ 2 upright(" for every ") B } . quad "(7.9)" $ <cycles:transverse>
  For each first-sweep output in $cal(G)$, write $f^(*) = u + w$, where $u$ has constant value $S_B \/ \| F^(*) ∩ B \|$ on each $F^(*) ∩ B$. This is an orthogonal decomposition, $w$ has zero sum in each block, and
  $ parallel u parallel_2^2 = sum_B frac(S_B^2, \| F^(*) ∩ B \|) lt.eq frac(2, p L) sum_B S_B^2 . $
  Run $w$ through the second sweep. After the first $j gt.eq k$ coordinates, its expected value at each site is zero and the probability of availability is at least $p \/ 2$. Different level-$j$ blocks have evolved independently, so at the next merging pair the expected product of weights is zero. In the energy-loss formula the opposite flag multiplies each squared weight independently, with expectation at least $p \/ 2$. The expected energy hence contracts by $1 - p \/ 4$ for each of the last $d - k$ layers. The $u$ component cannot increase in norm. Using $parallel u_(upright("out")) + w_(upright("out")) parallel_2^2 lt.eq 2 parallel u_(upright("out")) parallel_2^2 + 2 parallel w_(upright("out")) parallel_2^2$, and monotonicity outside $cal(G)$, proves
  $ bb(E) parallel f_(2 d) parallel_2^2 lt.eq (M e^(- p L \/ 8) + 2 \( 1 - p \/ 4 \)^(d - k) + frac(4, p L)) parallel f_0 parallel_2^2 . quad "(7.10)" $ <cycles:centered-factor>
  Here $\( 1 - p \/ 4 \)^(d - k) lt.eq e^(- d \/ 128)$, and the other terms decay faster than $n^(- 1 \/ 256)$. Thus their sum is at most $n^(- 1 \/ 256)$ eventually. After $1024$ two-sweep blocks the energy is at most $n^(- 4)$; Lemma 21 proves the conclusion. ◻
]

=== 7.5 A recurrence for all large blocks <cycles:merge>

One can retain the block sums in the recurrence instead of separating them off. This yields a useful contraction for every fixed density of available positions.

#thm([Proposition 7.6.])[
  (Multilevel energy contraction).  #emph[Fix $p in \( 0 \, 1 \)$ and set $r = floor.l d \/ 2 floor.r$. For arbitrary $\| F \| gt.eq p n$ and zero-sum $f$, two sweeps satisfy 
$ bb(E) parallel f_(2 d) parallel_2^2 lt.eq (\( 1 - p \/ 4 \)^(d - r) + 2^(- r) + 2^(d - r) e^(- p 2^r \/ 8)) parallel f_0 parallel_2^2 . quad "(7.11)" $ <cycles:merge-factor>

 In particular the factor is at most $n^(- gamma_p)$ eventually, where $gamma_p = - 1 / 4 log_2 \( 1 - p \/ 4 \) > 0$. It is also at most $n^(- p \/ 16)$ eventually.]
] <cycles:merge-prop>

#proof[
  For level-$i$ blocks $B$ of size $2^i$, define
  $ S_i \( f \) = 2^(- i) sum_B (sum_(x in B) f \( x \))^2 . $
  The block statistics of Lemma 23, now applied at every level $i$, give
  $ bb(E) S_i \( f^(*) \) lt.eq 2^(- i) parallel f_0 parallel_2^2 \, #h(2em) Pr { upright("some level-") r upright(" block has density below ") p \/ 2 } lt.eq 2^(d - r) e^(- p 2^r \/ 8) . quad "(7.12)" $ <cycles:all-level-moments>
  Indeed each level-$i$ block meets every transverse fiber once. Lemma 23, summed over the $n \/ 2^i$ blocks, gives the first bound. For the second, its proof gives a sum of independent availability indicators of mean at least $p 2^r$; the Bernoulli lower-tail bound used in (7.9) and a union bound suffice.
  Condition now on $f^(*) \, F^(*)$ with all level-$r$ block densities at least $p \/ 2$. Their unions have the same lower density bound. In the second sweep, Lemma 24 therefore multiplies each child energy by at most $1 - p \/ 4$. Its signed cross term is bounded using $2 S_(B_0) S_(B_1) lt.eq S_(B_0)^2 + S_(B_1)^2$. Summing over merges of level-$i$ blocks, and writing $E_i$ for the energy after $i$ layers of this sweep, gives
  $ bb(E) \( E_(i + 1) divides f^(*) \, F^(*) \) lt.eq \( 1 - p \/ 4 \) bb(E) \( E_i divides f^(*) \, F^(*) \) + 1 / 2 S_i \( f^(*) \) \, #h(2em) r lt.eq i < d . $
  Iterate, discard the contraction factors on the nonnegative additive terms, use (7.12), and use pathwise monotonicity on the excluded event. The geometric sum $1 / 2 sum_(i = r)^(d - 1) 2^(- i) lt.eq 2^(- r)$ proves (7.11). Its first term is at most $n^(- 2 gamma_p)$; the other terms are $O \( n^(- 1 \/ 2) \)$ and exponentially small in $sqrt(n)$, respectively. Since $gamma_p < 1 \/ 2$, their sum is at most $n^(- gamma_p)$ eventually. Also the first term is at most $e^(- p d \/ 8) = n^(- p \/ \( 8 log 2 \))$, whose exponent exceeds $p \/ 16$, proving the alternative assertion. ◻
]

#prodef([Remark 7.7.])[
  (Translation symmetry and a variant of the error bound).  A completed block also has a distributional symmetry. After its $i$ internal coordinates have been processed, its flag-weight law is invariant under bit translations of those coordinates. Inductively, old-coordinate translations permute the fresh matching edges, while flipping the new coordinate preserves the independent fair placements and the equal outputs of averaging. The symmetry makes each site’s second moment the expected block energy divided by $2^i$.
  This supplies another derivation of (7.8), although the first-moment proof of Lemma 24 does not require it. It also permits the following version of the multilevel estimate. For the first-sweep output, $bb(E) sum_(B in cal(B)_i) S_B^2 lt.eq parallel f_0 parallel_2^2$ and $Pr \( m_B < p 2^i \/ 2 \) lt.eq e^(- p 2^i \/ 8)$. A union bound over every level $r lt.eq i < d$, followed by the exact merge identity and $2 S_(B_0) S_(B_1) lt.eq S_(B_0)^2 + S_(B_1)^2$, gives
  $ \( 1 - p \/ 4 \)^(d - r) + 2^(- r) + d n e^(- p 2^r \/ 8) lt.eq n^(- p \/ 16) quad "(7.13)" $ <cycles:invariance-factor>
  for large $d$. This is a slightly weaker error term than (7.11); both bounds condition on the full first-sweep output before using fresh, independent second-sweep blocks.
] <cycles:invariance>

=== 7.6 Negative correlation and block variances <cycles:negative>

The last two-sweep argument obtains first-sweep moments from pairwise negative correlation of card locations. It then contracts variance about the mean on the available positions of each block.

#thm([Proposition 7.8.])[
  (Variance contraction from pairwise correlation).  #emph[Fix $delta in \( 0 \, 1 \]$. For arbitrary $\| F \| gt.eq delta n$ and zero-sum $f$, there is $a = a \( delta \) > 0$ such that two sweeps satisfy $bb(E) parallel f_(2 d) parallel_2^2 lt.eq n^(- a) parallel f_0 parallel_2^2$ for all large $d$. One may take $a = - 1 / 8 log_2 \( 1 - delta \/ 4 \)$.]
] <cycles:negative-prop>

#proof[
  For a level-$s$ block $B$ put $p_B = \| B \| \/ n$. Membership in $B$ means that the last $d - s$ output bits equal its prescribed suffix. Every card has membership probability $p_B$. To compare two distinct cards, let $i$ be their largest initially differing coordinate. Before layer $i$, they use distinct switches, so their output bits are independent fair bits. At layer $i$ they use one switch exactly when their earlier output prefixes agree; that switch forces opposite outputs. After layer $i$ their prefixes are distinct, and they use distinct switches for the rest of the sweep.
  If $i lt.eq s$, the only possible shared switch is in an unconstrained coordinate. All prescribed suffix bits are then sampled at distinct switches, and joint membership has probability $p_B^2$. If $i > s$, condition on both cards having the prescribed outputs at coordinates $s + 1 \, dots.h \, i - 1$. Their first $s$ outputs remain independent uniform strings, so their prefixes agree with probability $2^(- s)$. On this event joint membership is impossible at layer $i$; off it both prescribed outputs occur with probability $1 \/ 4$. The remaining prescribed bits are again sampled at distinct switches. Thus joint membership has probability $p_B^2 \( 1 - 2^(- s) \) lt.eq p_B^2$. In either case the membership indicators have nonpositive covariance.
  Let $C$ be the covariance matrix of the membership indicators of all $n$ initial labels. Their sum is the fixed number $\| B \|$, so $C$ has zero row sums. Its off-diagonal entries are nonpositive, and its diagonal is at most $p_B$. Therefore
  $ v^T C v = sum_(x < y) \( - C_(x y) \) \( v_x - v_y \)^2 lt.eq 2 p_B sum_x v_x^2 . $
  Let $h_B$ count the cards that start in $F_0$ and end in $B$, and let $u_B$ be the sum of averaged loads there. It follows that
  $ bb(E) h_B = p_B \| F \| \, #h(2em) "Var" \( h_B \) lt.eq p_B \| F \| \, #h(2em) bb(E) u_B^2 lt.eq 2 p_B parallel f_0 parallel_2^2 . quad "(7.14)" $ <cycles:negative-moments>
  For the last estimate, give the card initially at $a in F_0$ the deterministic signed weight $f_0 \( a \)$, and give every observed card, initially outside $F_0$, weight zero. If $g_t$ is the actual position permutation, the transported load is $tilde(f)_t \( x \) = f_0 \( g_t^(- 1) x \)$, with $f_0$ extended by zero. Fix a feasible history $cal(H)$ of all observed-card trajectories through the first sweep. Lemma 2 leaves the unvisited switches independent and fair, including an earlier unvisited switch when later observed paths are specified. The additional step here is to apply that conditional-flow rule to arbitrary signed loads. At a pair with two available inputs, averaging that unvisited fair coin averages the two incoming expected loads. At a pair with one available input, the observed trajectory determines its available output, so its load is transported to that output. Induction over layers, using linearity for the signed weights, therefore gives
  $ f_t \( x \) = bb(E) \[ tilde(f)_t \( x \) divides cal(H) \] \, #h(2em) u_B = bb(E) #h(-1em) [sum_(a in F_0) f_0 \( a \) upright(bold(1))_({ g_d \( a \) in B }) thin mid(bar.v) thin cal(H)] . quad "(7.15)" $ <cycles:signed-load-jensen>
  Each initial label has probability $p_B$ of ending in $B$, and $sum_a f_0 \( a \) = 0$, so the unaveraged sum has mean zero and second moment $f_0^T C f_0 lt.eq 2 p_B parallel f_0 parallel_2^2$. Conditional Jensen proves the asserted bound for $u_B$ for every signed initial load.
  If $delta = 1$, every position is available, so one sweep applies all coordinate averages and sends the zero-sum vector to zero. The list statement then concerns the empty list and is exact. For the remaining argument assume $0 < delta < 1$.
  Put $s_0 = floor.l 3 d \/ 4 floor.r$. Chebyshev gives probability at most $4 \/ \( delta 2^s \)$ that a fixed level-$s$ block has $h_B < delta 2^s \/ 2$. There are $n \/ 2^s$ such blocks. Summing over $s gt.eq s_0$ bounds the failure probability by $O_delta \( n 2^(- 2 s_0) \) = O_delta \( n^(- 1 \/ 2) \)$. Condition on a first-sweep output outside that event. At a second-sweep merge of children $L \, R$ of size $m = 2^(s - 1)$, write $b_L = u_L \/ h_L$, $b_R = u_R \/ h_R$ for their means over available positions. Let $V_L \, V_R$ be their expected squared deviations from these means immediately before the merge, and $V_B$ the corresponding parent quantity. Subtracting the parent mean energy from the common block-merging identity, Lemma 24, gives
  $ V_B =  & (1 - frac(h_R, 2 m)) V_L + (1 - frac(h_L, 2 m)) V_R\
 & + (1 - frac(h_L + h_R, 2 m)) frac(h_L h_R, h_L + h_R) \( b_L - b_R \)^2 . quad "(7.16)" $ <cycles:variance-merge>
  To verify it, the premerge total energy is $V_L + V_R + h_L b_L^2 + h_R b_R^2$; the expected loss is $\[ h_R V_L + h_L V_R + h_L h_R \( b_L - b_R \)^2 \] \/ \( 2 m \)$. Subtract the parent mean term $\( h_L b_L + h_R b_R \)^2 \/ \( h_L + h_R \)$ to obtain the formula. All denominators are positive on the retained event.
  For $s > s_0$ the first two coefficients are at most $1 - delta \/ 4$. The last term is nonnegative and at most $u_L^2 \/ h_L + u_R^2 \/ h_R$. Iterating to the root, whose load mean is zero, bounds the final conditional energy by
  $ \( 1 - delta \/ 4 \)^(d - s_0) parallel f_0 parallel_2^2 + sum_(s = s_0)^(d - 1) frac(2, delta 2^s) sum_(\| B \| = 2^s) u_B^2 . $
  For each level (7.14) bounds the expectation of the inner sum by $2 parallel f_0 parallel_2^2$. Use monotonicity on the discarded event. The resulting two-sweep factor is
  $ \( 1 - delta \/ 4 \)^(d - s_0) + O_delta \( 2^(- s_0) \) + O_delta \( n 2^(- 2 s_0) \) . quad "(7.17)" $ <cycles:negative-factor>
  Its leading term is at most $n^(- 2 a)$ for the stated $a$, and the two other terms are $O_delta \( n^(- 3 \/ 4) \)$ and $O_delta \( n^(- 1 \/ 2) \)$. This proves the claim. By Lemma 21, any fixed $R$ with $a R > 3$ now suffices for the asserted large-list mixing. ◻
]

=== 7.7 From the two-sweep estimates to the full deck <cycles:two-sweep-completion>

The five energy estimates give different quantitative parameters for the abstract Fourier transfers, even when two total times coincide. We record the exact substitutions. For disjoint block subgroups $H_i = "Sym" \( D_i \)$, a subprobability $nu$ satisfying $nu \( g H_i \) lt.eq B \/ \[ G : H_i \]$ has

$ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq sqrt(r B C_s) thin D^(- \( 1 - \( s + 2 \) \/ r \) \/ 2) \, quad "(7.18)" $ <cycles:orbit-bound>

by Proposition 3.2 of [14]. Here $r$ is the number of blocks, $D = dim rho$, and $C_s$ is the reciprocal-degree constant defined in Section 6.3. That companion also proves two distinct central-projection bounds in Proposition 4.5 of [14]. For a probability $eta$ with the same caps they are

$ parallel hat(eta) \( rho \) parallel_(upright("op")) & lt.eq B C_s sqrt(r) thin D^(- 1 \/ 2 + \( s + 2 \) \/ r) \,\
parallel hat(eta) \( rho \) parallel_(upright("op")) & lt.eq B sqrt(r C_s) thin D^(- 1 \/ 2 + \( s + 2 \) \/ \( 2 r \)) . quad "(7.19)" $ <cycles:projector-op-one>

The first uses pointwise character control; the second uses cosetwise spectral projection. Both require one simultaneous cap for all the subgroups. Lemma 2.3 of [14] supplies it with the mass costs stated in Section 6.3.

#thm([Proposition 7.9.])[
  (Full-deck bounds from two sweeps).  #emph[Each row of Table 2 gives total-variation convergence of the full permutation law to uniform as $d arrow.r oo$, uniformly over deterministic initial decks.]
] <cycles:two-sweep-bounds>

In the table, $r$ counts equal label blocks, $T$ is the length of one shuffle block, and $ell$ counts independent shuffle blocks. For the multilevel row set

$ gamma = - 1 / 4 log_2 \( 127 \/ 128 \) \, #h(2em) h = ceil.l 6 \/ gamma ceil.r . $

In the translation row use $R = 128 dot.op 128$. In the negative-correlation row, $R$ is any fixed integer with $a \( 1 \/ 8 \) R > 3$, where $a$ is from Proposition 28. Each displayed Fourier bound is an operator-norm bound at irreducible degree $D$.

#figure(
  table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Input and retained measure
], table.cell(rowspan: 1, colspan: 1)[Transfer and Fourier bound
], table.cell(rowspan: 1, colspan: 1)[$ell$
], table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[Total time$\/ d$
]),
  table.cell(rowspan: 1, colspan: 1)[Input and retained measure
], table.cell(rowspan: 1, colspan: 1)[Transfer and Fourier bound
], table.cell(rowspan: 1, colspan: 1)[$ell$
], table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[Total time$\/ d$
],
  table.cell(rowspan: 1, colspan: 1)[Coarse energy, $T \/ d = 4096$; $r = 8$, probability, cap $2$
], table.cell(rowspan: 1, colspan: 1)[Orbit, (7.18), $s = 1$; $sqrt(16 C_1) D^(- 5 \/ 16)$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$- 3$
], table.cell(rowspan: 1, colspan: 1)[$32768$
],
  table.cell(rowspan: 1, colspan: 1)[Blockwise centered, $T \/ d = 2048$; $r = 16$, subprobability, cap $1$
], table.cell(rowspan: 1, colspan: 1)[Orbit, (7.18), $s = 4$; $sqrt(16 C_4) D^(- 5 \/ 16)$
], table.cell(rowspan: 1, colspan: 1)[$16$
], table.cell(rowspan: 1, colspan: 1)[$- 8$
], table.cell(rowspan: 1, colspan: 1)[$32768$
],
  table.cell(rowspan: 1, colspan: 1)[Multilevel, $p = 1 \/ 32$, $T \/ d = 2 h$; $r = 32$, cap-one subprobability, then restore uniform mass
], table.cell(rowspan: 1, colspan: 1)[Orbit, (7.18), $s = 8$; $sqrt(32 C_8) D^(- 11 \/ 32)$
], table.cell(rowspan: 1, colspan: 1)[$16$
], table.cell(rowspan: 1, colspan: 1)[$- 9$
], table.cell(rowspan: 1, colspan: 1)[$32 h$
],
  table.cell(rowspan: 1, colspan: 1)[Translation symmetry, $p = 1 \/ 128$, $T \/ d = 2 R$; $r = 128$, probability, cap $4$
], table.cell(rowspan: 1, colspan: 1)[Pointwise projector, (7.19), $s = 6$; $4 C_6 sqrt(128) D^(- 7 \/ 16)$
], table.cell(rowspan: 1, colspan: 1)[$16$
], table.cell(rowspan: 1, colspan: 1)[$- 12$
], table.cell(rowspan: 1, colspan: 1)[$524288$
],
  table.cell(rowspan: 1, colspan: 1)[Negative correlation, $delta = 1 \/ 8$, $T \/ d = 2 R$; $r = 8$, probability, cap $3$
], table.cell(rowspan: 1, colspan: 1)[Cosetwise projector, (7.19), $s = 2$; $3 sqrt(8 C_2) D^(- 1 \/ 4)$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$- 2$
], table.cell(rowspan: 1, colspan: 1)[$16 R$
],
),
  caption: [Table 3: Two-sweep inputs and their full-deck substitutions. The exponent $kappa$ is $2 - 2 ell alpha$ for an operator bound $K D^(- alpha)$. ],
)

#proof[
  The input marginal errors follow from Lemma 21. The coarse and centered bounds are those of Propositions 22 and 25. For the multilevel row, Proposition 26 gives energy $n^(- h gamma)$ and marginal error $epsilon_n lt.eq 1 / 2 n^(\( 3 - h gamma \) \/ 2) = o \( 1 \)$. For translation symmetry, (7.13) has exponent $p \/ 16 = 1 \/ 2048$, so $\( p \/ 16 \) R = 8$ and the marginal error is $1 / 2 n^(- 5 \/ 2)$. The last row has error $1 / 2 n^(\( 3 - a \( 1 \/ 8 \) R \) \/ 2) = o \( 1 \)$. Each bound is uniform, so any fixed partition into the indicated $r$ equal blocks supplies all the complementary marginals.
  Use the simultaneous trimming operations of Section 6.3. For the first row, excess trimming followed by normalization gives cap $2$ eventually. For the fourth and fifth, heavy-coset deletion and normalization give caps $4$ and $3$. These probability laws are within $o \( 1 \)$ of their original block laws. The second and third rows retain cap-one subprobabilities before their different completions.
  Substituting the table’s caps, block counts and reciprocal-degree parameters in the preceding three transfer formulas gives its Fourier bounds. The exponents $kappa$ follow from $D parallel M^ell parallel_(upright("HS"))^2 lt.eq D^2 parallel M parallel_(upright("op"))^(2 ell)$. Their sums tend to zero by the respective reciprocal-degree estimates at powers $1 \, 4 \, 8 \, 6 \, 2$ in [14] Theorem 6.3.
  For the multilevel row, the cap-one construction loses mass $delta lt.eq 32 epsilon_n$. Restore it as $eta = nu + delta U_G$. Every nontrivial Fourier matrix of $eta$ equals that of $nu$, so the table’s orbit bound still applies, and $parallel eta - mu parallel_(upright("TV")) lt.eq delta = o \( 1 \)$ for the original block law $mu$. Thus this row, like the first, fourth and fifth, meets the probability completion of Section 3.3: the original law has zero sign expectation, the nearby probability has sign coefficient $o \( 1 \)$, and replacing the fixed number of factors costs $o \( 1 \)$.
  The centered row instead convolves the cap-one subprobability itself. Write $z = nu \( G \) arrow.r 1$. Domination by the original unbiased-sign block law gives $\| hat(nu) \( "sgn" \) \| lt.eq 1 - z$. Its nonsign contribution is bounded by $\( 16 C_4 \)^16 sum_(D > 1) D^(- 8) = o \( 1 \)$. Equation (5.6) therefore gives $parallel nu^(* 16) - z^16 U_G parallel_1 = o \( 1 \)$. The positive difference $mu^(* 16) - nu^(* 16)$ has mass $1 - z^16 lt.eq 16 \( 1 - z \) = o \( 1 \)$, which restores the original probability law.
  Finally each block contains a whole number of sweeps, so the physical time is $ell T$, as tabulated. Translation by a deterministic initial deck preserves the distance from uniform. ◻
]

== 8 Autocorrelation and two independent shuffle blocks <cycles:autocorrelation-section>

Keeping the bitwise difference of two factors of the conditional weight gives another derivation of the scalar energy recurrence. For the final passage to the full group, we will use one measure capped on $g H_i$ and a second measure capped on $H_i g$. Reversing the coordinate schedule supplies the second measure; the original block law itself need not be invariant under inversion.

Let $q_d$ be the probability law on $G$ of one physical shuffle.

#thm([Theorem 8.1.])[
  (Two-block cyclic-schedule bound).  #emph[For the Thorp shuffle on $n = 2^d$ positions, 
$ parallel q_d^(* 2052 d) - U_G parallel_(upright("TV")) arrow.r 0 #h(2em) \( d arrow.r oo \) . $

 In particular $d lt.eq t_(upright("mix")) \( d \) lt.eq 2052 d$ for all sufficiently large $d$.]
] <cycles:sharp>

=== 8.1 The bitwise autocorrelation recurrence <cycles:autocorrelation>

Fix an ordered list of $q lt.eq 7 n \/ 8$ initial labels, observe the first $j < q$ cards, and use the centered conditional vector $f_t$ from (7.2). Write $O_t = V \\ F_t$ and $h \( t \)$ for the coordinate used from time $t$ to time $t + 1$. The schedule $h \( t \)$ can be any periodic ordering of all coordinates. Define

$ r_t = bb(E) parallel f_t parallel_2^2 \, #h(2em) v_t \( z \) = bb(E) sum_(x in V) f_t \( x \) f_t \( x xor z \) \, #h(2em) b_t = bb(E) sum_x f_t \( x \)^2 upright(bold(1))_({ x xor e_(h \( t \)) in O_t }) . quad "(8.1)" $ <cycles:autocorrelation-definition>

Here $xor$ is bitwise addition and $e_h$ is the unit bit vector. The signed row $v_t$ has total mass zero, since $sum_x f_t \( x \) = 0$, and $v_t \( 0 \) = r_t$. Let $L_h$ replace coordinate $h$ by an independent fair bit, as a kernel on the difference variable $z$.

#thm([Lemma 8.2.])[
  (Finite-memory identity).  #emph[For every $t gt.eq 0$, 
$ v_(t + 1) = v_t L_(h \( t \)) + 1 / 2 b_t \( delta_0 - delta_(e_(h \( t \))) \) . quad "(8.2)" $ <cycles:autocorrelation-update>

 Consequently, for $t gt.eq d$, 
$ r_t = sum_(ell = 1)^d 2^(- ell) b_(t - ell) . quad "(8.3)" $ <cycles:memory-equation>

]
] <cycles:memory>

#proof[
  Condition on the observed paths through $t$. Let $K_t$ be the random kernel from the old available set to the new one: its rows are uniform on pairs with two available endpoints and deterministic at a single available endpoint, with its destination specified by the fresh observed movement. Expand the autocorrelation of $f_t K_t$. This is a sum over two available starting endpoints $x \, y$, weighted by $f_t \( x \) f_t \( y \)$, of the law of the difference of two independent draws from their rows, conditional on $K_t$. For endpoints in distinct pairs, their fresh pair data are independent; after averaging the fresh coins, their difference has kernel $L_(h \( t \))$. For two endpoints in the same pair with two available inputs, including $x = y$, the two row draws are independent uniform draws, so the same conclusion holds. The only exception is $x = y$ with its partner observed. Both row draws then equal the same deterministic destination. Their difference is zero rather than the fair choice between $0$ and $e_(h \( t \))$. Summing these corrections gives (8.2).
  The product of all $d$ coordinate-reset kernels maps a signed row to its total mass times uniform; it therefore kills $v_(t - d)$. A correction created at step $s$, $t - d lt.eq s < t$, has not yet had its own coordinate reset again. Subsequent resets transfer a fraction $2^(- \( t - 1 - s \))$ of $delta_0$ to zero, and transfer none of $delta_(e_(h \( s \)))$ to zero. Including the prefactor $1 \/ 2$ and summing all $d$ corrections gives (8.3). ◻
]

#thm([Lemma 8.3.])[
  (Opposite-half control).  #emph[Put $theta = 15 \/ 16$ and $epsilon.alt_n = 2 e^(- n \/ 256)$. For $s gt.eq d$, 
$ b_s lt.eq theta r_s + epsilon.alt_n . quad "(8.4)" $ <cycles:blocked-bound>

 With $gamma = 63 \/ 64$, it follows that 
$ r_t lt.eq gamma^(t - 2 d) + frac(epsilon.alt_n, 1 - theta) quad \( t gt.eq 2 d \) \, #h(2em) r_(1026 d) lt.eq 2 n^(- 16) quad "(8.5)" $ <cycles:autocorrelation-energy>

 for all sufficiently large $d$.]
] <cycles:halves>

#proof[
  The autocorrelation notation has $r_t = a_t$ and $b_t = w_t$ from Section 3. There are at most $7 n \/ 8$ blockers, so Lemma 6 with $alpha = 1 \/ 8$ gives (8.4). Its independence step is the exact opposite-half identity
  $ bb(E) #h(-1em) [sum_(x in H_0) f_s \( x \)^2 upright(bold(1))_({ x xor e_(h \( s \)) in O_s }) thin mid(bar.v) thin cal(F)_(s - d + 1)] = frac(\| O_(s - d + 1) ∩ H_1 \|, n \/ 2) bb(E) #h(-1em) [sum_(x in H_0) f_s \( x \)^2 thin mid(bar.v) thin cal(F)_(s - d + 1)] \, quad "(8.6)" $ <cycles:half-factorization>
  where $H_0 \, H_1$ are the two coordinate-$h \( s \)$ halves. The conditioning time is just after that coordinate’s preceding update; only the subsequent independent arrays in the two halves are averaged here.
  Insert (8.4) into the autocorrelation memory identity. The comparison (3.5) applies with $rho = theta$, $eta = epsilon.alt_n$, $t_0 = 2 d$, and $gamma = 63 \/ 64$, since $theta \/ \( 2 gamma - 1 \) = 30 \/ 31 < 1$. This proves the first energy bound. At $t = 1026 d$, $gamma^(1024 d) lt.eq e^(- 16 d) lt.eq n^(- 16)$, and $epsilon.alt_n \/ \( 1 - theta \) lt.eq n^(- 16)$ eventually, giving the last bound. ◻
]

=== 8.2 Pointwise bounds with a predictable discard <cycles:predictable>

Expected total variation sufficed for the preceding proofs. For two blocks it is useful to retain a pointwise cap on a large subprobability. The discard must be made through events measurable from preceding paths.

#thm([Lemma 8.4.])[
  (Subprobability bound for a prescribed list).  #emph[Let $T = 1026 d$ and let the coordinate order be any periodic permutation of $1 \, dots.h \, d$. For all sufficiently large $d$ and every fixed list $a_1 \, dots.h \, a_q$ with $q lt.eq 7 n \/ 8$, there is an event $E$ with $Pr \( E^c \) lt.eq 2 n^(- 9)$ such that for every ordered distinct target tuple $\( y_1 \, dots.h \, y_q \)$, 
$ Pr \( E \, med X_T \( a_i \) = y_i med \( 1 lt.eq i lt.eq q \) \) lt.eq frac(\( 1 + n^(- 2) \)^q, \( n \)_q) \, #h(2em) \( n \)_q = n \( n - 1 \) dots.h.c \( n - q + 1 \) . quad "(8.7)" $ <cycles:pointwise-list>

]
] <cycles:list-cap>

#proof[
  For each $0 lt.eq j < q$, construct $f_T^(\( j \))$ by observing the first $j$ paths and centering the conditional law of card $j + 1$. Let $E_j = { max_x \| f_T^(\( j \)) \( x \) \| lt.eq n^(- 3) }$, an event measurable from those $j$ paths. The energy bound and Markov’s inequality give $Pr \( E_j^c \) lt.eq 2 n^(- 10)$. Take $E = ⋂_(j < q) E_j$.
  To bound the probability for the first $j + 1$ targets and events $E_0 \, dots.h \, E_j$, condition on the first $j$ trajectories. The preceding target constraints and those events are measurable there. On $E_j$ the next target has conditional probability at most
  $ frac(1, n - j) + n^(- 3) lt.eq frac(1 + n^(- 2), n - j) . $
  After applying this upper bound, drop $E_j$ and repeat for the preceding $j$ targets and events. Induction gives (8.7). This argument retains subprobabilities throughout; it never asserts that the one-card estimates survive conditioning on the entire event $E$. ◻
]

#thm([Lemma 8.5.])[
  (Separate bounds for multiplication on each side).  #emph[Let $mu = q_d^(* T)$, $T = 1026 d$, and partition $V$ into eight sets $D_i$ of size $n \/ 8$, with $H_i = "Sym" \( D_i \)$ fixing the complement. There are subprobabilities $alpha \, beta lt.eq mu$, each of mass $1 - O \( n^(- 9) \)$, whose densities $A \, B$ with respect to uniform measure on $G$ satisfy 
$ integral_(H_i) A \( h^(- 1) g \) thin d h lt.eq 2 \, #h(2em) integral_(H_i) B \( g h^(- 1) \) thin d h lt.eq 2 quad \( g in G \, med 1 lt.eq i lt.eq 8 \) . quad "(8.8)" $ <cycles:two-sided-density>

 All subgroup integrals use normalized counting measure.]
] <cycles:two-sided-cap>

#proof[
  For each $i$ take a fixed ordered list of the complement of $D_i$ and apply Lemma 33 in the same forward shuffle space. Intersect the eight retained events and let $beta$ be the law of the endpoint permutation on this intersection. Its lost mass is at most $16 n^(- 9)$. The image constraints are the coset $g H_i$, so inclusion and (8.7) give
  $ beta \( g H_i \) lt.eq frac(\( 1 + n^(- 2) \)^(7 n \/ 8), \[ G : H_i \]) . $
  Since $\( 1 + n^(- 2) \)^(7 n \/ 8) lt.eq 2$ for large $n$, this is the second cap.
  For the first cap, use the law of the inverse permutation. A physical $T$-step block is a product of complete cyclic coordinate sweeps with no residual rotation. Every matching layer is an involution, and all layers are independent; hence its inverse law is generated by the same layers in reverse order. The reversed order is again a periodic coordinate schedule, to which Lemma 33 applies. Intersect its eight events, producing a subprobability $tilde(alpha) lt.eq cal(L) \( g^(- 1) : g tilde.op mu \)$, then push it forward under inversion to obtain $alpha lt.eq mu$. The image constraint for $g^(- 1)$ becomes the preimage constraint for $g$, whose fiber is $H_i g$. Consequently $alpha \( H_i g \) lt.eq 2 \/ \[ G : H_i \]$, the first cap. To check the density normalization explicitly,
  $ integral_(H_i) A \( h^(- 1) g \) thin d h = \[ G : H_i \] alpha \( H_i g \) \, #h(2em) integral_(H_i) B \( g h^(- 1) \) thin d h = \[ G : H_i \] beta \( g H_i \) . $
  Thus the two laws may differ, but each is dominated by the same physical block law, on the required side of multiplication. ◻
]

=== 8.3 Completing the two-block argument <cycles:two-block-completion>

The remaining step uses precisely the opposite-side caps just proved. For a density $A$ relative to $U_G$, write $hat(A) \( rho \) = integral_G A \( g \) rho \( g \) thin d U_G \( g \)$, so if $A$ is the density of $alpha$ this is exactly the mass transform $hat(alpha) \( rho \)$. Use the same convention for $B$ and $beta$. Density convolution is $B * A \( g \) = integral_G B \( h \) A \( h^(- 1) g \) thin d U_G \( h \)$; thus $accent(B * A, ̂) \( rho \) = hat(B) \( rho \) hat(A) \( rho \)$. The two-sided transfer, Theorem 8.5 of [14], applies to the two nonnegative densities of mass at most one because Lemma 34 gives

$ integral_(H_i) A \( h^(- 1) g \) thin d h lt.eq 2 \, #h(2em) integral_(H_i) B \( g h^(- 1) \) thin d h lt.eq 2 quad \( g in G \, med 1 lt.eq i lt.eq 8 \) . $

Its conclusion is

$ D_lambda parallel hat(B) \( lambda \) hat(A) \( lambda \) parallel_(upright("HS"))^2 lt.eq 4 K_lambda^2 D_lambda^(- 1 \/ 2) . quad "(8.9)" $ <cycles:two-sided-fourier-bound>

Here $D_lambda$ is the irreducible dimension and $K_lambda$ counts its distinct joint irreducible types on $H_1 times dots.h.c times H_8$, each type once regardless of multiplicity. Separately, put $k = n - max \( lambda_1 \, lambda'_1 \)$. Lemma 8.1 of [14] gives, for these eight disjoint block subgroups,

$ K_lambda lt.eq (sum_(j = 0)^k p \( j \))^8 \, #h(2em) sum_(lambda eq.not \( n \) \, \( 1^n \)) K_lambda^2 D_lambda^(- 1 \/ 2) = o \( 1 \) \, $

where $p \( j \)$ is the partition number. An image marginal on only one side would not justify the two-sided transfer.

#proof[
  Let $mu = q_d^(* 1026 d)$, where $q_d$ is the law of one physical shuffle. Lemma 34 gives $alpha \, beta lt.eq mu$, each of mass at least $1 - 16 n^(- 9)$. Thus $beta * alpha lt.eq mu * mu$ has mass $1 - O \( n^(- 9) \)$; its density relative to uniform is $B * A$, with transform $hat(B) \( lambda \) hat(A) \( lambda \)$. The displayed product bound and weighted reciprocal sum show that all nontrivial, nonsign Plancherel terms sum to $o \( 1 \)$. The trivial coefficient is the total mass, which tends to one. The law $mu$ has zero sign expectation, and domination implies $\| hat(alpha) \( "sgn" \) \| \, \| hat(beta) \( "sgn" \) \| lt.eq 16 n^(- 9)$. Their product therefore also tends to zero. Plancherel gives $parallel B * A - 1 parallel_(L^2 \( U_G \)) = o \( 1 \)$, and Cauchy–Schwarz gives the same in $L^1 \( U_G \)$. Restoring the missing $O \( n^(- 9) \)$ mass proves $parallel mu * mu - U_G parallel_(upright("TV")) = o \( 1 \)$.
  The block length is a multiple of $d$, so $mu * mu = q_d^(* 2052 d)$ in physical time. Translation by any initial deck preserves the conclusion. The support bound from the opening argument gives $t_(upright("mix")) \( d \) gt.eq d$ for large $d$, completing the stated two-sided estimate. ◻
]

== 9 Contraction over coordinate sweeps <sweeps:section>

The block moments and merge identity of Section 7.3 apply to every deterministic signed input. Here we sharpen their two-sweep bounds and then compute the entire one-sweep quadratic form by a collision coupling. The latter retains the densities in the sister blocks met by a pair of walkers. For a random initial list those densities are balanced at each fixed time, yielding a different averaged contraction. We also record the layer-by-layer alternative supplied by refreshed coordinate halves.

=== 9.1 Energy and sequential revelation <sweeps:mass-section>

We use the signed-weight process of Section 7.1, with the coordinate order $1 \, dots.h \, d$. To distinguish a realized energy from its expectation, write $H_t$ for the available set, $x_t$ for the signed vector, and $E_t = parallel x_t parallel_2^2$. For a tagged card after preceding paths are exposed,

$ x_t = p_t - \| H_t \|^(- 1) upright(bold(1))_(H_t) . $

This is the vector $f_t$ of Section 3. Its conditional law $p_t$ is defined given the exposed paths, but its value at time $t$ is computed from their prefixes. All expectations below average those paths under the original shuffle law. We also use deterministic zero-sum signed inputs, for which $E_t lt.eq E_0$ pathwise.

#thm([Lemma 9.1.])[
  (Sequential comparison).  #emph[Suppose that for every preceding set in an ordered list of $k$ cards, the corresponding tagged process satisfies $bb(E) E_T lt.eq a$. Then the joint endpoint law of the list has total-variation distance at most $k sqrt(n a) \/ 2$ from the uniform injection. The same conclusion holds after averaging over a random ordered list if the energy bounds hold in that average.]
] <sweeps:sequential>

#proof[
  The conditional one-card error is $bb(E) parallel x_T parallel_1 \/ 2 lt.eq sqrt(\| H_T \| bb(E) E_T) \/ 2 lt.eq sqrt(n a) \/ 2$. Lemma 3 sums these errors, first coarsening the preceding paths to their endpoints. Averaging the resulting inequality over the initial list gives the last assertion. ◻
]

=== 9.2 Completed-sweep symmetry and explicit bounds <sweeps:blocks>

Retain the level-$j$ blocks $cal(B)_j$ of Section 7.3. For the output of a first sweep, put $M_B = sum_(u in B) x \( u \)$ and $h_B = \| H ∩ B \|$. Thus $M_B \, h_B$ are the quantities denoted $S_B \, m_B$ in Lemma 23. Before applying their moment bounds again, we give a second proof that identifies a symmetry of the whole output law. This symmetry will be strengthened in Section 10.

#proof[
  #emph[A symmetry proof of Lemma 23.] Fix $B in cal(B)_j$, put $s = 2^j$, and let $m$ be the conserved number of available positions. Immediately after updating coordinate $t$, the law is invariant under swapping any chosen set of its matching edges: edges with one available position have independent symmetric outputs and outputs on edges with two available positions are equal. A symmetry that preserves the later matchings remains a symmetry through the later updates. In particular, after a sweep its law is invariant under independently translating the suffix $\( j + 1 \, dots.h \, d \)$ at each fixed length-$j$ prefix. To verify this assertion, flip one coordinate $t > j$ on all sites with a given prefix. This is a union of coordinate-$t$ edges, and it preserves every later matching. Such flips generate all the asserted suffix translations.
  Apply independent uniform suffix translations to an already completed configuration. Conditional on that configuration, the entries selected for $B$ sample one site uniformly and independently from each prefix fiber. Their signed sum has mean zero and variance at most $s E_0 \/ n$; their available count is a sum of independent indicators with mean $m s \/ n$. The translated configuration has the original law, so the same variance and exponential-moment estimates prove the lemma. This argument establishes the needed transitivity without asserting independence among the entries of the original completed sweep. ◻
]

#thm([Proposition 9.2.])[
  (Uniform two-sweep bound).  #emph[Fix $0 < epsilon lt.eq 1$ and put $h = floor.l d \/ 2 floor.r$, $sigma = 1 - epsilon \/ 4$. For deterministic zero-sum signed mass supported on at least $epsilon n$ available positions, two sweeps satisfy 
$ bb(E) E_(2 d) lt.eq E_0 [sigma^(d - h) + 2^(- h) + \( d + 1 \) n e^(- epsilon^2 2^h \/ 2)] . quad "(9.1)" $ <sweeps:two-sweep-explicit>

 In particular, for every $0 < b < min { - 1 / 2 log_2 \( 1 - epsilon \/ 4 \) \, 1 / 2 }$, $bb(E) E_(2 d) lt.eq n^(- b) E_0$ for all sufficiently large $d$. For $epsilon = 1 \/ 16$, one may take $b = 1 \/ 200$.]
] <sweeps:two-sweep>

#proof[
  Call the first-sweep output good if every block of level at least $h$ has available-position density at least $epsilon \/ 2$. Lemma 23 and a union bound give the displayed exceptional probability. Conditional on a good output, let $F_j$ be the expected energy after $j$ layers of the second sweep. The merging identity and $2 M_1 M_2 lt.eq M_1^2 + M_2^2$ give
  $ F_(j + 1) lt.eq sigma F_j + 2^(- j - 1) sum_(B in cal(B)_j) M_B^2 \, #h(2em) h lt.eq j < d . $
  We have $F_h lt.eq E_0$ and $bb(E) sum_(B in cal(B)_j) M_B^2 lt.eq E_0$ by (7.7). Iterate the inequality, bound its geometric weights by one, and sum $sum_(j = h)^(d - 1) 2^(- j - 1) lt.eq 2^(- h)$. On the exceptional event use $E_(2 d) lt.eq E_0$. This proves (9.1). Its first term has exponent $- 1 / 2 log_2 sigma$, its second has exponent $1 \/ 2$, and the final term decays faster than every power of $n$. For $epsilon = 1 \/ 16$, $- 1 / 2 log_2 \( 63 \/ 64 \) > 1 \/ 200$, proving the last assertion. ◻
]

Two variants of the displayed bound retain useful quantitative information. The symmetry proof and the count of fewer than $2 n$ blocks replace the last term by $2 n exp \[ - c epsilon 2^h \]$, with $c = 1 \/ 2 - e^(- 1)$. For $epsilon = 1 \/ 8$, starting the second-sweep recursion at $ceil.l d \/ 2 ceil.r$ gives the more explicit estimate

$ frac(bb(E) E_(2 d), E_0) lt.eq \( 31 \/ 32 \)^(floor.l d \/ 2 floor.r) + 16 n^(- 1 \/ 2) + 32 n e^(- sqrt(n) \/ 64) lt.eq n^(- 1 \/ 100) quad "(9.2)" $ <sweeps:eighth-bound>

for sufficiently large $d$ (the ratio is interpreted only when $E_0 > 0$; when $E_0 = 0$ all energies vanish). Indeed a fixed block of size $s$ has failure probability at most $e^(- s \/ 64)$ by the Bernoulli lower-tail bound, and the per-layer errors are $E_0 \/ \( 2 s \) + n E_0 e^(- s \/ 64)$. Their geometric sum is bounded using $\( 1 - 31 \/ 32 \)^(- 1) = 32$.

Because the two-sweep estimate is uniform in the deterministic input, it can be iterated conditionally. With $epsilon = 1 \/ 16$ and $r = 2048$, after $2 r$ sweeps the tag energy is at most $n^(- r \/ 200)$ in expectation. Hence Lemma 35 gives uniformly, for every list of at most $15 n \/ 16$ cards, endpoint distance at most

$ 1 / 2 n^(3 \/ 2 - r \/ 400) = o \( 1 \) . quad "(9.3)" $ <sweeps:colored-marginal>

Similarly, (9.2) gives the uniform $7 n \/ 8$-card marginal estimate after $2 r$ sweeps for any fixed integer $r > 300$.

=== 9.3 An exact collision formula <sweeps:collision-section>

The preceding proof bounds a merge directly. The next calculation instead computes the complete one-sweep quadratic form by coupling two conditional walkers. It retains more information about the initial available-position configuration. For $u in V$, let $C_j \( u \)$ be its level-$j$ block. For an available set $H$ and $B in cal(B)_i$, define

$ s_H \( B \) = product_(j = i + 1)^d \( 1 - eta_j \( B \) \/ 2 \) \, #h(2em) eta_j \( B \) = frac(\| H ∩ \( C_j \( u \) \\ C_(j - 1) \( u \) \) \|, 2^(j - 1)) quad \( u in B \) . $

The blocks in this formula are independent of the choice of $u in B$. For a singleton ${ u }$ use $i = 0$, and an empty product is one.

#thm([Lemma 9.3.])[
  (One-sweep collision identity).  #emph[For deterministic $\( H \, x \)$ at the start of a sweep, 
$ bb(E) E_d =  & sum_(u in H) s_H \( { u } \) x \( u \)^2\
 & + sum_(i = 1)^d 2^(1 - i) sum_(B in cal(B)_i) s_H \( B \) x \( B_0 \) x \( B_1 \) \, quad "(9.4)" $ <sweeps:collision-eq>

 where $x \( A \) = sum_(u in A) x \( u \)$ and $B_0 \, B_1$ are the children of $B$.]
] <sweeps:collision>

#proof[
  Given the complete exposed paths, let $M \( u \, v \)$ be the conditional transition probability for a hidden tag from $u$ to $v$. Linearity of the signed flow gives
  $ x_d \( v \) = sum_(u in H) x \( u \) M \( u \, v \) . $
  Consequently the coefficient $bb(E) sum_v M \( u \, v \) M \( z \, v \)$ in its expected squared norm is a collision probability: sample the exposed paths with their actual law, and then sample two walkers independently conditional on those paths, starting at $u \, z in H$.
  We analyze this joint law chronologically. Generate the physical switches and the resulting available sets in layer order. On a pair with one available input, both walkers use its forced available output if they are there. On a pair with two available inputs, each walker uses its own extra fair coin, independent of every physical switch and of the other walker’s coins. Conditional on the complete exposed paths, this construction gives exactly two independent copies of $M$, by Lemma 2. In the following calculation we average over the paths; we do not retain full-path conditioning when invoking independence of physical switch arrays.
  For $u eq.not z$, let $i$ be their largest differing coordinate, and for $u = z$ put $i = 0$. Before coordinate $i$, they use distinct matching pairs. Each updated bit is fair, and the two bits are independent given the preceding chronological history. If their first $i - 1$ outputs agree, their coordinate-$i$ inputs form a pair of available sites. Their independent auxiliary choices then agree with probability $1 \/ 2$. Their probability of agreement through coordinate $i$ is therefore $2^(- i)$.
  Now take $j > i$. Reveal the physical switches in the block $C_(j - 1) \( u \)$ during its first $j - 1$ layers and the auxiliary choices of both walkers through that time. Their histories are confined to this block, so this information determines whether they agree and, on agreement, their common address. No switches in its sister block $C_j \( u \) \\ C_(j - 1) \( u \)$ have been revealed. Those switches are independent of the revealed information. Each site of the sister block has expected availability equal to its initial density $eta_j \( C_i \( u \) \)$, since its first $j - 1$ coordinate averages have all been applied. This holds in particular at the now determined partner address.
  If that partner is unavailable, the common input has a forced output and the walkers stay together. If it is available, their independent auxiliary choices agree with probability $1 \/ 2$. Hence each level $j > i$ contributes the factor $1 - eta_j \( C_i \( u \) \) \/ 2$. Any disagreement in a processed coordinate is permanent within the sweep. Multiplying the successive conditional probabilities gives
  $ bb(E) sum_v M \( u \, v \) M \( z \, v \) = 2^(- i) s_H \( C_i \( u \) \) \, $
  including $i = 0$. Group the ordered off-diagonal pairs by their largest differing coordinate. The two orders of each pair give the coefficient $2^(1 - i)$ in (9.4). ◻
]

#thm([Proposition 9.4.])[
  (Averaged two-sweep contraction).  #emph[Choose the initial ordered card list uniformly and independently of all switches. Fix an exposure index with $m gt.eq epsilon n$ available positions, where $epsilon = 1 \/ q$ and $q$ is a fixed power of two. Put $b = floor.l d \/ 2 floor.r$ and 
$ Delta_n = 2 n \( n + 1 \) exp \[ - epsilon \( 1 \/ 2 - e^(- 1) \) 2^b \] . $

 At sweep boundaries $t$, the tag process obeys 
$ bb(E) E_(t + 2 d) lt.eq Delta_n + [\( 1 + b \/ 2 \) \( 1 - epsilon \/ 4 \)^(d - b) + 2^(- b)] bb(E) E_t . quad "(9.5)" $ <sweeps:averaged-recursion>

 With $q = 128$, $R = 128 q$, and $T = 2 R d$, $bb(E) E_T lt.eq n^(- 8) + R Delta_n$. Consequently the average endpoint TV distance of an ordered list of $n - n \/ q$ cards tends to zero.]
] <sweeps:averaged>

#proof[
  At every fixed time the available set is a uniform $m$-subset: after fixing all switches the shuffle is a permutation independent of the random initial list. This is an unconditional statement. Call an available set good if every block of level at least $b$ has density at least $epsilon \/ 2$. It suffices by coupling to consider $m = epsilon n$. A Bernoulli-$epsilon$ subset conditioned on size $epsilon n$ is uniform, and this conditioning event has probability at least $1 \/ \( n + 1 \)$ because $epsilon n$ is a mode of the binomial distribution. The exponential-moment estimate in Lemma 23, followed by a union bound over fewer than $2 n$ blocks, gives $Pr \( H_t upright(" not good") \) lt.eq Delta_n$.
  Put $w = x_(t + d)$. On a good second-sweep input, $s_(H_(t + d)) \( B \) lt.eq \( 1 - epsilon \/ 4 \)^(d - b)$ for every level at most $b$. In (9.4) use $2 w \( B_0 \) w \( B_1 \) lt.eq w \( B_0 \)^2 + w \( B_1 \)^2$. At levels $1 lt.eq i lt.eq b$, $sum_(C in cal(B)_(i - 1)) w \( C \)^2 lt.eq 2^(i - 1) parallel w parallel_2^2$; each such level contributes at most half the common factor times energy. The remaining levels contribute at most $sum_(i = b + 1)^d 2^(- i) sum_(C in cal(B)_(i - 1)) w \( C \)^2$. On failure of goodness, use $E_(t + 2 d) lt.eq 1$. Apply the block-variance bound conditionally over the first sweep to each last sum; after summing over a partition its expectation is at most $bb(E) E_t$. This proves (9.5) without assuming that energy and goodness are independent.
  For $gamma = epsilon \/ 16$, the bracket is at most $n^(- gamma)$ for all sufficiently large $d$: its first term is at most $\( 1 + b \/ 2 \) e^(- epsilon d \/ 8)$ and its second is at most $2 n^(- 1 \/ 2)$. Iteration through $R$ sweep pairs gives $bb(E) E_T lt.eq n^(- R gamma) + R Delta_n = n^(- 8) + R Delta_n$. The last term decreases faster than every power of $n$. Lemma 35, averaged over lists, now proves the assertion. ◻
]

=== 9.4 Refreshing coordinate halves <sweeps:refresh-section>

A separate argument contracts energy after each layer following an initial $2 d$ delay. It is useful when one wants estimates uniform over the initial list without first grouping layers into two-sweep blocks. Write $i_t = 1 + \( t med mod med d \)$ and use the coordinate averages $P_i$ of Section 3. Let $cal(F)_t$ contain all switch outcomes strictly before layer $t$. The path-defined signed-mass process is adapted to this larger filtration. Its defining conditional card law still conditions only on exposed paths, not on all variables in $cal(F)_t$.

#thm([Lemma 9.5.])[
  (Noise and refreshed balance).  #emph[For the tagged-card difference $x_t = p_t - m^(- 1) upright(bold(1))_(H_t)$ with a fixed initial hidden set of size $m gt.eq epsilon n$, so that $E_0 lt.eq 1$, put $a_t = bb(E) E_t$ and $I_t = sum_u x_t \( u \)^2 upright(bold(1))_({ u xor e_(i_t) in.not H_t })$. Then 
$ a_t = sum_(j = 1)^d 2^(- j) bb(E) I_(t - j) quad \( t gt.eq d \) . quad "(9.6)" $ <sweeps:noise-identity>

 For $t gt.eq d$, each of the following choices gives $bb(E) I_t lt.eq gamma a_t + B_n$: 
$ & gamma & B_n\
upright("available count") & 1 - epsilon \/ 2 & 2 e^(- epsilon n \/ 8)\
upright("blocker count") & 1 - epsilon \/ 2 & 2 e^(- epsilon^2 n \/ 4) . $

 For either choice, every $1 \/ 2 < beta < 1$ with $2 beta - 1 gt.eq gamma$ satisfies 
$ a_t lt.eq beta^(t - 2 d) + B_n \/ \( 1 - gamma \) #h(2em) \( t gt.eq 0 \) . quad "(9.7)" $ <sweeps:refresh-bound>

]
] <sweeps:refresh>

#proof[
  Apply Lemma 5 with $f_t = x_t$, $V_t = H_t$, and $w_t = bb(E) I_t$ to obtain (9.6). The opposite-half factorization of Lemma 16 holds also with the larger past field $cal(F)_(t - d + 1)$: after that time the two halves use independent fresh switch arrays, and the path-defined vector in either half is a function of its own array. It remains to supply a lower bound on both available densities at that conditioning time.
  The available-count argument in the proof of Lemma 17 bounds the chance that either half has fewer than $m \/ 4$ available positions by $2 e^(- m \/ 8) lt.eq 2 e^(- epsilon n \/ 8)$. Off that event, both densities are at least $epsilon \/ 2$. The factorization and $E_t lt.eq 1$ on the exception give the first row. For the second row, Lemma 6 with $alpha = epsilon$ gives $bb(E) I_t lt.eq \( 1 - epsilon \/ 2 \) a_t + 2 e^(- epsilon^2 n \/ 4) E_0$; use $E_0 lt.eq 1$.
  Finally use (3.5) with $rho = gamma$, $eta = B_n$, $t_0 = 2 d$, and decay parameter $beta$. Its condition $rho \/ \( 2 beta - 1 \) lt.eq 1$ is exactly the stated hypothesis. ◻
]

For the blocker-count form, retain the explicit choices $epsilon = 1 \/ 32$, $beta = 1 - epsilon \/ 8$, and $T = 2048 d$. Then $beta^(T - 2 d) lt.eq n^(- 5)$, and Lemma 35 gives $o \( 1 \)$ uniformly for all lists of at most $31 n \/ 32$ cards. For the available-count form, take $epsilon = 1 \/ 128$, $beta = 1 - epsilon \/ 4$, and any integer $b_0 > 2$ with $beta^(b_0 - 2) lt.eq 2^(- 6)$. At $T = b_0 d$ the per-tag expected TV error is $o \( n^(- 1) \)$, hence every list of $127 n \/ 128$ cards has $o \( 1 \)$ endpoint error. The tail estimates above give both refreshed-balance bounds.

=== 9.5 Two ways to dominate complementary cosets <sweeps:truncation>

Let $G = S_n$ and partition the input positions into $q$ equal sets $A_1 \, dots.h \, A_q$. Let $K_i = "Sym" \( A_i \)$ fix the complement pointwise. The coset $g K_i$ specifies exactly the images of positions outside $A_i$. A uniform law on $G$ induces the uniform injection on those images.

The uniform marginal bounds above therefore give the hypothesis of the simultaneous trimming lemma [14] Lemma 2.3 for every fixed equal partition. For the averaged estimate of Proposition 38, choose a uniform random partition first: each complementary list is uniform, up to irrelevant ordering, so the expected sum of its $q$ marginal TV errors is $o \( 1 \)$. At least one deterministic partition has sum $o \( 1 \)$, and we fix it. For clarity, the clipping is as follows. Discard all cosets in any system whose original mass exceeds twice their uniform mass. The mass in such cosets is at most twice the corresponding marginal TV error. The union therefore has mass $delta = o \( 1 \)$. Conditioning the original law $mu$ on its complement gives a probability $nu$ with

$ d_(upright("TV")) \( mu \, nu \) = delta \, #h(2em) nu \( g K_i \) lt.eq A \/ \[ G : K_i \] . quad "(9.8)" $ <sweeps:coset-bound>

One may take $A = 3$ for sufficiently large $d$, or the convenient $A = 4$. The original permutation has unbiased sign, since toggling one fixed fair switch toggles parity. Thus

$ \| bb(E)_nu "sgn" \| lt.eq delta \/ \( 1 - delta \) . quad "(9.9)" $ <sweeps:sign>

This records the cap and retained mass needed for the applications below.

There is also a direct path-event construction of coset domination, which uses the stronger conditional energy estimate rather than marginal TV.

#thm([Proposition 9.6.])[
  (Trajectory-event truncation).  #emph[Use $q = 16$ blocks, let $b$ be any exponent allowed by Proposition 36 for $epsilon = 1 \/ 16$, and take an integer $k$ with $b k gt.eq 12$. For the shuffle law $mu$ after $T = 2 k d$ steps, there is a probability $nu$ and $theta = 1 - delta$ such that 
$ delta lt.eq 16 n^(5 - b k) \, #h(2em) d_(upright("TV")) \( mu \, nu \) lt.eq delta \, #h(2em) \( nu * U_(K_i) \) \( g \) lt.eq e \/ \( theta \| G \| \) quad \( i \, g \) . $

 Moreover $\| bb(E)_nu "sgn" \| lt.eq delta \/ theta$.]
] <sweeps:path-truncation>

#proof[
  For each complement fix an ordering $z_1 \, dots.h \, z_(n - n \/ 16)$. For its $j$th card let $G_(i \, j)$ be the event that the conditional final energy given the preceding paths is at most $n^(- 4)$. The iterated energy bound and Markov’s inequality give $Pr \( G_(i \, j)^c \) lt.eq n^(4 - b k)$. The event is measurable from those preceding paths. On it each conditional endpoint probability is at most
  $ \( n - j + 1 \)^(- 1) + n^(- 2) lt.eq frac(1 + 1 \/ n, n - j + 1) . $
  Intersect all these events over the sixteen orderings, obtaining $G_(*)$ with probability $theta$ and the stated bound on $delta$.
  Fix one ordering and a tuple of distinct target endpoints. Drop the events from the other orderings. Condition on the first $j - 1$ full paths to bound the last target endpoint on $G_(i \, j)$; then drop $G_(i \, j)$ and repeat backwards. Every conditioning uses the original shuffle law and an event measurable from the preceding paths. The probability of the target tuple together with $G_(*)$ is consequently at most
  $ frac(\( 1 + 1 \/ n \)^(n - n \/ 16), \( n \)_(n - n \/ 16)) lt.eq frac(e, \( n \)_(n - n \/ 16)) . $
  Let $nu$ be the endpoint law conditional on the trajectory event $G_(*)$. Right convolution by $U_(K_i)$ fills each endpoint fiber uniformly, and each fiber has $\( n \/ 16 \) !$ elements. This gives the density bound. Conditioning on an event of probability $theta$ changes TV by at most $delta$; the zero sign mean under $mu$ gives the final estimate by splitting its expectation over $G_(*)$ and its complement. ◻
]

=== 9.6 The representation inputs and their substitutions <sweeps:transfer-inputs>

The input just obtained is a common coset cap for one probability law $nu$, together with a small sign coefficient. The transfers we use have different norm conclusions. We state them explicitly so that the following parameter choices can be checked without reconstructing the companion’s conventions.

For $u > 0$, write

$ C_u = sup_(a gt.eq 1) sum_(tau in "Irr" \( S_a \)) \( dim tau \)^(- u) . $

The degree results in [14] Lemma A.2 and Theorem 6.3 give $C_u < oo$ and

$ sum_(lambda tack.r n \, thin lambda in.not { \( n \) \, \( 1^n \) }) \( dim lambda \)^(- u) arrow.r 0 #h(2em) \( n arrow.r oo \) . quad "(9.10)" $ <sweeps:degree-input>

Only the exponents $2 \, 4 \, 12 \, 30 \, 32$ will occur below. The sharper classical estimate of Liebeck and Shalev is, for each fixed $u > 0$,

$ sum_(lambda tack.r a) \( dim lambda \)^(- u) = 2 + O \( a^(- u) \) #h(2em) \( a arrow.r oo \) \, quad "(9.11)" $ <sweeps:LS>

by [7] Theorem 2.6.

Suppose $K_1 \, dots.h \, K_q$ permute disjoint equal blocks and $nu \( g K_i \) lt.eq A \/ \[ G : K_i \]$. For a unitary irreducible $rho$ of degree $D$, use the mass Fourier transform $hat(nu) \( rho \) = sum_g nu \( g \) rho \( g \)$ and the unnormalized Hilbert–Schmidt norm. The orbit-span transfer gives

$ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq sqrt(A q C_u) thin D^(- 1 \/ 2 + \( u + 2 \) \/ \( 2 q \)) . quad "(9.12)" $ <sweeps:op-bound>

This is Proposition 3.2 of [14]. The coefficient-evaluation transfer [14] Proposition 4.2 gives the same bound at $u = 2$: its evaluation constant is the sum of squared degrees of block types of degree at most $D^(1 \/ q)$, which is at most $C_2 D^(4 \/ q)$. It counts each irreducible coefficient space once, regardless of its multiplicity in $rho$. The pointwise-character and coset-Plancherel arguments instead give

$ parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 & lt.eq A^2 q C_u D^(- 1 + \( u + 4 \) \/ q) \,\
parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 & lt.eq A q C_u D^(- 1 + \( u + 2 \) \/ q) \, quad "(9.13)" $ <sweeps:pointwise-HS-eq>

respectively [14] Propositions 4.4 and 3.5. These are distinct proofs in the companion. The second inequality has stronger norm information than (9.12); below we also retain the applications of the operator argument itself. For $A = 4$, $u = 2$ and large block size, the reciprocal-square sum for each block is at most $3$, so the first Hilbert–Schmidt bound has constant $48 q$ and exponent $- 1 + 6 \/ q$.

=== 9.7 Parameter choices and full-deck conclusions <sweeps:assembly>

All six applications now use probability laws. The ordinary marginal bounds give such a law by the common coset deletion and normalization in Section 9.5. The trajectory construction instead conditions on its predictable path event. Both give a law $nu$ within $delta = o \( 1 \)$ of the physical block law $mu$, with sign coefficient $o \( 1 \)$. Table [??] records the resulting substitutions in the three norm bounds above.

The integer conditions are part of the choices. In the trajectory row, $b$ is any exponent allowed by Proposition 36 for $epsilon = 1 \/ 16$, $k$ is a fixed integer with $b k gt.eq 12$, and $p$ is any fixed integer satisfying $3 p \/ 4 - 2 gt.eq 2$; in particular $p = 6$ works. Its retained mass is $theta = 1 - delta$. In the eight-orbit row, any fixed integer $r > 300$ is allowed, and $r = 400$ gives time $8000 d$. In the available-count row, choose an integer $b_0 > 2$ with $\( 1 - 1 \/ 512 \)^(b_0 - 2) lt.eq 2^(- 6)$.

#figure(
  table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Input and block parameters
], table.cell(rowspan: 1, colspan: 1)[Transfer and norm exponent
], table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[Total time$\/ d$
]),
  table.cell(rowspan: 1, colspan: 1)[Input and block parameters
], table.cell(rowspan: 1, colspan: 1)[Transfer and norm exponent
], table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[Total time$\/ d$
],
  table.cell(rowspan: 1, colspan: 1)[Trajectory truncation, Proposition 40; $T \/ d = 2 k$, $q = 16$, $A = e \/ theta$
], table.cell(rowspan: 1, colspan: 1)[Coefficient evaluation, (9.12), $u = 2$; operator exponent $alpha = 3 \/ 8$
], table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[$2 - 3 p \/ 4$
], table.cell(rowspan: 1, colspan: 1)[$2 p k$
],
  table.cell(rowspan: 1, colspan: 1)[Two-sweep energy, (9.2); $T \/ d = 2 r$, $q = 8$, $A = 3$
], table.cell(rowspan: 1, colspan: 1)[Orbit, (9.12), $u = 2$; operator exponent $alpha = 1 \/ 4$
], table.cell(rowspan: 1, colspan: 1)[$10$
], table.cell(rowspan: 1, colspan: 1)[$- 3$
], table.cell(rowspan: 1, colspan: 1)[$20 r$
],
  table.cell(rowspan: 1, colspan: 1)[Refreshed blocker count, $epsilon = 1 \/ 32$; $T \/ d = 2048$, $q = 32$, $A = 4$
], table.cell(rowspan: 1, colspan: 1)[Orbit, (9.12), $u = 12$; operator exponent $alpha = 9 \/ 32$
], table.cell(rowspan: 1, colspan: 1)[$32$
], table.cell(rowspan: 1, colspan: 1)[$- 16$
], table.cell(rowspan: 1, colspan: 1)[$65536$
],
  table.cell(rowspan: 1, colspan: 1)[Refreshed available count, $epsilon = 1 \/ 128$; $T \/ d = b_0$, $q = 128$, $A = 4$
], table.cell(rowspan: 1, colspan: 1)[Orbit, (9.12), $u = 30$; operator exponent $alpha = 3 \/ 8$
], table.cell(rowspan: 1, colspan: 1)[$64$
], table.cell(rowspan: 1, colspan: 1)[$- 46$
], table.cell(rowspan: 1, colspan: 1)[$64 b_0$
],
  table.cell(rowspan: 1, colspan: 1)[Uniform signed energy, (9.3); $epsilon = 1 \/ 16$, $r = 2048$, $T \/ d = 2 r$, $q = 16$, $A = 4$
], table.cell(rowspan: 1, colspan: 1)[Pointwise character, (9.13); $parallel hat(nu) parallel_(upright("HS"))^2 lt.eq 48 q D^(- 5 \/ 8)$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$- 4$
], table.cell(rowspan: 1, colspan: 1)[$32768$
],
  table.cell(rowspan: 1, colspan: 1)[Averaged collision bound, Proposition 38; $q = 128$, $epsilon = 1 \/ q$, $R = 128 q$, $T \/ d = 2 R$, $A = 3$
], table.cell(rowspan: 1, colspan: 1)[Coset Plancherel, (9.13), $u = 32$; HS-squared exponent; $beta = 47 \/ 64$
], table.cell(rowspan: 1, colspan: 1)[$64$
], table.cell(rowspan: 1, colspan: 1)[$- 46$
], table.cell(rowspan: 1, colspan: 1)[$2097152$
],
),
  caption: [Table 4: Sweep bounds and their Fourier applications. Here $q$ is the number of label blocks, $A$ is the common coset cap, and $p$ is the number of independent shuffle blocks. The exponent $kappa$ is the resulting nonsign Plancherel power. ],
)

For the first four rows, the norm bound has the form $parallel hat(nu) parallel_(upright("op")) lt.eq K D^(- alpha)$; hence its nonsign Plancherel summand after $p$ factors is at most $K^(2 p) D^(2 - 2 p alpha)$. For the last two rows the bound is $parallel hat(nu) parallel_(upright("HS"))^2 lt.eq K D^(- beta)$, giving $K^p D^(1 - p beta)$. These are exactly the two substitutions in Section 3.3, and give the displayed $kappa$. The trajectory cap $e \/ theta$ is bounded as $theta arrow.r 1$; all other prefactors are fixed. The reciprocal-degree estimates (9.10) at powers $2 \, 2 \, 12 \, 30 \, 4 \, 32$, respectively, make the six nonsign sums tend to zero. The pointwise-character row also follows directly from the Liebeck–Shalev estimate (9.11) at powers $2$ and $4$.

The probability completion now applies once to every row. The sign bound is (9.9), or $delta \/ theta$ for the trajectory event. Replacing the $p$ factors costs at most $p delta = o \( 1 \)$. Since $T$ is divisible by $d$, the original product law is $mu^(* p) = q_d^(* \( p T \))$ and has the physical time in the last column. All constants are absolute and all conclusions hold for sufficiently large integer $d$, uniformly over deterministic starting decks. There is also a one-card lower bound: after $t < d$ layers a specified card has at most $2^t lt.eq n \/ 2$ possible positions, so its variation distance from uniform is at least $1 - 2^t \/ n gt.eq 1 \/ 2$. Projection cannot increase variation distance, and therefore the full-deck threshold-$1 \/ 4$ mixing time is at least $d$. The common full-permutation support lower bound $1 - 2^(t n \/ 2) \/ n !$ tends to one for $t lt.eq d$; hence each displayed application gives $t_(upright("mix")) \( d \) = Theta \( d \)$ in physical-shuffle time.

== 10 Prefix-tree symmetry and hierarchical energy <prefix:section>

The two-sweep estimates restart from every deterministic configuration. A different gain is available at the end of a completed sweep: the law of the signed mass has a symmetry that an arbitrary configuration need not have. We use this symmetry to contract at each subsequent sweep. The exact recursion below records the contribution of every coordinate block, so it also describes which scales retain the energy.

The coordinate order must be the same in successive sweeps. We use $1 \, dots.h \, d$, with $n = 2^d$, and the signed-weight process of Section 7.1. Write $H$ for its available set, $f$ for its signed vector, and $cal(E) \( H \, f \) = sum_x f \( x \)^2$. The update preserves $\| H \|$ and $sum_x f \( x \)$ and does not increase $cal(E)$. Our deterministic recursion refines the common block-merging identity from Section 7.3. The probabilistic step will apply that recursion to an invariant random input law, rather than restart from an arbitrary realized input.

#thm([Theorem 10.1.])[
  (Contraction after the first sweep).  #emph[Let $H subset.eq { 0 \, 1 }^d$ be deterministic, with $\| H \| gt.eq n \/ 4$, and let $f$ be a deterministic real vector supported on $H$ with $sum_x f \( x \) = 0$. Evolve $\( H \, f \)$ by the conditional signed-mass rule, using fresh independent switches in the same coordinate order in each sweep. If $cal(E)_b$ is the energy after $b$ sweeps, then, for all sufficiently large $d$ and every integer $b gt.eq 1$, 
$ bb(E) cal(E)_b lt.eq n^(- \( b - 1 \) \/ 64) cal(E)_0 . quad "(10.1)" $ <prefix:energy>

 The threshold for $d$ is independent of $H$, $f$ and $b$.]
] <prefix:contraction>

The first step is an exact identity, valid without the lower bound on $\| H \|$. We then identify the symmetry of the output and use it to control the terms in that identity.

=== 10.1 The exact recursion over coordinate blocks <the-exact-recursion-over-coordinate-blocks>

A coordinate block of level $j$ leaves the first $j$ bits free and fixes the remaining bits; its size is $2^j$. A non-singleton block $C$ has children $C_0 \, C_1$ obtained by fixing bit $j$ as well. For deterministic initial data $\( H \, f \)$, write

$ m_C = \| H ∩ C \| \, #h(2em) alpha_C = frac(m_C, \| C \|) \, #h(2em) S_C = sum_(x in C) f \( x \) . $

Counts and signed sums remain fixed while updates stay inside $C$. Set $S_C^2 \/ m_C = 0$ when $m_C = 0$, since then $S_C = 0$. For a non-singleton block define

$ D_C = S_(C_0)^2 / m_(C_0) + S_(C_1)^2 / m_(C_1) - S_C^2 / m_C gt.eq 0 . quad "(10.2)" $ <prefix:detail>

The inequality is the weighted Cauchy–Schwarz inequality. The quantity $D_C$ measures the difference between the two children’s average signed masses per available position.

Let $E_C$ be the expected energy in $C$ after its first $j$ coordinate updates, and put $W_C = E_C - S_C^2 \/ m_C$. All the quantities on the right below refer to the fixed initial data.

#thm([Lemma 10.2.])[
  (Hierarchical energy identity).  #emph[For every non-singleton coordinate block, 
$ W_C = \( 1 - alpha_(C_1) \/ 2 \) W_(C_0) + \( 1 - alpha_(C_0) \/ 2 \) W_(C_1) + \( 1 - alpha_C \) D_C . quad "(10.3)" $ <prefix:recursion>

 If the total signed sum is zero, the expected energy after one sweep, denoted $Phi \( H \, f \)$, is therefore 
$ Phi \( H \, f \) = sum_(C upright(" non-singleton")) \( 1 - alpha_C \) D_C product_(A supset.neq C) (1 - alpha_("sib"_A \( C \)) / 2) . quad "(10.4)" $ <prefix:expanded>

 Here the product runs over the proper coordinate-block ancestors of $C$, and $"sib"_A \( C \)$ is the child of $A$ not containing $C$. Empty products equal one, and 
$ sum_(C upright(" non-singleton")) D_C = cal(E) \( H \, f \) . quad "(10.5)" $ <prefix:telescoping>

]
] <prefix:hierarchy>

#proof[
  Write $a = \| C_0 \| = \| C_1 \|$, and temporarily shorten subscripts to $0 \, 1$. Since $alpha_i = m_i \/ a$, Lemma 24 reads
  $ E_C = \( 1 - alpha_1 \/ 2 \) E_(C_0) + \( 1 - alpha_0 \/ 2 \) E_(C_1) + S_0 S_1 \/ a . $
  We separate from each energy the squared mean on its available sites. When both counts are positive,
  $ D_C = frac(m_0 m_1, m_0 + m_1) (S_0 / m_0 - S_1 / m_1)^2 \, $
  and direct multiplication gives
  $ alpha_C D_C = 1 / 2 (alpha_1 S_0^2 / m_0 + alpha_0 S_1^2 / m_1) - frac(S_0 S_1, a) . $
  Subtracting the baseline $S_C^2 \/ m_C$ proves (10.3). If a child is empty, $D_C = 0$ and the same identity holds using the declared zero convention.
  At a singleton $W_C = 0$. Expanding the recursion from the root down therefore gives (10.4); at the root the baseline vanishes because the total signed sum is zero. Finally every non-root baseline in the sum of (10.2) occurs once with each sign. The surviving leaf terms sum to $sum_x f \( x \)^2$, and the root term is zero. This proves (10.5). ◻
]

The identity separates energy created by a difference of child means from the attenuation supplied by the larger blocks above it. To use that attenuation repeatedly, we need balance at many scales in the law entering a sweep. The following output symmetry supplies it.

=== 10.2 The symmetry supplied by a completed sweep <the-symmetry-supplied-by-a-completed-sweep>

Let $cal(A)_d$ be the finite group of automorphisms of the binary prefix tree. Concretely, its elements have the form

$ \( g x \)_i = x_i xor F_i \( x_1 \, dots.h \, x_(i - 1) \) \, #h(2em) 1 lt.eq i lt.eq d \, quad "(10.6)" $ <prefix:automorphism>

where each $F_i$ is an arbitrary function to ${ 0 \, 1 }$, including a constant when $i = 1$. The map is invertible by solving its coordinates in order. Write $g f$ for the transported vector, $\( g f \) \( g x \) = f \( x \)$.

#thm([Lemma 10.3.])[
  (Prefix-tree invariance).  #emph[For every deterministic initial $\( H \, f \)$, the output law of one sweep is invariant under $\( H' \, f' \) mapsto \( g H' \, g f' \)$ for every $g in cal(A)_d$.]
] <prefix:invariance>

#proof[
  Fix the functions in (10.6). Let $g_(< i)$ transform only coordinates $1 \, dots.h \, i - 1$ according to those functions, leaving coordinates $i \, dots.h \, d$ unchanged. It bijects the coordinate-$i$ matching edges. If an old edge $e$ has prefix $u = \( x_1 \, dots.h \, x_(i - 1) \)$ and coin $omega_i \( e \)$, define the new coin by
  $ omega'_i \( g_(< i) e \) = omega_i \( e \) xor F_i \( u \) . $
  The prefix here is the original one, recoverable from its transformed image because $g_(< i)$ is invertible. This is a deterministic bijection and toggling of the layer’s independent fair bits, so all modified layer arrays have their original joint law.
  Inductively the input to the modified layer is the old input with the earlier coordinates transformed. At an edge with one available input position, the toggled coin transports that position and its weight to the image under the first $i$ transformed coordinates. At an edge with two available input positions the two new weights are equal, so the same assertion holds. It is immediate on an empty edge. After the last layer the modified output is precisely the $g$-image of the original output. Since the coin laws agree, their output laws agree. ◻
]

A uniform element of $cal(A)_d$ can be generated by independent fair choices of which two children to interchange at each tree node. The prefix subtrees and the coordinate blocks cut across each other: a level-$j$ coordinate block contains exactly one leaf with each length-$j$ prefix. This gives the independence in the next lemma.

#thm([Lemma 10.4.])[
  (Independent leaf sampling).  #emph[Fix deterministic zero-sum data $\( H \, f \)$ with $\| H \| gt.eq c n$, where $c = 1 \/ 4$, and put $s = 2^(floor.l d \/ 2 floor.r)$. For uniform $g in cal(A)_d$, with probability at least $1 - 2 n e^(- c s \/ 8)$, every coordinate block of size at least $s$ has a fraction at least $c \/ 2$ of its positions in $g H$. For every block $C$ of size $s$, 
$ bb(E)_g S_C \( g f \) = 0 \, #h(2em) bb(E)_g S_C \( g f \)^2 lt.eq \( s \/ n \) cal(E) \( H \, f \) . quad "(10.7)" $ <prefix:block-second-moment>

]
] <prefix:sampling>

#proof[
  First fix a coordinate block of size $u = 2^j$. Condition on the automorphism’s action through depth $j$. Each source subtree with fixed first $j$ bits maps to one target subtree of that depth. The actions inside these subtrees are independent uniform automorphisms. Thus the preimages of the block’s $u$ leaves select one uniform leaf independently from each source subtree, each of size $n \/ u$.
  The hidden count $X$ in the transformed block is a sum of independent indicators with mean $z = \| H \| u \/ n gt.eq c u$. Multiplication of their exponential moments gives $bb(E)_g 2^(- X) lt.eq e^(- z \/ 2)$. Markov’s inequality yields
  $ Pr_g \( X < c u \/ 2 \) lt.eq Pr_g \( X lt.eq z \/ 2 \) lt.eq 2^(z \/ 2) e^(- z \/ 2) lt.eq e^(- z \/ 8) lt.eq e^(- c u \/ 8) . $
  There are fewer than $2 n$ coordinate blocks, so a union bound proves the density assertion. For the signed sum, the sum of the sampled means is $\( u \/ n \) sum_x f \( x \) = 0$. Independence gives variance at most the sum of the sampled second moments, namely $\( u \/ n \) sum_x f \( x \)^2$. Taking $u = s$ proves (10.7). ◻
]

#proof[
  First randomize the input by uniform $g$ and consider the density event in Lemma 44. On this event, every term of (10.4) with $\| C \| lt.eq s$ has $log_2 \( n \/ s \)$ ancestors of sizes $2 s \, 4 s \, dots.h \, n$. Their sibling blocks have size at least $s$, hence density at least $c \/ 2$. Its multiplier is therefore at most $\( 1 - c \/ 4 \)^(log_2 \( n \/ s \))$. By (10.5), the sum of all its nonnegative $D_C$ terms is at most $cal(E) \( H \, f \)$.
  For $\| C \| > s$, discard the multipliers. The corresponding details telescope to $sum_(\| C \| = s) S_C^2 \/ m_C$, since the total signed sum is zero. On the density event this is at most $\( 2 \/ \( c s \) \) sum_(\| C \| = s) S_C^2$. There are $n \/ s$ such blocks; their second-moment bounds in (10.7) sum to at most $cal(E) \( H \, f \)$. On the exceptional event use the unconditional bound $Phi lt.eq cal(E) \( H \, f \)$. Hence
  $ bb(E)_g Phi \( g H \, g f \) lt.eq [\( 1 - c \/ 4 \)^(log_2 \( n \/ s \)) + frac(2, c s) + 2 n e^(- c s \/ 8)] cal(E) \( H \, f \) lt.eq n^(- 1 \/ 64) cal(E) \( H \, f \) quad "(10.8)" $ <prefix:randomized-bound>
  for sufficiently large $d$. Indeed the first term is at most $e^(- c d \/ 8)$, whose exponent in $n$ is $c \/ \( 8 log 2 \) > 1 \/ 64$, and $s gt.eq sqrt(n \/ 2)$ makes the other terms smaller than that power eventually. This threshold depends on no input data.
  At each boundary after at least one sweep, the law of $\( H \, f \)$ is invariant under an independent uniform $g$ by Lemma 43. The next sweep uses fresh switches in the same order. Thus its expected output energy is
  $ bb(E) Phi \( H \, f \) = bb(E)_(\( H \, f \)) bb(E)_g Phi \( g H \, g f \) lt.eq n^(- 1 \/ 64) bb(E) cal(E) \( H \, f \) . $
  This uses invariance of the boundary law, not invariance of each realized configuration. The first sweep does not increase energy. Iteration proves (10.1) for every $b gt.eq 1$. ◻
]

=== 10.3 Uniform list entropy and the four-block application <uniform-list-entropy-and-the-four-block-application>

The new estimate gives relative entropy as well as total variation for every fixed list. Relative entropy below uses natural logarithms: $D \( p parallel q \) = sum_x p \( x \) log \( p \( x \) \/ q \( x \) \)$, with $0 log 0 = 0$.

Write $U_(upright("inj") \, k)$ for the uniform law on ordered injections of $k$ labels into $V$.

#thm([Proposition 10.5.])[
  (Three-quarter list entropy).  #emph[For every integer $b gt.eq 1$, every deterministic starting deck, and any ordered list of $k lt.eq 3 n \/ 4$ distinct labels, the endpoint law $mu_(b \, k)$ after $b$ sweeps satisfies, for sufficiently large $d$, 
$ D \( mu_(b \, k) parallel U_(upright("inj") \, k) \) lt.eq n^2 n^(- \( b - 1 \) \/ 64) . quad "(10.9)" $ <prefix:entropy-bound>

 In particular at $b = 769$, every such list has total-variation error at most $n^(- 5)$.]
] <prefix:entropy>

#proof[
  Let $Y_1 \, dots.h \, Y_k$ be the image positions. The entropy chain rule expresses the deficit from $log \( n \)_k$, where $\( n \)_k = n \( n - 1 \) dots.h.c \( n - k + 1 \)$, as
  $ sum_(i = 1)^k #scale(x: 120%, y: 120%)[\[] log \( n - i + 1 \) - sans(H) \( Y_i divides Y_1 \, dots.h \, Y_(i - 1) \) #scale(x: 120%, y: 120%)[\]] . $
  Here $sans(H)$ is Shannon entropy. Refining the conditioning to the complete paths of the preceding labels can only lower this conditional entropy. Their endpoint complement has $m = n - i + 1 gt.eq n \/ 4$ sites. For the conditional probability $p$ there, $log z lt.eq z - 1$ gives
  $ D \( p parallel U_H \) = sum_(x in H) p \( x \) log \( m p \( x \) \) lt.eq m sum_(x in H) \( p \( x \) - 1 \/ m \)^2 . $
  The initial centered tag energy is $1 - 1 \/ m lt.eq 1$. Applying Theorem 41 at each exposure and summing at most $n$ contributions, each with $m lt.eq n$, proves (10.9). This also covers the empty list.
  For completeness, $D \( p parallel q \) gt.eq 2 parallel p - q parallel_(upright("TV"))^2$ follows by the log-sum inequality applied to ${ p > q }$ and its complement. The resulting binary relative entropy, as a function of its first mass, has second derivative at least $4$, minimum zero at the reference mass, and zero first derivative there. Integrating this bound, with endpoint values obtained by continuity, proves the inequality. With $b = 1 + 12 dot.op 64 = 769$, the entropy bound is $n^(- 10)$ and the claimed variation bound follows. ◻
]

Let $mu$ now be the full permutation law after $769$ sweeps. Partition the labels into four equal blocks, and let $H_i$ permute block $i$, fixing all other labels. The left coset $g H_i$ is specified by the images of the complement of that block. Each coset marginal has variation error at most $epsilon.alt = n^(- 5)$ by Proposition 45. Delete the outcomes belonging to a coset whose mass exceeds twice its uniform mass, in any of the four systems. The remaining subprobability $mu_0 lt.eq mu$ has mass $p_0 gt.eq 1 - 8 epsilon.alt$ and satisfies

$ mu_0 \( g H_i \) lt.eq frac(2, \[ S_n : H_i \]) #h(2em) \( i = 1 \, dots.h \, 4 \) . quad "(10.10)" $ <prefix:cap>

Indeed one system deletes mass at most $2 epsilon.alt$, since the mass in a heavy coset is at most twice its positive excess over uniform.

We use the four-block type-counting transfer of [14] Corollary 8.3. In its precise form needed here, a subprobability satisfying (10.10) has, on the irreducible representation $rho_lambda$ of dimension $D_lambda$,

$ ∥sum_g mu_0 \( g \) rho_lambda \( g \)∥_(upright("op")) lt.eq sqrt(2 R_lambda) thin D_lambda^(- 1 \/ 4) lt.eq D_lambda^(- 1 \/ 8) \, #h(2em) lambda in.not { \( n \) \, \( 1^n \) } \, quad "(10.11)" $ <prefix:four-block-input>

for all sufficiently large $n$. Here $R_lambda$ is the number of distinct joint types in the restriction to $H_1 times dots.h.c times H_4$, without counting their multiplicities. The first inequality retains one orbit span per joint type. The second uses $R_lambda lt.eq \( sum_(j = 0)^ell p \( j \) \)^4$ with $ell = n - max \( lambda_1 \, lambda'_1 \)$, and the uniform growth $log D_lambda \/ sqrt(ell) arrow.r oo$. These are the type-counting and degree statements proved in that companion; an eight-block orbit estimate alone would not give this four-block bound.

We now check the mass, sign and time substitutions that complete this application. Set $q = 24$ and $A_lambda = sum_g mu_0 \( g \) rho_lambda \( g \)$. Plancherel with unnormalized trace gives

$ \| S_n \| sum_g lr(|mu_0^(* q) \( g \) - frac(p_0^q, \| S_n \|)|)^2 = sum_(lambda eq.not \( n \)) D_lambda parallel A_lambda^q parallel_(upright("HS"))^2 . $

For the nontrivial nonsign representations, (10.11) bounds the right side by

$ sum_(lambda in.not { \( n \) \, \( 1^n \) }) D_lambda^(2 - q \/ 4) = sum_(lambda in.not { \( n \) \, \( 1^n \) }) D_lambda^(- 4) = o \( 1 \) \, $

using the inverse-fourth degree sum from [14] Theorem 6.3. No normality is required: use $parallel A_lambda^q parallel_(upright("HS")) lt.eq sqrt(D_lambda) parallel A_lambda parallel_(upright("op"))^q$. The original law $mu$ has zero sign expectation because toggling one fixed fair switch reverses its permutation parity. Consequently $\| A_(\( 1^n \)) \| lt.eq 1 - p_0$, and the sign term tends to zero too. Cauchy–Schwarz now shows that $mu_0^(* q)$ is $o \( 1 \)$ away in half-$ell^1$ from $p_0^q U_(S_n)$.

Finally $mu^(* q) - mu_0^(* q)$ is nonnegative, of mass $1 - p_0^q$. Its half-$ell^1$ norm and that of $\( 1 - p_0^q \) U_(S_n)$ sum to $1 - p_0^q = o \( 1 \)$. Thus $mu^(* 24)$ converges to uniform in total variation. Each factor consists of $769$ complete sweeps, so the physical time is

$ 24 dot.op 769 d = 18456 d . $

All statements are uniform over the deterministic starting deck. Together with the support lower bound (2.4), this gives $2 d - O \( 1 \) lt.eq t_(upright("mix")) \( d \) lt.eq 18456 d$ for sufficiently large $d$.

== 11 Cycle variances, tuple entropy, and collisions <lifts:cycle-information>

The uniform fixed-list entropy bound (3.7) already implies the mean entropy conclusion studied here. We give two other mechanisms for energy contraction: an exact identity comparing one cycle’s block sums with the preceding cycle’s row variances, and a collision formula for signed weights transported by actual cards. The first yields a one-cycle recurrence and mean entropy decay; the second yields a two-pass variation estimate. In both arguments the input list is sampled uniformly, so available-set concentration is available unconditionally. Their structural identities, rather than a stronger list guarantee, are the purpose of this section.

Let $pi_k$ be the uniform law on ordered injections of $k$ labels into $V$, and use the relative entropy defined in Section 2. An ordering of a fixed input set merely records its restriction law as a tuple; it does not change relative entropy. Thus the mean below can equally be viewed as an average over omitted input sets. Section 12 will give an alternative vector proof of that information bound and apply it through a different Fourier transfer.

#thm([Proposition 11.1.])[
  (Cycle variance and tuple entropy).  #emph[For every fixed $0 < delta < 1$ there is an integer $R = R \( delta \)$ such that, for a uniform ordered $k$-tuple $X$ of distinct inputs with $k lt.eq \( 1 - delta \) n$, its image law $mu_X$ after $R d$ shuffles satisfies 
$ bb(E)_X D \( mu_X parallel pi_k \) = o \( 1 \) . $

 Here $D$ is relative entropy with natural logarithms. More precisely, for each rank of that random tuple, let $a_t$ be the squared conditional next-card mass error averaged over both the input tuple and the shuffle. Then $a_t$ satisfies, for $r gt.eq 1$, 
$ a_(\( r + 1 \) d) lt.eq kappa_(delta \, d) a_(r d) + d n \( n + 1 \) e^(- delta sqrt(n) \/ 8) \, #h(2em) kappa_(delta \, d) = \( 1 - delta \/ 4 \)^(floor.l d \/ 2 floor.r) + 2^(- ceil.l d \/ 2 ceil.r) . quad "(11.1)" $ <lifts:cycle-recurrence>

 Thus one may choose $alpha > 0$ with $kappa_(delta \, d) lt.eq n^(- alpha)$ eventually and then any fixed $R$ with $alpha \( R - 1 \) > 4$.]
] <lifts:cycle-entropy>

#proof[
  At rank $j$, let $cal(F)_t$ contain the entire realized input tuple $X$ and the first $j - 1$ cards’ paths through time $t$. The next-card law is conditioned on this field, so the initial tagged label is fixed inside the conditional law. The expectation defining $a_t$ still averages over both $X$ and the switches. Let $V_t$ be the available set, of size $h = n - j + 1 gt.eq delta n$, and let $I_t = upright(bold(1))_(V_t)$. Apply Lemma 2 with the preceding cards as blockers. Its prefix recursion gives the conditional next-card law $p_t$, also when the complete blocker paths are specified. Use the centered vector $f_t = p_t - I_t \/ h$ and mean energy $a_t = bb(E) parallel f_t parallel_2^2$ from Section 3. The vector has zero sum, energy at most one, and nonincreasing energy. The entropy chain rule and convexity give
  $ bb(E)_X D \( mu_X parallel pi_k \) lt.eq sum_(j = 1)^k h thin bb(E) parallel f_(R d) parallel_2^2 \, quad "(11.2)" $ <lifts:entropy-chain>
  since $D \( q parallel I \/ h \) lt.eq h parallel q - I \/ h parallel_2^2$ by $log u lt.eq u - 1$.
  We establish (11.1). Conditional on the complete past before a layer, the expected entries of both $I$ and $f$ at each pair are their old pair averages. At a pair ${ x \, y }$ the energy loss is
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] f \( x \)^2 I \( y \) + f \( y \)^2 I \( x \) - 2 f \( x \) f \( y \) #scale(x: 120%, y: 120%)[\)] . $
  Consider coordinate $i$ of the cycle starting at $r d$, and the blocks $B$ obtained by varying the first $i - 1$ coordinates. Their size is $m = 2^(i - 1)$. Write $W_B = sum_B f_(r d)$ and $H_B = sum_B I_(r d)$. During the first $i - 1$ stages these blocks evolve independently, conditional on the cycle start. Just before stage $i$, their expected entries are $W_B \/ m$ and $H_B \/ m$. If every $H_B gt.eq delta m \/ 2$, independence of paired blocks and the loss formula give contraction $1 - delta \/ 4$ plus a cross term at most $\( 2 m \)^(- 1) sum_B W_B^2$. If this count condition fails, use only nonincrease and energy at most one. Thus
  $ a_(r d + i) lt.eq \( 1 - delta \/ 4 \) a_(r d + i - 1) + frac(1, 2 m) bb(E) sum_B W_B^2 + delta / 4 Pr { upright("some ") H_B < delta m \/ 2 } . quad "(11.3)" $ <lifts:cycle-stage>
  The key estimate is $bb(E) sum_B W_B^2 lt.eq a_(r d)$ for $r gt.eq 1$. To see it, condition at $s = \( r - 1 \) d + i - 1$ in the preceding cycle. The remaining layers evolve independently in rows $C$ fixing the first $i - 1$ bits, each of size $q = n \/ m$. Let $R_C$ be the signed row total at time $s$. At the end of that cycle each entry of row $C$ has conditional mean $R_C \/ q$. These are the transverse partitions of Figure 1. A block varies the first $i - 1$ bits, whereas a row fixes those bits, so each block meets each row once. Consequently the conditional mean of every $W_B$ is $q^(- 1) sum_C R_C = 0$. Its conditional variance is the sum of the variances of its entries, because those entries lie in independent rows. Summing these variances over the $q$ blocks gives
  $ bb(E) [sum_B W_B^2 divides cal(F)_s] = bb(E) \[ parallel f_(r d) parallel_2^2 divides cal(F)_s \] - q^(- 1) sum_C R_C^2 . quad "(11.4)" $ <lifts:cycle-variance-identity>
  This proves the required inequality without assuming individual row totals vanish.
  Unconditionally the available set at the start of any cycle is a uniform $h$-subset, by the independent random input tuple. Bernoulli sampling with parameter $h \/ n$, conditioned on count $h$, represents this subset; the conditioning event has probability at least $1 \/ \( n + 1 \)$ because $h$ is a binomial mode. A Chernoff bound and union over the blocks give
  $ Pr { upright("some ") H_B < delta m \/ 2 } lt.eq n \( n + 1 \) e^(- delta m \/ 8) . $
  Apply (11.3) for $i = ceil.l d \/ 2 ceil.r + 1 \, dots.h \, d$, and nonincrease at earlier stages. The sum of $\( 2 m \)^(- 1)$ in this range is at most $2^(- ceil.l d \/ 2 ceil.r)$. This proves the displayed recurrence. Its additive error is smaller than every inverse power of $n$. Since $a_d lt.eq 1$, the stated choice of $R$ gives $a_(R d) = O \( n^(- 4) \)$, uniformly in $j \, k$. Equation (11.2) is then $O \( n^(- 2) \)$, proving the proposition. ◻
]

#thm([Proposition 11.2.])[
  (Two-pass transport estimate).  #emph[For every fixed $0 < p < 1$, after a fixed number of complete coordinate passes the average, over uniformly chosen input lists of $floor.l \( 1 - p \) n floor.r$ distinct cards, of their image-law variation distance from uniform tends to zero.]
] <lifts:transport-marginals>

#proof[
  Write $x$ for the centered conditional field $f$ of the preceding proof. It vanishes off the $h gt.eq p n$ available positions and is centered there by $1 \/ h$. We first estimate the block sums after one pass, and then use them as the forcing term in the next pass. A level-$j$ block varies coordinates $1 \, dots.h \, j$ and fixes the suffix; write $cal(B)_j$ for this partition.
  Condition on the full past at the first-pass start, fixing the available set, signed field $x$, and energy $D = sum_u x \( u \)^2$. Attach weight $x \( u \)$ to the actual card at each starting site $u$, and let $L \( y \)$ be its transported weight at the end of the pass. Conditional on the new blocker paths, the expectation of $L$ is the signed transport-and-average field: Lemma 2 leaves each unvisited switch fair. This is a linear identity for fixed starting weights, not a change in the conditioning that defines the tag law. If $macron(x)_B$ is the resulting field average on $B$, Jensen gives
  $ bb(E) sum_(B in cal(B)_j) 2^j macron(x)_B^2 lt.eq 2^(- j) bb(E) sum_(B in cal(B)_j) (sum_(y in B) L \( y \))^2 . $
  The quadratic form on the right concerns two distinct actual cards, not the conditionally independent walkers of Lemma 37. Use the last-differing-coordinate argument of Proposition 28, now with equality of the output suffix as the target event. Let $a$ be the largest coordinate in which their starting sites differ, and put $r = 2^(- \( d - j \))$. Their probability of ending in the same level-$j$ block is exactly
  $ cases(delim: "{", r \, & a lt.eq j \,, r \( 1 - 2^(- j) \) \, & a > j .) $
  Before coordinate $a$ their switches are distinct, since that bit still separates them. At coordinate $a$ they share a switch precisely when their earlier output bits agree, in which case their new bits must be opposite. After this stage their processed prefixes are distinct, so all later switches are again distinct. If $a lt.eq j$, the suffix bits are therefore independent fair pairs, giving $r$. If $a > j$, equality of the suffix through coordinate $a - 1$ has probability $2^(- \( a - j - 1 \))$. Conditional on this equality, the first $j$ bits agree with probability $2^(- j)$; this is exactly the case in which the shared switch prevents equality at $a$. Otherwise equality there has probability $1 \/ 2$, and later suffix equalities supply $2^(- \( d - a \))$. This gives the second formula.
  In particular each off-diagonal coefficient differs from $r$ by at most $2 r 2^(- j)$. The common coefficient contributes $r sum_(u eq.not v) x \( u \) x \( v \) = - r D$, since $sum_u x \( u \) = 0$. The diagonal contributes $D$, and the absolute error is at most $2 r 2^(- j) \( sum_u \| x \( u \) \| \)^2 lt.eq 2 r 2^(- j) n D$. As $r = 2^j \/ n$,
  $ bb(E) sum_(B in cal(B)_j) 2^j macron(x)_B^2 lt.eq 3 thin 2^(- j) D . quad "(11.5)" $ <lifts:transport-blocks>
  Now put $b = floor.l d \/ 2 floor.r$ and $sigma = 1 - p \/ 4$. Unconditionally, the available set at the second-pass start is uniform. The same subset estimate used above and a union bound over fewer than $2 n$ blocks show that every starting block of level at least $b$ has available fraction at least $p \/ 2$, except with probability at most
  $ epsilon_n = 2 n \( n + 1 \) e^(- p 2^b \/ 8) . $
  For a fixed second-pass start satisfying these count bounds, independent blocks have expected entries equal to their starting field averages and expected availabilities equal to their starting densities. The pair-loss calculation therefore bounds the expected energy $E_j$ after $j$ stages by
  $ E_(j + 1) lt.eq sigma E_j + sum_(B in cal(B)_j) 2^j macron(x)_B^2 \, #h(2em) b lt.eq j < d \, quad "(11.6)" $ <lifts:transport-stage>
  The squared terms use independence between the two input blocks; the cross term is bounded by half the sum of their squared signed masses. Average this inequality on the good starts, use (11.5) for its nonnegative forcing terms, and bound energy by one on the exceptional event. Writing $a_t$ for mean tag energy at a pass boundary gives the explicit recurrence
  $ a_(t + 2 d) lt.eq #scale(x: 120%, y: 120%)[\(] sigma^(d - b) + 6 thin 2^(- b) #scale(x: 120%, y: 120%)[\)] a_t + epsilon_n \, $
  because $sum_(j = b)^(d - 1) 3 thin 2^(- j) lt.eq 6 thin 2^(- b)$. No independence between energy and the count event is used. For every fixed $0 < beta < min { - 1 / 2 log_2 sigma \, 1 / 2 }$, the coefficient is at most $n^(- beta)$ for sufficiently large $d$. The uniform-subset assertion holds unconditionally at every pair start, so a fixed number of pairs with total exponent greater than four gives expected energy $o \( n^(- 4) \)$. Cauchy–Schwarz makes each next-card conditional variation error $o \( n^(- 1) \)$, and Lemma 3 sums these errors to $o \( 1 \)$. ◻
]

=== 11.1 The entropy and transport applications <lifts:cycle-applications>

We apply two Fourier transfers to these estimates. For the entropy argument choose $R = R \( 1 \/ 8 \)$ and block length $R d$; Pinsker and Jensen give mean variation $o \( 1 \)$ for complements of $n \/ 8$ inputs. For the transport argument choose a fixed $C_0$ large enough for Proposition 47 at $p = 1 \/ 8$, with block length $C_0 d$. For each law separately, the averaged partition choice and normalized trimming in Section 9.5 give a retained probability $nu$ within $o \( 1 \)$ of the original block law $mu$. If $H_i$ permutes block $i$ of the selected partition and fixes its complement, the retained law satisfies all eight coset caps $nu \( g H_i \) lt.eq 3 \/ \[ G : H_i \]$. The sign and probability-replacement conditions are then those of Section 3.3.

For the entropy route, the isotypic transfer [14] Proposition 3.5, with $b = 8 \, u = 1 \, B = 3$, gives

$ parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 lt.eq 24 C_1 D^(- 5 \/ 8) . $

Thus four convolutions have nonsign Plancherel contribution at most

$ \( 24 C_1 \)^4 sum_(rho eq.not upright(bold(1)) \, "sgn") D^(1 - 4 \( 5 \/ 8 \)) = \( 24 C_1 \)^4 sum_(rho eq.not upright(bold(1)) \, "sgn") D^(- 3 \/ 2) = o \( 1 \) . $

Here $C_1$ is the reciprocal-degree constant from Section 9.6. The probability completion therefore gives full-deck convergence after $4 R d$ physical shuffles.

For the transport route, use the orbit-span transfer [14] Proposition 3.2, again with eight blocks and $u = 1$:

$ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq sqrt(24 C_1) thin D^(- 5 \/ 16) . $

After $k$ convolutions the contribution at degree $D$ is at most $\( 24 C_1 \)^k D^(2 - 5 k \/ 8)$. Thus every fixed $k$ with $5 k \/ 8 - 2 > 0$ gives convergence, using the reciprocal-degree estimate for every fixed positive exponent. In particular eight factors leave the summable power $D^(- 3)$ and give full-deck convergence after $8 C_0 d$ shuffles.

The same probability completion applies to each fixed number of transport factors. Both block lengths are whole sweeps, so the convolution times stated above are physical-shuffle times, uniformly over deterministic starting decks.

== 12 Vector flows and entropy on a random domain <sec:c-random-domains>

The next proof packages the conditional laws of all remaining cards in one vector array. Averaging the next label’s squared error cancels the number of available positions in the entropy bound. As in Proposition 46, this gives a mean-information estimate by an alternative to the uniform fixed-list argument (3.7). We record it as a restriction to the complement of a random omitted set. The application uses a different Fourier transfer: its well-controlled domains may depend on the sampled permutation.

As before $V = bb(F)_2^d$, $n = 2^d$, and layer $s$ switches along $i_s = 1 + \( s med mod med d \)$. Fix $0 < alpha lt.eq 1$ and an integer $alpha n lt.eq m lt.eq n$. Choose a uniform $m$-subset $J$ of input labels independently of the shuffle. Reveal the paths of all labels outside $J$. At time $s$ let $O_s$ be the available positions, not occupied by those revealed labels. For $x in V$, let $Q_x \( s \) in bb(R)^J$ have coordinates

$ Q_x \( s \)_b = bb(P) { Pi_s \( b \) = x divides J \, upright("paths of labels outside ") J upright(" through ") s } \, #h(2em) b in J \, $

and define

$ X_x \( s \) = Q_x \( s \) - frac(upright(bold(1))_(O_s) \( x \), m) thin upright(bold(1))_J . $

For each $b in J$, the coordinate $X_x \( s \)_b$ is the centered tag law $f_s \( x \)$ of Section 3, with the labels outside $J$ as blockers and $O_s$ as its available set. Thus each coordinate sums to zero over $x$. Applying Lemma 2 to each tag gives the vector update: two available positions average their vectors; one available position transports its vector to the unique available output; and a pair with no available position carries zero. The lemma also identifies these vectors when all exposed paths through a terminal time are prescribed, and shows that the vector at an earlier time depends only on their prefixes. The total squared energy starts at $m - 1$ and is nonincreasing, so it is always at most $n$.

Let $cal(F)_s$ contain $J$ and every actual switch coin used before layer $s$. This is the filtration used for expectations in the next argument; it is distinct from the smaller sigma-field that defines the conditional probabilities $Q_x \( s \)$. Write

$ A_s = bb(E) sum_x parallel X_x \( s \) parallel_2^2 \, #h(2em) S_s = bb(E) sum_x parallel X_x \( s \) parallel_2^2 upright(bold(1))_({ x + e_(i_s) in.not O_s }) . $

The latter is the expected energy on edges with precisely one available position.

#thm([Proposition 12.1.])[
  (Vector noise and random-domain balance).  #emph[For $t gt.eq d$, 
$ A_t = sum_(ell = 1)^d 2^(- ell) S_(t - ell) . quad "(12.1)" $ <eq:c-vector-noise-identity>

 There are constants $c_alpha \, C_alpha > 0$, depending only on $alpha$, such that, with $gamma = alpha \/ 2$ and $b_n = C_alpha n e^(- c_alpha n)$, 
$ S_s lt.eq \( 1 - gamma \) A_s + b_n #h(2em) \( s gt.eq d - 1 \) . quad "(12.2)" $ <eq:c-vector-singles-gain>

 In particular, for $theta = 1 - gamma \/ 4$, 
$ A_t lt.eq n theta^(t - 2 d) + b_n \/ gamma #h(2em) \( t gt.eq 0 \) . quad "(12.3)" $ <eq:c-vector-decay>

 Consequently there is a fixed integer $C > 2$, depending only on $alpha$, for which $A_(C d) = O \( n^(- 4) \)$, uniformly in $m in \[ alpha n \, n \]$.]
] <prop:c-vector-domain-energy>

#proof[
  For each $b in J$, apply Lemma 5 to the tag $b$, with blockers $V \\ J$. Sum its identity over $b$ and then average over $J$. The sum of the tag energies is exactly $A_t$, and the sum of their weighted blocker occupancies is $S_s$, proving (12.1). Correlations between the tags cause no cross terms: the squared array norm is the sum of their individual squared norms. The new estimate needed here is therefore the balance bound for this total energy.
  To estimate the recent noise, fix $s gt.eq d - 1$ and condition on $cal(F)_a$ at $a = s - d + 1$. The intervening $d - 1$ layers act independently in the two halves determined by coordinate $i_s$. For $x$ in one half, $X_x \( s \)$ depends only on that half’s subsequent coin array and its initial vector array. The event $x + e_(i_s) in O_s$ depends only on the other half’s array and its initial available set. These quantities are therefore conditionally independent. Moreover, the latter conditional probability is exactly the initial density of $O_a$ in the other half: averaging expected occupancies through all its $d - 1$ directions makes them constant there.
  Unconditionally $O_a$ is a uniform $m$-set. Indeed it is the image of the independent uniform set $J$ under the actual permutation through time $a$. Sampling concentration gives that both half-densities are at least $alpha \/ 2$, except on an $cal(F)_a$-measurable event of probability $O \( e^(- c_alpha n) \)$. On its complement, conditional independence gives available-partner energy at least $gamma$ times the same-time total energy. On the exceptional event the energy is at most $n$. Taking expectations proves (12.2). The factor $n$ in $b_n$ is needed because this is the sum of the energies of all $m$ cards.
  It remains to solve the recurrence. Through time $2 d$, (12.3) follows from $A_t lt.eq n$. At later times substitute the induction hypothesis and (12.2) into (12.1). The coefficient of the proposed geometric term is at most
  $ \( 1 - gamma \) sum_(ell gt.eq 1) \( 2 theta \)^(- ell) = frac(1 - gamma, 2 theta - 1) < 1 \, $
  and the constant contribution is at most $\( 1 - gamma \) b_n \/ gamma + b_n = b_n \/ gamma$. This proves (12.3). Finally choose a fixed integer $C > 2$ large enough that $1 + \( C - 2 \) log_2 theta lt.eq - 4$. Since $n = 2^d$, its first term at $C d$ is at most $n^(- 4)$, and its second term is exponentially small. ◻
]

#thm([Theorem 12.2.])[
  (Mean relative entropy over omitted domains).  #emph[Let $d gt.eq 8$, $q = 256$, and let $R$ be a uniform $\( n \/ q \)$-subset of input labels, independent of the shuffle. For a permutation $g$, write $g_(- R)$ for its restriction to $V \\ R$, retaining the identities of all those labels. There is an absolute positive integer $C$ such that, for the law $mu$ after $C d$ physical shuffles and the uniform restriction law $u_(- R)$, 
$ bb(E)_R D \( mu_(- R) bar.v.double u_(- R) \) = O \( n^(- 3) \) = o \( 1 \) . quad "(12.4)" $ <eq:c-random-domain-entropy>

 Relative entropy uses natural logarithms.]
] <thm:c-random-domain-entropy>

#proof[
  Apply Proposition 48 with $alpha = 1 \/ 256$. Generate the omitted set and the retained order together: choose one uniform order $\( c_1 \, dots.h \, c_n \)$, independently of the shuffle, and let $R$ consist of its last $n \/ 256$ labels. For every fixed order, the first $n - n \/ 256$ endpoints encode the restriction outside $R$, so their relative entropy is $D \( mu_(- R) bar.v.double u_(- R) \)$.
  At a rank with $j$ earlier labels, the entropy chain’s reference law is uniform on the $m = n - j$ positions not occupied by their endpoints. Conditioning further on those labels’ whole paths increases the expected contribution, by convexity, because the reference set is already determined by the endpoints. Put $J = V \\ { c_1 \, dots.h \, c_j }$ and $b = c_(j + 1)$. For fixed preceding labels and a fixed next label $b$, this path-conditioned endpoint law is $Q \( T \)_b$. It does not depend on the order of the later labels or on which of them form $R$: these names contain no information about the switches.
  We may therefore average the unrevealed names before taking the next chain contribution. Conditional only on the preceding label choices and their paths, $b$ is uniform in $J$. This averaging step does not fix $R$; if it did, $b$ would be uniform only in $J \\ R$. For each possible $b$, the elementary inequality $log z lt.eq z - 1$ yields the chi-square bound
  $ D #scale(x: 120%, y: 120%)[\(] Q \( T \)_b bar.v.double U_(O_T) #scale(x: 120%, y: 120%)[\)] lt.eq m sum_(x in O_T) \| X_x \( T \)_b \|^2 . $
  Averaging this display over $b in J$ gives $sum_x parallel X_x \( T \) parallel_2^2$. Before the preceding labels are fixed, $J$ is a uniform $m$-set independent of the shuffle, so its remaining expectation is $A_T$. Every stage has $m gt.eq n \/ 256$, and hence its expected contribution is $O \( n^(- 4) \)$ uniformly. There are at most $n$ stages. Averaging the entropy chain over the full order proves (12.4). ◻
]

The transfer below needs only the mean over $R$, although the earlier bound (3.7) also gives small entropy for every fixed omitted domain of this size after sufficiently many sweeps. Its use of the mean permits the domains having bounded density to depend on the sampled permutation.

#thm([Corollary 12.3.])[
  (Random-domain application).  #emph[With the fixed integer $C$ from Theorem 49, the full permutation law after $32 C d$ physical shuffles tends to uniform in total variation from every starting deck.]
] <cor:c-random-domain-mixing>

#proof[
  The random-domain transfer [14] Theorem 10.4 takes $q = 256$ and the mean entropy bound (12.4). Its truncation retains permutations $g$ for which at least a fraction $7 \/ 8$ of the domains satisfy $mu_(- R) \( g_(- R) \) \/ u_(- R) \( g_(- R) \) lt.eq 2$. It gives a probability $nu$ with $parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$ and
  $ parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq C_(upright("dom")) D_lambda^(- 1 \/ 8) #h(2em) \( D_lambda > 1 \) \, $
  where $C_(upright("dom"))$ is absolute. Thus the mean-domain hypothesis, the fraction $7 \/ 8$, and the density cutoff two are precisely the ones supplied to that theorem; simultaneous control of every $R$ is unnecessary.
  Apply the probability completion of Section 3.3, with operator exponent $1 \/ 8$ and thirty-two factors. The original block’s zero sign mean and $parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$ supply the scalar condition. The nonsign Plancherel sum is bounded by
  $ C_(upright("dom"))^64 sum_(D_lambda > 1) D_lambda^(2 - 64 \/ 8) = C_(upright("dom"))^64 sum_(D_lambda > 1) D_lambda^(- 6) = o \( 1 \) \, $
  by the inverse-square degree estimate [14] Lemma A.2. The completion therefore gives convergence of the original law at $32 C d$ physical shuffles, uniformly over deterministic starting decks. ◻
]

== 13 A common truncation for all color constraints <sec:c-palettes>

The preceding two sections use input-list or omitted-set averages. We now seek a single probability law satisfying bounds for every coloring of either half of the labels. A small mean error for the next card cannot be used unchanged after conditioning on a rare prescribed mapping. Instead, a symmetry of the last $d - 1$ layers and a random label order will produce one event on switch settings where the accumulated errors are small before any mapping constraint is selected.

We use positions $V = bb(F)_2^d$, put $n = 2^d$ and $h = n \/ 2$, and let a permutation send initial labels to final positions. Layer $s$ uses independent fair switches in direction $i_s = 1 + \( s med mod med d \)$. A block of $T = C_(*) d$ layers, with $C_(*)$ a positive integer, is a block of $C_(*) d$ physical shuffles because the rotating coordinate frame returns at its endpoint. Write $bb(P)$ for its fair law on switch settings, and $g$ for the endpoint permutation. All constants below are fixed before $d$ tends to infinity.

Fix an order $omega = \( c_1 \, dots.h \, c_n \)$ of the labels. After revealing the entire trajectories of $c_1 \, dots.h \, c_r$, let $B_s$ be the available positions at time $s$, namely those not occupied by these revealed labels, and put $m = n - r$. Let $p_s \( x \)$ be the conditional probability that $c_(r + 1)$ occupies $x$. Define

$ w_s \( x \) = p_s \( x \) - m^(- 1) upright(bold(1))_(B_s) \( x \) \, #h(2em) V_s = sum_(x in V) w_s \( x \)^2 . $

Here $B_s$ and $w_s$ are the available set and centered vector denoted $V_t$ and $f_t$ in Section 3; $V_s$ is their realized squared energy, whose expectation is the quantity denoted $a_t$ there. The conditional probabilities are still taken under the original fair law. Lemma 2 supplies the update: two available input positions average their masses; one available input position transports its mass to the unique available output; and an edge with no available input carries zero. Uniform mass on the available set obeys the same rule. Consequently $sum_x w_s \( x \) = 0$, $V_s lt.eq 1$, and $V_s$ is nonincreasing. The same lemma shows that, even after all revealed paths are prescribed, the values at time $s$ depend only on their prefixes through $s$. This adaptedness will permit us to condition before a group of layers; it does not redefine $p_s$ as a law conditioned on all past switches.

#thm([Lemma 13.1.])[
  (Independent translations in the two halves).  #emph[Fix the label order and all switch settings through time $a = s - d + 1$, where $s gt.eq d - 1$. In each of the two halves determined by coordinate $i_s$, independently translate the other $d - 1$ coordinates. The conditional distribution of $\( B_s \, w_s \)$ is invariant under these two translations.]
] <lem:c-palette-half-translations>

#proof[
  The layers from $a$ through $s - 1$ use each coordinate other than $i_s$ once and do not cross the two halves. In either half build the desired translation as those coordinates are processed. If an accumulated translation is already present, reindex the next layer’s coins by that translation; it preserves the matching. If the current coordinate is to be toggled, complement every coin of this layer in that half. This is a bijection of the fair coin arrays and translates all output positions in that coordinate. At an edge with one available input the mass moves to the translated available output. At an edge with two available inputs both outputs receive the same average, so complementing the coin has the same equivariance. Induction over the $d - 1$ layers proves the assertion, and the transformations in the two halves use disjoint coin arrays. ◻
]

The symmetry makes a matching behave, in expectation, like the complete bipartite graph between the halves. This is useful even though the available positions and their masses in a given half are dependent.

#thm([Proposition 13.2.])[
  (Mean endpoint discrepancy).  #emph[For every fixed $0 < delta < 1 \/ 4$, there is a positive integer $C_(*)$ such that the following holds for all sufficiently large $n = 2^d$. Choose $omega$ uniformly and independently of the switches, let $T = C_(*) d$, and put 
$ Delta_r = max_(x in B_T) \| p_T \( x \) - m^(- 1) \| . $

 Then, uniformly for $n - r = m gt.eq delta n$, 
$ bb(E)_(omega \, bb(P)) Delta_r lt.eq n^(- 30) . quad "(13.1)" $ <eq:c-palette-discrepancy>

]
] <prop:c-palette-discrepancy>

#proof[
  Immediately before layer $s$, put $H_b = { x in V : x_(i_s) = b }$ and $m_b = \| B_s ∩ H_b \|$ for $b = 0 \, 1$. Call the configuration balanced if $m_0 \, m_1 gt.eq m \/ 4$. The energy lost at an edge ${ x \, y }$ with two available positions is $\( w_s \( x \) - w_s \( y \) \)^2 \/ 2$. The balance event is translation invariant. Averaging the translation of one half in Lemma 51, the sum over matching edges becomes $1 \/ h$ times the sum over all pairs of available positions in opposite halves. The latter sum equals
  $ m_0 sum_(x in H_1) w_s \( x \)^2 + m_1 sum_(x in H_0) w_s \( x \)^2 - 2 (sum_(x in H_0) w_s \( x \)) (sum_(x in H_1) w_s \( x \)) . $
  The last term is nonnegative because the two sums add to zero. On balance the expression is therefore at least $\( m \/ 4 \) V_s$.
  Conditional on the complete switch setting, the last $m$ labels of the random order form a uniform $m$-set, whose image at time $s$ is again a uniform $m$-set. Each half-count has mean $m \/ 2$. Exposing the set by sampling without replacement gives a Doob martingale with increments of absolute value at most one: couple two possible next draws by exchanging the drawn elements in the remaining completion. The bounded-increment exponential-moment estimate gives
  $ bb(P) { m_b < m \/ 4 } lt.eq exp \( - m \/ 32 \) \, #h(2em) b = 0 \, 1 . $
  This is an unconditional bound for the joint experiment. No concentration conditional on the revealed trajectories is required. Since $V_s lt.eq 1$, for $s gt.eq d - 1$ we obtain
  $ bb(E) V_(s + 1) lt.eq (1 - frac(m, 8 h)) bb(E) V_s + O \( e^(- c_delta n) \) lt.eq \( 1 - delta \/ 4 \) bb(E) V_s + O \( e^(- c_delta n) \) . $
  The symmetry windows may overlap: each use gives an expectation inequality and asserts no independence between windows. Iteration, followed by $Delta_r lt.eq sqrt(V_T)$ and Jensen’s inequality, gives
  $ bb(E) Delta_r lt.eq (\( 1 - delta \/ 4 \)^(T - d + 1) + O \( e^(- c_delta n) \))^(1 \/ 2) . $
  Choosing the integer $C_(*)$ sufficiently large proves (13.1), uniformly in $m$. ◻
]

=== 13.1 Selecting the partition before selecting a color constraint <selecting-the-partition-before-selecting-a-color-constraint>

Put $v = floor.l delta n floor.r$. First choose a uniform partition $V = A union.sq B$ with $\| A \| = \| B \| = h$. There are two order distributions: $A$ first and then $B$, each uniformly ordered internally, and the reversed convention. Before the partition is fixed, each distribution is a uniform order of all labels. Proposition 52 therefore allows us to choose a deterministic partition for which

$ bb(E)_(bb(P)) Z lt.eq 2 n^(- 29) \, #h(2em) Z = bb(E)_(omega : A \, B) sum_(r = 0)^(n - v - 1) Delta_r + bb(E)_(omega : B \, A) sum_(r = 0)^(n - v - 1) Delta_r . $

The last retained rank leaves at least $v + 1 > delta n$ sites, as needed. Fix this partition from now on, and retain the event

$ cal(E) = { Z lt.eq n^(- 6) } \, #h(2em) z = bb(P) \( cal(E) \) . $

Markov’s inequality gives

$ 1 - z lt.eq 2 n^(- 23) . quad "(13.2)" $ <eq:c-palette-retained-mass>

Let $mu$ be the endpoint law under $bb(P)$ and $nu$ its endpoint law under $bb(P) \( thin dot.op divides cal(E) \)$. The event $cal(E)$ lives on switch settings and need not be determined by the endpoint. Nevertheless data processing gives $parallel nu - mu parallel_(upright("TV")) lt.eq 1 - z$.

A palette of $B$ is a partition into nonempty color classes of sizes $l_1 \, dots.h \, l_u$. Set $p_i = l_i \/ h$ and $cal(H) \( p \) = - sum_i p_i log p_i$, and let $H$ permute each color class while fixing $A$ pointwise. The coset $g H$ fixes every output of $A$ and the output set of each color class of $B$.

We apply the information lemma for retained reveal experiments [14] Lemma 12.1, #emph[with both order distributions and this same event $cal(E)$]. Its hypothesis is a pointwise cap on the order-average sum of endpoint errors, together with the fair conditional bound

$ bb(P) { upright("next endpoint lies in a target set of size ") a divides upright("revealed paths") } lt.eq a \/ m + n Delta_r . $

Here the latter follows by summing the conditional probabilities over the available target sites, and the former is exactly the definition of $cal(E)$. The role of the pointwise bound is seen by conditioning the fair law on $cal(E) ∩ { g in g_0 H }$, for a fixed coset $g_0 H$ when this event has positive probability. The lemma’s entropy chain gives

$ - log bb(P) \( cal(E) ∩ { g in g_0 H } \) gt.eq log \[ S_n : H \] - v cal(H) \( p \) - n^2 n^(- 6) . $

At each revealed rank, a prescribed target costs its uniform logarithmic probability up to $n^2 Delta_r$. Their order-averaged sum is bounded on every retained setting, so the same error bound holds under this rare conditioning. The missing $v$ ranks belong to the second half; their mean logarithmic multinomial count is at most $v cal(H) \( p \)$. Dividing the resulting probability bound by $z$ gives

$ nu \( g H \) lt.eq \[ S_n : H \]^(- 1) exp { v cal(H) \( p \) + n^(- 4) - log z } \, quad "(13.3)" $ <eq:c-palette-coset-cap>

simultaneously for all palettes and all cosets, and also with $A \, B$ interchanged. The mean-discrepancy estimate (13.1) was used to choose $cal(E)$ under the original law; only the pointwise bound on $cal(E)$ enters the rare-event argument.

#thm([Corollary 13.3.])[
  (Palette application).  #emph[There is an absolute positive integer $C_(*)$ for which the full Thorp permutation law after $30 C_(*) d$ physical shuffles has total-variation distance tending to zero from uniform, uniformly over starting decks.]
] <cor:c-palette-mixing>

#proof[
  The signed-palette lemma [14] Lemma 12.3 gives an absolute constant $C_(upright("pal"))$: every irreducible half-group type $beta$ has a palette and a product of trivial or sign characters occurring in it, with $h cal(H) \( p \) lt.eq C_(upright("pal")) log D_beta$. Choose $delta < 1 \/ 4$ so that $2 delta C_(upright("pal")) lt.eq 1 \/ 10$, and only then choose $C_(*)$ in Proposition 52. Since $v lt.eq 2 delta h$ and $n^(- 4) - log z = o \( 1 \)$, (13.3) gives
  $ nu \( g H \) lt.eq frac(2 D_beta^(1 \/ 10), \[ S_n : H \]) $
  for large $n$. It holds for every placement of these color classes and hence every conjugate in either half-group. More precisely, (13.3), with $epsilon_n = n^(- 4) - log z = o \( 1 \)$ and the chosen $delta$, verifies the full entropy-form hypotheses for every palette in the signed-palette transfer [14] Theorem 12.4, whose conclusion is
  $ parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 1 \/ 6) quad #scale(x: 120%, y: 120%)[\(] lambda eq.not \( n \) \, \( 1^n \) #scale(x: 120%, y: 120%)[\)] . $
  Here $D_lambda$ is the irreducible degree and $hat(nu) \( lambda \) = sum_g nu \( g \) rho_lambda \( g \)$ in a unitary model.
  The original block has zero mean sign: conditioning on all but one coin in its final layer, flipping that coin composes the endpoint with a transposition. Clipping on settings therefore gives $\| hat(nu) \( upright("sgn") \) \| lt.eq \( 1 - z \) \/ z = o \( 1 \)$. For thirty independent factors, Plancherel and $parallel M parallel_(upright("HS")) lt.eq sqrt(D_lambda) parallel M parallel_(upright("op"))$ bound the nontrivial, nonsign contribution by
  $ sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(2 - 30 \/ 3) = sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(- 8) = o \( 1 \) \, $
  using the reciprocal-degree conclusion proved in that theorem. The sign contribution also tends to zero. Thus $nu^(* 30)$ tends to uniform in total variation. Replacing its thirty factors by $mu$ costs at most $30 \( 1 - z \) = o \( 1 \)$. Each factor has $C_(*) d$ physical shuffles, and changing the starting deck translates the group law. This proves the claim. ◻
]

== 14 Delayed energy and two-sided kernel information <lifts:three-groups>

The previous arguments controlled endpoint laws or coset masses. A kernel on complete decks can instead retain the sets of positions occupied by three groups of labels and Fourier transform only the internal permutations of each group. Its remaining matrix has rows and columns indexed by those position sets. We therefore need both forward and stationary-reverse marginal estimates. The scalar estimate below is deliberately valid one layer before the block endpoint: that extra time statement will justify cancellation in the all-sign matrix block. The full-deck theorem at the end illustrates how this two-sided kernel information can be amplified; the additional content here is the control of its quotient and sign matrices.

#thm([Lemma 14.1.])[
  (A delayed energy contraction).  #emph[For any periodic repetition of a permutation of the $d$ coordinate directions, every specified ordered tuple of $k lt.eq 3 n \/ 4$ distinct cards, from every deterministic start, has total-variation distance at most $n^(- 10)$ from the uniform injective tuple after $t gt.eq 2000 d - 1$ layers, for sufficiently large $d$. The same bound holds for the stationary reverse of the physical Thorp shuffle.]
] <lifts:delayed-marginal>

#proof[
  Fix $q$ observed cards and one tag, with $h = n - q gt.eq n \/ 4$ available positions. Let $B_t$ be this available set at time $t$. The conditional tag law $p_t$ on $B_t$ is the path-prefix flow of Lemma 2. Its centered energy
  $ E_t = sum_(x in B_t) \( p_t \( x \) - 1 \/ h \)^2 $
  is at most one and nonincreasing. In the notation of Section 3, $B_t$ is $V_t$, $h$ is $m$, and $E_t = parallel f_t parallel_2^2$ is the realized energy. Here layer $s$ means the step from $s - 1$ to $s$; write $j_s = i_(s - 1)$ for its coordinate direction. Let $cal(F)_s$ contain all switches through layer $s$. Conditioning on this larger past fixes the path-defined function $p_s$; it does not redefine it as the tag’s law conditional on all card positions.
  For $t > d$, put $u = t - d$, $i = j_t = j_u$, and $H_b = { x in V : x_i = b }$ for $b = 0 \, 1$. Between layers $u$ and $t$, every coordinate other than $i$ occurs once. The two coordinate-$i$ half counts $h_b = \| B_u ∩ H_b \|$ are consequently fixed by $cal(F)_u$. The delayed half-space symmetry [16] Lemma 10.1 states that the terminal pair consisting of the available set and its centered mass vector is invariant, conditional on $cal(F)_u$, under every map $T_z x = x + x_i z$, $z_i = 0$. It applies to every nonempty starting available set and every probability vector supported on it. The future switches in the intervening distinct coordinates are independent of $cal(F)_u$.
  For clarity, its energy consequence has no hidden normalization. Averaging over a uniform $z$ aligns each pair of opposite-half available positions with probability $2 \/ n$. Set $a \( x \) = p_(t - 1) \( x \) - upright(bold(1))_(B_(t - 1)) \( x \) \/ h$ for $x in V$; the mean loss in the final layer is thus
  $ 1 / n sum_(x in B_(t - 1) ∩ H_0 \, med y in B_(t - 1) ∩ H_1) \( a \( x \) - a \( y \) \)^2 gt.eq frac(min \( h_0 \, h_1 \), n) E_(t - 1) . $
  The inequality follows by writing $A = sum_(B_(t - 1) ∩ H_0) a$: the double sum is $h_1 sum_(H_0) a^2 + h_0 sum_(H_1) a^2 + 2 A^2$, since $sum_x a \( x \) = 0$. Therefore
  $ bb(E) \( E_(t - 1) - E_t divides cal(F)_u \) gt.eq frac(min \( h_0 \, h_1 \), n) bb(E) \( E_(t - 1) divides cal(F)_u \) . quad "(14.1)" $ <lifts:conditional-shear-loss>
  Call the split bad if $min \( h_0 \, h_1 \) < h \/ 4$. Conditional on $cal(F)_(u - 1)$, its count difference after layer $u$ is a sum of independent fair signs, one for each pair with exactly one available position. Its second moment is at most $h$, so the bad probability is at most $4 \/ h lt.eq 16 \/ n$. Crucially, we charge this event against the earlier energy $E_(u - 1)$, which is known before those signs are drawn, rather than treating it as independent of $E_(t - 1)$. Monotonicity gives, with $a_t = bb(E) E_t$ and $eta = 1 \/ 16$,
  $ a_t lt.eq \( 1 - eta \) a_(t - 1) + eta \( 16 \/ n \) a_(t - d - 1) #h(2em) \( t > d \) . quad "(14.2)" $ <lifts:delay-recurrence>
  Set $gamma = 1 \/ 64$. The bound $a_t lt.eq e^(- gamma \( t - d \))$ is trivial for $t lt.eq d$, and induction in the recurrence proves it thereafter because
  $ \( 1 - eta \) e^gamma + \( 16 eta \/ n \) e^(gamma \( d + 1 \)) lt.eq 1 $
  for all sufficiently large $d$. The first term is strictly below one, and the second tends to zero since $gamma < log 2$.
  The expected tag error is at most $1 / 2 sqrt(h a_t)$. Lemma 3, after forgetting paths but retaining endpoints, bounds the tuple error by
  $ 1 / 2 k sqrt(n e^(- gamma \( t - d \))) lt.eq 1 / 2 n^(3 \/ 2) e^(- \( 1999 d - 1 \) \/ 128) lt.eq n^(- 10) . $
  The last inequality uses $t gt.eq 2000 d - 1$. A reverse physical step is the inverse random position map. Undoing its inverse coordinate rotations again gives a cyclic schedule of coordinate matchings, with a deterministic change of phase. The proof covers every such order and phase, proving the reverse assertion. ◻
]

#thm([Theorem 14.2.])[
  (Three-group amplification).  #emph[The worst-start full-deck total-variation distance tends to zero after $30000 d$ physical Thorp shuffles. The proof uses fifteen independent blocks of length $2000 d$ and three groups of labels.]
] <lifts:three-group-theorem>

#proof[
  Partition the labels into three groups of sizes $m_i$ differing by at most one. For large $d$, each $m_i gt.eq n \/ 4$ and $m_i arrow.r oo$. Encode a deck as $\( s \, g \)$, where $s = \( S_1 \, S_2 \, S_3 \)$ records the position sets occupied by the groups. Fix an ordering of each label group and, for each $s$, a reference bijection $r_(s \, i) : \[ m_i \] arrow.r S_i$. In the deck $\( s \, g \)$, the $a$th label of group $i$ occupies $r_(s \, i) \( g_i \( a \) \)$, with $g = \( g_1 \, g_2 \, g_3 \)$. Let
  $ H = product_(i = 1)^3 S_(m_i) \, quad cal(S) = { upright("ordered position partitions of these sizes") } \, quad M = \| cal(S) \| = n ! \/ product_i m_i ! . $
  The $T = 2000 d$ kernel $K$ has convolution fibers
  $ K \( \( s \, g \) \, \( s' \, g' \) \) = p_(s \, s') \( g' g^(- 1) \) . $
  Indeed, a position increment $tau$ taking $s$ to $s'$ changes $g_i$ to $h_i g_i$, where $h_i = r_(s' \, i)^(- 1) tau r_(s \, i)$. The law of $\( s' \, h \)$ given $s$ is independent of the internal assignment $g$, proving the formula. The kernel is bistochastic because every position increment acts bijectively on decks. The reverse fibers are $macron(p)_(s' \, s) \( h \) = p_(s \, s') \( h^(- 1) \)$.
  Put $H_(- i) = product_(j eq.not i) S_(m_j)$, $M_i = M \| H_(- i) \|$, and
  $ p_(s \, s')^(\( - i \)) \( h_(- i) \) = sum_(h_i) p_(s \, s') \( h \) . $
  The positions of labels outside group $i$ determine $\( s' \, h_(- i) \)$, whose uniform law has $M_i$ atoms. With $delta = n^(- 10)$, Lemma 54 at $T$ gives absolute row error at most $2 delta$ from this uniform quotient. Its reverse assertion gives absolute column error at most $2 delta$, after inversion of the internal group elements. These are the two quotient hypotheses of [14] Theorem 9.2.
  Its remaining scalar hypothesis concerns the product of the three sign characters. We verify it for the untrimmed kernel. Condition on the first $T - 1$ layers. If two cards of group 1 occupy a pair in the final matching, flipping that pair’s coin preserves the output position partition $s'$ and changes the product of the internal signs. The conditional signed contribution to each $s'$ therefore cancels. The absolute row sum of the all-sign block is at most the probability that no such pair exists. At $T - 1$, Lemma 54 makes the group-1 position set within $delta$ of a uniform $m_1$-subset. A uniform subset avoids containing a whole pair with probability
  $ product_(j = 0)^(m_1 - 1) (1 - frac(j, n - j)) lt.eq exp (- frac(m_1 \( m_1 - 1 \), 2 n)) . $
  This follows by sampling its points in order: after $j$ points with no completed pair, exactly $j$ partners are forbidden among the $n - j$ remaining positions. The bound tends to zero. Apply the same argument to the reverse kernel, using its $T - 1$ preceding reverse layers and a canceling final reverse layer. In physical coordinates the final reverse step first rotates the coordinates and then switches a matching. That fixed rotation preserves the uniform subset law and its variation bound, so the same pair-avoidance estimate applies just before the canceling switches. This gives the same bound on the original absolute column sums. Thus the untrimmed all-sign row and column norms are $o \( 1 \)$, as required. A theorem only at time $T$ would not justify this step.
  All hypotheses of the three-group transfer are now verified. More explicitly, it retains only fibers satisfying
  $ p_(s \, s')^(\( - i \)) \( h_(- i) \) lt.eq 2 \/ M_i #h(2em) \( i = 1 \, 2 \, 3 \) \, $
  losing at most $6 delta$ in each row and column. For each product type of degrees $D_i$, its retained block $B_rho$ satisfies $parallel B_rho parallel_(upright("HS"))^2 lt.eq 4 D_i \/ product_(j eq.not i) D_j$. Writing $D = product_i D_i$, fifteen factors, including the regular multiplicity $D$, contribute at most $2^30 D^(- 4)$ for $D > 1$. The transfer also treats all eight scalar types: quotient row and column bounds handle those with a trivial factor, and the verified all-sign cancellation handles the last one. It concludes average row convergence of $K^15$ to uniform.
  Finally the original shuffle kernel is equivariant under arbitrary relabelings, and those relabelings act transitively on decks. Every row of $K^15$ consequently has the same distance from uniform, so average convergence is worst-start convergence. Fifteen blocks take $15 T = 30000 d$ physical shuffles. ◻
]

== 15 Baseline walkers and the exact kernel of a sweep <sec:c-baseline-forest>

For this method it is enough to bound the relative entropy of a large marginal by a power of $log n$; it need not tend to zero. A walker moving along the paths of one realization of the shuffle gives that weaker bound by a collision calculation. We then obtain a separate estimate for representations with a long first row directly from the unique paths through one sweep. The two estimates enter different ranges of the abstract hybrid transfer. Unlike the vanishing entropy estimate of Section 11, this is an alternative derivation that combines weak entropy with additional sparse Fourier information.

Throughout this section $V = bb(F)_2^d$, $n = 2^d$, and layers use the coordinate directions $1 \, dots.h \, d$ cyclically, with independent fair switches. One sweep starts at direction $1$ and consists of $d$ physical shuffles. Write $K$ for its permutation law. All logarithms in entropy expressions are natural logarithms.

=== 15.1 A walker on a baseline realization <a-walker-on-a-baseline-realization>

#thm([Proposition 15.1.])[
  (A weak entropy bound for large marginals).  #emph[There is an absolute positive integer $C_0$ such that the following holds for all sufficiently large $d gt.eq 4$. Let $mu$ be the permutation law after $C_0 d$ layers. If $I$ is a uniform ordered list of $15 n \/ 16$ distinct input labels, independent of the shuffle, and $u_I$ is its uniform injection law, then 
$ bb(E)_I D \( mu_I bar.v.double u_I \) = O \( \( 1 + d \)^4 \) . $

]
] <prop:c-baseline-entropy>

We first prove the collision estimate that supplies the proposition. Fix a distinguished input label $j$ and a uniform set $A$ of $m$ active labels containing $j$, where $m gt.eq epsilon.alt n$ and $epsilon.alt = 1 \/ 16$. The labels outside $A$ will be revealed. Independently sample a #emph[baseline] realization of every switch. A second walker starts at $j$ and travels along the baseline paths. When its current baseline path is paired with another active path, toss a fresh fair coin to decide whether to toggle to that other path. If the partner is inactive, stay on the current path. Staying means following that baseline path through the current switch.

Given all revealed inactive paths, let $q$ be the conditional endpoint law of $j$. Lemma 2 leaves every unvisited switch independent and fair. Fix the entire baseline realization and average only the extra toggle coins. The walker’s endpoint still has law $q$: a pair of active paths offers the two available outputs with equal probabilities, and an active–inactive pair has only one available output. These are exactly the conditional-flow rules, independently of the baseline choices on active–active switches. If $X_j$ is the baseline endpoint of $j$, the conditional collision probability given that baseline is therefore $q \( X_j \)$. Averaging first over baselines with the same inactive paths gives $sum_x q \( x \)^2$, and hence

$ bb(E) sum_x q \( x \)^2 = bb(P) { upright("walker and baseline ") j upright(" have the same endpoint") } . quad "(15.1)" $ <eq:c-baseline-collision-identity>

The expectation includes the random active set and baseline.

#thm([Lemma 15.2.])[
  (Coincidence estimate).  #emph[For a sufficiently large absolute integer $C_0$, at $t = C_0 d$, 
$ bb(P) { upright("walker and baseline ") j upright(" coincide at ") t } lt.eq 1 / m + O #scale(x: 120%, y: 120%)[\(] \( 1 + t \)^3 \/ n^2 #scale(x: 120%, y: 120%)[\)] \, quad "(15.2)" $ <eq:c-baseline-coincidence>

 uniformly over $m gt.eq epsilon.alt n$ and $j$.]
] <lem:c-baseline-coincidence>

#proof[
  We first compare the xor of the two positions with an ideal chain that contracts over blocks of four sweeps. We then control the actual transition error by estimating coincidence and the joint event of coincidence with a repeated partner. Two inverse-$n$ costs make this error small enough to telescope through the remaining kernels.
  Write $D_s$ for the binary xor of the walker position and the position of the baseline path of $j$ immediately before layer $s$. We generate the baseline chronologically, and reveal whether a label is active only when the walker queries it. Apart from $j$, activity statuses are a uniform sample of $m - 1$ active labels from $n - 1$ possibilities. A partner’s identity is known before the current layer’s fresh coins are sampled, so such adaptive queries preserve sampling without replacement among unqueried labels. At most $1 + t$ labels are queried through time $t$.
  Consider layer $s$ in direction $i = i_s$. If $D_s in.not { 0 \, e_i }$, the two distinguished paths use distinct switches. Their new xor bit in coordinate $i$ is fair, independently of the history, and the other bits are unchanged. If $D_s = e_i$, the walker is paired with $j$ and a fair toggle makes the new xor either $0$ or $e_i$. If $D_s = 0$, the new xor becomes $e_i$ precisely when the partner of $j$ is active and the walker toggles to it.
  Define ideal kernels $Q_s$ by the same rules, replacing the last activity probability by the constant
  $ p = frac(m - 1, n - 1) . $
  They have a common stationary law
  $ pi \( 0 \) = 1 / m \, #h(2em) pi \( x \) = p / m quad \( x eq.not 0 \) . $
  Indeed $1 + \( n - 1 \) p = m$. The edge ${ 0 \, e_i }$ balances because $pi \( 0 \) p \/ 2 = pi \( e_i \) \/ 2$, and every other coordinate pair has equal masses and a fair refresh.
  We need a uniform contraction estimate for products of these ideal kernels. Call a layer exceptional when its input is $0$ or $e_i$. Once a run of consecutive exceptional layers ends, its output is a singleton. That singleton bit cannot disappear until its coordinate is next updated, so there are at least $d - 1$ nonexceptional layers before a new exceptional run. A new run following these layers requires $d - 1$ specified zero outputs of fair refreshed bits and has probability at most $2^(- \( d - 1 \))$. A run continuing for at least $d$ layers must keep outputting zero until its last layer; from any specified start its probability is at most $\( 1 - p \/ 2 \)^(d - 2)$. This also covers the first singleton-to-zero move, whose probability $1 \/ 2$ is no larger than $1 - p \/ 2$.
  In a block of $4 d$ layers, a union bound therefore gives, uniformly in the starting state,
  $ bb(P) { upright("an exceptional layer occurs in the last ") d upright(" layers") } lt.eq C d #scale(x: 120%, y: 120%)[\(] 2^(- \( d - 1 \)) + \( 1 - p \/ 2 \)^(d - 2) #scale(x: 120%, y: 120%)[\)] . $
  A run that starts early and reaches the last $d$ layers is long; a later start has the preceding $d - 1$ fair refreshes just described. Couple two ideal chains by common random bits, using the same refreshed bit whenever both are nonexceptional and keeping them together once they agree. If neither has an exception in the last $d$ layers, all coordinates have been refreshed identically and the endpoints agree. Since $p gt.eq epsilon.alt \/ 2$ for large $n$, there is an absolute $beta > 0$ for which every $4 d$-layer ideal product has total-variation contraction coefficient at most $n^(- beta)$.
  We now compare the actual xor law $gamma_s$ with this ideal chain. Only the case $D_s = 0$ can differ. At an unqueried partner, sampling without replacement changes its conditional activity probability from $p$ by $O \( \( 1 + t \) \/ n \)$, uniformly through time $t = O \( d \)$. At a previously queried partner use the bound one. Thus
  $ parallel gamma_(s + 1) - gamma_s Q_s parallel_(upright("TV")) lt.eq bb(P) { D_s = 0 \, med upright("partner previously queried") } + O \( \( 1 + t \) \/ n \) bb(P) { D_s = 0 } . quad "(15.3)" $ <eq:c-baseline-one-step-error>
  The remaining task is to get a second factor $1 \/ n$ in the first term.
  First dispose of trajectories that have never split from $j$. Define an auxiliary test along the baseline path of $j$, regardless of whether the actual walker has already left it. Sample an independent potential toggle coin at every layer, using it for the actual walk whenever a toggle is allowed. In each successive block of $2 d$ layers, monitor only the last $d$ layers. At a monitored layer, query the partner’s activity and use the walker’s toggle coin to test for an active toggle. Reveal no unmonitored activity statuses for this test. If the actual walker never splits, every monitored test fails. We bound this larger event using only the monitored-test history. The partners of $j$ at these monitored layers are distinct: once a baseline path is paired with $j$, it leaves with an opposite output bit, and that bit is not updated again during the monitored interval. Condition on the baseline history and monitored queries at the beginning of the block. For any previously queried label and any monitored layer, becoming the partner of $j$ requires matching the preceding $d - 1$ output bits while using distinct switches. Otherwise a previous shared switch leaves an opposite bit that persists. Sequential exposure of the fresh distinct switches bounds this probability by $2^(- \( d - 1 \))$. A union bound over the $d$ layers and $O \( 1 + t \)$ known labels bounds the probability of an old partner by $O \( d \( 1 + t \) \/ n \)$.
  On a sequence of fresh partner queries the remaining active density is at least $epsilon.alt \/ 2$ for large $n$, since $t = O \( d \)$. At each monitored layer an active toggle therefore has conditional probability at least $epsilon.alt \/ 4$. The probability of avoiding all such toggles while the partners stay fresh is at most $\( 1 - epsilon.alt \/ 4 \)^d$. Repeating this conditional estimate at successive block starts, with no conditioning on unmonitored toggle outcomes, gives
  $ bb(P) { upright("no split through ") C_1 d } lt.eq #scale(x: 120%, y: 120%)[\(] O \( d \( 1 + t \) \/ n \) + \( 1 - epsilon.alt \/ 4 \)^d #scale(x: 120%, y: 120%)[\)]^(floor.l C_1 \/ 2 floor.r) lt.eq n^(- 3) $
  for a sufficiently large absolute integer $C_1$.
  Any other coincidence at time $s gt.eq C_1 d$ has a last collapse layer $u < s$: its input xor is $e_(i_u)$, it collapses to zero, and it stays zero through time $s$. Necessarily $u gt.eq d$, since the singleton created at the initial split persists until its next coordinate update. In the $d - 1$ layers $u - d + 1 \, dots.h \, u - 1$, the walker and $j$ use distinct switches and output equal updated bits. If they were coincident in that interval, a subsequent split would leave a bit that could not disappear before $u$; an earlier partner layer likewise cannot produce a different admissible history. Consequently the contribution from a fixed $u$ is at most $2^(- \( d - 1 \))$, and
  $ bb(P) { D_s = 0 } lt.eq n^(- 3) + 2 t \/ n . quad "(15.4)" $ <eq:c-baseline-rough-coincidence>
  For the joint event in (15.3), fix a last collapse layer $u$ and let $E_u$ be the event that the walker collapses at $u$, stays on $j$ through time $s$, and the partner at $s$ has been queried previously. The first $1 \/ n$ cost comes from the equal-bit window ending at $u$; the second comes from the final partner matching $j$ in the window ending at $s$. These windows may overlap, so their costs cannot be multiplied by an independence claim.
  Start from the true history at $u - d + 1$ and define a sequential law $tilde(bb(P))_u$ that is allowed to abort. At each of the next $d - 1$ layers, query the needed status and choose the walker toggle as usual. Abort if the two distinguished switches coincide. Otherwise sample their fresh coins conditional on the resulting output bits being equal; this conditioning has probability exactly $1 \/ 2$. Sample all other switches ordinarily. At layer $u$, abort unless the two paths are partners, then force the walker to collapse onto $j$. Thereafter query the needed statuses and force the walker to stay on $j$ through time $s$. No conditioning on a future successful completion is used. Every true history contributing to $E_u$ has likelihood at most $2^(- \( d - 1 \))$ times its likelihood under $tilde(bb(P))_u$: the equalities each cost $1 \/ 2$, and the forced decisions discard only factors at most one. It remains to bound the probability of a previously queried final partner under this law.
  Let $W$ consist of the $d - 1$ layers immediately preceding $s$. Throughout $W$ the two distinguished outputs have matching updated bits, either by the equality construction or by coincidence after $u$. A baseline label $b eq.not j$ that is the partner of $j$ at $s$ cannot have touched either distinguished switch during $W$. At a switch of $j$ it would leave with the opposite bit. At a switch of the walker it either leaves with the opposite bit or follows the walker; in the latter case it must later leave before time $s$, again creating an opposite bit. Every coordinate used in $W$ is different from $i_s$ and is used only once, so any such bit would persist and preclude partnership at $s$. It follows also that a previously queried final partner was queried before $W$: all status queries inside $W$ concern labels touching the walker’s switch there.
  Condition on the simulated history before $W$. There are only $O \( 1 + t \)$ earlier queried candidates. For each candidate, matching the $d - 1$ required bits without touching either distinguished switch has probability at most $2^(- \( d - 1 \))$. At each step its separate switch is fresh and independent of the distinguished bit, even when the two distinguished coins are being sampled conditional on equality. Abort conditions can only reduce this probability. Thus the probability of a previously queried final partner under $tilde(bb(P))_u$ is $O \( \( 1 + t \) \/ n \)$. The likelihood comparison now gives
  $ bb(P) \( E_u \) lt.eq 2^(- \( d - 1 \)) O \( \( 1 + t \) \/ n \) = O \( \( 1 + t \) \/ n^2 \) . $
  Sum over $u < s$ and include the no-split contribution. Together with (15.4), this proves, for $s gt.eq C_1 d$,
  $ parallel gamma_(s + 1) - gamma_s Q_s parallel_(upright("TV")) = O \( \( 1 + t \)^2 \/ n^2 \) . $
  Now follow $C_1 d$ by a fixed number $b > 3 \/ beta$ of $4 d$-layer blocks. The ideal product sends any law to within $n^(- 3)$ of $pi$. Telescoping the actual errors through the remaining Markov kernels, which contract total variation, costs $O \( \( 1 + t \)^3 \/ n^2 \)$. With $C_0 = C_1 + 4 b$ we have
  $ parallel gamma_t - pi parallel_(upright("TV")) lt.eq n^(- 3) + O \( \( 1 + t \)^3 \/ n^2 \) \, #h(2em) t = C_0 d . $
  Since $pi \( 0 \) = 1 \/ m$, this proves (15.2). ◻
]

#proof[
  Use the entropy chain rule for the uniformly ordered input list. At each rank, reveal in addition the entire paths of the earlier labels; this can only increase the conditional relative entropy from the uniform available endpoint. The remaining active set has size $m gt.eq n \/ 16$, and its next label is uniform in that set. By label symmetry of the uniform order, one may fix that next label as $j$ and take the other active labels uniformly among the remaining labels, exactly as in Lemma 57. For the resulting conditional endpoint law $q$,
  $ D \( q bar.v.double U_m \) lt.eq m sum_x q \( x \)^2 - 1 . $
  Equations (15.1) and (15.2) bound its mean by $O \( m \( 1 + t \)^3 \/ n^2 \)$. Summing over at most $n$ ranks gives $O \( \( 1 + t \)^3 \)$, and $t = C_0 d$ proves the stated result. ◻
]

=== 15.2 The exact kernel on a short ordered tuple <the-exact-kernel-on-a-short-ordered-tuple>

The weak entropy estimate leaves representations with a long first row for a different argument. Their action is visible in short tuples, where a sweep has an explicit endpoint kernel. For a partition $lambda tack.r n$, let $D_lambda$ be its irreducible degree and let $hat(K) \( lambda \)$ be the average of its unitary representation matrices under $K$.

The next lemma isolates the path calculation common to this operator estimate and the Hilbert–Schmidt estimate in Section 16. The probabilistic entropy arguments in the two sections are different; only this one-sweep kernel is shared.

#thm([Lemma 15.3.])[
  (The prescribed-path kernel and isolation cancellation).  #emph[Let $1 lt.eq k lt.eq n$ and let $x = \( x_a \)_(a = 1)^k$ and $y = \( y_a \)_(a = 1)^k$ be tuples distinct on each side. The prescribed path from $x_a$ to $y_a$ replaces the input bits by the output bits in sweep order. For $a < b$, let $J$ be the last coordinate in which $x_a \, x_b$ differ and $I$ the first coordinate in which $y_a \, y_b$ differ. Define 
$ u_(a b) = cases(delim: "{", 0 \, & I < J \,, 1 \, & I = J \,, - 1 \, & I > J .) $

 For $T subset.eq \[ k \]$, put 
$ F_T \( x \, y \) = product_(a < b thin \; med a \, b in T) \( 1 + u_(a b) \) \, #h(2em) F_(*) \( x \, y \) = sum_(T subset.eq \[ k \]) \( - 1 \)^(k - \| T \|) F_T \( x \, y \) . $

 Then $F_T = n^(\| T \|) Pr_K { g x_a = y_a upright(" for every ") a in T }$. In particular, the tuple transition kernel is 
$ K \( x \, y \) = n^(- k) F_(\[ k \]) \( x \, y \) . quad "(15.5)" $ <eq:c-true-sweep-pair-kernel>

 Join $a \, b$ when their prescribed paths use a common switch; equivalently, when $u_(a b) eq.not 0$. If this graph has an isolated vertex, then $F_(*) = 0$. For all such tuples, 
$ \| F_(*) \( x \, y \) \| lt.eq 2^k k^(k \/ 2) . quad "(15.6)" $ <eq:c-true-sweep-prefix-bound>

]
] <lem:c-sweep-kernel>

#proof[
  The prescribed path of card $a$ is unique: successively replace its input bits by its output bits in sweep order. The three cases in the definition of $u_(a b)$ describe its interaction with the path of $b$. The first case has no shared switch, the second has exactly one shared switch with consistent opposite outputs, and the third forces a vertex collision. For $r = \| T \|$ prescribed paths, the bits cost $2^(- d r)$ before identifying shared switches; each consistent shared switch saves a factor two. A collision makes both the probability and the product zero. This proves the formula for $F_T$. If a vertex is isolated, including or omitting it does not change $F_T$, so its two terms in the alternating sum cancel.
  To bound the alternating sum, consider a compatible subset $T$ of $r lt.eq k$ paths. Its product is $F_T = 2^(s_T)$, where $s_T$ counts their shared switches. The empty subset contributes one; for $r gt.eq 1$, arrange the output words in a binary prefix tree. At a node with child counts $a \, b$, every shared switch sends one path into each child, so at most $min \( a \, b \)$ switches are shared there. The inequality
  $ min \( a \, b \) lt.eq frac(\( a + b \) log_2 \( a + b \) - a log_2 a - b log_2 b, 2) $
  uses $0 log_2 0 = 0$ and follows from concavity of binary entropy, which is at least twice its smaller argument. Sum over all nodes; the right side telescopes to $r log_2 r \/ 2$, bounding $s_T$. The product is at most $r^(r \/ 2) lt.eq k^(k \/ 2)$, and summing its at most $2^k$ appearances proves (15.6). ◻
]

#thm([Proposition 15.4.])[
  (True-sweep sparse estimate and row cutoff).  #emph[For all sufficiently large $d$, 
$ parallel hat(K) \( lambda \) parallel_(upright("op")) lt.eq n^(- k \/ 10) quad upright("if") quad 1 lt.eq k = n - lambda_1 lt.eq n^(1 \/ 20) . quad "(15.7)" $ <eq:c-true-sweep-sparse>

 If $lambda$ has more than $n \/ 2$ rows, then $hat(K) \( lambda \) = 0$.]
] <prop:c-true-sweep-sparse>

#proof[
  We use the classical branching and Young rules in the conventions of [17,4]. The permutation representation on ordered distinct $k$-tuples is $"Ind"_(S_(n - k))^(S_n) upright(bold(1))$. By branching it contains $lambda$ precisely when $lambda_1 gt.eq n - k$. When $k = n - lambda_1$, its $lambda$-isotypic space is orthogonal to functions omitting any specified coordinate: these carry the $\( k - 1 \)$-tuple representation, which contains no copy of $lambda$. Thus each function in this space, extended by zero to tuples with repetitions, has sum zero on varying any one coordinate.
  Take two such test functions and use the kernel of Lemma 58. Extend each $u_(a b)$ arbitrarily on pair repetitions, preserving its dependence on just the two indicated input and output coordinates. Every proper-subset term $F_T$ vanishes in the bilinear form after integrating an omitted coordinate, so we may replace $F_(\[ k \])$ by $F_(*)$. Under independent uniform input and output coordinates, each zero-extended function has squared norm $a_k = \( n \)_k \/ n^k$ times its squared norm under the uniform injection law. By (15.5), the bilinear form has the same factor $a_k$ relative to the Markov bilinear form. Hence the resulting operator bound transfers without loss to the injection normalization. Acting on functions instead of masses may replace the Fourier matrix by its adjoint, which has the same operator norm.
  If there are no isolated vertices, choose a spanning forest in each nontrivial component of the nonzero-edge graph. Its number of edges satisfies $k \/ 2 lt.eq e lt.eq k - 1$. For an upper bound there are at most $k^(2 e)$ candidate forests with $e$ edges and at most $d^e$ choices of the edge coordinates $J$. A nonzero edge requires equality of the input suffix after $J$ and equality of the output prefix before $J$. For a fixed forest and choices of $J$, write its requirement indicator as $A \( x \) B \( y \)$. For each bit, the edges imposing equality form a subforest, so there is one independent binary constraint per edge; choose the bits successively from roots to leaves. It follows that
  $ bb(E)_x A \( x \) = 2^(- sum_(upright("edges")) \( d - J \)) \, #h(2em) bb(E)_y B \( y \) = 2^(- sum_(upright("edges")) \( J - 1 \)) . $
  The kernel $A \( x \) B \( y \)$ has operator norm equal to the geometric mean of these probabilities, namely $\( 2 \/ n \)^(e \/ 2)$. One may also obtain the same value by the row and column bounds in Schur’s test. Taking absolute values of the test functions, using (15.6), and summing this domination gives for $k gt.eq 2$ the bound
  $ 2^k k^(k \/ 2) sum_(ceil.l k \/ 2 ceil.r lt.eq e lt.eq k) #scale(x: 120%, y: 120%)[\(] k^2 d sqrt(2 \/ n) #scale(x: 120%, y: 120%)[\)]^e . $
  It is at most $n^(- k \/ 10)$ uniformly for $2 lt.eq k lt.eq n^(1 \/ 20)$ and large $n$. For example, $2^k k^(k \/ 2) lt.eq n^(k \/ 20)$ and $k^2 d sqrt(2 \/ n) lt.eq n^(- 3 \/ 8)$ eventually, so the displayed sum is at most $2 n^(- 11 k \/ 80) lt.eq n^(- k \/ 10)$. When $k = 1$, $F_(*) = 1 - 1 = 0$, which is the exact one-card uniformity of a sweep. This proves (15.7).
  Finally a single switch layer is averaging over the subgroup $\( S_2 \)^(n \/ 2)$ supported on its disjoint matching pairs. Young’s rule says its invariant vectors can occur only in shapes dominating $\( 2^(n \/ 2) \)$. Such a shape has at most $n \/ 2$ rows, since the sum of its first $n \/ 2$ rows must be at least $n$. Thus every layer projection, and hence the sweep product, vanishes on all taller shapes. ◻
]

=== 15.3 Applying the entropy–sparse hybrid transfer <applying-the-entropysparse-hybrid-transfer>

#thm([Corollary 15.5.])[
  (Baseline-walker application).  #emph[For the absolute integer $C_0$ in Proposition 56, the full permutation law after $\( 12 C_0 + 40 \) d$ physical shuffles tends to uniform in total variation, uniformly over initial decks.]
] <cor:c-baseline-forest-mixing>

#proof[
  Choose a uniform partition of the input labels into sixteen equal blocks. Each block complement has the law of the retained domain in Proposition 56; ordering that complement does not affect its relative entropy. Averaging the sum over all sixteen complements therefore selects a deterministic partition with total marginal relative entropy $O \( \( 1 + d \)^4 \)$.
  The entropy and sparse-degree hybrid theorem [14] Theorem 14.4 applies to this fixed partition and to the law $mu$ of $C_0$ sweeps. Its entropy truncation deletes permutations whose density on any complementary marginal exceeds $exp \( n^(1 \/ 50) \)$, then normalizes to a law $nu$, as in [14] Lemma 14.1. To check its mass hypothesis directly, for a density $f$ relative to a probability $u$,
  $ integral_({ f > e^a }) f thin d u lt.eq frac(D \( f u bar.v.double u \) + 1 \/ e, a) \, $
  because the negative part of $f log f$ is at most $1 \/ e$ pointwise. Taking $a = n^(1 \/ 50)$ and summing over the sixteen marginals gives $parallel nu - mu parallel_(upright("TV")) = O \( \( 1 + d \)^4 \/ n^(1 \/ 50) \) = o \( 1 \)$. After normalization each complementary coset density is at most $2 exp \( n^(1 \/ 50) \)$ for large $n$.
  The large-degree estimate [14] Proposition 14.3 gives $parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 1 \/ 3)$ whenever $k = n - lambda_1 > n^(1 \/ 20)$ and $lambda$ has at most $n \/ 2$ rows. The hybrid theorem [14] Theorem 14.4 also assumes a probability law $K$ with operator decay $n^(- k \/ 10)$ for $1 lt.eq k lt.eq n^(1 \/ 20)$ and zero transform on taller shapes. Proposition 59 supplies these estimates for one true sweep, separately from the entropy construction.
  The theorem controls the exact convolution $sigma = nu^(* 12) * K^(* 40)$, whose Fourier matrix in our convention is $hat(sigma) \( lambda \) = hat(nu) \( lambda \)^12 hat(K) \( lambda \)^40$. All convolution factors are independent. Its operator norm is at most $D_lambda^(- 4)$ in the large-deficit range, at most $n^(- 4 k)$ in the small-deficit range, and zero above $n \/ 2$ rows. The Plancherel sum uses $D_lambda^2$ times the square of these operator bounds, with ordinary unnormalized Hilbert–Schmidt norms. The degree and partition estimates in [14] Theorem 14.4 sum the large range to $o \( 1 \)$; in the small range $D_lambda lt.eq n^k$ from the tuple module, so the contribution at each $k$ is at most the number of partitions of $k$ times $n^(- 6 k)$, whose sum also tends to zero. The sign shape has more than $n \/ 2$ rows and is annihilated by $K$, so no parity bias survives. Cauchy–Schwarz therefore gives total variation tending to zero.
  Replacing the twelve factors $nu$ by $mu$ costs at most $12 parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$. The resulting law consists of $12 C_0 + 40$ successive true sweeps, which is $\( 12 C_0 + 40 \) d$ physical shuffles. Translation by an initial deck preserves the same distance. ◻
]

== 16 Replica entropy and sparse isolated paths <c:sec:replica>

Write $N = n = 2^d$ in this section, and write $lambda^top$ for the conjugate partition, so $lambda_1^top = lambda'_1$. The weak-entropy argument of Section 15 used a true-sweep operator estimate after clipping. Here explicit partner-repeat counts give the entropy input, and a separate Hilbert–Schmidt estimate for isolated paths gives the completion. The relative entropy of the image of a large random list need not tend to zero: a bound polynomial in $d$ suffices after truncating exceptionally concentrated outputs. Representations with small dimension require a separate argument, supplied here by cancellation of isolated paths in one sweep. The averaging over input lists is essential throughout the entropy calculation. For a law $w$ on $S_N$ and an ordered list $I$ of distinct input positions, write $w_I$ for the law of its ordered image under a permutation sampled from $w$.

#thm([Theorem 16.1.])[
  (Replica entropy route).  #emph[For the physical Thorp shuffle on $N = 2^d$ cards, 
$ parallel q_d^(* \( 1327104 d \)) - U_(S_N) parallel_(upright("TV")) arrow.r 0 . $

 More precisely, put $L = 256$, $q = N - N \/ L$, and let $w$ be the law after $16384 d$ physical shuffles. Averaging over all ordered distinct $q$-tuples $I$, its projected law satisfies 
$ bb(E)_I "KL" \( w_I parallel upright(bold(u))_q \) = O \( d^4 \) . quad "(16.1)" $ <c:rep:e1>

 Here $upright(bold(u))_q$ is uniform on ordered distinct $q$-tuples, and $"KL" \( p parallel u \) = sum_x p \( x \) log \( p \( x \) \/ u \( x \) \)$, with zero summands interpreted as zero.]
] <c:rep:main>

The replica below stays on its current baseline label except when it encounters the tagged path. This differs from the walker of Section 15, which can change labels at any active partner. The replica can return to the tagged label only when that label’s partner sequence repeats. Counting one repeat explicitly and bounding two repeats by $O \( d^4 \/ N^2 \)$ yields the entropy estimate. For the small-dimension estimate we reuse the deterministic path kernel of Lemma 58, now in Hilbert–Schmidt norm. The final assembly uses $80$ truncated blocks and one untruncated block. All logarithms in this section are natural.

Fix constants and sizes as follows:

$ L = 256 \, #h(2em) r = N \/ L \, #h(2em) q = N - r \, #h(2em) A = 64 L \, #h(2em) T = A d . $

Here $r$ is an integer for all $d$ under consideration. Put $G = S_N$ and write $kappa$ for the law on $G$ of $d$ shuffles, and $w = kappa^(* A)$, the law of $T$ shuffles. We use the notation $\( n \)_b = n \( n - 1 \) dots.h.c \( n - b + 1 \)$.

=== 16.1 Replica collisions and projection entropy <replica-collisions-and-projection-entropy>

We prove the entropy assertion of Theorem 61 by the chain rule, exposing the paths of one card at a time.

#proof[
  Consider the chain-rule term for the $\( j + 1 \)$-st card, $0 lt.eq j lt.eq q - 1$; the reference law from $upright(bold(u))_q$, given the final positions of the first $j$ cards, is uniform on the $M = N - j$ other positions. Further condition on $Gamma$, the data of the whole trajectories through time $T$ of these first $j$ cards (generated by the shuffles used for $w$). Call these $j$ cards observed cards, and the other labels unobserved. For the fixed list $I$, write $p_Gamma$ for the law of the final position of the next card, whose label we denote by $X$, given $Gamma$. The positions available to $X$ at the end, complementary to the first $j$ final positions, form the final available set; write $u_Gamma$ for its uniform law. Conditioning additionally as above gives an upper bound on the entropy term by convexity of relative entropy, since the uniform reference here only depends on the first $j$ final positions. Thus the term, now averaged over $I$, is bounded by
  $ bb(E)_(I \, Gamma) upright("KL") \( p_Gamma parallel u_Gamma \) med lt.eq med M bb(E)_(I \, Gamma) sum_z p_Gamma \( z \)^2 - 1 \, quad "(16.2)" $ <c:rep:e2>
  where $z$ indexes the final available positions and the last inequality uses $log b lt.eq b - 1$.
  By Lemma 2, conditional on $I \, Gamma$, switches visited by observed cards have fixed choices, while the coins on pairs of available positions remain independent and fair. We now construct the additional coupling needed to represent the squared mass.
  Generate a full shuffle trajectory (the reference trajectory for every label) using all actual switch choices, so $X$ uses its reference trajectory. We construct a replica path, starting at the same position as $X$, that will be on reference trajectories of unobserved labels. When at a switch also being used by $X$, and this switch has two available positions, the replica uses an extra independent fair coin, choosing to follow either $X$ or its partner in the reference trajectories through this switch. In any other case, the replica follows the reference trajectory of the label at its position through its switch.
  The positional path of this replica and the path of $X$ are independent copies given $I \, Gamma$. To see it, condition on the past at any stage in this construction. Given $I \, Gamma$, the single-path transition at an available position is forced if the switch contains an observed card, and otherwise it uses the two outputs with equal probability. If the replica and $X$ are at different switches, any unforced choices there come from independent fresh coins. If they use the same switch with only one available position, they both have a forced transition. If they use the same switch with two available positions, the rule with the extra coin makes the replica transition uniform independently of the transition of $X$. Thus the joint positional transitions are products at every step and the kernels in this description only require the respective present positions given $I \, Gamma$. In particular, writing $C_s$ for the label tracked by the replica at time $s$ ($C_0 = X$), we have
  $ bb(E)_(I \, Gamma) sum_z p_Gamma \( z \)^2 = Pr \( C_T = X \) \, $
  since the reference trajectories of the labels give distinct final positions.
  We now average without conditioning on $Gamma$. Fix which label $X$ is, and, in the reference trajectories, let $J_s$ be the label of the partner of $X$ at step $s$, where the steps are indexed $s = 0 \, dots.h \, T - 1$. The set of $M - 1$ unobserved labels other than $X$ in this estimate is uniformly chosen among the other $N - 1$ labels, independently of the reference trajectories, due to the choice of $I$. Given the sequence $J_s$ and the unobserved labels, $C_s$ can only change when it is in ${ X \, J_s }$ and $J_s$ is an unobserved label. In this case $C_(s + 1)$ is $X$ or $J_s$ each with probability $1 \/ 2$, by the extra coin.
  We give estimates for repeats in the partner sequence, over the reference randomness. Write $b_(i \, u) = Pr \( J_i = J_u \)$. Then, for $0 lt.eq i < u < T$,
  $ cases(delim: "{", b_(i \, u) = 0 & 0 < u - i < d \,, b_(i \, u) = 2 \/ N & u - i = d \,, b_(i \, u) lt.eq \( 1 + 2 \/ N \) \/ N & u - i > d .) quad "(16.3)" $ <c:rep:e3>
  Indeed, at step $i$ the two actual labels $X \, J_i$ have opposite appended bits. These bits preclude a repeat partner for a gap less than $d$. At $u gt.eq i + d$, a repeat requires the appended bits for these two labels at step $u - d$ to be opposite and those at steps $u - d + 1 \, dots.h \, u - 1$ to match, and these conditions suffice. Given opposite bits at $u - d$, the next $d - 1$ steps have different switches for these labels, so the matching part has probability $2^(- \( d - 1 \))$. When $u - d = i$, we have the opposite bits for sure. When $u - d > i$, the bits there are opposite with probability one if the two are partners at $u - d$, and $1 \/ 2$ otherwise, making $b_(i \, u) = \( 1 + b_(i \, u - d) \) \/ N$. For a preceding pair of times $i < v = u - d$, $b_(i \, v)$ is at most $2 \/ N$: a smaller gap than $d$ gives zero, and for gap at least $d$, the $d - 1$ required bit matches each have conditional probability at most $1 \/ 2$ given the past. Here $J_i$ is known by the times requiring these matches. This proves (16.3).
  Let $R_0 = T - \| { J_s : 0 lt.eq s < T } \|$. We also have
  $ Pr \( R_0 gt.eq 2 \) = O \( T^4 \/ N^2 \) . quad "(16.4)" $ <c:rep:e4>
  Indeed, fix two distinct repeat times $u \, v$ and earlier indices $i < u$, $h < v$, and ask for $J_u = J_i$ and $J_v = J_h$. By (16.3), both gaps must be at least $d$. Let $cal(F)_s$ contain all reference switch coins at steps strictly before $s$. The partner $J_s$ is $cal(F)_s$-measurable. In particular $J_i$ is already known before the interval $\[ u - d + 1 \, u - 1 \]$ of $d - 1$ required bit matches, and the analogous statement holds for $J_h$ and $\[ v - d + 1 \, v - 1 \]$.
  If these intervals overlap, then $\| u - v \| < d$. On the joint repeat event the two earlier labels must differ: otherwise the same label would be a partner at both $u$ and $v$, contradicting (16.3). At an overlap step impose this inequality as part of the event being bounded; it is measurable before that step. The three distinct labels $X \, J_i \, J_h$ must append the same bit. If any two occupy one switch the event is impossible, because the two true outputs are opposite. Otherwise three independent fair switch coins give the event probability $1 \/ 4$. At a step in just one matching interval the probability is at most $1 \/ 2$. Iterating these bounds in chronological order gives $2^(- 2 \( d - 1 \)) = 4 \/ N^2$ for the fixed quadruple $\( i \, u \, h \, v \)$. The union bound over $O \( T^4 \)$ quadruples proves (16.4).
  We have controlled the frequency of repeated partners. It remains to average which distinct partners belong to the hidden set. This step is where the uniform random input list enters.
  Let
  $ delta = frac(M - 1, N - 1) \, #h(2em) eta = 1 - delta / 2 . $
  Here $delta gt.eq 1 \/ L$. Given $J_s$, mark each distinct label in the sequence according to whether it is unobserved. The probabilities of these mark patterns are upper bounded by those for independent marks of chance $delta$, times a common factor
  $ c_T = frac(\( N - 1 \)^T, \( N - 1 \)_T) = 1 + O \( T^2 \/ N \) $
  for large $d$. In fact for $k$ distinct labels with $b$ specified to be unobserved labels and $k - b$ to be observed, the true probability is $\( M - 1 \)_b \( N - M \)_(k - b) \/ \( N - 1 \)_k$, and $k lt.eq T = o \( sqrt(N) \)$.
  Suppose $R_0 lt.eq 1$. The independent-marks bound (before the factor $c_T$) for never leaving $X$, i.e. $C_s = X$ throughout, is at most $eta^(T - 1)$, using a step with each of at least $T - 1$ distinct partners. If $C_s$ does leave $X$ and $C_T = X$, there must be a repeat $J_i = J_u$, which for $R_0 lt.eq 1$ is the only one. At $i$ it must switch from $X$ to the repeated label, and at $u$ back to $X$. There can be no other departure. The independent-marks probability for this behavior given such a sequence is
  $ delta / 4 thin eta^(i + T - 1 - u) . $
  Here we used the mark of the repeated label and two particular coin results there; all the steps requiring no departure before $i$ or after $u$ have different partners, also different from the repeated one.
  Combining this with (16.3) and (16.4),
  $ Pr \( C_T = X \) & lt.eq O \( T^4 \/ N^2 \) + c_T [eta^(T - 1) + delta / 4 sum_(i < u) eta^(i + T - 1 - u) b_(i \, u)]\
 & lt.eq O \( T^4 \/ N^2 \) + c_T [eta^(T - 1) + frac(1 + 2 \/ N, delta N) + frac(delta, 4 N) thin T eta^(T - 1 - d)] . $
  Indeed the non-special bound $\( 1 + 2 \/ N \) \/ N$ gives the middle term by a double geometric sum since $sum_(l gt.eq 0) eta^l = 2 \/ delta$, and an additional bound of $1 \/ N$ can be included for gaps $d$. We have $eta^(T - 1 - d) lt.eq N^(- 4)$ for large $d$, by $A = 64 L$, and $M \/ \( delta N \) = 1 + O \( 1 \/ N \)$. Consequently
  $ M Pr \( C_T = X \) - 1 med lt.eq med O \( T^4 \/ N \) $
  uniformly in $j$, under the averaging used in (16.2). Each conditional entropy term is therefore $O \( T^4 \/ N \)$. There are $q lt.eq N$ terms, so their sum is $O \( T^4 \) = O \( d^4 \)$, proving (16.1). ◻
]

=== 16.2 Applying the entropy cutoff <c:rep:trimming>

Choose a uniform partition of the input positions into $L = 256$ equal blocks. Each complementary list is a uniform $q$-subset; adding a uniform order gives the list law in (16.1). Reordering a list does not change the entropy of its image. Averaging therefore supplies one deterministic partition with complementary lists $I_1 \, dots.h \, I_L$ satisfying

$ sum_(a = 1)^L upright("KL") \( w_(I_a) parallel upright(bold(u))_q \) = O \( d^4 \) . $

Write $H_a$ for the permutations supported on block $a$, so $\| H_a \| \/ \| G \| = 1 \/ \( N \)_q$.

We apply the entropy-truncation and isotypic transfer of [14] Theorem 13.1. Take $L = 256$ blocks, total relative entropy $H = O \( d^4 \)$, logarithmic cutoff $b = d^6$, and reciprocal-degree exponent $u = 32$. The theorem restricts $w$ to the event that every projected density is at most $e^b$, giving a subprobability $v lt.eq w$ of mass $m$ such that

$ 1 - m lt.eq frac(H + L \/ e, b) = O \( d^(- 2) \) . quad "(16.5)" $ <c:rep:mass>

For clarity, this is one restriction of the full law; the $L$ marginal laws are not clipped independently. It yields simultaneously

$ sum_(h in H_a) \( caron(v) * v \) \( h \) lt.eq e^(d^6) frac(\| H_a \|, \| G \|) \, #h(2em) caron(v) \( g \) = v \( g^(- 1) \) \, quad "(16.6)" $ <c:rep:e5>

and

$ parallel hat(v) \( lambda \) parallel_(upright("HS"))^2 lt.eq L C e^(d^6) D_lambda^(- 1 + 34 \/ L) . quad "(16.7)" $ <c:rep:e8>

Here and below the Hilbert–Schmidt norm uses ordinary, unnormalized trace. Here $34 \/ L = \( 32 + 2 \) \/ L$: the reciprocal-degree bound contributes $32 \/ L$, the squared subgroup dimension contributes $2 \/ L$, and the ambient dimension contributes $- 1$. No fixed-list total-variation estimate has been used.

We also use the degree bounds

$ log D_lambda gt.eq frac(log 2, 2) sqrt(ell \( lambda \)) \, #h(2em) sup_(s gt.eq 1) sum_(alpha tack.r s) D_alpha^(- 32) lt.eq C \, #h(2em) ell \( lambda \) = N - max \( lambda_1 \, lambda'_1 \) \, quad "(16.8)" $ <c:rep:e6>

from [14] Lemma A.6. Here $lambda'_1$ is the first-column length. Since $1 - 34 \/ 256 > 1 \/ 2$, (16.7) gives

$ parallel hat(v) \( lambda \) parallel_(upright("HS"))^2 lt.eq D_lambda^(- 1 \/ 2) #h(2em) \( log D_lambda > d^8 \) quad "(16.9)" $ <c:rep:large-dimension>

for all sufficiently large $d$: the fixed factor $L C$ and the cutoff cost $d^6$ are smaller than $\( 1 \/ 2 - 34 \/ 256 \) log D_lambda$ in this range.

=== 16.3 An untruncated sweep on the remaining representations <an-untruncated-sweep-on-the-remaining-representations>

The cutoff has controlled every representation with $log D_lambda > d^8$. We now use the true sweep law $kappa$ on the remaining shapes. This factor will be kept untruncated in the final convolution, so that its exact cancellations remain available.

For the remaining estimates consider $log D_lambda lt.eq d^8$, now using the untruncated law. By (16.8),

$ N - max \( lambda_1 \, lambda_1^top \) med lt.eq med O \( d^16 \) . $

Those with $lambda_1^top = N - k$, $k lt.eq O \( d^16 \)$, have $hat(kappa) \( lambda \) = 0$ for large $d$. Indeed, the first shuffle averages over the subgroup generated by the $N \/ 2$ disjoint flips of partner input pairs, and includes a deterministic string rotation ($\( s \, z \) mapsto \( z \, s \)$ for bit $s$ and suffix $z$) after this. The average for the flip subgroup is a projection onto invariants. In $lambda$, the sign twist of $lambda^top$, there can be no such invariants. To see this, place $lambda^top$ inside the representation on ordered distinct $k$-tuples as allowed by branching. A vector that would be invariant upon sign twisting has to transform by sign under all the pair flips. For each tuple there is a pair unused by it as $k < N \/ 2$; its flip fixes the tuple, so the entry of the vector there must vanish. This proves the asserted absence, and hence the vanishing for the law including the first shuffle.

#thm([Proposition 16.2.])[
  (Sparse isolated-path estimate).  #emph[Fix $C_0 < oo$. If $lambda tack.r N = 2^d$ has first-row length $N - k$, where $1 lt.eq k lt.eq C_0 d^16$, then, for all sufficiently large $d$ depending only on $C_0$, the law $kappa$ of one sweep satisfies 
$ parallel hat(kappa) \( lambda \) parallel_(upright("HS")) lt.eq N^(- k \/ 10) . quad "(16.10)" $ <c:rep:e9>

]
] <c:rep:sparse>

#proof[
  Use the representation on ordered distinct $k$-tuples, with a group element taking the coordinate vector for $bold(x)$ to that for $g bold(x)$. The law $kappa = q_d^(* d)$ is the true-sweep law $K$ of Lemma 58: after $d$ physical shuffles the moving frame returns to the identity. For ordered distinct $bold(x) \, bold(y)$, use that lemma’s kernels
  $ F_S \( bold(x) \, bold(y) \) = N^(\| S \|) Pr_kappa \( g x_a = y_a upright(" for ") a in S \) \, #h(2em) F_compose = F_(*) = sum_(S subset.eq \[ k \]) \( - 1 \)^(k - \| S \|) F_S . $
  The averaged matrix for $kappa$ has entries (output $bold(y)$, input $bold(x)$) given by $F_({ 1 \, dots.h \, k }) \/ N^k$. When projecting on the output side to $lambda$-type, we can replace $F_({ 1 \, dots.h \, k })$ by $F_compose$: the other terms map into functions of proper subsets of output positions only. The space for any such subset is a copy of a tuple module on fewer entries, not containing $lambda$ by branching. Also $lambda$ does occur in our $k$-tuple module, and the projected $kappa$-matrix includes at least one copy of $hat(kappa) \( lambda \)$. Consequently, by taking the Hilbert-Schmidt bound before applying the output projection to the replacement matrix,
  $ parallel hat(kappa) \( lambda \) parallel_(upright("HS"))^2 lt.eq (frac(\( N \)_k, N^k))^2 bb(E)_(bold(x) \, bold(y)) lr(|F_compose \( bold(x) \, bold(y) \)|)^2 \, quad "(16.11)" $ <c:rep:e10>
  where each of $bold(x) \, bold(y)$ is separately a uniform tuple with distinct positions and they are independent.
  By Lemma 58, $\| F_compose \| lt.eq 2^k k^(k \/ 2)$, and $F_compose$ vanishes when the graph of shared prescribed switches has an isolated vertex. Unlike the operator estimate in Proposition 59, (16.11) requires the probability of the remaining pairs of tuples, rather than a bound on their bilinear form. For $k = 1$, $F_compose$ already vanishes by isolation. For $k gt.eq 2$, if there are no isolated vertices then the graph contains a spanning forest with no isolated vertices, having at least $k \/ 2$ and at most $k - 1$ edges. Consider first drawing all positions of the two tuples independently with replacement. A shared switch in direction $i$ requires agreement of the length-$\( d - i \)$ input suffixes and the length-$\( i - 1 \)$ output prefixes. Given the data at one vertex, a fresh vertex forms an edge to it with probability at most $2 d \/ N$, by summing over the steps the probabilities of suffix and prefix agreement. Thus for any particular forest the probability that all its edges are present is at most $\( 2 d \/ N \)^(\# upright("edges"))$, by drawing along the trees. Conditioning each tuple to have distinct positions costs a factor at most 2 for large $d$ in our size range. Summing over forests (at most $k^(2 k + 1)$, by counting edge lists) bounds the probability in (16.11) that $F_compose eq.not 0$ by
  $ 2 k^(2 k + 1) \( 2 d \/ N \)^(k \/ 2) . $
  Together with the size bound this yields (16.10), since factors $k^(O \( k \)) d^(O \( k \))$ are only $exp \( O \( k log d \) \)$ here, compared to $N^(k \/ 2)$ in the probability denominator. ◻
]

=== 16.4 Assembly with one untruncated factor <c:rep:assembly>

#proof[
  #emph[Completion of Theorem 61.] Let $B = 80$ and $theta = v^(* B) * w$, of mass $m^B$ and dominated pointwise by the true law $w^(* \( B + 1 \))$. For $log D_lambda > d^8$, (16.7) gives
  $ parallel hat(theta) \( lambda \) parallel_(upright("HS"))^2 lt.eq D_lambda^(- B \/ 2) $
  for large $d$, by convolution multiplication and Hilbert-Schmidt submultiplicativity, using also $parallel hat(w) \( lambda \) parallel_(upright("op")) lt.eq 1$ since it averages unitaries. It follows from (16.8) that
  $ sum_(lambda : log D_lambda > d^8) D_lambda parallel hat(theta) \( lambda \) parallel_(upright("HS"))^2 lt.eq C exp #scale(x: 120%, y: 120%)[\(] \( 33 - B \/ 2 \) d^8 #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  At smaller dimensions, excluding the trivial representation, we have either the vanishing for $kappa$ above (hence for $theta$), or the bounds (16.10) with $k gt.eq 1$, and $parallel hat(v) \( lambda \) parallel_(upright("op")) lt.eq 1$. In the latter case $D_lambda lt.eq N^k$ since the $k$-tuple representation contains $lambda$, and $w = kappa^(* A)$, so
  $ D_lambda parallel hat(theta) \( lambda \) parallel_(upright("HS"))^2 lt.eq N^k #scale(x: 120%, y: 120%)[\(] N^(- k \/ 10) #scale(x: 120%, y: 120%)[\)]^(2 A) . $
  Summing this over these diagrams gives $o \( 1 \)$ (the count for first row $N - k$ is at most $exp \( 3 sqrt(k) \)$).
  Writing $U_G$ for uniform on $G$, Cauchy-Schwarz and Plancherel give
  $ parallel theta - m^B U_G parallel_1^2 lt.eq sum_(lambda med upright("nontrivial")) D_lambda parallel hat(theta) \( lambda \) parallel_(upright("HS"))^2 = o \( 1 \) \, $
  with $ell^1$ on group masses. Hence TV distance for $w^(* \( B + 1 \))$ from uniform is bounded by $1 - m^B + 1 / 2 parallel theta - m^B U_G parallel_1$, tending to zero. This law uses $\( B + 1 \) A d$ complete shuffles, proving the asserted time $81 dot.op 16384 d = 1327104 d$. Translation of the initial deck preserves the distance to uniform, so the convergence is uniform over starting decks. ◻
]

== 17 Reverse probes and fixed reservoirs <c:probes>

Fix a set of observed cards and leave $h gt.eq n \/ 8$ labels hidden, starting from any deterministic placement. Run two walkers independently conditional on the observed paths, from any two available positions. After five sweeps their collision probability, averaged over the observed paths, is at least $\( 1 - n^(- 1 \/ 100) \) \/ h$. Thus the mean collision matrix contains almost the full uniform matrix as an entrywise lower bound. The proof follows possible partner positions backward to the initial hidden set, using reverse paths close to independent uniform probes. The resulting matrix bound implies a squared-norm contraction; iteration then produces simultaneous endpoint caps for eight fixed reservoirs.

#thm([Theorem 17.1.])[
  (Reverse-probe route).  #emph[For the physical Thorp shuffle on $n = 2^d$ positions, 
$ parallel q_d^(* \( 100000 d + 1 \)) - U_(S_n) parallel_(upright("TV")) arrow.r 0 . $

 The pairwise collision estimate used in its proof is uniform over the initial positions of every fixed observed set.]
] <c:probes:main>

We first prove the collision estimate, then construct one retained probability law with eight simultaneous reservoir caps, and finally apply the eight-block representation estimate. The additional physical shuffle at the end of the schedule supplies exact parity cancellation.

Write $n = N = 2^d$, and encode the positions (numbered from $0$ at the top) by words of length $d$ in binary, starting with the most significant bit. A step taking time $k - 1$ to time $k$ sends the two positions $0 x \, 1 x$ to $x 0 \, x 1$, where $x$ has length $d - 1$, by a fair random bijection. Call this a switch, indexed by the time and $x$; the switches use independent coins. In particular the shuffle acts by permutations of the positions, independent of the card labels. We use this description throughout.

=== 17.1 A conditional walk estimate <c:probes:p005>

Track the full paths of specified cards during a specified interval, starting from known positions. The positions occupied by the remaining cards are available; let their number be $h$. By the common flow of Lemma 2, in the physical coordinates used here, the conditional transition matrix $K$ has rows indexed by initial available positions and columns by terminal available positions. A switch with one available input has its available output prescribed; with two available inputs, either output bit is chosen with probability $1 \/ 2$. The matrix describes a start at any available position without requiring the occupant’s identity. It is doubly stochastic by the step rule, or by averaging bijections of the available sets. The new task is to compare two walks that are independent conditional on the observed paths; the following construction keeps that conditional independence explicit.

==== 17.1.1 Estimating availability by reverse paths <estimating-availability-by-reverse-paths>

When two conditional walkers occupy the same position, they separate with probability $1 \/ 2$ if the other input of their switch is available, and otherwise stay together. We first estimate these successive availability tests. The estimate conditions on one or two prescribed paths of an ordinary independent-switch process, called the base process. It does not condition on the observed-card paths used to define $K$.

#thm([Lemma 17.2.])[
  (Reverse probes under prescribed base paths).  #emph[Set $B = 5 d$, $L = floor.l d \/ 2 floor.r$, and $E_d = 100 d^3 \/ n$. Fix integers $0 lt.eq a lt.eq u$, $u - a gt.eq d$, $0 lt.eq v lt.eq L$, and $u + v lt.eq B$. Fix the entire base history through time $a$, including an available set $A_a$ of size $h$, and let the later available sets be its images under the base process. Put $p = h \/ n$.]
  #emph[Condition further on a feasible specified base path $W$ from $a$ through $u + v$. Index its bits by their times of appending, writing $alpha_k$ for the bit appended at time $k$, with the same indexing for the starting word. One may also specify a second base path from $a$ through $u$, provided it agrees with $alpha$ on bit indices $u - d + 1 \, dots.h \, u - d + v$. No other future information is conditioned on. For $u lt.eq s < u + v$, let $Z_s$ be obtained from $W_s$ by complementing its first bit. Then, under this conditioning, 
$ lr(|bb(E) #h(-1em) [2^(- \# { u lt.eq s < u + v : Z_s in A_s })] - \( 1 - p \/ 2 \)^v|) lt.eq E_d . quad "(17.1)" $ <c:probes:eq:3>

]
] <lem:c-reverse-probes>

#proof[
  By the path-cylinder argument in Lemma 2, the prescribed paths fix their visited switches and leave all other base coins after $a$ independent and fair. From each $Z_s$, trace backward through the base process to time $a$; membership in $A_s$ is equivalent to the trace’s endpoint lying in $A_a$. Compare these traces with independent ideal probes, starting at the same words and prepending independent fair bits while dropping the last bit at each reverse step.
  A reverse step from $k$ to $k - 1$ uses the switch indexed by the length-$\( d - 1 \)$ prefix at time $k$. Expose reverse steps in decreasing time order. Until two ideal probes request the same switch, or a probe requests a prescribed-path switch, assign the requested base coin its ideal value. These are distinct unconstrained switches, so the assignments have the required independent fair law. Complete every other unconstrained base coin ordinarily. Thus the true and ideal traces agree unless such a conflict occurs.
  Put $ell_s = s - d + 1$. The probe starting at $Z_s$ differs from $alpha$ exactly at index $ell_s$ in its starting word. At a reverse step with $k gt.eq ell_s + 1$, this bit remains in its prefix and prevents a conflict with $W$. It also prevents a conflict with the optional second path in that path’s time range, by the agreement assumption. For two active probes, use the larger starting time $s$. The earlier probe has the unchanged bit $alpha_(ell_s)$: their starting times differ by less than $L < d$, so that index belongs to both starting words and is not the bit complemented by the earlier probe. This again prevents a conflict while $k gt.eq ell_s + 1$.
  When $k lt.eq ell_s$, the entire prefix of the indicated ideal probe consists of $d - 1$ fresh reverse bits. Its probability of matching a fixed prescribed prefix, or the prefix of an independent ideal probe, is $2^(- \( d - 1 \))$. These are bounds for the unrestricted ideal probes; we do not condition on previous avoidance of conflicts. A union bound over at most $5 d$ times and $2 L + binom(L, 2)$ comparisons per time gives conflict probability at most $E_d$.
  Every probe has run at least $d$ steps by time $a$. Its endpoint is therefore uniform on $V$, independently of the other probes, and has probability $p$ of belonging to the fixed set $A_a$. The ideal expectation in (17.1) is consequently $\( 1 - p \/ 2 \)^v$. The tested variable lies in $\[ 0 \, 1 \]$, so the coupling error is at most $E_d$. The case $v = 0$ is immediate. ◻
]

==== 17.1.2 From survival to a collision lower bound <from-survival-to-a-collision-lower-bound>

#thm([Proposition 17.3.])[
  (A fixed-reservoir collision bound).  #emph[Let $h gt.eq n \/ 8$ and observe the paths of a fixed set of $n - h$ cards through $B = 5 d$ physical shuffles, starting from arbitrary deterministic positions. Let $K$ be the resulting conditional transition matrix on the available positions, and put $Q = bb(E) \[ K K^(sans(T)) \]$. For all sufficiently large $d$, every pair $i \, j$ of initial available positions satisfies 
$ Q \( i \, j \) = bb(E) sum_x K \( i \, x \) K \( j \, x \) gt.eq frac(1 - n^(- 1 \/ 100), h) \, quad "(17.2)" $ <c:probes:collision-minorization>

 where the sum is over the terminal available positions and the expectation is over the observed paths. Consequently, for every real row vector $z$ on the initial available positions with sum zero, 
$ bb(E) parallel z K parallel_2^2 med lt.eq med n^(- 1 \/ 100) parallel z parallel_2^2 quad "(17.3)" $ <c:probes:eq:1>

 for all sufficiently large $d$, uniformly over the observed set and its initial placement. The vector norms are Euclidean.]
] <c:probes:kernel-contraction>

Lemma 6 already gives the squared-norm contraction, with the smaller factor $\( 31 \/ 32 \)^(3 d) + 32 e^(- n \/ 256)$ when $alpha = 1 \/ 8$ and $t = 5 d$. The additional conclusion here is (17.2): it gives a lower bound of order $1 \/ h$ for each pair of starting positions, rather than only a bound on the quadratic form on sum-zero vectors.

#proof[
  Put $p = h \/ n$ and call the initial time zero.
  The matrix $Q$ is symmetric and stochastic; its entry $Q \( i \, j \)$ is the probability that two walkers starting from available positions $i \, j$, run independently given the tracked paths, are at the same position at time $B$. The diagonal entries are at least $1 \/ h$, since the sum of squares of a probability vector of length $h$ is at least $1 \/ h$.
  We will prove $Q \( i \, j \) gt.eq \( 1 - n^(- 1 \/ 100) \) \/ h$ for every pair $i \, j$. Reverse probes estimate how long the two conditional walkers remain together. We then force their last meeting and sum over its possible times. The entrywise lower bound finally gives contraction on the sum-zero vectors.
  We use the following joint experiment for the two walkers, named $W \, W'$. Run the base switch process generating, in particular, the tracked paths and moving the available set. Also sample an extra independent fair bit at each time. Let $W$ always follow the base process from its position. At switches different from the switch of $W$, let $W'$ also follow the base process from its position. When both use the same switch and that switch has two available inputs, use that time’s extra bit as the appended bit for $W'$. If they use the same switch and it has only one available input (so they are at the same position), $W'$ also follows the base process, since the available output is forced. This keeps both walkers in available positions and gives the required law. Indeed, conditional on the tracked paths, the joint transition at each step given the two walkers’ histories is the product of the prescribed conditional transitions: the base coins on switches with two available inputs are independent conditional on the tracked paths, as explained above (and the walkers’ histories so far only use coins at earlier times); the extra coin also gives independence when both walkers have two choices at the same switch.
  In this experiment, without conditioning on future tracked paths, whenever the walkers are distinct, their two appended bits are independent and fair given the past. This follows from independence of the step’s switches when using different switches (even when there is only one available input at such a switch), and from the extra independent bit when using the same switch from distinct positions. Also, if they are at the same position and we consider the chance of staying together over an interval of steps, the relevant probabilities given the full base process are 1 or $1 \/ 2$ at each such step. Specifically, at a time $s$ (for the step to $s + 1$), denote by $Z_s$ the position obtained from the position of $W$ by complementing its first bit. It is the other input of the switch. If $Z_s$ is available, an independent extra coin must give agreement in order to stay together; otherwise they will agree automatically. Thus, starting together, the probability given the base process of staying together, using fresh extra coins over steps from times $s = u \, dots.h \, u + v - 1$, is
  $ 2^(- \# { s = u \, dots.h \, u + v - 1 : Z_s upright(" is available at time ") s }) . quad "(17.4)" $ <c:probes:eq:2>
  Use the constants from Lemma 64:
  $ L = floor.l d \/ 2 floor.r \, #h(2em) E_d = 100 d^3 \/ n . $
  The survival probability is therefore approximately $\( 1 - p \/ 2 \)^v$ whenever the specified-path hypotheses hold. Summing the possible last meeting times will produce the factor $sum_(r gt.eq 0) \( 1 - p \/ 2 \)^r = 2 \/ p$; paired with a meeting cost $1 \/ \( 2 n \)$, this gives the desired collision scale $1 \/ h$.
  For the pair experiment, a newly meeting pair at some time $m' gt.eq d + 1$ (distinct at $m' - 1$, equal at $m'$) must have appended equal bits for the last $d$ steps. They were distinct immediately before each of those steps, since any separation after being together would put unequal bits in that string of steps. Consequently the probability of newly meeting at that time is at most $2^(- d)$, by the conditional fair bit property for a distinct pair.
  We now turn the probe estimate into a collision lower bound by forcing a last meeting near the terminal time. Take $r = 0 \, dots.h \, L - 1$, and put
  $ m = B - r \, #h(2em) b = m - d - 1 . $
  We will use that
  $ bb(P) \( W_b = W'_b \) med lt.eq med \( 1 - p \/ 2 \)^L + E_d + L \/ n . quad "(17.5)" $ <c:probes:eq:4>
  Here $W_s \, W'_s$ denote their positions at time $s$. If together at $b$, they have either newly met in the preceding $L$ steps (each such meeting at a time at least $d + 1$), or were together continuously from $b - L$. For the latter event, put $u = b - L$. Given the full base process and the walker experiment through $u$, its probability is the indicator of $W_u = W'_u$ times the survival probability in (17.4), with $v = L$. Drop that indicator before averaging: retaining it could bias the availability tests. Lemma 64 now applies with $a = u - d gt.eq 0$ and only the specified base path of $W$. Its upper bound $\( 1 - p \/ 2 \)^L + E_d$, together with the $L \/ n$ bound for new meetings, proves (17.5).
  Given the past at $b$ with the walkers distinct, put $c = m - d$ and require their appended bits to differ at $c$ and agree at $c + 1 \, dots.h \, m$. The differing bit keeps the positions distinct through time $m - 1$, so this requirement has probability exactly $2^(- \( d + 1 \)) = 1 \/ \( 2 n \)$ and forces a new meeting at $m$. We claim that, given the paths through this meeting, their probability of staying together for the remaining $r$ steps is at least
  $ \( 1 - p \/ 2 \)^r - E_d . quad "(17.6)" $ <c:probes:eq:5>
  To justify the conditioning, let $tilde(W)$ be the ordinary base path starting from $W'_b$. Through time $m - 1$ the walker $W'$ follows $tilde(W)$. At the first step, if it shares $W$’s switch, the required opposite output is its own base output. At subsequent steps before $m$ the bit at index $c$ prevents a shared switch. At $m$ the two base paths use the same switch, but $W'$ takes $W$’s output by its extra coin. Thus their appended bits have the following form:
  $ upright("bit index") & W & W' & tilde(W)\
c & alpha_c & 1 - alpha_c & 1 - alpha_c\
k = c + 1 \, dots.h \, m - 1 & alpha_k & alpha_k & alpha_k\
m & alpha_m & alpha_m & 1 - alpha_m $
  Now condition on the particular paths in this table and on $W$ through time $B$. This specifies exactly the base coins along $W$ and $tilde(W)$ through their indicated times, together with the extra coins used at a shared switch. These assignments suffice to force the meeting event: both base paths start at available positions, remain available, and have two available inputs whenever they share a switch. There is no additional restriction on future availability. All other base coins and future extra coins remain independent and fair.
  The optional second path in Lemma 64 is $tilde(W)$, not the walker after meeting. With $a = b$, $u = m$, and $v = r$, its required agreement interval is $c + 1 \, dots.h \, c + r$. It agrees there by the table, since $r < L < d$; its opposite final bit at $m$ is outside this interval. Averaging the survival probability (17.4) under precisely this conditioning therefore gives (17.6).
  The events requiring the indicated meeting and then staying together are disjoint for different $m$ (each requires being distinct just before that meeting). Using (17.5) and (17.6), and writing $q = 1 - p \/ 2$ and $f = q^L + E_d + L \/ n$, for each $r$ the event contributes at least $#scale(x: 120%, y: 120%)[\(] \( 1 - f \) q^r - E_d #scale(x: 120%, y: 120%)[\)] \/ \( 2 n \)$ to the equality probability: the chance of being distinct at $b$ is at least $1 - f$, the bit requirement given the past and distinctness there has probability $1 \/ \( 2 n \)$, and the conditional chance of staying then is at least $q^r - E_d$. We obtain for any starts $i \, j$
  $ Q \( i \, j \) & gt.eq frac(1, 2 n) (\( 1 - f \) sum_(r = 0)^(L - 1) q^r - L E_d)\
 & = 1 / h (\( 1 - f \) \( 1 - q^L \) - p / 2 L E_d) med gt.eq med 1 / h \( 1 - n^(- 1 \/ 100) \) \, $
  where the last bound holds for all sufficiently large $d$, since $q lt.eq 15 \/ 16$, so $q^L lt.eq \( 15 \/ 16 \)^(d \/ 2 - 1) = o \( n^(- 1 \/ 100) \)$, and the other error terms are bounded by polynomials in $d$ times $1 \/ n$. With $delta = n^(- 1 \/ 100)$, $Q$ can therefore be written as $1 - delta$ times the uniform stochastic matrix plus $delta$ times another symmetric stochastic matrix. The latter has Euclidean operator norm at most 1 (by Jensen’s inequality and the column sums). Thus $z Q z^(sans(T)) lt.eq delta parallel z parallel_2^2$ for zero-sum $z$, giving (17.3). ◻
]

=== 17.2 Obtaining a measure with several spread-out projections <c:probes:p018>

Now suppose that fixed cards are tracked from deterministic initial positions over $t_0 = 2000 B$ steps, still with $h gt.eq n \/ 8$. For a particular untracked card, let $w$ be its conditional distribution on the terminal available positions. By iterating (17.3),

$ bb(E) parallel w - upright(bold(u))_h parallel_2^2 lt.eq n^(- 20) \, quad "(17.7)" $ <c:probes:eq:6>

where $upright(bold(u))_h$ is the vector assigning mass $1 \/ h$ to each available position there. In detail, when we observe the tracked paths block by block, the distribution of this card given the observations is successively multiplied by the corresponding $K$. Indeed the new tracked paths give no further information on the occupant identities at available positions at the start of that block, since those paths use new switches and do not depend on these identities. Conditional on observations so far the next block is as in (17.3). The uniform vector is carried to the uniform vector by each matrix; (17.3) now applies to the difference at each block, starting with squared norm at most 1. In particular the probability that $parallel w - upright(bold(u))_h parallel_2 > n^(- 3)$ is at most $n^(- 14)$.

Identify the cards initially by their positions and write $G = frak(S)_n$ for the group acting on positions (so $g h$ applies $h$ first). Partition the positions into eight disjoint sets of size $n \/ 8$, for $d gt.eq 3$, and let $H_j$ ($1 lt.eq j lt.eq 8$) be the subgroup permuting the $j$-th set only. Denote by $mu$ the distribution on $G$ of the permutation from $t_0$ successive steps, taking initial positions to terminal positions. We will have a probability measure $nu$ on $G$ with $parallel mu - nu parallel_(upright("TV")) = o \( 1 \)$ such that for each $j$,

$ nu \( g H_j \) lt.eq 2 thin frac(\| H_j \|, \| G \|) #h(2em) \( g in G \) . quad "(17.8)" $ <c:probes:eq:7>

To construct it, for each set use a fixed ordered list of the complementary cards. Consider each card on that list given the full paths of the preceding cards on the list. Its conditional distribution at the end satisfies (17.7), with $h$ the number of available positions when only those preceding cards are tracked. Require $parallel w - upright(bold(u))_h parallel_2 lt.eq n^(- 3)$ for all these considerations on the eight lists. By a union bound, the resulting good event on the base process with deterministic initial cards has probability tending to 1. Use the law of the permutation conditioned on this event as $nu$; its total variation distance from $mu$ is at most the probability of the complement event, by writing $mu$ as the mixture. For a particular list to have specified distinct endpoints, and all requirements for that list to hold, the probability is at most

$ product_(i = 1)^(n - n \/ 8) frac(1 + n^(- 2), n - i + 1) $

by successive conditioning on paths of preceding cards: the requirement at index $i$ is determined by these paths, and when it holds the probability of the specified endpoint for the card at index $i$ is at most $1 \/ \( n - i + 1 \) + n^(- 3)$ (or zero if it is not available). Formally this product bound follows by taking conditional expectations starting with the last index. Specifying the endpoints of that entire list gives the coset $g H_j$. The good event implies all requirements for the list; dividing the probability bound by the probability of the good event gives (17.8) for large $d$, since $product_(i = 1)^(n - n \/ 8) \( n - i + 1 \)^(- 1) = \| H_j \| \/ \| G \|$ and $\( 1 + n^(- 2) \)^(n - n \/ 8) arrow.r 1$.

=== 17.3 The eight-coset application <c:probes:eight-coset-application>

The representation estimate needed here has the following exact form. Suppose $H_1 \, dots.h \, H_8$ permute disjoint equal blocks of an $n$-point set, and a probability $nu$ on $S_n$ satisfies $nu \( g H_j \) lt.eq 2 \| H_j \| \/ \| S_n \|$ for every $g \, j$. For every irreducible $rho_lambda$ of dimension $D_lambda$ other than the trivial and sign representations, its restriction to the product of the $H_j$ has $T_lambda$ distinct tensor types, and the eight-coset transfer gives

$ parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq sqrt(2 T_lambda) thin D_lambda^(- 3 \/ 8) . quad "(17.9)" $ <c:probes:eq:8>

The accompanying type count gives $2 T_lambda lt.eq D_lambda^(1 \/ 4)$ uniformly for sufficiently large $n$, and hence $parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 1 \/ 4)$. These operator estimates are Theorem 8.2 and its eight-block specialization, Corollary 8.4 of [14]. Separately, the paragraph following that corollary supplies the direct summation argument

$ sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(- 3) = o \( 1 \) \, quad "(17.10)" $ <c:probes:eq:9>

using the inverse-third-power majorant. The orbit-span estimate includes all multiplicity spaces; its hypothesis is a cap on the right-multiplication cosets $g H_j$. Thus (17.8) has exactly the required orientation and normalization.

Compose ten independent permutations with law $nu$, and then apply one actual step of the shuffle, independently; call the distribution $eta$. The sign has expectation zero due to the last step (one fair switch suffices to balance it), and the last step always has Fourier operator norm at most 1. Plancherel now gives the following bound for squared $L^2$ deviation of the density from uniform:

$ bb(E)_(g tilde.op upright("unif") \( G \)) \( \| G \| eta \( g \) - 1 \)^2 & = sum_(pi eq.not upright("trivial")) D_pi parallel hat(eta) \( pi \) parallel_(upright("HS"))^2 med lt.eq med sum_(pi in.not { upright("trivial, sign") }) D_pi^2 thin \( D_pi^(- 1 \/ 4) \)^20 = o \( 1 \) . $

Here we used the product rule by independence and bounded the Hilbert-Schmidt norm by the square root of the dimension times the operator norm. Total variation deviation tends to zero by Cauchy-Schwarz. Replacing $nu$ by $mu$ in these compositions changes the law by at most $10 parallel mu - nu parallel_(upright("TV")) = o \( 1 \)$ in total variation, by coupling or contraction under independent composition. With $mu$ these are exactly independent shuffle increments of $t_0$ steps each on the positions, followed by the extra shuffle step. Since the starting deck can be identified with any labeling of the initial positions, this is a worst-case bound. It proves Theorem 63, and gives $t_(upright("mix")) \( d \) lt.eq 100000 d + 1$ for all sufficiently large $d$.

Together with the support obstruction (2.4), this route gives $2 d - O \( 1 \) lt.eq t_(upright("mix")) \( d \) lt.eq 100000 d + 1$ for all sufficiently large $d$. The reverse-probe argument also retains the entrywise collision bound (17.2) for every fixed reservoir and every pair of available starting positions.

#heading(level: 1)[References]
#bibitem([1])[K. Azuma, #emph[Weighted sums of certain dependent random variables], Tôhoku Mathematical Journal (2) 19 (1967), no.~3, 357--367, #link("https://doi.org/10.2748/tmj/1178243286")[doi:10.2748/tmj/1178243286].]
#bibitem([2])[A. Czumaj and B. Vöcking, #emph[Thorp shuffling, butterflies, and non-Markovian couplings], in Automata, Languages, and Programming, Lecture Notes in Computer Science 8572, Springer, 2014, 344--355, #link("https://doi.org/10.1007/978-3-662-43948-7_29")[doi:10.1007/978-3-662-43948-7\_29].]
#bibitem([3])[P.~Diaconis and M.~Shahshahani, Generating a random permutation with random transpositions, #emph[Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete] #strong[57] (1981), 159--179, #link("https://doi.org/10.1007/BF00535487")[doi:10.1007/BF00535487].]
#bibitem([4])[P.~Etingof, O.~Golberg, S.~Hensel, T.~Liu, A.~Schwendner, D.~Vaintrob, and E.~Yudovina, #emph[Introduction to Representation Theory], Student Mathematical Library, vol.~59, American Mathematical Society, 2011. Author's lecture-note version, January 10, 2011: #link("https://math.mit.edu/~etingof/replect.pdf").]
#bibitem([5])[V. T. Hoang, B. Morris, and P. Rogaway, #emph[An enciphering scheme based on a card shuffle], Advances in Cryptology---CRYPTO 2012, Lecture Notes in Computer Science 7417, Springer, 2012, 1--13. The cited Section 3, Theorem 3, and Lemma 4 refer to #link("https://arxiv.org/abs/1208.1176v2")[arXiv:1208.1176v2], 21 November 2014.]
#bibitem([6])[W. Hoeffding, #emph[Probability inequalities for sums of bounded random variables], Journal of the American Statistical Association 58 (1963), no.~301, 13--30, #link("https://doi.org/10.1080/01621459.1963.10500830")[doi:`10.1080/01621459.1963.10500830`].]
#bibitem([7])[M. W. Liebeck and A. Shalev, #emph[Fuchsian groups, coverings of Riemann surfaces, subgroup growth, random quotients and random walks], Journal of Algebra 276 (2004), no.~2, 552--601. #link("https://doi.org/10.1016/S0021-8693(03)00515-5")[doi:10.1016/S0021-8693(03)00515-5]. The cited Proposition 2.5 and Theorem 2.6 appear on pages 15--16 of the #link("https://spiral.imperial.ac.uk/handle/10044/1/82")[author's text].]
#bibitem([8])[R. Montenegro and P. Tetali, #emph[Mathematical aspects of mixing times in Markov chains], Foundations and Trends in Theoretical Computer Science 1 (2006), no.~3, 237--354, #link("https://doi.org/10.1561/0400000003")[doi:10.1561/0400000003].]
#bibitem([9])[B.~Morris, The mixing time of the Thorp shuffle, #emph[SIAM Journal on Computing] #strong[38] (2008), no.~2, 484--504. #link("https://doi.org/10.1137/050636231")[doi:10.1137/050636231]. Preprint: #link("https://arxiv.org/abs/math/0507307").]
#bibitem([10])[B.~Morris, The mixing time for simple exclusion, #emph[Annals of Applied Probability] #strong[16] (2006), no.~2, 615--635, #link("https://doi.org/10.1214/105051605000000728")[doi:10.1214/105051605000000728]. The sequential comparison is Lemma~12 in Section~5.3 of the #link("https://arxiv.org/abs/math/0405157v2")[electronic reprint].]
#bibitem([11])[B.~Morris, Improved mixing time bounds for the Thorp shuffle and $L$-reversal chain, #emph[Annals of Probability] #strong[37] (2009), no.~2, 453--477. #link("https://doi.org/10.1214/08-AOP409")[doi:10.1214/08-AOP409]. Preprint: #link("https://arxiv.org/abs/0802.0339").]
#bibitem([12])[B.~Morris, Improved mixing time bounds for the Thorp shuffle, #emph[Combinatorics, Probability and Computing] #strong[22] (2013), no.~1, 118--132. #link("https://doi.org/10.1017/S0963548312000478")[doi:10.1017/S0963548312000478]. Preprint: #link("https://arxiv.org/abs/0912.2759").]
#bibitem([13])[B. Morris, P. Rogaway, and T. Stegers, #emph[How to encipher messages on a small domain: deterministic encryption and the Thorp shuffle], Advances in Cryptology---CRYPTO 2009, Lecture Notes in Computer Science 5677, Springer, 2009, 286--302, #link("https://doi.org/10.1007/978-3-642-03356-8_17")[doi:10.1007/978-3-642-03356-8\_17]. Theorem 1 and Lemma 2 (proved in Appendix A) are cited from the #link("https://www.cs.ucdavis.edu/~rogaway/papers/thorp.pdf")[author's conference text]. A later journal version is #emph[Deterministic encryption with the Thorp shuffle], Journal of Cryptology 31 (2018), no.~2, 521--536, #link("https://doi.org/10.1007/s00145-017-9262-z")[doi:10.1007/s00145-017-9262-z].]
#bibitem([14])[OpenAI, #emph[From partial permutation information to Fourier bounds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/From-partial-permutation-information-to-Fourier-bounds-September-26-2026/main.pdf")[OAI:From-partial-permutation-information-to-Fourier-bounds-September-26-2026], 2026.]
#bibitem([15])[OpenAI, #emph[Optimal-order mixing of the Thorp shuffle], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Optimal-order-mixing-of-the-Thorp-shuffle-September-26-2026/paper.pdf")[OAI:Optimal-order-mixing-of-the-Thorp-shuffle-September-26-2026], 2026.]
#bibitem([16])[OpenAI, #emph[Random coordinate frames and partial permutation laws], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Random-coordinate-frames-and-partial-permutation-laws-September-26-2026/main.pdf")[OAI:Random-coordinate-frames-and-partial-permutation-laws-September-26-2026], 2026.]
#bibitem([17])[B.~E.~Sagan, #emph[The Symmetric Group: Representations, Combinatorial Algorithms, and Symmetric Functions], second edition, Graduate Texts in Mathematics, vol.~203, Springer, 2001. #link("https://doi.org/10.1007/978-1-4757-6804-6")[doi:10.1007/978-1-4757-6804-6].]
#bibitem([18])[E.~O.~Thorp, Nonrandom shuffling with applications to the game of Faro, #emph[Journal of the American Statistical Association] #strong[68] (1973), no.~344, 842--847. #link("https://doi.org/10.1080/01621459.1973.10481434")[doi:10.1080/01621459.1973.10481434].]
#bibitem([19])[J. L. Walsh, #emph[A closed set of normal orthogonal functions], American Journal of Mathematics 45 (1923), no.~1, 5--24, #link("https://doi.org/10.2307/2387224")[doi:10.2307/2387224].]


