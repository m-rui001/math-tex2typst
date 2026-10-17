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

#align(center)[#text(size: 16pt, weight: "bold")[The second Kahn--Kalai conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Graph thresholds and the main result <sec:introduction>

When does a random graph contain a prescribed graph? A necessary condition is that each subgraph of the target have a reasonable expected number of copies. Kahn and Kalai [8] conjectured that this elementary obstruction determines the containment threshold within a logarithmic factor, uniformly over the target graph. We prove this conjecture, with the logarithm depending on the number of target edges.

For finite simple graphs $G$ and $F$, write $N \( G \, F \)$ for the number of subgraphs of $G$ isomorphic to $F$. These are ordinary copies: additional edges between the chosen vertices are allowed. Let $G \( n \, p \)$ be the random graph on $\[ n \] = { 1 \, dots.h \, n }$ in which each edge is present independently with probability $p$. For a graph $H$ with at least one edge and at most $n$ vertices, define

$ p_(upright(c)) \( n \, H \) & = inf { p in \[ 0 \, 1 \] : bb(P) \( N \( G \( n \, p \) \, H \) > 0 \) gt.eq 1 / 2 } \,\
p_(upright(E)) \( n \, H \) & = inf { p in \[ 0 \, 1 \] : bb(E) N \( G \( n \, p \) \, F \) gt.eq 1 / 2 upright(" for every subgraph ") F subset.eq H } . $

The first quantity is the containment threshold; the second is the #emph[graph expectation threshold]. Both infima are attained, since the relevant probabilities and expectations are continuous, there are only finitely many constraints, and $p = 1$ satisfies all of them. The single-edge constraint gives $p_(upright(E)) \( n \, H \) > 0$. If $H$ appears with probability at least one half, then so does every $F subset.eq H$, and its expected count is at least one half. Thus $p_(upright(E)) \( n \, H \) lt.eq p_(upright(c)) \( n \, H \)$.

#thm([Theorem 1.1.])[
  #emph[For every $n gt.eq 2$ and every finite simple graph $H$ with $h = e \( H \) gt.eq 1$ edges and at most $n$ vertices, 
#[#set math.equation(numbering: n => "(1.1)")
 $ p_(upright(c)) \( n \, H \) lt.eq min { 1 \, #h(0.27778em) 2048 upright(e)^50 p_(upright(E)) \( n \, H \) \( 1 + log_2 h \) } . $ <eq:stronger>]

 In particular, 
$ p_(upright(c)) \( n \, H \) lt.eq 6144 upright(e)^50 p_(upright(E)) \( n \, H \) log_2 n . $

]
] <thm:main>

Here $upright(e)$ is the base of the natural logarithm. The constants are explicit and universal; the graph $H$ may vary with $n$. Kahn and Kalai use expected count one in their formulation. Replacing one half by one changes the graph expectation threshold by a factor between one and two: for each subgraph with $r gt.eq 1$ edges its expected count is proportional to $p^r$, so its constraint changes by $2^(1 \/ r) lt.eq 2$. This normalization therefore gives the same conjecture.

=== 1.1 History and the obstruction <history-and-the-obstruction>

For a fixed target, threshold questions are part of the classical random-graph theory of Erdős and Rényi [5]; Bollobás [2] treated threshold functions for general fixed subgraphs. Here the target can grow with the host graph. For example, let $H$ be a perfect matching on an even number $n$ of vertices. Then $p_(upright(E)) \( n \, H \) = Theta \( 1 \/ n \)$, whereas $p_(upright(c)) \( n \, H \) = Theta \( log n \/ n \)$ [6,8]. The larger scale is needed to eliminate isolated vertices of the host: a perfect matching must cover every vertex. Hamilton cycles exhibit the same logarithmic gap [8]. These examples show why a uniform comparison must allow a logarithm. Other spanning targets have required different methods: Riordan [14], for example, proved that for every fixed $p > 1 \/ 4$, $G \( 2^d \, p \)$ contains the $d$-dimensional cube with probability tending to one.

To distinguish the two Kahn–Kalai conjectures, consider a nonempty proper increasing family $cal(F) subset.eq 2^X$, where $X$ is finite. A #emph[cover] is a family $cal(G) subset.eq 2^X$ such that every $F in cal(F)$ contains some $S in cal(G)$. Its cost at density $p$ is $sum_(S in cal(G)) p^(\| S \|)$. The integral expectation threshold $q \( cal(F) \)$ is the largest $p$ for which a cover has cost at most $1 \/ 2$. A fractional cover assigns weights $w_S gt.eq 0$ to $S subset.eq X$, requires $sum_(S subset.eq F) w_S gt.eq 1$ for each $F in cal(F)$, and has cost $sum_S w_S p^(\| S \|)$. Allowing these covers defines $q_f \( cal(F) \)$ with the same budget $1 \/ 2$. Union bounds and expectations give $q \( cal(F) \) lt.eq q_f \( cal(F) \) lt.eq p_(upright(c)) \( cal(F) \)$, where $p_(upright(c)) \( cal(F) \)$ is the density at which an independent random subset belongs to $cal(F)$ with probability $1 \/ 2$.

Talagrand [15] Section 6 introduced the fractional formulation and its dual description by spread probability measures. Alweiss, Lovett, Wu, and Zhang [1], building on the regularity viewpoint of Lovett, Solomon, and Zhang [9], developed the fragment method in their work on sunflowers. Frankston, Kahn, Narayanan, and Park [7] proved $p_(upright(c)) \( cal(F) \) = O \( q_f \( cal(F) \) log ell \)$, where $ell$ is the maximum of two and the largest size of a minimal member of $cal(F)$. Park and Pham [13] proved the corresponding bound with $q$ in place of $q_f$, resolving the abstract Kahn–Kalai conjecture by a minimum-fragment argument. The integral and fractional thresholds are within a universal constant factor at the common one-half budget [12] Theorem 1.1. This comparison is contextual; the proof below does not use it.

For the family $cal(F)_H$ of edge sets containing a copy of $H$, the copies of any one subgraph form a cover. Thus $p_(upright(E)) \( n \, H \) lt.eq q \( cal(F)_H \)$, and the abstract theorem alone does not give the desired bound in terms of $p_(upright(E)) \( n \, H \)$. Mossel, Niles-Weed, Sun, and Zadik [11] Theorem 1 obtained a single logarithm using the modified graph threshold

$ tilde(p)_(upright(E)) \( n \, H \) = min { p : bb(E) N \( G \( n \, p \) \, F \) gt.eq N \( H \, F \) \/ 2 upright(" for every ") F subset.eq H } . $

The factor $N \( H \, F \)$ records that containing $H$ supplies all its copies of $F$. By symmetry this parameter equals $q_f \( cal(F)_H \)$ [3] Equation (1); comparing it with $p_(upright(E)) \( n \, H \)$ is the additional graph-specific problem.

Dubroff, Kahn, and Park [3] Theorems 1.2–1.5 proved $q_f \( cal(F)_H \) = O \( p_(upright(E)) \( n \, H \) log^2 n \)$ and hence $p_(upright(c)) \( n \, H \) = O \( p_(upright(E)) \( n \, H \) log^3 n \)$, using a rooted-extension decomposition. They also established the conjectured single-logarithm bound when $p_(upright(E)) \( n \, H \) < 1 \/ \( 3 n \)$. In further work [4] Theorems 1.4–1.5, they proved $N \( H \, F \) lt.eq bb(E) N \( G \( n \, min { 1 \, L q } \) \, F \)$ whenever all subgraphs of $H$ have expected count at least one at density $q$, for test graphs $F$ that are cliques, cycles, or bounded-degree trees. The constant $L$ is universal for cliques and cycles and depends on the degree bound for trees. Tran [16] then obtained $q_f \( cal(F)_H \) = O \( p_(upright(E)) \( n \, H \) log \( 2 e \( H \) \) \)$, reducing the general containment loss to $O \( log^2 \( 2 e \( H \) \) \)$. He removed the loss in the comparison of expectation thresholds for trees and for graphs whose average degree is at least the logarithm of their maximum degree, thereby proving the second conjecture for these classes. His ratio-maximizing cores give the conditional graph-extension distributions used here.

Tran [16] Section 4 also proposed a coupling conjecture that would absorb successive conditional extensions while paying the logarithmic sampling cost once. We prove the required containment bound through a tree reduction: we keep all possible extension histories in a tree and reduce every level with the same random set. Disjointness along a history supplies the precise control of dependence that this reuse requires.

=== 1.2 Proof strategy and method ancestry <proof-strategy-and-method-ancestry>

Start with a nonempty edge subset $I$ of $H$. Among its subgraphs, choose $S$ maximizing the probability that a fixed copy $S_0$ on $\[ n \]$ lies in a uniform copy of $I$, after division by a suitable exponential weight in $e \( S \)$. The first-moment constraints force $S$ to be smaller than $I$ by a fixed factor. Maximality also bounds the probability that a prescribed set $J$ of added edges appears, conditional on any copy of $S$, by $\( C_0 p_(upright(E)) \( n \, H \) \)^(\| J \|)$ for a universal constant $C_0$. Repeating the choice gives nested subgraphs. The tree branches over all their possible copies; its arc labels are the added edges. Those labels are disjoint along each path, and their sizes increase geometrically. This maximization argument is the graph-specific spread-link construction of Tran [16] Section 3. Its conditioning step has antecedents in the large-link argument of Lovett, Solomon, and Zhang [9] Claim 29 and the spread-link extraction from a maximal violating core in Alweiss, Lovett, Wu, and Zhang [1] Lemma 2.4.

For one distribution of labels, we use the Bayesian resampling construction of Mossel, Niles-Weed, Sun, and Zadik [10]. Plant a source label into an independent random set $W$, sample a target label from the posterior distribution given their union, and retain the part of the target outside $W$. This remainder is also a subset of the source. Section 2 proves that large remainders are exponentially unlikely and bounds the change of measure on coordinates outside the target.

Section 3 applies this transition simultaneously at every node of the fixed tree. A recursively defined potential bounds the probability that too many continuations fail. Below a target arc, all labels avoid that arc’s label, so the local change-of-measure estimate applies to the entire descendant potential. This is the step that permits one $W$ to halve every level’s capacity while preserving spread at a controlled conditioning cost. Iteration needs only logarithmically many successful draws. Finally, Section 4 constructs the graph hierarchy, with the ordinary-copy normalization explicit, and applies the tree covering theorem. All these arguments are proved below.

Throughout, $log$ without a subscript is the natural logarithm. For a finite set $X$ and $0 lt.eq rho lt.eq 1$, let $mu_rho$ be the law of a random subset of $X$ that includes each element independently with probability $rho$.

== 2 Resampling a spread family <sec:resampling>

The graph argument will produce distributions of edge extensions. We first show how one product sample can replace a set from such a distribution by a smaller remainder, and bound the resulting change in the law of coordinates outside the chosen set.

For $a > 0$, a probability distribution on subsets $A subset.eq X$ is #emph[$a$-spread] if

#[#set math.equation(numbering: n => "(2.1)")
 $ bb(P) \( J subset.eq A \) lt.eq a^(\| J \|) #h(2em) \( diameter eq.not J subset.eq X \) . $ <eq:spread>]

We allow the distribution to be carried by a finite indexed family $\( A_b \)_(b in B)$: distinct indices may have the same label, and labels may be empty. Write $nu_b > 0$ for the weights, with $sum_b nu_b = 1$.

The transition below is the planted-set and posterior-resampling construction of Mossel, Niles-Weed, Sun, and Zadik [10] Sections 2.1–2.3. We record a capacity-dependent failure estimate and a change-of-measure bound for functions of coordinates outside the target label; the latter will control the dependence between successive tree levels.

Fix $0 < rho < 1$ and $W subset.eq X$. The following transition will be used at every node of a tree:

+ Choose a #emph[source] $c$ with law $nu$, and set $Y = W union A_c$.
+ Choose a #emph[target] $b$ with conditional probabilities
  #[#set math.equation(numbering: n => "(2.2)")
   $ frac(nu_b rho^(- \| A_b \|) upright(bold(1))_({ A_b subset.eq Y }), Z \( Y \)) \, #h(2em) Z \( Y \) = sum_(d in B) nu_d rho^(- \| A_d \|) upright(bold(1))_({ A_d subset.eq Y }) . $ <eq:posterior>]
+ Retain the fragment $T = A_b \\ W$.

The denominator is positive because $A_c subset.eq Y$ and $nu_c > 0$. To see why these are posterior probabilities, now let $W tilde.op mu_rho$ independently of the source. For a fixed source $c$, the probability mass of the planted union at a set $Y$ is $mu_rho \( Y \) rho^(- \| A_c \|) upright(bold(1))_({ A_c subset.eq Y })$. After averaging over $c$, the law of $Y$ therefore has density $Z$ relative to $mu_rho$, and Bayes’ formula gives (2.2). At a specified $W$, however, only the source is guaranteed to have its original law $nu$; the target law may differ.

For every transition of positive probability,

#[#set math.equation(numbering: n => "(2.3)")
 $ T subset.eq A_c ∩ A_b \, #h(2em) A_b subset.eq W union T . $ <eq:two-inclusions>]

The first inclusion will preserve spread by comparing the fragment with the source. The second lets us recover the chosen target from $W$ and its fragment. In the tree application, that target also specifies which child and its continuations are kept. The entire transition, including its fragment, only inspects membership in $W$ on $union.big_(b in B) A_b$.

#thm([Lemma 2.1.])[
  (Local resampling).  #emph[Suppose that $\| A_b \| lt.eq m$ for a positive integer $m$, the law $nu$ is $a$-spread, and 
$ 0 < rho < 1 \, #h(2em) a \/ rho lt.eq upright(e)^(- 50) . $

 Let $W tilde.op mu_rho$, independently of the source choice, and perform the transition above. Call the transition a #emph[local failure] if 
$ Z \( Y \) < upright(e)^(- 10 m) quad upright("or") quad \| T \| > m \/ 2 . $

 Then 
#[#set math.equation(numbering: n => "(2.4)")
 $ bb(P) \( upright("local failure") \) lt.eq upright(e)^(- 9 m) . $ <eq:local-failure>]

 Moreover, for each fixed target $b$ and every nonnegative function $f$ depending only on $W ∩ \( X \\ A_b \)$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ bb(E) #h(-0.16667em) [upright(bold(1))_({ upright("target") = b \, med Z \( Y \) gt.eq upright(e)^(- 10 m) }) f \( W \)] lt.eq upright(e)^(11 m) nu_b thin bb(E) f \( W \) . $ <eq:distortion>]

 The expectation on the right is with respect to $W tilde.op mu_rho$.]
] <lem:local>

#proof[
  The density identity above gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] Z \( Y \) < upright(e)^(- 10 m) #scale(x: 120%, y: 120%)[\)] = bb(E)_(Y tilde.op mu_rho) #scale(x: 120%, y: 120%)[\[] Z \( Y \) upright(bold(1))_({ Z \( Y \) < upright(e)^(- 10 m) }) #scale(x: 120%, y: 120%)[\]] lt.eq upright(e)^(- 10 m) . $ <eq:small-denominator>]
  We will use the following consequence of spread. For a fixed $b$, let $R = \| A_c ∩ A_b \|$, where $c$ has law $nu$. For every $0 lt.eq r lt.eq m$, including the trivial case $r = 0$,
  #[#set math.equation(numbering: n => "(2.7)")
   $ bb(P) \( R = r \) lt.eq sum_(J subset.eq A_b\
\| J \| = r) bb(P) \( J subset.eq A_c \) lt.eq binom(m, r) a^r . $ <eq:intersection>]
  On $Z \( Y \) gt.eq upright(e)^(- 10 m)$, bound the reciprocal denominator in (2.2) by $upright(e)^(10 m)$. For a fixed pair $\( c \, b \)$, the condition $A_b subset.eq W union A_c$ requires $A_b \\ A_c subset.eq W$, an event of probability $rho^(\| A_b \\ A_c \|)$. Also, $\| T \| > m \/ 2$ implies $\| A_c ∩ A_b \| > m \/ 2$. Therefore
  $ & bb(P) #scale(x: 120%, y: 120%)[\(] Z \( Y \) gt.eq upright(e)^(- 10 m) \, med \| T \| > m \/ 2 #scale(x: 120%, y: 120%)[\)]\
 & #h(2em) lt.eq upright(e)^(10 m) sum_(c \, b) nu_c nu_b rho^(- \| A_c ∩ A_b \|) upright(bold(1))_({ \| A_c ∩ A_b \| > m \/ 2 })\
 & #h(2em) lt.eq upright(e)^(10 m) sum_(r > m \/ 2) binom(m, r) \( a \/ rho \)^r lt.eq upright(e)^(10 m) 2^m upright(e)^(- 25 m) . $
  Together with (2.6), this gives
  $ bb(P) \( upright("local failure") \) lt.eq upright(e)^(- 10 m) + upright(e)^(- \( 15 - log 2 \) m) lt.eq upright(e)^(- 9 m) \, $
  as $m gt.eq 1$.
  For (2.5), again bound the reciprocal denominator and then sum over sources. The event $A_b \\ A_c subset.eq W$ uses only coordinates inside $A_b$, so it is independent of $f \( W \)$. Hence
  $ & bb(E) #h(-0.16667em) [upright(bold(1))_({ upright("target") = b \, med Z \( Y \) gt.eq upright(e)^(- 10 m) }) f \( W \)]\
 & #h(2em) lt.eq upright(e)^(10 m) nu_b sum_c nu_c rho^(- \| A_b \|) bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ A_b \\ A_c subset.eq W }) f \( W \) #scale(x: 120%, y: 120%)[\]]\
 & #h(2em) = upright(e)^(10 m) nu_b thin bb(E) f \( W \) sum_c nu_c rho^(- \| A_c ∩ A_b \|)\
 & #h(2em) lt.eq upright(e)^(10 m) nu_b thin bb(E) f \( W \) sum_(r = 0)^m binom(m, r) \( a \/ rho \)^r lt.eq upright(e)^(11 m) nu_b thin bb(E) f \( W \) . $
  The penultimate inequality is (2.7); the last uses $\( 1 + a \/ rho \)^m lt.eq upright(e)^m$. ◻
]

== 3 Covering a tree <sec:trees>

We now cover an entire chain of extensions. The input is a finite tree whose edge labels are disjoint along each path and whose child laws are spread. The aim is to put the labels of one full path inside a product sample, with a cost logarithmic in the largest extension size.

A #emph[probability tree on $X$] is a finite rooted tree with all leaves at the same depth, together with a probability distribution $nu_v$ on the children $"Ch" \( v \)$ of each non-leaf node $v$ and a label $A_v \( b \) subset.eq X$ on the arc from $v$ to each child $b$. We delete zero-weight children. Different nodes or arcs may carry identical labels; nodes are never identified merely because their labels agree. A #emph[path] always means a full root-to-leaf path, unless otherwise specified. Write

$ cal(U) \( P \) = union.big_(\( v \, b \) in P) A_v \( b \) $

for its union of labels.

The tree is #emph[disjoint] if the labels along each path are pairwise disjoint. A level has #emph[capacity] $m$ if all its labels have size at most $m$. A level is #emph[$a$-spread] if the child distribution at every node immediately above that level is $a$-spread. Thus all requirements concern individual child distributions; no spread assumption is made on the distribution of a full path.

#thm([Theorem 3.1.])[
  (Tree covering).  #emph[Let $cal(T)$ be a disjoint probability tree on a finite set $X$, with $k gt.eq 1$ levels. Suppose that every level is $sigma$-spread, where $sigma > 0$, and that its positive integer capacities satisfy 
$ ell_(i + 1) gt.eq 16 ell_i #h(2em) \( 1 lt.eq i < k \) . $

 Set 
$ r = min { 1 \, #h(0.27778em) 16 upright(e)^50 sigma \( 1 + log_2 ell_k \) } . $

 Then 
$ bb(P)_(W tilde.op mu_r) #scale(x: 120%, y: 120%)[\(] cal(U) \( P \) subset.eq W upright(" for some path ") P upright(" of ") cal(T) #scale(x: 120%, y: 120%)[\)] gt.eq 2 / 3 . $

]
] <thm:tree>

Section 4 constructs such a tree for $H$ with $sigma = 128 p_(upright(E)) \( n \, H \)$ and $ell_k lt.eq e \( H \)$. We prove the tree theorem by repeatedly pruning and reweighting the tree while replacing its labels by smaller subsets. Empty labels and unequal label sizes must therefore be allowed.

=== 3.1 One simultaneous reduction <one-simultaneous-reduction>

#thm([Lemma 3.2.])[
  (Reduction).  #emph[Let $cal(T)$ be a disjoint probability tree with $k gt.eq 1$ levels and positive integer capacities $m_1 \, dots.h \, m_k$ satisfying $m_(j + 1) gt.eq 16 m_j$. Suppose level $j$ is $alpha_j$-spread, where 
$ 0 < alpha_j lt.eq a \, #h(2em) rho = upright(e)^50 a < 1 . $

 There is a deterministic procedure which, given $W tilde.op mu_rho$, succeeds with probability at least $3 \/ 4$ and on success returns a disjoint probability tree $cal(T)'$ with the same levels, such that:]
  + #emph[level $j$ has capacity $floor.l m_j \/ 2 floor.r$ and is $alpha_j \/ \( 1 - upright(e)^(- m_j) \)$-spread;]
  + #emph[for every path $Q$ of $cal(T)'$ there is a path $P$ of $cal(T)$ with 
#[#set math.equation(numbering: n => "(3.1)")
 $ cal(U) \( P \) subset.eq W union cal(U) \( Q \) . $ <eq:recovery>]

]
] <lem:reduction>

#proof[
  The output will be a subtree with labels $A_v \( b \) \\ W$ and child laws obtained from the target marginals of the local transition. We first identify which children can be retained while discarding at most $upright(e)^(- m_j)$ of the transition mass at each retained node with outgoing level $j$. Keep the input tree fixed throughout this analysis. At a node whose outgoing level is $j$, use the transition of Section 2 with its child distribution and capacity $m_j$. All nodes use the same set $W$. At fixed $W$, write $d_v \( W \)$ for the probability of local failure at $v$, and $t_(v b) \( W \)$ for the probability of local non-failure with target $b$. Thus
  #[#set math.equation(numbering: n => "(3.2)")
   $ d_v \( W \) + sum_(b in "Ch" \( v \)) t_(v b) \( W \) = 1 . $ <eq:local-masses>]
  All these probabilities refer to the child laws of the fixed input tree, before any pruning or conditioning.
  #emph[Pruning.] For the remainder of the construction, fix $W$ and put $epsilon.alt_j = upright(e)^(- m_j)$. Declare all leaves good. Working upward, declare a node $v$ with outgoing level $s$ good if
  #[#set math.equation(numbering: n => "(3.3)")
   $ sum_(b in "Ch" \( v \)\
b med upright("good")) t_(v b) \( W \) gt.eq 1 - epsilon.alt_s . $ <eq:good-node>]
  The attempt succeeds exactly when the root is good.
  To bound the probability that the root is bad, define a nonnegative potential on every node of the input tree. Set $D_v \( W \) = 0$ at leaves and, at a node with outgoing level $s$, define recursively
  #[#set math.equation(numbering: n => "(3.4)")
   $ D_v \( W \) = frac(d_v \( W \) + sum_(b in "Ch" \( v \)) t_(v b) \( W \) D_b \( W \), epsilon.alt_s) . $ <eq:pruning-recurrence>]
  Every bad node satisfies $D_v \( W \) > 1$. Indeed, assuming this for its bad children, the numerator in (3.4) is at least
  $ d_v \( W \) + sum_(b med upright("bad")) t_(v b) \( W \) > epsilon.alt_s \, $
  where the last inequality follows from (3.2) and the failure of (3.3). This proves the assertion by backward induction.
  #emph[Expected potential.] We now average over $W tilde.op mu_rho$. Fix a child $b$ of a node $v$ with outgoing level $s$, and abbreviate its incoming label to $A_b$. Every label in the entire subtree below $b$ is disjoint from $A_b$: each such label lies on a path containing the arc into $b$. The transition at any node in that subtree only inspects $W$ on the union of that node’s child labels. By its recursive definition, $D_b \( W \)$ therefore depends only on $W$ outside $A_b$.
  This statement concerns every node of the fixed input tree, before conditioning on that node being good or being retained. Figure 1 shows the disjointness that makes this possible.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$v$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.8, -1), [#text(size: 9pt)[$b$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.8, -1), [#text(size: 9pt)[$c$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2.6, -2), [#text(size: 9pt)[$b_1$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1, -2), [#text(size: 9pt)[$b_2$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (-1.8, -1), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((-0.9, -0.5), [#text(size: 9pt)[$A_v(b)$]], anchor: "south-east", padding: 0.1176cm)
  line((0, 0), (1.8, -1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.9, -0.5), [#text(size: 9pt)[$A_v(c)$]], anchor: "south-west", padding: 0.1176cm)
  line((-1.8, -1), (-2.6, -2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-1.8, -1), (-1, -2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-2.6, -2), (-2.9, -2.6), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-2.6, -2), (-2.3, -2.6), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-1, -2), (-1.3, -2.6), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-1, -2), (-0.7, -2.6), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((0.2, -2), [#text(size: 9pt)[Every label below $b$ avoids $A_v(b)$.#linebreak()Hence $D_b(W)$ uses only $W without A_v(b)$.]], anchor: "west", padding: 0.1176cm)
  content((0, 0.4), [#text(size: 9pt)[The same set $W$ is used at every node.]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: Disjointness along paths controls the change of measure. Every arc below $b$ lies on a path through its incoming arc, so the potential $D_b$ is a function of coordinates outside the incoming label. The diagram is schematic; labels on different branches may overlap. ],
  ) <fig:outside>
  In the local transition at $v$,
  $ t_(v b) \( W \) lt.eq bb(P) #scale(x: 120%, y: 120%)[\(] upright("target") = b \, med Z \( Y \) gt.eq upright(e)^(- 10 m_s) divides W #scale(x: 120%, y: 120%)[\)] . $
  We may consequently apply (2.5) with $f \( W \) = D_b \( W \)$. Together with (2.4) and $epsilon.alt_s^(- 1) = upright(e)^(m_s)$, the recurrence gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ bb(E) D_v \( W \) lt.eq upright(e)^(- 8 m_s) + upright(e)^(12 m_s) sum_(b in "Ch" \( v \)) nu_v \( b \) thin bb(E) D_b \( W \) . $ <eq:expected-potential>]
  This step controls the dependence caused by reusing $W$. Since the child weights sum to one, backward induction yields
  $ bb(E) D_v \( W \) lt.eq sum_(j = s)^k exp (12 sum_(h = s)^(j - 1) m_h - 8 m_j) . $
  In particular, if $o$ is the root, then
  $ bb(P) \( o upright(" is bad") \) & lt.eq bb(E) D_o \( W \)\
 & lt.eq sum_(j = 1)^k exp (12 sum_(h < j) m_h - 8 m_j) < 1 / 4 . $
  For the last inequality, geometric growth gives $sum_(h < j) m_h lt.eq m_j \/ 15$, and the $m_j$ are distinct positive integers. Thus the sum is at most $sum_(m gt.eq 1) upright(e)^(- 7 m) < 1 \/ 4$.
  #emph[The reduced tree.] On success, start from the good root. At any good node $v$ with outgoing level $j$, put
  $ gamma_v \( W \) = sum_(b med upright("good")) t_(v b) \( W \) gt.eq 1 - epsilon.alt_j . $
  Retain each good child $b$ with $t_(v b) \( W \) > 0$, give it weight $t_(v b) \( W \) \/ gamma_v \( W \)$, replace its incoming label by
  $ T_b = A_v \( b \) \\ W \, $
  and continue recursively into $b$. The result is a pruned and reweighted subtree of the input tree. It has the same depth because $gamma_v > 0$ at every retained non-leaf node. Its labels are subsets of the old labels, so it is disjoint. Since $A_v \( b \) subset.eq W union T_b$ on every retained arc, it also satisfies (3.1). A retained child has $t_(v b) > 0$, which implies $\| T_b \| lt.eq floor.l m_j \/ 2 floor.r$.
  This new child law is the target marginal of the joint transition conditioned on local non-failure and a good target. Denote this conditioning event by $E_v$. For the spread bound, use the source: (2.3) gives $T subset.eq A_v \( c \)$ for every transition, and the unconditioned source has law $nu_v$ even at fixed $W$. Thus, for every nonempty $J subset.eq X$,
  $ bb(P) \( J subset.eq T divides E_v \, W \) & lt.eq frac(bb(P)_(c tilde.op nu_v) \( J subset.eq A_v \( c \) \), gamma_v \( W \))\
 & lt.eq frac(alpha_j^(\| J \|), 1 - epsilon.alt_j) lt.eq (frac(alpha_j, 1 - epsilon.alt_j))^(\| J \|) . $
  This proves all the assertions. The quantities $t_(v b) \( W \)$ define the entire construction deterministically; sources and targets are auxiliary random variables used to analyze its weights. ◻
]

=== 3.2 Iteration <iteration>

#proof[
  If $r = 1$, the conclusion is immediate. Suppose $r < 1$, and set
  $ a = 4 sigma \, #h(2em) rho = upright(e)^50 a \, #h(2em) s = floor.l log_2 ell_k floor.r + 1 . $
  In particular $0 < rho < 1$. Start with $cal(T)$ and make successive attempts using fresh independent sets of law $mu_rho$. A failed attempt leaves the current tree unchanged. After a successful attempt, retain the tree provided by Lemma 4. Conditionally on the complete past, the current tree is fixed and the next draw still has law $mu_rho$.
  After $t$ successes, the capacity at original level $i$ is
  #[#set math.equation(numbering: n => "(3.6)")
   $ m_i \( t \) = ⌊ell_i / 2^t⌋ \, $ <eq:capacities>]
  using $floor.l floor.l x floor.r \/ 2 floor.r = floor.l x \/ 2 floor.r$. Levels of zero capacity form an initial segment. After each success, choose any one path through that segment and keep its ending subtree, deleting the segment. All committed labels are empty, so each path of the retained subtree extends to a full path by adjoining the chosen empty prefix. This preserves the recovery guarantee and every bound at a retained node. If no levels remain, only the root is left. Fix a tie-breaking rule for these choices. The remaining positive capacities still satisfy $m_(i + 1) \( t \) gt.eq 16 m_i \( t \)$, since $floor.l 16 x floor.r gt.eq 16 floor.l x floor.r$.
  At a remaining original level $i$, a valid spread parameter after $t$ successes is
  #[#set math.equation(numbering: n => "(3.7)")
   $ alpha_i \( t \) = sigma product_(u = 0)^(t - 1) (1 - upright(e)^(- floor.l ell_i \/ 2^u floor.r))^(- 1) . $ <eq:spread-iteration>]
  The positive integers $floor.l ell_i \/ 2^u floor.r$ in this product are distinct. The infinite product over all positive integers is less than $4$, because
  $ sum_(m = 1)^oo - log \( 1 - upright(e)^(- m) \) & lt.eq frac(1, 1 - upright(e)^(- 1)) sum_(m = 1)^oo upright(e)^(- m)\
 & = frac(upright(e)^(- 1), \( 1 - upright(e)^(- 1) \)^2) < log 4 . $
  Consequently $alpha_i \( t \) lt.eq 4 sigma = a$. The initial tree satisfies these bounds, and Lemma 4 proves them inductively after every success. Thus every attempt before completion has conditional success probability at least $3 \/ 4$.
  After $s$ successes, (3.6) is zero at every level. Composing (3.1) through the successful reductions shows that the union of their draws contains the labels of a path in the original tree. The expected waiting time for each next success is at most $4 \/ 3$: conditionally on the past, its tail is bounded by that of a geometric random variable with success probability $3 \/ 4$. Hence the expected number of attempts needed is at most $4 s \/ 3$. By Markov’s inequality, completion occurs within $4 s$ attempts with probability at least $2 \/ 3$.
  Predraw $4 s$ independent sets of law $mu_rho$, including any that the procedure ultimately does not use, and take their union $W_(*)$. It has law $mu_(r_(*))$, where
  $ r_(*) = 1 - \( 1 - rho \)^(4 s) lt.eq 4 s rho = 16 upright(e)^50 sigma s lt.eq 16 upright(e)^50 sigma \( 1 + log_2 ell_k \) = r . $
  With probability at least $2 \/ 3$, $W_(*)$ contains a path union. The same bound holds for $mu_r$ by monotonicity. ◻
]

== 4 Application to graph containment <sec:graphs>

It remains to construct the tree required by Theorem 3. We use the normalized-containment maximization and conditional-extension argument of Tran [16] Section 3, Lemma 3.1, with constants suited to the factor-$16$ separation of capacities. The copy-count identity below also appears in Mossel, Niles-Weed, Sun, and Zadik [11] Equation (5).

Put $q = p_(upright(E)) \( n \, H \)$ and $sigma = 128 q$. Delete the isolated vertices of $H$ and of each graph subsequently considered, and identify these graphs with their edge sets. This does not change the event of containing $H$: any copy of its nonisolated part can be extended by choosing the required number of additional vertices, since $n gt.eq \| V \( H \) \|$ and copies need not be induced. Every edge subset used below, on its incident vertices, is a subgraph of the original $H$, so its expectation at $q$ is at least $1 \/ 2$. Throughout this deletion, $q$ remains the threshold defined using the original graph $H$.

For a graph $F$ without isolated vertices, let

$ M \( F \) = N \( K_n \, F \) \, #h(2em) M \( I \, F \) = N \( I \, F \) . $

In particular, $M \( F \) = \( n \)_(v \( F \)) \/ \| "Aut" \( F \) \|$, where $\( n \)_v = n \( n - 1 \) dots.h.c \( n - v + 1 \)$ and $"Aut" \( F \)$ is the group of vertex permutations preserving adjacency. Dividing by this group counts each ordinary copy once; $M \( I \, F \)$ likewise counts copies, rather than vertex embeddings. For the empty edge set use $M \( diameter \) = M \( I \, diameter \) = 1$. If $bold(I)$ is a uniformly chosen copy of $I$ on $\[ n \]$, and $F_0$ is any fixed copy of an edge subset $F subset.eq I$, then

#[#set math.equation(numbering: n => "(4.1)")
 $ bb(P) \( F_0 subset.eq bold(I) \) = frac(M \( I \, F \), M \( F \)) . $ <eq:copy-ratio>]

Indeed, permutation symmetry makes the probability independent of the chosen copy $F_0$. Summing it over all $M \( F \)$ copies counts the $M \( I \, F \)$ copies contained in each $bold(I)$.

#thm([Lemma 4.1.])[
  (Graph hierarchy).  #emph[There is a disjoint probability tree on $X = binom(\[ n \], 2)$ whose path unions are copies of $H$ with its isolated vertices removed, such that every level is $sigma$-spread and its label sizes $ell_1 \, dots.h \, ell_k$ satisfy 
$ 1 lt.eq ell_1 \, #h(2em) ell_(i + 1) gt.eq 16 ell_i \, #h(2em) ell_k lt.eq e \( H \) . $

]
] <lem:hierarchy>

#proof[
  For a current nonempty edge set $I subset.eq H$, choose an edge subset $S subset.eq I$ maximizing
  #[#set math.equation(numbering: n => "(4.2)")
   $ R_sigma \( I \, S \) = sigma^(- \| S \|) bb(P) \( S_0 subset.eq bold(I) \) \, $ <eq:maximizer>]
  where $S_0$ is any fixed copy of $S$ on $\[ n \]$. The empty set is allowed and has value $1$. Fix any deterministic rule for breaking ties.
  Write $h_I = \| I \|$ and $r = \| S \| > 0$. The expectation constraint gives $M \( S \) q^r gt.eq 1 \/ 2$, while $M \( I \, S \) lt.eq binom(h_I, r)$. By (4.1),
  $ R_sigma \( I \, S \) lt.eq 2 binom(h_I, r) \( q \/ sigma \)^r = 2 binom(h_I, r) 128^(- r) . $
  For $r gt.eq h_I \/ 17$, the bound $binom(h_I, r) lt.eq \( upright(e) h_I \/ r \)^r$ gives
  $ R_sigma \( I \, S \) lt.eq 2 \( 17 upright(e) \/ 128 \)^r < 1 . $
  Thus every maximizing predecessor satisfies $\| S \| < \| I \| \/ 17$.
  Repeat the selection until the empty set is reached, and write the resulting nested sequence in reverse order as
  $ diameter = H_0 subset H_1 subset dots.h.c subset H_k = H \, #h(2em) \| H_(i - 1) \| < \| H_i \| \/ 17 . $
  Here and below $H$ denotes its edge set. Build a tree rooted at the empty set. From each reached copy $S_0$ of $H_(i - 1)$, take as children all copies of $H_i$ containing $S_0$, with the uniform distribution, and label the arc to a child $I_0$ by $I_0 \\ S_0$. Such children exist, since every copy of $H_(i - 1)$ extends to a copy of $H_i$ on $\[ n \]$. Keep distinct histories as distinct tree nodes. The labels on every path are disjoint and their union is a copy of $H$. Their sizes are
  $ ell_i = \| H_i \| - \| H_(i - 1) \| > 0 \, #h(2em) ell_(i + 1) > 16 \| H_i \| gt.eq 16 ell_i . $
  It remains to check conditional spread. At a node $S_0$, let $A$ be its random added label. If $J ∩ S_0 eq.not diameter$, then $bb(P) \( J subset.eq A \) = 0$. Otherwise, for a uniform copy $bold(I)$ of $H_i$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ bb(P) \( J subset.eq A \) = frac(bb(P) \( S_0 union J subset.eq bold(I) \), bb(P) \( S_0 subset.eq bold(I) \)) . $ <eq:conditional-ratio>]
  If the numerator is positive, $S_0 union J$ is isomorphic to an edge subset $U subset.eq H_i$. Maximality of $H_(i - 1)$ in (4.2) gives
  $ sigma^(- \( \| S_0 \| + \| J \| \)) bb(P) \( S_0 union J subset.eq bold(I) \) lt.eq sigma^(- \| S_0 \|) bb(P) \( S_0 subset.eq bold(I) \) . $
  Together with (4.3), this gives $bb(P) \( J subset.eq A \) lt.eq sigma^(\| J \|)$. If the numerator is zero, the same bound is immediate. This proves the lemma. ◻
]

#proof[
  Apply Theorem 3 to the tree of Lemma 5, with $sigma = 128 q$. Since $ell_k lt.eq h = e \( H \)$, a Bernoulli edge set with parameter
  $ r = min { 1 \, #h(0.27778em) 2048 upright(e)^50 q \( 1 + log_2 h \) } $
  contains a copy of $H$ with probability at least $2 \/ 3$. This proves (1.1). Finally, $h lt.eq binom(n, 2) lt.eq n^2$ and $n gt.eq 2$ give $1 + log_2 h lt.eq 3 log_2 n$, and hence the stated constant $C = 6144 upright(e)^50$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[R.~Alweiss, S.~Lovett, K.~Wu, and J.~Zhang, #emph[Improved bounds for the sunflower lemma], Annals of Mathematics (2) #strong[194] (2021), no.~3, 795--815. #link("https://doi.org/10.4007/annals.2021.194.3.5")[doi:10.4007/annals.2021.194.3.5].]
#bibitem([2])[B.~Bollobás, #emph[Threshold functions for small subgraphs], Mathematical Proceedings of the Cambridge Philosophical Society #strong[90] (1981), no.~2, 197--206. #link("https://doi.org/10.1017/S0305004100058655")[doi:10.1017/S0305004100058655].]
#bibitem([3])[Q.~Dubroff, J.~Kahn, and J.~Park, #emph[On the "second" Kahn--Kalai conjecture], arXiv:2508.14269v1 (August 19, 2025). #link("https://arxiv.org/abs/2508.14269v1").]
#bibitem([4])[Q.~Dubroff, J.~Kahn, and J.~Park, #emph[On the "second" Kahn--Kalai conjecture: cliques, cycles, and trees], arXiv:2510.02005v2 (October 23, 2025). #link("https://arxiv.org/abs/2510.02005v2").]
#bibitem([5])[P.~Erdős and A.~Rényi, #emph[On the evolution of random graphs], Publications of the Mathematical Institute of the Hungarian Academy of Sciences #strong[5] (1960), 17--61. #link("https://static.renyi.hu/~p_erdos/1960-10.pdf").]
#bibitem([6])[P.~Erdős and A.~Rényi, #emph[On the existence of a factor of degree one of a connected random graph], Acta Mathematica Academiae Scientiarum Hungaricae #strong[17] (1966), 359--368. #link("https://users.renyi.hu/~p_erdos/1966-16.pdf").]
#bibitem([7])[K.~Frankston, J.~Kahn, B.~Narayanan, and J.~Park, #emph[Thresholds versus fractional expectation-thresholds], Annals of Mathematics (2) #strong[194] (2021), no.~2, 475--495. #link("https://doi.org/10.4007/annals.2021.194.2.2")[doi:10.4007/annals.2021.194.2.2].]
#bibitem([8])[J.~Kahn and G.~Kalai, #emph[Thresholds and expectation thresholds], Combinatorics, Probability and Computing #strong[16] (2007), no.~3, 495--502. #link("https://doi.org/10.1017/S0963548307008474")[doi:10.1017/S0963548307008474].]
#bibitem([9])[S.~Lovett, N.~Solomon, and J.~Zhang, #emph[From DNF compression to sunflower theorems via regularity], 34th Computational Complexity Conference, LIPIcs #strong[137] (2019), 5:1--5:14. #link("https://doi.org/10.4230/LIPIcs.CCC.2019.5")[doi:10.4230/LIPIcs.CCC.2019.5].]
#bibitem([10])[E.~Mossel, J.~Niles-Weed, N.~Sun, and I.~Zadik, #emph[A Bayesian proof of the spread lemma], Random Structures & Algorithms #strong[66] (2025), no.~4, e70008. #link("https://doi.org/10.1002/rsa.70008")[doi:10.1002/rsa.70008].]
#bibitem([11])[E.~Mossel, J.~Niles-Weed, N.~Sun, and I.~Zadik, #emph[On the second Kahn--Kalai conjecture], arXiv:2209.03326v1 (September 7, 2022). #link("https://arxiv.org/abs/2209.03326v1").]
#bibitem([12])[OpenAI, #emph[Integral and fractional expectation thresholds are equivalent], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Integral-and-fractional-expectation-thresholds-are-equivalent-September-23-2026/paper.pdf")[OAI:Integral-and-fractional-expectation-thresholds-are-equivalent-September-23-2026], 2026, Theorem~1.1, p.~2.]
#bibitem([13])[J.~Park and H.~T.~Pham, #emph[A proof of the Kahn--Kalai conjecture], Journal of the American Mathematical Society #strong[37] (2024), no.~1, 235--243. #link("https://doi.org/10.1090/jams/1028")[doi:10.1090/jams/1028].]
#bibitem([14])[O.~Riordan, #emph[Spanning subgraphs of random graphs], Combinatorics, Probability and Computing #strong[9] (2000), no.~2, 125--148. #link("https://doi.org/10.1017/S0963548399004150")[doi:10.1017/S0963548399004150].]
#bibitem([15])[M.~Talagrand, #emph[Are many small sets explicitly small?], Proceedings of the 42nd ACM Symposium on Theory of Computing (2010), 13--36. #link("https://doi.org/10.1145/1806689.1806693")[doi:10.1145/1806689.1806693].]
#bibitem([16])[T.~Tran, #emph[Fractional expectation thresholds and the "second" Kahn--Kalai conjecture], arXiv:2609.20546v2 (September 24, 2026). #link("https://arxiv.org/abs/2609.20546v2").]


