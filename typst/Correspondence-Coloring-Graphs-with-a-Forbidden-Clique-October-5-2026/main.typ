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

#align(center)[#text(size: 16pt, weight: "bold")[Correspondence coloring graphs with a forbidden clique]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

All graphs in this paper are finite, simple, and undirected. A #emph[correspondence assignment] on a graph $G$ consists of pairwise disjoint finite sets $L \( v \)$, one for each vertex, and a matching $M_(u v) subset.eq L \( u \) times L \( v \)$ for each edge $u v$. A coloring of the assignment chooses $c \( v \) in L \( v \)$ at every vertex so that $\( c \( u \) \, c \( v \) \) in.not M_(u v)$ for every edge $u v$. The matchings need not agree with one another around cycles. The #emph[correspondence chromatic number], also called the #emph[DP-chromatic number], $chi_(upright("DP")) \( G \)$, is the least integer $k$ for which every correspondence assignment with $\| L \( v \) \| gt.eq k$ admits a coloring.

This notion includes list coloring: replace each color in each list by a distinct copy, and match copies of the same color along an edge. Ordinary coloring is obtained by giving every vertex the same list before taking these copies. Thus

$ chi \( G \) lt.eq chi_(upright("list")) \( G \) lt.eq chi_(upright("DP")) \( G \) lt.eq Delta \( G \) + 1 \, $

where the last inequality follows by greedy coloring. We prove a logarithmic improvement when the clique number is bounded.

#thm([Theorem 1.1.])[
  #emph[For every integer $r gt.eq 4$ there are constants $C_r > 0$ and $Delta_r gt.eq 3$ such that every $K_r$-free graph $G$ of maximum degree $Delta gt.eq Delta_r$ satisfies 
$ chi_(upright("DP")) \( G \) lt.eq ⌈C_r frac(Delta, log Delta)⌉ . $

 The constants depend only on $r$.]
] <thm:main>

In particular, the estimate is uniform in the number of vertices, the sizes of the lists, and the edge matchings. Throughout the paper, all logarithms are natural. We do not optimize the constant or the degree threshold.

For a fixed finite graph $F$, call $G$ #emph[$F$-free] if it contains no subgraph isomorphic to $F$; the subgraph need not be induced.

#thm([Corollary 1.2.])[
  #emph[For every finite graph $F$ there are constants $C_F > 0$ and $Delta_F gt.eq 3$ such that every $F$-free graph $G$ of maximum degree $Delta gt.eq Delta_F$ satisfies 
$ chi_(upright("DP")) \( G \) lt.eq ⌈C_F frac(Delta, log Delta)⌉ . $

]
] <cor:forbidden>

#proof[
  Set $r = max { 4 \, \| V \( F \) \| }$. Since $K_r$ contains $F$ as a subgraph, every $F$-free graph is $K_r$-free. Apply Theorem 1. ◻
]

The ordinary-coloring version of Corollary 2 is Conjecture 3.1 of Alon, Krivelevich, and Sudakov [2]. The corollary therefore proves that conjecture in the stronger correspondence-coloring form. If $F$ contains a cycle, the order $Delta \/ log Delta$ cannot be improved in general: graphs with girth larger than $\| V \( F \) \|$ can have maximum degree at most $Delta$ and chromatic number of this order [10]; see also the proof of [2] Proposition 1.2.

=== 1.1 Historical context <historical-context>

List coloring was introduced independently by Vizing [26] and by Erdős, Rubin, and Taylor [15]. Dvořák and Postle introduced correspondence coloring in their 2015 preprint, published as [13], to allow the identification of colors to vary from edge to edge. This flexibility was central to their application to list coloring planar graphs. An arbitrary correspondence assignment need not admit globally consistent color names, so a list-coloring argument that uses independence across such names requires additional work.

An early step toward logarithmic coloring bounds imposed a stronger restriction on short cycles. Kim [19] proved $chi_(upright("list")) \( G \) lt.eq \( 1 + o \( 1 \) \) Delta \/ log Delta$ for graphs of girth at least five. Johansson subsequently obtained the list-coloring bounds $O \( Delta \/ log Delta \)$ for triangle-free graphs and $O_r \( Delta log log Delta \/ log Delta \)$ for $K_r$-free graphs. His triangle-free argument is presented by Molloy and Reed [21] Chapter 13; the extended version of Bansal, Gupta, and Guruganesh [6] Sections 6–9 develops his recursive probability modifications and entropy estimates. Molloy [20] Theorems 1 and 2 obtained the triangle-free list bound with leading constant $1 + o \( 1 \)$ and gave a new proof of the clique-free bound, with explicit dependence on $r$.

Bernshteyn [8] extended Johansson’s triangle-free bound to correspondence coloring, and later extended Molloy’s asymptotic triangle-free bound and the clique-free bound to that setting [9] Theorems 1.3 and 1.5. In particular, the previous general upper bound for fixed $r gt.eq 4$ was

$ chi_(upright("DP")) \( G \) = O_r #h(-0.16667em) (frac(Delta log log Delta, log Delta)) . $

Davies, Kang, Pirot, and Sereni [11] Theorem 30 developed a framework based on local occupancy in the hard-core model and improved the leading constants. Przybyło [23] Theorem 10 also obtained bounds under clique exclusion in the graph whose vertices are list entries and whose edges are forbidden pairs, while retaining the maximum degree of the underlying graph as the degree parameter. These results retain the $log log Delta$ factor for a general fixed forbidden clique.

Other families of forbidden subgraphs admit the sharper order. Alon, Krivelevich, and Sudakov [2] proved that a graph whose neighborhoods each span at most $Delta^2 \/ f$ edges, with $2 lt.eq f lt.eq Delta^2$, has chromatic number $O \( Delta \/ log f \)$. Vu [27] extended this local-sparsity bound to list coloring. Alon, Krivelevich, and Sudakov also deduced $O_F \( Delta \/ log Delta \)$ for every fixed almost bipartite forbidden graph $F$, meaning that deleting at most one vertex from $F$ leaves a bipartite graph. Anderson, Bernshteyn, and Dhawan [3,4] proved correspondence-coloring bounds with leading constants $1 + o \( 1 \)$ for bipartite forbidden graphs and $4 + o \( 1 \)$ for almost bipartite forbidden graphs. Their more general theorems assume that the graph of forbidden pairs excludes $F$ and use its maximum degree in place of $Delta \( G \)$.

More recently, Dhawan, Janzer, and Methuku [12] Theorems 1.4 and 1.5 proved $O_t \( Delta \/ log Delta \)$ for ordinary coloring of $K_(t \, t \, t)$-free graphs, and hence for every fixed three-colorable forbidden graph. They also obtained the independence bound $\( 1 - o \( 1 \) \) n log d \/ d$ in terms of the average degree $d$. Their coloring theorem concerns ordinary coloring; it does not supply a list or correspondence bound. Theorem 1 removes the $log log Delta$ factor for correspondence coloring with any fixed forbidden clique $K_r$, $r gt.eq 4$.

The structural part of our argument is related to the independence problem. Ajtai, Erdős, Komlós, and Szemerédi [1] asked for a lower bound of order $n log d \/ d$ for $K_r$-free graphs of average degree $d$. Shearer [24,25] obtained the asymptotic triangle-free bound and a clique-free bound with a $log log d$ loss. The companion manuscript #emph[A logarithmic independence bound for clique-free graphs] [22] proves the logarithmic bound and develops the weighted multipliers, neighborhood walks, and vertex splitting used here. The recursive use of clique-free neighborhoods has a precedent in [1] Section 3; entropy increments controlling distances between walk distributions have a precedent in [7] Section 2, Theorem 8. We adapt these ingredients to a local adjustment statement that also bounds how many entries from each list an operation affects. We establish the required weighted and dual estimates directly.

The remaining probabilistic ingredients also have established antecedents. We use the simultaneous coupling bound presented by Angel and Spinka [5], with its finite-state proof included. Concentration for sums in which each independent input affects only a bounded number of summands is the setting of Gavinsky, Lovett, Saks, and Srinivasan [17]. We derive the weighted form needed here from Finner’s generalized Hölder inequality [16] and Hoeffding’s exponential-moment bound [18]. The Lovász local lemma [14] then makes the local round estimates hold simultaneously.

=== 1.2 The proof and its main ingredients <the-proof-and-its-main-ingredients>

The proof constructs a partial coloring in small random rounds. At an uncolored vertex $v$, each available entry $i in L \( v \)$ carries a nonnegative weight $w_i$. Its total weight $W_v = sum_(i in L \( v \)) w_i$ must remain bounded below, while the individual weights remain small. These two conditions guarantee many available entries. The round colors enough neighbors to make the remaining degree decrease faster than this supply of entries.

Let $H$ be the graph whose vertices are the positive-weight entries and whose edges are the forbidden pairs in the matchings. The lists partition $V \( H \)$ into independent sets. Every vertex of $H$ has at most one neighbor in each part, and every clique of $H$ projects to a clique in $G$. Thus $H$ is $K_r$-free. This graph allows us to work directly with the correspondences, without identifying entries from different lists.

A round independently activates each entry with probability proportional to its weight. An activated entry can be chosen if none of its neighbors in $H$ activates. Choosing it removes all conflicting entries from the remaining lists. The potential controlling the loss of weight has three terms: an entropy relative to the initial weights, a linear penalty for lost total weight, and the incident edge mass

$ D_v = sum_(i in L \( v \)) sum_(j in N_H \( i \)) w_i w_j . $

The last term measures the amount of conflicting weight around $v$. Deleting newly colored neighbors decreases it and pays for the cost of the round.

===== 1.2.1 Triangles and local adjustments. <triangles-and-local-adjustments.>

An activation at a common neighbor of adjacent entries $i \, j$ removes both weights at once. Even after compensating their individual losses to first order, this shared deletion creates a positive edge correlation. Summed at an entry $i$, its cost is proportional to

$ t_i = w_i sum_(j in N_H \( i \)) w_j sum_(z in N_H \( i \) ∩ N_H \( j \)) w_z . $

This is twice the weighted mass of triangles through $i$. Lemma 3 supplies random local multiplications and deletions of weights whose combined contribution offsets $t_i$, up to a constant times the incident edge mass, simultaneously at all entries. The lemma also bounds the total rate of operations at each entry.

The structural argument develops the multiplier and entropy-splitting methods of the companion manuscript #emph[A logarithmic independence bound for clique-free graphs] [22] Sections 2–5. We prove all the ingredients needed here. Finite-dimensional separation tests the vertex inequalities and the rate bounds against arbitrary nonnegative prices. This reduces the adjustment problem to bounding the resulting priced triangle mass by a constant multiple of the priced edge mass, together with the allowance supplied by the rate bounds. Because vertex prices may vary widely, we group triangles by the dyadic size of their median price and rescale the weights within each level. The dual constraints then bound the weight of edges between nearby sets. Walks inside neighborhoods guide a splitting of vertices into copies, preserving most triangle weight while sharply reducing every neighborhood weight. Repetition leaves bounded neighborhood weights, where the triangle-to-edge comparison follows directly. The accumulated losses are controlled independently of the number of price levels.

===== 1.2.2 Controlling participation within each list. <controlling-participation-within-each-list.>

For correspondence coloring, a support of small graph radius may still contain many entries from one list. Radius alone therefore does not give the concentration needed for the coloring round. The adjustment lemma controls both quantities: each operation is supported in a ball, and it affects only a bounded number of entries in each part of the partition. When the neighborhood weight is $O \( log Delta \)$, both its multiplier bound and its participation bound are $Delta^(o \( 1 \))$.

The additional bound comes from the local sets used in the walk argument. A vertex is added to such a set only when it has a prescribed positive amount of neighbor weight in the preceding set. The one-neighbor-per-part property converts this admission threshold into a bound on the number of vertices added from each part. It survives splitting because the projection of the split graph is injective on directed edges. No lower bound on individual vertex weights is needed. This gives the adjustment lemma as a separate statement for partitioned weighted graphs, before its application to coloring.

===== 1.2.3 Concentration and completion. <concentration-and-completion.>

The trial uses independent flags for activations and adjustments. Different entry weights after the trial need not be independent. Instead, Lemma 12 controls sums of functions of independent inputs when each input is used by few summands. The participation bound applies directly to the total mass and the non-edge part of the potential at a list. We control the edge part by concentrating each matching sum separately.

Activations may collide across forbidden pairs. To show that these collisions cost little, we first bound the degree of their activated subgraph. Too many collision edges would then contain a large matching, whose endpoint activations are independent. This supplies the required tail estimate without a decomposition into globally named colors. The Lovász local lemma gives simultaneous progress at all vertices. Trimming extreme weights restores the assumptions for the next round. Once every remaining degree is smaller than the number of available entries, a greedy coloring completes the assignment.

Section 2 states the adjustment lemma and develops the dual local estimates. Section 3 proves the entropy and splitting estimates and completes that lemma. Section 4 constructs the random update, proves its expectation and concentration bounds, and restores the weight conditions after simultaneous progress. Section 5 iterates this round and completes Theorem 1.

=== 1.3 Conventions <conventions>

Neighborhoods are open; graph-distance balls include their centers. An edge or triangle has weight equal to the product of its vertex weights. Unless indicated otherwise, sums over edges and triangles are unordered. A graph homomorphism is #emph[injective on directed edges] if distinct ordered adjacent pairs have distinct images. It may identify vertices that do not occur in the same directed edge. Constants implicit in $O_r \( dot.op \)$ and sufficiently large thresholds may depend on $r$, but not on the graph, lists, or matchings. Auxiliary graphs may be empty.

== 2 Local weight adjustment with bounded participation <sec:adjustment>

The coloring argument requires local changes of weights that offset the contribution of triangles. Each change must also involve few entries from any one list. We formulate this requirement for a partition of a weighted graph, with constants independent of the graph and of the size of its parts.

Fix an integer $r gt.eq 4$. Let $H$ be a finite $K_r$-free graph with a partition $cal(D)$ of its vertex set such that

$ \| N_H \( i \) ∩ D \| lt.eq 1 #h(2em) \( i in V \( H \) \, med D in cal(D) \) . $

Give each vertex $i$ a positive weight $w_i$, and write

#[#set math.equation(numbering: n => "(2.1)")
 $ s_i = sum_(u in N_H \( i \)) w_u \, #h(2em) d_i = w_i s_i \, #h(2em) t_i = w_i sum_(u in N_H \( i \)) w_u sum_(z in N_H \( u \) ∩ N_H \( i \)) w_z . $ <eq:weighted-local-masses>]

Thus $d_i$ is the mass of edges incident to $i$, and $t_i$ is twice the mass of triangles containing $i$. Suppose that $s_i lt.eq Lambda$ for every $i$, where $Lambda gt.eq 1$. Define

$ f \( a \) = a log a - a + 1 quad \( a > 0 \) \, #h(2em) f \( 0 \) = 1 \, $

and put

#[#set math.equation(numbering: n => "(2.2)")
 $ ell_0 = log \( 8 Lambda \) \, #h(2em) R_0 = ceil.l 4 ell_0 ceil.r + 10 \, #h(2em) U = exp \( A ell_0^2 \) \, #h(2em) P_0 = ⌈exp \( 40 ell_0^2 \)⌉ \, $ <eq:adjustment-parameters>]

where $A = A \( r \) > 0$ will be chosen below.

A #emph[multiplier operation] consists of a nonempty listed support $J subset.eq V \( H \)$, contained in a ball of radius $R_0$ in $H$ and satisfying $\| J ∩ D \| lt.eq P_0$ for every $D in cal(D)$, together with multipliers $m_i in \[ 0 \, U \]$ for $i in J$. Extend $m_i = 1$ off $J$, and associate to the operation the vector

#[#set math.equation(numbering: n => "(2.3)")
 $ g_i = w_i f \( m_i \) + sum_(u in N_H \( i \)) w_i w_u \( m_i - 1 \) \( m_u - 1 \) . $ <eq:multiplier-vector>]

Multipliers equal to $1$ are permitted on $J$. A #emph[drop operation] at $i$ has listed support $J = { i }$ and vector

#[#set math.equation(numbering: n => "(2.4)")
 $ g_i = Lambda w_i - d_i \, #h(2em) g_u = - w_i w_u quad \( u in N_H \( i \) \) \, #h(2em) g_u = 0 quad \( u in.not N_H \( i \) union { i } \) . $ <eq:drop-vector>]

The listed support records the vertices on which the operation acts; a drop vector can have nonzero coordinates outside that support. It charges $Lambda w_i$ for losing weight at $i$ and subtracts its incident edge masses.

The two terms of (2.3) have a first-order interpretation. For fixed multipliers $m_i$ and small $rho > 0$, apply them on a common event of probability $rho$, and use $\( 1 - rho m_i \) \/ \( 1 - rho \)$ otherwise. Each weight then has unchanged expectation. The expected change of the entropy term $w_i log w_i - w_i$, with $0 log 0 = 0$, is $rho w_i f \( m_i \) + O \( rho^2 \)$, while the expected change on an edge $i u$ is $rho w_i w_u \( m_i - 1 \) \( m_u - 1 \) + O \( rho^2 \)$. In particular, events of probability $rho w_z$ that delete the weights on $N_H \( z \)$, with this compensation of their mean loss, contribute $rho d_i$ to the entropy change at $i$ and $rho t_i$ to its incident edge change, to first order. The following lemma supplies operations that offset the latter contribution simultaneously at all vertices.

#thm([Lemma 2.1.])[
  (Local weight adjustment).  #emph[For every integer $r gt.eq 4$ there are constants $A = A \( r \) > 0$, $B = B \( r \) gt.eq 1$, and $Lambda_r gt.eq 1$ with the following property. Let $Lambda gt.eq Lambda_r$, and let $H$ be a finite $K_r$-free graph whose vertex set has a partition $cal(D)$ such that each vertex has at most one neighbor in each part. For any positive vertex weights with $s_i lt.eq Lambda$, there is a finite family of the multiplier and drop operations defined above, with vectors $g^(\( j \))$, listed supports $J_j$, and rates $a_j gt.eq 0$, such that 
#[#set math.equation(numbering: n => "(2.5)")
 $ t_i + sum_j a_j g_i^(\( j \)) lt.eq B d_i \, #h(2em) sum_(j : thin i in J_j) a_j lt.eq Lambda^4 #h(2em) \( i in V \( H \) \) . $ <eq:adjustment>]

 The constants depend only on $r$.]
] <lem:adjustment>

Taking every part to be a singleton gives the same weight adjustment conclusion for an arbitrary positively weighted $K_r$-free graph, with no partition specified: the neighbor and support conditions on parts then hold automatically.

The proof occupies this section and Section 3. Nonnegative prices first reduce the simultaneous vertex inequalities to a scalar triangle estimate. We then derive a local edge estimate from the same prices. Section 3 uses that edge estimate to bound the triangles and finish the proof. If $H$ has no vertices, the lemma holds with no operations, so we assume otherwise throughout the reduction.

=== 2.1 Dual prices and dyadic levels <dual-prices-and-dyadic-levels>

A bound on total triangle mass would not guarantee the individual vertex inequalities in (2.5). To retain those constraints, assign prices $x_i gt.eq 0$ to the first inequalities in (2.5), and prices $w_i y_i gt.eq 0$ to the incidence budgets in the second inequalities. It suffices to prove that

#[#set math.equation(numbering: n => "(2.6)")
 $ sum_i x_i g_i + sum_(i in J) w_i y_i gt.eq 0 #h(2em) upright("for every allowed operation ") \( g \, J \) $ <eq:dual-test>]

implies

#[#set math.equation(numbering: n => "(2.7)")
 $ sum_i x_i t_i lt.eq B sum_i x_i d_i + Lambda^4 sum_i w_i y_i . $ <eq:dual-target>]

The support price in (2.6) includes every vertex of the listed support, even when its multiplier equals $1$.

To justify the reduction, let $n = \| V \( H \) \|$ and let $cal(C)$ be the cone in $bb(R)^(2 n)$ generated by the operation columns $\( g \, upright(bold(1))_J \)$ and the nonnegative orthant. These columns form a compact set: there are finitely many possible supports, each multiplier cube is compact, and $f$ is continuous on $\[ 0 \, U \]$. Moreover, the sum of the last $n$ coordinates of every column is at least $1$. In any convergent sequence of elements of $cal(C)$, the last-coordinate sums therefore bound the total coefficients of the operation columns. Their combined contributions belong to a fixed multiple of the compact convex hull of the columns and zero. A subsequence of those contributions converges; the residual vectors then converge in the nonnegative orthant. This proves that $cal(C)$ is closed.

Membership of $\( B d - t \, Lambda^4 upright(bold(1)) \)$ in $cal(C)$ is exactly the existence of the finite family in (2.5). If this target were outside the cone, separation would give a linear functional nonnegative on $cal(C)$ and negative at the target. Since $cal(C)$ contains the nonnegative orthant, the coefficients of that functional are nonnegative. Because $w_i > 0$, they may be written as $\( x_i \, w_i y_i \)_i$. They would satisfy (2.6) and violate (2.7), proving the reduction.

Fix nonnegative prices satisfying (2.6). Applying that inequality to the drop at $i$ and dividing by $w_i$ gives

#[#set math.equation(numbering: n => "(2.8)")
 $ sum_(u in N_H \( i \)) x_u w_u lt.eq \( Lambda - s_i \) x_i + y_i lt.eq Lambda x_i + y_i . $ <eq:drop-test>]

Call a vertex $i$ #emph[good] if $x_i > y_i$, and #emph[bad] otherwise. A triangle ${ i \, u \, z }$ contributes $2 \( x_i + x_u + x_z \) w_i w_u w_z$ to $sum_v x_v t_v$. For a fixed bad vertex $i$, the sum of these contributions over triangles containing $i$ is at most

$ 2 w_i (x_i s_i^2 + s_i sum_(u in N_H \( i \)) x_u w_u) lt.eq O \( Lambda^2 \) w_i y_i \, $

by (2.8) and $s_i lt.eq Lambda$. Summing over bad vertices, with possible overcounting, yields

#[#set math.equation(numbering: n => "(2.9)")
 $ sum_({ i \, u \, z } upright(" triangle of ") H\
{ i \, u \, z } upright(" contains a bad vertex")) 2 \( x_i + x_u + x_z \) w_i w_u w_z lt.eq O \( Lambda^2 \) sum_i w_i y_i . $ <eq:bad-triangles>]

The remaining triangles have only good vertices. Their edge budget is

#[#set math.equation(numbering: n => "(2.10)")
 $ M_x = sum_i x_i d_i = sum_(i u in E \( H \)) \( x_i + x_u \) w_i w_u \, $ <eq:price-mass>]

where the edge sum is unordered.

Good vertices have positive prices. Consider all dyadic numbers $b = 2^j$, $j in bb(Z)$, such that $\[ b \, 2 b \)$ contains the price of a good vertex. There are only finitely many such levels. At level $b$, call a good vertex low if $x_i < b$, middle if $b lt.eq x_i < 2 b$, and high if $x_i gt.eq 2 b$. Let $H_b$ be the graph on good vertices obtained from $H$ by deleting edges with two low endpoints or two high endpoints. Rescale the weights to

#[#set math.equation(numbering: n => "(2.11)")
 $ q_i = cases(delim: "{", w_i x_i \/ b \, & i upright(" high") \,, w_i \, & i upright(" low or middle") .) $ <eq:rescaled-weights>]

The weights $q$ and all three classifications refer to the level under consideration.

A triangle of good vertices survives at exactly one level: the level whose interval contains its median price. At that level it has at most one low and at most one high vertex, and hence at least one middle vertex. At every other level, two vertices are low or two are high, and the edge between them is deleted. The rescaling pays for the largest price even when it is much larger than the median: if $x_i < b lt.eq x_u < 2 b lt.eq x_z$, then

$ b q_i q_u q_z = x_z w_i w_u w_z . $

If a retained triangle has no high vertex, all three prices are less than $2 b$. If it has a high vertex, its $q$-weight incorporates that largest price divided by $b$. In either case its contribution satisfies

$ 2 \( x_i + x_u + x_z \) w_i w_u w_z lt.eq 12 b q_i q_u q_z . $

Define

#[#set math.equation(numbering: n => "(2.12)")
 $ T_0 = sum_b b sum_({ i \, u \, z } upright(" triangle of ") H_b) q_i q_u q_z . $ <eq:dyadic-triangle-mass>]

We have proved

#[#set math.equation(numbering: n => "(2.13)")
 $ sum_i x_i t_i lt.eq 12 T_0 + O \( Lambda^2 \) sum_i w_i y_i . $ <eq:triangle-reduction>]

Consequently, a bound $T_0 = O_r \( M_x \)$ will imply (2.7) once $B$ and the lower threshold on $Lambda$ are chosen.

To obtain that bound, we express the dual prices in the rescaled weights. For good vertices and original edges between them, set

#[#set math.equation(numbering: n => "(2.14)")
 $ alpha_i = frac(x_i w_i, b q_i) \, #h(2em) beta_i = frac(y_i w_i, b q_i) \, #h(2em) kappa_(i u) = frac(\( x_i + x_u \) w_i w_u, b q_i q_u) . $ <eq:rescaled-coefficients>]

They satisfy

#[#set math.equation(numbering: n => "(2.15)")
 $ 0 lt.eq beta_i < alpha_i lt.eq 2 \, #h(2em) 0 < kappa_(i u) lt.eq 4 \, #h(2em) kappa_(i u) gt.eq 1 quad \( i u in E \( H_b \) \) . $ <eq:coefficient-bounds>]

Indeed, $alpha_i = 1$ at high vertices and $alpha_i = x_i \/ b$ at the others. If exactly one endpoint of an edge is high, then $kappa_(i u)$ is $1$ plus the ratio of the other price to the high price. If both endpoints are high it is $b \/ x_i + b \/ x_u$, and if neither is high it is $\( x_i + x_u \) \/ b$. A retained edge of the last type has a middle endpoint, proving its lower bound.

For a multiplier operation supported on good vertices, division of (2.6) by $b$ gives

#[#set math.equation(numbering: n => "(2.16)")
 $ 0 lt.eq  & sum_(i upright(" good")) alpha_i q_i f \( m_i \) + sum_(i u in E \( H \)\
i \, u upright(" good")) kappa_(i u) q_i q_u \( m_i - 1 \) \( m_u - 1 \)\
 & + sum_(i in J) beta_i q_i . $ <eq:normalized-dual>]

The edge sum here still uses the original edges of $H$, including edges absent from $H_b$.

The rescaling also preserves a uniform neighborhood bound:

#[#set math.equation(numbering: n => "(2.17)")
 $ sum_(u in N_(H_b) \( i \)) q_u lt.eq e^(ell_0) = 8 Lambda . $ <eq:level-neighborhood>]

For a high vertex, all retained neighbors have their original weights, so the sum is at most $Lambda$. For a non-high vertex $i$, the high neighbors have total $q$-weight at most

$ 1 / b sum_(u in N_H \( i \)) x_u w_u lt.eq frac(Lambda x_i + y_i, b) < 2 \( Lambda + 1 \) \, $

by (2.8) and goodness. The other neighbors contribute at most $Lambda$, proving (2.17).

=== 2.2 Sparse multipliers and local edge mass <sparse-multipliers-and-local-edge-mass>

The normalized dual inequality controls the mass of edges between two nearby sets. To see this, we will increase the weights on one set and set the weights on the other to zero. The cross edges then have negative quadratic contribution. The following construction keeps the positive contribution inside the first set small. Its recursive passage to neighborhoods excluding a smaller clique is the sparse-subgraph device of Ajtai, Erdős, Komlós, and Szemerédi [1] Section 3. The mean-one weighted construction and the resulting cross estimate adapt [22] Lemmas 2.2–2.3; we give the proofs with the locality and participation conditions needed here.

#thm([Lemma 2.2.])[
  (Sparse multipliers).  #emph[For every integer $r gt.eq 2$ there is a constant $D_r gt.eq 1$ such that the following holds. Let $F$ be a finite $K_r$-free graph with positive vertex weights $q_i$ of total mass $s$. For every $0 < epsilon.alt lt.eq 1 \/ 2$, there are jointly distributed random multipliers $n_i$ satisfying 
#[#set math.equation(numbering: n => "(2.18)")
 $ 0 lt.eq n_i lt.eq D_r epsilon.alt^(- \( r - 2 \)) \, #h(2em) bb(E) n_i = 1 \, #h(2em) bb(E) sum_(i u in E \( F \)) q_i q_u n_i n_u lt.eq epsilon.alt s^2 \, $ <eq:sparse-multipliers>]

 where the edge sum is unordered.]
] <lem:sparse-multipliers>

#proof[
  The assertion is vacuous if $F$ has no vertices. Otherwise $s > 0$, and we argue by induction on $r$. For $r = 2$, the graph has no edges and $n_i = 1$ suffices.
  Keep the initial total mass $s$ fixed. Successively remove the open neighborhood of a vertex in the current remainder whenever that neighborhood has mass greater than $epsilon.alt s \/ 4$. The removed sets are disjoint, each induces a $K_(r - 1)$-free graph, and their masses $s_j$ satisfy $s_j > epsilon.alt s \/ 4$. In the final remainder, every neighborhood has mass at most $epsilon.alt s \/ 4$, so its unordered edge mass is at most $epsilon.alt s^2 \/ 8$. If no set was removed, the constant multipliers $1$ already prove the assertion.
  Otherwise, select the final remainder with probability $1 \/ 2$, or removed set $j$ with probability
  $ p_j = frac(s_j, 2 sum_l s_l) > epsilon.alt / 8 . $
  Set the multipliers to zero off the selected set. On the selected remainder, use the constant multiplier $2$. On a selected removed set $j$, use the inductively supplied multipliers with parameter $epsilon.alt \/ 4$, divided by $p_j$. Every vertex has mean multiplier $1$. On a removed set, the multiplier bound follows from
  $ frac(D_(r - 1) \( epsilon.alt \/ 4 \)^(- \( r - 3 \)), p_j) lt.eq 8 dot.op 4^(r - 3) D_(r - 1) epsilon.alt^(- \( r - 2 \)) . $
  Thus a constant $D_r$ depending only on $r$ bounds all multipliers as required.
  Edges between different sets contribute zero. The remainder contributes at most $epsilon.alt s^2 \/ 4$ in expectation, while the removed sets together contribute at most
  $ sum_j frac(\( epsilon.alt \/ 4 \) s_j^2, p_j) = epsilon.alt / 2 (sum_j s_j)^2 lt.eq epsilon.alt / 2 s^2 . $
  Their sum is at most $epsilon.alt s^2$, completing the induction. ◻
]

For sets $S \, D$ in a graph with weights $q$, write

$ q \( S \) = sum_(i in S) q_i \, #h(2em) e_q \( S \, D \) = sum_(i in S) sum_(u in D ∩ N \( i \)) q_i q_u . $

This is a directed edge sum: an edge with both endpoints in $S ∩ D$ is counted twice. We specify the graph by a subscript when needed.

#thm([Lemma 2.3.])[
  (Local cross estimate).  #emph[Assume the prices satisfy (2.6), and fix a level $b$. Let $S \, D subset.eq V \( H_b \)$, where $S union D$ is contained in a ball of radius $R_0$ in $H$ and meets every part of $cal(D)$ in at most $P_0$ vertices. Suppose that 
$ 32 lt.eq h lt.eq 20 ell_0^2 \, #h(2em) q \( S \) \, q \( D \) lt.eq e^h \, #h(2em) 0 lt.eq eta lt.eq 2 \, $

 and that $alpha_i \, beta_i lt.eq eta$ for $i in S$. If $A$ in (2.2) is sufficiently large depending only on $r$, then 
#[#set math.equation(numbering: n => "(2.19)")
 $ e_(q \, H_b) \( S \, D \) lt.eq C_1 #scale(x: 120%, y: 120%)[\(] eta h q \( S \) + e^(- 3 h) #scale(x: 120%, y: 120%)[\)] \, $ <eq:local-cross>]

 where $C_1 = C_1 \( r \)$.]
] <lem:local-cross>

#proof[
  First suppose that $S \, D$ are disjoint and nonempty. Apply Lemma 4 to the original induced graph $H \[ S \]$, with its $q$-weights and $epsilon.alt = e^(- 16 h)$. Set $k' = e^(8 h)$, and take the multiplier operation with listed support $S union D$ and
  $ m_i = 1 + k' n_i quad \( i in S \) \, #h(2em) m_i = 0 quad \( i in D \) . $
  The sparse multiplier bound implies $log \( 1 + k' n_i \) lt.eq C'_r h$. Since $h lt.eq 20 ell_0^2$, choosing $A gt.eq 20 C'_r$ makes every realization an allowed operation; the ball and participation conditions follow from the hypotheses on $S union D$.
  Write $s = q \( S \)$ and $d = q \( D \)$, and take expectations in (2.16). On $S$, the expected entropy term is at most $C'_r eta h k' s$, because $f \( 1 + a \) lt.eq a log \( 1 + a \)$ for $a gt.eq 0$ and $bb(E) n_i = 1$. The support price on $S$ is at most $eta s$. On $D$, the entropy and support terms together are at most $4 d$, using $f \( 0 \) = 1$ and (2.15).
  The expected quadratic edge term is at most
  #[#set math.equation(numbering: n => "(2.20)")
   $ 4 \( k' \)^2 epsilon.alt s^2 + 2 d^2 - k' e_(q \, H_b) \( S \, D \) . $ <eq:cross-quadratic-cost>]
  Inside $S$, the bound $kappa_(i u) lt.eq 4$ and (2.18) give the first term, including for original edges absent from $H_b$. Inside $D$, the unordered edge mass is at most $d^2 \/ 2$, giving the second term. On retained edges between $S$ and $D$, the coefficient is at least $1$ and the expected product of deviations is $- k'$. Deleted cross edges have nonpositive contributions and can be omitted in an upper bound. Edges leaving $S union D$ contribute zero.
  Since the tested inequality holds for every realization, these bounds give
  $ e_(q \, H_b) \( S \, D \) lt.eq C'_r eta h s + frac(eta s + 4 d + 4 \( k' \)^2 epsilon.alt s^2 + 2 d^2, k') lt.eq C'_r eta h s + O \( e^(- 3 h) \) . $
  For the last inequality, $s \, d lt.eq e^h$, $eta lt.eq 2$, $k' = e^(8 h)$, and $\( k' \)^2 epsilon.alt = 1$ make the numerator after division at most $6 e^(- 7 h) + 6 e^(- 6 h)$. If either set is empty, the bound holds immediately.
  For possibly overlapping sets, assign every vertex independently to a left or right class with equal probabilities. Apply the disjoint estimate to the part of $S$ on the left and the part of $D$ on the right. Each directed edge of $e_(q \, H_b) \( S \, D \)$ survives with probability $1 \/ 4$, whereas the expected mass of the left subset of $S$ is $q \( S \) \/ 2$. Taking expectations and increasing $C_1$ proves (2.19) in general. ◻
]

The triangle argument will replace vertices by copies and delete some edges. The next observation ensures that the local estimate remains available after these changes. A homomorphism $p : F arrow.r H_b$ is #emph[injective on directed edges] if the map $\( u \, v \) mapsto \( p \( u \) \, p \( v \) \)$ is injective on all ordered adjacent pairs of $F$. Vertices may have several preimages, but each original directed edge has at most one preimage.

#thm([Corollary 2.4.])[
  (Transfer under vertex splitting).  #emph[Let $F$ be a graph with a homomorphism $p : F arrow.r H_b$ that is injective on directed edges. Give every vertex of $F$ the weight, prices, coefficients, and part of its image. Then every vertex of $F$ has at most one neighbor in each inherited part. Moreover, (2.19) holds in $F$ for any $S \, D subset.eq V \( F \)$ satisfying the mass and coefficient hypotheses of Lemma 5, provided $S union D$ lies in a ball of radius $R_0$ in $F$ and meets each inherited part in at most $P_0$ vertices.]
] <lem:local-cross-transfer>

#proof[
  Directed-edge injectivity implies
  $ e_(q \, F) \( S \, D \) lt.eq e_(q \, H_b) \( p \( S \) \, p \( D \) \) \, #h(2em) q \( p \( S \) \) lt.eq q \( S \) \, #h(2em) q \( p \( D \) \) lt.eq q \( D \) . $
  The projected union lies in a ball of radius $R_0$ in $H$ and meets each original part in at most $P_0$ vertices. The coefficient bounds also pass to the images. Lemma 5, which permits overlap of the two sets, therefore proves the asserted estimate. Finally, distinct neighbors of a vertex of $F$ have distinct images: otherwise two directed edges would have the same image. Since their images lie in the neighborhood of one vertex of $H_b$, at most one belongs to any given part. ◻
]

We have derived the local edge estimate solely from the dual condition and have shown that it survives the graph modifications needed below. The remaining assertion is the following triangle bound.

#thm([Proposition 2.5.])[
  (Triangle bound).  #emph[For the graphs $H_b$, weights $q$, and prices constructed above from (2.6), with $A$ chosen as in Lemma 5, the quantities in (2.10) and (2.12) satisfy 
$ T_0 lt.eq O_r \( M_x \) . $

 The implicit constant depends only on $r$.]
] <prop:triangle-bound>

Section 3 proves the proposition by repeatedly reducing neighborhood weights while retaining a controlled fraction of the triangle mass. In view of (2.13), this completes the dual inequality and Lemma 3. The constants are chosen in this order: the sparse multiplier construction determines $A$ and $C_1$; the triangle bound then determines $B$; and finally $Lambda_r$ is increased so that the $O \( Lambda^2 \) sum_i w_i y_i$ term is at most $Lambda^4 sum_i w_i y_i$.

== 3 Controlling triangles by splitting vertices <sec:triangles>

We prove Proposition 7 by repeatedly reducing the neighborhood weights in the level graphs. The main construction splits a vertex into copies of the same weight, distributes its incident edges among those copies, and preserves most of the triangle mass. Two features must hold together: the edges of a typical triangle must meet at the same copy of each corner, and each copy must have a much smaller neighborhood weight. Random walks inside neighborhoods supply labels that achieve both properties. The argument adapts the triangle estimate of [22] Sections 3–5, while retaining the bounds on radius and participation in each part needed for the weight adjustments here.

Throughout this section, a graph at level $b$ has a homomorphism into $H_b$ that is injective on directed edges. Its vertices inherit the weights $q$, prices, parts, and low, middle, or high classification of their images. Corollary 6 therefore makes (2.19) available on each such graph, with its stated ball and part conditions. Deleting vertices or edges preserves these properties. The splitting construction will preserve them as well.

=== 3.1 Removing triangles of small total mass <subsec:triangle-preparation>

Let $F_b$ denote the current graph at level $b$, initially $H_b$, and put

$ T = sum_b b sum_({ a \, u \, v } upright(" a triangle of ") F_b) q_a q_u q_v . $

Thus initially $T = T_0$. A triangle of $F_b$ projects to a triangle of $H_b$ with three distinct vertices and hence has a middle vertex. We shall use the following bound at every stage:

#[#set math.equation(numbering: n => "(3.1)")
 $ sum_b b sum_(a in V \( F_b \)\
a upright(" middle")) q_a q #scale(x: 120%, y: 120%)[\(] N_(F_b) \( a \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 M_x . $ <eq:middle-edge-charge>]

Indeed, for an edge $a u$ the quantity $b q_a q_u$ is at most the contribution of its image edge to $M_x$, since the coefficient $kappa$ on that image is at least one. An original vertex is middle at exactly one level, and a directed edge at that level has at most one preimage. Each original edge can consequently be charged at most once from each endpoint.

Suppose that all current neighborhood weights are at most $e^ell$, where $32 lt.eq ell lt.eq ell_0$. First delete, at every level, the vertices whose inherited prices satisfy $x_i \/ b < ell^(- 4)$. To bound the triangle mass lost, fix a middle vertex $a$ before these deletions, let $D = N_(F_b) \( a \)$, and let $S$ be the set of vertices of $D$ being deleted. The set $S union D = D$ lies in a ball of radius one and has at most one vertex in each part. Also $q \( S \) \, q \( D \) lt.eq e^ell$, while $alpha_i \, beta_i lt.eq ell^(- 4)$ on $S$. Applying (2.19) with $h = ell$ gives

$ e_q \( S \, D \) lt.eq C_1 #scale(x: 120%, y: 120%)[\(] ell^(- 3) q \( D \) + e^(- 3 ell) #scale(x: 120%, y: 120%)[\)] . $

In fact $e_q \( S \, D \) = O_r \( q \( D \) \/ ell^2 \)$: when $q \( D \) > ell^(- 2)$ the exponential term is absorbed by $q \( D \) \/ ell^2$; when $q \( D \) lt.eq ell^(- 2)$, use instead $e_q \( S \, D \) lt.eq q \( D \)^2$. A deleted triangle has a middle vertex, which is not itself deleted, and an edge from $S$ to $D$ in that middle vertex’s neighborhood. Multiplying by $b q_a$ and summing therefore bounds the loss in $T$ by $O_r \( M_x \/ ell^2 \)$, using (3.1).

After these deletions, the total edge mass over the levels satisfies

#[#set math.equation(numbering: n => "(3.2)")
 $ sum_b b sum_(u v in E \( F_b \)) q_u q_v lt.eq O \( log ell \) M_x . $ <eq:dyadic-edge-mass>]

To see this, write $x_min$ for the smaller of the two prices on an original edge. If that edge has a preimage at level $b$, then

$ b ell^(- 4) lt.eq x_min < 2 b . $

The first inequality follows from the deletion rule, and the second from the absence of edges with two high endpoints. There are only $O \( log ell \)$ dyadic choices for $b$. At each such level, the edge has at most one preimage, whose mass $b q_u q_v$ is at most the original edge’s contribution to $M_x$.

Next delete an edge whenever the weight of its current common neighborhood is less than $ell^(- 1)$, continuing until no such edge remains. Deleting $u v$ destroys triangle mass at most $b q_u q_v \/ ell$. Thus (3.2) bounds this further loss by $O \( \( log ell \) M_x \/ ell \)$. Discard isolated vertices as well.

Fix a nonempty level graph $F = F_b$ after these operations. All neighborhoods in the next two subsections are in $F$. Set

#[#set math.equation(numbering: n => "(3.3)")
 $ S_u & = q \( N \( u \) \) in \[ ell^(- 1) \, e^ell \] \,\
c_(u v) & = q \( N \( u \) ∩ N \( v \) \) gt.eq ell^(- 1) &  & \( u v in E \( F \) \) \,\
h_u & = sum_(v in N \( u \)) q_v c_(u v) gt.eq S_u \/ ell . $ <eq:prepared-level>]

The lower bound on $S_u$ follows because $u$ has a neighbor and every edge has common-neighborhood weight at least $ell^(- 1)$.

#thm([Lemma 3.1.])[
  (Splitting a level graph).  #emph[Let $32 lt.eq ell lt.eq ell_0$, and let $F$ be a nonempty finite graph with no isolated vertices, with a homomorphism into some $H_b$ injective on directed edges. Give its vertices the inherited weights, prices, and parts, and suppose that (3.3) holds. There is a graph $F'$ obtained by splitting vertices and retaining at most one copy of each edge of $F$, with unchanged vertex weights, such that every neighborhood of $F'$ has weight at most $e^(sqrt(ell))$ and 
#[#set math.equation(numbering: n => "(3.4)")
 $ sum_({ a \, u \, v } upright(" a triangle of ") F') q_a q_u q_v gt.eq (1 - C_2 frac(log ell, sqrt(ell))) sum_({ a \, u \, v } upright(" a triangle of ") F) q_a q_u q_v \, $ <eq:split-retention>]

 where $C_2$ depends only on $r$. The projection $F' arrow.r F$ is a homomorphism injective on directed edges.]
] <lem:triangle-splitting>

We prove the lemma in the next two subsections. At a vertex $u$, the construction will attach a label in $N \( u \)$ to each incidence $\( u \, v \)$; edges with the same label use the same copy of $u$. A triangle survives only if its two labels agree at each corner. We first construct probability laws whose labels can usually agree, then impose a condition on the reverse transition probabilities to bound the weight at each copy.

=== 3.2 Entropy bounds for walks in neighborhoods <subsec:neighborhood-entropy>

Let $t$ be the unordered triangle mass of $F$. It is positive by (3.3). Choose an ordered triangle $\( u \, v \, z \)$ with probability $q_u q_v q_z \/ \( 6 t \)$. The law of its first two vertices and the conditional law of its second vertex are

#[#set math.equation(numbering: n => "(3.5)")
 $ mu \( u \, v \) = frac(q_u q_v c_(u v), 6 t) \, #h(2em) pi_u \( v \) = frac(q_v c_(u v), h_u) . $ <eq:triangle-laws>]

In particular, the marginal law of $u$ is $q_u h_u \/ \( 6 t \)$, and $mu$ is symmetric in its two arguments.

On $N \( u \)$ define the transition kernels

#[#set math.equation(numbering: n => "(3.6)")
 $ P_u \( v \, z \) = frac(upright(bold(1))_({ v z in E \( F \) }) q_z, c_(u v)) \, #h(2em) Q_u = frac(I + P_u, 2) \, #h(2em) K_u^(\( j \)) = P_u Q_u^j quad \( j gt.eq 0 \) . $ <eq:neighborhood-kernels>]

All denominators are positive. The kernel $P_u$ is reversible with stationary law $pi_u$, since

$ pi_u \( v \) P_u \( v \, z \) = frac(q_v q_z upright(bold(1))_({ v z in E \( F \) }), h_u) $

is symmetric in $v \, z$. The same holds for $Q_u$ and $K_u^(\( j \))$, which are polynomials in $P_u$. Moreover, writing $K_u^(\( j \)) = Q_u^j P_u$ and using $c_(u v) gt.eq ell^(- 1)$ gives

#[#set math.equation(numbering: n => "(3.7)")
 $ K_u^(\( j \)) \( v \, z \) lt.eq ell q_z . $ <eq:kernel-density-bound>]

The number of vertices in $N \( u \)$ can be arbitrarily large even when its total weight is small. We therefore measure entropy relative to $q$: for a probability row $p$ on a finite set with positive weights $q$, put

$ cal(H)_q \( p \) = sum_(z : p \( z \) > 0) p \( z \) log frac(q_z, p \( z \)) . $

This quantity may be negative. Jensen’s inequality bounds it by $log q \( "supp" p \)$. Define

#[#set math.equation(numbering: n => "(3.8)")
 $ H_j = bb(E)_(\( u \, v \) tilde.op mu) cal(H)_q #scale(x: 120%, y: 120%)[\(] K_u^(\( j \)) \( v \, dot.op \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) R = ceil.l ell ceil.r . $ <eq:walk-entropy>]

The density bound gives $H_j gt.eq - log ell$. We will bound $H_R$ by $O_r \( log ell \)$, much less than the immediate bound $H_R lt.eq ell$. Only $O_r \( log ell \)$ entropy can then be gained over $R$ steps, so some step has a small increment. That increment will control the distance between the label laws at a triangle corner.

#thm([Lemma 3.2.])[
  #emph[With the above definitions, 
#[#set math.equation(numbering: n => "(3.9)")
 $ H_0 gt.eq - log ell \, #h(2em) H_R lt.eq O_r \( log ell \) . $ <eq:walk-entropy-bound>]

]
] <lem:walk-entropy-bound>

#proof[
  Only the upper bound remains. Fix $v$. We construct sets that contain almost all the mass of the walks starting at $v$, uniformly over the choice of $u in N \( v \)$. Let
  $ theta = ell^(- 6) e^(- ell) \, #h(2em) D_0 = N \( v \) \, #h(2em) D_(j + 1) = D_j union { z : q \( N \( z \) ∩ D_j \) gt.eq theta } quad \( 0 lt.eq j < R \) . $
  The sets $D_j$ lie in the ball of radius $j + 1$ about $v$. Double counting the edges between $D_j$ and its newly included vertices yields
  $ theta q \( D_(j + 1) \\ D_j \) lt.eq e^ell q \( D_j \) . $
  Consequently,
  #[#set math.equation(numbering: n => "(3.10)")
   $ q \( D_R \) lt.eq e^ell \( 1 + ell^6 e^(2 ell) \)^R lt.eq e^(20 ell^2) . $ <eq:walk-support-mass>]
  For the last inequality, use $6 log ell lt.eq ell$ and $R lt.eq 2 ell$ for $ell gt.eq 32$.
  We also need the part condition in (2.19). For a fixed part $D'$, every vertex in $\( D_(j + 1) \\ D_j \) ∩ D'$ has at least $theta$ weight of neighbors in $D_j$. Each vertex of $D_j$ has at most one neighbor in $D'$, so
  $ theta \| \( D_(j + 1) \\ D_j \) ∩ D' #scale(x: 120%, y: 120%)[\|] lt.eq q \( D_j \) . $
  Thus the weighted inclusion threshold controls an unweighted count in each part. The initial set $N \( v \)$ has at most one vertex in $D'$. It follows from (3.10) that
  #[#set math.equation(numbering: n => "(3.11)")
   $ \| D_R ∩ D' \| lt.eq 1 + R theta^(- 1) e^(20 ell^2) lt.eq e^(40 ell^2) lt.eq P_0 . $ <eq:walk-support-parts>]
  The radius condition also holds, since $R + 1 lt.eq R_0$.
  For every $u in N \( v \)$, the leakage outside these sets satisfies
  #[#set math.equation(numbering: n => "(3.12)")
   $ K_u^(\( j \)) \( v \, N \( u \) \\ D_j \) lt.eq j ell^(- 4) #h(2em) \( 0 lt.eq j lt.eq R \) . $ <eq:walk-leakage>]
  At $j = 0$, the row is supported on $N \( u \) ∩ N \( v \)$. For the induction step, fix $z in N \( u \) \\ D_(j + 1)$. Since $D_j subset.eq D_(j + 1)$, mass arriving at $z$ from $D_j$ uses an off-diagonal transition of $Q_u$. By (3.7) and the off-diagonal bound $Q_u \( y \, z \) lt.eq ell q_z$, this mass is at most
  $ sum_(y in N \( z \) ∩ D_j) ell q_y thin ell q_z lt.eq ell^2 q_z theta = q_z ell^(- 4) e^(- ell) . $
  Summing over these $z$ gives at most $ell^(- 4)$, since $q \( N \( u \) \) lt.eq e^ell$. The mass arriving from outside $D_j$ is at most the preceding leakage, proving (3.12).
  Although $D_R$ can have large total weight, its intersection with most neighborhoods relevant to the triangle law is small. Define
  $ J_v = { u in N \( v \) : q \( N \( u \) ∩ D_R \) > ell^8 } . $
  Apply (2.19) to $N \( v \)$ and $D_R$, with $h = 20 ell^2$ and $eta = 2$. The mass, radius, and part conditions were just verified; also $h lt.eq 20 ell_0^2$. As $S_v gt.eq ell^(- 1)$, the exponential error can be absorbed, giving
  $ ell^8 q \( J_v \) lt.eq e_q \( N \( v \) \, D_R \) lt.eq O_r \( ell^2 S_v \) \, #h(2em) q \( J_v \) lt.eq O_r \( ell^(- 6) S_v \) . $
  This controls $q$-mass, whereas the conditional law given $v$ in (3.5) also weights $u$ by $c_(u v)$. A second use of (2.19), now on $J_v \, N \( v \)$ with $h = ell$ and $eta = 2$, makes precisely this conversion:
  #[#set math.equation(numbering: n => "(3.13)")
   $ bb(P)_mu \( u in J_v divides v \) & = frac(sum_(u in J_v) q_u c_(u v), h_v) = frac(e_q \( J_v \, N \( v \) \), h_v)\
 & lt.eq O_r #h(-0.16667em) (frac(ell q \( J_v \) + e^(- 3 ell), S_v \/ ell)) lt.eq O_r \( ell^(- 4) \) . $ <eq:exceptional-neighborhood-law>]
  Here the sets are contained in $N \( v \)$, so the support conditions hold with radius one and at most one vertex per part.
  For $u in.not J_v$, split the row $K_u^(\( R \)) \( v \, dot.op \)$ according to membership in $D_R$. Its outside probability is at most $R ell^(- 4)$ by (3.12); the weights of the two possible supports are at most $ell^8$ and $e^ell$, respectively. The entropy of this mixture is therefore at most
  $ log 2 + 8 log ell + \( R ell^(- 4) \) ell . $
  Indeed, conditioning on the two supports adds their binary entropy, which is at most $log 2$, and the conditional entropies are bounded by the logarithms of their support weights. Empty supports contribute nothing. For $u in J_v$, use the bound $ell$. Averaging first over $u$ conditional on $v$, using (3.13), and then over $v$ proves $H_R = O_r \( log ell \)$. ◻
]

=== 3.3 Coupled labels and the split graph <subsec:coupled-splitting>

#proof[
  We first turn the entropy bound into similarity of the label laws at a triangle corner. For two probability rows $p \, a$ on the same finite set, write
  $ "KL" \( p parallel a \) = sum_(z : p \( z \) > 0) p \( z \) log frac(p \( z \), a \( z \)) \, #h(2em) "TV" \( p \, a \) = 1 / 2 sum_z \| p \( z \) - a \( z \) \| \, $
  with $"KL" \( p parallel a \) = + oo$ when necessary. We shall use
  #[#set math.equation(numbering: n => "(3.14)")
   $ "TV" \( p \, a \) lt.eq sqrt("KL" \( p parallel a \)) . $ <eq:entropy-total-variation>]
  For completeness, let $rho = sum_z sqrt(p \( z \) a \( z \))$. Jensen’s inequality gives $"KL" \( p parallel a \) gt.eq - 2 log rho gt.eq 2 \( 1 - rho \)$, while Cauchy–Schwarz gives $"TV" \( p \, a \)^2 lt.eq 1 - rho^2 lt.eq 2 \( 1 - rho \)$. The case of infinite divergence is immediate.
  Since $K_u^(\( j + 1 \)) = Q_u K_u^(\( j \))$, its row at $v$ is the mixture of the rows $K_u^(\( j \)) \( z \, dot.op \)$ with $z tilde.op Q_u \( v \, dot.op \)$. The entropy of a mixture minus the average entropy of its constituent rows is the average of their divergences from the mixture. The $log q_z$ terms cancel in this identity. Averaging over $mu$, and using stationarity of $pi_u$ for $Q_u$ to identify the average constituent entropy as $H_j$, gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ H_(j + 1) - H_j = bb(E)_(\( u \, v \) tilde.op mu\
z tilde.op Q_u \( v \, dot.op \)) "KL" #scale(x: 120%, y: 120%)[\(] K_u^(\( j \)) \( z \, dot.op \) thin parallel thin K_u^(\( j + 1 \)) \( v \, dot.op \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <eq:entropy-increment>]
  Lemma 9 and telescoping over $R$ steps now give an index $0 lt.eq j < R$ such that
  $ H_(j + 1) - H_j lt.eq O_r \( \( log ell \) \/ ell \) . $
  Fix this index and abbreviate $K_u = K_u^(\( j \))$. Using the row $K_u^(\( j + 1 \)) \( v \, dot.op \)$ as an intermediary in the triangle inequality for total variation yields
  #[#set math.equation(numbering: n => "(3.16)")
   $ bb(E)_(\( u \, v \) tilde.op mu\
z tilde.op P_u \( v \, dot.op \)) "TV" #scale(x: 120%, y: 120%)[\(] K_u \( v \, dot.op \) \, K_u \( z \, dot.op \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 sqrt(H_(j + 1) - H_j) lt.eq O_r #h(-0.16667em) (sqrt(frac(log ell, ell))) . $ <eq:corner-row-agreement>]
  To check the factor two, the two expected distances to the intermediary sum to twice the expected distance from the $z$-row under $Q_u = \( I + P_u \) \/ 2$. Apply (3.14), then Cauchy–Schwarz, and finally (3.15). The law on the left of (3.16) is exactly the ordered triangle law, because
  $ mu \( u \, v \) P_u \( v \, z \) = frac(q_u q_v q_z, 6 t) quad upright("when ") u \, v \, z upright(" form a triangle") . $
  At each $u$, give all incidences $\( u \, v \)$ labels $Y_(u \, v) in N \( u \)$, with marginal law $K_u \( v \, dot.op \)$, by a simultaneous coupling. We use the disagreement bound of Angel and Spinka [5] Theorem 2; the following finite-set construction includes the proof needed here. For any finite family of laws on a finite set, take one shared sequence of independent proposals, each consisting of a uniformly chosen label and an independent uniform mark in $\[ 0 \, 1 \]$. Each law accepts the first proposal whose mark is no greater than its probability of that label. The accepted label has the prescribed law, and every law accepts almost surely. For two laws at total variation distance $d$, the first proposal accepted by either is accepted by both with probability $\( 1 - d \) \/ \( 1 + d \)$: the sums of the pointwise minimum and maximum of their probabilities are $1 - d$ and $1 + d$. Their labels thus disagree with probability at most $2 d \/ \( 1 + d \) lt.eq 2 d$. A single proposal sequence gives this bound simultaneously for every pair of laws. Applying the construction to the rows of $K_u$ and using (3.16) bounds the average probability of a disagreement at a triangle corner by $O_r \( sqrt(\( log ell \) \/ ell) \)$. Couplings at distinct vertices may be chosen independently.
  Agreement controls triangle retention. To control neighborhood weights, call an incidence $\( u \, v \)$ with label $y = Y_(u \, v)$ #emph[qualified] if
  #[#set math.equation(numbering: n => "(3.17)")
   $ K_u \( y \, v \) gt.eq q_v e^(- sqrt(ell)) . $ <eq:reverse-qualification>]
  This uses the reverse transition: at a copy indexed by $y$, summing $K_u \( y \, v \)$ over its possible neighbors will sum a single probability row. It remains to show that this qualification rarely discards an incidence.
  Choose $\( u \, v \) tilde.op mu$ and then $y tilde.op K_u \( v \, dot.op \)$. Conditional on $u$, the joint law of $\( v \, y \)$ is $pi_u \( v \) K_u \( v \, y \)$, which is symmetric by reversibility. In particular, the reverse entry is positive almost surely, and exchanging $v$ and $y$ gives
  #[#set math.equation(numbering: n => "(3.18)")
   $ bb(E) log frac(q_v, K_u \( y \, v \)) = bb(E) log frac(q_y, K_u \( v \, y \)) = H_j lt.eq H_R . $ <eq:reverse-entropy>]
  The random logarithm is at least $- log ell$ by (3.7). Add $log ell$ and apply Markov’s inequality to this nonnegative variable. Lemma 9 then yields
  #[#set math.equation(numbering: n => "(3.19)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \( u \, v \) upright(" is not qualified") #scale(x: 120%, y: 120%)[\)] lt.eq frac(H_j + log ell, sqrt(ell) + log ell) lt.eq O_r #h(-0.16667em) (frac(log ell, sqrt(ell))) . $ <eq:qualification-failure>]
  For each $u$ make copies $\( u \, y \)$ indexed by $y in N \( u \)$, all with weight $q_u$. Retain $u v$ if its two incidences qualify, and join $\( u \, Y_(u \, v) \)$ to $\( v \, Y_(v \, u) \)$. This defines a simple graph, since each old edge contributes at most one edge and its endpoints project to distinct vertices. The neighbors of $\( u \, y \)$ have total weight at most
  #[#set math.equation(numbering: n => "(3.20)")
   $ sum_(v in N \( u \)\
Y_(u \, v) = y \, med u v upright(" retained")) q_v lt.eq e^(sqrt(ell)) sum_(v in N \( u \)) K_u \( y \, v \) = e^(sqrt(ell)) \, $ <eq:split-neighborhood-bound>]
  by (3.17). Figure 1 illustrates how agreement or disagreement of the corner labels determines whether a triangle survives.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 0), [$u$], anchor: "east")
  circle((1.65, 1.485), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.65, 1.52), [$a$], anchor: "south")
  circle((3.19, 0.825), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.225, 0.825), [$b$], anchor: "west")
  circle((1.65, -1.485), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.65, -1.52), [$c$], anchor: "north")
  circle((3.19, -0.825), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.225, -0.825), [$d$], anchor: "west")
  line((0, 0), (1.65, 1.485), stroke: (paint: rgb("#0000a6"), thickness: 0.9pt, miter-limit: 10))
  line((1.65, 1.485), (3.19, 0.825), stroke: (paint: rgb("#0000a6"), thickness: 0.9pt, miter-limit: 10))
  content((0.825, 0.7425), [#text(size: 9pt)[$y$]], anchor: "south-east", padding: 0.1176cm)
  line((0, 0), (3.19, 0.825), stroke: (paint: rgb("#0000a6"), thickness: 0.9pt, miter-limit: 10))
  content((1.021, 0.264), [#text(size: 9pt)[$y$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (1.65, -1.485), stroke: (paint: rgb("#d96d00"), thickness: 0.9pt, miter-limit: 10))
  line((1.65, -1.485), (3.19, -0.825), stroke: (paint: rgb("#d96d00"), thickness: 0.9pt, miter-limit: 10))
  content((0.825, -0.7425), [#text(size: 9pt)[$z$]], anchor: "north-east", padding: 0.1176cm)
  line((0, 0), (3.19, -0.825), stroke: (paint: rgb("#d96d00"), thickness: 0.9pt, miter-limit: 10))
  content((1.021, -0.264), [#text(size: 9pt)[$z$]], anchor: "north", padding: 0.1176cm)
  line((1.65, 1.485), (1.65, -1.485), stroke: (paint: rgb("#808080"), thickness: 0.6pt, miter-limit: 10))
  content((1.595, -2.255), [#text(size: 9pt)[before splitting at $u$]])
  line((3.85, 0), (4.73, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  circle((5.72, 0.935), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5.685, 0.935), [$(u,y)$], anchor: "east")
  circle((5.72, -0.935), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5.685, -0.935), [$(u,z)$], anchor: "east")
  circle((7.37, 1.485), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((7.37, 1.52), [$a$], anchor: "south")
  circle((8.91, 0.825), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((8.945, 0.825), [$b$], anchor: "west")
  circle((7.37, -1.485), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((7.37, -1.52), [$c$], anchor: "north")
  circle((8.91, -0.825), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((8.945, -0.825), [$d$], anchor: "west")
  line((5.72, 0.935), (7.37, 1.485), stroke: (paint: rgb("#0000a6"), thickness: 0.9pt, miter-limit: 10))
  line((7.37, 1.485), (8.91, 0.825), stroke: (paint: rgb("#0000a6"), thickness: 0.9pt, miter-limit: 10))
  line((8.91, 0.825), (5.72, 0.935), stroke: (paint: rgb("#0000a6"), thickness: 0.9pt, miter-limit: 10))
  line((5.72, -0.935), (7.37, -1.485), stroke: (paint: rgb("#d96d00"), thickness: 0.9pt, miter-limit: 10))
  line((7.37, -1.485), (8.91, -0.825), stroke: (paint: rgb("#d96d00"), thickness: 0.9pt, miter-limit: 10))
  line((8.91, -0.825), (5.72, -0.935), stroke: (paint: rgb("#d96d00"), thickness: 0.9pt, miter-limit: 10))
  line((7.37, 1.485), (7.37, -1.485), stroke: (paint: rgb("#808080"), thickness: 0.6pt, miter-limit: 10))
  content((7.15, -2.255), [#text(size: 9pt)[each copy retains weight $q_u$]])
})],
    caption: [Figure 1: A local view of the splitting construction. All displayed incidences are assumed to qualify, and labels at vertices other than $u$ are suppressed. These are auxiliary incidence labels, not colors in the correspondence assignment. The incidences $u a \, u b$ have label $y$, while $u c \, u d$ have label $z eq.not y$. The triangles $u a b$ and $u c d$ remain triangles after splitting at $u$; $u a c$ does not. Each old edge is used once, and each copy of $u$ keeps its original weight. The coupling makes unequal labels at a triangle corner rare in weighted average. ],
  ) <fig:vertex-splitting>
  An old triangle survives with its original mass if all six incidences qualify and the two labels agree at each of its three corners. In the ordered triangle law, each incidence has marginal $mu$, and each corner has the law used in (3.16). A union bound, followed by averaging with the triangle weights, shows that the expected fraction of triangle mass lost is at most
  $ O_r #h(-0.16667em) (frac(log ell, sqrt(ell)) + sqrt(frac(log ell, ell))) = O_r #h(-0.16667em) (frac(log ell, sqrt(ell))) . $
  Choose a realization retaining at least the expected lower bound. The projection to $F$ is a homomorphism injective on directed edges, and composing it with the old map to $H_b$ preserves that property. All vertex weights and inherited data remain unchanged. This proves (3.4) and the lemma. ◻
]

=== 3.4 Iteration and completion of the adjustment lemma <subsec:triangle-iteration>

#proof[
  Apply the deletions of Subsection 3.1 to all levels, then Lemma 8 to each nonempty level graph. Empty level graphs need no construction. The resulting graphs have neighborhood weights at most $e^(sqrt(ell))$ and still have homomorphisms into their original $H_b$ injective on directed edges. Combining the additive losses from deletion with (3.4) gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ T_(upright("new")) gt.eq (1 - C_2 frac(log ell, sqrt(ell))) T - C_3 frac(log ell, ell) M_x \, $ <eq:triangle-iteration>]
  where the constants depend only on $r$. If the coefficient of $T$ is negative, the inequality follows simply from $T_(upright("new")) gt.eq 0$.
  Choose a sufficiently large constant $X gt.eq 32$, depending only on $r$. Starting at $ell_0$, perform the reduction while $ell > X$, replacing $ell$ by $sqrt(ell)$ each time. Both losses in (3.21) are summable uniformly in the initial value $ell_0$. To verify this explicitly, let $p \( s \) = \( log s \) \/ sqrt(s)$. This function is decreasing for sufficiently large $s$, and
  $ frac(p \( s^2 \), p \( s \)) = 2 / sqrt(s) . $
  In reverse order, the parameters at which reductions are performed start above $X$ and are successively squared. Increasing $X$ therefore makes the sum of $C_2 p \( ell \)$ at most $1 \/ 2$. The sum of $C_3 \( log ell \) \/ ell$ is bounded by a constant depending only on $r$. Iterating (3.21), and using $product_j \( 1 - a_j \) gt.eq 1 - sum_j a_j$ for these nonnegative losses, gives
  #[#set math.equation(numbering: n => "(3.22)")
   $ T_(upright("final")) gt.eq 1 / 2 T_0 - O_r \( M_x \) . $ <eq:iterated-triangle-retention>]
  At the final stage every neighborhood has weight at most $e^X$. Every triangle still has a middle vertex. At a middle vertex $a$, the incident triangle mass, including the factor $b$, is at most $b q_a q \( N \( a \) \)^2 \/ 2$. Hence (3.1) gives
  $ T_(upright("final")) lt.eq e^X / 2 sum_b b sum_(a in V \( F_b \)\
a upright(" middle")) q_a q \( N \( a \) \) lt.eq e^X M_x . $
  This estimate also applies if $ell_0 lt.eq X$ and no reduction is needed. Together with (3.22), it proves $T_0 = O_r \( M_x \)$. ◻
]

#proof[
  #emph[Completion of the proof of Lemma 3.] Proposition 7 bounds the contribution from triangles all of whose vertices are good by $O_r \( M_x \)$. The contribution from triangles meeting a bad vertex is, by (2.9), at most $O \( Lambda^2 \) sum_i w_i y_i$. Taking $B = B \( r \)$ sufficiently large and then increasing the lower threshold on $Lambda$ gives
  $ sum_i x_i t_i lt.eq B sum_i x_i d_i + Lambda^4 sum_i w_i y_i \, $
  which is the dual inequality (2.7). The separation argument in Section 2 now supplies the finite family of operations and rates in (2.5). The constants are chosen in order: first the multiplier bound $A$ and the local estimate constant $C_1$, then the reduction constants and $X$, and finally $B$ and the threshold on $Lambda$. Every choice depends only on $r$, as required. ◻
]

== 4 Coloring rounds with dependent entry weights <sec:rounds>

We now use Lemma 3 to extend a partial correspondence coloring while controlling the weights of the entries that remain available. Entropy and edge energy, together with compensated weight changes, are features of Johansson’s coloring method; see [6] Sections 2 and 6–8. Here the adjustment operations act on the graph of list entries. Entries in a single list need not evolve independently; the bound on the number of entries from each part in an operation will supply the concentration needed for a simultaneous update.

Fix $r gt.eq 4$ and let $B = B \( r \)$ be the constant in Lemma 3. Choose

#[#set math.equation(numbering: n => "(4.1)")
 $ K = 16 \( B + 2 \) \, #h(2em) gamma = 0.003 \, #h(2em) C = frac(100 K, gamma) \, #h(2em) k = ⌈frac(C Delta, log Delta)⌉ . $ <eq:round-constants>]

We prove Theorem 1 with $C_r = C$. Restrict each list to exactly $k$ entries, restricting the matchings accordingly, and continue to write $L \( v \)$ for the resulting lists. For sufficiently large $Delta$ we have $k lt.eq Delta$. Throughout the coloring process, $Delta$ denotes the maximum degree of the original graph. Set

#[#set math.equation(numbering: n => "(4.2)")
 $ w_(*) = K / k \, #h(2em) Lambda = 20 log Delta \, #h(2em) tau = Delta^(- 0.10) \, #h(2em) xi = Delta^(- 0.14) \, #h(2em) zeta = Delta^(- 0.15) . $ <eq:round-parameters>]

The parameter $tau$ sets the activation and adjustment rates, $xi$ is the permitted error per round, and $zeta$ is a smaller tolerance used in the concentration estimates. All asymptotic estimates below are uniform over the graphs, lists, matchings, and states satisfying the stated assumptions, with $r$ fixed. In particular, a factor $Delta^(o \( 1 \))$ in an upper bound is at most $Delta^epsilon$ for every fixed $epsilon > 0$ once $Delta$ is sufficiently large in terms of $r$ and $epsilon$. The parameters $U \, P_0$ in Lemma 3 are $Delta^(o \( 1 \))$, and $R_0 = O \( log log Delta \)$, at the value of $Lambda$ in (4.2).

Consider a proper partial correspondence coloring, and let $G'$ be the subgraph induced by its uncolored vertices. An entry at an uncolored vertex is #emph[available] if it conflicts with none of the colors already chosen at neighboring vertices. Give each entry $i in L \( v \)$, for $v in V \( G' \)$, a nonnegative weight $w_i$, requiring every positive-weight entry to be available. Let $H$ be the graph on the positive-weight entries whose edges are the forbidden pairs in the restricted matchings. Its parts are the sets $L \( v \) ∩ V \( H \)$. The map sending an entry to its host vertex is a graph homomorphism $H arrow.r G'$. A clique in $H$ has distinct hosts, so $H$ is $K_r$-free. The matching condition also implies that each entry has at most one neighbor in any part. These are precisely the structural assumptions of Lemma 3.

Use $s_i \, d_i \, t_i$ for the neighborhood, incident-edge, and triangle weights in that lemma, calculated in $H$. We maintain

#[#set math.equation(numbering: n => "(4.3)")
 $ Delta^(- 3) lt.eq w_i lt.eq Delta^(- 0.99) \, #h(2em) s_i lt.eq Lambda quad \( i in V \( H \) \) . $ <eq:weight-bounds>]

For $v in V \( G' \)$ and $v u in E \( G' \)$, define

#[#set math.equation(numbering: n => "(4.4)")
 $ W_v & = sum_(i in L \( v \)) w_i \,\
D_(v u) & = sum_(i in L \( v \) \, med l in L \( u \)\
i l in E \( H \)) w_i w_l \, & D_v & = sum_(u in N_(G') \( v \)) D_(v u) \,\
F_v & = sum_(i in L \( v \)) w_(*) f \( w_i \/ w_(*) \) + gamma log Delta thin \( K - W_v \) + D_v . $ <eq:vertex-potentials>]

The entropy sum includes zero-weight entries, using $f \( 0 \) = 1$. Both that sum and $D_v$ are nonnegative, and $D_v = sum_(i in L \( v \) ∩ V \( H \)) d_i lt.eq Lambda W_v$. Thus an upper bound on $F_v$ prevents the total weight $W_v$ from becoming too small, while coloring neighbors decreases its edge term.

Initially, color no vertices and give every entry weight $w_(*)$. Since $w_(*) = Theta \( log Delta \/ Delta \)$ and $s_i lt.eq Delta w_(*) lt.eq \( K \/ C \) log Delta$, the bounds (4.3) hold. Moreover,

#[#set math.equation(numbering: n => "(4.5)")
 $ W_v = K \, #h(2em) F_v = D_v lt.eq frac(K^2 Delta, k) lt.eq K^2 / C log Delta . $ <eq:initial-state>]

The following proposition is the step we shall iterate.

#thm([Proposition 4.1.])[
  (One coloring round).  #emph[For all sufficiently large $Delta$ depending only on $r$, suppose that a proper partial correspondence coloring and entry weights satisfy availability, (4.3), and 
#[#set math.equation(numbering: n => "(4.6)")
 $ K \/ 2 lt.eq W_v lt.eq 2 K #h(2em) \( v in V \( G' \) \) . $ <eq:mass-window>]

 There is an extension of the partial coloring and a choice of weights on the remaining entries that preserve availability and (4.3), and satisfy 
#[#set math.equation(numbering: n => "(4.7)")
 $ W_v^(upright("new")) lt.eq W_v + xi \, #h(2em) F_v^(upright("new")) lt.eq F_v + xi \, #h(2em) frac(deg_(upright("new")) \( v \), Delta) lt.eq \( 1 - tau \) frac(deg_(G') \( v \), Delta) + xi $ <eq:round-conclusions>]

 for every vertex $v$ that remains uncolored.]
] <prop:one-round>

=== 4.1 The random update and its expectation <the-random-update-and-its-expectation>

Assume the hypotheses of Proposition 10; the case $V \( G' \) = diameter$ is immediate. Fix the operations and rates $a_j$ given by Lemma 3 on $H$, with listed supports $J_j$. We use two families of mutually independent Bernoulli flags. For each entry $z in V \( H \)$ an #emph[activation flag] is set with probability $tau w_z$; it touches every neighbor of $z$ in $H$, with designated multiplier zero there. For each operation $j$ its flag is set with probability $tau a_j$ and touches $J_j$. A multiplier operation has its prescribed multipliers $m_i^(\( j \))$ on $J_j$, and a drop has designated multiplier zero on its singleton support. The probabilities are valid for large $Delta$: the nonempty support and rate bound of Lemma 3 give $a_j lt.eq Lambda^4$.

For each $i in V \( H \)$ put $macron(w)_i = w_i Y_i$. If exactly one set flag touches $i$, let $Y_i$ be its designated multiplier; if at least two set flags touch $i$, let $Y_i = 0$. If no set flag touches $i$, put

#[#set math.equation(numbering: n => "(4.8)")
 $ Y_i = 1 + tau (s_i + sum_(j in cal(M)) a_j \( 1 - m_i^(\( j \)) \)) \, $ <eq:no-flag-multiplier>]

where $cal(M)$ indexes the multiplier operations and their multipliers are extended by $1$ off the listed supports. Zero-weight entries stay at zero. The coefficient of $tau$ in (4.8) has absolute value at most $Lambda + Lambda^4 \( 1 + U \)$. The no-flag multiplier is therefore positive and is $1 + O \( tau Delta^(o \( 1 \)) \)$.

An entry #emph[activates] when its activation flag is set. An activating entry is #emph[successful] if none of its neighbors in $H$ activates. At every host with a successful entry, choose one such entry as its color, using any fixed order on that list to break ties. Successful entries cannot be adjacent in $H$, and they were available before the round, so this extends the proper partial coloring. Every entry conflicting with a newly chosen color is touched by its activation flag and hence has provisional weight zero, whether or not other flags also touch it. Consequently, after newly colored vertices are removed, all remaining positive provisional weights are available. The set of hosts receiving a color depends only on activation flags, independently of the choices among successful entries.

Until that removal, a bar on any quantity in (4.4) means that it is calculated with the provisional weights on the entire start-of-round graph $G'$. We may continue to use $E \( H \)$ in these sums because zero weights remain zero. The compensation in (4.8) cancels the first-order mean loss from activations and multiplier operations. The following estimate shows how the adjustment lemma controls the remaining cost in the potential.

#thm([Lemma 4.2.])[
  (Expected changes).  #emph[For the random update just defined, 
#[#set math.equation(numbering: n => "(4.9)")
 $ bb(E) macron(W)_v & lt.eq W_v + o \( xi \) \,\
bb(E) macron(F)_v & lt.eq F_v + tau \( B + 1 \) D_v + o \( xi \) \,\
bb(E) macron(D)_(v u) & gt.eq 1 / 2 D_(v u) #h(2em) \( v u in E \( G' \) \) . $ <eq:round-expectations>]

]
] <lem:round-expectation>

#proof[
  Let $a_i^(-)$ be the sum of the rates of drops at $i$. Expanding according to the set flags touching one or two entries gives the following identities, with $i l in E \( H \)$ in the last line:
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E) \( Y_i - 1 \) & = - tau a_i^(-) + O \( tau^2 Delta^(o \( 1 \)) \) \,\
bb(E) f \( Y_i \) & = tau (s_i + a_i^(-) + sum_(j in cal(M)) a_j f \( m_i^(\( j \)) \)) + O \( tau^2 Delta^(o \( 1 \)) \) \,\
bb(E) \[ \( Y_i - 1 \) \( Y_l - 1 \) \] & = tau sum_(z in N_H \( i \) ∩ N_H \( l \)) w_z\
 & quad + tau sum_(j in cal(M)) a_j \( m_i^(\( j \)) - 1 \) \( m_l^(\( j \)) - 1 \) + O \( tau^2 Delta^(o \( 1 \)) \) . $ <eq:multiplier-moments>]
  Here is a justification of the errors and the first-order terms. The sum of the probabilities of flags touching either of two fixed entries is at most $2 tau \( Lambda + Lambda^4 \)$. Independence bounds both the probability of two or more such flags and the total error in replacing the exact single-flag probabilities by their marginal probabilities by $O \( tau^2 Delta^(o \( 1 \)) \)$. All multipliers and their $f$-values are $Delta^(o \( 1 \))$, so these errors remain of the stated order. For the first line, the single flags contribute $- s_i - a_i^(-) + sum_(j in cal(M)) a_j \( m_i^(\( j \)) - 1 \)$ to the coefficient of $tau$; (4.8) cancels all but $- a_i^(-)$. For the second line, use $f \( 0 \) = 1$ and $f \( 1 + h \) = O \( h^2 \)$ at the no-flag value. For the third line, only flags touching both entries contribute to first order. These are common-neighbor activations and shared multiplier flags. A singleton drop cannot touch both endpoints, and a flag touching only one endpoint has an additional factor $O \( tau Delta^(o \( 1 \)) \)$ from the other endpoint.
  For every $i in V \( H \)$, including when $Y_i = 0$, the entropy identity is
  #[#set math.equation(numbering: n => "(4.11)")
   $ w_(*) #scale(x: 120%, y: 120%)[\[] f \( w_i Y_i \/ w_(*) \) - f \( w_i \/ w_(*) \) #scale(x: 120%, y: 120%)[\]] = w_i log \( w_i \/ w_(*) \) \( Y_i - 1 \) + w_i f \( Y_i \) . $ <eq:entropy-change>]
  Allocate the change in $F_v$ to its positive-weight entries. The contribution of $i in L \( v \) ∩ V \( H \)$ is
  #[#set math.equation(numbering: n => "(4.12)")
   $ w_i #scale(x: 120%, y: 120%)[\[] \( log \( w_i \/ w_(*) \) - gamma log Delta \) \( Y_i - 1 \) + f \( Y_i \) #scale(x: 120%, y: 120%)[\]] + sum_(l in N_H \( i \)) w_i w_l \( Y_i Y_l - 1 \) . $ <eq:entry-potential-change>]
  Its expectation is at most
  #[#set math.equation(numbering: n => "(4.13)")
   $ tau (d_i + t_i + sum_j a_j g_i^(\( j \))) + O #scale(x: 120%, y: 120%)[\(] \( w_i + d_i \) tau^2 Delta^(o \( 1 \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:entry-expected-change>]
  Indeed, (4.10) gives the activation terms $d_i$ from entropy and $t_i$ from edge correlations. For a multiplier operation, the compensated linear terms cancel, leaving exactly $w_i f \( m_i^(\( j \)) \)$ and the quadratic edge terms that define $g_i^(\( j \))$. A drop at $i$ contributes $w_i \( 1 - log \( w_i \/ w_(*) \) + gamma log Delta \) lt.eq Lambda w_i$ to the non-edge part and $- d_i$ to the edge part. A drop at a neighbor $l$ contributes $- w_i w_l$. These are bounded by the drop vector in Lemma 3. Finally, $\| log \( w_i \/ w_(*) \) \| = O \( log Delta \)$ by (4.3); absorbing these logarithms gives the error in (4.13).
  Sum (4.13) over $L \( v \) ∩ V \( H \)$ and use $t_i + sum_j a_j g_i^(\( j \)) lt.eq B d_i$. Since $D_v lt.eq Lambda W_v$ and $W_v lt.eq 2 K$, the total error is $O \( \( W_v + D_v \) tau^2 Delta^(o \( 1 \)) \) = o \( xi \)$. This proves the potential estimate. The first line of (4.10) proves the mass estimate. For each edge $i l$ in the sum defining $D_(v u)$, the probability that neither endpoint is touched by a set flag is $1 - O \( tau Delta^(o \( 1 \)) \)$; on this event, $Y_i Y_l = 1 + O \( tau Delta^(o \( 1 \)) \)$. Nonnegativity on the other events therefore gives $bb(E) \( w_i w_l Y_i Y_l \) gt.eq w_i w_l \/ 2$ for large $Delta$. Summing proves the last assertion. ◻
]

=== 4.2 Concentration with bounded input participation <concentration-with-bounded-input-participation>

We next make the expectation bounds simultaneous at all vertices. The relevant concentration principle is a bounded-variable form of the generalized Hölder inequality of Finner [16] and the read-$k$ concentration method of Gavinsky, Lovett, Saks, and Srinivasan [17]. We give the short proof, including the exponential-moment estimate of Hoeffding [18].

#thm([Lemma 4.3.])[
  (Bounded input participation).  #emph[Let $X_1 \, dots.h \, X_m$ be bounded real functions of finitely many independent inputs. Suppose that $X_j$ has range of length at most $b_j$, and that each input is used by at most $p$ of the functions, where $p gt.eq 1$ is real. If $sum_j b_j^2 > 0$, then for every $a > 0$, 
#[#set math.equation(numbering: n => "(4.14)")
 $ bb(P) (sum_j \( X_j - bb(E) X_j \) gt.eq a) \, quad bb(P) (sum_j \( X_j - bb(E) X_j \) lt.eq - a) med lt.eq med exp (- frac(2 a^2, p sum_j b_j^2)) . $ <eq:input-concentration>]

 If $sum_j b_j^2 = 0$, both probabilities are zero.]
] <lem:read-concentration>

#proof[
  For nonnegative bounded functions $Z_j$ with the same dependence sets, we first prove
  #[#set math.equation(numbering: n => "(4.15)")
   $ bb(E) product_j Z_j lt.eq product_j \( bb(E) Z_j^p \)^(1 \/ p) . $ <eq:input-holder>]
  Induct on the number of independent inputs. Condition on all inputs except the last, and let $I$ index the functions using that last input. Hölder’s inequality with exponent $p$ for the $\| I \| lt.eq p$ factors, and with a constant factor $1$ of reciprocal exponent $1 - \| I \| \/ p$ when $\| I \| < p$, bounds this conditional integral by $product_j tilde(Z)_j$, where $tilde(Z)_j = \( bb(E)_(upright("last")) Z_j^p \)^(1 \/ p)$ for $j in I$ and $tilde(Z)_j = Z_j$ otherwise. Each $tilde(Z)_j$ uses only the remaining inputs of $Z_j$, so the participation bound still holds. The induction hypothesis applies and gives $bb(E) product_j tilde(Z)_j lt.eq product_j \( bb(E) tilde(Z)_j^p \)^(1 \/ p) = product_j \( bb(E) Z_j^p \)^(1 \/ p)$, proving (4.15).
  If a random variable $X$ has range of length $b$, then
  #[#set math.equation(numbering: n => "(4.16)")
   $ log bb(E) e^(s \( X - bb(E) X \)) lt.eq frac(s^2 b^2, 8) #h(2em) \( s in bb(R) \) . $ <eq:hoeffding-moment>]
  To see this, the second derivative of the logarithm on the left is the variance under the exponentially tilted law. Any law supported on an interval of length $b$ has variance at most $b^2 \/ 4$, by measuring squared distance from the midpoint. The logarithm and its first derivative vanish at zero, which proves (4.16). Apply (4.15) to $Z_j = e^(s \( X_j - bb(E) X_j \))$ and then (4.16) with parameter $p s$. The resulting moment bound is $exp \( p s^2 sum_j b_j^2 \/ 8 \)$. Exponential Markov with $s = 4 a \/ \( p sum_j b_j^2 \)$ proves the upper tail; replacing $X_j$ by $- X_j$ proves the lower tail. ◻
]

Apply Lemma 12 first to $macron(W)_v$ and to the non-edge part $macron(F)_v - macron(D)_v$. Apart from an additive constant, each is a sum of at most $k lt.eq Delta$ functions, one for each entry of $L \( v \)$, of range length at most $Delta^(- 0.99 + o \( 1 \))$. This follows from (4.3), (4.8), and $U = Delta^(o \( 1 \))$; the logarithmic factors in the entropy term are absorbed in $Delta^(o \( 1 \))$. This also covers arbitrarily small positive provisional weights: with $0 log 0 = 0$, $sup_(0 lt.eq z lt.eq b) \| z log z \| = b log \( 1 \/ b \)$ for $0 < b < e^(- 1)$. A multiplier flag occurs in at most $P_0$ of these functions, by its support bound in a single part. A drop flag occurs in at most one, and an activation flag occurs in at most one because its activating entry has at most one neighbor in $L \( v \)$. Thus $p = P_0$ is valid. In particular, each requirement

#[#set math.equation(numbering: n => "(4.17)")
 $ macron(W)_v lt.eq bb(E) macron(W)_v + zeta \, #h(2em) macron(F)_v - macron(D)_v lt.eq bb(E) \( macron(F)_v - macron(D)_v \) + zeta $ <eq:vertex-concentration>]

fails with probability at most $exp \( - Delta^0.5 \)$ for large $Delta$: the exponent in (4.14) is at least $Delta^(0.68 - o \( 1 \))$.

For an edge $v u in E \( G' \)$, the matching sum $macron(D)_(v u)$ has at most $k$ terms, each of range length at most $Delta^(- 1.98 + o \( 1 \))$. Every entry at either endpoint occurs in at most one term, so each flag occurs in at most $2 P_0$ terms. Applying Lemma 12 with $p = 2 P_0$ shows that

#[#set math.equation(numbering: n => "(4.18)")
 $ \| macron(D)_(v u) - bb(E) macron(D)_(v u) \| lt.eq Delta^(- 1.25) $ <eq:matching-concentration>]

fails with probability at most $2 exp \( - Delta^0.4 \)$. Here the exponent is at least $Delta^(0.46 - o \( 1 \))$. This separation into non-edge terms and individual matching sums is what permits the participation bound to apply; no independence among entries of a list is assumed.

For ordinary list coloring, operations can instead be chosen separately in each graph induced by one common color label. Sampling their flags independently makes contributions of distinct colors independent, so the corresponding concentration bound has $p = 1$. Arbitrary edge matchings provide no such common labels; the per-part support bound replaces that independence here.

=== 4.3 Activations that produce colors <activations-that-produce-colors>

The expectation estimate allows a potential increase of order $tau D_v$. To offset it, we must show that enough neighbors receive colors, with their contributions measured both by $D_(v u)$ and by $1 \/ Delta$. Fix $v in V \( G' \)$, and take one of the coefficient families

#[#set math.equation(numbering: n => "(4.19)")
 $ b_u = D_(v u) quad \( u in N_(G') \( v \) \) \, #h(2em) upright("or") #h(2em) b_u = 1 \/ Delta quad \( u in N_(G') \( v \) \) . $ <eq:neighbor-coefficients>]

In either case $0 lt.eq b_u lt.eq 2 K Delta^(- 0.99)$: for the first family, the matching property gives $D_(v u) lt.eq Delta^(- 0.99) W_v$. Let $A_u$ indicate that some entry at $u$ activates. These indicators are independent over the hosts $u$, and

#[#set math.equation(numbering: n => "(4.20)")
 $ bb(P) \( A_u = 1 \) gt.eq 1 - e^(- tau W_u) gt.eq tau K \/ 4 $ <eq:host-activation-probability>]

for large $Delta$, since $K \/ 2 lt.eq W_u lt.eq 2 K$. Lemma 12 with $p = 1$ and $sum_u b_u^2 lt.eq 4 K^2 Delta^(- 0.98)$ gives

#[#set math.equation(numbering: n => "(4.21)")
 $ sum_(u in N_(G') \( v \)) b_u A_u gt.eq frac(tau K, 4) sum_(u in N_(G') \( v \)) b_u - zeta $ <eq:activated-neighbor-mass>]

except with probability at most $exp \( - Delta^0.5 \)$. The next lemma bounds the loss caused by conflicting activations.

#thm([Lemma 4.4.])[
  (Collision bound).  #emph[Let $cal(E)_v$ be the set of edges of $H$ with an endpoint hosted at a neighbor of $v$ in $G'$, and let $X_v$ count the edges of $cal(E)_v$ whose two endpoints activate. Then 
#[#set math.equation(numbering: n => "(4.22)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] 4 K Delta^(- 0.99) X_v > zeta #scale(x: 120%, y: 120%)[\)] lt.eq O \( Delta^3 \) e^(e - 1 - Delta^0.01) + e^(- Delta^0.8) . $ <eq:collision-tail>]

 For either coefficient family in (4.19), the sum of $b_u$ over hosts $u$ counted by $A_u$ that receive no color is at most $4 K Delta^(- 0.99) X_v$.]
] <lem:activation-collisions>

#proof[
  A host with an activating entry but no successful entry contains an endpoint of an edge counted by $X_v$. Each such edge has at most two hosts and each coefficient is at most $2 K Delta^(- 0.99)$, proving the final assertion. Moreover,
  #[#set math.equation(numbering: n => "(4.23)")
   $ mu_v := bb(E) X_v lt.eq tau^2 sum_(u in N_(G') \( v \)) sum_(i in L \( u \) ∩ V \( H \)) w_i s_i lt.eq 2 K Delta tau^2 Lambda = Delta^(0.80 + o \( 1 \)) . $ <eq:collision-expectation>]
  For a possible endpoint $i$ of an edge in $cal(E)_v$, the number of its activating neighbors is a sum of independent indicators of total mean $tau s_i lt.eq tau Lambda lt.eq 1$. Its exponential moment at parameter $1$ is at most $exp \( e - 1 \)$, so it exceeds $Delta^0.01$ with probability at most $exp \( e - 1 - Delta^0.01 \)$. All possible endpoints are hosted within distance two of $v$ in $G'$, and there are at most $k lt.eq Delta$ entries at each host. A union bound over $O \( Delta^3 \)$ endpoints shows that, apart from the first error term in (4.22), the graph formed by the edges counted by $X_v$ has maximum degree at most $Delta^0.01$.
  If $4 K Delta^(- 0.99) X_v > zeta$, then $X_v > Delta^0.84 \/ \( 4 K \)$. In a graph of maximum degree at most $Delta^0.01$, greedy selection of disjoint edges produces a matching of size at least $X_v \/ \( 2 Delta^0.01 \)$. For large $Delta$ this is at least $m = ceil.l Delta^0.82 ceil.r$. For $e = i l in cal(E)_v$ write $q_e = tau^2 w_i w_l$. The events that both endpoints activate are independent along any matching, because its edges have disjoint endpoints and the activation flags are independent. Consequently,
  #[#set math.equation(numbering: n => "(4.24)")
   $ bb(P) vec(upright("some size-") m upright(" matching in ") cal(E)_v, upright("has all endpoints activating")) & lt.eq sum_(M subset.eq cal(E)_v\
M upright(" matching") \, med \| M \| = m) product_(e in M) q_e\
 & lt.eq frac(\( sum_(e in cal(E)_v) q_e \)^m, m !) = frac(mu_v^m, m !) lt.eq (frac(e mu_v, m))^m lt.eq e^(- Delta^0.8) . $ <eq:collision-matching-tail>]
  The second inequality follows by expanding the power: each matching appears $m !$ times, and all other terms are nonnegative. The final inequality uses (4.23) and $m = Delta^(0.82 + o \( 1 \))$; it is immediate if $mu_v = 0$. Combining the two exceptional events proves the lemma. ◻
]

Together, (4.21) and Lemma 13 imply that, for either choice in (4.19), we may require

#[#set math.equation(numbering: n => "(4.25)")
 $ sum_(u in N_(G') \( v \)\
u upright(" receives a color")) b_u gt.eq frac(tau K, 4) sum_(u in N_(G') \( v \)) b_u - 2 zeta . $ <eq:colored-neighbor-mass>]

Let $E_v$ be the event that (4.17), (4.18) for an edge incident with $v$, or (4.25) for one of the two coefficient families fails. A union bound gives, for all sufficiently large $Delta$,

#[#set math.equation(numbering: n => "(4.26)")
 $ bb(P) \( E_v \) lt.eq exp \( - Delta^0.005 \) . $ <eq:round-failure-probability>]

=== 4.4 Simultaneous bounds and restoration of the weight conditions <simultaneous-bounds-and-restoration-of-the-weight-conditions>

We use the Lovász local lemma [14] to avoid every $E_v$. Assign each multiplier flag to the host of a chosen center of a radius-$R_0$ ball in $H$ containing its listed support. Assign activation and drop flags to the hosts of the activating and dropped entries, respectively. Every input determining $E_v$ is assigned within distance $R_0 + 3$ of $v$ in $G'$. Indeed, the host projection does not increase distances; the provisional weights on an incident matching use flags touching entries at its two hosts; and whether a neighbor of $v$ receives a color is determined by activation flags at distance at most two from $v$. Events at distance greater than $2 \( R_0 + 3 \)$ therefore involve disjoint sets of independent inputs. A bound for the maximum degree of a dependency graph is

#[#set math.equation(numbering: n => "(4.27)")
 $ d = \( Delta + 1 \)^(2 R_0 + 10) lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( log Delta log log Delta \) #scale(x: 120%, y: 120%)[\)] . $ <eq:round-dependency-degree>]

For completeness, the symmetric local lemma says that finitely many events of probability at most $q$, with a dependency graph of maximum degree at most $d gt.eq 1$, can all be avoided if $q lt.eq 1 \/ \( e \( d + 1 \) \)$. Put $x = 1 \/ \( d + 1 \)$, so $q lt.eq x \( 1 - x \)^d$. Induction on the number of conditioned events shows that any event, conditioned on the avoidance of any set of the others, has probability at most $x$. To make the induction step, split the conditioning set into nonneighbors and at most $d$ neighbors of the event. Independence bounds the numerator after conditioning on the nonneighbors by $q$, and the induction hypothesis bounds the probability of avoiding the neighbors, under that conditioning, below by $\( 1 - x \)^d$. The same induction ensures that all conditioning probabilities are positive. Multiplying these positive conditional avoidance probabilities proves joint avoidance. By (4.26) and (4.27), its hypothesis holds here for large $Delta$.

#proof[
  Fix a trial avoiding all $E_v$. Lemma 11, (4.17), and (4.18) summed over the edges incident with $v$ give
  #[#set math.equation(numbering: n => "(4.28)")
   $ macron(W)_v lt.eq W_v + o \( xi \) \, #h(2em) macron(F)_v lt.eq F_v + tau \( B + 1 \) D_v + o \( xi \) \, $ <eq:provisional-bounds>]
  because $zeta + Delta Delta^(- 1.25) = o \( xi \)$. Remove the vertices colored in this trial. At a remaining vertex $v$, only the edge part of its potential changes. Each removed neighbor $u$ contributes $macron(D)_(v u) gt.eq D_(v u) \/ 2 - Delta^(- 1.25)$ by (4.9) and (4.18). Using (4.25) with $b_u = D_(v u)$, the total decrease is at least
  #[#set math.equation(numbering: n => "(4.29)")
   $ sum_(u in N_(G') \( v \)\
u upright(" receives a color")) macron(D)_(v u) gt.eq frac(tau K, 8) D_v - zeta - Delta^(- 0.25) . $ <eq:potential-removal-gain>]
  Since $K \/ 8 > B + 1$, the potential after removal is at most $F_v + o \( xi \)$. The same requirement with $b_u = 1 \/ Delta$ gives the degree bound in (4.7), because $K \/ 4 gt.eq 1$ and $2 zeta = o \( xi \)$. It remains to restore (4.3) without losing the mass and potential estimates.
  To #emph[trim] an entry means to set its weight to zero. If its current positive weight is $z$, the change in the non-edge part of its host’s potential is exactly
  #[#set math.equation(numbering: n => "(4.30)")
   $ c \( z \) := z #scale(x: 120%, y: 120%)[\(] 1 - log \( z \/ w_(*) \) + gamma log Delta #scale(x: 120%, y: 120%)[\)] . $ <eq:trimming-cost>]
  First trim all entries with $z > Delta^(- 0.99)$. Their costs are nonpositive for large $Delta$, since $log \( Delta^(- 0.99) \/ w_(*) \) = 0.01 log Delta - O \( log log Delta \)$ and $gamma < 0.01$. Next trim all positive entries with $z < Delta^(- 3)$. The function $c \( z \)$ is increasing on this interval for large $Delta$ and has limit zero at zero, so each cost is at most $O \( Delta^(- 3) log Delta \)$. There are at most $k lt.eq Delta$ entries at a host, giving total cost $o \( xi \)$ there. Both trimming operations can only decrease edge terms.
  At the resulting weights, mark each positive entry $i$ with $s_i > Lambda$, and trim all marked entries simultaneously. For a marked entry of weight $z$, (4.30) is at most $Lambda z$ on the restored weight interval. To account for the edge loss without double counting, let $M$ be the marked entries and fix a host $v$. In the next identity, $H \, w_i \, s_i \, D_v$ refer to the remaining graph and weights immediately before this last trim, and $D'_v$ is the edge term after it. Then
  #[#set math.equation(numbering: n => "(4.31)")
   $ D_v - D'_v = sum_(i in M ∩ L \( v \)) w_i s_i + sum_(i in \( V \( H \) \\ M \) ∩ L \( v \)) w_i sum_(l in M ∩ N_H \( i \)) w_l gt.eq sum_(i in M ∩ L \( v \)) w_i s_i . $ <eq:simultaneous-trimming-loss>]
  Each deleted edge in $D_v$ has exactly one endpoint hosted at $v$, so it occurs in precisely one of these two sums. The first sum pays for all non-edge costs at $v$, since $w_i s_i > Lambda w_i$ for marked entries. This remains true when both ends of an edge are trimmed. This last trim does not increase any $F_v$. The unmarked entries had $s_i lt.eq Lambda$ before the trim, and deleting weights only reduces their neighborhood weights, so the remaining entries satisfy (4.3).
  All trims preserve availability and do not increase $W_v$. Combining their costs with (4.28) and (4.29) proves the mass and potential bounds in (4.7) for sufficiently large $Delta$. ◻
]

== 5 Iteration and completion <sec:completion>

We finish the proof of Theorem 1 by iterating Proposition 10. The potential keeps a fixed positive amount of weight at each remaining vertex, while the maximum remaining degree decreases to a smaller order than the number of available positive-weight entries.

#proof[
  Start from the empty partial coloring and the weights in (4.5), and set
  #[#set math.equation(numbering: n => "(5.1)")
   $ T_(*) = ⌈2 tau^(- 1) log Delta⌉ . $ <eq:number-of-rounds>]
  Perform $T_(*)$ rounds, stopping earlier if every vertex receives a color. We verify inductively that the mass assumption (4.6) remains valid. After $j lt.eq T_(*)$ completed rounds, every remaining vertex satisfies
  #[#set math.equation(numbering: n => "(5.2)")
   $ W_v lt.eq K + j xi \, #h(2em) gamma log Delta thin \( K - W_v \) lt.eq F_v lt.eq K^2 / C log Delta + j xi . $ <eq:iteration-potentials>]
  The upper bounds follow from (4.5) and (4.7); the lower bound on $F_v$ follows from the nonnegative entropy and edge terms in (4.4). Since $T_(*) xi = O \( Delta^(- 0.04) log Delta \) = o \( 1 \)$ and $C = 100 K \/ gamma$, these inequalities give
  #[#set math.equation(numbering: n => "(5.3)")
   $ K - K / 100 - frac(T_(*) xi, gamma log Delta) lt.eq W_v lt.eq K + T_(*) xi . $ <eq:iteration-mass-window>]
  For sufficiently large $Delta$, both bounds lie inside $\[ K \/ 2 \, 2 K \]$. Availability and (4.3) are preserved by the proposition, so each successive round is justified.
  If vertices remain after $T_(*)$ rounds, repeated use of the degree inequality in (4.7) gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ frac(deg_(upright("remaining")) \( v \), Delta) lt.eq \( 1 - tau \)^(T_(*)) + xi sum_(j = 0)^(T_(*) - 1) \( 1 - tau \)^j lt.eq Delta^(- 2) + xi / tau = Delta^(- 2) + Delta^(- 0.04) . $ <eq:final-degree>]
  On the other hand, the mass lower bound and the upper bound on each positive entry imply
  #[#set math.equation(numbering: n => "(5.5)")
   $ \| { i in L \( v \) : w_i > 0 } #scale(x: 120%, y: 120%)[\|] gt.eq K / 2 Delta^0.99 . $ <eq:available-entry-count>]
  For large $Delta$ this exceeds the remaining maximum degree, which is at most $Delta^(- 1) + Delta^0.96$ by (5.4). Color the remaining vertices in any order, choosing at each step a positive-weight entry compatible with the colors already chosen. Every such entry is available with respect to the partial coloring from the rounds. Each neighbor colored during this final procedure forbids at most one entry, by the matching condition. Inequality (5.5) therefore guarantees a choice at every step.
  The resulting coloring chooses one entry from each restricted list and avoids every forbidden pair, so it is also a coloring for the original lists and matchings. All lower thresholds on $Delta$ in the proof depend only on $r$. Choosing a single $Delta_r gt.eq 3$ above them, together with $C_r = C$ from (4.1), proves Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Ajtai, P.~Erdős, J.~Komlós, and E.~Szemerédi, On Turán's theorem for sparse graphs, #emph[Combinatorica] #strong[1] (1981), no.~4, 313--317. #link("https://doi.org/10.1007/BF02579451").]
#bibitem([2])[N.~Alon, M.~Krivelevich, and B.~Sudakov, Coloring graphs with sparse neighborhoods, #emph[J. Combin. Theory Ser. B] #strong[77] (1999), no.~1, 73--82. #link("https://doi.org/10.1006/jctb.1999.1910").]
#bibitem([3])[J.~Anderson, A.~Bernshteyn, and A.~Dhawan, Colouring graphs with forbidden bipartite subgraphs, #emph[Combin. Probab. Comput.] #strong[32] (2023), no.~1, 45--67. #link("https://doi.org/10.1017/S0963548322000104").]
#bibitem([4])[J.~Anderson, A.~Bernshteyn, and A.~Dhawan, Coloring graphs with forbidden almost bipartite subgraphs, #emph[Random Structures Algorithms] #strong[66] (2025), no.~4, e70012. #link("https://doi.org/10.1002/rsa.70012").]
#bibitem([5])[O.~Angel and Y.~Spinka, #emph[Pairwise optimal coupling of multiple random variables], arXiv:1903.00632 (2019), revised 2021. #link("https://arxiv.org/abs/1903.00632").]
#bibitem([6])[N.~Bansal, A.~Gupta, and G.~Guruganesh, On the Lovász theta function for independent sets in sparse graphs, #emph[SIAM J. Comput.] #strong[47] (2018), no.~3, 1039--1055. #link("https://doi.org/10.1137/15M1051002"). Extended version: #link("https://arxiv.org/abs/1504.04767").]
#bibitem([7])[I.~Benjamini, H.~Duminil-Copin, G.~Kozma, and A.~Yadin, Disorder, entropy and harmonic functions, #emph[Ann. Probab.] #strong[43] (2015), no.~5, 2332--2373. #link("https://doi.org/10.1214/14-AOP934").]
#bibitem([8])[A.~Bernshteyn, The asymptotic behavior of the correspondence chromatic number, #emph[Discrete Math.] #strong[339] (2016), no.~11, 2680--2692. #link("https://doi.org/10.1016/j.disc.2016.05.012").]
#bibitem([9])[A.~Bernshteyn, The Johansson--Molloy theorem for DP-coloring, #emph[Random Structures Algorithms] #strong[54] (2019), no.~4, 653--664. #link("https://doi.org/10.1002/rsa.20811").]
#bibitem([10])[B.~Bollobás, Chromatic number, girth and maximal degree, #emph[Discrete Math.] #strong[24] (1978), no.~3, 311--314. #link("https://doi.org/10.1016/0012-365X(78)90102-4").]
#bibitem([11])[E.~Davies, R.~J.~Kang, F.~Pirot, and J.-S.~Sereni, #emph[Graph structure via local occupancy], arXiv:2003.14361 (2020). #link("https://arxiv.org/abs/2003.14361").]
#bibitem([12])[A.~Dhawan, O.~Janzer, and A.~Methuku, #emph[Independent sets and colorings of $K_(t \, t \, t)$-free graphs], arXiv:2511.17191 (2025), version~2. #link("https://arxiv.org/abs/2511.17191").]
#bibitem([13])[Z.~Dvořák and L.~Postle, Correspondence coloring and its application to list-coloring planar graphs without cycles of lengths 4 to 8, #emph[J. Combin. Theory Ser. B] #strong[129] (2018), 38--54. #link("https://doi.org/10.1016/j.jctb.2017.09.001").]
#bibitem([14])[P.~Erdős and L.~Lovász, Problems and results on $3$-chromatic hypergraphs and some related questions, in #emph[Infinite and Finite Sets], Vol.~II, Colloq. Math. Soc. János Bolyai #strong[10], North-Holland, Amsterdam, 1975, pp.~609--627. #link("https://www.renyi.hu/~p_erdos/1975-34.pdf").]
#bibitem([15])[P.~Erdős, A.~L.~Rubin, and H.~Taylor, Choosability in graphs, in #emph[Proceedings of the West Coast Conference on Combinatorics, Graph Theory and Computing] (Arcata, California, 1979), Congr. Numer. #strong[26], Utilitas Math., Winnipeg, 1980, pp.~125--157. #link("https://www.renyi.hu/~p_erdos/1980-07.pdf").]
#bibitem([16])[H.~Finner, A generalization of Hölder's inequality and some probability inequalities, #emph[Ann. Probab.] #strong[20] (1992), no.~4, 1893--1901. #link("https://doi.org/10.1214/aop/1176989534").]
#bibitem([17])[D.~Gavinsky, S.~Lovett, M.~Saks, and S.~Srinivasan, A tail bound for read-$k$ families of functions, #emph[Random Structures Algorithms] #strong[47] (2015), no.~1, 99--108. #link("https://doi.org/10.1002/rsa.20532").]
#bibitem([18])[W.~Hoeffding, Probability inequalities for sums of bounded random variables, #emph[J. Amer. Statist. Assoc.] #strong[58] (1963), no.~301, 13--30. #link("https://doi.org/10.1080/01621459.1963.10500830").]
#bibitem([19])[J.~H.~Kim, On Brooks' theorem for sparse graphs, #emph[Combin. Probab. Comput.] #strong[4] (1995), no.~2, 97--132. #link("https://doi.org/10.1017/S0963548300001528").]
#bibitem([20])[M.~Molloy, The list chromatic number of graphs with small clique number, #emph[J. Combin. Theory Ser. B] #strong[134] (2019), 264--284. #link("https://doi.org/10.1016/j.jctb.2018.06.007").]
#bibitem([21])[M.~Molloy and B.~Reed, #emph[Graph Colouring and the Probabilistic Method], Algorithms and Combinatorics #strong[23], Springer, Berlin, 2002. #link("https://doi.org/10.1007/978-3-642-04016-0").]
#bibitem([22])[OpenAI, #emph[A logarithmic independence bound for clique-free graphs], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/A-Logarithmic-Independence-Bound-for-Clique-Free-Graphs-September-25-2026/paper.pdf")[OAI:A-Logarithmic-Independence-Bound-for-Clique-Free-Graphs-September-25-2026], 2026.]
#bibitem([23])[J.~Przybyło, On triangle-free list assignments, #emph[Discrete Math.] #strong[347] (2024), no.~2, 113779. #link("https://doi.org/10.1016/j.disc.2023.113779").]
#bibitem([24])[J.~B.~Shearer, A note on the independence number of triangle-free graphs, #emph[Discrete Math.] #strong[46] (1983), no.~1, 83--87. #link("https://doi.org/10.1016/0012-365X(83)90273-X").]
#bibitem([25])[J.~B.~Shearer, On the independence number of sparse graphs, #emph[Random Structures Algorithms] #strong[7] (1995), no.~3, 269--271. #link("https://doi.org/10.1002/rsa.3240070305").]
#bibitem([26])[V.~G.~Vizing, Vertex colorings with given colors (Russian), #emph[Diskret. Analiz.] #strong[29] (1976), 3--10.]
#bibitem([27])[V.~H.~Vu, A general upper bound on the list chromatic number of locally sparse graphs, #emph[Combin. Probab. Comput.] #strong[11] (2002), no.~1, 103--111. #link("https://doi.org/10.1017/S0963548301004898").]


