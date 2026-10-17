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

#align(center)[#text(size: 16pt, weight: "bold")[Constant-factor hardness of \
directed feedback vertex set]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A directed feedback vertex set of a finite digraph $G$ is a set $F subset.eq V \( G \)$ for which the induced digraph $G - F$ is acyclic. Write

$ "DFVS" \( G \) = min { \| \| F : G - F upright(" is acyclic") } . $

Equivalently, $F$ intersects every directed cycle. A topological order of $G - F$ certifies this property in polynomial time. The minimum-cost version assigns a positive rational cost to each vertex and minimizes the sum of the deleted costs. Throughout, digraphs are finite and loopless; two vertices may have arcs in both directions. An $A$-approximation, for $A gt.eq 1$, returns a feedback vertex set of size at most $A "DFVS" \( G \)$.

=== 1.1 The approximation question <the-approximation-question>

Writing $n = \| V \( G \) \|$, the general $O \( log n log log n \)$ approximation guarantee originates in Seymour’s work on fractional packing of directed circuits #cite(label("Seymour1995")). Even, Naor, Schieber, and Sudan give a constructive algorithm covering weighted directed feedback sets #cite(label("Even1998")).

Ordinary NP-hardness of approximation already follows from Vertex Cover, which asks for a smallest vertex set meeting every edge of an undirected graph. Replacing every edge of an undirected graph by its two opposite arcs makes a vertex set a directed feedback vertex set exactly when it is a vertex cover. Thus the earlier hardness factors below $10 sqrt(5) - 21$ of Dinur and Safra #cite(label("DinurSafra2005")), and the factors strictly below $sqrt(2)$ obtained by the completed two-to-one games line #cite(label("KMS2018")) Section 1.3.1, transfer to DFVS. These results exclude particular constants; excluding every constant had required a stronger complexity assumption.

Guruswami, Manokaran, and Raghavendra established the Unique-Games barrier against every constant factor through maximum acyclic subgraph and feedback arc set #cite(label("GMR2008")). The expanded ordering-constraint framework appears in the journal paper with Håstad and Charikar #cite(label("GHMRC2011")). Svensson gave a direct Unique-Games-based construction with strong structure in the YES case #cite(label("Svensson2013")). Guruswami and Lee subsequently gave a simpler proof with structured completeness and short cycles in every sufficiently large induced subgraph in the NO case #cite(label("GuruswamiLee2016")). The recent discussion of Ghorbani and Mnich records the remaining gap for general digraphs #cite(label("GhorbaniMnich2026")).

We prove the corresponding exclusion of every constant factor from ordinary NP-hardness.

#thm([Theorem 1.1.])[
  #emph[For every fixed real constant $A gt.eq 1$, it is NP-hard to approximate minimum directed feedback vertex set within factor $A$ on unweighted digraphs. More precisely, there is a deterministic polynomial-time reduction from an NP-hard promise problem to instances $\( G \, k \)$ with $k in bb(N)_(> 0)$. The polynomial and its constants may depend on $A$. The reduction has the following alternatives: 
$ upright("YES: ") "DFVS" \( G \) lt.eq k \, #h(2em) upright("NO: ") "DFVS" \( G \) > A k . $

]
] <thm:main>

Theorem 1 implies that a deterministic polynomial-time algorithm with any constant approximation guarantee exists if and only if $upright(P) = upright("NP")$. For the reverse implication, membership of the size-bounded decision problem in NP permits exact optimization and witness search when $upright(P) = upright("NP")$. The theorem establishes that the required approximation factor grows without bound with the input size, assuming $upright(P) eq.not upright("NP")$. It does not identify that growth rate or improve the general approximation algorithm.

A directed feedback arc set is a set of arcs whose deletion leaves an acyclic digraph. Corollary 31 transfers the same hardness to this problem on unweighted simple loopless digraphs, through a reduction preserving both the optimum and approximation solutions. The vertex-set hardness also holds when opposite arcs are forbidden, as shown in Remark 30.

=== 1.2 Methodological background <methodological-background>

Our construction shares the useful division between protected vertices and deletable test vertices in Svensson’s dictatorship gadget #cite(label("Svensson2013")) Section 3.1.1. His soundness proof also reads a Boolean function from a topological order #cite(label("Svensson2013")) Section 3.1.3. Here the protected vertices encode rank profiles, and compatibility across tuple prefixes supplies a family of monotone functions. Svensson uses the “It Ain’t Over Till It’s Over” theorem; Guruswami and Lee instead use an invariance principle #cite(label("GuruswamiLee2016")) Section 1. Our analytic input is Friedgut’s theorem on Boolean functions of bounded total influence #cite(label("Friedgut1998")). We derive its required fixed-bias form explicitly. Junta-based label decoding already appears in Dinur and Safra’s Vertex Cover hardness proof #cite(label("DinurSafra2005")) Sections 1.1 and 3, where a nearby bias is selected to obtain bounded total influence. Here a single pivotality budget controls all the prescribed biases, and the contradiction requires their estimates to concern the same distribution of functions.

The rank distribution is obtained by combining finite Ramsey theory #cite(label("Ramsey1930")) with finite minimax #cite(label("vonNeumann1928")). These are the external combinatorial tools in the rank-spreading argument. The shared-prefix construction and the permutation pivotality budget are proved below. Their role is to compare many biases without changing the distribution of the functions being analyzed. The source of hardness is the published imperfect-completeness two-to-one theorem, so the proof does not consume a Unique Games hardness theorem.

=== 1.3 The reduction and its new ingredients <the-reduction-and-its-new-ingredients>

A two-to-one game has a bipartite constraint graph with a label set $X$ at each big-side vertex and a label set $Y$ at each small-side vertex. Each edge carries a map $X arrow.r Y$ with exactly two preimages per label; an edge is satisfied when the chosen endpoint labels obey that map. The game value is the largest fraction of satisfied edges, measured under its prescribed edge distribution. Our starting point is the imperfect-completeness 2-to-1 Games Theorem, obtained through the work of Dinur, Khot, Kindler, Minzer, and Safra, Khot, Minzer, and Safra, and Barak, Kothari, and Steurer #cite(label("DKKMS2025")) #cite(label("KMS2018")) #cite(label("BKS2019")). We use its precise form in Theorem 2: for arbitrarily small constant $theta > 0$, distinguishing game value at least $1 - theta$ from value at most $theta$ is NP-hard, with fixed alphabets and exact two-element projection fibers. The perfect-completeness 2-to-1 Games Conjecture is not a premise of the argument.

The central difficulty is to extract a game labeling from an arbitrary acyclic remainder. An acyclic graph supplies a topological order, but its order can interleave the many vertices representing the same local test. The proof first makes comparisons within that order consistent, then interprets them as Boolean functions. Small deletion cost will constrain these functions in incompatible ways.

For a fixed integer factor $A$, put $D = 10 A$. We construct a weighted graph with a feedback vertex set of cost at most $4$ in the YES case. Suppose, toward the soundness contradiction, that a NO instance has one of cost at most $D$. Fix a topological order after its deletion. The following four steps analyze this arbitrary order. A Boolean function on subsets is evaluated at bias $p$ by including each label independently with probability $p$; its acceptance is the probability that its value is one.

+ #emph[Rank comparisons with a common interpretation.] For each short tuple of game vertices, we create vertices indexed by rank-valued functions of label tuples. A global labeling evaluates all these functions consistently. In the soundness analysis, a putative inexpensive feedback set leaves every rank vertex present, so its surviving topological order supplies comparison bits. A finite Ramsey and minimax argument produces a distribution on rank embeddings for which all triples of positions have nearly identical image laws. Ordered comparisons then agree with high probability, yielding a monotone Boolean function of subsets of label tuples.
+ #emph[Conditioning through a shared prefix.] Successive random subsets split label tuples into lexicographically ordered cells. Monotonicity selects a unique transition cell, and prefix identifications make these transitions consistent under refinement. A full-prefix test prevents the chosen cell from having too few membership-one steps at any of many dyadic biases. On averaging, the conditioned big-side Boolean function has acceptance at least a constant multiple of the bias at every scale. The same prefix data define functions for every game vertex before a fresh constraint is drawn.
+ #emph[A pivotality budget independent of the alphabet size.] A single-label test charges the event that the starred label can be pivotal somewhere along a random permutation. The resulting quantity $B \( f \)$ is the sum, over labels, of the probability that the label is pivotal at some prefix of a random permutation of the other labels. It bounds both total influence and acceptance probability divided by the bias, at every bias. Its expectation is at most $D + 1$ on either side of the game. Friedgut’s junta theorem #cite(label("Friedgut1998")), transferred to fixed dyadic biases, therefore supplies bounded coordinate lists outside a small exceptional set. Their size is fixed before choosing the game alphabets.
+ #emph[A common tail variable across all scales.] A projection-respecting coupling compares bias $p$ on the big side with bias $2 p$ on the small side. Game soundness makes the two junta lists typically use disjoint projection fibers. The corresponding outputs are then independent under the coupling, allowing the comparison bound to pass to product measures. At each dyadic bias, this forces a positive contribution of constant size to the tail sum of the small-side pivotality budget. All these estimates concern the same random variable under the same distribution. Adding sufficiently many such contributions contradicts its expected budget.

The pivotality quantity is independent of the bias. This is essential: a separate influence bound at each scale would not justify adding the contributions to one tail sum. Likewise, the shared prefix fixes all vertex functions before the tested game edge is drawn; otherwise the coordinate lists would not define a game labeling.

The proof uses finite probability spaces to specify weighted test families. Every outcome is included explicitly with its probability as part of its cost. Thus the reduction is deterministic. All parameters, alphabets, tuple lengths, and rank tables are constants once the target factor is fixed, even though some are extremely large. Finally, rounding each vertex cost upward and replacing a vertex by an independent cluster produces an unweighted gap.

=== 1.4 Organization <organization>

Section 2 states the external theorems and proves the required dyadic junta corollary. Section 3 gives the parameter choices, graph, tests, and completeness argument. Section 4 proves rank spreading and the order lemmas used to read Boolean functions from a surviving graph. Sections 5 and 6 establish the acceptance lower bounds and pivotality budgets. Section 7 gives the comparison and tail-sum contradiction. Section 8 removes the costs and proves Theorem 1.

== 2 Games and Boolean functions <sec:preliminaries>

For a finite set $S$, we identify ${ 0 \, 1 }^S$ with the power set $2^S$. For $p in \( 0 \, 1 \)$, let $mu_p^S$ be the probability measure on $2^S$ in which each element belongs to the sampled set independently with probability $p$. We use $\[ n \] = { 1 \, dots.h \, n }$. All graphs and probability spaces in the reduction are finite.

=== 2.1 The game used in the reduction <the-game-used-in-the-reduction>

A two-to-one game consists of a bipartite constraint graph with disjoint vertex sets $U \, V$, nonempty label sets $X \, Y$ with $\| X \| = 2 \| Y \|$, and, for each edge $e = \( u \, v \)$, a map $pi_e : X arrow.r Y$ for which every fiber has cardinality two. Parallel constraints are allowed. The edges carry a rational probability distribution $nu$. Its endpoint marginals are denoted by $nu_U$ and $nu_V$. A labeling consists of maps $ell_U : U arrow.r X$ and $ell_V : V arrow.r Y$; its value is

$ Pr_(e = \( u \, v \) tilde.op nu) \[ thin pi_e \( ell_U \( u \) \) = ell_V \( v \) thin \] . $

The value of a game is the maximum of this expression over all labelings.

#thm([Theorem 2.1.])[
  (Two-to-one games with imperfect completeness).  #emph[For every constant $theta in \( 0 \, 1 \/ 2 \)$, there are constant label sets $X \, Y$ such that it is $upright("NP")$-hard, by a deterministic polynomial-time reduction, to distinguish two-to-one games of the following kinds:]
  + #emph[there is a labeling of value at least $1 - theta$;]
  + #emph[every labeling has value at most $theta$.]
  #emph[Every constraint is a total map $X arrow.r Y$ with exactly two preimages of each label in $Y$. The label sets may depend on $theta$.]
] <thm:games>

We invoke the completed theorem in this precise form. Dinur, Khot, Kindler, Minzer, and Safra prove the stated gap conditionally on their Grassmann agreement hypothesis #cite(label("DKKMS2025")) Theorem 1.8. Their Hypothesis 3.6 follows from the Grassmann expansion theorem of Khot, Minzer, and Safra #cite(label("KMS2018")) Theorem 1.12, ECCC revision 2 through the implications of Barak, Kothari, and Steurer #cite(label("BKS2019")) Section 1.1 and Theorems 9–11. The two-to-one definition and the common alphabets are as in #cite(label("DKKMS2025")) Definitions 1.1–1.2 and Section 4.2. In the explicit constraint construction, the smoothing parameter may be chosen rational within its permitted range #cite(label("DKKMS2025")) Sections 4.2 and 5.2. The edge sampling process then specifies rational weights: all constant-length tuples and constant-dimensional subspaces can be enumerated, followed by the prescribed identifications. With the parameters fixed, this is a deterministic finite construction of polynomial size. Thus the use of a rational edge law does not introduce randomness into the reduction. We require neither perfect completeness nor any degree regularity of the game.

=== 2.2 Junta approximation at fixed dyadic biases <junta-approximation-at-fixed-dyadic-biases>

For a Boolean function $f : 2^S arrow.r { 0 \, 1 }$ and $j in S$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ I_(p \, j) \( f \) = Pr_(R tilde.op mu_p^(S \\ { j })) \[ thin f \( R \) eq.not f \( R union { j } \) thin \] \, #h(2em) I_p \( f \) = sum_(j in S) I_(p \, j) \( f \) . $ <eq:biased-influence>]

This is also the probability that flipping coordinate $j$ changes the value of $f$, when the entire input has law $mu_p^S$: the change event depends only on the other coordinates. A function is a #emph[junta on $J subset.eq S$] if its value depends only on $R ∩ J$. Constant functions are juntas on the empty set.

#thm([Theorem 2.2.])[
  (Friedgut’s junta theorem).  #emph[For every $b gt.eq 0$ and $alpha > 0$, there is a finite integer $J_(upright("unif")) \( b \, alpha \)$ with the following property. For every finite $S$ and every Boolean function $f : 2^S arrow.r { 0 \, 1 }$ with $I_(1 \/ 2) \( f \) lt.eq b$, there is a Boolean function $tilde(f)$, depending on at most $J_(upright("unif")) \( b \, alpha \)$ coordinates, for which 
$ Pr_(R tilde.op mu_(1 \/ 2)^S) \[ thin f \( R \) eq.not tilde(f) \( R \) thin \] lt.eq alpha . $

 The bound is independent of $\| \| S$.]
] <thm:friedgut>

This is the uniform version of Friedgut’s theorem #cite(label("Friedgut1998")) Theorem 1.1 in the February 3, 1998 author manuscript. Friedgut also proves a biased-product version #cite(label("Friedgut1998")) Theorem 4.1 in the same manuscript. We give an elementary reduction of the dyadic case to the uniform case, so that the dependence on the bias and independence of the game alphabet size are explicit.

#thm([Corollary 2.3.])[
  (Dyadic junta approximation).  #emph[Let $p = 2^(- k)$, where $k gt.eq 1$ is an integer. For every $b gt.eq 0$ and $alpha > 0$, there is a finite integer $J \( p \, b \, alpha \)$, independent of $\| \| S$, such that every Boolean function $f : 2^S arrow.r { 0 \, 1 }$ with $I_p \( f \) lt.eq b$ has a Boolean junta approximant on at most $J \( p \, b \, alpha \)$ coordinates with error at most $alpha$ under $mu_p^S$.]
] <cor:dyadic-junta>

#proof[
  The assertion is immediate for $S = diameter$, so assume otherwise. Let $\( X_(j \, a) \)_(j in S \, thin a in \[ k \])$ be independent uniform bits and put
  $ Z_j = and.big_(a = 1)^k X_(j \, a) \, #h(2em) F \( X \) = f \( { j in S : Z_j = 1 } \) . $
  The $Z_j$ are independent Bernoulli $p$ bits. Flipping $X_(j \, a)$ changes $F$ precisely when all the other $k - 1$ bits of its block are one and coordinate $j$ is pivotal for the values of the other blocks. These two events are independent. Therefore
  #[#set math.equation(numbering: n => "(2.2)")
   $ I_(1 \/ 2) \( F \) = k 2^(- \( k - 1 \)) I_p \( f \) = 2 k p I_p \( f \) lt.eq k b . $ <eq:and-block-influence>]
  By Theorem 3, there is a Boolean approximant $H$ to $F$ with error at most $alpha$, using at most $J_(upright("unif")) \( k b \, alpha \)$ of the individual bits $X_(j \, a)$. Let $J subset.eq S$ be the set of blocks touched by these bits. Then $\| \| J lt.eq J_(upright("unif")) \( k b \, alpha \)$.
  Reveal all bits in every block indexed by $J$. Since $H$ is measurable with respect to these revealed blocks, the Boolean predictor with smallest conditional error from the revealed blocks has total error at most that of $H$. More explicitly, this predictor outputs one when the conditional probability of $F = 1$ is at least $1 \/ 2$, with any fixed convention at equality. The unrevealed blocks remain independent of the revealed blocks, and the dependence of $F$ on a revealed block is only through its AND value. Consequently
  $ Pr \[ thin F = 1 divides \( X_(j \, a) \)_(j in J \, thin a in \[ k \]) thin \] = Pr \[ thin f \( { j : Z_j = 1 } \) = 1 divides \( Z_j \)_(j in J) thin \] . $
  The optimal predictor is therefore a Boolean function only of $\( Z_j \)_(j in J)$. Regard it as a function $tilde(f) : 2^S arrow.r { 0 \, 1 }$ on the original coordinates. The induced law of the original input is $mu_p^S$, so
  $ Pr_(R tilde.op mu_p^S) \[ thin f \( R \) eq.not tilde(f) \( R \) thin \] lt.eq alpha . $
  Thus $J \( p \, b \, alpha \) = J_(upright("unif")) \( k b \, alpha \)$ is a valid choice, increased to one if desired. ◻
]

#prodef([Remark 2.4.])[
  The junta approximants need not be monotone. In the reduction, the original conditioned functions will be monotone, but the argument uses only their approximation errors and their coordinate supports. For any fixed finite collection of dyadic biases, the maximum of the bounds in Corollary 4 remains independent of the alphabet size.
]

== 3 The weighted reduction <sec:construction>

We first construct a digraph with positive rational vertex costs. Write $w_v$ for the cost of a vertex $v$ and $w \( F \) = sum_(v in F) w_v$ for the cost of a vertex set $F$. For each fixed integer $A gt.eq 1$, the construction will have a feedback vertex set of cost at most $4$ in the completeness case of Theorem 2, whereas every feedback vertex set will have cost greater than $D = 10 A$ in its soundness case. Section 8 converts this gap into an unweighted one.

=== 3.1 Choice of parameters <sec:parameters>

Fix an integer $A gt.eq 1$ and put $D = 10 A$. The constants have the following roles. There will be $M$ bias scales and at most $T$ prefix slots. The full-prefix and comparison tests have total costs $H$ and $K$. The junta size is bounded by $J$, independently of the game alphabets; $theta$ is the required game accuracy. Finally $L$ and $N$ specify finite ordered rank sets, and $psi : \[ L \] arrow.r.hook \[ N \]$ is an increasing random embedding. Its purpose is to make the order comparisons insensitive to their precise rank levels, as proved in Lemma 13. Choose the constants in the following order.

+ Set
  $ M = 128 \( D + 1 \) \, #h(2em) p_i = 2^(- \( i + 1 \)) \, #h(2em) q_i = 2 p_i quad \( i in \[ M \] \) \, #h(2em) gamma = p_M / 1000 . $
+ Set $H = 8 \( D + 1 \)$. Choose an integer $T gt.eq 1$ large enough that
  #[#set math.equation(numbering: n => "(3.1)")
   $ H M exp (- frac(p_M T, 8 M)) lt.eq 1 \, $ <eq:prefix-length-choice>]
  and an integer
  #[#set math.equation(numbering: n => "(3.2)")
   $ K gt.eq frac(M 2^T D, gamma) . $ <eq:comparison-mass-choice>]
+ Put $B_0 = \( D + 1 \) \/ gamma$. By Corollary 4, there is an integer $J gt.eq 1$ that bounds the size of a junta approximant with error at most $gamma$ for every function of total influence at most $B_0$ at any of the biases $p_i \, q_i$, $i in \[ M \]$. Choose a positive rational $theta$ small enough that Theorem 2 applies and
  #[#set math.equation(numbering: n => "(3.3)")
   $ K theta lt.eq 1 \, #h(2em) J^2 theta lt.eq gamma . $ <eq:game-accuracy-choice>]
  Apply that theorem with this fixed $theta$, and let $X \, Y$ be its alphabets, with $m = \| X \| = 2 \| Y \|$.
+ Put
  $ k_max = 2^T m \, #h(2em) L = 10 k_max + 30 \, #h(2em) rho = min { gamma \, 1 \/ m } . $
  Choose a positive rational $eta$ satisfying
  #[#set math.equation(numbering: n => "(3.4)")
   $ 3 eta L^3 2^(m^T) lt.eq rho . $ <eq:rank-accuracy-choice>]
  Apply Lemma 13 to $L \, eta$, obtaining a finite $N$ and a rational probability distribution on increasing maps $psi : \[ L \] arrow.r.hook \[ N \]$. Fix this distribution for the construction.

All these quantities depend only on $A$. In particular, the junta bound $J$ is fixed #emph[before] the alphabet size $m$ is determined. Its existence does not require an alphabet bound. The later choices of $rho \, eta \, N$ therefore introduce no dependence back into the choice of $theta$.

Let the input game have bipartition $U \, V$, edge distribution $nu$, and endpoint marginals $nu_U \, nu_V$. For an edge $e = \( u \, v \)$, write $pi_e : X arrow.r Y$ for its two-to-one projection. All probability distributions below are finite and rational. A sampling description specifies a separate vertex for each outcome of positive probability, with the indicated probability as a factor in its cost. The reduction enumerates these outcomes; it does not sample a random output graph.

=== 3.2 Rank vertices and their identifications <rank-vertices-and-their-identifications>

#prodef([Definition 3.1.])[
  (Rank graph).  For $w in U union V$, let $Lambda_w = X$ if $w in U$ and $Lambda_w = Y$ if $w in V$, and put $m_w = \| Lambda_w \|$. The allowed vertex tuples are
  $ union.big_(t = 0)^T U^t quad union quad union.big_(t = 0)^(T - 1) \( U^t times V \) . $
  Tuples are ordered sequences and may contain repeated vertices. For an allowed tuple $upright(bold(d)) = \( w_1 \, dots.h \, w_t \)$, let $Lambda_(upright(bold(d))) = product_(j = 1)^t Lambda_(w_j)$; the product for the empty tuple is a singleton. In every case
  #[#set math.equation(numbering: n => "(3.5)")
   $ \| Lambda_(upright(bold(d))) \| lt.eq m^T . $ <eq:tuple-domain-bound>]
  For every function $x : Lambda_(upright(bold(d))) arrow.r \[ N \]$, introduce a formal rank vertex $b_(upright(bold(d))) \( x \)$. Within each tuple, introduce an arc $b_(upright(bold(d))) \( x \) arrow.r b_(upright(bold(d))) \( y \)$ whenever
  $ x \( lambda \) < y \( lambda \) #h(2em) upright("for every ") lambda in Lambda_(upright(bold(d))) . $
  Whenever $upright(bold(s)) w$ is an allowed extension of $upright(bold(s))$, identify
  #[#set math.equation(numbering: n => "(3.6)")
   $ b_(upright(bold(s))) \( x \) equiv b_(upright(bold(s)) w) \( x compose "proj" \) \, $ <eq:prefix-identification>]
  where $"proj" : Lambda_(upright(bold(s)) w) arrow.r Lambda_(upright(bold(s)))$ drops the last coordinate. Take the equivalence relation generated by all these identifications and keep the induced arcs between its classes. Each resulting rank vertex has cost $D + 1$, independently of the number of its formal representatives. We use the same notation for a formal vertex and its equivalence class. The vertices represented by the constant profiles with value $j$ are denoted by $o_j$, for $j in \[ N \]$.
] <def:rank-graph>

#thm([Lemma 3.2.])[
  (Evaluation invariant).  #emph[Every global game labeling $ell$ gives a well-defined real value on the rank vertices by 
$ b_(upright(bold(d))) \( x \) mapsto x \( ell \( upright(bold(d)) \) \) \, $

 where $ell \( upright(bold(d)) \)$ is the tuple of labels supplied by $ell$. Every rank arc strictly increases this value. Consequently, the rank graph has no self-loops, and $o_1 \, dots.h \, o_N$ are distinct vertices with an arc $o_j arrow.r o_(j')$ whenever $j < j'$.]
] <lem:evaluation-invariant>

#proof[
  For every generating identification in Equation (3.6),
  $ \( x compose "proj" \) \( ell \( upright(bold(s)) \) \, ell \( w \) \) = x \( ell \( upright(bold(s)) \) \) . $
  Thus evaluation is constant on each equivalence class. This remains true when vertices repeat in a tuple: their repeated coordinates are evaluated at the same global label. A rank arc is strictly increasing at every tuple of labels, and hence at the particular tuple supplied by $ell$. Its two endpoints cannot become the same equivalence class. Finally, constant profiles all identify with their representatives at the empty tuple, and their evaluated values are the distinct integers $1 \, dots.h \, N$. ◻
]

This division into protected rank vertices and deletable tests is related to the bit-vertex/test-vertex architecture of #cite(label("Svensson2013")) Section 3.1.1; here the rank profiles and prefix identifications enforce the consistency needed below. All other vertices will be test vertices, distinct from the rank vertices and from one another. Their arcs will be incident only to rank vertices. For $E subset.eq Lambda_(upright(bold(d)))$ and $1 lt.eq a < h lt.eq L$, write

$ b_(upright(bold(d)))^psi \( E \; a \, h \) = b_(upright(bold(d))) \( x \) \, #h(2em) x \( lambda \) = cases(delim: "{", psi \( a \) \, & lambda in E \,, psi \( h \) \, & lambda in.not E .) $

=== 3.3 Wildcard vertices and prefix data <wildcard-vertices-and-prefix-data>

#prodef([Definition 3.3.])[
  (Wildcard vertex).  Fix an allowed tuple $upright(bold(d))$, an increasing map $psi$, an ordered partition $C_1 \, dots.h \, C_k$ of $Lambda_(upright(bold(d)))$ with $1 lt.eq k lt.eq k_max$, and a set $Z subset.eq Lambda_(upright(bold(d)))$, called the star set. Empty cells in the partition are permitted. Put $z_ell = psi \( 10 ell + 10 \)$ for $ell in \[ k \]$. The corresponding wildcard vertex has an incoming arc from every rank vertex $b_(upright(bold(d))) \( x \)$ for which
  #[#set math.equation(numbering: n => "(3.7)")
   $ x \( lambda \) < z_ell quad upright("for all ") ell in \[ k \] upright(" and ") lambda in C_ell \\ Z \, $ <eq:wildcard-incoming>]
  and an outgoing arc to every $b_(upright(bold(d))) \( x \)$ satisfying the strict reverse inequalities
  #[#set math.equation(numbering: n => "(3.8)")
   $ x \( lambda \) > z_ell quad upright("for all ") ell in \[ k \] upright(" and ") lambda in C_ell \\ Z . $ <eq:wildcard-outgoing>]
  There are no restrictions on the values of $x$ on $Z$.
] <def:wildcard>

The wildcard inequalities have a direct interpretation under any global labeling. If its evaluated tuple lies in $C_r \\ Z$, the threshold $z_r$ lies strictly between the evaluations of every incoming and every outgoing rank vertex. Assigning that threshold to the test therefore extends the increasing evaluation along its incident arcs. At starred tuples, the arc conditions impose no restriction on these evaluated values; the completeness argument will delete the corresponding test.

#prodef([Definition 3.4.])[
  (Prefix data).  For $t in { 0 \, dots.h \, T }$, draw $upright(bold(s)) = \( u_1 \, dots.h \, u_t \)$ independently from $nu_U$ in each slot. Independently draw $i_1 \, dots.h \, i_t$ uniformly from $\[ M \]$. Conditional on these indices, draw $P_j subset.eq X$ using independent Bernoulli $p_(i_j)$ membership bits, independently for different slots $j$. Partition $Lambda_(upright(bold(s)))$ by the membership patterns
  $ #scale(x: 120%, y: 120%)[\(] upright(bold(1)) { lambda_j in P_j } #scale(x: 120%, y: 120%)[\)]_(j = 1)^t \, #h(2em) lambda in Lambda_(upright(bold(s))) . $
  Order the $2^t$ cells lexicographically with $1$ before $0$, keeping cells that happen to be empty, and denote them by $C_1 \, dots.h \, C_(2^t)$. Put
  $ C_(< r) = union.big_(ell < r) C_ell \, #h(2em) C_(lt.eq r) = union.big_(ell lt.eq r) C_ell . $
  At $t = 0$ this is the one-cell partition of the singleton product domain.
] <def:prefix-data>

=== 3.4 The three test families <the-three-test-families>

#prodef([Definition 3.5.])[
  (Test families).  Add the following families of test vertices to the rank graph. In each family, independently draw $psi$ from the fixed rank distribution. Each outcome is a separate vertex with cost equal to its probability multiplied by the stated total mass. Distinct outcomes remain separate even if they produce the same incident arcs.
  + #strong[Full-prefix tests, of total mass $H$.]  Draw prefix data at length $T$ and use the wildcard vertex in tuple $upright(bold(s))$ with those $2^T$ cells. Its star set is
    #[#set math.equation(numbering: n => "(3.9)")
     $ Z = {lambda in Lambda_(upright(bold(s))) : upright("there exists ") i in \[ M \] upright(" such that ") \# { j : i_j = i \, med lambda_j in P_j } < frac(p_i T, 2 M)} . $ <eq:full-prefix-stars>]
  + #strong[Single-label tests, with one family on each side.]  The big-side family has total mass $\| X \|$, and the small-side family has total mass $\| Y \|$. Choose $t$ uniformly from ${ 0 \, dots.h \, T - 1 }$ and draw prefix data at length $t$. Independently draw $w$ from the endpoint marginal on the chosen side, a uniformly random label $j_0 in Lambda_w$, and a uniformly random permutation $\( sigma \( 1 \) \, dots.h \, sigma \( m_w \) \)$ of $Lambda_w$. Use a wildcard vertex in tuple $upright(bold(s)) w$. Its cells, in order, are
    $ C_ell times { sigma \( a \) } \, #h(2em) ell = 1 \, dots.h \, 2^t \, quad a = 1 \, dots.h \, m_w \, $
    with the prefix-cell index first. Thus the same label permutation is used in every prefix cell. Its star set is $Z = Lambda_(upright(bold(s))) times { j_0 }$.
  + #strong[Comparison tests, of total mass $K$.]  Choose $t$ uniformly from ${ 0 \, dots.h \, T - 1 }$ and draw prefix data at that length. Independently draw an edge $e = \( u \, v \)$ from $nu$ and an index $i$ uniformly from $\[ M \]$. Conditional on $t$, choose $r$ uniformly from $\[ 2^t \]$, independently of all other choices.
    Draw $R_u subset.eq X$ and $R_v subset.eq Y$ by the following coupling. Independently in each block indexed by $y in Y$, draw the two bits on $pi_e^(- 1) \( y \)$ independently with probability $p_i$ of being one. If either is one, set the bit at $y$ to one. If both are zero, set it to one with probability
    #[#set math.equation(numbering: n => "(3.10)")
     $ frac(p_i^2, \( 1 - p_i \)^2) . $ <eq:coupling-residual>]
    This is a valid probability because $p_i lt.eq 1 \/ 4$. The marginal probability of the bit at $y$ being one is
    $ 1 - \( 1 - p_i \)^2 + \( 1 - p_i \)^2 frac(p_i^2, \( 1 - p_i \)^2) = 2 p_i = q_i . $
    Hence the two complete marginals are the product measures of biases $p_i$ and $q_i$, respectively. Different projection blocks are independent, and
    #[#set math.equation(numbering: n => "(3.11)")
     $ R_u subset.eq pi_e^(- 1) \( R_v \) $ <eq:coupling-inclusion>]
    holds for every outcome. These bits are fresh, independent of the prefix subsets.
    For $w in { u \, v }$ and $R subset.eq Lambda_w$, define
    #[#set math.equation(numbering: n => "(3.12)")
     $ E_w^r \( R \) = \( C_(< r) times Lambda_w \) union \( C_r times R \) . $ <eq:comparison-sets>]
    The test vertex has just the incoming and outgoing arcs in the path
    #[#set math.equation(numbering: n => "(3.13)")
     $ b_(upright(bold(s)) v)^psi \( E_v^r \( R_v \) \; 2 \, 17 \) med arrow.r med upright("test") med arrow.r med b_(upright(bold(s)) u)^psi \( E_u^r \( R_u \) \; 3 \, 18 \) . $ <eq:comparison-path>]
] <def:tests>

All wildcard partitions have admissible size: the full-prefix family has $2^T lt.eq k_max$ cells, and a single-label test has $2^t m_w lt.eq 2^(T - 1) m lt.eq k_max$ cells. Their tuples, as well as both tuples in a comparison test, are among those of Definition 6. The padding in $L$ contains every rank index used above.

=== 3.5 Completeness <completeness>

#thm([Proposition 3.6.])[
  #emph[If the input game has a labeling satisfying a fraction at least $1 - theta$ of its constraints under $nu$, then the constructed digraph has a feedback vertex set of cost at most $4$.]
] <prop:completeness>

#proof[
  Fix such a labeling $ell$. Delete each wildcard test whose evaluated tuple $ell \( upright(bold(d)) \)$ lies in its star set, and each comparison test whose edge is not satisfied by $ell$. Denote this deletion set by $F_(upright("yes"))$. No rank vertex is deleted.
  We first bound its cost. In a full-prefix test, conditional on any fixed vertex tuple $upright(bold(s))$, the count
  $ \# { j : i_j = i \, med ell \( u_j \) in P_j } $
  is binomial with mean $mu_i = p_i T \/ M$. Indeed, indices and subsets are independent between slots, so every slot contributes an independent Bernoulli variable of parameter $p_i \/ M$. This argument also applies when the same game vertex appears in several slots. For a binomial random variable $Z$ of mean $mu$, the exponential Markov inequality gives
  $ Pr \[ Z < mu \/ 2 \] lt.eq e^(mu \/ 2) bb(E) \[ e^(- Z) \] lt.eq exp #scale(x: 120%, y: 120%)[\(] - \( 1 \/ 2 - e^(- 1) \) mu #scale(x: 120%, y: 120%)[\)] lt.eq exp \( - mu \/ 8 \) . $
  Here the middle inequality follows by writing $bb(E) \[ e^(- Z) \] = \( 1 - a + a e^(- 1) \)^T lt.eq exp \( - T a \( 1 - e^(- 1) \) \)$ when $Z$ has parameters $T \, a$. Applying this bound to each scale and taking a union bound over $i in \[ M \]$, the deletion probability for a full-prefix test is at most
  $ sum_(i = 1)^M exp \( - mu_i \/ 8 \) lt.eq M exp (- frac(p_M T, 8 M)) . $
  After multiplication by the mass $H$, this is at most one by Equation (3.1). In a single-label test, membership of the evaluated tuple in the star set is precisely the event $j_0 = ell \( w \)$. Its probability is $1 \/ m_w$, so each of the two families contributes cost one. Comparison tests are deleted with probability at most $theta$, and hence contribute at most $K theta lt.eq 1$ by Equation (3.3). Thus
  $ w \( F_(upright("yes")) \) lt.eq 1 + 1 + 1 + 1 = 4 . $
  To prove that this deletion set is a feedback vertex set, assign to each rank vertex its evaluation under $ell$, as in Lemma 7. Every rank arc strictly increases the assigned value. For a retained wildcard vertex, let $C_r$ be the cell containing its evaluated tuple and assign the test value $z_r$. The evaluated tuple is outside the star set. Thus Equations (3.7) and (3.8), at that tuple, put every incoming rank value strictly below $z_r$ and every outgoing rank value strictly above it.
  For a retained comparison, the evaluated prefix is the same on both sides and $pi_e \( ell \( u \) \) = ell \( v \)$. By Equation (3.11),
  $ ell \( upright(bold(s)) u \) in E_u^r \( R_u \) quad arrow.r.double quad ell \( upright(bold(s)) v \) in E_v^r \( R_v \) . $
  The possible pairs of rank indices at the start and end of Equation (3.13) are therefore $\( 2 \, 3 \)$, $\( 2 \, 18 \)$, and $\( 17 \, 18 \)$. Each is increasing, so the corresponding evaluated values are strictly increasing as well. Assign this test any real value strictly between its two endpoint values.
  These assignments coexist because there are no arcs between test vertices. Every arc remaining after deletion of $F_(upright("yes"))$ strictly increases the assigned real value. A directed cycle would force a strict increase back to its starting value, which is impossible. Thus the remaining digraph is acyclic. ◻
]

=== 3.6 Deterministic implementation <deterministic-implementation>

#thm([Proposition 3.7.])[
  (Deterministic polynomial construction).  #emph[For each fixed $A$, the preceding construction produces a loopless digraph with positive rational vertex costs in deterministic polynomial time in the game input size. Its vertex costs are bounded above by a constant depending only on $A$.]
] <prop:polynomial>

#proof[
  Put $n = 1 + \| U \| + \| V \| + \| E \|$, counting parallel constraints as distinct edges if necessary. The number of allowed tuples is at most $\( 2 T + 1 \) n^T$. By Equation (3.5), a tuple has at most $N^(m^T)$ formal rank vertices. Both factors other than $n^T$ are constants for fixed $A$.
  For each slot, there are at most $M 2^m$ choices of index and subset. The support of the rank law, the number of permutations of either alphabet, and all choices of individual labels are also bounded by constants. A full-prefix test uses $T$ game-vertex slots, so this family has $O_A \( n^T \)$ outcomes. A single-label test has at most $T - 1$ prefix vertices and one endpoint, again giving $O_A \( n^T \)$ outcomes. A comparison test has at most $T - 1$ prefix vertices and one input edge; its remaining choices, including the coupled subsets and candidate cell, range over constant finite sets. Thus there are $O_A \( n^T \)$ comparison outcomes as well. Here $O_A$ allows the implicit constant to depend on $A$.
  Within a tuple there are at most $N^(2 m^T)$ formal rank arcs, and a wildcard vertex has at most $2 N^(m^T)$ incident arcs. Comparisons have two arcs each. Therefore the total numbers of formal vertices and arcs are $O_A \( n^T \)$. Computing the equivalence relation in Equation (3.6) and discarding duplicate arcs cannot increase these counts. Lemma 7 rules out rank self-loops, and every other arc joins a rank vertex to a distinct test vertex.
  It remains to account for numerical representation. Marginal endpoint probabilities are sums of input rational edge probabilities. They can be computed with polynomial bit length: a common denominator can be formed from the product of the input denominators, whose bit length is at most their total encoding length. Every outcome probability is a product of at most $T + 1$ input-dependent edge or endpoint probabilities and a fixed number of rational factors depending only on $A$. Its bit length is therefore polynomial in the input encoding length. Zero-probability outcomes are omitted. The rank law supplied by Lemma 13 is a fixed finite rational table and may be hardwired into the reduction for this fixed $A$. Alternatively, a computable finite Ramsey bound and exhaustive search over finite rational probability tables recover such a law: each total-variation constraint is an exact rational inequality, and the strict slack in the proof of Lemma 13 ensures that the search terminates. This preprocessing depends only on $A$, not on the input game.
  Finally, each outcome probability is at most one. Every test cost is therefore at most its family’s total mass, while every rank cost is $D + 1$. All costs are bounded by
  $ C_A = max { D + 1 \, H \, m \, \| Y \| \, K } \, $
  which depends only on $A$. These estimates establish both the claimed running time and the cost bound. No efficient dependence on a variable parameter $A$ is asserted. ◻
]

== 4 Rank spreading and the surviving order <sec:ranks>

The distribution of rank embeddings used in the construction makes comparisons at different triples of positions nearly indistinguishable. We first prove this statement, and then show how it turns a surviving topological order into compatible monotone Boolean functions.

=== 4.1 A distribution on increasing embeddings <a-distribution-on-increasing-embeddings>

For a finite set $S$, write $binom(S, 3)$ for its three-element subsets, each represented in increasing order when $S$ is ordered. For probability measures $mu \, mu'$ on a common finite space $Omega$, we use the convention

$ "TV" \( mu \, mu' \) = max_(cal(A) subset.eq Omega) \| mu \( cal(A) \) - mu' \( cal(A) \) \| . $

#thm([Lemma 4.1.])[
  (Rank spreading).  #emph[For every integer $L gt.eq 3$ and every $eta > 0$, there are an integer $N gt.eq L$ and a rational probability distribution on increasing maps $psi : \[ L \] arrow.r.hook \[ N \]$ such that, for all $I \, I' in binom(\[ L \], 3)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ "TV" #scale(x: 120%, y: 120%)[\(] cal(L) \( psi \( I \) \) \, cal(L) \( psi \( I' \) \) #scale(x: 120%, y: 120%)[\)] lt.eq eta . $ <eq:rank-spreading-tv>]

 Here $cal(L)$ denotes the law of a random variable, and all the laws in Equation (4.1) use the same random map $psi$.]
] <lem:rank-spreading>

#proof[
  Choose a positive number $delta < eta \/ 2$. Let $cal(I) = binom(\[ L \], 3)$. Partition $\[ 0 \, 1 \]$ into a finite number $b$ of intervals, each of diameter at most $delta$, assigning boundary points to one of their adjacent intervals. The finite Ramsey theorem for triples #cite(label("Ramsey1930")) Theorem B gives an $N$ such that every coloring of $binom(\[ N \], 3)$ with at most $b^(\| cal(I) \|^2)$ colors has a monochromatic set of size $L$.
  Consider the following finite zero-sum game. The minimizing player chooses an increasing map $psi : \[ L \] arrow.r.hook \[ N \]$. The maximizing player chooses a triple $\( I \, I' \, cal(A) \)$, where $I \, I' in cal(I)$ and $cal(A) subset.eq binom(\[ N \], 3)$. The payoff to the maximizing player is
  $ upright(bold(1)) { psi \( I \) in cal(A) } - upright(bold(1)) { psi \( I' \) in cal(A) } . $
  Fix an arbitrary mixed strategy $tau$ of the maximizing player. Let $w_(I \, I')$ be its marginal probability of the ordered pair $\( I \, I' \)$. When $w_(I \, I') > 0$, define, for $Z in binom(\[ N \], 3)$,
  $ q_(I \, I') \( Z \) = Pr_tau \[ Z in cal(A) divides I \, I' \] \; $
  put $q_(I \, I') \( Z \) = 0$ when $w_(I \, I') = 0$. Color $Z$ by the vector of intervals containing $q_(I \, I') \( Z \)$, one interval for every ordered pair $\( I \, I' \) in cal(I)^2$. The number of possible colors is at most $b^(\| cal(I) \|^2)$, so there is a monochromatic $L$-element set. Let $psi$ be its increasing enumeration. For every ordered pair $\( I \, I' \)$, both $psi \( I \)$ and $psi \( I' \)$ are triples in this set, and hence
  $ \| q_(I \, I') \( psi \( I \) \) - q_(I \, I') \( psi \( I' \) \) \| lt.eq delta . $
  The expected payoff against $tau$ is consequently at most
  $ sum_(I \, I' in cal(I)) w_(I \, I') thin #scale(x: 120%, y: 120%)[\(] q_(I \, I') \( psi \( I \) \) - q_(I \, I') \( psi \( I' \) \) #scale(x: 120%, y: 120%)[\)] lt.eq delta . $
  The number $N$ was chosen from a bound on the number of colors that does not depend on $tau$. Thus every mixed strategy of the maximizing player has a pure response with payoff at most $delta$.
  By the finite minimax theorem #cite(label("vonNeumann1928")) Section II.3, there is a probability distribution $mu$ on increasing maps for which the expected payoff against every pure test is at most $delta$. Choose a rational probability distribution $hat(mu)$ on the same finite space with
  $ sum_psi \| hat(mu) \( psi \) - mu \( psi \) \| < eta \/ 2 . $
  Such distributions are dense in the finite probability simplex. Since each payoff lies in $\[ - 1 \, 1 \]$, this replacement changes any expected payoff by less than $eta \/ 2$. Thus every pure test has expected payoff less than $delta + eta \/ 2 < eta$ under $hat(mu)$. The ordered pairs include both $\( I \, I' \)$ and $\( I' \, I \)$, and $cal(A)$ ranges over all subsets of $binom(\[ N \], 3)$. The resulting inequalities give Equation (4.1). ◻
]

=== 4.2 Boolean functions from rank comparisons <boolean-functions-from-rank-comparisons>

For the remainder of this section and Sections 5–7, suppose that the constructed weighted digraph has a feedback vertex set $F$ of cost at most $D$. Fix a total topological order $prec$ of the surviving vertices. Every rank vertex survives, since it has weight $D + 1$. In particular, the constant vertices satisfy

$ o_1 prec o_2 prec dots.h.c prec o_N . $

All subsequent random data are sampled after $F$ and this order have been fixed. In a test family of total mass $W$, the deletion cost paid by $F$ in that family is exactly $W$ times the probability that its sampled test vertex belongs to $F$.

For an allowed tuple $upright(bold(d))$, a subset $E subset.eq Lambda_(upright(bold(d)))$, and indices $1 lt.eq a < c < h lt.eq L$, define

#[#set math.equation(numbering: n => "(4.2)")
 $ G_(upright(bold(d))) \( E \; a \, c \, h \) = upright(bold(1)) { b_(upright(bold(d)))^psi \( E \; a \, h \) prec o_(psi \( c \)) } \, #h(2em) g_(upright(bold(d))) \( E \) = G_(upright(bold(d))) \( E \; 2 \, 15 \, L - 1 \) . $ <eq:rank-comparison-bits>]

The dependence of these functions on the sampled embedding $psi$ is suppressed in the notation.

#prodef([Definition 4.2.])[
  (Good tuples).  A triple $\( a \, c \, h \)$ is #emph[usable] if
  #[#set math.equation(numbering: n => "(4.3)")
   $ 5 lt.eq c lt.eq L - 5 \, #h(2em) 2 lt.eq a < c \, #h(2em) c + 2 lt.eq h lt.eq L . $ <eq:usable-triples>]
  The tuple $upright(bold(d))$ is #emph[good at $psi$] if
  $ G_(upright(bold(d))) \( E \; a \, c \, h \) = g_(upright(bold(d))) \( E \) $
  for every $E subset.eq Lambda_(upright(bold(d)))$ and every usable triple. Otherwise it is #emph[bad at $psi$].
] <def:good-tuple>

#thm([Lemma 4.3.])[
  (Probability of goodness).  #emph[For each fixed allowed tuple $upright(bold(d))$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ Pr_psi \[ upright(bold(d)) upright(" is bad at ") psi \] lt.eq 3 eta L^3 2^(\| Lambda_(upright(bold(d))) \|) lt.eq rho . $ <eq:goodness-probability>]

 The same upper bound $rho$ holds when $upright(bold(d))$ is sampled independently of $psi$.]
] <lem:goodness>

#proof[
  Fix $upright(bold(d))$ and $E subset.eq Lambda_(upright(bold(d)))$. For integers $r_1 < r_2 < r_3$ in $\[ N \]$, let $x_(r_1 \, r_3)$ be the profile taking value $r_1$ on $E$ and $r_3$ on its complement. Once the surviving order is fixed, the function
  $ \( r_1 \, r_2 \, r_3 \) mapsto upright(bold(1)) { b_(upright(bold(d))) \( x_(r_1 \, r_3) \) prec o_(r_2) } $
  is a deterministic Boolean function of this triple alone. Applying Lemma 13 to it shows that
  #[#set math.equation(numbering: n => "(4.5)")
   $ \| bb(E)_psi G_(upright(bold(d))) \( E \; a \, c \, h \) - bb(E)_psi G_(upright(bold(d))) \( E \; a' \, c' \, h' \) \| lt.eq eta $ <eq:comparison-expectations>]
  for any two increasing triples of positions, whether usable or not.
  Equation (4.5) compares expectations; it does not by itself control disagreement under the same embedding. We obtain that control through pointwise ordered pairs of bits, for which the probability of disagreement equals the absolute difference of expectations. Fix a usable triple $\( a \, c \, h \)$ and abbreviate
  $ A_0 & = G_(upright(bold(d))) \( E \; 2 \, 15 \, L - 1 \) \,\
A_1 & = G_(upright(bold(d))) \( E \; 2 \, c \, L - 1 \) \,\
A_2 & = G_(upright(bold(d))) \( E \; 1 \, c \, c + 1 \) \,\
A_3 & = G_(upright(bold(d))) \( E \; a \, c \, h \) . $
  The bits $A_0$ and $A_1$ compare the same rank vertex to two constant vertices. They are pointwise ordered: $A_0 lt.eq A_1$ if $c gt.eq 15$, and $A_1 lt.eq A_0$ if $c lt.eq 15$. Equation (4.5) therefore gives $Pr \[ A_0 eq.not A_1 \] lt.eq eta$.
  The profile of $b_(upright(bold(d)))^psi \( E \; 1 \, c + 1 \)$ is strictly smaller at every coordinate than the profile of $b_(upright(bold(d)))^psi \( E \; 2 \, L - 1 \)$: on $E$ use $1 < 2$, and on its complement use $c + 1 < L - 1$. The strict rank arc from the former vertex to the latter forces $A_2 gt.eq A_1$. Similarly, $1 < a$ and $c + 1 < h$ imply $A_2 gt.eq A_3$. Applying Equation (4.5) to these ordered pairs gives
  $ Pr \[ A_1 eq.not A_2 \] lt.eq eta \, #h(2em) Pr \[ A_2 eq.not A_3 \] lt.eq eta . $
  A union bound yields
  $ Pr #scale(x: 120%, y: 120%)[\[] G_(upright(bold(d))) \( E \; a \, c \, h \) eq.not g_(upright(bold(d))) \( E \) #scale(x: 120%, y: 120%)[\]] lt.eq 3 eta . $
  There are at most $L^3$ usable triples and $2^(\| Lambda_(upright(bold(d))) \|)$ subsets $E$. A second union bound proves the first inequality of Equation (4.4). Every allowed tuple has length at most $T$ and each slot alphabet has size at most $m$, so $\| Lambda_(upright(bold(d))) \| lt.eq m^T$. The choice $3 eta L^3 2^(m^T) lt.eq rho$ proves the second inequality. Finally, averaging the pointwise bound over any tuple distribution independent of $psi$ gives the last assertion. ◻
]

The order in Lemma 15 may depend on the entire weighted construction, including its rank distribution. The argument only uses that the order is fixed before the fresh draw of $psi$. Nor does Equation (4.4) assert simultaneous goodness of all tuples; the subsequent estimates use its stated bound for sampled tuples.

#thm([Lemma 4.4.])[
  (Monotonicity).  #emph[If $upright(bold(d))$ is good at $psi$, then $g_(upright(bold(d))) : 2^(Lambda_(upright(bold(d)))) arrow.r { 0 \, 1 }$ is monotone: 
$ E subset.eq E' quad arrow.r.double quad g_(upright(bold(d))) \( E \) lt.eq g_(upright(bold(d))) \( E' \) . $

 Moreover, 
$ g_(upright(bold(d))) \( diameter \) = 0 \, #h(2em) g_(upright(bold(d))) \( Lambda_(upright(bold(d))) \) = 1 . $

]
] <lem:monotonicity>

#proof[
  For $E subset.eq E'$, compare
  $ b_(upright(bold(d)))^psi \( E' \; 2 \, 17 \) quad upright("and") quad b_(upright(bold(d)))^psi \( E \; 3 \, 18 \) . $
  The first profile is strictly smaller everywhere: the index pairs in $E$, $E' \\ E$, and $Lambda_(upright(bold(d))) \\ E'$ are, respectively, $\( 2 \, 3 \)$, $\( 2 \, 18 \)$, and $\( 17 \, 18 \)$. The rank arc consequently implies
  $ G_(upright(bold(d))) \( E' \; 2 \, 15 \, 17 \) gt.eq G_(upright(bold(d))) \( E \; 3 \, 15 \, 18 \) . $
  Both triples are usable, so goodness identifies these two bits with $g_(upright(bold(d))) \( E' \)$ and $g_(upright(bold(d))) \( E \)$. For the extreme sets, the reference profile is $o_(psi \( L - 1 \))$ when $E = diameter$ and $o_(psi \( 2 \))$ when $E = Lambda_(upright(bold(d)))$. Their positions relative to $o_(psi \( 15 \))$ give the claimed values. ◻
]

#thm([Lemma 4.5.])[
  (Prefix compatibility).  #emph[Let $upright(bold(s)) w$ be an allowed extension of $upright(bold(s))$. For every $E subset.eq Lambda_(upright(bold(s)))$ and every increasing triple $\( a \, c \, h \)$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ G_(upright(bold(s)) w) \( E times Lambda_w \; a \, c \, h \) = G_(upright(bold(s))) \( E \; a \, c \, h \) . $ <eq:prefix-lift-bits>]

 In particular, $g_(upright(bold(s)) w) \( E times Lambda_w \) = g_(upright(bold(s))) \( E \)$. If $upright(bold(s)) w$ is good at $psi$, then so is $upright(bold(s))$. The same conclusions hold for a prefix obtained by dropping several final slots.]
] <lem:compatibility>

#proof[
  The profile on $Lambda_(upright(bold(s)) w)$ that takes value $psi \( a \)$ on $E times Lambda_w$ and $psi \( h \)$ elsewhere is the pullback of the corresponding profile on $Lambda_(upright(bold(s)))$ under the projection dropping the last slot. Definition 6 identifies the two rank vertices. Their comparisons to the same constant marker are identical, proving Equation (4.6). Apply this identity both to the reference triple and to every usable triple: goodness of the extension gives goodness of the shorter tuple for each subset $E$. Iteration proves the final assertion. The projection identity holds on the formal product alphabets even when a game vertex occurs in more than one slot. ◻
]

=== 4.3 When a wildcard test must be deleted <when-a-wildcard-test-must-be-deleted>

#thm([Lemma 4.6.])[
  (Wildcard forcing).  #emph[Consider a wildcard test vertex $v_(upright("test"))$ from Definition 8, with tuple $upright(bold(d))$, embedding $psi$, ordered cells $C_1 \, dots.h \, C_k$, and star set $Z$. Suppose that $upright(bold(d))$ is good at $psi$. For an integer $d$ with $0 lt.eq d lt.eq k$, put 
$ E = #scale(x: 180%, y: 180%)[\(] union.big_(ell = 1)^d C_ell #scale(x: 180%, y: 180%)[\)] \\ Z . $

 If 
#[#set math.equation(numbering: n => "(4.7)")
 $ g_(upright(bold(d))) \( E \) = 0 \, #h(2em) g_(upright(bold(d))) \( E union Z \) = 1 \, $ <eq:wildcard-forcing-criterion>]

 then $v_(upright("test")) in F$.]
] <lem:wildcard-forcing>

#proof[
  Set $c = 10 d + 15$ and define the rank vertices
  $ v^(-) = b_(upright(bold(d)))^psi \( E \; 2 \, c + 2 \) \, #h(2em) v^(+) = b_(upright(bold(d)))^psi \( E union Z \; c - 2 \, L - 1 \) . $
  We first check the wildcard’s incident arcs. If $lambda in C_ell \\ Z$ with $ell lt.eq d$, then $lambda in E$, so the two profiles take values $psi \( 2 \)$ and $psi \( c - 2 \)$, respectively. The inequalities
  $ 2 < 10 ell + 10 lt.eq 10 d + 10 < c - 2 $
  place these values strictly below and strictly above $z_ell = psi \( 10 ell + 10 \)$. If instead $ell > d$, then $lambda in.not E union Z$, so the profiles take values $psi \( c + 2 \)$ and $psi \( L - 1 \)$. Here
  $ c + 2 = 10 d + 17 < 10 ell + 10 lt.eq 10 k_max + 10 = L - 20 < L - 1 \, $
  which gives the required strict inequalities again. Thus the constructed digraph contains the arcs
  $ v^(-) arrow.r v_(upright("test")) arrow.r v^(+) . $
  Empty cells impose no conditions in these checks. The first case is absent when $d = 0$, and the second is absent when $d = k$.
  Since $0 lt.eq d lt.eq k lt.eq k_max$ and $L = 10 k_max + 30$,
  $ 15 lt.eq c lt.eq L - 15 . $
  Both $\( 2 \, c \, c + 2 \)$ and $\( c - 2 \, c \, L - 1 \)$ are therefore usable triples. Goodness and Equation (4.7) show that $v^(-)$ does not precede $o_(psi \( c \))$, whereas $v^(+)$ does precede it. If $v_(upright("test"))$ survived, the displayed path would give $v^(-) prec v_(upright("test")) prec v^(+) prec o_(psi \( c \))$, a contradiction. Hence $v_(upright("test")) in F$. ◻
]

== 5 Shared prefix conditioning <sec:prefix>

Continue to fix the feedback vertex set $F$ of cost at most $D$ and the topological order $prec$ from Section 4. When we sample graph tests or their defining data below, we use the finite laws that define the graph. In particular, the order is fixed before these draws; the distribution of an embedding is not conditioned on whether any test vertex survives.

We first specify a distribution that will be used at every bias scale. Draw $psi$ from the rank-spreading law. Independently choose $t$ uniformly from ${ 0 \, dots.h \, T - 1 }$ and draw the prefix data of length $t$ from Definition 9. Thus $upright(bold(s)) = \( u_1 \, dots.h \, u_t \)$ has independent coordinates with law $nu_U$, the indices $i_1 \, dots.h \, i_t$ are independent and uniform in $\[ M \]$, and, conditionally on these indices, the sets $P_j$ are independent with laws $mu_(p_(i_j))^X$. Write

#[#set math.equation(numbering: n => "(5.1)")
 $ cal(D) = #scale(x: 120%, y: 120%)[\(] psi \, t \, upright(bold(s)) \, \( i_j \, P_j \)_(j = 1)^t #scale(x: 120%, y: 120%)[\)] $ <eq:common-conditioning>]

for these shared data. Independently draw an edge $e = \( u \, v \)$ with law $nu$. Unless another experiment is explicitly specified, expectations and probabilities involving sampled endpoints refer to this joint law of $\( cal(D) \, e \)$. In particular, its marginal law for $\( cal(D) \, u \)$ is obtained by drawing $u tilde.op nu_U$ independently of $cal(D)$; the corresponding statement holds for $v tilde.op nu_V$.

#prodef([Definition 5.1.])[
  (Conditioned functions).  For each game vertex $w$, fix a label $lambda_w^compose in Lambda_w$ independently of all the sampled data. Given $cal(D)$, let $C_1 \, dots.h \, C_(2^t)$ be its ordered prefix partition. If $upright(bold(s))$ is good, define its transition index by
  $ r_(*) = min { r : g_(upright(bold(s))) \( C_(lt.eq r) \) = 1 } . $
  For every $w in U union V$ define a function on $2^(Lambda_w)$ by
  $ f_w \( R \) = cases(delim: "{", g_(upright(bold(s)) w) #scale(x: 120%, y: 120%)[\(] E_w^(r_(*)) \( R \) #scale(x: 120%, y: 120%)[\)] \, & upright("if ") upright(bold(s)) w upright(" is good") \,, upright(bold(1)) { lambda_w^compose in R } \, & upright("otherwise") \,) $
  where, as in Equation (3.12),
  $ E_w^r \( R \) = \( C_(< r) times Lambda_w \) union \( C_r times R \) . $
  When the dependence on the shared data needs to be displayed, write $f_(w \, cal(D))$ in place of $f_w$. For $0 < p < 1$, let
  $ h_w \( p \) = bb(E)_(R tilde.op mu_p^(Lambda_w)) f_w \( R \) \, $
  and similarly write $h_(w \, cal(D)) \( p \)$ when needed. This expectation is taken with the function fixed.
] <def:conditioned-functions>

These definitions are valid also when some prefix cells are empty. Indeed, on a good tuple the cumulative-set bits are monotone, start at $0$, and end at $1$, by Lemma 16. There is therefore a unique transition, characterized by

#[#set math.equation(numbering: n => "(5.2)")
 $ g_(upright(bold(s))) \( C_(< r_(*)) \) = 0 \, #h(2em) g_(upright(bold(s))) \( C_(lt.eq r_(*)) \) = 1 . $ <eq:prefix-transition>]

The transition cell is nonempty: adding an empty cell cannot change a bit. If $upright(bold(s)) w$ is good, then $upright(bold(s))$ is good by Lemma 17, so the first case in Definition 19 only uses a defined $r_(*)$. If $upright(bold(s))$ is bad, all its extensions are bad and every function uses the second case.

For a good extension, compatibility and Equation (5.2) give

$ f_w \( diameter \) = g_(upright(bold(s))) \( C_(< r_(*)) \) = 0 \, #h(2em) f_w \( Lambda_w \) = g_(upright(bold(s))) \( C_(lt.eq r_(*)) \) = 1 . $

The set $E_w^(r_(*)) \( R \)$ increases with $R$, so this $f_w$ is monotone. The fallback function has the same properties. Consequently, for #emph[every] realization of $cal(D)$ and every vertex $w$, the function $f_w$ is monotone with bottom $0$ and top $1$. The entire family $\( f_w \)_(w in U union V)$ is determined by $cal(D)$, without using the fresh edge or a fresh scale index.

We will repeatedly use the marginal bounds

#[#set math.equation(numbering: n => "(5.3)")
 $ Pr \[ upright(bold(s)) u upright(" is bad") \] lt.eq rho \, #h(2em) Pr \[ upright(bold(s)) v upright(" is bad") \] lt.eq rho . $ <eq:sampled-extension-bad>]

To obtain them, condition on the sampled tuple and apply Lemma 15; each tuple is independent of $psi$. This argument does not assert that all extensions are good simultaneously.

Our objective is to prove $bb(E) h_u \( p_i \) gt.eq p_i \/ 4$ for every $i in \[ M \]$ under this same law. To relate acceptance to the full-prefix tests, we follow the transition cell through successive refinements: on a good full tuple, its membership bit at each step will equal the corresponding conditioned function value. The deletion-cost bound will make the counts of membership-one steps large with positive probability; averaging over a uniformly chosen prefix length will then give the desired acceptance bound.

#thm([Lemma 5.2.])[
  (Refinement of the transition cell).  #emph[Draw prefix data of length $T$ and an independent embedding $psi$. Write $upright(bold(s))_j = \( u_1 \, dots.h \, u_j \)$, and let $C_1^(\( j \)) \, dots.h \, C_(2^j)^(\( j \))$ be the partition at depth $j$. For $j = 0$, this is the single cell $Lambda_diameter$. Suppose that $upright(bold(s))_T$ is good, and let $tau_j$ be the transition index at depth $j$. Then the full transition cell is nonempty and, for every $0 lt.eq j lt.eq T$, 
$ C_(tau_T)^(\( T \)) subset.eq C_(tau_j)^(\( j \)) times X^(T - j) . $

 Let $cal(D)_(j - 1)$ denote the shared data consisting of the same embedding, the first $j - 1$ prefix slots, and the deterministic length $j - 1$. For each $1 lt.eq j lt.eq T$, the membership bit of slot $j$ throughout the full transition cell is 
#[#set math.equation(numbering: n => "(5.4)")
 $ upright(bold(1)) { lambda_j in P_j } = f_(u_j \, cal(D)_(j - 1)) \( P_j \) #h(2em) upright("for every ") \( lambda_1 \, dots.h \, lambda_T \) in C_(tau_T)^(\( T \)) . $ <eq:transition-membership>]

]
] <lem:prefix-refinement>

#proof[
  Goodness is inherited by all the prefixes. A cumulative union of cells at depth $j$, lifted to the full product alphabet, is a cumulative union at a boundary of the depth-$T$ partition. This follows from the lexicographic ordering: all refinements of an earlier cell precede all refinements of a later cell. By Lemma 17, the cumulative-set bit at that lifted boundary is its bit at depth $j$. In particular, the two boundaries on either side of $C_(tau_j)^(\( j \))$ have bits $0$ and $1$. Monotonicity places the full transition between these boundaries, which proves the asserted containment. Its nonemptiness follows because an empty cell cannot change a cumulative-set bit.
  At step $j$, the depth-$\( j - 1 \)$ transition cell has two children: its membership-$1$ child first, followed by its membership-$0$ child. The cumulative union at the boundary between these children is exactly
  $ #scale(x: 120%, y: 120%)[\(] C_(< tau_(j - 1))^(\( j - 1 \)) times X #scale(x: 120%, y: 120%)[\)] union #scale(x: 120%, y: 120%)[\(] C_(tau_(j - 1))^(\( j - 1 \)) times P_j #scale(x: 120%, y: 120%)[\)] . $
  The bit of this set under $g_(upright(bold(s))_j)$ is $f_(u_j \, cal(D)_(j - 1)) \( P_j \)$. Here the extension $upright(bold(s))_(j - 1) u_j = upright(bold(s))_j$ is good, so the fallback rule is not used. The bit before both children is $0$ and the bit after both is $1$. The transition is therefore in the first child if and only if the intermediate bit is $1$. If either child is empty, the same statement follows from equality of its two boundary sets. The full transition refines the selected child, giving Equation (5.4). ◻
]

Figure 1 illustrates the two-step case of the refinement. Each displayed cell is a set of label tuples; its bit is the value of $g$ on the cumulative union ending at that cell.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.6), [#box(width: 1.35cm, height: 0.65cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$Lambda_( nothing )$]]])])
  content((-1.98, 1.3), [#box(width: 1.35cm, height: 0.65cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6e6ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$1$]]])])
  content((1.98, 1.3), [#box(width: 1.35cm, height: 0.65cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$0$]]])])
  content((-2.97, 0), [#box(width: 1.35cm, height: 0.65cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$11$]]])])
  content((-0.99, 0), [#box(width: 1.35cm, height: 0.65cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6e6ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$10$]]])])
  content((0.99, 0), [#box(width: 1.35cm, height: 0.65cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$01$]]])])
  content((2.97, 0), [#box(width: 1.35cm, height: 0.65cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$00$]]])])
  line((-0.495, 2.275), (-1.485, 1.625), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.495, 2.275), (1.485, 1.625), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-2.227, 0.975), (-2.722, 0.325), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-1.732, 0.975), (-1.237, 0.325), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((1.732, 0.975), (1.237, 0.325), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.227, 0.975), (2.722, 0.325), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.96, 1.3), [#text(size: 9pt)[membership pattern]], anchor: "west", padding: 0.1176cm)
  content((3.96, -0.75), [#text(size: 9pt)[cumulative bit]], anchor: "west", padding: 0.1176cm)
  content((-2.97, -0.75), [#text(size: 9pt)[$0$]])
  content((-0.99, -0.75), [#text(size: 9pt)[$1$]])
  content((0.99, -0.75), [#text(size: 9pt)[$1$]])
  content((2.97, -0.75), [#text(size: 9pt)[$1$]])
  line((-2.062, -0.75), (-1.732, -0.75), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
})],
  caption: [Figure 1: Schematic transition refinement for two prefix slots. Membership $1$ precedes $0$ lexicographically. In the illustrated case the cumulative bit changes at cell $10$, so the transition is in the first cell at depth one and its second child at depth two. The selected membership bits are therefore $f_(u_1 \, cal(D)_0) \( P_1 \) = 1$ and $f_(u_2 \, cal(D)_1) \( P_2 \) = 0$, with each function using its preceding prefix. Empty cells are retained in the ordering but cannot contain a transition. ],
) <fig:prefix-refinement>

The lemma uses formal product alphabets and literal prefix-lift identities. It does not require distinct game vertices in the prefix. In particular, a repeated vertex still occupies a separate slot, with its own independently sampled index and membership set.

#thm([Proposition 5.3.])[
  (Average acceptance at every scale).  #emph[Under the common law of $\( cal(D) \, e \)$, for every $i in \[ M \]$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ bb(E) h_u \( p_i \) gt.eq p_i / 4 . $ <eq:prefix-lower-bound>]

]
] <prop:prefix-lower-bound>

#proof[
  Consider the full-prefix experiment in Definition 10, with data of length $T$ and an independent embedding. Denote its probability and expectation by $Pr_(upright("full"))$ and $bb(E)_(upright("full"))$. Let $Z_T$ be the star set of its wildcard test vertex, and let $cal(A)$ be the event that $upright(bold(s))_T$ is good and its transition cell is not starred.
  The star predicate is constant on each full cell: all label tuples in that cell have the same membership vector, and hence the same counts at each scale. Suppose that $upright(bold(s))_T$ is good and its transition cell is starred. At the cut immediately before that cell, put
  $ E = C_(< tau_T)^(\( T \)) \\ Z_T . $
  This is precisely the union of the nonstar portions of the cells before the cut. It is contained in $C_(< tau_T)^(\( T \))$, whose bit is $0$. Moreover, $E union Z_T$ contains $C_(lt.eq tau_T)^(\( T \))$, whose bit is $1$: adjoining the stars restores every earlier starred cell and includes the entire starred transition cell. Monotonicity gives
  $ g_(upright(bold(s))_T) \( E \) = 0 \, #h(2em) g_(upright(bold(s))_T) \( E union Z_T \) = 1 . $
  Lemma 18 forces deletion of this test vertex.
  The full-prefix family has total mass $H$, so its deletion probability is at most $D \/ H$. The full tuple is independent of the embedding, and Lemma 15 bounds its badness probability by $rho$. We conclude that
  #[#set math.equation(numbering: n => "(5.6)")
   $ Pr_(upright("full")) \( cal(A) \) gt.eq 1 - rho - D / H gt.eq 1 / 2 . $ <eq:full-prefix-favorable>]
  The last inequality follows from the parameter choices: $rho lt.eq gamma lt.eq 1 \/ 4000$ and $D \/ H < 1 \/ 8$.
  Define $cal(D)_(j - 1)$ from this experiment as in Lemma 20. For a fixed $i in \[ M \]$, set
  $ Y_i = sum_(j = 1)^T upright(bold(1)) { i_j = i } thin f_(u_j \, cal(D)_(j - 1)) \( P_j \) . $
  On $cal(A)$, the transition cell is nonstarred, so the definition of $Z_T$ and Equation (5.4) give $Y_i gt.eq p_i T \/ \( 2 M \)$. On all other outcomes, $Y_i gt.eq 0$, including outcomes for which some conditioned functions use the fallback rule. It follows from Equation (5.6) that
  #[#set math.equation(numbering: n => "(5.7)")
   $ bb(E)_(upright("full")) Y_i gt.eq frac(p_i T, 4 M) . $ <eq:full-prefix-count-lower>]
  We now calculate this expectation without conditioning on $cal(A)$. For each $j$, condition on the embedding, the first $j - 1$ prefix slots with all their data, and the new vertex $u_j$. The function $f_(u_j \, cal(D)_(j - 1))$ is determined by these choices: both the goodness test for $upright(bold(s))_j$ and any fallback choice are independent of the fresh $i_j$ and $P_j$. Since $i_j$ is uniform in $\[ M \]$ and $P_j$ has law $mu_(p_i)^X$ conditional on $i_j = i$,
  $ bb(E)_(upright("full")) #h(-0.16667em) [upright(bold(1)) { i_j = i } f_(u_j \, cal(D)_(j - 1)) \( P_j \) thin mid(bar.v) thin psi \, \( u_ell \, i_ell \, P_ell \)_(ell < j) \, u_j] = 1 / M h_(u_j \, cal(D)_(j - 1)) \( p_i \) . $
  The marginal law of the conditioning data and $u_j$ is the common law of $\( cal(D) \, u \)$ conditional on $t = j - 1$. Indeed, the new vertex has law $nu_U$ independently of the earlier slots, just as does the big endpoint of the independently sampled edge. Therefore
  $ bb(E)_(upright("full")) Y_i & = 1 / M sum_(j = 1)^T bb(E) #scale(x: 120%, y: 120%)[\[] h_u \( p_i \) divides t = j - 1 #scale(x: 120%, y: 120%)[\]]\
 & = T / M bb(E) h_u \( p_i \) . $
  Together with Equation (5.7), this proves Equation (5.5). ◻
]

The shared distribution in Equation (5.1) has not changed with $i$. The favorable full-chain event was used only to bound a nonnegative random sum from below; it was not used to condition the expectation that identifies this sum with $bb(E) h_u \( p_i \)$.

== 6 A budget for pivotal labels <sec:pivotality>

We associate to each conditioned function a quantity that controls both its influences and its acceptance probabilities at every bias. The single-label tests bound the expectation of this quantity under the common distribution from Section 5. A single test vertex may have several cuts that force its deletion, but its cost is paid only once. Accordingly, we record whether a label is pivotal somewhere along a permutation, rather than the number of witnessing prefixes.

#prodef([Definition 6.1.])[
  (Pivotality budget).  Let $S$ be a nonempty finite set, and let $f : 2^S arrow.r { 0 \, 1 }$ be monotone with $f \( diameter \) = 0$ and $f \( S \) = 1$. For each $j in S$, let $sigma_j$ be a uniform permutation of $S \\ { j }$. Write $R_a \( sigma_j \)$ for the set of its first $a$ elements, where $0 lt.eq a lt.eq \| S \| - 1$. Define
  $ B \( f \) = sum_(j in S) Pr_(sigma_j) #h(-0.16667em) mat(delim: "[", upright("there exists ") a in { 0 \, dots.h \, \| S \| - 1 } upright(" such that"); f \( R_a \( sigma_j \) \) = 0 \, quad f \( R_a \( sigma_j \) union { j } \) = 1) . $
  Thus both the empty prefix and the full prefix $S \\ { j }$ are allowed. A permutation contributes only once for a given $j$, even when several of its prefixes witness pivotality. In particular, $0 lt.eq B \( f \) lt.eq \| S \|$.
] <def:pivotal-budget>

#thm([Lemma 6.2.])[
  (Arrival-time inequalities).  #emph[For every function in Definition 22 and every $0 < p < 1$, 
$ I_p \( f \) lt.eq B \( f \) \, #h(2em) bb(E)_(R tilde.op mu_p^S) f \( R \) lt.eq p B \( f \) . $

]
] <lem:pivotal-inequalities>

#proof[
  Give each $j in S$ an independent uniform arrival time $T_j in \[ 0 \, 1 \]$. With probability one all these times are distinct. For each $j$, let $sigma_j$ be the order in which the other elements arrive, and let $cal(A)_j$ be the event that some prefix of $sigma_j$ witnesses $j$’s pivotality in Definition 22. The permutation $sigma_j$ is uniform, so
  $ sum_(j in S) Pr \( cal(A)_j \) = B \( f \) . $
  Moreover, $cal(A)_j$ is determined entirely by the arrival times of elements other than $j$, and hence is independent of $T_j$.
  For the influence inequality, put
  $ R_(- j) \( p \) = { k in S \\ { j } : T_k lt.eq p } . $
  This set has law $mu_p^(S \\ { j })$ and is a prefix of $sigma_j$. By monotonicity, the event defining $I_(p \, j) \( f \)$ is exactly
  $ { f \( R_(- j) \( p \) \) = 0 \, med f \( R_(- j) \( p \) union { j } \) = 1 } \, $
  which is contained in $cal(A)_j$. Summing $I_(p \, j) \( f \) lt.eq Pr \( cal(A)_j \)$ over $j$ proves $I_p \( f \) lt.eq B \( f \)$.
  For the acceptance inequality, put $R \( p \) = { j in S : T_j lt.eq p }$, which has law $mu_p^S$. Along the complete arrival sequence, the value of $f$ starts at zero, ends at one, and never decreases. There is therefore a unique arriving element at which it changes from zero to one. If $f \( R \( p \) \) = 1$ and this element is $j$, then $T_j lt.eq p$, and the elements arriving before $j$ form a prefix of $sigma_j$ witnessing $cal(A)_j$. Consequently, up to the null event of tied arrival times,
  $ { f \( R \( p \) \) = 1 } subset.eq union.big_(j in S) #scale(x: 120%, y: 120%)[\(] { T_j lt.eq p } ∩ cal(A)_j #scale(x: 120%, y: 120%)[\)] . $
  A union bound and the independence established above give
  $ bb(E)_(R tilde.op mu_p^S) f \( R \) lt.eq sum_(j in S) Pr \( T_j lt.eq p \, cal(A)_j \) = p sum_(j in S) Pr \( cal(A)_j \) = p B \( f \) . $
  Only the possible-witness event $cal(A)_j$ is asserted to be independent of $T_j$; no independence of the actual switching element is needed. ◻
]

Return to the fixed feedback vertex set $F$ of cost at most $D$ and its fixed topological order. For the functions in Definition 19, set

$ B_w = B \( f_w \) #h(2em) \( w in U union V \) . $

These variables depend on the shared data $cal(D)$ and the named vertex $w$. Their definition does not involve a fresh tested edge or a fresh bias index. Lemma 23 gives, for every realization of these data and every $0 < p < 1$,

$ I_p \( f_w \) lt.eq B_w \, #h(2em) h_w \( p \) lt.eq p B_w . $

#thm([Proposition 6.3.])[
  (Single-label test budget).  #emph[Under the common law of $cal(D)$ and an independent edge $e = \( u \, v \) tilde.op nu$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E) B_u lt.eq D + 1 \, #h(2em) bb(E) B_v lt.eq D + 1 . $ <eq:pivotal-budget>]

]
] <prop:pivotal-budget>

#proof[
  Fix either side of the game and sample $w$ independently of $cal(D)$ from that side’s endpoint marginal. Its alphabet size $m_w$ is constant on the chosen side. This is exactly the marginal law of the shared data and endpoint in the corresponding single-label test family of Definition 10.
  First fix $cal(D) \, w$ for which the extension $upright(bold(s)) w$ is good. The conditioned function $f_w$ then uses the transition cell $C_(r_(*))$. The remaining randomness of a single-label test consists of a uniform label $j_0 in Lambda_w$ and an independent uniform permutation $sigma$ of $Lambda_w$. Its star set is
  $ Z = Lambda_(upright(bold(s))) times { j_0 } \, $
  and its ordered cells are $C_ell times { j }$, first ordered by $ell$ and then by $sigma$. Suppose some prefix $R$ of $sigma$ with $j_0$ omitted satisfies
  $ f_w \( R \) = 0 \, #h(2em) f_w \( R union { j_0 } \) = 1 . $
  Choose a cut among the refined cells belonging to $C_(r_(*))$, including either boundary of this block if necessary, so that precisely the nonstar labels in $R$ have been passed within that block. Such a cut exists because deleting $j_0$ from the sequence $sigma$ preserves the order of every other label. For $R = diameter$ one may cut before the block, and for $R = Lambda_w \\ { j_0 }$ one may cut after the block. Let $E$ be the union of all refined cells before the cut, with all stars removed. Then exactly
  $ E = #scale(x: 120%, y: 120%)[\(] \( C_(< r_(*)) times Lambda_w \) \\ Z #scale(x: 120%, y: 120%)[\)] union \( C_(r_(*)) times R \) . $
  In particular,
  $ E subset.eq E_w^(r_(*)) \( R \) \, #h(2em) E union Z supset.eq E_w^(r_(*)) \( R union { j_0 } \) . $
  The second inclusion restores the stars in all earlier prefix cells; the additional stars in later cells only enlarge the set. Monotonicity of $g_(upright(bold(s)) w)$ and the definition of $f_w$ now imply
  $ g_(upright(bold(s)) w) \( E \) = 0 \, #h(2em) g_(upright(bold(s)) w) \( E union Z \) = 1 . $
  Lemma 18 therefore forces this test vertex to belong to $F$.
  This argument uses the ordered partition with its empty cells retained; the set identities remain valid when some of those cells are empty. They also hold on the formal product label domain when $w$ or another game vertex occurs repeatedly in the tuple. No independence of labels in repeated slots is assumed, and the use of $f_w$ rests only on the prefix identifications of Lemma 17.
  For each fixed $j_0$, deleting $j_0$ from a uniform permutation of $Lambda_w$ gives a uniform permutation of $Lambda_w \\ { j_0 }$. Averaging the forced-deletion event over the uniform choice of $j_0$ therefore gives, whenever $upright(bold(s)) w$ is good,
  $ Pr \[ upright("sampled test vertex") in F divides cal(D) \, w \] gt.eq B_w / m_w . $
  Here a test is charged once if a witnessing prefix exists, regardless of how many prefixes witness the same label’s pivotality.
  Let $cal(G)_w$ denote the event that $upright(bold(s)) w$ is good. The total mass of the chosen test family is $m_w$, and its vertices carry their sampling probabilities times this mass. Thus, on taking expectations, the cost spent by $F$ in this family is at least $bb(E) \[ B_w upright(bold(1))_(cal(G)_w) \]$. Since the total cost of $F$ is at most $D$,
  $ bb(E) \[ B_w upright(bold(1))_(cal(G)_w) \] lt.eq D . $
  On the complementary event the fallback function is still monotone, with bottom zero and top one, so Definition 22 gives $B_w lt.eq m_w$. The sampled-extension bound from Equation (5.3) gives $Pr \( cal(G)_w^c \) lt.eq rho$; equivalently, one may apply Lemma 15 after fixing the sampled vertex tuple, which is independent of $psi$. As $m_w lt.eq m$ and $rho lt.eq 1 \/ m$,
  $ bb(E) \[ B_w upright(bold(1))_(cal(G)_w^c) \] lt.eq m_w rho lt.eq 1 . $
  Adding the two bounds proves $bb(E) B_w lt.eq D + 1$ for either endpoint marginal, and hence proves Equation (6.1). ◻
]

== 7 Soundness from coupled comparisons <sec:soundness>

Assume that the game has value at most $theta$, and suppose that the constructed digraph has a feedback vertex set $F$ of cost at most $D$. Continue with the fixed topological order $prec$ and the conditioned functions from Sections 4 and 5. In particular, $cal(D)$ denotes the shared data in Equation (5.1), and a fresh edge $e = \( u \, v \)$ has law $nu$ independently of $cal(D)$. The random variables $f_w \, h_w \( p \)$, and $B_w = B \( f_w \)$ are defined for every vertex $w$ once $cal(D)$ is fixed.

For a fixed $i in \[ M \]$, there are two experiments for the fresh subsets at the sampled edge. In the #emph[coupled experiment], $\( R_u \, R_v \)$ has the law of the comparison test at index $i$. In the #emph[independent experiment], conditionally on $\( cal(D) \, e \)$, the subsets are independent with laws $mu_(p_i)^X$ and $mu_(q_i)^Y$. We write $Pr_(upright(c) \, i)$ and $Pr_(upright("ind") \, i)$ for probabilities in these experiments, including the common law of $\( cal(D) \, e \)$. Neither experiment samples a candidate cell unless this is explicitly stated.

=== 7.1 Coupling and deletion cost <coupling-and-deletion-cost>

Recall the coupling from the comparison family in Definition 10. For $p = p_i lt.eq 1 \/ 4$, its exact marginals are $mu_p^X$ and $mu_(2 p)^Y$, and Equation (3.11) gives

$ R_u subset.eq pi_e^(- 1) \( R_v \) quad upright("in every coupled outcome.") $

For each $y in Y$, the block consists of the two bits in $pi_e^(- 1) \( y \)$ and the bit at $y$. These blocks are independent across $y$. The marginals and block independence hold for every fixed edge, independently of the shared prefix data.

#thm([Lemma 7.1.])[
  (Comparison deletion charge).  #emph[For every $i in \[ M \]$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ Pr_(upright(c) \, i) \[ thin f_u \( R_u \) = 1 \, med f_v \( R_v \) = 0 thin \] lt.eq 2 rho + frac(M 2^T D, K) . $ <eq:coupled-comparison>]

]
] <lem:comparison-charge>

#proof[
  Let $cal(G)$ be the event that both extended tuples $upright(bold(s)) u$ and $upright(bold(s)) v$ are good. The tuple choices are independent of $psi$, so Lemma 15, averaged over these choices, gives $Pr \[ cal(G)^c \] lt.eq 2 rho$. On $cal(G)$, both conditioned functions use the same prefix transition index $r_(*)$, by Definition 19 and Lemma 17.
  Suppose that $cal(G)$ holds and that $f_u \( R_u \) = 1 \, med f_v \( R_v \) = 0$. Add the candidate-cell draw from the comparison test and consider the outcome $r = r_(*)$. The start and end rank vertices of Equation (3.13) are then
  $ b_(upright(bold(s)) v)^psi \( E_v^(r_(*)) \( R_v \) \; 2 \, 17 \) \, #h(2em) b_(upright(bold(s)) u)^psi \( E_u^(r_(*)) \( R_u \) \; 3 \, 18 \) . $
  The triples $\( 2 \, 15 \, 17 \)$ and $\( 3 \, 15 \, 18 \)$ are usable. Goodness and the two function values show that the start does not precede $o_(psi \( 15 \))$, whereas the end precedes $o_(psi \( 15 \))$. If the test vertex were retained, its two arcs would require the start to precede the test vertex and the test vertex to precede the end. This contradicts the fixed topological order. Hence that comparison vertex belongs to $F$.
  For fixed $\( cal(D) \, e \, R_u \, R_v \)$ as above, the candidate-cell draw hits $r_(*)$ with probability $2^(- t) gt.eq 2^(- T)$. Let $delta_i$ be the probability that a comparison vertex is deleted when its fresh threshold index is fixed to $i$, including the candidate-cell draw. We have proved
  $ delta_i gt.eq 2^(- T) Pr_(upright(c) \, i) \[ thin cal(G) \, med f_u \( R_u \) = 1 \, med f_v \( R_v \) = 0 thin \] . $
  In the actual comparison family the threshold index is uniform on $\[ M \]$. Its deleted weight is
  $ K / M sum_(j = 1)^M delta_j lt.eq D \, $
  so $delta_i lt.eq M D \/ K$. Combining these inequalities and then adding $Pr \[ cal(G)^c \] lt.eq 2 rho$ proves Equation (7.1). ◻
]

=== 7.2 Lists chosen before the edge <lists-chosen-before-the-edge>

#thm([Lemma 7.2.])[
  (List decoding against game soundness).  #emph[Suppose a game has value at most $theta$. Assign to every game vertex $w$ a list $J_w subset.eq Lambda_w$, possibly empty, of cardinality at most an integer $J gt.eq 1$. Then 
$ Pr_(e = \( u \, v \) tilde.op nu) \[ thin pi_e \( J_u \) ∩ J_v eq.not diameter thin \] lt.eq theta J^2 . $

 The same conclusion holds conditionally on any data independent of the fresh edge, if all the lists are fixed by those data.]
] <lem:list-decoding>

#proof[
  Independently for each vertex with a nonempty list, choose its label uniformly from that list. Give every empty-list vertex any fixed label from its alphabet. If $pi_e \( J_u \) ∩ J_v eq.not diameter$, there is at least one pair $\( x \, y \) in J_u times J_v$ with $pi_e \( x \) = y$. Since $u$ and $v$ are different vertices, the probability of choosing that pair is
  $ frac(1, \| J_u \| \| J_v \|) gt.eq 1 / J^2 . $
  The expected value of this random labeling is therefore at least the displayed intersection probability divided by $J^2$. Every deterministic labeling in its support has value at most $theta$, so the expected value is at most $theta$. This proves the claim. For the conditional assertion, fix the conditioning data first and repeat the same argument; independence leaves the fresh edge law equal to $nu$. ◻
]

=== 7.3 Replacing the coupling by product measure <replacing-the-coupling-by-product-measure>

#thm([Proposition 7.3.])[
  (Product comparison).  #emph[For every $i in \[ M \]$, under the common distribution of $\( cal(D) \, e \)$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] h_u \( p_i \) \( 1 - h_v \( q_i \) \) #scale(x: 120%, y: 120%)[\]] lt.eq p_i / 16 . $ <eq:product-comparison>]

]
] <prop:product-comparison>

#proof[
  Fix $i$. For each value of $cal(D)$, construct a junta approximant for each game vertex, before drawing the fresh edge. For notation, put
  $ beta_(w \, i) = cases(delim: "{", p_i \, & w in U \,, q_i \, & w in V .) $
  If $B_w lt.eq B_0$, Lemma 23 gives $I_(beta_(w \, i)) \( f_w \) lt.eq B_0$. Corollary 4 and the choice of $J$ in Section 3.1 therefore provide a Boolean function $tilde(f)_(w \, i)$ on a coordinate set $J_w subset.eq Lambda_w$, with
  #[#set math.equation(numbering: n => "(7.3)")
   $ \| J_w \| lt.eq J \, #h(2em) Pr_(R tilde.op mu_(beta_(w \, i))^(Lambda_w)) \[ thin f_w \( R \) eq.not tilde(f)_(w \, i) \( R \) thin \] lt.eq gamma . $ <eq:junta-error>]
  Choose one such pair by a fixed ordering of the finitely many possible coordinate sets and Boolean truth tables. If $B_w > B_0$, set $J_w = diameter$ and choose $tilde(f)_(w \, i)$ to be the constant-zero function; no error guarantee is asserted at that vertex. We suppress the dependence of $J_w$ on $cal(D)$ and $i$.
  This defines one list for every actual game vertex from $\( cal(D) \, i \)$ alone. The functions $f_w$, including the fallback functions, are already defined for all vertices from $cal(D)$ alone. Thus the choice of a junta or list uses no information about the fresh sampled edge. It may depend on the fixed game instance and the fixed topological order, as may any labeling used in a soundness argument. A repetition in the prefix, or an endpoint that also occurs in the prefix, does not change this conditional independence: the fresh edge was drawn independently of the entire prefix.
  By Lemma 26, for every fixed value of $cal(D)$,
  $ Pr_(e tilde.op nu) \[ thin pi_e \( J_u \) ∩ J_v eq.not diameter divides cal(D) thin \] lt.eq theta J^2 . $
  After averaging over $cal(D)$, this remains the bound on the list-intersection event under the common law. Also, Proposition 24 and Markov’s inequality give the averaged bound
  #[#set math.equation(numbering: n => "(7.4)")
   $ Pr \[ thin B_u > B_0 med upright("or") med B_v > B_0 thin \] lt.eq frac(bb(E) B_u + bb(E) B_v, B_0) lt.eq 2 gamma . $ <eq:budget-cutoff>]
  Here we have used the actual endpoint marginals of $nu$. Equation (7.4) is a bound under the joint law of $\( cal(D) \, e \)$; no corresponding pointwise bound conditional on $cal(D)$ is needed.
  Let $cal(A)_i$ be the event, determined by $\( cal(D) \, e \)$, that both budgets are at most $B_0$ and $pi_e \( J_u \) ∩ J_v = diameter$. The preceding bounds imply
  #[#set math.equation(numbering: n => "(7.5)")
   $ Pr \[ cal(A)_i^c \] lt.eq 2 gamma + theta J^2 . $ <eq:junta-exceptions>]
  Fix $\( cal(D) \, e \)$ in $cal(A)_i$. In the coupled experiment, all bits used by the big-side junta belong to fibers indexed by $pi_e \( J_u \)$, and all bits used by the small-side junta belong to fibers indexed by $J_v$. These are disjoint collections of independently generated fibers. Consequently $tilde(f)_(u \, i) \( R_u \)$ and $tilde(f)_(v \, i) \( R_v \)$ are independent in the coupled experiment. They are also independent in the independent experiment, and their marginal distributions are unchanged. Their joint distributions therefore agree in the two experiments. This includes the case of a constant junta with an empty coordinate set.
  The conditional approximation error for each endpoint in Equation (7.3) is at most $gamma$ in either experiment, because both have exactly the stipulated product marginals. Replacing $f_u \, f_v$ by their respective juntas changes the conditional probability of the pattern $\( 1 \, 0 \)$ by at most $2 gamma$, by a union bound. Doing this in both experiments and using equality of the junta joint distributions yields
  $ & \|Pr_(upright("ind") \, i) \[ thin f_u \( R_u \) = 1 \, med f_v \( R_v \) = 0 divides cal(D) \, e thin \]\
 & #h(22mm)  - Pr_(upright(c) \, i) \[ thin f_u \( R_u \) = 1 \, med f_v \( R_v \) = 0 divides cal(D) \, e thin \]\| lt.eq 4 gamma $
  on $cal(A)_i$. On its complement the difference is at most one. Integrating over the unchanged law of $\( cal(D) \, e \)$, and using Equation (7.5) and Lemma 25, gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ & Pr_(upright("ind") \, i) \[ thin f_u \( R_u \) = 1 \, med f_v \( R_v \) = 0 thin \]\
 & #h(2em) lt.eq 2 rho + frac(M 2^T D, K) + 2 gamma + theta J^2 + 4 gamma lt.eq 10 gamma . $ <eq:product-comparison-error>]
  The conditional probability of the pattern in the independent experiment is exactly $h_u \( p_i \) \( 1 - h_v \( q_i \) \)$. Finally, $gamma = p_M \/ 1000$ and $p_M lt.eq p_i$, so
  $ 10 gamma = p_M / 100 lt.eq p_i / 16 . $
  This proves Equation (7.2). ◻
]

=== 7.4 The dyadic tail contradiction <the-dyadic-tail-contradiction>

#thm([Proposition 7.4.])[
  (Weighted soundness).  #emph[If the game has value at most $theta$, every feedback vertex set of the constructed weighted digraph has cost strictly greater than $D$.]
] <prop:weighted-soundness>

#proof[
  Suppose that $F$ has cost at most $D$, as assumed throughout this section. Fix $i in \[ M \]$, and let
  $ cal(H)_i = { h_v \( q_i \) gt.eq 1 \/ 2 } $
  under the common distribution of $\( cal(D) \, e \)$. On its complement, $h_u \( p_i \) lt.eq 2 h_u \( p_i \) \( 1 - h_v \( q_i \) \)$. Consequently Propositions 21 and 27 imply
  $ bb(E) \[ thin h_u \( p_i \) upright(bold(1)) { cal(H)_i } thin \] & = bb(E) h_u \( p_i \) - bb(E) \[ thin h_u \( p_i \) upright(bold(1)) { cal(H)_i^c } thin \]\
 & gt.eq p_i / 4 - 2 bb(E) \[ thin h_u \( p_i \) \( 1 - h_v \( q_i \) \) thin \]\
 & gt.eq p_i / 8 . $
  Since $0 lt.eq h_u \( p_i \) lt.eq 1$, we obtain $Pr \[ cal(H)_i \] gt.eq p_i \/ 8$. Lemma 23 also gives $h_v \( q_i \) lt.eq q_i B_v = 2 p_i B_v$ pointwise. Thus, on $cal(H)_i$, one has $B_v gt.eq 1 \/ \( 4 p_i \)$, and hence
  #[#set math.equation(numbering: n => "(7.7)")
   $ Pr #h(-0.16667em) [B_v gt.eq frac(1, 4 p_i)] gt.eq p_i / 8 \, #h(2em) i in \[ M \] . $ <eq:dyadic-budget-tails>]
  These are tail estimates for one random variable $B_v$ under one fixed probability law. The definition of $f_v$, and therefore that of $B_v$, does not use the fresh threshold index $i$. The junta approximants used to prove the individual estimates may depend on $i$, but this does not alter $B_v$.
  Put $a_i = 1 \/ \( 4 p_i \)$ for $i gt.eq 1$, and $a_0 = 0$. For every real $x gt.eq 0$,
  $ x gt.eq sum_(i = 1)^M \( a_i - a_(i - 1) \) upright(bold(1)) { x gt.eq a_i } . $
  Indeed, if $a_j$ is the largest crossed threshold, the sum on the right telescopes to $a_j lt.eq x$; if no threshold is crossed, it is zero. Taking expectations and using Equation (7.7) yields
  $ bb(E) B_v gt.eq sum_(i = 1)^M \( a_i - a_(i - 1) \) Pr \[ B_v gt.eq a_i \] gt.eq sum_(i = 1)^M a_i / 2 p_i / 8 = M / 64 . $
  Here $a_i = 2 a_(i - 1)$ for $i gt.eq 2$, while $a_1 - a_0 = a_1 gt.eq a_1 \/ 2$. Since $M = 128 \( D + 1 \)$, this gives $bb(E) B_v gt.eq 2 \( D + 1 \)$, contradicting Proposition 24. No feedback vertex set of cost at most $D$ can therefore exist. ◻
]

== 8 Removing the vertex costs <sec:unweighting>

The weighted gap converts to an unweighted gap without requiring a common denominator for all vertex costs. Rounding upward at a scale determined by the number of vertices controls the additive loss. Independent-copy blowups also occur in earlier DFVS hardness reductions #cite(label("GuruswamiLee2016")) Section 2. The rounding below allows arbitrary rational costs of polynomial bit length without expanding a common denominator.

#thm([Lemma 8.1.])[
  (Rounding and cloning).  #emph[Let $G$ be a loopless digraph on $S gt.eq 1$ vertices with positive rational vertex costs $w_v lt.eq C$. Set $c_v = ceil.l S w_v ceil.r$. Replace every vertex $v$ by an independent set $cal(C)_v$ of $c_v$ unweighted vertices, and replace every arc $u arrow.r v$ by all arcs from $cal(C)_u$ to $cal(C)_v$. Call the resulting digraph $hat(G)$. Then 
#[#set math.equation(numbering: n => "(8.1)")
 $ "DFVS" \( hat(G) \) = min {sum_(v in F) c_v : F upright(" is a feedback vertex set of ") G} . $ <eq:clone-exact-optimum>]

 The number of vertices of $hat(G)$ is at most $C S^2 + S$. For fixed $C$, this is a deterministic polynomial construction in the encoding size of $G$ and its costs. Moreover:]
  + #emph[a feedback vertex set of $G$ of cost at most $a$ yields a feedback vertex set of $hat(G)$ of size at most $S \( a + 1 \)$;]
  + #emph[if every feedback vertex set of $G$ has cost greater than $b$, then $"DFVS" \( hat(G) \) > S b$.]
] <lem:round-and-clone>

#proof[
  Let $F$ be a feedback vertex set of $G$. Deleting every cluster $cal(C)_v$ with $v in F$ leaves only clusters over the acyclic digraph $G - F$. Lift a topological order of $G - F$ by placing all vertices of each cluster consecutively. Since clusters are independent, this is a topological order of the surviving vertices of $hat(G)$. It gives a feedback vertex set of size $sum_(v in F) c_v$.
  Conversely, let $Q$ be any feedback vertex set of $hat(G)$, and define
  $ F_Q = { v in V \( G \) : cal(C)_v subset.eq Q } . $
  If $G - F_Q$ contained a directed cycle, every cluster over that cycle would contain a surviving vertex. Choosing one such vertex from each cluster would lift the original cycle to a directed cycle of $hat(G) - Q$, because all the intercluster arcs in the requisite directions are present. This is impossible. Thus $F_Q$ is a feedback vertex set of $G$, and
  $ sum_(v in F_Q) c_v lt.eq \| Q \| . $
  Together with the preceding construction, this proves Equation (8.1). In particular, partial deletions from a cluster cannot improve the optimum beyond the corresponding choice of completely deleted clusters.
  For every $v$ we have
  $ S w_v lt.eq c_v < S w_v + 1 . $
  Summing over any feedback vertex set $F$ gives
  $ S sum_(v in F) w_v lt.eq sum_(v in F) c_v lt.eq S sum_(v in F) w_v + S . $
  This proves both gap implications by Equation (8.1). Equivalently, the rounded costs $c_v \/ S$ increase the cost of any deletion set by at most one.
  Finally,
  $ \| V \( hat(G) \) \| = sum_v c_v lt.eq C S^2 + S . $
  There are at most the square of this number of arcs. Each $c_v$ is computed exactly by integer arithmetic on the rational input cost. For fixed $C$, the vertices and arcs can therefore be listed in polynomial time. Positivity of the costs ensures that every cluster is nonempty before deletions. The assumption that $G$ is loopless ensures that independent clusters realize precisely the prescribed construction. ◻
]

#prodef([Remark 8.2.])[
  (Avoiding opposite arcs).  The construction above already gives loopless digraphs, and unrestricted DFVS permits opposite arcs. If opposite arcs are to be excluded, subdivide every weighted arc using a distinct private vertex of cost $D + 1$ before applying Lemma 29. A feedback vertex set of cost at most $4$ in the original graph still works in the subdivided graph: a cycle avoiding that set would project to a directed closed walk, hence to a directed cycle, in the original remaining graph. On the other hand, a deletion set of cost at most $D$ cannot contain any subdivision vertex. Every surviving original cycle would then lift through its private subdivisions, so the weighted soundness bound is preserved as well. Subdivision of every arc of a loopless digraph leaves no pair of opposite arcs, and the subsequent independent-cluster construction preserves this property. The additional vertices have constant cost and polynomial number, so the size bounds needed for rounding remain valid.
] <rem:no-opposite-arcs>

#proof[
  It suffices to prove the claim for every fixed integer $A gt.eq 1$: given any fixed real factor, choose an integer at least as large. For this integer $A$, choose the parameters of Section 3.1 and start from the NP-hard promise problem of Theorem 2 at the resulting fixed $theta$.
  By Proposition 12, the weighted reduction is deterministic and polynomial in the game input size, and all its costs are bounded by the constant $C_A$. Proposition 11 gives a feedback vertex set of cost at most $4$ in the YES case, while Proposition 28 shows that every feedback vertex set has cost greater than $D = 10 A$ in the NO case. Let $S$ be the number of weighted vertices. Lemma 29 gives an unweighted digraph $hat(G)$ with the gap
  $ upright("YES:") & "DFVS" \( hat(G) \) lt.eq 5 S \,\
upright("NO:") & "DFVS" \( hat(G) \) > D S . $
  This last transformation is polynomial because $C_A$ is fixed. Set $k = 5 S$ and output the pair $\( hat(G) \, k \)$. In the YES case, $"DFVS" \( hat(G) \) lt.eq k$, whereas in the NO case
  $ "DFVS" \( hat(G) \) > D S = 10 A S > 5 A S = A k . $
  Thus this pair has the promised gap of Theorem 1.
  A deterministic polynomial-time $A$-approximation would return a feasible feedback vertex set of size at most $5 A S < D S$ on every YES instance. On a NO instance, every feasible feedback vertex set has size greater than $D S$. Comparing the returned size with the known threshold $D S$ would therefore distinguish the NP-hard promise cases in polynomial time. This proves the asserted NP-hardness for every fixed constant factor, and its deterministic consequence under $upright(P) eq.not upright("NP")$. ◻
]

A #emph[directed feedback arc set] is a set of arcs whose deletion leaves an acyclic digraph. Write $"DFAS" \( H \)$ for its minimum cardinality.

#thm([Corollary 8.3.])[
  (Directed feedback arc set).  #emph[For every fixed real $A gt.eq 1$, approximating directed feedback arc set within factor $A$ is NP-hard on unweighted simple loopless digraphs. More precisely, there is a deterministic polynomial reduction producing such a digraph $H$ and a positive integer $k$ with the promise gap 
$ upright("YES:") & "DFAS" \( H \) lt.eq k \,\
upright("NO:") & "DFAS" \( H \) > A k . $

]
] <cor:feedback-arc>

#proof[
  Let $G = \( V \, E \)$ be an unweighted loopless digraph, with $n = \| V \|$ and $m = \| E \|$. Split each vertex $v$ into $v^(-) \, v^(+)$ and insert the arc $a_v : v^(-) arrow.r v^(+)$. For every original arc $e = \( u \, v \)$, introduce $n + 1$ fresh private vertices $w_(e \, j)$ and the paths
  $ u^(+) arrow.r w_(e \, j) arrow.r v^(-) #h(2em) \( 1 lt.eq j lt.eq n + 1 \) . $
  Call the resulting unweighted digraph $H$. All private vertices are distinct, so $H$ has no loops or repeated arcs, even if $G$ has opposite arcs. It has $2 n + \( n + 1 \) m$ vertices and $n + 2 \( n + 1 \) m$ arcs and is explicitly constructible in polynomial time.
  If $S$ is a feedback vertex set of $G$, deleting the arcs $a_v$ for $v in S$ destroys every directed cycle of $H$: a surviving cycle would alternate distinguished arcs with connector paths and project to a directed closed walk in $G - S$. Hence $"DFAS" \( H \) lt.eq "DFVS" \( G \) lt.eq n$.
  Conversely, let $F$ be any feedback arc set of $H$. If $\| F \| gt.eq n$, return $S = V$, which is a feedback vertex set of size at most $\| F \|$. If $\| F \| < n$, return $S = { v : a_v in F }$, again of size at most $\| F \|$. Were there a directed cycle in $G - S$, every distinguished arc needed to lift it would survive. For each original arc of the cycle, its $n + 1$ connector paths are pairwise edge-disjoint, so at least one survives deletion of $F$. Choosing these paths would lift the cycle to $H - F$, a contradiction. Thus the returned $S$ is always a feedback vertex set, and this recovery is polynomial time.
  The two maps give $"DFAS" \( H \) = "DFVS" \( G \)$. They also preserve approximation solutions: an $A$-approximate $F$ yields $\| S \| lt.eq \| F \| lt.eq A "DFAS" \( H \) = A "DFVS" \( G \)$. Composing this construction with Theorem 1 and retaining its positive integer threshold $k$ proves the stated gap. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
