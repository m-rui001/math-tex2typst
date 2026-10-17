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

#align(center)[#text(size: 16pt, weight: "bold")[Conditional permutations in a revealed switching environment]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

The random switches in a shuffle do more than move individual cards. They define a bijection between all starting and ending positions. If the paths of some cards are revealed, the other cards still undergo a random bijection, but its law depends on the revealed paths. We study when that entire conditional bijection becomes nearly uniform. This asks for information that is absent from a one-card mixing estimate: all remaining labels must be randomized together, after the surrounding motion has been observed.

The Thorp shuffle makes this distinction concrete. Split a deck into two equal halves, pair the cards in corresponding positions, and independently choose the order of each pair before interleaving them. For $n = 2^d$ positions, undoing a deterministic rotation of the binary coordinates identifies successive shuffles with fair switches in the cyclic directions of the binary cube. A #emph[sweep] visits all $d$ directions once and costs $d$ physical shuffles. Each individual card is uniform after one sweep. The dependence among the routes of different cards remains substantial.

Write $U_m$ for uniform measure on the symmetric group $S_m$, and use total variation with its factor $1 \/ 2$. The mixing time $t_(upright("mix")) \( d \)$ is the least number of physical shuffles at which the full-deck law is within $1 \/ 4$ of $U_n$ from every deterministic start. Fix $m = n \/ 2$ outside labels. Given their full trajectories $cal(E)$ through a time interval, list the unoccupied slots at each endpoint in increasing binary order. The switches map the initial free slots bijectively onto the final free slots; the resulting permutation of their indices has a conditional law $nu_(cal(E))$ on $S_m$. Its definition uses the slot indices, independently of the order of the labels entering the interval. Section 2 proves both this construction and the composition rule on consecutive intervals.

The main contribution is the information retained after the outside paths are revealed. An independent companion [19] gives full-deck mixing after $1600 d$ physical shuffles. That conclusion concerns the unconditioned deck law; the theorem here controls the entire remaining assignment conditional on a path environment, with its own explicit time bound.

#thm([Theorem 1.1.])[
  (Conditional permutation and full-deck mixing).  #emph[Let $n = 2^d$, and start the shuffle from any deterministic deck. After $J \( s_0 + 1 \)$ sweeps, where $s_0 = 400$ and $J = 40000$, the conditional free-slot law defined above satisfies 
$ sup_(upright("initial layouts")) bb(E)_(cal(E)) parallel nu_(cal(E)) - U_(n \/ 2) parallel_(upright("TV")) arrow.r 0 #h(2em) \( d arrow.r oo \) . $

 Consequently the full-deck law approaches uniform, uniformly in the starting deck, after $16 thin 040 thin 400 d$ physical shuffles. For every integer $t gt.eq 0$, after $t$ physical shuffles the full-deck distance from uniform is at least $1 - 2^(t n \/ 2) \/ n !$. Thus the full-deck mixing time is of order $d$.]
] <thm:methods>

The conditional conclusion says that the free-slot permutation is nearly independent of the revealed environment. Indeed, if $g$ is that permutation, then

$ ∥cal(L) \( cal(E) \, g \) - cal(L) \( cal(E) \) ⊗ U_(n \/ 2)∥_(upright("TV")) = bb(E)_(cal(E)) parallel nu_(cal(E)) - U_(n \/ 2) parallel_(upright("TV")) . $

The equality follows by summing first over the environment and then over the permutation. For each fixed $epsilon > 0$, Markov’s inequality also shows that the probability of a conditional distance exceeding $epsilon$ tends to zero, uniformly in the initial layout. Rare path environments can nevertheless leave too few useful switches. The proof handles them by deleting a small amount of probability, with the loss measured under the actual outside-path law; it does not assume that a typical free set stays typical after further conditioning.

The first proof has three steps. We first mix any ordered half-deck in $400$ sweeps from every start. A two-copy calculation for a single sweep gives the exact collision kernel of a tagged free card. Splitting it into averages within large subcubes and fluctuations inside those subcubes produces a two-sweep contraction. Next, we alternate a preparation interval of $400$ sweeps with one active sweep. Truncating the preparation law gives domination by a uniform free set and an independent uniform slot permutation. The active sweep forces many coin agreements whenever two copies have many common endpoints. A symmetric-group character bound converts this into a normalized trace contraction. The preparation domination then turns that trace estimate into a matrix contraction which can be iterated while the outside paths continue to be revealed. Finally, we couple the outside half-decks and use the conditional result to couple the remaining labels.

The three subsequent constructions change a specific part of this mechanism. Their separate quantitative statements and time bounds are given with their proofs. Reset minorization uses an exact uniform component in a large marginal to create central relative-permutation increments. Its conditional collision identity gives uniformity even after all reset coins are revealed. Trajectory overlays preserve the true shuffle law by adding predictable independent switches to a base trajectory system. They first randomize one group of indices and then use three rounds on transverse partitions; a local limit estimate for contingency tables completes that route. The last construction conditions on the unlabelled occupancy history of two colors. Given that history, the two internal half-permutations are independent. Conditional list estimates and a signed-tabloid transfer then control a two-block Fourier matrix. These are different conditional objects, and each construction includes its own mass and independence argument.

The shuffle originates in Thorp’s study of shuffling and Faro [22]. Morris proved an $O \( d^44 \)$ bound for power-of-two decks [10]; Montenegro and Tetali gave the intermediate $O \( d^29 \)$ bound [9] Theorems 6.14–6.15. Morris subsequently obtained an $O \( \( log n \)^4 \)$ bound for every even deck size [12] and an $O \( d^3 \)$ bound for $n = 2^d$ [13].

For partial permutations, Czumaj and Vöcking proved that the endpoint positions of any prescribed $floor.l c n floor.r$ cards mix in $O \( d^2 \)$ physical Thorp shuffles, for each fixed $0 < c < 1$ and $n = 2^d$ [2]. Morris’s chameleon analysis already studies a tagged card conditional on an occupancy history in an auxiliary zigzag shuffle [10] preprint, Section 4, Lemma 3. Partial permutation laws also appear in the enciphering work of Morris, Rogaway and Stegers [14] Theorem 1 and Lemma 2, proved in Appendix A. Hoang, Morris and Rogaway use conditional squared energies and sequential total-variation comparison in their analysis of swap-or-not [5] Section 3. Their random-key chain differs from the deterministic coordinate schedule here. Our conditional permutation estimates require the additional bijection, truncation and character arguments developed below.

The character input is the uniform Larsen–Shalev estimate [7] Theorem 1.1, in the precise fixed-slack formulation recorded by Keller, Lifshitz and Sheinfeld [6] Definition 2.1 and Theorem 2.2. Standard branching, Schur orthogonality and hook-length formulas are used in the conventions of [21,3]. Lemmas 5 and 6 collect the character consequences and an elementary reciprocal-square degree estimate used across the constructions. The latter is a special case of the general summability theorem of Liebeck and Shalev [8] Theorem 2.6.

Sections 2–4.5 give the entire first route. Sections 5 and 6 give the reset and overlay constructions. Section 7 identifies precisely the conditional path theorem and the abstract signed-tabloid transfer used in the two-half construction. The companion on conditional coordinate sweeps [16] studies prescribed trajectories in a different, near-uniform line model. It retains a falling-factorial potential through the conditional moment induction; with no prescribed paths, the resulting dimension estimate is then transferred analytically to binary sweeps. Its theorem is not an input to the present kernels.

== 2 From revealed paths to a permutation kernel <sec:conditional>

We first specify the information being conditioned on and prove that the unobserved randomness acts on the whole free assignment. The distinction between a positional bijection and the labels carried by that bijection will matter when preparation intervals are repeated.

Identify the positions with $V = bb(F)_2^d$, ordered lexicographically. Permutations send labels to positions, and $\( g h \) \( x \) = g \( h \( x \) \)$. Put

$ R \( x_1 \, dots.h \, x_d \) = \( x_2 \, dots.h \, x_d \, x_1 \) . $

One physical shuffle is $R S$, where $S$ independently fixes or exchanges each pair ${ x \, x + e_1 }$. If $Y_t$ is the physical permutation and $X_t = R^(- t) Y_t$, then

$ X_(t + 1) = R^(- t) S_(t + 1) R^t X_t . $

Thus $X_t$ uses independent fair matching switches in directions $1 \, dots.h \, d$ cyclically. A layer means one such update; a sweep consists of $d$ consecutive layers containing all directions. At sweep boundaries $X_t = Y_t$. All interval lengths used below end at such boundaries. Uniform measure on the full group, and on every ordered-injection space, is invariant under each layer.

#thm([Lemma 2.1.])[
  (Conditional slot bijections).  #emph[Fix a deterministic starting layout and a set of outside labels. For any feasible specification $e$ of their paths through a finite interval, conditional on $e$ all switch values on edges incident to an outside card are fixed, and all other switch values are independent fair bits. Let $F_s$ be the set of free positions at boundary $s$, and let $m = \| F_s \|$. Write $iota_s : \[ m \] arrow.r F_s$ for the increasing bijection. Every completion of the unexposed bits induces a bijection $T_e : F_0 arrow.r F_T$, hence a permutation 
$ g_e = iota_T^(- 1) T_e iota_0 in S_m . $

 Its conditional law depends on the outside paths and positions, but not on the incoming assignment of free labels. On consecutive intervals the corresponding permutations multiply with later intervals on the left. Conditional on all the outside paths, their remaining switch arrays are independent, so their conditional laws compose by convolution.]
] <lem:slot-kernel>

#proof[
  At a given layer, a specified outside path records both the incoming and outgoing endpoint of its matching edge and thereby fixes that edge’s coin. If two outside cards meet, feasibility makes their requirements agree. Conversely, prescribing those values forces the outside paths: induction on the layer determines their positions regardless of all other switch values. The path event is exactly a cylinder in the independent time-edge coin array. Conditioning therefore leaves every unprescribed time-edge coordinate independent and fair, including coordinates earlier than a future prescribed path segment.
  At a layer there are three cases. An outside–outside edge has no free slot. An outside–free edge has one free input and one free output, and the prescribed coin maps the former to the latter. A free–free edge has two free inputs and outputs, and its unexposed coin chooses the identity or transposition. These maps are bijections between the free input and output sets. Their composition is $T_e$. Relabelling the free cards changes neither the cylinder event nor these maps. If an incoming label assignment is a bijection $a : \[ m \] arrow.r cal(L)$ from the slot indices to the free-label set $cal(L)$, the outgoing assignment is $a compose g_e^(- 1)$. Consequently a uniform $g_e$ gives a uniform assignment, whatever $a$ is.
  At an intermediate boundary the same increasing map $iota_s$ is used as the terminal index map of one interval and the initial index map of the next. These maps cancel in the product, giving the stated multiplication order. The unexposed time-edge coordinates of disjoint intervals are disjoint. The cylinder description proves their conditional independence even when all outside paths, including future ones, have been revealed. Each factor law is the one obtained by conditioning only on that interval’s outside paths and starting outside layout. ◻
]

The lemma extends the elementary path-cylinder observation to a law on $S_m$. It does not assert that this law is already uniform. In particular, its one-card marginals need not determine it. The next two sections supply the contraction of the full law.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$[m]$])
  content((3.117, 0), [$F_0$])
  content((6.809, 0), [$F_T$])
  content((9.962, 0), [$[m]$])
  line((0.3892, 0), (2.789, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.558, 0), [$iota_0$], anchor: "south", padding: 0.1176cm)
  line((3.444, 0), (6.444, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.963, 0), [$T_e$], anchor: "south", padding: 0.1176cm)
  line((7.173, 0), (9.573, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.386, 0), [$iota_T^(-1)$], anchor: "south", padding: 0.1176cm)
  bezier((0, -0.301), (9.962, -0.301), (2.747, -3.048), (7.215, -3.048), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.981, -2.362), [$g_e= iota_T^(-1)T_e iota_0$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: A fixed revealed path environment determines the free sets. Unexposed switches determine a random bijection between them. Increasing slot indices turn this bijection into a permutation on one fixed group, so consecutive kernels can be multiplied. ],
) <fig:slots>

For one tracked free card, Lemma 2 gives a simpler linear evolution. Its conditional masses are averaged across a free–free edge and transported across a mixed edge. The uniform vector on the free slots follows exactly the same transport. A signed difference from uniform therefore has sum zero and nonincreasing Euclidean norm. This linear evolution is adapted to the progressively revealed paths, despite being a formula for the law conditional on their entire final specification: later prescribed coins do not reveal earlier unexposed ones.

We will also use uniqueness of an individual path through a single sweep. Just before direction $i$ is updated, the earlier coordinates equal the card’s terminal coordinates and the later coordinates equal its initial coordinates. Thus the initial and terminal positions determine every intermediate position. This statement holds for any cyclic phase and either order of the coordinates.

Finally, the support bound in Theorem 1 needs no conditioning. There are at most $2^(t n \/ 2)$ coin strings in $t$ physical shuffles. Their support has uniform mass at most $2^(t n \/ 2) \/ n !$, proving the bound. In particular distance at most $1 \/ 4$ requires

$ t gt.eq ⌈2 / n log_2 frac(3 n !, 4)⌉ = 2 d - O \( 1 \) . $

For comparison with the lower constants in the separate constructions, the elementary inequality $n ! gt.eq \( n \/ 2 \)^(n \/ 2)$ also gives distance at least $1 - 2^(- n \/ 2)$ whenever $t lt.eq d - 2$. Stirling’s bound $log \( n ! \) gt.eq n log n - O \( n \)$ gives distance tending to one uniformly for $t lt.eq d$. In particular the weaker lower constants $d \/ 2$, $d - 1$ and $d$ used by those constructions follow from this same support calculation.

Changing the initial deck translates a permutation law, so its distance from uniform is unchanged. Mixing exists in each fixed dimension: one sweep has positive probability of being the identity or any specified cube-edge transposition, and those transpositions generate $S_n$. Identity sweeps pad finite products to a common length, giving a positive uniform minorization for a sufficiently long sweep block.

== 3 Preparing an ordered half-deck <sec:preparation>

Throughout this section put $m = n \/ 2$. Our first task is to randomize any specified ordered half-deck from a deterministic start in $400$ sweeps, uniformly in its starting positions. The conditional-bijection construction of Lemma 2 supplies its one-card transition matrices. We first establish the complementary one-sweep estimates that will make these matrices contract over pairs of sweeps.

Consider one sweep with blocked positions $E$ at its start, $r = \| E \| lt.eq m$. For the random blocked paths let $E'$ be the end positions and $Q$ the conditional single-free-card transition matrix (rows in $E^c$, columns in $\( E' \)^c$). It is doubly stochastic between these two sets, since the conditional moves are random bijections. Vectors of probabilities or their differences will be row vectors, with the ordinary Euclidean norm. In particular $parallel u Q parallel lt.eq parallel u parallel$, by convexity of the square applied in each column and then the row sums. Put $A_E = bb(E) \[ Q Q^top \]$, the expectation over these paths from the fixed blocked start. Its entry at $x \, y in E^c$ is the probability two copies starting at $x \, y$, run independently conditional on the common blocked paths, finish at the same position (averaging also over the paths). It is symmetric and a contraction, as is $Q Q^top$.

Let $h = floor.l d \/ 2 floor.r$, and call the blocks specified by bits $> h$ the coarse blocks (size $2^h$). For a free-slot vector $u$ write $u_(upright(c))$ for its orthogonal projection obtained by averaging over free slots within each such block (ignoring empty ones). Call a blocked set good if its fraction in every coarse block is at most $3 \/ 4$. Set $q = 7 \/ 8$ and

$ epsilon.alt_n = n (frac(3 \/ 2, 2^(3 \/ 4)))^(2^h) . $

We use a two-sweep mechanism. From a balanced blocked set, one sweep contracts fluctuations within large subcubes. It may leave averages that differ between subcubes, but the same sweep makes the expected energy of those output averages small. Combining the two estimates in the next sweep will contract the whole vector. The next lemma gives the two estimates and the probability of an unbalanced output.

#thm([Lemma 3.1.])[
  (Coarse-block estimates).  #emph[For the one-sweep matrix $Q$ defined above and every free-slot row vector $u$, a good starting blocked set $E$ satisfies 
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E) parallel u Q parallel^2 = u A_E u^top lt.eq parallel u_(upright(c)) parallel^2 + q^(d - h) parallel u parallel^2 . $ <special:burn-active:eq:2>]

 For every starting blocked set $E$ with $\| E \| lt.eq n \/ 2$, the ending set satisfies 
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(P) \( E' upright(" not good") \) lt.eq epsilon.alt_n . $ <special:burn-active:eq:3>]

 If $u$ has sum zero, then its coarse part on the ending free slots satisfies 
#[#set math.equation(numbering: n => "(3.3)")
 $ bb(E) parallel \( u Q \)_(upright(c)) parallel^2 lt.eq \( 4 dot.op 2^(- h) + epsilon.alt_n \) parallel u parallel^2 . $ <special:burn-active:eq:4>]

]
] <lem:coarse-block-estimates>

#proof[
  Write $p_k \( x \)$ for the initial blocked fraction in the block of size $2^(k - 1)$ having bits $> k$ equal to those of $x$ and bit $k$ opposite to that of $x$, and set $q_k \( x \) = \( 1 + p_k \( x \) \) \/ 2$. Let $j$ be the largest coordinate where $x \, y$ differ, or $0$ if they coincide. We claim
  #[#set math.equation(numbering: n => "(3.4)")
   $ A_E \( x \, y \) = 2^(- j) product_(k = j + 1)^d q_k \( x \) . $ <special:burn-active:eq:1>]
  For the two-copy experiment averaged over paths, we can generate the blocked motion with independent switch coins, use these moves for the copies where an edge is incident to a blocked card, and use two fresh independent arrays of switch coins (one per copy) on free-free edges. Whenever the copies are at different positions before a stage, their two new bits at that stage are independent uniform bits given the history up to then: for different edges the coins used are independent, and if the edge is the same, both its slots must be free and the copies use independent coins. Up to and including stage $j$ the pre-switch positions are different, due to bit $j$ if $j > 0$. Thus the probability of matching the first $j$ new bits is $2^(- j)$, after which they are at the same position on that event. A mismatch in any updated bit persists to the end of the sweep.
  For $k > j$, given they matched the new bits through stage $k - 1$ (so are now together), they stay together for sure if the neighbor slot is blocked and with probability $1 \/ 2$ otherwise. Here the probability the neighbor is blocked, given this matching so far and their current common prefix, is $p_k \( x \)$. To see this, before stage $k$ both copies have evolved in the block with bits $gt.eq k$ equal to those of $x$. Their motion and the event of matching so far only use coin arrays in that block. In the neighboring block (bit $k$ opposite), independently, the blocked configuration has evolved for $k - 1$ stages within the block; each initial blocked card there has uniform marginal position in it, since its successive new bits are conditionally fair. Thus the blocked probability at the slot matching the copies’ prefix is the stated fraction. This independence uses a fixed initial $E$ and disjoint switches of the blocks prior to stage $k$. Multiplying the stay-together probabilities proves (3.4), including for $j = 0$.
  To prove (3.1), note that (3.4) is constant between any two fixed distinct coarse blocks. Within the block of $x$, its row sum equals $product_(k = h + 1)^d q_k \( x \)$: for $1 lt.eq j lt.eq h$ there are $2^(j - 1) \( 1 - p_j \( x \) \)$ free $y$’s with that last difference, contributing $\( 1 - q_j \( x \) \) product_(k > j) q_k \( x \)$, which telescope together with the diagonal term. This row sum is constant for $x$ in the block, and is at most $q^(d - h)$ when $E$ is good since the blocks defining $p_k$ for $k > h$ are unions of coarse blocks. The coarse-constant subspace is invariant under $A_E$ by the constants and row sums just noted; on it we use contraction. On its orthogonal complement the between-block entries contribute zero, and the symmetric within-block matrices have norm at most their maximum row sum (nonnegative entries). By symmetry there is no cross term between the two subspaces. This proves (3.1); without goodness we still have contraction.
  We also bound the expected coarse part at the #emph[output], with the same choice of coarse coordinates for use in the next sweep. Let $H \( x \, y \)$ be the probability in the two-copy experiment of equal bits $> h$ at the output, and $H_(upright("pre")) \( x \, y \)$ the probability of equal bits $1 \, dots.h \, h$. Then, with the all-ones matrix denoted by $upright(bold(1)) upright(bold(1))^top$,
  $ H = 2^(- \( d - h \)) \( upright(bold(1)) upright(bold(1))^top - H_(upright("pre")) \) + A_E . $
  If the first $h$ bits mismatch, the copies remain at distinct positions, so the remaining new bits match with probability $2^(- \( d - h \))$ by the fresh-bit observation for distinct positions. If the first $h$ match, also matching the rest means an end collision. Moreover $H_(upright("pre"))$ is positive semidefinite: conditional on the blocked paths the equality probabilities form a Gram matrix of the transition probabilities aggregated by output prefix, and we average this matrix. Consequently for $u$ of sum zero, the expected sum over coarse output blocks of the squared sums of $u Q$ in them is $u H u^top lt.eq u A_E u^top lt.eq parallel u parallel^2$.
  We prove directly the needed negative-dependence inequality. It is a restricted form of the preservation of negative dependence under partial symmetrization studied by Borcea, Brändén and Liggett [1] Theorems 4.9 and 4.20. The blocked-slot indicators throughout the switches satisfy: for any set of slots the probability all are blocked is bounded by the product of their marginal probabilities. It holds initially (deterministic); a single fair swap preserves it. For a test set containing one of the two slots, average the two old bounds, and for one containing both, use that the product of their marginals can only increase when both marginals are replaced by their average. Disjoint simultaneous swaps can be processed one at a time. After a sweep all marginals are $r \/ n$ by single-card uniformity. For the number $B$ blocked in a given coarse block, expanding the product of $1 +$indicator over it thus gives $bb(E) 2^B lt.eq \( 1 + r \/ n \)^(2^h)$; Markov’s inequality and the union bound give (3.2).
  On good output the squared block sums are divided by block free-slot counts at least $2^h \/ 4$ to form the squared norm (use the unconditional numerator bound), and on bad output the norm is at most $parallel u parallel$ by contraction. Together with (3.2), this proves (3.3). ◻
]

#thm([Proposition 3.2.])[
  (Uniform half-deck preparation).  #emph[For all sufficiently large $d$, every ordered list of $k lt.eq n \/ 2$ distinct labels, from every deterministic starting layout, has endpoint law within $n^(- 3)$ in total variation of uniform ordered distinct positions after $400$ sweeps.]
] <prop:half-preparation>

#proof[
  Fix at most $m$ blocked cards and track one specified free card over sweeps, starting deterministically, and let $u_s$ be its law conditional on the blocked paths up through sweep $s$, minus uniform on the then free slots. Given those paths, the next blocked paths are fresh from the then layout, and on revealing them $u_(s + 1) = u_s Q$ for their conditional matrix; future blocked paths supply no information on the unused free coins of the past, and the uniform vectors are carried to uniform vectors. In particular there is pathwise norm contraction. Write $a_s = bb(E) parallel u_s parallel^2$, with $a_0 lt.eq 1$. For $s gt.eq 1$, the mean squared coarse part of $u_s$ is bounded by $\( 4 dot.op 2^(- h) + epsilon.alt_n \) a_(s - 1)$ by (3.3) given the paths through the previous sweep. Also $bb(E) \[ upright(bold(1))_({ upright("bad after ") s }) parallel u_s parallel^2 \] lt.eq epsilon.alt_n a_(s - 1)$ by pathwise contraction and (3.2) given the previous paths. Applying (3.1) for the next sweep on good starts and contraction otherwise, we get
  $ a_(s + 1) lt.eq q^(d - h) a_s + \( 4 dot.op 2^(- h) + 2 epsilon.alt_n \) a_(s - 1) lt.eq n^(- 1 \/ 20) a_(s - 1) $
  for all sufficiently large $d$. Here $a_s lt.eq a_(s - 1)$, $epsilon.alt_n$ decays faster than any inverse power of $n$, and $log_2 \( 8 \/ 7 \) \/ 2 > 1 \/ 20$. Take the fixed length $s_0 = 400$ sweeps; iterating with sweep index jumping by two gives $a_(s_0) lt.eq n^(- 10)$.
  It follows that for any ordered list of $k lt.eq m$ cards from any fixed start,
  #[#set math.equation(numbering: n => "(3.5)")
   $ d_(upright("TV")) \( upright("law of their positions after ") s_0 upright(" sweeps") \, upright("uniform ordered distinct positions") \) lt.eq delta_n := n^(- 3) $ <special:burn-active:eq:5>]
  for large $d$. For each next card condition first on the #emph[paths] of the previous cards on the list, taking them as the blocked cards above. The mean total variation deviation from uniform on the remaining end slots is at most $sqrt(n a_(s_0)) \/ 2$ by Cauchy-Schwarz. Conditioning instead only on the previous endpoints can only lower this averaged bound, by mixtures with the same uniform comparison given those endpoints. Sum these next-card bounds to bound the joint total variation: one can interpolate laws by taking an initial part of the list with its actual endpoint law and filling the rest uniformly without replacement. Consecutive such laws differ in total variation by at most the averaged next-card deviation (with previous endpoints actual). Since $k sqrt(n dot.op n^(- 10)) \/ 2 lt.eq delta_n$, this gives (3.5). This sequential total-variation comparison also appears in Morris’s exclusion-process analysis [11] Lemma 12. ◻
]

== 4 Preparation and active sweeps <sec:burn>

Now designate $m$ labels as outside cards, leaving $m$ free cards, from any deterministic layout at a sweep boundary. We will bound the expected distance of the free-slot kernel from uniform on $S_m$, conditional on all outside paths. Index the free slots increasingly at each boundary. By Lemma 2, interval kernels compose by convolution, with later increments on the left, independently of the incoming free-label assignment. Each factor is computed from that interval’s outside paths and starting outside layout, even when the entire outside history is revealed.

Partition the time here into chunks, each a preparation interval of $s_0$ sweeps and then an active interval of one sweep. A subprobability is a nonnegative measure of total mass at most one. The two intervals have different tasks. After averaging over the actual preparation paths, we need joint domination by a uniform endpoint free set and an independent uniform slot permutation; this will permit a Schur conjugation average. During the active sweep, we need enough fresh coin constraints that agreement of many endpoints is unlikely. We achieve both by restricting or downweighting outcomes, obtaining conditional subprobability laws whose mean missing mass will be restored at the end.

=== 4.1 Truncating the preparation interval <truncating-the-preparation-interval>

Given the chunk’s starting layout with free set $z_0$, consider the ordered endpoint injection $y$ at the end of the preparation interval of fictitious free labels placed canonically in the free slots at its start. Let $p \( y \)$ be its probability #emph[without] conditioning on paths, from this start. Equivalently $y$ encodes the endpoint free set $z$ and the preparation permutation $g$ on the canonical indices. Write $u_(*) = \( binom(n, m) m ! \)^(- 1)$ for the uniform injection probability. Weight the preparation outcomes by $min \( 1 \, u_(*) \/ p \( y \) \)$ (use 1 at $p \( y \) = 0$), using $y$ of this interval’s canonical increment, not the endpoints of labels carried in from prior chunks. Denote the resulting subprobability on $g$ conditional on preparation outside paths $e$ by $tilde(nu)_b^e$. Since $z = z \( e \)$ is determined by those paths,

#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E)_e #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ z \( e \) = z }) tilde(nu)_b^e \( g \) #scale(x: 120%, y: 120%)[\]] = min \( p \( y \) \, u_(*) \) lt.eq u_(*) #h(2em) upright("for each ") \( z \, g \) . $ <special:burn-active:eq:6>]

Thus the retained joint measure averaged over paths is dominated by the law of uniform $z$ and independent uniform $g$. By (3.5) the expected removed mass is at most $delta_n$. Also the unweighted marginal of $z$ is within $delta_n$ of uniform.

=== 4.2 Active truncation <active-truncation>

For each free carrier (card considered from its slot at the start of the active sweep), count the stages of this sweep at which it is on an edge with two free slots. Call the carrier poor if this count is less than $d \/ 4$. Retain the active trajectory if at most

$ L = n^(1 - 1 \/ 40) $

free carriers are poor, dropping it otherwise. This criterion does not depend on their incoming labeling. With active outside paths $e'$, write $tilde(nu)_a^(e')$ for the conditional subprobability law of the active permutation.

At a uniform start set $z$ independent of the fresh switches, the probability of dropping is at most $n^(- 1 \/ 40)$ for large $d$. In fact for any full sweep switch realization form the meeting graph on the $n$ initial slots, joining two whose carriers occupy the two slots of the same switch at some stage. It has $d$ distinct neighbors per slot: after such a meeting at stage $i$ the two differ in bit $i$ and keep differing there through the sweep, preventing any later meeting in it. The graph does not use $z$. Given a particular slot is in the uniform free set, for its $d$ neighbors the probability any $k$ specified ones are all outside is at most $\( m \/ \( n - 1 \) \)^k$ (sampling without replacement). As in (3.2), the probability of having more than $3 d \/ 4$ outside neighbors is at most

$ \( 1 + m \/ \( n - 1 \) \)^d 2^(- 3 d \/ 4) lt.eq n^(- 1 \/ 20) $

for large $d$ (the limiting $log_2 \( 3 \/ 2 \) < 7 \/ 10$). This bounds the poor probability for that free slot. The expected number poor is thus at most $m n^(- 1 \/ 20)$; apply Markov’s inequality to obtain the dropping bound. Generating full switches here computes exactly the expected removed conditional mass when averaging over the outside paths and the free switches. This path-averaged loss as a function of the active starting layout depends only on its free set (relabeling the outside has no effect). Thus from the end of the unweighted preparation interval its expectation is at most $n^(- 1 \/ 40) + delta_n$, for any start of the chunk.

The active subprobability has zero sign transform:

$ sum_g tilde(nu)_a^(e') \( g \) "sgn" \( g \) = 0 . $

The free-free edge sets are determined by $e'$. If there are none, no trajectory is retained for large $d$ ($m > L$). Otherwise flip the free coin on one fixed free-free edge at the last stage having any. The counts for the carriers are unchanged (no further free-free stages), retention is invariant, and this probability-preserving involution changes the endpoint parity by exchanging the endpoints of the two carriers there.

=== 4.3 Trace estimate for an active interval <trace-estimate-for-an-active-interval>

Use unitary complex irreducible representations $rho$ of $S_m$, writing the transform of a measure as $F = sum_g nu \( g \) rho \( g \)$. Denote by $D$ the dimension and $chi$ the (unnormalized) character. We use the ordinary trace, with $parallel B parallel_(upright("HS"))^2 = "tr" \( B^(*) B \)$. Write $F_a$ for the transform of $tilde(nu)_a^(e')$, and put

$ A \( z \) = bb(E)_(e') \[ F_a^(*) F_a divides upright("active start with free set ") z \] \, #h(2em) b_rho = bb(E)_(z med upright("uniform")) frac("tr" A \( z \), D) . $

The expectation defining $A \( z \)$ is the same for any outside labeling of the other slots: such a relabeling just bijects outside paths with the same constraints on switch moves and the same probabilities and free kernels. For the sign representation $F_a = 0$. We treat $D > 1$ next. The representation-theoretic background used here is recalled in [21,3].

For the trace, conditional on $e'$, take two independently generated free switch realizations $X \, Y$; letting $g_X \, g_Y$ be the resulting permutations, expansion gives $"tr" \( F_a^(*) F_a \)$ equal to the conditional average of $chi \( g_X^(- 1) g_Y \)$ times the indicators that both are retained. Let $f$ be the number of fixed points of $g_X^(- 1) g_Y$. Given a retained $X$, for any $a$ specified free starting indices to be fixed, their carriers must have the same paths in $Y$ as in $X$, by single-sweep path uniqueness from endpoints. At least $a - L$ of them are not poor in $X$, so they jointly visit at least $d \( a - L \) \/ 8$ distinct free-free switches (at most two carriers per switch). The coins there in $Y$ would all have to match, and they are independent fair coins conditional on $e'$ and $X$. By a union bound, with $beta = 1 \/ 100$ and for integers $n^(1 - beta) lt.eq a lt.eq m$,

#[#set math.equation(numbering: n => "(4.2)")
 $ bb(P) \( f gt.eq a \, med X \, Y upright(" retained") divides e' \) lt.eq binom(m, a) 2^(- d \( a - L \) \/ 8) lt.eq n^(- a \/ 32) $ <special:burn-active:eq:7>]

for large $d$, since $L lt.eq a \/ 2$ and $\( e m \/ a \)^a lt.eq n^(2 beta a)$ (here $e$ in $e m \/ a$ is the base of natural logarithms).

The endpoint-agreement estimate must now be converted into a character estimate. We record the two bounds used here and in the reset and overlay constructions.

#thm([Lemma 4.1.])[
  (Characters and fixed points).  #emph[ Fix $0 < delta < 1 \/ 4$. For all sufficiently large integers $r$, every irreducible character $chi$ of $S_r$, of degree $D = chi \( 1 \)$, and every $sigma in S_r$ with $f$ fixed points satisfy 
#[#set math.equation(numbering: n => "(4.3)")
 $ f lt.eq r^(1 - 4 delta) & quad arrow.r.double quad frac(\| chi \( sigma \) \|, D) lt.eq D^(- delta) \,\
frac(\| chi \( sigma \) \|, D) & lt.eq D^(- delta) r^(delta f) . $ <eq:character-small-fixed>]

 The threshold for $r$ depends only on $delta$.]
] <lem:character-fixed-points>

#proof[
  We use the uniform Larsen–Shalev bound [7] Theorem 1.1, in the fixed-slack formulation of [6] Definition 2.1 and Theorem 2.2. If $a_i$ counts the $i$-cycles of $sigma$, define nonnegative $e_i$ by
  $ sum_(i lt.eq s) e_i = log_r max (1 \, sum_(i lt.eq s) i a_i) \, #h(2em) E \( sigma \) = sum_(i = 1)^r e_i / i . $
  For each fixed $epsilon > 0$ and all sufficiently large $r$, the bound is $\| chi \( sigma \) \| lt.eq D^(E \( sigma \) + epsilon)$, uniformly in $sigma$ and $chi$. Since $sum_i e_i = 1$ and $e_1 = log_r max \( f \, 1 \)$,
  $ E \( sigma \) lt.eq frac(1 + log_r max \( f \, 1 \), 2) . $
  Taking $epsilon = delta$ proves (4.3).
  For (4.3), conjugate the fixed points to the last $f$ symbols and restrict to $S_(r - f)$. The Young branching rule gives at most $r^f$ summands counted with multiplicity, whose dimensions sum to $D$. If $r - f$ is above an absolute threshold, the remaining permutation has no fixed points, so the same character bound with $epsilon = 1 \/ 4$ bounds its character on a summand of dimension $D_j$ by $D_j^(3 \/ 4)$. Hölder’s inequality therefore gives
  $ \| chi \( sigma \) \| lt.eq sum_j D_j^(3 \/ 4) lt.eq r^(f \/ 4) D^(3 \/ 4) . $
  Combine the normalized estimate with $\| chi \( sigma \) \| \/ D lt.eq 1$. For every $x > 0$ and $0 < delta < 1 \/ 4$, $min \( 1 \, x^(1 \/ 4) \) lt.eq x^delta$; use $x = r^f \/ D$. If $r - f$ is below the absolute threshold, then for large $r$ we have $f gt.eq r \/ 2$ and $r^f gt.eq sqrt(r !) gt.eq D$, so the desired bound follows from the trivial estimate. This also makes the threshold uniform. ◻
]

Apply the lemma with $r = m$ and $delta = beta \/ 8 = 1 \/ 800$. For large $n$, $n^(1 - beta) lt.eq m^(1 - 4 delta)$, so pairs with $f lt.eq n^(1 - beta)$ contribute at most $D^(- delta)$ to the normalized trace. For larger integer $f$, use (4.2) and (4.3); their total contribution is at most

$ D^(- delta) sum_(f > n^(1 - beta)) n^(- f \/ 32) m^(delta f) lt.eq D^(- delta) sum_(f > n^(1 - beta)) n^(- \( 1 \/ 32 - delta \) f) = o \( 1 \) D^(- delta) . $

The estimate holds uniformly over the outside paths. In particular

#[#set math.equation(numbering: n => "(4.4)")
 $ 0 lt.eq b_rho lt.eq 2 D^(- 1 \/ 800) #h(2em) upright("for all sufficiently large ") n . $ <special:burn-active:eq:8>]

To sum the trace estimates, we also need a bound on small representation degrees. The following elementary argument proves the reciprocal-square case of the more general summability theorem of Liebeck and Shalev [8] Theorem 2.6. This case suffices for all the sums below.

#thm([Lemma 4.2.])[
  (Reciprocal degrees).  #emph[For the irreducible degrees $D_lambda$ of $S_r$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ sum_(lambda : thin D_lambda > 1) D_lambda^(- 2) = o \( 1 \) #h(2em) \( r arrow.r oo \) . $ <eq:degree-square-sum>]

]
] <lem:degree-sum>

#proof[
  Recall that $D_lambda$ counts standard Young tableaux of shape $lambda$ and equals $r !$ divided by the product of its hook lengths [21,3]. If the first row has length $r - j$, where $1 lt.eq j lt.eq r \/ 4$, fill its first $j$ boxes with $1 \, dots.h \, j$. Choose $j$ of the other $r - j$ numbers for the boxes below the first row, arrange them in one fixed standard order there, and put the remaining numbers in increasing order along the first row. Every column below that row lies among its first $j$ columns, so these fillings are standard and
  $ D_lambda gt.eq binom(r - j, j) . $
  There are at most $2^j$ tail shapes, by bounding partitions by compositions. Transposition gives the same bound for a long first column. The contribution from these shapes tends to zero: $binom(r - j, j) gt.eq \( \( r - j \) \/ j \)^j gt.eq 3^j$ gives the summable majorant $2 \( 2 \/ 9 \)^j$, while each fixed-$j$ contribution tends to zero.
  For all remaining shapes, apart from the single row and single column, the maximum $L$ of a row or column length is less than $3 r \/ 4$. If $L gt.eq r \/ 10$, transpose if needed and retain the first row of length $L$ and $t = floor.l L \/ 3 floor.r$ boxes below it, deleting corners of the tail. There are at least $t$ tail boxes because $L < 3 r \/ 4$. The preceding filling argument gives at least $binom(L, t)$ tableaux of this subdiagram, and each extends to the original diagram by adding corners. Thus $D_lambda$ is at least exponential in $r$. If $L < r \/ 10$, every hook has length at most $2 L < r \/ 5$, so
  $ D_lambda gt.eq frac(r !, \( r \/ 5 \)^r) \, $
  again exponential in $r$. Finally the number of partitions of $r$ is $exp \( O \( sqrt(r) log r \) \)$: specify the multiplicities of parts at most $sqrt(r)$ and the list of at most $sqrt(r)$ larger parts. The contribution from these remaining shapes also tends to zero. ◻
]

In particular,

#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(rho : thin D > 1) D^(- 20) = o \( 1 \) \, $ <special:burn-active:eq:9>]

and the minimum nontrivial degree $D > 1$ tends to infinity. Absorbing the factor $2$ in (4.4), we may therefore use $b_rho lt.eq D^(- 1 \/ 1600)$ for all sufficiently large $m$.

=== 4.4 From traces to contraction over chunks <from-traces-to-contraction-over-chunks>

The active interval has supplied an averaged normalized trace. Its matrix need not be central, and matrices from consecutive intervals need not commute. We now use preparation domination to upgrade the trace bound to a positive-operator inequality, uniformly in the incoming outside layout. This is the step that makes the conditional law of the entire assignment accessible.

Let $F_b$ be the transform of the preparation subprobability conditional on paths $e$. Conditional on the chunk paths the chunk subprobability (composing preparation then active) has transform $F_a F_b$. Averaging over chunk paths from any start, its squared-matrix estimate in positive semidefinite order is

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) \[ \( F_a F_b \)^(*) \( F_a F_b \) \] & = bb(E)_e \[ F_b^(*) A \( z \( e \) \) F_b \]\
 & prec.curly.eq bb(E)_e sum_g tilde(nu)_b^e \( g \) rho \( g \)^(*) A \( z \( e \) \) rho \( g \) prec.curly.eq b_rho I . $ <special:burn-active:eq:10>]

For the equality, the next outside paths start fresh and $A \( z \)$ does not require their particular starting labeling. The first inequality is weighted Cauchy-Schwarz applied to $A^(1 \/ 2) F_b$ on each vector, with weights of sum at most 1. For the second, each conjugated matrix is positive semidefinite, so use (4.1) to bound by the average with uniform $z \, g$. For each $z$, the uniform $g$ conjugation gives $"tr" \( A \( z \) \) I \/ D$ by Schur’s lemma.

Use $J = 40000$ chunks. Conditional on their outside paths let $nu$ be the full probability law of the overall free-slot permutation and let $tilde(nu)$ be the composition of the subprobabilities above. Then $tilde(nu) lt.eq nu$ coefficientwise. Indeed all truncations use only the randomness of their respective interval conditional on paths and the layout information there, computing increments on canonical slots regardless of previous free permutations. Write $F_(upright("tot"))$ for the transform of $tilde(nu)$, the product of the chunk transforms (latest on the left). Applying (4.7) given previous paths for the last chunk and iterating gives

$ bb(E) \[ F_(upright("tot"))^(*) F_(upright("tot")) \] prec.curly.eq b_rho^J I $

from any starting layout: the preceding product is determined by the preceding outside paths and the bound (4.7) is uniform conditional on them. The sign transform is zero. The mass $M$ of $tilde(nu)$ is the product of the interval masses. By bounding the deficit of the product by the sum of deficits,

$ bb(E) \[ 1 - M \] lt.eq J \( 2 delta_n + n^(- 1 \/ 40) \) . $

Here we average the deficits under the ordinary outside path law; the preparation and active loss bounds hold given the outside layout starting each chunk, with the unweighted preparation path law for bounding the active loss.

Finite-group Plancherel and Cauchy-Schwarz now give, with $U_m$ uniform on $S_m$,

$ 1 / 2 bb(E) parallel tilde(nu) - M U_m parallel_1 lt.eq 1 / 2 (sum_(rho : thin D > 1) D^2 b_rho^J)^(1 \/ 2) = o \( 1 \) . $

Indeed for the difference $v$ we have $parallel v parallel_1^2 lt.eq \| S_m \| sum_g \| v \( g \) \|^2 = sum_rho D parallel sum_g v \( g \) rho \( g \) parallel_(upright("HS"))^2$ (the equality also follows directly by the regular character identity). The trivial transform of the difference vanishes, and at nontrivial representations the uniform transform vanishes. Take expectations using the matrix bound (and bound the mean norm by its root mean square), then use (4.6) since $J \/ 1600 = 25$. Restoring the missing nonnegative measure, we conclude

#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E) med d_(upright("TV")) \( nu \, U_m \) = o \( 1 \) $ <special:burn-active:eq:11>]

uniformly in the outside starting layout: add at most $bb(E) \[ 1 - M \]$ to the centered subprobability bound by comparing $nu - tilde(nu)$ to $\( 1 - M \) U_m$. Here $nu$ itself is conditional on all the outside paths.

=== 4.5 Completing the first route <sec:burn-completion>

Couple a chain from any fixed deck and one started uniform (uniformity is preserved by the independent random positional permutations). After $s_0$ sweeps we can couple the ordered positions of the $m$ designated outside labels to agree with probability at least $1 - delta_n$, by (3.5) and maximal coupling; complete the two endpoint decks by their respective conditional laws. On agreement sample common outside paths for the next $J$ chunks from their path law. Conditional on these paths the final free orders in each deck have distributions obtained using $nu$ on their possibly different incoming free orders. Each is within $d_(upright("TV")) \( nu \, U_m \)$ of uniform on the same set of end free orders (permuting from any fixed incoming order). Maximally couple them, so the expected failure probability on this continuation is at most $2 bb(E) thin d_(upright("TV")) \( nu \, U_m \) = o \( 1 \)$ by (4.8), uniformly on agreement layouts. This couples endpoints with the correct marginals by path conditioning (on initial disagreement one can just continue independently). The total failure probability is at most $delta_n + o \( 1 \) < 1 \/ 4$ for sufficiently large $d$, bounding the worst-case total variation.

The conditional assertion of Theorem 1 was established in (4.8), over $40000 \( 400 + 1 \) = 16040000$ sweeps. The coupling proves its full-deck conclusion: including the initial preparation gives $400 + 40000 \( 400 + 1 \) = 16040400$ sweeps, each costing $d$ physical shuffles. The conditional expectation is over the ordinary law of the outside paths; neither the argument nor its conclusion asserts a bound for each fixed environment.

== 5 Reset minorization and central relative increments <special:reset>

The argument begins with a quantitative marginal theorem for every fixed positive omitted fraction, in both coordinate orders. That theorem produces an exact reset minorization. Two copies sharing a switch environment then have a central relative-permutation increment, whose return probability controls conditional uniformity.

The preceding route uses preparation domination to average a positive operator. Here we instead extract an exact uniform component from a long reset block. Uniformly placing the free labels makes the relative increment of two copies central, so a return probability can be computed by characters. Here the environment records every reset coin and the paths of the nonhole labels during the active sweeps.

Use the model and composition convention of Section 2. In this section $N = n = 2^d$, and “holes” denotes the labels whose conditional assignment we will randomize.

#thm([Theorem 5.1.])[
  (Reset construction).  #emph[For $n = 2^d$, the full-deck law from any deterministic start has total-variation distance tending to zero from uniform after $171798691968 d$ physical shuffles.]
] <thm:reset>

=== 5.1 Partial mixing and forward minorization <partial-mixing-and-forward-minorization>

The reset needs an ordered marginal estimate for every fixed positive omitted fraction, rather than only for a half-deck. We prove it through a two-sweep signed-mass estimate, then use the same marginal bound in the reverse coordinate order to minorize the forward reset kernel.

Fix some observed labels and let $h$ be the number of remaining labels. Lemma 2 gives independent fair coins on the unobserved switches. To describe the conditional distribution for the position of a single particular hole label, one can evolve probability masses on the holes: at a pair of two holes the outgoing masses are both the average of the incoming ones, and at a mixed pair the hole mass goes to the outgoing hole. Which positions are holes at all the times is known from the observation. Although this description is conditional on the full observation, the forward calculation of mass through any layer only uses the observed paths up to then, as unobserved switches are left independent even when conditioning on the future part too. Uniform mass $1 \/ h$ per hole follows the same rule. We will bound the expected squared Euclidean norm of signed masses (mass zero off the holes, total mass zero) evolving by these rules, taking expectation when the trajectories are random, not conditioned. This is an adapted evolution in the switch process; at a mixed pair the placement of the outgoing mass uses the fresh fair switch coin. At every update the squared norm is non-increasing.

#thm([Lemma 5.2.])[
  (Two-sweep mass contraction).  #emph[Fix $0 < rho lt.eq 1$. For all sufficiently large $d$ depending only on $rho$, any deterministic hole placement with $h gt.eq rho N$ and any initial signed masses supported on the holes and of total mass zero have expected squared norm after two sweeps at most 
$ N^(- rho \/ 16) L \, $

 where $L$ is their initial squared norm. The masses evolve by the conditional averaging and transport rules just described. The estimate also holds conditionally on the past when the two sweeps begin.]
] <lem:reset-mass-contraction>

#proof[
  Suppose $h gt.eq rho N$, and start at deterministic positions and signed masses with squared norm $L$. A block of level $i$ is a set with the last $d - i$ bits fixed (the coordinates here are listed in the sweep order), of size $2^i$. Write $H_x$ for the hole indicator and $M_x$ for the mass, and use block subscripts for sums over a block. Let $r = floor.l d \/ 2 floor.r$. After one sweep use primes to denote the indicators, counts and masses then. Conditional on the first $r$ layers, the updates along the last $d - r$ coordinates proceed independently for different prefixes of length $r$. Any fixed level-$r$ block $B$ has one vertex for each such prefix. Over the remaining layers the expectations per output of $H_x \, M_x$ evolve by ordinary pair averaging, and for $M_x^2$ there is an upper bound by ordinary pair averaging (the square of a pair average is at most the average of the squares). Ordinary pair averaging through these layers computes the average within a prefix, successively averaging over each of the other coordinates. So $H'_B$ is conditionally a sum of independent Bernoulli variables with mean sum $h \/ 2^(d - r)$, and the conditional mean of $M'_B$ is zero. By the same independence, the conditional variance of $M'_B$ is bounded by the sum of the output second moments in $B$, at most $L \/ 2^(d - r)$ since the norm squared after the first $r$ layers is at most $L$. It follows (by the Chernoff bound for the counts) that the event $D$ that all level-$r$ blocks have hole density at least $rho \/ 2$ after this sweep satisfies
  $ Pr \( D^c \) lt.eq 2^(d - r) exp \( - rho 2^r \/ 8 \) \, #h(2em) bb(E) [upright(bold(1))_D sum_(B med upright("level") med r) frac(\( M'_B \)^2, H'_B)] lt.eq frac(2 L, rho 2^r) \, $
  where the indicated sum with the density requirement is only used on $D$.
  Here is an estimate for the next sweep from a deterministic input satisfying the density requirement (in the following calculation, input counts and masses refer to that input). Within a block $B$ of level $i$, consider the moments per output vertex after the first $i$ layers; they are the same for each of those vertices, as follows recursively. In notation for a block, write $u = H_B \/ \| B \| \, med m = M_B \/ \| B \|$; these are the first moments of indicator and mass. Write $q$ for the second moment of mass. For the children of a parent use indices 1 and 2. Before the parent merge, the inputs to a switch come independently from the two child blocks (the layers so far act within the children with disjoint sets of coins). The new $u \, m$ are the averages of the two respective values, and
  $ q = frac(q_1 + q_2, 2) - frac(q_1 u_2 + q_2 u_1 - 2 m_1 m_2, 4) . $
  In fact at a two-hole pair the per-output second moment loses the squared mass difference divided by 4 compared to just random placement; the correction averages that loss using independence (mass is zero off the holes). These calculations induct from the singleton blocks and in particular justify using position-independent output moments within the blocks.
  At positive densities let $a = m \/ u$ and $v = q - m^2 \/ u gt.eq 0$ (use Cauchy–Schwarz and support on the holes). For parents above level $r$ all densities, including the children’s, are at least $rho \/ 2$. Rearrangement gives
  $ v = 1 / 2 \[ \( 1 - u_2 \/ 2 \) v_1 + \( 1 - u_1 \/ 2 \) v_2 \] + \( 1 - u \) J_B \, #h(2em) J_B = 1 / 2 \( u_1 a_1^2 + u_2 a_2^2 \) - u a^2 gt.eq 0 . $
  Weighting by block sizes, the sum of $\| B \| v_B$ at level $i > r$ is at most $1 - rho \/ 4$ times that at level $i - 1$, plus the sum of $\| B \| J_B$ at level $i$. The sum of $\| B \| v_B$ at level $r$ is bounded by the sum using second moments instead, at most the input squared norm. Each $\| B \| J_B$ gives the sum for the two children minus the value for the parent of the quantity $\| B \| u a^2 = M_B^2 \/ H_B$; the sum above level $r$ telescopes and is bounded by $sum_(B med upright("level") med r) M_B^2 \/ H_B$. At the root $v = q$ since the total mass is zero. Thus, iterating, for the second sweep on the event $D$ the expected squared norm conditional on its input (which has squared norm at most $L$) is bounded by
  $ \( 1 - rho \/ 4 \)^(d - r) L + sum_(B med upright("level") med r) \( M'_B \)^2 \/ H'_B . $
  Using the pathwise bound $L$ on $D^c$, the expectation after the two sweeps is at most
  $ [\( 1 - rho \/ 4 \)^(d - r) + frac(2, rho 2^r) + 2^(d - r) e^(- rho 2^r \/ 8)] L lt.eq N^(- rho \/ 16) L $
  for $d$ sufficiently large (the first term decays at least as fast as $e^(- rho d \/ 8)$). This estimate holds each time, conditionally on the past, with arbitrary input meeting just $h gt.eq rho N$ and the signed-mass conditions (the density event concerns the intermediate time). ◻
]

#thm([Proposition 5.3.])[
  (Partial mixing at fixed omitted fraction).  #emph[For fixed $0 < rho lt.eq 1$, set $s = ceil.l 320 \/ rho ceil.r$. For all sufficiently large $d$ depending only on $rho$, after $2 s$ sweeps the positions of any ordered tuple of $b lt.eq \( 1 - rho \) N$ distinct labels are within $epsilon_N = N^(- 8)$ in total variation of the uniform ordered injection, from any deterministic start. The same assertion holds for sweeps in reverse order $d \, dots.h \, 1$.]
] <prop:reset-partial-mixing>

#proof[
  By Lemma 8, after $s$ pairs of sweeps the bound is $N^(- 20) L$, since $s rho \/ 16 gt.eq 20$.
  Take the ordered tuple in the proposition, indexing its labels by $1 \, dots.h \, b$. For label $i$, condition on the trajectories of labels 1 through $i - 1$. The number of holes is at least $rho N$. Initialize signed mass by the point mass for $i$ minus uniform mass on the holes, so its squared norm is at most 1. By the conditional trajectory description the final signed mass is the endpoint probability difference from uniform on positions other than the previous labels’ endpoints. Its expected total variation norm is at most $1 / 2 sqrt(N) thin N^(- 10)$ by Cauchy–Schwarz and the squared-norm bound. Conditioning on just the previous labels’ endpoints instead does not increase this expected bound, by averaging (the uniform reference is unchanged given those endpoints). Total variation from the uniform joint injection is bounded by summing these conditional variation estimates: telescope the laws using the actual distribution for an initial segment and the uniform sequential conditional kernels for the remaining labels. This proves the asserted total-variation bound. Its proof only used the order of the coordinates as an indexing, so works in the reversed order as well. ◻
]

#thm([Corollary 5.4.])[
  (Forward reset minorization).  #emph[Let $K$ be the kernel of the $2 s$ forward sweeps in Proposition 9 on an ordered injection state space $Omega$ with $b lt.eq \( 1 - rho \) N$ labels. Then 
$ K^2 \( x \, y \) gt.eq frac(p_0, \| Omega \|) \, #h(2em) p_0 = 1 - 2 epsilon_N . $

]
] <prop:reset-minorization>

#proof[
  The kernel $K$ is doubly stochastic. Its transpose $K^(*)$ uses the inverse permutation law, sweeps in reversed order, so Proposition 9 applies row-wise to both kernels. Write
  $ K^2 \( x \, y \) = sum_z K \( x \, z \) K^(*) \( y \, z \) . $
  In this inner product truncate each factor above by $w = 1 \/ \| Omega \|$ (take the minimum). The truncated factors are $w - a_z \, w - b_z$ with nonnegative deficits satisfying $sum_z a_z lt.eq epsilon_N$ and $sum_z b_z lt.eq epsilon_N$; their product is at least $w^2 - w \( a_z + b_z \)$, giving the displayed lower bound. ◻
]

=== 5.2 Comparison conditional on a switch environment <comparison-conditional-on-a-switch-environment>

We have proved uniform marginal control in both coordinate orders and converted it into pointwise minorization. The reverse-order estimate was used to control columns of the forward kernel; the actual reset is still a product of forward sweeps. We next exploit the minorization without changing that actual run.

From now on let $rho = 2^(- 20)$, with $d$ sufficiently large, and fix a set of $k = rho N$ nonhole labels; let $H$ be the set of $h = N - k$ hole labels. These roles of the labels are for the comparison only. Run $l = 128$ blocks, each consisting of a reset of $4 s$ sweeps followed by a single mixing sweep (all sweeps are actual random shuffles). Write $X$ for the process as permutations taking labels to positions.

Define an environment by revealing all the reset coins and, during the single mixing sweep of each block, revealing the switches touched by the nonhole trajectories and their values. The environment determines all nonhole paths. Conditional on it, the unrevealed switches during mixing sweeps (the two-hole switches) are independent and fair, by the fixed-values observation as for trajectories earlier: every completion has the same nonhole paths, using also the fixed reset values. We may generate $Y$ independently of $X$ conditional on the environment with the same conditional law, by sharing the reset and touched switch values and independently redrawing the two-hole switches during mixing sweeps. The copies have the same nonholes in the same positions. Unconditionally this joint generation can be done chronologically, generating fresh coins for $X$ and using independent coins for the redraws (the switches to be redrawn in a layer are known upon entering it).

For this environment $cal(E)$, let $p_(cal(E))$ be the final law of the hole assignment conditional on $cal(E)$, a bijection from the $h$ hole labels to their available endpoint positions, and let $u_(cal(E))$ be uniform on those $h !$ assignments.

#thm([Proposition 5.5.])[
  (Uniformity conditional on the reset environment).  #emph[For the run just defined, with $rho = 2^(- 20)$, $s = ceil.l 320 \/ rho ceil.r$ and $l = 128$ blocks of $4 s$ reset sweeps followed by one mixing sweep, 
$ bb(E) parallel p_(cal(E)) - u_(cal(E)) parallel_(upright("TV")) arrow.r 0 #h(2em) \( d arrow.r oo \) \, $

 uniformly over deterministic starting decks. The environment $cal(E)$ reveals every reset coin and the nonhole paths during the mixing sweeps, as above.]
] <prop:reset-conditional>

#proof[
  The relative permutation $X^(- 1) Y$ acts on $H$, starts at the identity and does not change during a reset. In a layer of a mixing sweep it is multiplied on the left by a product of relative transpositions: transpose the two incident labels of $X$ at a two-hole switch if the value for $Y$ differs. Indeed if the switches act by $T_X \, T_Y$ on positions and $X \, Y$ here denote the pre-layer values, the new relative permutation is $\( X^(- 1) T_X^(- 1) T_Y X \) X^(- 1) Y$. Given the $X$ switches and paths, these relative toggles are independently fair. We write $Q$ for the resulting multiplier over one mixing sweep; it only uses the hole injection for $X$ at the sweep start and the switches (including redraws) in that sweep, not the prior relative permutation.
  For now mark two types of events for $X$ only (and these marks do not change its run). At each reset mark an acceptance such that the injection of the $h$ ordered hole labels just afterwards, jointly with acceptance, has probability $p_0 \/ \| Omega \|$ for each injection conditional on the past. This is the elementary minorization-splitting mechanism developed systematically by Nummelin [15] Section 2. Here the calculation is finite and explicit. By the $K^2$ bound applied with $b = h$, given the start $x$ and sampled endpoint $y$ of the hole labels, accept with probability $p_0 \/ \( \| Omega \| K^2 \( x \, y \) \)$ using independent extra randomness. The statement holds also with the past including the other copy in the chronological construction (we do not condition here on the environment, and the relative permutation is unchanged during the reset).
  To describe the second mark, consider a mixing sweep with hole injection for $X$ uniform at its start, as upon acceptance. The graph on all positions at the start, connecting two whose paths share a switch in $X$, is simple and $d$-regular: after two paths meet they differ in that updated bit which doesn’t change again during the sweep, so they cannot meet at a switch along any later coordinate. This graph is defined by the fresh $X$ coins independent of the hole injection; given the graph the nonholes are on a uniform $k$-subset of vertices. The probability any vertex has at least $ceil.l d \/ 2 ceil.r$ nonhole neighbors is at most
  $ N 2^d rho^(d \/ 2) = N^(- 8) $
  by a union bound and sampling without replacement. Mark the mixing sweep as good for $X$ on the complementary event; every hole label then has at least $d \/ 2$ two-hole switches on its path.
  Let $nu$ on the symmetric group on $H$ be the subprobability law of $Q$ with this goodness requirement when the $X$ hole injection starts uniformly. Its mass $q$ is at least $1 - N^(- 8)$. The increment and goodness depend on no nonhole identities, and this law is central (invariant under conjugation) by the symmetry of the uniform injection under hole relabelings. After a reset, jointly requiring acceptance and goodness gives exactly this sublaw with the additional factor $p_0$: writing $cal(F)$ for the past before the reset in the chronological construction, we have
  $ Pr \( upright("accept") \, upright(" good") \, Q = g divides cal(F) \) = p_0 nu \( g \) . $
  In particular if $G_X$ denotes all accepts and all good marks for $X$, and $S$ denotes the final relative permutation, we have
  $ Pr \( G_X \) = \( p_0 q \)^l \, #h(2em) Pr \( S = upright("id") \, G_X \) = p_0^l thin nu^(* l) \( upright("id") \) . $
  Indeed, for the relative multiplication the placement of $X$’s holes after the accepted reset is uniform independent of the past, regardless of the current relative permutation. The relative coin differences in the next sweep come from the independent redraws and give the multiplier law described above, allowing iteration with convolution.
  We record two properties used to estimate this convolution. Conditional on $X$ in a good mixing sweep, the sign of $Q$ is fair since there is a two-hole switch and the relative toggles are independent. And for any $A subset H$,
  $ nu { Q : med Q upright(" fixes ") A upright(" pointwise") } lt.eq 2^(- d \| A \| \/ 4) lt.eq h^(- \| A \| \/ 4) . $
  For this estimate, imagine using the switches for $Y$ but starting the mixing sweep at the very same permutation as $X$. The final relative permutation for this sweep would be $Q$. Within one sweep a path with given start and end is unique (updated bits equal end bits and not-yet-updated bits equal start bits). Fixation of a label thus requires agreement at every switch on its $X$ path. In a good sweep at least $d \| A \| \/ 4$ distinct two-hole switch coins are involved on the paths for $A$, counting any such switch at most twice towards the path incidences. Their agreement probability gives the bound.
  === 5.3 Return estimate for the central sublaw <return-estimate-for-the-central-sublaw>
  The accepted reset has made the relative increments central and independent of their previous product. The remaining question is how quickly their convolution puts mass $1 \/ h !$ at the identity. This return estimate will control the mean squared density of a conditional assignment, rather than an unconditional marginal. We show
  $ h ! thin nu^(* l) \( upright("id") \) lt.eq q^l + o \( 1 \) . $
  Use Lemmas 5 and 6 with group size parameter $h$. For a permutation $sigma$ of $H$, let $F \( sigma \)$ count its fixed points. Write $theta_lambda = sum_sigma nu \( sigma \) chi_lambda \( sigma \) \/ d_lambda$, where $d_lambda$ is the irreducible degree. Taking $delta = 1 \/ 32$ in Lemma 5, for $F lt.eq h^(7 \/ 8)$ the normalized absolute character is at most $d_lambda^(- 1 \/ 32)$ for large $h$. For $f > h^(7 \/ 8)$ the pointwise fixation estimate gives
  $ nu \( F = f \) lt.eq binom(h, f) h^(- f \/ 4) lt.eq h^(- f \/ 10) $
  for large $h$, using $binom(h, f) lt.eq \( e h \/ f \)^f$. The all-fixed-point bound (4.3) gives
  $ \| chi_lambda \( sigma \) \| \/ d_lambda lt.eq d_lambda^(- 1 \/ 32) h^(f \/ 32) . $
  The tail satisfies
  $ sum_(f > h^(7 \/ 8)) h^(- f \( 1 \/ 10 - 1 \/ 32 \)) lt.eq 1 $
  for large $h$. Summing these character estimates against $nu$ therefore gives $\| theta_lambda \| lt.eq 2 d_lambda^(- 1 \/ 32)$.
  By centrality each averaged representation matrix is scalar by Schur’s lemma, with scalar $theta_lambda$. Taking the regular representation trace for the convolution therefore gives $h ! thin nu^(* l) \( upright("id") \) = sum_lambda d_lambda^2 theta_lambda^l$. The trivial term is $q^l$ and the sign term is zero. With $l = 128$ the sum of absolute values of the other terms is at most $2^l sum_lambda d_lambda^(- 2)$ excluding those two terms, hence is $o \( 1 \)$ by Lemma 6. This proves the return estimate.
  === 5.4 From the return estimate to conditional uniformity <from-the-return-estimate-to-conditional-uniformity>
  Write $p_(cal(E))^G$ for the subprobabilities of $p_(cal(E))$ including the requirement $G_X$. For the conditionally independent copy $Y$, define its own event $G_Y$ by the same acceptance and goodness requirements, with independent auxiliary randomness. By the triangle inequality with the subprobabilities and Cauchy–Schwarz,
  $ bb(E) parallel p_(cal(E)) - u_(cal(E)) parallel_(upright("TV")) lt.eq 1 / 2 Pr \( G_X^c \) + 1 / 2 sqrt(h ! Pr \( S = upright("id") \, G_X \, G_Y \) - 2 Pr \( G_X \) + 1) . $
  Indeed $p_(cal(E)) - p_(cal(E))^G$ is nonnegative of expected mass $Pr \( G_X^c \)$, and for the remaining difference with uniform the expression inside the square root is the expectation of $h ! sum \( p_(cal(E))^G - 1 \/ h ! \)^2$. This identity uses the two conditionally independent copies and their separate marks; assignment agreement is $S = upright("id")$. Dropping $G_Y$ from the positive term and using the convolution formulas with the return estimate bounds the expression by $1 - \( p_0 q \)^l + o \( 1 \) = o \( 1 \)$; likewise $Pr \( G_X^c \) = o \( 1 \)$. This truncation by good subprobabilities only costs small mass in total variation. All estimates are uniform over the deterministic starting deck, proving Proposition 11. ◻
]

=== 5.5 Full-deck mixing <full-deck-mixing>

#proof[
  Unconditionally, the nonhole marginal is close to uniform: the first $2 s$ sweeps already have the partial mixing estimate for its $k$ labels, and subsequent independent switches in the actual run preserve the uniform marginal kernel-wise, so they cannot increase its distance from uniform. Thus its total variation from uniform is at most $epsilon_N$. The distribution obtained by assigning holes uniformly given the environment has these very nonhole endpoints and uniform assignment on their complement, so is within $epsilon_N$ of uniform on the whole deck. By the conditional bound, the actual endpoint distribution differs from this distribution by $o \( 1 \)$ in total variation. The bound is independent of the initial deck. We have proved an upper bound on the required time for large $d$ by $128 \( 4 s + 1 \) d$ physical shuffle steps. With $rho = 2^(- 20)$, $s = 320 dot.op 2^20 = 335544320$, and the resulting upper time is $171798691968 d$ complete shuffles. ◻
]

The support obstruction was proved in Section 2; in particular it implies the lower bound $t_(upright("mix")) gt.eq d$ for all sufficiently large $d$.

== 6 Trajectory overlays and row-column-row mixing <special:overlay>

We add independent switches along selected trajectories of a base shuffle. A character estimate mixes the resulting permutation on one group of indices. A sequence of calls on two transverse partitions then reduces full mixing to a local limit theorem for finite contingency tables.

Unlike the first route, which conditions on specified outside labels, this route conditions on a complete base shuffle. Independent extra switches then permute chosen groups of base indices. Predictability of their placement ensures that the resulting physical shuffle still has the original law. The useful output is uniformity of an entire group permutation conditional on the base, on average over that base.

Use $V = bb(F)_2^d$, with the convention that the later permutation acts on the left. For a finite set $A$, write $frak(S) \( A \)$ for its symmetric group. As in Section 2, the layer directions are cyclic and their current phase may be arbitrary.

The #strong[base shuffle] has exactly these layer dynamics. We first prove a partial mixing estimate to prepare the environments for the extra switches.

#thm([Theorem 6.1.])[
  (Trajectory-overlay construction).  #emph[For $n = 2^d$, the full-deck law from any deterministic start has total-variation distance tending to zero from uniform after $33030144 d$ physical shuffles.]
] <thm:overlay>

=== 6.1 Mixing a fraction of the base indices <mixing-a-fraction-of-the-base-indices>

Fix $K = 8$, and let $q = n \/ K$; throughout this section only sufficiently large $d$ need be considered.

#thm([Lemma 6.2.])[
  (Preparing a group of base indices).  #emph[After $20 d$ layers, the ordered positions of any $q$ specified cards in the base shuffle have total-variation distance $o \( 1 \)$ from uniform ordered distinct positions. The estimate is uniform in their starting positions and in the starting cyclic phase.]
] <lem:overlay-preparation>

#proof[
  The same deferred-column realization appears in the companion on random coordinate frames [20] Lemma “Independent shear realization”; we give the construction here for the required one-eighth-deck estimate.
  We introduce a randomized linear change of frame, just for proving this estimate. Restart notation at layer 1 for the layers in the estimate, with cyclically ordered $i_1 \, i_2 \, dots.h$. Represent the layer permutation as $L_t tilde(T)_t$, where $tilde(T)_t$ is an independent ordinary fair layer along $e_(i_t)$, and
  $ L_t x = x + ell_t \( x \) e_(i_t) . $
  Here $ell_t$ are independent random linear forms subject to $ell_t \( e_(i_t) \) = 0$, uniform under that condition and independent of the $tilde(T)_t$’s. Each $L_t$ consists of switches on the same matching, so this factorization has the required shuffle law. With $A_t = L_t dots.h.c L_1$, $A_0 = I$, map locations after layer $t$ through $A_t^(- 1)$. In this frame the layer dynamics conditional on the $L_s$’s are independent arrays of fair switches in directions
  $ v_t = A_(t - 1)^(- 1) e_(i_t) \, $
  by conjugating $tilde(T)_t$. Their conditional laws depend only on the directions.
  For $t > d$, conditional on previous directions, $v_t$ is uniform outside the hyperplane spanned by $v_(t - d + 1) \, dots.h \, v_(t - 1)$. In fact the columns of the inverse transform evolve by
  $ A_s^(- 1) e_j = A_(s - 1)^(- 1) e_j + ell_s \( e_j \) v_s \, $
  using $L_s^(- 1) = L_s$. Thus
  $ v_t = v_(t - d) + sum_(s = t - d + 1)^(t - 1) ell_s \( e_(i_t) \) v_s . $
  These coefficients are independent fair bits independent of all $v_p$ for $p < t$: in the indicated range they update only the column $i_t$, not used as a direction again until time $t$ (so they do not affect updates via $v_s$ before then either). All coordinates of each form except its constrained one are independent on the coordinate basis. The first $d$ directions are independent in the linear-algebra sense, by triangularity of the updates, and inductively every window of $d$ directions is linearly independent by the last display. This proves the assertion about the hyperplane.
  Order the $q$ cards. In the changed frame, let $p_t$ be the conditional position distribution of card $j$ given the directions through layer $t$ and the paths through layer $t$ of cards $1 \, dots.h \, j - 1$. Write $F_t$ for the free positions, i.e. those not occupied then by the given $j - 1$ cards, with size $r = n - j + 1$. We track $u_t \( x \) = p_t \( x \) - 1 \/ r$ on $F_t$. The recursive conditional-law calculation can be done as follows. Reveal the new direction, then the updates of the given path cards. Neither revelation biases the previous law of card $j$ given the history: the new direction’s law given past directions is independent of the past switches, and the updates of the path cards in this direction are from fair switches on their edges with law independent of card $j$’s location. Conditional on the updates, the switches on the other edges are still fair and independent. On any pair of two free sites the probabilities of card $j$ are averaged. For a free site paired with a path card, its probability is deterministically moved to the new free site of that pair. These operations carry the uniform law on the free sites to the new such uniform law. Consequently $sum u_t^2$ does not increase in an update, and its decrease includes $\( u_t \( x \) - u_t \( y \) \)^2 \/ 2$ for each matched pair of free sites before the update.
  After the first $d$ layers, split the free sites just before an update into $F^0 \, F^1$ using the two cosets of the hyperplane for its direction. Given the history so far, every opposite-side pair is matched with probability $2 \/ n$. Both sides have size at least $n \/ 2 - q$. Suppressing the time subscript, we have
  $ sum_(x in F^0 \, y in F^1) \( u \( x \) - u \( y \) \)^2 med gt.eq med \( n \/ 2 - q \) sum_x u \( x \)^2 $
  because the two sums of $u$ on the respective sides are negatives of one another. The conditional expected ratio bound for the new squared norm relative to the old is therefore $1 \/ 2 + q \/ n$, meaning the new expectation is at most this multiple of the old squared norm. Since the initial squared norm is at most 1, at $T = 20 d$ the expected total-variation distance of the conditional law from uniform on the free sites is at most
  $ 1 / 2 sqrt(n) thin \( 1 \/ 2 + q \/ n \)^(\( T - d \) \/ 2) $
  by Cauchy-Schwarz.
  At this last time the conditional law given the full linear transforms and the path data in their frame only needs the directions and the path data, by the conditional switch laws. Undoing the final linear transform preserves the comparison with the uniform free-site law. Giving only the linear transforms and the previous cards’ #emph[final positions] instead of their paths cannot increase the expected bound (by mixing the conditional laws; the uniform comparison depends only on final positions given the transforms). Summing the bound over $j lt.eq q$ bounds the expectation over the transforms of the distance of the ordered $q$-tuple law conditional on them from uniform. Here we used the sequential total-variation bound by the sum of expected distances of the successive conditional laws from the uniform remaining-site laws; it follows by replacing conditionals from last to first and using the triangle inequality. Our sum tends to zero since $q = n \/ 8$ and $n = 2^d$. Unconditioning proves the partial mixing estimate. ◻
]

=== 6.2 An overlay on the base trajectories <an-overlay-on-the-base-trajectories>

The marginal estimate has prepared the starting positions of the indices that will receive extra switches. We now define those switches so that their conditional law can be studied separately while the resulting physical process remains an ordinary Thorp shuffle.

Call the initial position names of the base shuffle its #strong[indices], in $V$. Just before a layer, the matching of locations induces a matching of the indices via their base positions at that time. We can put extra switches on selected edges of this index matching chosen from the pre-layer base data. In our overlay construction we supply these switches from fresh arrays of independent fair coins independent of the base arrays. Form the actual layer coins on the location pairs by xoring the corresponding extra bits (0 where absent) with the base bits. The actual shuffle has the ordinary law: conditional on the past and the extra bits for a layer, the base bits in that layer still have their independent uniform law, since the selection and extra bits do not use the current base coins. So the resulting coin array has the independent fair law at every layer given the past. If the base permutation (indices to current positions) is $B$, the actual permutation is $B D$, with $D$ the overlay permutation on indices, initialized to the identity. At each layer $D$ is left-multiplied by the extra switches in the pre-layer index matching and $B$ is then updated by the base switches on locations. This gives exactly the xor dynamics just specified.

For a fixed group $A subset.eq V$ of $q$ indices, we call the following procedure a #emph[call] on $A$.

#thm([Proposition 6.3.])[
  (A conditional group permutation).  #emph[Let $A subset V$ have $q = n \/ 8$ indices. Use $k = 65536$ phases, each consisting of $20 d$ preparation layers without extra switches and one active sweep with extra switches on the pairs whose two base indices belong to $A$. Let $kappa_(cal(B))$ be the law of the resulting multiplier on $frak(S) \( A \)$ conditional on the full base shuffle $cal(B)$. Then 
$ sup_(upright("pre-call base histories")) bb(E) #scale(x: 120%, y: 120%)[\[] parallel kappa_(cal(B)) - U_A parallel_(upright("TV")) divides upright("pre-call history") #scale(x: 120%, y: 120%)[\]] arrow.r 0 . $

 The assertion is uniform in the starting cyclic phase and in the initial base placement. The multiplier law is independent of the incoming overlay permutation.]
] <prop:overlay-call>

Given the base trajectories, the left multiplier is a product of independent random permutations on $A$, with laws determined, phase by phase, by the segments of ordered base trajectories of $A$ in the active layers (including their positions just before the active layers). These laws describe the multipliers irrespective of the incoming overlay. For analyzing the expected conditional distance we can use an ideal experiment with #emph[independent] such segments, each started from uniform ordered distinct locations of the indices in $A$ and run with ordinary base layers. Indeed the joint law of the actual segments, even given data before the call, is within $o \( 1 \)$ in total variation of this ideal segment law for constant $k$. This follows by Lemma 13 in each $20 d$-layer preparation interval, conditional on earlier base history, followed by the same ordered-location transition dynamics on the active layers. These dynamics do not depend on the placements of other indices. Equivalently one can couple each new segment start to a fresh uniform one and use matched segment dynamics when the coupling succeeds, with failure probability bounded by the sum of the partial mixing errors. Since the conditional distance is a bounded function of the segments, it suffices to bound its expectation in the ideal experiment.

It remains to prove the conditional group estimate for these independent ideal segments, which we do next.

=== 6.3 Estimate for an ideal active segment <sec:overlay-ideal>

Let $E$ denote an ideal segment environment, i.e. the ordered placement and $d$-layer base trajectories of $A$ in the experiment above. Conditional on $E$, denote by $mu_E$ the law of the overlay multiplier on $A$ generated by the internal extra switches. We visualize its generation with labels starting at the corresponding indices of $A$ (identity overlay at the start for describing this multiplier); in locations, these labels follow the actual switched paths. An internal encounter of such a label is when it is on a location pair having two indices in $A$. The set of locations occupied by the labels from $A$ is precisely the base location set of $A$ throughout. Thus in the actual switch dynamics an internal encounter is pairing with another label from $A$.

Fix constants

$ h = 1 \/ 32 \, #h(2em) eta = 1 \/ 4096 \, #h(2em) delta = eta \/ 4 . $

Call the extra-switch outcome good if at most $q^(1 - eta) \/ 2$ of its labels have fewer than $h d$ internal encounters. Denote by $mu'_E$ the subprobability obtained from $mu_E$ by counting only switch outcomes that are good (there is no renormalization).

The mass discarded has expectation $o \( 1 \)$. For every fixed starting placement, averaging over the base and extra switches gives the same product law of independent fair actual switch arrays, by predictability and the base-coin xor argument. Hence the actual location-switch array is independent of the uniformly sampled starting placement of $A$, even though the choice of extra edges depends on that placement. In $d$ consecutive directions, any two actual labels (considering labels on all the start sites) can be paired at most once. They could pair only at the direction of the #emph[last], in layer order, of the bits on which their start sites differed. Before that direction such an unchanged different bit would preclude pairing on another direction. Afterwards all still unprocessed bits are equal, so pairing in an unprocessed direction (requiring a difference there) is impossible. Each label therefore has $d$ distinct partners. Conditional on a specified active label’s start position and on the actual location switch arrays, its partners’ start positions are determined; the other $q - 1$ active start positions are a uniform subset among the $n - 1$ others. Its number of encounters is hypergeometric from sampling $d$ sites out of $n - 1$ with $q - 1$ active. This law differs from a binomial with parameters $d \, \( q - 1 \) \/ \( n - 1 \)$ in total variation by at most $binom(d, 2) \/ \( n - 1 \)$, by coupling sampling with and without replacement. For large $n$ the binomial mean is at least $d \/ 16$; the probability to be below $h d$ is at most $exp \( - d \/ 128 \)$ by the binomial Chernoff bound. With the sampling error included, the resulting bound times $q^eta$ tends to zero. The expected number of low-encounter labels and Markov’s inequality now give the claim on discarded mass.

Let $alpha \, beta$ be outcomes of independent extra-switch arrays given $E$, identified also with their permutations. Write $F$ for the number of fixed points of $alpha^(- 1) beta$. For all sufficiently large $n$ and integers $f gt.eq q^(1 - eta)$, we have

#[#set math.equation(numbering: n => "(6.1)")
 $ Pr \( alpha upright(" good") \, med F gt.eq f \) med lt.eq med q^(- c_(*) f) \, #h(2em) c_(*) = h \/ 8 \, #h(2em) \( f lt.eq q \) . $ <special:overlay:eq:1>]

Indeed fix $E$ and the switches of a good $alpha$. Agreement of the two paths of a label at their endpoint (i.e. agreement of the output index) requires agreement at every layer: in locations in the cyclic-direction frame, the start and end of a $d$-layer path specify it since each bit is processed only once. For any set of $f$ agreed labels at least $f \/ 2$ have at least $h d$ encounters in $alpha$’s outcome. Making $beta$ follow those paths fixes its extra coins on their internal encounters, at least $h d f \/ 4$ distinct coins since each pair can be counted at most twice in its layer. These coins are independent given $E$. Union bounding over sets costs at most $binom(q, f) lt.eq \( e q \/ f \)^f$; this times $2^(- h d f \/ 4)$ is at most $q^(- h f \/ 8)$ by $d gt.eq log_2 q$ and the choice of $eta$, for large $n$. This proves (6.1).

We use irreducible complex unitary representations $pi_lambda$ of $frak(S) \( A \)$ with dimensions $D_lambda$ and (un-normalized) characters $chi_lambda$. Write $hat(nu) \( lambda \) = sum_g nu \( g \) pi_lambda \( g \)$ for the matrix of a (possibly subprobability) law. Define the per-segment factor

#[#set math.equation(numbering: n => "(6.2)")
 $ b_lambda = 1 / D_lambda bb(E)_E "Tr" #h(-0.16667em) (hat(mu'_E) \( lambda \)^(*) thin hat(mu'_E) \( lambda \)) = bb(E) #h(-0.16667em) [upright(bold(1))_(alpha med upright("good") \, thin beta med upright("good")) thin frac(chi_lambda \( alpha^(- 1) beta \), D_lambda)] . $ <special:overlay:eq:2>]

The second equality uses the independent switches of $alpha \, beta$ conditional on $E$. Moreover the expectation of the matrix inside the trace is $b_lambda I$. The law of the subprobability kernel is invariant under conjugating by permutations of $A$: this renames the uniformly placed indices, with the same good-outcome rule. The scalar matrix claim follows by Schur’s lemma. The representation-theoretic background used here is recalled in [21,3].

Apply Lemma 5 with group size $q$ and $delta = eta \/ 4 = 1 \/ 16384$. Since $4 delta = eta$, if the number $f$ of fixed points is at most $q^(1 - eta)$, then

$ frac(\| chi_lambda \( sigma \) \|, D_lambda) lt.eq D_lambda^(- delta) . $

For all $f$, the same lemma gives

#[#set math.equation(numbering: n => "(6.3)")
 $ frac(\| chi_lambda \( sigma \) \|, D_lambda) lt.eq D_lambda^(- delta) q^(delta f) . $ <special:overlay:eq:3>]

Applying the small-$f$ bound and (6.1), (6.3) in (6.2) (bounding by absolute values), and using $delta < c_(*)$, yields

#[#set math.equation(numbering: n => "(6.4)")
 $ 0 lt.eq b_lambda med lt.eq med 2 D_lambda^(- delta) $ <special:overlay:eq:4>]

for large $q$, since $sum_(f gt.eq q^(1 - eta)) q^(- \( c_(*) - delta \) f) = o \( 1 \)$. For the sign representation we have the better bound $b_(upright("sign")) = o \( 1 \)$. If the environment contains any internal match then the sign expectation before truncation is zero by the fair extra coin on it. Its magnitude after truncation is then at most the mass discarded. If there is no internal match, no outcome is good, for large $q$. This proves the sign estimate by the bound on expected discarded mass.

The reciprocal-degree estimate of Lemma 6 gives

#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(lambda : thin D_lambda > 1) D_lambda^(- 2) = o \( 1 \) . $ <special:overlay:eq:5>]

Now take $k = ceil.l 4 \/ delta ceil.r$. In the independent segment experiment let $nu'$ denote the product law obtained by convolving the $k$ subprobabilities (multipliers applied on the left). At each nontrivial representation the expected squared Hilbert-Schmidt norm of its matrix is $D_lambda$ times the product of the $b_lambda$ factors: iteratively use independence and the scalar matrix expectation after (6.2) for the latest matrix in the product. The estimates are uniform even if cyclic phases differ. By finite group Plancherel, for the uniform probability $U_A$ on $frak(S) \( A \)$,

$ q ! sum_g \| nu' \( g \) - U_A \( g \) \|^2 = \| nu' \( frak(S) \( A \) \) - 1 \|^2 + sum_(lambda eq.not upright("triv")) D_lambda parallel hat(nu') \( lambda \) parallel_(upright("HS"))^2 . $

The mass deficit tends to zero in expectation (bounded by the sum of discarded masses), thus also in expected square. The expected sign term tends to zero. The expected sum for $D_lambda > 1$ is at most

$ 2^k sum_(D_lambda > 1) D_lambda^(2 - delta k) = o \( 1 \) $

by (6.4), (6.5). These account for all irreducibles (the one-dimensional ones being trivial and sign for large $q$). By Cauchy-Schwarz the expected $ell^1$ error tends to zero. Reinstating the discarded masses costs $o \( 1 \)$ also in expected $ell^1$, since the product law before truncation dominates $nu'$ pointwise. This proves Proposition 14 for independent segments, and hence for the actual segments by the comparison in the call construction.

=== 6.4 From group calls to the whole permutation <from-group-calls-to-the-whole-permutation>

We can now randomize any one prescribed group of $n \/ 8$ indices, conditional on the base in expected total variation. Mixing the groups of just one partition would preserve which labels belong to each group. Two transverse partitions remove that obstruction. We prove the required three-round comparison, including its discrete total-variation conclusion.

Choose two partitions of the base index set $V$, one into $R_1 \, dots.h \, R_K$, the other into $C_1 \, dots.h \, C_K$, with $\| R_i ∩ C_j \| = n \/ K^2$; this is possible for large $d$. Make calls for the $R$-groups, then the $C$-groups, then the $R$-groups again, one call for each group of the indicated partition, in any fixed order within each partition. Conditional on the full base, the multipliers from distinct calls are independent (they use independent extra coins on edges prescribed from the base). In expectation over the base, their product law has total-variation error $o \( 1 \)$ from the product law using independent uniforms on the called groups. This follows by the per-call error just proved, summed over the $3 K$ calls, replacing conditional laws in the product and mapping to the composed permutation. Inside each partition these ideal uniforms together act as an independent uniform shuffling within each group.

The remaining comparison concerns only uniform group shuffles. Alternating independent row and column permutations were studied by Håstad in the square lattice shuffle [4]. Here the number of blocks is fixed and their intersections grow; the proof uses the resulting contingency-table local limit.

#thm([Lemma 6.4.])[
  (Three rounds on transverse partitions).  #emph[Let $R_1 \, dots.h \, R_K$ and $C_1 \, dots.h \, C_K$ partition $V$, with $\| R_i ∩ C_j \| = n \/ K^2$. Independently shuffle uniformly within every $R$-group, then within every $C$-group, and then within every $R$-group again. For the fixed $K = 8$ and $n = 2^d$, the resulting permutation law has total-variation distance $o \( 1 \)$ from uniform on $frak(S) \( V \)$ as $d arrow.r oo$.]
] <lem:transverse-rounds>

#proof[
  The product law is invariant on both right and left by the product subgroup of permutations within the $R$-groups, due to the first and last ideal shuffles. As with a uniform permutation, its probabilities are constant on permutations having the same count matrix $X = \( X_(i j) \)$, where $X_(i j)$ counts moves from $R_i$ to $R_j$. Indeed permutations with equal counts can be identified by rearranging inputs within the groups (matching their output groups) and then rearranging outputs within the groups. Thus it suffices to compare just the count laws.
  For a uniform permutation let this table law be $p_n$; in general write $p_M$ for the analogous law on $M$ items for $K$ groups of equal size $m = M \/ K$. Its probability is zero off nonnegative integer tables with all row and column sums $m$, and on such tables is
  #[#set math.equation(numbering: n => "(6.6)")
   $ p_M \( x \) = frac(\( m ! \)^(2 K), M ! product_(i \, j) x_(i j) !) . $ <special:overlay:eq:6>]
  This follows by partitioning each input group into its outputs’ groups, then ordering the inputs assigned to each output group. In the ideal shuffle, at the middle stage each $C$-group contains $n \/ K^2$ labels from each initial $R$-group. Within each $C$-group these labels are uniformly permuted with also $n \/ K^2$ slots belonging to each $R$-group. Conditional on the first shuffles the resulting tables within the $C$-groups are independent with law $p_(n \/ K)$, independent in law of that conditioning. The last $R$-shuffles do not change total counts. Write $T^(\( ell \))$ for the row-to-row count table contributed by $C_ell$. These tables are independent with law $p_(n \/ K)$, each has row and column sums $a_0 = n \/ K^2$, and $X_(i j) = sum_(ell = 1)^K T_(i j)^(\( ell \))$. Figure 2 distinguishes the geometric columns from the destination-group columns of these tables.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 2.04), (2.72, 2.72), fill: rgb("#e0e0ff"), stroke: none)
  content((-0.14, 2.38), [#text(size: 9pt)[$R_1$]], anchor: "east", padding: 0.1176cm)
  content((0.34, 2.38), [#text(size: 9pt)[$a_0$]])
  content((1.02, 2.38), [#text(size: 9pt)[$a_0$]])
  content((1.7, 2.38), [#text(size: 9pt)[$a_0$]])
  content((2.38, 2.38), [#text(size: 9pt)[$a_0$]])
  rect((0, 1.36), (2.72, 2.04), fill: black, stroke: none)
  content((-0.14, 1.7), [#text(size: 9pt)[$R_2$]], anchor: "east", padding: 0.1176cm)
  content((0.34, 1.7), [#text(size: 9pt)[$a_0$]])
  content((1.02, 1.7), [#text(size: 9pt)[$a_0$]])
  content((1.7, 1.7), [#text(size: 9pt)[$a_0$]])
  content((2.38, 1.7), [#text(size: 9pt)[$a_0$]])
  rect((0, 0.68), (2.72, 1.36), fill: rgb("#ffe8d1"), stroke: none)
  content((-0.14, 1.02), [#text(size: 9pt)[$R_3$]], anchor: "east", padding: 0.1176cm)
  content((0.34, 1.02), [#text(size: 9pt)[$a_0$]])
  content((1.02, 1.02), [#text(size: 9pt)[$a_0$]])
  content((1.7, 1.02), [#text(size: 9pt)[$a_0$]])
  content((2.38, 1.02), [#text(size: 9pt)[$a_0$]])
  rect((0, 0), (2.72, 0.68), fill: black, stroke: none)
  content((-0.14, 0.34), [#text(size: 9pt)[$R_4$]], anchor: "east", padding: 0.1176cm)
  content((0.34, 0.34), [#text(size: 9pt)[$a_0$]])
  content((1.02, 0.34), [#text(size: 9pt)[$a_0$]])
  content((1.7, 0.34), [#text(size: 9pt)[$a_0$]])
  content((2.38, 0.34), [#text(size: 9pt)[$a_0$]])
  line((0, 0), (0, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((0, 0), (2.72, 0), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((0.68, 0), (0.68, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((0, 0.68), (2.72, 0.68), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((1.36, 0), (1.36, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((0, 1.36), (2.72, 1.36), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((2.04, 0), (2.04, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((0, 2.04), (2.72, 2.04), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((2.72, 0), (2.72, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((0, 2.72), (2.72, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  content((0.34, 2.98), [#text(size: 9pt)[$C_1$]])
  content((1.02, 2.98), [#text(size: 9pt)[$C_2$]])
  content((1.7, 2.98), [#text(size: 9pt)[$C_3$]])
  content((2.38, 2.98), [#text(size: 9pt)[$C_4$]])
  rect((2.04, 0), (2.72, 2.72), stroke: (paint: rgb("#262626"), thickness: 1.1pt, miter-limit: 10))
  content((1.36, 3.48), [#text(size: 9pt)[Before the column shuffles]])
  content((1.36, -0.51), [#text(size: 9pt)[Each cell contains $a_0=n"/"K^2$ labels#linebreak()of its initial row color.]])
  line((2.79, 1.36), (4.8, 1.36), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.79, 1.9), [#text(size: 9pt)[shuffle within#linebreak()one $C_ ell$]])
  content((3.79, 0.97), [#text(size: 9pt)[\(here $ell =4$\)]])
  content((5.84, 2.38), [#text(size: 9pt)[$R_1$]], anchor: "east", padding: 0.1176cm)
  content((6.34, 2.38), [#text(size: 9pt)[$T^(( ell ))_11$]])
  content((7.02, 2.38), [#text(size: 9pt)[$T^(( ell ))_12$]])
  content((7.7, 2.38), [#text(size: 9pt)[$T^(( ell ))_13$]])
  content((8.38, 2.38), [#text(size: 9pt)[$T^(( ell ))_14$]])
  content((9, 2.38), [#text(size: 9pt)[$a_0$]])
  content((5.84, 1.7), [#text(size: 9pt)[$R_2$]], anchor: "east", padding: 0.1176cm)
  content((6.34, 1.7), [#text(size: 9pt)[$T^(( ell ))_21$]])
  content((7.02, 1.7), [#text(size: 9pt)[$T^(( ell ))_22$]])
  content((7.7, 1.7), [#text(size: 9pt)[$T^(( ell ))_23$]])
  content((8.38, 1.7), [#text(size: 9pt)[$T^(( ell ))_24$]])
  content((9, 1.7), [#text(size: 9pt)[$a_0$]])
  content((5.84, 1.02), [#text(size: 9pt)[$R_3$]], anchor: "east", padding: 0.1176cm)
  content((6.34, 1.02), [#text(size: 9pt)[$T^(( ell ))_31$]])
  content((7.02, 1.02), [#text(size: 9pt)[$T^(( ell ))_32$]])
  content((7.7, 1.02), [#text(size: 9pt)[$T^(( ell ))_33$]])
  content((8.38, 1.02), [#text(size: 9pt)[$T^(( ell ))_34$]])
  content((9, 1.02), [#text(size: 9pt)[$a_0$]])
  content((5.84, 0.34), [#text(size: 9pt)[$R_4$]], anchor: "east", padding: 0.1176cm)
  content((6.34, 0.34), [#text(size: 9pt)[$T^(( ell ))_41$]])
  content((7.02, 0.34), [#text(size: 9pt)[$T^(( ell ))_42$]])
  content((7.7, 0.34), [#text(size: 9pt)[$T^(( ell ))_43$]])
  content((8.38, 0.34), [#text(size: 9pt)[$T^(( ell ))_44$]])
  content((9, 0.34), [#text(size: 9pt)[$a_0$]])
  line((6, 0), (6, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((6, 0), (8.72, 0), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((6.68, 0), (6.68, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((6, 0.68), (8.72, 0.68), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((7.36, 0), (7.36, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((6, 1.36), (8.72, 1.36), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((8.04, 0), (8.04, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((6, 2.04), (8.72, 2.04), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((8.72, 0), (8.72, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  line((6, 2.72), (8.72, 2.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.35pt, miter-limit: 10))
  content((6.34, 2.98), [#text(size: 9pt)[$R_1$]])
  content((6.34, -0.23), [#text(size: 9pt)[$a_0$]])
  content((7.02, 2.98), [#text(size: 9pt)[$R_2$]])
  content((7.02, -0.23), [#text(size: 9pt)[$a_0$]])
  content((7.7, 2.98), [#text(size: 9pt)[$R_3$]])
  content((7.7, -0.23), [#text(size: 9pt)[$a_0$]])
  content((8.38, 2.98), [#text(size: 9pt)[$R_4$]])
  content((8.38, -0.23), [#text(size: 9pt)[$a_0$]])
  content((5.13, 1.36), [#text(size: 9pt)[initial $R_i$]], angle: 90deg)
  content((7.36, 3.48), [#text(size: 9pt)[final $R_j$]])
  content((7.36, -0.62), [#text(size: 9pt)[Row and column sums are $a_0$.]])
  content((4.4, -1.4), [#text(size: 9pt)[$T^((1)), dots.h ,T^((K))$ independent, $T^(( ell )) tilde.op p_(n"/"K)$, $X_(i j)= sum_( ell =1)^"KT"^(( ell ))_(i j)$.]])
})],
    caption: [Figure 2: The middle round in the row–column–row construction (schematic $K = 4$; the proof uses $K = 8$). Every $C_ell$ contains $a_0$ labels from each initial $R_i$ and $a_0$ slots in each final $R_j$. Independent column shuffles produce the tables $T^(\( ell \))$; their columns index final $R_j$ groups. The first and last row shuffles supply right and left invariance, respectively, making the permutation law uniform conditional on its count matrix. ],
  ) <fig:overlay-grid>
  Here is the comparison of this sum with $p_n$. We may assume $n$ is divisible by $K^3$. Use as free coordinates the upper-left $\( K - 1 \) times \( K - 1 \)$ subtable, treated as a vector of size $b = \( K - 1 \)^2$. For $M$ divisible by $K^2$ and $X tilde.op p_M$, center the vector at its coordinate mean $M \/ K^2$ and divide by $sqrt(M)$; call the result $Z_M$. Let $J$ be the linear map completing a free-coordinate vector to a full matrix with zero row and column sums. Uniformly for $parallel z parallel$ bounded on the centered scaled lattice,
  #[#set math.equation(numbering: n => "(6.7)")
   $ Pr \( Z_M = z \) = M^(- b \/ 2) (G \( z \) + o \( 1 \)) \, #h(2em) G \( z \) = c_K exp #h(-0.16667em) (- K^2 parallel J z parallel^2 \/ 2) \, $ <special:overlay:eq:7>]
  where matrix norm here is Euclidean and $c_K > 0$ depends only on $K$. To see this, substitute $x_(i j) = a + sqrt(M) \( J z \)_(i j)$ with $a = M \/ K^2$ in (6.6) (nonnegativity holds for bounded $z$ and large $M$). Stirling’s formula and expansion of $x log x - x$ about $a$ have canceling linear terms in the sum. The constant terms cancel with the numerator and $M !$ and the quadratic terms give $K^2 parallel J z parallel^2 \/ 2$, with remainders $o \( 1 \)$ for bounded $z$. The square-root factors give $M^(K - 1 \/ 2 - K^2 \/ 2) = M^(- b \/ 2)$ times a constant $\( 2 pi \)^(- b \/ 2) K^(K^2 - K)$ and $1 + o \( 1 \)$, proving (6.7).
  Writing $W$ for an independent uniform vector on $\[ 0 \, 1 \)^b$, $Z_M + W \/ sqrt(M)$ has density converging in $L^1$ to $G$. On compacts this follows from (6.7) and continuity. Tail probabilities are uniformly small on taking large compacts since each count coordinate is hypergeometric with variance at most $M$; the limit density is integrable since $J$ is injective. This proves the $L^1$ convergence and in particular normalization, so $G$ is a centered nondegenerate Gaussian density.
  For the sum of $K$ tables from $p_(n \/ K)$, the centered vector at scale $1 \/ sqrt(n)$ is a sum of $K$ independent $Z_(n \/ K) \/ sqrt(K)$. First add independent noise $W_i \/ sqrt(n)$ to each summand. By the density convergence, independence and total-variation contraction under addition, the noisy sum converges in total variation to the law with density $G$: the sum of $K$ centered Gaussians of this law each divided by $sqrt(K)$ has the same law. This convergence still holds keeping only the noise on the first summand. Indeed that smoothed summand by itself converges in total variation to a Gaussian (scaled by $1 \/ sqrt(K)$). Its distance to its translate by any vector of norm at most $\( K - 1 \) sqrt(b) \/ sqrt(n)$ therefore tends to zero uniformly, by continuity of translations of the Gaussian density in $L^1$. Conditioning on the other summands and their noises bounds by this $o \( 1 \)$ the distance induced by removing their noises. Thus, with a single noise, both the centered scaled sum and the $p_n$ vector are close to the same law by (6.7) and the sum argument. Total variation between these two noisy laws equals the discrete total variation without noise since both lattices have the same cells spread out uniformly by the noise. This proves the desired count-law comparison, hence mixing of the ideal product. ◻
]

We conclude that the overlay product conditional on the base has expected total-variation distance $o \( 1 \)$ from a uniform permutation on $V$. Multiplying by the final base permutation (fixed under the conditioning) preserves the comparison with uniform. Removing the conditioning and mapping back to the deck locations proves total-variation distance $o \( 1 \)$ for the actual shuffle. All estimates hold for any initial deck by identifying its cards with their starting positions. The shuffle has uniform stationary law since every layer applies a random permutation according to switches independent of the incoming deck. We used $3 K dot.op k dot.op 21 d$ full layers of the type counted as steps in the shuffle definition. This gives the upper bound by an absolute multiple of $d$ for sufficiently large $d$. The choices give $delta = 1 \/ 16384$, $k = 65536$, and $3 K k dot.op 21 = 33030144$, so the upper time is $33030144 d$ complete shuffles.

This proves Theorem 12. The support bound of Section 2 also gives $t_(upright("mix")) gt.eq d$ for all sufficiently large $d$.

== 7 Two independent half-permutations <sec:two-halves>

The previous constructions extract contraction from repeated active intervals. This construction uses two long independent blocks. For the second block, reveal only which slots contain each of two colors at every layer. That observation leaves independent internal permutations of the two colors. We will trim their large tuple marginals and combine them with inverse-image information from the first block. The two orientations have different roles and must both be retained.

=== 7.1 The two precise inputs <the-two-precise-inputs>

Here we use two companion results. We state their full hypotheses so that the conditional law to which each applies is explicit. Write $"inj" \( I \, J \)$ for the set of injections from a finite ordered set $I$ into a finite set $J$.

The conditional path theorem [17] Theorem 4.1 has the following form. Fix $0 < p < 1$ and define

#[#set math.equation(numbering: n => "(7.1)")
 $ rho_p = frac(3 + p, 4) \, #h(2em) c_p = - 1 / 8 log_2 rho_p \, #h(2em) b = ceil.l 10 \/ c_p ceil.r . $ <eq:tabloid-parameters>]

For every deterministic starting deck, every specified base set of $r_0$ labels, and every ordered list of $k$ additional labels satisfying $r_0 + k - 1 lt.eq p n$, after $2 b$ sweeps,

#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E)_(cal(H)) ∥cal(L) \( upright("list endpoints") divides cal(H) \) - "Unif" "inj" \( \[ k \] \, V \\ E_(cal(H)) \)∥_(upright("TV")) lt.eq k n^(- 4) . $ <eq:conditional-input>]

Here $cal(H)$ is the full labelled base-path history and $E_(cal(H))$ its endpoint set. The estimate holds for every cyclic coordinate order, including the reverse order. It also holds after coarsening $cal(H)$, provided the endpoint available set remains determined. All thresholds depend only on the fixed $p$.

The abstract conditional-product transfer [18] Theorem “Conditional-product transfer” concerns $V = A union.sq C$ with $\| A \| = \| C \| = h$, and $H = S_A times S_C$. Partition each half into $L$ equal buffers, where $L gt.eq 2 C_0$ and $C_0 = 2000000$. Suppose a subprobability $xi$ on $S_V$ has both ordered inverse-image marginals $x^(- 1) \|_A$ and $x^(- 1) \|_C$ pointwise at most twice uniform. For every environment $z$, let $nu_A^z \, nu_C^z$ be subprobabilities on the two half-groups. Assume that, in each factor and for every buffer, the ordered image tuple on the complement of that buffer has marginal at most twice uniform. For each $z$, choose an arbitrary deterministic permutation $t_z in S_V$. If $Z$ has any probability law, put

$ omega = bb(E)_Z #scale(x: 120%, y: 120%)[\[] delta_(t_Z) * \( nu_A^Z ⊗ nu_C^Z \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) theta = omega * xi . $

Then, for all sufficiently large $h$, every irreducible representation of $S_V$ of degree $D > 1$ satisfies

#[#set math.equation(numbering: n => "(7.3)")
 $ parallel hat(theta) parallel_(upright("op")) lt.eq sqrt(22) thin D^(- 1 \/ 40) . $ <eq:tabloid-transfer>]

The Hilbert–Schmidt norms in that theorem use ordinary, unnormalized trace. For either $J in { A \, C }$, let $nu_J$ be a factor satisfying the buffer caps and let $gamma$ be an irreducible representation of $S_J$, of degree $D_gamma$. The underlying buffer estimate is $parallel hat(nu)_J \( gamma \) parallel_(upright("HS"))^2 \/ D_gamma lt.eq min \( 1 \, 2 D_gamma^(- 1 \/ 2) \)$. For irreducibles $alpha$ of $S_A$, $beta$ of $S_C$, and $lambda$ of $S_V$, write $c_(alpha beta)^lambda$ for the multiplicity of $alpha ⊗ beta$ in the restriction of $lambda$ to $H$. These multiplicities are retained through the estimate $c_(alpha beta)^lambda lt.eq min \( D_alpha \, D_beta \)$, where each $D$ denotes the corresponding degree. For the final Fourier sum we will use the local reciprocal-square estimate in Lemma 6.

These are separate inputs. The first supplies conditional tuple information from the shuffle; the second converts explicit caps and a conditional product into an operator bound. The product property will now be proved for the actual shuffle environment.

=== 7.2 Inverse-image caps for the first block <inverse-image-caps-for-the-first-block>

#thm([Theorem 7.1.])[
  (Two-half construction).  #emph[Set $L = 2^23$, $p = 1 - 1 \/ \( 2 L \)$, and choose $b$ by (7.1). For $n = 2^d$, the full-deck law from any deterministic start approaches uniform in total variation after $400 b d$ physical shuffles.]
] <thm:two-halves>

For these choices, $L$ divides $h = n \/ 2$ for all sufficiently large $d$. Fix two halves $A \, C$ of $V$ and partition each into $L$ buffers of size $h \/ L$. Let $X \, W$ be independent permutations each generated by $2 b$ forward sweeps, and let $mu$ be the law of $W X$.

The inverse of $X$ is generated by the independent involutive layers in reverse order. Apply (7.2) with empty base and a list consisting of $A$, and then of $C$. Since $h - 1 lt.eq p n$, each ordered inverse-image half-tuple has distance at most $h n^(- 4)$ from uniform.

We use the following elementary truncation rule repeatedly. If probability laws $P \, Q$ are on one finite set, then

$ P { v : P \( v \) > 2 Q \( v \) } lt.eq 2 parallel P - Q parallel_(upright("TV")) \, $

since $P \( v \) lt.eq 2 \( P \( v \) - Q \( v \) \)$ on those atoms and the total positive excess is the variation distance. Delete from the law of $X$ every permutation whose inverse-image tuple on either half is an atom of more than twice its uniform probability. Call the resulting subprobability $xi$. It obeys both required pointwise caps, and

#[#set math.equation(numbering: n => "(7.4)")
 $ 1 - xi \( S_n \) lt.eq 4 h n^(- 4) = 2 n^(- 3) . $ <eq:x-mass>]

The deletion for the other half cannot increase a marginal. Thus one common $xi$ has the two caps simultaneously.

=== 7.3 The occupancy environment and the conditional product <the-occupancy-environment-and-the-conditional-product>

Color the positions at the start of $W$ by membership in $A$ or $C$, regarding those starting positions as distinct labels for this block. Let $Z$ record the set of positions occupied by each color after every layer, including the initial and final boundary. It records no labels within a color.

#thm([Lemma 7.2.])[
  (Independent internal permutations).  #emph[For every feasible occupancy history $Z = z$, all mixed-color switch values are fixed and all same-color switch values are independent fair bits. Choose $t_z$ to send the increasing list of $A$ to the increasing list of its endpoint color set and likewise for $C$. Then 
$ W = t_z \( Y_A times Y_C \) \, $

 where, conditional on $Z = z$, $Y_A in S_A$ and $Y_C in S_C$ are independent. Their conditional laws depend only on $z$.]
] <lem:color-product>

#proof[
  At a mixed-color edge, the next pair of colors determines whether its coin is zero or one. At a same-color edge, either coin gives the same outgoing colors. Conversely, once the coins specified at the mixed edges of $z$ are fixed, induction on layers forces precisely the occupancy history $z$, independently of all same-color coins. Thus the event $Z = z$ is a cylinder in the time-edge array. Its unprescribed bits remain mutually independent.
  A label of color $A$ uses fixed transports at mixed edges and only the independent bits on $A$–$A$ edges otherwise. The analogous assertion for color $C$ uses the disjoint array on $C$–$C$ edges. For fixed $z$ those two sets of time-edge coordinates are deterministic. Applying the slot-bijection construction separately to the two colors gives bijections onto their endpoint sets. The stated $t_z$ identifies these sets with the original halves, giving the independent permutations $Y_A \, Y_C$. In particular no independence of the color history itself from the internal permutations is being used. ◻
]

Write $mu_A^z \, mu_C^z$ for these two conditional probabilities. Fix a buffer $B subset A$. Apply (7.2) to $W$ with all $C$ labels as base and the list $A \\ B$ as the additional labels. Here

$ r_0 + k - 1 = h + \( h - h \/ L \) - 1 = n - frac(n, 2 L) - 1 lt.eq p n . $

The error is at most $\( h - h \/ L \) n^(- 4)$. The full labelled $C$ paths determine the color occupancy history $Z$, and $Z$ still determines their endpoint set. Hence the allowed coarsening in (7.2) gives that same expected error conditional on $Z$. Applying the deterministic bijection $t_Z^(- 1)$ sends the comparison law to uniform ordered distinct images in $A$. We conclude

#[#set math.equation(numbering: n => "(7.5)")
 $ bb(E)_Z ∥\( mu_A^Z \)_(A \\ B) - \( U_A \)_(A \\ B)∥_(upright("TV")) lt.eq \( h - h \/ L \) n^(- 4) . $ <eq:color-buffer-error>]

The same argument applies to every buffer of $C$, interchanging the colors. The endpoints’ available set is essential here: ordinary unconditional list mixing would not imply (7.5).

For each $z$, delete from $mu_J^z$ all permutations whose ordered image tuple outside any buffer exceeds twice its uniform probability, for $J = A \, C$. Denote the subprobabilities by $nu_J^z$ and their masses by $a_J \( z \)$. The truncation rule and (7.5) give

$ bb(E)_Z #scale(x: 120%, y: 120%)[\[] \( 1 - a_A \( Z \) \) + \( 1 - a_C \( Z \) \) #scale(x: 120%, y: 120%)[\]] lt.eq 4 L \( h - h \/ L \) n^(- 4) = \( 2 L - 2 \) n^(- 3) . $

Every surviving factor satisfies each cap for its particular $z$, even if the loss at that environment is large. Lemma 17 now permits the product of these two deletions: define

$ omega = bb(E)_Z \[ delta_(t_Z) * \( nu_A^Z ⊗ nu_C^Z \) \] . $

It is dominated pointwise by the true law of $W$. Its missing mass is $bb(E) \[ 1 - a_A a_C \]$, bounded by the preceding display because $1 - a_A a_C lt.eq \( 1 - a_A \) + \( 1 - a_C \)$.

We have now established every conditional-law hypothesis of the transfer: the environment has its original probability law, each conditional measure is an actual product, each factor has all its buffer-complement caps, and the first block has the two inverse-image caps. Define $theta = omega * xi$. Independence of the original blocks and positivity of convolution give $theta lt.eq mu$ pointwise, while

#[#set math.equation(numbering: n => "(7.6)")
 $ 1 - theta \( S_n \) lt.eq 2 L n^(- 3) = o \( 1 \) . $ <eq:tabloid-mass>]

The integer $L$ is large but fixed before $d$ tends to infinity.

=== 7.4 Fourier completion and physical time <fourier-completion-and-physical-time>

Applying (7.3) gives the degree-power operator bound for every $D_lambda > 1$. We include the final deduction to keep the mass, parity and time conventions visible in this application.

The original block law $mu$ has expected sign zero. Indeed, condition on all switch coins except any one coin in a physical layer. Flipping that fair coin composes the final permutation with a conjugate transposition and reverses its sign. From $theta lt.eq mu$ and (7.6),

$ \| hat(theta) \( "sgn" \) \| lt.eq 1 - theta \( S_n \) lt.eq 2 L n^(- 3) . $

Let $j = 100$ and $q = theta \( S_n \)$. The trivial Fourier coefficient of $theta^(* j) - U_n$ is $q^j - 1 = o \( 1 \)$ and its sign coefficient is $hat(theta) \( "sgn" \)^j = o \( 1 \)$. For all other irreducibles, without assuming their matrices commute or are normal,

$ sum_(D_lambda > 1) D_lambda parallel hat(theta) \( lambda \)^j parallel_(upright("HS"))^2 lt.eq 22^j sum_(D_lambda > 1) D_lambda^(2 - 2 j \/ 40) = 22^100 sum_(D_lambda > 1) D_lambda^(- 3) = o \( 1 \) . $

We used submultiplicativity of the operator norm, $parallel B parallel_(upright("HS"))^2 lt.eq D parallel B parallel_(upright("op"))^2$, and Lemma 6, since $D^(- 3) lt.eq D^(- 2)$. Plancherel and Cauchy–Schwarz imply $parallel theta^(* 100) - U_n parallel_1 = o \( 1 \)$. Restoring the missing measure costs $1 - q^100 = o \( 1 \)$, so $parallel mu^(* 100) - U_n parallel_(upright("TV")) arrow.r 0$.

Each of $X \, W$ costs $2 b d$ physical shuffles. One macro-step therefore costs $4 b d$, and the $100$ independent macro-steps cost $400 b d$. They concatenate at sweep boundaries and hence have exactly the physical shuffle law at that time. Translation by any fixed initial deck preserves total variation. This proves Theorem 16.

#heading(level: 1)[References]
#bibitem([1])[J. Borcea, P. Brändén, and T. M. Liggett, Negative dependence and the geometry of polynomials, #emph[Journal of the American Mathematical Society] #strong[22] (2009), no.~2, 521--567. #link("https://doi.org/10.1090/S0894-0347-08-00618-8")[doi:10.1090/S0894-0347-08-00618-8].]
#bibitem([2])[A.~Czumaj and B.~Vöcking, Thorp shuffling, butterflies, and non-Markovian couplings, #emph[Automata, Languages, and Programming---ICALP 2014], Lecture Notes in Computer Science, vol.~8572, Springer, 2014, 344--355. #link("https://doi.org/10.1007/978-3-662-43948-7_29")[doi:10.1007/978-3-662-43948-7\_29].]
#bibitem([3])[P.~Etingof, O.~Golberg, S.~Hensel, T.~Liu, A.~Schwendner, D.~Vaintrob, and E.~Yudovina, #emph[Introduction to Representation Theory], Student Mathematical Library, vol.~59, American Mathematical Society, 2011. Author's lecture-note version, January 10, 2011: #link("https://math.mit.edu/~etingof/replect.pdf").]
#bibitem([4])[J.~Håstad, The square lattice shuffle, #emph[Random Structures & Algorithms] #strong[29] (2006), no.~4, 466--474. #link("https://doi.org/10.1002/rsa.20131")[doi:10.1002/rsa.20131]. Correction: #strong[48] (2016), no.~1, 213, #link("https://doi.org/10.1002/rsa.20620")[doi:10.1002/rsa.20620]. Author texts: #link("https://www.csc.kth.se/~johanh/jhsquare.pdf") (October 20, 2005) and #link("https://johanhastad.se/nntypo.pdf") (June 17, 2015).]
#bibitem([5])[V. T. Hoang, B. Morris, and P. Rogaway, #emph[An enciphering scheme based on a card shuffle], Advances in Cryptology---CRYPTO 2012, Lecture Notes in Computer Science 7417, Springer, 2012, 1--13. The cited Section 3, Theorem 3, and Lemma 4 refer to #link("https://arxiv.org/abs/1208.1176v2")[arXiv:1208.1176v2], 21 November 2014.]
#bibitem([6])[N. Keller, N. Lifshitz, and O. Sheinfeld, #emph[Improved covering results for conjugacy classes of symmetric groups via hypercontractivity], Forum of Mathematics, Sigma 12 (2024), e85, 1--19, #link("https://doi.org/10.1017/fms.2024.95")[doi:10.1017/fms.2024.95]. Definition 2.1 and Theorem 2.2 give the orbit-growth parameter and the uniform fixed-slack formulation of the Larsen--Shalev bound.]
#bibitem([7])[M. Larsen and A. Shalev, #emph[Characters of symmetric groups: sharp bounds and applications], Inventiones Mathematicae 174 (2008), no.~3, 645--687, #link("https://doi.org/10.1007/s00222-008-0145-7")[doi:10.1007/s00222-008-0145-7].]
#bibitem([8])[M. W. Liebeck and A. Shalev, #emph[Fuchsian groups, coverings of Riemann surfaces, subgroup growth, random quotients and random walks], Journal of Algebra 276 (2004), no.~2, 552--601. The cited Proposition 2.5 and Theorem 2.6 appear on pages 15--16 of the #link("https://www.ma.ic.ac.uk/~mwl/fuchs.pdf")[author's text].]
#bibitem([9])[R. Montenegro and P. Tetali, #emph[Mathematical aspects of mixing times in Markov chains], Foundations and Trends in Theoretical Computer Science 1 (2006), no.~3, 237--354, #link("https://doi.org/10.1561/0400000003")[doi:10.1561/0400000003].]
#bibitem([10])[B.~Morris, The mixing time of the Thorp shuffle, #emph[SIAM Journal on Computing] #strong[38] (2008), no.~2, 484--504. #link("https://doi.org/10.1137/050636231")[doi:10.1137/050636231]. Preprint: #link("https://arxiv.org/abs/math/0507307v1").]
#bibitem([11])[B.~Morris, The mixing time for simple exclusion, #emph[Annals of Applied Probability] #strong[16] (2006), no.~2, 615--635. #link("https://doi.org/10.1214/105051605000000728")[doi:10.1214/105051605000000728]. Lemma~12 is cited from the IMS electronic reprint #link("https://arxiv.org/abs/math/0405157v2")[arXiv:math/0405157v2], July 12, 2006, Section~5.3, pp.~19--20; its pagination differs from the journal.]
#bibitem([12])[B.~Morris, Improved mixing time bounds for the Thorp shuffle and $L$-reversal chain, #emph[Annals of Probability] #strong[37] (2009), no.~2, 453--477. #link("https://doi.org/10.1214/08-AOP409")[doi:10.1214/08-AOP409]. Preprint: #link("https://arxiv.org/abs/0802.0339").]
#bibitem([13])[B.~Morris, Improved mixing time bounds for the Thorp shuffle, #emph[Combinatorics, Probability and Computing] #strong[22] (2013), no.~1, 118--132. #link("https://doi.org/10.1017/S0963548312000478")[doi:10.1017/S0963548312000478]. Preprint: #link("https://arxiv.org/abs/0912.2759").]
#bibitem([14])[B. Morris, P. Rogaway, and T. Stegers, #emph[How to encipher messages on a small domain: deterministic encryption and the Thorp shuffle], Advances in Cryptology---CRYPTO 2009, Lecture Notes in Computer Science 5677, Springer, 2009, 286--302, #link("https://doi.org/10.1007/978-3-642-03356-8_17")[doi:10.1007/978-3-642-03356-8\_17]. Theorem 1 and Lemma 2 (proved in Appendix A) are cited from the #link("https://www.cs.ucdavis.edu/~rogaway/papers/thorp.pdf")[author's conference text]. A later journal version is #emph[Deterministic encryption with the Thorp shuffle], Journal of Cryptology 31 (2018), no.~2, 521--536, #link("https://doi.org/10.1007/s00145-017-9262-z")[doi:10.1007/s00145-017-9262-z].]
#bibitem([15])[E. Nummelin, A splitting technique for Harris recurrent Markov chains, #emph[Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete] #strong[43] (1978), 309--318. #link("https://doi.org/10.1007/BF00534764")[doi:10.1007/BF00534764].]
#bibitem([16])[OpenAI, #emph[Conditional coordinate sweeps and analytic transfer], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Conditional-coordinate-sweeps-and-analytic-transfer-September-26-2026/main.pdf")[OAI:Conditional-coordinate-sweeps-and-analytic-transfer-September-26-2026], 2026.]
#bibitem([17])[OpenAI, #emph[Conditional information under deterministic coordinate sweeps], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026/main.pdf")[OAI:Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026], 2026.]
#bibitem([18])[OpenAI, #emph[From partial permutation information to Fourier bounds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/From-partial-permutation-information-to-Fourier-bounds-September-26-2026/main.pdf")[OAI:From-partial-permutation-information-to-Fourier-bounds-September-26-2026], 2026.]
#bibitem([19])[OpenAI, #emph[Optimal-order mixing of the Thorp shuffle], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Optimal-order-mixing-of-the-Thorp-shuffle-September-26-2026/paper.pdf")[OAI:Optimal-order-mixing-of-the-Thorp-shuffle-September-26-2026], 2026.]
#bibitem([20])[OpenAI, #emph[Random coordinate frames and partial permutation laws], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Random-coordinate-frames-and-partial-permutation-laws-September-26-2026/main.pdf")[OAI:Random-coordinate-frames-and-partial-permutation-laws-September-26-2026], 2026.]
#bibitem([21])[B.~E.~Sagan, #emph[The Symmetric Group: Representations, Combinatorial Algorithms, and Symmetric Functions], second edition, Graduate Texts in Mathematics, vol.~203, Springer, 2001. #link("https://doi.org/10.1007/978-1-4757-6804-6")[doi:10.1007/978-1-4757-6804-6].]
#bibitem([22])[E.~O.~Thorp, Nonrandom shuffling with applications to the game of Faro, #emph[Journal of the American Statistical Association] #strong[68] (1973), no.~344, 842--847. #link("https://doi.org/10.1080/01621459.1973.10481434")[doi:10.1080/01621459.1973.10481434].]


