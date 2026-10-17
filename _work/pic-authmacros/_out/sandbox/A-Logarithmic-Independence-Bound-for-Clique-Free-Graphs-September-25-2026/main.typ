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

#align(center)[#text(size: 16pt, weight: "bold")[A logarithmic independence bound for clique-free graphs]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

An independent set in a graph is a set of pairwise nonadjacent vertices. For a finite simple graph $G$, write $alpha \( G \)$ for the largest size of an independent set. If $G$ has $n > 0$ vertices, its average degree is $d \( G \) = 2 \| E \( G \) \| \/ n$. The graph is $K_r$-free if no $r$ vertices are pairwise adjacent; throughout, exclusion means exclusion as an ordinary subgraph. All logarithms are natural. For general graphs, the elementary bound $alpha \( G \) gt.eq n \/ \( d + 1 \)$ is best possible, as disjoint unions of cliques show. Excluding a fixed clique forces larger independent sets. We prove that the improvement is a factor of order $log d$.

#thm([Theorem 1.1.])[
  #emph[For every integer $r gt.eq 4$, there is a constant $c_r > 0$ such that every finite simple $K_r$-free graph $G$ with $n$ vertices and average degree $d gt.eq 2$ satisfies 
$ alpha \( G \) gt.eq c_r frac(n log d, d) . $

]
] <thm:main>

The constant is uniform in both the number of vertices and the average degree. The theorem gives a positive answer to the fixed-clique-size independence conjecture of Ajtai, Erdős, Komlós and Szemerédi, also recorded as Erdős Problem 802. The order $n log d \/ d$ is best possible up to a constant factor even for triangle-free graphs, and hence for the larger class of $K_r$-free graphs #cite(label("AEKS1981")) pp. 314–315. We do not optimize the constant $c_r$.

=== 1.1 History and related results <history-and-related-results>

Ajtai, Komlós and Szemerédi #cite(label("AKS1980")) proved the logarithmic improvement when triangles are excluded. Shearer #cite(label("Shearer1983")) subsequently obtained the asymptotic coefficient $1$: triangle-free graphs of average degree $d arrow.r oo$ have independent sets of size at least $\( 1 - o \( 1 \) \) n log d \/ d$. In 1981, Ajtai, Erdős, Komlós and Szemerédi conjectured the same order of growth for each fixed forbidden clique #cite(label("AEKS1981")) p. 314, Equation (3). They proved the lower bound $Omega_r \( n log log d \/ d \)$ as $d arrow.r oo$, so excluding any fixed clique already improves on the general bound. Shearer #cite(label("Shearer1995")) Corollary 2 improved this to $Omega_r \( n log d \/ \( d log log d \) \)$, again in terms of the average degree. Theorem 1 removes this remaining $log log d$ denominator.

Subsequent refinements describe more of the graph’s local structure. Dutta, Mubayi and Subramanian #cite(label("DMS2012")) give bounds involving the full degree sequence. Davies, Kang, Pirot and Sereni #cite(label("DKPS2020")) Theorem 30 and Corollary 31 develop a local-occupancy framework that improves constants and also gives coloring estimates. Dhawan #cite(label("DhawanLocallySparse2026")) Theorems 1.3 and 1.4 allows bounded numbers of cliques, either globally or inside neighborhoods. For a fixed forbidden clique, these estimates retain a $log log$ loss in the relevant degree parameter; they provide information beyond the uniform order sought in Theorem 1.

Several stronger local assumptions yield logarithmic bounds. Alon #cite(label("Alon1996")) Theorem 1.1 and the remark following its proof treated graphs whose neighborhoods have bounded chromatic number, obtaining an average-degree bound of the required order. His argument also admits bounded fractional chromatic number in each neighborhood. Davies #cite(label("Davies2026")) Theorems 1 and 3 establishes weighted local versions: he bounds individual vertex inclusion probabilities in a random independent set under bounded neighborhood maximum average degree or fractional chromatic number. For every fixed three-colorable forbidden graph, Dhawan, Janzer and Methuku #cite(label("DJM2025")) Theorems 1.4 and 1.6 prove $\( 1 - o \( 1 \) \) n log d \/ d$ as $d arrow.r oo$, uniformly in $n$. This attains leading coefficient $1$ in that restricted class. Neither bounded neighborhood fractional chromatic number nor exclusion of a fixed three-colorable graph covers all ordinary $K_r$-free graphs for $r gt.eq 4$. For the latter restriction, complete tripartite graphs illustrate the difference: they are $K_4$-free and contain every fixed three-colorable graph once their parts are large enough.

For comparison, let $r \( s \, t \)$ be the least integer $N$ such that every $N$-vertex graph contains a $K_s$ or an independent set of size $t$. The fixed off-diagonal Ramsey estimates in #cite(label("RamseyFive")) Theorem 1.1 and #cite(label("RamseyFixed")) Theorem 1.1 determine logarithmic exponents for $r \( 5 \, t \)$ and, respectively, for $r \( s \, t \)$ with each fixed $s gt.eq 6$. Together they state

$ r \( s \, t \) = frac(t^(s - 1), \( log t \)^(s - 2 + o \( 1 \))) #h(2em) upright("for each fixed ") s gt.eq 5 . $

These are estimates for extremal graph orders as $t arrow.r oo$. Theorem 1 controls every input graph using its own average degree, including graphs whose degree is small relative to their order. Neither companion is an input to the proof. In particular, the weighted triangle theorem used here is proved from its own cross-mass hypothesis.

=== 1.2 The proof in outline <the-proof-in-outline>

The proof uses positive vertex weights. For such a vector $w$, write $w \( S \) = sum_(v in S) w_v$, and define its edge and triangle masses by

$ M_G \( w \) = sum_({ u \, v } in E \( G \)) w_u w_v \, #h(2em) T_G \( w \) = sum_({ u \, v \, z } upright(" a triangle")) w_u w_v w_z . $

Both sums are over unordered sets. The central step is to show that $T_G \( w \)$ is at most a constant depending only on $r$ times $M_G \( w \)$ when $w$ maximizes, over nonnegative vertex weights,

$ F_G \( w \) = sum_v w_v \( 1 - log w_v \) - M_G \( w \) . $

The zero-coordinate convention is $0 log 0 = 0$. Three stages establish the theorem.

+ #emph[Extract a bound that survives changes to the graph.] Section 2 chooses a maximizing weight and uses random multipliers of mean one to control the directed edge mass between any two vertex sets. The multiplier construction is recursive on the excluded clique size. Section 3 shows that this cross-mass bound survives edge deletion and splitting a vertex into copies carrying its original weight, provided each original edge is retained at most once.
+ #emph[Reduce weighted neighborhoods without losing many triangles.] Sections 4 and 5 prove a triangle bound for every weighted graph with that cross-mass property. At each reduction step, we first delete edges whose common neighborhoods have small weight, charging the lost triangle mass to their edge mass. For each vertex $u$, walks inside $N \( u \)$ assign a probability distribution on $N \( u \)$ to each starting vertex $v in N \( u \)$. The cross-mass bound limits the average entropy growth of these walks. At a suitable common time, the distributions started at $v$ and $z$ are close on average over ordered triangles $\( u \, v \, z \)$, weighted by $w_u w_v w_z$.
  Sampling these distributions together groups the incident edges at $u$; close distributions usually give the same group to the two edges of a triangle. A cutoff on reversed transition probabilities bounds each group’s total neighbor weight; the entropy and density bounds, together with reversibility, control the average triangle mass discarded by the cutoff. Splitting vertices according to the resulting groups reduces the largest neighborhood weight from $e^x$ to $e^(sqrt(x))$. The losses are summable through all iterations. Once every neighborhood has bounded weight, triangle mass is directly bounded by edge mass.
+ #emph[Choose independent vertices at controlled cost.] For a graph with maximum degree at most $Delta gt.eq 3$, evaluating $F_G$ at the constant weight $\( log Delta \) \/ Delta$ gives an extremal value at least a constant multiple of $n \( log Delta \)^2 \/ Delta$. When we delete a closed neighborhood and retain the old maximizing weights elsewhere, edges between the chosen vertex’s neighbors contribute to the cost. Averaging over the chosen vertex with probabilities proportional to its weight counts these edges as triangles. Section 6 uses the triangle bound to find a vertex whose closed-neighborhood deletion reduces this value by at most $D_r log Delta$. Selecting such a vertex and repeating on the remaining graph gives an independent set of size at least a constant multiple of $n log Delta \/ Delta$. The same degree bound $Delta$ is kept throughout this induction. Deleting the original graph’s high-degree vertices then yields the average-degree bound in Theorem 1.

The weighted triangle theorem is a separate statement about cross masses; it has no clique hypothesis. Preservation of the cross-mass bound under vertex splitting permits repeated reduction without requiring the new weights to remain maximizers. The entropy estimate controls only averages over a specified triangle distribution, and the splitting argument uses exactly those averages. Every threshold in these two steps depends only on the cross-mass constant. The proof gives an existence result with an $r$-dependent constant; it makes no claim of an efficient algorithm or an optimal leading constant.

== 2 An extremal weight and its cross-mass bound <sec:optimizer>

We first choose vertex weights for which a variational inequality controls the mass of edges between two sets. Clique exclusion enters through a random modification that keeps every weight unchanged in expectation while making the expected edge mass small.

For a finite simple graph $G$ and a real vector $a = \( a_v \)_(v in V \( G \))$, put

$ M_G \( a \) = sum_({ u \, v } in E \( G \)) a_u a_v . $

Thus this quadratic expression is defined even when some coordinates are negative. For nonnegative weights $w$, write $w \( S \) = sum_(v in S) w_v$ and

$ e_w \( S \, D \) = sum_(u in S) sum_(v in D ∩ N_G \( u \)) w_u w_v . $

This is a directed cross mass: an edge with both ends in $S ∩ D$ is counted twice. All logarithms are natural, and $0 log 0 = 0$.

=== 2.1 The extremal weight <the-extremal-weight>

The functional below is the unit-parameter specialization of the entropy-minus-edge potential used by Davies #cite(label("Davies2026")) Section 3.3, proof of Theorem 17. We give its elementary maximizing properties here.

Define

$ F_G \( w \) = sum_(v in V \( G \)) w_v \( 1 - log w_v \) - M_G \( w \) \, #h(2em) F_G^(*) = max_(w gt.eq 0) F_G \( w \) . $

The maximum in this definition exists, as the following lemma shows.

#thm([Lemma 2.1.])[
  #emph[For every nonempty finite simple graph $G$, the function $F_G$ attains its maximum. Every maximizer $w$ has positive coordinates and satisfies 
$ log \( 1 \/ w_v \) = w \( N_G \( v \) \) #h(2em) \( v in V \( G \) \) . quad "(2.1)" $ <eq:stationarity>

 In particular, $w_v lt.eq 1$. For every nonnegative vector $q$, 
$ 0 lt.eq F_G \( w \) - F_G \( q \) = sum_v (q_v log q_v / w_v - q_v + w_v) + M_G \( q - w \) . quad "(2.2)" $ <eq:optimizer-divergence>

 Here a term with $q_v = 0$ in the sum equals $w_v$.]
] <lem:optimizer>

#proof[
  The continuous function $f \( t \) = t \( 1 - log t \)$ on $\[ 0 \, oo \)$ is at most $1$ and tends to $- oo$ as $t arrow.r oo$. Since $M_G \( w \) gt.eq 0$ for $w gt.eq 0$,
  $ F_G \( w \) lt.eq f \( parallel w parallel_oo \) + \| V \( G \) \| - 1 . $
  Consequently $F_G \( w \) arrow.r - oo$ as $parallel w parallel_oo arrow.r oo$, so continuity gives a maximum. If a maximizer had $w_v = 0$, changing just this coordinate to $t > 0$ would increase $F_G$ by
  $ t #scale(x: 120%, y: 120%)[\(] 1 - log t - w \( N_G \( v \) \) #scale(x: 120%, y: 120%)[\)] > 0 $
  for sufficiently small $t$. All coordinates are therefore positive, and the first derivative in each coordinate gives (2.1). To obtain (2.2), expand the quadratic expression $M_G \( q \)$ around $w$. Its linear term is $sum_v \( q_v - w_v \) w \( N_G \( v \) \)$, which cancels the corresponding term using (2.1). The inequality follows from maximality. ◻
]

For the empty graph on no vertices we set $F_G^(*) = 0$; no positive-coordinate assertion is needed in that case.

=== 2.2 Random multipliers with small expected edge mass <random-multipliers-with-small-expected-edge-mass>

The recursive use of clique-free neighborhoods goes back to the sparse-subgraph argument of Ajtai, Erdős, Komlós and Szemerédi #cite(label("AEKS1981")) Section 3. Here the recursion preserves each vertex weight in expectation. The next lemma applies to arbitrary positive weights and does not require the maximizing equations.

The construction successively removes neighborhoods from the remaining induced graph, until every remaining vertex has small neighborhood weight. Each removed part excludes a smaller clique, and the remainder has small edge mass. We then retain one part at random and divide its weights by that part’s selection probability. Every vertex keeps its original expected weight, while edges joining different parts disappear. Within a selected neighborhood, the same construction is applied recursively. The multiplier bound below measures the cost of these successive rescalings.

#thm([Lemma 2.2.])[
  #emph[Let $r gt.eq 2$ be an integer, let $G$ be a finite $K_r$-free graph with positive vertex weights $w$, and put $s = w \( V \( G \) \)$. For every $0 < epsilon lt.eq 1 \/ 2$ there are jointly distributed random variables $\( m_v \)_(v in V \( G \))$ such that 
$ 0 lt.eq m_v lt.eq b_r \( epsilon \) := 2^(r \( r - 2 \)) epsilon^(- \( r - 2 \)) \, #h(2em) bb(E) m_v = 1 \, #h(2em) bb(E) M_G \( \( w_v m_v \)_v \) lt.eq epsilon s^2 . quad "(2.3)" $ <eq:sparse-multipliers>

 Their joint distribution can be taken to have finite support.]
] <lem:sparse-multipliers>

#proof[
  The empty graph on no vertices is immediate. We induct on $r$, starting with $r = 2$, when there are no edges and $m_v = 1$ suffices. Suppose $r gt.eq 3$ and set $eta = epsilon \/ 4$.
  Starting with all vertices, repeatedly choose a vertex whose open neighborhood in the remaining induced graph has weight greater than $eta s$, and remove that neighborhood as a set $V_i$. These disjoint sets have weights $s_i = w \( V_i \) > eta s$, and each $G \[ V_i \]$ is $K_(r - 1)$-free. Indeed, a $\( r - 1 \)$-clique in such a neighborhood together with its chosen vertex would form a $K_r$. When the procedure stops, the remaining set $R$ satisfies
  $ M_(G \[ R \]) \( w \) = 1 / 2 sum_(v in R) w_v w \( N_G \( v \) ∩ R \) lt.eq 1 / 2 eta s thin w \( R \) lt.eq 1 / 2 eta s^2 . quad "(2.4)" $ <eq:remainder-mass>
  If no sets $V_i$ were removed, take every $m_v = 1$. Otherwise put $b = sum_i s_i > 0$ and $p_i = s_i \/ \( 2 b \)$. Choose $R$ with probability $1 \/ 2$ and $V_i$ with probability $p_i$, putting all multipliers outside the chosen set equal to zero. On choosing $R$, set $m_v = 2$ for $v in R$. On choosing $V_i$, use the induction hypothesis there with precision $epsilon \/ 4$, and multiply its output by $1 \/ p_i$. The option of choosing $R$ is retained even if $R$ is empty; in that event all multipliers are zero.
  Every vertex has mean multiplier one. Since $p_i > eta \/ 2 = epsilon \/ 8$, each multiplier is at most
  $ max {2 \, 8 / epsilon b_(r - 1) \( epsilon \/ 4 \)} = b_r \( epsilon \) . $
  The equality follows directly from the displayed formula for $b_r$. Only edges within the chosen set contribute. Therefore
  $ bb(E) M_G \( \( w_v m_v \)_v \) & lt.eq 2 M_(G \[ R \]) \( w \) + sum_i frac(epsilon s_i^2, 4 p_i)\
 & lt.eq eta s^2 + epsilon / 2 b^2 lt.eq 3 / 4 epsilon s^2 . $
  The finite construction and the induction hypothesis also give finite support for the joint law. ◻
]

=== 2.3 The cross-mass estimate <the-cross-mass-estimate>

For $x gt.eq 1$, define

$ g_x \( s \) = cases(delim: "{", s #scale(x: 120%, y: 120%)[\(] x + log^(+) \( 1 \/ s \) #scale(x: 120%, y: 120%)[\)] \, & s > 0 \,, 0 \, & s = 0 \,) #h(2em) log^(+) a = max { 0 \, log a } . $

The function $g_x$ is nondecreasing on $\[ 0 \, oo \)$. On $\( 0 \, 1 \)$ its derivative is $x + log \( 1 \/ s \) - 1 gt.eq 0$, and on $\( 1 \, oo \)$ it is $x$; the formulas agree continuously at $s = 1$ and $s = 0$.

#thm([Lemma 2.3.])[
  #emph[Let $r gt.eq 2$ be an integer and let $w$ maximize $F_G$ on a nonempty finite $K_r$-free graph $G$. For every $x gt.eq 1$ and all vertex sets $S \, D$ with $w \( S \) \, w \( D \) lt.eq e^x$, 
$ e_w \( S \, D \) lt.eq C_r g_x \( w \( S \) \) \, #h(2em) C_r = 16 r^2 . quad "(2.5)" $ <eq:optimizer-cross-mass>

 The sets $S$ and $D$ need not be disjoint.]
] <lem:cross-mass>

#proof[
  First suppose $S ∩ D = diameter$, and put $s = w \( S \)$ and $t = w \( D \)$. The case $s = 0$ is immediate. Initially assume $e^(- x) lt.eq s lt.eq e^x$. We will increase the weights on $S$ and set those on $D$ to zero. In the variational identity, this creates a negative quadratic term proportional to $e_w \( S \, D \)$. The random multipliers keep the positive quadratic term within $S$ small, while their bounded range controls the vertex terms through a logarithm. Apply Lemma 3 to $G \[ S \]$ with $epsilon = e^(- 8 x)$, and set $k = e^(4 x)$. Define a nonnegative random vector by
  $ q_v = cases(delim: "{", \( 1 + k m_v \) w_v \, & v in S \,, 0 \, & v in D \,, w_v \, & v in.not S union D .) $
  The expected quadratic term in (2.2) is at most
  $ bb(E) M_G \( q - w \) lt.eq k^2 epsilon s^2 + 1 / 2 t^2 - k e_w \( S \, D \) . quad "(2.6)" $ <eq:cross-quadratic>
  Here the last term uses $bb(E) m_v = 1$; no independence between the multipliers is required. The choice $k^2 epsilon = 1$ keeps the first term controlled despite the increase in the weights on $S$.
  For $y gt.eq 0$, $\( 1 + y \) log \( 1 + y \) - y lt.eq y log \( 1 + y \)$. Also
  $ log \( 1 + k b_r \( e^(- 8 x) \) \) lt.eq A_r x \, #h(2em) A_r = 4 + 8 \( r - 2 \) + \( 1 + r \( r - 2 \) \) log 2 . $
  It follows that the expected sum of vertex terms in (2.2) is at most $t + k A_r x s$. Combining this with (2.6) and dividing by $k$ gives
  $ e_w \( S \, D \) & lt.eq A_r x s + e^(- 4 x) s^2 + e^(- 4 x) \( t + t^2 \/ 2 \)\
 & lt.eq \( A_r + 3 \) x s . $
  For the last inequality, use $s \, t lt.eq e^x$ and $s gt.eq e^(- x)$: the three error terms divided by $s$ are at most $e^(- 3 x)$, $e^(- 2 x)$, and $e^(- x) \/ 2$, respectively, and their sum is at most $3 x$.
  If instead $0 < s < e^(- x)$, apply the estimate just proved with $x' = log \( 1 \/ s \) > x$. Both set weights are at most $e^(x')$ and $s = e^(- x')$, so
  $ e_w \( S \, D \) lt.eq \( A_r + 3 \) x' s lt.eq \( A_r + 3 \) g_x \( s \) . $
  Thus the bound with constant $A_r + 3$ holds for all disjoint sets.
  For arbitrary $S \, D$, assign each vertex independently to one of two classes with equal probabilities. Let $S'$ be the part of $S$ in the first class and $D'$ the part of $D$ in the second. These sets are disjoint, their weights satisfy the same upper bounds, and
  $ bb(E) e_w \( S' \, D' \) = 1 / 4 e_w \( S \, D \) . $
  There are no loops, so each directed edge in this expectation has two distinct endpoints. The disjoint-set bound and monotonicity give
  $ 1 / 4 e_w \( S \, D \) lt.eq \( A_r + 3 \) bb(E) g_x \( w \( S' \) \) lt.eq \( A_r + 3 \) g_x \( s \) . $
  Finally, $A_r + 3 lt.eq r^2 + 6 r - 8 lt.eq 4 r^2$ for $r gt.eq 2$, which proves (2.5). ◻
]

Lemma 4 is the only consequence of extremality needed in the weighted triangle argument. That argument can therefore be formulated for any positive weighted graph satisfying (2.5) with some constant $C$.

== 3 From cross mass to triangle mass <sec:triangle>

The triangle argument will replace vertices by copies carrying their full original weights. Total vertex weight can therefore increase. The rule that makes this operation useful is that each original edge is retained at most once. We show that this rule preserves the cross-mass bound and controls edge and triangle masses, so the subsequent argument can proceed without maximizing weights anew.

Retain the notation $M_G \( w \)$, $T_G \( w \)$, $e_w \( A \, B \)$ and $g_x$ from the preceding sections. We write $e_(G \, w)$ when the graph must be specified. We say that $\( G \, w \)$ satisfies the cross-mass bound with constant $C$ if, for every $x gt.eq 1$ and every $A \, B subset.eq V \( G \)$,

$ w \( A \) \, w \( B \) lt.eq e^x quad arrow.r.double quad e_(G \, w) \( A \, B \) lt.eq C g_x \( w \( A \) \) . quad "(3.1)" $ <eq:cross-mass>

#thm([Theorem 3.1.])[
  (Triangle mass from cross mass).  #emph[For every $C gt.eq 1$ there is a constant $C_triangle.stroked.t \( C \)$ with the following property. If $G$ is a finite simple graph with positive vertex weights $w$ satisfying (3.1), then 
$ T_G \( w \) lt.eq C_triangle.stroked.t \( C \) M_G \( w \) . $

]
] <thm:weighted-triangles>

We will repeatedly split vertices so as to reduce neighborhood weights, while retaining a fixed proportion of triangle weight. The cross-mass bound is the information that passes from one step to the next. We first verify this preservation and record the effect of deleting edges whose common-neighbor weight is small. The proof of Theorem 5 concludes after the splitting construction and its iteration.

=== 3.1 Preservation and triangle counting <preservation-and-triangle-counting>

#thm([Lemma 3.2.])[
  (Preservation under splitting).  #emph[Let $\( G \, w \)$ satisfy (3.1) with constant $C$. Let $H$ be a finite simple graph and let $pi : V \( H \) arrow.r V \( G \)$ satisfy the following conditions:]
  + #emph[every edge ${ a \, b }$ of $H$ maps to the edge ${ pi \( a \) \, pi \( b \) }$ of $G$;]
  + #emph[the map $\( a \, b \) mapsto \( pi \( a \) \, pi \( b \) \)$ is injective on directed edges of $H$.]
  #emph[Give each $a in V \( H \)$ the weight $tilde(w)_a = w_(pi \( a \))$. Then $\( H \, tilde(w) \)$ satisfies (3.1) with the same constant $C$. Moreover, 
$ M_H \( tilde(w) \) lt.eq M_G \( w \) \, #h(2em) T_H \( tilde(w) \) lt.eq T_G \( w \) \,\
tilde(w) \( N_H \( a \) \) lt.eq w \( N_G \( pi \( a \) \) \) quad upright("for every ") a in V \( H \) . $

 These conclusions are preserved under any finite composition of such maps.]
] <lem:invariant-preservation>

#proof[
  For $A \, B subset.eq V \( H \)$, write $A_0 = pi \( A \)$ and $B_0 = pi \( B \)$. Duplicating vertices can increase their total weight, so
  $ w \( A_0 \) lt.eq tilde(w) \( A \) \, #h(2em) w \( B_0 \) lt.eq tilde(w) \( B \) . $
  The directed edges counted by $e_(H \, tilde(w)) \( A \, B \)$ map injectively to directed edges counted by $e_(G \, w) \( A_0 \, B_0 \)$, with their weights unchanged. Consequently, if $tilde(w) \( A \) \, tilde(w) \( B \) lt.eq e^x$, then
  $ e_(H \, tilde(w)) \( A \, B \) lt.eq e_(G \, w) \( A_0 \, B_0 \) lt.eq C g_x \( w \( A_0 \) \) lt.eq C g_x \( tilde(w) \( A \) \) . $
  This also covers overlapping sets and the case of an empty set.
  The directed-edge condition implies injectivity on unordered edges: two edges with the same unordered image could be oriented to have the same directed image. It therefore gives the assertion about $M$. For a fixed $a$, two different neighbors $b \, b'$ cannot have the same image, since the directed edges $\( a \, b \)$ and $\( a \, b' \)$ would then have the same image. Thus $pi$ maps $N_H \( a \)$ injectively into $N_G \( pi \( a \) \)$, giving the neighborhood bound.
  Every triangle of $H$ maps to a triangle of $G$, since a homomorphism to a simple graph is injective on the vertices of a clique. Distinct triangles cannot have the same image: each of the three image edges has at most one preimage edge, and those three preimage edges determine the triangle. Triangle weights are unchanged, proving the assertion about $T$. Finally, compositions preserve vertex weights, adjacency and injectivity on directed edges. ◻
]

Edge deletion and vertex deletion are special cases of Lemma 6, using the inclusion map. The splitting operation used below is another special case: replace a vertex $u$ by copies indexed by groups of its incident edges, give every copy weight $w_u$, and retain each original edge at most once, between its assigned endpoint copies. No assumption about optimization is required after these operations.

#thm([Lemma 3.3.])[
  (Triangle normalization and peeling).  #emph[For a positive-weighted finite simple graph $G$, put 
$ s_u = w \( N_G \( u \) \) \, #h(2em) c_(u v) = w \( N_G \( u \) ∩ N_G \( v \) \) \, #h(2em) h_u = sum_(v in N_G \( u \)) w_v c_(u v) . $

 Thus $h_u = 2 M_(G \[ N_G \( u \) \]) \( w \)$ is twice the edge mass inside the neighborhood of $u$. Then 
$ sum_({ u \, v } in E \( G \)) w_u w_v c_(u v) = 3 T_G \( w \) \, #h(2em) sum_(u in V \( G \)) w_u h_u = 6 T_G \( w \) . quad "(3.2)" $ <eq:triangle-normalizations>

 In particular, if every neighborhood has weight at most $L$, then 
$ T_G \( w \) lt.eq L / 3 M_G \( w \) . quad "(3.3)" $ <eq:terminal-triangle-bound>

]
  #emph[For every $tau > 0$, there is a spanning subgraph $G'$ obtained by successive edge deletions such that every edge of $G'$ has common-neighbor weight at least $tau$ and 
$ T_(G') \( w \) gt.eq T_G \( w \) - tau M_G \( w \) . quad "(3.4)" $ <eq:peeling-loss>

 For each nonisolated vertex of $G'$, its neighborhood and common-neighbor weights, computed in $G'$, satisfy 
$ s_u gt.eq tau \, #h(2em) h_u gt.eq tau s_u . $

 If $G$ satisfies (3.1), then so does $G'$, with the same constant.]
] <lem:triangle-peeling>

#proof[
  Each triangle contributes its weight once for each of its three edges to the first sum in (3.2), and once for each of its six oriented edges to the second. Since $c_(u v) lt.eq L$, the first identity also proves (3.3).
  Starting with $G$, delete any edge whose common-neighbor weight in the current graph is less than $tau$, and continue until no such edge remains. The procedure terminates because $G$ is finite. If ${ u_i \, v_i }$ is the $i$th deleted edge and $c_i$ its common-neighbor weight immediately before deletion, the triangle weight lost at that step is exactly $w_(u_i) w_(v_i) c_i$. Telescoping gives
  $ T_G \( w \) - T_(G') \( w \) = sum_i w_(u_i) w_(v_i) c_i lt.eq tau sum_i w_(u_i) w_(v_i) lt.eq tau M_G \( w \) . $
  This counts each destroyed triangle at its first deleted edge. The defining stopping rule gives $c_(u v) gt.eq tau$ on every remaining edge. If $u$ is nonisolated, choose a remaining neighbor $v$ to obtain $s_u gt.eq c_(u v) gt.eq tau$; summing $w_v c_(u v) gt.eq tau w_v$ over the remaining neighbors gives $h_u gt.eq tau s_u$. The last assertion follows from Lemma 6. ◻
]

== 4 Local walks and entropy <sec:entropy>

We construct probability distributions on each neighborhood so that rows indexed by the other two vertices of a triangle are close on average, with the average weighted by triangle mass. We obtain the rows by running a weighted random walk. The cross-mass estimate bounds the average entropy by showing that most starting rows, in this weighted average, put almost all their probability on sets of small weight inside their neighborhoods. The resulting estimate is independent of the number of vertices. The use of entropy increments to control averaged distances between walk distributions has a precedent in Benjamini, Duminil-Copin, Kozma and Yadin #cite(label("BDKY2015")) Section 2. We prove the finite weighted version needed here, using the cross-mass hypothesis to bound its entropy.

Let $G$ be a finite simple graph with positive weights satisfying (3.1) with constant $C gt.eq 1$. Fix $x gt.eq 32$ and suppose further that $G$ has an edge and

$ s_u := w \( N \( u \) \) lt.eq e^x quad upright("for every ") u \, #h(2em) c_(u v) := w \( N \( u \) ∩ N \( v \) \) gt.eq x^(- 1) quad \( u v in E \( G \) \) . quad "(4.1)" $ <eq:walk-hypotheses>

Put

$ h_u = sum_(v in N \( u \)) w_v c_(u v) $

for every vertex $u$, with the empty sum equal to zero. We use kernels only at non-isolated vertices. At such a vertex $u$, set

$ pi_u \( v \) = frac(w_v c_(u v), h_u) quad \( v in N \( u \) \) . $

These quantities are positive, and

$ s_u gt.eq x^(- 1) \, #h(2em) h_u gt.eq s_u \/ x . quad "(4.2)" $ <eq:walk-lower-bounds>

On the finite set $N \( u \)$ define stochastic matrices

$ P_u \( v \, z \) = frac(w_z upright(bold(1))_({ v z in E \( G \) }), c_(u v)) \, #h(2em) Q_u = frac(I + P_u, 2) \, #h(2em) K_u^j = P_u Q_u^j quad \( j gt.eq 0 \) . quad "(4.3)" $ <eq:walk-kernels>

Thus $P_u$ is the weighted random walk on the induced graph $G \[ N \( u \) \]$, and $Q_u$ adds probability $1 \/ 2$ of staying at the current vertex. The row $K_u^j \( v \, dot.op \)$ is the law after one $P_u$-step from $v$ followed by $j$ such lazy steps. The initial step gives $P_u \( v \, y \) lt.eq x w_y$; we will show that subsequent steps preserve this density bound. The holding probability will let us compare rows started at adjacent vertices through an entropy increment. The superscript in $K_u^j$ indexes this family, rather than denoting a power of a fixed kernel. We shall choose one index $j$ for all neighborhoods.

Here are the probability laws used in the argument. Put

$ Z = sum_u w_u h_u = 6 T_G \( w \) > 0 \, #h(2em) mu \( u \, v \) = frac(w_u w_v c_(u v), Z) quad \( u v in E \( G \) \) \, $

where both orientations of each edge occur in the sum defining $Z$. The conditional distribution of $v$ given $u$ under $mu$ is $pi_u$. If, after sampling $\( u \, v \)$ from $mu$, we sample $z$ from $P_u \( v \, dot.op \)$, then

$ bb(P) \( u \, v \, z \) = frac(w_u w_v w_z, Z) quad upright("for each ordered triangle ") \( u \, v \, z \) . quad "(4.4)" $ <eq:ordered-triangle-law>

We call this the ordered triangle law.

For a probability vector $a$ supported on vertices with positive weights, write

$ cal(H)_w \( a \) = sum_(y : a \( y \) > 0) a \( y \) log frac(w_y, a \( y \)) \, #h(2em) H_j = bb(E)_(\( u \, v \) tilde.op mu) cal(H)_w \( K_u^j \( v \, dot.op \) \) . $

Thus $H_j$ is an average of row entropies relative to the vertex weights; the weights themselves need not sum to one. For probability vectors $a \, b$ on the same finite set, write

$ parallel a - b parallel_(upright("TV")) = 1 / 2 sum_y \| a \( y \) - b \( y \) \| . $

The neighborhood bound $s_u lt.eq e^x$ alone allows row entropy as large as $x$. The next lemma improves the averaged upper bound to $O_C \( log x \)$ over $ceil.l x ceil.r$ steps. Since the entropy increments are nonnegative, some step has small averaged increment; this will give the required comparison under the ordered triangle law.

#thm([Lemma 4.1.])[
  (Smoothing the local walks).  #emph[Under (3.1) and (4.1), put 
$ E_C = 42 C^2 + 2 C \, #h(2em) A_C = 10 + E_C \, #h(2em) B_C = 2 sqrt(A_C + 1) \, #h(2em) R = ceil.l x ceil.r . $

 Each $K_u^j$ is reversible with stationary measure $pi_u$, and 
$ K_u^j \( v \, y \) lt.eq x w_y #h(2em) \( j gt.eq 0 \) . quad "(4.5)" $ <eq:walk-density>

 Moreover, 
$ - log x lt.eq H_0 lt.eq H_1 lt.eq dots.h.c lt.eq H_R lt.eq A_C log x . quad "(4.6)" $ <eq:entropy-upper>

 There exists $j in { 0 \, dots.h \, R - 1 }$ such that, under the ordered triangle law, 
$ bb(E) parallel K_u^j \( v \, dot.op \) - K_u^j \( z \, dot.op \) #scale(x: 120%, y: 120%)[parallel]_(upright("TV")) lt.eq B_C sqrt(frac(log x, x)) . quad "(4.7)" $ <eq:triangle-row-distance>

]
] <lem:entropy-smoothing>

#proof[
  We first check the kernels and then bound the entropy they can acquire. Detailed balance follows from
  $ pi_u \( v \) P_u \( v \, z \) = frac(w_v w_z upright(bold(1))_({ v z in E \( G \) }), h_u) = pi_u \( z \) P_u \( z \, v \) . $
  Thus $P_u$ is reversible and stationary for $pi_u$. Its powers, and hence $Q_u$ and $K_u^j$, have the same properties. No irreducibility assumption is needed. By $c_(u v) gt.eq x^(- 1)$, every row of $P_u$ satisfies $P_u \( v \, y \) lt.eq x w_y$. Since $P_u$ and $Q_u$ commute,
  $ K_u^j \( v \, y \) = sum_z Q_u^j \( v \, z \) P_u \( z \, y \) lt.eq x w_y \, $
  which proves (4.5). In particular, $H_j gt.eq - log x$.
  ===== 4.1 Sets that contain most of the walk. <sets-that-contain-most-of-the-walk.>
  Write $L = e^x$. For each fixed non-isolated starting vertex $v$, we build sets in the whole graph that contain almost all of the walk for every center $u in N \( v \)$ simultaneously. Using the same set for all these centers will allow a cross-mass estimate to control its intersections with their neighborhoods. Define
  $ S_0 \( v \) = N \( v \) \, #h(2em) S_(i + 1) \( v \) = S_i \( v \) union { y : w \( N \( y \) ∩ S_i \( v \) \) gt.eq x^(- 6) \/ L } . $
  We suppress the argument $v$ while it is fixed. Double counting gives
  $ sum_y w_y w \( N \( y \) ∩ S_i \) = sum_(z in S_i) w_z s_z lt.eq L w \( S_i \) . $
  Consequently
  $ w \( S_(i + 1) \) lt.eq \( 1 + L^2 x^6 \) w \( S_i \) \, #h(2em) w \( S_R \) lt.eq e^x \( 1 + e^(2 x) x^6 \)^R lt.eq e^(20 x^2) . $
  For the last inequality, $x gt.eq 32$ implies $6 log x lt.eq x$, $log \( 1 + e^(2 x) x^6 \) lt.eq 4 x$, and $R lt.eq 2 x$.
  For every edge $u v$ and $0 lt.eq i lt.eq R$, we claim that
  $ K_u^i \( v \, N \( u \) \\ S_i \( v \) \) lt.eq i x^(- 4) . quad "(4.8)" $ <eq:walk-leakage>
  The claim holds at $i = 0$, since $P_u \( v \, dot.op \)$ is supported on $N \( v \)$. In the step from $i$ to $i + 1$, mass already outside $S_i$ contributes at most $i x^(- 4)$. If $z in S_i$ and $y in.not S_(i + 1)$, then $y eq.not z$, so $Q_u \( z \, y \) lt.eq x w_y upright(bold(1))_({ z y in E \( G \) })$. By (4.5), the additional mass reaching such a $y in N \( u \)$ is at most
  $ sum_(z in N \( u \) ∩ S_i ∩ N \( y \)) x w_z thin x w_y lt.eq x^(- 4) w_y \/ L . $
  Summing over $y in N \( u \)$ contributes at most $x^(- 4)$, proving the claim.
  ===== 4.2 Most neighborhoods meet these sets in small weight. <most-neighborhoods-meet-these-sets-in-small-weight.>
  The global set $S_R \( v \)$ has weight at most $e^(20 x^2)$. We now show that its intersection with $N \( u \)$ has weight at most $x^8$ for most pairs $\( u \, v \)$ under $mu$. For fixed $v$ let
  $ B_v = { u in N \( v \) : w \( N \( u \) ∩ S_R \( v \) \) > x^8 } . $
  The first use of (3.1), with parameter $20 x^2$, gives
  $ x^8 w \( B_v \) lt.eq e_w \( N \( v \) \, S_R \( v \) \) lt.eq C s_v \( 20 x^2 + log^(+) \( 1 \/ s_v \) \) lt.eq 21 C x^2 s_v \, $
  where $s_v gt.eq x^(- 1)$ was used in the final inequality. Thus $w \( B_v \) lt.eq 21 C x^(- 6) s_v$.
  This weight estimate must be converted to the conditional law of $u$ given $v$, which is not normalized vertex weight. The symmetry of $mu$ gives the exact formula
  $ bb(P)_mu \( u in B_v divides v \) = frac(sum_(u in B_v) w_u c_(u v), h_v) = frac(e_w \( B_v \, N \( v \) \), h_v) . $
  The second use of (3.1), now with parameter $x$, applies because $B_v subset.eq N \( v \)$ and $s_v lt.eq e^x$. The function $g_x$ is nondecreasing on $\[ 0 \, oo \)$, and therefore, for $b gt.eq 0$,
  $ g_x \( b \) lt.eq 2 x max { b \, e^(- x) } . $
  Using $h_v gt.eq s_v \/ x$ and $s_v gt.eq x^(- 1)$, we obtain
  $ bb(P)_mu \( u in B_v divides v \) & lt.eq frac(2 C x^2, s_v) #scale(x: 120%, y: 120%)[\(] w \( B_v \) + e^(- x) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq 42 C^2 x^(- 4) + 2 C x^3 e^(- x) lt.eq E_C x^(- 4) . quad "(4.9)" $ <eq:exceptional-pair-probability>
  Here $e^(- x) lt.eq x^(- 7)$ for $x gt.eq 32$.
  We can now bound $H_R$. A probability vector $a$ supported on a set $D$ of total weight $m > 0$ satisfies
  $ cal(H)_w \( a \) lt.eq log m . quad "(4.10)" $ <eq:weighted-entropy-support>
  Indeed, normalize the weights on $D$ and use nonnegativity of relative entropy. If $u in.not B_v$, the set $D = N \( u \) ∩ S_R \( v \)$ has weight at most $x^8$, and (4.8) shows that $K_u^R \( v \, D \) = 1 - delta$ with $0 lt.eq delta lt.eq R x^(- 4) < 1$. Condition the row on $D$ and its complement. Formula (4.10) and the binary entropy bound then give
  $ cal(H)_w \( K_u^R \( v \, dot.op \) \) lt.eq log 2 + 8 log x + delta x . $
  An empty complement, or zero probability on the complement, simply contributes zero. On pairs with $u in B_v$, use the unconditional bound $cal(H)_w \( K_u^R \( v \, dot.op \) \) lt.eq log s_u lt.eq x$. Averaging and applying (4.9) yields
  $ H_R lt.eq log 2 + 8 log x + R x^(- 3) + E_C x^(- 3) lt.eq \( 10 + E_C \) log x = A_C log x . $
  ===== 4.3 A small entropy increment gives close rows. <a-small-entropy-increment-gives-close-rows.>
  For probability vectors $a \, b$, let
  $ D \( a parallel b \) = sum_(y : a \( y \) > 0) a \( y \) log frac(a \( y \), b \( y \)) $
  denote relative entropy, interpreted as $+ oo$ if necessary. Sample $\( u \, v \)$ from $mu$ and then $z$ from $Q_u \( v \, dot.op \)$. Since $Q_u K_u^j = K_u^(j + 1)$, the mixture of $K_u^j \( z \, dot.op \)$ over this conditional choice of $z$ is $K_u^(j + 1) \( v \, dot.op \)$. Consequently, for fixed $u \, v$,
  $ bb(E)_(z tilde.op Q_u \( v \, dot.op \)) D #scale(x: 120%, y: 120%)[\(] K_u^j \( z \, dot.op \) parallel K_u^(j + 1) \( v \, dot.op \) #scale(x: 120%, y: 120%)[\)] = cal(H)_w \( K_u^(j + 1) \( v \, dot.op \) \) - bb(E)_(z tilde.op Q_u \( v \, dot.op \)) cal(H)_w \( K_u^j \( z \, dot.op \) \) . $
  All these divergences are finite on events of positive probability, because the second argument is the mixture containing the first. Conditional on $u$, the law of $v$ is $pi_u$, which is stationary for $Q_u$. After averaging over $v$ and then $u$, the preceding identity becomes
  $ H_(j + 1) - H_j = bb(E)_(mu Q) D #scale(x: 120%, y: 120%)[\(] K_u^j \( z \, dot.op \) parallel K_u^(j + 1) \( v \, dot.op \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . quad "(4.11)" $ <eq:entropy-increment>
  The stationarity step is an averaged identity; it asserts no equality between individual rows. Telescoping the increments gives an index $0 lt.eq j < R$ for which
  $ H_(j + 1) - H_j lt.eq frac(\( A_C + 1 \) log x, R) lt.eq frac(\( A_C + 1 \) log x, x) . $
  For completeness, $parallel a - b parallel_(upright("TV")) lt.eq sqrt(D \( a parallel b \))$ follows from
  $ D \( a parallel b \) gt.eq - 2 log sum_y sqrt(a \( y \) b \( y \)) gt.eq sum_y \( sqrt(a \( y \)) - sqrt(b \( y \)) \)^2 $
  and Cauchy–Schwarz. Therefore (4.11) and Jensen’s inequality imply
  $ bb(E)_(mu Q) parallel K_u^j \( z \, dot.op \) - K_u^(j + 1) \( v \, dot.op \) #scale(x: 120%, y: 120%)[parallel]_(upright("TV")) lt.eq sqrt(H_(j + 1) - H_j) . $
  To pass to the ordered triangle law, put $a_v = K_u^j \( v \, dot.op \)$ and $b_v = K_u^(j + 1) \( v \, dot.op \)$ within each fixed neighborhood. The triangle inequality and $Q_u = \( I + P_u \) \/ 2$ give exactly
  $ bb(E)_(mu P) parallel a_v - a_z parallel_(upright("TV")) & lt.eq bb(E)_mu parallel a_v - b_v parallel_(upright("TV")) + bb(E)_(mu P) parallel a_z - b_v parallel_(upright("TV"))\
 & = 2 bb(E)_(mu Q) parallel a_z - b_v parallel_(upright("TV")) . $
  Combining the last two bounds proves (4.7) with $B_C = 2 sqrt(A_C + 1)$. ◻
]

== 5 Splitting vertices and bounding triangle mass <sec:splitting>

The local walks give similar probability distributions to the two neighbors at a corner of a triangle, on average under the ordered triangle law. We now sample from these distributions jointly. Equal samples keep the two incident edges of a triangle at the same copy of a vertex. A condition on the reversed transition probability ensures that each copy has a small weighted neighborhood.

=== 5.1 Sampling all rows together <sampling-all-rows-together>

We use the shared rejection construction of Kleinberg and Tardos #cite(label("KleinbergTardos2002")) Section 3, Lemmas 3.1 and 3.2. Angel and Spinka #cite(label("AngelSpinka2021")) Theorem 2 and Section 2.1 give the sharper pairwise disagreement estimate stated below. The short proof supplies the joint law for all rows at once.

#thm([Lemma 5.1.])[
  (Shared rejection sampling).  #emph[Let $I$ and $J$ be finite nonempty sets, and let $\( p_i \)_(i in I)$ be probability distributions on $J$. There are jointly distributed random variables $\( Y_i \)_(i in I)$ such that $Y_i$ has law $p_i$ and, for every $i \, i' in I$, 
$ bb(P) \( Y_i eq.not Y_(i') \) lt.eq frac(2 parallel p_i - p_(i') parallel_(upright("TV")), 1 + parallel p_i - p_(i') parallel_(upright("TV"))) lt.eq 2 parallel p_i - p_(i') parallel_(upright("TV")) . $

 The resulting joint law has finite support.]
] <lem:shared-rejection>

#proof[
  Write $m = \| J \|$. Take independent trials $\( Z_t \, U_t \)_(t gt.eq 1)$, with $Z_t$ uniform on $J$ and $U_t$ uniform on $\[ 0 \, 1 \]$. For each $i$, let $Y_i = Z_t$ at the first trial satisfying $U_t lt.eq p_i \( Z_t \)$. A trial is accepted by row $i$ with probability $1 \/ m$, and its accepted value has law $p_i$. More explicitly, for $y in J$,
  $ bb(P) \( Y_i = y \) = sum_(t gt.eq 1) \( 1 - 1 \/ m \)^(t - 1) frac(p_i \( y \), m) = p_i \( y \) . $
  Every row stops almost surely; since $I$ is finite, all rows stop after a finite number of trials almost surely.
  Fix two rows $p \, q$, and put $d = parallel p - q parallel_(upright("TV"))$. At the first trial accepted by either row, the probability that both accept is
  $ frac(sum_(y in J) min \( p \( y \) \, q \( y \) \), sum_(y in J) max \( p \( y \) \, q \( y \) \)) = frac(1 - d, 1 + d) . $
  On this event their labels agree. They may also agree otherwise, so the disagreement probability is at most $2 d \/ \( 1 + d \)$. Finally, the label vector takes values in the finite set $J^I$, so its induced law has finite support. The infinite sequence of trials is only a convenient construction of that finite joint law. ◻
]

=== 5.2 Admissible labels and vertex splitting <admissible-labels-and-vertex-splitting>

Let $H$ be a finite graph with positive vertex weights. Assume that every edge $u v$ has common-neighbor weight $c_(u v) gt.eq 1 \/ x$, that every neighborhood has weight at most $e^x$, and that $H$ satisfies the cross-mass condition (3.1) with constant $C gt.eq 1$. Here $x gt.eq 32$. If $H$ has an edge, then it has a triangle; throughout this subsection suppose $T_H \( w \) > 0$.

Use the integer $j$ supplied by Lemma 8, and for each non-isolated vertex $u$ write $K_u = K_u^j$ for the corresponding kernel on $N_H \( u \)$. Isolated vertices may be discarded, since they contribute neither edge nor triangle mass. The directed-edge probability measure is

$ mu \( u \, v \) = frac(w_u w_v c_(u v), 6 T_H \( w \)) . $

Conditional on $u$, its second coordinate has distribution $pi_u \( v \) = w_v c_(u v) \/ h_u$, and $K_u$ is reversible for $pi_u$. We use the constants from that lemma:

$ A_C = 10 + 42 C^2 + 2 C \, #h(2em) B_C = 2 sqrt(A_C + 1) . $

In particular, $K_u \( v \, y \) lt.eq x w_y$, the averaged row entropy is at most $A_C log x$, and the average total variation distance between the rows indexed by the other two vertices of a weighted ordered triangle is at most $B_C sqrt(log x \/ x)$.

For each non-isolated $u$, apply Lemma 9 to all rows of $K_u$. Denote the label assigned to $v in N_H \( u \)$ by $Y_(u \, v)$. These finite joint laws may be sampled independently for different vertices $u$. We will group the neighbors of $u$ according to their labels, while keeping the total weight of each group at most $e^(sqrt(x))$. For this purpose, call a label $y$ at the incidence $\( u \, v \)$ #emph[admissible] if

$ K_u \( y \, v \) gt.eq w_v e^(- sqrt(x)) . quad "(5.1)" $ <eq:admissible-label>

For a fixed outcome of the labels, define

$ A_(u \, y) = { v in N_H \( u \) : Y_(u \, v) = y upright(" and ") K_u \( y \, v \) gt.eq w_v e^(- sqrt(x)) } . $

The reversed transition in (5.1) is chosen so that all vertices in one group can be compared with a single probability row:

$ w \( A_(u \, y) \) lt.eq e^(sqrt(x)) sum_(v in A_(u \, y)) K_u \( y \, v \) lt.eq e^(sqrt(x)) . quad "(5.2)" $ <eq:label-group-weight>

This holds for every outcome of the labels. The next lemma shows that the admissibility requirement rejects only a small fraction of incidences under the triangle distribution.

#thm([Lemma 5.2.])[
  #emph[The probability that $Y_(u \, v)$ is inadmissible, averaged over $\( u \, v \) tilde.op mu$, is at most 
$ delta_x := frac(\( A_C + 1 \) log x, sqrt(x) + log x) . quad "(5.3)" $ <eq:inadmissibility-bound>

]
] <lem:reverse-admissibility>

#proof[
  Under the joint law $\( u \, v \) tilde.op mu$, $y tilde.op K_u \( v \, dot.op \)$, reversibility gives
  $ \( u \, v \, y \) med =^(upright("law")) med \( u \, y \, v \) . $
  Both $K_u \( v \, y \)$ and $K_u \( y \, v \)$ are positive on this law’s support: all $pi_u$ are positive and $pi_u \( v \) K_u \( v \, y \) = pi_u \( y \) K_u \( y \, v \)$. Consequently
  $ ell := log frac(w_v, K_u \( y \, v \)) quad upright("satisfies") quad bb(E) ell = H_j lt.eq A_C log x . $
  The density bound applied to the reversed row gives $ell gt.eq - log x$. Inadmissibility is precisely the event $ell > sqrt(x)$. Applying Markov’s inequality to the nonnegative random variable $ell + log x$ proves (5.3). No bound on an individual row’s entropy is needed here. ◻
]

We now turn the groups into a graph, for each fixed outcome of the labels. Make one vertex $\( u \, y \)$ of weight $w_u$ for each nonempty group. For each edge $u v$ of $H$ whose two incidence labels are admissible, put an edge between $\( u \, Y_(u \, v) \)$ and $\( v \, Y_(v \, u) \)$. Call the resulting graph $H'$. Figure 1 shows the construction at one vertex. We take the maximum neighborhood weight of the empty graph to be zero.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.15, 2.22), [Before splitting])
  content((7.35, 2.22), [After splitting])
  line((0, 0), (2.55, 1.55), stroke: (paint: rgb("#225c8c"), thickness: 0.9pt))
  line((0, 0), (2.55, 0.55), stroke: (paint: rgb("#225c8c"), thickness: 0.9pt))
  line((0, 0), (2.55, -0.55), stroke: (paint: rgb("#a66818"), thickness: 0.9pt))
  line((0, 0), (2.55, -1.55), stroke: (paint: rgb("#a66818"), thickness: 0.9pt))
  line((2.55, 0.55), (2.55, 1.55), stroke: (thickness: 0.6pt))
  circle((0, 0), radius: 0.05, fill: rgb("#ffffff"))
  content((-0.17, 0), [$u$#linebreak()$w_u$], anchor: "east")
  circle((2.55, 1.55), radius: 0.05, fill: rgb("#ffffff"))
  circle((2.55, 0.55), radius: 0.05, fill: rgb("#ffffff"))
  circle((2.55, -0.55), radius: 0.05, fill: rgb("#ffffff"))
  circle((2.55, -1.55), radius: 0.05, fill: rgb("#ffffff"))
  line((3.55, 0), (4.8, 0), stroke: (thickness: 0.65pt))
  content((4.17, 0.48), [split by#linebreak()label])
  line((6.15, 1.05), (8.7, 1.55), stroke: (paint: rgb("#225c8c"), thickness: 0.9pt))
  line((6.15, 1.05), (8.7, 0.55), stroke: (paint: rgb("#225c8c"), thickness: 0.9pt))
  line((6.15, -1.05), (8.7, -0.55), stroke: (paint: rgb("#a66818"), thickness: 0.9pt))
  line((6.15, -1.05), (8.7, -1.55), stroke: (paint: rgb("#a66818"), thickness: 0.9pt))
  line((8.7, 0.55), (8.7, 1.55), stroke: (thickness: 0.6pt))
  circle((6.15, 1.05), radius: 0.05, fill: rgb("#ffffff"))
  content((5.96, 1.05), [$(u,y)$#linebreak()$w_u$], anchor: "east")
  circle((6.15, -1.05), radius: 0.05, fill: rgb("#ffffff"))
  content((5.96, -1.05), [$(u,z)$#linebreak()$w_u$], anchor: "east")
  circle((8.7, 1.55), radius: 0.05, fill: rgb("#ffffff"))
  circle((8.7, 0.55), radius: 0.05, fill: rgb("#ffffff"))
  circle((8.7, -0.55), radius: 0.05, fill: rgb("#ffffff"))
  circle((8.7, -1.55), radius: 0.05, fill: rgb("#ffffff"))
  line((0.45, -2.12), (0.9, -2.12), stroke: (paint: rgb("#225c8c"), thickness: 0.9pt))
  content((0.99, -2.12), [label $y$ at $u$], anchor: "west")
  line((5.75, -2.12), (6.2, -2.12), stroke: (paint: rgb("#a66818"), thickness: 0.9pt))
  content((6.29, -2.12), [label $z$ at $u$], anchor: "west")
})],
  caption: [Figure 1: Local view of splitting by admissible labels. The incidences $u v_1 \, u v_2$ receive label $y$, and $u v_3 \, u v_4$ receive label $z$. Each copy of $u$ has weight $w_u$. The remote endpoints are also split: $v'_i$ denotes the copy selected by the incidence $v_i u$. The displayed triangle survives because its two incidences agree at each of its three corners, with all labels admissible. Each retained edge is placed once, between its selected copies. ],
) <fig:label-splitting>

#thm([Lemma 5.3.])[
  #emph[There is a choice of these labels for which the projection $\( u \, y \) mapsto u$ preserves weights, maps directed edges injectively to directed edges of $H$, and satisfies 
$ max_(a in V \( H' \)) w \( N_(H') \( a \) \) & lt.eq e^(sqrt(x)) \,\
T_(H') \( w \) & gt.eq \( 1 - a_C log x \/ sqrt(x) \) T_H \( w \) \, quad "(5.4)" $ <eq:split-neighborhood>

 where $a_C = 6 \( B_C + A_C + 1 \)$.]
] <lem:weighted-splitting>

#proof[
  Every old edge creates at most one new edge. The projection therefore maps directed edges injectively, and the new graph has neither loops nor multiple edges. At a fixed vertex $\( u \, y \)$, different neighbors project to different vertices of $H$, because $H$ is simple and each edge $u v$ was used at most once. By (5.2),
  $ w \( N_(H') \( u \, y \) \) lt.eq w \( A_(u \, y) \) lt.eq e^(sqrt(x)) . $
  In particular, duplicating a vertex does not duplicate any of its incident edges at one fixed copy.
  An old triangle ${ u \, v \, z }$ survives whenever its two labels agree at each corner and all six incidence labels are admissible. These conditions are also necessary for its three edges to form a triangle in $H'$. A triangle of $H'$ projects to three distinct old vertices, and hence to an old triangle. Moreover, there is at most one triangle over each old triangle, since each old edge has at most one preimage. The weights of a surviving triangle are unchanged.
  Sample an ordered triangle $\( u \, v \, z \)$ with probability $w_u w_v w_z \/ \( 6 T_H \( w \) \)$. Its ordered-edge marginal is $mu$. At the corner $u$, the shared coupling and the row-distance estimate give
  $ bb(E) thin bb(P) \( Y_(u \, v) eq.not Y_(u \, z) \) lt.eq 2 B_C sqrt(frac(log x, x)) . $
  Each of the other two corners has the same bound, by the permutation symmetry of the ordered-triangle law. Each of its six directed incidences has marginal $mu$, so Lemma 10 bounds the average inadmissibility probability of each by $delta_x$. A union bound, with no independence assumption between these events, therefore gives
  $ frac(bb(E) \( T_H \( w \) - T_(H') \( w \) \), T_H \( w \)) lt.eq 6 B_C sqrt(frac(log x, x)) + 6 delta_x lt.eq a_C frac(log x, sqrt(x)) . $
  The last inequality uses $log x gt.eq 1$. All label vectors together have finite support. At least one of them has triangle mass at least its expectation, proving the claim. ◻
]

=== 5.3 Reduction and iteration <reduction-and-iteration>

The preceding construction turns the walk estimates into a reduction of weighted neighborhoods. Choose $X = X \( C \) gt.eq 32$ so large that

$ 2 a_C frac(log X, sqrt(X)) lt.eq 1 / 2 . quad "(5.5)" $ <eq:iteration-threshold>

Such a choice depends only on $C$.

#thm([Proposition 5.4.])[
  #emph[Let $G$ be a finite positive-vertex-weighted graph satisfying the cross-mass condition (3.1) with constant $C gt.eq 1$, and suppose that $max_v w \( N_G \( v \) \) lt.eq e^x$ for some $x > X \( C \)$. There is a finite positive-vertex-weighted graph $G'$ with a weight-preserving map to $G$ that is injective on directed edges, such that 
$ max_v w \( N_(G') \( v \) \) & lt.eq e^(sqrt(x)) \,\
T_(G') \( w \) & gt.eq (1 - a_C frac(log x, sqrt(x))) T_G \( w \) - frac(M_G \( w \), x) . quad "(5.6)" $ <eq:step-neighborhood>

 It also satisfies the same cross-mass condition, and $M_(G') \( w \) lt.eq M_G \( w \)$.]
] <prop:neighborhood-reduction>

#proof[
  Peel edges whose current common-neighbor weight is less than $1 \/ x$. If $H$ is the remaining graph, Lemma 7 gives
  $ T_H \( w \) gt.eq T_G \( w \) - M_G \( w \) \/ x . $
  Edge deletion does not increase any weighted neighborhood, and it preserves the cross-mass condition. If $H$ has no edges, take $G'$ to be empty. Then $T_G \( w \) lt.eq M_G \( w \) \/ x$, which implies (5.6). Otherwise, apply Lemma 11 to $H$. Since $x mapsto log x \/ sqrt(x)$ is decreasing for $x gt.eq e^2$, (5.5) ensures $0 lt.eq 1 - a_C log x \/ sqrt(x) lt.eq 1$. Hence
  $ T_(G') \( w \) & gt.eq (1 - a_C frac(log x, sqrt(x))) (T_G \( w \) - frac(M_G \( w \), x))\
 & gt.eq (1 - a_C frac(log x, sqrt(x))) T_G \( w \) - frac(M_G \( w \), x) . $
  The projection through $H$ is still injective on directed edges. The edge-mass bound and inherited cross-mass condition follow from Lemma 6. ◻
]

#proof[
  If $G$ has no edges, both sides vanish. Otherwise choose $x_0 gt.eq 1$ such that every neighborhood has weight at most $e^(x_0)$. While $x_i > X$, apply Proposition 12 and set $x_(i + 1) = sqrt(x_i)$. Write $G_i$ for the successive graphs, $T_i = T_(G_i) \( w \)$ and $M_i = M_(G_i) \( w \)$; the weights at each stage are the inherited weights of its vertex copies. Stop after $k$ steps, when $x_k lt.eq X$. The procedure is finite, and the $k = 0$ case is allowed.
  We record bounds independent of $x_0$ and $k$. If $k > 0$, put $y = x_(k - 1) > X$. The used parameters, in reverse order, are $y \, y^2 \, y^4 \, dots.h \, y^(2^(k - 1))$. For $f \( t \) = log t \/ sqrt(t)$ and $t gt.eq X gt.eq 32$,
  $ frac(f \( t^2 \), f \( t \)) = 2 / sqrt(t) lt.eq 1 / 2 . $
  As $f$ is decreasing on $\[ X \, oo \)$, it follows that
  $ sum_(i < k) a_C f \( x_i \) lt.eq 2 a_C f \( X \) lt.eq 1 / 2 \, #h(2em) sum_(i < k) 1 / x_i lt.eq frac(1 \/ X, 1 - 1 \/ X) lt.eq 1 . quad "(5.7)" $ <eq:summable-losses>
  Both inequalities also hold for empty sums when $k = 0$.
  Let $epsilon_i = a_C f \( x_i \)$. Iterating (5.6), using $M_i lt.eq M_0$ and $0 lt.eq 1 - epsilon_i lt.eq 1$, gives
  $ T_k gt.eq (product_(i < k) \( 1 - epsilon_i \)) T_0 - M_0 sum_(i < k) 1 / x_i gt.eq 1 / 2 T_0 - M_0 . $
  Here $product \( 1 - epsilon_i \) gt.eq 1 - sum epsilon_i$. Every neighborhood of $G_k$ has weight at most $e^X$, so
  $ 3 T_k = sum_({ u \, v } in E \( G_k \)) w_u w_v w \( N_(G_k) \( u \) ∩ N_(G_k) \( v \) \) lt.eq e^X M_k lt.eq e^X M_0 . $
  Combining the last two displays proves the theorem with $C_triangle.stroked.t \( C \) = 2 \( 1 + e^(X \( C \)) \/ 3 \)$. All thresholds and constants depend only on $C$; neither the number of vertices nor the initial neighborhood bound enters them. ◻
]

Applying Theorem 5 to the cross-mass bound of Lemma 4 gives the variational estimate needed for the independent-set argument: for every maximizer $w$ on a finite $K_r$-free graph,

$ T_G \( w \) lt.eq B_r M_G \( w \) \, #h(2em) B_r = C_triangle.stroked.t \( 16 r^2 \) . quad "(5.8)" $ <eq:optimizer-triangle>

The zero-vertex case has both masses zero.

== 6 From triangle mass to independent sets <sec:closure>

We now use the triangle estimate to choose independent vertices at a controlled cost in $F_G^(*)$. For an $n$-vertex $K_r$-free graph of maximum degree at most $Delta gt.eq 3$, a constant test weight gives $F_G^(*)$ at least a constant multiple of $n \( log Delta \)^2 \/ Delta$. The triangle estimate will provide a vertex whose closed-neighborhood deletion costs at most a constant times $log Delta$. Induction compares these two bounds and gives the required independent set. We keep $Delta$ fixed throughout the induction, then pass to average degree by deleting high-degree vertices. Let $B_r gt.eq 0$ be the constant in (5.8), and set

$ D_r = 3 + 3 / 2 B_r . quad "(6.1)" $ <eq:independence-constant>

#thm([Proposition 6.1.])[
  #emph[For every integer $r gt.eq 4$, every real number $Delta gt.eq 3$, and every finite $K_r$-free graph $G$ with $n$ vertices and maximum degree at most $Delta$, 
$ alpha \( G \) gt.eq frac(F_G^(*), D_r log Delta) #h(2em) upright("and") #h(2em) alpha \( G \) gt.eq frac(n log Delta, 4 D_r Delta) . $

]
] <prop:maximum-degree>

#proof[
  Fix $Delta gt.eq 3$. We prove the first inequality by induction on $n$. For the empty graph both sides are zero. Suppose $n > 0$, let $w$ maximize $F_G$, and write $W = sum_v w_v$. By Lemma 2, $0 < w_v lt.eq 1$.
  For a vertex $v$, put $A_v = { v } union N \( v \)$ and let $G - A_v$ denote the induced graph on the remaining vertices. Set $q = 0$ on $A_v$ and $q = w$ elsewhere. The variational identity for $F_G \( w \) - F_G \( q \)$ gives the exact deletion cost
  $ F_G^(*) - F_(G - A_v) \( w \|_(V \( G \) \\ A_v) \) = w \( A_v \) + M_(G \[ A_v \]) \( w \) . quad "(6.2)" $ <eq:closed-neighborhood-cost>
  Indeed, the vertex divergence is $w \( A_v \)$, and the quadratic term $M_G \( q - w \)$ is $M_(G \[ A_v \]) \( w \)$.
  Average this cost over $v$ with probability $w_v \/ W$. An edge $a b$ lies in $G \[ A_v \]$ precisely when $v = a$, $v = b$, or $v$ is a common neighbor of $a$ and $b$. Hence
  $ sum_v w_v / W #scale(x: 120%, y: 120%)[\(] w \( A_v \) + M_(G \[ A_v \]) \( w \) #scale(x: 120%, y: 120%)[\)] & = frac(sum_v w_v^2 + 2 M_G \( w \) + sum_v w_v^2 w \( N \( v \) \) + 3 T_G \( w \), W)\
 & lt.eq 1 + \( 4 + 3 B_r \) frac(M_G \( w \), W) . quad "(6.3)" $ <eq:averaged-deletion-cost>
  Here $w_v lt.eq 1$ gives $sum_v w_v^2 lt.eq W$ and $sum_v w_v^2 w \( N \( v \) \) lt.eq 2 M_G \( w \)$; we then used the triangle bound (5.8).
  It remains to bound $2 M_G \( w \) \/ W$ by $log Delta$. First, stationarity and Jensen’s inequality for $- log$ give
  $ log n / W lt.eq 1 / n sum_v log 1 / w_v = 1 / n sum_v w \( N \( v \) \) = 1 / n sum_v deg_G \( v \) w_v lt.eq frac(Delta W, n) . quad "(6.4)" $ <eq:optimizer-total-weight>
  If $W \/ n < 1 \/ Delta$, then the left side exceeds $log Delta > 1$ and the right side is less than $1$, a contradiction. Therefore $W gt.eq n \/ Delta$. Applying the concavity of $log$ with probabilities $w_v \/ W$ now gives
  $ frac(2 M_G \( w \), W) = sum_v w_v / W log 1 / w_v lt.eq log (sum_v w_v / W 1 / w_v) = log n / W lt.eq log Delta . quad "(6.5)" $ <eq:optimizer-edge-weight>
  Thus the average in (6.3) is at most
  $ 1 + (2 + 3 / 2 B_r) log Delta lt.eq D_r log Delta \, $
  where we used $log Delta gt.eq 1$.
  Choose a vertex whose cost is at most the average. Since the restriction of $w$ is a feasible weight vector for $G - A_v$,
  $ F_(G - A_v)^(*) gt.eq F_G^(*) - D_r log Delta . $
  The graph $G - A_v$ is $K_r$-free and still has maximum degree at most the same number $Delta$. The induction hypothesis, followed by adjoining $v$ to an independent set of $G - A_v$, yields
  $ alpha \( G \) gt.eq 1 + alpha \( G - A_v \) gt.eq 1 + frac(F_(G - A_v)^(*), D_r log Delta) gt.eq frac(F_G^(*), D_r log Delta) . $
  For the second inequality, test $F_G$ on the constant vector with entry $p = \( log Delta \) \/ Delta$. Since $\| E \( G \) \| lt.eq n Delta \/ 2$,
  $ F_G^(*) gt.eq n p (1 - log p - frac(Delta p, 2)) = n p (1 + 1 / 2 log Delta - log log Delta) gt.eq frac(n p log Delta, 4) . $
  The last inequality holds for every $Delta > 1$: the function $1 + t \/ 4 - log t$ on $t > 0$ has minimum $2 - log 4 > 0$ at $t = 4$. Combining this bound with the first inequality proves the result. ◻
]

#proof[
  Let $G$ have $n$ vertices and average degree $d gt.eq 2$. Delete the vertices whose degrees in $G$ exceed $2 d$, and let $H$ be the induced graph on the remaining vertices. Fewer than $n \/ 2$ vertices are deleted, since the sum of all degrees is $n d$. Thus $\| V \( H \) \| gt.eq n \/ 2$, and $H$ is $K_r$-free with maximum degree at most the real number $2 d$. Proposition 13 gives
  $ alpha \( G \) gt.eq alpha \( H \) gt.eq frac(\| V \( H \) \| log \( 2 d \), 8 D_r d) gt.eq frac(n log d, 16 D_r d) . $
  We may therefore take $c_r = 1 \/ \( 16 D_r \)$. All constants used in obtaining $B_r$, and consequently $D_r$ and $c_r$, depend only on $r$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
