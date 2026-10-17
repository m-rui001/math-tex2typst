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

#align(center)[#text(size: 16pt, weight: "bold")[Random coordinate frames and partial permutation laws]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

A change of coordinates can relate a prescribed sequence of matching directions to a random one. For a permutation shuffle, we identify the joint path laws under the change of coordinates. A conditional calculation also needs to specify what has been revealed when the next direction is sampled. We separate these two questions. The resulting estimates describe the laws of large ordered lists of cards, and several ways of retaining that information lead to convergence of the whole permutation.

Our model is the Thorp shuffle on $n = 2^d$ labeled cards. Split a deck into two equal halves, pair corresponding positions, and interleave the pairs, choosing their orders with independent fair coins. One such operation is one #emph[physical shuffle]. Let $q_d$ be its law as a permutation of positions, let $U_n$ be uniform on $S_n$, and let $mu * nu$ denote the law of $X Y$ for independent permutations with laws $mu \, nu$. We use $parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_g \| mu \( g \) - nu \( g \) \|$. A card becomes uniform after $d$ physical shuffles. The cards share the same switches, so the law of their joint positions requires a separate argument.

Our first complete application uses the frame, marginal, degree, and Fourier arguments proved in this paper.

#thm([Theorem 1.1.])[
  #emph[For $n = 2^d$, 
$ parallel q_d^(* \( 32800 d \)) - U_n parallel_(upright("TV")) arrow.r 0 #h(2em) \( d arrow.r oo \) . $

 The convergence is uniform over every deterministic initial ordering of the deck.]
] <thm:main>

The lower obstruction is elementary. After $t$ physical shuffles the process has used $t n \/ 2$ random bits, so its support has size at most $2^(t n \/ 2)$ and

$ parallel q_d^(* t) - U_n parallel_(upright("TV")) gt.eq 1 - frac(2^(t n \/ 2), n !) . $

At distance $1 \/ 4$ this forces $t gt.eq ceil.l \( 2 \/ n \) log_2 \( 3 n ! \/ 4 \) ceil.r = 2 d - O \( 1 \)$. Together with Theorem 1, this shows that the mixing time has the optimal order $d = log_2 n$ on dyadic decks.

The proof of Theorem 1 is independent of the deterministic-coordinate companion, which proves convergence after $1600 d$ physical shuffles as $d arrow.r oo$ [23] Theorem 1.1, and of the abstract Fourier transfers in [22]. Later we prove that, after $256 d$ shuffles, the ordered image of every fixed list of at most $7 n \/ 8$ cards has total-variation distance $o \( 1 \)$ from a uniform injection, uniformly over the list as $d arrow.r oo$. The orbit transfer gives the $2048 d$ application in Theorem 31. Combining the same marginal estimate with the Fourier companion’s isotypic estimate and its inverse-degree sum gives the $512 d$ consequence in Corollary 30. The orbit argument bounds the operator norm, while the isotypic argument bounds the Hilbert–Schmidt norm. Later sections also prove partial laws that retain information about histories and changing input sets.

=== 1.1 Coordinate frames and the first proof <coordinate-frames-and-the-first-proof>

Identify positions with $V = bb(F)_2^d$. Undoing the deterministic rotation in each shuffle leaves independent fair switches along successive coordinate directions. A run through all $d$ directions is a #emph[sweep]; it costs $d$ physical shuffles. We compare this process with switches in directions $v_1 \, v_2 \, dots.h$ such that every $d$ consecutive vectors form a basis. For a fixed sequence whose first basis is the same ordered coordinate basis, invertible changes of position frame identify the joint path laws. At the terminal time, the endpoint laws agree after a specified bijection of output positions. Hence every fixed input list has the same distance from a uniform injection in the two descriptions. A general initial frame also relabels the inputs; the corresponding comparison preserves the average over uniformly chosen input lists.

This path comparison is proved after fixing the complete direction sequence. Its intermediate maps may use future directions. The probability calculation therefore uses a separately generated process: after the first basis, choose the next direction uniformly outside the span of its $d - 1$ predecessors, then choose fresh switch coins. The observation field records the input list and any independent initial sampling, the direction prefix, and the path prefixes of the preceding cards in the list. In this field, revealing the next direction does not change the conditional law of the hidden card’s current position.

That card has a conditional mass on the positions not occupied by its predecessors. A switch averages two masses when both endpoints remain available, and transports one mass when only one endpoint remains. The squared deviation from uniform has an exact decrement. Averaging a fresh direction connects every pair across the hyperplane spanned by the preceding directions with the same probability. The expected decrement is at least the current energy times the smaller available half-count, divided by $n$.

For the first proof we sample an omitted block of $n \/ 64$ labels independently of the shuffle. Its image is contained in every available set for the complementary list. Once the shuffle history is fixed, that image is a uniform subset, so both sides of a specified hyperplane contain many of its positions except with exponentially small probability. This is an unconditional imbalance bound after the path conditioning has been removed. Since the energy is at most one, it can be combined with the decrement even when the energy and the imbalance event are correlated. The terminal conditional comparison keeps the complete direction data inside total variation until the frame identity is applied. It yields one partition into 64 blocks for which the sum of the complementary marginal errors after $1025 d$ shuffles tends to zero.

Each complementary image list identifies a left coset of the subgroup that permutes the omitted block. A common trimming gives one nearby law whose relevant coset masses are capped by a fixed multiple of their uniform values. On restricting an irreducible representation of dimension $D$ to the product of the 64 block groups, each occurring tensor type has a factor of degree at most $D^(1 \/ 64)$. The orbit of one vector under that factor has controlled dimension even when the factor occurs with large multiplicity. The transfer proof first bounds this dimension by a finite sum of squared subgroup degrees. A local estimate for the inverse sixteenth powers then bounds that sum, and Schur averaging turns the coset caps into Fourier contraction. Thirty-two independent time blocks complete the proof, with the sign representation treated separately.

Sections 2–3 establish the model and the fixed-schedule path identity. Section 4 proves the marginal estimate. Sections 5, 6, and 7 complete Theorem 1 using local representation and Fourier arguments. A reader may stop there with a complete proof.

=== 1.2 Further partial laws and their uses <further-partial-laws-and-their-uses>

Section 8 reuses the conditional mass flow with different balance and disclosure statements. A preceding transverse switch gives an imbalance bound for every fixed input list. Independent shears provide an explicit realization of the fresh directions, and the deferred-column calculation identifies the coefficients that have not yet been revealed. Sampling labels offers other balance estimates; an arbitrary initial frame also introduces an input relabeling that disappears after averaging over lists. Thus an average over input lists can enter through the frame comparison or through the balance estimate. Lemma 26 gives a separate contraction under an earlier conditioning time for the deterministic coordinate schedule.

Section 12 controls exceptional trajectories in three different ways. For a chosen partition and chosen orders of its complements, descending removal constructs one retained measure whose complementary marginal probabilities are capped pointwise. A stopped argument uses nested balance events so that the tuple error includes the imbalance probability only once. A different event, defined by the trajectory matchings, supports an entropy inequality for every probability law concentrated on that event. This last quantifier allows the Fourier transfer to condition on a rare event selected from a representation coefficient.

Section 14 uses averaged input laws in three ways: selecting one partition for an isotypic estimate, trimming equivariant kernels while controlling their full sign multiplicity spaces, and averaging over overlapping omitted sets. Sections 15 and 16 use half of the deck. When an independent pass follows a long mixing segment, separate caps on preimage lists control positive trace tests. When the pass comes first, the argument repairs the two image marginals and averages one uniform subgroup coordinate at a time. The repaired coordinates may remain dependent.

=== 1.3 History and related work <history-and-related-work>

The model arose in Thorp’s study of nonrandom shuffling and the game of Faro [26]. Aldous and Diaconis later described the paired shuffle and reported an informal argument for an $O \( \( log n \)^2 \)$ threshold [1] Section 8b, Example (12). For dyadic decks, the description by independent switches along successive hypercube coordinates is standard [16]. It makes one-card uniformity transparent, while the dependence among card trajectories remains the obstacle to convergence of the full law.

Morris obtained an $O \( d^44 \)$ bound for the full deck when $n = 2^d$, combining chameleon and evolving-set ideas [16]. Montenegro and Tetali sharpened that analysis to $O \( d^29 \)$ using spectral-profile and evolving-set estimates [15] Theorems 6.14–6.15. Morris subsequently used entropy estimates to prove $O \( \( log n \)^4 \)$ for every even deck size [18] and then $O \( d^3 \)$ for dyadic decks [19]. These times count individual physical shuffles and concern the entire permutation.

Partial-card laws were studied both as shuffle marginals and as a tool for enciphering small domains. Morris, Rogaway and Stegers gave explicit bounds for ordered Thorp marginals [21] Theorem 1. For dyadic decks, Czumaj and Vöcking proved that any prescribed list of at most $\( 1 - epsilon.alt \) n$ cards mixes in $O_epsilon.alt \( \( log n \)^2 \)$ physical layers, for each fixed $0 < epsilon.alt < 1$, using non-Markovian couplings in the butterfly network [5]. Czumaj’s later account identifies this as $O \( log n \)$ whole butterflies [4] Section 1.5. That paper also obtains logarithmic-depth partial mixing for other switching networks with suitable expansion [4] Theorems 3.4–3.6.

We adapt the conditional-energy approach in the swap-or-not analysis of Hoang, Morris and Rogaway [9] Section 3, Theorem 3 and Lemma 4. Their independent uniform group keys give an unconstrained sequence of matchings; their proof contracts a quadratic discrepancy for the next card and compares the joint law through expected conditional errors. Dai, Hoang and Tessaro later sharpened the combination of those squared discrepancies through a chi-squared inequality [6] Section 6. Here the next direction is constrained by its recent predecessors. The frame identity and the chronological conditional calculation justify that rule and its hyperplane energy estimate.

Related work connects partial information to stronger permutation guarantees in several ways. Ristenpart and Yilek’s mix-and-cut construction, and Morris and Rogaway’s sometimes-recurse construction, use partial or separator guarantees inside recursively modified shuffles [24,20]. Alon and Lovett relate uniformity for every input-output pair of a group action to Fourier matrices of the irreducible representations occurring in that action, and repair sufficiently accurate approximate uniformity to exact uniformity for the action [2] Theorem 1.4 and Proposition 3.2. Our passage to the full symmetric group controls its irreducible Fourier matrices from complementary coset caps for selected blocks.

== 2 The chain and its elementary lower bound <sec:prelim>

Let $d gt.eq 1$ be an integer. Write $n = N = 2^d$, let $V = bb(F)_2^d$, and identify positions $0 \, dots.h \, n - 1$ with their binary strings, most significant bit first. Let $G = "Sym" \( V \)$. Fix card labels indexed by $V$, with card $x$ at position $x$ in the identity state. A state $g in G$ maps a label to its current position, and permutations are composed as functions: $\( g h \) \( x \) = g \( h \( x \) \)$.

In one #emph[physical shuffle], the deck is split into its top and bottom halves, and, for $i = 0 \, dots.h \, n \/ 2 - 1$, the cards at index $i$ within the two halves occupy output positions $2 i$ and $2 i + 1$ in an independently chosen fair order. Thus one step uses $n \/ 2$ independent fair bits. In binary coordinates its action is

#[#set math.equation(numbering: n => "(2.1)")
 $ \( x_1 \, x_2 \, dots.h \, x_d \) mapsto \( x_2 \, dots.h \, x_d \, x_1 + xi_(\( x_2 \, dots.h \, x_d \)) \) \, $ <eq:physical-step>]

where the bits indexed by the suffix are independent. This convention counts individual physical shuffles, not sweeps of $d$ such shuffles.

Let $q_d$ be the probability law of the one-step position permutation, and let $U$ be uniform measure on $G$. We also write $U_n$ or $U_G$ when indicating the state-space size or group is useful. The transition kernel is $P_d \( g \, h \) = q_d \( h g^(- 1) \)$; thus $P_d^t \( g \, dot.op \)$ is the law after $t$ shuffles started from $g$. For probability measures on a finite set, we use

$ parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_x \| mu \( x \) - nu \( x \) \| = max_A \| mu \( A \) - nu \( A \) \| . $

For measures on $G$, the convolution $mu * nu$ is the law of $X Y$, where $X tilde.op mu$ and $Y tilde.op nu$ are independent. Starting from $g_0$, the law after $t$ steps is the right translate of $q_d^(* t)$ by $g_0$. Uniform measure is invariant under every such translation and under left multiplication by every step. Consequently $U$ is stationary, and

#[#set math.equation(numbering: n => "(2.2)")
 $ max_(g_0 in G) parallel P_d^t \( g_0 \, dot.op \) - U parallel_(upright("TV")) = parallel q_d^(* t) - U parallel_(upright("TV")) . $ <eq:worst-state>]

Here and below $Y_t$ denotes the original shuffle started at the identity. We define

#[#set math.equation(numbering: n => "(2.3)")
 $ t_(upright("mix")) \( d \) = min { t in bb(Z)_(gt.eq 0) : parallel q_d^(* t) - U parallel_(upright("TV")) lt.eq 1 \/ 4 } . $ <eq:tmix>]

Total variation is nonincreasing in $t$ by contraction under convolution. The minimum exists for every $d gt.eq 1$; the coordinate description in Section 3 gives a short proof. Our estimates below give the quantitative bound as $d$ grows.

#thm([Lemma 2.1.])[
  (Support lower bound).  #emph[For every integer $t gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ parallel q_d^(* t) - U parallel_(upright("TV")) gt.eq 1 - frac(2^(t n \/ 2), n !) . $ <eq:exact-support-lower>]

 Consequently, 
#[#set math.equation(numbering: n => "(2.5)")
 $ t_(upright("mix")) \( d \) gt.eq ⌈2 / n log_2 (frac(3 n !, 4))⌉ = 2 d - O \( 1 \) . $ <eq:sharp-support-time>]

 For $0 lt.eq t lt.eq d$, 
$ parallel q_d^(* t) - U parallel_(upright("TV")) gt.eq 1 - \( e \/ sqrt(n) \)^n . $

 In particular, the distance tends to one uniformly for integer $t lt.eq d$, and $t_(upright("mix")) \( d \) gt.eq d$ for all sufficiently large $d$.]
] <lem:lower>

#proof[
  There are at most $2^(t n \/ 2)$ choices of all shuffle bits, hence at most that many possible states. If $A$ is their support, then
  $ parallel q_d^(* t) - U parallel_(upright("TV")) gt.eq q_d^(* t) \( A \) - U \( A \) gt.eq 1 - frac(2^(t n \/ 2), n !) . $
  If this distance is at most $1 \/ 4$, the last ratio must be at least $3 \/ 4$. Taking logarithms and then the least integer above the resulting lower bound proves the first part of (2.5). The integral bound $log \( n ! \) gt.eq integral_1^n log x thin d x = n log n - n + 1$ and $n ! lt.eq n^n$ give the asserted asymptotic lower bound. When $t lt.eq d$, the support ratio is at most $n^(n \/ 2) \/ n !$, which is at most $\( e \/ sqrt(n) \)^n$. This proves the remaining statements. ◻
]

#thm([Lemma 2.2.])[
  (One-card comparison).  #emph[For a fixed initial card and an integer $0 lt.eq t < d$, its location law has support at most $2^t$. Consequently the full permutation law has total-variation distance at least $1 - 2^t \/ n$ from uniform, and $t_(upright("mix")) \( d \) gt.eq d$. After $d$ steps every individual card has a uniform location.]
] <lem:one-card-lower>

#proof[
  At each step a card has at most two possible successors. Its support therefore has at most $2^t$ positions. The uniform position law assigns that support mass at most $2^t \/ n$, and passing from a full permutation to the position of one card cannot increase total variation. For the last assertion, undo the deterministic rotations. During the first $d$ steps each coordinate is refreshed exactly once, with a bit that is fair conditional on the entire previous card path. These successive refreshed bits form a uniform binary string. Restoring the rotation preserves uniformity. ◻
]

We shall use basic characteristic-zero representation theory of finite groups: unitary realizations, orthogonal decomposition into irreducibles, Schur’s lemma, and matrix-coefficient orthogonality [8,25]. All representation spaces below are finite-dimensional complex Hilbert spaces. For an operator $A$, $parallel A parallel_(upright("op"))$ is its operator norm and $parallel A parallel_(upright("HS"))^2 = "tr" \( A^(*) A \)$ its squared Hilbert–Schmidt norm; the trace is #emph[not] divided by the dimension. We prove explicitly the dimension estimate and the passage from marginals to the full group law that the argument requires.

== 3 Changing the position frame <sec:frames>

For a nonzero vector $v in V$, let $C_v lt.eq G$ be the subgroup of permutations that preserve each pair ${ x \, x + v }$ setwise. A uniform element of $C_v$ independently swaps or fixes each of these $n \/ 2$ pairs with equal probability. We call it a #emph[switch in direction $v$].

Write $e_1 \, dots.h \, e_d$ for the standard basis of $V$, and let

$ R \( x_1 \, dots.h \, x_d \) = \( x_2 \, dots.h \, x_d \, x_1 \) $

be left cyclic rotation. Binary strings are column vectors when a matrix acts on them. By (2.1), one physical shuffle is $R S_t$, where $S_t$ is uniform in $C_(e_1)$ and the $S_t$ are independent. Thus $Y_t = R S_t Y_(t - 1)$, with $Y_0 = upright("id")$. In the rotating position frame, put

#[#set math.equation(numbering: n => "(3.1)")
 $ X_t = R^(- t) Y_t \, #h(2em) Q_t = R^(- \( t - 1 \)) S_t R^(t - 1) . $ <eq:frames:cyclic>]

Then $X_t = Q_t X_(t - 1)$, and the $Q_t$ are independent uniform switches in the periodic directions $e_1 \, e_2 \, dots.h \, e_d \, e_1 \, dots.h$. Indeed, conjugation by a linear bijection carries $C_v$ onto the matching subgroup in the image direction, and $R^(- \( t - 1 \)) e_1 = e_(1 + \( \( t - 1 \) med mod med d \))$.

This description also proves the finite-$d$ convergence used in Section 2. A sweep of $d$ layers has positive probability of making no swaps, and positive probability of making exactly any chosen coordinate-edge transposition. These transpositions generate $G$, because the cube graph is connected. Every permutation is therefore a product of finitely many sweeps. Padding those products by identity sweeps gives a common number of sweeps at which every permutation has positive probability. That kernel dominates a positive multiple of $U$, so iteration proves convergence. The rotation is the identity at the end of each sweep.

The following path identity allows a different basis in each successive window of $d$ directions. The maps are constructed after the complete schedule is fixed; they need not be known when their time index is reached.

#thm([Lemma 3.1.])[
  (Fixed-schedule frame identity).  #emph[ Let $T gt.eq d$, and let $bold(iota) = \( iota_1 \, dots.h \, iota_d \)$ be a permutation of $1 \, dots.h \, d$. Write $i \( t \) = iota_(1 + \( \( t - 1 \) med mod med d \))$, and let $X_0^(bold(iota)) = upright("id")$ and $X_t^(bold(iota)) = Q_t^(bold(iota)) X_(t - 1)^(bold(iota))$, where the increments are independent and uniform in $C_(e_(i \( t \)))$.]
  #emph[Fix directions $v_1 \, dots.h \, v_T$ satisfying 
#[#set math.equation(numbering: n => "(3.2)")
 $ \( v_s \, dots.h \, v_(s + d - 1) \) upright(" is a basis of ") V #h(2em) \( 1 lt.eq s lt.eq T - d + 1 \) . $ <eq:frames:bases>]

 Let $Z_0 = upright("id")$, and let $Z_t$ evolve by independent uniform switches in these directions. There are linear bijections $L_0 \, dots.h \, L_T$, determined by the fixed axis order and direction schedule, such that 
#[#set math.equation(numbering: n => "(3.3)")
 $ \( Z_t \)_(t = 0)^T =^(upright("law")) #scale(x: 120%, y: 120%)[\(] L_t X_t^(bold(iota)) L_0^(- 1) #scale(x: 120%, y: 120%)[\)]_(t = 0)^T \, #h(2em) L_0 e_(iota_j) = v_j quad \( 1 lt.eq j lt.eq d \) . $ <shear:eq:general-frame>]

 In particular, if $bold(iota) = \( 1 \, dots.h \, d \)$ and $v_j = e_j$ for $1 lt.eq j lt.eq d$, then $L_0 = I$ and 
#[#set math.equation(numbering: n => "(3.4)")
 $ Z_T =^(upright("law")) L_T X_T = L_T R^(- T) Y_T . $ <eq:frames:endpoint>]

]
] <lem:frames>

#proof[
  For $1 lt.eq s lt.eq T - d$, the two successive bases give unique coefficients $a_(s \, t) in bb(F)_2$, $s < t < s + d$, with
  #[#set math.equation(numbering: n => "(3.5)")
   $ v_(s + d) = v_s + sum_(s < t < s + d) a_(s \, t) v_t . $ <eq:frames:recurrence>]
  The coefficient of $v_s$ cannot vanish, since otherwise $v_(s + 1) \, dots.h \, v_(s + d)$ would be dependent; over $bb(F)_2$ it is therefore one.
  We construct $L_t$ so that its column selected at time $t$ has the required value:
  #[#set math.equation(numbering: n => "(3.6)")
   $ L_(t - 1) e_(i \( t \)) = v_t . $ <eq:frames:selected-column>]
  Begin with the map $L_0$ specified in the statement. For each time $t$, define a row $c_t$ by putting $a_(s \, t)$ in column $i \( s \)$ whenever $1 lt.eq s lt.eq T - d$ and $s < t < s + d$, and putting zero in every other column. For fixed $t$ the possible $s$ lie within at most $d - 1$ consecutive times, so their coordinate indices are distinct and differ from $i \( t \)$. Thus $c_t e_(i \( t \)) = 0$. Set
  #[#set math.equation(numbering: n => "(3.7)")
   $ L_t = L_(t - 1) \( I + e_(i \( t \)) c_t \) . $ <eq:frames:matrices>]
  Each factor squares to $I$ and is invertible. It leaves the selected column unchanged and adds prescribed multiples of that column to the others.
  Before a column’s first selection no prescribed update targets it, so (3.6) holds during the first period by the definition of $L_0$. If it is selected at time $s$ and again at $s + d lt.eq T$, it has value $v_s$ after the first selection. At each intervening time $t$ it receives $a_(s \, t)$ times the selected column, whose value is $v_t$ by induction. Equation (3.5) gives its value $v_(s + d)$ before its next selection. This proves (3.6), including an incomplete last period.
  For this fixed schedule, define the transformed step shown in Figure 1:
  #[#set math.equation(numbering: n => "(3.8)")
   $ tilde(Q)_t = L_t Q_t^(bold(iota)) L_(t - 1)^(- 1) = \( L_t L_(t - 1)^(- 1) \) \( L_(t - 1) Q_t^(bold(iota)) L_(t - 1)^(- 1) \) . $ <eq:frames:transformed-step>]
  In (3.8), the second factor is uniform in $C_(v_t)$. The first is a fixed member of that subgroup: writing $f_t = c_t L_(t - 1)^(- 1)$,
  $ L_t L_(t - 1)^(- 1) = I + v_t f_t \, #h(2em) f_t \( v_t \) = 0 . $
  The map $x mapsto x + f_t \( x \) v_t$ fixes or swaps each pair ${ x \, x + v_t }$ because $f_t$ is constant on the pair. Multiplication by it preserves the uniform law on $C_(v_t)$. Each $tilde(Q)_t$ depends on its own independent increment $Q_t^(bold(iota))$, so the transformed switches are independent. Their products telescope at every time:
  $ tilde(Q)_t dots.h.c tilde(Q)_1 = L_t Q_t^(bold(iota)) dots.h.c Q_1^(bold(iota)) L_0^(- 1) = L_t X_t^(bold(iota)) L_0^(- 1) . $
  This gives the joint path identity, and the cyclic specialization follows from (3.1). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.5), [#text(size: 9pt)[$x$]])
  content((6, 1.5), [#text(size: 9pt)[$Q^( bold( iota ) )_"tx"$]])
  content((0, 0), [#text(size: 9pt)[$L_(t-1)x$]])
  content((6, 0), [#text(size: 9pt)[$L_"tQ"^( bold( iota ) )_"tx"$]])
  line((0.204, 1.5), (5.478, 1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3, 1.5), [#text(size: 9pt)[$Q^( bold( iota ) )_t in C_(e_(i(t)))$]], anchor: "south", padding: 0.1176cm)
  line((0, 1.307), (0, 0.2661), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.75), [#text(size: 9pt)[$L_(t-1)$]], anchor: "east", padding: 0.1176cm)
  line((6, 1.214), (6, 0.2863), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6, 0.75), [#text(size: 9pt)[$L_t$]], anchor: "west", padding: 0.1176cm)
  line((0.4977, 0), (5.296, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3, 0), [#text(size: 9pt)[$tilde(Q)_t in C_(v_t)$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: One matching switch in two position frames. After the complete schedule is fixed, the vertical maps are deterministic and the lower step is an independent uniform switch in direction $v_t$. ],
) <fig:frames>

#thm([Corollary 3.2.])[
  (Endpoint distances and the input map).  #emph[Under Lemma 4, let $0 lt.eq q lt.eq n$ and let $pi_q$ be uniform on ordered distinct $q$-tuples of positions. For every fixed ordered list $C$ of $q$ distinct labels, 
#[#set math.equation(numbering: n => "(3.9)")
 $ parallel cal(L) \( Z_T \( C \) \) - pi_q parallel_(upright("TV")) = parallel cal(L) \( X_T^(bold(iota)) \( L_0^(- 1) C \) \) - pi_q parallel_(upright("TV")) . $ <eq:frames:tuple-input-map>]

 Thus the same-list distances agree when $L_0 = I$. Their averages also agree when $C$ is sampled uniformly over ordered distinct lists, independently of the switch process: 
#[#set math.equation(numbering: n => "(3.10)")
 $ bb(E)_C parallel cal(L) \( Z_T \( C \) divides C \) - pi_q parallel_(upright("TV")) = bb(E)_C parallel cal(L) \( X_T^(bold(iota)) \( C \) divides C \) - pi_q parallel_(upright("TV")) . $ <eq:frames:averaged-input-map>]

]
] <cor:frames:marginals>

#proof[
  The terminal map $L_T$ is a bijection on distinct position tuples and preserves $pi_q$, which proves (3.9). The input map $L_0^(- 1)$ also preserves the uniform law on distinct lists, giving the averaged identity. ◻
]

#prodef([Remark 3.3.])[
  (The schedule is fixed before the frame is constructed).  If a random schedule satisfying (3.2) is sampled independently of the switch randomness, the lemma and corollary apply conditionally on each complete schedule. The averaged identity then uses a list sampled independently of that schedule and of the switches. The maps $L_t$, including $L_0$ when the first basis is random, may depend on directions that have not yet been revealed. We use them only in these conditional path and endpoint comparisons. The energy calculation next uses a separately generated process with directions revealed in chronological order.
] <rem:frames:conditioning>

== 4 Online observations and ordinary marginals <sec:marginals>

We track the conditional location of one hidden card while revealing the paths of earlier cards in a list. The quadratic error and the successive comparison of conditional location laws follow the swap-or-not approach of Hoang, Morris, and Rogaway [9] Section 3, Theorem 3 and Lemma 4. Here the next direction is constrained by its recent predecessors, so we state the information used in the calculation explicitly. The first application below produces one partition whose complementary marginals are all close to uniform. Later applications use the same calculation with other sources of balance.

=== 4.1 A chronological law and a hidden card <a-chronological-law-and-a-hidden-card>

Fix an integer $T gt.eq 0$. Let $upright(bold(v)) = \( v_1 \, dots.h \, v_T \)$ be a random schedule of nonzero directions. Set $Z_0 = upright("id")$, and suppose that, conditional on the complete schedule, the increments of $Z$ are independent uniform switches in directions $v_1 \, dots.h \, v_T$. This law can be generated in time order: sample the next direction from its conditional law given the preceding directions, and then use fresh fair coins on its matching.

Let $Xi$ be initial data independent of the joint process $\( upright(bold(v)) \, \( Z_t \)_(t = 0)^T \)$, and let $C = \( c_1 \, dots.h \, c_q \)$ be a list of distinct labels determined by $Xi$, with fixed length $0 lt.eq q lt.eq n$. A fixed list corresponds to deterministic $Xi$; a sampled partition may be included in $Xi$ when it determines the list. For its $j$th label define the exact online field

#[#set math.equation(numbering: n => "(4.1)")
 $ cal(F)_t^j = sigma #scale(x: 120%, y: 120%)[\(] Xi \, v_1 \, dots.h \, v_t \, thin Z_s \( c_i \) : 0 lt.eq s lt.eq t \, med i < j #scale(x: 120%, y: 120%)[\)] . $ <eq:marginal-filtration>]

Let $D_t^j$ be the positions not occupied by the observed labels $c_1 \, dots.h \, c_(j - 1)$ at time $t$, and put $r_j = n - j + 1$. Define

#[#set math.equation(numbering: n => "(4.2)")
 $ p_t^j \( x \) = Pr { Z_t \( c_j \) = x divides cal(F)_t^j } \, #h(2em) Delta_t^j = sum_(x in D_t^j) (p_t^j \( x \) - 1 / r_j)^2 . $ <eq:marginal-energy>]

We extend $p_t^j$ by zero outside $D_t^j$. It is a probability vector on that set, so $0 lt.eq Delta_t^j = sum_x p_t^j \( x \)^2 - 1 \/ r_j lt.eq 1$.

For $0 lt.eq t < T$ and a feasible direction prefix write $K_t \( v \) = Pr { v_(t + 1) = v divides v_1 \, dots.h \, v_t }$. Conditional on the complete schedule, the law of the #emph[joint] permutation path through time $t$ depends only on $v_1 \, dots.h \, v_t$. The independence of $Xi$ therefore gives

#[#set math.equation(numbering: n => "(4.3)")
 $ Pr { Z_t \( c_j \) = x \, med v_(t + 1) = v divides cal(F)_t^j } = p_t^j \( x \) K_t \( v \) . $ <eq:marginal-direction-factorization>]

Indeed, the joint law of the old hidden position and observed path prefix is the same for every completion of a fixed direction prefix. Conditioning on that observed prefix leaves the conditional law of the future directions unchanged. This argument uses only path prefixes; it does not condition on future observed paths or on further auxiliary data.

#thm([Lemma 4.1.])[
  (Online averaging and cross-hyperplane contraction).  #emph[ In the preceding setup, for $0 lt.eq t < T$ and $1 lt.eq j lt.eq q$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ Delta_(t + 1)^j = Delta_t^j - 1 / 2 sum_({ x \, y } subset.eq D_t^j\
y = x + v_(t + 1)) #scale(x: 120%, y: 120%)[\(] p_t^j \( x \) - p_t^j \( y \) #scale(x: 120%, y: 120%)[\)]^2 quad upright("almost surely") \, $ <eq:marginal-exact-decrement>]

 where each unordered matching edge is counted once. If $K_t$ is uniform on the complement of an $cal(F)_t^j$-measurable hyperplane $J_t$, then 
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) \[ Delta_t^j - Delta_(t + 1)^j divides cal(F)_t^j \] gt.eq frac(min \( \| D_t^j ∩ J_t \| \, \| D_t^j \\ J_t \| \), n) Delta_t^j . $ <eq:marginal-cross-energy>]

 More generally, suppose $K_t$ is uniform outside an $cal(F)_t^j$-measurable proper subspace $W_t$, and let $J_t$ be an $cal(F)_t^j$-measurable hyperplane containing $W_t$. Then the same right side with denominator $2 n$ is a valid lower bound.]
] <lem:marginal-averaging>

#proof[
  Fix $j$ and omit its superscript. By (4.3), revealing $v_(t + 1)$ does not update the old hidden-card law $p_t$. Given $cal(F)_t$ and this direction, the matching edges incident to observed cards are known. Their next positions reveal exactly the fresh coins on those edges. Those coins are independent of the old hidden position, so their revelation also leaves $p_t$ unchanged; all other edge coins remain independent and fair.
  An edge containing two positions of $D_t$ averages their two masses. An edge containing exactly one position of $D_t$ transports its mass to the unique position on that edge unoccupied by observed cards after the switch. Edges with no available position carry no hidden mass. These rules give the conditional vector at the exact field $cal(F)_(t + 1)$ in (4.1). They also transport the uniform vector on $D_t$ to the uniform vector on $D_(t + 1)$. Transport preserves squared error, while averaging two masses reduces it by $1 / 2 \( p_t \( x \) - p_t \( y \) \)^2$. This proves the exact identity.
  For the expectation, split $D_t = D^0 union D^1$ across $J_t$ and put $z_x = p_t \( x \) - 1 \/ r_j$, $u = \| D^0 \|$, and $w = \| D^1 \|$. Since $sum z_x = 0$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(x in D^0 \, y in D^1) \( z_x - z_y \)^2 = w sum_(D^0) z_x^2 + u sum_(D^1) z_y^2 + 2 (sum_(D^0) z_x)^2 gt.eq min \( u \, w \) sum_(D_t) z_x^2 . $ <shear:eq:bipartite-form>]
  Every cross pair has matching probability $2 \/ n$ in the hyperplane case. Combining this with the factor $1 \/ 2$ in the exact decrement proves (4.5). In the proper-subspace case, every cross difference lies outside $W_t$ and has probability $1 \/ \( n - \| W_t \| \) gt.eq 1 \/ n$; discard the other eligible pairs to obtain the denominator $2 n$. The calculation covers an empty side. The algebraic identity (4.6) holds for any real centered vector; a later use for another vector must also identify its averaging rule. ◻
]

The loss bound and a balance estimate will be used at different levels of conditioning. Let $0 lt.eq gamma lt.eq 1$. If the conditional expected loss $bb(E) \[ Delta_t^j - Delta_(t + 1)^j divides cal(F)_t^j \]$ is at least $gamma Delta_t^j$ off an event $B_t in cal(F)_t^j$ and is always nonnegative, then $Delta_t^j lt.eq 1$ gives

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) Delta_(t + 1)^j lt.eq \( 1 - gamma \) bb(E) Delta_t^j + gamma Pr \( B_t \) . $ <eq:marginal-balance-recurrence>]

Thus an unconditional bound on $Pr \( B_t \)$ suffices; no bound conditional on the observed paths is asserted.

=== 4.2 From hidden cards to an ordinary tuple law <from-hidden-cards-to-an-ordinary-tuple-law>

Let $pi_q$ be uniform on ordered distinct $q$-tuples of positions, and let $U_D$ be uniform on a nonempty set $D$. For any tuple law $nu = cal(L) \( Y_1 \, dots.h \, Y_q \)$,

#[#set math.equation(numbering: n => "(4.8)")
 $ parallel nu - pi_q parallel_(upright("TV")) lt.eq sum_(j = 1)^q bb(E)_nu ∥cal(L) \( Y_j divides Y_1 \, dots.h \, Y_(j - 1) \) - U_(V \\ { Y_1 \, dots.h \, Y_(j - 1) })∥_(upright("TV")) . $ <eq:marginal-sequential-tv>]

This sequential comparison appears in [21] Appendix A, Lemma 2; an earlier distinct-tuple form is [17] Section 5.3, Lemma 12. For completeness, at the $j$th step insert the law that first draws the actual $\( j - 1 \)$-coordinate prefix of $nu$ and then appends a uniform available position. Its distance from the $j$-coordinate marginal of $nu$ is the $j$th summand above. Applying the same extension kernel to $pi_(j - 1)$ gives $pi_j$ and contracts total variation. The triangle inequality and induction prove (4.8). Every expectation is under the actual prefix law.

#thm([Lemma 4.2.])[
  (Terminal data and an ordinary tuple law).  #emph[In the preceding setup let $Lambda$ be terminal data that determine the complete direction schedule, and suppose $Xi$ is independent of $\( Lambda \, \( Z_t \)_(t = 0)^T \)$. For every $1 lt.eq j lt.eq q$ and every $x in V$, assume that its online terminal vector is also the conditional hidden law after these data and the complete predecessor paths are known: 
#[#set math.equation(numbering: n => "(4.9)")
 $ Pr { Z_T \( c_j \) = x divides Lambda \, Xi \, thin Z_s \( c_i \) : 0 lt.eq s lt.eq T \, med i < j } = p_T^j \( x \) quad upright("almost surely") . $ <eq:marginal-terminal-identification>]

 Then 
#[#set math.equation(numbering: n => "(4.10)")
 $ bb(E)_(Lambda \, Xi) parallel cal(L) \( Z_T \( C \) divides Lambda \, Xi \) - pi_q parallel_(upright("TV")) lt.eq 1 / 2 sum_(j = 1)^q sqrt(\( n - j + 1 \) bb(E) Delta_T^j) . $ <shear:eq:tuple-bound>]

 All expectations are under the actual joint law of the data, list, and process. If $bb(E) Delta_T^j lt.eq a_T$ for every $j$, the right side is at most $q sqrt(n) thin sqrt(a_T) \/ 2$. For $q = 0$ both sides are zero.]
] <shear:lem:tuple>

#proof[
  For fixed $Lambda \, Xi$, apply (4.8). At index $j$ use the coarser field
  $ cal(H)_j = sigma \( Lambda \, Xi \, Z_T \( c_1 \) \, dots.h \, Z_T \( c_(j - 1) \) \) . $
  The tower property and (4.9) give $Pr { Z_T \( c_j \) = x divides cal(H)_j } = bb(E) \[ p_T^j \( x \) divides cal(H)_j \]$. The set $D_T^j$ is $cal(H)_j$-measurable, so Jensen’s inequality for the $ell^1$ norm compares both vectors to the same uniform law $U_(D_T^j)$. Cauchy–Schwarz gives
  $ parallel p_T^j - U_(D_T^j) parallel_(upright("TV")) lt.eq 1 / 2 sqrt(\( n - j + 1 \) Delta_T^j) . $
  Consequently, almost surely in the terminal data and initial data,
  #[#set math.equation(numbering: n => "(4.11)")
   $ parallel cal(L) \( Z_T \( C \) divides Lambda \, Xi \) - pi_q parallel_(upright("TV")) lt.eq 1 / 2 sum_(j = 1)^q bb(E) #h(-0.16667em) [sqrt(\( n - j + 1 \) Delta_T^j) thin mid(bar.v) thin Lambda \, Xi] . $ <eq:marginal-conditional-tuple>]
  Averaging and applying Cauchy–Schwarz once more proves the lemma. ◻
]

When $Lambda = upright(bold(v))$, the field on the left of (4.9) is exactly $cal(F)_T^j$, so that hypothesis is automatic. If $Lambda$ contains further shear or functional data, the identification requires an additional path-law argument. We will prove that argument where those data are introduced; their disclosure is separate from the chronological averaging above.

=== 4.3 A sampled omitted block <a-sampled-omitted-block>

For the local full-group proof, set

#[#set math.equation(numbering: n => "(4.12)")
 $ k = 64 \, #h(2em) m = n / k \, #h(2em) alpha = frac(1, 4 k) \, #h(2em) T = \( 1 + 16 k \) d = 1025 d \, $ <eq:marginal-constants>]

and assume $d gt.eq 6$. Put

#[#set math.equation(numbering: n => "(4.13)")
 $ b_n = 2 (2 / 3^(3 \/ 4))^m \, #h(2em) epsilon_n = n^(3 \/ 2) / 2 sqrt(e^(- 4 d) + b_n) . $ <eq:marginal-error>]

For a labeled partition $cal(M) = \( M_1 \, dots.h \, M_k \)$ of $V$ into $m$-element blocks, let $delta_a \( cal(M) \)$ be the distance of the time-$T$ images of $V \\ M_a$ under the physical shuffle from the uniform distinct tuple law. Any fixed ordering of these labels gives the same distance.

#thm([Proposition 4.3.])[
  (One partition with nearly complete marginals).  #emph[There is a deterministic labeled partition $cal(M) = \( M_1 \, dots.h \, M_k \)$ into blocks of size $m$ for which 
#[#set math.equation(numbering: n => "(4.14)")
 $ sum_(a = 1)^k delta_a \( cal(M) \) lt.eq k epsilon_n = o \( 1 \) #h(2em) \( d arrow.r oo \) . $ <eq:marginal-partition>]

]
] <prop:marginals>

#proof[
  Use $v_i = e_i$ for $1 lt.eq i lt.eq d$. For $d lt.eq t < T$ put
  #[#set math.equation(numbering: n => "(4.15)")
   $ J_t = "span" { v_(t - d + 2) \, dots.h \, v_t } $ <eq:marginal-hyperplane>]
  and choose $v_(t + 1)$ uniformly in $V \\ J_t$, with fresh direction randomness. Every $d$ successive directions form a basis. Conditional on the complete schedule, use independent fair switches to form $Z$. Independently choose $cal(M)$ uniformly among labeled equal-size partitions. For a fixed $a$, let $Xi$ be this partition and let $C$ be any deterministic ordering of $V \\ M_a$, with $q = n - m$. This is the online setup above.
  For each hidden index $j$, the available set contains the positions of all omitted labels:
  #[#set math.equation(numbering: n => "(4.16)")
   $ Z_t \( M_a \) subset.eq D_t^j . $ <eq:marginal-permanent-holes>]
  Write $D_t^(j \, 0) = D_t^j ∩ J_t$ and $D_t^(j \, 1) = D_t^j \\ J_t$. If $J_t^0 = J_t$ and $J_t^1 = V \\ J_t$, then
  $ {min_i \| D_t^j ∩ J_t^i \| < m \/ 4} subset.eq {min_i \| Z_t \( M_a \) ∩ J_t^i \| < m \/ 4} . $
  Fix the direction and switch history through time $t$, but not $cal(M)$. This fixes $Z_t$ and $J_t$, while $Z_t \( M_a \)$ is a uniform $m$-subset of $V$.
  For a uniform $m$-subset and a fixed half of $V$, let $X$ be its count in that half. View the subset as an ordered sample without replacement. A specified set of $ell$ sampled indices all lie in the half with probability at most $2^(- ell)$. If $I_i$ are the membership indicators, expansion gives
  $ bb(E) 3^X = bb(E) product_(i = 1)^m \( 1 + 2 I_i \) lt.eq sum_(A subset.eq { 1 \, dots.h \, m }) 2^(\| A \|) 2^(- \| A \|) = 2^m . $
  If one half contains fewer than $m \/ 4$ sampled points, the other contains more than $3 m \/ 4$. Markov’s inequality and a union bound therefore yield, for $d lt.eq t < T$,
  #[#set math.equation(numbering: n => "(4.17)")
   $ Pr { min \( \| D_t^(j \, 0) \| \, \| D_t^(j \, 1) \| \) < m \/ 4 } lt.eq 2 2^m / 3^(3 m \/ 4) = b_n . $ <eq:marginal-balance>]
  This bound averages the independent partition and the shuffle; it is not a concentration assertion conditional on the observed paths.
  Off the event in (4.17), the conditional loss in (4.5) is at least $alpha Delta_t^j$. Its loss is always nonnegative. Applying (4.7) gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ bb(E) Delta_(t + 1)^j lt.eq \( 1 - alpha \) bb(E) Delta_t^j + alpha b_n . $ <eq:marginal-recursion>]
  Starting with $Delta_d^j lt.eq 1$ and iterating for $T - d = 16 k d$ steps, we obtain, uniformly in $a \, j$,
  #[#set math.equation(numbering: n => "(4.19)")
   $ bb(E) Delta_T^j lt.eq \( 1 - alpha \)^(T - d) + b_n lt.eq e^(- 4 d) + b_n . $ <eq:marginal-terminal-energy>]
  Let $tilde(delta)_a \( upright(bold(v)) \, cal(M) \)$ be the auxiliary tuple distance conditional on the complete schedule and partition. Use Lemma 8 with $Lambda = upright(bold(v))$. Its terminal identification is automatic, since $cal(F)_T^j$ already contains the complete schedule and predecessor paths. Equations (4.10) and (4.19) give
  #[#set math.equation(numbering: n => "(4.20)")
   $ bb(E)_(upright(bold(v)) \, cal(M)) tilde(delta)_a \( upright(bold(v)) \, cal(M) \) lt.eq n^(3 \/ 2) / 2 sqrt(e^(- 4 d) + b_n) = epsilon_n . $ <eq:marginal-averaged-tuple>]
  The schedule remains inside the distance on the left.
  For every fixed schedule and partition, choose $bold(iota) = \( 1 \, dots.h \, d \)$ in Lemma 4. The first directions are $v_j = e_j$, so $L_0 = I$. Corollary 5, followed by the terminal rotation, therefore gives the same-list identity
  #[#set math.equation(numbering: n => "(4.21)")
   $ tilde(delta)_a \( upright(bold(v)) \, cal(M) \) = delta_a \( cal(M) \) . $ <eq:marginal-frame-transfer>]
  The frame maps enter only this fixed-schedule endpoint comparison. Summing (4.20) over $a$ now gives $bb(E)_(cal(M)) sum_a delta_a \( cal(M) \) lt.eq k epsilon_n$. At least one deterministic partition attains this average bound. Finally, $n^(3 \/ 2) e^(- 2 d) = exp \( \( 3 / 2 log 2 - 2 \) d \) arrow.r 0$, while $2 \/ 3^(3 \/ 4) < 1$ makes $b_n$ exponentially small in $n$. Thus $epsilon_n arrow.r 0$. ◻
]

== 5 From large marginals to a finite degree sum <sec:lift>

Proposition 9 gives one partition for which the complementary image laws have small total error. We first express those image laws as coset laws and condition on one event that bounds all their coset densities. We then turn these bounds into a finite sum of squared degrees of representations of the block groups. The next section will estimate that sum by counting tableaux.

Throughout this section, $U_G$ denotes the uniform probability measure on a finite group $G$. For a subgroup $H$, we use the standard convention that $g H$ is a #emph[left coset]. Its elements are obtained from $g$ by multiplication on the right by elements of $H$. If $mu$ is a probability measure on $G$, write $mu_H$ for its pushforward to the set $G \/ H$ of left cosets. Thus

$ mu_H \( g H \) = mu \( g H \) \, #h(2em) \( U_G \)_H \( g H \) = frac(\| H \|, \| G \|) . $

For the shuffle application, take $X = V$, set $T = 1025 d$ and $mu = q_d^(* T)$, and use the deterministic partition $M_1 \, dots.h \, M_k$ supplied by Proposition 9, with $k = 64$ and $\| M_a \| = n \/ k$. Let $H_a$ permute $M_a$ and fix $X \\ M_a$ pointwise. A permutation maps each reference label to its current position. Two maps $g \, g'$ agree on $X \\ M_a$ exactly when $g^(- 1) g' in H_a$, or equivalently $g' in g H_a$. Thus the ordered images of the cards outside $M_a$ identify the coset $g H_a$ bijectively. Uniform measure on permutations induces uniform measure on these ordered distinct images. The marginal distances in Proposition 9 are consequently exactly the coset distances $delta_a$ for the trimming lemma below, and $sum_a delta_a = o \( 1 \)$.

#thm([Lemma 5.1.])[
  (Simultaneous trimming).  #emph[Let $H_1 \, dots.h \, H_k$ be subgroups of a finite group $G$, and let $mu$ be a probability measure on $G$. Put 
$ delta_a = parallel mu_(H_a) - \( U_G \)_(H_a) parallel_(upright("TV")) \, #h(2em) delta = sum_(a = 1)^k delta_a . $

 If $delta < 1 \/ 2$, there is a set $E subset.eq G$, of removed mass $epsilon = mu \( G \\ E \) lt.eq 2 delta$, such that the conditional probability measure $macron(mu) = mu \( thin dot.op divides E \)$ satisfies 
#[#set math.equation(numbering: n => "(5.1)")
 $ parallel macron(mu) - mu parallel_(upright("TV")) = epsilon \, #h(2em) macron(mu) \( g H_a \) lt.eq frac(2, 1 - epsilon) frac(\| H_a \|, \| G \|) quad \( g in G \, med 1 lt.eq a lt.eq k \) . $ <eq:lift:trim>]

 In particular, if $delta lt.eq 1 \/ 4$, the last density bound is at most $4 \| H_a \| \/ \| G \|$.]
] <lem:trim>

#proof[
  For each $a$, call a coset $C in G \/ H_a$ bad if $mu \( C \) > 2 U_G \( C \)$, and let $B_a$ be the union of its bad cosets. The identity expressing total variation as the sum of positive excesses gives
  $ mu \( B_a \) lt.eq 2 sum_(C in G \/ H_a\
mu \( C \) > 2 U_G \( C \)) #scale(x: 120%, y: 120%)[\(] mu \( C \) - U_G \( C \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 delta_a . $
  Take $E = G \\ union.big_a B_a$. The union bound yields $epsilon lt.eq 2 delta < 1$, so conditioning is well defined. On $E$, the mass of $macron(mu)$ exceeds that of $mu$ by total amount $epsilon$; on the complement, its mass is zero. This proves the total-variation equality in (5.1).
  Fix a coset $C in G \/ H_a$. If it is bad for this subgroup, then $C ∩ E = diameter$. Otherwise,
  $ macron(mu) \( C \) = frac(mu \( C ∩ E \), 1 - epsilon) lt.eq frac(mu \( C \), 1 - epsilon) lt.eq frac(2 U_G \( C \), 1 - epsilon) . $
  The same estimate therefore holds for every coset in every one of the $k$ systems. If $delta lt.eq 1 \/ 4$, then $1 - epsilon gt.eq 1 \/ 2$, giving the last assertion. ◻
]

We now convert the coset bounds into control of averages of representation matrices. For a mass function $a : G arrow.r bb(C)$ and a unitary representation $rho$, define its Fourier matrix by

$ hat(a) \( rho \) = sum_(g in G) a \( g \) rho \( g \) . $

Probability and subprobability measures are identified with their mass functions. For a finite group $H$, write $hat(H)$ for the set of equivalence classes of its complex irreducible representations.

When an irreducible representation of $G$ is restricted to the product of the block groups, each irreducible summand is a tensor product of one representation from each group. If the full representation has dimension $D$, each such tensor product has dimension at most $D$, so at least one factor has degree at most $D^(1 \/ k)$. The following proposition measures the cost of these small factors by a finite sum. Its proof shows why each equivalence class of a subgroup representation contributes only the square of its degree even when it occurs with large multiplicity.

#thm([Proposition 5.2.])[
  (Coset densities and squared subgroup degrees).  #emph[Let a finite set $X$ be partitioned into $k gt.eq 1$ nonempty sets $M_1 \, dots.h \, M_k$, and put $G = "Sym" \( X \)$. Let $H_a$ be the subgroup permuting $M_a$ and fixing $X \\ M_a$ pointwise. Suppose that a probability measure $nu$ on $G$ satisfies, for some $B gt.eq 1$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ nu \( g H_a \) lt.eq B frac(\| H_a \|, \| G \|) #h(2em) \( g in G \, med 1 lt.eq a lt.eq k \) . $ <eq:lift:coset-cap>]

 Then every irreducible complex unitary representation $rho$ of $G$, of dimension $D$, satisfies 
#[#set math.equation(numbering: n => "(5.3)")
 $ parallel hat(nu) \( rho \) parallel_(upright("op"))^2 lt.eq B / D sum_(a = 1)^k sum_(pi in hat(H)_a\
dim pi lt.eq D^(1 \/ k)) \( dim pi \)^2 . $ <eq:lift:orbit-sum>]

 The block sizes need not be equal.]
] <prop:lift:orbit-sum>

#proof[
  Because the blocks are disjoint, their subgroups form the direct product $H = H_1 times dots.h.c times H_k$ inside $G$. By complete reducibility and the irreducible-representation theorem for finite direct products, the restriction of $rho$ to $H$ is an orthogonal sum of isotypic spaces of the form
  #[#set math.equation(numbering: n => "(5.4)")
   $ \( V_(pi_1) ⊗ dots.h.c ⊗ V_(pi_k) \) ⊗ cal(A)_(bold(pi)) . $ <eq:lift:restriction>]
  Here $pi_a$ is an irreducible representation of $H_a$, and $cal(A)_(bold(pi))$ is a multiplicity space on which $H$ acts trivially. These are the usual characteristic-zero representation facts; see, for example, [25,8].
  For every type $bold(pi)$ that occurs, its tensor-product dimension is at most $D$. Consequently some index $a$ satisfies $dim pi_a lt.eq D^(1 \/ k)$. Assign each entire isotypic space in (5.4) to one such index, choosing the least one in case of a tie. Grouping the assigned spaces yields an orthogonal decomposition
  $ V_rho = E_1 xor dots.h.c xor E_k . $
  Each $E_a$ is invariant under $H$, and every irreducible of $H_a$ appearing in $E_a$ has dimension at most $D^(1 \/ k)$. The multiplicities in these restrictions are unrestricted.
  For this fixed representation, put
  $ r_a = sum_(pi in hat(H)_a\
dim pi lt.eq D^(1 \/ k)) \( dim pi \)^2 . $
  Fix $u_a in E_a$, and set
  $ W_a = "span" { rho \( h \) u_a : h in H_a } . $
  We first bound this single-vector orbit span. Regroup all copies of each $H_a$-irreducible, including copies coming from different $H$-types, into a single $H_a$-isotypic space. In such an isotypic space $V_pi ⊗ cal(A)_pi$, with $b = dim pi$, the group acts by $pi \( h \) ⊗ upright("id")$. If $v$ is the projection of $u_a$ to this space, its orbit span is contained in the image of the linear map
  $ "End" \( V_pi \) arrow.r V_pi ⊗ cal(A)_pi \, #h(2em) Q mapsto \( Q ⊗ upright("id") \) v . $
  That image has dimension at most $b^2$, independently of $dim cal(A)_pi$. Each inequivalent $H_a$-type contributes only once. Summing over the different isotypic spaces gives the finite bound
  #[#set math.equation(numbering: n => "(5.5)")
   $ dim W_a lt.eq r_a = sum_(pi in hat(H)_a\
dim pi lt.eq D^(1 \/ k)) \( dim pi \)^2 . $ <eq:lift:orbit-dimension>]
  Let $Pi_a$ be the orthogonal projection onto $W_a$. The subspace $W_a$ is $H_a$-invariant, and therefore $rho \( g h \) W_a = rho \( g \) W_a$ for $h in H_a$. For each vector $z$, the nonnegative function
  $ g mapsto parallel Pi_(rho \( g \) W_a) z parallel^2 $
  is thus constant on each left coset $g H_a$. The coset bound (5.2) implies
  #[#set math.equation(numbering: n => "(5.6)")
   $ bb(E)_(g tilde.op nu) parallel Pi_(rho \( g \) W_a) z parallel^2 lt.eq B bb(E)_(g tilde.op U_G) parallel Pi_(rho \( g \) W_a) z parallel^2 . $ <eq:lift:projection-comparison>]
  The uniform average of these projections is
  $ Q_a = frac(1, \| G \|) sum_(g in G) rho \( g \) Pi_a rho \( g \)^(*) . $
  It commutes with every $rho \( g \)$. Schur’s lemma makes it a scalar multiple of $upright("id")$, and its trace is $dim W_a$. Hence
  #[#set math.equation(numbering: n => "(5.7)")
   $ Q_a = frac(dim W_a, D) upright("id") \, #h(2em) bb(E)_(g tilde.op U_G) parallel Pi_(rho \( g \) W_a) z parallel^2 = frac(dim W_a, D) parallel z parallel^2 . $ <eq:lift:schur-average>]
  Since $rho \( g \) u_a in rho \( g \) W_a$, Cauchy–Schwarz, first for expectation and then in the representation space, gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ \| chevron.l z \, hat(nu) \( rho \) u_a chevron.r \|^2 & lt.eq bb(E)_(g tilde.op nu) \| chevron.l z \, rho \( g \) u_a chevron.r \|^2\
 & lt.eq parallel u_a parallel^2 bb(E)_(g tilde.op nu) parallel Pi_(rho \( g \) W_a) z parallel^2\
 & lt.eq frac(B r_a, D) parallel u_a parallel^2 parallel z parallel^2 \, $ <eq:lift:component-bound>]
  where the last line uses (5.5)–(5.7). For an arbitrary $u = sum_a u_a$, sum the square-root form of this estimate and apply Cauchy–Schwarz in the index $a$:
  $ \| chevron.l z \, hat(nu) \( rho \) u chevron.r \| & lt.eq sqrt(B / D) thin parallel z parallel sum_(a = 1)^k sqrt(r_a) thin parallel u_a parallel\
 & lt.eq sqrt(B / D sum_(a = 1)^k r_a) thin parallel z parallel (sum_(a = 1)^k parallel u_a parallel^2)^(1 \/ 2)\
 & = sqrt(B / D sum_(a = 1)^k r_a) thin parallel z parallel thin parallel u parallel . $
  The last equality uses the orthogonality of the $E_a$. Taking the supremum over unit vectors $u \, z$ and squaring proves (5.3). The argument includes zero components and one-dimensional representations; in dimension one the displayed sum does not provide decay. ◻
]

== 6 An elementary bound on representation degrees <sec:degrees>

Proposition 11 reduced the Fourier estimate to a finite sum of squared degrees of small representations of each block group. We now bound that sum. For integers $s \, D \, k gt.eq 1$ and a group $H tilde.equiv S_s$, we have

#[#set math.equation(numbering: n => "(6.1)")
 $ sum_(pi in hat(H)\
dim pi lt.eq D^(1 \/ k)) \( dim pi \)^2 & = sum_(pi in hat(H)\
dim pi lt.eq D^(1 \/ k)) \( dim pi \)^18 \( dim pi \)^(- 16)\
 & lt.eq D^(18 \/ k) sum_(pi in hat(H)) \( dim pi \)^(- 16) . $ <eq:degrees:truncated-sum>]

Thus a uniform bound on the sum of inverse sixteenth powers of degrees will control every block size in the preceding proposition. We also prove that the sum tends to zero after the trivial and sign representations are removed. That second statement will control the full-group Fourier sum in the completion.

Recall that the complex irreducible representations of $S_s$ are indexed by partitions $lambda tack.r s$, and that their degrees $f^lambda$ count standard Young tableaux of shape $lambda$. Such a tableau fills the diagram with $1 \, dots.h \, s$, increasing along every row and column. The partitions $\( s \)$ and $\( 1^s \)$ afford the trivial and sign representations, respectively; transposing a tableau gives $f^(lambda') = f^lambda$. These are the classical Specht-module and standard-tableau facts [25,8]. Liebeck and Shalev prove the stronger estimate $sum_(lambda tack.r s) \( f^lambda \)^(- u) = 2 + O_u \( s^(- u) \)$ as $s arrow.r oo$, for every fixed $u > 0$ [14] Theorems 1.1 and 2.6. The following elementary proof at exponent $16$ keeps this application independent of that stronger estimate; it uses only the tableau facts just recalled.

#thm([Lemma 6.1.])[
  (Summability of inverse degrees).  #emph[There is an absolute finite constant 
#[#set math.equation(numbering: n => "(6.2)")
 $ C_0 := sup_(s gt.eq 1) sum_(lambda tack.r s) \( f^lambda \)^(- 16) < oo . $ <eq:degrees:uniform>]

 Moreover, 
#[#set math.equation(numbering: n => "(6.3)")
 $ sum_(lambda tack.r s\
lambda in.not { \( s \) \, \( 1^s \) }) \( f^lambda \)^(- 16) arrow.r 0 #h(2em) upright("as ") s arrow.r oo . $ <eq:degrees:vanishing>]

 The excluded partitions are interpreted as a set, so when $s = 1$ only the single partition $\( 1 \)$ is excluded.]
] <lem:degrees>

#proof[
  We first record two elementary counting observations. If a diagram has first row of length $a$ and exactly $b$ boxes below it, where $0 lt.eq b lt.eq a$, then
  #[#set math.equation(numbering: n => "(6.4)")
   $ f^lambda gt.eq binom(a, b) . $ <eq:degrees:tableau-construction>]
  This is the tableau construction of Liebeck and Shalev [14] Lemma 2.1, with their parameters $n = a + b$ and $k = b$. To see it directly, place $1 \, dots.h \, b$ in the first $b$ boxes of the first row. Choose any $b$ labels from ${ b + 1 \, dots.h \, a + b }$ for the boxes below that row, and put them in increasing row-major order: read rows from top to bottom, and each row from left to right. Fill the rest of the first row increasingly with the remaining labels. Every box below the first row lies in one of its first $b$ columns. Its top-row predecessor therefore has a label at most $b$, while all lower labels are larger than $b$. Row-major filling respects both row and column inequalities within the lower diagram, so this is a standard tableau. Different choices of lower labels give different tableaux. When $b = 0$ the construction is the unique tableau of a single row.
  Also, if $mu$ is a Young subdiagram of $lambda$, every standard tableau of $mu$ extends to one of $lambda$: retain its labels and fill the remaining boxes in row-major order with the successive larger labels. Because a Young subdiagram is closed under moving up and left, all required predecessors have already been filled. Consequently,
  #[#set math.equation(numbering: n => "(6.5)")
   $ f^lambda gt.eq f^mu . $ <eq:degrees:extension>]
  Write $p \( t \)$ for the number of partitions of $t$. For $t gt.eq 1$, regarding a partition as an ordered composition gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ p \( t \) lt.eq 2^(t - 1) lt.eq 2^t \, $ <eq:degrees:partition-count>]
  since a composition is specified by cuts in the $t - 1$ gaps between $t$ successive units. We set $p \( 0 \) = 1$.
  For a partition $lambda tack.r s$, put
  $ L = max { lambda_1 \, lambda'_1 } \, #h(2em) h = s - L . $
  After transposing if necessary, assume its first row has length $L$. This does not change its degree. The case $h = 0$ consists precisely of the row and column partitions, which are excluded from (6.3). We divide the other diagrams into three classes.
  #emph[A long first row or column: $1 lt.eq h lt.eq s \/ 3$.] For fixed $h$, there are at most $2 p \( h \)$ original shapes: after a possible transpose, the diagram below the first row is a partition of $h$. By (6.4),
  $ f^lambda gt.eq binom(s - h, h) gt.eq (frac(s - h, h))^h gt.eq 2^h . $
  Here the middle inequality follows by writing $binom(a, b) = product_(j = 0)^(b - 1) \( a - j \) \/ \( b - j \)$ and bounding each factor below by $a \/ b$ when $a gt.eq b gt.eq 1$. Thus the total inverse-degree contribution with a given $h$ is at most
  $ 2 dot.op 2^h binom(s - h, h)^(- 16) lt.eq 2 dot.op 2^(- 15 h) . $
  For each fixed positive $h$, the binomial coefficient tends to infinity with $s$. The displayed geometric majorant is summable over $h$. Extending a contribution by zero when $h > s \/ 3$, dominated convergence for this series shows that the total contribution of this class tends to zero.
  #emph[Intermediate width: $h > s \/ 3$ and $L gt.eq s \/ 8$.] Here $L < 2 s \/ 3$, so $h > L \/ 2$. Set $b = floor.l L \/ 2 floor.r$ and take the subdiagram $mu$ consisting of the whole first row and the first $b$ boxes below it in row-major order. There are enough boxes because $h gt.eq b$, and an initial segment of row-major order in the lower diagram is again a Young diagram. Applying (6.5) and (6.4) gives
  $ f^lambda gt.eq binom(L, floor.l L \/ 2 floor.r) gt.eq frac(2^L, L + 1) gt.eq frac(2^(s \/ 8), s + 1) . $
  The central binomial coefficient is the largest of the $L + 1$ coefficients whose sum is $2^L$. Using (6.6), the total contribution of this class is therefore at most
  #[#set math.equation(numbering: n => "(6.7)")
   $ 2^s (frac(s + 1, 2^(s \/ 8)))^16 = \( s + 1 \)^16 2^(- s) arrow.r 0 . $ <eq:degrees:intermediate>]
  #emph[Small width and height: $L < s \/ 8$.] Number row and column indices starting at $1$, and group boxes by their index sum. There are at most $2 L - 1$ nonempty such diagonals. Fill the diagonals in increasing index-sum order, assigning the next available consecutive labels to each diagonal in any order. Every row or column predecessor has a strictly smaller index sum, so every such filling is a standard tableau. If the nonempty diagonal sizes are $u_1 \, dots.h \, u_q$, then
  $ f^lambda gt.eq product_(j = 1)^q u_j ! gt.eq product_(j = 1)^q 2^(u_j - 1) = 2^(s - q) gt.eq 2^(3 s \/ 4) . $
  We used $u ! gt.eq 2^(u - 1)$ for integers $u gt.eq 1$, and $q lt.eq 2 L - 1 < s \/ 4$. The inverse-degree contribution of this class is at most
  #[#set math.equation(numbering: n => "(6.8)")
   $ 2^s #scale(x: 120%, y: 120%)[\(] 2^(3 s \/ 4) #scale(x: 120%, y: 120%)[\)]^(- 16) = 2^(- 11 s) arrow.r 0 . $ <eq:degrees:small-width>]
  These three classes cover all partitions except the row and column, so they prove (6.3). For every $s gt.eq 2$ those two partitions are distinct and each has degree $1$. The complete sum in (6.2) consequently tends to $2$ as $s arrow.r oo$. For each fixed positive $s$ it is a finite sum of positive terms, since there are finitely many partitions and every degree is a positive integer. The tail of this convergent sequence is bounded, and its finitely many initial values have a finite maximum. This proves (6.2), including $s = 1$, where the complete sum is $1$. ◻
]

In representation notation, the uniform conclusion of the lemma is

#[#set math.equation(numbering: n => "(6.9)")
 $ C_0 = sup_(s gt.eq 1) sum_(pi in hat(S_s)) \( dim pi \)^(- 16) < oo . $ <eq:lift:degree-constant>]

We can now finish the transfer from bounded coset densities to Fourier decay. The bound is uniform over the block sizes because $C_0$ is uniform over all positive integers $s$.

#thm([Corollary 6.2.])[
  (From bounded coset densities to Fourier decay).  #emph[Let a finite set $X$ be partitioned into $k > 18$ nonempty sets $M_1 \, dots.h \, M_k$, and put $G = "Sym" \( X \)$. Let $H_a$ be the subgroup that permutes $M_a$ and fixes $X \\ M_a$ pointwise. Suppose that a probability measure $nu$ on $G$ satisfies, for some $B gt.eq 1$, 
$ nu \( g H_a \) lt.eq B frac(\| H_a \|, \| G \|) #h(2em) \( g in G \, med 1 lt.eq a lt.eq k \) . $

 Then every irreducible complex unitary representation $rho$ of $G$, of dimension $D$, satisfies 
#[#set math.equation(numbering: n => "(6.10)")
 $ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq sqrt(k B C_0) thin D^(- \( 1 - 18 \/ k \) \/ 2) . $ <eq:lift:general-fourier>]

 Here $C_0$ is the absolute constant of Lemma 12. The block sizes need not be equal.]
] <prop:lift>

#proof[
  For every $a$, the group $H_a$ is isomorphic to $S_(\| M_a \|)$. Hence (6.1) and Lemma 12 give
  $ sum_(pi in hat(H)_a\
dim pi lt.eq D^(1 \/ k)) \( dim pi \)^2 lt.eq C_0 D^(18 \/ k) . $
  In the orbit construction of Proposition 11, this recovers $dim W_a lt.eq C_0 D^(18 \/ k)$, and the component bound (5.8) becomes
  $ \| chevron.l z \, hat(nu) \( rho \) u_a chevron.r \|^2 lt.eq B C_0 D^(- 1 + 18 \/ k) parallel u_a parallel^2 parallel z parallel^2 . $
  Substituting the displayed degree bound into (5.3) yields
  $ parallel hat(nu) \( rho \) parallel_(upright("op"))^2 lt.eq k B C_0 D^(- 1 + 18 \/ k) . $
  Taking square roots proves (6.10). ◻
]

== 7 Completion of the mixing bound <sec:completion>

Return to $G = "Sym" \( V \)$ for $n = 2^d$. We now pass from the operator estimate to the full permutation law. Use the Fourier convention from Section 5, and write $D_rho$ for the dimension of an irreducible unitary representation $rho$. Our convolution convention gives $accent(mu * nu, ̂) \( rho \) = hat(mu) \( rho \) hat(nu) \( rho \)$. The following Plancherel bound is the classical Fourier method used by Diaconis and Shahshahani [7]. We keep the full matrix form because the shuffle law need not be central, and we record the normalization explicitly.

#thm([Lemma 7.1.])[
  (The full-group variation bound).  #emph[For any probability measure $nu$ on $G$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ 4 parallel nu - U parallel_(upright("TV"))^2 lt.eq sum_(rho eq.not upright("triv")) D_rho parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 \, $ <eq:plancherel-tv>]

 where the sum contains one representative of each nontrivial irreducible equivalence class.]
] <lem:plancherel>

#proof[
  Cauchy–Schwarz bounds the left side by $\| G \| sum_g \| nu \( g \) - \| G \|^(- 1) \|^2$. For any real function $a$ on $G$, expansion and the regular-character identity give
  $ sum_rho D_rho parallel sum_g a \( g \) rho \( g \) #scale(x: 180%, y: 180%)[parallel]_(upright("HS"))^2 & = sum_(g \, h) a \( g \) a \( h \) sum_rho D_rho "tr" #scale(x: 120%, y: 120%)[\(] rho \( h \)^(*) rho \( g \) #scale(x: 120%, y: 120%)[\)]\
 & = \| G \| sum_g a \( g \)^2 . $
  Apply this to $a \( g \) = nu \( g \) - \| G \|^(- 1)$. The trivial coefficient vanishes; uniform averaging in every nontrivial irreducible is zero. These facts give (7.1). ◻
]

#thm([Lemma 7.2.])[
  (Fair sign).  #emph[For every $d gt.eq 1$ and every integer $t gt.eq 1$, $hat(q_d^(* t)) \( "sgn" \) = 0$. If a probability measure $nu$ is $epsilon$ away from $q_d^(* t)$ in total variation, then $\| hat(nu) \( "sgn" \) \| lt.eq 2 epsilon$. If instead $0 lt.eq xi lt.eq q_d^(* t)$ has mass $m$, then $\| hat(xi) \( "sgn" \) \| lt.eq 1 - m$.]
] <lem:fair-sign>

#proof[
  Condition on every switch bit except one in the final physical shuffle. Changing that bit composes the output permutation with a transposition, so its two possible signs are opposite and equally likely. The expectation of sign is therefore zero. The two perturbation estimates follow by summing against a function of absolute value one; their respective $ell^1$ differences are $2 epsilon$ and $1 - m$. ◻
]

#proof[
  Fix $k = 64$ and let $d gt.eq 6$ grow. Put $T = 1025 d$ and $mu = q_d^(* T)$. Proposition 9 supplies a partition of the labels into $k$ sets of size $m = n \/ k$ for which the sum of the complementary marginal errors tends to zero. Lemma 10 therefore applies with their sum at most $1 \/ 4$ for all sufficiently large $d$. It supplies a probability measure $macron(mu)$ such that
  #[#set math.equation(numbering: n => "(7.2)")
   $ parallel macron(mu) - mu parallel_(upright("TV")) = o \( 1 \) \, #h(2em) macron(mu) \( g H_a \) lt.eq 4 frac(\| H_a \|, \| G \|) quad \( g in G \, med 1 lt.eq a lt.eq k \) . $ <eq:final-trim>]
  Here $H_a$ permutes the $a$th label block and fixes all other labels. Corollary 13 gives, simultaneously for every irreducible $rho$ of dimension $D$,
  #[#set math.equation(numbering: n => "(7.3)")
   $ parallel hat(macron(mu)) \( rho \) parallel_(upright("op")) lt.eq A D^(- 23 \/ 64) \, #h(2em) A = sqrt(4 dot.op 64 thin C_0) \, $ <eq:final-op>]
  where $C_0$ is the absolute constant in Lemma 12.
  Take $ell = 32$, a fixed number independent of $d$. Operator-norm submultiplicativity and $parallel B parallel_(upright("HS")) lt.eq sqrt(D) parallel B parallel_(upright("op"))$ show that the contribution of the nontrivial, nonsign representations to the right side of (7.1), for $nu = macron(mu)^(* ell)$, is at most
  #[#set math.equation(numbering: n => "(7.4)")
   $ sum_(rho eq.not upright("triv") \, "sgn") D parallel hat(macron(mu)) \( rho \)^ell parallel_(upright("HS"))^2 & lt.eq A^64 sum_(rho eq.not upright("triv") \, "sgn") D^(2 - 64 \( 23 \/ 64 \))\
 & = A^64 sum_(rho eq.not upright("triv") \, "sgn") D^(- 21) = o \( 1 \) . $ <eq:final-degree-sum>]
  The last conclusion follows from Lemma 12, since $D^(- 21) lt.eq D^(- 16)$ for $D gt.eq 1$. Neither diagonalizability nor normality of the Fourier matrices is needed here.
  The sign representation has dimension one, so (7.3) alone gives no decay. Lemma 15 shows that $hat(mu) \( "sgn" \) = 0$ and therefore
  $ \| hat(macron(mu)) \( "sgn" \) \| lt.eq 2 parallel macron(mu) - mu parallel_(upright("TV")) = o \( 1 \) . $
  Its contribution after $ell$ factors is therefore $o \( 1 \)$ as well. Together with Lemma 14 and (7.4), this proves $parallel macron(mu)^(* 32) - U parallel_(upright("TV")) = o \( 1 \)$.
  Convolution by a probability measure contracts total variation. Replacing the factors one at a time and using (7.2) gives
  $ parallel mu^(* 32) - U parallel_(upright("TV")) lt.eq 32 parallel mu - macron(mu) parallel_(upright("TV")) + parallel macron(mu)^(* 32) - U parallel_(upright("TV")) = o \( 1 \) . $
  Successive independent $T$-step blocks of the original shuffle have law $mu$, so $mu^(* 32) = q_d^(* 32800 d)$. Equation (2.2) makes this conclusion uniform over the initial ordering. In particular the distance is at most $1 \/ 4$ for all sufficiently large $d$, as required. ◻
]

The constants were chosen to leave room in two simple estimates: the hidden-card contraction must overcome the number of sequential marginal comparisons, and the fixed convolution count must overcome the Fourier dimension weights. No optimal leading constant or cutoff statement is asserted. Together with the support lower bound, the result gives mixing order $Theta \( d \)$.

===== 7.1 Further partial-permutation laws. <further-partial-permutation-laws.>

Theorem 1 is complete with the frame, omitted-block, orbit, and tableau arguments above. The remaining sections compare estimates for each fixed list with estimates averaged over lists. They then examine what can be retained after stopping or conditioning on trajectory events and develop Fourier and character transfers for those forms of partial information.

== 8 Fixed input laws and independent shears <shear:sec:directions>

The local proof obtained balance by sampling one omitted block. For an arbitrary fixed input list, a previous switch supplies balance instead: it crosses the two halves relevant to the next direction, and the intervening switches preserve those halves. This gives an ordinary tuple law for every fixed list. We then record an independent shear realization of fresh directions and several estimates that retain an average over inputs. The realization will also control which auxiliary data may be disclosed in the later history arguments.

We use $N = n = 2^d$ and the coordinate process $X^(bold(iota))$ of Lemma 4, where $bold(iota) = \( iota_1 \, dots.h \, iota_d \)$ is any ordering of the standard axes and $i \( s \) = iota_(1 + \( \( s - 1 \) med mod med d \))$. Thus

#[#set math.equation(numbering: n => "(8.1)")
 $ X_0^(bold(iota)) = upright("id") \, #h(2em) X_s^(bold(iota)) = h_s X_(s - 1)^(bold(iota)) \, #h(2em) h_s tilde.op U_(C_(e_(i \( s \)))) $ <shear:eq:coordinate-chain>]

with independent increments. The order $\( 1 \, dots.h \, d \)$ gives the rotating-frame chain $X$; its physical permutation is $R^s X_s$. Other starting phases and the reversed order are included by choosing another $bold(iota)$.

=== 8.1 Balance for every fixed list <balance-for-every-fixed-list>

We will use the following elementary concentration estimates.

#thm([Lemma 8.1.])[
  (Concentration estimates).  #emph[Let $X_1 \, dots.h \, X_r$ be independent random variables in $\[ 0 \, 1 \]$ and put $S = sum_i X_i$. For $a gt.eq 0$ and $r gt.eq 1$, 
$ Pr \( S - bb(E) S gt.eq a \) \, quad Pr \( S - bb(E) S lt.eq - a \) lt.eq e^(- 2 a^2 \/ r) . $

 More generally, if $\( M_j \)_(j = 0)^r$ is a real martingale whose increments have absolute value at most $c_j$, either tail at distance $a$ is at most $exp \[ - a^2 \/ \( 2 sum_j c_j^2 \) \]$ when the denominator is positive. If all $c_j$ vanish, the martingale is constant. In particular, if $X$ counts the points of a uniform $m$-subset in a fixed half of a finite set of even size, then 
$ Pr \( X < m \/ 4 \) lt.eq e^(- m \/ 32) #h(2em) \( m gt.eq 1 \) . $

]
] <lem:concentration>

#proof[
  For a variable $Z$ in an interval of length $b$, put $psi \( s \) = log bb(E) e^(s Z)$. Its second derivative is the variance under the exponentially tilted law, at most $b^2 \/ 4$. Integrating from $psi \( 0 \) = 0$ and $psi' \( 0 \) = bb(E) Z$ gives $bb(E) e^(s \( Z - bb(E) Z \)) lt.eq e^(s^2 b^2 \/ 8)$. Multiplication and minimization in $s$ prove the independent-variable bound. The conditional version, with interval length $2 c_j$, gives $bb(E) e^(s \( M_r - M_0 \)) lt.eq e^(s^2 sum_j c_j^2 \/ 2)$ and the martingale bound. These are the exponential-moment arguments underlying the inequalities of Hoeffding and Azuma [10,3].
  Expose a uniform subset in a uniform random order and form the Doob martingale for its final half-count. The expected final count changes by at most one at each draw: completions following two possible next draws can be coupled by exchanging those points. The initial expectation is $m \/ 2$. Use $r = m$, $c_j = 1$, and $a = m \/ 4$. ◻
]

For the fixed-list estimate, generate $Z$ directly as in Section 4: its first $d$ directions are $v_j = e_(iota_j)$, and for $s > d$ choose $v_s$ uniformly outside the hyperplane

#[#set math.equation(numbering: n => "(8.2)")
 $ W_s = "span" \( v_(s - d + 1) \, dots.h \, v_(s - 1) \) . $ <shear:eq:hyperplane>]

Given the complete schedule, the switches are independent and uniform. Every $d$ consecutive directions form a basis. For a fixed input list, take deterministic initial data $Xi$ in (4.1).

#thm([Lemma 8.2.])[
  (Balance after the previous transverse switch).  #emph[Fix any $ell < N$ observed labels, and put $m = N - ell$. For $s > d$, let $D_(s - 1)$ be their available positions just before step $s$. Then 
#[#set math.equation(numbering: n => "(8.3)")
 $ Pr { min \( \| D_(s - 1) ∩ W_s \| \, \| D_(s - 1) \\ W_s \| \) < m \/ 4 } lt.eq 2 e^(- m \/ 8) . $ <shear:eq:fixed-balance>]

 The probability averages the observed paths; it is not conditional on them.]
] <shear:lem:fixed-balance>

#proof[
  Fix the complete direction schedule. The direction $v_(s - d)$ crosses the two cosets of $W_s$, because the $d$ directions starting at $s - d$ form a basis. The intervening directions lie in $W_s$ and preserve each coset.
  Condition on the observed configuration immediately before step $s - d$. Let $a$ be the number of matching pairs with two available positions and $b$ the number with one, so $m = 2 a + b$. Immediately after this crossing switch, the available count on either chosen side is $a + "Bin" \( b \, 1 \/ 2 \)$, using $b$ independent fair coins. Its mean is $m \/ 2$. If $b > 0$, Lemma 16 bounds a deviation of at least $m \/ 4$ by $2 exp \( - 2 \( m \/ 4 \)^2 \/ b \) lt.eq 2 e^(- m \/ 8)$; if $b = 0$ the count is exactly $m \/ 2$. The intervening switches preserve the count. Remove the conditioning to obtain the claim. ◻
]

#thm([Proposition 8.3.])[
  (Uniform large-marginal estimates).  #emph[Let $L gt.eq 2$ be a fixed integer dividing $N$, and let $0 lt.eq q lt.eq N - N \/ L$. For every ordered list $C$ of $q$ distinct labels, every periodic ordering $bold(iota)$ of the standard axes, and every integer $T gt.eq d$, 
#[#set math.equation(numbering: n => "(8.4)")
 $ parallel cal(L) \( X_T^(bold(iota)) \( C \) \) - pi_q parallel_(upright("TV")) lt.eq N^(3 \/ 2) / 2 (e^(- \( T - d \) \/ \( 4 L \)) + 2 e^(- N \/ \( 8 L \)))^(1 \/ 2) . $ <shear:eq:general-fixed-marginal>]

 The same bound holds for $\( X_T^(bold(iota)) \)^(- 1) \( C \)$. For the physical shuffle and its inverse, the corresponding position laws satisfy the same bound.]
  #emph[The following choices used below give distance at most $N^(3 \/ 2) sqrt(a_T) \/ 2$: 
#[#set math.equation(numbering: n => "(8.5)")
 $ L = 8 \, quad T = 256 d : & quad a_T = \( 31 \/ 32 \)^(255 d) + 64 e^(- N \/ 64) \,\
L = 8 \, quad T = 257 d : & quad a_T = e^(- 8 d) + 2 e^(- N \/ 64) \,\
L = 32 \, quad T = 2049 d : & quad a_T = e^(- 16 d) + 256 e^(- N \/ 256) . $ <shear:eq:256-marginal>]

 Each of these three substituted bounds tends to zero as $d arrow.r oo$, uniformly in the list and axis order. The last energy bound is $o \( N^(- 4) \)$.]
] <shear:prop:fixed-marginal>

#proof[
  For a successive hidden-card problem, its number $m$ of available positions is at least $N \/ L$. Off the event in (8.3), Lemma 4.1 gives conditional expected loss at least $gamma Delta_t$, where $gamma = 1 \/ \( 4 L \)$. The loss is always nonnegative. Equation (4.7) therefore gives, for $t gt.eq d$,
  #[#set math.equation(numbering: n => "(8.6)")
   $ bb(E) Delta_(t + 1) lt.eq \( 1 - gamma \) bb(E) Delta_t + 2 gamma e^(- N \/ \( 8 L \)) . $ <shear:eq:fixed-recursion>]
  Starting from $Delta_d lt.eq 1$ yields $bb(E) Delta_T lt.eq \( 1 - gamma \)^(T - d) + 2 e^(- N \/ \( 8 L \))$. Apply Lemma 8 with terminal data $Lambda = upright(bold(v))$. For every complete schedule, the first basis is $\( e_(iota_1) \, dots.h \, e_(iota_d) \)$, so $L_0 = I$ in Lemma 4. The same-list equality (3.9) transfers the conditional tuple bound to $X^(bold(iota))$, giving (8.4).
  Each switch is an involution. Reversing the independent factors therefore identifies $\( X_T^(bold(iota)) \)^(- 1)$ with a coordinate chain whose first axis is $i \( T \)$ and whose periodic order is reversed. This is another permitted ordering, so the same estimate applies. The relation $Y_T = R^T X_T$ transfers the forward physical law by an output bijection. Its inverse is $X_T^(- 1) R^(- T)$; the input bijection only changes the fixed list, and the bound is uniform in that list.
  For (8.5), weaken the additive term in (8.6) to $2 e^(- N \/ 64)$ and sum the geometric series, giving the factor $64$. At $257 d$ keep the sharper recurrence and use $\( 31 \/ 32 \)^(256 d) lt.eq e^(- 8 d)$. More generally, at $T = \( 1 + 64 L \) d$, the weakened additive term $2 e^(- N \/ \( 8 L \))$ gives $e^(- 16 d) + 8 L e^(- N \/ \( 8 L \))$, yielding (8.5). These rates dominate the factor $N^3$ in the squared tuple bound, and $e^(- 16 d) = o \( N^(- 4) \)$. ◻
]

=== 8.2 An independent shear realization <an-independent-shear-realization>

The fixed-list proof above uses the directly generated direction process. The next construction couples a process with a triangular first basis and the same later uniform-complement rule to a coordinate chain with the same fixed inputs. It also proves the conditional path identity needed when the auxiliary shear entries are retained at terminal time.

#thm([Lemma 8.4.])[
  (Independent shear realization).  #emph[Fix an axis order $bold(iota)$ and a horizon $T gt.eq d$. Independently of the increments in (8.1), choose independent fair bits $b_(s j)$ for $j eq.not i \( s \)$, put $b_(s \, i \( s \)) = 0$, and write $Lambda$ for all these entries. Set 
$ S_s = I + e_(i \( s \)) b_s \, #h(2em) A_0 = I \, quad A_s = A_(s - 1) S_s \, #h(2em) v_s = A_(s - 1) e_(i \( s \)) \, #h(2em) Z_s = A_s X_s^(bold(iota)) . $

 Conditional on $Lambda$, the increments of $Z$ are independent uniform switches in directions $v_s$. More precisely, if $sans(P)_(v_1 \, dots.h \, v_t)$ is the product-switch path law through time $t$ starting at the identity, then 
#[#set math.equation(numbering: n => "(8.7)")
 $ cal(L) \( \( Z_s \)_(s = 0)^t divides Lambda \) = sans(P)_(v_1 \, dots.h \, v_t) #h(2em) \( 0 lt.eq t lt.eq T \) . $ <shear:eq:prefix-factorization>]

 Every $d$ consecutive directions form a basis. For $s > d$, conditional on $v_1 \, dots.h \, v_(s - 1)$, the next direction is uniform on $V \\ W_s$, with $W_s$ as in (8.2). This law is unchanged by additionally observing any part of the virtual path prefix through time $s - 1$.]
] <shear:lem:keys>

#proof[
  The map $S_s$ is an involution in $C_(e_(i \( s \)))$, because $b_s e_(i \( s \)) = 0$. The increment of $Z$ is
  $ A_(s - 1) \( S_s h_s \) A_(s - 1)^(- 1) . $
  For fixed $Lambda$, the factors $S_s h_s$ are independent and uniform in their coordinate matching groups. Conjugation gives the asserted product-switch law, including the joint prefix identity (8.7).
  Extend $i \( s \)$ periodically beyond $T$ and define the deterministic next-read time of a column by
  $ tau \( s \, j \) = min { t > s : i \( t \) = j } #h(2em) \( j eq.not i \( s \) \) . $
  Right multiplication by $S_s$ leaves the selected column unchanged and adds $b_(s j) v_s$ to column $j$. Thus the direction at a column’s first read, for $t lt.eq d$, is
  $ v_t = e_(i \( t \)) + sum_(1 lt.eq u < t) b_(u \, i \( t \)) v_u . $
  These first $d$ directions form a triangular basis. At later reads,
  #[#set math.equation(numbering: n => "(8.8)")
   $ v_t = v_(t - d) + sum_(t - d < u < t) b_(u \, i \( t \)) v_u #h(2em) \( t > d \) . $ <shear:eq:key-recurrence>]
  In either display the coefficients used at time $t$ are exactly the entries whose next-read time is $t$. Inductively, all earlier directions are functions only of entries with next-read time less than $t$. The batch read at $t$ is therefore independent and fair conditional on those directions. The recurrence also shows inductively that every consecutive $d$ directions form a basis. For $t > d$, its fresh $d - 1$ coefficients make $v_t$ uniform on $v_(t - d) + W_t = V \\ W_t$.
  Finally, (8.7) says that the entire virtual path prefix and $Lambda$ are conditionally independent given the direction prefix. Hence observing any portion of that path prefix cannot reveal the fresh batch that determines the next direction. ◻
]

For initial data $Xi$ independent of $\( Lambda \, \( Z_s \)_(s = 0)^T \)$ and determining the observed list, the joint prefix factorization gives, for every $0 lt.eq t lt.eq T$, $1 lt.eq j lt.eq q$, and $x in V$,

#[#set math.equation(numbering: n => "(8.9)")
 $ Pr { Z_t \( c_j \) = x divides Lambda \, Xi \, thin Z_s \( c_i \) : 0 lt.eq s lt.eq t \, med i < j } = p_t^j \( x \) \, $ <shear:eq:terminal-factorization>]

where $p_t^j$ uses the chronological field (4.1). At $t = T$ this is precisely the terminal identification required by Lemma 8. For $t < T$ it concerns only predecessor path prefixes through $t$; conditioning on their future paths requires the separate path-cylinder argument in Section 12. The next direction is averaged in the smaller chronological field before $Lambda$ is disclosed.

The coupling also preserves every fixed input list conditionally on the shears:

#[#set math.equation(numbering: n => "(8.10)")
 $ parallel cal(L) \( Z_T \( C \) divides Lambda \) - pi_q parallel_(upright("TV")) = parallel cal(L) \( X_T^(bold(iota)) \( C \) \) - pi_q parallel_(upright("TV")) . $ <shear:eq:fixed-list-frame>]

Indeed, $X^(bold(iota))$ is independent of $Lambda$ and $Z_T = A_T X_T^(bold(iota))$, with $A_T$ a bijection on outputs. Here $A_0 = I$ although the first directions are generally triangular combinations of the coordinate axes. This same-input identity is a feature of the shear realization; the arbitrary first-basis statement in Lemma 4 instead has the input map $L_0^(- 1)$.

#prodef([Remark 8.5.])[
  (Equivalent inverse-frame factorization).  The same coupling has a useful inverse notation. Let $Q_s$ be the original independent coordinate increments and choose the independent shears $S_s$ above. Put $B_0 = I$ and $B_s = S_s B_(s - 1) = A_s^(- 1)$. Define
  #[#set math.equation(numbering: n => "(8.11)")
   $ M_s = B_(s - 1)^(- 1) \( S_s Q_s \) B_(s - 1) = B_s^(- 1) Q_s B_(s - 1) \, #h(2em) X_T^(bold(iota)) = B_T M_T dots.h.c M_1 . $ <shear:eq:inverse-coupling>]
  The second identity follows by telescoping. Conditional on all $S_s$, the factors $S_s Q_s$ are independent uniform coordinate switches, so $M_s$ has virtual direction $B_(s - 1)^(- 1) e_(i \( s \))$. This is the same virtual process and the same prefix and terminal factorization as above. The map $B_T$ acts only on outputs, leaving a fixed input list unchanged. The posterior identity concerns virtual positions; once $B_T$ is disclosed, both the virtual endpoint law and its uniform comparison may be pushed through that known output map.
] <shear:rem:factorization>

The fixed-list balance has a second interpretation in this coupling. For $s > d$, the current columns of $A_(s - 1)$ other than column $i \( s \)$ are triangular combinations of the last $d - 1$ selected columns, with diagonal coefficients one. Hence

$ W_s = A_(s - 1) { x : x_(i \( s \)) = 0 } . $

The two available counts in (8.3) are therefore the counts according to bit $i \( s \)$ in the coordinate chain. That bit was last refreshed at step $s - d$ and is unchanged by the intervening coordinate layers. The same $a + "Bin" \( b \, 1 \/ 2 \)$ calculation proves the balance directly in the original coordinate frame.

== 9 Estimates that average the input labels <shear:sec:averaged>

Sampling the inputs supplies balance without using the previous transverse switch. These estimates average the distance for each specified input list; they do not replace that family of conditional distances by the distance of a mixture. This distinction permits a later choice of one deterministic partition or the construction of kernels for all starting states.

=== 9.1 A reservoir of omitted labels <a-reservoir-of-omitted-labels>

#thm([Proposition 9.1.])[
  (A reservoir of omitted labels).  #emph[Let $d gt.eq 3$, $b = N \/ 8$, and $T = 257 d$. Let $B$ be a uniform $b$-subset of input labels, independent of the shuffle. For any fixed ordering of $V \\ B$, let $delta_T \( B \)$ be the distance of its image tuple under $X_T$ from uniform distinct positions. With $theta = 2^(1 \/ 4) \( 3 \/ 4 \) < 1$, 
#[#set math.equation(numbering: n => "(9.1)")
 $ bb(E)_B delta_T \( B \) lt.eq N^(3 \/ 2) / 2 (e^(- 8 d) + 2 \( N + 1 \) theta^(N \/ 8))^(1 \/ 2) = o \( 1 \) . $ <shear:eq:reservoir-marginal>]

]
] <shear:prop:reservoir>

#proof[
  Use the direct direction process with standard first basis, sampled independently of $B$, and take $Xi = B$ in the online construction. At every time the available set for a hidden card contains $Z_t \( B \)$. Fix the full direction schedule and the full permutation $Z_t$, but not $B$. The set $Z_t \( B \)$ is then a uniform $b$-subset, and each coset of the next-direction hyperplane has size $N \/ 2$.
  Its count in a specified half has the distribution of the number of ones among the first $b$ of $N$ independent fair bits, conditional on their total being $N \/ 2$. This conditioning event has probability at least $1 \/ \( N + 1 \)$, because the central binomial coefficient is maximal. For the unconditioned first-$b$ count $J$,
  $ Pr { J lt.eq b \/ 4 } lt.eq 2^(b \/ 4) bb(E) 2^(- J) = #scale(x: 120%, y: 120%)[\(] 2^(1 \/ 4) 3 \/ 4 #scale(x: 120%, y: 120%)[\)]^b . $
  The inclusion of $Z_t \( B \)$ in the available set and a union bound give $p_(upright("bad")) = 2 \( N + 1 \) theta^b$ as an upper bound for the probability that either available half has fewer than $b \/ 4$ positions. This bound is unconditional in the observed paths.
  Off this event the conditional expected loss is at least $Delta_t \/ 32$. Equations (4.7) and (4.5) give
  $ bb(E) Delta_(t + 1) lt.eq \( 31 \/ 32 \) bb(E) Delta_t + p_(upright("bad")) \/ 32 \, #h(2em) bb(E) Delta_T lt.eq e^(- 8 d) + p_(upright("bad")) . $
  Use Lemma 8 with $Lambda = upright(bold(v))$. For each fixed schedule and $B$, the standard first basis gives $L_0 = I$, so the conditional auxiliary distance equals the distance for $X_T$ on that same complement. Averaging over $B$ proves the bound. ◻
]

=== 9.2 Uniform input tuples after a deterministic first sweep <uniform-input-tuples-after-a-deterministic-first-sweep>

#thm([Lemma 9.2.])[
  (Averaged tuple bound).  #emph[Fix an integer $b gt.eq 2$ dividing $N$, put $m = N \/ b$, and let $t gt.eq d$ be an integer. Let $C$ be a uniformly sampled ordered tuple of $N - m$ distinct input labels, independent of the shuffle, and let $mu_C$ be its time-$t$ physical image law with $C$ fixed. Then 
#[#set math.equation(numbering: n => "(9.2)")
 $ bb(E)_C parallel mu_C - pi_(N - m) parallel_(upright("TV")) lt.eq N^(3 \/ 2) / 2 (\( 1 - 1 \/ \( 4 b \) \)^(t - d) + 2 theta.alt^(N \/ b))^(1 \/ 2) \, #h(2em) theta.alt = 3 / 2 thin 2^(- 3 \/ 4) < 1 . $ <lifts:averaged-bound>]

 The same bound holds for a fixed ordered list of $N - m$ labels when its conditional distance is averaged over a uniformly chosen starting deck.]
] <lifts:averaged-tuples>

#proof[
  Use the direct process with the standard first basis and take $Xi = C$. For a hidden label at index $j$, let $h = N - j + 1 gt.eq m$ be the number of available positions. Fix the complete direction and switch history, but not $C$. At each fixed time, the preceding positions form a uniform ordered sample, so the available set is a uniform $h$-subset. The next-direction hyperplane is fixed under this conditioning.
  If $X$ is the count of a uniform $h$-subset in a fixed half, expand the product of $1 + I_i$ over an ordered sample without replacement. Any specified $ell$ sample indices lie in that half with probability at most $2^(- ell)$. Thus
  #[#set math.equation(numbering: n => "(9.3)")
   $ bb(E) 2^X lt.eq \( 3 \/ 2 \)^h \, #h(2em) Pr { min \( X \, h - X \) < h \/ 4 } lt.eq 2 theta.alt^h . $ <shear:eq:uniform-subset-moment>]
  The second inequality follows by applying Markov’s inequality to the count in each half above $3 h \/ 4$. It is used only after averaging out the input list, not conditional on observed paths.
  On the balanced event, the conditional expected loss is at least $h Delta_s \/ \( 4 N \)$. With $gamma_j = h \/ \( 4 N \)$, the unconditional recurrence and its iteration give
  $ bb(E) Delta_(s + 1) lt.eq \( 1 - gamma_j \) bb(E) Delta_s + 2 gamma_j theta.alt^h \, #h(2em) bb(E) Delta_t lt.eq \( 1 - 1 \/ \( 4 b \) \)^(t - d) + 2 theta.alt^m . $
  Lemma 8, with $Lambda = upright(bold(v))$, bounds the average distance conditional on the full schedule and list. For every fixed schedule the first basis is standard, so the same-list frame equality transfers that distance to $X_t$; the terminal rotation transfers it to the physical shuffle. This proves (9.2). A uniform starting deck sends any fixed ordered label list to a uniform input tuple, which proves the last assertion. ◻
]

#thm([Corollary 9.3.])[
  (Block lengths for the averaged input).  #emph[For $b = 16$, the average distance in Lemma 22 at $t = 513 d$ is at most 
$ epsilon_N = 1 / 2 N^(3 \/ 2) (N^(- 8) + 2 theta.alt^(N \/ 16))^(1 \/ 2) = o \( 1 \) . $

 At $t = 2049 d$ it is at most $N^(- 10)$ for sufficiently large $d$. For $b = 1024$ and $d gt.eq 10$, time $t = \( 1 + 32 b \) d$ gives average distance $o \( 1 \)$.]
] <lifts:tuple-constants>

#proof[
  The respective contracting times are $512 d$, $2048 d$, and $32 b d$, with energy factors at most $e^(- 8 d)$, $e^(- 32 d)$, and $e^(- 8 d)$. Use $e^(- 8 d) lt.eq N^(- 8)$ for the first and $N^(3 \/ 2) e^(- 16 d) = o \( N^(- 10) \)$ for the second. Exponential decay in $N$ handles the other term in each case. ◻
]

There is also a concentration proof of the last assertion that uses the subset martingale in Lemma 16. A union bound over the two halves gives imbalance probability at most $2 e^(- h \/ 32)$. With $c_0 = 1 \/ 32$, the weaker recurrence

#[#set math.equation(numbering: n => "(9.4)")
 $ bb(E) Delta_(s + 1) lt.eq \( 1 - 1 \/ \( 4 b \) \) bb(E) Delta_s + 2 e^(- c_0 N \/ b) $ <lifts:azuma-recurrence>]

gives $bb(E) Delta_t lt.eq e^(- 8 d) + 8 b e^(- c_0 N \/ b)$ at $t = \( 1 + 32 b \) d$. The expected endpoint error of one conditional card law is $o \( 1 \/ N \)$ and its sum is $o \( 1 \)$. This is an alternative proof of the averaged input used later for omitted sets.

=== 9.3 Sampling inputs with a random initial basis <frames:average-section>

To begin contraction before a deterministic first sweep, choose $v_(t + 1)$ uniformly outside the span $W_t$ of the last $min \( t \, d - 1 \)$ directions, with $W_0 = { 0 }$. Use independent fair switches conditional on the complete schedule. Each successive set of at most $d$ directions is independent, so Lemma 4 applies when $T gt.eq d$. Choose a hyperplane $J_t supset.eq W_t$ by a fixed rule based on the direction prefix.

Let $C$ be a uniform ordered list, independent of the joint schedule and process, and take $Xi = C$. The online energy calculation uses only the chronological field (4.1). At terminal time Lemma 8 first bounds

$ bb(E)_(upright(bold(v)) \, C) parallel cal(L) \( Z_T \( C \) divides upright(bold(v)) \, C \) - pi_q parallel_(upright("TV")) . $

For each fixed schedule, the general frame comparison then gives

#[#set math.equation(numbering: n => "(9.5)")
 $ bb(E)_C parallel cal(L) \( Z_T \( C \) divides upright(bold(v)) \, C \) - pi_q parallel_(upright("TV")) = bb(E)_C parallel cal(L) \( X_T \( C \) divides C \) - pi_q parallel_(upright("TV")) . $ <shear:eq:sampled-frame-transfer>]

Here the reference coordinate order is $\( 1 \, dots.h \, d \)$. The map $L_0^(- 1)$ disappears only after averaging $C$. It is determined once the first $d$ directions have been revealed; we use it only in the terminal comparison and do not adjoin it before those defining directions are available.

#thm([Proposition 9.4.])[
  (Averaged tuples with no initial deterministic sweep).  #emph[Let $d gt.eq 3$, $q = 7 N \/ 8$, and $T = 1024 d$. For a uniformly sampled ordered distinct input tuple $C$, independent of $X$, 
#[#set math.equation(numbering: n => "(9.6)")
 $ bb(E)_C parallel cal(L) \( X_T \( C \) divides C \) - pi_q parallel_(upright("TV")) lt.eq frac(q sqrt(N), 2) (e^(- 16 d) + 2 \( N + 1 \) e^(- N \/ 256))^(1 \/ 2) = o \( 1 \) . $ <shear:eq:random-tuple>]

 The corresponding hidden-card energy is $O \( N^(- 20) \)$, uniformly over its index.]
] <shear:prop:random-tuple>

#proof[
  For the hidden label at index $j$, let $h = N - j + 1 gt.eq N \/ 8$. Conditional on the full direction and switch history but not on $C$, its available set is a uniform $h$-subset. For its count in the fixed half $J_t$, choose each point independently with probability $h \/ N$ and condition on selecting exactly $h$ points. That size has probability at least $1 \/ \( N + 1 \)$: it is a mode of the binomial size distribution, as comparison of consecutive probabilities shows. Before conditioning, the half-count has mean $h \/ 2$ and is a sum of $N \/ 2$ independent bounded variables. Lemma 16 gives
  #[#set math.equation(numbering: n => "(9.7)")
   $ Pr { min \( \| D_t^j ∩ J_t \| \, \| D_t^j \\ J_t \| \) < h \/ 4 } lt.eq 2 \( N + 1 \) e^(- h^2 \/ \( 4 N \)) lt.eq beta_N \, #h(2em) beta_N = 2 \( N + 1 \) e^(- N \/ 256) . $ <shear:eq:sample-balance>]
  For $h = N$ the count is deterministic and the bound is automatic.
  The proper-subspace part of Lemma 4.1 gives conditional expected loss at least $h Delta_t \/ \( 8 N \) gt.eq Delta_t \/ 64$ off this event. Hence, from time zero,
  $ bb(E) Delta_(t + 1) lt.eq \( 63 \/ 64 \) bb(E) Delta_t + beta_N \/ 64 \, #h(2em) bb(E) Delta_T lt.eq e^(- T \/ 64) + beta_N = e^(- 16 d) + beta_N = O \( N^(- 20) \) . $
  Apply the terminal tuple lemma with $Lambda = upright(bold(v))$ and then the per-schedule averaged equality (9.5). This proves (9.6). ◻
]

#thm([Lemma 9.5.])[
  (Ordinary random-input marginals).  #emph[Let $d gt.eq 6$, $b = 64$, $q = N \( 1 - 1 \/ b \)$, and $T = 2048 d$. The average, over uniform ordered lists of $q$ distinct input labels, of their time-$T$ physical image-law distance from $pi_q$ is $o \( 1 \)$.]
] <frames:average-law>

#proof[
  Use the random initial basis process above. At a hidden index, the number $h$ of available positions is at least $N \/ b$. Conditional on the complete direction and switch history, and before sampling the list, this set is a uniform $h$-subset. Thus (9.3) bounds its imbalance across the chosen $J_t$ by $2 theta.alt^h$.
  On the balanced event the proper-subspace contraction gives loss at least $Delta_t \/ \( 8 b \)$. Using the weaker additive term $2 theta.alt^(N \/ b)$ in the unconditional recurrence yields
  $ bb(E) Delta_T lt.eq \( 1 - 1 \/ \( 8 b \) \)^T + 2 T theta.alt^(N \/ b) . $
  The terminal tuple comparison and then (9.5) give
  #[#set math.equation(numbering: n => "(9.8)")
   $ bb(E)_(upright(bold(v)) \, C) parallel cal(L) \( Z_T \( C \) divides upright(bold(v)) \, C \) - pi_q parallel_(upright("TV")) & = bb(E)_C parallel cal(L) \( X_T \( C \) divides C \) - pi_q parallel_(upright("TV"))\
 & lt.eq 1 / 2 N^(3 \/ 2) (\( 1 - 1 \/ \( 8 b \) \)^T + 2 T theta.alt^(N \/ b))^(1 \/ 2) . $ <frames:average-tv>]
  Here $\( 1 - 1 \/ \( 8 b \) \)^T lt.eq e^(- 4 d)$, so the right side tends to zero. Since $T$ is a multiple of $d$, $X_T = Y_T$ in the rotating-frame coupling, which proves the physical statement. ◻
]

== 10 Symmetry accumulated between two visits to a coordinate <shear:sec:delayed-symmetry>

Intervening coordinate switches produce a symmetry that can be used at an earlier conditioning time. Between two visits to a coordinate, they make the available set and its conditional mass vector invariant in law under every translation of one coordinate half. This yields an energy-loss bound conditional on the earlier visit: the two half counts are already fixed at that time, while the intervening switches supply the symmetry.

#thm([Lemma 10.1.])[
  (Delayed half-space symmetry).  #emph[Let $V = bb(F)_2^d$, $N = 2^d$, and fix a coordinate $i$. Let $j_1 \, dots.h \, j_(d - 1)$ list all coordinates other than $i$, in any order. Condition on a sigma field $cal(A)$ which specifies a nonempty set $B_0 subset.eq V$ of size $h$ and a probability vector $p_0$ supported on $B_0$. Independently of $cal(A)$, let $S_r$ be independent uniform matching switches in direction $e_(j_r)$, for $1 lt.eq r lt.eq d - 1$. Define $B_r = S_r B_(r - 1)$. On each matching edge, obtain $p_r$ by averaging the two masses when both endpoints belong to $B_(r - 1)$, and by moving the mass with its unique available endpoint when exactly one endpoint belongs to $B_(r - 1)$; it is zero on edges with no available endpoint. Put 
$ a_r \( x \) = p_r \( x \) - h^(- 1) upright(bold(1))_(B_r) \( x \) \, #h(2em) E_r = sum_(x in V) a_r \( x \)^2 \, #h(2em) H_b = { x in V : x_i = b } quad \( b = 0 \, 1 \) . $

 For each $z in V$ with $z_i = 0$, let $T_z x = x + x_i z$. Conditional on $cal(A)$, the terminal pair $\( B_(d - 1) \, a_(d - 1) \)$ has the same law as 
#[#set math.equation(numbering: n => "(10.1)")
 $ #scale(x: 120%, y: 120%)[\(] T_z B_(d - 1) \, med a_(d - 1) compose T_z^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <shear:eq:delayed-symmetry-invariance>]

 The counts $h_b = \| B_r ∩ H_b \|$ are independent of $r$ and are $cal(A)$-measurable. If a further independent fair matching switch in direction $e_i$ produces the energy $E_d$ by the same rule, then 
#[#set math.equation(numbering: n => "(10.2)")
 $ bb(E) \[ E_(d - 1) - E_d divides cal(A) \] gt.eq frac(min \( h_0 \, h_1 \), N) thin bb(E) \[ E_(d - 1) divides cal(A) \] . $ <shear:eq:delayed-symmetry-loss>]

 The statement includes $d = 1$, when the intermediate schedule is empty.]
] <shear:lem:delayed-symmetry>

#proof[
  Fix $z$ with $z_i = 0$, and set
  $ z_0 = 0 \, #h(2em) z_r = sum_(s = 1)^r z_(j_s) e_(j_s) quad \( 1 lt.eq r lt.eq d - 1 \) . $
  Thus $z_(d - 1) = z$. Replace the $r$th switch by
  $ S'_r = T_(z_r) S_r T_(z_(r - 1))^(- 1) . $
  We verify that the replaced switches have exactly the original joint law. For $j eq.not i$, $T_w e_j = e_j$, so conjugation by $T_w$ maps the matching subgroup in direction $e_j$ onto itself. Also
  $ T_(z_r) T_(z_(r - 1))^(- 1) \( x \) = x + x_i z_(j_r) e_(j_r) $
  is a fixed member of that matching subgroup: it either swaps or fixes each pair, since $x_i$ is constant on a coordinate-$j_r$ pair. Therefore $S_r mapsto S'_r$ is a bijection of this subgroup. It depends only on $r$ and $z$, so the $S'_r$ remain independent and uniform conditional on $cal(A)$.
  Run the available-set and mass recursion with these replaced switches, starting from the same $\( B_0 \, p_0 \)$. We claim that at stage $r$ its state is $\( T_(z_r) B_r \, p_r compose T_(z_r)^(- 1) \)$. This holds initially because $T_(z_0)$ is the identity. Conjugation carries the matching edges at the previous stage bijectively to matching edges. An edge with two available endpoints is averaged in either recursion, and a subsequent fixed swap does not change its equal output masses. An edge with one available endpoint carries its mass to the image of that endpoint under the replaced switch. The assertion is immediate on edges with no available endpoint. These three cases prove the induction. Centering by the uniform mass on the available set transforms in the same way. Since the two switch arrays have the same conditional law, the terminal invariance follows.
  Every intermediate switch preserves $x_i$, proving the assertion about the counts. The squared-energy decrease in the final coordinate-$i$ layer is
  $ L \( B \, a \) = 1 / 2 sum_({ x \, y } subset.eq B\
x + y = e_i) \( a \( x \) - a \( y \) \)^2 \, #h(2em) \( B \, a \) = \( B_(d - 1) \, a_(d - 1) \) . $
  Indeed, transport preserves squared norm and averaging two entries decreases it by half the square of their difference. We may average this expression after applying an independent uniform $T_z$, by the conditional invariance already proved. Each pair $x in B ∩ H_0$, $y in B ∩ H_1$ becomes a coordinate-$i$ pair for exactly one of the $N \/ 2$ possible values of $z$. Consequently
  $ bb(E)_z L \( T_z B \, a compose T_z^(- 1) \) = 1 / N sum_(x in B ∩ H_0 \, med y in B ∩ H_1) \( a \( x \) - a \( y \) \)^2 . $
  The entries of $a$ sum to zero. With $A = sum_(x in B ∩ H_0) a \( x \)$, the last double sum equals
  $ h_1 sum_(B ∩ H_0) a \( x \)^2 + h_0 sum_(B ∩ H_1) a \( y \)^2 + 2 A^2 gt.eq min \( h_0 \, h_1 \) E_(d - 1) . $
  Taking conditional expectations proves (10.2). Empty halves give a zero lower bound and require no separate division. When $d = 1$, the same calculation has only $z = 0$ and remains valid. ◻
]

In a hidden-card application, $B_0$ and $p_0$ are the available set and its conditional mass vector at the conditioning time. They are functions of the observed path prefix. Conditioning additionally on all past switches fixes these two functions; it does not redefine $p_0$ as a conditional law given every card position. Future matching coins are still independent and fair, so the lemma applies to the stated transport-and-averaging recursion. If the coordinate schedule is any periodic permutation of the $d$ coordinates, take $cal(A)$ immediately after the previous visit to $i$ and apply the lemma to the intervening $d - 1$ layers. Reversing the coordinate order is included in the same statement.

== 11 Fourier amplification of partial permutation laws <shear:sec:completion>

The marginal estimates now provide two routes to coset information. A bound for every fixed input list applies to each prescribed partition whose complementary lists meet the stated length condition. An averaged input bound first requires the choice of one partition. In either case the Fourier argument uses one common modification of the permutation law whose relevant coset masses are bounded. We first state that modification and the transfer estimates, then apply them to the preceding marginal bounds.

=== 11.1 From complementary marginals to one retained law <from-complementary-marginals-to-one-retained-law>

Let $X$ be a finite label set, $G = "Sym" \( X \)$, and let $M_1 \, dots.h \, M_r$ be a partition of $X$ into nonempty parts. Write $H_i = "Sym" \( M_i \)$ for the subgroup fixing $X \\ M_i$ pointwise. Two label-to-position permutations agree on $X \\ M_i$ exactly when they lie in the same left coset $g H_i$. Thus the complementary image tuple identifies that coset, and its distance from a uniform injection is the distance of the coset law from uniform on $G \/ H_i$. Write $delta_i$ for this distance and put $delta = sum_i delta_i$.

If a marginal estimate averages over omitted sets of size $\| X \| \/ r$, sample a uniform ordered partition into $r$ equal parts. Each part has the required uniform subset law, so the expected sum of its complementary errors is $r$ times the mean single-subset error. Some deterministic partition has a sum no larger than this expectation. The ordering chosen on a complementary set does not affect its error, because changing that ordering permutes the tuple coordinates. Thus an average over uniform ordered input tuples is also the corresponding average over complementary sets.

For the representation estimates, write $rho_lambda$ for the symmetric-group irreducible indexed by $lambda$ and $D_lambda = f^lambda = dim rho_lambda$ for its degree. For $u > 0$, define

$ C_u = sup_(s gt.eq 1) sum_(lambda tack.r s) \( f^lambda \)^(- u) \, #h(2em) Z_u \( s \) = sum_(lambda tack.r s\
lambda in.not { \( s \) \, \( 1^s \) }) \( f^lambda \)^(- u) . $

The exclusions form a set, so the sole partition of $1$ is removed once.

#thm([Proposition 11.1.])[
  (Degree and coset inputs).  #emph[For every fixed $u > 0$, $C_u < oo$ and $Z_u \( s \) arrow.r 0$ as $s arrow.r oo$.]
  #emph[Let $H_1 \, dots.h \, H_r$ be subgroups of a finite group $G$, and let $mu$ be a probability measure. Write $mu_H$ for its image on $G \/ H$. If 
$ delta = sum_(i = 1)^r parallel mu_(H_i) - U_(G \/ H_i) parallel_(upright("TV")) \, $

 there is a measure $0 lt.eq f lt.eq mu$, of mass $z gt.eq 1 - delta$, with 
$ f \( g H_i \) lt.eq \[ G : H_i \]^(- 1) #h(2em) \( g in G \, med 1 lt.eq i lt.eq r \) . $

 It can be obtained by successive trimming of excess coset mass or by taking the pointwise minimum of the separately trimmed measures. When $z > 0$, its normalization is within $1 - z$ of $mu$ in TV and has coset cap $z^(- 1)$ times uniform.]
  #emph[Alternatively, delete the union of all cosets whose original $mu$-mass exceeds twice uniform. The deleted mass is $eta lt.eq 2 delta$. If $delta < 1 \/ 2$, the normalized retained law is exactly $eta$ away from $mu$ in TV and has coset cap $2 \/ \( 1 - eta \)$ times uniform.]
] <shear:prop:fourier-inputs>

#proof[
  The degree assertions follow from [22] Theorem 6.3. The same companion gives separate proofs at powers $1 \, 2 \, 10$ in Lemmas 6.4, A.2, and A.5; these also justify the fixed-power sums used below. The two modifications, including their common-measure and mass claims, follow from [22] Lemma 2.3. The normalization assertion for $f$ follows from Lemma 29 below; dividing the exact cap by $z$ gives the normalized cap. ◻
]

=== 11.2 Fourier bounds for disjoint supports <fourier-bounds-for-disjoint-supports>

For a nonnegative mass function $f$ on $G$, use

$ hat(f) \( rho \) = sum_(g in G) f \( g \) rho \( g \) . $

The Hilbert–Schmidt norm is unnormalized: $parallel A parallel_(upright("HS"))^2 = "tr" \( A^(*) A \)$. The next proposition extends the companion’s partition estimates to disjoint supports that may leave labels unused. The common restriction decomposition has two uses: assigning each product type to one small factor controls the orbit of a vector, while overlapping central projections control the whole Fourier matrix.

#thm([Proposition 11.2.])[
  (Fourier bounds from disjoint coset systems).  #emph[Let $X$ have $N$ elements and $G = "Sym" \( X \)$. Let $M_1 \, dots.h \, M_r$ be disjoint nonempty subsets of $X$, where $r gt.eq 1$, and put $H_i = "Sym" \( M_i \)$, fixing the complement pointwise. Their union need not be $X$. Suppose $f gt.eq 0$ has mass $z lt.eq 1$ and 
$ f \( g H_i \) lt.eq K \[ G : H_i \]^(- 1) #h(2em) \( g in G \, med 1 lt.eq i lt.eq r \) $

 for some $K gt.eq 0$. For an irreducible unitary representation $rho$ of degree $D$, set 
$ S_i \( D \) = sum_(tau in hat(H)_i\
dim tau lt.eq D^(1 \/ r)) \( dim tau \)^2 . $

 For every $u > 0$, the separate orbit and isotypic estimates are 
#[#set math.equation(numbering: n => "(11.1)")
 $ parallel hat(f) \( rho \) parallel_(upright("op")) & lt.eq (frac(z K, D) sum_i S_i \( D \))^(1 \/ 2) lt.eq sqrt(z K r C_u) thin D^(- 1 \/ 2 + \( u + 2 \) \/ \( 2 r \)) \,\
parallel hat(f) \( rho \) parallel_(upright("HS"))^2 & lt.eq frac(z K, D) sum_i S_i \( D \) lt.eq z K r C_u D^(- 1 + \( u + 2 \) \/ r) . $ <shear:eq:noncovering-orbit-general>]

 In particular, when $r > 4$, the inverse-square orbit estimate gives 
#[#set math.equation(numbering: n => "(11.2)")
 $ parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq sqrt(r K C_2) thin D^(- \( 1 - 4 \/ r \) \/ 2) . $ <shear:eq:orbit-bound>]

 A separate coefficient-projection argument gives 
#[#set math.equation(numbering: n => "(11.3)")
 $ parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq K^2 / D sum_(i = 1)^r sum_(tau in hat(H)_i\
dim tau lt.eq D^(1 \/ r)) \( dim tau \)^2 lt.eq K^2 r C_10 D^(- 1 + 12 \/ r) . $ <shear:eq:hs-general>]

 Finally, for $rho = rho_lambda$ with $lambda tack.r N$, put 
$ k_lambda = N - max \( lambda_1 \, lambda'_1 \) \, #h(2em) M \( k \) = sum_(j = 0)^k p \( j \) \, $

 where $p \( j \)$ is the partition number and $p \( 0 \) = 1$. The branching refinement is 
#[#set math.equation(numbering: n => "(11.4)")
 $ parallel hat(f) \( rho_lambda \) parallel_(upright("HS"))^2 lt.eq z K r M \( k_lambda \) D^(- 1 + 2 \/ r) . $ <shear:eq:hs-branching>]

 All these statements allow unequal support sizes and unrestricted restriction multiplicities. In particular they include the probability-law cases $z = 1$.]
] <shear:prop:disjoint-transfer>

#proof[
  Write $A = hat(f) \( rho \)$ and abbreviate $S_i \( D \)$ to $S_i$. If $z = 0$, then $f = 0$ and every assertion is immediate. Assume $z > 0$.
  ===== 11.2.1 The common small-type cover. <the-common-small-type-cover.>
  Disjoint supports embed $H_1 times dots.h.c times H_r$ in $G$: the factors commute, and a product that is identity restricts to the identity on every $M_i$. Complete reducibility and the direct-product description of irreducibles [8] Theorems 3.12 and 4.25 and Proposition 3.14 give
  $ V_rho \|_(H_1 times dots.h.c times H_r) = xor.big_(bold(tau)) \( V_(tau_1) ⊗ dots.h.c ⊗ V_(tau_r) \) ⊗ cal(A)_(bold(tau)) . $
  The sum is over distinct occurring product types, with their full multiplicity spaces. Each has $product_i dim tau_i lt.eq D$, so some factor has degree at most $D^(1 \/ r)$. Unused labels can change the occurring types and their multiplicities, but do not change this product bound.
  Let $P_(i \, tau)$ be the orthogonal projection onto all copies of the $H_i$-type $tau$, and put
  $ P_i = sum_(tau in hat(H)_i\
dim tau lt.eq D^(1 \/ r)) P_(i \, tau) \, #h(2em) Q_i = P_i product_(j < i) \( I - P_j \) . $
  On each product-type summand, $P_i$ is identity or zero according as the $i$th factor is small or large. Hence the $P_i$ commute, and at least one is identity on each summand. Therefore
  #[#set math.equation(numbering: n => "(11.5)")
   $ I prec.curly.eq sum_(i = 1)^r P_i \, #h(2em) sum_(i = 1)^r Q_i = I \, #h(2em) Q_i Q_j = 0 quad \( i eq.not j \) . $ <shear:eq:disjoint-projector-cover>]
  The $Q_i$ assign a whole product type to its first small factor; the $P_i$ may overlap. Both families retain every multiplicity. For every $u > 0$, the definition of $C_u$ gives
  $ S_i lt.eq D^(\( u + 2 \) \/ r) sum_(tau in hat(H)_i) \( dim tau \)^(- u) lt.eq C_u D^(\( u + 2 \) \/ r) . $
  ===== 11.2.2 The orbit estimate. <the-orbit-estimate.>
  For $v in V_rho$, write $v_i = Q_i v$ and $W_i = "span" { rho \( h \) v_i : h in H_i }$. The single-vector orbit lemma [22] Lemma 3.1 gives $dim W_i lt.eq S_i$. Indeed, in all copies of a type $tau$, the orbit of its component is contained in the image of
  $ "End" \( V_tau \) arrow.r V_tau ⊗ cal(A)_tau \, #h(2em) T mapsto \( T ⊗ I \) v_(i \, tau) \, $
  whose dimension is at most $\( dim tau \)^2$, independently of the multiplicity.
  Let $Pi_i$ project onto $W_i$. Since $W_i$ is $H_i$-invariant, the projection onto $rho \( g \) W_i$ depends only on $g H_i$. The coset cap and Schur averaging yield
  $ sum_g f \( g \) parallel Pi_(rho \( g \) W_i) w parallel^2 lt.eq K frac(dim W_i, D) parallel w parallel^2 . $
  Here the uniform average of $rho \( g \) Pi_i rho \( g \)^(*)$ is $\( dim W_i \/ D \) I$, by its trace and irreducibility. Weighted Cauchy–Schwarz retains the mass $z$:
  $ \| chevron.l w \, A v_i chevron.r \|^2 lt.eq z parallel v_i parallel^2 sum_g f \( g \) parallel Pi_(rho \( g \) W_i) w parallel^2 lt.eq frac(z K S_i, D) parallel w parallel^2 parallel v_i parallel^2 . $
  The $v_i$ are orthogonal. Summing and applying Cauchy–Schwarz over $i$ gives
  $ \| chevron.l w \, A v chevron.r \| lt.eq (frac(z K, D) sum_i S_i)^(1 \/ 2) parallel w parallel parallel v parallel . $
  This proves (11.1). Its specialization $u = 2$, with $z lt.eq 1$, is (11.2); the condition $r > 4$ makes that dimension exponent negative.
  ===== 11.2.3 The isotypic estimate. <the-isotypic-estimate.>
  For a subgroup $H lt.eq G$ and an irreducible $H$-type $tau$ of degree $a$, define
  $ e_(H \, tau) \( h \) = frac(a, \| H \|) overline(chi_tau \( h \)) quad \( h in H \) \, #h(2em) e_(H \, tau) = 0 quad upright("off ") H . $
  Its transform is the projection $P_(sigma \, H \, tau)$ onto all copies of $tau$ in $sigma \|_H$. Thus $accent(f * e_(H \, tau), ̂) \( sigma \) = hat(f) \( sigma \) P_(sigma \, H \, tau)$: a bound on the left cosets $g H$ controls a projection on the right of the Fourier matrix. The companion’s cosetwise isotypic lemma [22] Lemma 3.4 applies to every subgroup $H$. If $f \( g H \) lt.eq K \[ G : H \]^(- 1)$, it gives
  #[#set math.equation(numbering: n => "(11.6)")
   $ sum_(sigma in hat(G)) D_sigma parallel hat(f) \( sigma \) P_(sigma \, H \, tau) parallel_(upright("HS"))^2 = \| G \| sum_g \| \( f * e_(H \, tau) \) \( g \) \|^2 lt.eq K z a^2 . $ <shear:eq:noncovering-central>]
  This is the central-projection step; it retains the whole projected Fourier matrix and the mass factor.
  Trace the first inequality of (11.5) against $A^(*) A$, and apply (11.6) to each selected $H_i$-type after discarding the other ambient irreducibles. Then
  $ D parallel A parallel_(upright("HS"))^2 lt.eq D sum_i sum_(dim tau lt.eq D^(1 \/ r)) "tr" \( A^(*) A P_(i \, tau) \) = D sum_i sum_(dim tau lt.eq D^(1 \/ r)) parallel A P_(i \, tau) parallel_(upright("HS"))^2 lt.eq K z sum_i S_i . $
  The trace inequality uses positivity of $A \( sum_i P_i - I \) A^(*)$; it does not require $A^(*) A$ to commute with the projections. This proves (11.1) using the overlapping $P_i$, rather than the orbit assignment $Q_i$.
  ===== 11.2.4 The coefficient alternative. <the-coefficient-alternative.>
  The independent coefficient calculation in [22] Lemma 4.3 bounds each coset separately. Its norm and orientation give the selected-type refinement in (11.3). For one subgroup $H lt.eq G$, put $F = \| G \| f$, so $bb(E)_(h tilde.op U_H) F \( x h \) = \[ G : H \] f \( x H \) lt.eq K$. For an $H$-type $tau$ of degree $a$, choose one representative $x$ of each coset and set
  $ T_x = bb(E)_(h tilde.op U_H) F \( x h \) tau \( h \) \, #h(2em) q \( x h \) = a sum_(j \, ell = 1)^a \( T_x \)_(j ell) overline(tau \( h \)_(j ell)) . $
  The function $q$ on this coset is the orthogonal projection of $F$ onto the conjugate coefficient space of $tau$. Schur orthogonality and the nonnegative weights $F \( x h \)$ give
  #[#set math.equation(numbering: n => "(11.7)")
   $ bb(E)_(h tilde.op U_H) \| q \( x h \) \|^2 = a parallel T_x parallel_(upright("HS"))^2 lt.eq a^2 parallel T_x parallel_(upright("op"))^2 lt.eq a^2 #scale(x: 120%, y: 120%)[\(] bb(E)_(h tilde.op U_H) F \( x h \) #scale(x: 120%, y: 120%)[\)]^2 lt.eq K^2 a^2 . $ <shear:eq:coset-coefficient-norm>]
  Expanding $T_x$ and using, for $h \, k in H$, $overline(chi_tau \( k^(- 1) h \)) = chi_tau \( k h^(- 1) \)$ shows that these coset projections form the single function $q = \| G \| \( f * e_(H \, tau) \)$. Thus their tested Fourier matrix is $hat(f) \( sigma \) P_(sigma \, H \, tau)$, with the same right-hand orientation as above. Averaging the preceding norm bound over cosets and applying complex finite-group Plancherel gives
  #[#set math.equation(numbering: n => "(11.8)")
   $ sum_(sigma in hat(G)) D_sigma parallel hat(f) \( sigma \) P_(sigma \, H \, tau) parallel_(upright("HS"))^2 = bb(E)_(g tilde.op U_G) \| q \( g \) \|^2 lt.eq K^2 a^2 . $ <shear:eq:coefficient-one-type>]
  The calculation counts a type once, regardless of its multiplicity, and assumes no pointwise bound inside the coset. The same positive trace comparison now gives $parallel A parallel_(upright("HS"))^2 lt.eq K^2 D^(- 1) sum_i S_i$. Using $S_i lt.eq C_10 D^(12 \/ r)$ proves (11.3), including its original sum over the types of the unmodified subgroups $H_i$.
  ===== 11.2.5 The branching refinement. <the-branching-refinement.>
  Each $H_i$ is conjugate to the standard subgroup $S_(\| M_i \|)$ of $S_N$. Young branching [11] Theorem 9.2 shows that every occurring type $tau tack.r \| M_i \|$ is a subdiagram of $lambda$; different corner-removal sequences can give arbitrary multiplicity. If $lambda_1 gt.eq lambda'_1$, the diagram $tau$ has at most $k_lambda$ boxes below its first row. Its lower diagram, together with its fixed size, determines the first row, so at most $M \( k_lambda \)$ distinct types can occur. If $lambda'_1 > lambda_1$, transpose both diagrams for this count. Transposition preserves degrees and does not replace $f$ or its Fourier matrix by a sign-twisted law.
  Nonoccurring isotypic projections are zero. In the positive trace comparison, apply (11.6) only to the occurring selected types and use $\( dim tau \)^2 lt.eq D^(2 \/ r)$. There are at most $M \( k_lambda \)$ of them for each support, giving (11.4). The same argument includes $k_lambda = 0$, where the representation is trivial or sign, $D = 1$, and $M \( 0 \) = 1$. It also includes all unequal nonempty supports and every restriction multiplicity. ◻
]

The isotypic estimate has the same dimension exponent as the squared orbit estimate, but bounds the whole Hilbert–Schmidt norm. The coefficient estimate records a different proof of a bound with cap factor $K^2$. The branching estimate counts only types that can occur in a fixed ambient diagram. These methods use only coset masses; none requires a pointwise bound on the conditional distribution inside a coset.

=== 11.3 Normalization and independent time blocks <normalization-and-independent-time-blocks>

We record the mass normalization once for all the applications. The Fourier and sign conventions are those of the completed local proof.

#thm([Lemma 11.3.])[
  (Fourier normalization for retained mass).  #emph[For a complex mass function $a$ on a finite group $G$, 
#[#set math.equation(numbering: n => "(11.9)")
 $ sum_rho D_rho parallel hat(a) \( rho \) parallel_(upright("HS"))^2 = \| G \| sum_g \| a \( g \) \|^2 . $ <shear:eq:plancherel-mass>]

 If $xi gt.eq 0$ has mass $m lt.eq 1$, its transform is not divided by $m$, and 
#[#set math.equation(numbering: n => "(11.10)")
 $ \| G \| sum_g lr(|xi \( g \) - frac(m, \| G \|)|)^2 & = sum_(rho eq.not upright("triv")) D_rho parallel hat(xi) \( rho \) parallel_(upright("HS"))^2 \,\
(sum_g \| xi \( g \) - U_G \( g \) \|)^2 & lt.eq \( 1 - m \)^2 + sum_(rho eq.not upright("triv")) D_rho parallel hat(xi) \( rho \) parallel_(upright("HS"))^2 . $ <eq:subprobability-centered>]

 If $xi lt.eq mu$ for a probability measure $mu$, then $sum_g \| mu \( g \) - xi \( g \) \| = 1 - m$. When $m > 0$, $parallel xi \/ m - mu parallel_(upright("TV")) lt.eq 1 - m$.]
] <lem:subprobability-fourier>

#proof[
  The regular-character expansion in Lemma 14, with coefficients $a \( g \) overline(a \( h \))$, proves (11.9). Apply it to $xi - m U_G$ and $xi - U_G$. Their trivial coefficients are respectively $0$ and $m - 1$, and their nontrivial coefficients are those of $xi$. Cauchy–Schwarz gives (11.10). If $xi lt.eq mu$, the nonnegative difference has mass $1 - m$. Also $sum_g \| xi \( g \) \/ m - xi \( g \) \| = 1 - m$; the triangle inequality and the factor $1 \/ 2$ in TV prove the normalization claim. ◻
]

For a subprobability $f$ of mass $z$ and a positive integer $ell$, the same identity and the convolution rule give

#[#set math.equation(numbering: n => "(11.11)")
 $ \| G \| sum_g \| f^(* ell) \( g \) - \| G \|^(- 1) \|^2 = \( z^ell - 1 \)^2 + sum_(rho eq.not upright("triv")) D_rho parallel hat(f) \( rho \)^ell parallel_(upright("HS"))^2 . $ <shear:eq:subprob-plancherel>]

One half of the square root bounds one half of the $ell^1$ distance from $f^(* ell)$ to $U_G$; for a probability this is TV. The matrix bounds used below are

$ parallel A^ell parallel_(upright("HS")) lt.eq sqrt(D) thin parallel A parallel_(upright("op"))^ell \, #h(2em) parallel A^ell parallel_(upright("HS")) lt.eq parallel A parallel_(upright("HS"))^ell . $

They require no normality assumption.

For every positive-time physical block law $mu$, Lemma 15 gives $hat(mu) \( "sgn" \) = 0$. If a probability $nu$ is within $eta$ of $mu$ in TV, then

#[#set math.equation(numbering: n => "(11.12)")
 $ \| hat(nu) \( "sgn" \) \| lt.eq 2 eta . $ <shear:eq:parity>]

If instead $0 lt.eq f lt.eq mu$ has mass $z$, then $\| hat(f) \( "sgn" \) \| lt.eq 1 - z$. Positivity also gives $f^(* ell) lt.eq mu^(* ell)$, with missing mass $1 - z^ell$. For nearby probabilities, replacing the $ell$ factors one at a time costs at most $ell eta$ in TV.

Every block length below is a multiple of $d$. Thus $R^T = I$ in (3.1), and the coordinate block $cal(L) \( X_T \)$ is exactly the physical law $q_d^(* T)$. Independent time blocks combine by convolution.

#thm([Corollary 11.4.])[
  (Two time blocks from the isotypic transfer).  #emph[For the Thorp shuffle on $N = 2^d$ cards, 
$ parallel q_d^(* \( 512 d \)) - U_G parallel_(upright("TV")) arrow.r 0 #h(2em) \( d arrow.r oo \) . $

 The convergence is uniform over deterministic initial orderings.]
] <shear:cor:512>

#proof[
  Let $T = 256 d$ and $mu = q_d^(* T)$. For $d gt.eq 3$, partition the labels into eight sets $M_i$ of size $N \/ 8$. The fixed-list estimate (8.5) bounds each complementary image-tuple error by
  $ delta_N = N^(3 \/ 2) / 2 (\( 31 \/ 32 \)^(255 d) + 64 e^(- N \/ 64))^(1 \/ 2) = o \( 1 \) . $
  Exact trimming by Proposition 27 gives $0 lt.eq f lt.eq mu$ with mass $z$, where $1 - z lt.eq 8 delta_N = o \( 1 \)$, and cap one on all eight coset systems.
  For this covering partition, the companion isotypic estimate [22] Proposition 3.5, with inverse-degree parameter $1$, gives $parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq 8 z C_1 D^(- 5 \/ 8) lt.eq 8 C_1 D^(- 5 \/ 8)$. Consequently
  $ sum_(lambda tack.r N\
lambda in.not { \( N \) \, \( 1^N \) }) D_lambda parallel hat(f) \( rho_lambda \)^2 parallel_(upright("HS"))^2 lt.eq \( 8 C_1 \)^2 Z_(1 \/ 4) \( N \) = o \( 1 \) \, $
  since $1 - 2 \( 5 \/ 8 \) = - 1 \/ 4$ and [22] Theorem 6.3 gives the inverse-quarter limit. The sign coefficient of $f$ is at most $1 - z$ in magnitude, and the trivial coefficient of $f^(* 2)$ is $z^2$. Lemma 29 therefore gives
  $ (sum_g \| f^(* 2) \( g \) - U_G \( g \) \|)^2 lt.eq \( 1 - z^2 \)^2 + \( 1 - z \)^4 + \( 8 C_1 \)^2 Z_(1 \/ 4) \( N \) = o \( 1 \) . $
  Adding back the missing mass $1 - z^2 = o \( 1 \)$ proves $parallel mu^(* 2) - U_G parallel_(upright("TV")) = o \( 1 \)$. The two physical blocks take $2 T = 512 d$ shuffles, and (2.2) gives uniformity over starts. ◻
]

The orbit, coefficient, and branching estimates give the following separate applications, with different modifications of the law.

#thm([Theorem 11.5.])[
  (Eight time blocks from the orbit estimate).  #emph[For the physical shuffle on $N = 2^d$ labeled cards, 
#[#set math.equation(numbering: n => "(11.13)")
 $ parallel q_d^(* \( 2048 d \)) - U_G parallel_(upright("TV")) = o \( 1 \) . $ <shear:eq:2048>]

 The fixed-list estimate at $257 d$ also gives a proof using eight time blocks at $2056 d$ with a retained subprobability. The random omitted set estimate gives another proof at $2056 d$ using normalized deletion. All three conclusions hold for every deterministic starting deck.]
] <shear:thm:2048>

#proof[
  For $T = 256 d$, let $mu = q_d^(* T)$ and use eight equal label parts. The error $delta_N$ in the preceding proof bounds each complementary marginal. Deleting heavy cosets loses $eta lt.eq 16 delta_N = o \( 1 \)$ and produces a probability $nu$ with cap $K lt.eq 4$ for large $d$. Equation (11.2) with $r = 8$ gives
  $ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq C D^(- 1 \/ 4) \, #h(2em) C = sqrt(32 C_2) . $
  For eight factors the nonsign, nontrivial Plancherel contribution is at most
  $ C^16 sum_(lambda tack.r N\
lambda in.not { \( N \) \, \( 1^N \) }) D_lambda^(thin 2 - 16 \/ 4) = C^16 Z_2 \( N \) = o \( 1 \) . $
  The sign contribution is at most $\( 2 eta \)^16$, and the trivial coefficient is one. Thus $nu^(* 8)$ tends to uniform in TV. Restoring the true factors costs at most $8 eta = o \( 1 \)$, and $8 T = 2048 d$ physical shuffles.
  For the fixed-list subprobability route take $T = 257 d$. Equation (8.5) makes the summed error on any partition into eight equal parts $o \( 1 \)$. Exact trimming gives $f lt.eq mu = q_d^(* T)$ of mass $z = 1 - o \( 1 \)$ and cap one. The orbit bound is $parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq sqrt(8 C_2) D^(- 1 \/ 4)$. In (11.11), the trivial term is $\( z^8 - 1 \)^2$, the sign term is at most $\( 1 - z \)^16$, and the remaining sum is at most $\( 8 C_2 \)^8 Z_2 \( N \)$. These terms and the restored mass $1 - z^8$ all vanish. The eight time blocks take $2056 d$ physical shuffles.
  For the random omitted set route, Proposition 21 and the partition averaging above give a partition into eight equal parts with summed error $o \( 1 \)$ at $T = 257 d$. Heavy-coset deletion loses $eta = o \( 1 \)$ and gives cap $K = 2 \/ \( 1 - eta \)$. The orbit bound is $sqrt(16 C_2 \/ \( 1 - eta \)) D^(- 1 \/ 4)$. The eight-factor nonsign sum is at most $\[ 16 C_2 \/ \( 1 - eta \) \]^8 Z_2 \( N \) = o \( 1 \)$, the sign term is at most $\( 2 eta \)^16$, and restoring the true factors costs $8 eta = o \( 1 \)$. Again $8 T = 2056 d$. Equation (2.2) handles every start. ◻
]

#thm([Proposition 11.6.])[
  (Sixteen time blocks from averaged input lists).  #emph[Let $d gt.eq 6$, $b = 64$, $q = N \( 1 - 1 \/ b \)$, $T = 2048 d$, and $mu_T = q_d^(* T)$. The average over uniform ordered lists of $q$ distinct input labels of the total-variation distance of their outputs from a uniform injection is $o \( 1 \)$. There is a subprobability $f lt.eq mu_T$ of mass $1 - o \( 1 \)$ and a partition into 64 equal parts for which every complementary marginal of $f$ is bounded above by the corresponding uniform marginal. Consequently, 
$ parallel q_d^(* \( 32768 d \)) - U_G parallel_(upright("TV")) = o \( 1 \) . $

 The full-deck conclusion holds for every deterministic starting deck.]
] <frames:average-marginals>

#proof[
  The ordinary marginal assertion is Lemma 25, specifically (9.8). The partition averaging above selects 64 equal parts whose complementary errors sum to $o \( 1 \)$. Exact trimming by Proposition 27 gives $0 lt.eq f lt.eq mu_T$, of mass $z = 1 - o \( 1 \)$, with cap one for all 64 coset systems. This is the stated domination of the complementary marginals.
  Use the direct inverse-tenth input cited in Proposition 27 and the orbit estimate (11.1) with $r = 64$, $u = 10$, and $z lt.eq 1$. It gives
  $ parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq sqrt(64 C_10) D^(- 13 \/ 32) \, #h(2em) - 1 / 2 + 12 / 128 = - 13 / 32 . $
  At sixteen factors the nonsign, nontrivial Plancherel sum is at most
  $ \( 64 C_10 \)^16 sum_(lambda tack.r N\
lambda in.not { \( N \) \, \( 1^N \) }) D_lambda^(thin 2 - 32 \( 13 \/ 32 \)) lt.eq \( 64 C_10 \)^16 Z_10 \( N \) = o \( 1 \) \, $
  because the displayed exponent is $- 11$. The sign contribution is at most $\( 1 - z \)^32$, and the trivial term is $\( z^16 - 1 \)^2$. Equation (11.11) and restoration of the missing mass $1 - z^16 = o \( 1 \)$ prove convergence for $mu_T^(* 16)$. The block length $T = 2048 d$ is a multiple of $d$, so these are $16 T = 32768 d$ physical shuffles. Equation (2.2) gives the assertion from every deterministic start. ◻
]

#thm([Theorem 11.7.])[
  (Thirty-two time blocks from coefficient projection).  #emph[The fixed-list marginal bound at $T = 2049 d$ has a separate Hilbert–Schmidt amplification proving 
$ parallel q_d^(* \( 65568 d \)) - U_G parallel_(upright("TV")) = o \( 1 \) . $

]
] <shear:thm:32-block>

#proof[
  Use 32 equal label parts. Equation (8.5) makes all complementary errors $o \( 1 \)$. Exact trimming gives $f lt.eq mu = q_d^(* T)$ of mass $z = 1 - o \( 1 \)$. Its normalization $nu = f \/ z$ is within $1 - z$ of $mu$ in TV and has cap at most two for large $d$. The coefficient estimate (11.3), with $r = 32$ and $K = 2$, gives
  $ parallel hat(nu) \( rho \) parallel_(upright("HS"))^2 lt.eq C' D^(- 5 \/ 8) \, #h(2em) C' = 128 C_10 . $
  For 32 factors the nonsign, nontrivial Plancherel sum is at most
  $ \( C' \)^32 sum_(lambda tack.r N\
lambda in.not { \( N \) \, \( 1^N \) }) D_lambda^(- 19) lt.eq \( C' \)^32 Z_10 \( N \) = o \( 1 \) . $
  The sign term is at most $\[ 2 \( 1 - z \) \]^64$, and the trivial coefficient is one. Restoring the true factors costs $32 \( 1 - z \) = o \( 1 \)$. The physical time is $32 T = 32 \( 2049 d \) = 65568 d$; translation invariance gives the same conclusion from every deterministic start. ◻
]

For the last application we use the companion’s eventual type-count bound. For every fixed integer $r gt.eq 1$, uniformly over $lambda tack.r N$ with $k_lambda gt.eq 1$, all sufficiently large $N$ satisfy

#[#set math.equation(numbering: n => "(11.14)")
 $ 4 r M \( k_lambda \) lt.eq D_lambda^(1 \/ 4) . $ <shear:eq:type-absorption>]

This is [22] Lemma 6.5.

#thm([Theorem 11.8.])[
  (Four time blocks from the branching estimate).  #emph[The averaged-input estimate of Proposition 24 has an amplification proving 
$ parallel q_d^(* \( 4096 d \)) - U_G parallel_(upright("TV")) = o \( 1 \) . $

]
] <shear:thm:4096>

#proof[
  At $T = 1024 d$, choose eight equal label parts whose summed complementary error is $o \( 1 \)$. Heavy-coset deletion produces a probability $nu$ within $eta = o \( 1 \)$ of $mu = q_d^(* T)$, with cap at most four. For every $lambda in.not { \( N \) \, \( 1^N \) }$, the branching estimate and (11.14), with $r = 8$, give
  $ parallel hat(nu) \( rho_lambda \) parallel_(upright("HS"))^2 lt.eq 4 r M \( k_lambda \) D_lambda^(- 1 + 2 \/ r) lt.eq D_lambda^(- 1 \/ 2) . $
  Four factors therefore leave the inverse-first Plancherel sum:
  $ 4 parallel nu^(* 4) - U_G parallel_(upright("TV"))^2 lt.eq \( 2 eta \)^8 + sum_(lambda tack.r N\
k_lambda gt.eq 1) D_lambda^(- 1) = \( 2 eta \)^8 + Z_1 \( N \) = o \( 1 \) . $
  The displayed sign term uses (11.12); the trivial coefficient is one. Restoring the four true factors costs $4 eta = o \( 1 \)$. Their physical time is $4 T = 4096 d$, and (2.2) gives the same conclusion from every start. ◻
]

#thm([Corollary 11.9.])[
  (Mixing order and lower estimates).  #emph[For all sufficiently large $d$, 
$ d < t_(upright("mix")) \( d \) lt.eq 512 d . $

 Thus the mixing time has order $Theta \( d \)$ in physical shuffles. The one-card support bound also gives $t_(upright("mix")) \( d \) gt.eq d$ for every $d gt.eq 1$.]
] <shear:cor:order>

#proof[
  Lemma 2 gives distance at least $1 - \( e \/ sqrt(N) \)^N > 1 \/ 4$ for every integer $t lt.eq d$ when $d$ is large. Lemma 3 gives the stated one-card bound for every $d$. The upper bound follows from Corollary 30; (2.5) gives the sharper lower asymptotic $2 d - O \( 1 \)$. ◻
]

== 12 History events and conditional estimates <frames:chapter>

The preceding sections obtained marginal estimates both for every fixed input list and after averaging the list. We now retain information about trajectory histories before passing to endpoint laws. For a fixed partition and fixed orders on its complements, one event gives pointwise coset caps after its energy constraints are removed in descending order. A stopped estimate for a fixed list charges imbalance only once across the list. A third construction gives an entropy comparison for every probability law supported on one common event of cyclic histories.

The frame comparison, the balance estimate, and the retained conclusion play separate roles in these arguments. In particular, the deferred shear frame used in the final application preserves the distance for each fixed input list; that application averages the labels to obtain simultaneous balance across affine half-spaces. We give the three history constructions and their full-deck consequences first, then return to that averaged application.

Throughout this section $n = 2^d$, $V = bb(F)_2^d$, and $G = "Sym" \( V \)$. Permutations send input positions to output positions and multiply by composition. Write $U_G$ for uniform measure. For $v eq.not 0$, retain the matching subgroup $C_v$: it consists of the permutations preserving every pair ${ x \, x + v }$ setwise. A uniform element of $C_v$ is a layer of independent fair switches. Removing the accumulated coordinate rotation from the physical shuffle gives the cyclic directions $w_t = e_(1 + \( \( t - 1 \) med mod med d \))$. In particular a block of length divisible by $d$ has exactly the same endpoint permutation in these coordinates as in physical coordinates.

#prodef([Remark 12.1.])[
  Every upper bound in this section is paired with the support estimate of Lemma 2: there are at most $2^(t n \/ 2)$ outcomes after $t$ physical shuffles, so distance from uniform is at least $1 - 2^(t n \/ 2) \/ n !$. For integer $t lt.eq d$ this tends uniformly to one. Consequently each upper bound below has order $d$, and the mixing time at threshold $1 \/ 4$ is at least $d$ for sufficiently large $d$.
] <frames:lower-import>

=== 12.1 Preserving the matching of labels <frames:invariance-section>

#thm([Lemma 12.2.])[
  (Matching and input-list invariance).  #emph[Fix an integer $T gt.eq d$ and directions $v_1 \, dots.h \, v_T$ such that every consecutive $d$ form a basis. There are invertible linear maps $L_0 \, dots.h \, L_T$ with $L_0 e_i = v_i$ for $1 lt.eq i lt.eq d$ such that, if $g_t$ is the cyclic-layer process, then $L_t g_t L_0^(- 1)$ is the independent switch process with directions $v_t$. This assertion is an equality in law conditional on the entire fixed sequence. If $L_0 = I$, the matching on trajectory labels before each switch is unchanged. For general $L_0$, the same statement holds after relabeling the initial labels by $L_0$. Consequently the average, over uniform ordered input lists of any fixed length, of the endpoint distance to a uniform injection is unchanged.]
] <frames:matching-invariance>

#proof[
  Lemma 3.1 gives exactly the asserted path-law identity, with $L_0 e_i = v_i$. Its construction applies to every fixed schedule with consecutive basis windows and permits an arbitrary initial basis. It remains to check what happens to trajectory labels.
  If labels $a \, b$ are paired in the cyclic process just before layer $t$, then $g_(t - 1) \( b \) = g_(t - 1) \( a \) + w_t$. The column identity in that frame construction is $L_(t - 1) w_t = v_t$. Hence their transformed positions, with initial labels changed by $L_0$, differ by $v_t$ and are paired in the transformed process. The implication reverses because $L_(t - 1)$ is invertible. When $L_0 = I$, the labels themselves do not change. For general $L_0$, its bijection preserves the uniform law of the input list. The terminal bijection $L_T$ preserves uniform injections and total variation. This proves both assertions. ◻
]

The maps $L_t$ may depend on future directions. We use them only after fixing the complete schedule. In the probabilistic calculations below, the conditional switch law given that schedule is the product of the uniform matching laws. We reveal directions chronologically and average them only in the prefix fields specified below.

#thm([Lemma 12.3.])[
  (Conditional mass on unobserved positions).  #emph[Fix an integer $T gt.eq 1$ and nonzero directions $v_1 \, dots.h \, v_T$. Let $Z_0 = I$ and $Z_t = xi_t Z_(t - 1)$, where the $xi_t$ are independent uniform switches in directions $v_t$. Fix complete feasible trajectories of some observed labels. If $m gt.eq 1$ labels remain unobserved, let $F_t$ be the positions not occupied by the observed labels at time $t$. For a specified unobserved label, let $p_t$ be its conditional position law given those complete observed trajectories.]
  #emph[The vector $p_t$ evolves from its initial point mass by averaging on pairs with two positions in $F_(t - 1)$ and deterministic transport on pairs with one such position. It depends only on the directions and observed paths through time $t$. The uniform vector $1 \/ m$ is transported to the uniform vector on $F_t$. Thus, with $E_t = sum_(x in F_t) \( p_t \( x \) - 1 \/ m \)^2$, one has $0 lt.eq E_t lt.eq 1$ and 
#[#set math.equation(numbering: n => "(12.1)")
 $ E_(t - 1) - E_t = 1 / 2 sum_({ x \, y } subset F_(t - 1) upright(" paired at ") t) \( p_(t - 1) \( x \) - p_(t - 1) \( y \) \)^2 . $ <frames:hole-loss>]

]
] <frames:holes>

#proof[
  The online averaging and transport rules are those of Lemma 4.1; here we must also justify conditioning on complete observed paths. A feasible specification of those paths prescribes precisely the coins on the visited time-edge pairs. Necessity is immediate. Conversely, those prescribed coins force the paths, by induction over the layers. The path event is therefore a cylinder in the independent coin array. All other coins remain independent and fair, including unvisited coins at earlier times.
  On an edge used by an observed label the coin is fixed; on an edge with two unobserved positions it remains fair. Future path constraints use later time-edge pairs and do not alter this earlier recursion. Thus the conditional vector equals the same forward averaging and transport flow obtained from the observed prefix. Applying the exact decrement in Lemma 4.1, with its available set equal to $F_(t - 1)$, proves the displayed identity and transports the uniform comparison vector as stated. ◻
]

The next consequence records the two conditioning fields used below. The complete field is convenient for endpoint comparisons; the smaller field is the one in which the next direction is averaged.

#thm([Corollary 12.4.])[
  (Complete and chronological conditioning).  #emph[Fix integers $T gt.eq 1$ and $1 lt.eq q lt.eq n$. Let $upright(bold(v)) = \( v_1 \, dots.h \, v_T \)$ be a random schedule of nonzero directions. Set $Z_0 = I$, and suppose that, conditional on $upright(bold(v))$, the increments of $Z$ are independent uniform switches in directions $v_1 \, dots.h \, v_T$. Let $C = \( c_1 \, dots.h \, c_q \)$ be a deterministic list of distinct labels, or a random such list independent of the joint process $\( upright(bold(v)) \, \( Z_t \)_(t = 0)^T \)$. For $1 lt.eq j lt.eq q$, put 
#[#set math.equation(numbering: n => "(12.2)")
 $ cal(F)_t^(C \, j) & = sigma #scale(x: 120%, y: 120%)[\(] C \, v_1 \, dots.h \, v_t \, thin Z_s \( c_i \) : 0 lt.eq s lt.eq t \, med i < j #scale(x: 120%, y: 120%)[\)] \,\
cal(H)^(C \, j) & = sigma #scale(x: 120%, y: 120%)[\(] C \, upright(bold(v)) \, thin Z_s \( c_i \) : 0 lt.eq s lt.eq T \, med i < j #scale(x: 120%, y: 120%)[\)] . $ <frames:online-field>]

 For $0 lt.eq t lt.eq T$, define $p_t \( x \) = Pr { Z_t \( c_j \) = x divides cal(F)_t^(C \, j) }$. Then, for every $x in V$, 
#[#set math.equation(numbering: n => "(12.3)")
 $ Pr { Z_t \( c_j \) = x divides cal(H)^(C \, j) } = p_t \( x \) quad upright("almost surely") . $ <frames:full-path-prefix>]

 For $t < T$, let $K_t \( v \) = Pr { v_(t + 1) = v divides v_1 \, dots.h \, v_t }$. Then 
#[#set math.equation(numbering: n => "(12.4)")
 $ Pr { Z_t \( c_j \) = x \, med v_(t + 1) = v divides cal(F)_t^(C \, j) } = p_t \( x \) K_t \( v \) . $ <frames:direction-factorization>]

]
] <frames:conditional-interface>

#proof[
  First fix the list, the complete schedule, and feasible complete trajectories of the preceding labels. Lemma 38 identifies the conditional mass on the left of (12.3) with the forward mass computed from the list, the direction prefix, and the observed path prefix through $t$. It is therefore already $cal(F)_t^(C \, j)$-measurable. The tower property, using $cal(F)_t^(C \, j) subset.eq cal(H)^(C \, j)$, proves (12.3).
  Conditional on the complete schedule, the observed path prefix depends only on the direction prefix, by the product-switch hypothesis. Since the list is independent, its observation and that of the preceding paths do not change the next-direction law $K_t$. Also, the field generated by $cal(F)_t^(C \, j)$ and $v_(t + 1)$ is contained in $cal(H)^(C \, j)$. Taking the tower of (12.3) to this intermediate field shows that the hidden mass remains $p_t$ after $v_(t + 1)$ is revealed. Combining these two statements proves (12.4). ◻
]

In the shear construction the auxiliary data $Lambda$ determine $upright(bold(v))$ but may contain additional entries. Suppose, as in Lemma 19, that the conditional law of the full virtual trajectory given $Lambda$ depends on $Lambda$ only through $upright(bold(v))$, and that a sampled list is independent of $\( Lambda \, \( Z_t \)_(t = 0)^T \)$. Conditional independence, followed by conditioning on the observed paths, gives

#[#set math.equation(numbering: n => "(12.5)")
 $ Pr { Z_t \( c_j \) = x divides cal(H)^(C \, j) or sigma \( Lambda \) } = p_t \( x \) . $ <frames:terminal-disclosure>]

The averaging in (12.4) is performed in $cal(F)_t^(C \, j)$ before this terminal disclosure. Once $Lambda$ is revealed at time $T$, the direction averaging is finished. The separate conditional frame identity then identifies the mapped endpoint law with the original coordinate chain.

#thm([Lemma 12.5.])[
  (Fresh-direction contraction).  #emph[Suppose, given the generated past, the next direction is uniform outside a hyperplane $J subset V$. Split the $m$ unobserved positions into the two cosets, denoting the resulting sets by $F_0 \, F_1$ and their sizes by $m_0 \, m_1$. For any centered real mass vector $z$ known from that past, the expected squared-norm loss obtained by averaging on the paired unobserved positions is 
$ 1 / n sum_(x in F_0 \, med y in F_1) \( z_x - z_y \)^2 gt.eq frac(min \( m_0 \, m_1 \), n) sum_x z_x^2 . $

 If the next direction is uniform outside a smaller subspace contained in $J$, the same lower bound holds with $1 \/ \( 2 n \)$ in place of $1 \/ n$.]
] <frames:cross-energy>

#proof[
  Apply the energy calculation in Lemma 4.1 to the available set $F_0 union F_1$ and the centered vector $z$. That proof uses only $sum_x z_x = 0$, not positivity of a probability vector. In its notation, take $D^0 = F_0$ and $D^1 = F_1$; the exact cross-pair loss is the displayed sum divided by $n$. When the forbidden subspace is smaller than $J$, every cross-coset difference remains allowed and has probability at least $1 \/ n$, instead of $2 \/ n$. Its averaging loss is still half the squared difference, giving the denominator $2 n$. ◻
]

=== 12.2 The Fourier input for the applications <frames:degree-section>

The remainder uses the general results of the companion #emph[From partial permutation information to Fourier bounds] [22]. We record the normalizations that enter the numerical applications. For every fixed $p > 0$, Theorem 6.3 gives

$ C_p = sup_(s gt.eq 1) sum_(lambda tack.r s) \( f^lambda \)^(- p) < oo \, #h(2em) sum_(lambda tack.r s\
lambda in.not { \( s \) \, \( 1^s \) }) \( f^lambda \)^(- p) arrow.r 0 . $

Here $f^lambda$ is the degree of the irreducible representation of $S_s$ indexed by $lambda$. For a subprobability $nu$ on $S_n$, use $hat(nu) \( rho \) = sum_g nu \( g \) rho \( g \)$, without dividing by its mass. Let $r gt.eq 1$, let $M_1 \, dots.h \, M_r$ be disjoint nonempty subsets of the labels, and let $K_i = "Sym" \( M_i \)$ fix the complement pointwise; the subsets need not cover all labels. If $nu \( g K_i \) lt.eq K \/ \[ S_n : K_i \]$, the disjoint-support orbit argument in (11.1), which extends [22] Proposition 3.2, gives

#[#set math.equation(numbering: n => "(12.6)")
 $ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq sqrt(r K C_p) thin D^(- 1 \/ 2 + \( p + 2 \) \/ \( 2 r \)) \, #h(2em) D = dim rho . $ <frames:coset-fourier>]

Its one-vector orbit estimate is independent of representation multiplicities. It applies to unequal blocks as well, although our applications use equal ones.

We use the amplification consequence in Proposition 2.5: if $0 lt.eq nu lt.eq mu$, $nu \( S_n \) arrow.r 1$, $mu$ has zero sign mean, and $parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq B D^(- beta)$ for $D > 1$, where $B \, beta > 0$ are fixed, then every fixed $k$ with $2 - 2 k beta < 0$ gives $parallel mu^(* k) - U_G parallel_(upright("TV")) arrow.r 0$. It also applies when $nu$ is a probability at distance $o \( 1 \)$ from $mu$ and has sign mean $o \( 1 \)$. All norms use unnormalized Hilbert–Schmidt trace. We verify the sign, mass, and physical block length at each application.

=== 12.3 A retained event for one partition <frames:pointwise-section>

Proposition 18 already gives a total-variation bound for every fixed large input list. Here we first choose a block partition and an order on each complement. We retain one event on which the conditional energies for these particular orders are simultaneously small. Removing their constraints in descending order will give pointwise caps for every output of each complement: a factor of two for the retained subprobability, or four after normalization.

Fix a horizon $T gt.eq d$. The initial directions are fixed to $e_1 \, dots.h \, e_d$, and thereafter $v_t$ is uniform outside $J_t = "span" \( v_(t - d + 1) \, dots.h \, v_(t - 1) \)$. Write $upright(bold(v)) = \( v_1 \, dots.h \, v_T \)$, and let $Z_0 = I$ and $Z_t = xi_t Z_(t - 1)$ be the cumulative variable-direction permutation, where, conditional on the directions, the $xi_t$ are independent uniforms in $C_(v_t)$. With the frame starting at $L_0 = I$, the cyclic endpoint has law $L_T^(- 1) Z_T$. The preceding transverse-layer estimate supplies the energy bound needed for this simultaneous event.

#thm([Lemma 12.6.])[
  (Balance supplied by an earlier crossing).  #emph[Fix integers $T gt.eq d$ and $r gt.eq 1$. For any fixed observed labels and any $d < t lt.eq T$, if $m$ positions remain unobserved, then 
$ Pr { min \( \| F_(t - 1) ∩ J_t \| \, \| F_(t - 1) \\ J_t \| \) < m \/ 4 } lt.eq 2 e^(- m \/ 8) . $

 For the hidden-card energy of Lemma 38, interpreted in this random process by Corollary 39, if $m gt.eq n \/ r$ and $alpha = 1 \/ \( 4 r \)$, then 
#[#set math.equation(numbering: n => "(12.7)")
 $ bb(E) E_T lt.eq \( 1 - alpha \)^(T - d) + 2 e^(- n \/ \( 8 r \)) . $ <frames:crossing-recursion>]

]
] <frames:crossing-balance>

#proof[
  The transverse-layer proof of Lemma 17 is uniform over the entire fixed direction schedule. It therefore applies here even though the first basis is prescribed. Explicitly, fix all directions and the observed-label configuration just before layer $t - d$. The direction at that layer crosses the cosets of $J_t$, because $v_(t - d) \, dots.h \, v_(t - 1)$ form a basis. The following $d - 1$ directions lie in $J_t$ and preserve the two coset counts. If $a$ crossing pairs contain two unobserved positions, one count after the crossing is $a + "Binomial" \( m - 2 a \, 1 \/ 2 \)$. The conditional fair-coin law is unchanged by fixing the directions. The binomial tail from that lemma is at most $2 e^(- m \/ 8)$; if $m = 2 a$ the count is deterministic. Removing this conditioning proves the stated unconditional bound.
  Equation (12.3) makes the energy vector measurable in the chronological field, and (12.4) permits averaging the next direction there. Lemma 40 then contracts energy by at least $alpha = 1 \/ \( 4 r \)$ whenever the two counts are at least $m \/ 4$. We use the balance estimate only after taking expectations. Since $0 lt.eq E lt.eq 1$,
  $ bb(E) E_t lt.eq \( 1 - alpha \) bb(E) E_(t - 1) + 2 alpha e^(- n \/ \( 8 r \)) . $
  Iterate from $E_d lt.eq 1$ and sum the geometric series. This proves (12.7) without asserting concentration conditional on the subsequently observed paths. ◻
]

#thm([Lemma 12.7.])[
  (Removing exceptional histories in descending order).  #emph[Let $T gt.eq d$ be an integer, and let $r gt.eq 2$ divide $n$. Partition $V$ into equal input blocks $M_1 \, dots.h \, M_r$ and, for each $i$, fix an order $c_(i \, 1) \, dots.h \, c_(i \, q)$ on its complement, where $q = n - n \/ r$. Write $cal(P)$ for the partition together with these orders, and let $K_i = "Sym" \( M_i \)$ fix the complement pointwise. Use the variable-direction process just defined, whose first frame is $L_0 = I$. For $1 lt.eq j lt.eq q$, let 
$ cal(H)_(i \, j) = sigma #scale(x: 120%, y: 120%)[\(] upright(bold(v)) \, thin Z_s \( c_(i \, h) \) : 0 lt.eq s lt.eq T \, med h < j #scale(x: 120%, y: 120%)[\)] \, #h(2em) F_(i \, j) = V \\ { Z_T \( c_(i \, h) \) : h < j } \, $

 and define 
$ p_(i \, j) \( x \) = Pr { Z_T \( c_(i \, j) \) = x divides cal(H)_(i \, j) } \, #h(2em) E_(i \, j) = sum_(x in F_(i \, j)) (p_(i \, j) \( x \) - frac(1, n - j + 1))^2 . $

 Suppose $bb(E) E_(i \, j) lt.eq epsilon_n$ uniformly. Put $cal(G)_(cal(P)) = ⋂_(i \, j) { E_(i \, j) lt.eq n^(- 6) }$, and let $mu$ be the original cyclic endpoint law at time $T$. Then $Pr \( cal(G)_(cal(P))^c \) lt.eq r q n^6 epsilon_n$. The measure 
$ nu \( g \) = Pr { cal(G)_(cal(P)) \, med L_T^(- 1) Z_T = g } $

 satisfies $0 lt.eq nu lt.eq mu$ and, for large $n$, $nu \( g K_i \) lt.eq 2 U_G \( g K_i \)$ for every $g in G$ and $1 lt.eq i lt.eq r$. If $a = Pr \( cal(G)_(cal(P)) \) = 1 - o \( 1 \)$, its normalized law $macron(nu) = nu \/ a$ satisfies $macron(nu) \( g K_i \) lt.eq 4 U_G \( g K_i \)$ and $parallel macron(nu) - mu parallel_(upright("TV")) lt.eq 1 - a = o \( 1 \)$.]
] <frames:backward-removal>

#proof[
  Markov’s inequality and a union bound give the lost mass. For each complete direction schedule the law of $L_T^(- 1) Z_T$ is $mu$, so restricting to $cal(G)_(cal(P))$ gives $0 lt.eq nu lt.eq mu$. For an order, its $j$-th energy event is measurable from all directions and the preceding paths. On it, every endpoint has conditional probability at most
  $ frac(1, n - j + 1) + n^(- 3) lt.eq frac(1 + n^(- 2), n - j + 1) . $
  To bound a specified list of distinct outputs intersected with $cal(G)_(cal(P))$, first discard requirements belonging to other orders. Condition on all directions and the first $q - 1$ paths, bound the final target on its own energy event, and then discard that event. Continue downwards through the list. Each remaining target event and energy constraint is measurable in the conditioning data at its turn. The target in variable coordinates is known because $L_T$ is determined by all directions. We obtain
  $ Pr \( cal(G)_(cal(P)) \, upright("specified outputs") \) lt.eq product_(j = 1)^q frac(1 + n^(- 2), n - j + 1) lt.eq 2 frac(\( n - q \) !, n !) . $
  These output specifications are precisely the left cosets $g K_i$. Normalization costs $1 \/ a$, at most two eventually. The total-variation bound for $macron(nu)$ follows from Lemma 29. ◻
]

#thm([Proposition 12.8.])[
  (Two applications of the retained event).  #emph[The physical shuffle has total-variation distance $o \( 1 \)$ from uniform by time $4096 d$. The choices $r = 32$, $T = 2561 d$ give the separate subprobability construction of Lemma 42, and sixteen such blocks give distance $o \( 1 \)$ at time $40976 d$.]
] <frames:pointwise-applications>

#proof[
  Take $d gt.eq 5$, which suffices for all block sizes in this proposition. For the first assertion take $r = 8$ and $T = 512 d$. Equation (12.7) is at most $n^(- 12)$ for large $d$, since $\( 31 \/ 32 \)^(511 d) lt.eq e^(- 511 d \/ 32)$. The exceptional mass is at most $8 n thin n^6 n^(- 12) = o \( 1 \)$. Use the normalized law $macron(nu)$ in Lemma 42 and the direct inverse-square estimate of Lemma A.2. Proposition 3.2, with $p = 2$, gives $parallel hat(macron(nu)) \( rho \) parallel_(upright("op")) lt.eq sqrt(32 C_2) D^(- 1 \/ 4)$. Eight convolutions have Plancherel exponent $2 - 16 \/ 4 = - 2$. The original block has unbiased sign because one independent switch already has fair parity; the normalized modification has sign mean $o \( 1 \)$. Proposition 2.5 applies. Since $T = 512 d$ is a whole number of coordinate sweeps, eight physical blocks give $8 T = 4096 d$.
  For the second construction take $r = 32$ and $T = \( 1 + 80 r \) d$. The first term in (12.7) is at most $e^(- 20 d) lt.eq n^(- 20)$, so the exceptional mass is at most $32 n^7 \( n^(- 20) + 2 e^(- n \/ 256) \) = o \( 1 \)$. Keep the unnormalized subprobability, whose coset factor is $K = 2$. The paragraph “Central-binomial powers eight and twenty” following Lemma A.5 in Subsection A.3 of [22] gives
  $ C_8 = sup_(s gt.eq 1) sum_(lambda tack.r s) \( f^lambda \)^(- 8) < oo \, #h(2em) sum_(lambda tack.r s\
lambda in.not { \( s \) \, \( 1^s \) }) \( f^lambda \)^(- 8) arrow.r 0 #h(2em) \( s arrow.r oo \) . $
  Applying Proposition 3.2 of the same companion with $p = 8$, $K = 2$, and $r = 32$ gives exponent $- 1 \/ 2 + 10 \/ 64 = - 11 \/ 32$ and prefactor $sqrt(64 C_8)$. Sixteen convolutions leave exponent $2 - 32 \( 11 \/ 32 \) = - 9$. The retained measure is dominated by the physical block law, whose sign mean is zero. Proposition 2.5, including its trivial and sign terms, therefore applies. Here $T = 2561 d$ is again a whole number of sweeps, so $16 T = 40976 d$ physical shuffles suffice. ◻
]

The ordinary averaged-list route is given in Proposition 32. It uses a random initial basis and sampled labels, and retains the $b = 64$, $T = 2048 d$ marginal estimate and its $32768 d$ full-deck application. The next construction returns to a fixed input list and keeps a nested event through the sequential comparison.

=== 12.4 A stopped estimate that pays for imbalance once <frames:stopped-section>

The earlier crossing-layer estimate gave exponential concentration. The conditional-tuple viewpoint is related to the analysis of the swap-or-not shuffle in [9] Section 3; the schedule comparison and estimates here are proved for the present shuffle. There is another way to balance every fixed list: randomize the later hyperplane while holding an earlier configuration fixed. Although this only gives an inverse-linear tail, nesting the balance events lets us pay this error once for the whole list.

#thm([Proposition 12.9.])[
  (Stopped partial-observation estimate).  #emph[Let $d gt.eq 4$. Put $b = 16$, $m = n \/ b$, $q = n - m$, and $T = \( 2 + 20 b \) d = 322 d$. For every fixed ordered list of $q$ distinct input positions, its image under the physical shuffle at time $T$ has distance at most 
#[#set math.equation(numbering: n => "(12.8)")
 $ delta_d = frac(4 T, m) + 1 / 2 n^(3 \/ 2) \( 1 - 1 \/ \( 4 b \) \)^(\( T - 2 d + 1 \) \/ 2) = o \( 1 \) $ <frames:stopped-delta>]

 from a uniform injection, uniformly over the chosen list.]
] <frames:stopped-marginals>

#proof[
  Start with the standard basis and generate directions by independent fair coefficients
  $ v_t = v_(t - d) + sum_(t - d < s < t) c_(s \, t) v_s quad \( t > d \) . $
  Write $upright(bold(c)) = \( c_(s \, t) : d < t lt.eq T \, med t - d < s < t \)$ for the complete coefficient array. Conditional on this array, let $Z_0 = I$ and $Z_t = zeta_t Z_(t - 1)$, where the $zeta_t$ are independent uniform switches in directions $v_t$. This is the same conditional uniform-complement schedule as before. For each fixed $upright(bold(c))$, the frame comparison starts at $L_0 = I$. Thus the distance for the fixed endpoint list is unchanged by the output relabeling, and equals the average over $upright(bold(c))$ of the conditional auxiliary distance.
  For later use, let
  #[#set math.equation(numbering: n => "(12.9)")
   $ cal(A)_h = sigma #scale(x: 120%, y: 120%)[\(] c_(s \, u) : d < u lt.eq h \, med u - d < s < u \; quad zeta_u : 1 lt.eq u lt.eq h #scale(x: 120%, y: 120%)[\)] . $ <frames:stopped-generated-field>]
  This field fixes the directions and the complete switch history through layer $h$. The conditional law of these switches uses only the directions through $h$, hence only coefficients with target time at most $h$. Coefficients with later target times therefore remain independent fair bits given $cal(A)_h$.
  Fix the input list $a_1 \, dots.h \, a_q$, write $Y_t \( j \) = Z_t \( a_j \)$, and let $F_(j \, t) = V \\ { Y_t \( i \) : i < j }$, of size $n_j = n - j + 1 gt.eq m$. Define the chronological field
  $ cal(F)_(j \, t) = sigma #scale(x: 120%, y: 120%)[\(] v_1 \, dots.h \, v_t \, thin Y_s \( i \) : 0 lt.eq s lt.eq t \, med i < j #scale(x: 120%, y: 120%)[\)] . $
  The conditional path law given $upright(bold(c))$ depends only on its direction sequence. Equations (12.3) and (12.5), with $Lambda = upright(bold(c))$, therefore identify the two versions of the hidden mass:
  $ p_(j \, t) \( x \) := Pr { Y_t \( j \) = x divides upright(bold(c)) \, thin Y_s \( i \) : 0 lt.eq s lt.eq T \, med i < j } = Pr { Y_t \( j \) = x divides cal(F)_(j \, t) } . $
  Put
  $ E_(j \, t) = sum_(x in F_(j \, t)) (p_(j \, t) \( x \) - 1 / n_j)^2 . $
  Thus $E_(j \, t)$ is measurable in $cal(F)_(j \, t)$, even though its first definition uses the complete coefficient array and complete preceding paths. For $t > d$ set $J_t = "span" \( v_(t - d + 1) \, dots.h \, v_(t - 1) \)$. Say that step $\( j \, t \)$ is balanced if both its cosets contain at least $m \/ 4$ members of $F_(j \, t - 1)$. Let $cal(B)_j \( t \)$ require this for all steps $2 d \, dots.h \, t$, with no requirement when $t = 2 d - 1$. The event $cal(B)_j \( t \)$ is $cal(F)_(j \, t - 1)$-measurable, before the direction at $t$ is revealed. Equation (12.4) and Lemma 40, followed by $cal(B)_j \( t \) subset.eq cal(B)_j \( t - 1 \)$, give
  $ bb(E) \[ upright(bold(1))_(cal(B)_j \( t \)) E_(j \, t) \] lt.eq \( 1 - 1 \/ \( 4 b \) \) thin bb(E) \[ upright(bold(1))_(cal(B)_j \( t - 1 \)) E_(j \, t - 1) \] . $
  Thus, for $cal(B)_j = cal(B)_j \( T \)$,
  #[#set math.equation(numbering: n => "(12.10)")
   $ bb(E) \[ upright(bold(1))_(cal(B)_j) E_(j \, T) \] lt.eq \( 1 - 1 \/ \( 4 b \) \)^(T - 2 d + 1) . $ <frames:stopped-energy>]
  The events decrease as $j$ increases because the hole sets shrink and the common threshold $m \/ 4$ stays fixed.
  The energy on the nested balance events is now controlled. It remains to estimate the probability that the smallest reservoir fails balance; this will be the only exceptional-event cost in the tuple comparison. Fix $t gt.eq 2 d$ and write $h = t - d$. Let $ell_t$ be the unique linear form vanishing on $J_t$ and taking value one on $v_h$. Given $cal(A)_h$, this form is uniform among the forms with $ell_t \( v_h \) = 1$. Indeed use the past basis $v_(h - d + 1) \, dots.h \, v_h$. The equations $ell_t \( v_(h + i) \) = 0$, $1 lt.eq i < d$, give
  $ ell_t \( v_(h - d + i) \) = sum_(s = h - d + i + 1)^h c_(s \, h + i) ell_t \( v_s \) . $
  Solve backwards from $i = d - 1$ to $i = 1$. At each stage the term $c_(h \, h + i) ell_t \( v_h \) = c_(h \, h + i)$ is a fresh fair bit, independent of the coefficients at later stages, of the other coefficients in the current equation, and of $cal(A)_h$. This proves the uniformity claim.
  For $F = F_(q \, h)$ put $Z = sum_(x in F) \( - 1 \)^(ell_t \( x \))$. The set $F$ is $cal(A)_h$-measurable, and $bb(E) \[ Z^2 divides cal(A)_h \] lt.eq \| F \| = n_q$: diagonal terms are one, off-diagonal terms with difference $v_h$ are minus one, and every other off-diagonal term has mean zero. The directions at times $h + 1 \, dots.h \, t - 1$ lie in $J_t$, so the coset counts from the post-step-$h$ configuration to time $t - 1$ are preserved. A count below $m \/ 4$ forces $\| Z \| > n_q - m \/ 2 gt.eq n_q \/ 2$. Chebyshev and a union bound give
  #[#set math.equation(numbering: n => "(12.11)")
   $ Pr \( cal(B)_q^c \) lt.eq 4 T \/ n_q lt.eq 4 T \/ m . $ <frames:stopped-bad>]
  We finish by coupling the endpoint lists, conditional on $upright(bold(c))$. Write $pi_q$ for the uniform injection law on $q$ positions, and put
  $ delta_(upright("aux")) \( upright(bold(c)) \) = ∥cal(L) \( \( Y_T \( 1 \) \, dots.h \, Y_T \( q \) \) divides upright(bold(c)) \) - pi_q∥_(upright("TV")) . $
  At stage $j$, prescribe the real endpoint kernel to be $p_(j \, T)$, evaluated on the preceding real paths. This prescription is used for every joint coupling history; it is not replaced by a law conditioned on earlier coupling success. Prescribe the comparison kernel to be uniform on the positions not yet used by the comparison list.
  On previous success the two lists have the same preceding endpoints, so their available endpoint sets agree. If $cal(B)_j$ holds, maximally couple the prescribed kernels, declaring failure if their endpoints differ. If balance fails, declare failure and use any coupling of them. Once a failure has occurred, continue using any coupling of the prescribed kernels, with the comparison list’s own remaining set. After choosing the real endpoint, sample its full real path from the conditional path law given that endpoint, $upright(bold(c))$, and the preceding real paths. These prescriptions preserve the real path law and the uniform comparison-list law at every stage. The probability of a balance failure before any mismatch is at most $Pr \( cal(B)_q^c divides upright(bold(c)) \)$ by nesting. The mismatch probability on a balanced, previously successful stage is bounded by $1 / 2 sqrt(n_j E_(j \, T))$. Averaging over $upright(bold(c))$ and dropping the preceding-success indicator gives the total bound
  $ bb(E)_(upright(bold(c))) delta_(upright("aux")) \( upright(bold(c)) \) & lt.eq Pr \( cal(B)_q^c \) + 1 / 2 sum_(j = 1)^q bb(E) #h(-0.16667em) [upright(bold(1))_(cal(B)_j) sqrt(n_j E_(j \, T))]\
 & lt.eq frac(4 T, m) + 1 / 2 n^(3 \/ 2) \( 1 - 1 \/ \( 4 b \) \)^(\( T - 2 d + 1 \) \/ 2) \, $
  by (12.10), (12.11), and Cauchy–Schwarz. The fixed-list frame comparison identifies the left side with the physical marginal distance, proving (12.8). Finally the exponential factor is at most $e^(- 5 d \/ 2)$, so $n^(3 \/ 2) e^(- 5 d \/ 2) arrow.r 0$, and $T \/ m arrow.r 0$. ◻
]

For sixteen equal blocks, these ordinary $o \( 1 \)$ complementary marginal errors also satisfy the common-trimming hypotheses of Proposition 27. In the following application we use the spectral-pruning theorem of the companion (Theorem 10.1) for its operator bound with constant one. If all sixteen fixed complementary marginals of a probability $mu_n$ have TV error $o \( 1 \)$, then there is a subprobability $nu_n lt.eq mu_n$ of mass $1 - o \( 1 \)$ satisfying $parallel hat(nu)_n \( rho \) parallel_(upright("op")) lt.eq D^(- 1 \/ 8)$ for every $D > 1$. The theorem takes one union of coefficient tests for each complementary marginal. Thus its proof does not multiply the marginal error by the number of tests. Proposition 44 supplies exactly these fixed-marginal hypotheses.

#thm([Proposition 12.10.])[
  (The stopped-energy and pruning application).  #emph[The stopped partial-observation estimate and spectral pruning give full-permutation distance $o \( 1 \)$ by time $5152 d$.]
] <frames:pruning-application>

#proof[
  Use any fixed partition into sixteen equal blocks and apply Proposition 44 to its complements. Theorem 10.1 gives exponent $a = 1 \/ 8$ with constant one. Sixteen convolutions have exponent $2 - 2 \( 16 \) \/ 8 = - 2$. The original block has zero sign mean, and Proposition 2.5 applies to its pruned subprobability. The total number of physical steps is $16 \( 322 d \) = 5152 d$. ◻
]

=== 12.5 One history event that works for every tilted law <frames:entropy-section>

The preceding routes control partial marginals for the original law. Here we seek an entropy comparison that remains valid for every law concentrated on one common set of histories. The comparison will apply after conditioning on an event chosen from an arbitrary representation coefficient. Its probabilistic input is a uniform control of the conditional likelihoods of realized card endpoints.

Assume $d gt.eq 7$, and fix $L = 128$, $q = n - n \/ L$, and $T = \( 1 + 100 L \) d = 12801 d$. Let $bb(P)$ be the law of cyclic switch histories, with cumulative label-to-position maps $g_t$ and cyclic directions $w_t$. Before layer $t$, let $M_t$ be the matching of trajectory labels: $u \, v$ form a pair when $g_(t - 1) \( v \) = g_(t - 1) \( u \) + w_t$.

For a nonempty subset $F$ of labels, of size $m$, let $B_t^F$ be the matrix on $F$ which averages the two coordinates of every pair of $M_t$ contained in $F$ and fixes the other coordinates. Put

$ Q_t^F = B_1^F dots.h.c B_t^F \, #h(2em) Q_0^F = I_F . $

These matrices depend on the realized matching history. The next lemma identifies their rows with the conditional hidden-card flow, expressed using that history to label the available positions.

#thm([Lemma 12.11.])[
  (Conditional masses in trajectory-label coordinates).  #emph[Fix a realized cyclic history $g = \( g_0 \, dots.h \, g_T \)$ and a nonempty set $F$ of labels. For $u in F$, let $p_t^(u \, F) \( x \)$ be the conditional probability under $bb(P)$ that card $u$ is at $x$ at time $t$, given the complete trajectories of the labels in $V \\ F$, evaluated on the trajectories supplied by $g$. Define a row indexed by $F$ by 
$ r_t^(u \, F) \( v \) = p_t^(u \, F) \( g_t \( v \) \) \, #h(2em) v in F . $

 Then, for this realized history, 
#[#set math.equation(numbering: n => "(12.12)")
 $ r_0^(u \, F) = e_u^(sans(T)) \, #h(2em) r_t^(u \, F) = r_(t - 1)^(u \, F) B_t^F \, #h(2em) r_t^(u \, F) = e_u^(sans(T)) Q_t^F . $ <frames:reference-row-flow>]

 Here $e_u$ is the coordinate vector in $bb(R)^F$. In particular the conditional likelihood of the realized endpoint of card $u$ is 
#[#set math.equation(numbering: n => "(12.13)")
 $ p_T^(u \, F) \( g_T \( u \) \) = Q_T^F \( u \, u \) . $ <frames:diagonal-shadow>]

 The conditioning in this statement remains on the paths of $V \\ F$; the realized history enters $r_t^(u \, F)$ through the indexing bijection $v mapsto g_t \( v \)$.]
] <frames:reference-rows>

#proof[
  The conditioned paths are feasible, because they come from $g$. Their complement at time $t$ is exactly the set of available positions $g_t \( F \)$. Lemma 38 gives the conditional mass flow on these positions. We express its three edge cases in the reference indices.
  If a matching edge has one position in $g_(t - 1) \( F \)$, its coin is fixed by the path of the observed card on that edge. It is therefore the coin used by the reference history, and it carries the available position $g_(t - 1) \( v \)$ to $g_t \( v \)$. Its mass keeps index $v$. If both endpoints belong to $g_(t - 1) \( F \)$, say with reference indices $v \, v'$, the two conditional output masses are the average of the preceding two masses. They are equal, so the reference history’s choice to swap or fix that edge does not change the two indexed output values. An edge with no available position has no coordinate in the row. These cases give $r_t^(u \, F) = r_(t - 1)^(u \, F) B_t^F$. Initially card $u$ is at $u$, so the initial row is $e_u^(sans(T))$. Iteration proves the row formula, and the index of the realized endpoint $g_T \( u \)$ is $u$. ◻
]

Let $J_F$ be the matrix all of whose entries equal $1 \/ m$, and set

$ Z_t^F = parallel Q_t^F - J_F parallel_(upright("HS"))^2 . $

By Lemma 46, this is the sum over $u in F$ of the squared conditional deviations of card $u$ from uniform on the available positions, with each deviation computed under the same observed complement. No independence among those cards is required. Each $B_t^F$ is a doubly stochastic contraction, hence so is $Q_t^F$. Since $J_F Q_t^F = J_F$, we have $Z_t^F lt.eq parallel I_F - J_F parallel_(upright("HS"))^2 = m - 1 lt.eq n$.

For the endpoint likelihood in the lemma, its diagonal entry and the definition of $Z_T^F$ give

#[#set math.equation(numbering: n => "(12.14)")
 $ log #scale(x: 120%, y: 120%)[\(] m p_T^(u \, F) \( g_T \( u \) \) #scale(x: 120%, y: 120%)[\)] lt.eq m sqrt(Z_T^F) . $ <frames:likelihood-excess>]

Indeed $Q_T^F \( u \, u \) lt.eq 1 \/ m + sqrt(Z_T^F)$ and $log \( 1 + x \) lt.eq x$. The likelihood is positive for the feasible realized history. We will control the average of this logarithmic excess on a single event, simultaneously for every reservoir size needed by a list.

#thm([Lemma 12.12.])[
  (One typical event for all reservoir sizes).  #emph[Define the event on cyclic histories by 
#[#set math.equation(numbering: n => "(12.15)")
 $ cal(G)_(upright("ent")) = ⋂_(m = n \/ L)^n {g : bb(E)_(F : thin \| F \| = m) Z_T^F \( g \) lt.eq n^(- 8)} \, $ <frames:typical-average>]

 where each average is uniform over subsets of labels. Then $bb(P) \( cal(G)_(upright("ent")) \) = 1 - o \( 1 \)$.]
] <frames:typical-history>

#proof[
  We estimate the distribution of these matching functionals using the directly generated variable-direction process. Start its directions with the standard basis, and choose each later direction uniformly outside the span of its preceding $d - 1$ directions. At each layer use fresh independent fair switch coins. Denote its cumulative permutation by $tilde(g)_t$. Lemma 37 says that, for each complete direction schedule, its matching sequence on trajectory labels has the same law as the cyclic matching sequence. Thus every functional $Z_T^F$ of those matchings has the same law in the two models. For the following calculation, $B_t^F$, $Q_t^F$, and $Z_t^F$ denote these same matrix functions evaluated on the auxiliary matching sequence.
  Take $F$ uniform of a fixed size $m gt.eq n \/ L$, independently of this auxiliary process. Condition on $F$, the directions through time $t - 1$, and the complete switch history through that time. For a row of $Q_(t - 1)^F - J_F$, write its entries as $z_u$, $u in F$. This row is known under the conditioning and has sum zero. Transfer it to the current positions by
  $ tilde(z) \( tilde(g)_(t - 1) \( u \) \) = z_u quad \( u in F \) . $
  The label pairs averaged by $B_t^F$ correspond exactly to the position pairs contained in $tilde(g)_(t - 1) \( F \)$ in the new matching. Thus the squared row loss is the position-space loss in Lemma 40.
  For $t > d$, let $J_t$ be the span of the preceding $d - 1$ directions, and let $h \, h'$ be the sizes of $tilde(g)_(t - 1) \( F \) ∩ J_t$ and $tilde(g)_(t - 1) \( F \) \\ J_t$. The next direction is fresh under the conditioning above. Applying the lemma to each row and summing gives
  $ bb(E) \[ Z_(t - 1)^F - Z_t^F divides F \, upright(" complete generated past through ") t - 1 \] gt.eq frac(min \( h \, h' \), n) Z_(t - 1)^F . $
  Now fix the generated past but leave $F$ unobserved. The map $tilde(g)_(t - 1)$ and the half-space $J_t$ are fixed, and $tilde(g)_(t - 1) \( F \)$ is a uniform $m$-subset. The elementary half-count estimate gives
  $ Pr { min \( h \, h' \) < m \/ 4 divides upright(" generated past") } lt.eq 2 theta^m \, #h(2em) theta = \( 3 \/ 2 \) 2^(- 3 \/ 4) < 1 . $
  For example, expansion of the product for a uniform sample without replacement gives $bb(E) 2^X lt.eq \( 3 \/ 2 \)^m$ for either half-count $X$; Markov’s inequality applied to the larger half yields this bound. Set $c = - log theta > 0$. With $Z_(t - 1)^F lt.eq n$ and $m gt.eq n \/ L$, the unconditional recurrence is
  $ bb(E) Z_t^F lt.eq \( 1 - 1 \/ \( 4 L \) \) bb(E) Z_(t - 1)^F + O \( n e^(- c n \/ L) \) #h(2em) \( t > d \) . $
  There are $T - d = 100 L d$ useful layers. Starting with $Z_d^F lt.eq n$, the initial contribution is at most $n e^(- 25 d)$ and the accumulated error is exponentially small in $n$. Hence $bb(E) Z_T^F lt.eq n^(- 20)$ for large $d$, uniformly in $m$.
  The equality of matching laws proved at the start transfers this expectation to the cyclic histories on which $cal(G)_(upright("ent"))$ was defined. For each $m$, Markov’s inequality applied to the subset average at threshold $n^(- 8)$ gives failure probability at most $n^(- 12)$. There are at most $n$ sizes, so $bb(P) \( cal(G)_(upright("ent"))^c \) lt.eq n^(- 11) = o \( 1 \)$. ◻
]

For probability laws on a finite set, write $D \( nu parallel zeta \) = sum_omega nu \( omega \) log \( nu \( omega \) \/ zeta \( omega \) \)$ for relative entropy, with $0 log 0 = 0$ and value $+ oo$ when absolute continuity fails. Write $"Ent"$ for Shannon entropy, using natural logarithms in both cases. For a set $X$ of input labels, let $nu_X$ be the endpoint restriction law under a law $nu$ on histories, and let $U_X$ be the uniform injection law. The typical event now controls the likelihood term in the entropy chain rule.

#thm([Lemma 12.13.])[
  (Entropy comparison for arbitrary tilted histories).  #emph[For every probability law $nu$ on histories supported on $cal(G)_(upright("ent"))$, 
#[#set math.equation(numbering: n => "(12.16)")
 $ D \( nu parallel bb(P) \) gt.eq bb(E)_(X : thin \| X \| = q) D \( nu_X parallel U_X \) - n^(- 2) . $ <frames:entropy-comparison>]

]
] <frames:shadow-entropy>

#proof[
  Fix an ordered list $i_1 \, dots.h \, i_q$. Let $tau_j$ and $y_j$ be the complete trajectory and endpoint of $i_j$. For the current history let $p_j$ be the conditional probability under $bb(P)$ of its realized endpoint $y_j$, given $tau_1 \, dots.h \, tau_(j - 1)$. Relative-entropy chain rule and conditional data processing give
  $ D \( nu parallel bb(P) \) & gt.eq sum_(j = 1)^q #scale(x: 120%, y: 120%)[\[] - "Ent"_nu \( y_j divides tau_1 \, dots.h \, tau_(j - 1) \) - bb(E)_nu log p_j #scale(x: 120%, y: 120%)[\]]\
 & gt.eq - "Ent"_nu \( y_1 \, dots.h \, y_q \) - sum_(j = 1)^q bb(E)_nu log p_j . $
  The second inequality uses that the preceding endpoints are functions of the preceding trajectories. Put $F_j = V \\ { i_1 \, dots.h \, i_(j - 1) }$ and $m_j = \| F_j \| = n - j + 1$. The uniform injection assigns each endpoint list mass $product_j m_j^(- 1)$, so the last inequality is
  $ D \( nu parallel bb(P) \) gt.eq D \( nu_X parallel U_X \) - sum_(j = 1)^q bb(E)_nu log \( m_j p_j \) \, #h(2em) X = { i_1 \, dots.h \, i_q } . $
  Lemma 46 applies with observed complement $V \\ F_j$ and gives $p_j = Q_T^(F_j) \( i_j \, i_j \)$ on each realized history. For a uniform ordered input list, $F_j$ is a uniform subset of size $m_j$. The bound (12.14) is independent of which $i_j in F_j$ is chosen. On every history in $cal(G)_(upright("ent"))$, Jensen’s inequality therefore gives
  $ bb(E)_(upright("ordered list")) log \( m_j p_j \) lt.eq m_j bb(E)_(F : thin \| F \| = m_j) sqrt(Z_T^F) lt.eq n sqrt(n^(- 8)) = n^(- 3) . $
  All these sizes are at least $n \/ L$. Sum over $q lt.eq n$ indices and average the preceding entropy inequality over lists and over $nu$. The induced set $X$ is uniform of size $q$, and ordering its coordinates does not change its relative entropy from a uniform injection. This proves the claimed error $n^(- 2)$. ◻
]

#thm([Proposition 12.14.])[
  (Representation-coefficient tails from entropy).  #emph[There is an absolute $C$ such that for every irreducible unitary representation $rho$ of $G$, of degree $D$, and unit vectors $u \, z$, 
#[#set math.equation(numbering: n => "(12.17)")
 $ bb(P) { cal(G)_(upright("ent")) \, \| chevron.l z \, rho \( g_T \) u chevron.r \| gt.eq D^(- 1 \/ 8) } lt.eq C D^(- 1 \/ \( 2 L \)) . $ <frames:coefficient-tail>]

 Put $a = bb(P) \( cal(G)_(upright("ent")) \)$. When $a > 0$, the conditional endpoint law $eta = cal(L) \( g_T divides cal(G)_(upright("ent")) \)$ is defined and satisfies 
$ parallel hat(eta) \( rho \) parallel_(upright("op")) lt.eq D^(- 1 \/ 8) + C / a D^(- 1 \/ \( 2 L \)) . $

 For all sufficiently large $d$, Lemma 47 gives $a gt.eq 1 \/ 2$. In that range the last bound is at most $C' D^(- 1 \/ \( 2 L \))$ for the absolute constant $C' = 1 + 2 C$.]
] <frames:entropy-tail>

#proof[
  If $a = bb(P) \( cal(G)_(upright("ent")) \) = 0$, the probability on the left side of (12.17) is zero. Otherwise apply the all-tilt coefficient theorem, [22] Theorem 11.1. Its reference probability is the law $bb(P)$ of cyclic switch histories, its endpoint map is $g_T$, and its common event is $cal(G)_(upright("ent"))$ from Lemma 47. Lemma 48 verifies the theorem’s hypothesis for every probability $nu$ supported on that same event, with $q = n - n \/ 128$ and additive error $n^(- 2)$. The theorem therefore gives the tail exponent $1 \/ 256 = 1 \/ \( 2 L \)$ at threshold $D^(- 1 \/ 8)$. For $a > 0$, splitting each absolute coefficient at $D^(- 1 \/ 8)$ under $bb(P) \( thin dot.op divides cal(G)_(upright("ent")) \)$ gives the stated operator bound with factor $C \/ a$. By Lemma 47, $a = 1 - o \( 1 \)$, so $a gt.eq 1 \/ 2$ eventually. Since $L = 128$ and $D gt.eq 1$, $D^(- 1 \/ 8) lt.eq D^(- 1 \/ \( 2 L \))$, which gives $C' = 1 + 2 C$. ◻
]

#thm([Proposition 12.15.])[
  (The typical-history entropy application).  #emph[With $L = 128$, $T = \( 1 + 100 L \) d$, and $b = 32 L$, the shuffle has full-permutation distance $o \( 1 \)$ at time $b T$.]
] <frames:entropy-application>

#proof[
  For all sufficiently large $d$, put $a = bb(P) \( cal(G)_(upright("ent")) \) > 0$ and $eta = cal(L) \( g_T divides cal(G)_(upright("ent")) \)$. The original block law $mu = cal(L) \( g_T \)$ has zero sign mean, so
  $ \| hat(eta) \( "sgn" \) \| = frac(\| bb(E) \[ "sgn" \( g_T \) upright(bold(1))_(cal(G)_(upright("ent"))^c) \] \|, a) lt.eq frac(1 - a, a) = o \( 1 \) . $
  For the nonlinear irreducibles, Proposition 49 gives the operator bound with the absolute constant $C'$. The trivial coefficient of $eta^(* b)$ is one. Plancherel therefore gives
  $ \| G \| sum_g \| eta^(* b) \( g \) - U_G \( g \) \|^2 lt.eq \| hat(eta) \( "sgn" \) \|^(2 b) + \( C' \)^(2 b) sum_(rho in.not { upright(bold(1)) \, "sgn" }) D_rho^(thin 2 - b \/ L) = o \( 1 \) . $
  Indeed $2 - b \/ L = - 30$, and the nonlinear sum vanishes by [22] Lemma A.1. Cauchy–Schwarz gives total-variation convergence. The $b$ independent histories all belong to $cal(G)_(upright("ent"))$ with probability $a^b$. Removing their conditioning costs at most $1 - a^b lt.eq b \( 1 - a \) = o \( 1 \)$, because $b$ is fixed. The physical block length is a multiple of $d$, and its $b$-fold product is the actual shuffle at time $32 L \( 1 + 100 L \) d$. ◻
]

== 13 An averaged application of deferred columns <frames:aux:section>

Lemma 19 constructs the frame from independent shears, reads each coefficient when its target column is next selected, and permits the remaining shear data to be disclosed at the terminal time. We now give a separate quantitative application of that shared law. It samples the input ordering and uses simultaneous balance across all affine half-spaces, then uses the companion’s inverse-twentieth degree estimate and a one-vector orbit bound.

The inverse frame starts at the identity, so its endpoint comparison preserves the distance for every fixed input list. The averaging in this application enters only through its balance estimate. Its full-deck consequence is the following bound.

#thm([Theorem 13.1.])[
  #emph[For the Thorp shuffle on $n = 2^d$ labeled cards, 
$ max_(sigma in S_n) parallel P_d^(512040 d) \( sigma \, dot.op \) - U_n #scale(x: 120%, y: 120%)[parallel]_(upright("TV")) = o \( 1 \) #h(2em) \( d arrow.r oo \) \, $

 where $U_n$ is the uniform probability measure on $S_n$ and one time step is one physical shuffle. Consequently, at total-variation threshold $1 \/ 4$, 
$ d lt.eq t_(upright("mix")) \( d \) lt.eq 512040 d $

 for all sufficiently large integers $d$.]
] <frames:aux:theorem>

Throughout this section put

#[#set math.equation(numbering: n => "(13.1)")
 $ r = 128 \, #h(2em) k = \( 1 - 1 \/ r \) n \, #h(2em) T = \( 100 r + 1 \) d . $ <frames:aux:parameters>]

We take $d gt.eq 7$, so $r$ divides $n$, and let $mu$ be the coordinate shuffle law after $T$ layers. We first bound the average marginal distance for ordered lists of $k$ cards. Forty independent blocks of this length will then give the theorem.

=== 13.1 The inverse frame and its conditional law <the-inverse-frame-and-its-conditional-law>

Let $iota_1 \, iota_2 \, dots.h$ be a deterministic periodic sequence of coordinate indices, with period $d$ containing each of $1 \, dots.h \, d$ once. For the present application use the standard cyclic order. For each layer $i$, choose an independent uniform linear functional $ell_i : V arrow.r bb(F)_2$ satisfying $ell_i \( e_(iota_i) \) = 0$, and put

#[#set math.equation(numbering: n => "(13.2)")
 $ S_i x = x + ell_i \( x \) e_(iota_i) \, #h(2em) B_0 = I \, quad B_i = S_i B_(i - 1) \, #h(2em) w_i = B_(i - 1)^(- 1) e_(iota_i) . $ <frames:aux:transvections>]

Each $S_i$ is an involution. Write $Lambda = \( ell_1 \, dots.h \, ell_T \)$ and $W = \( w_1 \, dots.h \, w_T \)$. Conditional on $Lambda$, let $M_i$ be independent uniform matching switches in directions $w_i$, and define

$ Y_0 = I \, #h(2em) Y_i = M_i Y_(i - 1) \, #h(2em) X_i = B_i Y_i . $

The process $Y$ uses virtual positions and $X$ uses the original coordinate positions.

#thm([Lemma 13.2.])[
  (Inverse-frame form of the shear law).  #emph[Conditional on $Lambda$, the increments of $X$ are independent uniform switches in the coordinate directions $e_(iota_i)$. For every $t lt.eq T$, the conditional law of $\( Y_i \)_(i = 0)^t$ given $Lambda$ is the product-switch law determined by $w_1 \, dots.h \, w_t$.]
  #emph[Every $d$ consecutive directions $w_i$ form a basis. At layer $i$, learning $w_i$ does not change the conditional law of the preceding virtual positions given $w_1 \, dots.h \, w_(i - 1)$ and any specified virtual path prefixes through layer $i - 1$. For $i > d$, that direction is uniform outside 
$ "span" \( w_(i - d + 1) \, dots.h \, w_(i - 1) \) $

 conditional on that same direction and path-prefix field. Finally, conditional on the complete direction sequence $W$, disclosing the remaining information in $Lambda$ does not change the conditional law of the virtual trajectories, including after a fixed collection of those trajectories has been observed.]
] <frames:aux:directions>

#proof[
  Set $A_i = B_i^(- 1)$. Since $S_i$ is an involution, $A_i = A_(i - 1) S_i$ and $w_i = A_(i - 1) e_(iota_i)$, which are the forward frame and selected directions of Lemma 19. Remark 20 gives the inverse coupled identity $X_i = B_i Y_i$ and the conditional coordinate-switch law. The prefix product-switch law and consecutive-basis property are conclusions of that lemma for the same periodic axis order. The prefix law makes the old virtual path and the next direction conditionally independent given the direction prefix; Corollary 39 records the resulting hidden-position factorization after specified virtual path prefixes through layer $i - 1$ are observed. The uniform-complement law for $i > d$ is the lemma’s fresh-direction conclusion.
  In particular, the conditional law of the full virtual trajectory given $Lambda$ depends on $Lambda$ only through $W$. Thus the trajectory and $Lambda$ are conditionally independent given $W$. Conditioning also on a fixed observed part of the trajectory preserves this factorization for the remaining trajectories. ◻
]

For the standard cyclic order used in this application, fix an input list and $Lambda$. The known output bijection $B_T$ preserves uniform injections and total variation. The conditional coordinate law in the lemma therefore identifies that list’s virtual conditional distance with its distance under $mu$. The random ordering introduced next is used to prove balance; it is not required by this frame comparison.

=== 13.2 A conditional energy estimate for almost all cards <a-conditional-energy-estimate-for-almost-all-cards>

Choose a uniformly random ordering $cal(O) = \( a_1 \, dots.h \, a_n \)$ of the cards, independently of $\( Lambda \, \( Y_i \)_(i = 0)^T \)$. For $0 lt.eq j < k$, use the chronological field

$ cal(F)_i^j = sigma #scale(x: 120%, y: 120%)[\(] cal(O) \, w_1 \, dots.h \, w_i \, thin Y_s \( a_h \) : 0 lt.eq s lt.eq i \, med 1 lt.eq h lt.eq j #scale(x: 120%, y: 120%)[\)] . $

Let $D_i = V \\ { Y_i \( a_h \) : 1 lt.eq h lt.eq j }$ be the available positions, of size $m = n - j$. Define

$ q_i \( x \) = Pr { Y_i \( a_(j + 1) \) = x divides cal(F)_i^j } \, $

and put

$ z_i \( x \) = q_i \( x \) - 1 / m quad \( x in D_i \) \, #h(2em) E_i = sum_(x in D_i) z_i \( x \)^2 . $

The conditional mass is zero off $D_i$, and $z_i$ sums to zero on $D_i$. We use counting measure in the squared norm, so $E_0 = 1 - 1 \/ m lt.eq 1$.

#thm([Lemma 13.3.])[
  #emph[Uniformly for $0 lt.eq j < k$, with expectation over the ordering and shuffle construction, 
#[#set math.equation(numbering: n => "(13.3)")
 $ bb(E) E_T lt.eq e^(- 25 d) + T delta_n \, #h(2em) delta_n = 2 n \( n + 1 \) exp (- frac(n, 16 r)) . $ <frames:aux:energy-bound>]

]
] <frames:aux:energy>

#proof[
  Lemma 52 gives the conditional product-switch law and the fresh direction in the field $cal(F)_(i - 1)^j$. Apply Lemma 4.1 with initial datum $cal(O)$, $t = i - 1$, available set $D_(i - 1)$, and hidden mass $q_(i - 1)$. Its averaging and transport rules preserve the uniform comparison law on the holes and give
  #[#set math.equation(numbering: n => "(13.4)")
   $ E_(i - 1) - E_i = 1 / 2 sum_({ x \, y } upright(" an edge of layer ") i\
x \, y in D_(i - 1)) #scale(x: 120%, y: 120%)[\(] z_(i - 1) \( x \) - z_(i - 1) \( y \) #scale(x: 120%, y: 120%)[\)]^2 . $ <frames:aux:energy-drop>]
  In particular $0 lt.eq E_i lt.eq E_(i - 1) lt.eq 1$ for every realization.
  Suppose now that $i > d$. Before its direction is drawn, put $J_i = "span" \( w_(i - d + 1) \, dots.h \, w_(i - 1) \)$ and split $D_(i - 1) = D^0 union D^1$ across its two cosets, with sizes $h_0 \, h_1$. Lemma 52 makes the next direction uniform outside $J_i$, so each cross pair has conditional matching probability $2 \/ n$. The cross-pair calculation in Lemma 4.1, with centered vector $z_(i - 1)$, gives
  #[#set math.equation(numbering: n => "(13.5)")
   $ bb(E) \( E_(i - 1) - E_i divides cal(F)_(i - 1)^j \) & = 1 / n sum_(x in D^0 \, med y in D^1) #scale(x: 120%, y: 120%)[\(] z_(i - 1) \( x \) - z_(i - 1) \( y \) #scale(x: 120%, y: 120%)[\)]^2\
 & gt.eq frac(min \( h_0 \, h_1 \), n) E_(i - 1) . $ <frames:aux:cross-loss>]
  The inequality is (4.6); it also covers an empty part.
  We use a simultaneous balance estimate for every affine half-space. At a fixed time, condition on $Lambda$ and the complete virtual switch history but not on $cal(O)$. The permutation $Y_(i - 1)$ is then fixed, and the independent ordering makes $D_(i - 1)$ a uniform $m$-subset of $V$. The simultaneous estimate below is valid even for a half-space chosen after that subset is seen.
  For $m < n$, a uniform $m$-subset has the law of independent Bernoulli choices of parameter $m \/ n$, conditional on making exactly $m$ choices. This conditioning event has probability at least $1 \/ \( n + 1 \)$: $m$ is a mode of the binomial distribution and that distribution has $n + 1$ values. In a specified affine half-space let $X$ be the unconditioned number of choices. It has mean $m \/ 2$, and
  $ Pr { X < m \/ 4 } & lt.eq 2^(m \/ 4) bb(E) 2^(- X) = 2^(m \/ 4) (1 - frac(m, 2 n))^(n \/ 2)\
 & lt.eq e^(- \( 1 - log 2 \) m \/ 4) lt.eq e^(- m \/ 16) \, $
  where the last inequality uses $log 2 < 3 \/ 4$. There are fewer than $2 n$ affine half-spaces arising as a linear hyperplane or its other coset. Since $m gt.eq n \/ r$, a union bound after conditioning gives
  #[#set math.equation(numbering: n => "(13.6)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] upright("some such half-space contains fewer than ") m \/ 4 upright(" holes") #scale(x: 120%, y: 120%)[\)] lt.eq delta_n . $ <frames:aux:balance>]
  For $m = n$ the balance assertion is deterministic.
  On the complement of the event in (13.6), the conditional loss in (13.5) is at least $m E_(i - 1) \/ \( 4 n \) gt.eq E_(i - 1) \/ \( 4 r \)$. On the exceptional event we retain the deterministic energy nonincrease and the bound $E_(i - 1) lt.eq 1$. Taking expectations consequently gives
  $ bb(E) E_i lt.eq (1 - frac(1, 4 r)) bb(E) E_(i - 1) + delta_n #h(2em) \( i > d \) . $
  Only the unconditional estimate (13.6) has been used. Iterating over $T - d = 100 r d$ layers, starting from $E_d lt.eq 1$, yields
  $ bb(E) E_T lt.eq (1 - frac(1, 4 r))^(100 r d) + T delta_n lt.eq e^(- 25 d) + T delta_n . $
  ◻
]

The terminal disclosure and the common tuple comparison now convert this energy estimate to the required average of marginal distances.

#thm([Proposition 13.4.])[
  #emph[Let $C = \( a_1 \, dots.h \, a_k \)$ be a uniformly chosen ordered list of distinct initial cards, independent of $X_T tilde.op mu$, and let $pi_k$ be uniform on ordered $k$-tuples of distinct positions. Then 
#[#set math.equation(numbering: n => "(13.7)")
 $ bb(E)_C parallel cal(L) \( X_T \( C \) divides C \) - pi_k #scale(x: 120%, y: 120%)[parallel]_(upright("TV")) & lt.eq epsilon_n \,\
epsilon_n & = k / 2 sqrt(n #scale(x: 120%, y: 120%)[\(] e^(- 25 d) + T delta_n #scale(x: 120%, y: 120%)[\)]) = o \( 1 \) . $ <frames:aux:marginal-error>]

]
] <frames:aux:marginal>

#proof[
  For each $j < k$, the terminal factorization in Lemma 52 and (12.5) give
  $ Pr { Y_T \( a_(j + 1) \) = x divides Lambda \, cal(O) \, thin Y_s \( a_h \) : 0 lt.eq s lt.eq T \, med h lt.eq j } = q_T \( x \) . $
  Thus the terminal-data hypothesis of Lemma 8 holds with initial datum $cal(O)$ and terminal datum $Lambda$. Write
  $ delta_(upright("virt")) \( Lambda \, cal(O) \) = ∥cal(L) #scale(x: 120%, y: 120%)[\(] \( Y_T \( a_1 \) \, dots.h \, Y_T \( a_k \) \) divides Lambda \, cal(O) #scale(x: 120%, y: 120%)[\)] - pi_k∥_(upright("TV")) $
  for the conditional virtual tuple distance. The lemma’s coarsening to preceding endpoints and sequential comparison, together with Lemma 53, give
  $ bb(E)_(Lambda \, cal(O)) delta_(upright("virt")) \( Lambda \, cal(O) \) lt.eq k / 2 sqrt(n #scale(x: 120%, y: 120%)[\(] e^(- 25 d) + T delta_n #scale(x: 120%, y: 120%)[\)]) . $
  For each fixed $Lambda$ and $cal(O)$, applying $B_T$ to every output preserves $pi_k$ and total variation. The conditional law of $X_T$ given $Lambda$ is $mu$, and the independent ordering contributes no further information about that law. Hence $delta_(upright("virt")) \( Lambda \, cal(O) \)$ equals the distance under $mu$ for the specified list $C$. Averaging proves (13.7). Finally, $n = 2^d$ gives $n^(3 \/ 2) e^(- 25 d \/ 2) arrow.r 0$, while $delta_n$ is exponentially small in $n$ up to a polynomial factor. Hence $epsilon_n = o \( 1 \)$. ◻
]

For the representation step, write $K_0 = sup_(s gt.eq 1) sum_(rho in "Irr" \( S_s \)) D_rho^(- 20)$. The proof of Lemma A.1 gives $K_0 < oo$, and the lemma gives vanishing of the same sum after omitting the trivial and sign types as $s arrow.r oo$. In particular, for every $M gt.eq 1$,

$ \# { rho in "Irr" \( S_s \) : D_rho lt.eq M } lt.eq K_0 M^20 . $

This is the hook-product version of the inverse-degree estimate in the companion; its proof bounds the first-row hooks by opposite-order rearrangement. We use this power-twenty estimate in the orbit bound below.

=== 13.3 Coset truncation and the orbit of one vector <coset-truncation-and-the-orbit-of-one-vector>

Choose a uniform partition of the card labels into $r$ blocks $C_1 \, dots.h \, C_r$ of equal size $n \/ r$. For each block its complement is a uniform $k$-element subset. Ordering that complement in any fixed way identifies its labeled endpoint images with an ordered tuple and does not affect total-variation distance. By Proposition 54, the expected sum of the $r$ complement marginal distances is at most $r epsilon_n$. Fix a partition realizing a sum at most this bound, and let $H_i tilde.equiv S_(n \/ r)$ be the subgroup of $S_n$ permuting $C_i$ and fixing its complement pointwise.

Two position permutations agree on the complement of $C_i$ exactly when they lie in the same left coset $g H_i$. Thus the corresponding coset marginal of $mu$ is within its complement marginal distance of uniform on $G \/ H_i$, where $G = S_n$. Delete from $mu$ every element lying in a coset, for any $i$, whose $mu$-mass exceeds $2 \/ \[ G : H_i \]$, and call the resulting subprobability measure $nu$. Writing $p = nu \( G \)$, we obtain

#[#set math.equation(numbering: n => "(13.8)")
 $ 1 - p lt.eq 2 r epsilon_n = o \( 1 \) \, #h(2em) nu \( g H_i \) lt.eq frac(2, \[ G : H_i \]) quad \( g in G \, med 1 lt.eq i lt.eq r \) . $ <frames:aux:cosets>]

Indeed, if a coset has mass $a > 2 u$, where $u = 1 \/ \[ G : H_i \]$, then $a lt.eq 2 \( a - u \)$. Its removed mass is bounded by twice its positive excess over uniform; summing positive excesses gives exactly the marginal total-variation distance. A union bound handles all $r$ families of deleted cosets.

For a unitary representation $rho$, define its Fourier transform by

$ hat(nu) \( rho \) = sum_(g in G) nu \( g \) rho \( g \) . $

The following estimate explains why information about complements of the blocks is enough to control every irreducible representation.

#thm([Lemma 13.5.])[
  #emph[If $rho$ is an irreducible unitary representation of $G = S_n$ of dimension $D$, then the measure in (13.8) satisfies 
#[#set math.equation(numbering: n => "(13.9)")
 $ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq C_r D^(- 1 \/ 2 + 11 \/ r) \, #h(2em) C_r = sqrt(2 r K_0) . $ <frames:aux:operator-bound>]

]
] <frames:aux:orbit-lift>

#proof[
  The proof of Lemma A.1 bounds the complete inverse-twentieth sum by $K_0$. Apply Proposition 3.2 with $p = 20$, $K = 2$, and $r = 128$. That proposition assigns a component $v_i$ of a given vector to the small $H_i$-types and sets $W_i = "span" { rho \( h \) v_i : h in H_i }$. Its orbit bound is
  #[#set math.equation(numbering: n => "(13.10)")
   $ dim W_i lt.eq sum_(tau in "Irr" \( H_i \)\
dim tau lt.eq D^(1 \/ r)) \( dim tau \)^2 lt.eq K_0 D^(22 \/ r) . $ <frames:aux:orbit-dimension>]
  The sum counts each irreducible subgroup type once: the orbit of a fixed vector in all copies of a type of degree $f$ has dimension at most $f^2$. Combining this estimate with the coset cap and Schur averaging in that proposition gives $sqrt(2 r K_0) D^(- 1 \/ 2 + 11 \/ r)$. ◻
]

=== 13.4 Forty blocks and the full-deck conclusion <forty-blocks-and-the-full-deck-conclusion>

The preceding estimate controls all non-linear irreducible types. We now sum their contributions and treat the sign representation separately. Let $b = 40$. Since $0 lt.eq nu lt.eq mu$, their convolution powers satisfy $0 lt.eq nu^(* b) lt.eq mu^(* b)$ and

#[#set math.equation(numbering: n => "(13.11)")
 $ parallel mu^(* b) - nu^(* b) parallel_1 = 1 - p^b = o \( 1 \) . $ <frames:aux:lost-mass>]

Here the $ell^1$ norm uses counting measure on $G$. Apply the centered identity in Lemma 29 to $xi = nu^(* b)$, of mass $p^b$, and then Cauchy–Schwarz. With the convolution convention of Section 7, this gives

#[#set math.equation(numbering: n => "(13.12)")
 $ parallel nu^(* b) - p^b U_n parallel_1^2 lt.eq sum_(rho in "Irr" \( G \)\
rho eq.not upright(bold(1))) D_rho parallel hat(nu) \( rho \)^b parallel_(upright("HS"))^2 . $ <frames:aux:plancherel>]

The centering by $p^b U_n$ cancels exactly the trivial coefficient.

For every type other than trivial and sign, $parallel A^b parallel_(upright("HS")) lt.eq sqrt(D) parallel A parallel_(upright("op"))^b$, so Lemma 55 bounds its total contribution to (13.12) by

$ C_r^(2 b) sum_(rho eq.not upright(bold(1)) \, "sgn") D_rho^(thin 2 - b \( 1 - 22 \/ r \)) . $

For our constants,

$ 2 - 40 \( 1 - 22 \/ 128 \) = - 249 / 8 = - 31.125 < - 20 . $

Lemma A.1 thus makes this sum $o \( 1 \)$. No normality of $hat(nu) \( rho \)$ is needed for this norm bound.

Since $d$ divides $T$, the block has no remaining rotation and $mu = q_d^(* T)$. For this physical block law, Lemma 15 gives $hat(mu) \( "sgn" \) = 0$ and $\| hat(nu) \( "sgn" \) \| lt.eq 1 - p$. The remaining sign contribution in (13.12) is consequently at most $\( 1 - p \)^(2 b) = o \( 1 \)$. We conclude from (13.12) that $parallel nu^(* b) - p^b U_n parallel_1 = o \( 1 \)$. Combining this with (13.11) and $parallel p^b U_n - U_n parallel_1 = 1 - p^b$ gives

$ parallel mu^(* 40) - U_n parallel_1 = o \( 1 \) . $

Each block has length $T = \( 100 r + 1 \) d$, a multiple of $d$. Independent consecutive blocks therefore have precisely the convolution law used above, with no unaccounted coordinate rotation. Since

$ 40 T = 40 \( 100 dot.op 128 + 1 \) d = 512040 d \, $

this proves the upper assertion of Theorem 51. For any initial labeled deck, applying a position permutation gives a bijection between $S_n$ and the possible resulting decks. It preserves uniform measure and total-variation distance, which proves the stated worst-start quantifier.

The matching lower bound is the support calculation in Remark 36. This completes Theorem 51.

== 14 Random input domains and equivariant kernels <lifts:random-marginals>

Lemma 22 takes the image-law error with the input tuple fixed and bounds its average over the tuple. We use this information in three ways. One average selects a partition whose complementary marginals admit a common truncation. A stronger average controls sixteen separately truncated transition kernels. A third argument keeps all omitted sets and uses the companion’s projection expansion for those sets.

For a probability $mu$ on $G = "Sym" \( V \)$ and a specified set $A subset.eq V$, write $mu_A$ for the law of the restriction $g \|_A$ under $g tilde.op mu$, and write $U_A$ for the uniform law on injections from $A$ to $V$. Choosing an ordering of $A$ identifies these laws with the corresponding ordered image laws. A different ordering only permutes coordinates, so it preserves their total-variation distance. Thus the averages in Lemma 22 and Corollary 23 also give the corresponding averages over uniformly chosen input sets.

=== 14.1 Four blocks from sixteen complementary marginals <lifts:four-blocks-section>

The first application uses the full-partition case of the isotypic estimate in Proposition 28, proved for partitions in the companion #emph[From partial permutation information to Fourier bounds] [22] Proposition 3.5. Let $V = M_1 union.sq dots.h.c union.sq M_16$ be a partition into nonempty label sets, and put $H_i = "Sym" \( M_i \)$, fixing the complement pointwise. If $f gt.eq 0$ has mass $z lt.eq 1$ and satisfies $f \( g H_i \) lt.eq 2 \/ \[ G : H_i \]$ for every $g \, i$, then for every irreducible unitary representation $rho$ of degree $D$,

#[#set math.equation(numbering: n => "(14.1)")
 $ parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq 32 z C_2 D^(- 3 \/ 4) . $ <lifts:isotypic-input>]

The transform is not divided by $z$, the Hilbert–Schmidt norm uses the ordinary trace, and the estimate includes every restriction multiplicity. This is (11.1) with $r = 16$, $K = 2$, and $u = 2$; that equation also allows disjoint supports that leave labels unused. For the two convolution arguments below, the direct inverse-square estimate [22] Lemma A.2 supplies

#[#set math.equation(numbering: n => "(14.2)")
 $ C_2 < oo \, #h(2em) Z_2 \( n \) = sum_(rho in "Irr" \( S_n \)\
D_rho > 1) D_rho^(- 2) arrow.r 0 \, #h(2em) D_rho = dim rho . $ <lifts:inverse-square-input>]

#thm([Proposition 14.1.])[
  #emph[As $d arrow.r oo$, with $n = 2^d$, 
$ max_(g_0 in G) parallel P_d^(2052 d) \( g_0 \, dot.op \) - U_n parallel_(upright("TV")) = parallel q_d^(* \( 2052 d \)) - U_n parallel_(upright("TV")) arrow.r 0 . $

]
] <lifts:random-four-blocks>

#proof[
  For $d gt.eq 4$, put $m = n \/ 16$, $T = 513 d$, and $mu = q_d^(* T)$. Corollary 23 gives $bb(E)_(\| A \| = n - m) parallel mu_A - U_A parallel_(upright("TV")) lt.eq epsilon_n = o \( 1 \)$. In a uniformly chosen ordered partition $\( M_1 \, dots.h \, M_16 \)$ into sets of size $m$, each complement $V \\ M_i$ is uniform. Hence the expected sum of the sixteen complementary errors is at most $16 epsilon_n$, and some partition has sum at most this value.
  For that partition, the restriction to $V \\ M_i$ identifies the left coset $g H_i$. Delete the union of all cosets whose original $mu$-mass exceeds twice uniform. The calculation in the proof of Lemma 10 gives a common subprobability $f lt.eq mu$ of mass $z = 1 - eta$, with $eta lt.eq 32 epsilon_n = o \( 1 \)$, such that $f \( g H_i \) lt.eq 2 \/ \[ G : H_i \]$ for every $g \, i$. Equation (14.1), with $z lt.eq 1$, therefore gives $parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq 32 C_2 D^(- 3 \/ 4)$. Hilbert–Schmidt submultiplicativity yields
  $ D parallel hat(f) \( rho \)^4 parallel_(upright("HS"))^2 lt.eq D parallel hat(f) \( rho \) parallel_(upright("HS"))^8 lt.eq \( 32 C_2 \)^4 D^(- 2) . $
  The trivial coefficient of $f^(* 4)$ is $z^4$. Lemma 15 gives $\| hat(f) \( "sgn" \) \| lt.eq eta$, since the original block has sign mean zero. Plancherel and (14.2) now imply
  $ \| G \| parallel f^(* 4) - z^4 U_n parallel_2^2 lt.eq eta^8 + \( 32 C_2 \)^4 Z_2 \( n \) = o \( 1 \) . $
  Cauchy–Schwarz gives $parallel f^(* 4) - z^4 U_n parallel_1 = o \( 1 \)$. Positivity gives $f^(* 4) lt.eq mu^(* 4)$, and their mass difference is $1 - z^4 = o \( 1 \)$. Consequently
  $ parallel mu^(* 4) - U_n parallel_(upright("TV")) lt.eq 1 - z^4 + 1 / 2 parallel f^(* 4) - z^4 U_n parallel_1 = o \( 1 \) . $
  The four independent physical blocks have total length $4 T = 2052 d$ and law $mu^(* 4) = q_d^(* \( 2052 d \))$. Equation (2.2) gives the stated maximum over starts. ◻
]

=== 14.2 Sixteen retained kernels and the sign condition <sixteen-retained-kernels-and-the-sign-condition>

The second application keeps every starting deck and makes one truncation for each omitted label set. Fix a partition $V = M_1 union.sq dots.h.c union.sq M_16$ with $\| M_i \| = m = n \/ 16$, and put $H_i = "Sym" \( M_i \)$ and $H = product_i H_i$. These groups act on decks on the right, by $g mapsto g h$. The quotient $X_i = G \/ H_i$ records the positions of all labels outside $M_i$; it has $L = n ! \/ m !$ states, each with $m !$ decks.

Suppose a kernel $K$ satisfies $K \( g h \, z h \) = K \( g \, z \)$ for $h in H$. Its quotient kernel is

$ p_i \( x \, y \) = sum_(z in y) K \( g \, z \) \, #h(2em) g in x \, quad x \, y in X_i . $

Equivariance under $H_i$ makes this independent of the representative $g$. For $epsilon.alt > 0$, retain exactly the quotient blocks below the specified density threshold:

#[#set math.equation(numbering: n => "(14.3)")
 $ T_i \( g \, z \) = K \( g \, z \) thin upright(bold(1)) {p_i \( g H_i \, z H_i \) lt.eq frac(1 + epsilon.alt, L)} . $ <lifts:kernel-cutoff>]

Kernels act on functions by $\( T_i F \) \( g \) = sum_z T_i \( g \, z \) F \( z \)$, with the counting inner product. In the $H_i$-isotypic decomposition, write $T_i^("sgn")$ for the operator on the full multiplicity space of the sign representation, including every quotient fiber.

The sixteen-kernel theorem [22] Theorem 9.1 applies when $K$ is doubly stochastic, $m arrow.r oo$, every quotient has mean row variation at most $delta_n arrow.r 0$, and $epsilon.alt arrow.r 0$ with $delta_n \/ epsilon.alt arrow.r 0$. Its additional input is $parallel T_i^("sgn") parallel_(upright("HS"))^2 = o \( 1 \)$ for every $i$. It then gives mean row convergence of $K^16$ to uniform, accounting also for the entire all-trivial multiplicity space. If $K$ commutes with a transitive action on decks, all row distances are equal and the convergence is uniform over starting decks.

#thm([Theorem 14.2.])[
  #emph[As $d arrow.r oo$, with $n = 2^d$, 
$ max_(g_0 in G) parallel P_d^(32784 d) \( g_0 \, dot.op \) - U_n parallel_(upright("TV")) = parallel q_d^(* \( 32784 d \)) - U_n parallel_(upright("TV")) arrow.r 0 . $

]
] <lifts:sixteen-theorem>

#proof[
  For sufficiently large $d$, in particular $d gt.eq 4$, set $T = 2049 d$, $mu = q_d^(* T)$, and $K = P_d^T$. The identity $K \( g \, z \) = mu \( z g^(- 1) \)$ shows that $K$ is doubly stochastic and that it commutes with the right action of every label permutation. A uniform source state in $X_i$ places the specified labels outside $M_i$ at a uniform injection. Their output law is the quotient row $p_i \( x \, dot.op \)$, so Corollary 23 gives
  $ 1 / L sum_(x in X_i) 1 / 2 sum_(y in X_i) \| p_i \( x \, y \) - L^(- 1) \| lt.eq delta_n \, #h(2em) delta_n = n^(- 10) . $
  Choose $epsilon.alt = n^(- 1)$ in (14.3). A removed quotient atom has positive excess over uniform at least $epsilon.alt \/ \( 1 + epsilon.alt \)$ times its mass. Thus the mean mass removed is
  $ gamma_i := frac(1, \| G \|) sum_(g \, z) \( K \( g \, z \) - T_i \( g \, z \) \) lt.eq frac(1 + epsilon.alt, epsilon.alt) delta_n = o \( 1 \) . $
  Each $T_i$ is row- and column-substochastic because $0 lt.eq T_i lt.eq K$. Moreover $H_i$ is normal in $H$, and right equivariance gives $p_i \( x h \, y h \) = p_i \( x \, y \)$ for $h in H$. The cutoff therefore preserves the action of the whole product $H$.
  We now verify the sign condition with its full multiplicity. Fix $i$ and choose a deck $g_x$ in each fiber $x in X_i$. For $a \, b \, c in H_i$, put $w_(x y) \( c \) = T_i \( g_x \, g_y c \)$. Right equivariance gives
  $ T_i \( g_x a \, g_y b \) = w_(x y) \( b a^(- 1) \) \, #h(2em) sum_c w_(x y) \( c \) = t_i \( x \, y \) := p_i \( x \, y \) upright(bold(1)) { p_i \( x \, y \) lt.eq \( 1 + epsilon.alt \) \/ L } . $
  On fiber $x$, define the normalized sign vector by $phi.alt_x \( g_x a \) = "sgn" \( a \) \/ sqrt(m !)$, and set it to zero off that fiber. Each fiber is a regular $H_i$-set, so these $L$ orthonormal vectors span the full sign isotypic space of $ell^2 \( G \)$. In this basis the multiplicity operator has entries
  #[#set math.equation(numbering: n => "(14.4)")
   $ T_i^("sgn") \( x \, y \) = chevron.l phi.alt_x \, T_i phi.alt_y chevron.r = sum_(c in H_i) w_(x y) \( c \) "sgn" \( c \) \, #h(2em) \| T_i^("sgn") \( x \, y \) \| lt.eq t_i \( x \, y \) . $ <lifts:sign-fiber-coefficient>]
  Suppose the ignored positions in $x$ contain a matched pair of the first physical shuffle, and let $s$ be its position transposition. Then $tau = g_x^(- 1) s g_x in H_i$ is an odd transposition and $g_x tau = s g_x$. In the first physical step $R S$, the switch $S$ is uniform in $C_(e_1)$. Since $s in C_(e_1)$, one has $S s =^(upright("law")) S$. The first-step laws from $g_x tau$ and $g_x$ are therefore identical, and so $K \( g_x tau \, z \) = K \( g_x \, z \)$ for every output deck $z$. The cutoff depends only on the source and target quotient states, so the same identity holds for $T_i$. Right equivariance now gives
  $ w_(x y) \( c \) = T_i \( g_x tau \, g_y c \) = T_i \( g_x \, g_y c tau^(- 1) \) = w_(x y) \( c tau^(- 1) \) . $
  Since $"sgn" \( tau \) = - 1$, the signed sum in (14.4) is its own negative. Every outgoing sign coefficient from this fiber is zero.
  For a uniform fiber $x$, its ignored positions form a uniform $m$-subset of $V$. The fraction of these sets containing no full first-layer pair is
  $ a_(n \, m) = product_(j = 0)^(m - 1) frac(n - 2 j, n - j) lt.eq exp (- frac(m \( m - 1 \), 2 n)) . $
  After $j$ positions have been sampled without a partner, exactly $j$ partners are forbidden among the $n - j$ remaining positions. The product follows, and $log \( 1 - u \) lt.eq - u$ gives the exponential bound. Only these $L a_(n \, m)$ fiber rows can contribute to the sign matrix. For each such row the quotient cap gives
  $ sum_y \| T_i^("sgn") \( x \, y \) \|^2 lt.eq sum_y t_i \( x \, y \)^2 lt.eq frac(1 + epsilon.alt, L) sum_y t_i \( x \, y \) lt.eq frac(1 + epsilon.alt, L) . $
  Consequently the squared Hilbert–Schmidt norm on the entire sign multiplicity space is
  $ parallel T_i^("sgn") parallel_(upright("HS"))^2 = sum_(x \, y) \| T_i^("sgn") \( x \, y \) \|^2 lt.eq \( 1 + epsilon.alt \) a_(n \, m) lt.eq \( 1 + epsilon.alt \) e^(- m \( m - 1 \) \/ \( 2 n \)) = o \( 1 \) . $
  Here $m = n \/ 16 arrow.r oo$ and $delta_n \/ epsilon.alt = n^(- 9) arrow.r 0$. The companion theorem therefore gives mean row error $o \( 1 \)$ for $K^16$. The right action of all label permutations is transitive on decks and commutes with $K$, so every row has the same error. Finally $K^16 = P_d^(16 T)$ and $16 T = 32784 d$, proving the assertion. ◻
]

=== 14.3 Averaging all omitted sets <averaging-all-omitted-sets>

The third application keeps the average over all omitted sets. The omitted-set transfer [22] Theorem 10.3 assumes, as $n arrow.r oo$ through multiples of $1024$, that probabilities $mu$ on $S_n$ satisfy

$ delta_n := bb(E)_(\| A \| = n - n \/ 1024) parallel mu_A - U_A parallel_(upright("TV")) arrow.r 0 . $

For all sufficiently large $n$, it supplies a probability $nu$ with $parallel nu - mu parallel_(upright("TV")) lt.eq 16 delta_n$ and $parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq C D^(- 1 \/ 4)$ for $D = dim rho > 1$, where $C$ is absolute. The proof uses a finite expansion into ordered products of projections associated with the omitted sets. The sets may overlap, and the argument preserves the order of their projections.

#thm([Proposition 14.3.])[
  #emph[As $d arrow.r oo$, with $n = 2^d$, 
$ max_(g_0 in G) parallel P_d^(262152 d) \( g_0 \, dot.op \) - U_n parallel_(upright("TV")) = parallel q_d^(* \( 262152 d \)) - U_n parallel_(upright("TV")) arrow.r 0 . $

]
] <lifts:neumann-theorem>

#proof[
  For sufficiently large $d$, in particular $d gt.eq 10$, set $b = 1024$, $T = \( 1 + 32 b \) d$, and $mu = q_d^(* T)$. Corollary 23, in the set form established at the start of this section, gives the displayed hypothesis with $delta_n = o \( 1 \)$. Let $nu$ be the resulting nearby probability. Lemma 15 gives $\| hat(nu) \( "sgn" \) \| lt.eq 2 parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$. For eight factors, Plancherel and $parallel A parallel_(upright("HS")) lt.eq sqrt(D) thin parallel A parallel_(upright("op"))$ give
  $ 4 parallel nu^(* 8) - U_n parallel_(upright("TV"))^2 lt.eq \| hat(nu) \( "sgn" \) \|^16 + C^16 Z_2 \( n \) = o \( 1 \) \, $
  using (14.2); the nonlinear exponent is $2 - 16 \( 1 \/ 4 \) = - 2$. Replacing the eight factors one at a time costs at most $8 parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$. Thus $mu^(* 8)$ converges to uniform. These physical blocks have total length $8 T = 8 \( 1 + 32 dot.op 1024 \) d = 262152 d$, so $mu^(* 8) = q_d^(* \( 262152 d \))$. Equation (2.2) gives the same error from every start. ◻
]

== 15 Character smoothing from half-deck information <frames:char:section>

We now use half-deck information to control the Fourier matrix of the whole permutation. Fix one coordinate half-partition for a block, let $P$ denote a long segment of coordinate layers, and let $B$ be an independent pass within each half. For a unitary representation $rho$, write $F = bb(E) rho \( B \)$. There are two useful orders for these segments:

$ upright("block") & upright("Fourier matrix") & upright("positive form obtained by convexity")\
B P & F thin bb(E) rho \( P \) & rho \( P \)^(*) F^(*) F rho \( P \)\
P B & \( bb(E) rho \( P \) \) F & rho \( P \) F F^(*) rho \( P \)^(*) $

In the first order, the pass acts on fixed output halves of $P$. The conjugated form can be controlled by preimages of those halves. In the second order, the pass acts on fixed input halves of $P$. We will repair their image laws, then average the resulting subgroup coordinates one at a time. The two coordinates may remain dependent. We first establish the common half-list and one-pass inputs, and then carry out these two conversions.

#thm([Theorem 15.1.])[
  #emph[Let $n = 2^d$, and count one physical Thorp shuffle as one time step, using $n \/ 2$ independent fair switches. For all sufficiently large integers $d$, the worst-initial-deck total-variation mixing time at threshold $1 \/ 4$ satisfies 
$ d lt.eq t_(upright("mix")) \( d \) lt.eq 6060000 d . $

 In fact, the worst-initial-deck distance at time $60000 \( 101 d - 1 \)$ tends to zero as $d arrow.r oo$.]
] <frames:char:main>

=== 15.1 The shared half-list input <frames:char:marginals>

We retain the convention that permutations send initial labels to positions and that later layers multiply on the left. Write $C_v$ for the matching subgroup in direction $v eq.not 0$. Removing the deterministic coordinate rotation from the physical shuffle gives independent uniform layers in $C_(b_t)$, where $b_1 \, b_2 \, dots.h$ cycles through the coordinate basis. A block may begin at any phase of this cycle.

#thm([Lemma 15.2.])[
  #emph[Let $pi$ be the product of $L = 100 d$ consecutive layers in a periodic coordinate order on $n = 2^d$ positions. Uniformly over ordered lists of $q lt.eq n \/ 2$ distinct inputs, the law of their images under $pi$ has total-variation distance $o \( 1 \)$ from the uniform ordered injection. The same assertion holds for $pi^(- 1)$. Both assertions are uniform in the starting phase and the order of the coordinate axes.]
] <frames:char:half-list>

#proof[
  Proposition 18 covers every periodic ordering of the standard axes, including every starting phase, and the inverse product obtained by reversing independent involutive layers. With its omitted-block parameter equal to $2$ and time $T = 100 d$, it gives, for $eta = pi$ or $eta = pi^(- 1)$,
  $ parallel cal(L) \( eta \( c_1 \) \, dots.h \, eta \( c_q \) \) - pi_q parallel_(upright("TV")) lt.eq n^(3 \/ 2) / 2 (e^(- 99 d \/ 8) + 2 e^(- n \/ 16))^(1 \/ 2) = o \( 1 \) \, $
  where $pi_q$ is the uniform ordered injection law. The fixed-list estimate uses the hidden-card vector from the chronological field (4.1). The terminal comparison uses (4.9) with $Lambda = upright(bold(v))$, disclosing the complete schedule and only the complete predecessor paths.
  For the independent shear realization of the coordinate chain, (8.11) gives the local block identity
  #[#set math.equation(numbering: n => "(15.1)")
   $ B_0 = I \, #h(2em) M_t = B_t^(- 1) Q_t B_(t - 1) \, #h(2em) pi = Q_L dots.h.c Q_1 = B_L M_L dots.h.c M_1 . $ <frames:char:conjugated-layers>]
  Here $Q_t$ are the original coordinate layers and $M_t$ the virtual layers coupled to them. Conditional on the independent shears, the $M_t$ are independent uniform matching switches. The known terminal $B_L$ relabels only final positions, so the specified input list is unchanged. Equation (8.9) identifies its virtual terminal posterior with its chronological vector after all shears are disclosed. The independent shear realization starts with $B_0 = I$; the general first-basis realization retains the input map $L_0^(- 1)$ from (3.9). ◻
]

=== 15.2 The character input and the trace of one pass <frames:char:trace-subsection>

We use a unitary realization of each irreducible type of a symmetric group. For type $alpha$, write $D_alpha$ for its degree and $chi_alpha$ for its character. We use the ordinary, unnormalized Hilbert–Schmidt norm. For $m gt.eq 2$ and $u in S_m$, let $c_i \( u \)$ be the number of $i$-cycles and define $e_1 \, dots.h \, e_m$ by

$ sum_(i = 1)^k e_i = frac(log max { 1 \, sum_(i = 1)^k i c_i \( u \) }, log m) quad \( 1 lt.eq k lt.eq m \) \, #h(2em) E \( u \) = sum_(i = 1)^m e_i / i . $

The $e_i$ are nonnegative and sum to one. Larsen and Shalev’s theorem states that, for every $epsilon.alt > 0$, for all sufficiently large $m$ depending only on $epsilon.alt$, and uniformly over $u$ and $alpha$,

#[#set math.equation(numbering: n => "(15.2)")
 $ \| chi_alpha \( u \) \| lt.eq D_alpha^(E \( u \) + epsilon.alt) . $ <frames:char:LS>]

See [13] Theorem 1.1 and the formulation with fixed slack in [12] Definition 2.1 and Theorem 2.2. If $u$ has at most $m^(9 \/ 10)$ fixed points, then $E \( u \) lt.eq e_1 + \( 1 - e_1 \) \/ 2 lt.eq 19 \/ 20$. Taking $epsilon.alt = 3 \/ 100$ gives

#[#set math.equation(numbering: n => "(15.3)")
 $ frac(\| chi_alpha \( u \) \|, D_alpha) lt.eq D_alpha^(- 1 \/ 50) . $ <frames:char:few-fixed>]

This is a pointwise bound and requires no centrality of a shuffle law.

For every fixed $s > 0$, the Witten-zeta estimate is

#[#set math.equation(numbering: n => "(15.4)")
 $ sum_(alpha in hat(S_m)) D_alpha^(- s) = 2 + o \( 1 \) quad \( m arrow.r oo \) . $ <frames:char:zeta>]

See [14] Theorems 1.1 and 2.6 and [12] Theorem 2.14. In particular the complete sum at $s = 1$ is bounded by an absolute $C_zeta$ for every $m gt.eq 1$, and the sum with the trivial and sign types removed tends to zero. Lemma 6.4 of [22] supplies an elementary proof of these last facts.

#thm([Lemma 15.3.])[
  #emph[Let $b = 2^h$ and let $Y$ apply each of the $h$ coordinate layers once, in any order, using independent fair switches. For every irreducible representation $rho_alpha$ of $S_b$, put $T_alpha = bb(E) rho_alpha \( Y \)$. Uniformly for all sufficiently large $b$, 
$ frac("tr" \( T_alpha^(*) T_alpha \), D_alpha) = frac("tr" \( T_alpha T_alpha^(*) \), D_alpha) lt.eq 2 D_alpha^(- 1 \/ 100) . $

]
] <frames:char:one-pass>

#proof[
  Let $Y'$ be an independent copy and put $u = \( Y' \)^(- 1) Y$. Independence and unitarity give
  $ frac("tr" \( T_alpha^(*) T_alpha \), D_alpha) = bb(E) frac(chi_alpha \( u \), D_alpha) lt.eq bb(E) frac(\| chi_alpha \( u \) \|, D_alpha) . $
  If $f$ counts the fixed points of $u$, then, for $1 lt.eq k lt.eq b$,
  #[#set math.equation(numbering: n => "(15.5)")
   $ Pr \( f gt.eq k \) lt.eq binom(b, k) b^(- k \/ 2) . $ <frames:char:fixed-tail>]
  Indeed, condition on $Y'$ and prescribe $Y \( x \) = Y' \( x \)$ at a chosen set of $k$ inputs. Each input-output pair determines one route because each coordinate is updated once. A consistent family of routes visits at least $h k \/ 2$ distinct switch bits: a switch serves at most two routes. It therefore has probability at most $2^(- h k \/ 2) = b^(- k \/ 2)$. A union bound over the input set proves (15.5).
  Write $D = D_alpha$. The assertion is immediate for $D = 1$. For $D > 1$ set
  $ kappa = frac(log D, 2 log b) \, #h(2em) k = ⌊max { b^(9 \/ 10) \, kappa }⌋ + 1 . $
  Since $D^2 lt.eq b !$, one has $kappa lt.eq b \/ 4$, so $k lt.eq b$ for large $b$. For $k gt.eq b^(9 \/ 10)$ and sufficiently large $b$,
  $ binom(b, k) b^(- k \/ 2) lt.eq (frac(e b^(1 \/ 2), k))^k lt.eq b^(- k \/ 4) lt.eq D^(- 1 \/ 8) . $
  Outside an event of probability at most $D^(- 1 \/ 8)$, therefore, $f lt.eq b^(9 \/ 10)$ or $f lt.eq kappa$. The first case is covered by (15.3). In the second, restrict $rho_alpha$ to the symmetric group on the $b - f$ moving points. Every irreducible constituent of degree $E$ satisfies
  $ E gt.eq frac(D, \[ S_b : S_(b - f) \]) gt.eq b^(- f) D gt.eq D^(1 \/ 2) . $
  For the first inequality, translates of one constituent subspace by coset representatives span a nonzero $S_b$-invariant subspace and hence the whole irreducible representation. Since $f lt.eq kappa lt.eq b \/ 4$, the moving-point group has size tending uniformly to infinity. The permutation has no fixed points there. Applying (15.3) to each constituent and averaging with its dimension weight, including multiplicity, bounds the normalized character by $D^(- 1 \/ 100)$. On the exceptional event use the bound one. Thus the normalized trace is at most $D^(- 1 \/ 100) + D^(- 1 \/ 8) lt.eq 2 D^(- 1 \/ 100)$. ◻
]

===== 15.2.1 An alternative restriction estimate. <an-alternative-restriction-estimate.>

The preceding proof lower-bounds every constituent degree after fixed points are removed. A distinct Young-branching argument controls the number of constituents and gives another estimate for the same trace.

#thm([Lemma 15.4.])[
  #emph[Let $s = 2^ell$ and let $G_s$ be a sweep using each of the $ell$ coordinate directions once, in any order, with independent fair switches. There are absolute $a > 0 \, C_1 < oo$ such that, for every sufficiently large $s$ and every complex irreducible representation $rho_alpha$ of $S_s$, 
$ q_alpha := D_alpha^(- 1) ∥bb(E) rho_alpha \( G_s \)∥_(upright("HS"))^2 lt.eq C_1 D_alpha^(- a) . $

 The Hilbert–Schmidt norm uses the ordinary, unnormalized trace.]
] <char:sweep-trace>

#proof[
  For a permutation of $m$ points with at most $m^(4 \/ 5)$ fixed points, one has $e_1 lt.eq 4 \/ 5$ and hence $E \( g \) lt.eq 9 \/ 10$. Applying (15.2) with slack $1 \/ 20$ yields
  #[#set math.equation(numbering: n => "(15.6)")
   $ \| chi_alpha \( g \) \| lt.eq D_alpha^(19 \/ 20) $ <char:few-fixed>]
  for all sufficiently large $m$, uniformly in $g$ and $alpha$.
  Let $G'_s$ be an independent copy, put $u = \( G'_s \)^(- 1) G_s$, let $f$ count its fixed points, and write $D = D_alpha$. As in the preceding trace calculation, $q_alpha = bb(E) chi_alpha \( u \) \/ D$. The case $D = 1$ is immediate. When $f lt.eq s^(4 \/ 5)$, (15.6) bounds the absolute normalized character by $D^(- 1 \/ 20)$. Suppose instead that
  $ s^(4 \/ 5) < f lt.eq kappa := frac(log D, 2 log s) . $
  Since $D lt.eq s ! lt.eq s^s$, one has $kappa lt.eq s \/ 2$ and hence $f lt.eq s \/ 2$ in this case. The moving-point group therefore has size tending uniformly to infinity. Iterated Young branching [11] Theorem 9.2 expresses the restriction to that group as at most $s^f$ irreducible summands counted with multiplicity. If their degrees are $E_1 \, dots.h \, E_r$, then $sum_j E_j = D$. The permutation is fixed-point-free on this group. Applying (15.6) there and using concavity gives
  $ \| chi_alpha \( u \) \| lt.eq sum_(j = 1)^r E_j^(19 \/ 20) lt.eq r^(1 \/ 20) D^(19 \/ 20) lt.eq s^(f \/ 20) D^(19 \/ 20) lt.eq D^(39 \/ 40) . $
  For the remaining event take $k = floor.l max { s^(4 \/ 5) \, kappa } floor.r + 1$, which lies in $\[ 1 \, s \]$ for large $s$. The unique-route tail (15.5), with $s$ in place of $b$, gives for large $s$
  $ Pr \( f gt.eq k \) lt.eq binom(s, k) s^(- k \/ 2) lt.eq \( e s^(1 \/ 2) \/ k \)^k lt.eq s^(- k \/ 5) lt.eq D^(- 1 \/ 10) . $
  The normalized trace is consequently at most $D^(- 1 \/ 40) + D^(- 1 \/ 10) lt.eq 2 D^(- 1 \/ 40)$. This proves the stated existence with the distinct branching conclusion $a = 1 \/ 40$ and $C_1 = 2$. ◻
]

The following two conversions use the shared bound with exponent $1 \/ 100$. The alternative above gives the stronger trace exponent $1 \/ 40$ through the different restriction argument.

=== 15.3 Smoothing after the mixing segment: capped preimages <frames:char:smoothing>

For the first block order, take $L = 100 d$ layers with product $pi$, followed by $d - 1$ layers with product $sigma$. The last layers omit one coordinate and preserve its two halves $J_0 \, J_1$, each of size $b = n \/ 2$. Their fair coins give independent one-pass permutations $sigma_0 \, sigma_1$ on these halves, independent also of $pi$. A block has length $101 d - 1$. Its phase and its missing axis may change from one block to the next.

Fix an ordering of each $J_j$, and let $Q_j \( pi \)$ be its ordered preimage list. Lemma 60 gives a bound $epsilon.alt_n = o \( 1 \)$ for the distance of each list law $nu_j$ from the uniform injection law $U_b$, uniformly in phase. Delete every $pi$ for which either list has density greater than two, and condition on what remains. If $B_j$ is the excluded set of lists, then

$ nu_j \( B_j \) lt.eq 2 #scale(x: 120%, y: 120%)[\(] nu_j \( B_j \) - U_b \( B_j \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 epsilon.alt_n . $

The retained event has probability at least $1 - 4 epsilon.alt_n$. For large $n$ it has probability at least one half, so each separate preimage marginal in the modified law is bounded by $4 U_b$. The modification costs at most $4 epsilon.alt_n$ in total variation. The independent passes are unchanged.

#thm([Lemma 15.5.])[
  #emph[For even $n gt.eq 6$, every irreducible representation of $S_n$ other than trivial and sign has degree at least $n \/ 2$.]
] <frames:char:minimum-degree>

#proof[
  Restrict to the elementary abelian subgroup generated by a fixed matching of $n \/ 2$ transpositions. If every constituent assigns the same sign to all these generators, their representing matrices are equal. Conjugation then makes any two disjoint transpositions have equal matrices. A third transposition disjoint from two overlapping ones exists when $n gt.eq 6$, so all transpositions have the same matrix. The image is generated by one involution, and irreducibility gives the trivial or sign representation. Otherwise a constituent assigns negative sign to exactly $r$ generators, with $1 lt.eq r lt.eq n \/ 2 - 1$. The normalizer permutes the matching pairs, so all $binom(n \/ 2, r) gt.eq n \/ 2$ reordered characters occur. Their eigenspaces are linearly independent. ◻
]

#thm([Proposition 15.6.])[
  #emph[There is an absolute $C_0$ such that, for every sufficiently large $n = 2^d$, every modified block above, and every irreducible $rho$ of $S_n$ of degree $D$ other than trivial or sign, 
$ parallel bb(E) rho \( sigma pi \) parallel_(upright("op")) lt.eq C_0 D^(- 1 \/ 20000) . $

 The modified block has zero sign coefficient. These statements are uniform in its starting phase.]
] <frames:char:block-norm>

#proof[
  Let $G_j$ be the symmetric group supported on $J_j$ and put $H = G_0 times G_1$. If a positive operator $Q$ commutes with $rho \( G_(1 - j) \)$, then $rho \( pi \)^(*) Q rho \( pi \)$ is determined by $Q_j \( pi \)$. Indeed, equal ordered preimages of $J_j$ mean $pi' pi^(- 1) in G_(1 - j)$. The separate marginal cap and positivity therefore give, for every unit vector $v$,
  #[#set math.equation(numbering: n => "(15.7)")
   $ bb(E) chevron.l rho \( pi \) v \, Q rho \( pi \) v chevron.r lt.eq 4 thin bb(E)_(g tilde.op U_(S_n)) chevron.l rho \( g \) v \, Q rho \( g \) v chevron.r = 4 thin frac("tr" Q, D) . $ <frames:char:schur-cap>]
  The final equality is Schur averaging. This comparison uses one capped preimage marginal at a time; it imposes no joint density bound.
  Set $A_j = bb(E) rho \( sigma_j \)$ and $A = A_0 A_1$. These factors and their adjoints commute, and they are contractions. Independence and convexity give
  #[#set math.equation(numbering: n => "(15.8)")
   $ parallel A thin bb(E) rho \( pi \) v parallel^2 lt.eq bb(E) chevron.l rho \( pi \) v \, A^(*) A rho \( pi \) v chevron.r . $ <frames:char:convexity>]
  For each $j$, let $P_(j \, lt.eq)$ select the full $G_j$-isotypic spaces of degree at most $D^(1 \/ 100)$, and put $P_(j \, >) = I - P_(j \, lt.eq)$. These projections commute with $H$ and with each other. On a joint half-type, write $X_j = A_j^(*) A_j$. The $X_j$ are positive contractions on separate tensor factors. If type $j$ is large, $X_0 X_1 prec.curly.eq X_j$; if both types are small, $X_0 X_1 prec.curly.eq I$. Hence
  #[#set math.equation(numbering: n => "(15.9)")
   $ A^(*) A prec.curly.eq A_0^(*) A_0 P_(0 \, >) + A_1^(*) A_1 P_(1 \, >) + P_(0 \, lt.eq) P_(1 \, lt.eq) . $ <frames:char:positive-comparison>]
  Every term is positive. The first two commute with the complementary half group, and the last commutes with both groups, so (15.7) applies to each.
  On each $G_j$-type selected by $P_(j \, >)$, Lemma 61 bounds the normalized trace by $2 D_alpha^(- 1 \/ 100) lt.eq 2 D^(- 1 \/ 10000)$. Averaging with the restriction dimension weights, including all multiplicities, gives
  #[#set math.equation(numbering: n => "(15.10)")
   $ 1 / D "tr" \( A_j^(*) A_j P_(j \, >) \) lt.eq 2 D^(- 1 \/ 10000) . $ <frames:char:large-trace>]
  It remains to bound the fraction of the space on which both half-types are small. If $m_(alpha beta)$ is the multiplicity of $alpha ⊗ beta$ in $rho \|_H$, then
  #[#set math.equation(numbering: n => "(15.11)")
   $ m_(alpha beta) lt.eq sqrt(b + 1) thin D_alpha D_beta . $ <frames:char:multiplicity>]
  By Frobenius reciprocity [8] Theorem 4.33, $m_(alpha beta)$ is the multiplicity of $rho$ in $W = "Ind"_H^(S_n) \( alpha ⊗ beta \)$, so $m_(alpha beta)^2 lt.eq dim "End"_(S_n) \( W \)$. Realize $W$ in fibers of dimension $D_alpha D_beta$ over $S_n \/ H$. An equivariant block map at one representative ordered pair of cosets determines its transported maps on that pair orbit. The stabilizer can impose linear constraints on the representative map and can only reduce the number of choices. Cosets correspond to $b$-subsets, and intersection size classifies their ordered-pair orbits, of which there are $b + 1$. Each representative map has at most $\( D_alpha D_beta \)^2$ parameters. This proves (15.11).
  The complete inverse-first sum gives
  $ sum_(D_alpha lt.eq D^(1 \/ 100)) D_alpha^2 lt.eq D^(3 \/ 100) sum_(alpha in hat(S_b)) D_alpha^(- 1) lt.eq C_zeta D^(3 \/ 100) . $
  Lemma 63 gives $b lt.eq D$. Therefore
  #[#set math.equation(numbering: n => "(15.12)")
   $ frac("tr" \( P_(0 \, lt.eq) P_(1 \, lt.eq) \), D) lt.eq sqrt(b + 1) / D (sum_(D_alpha lt.eq D^(1 \/ 100)) D_alpha^2)^2 = O \( D^(- 1 \/ 2 + 6 \/ 100) \) . $ <frames:char:small-trace>]
  Equations (15.7)–(15.12) bound the squared operator norm by $16 D^(- 1 \/ 10000) + O \( D^(- 1 \/ 2 + 6 \/ 100) \)$. Taking square roots proves the stated exponent. Finally, the pass $sigma$ contains an independent fair switch for large $d$. Toggling it changes sign, and its independence from the modified $pi$ gives zero sign coefficient for the block. ◻
]

=== 15.4 Completion of the capped-preimage route <frames:char:amplification>

#proof[
  Take $r = 60000$ successive blocks, modifying their long segments independently. The product law $mu$ differs from the unmodified product by at most $r thin o \( 1 \) = o \( 1 \)$. The block phases may differ, but the estimates are uniform. Their Fourier matrices multiply in chronological order, and Proposition 64 gives
  $ parallel bb(E)_mu rho parallel_(upright("op")) lt.eq C_1 D_rho^(- 3) \, #h(2em) C_1 = C_0^60000 \, #h(2em) rho in.not { upright(bold(1)) \, "sign" } . $
  The sign coefficient is zero. Plancherel, the Hilbert–Schmidt inequality, and Lemma 63 yield
  $ 4 parallel mu - U_(S_n) parallel_(upright("TV"))^2 lt.eq C_1^2 sum_(rho in.not { upright(bold(1)) \, "sign" }) D_rho^(- 4) lt.eq C_1^2 \( 2 \/ n \)^3 sum_(rho in hat(S_n)) D_rho^(- 1) = o \( 1 \) . $
  Restoring the modified segments still costs $o \( 1 \)$.
  The unmodified coordinate product has $t = 60000 \( 101 d - 1 \)$ layers and equals $R^(- t) Y_t$ in the notation of Section 3. Restoring the one terminal rotation preserves uniform measure and total variation even when $t$ is not divisible by $d$. A deterministic initial deck is a right translate, so it has the same distance. Since $t lt.eq 6060000 d$, the upper bound follows. The lower bound is the earlier one-card or support lower bound. ◻
]

== 16 Exact half-deck marginals and character amplification <sec:character>

The preceding conversion placed a pass after a mixing segment and used ordered preimages of the output halves. We now take a block $A_0 B$, with a pass $B$ within the two input halves followed by a mixing segment $A_0$. The shared half-list estimate controls the ordered images of those halves. We will change the mixing law by $o \( 1 \)$ in total variation until both image injections are exactly uniform. This produces a uniform output partition and two conditionally uniform bijection marginals, which may remain dependent.

#thm([Theorem 16.1.])[
  (Half-deck repair and character amplification).  #emph[There are absolute positive integers $C \, K$ such that the Thorp shuffle on $n = 2^d$ cards has worst-start total-variation distance tending to zero from uniform after 
$ K #scale(x: 120%, y: 120%)[\(] \( d - 1 \) + C d #scale(x: 120%, y: 120%)[\)] $

 physical shuffles. For every fixed ordered list of $n \/ 2$ distinct input positions, its image after $C d$ consecutive coordinate layers is within $o \( 1 \)$ of the uniform injection, uniformly in the input list and the starting phase of the coordinate cycle.]
] <char:main>

Lemma 60 supplies an absolute choice of $C$: its $100 d$ case is enough for the half-deck assertion. We keep $C$ symbolic in the block length. The proof below supplies absolute $C_2 \, delta > 0$ and permits any fixed positive integer $K$ with $K delta > 3$. Blocks may start at any phase, and their length need not be a multiple of $d$.

=== 16.1 Repairing both image injections <char:jointrepair>

We first turn the two approximate image laws into exact conditional marginals while allowing the two coordinates to remain dependent.

#thm([Lemma 16.2.])[
  (Simultaneous marginal repair).  #emph[Partition a set of size $2 s$ into two ordered sets $J_1 \, J_2$, each of size $s$. Let $A_0$ be a random permutation. Suppose the ordered image of $J_i$ under $A_0$ has total-variation distance $epsilon.alt_i$ from a uniform injection. Let $epsilon.alt_(upright("part"))$ be the distance of the ordered output partition $\( A_0 J_1 \, A_0 J_2 \)$ from its uniform law. There is a permutation law $A$ whose two ordered image marginals are exactly uniform and such that 
#[#set math.equation(numbering: n => "(16.1)")
 $ parallel cal(L) \( A \) - cal(L) \( A_0 \) parallel_(upright("TV")) lt.eq epsilon.alt_1 + epsilon.alt_2 + 3 epsilon.alt_(upright("part")) . $ <char:repaircost>]

 Conditional on its output partition, each of the two bijections is uniform. Their joint law may be dependent.]
] <char:repair>

#proof[
  Write $S = \( S_1 \, S_2 \)$ for an output partition and $p \, u$ for its actual and uniform laws. For fixed $S$, a permutation is a pair of bijections $J_i arrow.r S_i$. Let $mu_S$ be their conditional joint law, with marginals $mu_(i \, S)$, and let $U_(i \, S)$ be uniform on the $i$th bijection space. Either injection determines $S$ completely. The uniform injection law has partition marginal $u$ and conditional bijection law $U_(i \, S)$. Replacing $u$ by $p$ in this target changes it by exactly $epsilon.alt_(upright("part"))$ in total variation. The triangle inequality therefore gives
  $ sum_S p \( S \) parallel mu_(i \, S) - U_(i \, S) parallel_(upright("TV")) lt.eq epsilon.alt_i + epsilon.alt_(upright("part")) . $
  For every $S$ with $p \( S \) > 0$, take a maximal coupling of $mu_(i \, S)$ with $U_(i \, S)$ for each $i$. Given the original pair, apply the two coupling kernels using separate auxiliary randomness. Each resulting coordinate has its prescribed uniform marginal. The probability that the pair changes is at most the sum of the two marginal coupling errors. Thus replacing the conditional joint laws while retaining $p$ costs at most $epsilon.alt_1 + epsilon.alt_2 + 2 epsilon.alt_(upright("part"))$. On partitions of zero $p$-mass choose any joint law with uniform marginals. Finally replace $p$ by $u$, retaining these conditional joint laws. This costs exactly $epsilon.alt_(upright("part"))$ and proves (16.1). ◻
]

Take a block whose first $d - 1$ layers have product $B$ and whose next $C d$ layers have product $A_0$. The first part omits one coordinate and preserves its two halves $J_1 \, J_2$, each of size $s = n \/ 2$. Its switch coins are independent across the halves, so $B$ consists of independent one-pass permutations on them. Lemma 60 gives $epsilon.alt_i = o \( 1 \)$ for the two ordered image injections of $A_0$, uniformly in the block phase. Also $epsilon.alt_(upright("part")) lt.eq min \( epsilon.alt_1 \, epsilon.alt_2 \)$, since either injection determines the partition. Apply Lemma 66 to $A_0$, and sample the repaired $A$ independently of $B$. The law of $A B$ is within $o \( 1 \)$ in total variation of the law of $A_0 B$, uniformly in the starting phase.

=== 16.2 Averaging with dependent subgroup coordinates <averaging-with-dependent-subgroup-coordinates>

We now turn the exact conditional marginals into an operator bound. Write $H = S_(J_1) times S_(J_2)$, where $S_(J_i)$ is the symmetric group supported on $J_i$. Let $rho_lambda$ be a unitary irreducible representation of $S_n$ on a space $V_lambda$ of dimension $D = D_lambda$. Its restriction to $H$ is

$ V_lambda \|_H = xor.big_(alpha \, beta tack.r s) \( V_alpha ⊗ V_beta \) ⊗ bb(C)^(m_(alpha beta)^lambda) . $

Let $P_(alpha beta)$ be the corresponding orthogonal isotypic projection, including the full multiplicity space.

We shall use

#[#set math.equation(numbering: n => "(16.2)")
 $ m_(alpha beta)^lambda lt.eq D_beta lt.eq D_alpha D_beta . $ <char:LR>]

By Frobenius reciprocity [8] Theorem 4.33 and the Littlewood–Richardson rule, $m_(alpha beta)^lambda = 0$ when $alpha$ is not contained in $lambda$. Otherwise the multiplicity counts semistandard skew tableaux of shape $lambda \/ alpha$ and content $beta$ whose reading words are lattice words [11] Definitions 15.2, 15.6 and 16.1; Theorem 16.4. Read a tableau from right to left along successive rows, starting at the top. The word determines the tableau, so these words inject into all lattice words of content $beta$. A lattice word $w_1 \, dots.h \, w_s$ determines a standard tableau of shape $beta$: place $j$ in the next cell of row $w_j$. Rows increase by construction, and the condition that every prefix row-count vector is a partition gives the column inequalities. Conversely a standard tableau supplies the word by recording the row containing each of $1 \, dots.h \, s$. There are $D_beta$ such tableaux, proving (16.2).

Put

$ F = bb(E) rho_lambda \( B \) \, #h(2em) M = bb(E) rho_lambda \( A B \) . $

Independence gives $M = \( bb(E) rho_lambda \( A \) \) F$. The covariance identity for $Z = rho_lambda \( A \) F$ yields

#[#set math.equation(numbering: n => "(16.3)")
 $ M M^(*) lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] rho_lambda \( A \) F F^(*) rho_lambda \( A \)^(*) #scale(x: 120%, y: 120%)[\]] \, $ <char:psd>]

because the difference is $bb(E) \[ \( Z - bb(E) Z \) \( Z - bb(E) Z \)^(*) \]$. For fixed $A$, this conjugation carries the $H$-isotypic projections to those for the output partition $\( A J_1 \, A J_2 \)$, which the repair makes uniform.

For a one-pass permutation $G_s$ on a half, write

$ T_alpha = bb(E) rho_alpha \( G_s \) \, #h(2em) X_alpha = T_alpha T_alpha^(*) \, #h(2em) q_alpha = frac("tr" X_alpha, D_alpha) . $

The two half-passes are independent, so on the $alpha beta$ isotypic block,

$ F F^(*) = X_alpha ⊗ X_beta ⊗ I_(m_(alpha beta)^lambda) . $

Each $T_alpha$ is a contraction. Thus $0 lt.eq X_alpha lt.eq I$ and $0 lt.eq q_alpha lt.eq 1$. The common one-pass estimate in Lemma 61 applies in every axis order and gives, for all sufficiently large $s = 2^(d - 1)$,

#[#set math.equation(numbering: n => "(16.4)")
 $ q_alpha = frac("tr" \( T_alpha T_alpha^(*) \), D_alpha) = frac("tr" \( T_alpha^(*) T_alpha \), D_alpha) lt.eq 2 D_alpha^(- 1 \/ 100) . $ <char:shared-sweep-bound>]

We use this bound below with $C_1 = 2$ and $a = 1 \/ 100$.

Conditional on an output partition $S$, choose a fixed transporter $L_S$ from $\( J_1 \, J_2 \)$ to $S$. The repaired permutation has the form $A = L_S \( h_1 \, h_2 \)$, where each $h_i$ has the uniform marginal on $S_(J_i)$ conditional on $S$. On the $alpha beta$ block define

$ cal(C)_(alpha beta \, S) = bb(E) [ & #scale(x: 120%, y: 120%)[\(] rho_alpha \( h_1 \) X_alpha rho_alpha \( h_1 \)^(*) #scale(x: 120%, y: 120%)[\)] ⊗ #scale(x: 120%, y: 120%)[\(] rho_beta \( h_2 \) X_beta rho_beta \( h_2 \)^(*) #scale(x: 120%, y: 120%)[\)]\
 & #h(35mm)  ⊗ I_(m_(alpha beta)^lambda) thin mid(bar.v) thin S] . $

Since $X_beta lt.eq I$, pointwise positivity and then Schur averaging over the $h_1$ marginal give

$ cal(C)_(alpha beta \, S) & lt.eq bb(E) #h(-0.16667em) [rho_alpha \( h_1 \) X_alpha rho_alpha \( h_1 \)^(*) thin mid(bar.v) thin S] ⊗ I_(V_beta) ⊗ I_(m_(alpha beta)^lambda)\
 & = q_alpha I_(V_alpha) ⊗ I_(V_beta) ⊗ I_(m_(alpha beta)^lambda) . $

Interchanging the two factors gives the same bound with $q_beta$. After embedding this block in $V_lambda$ and conjugating by $rho_lambda \( L_S \)$, its contribution to (16.3) is at most

$ min \( q_alpha \, q_beta \) thin rho_lambda \( L_S \) P_(alpha beta) rho_lambda \( L_S \)^(*) . $

Each bound used only one conditional marginal, so it holds for every coupling of $h_1$ and $h_2$.

The ordered partition $S$ is uniform on $S_n \/ H$. Since $P_(alpha beta)$ commutes with $H$, its conjugate is independent of the choice of transporter. Its average over the cosets is therefore its average over $S_n$, which Schur’s lemma identifies as $\( "rank" P_(alpha beta) \/ D \) I$. Summing the positive blocks in (16.3) gives

#[#set math.equation(numbering: n => "(16.5)")
 $ parallel M parallel_(upright("op"))^2 lt.eq sum_(alpha \, beta) frac(m_(alpha beta)^lambda D_alpha D_beta, D) min \( q_alpha \, q_beta \) . $ <char:minbound>]

The coefficients are nonnegative and sum to one, including every restriction multiplicity.

Put $x = D_alpha D_beta$. If $x > D^(1 \/ 8)$, at least one of the two dimensions exceeds $D^(1 \/ 16)$. Equation (16.4) then bounds the total contribution of these types by $C_1 D^(- a \/ 16) = 2 D^(- 1 \/ 1600)$. For the remaining types use $q_alpha \, q_beta lt.eq 1$ and (16.2), which bounds each rank weight by $x^2 \/ D$. Since $x lt.eq D^(1 \/ 8)$ implies $x^2 lt.eq D^(3 \/ 8) x^(- 1)$, their total weight is at most

$ D^(- 5 \/ 8) sum_(alpha \, beta) \( D_alpha D_beta \)^(- 1) lt.eq C_zeta^2 D^(- 5 \/ 8) . $

Here the complete inverse-first-degree sum is uniformly bounded as stated after (15.4). Thus there is an absolute $C_2 < oo$ such that, with $delta = min { a \/ 16 \, 5 \/ 8 } = 1 \/ 1600$,

#[#set math.equation(numbering: n => "(16.6)")
 $ parallel bb(E) rho_lambda \( A B \) parallel_(upright("op"))^2 lt.eq C_2 D_lambda^(- delta) . $ <char:block-bound>]

For the sign representation the block average is exactly zero once $d gt.eq 2$: $B$ contains an independent fair switch, and the repair of $A_0$ left $B$ unchanged and independent of $A$.

=== 16.3 Independent blocks and physical time <char:completion>

#proof[
  Choose $C$ from the shared half-list lemma and a fixed positive integer $K$ with $K delta > 3$. Take $K$ successive blocks, repairing each $A_0$ independently. The phases and omitted coordinates may differ, but the estimates above are uniform over these choices. Let $mu$ be the product law of the repaired blocks. Its Fourier matrix is a product of $K$ matrices satisfying (16.6). Using submultiplicativity of the operator norm and $parallel Q parallel_(upright("HS")) lt.eq sqrt(D) parallel Q parallel_(upright("op"))$, Plancherel gives
  $ 4 parallel mu - U_n parallel_(upright("TV"))^2 lt.eq C_2^K sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(2 - K delta) = o \( 1 \) . $
  Indeed $2 - K delta < - 1$, and the inverse-first-degree sum outside the trivial and sign representations tends to zero. The sign term vanishes exactly. This estimate uses no normality of the Fourier matrices.
  Undoing all $K$ repairs costs $o \( 1 \)$ by coupling the independent blocks, since $K$ is fixed. Their original total length is $K \( \( d - 1 \) + C d \)$ coordinate layers. At that single terminal time, the relation $Y_t = R^t X_t$ from Section 3 restores the deterministic coordinate rotation. It preserves uniform measure and total variation, whether or not the block length is divisible by $d$. Each coordinate layer represents one physical shuffle. Finally, applying the position permutation to any fixed deck is a bijection of the state spaces, so the same convergence holds with the stated worst-start quantifier. ◻
]

#heading(level: 1)[References]
#bibitem([1])[D.~Aldous and P.~Diaconis, Strong uniform times and finite random walks, #emph[Advances in Applied Mathematics] #strong[8] (1987), 69--97. The cited Section~8b, Example~(12), is on page~95 of the published text.]
#bibitem([2])[N.~Alon and S.~Lovett, Almost $k$-wise vs.~$k$-wise independent permutations, and uniformity for general group actions, #emph[Theory of Computing] #strong[9] (2013), article~15, 559--577. #link("https://doi.org/10.4086/toc.2013.v009a015")[doi:`10.4086/toc.2013.v009a015`].]
#bibitem([3])[K.~Azuma, Weighted sums of certain dependent random variables, #emph[Tôhoku Mathematical Journal] (2) #strong[19] (1967), no.~3, 357--367. #link("https://doi.org/10.2748/tmj/1178243286")[doi:`10.2748/tmj/1178243286`].]
#bibitem([4])[A.~Czumaj, Random permutations using switching networks, #emph[Proceedings of STOC 2015], 2015, 703--712. #link("https://doi.org/10.1145/2746539.2746629")[doi:`10.1145/2746539.2746629`].]
#bibitem([5])[A.~Czumaj and B.~Vöcking, Thorp shuffling, butterflies, and non-Markovian couplings, #emph[Automata, Languages, and Programming], Lecture Notes in Computer Science 8572, Springer, 2014, 344--355. #link("https://doi.org/10.1007/978-3-662-43948-7_29")[doi:`10.1007/978-3-662-43948-7_29`].]
#bibitem([6])[W.~Dai, V.~T.~Hoang, and S.~Tessaro, Information-theoretic indistinguishability via the chi-squared method, #emph[Advances in Cryptology---CRYPTO 2017], Part~III, Lecture Notes in Computer Science 10403, Springer, 2017, 497--523. #link("https://doi.org/10.1007/978-3-319-63697-9_17")[doi:`10.1007/978-3-319-63697-9_17`]. The proof locators refer to the full version revised November~16, 2019, #link("https://eprint.iacr.org/2017/537").]
#bibitem([7])[P.~Diaconis and M.~Shahshahani, Generating a random permutation with random transpositions, #emph[Zeitschrift für Wahrscheinlichkeitstheorie und verwandte Gebiete] #strong[57] (1981), 159--179. #link("https://doi.org/10.1007/BF00535487")[doi:`10.1007/BF00535487`].]
#bibitem([8])[P.~Etingof, O.~Golberg, S.~Hensel, T.~Liu, A.~Schwendner, D.~Vaintrob, and E.~Yudovina, #emph[Introduction to Representation Theory], Student Mathematical Library, vol.~59, American Mathematical Society, 2011. The cited locators refer to the author's lecture-note version, January~10, 2011: #link("https://math.mit.edu/~etingof/replect.pdf").]
#bibitem([9])[V.~T.~Hoang, B.~Morris, and P.~Rogaway, An enciphering scheme based on a card shuffle, #emph[Advances in Cryptology---CRYPTO 2012], Lecture Notes in Computer Science 7417, Springer, 2012, 1--13. The cited Section~3, Theorem~3, and Lemma~4 refer to #link("https://arxiv.org/abs/1208.1176v2")[arXiv:1208.1176v2], November~21, 2014.]
#bibitem([10])[W.~Hoeffding, Probability inequalities for sums of bounded random variables, #emph[Journal of the American Statistical Association] #strong[58] (1963), no.~301, 13--30. #link("https://doi.org/10.1080/01621459.1963.10500830")[doi:`10.1080/01621459.1963.10500830`].]
#bibitem([11])[G.~D.~James, #emph[The Representation Theory of the Symmetric Groups], Lecture Notes in Mathematics, vol.~682, Springer-Verlag, 1978.]
#bibitem([12])[N.~Keller, N.~Lifshitz, and O.~Sheinfeld, Improved covering results for conjugacy classes of symmetric groups via hypercontractivity, #emph[Forum of Mathematics, Sigma] #strong[12] (2024), e85, 1--19. #link("https://doi.org/10.1017/fms.2024.95")[doi:`10.1017/fms.2024.95`]. Definition~2.1 and Theorem~2.2 give the orbit-growth parameter and the uniform fixed-slack formulation of the Larsen--Shalev bound.]
#bibitem([13])[M.~Larsen and A.~Shalev, Characters of symmetric groups: sharp bounds and applications, #emph[Inventiones Mathematicae] #strong[174] (2008), no.~3, 645--687. #link("https://doi.org/10.1007/s00222-008-0145-7")[doi:`10.1007/s00222-008-0145-7`].]
#bibitem([14])[M.~W.~Liebeck and A.~Shalev, Fuchsian groups, coverings of Riemann surfaces, subgroup growth, random quotients and random walks, #emph[Journal of Algebra] #strong[276] (2004), no.~2, 552--601. #link("https://doi.org/10.1016/S0021-8693(03)00515-5")[doi:`10.1016/S0021-8693(03)00515-5`]. The cited Lemma~2.1 and Theorems~1.1 and~2.6 appear on pages~14, 4, and~16 of the #link("https://spiral.imperial.ac.uk/bitstreams/aa106926-a412-470a-8e0e-f513d424120e/download")[author's text]\; Proposition~2.5 on pages~15--16 supplies the supporting tail estimate.]
#bibitem([15])[R.~Montenegro and P.~Tetali, Mathematical aspects of mixing times in Markov chains, #emph[Foundations and Trends in Theoretical Computer Science] #strong[1] (2006), no.~3, 237--354. #link("https://doi.org/10.1561/0400000003")[doi:`10.1561/0400000003`].]
#bibitem([16])[B.~Morris, The mixing time of the Thorp shuffle, #emph[SIAM Journal on Computing] #strong[38] (2008), no.~2, 484--504. #link("https://doi.org/10.1137/050636231")[doi:`10.1137/050636231`]. Preprint: #link("https://arxiv.org/abs/math/0507307").]
#bibitem([17])[B.~Morris, The mixing time for simple exclusion, #emph[Annals of Applied Probability] #strong[16] (2006), no.~2, 615--635. #link("https://doi.org/10.1214/105051605000000728")[doi:`10.1214/105051605000000728`]. The cited Section~5.3, Lemma~12, refers to the IMS electronic reprint #link("https://arxiv.org/abs/math/0405157v2").]
#bibitem([18])[B.~Morris, Improved mixing time bounds for the Thorp shuffle and $L$-reversal chain, #emph[Annals of Probability] #strong[37] (2009), no.~2, 453--477. #link("https://doi.org/10.1214/08-AOP409")[doi:`10.1214/08-AOP409`]. Preprint: #link("https://arxiv.org/abs/0802.0339").]
#bibitem([19])[B.~Morris, Improved mixing time bounds for the Thorp shuffle, #emph[Combinatorics, Probability and Computing] #strong[22] (2013), no.~1, 118--132. #link("https://doi.org/10.1017/S0963548312000478")[doi:`10.1017/S0963548312000478`]. Preprint: #link("https://arxiv.org/abs/0912.2759").]
#bibitem([20])[B.~Morris and P.~Rogaway, Sometimes-recurse shuffle: almost-random permutations in logarithmic expected time, #emph[Advances in Cryptology---EUROCRYPT 2014], Lecture Notes in Computer Science 8441, Springer, 2014, 311--326. #link("https://doi.org/10.1007/978-3-642-55220-5_18")[doi:`10.1007/978-3-642-55220-5_18`].]
#bibitem([21])[B.~Morris, P.~Rogaway, and T.~Stegers, How to encipher messages on a small domain: deterministic encryption and the Thorp shuffle, #emph[Advances in Cryptology---CRYPTO 2009], Lecture Notes in Computer Science 5677, Springer, 2009, 286--302. #link("https://doi.org/10.1007/978-3-642-03356-8_17")[doi:`10.1007/978-3-642-03356-8_17`]. Theorem~1 and Appendix~A, Lemma~2, are cited from the #link("https://www.cs.ucdavis.edu/~rogaway/papers/thorp.pdf")[author's conference text]. A later journal version is Deterministic encryption with the Thorp shuffle, #emph[Journal of Cryptology] #strong[31] (2018), no.~2, 521--536. #link("https://doi.org/10.1007/s00145-017-9262-z")[doi:`10.1007/s00145-017-9262-z`].]
#bibitem([22])[OpenAI, #emph[From partial permutation information to Fourier bounds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/From-partial-permutation-information-to-Fourier-bounds-September-26-2026/main.pdf")[OAI:From-partial-permutation-information-to-Fourier-bounds-September-26-2026], 2026.]
#bibitem([23])[OpenAI, #emph[Optimal-order mixing of the Thorp shuffle], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Optimal-order-mixing-of-the-Thorp-shuffle-September-26-2026/paper.pdf")[OAI:Optimal-order-mixing-of-the-Thorp-shuffle-September-26-2026], 2026.]
#bibitem([24])[T.~Ristenpart and S.~Yilek, The mix-and-cut shuffle: small-domain encryption secure against $N$ queries, #emph[Advances in Cryptology---CRYPTO 2013], Part~I, Lecture Notes in Computer Science 8042, Springer, 2013, 392--409. #link("https://doi.org/10.1007/978-3-642-40041-4_22")[doi:`10.1007/978-3-642-40041-4_22`].]
#bibitem([25])[B.~E.~Sagan, #emph[The Symmetric Group: Representations, Combinatorial Algorithms, and Symmetric Functions], second edition, Graduate Texts in Mathematics, vol.~203, Springer, 2001. #link("https://doi.org/10.1007/978-1-4757-6804-6")[doi:`10.1007/978-1-4757-6804-6`].]
#bibitem([26])[E.~O.~Thorp, Nonrandom shuffling with applications to the game of Faro, #emph[Journal of the American Statistical Association] #strong[68] (1973), no.~344, 842--847. #link("https://doi.org/10.1080/01621459.1973.10481434")[doi:`10.1080/01621459.1973.10481434`].]


