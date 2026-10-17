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

#align(center)[#text(size: 16pt, weight: "bold")[Exact Derandomization of Logarithmic Space: \
$sans(L) = sans(R L) = sans(B P L)$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:intro>

A logarithmic-space machine can remember a bounded number of positions in its input, but cannot keep a polynomial-length computation or random tape. Can fresh random bits increase what such a machine can decide? We answer this question by giving a deterministic logarithmic-space simulation of every polynomial-time randomized logarithmic-space computation with bounded error.

We use machines with finite control, an endmarked read-only input, finitely many work tapes, and fresh independent fair bits. Input heads are confined between the endmarkers. All randomized running-time bounds hold on every random tape. Space counts traversed writable cells in bits, including every simultaneously live counter, numerical register and suspended call; visiting a blank work cell counts toward space. A transducer has a one-way write-only output tape. Throughout, $n$ is the input length and logarithms have base two.

The class $sans(L)$ consists of languages decidable by deterministic machines in $O \( log \( n + 2 \) \)$ work space. Such a halting deterministic machine has only polynomially many configurations and hence runs in polynomial time. The class $sans(R L)$ permits polynomial-time randomized machines in this space, with acceptance probability zero on no inputs and at least $1 \/ 2$ on yes inputs. For $sans(B P L)$, the corresponding probabilities are at most $1 \/ 3$ and at least $2 \/ 3$.

#thm([Theorem 1.1.])[
  (Exact logarithmic-space derandomization).  #emph[
$ sans(L) = sans(R L) = sans(B P L) . $

]
] <thm:main>

The proof approximates arbitrary acceptance probabilities. This gives the two-sided statement directly, and also applies to computations whose acceptance probabilities have no decision gap. Its quantitative form separates the memory needed for the input from the memory needed for the requested accuracy.

#thm([Theorem 1.2.])[
  (Acceptance-probability approximation).  #emph[Fix a randomized machine $cal(M)$ with polynomial worst-case running time and $O \( log \( n + 2 \) \)$ work space. Let $p_(cal(M)) \( x \)$ be its acceptance probability on an input $x$ of length $n$. There is a uniform deterministic algorithm which, on input $\( x \, 1^q \)$ with $q gt.eq 1$, outputs an integer $0 lt.eq a lt.eq 2^(q + 2)$ satisfying 
$ lr(|a 2^(- \( q + 2 \)) - p_(cal(M)) \( x \)|) lt.eq 2^(- q) . $

 It uses $O \( log \( n + 2 \) + q \)$ work space and $\( n + 2 \)^(O \( 1 \)) 2^(O \( q \))$ time. The constants depend only on $cal(M)$.]
] <thm:probability>

In particular, every fixed inverse-polynomial accuracy is attained in logarithmic space and polynomial time. The precision parameter is unary; the running-time bound is exponential in general $q$. We first prove the fixed inverse-polynomial result and then obtain the single variable-precision algorithm by padding. Section 12 also derives total deterministic separators for bounded-error promise problems and constructs accepting runs when the machine’s acceptance probability has a specified inverse-polynomial lower bound.

The simulation is also effective at the level of machine descriptions. Given a source program and supplied polynomial-time and logarithmic-space bounds, one terminating compiler produces a deterministic decider and explicit numerical bounds for its space and time (Theorem 74). The supplied bounds are hypotheses on the source, rather than properties the compiler must decide. Section 13 constructs this compiler by specializing one fixed deterministic library.

=== 1.1 Historical context <historical-context>

The complexity of probabilistic Turing machines was developed by Gill #cite(label("Gill1977")), including measures of both time and tape usage. Random walks made the logarithmic-space question concrete: Aleliunas, Karp, Lipton, Lovász and Rackoff obtained polynomial-time randomized algorithms for undirected connectivity and explicitly asked whether polynomial-time randomized logarithmic space could be simulated in deterministic logarithmic space #cite(label("AleliunasKLLR1979")). Early work also studied probabilistic machines without a polynomial-time restriction. Borodin, Cook and Pippenger obtained a quadratic-space deterministic simulation in this broader setting #cite(label("BorodinCookPippenger1983")). The distinction between a space bound and simultaneous time and space bounds is essential throughout this history.

Pseudorandom generators attack the problem by replacing a long sequence of fresh random bits with the output generated from a short seed. Ajtai, Komlós and Szemerédi gave early logarithmic-space constructions that hit small-space tests using short random strings #cite(label("AjtaiKomlosSzemeredi1987")). Babai, Nisan and Szegedy subsequently obtained pseudorandom generators through multiparty communication bounds #cite(label("BabaiNisanSzegedy1992")). Nisan’s generator uses $O \( S log R \)$ seed bits for a space-$S$ computation reading $R$ random bits #cite(label("Nisan1992")). For logarithmic space and polynomially many bits this gives $O \( log^2 n \)$ seed length; direct seed enumeration has a quasipolynomial time bound. Nisan’s later simultaneous simulation achieves polynomial time and $O \( log^2 n \)$ space #cite(label("Nisan1994RLinSC")). Although its title uses $upright("RL")$, that result includes two-sided bounded error. For $S \( n \) gt.eq log n$, Nisan and Zuckerman showed that a space-$S$ computation using $"poly" \( S \)$ random bits can be simulated using only $O \( S \)$ random bits and $O \( S \)$ space #cite(label("NisanZuckerman1996")). The restriction on the original number of random bits is substantive; for logarithmic space it permits polylogarithmically many bits.

Saks and Zhou reduced the deterministic space needed for general bounded-error logarithmic-space computation to $O \( log^(3 \/ 2) n \)$ #cite(label("SaksZhou1999")). Cai, Chakaravarthy and van Melkebeek established a simultaneous tradeoff: for each fixed rational $0 lt.eq alpha lt.eq 1 \/ 2$, the simulation uses time $n^(O \( log^(1 \/ 2 - alpha) n \))$ and space $O \( log^(3 \/ 2 + alpha) n \)$ #cite(label("CaiChakaravarthyVanMelkebeek2006")). The polynomial-time endpoint has squared-logarithmic space. Hoza subsequently improved the general space bound to $O \( log^(3 \/ 2) n \/ sqrt(log log n) \)$ #cite(label("Hoza2021")) Theorem 1.6 and Corollary A.5. These smaller space containments do not assert the same polynomial-time endpoint. Hoza’s work also develops weighted pseudorandomness, in which signed or real weights replace an ordinary probability distribution; the space-containment improvement and the new weighted-generator construction are distinct results of that paper.

Acceptance-probability estimation also connects derandomization to stochastic matrix products and inverses. Ahmadinejad, Kelner, Murtagh, Peebles, Sidford and Vadhan developed high-precision small-space algorithms for random-walk probabilities, with stronger bounds for Eulerian graphs #cite(label("AhmadinejadKelnerMurtaghPeeblesSidfordVadhan2020")). Cohen, Doron, Sberlo and Ta-Shma later used varying precision across recursion to improve the space complexity of long stochastic matrix products #cite(label("CohenDoronSberloTaShma2023")). The construction below works with a finite inverse on a time-layered configuration graph; its correction and copy hierarchy controls the information retained while individual entries are evaluated.

Structural restrictions on a computation provide another route. For undirected connectivity, Nisan, Szemerédi and Wigderson obtained deterministic space $O \( log^(3 \/ 2) n \)$ #cite(label("NisanSzemerediWigderson1992")), subsequently improved to $O \( log^(4 \/ 3) n \)$ by Armoni, Ta-Shma, Wigderson and Zhou #cite(label("ArmoniTaShmaWigdersonZhou2000")). Reingold’s logarithmic-space algorithm, whose conference version appeared at STOC 2005, settles undirected connectivity #cite(label("Reingold2005")) #cite(label("Reingold2008")). Reingold, Trevisan and Vadhan studied regular directed graphs and gave logarithmic-space path search for Eulerian directed graphs #cite(label("RTV2006")). Their oblivious walk constructions impose additional labeling conditions. General directed configuration graphs need not have these properties, so those results did not settle the unrestricted randomized computation problem. A read-once branching program is a layered deterministic computation that reads the input symbols once in a fixed order (bits in the binary case). Its length is the number of steps, and its width is the largest number of states in a layer. A $1 \/ 2$-hitting set for a class of programs contains an accepting input for every member that accepts at least half of all input strings. The relation between one-sided and two-sided derandomization also requires care. Cheng and Hoza proved that one uniformly logarithmic-space-enumerable $1 \/ 2$-hitting-set family for all width-$n$, length-$n$ read-once branching programs would yield $sans(L) = sans(B P L)$ #cite(label("ChengHoza2022")). The premise is a hitting-set construction; it is not merely the language-class equality $sans(R L) = sans(L)$.

Recent results refine both general and structured models. Chen, Cohen, Doron, Khaskelberg and Ta-Shma improve error reduction for weighted generators; in the polynomial-width regime their construction has seed length $log \| Sigma \| + O \( log^2 T + log \( 1 \/ delta \) \)$, where $T$ is branching-program length, $Sigma$ its alphabet and $delta$ the error #cite(label("ChenCohenDoronKhaskelbergTaShma2026")). Cheng and Wu obtain simultaneous polynomial-time and polylogarithmic-space simulations for regular branching programs, with extensions to polynomial-time randomized logarithmic-space machines whose two-way read-only random tape visits each cell at most constantly often, and to such machines with read-once randomness and an auxiliary stack whose push, pop and idle schedule is independent of the random bits. Consecutive stays on a random-tape cell count as one visit #cite(label("ChengWu2026SC")) Theorems 5–6. Hardness-versus-randomness approaches additionally give conditional, certified and per-instance alternatives; Pyne and Tell survey this line of work #cite(label("PyneTell2026")).

Effectivity has its own substantial antecedents. Pyne, Raz and Zhan construct a universal deterministic estimator whose $O \( S \( n \) \)$ space guarantee follows from $sans(p r B P L) subset.eq sans(S P A C E) \[ O \( S \( n \) \) \]$, for space-constructible $S \( n \) gt.eq log n$ #cite(label("PyneRazZhan2023")) full version, Theorem 5.1. Here $sans(p r B P L)$ denotes promise problems solvable in polynomial time and randomized logarithmic space with bounded error. The compiler below uses a fixed separator established in this paper and supplies explicit source-specific numerical resource bounds. Its construction should be read in this context of universal simulation, with the source bounds supplied as part of the compiler input.

=== 1.2 Proof strategy <proof-strategy>

Fix a randomized machine and an input of length $n$, and write $B = Theta \( log \( n + 2 \) \)$. The proof constructs a finite family of estimates of its acceptance probability, indexed by $O \( B \)$-bit descriptions. More than three quarters of these estimates are accurate; every member of the family can be evaluated by a halting deterministic computation using $O \( B \)$ space. Exhaustive enumeration then gives a deterministic answer. The second guarantee is essential: enumeration must finish even on choices for which the estimate is inaccurate.

===== 1.2.1 The exact target. <the-exact-target.>

The configuration reduction of Section 2 gives a strictly forward substochastic matrix $S$ on a polynomial-size set $V_0$ and a vector $e in { 0 \, 1 }^(V_0)$ indicating accepting final configurations. The vector

$ p_0 = \( I - S \)^(- 1) e $

records acceptance probabilities from all configurations. The inverse is a finite sum, because every transition advances time. Section 4 replaces $S$ successively by transitions $C_l$ on sets $V_l$ of configuration copies, carrying accumulated rewards $W_l in \[ 0 \, 1 \]^(V_l)$. Each copy step has a designated primary copy. If $z_l$ is obtained from the original start $x_0$ by always choosing that copy, then

$ 0 lt.eq p_0 \( x_0 \) - W_l \( z_l \) lt.eq \| V_0 \| thin 2^(- \( H - 1 \) l) \, $

where $H gt.eq 4$ is fixed. Thus $L = O \( B \)$ stages make $W_L \( z_L \)$ accurate to any fixed inverse-polynomial error. Every stage has at most $N = 2^(C_N B)$ vertices for a fixed constant $C_N$.

===== 1.2.2 From the estimator to a deterministic decision. <from-the-estimator-to-a-deterministic-decision.>

The algorithm estimates $W_L$ in one shared finite random environment $sigma$. Its law is uniform on a specified finite set of matrix-and-bit-string encodings of length $O \( B \)$. On each channel a retention test selects vertices; write $X_f \( v \)$ for the indicator that $v$ is retained at the final stage rate $f = 2^(- H L)$, and $pi_f$ for its probability. Section 3 gives $pi_f asymp f$. Theorem 46 proves, for the actual estimator $macron(W)_L$,

$ 1 / N bb(E)_sigma sum_(v in V_L) frac(X_f \( v \), f) \| macron(W)_L \( v \) - W_L \( v \) \|^8 lt.eq C^8 2^(- 8 p) . $

Here $p$ is the statistical accuracy exponent. Keeping only the summand at $z_L$ gives

$ bb(E) #h(-0.16667em) [\| macron(W)_L \( z_L \) - W_L \( z_L \) \|^8 divides X_f \( z_L \) = 1] lt.eq N f / pi_f C^8 2^(- 8 p) . $

The factor $N$ is the price of passing from the integrated bound to one specified start. Since $log N = O \( B \)$, taking the estimator’s statistical budget to be a sufficiently large fixed multiple of $B$ makes $p$ large enough to pay this price and gives an accurate value on more than three quarters of the conditional environments.

The implementation computes dyadic approximations to the same fixed value $macron(W)_L \( z_L \)$ on every environment. Numerical precision changes the requested digits, not the lists and ports defining that value. Choosing the stage count, statistical budget and digit accuracy makes the total error less than $1 \/ 8$ on more than three quarters of the encodings conditioned on $X_f \( z_L \) = 1$. Their median has the same error bound. We enumerate the original encodings with their original multiplicities, so the multiset reproduces exactly this conditional law.

Repeated enumeration finds the median while retaining only the current encoding and $O \( B \)$-bit numerical and counting registers. Every digit query used here requests one of the first $O \( B \)$ binary places, terminates in $O \( B \)$ space, and confines its physical input heads between the real endmarkers. It therefore has only $2^(O \( B \))$ complete configurations and takes at most that many steps. There are also $2^(O \( B \))$ encodings, so the entire computation takes polynomial time. Comparing its answer with $1 \/ 2$ distinguishes acceptance probabilities at most $1 \/ 3$ from those at least $2 \/ 3$. This proves the nontrivial containment in Theorem 1.

===== 1.2.3 Why the hierarchy can be estimated. <why-the-hierarchy-can-be-estimated.>

The hierarchy reduces transition entries more rapidly than it increases the number of vertices incident to positive entries. A correction $E$ replaces $C$ by $D = C - E + E C$, with

$ I - D = \( I + E \) \( I - C \) . $

This identity transfers the removed transition contribution into the reward. Detectors identify columns with many substantial entries and suppress correction there. The copy step distributes the remaining large entries while controlling how many vertices are incident to them. An ordered-support argument gives a factorial truncation bound, so only constantly many correction steps are needed at each stage.

The exact matrices and conditional expectations define the targets; they are not stored. Section 5 represents their contributions by sample-dependent tables with bounded row support. Corrections also have bounded incoming degree. Their true conditional means recover the required entries. The algorithm substitutes earlier estimates into these formulas, so the analysis must bound the resulting bias without assuming that the estimated factors are independent. Conditional averaging preserves the specified source and endpoint retention tests. Its uniform mixing bound is derived from classical property (T) results of Shalom #cite(label("Shalom1999")); Section 6 proves the finite-action and sampling consequences used here.

At parent budget $M$, Section 7 averages differences between child estimates at consecutive budgets $m$ and $m - 1$. These differences have small norm because both approximate the same true sample term. Their contributions at the same endpoint are combined before measuring the difference. The slack $M - m$ has two roles: it determines the length of conditional averaging available to reduce the noise, and it bounds the description of an immediate sample path. Grouping comparable slacks lets Section 8 replace each row array by a short list of exceptions to a common default. The proof charges deterministic conditional-mean error separately from residual noise.

A product follows a correction edge to an intermediate vertex and then queries a right factor there. Releasing the old source changes the weighted error domain. Bounded incoming degree controls that change, and the task’s accuracy assignment pays the resulting factor. Thus the same construction that permits a source address to be discarded also appears explicitly in the error analysis.

===== 1.2.4 Why the lists fit in logarithmic space. <why-the-lists-fit-in-logarithmic-space.>

A list entry is found by a path. Retaining a full endpoint at every recursive level would cost too much. Section 9 therefore compares endpoints by short fingerprint keys at small slacks, combining polynomial evaluation and affine hashing #cite(label("Schwartz1980")) #cite(label("CarterWegman1979")). Candidate endpoints can depend on earlier comparisons, so a fixed-pair collision estimate alone is insufficient. A comparison calculation using exact equality within one budget block produces candidate sets independent of that block’s fingerprint bits. Smooth support functions charge paths that leave these sets to lower-call errors; collisions within the fixed sets supply the remaining error. This coupled induction proves the moment bound for the actual estimator.

Sections 10 and 11 establish its total space bound. Numerical operations request one bounded digit at a time. The controller keeps one vertex cursor, uses bounded inverse ports for correction moves, and recovers incoming accesses by traversing finite program trees, using the contour idea of Cook and McKenzie #cite(label("CookMcKenzie1987")) and the space-preserving traversal perspective of Lange, McKenzie and Tapp #cite(label("LMT2000")). A shared catalytic bit vector permits fingerprint comparisons without keeping a key index at every recursive level. The controller assigns each call a decreasing recursion allowance $w$, with top allowance $O \( B \)$, and uses the requested digit place $t$ as its numerical clock. If the child has allowance $w'$ and digit place $j$, all local data retained during that call occupy at most

$ A \( w - w' \) + D \( t - j \) $

bits, including the controller copies used by a traversal. The child clock may increase only in proportion to the decrease of allowance. These differences telescope along the active call chain; the environment, cursor, catalyst and scratch are shared once. The bound and termination do not depend on statistical accuracy.

Section 12 carries out the median construction for fixed inverse-polynomial error and derives the class equality and promise separation. It then obtains one algorithm for all unary precision requests by padding, and constructs certified accepting computations when the machine’s acceptance probability has an inverse-polynomial lower bound. Section 13 is a separate application of fixed-precision approximation: one resource-capped universal interpreter yields a fixed deterministic library, whose syntactic specialization supplies explicit resource bounds for each source machine.

== 2 The transition model and resource parameters <sec:model>

We first express acceptance probability as a finite matrix inverse. Time labels make the transition matrix nilpotent; keeping the complete configuration at each vertex gives local access in both directions. The construction will use the resulting probability vector at every configuration, as well as its value at the designated start.

A matrix indexed by a finite set $V$ is #emph[strictly forward] if there is an integer time attached to every vertex and every nonzero entry goes to a strictly later time. It is #emph[substochastic] if its entries are nonnegative and each row sums to at most one. An edge is specified by a vertex and a port from a fixed finite set. A #emph[paired] edge operation returns the other endpoint together with its inverse port; applying the inverse operation restores the first endpoint. Absent ports are explicitly recognized.

#thm([Lemma 2.1.])[
  (Configuration reduction).  #emph[Fix a polynomial-time randomized machine using $O \( log \( n + 2 \) \)$ work space. On an input of length $n$ one can specify, uniformly in logarithmic space, a polynomial-size vertex set $V_0$, a strictly forward substochastic matrix $S$, a vector $e in { 0 \, 1 }^(V_0)$, and a start vertex $x_0$ with the following properties.]
  + #emph[The incoming and outgoing port degrees of $S$ are bounded by constants depending only on the machine. Port validity, edge weights, and pairing are computable in logarithmic space.]
  + #emph[The vector $p_0 = \( I - S \)^(- 1) e$ is well defined and belongs to $\[ 0 \, 1 \]^(V_0)$.]
  + #emph[The coordinate $p_0 \( x_0 \)$ is the acceptance probability of the machine.]
  #emph[In particular, an $sans(R L)$ computation gives the promise $p_0 \( x_0 \) = 0$ or $p_0 \( x_0 \) gt.eq 1 \/ 2$.]
] <lem:model-reduction>

#proof[
  Let $T \( n \)$ be a fixed polynomial upper bound on the running time. A vertex records a time in ${ 0 \, dots.h \, T \( n \) }$, the finite control, all input and work head positions, and the contents of a sufficiently large box of $O \( log \( n + 2 \) \)$ work cells. Take elementary machine steps with fixed dyadic coin probabilities. A transition advances the time by one. Invalid configurations or moves leaving the box have no corresponding transition. The box is chosen large enough that this never affects a computation from the specified start.
  Each elementary step has constantly many successor choices. To find predecessors, guess the old finite control, locally overwritten symbols, head movements, and coin choice, then check that the forward step gives the specified configuration. There are constantly many such guesses. Combine transitions with the same ordered pair of endpoints by adding their probabilities. Order the distinct successors and predecessors by their configuration encodings; their positions give paired ports for the resulting matrix entries. These lists have constant length, so duplicate removal, summed weights, and the inverse port are computed in logarithmic space by local enumeration. This base computation makes no recursive graph queries. All records use $O \( log \( n + 2 \) \)$ bits, and the read-only input can be consulted during these checks.
  All input-head coordinates in the vertex universe are restricted to a fixed polynomial interval containing the positions reachable within $T \( n \)$ local steps from their specified initial positions. Configurations and predecessor candidates outside that interval are invalid. To obtain a simulated head’s scanned symbol, compare its stored coordinate with the input boundaries, supply any required endmarker or off-data blank according to the source tape convention, and otherwise scan the real endmarked input to the designated position using a logarithmic-space counter. A position forbidden by the source tape convention remains invalid. The physical scan stays between the real endmarkers, even when a valid simulated coordinate is outside the data. This routine makes no recursive graph query.
  An already halted computation keeps its complete tape and head data while its time advances. In particular, halted configurations are not merged into a single vertex. Let $e$ be one precisely at accepting configurations at time $T \( n \)$, and zero elsewhere. Final-time rows have no outgoing transitions. Thus $S$ is strictly forward and substochastic, and it is nilpotent. Its inverse expression is the finite sum
  $ \( I - S \)^(- 1) e = sum_(j = 0)^(T \( n \)) S^j e . $
  Starting from any valid configuration, at most one reward can be collected, at final time. The sum is therefore a probability in $\[ 0 \, 1 \]$. At $x_0$ it is exactly the machine’s acceptance probability. ◻
]

The coordinatewise bound on $p_0$ will be used after weighted projections to larger vertex sets. It holds at every configuration, independently of the acceptance probability at the designated start. Thus the matrix construction and the probability approximation below apply to arbitrary randomized computations satisfying the resource bounds.

===== 2.1 Size convention. <size-convention.>

Fix an integer parameter $B$, a power of two, comparable with $log_2 \( n + 2 \)$ and at least a sufficiently large fixed constant. For example, take the least power of two at least the maximum of that constant and $ceil.l log_2 \( n + 2 \) ceil.r$. This choice is computable in logarithmic space and includes all bounded input lengths in the same construction. All constants throughout the construction are independent of the input; they may depend on the fixed machine and, for fixed inverse-polynomial accuracy, its fixed exponent. The uniform precision parameter of Theorem 2 is handled separately by padding. The number of stages is $L = O \( B \)$. At stage $l$, a vertex has a base identifier followed by $l$ symbols from a fixed radix $D_0$. The radix will be selected by the hierarchy. Encode each base vertex by a fixed-width radix-$D_0$ word and prepend the digit $1$; unused base words are invalid. Appending one copy digit at each stage gives injective numerical identifiers even across different stage lengths. Indeed, a base width $w$ places stage-$l$ identifiers in $\[ D_0^(w + l) \, 2 D_0^(w + l) \)$, and these intervals are disjoint. Appending a fixed suffix is an affine map on identifiers.

Every stage has size at most a common bound

$ N = 2^(C_N B) . $

We may increase the fixed constant $C_N$ as needed. This is a bound on one stage, not a claim that there are only $N$ pairs of vertices. Integrated entry errors below carry a factor $1 \/ N$ while summing over both endpoints.

Fix integers $H gt.eq 4$ and $2 lt.eq h_0 < H$, and put

$ b_k = 2^(- H k) #h(2em) \( k gt.eq 0 \) . $

These are the nominal sampling rates. Stage $l$ will have density $f = b_l$. The stochastic tables will use rates from this same grid for their source and terminal retention tests. The error power in the later analysis is always $s = 8$.

===== 2.2 Uniform constants and finite ranges. <uniform-constants-and-finite-ranges.>

All thresholds needed by the algorithm can be chosen rational, with fixed gaps, and all discrete constants can be chosen integer. We first prove estimates with constants uniform in the ambient finite universe. The sampling construction applies to every finite range of identifiers and rates once its prime field is sufficiently large. The hierarchy uses $O \( B \)$ copy digits and rates with $k = O \( B \)$; Section 12.1 will verify this rate bound also for the recursive estimator and give a compatible order of constant choices.

We can then take the prime field to have size $2^(O \( B \))$, with its exponent chosen after these constants. Its elements and all identifiers occupy $O \( B \)$ bits. Increasing that exponent does not change the probabilistic constants proved in the next section.

== 3 Rank channels for retained vertex sets <sec:env>

The hierarchy will use random retained sets to detect columns with many substantial entries. The atom construction will use the same sets to represent matrix entries. We define the sampling channels and prove the marginal, conditional-pair, and count estimates needed for these two constructions. Section 6 later constructs averaging walks that preserve specified retention conditions.

The environment consists of the independent rank channels below together with a finite string of independent uniform auxiliary bits. The length and uses of that string will be specified when needed.

We use a fixed number of independent rank channels, including channels denoted $X \, Y \, Z$. Extra channels, when needed, are also a fixed finite number. A channel is a uniformly random matrix

$ A = \( a_0 \, F \) in bb(F)_P^(H times h_0) $

conditioned on the last $r = h_0 - 1$ columns $F$ being linearly independent. We call such an ordered collection of columns a #emph[frame]. The integer $P$ is prime. It is chosen larger than every identifier and sufficiently large for all rate comparisons below. For a numerical identifier $y$, set

$ v \( y \) = \( 1 \, y \, dots.h \, y^(h_0 - 1) \)^(sans(T)) \, #h(2em) a \( y \) = A v \( y \) in bb(F)_P^H . $

Field elements in a retention test use their representatives in ${ 0 \, dots.h \, P - 1 }$. At nominal rate $b_k$, let

$ L_k = ceil.l P 2^(- k) ceil.r \, #h(2em) pi_(b_k) = \( L_k \/ P \)^H . $

The identifier is retained if all coordinates of $a \( y \)$ lie in ${ 0 \, dots.h \, L_k - 1 }$. Write $X_a \( y \)$ for the indicator on channel $X$ at rate $a$, and similarly for other channels. The same notation permits a specified fixed suffix in the channel argument. Retention boxes are nested. All rates in this section belong to the grid $b_k = 2^(- H k)$, and the admissible range satisfies $P 2^(- k) gt.eq 1$. The choices of $H \, h_0$ and the identifier range are those of Section 2.

#thm([Lemma 3.1.])[
  (Rank-channel estimates).  #emph[There are positive constants $c_pi \, C_pi \, C_(upright("pair")) \, C_(upright("var"))$, depending only on $H \, h_0$, with the following properties in every admissible finite range.]
  + #emph[A specified identifier is retained at rate $a$ with probability $pi_a$, where $c_pi a lt.eq pi_a lt.eq C_pi a$.]
  + #emph[For distinct identifiers $x \, y$ and any admissible rates $u \, a$, 
$ Pr { X_a \( y \) = 1 divides X_u \( x \) = 1 } lt.eq C_(upright("pair")) a . $

]
  + #emph[If $A_0$ is a deterministic set of $q$ distinct identifiers and $T_a = sum_(y in A_0) X_a \( y \)$, then 
$ Pr { T_a < q pi_a \/ 2 } lt.eq frac(C_(upright("var")), q pi_a) quad \( q > 0 \) . $

]
  + #emph[Replacing every channel argument $y$ by the same injective affine map $alpha y + beta$ leaves the joint law of all evaluations unchanged, provided $alpha eq.not 0$ in $bb(F)_P$. In particular, a common fixed padding suffix leaves their law unchanged.]
] <lem:env-ranks>

#proof[
  The probability that an unrestricted $H$-by-$r$ matrix is a frame is
  $ q_(upright("fr")) = product_(j = 0)^(r - 1) \( 1 - P^(j - H) \) gt.eq c_(upright("fr")) > 0 . $
  For fixed positive-degree coefficients, $a_0$ is uniform, so any one evaluation is uniform in $bb(F)_P^H$ and independent of frame success. This proves the exact marginal retention probability. In the ranges used, take $P 2^(- k) gt.eq 1$. Then $P 2^(- k) lt.eq L_k lt.eq 2 P 2^(- k)$, proving comparability. The prime exponent can in fact make all these sides much larger than one.
  Without conditioning on a frame, two evaluations at distinct field points are independent uniform vectors: the two evaluation functionals have rank two since $h_0 gt.eq 2$. Consequently
  $ Pr { X_a \( y \) = 1 \, X_u \( x \) = 1 divides F upright(" is a frame") } lt.eq frac(pi_a pi_u, q_(upright("fr"))) . $
  The first marginal after conditioning is still $pi_u$, which proves the second assertion.
  For the third assertion, in the unrestricted distribution the hit count has mean $q pi_a$ and variance at most $q pi_a$, by pairwise independence. Chebyshev’s inequality bounds the stated lower-tail event by $4 \/ \( q pi_a \)$. Conditioning on frame success increases this probability by at most $1 \/ q_(upright("fr"))$.
  Finally, substituting $alpha y + beta$ in a polynomial acts on its positive-degree coefficient columns by an invertible triangular matrix, with diagonal $alpha \, dots.h \, alpha^(h_0 - 1)$. It therefore preserves the frame condition. Its action on the full coefficient array is an invertible linear change of variables, so it preserves uniform measure conditional on that condition. Appending digits in radix $D_0$ has $alpha$ a power of $D_0$; taking $P > D_0$ ensures the required invertibility. ◻
]

== 4 The exact correction and copy hierarchy <sec:hierarchy>

At each stage we reduce the transition entries and transfer their contribution to a reward. The algebra behind this transfer is simple. Given a transition matrix $C$ and a nonnegative correction $E$, put

$ D = C - E + E C . $

Then $I - D = \( I + E \) \( I - C \)$. Thus a relation $W = \( I - C \) p$ becomes $\( I + E \) W = \( I - D \) p$: the same vector $p$ is represented by the new transition and the updated reward. The correction must make $D$ nonnegative and keep its row sums at most one. It must also reduce entries sufficiently fast that, after a controlled increase in the number of active vertices, the remaining transition contribution becomes small. The construction uses only the model reduction, with no one-sided acceptance promise.

At one stage the input is a finite ordered set $V$, a rate $0 < f lt.eq 1$ on the grid of Section 3, and a nonnegative matrix $C$ with

#[#set math.equation(numbering: n => "(4.1)")
 $ C \( x \, y \) = 0 quad upright("unless ") x < y \, #h(2em) C upright(bold(1)) lt.eq upright(bold(1)) \, #h(2em) C \( x \, y \) lt.eq f . $ <eq:hier-input>]

All matrix and vector inequalities are entrywise. Write

$ cal(R) \( C \) = { x : upright("some ") C \( x \, y \) > 0 } \, quad cal(T) \( C \) = { y : upright("some ") C \( x \, y \) > 0 } \, quad cal(A) \( C \) = cal(R) \( C \) union cal(T) \( C \) . $

The stage will reduce the entry bound from $f$ to $f \/ 2^H$ and increase $\| cal(A) \( C \) \|$ by at most a factor of two. We first analyze the correction with an arbitrary fixed column multiplier. We then choose that multiplier by a finite detector calculation, and use copies to divide the entries in columns where correction is not fully enabled.

=== 4.1 Correction with a fixed column multiplier <correction-with-a-fixed-column-multiplier>

Put $q = 2^H$. Fix rational numbers $0 < theta_1 < theta_2 < q^(- 1) \/ 32$ and a nondecreasing Lipschitz function $Q : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ satisfying

#[#set math.equation(numbering: n => "(4.2)")
 $ \( t - theta_2 \)_(+) lt.eq Q \( t \) lt.eq \( t - theta_1 \)_(+) . $ <eq:hier-Q>]

Its eighth root is required to be Lipschitz on bounded intervals. Here and below the scalar cutoffs can be chosen piecewise polynomial with rational coefficients. To see this explicitly, let $beta$ be the normalized integral of $t^7 \( 1 - t \)^7$ on $\[ 0 \, 1 \]$, extended by zero to the left and one to the right. Both $beta^(1 \/ 8)$ and $\( 1 - beta \)^(1 \/ 8)$ are Lipschitz: near their vanishing endpoints the corresponding functions vanish to order eight, and away from those endpoints the assertion follows by differentiation. For example,

$ Q \( t \) = \( t - theta_1 \)_(+) beta (frac(t - theta_1, theta_2 - theta_1)) $

has all the stated properties. Near $theta_1$ its eighth root is of order $\( t - theta_1 \)_(+)^(9 \/ 8)$; elsewhere its root has bounded derivative on every bounded interval. Let $L_Q$ be a fixed Lipschitz constant for $Q$. For real arguments, extend $Q$ by $Q \( t \) = 0$ when $t < 0$. This extension preserves its Lipschitz and root-Lipschitz properties and permits evaluation on real approximations. The exact hierarchy itself uses only nonnegative arguments.

Fix a column multiplier $g : V arrow.r \[ 0 \, 1 \]$. Starting from zero, define

#[#set math.equation(numbering: n => "(4.3)")
 $ E_0 = 0 \, #h(2em) G'_i = C + E_(i - 1) C \, #h(2em) E_i \( x \, y \) = f Q \( G'_i \( x \, y \) \/ f \) g \( y \) quad \( i gt.eq 1 \) . $ <eq:hier-fixed-g-iteration>]

The cutoff leaves a positive residual at each corrected entry. Keeping $g$ fixed makes the update map monotone. We next show that a fixed number of iterations suffices for every such multiplier, independently of the size of $V$. At a nonnegative fixed point $E_(*)$ of this recurrence, put $T = C - E_(*) + E_(*) C$. In a column with $g \( y \) = 1$, the lower bound on $Q$ gives $T \( x \, y \) lt.eq theta_2 f$. The truncation estimate below will transfer this entry bound to a finite correction, with a small additional error. The fixed point is only a comparison object; the hierarchy will use a finite iteration.

#thm([Lemma 4.1.])[
  (Fixed point and factorial truncation).  #emph[For every fixed column multiplier $0 lt.eq g lt.eq 1$, there is a unique strictly forward nonnegative solution of 
#[#set math.equation(numbering: n => "(4.4)")
 $ E_(*) \( x \, y \) = f Q \( \( C + E_(*) C \) \( x \, y \) \/ f \) g \( y \) . $ <eq:hier-fixed-point>]

 For the recurrence in Equation (4.3), $0 lt.eq E_i lt.eq E_(*)$, and for every $k gt.eq 0$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ max_(x \, y) frac(E_(*) \( x \, y \) - E_k \( x \, y \), f) lt.eq e^(1 \/ theta_1) frac(\( L_Q \/ theta_1 \)^k, k !) . $ <eq:hier-factorial>]

 In particular $k_(*)$ can be chosen as a fixed integer so that the right side of Equation (4.5) at $k = k_(*)$ is at most $q^(- 1) \/ 32$, uniformly in $C \, f \, V$, and $g$.]
] <lem:hier-fixed-point>

#proof[
  Order the vertices compatibly with the strictly forward relation. For a fixed row $x$, the entry $\( E_(*) C \) \( x \, y \)$ involves only $E_(*) \( x \, z \)$ with $z < y$. Equation (4.4) therefore defines the row successively, in increasing column order. Columns at or before $x$ receive zero. This proves existence and uniqueness in the stated class, without a contraction hypothesis. Monotonicity of the update map proves $E_i lt.eq E_(*)$ and the nonnegativity of the differences.
  Set $T = C - E_(*) + E_(*) C$. If $a = \( C + E_(*) C \) \( x \, y \)$, then Equation (4.2) implies
  $ 0 lt.eq E_(*) \( x \, y \) lt.eq \( a - theta_1 f \)_(+) . $
  Thus $T gt.eq 0$, and at every positive position of $E_(*)$ one has $T \( x \, y \) gt.eq theta_1 f$. Also
  #[#set math.equation(numbering: n => "(4.6)")
   $ T upright(bold(1)) = C upright(bold(1)) - E_(*) \( upright(bold(1)) - C upright(bold(1)) \) lt.eq C upright(bold(1)) lt.eq upright(bold(1)) . $ <eq:hier-fixed-residual-mass>]
  Consequently, for each fixed row $x$, its set $A_x = { y : E_(*) \( x \, y \) > 0 }$ has cardinality $m_x lt.eq 1 \/ \( theta_1 f \)$.
  Unroll the inequality $E_(*) lt.eq C + E_(*) C$ along this row’s support. Each resulting term for $E_(*) \( x \, y \)$ is a product of entries of $C$ along a sequence
  $ x < z_1 < dots.h.c < z_j < y \, #h(2em) z_1 \, dots.h \, z_j in A_x . $
  Every substitution keeps the source coordinate equal to $x$: the recursive factor is $E_(*) \( x \, z \)$, while only its terminal coordinate changes. All intermediate vertices therefore belong to the same set $A_x$. Strict ordering makes a choice of intermediate vertices specify at most one such sequence. There are at most $binom(m_x, j)$ such sequences, and each product is at most $f^(j + 1)$. The expansion terminates because every sequence is strictly increasing. Therefore
  #[#set math.equation(numbering: n => "(4.7)")
   $ E_(*) \( x \, y \) lt.eq f sum_(j = 0)^(m_x) binom(m_x, j) f^j = f \( 1 + f \)^(m_x) lt.eq f e^(1 \/ theta_1) . $ <eq:hier-fixed-entry>]
  Only the support of the single fixed row $x$ was used here; the number of vertices in the whole graph does not enter the exponent.
  Let $Delta_i = E_(*) - E_i$. These matrices are nonnegative, and their row-$x$ supports are contained in $A_x$. The Lipschitz bound gives
  $ Delta_i \( x \, y \) lt.eq L_Q sum_(z < y) Delta_(i - 1) \( x \, z \) C \( z \, y \) . $
  Outside $A_x$ the left side is zero, so when this inequality is unrolled it suffices to use intermediate vertices from $A_x$ at every step. After $k$ steps there are at most $binom(m_x, k)$ strictly increasing sequences of intermediate vertices. Their initial differences are at most $f e^(1 \/ theta_1)$ by Equation (4.7), and their $k$ transition factors are at most $f^k$. Thus
  $ Delta_k \( x \, y \) lt.eq f e^(1 \/ theta_1) L_Q^k f^k binom(m_x, k) lt.eq f e^(1 \/ theta_1) frac(\( L_Q \/ theta_1 \)^k, k !) . $
  For $k > m_x$ the first upper bound is zero. This proves Equation (4.5). The factorial eventually dominates the fixed exponential factor, giving the stated fixed choice of $k_(*)$. ◻
]

The iteration count $k_(*)$ is now fixed independently of the detectors. We next choose $g$ so that correction is supported on columns with only boundedly many substantial entries. A pilot selects this multiplier; the actual recurrence then uses that one multiplier for all $k_(*)$ steps.

=== 4.2 A finite pilot chooses the column multiplier <a-finite-pilot-chooses-the-column-multiplier>

All expectations defining the detectors are true expectations; an estimate is never used to define its own target.

For the detectors we use independent channels $X \, Y$ from Section 3. Denote their common retention probability at rate $f$ by $pi_f$. The consequences of Lemma 4 needed here can be written, with fixed positive constants, as

#[#set math.equation(numbering: n => "(4.8)")
 $ c_pi f lt.eq pi_f lt.eq C_pi f \, #h(2em) & Pr { Y_f \( w \) = 1 divides Y_f \( y \) = 1 } lt.eq C_(upright("pair")) f &  & \( w eq.not y \) \,\
 & Pr {sum_(x in A) X_f \( x \) < 1 / 2 \| A \| pi_f} lt.eq frac(C_(upright("var")), \| A \| pi_f) &  & \( diameter eq.not A subset.eq V upright(" deterministic") \) . $ <eq:hier-sampling-pair>]

These constants are uniform in the stage, the admissible moduli, and common fixed padding suffixes. No independence between different rows of a detector trial will be assumed.

All threshold choices and ranks below are fixed constants. The pilot uses the iteration count from Lemma 5. Choose

$ 0 < delta_0 < delta_1 < theta_1 \/ 100 \, #h(2em) 0 < eta_(-) < eta_(+) < delta_0 \/ 3 . $

If other row scores require still smaller detector thresholds, make those choices before fixing the ranks. Let $phi.alt$ be a nondecreasing cutoff which is zero through $delta_0$ and one from $delta_1$ on. Let $rho$ be a nonincreasing cutoff which is one through $eta_(-)$ and zero from $eta_(+)$ on. Finally, let $gamma : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ be nonincreasing, one on $\[ 0 \, 1 \/ 2 \]$, and zero on $\[ 4 \/ 5 \, 1 \]$. These functions and their complements, when used, have the root regularity just described.

For a finite multiset of nonnegative numbers, $"rank"_j$ means its $j$-th largest member, with enough additional zeros that this is always defined. Starting from $hat(E)_0 = 0$, perform $k_(*)$ pilot steps. At step $i$, first set

#[#set math.equation(numbering: n => "(4.9)")
 $ G_i = C + hat(E)_(i - 1) C . $ <eq:hier-pilot-input>]

For a draw of the terminal channel, set

#[#set math.equation(numbering: n => "(4.10)")
 $ R_i \( x \) = rho ("rank"_K { G_i \( x \, w \) \/ f : Y_f \( w \) = 1 }) . $ <eq:hier-pilot-row-gate>]

Define the deterministic column number

#[#set math.equation(numbering: n => "(4.11)")
 $ U_i \( y \) = bb(E) ["rank"_J { phi.alt \( G_i \( x \, y \) \/ f \) R_i \( x \) : X_f \( x \) = 1 } thin mid(bar.v) thin Y_f \( y \) = 1] . $ <eq:hier-detector>]

Then put

#[#set math.equation(numbering: n => "(4.12)")
 $ hat(g)_i \( y \) = gamma (max_(1 lt.eq r lt.eq i) U_r \( y \)) \, #h(2em) hat(E)_i \( x \, y \) = f Q \( G_i \( x \, y \) \/ f \) hat(g)_i \( y \) . $ <eq:hier-pilot-correction>]

The order of these definitions is essential: $G_i$ is already deterministic when its detector is formed, and $U_i$ is defined before $hat(E)_i$. The running maximum makes $hat(g)_i$ nonincreasing. Its final value is therefore no larger than any earlier pilot multiplier; monotonicity of $Q$ will let us bound the actual corrections by the pilot corrections.

After the pilot, set $g = hat(g)_(k_(*))$ and specialize the fixed-multiplier recurrence of Equation (4.3) to the actual correction

#[#set math.equation(numbering: n => "(4.13)")
 $ E_0 = 0 \, #h(2em) G'_i = C + E_(i - 1) C \, #h(2em) E_i \( x \, y \) = f Q \( G'_i \( x \, y \) \/ f \) g \( y \) quad \( 1 lt.eq i lt.eq k_(*) \) . $ <eq:hier-actual-iteration>]

Write

#[#set math.equation(numbering: n => "(4.14)")
 $ E = E_(k_(*)) \, #h(2em) D = C - E + E C . $ <eq:hier-residual-definition>]

#thm([Lemma 4.2.])[
  (Elementary pilot bounds).  #emph[All pilot and actual inputs and corrections are nonnegative and strictly forward. For $1 lt.eq i lt.eq k_(*)$, 
$ G_i upright(bold(1)) \, med hat(E)_i upright(bold(1)) \, med G'_i upright(bold(1)) \, med E_i upright(bold(1)) & lt.eq i upright(bold(1)) \,\
G_i \( x \, y \) \, med hat(E)_i \( x \, y \) \, med G'_i \( x \, y \) \, med E_i \( x \, y \) & lt.eq i f . $

 Moreover, 
$ E_(i - 1) lt.eq E_i lt.eq hat(E)_i \, #h(2em) G'_i lt.eq G_i . $

 The row and column supports of every matrix in this statement are contained in $cal(R) \( C \)$ and $cal(T) \( C \)$, respectively.]
] <lem:hier-pilot-bounds>

#proof[
  Equation (4.2) gives $Q \( 0 \) = 0$ and $0 lt.eq Q \( t \) lt.eq t$ for $t gt.eq 0$. Consequently $hat(E)_i lt.eq G_i$. If $hat(E)_(i - 1) upright(bold(1)) lt.eq \( i - 1 \) upright(bold(1))$, then
  $ G_i upright(bold(1)) = C upright(bold(1)) + hat(E)_(i - 1) C upright(bold(1)) lt.eq upright(bold(1)) + hat(E)_(i - 1) upright(bold(1)) lt.eq i upright(bold(1)) . $
  For an individual entry,
  $ G_i \( x \, y \) lt.eq f + f sum_z hat(E)_(i - 1) \( x \, z \) lt.eq i f . $
  This proves the pilot bounds by induction.
  The sequence $hat(g)_i$ is nonincreasing, so $g lt.eq hat(g)_i$ for every $i$. Induction in Equations (4.9)–(4.13), using monotonicity of $Q$, proves $E_i lt.eq hat(E)_i$ and $G'_i lt.eq G_i$. The map $F mapsto f Q \( \( C + F C \) \/ f \) g$, applied entrywise after forming the matrix product, is monotone. Its iteration from zero is therefore nondecreasing. The actual bounds follow from the pilot bounds.
  A product of strictly forward matrices is strictly forward. A zero row of $C$ remains a zero row in all these formulas, by induction from the zero correction. A zero column of $C$ is a zero column of every product of the form $F C$ and hence of every input and correction. This proves the remaining assertions. ◻
]

#thm([Lemma 4.3.])[
  (The detector bounds overloaded columns).  #emph[Let 
$ D_(upright("row")) = 1 + C_(upright("pair")) k_(*) \/ eta_(-) . $

 Choose the integer $K gt.eq 160 D_(upright("row"))$, increasing it if necessary for the other finitely many row-gate estimates. For any fixed positive integer $J$, choose 
#[#set math.equation(numbering: n => "(4.15)")
 $ R_(*) gt.eq c_pi^(- 1) max \( 4 J \, 40 C_(upright("var")) \) . $ <eq:hier-column-constants>]

 Then the pilot has the following properties.]
  + #emph[If $\# { x : G_i \( x \, y \) gt.eq delta_1 f } > R_(*) \/ f$, then $U_i \( y \) gt.eq 19 \/ 20 > 9 \/ 10$.]
  + #emph[If $U_i \( y \) > 1 \/ 4$, then 
$ \# { x : G_i \( x \, y \) > delta_0 f } > frac(J, 4 C_pi f) . $

]
  + #emph[For any pilot correction with multiplier $hat(g)_i \( y \) > 0$, 
$ \# { x : G_i \( x \, y \) gt.eq delta_1 f } lt.eq R_(*) \/ f . $

 For every actual correction, $g \( y \) > 0$ implies 
$ \# { x : G'_i \( x \, y \) gt.eq delta_1 f } lt.eq R_(*) \/ f . $

]
] <lem:hier-column-test>

#proof[
  Fix $i \, y$ and condition on $Y_f \( y \) = 1$. In a fixed row, the set ${ w : G_i \( x \, w \) > eta_(-) f }$ has cardinality at most $k_(*) \/ \( eta_(-) f \)$ by Lemma 6. Its expected number of retained members is at most $D_(upright("row"))$: the specified terminal $y$, if in this set, contributes at most one, and Equation (4.8) applies to every other member. If the row gate is not full, at least $K$ such members have been retained. Markov’s inequality therefore gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ Pr { R_i \( x \) < 1 divides Y_f \( y \) = 1 } lt.eq D_(upright("row")) \/ K . $ <eq:hier-row-failure>]
  Let $A = { x : G_i \( x \, y \) gt.eq delta_1 f }$ and $n = \| A \|$. Let $N_A$ count its retained starts, and let $L_A$ count those retained starts whose row gate is not full. Independence of the two channels and Equation (4.16) imply
  $ bb(E) \[ L_A divides Y_f \( y \) = 1 \] lt.eq n pi_f D_(upright("row")) \/ K . $
  Thus
  $ Pr { L_A > n pi_f \/ 4 divides Y_f \( y \) = 1 } lt.eq 1 \/ 40 . $
  The law of the start channel is unchanged by the conditioning, so Equation (4.8) gives
  $ Pr { N_A < n pi_f \/ 2 divides Y_f \( y \) = 1 } lt.eq C_(upright("var")) \/ \( n pi_f \) . $
  If $n > R_(*) \/ f$, Equation (4.15) ensures $n pi_f gt.eq max \( 4 J \, 40 C_(upright("var")) \)$. Outside an event of probability at most $1 \/ 20$, there are at least $J$ retained high rows with full gates. Each has score exactly one, so the trial’s $J$-th largest score is one. All trial scores lie in $\[ 0 \, 1 \]$, proving the first assertion. This argument used no independence among the row-gate failures.
  For the second assertion let $A_0 = { x : G_i \( x \, y \) > delta_0 f }$, and let $N_0$ be its number of retained starts. A positive score must come from $A_0$. Pointwise the trial is at most $upright(bold(1))_({ N_0 gt.eq J })$, and hence at most $N_0 \/ J$. Its conditional expectation is at most $\| A_0 \| pi_f \/ J lt.eq \| A_0 \| C_pi f \/ J$. The asserted lower bound on $\| A_0 \|$ follows.
  Finally, a positive $hat(g)_i \( y \)$ implies $U_i \( y \) < 4 \/ 5$, so the first assertion excludes a high-entry count greater than $R_(*) \/ f$. If $g \( y \) > 0$, all pilot multipliers at $y$ are positive. Apply the same bound to every $G_i$ and then use $G'_i lt.eq G_i$ from Lemma 6. ◻
]

=== 4.3 The finite residual <the-finite-residual>

The factorial estimate gives a fixed iteration count. We now return to the finite correction $E = E_(k_(*))$ and show that its residual is substochastic and has small entries on columns where correction is fully enabled. We also bound the unsigned constituents of its defining expression by the residual itself, as needed when that expression is estimated term by term.

#thm([Lemma 4.4.])[
  (Residual bounds and unsigned-term domination).  #emph[For the $k_(*)$ chosen in Lemma 5, put 
$ K_(*) = k_(*) + 1 \, #h(2em) epsilon_(upright("good")) = theta_2 + q^(- 1) \/ 32 < q^(- 1) \/ 16 \, #h(2em) c_(upright("dom")) = theta_1 \/ \( 2 k_(*) \) . $

 The matrix $D$ in Equation (4.14) is nonnegative, strictly forward, and substochastic. Its entries satisfy 
#[#set math.equation(numbering: n => "(4.17)")
 $ D \( x \, y \) lt.eq K_(*) f \, #h(2em) g \( y \) = 1 med arrow.r.double med D \( x \, y \) lt.eq epsilon_(upright("good")) f . $ <eq:hier-residual-entry-bounds>]

 Furthermore, 
#[#set math.equation(numbering: n => "(4.18)")
 $ D gt.eq c_(upright("dom")) \( C + E + E C \) . $ <eq:hier-domination>]

 Thus every unsigned term in $C - E + E C$ is bounded by a fixed multiple of $D$. In the formulas $G_i = C + hat(E)_(i - 1) C$ and $G'_i = C + E_(i - 1) C$, each unsigned term is bounded by the corresponding input itself. Moreover, $cal(R) \( D \) subset.eq cal(R) \( C \)$ and $cal(T) \( D \) subset.eq cal(T) \( C \)$.]
] <lem:hier-residual>

#proof[
  Set $A = G'_(k_(*))$ and $delta = \( E - E_(k_(*) - 1) \) C gt.eq 0$. Then
  #[#set math.equation(numbering: n => "(4.19)")
   $ D = A - E + delta \, #h(2em) A - E gt.eq min \( A \, theta_1 f \) . $ <eq:hier-subsolution-residual>]
  Here and in the minimum the scalar $theta_1 f$ denotes the constant entrywise bound. The second inequality follows from $E lt.eq \( A - theta_1 f \)_(+)$. It proves $D gt.eq 0$. Since $C upright(bold(1)) lt.eq upright(bold(1))$ and $E gt.eq 0$,
  $ D upright(bold(1)) = C upright(bold(1)) - E \( upright(bold(1)) - C upright(bold(1)) \) lt.eq C upright(bold(1)) lt.eq upright(bold(1)) . $
  Also $D lt.eq C + E C$, whose entries are at most $f + f sum_z E \( x \, z \) lt.eq \( k_(*) + 1 \) f$ by Lemma 6. Strict forwardness and the support claims follow from the same formulas.
  Because $A \( x \, y \) lt.eq k_(*) f$, Equation (4.19) gives $A - E gt.eq \( theta_1 \/ k_(*) \) A$. On the other hand,
  $ C + E + E C = A + E + delta lt.eq 2 A + delta . $
  Since $theta_1 \/ k_(*) < 1$, these two inequalities prove Equation (4.18). The remaining unsigned-term assertions are immediate from nonnegativity of the summands in the two input formulas.
  For the good-column bound use the fixed point with this same multiplier $g$, and set $Delta = E_(*) - E$. With $T = C - E_(*) + E_(*) C$,
  $ D = T + Delta - Delta C lt.eq T + Delta . $
  If $g \( y \) = 1$, the lower bound in Equation (4.2) gives $T \( x \, y \) lt.eq theta_2 f$. Equation (4.5) gives $Delta \( x \, y \) lt.eq q^(- 1) f \/ 32$. This proves Equation (4.17). ◻
]

The domination in Equation (4.18) is also an estimation bound. It lets us compare the three unsigned contributions $C$, $E$, and $E C$ separately against their estimates, measuring each error relative to the same nonnegative target $D$. Their signs are then combined by a triangle inequality in Lemma 26. The estimated raw arrays may have negative entries; positivity here is a property of the exact target.

=== 4.4 Copies reduce density while controlling active vertices <copies-reduce-density-while-controlling-active-vertices>

The residual already has small entries in columns with $g \( y \) = 1$. We distribute the remaining large entries among copies of their destinations. The detector incidence bound will limit the number of parents with active extra copies, and a weighted projection will relate the new transition to the residual.

Choose an integer $D_0 > K_(*) q$, and let $tau_0 = q^(- 1) \/ 8$, $tau_1 = q^(- 1) \/ 4$. Choose a rising cutoff $chi$ which is zero through $tau_0$ and one from $tau_1$ on. For $0 lt.eq j < D_0$ set

#[#set math.equation(numbering: n => "(4.20)")
 $ s_0 \( t \) = 1 - \( 1 - D_0^(- 1) \) chi \( t \) \, #h(2em) s_j \( t \) = D_0^(- 1) chi \( t \) quad \( j > 0 \) . $ <eq:hier-routing-fractions>]

They are nonnegative, sum to one, and have Lipschitz eighth roots on bounded ranges. Define $U^max \( x \) = max_(1 lt.eq i lt.eq k_(*)) U_i \( x \)$. Let $kappa$ be a rising cutoff, zero through $1 \/ 4$ and one from $1 \/ 2$ on, and put

#[#set math.equation(numbering: n => "(4.21)")
 $ r_0 \( x \) = 1 \, #h(2em) r_j \( x \) = kappa \( U^max \( x \) \) quad \( j > 0 \) . $ <eq:hier-copy-row-factors>]

On $V^(+) = V times { 0 \, dots.h \, D_0 - 1 }$ write $x_i = \( x \, i \)$ and set

#[#set math.equation(numbering: n => "(4.22)")
 $ C^(+) \( x_i \, y_j \) = r_i \( x \) D \( x \, y \) s_j \( D \( x \, y \) \/ f \) . $ <eq:hier-copy-transition>]

Order the copies first by their parent and then by their copy symbol.

#thm([Proposition 4.5.])[
  (One-stage density and active-count reduction).  #emph[Choose the detector rank $J$ large enough that 
#[#set math.equation(numbering: n => "(4.23)")
 $ J gt.eq frac(2 C_pi \( D_0 - 1 \) k_(*) \( k_(*) + 1 \), delta_0) \, $ <eq:hier-active-J>]

 and then choose $R_(*)$ as in Equation (4.15). The matrix $C^(+)$ is strictly forward and substochastic, and 
$ C^(+) \( x_i \, y_j \) lt.eq f \/ q \, #h(2em) \| cal(A) \( C^(+) \) \| lt.eq 2 \| cal(A) \( C \) \| . $

 If $P^r$ is the matrix from $V^(+)$ to $V$ defined by 
#[#set math.equation(numbering: n => "(4.24)")
 $ P^r \( x_i \, x \) = r_i \( x \) \, #h(2em) P^r \( x_i \, z \) = 0 quad \( z eq.not x \) \, $ <eq:hier-projection>]

 then 
#[#set math.equation(numbering: n => "(4.25)")
 $ C^(+) P^r = P^r D . $ <eq:hier-one-step-intertwining>]

]
] <prop:hier-copy-step>

#proof[
  The row sum at $x_i$ is $r_i \( x \) sum_y D \( x \, y \) lt.eq 1$. Strict forwardness follows from that of $D$. Put $t = D \( x \, y \) \/ f$. If $t < tau_1$, then every routed entry is at most $f t < f \/ q$. If $t gt.eq tau_1$, all fractions equal $1 \/ D_0$, so every entry is at most $K_(*) f \/ D_0 < f \/ q$. This proves the density bound.
  If a nonprimary fraction $s_j \( D \( x \, y \) \/ f \)$ is positive on a positive entry, then $D \( x \, y \) \/ f > tau_0 > epsilon_(upright("good"))$. Lemma 8 therefore implies $g \( y \) < 1$. Since $gamma$ equals one through $1 \/ 2$, this gives $U^max \( y \) > 1 \/ 2$, and hence $r_j \( y \) = 1$. The primary factor is always one. Thus for every positive entry of $D$,
  #[#set math.equation(numbering: n => "(4.26)")
   $ sum_(j = 0)^(D_0 - 1) s_j \( D \( x \, y \) \/ f \) r_j \( y \) = 1 . $ <eq:hier-routing-projects>]
  For a zero entry no identity of its fractions is needed. Multiplying Equation (4.22) by $P^r$ and using Equation (4.26) proves Equation (4.25) entrywise.
  It remains to count active vertices. Put
  $ cal(O) = { y : U^max \( y \) > 1 \/ 4 } \, #h(2em) n' = \| cal(A) \( C \) \| . $
  Every $y in cal(O)$ has, for some pilot step $i$, more than $J \/ \( 4 C_pi f \)$ entries with $G_i \( x \, y \) > delta_0 f$, by Lemma 7. Counting these incidences over all steps and all active rows, and using Lemma 6, gives
  $ \| cal(O) \| frac(J, 4 C_pi f) & lt.eq sum_(i = 1)^(k_(*)) \# { \( x \, y \) : G_i \( x \, y \) > delta_0 f }\
 & lt.eq frac(n', delta_0 f) sum_(i = 1)^(k_(*)) i = frac(n' k_(*) \( k_(*) + 1 \), 2 delta_0 f) . $
  The assertion is also valid when $n' = 0$, since then all matrices and detectors vanish. Thus
  $ \| cal(O) \| lt.eq frac(2 C_pi n' k_(*) \( k_(*) + 1 \), delta_0 J) . $
  Every active child has an active parent, by the support conclusion of Lemma 8. A nonprimary child active as a row has $r_i \( x \) > 0$, so its parent belongs to $cal(O)$. A nonprimary child active as a column has a positive extra routing fraction and, as shown above, its parent has $U^max > 1 \/ 2$, so again belongs to $cal(O)$. Therefore
  $ \| cal(A) \( C^(+) \) \| lt.eq n' + \( D_0 - 1 \) \| cal(O) \| lt.eq 2 n' \, $
  where the last inequality is Equation (4.23). ◻
]

#prodef([Remark 4.6.])[
  (Order of the one-stage constants).  The bounds used to select $k_(*)$ in Lemma 5 hold for every multiplier in $\[ 0 \, 1 \]$. Thus $theta_1 \, theta_2 \, Q \, k_(*) \, K_(*)$ and $D_0$ can be fixed before any detector rank. Next fix all finitely many correction, detector, and access-score threshold ladders, taking $delta_0 \, delta_1$ below the correction support thresholds as required. Choose $K$ large enough for the corresponding row estimates. Choose $J$ by Equation (4.23), and then $R_(*)$ by Equation (4.15). An incoming rank used later can be chosen after $R_(*)$: its full-gate probability is controlled by the column bound in Lemma 7, independently of the auxiliary row gates. There is therefore no requirement to enlarge $K$ again in response to that incoming rank. Subsequent estimator constants may depend on these already fixed ranks and thresholds.
] <rem:hier-constant-order>

=== 4.5 Reward transport and the final deterministic target <reward-transport-and-the-final-deterministic-target>

The copy step controls transition entries and active vertices. We now iterate it and transport the terminal reward through the same weighted projections. The resulting reward will approximate the original acceptance probability, including probabilities strictly between zero and one.

Starting with $C_0 = S$ on $V_0$, repeat the one-stage construction with

$ f_l = q^(- l) \, #h(2em) V_(l + 1) = V_l times { 0 \, dots.h \, D_0 - 1 } \, #h(2em) C_(l + 1) = C_l^(+) . $

Let $E_l \, D_l \, P_l^r$ denote the correction, residual, and projection at stage $l$. Define matrices from $V_l$ to $V_0$ by

#[#set math.equation(numbering: n => "(4.27)")
 $ P_0^c = I \, #h(2em) P_(l + 1)^c = P_l^r P_l^c \, #h(2em) B_0 = I \, #h(2em) B_(l + 1) = P_l^r \( I + E_l \) B_l . $ <eq:hier-cumulative-matrices>]

The superscript $c$ here denotes the cumulative projection, not a transpose. Let $e$ be the base final-success reward and $p_0 = \( I - S \)^(- 1) e$, so $0 lt.eq p_0 lt.eq 1$ by the model reduction.

#thm([Proposition 4.7.])[
  (Reward identity and a shallow target).  #emph[For every stage, 
#[#set math.equation(numbering: n => "(4.28)")
 $ C_l P_l^c = P_l^c - B_l \( I - S \) . $ <eq:hier-reward-algebra>]

 The vectors $W_l = B_l e$ satisfy 
#[#set math.equation(numbering: n => "(4.29)")
 $ 0 lt.eq W_l lt.eq 1 \, #h(2em) W_l = P_l^c p_0 - C_l P_l^c p_0 \, $ <eq:hier-reward-bound>]

 and their updates are 
#[#set math.equation(numbering: n => "(4.30)")
 $ W_(l + 1) \( x_i \) = r_i \( x \) #scale(x: 120%, y: 120%)[\(] W_l \( x \) + \( E_l W_l \) \( x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:hier-reward-update>]

 If $macron(x)_l$ is the all-primary copy of a base vertex $x$, then 
#[#set math.equation(numbering: n => "(4.31)")
 $ 0 lt.eq p_0 \( x \) - W_l \( macron(x)_l \) lt.eq \| V_0 \| thin 2^(- \( H - 1 \) l) . $ <eq:hier-final-error>]

 Consequently there is $L = O \( B \)$ for which the last upper bound is strictly less than $1 \/ 16$ for every base vertex $x$. In particular, $p_0 \( x \) = 0$ implies $W_L \( macron(x)_L \) = 0$, and $p_0 \( x \) gt.eq 1 \/ 2$ implies $W_L \( macron(x)_L \) > 7 \/ 16$. Every full stage domain has size $2^(O \( B \))$ and admits $O \( B \)$-bit addresses.]
] <prop:hier-reward-target>

#proof[
  The assertion at $l = 0$ is $S = I - \( I - S \)$. The residual identity can be written as
  $ D_l = I - \( I + E_l \) \( I - C_l \) . $
  Using Equation (4.25) and then the inductive hypothesis,
  $ C_(l + 1) P_(l + 1)^c & = P_l^r D_l P_l^c\
 & = P_l^r #scale(x: 120%, y: 120%)[\(] P_l^c - \( I + E_l \) \( P_l^c - C_l P_l^c \) #scale(x: 120%, y: 120%)[\)]\
 & = P_(l + 1)^c - P_l^r \( I + E_l \) B_l \( I - S \)\
 & = P_(l + 1)^c - B_(l + 1) \( I - S \) . $
  This proves Equation (4.28).
  Every $B_l$ is nonnegative. Every $P_l^r$ has at most one nonzero entry per row, of value in $\[ 0 \, 1 \]$, and thus $P_l^c$ is substochastic. Apply Equation (4.28) to $p_0$, using $\( I - S \) p_0 = e$. This gives the identity in Equation (4.29). Its lower bound follows from $B_l e gt.eq 0$; its upper bound follows from $W_l lt.eq P_l^c p_0 lt.eq 1$. Equation (4.30) is Equation (4.27) applied to $e$.
  By Proposition 9, induction gives
  $ \| cal(A) \( C_l \) \| lt.eq 2^l \| cal(A) \( S \) \| lt.eq 2^l \| V_0 \| \, #h(2em) C_l \( x \, y \) lt.eq q^(- l) . $
  There are at most $\| cal(A) \( C_l \) \|$ columns containing any positive entry, so each row sum of $C_l$ is at most $\| V_0 \| 2^l q^(- l) = \| V_0 \| 2^(- \( H - 1 \) l)$. The all-primary projection has every row factor equal to one and hence $\( P_l^c p_0 \) \( macron(x)_l \) = p_0 \( x \)$. The identity in Equation (4.29), together with $0 lt.eq P_l^c p_0 lt.eq 1$, now proves Equation (4.31).
  Choose an integer $L$ such that $\( H - 1 \) L > log_2 \( 16 \| V_0 \| \)$. Since $log_2 \| V_0 \| = O \( B \)$, this is $O \( B \)$. If $p_0 \( x \) = 0$, nonnegativity forces $W_L \( macron(x)_L \) = 0$. If $p_0 \( x \) gt.eq 1 \/ 2$, the strict error bound gives $W_L \( macron(x)_L \) > 7 \/ 16$. Finally,
  $ \| V_l \| = \| V_0 \| D_0^l = 2^(O \( B \)) #h(2em) \( 0 lt.eq l lt.eq L \) \, $
  because $D_0$ is fixed. Parent projection deletes one radix symbol, and appending a specified symbol is affine in the numerical ID. Thus these domain changes preserve the address convention required by the sampler and by the later implementation. ◻
]

The remainder of the proof will estimate the finite targets just constructed. In particular, it need only implement the $k_(*)$ pilot and $k_(*)$ actual updates at a stage and the reward update in Equation (4.30); it does not evaluate $E_(*)$. The same error bound in Equation (4.31) gives any fixed inverse-polynomial accuracy by increasing the constant in $L = O \( B \)$. Section 12 makes that choice together with the statistical and numerical precisions.

== 5 Stochastic atoms and their interfaces <sec:atom>

The exact hierarchy uses matrix entries, correction products, and column detector expectations. We represent each of these by sample-dependent tables: bins represent entries of the transitions and residuals, correction tables represent the pilot and actual corrections, and score tables represent the detector trials. Each normalized table has an earlier preparatory table that supplies its denominator.

We first prove the exact conditional-mean identities. We then extend the same row formulas to computed raw arrays and prove the support and access bounds that hold even when those arrays are inaccurate. Finally we bound the effect of errors in the incoming gates and column multipliers. The later implementation supplies enumeration and pairing of the resulting ports.

Exact conditional-mean identities refer only to the true tables defined here. Applying the same formulas to approximate raw signals gives approximate tables; their normalization need not be unbiased.

Weighted pseudorandomness provides a related way to represent expectations with few random bits; see Braverman, Cohen and Garg #cite(label("BravermanCohenGarg2020")) and the error-reduction work of Cohen, Doron, Renard, Sberlo and Ta-Shma #cite(label("CohenDoronRenardSberloTaShma2021")). The tables below have exact conditional-mean identities. Their estimates use a common environment, so products and subsequent normalization are analyzed through joint error bounds rather than independent sampling.

=== 5.1 Table domains and the normalization principle <table-domains-and-the-normalization-principle>

Throughout this section $s = 8$. Fix a stage, write $f = b_l$, and let $G$ be one of its nonnegative raw matrix inputs. The hierarchy gives absolute constants $M_G \, K_G$ such that

#[#set math.equation(numbering: n => "(5.1)")
 $ sum_y G \( x \, y \) lt.eq M_G \, #h(2em) G \( x \, y \) lt.eq K_G f . $ <eq:atom-input-bounds>]

These bounds include pilot and actual inputs and the residual $D$; see Lemmas 6 and 8. For a correction $F = f Q \( G \/ f \) g_0$, the additional input is

#[#set math.equation(numbering: n => "(5.2)")
 $ g_0 \( y \) > 0 quad arrow.r.double quad \# { x : G \( x \, y \) gt.eq delta_1 f } lt.eq R_(*) \/ f \, $ <eq:atom-column-input>]

from Lemma 7.

A row task has start rate $u lt.eq f$, end scale $a$, and, when needed, a usage rate $t lt.eq a$, all on the rate grid. Its domain is $X_u \( x \) = Y_a \( y \) = 1$, with distinct start and terminal channels. We use $a lt.eq K_f f$ for an absolute $K_f$, and use $a = f$ for corrections and detector scores. Here and in the estimation and compression sections, $t$ denotes a sampling rate; the numerical clock $t$ is introduced separately in Section 10. The true first raw signal is

#[#set math.equation(numbering: n => "(5.3)")
 $ d_y = G \( x \, y \) \/ a . $ <eq:atom-first-signal>]

An optional second raw signal is $zeta upright(bold(1))_({ Y_t \( y \) = 1 }) q_y$, where $q_y = q \( x \, y \) in \[ 0 \, 1 \]$ is a deterministic conditional mean and $zeta > 0$ is a fixed sufficiently small constant. That mean will be specified separately for each normalized task.

All parameters of a table are common to the whole table: its stage and iteration, task type, channel roles, channel padding suffixes, rates $u \, a \, t$, and subsequently its budget and numerical convention. They do not depend on the row or column at which the table is queried.

Write $"rk"_k$ for the $k$th largest value, with unlimited zero padding. For two arrays on the same padded index set,

#[#set math.equation(numbering: n => "(5.4)")
 $ \| "rk"_k \( v \) - "rk"_k \( w \) \| lt.eq sup_z \| v_z - w_z \| . $ <eq:atom-rank-lipschitz>]

Indeed, if every coordinate changes by at most $epsilon.alt$, at least $k$ coordinates at or above the old $k$th value remain at or above that value minus $epsilon.alt$; apply this in both directions.

The normalization can be seen before choosing the row functions. Fix a pair $\( x \, y \)$ on its conditioning slice, a deterministic nonnegative value $k \( d_y \)$, and a random row gate $R in \[ 0 \, 1 \]$. Choose a preparatory factor $h$ that is one wherever $k$ is positive. If

$ q \( x \, y \) = bb(E) \[ h \( d_y \) R divides X_u \( x \) = Y_t \( y \) = 1 \] gt.eq 1 / 2 $

on that support, then $k \( d_y \) R \/ q \( x \, y \)$ has conditional mean $k \( d_y \)$ there. A clipped denominator keeps the formula bounded at every other position and for computed inputs. The constructions below arrange a uniform positive lower bound on this mean while the row gate limits the number of nonzero retained entries. Corrections use an additional incoming gate, with the same normalization principle.

For real $alpha < beta$, let $chi_(alpha \, beta)$ be a fixed increasing switch, zero on $\( - oo \, alpha \]$ and one on $\[ beta \, oo \)$. Choose it by rescaling the normalized integral of $z^(s - 1) \( 1 - z \)^(s - 1)$ on $\[ 0 \, 1 \]$. Both $chi_(alpha \, beta)^(1 \/ s)$ and $\( 1 - chi_(alpha \, beta) \)^(1 \/ s)$ are Lipschitz: at either endpoint the vanishing function has a zero of order $s$, and on the interior ordinary differentiation applies. Products of bounded functions with Lipschitz $s$th roots again have Lipschitz $s$th roots.

Every scalar saturation below uses fixed min/max clipping,

$ "clip"_(\[ alpha \, beta \]) \( v \) = min { beta \, max { alpha \, v } } \, $

which is $1$-Lipschitz. We specify its bounds when defining the function. Functions initially defined for nonnegative first entries are extended by zero below zero; each already vanishes below a positive support threshold. These conventions apply only to evaluation of the row functions. Ranks and access tests always use the full prescribed raw arrays before scalar clipping.

Here is one explicit set of margins used below. Let $theta.alt > 0$ be a fixed lower support threshold of a main row function, and put $rho = "rk"_K \( v \)$ for its first raw row $v$. Define

#[#set math.equation(numbering: n => "(5.5)")
 $ h_theta.alt \( v \) & = chi_(theta.alt \/ 2 \, thin 3 theta.alt \/ 4) \( v \) \,\
R_theta.alt \( rho \) & = 1 - chi_(theta.alt \/ 1000 \, thin theta.alt \/ 500) \( rho \) \,\
I_theta.alt \( v \, rho \) & = chi_(theta.alt \/ 8 \, thin theta.alt \/ 4) \( v \) #scale(x: 120%, y: 120%)[\(] 1 - chi_(theta.alt \/ 100 \, thin theta.alt \/ 50) \( rho \) #scale(x: 120%, y: 120%)[\)] . $ <eq:atom-threshold-template>]

We take $theta.alt = theta_1$ for corrections, $theta.alt = 1 \/ 2$ for dense bins, and $theta.alt = delta_0$ for the detector score. For that detector we make the allowed hierarchy choices

$ eta_(-) = delta_0 \/ 1000 \, #h(2em) eta_(+) = delta_0 \/ 500 \, #h(2em) rho \( t \) = 1 - chi_(delta_0 \/ 1000 \, thin delta_0 \/ 500) \( t \) = R_(delta_0) \( t \) . $

Here $rho$ denotes the cutoff in the hierarchy, and the same switch $chi$ is used in both occurrences. These choices satisfy $0 < eta_(-) < eta_(+) < delta_0 \/ 3$. Thus the detector row gate here is exactly $R_i$ in Equation (4.10). The detector does not require $h_theta.alt$. The hierarchy’s choices may and do satisfy $delta_1 < theta_1 \/ 100$ and $0 < delta_0 < delta_1$. Thus the correction auxiliary score $I_(theta_1)$ can be positive only when $G \( x \, y \) > delta_1 f$.

=== 5.2 Dense bins and preparatory normalization <dense-bins-and-preparatory-normalization>

We first split a raw entry into contributions at the rate-grid scales. At each scale a row gate bounds the number of retained entries, and an exact preparatory conditional mean corrects the loss caused by that gate.

Put $q_(*) = 2^H$, and let $chi = chi_(1 \/ 2 \, 1)$. For $w gt.eq 0$ define

#[#set math.equation(numbering: n => "(5.6)")
 $ omega_0 \( w \) & = chi \( w \) \,\
omega_k \( w \) & = chi \( w \/ b_k \) - chi \( w \/ b_(k - 1) \) #h(2em) \( k gt.eq 1 \) . $ <eq:atom-bin-weights>]

The top bin has no preceding switch. The weights are nonnegative and sum to one for $w > 0$, since their partial sums telescope to $chi \( w \/ b_k \) arrow.r 1$. Hence

#[#set math.equation(numbering: n => "(5.7)")
 $ w = sum_(k gt.eq 0) w omega_k \( w \) . $ <eq:atom-bin-partition>]

At scale $a = b_k$, the bin in atom units is

#[#set math.equation(numbering: n => "(5.8)")
 $ k_a \( d \) = d omega_k \( a d \) . $ <eq:atom-bin-function>]

For $k gt.eq 1$ its support is contained in $1 \/ 2 < d < q_(*)$. Its two switch transition intervals are disjoint, and

$ chi \( d \) - chi \( d \/ q_(*) \) = chi \( d \) \( 1 - chi \( d \/ q_(*) \) \) \, $

which proves directly that its $s$th root is Lipschitz. For $k = 0$, fix $B_(upright("top")) > max { K_G \, 1 }$ and evaluate the defining expression at $"clip"_(\[ 0 \, B_(upright("top")) \]) \( d \)$. This makes the top-bin function bounded with Lipschitz root. It preserves every true value, since $a = b_0 = 1$ and $G \( x \, y \) lt.eq K_G f lt.eq K_G$. For $k gt.eq 1$, retain the zero extension outside the support $\( 1 \/ 2 \, q_(*) \)$; no upper clipping changes a zero bin value. Bins with $a > 2 K_G f$ vanish on the true input, so a fixed $K_f gt.eq 2 K_G$ suffices for the permitted scale range.

For the routed residual bin use instead

#[#set math.equation(numbering: n => "(5.9)")
 $ k_a^(\( j \)) \( d \) = k_a \( d \) s_j \( a d \/ f \) . $ <eq:atom-routed-bin>]

The routing fractions have bounded Lipschitz roots. Since $a \/ f lt.eq K_f$ and the bin is zero above a fixed argument range (or is top-bin clipped), these functions have uniformly bounded Lipschitz roots as well. The same zero-extension and clipping conventions apply to routed bins. Summing Equation (5.9) over scales gives the routed residual contribution exactly on every true input.

Choose $R_(1 \/ 2)$ and $h = h_(1 \/ 2)$ from Equation (5.5). For the true row set

$ rho_x = "rk"_K { G \( x \, z \) \/ a : Y_a \( z \) = 1 } \, #h(2em) R = R_(1 \/ 2) \( rho_x \) . $

Write

#[#set math.equation(numbering: n => "(5.10)")
 $ q_y = bb(E) #scale(x: 120%, y: 120%)[\[] h \( d_y \) R divides X_u \( x \) = Y_t \( y \) = 1 #scale(x: 120%, y: 120%)[\]] \, #h(2em) c \( q \) = min { 1 \, max { 1 \/ 2 \, q } } . $ <eq:atom-dense-denominator>]

The number $q_y$ is the deterministic conditional mean at the indicated pair. The second raw signal carries the $Y_t$ membership mask. In addition, $q_y = 0$ if $d_y lt.eq 1 \/ 4$. The true preparatory table on the broad terminal domain $Y_a$ is the unnormalized value $h \( d_y \) R$. It uses only the first raw signal. Its conditional mean on the narrower slice is exactly the $q_y$ in Equation (5.10). The usage rate $t$ is part of the fixed task tuple: changing the slice on which this mean is taken would in general change the denominator. The broad preparatory domain and the narrower normalization slice must therefore be retained as separate parts of the interface.

#thm([Lemma 5.1.])[
  (Dense atom identity).  #emph[For sufficiently large fixed $K$, the table 
#[#set math.equation(numbering: n => "(5.11)")
 $ cal(B)_a \( x \, y \) = upright(bold(1))_({ Y_t \( y \) = 1 }) frac(k_a \( d_y \) R, c \( q_y \)) $ <eq:atom-dense-table>]

 on retained starts has bounded values and row support. On the slice $X_u \( x \) = Y_t \( y \) = 1$ its conditional expectation times $a$ equals $G \( x \, y \) omega_k \( G \( x \, y \) \)$. The same assertion holds for $cal(B)_a^(\( j \))$ with the routing fraction included. Apart from its start membership, its true value uses only the terminal channel.]
] <lem:atom-dense>

#proof[
  The row gate can fail to be full only if at least $K$ sampled columns have $G \( x \, z \) \/ a > r$, where $r = \( 1 \/ 2 \) \/ 1000$ is fixed. There are at most $M_G \/ \( a r \)$ such deterministic columns. Conditional on $Y_t \( y \) = 1$, the specified column contributes at most one hit and each other column has $Y_a$-hit probability at most $C a$, by Lemma 4. Thus the expected count is at most $1 + C M_G \/ r$. Conditioning also on the independent source channel does not alter this bound. Markov’s inequality makes the failure probability at most $1 \/ 8$ by a sufficiently large $K$.
  Where $k_a \( d_y \) > 0$, we have $h \( d_y \) = 1$. Therefore $q_y = bb(E) \[ R divides Y_t \( y \) = 1 \] in \[ 7 \/ 8 \, 1 \]$ there, and the clipping does nothing. The conditional mean of Equation (5.11) is consequently $k_a \( d_y \)$. Outside that support both sides vanish. If a row output is positive, its first entry exceeds $1 \/ 2$ and its $K$th first rank is below $1 \/ 1000$. Hence there are at most $K - 1$ positive entries. Boundedness follows from the clipped denominator. The routed fraction is deterministic at truth and obeys the same argument. ◻
]

For products of a correction with a deterministic bin contribution, we will use the following bounds.

#thm([Lemma 5.2.])[
  (Bounds for a fine product contribution).  #emph[Let $C$ be the transition matrix at the current stage, and let $F$ be any finite pilot or actual correction there. If a matrix $A_b gt.eq 0$ on the same vertex set satisfies $A_b upright(bold(1)) lt.eq upright(bold(1))$ and $A_b \( x \, y \) lt.eq c_b b$ for some $b > 0$, then 
$ \( F A_b \) upright(bold(1)) lt.eq k_(*) upright(bold(1)) \, #h(2em) \( F A_b \) \( x \, y \) lt.eq k_(*) c_b b . $

 If also $A_b lt.eq C$, then $F A_b lt.eq F C$. These estimates have constants independent of the bin scale $b$.]
] <lem:hier-bin-products>

#proof[
  Use $F upright(bold(1)) lt.eq k_(*) upright(bold(1))$ from Lemma 6: $\( F A_b \) upright(bold(1)) lt.eq F upright(bold(1))$, and $\( F A_b \) \( x \, y \) lt.eq c_b b sum_z F \( x \, z \)$. The last assertion follows by multiplying $A_b lt.eq C$ on the left by the nonnegative matrix $F$. ◻
]

=== 5.3 Corrections with an incoming gate <corrections-with-an-incoming-gate>

Corrections also need a bound on incoming degree. Their deterministic column-support bound permits an additional incoming gate while keeping the probability that both gates are full bounded away from zero.

Consider $F = f Q \( G \/ f \) g_0 \( y \)$ and put $a = f$, $theta.alt = theta_1$. Fix $B_Q > max { K_G \, theta_2 }$ and define the atom cutoff

$ Q_(upright("at")) \( d \) = Q #scale(x: 120%, y: 120%)[\(] "clip"_(\[ 0 \, B_Q \]) \( d \) #scale(x: 120%, y: 120%)[\)] . $

It is bounded, has a Lipschitz $s$th root on the real line, and agrees with $Q \( d \)$ for every true argument $d = G \( x \, y \) \/ f$. Its extension to negative arguments is zero. The exact hierarchy continues to use the uncapped $Q$. Let $R = R_(theta_1) \( rho_x \)$, $h = h_(theta_1)$, and $I = I_(theta_1)$ be the functions in Equation (5.5), where the true row rank is $rho_x = "rk"_K { G \( x \, z \) \/ f : Y_f \( z \) = 1 }$. On a true or computed raw table, form $I \( x \, y \)$ from that table’s own row entry and own rank. With $chi_(1 \/ 4 \, 1 \/ 2)$ as above, define

#[#set math.equation(numbering: n => "(5.12)")
 $ T_y = 1 - chi_(1 \/ 4 \, 1 \/ 2) ("rk"_(K_c) { I \( x \, y \) : X_u \( x \) = 1 }) . $ <eq:atom-incoming-gate>]

Thus $T_y = 1$ through rank $1 \/ 4$ and $T_y = 0$ from rank $1 \/ 2$. This rank is taken over the fixed retained source set before any incoming port filtering; there is no gate-dependent change of its index set. The true correction preparation is $h \( d_y \) R T_y$ on $Y_a$. Define its conditional mean by

#[#set math.equation(numbering: n => "(5.13)")
 $ q_y = bb(E) #scale(x: 120%, y: 120%)[\[] h \( d_y \) R T_y divides X_u \( x \) = Y_t \( y \) = 1 #scale(x: 120%, y: 120%)[\]] . $ <eq:atom-correction-denominator>]

The number $q_y$ is deterministic; as before, its second raw signal carries the $Y_t$ membership mask. Define the normalized true correction using the clipped expression everywhere:

#[#set math.equation(numbering: n => "(5.14)")
 $ cal(F) \( x \, y \) = upright(bold(1))_({ Y_t \( y \) = 1 }) frac(Q_(upright("at")) \( d_y \) R T_y, c \( q_y \)) thin g_0 \( y \) . $ <eq:atom-correction-table>]

Here $q_y = 0$ whenever $d_y lt.eq theta_1 \/ 2$. Thus both kinds of second signal are supported above a fixed positive first-signal threshold. Choose $zeta lt.eq 10^(- 6) min { theta_1 \, delta_0 \, 1 \/ 2 }$, decreasing it later if a fixed compression margin requires this. The second signals are then uniformly tiny on the first-signal threshold scale.

#thm([Lemma 5.3.])[
  (Correction atom identity, including zero multipliers).  #emph[For sufficiently large fixed $K$ and then $K_c$, the conditional mean of $f cal(F) \( x \, y \)$ on $X_u \( x \) = Y_t \( y \) = 1$ is exactly $F \( x \, y \)$. On a true position with $Q \( d_y \) > 0$ and $g_0 \( y \) > 0$, 
#[#set math.equation(numbering: n => "(5.15)")
 $ q_y = alpha \( x \, y \) := bb(E) \[ R T_y divides X_u \( x \) = Y_t \( y \) = 1 \] gt.eq 3 \/ 4 . $ <eq:atom-alpha-bound>]

 No lower bound on $q_y$ or $alpha \( x \, y \)$ is required when $g_0 \( y \) = 0$. The true gates and normalization use only the two role channels $X \, Y$; $g_0$ is deterministic.]
] <lem:atom-correction>

#proof[
  The row count argument in Lemma 12, with the correction thresholds, gives $Pr \( R eq.not 1 divides upright("the two hits") \) lt.eq 1 \/ 8$. If $g_0 \( y \) > 0$, every source with $I \( x' \, y \) > 0$ belongs to the deterministic set in Equation (5.2). Conditional on $X_u \( x \) = 1$, the number of sampled members of that set has expectation at most
  $ 1 + C u R_(*) \/ f lt.eq 1 + C R_(*) . $
  The bound remains valid after conditioning on the independent terminal hit; it ignores the auxiliary row gate and therefore needs no additional independence between rows. If fewer than $K_c$ such sources are sampled, the $K_c$th auxiliary rank is zero and $T_y = 1$. Choose $K_c gt.eq 8 \( 1 + C R_(*) \)$ to make $Pr \( T_y eq.not 1 divides upright("the two hits") \) lt.eq 1 \/ 8$. The union bound, without independence of the gates, gives $bb(E) \[ R T_y divides upright("the two hits") \] gt.eq 3 \/ 4$.
  Since $h \( d_y \) = 1$ on $Q$’s support, Equation (5.15) holds and $c \( q_y \) = q_y$ there whenever $g_0 \( y \) > 0$. The claimed conditional identity follows by division by this exact conditional mean. If $Q \( d_y \) = 0$ or $g_0 \( y \) = 0$, both sides of the identity are zero. In the latter case the pre-incoming quantity $Q_(upright("at")) \( d_y \) R \/ c \( q_y \)$ is still a well-defined bounded comparison target, even if the unclipped mean vanishes. ◻
]

=== 5.4 Detector scores <detector-scores>

The unnormalized detector table is

#[#set math.equation(numbering: n => "(5.16)")
 $ cal(S)_i \( x \, y \) = phi.alt \( G_i \( x \, y \) \/ f \) R_(delta_0) #h(-0.16667em) ("rk"_K { G_i \( x \, w \) \/ f : Y_f \( w \) = 1 }) quad upright("on ") X_f \( x \) = Y_f \( y \) = 1 . $ <eq:atom-detector-table>]

Its column trial is the $J$th largest such score over retained starts. By the identical cutoff choice, its conditional mean given $Y_f \( y \) = 1$ is exactly $U_i \( y \)$ from Equation (4.11). The trial is an inverse rank access to a row-bounded table and does not require an incoming degree bound.

=== 5.5 Actual ports and estimated assembly <actual-ports-and-estimated-assembly>

The conditional-mean identities now give the true contributions. A product estimate will query a correction at $\( x \, z \)$ and then a bin at $\( z \, y \)$. Bounded outgoing degree limits the possible midpoints; bounded incoming degree is needed when errors at the new source $z$ are summed over old sources $x$. We therefore specify access relations as well as nonzero table supports. The access relations may contain entries of weight zero.

Passing through one copy projection is partitioned by its fixed source and destination symbols. Within each part the inherited hash argument appends that symbol before the inherited suffix. Lemma 4 then gives the same distribution as the unpadded channel. The task tuple records these fixed symbols and suffixes. By definition, neither a right factor’s task parameters nor a column vector’s task parameters retain an earlier source address. The environment supplied to the table is common to all its entries. The vertices $x \, y$ are arguments of that table, rather than additional parameters. Thus two paths that discover the same entry in that environment query the same value; the path used to discover it is not part of its mathematical definition.

We will apply these row functions to arrays represented by a finite list of exceptional values and one common value at every omitted endpoint. Call that common value the #emph[default]. Adjoin arbitrarily many dummy coordinates with the same default, and include them in every rank; they are never matrix entries or ports. For the true row arrays, dummy values are zero. Section 8 constructs the finite-list representations. The elementary rank convention below lets us prove support and access bounds before choosing that construction.

#prodef([Remark 5.4.])[
  (Ranks of arrays with a common default).  Suppose a row array equals a common default outside a finite list, and arbitrarily many dummy coordinates have that same default. Its $k$th rank can be computed from the listed coordinates and $k$ copies of the default, with the stipulated zero padding. Indeed, every omitted coordinate merely supplies another copy of a value already available with multiplicity at least $k$. Additional listed real coordinates equal to the default therefore do not change the rank. The same observation applies to a rank of entry sizes when each omitted entry has the same default vector.
  This is an equality of ranks for one prescribed full array. The dummy coordinates are never matrix entries or ports. A common componentwise clamp of the entries and their default preserves this representation: an omitted position still equals the clamped default. No assertion that different calculations select identical lists or ports is needed.
] <rem:atom-finite-ranks>

#thm([Lemma 5.5.])[
  (Support margins and exposed row classes).  #emph[Suppose a bounded nonnegative main function $k \( v \)$ vanishes for $v lt.eq theta.alt$. Its product $k \( v \) R_theta.alt \( rho \)$ and the preparatory product $h_theta.alt \( v \) R_theta.alt \( rho \)$ have at most $K - 1$ nonzero real entries in a row. They admit a common exposed class $A$, of at most $K - 1$ real entries, containing their supports and satisfying $I_theta.alt = 1$ throughout $A$. These assertions hold for arbitrary real raw estimates, without a sign or accuracy hypothesis.]
  #emph[The auxiliary score $I_theta.alt$ also has at most $K - 1$ nonzero real entries and has an exposed row class with a bounded-support smooth witness equal to one on that class.]
] <lem:atom-margins>

#proof[
  For the main and preparatory products a nonzero entry has $v > theta.alt \/ 2$ and $rho < theta.alt \/ 500$. There cannot be $K$ such entries, since then the $K$th rank would exceed $theta.alt \/ 2$.
  For an explicit class choose consistently computed approximations $tilde(v) \, tilde(rho)$ with absolute errors at most $eta = theta.alt \/ 10000$, and set
  #[#set math.equation(numbering: n => "(5.17)")
   $ A = { y : Y_a \( y \) = 1 \, quad tilde(v)_y > 3 theta.alt \/ 8 \, quad tilde(rho) < theta.alt \/ 200 } . $ <eq:atom-exposed-class>]
  Every positive main or preparatory entry belongs to $A$. An entry in $A$ satisfies $v_y > \( 3 \/ 8 - 1 \/ 10000 \) theta.alt > theta.alt \/ 4$ and $rho < \( 1 \/ 200 + 1 \/ 10000 \) theta.alt < theta.alt \/ 100$, so its witness $I_theta.alt$ equals one. Its entry threshold exceeds its rank threshold, proving $\| A \| lt.eq K - 1$.
  The support of $I_theta.alt$ requires $v > theta.alt \/ 8$ and $rho < theta.alt \/ 50$, again giving the same row bound. To access this score itself, the class
  $ A_I = { y : Y_a \( y \) = 1 \, quad tilde(v)_y > theta.alt \/ 10 \, quad tilde(rho) < theta.alt \/ 40 } $
  contains its support and has at most $K - 1$ entries. A smooth unit witness on $A_I$ is
  $ J_theta.alt \( v \, rho \) = chi_(82 theta.alt \/ 1000 \, thin 90 theta.alt \/ 1000) \( v \) #scale(x: 120%, y: 120%)[\(] 1 - chi_(26 theta.alt \/ 1000 \, thin 27 theta.alt \/ 1000) \( rho \) #scale(x: 120%, y: 120%)[\)] . $
  The approximation margins imply $A_I subset.eq { J_theta.alt = 1 }$. Moreover $82 \/ 1000 > 3 \( 27 \/ 1000 \)$, so this witness also has bounded row support and the required entry versus rank separation. The witness is an analytical output; its support need not be broadened recursively.
  These arguments use the rank of the prescribed entire raw array. In particular, if at least $K$ dummy positions have a common virtual default $beta$, then $rho gt.eq beta$. A real position still equal to that default cannot meet either exposed class: the required lower bound on $v = beta$ exceeds the required upper bound on $rho$. Thus omitted default positions do not create unlisted ports. ◻
]

The fixed-accuracy approximations in this lemma are part of the access interface, not tests for equality of exact reals. The implementation must use the same approximation and tie conventions whenever it queries the same table. The strict margins prove correctness for every such choice. Auxiliary-only access classes require a row bound but no incoming bound. In particular, different computed versions may expose different zero-weight entries. The assertions are applied to each version’s own final raw array and repeatable approximation convention; they do not require those classes to coincide. Accuracy of the raw array is used later in the error estimates, not in this support argument.

An estimated table applies the preceding bounded row functions to its #emph[final] raw row arrays. In a normalized task its second input is a computed value approximating $zeta upright(bold(1))_({ Y_t \( y \) = 1 }) q_y$: the calculator divides that input by $zeta$ and applies $c$. It does not launch another averaging operation after selecting an endpoint. Its auxiliary incoming scores are formed from its own final first-signal rows, and its incoming gate is Equation (5.12) for those scores. A preparatory task is an earlier, separate task; its raw arrays, scores, and gates are its own, and its target is the unnormalized preparatory table specified above. Corrections additionally multiply by a clipped vector estimate of the prescribed $U$-cutoff $g_0 \( y \)$, queried with a common broad $Y_f$-domain tuple. The unnormalized preparations $h R$ and $h R T$ remain on their broad $Y_a$ domain; their usage parameter $t$ specifies the conditional slice on which they are averaged. The resulting second raw signal and the normalized main output carry the $Y_t$ mask. Dense bins and their preparations and detector tables have no additional incoming multiplier. Because $c$ takes values in $\[ 1 \/ 2 \, 1 \]$, every such pre-incoming row function has a globally Lipschitz $s$th root as a function of its saturated first entry, first rank, and scaled second entry. The constants may depend on the fixed $zeta$, but not on the stage, rates, or budget.

For clarity, Table 1 records the thresholds needed by the compression argument. For a pre-incoming row function $H$, its entry factor vanishes through $e_H$, and its row gate vanishes from rank $g_H$ onward. Every listed pair satisfies $3 g_H < e_H$, including the broadest witness, for which $82 theta.alt \/ 1000 - 3 \( 27 theta.alt \/ 1000 \) = theta.alt \/ 1000 > 0$. All gates are full in a neighborhood of rank zero. The correction preparation in this table is its pre-incoming factor $h R$; its incoming gate is assembled afterward.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Pre-incoming row function
], table.cell(rowspan: 1, colspan: 1)[$e_H$
], table.cell(rowspan: 1, colspan: 1)[$g_H$
]),
  table.cell(rowspan: 1, colspan: 1)[Dense bin, including routed bins
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 1000$
],
  table.cell(rowspan: 1, colspan: 1)[Dense preparation $h R$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 4$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 1000$
],
  table.cell(rowspan: 1, colspan: 1)[Correction clipped-ratio function
], table.cell(rowspan: 1, colspan: 1)[$theta_1$
], table.cell(rowspan: 1, colspan: 1)[$theta_1 \/ 500$
],
  table.cell(rowspan: 1, colspan: 1)[Correction preparation $h R$
], table.cell(rowspan: 1, colspan: 1)[$theta_1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$theta_1 \/ 500$
],
  table.cell(rowspan: 1, colspan: 1)[Detector score
], table.cell(rowspan: 1, colspan: 1)[$delta_0$
], table.cell(rowspan: 1, colspan: 1)[$delta_0 \/ 500$
],
  table.cell(rowspan: 1, colspan: 1)[Auxiliary score $I_theta.alt$
], table.cell(rowspan: 1, colspan: 1)[$theta.alt \/ 8$
], table.cell(rowspan: 1, colspan: 1)[$theta.alt \/ 50$
],
  table.cell(rowspan: 1, colspan: 1)[Witness $J_theta.alt$
], table.cell(rowspan: 1, colspan: 1)[$82 theta.alt \/ 1000$
], table.cell(rowspan: 1, colspan: 1)[$27 theta.alt \/ 1000$
],
)
]],
  caption: [Table 1: Entry and row-gate thresholds. The entry factor vanishes through $e_H$, and the row gate vanishes from rank $g_H$ onward. Here $theta.alt in { 1 \/ 2 \, theta_1 \, delta_0 }$ as appropriate. ],
)

The bounded first-entry ranges and gate transition intervals already specified give fixed sensitivity ranges for these functions. If $w$ is a computed second raw entry, its only use is through $c \( w \/ zeta \)$; clipping $w$ to $\[ zeta \/ 2 \, zeta \]$ leaves this quantity unchanged. Its denominator stays in $\[ 1 \/ 2 \, 1 \]$ even for negative or inaccurate inputs. Usage masks only remove entries and do not change any of these support or continuity bounds.

#thm([Lemma 5.6.])[
  (Port contract).  #emph[All main and preparatory row tables, auxiliary scores, and the smooth witnesses just constructed have bounded values and bounded row support. Every row access class used for a main or preparatory output, or for access to its auxiliary score, has bounded size and a smooth witness equal to one on every exposed entry, including exposed entries of weight zero. A witness itself is needed as an analytical row function, without an additional requirement to expose its support through a further witness. For a correction or its preparatory table let $A$ be its pre-incoming class from Equation (5.17). Retain an exposed entry $\( x \, y \) in A$ only when 
#[#set math.equation(numbering: n => "(5.18)")
 $ \# { x' : X_u \( x' \) = 1 \, med \( x' \, y \) in A } lt.eq K_c . $ <eq:atom-port-cap>]

 This deletion preserves all table values and gives at most $K - 1$ outgoing and at most $K_c$ incoming exposed entries.]
  #emph[These assertions hold separately for every computed version, provided that its values, ranks, scores, and access classes use the same final raw arrays and common task tuple. Access ports denote distinct entries: the implementation must expose each pair at most once and pair its incoming and outgoing ports consistently. Access to auxiliary scores alone has only the asserted row bound.]
] <lem:atom-ports>

#proof[
  The row and witness assertions are Lemma 16; clipping and multiplication by bounded factors do not enlarge supports. If a column has more than $K_c$ entries in $A$, its auxiliary score is one at all those entries, so its $K_c$th auxiliary rank is one. Equation (5.12) makes $T_y = 0$ there. Consequently every value deleted by Equation (5.18) was already zero. The surviving relation has the stated two degree bounds even when zero weights are retained. The argument applies to arbitrary raw arrays, so it applies equally to the estimated and true versions.
  The cap removes every precursor port at an overfull column; it does not choose $K_c$ of them. It is applied even when the particular entry has weight zero. Every surviving port still lies in $A$, so its pre-incoming witness $I$ equals one regardless of a zero usage mask, incoming gate, or column multiplier. The broader auxiliary class $A_I$ is used to enumerate scores for an incoming rank. It is not the capped correction relation used as a paired left factor in a product.
  The classes are relations on row and column IDs, rather than multisets of paths. Choosing one port per relation element gives the stated combinatorial interface. Establishing its single-address enumeration and port pairing within the space bound is an implementation obligation; the degree argument does not itself grant random access to both IDs. ◻
]

For later reference, the full interface supplied here is the following. Each task has fixed common parameters; first ranks include the prescribed dummy coordinates; exposed ports are real distinct entries and lie in a unit witness; sparse main and preparatory ports obey the actual incoming cap; and values, auxiliary scores, incoming ranks, and column multipliers are all queried at the same supplied environment and tuple. The path by which an entry is discovered must not change that environment or tuple for its assembly. Only completed earlier output types, or stated fixed local functions and aggregations of those types, may be used as raw inputs of a later task. No prefix still waiting for assembly is such an output. These requirements distinguish finite-support analytical bounds from the access properties used in the subsequent implementation. Completing a raw array here means defining its entries from the allowed earlier outputs, rather than storing the whole array at once. Its auxiliary scores and precursor classes are defined before its incoming gate and cap, so their definitions do not call that same gate or cap.

These contracts apply directly to each computed array after compression and clamping. The later comparison in Lemma 37 preserves relevant row-function values under its stated common-increment hypothesis. It need not preserve the finite-accuracy access descriptors of two calculations. Each calculation uses its own consistent classes, and Lemma 17 gives their support and degree bounds separately.

=== 5.6 Integrated losses and assembly bounds <integrated-losses-and-assembly-bounds>

It remains to control how errors in the row functions, incoming scores, and detector vectors affect an assembled table. The incoming degree bound lets us sum these errors by columns without multiplying by the number of possible source vertices.

For a real row array $Z$ define

#[#set math.equation(numbering: n => "(5.19)")
 $ parallel Z parallel_(u \, a \; s)^s = 1 / N bb(E)_sigma sum_x frac(X_u \( x \), u) sum_(y : Y_a \( y \) = 1) \| Z \( x \, y \) \|^s \, #h(2em) frak(d)_(u \, a) \( H \, H' \) = parallel H^(1 \/ s) - \( H' \)^(1 \/ s) parallel_(u \, a \; s) . $ <eq:atom-row-norm>]

Here $sigma$ has the product law of the rank channels and independent auxiliary bits specified in Section 3. All table values are extended by zero outside their membership domain. The denominator $u$ is the nominal rate, and actual-rate comparability in Lemma 4 absorbs the resulting absolute constants. For a vertex array on a channel with rate $u$, write

#[#set math.equation(numbering: n => "(5.20)")
 $ parallel v parallel_(u \; s)^s = 1 / N bb(E)_sigma sum_x frac(X_u \( x \), u) \| v \( x \) \|^s \; $ <eq:atom-vertex-norm>]

the indicated role channel replaces $X$ when necessary. These are also the comparison norms for two sample-dependent versions. All required pre-incoming functions and smooth support witnesses are included among the row outputs whose discrepancies are to be bounded.

Bounded row support and range imply a uniform bound on these row-output norms, since $\| V_l \| lt.eq N$ and $bb(E) X_u \/ u = O \( 1 \)$. Bounded vertex arrays have the analogous uniform bound. Ordinary error is controlled by root error on bounded nonnegative outputs, since

#[#set math.equation(numbering: n => "(5.21)")
 $ \| z - w \| lt.eq s C^(\( s - 1 \) \/ s) \| z^(1 \/ s) - w^(1 \/ s) \| quad \( 0 lt.eq z \, w lt.eq C \) . $ <eq:atom-ordinary-from-root>]

#thm([Lemma 5.7.])[
  (Assembly comparisons).  #emph[Compare two versions with the same environment, rates, and task tuple. For a sparse normalized output write $H = P T g$ and $H' = P' T' g'$, where $P \, P'$ are the pre-incoming clipped-ratio row functions (including their usage masks), $I \, I'$ are their auxiliary scores, and $g \, g'$ are their column multipliers. If $g \, g'$ are the prescribed smooth cutoffs of bounded vertex arrays $U_i \, U'_i$, then 
#[#set math.equation(numbering: n => "(5.22)")
 $ frak(d)_(u \, f) \( H \, H' \)^s lt.eq C frak(d)_(u \, f) \( P \, P' \)^s + C frak(d)_(u \, f) \( I \, I' \)^s + C f / u sum_i parallel U_i - U'_i parallel_(f \; s)^s . $ <eq:atom-assembly-bound>]

 For a sparse preparation omit the last term and use its unnormalized pre-incoming row function. The corresponding dense and detector row functions have no incoming or column-multiplier assembly cost.]
  #emph[If $V_y \, V'_y$ are the detector trials formed from $cal(S)_i \, cal(S)'_i$ by their column order statistic, then 
#[#set math.equation(numbering: n => "(5.23)")
 $ parallel V - V' parallel_(f \; s)^s lt.eq C frak(d)_(f \, f) \( cal(S)_i \, cal(S)'_i \)^s . $ <eq:atom-detector-comparison>]

]
] <lem:atom-assembly>

#proof[
  All factors are bounded. On the union $E$ of the two final nonzero supports, the triangle inequality for the products of $s$th roots gives
  $ \| H^(1 \/ s) - \( H' \)^(1 \/ s) \| lt.eq C \| P^(1 \/ s) - \( P' \)^(1 \/ s) \| + C \| T^(1 \/ s) - \( T' \)^(1 \/ s) \| + C \| g^(1 \/ s) - \( g' \)^(1 \/ s) \| . $
  Outside $E$ the left side is zero. The pre-incoming discrepancy may be charged on its entire row domain; it needs no incoming cap. Each column has at most $2 K_c$ edges in $E$, by Lemma 17. By Equation (5.4), the root-Lipschitz incoming cutoff, and Equation (5.21),
  $ \| T_y^(1 \/ s) - \( T'_y \)^(1 \/ s) \|^s lt.eq C sup_(x : X_u \( x \) = 1) \| I \( x \, y \)^(1 \/ s) - I' \( x \, y \)^(1 \/ s) \|^s . $
  Consequently its integrated contribution is at most
  $ frac(C, N u) bb(E) sum_(y : Y_f \( y \) = 1) sum_(x : X_u \( x \) = 1) \| I \( x \, y \)^(1 \/ s) - I' \( x \, y \)^(1 \/ s) \|^s \, $
  which is $C frak(d)_(u \, f) \( I \, I' \)^s$.
  The maximum over a fixed number of $U_i$ values is Lipschitz, and the multiplier cutoff has Lipschitz root. Thus the last discrepancy is bounded in $s$th power by $C sum_i \| U_i \( y \) - U'_i \( y \) \|^s$. Summing over $E$ costs at most $2 K_c \/ u$ per retained column. The vertex metric has weight $1 \/ f$ instead, giving precisely the factor $f \/ u$ in Equation (5.22). All columns in this comparison are in the common $Y_f$ domain, including those whose final values carry a narrower usage mask. The common-tuple condition ensures that the vertex discrepancy at $y$ is the same quantity for every old start. Explicitly, if $m_E \( y \)$ counts the edges of $E$ entering $y$, then for each $i$ its contribution obeys
  $ frac(1, N u) bb(E) sum_(y : Y_f \( y \) = 1) m_E \( y \) \| U_i \( y \) - U'_i \( y \) \|^s lt.eq 2 K_c f / u parallel U_i - U'_i parallel_(f \; s)^s . $
  This is the column-counting step; it uses no independence between the two row tables and the vector estimates.
  For a detector trial, Equation (5.4) bounds the trial discrepancy by the supremum of the input score discrepancies over retained starts. Its $s$th power is at most the sum of their $s$th powers. The factor $Y_f \( y \) \/ f$ in the vertex metric is exactly the factor obtained by reversing the two sums in the row metric with $u = a = f$. Equation (5.21) gives Equation (5.23). ◻
]

The required task types are therefore the dense bins $cal(B)_b$ of $C_l$, the routed bins $cal(B)_b^(\( j \))$ of $D_l$, detector scores $cal(S)_i$, and the pilot and actual correction tables $cal(F)$, together with one earlier unnormalized preparation for each normalized type. Their true conditional-mean identities are Lemmas 12 and 14. Their computed versions use the same bounded row functions and the assembly contract above. The next sections bound their discrepancies through the additive schedule and implement their accesses without storing two unrestricted vertex addresses.

== 6 Conditional averaging in the shared environment <sec:averaging>

The atom identities use conditional expectations on slices that retain specified source and terminal vertices. To approximate these expectations, we need a walk that mixes on each slice. We construct such a walk using the channels of Section 3, then express its steps by transformations that can be specified before the retained identifiers are known. Validation tests those identifiers when their vertices are visited.

The identifiers are fixed when the conditional space is defined. We condition on one retained identifier per conditioned channel; additional independent bit coordinates may be varied or frozen as specified below.

The #emph[full environment law] already includes the frame restriction on each channel. A conditional slice additionally imposes the indicated retention events and fixes any designated frozen bits. Its averaging operator and $L_s$ norms use the normalized probability law on that slice.

The only external group-theoretic inputs are property (T) of $upright("SL")_H \( bb(Z) \)$ for $H gt.eq 3$ and relative property (T) of

$ \( upright("SL")_2 \( bb(Z) \) times.l bb(Z)^2 \, bb(Z)^2 \) . $

We use Shalom’s quantitative statements: #cite(label("Shalom1999")) Theorem 2.6, p. 156 for the linear group and #cite(label("Shalom1999")) Theorem 2.1, p. 152 for the relative property. We derive the affine finite-action gap and the conditional sampler from these inputs below.

#thm([Lemma 6.1.])[
  (A uniform affine spectral gap).  #emph[Let $G_H = upright("SL")_H \( bb(Z) \) times.l bb(Z)^H$, with fixed $H gt.eq 3$. There is a fixed finite symmetric generating multiset and a lazy rational random walk on it whose action on every finite transitive $G_H$-set has a spectral gap bounded below by a positive constant depending only on $H$.]
] <lem:env-affine>

#proof[
  Let $cal(S)$ consist of the elementary matrices with a single $plus.minus 1$ off the diagonal, acting linearly, and the translations by $plus.minus e_i$, where $e_i$ are the standard basis vectors of $bb(Z)^H$. This is a fixed finite symmetric generating set of $G_H$. For a unitary representation $rho$ and a vector $xi$, put
  $ delta = max_(g in cal(S)) parallel rho \( g \) xi - xi parallel . $
  We first bound the distance from $xi$ to the invariant subspace.
  For each coordinate pair ${ i \, j }$, embed the two-dimensional affine group on those coordinates, and let $P_(i j)$ be the orthogonal projection onto the subspace fixed by its translations. This subspace and its orthogonal complement are invariant under that pair group, because its translation subgroup is normal. The eight generators in #cite(label("Shalom1999")) Theorem 2.1, p. 152 belong to $cal(S)$. Applying their relative Kazhdan constant $1 \/ 10$ on the orthogonal complement gives
  $ parallel xi - P_(i j) xi parallel lt.eq 10 delta . $
  This is the projection argument in the proof of #cite(label("Shalom1999")) Corollary 2.3, p. 154.
  The projections $P_(i j)$ commute: they are limits of averages of commuting coordinate translations. Their product $P_(upright("tr"))$ projects onto the subspace fixed by all translations. With $q = binom(H, 2)$, telescoping the product gives
  $ parallel xi - P_(upright("tr")) xi parallel lt.eq sum_(i < j) parallel xi - P_(i j) xi parallel lt.eq 10 q delta . $
  Since the full translation subgroup is normal, $P_(upright("tr"))$ commutes with every $rho \( g \)$. Its range carries a representation of $G_H \/ bb(Z)^H = upright("SL")_H \( bb(Z) \)$. Let $P_(upright("inv"))$ project onto the full $G_H$-invariant subspace, and let $kappa_H > 0$ be the Kazhdan constant for the elementary generators from #cite(label("Shalom1999")) Theorem 2.6, p. 156; adjoining inverse generators preserves the bound. Applying that constant on the range of $P_(upright("tr"))$ gives
  $ parallel P_(upright("tr")) xi - P_(upright("inv")) xi parallel lt.eq kappa_H^(- 1) delta \, #h(2em) parallel xi - P_(upright("inv")) xi parallel lt.eq C_H delta \, quad C_H = 10 q + kappa_H^(- 1) . $
  Thus the same generating set controls distance to invariants in every unitary representation, with a constant depending only on $H$.
  Now let $rho$ be the permutation representation of a finite transitive action, with the uniform probability measure, and put $m = \| cal(S) \|$. The rational Markov operator
  $ K_H = 1 / 2 I + frac(1, 2 m) sum_(g in cal(S)) rho \( g \) $
  is self-adjoint, and its spectrum lies in $\[ 0 \, 1 \]$. The invariant functions are exactly the constants. For $f$ orthogonal to constants, the preceding inequality and the Dirichlet identity give
  $ chevron.l f \, \( I - K_H \) f chevron.r = frac(1, 4 m) sum_(g in cal(S)) parallel rho \( g \) f - f parallel_2^2 gt.eq frac(1, 4 m C_H^2) parallel f parallel_2^2 . $
  This proves the uniform spectral gap. ◻
]

#thm([Lemma 6.2.])[
  (Conditional averaging).  #emph[Consider the fixed product of rank channels, conditioned on retention of one specified identifier per conditioned channel. Include any designated set of independent uniform bits, with length padded to a multiple of $H$, and freeze any remaining independent bits. There is a rational Markov averaging operator $K$ on this conditional space such that its stationary distribution is the indicated uniform conditional law and, for each fixed $2 lt.eq s < oo$, 
$ parallel K^d - Pi parallel_(L_s arrow.r L_s) lt.eq C_s 2^(- c_s d) #h(2em) \( d gt.eq 0 \) . $

 Here $Pi$ is conditional expectation over the variables being averaged. The constants are independent of the field size, retention side lengths, bit lengths, indicated identifiers, and frozen bits.]
] <lem:env-gap>

#proof[
  On a channel conditioned at $y$ with side $L$, use coordinates $\( F \, w \)$, where $F$ is its field frame and $w = A v \( y \) in { 0 \, dots.h \, L - 1 }^H$. The constant column is uniquely determined by $F \, w \, y$. As observed above, $F$ is uniform over frames and $w$ is independent uniform in its box. Identify this box with $\( bb(Z) \/ L bb(Z) \)^H$. For $\( M \, c \) in G_H$ act by
  $ \( F \, w \) mapsto \( M F \, M w + c \) \, $
  using reduction modulo $P$ on the first coordinate and modulo $L$ on the second.
  This action is transitive. Reduction of $upright("SL")_H \( bb(Z) \)$ contains the elementary generators of $upright("SL")_H \( bb(F)_P \)$. That finite group acts transitively on ordered frames of length $r < H$: extend either frame to a basis and adjust a complementary column to make the change-of-basis determinant one. Once the frame has been moved, a translation adjusts $w$ to any specified value. The two moduli need not agree. On an unconditioned channel use a public identifier and side $P$, giving the same description.
  If the free bit length is $H q$, identify its strings with $\( bb(Z) \/ 2^q bb(Z) \)^H$ and use the affine action on that coordinate alone. It is transitive. All currently free bit blocks can be concatenated into this one component; frozen bits are not transformed. There are a bounded number of components. Apply the lazy walk from Lemma 19 to a uniformly selected component. If there are $J_(upright("comp"))$ components and the single-component gap is at least $gamma_H$, the product walk has gap at least $gamma_H \/ J_(upright("comp"))$. Here $J_(upright("comp"))$ is bounded independently of the field and bit lengths. The walk preserves the desired product measure.
  Writing its gap as $gamma > 0$, we have $parallel K^d - Pi parallel_(2 arrow.r 2) lt.eq \( 1 - gamma \)^d$ and $parallel K^d - Pi parallel_(oo arrow.r oo) lt.eq 2$. The diagonal case of the Riesz–Thorin interpolation theorem, already covered by Riesz #cite(label("Riesz1927")) Theorems II and II$'$, p. 472, gives
  $ parallel K^d - Pi parallel_(s arrow.r s) lt.eq 2^(1 - 2 \/ s) \( 1 - gamma \)^(2 d \/ s) \, $
  which has the required form. For Thorin’s complex extension, see #cite(label("Thorin1948")) Introduction, §0.1; Russian translation, pp. 43–45. ◻
]

=== 6.1 Generating paths without retaining their endpoints <generating-paths-without-retaining-their-endpoints>

The coordinates in the preceding proof used the indicated identifier. The next lemma is the implementation form of the same averaging, and also supplies changes of variables for later error estimates.

#thm([Lemma 6.3.])[
  (Validated walk variants).  #emph[A length-$d$ word in the walk of Lemma 20 can be expanded into a bounded-alphabet family of variants described by $O \( d \)$ bits such that:]
  + #emph[each fixed variant acts bijectively and measure-preservingly on the full environment before any endpoint tests;]
  + #emph[its transformation is independent of the indicated identifiers;]
  + #emph[for each walk word and each environment in the required conditional slice, exactly one variant passes the slice and wrap tests at the indicated identifiers, and this variant gives the conditional walk transformation;]
  + #emph[the sum of valid variants, each with the probability of its original walk word, is exactly the conditional average.]
  #emph[The tests can be performed when their indicated vertices are visited. In the admissible implementation range, field elements and identifiers have $O \( B \)$ bits, the total auxiliary bit string has $O \( B \)$ bits, and $d = O \( B \)$. In that range the transformations and tests use $O \( B \)$ shared scratch space, and the retained description of a variant uses $O \( d \)$ bits.]
] <lem:env-variants>

#proof[
  Consider a fixed affine generator $\( M \, c \)$ on a channel with retention side $L$. Enumerate the transformations
  #[#set math.equation(numbering: n => "(6.1)")
   $ A' = M A + \( c + L z \) e_1^(sans(T)) med \( mod med P \) \, $ <eq:env-wrap>]
  where $e_1$ selects the constant column and $z$ ranges over a fixed finite box of integer vectors. That box contains all possible wraps: for $w in { 0 \, dots.h \, L - 1 }^H$, every coordinate of $M w + c$ is bounded in absolute value by a fixed multiple of $L$ plus a fixed constant. Since $L gt.eq 1$ and the generators are fixed, one bound for $z$ works for every side length.
  Each transformation in Equation (6.1) is invertible. Left multiplication preserves the frame condition, and the added term changes only the constant column. It therefore preserves uniform measure on the full channel. It does not refer to the indicated identifier.
  At that identifier, let $w = A v \( y \)$ in its integer representatives. Check first that $w$ is in the retention box, and then that $M w + c + L z$ lies in the same box coordinatewise, using integer arithmetic before reduction modulo $P$. The unique valid wrap has coordinates $z_i = - floor.l \( M w + c \)_i \/ L floor.r$. For this vector the evaluation of $A'$ is the representative of the intended affine action modulo $L$. Applying these checks at every step gives the unique valid wrap sequence for a whole word.
  The construction applies separately to the bounded number of channels. On a channel of side $P$ the ordinary field reduction suffices; alternatively, the same wrap validation may be used at its public point. The free-bit torus has ordinary invertible affine operations and requires no unknown endpoint. Frozen bits remain fixed. Thus a word has only constantly many generator and wrap choices per step, giving the $O \( d \)$-bit description.
  For each word and initial environment in the slice, exactly one variant survives. Its weight must be the weight of that word. In particular, the sum is not divided by the number of guessed wraps. This proves the asserted exact identity. All matrices have fixed dimensions and $O \( B \)$-bit entries; evaluating a bounded-degree polynomial or a word’s individual steps needs $O \( B \)$ arithmetic scratch. A test depending on a vertex can be delayed until that vertex is current, with the required matrix state regenerated from the recorded transformations. Theorem 58 accounts for reversible restoration and the simultaneous space used when these operations are nested. ◻
]

#prodef([Remark 6.4.])[
  (Effective environment coordinates).  Conditional averaging is expressed in the channel and bit coordinates of the environment supplied to that invocation. A fixed variant from Lemma 21 is a measure-preserving change of variables on the full environment; its retention and wrap tests remain explicit masks. Thus free and frozen bits always refer to the supplied coordinates, which may differ from those before the change of variables.
] <rem:env-effective>

#prodef([Remark 6.5.])[
  Two distinct uses of the variants should be kept separate. For centered-noise estimates, one first recognizes the sum of valid variants as the conditional walk and applies Lemma 20. For crude bounds and changes of variables, each fixed variant is a measure-preserving bijection, and one may then pay for their $2^(O \( d \))$ number. Counting variants before a spectral estimate would needlessly weaken the useful contraction.
] <rem:env-averaging>

== 7 Additive estimation and conditional prefix bounds <sec:est>

The bounded stochastic tables of Section 5 represent the exact hierarchy through their conditional means. In this section, earlier estimates are input tables and vectors with those interfaces. We define their sampled raw prefixes and derive bounds under the corresponding child-error hypotheses. Two errors arise: the conditional mean can differ from the deterministic target, and a finite averaging walk leaves noise around that mean. We bound them separately.

These prefixes are intermediate arrays. Final row outputs result from applying the atom functions to completed, compressed rows; Section 9 completes the recursive definition, including its endpoint-grouping rule.

The scale and source-domain comparisons first determine the accuracy needed from each child. We then average differences between consecutive child budgets. Their conditional means telescope, while their small absolute norms allow finite conditional walks to suppress the noise. The resulting prefix estimates are the input to the compression analysis in Section 8. That section proves an error reserve under exact endpoint grouping; Section 9 constructs the comparison calculation to which the reserve will apply.

=== 7.1 Tasks and dependency order <tasks-and-dependency-order>

A row task specifies its input matrix, stage, iteration label, start rate $u$, end scale $a$, optional usage rate $t lt.eq a$, channel roles, and fixed padding suffixes. These parameters are common to its whole table. A vector task specifies the analogous vertex domain. Its argument is a vertex, rather than an additional parameter retained by another task. Each task has a nonnegative integer statistical budget $M$; $m$ will denote a child budget. These budgets are distinct from the numerical digit places introduced in Section 10. The ordinary and root discrepancy norms are defined in Equations (5.19) and (5.20). We always take $s = 8$.

The source weight $X_u \( x \) \/ u$ has bounded expectation, and the factor $1 \/ N$ normalizes the sum over source vertices. Endpoint sums remain explicit: bounded row supports or incoming degrees, as appropriate, will control them. A bound at one specified start consequently costs a factor $N$ in moment power; Lemma 71 makes and pays this conversion at the end of the proof.

Here is a dependency order, with only a fixed number of task types at each stage. First come the bin tasks for $C_l$. At each pilot step come its input-score task $cal(S)_i$, the detector vector $U_i$, and then the pilot correction task. Next come the actual correction tasks in iteration order, the routed bin tasks for $D_l$, and the reward update. Place the unnormalized preparation immediately before each normalized task of the same input. The raw first channels of both these tasks refer only to earlier inputs in this order; the normalized task has in addition its preparation as the source of its second channel.

For a correction task or its preparation, first complete its raw arrays and pre-incoming scores, then form its incoming gate from those scores. This assembly uses the current task’s completed arrays; every recursive input to their raw calculation is an earlier task in the order just specified.

=== 7.2 Raw sample terms <raw-sample-terms>

For a fixed row and endpoint let

$ cal(C)_(x y)^(u \, a) = { X_u \( x \) = 1 \, med Y_a \( y \) = 1 } . $

We use conditional means and conditional walks on this slice. Write $cal(B)_b$ for a normalized bin table and $cal(B)_b^(\( j \))$ for a bin with destination routing fraction already included; $cal(F)$ denotes a normalized correction table. Their values are in atom units and are zero off their specified membership domains. In all formulas below put $tau = min \( a \, b \)$.

The direct dense and correction–dense product terms, before division by the current first-channel scale $a$, are respectively

#[#set math.equation(numbering: n => "(7.1)")
 $ T_b \( x \, y \) & = b pi_a / pi_tau cal(B)_b \( x \, y \) \,\
T_b^(upright("prod")) \( x \, y \) & = b pi_a / pi_tau f / pi_f sum_(z : Z_f \( z \) = 1) cal(F) \( x \, z \) cal(B)_b \( z \, y \) . $ <eq:est-direct>]

In the product, the left task has roles $X \, Z$ and rates $\( u \; f \, f \)$, listed as start, end, and usage. The right task has roles $Z \, Y$ and rates $\( f \; b \, tau \)$. In the direct term the start rate stays $u$. The term $- E$ in $D$ is the negative of Equation (7.1) with $b = f$ and $cal(F)$ in place of $cal(B)_b$. Summing the direct and product terms gives the raw inputs $G_i \, G'_i$; adding the negative term gives $D$.

For a copy projection $x_i \, y_j$ from stage $l + 1$ to stage $l$, the raw term is

#[#set math.equation(numbering: n => "(7.2)")
 $ r_i \( x \) b pi_a / pi_tau cal(B)_b^(\( j \)) \( x \, y \) . $ <eq:est-projection>]

Partition by the fixed symbols $i \, j$. Append those symbols to the native hash arguments before the inherited suffixes on their respective channels. The parent-stage source multiplier is obtained from its detector vectors on the broad parent-stage vertex domain. No child tuple contains the old source or a particular right endpoint as an extra parameter.

For the second raw channel, use $zeta$ times the preparatory table, take its conditional average on $cal(C)_(x y)^(u \, t)$, and extend the result by zero off $Y_t \( y \)$. For a detector vector use the trial

#[#set math.equation(numbering: n => "(7.3)")
 $ "rank"_J { cal(S)_i \( x \, y \) : X_f \( x \) = 1 } quad upright("on the slice ") Y_f \( y \) = 1 . $ <eq:est-detector>]

Ranks include arbitrary zero padding. For rewards, writing $f = b_l$, the two terms for $W_(l + 1) \( x_i \)$ on its inherited source slice are

#[#set math.equation(numbering: n => "(7.4)")
 $ r_i \( x \) W_l \( x \) \, #h(2em) r_i \( x \) f / pi_f sum_(z : Z_f \( z \) = 1) cal(F) \( x \, z \) W_l \( z \) . $ <eq:est-reward>]

The first $W_l$ call keeps the inherited source domain; the second restarts on the midpoint domain. Vector answers are finally clipped into $\[ 0 \, 1 \]$.

#thm([Lemma 7.1.])[
  (True sample means).  #emph[Using true stochastic tables in Equations (7.1)–(7.4) gives, after the indicated conditional averages, the prescribed raw inputs and vector values on their conditioning slices, with the stated zero extensions. In particular, the first row channel has target $d_y = G \( x \, y \) \/ a$ and the second has target $zeta q_y upright(bold(1))_(Y_t \( y \))$.]
] <lem:est-true-means>

#proof[
  If $b gt.eq a$, the usage hit is already the conditioning hit. The conditional normalization of a bin therefore turns $b cal(B)_b$ into its deterministic bin contribution. If $b < a$, nested origin boxes give
  $ bb(E) [pi_a / pi_b upright(bold(1))_(Y_b \( y \)) V thin mid(bar.v) thin cal(C)_(x y)^(u \, a)] = bb(E) \[ V divides cal(C)_(x y)^(u \, b) \] $
  for every integrable $V$ on the narrower slice. Thus the importance factor performs exactly the required change of conditioning.
  For a fixed midpoint in Equation (7.1), first make this terminal change when necessary and then condition on $Z_f \( z \) = 1$. Apart from membership indicators, the true right bin gate and denominator use only channel $Y$. The true left correction uses only channels $X \, Z$. These channels are independent, and the remaining true multipliers are deterministic. The two normalizations can therefore be applied separately. In particular, after the midpoint hit is fixed, the shared role $Z$ does not occur in the right bin’s remaining random value. This is an identity for the true atoms; the estimates will instead be compared by their joint error norms. The factor $f \/ pi_f$ cancels midpoint sampling and converts its correction atom to the correction entry. Summing midpoints proves the product formula. The projection multiplies by deterministic $r_i \( x \)$ and includes the routing fraction in the bin, so the same argument applies on each fixed-symbol part. Fixed-suffix invariance in Lemma 4 justifies all inherited padding conventions.
  The second channel is its defining preparatory conditional mean, on its own narrower slice; it has no importance factor. The detector mean is the definition of $U_i$. True reward factors are deterministic, so the same midpoint argument proves Equation (7.4). ◻
]

To form a budget-$m$ sample term, replace all earlier inputs in the corresponding formula by budget-$m$ estimates, with their domains and common task parameters unchanged. This includes the detector inputs to $r_i$; the primary factor $r_0 = 1$ remains constant. Products, source functions, and ranks are evaluated before averaging. We first compare this sample’s conditional mean with the same formula using true atoms. The scale and source-domain costs of that comparison will determine how much accuracy a budget must provide.

=== 7.3 Mean comparisons and the cost of releasing a source <mean-comparisons-and-the-cost-of-releasing-a-source>

Lemma 24 identifies the exact conditional means. For estimated factors, the comparison has two distinct costs. The factor $b \/ a$ converts a bin contribution to the current entry units. A right factor at a midpoint also replaces the old source domain of rate $u$ by the stage domain of rate $f$. The following estimates account for both changes without assuming independence of the errors.

For nonnegative $H \, H'$ define

#[#set math.equation(numbering: n => "(7.5)")
 $ cal(L) \( H \, H' \) = cases(delim: "{", \| H - H' \|^s \/ \( H + H' \)^(s - 1) \, & H + H' > 0 \,, 0 \, & H = H' = 0 .) $ <eq:est-loss>]

#thm([Lemma 7.2.])[
  (Homogeneous loss).  #emph[The loss in Equation (7.5) is comparable, by constants depending only on $s$, to $\| H^(1 \/ s) - \( H' \)^(1 \/ s) \|^s$. It contracts under sums and nonnegative mixtures. If $H lt.eq C_0 G$ for a nonnegative $G$, then for every $a > 0$ and $H' gt.eq 0$, 
#[#set math.equation(numbering: n => "(7.6)")
 $ a min {1 \, frac(\| H - H' \|, a + G)}^s lt.eq C cal(L) \( H \, H' \) \, $ <eq:est-relative-loss>]

 where $C$ depends only on $s \, C_0$.]
] <lem:est-loss>

#proof[
  Put $v = max \( H^(1 \/ s) \, \( H' \)^(1 \/ s) \)$ and $w = min \( H^(1 \/ s) \, \( H' \)^(1 \/ s) \)$. Factoring $v^s - w^s$ bounds it between $v^(s - 1) \( v - w \)$ and $s v^(s - 1) \( v - w \)$; the denominator is between $v^(s \( s - 1 \))$ and $2^(s - 1) v^(s \( s - 1 \))$. This proves comparability. For a mixture, apply Hölder to $\| H - H' \| = cal(L) \( H \, H' \)^(1 \/ s) \( H + H' \)^(\( s - 1 \) \/ s)$ and then integrate; the triangle inequality first bounds the absolute difference of the integrals. This proves contraction, including finite sums.
  If $H' lt.eq 2 H + a$, then $H + H' lt.eq 3 C_0 G + a lt.eq C' \( a + G \)$, which proves Equation (7.6) directly. If $H' > 2 H + a$, then $\| H - H' \| > H' \/ 2$, $H + H' < 3 H' \/ 2$, and $H' > a$. Thus $cal(L) \( H \, H' \) gt.eq c H' gt.eq c a$, while the left side is at most $a$. ◻
]

Every unsigned true term of the signed formula for $D$ is bounded by a constant times $D$, by Lemma 8; the corresponding assertion for the other raw inputs follows from their nonnegative sums. Consequently the preceding lemma can be applied separately to all true contributions. Triangle inequalities combine their clipped relative errors even when a contribution has a negative sign.

#thm([Lemma 7.3.])[
  (Scale and domain comparison).  #emph[Compare a budget-$m$ sample term with the same term using true stochastic inputs. For a first-channel mean contribution use its clipped relative error against $1 + d_y$. In the bound for its $s$th-power norm, the scale factor multiplying a child root-discrepancy power is, up to fixed constants, 
$ cases(delim: "{", b \/ a \, & b gt.eq a \,, \( b \/ a \)^(s - 1) \, & b < a .) $

 A child that releases the old source and restarts on a stage-rate $f$ domain costs in addition at most $f \/ u$ in norm power. Direct children retaining that source have no such factor. The same-scale vector and second-channel comparisons have constant scale cost, with $f \/ u$ only where a source is released. No independence of estimated factors is required.]
] <lem:est-mean-comparison>

#proof[
  First suppose $b gt.eq a$. Apply Equation (7.6) after conditional expectation, and then the mixture contraction of Lemma 25 before it. Homogeneity supplies a factor $b \/ a$ after division by $a$. The factor $f \/ pi_f$ in a product is bounded above and below by fixed constants. For bounded nonnegative atoms a product-root difference splits into the factor-root differences, multiplied by fixed constants times support indicators of the unaffected factor in one of the two versions.
  To determine the source-domain factor, write $Delta_s cal(F)$ and $Delta_s cal(B)_b$ for the root discrepancies. After integration on the source/end slice, the relevant sums, besides $O \( b \/ a \) \/ N$, have the forms
  $ & bb(E) sum_(x \, z \, y) frac(X_u \( x \), u) Z_f \( z \) Y_a \( y \) \| Delta_s cal(F) \( x \, z \) \|^s upright(bold(1))_(cal(B)_b \( z \, y \) eq.not 0) \,\
 & bb(E) sum_(x \, z \, y) frac(X_u \( x \), u) Z_f \( z \) Y_a \( y \) upright(bold(1))_(cal(F) \( x \, z \) eq.not 0) \| Delta_s cal(B)_b \( z \, y \) \|^s . $
  Either support indicator can come from either compared version. In the first sum the right row cap eliminates $y$ at constant cost. In the second sum the left incoming cap eliminates $x$ at cost $O \( 1 \/ u \)$. The right child’s row metric has weight $1 \/ f$, leaving exactly $O \( f \/ u \)$. Its tuple is the same for every old source, so this elimination compares the same right error throughout. More explicitly, for either left support relation $cal(P)$ with incoming degree at most $K_c$ and a common right discrepancy $e \( z \, y \)$, the relevant inequality is
  $ & 1 / N bb(E) sum_x frac(X_u \( x \), u) sum_(z : \( x \, z \) in cal(P)) Z_f \( z \) sum_(y : Y_b \( y \) = 1) \| e \( z \, y \) \|^s\
 & #h(2em) lt.eq frac(K_c, N u) bb(E) sum_z Z_f \( z \) sum_(y : Y_b \( y \) = 1) \| e \( z \, y \) \|^s\
 & #h(2em) = K_c f / u thin parallel e parallel_(f \, b \; s)^s \, $
  where the source channel in the last norm is $Z$. The incoming cap applies pointwise, so the discrepancy can depend on the same environment as $cal(P)$. Using $Y_a lt.eq Y_b$ enlarges the remaining endpoint domain to the child’s own domain. A direct term simply retains its source and endpoint sums. In a projected term, the source-multiplier error eliminates $y$ by a row cap and changes the vertex weight from $1 \/ u$ to $1 \/ f_(upright("par"))$; this costs $O \( f_(upright("par")) \/ u \)$. Partitioning the fixed copy symbols keeps every tuple common during these sums.
  For $b < a$, change the terminal conditioning to $Y_b$ #emph[before] taking a power. The normalized coefficient inside is then $b \/ a$. There are only constantly many nonzero left paths in the union of the two rows. Ordinary bounded-factor difference inequalities and the finite-sum power inequality therefore apply with constant cost. The integrated change from $Y_a$ to $Y_b$ leaves $pi_a \/ pi_b$ outside the power. Its total factor is
  $ \( b \/ a \)^s pi_a / pi_b = O \( \( b \/ a \)^(s - 1) \) . $
  The same row and incoming sums as above then apply, now with $Y_b$. Ordinary differences of bounded nonnegative values are controlled by their root differences. Absolute mean error bounds clipped relative mean error, so this proves the fine-bin assertion.
  For the second raw channel, Jensen is applied directly on $cal(C)_(x y)^(u \, t)$. Its integrated endpoint mask is $Y_t$, already contained in the preparatory norm’s $Y_a$ domain. There is no importance factor and hence no $pi_a \/ pi_t$ penalty. The fixed scaling $zeta$ does not increase the cost.
  A rank discrepancy is at most the supremum of its input discrepancies. For the detector trial, summing its power over $Y_f \/ f$ is bounded by the score error sum over $X_f \/ f$ and $Y_f$; the rates match exactly. For rewards, the finite left-path count gives an ordinary product comparison, and the same incoming cap eliminates old starts for a right-vector error. Source functions have bounded Lipschitz roots in their clipped detector inputs, so their costs are the broad vertex costs already computed. Every estimate here is pointwise or follows from Jensen and summation; none uses independence of its errors. ◻
]

The preceding comparison measures errors in a retained sample term. Omitting a fine bin instead discards its whole true contribution; the next bound measures that loss.

#thm([Lemma 7.4.])[
  (Fine omission).  #emph[If one fine bin is omitted, the norm of its normalized contribution is at most $C \( b \/ a \)^(\( s - 1 \) \/ s)$. This applies to direct terms, routed terms, and correction–bin products.]
] <lem:est-omission>

#proof[
  The deterministic contribution $H$ has entries at most $C b$ and bounded row mass. For a product these bounds follow from Lemma 13. Therefore
  $ sum_y pi_a \| H \( x \, y \) \/ a \|^s lt.eq pi_a / a^s \( C b \)^(s - 1) sum_y H \( x \, y \) lt.eq C' \( b \/ a \)^(s - 1) . $
  Integrating source hits gives $pi_u \/ u = O \( 1 \)$, and summing at most $N$ rows cancels the normalization $1 \/ N$. ◻
]

=== 7.4 Choosing precision to pay for scale and domain changes <choosing-precision-to-pay-for-scale-and-domain-changes>

The preceding bounds explain the rate weights in the accuracy parameter. Write $h_b = log_2 \( b \/ a \)$ for the offset of a bin scale. In norm, the coarse-bin cost is $\( b \/ a \)^(1 \/ s)$ and the fine-bin cost is $\( b \/ a \)^(\( s - 1 \) \/ s)$. Since $s = 8$, a weight $1 \/ 2$ between these two exponents leaves a geometric margin in both directions. The same weight pays for the source-release cost $\( f \/ u \)^(1 \/ s)$. We now make this accuracy convention precise; the additive schedule will then trade lower child budgets for longer averaging walks.

Assign positive integer ranks $i_(*)$ in the task order fixed above, so every dependency decreases rank by at least one. The finite number of pilot steps and of preparations is an absolute constant, so $i_(*) = O \( l + 1 \)$. A task at integer budget $M gt.eq 0$ has implicit precision

#[#set math.equation(numbering: n => "(7.7)")
 $ p = M / K_(upright("prec")) - 1 / 2 log_2 1 / a - 1 / 2 log_2 1 / u - A_(*) i_(*) . $ <eq:est-precision>]

For a stage-$l$ vector use $a = f = b_l$; detector vectors also have $u = f$, whereas rewards retain their inherited start rate. The constants $K_(upright("prec"))$ and $A_(*)$ will be chosen below. If $p lt.eq 0$, return the zero table or vector and empty access classes. Otherwise the task is called active. The intended induction bound is $C_b 2^(- p)$ for every required ordinary vector norm and every required root discrepancy norm, including the pre-incoming scores and witnesses. A fixed $C_b$ makes this assertion trivial for inactive tasks: values and row supports are uniformly bounded, and $bb(E) X_u \/ u = pi_u \/ u = O \( 1 \)$.

At a normalized correction task, the column multiplier is assembled from earlier detector-vector estimates at budget $M - c_(upright("col"))$, for a fixed positive integer $c_(upright("col"))$. This is a separate final assembly call. All other calls used in one additive sample term have the common budget denoted by $m$.

Suppose a child at budget $m$ has parameters $a' \, u' \, i'_(*)$. Subtracting Equation (7.7) for the parent gives the exact identity

#[#set math.equation(numbering: n => "(7.8)")
 $ p' - p = - frac(M - m, K_(upright("prec"))) + 1 / 2 log_2 a' / a + 1 / 2 log_2 u' / u + A_(*) \( i_(*) - i'_(*) \) . $ <eq:est-child-precision>]

In a bin comparison $a' gt.eq c b$ for a fixed $c > 0$: a bin child has $a' = b$, while a correction has $a' = f$ and $b lt.eq K_f f$. The start is either retained or reset to the indicated broad stage rate. Fixed-stage changes in vector calls only change fixed constants. Thus, after taking $s$-th roots of the costs in Lemma 26, the scale contribution times child accuracy is bounded by

#[#set math.equation(numbering: n => "(7.9)")
 $ C C_b thin 2^(- p - A_(*) + \( M - m \) \/ K_(upright("prec"))) 2^(- 3 \| h_b \| \/ 8) . $ <eq:est-scale-slack>]

Indeed for $h_b gt.eq 0$ the exponent is $h_b \/ s - h_b \/ 2 = - 3 h_b \/ 8$; for $h_b < 0$ it is $\( s - 1 \) h_b \/ s - h_b \/ 2 = 3 h_b \/ 8$. For a child that restarts at rate $f$, the source-domain comparison costs $\( f \/ u \)^(1 \/ s)$ in norm, while its precision gains $1 / 2 log_2 \( f \/ u \)$. Multiplying the cost by the resulting accuracy factor gives $\( f \/ u \)^(1 \/ s - 1 \/ 2) = \( f \/ u \)^(- 3 \/ 8) lt.eq C$, using the allowed start-rate condition $u lt.eq f$.

For the separate final column-vector call, $a = f$, its child uses $a' = u' = f$, and $M - m = c_(upright("col"))$. Thus its norm cost times child accuracy is at most

$ C C_b 2^(- p) thin 2^(c_(upright("col")) \/ K_(upright("prec")) - A_(*)) \( f \/ u \)^(- 3 \/ 8) . $

The fixed rank separation pays this fixed budget loss. This calculation also explains why the source-domain ratio is charged in the error analysis rather than inserted as a numerical coefficient in a sample.

=== 7.5 The additive schedule <the-additive-schedule>

Every budget-zero task is inactive under the preceding precision rule. Hence a budget-zero sample term is zero: it contains at least one estimated table or vector factor. Exact base terms $S \( x \, y \) \/ a$ and $W_0 \( x \)$ are inserted separately.

For every first-channel term labelled by scale $b$, set $c_b = ceil.l c_0 \( 1 + \| h_b \| \) ceil.r$, where $c_0$ is a fixed positive constant. This rule includes the sparse direct term $- E$ with $b = f$, as well as direct bins, products, and projection terms. Every child factor in a term, including the detector-vector inputs to a projected source multiplier, uses that term’s common budget $m$ and cutoff $c_b$. Use zero scale offset only for second-channel preparatory means, detector-vector trials, and reward terms with fixed stage-rate changes. The separate final column assembly retains its fixed drop $c_(upright("col"))$. Denote the corresponding normalized sample term at budget $m$ by $T_(b \, m)$, including division by $a$ for the first row channel. For $1 lt.eq m lt.eq M - c_b$ form

#[#set math.equation(numbering: n => "(7.10)")
 $ T_(b \, m) - T_(b \, m - 1) . $ <eq:est-difference>]

Apply to this difference the conditional walk of length $ell \( M - m \)$, where $ell$ is a sufficiently large fixed integer. Use the same generator word and the same guessed wraps for its two parts.

Group increments by dyadic slack $d lt.eq M - m < 2 d$. Add groups in decreasing powers of two $d lt.eq M$ down to $1$, including empty groups. Put exact base contributions in the first group. Let $S_j$ be the uncompressed prefix through the group with slack $d_j$. The conditional mean prefix is obtained by replacing each walk by uniform averaging on its slice; noise is the difference from that mean. For an available bin the last budget reached by this mean prefix is

#[#set math.equation(numbering: n => "(7.11)")
 $ m_j \( b \) = max { 0 \, M - max \( d_j \, c_b \) } . $ <eq:est-last-budget>]

This exact cutoff will matter in the error bound. Bins with $c_b gt.eq M$ have no layers and are omitted.

The walk is applied to an array indexed by actual endpoints. Thus, for each term and pair, its input is the single function

$ F_(x y) \( sigma \) = T_(b \, m) \( x \, y \; sigma \) - T_(b \, m - 1) \( x \, y \; sigma \) \, $

with all contributions at that endpoint already summed. A path description is only a way to enumerate those contributions. In particular, the two budgets must be grouped at the same actual endpoint before their difference is measured. The following lemma establishes this identity for the path enumeration and also records the description length needed later by the controller.

#thm([Lemma 7.5.])[
  (Immediate paths).  #emph[At a row group of slack $d$, immediate candidates have descriptions of $O \( d \)$ bits. With exact endpoint grouping their sums equal the specified conditional-walk increments. A product visits its midpoint by a paired correction move before using any factor at that midpoint. Its right-hand task tuple does not depend on the discarded old source. Every child estimator in such a candidate has budget at most $M - d$.]
] <lem:est-paths>

#proof[
  A descriptor records the finitely many formula and copy-part choices, its scale and budget offsets, its sign in Equation (7.10), the generator word and guessed wraps, and a bounded number of constituent ports. An included scale obeys $\| h_b \| = O \( d \)$, and the walk has length $O \( d \)$. Lemma 21 therefore bounds all these records by $O \( d \)$ bits. Port alphabets are fixed by Lemma 17. There are only $O \( \( 1 + d \)^2 \)$ choices of budgets and scales before the exponential word/variant choices.
  Check each constituent port, the outer source and endpoint memberships, and the guessed wraps at the vertices where their coordinates can be evaluated. For a fixed endpoint and original generator word, unique wrap validation leaves exactly its genuine conditional transformation. Give the surviving term its original walk-word probability, multiplied by the formula coefficients and sign. Guessed wraps do not change that probability. Constituent ports enumerate entries once. Hence summing over true equal endpoints is precisely the walk of the difference, even though its endpoint was not known when the variant was specified.
  The first factor of every product is a correction, whose retained ports have bounded degree in both directions. Its paired move supplies the midpoint and a bounded return token. The right factor can then be queried using the common $Z \, Y$ tuple prescribed above; that tuple contains no old source. A direct unbalanced terminal motion has no further factor query at its endpoint. These are combinatorial access requirements; the controller section implements the pairing and terminal operations. Finally, the slack definition gives $m lt.eq M - d$, also for the $m - 1$ term. ◻
]

All reachable rate logarithms remain $O \( B \)$ when $M_(upright("top")) = O \( B \)$: a scale extension at slack $d$ changes a reciprocal-rate logarithm by $O \( d \)$ and reduces budget by at least $d$. Stage resets have only their fixed stage rates, usage rates are minima of available rates, and inherited padding has at most one symbol per stage above the task. Summing along a dependency chain bounds all extensions by $O \( M_(upright("top")) \)$. The field in the shared environment can therefore be chosen large enough for every used scale, including budget-zero endpoints of available differences. Omitted finer deterministic contributions need no hash tables.

We can now estimate each mean prefix by telescoping the conditional means to budget $m_j \( b \)$. Its deterministic omission error and its child-estimation error are treated separately. The remaining noise will be bounded by applying the conditional spectral estimate to the endpoint functions $F_(x y)$ above.

#thm([Lemma 7.6.])[
  (Mean prefixes).  #emph[Assume all earlier table and vector bounds with coefficient $C_b$. For an active task there is a fixed $B_1$, independent of the later choice of $A_(*)$, such that every mean prefix has norm at most $c_(*) 2^(- p + B_1 d_j)$ against its target. For the first channel the norm uses clipped relative discrepancy; for the second and for vectors it uses ordinary absolute discrepancy. The coefficient $c_(*)$ can be made arbitrarily small by increasing $A_(*)$.]
] <lem:est-mean-prefix>

#proof[
  #emph[Available scales.] For an available scale, conditional expectations of Equation (7.10) telescope to its term at $m = m_j \( b \)$ in Equation (7.11). If this budget is zero, the term is zero and the inactive-child bound still applies. More generally, the child bound remains valid whenever its precision is nonpositive, by the bounded-output estimate for inactive tasks. In every case
  $ M - m lt.eq d_j + c_0 \( 1 + \| h_b \| \) + 1 . $
  Choose $K_(upright("prec"))$ so that $c_0 \/ K_(upright("prec")) < 1 \/ 8$. Equation (7.9) is then bounded by
  $ C' C_b thin 2^(- p - A_(*) + d_j \/ K_(upright("prec"))) 2^(- \| h_b \| \/ 4) . $
  The rate grid is geometric, so summing this bound over available scales costs a fixed constant. There are only a fixed number of formula and factor types. Unbinned calls use the same calculation without the scale sum. Minkowski and subadditivity of clipped relative discrepancies combine all these terms. Exact base contributions are already present in every prefix and have no error.
  #emph[Wholly omitted scales.] A bin with $c_b gt.eq M$ contributes no layer. We bound its deterministic contribution directly by Lemma 27. First we show that every such bin is fine. Put $r = log_2 \( 1 \/ a \) gt.eq 0$. A coarse bin has $0 lt.eq h_b lt.eq r$ because all grid rates are at most one. Activity gives $M > K_(upright("prec")) \( r \/ 2 + A_(*) i_(*) \)$, even after discarding the nonnegative start-rate cost. With $K_(upright("prec")) \/ 2 > c_0$ and $A_(*)$ sufficiently large, this implies $M > ceil.l c_0 \( 1 + r \) ceil.r$, so a wholly omitted bin is fine. For the sparse direct term $b = f$, the same argument gives availability when $f gt.eq a$. When $f < a$, the admissibility condition $a lt.eq K_f f$ gives $\| h_f \| lt.eq log_2 K_f$, and increasing $A_(*)$ ensures $M > c_f$. Thus this term is never wholly omitted in an active task. The inequality $c_b gt.eq M$ implies
  $ \| h_b \| gt.eq \( M - 1 \) \/ c_0 - 1 . $
  Lemma 27 and a geometric sum consequently bound all such omissions by $C 2^(- \( s - 1 \) M \/ \( s c_0 \))$. Since $p lt.eq M \/ K_(upright("prec"))$ and $K_(upright("prec")) > s c_0 \/ \( s - 1 \)$, this is at most $C 2^(- p - eta M)$ for some fixed $eta > 0$, after absorbing the fixed rounding offset. Finally $M > K_(upright("prec")) A_(*) i_(*) gt.eq K_(upright("prec")) A_(*)$ makes its coefficient arbitrarily small as $A_(*)$ increases. Taking, for example, any fixed $B_1 > 1 \/ K_(upright("prec"))$ proves the claim, including every last-budget and no-budget cutoff loss. ◻
]

=== 7.6 Absolute difference bounds and averaging noise <absolute-difference-bounds-and-averaging-noise>

The conditional-mean errors are now bounded. To control the noise left by finite averaging, we need an absolute norm bound on each paired difference before the walk is applied. This coarser bound will also be used for the fingerprint comparison.

#thm([Lemma 7.7.])[
  (Absolute differences).  #emph[At a slack-$d$ group, the ordinary raw norm of an unaveraged paired difference is at most 
#[#set math.equation(numbering: n => "(7.12)")
 $ C C_b thin 2^(- p - A_(*) + C_0 d) \, $ <eq:est-raw-bound>]

 where $C_0$ is fixed independently of the walk length coefficient. For two coupled versions of a budget-$r$ sample term, if the corresponding child discrepancies are bounded by $2^(- p'_r) lambda_r$, their normalized raw difference is bounded by $2^(- p + C'_0 d) lambda_r$, summed over the finitely many child types. For a paired layer at budgets $m$ and $m - 1$, apply this estimate to both parts. Its coupled discrepancy is consequently bounded by $2^(- p + C'_0 d) \( lambda_m + lambda_(m - 1) \)$, after enlarging the fixed constant, or by the corresponding maximum over all children in the group. Every child in either part has budget at most $M - d$. For a fixed guessed measure-preserving variant and its valid endpoint restriction the same bounds hold. Counting all variants separately may increase $C'_0$ by a constant depending on the chosen walk length.]
] <lem:est-raw-difference>

#proof[
  Subtract the #emph[same stochastic true-atom term] from the budget-$m$ and budget-$\( m - 1 \)$ terms, and use the triangle inequality. A product has only constantly many left paths in the union of the compared rows. Ordinary bounded-factor differences and the row and incoming caps therefore give the sums used in Lemma 26, without any averaging. For a coarse bin the absolute coefficient costs $b \/ a$ in the norm rather than its $s$-th root. For a fine bin the importance factor can stay inside the power. Both are bounded by $2^(O \( \| h_b \| \))$. Equation (7.8) pays the only separate possibly large domain ratio, $f \/ u$, as before. All other scale and accuracy changes are $2^(O \( d \))$ because $\| h_b \| = O \( d \)$ and $M - m = O \( d \)$ in this group. Ranks and bounded source functions obey the same pointwise comparisons. This proves Equation (7.12). Replacing comparison to truth by a comparison of the two coupled child versions gives the second assertion by the identical inequalities; independence is still unnecessary.
  For a fixed guessed variant, valid paths require the transformed memberships. Change variables by its full-environment measure-preserving bijection and then discard surplus validity guards. This leaves exactly the child-domain sums just bounded. When combining the paired terms, combine their contributions at the same actual endpoint before measuring the difference. The number of distinct variant descriptors is $2^(O \( d \))$, so treating them separately merely enlarges the crude exponent. The estimate before such separate counting is a statement about the single-seed sample function and has no dependence on the eventual walk length coefficient. ◻
]

#thm([Lemma 7.8.])[
  (Conditional prefix bounds).  #emph[Assume exact local grouping, the earlier task error bounds, and that the sample functions depend only on variables varied by the conditional walk. Their uniform slice means are then deterministic at each indicated pair or vertex. Write $S_j^(upright("mean"))$ for a mean prefix and $S_j^(upright("noise")) = S_j - S_j^(upright("mean"))$ for its noise. There are fixed $B_1$ and arbitrarily large prescribed $K_n$ such that 
#[#set math.equation(numbering: n => "(7.13)")
 $ ∥min (1 \, frac(\| S_j^(1 \, upright("mean")) - d \|, 1 + d))∥_(u \, a \; s) & lt.eq c_(*) 2^(- p + B_1 d_j) \,\
parallel S_j^(upright("noise")) parallel_(u \, a \; s) & lt.eq c_(*) 2^(- p - K_n d_j) . $ <eq:est-prefix-mean>]

 The second-channel mean uses its ordinary absolute norm, extended by zero off its usage domain, and satisfies the first bound. Vector means and noises satisfy the corresponding vertex bounds. The coefficient $c_(*)$ can be chosen as small as needed by task separation and walk constants.]
] <lem:est-prefix>

#proof[
  The mean assertion is Lemma 29. For a difference layer, write $F_(x y)$ for its sample function on $cal(C)_(x y)^(u \, a)$, $cal(A)_(x y)$ for the conditional walk operator of length $ell \( M - m \)$, and $Pi_(x y)$ for uniform averaging on that slice. Put $w_(x y) = Pr \( cal(C)_(x y)^(u \, a) \) \/ \( N u \)$ and $r_(M - m) = C 2^(- c ell \( M - m \))$. Lemma 20 gives a uniform operator bound, so
  $ sum_(x \, y) w_(x y) parallel \( cal(A)_(x y) - Pi_(x y) \) F_(x y) parallel_(L_s)^s lt.eq r_(M - m)^s sum_(x \, y) w_(x y) parallel F_(x y) parallel_(L_s)^s . $
  The slice weights make the sum on the right precisely the integrated raw norm to the $s$th power, bounded by Lemma 30. Thus the uniform operator estimate applies directly to the integrated input bound, even when different slices have different input norms. For the second channel replace $Y_a$ by $Y_t$ in the slice and its weight; the mask stays $Y_t$ throughout. Vectors use the same calculation on their one-vertex slices. No extra conditioning factor appears.
  There are $O \( \( 1 + d \)^2 \)$ budget/scale terms in a group. Choose $ell$ so that the contraction dominates $2^(C_0 d)$ and this polynomial, leaving at least $2^(- \( K_n + 1 \) d)$. Summing groups with slack at least $d_j$ gives Equation (7.13). Exact base terms have no noise. This contraction applies to the paired difference as one function of the same seed. The sum of valid variants is the conditional walk, so the gap applies to that sum before any separate variant counting. Increasing $A_(*)$ supplies an arbitrarily small coefficient in both this estimate and the mean bound. ◻
]

The determinism hypothesis in Lemma 31 applies at each fixed pair or vertex, in the task’s effective environment as in Remark 22. Uniform averaging must integrate every coordinate on which its sample function depends. In Section 9, the clean calculation removes dependence on the current block’s salt, while the parent walk varies all earlier salts used by lower-block calculations; Lemma 40 verifies this hypothesis. The resulting first-channel mean is a deterministic number, and the second-channel mean has only its prescribed $Y_t$ membership mask. These are the means used in the conditional heavy-count argument of Lemma 35.

== 8 Compression of additive row estimates <sec:buf-compression>

The additive schedule produces a raw prefix on all retained endpoints after each slack group. We replace each array by a finite list of exceptions to a common default. Our objective is to control the bounded row functions, including their scores and support witnesses; a large raw entry need not have a small absolute error.

The update changes only small entries until its first overflow, when list capacity forces its threshold above the prescribed floor. Before then, the total earlier change is much smaller than the next floor. At the first overflow, either many retained endpoints are truly heavy or the prefix errors account for the excess. The heavy-count event is rare even after conditioning on one specified endpoint. We use this rarity for the deterministic conditional-mean errors, and use the absolute norm bound for the remaining noise. A stationary-reference comparison controls the subsequent updates.

We first fix the increments supplied by exact endpoint grouping and prove the comparison without range clamps. We then show that clamping preserves the relevant row functions and assemble the exact-grouping error reserve. Section 9 compares the actual and clean calculations with those clamps in place.

=== 8.1 The row interface <subsec:buf-interface>

Fix a row task, its start rate $u$, and its first-channel endpoint rate $a$. Write $d_y gt.eq 0$ for its true first raw input, in units of $a$. Its second raw input, when present, is $v_y = zeta upright(bold(1))_({ Y_t \( y \) = 1 }) q_y$. Here $q_y$ is the deterministic conditional mean, $0 lt.eq q_y lt.eq 1$, and $q_y = 0$ whenever $d_y$ is below the positive-start threshold of the preparatory function $h$. Thus $d_y$ and $q_y$ are deterministic at each specified endpoint; $v_y$ carries the prescribed narrower membership mask. There is a fixed constant $C_(upright("mass"))$ such that

#[#set math.equation(numbering: n => "(8.1)")
 $ a sum_y d_y lt.eq C_(upright("mass")) . $ <eq:buf-mass>]

The endpoint sets in this section are the retained sets, with the stipulated common padding on their hash arguments.

We apply a fixed finite family of pre-incoming row functions to a raw array. Denote this family by $cal(H)$. It includes the main pre-functions, auxiliary scores, and witnesses required by the preceding construction. Each function uses the first entry, possibly the second entry, and the $K$th largest first entry. For each member $H in cal(H)$ there are fixed positive thresholds $g_H \, e_H$, with $3 g_H < e_H$, such that its row gate is zero when that rank is at least $g_H$, and its entry factor is zero when the first entry is at most $e_H$. The gate is constant and full in a neighborhood of zero. The $s$th roots of the output functions are bounded and Lipschitz in their relevant entry and rank arguments, where $s = 8$. All these arguments can be clipped to fixed sensitivity ranges without changing the functions. These are exactly the threshold buffers and saturations imposed when constructing the atoms; the thresholds for the required functions are listed in Table 1. In particular, for every real raw array, including arrays with negative entries,

#[#set math.equation(numbering: n => "(8.2)")
 $ sum_(H in cal(H)) \# { y : H \( y \) eq.not 0 } lt.eq C_(upright("supp")) \, $ <eq:buf-row-support>]

where $C_(upright("supp"))$ is fixed. Indeed a nonzero gate implies that fewer than $K$ entries exceed its close threshold, and every positive output entry exceeds the larger entry threshold. This observation applies also to the broader witnesses.

Choose $eta > 0$ below all positive entry thresholds, all positive-start thresholds for rank sensitivity, and the threshold for $h$, with enough fixed separation that perturbations of size several times $eta$ remain inside these flat regions. Choose $zeta lt.eq eta \/ 100$. These constants are fixed throughout the proof.

Let $d_1 > d_2 > dots.h.c > d_(m_(*)) = 1$ be the decreasing powers of two indexing slack groups. Empty groups are included. Let $S_i = \( S_i^1 \, S_i^2 \)$ be the uncompressed prefix through group $i$, and let $Delta_i = S_i - S_(i - 1)$, with $S_0 = 0$. Define the clipped endpoint errors and their row supremum by

#[#set math.equation(numbering: n => "(8.3)")
 $ e_i \( y \) & = max {min (1 \, frac(\| S_i^1 \( y \) - d_y \|, 1 + d_y)) \, min \( 1 \, \| S_i^2 \( y \) - v_y \| \)} \,\
e_i & = sup_y e_i \( y \) . $ <eq:buf-errors>]

omitting channel two when absent. Write $beta_i \( y \)$ for the maximum of the mean discrepancies, with the same clipping and first-channel normalization as in Equation (8.3), and $gamma_i \( y \)$ for the maximum absolute prefix noise. Thus $e_i \( y \) lt.eq beta_i \( y \) + gamma_i \( y \)$. At a specified row and endpoint, the first-channel mean discrepancy is deterministic. The second-channel mean discrepancy is a deterministic magnitude times its narrower membership mask. Prefix noise may depend on the shared environment. The deterministic assertion is a hypothesis of the compression argument: the slice average defining a mean must vary every environment coordinate on which its sample function depends. Lemma 31 states this requirement, and Lemma 40 verifies it for the clean calculations to which we will apply the result. We will use conditional rarity to control these fixed mean-error magnitudes; the noise will be controlled by its unconditional norm bound.

For row integration use

$ integral F thin d mu = 1 / N bb(E) sum_x frac(X_u \( x \), u) F \( x \) . $

Endpoint integration means inserting the sum over retained endpoints in this expression. The prefix estimates used as hypotheses below are

#[#set math.equation(numbering: n => "(8.4)")
 $ (integral sum_y beta_i \( y \)^s thin d mu)^(1 \/ s) lt.eq c_(*) 2^(- p + B_1 d_i) \, #h(2em) (integral sum_y gamma_i \( y \)^s thin d mu)^(1 \/ s) lt.eq c_(*) 2^(- p - K_n d_i) . $ <eq:buf-prefix-interface>]

Lemma 31 supplies these estimates for the additive schedule. Here and below endpoint sums use the relevant masks. In particular these bounds control the $L_s \( mu \)$ norms of the corresponding row suprema, which we denote by $beta_i$ and $gamma_i$.

=== 8.2 The update map <the-update-map>

Adjoin arbitrarily many dummy positions, all with target and increments zero. A compressed array has default $\( z \, 0 \)$, shared also by the dummies, and a finite list of exceptions. Initially $z = 0$ and the list is empty. Order statistics of an array with this default mean the order statistics of its finite exceptional values with as many default values as needed. For a rank of order $r$, the finite list together with at least $r$ default copies gives exactly the prescribed rank. Additional real list positions whose values equal the default do not change this rank. Dummy positions serve only this rank computation; endpoint sums in the error bounds are over real retained IDs. The margin statement of Lemma 16 ensures that a default position cannot expose a row port. At group $j$ add $Delta_j$ by actual endpoint equality, obtaining $w_y$, and set

#[#set math.equation(numbering: n => "(8.5)")
 $ rho_j & = 2^(- c_1 d_j) \, #h(2em) n_j = 2^(c_2 d_j) \, #h(2em) m_y = max_nu \| w_y^nu \| \,\
u_0 & = max { z \, rho_j \, "rank"_(n_j) \( m \) } \,\
q_0 & = max { 0 \, "rank"_K \( w^1 \) } \,\
z' & = max { u_0 \, min \( q_0 \, 3 u_0 \) } . $ <eq:buf-thresholds>]

Here $c_1 \, c_2$ are fixed sufficiently large positive integers, and $c_2$ is chosen also so that $n_j gt.eq K$ in every group. With $b = \( z' \, 0 \)$, the updated array is

#[#set math.equation(numbering: n => "(8.6)")
 $ T_j^nu \( y \) = b^nu + "clip" #scale(x: 120%, y: 120%)[\(] w_y^nu - b^nu \, plus.minus 7 \( m_y - 2 u_0 \)_(+) #scale(x: 120%, y: 120%)[\)] . $ <eq:buf-update>]

The notation $"clip" \( r \, plus.minus A \) = max \( - A \, min \( r \, A \) \)$ is used.

#thm([Lemma 8.1.])[
  (Local compression properties).  #emph[The update has the following properties. It replaces every position of size at most $2 u_0$ by the new default, is identity at every position of size at least $3 u_0$, and lies coordinatewise between the input and the new default. The default is nondecreasing. The map from the input array and old default to the updated array and new default is uniformly Lipschitz in the sup norm. A list containing all exceptions can be chosen with at most $n_j$ positions, using only the previous list and the new candidates.]
] <lem:buf-update>

#proof[
  The zero-radius assertion is immediate. Since $z' lt.eq 3 u_0$, if $m_y gt.eq 3 u_0$ then
  $ \| w_y^1 - z' \| lt.eq m_y + 3 u_0 lt.eq 7 \( m_y - 2 u_0 \) \, #h(2em) \| w_y^2 \| lt.eq 7 \( m_y - 2 u_0 \) \, $
  which proves identity there. Clipping a displacement toward zero proves the coordinatewise assertion. Also $z' gt.eq u_0 gt.eq z$.
  If two input arrays and their defaults differ by at most $delta$, their size arrays, size ranks, $u_0$’s, and $q_0$’s differ by at most $delta$. Their new defaults differ by at most $3 delta$, and their clipping radii by at most $21 delta$. The elementary bound
  $ \| "clip" \( r \, plus.minus A \) - "clip" \( r' \, plus.minus A' \) \| lt.eq \| r - r' \| + \| A - A' \| $
  therefore gives, for example, a Lipschitz constant 28 for the full update. This constant is independent of the number and magnitudes of entries.
  Fewer than $n_j$ positions have size strictly larger than $u_0$. A coarse test supported above $u_0$ and full above $2 u_0$ retains all possible exceptions within the stated cap. A position outside the old list and new candidate set has input $\( z \, 0 \)$, has size at most $u_0$, and hence becomes the new default. No other position need be inspected. The selected list may retain some real positions that become exactly default after compression. Such positions still represent the same full array. No padding dummy is selected, since its input size is at most $u_0$. ◻
]

In particular an absolute perturbation introduced at group $i$ propagates through the remaining updates and the final root functions with factor at most

#[#set math.equation(numbering: n => "(8.7)")
 $ C C_1^(m_(*) - i + 1) lt.eq C \( d_i + 1 \)^(log_2 C_1) \, $ <eq:buf-propagation>]

for a fixed $C_1 > 1$, enlarged below as needed. This statement concerns full arrays and defaults; it does not require their exceptional lists to agree.

=== 8.3 Deterministic comparison arguments <deterministic-comparison-arguments>

Call group $j$ an overflow if its $u_0$ exceeds $rho_j$. Before the first overflow every compression change has magnitude at most $6 rho_i$ and occurs only at input size below $3 rho_i$. Because successive slacks halve, choosing $c_1$ large gives, uniformly in $j$,

#[#set math.equation(numbering: n => "(8.8)")
 $ 6 sum_(i < j) rho_i lt.eq rho_j \/ 100 \, #h(2em) 6 sum_i rho_i lt.eq eta \/ 100 . $ <eq:buf-small-floors>]

The same estimates cover dummy defaults. For example, before the first overflow the preceding default is at most $3 rho_(j - 1) lt.double rho_j$.

#thm([Lemma 8.2.])[
  (Preloss and stationary reference).  #emph[Let $L_(j - 1) = T_(j - 1) - S_(j - 1)$ before the first overflow at $j$. Then $parallel L_(j - 1) parallel_oo lt.eq 6 sum_(i < j) rho_i$, and at every endpoint with $d_y gt.eq eta$, 
#[#set math.equation(numbering: n => "(8.9)")
 $ max_nu \| L_(j - 1)^nu \( y \) \| lt.eq C sum_(i < j) rho_i e_i \( y \) . $ <eq:buf-preloss>]

 Start a reference calculation at the input of group $j$ with the true array $\( d \, v \) + L_(j - 1)$, the same preceding default, and no further increments. Every subsequent compression preserves its relevant row outputs. Their root discrepancy from the true outputs is bounded by $C sum_(i < j) rho_i e_i$.]
] <lem:buf-reference>

#proof[
  The uniform preloss bound follows by adding the changes described above. If a change occurs at group $i$ at a position with $d_y gt.eq eta$, then $\| w_y^1 \| lt.eq 3 rho_i$ and the preceding preloss is much smaller than $rho_i$. Thus
  $ frac(\| S_i^1 \( y \) - d_y \|, 1 + d_y) gt.eq frac(d_y - 3 rho_i - 6 sum_(k < i) rho_k, 1 + d_y) gt.eq c_eta > 0 . $
  The change of size at most $6 rho_i$ is consequently bounded by $C rho_i e_i \( y \)$. Adding such changes proves Equation (8.9).
  In the reference array negative first magnitudes and all second magnitudes are at most $eta$, by the choices of $zeta$ and the floors. Let $q$ be its initial $K$th first-coordinate rank. The default is nonnegative, so $q gt.eq 0$. If $q > eta$, then $n_i gt.eq K$ implies that the $n_i$th size rank is at most $q$. The floor and preceding default are also at most $q$, so $u_0 lt.eq q$ and $z' lt.eq q$. Entries at most $q$ stay at most $q$. Entries at least $q$ are unchanged if $q gt.eq 3 u_0$; otherwise $z' = q$, and they stay at least $q$. The $K$th rank is therefore unchanged. Negative first magnitudes and second magnitudes do not grow, so this argument repeats at every subsequent group. If instead $q lt.eq eta$, the size rank, $u_0$, and new default are at most $eta$, and the next $K$th rank is again at most $eta$.
  Consider an individual row function. In the first case its rank stays fixed. If its gate is not already zero, $q < g_H$, so every entry in its support has first coordinate greater than $e_H > 3 q gt.eq 3 u_0$ and both channels there are untouched. A position below entry support cannot cross into support because the default is at most $q < e_H$. In the second case the rank stays in the common full-gate region; the same identity argument applies to every position in entry support. Thus each reference output is preserved.
  Finally, positions with $d_y < eta$ stay below every entry threshold and cannot change a rank within its sensitivity region. Perturbations at all other positions satisfy Equation (8.9). Clip first entries and ranks to the fixed sensitivity ranges and use root-Lipschitz continuity of the row functions. This proves the last assertion. ◻
]

If no overflow ever occurs, the same proof, together with the final prefix error, gives the bound

#[#set math.equation(numbering: n => "(8.10)")
 $ sup_(H \, y) \| H \( T_(m_(*)) \; y \)^(1 \/ s) - H \( d \, v \; y \)^(1 \/ s) \| lt.eq C (e_(m_(*)) + sum_i rho_i e_i) . $ <eq:buf-no-overflow>]

For completeness, if the expression on the right is not small, bounded output ranges give the assertion after enlarging $C$. Otherwise low-target positions remain below sensitivity. At other positions clipped first entry discrepancies are bounded by a constant times their relative error, and second entry discrepancies by their absolute error. Adding the preloss estimate and applying the root-Lipschitz bounds proves the claim.

#thm([Lemma 8.3.])[
  (Stability after the first overflow).  #emph[At a first overflow in group $j$, the discrepancy of final row-root outputs from the stationary reference of Lemma 33 is at most 
#[#set math.equation(numbering: n => "(8.11)")
 $ C sum_(i gt.eq j) C_1^(m_(*) - i + 1) e_i . $ <eq:buf-relative-propagation>]

 The constant does not depend on the largest true first entry.]
] <lem:buf-relative-stability>

#proof[
  Write $E$ for the sum in Equation (8.11) without the initial constant. If $E$ exceeds a sufficiently small fixed constant, bounded output ranges suffice. Otherwise all clipped errors involved are strictly below 1. Hence
  $ \| S_i^1 \( y \) - d_y \| lt.eq \( 1 + d_y \) e_i \, #h(2em) \| S_i^2 \( y \) - v_y \| lt.eq e_i \, $
  and later increments have first magnitude at most $\( 1 + d_y \) \( e_i + e_(i - 1) \)$ and second magnitude at most $e_i + e_(i - 1)$. The input difference at group $j$ is precisely $S_j - \( d \, v \)$; both calculations include the same previous preloss. The factors $1 + d_y$ prevent a direct absolute-error bound with a uniform constant when a true entry is large. The following two cases use the row gate and saturation to remove that dependence.
  Choose $G$ larger than every gate close threshold. A baseline at least $G$ closes all gates, since the dummy entries force every first-coordinate rank to be at least the baseline. Closure is permanent under the unclamped update. Choose $L_0$ much larger than $G$, all sensitivity thresholds, and 1. If at least $K$ true first entries exceed $L_0$, the reference gates are closed. In the perturbed calculation either some $u_0 gt.eq G$, which forces permanent closure, or every $u_0 < G$. In the latter case those $K$ coordinates stay larger than half their true value: their initial error and the total later additive variation are at most $C \( 1 + d_y \) sum_(i gt.eq j) e_i$, and their first value is then larger than $3 G$. Inductively each such position lies in the compression identity region. These $K$ positive entries close all gates as well.
  It remains to consider the case of fewer than $K$ true entries above $L_0$. Lemma 33 bounds every reference rank and threshold by $2 L_0$. Fix $L_1$ much larger than $L_0$ and all upper saturation thresholds. At the at most $K - 1$ positions where $d_y > L_1$, replace the first input at group $j$, in both calculations, by one common positive sentinel larger than $L_1$, and give that coordinate zero later first-channel increments. Do not modify second channels. The reference ranks, thresholds, and outputs are unchanged: these coordinates stay above the relevant ranks and in all upper saturation regions. The sentinels are comparison devices in this proof. They need not be identified or stored by the compression algorithm. Fewer than $K$ such coordinates occur, so replacing them by common large values removes their possibly large absolute differences while preserving every rank that lies in a sensitivity range.
  All remaining first-coordinate input errors and increments now have absolute bounds by $C \( 1 + L_1 \) e_i$ and $C \( 1 + L_1 \) \( e_i + e_(i - 1) \)$, respectively. Lemma 32, iterated from $j$ to the last group, therefore bounds every array and threshold discrepancy by $C E$, on taking $C_1$ larger than the fixed update constant. If $E$ is sufficiently small, all these thresholds remain below $2 L_0 + 1$. The final root-output discrepancy is at most $C E$.
  To remove the modification in the perturbed calculation, argue inductively. Every original coordinate with $d_y > L_1$ remains above $d_y \/ 2$, because its total raw additive variation is at most $C \( 1 + d_y \) sum e_i$. It is thus above the bounded thresholds and in the identity and saturation regions. Replacing fewer than $K$ such positive coordinates by sentinels cannot change either a $K$th first rank or an $n_i$th size rank whose sentinel-computed value is at most $2 L_0 + 1$: both the original and modified values are above that bound, and $n_i gt.eq K$. The defaults and thresholds therefore agree, the compression is identity in both channels at these positions, and all other coordinates agree. The relevant output behavior is the same. This completes the induction and the proof. ◻
]

=== 8.4 Charging overflow events <charging-overflow-events>

The deterministic comparisons leave two cases to integrate: no overflow, and the first overflow. To handle the latter, we separate a large retained set of true heavy endpoints from overflow caused by errors at light endpoints. For this subsection let $cal(O)_j$ denote the event that group $j$ is the first overflow. These events are pairwise disjoint. The heavy-count event defined next depends only on the true row and its retained endpoints; it does not itself assert that any overflow occurs.

At first overflow in group $j$, the previous default is smaller than $rho_j$. Thus at least $n_j$ retained real positions have input size strictly greater than $rho_j$. Define the true heavy-count event

$ Theta_j = {\# { y upright(" retained") : d_y > rho_j \/ 4 } gt.eq n_j \/ 2} . $

The dummy positions do not contribute to this count, since their input is the preceding default. On $cal(O)_j ∩ Theta_j^c$, at least $n_j \/ 2$ of the overflowing positions have $d_y lt.eq rho_j \/ 4$. Their second targets vanish, because the floors lie below the $h$-threshold. Equation (8.8) then implies $e_j \( y \) gt.eq c rho_j$ at all these positions. Consequently the indicator of this false-type first overflow is bounded by

#[#set math.equation(numbering: n => "(8.12)")
 $ frac(C, n_j rho_j^s) sum_y e_j \( y \)^s . $ <eq:buf-false-charge>]

A bounded row-output error may be charged to this indicator. On $cal(O)_j ∩ Theta_j$, we instead use the stability estimate and the conditional rarity of $Theta_j$ at each endpoint.

#thm([Lemma 8.4.])[
  (Conditional rarity of a true heavy count).  #emph[At every specified endpoint, 
#[#set math.equation(numbering: n => "(8.13)")
 $ bb(P) \( Theta_j divides X_u \( x \) = Y_a \( y \) = 1 \) lt.eq frac(C, n_j rho_j) . $ <eq:buf-rarity>]

 The same bound holds with the narrower endpoint condition $Y_t \( y \) = 1$. Moreover, for every prefix mean row supremum, 
#[#set math.equation(numbering: n => "(8.14)")
 $ parallel upright(bold(1))_(Theta_j) beta_i parallel_(L_s \( mu \)) lt.eq C c_(*) 2^(- p + B_1 d_i) \( n_j rho_j \)^(- 1 \/ s) . $ <eq:buf-masked-mean>]

]
] <lem:buf-rarity>

#proof[
  By Equation (8.1), the deterministic heavy set
  $ A_j \( x \) = { y : d_y > rho_j \/ 4 } quad upright("satisfies") quad \| A_j \( x \) \| lt.eq frac(4 C_(upright("mass")), a rho_j) . $
  Conditional on one specified endpoint hit, each other endpoint in this set is retained with probability at most $C a$, by Lemma 4. This remains true if the specified hit uses the narrower rate. The forced endpoint contributes at most 1, so the expected retained heavy count is at most $1 + C a \| A_j \( x \) \| lt.eq C' \/ rho_j$. The independent start condition has no effect. Markov’s inequality at the threshold $n_j \/ 2$ proves Equation (8.13). This calculation uses the conditional pair bound and linearity of expectation; it permits dependence among the heavy-endpoint hits.
  For the first-channel mean error at a fixed row and endpoint, write its deterministic magnitude as $b_i \( y \)$. Then
  $ upright(bold(1))_(Theta_j) sup_(y : Y_a \( y \) = 1) b_i \( y \)^s lt.eq sum_y upright(bold(1))_(Theta_j) Y_a \( y \) b_i \( y \)^s . $
  Condition on the start and that endpoint before taking expectations. Equation (8.13) bounds the resulting expectation by $C \/ \( n_j rho_j \)$ times the endpoint-integrated mean-error power. Indeed the factor $b_i \( y \)^s$ is fixed under this conditioning, so
  $ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(Theta_j) X_u \( x \) Y_a \( y \) b_i \( y \)^s #scale(x: 120%, y: 120%)[\]] lt.eq frac(C, n_j rho_j) bb(E) #scale(x: 120%, y: 120%)[\[] X_u \( x \) Y_a \( y \) b_i \( y \)^s #scale(x: 120%, y: 120%)[\]] . $
  The second-channel mean error has a deterministic magnitude multiplied by $Y_t \( y \)$; repeat the same argument using the narrower conditional bound. Taking roots and using Equation (8.4) proves Equation (8.14). The conditioning step uses the deterministic mean-error magnitude at the specified endpoint. Prefix noise can depend on the heavy-count event, so no analogous conditional estimate is asserted for it. ◻
]

#thm([Proposition 8.5.])[
  (Integrated compression bound).  #emph[For fixed sufficiently large $c_1$, then $c_2$, and sufficiently rapid prefix-noise decay $K_n$, compression preserves the prescribed row error budget, with an arbitrarily small fixed coefficient when $c_(*)$ is chosen small. More precisely, 
#[#set math.equation(numbering: n => "(8.15)")
 $ (integral sum_(H in cal(H)) sum_y \| H \( T_(m_(*)) \; y \)^(1 \/ s) - H \( d \, v \; y \)^(1 \/ s) \|^s thin d mu)^(1 \/ s) lt.eq C_(upright("buf")) c_(*) 2^(- p) \, $ <eq:buf-integrated>]

 where $C_(upright("buf"))$ is fixed, independent of the number of groups, row width, and requested precision.]
] <prop:buf-error>

#proof[
  Equation (8.2) converts every row sup bound above into a bound for its summed output power with a fixed factor. In fact the support of a discrepancy lies in the union of the true and computed supports, whose total size over $cal(H)$ is at most $2 C_(upright("supp"))$. Thus this step introduces no factor from the ambient number of endpoints. The preloss contributions have norm at most
  $ C c_(*) 2^(- p) sum_i rho_i #scale(x: 120%, y: 120%)[\(] 2^(B_1 d_i) + 2^(- K_n d_i) #scale(x: 120%, y: 120%)[\)] . $
  On the event of no overflow, Equation (8.10) adds the final-prefix cost, at most $C c_(*) 2^(- p) \( 2^(B_1) + 2^(- K_n) \)$. By Equation (8.12) and the disjointness of the possible first-overflow events, the total false-type error power is at most
  #[#set math.equation(numbering: n => "(8.16)")
   $ C c_(*)^s 2^(- s p) sum_j \( n_j rho_j^s \)^(- 1) #scale(x: 120%, y: 120%)[\(] 2^(s B_1 d_j) + 2^(- s K_n d_j) #scale(x: 120%, y: 120%)[\)] . $ <eq:buf-false-sum>]
  For a true-type first overflow at $j$, use Lemma 34 and split $e_i lt.eq beta_i + gamma_i$. For the mean part, enlarge the actual first-overflow event to $Theta_j$, apply Equation (8.14), and use Minkowski’s inequality. Its total norm is bounded by
  #[#set math.equation(numbering: n => "(8.17)")
   $ C c_(*) 2^(- p) sum_j \( n_j rho_j \)^(- 1 \/ s) sum_(i gt.eq j) C_1^(m_(*) - i + 1) 2^(B_1 d_i) . $ <eq:buf-true-sum>]
  For the noise part, use the uniqueness of the first-overflow group on each row. Its tail noise sum is bounded pointwise by the single full sum $sum_i C_1^(m_(*) - i + 1) gamma_i$, regardless of dependence between noise and overflow. More explicitly,
  $ sum_j upright(bold(1))_(cal(O)_j) sum_(i gt.eq j) C_1^(m_(*) - i + 1) gamma_i lt.eq sum_i C_1^(m_(*) - i + 1) gamma_i \, $
  because at most one indicator on the left is nonzero. The absolute prefix-noise bound therefore gives norm at most
  #[#set math.equation(numbering: n => "(8.18)")
   $ C c_(*) 2^(- p) sum_i C_1^(m_(*) - i + 1) 2^(- K_n d_i) \, $ <eq:buf-noise-sum>]
  without an extra sum over $j$.
  Choose $c_1 > B_1$ large enough for the floor conditions. Choose $c_2 > s c_1 + s B_1$ with a fixed positive margin and also large enough that $n_j gt.eq K$. Equation (8.16) then converges uniformly. For its mean term the exponential factor is exactly $2^(- \( c_2 - s c_1 - s B_1 \) d_j)$. For Equation (8.17), its inner sum is at most $C \( d_j + 1 \)^A 2^(B_1 d_j)$ for a fixed $A$, by Equation (8.7) and dyadic grouping; the stronger choice of $c_2$ just made ensures convergence of the outer sum, whose exponential factor is $2^(- \( \( c_2 - c_1 \) \/ s - B_1 \) d_j)$. Taking $K_n$ sufficiently large handles Equation (8.18). The preloss sum converges by $c_1 > B_1$. All constants are fixed before choosing the arbitrarily small prefix coefficient $c_(*)$, giving Equation (8.15) and the asserted spare coefficient. ◻
]

Proposition 36 bounds the compressed pre-incoming functions, including scores and witnesses. Before assembling the final atom estimates, we impose the numerical range bounds needed to evaluate these arrays.

=== 8.5 Bounding numerical ranges <bounding-numerical-ranges>

In exact endpoint grouping, the additive increments are independent of which exceptions are stored. The path description and bounded child ranges give a fixed $D$ for which $parallel Delta_i parallel_oo lt.eq 2^(D d_i)$, after increasing $D$ to include immediate term counts. This also bounds a group when all its same-key increments are summed into one coordinate, with a possibly larger fixed $D$. Fix a common gate closure level $G gt.eq max_H g_H$, and then choose $L > 10 G$ above every sensitivity threshold. Let $R_i = 2^(B_2 d_i)$ and choose $B_2$ sufficiently large that

#[#set math.equation(numbering: n => "(8.19)")
 $ R_i gt.eq 10 L + 10 sum_(k > i) parallel Delta_k parallel_oo quad upright("for every group ") i . $ <eq:buf-clamp-margin>]

Dyadic grouping permits this uniform choice because $d_(i + 1) = d_i \/ 2$. After each compression, clip every coordinate and the baseline componentwise to $\[ - R_i \, R_i \]$. An off-list coordinate is clipped exactly as the baseline is, so it remains a default coordinate. These clamps therefore preserve the finite-list representation.

#thm([Lemma 8.6.])[
  (Range clamping).  #emph[For fixed common increments satisfying Equation (8.19), these clamps do not change the final relevant row functions. Each clamp is sup-norm nonexpansive, so in comparisons of two calculations it preserves the uniform Lipschitz propagation bound. The analogous assertion holds for vector sums clipped beyond their final sensitivity range and all remaining additive variation.]
] <lem:buf-clamping>

#proof[
  Compare the clamped and unclamped calculations with the same increments. For the fixed level $G < L \/ 10$, once both baselines are at least $G$, all gates are zero because of the dummies, and remain so: compression cannot lower the baseline and every clamp bound exceeds $G$. It remains to compare the calculations before this happens.
  Maintain the following invariant. Their baselines agree while below $G$. Their coordinates either agree, or have matching signs and magnitudes well beyond $L$; any such differing component has enough remaining margin that the total future increments cannot bring it into $\[ - L \, L \]$. At the first clamp of a component this follows from Equation (8.19). A subsequent clamp restores the same margin using the current $R_i$. Between clamps, common additions consume at most the available tail margin.
  After an addition, entries whose components differ therefore have size larger than $L$ in both calculations. Their size-rank statistics either are equal below $G$ or are both at least $G$: differing values lie above this comparison range and all other size values agree. In the latter case both new baselines close the gates. In the former case the two values of $u_0$ agree and are below $G$. Only the first-coordinate rank clipped at $3 u_0$ is needed to compute $z'$. Differing positive first components are above this range; differing negative first components are below zero and do not affect its nonnegative clipped value. Consequently the two new baselines agree as well. If this baseline is at least $G$, both calculations close. Otherwise every differing position lies in the compression identity region because its size exceeds $L > 3 G$; equal coordinates at other positions undergo the same update. Thus the invariant continues.
  Before closure, all rank arguments and all entry arguments within their sensitivity ranges agree. Differing large components have matching signs and identical saturated behavior. The final row functions therefore agree. A scalar clipping map is 1-Lipschitz, which gives the comparison assertion. For a vector sum, the same tail-margin argument ensures that a clipped value stays on the same saturated side until the final bounded clipping; no rank argument is needed. ◻
]

The equality assertion of Lemma 37 is used for the clean error bound: exact endpoint grouping supplies the same increment arrays regardless of the chosen list presentation. It preserves the values of every relevant $H in cal(H)$, including scores and smooth witnesses. It makes no assertion that finite-accuracy access tests or selected descriptors agree with those of the unclamped calculation. In the adaptive comparison of Section 9, both the actual and clean calculations are clamped from their definition. Their possibly different bucket increments are compared directly, and the nonexpansiveness part of Lemma 37 preserves the local perturbation bound. This use allows different real representatives, including retained positions whose current value equals the default.

=== 8.6 The error reserve with exact endpoint grouping <the-error-reserve-with-exact-endpoint-grouping>

The prefix estimates and compression bound now give the current task’s error estimate under exact endpoint grouping. The hypotheses still require each conditional average to vary every random coordinate used by its sample function. We combine the compressed pre-incoming bounds with the atom assembly comparison; the next section will verify this averaging hypothesis for the block-clean calculation.

#thm([Proposition 8.7.])[
  (Error reserve with exact endpoint grouping).  #emph[Suppose the earlier row and vector tasks have error bound $C_b 2^(- p')$ and the support and common-parameter properties of the atom section. Use exact comparisons locally, and vary every variable on which the sample terms depend. After compression and the range clamps above, all active row outputs, pre-incoming scores, and witnesses have error at most $\( C_b \/ 2 \) 2^(- p)$. The same holds for the final clipped vectors and the assembled correction outputs, after choosing the fixed constants in the order specified below.]
] <prop:est-clean>

#proof[
  To apply Proposition 36, use the deterministic-mean and absolute-noise bounds of Lemma 31. The first target is nonnegative with bounded deterministic row mass before division by $a$, and its second target is bounded by a fixed multiple of $zeta$ and vanishes below the preparatory support threshold. The buffered row functions and their witnesses have fixed root Lipschitz constants and fixed support bounds. These verify its remaining hypotheses. The compression proposition shows that all their errors are a fixed multiple of $c_(*) 2^(- p)$ when its convergent series of floors, capacities, and noise weights are chosen. This includes the pre-incoming quantities required by the incoming comparison. Exact endpoint grouping gives common increment arrays for the clamped and unclamped calculations. Lemma 37 therefore preserves these row-function values, including scores and witnesses, so the same estimates hold after clamping.
  Lemma 18 then charges the incoming gates by those same pre-output norms. Its separate column-vector calls have a fixed positive budget slack and decrease task rank. Equation (7.8) pays their broad-domain factor, and increasing $A_(*)$ makes their remaining coefficient as small as required. A final vector needs no compression; its clipping is nonexpansive and the bounds at $d_j = 1$ apply directly.
  Choose the fixed atom range/support bound $C_b$ first. Choose $c_0$ and $K_(upright("prec"))$ to retain the margin in Equation (7.9) and fix $B_1$. The compression proof then chooses its floor exponent $c_1$, capacity exponent $c_2$, and required noise decay $K_n$. Choose task separation and walk length sufficiently large to supply the needed small $c_(*)$. The total coefficient can thus be made at most $C_b \/ 2$. Inactive tasks retain their separate trivial $C_b$ bound. The remaining half of the active-task error bound is reserved for the coupled fingerprint error. ◻
]

The reserve applies to a local exact-grouping calculation with the stated averaging property. The actual algorithm will also use short endpoint keys. In Section 9 we define an exact-grouping comparison within each budget block, verify that it has this averaging property, and bound its difference from the algorithm.

== 9 Adaptive fingerprints within budget blocks <sec:fp-blocks>

We now replace endpoint comparisons at small budget slacks by short keys. The endpoint universe has size $2^(O \( B \))$, whereas the key range has size $B$. These comparisons change the computed arrays. To control the change, we compare the algorithm with a calculation that uses exact equality within one budget block and the actual algorithms below that block.

This comparison has two roles. Its conditional averages give the deterministic means needed by the compression reserve, and its candidate endpoints form a set independent of the current block’s key. We charge actual paths leaving that set to errors in lower calls, then bound collisions inside it. The resulting coupled induction proves the error bound for the actual estimator.

We use the root error metric $frak(d)_(u \, a)$ for bounded nonnegative row outputs, its ordinary version $parallel dot.op parallel_(u \, a \; s)$ for raw arrays, and the ordinary vertex metric for vectors. For a row quantity $Z \( x \, sigma \)$ define also

#[#set math.equation(numbering: n => "(9.1)")
 $ parallel Z parallel_(upright("row") \, u \; s)^s = 1 / N bb(E)_sigma sum_x frac(X_u \( x \), u) \| Z \( x \, sigma \) \|^s . $ <eq:fp-row-measure>]

The value of $s$ remains $8$. Supremums over endpoints below are over actual ID positions, with the appropriate retained-domain masks; virtual default positions are never counted with the multiplicity of the ambient universe.

=== 9.1 Uniform salts and their access rule <uniform-salts-and-their-access-rule>

The fixed-pair estimate below combines polynomial evaluation, as in classical algebraic fingerprinting #cite(label("Schwartz1980")), with affine universal hashing #cite(label("CarterWegman1979")). Its proof is included to specify the fair-bit distribution and space bound. The adaptive use of these fingerprints requires the separate block comparison that follows.

#thm([Lemma 9.1.])[
  (Short fingerprints).  #emph[Suppose every endpoint has an injective, fixed-length binary encoding of length $L lt.eq c_(upright("ID")) B$. There is a uniform construction from $O \( log B \)$ independent fair bits of a map $k : { upright("endpoint IDs") } arrow.r { 1 \, dots.h \, B }$ such that, for distinct fixed IDs $v \, w$, 
#[#set math.equation(numbering: n => "(9.2)")
 $ Pr \[ k \( v \) = k \( w \) \] lt.eq C \/ B lt.eq C B^(- 1 \/ 2) . $ <eq:fp-pair-collision>]

 Evaluating the map at a presented endpoint needs $O \( log B \)$ arithmetic scratch in addition to access to its encoding.]
] <lem:fp-hash>

#proof[
  Pad all encodings to the same length and put $P_v \( T \) = sum_(i = 0)^(L - 1) v_i T^i$. Choose a prime $B^3 lt.eq q lt.eq 2 B^3$, increasing the fixed lower bound on $B$ if necessary. Thus $L < q$. Let $ell = ceil.l log_2 q ceil.r$. Split a string of $3 ell$ fair bits into independent integers $R \, A \, C$ in ${ 0 \, dots.h \, 2^ell - 1 }$, and reduce them modulo $q$ to obtain $r \, alpha \, beta$. Each residue has probability at most $2 \/ q$. Let $tau : bb(F)_q arrow.r { 1 \, dots.h \, B }$ partition the standard residues into consecutive sets of sizes differing by at most one, and set
  $ k \( v \) = tau #scale(x: 120%, y: 120%)[\(] alpha P_v \( r \) + beta #scale(x: 120%, y: 120%)[\)] . $
  All computations are in $bb(F)_q$ before applying $tau$.
  The nonzero polynomial $P_v - P_w$ has degree at most $L - 1$, so it has at most $L - 1$ roots. This root bound follows by repeatedly factoring $T - r_0$ at a root; it applies here because the coefficient difference $1$ or $- 1$ is nonzero in $bb(F)_q$. Consequently
  $ Pr \[ P_v \( r \) = P_w \( r \) \] lt.eq 2 \( L - 1 \) \/ q . $
  For distinct evaluations $z \, z'$, the map $\( alpha \, beta \) mapsto \( alpha z + beta \, alpha z' + beta \)$ is a bijection of $bb(F)_q^2$. Under uniform parameters its two outputs are uniform and independent. The probability that their $tau$-values agree is
  $ q^(- 2) sum_(j = 1)^B \| tau^(- 1) \( j \) \|^2 lt.eq frac(ceil.l q \/ B ceil.r, q) lt.eq 1 / B + 1 / q . $
  The actual joint law of $\( alpha \, beta \)$ is pointwise at most four times the uniform law and is independent of $r$. Adding the two cases gives $2 \( L - 1 \) \/ q + 4 \/ B + 4 \/ q = O \( 1 \/ B \)$. A polynomial evaluation by Horner’s rule and the residue arithmetic use $O \( log q \) = O \( log B \)$ bits. The prime can be chosen uniformly by searching and trial division in that space. The existence of a prime in the indicated interval is the same elementary prime-interval fact used in choosing the environment field. ◻
]

Fix a small positive rational $epsilon.alt$, to be chosen last. This coefficient controls the fingerprint block width. Write

#[#set math.equation(numbering: n => "(9.3)")
 $ h_(*) = floor.l epsilon.alt log_2 B floor.r \, #h(2em) M_b = b h_(*) \, #h(2em) cal(I)_b = { M_b \, dots.h \, M_b + h_(*) - 1 } . $ <eq:fp-blocks>]

Enlarge the fixed minimum $B$ so $h_(*) gt.eq 1$ and $h_(*) gt.eq \( epsilon.alt \/ 2 \) log_2 B$. Give each block meeting ${ 0 \, dots.h \, M_(upright("top")) }$ an independent salt from Lemma 39. Pad each salt to a multiple of the fixed integer $H$ by unused independent bits. Since $M_(upright("top")) = O \( B \)$, the total number of bits is

#[#set math.equation(numbering: n => "(9.4)")
 $ O #scale(x: 120%, y: 120%)[\(] \( 1 + B \/ h_(*) \) \( log B + H \) #scale(x: 120%, y: 120%)[\)] = O \( B \) . $ <eq:fp-salt-space>]

Here and throughout, constants may depend on the fixed $epsilon.alt$ and $H$. We enumerate the original fair-bit strings when enumerating environments; reducing chunks modulo $q$ does not change that sampling convention.

The following access rule is part of the algorithm. A task whose budget lies in $cal(I)_b$ may inspect salts with indices at most $b$. Its conditional walks vary all earlier salts as free bits and freeze the salt of block $b$ and every later salt. The restriction applies to structural choices, port orders, validity tests, and predecessor tests as well as to numerical values. The controller construction below implements this rule for every access operation, including inverse queries. It is not enough to impose it only on the final output values.

This rule is stated in the coordinates of the task’s #emph[effective environment]. Write $sigma$ for that environment when analyzing a task. A fixed ancestor variant may mix its free salt coordinates before supplying $sigma$ to a descendant; the descendant’s table depends on the resulting environment, not on the word that produced it. Thus the rule does not forbid reading a later-indexed bit of the original master environment while replaying that word. It requires the descendant’s values, port orders, and access operations to be functions only of its permitted effective coordinates. Lemma 68 implements this distinction. Each fixed variant is measure preserving by Lemma 21, so the integrated estimates may change variables to its effective environment. We do not assume that an adaptively selected variant leaves a uniform conditional law. At a block-$b$ task, its own variants act only on effective salts earlier than $b$ and freeze its effective block-$b$ salt and all later ones.

=== 9.2 The update rule and the clean calculation <the-update-rule-and-the-clean-calculation>

We now complete the recursive definition of the actual task; inactive tasks still return zero outputs and empty access classes. For an active row task, the additive schedule of Section 7 supplies candidate increments from smaller-budget outputs. Process the groups in decreasing slack. In each group, distribute increments by the rule below, then use the compression, range clamps, and shortlist rule of Section 8. After the last group, form the pre-incoming row functions and precursor classes from the completed arrays, then assemble any incoming gates and column multipliers as in Section 5. The separate column-vector calls have smaller budget. Vector tasks use the same schedule to sum their scalar terms, with their prescribed range clamps and final clipping; they require no endpoint grouping or row-list compression.

The row-group distribution rule is as follows. For a dyadic group with slack $d > 2 h_(*)$, compare endpoint IDs exactly. For a group with $d lt.eq 2 h_(*)$, use the key from the task’s block as follows. First discard invalid candidates, including invalid guessed wraps, individually. Sum all new candidate increments having the same key. Add a bucket’s sum to every old representative with that key. If the bucket has no old representative, introduce exactly its first valid new candidate, with its previous value equal to the old default, and add the bucket sum there. Do not combine or discard old representatives in this key step. Apply the same full-array compression, clamping, and shortlist rule as in the preceding section.

Distinct actual representatives remain distinct. Indeed two introduced representatives have different keys, and an introduced representative’s key differs from every old key. Increments at one and the same actual endpoint are always combined, even when other endpoints collide with it. Stored values are never summed by key. The two channels use the same keys and the same representative selection for the entire group.

For an analytical comparison at a budget $M in cal(I)_b$, define the #emph[clean calculation for block $b$] by replacing key comparisons by exact ID comparisons throughout that block, recursively in every child whose budget still belongs to $cal(I)_b$. Children below $M_b$ are the actual algorithms, with exactly the same environments in the two calculations. This replacement applies to the entire numerical and structural calculation: candidate validity, representative selection, compression, exposed classes, and their port orders. Descriptor enumeration uses fixed index orders. Each finite-accuracy test for a shortlist or exposed class retains its prescribed accuracy level and tie convention, independently of any requested output accuracy. All these operations use the corresponding clean operands. Thus the clean calculation specifies its access choices as well as its represented arrays.

Denote the actual and clean versions by superscripts $upright("ac")$ and $upright("cl")$. Both still perform compression and clamping. The clean calculation is a finite analytical recursion; its exact comparisons are not asserted to satisfy the eventual space bound.

Clamping is part of both definitions. The clean error reserve uses Lemma 37 for exact-ID increments, which are independent of the stored exception list. That lemma preserves the relevant row functions and witnesses; it need not preserve the list or port presentation of an unclamped calculation. The coupling below compares the two clamped calculations directly. Its propagation bound uses the Lipschitz compression map and the nonexpansiveness of each common clamp, without introducing an unclamped actual calculation.

#thm([Lemma 9.2.])[
  (Independence of the clean block).  #emph[Every clean value and structural choice for block $b$ is independent of that block’s effective salt and of later effective salts. In a task of budget $M in cal(I)_b$, the actual and clean row states immediately before the first group with $d lt.eq 2 h_(*)$ are identical and independent of that salt. Their stored lists at this boundary have size $2^(O \( h_(*) \))$. The deterministic slice-mean assertion required by Lemma 31 holds for the clean calculation.]
] <lem:fp-clean>

#proof[
  Induct on the budget and, within a task, on its prescribed sequence of operations. Lower-block algorithms ignore the salt of block $b$ and later salts by the access rule; same-block clean children ignore them by induction. Candidate tests use these children, exact endpoint grouping precedes compression, and the compressed row determines its exposed classes and pre-incoming scores. Incoming ranks use those completed scores. Separate column-vector queries likewise use a smaller-budget clean child in this block or an actual child below it. All statements here concern the current effective environment: each same-block transformation preserves its current and later salts, and each lower-block transformation acts on a subset of its earlier salts. Each numerical recipe uses the same fixed operand order, and each structural test uses its fixed accuracy level and tie rule. Its result therefore depends only on earlier clean operands, including their finite numerical approximations. The fixed index orders then give salt-independent representatives and ports.
  In particular, exact full-array addition, compression, and the prescribed row functions are salt independent. Reordering paths or choosing a different representative of the same endpoint would not change an exact sum; retaining an extra default-valued position would not change the represented array. The fixed conventions above also remove these presentation choices from the structural calculation.
  For a group with $d > 2 h_(*)$, every child budget is at most $M - d < M_b$. Both runs use the same lower-block children and exact comparisons there. All their list operations, including their deterministic tie conventions, ignore the present salt. Thus their boundary states agree. The last larger dyadic slack, if there is one, is at most $4 h_(*)$, so its shortlist has at most $2^(O \( h_(*) \))$ positions. If there is no larger group, the boundary list is empty.
  Finally, the clean estimand depends only on rank channels and earlier salts. These are precisely the variables averaged by its conditional walk, subject to its stated vertex conditions. Same-block salts are irrelevant, and lower-block salts are free variables of this walk. Projection onto the uniform measure of the slice therefore gives a deterministic quantity at its indicated pair or vertex, with the prescribed retained-domain masks. In particular, no random dependence on a frozen salt remains in this mean. For the second channel, its deterministic mean magnitude is extended by its prescribed narrower endpoint mask, as required in Section 8. The salt rule is required of all access operations, including inverse queries and port orders; Lemma 68 supplies its implementation. Lemmas 20 and 21 therefore apply to this function. This verifies the deterministic-mean hypothesis of Proposition 38; it does not assert independence between errors of different children. ◻
]

=== 9.3 Witness envelopes and escaped paths <witness-envelopes-and-escaped-paths>

To control adaptive candidates, we first bound a set of endpoints determined by the clean calculation. An actual path leaving this set will be charged to a child witness discrepancy.

We recall the relevant interfaces from Lemma 17. Every exposed actual path port has a broader smooth witness equal to one at that port. Each witness has bounded row support. The actual correction ports, including exposed ports of weight zero, have incoming multiplicity at most $K_c$. Tables contain one entry per pair of actual IDs. After fixing a copy part, the child tuple is common over the whole table; in particular, a right child reached from a midpoint does not depend on the discarded old start. All these statements hold for arbitrary computed raw arrays, not just for accurate ones.

The incoming cap applies to the entire exposed correction relation, including its zero-weight entries. The broader auxiliary score class needs only a row bound: it is queried for scores and witnesses, whereas the left factor of a two-factor path is a capped correction table. This distinction permits the source sum below to be removed even when an offending candidate has zero numerical weight.

Let $cal(G)_b$ be the sigma-field generated by all coordinates of the task’s effective environment except the salt of block $b$. Fix a row $x$ and condition on $cal(G)_b$ with $X_u \( x \) = 1$. Take its boundary list from Lemma 40, including every stored exact-default slot. For every small group and every immediate descriptor variant, evaluate the clean factors and their witnesses in the environment obtained by that fixed variant. This transformation leaves the present and later salts frozen. Include the endpoints in each direct witness support and, for a two-factor path, the endpoints in the right witness supports at all midpoints in the left witness support. Include local base endpoints when applicable. Let $cal(E)_x$ be the union of these endpoints and the boundary list. Set $cal(E)_x = diameter$ when $X_u \( x \) = 0$. Unused or invalid clean descriptors may enlarge this set. Actual candidates must still satisfy their wrap tests and all transformed source, midpoint, and terminal memberships; every error estimate below retains the memberships needed for its child metrics.

#thm([Lemma 9.3.])[
  (Size and independence of the envelope).  #emph[The set $cal(E)_x$ is independent of the present salt and has size at most $2^(C_E h_(*))$ for a fixed $C_E$. All clean nondefault representatives in the small groups belong to this set. Consequently, conditional on the other data, 
#[#set math.equation(numbering: n => "(9.5)")
 $ Pr \[ upright("two distinct IDs in ") cal(E)_x upright(" have the same key") \] lt.eq C thin 2^(2 C_E h_(*)) B^(- 1 \/ 2) . $ <eq:fp-envelope-collision>]

]
] <lem:fp-envelope>

#proof[
  Each fixed variant is independent of the present salt and leaves it unchanged. Lemma 40 therefore makes its clean witness supports $cal(G)_b$-measurable. We use these supports as sets of actual IDs, not the order of a port enumeration. At a group of slack $d$ there are $2^(O \( d \))$ immediate descriptors, including variants, difference parts, and copy choices. The number of endpoints contributed by a direct witness is bounded. A two-factor path contributes a bounded number of left witness midpoints and, for each, a bounded number of right witness endpoints. Summing over the dyadic groups with $d lt.eq 2 h_(*)$ and adding the boundary list proves the size bound. No incoming bound on a clean witness is used here.
  Clean exposed ports lie in their clean witness supports. Apart from the boundary representatives, exact updates can therefore create nondefault values only at the included endpoints. Compression maps all untouched default positions to the new default. Any extra exact-default slots in a shortlist may be omitted when describing its full array. This proves the representative claim. Equation (9.5) is now the pair union bound from Lemma 39, conditional on the fixed envelope. ◻
]

Let $cal(F)_x$ be the event that some valid actual candidate in the small groups has endpoint outside $cal(E)_x$, whether or not its increment is zero. As representatives are only carried forward or chosen among new candidates, all actual representatives stay in the envelope outside this event. This includes default-valued representatives: they start in the full boundary list or inherit a candidate endpoint. Dummy copies used to compute ranks are not new real representatives. Thus omitting an exact-default clean slot when describing its full array does not omit an actual address from the collision analysis.

#thm([Lemma 9.4.])[
  (Charging an escaped candidate).  #emph[Suppose actual–clean child discrepancies at budget $m$ have their prescribed metric bounds $2^(- p_m) lambda_m$. The contribution of $cal(F)_x$ to any bounded final pre-incoming row output has norm at most 
#[#set math.equation(numbering: n => "(9.6)")
 $ 2^(- p) sum_(d lt.eq 2 h_(*)\
m in cal(I)_b \, med m lt.eq M - d) 2^(C d) lambda_m \, $ <eq:fp-escape-charge>]

 where the sum includes the finitely many dependency types and their descriptor multiplicities in its constant $C$. Equivalently, one may use the maximum of $lambda_m$ over the children of each slack group and increase $C$.]
] <lem:fp-escape>

#proof[
  An actual endpoint outside the envelope has an offending path factor. For a direct path its actual port is outside the clean witness support. For a two-factor path, either its actual left port is outside its clean witness support, or its midpoint lies in that support and its actual right port is outside the corresponding clean right witness support. At the offending port the actual witness is one and the clean witness is zero. Thus the indicator of this event is at most the $s$-th power of their root discrepancy there. Union bounding over candidate paths gives a sum of such nonnegative powers. The unit-witness property holds also for exposed zero-weight ports; no lower bound on the candidate’s increment is being assumed.
  Each output under consideration is bounded and has bounded row support. The union of the two output supports is still bounded, by Equation (8.2). Hence its entire row error power on $cal(F)_x$ is at most a fixed multiple of $upright(bold(1))_(cal(F)_x)$. We charge this row-failure indicator, rather than the size of the offending increment. There is no endpoint sum left on the output side to pay for.
  The right-factor charge is the case where the old start must be summed out. Fix a guessed variant and a two-factor path $x arrow.r z arrow.r y$. Change variables by its measure-preserving transformation, as in Lemma 21; in the following display all memberships, ports, and witness values are evaluated in that transformed environment. Write $e_R \( z \, y \)$ for the root discrepancy of the two right witnesses and $cal(P)_L^(upright("ac"))$ for the actual left exposed-port relation. The candidate’s validity retains $X_u \( x \)$, $Z_f \( z \)$, and the right child’s endpoint membership $Y_(a') \( y \)$. Dropping only surplus guards, the right-port contribution is at most a constant times
  #[#set math.equation(numbering: n => "(9.7)")
   $ & 1 / N bb(E) sum_x frac(X_u \( x \), u) sum_(z : \( x \, z \) in cal(P)_L^(upright("ac"))) Z_f \( z \) sum_(y : Y_(a') \( y \) = 1) \| e_R \( z \, y \) \|^s\
 & #h(2em) lt.eq frac(K_c, N u) bb(E) sum_z Z_f \( z \) sum_(y : Y_(a') \( y \) = 1) \| e_R \( z \, y \) \|^s = K_c f / u thin frak(d)_(f \, a') \( W_R^(upright("ac")) \, W_R^(upright("cl")) \)^s . $ <eq:fp-actual-incoming>]
  The middle inequality uses the incoming cap of the #emph[actual] left port relation. It does not use a clean incoming cap. The right task’s tuple is independent of $x$, so the same discrepancy is being summed when the old start is removed. This condition is necessary for the displayed equality with the right metric. For the fixed variant and copy part, the right tuple has only the prescribed task parameters and transformed environment. The midpoint $z$ is its vertex argument, and the old source $x$ is not a parameter. Its final gate and column queries use that same effective tuple, rather than the ancestral descriptor that happened to discover the entry.
  For a direct or left offending port, sum the child’s witness discrepancy over its own row and endpoint domain; the bounded number of possible right ports incurs only a fixed factor. Projected paths are partitioned by the fixed copy symbols, with constant multiplicity. Normalization and preparation dependencies make the same direct witness comparison. If a candidate arose from a narrower terminal slice, its validity mask may be dropped in this row-event estimate. Thus no factor $pi_a \/ pi_t$ is incurred. In contrast, the transformed source hit cannot be omitted before the change of variables and the incoming-cap sum; it has been retained in Equation (9.7).
  At slack $d$, scale ratios, variants, and immediate path counts cost at most $2^(O \( d \))$, as in Lemma 30. The possible reset factor in Equation (9.7) is absorbed by the precision gain. Admissible row tasks have $u lt.eq f$, as specified in Section 5. Equation (7.8) gives, after the scale-dependent $O \( d \)$ terms,
  $ p_m & gt.eq p - O \( d \) + 1 / 2 log_2 \( f \/ u \) \,\
\( f \/ u \)^(1 \/ s) 2^(- p_m) & lt.eq 2^(- p + O \( d \)) \( f \/ u \)^(1 \/ 8 - 1 \/ 2) lt.eq 2^(- p + O \( d \)) . $
  Take $s$-th roots and use Minkowski to sum the charges. A child below $M_b$ is identical in the two versions and contributes zero. All remaining children satisfy $m lt.eq M - d$ and belong to $cal(I)_b$, which proves Equation (9.6). ◻
]

=== 9.4 Bucket algebra and the collision charge <bucket-algebra-and-the-collision-charge>

The escape estimate leaves rows whose candidates stay in $cal(E)_x$. On these rows we separate child discrepancies from collisions among the clean endpoints. We compare full arrays with their defaults, so different shortlist presentations require no extra error term. The following observation explains the key update rule.

#thm([Lemma 9.5.])[
  (Only increments are aliased).  #emph[Consider one small group on $cal(F)_x^c$. Let $Delta_(upright("ac")) \( y \) \, Delta_(upright("cl")) \( y \)$ be its unaliased increments, namely its true-ID sums using actual and clean children, respectively. Let $k_d lt.eq 2^(C d)$ bound its number of immediate descriptors, and let $cal(C)_x$ denote a collision on $cal(E)_x$. The discrepancy between the actual bucket-distributed increment and the clean true-ID increment is at most 
#[#set math.equation(numbering: n => "(9.8)")
 $ \( k_d + 1 \) (sup_y \| Delta_(upright("ac")) \( y \) - Delta_(upright("cl")) \( y \) \| + upright(bold(1))_(cal(C)_x) sup_y \| Delta_(upright("cl")) \( y \) \|) $ <eq:fp-bucket-bound>]

 in sup norm, simultaneously for both channels. The old full-array discrepancy is added to this bound with coefficient one.]
] <lem:fp-buckets>

#proof[
  When all envelope keys are distinct, the rule gives exactly the actual true-ID increment: each old occurrence is updated at its own ID, and each genuinely new ID has its own bucket. Thus the discrepancy is simply $Delta_(upright("ac")) - Delta_(upright("cl"))$.
  When there is a collision, each updated representative receives a sum of increments at at most $k_d$ distinct actual addresses. Its magnitude is at most $k_d sup_y \| Delta_(upright("ac")) \( y \) \|$. At positions not updated it is zero. At either type of position subtracting the clean increment costs at most a further $sup_y \| Delta_(upright("cl")) \( y \) \|$. Apply
  $ sup_y \| Delta_(upright("ac")) \( y \) \| lt.eq sup_y \| Delta_(upright("ac")) \( y \) - Delta_(upright("cl")) \( y \) \| + sup_y \| Delta_(upright("cl")) \( y \) \| $
  to obtain Equation (9.8). This also covers an increment duplicated at several old representatives and a missing increment at an unchosen new representative.
  At no point are old values combined or moved to a different ID. An unlisted old position has exactly the old default, and a newly selected representative starts with that value. Therefore the full-array comparison before compression is the old discrepancy plus the increment discrepancy just bounded. There is no term involving the height of an old value multiplied by a collision indicator. ◻
]

In applying this lemma to a group, combine contributions at equal actual endpoints #emph[within each paired difference] before measuring its clean height. At a fixed endpoint and original generator word, the outer slice and wrap tests are the same for budgets $m$ and $m - 1$. Their constituent port sets may differ, but each set contains all nonzero entries and enumerates each actual ID pair once; an absent entry contributes zero. Their true-ID sums are therefore exactly the two terms of the paired difference. Subtracting the same stochastic true-atom term from both sides, as in Lemma 30, preserves its cancellation. One can then sum the resulting sup bounds over difference layers. This remains legitimate if a first-bucket representative is chosen across several layers: the proof of Lemma 43 applies to their total increment, and the triangle inequality bounds the total by the sum of the paired bounds. A descriptor with zero increment contributes only to $k_d$ in this bound. It may affect representative selection, which is already covered by Lemma 43 and the escape event.

#thm([Lemma 9.6.])[
  (Direct cost of collisions).  #emph[The direct collision contribution to any final pre-incoming output has norm at most 
#[#set math.equation(numbering: n => "(9.9)")
 $ 2^(- p) thin 2^(C h_(*)) B^(- 1 \/ \( 2 s \)) \, $ <eq:fp-direct-charge>]

 for a fixed $C$ independent of $D_1 \, D_2 \, epsilon.alt$ introduced below. All remaining contributions on $cal(F)_x^c$ are bounded by actual–clean child discrepancy norms with an amplification at most $2^(C d)$ at slack $d$.]
] <lem:fp-direct>

#proof[
  For each small dyadic group, let $Delta_d^(upright("cl") \, nu) \( x \, y \)$ be its complete clean true-ID increment in channel $nu in { 1 \, 2 }$, including any exact base term assigned to that group. Take an absent second channel to be zero, and choose a deterministic descriptor bound $k_d lt.eq 2^(C d)$. By Lemma 30, the clean paired increments at a group of slack $d$ obey their crude absolute estimates in the retained endpoint metric. These estimates hold for each fixed valid variant after its measure-preserving change of variables. Counting variants and summing difference layers by the triangle inequality costs $2^(O \( d \))$, without using walk contraction. Within each paired layer the true-ID cancellation is performed before this inequality is applied. If a local unpaired base term occurs in a small group, its first-group slack satisfies $M = O \( d \)$, so the same crude bound holds in its normalized raw units. Since $sup_y \| Z_y \|^s lt.eq sum_y \| Z_y \|^s$ over actual ID positions, the row norm of $max_nu sup_y \| Delta_d^(upright("cl") \, nu) \( x \, y \) \|$ is at most $2^(- p + O \( d \))$.
  Lemmas 32 and 37, together with Equation (8.7), propagate an input discrepancy at slack $d$ to the final array with a factor polynomial in $d + 1$. At each step the discrepancy is measured between the clamped full arrays, including their defaults. The next bucket increment is compared by Lemma 43; compression then applies its uniform Lipschitz bound and the common clamp cannot enlarge the discrepancy. This recurrence does not require their later bucket distributions or stored lists to agree. Root-Lipschitz row functions and bounded final support then give the same type of bound for the output metric. Choose fixed $C_P \, A_P$ so that $C_P \( d + 1 \)^(A_P)$ bounds this propagation. For a retained row define
  $ H_x = C_P sum_(d lt.eq 2 h_(*)\
d upright(" a group slack")) \( d + 1 \)^(A_P) \( k_d + 1 \) max_nu sup_y \| Delta_d^(upright("cl") \, nu) \( x \, y \) \| . $
  Set $H_x = 0$ when $X_u \( x \) = 0$. This quantity bounds the propagated clean-height terms in Equation (9.8). The preceding estimates give
  $ parallel H parallel_(upright("row") \, u \; s) lt.eq 2^(- p + C_0 h_(*)) . $
  All increments defining $H_x$ are clean, and its other factors are deterministic. Thus $H_x$ and $cal(E)_x$ are $cal(G)_b$-measurable. Conditioning on this sigma-field gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(C)_x) H_x^s divides cal(G)_b #scale(x: 120%, y: 120%)[\]] = H_x^s Pr \( cal(C)_x divides cal(G)_b \) lt.eq C thin 2^(2 C_E h_(*)) B^(- 1 \/ 2) H_x^s . $
  The row membership $X_u \( x \)$ is also $cal(G)_b$-measurable. Integrating the last inequality in the row measure therefore yields
  $ parallel upright(bold(1))_(cal(C)) H parallel_(upright("row") \, u \; s)^s & lt.eq C thin 2^(2 C_E h_(*)) B^(- 1 \/ 2) parallel H parallel_(upright("row") \, u \; s)^s . $
  Taking roots proves Equation (9.9) after enlarging $C$. We have not conditioned on $cal(F)_x^c$ in this independence calculation: the actual error there is bounded by $upright(bold(1))_(cal(C)_x) H_x$, which is then integrated on the whole space. Conditioning on the salt-dependent stay-inside event is unnecessary and could destroy the stated independence.
  For the first term of Equation (9.8), split products using bounded-factor differences, actual or clean row caps, and the actual or clean incoming cap of the represented two-way factor, exactly as in Lemma 30. These are comparisons of unaliased sums using the respective children; they make no assumption about key success or independence of child errors. Fixed valid variants, scale costs, and counts are all at most $2^(O \( d \))$, with the possible source-release factor absorbed by the same precision gain as in Equation (9.7). Compression propagation is again absorbed in $2^(C d)$. This proves the remaining assertion. ◻
]

=== 9.5 Closing the coupled induction <closing-the-coupled-induction>

#thm([Proposition 9.7.])[
  (Uniform block coupling).  #emph[The fixed constants can be chosen so that, for every task of budget $M in cal(I)_b$ and precision $p$, each prescribed actual–clean output discrepancy, including every pre-incoming score and witness, is at most 
#[#set math.equation(numbering: n => "(9.10)")
 $ 2^(- p) lambda_M \, #h(2em) lambda_M = 2^(- D_1 h_(*) + D_2 \( M - M_b \)) . $ <eq:fp-lambda>]

 The same assertion holds for the ordinary vector metrics. Adding these discrepancies to the clean estimates proves the target error bounds for the actual tables and vectors.]
] <prop:fp-coupling>

#proof[
  Perform strong induction on the statistical budget, simultaneously for the actual target estimates, the block-clean target estimates needed at that budget, and Equation (9.10). An inactive task returns the same zero outputs and empty paths in both versions, so its coupling error is zero. Lower-block children are identical in a block coupling and already have their actual target bounds. Same-block clean children have the clean target bounds at smaller budgets. Therefore Lemma 40, the prefix estimate, and the compression analysis give the clean active target bounds with the spare constants in Proposition 38.
  For the coupling, Lemmas 42–44 bound the pre-incoming quantities. Incoming gates are then compared by their rank and root-Lipschitz bounds. In their multiplier effect, restrict to the union of the final supports of the two tables; these have bounded incoming multiplicity. Thus Lemma 18 costs only a fixed factor on pre-incoming errors. Its separately queried column vectors have a positive constant budget drop and their $f \/ u$ metric factor is covered by their precision gain. Vector raw sums have no endpoint grouping, but their same-block children may differ. The same crude individual-variant comparisons and nonexpansive clamps bound those differences. Detector rank comparisons are already part of the assembly estimate. No simultaneous key-success event over an incoming search is required.
  Collect the finite number of output types and absorb their fixed assembly factors into one fixed exponent $C$. For a child budget $m in cal(I)_b$ used at group slack $d$, we have
  #[#set math.equation(numbering: n => "(9.11)")
   $ lambda_m = lambda_M 2^(- D_2 \( M - m \)) lt.eq lambda_M 2^(- D_2 d) . $ <eq:fp-child-gain>]
  For a separate post-assembly query with constant positive budget drop, use $d = 1$ in this inequality. Replacing the dyadic group sum by the larger sum over positive integers, all coupled child charges are at most
  #[#set math.equation(numbering: n => "(9.12)")
   $ 2^(- p) lambda_M sum_(d = 1)^(2 h_(*)) 2^(- \( D_2 - C \) d) . $ <eq:fp-recurrence>]
  Counts of budget layers and dependency types are included in $2^(C d)$. Groups with larger slack have identical children and contribute zero. Together with Equation (9.9), this is the complete coupling recurrence.
  Choose $D_2 > C$ so large that the infinite geometric sum in Equation (9.12) is at most $1 \/ 4$. Then choose $D_1 > D_2 + 1$. Finally choose rational $epsilon.alt > 0$ so small that
  #[#set math.equation(numbering: n => "(9.13)")
   $ frac(1, 2 s epsilon.alt) > C + D_1 + 2 . $ <eq:fp-epsilon>]
  Since $h_(*) lt.eq epsilon.alt log_2 B$, the direct relative charge satisfies
  $ 2^(C h_(*)) B^(- 1 \/ \( 2 s \)) lt.eq 2^(- \( 1 \/ \( 2 s epsilon.alt \) - C \) h_(*)) lt.eq 1 / 4 thin 2^(- D_1 h_(*)) lt.eq 1 / 4 lambda_M \, $
  after increasing the fixed minimum $B$ to absorb any fixed coefficient. The child and direct charges fit within Equation (9.10), even with room for fixed norm conventions already included in $C$.
  Moreover $0 lt.eq M - M_b < h_(*)$ implies
  $ lambda_M lt.eq 2^(- \( D_1 - D_2 \) h_(*)) . $
  This is uniformly as small as required after the same minimum-size padding. The triangle inequality therefore adds the coupling bound to the spare clean active bound, for example $C_b 2^(- p) \/ 2$, without exceeding $C_b 2^(- p)$. Inactive target bounds are the previously fixed bounded-range bounds. This completes all three inductions.
  The order of choices is consequential. Fix the analytical hierarchy, table thresholds, and trivial-case bound first. Choose the precision and cutoff constants for the mean comparisons; then the compression floors, capacities, and walk lengths so the clean sums converge with their spare coefficients. Fix clamping ranges and the crude exponents in the fixed-variant comparisons next. These choices determine $C$. Only after them choose $D_2 \, D_1 \, epsilon.alt$ as above. Thus reducing $epsilon.alt$ to obtain the direct collision gain does not alter an earlier clean-coefficient requirement.
  Later choices of the common stage-size bound, top-budget coefficient, and environment-field exponent do not change this crude exponent $C$. Immediate descriptor counts depend on relative slack, fixed support bounds and fixed walk length. The sampler gap is uniform in both field size and the length of its single free-bit component. Likewise, an enlargement of the fixed identifier-length coefficient only changes the polynomial-evaluation collision term in Lemma 39 to at most $2 c_(upright("ID")) \/ B^2$; increasing the fixed minimum $B gt.eq c_(upright("ID"))$ bounds it by $2 \/ B$. These enlargements can therefore be absorbed after $D_2 \, D_1 \, epsilon.alt$ have been fixed. ◻
]

#thm([Theorem 9.8.])[
  (Error bounds for the actual estimators).  #emph[For every allowed task, with precision $p$ defined in Equation (7.7), the actual row outputs, including the pre-incoming scores and support witnesses, satisfy 
$ frak(d)_(u \, a) \( macron(H) \, H \) lt.eq C_b 2^(- p) . $

 The clipped vectors have the corresponding ordinary error bound. In particular, every allowed reward query satisfies 
#[#set math.equation(numbering: n => "(9.14)")
 $ 1 / N bb(E)_sigma sum_(x in V_l) frac(X_u \( x \), u) \| macron(W)_l \( x \) - W_l \( x \) \|^s lt.eq C_b^s 2^(- s p) . $ <eq:fp-reward-bound>]

 These estimates are uniform over the allowed task parameters and stage, and the constants are independent of the input and of $B$.]
] <thm:fp-estimators>

#proof[
  Proposition 45 adds the actual–clean discrepancy to Proposition 38 with its spare constant. The inactive-task bounds follow from the fixed bounded ranges and supports. The induction in Proposition 45 includes both kinds of tasks and every prescribed output. Applying its ordinary vector statement to $W_l$ and taking the $s$-th power gives Equation (9.14). ◻
]

=== 9.6 Catalytic key equality <catalytic-key-equality>

The key is short, but retaining a $log B$-bit key or index at each tight recursive frame would still be too costly. The following exact identity gives a comparison with only a constant number of endpoint excursions. Its use in the space accounting requires the restoring endpoint interfaces constructed below. The cancellation of arbitrary initial contents also appears in transparent programs for catalytic computation #cite(label("BuhrmanCleveKouckyLoffSpeelman2014")) Section 3. Here the shared bit vector is included in the ordinary work-space bound.

#thm([Lemma 9.9.])[
  (Restoring equality test).  #emph[Let $V in { 0 \, 1 }^B$ be a shared vector with arbitrary initial contents. Suppose an excursion to either of two deterministically specified endpoints returns the cursor, and its path and result are independent of the incoming contents of $V$. Such excursions may use nested procedures which restore $V$. There is a procedure which xors the bit $upright(bold(1))_(k \( v \) = k \( w \))$ into a local result bit, restores $V$, and needs only constant local data across four endpoint excursions.]
] <lem:fp-catalytic>

#proof[
  Starting with result bit $r_0$, perform the following four excursions: flip $V_(k \( v \))$; xor $V_(k \( w \))$ into the result; flip $V_(k \( v \))$ again; xor $V_(k \( w \))$ into the result again. The key is evaluated only at the endpoint currently visited. If $V^0$ is the incoming vector, the first read equals $V_(k \( w \))^0 xor upright(bold(1))_(k \( v \) = k \( w \))$ and the second equals $V_(k \( w \))^0$. Thus the final result is $r_0 xor upright(bold(1))_(k \( v \) = k \( w \))$ and both flips restore $V^0$.
  For nesting, use induction on the well-founded procedure order. A nested call sees some arbitrary incoming vector, restores precisely that vector, and returns a result independent of it. Hence the four outer endpoint paths and their keys are the same on repeated visits, even between the two outer flips. The terminal evaluation, read, or flip is a local operation with no further structural call. Only a phase and a result bit must survive across the excursions; a key index is recomputed at each visit in shared scratch. The result bit being accumulated is not used to choose either endpoint path. These facts give the induction invariant and the claimed local storage bound. ◻
]

For $d > 2 h_(*)$, exact bit-by-bit ID comparison is retained. A bit position then takes $O \( log B \) = O \( d \)$ suspended bits, with constants allowed to depend on the already fixed $epsilon.alt$. For small slack, Lemma 47 avoids that per-frame index. The shared vector itself occupies $B$ bits and, by the lemma, may be reused by all nested comparisons. This algebra establishes restoration; the controller and traversal section supplies the deterministic excursion and call-order interfaces needed to apply it.

The endpoint action evaluates the key with the invoking comparison’s effective salt, even when the excursion visits a lower-budget table. It makes no further access query and does not choose or alter the excursion. Thus the lower path remains independent of later salts. Lemmas 66 and 68 implement this separation for all restoring accesses, including inverse queries.

== 10 Finite numerical queries with bounded suspended storage <sec:arith>

The preceding sections define finite estimator tables and bound their statistical errors. We now compute digits of those estimator values. For a fixed table tuple, including its statistical budget, the structural conventions are fixed and each entry has one exact mathematical value. Increasing the numerical clock requests a later digit of that same value. Each request is a finite deterministic computation.

A query returns one bounded digit. During its evaluation, the space needed by a suspended caller must be bounded by the size of its structural descriptors and a constant times the decrease from its output clock to the requested operand clock. An operand clock may exceed the output clock by an amount proportional to descriptor size; the structural term also pays for this overshoot. These differences will telescope when arithmetic queries are nested inside graph procedures. Thus the relevant question is which data remain live at each operand request.

=== 10.1 Streams, records, and uniformity <streams-records-and-uniformity>

We use integer clocks $t \, j gt.eq 0$. Known binary scales are separated from numerical values, so a normalized value belongs to $\[ - 1 \, 1 \]$. The fixed digit alphabet is

$ cal(A) = { - 6 \, - 5 \, dots.h \, 5 \, 6 } . $

Every digit is encoded by a fixed number of bits. An operand stream $\( x_j \)_(j gt.eq 0)$ denotes the exact real number

#[#set math.equation(numbering: n => "(10.1)")
 $ x = sum_(j gt.eq 0) x_j 2^(- j) \, #h(2em) x_j in cal(A) . $ <eq:arith-stream>]

In particular, for its truncation $x^(\[ K \]) = sum_(j = 0)^K x_j 2^(- j)$,

#[#set math.equation(numbering: n => "(10.2)")
 $ \| x - x^(\[ K \]) \| lt.eq 6 thin 2^(- K) . $ <eq:arith-tail>]

The stream need not be a usual binary expansion, and no uniqueness of the expansion is required. Redundant signed-digit representations have a long history in arithmetic #cite(label("Avizienis1963")). The redundancy lets consecutive finite approximations define an exact stream even when they use different truncations.

An arithmetic root has public parameters, its clock, and a description of its operand interfaces. We require these parameters to be regenerable from the outer controller records without operand or graph queries. They are fixed inputs to each numerical computation; their full binary encodings are not copied at every gate. An operand label specifies its interface and descriptor; it never specifies an unknown vertex address from a previous cursor position.

The following lemma reduces each digit query to a fixed number of residue bits.

#thm([Lemma 10.1.])[
  (Exact streams from approximation residues).  #emph[Suppose $\| z \| lt.eq 1$ and, for each $t gt.eq 0$, a deterministic integer $N_t \( z \)$ satisfies 
#[#set math.equation(numbering: n => "(10.3)")
 $ \| N_t \( z \) - 2^t z \| < 2 . $ <eq:arith-approximation>]

 Set 
#[#set math.equation(numbering: n => "(10.4)")
 $ z_0 = N_0 \( z \) \, #h(2em) z_t = N_t \( z \) - 2 N_(t - 1) \( z \) quad \( t gt.eq 1 \) . $ <eq:arith-difference-digit>]

 Then $z_t in cal(A)$ and these digits represent $z$ exactly. For any fixed integer $q gt.eq 4$, each output digit is determined by the required $N_t$ residues modulo $2^q$.]
] <lem:arith-residue-stream>

#proof[
  Writing $e_t = N_t - 2^t z$ gives $z_t = e_t - 2 e_(t - 1)$ for $t > 0$, hence $\| z_t \| < 6$; the weaker alphabet bound $\| z_t \| lt.eq 6$ is convenient throughout. At place zero, $\| N_0 \| < 3$, so $\| N_0 \| lt.eq 2$. The partial sum through place $T$ is $2^(- T) N_T$, which tends to $z$ by Equation (10.3). Finally, reduction modulo $2^q$ is injective on the possible signed digits because $2^q > 12$. Thus the signed difference can be recovered from the two residues without forming the full integers $N_t$. Concretely, for $t > 0$ compute $\( N_t med mod med 2^q \) - 2 \( N_(t - 1) med mod med 2^q \)$ modulo $2^q$, then use the fixed finite table which sends each occurring residue to its unique representative in $cal(A)$. At $t = 0$, decode the residue of $N_0$ in the same way. This final decoding has constant storage and introduces no comparison of unknown exact real numbers. ◻
]

The integer $N_t$ is always defined before taking its residue. Different places may use different truncations or finite circuits. Only determinism and Equation (10.3) are required; consistency between the finite approximations is supplied by Equation (10.4). In particular, when a digit at $t$ uses $N_(t - 1)$, the latter is evaluated by its own place-$\( t - 1 \)$ definition.

We compute the required residues by finite Boolean circuits. To bound what survives an operand query, we evaluate those circuits from paths of child choices and regenerate their absolute addresses as needed. Here $d gt.eq 1$ measures the size of the immediate structural descriptors; in the application it is the current group’s slack.

The local record of a suspended numerical query contains every local bit that must be retained across an operand query: its binary gate path, return modes, pending bounded results, stored descriptor choices, and any explicitly specified retained word. The input and master choice, the common vertex cursor, and one reusable scratch area are shared facilities. Temporary gate addresses, digit places and scan counters may occupy scratch while they are being computed. Any such data needed after a recursive graph query must either be in the charged local record or be reconstructible from the root parameters and that record. An operand-dependent word retained across the query is charged even if it was originally formed in scratch.

In particular, reconstructing an absolute digit place may use a binary counter in scratch, while the suspended record stores only the choices needed to recover that place. The next lemma makes this distinction precise for the finite circuits used below.

#thm([Lemma 10.2.])[
  (Evaluation from regenerated gate addresses).  #emph[Consider a finite Boolean circuit of bounded fan-in, with a specified output gate. Conditional gates may evaluate their selector first and then only their selected branch. Suppose the type and immediate predecessors of a gate, or its operand label and digit place if it is an input gate, can be computed from the root parameters and a path of child choices from the output gate. Suppose these computations use $O \( B + t + d \)$ scratch bits and make no operand or graph queries. Then depth-first evaluation retains $O \( 1 \)$ bits per gate on its current path, and requires no saved absolute gate address per gate. Its suspended record above an operand input has length at most a constant times the length of that path, plus any explicitly retained root-local record.]
] <lem:arith-gate-evaluation>

#proof[
  At a gate, save its next-child or return mode and the already computed Boolean input, if any. At a conditional gate also save the selected branch bit. The bounded fan-in makes this a constant-size record. To locate the next child, scan the saved path from its root and regenerate successive gate descriptions in scratch. The final description determines the next child choice. On return, its Boolean result is combined with the saved bit and the local record is popped. All temporary addresses and scan counters are discarded before an operand query; a later scan recreates them from the same root and saved choices. Circuit acyclicity gives termination. This is an evaluation of the circuit unfolded into a formula; repeated gates are recomputed, so no array of previously computed values is stored. ◻
]

=== 10.2 Truncations, comparisons, and binary arithmetic <truncations-comparisons-and-binary-arithmetic>

#thm([Lemma 10.3.])[
  (Finite comparisons and bounded elementary operations).  #emph[The normalized operations of taking a pair average, a maximum or minimum, and a fixed binary shift admit deterministic integers satisfying Equation (10.3). Their residue procedures, for any fixed $q$, have the following properties. There are constants $C_0 \, C_1$ such that an operand place $j$ obeys $j lt.eq t + C_0$, its suspended local record has length at most $C_0 + C_1 \( t - j \)$, and the intrinsic local space is $O \( t + 1 \)$. Fixed finite compositions of these normalized operations have the same bounds, with enlarged constants. Fixed Boolean operations on returned digit codes, including sign decoding and conditional selection of code bits, add only constant local overhead.]
] <lem:arith-elementary>

#proof[
  First consider comparing two truncations through $K = t + h$, where $h$ is a sufficiently large fixed integer. Their difference digits have magnitude at most 12. Scanning from place zero to $K$, update a signed prefix by $p arrow.l 2 p + delta$. While $\| p \| lt.eq 12$, retain $p$ exactly. Once $p > 12$ or $p < - 12$, retain only the corresponding absorbing sign state. This sign is correct for every finite continuation: the remaining suffix, in the current scale, has magnitude strictly less than 12. The state space is finite, so each transition has a fixed bounded-fan-in Boolean circuit. The sign at the end determines the exact order of the two finite truncations. The path from that sign bit to an input at place $j$ has length $O \( K - j + 1 \) = O \( t - j + 1 \)$.
  Let $v_t$ be the average, maximum, or minimum of the two truncations, and put $N_t = floor.l 2^t v_t floor.r$. Each operation is 1-Lipschitz for the sup norm on its operands. Consequently $\| v_t - v \| lt.eq 6 thin 2^(- K)$, where $v$ is the corresponding exact output. Choosing $h$ so that $6 thin 2^(- h) < 1 \/ 2$ gives $\| N_t - 2^t v \| < 3 \/ 2$.
  To obtain $N_t med mod med 2^q$, only a fixed number of low places of the selected truncation are needed. More explicitly, at scale $2^K$, terms of input place $j lt.eq t - q$ are multiples of $2^(q + h)$. Modulo this modulus the remaining $q + h$ places suffice. For an average with integer input prefixes $A_K \, B_K$ at scale $2^K$, use $N_t = floor.l \( A_K + B_K \) \/ 2^(h + 1) floor.r$. Its residue needs modulus $2^(q + h + 1)$ and one additional retained place: only places $j lt.eq t - q - 1$ can be omitted. The finite number of remaining digits can be added and shifted by a constant-size Boolean circuit. A maximum or minimum first uses the comparison bit to select these residue bits. Its long comparison branch has the path bound proved above, and its residue branch reaches only places within a fixed distance of $t$. A fixed shift changes these places by a fixed amount. Fixed normalization factors are handled in this way whenever an intermediate range exceeds $\[ - 1 \, 1 \]$.
  The topology of the comparison chain and the low-residue circuits depends only on the root clock, the fixed margins, and the gate path. Regenerating a place by replaying that path needs no saved binary place counter at each transition. Lemma 49 therefore gives the suspended-space bounds. Their longest paths have length $O \( t + 1 \)$.
  For composition, use one common coefficient of $\( t - j \)$ for the finite primitive list. Increasing such a coefficient by $Delta$ requires increasing its constant term by at most $Delta C_0$, because the operand overshoot is at most $C_0$. With these common coefficients, the clock differences telescope along the composed path. The finite number of constant terms remains a constant. ◻
]

We will also use the following explicit Boolean arithmetic facts. A carry bit in binary addition is described by a generate/propagate pair $\( g \, p \)$. Composition of adjacent intervals is the associative operation

$ \( g_2 \, p_2 \) compose \( g_1 \, p_1 \) = \( g_2 or \( p_2 and g_1 \) \, med p_2 and p_1 \) . $

Balanced trees of these pairs give every carry in $O \( log \( W + 1 \) \)$ depth for $W$-bit words. A balanced tree adding $R$ such words modulo $2^W$ has depth

#[#set math.equation(numbering: n => "(10.5)")
 $ O #scale(x: 120%, y: 120%)[\(] log \( R + 1 \) log \( W + 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-adder-depth>]

The trees can be padded by zero words to powers of two, so their gate addresses are computable by ordinary index arithmetic. For counts of $R$ Boolean bits one can do better: constant-depth full adders replace three same-width rows by two rows of their sum, with carries placed in the next column. In $O \( log \( R + 1 \) \)$ rounds only two rows remain. The word width is $O \( log \( R + 1 \) \)$; a final carry computation gives total depth $O \( log \( R + 1 \) \)$. These constructions use bounded fan-in throughout.

=== 10.3 Multiplication by minimum-index bands <multiplication-by-minimum-index-bands>

Grouping products by their smaller input index leaves a gap between the output clock and the requested input clocks; that gap pays for the retained circuit path within each band.

#thm([Lemma 10.4.])[
  (Multiplication).  #emph[For normalized exact input streams $x$ and $y$, multiplication has all the conclusions of Lemma 50. In particular, its suspended storage at an operand place $j$ is $O \( 1 \) + c \( t - j \)$, despite the potentially long product expansion.]
] <lem:arith-multiplication>

#proof[
  Fix $q$ and write $A = 6$. Partition ordered pairs $\( i \, j \)$ of nonnegative places into a zero band, where $min \( i \, j \) = 0$, and positive bands
  $ cal(P)_D = { \( i \, j \) : D lt.eq min \( i \, j \) < 2 D } \, #h(2em) D = 1 \, 2 \, 4 \, dots.h . $
  Set $h_0 = h_compose$ for the zero band and $h_D = h_compose + floor.l D \/ 4 floor.r$ for positive bands. The fixed integer $h_compose$ will be chosen below. Retain in band $D$ only pairs with $i + j lt.eq t + h_D$, and let
  #[#set math.equation(numbering: n => "(10.6)")
   $ S_D = sum_(\( i \, j \) in cal(P)_D\
i + j lt.eq t + h_D) x_i y_j 2^(t + h_D - i - j) . $ <eq:arith-band-integer>]
  For the zero band the same formula uses its defining pair set. These are mathematical integers; no bound on their full binary length is assumed in the residue computation.
  At any fixed diagonal $i + j = s$, a positive band contains at most $2 D$ ordered pairs. Indeed the smaller place has $D$ possibilities, and an off-diagonal pair has two orientations. The zero band has at most two pairs. Thus, in units of $2^(- t)$, the total omitted product terms have absolute sum at most
  #[#set math.equation(numbering: n => "(10.7)")
   $ E_(upright("omit")) lt.eq 2 A^2 sum_(D in { 0 \, 1 \, 2 \, 4 \, dots.h }) \( D + 1 \) 2^(- h_D) . $ <eq:arith-band-tail-error>]
  The geometric summation of the diagonal weights gives this bound also when the truncation threshold lies below the first possible diagonal. Both the series in Equation (10.7) and $sum_D 2^(- h_D)$ converge. Choose $h_compose$ sufficiently large that their displayed combined error bound, including coefficient $2 A^2$, is less than $1 \/ 2$.
  There are only finitely many nonempty retained bands. For a positive one, $2 D lt.eq t + h_D$, whence
  #[#set math.equation(numbering: n => "(10.8)")
   $ D lt.eq 4 / 7 \( t + h_compose \) . $ <eq:arith-last-band>]
  The left side of the nonemptiness condition grows monotonically faster than its right side along the dyadic bands. We may therefore stop at the last band satisfying this inequality, retaining empty bands within the finite prefix if necessary.
  Starting with the most distant retained band, define integers recursively by
  #[#set math.equation(numbering: n => "(10.9)")
   $ F_D = S_D + ⌊2^(h_D - h_(D^(+))) F_(D^(+))⌋ \, #h(2em) N_t = ⌊2^(- h_0) F_0⌋ \, $ <eq:arith-band-recursion>]
  where $D^(+)$ is the next band, and the last missing tail is zero. One internal floor, divided back to scale $2^t$, changes the sum by less than $2^(- h_D)$. Induction down the bands consequently shows that the difference between $2^(- h_0) F_0$ and the sum of all retained terms in scale-$t$ units is at most $sum_D 2^(- h_D)$. Equation (10.7) and the choice of $h_compose$ make the error before the final floor less than $1 \/ 2$. The final floor costs less than one more unit. Therefore Equation (10.3) holds for $z = x y$.
  We next implement Equation (10.9) using residues. At band $D$ use modulus $2^(q + h_D)$. An integer term in Equation (10.6) with $i + j lt.eq t - q$ is a multiple of this modulus and can be omitted from the circuit. It remains present in the mathematical integer $S_D$. Only the diagonals
  #[#set math.equation(numbering: n => "(10.10)")
   $ t - q < i + j lt.eq t + h_D $ <eq:arith-relevant-diagonals>]
  need to be processed, giving $O \( \( D + 1 \) \( h_D + q + 1 \) \) = O \( \( D + 1 \)^2 \)$ candidate pairs.
  Signed floor shifts are well defined on the required residues. For $h' gt.eq h$ and $a - b = k 2^(q + h')$,
  #[#set math.equation(numbering: n => "(10.11)")
   $ ⌊a / 2^(h' - h)⌋ - ⌊b / 2^(h' - h)⌋ = k 2^(q + h) . $ <eq:arith-signed-residue-floor>]
  This identity holds for all signed integers $a \, b$. Thus a next-band residue modulo $2^(q + h')$ supplies the correctly floor-shifted tail modulo $2^(q + h)$. Apply the same observation to the final shift by $h_0$ to obtain $N_t med mod med 2^q$. In the finite binary circuit, this shift just discards the lowest $h' - h$ bits of the canonical $\( q + h' \)$-bit residue. The displayed identity proves that this is valid also when the underlying integer is negative.
  For completeness, the finite gate structure can be indexed without storing an absolute operand place at each gate. For a positive band enumerate triples $\( r \, s \, o \)$, where $D lt.eq r < 2 D$, $t - q < s lt.eq t + h_D$, and $o in { 0 \, 1 }$. The triple supplies $\( r \, s - r \)$ if $s - r gt.eq r$ and $o = 0$; it supplies $\( s - r \, r \)$ if $s - r > r$ and $o = 1$; otherwise it supplies a zero term. This enumerates the relevant pairs exactly once. For the zero band use $r = 0$ with the same orientation rule. Negative candidate places are invalid and supply zero. The offsets $r - D$ and $s - \( t - q + 1 \)$ have $O \( log \( D + 2 \) \)$ bits. They and $o$ are obtained from paths in padded binary selection trees. The full places are then computed from the root clock in scratch.
  Each nonzero term is a constant-bit signed product $x_i y_j$, shifted into a word of width $W_D = q + h_D = O \( D + 1 \)$ and interpreted modulo $2^(W_D)$. A bit of this word is a fixed Boolean function of the two bounded digit codes, the bit index and the known shift; negative products use their ordinary residue, equivalently sign extension before reduction. Add these words and the shifted tail using Equation (10.5). A band contributes depth $O \( log^2 \( D + 2 \) \)$. Bit selection for the shifted tail is wiring and does not require evaluating a full tail word.
  The sum of these depths through the bands up to $D$ is $O \( log^3 \( D + 2 \) \)$, hence at most $C \( D + 1 \)$ for a fixed $C$. For an original input digit in a positive band, its partner place is at least $D$. Equation (10.10) gives
  #[#set math.equation(numbering: n => "(10.12)")
   $ j lt.eq t + h_D - D lt.eq t + h_compose - 3 / 4 D . $ <eq:arith-multiplication-latency>]
  Equivalently, $t - j gt.eq 3 / 4 D - h_compose$, so the full path cost through these bands satisfies
  $ C \( D + 1 \) lt.eq C (1 + 4 / 3 h_compose) + frac(4 C, 3) \( t - j \) . $
  This gives $C_0 + C_1 \( t - j \)$ with fixed constants. The zero band has constant depth and only constant overshoot. All its gate descriptions, term coordinates, bit positions and tail shifts are computable by replaying paths and doing integer index arithmetic from $t$ and $q$. Lemma 49 converts these depth bounds to suspended storage. Finally, Equation (10.8) bounds every intrinsic path and local word width by $O \( t + 1 \)$. ◻
]

=== 10.4 Reciprocals and the early-word convention <reciprocals-and-the-early-word-convention>

A prefix through roughly half the output clock makes the remainder in a first-order reciprocal expansion quadratically small. Releasing that prefix before later input queries keeps its long word from surviving a call with little remaining clock gap.

#thm([Lemma 10.5.])[
  (Reciprocal on a positive compact interval).  #emph[Fix constants $0 < a lt.eq b$. On inputs $x in \[ a \, b \]$, a reciprocal, after a fixed known normalization, has the same operand-clock, suspended-record, and intrinsic-space bounds as in Lemma 50. Its local record may contain an $O \( t + 1 \)$-bit word only while querying input places $j lt.eq floor.l t \/ 2 floor.r + O \( 1 \)$.]
] <lem:arith-reciprocal>

#proof[
  The input can first be normalized by a fixed binary scale. It is enough to prove the result with a fixed digit alphabet and fixed positive interval; all constants below may depend on $a \, b$. Choose a fixed power of two $C$ large enough that the desired output $z = 1 \/ \( C x \)$ lies in $\[ 0 \, 1 \]$ and that the coefficients below have absolute value at most one. Put
  $ k = floor.l t \/ 2 floor.r + c \, #h(2em) x^0 = x^(\[ k \]) \, #h(2em) e = x - x^0 \, $
  where $c$ is a sufficiently large fixed integer. By Equation (10.2), $\| e \| lt.eq 6 thin 2^(- k)$. Choosing $c$ first ensures $x^0 in \[ a \/ 2 \, 2 b \]$ and $\| e \| lt.eq 1$ at every $t$. Increasing $C$ if necessary gives bounded coefficients
  $ alpha = frac(1, C x^0) \, #h(2em) beta = - frac(1, C \( x^0 \)^2) . $
  The exact algebraic identity
  #[#set math.equation(numbering: n => "(10.13)")
   $ frac(1, C x) = alpha + beta e + frac(e^2, C \( x^0 \)^2 x) $ <eq:arith-reciprocal-taylor>]
  shows that the linear expression $T_t = alpha + beta e$ differs from $z$ by at most a fixed constant times $2^(- 2 k)$. Choose $c$ large enough that
  #[#set math.equation(numbering: n => "(10.14)")
   $ 2^t \| T_t - z \| lt.eq 1 / 4 quad upright("for every ") t gt.eq 0 . $ <eq:arith-reciprocal-remainder>]
  Clipping $T_t$ to $\[ - 1 \, 1 \]$ cannot increase this error; denote the clipped expression by $hat(T)_t$.
  For this fixed original $t$, the coefficients $alpha \, beta$ are exact rational numbers. Their digits are produced by integer arithmetic, as described below. The suffix $e$ has the exact stream with digit zero through $k$ and digit $x_j$ thereafter. Thus Lemmas 50 and 51 provide exact streams for $hat(T)_t$, using only a fixed number of normalized operations. Explicitly, form the product $beta e$, then the pair average $u = \( alpha + beta e \) \/ 2$, clip $u$ to $\[ - 1 \/ 2 \, 1 \/ 2 \]$ by a maximum and a minimum, and finally apply the fixed shift by 2. Every exported intermediate value is normalized, and the final value is $hat(T)_t$. Forming this expression introduces no additional reciprocal operation.
  Let $P_s \( hat(T)_t \)$ be the integer approximation furnished by those operations at place $s = t + 3$, and define
  #[#set math.equation(numbering: n => "(10.15)")
   $ N_t \( z \) = ⌊P_(t + 3) \( hat(T)_t \) \/ 8⌋ . $ <eq:arith-reciprocal-approximation>]
  The cutoff $k$ and the coefficients remain those of the original $t$, not those of $s$. Equations (10.3) and (10.14) give
  $ \| N_t \( z \) - 2^t z \| < 1 + 2 / 8 + 1 / 4 = 3 / 2 < 2 . $
  To obtain this integer modulo $2^q$, ask for the approximation $P_(t + 3)$ modulo $2^(q + 3)$ and use Equation (10.11).
  It remains to justify storage in the coefficient computations. The signed numerator of $x^0$ in units $2^(- k)$ has $O \( k + 1 \)$ bits. Form it by querying places $0 \, dots.h \, k$ and updating the integer prefix. The numerator, a place counter, and all data that must survive the next query are part of the local record. To return a coefficient digit of place $r$, numerator squaring and integer division require $O \( k + r + 1 \)$ bits. Here $r lt.eq t + O \( 1 \)$, because the enclosing expression has fixed depth and constant overshoot. After the input prefix is obtained, these integer computations make no further operand queries. Standard binary long multiplication and division, performed by bounded loops with their partial products or remainder, use only this linear number of bits. For $r > 0$, computing floors of the coefficient scaled at $r$ and $r - 1$ gives its exact difference digit; at $r = 0$ use the place-zero floor alone, as in Lemma 48. Clipping is unnecessary because the coefficients were normalized in advance.
  Every original-input query during this formation has $j lt.eq k lt.eq t \/ 2 + O \( 1 \)$. Hence
  #[#set math.equation(numbering: n => "(10.16)")
   $ t + 1 lt.eq C_2 + C_3 \( t - j \) $ <eq:arith-early-word-payment>]
  for fixed constants, at all such queries. The enclosing gate path also has length $O \( t + 1 \)$, so the complete suspended local record satisfies the required bound there. Equivalently, the coefficient branch is charged against the original reciprocal clock $t$, not against its possibly small coefficient digit place $r$.
  On a suffix branch with $j > k$, the coefficient word is absent. The Boolean evaluation asks for a coefficient digit at a separate leaf, returns its bounded code bits, and discards the coefficient word. If the other child of a gate subsequently asks for a late suffix digit, only the bounded pending bits and gate choices are retained. The path bound from the preceding arithmetic lemmas therefore gives $O \( 1 \) + c \( t - j \)$ also on this branch. Repeated coefficient requests rebuild the word. The parameter $k$ and the choice of coefficient are regenerated from the original $t$ and the saved gate path; no earlier cursor address is required. All intrinsic records have $O \( t + 1 \)$ bits. ◻
]

The coefficients in this proof are operand-dependent, even though they are rational once $x^0$ is known. They therefore do not qualify as public coefficient leaves. A coefficient request first forms its charged early prefix, then uses scratch for integer arithmetic, returns only the requested bounded digit, and releases that prefix before a suffix branch is evaluated. The original reciprocal clock $t$ remains regenerable throughout. This order of operations is the lifetime rule used in the suspended-record bound. In particular, $j lt.eq floor.l t \/ 2 floor.r + c$ gives the explicit payment $t + 1 lt.eq 2 \( t - j \) + 2 c + 1$ for the early word.

=== 10.5 Indexed ranks, sums, scales, and structural leaves <indexed-ranks-sums-scales-and-structural-leaves>

#thm([Lemma 10.6.])[
  (Indexed finite ranks).  #emph[Fix $kappa > 0$ and $d gt.eq 1$. Consider at most $2^(kappa d)$ normalized values, indexed by descriptors of length at most $kappa d$, and an order statistic specified by an $O \( d \)$-bit index. The semantic list length $n$ is public; the requested index is in ${ 1 \, dots.h \, n }$, or an out-of-range request returns a prescribed normalized constant. Absent descriptors may be assigned prescribed constant dummy values by structural validity predicates. This order statistic has deterministic integer approximations $N_t$ satisfying Equation (10.3). Their residue procedures have constants $a \, b \, c$, depending only on the descriptor bounds, such that an operand digit query at $j$ obeys 
#[#set math.equation(numbering: n => "(10.17)")
 $ j lt.eq t + c d \, #h(2em) L lt.eq a d + b \( t - j \) \, $ <eq:arith-local-bound>]

 where $L$ is the total suspended local record length. A structural validity query is assigned clock zero and has suspended length $O \( d + t \)$. The intrinsic local length is $O \( d + t \)$.]
] <lem:arith-rank>

#proof[
  For $1 lt.eq k lt.eq n$, the $k$th largest of the semantic $n$-entry list is its $\( n - k + 1 \)$st ascending order statistic, before any extra padding. Pad to a fixed descriptor domain whose cardinality is a power of two, adding entries of value $+ 1$. These entries do not change any of the first $n$ ascending order statistics. An empty list or an out-of-range request returns its specified default immediately. Replace invalid original descriptors by the prescribed dummies. An operand access evaluates validity first and enters the actual value branch only when valid; an invalid access returns the dummy’s digit. Thus a dummy does not require a query to an undefined value. For each valid numerical value use its truncation through $K = t + h$ for fixed large $h$. Order these finite rational values, breaking ties by descriptor index. Compare every pair using the signed comparison of Lemma 50. For each descriptor count how many descriptors precede it, then compare that count to the requested rank minus one. Exactly one descriptor is selected. Select its low-residue bits using Boolean AND and OR trees and finally floor to output scale $2^t$. The selected descriptor is internal to this residue computation. It may change with $t$; the exact order statistic being approximated is fixed by the semantic list and the requested index.
  If all coordinates of two finite lists differ by at most $eta$, their corresponding order statistics differ by at most $eta$. Indeed, at least the specified number of the perturbed entries are no larger than the original order statistic plus $eta$; interchanging the lists gives the reverse inequality. Here $eta = 6 thin 2^(- K)$. Thus the selected truncation, followed by the final floor, satisfies Equation (10.3) for sufficiently large fixed $h$. Descriptor ties affect neither this estimate nor the uniqueness of the finite selection. This argument perturbs the entire padded exact list. Some truncated original entries may exceed $+ 1$ slightly, but their error, and hence the error of the selected padded order statistic, is still at most $eta$. The padding argument requires no separate claim that every finite truncation remains in $\[ - 1 \, 1 \]$.
  Each count has $O \( d \)$ bits. Carry-save counting as described above, the comparison to the requested rank, and selection among $2^(O \( d \))$ descriptors add $O \( d \)$ Boolean depth above the pairwise comparison bits and selected residue bits. A place-$j$ input to a pairwise comparison consequently has path length $O \( d \) + O \( t - j \)$; a residue input is within a fixed distance of $t$ and has path length $O \( d \)$. The paths to validity predicates have length at most the whole circuit depth $O \( d + t \)$, and the predicates themselves are separate structural leaves of clock zero.
  Each gate is specified by its pair of descriptor indices, its counting-tree or selection-tree position, and a comparator or bit position. The paths determine these indices in $O \( d + t \)$ scratch, using only the fixed domain and root parameters. No numerical comparison is needed to determine the circuit topology. Apply Lemma 49. The constants in Equation (10.17) can absorb the fixed digit overshoot because $d gt.eq 1$. ◻
]

For the compression ranks, copies of a previously computed baseline are ordinary indexed operands: their digit interfaces query the baseline’s exact stream one bounded digit at a time. A slot that chooses between an entry and the baseline first evaluates its structural flag and then queries the selected, already-defined stream. Treating this as a defined operand interface leaves no absent value for the rank procedure to evaluate. The required baseline copies belong to the semantic list; the extra power-of-two padding in the proof is then supplied by the constant $+ 1$. The structural choice adds only a fixed conditional branch, so the same digit-clock and suspended-record bounds apply.

A rank over the full incoming vertex universe need not have a $2^(O \( d \))$ descriptor domain. That operation uses the terminal configuration procedure in the next section.

#thm([Lemma 10.7.])[
  (Bounded sums and known scales).  #emph[Suppose an immediate descriptor domain has at most $2^(kappa d)$ terms, all required binary scale exponents have magnitude at most $kappa d$, and every intermediate output has a known range bound $2^(kappa d)$. A sum over an empty domain is zero, and an average is taken over a public nonempty domain. Balanced sums or averages of these terms, followed by the required known rescalings and bounded clipping, satisfy Equation (10.17) and have intrinsic local space $O \( d + t \)$.]
] <lem:arith-sums-scales>

#proof[
  Choose one common known power-of-two range bound for the immediate terms and divide each term by it, so every term lies in $\[ - 1 \, 1 \]$. Pad their number to a power of two $2^r$, $r = O \( d \)$, and use a complete binary tree of pair averages. Every internal value stays normalized. Along one path there are $r$ elementary operations. Choose common coefficients in their bounds, as in the last paragraph of the proof of Lemma 50. The constant terms sum to $O \( r \)$ and the differences of successive digit clocks telescope. Thus the local length is $O \( d \) + b \( t - j \)$ and the total overshoot is $O \( d \)$. Restore the common normalization scale only after the tree of pair averages. For a sum, combine this factor with the known padding count $2^r$ in one binary shift of magnitude $O \( d \)$. For an average over an original domain of size $m$, combine the scale restoration with multiplication of the padded average by the public factor $2^r \/ m$. With minimal padding the latter factor is in $\[ 1 \, 2 \)$, so it requires only one normalized public multiplication and a fixed shift in addition to the common scale restoration.
  More explicitly, for a shift by $2^v$, truncate the operand at $K = max \( 0 \, t + v + h \)$. If $t + v + h gt.eq 0$, its scaled truncation error in scale-$t$ units is at most $6 thin 2^(- h)$. If the scaled output is known to be normalized, floor in the desired output scale. Otherwise, when a bounded clip is required, apply that clip to the scaled truncation before flooring. For the normalized clip to $\[ - 1 \, 1 \]$, for example, define the approximation using $min \( 1 \, max \( - 1 \, 2^v x^(\[ K \]) \) \)$; its error cannot increase. This shift-and-clip procedure does not first export an unbounded intermediate as a normalized stream. The low residue requires the constant number of places near $t + v$, and a comparison needed for clipping has a constant-state chain through $K$. Comparisons to the scaled clipping endpoints are equivalently comparisons of $x^(\[ K \])$ to the known endpoints divided by $2^v$; their finite constants and shifted place data are public. When $v gt.eq 0$ these endpoints belong to $\[ - 1 \, 1 \]$; when $v < 0$ the normalized operand is already in the clip interval after scaling, so no clipping comparison is needed. Its path cost is $O \( 1 \) + O \( max \( 0 \, t + v - j \) \)$, which is at most $O \( d \) + O \( t - j \)$ on an actual operand query. If $t + v + h < 0$, zero is already a sufficiently accurate approximation after increasing $h$, and no operand query is needed. A fixed number of such rescalings and clips preserves the bounds by telescoping. Known non-power-of-two coefficients can instead be handled as public normalized streams and bounded multiplication. ◻
]

#thm([Lemma 10.8.])[
  (Finite buffered tests).  #emph[Let $d gt.eq 1$, let $s$ and $u$ have known magnitude bound $2^(kappa d)$, and suppose $u gt.eq rho gt.eq 2^(- kappa d)$. There is a deterministic finite test that accepts every $s > 2 u$ and accepts only $s > u$. It uses $O \( d \)$-place digit queries after normalization, with intrinsic and suspended local lengths $O \( d \)$. Its result is independent of any subsequent numerical output clock.]
] <lem:arith-buffered-test>

#proof[
  Compute finite rational approximations $tilde(s) \, tilde(u)$ with individual errors at most $rho \/ 16$. The known range and lower bound on $rho$ make $O \( d \)$ normalized digits sufficient. Accept exactly when $tilde(s) > 3 / 2 tilde(u)$, using a fixed convention at equality. If $s > 2 u$, the left side minus the right side is greater than $u \/ 2 - 5 rho \/ 32 > 0$. If $s lt.eq u$, it is at most $- u \/ 2 + 5 rho \/ 32 < 0$. The finite comparison and all previous arithmetic have the bounds already proved. The test chooses its precision from $d$ and $rho$, not from an enclosing numerical clock. With its structural starting clock defined as zero, its operand requests have $j = O \( d \)$; increasing $a$ in Equation (10.17) pays also for the term $- b j$. ◻
]

=== 10.6 The numerical interface <the-numerical-interface>

We state the composition result with its syntactic hypotheses. They concern finite arithmetic recipes and do not assert any property of the underlying graph operations.

Application to graph procedures requires a separate certificate. The semantic descriptor domains and structural validity conventions are fixed independently of the requested numerical clock; selected operands already have defined digit interfaces; reciprocal arguments lie in the stipulated positive intervals; and root parameters remain recoverable after lower calls. Clock-dependent truncations and comparison circuits may change $N_t$, but not its target recipe value. Lemmas 67 and 68 verify these conditions for the estimator procedures. An incoming rank over the whole vertex universe has no prescribed $2^(O \( d \))$ descriptor bound and uses the separate construction of Lemma 64.

#thm([Theorem 10.9.])[
  (Uniform numerical interface).  #emph[Fix the digit alphabet, positive reciprocal intervals, and constants bounding the following recipe class. A recipe at slack $d gt.eq 1$ has a fixed number of stages built from bounded arithmetic operations, fixed piecewise formulas using maxima, minima and clipping, the reciprocals of Lemma 52, indexed ranks as in Lemma 53, and sums and known scales as in Lemma 54. The stage and descriptor descriptions are generated from the root parameters by index computations using $O \( B + d + t \)$ scratch and no operand queries, and the total non-reduction dependency depth is bounded independently of $d$. Each indexed domain has size $2^(O \( d \))$ and descriptors of length $O \( d \)$. Discrete domain and validity decisions are structural leaves or buffered tests with their own fixed precision conventions. Public coefficient leaves have exact normalized digit procedures using $O \( B + d + t \)$ shared scratch and making no operand or recursive graph queries.]
  #emph[Then each normalized recipe value has a deterministic exact $cal(A)$-stream. For its digit at clock $t$ there are uniform constants $a \, b \, c$ such that every requested operand digit $j$ satisfies 
#[#set math.equation(numbering: n => "(10.18)")
 $ j lt.eq t + c d \, #h(2em) upright("total suspended local binary record length") lt.eq a d + b \( t - j \) . $ <eq:arith-export>]

 An output code bit satisfies the same bounds. A structural leaf is requested at clock zero and has suspended local length at most $a d + b t$. The maximum intrinsic local record length is $O \( d + t \)$.]
  #emph[All gate, digit and descriptor addresses can be regenerated from root parameters and the saved local records using $O \( B + d + t \)$ shared scratch and no recursive graph calls. When $d \, t = O \( B \)$ this is $O \( B \)$ scratch. If a public rational coefficient has $O \( B \)$-bit numerator and denominator that can be generated in $O \( B \)$ scratch, its queried digits in this clock range also require only that shared $O \( B \)$ scratch.]
] <thm:arith-interface>

#proof[
  The primitive constructions define deterministic integers $N_t$. Lemma 48 turns them into exact streams. When composing primitives, their operands are these exact streams; numerical approximation errors are not accumulated along the recipe as if they were statistical errors. Instead, each primitive’s deterministic $N_t$ is an approximation to its own exact mathematical value. The construction uses only residues of $N_t$ and $N_(t - 1)$ and a constant number of output code bits, which adds fixed overshoot and fixed local overhead.
  For the record bound, choose one common positive clock coefficient $b$ for the finite primitive and stage types. In any bound $L lt.eq a_0 d + b_0 \( t - j \)$ with $j - t lt.eq c_0 d$, replacing $b_0$ by $b gt.eq b_0$ is justified by replacing $a_0$ by $a_0 + \( b - b_0 \) c_0$. Thus the same $b$ can be used everywhere. There are a bounded number of stages, each with overhead $O \( d \)$; within a balanced reduction the elementary overheads have total $O \( d \)$ by Lemma 54. Along any path the intermediate clock differences telescope, giving Equation (10.18) and total overshoot $O \( d \)$. The same sum, terminated at an internal arithmetic operation rather than an operand call, gives the intrinsic bound explicitly as follows. If that operation has current clock $u$, its own intrinsic record has length at most $C \( d + u \)$, while the outer saved portion has length at most $A d + b \( t - u \)$. Choose the common $b$ also to satisfy $b gt.eq C$. Their sum is then at most $\( A + C \) d + b t$, because $u gt.eq 0$. Increasing the stage constants as above makes this same choice of $b$ valid in all local bounds. The early-word case is already included in Lemma 52: those retained bits are part of the local record and are paid for at the actual original-input clock by Equation (10.16).
  Structural validity branches are finite branches in this circuit organization, with length at most its full intrinsic bound. They ask the structural operand at clock zero. Buffered tests are separate recipes with structural starting clock zero and precision fixed by Lemma 55; they are not altered when a surrounding value is requested more accurately. Thus no discontinuous comparison of exact reals at unbounded precision is part of the interface.
  All circuit constructions were given with padded domains and index rules. A saved gate choice selects an operand, a subtree, a bit of a known-width word, or one of the finite primitive modes. Scanning these choices from the root recovers the current descriptor and digit places by integer arithmetic. The reciprocal’s extra records additionally specify its early-prefix formation state. None of these computations refers to an ancestor cursor address or requires an operand value to discover the next gate. Their integers have $O \( B + d + t \)$ bits; repeated scans reuse one scratch area. Lemma 49 therefore applies at every Boolean portion of the recipe.
  Finally, for a public coefficient $P \/ Q$, $Q > 0$, producing a place-$r$ approximation uses integer division of $2^r P$ by $Q$, with signed floors when needed. The inputs and intermediate remainders have $O \( B + r \)$ bits. Standard finite binary division and multiplication use that much space, and extracting the low residue or difference digit requires no larger word. All operand bits in this computation are public, so it makes no recursive graph call and can use shared scratch throughout. For $r = O \( B \)$ its scratch bound is $O \( B \)$. In contrast, any word whose bits depend on recursive operands and must survive a new operand request has already been charged to the local record. ◻
]

#prodef([Remark 10.10.])[
  (Use of clocks).  Theorem 56 is a finite-request statement for every $t$. Its exact-stream conclusion follows by considering these finite requests separately, and does not require a machine to choose structural domains or port orders at infinite precision. For the actual top-level computation all reached clocks will be $O \( B \)$ by the allowance calculation in the next section. Known rate and field coefficients have $O \( B \)$-bit descriptions, and a fixed rational generator probability raised to a walk length $O \( d \)$ has numerator and denominator of $O \( d \)$ bits; these are instances of the public-coefficient provision above.
] <rem:arith-clocks>

== 11 Uniform controller implementation <sec:ctrl>

We now implement the table and vector queries defined in the preceding sections. Theorem 56 supplies their numerical operations. We must arrange the recursive graph accesses so that the records retained by all callers fit in logarithmic space at the same time.

We keep one vertex identifier, called the cursor. Consider a product term $cal(F) \( x \, z \) cal(B)_b \( z \, y \)$ from Equation (7.1). For a selected valid product descriptor, a query begins with the cursor at $x$. The correction port moves it to $z$ and supplies a bounded inverse port. The right factor can then be queried at $z$, using its own common table tuple; that tuple contains no copy of $x$. Returning along the inverse port restores $x$. Arithmetic requests the two factor digits separately, so it need not retain a complete left-factor value while computing a right-factor digit. If the operation instead asks to reach $y$, the right factor’s terminal motion is the last recursive delegation; only local label completion follows it. These are the paths that Lemma 28 requires us to realize.

Incoming access reverses a different object: a finite program whose canonical initial states describe the forward row ports. We make the program deterministic with halting success states. The component of a specified success state is then a tree directed toward that state; its canonical initial states are precisely the valid row ports ending there. A contour of that tree enumerates them and returns to the success state without saving a second copy of its vertex address. This gives both capped incoming ports and incoming score ranks. To use the contour we must define program states and their predecessor queries carefully: working states of a completed lower query are not themselves part of the calling program graph.

The storage bound follows the same distinction. A caller retains its own descriptor choices and numerical path while a lower procedure runs. A slack-$d$ layer pays $O \( d \)$ structural bits; a query from digit place $t$ to place $j$ pays for its numerical records through the bound $O \( d \) + c_(upright("num")) \( t - j \)$ of Theorem 56, for a fixed coefficient $c_(upright("num"))$. We assign a decreasing allowance to the finite operation order within a prefix, the move to its preceding prefix of slack $2 d$, and the move to a child of budget at most $M - d$. The resulting differences telescope over the physical stack. The proof below establishes these record bounds on the actual recipes before imposing guards on artificial program states.

=== 11.1 Parameters and interfaces <sec:ctrl-model>

Fix the input and a master environment. The latter includes the rank matrices and all the fingerprint salts. A #emph[table tuple] consists of the estimator type and stage, its statistical budget, scale and usage rates, channel roles and suffixes, and its effective environment. The tuple specifies an entire table, rather than an individual row or entry. Usage rates belong to this tuple; the separate integer clock $t$ specifies a requested numerical digit. A generator and wrap word is a call-record descriptor used to derive a child’s effective environment. It is not an additional semantic parameter of the child table: after this derivation, the child’s values, forward port orders and guards depend on the resulting effective tuple, not on the ancestral word which produced it. Distinct walk descriptors are still separate summands with their prescribed weights, even if they induce the same environment transformation. The variants of Lemma 21 can be generated without their conditioning vertices. A vector tuple is defined in the same way, omitting the unneeded terminal parameters. All admissible absolute tuples have $O \( B \)$ bits.

The mutable cursor records a vertex and its stage interpretation. Other shared facilities are the input, the top root parameters, the master environment, a catalytic bit vector of length $B$, and one reusable scratch area. Its size is $O \( B \)$ in the actual computation, where the top numerical clock is $O \( B \)$; for a general top clock $t$ it may use $O \( B + M_(upright("top")) + t + 1 \)$ bits. Scratch may be used to perform arbitrary local integer computations in this space. It has no content which must survive a recursive graph operation. Every such operation starts its scratch calculations canonically. Before every input access, its requested position is regenerated in shared scratch. The physical input head stays between the real endmarkers; off-data simulated positions use the base symbol routine from Lemma 3. These rules also apply during inaccurate calculations and guarded artificial predecessor probes. The requested coordinate and scan counters coexist only within this pure routine and are discarded before a recursive graph operation. It is harmless to copy an address temporarily inside a scratch calculation, but such a copy is discarded before a recursive graph operation begins.

The finite interfaces to be constructed are as follows. A port is an index in a specified row class; the class may have holes.

+ A #emph[restoring test] returns one bit. A #emph[quantity query] returns one bounded signed digit of a specified value. Both restore the cursor and the catalytic vector.
+ A #emph[terminal motion] starts at a row and a port and finishes at that entry’s endpoint. No return address is provided. An #emph[excursion] makes the same visit, performs a prescribed local action there, and returns. The action may use scratch and the catalyst but makes no recursive graph query.
+ A #emph[paired motion] maps a valid row port to its endpoint and a bounded inverse port. Its inverse has the same table tuple. On invalid ports the restoring existence test returns false; an exported motion may instead return failure without moving the cursor.

At the final row interface all port alphabets are bounded by constants. At a prefix of slack $d$, indices and immediate descriptors have $O \( d \)$ bits. These two statements must be distinguished: an entire terminal path represented by one prefix port need not have a description of length $O \( d \)$.

A port code may be in range and still name a hole in its class. Its existence test returns false, its quantity query returns the zero digit, and its motion or excursion fails with cursor and catalyst unchanged. Rank operands retain their separately prescribed baseline or padding values: an absent real port is not a virtual default coordinate.

#thm([Theorem 11.1.])[
  (Realization of the estimator interfaces).  #emph[Fix the construction constants and an admissible top budget $M_(upright("top")) = O \( B \)$. For every actual task tuple reachable from it, the row, vector and prefix interfaces defined in the preceding sections admit deterministic uniform implementations by restoring queries and cursor motions. The following assertions hold for every master environment, without an accuracy promise on its estimated values.]
  + #emph[Every test or numerical digit query terminates, returns its defined value, and restores the cursor and catalyst. Its result is independent of incoming catalyst and scratch contents. Structural port and order choices are independent of a higher numerical request.]
  + #emph[Terminal motions give the specified endpoints. Their excursions restore the cursor. Capped correction motions are partial paired maps with bounded inverse ports and safe behavior on invalid ports. Incoming score ranks compute the stipulated zero-padded ranks.]
  + #emph[For a root numerical request at clock $t$, all records retained by the call and its descendants have total length $O \( M_(upright("top")) + t + 1 \)$, and every descendant clock is $O \( M_(upright("top")) + t + 1 \)$; the shared facilities use $O \( B + M_(upright("top")) + t + 1 \)$ space. In particular an actual top request with $t = O \( B \)$ uses total deterministic $O \( B \)$ space.]
  #emph[These implementations use no estimator oracle and retain no second vertex address across recursive graph operations.]
] <thm:ctrl-realization>

The proof also constructs every lower operation instance admitted by the finite parameter ranges and permitted parent-to-child recipes. This includes calls made while testing possible predecessor states, whether or not those states occur in a designated execution. The larger construction is needed to compute incoming accesses by inverse traversal.

=== 11.2 Program states and record bounds <sec:ctrl-graphs>

A terminal program has a fixed root tuple and root clock. Its initial configuration is the cursor $x$, a distinguished initiation tag, and the original row port $p$ in a separate recoverable field. Distinct ports give distinct initiation states. In a scoring program the success local state contains a quantized score; otherwise it has only a success tag. The starting row and port are not root parameters. The program universe thus includes all rows and all ports of this same table. Similarly, a scoring universe at a fixed precision includes all possible quantized scores.

There are two different forms of invocation inside this program. A restoring bit query, or a lower paired motion, is an #emph[opaque transition query]: its temporary working configurations are not vertices of the terminal program graph. They are computed by the lower procedure when the transition is probed. A terminal delegation with no bounded inverse port is instead #emph[explicit]: it pushes the lower terminal controller into the local state. Thus the vertices of the program graph comprise the cursor and a finite chain of explicit controllers, but not the working states of opaque transition queries. This distinction will also be used when graphs are traversed inversely.

#prodef([Definition 11.2.])[
  (Regenerable record).  A local record is a delimited binary word with a tag from a fixed finite alphabet. It may contain immediate descriptor choices, bounded port or copy symbols, offsets, Boolean evaluation paths and pending bits, and the early numerical words permitted by Theorem 56. Head positions in such words are marked locally. A root tuple, a root operation and its numerical clock, together with the active records, determine every descendant tuple and clock by a scratch computation. This computation does not call a graph procedure and does not use a cursor that has been left behind. We call such records #emph[regenerable].
] <def:ctrl-record>

The records use delimited encodings, with marked positions rather than an independent absolute stack pointer at every level. Self-delimiting encodings enlarge a nonempty word of length $r$ by $O \( r + 1 \)$ bits. Constant tags also identify a root boundary, the active candidate copy during a neighbor test, and the owner of a pending endpoint action. These tags permit a scratch scan to select the appropriate active view of the records. An inactive copy is not part of a descendant’s program state or call recipe.

A root boundary is a constant tag, not a stored copy of an absolute table tuple. The logical root parameters of a nested query are obtained by replay up to that boundary; the temporary absolute tuple is then discarded before another graph query. Thus the phrase “fixed root tuple” specifies which mathematical program graph is being used. It does not allocate a fresh $O \( B \)$-bit parameter word at every nesting level. Lemma 68 supplies the replay procedure.

#prodef([Definition 11.3.])[
  (Raw allowance certificate).  A raw controller is the caller’s own selection, arithmetic, scoring or terminal-path record, excluding the working states of a query it calls. In a terminal program graph an explicit chain contains only its terminal-path controllers and, in a scoring program, its score suffix or completed score word. The interiors of cap traversals, inverse score ranks, numerical digit queries and paired motions are opaque queries; they are never explicitly pushed working graphs in this chain.
  A raw controller has an integer allowance $w gt.eq 1$ and a numerical clock $t gt.eq 0$. Fixed raw constants $a_0 \, b_0 \, a' > 0$ give the following certificate at a call to a lower query or an explicitly pushed raw terminal controller at $\( w' \, j \)$:
  #[#set math.equation(numbering: n => "(11.1)")
   $ w' < w \, #h(2em) j - t lt.eq a' \( w - w' \) \, #h(2em) ell lt.eq a_0 \( w - w' \) + b_0 \( t - j \) . $ <eq:ctrl-local-bound>]
  Here $ell$ counts only the suspended caller record, including its delimiters, return modes and pending data. It does not count the callee’s physical working space. Without a pending call its own raw records have length at most $a_0 w + b_0 t$. A structural operation has a canonical starting clock zero; numerical queries used by its finite-margin tests are included in this certificate.
] <def:ctrl-allowance>

We will prove this bound for the actual recipes below, before using guards to restrict artificial program states. In particular, guard insertion will not be used as a substitute for proving that a designated execution fits its bound.

We use the following finite instruction types.

+ #emph[Local edit.] Read a bounded number of marked local symbols, change a bounded number of symbols and a finite mode, and advance the marked local heads by one position. A push opens a delimiter and writes a tag in a bounded number of steps. A pop is performed only after the child word has been erased down to that tag, also by local steps.
+ #emph[Pure or restoring branch.] Compute one bit, either in scratch without a graph call or by a lower restoring test or digit query, and change a bounded local symbol or mode. A bounded signed digit is handled as a fixed number of bits. A longer selection result is written one bit at a time, with its index stored in the local record.
+ #emph[Paired cursor step.] With its motion tuple and short token already selected, apply one lower partial paired map, or one elementary base or label map. Its output token and finite mode are the only simultaneous local changes. The linear-size motion tuple is regenerated from records; it is not written as an opaque payload.
+ #emph[Explicit terminal call.] Create a lower controller with a regenerable call recipe. Ordinary instructions then execute that controller. On its return, local erasure and the prescribed bounded label completion are performed by the preceding instruction types.

An endpoint action in an excursion may be a pure computation reading or toggling the catalyst. Such actions are not individual edges of a terminal program graph: that graph uses the complete restoring, catalyst-independent predicate which contains the excursion. Its other pure branches depend only on initialized scratch, the input, cursor and permitted tuple data. A value test is never combined with a cursor-changing step. Conditional validity can be a separate restoring branch; a partial paired step may simply have no edge on an invalid domain.

Every record position erased by a local edit is marked before the edit, or is a known end of a delimited word. In particular, an instruction cannot erase an arbitrarily chosen position and then forget its index. Counters, carries and loop heads are manipulated by these local steps. Pure computations and restoring tests can be recomputed to select one output bit; their scratch states and physical input heads are not included in the states whose predecessors are enumerated.

Predecessor probes can reach artificial local states whose stored flags were not produced by a designated execution. The lower query interfaces must therefore be safe independently of those flags. We use the following entry conventions before constructing the graph.

===== 11.2.1 Total calls on invalid ports. <total-calls-on-invalid-ports.>

An argument is #emph[range-valid] when its tuple, operation type, cursor type, port code and clock lie in the permitted finite ranges. A range-valid port can still name a hole. Every exported existence predicate is a total restoring test of its earlier defining masks. Every port-dependent quantity query freshly tests presence at structural clock zero before entering its value calculation. If presence fails, the query returns the zero digit of the zero stream. A forward motion or excursion instead returns failure, with cursor and catalyst unchanged and without performing an endpoint action. A paired inverse uses its target-side incoming-count and inverse-rank validation. Excursion validity is checked before building its chain of terminal-path records, not anew at the remote endpoint or during rollback. An endpoint comparison returns false if either freshly tested descriptor is invalid. Wrong types or out-of-range codes are rejected by a pure check before any lower call.

Baseline queries and rank-padding inputs retain their separately specified values: an absent port is not a virtual default coordinate. In particular, incoming score ranks are padded by zero, whereas a compressed-array rank uses copies of its baseline. Every opaque query tag invokes the canonical entry of one of these total procedures. No permitted call recipe targets an internal continuation after its presence test. A historical validity flag in a caller is never accepted as a certificate of presence. Lemma 67 proves that the fresh tests use earlier operations and fit the allowance bounds.

#thm([Lemma 11.4.])[
  (Guarded local graph).  #emph[Suppose a fixed terminal recipe uses the preceding instruction types, has regenerable records, and obeys (11.1) on its designated executions. Suppose all its opaque transition queries are already implemented, are total on admissible arguments, and have the stated safe invalid-port behavior. Their returned bits, success flags, cursor outputs and port tokens are independent of incoming scratch and catalytic contents, and they restore the catalyst. Then there is a finite graph with outdegree at most one, uniformly associated with its root tuple, with these properties.]
  + #emph[Its designated executions are precisely the prescribed terminal executions. Success states have no successor, and initiation and success tags are distinct.]
  + #emph[Predecessor cases, ordered incidences, and paired edge movement are computable with a bounded number of case labels and one cursor. An opaque predecessor query is made only after its local bound has been checked.]
  + #emph[If a transition query at $\( w' \, j \)$ is probed while the terminal root has parameters $\( w \, t \)$, the complete live local portion of this probe, including a fixed number of edited or saved controller copies, has length 
#[#set math.equation(numbering: n => "(11.2)")
 $ A \( w - w' \) + D \( t - j \) $ <eq:ctrl-neighbor-bound>]

 for fixed enlarged coefficients $A \, D$. Shared facilities and the outside stack are not copied.]
  #emph[The graph and all its guards are independent of an originating row, an outer stack’s data, and catalytic contents.]
] <lem:ctrl-local-graph>

Independence from the outer stack is understood after fixing the logical root tuple: two invocations that regenerate the same tuple define the same graph. Their physical replay histories may differ. The hypothesis on designated executions is proved for the concrete recipes in Lemma 67; the guards below extend query safety to artificial states reached while enumerating predecessors.

#proof[
  Use as potential states the cursor and delimited words having the specified finite tags. Check absolute parameter ranges, descriptor ranges, stage and suffix types, instruction modes, and the allowed parent-to-child recipes. Check the intrinsic word bounds of Definition 60. For each explicit chain also check the local bounds along that chain. Before any opaque query, check the bound from every ancestor of its local explicit chain to that query. All absolute parameters, clocks and lengths needed for these checks are regenerated or counted in scratch. No graph query is needed for a guard. At a state with an unavailable instruction omit that edge.
  The designated paths pass the guards by hypothesis: their boundary bounds add along an explicit chain and telescope. Enlarging the coefficients once covers fixed instruction tags and bounded intermediate edits. The resulting graph is finite since its local words have $O \( w + t \)$ bits and its cursor has $O \( B \)$ bits. It is deterministic since every branch bit and partial paired map is deterministic. Guards may create additional dead ends, but they cannot create a new path from a canonical initiation to a success state.
  For a local edit, predecessor candidates are obtained by guessing the bounded overwritten symbols, preceding finite mode, and bounded head moves, then testing the instruction forward. Marked positions and incremental erasure make the number of cases bounded. For a branch, perform the same fresh restoring query at the unchanged cursor and test the guessed preceding symbols. Incorrect historical branch bits do not resume the interior of a lower procedure: the query is always started again on its regenerated arguments. The guards are checked before the query, including for a candidate predecessor.
  For a cursor step, first construct the possible preceding local record by a bounded inverse edit, guessing the bounded preceding token if needed. Before any motion, replay that candidate’s active records from the fixed root tuple. Check the instruction and stratum, permitted child kind, budget, scale and suffix ranges, salt permission, numerical clock and every ancestor-to-query raw length bound. These allocation and recipe checks do not use the predecessor cursor. The lower motion tuple is then fixed by the candidate record and the present output token. Apply the partial inverse at the present cursor and output token. If it succeeds, the returned token and preceding local symbols specify the candidate predecessor. Static checks and token comparisons can be made there. A guessed preceding port is compared with the actual port returned by the inverse. Any remaining cursor-specific type or domain check is pure at that cursor; a domain condition requiring another restoring query belongs to a separate branch edge. Thus it does not conceal a second high-cost query inside this paired step. To restore the probe, apply the paired forward map with that same tuple and the actual returned token. No saved copy of the cursor is used. Conversely, an outgoing paired probe checks the proposed target guards after its motion; if a guard fails, or if the probe is only a restoring incidence test, its inverse with the actual output token restores the starting cursor. Both directions have been allowed the same lower-operation cost. No unrelated value query is part of this cursor step.
  Label an edge by its finite instruction case and bounded erased symbols. Its forward instruction determines a canonical reverse case code. An inverse probe accepts only that code. This removes any duplicate descriptions of the same predecessor edge without comparing two retained addresses. The finite case codes give a fixed local order and a bounded incidence token; a forward edge knows its reverse token.
  For the space assertion, first ignore saved probe copies. Adding the boundary inequalities along the current explicit chain gives the bound $a_0 \( w - w' \) + b_0 \( t - j \)$. A current state and a candidate predecessor differ in length by a constant: this follows from the bounded edit used to #emph[construct] every candidate, before it is known to be an actual predecessor. Consequently retaining or editing both costs only a fixed multiple of that bound, with a constant adjustment absorbed by the strict allowance decrease. More explicitly, write $Delta w = w - w' > 0$ and $Delta t = t - j gt.eq - a' Delta w$. For a fixed copy factor $k$ and additive bounded metadata cost $h$, choose
  #[#set math.equation(numbering: n => "(11.3)")
   $ D gt.eq k b_0 \, #h(2em) A gt.eq k a_0 + \( D - k b_0 \) a' + h . $ <eq:ctrl-copy-coefficients>]
  Then $k \( a_0 Delta w + b_0 Delta t \) + h lt.eq A Delta w + D Delta t$. This also handles a negative clock decrement. These coefficients are uniform over all finite instruction cases.
  The constants $a_0 \, b_0$ describe the raw skeleton uniformly over the whole recipe family. They have not been replaced by the physical probe constants $A \, D$ in a lower skeleton’s guards. Fix the maximum finite copy factor $k$ and metadata cost $h$ and choose $A \, D$ once. A lower compiled query contributes a new physical stack segment when it runs; its contour state and saved copies are not words in the calling graph. Thus this estimate copies raw records, not another $A \, D$-sized physical segment.
  Only the local explicit chain is saved or edited. A nested query has its own root boundary and appends its local portion below the existing stack; its program graph excludes the caller’s saved copies. A tag selects the candidate chain for parameter replay, ignoring an inactive saved copy. Therefore a later neighbor probe does not copy the older outside portions again. Finally, all guards and forward case codes use just the fixed tuple and its permitted records. Imposing the same salt-visibility convention as the underlying recipe preserves this independence even at synthetic states. ◻
]

=== 11.3 Contours and incoming operations <sec:ctrl-incoming>

The rotation–edge-flip traversal below is the forest permutation of Cook and McKenzie #cite(label("CookMcKenzie1987")) Proposition 1, p. 387, with a sentinel to include an isolated root. Traversal of configuration trees also underlies space-preserving reversible simulation #cite(label("LMT2000")). We prove the contour and incoming operations needed here, including their local record bounds. In particular, the use of a contour will not replace the separate allowance and guard argument.

#thm([Lemma 11.5.])[
  (Inverse contour).  #emph[Let a finite deterministic graph of the form in Lemma 61 have a specified canonical success halt. Its undirected component is a tree directed toward that halt. There are mutually inverse next-mark and previous-mark operations on its contour, where the marks are the root sentinel and one distinguished occurrence of each canonical initiation in the component. These operations require the current program state and bounded incidence control, but no saved root or contour-length counter.]
] <lem:ctrl-tour>

#proof[
  Following the unique successor from any node in the undirected component reaches its sink. Indeed a directed cycle in a graph of outdegree at most one cannot be joined by a path to a sink: at the first connection the unique outgoing edge is already used toward the cycle. Equivalently, on an undirected cycle all its vertices must use their outgoing edge on that cycle, so no sink lies in its component. The same argument excludes two sinks in one component. Thus the component is a finite tree with the given unique sink.
  Take the incidences of its edges, with an additional sentinel incidence at the root. Edge flip exchanges the two incidences of an edge and fixes the sentinel. At each vertex cyclically rotate its incidences in the fixed local order. Rotation followed by flip, or its inverse, gives one contour cycle on these incidences. This follows by induction on the number of edges: inserting a leaf inserts its two incidences into the old cycle. The isolated-root case consists only of the sentinel.
  At a canonical initiation mark its unique successor incidence; mark the sentinel at the root. Each initiation is therefore counted once. Iterating the contour successor to the next mark always terminates, since the finite contour contains the root mark. Iterating its inverse to the preceding mark is the inverse operation. A success tag and the sentinel token identify the root in this component; its address never has to be compared with an earlier address. Constant-degree adjacency and edge flip are provided by Lemma 61. ◻
]

#thm([Lemma 11.6.])[
  (Capped incoming ports).  #emph[Let a fixed row class have a constant port alphabet, distinct entries within each row, and a deterministic terminal program which maps its valid row ports to their endpoints. Assume the program is of the form in Lemma 61. For every fixed $K_c$ there are restoring tests and mutually inverse paired motions for precisely those class entries whose endpoint has at most $K_c$ incoming class entries. The inverse ports belong to ${ 1 \, dots.h \, K_c }$. No additional endpoint address or unbalanced path is held across these operations.]
] <lem:ctrl-cap>

#proof[
  Give invalid row ports a distinct failure execution. The canonical initiations in a success-root component then correspond exactly to valid class entries at that endpoint. Class validity is tested before using a forward initiation as a contour starting point.
  Start at a valid initiation mark. Go forward toward the sentinel, counting other initiation marks, stopping either at the sentinel or after $K_c$ other marks. Store the number of mark jumps, at most $K_c + 1$, and restore the start by that many inverse jumps. Do the same in the backward direction and restore again. Reaching $K_c$ other marks certifies excess. Otherwise, let $a$ and $b$ be the numbers of other initiations before the sentinel in the forward and backward directions. The total is $1 + a + b$; accept exactly when this is at most $K_c$. The initiation’s rank after the sentinel in forward order is $r = b + 1$. A forward paired motion goes to the sentinel in $a + 1$ mark jumps and returns the inverse port $r$.
  From a canonical endpoint halt, count forward marks until returning to the sentinel or encountering $K_c + 1$ initiations. In the latter case restore the sentinel by the bounded number of inverse jumps and reject. In the former case the total $n lt.eq K_c$ is known. For an inverse port $r in { 1 \, dots.h \, n }$, go forward by $r$ mark jumps to its initiation and return the row port stored in that initiation state. Invalid ranks are rejected at the sentinel. A halt with no preimages has $n = 0$ and is harmless. Wrong vertex types can be rejected before creating a halt state.
  Every unsuccessful inverse request therefore leaves its endpoint unchanged: an excessive incoming count is undone before failure, and an invalid rank is detected at the recovered sentinel. For a successful request the returned row port is the one in the reached initiation, not a guessed port. This is the token used by a later forward restoration in Lemma 61.
  These are inverse maps by the common contour order. Existence tests make the corresponding visits and reverse them, so they restore the cursor. All counts, ranks and incidence tokens have a fixed alphabet. The terminal program graph has the common table tuple as its root; neither direction fixes the starting row or port as an external parameter. Consequently the two directions use exactly the same graph. Restoring lower queries restore the catalyst, and the contour itself does not otherwise change it. ◻
]

The incoming scores need not have bounded support in a column, so a bounded incoming-port list does not suffice to compute their rank. We instead give the terminal program a success state containing both the endpoint and a rounded score. A contour at that halt counts the entries with that rounded score; successive contours visit the scores in decreasing order. The endpoint and score belong to the current program state. During a tour they may be replaced by an earlier state of the score computation, and the contour recovers them when it returns to its unique halt. Thus neither is retained separately while an earlier state requests a score digit. The next proof combines this observation with an assembly order that stores only a short suffix before a late digit query.

#thm([Lemma 11.7.])[
  (Incoming score rank).  #emph[Let a constant-size forward row class cover every positive entry of a bounded nonnegative score table, with distinct entries in each row. Suppose pre-incoming score digits are restoring queries, and the class has a terminal program with the preceding interfaces. A fixed incoming $k$th-largest value, with zero padding, has exact redundant digits computed by a restoring procedure. Its local record above a place-$j$ score query at output approximation clock $t$ is $O \( 1 + \( t - j \)_(+) \)$, with a fixed overshoot $j lt.eq t + c$, in addition to the structural allowance costs. A complete $O \( t + 1 \)$-bit score word is retained only over structural calls.]
] <lem:ctrl-score-rank>

#proof[
  Normalize the score range to $\[ 0 \, 1 \]$, using a fixed public factor if necessary. At approximation place $t$, choose a fixed extra margin $c$. For the digit truncation $v^(\[ t + c \])$ define the integer
  #[#set math.equation(numbering: n => "(11.4)")
   $ q_t \( v \) = "clip"_(\[ 0 \, 2^t \]) (⌊2^t v^(\[ t + c \])⌋) . $ <eq:ctrl-score-quantization>]
  The digit tail has absolute value at most a fixed constant times $2^(- t - c)$. Choose $c$ so that this is less than $2^(- t)$. Clipping is nonexpansive and fixes $2^t v$, so $\| q_t \( v \) - 2^t v \| < 2$. The same margin gives $q_t \( 0 \) = 0$: a truncation of the zero value has scaled magnitude less than one, so flooring and nonnegative clipping give zero. Since the forward class contains every positive score, enumerating its entries and padding by zero therefore gives the rank of the whole quantized score column.
  Use a forward terminal program which first tests the entire class and membership domain at its canonical initiation, sending invalid inputs to failure. Its success #emph[configuration] contains the endpoint in the cursor and $q_t \( v \)$ in its local state. Before making its final structural motion, assemble the score digits from least to most significant. In units $2^(- t - c)$, before the place-$j$ digit is queried the accumulated suffix and its carry have $O \( 1 + t + c - j \)$ bits. A self-delimiting offset from $t + c$ fits the same bound. After assembly, division by $2^c$, flooring, clipping and loop setup are pure local computations. The complete word is then held only through structural motion and local clearing to success. Thus all its graph-query boundaries satisfy the claimed record bound. The success word is part of the graph state, not a parameter of the graph. At this fixed $t$ the graph includes every allowed quantized value.
  At the requested endpoint, initialize the success state at $q = 2^t$. Tour that root component and count canonical initiations, saturating at the desired fixed rank. Continue to the sentinel even if the saturated count has already been reached. At the sentinel the same endpoint and quantized value have been recovered; no other success halt occurs in that component. If the cumulative count has not yet reached the requested rank, decrement the value field by pure local steps and tour the next success component. The value field itself is the loop variable. No separate copy of it survives the tour. The saturated count and control bits have constant size. At value zero apply the stipulated zero padding.
  If the desired rank has been reached, use the value field only after the tour has returned to the sentinel. The clock $t$ is a root parameter throughout; the loop value $q$ is not. Consequently an inverse step which reaches an earlier partial-suffix state replaces the current score state by that suffix state, and need not retain the final $q$ or the endpoint address alongside it. Unique-sink recovery supplies both again when the component tour ends.
  This computes the integer order statistic $N_t$ of the values $q_t \( v \)$. A uniform perturbation of a finite list changes any order statistic by at most the same perturbation, including after zero padding. Thus $N_t$ has error less than $2$ as an approximation to $2^t$ times the desired rank. Keep only the fixed number of residue bits needed to form its redundant digit, clear the other local data without a graph query, and return at the unchanged endpoint. Computing $N_(t - 1)$ uses its own quantization convention; the difference-digit construction needs only the bounded errors, not nested quantizations.
  During a tour the live program state may be a partial suffix state preceding a high-place query. It then contains that short suffix, rather than a saved copy of the final score. Lemma 61 therefore also gives the required bound for inverse neighbor queries. All root components are finite, including isolated success states, and the decreasing finite value loop terminates. Fresh lower procedures and the contour preserve the catalyst. ◻
]

=== 11.4 Certificates for the estimator recipes <sec:ctrl-recipes>

We next verify the hypotheses of the graph construction for each of the actual recipes. These certificates concern syntax, storage and dependencies; they do not use the statistical accuracy of an estimated entry. Thus they apply also when its numerical value is inaccurate.

#thm([Lemma 11.8.])[
  (Ordered terminal paths and excursions).  #emph[Every unbalanced path required by the estimator has the following ordered form: restoring selection and validity tests; local label maps and, if necessary, a paired left-factor motion; further restoring tests at that midpoint; at most one final terminal delegation; and then only local label completion. An excursion to its endpoint and back, for a pure local action, has regenerable records. It preserves the same allowance and clock bounds as this ordered path, up to fixed factors. No unbalanced spine is retained over a new high-cost query at its endpoint.]
] <lem:ctrl-paths>

#proof[
  For a direct summand the path is a local base path, a projected child path, or a child row port. A projection stores its bounded symbol before removing it and appends the prescribed destination symbol after the child terminal motion. For a product the left factor is a correction with paired access. Its inverse token is stored at the midpoint; right-factor validity and weight queries are restoring there. The right terminal path is then the last delegation. An old prefix port delegates to that preceding prefix; after its return it requires no new graph query. These are exactly the path cases of Lemma 28.
  There are two compiled continuations of this same terminal syntax. A one-way continuation clears its path records after performing its prescribed local completions. A visiting continuation retains the immediate choices and inverse tokens on its explicit terminal spine. After the local endpoint action it undoes the bounded completions, undoes the last delegated spine, and then uses the paired inverse token of an earlier motion. Each deeper record is cleared before invoking an earlier inverse map. For a projection, the saved symbol and prescribed append symbol give its local inverse. The identical lower paired tuple and actual returned token give the inverse of a correction move.
  This is an induction on terminal delegations, not an attempt to invert an arbitrary unbalanced macro in one step. A frame stores only its own immediate descriptor, bounded choices and phase. Its returned child spine is used for local completion and the endpoint action, which make no graph calls. When a further graph query is made during rollback, the deeper spine has already been discarded. Thus the suspended records are those at the corresponding forward boundary, enlarged by bounded phase and inverse-token data. The choices can be re-created or kept on their own frame; no concatenated description of all old prefixes is passed to a new tight query.
  In a restoring use, intrinsic constituent validity is checked before the visit. A product can test its right port by crossing the paired left edge and returning; this test does not use the right terminal path. Outer slice and wrap tests then use a valid intrinsic excursion. Hence none of these validity checks recursively invokes the very bucket or shortlist membership it helps to define. The endpoint action’s owner is marked in the outer frame, so its tuple can be regenerated by a scratch scan even while a descendant path is retained. The action’s result does not alter the selected paths or their undo. ◻
]

#thm([Lemma 11.9.])[
  (Implemented endpoint comparison).  #emph[At slack $d$, comparisons of two valid candidate or old-list endpoints are restoring, catalyst-independent tests with $O \( d \)$ suspended structural control, in addition to the costs of their lower endpoint visits. They use no saved endpoint address. Their choice between an exact comparison and the designated fingerprint comparison is independent of a surrounding numerical clock.]
] <lem:ctrl-equality>

#proof[
  The two descriptors occupy $O \( d \)$ bits. By Lemma 65, each endpoint can be visited and restored for a local bit or hash action. If $d > 2 h_(*)$, compare the $O \( B \)$ identifier bits in order, retaining only the bit-position counter and bounded flags. Its counter uses $O \( log B \) = O \( d \)$ bits, since $h_(*) = floor.l epsilon.alt log_2 B floor.r$ with a fixed positive $epsilon.alt$ and sufficient minimum padding.
  Otherwise use the four visits in Lemma 47: flip the first key’s bit, xor the second key’s bit into a result, and repeat. The final result is key equality for every incoming catalyst and that vector is restored. Key evaluation and the indicated vector-bit action are pure endpoint operations in scratch. No key index is saved across another visit. Nested structural procedures already restore the catalyst and give results independent of its contents, by their lower operation order. The outer descriptors and all path choices ignore the accumulated result bit. The two repeated visits therefore use identical paths. This proves the same independence and restoration for the completed comparison, supplying the induction hypothesis at the next layer. The comparison mode is determined by $M \, d$ and the public block boundaries, not by the requested numerical place. ◻
]

For the block comparison in Section 9, the clean calculation replaces designated key comparisons by exact endpoint equality. Endpoint comparison is an opaque restoring bit query in the terminal program graph: its internal states are not graph vertices. The exact comparison can therefore use a longer bit-position counter without enlarging the guarded raw graph states. It still returns its bit and restores the cursor and catalyst. Only the actual algorithm must satisfy the tight physical-space bound; the clean calculation supplies comparison values and paths for the error analysis.

#thm([Lemma 11.10.])[
  (Concrete recipe certificates).  #emph[All actual estimator operations admit regenerable records and a fixed finite ordering of operation strata. At a prefix of slack $d$, each ordinary layer has $O \( d \)$ structural control, and a numerical path to an operand at clock $j$ has suspended record 
#[#set math.equation(numbering: n => "(11.5)")
 $ c_(upright("str")) d + c_(upright("num")) \( t - j \) \, #h(2em) j - t lt.eq c_(upright("dig")) d \, $ <eq:ctrl-recipe-bound>]

 with fixed coefficients. Beyond the fixed strata of this prefix, a call is to the preceding prefix of slack $2 d$, or to an estimator of budget at most $M - d$. The final row and incoming wrappers add a fixed number of strata at $d = 1$. Every designated terminal execution obeys the corresponding boundary bounds before guards are imposed.]
] <lem:ctrl-recipes>

#proof[
  Table 2 summarizes the records to be charged. We verify the recipes and their dependencies in the order in which they are constructed. All constants depend only on the fixed construction constants and the base machine.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Operation
], table.cell(rowspan: 1, colspan: 1)[Data retained across a lower call
], table.cell(rowspan: 1, colspan: 1)[Local space bound
]),
  table.cell(rowspan: 1, colspan: 1)[Structural tests and list selection
], table.cell(rowspan: 1, colspan: 1)[Immediate descriptors, loop indices, counts and flags
], table.cell(rowspan: 1, colspan: 1)[$O \( d \)$
],
  table.cell(rowspan: 1, colspan: 1)[Numerical recipes
], table.cell(rowspan: 1, colspan: 1)[Gate paths, pending bits and permitted early operand words
], table.cell(rowspan: 1, colspan: 1)[$c_(upright("str")) d + c_(upright("num")) \( t - j \)$
],
  table.cell(rowspan: 1, colspan: 1)[Ordered terminal paths
], table.cell(rowspan: 1, colspan: 1)[One frame’s choices, phase and bounded inverse tokens
], table.cell(rowspan: 1, colspan: 1)[$O \( d \)$ per immediate frame
],
  table.cell(rowspan: 1, colspan: 1)[Incoming score ranks
], table.cell(rowspan: 1, colspan: 1)[A partial score suffix; the full word only over structural calls
], table.cell(rowspan: 1, colspan: 1)[$O \( 1 + \( t - j \)_(+) \)$ plus structural costs
],
  table.cell(rowspan: 1, colspan: 1)[Graph transition probes
], table.cell(rowspan: 1, colspan: 1)[A fixed number of local raw-state copies and bounded incidence data
], table.cell(rowspan: 1, colspan: 1)[$A \( w - w' \) + D \( t - j \)$
],
)
]],
    caption: [Table 2: Suspended records at a lower call. The bounds exclude shared facilities and the callee’s physical state. Terminal-path frames are charged separately along their explicit chain; graph probes copy only that local raw chain. ],
  )
  ===== 11.4.1 Immediate paths and their values. <immediate-paths-and-their-values.>
  By Lemma 28, a group has at most $2^(O \( d \))$ immediate descriptors: term and channel part, scale and budget offsets, a variant word and wrap choices, bounded copy symbols, and a bounded number of factor ports. All factor budgets are at most $M - d$. A descriptor is stored literally in $O \( d \)$ bits; it never stores a discovered endpoint. Index and range tests are pure computations. Constituent existence tests call only these lower factors. Products cross a paired left edge for right-factor tests or digits, retaining a bounded inverse port; they return after each such query. Factor digits can therefore be requested separately by an arithmetic evaluation path. No assembled left weight remains over a late right-factor digit. Source vector factors are queried at the current source, with the prescribed local projection if needed. Their numerical coefficients and the factor products use a fixed arithmetic recipe.
  For terminal motion the right unbalanced path, or the direct child path, is the last delegation. This is the ordered path of Lemma 65. To avoid a validity cycle distinguish intrinsic constituent existence, intrinsic motion or excursion, and outer validity. Outer validity first checks the intrinsic constituents, then uses an intrinsic excursion for its own hit and wrap conditions. A subsequent outer-valid motion may repeat that validity check and then use the intrinsic motion. Each of these is a separate stratum; none tests the updated bucket or shortlist. Invalid descriptors return failure or a zero value without relying on a motion’s promised inverse.
  All rate factors multiplying these terms have logarithmic range $O \( d \)$: a variable bin has $\| log_2 \( b \/ a \) \| = O \( d \)$, while $f \/ pi_f$ is bounded. Resetting a source rate to the public stage rate does not multiply the numerical term by $f \/ u$; that ratio was a norm cost. It therefore causes neither a large numerical shift nor a new long choice field. The fixed number of bounded-factor products, coefficients and $O \( d \)$ scale shifts obey Theorem 56.
  ===== 11.4.2 Candidate domain and bucket sums. <candidate-domain-and-bucket-sums.>
  The descriptor pool is the concatenation of the preceding list positions and this group’s unmerged paths, with invalid slots masked. A new descriptor is a representative exactly when it is the first valid new descriptor with its key and no old valid position has that key. Old valid positions remain separate. To decide these flags, enumerate the $2^(O \( d \))$ descriptors, keeping only the current indices, bounded flags and $O \( d \)$-bit counts. Each test uses lower validity and endpoint comparison operations. The comparisons use only those unmerged paths or the preceding prefix’s already-defined positions. In particular they never inspect the new value of the bucket being defined.
  An intermediate entry is the old entry at an old representative, or the previous baseline at a new representative, plus the sum of all valid matching increments in each channel. That sum has a fixed $O \( d \)$-bit descriptor domain and boundedly many $2^(O \( d \))$ scale factors. It is evaluated by the balanced sum construction of Theorem 56, with the preceding domain tests as structural leaves. No high-precision sequential accumulator is held while requesting term digits. The bucket rule preserves distinct actual representatives, including when two old representatives have the same key. Thus it gives exactly the intermediate array used in Lemma 43.
  ===== 11.4.3 Ranks, compression, and list selection. <ranks-compression-and-list-selection.>
  The intermediate domain and its values are now earlier inputs. Add enough copies of the default for the size and first-signal ranks. A finite domain of $2^(O \( d \))$ indices suffices: the preceding list has size $2^(O \( 2 d \))$ and the new group has $2^(O \( d \))$ descriptors. The default is included as often as needed to represent the unlimited padding in the prescribed ranks. The rank, max, min, absolute-value and clipping operations of Lemma 32 are the finite arithmetic primitives. The ranges are $2^(O \( d \))$ by Lemma 37; their known normalizing shifts have magnitude $O \( d \)$.
  Here $u_0 gt.eq rho_d = 2^(- c_1 d)$. A canonical finite approximation can test a threshold strictly between $u_0$ and $2 u_0$: with error a sufficiently small fixed fraction of $rho_d$, accept every size greater than $2 u_0$ and accept only sizes greater than $u_0$. The required numerical clock, after normalizing the range, is $O \( d \)$. Fix this clock and tie convention once for that structural test. Consequently every nondefault compressed position is included, and fewer than $n_d$ positions are selected, as in Lemma 32. Numerical equalities at the boundary need not be decided. No default can expose a positive row score: its rank dummies close the gate first, by the margins of Lemma 16.
  Remap a requested list ordinal to its selected intermediate descriptor by enumerating the pool and counting the preceding accepted flags. The loop stores $O \( d \)$-bit indices and a count. Its only calls are the already-defined intermediate flags and finite-margin selection tests. Compressed entry digits then query that descriptor’s intermediate value and the common compression thresholds; baseline digits use those thresholds directly. A terminal list motion selects its descriptor before delegating to an old prefix path or a new valid path. A descriptor from many prefixes ago is therefore represented by a chain of delegations, not retained as one long word above a tight child.
  ===== 11.4.4 Presence before value or motion. <presence-before-value-or-motion.>
  Ordinal lookup returns a presence bit and a selected descriptor only when its finite enumeration reaches the requested ordinal. It starts with a false presence bit and returns false if enumeration ends first; the false branch supplies no descriptor. Every compressed-entry digit query and list motion branches on this fresh result before using a descriptor. The preceding-prefix lookup has the same convention. A hole denotes no real representative. Rank operands retain their prescribed structural selection of an entry, baseline, or padding value; they do not infer that value from the zero stream exported at an absent real port.
  The final precursor $A$ and auxiliary class $A_I$ use the bounded final list-position alphabet, allowing holes. Their presence tests use list presence, role-membership masks, and the fixed-precision raw-entry and raw-rank tests of Lemma 16. Source membership is checked locally; endpoint membership uses the earlier list or intrinsic excursion with a pure membership action. It does not use the exposed-class motion whose validity is being defined. These tests precede the pre-incoming score formula and use neither its incoming gate nor its cap. Every pre-score digit invocation repeats the corresponding class test and returns zero on failure. Other uncapped row-value queries use their support-covering class in the same way. Each such class contains the entire nonzero support, so the extension agrees with the mathematical table. Existence predicates evaluate their earlier masks directly; they do not ask for their own existence. Analytical witness functions without an exported port interface retain their stated full-array values and are not restricted by this convention.
  Immediate-path values and visits first use their earlier constituent and, where appropriate, outer-validity tests. Endpoint comparisons likewise test their two earlier descriptors before making visits. A capped correction-value query stops with zero if its forward paired move fails; only a successful move permits a gate or column-value query at the endpoint. The paired inverse keeps its target-side validator from Lemma 63. Incoming ranks and vector queries return zero outside their prescribed vertex type or membership domain. These checks are repeated at canonical entry, including when the caller is a synthetic post-initiation state with a fabricated validity flag. An excursion checks before constructing its spine; its endpoint action and rollback retain the order of Lemma 65.
  Place these entry wrappers a fixed number of strata above their validity predicates and value or motion cores. A wrapper at clock $t$ calls its structural test at clock zero and retains $O \( d \)$ descriptor and control bits; its boundary is therefore bounded by $O \( d \) + b t$. When it subsequently calls a numerical core at clock $j$, the test has finished and only bounded status and descriptor data remain, so the bound $a d + b \( t - j \)$ persists after enlarging $a$. The predicates use the fixed structural precisions already proved. They do not call the score, gate, cap, new bucket or new shortlist whose value is being checked. The finite stratum list is enlarged before choosing the allowance constants. Recipe guards permit opaque calls only to total entry wrappers, so a synthetic state cannot select a continuation that skips validation. No semantic predicate is evaluated by a guard itself.
  These wrappers preserve the represented relations, values and outgoing endpoints. Their insertion may change the contour ordering of incoming ports; both directions use the same updated graph, so pairing remains consistent. The tests use the same effective tuples and fixed structural clocks, and restore the catalyst on both outcomes. They require no accuracy promise and add no retained endpoint address.
  ===== 11.4.5 Finite strata within a group. <finite-strata-within-a-group.>
  For clarity, a permissible ordering, from an exported operation down to its dependencies, is:
  + compressed entries, baseline and list-port operations;
  + ordinal remapping, compression and exception selection;
  + size and first-signal ranks of intermediate entries;
  + intermediate domain flags and entry or bucket-sum values;
  + first-representative and key-match predicates;
  + endpoint comparisons of outer-valid paths;
  + outer-valid visits, then outer path validity;
  + intrinsic visits, constituent tests, factor digits and ordered motions, subdivided according to the preceding distinction.
  The wording of an interface name does not force a call at the same stratum. For example, the “visit” used to verify outer validity is the intrinsic visit, while the visit used by key comparison is an outer-valid visit. Arrange these finite subtypes in their indicated dependency order: outer-valid visits use outer validity; outer validity uses intrinsic visits; key comparisons use outer-valid visits; and bucket predicates use those comparisons. Arithmetic on intermediate values uses only their domain flags and lower matching predicates. This refines the displayed list to a finite acyclic list. Repeated enumeration over descriptors stays in a loop of its layer, rather than creating one recursive frame per descriptor. Between these layers Theorem 56 gives (11.5); structural loops add $O \( d \)$ bits. All remaining path calls go to the preceding prefix or to the lower-budget factors already described.
  ===== 11.4.6 Final row classes and pre-incoming values. <final-row-classes-and-pre-incoming-values.>
  At the final slack $d = 1$, the list size, port alphabet and all threshold gaps are constants. The classes and witnesses in Lemma 17 are defined by canonical finite-margin entry and rank tests on the final raw arrays. They can be enumerated without testing positivity of a computed score. Their tests and pre-incoming score digits query only the final buffer and a fixed arithmetic recipe. The same raw-array tuple is used for every row. A normalized dense entry uses its second raw argument, divided by the fixed scaling constant and clipped before the reciprocal. It does not start a new preparation experiment at its unbalanced endpoint.
  The broader auxiliary class used to score an incoming gate depends only on the corresponding pre-incoming row calculation. Its validity and score queries do not depend on that incoming gate or cap. The precursor $A$ for a correction has the same property. Its canonical terminal program begins with a restoring check of the full precursor class and membership domain, and sends every invalid initiation to failure. Thus Lemma 63 counts exactly its valid entries, not merely entries promised valid by an external caller. The auxiliary scoring program has the same initial check. Its score digits are pre-incoming, so Lemma 64 invokes only lower forward operations. By Lemma 17, discarding a precursor with more than $K_c$ incoming entries preserves its value.
  ===== 11.4.7 Final incoming and vector wrappers. <final-incoming-and-vector-wrappers.>
  Place the capped-pair and inverse-score wrappers above their respective terminal programs, and those programs above their pre-class, selection and pre-score queries. They are separate terminal programs: the gate score program does not call this task’s cap pairing, and the cap program does not call its gate rank. A final correction-value query first completes the paired move. At the endpoint its motion-return data consist only of the bounded inverse port while it queries a gate-rank digit or a lower-budget column-vector digit, and then returns. This can be done separately for every arithmetic operand bit. Only numerical path bits and immediate descriptors coexist with a late query. The factor $r_i$ at a projected source is handled in the same way at that source.
  A detector trial is an inverse-score wrapper of its lower-budget input row task. Reward terms query source factors locally and cross paired corrections before midpoint vector queries. Vector prefix sums use the simpler balanced arithmetic form of the same dyadic schedule. These are all the vector and incoming uses in the additive formulas. There are only a fixed number of final wrapper types. Their short counts and return ports cost a fixed allowance gap. In an inverse score program the saved numerical suffix satisfies the clock bound in Lemma 64; its full word is held only over structural motion. The cap wrapper’s counts have fixed size.
  ===== 11.4.8 Uniform generation and record bounds. <uniform-generation-and-record-bounds.>
  Each enumerated object above has a literal $O \( d \)$-bit index or is a Boolean path in one of the stated arithmetic recipes. Uniform index-generation uses finite integer loops on these indices, including rank comparison pairs and balanced-tree nodes. Constants, field/rate coefficients and walk probabilities have $O \( B \)$-bit rational descriptions. Their requested digits use integer arithmetic in scratch and make no recursive graph call. In particular, a walk word has length $O \( d \)$ and a fixed rational generator probability, so its probability denominator has $O \( d \)$ bits. Rate and field expressions involve fixed powers of $O \( B \)$-bit integers. The arithmetic theorem’s uniformity and public-coefficient hypotheses are thus satisfied.
  The finite arithmetic list covers the formulas used here explicitly. A fixed polynomial switch is evaluated on an affine-rescaled clipped argument; positive parts and absolute values use maxima, and a variable clip is a minimum followed by a maximum. The normalizing reciprocals have their arguments clipped to $\[ 1 \/ 2 \, 1 \]$. The eighth roots used in the error estimates express regularity of the row functions and are not additional numerical operations requested by the controller. Ranks inside a prefix use the finite descriptor construction above; the unbounded incoming classes use Lemma 64. This accounts for the arithmetic primitives without adding a real-number comparison or an incoming-rank oracle.
  Structural selection words and loop counters have $O \( d \)$ bits. The only longer local numerical words are the early operand records of Theorem 56 and the just-described score suffix; they obey their explicit clock-decrement bounds. Late operand calls hold only numerical paths, pending bounded results, immediate descriptors and short inverse tokens. A fixed number of arithmetic and structural layers enlarges the constants in (11.5); its clock differences add. Ordered terminal delegations add their own immediate records, with the same estimate at each boundary, including on rollback as proved in Lemma 65. This verifies the record certificate on the designated executions, independently of any graph guards. ◻
]

#thm([Lemma 11.11.])[
  (Parameter replay and salt visibility).  #emph[The records in Lemma 67 are regenerable in the sense of Definition 59. With respect to their own effective environments, actual procedures at a budget in block $b$ ignore all salt blocks later than $b$, including in structural orders, graph universes, guards and predecessor probes. Re-querying a table entry or using a paired port in either direction uses the same effective table tuple.]
] <lem:ctrl-replay>

#proof[
  Start with the fixed top parameters and scan the active records. An estimator edge specifies a task type, a stage change prescribed by the formula, a budget offset, a bin-scale offset if present, a bounded copy choice and channel-role recipe. These determine the next absolute stage, rates and suffixes. A projection appends the stored symbol before the inherited suffix. A fresh midpoint or vector role uses the specified public stage rate and its prescribed suffix; it does not carry the old source. These are the common-tuple recipes in Lemma 17 and Lemma 28.
  An averaging edge also carries its generator and wrap word. Apply these fixed transformations in order to the current environment. Their descriptors are independent of the indicated endpoint; membership and wrap consistency are tested separately on visits to that vertex. Thus no discarded conditioning address is needed to regenerate the environment. For an old-prefix edge the tuple stays that of the same row calculation. At final assembly a gate or column multiplier uses this common tuple, rather than the internal variant which happened to lead to a selected representative. An action-owner tag allows an endpoint-local calculation to replay just to that ancestor tuple.
  Numerical paths specify arithmetic operands, gates, digit places and the early-prefix modes of a reciprocal. Their finite index rules are those of Theorem 56; an absolute place is recovered from the root clock and the path or offset, not saved afresh per frame. Descriptor selections which used the cursor were stored explicitly as their bounded choices before movement. No later tuple computation needs to repeat such a selection at an unknown old cursor.
  At every step the tuple and the temporary integers have $O \( B \)$ bits in the actual parameter and clock ranges. Keep a current tuple in scratch and overwrite it as each record is processed. Repeating the scan reconstructs an ancestor or a selected candidate chain. Delimiters and marked active-copy tags specify which chain is used. This costs one scratch facility, including its scanning counters, rather than one absolute pointer, input-head position or tuple per frame.
  A pure endpoint action belongs to its outer invoking predicate and may read that owner’s permitted salt. It is excluded from the lower program graph and cannot affect the lower path or rollback. Nested lower queries still restore their arbitrary incoming catalyst contents.
  Finally, the only salt read by a new group comparison is its task’s own block salt. Descendants do not increase their budget. Walks alter only the already designated earlier free salt blocks and leave the present and later ones frozen. All descriptor and instruction orders are fixed index orders; all range and length checks depend only on public bounds and accessible tuple fields. Give each recipe the syntactic permission to address only those salt blocks at most its budget block in its effective environment. This is a direct range check on a requested salt index, not a condition on the salt’s value. A synthetic record cannot change that permission, choose a higher-budget recipe, or bypass the fixed parent-to-child rules. The same replay and checks are used before predecessor queries. Consequently the entire lower-block structure is independent of later salts. The clean calculation in Lemma 40 uses the same fixed descriptor orders and structural clocks, with its stipulated replacements of comparison predicates. The error proof uses the salt independence of the actual lower algorithms and of the clean recipes. ◻
]

#prodef([Remark 11.12.])[
  (Effective coordinates and physical replay).  The salt assertion in Lemma 68 is a statement about a task as a function of its effective environment. For fixed other task parameters, write this function schematically as $F_b \( eta \)$. Its values, access orders and guarded program graph use only the rank channels and the permitted salt coordinates of $eta$. An ancestor can invoke it at $eta = phi \( sigma \)$, where $sigma$ is the master environment and $phi$ is a recorded environment transformation. Computing the permitted coordinates of $phi \( sigma \)$ can read physical master bits whose original block indices exceed $b$. Those reads derive the effective argument; they do not give $F_b$ a new semantic parameter or permission to inspect later coordinates of that argument.
  For a clean calculation in the current block, the current task’s own walks vary the earlier effective salt coordinates and freeze its current and later ones. Same-block clean comparisons omit the current key, and lower-block procedures obey the local permission rule just proved. This is the coordinate convention used for the slice means in Lemma 40. A callback owned by a higher task remains the separate pure endpoint action described above; it cannot enter the lower graph, change its selected path or affect rollback through catalytic contents.
] <rem:ctrl-effective-environment>

=== 11.5 The uniform space theorem <sec:ctrl-space>

Two linear quantities organize the final accounting. For positive physical-space coefficients $A \, D$, chosen below, define

#[#set math.equation(numbering: n => "(11.6)")
 $ Phi \( w \, t \) = A w + D t \, #h(2em) Psi \( w \, t \) = t + a' w \, $ <eq:ctrl-potentials>]

where $a'$ is the clock-overshoot coefficient in Definition 60. The decrease of $Phi$ will pay for a suspended physical segment, including its local probe copies. The nonincrease of $Psi$ will bound every descendant numerical clock and hence the shared arithmetic scratch.

#proof[
  Let $S$ exceed the finite number of operation strata in Lemma 67, including the subdivision of path validation and all final wrappers. Choose fixed integers $K_0 > S + 1$ and $K_1 > 2 \( K_0 + S + 1 \)$, increasing them as needed for the local constants. Assign to an operation at budget $M$, prefix slack $d$ and stratum $s_0 in { 0 \, dots.h \, S }$ the allowance
  #[#set math.equation(numbering: n => "(11.7)")
   $ w = K_1 \( 1 + M \) - \( K_0 + s_0 \) d . $ <eq:ctrl-allowance-formula>]
  Final wrappers use $d = 1$, with increasing $s_0$ down their dependencies. For a nontrivial prefix, $1 lt.eq d lt.eq M$; trivial tasks use fixed top strata and terminate locally.
  A same-slack descent lowers $w$ by at least $d$. A preceding-prefix descent to $2 d$, even with a reset to an earlier stratum, lowers it by at least $\( K_0 - S \) d > d$. A statistical descent to $m lt.eq M - d$ lowers it by at least $\( K_1 - K_0 - S \) d$, since the child allowance is at most $K_1 \( 1 + m \)$ minus a nonnegative stratum term. Hence every required boundary has $w - w' gt.eq c d$ for a fixed $c > 0$, and all allowances remain positive and $O \( 1 + M \)$. The estimates (11.5) and the ordered-path record certificates give Definition 60, with common coefficients. When a common clock coefficient is increased, compensate the allowance coefficient using the bounded clock overshoot, just as in (11.3). Add a fixed allowance gap for a traversal wrapper’s bounded incidence, count and status data.
  There are two distinct estimates in this induction. First, Lemma 67 certifies the raw caller words with the same $a_0 \, b_0$ at every budget; a lower opaque operation contributes its call recipe, but none of its internal working states, to that certificate. Second, Lemma 61 converts a copied raw portion to its physical bound with one fixed pair $A \, D$. The induction below appends a lower operation’s physical portion; it never substitutes that physical portion into an upper raw graph state. The raw certificate therefore does not depend recursively on the already enlarged physical constants.
  Construct the procedures in increasing allowance. The induction covers all recipe instances admitted by the finite range and parent-to-child checks: both designated calls and calls made when probing candidate predecessor records. It does not require such a candidate record to have occurred on a designated execution. Each opaque call still enters the lower procedure at its canonical entry, where its semantic presence tests are performed. At the bottom are local base ports, rank and salt evaluation, rational arithmetic without graph operands, and trivial zero tasks. Suppose lower operations are total, have their claimed cursor and catalyst behavior, and obey the local bounds. The finite restoring and numerical recipes of Lemma 67, using Theorem 56, then compute exactly their specified bit or digit. Their finite loops and lower calls terminate. Endpoint visits use Lemma 65, and completed endpoint comparisons use Lemma 66. The latter restores arbitrary catalyst contents and has an independent answer, preserving the induction hypothesis. The other recipes make no direct catalyst-dependent choice.
  The canonical terminal programs have finite loops and only lower terminal delegations or opaque calls, so their prescribed executions terminate. Their class checks send invalid canonical initiations to failure. The certificates already proved show that all their designated boundaries fit the local bounds. By Lemma 68, their parameters and static guards are uniform and independent of a discarded cursor. We may therefore apply Lemma 61. Guards remove no designated execution. At synthetic states they ensure that every probed query has an admissible lower tuple and available space; fresh safe lower queries do not rely on the truth of an earlier stored flag.
  The finite graph contours of Lemma 62 now implement the higher cap and inverse-rank wrappers in Lemmas 63 and 64. They terminate on success-root components even if other graph components contain cycles or guard-created dead ends. They count only the canonical initial executions of these programs, so their paired maps and ranks are the mathematical ones specified by the tables. By the common root tuple and salt convention the same maps are obtained in either direction and on every re-query. This completes the well-founded construction. An opaque query in this induction denotes its already constructed finite procedure; recursively substituting these procedures gives an ordinary deterministic machine.
  The allowance is a runtime parameter of this fixed finite collection of instruction types, rather than an index for input-dependent program text. Operation tags select the finite recipe family; loop counters, gate paths and regenerable descriptors select its current instance. Thus the induction constructs one uniform interpreter for these instructions. It requires neither a separately compiled machine for each budget nor stored transition graphs for the contours.
  It remains to add all simultaneously live data. By Lemma 61, a traversal root at $\( w_i \, t_i \)$ with a pending query at $\( w_(i + 1) \, t_(i + 1) \)$ contributes at most
  #[#set math.equation(numbering: n => "(11.8)")
   $ A \( w_i - w_(i + 1) \) + D \( t_i - t_(i + 1) \) = Phi \( w_i \, t_i \) - Phi \( w_(i + 1) \, t_(i + 1) \) $ <eq:ctrl-stack-segment>]
  local bits, including its fixed number of neighbor-state copies. Ordinary restoring and numerical calls have the same bound after one enlargement of $A \, D$. Inverse traversal copies only its local explicit chain, not older stack segments or the internal configurations of a transition query. Choose $A \, D$ also to dominate the bottom operation’s intrinsic linear bound. If the active chain has boundaries $0 \, dots.h \, r$, with boundary zero at the top, put $Phi_i = Phi \( w_i \, t_i \)$. The total local space is at most
  $ sum_(i = 0)^(r - 1) \( Phi_i - Phi_(i + 1) \) + Phi_r + O \( 1 \) = Phi_0 + O \( 1 \) = A w_(upright("top")) + D t_(upright("top")) + O \( 1 \) . $
  Figure 1 shows which records enter each summand.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 5.62), [#text(size: 8pt)[Physical stack segments \(earlier segments omitted\)]], anchor: "west", padding: 0.07056cm)
  rect((0, 3.55), (10.6, 5.25), fill: rgb("#f7f7f7"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.5pt, miter-limit: 10))
  content((0.18, 4.96), [#text(size: 8pt)[Segment $i$ at $(w_i,t_i)$]], anchor: "west", padding: 0.07056cm)
  content((10.42, 4.96), [#text(size: 8pt)[$ell_i lt.eq Phi_i- Phi_(i+1)$]], anchor: "east", padding: 0.07056cm)
  rect((0.2, 4.05), (5.2, 4.63), fill: rgb("#ffffff"), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((2.7, 4.34), [#box(width: 4.841cm, inset: 0.07056cm, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Local raw caller records]]])])
  rect((5.4, 4.05), (10.4, 4.63), fill: rgb("#ffffff"), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((7.9, 4.34), [#box(width: 4.841cm, inset: 0.07056cm, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Copies of this raw state only]]])])
  content((5.3, 3.79), [#text(size: 8pt)[Bounded incidence, count, and status data]])
  line((5.3, 3.55), (5.3, 2.9), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.17cm, fill: black)))
  content((5.406, 3.225), [#text(size: 7pt)[append on opaque call]], anchor: "west", padding: 0.07056cm)
  rect((0, 1.9), (10.6, 2.9), fill: rgb("#f7f7f7"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.5pt, miter-limit: 10))
  content((0.18, 2.64), [#text(size: 8pt)[Child segment $i+1$]], anchor: "west", padding: 0.07056cm)
  content((10.42, 2.64), [#text(size: 8pt)[$ell_(i+1) lt.eq Phi_(i+1)- Phi_(i+2)$]], anchor: "east", padding: 0.07056cm)
  content((5.3, 2.2), [#text(size: 8pt)[Its own raw chain, raw copies, and bounded metadata]])
  content((5.3, 1.59), [#text(size: 8pt)[$dots.v$]])
  rect((0, 0.55), (10.6, 1.3), fill: rgb("#f7f7f7"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.5pt, miter-limit: 10))
  content((0.18, 0.925), [#text(size: 8pt)[Bottom segment $r$]], anchor: "west", padding: 0.07056cm)
  content((10.42, 0.925), [#text(size: 8pt)[$ell_r lt.eq Phi_r+O(1)$]], anchor: "east", padding: 0.07056cm)
  rect((11.2, 0.55), (15.4, 5.25), fill: rgb("#ebebeb"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.5pt, miter-limit: 10))
  content((13.3, 4.96), [#text(size: 8pt)[Shared once]])
  line((11.4, 4.65), (15.2, 4.65), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10))
  content((13.3, 2.96), [#box(width: 3.741cm, inset: 0.07056cm, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 8pt)[Master environment#linebreak() Top root parameters#linebreak() One current cursor#linebreak() Catalytic vector#linebreak() Scratch and#linebreak()scan counters]])])
  content((13.3, 1.08), [#text(size: 8pt)[$O(B+w_0+t_0)$ bits]])
  line((10.6, 4.34), (11.2, 4.34), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#737373")), end: (symbol: ")>", fill: rgb("#737373"))))
  line((10.6, 2.2), (11.2, 2.2), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#737373")), end: (symbol: ")>", fill: rgb("#737373"))))
  content((5.3, 0.22), [#text(size: 8pt)[$ sum_(i=0)^r ell_i lt.eq sum_(i=0)^(r-1)( Phi_i- Phi_(i+1))+ Phi_r+O(1) = Phi_0+O(1)$]], anchor: "north", padding: 0.07056cm)
})],
    caption: [Figure 1: Physical stack space, with $ell_i$ the length of segment $i$ and $Phi_i = Phi \( w_i \, t_i \)$. Opaque child work is appended outside raw copies. The proved record certificates and local graph bound, with enlarged $A \, D$, pay for copies and metadata. Shared facilities are counted separately. The displayed copies occur at traversal calls; older physical segments are not copied into the child. Ordinary restoring and numerical segments obey the same difference bound. ],
  ) <fig:ctrl-space>
  The clock inequality in (11.1) gives
  #[#set math.equation(numbering: n => "(11.9)")
   $ Psi \( w_(i + 1) \, t_(i + 1) \) lt.eq Psi \( w_i \, t_i \) . $ <eq:ctrl-clock-invariant>]
  Since $t_i lt.eq Psi \( w_i \, t_i \)$, all clocks are $O \( t_(upright("top")) + w_(upright("top")) \)$. This also bounds the public scratch calculations in the arithmetic theorem. An uncharged full coefficient or cursor copy cannot persist there: any operand-dependent early word crossing a query was included in its record certificate, while pure public computations have no recursive query. The master environment, cursor, catalyst, scratch and their global scan counters are single facilities. Their total space is $O \( B + t_(upright("top")) + w_(upright("top")) \)$.
  For exact-stream semantics the induction is valid for each finite requested clock, allowing scratch to scale with that clock. Every structural domain uses its fixed finite-margin clock, so its definition does not change in this argument. In particular the integer $N_t$ of a score rank or arithmetic operation is always evaluated by its own place convention, even when used in a request for the next digit. The actual application has $M_(upright("top")) \, t_(upright("top")) = O \( B \)$, and hence all these facilities and active records use $O \( B \)$ bits. ◻
]

== 12 Derandomization and quantitative consequences <sec:conclusion>

We now complete the proof of $sans(L) = sans(R L) = sans(B P L)$. The hierarchy approximates the acceptance probability by a deterministic reward, and the actual estimator approximates that reward in an integrated error norm. We pass from this norm to the specified start, enumerate the finite conditional environment law, and take a median. The controller computes each estimator value in logarithmic space and is total on every environment. This gives the following approximation result without any decision-gap promise.

All transducers below have read-only input and a one-way write-only output tape. Output contents are never available as work memory. For a fixed randomized machine $cal(M)$, write $p_(cal(M)) \( x \)$ for its acceptance probability on input $x$.

#thm([Theorem 12.1.])[
  (Fixed inverse-polynomial accuracy).  #emph[Fix a randomized machine $cal(M)$ with polynomial worst-case running time and $O \( log \( n + 2 \) \)$ work space, and fix an integer $d gt.eq 1$. There is a uniform deterministic transducer that, on every input $x$ of length $n$, outputs a dyadic rational $z_x in \[ 0 \, 1 \]$ with 
$ \| z_x - p_(cal(M)) \( x \) \| lt.eq \( n + 2 \)^(- d) . $

 Its work space and output length are $O \( log \( n + 2 \) \)$, and its running time is polynomial in $n + 2$. The constants may depend on $cal(M)$ and $d$, but not on the input.]
] <thm:fixed-precision>

The fixed exponent in this theorem is enough to decide bounded-error computations. After proving it, we derive the class equality and its promise version. We then allow the requested accuracy to be part of the input and construct accepting computations under an inverse-polynomial probability promise.

=== 12.1 Choosing constants and finite ranges <subsec:final-constants>

The construction has the following order of choices.

+ Fix $H \, h_0 \, s = 8$ and the fixed number of independent channels. The finite-action gap is uniform in every later modulus and bit length.
+ Choose the correction thresholds and cutoff, then the iteration count $k_(*)$ from the factorial bound and its resulting uniform magnitude constants. These estimates hold for every column multiplier in $\[ 0 \, 1 \]$.
+ Choose $D_0$ for the density reduction, the routing thresholds, and the finite ladders of entry and gate thresholds. The row-gate rank $K$ can then be chosen from the row-mass bounds alone.
+ Choose the detector rank $J$ large enough for the incidence bound on extra copies. Choose $R_(*)$ large enough for overload detection, and finally the incoming rank $K_c$ large enough for correction normalization. The earlier row-gate choice does not depend on $K_c$.
+ Fix the bounded-output constant, the scale cutoff and precision coefficient, and the prefix mean exponent. Choose the buffer floor and capacity exponents and its noise coefficient so that all buffer sums converge. Choose task separation and walk length coefficients sufficiently large for the small constants in the clean estimation induction.
+ Fix the crude range and propagation constants, then the block gain coefficients $D_2 \, D_1$ and a sufficiently small rational block width coefficient $epsilon.alt$. These choices close the coupled fingerprint induction of Theorem 46.
+ Choose the fixed operation-stratum and allowance coefficients and the guard constants in Theorem 58. Their finite enlargement does not alter the analytical tables or the distribution of the environment.
+ Choose the linear top-budget coefficient, the field-size exponent, and the minimum padding of $B$.

Within each step only finitely many strict inequalities between fixed constants are needed. The proofs in the corresponding sections give these inequalities. In particular, the row rank is fixed before the incoming rank, the block constants follow the crude error constants, and the field is chosen after the reachable resource ranges. There is no dependence of an earlier sampler gap on that last choice.

The coefficient $epsilon.alt$ in this order is the fixed fingerprint block-width coefficient. Once it has been chosen, increasing the fixed linear top budget increases the number of salt blocks but leaves the sampler’s gap uniform: all earlier salt bits form one free component in Lemma 20. The storage estimate (9.4) therefore remains $O \( B \)$.

For clarity, one may bound the stage index by $L$, the inherited suffix length by the stages remaining above a task, and logarithms of reciprocal requested rates by

#[#set math.equation(numbering: n => "(12.1)")
 $ H L + c \( M_(upright("top")) - M \) $ <eq:final-admissible>]

with a sufficiently large fixed $c$. A child at slack $d$ can extend the variable scale range by only $O \( d \)$ and loses at least $d$ of budget. Stage-rate resets are already covered by $H L$. The finitely many local task operations use the stated widths and fixed subranks. Thus Equation (12.1) is closed under all estimator recipes. The controller guards allow these designated executions.

There is consequently a fixed $C_P$ such that a prime

$ 2^(C_P B) lt.eq P lt.eq 2^(C_P B + 1) $

is larger than all identifiers, makes the radix invertible, and gives $P 2^(- k) gt.eq 1$ for every rate ever requested. Bertrand’s postulate provides such a prime; testing consecutive integers by trial division finds one using $O \( B \)$ space. The search range and running time are $2^(O \( B \))$. Field arithmetic and fixed-dimensional rank tests also use $O \( B \)$ space.

=== 12.2 A dyadic approximation at the specified start <a-dyadic-approximation-at-the-specified-start>

#thm([Lemma 12.2.])[
  (Conditioning on one start).  #emph[Let $W in \[ 0 \, 1 \]^V$, and suppose an estimator satisfies 
$ 1 / N bb(E) sum_(v in V) frac(X_f \( v \), f) \| macron(W) \( v \) - W \( v \) \|^8 lt.eq C_b^8 2^(- 8 p) . $

 For any specified $z in V$ and every $eta > 0$, 
#[#set math.equation(numbering: n => "(12.2)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] \| macron(W) \( z \) - W \( z \) \|^8 divides X_f \( z \) = 1 #scale(x: 120%, y: 120%)[\]] & lt.eq N f / pi_f C_b^8 2^(- 8 p) \,\
Pr #scale(x: 120%, y: 120%)[\[] \| macron(W) \( z \) - W \( z \) \| > eta divides X_f \( z \) = 1 #scale(x: 120%, y: 120%)[\]] & lt.eq N f / pi_f C_b^8 2^(- 8 p) eta^(- 8) . $ <eq:final-conditional>]

]
] <lem:final-majority>

#proof[
  Keep only the nonnegative summand at $z$. Since $Pr \[ X_f \( z \) = 1 \] = pi_f > 0$,
  $ pi_f / f bb(E) #scale(x: 120%, y: 120%)[\[] \| macron(W) \( z \) - W \( z \) \|^8 divides X_f \( z \) = 1 #scale(x: 120%, y: 120%)[\]] = bb(E) #h(-0.16667em) [frac(X_f \( z \), f) \| macron(W) \( z \) - W \( z \) \|^8] lt.eq N C_b^8 2^(- 8 p) . $
  Dividing by $pi_f \/ f$ proves Equation (12.2). In particular, choosing one specified coordinate costs the factor $N$ from the integrated norm. Markov’s inequality gives Equation (12.2). ◻
]

#proof[
  Apply Lemma 3 to $cal(M)$, with no promise on its acceptance probability. Set
  $ r = d ceil.l log_2 \( n + 2 \) ceil.r \, #h(2em) Delta = 2^(- r) \, #h(2em) L = ⌈frac(C_0 B + r + 3, H - 1)⌉ \, $
  where $\| V_0 \| lt.eq 2^(C_0 B)$ is an explicit configuration bound. Since $d$ is fixed, $r \, L = O \( B \)$. Let $z$ be the all-primary copy of the start at stage $L$. Proposition 11 gives
  #[#set math.equation(numbering: n => "(12.3)")
   $ 0 lt.eq p_(cal(M)) \( x \) - W_L \( z \) lt.eq Delta \/ 8 . $ <eq:final-hierarchy-accuracy>]
  This bound holds for every acceptance probability. Choose a fixed $C_N$ large enough to bound all the resulting stage domains by $N = 2^(C_N B)$.
  For the final reward task take $a = u = f = b_L$. Its rank satisfies $i_(*) = O \( L + 1 \)$, and Equation (7.7) reads
  $ p = M_(upright("top")) \/ K_(upright("prec")) - H L - A_(*) i_(*) . $
  By Lemma 4, fix an integer $C_(upright("tail")) gt.eq 1$ bounding $\( f \/ pi_f \) C_b^8$ throughout the admissible range. Choose the fixed linear coefficient of $M_(upright("top")) = O \( B \)$ large enough that
  #[#set math.equation(numbering: n => "(12.4)")
   $ p gt.eq r + 3 + frac(C_N B + ceil.l log_2 C_(upright("tail")) ceil.r + 3, 8) . $ <eq:final-precision-choice>]
  The top-budget and field-size choices in the preceding subsection allow this enlargement; Equation (12.1) still bounds every descendant rate. Theorem 46 supplies the reward moment estimate. Lemma 71, with $eta = Delta \/ 8$, now shows that
  #[#set math.equation(numbering: n => "(12.5)")
   $ Pr #scale(x: 120%, y: 120%)[\[] \| macron(W)_L \( z \) - W_L \( z \) \| > Delta \/ 8 divides X_f \( z \) = 1 #scale(x: 120%, y: 120%)[\]] lt.eq 1 \/ 8 . $ <eq:final-good-environments>]
  Thus the factor $N$ lost on selecting one coordinate has been paid by the statistical precision. Explicitly, the bound in Equation (12.2) is at most
  $ C_(upright("tail")) thin 2^(C_N B - 8 p + 8 r + 24) lt.eq 2^(- 3) \, $
  by Equation (12.4).
  We next turn the estimator values into a finite list of dyadic numbers. For each master environment, Theorem 56 gives the digits $w_j in { - 6 \, dots.h \, 6 }$ of its one fixed value $macron(W)_L \( z \)$. Structural choices do not depend on the requested digit. Put $K = r + 6$, compute
  $ A_sigma = sum_(j = 0)^K w_j 2^(K - j) \, #h(2em) a_sigma = min { 2^K \, max { 0 \, A_sigma } } \, #h(2em) v_sigma = a_sigma 2^(- K) . $
  The integer $A_sigma$ is obtained by starting at zero and applying $A arrow.l 2 A + w_j$ in order, so it uses $O \( K \)$ bits. By Equation (10.2), the truncation error is at most $6 thin 2^(- K) < Delta \/ 8$. Clipping cannot increase error relative to $W_L \( z \) in \[ 0 \, 1 \]$. Equations (12.3) and (12.5) imply that, on more than three quarters of the environments conditioned on $X_f \( z \) = 1$,
  #[#set math.equation(numbering: n => "(12.6)")
   $ \| v_sigma - p_(cal(M)) \( x \) \| < 3 Delta \/ 8 . $ <eq:final-dyadic-accuracy>]
  Enumerate the conditional law exactly. Enumerate each field-matrix entry in ${ 0 \, dots.h \, P - 1 }$ and each raw salt bit string, retaining precisely those encodings whose positive-degree columns form a frame and for which $X_f \( z \) = 1$. The retained encodings are equally weighted and give the law in Equation (12.5). In particular, enumerate the original salt strings, not their reduced fingerprint parameters. Different raw strings that induce the same fingerprint remain separate encodings; their multiplicities reproduce the original probability law. At least one encoding is retained: a frame exists, and its independent constant column can place the designated evaluation in the nonempty retention box. The matrices have fixed dimensions and $log P = O \( B \)$; together with Equation (9.4), this gives $O \( B \)$ bits per master environment and at most $2^(O \( B \))$ encodings to enumerate.
  Let $E gt.eq 1$ be the number of retained encodings, found by one pass, and let $h = floor.l E \/ 2 floor.r + 1$. Binary-search the integer interval $\[ 0 \, 2^K \]$ for the least $a$ such that at least $h$ retained encodings satisfy $a_sigma lt.eq a$. Each count is computed by a fresh pass, recomputing each numerator $a_sigma$. This finds the upper median of the finite multiset, including all repetitions. Since more than three quarters of its members satisfy Equation (12.6), so does its median: fewer than $E \/ 4$ values can lie below the indicated interval, and fewer than $E \/ 4$ can lie above it. The algorithm retains only the current count and search registers; it never stores the multiset. Output the integers $\( a \, K \)$ representing $z_x = a 2^(- K)$. Then
  $ \| z_x - p_(cal(M)) \( x \) \| < 3 Delta \/ 8 lt.eq \( n + 2 \)^(- d) . $
  We account for the memory held during this computation. The master environment, current cursor, catalyst, shared scratch, and suspended controller records together use $O \( B \)$ bits by Theorem 58, because $M_(upright("top")) \, K = O \( B \)$. The outer computation keeps only a fixed number of additional $O \( B \)$-bit registers: its top parameters and designated start, the environment enumeration index, $E$, $h$, the current count, the two binary-search endpoints and candidate, the digit index, and the signed numerator accumulator. Each count is bounded by the number of environment encodings, so it also has $O \( B \)$ bits. These outer registers remain live while a digit query runs; in particular, both its environment-enumeration state and its numerator accumulator are included. They are present once for the whole computation, not once per recursive level. Every query terminates on every environment, including the inaccurate environments, by the same realization theorem. The output is written only after the median is computed.
  Each digit query is a halting deterministic computation with $O \( B \)$ work bits and physical input heads confined between the real endmarkers. Counting its finite control, work-tape contents, and all work and input head positions gives at most $2^(O \( B \))$ complete configurations on its fixed input. A repeated complete configuration would force a deterministic loop, so totality bounds the query by $2^(O \( B \))$ steps. There are $2^(O \( B \))$ environment encodings, $O \( K + 1 \)$ binary-search passes, and $K + 1$ digit queries per numerator. Their product is still $2^(O \( B \)) = \( n + 2 \)^(O \( 1 \))$. All finite parameters are generated uniformly, and all constants are fixed for $\( cal(M) \, d \)$. ◻
]

=== 12.3 The class equality and promise separation <the-class-equality-and-promise-separation>

#proof[
  Let $cal(M)$ recognize a language in $sans(B P L)$, with acceptance probability at most $1 \/ 3$ on no inputs and at least $2 \/ 3$ on yes inputs. Apply Theorem 70 with $d = 3$. For every input length, including $n = 0$, its error is at most $\( n + 2 \)^(- 3) lt.eq 1 \/ 8$. Hence the dyadic answer is at most $1 \/ 3 + 1 \/ 8 = 11 \/ 24$ on a no input and at least $2 \/ 3 - 1 \/ 8 = 13 \/ 24$ on a yes input. Comparing this answer with $1 \/ 2$ decides the language uniformly in logarithmic space. This proves $sans(B P L) subset.eq sans(L)$ directly from probability approximation.
  A deterministic machine may ignore its coins, giving $sans(L) subset.eq sans(R L)$. Two independent repetitions of an $sans(R L)$ machine, accepting if either repetition accepts, have acceptance probability zero on no inputs and at least $3 \/ 4$ on yes inputs. They use logarithmic space and polynomial time, so $sans(R L) subset.eq sans(B P L)$. The three inclusions prove $sans(L) = sans(R L) = sans(B P L)$. ◻
]

A promise problem is a pair $\( Y \, N \)$ of disjoint sets of inputs. Here $sans(P r o m i s e B P L)$, denoted $sans(p r B P L)$ in the introduction, requires one polynomial-time randomized logarithmic-space machine that halts on every input, accepts each input in $Y$ with probability at least $2 \/ 3$, and accepts each input in $N$ with probability at most $1 \/ 3$. The class $sans(P r o m i s e L)$ consists of pairs separated by a total deterministic logarithmic-space decider; there is no correctness requirement outside $Y union N$.

#thm([Corollary 12.3.])[
  #emph[Under these conventions, $sans(P r o m i s e B P L) = sans(P r o m i s e L)$.]
] <cor:promise-bpl>

#proof[
  The same $d = 3$ approximation and threshold $1 \/ 2$ used in the preceding proof accept every input in $Y$ and reject every input in $N$. The resulting machine halts also outside the promise because its approximation queries are total. The reverse inclusion follows by ignoring the coins. ◻
]

=== 12.4 Accuracy supplied as part of the input <accuracy-supplied-as-part-of-the-input>

Increasing the numerical clock alone approximates the same estimator value more accurately; it does not reduce the statistical error. To handle an arbitrary requested accuracy while retaining the proved condition $M_(upright("top")) = O \( B \)$, we apply the fixed-accuracy theorem to a longer input represented implicitly.

#proof[
  Fix a padded machine $cal(M)_(upright("pad"))$ as follows. On a string beginning with $1^n 0 x$, where $\| x \| = n$, it simulates $cal(M) \( x \)$ and ignores all remaining symbols. If the delimiter or the following $n$ symbols are absent, it rejects. This is one fixed randomized machine with polynomial worst-case running time and logarithmic work space in its full input length. On every string with the specified prefix its acceptance probability is $p_(cal(M)) \( x \)$. Fix once and for all the transducer of Theorem 70 for $cal(M)_(upright("pad"))$ and $d = 1$.
  On input $\( x \, 1^q \)$, with $n = \| x \|$ and $q gt.eq 1$, set
  $ m = 2^(q + ceil.l log_2 \( 2 n + 4 \) ceil.r + 4) . $
  Simulate that fixed transducer on the virtual length-$m$ string
  $ y = 1^n 0 x 0^(m - \( 2 n + 1 \)) . $
  An input query is answered by comparing its address with the prefix boundaries and either returning the appropriate bit of $x$ or a fixed bit. The simulated input-head address and all these comparisons use $O \( log m \)$ bits; the string $y$ is never stored. The simulated transducer returns a dyadic rational $z in \[ 0 \, 1 \]$ satisfying
  $ \| z - p_(cal(M)) \( x \) \| lt.eq \( m + 2 \)^(- 1) < 2^(- q - 4) . $
  Its numerator and exponent have $O \( log m \)$ bits and can be retained in work space while its finite output is simulated.
  Compute by exact dyadic arithmetic
  $ a = ⌊2^(q + 2) z + 1 / 2⌋ . $
  Then $0 lt.eq a lt.eq 2^(q + 2)$, and rounding gives
  $ lr(|a 2^(- \( q + 2 \)) - p_(cal(M)) \( x \)|) lt.eq 2^(- q - 3) + 2^(- q - 4) < 2^(- q) . $
  Write the binary numerator $a$ to the output tape. It has at most $q + 3$ bits and represents the denominator specified in the theorem. The simulator state, virtual input address, actual input counters, captured dyadic answer, and rounding operands occupy a fixed number of records of total size
  $ O \( log m \) = O \( log \( n + 2 \) + q \) . $
  The simulation and the synthesis of each input bit take polynomial time in $m$, so the total time is $m^(O \( 1 \)) = \( n + 2 \)^(O \( 1 \)) 2^(O \( q \))$. The padded machine and its exponent-one approximator were fixed before reading $q$. Thus their constants are independent of the requested accuracy. Throughout their simulation, the original size convention is $B = Theta \( log \( m + 2 \) \)$, exactly as required by the estimator and controller theorems. ◻
]

=== 12.5 Certified accepting computations <certified-accepting-computations>

We return to fixed inverse-polynomial accuracy to construct an accepting computation when the machine’s acceptance probability has an inverse-polynomial lower bound. For a transducer, the conclusion concerns outputs certified by an accepting run: its output tape must be write-only, so past emitted symbols do not influence later transitions.

#thm([Corollary 12.4.])[
  (Certified accepting computations).  #emph[Fix a randomized logarithmic-space machine $cal(M)$ that halts within a fixed polynomial bound $T \( n \) gt.eq 1$ on every input and every coin sequence, and fix an integer $c gt.eq 0$. There is a uniform deterministic logarithmic-space, polynomial-time transducer that outputs an accepting computation of $cal(M)$ whenever 
$ p_(cal(M)) \( x \) gt.eq \( n + 2 \)^(- c) . $

 On every other input it outputs either an accepting computation or a failure symbol. If every accepting run of $cal(M)$ emits a valid witness for a specified relation, the transducer can instead output such a witness with the same guarantee.]
] <cor:certified-search>

#proof[
  Give halted configurations constant self-transitions through time $T \( n \)$. A configuration and its elapsed time use $O \( log \( n + 2 \) \)$ bits. There is a fixed randomized logarithmic-space continuation machine which, on a valid encoding of $\( x \, v \, t \)$, starts from configuration $v$ and simulates the remaining $T \( n \) - t$ steps with fresh coins. It checks the fixed work-space box and time bound, rejecting malformed encodings and any attempted violation. Its acceptance probability on the reachable configurations is the continuation value $p_t \( v \)$, and it has a polynomial worst-case time bound in its input length.
  Write $gamma = \( n + 2 \)^(- c)$. Choose a fixed exponent $d$ large enough that Theorem 70, applied to the continuation machine, approximates every queried value within $delta lt.eq gamma \/ \( 8 T \( n \) \)$. Such a fixed exponent exists because $T$ is a fixed polynomial and the continuation input contains $x$. The extra fields have logarithmic length. We supply them virtually from saved configuration and time registers, so the approximation and those registers together use logarithmic space.
  Starting at the initial configuration, at each time estimate the continuation value of every positive-probability successor and choose one with maximum estimated value, breaking ties by a fixed port order. Since $p_t \( v \)$ is the weighted mean of the successor values, the chosen successor $v'$ satisfies
  $ p_(t + 1) \( v' \) gt.eq max_w p_(t + 1) \( w \) - 2 delta gt.eq p_t \( v \) - 2 delta . $
  On an input satisfying the stated lower bound, after $T \( n \)$ choices the terminal continuation value is at least $gamma - 2 T \( n \) delta gt.eq 3 gamma \/ 4 > 0$. A terminal continuation value is zero or one, so this computation accepts.
  First run this construction without writing output. If its terminal state rejects, output the failure symbol. Otherwise repeat the same deterministic choices and stream the configurations through the original first halting state, or the symbols emitted by the simulated transducer. The artificial self-transitions after halting are omitted from the output. This second pass follows the same accepting computation. Consequently no rejecting computation is output, even outside the probability promise.
  At any time the current, candidate, and best successor configurations, the time counter, a constant number of dyadic scores, the virtual input address, and the approximation workspace occupy a constant number of $O \( log \( n + 2 \) \)$-bit records. The finite successor lists have constant size, and there are only $T \( n \)$ steps in each pass, so the total running time is polynomial. Each approximation has a deterministic guarantee at its queried configuration; no simultaneous accuracy event for all adaptive queries is needed. ◻
]

== 13 The effective compiler <sec:compiler>

The probability-approximation theorem fixes the source machine. We now construct one effective map from source descriptions and supplied resource bounds to deterministic simulations with explicit bounds.

#thm([Theorem 13.1.])[
  (Effective simulation with explicit bounds).  #emph[There is a terminating algorithm which, given a finite randomized machine description $M$ and positive integers $a \, b$, emits a deterministic machine $D_M$ and positive integers $K \, H \, c$ with the following guarantee. If, on every input of length $n$ and every random tape, $M$ halts within $\( n + 2 \)^a$ steps, uses at most $b ceil.l log \( n + 2 \) ceil.r$ work bits, and has acceptance probability at most $1 \/ 3$ on no inputs and at least $2 \/ 3$ on yes inputs, then $D_M$ decides the same language. On each input, that same execution uses at most $K log \( n + 2 \)$ work bits and $H \( n + 2 \)^c$ elementary bit operations.]
] <thm:effective-simulation>

The compiler’s own running time need only be finite, and its output exponent may depend on the source.

We prove Theorem 74 by specializing one fixed deterministic program. First we construct a randomized interpreter $U$ that enforces polynomial-time and logarithmic-space bounds on every input. Theorem 70 supplies a deterministic machine $A$ that separates the inputs on which $U$ accepts with probability at least $2 \/ 3$ from those on which it accepts with probability at most $1 \/ 3$. Both $U$ and $A$ are fixed before the compiler receives a source description $M$ and bounds $a \, b$.

When the source satisfies its supplied resource bounds, padding places each encoded computation within $U$’s caps without changing its acceptance probability. The generated machine runs $A$ on that padded input, generating each requested symbol from the real input. We then compute the output bounds $K \, H \, c$ from the generated finite transition table and the fixed library data. The compiler never has to select a new probability approximator or infer resource bounds from the source’s behavior.

Universal deterministic estimation has a substantial antecedent in Pyne, Raz and Zhan #cite(label("PyneRazZhan2023")) full version, Theorem 5.1. They construct one deterministic algorithm that, on input $\( 1^n \, cal(B) \)$ with $n gt.eq 1$ and $cal(B)$ an ordered branching program of length and width at most $n$, approximates its acceptance probability to error less than $1 \/ n$. For every space-constructible $S \( n \) gt.eq log n$, this single algorithm uses $O \( S \( n \) \)$ space exactly when $sans(p r B P L) subset.eq sans(S P A C E) \[ O \( S \( n \) \) \]$. Here the preceding sections establish the separator used by one fixed library, and we compute explicit resource bounds for its source-specific specialization.

All quantities in this section are local to the compiler construction. In particular, $P$ is a padding exponent, $d_(upright("code"))$ is a program length, $B_n = ceil.l log_2 \( n + 2 \) ceil.r$, and $N_(upright("pad"))$ is a virtual input length. They do not denote the statistical budgets, field modulus, or domain sizes used in the preceding sections. We use the usual counted-cell convention for work tapes: traversed writable cells count toward space, whether or not they contain a nonblank symbol. The finite control and the read-only input have their standard treatment.

=== 13.1 One fixed interpreter with enforced resource bounds <subsec:compiler-interpreter>

Fix a binary coding of ordinary finite transition lists. One concrete choice uses a fixed record grammar and the field encoding $w mapsto 1^(\| w \|) 0 w$. Lists specify the finite state set, tape and alphabet declarations, initial and halting states, blanks and endmarkers, and transition records. A transition record lists its tested state, scanned symbols and coin pattern, followed by its next state, written symbols and local head movements. The grammar has fixed nesting depth; its fields are actual listed data, not recursively executable descriptions. State and symbol IDs are canonical binary integers used only as names. The first matching transition is used; a missing transition causes rejection. Wildcards for ignored coins can equivalently be expanded into a finite explicit list.

Write $z$ for a program in this coding and $d_(upright("code")) = \| z \| gt.eq 1$. The coding permits at most $d_(upright("code"))$ work tapes and a block of at most $d_(upright("code"))$ fresh fair bits per simulated transition. Every ID has at most $d_(upright("code"))$ bits. A harmless padding field can enlarge the program to meet these inequalities. All tape movements are local. Work coordinates are measured from their initial origins; the ordinary model has one input head and one head per work tape. For a source input $x$ of length $n$, let $E_(d_(upright("code"))) \( x \)$ encode each of its symbols by its ID padded to exactly $d_(upright("code"))$ bits.

===== 13.1.1 Preserving the supplied source bounds. <preserving-the-supplied-source-bounds.>

An ordinary source machine $M$ can be converted effectively to this format by renaming its states and symbols and listing its transitions. Its tapes are represented directly, so a source transition retains its work writes and head movements and counts as one interpreted transition. The conversion does not pass through a slower single-tape simulation.

Under the optional one-way read-only random-tape convention, the source may reuse its current random bit. Store a cached bit and a validity flag in finite control, initially invalid. At each transition obtain one fresh bit. Use it if the cache is invalid; otherwise use the cached bit and discard the fresh one. Execute the source transition, then retain the used bit if the random head stayed and invalidate the cache if it advanced. This samples a newly visited random cell lazily on its next use. It preserves the joint distribution of the source run and needs no initialization transition. An initially halting state is recognized before the first transition. The same argument uses a fixed finite block for a convention allowing finitely many fresh bits per elementary transition, discarding unused bits. The finite cache changes neither counted work space nor the number of source transitions. Thus the supplied parameters $a \, b$ remain valid; only the static description length can increase.

#thm([Lemma 13.2.])[
  (A total resource-capped interpreter).  #emph[There is one fixed randomized Turing machine $U$ with polynomial worst-case running time and $O \( log \( m + 2 \) \)$ counted work bits on every binary input of length $m$, with the following behavior. Set 
#[#set math.equation(numbering: n => "(13.1)")
 $ lambda_m = ceil.l log_2 \( m + 2 \) ceil.r \, #h(2em) R \( m \, d_(upright("code")) \) = ⌊frac(lambda_m, 100 \( d_(upright("code")) + 1 \)^3)⌋ . $ <eq:compiler-interpreter-cap>]

 On an input with prefix 
#[#set math.equation(numbering: n => "(13.2)")
 $ 1^(d_(upright("code"))) 0 thin z thin 1^n 0 thin E_(d_(upright("code"))) \( x \) \, $ <eq:compiler-prefix>]

 it first requires $1 lt.eq d_(upright("code")) lt.eq lambda_m$ and $R \( m \, d_(upright("code")) \) gt.eq 1$. It then simulates the encoded machine for at most $m$ transitions, allowing each counted work tape only coordinates in $\[ - R \, R \]$. It rejects malformed data, a requested move outside these bounds, or failure to halt by the end of the transition budget. Otherwise it returns the encoded machine’s decision. The suffix after the complete prefix has no parsing significance.]
] <lem:compiler-interpreter>

#proof[
  Count $m$ before interpreting the prefix. Scan the unary code-length header with a bounded counter, rejecting if its length exceeds $lambda_m$ or the required delimiter is absent. Check the two eligibility conditions before copying $z$ or allocating simulation storage. Then verify that the following $d_(upright("code"))$ code bits, the unary data-length header, and the required data bits are present. The parsed $n$ is at most $m$, and $d_(upright("code")) n lt.eq lambda_m m$, so even size calculations preceding a failed length check use only $O \( lambda_m \)$ bits. List counts, ID lengths, tape declarations, and movements are checked against the actual code and the stated bounds before any loops or allocations using them. There is no enumeration of an implicit domain of symbol or state names.
  Store the encoded tapes sequentially on a fixed number of real work tapes of $U$. At most $d_(upright("code"))$ strips, each with $2 R + 1$ cells of $d_(upright("code"))$ bits, require
  #[#set math.equation(numbering: n => "(13.3)")
   $ d_(upright("code"))^2 \( 2 R + 1 \) = O \( lambda_m \) $ <eq:compiler-interpreter-space>]
  bits. Indeed, eligibility gives $d_(upright("code"))^3 lt.eq lambda_m$ and $d_(upright("code"))^2 R lt.eq lambda_m$. The copied program, current state, scanned and written symbol tuples, coin block, strip coordinates, step counter, and parsing scratch fit simultaneously in $O \( lambda_m \)$ bits. A single simulated input-head coordinate has magnitude $O \( m \)$ by the transition cap and therefore also uses $O \( lambda_m \)$ bits. Read the corresponding source symbol by rescanning the encoded data, supplying the appropriate markers or off-data blanks according to the encoded input-tape convention.
  All routines are bounded scans and ordinary binary arithmetic. They iterate over actual code positions, input positions, a bounded tape/head list, strip positions, and bit positions, with a fixed nesting depth. Each range is polynomially bounded in $m + 2$; binary arithmetic is implemented by bit scans, not unit-cost operations on growing words. Matching a listed transition, fetching input symbols, updating the strips, and obtaining its finite coin block therefore take polynomial time in $m + 2$, with one fixed exponent determined by these routines. The same bounds hold when a check fails. There are at most $m$ interpreted transitions. Checking the initial halting state and the state reached by the last permitted transition gives the asserted total behavior, including $m = 0$. The resulting fixed $U$ has the required polynomial worst-case time on every random tape. ◻
]

No bounded-error language promise is asserted for $U$ on arbitrary inputs. Its acceptance probability may lie between $1 \/ 3$ and $2 \/ 3$. This is why we use probability approximation rather than a bare language-class containment.

=== 13.2 Fixing one deterministic library <subsec:compiler-library>

Apply Theorem 70 to the fixed machine $U$ and accuracy exponent $3$, and compare its dyadic answer with $1 \/ 2$. The error on an input of length $m$ is at most $\( m + 2 \)^(- 3) lt.eq 1 \/ 8$. Hence the resulting deterministic machine accepts whenever $Pr \[ U upright(" accepts") \] gt.eq 2 \/ 3$ and rejects whenever that probability is at most $1 \/ 3$, since

$ 1 / 3 + 1 / 8 = 11 / 24 < 1 / 2 < 13 / 24 = 2 / 3 - 1 / 8 . $

It halts on every input, including inputs between the two thresholds, as also stated in Corollary 72. Its logarithmic space bound counts all simultaneously live work in the approximation algorithm. Store the $O \( log \( m + 2 \) \)$-bit dyadic output in work space for the threshold test.

We fix this library once in the following convenient form. It is an ordinary finite-tape deterministic decision machine $A$ with one input head confined to the endmarked input, initially at its left endmarker, such that every work head stays in

#[#set math.equation(numbering: n => "(13.4)")
 $ \[ - \( lambda_m + 1 \) \, lambda_m + 1 \] $ <eq:compiler-library-box>]

relative to its origin. To obtain this form, first consolidate any input heads by keeping their coordinates in logarithmic work space and scanning for each read. Even an off-data coordinate under an unbounded-input convention has logarithmic length because the original library has polynomial running time. A fixed change of initial control state handles its input-head start convention.

Next choose an integer $w$ at least a coefficient bounding each counted work head’s distance from its origin by $w lambda_m$. Such one fixed $w$ exists from the logarithmic bound, enlarged if necessary for the finitely many small lengths. Group consecutive work cells into blocks of width $w$, storing within-block offsets in finite control. The resulting finite alphabet and finite transition list realize Equation (13.4), also for two-sided tapes. All symbol widths will be charged in bits below; grouping only exposes a uniform address bound and gives no uncharged bit compression.

This choice of $A$, including its one blocking width, precedes every compiler input. More formally, the remaining construction is a computable syntactic function of a finite library list and $\( M \, a \, b \)$. Fixing one valid finite list yields one ordinary computable compiler on all those source inputs. It does not require an algorithm that discovers a separator or a logarithmic-space coefficient from an arbitrary machine description. The existence of the fixed list was proved by Theorem 70; no constant is selected as a noncomputable function of the source machine or its ordinary input.

The fixed finite data are the program grammar, the transition list of $A$ with its blocked work alphabets and head conventions, and the finite callback templates described below. The construction constants, cutoffs, generator choices and finite instruction routines used by the separator are included in that list. Its blocking width is fixed at the same time. These are data specifying one compiler; subsequent source-dependent integers are computed from these data and the supplied $\( M \, a \, b \)$.

=== 13.3 Padding and exact preservation of acceptance probability <subsec:compiler-padding>

Given the source description and its supplied positive integers $a \, b$, construct $z$ as above and compute

#[#set math.equation(numbering: n => "(13.5)")
 $ P & = 1000 \( d_(upright("code")) + 2 \)^4 \( a + b + 2 \) \,\
B_n & = ceil.l log_2 \( n + 2 \) ceil.r \, #h(2em) N_(upright("pad")) = 2^(P B_n) . $ <eq:compiler-padding>]

The generated machine will run $A$ on a virtual binary input $y_x$ of length $N_(upright("pad"))$ whose prefix is Equation (13.2) and whose remaining bits are zero. Its prefix length is exactly

#[#set math.equation(numbering: n => "(13.6)")
 $ L_(upright("pre")) = \( d_(upright("code")) + 1 \) + d_(upright("code")) + \( n + 1 \) + d_(upright("code")) n = \( d_(upright("code")) + 1 \) \( n + 2 \) . $ <eq:compiler-prefix-length>]

Since $B_n gt.eq 1$, $2^(B_n) gt.eq n + 2$, and $2^(P - 1) gt.eq d_(upright("code")) + 1$, this length is at most $N_(upright("pad"))$. The interpreter’s length parameter is

#[#set math.equation(numbering: n => "(13.7)")
 $ ell_(upright("pad")) := lambda_(N_(upright("pad"))) = P B_n + 1 . $ <eq:compiler-padded-log>]

All eligibility checks pass. In particular,

$ frac(P, 100 \( d_(upright("code")) + 1 \)^3) = 10 frac(\( d_(upright("code")) + 2 \)^4, \( d_(upright("code")) + 1 \)^3) \( a + b + 2 \) gt.eq 30 \( a + b + 2 \) \, $

so

#[#set math.equation(numbering: n => "(13.8)")
 $ R \( N_(upright("pad")) \, d_(upright("code")) \) gt.eq 30 \( a + b + 2 \) B_n - 1 gt.eq \( a + b \) B_n + 4 . $ <eq:compiler-strip-slack>]

Also $P > a$, whence $\( n + 2 \)^a lt.eq 2^(a B_n) < N_(upright("pad"))$. Local motion from an initial work origin to a cell entails visiting the intervening counted cells. The source bound of $b B_n$ work bits therefore places every source work cell in the allocated strip; the slack in Equation (13.8) also covers a final one-cell move. This uses the source’s original cell costs, each at least one bit, and does not charge it for the larger interpreter IDs.

Consequently no resource cutoff changes a promised source run, and

#[#set math.equation(numbering: n => "(13.9)")
 $ Pr \[ U \( y_x \) upright(" accepts") \] = Pr \[ M \( x \) upright(" accepts") \] . $ <eq:compiler-exact-probability>]

There is no conditioning or additional approximation in this equality. The decision of $A \( y_x \)$ is therefore the decision required for $L_M$. Although $N_(upright("pad"))$ is given exponentially, it is at most $\( n + 2 \)^(2 P)$ for the fixed source. More importantly, it need never be written as an input string.

#prodef([Remark 13.3.])[
  (Optional head conventions).  The construction also applies when the fixed coding and $U$ are chosen to allow at most $d_(upright("code"))$ heads per tape, with the usual common initial origin. These conventions are fixed before choosing $A$. There are then at most $d_(upright("code"))^2$ work-head coordinates and scanned symbols. Their storage is bounded by
  $ O #scale(x: 120%, y: 120%)[\(] d_(upright("code"))^2 log \( 2 R + 1 \) + d_(upright("code"))^3 #scale(x: 120%, y: 120%)[\)] = O \( lambda_m \) . $
  For multiple input heads, or an optional entirely blank tape whose cells are not charged, use signed $R$-bit coordinates and reject on overflow. At most $d_(upright("code"))^2$ such coordinates still cost $O \( d_(upright("code"))^2 R \)$ bits. These optional conventions do not change the interpreter’s bounds. The padded instances just constructed never overflow those coordinates.
  Under the optional head conventions, local motion bounds an input or uncharged blank-tape coordinate by the source time, up to the fixed endmarker offset. Its signed encoding fits because $R gt.eq a B_n + 4$.
]

Figure 2 shows how the generated machine supplies the virtual input requested by $A$. The library’s work tapes remain live while the callback scans the real input; the resource bound below counts the library and callback storage simultaneously.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (12.4, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.45, 0), (0.45, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.65, 0), (2.65, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.45, 0), (3.45, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.85, 0), (4.85, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.05, 0), (8.05, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((11.95, 0), (11.95, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.225, 0.4), [#text(size: 9pt)[$tack.r$]])
  content((1.55, 0.4), [#text(size: 9pt)[$1^(d_( upright("code") ))0$]])
  content((3.05, 0.4), [#text(size: 9pt)[$z$]])
  content((4.15, 0.4), [#text(size: 9pt)[$1^n 0$]])
  content((6.45, 0.4), [#text(size: 9pt)[$E_(d_( upright("code") ))(x)$]])
  content((10, 0.4), [#text(size: 9pt)[$0#h(0.1667em) 0#h(0.1667em) dots.h#h(0.1667em) 0$]])
  content((12.18, 0.4), [#text(size: 9pt)[$tack.l$]])
  content((6.2, 1.03), [#text(size: 9pt)[Virtual input: $N_( upright("pad") )=2^("PB"_n)$ bits]], anchor: "south", padding: 0.1176cm)
  content((4.25, -0.1), [#text(size: 8pt)[prefix of length $(d_( upright("code") )+1)(n+2)$]], anchor: "north", padding: 0.1176cm)
  content((10, -0.1), [#text(size: 8pt)[implicit zero suffix]], anchor: "north", padding: 0.1176cm)
  content((1.85, -1.6), [#box(width: 2.6cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[fixed library $A$]]])])
  content((6.2, -1.6), [#box(width: 3.6cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[address $J$#linebreak()prefix scan]]])])
  content((10.55, -1.6), [#box(width: 2.6cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[real input $x$]]])])
  line((3.15, -1.494), (4.4, -1.494), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3.775, -1.494), [#text(size: 8pt)[read]], anchor: "south", padding: 0.1176cm)
  line((4.4, -1.706), (3.15, -1.706), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3.775, -1.706), [#text(size: 8pt)[bit]], anchor: "north", padding: 0.1176cm)
  line((8, -1.6), (9.25, -1.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((8.625, -1.6), [#text(size: 8pt)[scan]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 2: The fixed library reads the padded input through a callback. The callback regenerates prefix symbols from the real input and returns zero for an address in the padding interval. ],
) <fig:compiler-padding>

=== 13.4 Compiling the virtual input operations <subsec:compiler-callback>

Inline the finite transition list of $A$, giving it its own work tapes. The generated machine $D$ suspends its library control state in finite control during an input operation. Four auxiliary binary words suffice: the length count $n + 1$, the virtual right-endmarker address $N_(upright("pad")) + 1$, the virtual input-head position $J$, and a prefix position $I$. Each has a separate tape, with origin and termination marks and digits in low-end-first order.

Initialize the length count to one and increment it once per real input symbol. Its bit length is exactly

#[#set math.equation(numbering: n => "(13.10)")
 $ "bitlength" \( n + 1 \) = floor.l log_2 \( n + 1 \) floor.r + 1 = ceil.l log_2 \( n + 2 \) ceil.r = B_n #h(2em) \( n gt.eq 0 \) . $ <eq:compiler-bitlength>]

For every bit place in that count, write $P$ zero bits on the bound tape, then append a one. This produces the low-end-first representation of $2^(P B_n) = N_(upright("pad"))$; increment it to obtain $N_(upright("pad")) + 1$. The repetition of $P$ is hardwired finite control. Initially set $J = 0$, the library’s left-endmarker position.

At a virtual read, first test $J = 0$ and $J = N_(upright("pad")) + 1$ and return the corresponding endmarker. Otherwise initialize $I = 1$ and regenerate the prefix in its natural order:

+ emit the fixed string $1^(d_(upright("code"))) 0 z$;
+ scan $x$, emitting one $1$ per symbol, and then emit $0$;
+ rewind and scan $x$ again, emitting each fixed-width symbol code in $E_(d_(upright("code"))) \( x \)$.

Here “emit” means compare the current $I$ with $J$, return the bit if they agree, and otherwise increment $I$ and continue. If the scan finishes without a match, return zero. The strings $z$, the integer $d_(upright("code"))$, symbol codes and emission phases are fixed in the generated control. The real input head is rewound by scanning to its endmarker, without storing its position. In particular, $J = N_(upright("pad")) + 1$ is answered before regeneration, while a padding address such as $J = N_(upright("pad"))$ returns zero after the finite prefix scan. The largest prefix counter value is $L_(upright("pre")) + 1 lt.eq N_(upright("pad")) + 1$.

For explicit counter routines, an increment uses a finite carry flag. Compare two low-end-first words by scanning both, retaining only a finite comparison flag that is overwritten by each higher differing bit. After one terminator, treat its later bits as zero using a finite “ended” flag. Rewind each tape to its origin mark afterward. Zeroing and copying are likewise bounded bit scans. No growing arithmetic register beyond the named words is required. All words have at most $P B_n + 2$ bits; including delimiters and rewinds, their heads need visit only positions through $P B_n + 10$.

After the callback, perform the indicated library transition and update $J$ in place for its input-head motion. The library’s work heads and contents are untouched by the callback. Its state, the returned input symbol, and any step-local scanned tuple are fixed finite-control data. The callback does not invoke $A$ recursively or maintain a stack of callbacks. The real input head stays between its real endmarkers.

Every listed routine terminates. For example, a complete regeneration uses at most $L_(upright("pre"))$ emissions, each with an $O \( P B_n + 1 \)$-bit comparison and increment, together with two real-input scans. Initialization makes $n$ increments and writes $P B_n + 1$ bound bits. These observations give direct polynomial bounds for the auxiliary operations. The whole simulation halts because $A$ is total. Its more uniform explicit time bound, including every such operation, is derived next from the complete configurations of this same machine.

All the above instructions can be generated as finite transition tables, unrolling fixed repetitions and strings if necessary. Formation of the source list, the integer $P$, and this transition table is a finite effective process. It makes no test of the source’s semantic error or resource promises. Syntactically invalid compiler inputs may be assigned a fixed default output; correctness is required on the stipulated class. The generated simulation is total and obeys the bounds below even when the supplied source promises fail; those promises are used to establish that its decision agrees with the source.

=== 13.5 Explicit simultaneous bounds <subsec:compiler-bounds>

Use the finite-alphabet description just constructed to compute $t$, its number of work tapes; $g gt.eq 2$, the maximum of two and its work alphabet sizes, including all blank, origin and termination symbols; and $q_D$, its number of states, including callback phases. Let $u gt.eq 1$ dominate its explicit transition-table bit length, all alphabet sizes (including the input alphabet), the number of states, and the number of tapes. Padding this integer is effective. Return the positive integer bounds

#[#set math.equation(numbering: n => "(13.11)")
 $ rho & = 100 \( P + 2 \) \, #h(2em) S = 1 + \( t + 1 \) \( 2 rho + 1 \) \( g + 2 \) \,\
K & = 4 S \, #h(2em) c = 2 S + 1 \, #h(2em) H = 2^(\( u + 100 \)^2) \( q_D + 1 \) . $ <eq:compiler-output-bounds>]

These depend on the fixed source and the fixed library, and are computed from finite syntax. They have no dependence on $n$ or $x$.

===== 13.5.1 All live work bits. <all-live-work-bits.>

Every work head stays in $\[ - rho B_n \, rho B_n \]$. For a library tape this follows from Equations (13.4) and (13.7), since $ell_(upright("pad")) + 1 = P B_n + 2 lt.eq rho B_n$. For an auxiliary tape it follows from $P B_n + 10 lt.eq rho B_n$, using $B_n gt.eq 1$. Thus the library’s live data and all callback data satisfy the same bound at the same time. Encoding a work alphabet of size $g_i$ in $max { 1 \, ceil.l log_2 g_i ceil.r } lt.eq g$ bits per symbol bounds their total data by

#[#set math.equation(numbering: n => "(13.12)")
 $ t \( 2 rho B_n + 1 \) g lt.eq S B_n . $ <eq:compiler-space-bound>]

Even twice this quantity satisfies the stronger logarithmic bound: with $L_n = log_2 \( n + 2 \) gt.eq 1$ we have $B_n lt.eq 2 L_n$ and

$ 2 S B_n lt.eq 4 S L_n = K L_n . $

===== 13.5.2 All finite-alphabet transitions. <all-finite-alphabet-transitions.>

For a fixed real input $x$, a complete configuration is specified by the state, the real input-head position, all work-head positions, and all work symbols in the stated intervals. Everything outside these intervals remains at its initial value. There are at most

#[#set math.equation(numbering: n => "(13.13)")
 $ q_D \( n + 2 \) \( 2 rho B_n + 1 \)^t g^(t \( 2 rho B_n + 1 \)) lt.eq q_D \( n + 2 \) 2^(S B_n) lt.eq q_D \( n + 2 \)^c $ <eq:compiler-configurations>]

such configurations. For the first inequality use

$ 2 rho B_n + 1 lt.eq \( 2 rho + 1 \) B_n \, quad log_2 g lt.eq g \, quad log_2 \( 2 rho B_n + 1 \) lt.eq \( 2 rho + 1 \) B_n \; $

the second uses $B_n lt.eq 2 log_2 \( n + 2 \)$ and $c = 2 S + 1$. A deterministic halting computation cannot repeat a complete configuration. Therefore Equation (13.13) bounds its total transitions, including initialization, counter arithmetic, every regenerated input bit, and every library transition. The virtual head position is already in the counted word $J$; it is not an additional uncounted configuration component.

===== 13.5.3 Elementary bit operations. <elementary-bit-operations.>

The preceding count refers to ordinary finite-alphabet transitions. To charge them in bits, encode each work symbol by a fixed-width block, mapping blank to the all-zero block. Read and write within the current block, return to its first bit, and move to the first bit of the target block. Within-block phases and scanned finite tuples are stored in finite control. No per-block writable delimiter is needed, and these operations visit only blocks whose macro positions occur in the proved work intervals. Existing origin and termination symbols have already been included in $g$. Thus the block implementation obeys the bit-space estimate above; the factor two also allows the usual blank/bit tape convention. Input-symbol access has fixed width and is covered by the same finite description parameter $u$.

There are at most $u + 1$ scanned symbols of at most $u$ bits each. An explicit sequential comparison against at most $u$ transition rows, followed by the fixed-width reads, writes and moves, uses at most a fixed polynomial in $u + 1$ bit actions per transition. For example, the deliberately loose bound $100 \( u + 1 \)^8$ suffices for these scans and comparisons, with all temporary phase and symbol information in finite control. It is dominated, for $u gt.eq 1$, by

$ 100 \( u + 1 \)^8 lt.eq 2^(\( u + 100 \)^2) . $

The binary microcode may have more states than $q_D$, but no new configuration count is needed: multiply the number of original transitions by this per-transition bit cost. Equations (13.11) and (13.13) give the simultaneous bound

#[#set math.equation(numbering: n => "(13.14)")
 $ "time"_(upright("bit")) \( D \, x \) lt.eq H \( n + 2 \)^c . $ <eq:compiler-time-bound>]

No growing-word arithmetic is charged as a single elementary bit action.

#proof[
  #emph[Completion of the proof of Theorem 74.] The compiler returns the described machine $D$ and the integers $K \, H \, c$ in Equation (13.11). Its finite syntactic construction terminates. On every promised source input, Equation (13.9) and the fixed separator’s threshold guarantee give the correct decision. The totality of $A$ and the finite callback loops prove halting. Equations (13.12) and (13.14) give at most $K log_2 \( n + 2 \)$ work bits and $H \( n + 2 \)^c$ bit operations for this same machine.
  All claims include $n = 0$: then $B_n = 1$, the real-input scans are empty, the count $n + 1 = 1$ has one bit, and every displayed padding, strip, space, and time inequality remains valid. The library’s grouping width already includes its finitely many small-length exceptions. All construction constants are fixed before the ordinary input is read.
  The work and time internal to probability approximation—environment enumeration, numerical digits, recursive interfaces, recomputation, and precision management—belong to the one complete library machine proved in Theorem 70. Its tapes remain counted throughout virtualization. The compiler adds only the exact input operations analyzed here, without an evaluation oracle or an external stack. Configuration counting gives polynomial time because this entire deterministic machine uses exact logarithmic space. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
