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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to Hadwiger's conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

0pt

== 1 Introduction <sec:introduction>

For a finite graph $G$, write $alpha \( G \)$, $chi \( G \)$, and $h \( G \)$ for its independence number, chromatic number, and Hadwiger number. Thus $h \( G \)$ is the largest $t$ for which $G$ contains a $K_t$ minor.

Hadwiger’s conjecture, formulated in 1943 #cite(label("hadwiger1943")), asserts that $h \( G \) gt.eq chi \( G \)$ for every finite nonempty simple graph $G$. We disprove it using graphs of independence number at most two.

Two disjoint edges are #emph[touching] if an edge joins their endpoint sets. A #emph[connected matching] is a matching whose edges are pairwise touching; write $"cm" \( G \)$ for its maximum size. The word connected in this definition requires adjacency of every pair of matching edges.

Our main result is the following.

#thm([Theorem 1.1.])[
  #emph[There are arbitrarily large integers $m$ for which an $m$-vertex finite simple graph $G$ satisfies 
$ alpha \( G \) lt.eq 2 #h(2em) upright("and") #h(2em) "cm" \( G \) < m / 100 . $

]
] <thm:main>

A complete minor with many singleton or two-vertex branch sets gives a large connected matching. The precise counting inequality, proved in 10, is

$ h \( G \) lt.eq frac(\| V \( G \) \| + 4 "cm" \( G \) + 2, 3) . $

Every color class has size at most $alpha \( G \)$, so $chi \( G \) gt.eq \| V \( G \) \| \/ alpha \( G \)$. The same lower bound holds for fractional coloring, giving a second consequence of the construction. For a finite nonempty simple graph $G$, let $cal(I) \( G \)$ be the family of its independent vertex sets. A fractional coloring assigns a nonnegative real weight $w_I$ to every $I in cal(I) \( G \)$ such that $sum_(I in.rev v) w_I gt.eq 1$ for every vertex $v$. The ordinary fractional chromatic number $chi_f \( G \)$ is the minimum of $sum_I w_I$ over these assignments. An ordinary coloring gives a fractional coloring with unit weights on its color classes, so $chi_f \( G \) lt.eq chi \( G \)$.

#thm([Corollary 1.2.])[
  #emph[ There are finite nonempty simple graphs $G$ of arbitrarily large order $m$ for which 
$ h \( G \) < frac(26 m, 75) + 2 / 3 < m / 2 lt.eq chi_f \( G \) lt.eq chi \( G \) . $

 Thus Hadwiger’s conjecture and its fractional-coloring weakening $chi_f \( G \) lt.eq h \( G \)$ are false.]
] <cor:hadwiger>

#proof[
  Summing the vertex constraints of any fractional coloring gives
  $ \| V \( G \) \| lt.eq sum_(I in cal(I) \( G \)) \| I \| w_I lt.eq alpha \( G \) sum_(I in cal(I) \( G \)) w_I . $
  Hence $chi_f \( G \) gt.eq \| V \( G \) \| \/ alpha \( G \)$. Apply 1 and the minor bound above, noting that $26 m \/ 75 + 2 \/ 3 < m \/ 2$ for $m gt.eq 5$. ◻
]

#cite(label("reedseymour1998"), form: "prose") p. 148 discussed the weakening that, for every positive integer $p$, a graph with no $K_(p + 1)$ minor should have a fractional $p$-coloring, and proved the corresponding $2 p$-bound in their result (1.3). Their convention uses nonnegative rational weights, coverage exactly one at each vertex, and total weight at most $p$, so every such coloring is admissible above. Taking $p = h \( G \)$ in the corollary therefore disproves this prediction as well. The relaxation is on the coloring side; $h \( G \)$ remains the ordinary clique-minor number.

=== 1.1 Historical context <historical-context>

Hadwiger’s conjecture places planar coloring in a broader minor-theoretic setting. The $K_4$-minor-free case was proved independently by Hadwiger #cite(label("hadwiger1943")) and Dirac #cite(label("Dirac1952")). Wagner’s structure theorem #cite(label("Wagner1937")) makes the four-colorability of graphs without a $K_5$ minor equivalent to the Four-Color Theorem, proved by Appel and Haken, with Koch contributing to the reducibility part #cite(label("AppelHaken1977")) #cite(label("AppelHakenKoch1977")). Robertson, Seymour, and Thomas #cite(label("RobertsonSeymourThomas1993")) proved that every graph without a $K_6$ minor is five-colorable, by reducing the obstruction to a graph that becomes planar after one vertex is removed. These results explain the conjecture’s link between coloring and the structure of minor-closed classes.

For general $t$, the density bounds of Kostochka #cite(label("Kostochka1984")) and Thomason #cite(label("Thomason1984")) give $O \( t sqrt(log t) \)$-colorability for graphs with no $K_t$ minor. Norin, Postle, and Song #cite(label("NorinPostleSong2023")) Theorem 1.4 broke this degeneracy barrier, obtaining $O \( t \( log t \)^beta \)$ colors for every fixed $beta > 1 \/ 4$. Delcourt and Postle #cite(label("DelcourtPostle2025")) Theorem 1.5 reduced the bound to $O \( t log log t \)$. A recent preprint of Liu and Luo #cite(label("LiuLuo2026")) Theorem 1.1 further gives $O \( t log log log t \)$-colorability.

The restriction of Hadwiger’s conjecture to graphs of independence number at most two has an equivalent formulation: every such graph on $m$ vertices should have a $K_(ceil.l m \/ 2 ceil.r)$ minor. Plummer, Stiebitz, and Toft #cite(label("pst2003")) Theorem 3.1 proved equivalence between the restricted conjecture and this universally quantified minor assertion. This identifies the case $alpha \( G \) lt.eq 2$ as a setting in which chromatic number can be replaced by an explicit fraction of the order.

Duchet and Meyniel #cite(label("duchet1982")) proved the general lower bound $h \( G \) gt.eq \| V \( G \) \| \/ \( 2 alpha \( G \) - 1 \)$, giving $h \( G \) gt.eq m \/ 3$ when $alpha \( G \) = 2$. Blasiak #cite(label("Blasiak2007")) obtained complete-minor models of order $Omega \( m^(4 \/ 5) \)$ using only singleton and edge branch sets. Fox #cite(label("fox2010")) Theorem 2 strengthened the $m \/ 3$ bound to

$ h \( G \) gt.eq m / 3 + c thin m^(4 \/ 5) \( log m \)^(1 \/ 5) $

for an absolute constant $c > 0$. His Theorem 3 also yields a connected matching of size $Omega \( m^(4 \/ 5) \( log m \)^(1 \/ 5) \)$, since its alternative clique of the same order can be paired. These bounds describe the quantitative background to the fixed linear upper bounds in Theorem 1.1, Corollary 1.2.

Füredi, Gyárfás, and Simonyi #cite(label("fgs2005")) proposed the sharp connected-matching conjecture: a graph with independence number two and order $4 t - 1$ has a connected matching of size $t$. They verified the assertion through $t = 17$, and Chen and Deng #cite(label("ChenDeng2025")) extended this range to $t = 22$. Cambie #cite(label("cambie2021")) Theorem 1.5 proved that Hadwiger’s conjecture implies this statement. The graphs in 1 also disprove the sharp connected-matching conjecture: delete at most three vertices to obtain order $4 t - 1$; the connected-matching number does not increase and remains below $t$ for sufficiently large orders. The remaining graph has independence number exactly two, since a complete graph of order $4 t - 1$ has a connected matching of size $2 t - 1$.

Substantial positive results also come from additional clique structure. Chudnovsky and Seymour #cite(label("ChudnovskySeymour2012")) Theorem 1.3 proved that an $m$-vertex graph with independence number at most two has a $K_(ceil.l m \/ 2 ceil.r)$ minor whenever its clique number is at least $m \/ 4$ for even $m$, or at least $\( m + 3 \) \/ 4$ for odd $m$. Their method packs induced three-vertex paths. Norin and Seymour #cite(label("NorinSeymour2026")) Theorem 1.2 subsequently combined this structure with random pairing to obtain minors of order $chi \( G \)$ and edge density at least $gamma - o \( 1 \)$, where $gamma = 0.986882 dots.h$ is a fixed constant. These results highlight the requirement in a complete-minor model: every pair of branch sets must be joined, whereas high density permits missing adjacencies.

A weaker conjecture asks only for some absolute $c_0 > 0$ such that $"cm" \( G \) gt.eq c_0 \| V \( G \) \|$ for all sufficiently large graphs with $alpha \( G \) lt.eq 2$ #cite(label("fgs2005")). Yip #cite(label("yip2025")) Theorem 7 proved a dense variant: a matching of linear size can have the proportion of its non-touching edge pairs made arbitrarily small, with the linear coefficient depending on the prescribed proportion. That statement allows such pairs to remain. The fixed coefficient in 1 leaves the weaker conjecture for smaller positive coefficients unresolved; it does not assert $"cm" \( G \) = o \( \| V \( G \) \| \)$.

A related parity-constrained problem has a different recent resolution. An odd $K_t$ minor consists of $t$ disjoint trees, each properly two-colored, with a same-color edge joining every pair of trees. Kühn, Sauermann, Steiner, and Wigderson #cite(label("KuhnSauermannSteinerWigderson2025")) disproved the odd Hadwiger conjecture using graphs of independence number at most two. The construction in this paper bounds the order of ordinary complete minors.

The separate companion manuscript #cite(label("OpenAIColinDeVerdiereCounterexample2026")) Theorem 1.1 constructs graphs with $chi \( G \) > mu \( G \) + 1$, where $mu$ is the ordinary Colin de Verdière invariant. Since $h \( G \) lt.eq mu \( G \) + 1$, its result also gives counterexamples to Hadwiger’s inequality. The argument here proves the connected-matching bound directly and does not use that invariant.

=== 1.2 The construction and its proof <the-construction-and-its-proof>

We build $G$ by sampling from a finite probability space and declaring some pairs to be #emph[holes], or missing edges. The hole relation has no loops or triangles. Its complement on the sampled positions therefore has independence number at most two, even when sampled elements repeat. An ordered pair with no internal hole is called a #emph[unit]; it represents a possible matching edge. Two units conflict when all four cross pairs are holes, as in 1. Such edges cannot belong to one connected matching.

The main distribution theorem forces conflicts between independent units drawn from any law with specified marginal and joint density bounds. It permits arbitrary dependence between the endpoints of a unit, as is necessary when the units come from a matching. An entropy-minimizing container argument transfers this statement to the finite sample: while a family of units supports such a law, supersaturation supplies a conflict neighborhood to delete; when no such law remains, a capacitated cut covers the residual family by a small set of endpoint types and a small set of pairs.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.155), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 1.155), [$A_1$], anchor: "east")
  circle((0, -1.155), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((-0.03528, -1.155), [$A_2$], anchor: "east")
  circle((3.99, 1.155), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((4.025, 1.155), [$B_1$], anchor: "west")
  circle((3.99, -1.155), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((4.025, -1.155), [$B_2$], anchor: "west")
  line((0, 1.155), (0, -1.155), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.99, 1.155), (3.99, -1.155), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((0, 1.155), (3.99, 1.155), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0, 1.155), (3.99, -1.155), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0, -1.155), (3.99, 1.155), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0, -1.155), (3.99, -1.155), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((0, 1.838), [#text(size: 9pt)[unit $A$]])
  content((3.99, 1.838), [#text(size: 9pt)[unit $B$]])
  content((1.995, -1.943), [#text(size: 9pt)[solid: edges of $G$ dashed: holes]])
})],
  caption: [Figure 1: All four cross holes make the two solid matching edges non-touching. The distribution theorem forces this conflict in every unit law satisfying its marginal and joint density bounds. ],
) <fig:four-holes>

To define holes, each sampled configuration carries injective linear maps into common binary vector spaces. The coefficient spaces record monomial evaluations $v$ at Boolean points; their point moments are the rank-one matrices $v v^(sans(T))$. The frame maps induce an embedding $U_o$ of a space built from these moments, together with a linear functional $u_o$ on the ambient tensor space. Auxiliary frame columns will be used to impose the cross-contraction equations. A hole is certified by a shared tensor and two prescribed identities for the cross contractions. The identities come from a symmetric bilinear form; summing them around a hypothetical triangle cancels every bilinear term and leaves $0 = 1$. 2 proves this parity mechanism before constructing the particular moments and frames.

Forcing four holes is the harder task. The construction has one unbounded parameter $n$, and the ambient vector dimension is $N = M_0 n$, with $M_0$ fixed before the limit. The three main steps are as follows.

+ #emph[Finite certificates for four holes (Section 5, Section 6, Section 7).] The candidate witnesses are short sums of point moments. A point’s #emph[key] is the tuple of its images under the relevant frame maps; equal keys on the two sides give a shared tensor. We retain specified images of a bounded number of coefficient directions, called #emph[pins]. A fixed Boolean selector labels the points; interpolation and a bounded set of excluded labels make the key directions independent modulo these pins. A separate low-rank moment decomposition identifies the obstructions to solving the cross-contraction equations. Once the corresponding scalar conditions hold, the remaining equations cost only $O \( n \)$ bits. The collision criterion in 26 reduces four holes to overlap of the accepted key distributions. The witness sums use paired lists of points, and a #emph[scalar recipe] prescribes their scalar conditions. Sampling the point parameters with the configuration fixed will be called a #emph[query]; its full key is the list of the point keys.
+ #emph[Preparation of the unit law (Section 8, Section 9).] Conditioning on exact pin images decomposes the law into parts called #emph[leaves], with control of every further independent image prescription. A #emph[small table] records the cross pairings of the projected pin directions and the auxiliary frame directions. The scalar conditions must be compatible with this table. Phase estimates produce compatible tables on a positive mass of independent unit pairs, or on a smaller mass at least a fixed multiple of $N^(- 4)$ determined by their leaves.
+ #emph[Forcing overlap (Section 10, Section 11, Section 12, Section 13, Section 14).] Each leaf’s accepted key distributions have finite $L^1$ approximating families. Estimates for the mixed law also control tests of single keys and the scalar values recorded with them. A product comparison connects these single-position estimates to tests of the full key tuple. If overlap vanished in the positive-mass case, a common limit would rule out every scalar recipe whose matched positions have positive overlap; finite-dimensional duality produces precisely such a recipe. The inverse-polynomial compatibility mass may disappear in this limit, so it is handled separately: a uniform large-set estimate is applied to a finite family chosen on one leaf before the independent opposite leaf is sampled.

The Boolean moment argument uses commuting multiplication operators, as in the flat-extension approach to moment problems #cite(label("laurentmourrain2009")). The distribution-to-graph argument combines information projection #cite(label("csiszar1975")), independent-set fingerprints #cite(label("kleitmanwinston1982")) #cite(label("samotij2015")), and a capacitated cut #cite(label("fordfulkerson1956")). The overlap estimates use entropy #cite(label("cover2006")) and the energy-increment method of weak regularity #cite(label("frieze1999")); the additional constraints from the frame pairings are retained explicitly in their proofs.

=== 1.3 Organization and conventions <organization-and-conventions>

Section 2, Section 3 define the frames and holes and reduce the graph problem to uniform supersaturation. 4 establishes the frame-image estimates and the decomposition into pinned leaves. Section 5, Section 6, Section 7 prove the algebraic realization and collision criteria. Section 8, Section 9 prepare the unit law and its small tables. The analytic comparison tools are established in Section 10, Section 11. Section 12, Section 13 prove overlap on the branches with positive limiting compatibility mass, and 14 handles the remaining branch and completes the proof. 15 collects the order of choices and the quantitative margins.

All vector spaces, matrices, ranks, and algebraic forms are over $bb(F)_2$. Probabilities, densities, norms, and entropies are real. Logarithms in bit counts have base two; changing the base for entropy only changes fixed constants. Constants described as bounded may be very large but are independent of $n$. An $O \( n \)$ scalar record has its coefficient fixed before $M_0$ is chosen. Later fixed test accuracies and partition sizes may change how large $n$ must be; they do not change the construction.

The two endpoints in one unit may be dependent. Separate units, and their leaves before additional pairing conditions, are sampled independently. Query subdensities retain the mass lost to all acceptance tests.

== 2 The hole relation and its tensor realization <sec:geometry>

The construction has two tasks. Its missing-edge relation must be triangle-free, so that the resulting graph has independence number at most two. It must also provide enough missing edges to prevent a large connected matching. We first give the algebraic reason for triangle-freeness. The tensor and frame construction that follows provides the additional structure needed for the second task.

=== 2.1 A triangle-free relation <a-triangle-free-relation>

Let $cal(X)$ and $cal(V)$ be finite-dimensional vector spaces over $bb(F)_2$. Fix a linear functional $a in cal(X)^(*)$ and a symmetric bilinear form $T$ on $cal(X)$, and write

$ r \( x \) = a + T \( x \, dot.op \) in cal(X)^(*) . $

Let $Omega$ be a finite set. For each $i in Omega$, suppose we have an injective linear map $U_i : cal(X) arrow.r cal(V)$ and a linear functional $u_i in cal(V)^(*)$.

#prodef([Definition 2.1.])[
  Two elements $i \, j in Omega$ have a #emph[hole] between them if there exist $lambda_i \, lambda_j in cal(X)$ such that
  #[#set math.equation(numbering: n => "(2.1)")
   $ U_i lambda_i = U_j lambda_j \, #h(2em) u_j U_i = r \( lambda_i \) \, #h(2em) u_i U_j = r \( lambda_j \) \,\
a \( lambda_i \) + a \( lambda_j \) = 1 . $ <eq:hole-equations>]
  The middle two identities are identities of linear functionals on the whole space $cal(X)$.
] <def:hole>

Thus a hole has a shared vector in $cal(V)$, one witness for it in each copy of $cal(X)$, and opposite values of $a$ on the witnesses. The functional identities make these requirements incompatible around a triangle.

#thm([Lemma 2.2.])[
  #emph[The hole relation is symmetric, has no loops, and is triangle-free.]
] <lem:hole-triangle-free>

#proof[
  Symmetry follows by interchanging the endpoints. A loop would have $U_i lambda_i = U_i lambda_j$, hence $lambda_i = lambda_j$ by injectivity, contradicting the last equation of (2.1).
  Suppose that three distinct elements have holes on all three pairs. For a directed incidence $i j$, let $x_(i j)$ be its witness at $i$. For distinct $i \, j \, k$, evaluate the functional identity for $i j$ on $x_(i k)$:
  $ u_j \( U_i x_(i k) \) = a \( x_(i k) \) + T \( x_(i j) \, x_(i k) \) . $
  Sum over the six ordered choices of $\( i \, j \, k \)$. For fixed $j$, the two arguments on the left are equal by the sharing equation for the remaining edge $i k$, so they cancel. For fixed $i$, the two bilinear terms cancel by symmetry of $T$. The remaining sum is
  $ sum_({ i \, j }) #scale(x: 120%, y: 120%)[\(] a \( x_(i j) \) + a \( x_(j i) \) #scale(x: 120%, y: 120%)[\)] = 1 + 1 + 1 = 1 \, $
  a contradiction. ◻
]

Given any list $o_1 \, dots.h \, o_m in Omega$, form a graph $G$ on its #emph[positions]: two distinct positions are adjacent when their elements have no hole. This gives a finite simple graph even when elements repeat. Equal elements are adjacent because holes have no loops. An independent triple of positions would therefore give three distinct elements forming a hole triangle. Hence

#[#set math.equation(numbering: n => "(2.2)")
 $ alpha \( G \) lt.eq 2 \, #h(2em) chi \( G \) gt.eq ceil.l m \/ 2 ceil.r . $ <eq:sample-independence>]

It remains to choose the finite set and its linear data so that a random list also has no large connected matching. Two disjoint edges fail to touch precisely when all four cross pairs are holes. The distribution theorem in 3 will force these four-hole conflicts for the model constructed below.

=== 2.2 Construction parameters <construction-parameters>

We now construct $cal(X) \, a \, T \, cal(V)$ and the maps $U_o \, u_o$, together with a uniform law $mu_n$ on a finite set $Omega_n$ of frames. All vector spaces, maps, tensor products, and ranks remain over $bb(F)_2$. We use the entrywise pairing of matrices:

$ chevron.l A \, B chevron.r = sum_(r \, c) A_(r c) B_(r c) = "Tr" \( A^(sans(T)) B \) . $

Probabilities and entropy take real values.

The sole asymptotic parameter is $n$. All numerical construction parameters are fixed independently of the law of units, in the order specified in 15, before $n$ tends to infinity. Set

#[#set math.equation(numbering: n => "(2.3)")
 $ C_0 = 1000 \, #h(2em) g = 10^9 + 1 \, #h(2em) D = 4 C_0 g \, #h(2em) M = 2^1000 . $ <eq:early-constants>]

In particular, $g$ is odd. The budgets for conditioning a unit law are introduced in 4; they precede the selector parameters $j_(*) \, b$ and the mixing parameters through $J$ in 5. Choose $r_0$ sufficiently large after those choices, put $h = 1000 r_0$, and choose the dimension multiplier $M_0$ last. The ambient dimension and sample size are

#[#set math.equation(numbering: n => "(2.4)")
 $ N = M_0 n \, #h(2em) m = 2^(C_0 g N) . $ <eq:parameter-order>]

We take $j_(*) gt.eq 1$ and $n gt.eq 2 r_0$. For each sufficiently large $n$, the matrices used below are chosen to satisfy 21, before any unit law is considered.

An $O \( n \)$ bit count below has a coefficient fixed before $M_0$ and can therefore be made a prescribed small fraction of $N$. This is different from an $o \( N \)$ bound: after $M_0$ is fixed, $n \/ N = 1 \/ M_0$ is constant. Later fixed tests and tolerances may increase the required lower bound on $n$; they do not change the construction.

=== 2.3 Moment matrices and cut profiles <moment-matrices-and-cut-profiles>

Let

$ cal(I) = bb(Z) \/ g bb(Z) \, #h(2em) cal(E) = binom(cal(I), 2) \, #h(2em) I_d = { d + 1 \, dots.h \, d + \( g - 1 \) \/ 2 } subset cal(I) . $

Elements of $cal(I)$ are #emph[tags]; elements of $cal(E)$ are #emph[components]. The ordinary, or base, variables comprise $g^2 + 3$ blocks of $n$ bits:

$ O_(d \, t) quad \( d \, t in cal(I) \) \, #h(2em) S \, quad \# \, quad Z . $

A separate selector has $b$ bits. Its values $s in bb(F)_2^b$ are called #emph[labels], to distinguish them from tags.

The $O$-blocks carry testers whose availability depends on the tag, while $S$ carries a tester available at every tag. The additional $\#$-block lets the self-Gram form $E$, defined below, distinguish different selector labels. The $Z$-block is absent from $E$; its free coordinates and change-of-basis symmetry are used in the later parameter tests.

Let

$ p_(*) = sum_(j = 0)^(j_(*)) binom(b, j) \, #h(2em) cal(B) = bb(F)_2^(p_(*)) ⊗ bb(F)_2^(thin 1 + \( g^2 + 3 \) n) . $

The first factor is indexed by squarefree selector monomials of degree at most $j_(*)$; the second by the constant and the individual base variables. If $p_s$ is the vector of selector-monomial evaluations and $z$ is a base value, write

#[#set math.equation(numbering: n => "(2.5)")
 $ v \( s \, z \) = p_s ⊗ \( 1 \, z \) in cal(B) . $ <eq:point-evaluation>]

Thus the row and column coordinates both represent monomials of base degree at most one and selector degree at most $j_(*)$.

Let $W subset cal(B) ⊗ cal(B)$ be the span of the point moments $v \( s \, z \) v \( s \, z \)^(sans(T))$. For $l in cal(I)$, let $W_l$ be the span of those point moments for which

$ O_(d \, t) = 0 quad upright("whenever ") l in.not I_d . $

Let $W_(*)$ be defined by requiring every $O$-block to be zero. The cut-profile space is

#[#set math.equation(numbering: n => "(2.6)")
 $ cal(X) = {x = \( x_({ l \, l' }) \)_({ l \, l' } in cal(E)) : x_({ l \, l' }) = w_l + w_(l') \, quad w_l in W_l} . $ <eq:cut-profile-space>]

A tuple $w = \( w_l \)_(l in cal(I))$ as in this display is a #emph[representation] of $x$.

#thm([Lemma 2.3.])[
  #emph[The intersection of $W_l$ over any strict majority of tags is $W_(*)$. Two representations of the same cut profile differ by a constant tuple with value in $W_(*)$.]
] <lem:cut-kernel>

#proof[
  Fix a base coordinate in $O_(d \, t)$. It is allowed at exactly $\( g - 1 \) \/ 2$ tags. A strict majority therefore contains a tag where that coordinate is disallowed. Every row and column involving it is zero in $W_l$ for that tag. A matrix in the intersection consequently has zero rows and columns at all $O$-coordinates.
  The coordinate projection that sets all $O$-variables to zero sends each point moment to a point moment defining $W_(*)$. Applied on both matrix factors, it fixes the matrix just described. That matrix is therefore in $W_(*)$, proving the nontrivial inclusion.
  If $w \, w'$ give the same differences, then $w_l + w'_l = w_(l') + w'_(l')$ for every pair of tags. Their difference is a constant tuple. Its value belongs to every $W_l$, hence to $W_(*)$. Conversely every such constant tuple lies in the kernel of the cut map. ◻
]

In each $O_(d \, t)$-block and in $S$, choose the first $2 r_0$ coordinates in disjoint ordered pairs. The corresponding linear functionals on moments are

$ eta_(d \, t) #scale(x: 120%, y: 120%)[\(] v \( s \, z \) v \( s \, z \)^(sans(T)) #scale(x: 120%, y: 120%)[\)] = sum_(rho = 1)^(r_0) z_(O_(d \, t) \, 2 rho - 1) z_(O_(d \, t) \, 2 rho) \, #h(2em) eta_S #scale(x: 120%, y: 120%)[\(] v \( s \, z \) v \( s \, z \)^(sans(T)) #scale(x: 120%, y: 120%)[\)] = sum_(rho = 1)^(r_0) z_(S \, 2 rho - 1) z_(S \, 2 rho) . $

They are well defined by selecting the indicated ordered matrix entries. Put

$ eta_O = sum_(d \, t) eta_(d \, t) \, #h(2em) eta = eta_O + eta_S . $

For a cut profile represented by $w$, define

#[#set math.equation(numbering: n => "(2.7)")
 $ a_t \( x \) & = sum_(l \, d) eta_(d \, t) \( w_l \) \, & a \( x \) & = sum_t a_t \( x \) = sum_l eta_O \( w_l \) \,\
b_t \( x \) & = sum_(l eq.not t) eta_S \( w_l \) \, & chi_(*) \( w \) & = sum_l eta \( w_l \) . $ <eq:cut-functionals>]

The functions $a_t \, a \, b_t$ are well defined on $cal(X)$. Indeed, a constant kernel value in $W_(*)$ contributes zero to every $O$-tester, while it contributes $\( g - 1 \) eta_S \( w_(*) \) = 0$ to $b_t$. The quantity $chi_(*) \( w \)$ is used only when a representation has been specified.

Define a symmetric bilinear form $T^0$ on $cal(X)$ by

#[#set math.equation(numbering: n => "(2.8)")
 $ T^0 = a ⊗ a + sum_(t in cal(I)) \( a_t ⊗ b_t + b_t ⊗ a_t \) . $ <eq:T-zero>]

For $1 lt.eq j lt.eq J$ and ordered components $e \, f$, choose endomorphisms $L_j^(e f) \, R_j^(e f)$ of $cal(B)$. Their required properties will be proved in 21. Set

#[#set math.equation(numbering: n => "(2.9)")
 $ B^1 \( x \, y \) & = sum_(j = 1)^J sum_(e \, f in cal(E)) chevron.l x_e \, L_j^(e f) y_f \( R_j^(e f) \)^(sans(T)) chevron.r \,\
T^1 \( x \, y \) & = B^1 \( x \, y \) + B^1 \( y \, x \) \, #h(2em) T = T^0 + T^1 . $ <eq:T-one>]

This specifies the symmetric form $T$ in the hole equations and hence the affine-gradient map $r \( x \) = a + T \( x \, dot.op \)$. The integer $r$ introduced in (4.5) is a separate rank budget. Since the mixed terms in $T^0 \( x \, x \)$ cancel, $T^1$ is alternating, and $a \( x \)^2 = a \( x \)$, we have

#[#set math.equation(numbering: n => "(2.10)")
 $ T \( x \, x \) = a \( x \) #h(2em) \( x in cal(X) \) . $ <eq:T-diagonal>]

The prescribed self-frame Gram matrix is denoted by $E$. It is the sum of the ordered tester matrices for $eta$ and a matrix $E^(\#)$ characterized on evaluation vectors by

#[#set math.equation(numbering: n => "(2.11)")
 $ v \( s \, z \)^(sans(T)) E^(\#) v \( s' \, z' \) = sum_(rho = 1)^b \( s_rho + s'_rho \) thin z_(\#)^(sans(T)) M_rho z'_(\#) \, $ <eq:E-sharp>]

where $M_rho$ are $n$-by-$n$ matrices chosen in 21. The expression is a bilinear form on $cal(B)$ because $j_(*) gt.eq 1$. It vanishes when the two point inputs coincide. Consequently

#[#set math.equation(numbering: n => "(2.12)")
 $ chevron.l E \, w chevron.r = eta \( w \) #h(2em) \( w in W \) . $ <eq:E-moments>]

The $Z$-block does not occur in $E$. In particular, any invertible linear change of the $Z$-variables preserves $E$; this symmetry will be used in unary probability estimates.

=== 2.4 Raw vertices <raw-vertices>

For each $e in cal(E)$, take copies $V_e^(+) \, V_e^(-)$ of $bb(F)_2^N$, paired by the usual dot product. We regard $V_e^(-)$ as the dual of $V_e^(+)$ through that pairing. A raw vertex, also called an #emph[orientation], consists at each component of four maps

$ P_e \, Q_e : cal(B) arrow.r V_e^(+) \, V_e^(-) \, #h(2em) X_e \, Y_e : bb(F)_2^h arrow.r V_e^(+) \, V_e^(-) \, $

where the target is the first or second one as appropriate. They satisfy

#[#set math.equation(numbering: n => "(2.13)")
 $ \[ P_e \, X_e \] upright(" and ") \[ Q_e \, Y_e \] upright(" are injective") \, #h(2em) P_e^(sans(T)) Q_e = E \, quad X_e^(sans(T)) Q_e = 0 \, quad P_e^(sans(T)) Y_e = 0 . $ <eq:raw-frame-law>]

No value is prescribed for $X_e^(sans(T)) Y_e$.

Write $d = dim cal(B)$. For all large $n$, $N gt.eq 2 \( d + h \)$, by the final choice of $M_0$. The frame set is then nonempty. For example, take the plus columns to be the first $d + h$ coordinate vectors. Prescribe the full $\( d + h \)$-square Gram matrix to be $E & 0\
0 & 0$. Lift its columns to minus vectors using the first $d + h$ coordinates, and append distinct coordinate vectors in a complementary space of dimension $d + h$. These minus columns are independent and have the desired Gram values.

Take the uniform distribution on this finite frame set, independently over components. Let $Omega_n$ be the raw vertex space and $mu = mu_n$ this distribution. There are at most $2^(2 \| cal(E) \| N \( d + h \))$ raw vertices, so

#[#set math.equation(numbering: n => "(2.14)")
 $ log_2 \| Omega_n \| = O \( N^2 \) . $ <eq:raw-space-size>]

Use the common ambient tensor space

$ cal(V) = xor.big_(e in cal(E)) V_e^(+) ⊗ V_e^(-) . $

For a raw vertex $o$, define

#[#set math.equation(numbering: n => "(2.15)")
 $ U_o x = \( P_(o \, e) x_e Q_(o \, e)^(sans(T)) \)_(e in cal(E)) \, #h(2em) u_o \( xi \) = sum_(e in cal(E)) chevron.l Y_(o \, e) X_(o \, e)^(sans(T)) \, xi_e chevron.r . $ <eq:raw-embedding>]

On a simple tensor $p q^(sans(T))$ in component $e$, the latter pairing is

$ u_o \( p q^(sans(T)) \) = \( Y_(o \, e)^(sans(T)) p \) dot.op \( X_(o \, e)^(sans(T)) q \) . $

Thus the minus channel is paired with the first tensor factor and the plus channel with the second. All copies of coefficient spaces attached to different vertices are distinct, although the ambient $V_e^plus.minus$ are common.

Each $U_o$ is injective: a left inverse of $P_(o \, e)$ and the transpose of a left inverse of $Q_(o \, e)$ recover $x_e$ from $P_(o \, e) x_e Q_(o \, e)^(sans(T))$. The two annihilator conditions in (2.13) also give

#[#set math.equation(numbering: n => "(2.16)")
 $ u_o U_o = 0 . $ <eq:self-contraction-zero>]

We have now supplied all the linear data of 3. By 4, their hole relation on $Omega_n$ is symmetric, loopless, and triangle-free. Sample $m$ raw vertices independently with law $mu_n$, and form the graph on their positions as above. Equation (2.2) gives $alpha \( G \) lt.eq 2$ deterministically. The next section reduces the bound on its connected matchings to a distribution statement for this frame law.

== 3 From supersaturation to a finite graph <sec:distributions>

A #emph[unit] is an ordered pair of raw vertices with no hole between its endpoints. The endpoints of a unit may be dependent. When two units are sampled independently, their four endpoints need not be independent within either unit. The event of interest is that all four cross pairs have holes, as in 1.

#thm([Theorem 3.1.])[
  (Raw supersaturation).  #emph[For the construction parameters specified in Section 2, Section 15, for all sufficiently large $n$, every probability law $sigma$ on units satisfying 
#[#set math.equation(numbering: n => "(3.1)")
 $ sigma_1 lt.eq M mu \, #h(2em) sigma_2 lt.eq M mu \, #h(2em) sigma lt.eq 2^(D N) mu^2 $ <eq:raw-law-caps>]

 has the following property: two independent units drawn from $sigma$ have all four cross holes with probability at least $2^(- 100 g N)$. The inequalities in (3.1) are pointwise inequalities of measures on the finite raw spaces.]
] <thm:raw-supersaturation>

The proof of 6 occupies the subsequent sections and is completed in 14. We prove its implication for graphs here. The frame estimates and the preparation of an admissible unit law begin in 4.

=== 3.1 Entropy minimizers and terminal cuts <entropy-minimizers-and-terminal-cuts>

We use a finite form of the information-projection argument of Csiszár #cite(label("csiszar1975")). Its support assertion is important here: the minimizing law must see every point that can occur in a feasible law. Relative entropy is taken with natural logarithms:

$ sans(D) \( rho bar.v.double q \) = sum_x rho \( x \) log frac(rho \( x \), q \( x \)) . $

Here $q$ is a strictly positive probability measure and $0 log 0 = 0$.

#thm([Lemma 3.2.])[
  #emph[Let $cal(P)$ be a nonempty compact convex set of probability measures on a finite set, and let $rho$ minimize $sans(D) \( dot.op bar.v.double q \)$ on $cal(P)$. Then $rho$ is positive on the union of the supports of measures in $cal(P)$. For every $rho' in cal(P)$, 
$ sans(D) \( rho' bar.v.double q \) - sans(D) \( rho bar.v.double q \) gt.eq sans(D) \( rho' bar.v.double rho \) . $

 If $rho'$ is supported on a set $S$, the right side is at least $- log rho \( S \)$.]
] <lem:entropy-support>

#proof[
  If $rho \( x \) = 0 < rho' \( x \)$ at a feasible support point, the entropy along $\( 1 - t \) rho + t rho'$ has right derivative $- oo$ at zero from the newly occupied points. At all points where $rho > 0$, its derivative is finite. This contradicts minimality, proving the support assertion.
  We can therefore differentiate toward any feasible $rho'$ using only points where $rho > 0$. The right derivative at the minimizer is nonnegative, giving
  $ sum_x \( rho' \( x \) - rho \( x \) \) log frac(rho \( x \), q \( x \)) gt.eq 0 \, $
  where the constant derivative term cancels because both measures have total mass one. The exact identity
  $ sans(D) \( rho' bar.v.double q \) - sans(D) \( rho bar.v.double q \) = sans(D) \( rho' bar.v.double rho \) + sum_x \( rho' \( x \) - rho \( x \) \) log frac(rho \( x \), q \( x \)) $
  proves the second assertion. Finally, if $rho'$ is supported on $S$, comparison with the normalized restriction $rho \( dot.op divides S \)$ gives
  $ sans(D) \( rho' bar.v.double rho \) = sans(D) \( rho' bar.v.double rho \( dot.op divides S \) \) - log rho \( S \) gt.eq - log rho \( S \) . $
  For completeness, nonnegativity of relative entropy follows from $log t lt.eq t - 1$, applied with $t = q \( x \) \/ rho' \( x \)$ and summed over the positive support of $rho'$. ◻
]

The next lemma is the max-flow/min-cut principle of Ford and Fulkerson #cite(label("fordfulkerson1956")) with capacities chosen to encode the three density bounds. We include the finite residual-cut argument, which applies to the real capacities used here.

#thm([Lemma 3.3.])[
  #emph[Let $R subset.eq Omega_n^2$. If no probability law supported on $R$ satisfies (3.1), there are sets $S subset.eq Omega_n$ and $E_0 subset.eq Omega_n^2$ such that 
$ mu \( S \) < 1 \/ M \, #h(2em) mu^2 \( E_0 \) < 2^(- D N) \, $

 and every pair in $R$ either has an endpoint in $S$ or belongs to $E_0$.]
] <lem:terminal-cut>

#proof[
  Construct a directed network with source $s$, a left copy and a right copy of $Omega_n$, and sink $t$. Give the edge from $s$ to left $x$ capacity $M mu \( x \)$, the edge from right $y$ to $t$ capacity $M mu \( y \)$, and the edge from left $x$ to right $y$ capacity $2^(D N) mu \( x \) mu \( y \)$ whenever $\( x \, y \) in R$. A flow of value one is precisely a law satisfying the three caps. A flow of larger value could be scaled down to value one, so the maximum value is less than one.
  The feasible flows form a compact polytope, hence the flow value has a maximizer $f$. In its residual network, include a forward edge whenever its capacity exceeds its flow and a reverse edge whenever its flow is positive. There is no residual path from $s$ to $t$: augmenting by the smallest positive residual capacity on such a path would increase the value. Let $Z$ be the vertices reachable from $s$. Every forward edge across $Z$ to its complement is saturated, and every forward edge in the opposite direction has zero flow, since otherwise its reverse residual edge would leave $Z$. Summing flow conservation over $Z$ shows that the capacity of this cut equals the value of $f$, hence is less than one.
  Let $L_0$ be the raw types whose left copies are outside $Z$, and let $R_0$ be those whose right copies are in $Z$. The cut-capacity inequality is
  $ M mu \( L_0 \) + M mu \( R_0 \) + 2^(D N) mu^2 #scale(x: 120%, y: 120%)[\(] R ∩ \( \( Omega_n \\ L_0 \) times \( Omega_n \\ R_0 \) \) #scale(x: 120%, y: 120%)[\)] < 1 . $
  Take $S = L_0 union R_0$ and take $E_0$ to be the pair set in the last summand. Its measure and that of $S$ have the asserted bounds. A pair in $R$ with neither endpoint in $S$ necessarily belongs to $E_0$. ◻
]

=== 3.2 Containers and the random sample <containers-and-the-random-sample>

We now adapt the independent-set fingerprint method of Kleitman and Winston #cite(label("kleitmanwinston1982")); see also #cite(label("samotij2015"), form: "prose") Section 2. Here the progress measure is the minimum relative entropy of a feasible law. The preceding cut lemma handles the terminal set when no such law remains.

#thm([Proposition 3.4.])[
  #emph[Assume the conclusion of 6 at a given sufficiently large $n$. For $m = 2^(C_0 g N)$, the sampled graph defined in 2 satisfies 
$ alpha \( G \) lt.eq 2 \, #h(2em) "cm" \( G \) < m \/ 100 $

 with probability $1 - exp \( - Omega \( m \) \)$. The implied positive constant is independent of $n$.]
] <prop:raw-to-graph>

#proof[
  #strong[Entropy-controlled fingerprints.] Make a finite #emph[conflict graph] whose vertices are raw units; two units are adjacent when they give all four cross holes. There are no loops, since a repeated unit would require a hole from a raw vertex to itself. Put $epsilon_N = 2^(- 100 g N)$.
  For an independent set $I$ of raw units, start with all units as a residual set $R$. If there is a feasible law satisfying (3.1) on $R$, choose its relative-entropy minimizer with respect to $mu^2$. Such a minimizer exists because the feasible laws form a compact convex polytope and relative entropy is continuous on the finite probability simplex. Fix deterministic choices throughout. The average, under this law $rho$, of $rho \( N_R \( v \) \)$ is the conflict probability of two independent $rho$-units, so is at least $epsilon_N$. Choose a unit $v in R$ maximizing this neighborhood mass. If $v in I$, record $v$ and delete its entire neighborhood $N_R \( v \)$. If $v in.not I$, delete $v$ alone. Both operations preserve $I subset.eq R$. Each removes at least one unit, so the procedure terminates at a residual set with no feasible law.
  When a recording leaves a feasible residual, 7 shows that the new minimum entropy exceeds the old one by at least $- log \( 1 - epsilon_N \)$. Other deletions cannot decrease the minimum. Every feasible law has entropy in $\[ 0 \, D N log 2 \]$, since its density is at most $2^(D N)$. Allowing one final recording that leaves no feasible residual, the fingerprint has length at most
  #[#set math.equation(numbering: n => "(3.2)")
   $ L_N = 1 + ⌈frac(D N log 2, - log \( 1 - epsilon_N \))⌉ = O \( 1 + D N thin 2^(100 g N) \) . $ <eq:fingerprint-length>]
  The fingerprint determines the terminal set. Indeed, after a unit is recorded its residual neighborhood is empty, and remains empty as residual sets shrink. A feasible law always has a unit with strictly positive neighborhood mass, so a recorded unit is never selected again. Given the set of recorded units, replay the deterministic procedure, recording a selected unit exactly when it is in that set. All other selected units are deleted. This reproduces every step and the terminal set.
  By (2.14), the logarithm of the number of raw units is $O \( N^2 \)$. The number of possible fingerprints, and hence terminal sets, is at most $\( \| Omega_n \|^2 + 1 \)^(L_N)$. Its logarithm is
  #[#set math.equation(numbering: n => "(3.3)")
   $ O \( N^3 thin 2^(100 g N) \) = o \( m \) \, $ <eq:container-count>]
  since $m = 2^(1000 g N)$.
  #strong[Terminal exceptions in the sample.] For each terminal set fix sets $S \, E_0$ supplied by 8. Let $k = ceil.l m \/ 200 ceil.r$. The probability that at least $k$ sampled positions have raw type in $S$ is at most
  $ binom(m, k) mu \( S \)^k lt.eq (frac(e m, k M))^k lt.eq \( 200 e \/ M \)^k = exp \( - Omega \( m \) \) . $
  A fixed collection of $k$ disjoint ordered pairs of distinct sampled positions consists of independent $mu^2$-draws. It lies entirely in $E_0$ with probability at most $2^(- k D N)$. There are at most $m^(2 k)$ such collections, so the probability that one exists is at most
  #[#set math.equation(numbering: n => "(3.4)")
   $ m^(2 k) 2^(- k D N) = 2^(\( 2 C_0 g - D \) N k) = 2^(- 2 C_0 g N k) . $ <eq:pair-exception-bound>]
  Union over the $exp \( o \( m \) \)$ terminal sets using (3.3). Outside a set of probability $exp \( - Omega \( m \) \)$, every terminal set has fewer than $m \/ 200$ exceptional positions and fewer than $m \/ 200$ disjoint position pairs in its pair exception. The strict bounds follow from $k - 1 < m \/ 200$.
  Suppose on this event that $G$ has a touching matching of size at least $m \/ 100$. Orient its edges arbitrarily, and let $I$ be the set of raw unit types thereby realized. This is independent in the conflict graph: four cross holes would mean that the two endpoint sets have no edge between them in $G$. Different sampled matching edges may have the same raw type; no injectivity of this assignment is needed. Run the container procedure for this set $I$. Every occurrence of a matching-edge type lies in its terminal set, and hence is covered by $S$ or $E_0$. Because the matching uses disjoint sampled positions, fewer than $m \/ 200$ of its edges can meet the positions in $S$. The rest give disjoint ordered position pairs in $E_0$, of which there are also fewer than $m \/ 200$. Their sum is less than $m \/ 100$, a contradiction.
  Finally, $alpha \( G \) lt.eq 2$ holds deterministically by 4. ◻
]

=== 3.3 The clique-minor bound <the-clique-minor-bound>

9 supplies the required bound on connected matchings once raw supersaturation is proved. The next counting argument converts that bound into the clique-minor estimate used in the introduction.

The following elementary estimate counts small branch sets, in the same connected-matching approach used by Cambie #cite(label("cambie2021")). Its deliberately coarse bound holds for every finite graph.

#thm([Proposition 3.5.])[
  #emph[For every finite nonempty graph $G$ of order $m$, 
$ "h" \( G \) lt.eq frac(m + 4 "cm" \( G \) + 2, 3) . $

 In particular, if $alpha \( G \) lt.eq 2$ and $"cm" \( G \) < m \/ 100$, then 
$ "h" \( G \) < frac(26 m, 75) + 2 / 3 < m / 2 lt.eq chi \( G \) #h(2em) \( m gt.eq 5 \) . $

]
] <prop:matching-minor>

#proof[
  Consider a complete-minor model with $b$ branch sets. Let $s$ of them be singletons and $e$ have two vertices. Each two-vertex branch is an edge. The singleton vertices form a clique, so pairing them gives $floor.l s \/ 2 floor.r$ more edges. All these edges together form one touching matching: their vertex sets are disjoint, and adjacency of the original branches guarantees every required contact. Writing $c = "cm" \( G \)$, we obtain
  $ c gt.eq e + floor.l s \/ 2 floor.r \, #h(2em) s lt.eq 2 \( c - e \) + 1 . $
  Every remaining branch has at least three vertices, whence
  $ m gt.eq s + 2 e + 3 \( b - s - e \) = 3 b - 2 s - e . $
  Combining the inequalities gives
  $ 3 b lt.eq m + 2 s + e lt.eq m + 4 c - 3 e + 2 lt.eq m + 4 c + 2 . $
  Maximize over all complete-minor models. For the final assertion, every color class has at most two vertices when $alpha \( G \) lt.eq 2$, so $chi \( G \) gt.eq m \/ 2$. Combine this with $c < m \/ 100$ and $26 m \/ 75 + 2 \/ 3 < m \/ 2$ when $m gt.eq 5$. ◻
]

== 4 Frame laws and preparation of unit laws <sec:frame-laws>

We now prepare the probability laws used to prove raw supersaturation. Under the reference law $mu^2$, prescribed vector images have exponentially small probabilities, even when their nominal directions combine both endpoints of a unit. This will imply two useful properties of any law satisfying (3.1). After discarding exponentially small mass, tensors shared by its endpoints have sparse profiles, and the law can be partitioned into parts on which every unpinned exact-image constraint remains unlikely. The normalized laws of these parts will be called leaf laws.

=== 4.1 Uniform frame laws <uniform-frame-laws>

We record the linear algebra behind all reference image laws. For a subspace of a nominal coefficient space, its #emph[image] is its image under the relevant frame map. Nominal independence is independence before applying these maps.

#thm([Lemma 4.1.])[
  #emph[Let $A \, A' : U arrow.r V$ and $B \, B' : W arrow.r V^(*)$ be injective maps between finite-dimensional spaces over $bb(F)_2$. If 
$ B^(sans(T)) A = \( B' \)^(sans(T)) A' \, $

 there is $L in "GL" \( V \)$ with $L A = A'$ and $L^(- sans(T)) B = B'$. Thus based individually injective plus and minus frames with a prescribed Gram matrix form one orbit under the simultaneous primal and dual action.]
] <lem:paired-frame-orbit>

#proof[
  Write $Phi = B^(sans(T)) : V arrow.r W^(*)$ and $Phi' = \( B' \)^(sans(T)) : V arrow.r W^(*)$. Both are surjective. The based map $f : A \( U \) arrow.r A' \( U \)$ given by $f \( A u \) = A' u$ satisfies $Phi' f = Phi$. It therefore maps $A \( U \) ∩ ker Phi$ isomorphically onto $A' \( U \) ∩ ker Phi'$. Extend this restriction to an isomorphism $L_0 : ker Phi arrow.r ker Phi'$.
  Choose a complement $U_0$ of $A \( U \) ∩ ker Phi$ in $A \( U \)$. Its images under $Phi$ are independent. Extend a basis of $Phi \( U_0 \)$ to a basis of $W^(*)$, and choose lifts of the added basis vectors under $Phi$ and $Phi'$, respectively. For the basis vectors in $Phi \( U_0 \)$, choose the lifts in $U_0$ and their images under $f$. Define $L$ to equal $L_0$ on $ker Phi$ and to carry each chosen lift to its primed lift. These are direct-sum decompositions of $V$, so $L$ is an isomorphism. It extends $f$ and satisfies $Phi' L = Phi$, which is equivalent to the two required frame identities. ◻
]

#thm([Lemma 4.2.])[
  (Gram normalization).  #emph[Let $p \, q$ be nonnegative integers with $p + q lt.eq N$. For $p$ independent uniform plus vectors and $q$ independent uniform minus vectors in paired copies of $bb(F)_2^N$, and a prescribed $p$-by-$q$ Gram matrix $G$, the probability of that Gram matrix together with individual injectivity of both frames is at most $2^(- p q)$ and at least 
#[#set math.equation(numbering: n => "(4.1)")
 $ 2^(- p q) \( 1 - 2^(p - N) \) \( 1 - 2^(p + q - N) \) . $ <eq:bounded-gram-normalization>]

 In particular, any consistent Gram specification on a bounded number of vectors, together with injectivity on each side, has probability bounded below by a positive constant for large $N$.]
] <lem:gram-frame-normalization>

#proof[
  The plus columns are linearly independent with probability at least $1 - 2^(p - N)$: each nonzero coefficient dependence has probability $2^(- N)$. Given their linear independence, each minus column takes its required evaluations with probability $2^(- p)$, independently, so the Gram costs $2^(- p q)$. Under this Gram conditioning, every nonzero combination of minus columns is uniform on an affine space of dimension at least $N - p$. Its probability of vanishing is at most $2^(- \( N - p \))$. Union over fewer than $2^q$ combinations gives failure probability at most $2^(p + q - N)$. This proves the lower bound. For the upper bound with plus injectivity required, condition on the plus columns and use the exact $2^(- p q)$ Gram probability whenever they are independent. A partially specified consistent Gram contains some full specification; for bounded $p \, q$, the same positive lower bound for that full specification proves the last assertion. ◻
]

#thm([Lemma 4.3.])[
  #emph[The following statements hold for all sufficiently large $n$.]
  + #emph[The plus frame $\[ P \, X \]$ is uniform among injective maps. Conditional on it, the minus columns are independent uniforms on the affine spaces prescribed in (2.13), followed only by the conditioning that $\[ Q \, Y \]$ is injective. The failure probability of this last condition, before conditioning, is at most $2^(2 \( d + h \) - N)$ per component.]
    #emph[Given $P \, Q$, the channels $X \, Y$ are independent uniform-column draws on $ker Q^(sans(T))$ and $ker P^(sans(T))$, respectively, conditioned on $\[ P \, X \]$ and $\[ Q \, Y \]$ being injective. The two rank-failure probabilities are exponentially small in $N$. Each channel frame alone is uniform among injective maps $bb(F)_2^h arrow.r bb(F)_2^N$. For any fixed $q$ independent vectors in its paired ambient space, the probability that transpose evaluation on their span is not injective is at most 
#[#set math.equation(numbering: n => "(4.2)")
 $ 2^(q - h + 1) . $ <eq:channel-transpose-failure>]

 The unconditional joint channel law is bounded above by a constant, depending on $g \, h$ but not on $n$, times the completely independent uniform-column law.]
  + #emph[At independently sampled raw vertices and components, images of prescribed primal coefficient tuples that are independent separately at each vertex and sign are uniform subject to their individual injectivities and their prescribed same-vertex Gram matrices. For tuples using channels as well, the same assertion holds conditionally on the full self-channel Gram matrices $X_e^(sans(T)) Y_e$; the relevant full Gram matrix is $E & 0\
0 & X_e^(sans(T)) Y_e$.]
  + #emph[Let a fixed tuple of nominal directions use arbitrary combinations of the two endpoints’ primal and channel coefficients. Compute its rank separately in each component and sign in the #emph[direct sum over both endpoints], and let the total be $t$. For every preassigned $epsilon.alt > 0$, choosing $M_0$ sufficiently large gives, under $mu^2$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(P) { upright("all those images equal prescribed vectors") } lt.eq 2^(- \( 1 - epsilon.alt \) t N) #h(2em) \( t gt.eq 1 \) . $ <eq:reference-image-cap>]

 This is valid for all possible ranks $t$, including $t = O \( n \)$, not only for bounded tuples.]
] <lem:frame-images>

#proof[
  The raw law is invariant under $L$ on each $V_e^(+)$ and $L^(- sans(T))$ on $V_e^(-)$, independently at vertices and components. For (a), the action is transitive on injective plus frames, so their marginal is uniform. Given a plus frame, each column of $Q$ has specified evaluations against $P \, X$, while each column of $Y$ has zero evaluations against $P$. There is no other constraint until full minus injectivity is imposed. The remaining allowed set is therefore the product of those affine column spaces restricted to full rank.
  Each column space contains the common translation space $"ann" \( "im" \[ P \, X \] \)$, of dimension $N - d - h$. For a nonzero coefficient vector $c in bb(F)_2^(d + h)$, the corresponding linear combination of minus columns is consequently uniform on an affine space containing that translation space. Its chance of being zero is at most $2^(- \( N - d - h \))$. Union over the fewer than $2^(d + h)$ nonzero coefficient vectors gives the asserted bound $2^(2 \( d + h \) - N)$.
  Alternatively, condition first on $P \, Q$. The allowed $X$-columns lie in $ker Q^(sans(T))$, the allowed $Y$-columns in $ker P^(sans(T))$, and their two full-rank restrictions are separate. This proves the stated conditional independence. For example, before imposing injectivity of $\[ P \, X \]$, any dependence with a nonzero $X$-coefficient has probability at most $2^(- \( N - d \))$; union over its at most $2^(d + h)$ coefficient choices gives a bound $2^(2 d + h - N)$. The estimate for $Y$ is identical.
  The marginal of $X$ alone is invariant under $"GL" \( bb(F)_2^N \)$ and supported on injective maps; transitivity gives its uniformity, and likewise for $Y$. Before conditioning independent channel columns to be injective, their evaluations on a fixed independent $q$-tuple form a uniform $h$-by-$q$ matrix. For each nonzero coefficient vector in $bb(F)_2^q$, the chance that its evaluation is zero is $2^(- h)$. Union over those coefficient vectors gives at most $2^(q - h)$, and channel injectivity has probability at least $1 \/ 2$ for large $N$. This proves (4.2). To compare their joint marginal with completely independent columns, condition on $G = X^(sans(T)) Y$. The conditional marginal is uniform on the orbit of two individually injective $h$-frames having Gram matrix $G$. Under independent uniform columns that orbit has probability at least $2^(- h^2 - 2)$ for large $N$, by 12. Since the raw probability of any $G$ is at most one, the density ratio on every such orbit is at most $2^(h^2 + 2)$. Multiply over the fixed number of components to obtain the joint channel bound. Its possible dependence on $h$ is harmless: $h$ is fixed before $n$ grows.
  For (b), the restricted Gram of primal tuples is fixed by $E$. By 11, all based realizations with that Gram and individual injectivity lie in one orbit. Projection of an invariant uniform raw law is uniform on this orbit: an element carrying one partial realization to another bijects their full-frame completions. There is at least one completion because these tuples are restrictions of a raw frame. After fixing $X_e^(sans(T)) Y_e$, the same argument applies to arbitrary full-frame coefficient tuples. Independence over raw draws and components proves (b).
  For (c), we prove the image cap, keeping explicit the dependence on the rank. Replace each tested tuple by a basis of its nominal span; inconsistent dependent prescriptions have probability zero. For the plus directions at the two endpoints, start with completely independent uniform plus columns and then impose individual full-frame injectivity. The image of a rank-$t_(+)$ tuple in the joint nominal direct sum is exactly uniform on $t_(+)$ independent ambient vectors before this conditioning. Indeed, at each ambient coordinate the coefficient map is a surjective linear map onto $bb(F)_2^(t_(+))$, and different ambient coordinates use independent input bits. Full injectivity has probability $1 - 2^(- Omega \( N \))$, uniformly over the given construction, so the plus prescription costs at most $\( 1 - 2^(- Omega \( N \)) \)^(- 1) 2^(- t_(+) N)$.
  Now condition on all plus frames. At a component let $S$ be the span of both endpoints’ plus columns; then $dim S lt.eq 2 \( d + h \)$. Before minus injectivity, every minus column has an affine distribution whose translation space contains $S^perp$. Split off an independent uniform $S^perp$-part of each column and condition on the remaining parts. For a rank-$t_(-)$ tuple of minus coefficient combinations, the $S^perp$-parts of its images are independent uniform vectors in $S^perp$, because the coefficient map has rank $t_(-)$. Thus prescribed minus images have probability at most
  $ 2^(- \( N - 2 \( d + h \) \) t_(-)) . $
  The additional conditioning on the two minus frames being injective changes this by a factor $1 + 2^(- Omega \( N \))$, by (a). Perform this argument componentwise. There is a fixed total conditioning factor bounded, for example, by $4^(\| cal(E) \|)$, and the resulting bound is
  $ 4^(\| cal(E) \|) thin 2^(- t_(+) N - \( N - 2 \( d + h \) \) t_(-)) . $
  Choose $M_0$ so that $2 \( d + h \) \/ N < epsilon.alt \/ 2$ for large $n$, and then increase $n$ so that the fixed prefactor is at most $2^(epsilon.alt N \/ 2)$. Since $t = t_(+) + t_(-) gt.eq 1$, this proves (4.3) uniformly for every allowable $t$. In particular, mixing the two endpoints in a direction causes no loss of an entire $N$-bit image constraint. ◻
]

=== 4.2 Sparse profiles arising from true intersections <sparse-profiles-arising-from-true-intersections>

For a matrix profile, its #emph[total component rank] means $sum_(e in cal(E)) "rank" x_e$.

#thm([Lemma 4.4.])[
  #emph[Let $sigma$ satisfy the joint cap in (3.1). Outside a set of $sigma$-probability $2^(- Omega \( N \))$, 
$ sum_(e in cal(E)) dim #scale(x: 120%, y: 120%)[\(] "im" P_(1 \, e) ∩ "im" P_(2 \, e) #scale(x: 120%, y: 120%)[\)] lt.eq 2 D . $

 For any unit outside that exceptional set and any $U_1 lambda_1 = U_2 lambda_2$, both $lambda_i$ have total component rank at most $2 D$. Each has a unique representation $\( w_(i \, l) \)_l$ vanishing at a strict majority of tags, and 
$ \| { l : w_(i \, l) eq.not 0 } \| lt.eq 4 D \/ g \, #h(2em) chi_(*) \( w_1 \) = chi_(*) \( w_2 \) . $

]
] <lem:raw-intersections>

#proof[
  If the summed intersection dimension exceeds $2 D$, choose $2 D$ independent common-image vectors, componentwise. Write each as $P_(1 \, e) a = P_(2 \, e) b$. Their nominal relation directions $\( a \, b \)$ are independent in the direct sum of the two primal coefficient spaces at that component. Indeed a dependence between the pairs would, after applying $P_(1 \, e)$, be the corresponding dependence between the selected common-image vectors. Across components their ranks add.
  There are at most $2^(O \( n \))$ ways to choose this bounded number of coefficient pairs and their component indices. For each choice, (4.3) bounds the probability of their zero images by $2^(- \( 1 - epsilon.alt \) 2 D N)$ under $mu^2$. After paying $2^(D N)$ for $sigma$, and making the coefficient count a sufficiently small fraction of $N$ by the choice of $M_0$, the union bound is $2^(- Omega \( N \))$.
  Suppose $U_1 lambda_1 = U_2 lambda_2 = xi$. The column space of $xi_e$ lies in both primal plus spans. Since multiplication by the two injective frame maps preserves matrix rank,
  $ "rank" \( lambda_(i \, e) \) = "rank" \( xi_e \) lt.eq dim \( "im" P_(1 \, e) ∩ "im" P_(2 \, e) \) . $
  This proves the total-rank assertion.
  Take any representation $\( w_l \)_l$ of one of the profiles. A component $w_l + w_(l')$ is nonzero whenever $w_l eq.not w_(l')$, so there are at most $2 D$ unequal unordered pairs. If no value occurred at a strict majority of tags, write $c_v$ for its multiplicities. Then
  $ \# { upright("unequal pairs") } = 1 / 2 (g^2 - sum_v c_v^2) gt.eq 1 / 2 (g^2 - g / 2 sum_v c_v) = g^2 / 4 > 2 D \, $
  a contradiction. Let the majority have size $g - z$. There are at least $z \( g - z \) gt.eq z g \/ 2$ unequal pairs, hence $z lt.eq 4 D \/ g$. Its common value belongs to $W_(*)$ by 5, so subtract it from every coordinate. The resulting representation vanishes at a strict majority. It is unique: two such representations differ by a constant, and their two majority zero sets intersect.
  Finally, equality of the component tensors gives equality of their ambient traces. By cyclicity of trace and (2.12),
  $ "Tr" \( P_(i \, e) lambda_(i \, e) Q_(i \, e)^(sans(T)) \) = chevron.l P_(i \, e)^(sans(T)) Q_(i \, e) \, lambda_(i \, e) chevron.r = eta \( lambda_(i \, e) \) . $
  For $e = { l \, l' }$, it follows that
  $ eta \( w_(1 \, l) \) + eta \( w_(2 \, l) \) = eta \( w_(1 \, l') \) + eta \( w_(2 \, l') \) . $
  This value is independent of the tag. The two sparse representations together have at most $8 D \/ g = 32000 < g$ nonzero coordinates, so some tag has both entries zero. The common value is therefore zero. Summing over tags proves equality of the two specified $chi_(*)$-values. ◻
]

=== 4.3 Peeling into leaves with exact pins <peeling-into-leaves-with-exact-pins>

We partition almost all of a capped unit law into leaves by storing unusually likely exact-image constraints in bounded-dimensional pin spaces. The remaining directions then satisfy a uniform image-probability bound. For a unit $O = \( 1 \, 2 \)$, introduce nominal coefficient spaces at each component

$ cal(L)_(O \, e) = xor.big_(i in O) \( cal(B)_i xor H_i^(+) \) \, #h(2em) cal(R)_(O \, e) = xor.big_(i in O) \( cal(B)_i xor H_i^(-) \) \, #h(2em) H_i^plus.minus = bb(F)_2^h . $

Their frame-image maps add the endpoint images in the common ambient $V_e^plus.minus$. A #emph[pin space] is a specified subspace $D_(O \, e)^plus.minus$ of this nominal direct sum together with specified exact images of every vector in a chosen basis. It may mix both endpoints, and it may mix primal and channel coordinates. Once the basis images are known, every image on the pin space is fixed.

For a tested tuple of directions, its #emph[rank modulo the pins] is the sum, over components and signs, of the dimensions of the spans of its classes in the nominal quotients by $D_(O \, e)^plus.minus$. The rank is nominal; it is not computed after applying the raw frames.

The budgets for this procedure are fixed before the selector, mixer, and channel parameters in the construction. Their values are

#[#set math.equation(numbering: n => "(4.4)")
 $ k_max = 56 \( g - 1 \) \, #h(2em) zeta = frac(1, 1000 k_max) \, #h(2em) K_1 = ⌈frac(4 \( D + 1 \), zeta)⌉ . $ <eq:pin-budgets>]

The phase and second-pinning budgets are

#[#set math.equation(numbering: n => "(4.5)")
 $ r = 2 K_1 + 2 \, #h(2em) L_0 = ceil.l 100 \( D + 10 \) ceil.r \, #h(2em) d_0 = 4 r L_0 \,\
u_0 = 10 \( K_1 + d_0 + 1 \) \, #h(2em) K = ⌈frac(10 \( D + K_1 + u_0 + 10 \), zeta)⌉ . $ <eq:law-budgets>]

Here the integer $r$ is a rank budget, distinct from the affine-gradient map $r \( x \)$. The complete order of choices is verified in 15.

#thm([Lemma 4.5.])[
  (Two peelings).  #emph[Take the constants in (4.4), (4.5), and choose the reference accuracy in (4.3) with $epsilon.alt < zeta \/ 4$. For every law $sigma$ satisfying (3.1), the following decompositions are available.]
  + #emph[After discarding the exception in 14 and at most $2^(- zeta N)$ further mass, the law is partitioned into #emph[leaves]. Each leaf has fixed pin spaces with total dimension at most $K_1$, and its normalized law $sigma_lambda$ satisfies 
#[#set math.equation(numbering: n => "(4.6)")
 $ sigma_lambda { upright("a specified exact-image constraint of rank ") t upright(" modulo the pins") } lt.eq 2^(- \( 1 - zeta \) t N) #h(2em) \( t gt.eq 1 \) . $ <eq:leaf-minentropy>]

 The normalized leaf laws satisfy a common bound $2^(O \( N \)) mu^2$, with the implied constant determined by the early parameters.]
  + #emph[Suppose a restriction of the mixed law has relative mass $2^(- o \( N \))$. One may discard an exponentially small fraction of that restricted law so that every remaining normalized leaf restriction satisfies 
#[#set math.equation(numbering: n => "(4.7)")
 $ sigma_lambda { upright("a specified exact-image constraint of rank ") t upright(" modulo the pins") } lt.eq 2^(- \( 1 - 2 zeta \) t N) #h(2em) \( t gt.eq 1 \) \, $ <eq:final-leaf-minentropy>]

 and still has density $2^(O \( N \))$ relative to $mu^2$. For several successive restrictions, the same statement applies to their combined relative cost.]
  + #emph[In addition, suppose at most $u_0$ further coefficient directions per unit must be pinned, their coefficient choices and all required scalar metadata having at most $2^(O \( n \))$ possibilities per old leaf. After splitting by these choices and their exact images, discarding exponentially small mass, and peeling again, the total pin dimension is at most $K$. The fresh leaves satisfy (4.6); after further restrictions as in (b), they satisfy (4.7). They retain a uniform $2^(O \( N \)) mu^2$ density bound.]
  #emph[In all parts the mixed law uses each leaf’s actual mass, normalized only after the indicated discards. No equal reweighting of leaves is used. After a restriction, $sigma_lambda$ denotes the normalized surviving law on that leaf.]
] <lem:peeling>

The per-leaf density bounds in 15 are joint bounds relative to $mu^2$; they do not supply the original one-vertex marginal caps. Restricting the #emph[mixed] law by mass $2^(- o \( N \))$, on the other hand, gives marginal bounds $M 2^(o \( N \)) mu$ and joint bound $2^(\( D + o \( 1 \) \) N) mu^2$. These are the two forms of control used later: leaf estimates govern averaged key distributions, and mixed-law estimates govern common tests. Their probability scales are summarized in 15.5.

#proof[
  We give the finite procedure and its quantitative bounds. Work first with the original, unnormalized restriction of $sigma$ obtained by removing the intersection exception. In particular its density is still at most $2^(D N)$ relative to $mu^2$. Let $R$ be its residual support. As long as its residual mass exceeds $2^(- zeta N)$, begin with its normalized restriction and no pins. If (4.6) fails, condition on a violating image constraint and add its nominal directions to the pins. Given the existing pins, a consistent tuple constraint can be reduced to a basis of its span modulo the pins. The other prescriptions are either automatic or inconsistent; an inconsistent event cannot violate a positive probability bound. Thus every step adds positive rank.
  If the cumulative added rank is $u$, the unnormalized mass of the current part is greater than
  $ 2^(- zeta N - \( 1 - zeta \) u N) . $
  The cumulative directions are independent after taking a basis, so the absolute density cap and (4.3) give the upper bound
  $ 2^(D N - \( 1 - epsilon.alt \) u N) . $
  Comparing the bounds yields
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( zeta - epsilon.alt \) u < D + zeta . $ <eq:peeling-rank-comparison>]
  This is strictly below the rank budget $K_1$. The same comparison applies to a whole violating tuple at once, so a large tuple cannot jump beyond that budget. The rank therefore cannot increase indefinitely. The process reaches a part with no violating constraint; remove that entire part as a leaf and restart on the residual. The underlying raw unit space is finite, and every leaf is nonempty, so the procedure terminates with residual mass at most $2^(- zeta N)$.
  A leaf of rank $u lt.eq K_1$ has mass greater than $2^(- zeta N - \( 1 - zeta \) u N)$. Dividing the original density cap by this lower bound shows, for example,
  $ sigma_lambda lt.eq 2^(\( D + K_1 + 1 \) N) mu^2 . $
  This proves (a), including uniformity of its density constant.
  For (b), write the current normalized mixture as $sum_lambda w_lambda sigma_lambda$. Let $q_lambda$ be the relative mass retained by the combined restriction in leaf $lambda$, and let $q = sum_lambda w_lambda q_lambda = 2^(- o \( N \))$. Discard leaves for which $q_lambda < 2^(- zeta N)$. Their mass in the restricted law is at most
  $ q^(- 1) sum_(lambda : q_lambda < 2^(- zeta N)) w_lambda q_lambda lt.eq 2^(- zeta N + o \( N \)) . $
  On every other leaf, division by $q_lambda$ multiplies probabilities by at most $2^(zeta N)$. For $t gt.eq 1$,
  $ 2^(zeta N) 2^(- \( 1 - zeta \) t N) lt.eq 2^(- \( 1 - 2 zeta \) t N) . $
  This proves the claimed min-entropy and density bounds. It also explains why the small mass bound is needed for the mixed law, rather than separately asserted for every old leaf.
  For (c), first apply this trimming to any preceding small-cost restrictions. Split each retained old leaf by the further coefficient choices, scalar metadata, and exact images. There are at most $2^(O \( n \)) 2^(u_0 N)$ parts. Discard every part having relative mass less than $2^(- \( u_0 + 1 \) N)$ in its old leaf. The total discarded fraction is at most
  $ 2^(O \( n \) - N) = 2^(- Omega \( N \)) $
  once $M_0$ is large enough for the fixed metadata coefficient. The normalized law $Q$ on each retained part consequently has the absolute density bound
  #[#set math.equation(numbering: n => "(4.9)")
   $ Q lt.eq 2^(D' N) mu^2 \, #h(2em) D' = D + K_1 + u_0 + 5 . $ <eq:second-peeling-start>]
  The harmless slack covers the preceding trimming and normalizations. There are initially at most $K_1 + u_0$ pinned dimensions on this part.
  Repeat the first procedure, keeping those old and deliberately added pins fixed. Only new directions are counted in its rank comparison. To justify this point, let $c_1 \, dots.h \, c_u$ be cumulative new lifts independent modulo the stored pin space. They are linearly independent in the full nominal space. The refined event is contained in their prescribed image event, whether or not the old pin event is also imposed. Using the #emph[unconditioned] reference measure in (4.9),
  $ Q \( upright("refined event") \) lt.eq 2^(D' N) mu^2 { "image" \( c_j \) upright(" has its prescribed value for all ") j } lt.eq 2^(D' N - \( 1 - epsilon.alt \) u N) . $
  No reference measure conditioned on the rare old-pin event is used. For each selected current part the tuple is fixed, so adaptive selection of the next violating tuple does not require an additional union bound.
  The lower mass bound is again $2^(- zeta N - \( 1 - zeta \) u N)$. Thus $u < 4 \( D' + 1 \) \/ zeta$, a conservative consequence of the analogue of (4.8). Together with the initial $K_1 + u_0$ pins this is less than the chosen $K$ in (4.5). The same leaf-mass calculation gives a $2^(O \( N \)) mu^2$ bound with a common early-parameter constant. The second procedure discards at most $2^(- zeta N)$ relative mass per part; summing with the actual part weights gives the same total bound. It restores (4.6) relative to all old and new pins. Part (b) can then be applied once more to yield (4.7) after subsequent restrictions.
  Throughout these operations, disintegration over the finite parts is exact. Multiplying each normalized part by its actual mass recovers the retained law. This proves the last assertion as well. ◻
]

=== 4.4 Bilinear sign estimates <bilinear-sign-estimates>

#thm([Lemma 4.6.])[
  (Walsh estimates).  #emph[Let all weights below have absolute value at most one.]
  + #emph[If $x \, y$ are independent uniform vectors and $B \( x \, y \)$ is a bilinear form of rank $d$, then 
$ lr(|bb(E) f \( x \) g \( y \) \( - 1 \)^(B \( x \, y \))|) lt.eq 2^(- d \/ 2) . $

 Replacing either uniform law by a law of density at most $C_i$ multiplies this bound by at most $C_1 C_2$.]
  + #emph[If $alpha \, beta$ are subprobability measures on $bb(F)_2^d$, with point masses at most $p_1 \, p_2$, respectively, then 
$ lr(|sum_(x \, y) alpha \( x \) beta \( y \) f \( x \) g \( y \) \( - 1 \)^(x dot.op y)|) lt.eq 2^(d \/ 2) \( p_1 p_2 \)^(1 \/ 2) . $

]
  + #emph[For independent uniform global $N$-bit vector slots in two groups, a cross-pairing character with coefficient matrix $C$ has bit rank $N "rank" C$. In particular, if its cross coefficient pattern is nonzero, its correlation against two bounded weights, one on each group, is at most $2^(- N \/ 2)$. Arbitrary phases depending separately on the groups may be included in these weights.]
] <lem:walsh>

#proof[
  Let $H$ be the $2^d$-square matrix with entries $H_(x y) = \( - 1 \)^(x dot.op y)$. For $x \, x' in bb(F)_2^d$,
  $ \( H H^(sans(T)) \)_(x x') = sum_y \( - 1 \)^(\( x + x' \) dot.op y) = cases(delim: "{", 2^d \, & x = x' \,, 0 \, & x eq.not x' .) $
  The second value is zero by pairing $y$ with $y + e_j$ at any coordinate where $x + x'$ is nonzero. Thus the Euclidean operator norm of $H$ is $2^(d \/ 2)$.
  For (b), set $a_x = alpha \( x \) f \( x \)$ and $b_y = beta \( y \) g \( y \)$. Then
  $ \| a^(sans(T)) H b \| lt.eq 2^(d \/ 2) parallel a parallel_2 parallel b parallel_2 \, #h(2em) parallel a parallel_2^2 lt.eq p_1 sum_x alpha \( x \) lt.eq p_1 \, $
  and similarly for $b$, proving the result.
  For (a), invertible changes of coordinates reduce the form to the dot product on its $d$ active coordinates. Average each bounded weight over its inactive coordinates. Apply (b) to the uniform probabilities $p_1 = p_2 = 2^(- d)$. A bounded-density change can be absorbed into the weights after dividing their bounds by $C_1 \, C_2$.
  Finally, the matrix of the full bit form in (c) is $C ⊗ I_N$. Choose bases reducing $C$ to $"diag" \( I_("rank" C) \, 0 \)$; the tensor matrix then has rank $N "rank" C$. Apply (a), absorbing any within-group phases into the corresponding bounded weight. ◻
]

== 5 Low-rank moments and mixing forms <sec:moments>

We prepare point moments for use as witnesses in the hole equations. The gradient identities must hold on the whole cut space. The low-rank decomposition below will be used to reduce the obstructions to those identities to prescribed scalar tests. A separate bound on sparse label supports of projected pin directions identifies a bounded set of labels to avoid, so that the witness directions remain independent of the pins. We then choose the mixing matrices to control evaluations at one point and at pairs of points with distinct labels.

The pin budget $K$ is fixed before the parameters chosen in this section. Set

#[#set math.equation(numbering: n => "(5.1)")
 $ R_(*) = 2 \( K + 20 \) \, #h(2em) j_(*) gt.eq 10 \( K + 1 \) \( R_(*) + 20 \) . $ <eq:moment-parameters>]

All inequalities concerning ranks in this section are over $bb(F)_2$. The selector size $b$ will be chosen below. Put $p_(*) = sum_(j = 0)^(j_(*)) binom(b, j)$ and write $d_(upright(b)) = \( g^2 + 3 \) n$ for the number of ordinary base coordinates. Thus $cal(B) = bb(F)_2^(p_(*)) ⊗ bb(F)_2^(1 + d_(upright(b)))$ and $v \( s \, z \) = p_s ⊗ \( 1 \, z \)$, as in 2. The constant base coordinate has index $0$.

=== 5.1 Boolean moment matrices <boolean-moment-matrices>

The low-rank decomposition below uses the quotient and multiplication operators familiar from flat extensions of moment matrices; see Laurent and Mourrain #cite(label("laurentmourrain2009")) Section 2, especially Lemma 2.1. Here we work over $bb(F)_2$ with separate selector and base degree bounds. The quotient pairing is nondegenerate, and no positivity is used.

#thm([Lemma 5.1.])[
  #emph[The span of $\( 1 \, z \) \( 1 \, z \)^(sans(T))$, $z in bb(F)_2^(d_(upright(b)))$, consists precisely of symmetric $\( 1 + d_(upright(b)) \)$-by-$\( 1 + d_(upright(b)) \)$ matrices $Z$ satisfying $Z_(i i) = Z_(0 i)$ for every $i$. For any $u$ distinct selectors, their evaluation vectors $p_s$ are linearly independent if $j_(*) gt.eq u - 1$.]
] <lem:base-moments>

#proof[
  Every point matrix has the stated identities. Conversely the space specified by these identities has a basis consisting of the matrix supported at $\( 0 \, 0 \)$, the matrices supported at $\( 0 \, i \) \, \( i \, 0 \) \, \( i \, i \)$, and the matrices supported at $\( i \, j \) \, \( j \, i \)$ for $0 < i < j$. The first is the point matrix at zero. The second is the sum of the point matrices at zero and at the $i$th unit vector. The third is the sum of the point matrices at zero, at the $i$th and $j$th unit vectors, and at their sum. This proves the first assertion.
  To isolate a selector $s$ among $u$ distinct selectors, for each other selector choose a coordinate on which it differs from $s$, and take the product of the corresponding affine bit functions that equal one at $s$ and zero at the chosen other selector. This polynomial has degree at most $u - 1$ and evaluates to the indicator of $s$ on the specified set. Applying these interpolating linear functionals to a relation among the evaluation vectors proves independence. ◻
]

#thm([Lemma 5.2.])[
  (Label support).  #emph[Every $w in W$ of rank at most $R_(*)$ has a representation 
#[#set math.equation(numbering: n => "(5.2)")
 $ w = sum_(s in L) \( p_s ⊗ I \) Z_s \( p_s ⊗ I \)^(sans(T)) \, #h(2em) \| L \| lt.eq R_(*) \, $ <eq:label-decomposition>]

 where each $Z_s$ is symmetric, $\( Z_s \)_(i i) = \( Z_s \)_(0 i)$, and $sum_(s in L) "rank" Z_s lt.eq R_(*)$.]
] <lem:label-support>

#proof[
  We first construct the label summands at a selector degree where the pairing rank has stabilized. We then show that any discrepancy at a higher degree would contradict the rank bounds.
  Choose a linear combination of point matrices representing $w$. It defines a linear functional $Lambda$ on the Boolean functions of selector degree at most $2 j_(*)$ and base degree at most two. The matrix $w$ is the matrix of the pairing $B \( f \, g \) = Lambda \( f g \)$ on functions that are base-linear and have selector degree at most $j_(*)$. Products and degrees here are in the Boolean algebra, so each variable satisfies $x^2 = x$.
  Let $V_j$ denote the subspace with selector degree at most $j$, and let $r_j$ be the rank of $B \|_(V_j times V_j)$. The sequence $r_j$ is nondecreasing and bounded by $R_(*)$. Because $j_(*) gt.eq 6 R_(*) + 4$, there is $j gt.eq 4 R_(*) + 2$ such that
  #[#set math.equation(numbering: n => "(5.3)")
   $ r_j = r_(j + 1) = r_(j + 2) . $ <eq:flat-levels>]
  Indeed, if no such three successive values occurred between levels $4 R_(*) + 2$ and $j_(*)$, every two successive increments in that interval would contain a strict increase, giving more than $R_(*)$ increases.
  Let $Q$ be the quotient of $V_(j + 2)$ by the radical of its restricted pairing. The induced pairing on $Q$ is nondegenerate. Equality of the first and last ranks in (5.3) means that the image of $V_j$ is all of $Q$, and that a vector of $V_j$ pairing to zero with $V_j$ pairs to zero with $V_(j + 2)$. For a selector coordinate $s_a$, define $M_a \[ f \] = \[ s_a f \]$ using $f in V_j$. This is well defined: if $\[ f \] = 0$, then for every $g in V_j$,
  $ B \( s_a f \, g \) = B \( f \, s_a g \) = 0 \, $
  and $V_j$ spans $Q$. The same identity proves that $M_a$ is self-adjoint. Replacing $s_b f$ by a representative in $V_j$ and transferring $s_a$ to the other argument gives
  $ B \( M_a M_b \[ f \] \, \[ g \] \) = Lambda \( s_a s_b f g \) . $
  All representatives needed in this comparison lie in $V_(j + 2)$. Thus $M_a M_b = M_b M_a$ and, since $s_a^2 = s_a$, $M_a^2 = M_a$.
  Commuting idempotents over $bb(F)_2$ have a simultaneous eigenspace splitting
  $ Q = xor.big_(s in L) Q_s \, #h(2em) M_a \|_(Q_s) = s_a I . $
  For completeness, a single idempotent splits its space into kernel and image; all the other commuting maps preserve both summands, so iteration proves the assertion. Distinct joint eigenspaces are orthogonal, by self-adjointness of a coordinate on which their labels differ. Each nonzero summand has positive dimension, so $\| L \| lt.eq dim Q lt.eq R_(*)$. Define $Z_s$ by pairing the projections onto $Q_s$ of the affine base coordinates. Then $Z_s$ is symmetric and $"rank" Z_s lt.eq dim Q_s$.
  Repeated application of the $M_a$ gives the class of a base coordinate times any selector monomial of degree at most $j$. It follows that (5.2) reproduces all moments of selector degree at most $2 j$. To verify the diagonal identity separately on a label, use an interpolating selector polynomial $e_s$ of degree at most $\| L \| - 1$. Its operator on $Q$ is the projection onto $Q_s$. The Boolean identities give
  $ B \( z_i e_s \, z_i e_s \) = Lambda \( z_i e_s^2 \) = B \( e_s \, z_i e_s \) \, $
  which is $\( Z_s \)_(i i) = \( Z_s \)_(0 i)$. The interpolation degrees are within $j$. We have therefore obtained the required label blocks and all moments through selector degree $2 j$.
  It remains to recover the higher-degree moments. Extend the right side of (5.2) to the full row and column indexing. Its rank is at most $sum_s dim Q_s lt.eq R_(*)$. By 17 it belongs to $W$. If its difference from $w$ were nonzero, choose a nonzero difference moment of minimal selector degree $d' > 2 j$. Write its selector monomial as the product on a set $U$ of size $d'$, and keep the two affine base coordinates in that moment fixed. Index rows by the subsets $A subset U$ of size $floor.l d' \/ 2 floor.r$ and columns by the complementary monomials $U \\ A'$ with the same indexing. The union $A union \( U \\ A' \)$ is $U$ exactly when $A = A'$; otherwise its degree is smaller than $d'$. The difference on this square submatrix is therefore the identity. Both its row and column degrees are at most $j_(*)$, whereas its rank is $binom(d', floor.l d' \/ 2 floor.r) > 2 R_(*)$. This contradicts the rank bound $2 R_(*)$ for the difference and completes the proof. ◻
]

=== 5.2 Labels protected from the pins <labels-protected-from-the-pins>

The decomposition separates the label blocks of a low-rank profile. Projected pin directions are arbitrary vectors of $cal(B)$, so we need a separate bound on the labels in their sparse expansions. For an endpoint $i$ of a leaf, let $S_(i \, e)^plus.minus subset cal(B)$ be the projection of $D_(O \, e)^plus.minus$ onto its individual primal coordinate block. These are projections, not intersections; a stored pin may mix endpoints and channel coordinates. The label support of a sparse expansion $sum_s p_s ⊗ z_s$ is the set of labels with $z_s eq.not 0$.

#thm([Lemma 5.3.])[
  #emph[Put $L_0^(upright("lab")) = R_(*) + 14$. At an endpoint, the union of the nonzero label supports of all vectors in all $S_(i \, e)^plus.minus$ that can be written as $sum_(s in L) p_s ⊗ z_s$ with $\| L \| lt.eq L_0^(upright("lab"))$ has size at most 
#[#set math.equation(numbering: n => "(5.4)")
 $ B_0 = 2 \| cal(E) \| K \( R_(*) + 14 \) . $ <eq:label-budget>]

]
] <lem:sparse-pin-labels>

#proof[
  For one projected space, choose a basis from its members admitting such sparse representations, for the span of all these members. There are at most $K$ chosen members. Comparing any further sparse member with its expression in this basis uses at most $\( K + 1 \) \( R_(*) + 14 \)$ labels. Their evaluation vectors are independent by 17 and (5.1). Consequently every label of the further member occurs in one of the chosen basis representations. There are at most $K \( R_(*) + 14 \)$ such labels per projected space. Summing over signs and components proves the stated, deliberately generous, bound. ◻
]

We will choose the witness points at this endpoint outside these labels. An expansion on at most $R_(*) + 14$ labels of a vector in a projected pin space can then have no nonzero summand at a chosen label. For later finite exclusions set

$ B_(*) = 10 \( B_0 + 10000 g + 1 \) $

and choose $b$ so large that

#[#set math.equation(numbering: n => "(5.5)")
 $ 2^(b - 2 j_(*)) > 100 g \( B_(*) + 1 \) . $ <eq:selector-size>]

The part of the cut space supported entirely in the projected pins will require separate scalar tests. Define the effective test space at endpoint $i$ by

#[#set math.equation(numbering: n => "(5.6)")
 $ C_i = { x in cal(X) : x_e in S_(i \, e)^(+) ⊗ S_(i \, e)^(-) upright(" for every ") e in cal(E) } . $ <eq:effective-space>]

Fix a basis of this space on each leaf. Since the total stored pin dimension is at most $K$, the sum over components of the individual projection dimensions in either sign is at most $K$. Therefore

#[#set math.equation(numbering: n => "(5.7)")
 $ dim C_i lt.eq K^2 \, #h(2em) sum_e "rank" x_e lt.eq K quad \( x in C_i \) . $ <eq:effective-bounds>]

A basis therefore reduces equality of linear functionals on $C_i$ to boundedly many scalar conditions. If pins are enlarged, retain the old effective spaces and their chosen basis data as well; they are subspaces of the new ones.

We now specify the point profiles used to build witnesses.

#prodef([Definition 5.4.])[
  (Atoms and flavors).  For a tag $l$, selector $s$, and base point $z$ allowed at $l$, let $frak(a)_l \( s \, z \) in cal(X)$ be the cut profile represented by $w_l = v \( s \, z \) v \( s \, z \)^(sans(T))$ and $w_t = 0$ for $t eq.not l$. Thus its component is $v \( s \, z \) v \( s \, z \)^(sans(T))$ at every component incident with $l$, and zero elsewhere. Its diagonal bit is $q = eta \( w_l \)$ and its role bit is $a \( frak(a)_l \( s \, z \) \)$. A generic flavor retains all base coordinates allowed at $l$. A shared-only flavor sets all $O$ blocks to zero. A pure flavor sets $S$ to zero and retains a specified subset of the allowed $O$ blocks, setting the others to zero. Every flavor retains both $\#$ and $Z$ in their entirety. At a fixed label, a parameter test samples all retained bits independently and uniformly. Its tester summary is the list of all individual quadratic tester values. In addition to this summary we may record the basis values of $T \( frak(a)_l \( s \, z \) \, dot.op \) \|_(C_i)$.
] <def:atom>

=== 5.3 Choice of the mixers <choice-of-the-mixers>

For one atom, the scalar tests include the values of $T \( frak(a)_l \( s \, z \) \, dot.op \)$ on a basis of $C_i$. Every nonzero combination of these tests is evaluation against a nonzero profile of total component rank at most $K$. For two atoms with distinct labels, we will also prescribe ordered $L \, R$ evaluations. The two parts of the next lemma give the rank bounds used to control these one-point and two-point tests.

Fix, for example,

#[#set math.equation(numbering: n => "(5.8)")
 $ A = 10 \( K + 1 \) p_(*) \( g^2 + 5 \) \, #h(2em) s_0 = 4 ceil.l A ceil.r \, #h(2em) J > 100 \( s_0 + K^2 + 1 \) . $ <eq:mixer-parameters>]

These constants precede $r_0 \, h$ and $M_0$.

#thm([Lemma 5.5.])[
  (Uniform mixing forms).  #emph[For all sufficiently large $n$ one can choose the matrices $L_j^(e f) \, R_j^(e f)$ and $M_a$ in 2 so that:]
  + #emph[ For every nonzero $x in cal(X)$ of total component rank at most $K$, every tag, label and flavor, and every fixing of the non-$Z$ base coordinates, the quadratic function $T \( x \, frak(a)_l \( s \, z \) \)$ of the $n$ remaining $Z$ bits has polar rank at least $2 \( J - s_0 \)$. It uses a space of linear forms on $Z$ of bounded dimension, independent of $n$. This space can be chosen before the non-$Z$ coordinates are fixed.]
  + #emph[ For two distinct labels and any two flavors, every nonzero parity of the indexed $L_j^(e f) \, R_j^(e f)$ evaluations between the two point inputs, allowing each matrix in either order or both, and optionally either or both orders of $E$, has bilinear-part rank at least $n \/ 5$. Here a nonzero parity involving an $L$ or $R$ evaluation means that at least one such indexed ordered evaluation occurs. The same rank bound holds for the three parities consisting of $E$ alone, its reverse alone, or their sum.]
  #emph[The choices are made before any unit law is selected.]
] <lem:generic-mixers>

#proof[
  A symmetric rank-$r$ matrix on a $d_B$-dimensional coordinate space can be written $Z H Z^(sans(T))$, where $Z$ has $r$ independent columns and $H$ is a nonsingular symmetric $r$-by-$r$ matrix. To verify the factorization, take a left inverse $L$ of the chosen column basis $Z$ and put $H = L x L^(sans(T))$. The projection $Z L$ fixes $x$ on the left and, by symmetry, on the right; hence $Z H Z^(sans(T)) = x$. Its rank forces $H$ to be nonsingular. Neither $H$ nor the original matrix is required to have nonzero diagonal. For a fixed component rank tuple of total at most $K$, counting $Z \, H$ gives at most $2^(d_B K + K^2 + K)$ choices. There are at most $\( K + 1 \)^(\| cal(E) \|)$ such rank tuples. Therefore the number of profiles under consideration satisfies
  #[#set math.equation(numbering: n => "(5.9)")
   $ \# { x in cal(X) : sum_e "rank" x_e lt.eq K } lt.eq 2^(A n) $ <eq:low-rank-profile-count>]
  for all sufficiently large $n$, since $d_B = p_(*) \( 1 + \( g^2 + 3 \) n \)$.
  Choose all $L \, R$ matrices independently and uniformly. Fix a nonzero profile and write $x_e = Z_e H_e Z_e^(sans(T))$, with $r_e = "rank" x_e$. For a tag-$l$ atom the contribution from a single indexed matrix uses the forward forms $Z_e^(sans(T)) L v$ when $l in f$, and the reverse forms $v^(sans(T)) L Z_f$ when $l in e$, and the corresponding forms for $R$. Regard these initially as separate formal variables. Across all indices their number is at most
  $ m_0 = 4 J \( g - 1 \) K . $
  Each forward or reverse pair contributes a bilinear product with nonsingular middle matrix $H_e$ or $H_f$. These products use disjoint formal variables. Since $x eq.not 0$, for each $j$ there is at least one such nonzero product, so the formal quadratic has polar rank at least $2 J$.
  We justify the distribution of their linear parts on $Z$ even when forward and reverse restrictions overlap. For a fixed matrix $L$, specifying $Z_e^(sans(T)) L$ and $L Z_f$ imposes at most $r_e r_f$ compatibility bits, namely their common $Z_e^(sans(T)) L Z_f$ block. After restriction to the free $Z$ directions, the resulting list remains uniform on a linear subspace of codimension at most $r_e r_f$ in the space of all lists. Equivalently its law is dominated by $2^(r_e r_f)$ times the completely uniform law. Over all matrices the domination factor is at most $2^(2 J K^2)$; only matrices with both relevant incidences contribute a compatibility term.
  For a uniform $m$-by-$n$ matrix, the probability of corank at least $s_0 + 1$ is at most $2^(m \( s_0 + 1 \) - \( s_0 + 1 \) n)$: choose $s_0 + 1$ independent row relations and require all their $n$ evaluations to vanish. If $m < s_0 + 1$ the probability is zero. The preceding domination therefore bounds the bad probability for a fixed profile, tag and label by
  $ 2^(2 J K^2 + \( s_0 + 1 \) m_0) thin 2^(- \( s_0 + 1 \) n) . $
  There is no union over non-$Z$ values or flavors in this estimate: they affect affine shifts, not these linear parts on the always retained $Z$ block. A union over at most $2^(A n) g 2^b$ choices tends to zero. On the complementary event the image of the $Z$ inputs in the formal variable space has codimension at most $s_0$. Restricting a bilinear form to a subspace of codimension $s_0$ reduces rank by at most $2 s_0$: in a basis extending that subspace one deletes $s_0$ rows and $s_0$ columns, each deletion decreasing rank by at most one. This proves Lemma 5.5. The formal list itself supplies the claimed bounded space of linear forms. The term $T^0$ has no $Z$ variables and does not affect this argument.
  For Lemma 5.5, distinct labels have independent selector evaluation vectors. Their two $Z$ direction spaces are therefore disjoint. Restricting a random matrix to these two spaces in the two orders reads independent off-diagonal blocks. Any nonempty parity involving ordered $L \, R$ evaluations is consequently a uniform $n$-by-$n$ matrix on these directions, even after all other matrices and $E$ have been fixed.
  For the parities using only $E$, choose its matrices $M_a$ independently and uniformly. On the two $\#$ direction spaces, $E$ restricts to
  $ A_(s \, s') = sum_(a = 1)^b \( s_a + s'_a \) M_a \, $
  which is uniform because $s eq.not s'$. The reverse gives $A_(s \, s')^(sans(T))$, and their sum is alternating. An $floor.l n \/ 2 floor.r$ square block with disjoint row and column indices is uniform also in this last case. A uniform $d_1$-by-$d_2$ matrix has probability at most $2^(\( d_1 + d_2 \) r - d_1 d_2)$ of rank at most $r$, by representing such a matrix as a product of a $d_1$-by-$r$ and an $r$-by-$d_2$ matrix. Taking $r < n \/ 5$ gives probability $2^(- Omega \( n^2 \))$ in all the preceding cases, including the square block of side $floor.l n \/ 2 floor.r$.
  There are at most $2^(2 b)$ ordered label pairs and $2^(4 J \| cal(E) \|^2 + 2)$ parities to check. These counts are fixed in $n$. The $Z$ and $\#$ restrictions also show that the tester part of $E$ and the choice of flavor cannot reduce the ranks just proved. A union bound establishes both properties simultaneously. Fix one successful choice for each sufficiently large $n$. ◻
]

#prodef([Remark 5.6.])[
  The raw frame law has an exact symmetry under a common $"GL"_n \( 2 \)$ change of the $Z$ input coordinates at one vertex, using that change at every component and in both primal modes. Indeed $E$ has no $Z$ entries, so the prescribed self-Grams and all frame injectivities are preserved; the transformation is a bijection of the finite uniform frame space. Tester summaries are unchanged. This is a symmetry of the raw law, not a claim that $T^1$ is invariant. Under a change of variables in a parameter test it moves the bounded row-bit space in 21, part Lemma 5.5 while preserving the unfiltered empirical mass of any test depending only on the resulting key and on unchanged tester data.
] <rem:Z-reparametrization>

Choose $r_0$ only after the preceding parameters and the bounded rank requirements in Section 6, Section 8; retain $h = 1000 r_0$. Finally choose $M_0$ large enough for every stated nominal-coefficient and scalar-record cost to be the required small fraction of $N = M_0 n$. None of the finite-test accuracies used later changes these choices.

== 6 Recipes and realization of the gradients <sec:realization>

We now construct finite certificates for the four cross holes between two units. The witnesses will be sums of point atoms. Matching their vector keys will give the shared tensors in (2.1); the main task is to arrange the gradient identities on the whole cut-profile space. We reduce that task to prescribing $O \( n \)$ scalar cross Gram entries. 7 will estimate the probability that the actual frames satisfy those prescriptions.

We use the nominal coefficient spaces of 4. For a unit $O$ and component $e$, these are

$ cal(L)_(O \, e) = xor.big_(i in O) \( cal(B)_i xor H_i^(+) \) \, #h(2em) cal(R)_(O \, e) = xor.big_(i in O) \( cal(B)_i xor H_i^(-) \) \, #h(2em) H_i^plus.minus = bb(F)_2^h . $

Their images are obtained by summing the corresponding frame columns in the common ambient space. If $i'$ is the other endpoint of $O$, put $p_i = u_(i') U_i in cal(X)^(*)$.

=== 6.1 Paired witnesses and scalar recipes <paired-witnesses-and-scalar-recipes>

For every cross pair $i \, z$, choose between one and seven atoms at $i$ and the same number at $z$, with a bijection preserving the tag and the diagonal bit $q$ of each position. At any one endpoint all labels in its two lists must be distinct and must avoid the exclusions of 19. Write $v_(i z)$ for the sum of its list toward $z$. For an atom $frak(a)_l \( s \, y \)$ at $i$, its nominal key direction at each incident component and sign is the copy of $v \( s \, y \)$ in endpoint $i$’s primal coefficient block. Its vector key is

$ #scale(x: 120%, y: 120%)[\(] P_(i e) v \( s \, y \) \, med Q_(i e) v \( s \, y \) #scale(x: 120%, y: 120%)[\)]_(e in.rev l) \, $

with a fixed order of its $2 \( g - 1 \)$ entries. Matching keys means equality in this order at every matched atom position. It gives $U_i v_(i z) = U_z v_(z i)$. If the two witnesses also have different $a$-values, the sharing and parity equations for a hole hold.

The gradient equations must in particular hold on the bounded effective spaces $C_i$. We record the cross pairings needed for these restrictions in a small table. Admissibility will let us test the table by separate filters on the two units; injection will eliminate obstructions supported on individual pinned primal directions.

#prodef([Definition 6.1.])[
  For a leaf and component, put
  $ cal(J)_(O \, e)^plus.minus = xor.big_(i in O) \( S_(i \, e)^plus.minus xor H_i^plus.minus \) . $
  For two leaves belonging to units $A \, B$, a small table specifies the two cross bilinear forms on $cal(J)_(A \, e)^(+) times cal(J)_(B \, e)^(-)$ and $cal(J)_(B \, e)^(+) times cal(J)_(A \, e)^(-)$, for every $e$. It is admissible for two orientations if it agrees with their actual cross Grams whenever at least one of the two table arguments is a stored pin direction.
  Let $H_(i \, 0)^plus.minus$ be the projection of the appropriate pin space onto $H_i^plus.minus$, and fix a complement $H_i^plus.minus = H_(i \, 0)^plus.minus xor H_(i \, 1)^plus.minus$. The complement is called private. We identify the two channel coordinate copies with $bb(F)_2^h$ in their common column order. The table is injecting if, for each component, each orientation of the roles $O \, O'$, and $i in O \, z in O'$, the following maps are injective:
  #[#set math.equation(numbering: n => "(6.1)")
   $ D_(O \, e)^(+) ∩ cal(B)_i & arrow.r bb(F)_2^h \/ H_(z \, 0)^(+) \, & d & mapsto upright("table evaluation of ") d upright(" against ") Y_z \,\
D_(O \, e)^(-) ∩ cal(B)_i & arrow.r bb(F)_2^h \/ H_(z \, 0)^(-) \, & d & mapsto upright("table evaluation of ") d upright(" against ") X_z . $ <eq:table-injection>]
  These quotient conditions use the standard coordinate dot pairing on the channels. For instance, the first image is zero in the quotient precisely when it pairs to zero with all vectors annihilating $H_(z \, 0)^(+)$.
] <def:small-table>

Contractions on $C_i$ computed from the table carry a star. Thus $\( u_z U_i \)^(*) \( x \)$, for $x in C_i$, is computed by writing $x_e$ in $S_(i \, e)^(+) ⊗ S_(i \, e)^(-)$ and taking the dot product of its two table evaluations against $Y_z \, X_z$. This is linear in $x$. All coordinates involved have bounded dimension, although that bound may depend on $h$.

A scalar recipe consists of the paired lists and requires, in both orientations of the two unit roles,

#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(upright("list toward ") z) q = 1 \, #h(2em) a \( v_(i z) \) + a \( v_(z i) \) = 1 \,\
T \( v_(i z) \, dot.op \) \|_(C_i) = #scale(x: 120%, y: 120%)[\(] a + \( u_z U_i \)^(*) #scale(x: 120%, y: 120%)[\)] \|_(C_i) \,\
\( p_i + a \) \( v_(i z) \) = \( p_(i') + a \) \( v_(i' z) \) . $ <eq:recipe-scalars>]

The odd sum of diagonal bits will give a low-rank representation of each target gradient. The role equation supplies the hole parity, and the next line specifies the gradient on $C_i$. The last equation couples the two endpoints of a unit; the next lemma shows that it gives the consistency needed to prescribe the gradients on all selected atoms.

#thm([Lemma 6.2.])[
  (Table flags and binary prescriptions).  #emph[The following statements hold.]
  + #emph[For a fixed pair of leaves and a numerical small table, admissibility is the intersection of two unary orientation filters, one on each unit. Its numerical coordinate data, including injection and the bases of the effective spaces, have bounded description length apart from the nominal coefficient bases, which require $O \( n \)$ bits.]
  + #emph[The key directions of the lists at either unit are jointly independent modulo its table-coordinate spaces, component by component and sign by sign.]
  + #emph[Given (6.2), there is a prescription of the binary $L \, R$ evaluations between distinct atoms at each endpoint, depending only on their tags, tester summaries and $p$ bits, which makes 
#[#set math.equation(numbering: n => "(6.3)")
 $ r \( v_(i z) \) \( x \) = cases(delim: "{", 0 \, & x upright(" is an atom of the list toward ") z \,, p_(z') \( tilde(x) \) \, & x upright(" is an atom toward ") z' \,) $ <eq:recipe-gradients>]

 where $z'$ is the other endpoint of the opposite unit and $tilde(x)$ is the matched atom there.]
] <lem:small-tables>

#proof[
  A pin image is fixed on its leaf. A cross entry with a pinned first argument therefore depends only on the other unit’s orientation, and conversely for a pinned second argument. Entries with both arguments pinned are numerical tests on the leaf pair. This proves the first assertion about filters. Use bases of the projected pin spaces to encode tensors of $C_i$: their coordinates lie in spaces of dimension at most $K^2$, and there are at most $K^2$ basis tensors. The pin, projection and channel relationships and the table are bounded-dimensional matrices. The nominal bases themselves have $O \( K dim cal(B) \) = O \( n \)$ coefficients.
  For the second assertion, project a purported dependence onto an individual primal coordinate block. It expresses a sum of at most fourteen selected rays as an element of $S_(i \, e)^plus.minus$. Any nonzero such vector would have a sparse representation on selected labels and is forbidden by 19. Independence of those label factors and the nonzero constant coordinate of each point then makes all coefficients zero. The channels introduce no relation because the table space is the direct sum of its individual primal and channel blocks.
  For the last assertion, at one endpoint let $I_1 \, I_2$ be its two disjoint nonempty lists. The matrix of $T$ on its atoms must be symmetric, with diagonal $a$ on each atom. Prescribing the two list sums of its rows is possible exactly when their self-pairings equal the corresponding diagonal sums and their mutual pairings agree. To see sufficiency, subtract any symmetric matrix with the required diagonal. The remaining task prescribes an alternating form on the span of the two independent list indicators and its pairings with the whole coordinate space. Extend those indicators to a basis, retain the prescribed entries in their rows and columns, and assign the remaining alternating entries arbitrarily.
  For (6.3), the self-pairing requirements hold because $T \( v \, v \) = a \( v \)$. Mutual consistency is
  $ p_z \( v_(z i) \) + p_(z') \( v_(z' i) \) = a \( v_(i z) \) + a \( v_(i z') \) . $
  The coupled equation at the opposite unit gives the left side as $a \( v_(z i) \) + a \( v_(z' i) \)$, which equals the displayed right side by the two role-sum equations in (6.2). Thus the symmetric matrix exists.
  Every off-diagonal entry can be implemented by formal $L \, R$ bit prescriptions on that pair of atoms. The value of $T^0$ is already determined by their tester summaries. Choose one indexed product term in $T^1$ linking a component of the first star to a component of the second star; set its two factors to give the desired correction and set all other product factors to zero. Forward and reverse evaluations are distinguished. The two labels at this endpoint differ, so these are the indexed ordered evaluations covered by 21. This argument specifies the bits; their occurrence in parameter tests will be supplied by 47. It makes no assumption about independence of arbitrary actual evaluations at fixed points. ◻
]

=== 6.2 The deterministic realization theorem <the-deterministic-realization-theorem>

The small table provides starting values for the completion. The permanently prescribed entries are the actual cross pairings with pin or key directions; other table entries may change while we arrange the full gradient identities.

#thm([Theorem 6.3.])[
  (Gradient realization).  #emph[Suppose two units in fixed leaves have lists satisfying (6.2), the binary prescriptions yielding (6.3), equal matched keys, and an admissible injecting small table. Freeze their actual cross Gram entries whenever either argument is a pin or a key direction. Then there are abstract cross bilinear forms on the full nominal spaces, extending all these frozen entries, whose primal-versus-channel entries satisfy 
#[#set math.equation(numbering: n => "(6.4)")
 $ u_z U_i = r \( v_(i z) \) quad upright("on ") cal(X) #h(2em) \( i upright(" and ") z upright(" in opposite units") \) . $ <eq:realized-gradients>]

 Only the primal-versus-channel entries need be prescribed in the final test. Their number is at most $16 \| cal(E) \| h dim cal(B) = O \( n \)$, with its coefficient fixed before $M_0$. Agreement of the actual cross Grams with these entries produces all four cross holes, with witnesses $\( v_(i z) \, v_(z i) \)$.]
] <thm:gradient-realization>

#proof[
  Equal keys imply $U_i v_(i z) = U_z v_(z i)$, and the role sums in (6.2) supply the witness parity. It remains to construct the gradients. We distinguish abstract Gram entries from the random event that the actual entries agree with them.
  The construction has three steps. We first solve a relaxed linear problem, allowing an arbitrary bilinear correction on the unfrozen quotients. We then bound the rank of that correction, and finally factor it through the available channel coordinates.
  ===== 6.2.1 1. Linear solvability with the frozen data. <linear-solvability-with-the-frozen-data.>
  We begin with a baseline of bounded primal rank. At each component and sign choose a splitting of the table space as $cal(J) = D xor cal(J)'$, append the key space, and append an additional primal complement. The independence in 24 makes these splittings possible. Retain the small table on the product of the two table spaces and the actual frozen entries in any pin or key row or column. These prescriptions agree on their overlaps by admissibility. Set the free blocks from an additional primal complement to the opposite $cal(J)'$ to zero, in both orientations, and set the additional-primal by additional-primal block to zero. This defines baseline cross bilinear forms.
  Fix an opposite endpoint $z$. Let
  $ F_(z \, e)^0 : cal(L)_(O \, e) arrow.r bb(F)_2^h \, #h(2em) G_(z \, e)^0 : cal(R)_(O \, e) arrow.r bb(F)_2^h $
  be evaluation against its $Y_z \, X_z$ channels. On additional primal inputs, evaluation of an opposite channel factors through its projection from $cal(J)$ onto $D$; hence the rank there is at most $dim D$. The remaining primal inputs are in bounded-dimensional projected pin and key spaces. It follows that the ranks of both baseline maps on all primal inputs are bounded independently of $r_0 \, h \, n$. Arbitrary channel-channel entries of the small table do not affect this bound. A uniform bound for either map on the combined primal inputs of the two endpoints is
  #[#set math.equation(numbering: n => "(6.5)")
   $ B_(upright("lin")) = 3 K + 28 : $ <eq:baseline-rank-bound>]
  the opposite pin projection costs at most $K$ dimensions, the two individual projected primal spaces cost at most $2 K$, and the two endpoints have at most twenty-eight key rays.
  Let $u_z^0 U_i$ denote the resulting contractions. They give the table values on $C_i$. On a selected atom toward $z$ they are zero, since its tensor is the equal-key tensor at $z$ and $u_z U_z = 0$. On a selected atom toward $z'$ they equal $p_(z')$ of its matched atom, since that tensor is the corresponding tensor at $z'$. These are precisely the values in (6.3).
  We next describe the changes that preserve the frozen entries. Let $cal(A)_(O \, e)^plus.minus$ be the span of all key directions on the indicated side of the unit, and put
  $ cal(F)_(O \, e)^plus.minus = D_(O \, e)^plus.minus + cal(A)_(O \, e)^plus.minus . $
  Write bars for the quotients
  $ overline(cal(L))_(O \, e) = cal(L)_(O \, e) \/ #scale(x: 120%, y: 120%)[\(] cal(F)_(O \, e)^(+) + xor.big_i H_(i \, 1)^(+) #scale(x: 120%, y: 120%)[\)] \, quad overline(cal(R))_(O \, e) = cal(R)_(O \, e) \/ #scale(x: 120%, y: 120%)[\(] cal(F)_(O \, e)^(-) + xor.big_i H_(i \, 1)^(-) #scale(x: 120%, y: 120%)[\)] . $
  We may change $F_z^0 \, G_z^0$ by any maps
  #[#set math.equation(numbering: n => "(6.6)")
   $ delta F_(z \, e) : overline(cal(L))_(O \, e) arrow.r \( H_(z \, 0)^(-) \)^perp \, #h(2em) delta G_(z \, e) : overline(cal(R))_(O \, e) arrow.r \( H_(z \, 0)^(+) \)^perp . $ <eq:allowed-channel-changes>]
  Here each map is extended to a bilinear change supported on its opposite channel block and zero on the opposite primal blocks. It vanishes on all frozen entries: the domain quotient kills frozen directions on one side, while on the other side a pin’s channel projection lies in $H_(z \, 0)$ and is annihilated by the allowed values. A reciprocal-role change in the same Gram block contributes nothing on this map’s primal inputs, because it is supported on a channel argument there. On private-by-private blocks both changes are zero. They may add further channel-channel values, which are irrelevant to the primal contractions. Thus all choices below may be made independently for opposite endpoints and for the reciprocal unit roles as far as primal-input values are concerned.
  Fix $z$ and solve simultaneously for the two $i in O$. The change in a contraction has the form
  $ \( F_z^0 + delta F_z \) dot.op \( G_z^0 + delta G_z \) - F_z^0 dot.op G_z^0 = F_z^0 dot.op delta G_z + delta F_z dot.op G_z^0 + delta F_z dot.op delta G_z . $
  The last term is bilinear on the barred quotients. Temporarily allow it to be an arbitrary such form, independent of the two derivative terms. This gives the linear space of responses formed by
  $ F_z^0 dot.op delta G_z + delta F_z dot.op G_z^0 $
  and all bilinear forms on $overline(cal(L))_(O \, e) times overline(cal(R))_(O \, e)$, with their contractions summed over components on each individual cut profile. We claim that the pair of target forms
  #[#set math.equation(numbering: n => "(6.7)")
   $ #scale(x: 120%, y: 120%)[\(] r \( v_(i z) \) - u_z^0 U_i #scale(x: 120%, y: 120%)[\)]_(i in O) $ <eq:target-difference>]
  belongs to this response space.
  We prove this by examining its annihilator. The key point is that every annihilating pair of profiles is a sum of effective-space profiles and selected atoms, on all of which the target is already correct. The argument starts with arbitrary profiles in $cal(X)^O$.
  Let $\( x_i \)_(i in O) in cal(X)^O$ annihilate all responses. Annihilating the arbitrary pure bilinear forms says that at each component the sum of the two nominal tensors has zero image in the product of barred quotients. Project further onto the individual primal spaces modulo $S_(i \, e)^plus.minus$ and the individual key spans. This projection is well defined on the barred spaces, since every pin projects into $S_(i \, e)^plus.minus$. It shows that $x_(i \, e)$ vanishes after both such quotients. A matrix killed after quotienting its two factors by spaces of dimensions $d_(+) \, d_(-)$ has rank at most $d_(+) + d_(-)$: in bases extending those spaces all entries outside their rows and columns vanish. Consequently
  $ "rank" x_(i \, e) lt.eq 2 K + 28 lt.eq R_(*) . $
  Apply 18 to every component.
  For a selected label at $i$, compare its label summand with all key directions in that component. Their combined label set has at most $R_(*) + 14$ elements, whose direction spaces $p_s ⊗ bb(F)_2^(1 + d_(upright(b)))$ form a direct sum. Any vector of $S_(i \, e)^plus.minus$ in this sum has zero component at the selected label, by 19. Thus this summand of $x_(i \, e)$ projects to zero modulo just its individual key ray if the atom uses this component, and is zero if there is no such ray. In the former case, writing its affine base vector as $v = \( 1 \, y \)$, a symmetric matrix killed in the two quotients by $v$ has the form
  $ Z = c v v^(sans(T)) + v d^(sans(T)) + d v^(sans(T)) . $
  Indeed choose $v$ as the first basis vector: the surviving matrix can be supported only on its first row and column. The moment identities in the original affine coordinates now give
  $ Z_(i i) = c v_i \, #h(2em) Z_(0 i) = c v_i + d_i + d_0 v_i \, $
  so $d_i = d_0 v_i$ and $Z = c v v^(sans(T))$.
  The cut relation on any triangle of tags separates label by label: the union of the three supports has at most $3 R_(*)$ labels, within the interpolation bound. At this selected label the nonzero components lie on its tag star; the triangle relation forces their scalar coefficients to be equal. Subtract that scalar multiple of the selected atom from $x_i$. Do this for every selected label. Each subtracted atom annihilates the response space, because both its factor directions are keys. The remaining profiles still annihilate the response and have only unselected label support. Removing these separated label blocks does not increase their component ranks or label support sizes.
  At one component contract a remaining $x_(i \, e)$ on the minus side by a primal functional $phi.alt$ at $i$ annihilating $S_(i \, e)^(-)$ and all individual key directions. Extend $phi.alt$ by zero on other endpoint and channel blocks; it is a functional on $overline(cal(R))_(O \, e)$. Pure annihilation shows that the resulting individual plus vector $d$ is a sum of a pin, key directions, and private channel directions. In this representation all key coefficients vanish. To see this, project onto each individual primal block. At the other endpoint the projected pin would be a sparse sum of selected rays. At endpoint $i$ it is the difference of the vector $d$, supported on at most $R_(*)$ unselected labels, and a sum of at most fourteen selected rays. In both cases the label exclusion forces every coefficient on a selected ray to vanish. The channel components of the pin lie in the protected spaces $H_0$, whereas the remaining channel term lies in their chosen complements $H_1$. They must both vanish. Therefore
  $ d in D_(O \, e)^(+) ∩ cal(B)_i . $
  Test the derivative response using $delta G_(z \, e) = phi.alt ⊗ c$ for arbitrary $c in \( H_(z \, 0)^(+) \)^perp$. It gives $F_(z \, e)^0 \( d \) dot.op c = 0$. Hence the table evaluation of $d$ is zero modulo $H_(z \, 0)^(+)$, and injection in (6.1) yields $d = 0$. The reciprocal contraction proves the same assertion in the minus mode.
  It follows that the remaining component tensors lie in the products of the individual projected pin plus key spaces. Their support on unselected labels removes the key directions by the same sparse-label argument. Thus the remaining profiles belong to $C_i$. We have proved that every annihilator is a sum of effective-space profiles and selected atoms. The target (6.7) vanishes on the former by (6.2) and on the latter by (6.3) and the baseline values. In a finite-dimensional vector space the image of a linear map is the annihilator of the kernel of its dual: this follows by extending a basis of the image to a basis of the target space. It proves the claimed linear solvability.
  ===== 6.2.2 2. A correction of controlled rank. <a-correction-of-controlled-rank.>
  The relaxed solution need not yet fit through $h$ channel coordinates. We first remove an explicit low-rank part of the target; the remaining task will admit a rank bound independent of $r_0 \, h \, n$. For one $i$, the form $r \( v_(i z) \)$ has a matrix representation on the components of rank at most
  #[#set math.equation(numbering: n => "(6.8)")
   $ 15 r_0 + 14 J \| cal(E) \| $ <eq:unconstrained-gradient-rank>]
  per component. Here is an explicit routing for its tester part. Let $\( w_t \)$ be the representation given by its atom list. The list condition gives $chi_(*) \( w \) = sum q = 1$. On an allowed $O_(d \, t)$ block at any tag the coefficient in $a + T^0 \( v_(i z) \, dot.op \)$ is
  $ 1 + a \( v_(i z) \) + b_t \( v_(i z) \) = 1 + chi_(*) \( w \) + eta_S \( w_t \) = eta_S \( w_t \) . $
  There are at most seven tags $t$ with nonzero $eta_S \( w_t \)$. Route this tester from each allowed tag $l in I_d$ to $d$ through the component ${ l \, d }$. It contributes nothing at $d$, where $O_(d \, t)$ is disallowed. At a component this uses at most fourteen ordinary testers, allowing either endpoint as center. For the shared tester, route a star centered at $t$ with coefficient $a_t \( v_(i z) \)$. Its contribution at the center is $\( g - 1 \) a_t \( v_(i z) \) = 0$, and at any other tag it gives the desired term in $a_t \( v_(i z) \) b_t$. Consolidating gives at most one shared tester per component. Each ordered tester matrix has rank $r_0$, proving the $15 r_0$ bound.
  For $T^1 \( v_(i z) \, dot.op \)$, each of the two orientations of an indexed term supplies a matrix of rank at most the component rank of $v_(i z)$. This profile is a sum of at most seven atoms, so its total component rank is at most $7 \( g - 1 \)$. The total contribution per component has rank at most $14 J \( g - 1 \) lt.eq 14 J \| cal(E) \|$. This proves (6.8).
  We project these representing matrices away from the bounded pin and key spaces. Let $M_(i \, e)$ be the preceding representing matrices. On each individual primal factor choose a projection $A_(i \, e)^plus.minus$ whose kernel is the sum of its projected pin and key spaces. The matrix $\( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) A_(i \, e)^(-)$, extended by zero outside that individual block, is a permitted pure quotient form. Its sum over $i$ has rank at most twice (6.8). Moreover
  #[#set math.equation(numbering: n => "(6.9)")
   $ M_(i \, e) - \( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) A_(i \, e)^(-) & = \( I - A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) + \( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) \( I - A_(i \, e)^(-) \) \,\
"rank" #scale(x: 120%, y: 120%)[\(] M_(i \, e) - \( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) A_(i \, e)^(-) #scale(x: 120%, y: 120%)[\)] & lt.eq "rank" \( I - A_(i \, e)^(+) \) + "rank" \( I - A_(i \, e)^(-) \) lt.eq 2 K + 28 . $ <eq:bounded-rank-removal>]
  Subtract these pure forms from the linear task. Its residual, including the baseline contraction, has a per-individual matrix representation of bounded rank independent of $r_0 \, h \, n$, and remains linearly soluble.
  In any unrestricted solution, replace the derivative output maps by bounded-rank maps in the same allowed value spaces, preserving all their dot products with the opposite baseline values on primal inputs. Such replacement is possible as follows. The map from the allowed value space to the dual of the span of those baseline values has bounded rank. Choose a linear section of its image and compose with that map. This has bounded-dimensional image and preserves every observed pairing. Postcomposing the original derivative map with this value projection leaves its primal derivative response unchanged and preserves its domain quotient. The two new derivative maps have bounded rank. Their extra product $delta F_z dot.op delta G_z$ is also a bounded-rank pure form, which we include with opposite sign in the remaining pure task. That task still has an unrestricted pure solution. Its per-individual target matrices have rank at most
  #[#set math.equation(numbering: n => "(6.10)")
   $ R_(upright("res")) = 2 K + 28 + 4 B_(upright("lin")) = 14 K + 140 . $ <eq:residual-rank-bound>]
  Here the first term bounds the projection difference, one $B_(upright("lin"))$ bounds the baseline contraction, two bound the derivative terms, and one bounds their extra product.
  To obtain a bounded-rank pure solution, we compress the base coordinates while preserving the cut-profile domain and the residual target. At endpoint $i$, expand all projected pin and key vectors, and all row and column forms in its bounded-rank target representation, along selector coordinates and base blocks. Their counts depend on earlier construction parameters but not on $r_0 \, h \, n$. On each ordinary base block let $U$ be the span of the vectors to fix and $K_0$ the common kernel of the forms to preserve. Choose a complement in $K_0$ to $U ∩ K_0$, and project along that complement onto a subspace containing $U$. The resulting endomorphism fixes $U$, preserves all the forms, and has rank at most $dim U + "codim" K_0$. There are at most $2 \| cal(E) \| \( K + 14 \)$ vectors to fix and at most $2 \| cal(E) \| R_(upright("res"))$ forms to preserve at one endpoint before selector expansion. Thus an explicit bound for the rank on an ordinary block is
  #[#set math.equation(numbering: n => "(6.11)")
   $ D_(upright("blk")) = 2 p_(*) \| cal(E) \| \( K + 14 + R_(upright("res")) \) . $ <eq:block-compression-bound>]
  Use these endomorphisms blockwise, fix the constant base coordinate, and act trivially on the selector factor. Use the same resulting map at every component and in both modes at this endpoint. It sends each allowed point to an allowed point and therefore preserves all $W_l$ and the cut domain. It fixes the individual projected pin and key vectors. Taking identity on channels consequently fixes every mixed pin itself and preserves private channel subspaces. The map descends to the barred spaces and has bounded rank there: only the bounded protected channel dimensions survive their quotients. On either barred space a uniform bound is
  #[#set math.equation(numbering: n => "(6.12)")
   $ D_(upright("quo")) = 2 p_(*) #scale(x: 120%, y: 120%)[\(] 1 + \( g^2 + 3 \) D_(upright("blk")) #scale(x: 120%, y: 120%)[\)] + 2 K . $ <eq:quotient-compression-bound>]
  The first term counts the two compressed primal blocks and the second bounds their surviving channel projections.
  Precompose an unrestricted pure solution on its two arguments with these maps. Its rank per component becomes bounded. On individual cut profiles its value is unchanged, because the compressed profile remains in that cut domain and every form in the target representation is preserved. It is therefore the required bounded-rank pure solution.
  ===== 6.2.3 3. Realization through the channels. <realization-through-the-channels.>
  Restore the earlier projected pure forms. Their sum with the compressed correction has rank at most
  #[#set math.equation(numbering: n => "(6.13)")
   $ 30 r_0 + 28 J \| cal(E) \| + D_(upright("quo")) $ <eq:final-pure-rank>]
  per component for the fixed opposite endpoint. In particular the additive constant is independent of $r_0 \, h \, n$. In the two allowed channel value spaces impose, in addition, orthogonality to the opposite baseline and bounded derivative values on primal inputs. These are only boundedly many linear restrictions. Each remaining value space has codimension at most $K + 2 B_(upright("lin"))$, so their dot pairing has rank at least $h - 2 K - 4 B_(upright("lin"))$: restricting a nondegenerate pairing by codimensions $c_1 \, c_2$ loses at most $c_1 + c_2$ in rank. With $h = 1000 r_0$, the sufficient requirement is
  #[#set math.equation(numbering: n => "(6.14)")
   $ 970 r_0 > 28 J \| cal(E) \| + D_(upright("quo")) + 2 K + 4 B_(upright("lin")) . $ <eq:realization-r0-requirement>]
  Every quantity on its right is fixed before $r_0$, so this is one of the permitted requirements on that choice.
  Factor a rank-$r$ desired pure bilinear form as $sum_(a = 1)^r ell_a ⊗ m_a$. Choose vectors $f_a \, g_a$ in these remaining channel spaces with $f_a dot.op g_b$ equal to the Kronecker delta; they exist by the pairing rank. The changes $sum_a ell_a f_a$ and $sum_a m_a g_a$ realize that form as their dot product. Their cross terms with the baseline and the previous small derivative changes vanish on primal inputs by the additional orthogonality conditions. They obey (6.6) and hence preserve every frozen entry. This realizes the target exactly for both endpoints $i in O$.
  Repeat for both opposite endpoints and both unit roles. The independence of primal-input changes already proved ensures that the resulting two cross Gram blocks realize all equations (6.4) simultaneously. Only primal-channel entries have been used. In each of the two blocks there are at most $8 h dim cal(B)$ such entries per component, proving the asserted count. Actual agreement with them gives all gradient equations; equal keys and the role sums give the other witness conditions. All four cross pairs are therefore holes. ◻
]

== 7 From overlapping key distributions to four holes <sec:collision>

The deterministic construction becomes useful when its keys collide. The principal cost is equality of ambient vectors; the remaining primal-channel scalar entries have a smaller cost. We give a criterion that retains this distinction, including for cells selected using the parameters on the opposite side.

=== 7.1 Queries and their reference measure <queries-and-their-reference-measure>

A numerical template fixes the shape of all lists in a scalar recipe: positions, endpoints, tags, labels, flavors and desired $q$ bits, with matching tags and $q$ bits across the two sides. It also fixes each atom’s #emph[numerical unary status]: its tester summary, role $a \( upright("atom") \)$, basis values of $T \( upright("atom") \, dot.op \) \|_(C_i)$, and $p_i$ bit. It fixes the within-endpoint $L \, R$ bit prescriptions of 24. Its labels are distinct at every endpoint. For a fixed pair of leaves it may specify a small table and two separate orientation filters, including its admissibility filters. Only choices for which equal accepted keys satisfy the hypotheses of 25 will be used.

The query at a unit draws fresh independent point parameters at all its positions and evaluates their keys. Parameters may be uniform on the retained flavor coordinates, or normalized conditional on the prescribed, possible $q$ bit at each position. This latter conditioning depends only on point parameters and has a fixed positive probability whenever it is possible. In particular the two units’ parameter draws remain independent. No normalization is made for the other status, binary, Gram or orientation acceptance conditions. Every resulting accepted measure is a subprobability measure.

Let $k$ be the number of ambient vector slots on one template side, counting components and signs. There are at most four lists of seven atoms, each with $2 \( g - 1 \)$ slots, so

#[#set math.equation(numbering: n => "(7.1)")
 $ k lt.eq 56 \( g - 1 \) = k_max . $ <eq:key-rank-budget>]

Let $cal(K)_n$ be the set of global tuples of these $k$ vectors satisfying the prescribed paired diagonal bit at every position and component, and having every off-position plus/minus inner product within a component equal to zero. Write $nu_n$ for the uniform probability measure on $cal(K)_n$.

The set $cal(K)_n$ has density bounded below by a positive constant in the space of all $k$ independent uniform vectors, and

#[#set math.equation(numbering: n => "(7.2)")
 $ \| cal(K)_n \| lt.eq 2^(k N) . $ <eq:key-space-size>]

Indeed the number of slots is fixed. With probability tending to one the plus vectors in each component are independent; given them, each minus vector fulfills a fixed list of independent linear equations with the prescribed probability $2^(- r)$, where $r$ is the number of equations on it. Their total number is fixed. This supplies a constant lower bound, including all diagonal and off-position requirements. Queries are accepted only when their keys belong to $cal(K)_n$.

For a pair of leaves, let $d_A \, d_B$ be the densities relative to $nu_n$ of the separate accepted key measures, integrating over their normalized leaf orientation laws and parameter draws. The densities include their orientation filters and all query conditions but are not renormalized for success. Thus $integral d_A thin d nu_n \, integral d_B thin d nu_n lt.eq 1$.

#thm([Proposition 7.1.])[
  (Collision criterion).  #emph[Let $sigma$ be a unit law in 6, and let $tilde(sigma)$ be a restriction of it of relative mass at least $2^(- o \( N \))$, decomposed into leaves satisfying (4.7). Mix the leaves with their actual masses in $tilde(sigma)$. Suppose accepted numerical queries as above, with their leaf-pair choices of table and separate filters, satisfy 
#[#set math.equation(numbering: n => "(7.3)")
 $ bb(E)_(upright("independent leaf pair")) integral d_A d_B thin d nu_n gt.eq 2^(- o \( N \)) . $ <eq:overlap-criterion>]

 Then two independent units from the original $sigma$ have all four cross holes with probability at least 
#[#set math.equation(numbering: n => "(7.4)")
 $ 2^(- \( k_max + .03 \) N - o \( N \)) . $ <eq:collision-conclusion>]

 It suffices to obtain (7.3) after skipping some leaf pairs, or after summing over a bounded number of numerical options. Positive subsequential constants and inverse-polynomial overlap bounds both suffice. In particular, this conclusion contradicts a sequence violating 6.]
] <prop:collision>

#proof[
  We first work with one shape of vector slots and one option per leaf pair. A bounded number of shapes or options will be handled at the end.
  ===== 7.1.1 The numerical records. <the-numerical-records.>
  Fix two leaves, a key $q in cal(K)_n$, and point parameter values $a \, b$ on the two sides. Freeze the images of all pin and key directions. The pin images are known from the leaves and the key images are the entries of $q$. At each unit record the pairings of all its nominal columns with these opposite frozen images. Record any numerical statuses in (6.2), (6.3) not already fixed by the query conditions. For fixed parameters these records, together with acceptance, partition the unit’s orientations into unary cells. A partition is allowed to depend on the opposite parameters; it does not depend on the opposite orientation once its frozen images have been specified.
  There are at most
  #[#set math.equation(numbering: n => "(7.5)")
   $ L_n = 2^(C n) $ <eq:record-count>]
  cells on either side, for a constant $C$ fixed before $M_0$. To verify the count, there are $O \( dim cal(B) + h \) = O \( n \)$ columns and only boundedly many pin and key vectors to pair against. Nominal projected-pin bases use $O \( n \)$ coefficients. The basis tensors of $C_i$ are encoded in their bounded projected pin bases, rather than as full matrices on $cal(B)$; this uses boundedly many further coordinates. Parameter values require $O \( n \)$ bits and the remaining table and status information has bounded size. The ambient pin and key images are already fixed and are not charged again as new records.
  The numerical records determine every frozen cross entry. Together with the fixed algebraic data, leaves, parameters, and table, they determine a choice of the abstract solution in 25. One can make this choice deterministic by taking the first solution in fixed coordinate orders on the finite spaces. Its unknown entries need not be encoded as additional records. Any further orientation acceptance test is only a predicate; its description is not an additional input to this solver.
  ===== 7.1.2 Pruning at a fixed parameter pair. <pruning-at-a-fixed-parameter-pair.>
  Put
  #[#set math.equation(numbering: n => "(7.6)")
   $ tau_n = 2^(- \( k + .01 \) N) . $ <eq:cell-threshold>]
  For the fixed parameter pair $\( a \, b \)$ and key $q$, let $alpha_a^b \( c \; q \)$ be the mass of a first-side accepted orientation in record cell $c$, measured in its normalized leaf law. Define $beta_b^a \( d \; q \)$ similarly. Denote their sums over records by $alpha_a \( q \) \, beta_b \( q \)$; these sums do not depend on the opposite parameter, since it only refines the record partition. Their sums over all keys are at most one.
  Discard for this fixed pair only cells of mass less than $tau_n$. The product mass lost from small first-side cells at key $q$ is at most
  $ L_n tau_n thin beta_b \( q \) . $
  Sum over keys and average the independent parameter weights. The loss in collision probability is at most $L_n tau_n$, since $sum_q beta_b \( q \) lt.eq 1$ for every $b$. The reciprocal loss is at most the same amount. Because $nu_n$ is uniform, the overlap integral is $\| cal(K)_n \|$ times the probability of an accepted key collision. Thus the total overlap loss, for any fixed leaf pair and also after averaging leaf pairs, is at most
  #[#set math.equation(numbering: n => "(7.7)")
   $ 2 \| cal(K)_n \| L_n tau_n lt.eq 2^(1 + C n - .01 N) lt.eq 2^(- .005 N) $ <eq:fubini-pruning>]
  for the chosen sufficiently large $M_0$ and all sufficiently large $n$.
  Every retained cell is its original unary cell and has mass at least $tau_n$. We have not intersected the retained sets over different opposite parameter values; such an intersection could reduce a cell below its threshold. Instead all subsequent estimates are made for this fixed parameter pair and its unaltered cells, and then averaged. This preserves both their mass bounds and the product of the two conditional orientation laws.
  ===== 7.1.3 Image entropy inside a retained cell. <image-entropy-inside-a-retained-cell.>
  By 24, the $k$ nominal key directions are jointly independent modulo the pins, with rank computed separately by component and sign and jointly across the two endpoints. Suppose a further tuple has rank $t gt.eq 1$ modulo pins and these key directions. Apply (4.7) to the combined tuple of rank $k + t$, prescribe the known key images and any images of the further tuple, and divide by the cell mass at least $tau_n$. Its largest conditional point mass is at most
  #[#set math.equation(numbering: n => "(7.8)")
   $ 2^(- \( 1 - 2 zeta \) \( k + t \) N + \( k + .01 \) N) & = 2^(\[ - \( 1 - 2 zeta \) t + .01 + 2 zeta k \] N) lt.eq 2^(- .95 t N) . $ <eq:cell-pmax>]
  Here $k lt.eq k_max$ and $zeta = 1 \/ \( 1000 k_max \)$, so $.01 + 2 zeta k lt.eq .012$. The inequality holds for every $t gt.eq 1$, including tuples whose rank grows with $n$. Further restrictions defining the cell cause no additional loss: the numerator was bounded by an event containing the entire cell and the prescribed images, and only the original cell mass has been divided out.
  ===== 7.1.4 Testing the remaining scalar Gram entries. <testing-the-remaining-scalar-gram-entries.>
  For a retained cell pair the abstract target is fixed. Let $s_n$ be the number of its tested primal-channel entries in the two cross Gram blocks. By 25 and the final choice of $M_0$,
  $ s_n lt.eq 16 \| cal(E) \| h dim cal(B) < .01 N . $
  Expand the indicator that all these entries agree with the target as a sum of $2^(s_n)$ binary characters, with the factor $2^(- s_n)$.
  A character has a coefficient tensor in the direct sum of the two cross nominal tensor products, over all components. Take its image after quotienting every nominal factor by pins and keys. If this image is zero, its value depends only on frozen cross entries. More explicitly the kernel of a tensor-product quotient is the sum of tensors with a frozen factor on at least one side; all their pairings have been recorded. The actual and target Grams agree there, so the disagreement character is identically one.
  Otherwise let $t gt.eq 1$ be the sum of the ranks of the quotient coefficient matrices, over components and the two cross orientations. A rank factorization expresses its phase, up to a constant and two separate phases involving frozen images, as
  $ sum_(a = 1)^t X_a dot.op Y_a . $
  On each unit the corresponding coefficient directions have joint rank $t$ modulo its frozen space. The two different cross orientations use opposite nominal signs, so their ranks add. By (7.8), each tuple of actual images has largest point mass at most $2^(- .95 t N)$ under its conditional cell law. The two laws are independent. Absorb the separated phases into bounded weights. 16, in dimension $t N$, bounds the absolute character mean by
  #[#set math.equation(numbering: n => "(7.9)")
   $ 2^(t N \/ 2) #scale(x: 120%, y: 120%)[\(] 2^(- .95 t N) 2^(- .95 t N) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) = 2^(- .45 t N) lt.eq 2^(- .45 N) . $ <eq:gram-character-bound>]
  There is at least the trivial character with value one, and all other zero-quotient characters also have value one. Consequently the conditional agreement probability on every retained cell pair is at least
  $ 2^(- s_n) #scale(x: 120%, y: 120%)[\(] 1 - 2^(s_n) 2^(- .45 N) #scale(x: 120%, y: 120%)[\)] gt.eq 2^(- s_n - 1) gt.eq 2^(- .02 N) $
  for all sufficiently large $n$. No independence of the individual tested Gram bits is asserted or required.
  ===== 7.1.5 Averaging and the exponent. <averaging-and-the-exponent.>
  The assumed overlap is subexponentially large. The error in (7.7) is exponentially small, so the retained collision probability, after averaging leaves and independent parameters, is at least $2^(- o \( N \)) \/ \| cal(K)_n \|$. Integrating the preceding scalar agreement bound gives four holes with probability at least
  $ 2^(- \( k + .02 \) N - o \( N \)) $
  under $tilde(sigma)^2$. This implication is valid even if many successful queries certify the same orientation pair: the fresh query experiment is a probability space, and its successful event is contained in the event that the underlying orientations have all four holes. The original law dominates its restricted normalized law by the restriction mass; for two independent draws this costs only another $2^(- o \( N \))$.
  If there are boundedly many options, sum the corresponding overlap quantities and choose one whose expectation is at least the sum divided by their number, or partition into these fixed cases. Shapes of $cal(K)_n$ and varying finite numerical formats can likewise be separated into boundedly many cases. These constant factors are absorbed by the slack from $.02$ to $.03$ in (7.4). Finally
  $ k_max + .03 = 56 \( g - 1 \) + .03 < 100 g \, $
  so (7.4) contradicts a sequence whose four-hole probabilities are less than $2^(- 100 g N)$. ◻
]

== 8 Phase estimates before key collisions <sec:phases>

The scalar recipes in (6.2) couple the two endpoints of each unit. We estimate the cross contractions that arise when these scalar conditions are tested against profiles in the effective spaces. These estimates will supply the compatible small tables in 9.

Throughout this section different units are independent, while the two endpoints of a unit may have arbitrary dependence. A marked unit is a unit together with choices $lambda_i in C_i^(upright("old"))$, $i = 1 \, 2$, where $C_i^(upright("old"))$ is its effective space after the first peeling. The marks may depend on the whole unit. Put

#[#set math.equation(numbering: n => "(8.1)")
 $ Delta_O = U_1 lambda_1 + U_2 lambda_2 \, #h(2em) u_(O \, S) = sum_(i in S) u_i quad \( S subset.eq { 1 \, 2 } \) . $ <eq:delta-phase>]

The effective-space rank bound and rank subadditivity give total component rank at most $2 K_1$ for $Delta_O$. We use the slightly larger budget $r = 2 K_1 + 2$.

One case explains why the four bits

$ u_(B \, 1) \( Delta_A \) \, quad u_(B \, 2) \( Delta_A \) \, quad u_(A \, 1) \( Delta_B \) \, quad u_(A \, 2) \( Delta_B \) $

are relevant. Suppose, for this calculation, that $p_i = T \( lambda_i \, dot.op \) + a$ on $cal(X)$, where $p_i = u_(i') U_i$, and that $c = a \( lambda_1 \) + a \( lambda_2 \)$ is common to the units. Test the recipe using the actual small table. Its effective-space equation and symmetry of $T$ give, for an endpoint $z$ of the opposite unit,

$ \( p_i + a \) \( v_(i z) \) = T \( lambda_i \, v_(i z) \) = a \( lambda_i \) + \( u_z U_i \) \( lambda_i \) . $

The coupled recipe equation is therefore

$ 0 = sum_(i = 1)^2 \( p_i + a \) \( v_(i z) \) = c + u_z \( Delta_A \) . $

The reciprocal equations require all four displayed bits to equal $c$. More general descriptions of the $p_i$’s lead to parities of the same four bits; Section 9, Section 13 identify the required parities. Here we prove estimates for arbitrary marks, without assuming the identities used in this illustrative case.

We use $L_0 \, d_0 \, u_0 \, K$ from (4.5), (4.4); in particular,

$ L_0 = ceil.l 100 \( D + 10 \) ceil.r \, #h(2em) d_0 = 4 r L_0 \, #h(2em) u_0 = 10 \( K_1 + d_0 + 1 \) . $

All fixed positive mass restrictions in the phase argument have lower bounds depending only on $D \, g \, K_1$ and fixed numerical tolerances. Their marginal densities are consequently at most $L mu$, for an $L$ depending only on these early parameters, and their joint densities are at most $2^(\( D + .01 \) N) mu^2$ for sufficiently large $n$. Fixed multiplicative factors affect only the lower bound on $n$.

#prodef([Definition 8.1.])[
  A componentwise cover is a collection of subspaces $T_e^plus.minus subset.eq V_e^plus.minus$. It covers a tensor $xi = \( xi_e \)_e$ if
  $ xi_e in T_e^(+) ⊗ V_e^(-) + V_e^(+) ⊗ T_e^(-) quad upright("for every ") e . $
  Its two mode dimensions are $sum_e dim T_e^(+)$ and $sum_e dim T_e^(-)$; its total dimension is their sum.
]

#thm([Theorem 8.2.])[
  (Phase alternative).  #emph[Suppose a marked-unit law is obtained by restricting an admissible law in 6 to mass at least $10^(- 12)$, and $Delta_O eq.not 0$ throughout. For all sufficiently large $n$, one can retain a sublaw of fixed positive relative mass, bounded below using only the early parameters, such that one of the following holds for independent draws $A \, B$:]
  + #emph[every nontrivial phase mean 
$ bb(E) \( - 1 \)^(u_(B \, S) \( Delta_A \) + u_(A \, R) \( Delta_B \)) \, #h(2em) \( S \, R \) eq.not \( diameter \, diameter \) \, $

 has absolute value less than $.005$;]
  + #emph[a componentwise cover of total dimension at most $d_0$ covers every $Delta_O$, and every displayed mean for which $\| S \| = 1$ or $\| R \| = 1$ is $2^(- Omega \( N \))$.]
  #emph[The cover may depend on the law and on $n$. The constants in its dimension bound and in the relative mass bound do not depend on the later selector or channel sizes.]
] <thm:phase-alternative>

In the first alternative, Fourier inversion gives every prescribed four-bit pattern probability at least $\( 1 - 15 \( .005 \) \) \/ 16$. In the second, only the characters using an even number of bits from each unit pair remain uncontrolled. The full-sum kernel $F \( A \, B \) = u_(B \, { 1 \, 2 }) \( Delta_A \)$ has rank $O \( N \)$ because $Delta_A$ belongs to the cover tensor space. 31 uses this rank bound to control the remaining phase conditions. When $F \( A \, A \) = 0$, it gives an inverse-polynomial lower bound for the event that all four bits equal a prescribed $c$. This smaller probability scale requires a separate final overlap argument.

The proof first tests for a cover whose mode dimensions may grow linearly with $N$. If no such cover carries appreciable mass, the following rank-growth lemma gives cancellation by a high-moment estimate. If such a cover exists, its offset coordinates permit the singleton estimates. A second concentration step either reduces that cover to bounded dimension or gives cancellation for the remaining characters as well.

#thm([Lemma 8.3.])[
  (Rank growth without a cover).  #emph[Let $r gt.eq 1$ be an integer, set $m_r = 100 r + 10$ and $q_r = 2^(- m_r)$, and let $s$ be a power of two with $s gt.eq 2^(m_r)$. Suppose $T_1 \, dots.h \, T_s$ are independent copies of a random tensor of total component rank at most $r$. If every fixed componentwise cover with dimension at most $r s$ in each mode has probability less than $p$, then 
#[#set math.equation(numbering: n => "(8.2)")
 $ bb(P) {"rank" (sum_(j = 1)^s T_j) < q_r s \/ 4} lt.eq 4^s p^(q_r s \/ 2) . $ <eq:no-cover-rank>]

 Here rank means the sum of component ranks.]
] <lem:no-cover-rank>

#proof[
  Regard all components as blocks in the direct sums of the two mode spaces. Their column and row spaces are direct sums of componentwise spaces, so that every cover obtained in this proof is componentwise. We first make a deterministic observation about any realized list of tensors.
  Expose a subset $E$ of the indices and quotient the two modes by the column and row spans of the exposed tensors. If $b = s - \| E \|$ indices remain, let $C_j \, R_j$ be their projected original column and row spaces. Define their span deficits by
  $ delta_C = sum_(j in.not E) dim C_j - dim sum_(j in.not E) C_j \, #h(2em) delta_R = sum_(j in.not E) dim R_j - dim sum_(j in.not E) R_j . $
  The projected sum has rank at least
  #[#set math.equation(numbering: n => "(8.3)")
   $ \# { j in.not E : overline(T)_j eq.not 0 } - delta_C - delta_R . $ <eq:rank-deficits>]
  Indeed, before adding the mode spaces, place the projected tensors on the separate formal summands $C_j ⊗ R_j$. Their block diagonal sum has rank at least the displayed number of nonzero tensors. Applying the two addition maps can decrease rank by at most their kernel dimensions, which are $delta_C \, delta_R$.
  There is an exposed set leaving $b = s \/ 2^j$ indices for some $0 lt.eq j < m_r$ such that $delta_C + delta_R lt.eq b \/ 4$. To prove this, order the realized direction spaces by a uniform random permutation. In either mode, let $a_t$ be the expected increase of their span dimension at the $t$-th step. Submodularity and exchangeability give
  $ r gt.eq a_1 gt.eq a_2 gt.eq dots.h.c gt.eq a_s gt.eq 0 . $
  For $b_j = s \/ 2^j$, set
  $ f_j = a_(s - b_j + 1) \, #h(2em) v_j = f_j - 1 / b_j sum_(t = s - b_j + 1)^s a_t . $
  Each remaining index has expected projected dimension $f_j$ immediately after the first $s - b_j$ exposures. Consequently its mode’s expected deficit divided by $b_j$ is $v_j$. The average increment on the first half of this tail is at least $f_(j + 1)$. It follows that
  $ v_j lt.eq f_j - f_(j + 1) + 1 / 2 v_(j + 1) . $
  Summing for $0 lt.eq j < m_r$ yields
  $ sum_(j = 0)^(m_r - 1) v_j lt.eq 2 \( f_0 - f_(m_r) \) - v_0 + v_(m_r) lt.eq 2 r . $
  The two modes therefore have total expected deficit ratios at most $4 r$ across these $m_r$ scales. Some scale has expected ratio less than $1 \/ 4$, and some permutation realizes a ratio at most $1 \/ 4$, as claimed.
  If the original sum has rank less than $q_r s \/ 4$, its projection at this exposed set has no larger rank. By (8.3), at most $q_r s \/ 4 + b \/ 4 lt.eq b \/ 2$ remaining tensors have nonzero projections. At least $q_r s \/ 2$ of them thus belong to the cover formed by the exposed column and row spans. Both cover dimensions are at most $r s$.
  For fixed disjoint index sets $E \, J$, with $\| J \| = ceil.l q_r s \/ 2 ceil.r$, condition only on the tensors indexed by $E$. The cover is then fixed, and the tensors indexed by $J$ are still independent. The probability that all are covered is at most $p^(\| J \|)$. There are at most $2^s$ choices for each index set. Taking their union proves (8.2). ◻
]

#proof[
  Write
  $ c_s = 10^(- 12) \( 1 + r \)^(- 4) \, #h(2em) q_0 = 2^(- 100 r - 10) \, #h(2em) theta = 10^(- 4) \, #h(2em) Gamma = D + 2 r + 10 \, $
  and let $s$ be the largest power of two not exceeding $c_s N$. For large $n$, it satisfies the size requirement of 29 and $s gt.eq c_s N \/ 2$. Choose $p_0 > 0$, using only these early parameters, so small that
  #[#set math.equation(numbering: n => "(8.4)")
   $ q_0 / 2 log_2 \( 1 \/ p_0 \) gt.eq 2 + log_2 \( 1 \/ theta \) + frac(2 Gamma, c_s) . $ <eq:early-p0>]
  When the channel size is chosen, require also
  #[#set math.equation(numbering: n => "(8.5)")
   $ frac(h q_0, 4) gt.eq log_2 \( 1 \/ theta \) + frac(2 Gamma, c_s) . $ <eq:early-h-moment>]
  Further lower bounds for $h$ arising below will again involve only early parameters.
  #emph[No large cover.] Suppose no fixed cover of dimension at most $r s$ in each mode has mass at least $p_0$. Fix a candidate value $xi$ of $Delta_B$, a nonempty $S$, and a set $R$. Define the unit-side sign $psi \( A \) = \( - 1 \)^(u_(A \, R) \( xi \))$. Against completely iid channel columns at the endpoints selected by $S$, expansion of the even $s$-th moment gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ & bb(E)_(upright(i i d med c h a n n e l s)) lr(|bb(E)_A psi \( A \) \( - 1 \)^(u_(B \, S) \( Delta_A \))|)^s\
 & #h(25mm)  lt.eq bb(E)_(A_1 \, dots.h \, A_s) 2^(- h "rank" \( Delta_(A_1) + dots.h.c + Delta_(A_s) \)) . $ <eq:phase-moment>]
  For one channel pair the expectation of its bilinear character on a tensor $xi$ is $2^(- "rank" xi)$. Independence over channels and components proves this assertion; selecting both endpoints only squares the factor. The signs $psi \( A_j \)$ have absolute value one and can be removed for an upper bound. By 29, the last expression is at most
  $ 2^(2 s) p_0^(q_0 s \/ 2) + 2^(- h q_0 s \/ 4) . $
  The channel marginal comparison in 13 multiplies this bound by a constant depending on $h$ and the number of components, but independent of $n$. Markov’s inequality and (8.4), (8.5) bound the probability that the inner mean has magnitude at least $theta$ by $C_h 2^(- Gamma N)$.
  There are at most $C_r 2^(2 r N)$ tensors of total component rank at most $r$: choose their component ranks, then factor each matrix through that rank. The component-rank choices and the overcounting factors are bounded independently of $n$. Take a union over these candidate values and the bounded choices of $S \, R$, and then pay the joint-law density $2^(\( D + .01 \) N)$. The exceptional $B$-mass is exponentially small. On all other $B$’s the conditional $A$-mean is at most $theta$, even after inserting the actual value $Delta_B$. Every required phase mean is therefore at most $theta + 2^(- Omega \( N \)) < .005$. Interchanging $A \, B$ deals with $S = diameter$. This proves the first alternative without a further restriction.
  #emph[A large cover and its offsets.] Otherwise retain mass at least $p_0$ in a fixed cover $\( T_e^(+) \, T_e^(-) \)$ of dimension at most $r s$ in each mode. Each individual primal frame span avoids these fixed subspaces except on exponentially small mass. Indeed its dimension is $dim cal(B)$, its location is uniform under $mu$, and
  $ bb(P)_mu { "im" P_(i e) ∩ T_e^(+) eq.not 0 } lt.eq 2^(dim cal(B) + dim T_e^(+) - N + 1) \; $
  the same estimate holds for the minus mode. Here $r s lt.eq r c_s N$ and $dim cal(B) \/ N$ is sufficiently small. The fixed marginal density bound permits deletion of these exceptions. Normalize the retained law, still denoted $rho$. Its marginal bound $rho_i lt.eq L mu$ has $L$ bounded in terms of the early parameters and $p_0$.
  Project both modes of each component modulo $T_e^plus.minus$. Because $Delta$ is covered, the two endpoint tensors have the same quotient. The projections are injective on the individual primal spans, so they preserve each tensor rank. Choose a shortest outer-product factorization of the common quotient tensor and lift each factor to the two endpoint primal spans. Componentwise, the difference has the form
  #[#set math.equation(numbering: n => "(8.7)")
   $ Delta = sum_alpha #scale(x: 120%, y: 120%)[\(] p_alpha b_alpha^(sans(T)) + a_alpha q_alpha^(sans(T)) + a_alpha b_alpha^(sans(T)) #scale(x: 120%, y: 120%)[\)] \, quad a_alpha in T^(+) \, quad b_alpha in T^(-) . $ <eq:cover-lifting>]
  The first endpoint is the reference here; its factors are $p_alpha \, q_alpha$, and those at the second endpoint are $p_alpha + a_alpha \, q_alpha + b_alpha$. The factor lists at either endpoint are independent in their respective modes.
  Choose bases for the spans of the offsets $a_alpha \, b_alpha$ in each component. Their combined ordered list is denoted $omega_O$, and its size is $t_O$, with
  #[#set math.equation(numbering: n => "(8.8)")
   $ 1 lt.eq t_O lt.eq 2 r . $ <eq:offset-rank>]
  The lower bound follows from $Delta eq.not 0$. Collect the companions of these offset basis vectors in a tuple $Z_O$: minus companions pair with plus offsets and vice versa. The companions are independent within each component and mode. For example, writing $b_alpha = sum_k c_(k alpha) omega_k^(-)$ gives a full-row-rank matrix $\( c_(k alpha) \)$, so the vectors $sum_alpha c_(k alpha) p_alpha$ are independent. Using the second endpoint as reference changes each companion by a known combination of offsets, and preserves independence.
  An offset record consists of these basis vectors, their component and sign assignments, and the bounded coefficient arrays in (8.7). Its logarithmic count is at most
  $ 2 r^2 s + O_(r \, g) \( 1 \) < .002 N $
  for sufficiently large $n$. Choosing a nominal representation of a companion tuple in one endpoint’s primal frame costs $2^(O \( r dim cal(B) \)) = 2^(O \( n \))$ possibilities. This last cost has an arbitrarily small ratio exponent after choosing $M_0$. Fix deterministic conventions for all these records and factorizations; their choices can be arbitrary functions of the marked unit.
  For a linear tensor functional $u$, let $Phi_u \( omega \)$ be the tuple obtained by contracting $u$ with the offset basis vectors. In particular, on a plus offset $a$ its corresponding plus output is $X \( Y^(sans(T)) a \)$; on a minus offset $b$ the minus output is $Y \( X^(sans(T)) b \)$. At fixed two offset records the phase in the theorem is, up to a sum of two unary phases,
  #[#set math.equation(numbering: n => "(8.9)")
   $ Z_A dot.op Phi_(u_(B \, S)) \( omega_A \) + Z_B dot.op Phi_(u_(A \, R)) \( omega_B \) . $ <eq:offset-walsh>]
  The unary phases are evaluations of the last term of (8.7); fixed offset records make them separate functions of $A$ and $B$.
  #emph[Singleton phase estimates.] All record laws in the following calculation are unnormalized subprobabilities of $rho$. For any record, the companion tuple alone has point masses at most
  #[#set math.equation(numbering: n => "(8.10)")
   $ p_max \( Z_O \) lt.eq 2^(- t_O N + .01 N) . $ <eq:companion-pmax>]
  To obtain this, enumerate its nominal primal representations, apply the individual frame-image estimate and the marginal bound $L mu$, and choose $M_0$ large enough to absorb the coefficient count and lost primal codimensions.
  Suppose $S = { j }$, and use endpoint $j$ as the reference for the $B$-companions. For fixed $omega_A$, discard pairs on which the coefficient lists $Y_j^(sans(T)) a$ or $X_j^(sans(T)) b$, for its independent offsets, fail full rank in any component. An individual channel frame is uniformly located by invariance. Comparing it to iid columns, the transpose-rank failure on $d$ independent ambient vectors is at most $2^(d - h + 1)$ for large $n$. Consequently the discarded pair mass is at most
  $ L thin O \( r \) thin 2^(2 r - h) < 10^(- 4) \, $
  on making $h$ sufficiently large using early parameters only.
  On the remaining pairs, the tuple $\( Z_B \, Phi_(u_(B \, j)) \( omega_A \) \)$ has point masses at most
  #[#set math.equation(numbering: n => "(8.11)")
   $ 2^(- \( t_B + t_A \) N + .02 N) . $ <eq:singleton-joint-pmax>]
  Here is a direct conditional count. Enumerate a nominal representation of $Z_B$, first test its values, and condition on the primal frames at endpoint $j$. The two channel maps are independent uniform-column draws in the appropriate annihilators, apart from a bounded injectivity conditioning. Freeze the values of $Y^(sans(T)) a$ and $X^(sans(T)) b$. Their number of possibilities is bounded in $n$, and their lists have full rank on the retained event. Ignore the equations that originally defined these coefficient values. Prescribing their images under $X$ and $Y$ then costs at least $\( N - dim cal(B) \) t_A$ bits, up to a bounded factor. Together with the primal companion test this gives (8.11). The ignored equations only enlarge the event, so no independence between a coefficient list and the map defining it has been assumed.
  Apply 16 to (8.9), on $\( t_A + t_B \) N$ bits, with the two tuples ordered as
  $ #scale(x: 120%, y: 120%)[\(] Z_A \, Phi_(u_(A \, R)) \( omega_B \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) #scale(x: 120%, y: 120%)[\(] Phi_(u_(B \, j)) \( omega_A \) \, Z_B #scale(x: 120%, y: 120%)[\)] . $
  On the $A$-side the point-mass bound for the entire tuple is no larger than (8.10); on the $B$-side use (8.11). Separate unary phases have absolute value one. The contribution for two fixed records is at most
  $ 2^(\( t_A + t_B \) N \/ 2) (2^(- t_A N + .01 N) 2^(- \( t_A + t_B \) N + .02 N))^(1 \/ 2) = 2^(\( - t_A \/ 2 + .015 \) N) . $
  There are at most $2^(.004 N)$ record pairs. By (8.8), their total is at most $2^(- .481 N)$. Thus every singleton phase mean is bounded by $10^(- 4) + 2^(- .481 N)$. The same proof applies when $\| R \| = 1$.
  #emph[A tiny cover or mixing of the full endpoint sum.] Put $delta = .0005$. If a cover of total dimension at most $d_0$ contains the whole offset list with probability at least $delta \/ 4$, restrict to those units. Delete units whose channel transpose at either endpoint is not injective on the fixed bases of that cover. The deletion has arbitrarily small fixed relative mass when $h$ is large; the required lower bound for $h$ uses only $L \, delta \, d_0$. On the remaining law every offset list passes the singleton rank test, so the preceding calculation has no pair discard and gives $2^(- Omega \( N \))$ for all singleton means. Every $Delta$ is covered by this fixed tiny cover. This is the second alternative.
  Assume instead that no such cover captures mass $delta \/ 4$. Fix an $A$-offset list $v = omega_A$, and use endpoint $1$ as reference throughout the next calculation. Call $B$ frequent for this list if its offset record $m$, its companion value $z$, and its output $phi.alt = Phi_(u_(B \, { 1 \, 2 })) \( v \)$ have joint point probability greater than $2^(- \( t_B + .5 \) N)$. For fixed $m \, z$, define the deterministic list
  #[#set math.equation(numbering: n => "(8.12)")
   $ cal(F)_v \( m \, z \) = {phi.alt : rho #scale(x: 120%, y: 120%)[\(] m_B = m \, Z_B = z \, Phi_(u_(B \, { 1 \, 2 })) \( v \) = phi.alt #scale(x: 120%, y: 120%)[\)] > 2^(- \( t_B + .5 \) N)} . $ <eq:frequent-list>]
  By (8.10), $\| cal(F)_v \( m \, z \) \| lt.eq 2^(.51 N)$.
  We claim that the frequent-pair mass is at most $delta$. Otherwise a set of $B$’s of mass at least $delta \/ 2$ has frequent $A$-mass at least $delta \/ 2$. Draw $L_0$ independent $A$-probes. At each stage the spans of all past offsets have total dimension at most $2 r L_0 < d_0$. The mass of a probe whose whole offset list lies in those spans is less than $delta \/ 4$. Thus each stage has conditional probability at least $delta \/ 4$ of being frequent and having a fresh offset vector. Select one fresh vector by a fixed rule using only the probe lists. Averaging fixes a probe collection with independent selected witnesses in each component and mode, and with successful $B$-mass at least
  #[#set math.equation(numbering: n => "(8.13)")
   $ q_(*) = \( delta \/ 2 \) \( delta \/ 4 \)^(L_0) > 0 . $ <eq:fresh-probe-mass>]
  This lower bound is independent of selector and channel sizes. Require
  #[#set math.equation(numbering: n => "(8.14)")
   $ L thin O \( L_0 \) thin 2^(L_0 - h) < q_(*) \/ 2 . $ <eq:early-h-probes>]
  The successful $B$’s can then be trimmed so that the channel transpose at endpoint $1$ has full rank on all these fixed witness vectors, while leaving mass at least $q_(*) \/ 2$.
  Now estimate this event under the raw law $mu^2$. Condition on all of endpoint $2$ and on the primal frames at endpoint $1$. Enumerate the offset record $m$, and enumerate a nominal primal tuple representing $Z_B$ at endpoint $1$. There are at most $2^(.002 N + O \( n \))$ such choices. For each choice the ambient value $z$, all the lists in (8.12), and their endpoint-$2$ translations are fixed. The event defined by the adaptive marks is contained in the union of these raw events. This uses no conditional density assertion about the marked law, and does not enumerate $2^(t_B N)$ arbitrary ambient companion values.
  Project each of the $L_0$ lists onto the coordinate of its chosen fresh witness. Their total product size is at most $2^(.51 L_0 N)$. Freeze the bounded lists of channel coefficient values on the witnesses. On their full-rank event, prescribing the corresponding endpoint-$1$ output tuple costs at least $.99 L_0 N$ bits, by the same annihilator count as in (8.11). The upper probability under $rho$, after paying its joint density, is therefore at most
  $ 2^(\( D + .01 \) N + .002 N + O \( n \) - .48 L_0 N + O \( 1 \)) . $
  Choose $M_0$ to make the $O \( n \) \/ N$ term small. Because $L_0 gt.eq 100 \( D + 10 \)$, this is exponentially small, contradicting the mass $q_(*) \/ 2$. The claim follows.
  Discard the frequent events in a full-sum phase test. For fixed records, this is a restriction on $B$ alone once the $A$-offset record is fixed. The $B$-tuple point bound is now $2^(- \( t_B + .5 \) N)$; the $A$-tuple bound is $2^(- \( t_A - .01 \) N)$. Walsh on $\( t_A + t_B \) N$ bits gives $2^(- .245 N)$, before the $2^(.004 N)$ record count. Thus every phase with $S = { 1 \, 2 }$ has magnitude at most $delta + 2^(- Omega \( N \))$. Interchanging the units covers the cases with $R = { 1 \, 2 }$. Together with the singleton estimates, all nontrivial means are less than $.005$.
  All the positive-mass restrictions made above have lower bounds in terms of $p_0 \, delta$ and early tolerances. The inequalities for $h$ were imposed after those quantities were fixed. The $h$-dependent bounded factors in the raw counts only affect how large $n$ must be. This completes both alternatives and the parameter-order assertion. ◻
]

The remaining phase conditions may hold on only inverse-polynomial pair mass. The next lemma makes injection failure small relative to that mass. It estimates the accepting pair event under independent draws, without conditioning the two units jointly on acceptance.

#thm([Lemma 8.4.])[
  (Injection on accepting pairs).  #emph[Let a prepared marked-unit law have final pins of total dimension at most $K$, and mixed marginals at most $M 2^(o \( N \)) mu$. Let $cal(A)$ be a pair event for independent draws, of probability at least $N^(- c_0)$ for some fixed $c_0$. For each fixed draw suppose its accepting opposite units form a member of a fixed family of cardinality at most $2^(C_s N)$. Assume $C_s$ is fixed before $h$. For every fixed $epsilon > 0$, by choosing $h$ sufficiently large in terms of $K \, C_s \, epsilon \, g$, the proportion of pairs in $cal(A)$ failing the small-table injection conditions is at most $epsilon$, for all sufficiently large $n$. For the unconditional pair event the accepting family has one member.]
] <lem:injection>

#proof[
  It suffices to prove the assertion for a fixed component, endpoint pair, and sign, with a sufficiently small failure tolerance $eta > 0$, and then sum over the at most $16 \| cal(E) \|$ tests. For example, let $V_A$ be the image of the individual pinned primal space $D_(A \, e)^(+) ∩ cal(B)_i$, and let $H_B subset.eq bb(F)_2^h$ be the protected coefficient subspace at the tested endpoint of $B$. Both dimensions are at most $K$. Injection fails exactly when some nonzero $v in V_A$ has $Y_B^(sans(T)) v in H_B$.
  Fix an accepting-set member $S$ of $A$-mass at least $2^(- .01 N)$, and put $ell = floor.l N \/ \( 10 \( K + 1 \) \) floor.r$. Under $A$ conditioned on $S$, a new individual primal frame span meets any previously fixed space of dimension at most $K ell$ with probability at most
  $ M 2^(o \( N \) + .01 N) 2^(dim cal(B) + K ell - N + 1) = 2^(- Omega \( N \)) . $
  This bound includes every possible nominal pin choice, since it tests the entire individual primal frame span. If a fixed $B$ has failure probability greater than $eta$ on $S$, successive draws $A_1 \, dots.h \, A_ell$ from $S$ can each witness failure while their entire spaces $V_(A_j)$ are mutually independent. At every step the conditional probability is at least $c = eta \/ 2$, for large $n$. The probability of the complete test is therefore at least $c^ell$.
  Conversely fix any such independent spaces. There are at most $2^(K ell)$ ways of choosing a nonzero witness in each. The chosen witnesses are independent. For iid $Y_B$ columns, their transpose images are independent uniform elements of $bb(F)_2^h$. If $H_B$ were fixed, their membership probability would be at most $2^(- \( h - K \) ell)$. There are at most $\( K + 1 \) 2^(K h)$ protected coefficient spaces of dimension at most $K$, a constant in $n$. Conditioning $Y_B$ to have full rank costs a bounded factor. Thus, even allowing adaptive $H_B$, the raw probability of failure throughout is at most
  $ C_(K \, h) 2^(- \( h - 2 K \) ell) . $
  The $B$-marginal density multiplies this by $M 2^(o \( N \))$. Fubini and the preceding lower test bound imply
  $ bb(P)_B { bb(P)_(A divides S) \( upright("failure") divides B \) > eta } lt.eq C_(K \, h) M 2^(- \( h - 2 K - log_2 \( 1 \/ c \) \) ell + o \( N \)) . $
  Choose, for example,
  $ h > 2 K + log_2 \( 1 \/ c \) + 10 \( K + 1 \) \( C_s + 2 \) . $
  Taking a union over the accepting-set family leaves an exponentially small exceptional $B$-mass. Accepting sets of mass less than $2^(- .01 N)$ contribute at most $2^(- .01 N)$ to the pair event. On the remaining nonexceptional $B$’s, failures have mass at most $eta$ times the accepting mass. Thus this one test fails on at most $eta bb(P) \( cal(A) \) + 2^(- Omega \( N \))$. Choose $eta < epsilon \/ \( 32 \| cal(E) \| \)$, sum all tests in both roles, and use $bb(P) \( cal(A) \) gt.eq N^(- c_0)$. The exponential errors are negligible relative to this probability, which proves the result. ◻
]

#thm([Lemma 8.5.])[
  (Consequences of a tiny cover).  #emph[Suppose the second alternative of 28 holds, and write 
$ F \( A \, B \) = u_(B \, { 1 \, 2 }) \( Delta_A \) . $

 Then the following assertions hold.]
  + #emph[The matrix $F$ on the finite support has rank at most $d_0 N$. Its alternating part $F + F^(sans(T))$ has rank at most $2 d_0 N$. If $bb(P) { F \( A \, B \) + F \( B \, A \) = 0 } arrow.r 0$, there is a restriction of mass $2^(- o \( N \))$ on which that alternating part is identically zero.]
  + #emph[If $F \( A \, A \) = 0$ throughout, then for either fixed $c in bb(F)_2$, 
#[#set math.equation(numbering: n => "(8.15)")
 $ bb(P) { u_(B \, 1) \( Delta_A \) = u_(B \, 2) \( Delta_A \) = u_(A \, 1) \( Delta_B \) = u_(A \, 2) \( Delta_B \) = c } gt.eq c_1 N^(- 4) $ <eq:tiny-four-phases>]

 for a positive fixed $c_1$ and all large $n$.]
  + #emph[In part (b), one can apply the second peeling so that the event in (8.15) is determined by the two leaves. At most $4 K_1 + 2 d_0 < u_0$ additional image directions are needed. The same $Omega \( N^(- 4) \)$ leaf-pair mass survives the exponentially small discards. On admissible small tables, the contractions on the old $lambda_i$’s then equal the actual contractions.]
] <lem:tiny-cover>

#proof[
  Write $\( T_(0 \, e)^(+) \, T_(0 \, e)^(-) \)_(e in cal(E))$ for the fixed cover. The cover sum space has dimension at most $sum_e \( dim T_(0 \, e)^(+) + dim T_(0 \, e)^(-) \) N lt.eq d_0 N$. Since $F$ pairs a vector $Delta_A$ in this space with a functional determined by $B$, the stated rank bounds follow.
  For part (a), let $epsilon_N$ be the zero probability of the alternating kernel $H = F + F^(sans(T))$, and retain those rows whose zero probability is at most $sqrt(epsilon_N)$. Their mass is at least $1 - sqrt(epsilon_N)$. Under the normalized retained law, each such row is zero with probability at most $sqrt(epsilon_N) \/ \( 1 - sqrt(epsilon_N) \)$. Choose a row basis for the restricted kernel, of length at most $2 d_0 N$. The entropy of its list of evaluations on a random retained unit is bounded using binary entropy
  $ H_2 \( t \) = - t log_2 t - \( 1 - t \) log_2 \( 1 - t \) \, #h(2em) 0 log_2 0 = 0 . $
  It is at most
  $ 2 d_0 N thin H_2 (frac(sqrt(epsilon_N), 1 - sqrt(epsilon_N))) = o \( N \) . $
  A most likely list therefore has mass $2^(- o \( N \))$. On its fiber, every row of the restricted kernel has the same value on every two columns, because the chosen rows span all rows. Taking one column to be the row index itself shows that this value is zero: $H \( A \, A \) = 0$. This proves (a).
  For part (b), set $R_N = 1 + d_0 N$. A pairwise incompatible subset of the support, meaning that no distinct pair has $F \( A \, B \) = F \( B \, A \) = 0$, gives
  $ \( 1 + F \) ⊙ \( 1 + F \)^(sans(T)) = I $
  on that subset. The entrywise-product rank is at most $"rank" \( 1 + F \)^2 lt.eq R_N^2$, by expanding both factors as sums of rank-one matrices. Thus the subset has at most $R_N^2$ members. Take $R_N^2 + 1$ independent samples from the weighted law. A repeated sample is compatible because $F \( A \, A \) = 0$; otherwise the samples cannot all be pairwise incompatible. A union bound gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ bb(P) { F \( A \, B \) = F \( B \, A \) = 0 } gt.eq binom(R_N^2 + 1, 2)^(- 1) . $ <eq:tiny-polynomial>]
  Apply Fourier inversion to the four bits in (8.15). The four characters with even support in each endpoint pair contribute exactly one quarter of the probability in (8.16). Each of the other twelve characters contains a singleton subset and has magnitude $2^(- Omega \( N \))$. The coefficients of the even characters are one for either common prescribed value $c$. Thus
  $ bb(P) \( upright("all four bits equal ") c \) = 1 / 4 bb(P) { F \( A \, B \) = F \( B \, A \) = 0 } + O \( 2^(- Omega \( N \)) \) \, $
  which proves (8.15).
  Finally record the choices of the old $lambda_i$’s in their effective bases and pin the primal support images needed to determine their tensors at both endpoints. A bound of $4 K_1$ directions suffices. On each fixed plus cover basis vector $p$, and at each endpoint, store the bounded coefficient list $Y^(sans(T)) p$ and pin the channel image $X \( Y^(sans(T)) p \)$. For a minus cover basis vector $q$, store $X^(sans(T)) q$ and pin $Y \( X^(sans(T)) q \)$. There are at most $2 d_0$ such image directions over the two endpoints. These data determine each $Delta$ and both $u$-functionals on the whole cover sum space, because
  $ u \( p q^(sans(T)) \) = #scale(x: 120%, y: 120%)[\(] X \( Y^(sans(T)) p \) #scale(x: 120%, y: 120%)[\)] dot.op q = p dot.op #scale(x: 120%, y: 120%)[\(] Y \( X^(sans(T)) q \) #scale(x: 120%, y: 120%)[\)] . $
  They therefore determine the four phase bits for any pair of leaves.
  The total new rank is at most $4 K_1 + 2 d_0 < u_0$. The scalar channel lists have bounded length in $n$; nominal support descriptions cost $O \( n \)$ bits. 15 permits this refinement and the subsequent second peeling, with total final rank at most $K$, losing only exponentially small total mass. Removing unit mass $epsilon_N$ changes independent pair mass by at most $2 epsilon_N$, which is negligible in (8.15). The old support directions are now pinned, so every admissible table evaluates their tensors by actual frozen entries. This proves (c). ◻
]

#prodef([Remark 8.6.])[
  For later applications of 30, the four-phase event in (8.15), or a condition on $F \( A \, B \) + F \( B \, A \)$, has an accepting family of log-size $C_s N$, with $C_s lt.eq 100 \( r + d_0 + 1 \)$. Indeed the opposite unit can be described, for this event, by its rank-at-most-$r$ tensor $Delta$ and its two functional restrictions to the cover sum space. The former has at most $2 r N + O \( 1 \)$ bits, and the latter at most $2 d_0 N$ bits. Enumerating all such descriptions supplies a fixed family containing every accepting set. The bound is independent of $h$, of nominal leaf bases, and of the selector dimensions.
] <rem:tiny-accepting-family>

== 9 Preparation of the two-endpoint statuses <sec:preparation>

The scalar recipes involve the endpoint functional $p_i = u_(i') U_i$, where $i'$ is the other endpoint of the unit. We distinguish laws on which the values $p_i \( x \)$ have a common description in terms of the effective-space evaluations, the role bit, and the global key. Such a description will be called a prediction. For a predicted law, we combine the phase estimates with two properties of predictions to obtain the compatible tables stated below. If no prediction exists, the first peeling already supplies the preparation we need. The scalar recipes are constructed in 13 for the positive-mass alternatives, and directly in 14 for the inverse-polynomial alternative.

We work along a sequence of admissible unit laws that would violate 6, and may pass to subsequences. Perform the first peeling and the deletion in 14. The effective spaces at this stage are denoted by $C_i^(upright("old"))$. For a tag $l$ and a diagonal bit $q$, let $Omega_(l \, q \, n)$ be the uniform law on the global plus and minus vector slots of the star of $l$, with paired diagonal $q$ in every component. Requiring its individual vectors to be nonzero changes it by exponentially small total variation.

=== 9.1 Common predictions and the preparation statement <common-predictions-and-the-preparation-statement>

#prodef([Definition 9.1.])[
  (Common prediction).  A prediction along a subsequence consists of common binary functions
  $ f_(i \, n) \( l \, q \, dot.op \) : Omega_(l \, q \, n) arrow.r bb(F)_2 \, #h(2em) i = 1 \, 2 \, $
  a set of units of mass at least $10^(- 6)$, and, on every unit in this set, choices
  $ lambda_i in C_i^(upright("old")) \, #h(2em) alpha_i in bb(F)_2 \, #h(2em) cal(E)_i subset.eq bb(F)_2^b \, quad \| cal(E)_i \| lt.eq B_(*) \, $
  such that the following uniform statement holds. There is $epsilon_n arrow.r 0$ for which, at both endpoints, at every label outside $cal(E)_i$, at every tag, and in every permitted flavor, a uniform parameter atom $x$ satisfies
  #[#set math.equation(numbering: n => "(9.1)")
   $ p_i \( x \) = T \( lambda_i \, x \) + alpha_i a \( x \) + f_(i \, n) \( l \, q \, "key" \( x \) \) $ <eq:prediction>]
  except with probability at most $epsilon_n$. The functions $f_(i \, n)$ are the same for all retained units. The marks $lambda_i \, alpha_i \, cal(E)_i$ may depend on the whole unit.
] <def:prediction>

The errors refer to uniform parameters in each flavor, before conditioning on a tester bit. Conditioning on a possible fixed tester value only multiplies the error by a fixed constant. There are finitely many labels, tags and flavors, with their numbers fixed independently of $n$.

If a prediction exists, retain its marked population and pigeonhole the values of the two $alpha_i$’s, of

$ c = a \( lambda_1 \) + a \( lambda_2 \) \, $

and of the indicator $Delta = 0$, where $Delta = U_1 lambda_1 + U_2 lambda_2$. This loses a factor at most $16$, leaving mass at least $6.25 dot.op 10^(- 8) > 10^(- 12)$. Pass to a subsequence on which every reference error probability of every binary combination of $f_1 \, f_2 \, q$ has a limit, for each tag and bit. Only finitely many comparisons are needed.

Identify two sequences of common functions when their disagreement probability tends to zero on every $Omega_(l \, q \, n)$, and then quotient by the span of the common diagonal-bit function $q$. Thus two predictors have the same class when their difference agrees asymptotically with $gamma q$, for a single $gamma in bb(F)_2$ common to all tag and bit spaces. Write $\[ f \]$ for this class and put

#[#set math.equation(numbering: n => "(9.2)")
 $ d_i = 1 + alpha_i \, #h(2em) e_i = \( d_i \, \[ f_i \] \) . $ <eq:status-class>]

The $e_i$ are #emph[prediction classes], with support ${ i : e_i eq.not 0 }$. They are common to all retained units, although the marked $lambda_i$’s can vary. A query’s #emph[numerical unary status], by contrast, records the scalar outcomes specified in 7.

For an admissible small table, contractions on an old $lambda_i$ are computed from the table. They remain defined after pins are enlarged, since the old effective spaces are retained inside the new ones. We require the following phase compatibility conditions:

#[#set math.equation(numbering: n => "(9.3)")
 $ u_(B \, S^compose) \( Delta_A \) + u_(A \, S^compose) \( Delta_B \) = \| S^compose \| d \, & upright("if ") S^compose = { i : e_i eq.not 0 } eq.not diameter \,\
upright("and all nonzero ") e_i upright(" coincide") \,\
d = upright("their first bit") \;\
u_(B \, j) \( Delta_A \) = c \, quad u_(A \, i) \( Delta_B \) = c quad \( i \, j = 1 \, 2 \) \, & upright("if ") e_1 = e_2 = 0 . $ <eq:phase-compatibility>]

There is no additional phase condition in the other cases. When testing a table, the $u$’s in this display mean its contractions, rather than contractions of actual orientations. These equations remove the possible dual obstructions to the scalar recipes, as proved in 66.

#thm([Proposition 9.2.])[
  (Status preparation).  #emph[Along a subsequence, the unit law can be prepared with final pin dimension at most $K$ and the final per-leaf bounds of 15, at relative mass cost $2^(- o \( N \))$, so that one of the following descriptions applies.]
  + #emph[There is no prediction as in 33 on the first-peeled law. The effective spaces are still the first ones. For independent units, the mass admitting an admissible injecting small table is greater than $.99$.]
  + #emph[A prediction with fixed $alpha_i \, c$ and common classes $e_i$ is retained. The old marks and exceptions are preserved, and (9.1) has uniform $o \( 1 \)$ error on every retained unit. The mass admitting an admissible injecting table satisfying (9.3) is bounded below by a positive constant.]
  + #emph[Both prediction classes are zero, and every retained unit satisfies the exact identities 
$ p_i = T \( lambda_i \, dot.op \) + a quad upright("on all of ") cal(X) \, #h(2em) i = 1 \, 2 . $

 There is a set of leaf pairs of mass at least $c_2 N^(- 4)$ under the final leaf mixture, for a fixed $c_2 > 0$, with phase compatibility determined by the two leaves. For each such pair one can choose a specific injecting compatible table whose two separate orientation admissibility filters have masses at least $a_0 > 0$. The constants $c_2 \, a_0$ are independent of $n$.]
  #emph[In every case the mixed joint density is at most $2^(\( D + o \( 1 \) \) N) mu^2$, and its individual marginals are at most $M 2^(o \( N \)) mu$. Relative to the stored leaf bases and pin images, all numerical table formats, unary statuses, old-mark coordinates and exception-set descriptions have bounded length in $n$. The extra exact pins are used only in case (iii).]
] <prop:status-preparation>

We first prove two facts about predictions. Vanishing prediction classes give exact identities on $cal(X)$, while $Delta = 0$ forces $alpha_1 = alpha_2$. The latter fact makes the required phase equation attainable when the tensor difference vanishes. After these proofs, the phase estimates of 8 give the preparation alternatives.

=== 9.2 Exact identities for vanishing prediction classes <exact-identities-for-vanishing-prediction-classes>

#thm([Lemma 9.3.])[
  (Exactification of vanishing prediction classes).  #emph[If $e_1 = e_2 = 0$, deleting $o \( 1 \)$ unit mass makes 
#[#set math.equation(numbering: n => "(9.4)")
 $ p_i = T \( lambda_i \, dot.op \) + a quad upright("on all of ") cal(X) \, #h(2em) i = 1 \, 2 \, $ <eq:exact-prediction>]

 an exact identity on every retained unit.]
] <lem:empty-status>

#proof[
  Vanishing prediction classes give $alpha_i = 1$ and $f_i tilde.eq gamma_i q$ for a fixed $gamma_i in bb(F)_2$. At any fixed tag, label and parameter point, the raw key law is the single-key reference up to an exponentially small injectivity error, by 13. The individual marginal density bound, which is a fixed constant at this stage, transfers the reference disagreement of $f_i$ and $gamma_i q$ to an average $o \( 1 \)$ parameter error on the marked population. There are only finitely many endpoint, tag and label choices. Markov’s inequality therefore allows deletion of $o \( 1 \)$ unit mass so that this error tends to zero uniformly on the remaining units and choices. Combining it with (9.1) gives, at every nonexceptional label,
  $ p_i \( x \) + T \( lambda_i \, x \) + a \( x \) + gamma_i q \( x \) = 0 $
  with parameter error tending to zero in the generic flavor.
  For fixed label and tag the left side is a Boolean polynomial of base degree at most two. A nonzero Boolean polynomial of degree at most $k$ has nonzero probability at least $2^(- k)$ under uniform bits. For completeness, this follows by induction: choose a coordinate with a nonzero derivative; the derivative has degree at most $k - 1$, and whenever it is nonzero at least one of the two values on that coordinate is nonzero. The constant nonzero polynomial is the initial case. Thus the displayed relation, once its error is below $1 \/ 4$, is exact for every allowed base value.
  For any fixed allowed base value its dependence on the selector has degree at most $2 j_(*)$. It vanishes at every selector outside a set of size at most $B_(*)$. The choice of $b$ gives $B_(*) < 2^(b - 2 j_(*))$, so the same polynomial bound forces it to vanish at the excluded labels also.
  Use one shared-only base point with $eta_S = 1$, the same at every tag. The sum of its $g$ star atoms is zero in the cut space. Summing the exact relation over these atoms gives $0 = gamma_i g = gamma_i$, because $g$ is odd and the first three terms are linear on $cal(X)$. Consequently $gamma_i = 0$. The point atoms span the cut space by its definition, proving (9.4). ◻
]

=== 9.3 The zero-difference case <the-zero-difference-case>

We next show that $Delta = 0$ forces $alpha_1 = alpha_2$. The proof compares the common predictors on affine parameter slices. The predictors need not be polynomial, so we first establish the comparison for arbitrary common functions of the displayed image columns. It does not apply to arbitrary orientation-dependent tests.

#thm([Lemma 9.4.])[
  (Affine-slice comparison).  #emph[Fix a selector, a flavor, and a fixed number $d$ of affine parameter variables. Write a random affine coefficient map as 
$ C \( t \, u \) = p_s ⊗ \( t \, z_0 t + L u \) \, #h(2em) \( t \, u \) in bb(F)_2 xor bb(F)_2^d . $

 Assume the flavor retains an $n$-bit $Z$-block absent from $E$. Suppose we condition the affine coefficients on $C^(sans(T)) E C = G$, where $G$ is fixed, this event has probability at least a fixed $beta > 0$, and it depends on no $Z$ coefficient. Let $cal(T)_n$ be any common test of absolute value at most one on the image column arrays $\( P_e C \, Q_e C \)_e$, using a fixed set of components. Its empirical average over the conditioned affine coefficients, at a raw orientation, has variance 
$ O \( 2^(- N \/ 2) + 2^(2 d + 1 - n) \) $

 around its mean under uniform injective image column arrays with internal Gram $G$. The constants may depend on the fixed column counts and $beta$, but the estimate is uniform over the tests $cal(T)_n$.]
] <lem:synthetic-slice>

#proof[
  The $Z$-coefficients remain independent uniform bits after the conditioning. The columns of $C$ are independent except with probability $O \( 2^(d - n) \)$. For two independent conditioned maps $C \, C'$, a relation
  $ C \( a \, u \) + C' \( a' \, u' \) = 0 $
  has $a = a'$, by its constant coordinate. Its $Z$-part is
  $ a \( z_0 + z'_0 \) + L_Z u + L'_Z u' = 0 . $
  The matrix $\[ z_0 + z'_0 \, L_Z \, L'_Z \]$ is a uniform $n times \( 2 d + 1 \)$ bit matrix. A union over its nonzero coefficient vectors bounds the failure of combined independence by $\( 2^(2 d + 1) - 1 \) 2^(- n)$. In particular, the two translation columns do not share a forced nominal constant direction.
  For fixed independent nominal columns, the restricted-image transitivity in 13 gives the uniform injective law with its specified Gram. One batch consequently has the claimed reference law, independently of the remaining nominal coefficients. For two batches, compared with two independent copies of this reference law, the actual images have finitely many additional mutual Gram entries prescribed. Joint injectivity contributes only $O \( 2^(- N + O \( d \)) \)$ to the comparison: under independent uniform vector slots, a dependence among a fixed number of columns has this probability, and the fixed Gram conditioning has bounded reciprocal probability.
  Expand the mutual Gram indicator in binary characters, collapsing any repeated identical entries. A nonzero character has a nonzero coefficient matrix on at least one interaction between the two batches. More explicitly the coefficient blocks pairing first-batch plus vectors with second-batch minus vectors and first-batch minus vectors with second-batch plus vectors give cross-batch bit rank $N \( "rank" A + "rank" B \) gt.eq N$. The internal Gram constraints, individual injectivity indicators, and the two arbitrary tests are separate bounded weights on the two batches; their normalization factors are fixed. 16 bounds every nontrivial character contribution by $O \( 2^(- N \/ 2) \)$. The same computation without the tests gives the normalization of the mutual Gram conditioning. There are only a fixed number of characters. Thus the conditional two-batch product expectation differs from the product of the one-batch expectations by $O \( 2^(- N \/ 2) \)$, uniformly over the nominal mutual Gram values.
  Averaging the coefficients, and including the probability of nominal dependence, proves the asserted second-moment estimate. The one-batch mean differs from the reference mean only by the already bounded nominal-dependence error. ◻
]

#thm([Lemma 9.5.])[
  (Equal coefficients when the tensor difference vanishes).  #emph[On a predicted branch with $Delta = 0$ throughout, $alpha_1 = alpha_2$.]
] <lem:zero-delta>

#proof[
  Suppose otherwise. By 14, the two canonical sparse representations $w^(\( i \)) = \( w_l^(\( i \)) \)_l$ of the marked $lambda_i$’s have the same value of $chi_(*)$. Each has at most $4 D \/ g$ nonzero tag entries. As $alpha_1 eq.not alpha_2$, on every unit exactly one endpoint has $chi_(*) \( w^(\( i \)) \) + alpha_i = 1$. Fix an endpoint $i$ on a positive fraction of the units. Pigeonhole the set
  $ T_0 = { t : eta_S \( w_t^(\( i \)) \) = 1 } \, #h(2em) \| T_0 \| lt.eq 4 D \/ g \, $
  and choose a single selector outside the stored exceptions on a positive fraction of this remaining population. The latter is possible by averaging over selectors, since $B_(*) < 2^(b - 1)$. All these restrictions have fixed positive mass in $n$; their endpoint marginal is at most $L mu$ for a fixed $L$. No restriction made solely for this contradiction will be used later to choose a channel-size threshold.
  At each tag $l$, use the pure flavor retaining exactly the allowed $O_(d \, t)$ blocks with $t in.not T_0$, setting all $S$ bits to zero and retaining the $\# \, Z$ blocks. For a pure tag atom, $a \( x \) = q \( x \)$ and every $b_t \( x \) = 0$. The coefficient of its tester $eta_(d \, t)$ in $T^0 \( lambda_i \, x \) + alpha_i a \( x \)$ is
  $ a \( lambda_i \) + b_t \( lambda_i \) + alpha_i = chi_(*) \( w^(\( i \)) \) + eta_S \( w_t^(\( i \)) \) + alpha_i = 1 $
  on the retained $t$’s. Hence (9.1) gives
  #[#set math.equation(numbering: n => "(9.5)")
   $ f_i \( l \, q \, "key" \( x \) \) + q = p_i \( x \) + T^1 \( lambda_i \, x \) $ <eq:pure-prediction>]
  with uniform $o \( 1 \)$ parameter error.
  The right side of (9.5) is a sum of at most
  #[#set math.equation(numbering: n => "(9.6)")
   $ s_1 = \( g - 1 \) \( h + 2 J K_1 \) $ <eq:synthetic-product-count>]
  products of affine functions of the base variables. Indeed $p_i$ contributes at most $h$ products in each of the $g - 1$ star components. Factoring the old $lambda_i$’s, whose total component rank is at most $K_1$, gives at most $2 J \( g - 1 \) K_1$ products for $T^1$. The selected pure tester retains at least
  #[#set math.equation(numbering: n => "(9.7)")
   $ frac(g - 1, 2) \( g - 4 D \/ g \) r_0 > 2 s_1 + 1 $ <eq:synthetic-tester-room>]
  disjoint ordered bit pairs. To check the last inequality, use $D = 4000 g$ and $h = 1000 r_0$. After division by $\( g - 1 \) r_0$, the left side is $\( g - 16000 \) \/ 2$ and the right side is at most $2000 + 4 J K_1 \/ r_0 + o \( 1 \)$. The fixed value $g = 10^9 + 1$ and the later choice of sufficiently large $r_0$ make the inequality hold.
  We will compare $g$ matrices of cross coefficients, each of rank at most $2 s_1$, whose sum is an identity matrix of size $2 g s_1 + 1$. To construct them, place the common predictor on one array of synthetic keys. Shared-only parity will determine the sum, while its restrictions to small pure-flavor slices will give the individual rank bounds.
  Put $m_1 = 2 g s_1 + 1$, and introduce synthetic variables $xi \, upsilon in bb(F)_2^(m_1)$ and
  $ q_(*) = sum_(j = 1)^(m_1) xi_j upsilon_j . $
  For every component independently, choose uniform injective maps of the affine coefficient columns $\( 1 \, xi \, upsilon \)$ into the plus and minus ambient spaces with full paired Gram
  $ chevron.l upright("plus") \( 1 \, xi \, upsilon \) \, upright("minus") \( 1 \, xi' \, upsilon' \) chevron.r = sum_j xi_j upsilon'_j . $
  Such maps exist for large $n$, since the number of columns is fixed. Their point evaluations form one synthetic array of global component keys; all tag stars use the corresponding entries of this same array.
  We next prove two properties of this array with probability tending to one.
  #emph[Shared-only parity.] In a local shared-only test use the fixed selector and the same point at every tag. The sum of the tag atoms is zero in $cal(X)$. Summing (9.1) therefore gives
  $ sum_l f_i \( l \, q \, "key"_l \) = 0 $
  except on $o \( 1 \)$ parameter mass, uniformly on the retained units. Both tester bits have probability at least $1 \/ 4$: the bias of the sum of $r_0$ independent bit-pair products is $2^(- r_0)$.
  Apply 36 with no affine variables ($d = 0$), the shared-only flavor, and internal Gram $\( q \)$. The Gram event depends only on the fixed tester coordinates and has probability at least $1 \/ 4$. The common test is the displayed parity predicate of the global keys in all components. Its empirical frequency under $mu$ concentrates at its global reference probability. The endpoint marginal bound $L mu$, and its frequency $1 - o \( 1 \)$ on the retained population, force that reference probability to tend to one. At every point of the synthetic array the point-key marginal is this reference, up to the exponentially small nonzero-vector conditioning. There are a fixed finite number of points. Thus, with probability tending to one,
  #[#set math.equation(numbering: n => "(9.8)")
   $ sum_l f_i \( l \, q_(*) \, "key"_l \) = 0 quad upright("at every synthetic point") . $ <eq:synthetic-parity>]
  #emph[Affine-product representations on every small slice.] Fix sets $I \, J subset.eq { 1 \, dots.h \, m_1 }$, each of size at most $2 s_1 + 1$, and set all $xi$ and $upsilon$ coordinates outside $I \, J$, respectively, to zero. There are $d = \| I \| + \| J \| lt.eq 4 s_1 + 2$ remaining variables. At a given tag, map this slice into its selected local pure flavor by independent uniform affine functions for every retained base bit, including independent translations. Condition their full oriented Gram to equal the synthetic slice Gram.
  This conditioning has a fixed positive probability. At the fixed selector $E^(\#)$ vanishes on pairs. There are at most $2 s_1 + 1$ active terms $xi_j upsilon'_j$ in the target Gram, so (9.7) lets us route them into distinct retained ordered tester pairs, and set all other tester affine coefficients to zero. If $t_0$ scalar tester coordinates are prescribed, this assignment alone has probability $2^(- t_0 \( d + 1 \)) > 0$, independent of $n$. The $Z$-affine coefficients remain iid. At every fixed slice point the unconditioned base input is uniform; after conditioning, its density is bounded by the fixed reciprocal Gram probability.
  Consequently (9.5) holds simultaneously at all points of the slice except on $o \( 1 \)$ of these parametrizations, uniformly on the marked population. Its right side pulls back to a sum of at most $s_1$ affine products. Consider only the event
  #quote(block: true)[
    the array of values of the common function $f_i + q_(*)$ on this specified slice admits such an affine-product representation.
  ]
  This is a common test of the image column arrays. It contains neither the mark $lambda_i$ nor any coefficients of the unit-specific representation. Its empirical success probability is $1 - o \( 1 \)$ on the retained population. 36 and the marginal bound $L mu$ therefore force its probability under the synthetic slice law to tend to one. That law is also the marginal of the corresponding slice in the full synthetic array, by restricted frame transitivity.
  There are only finitely many choices of tag and slice, with the number fixed independently of $n$. We may therefore require all these events and (9.8) simultaneously. Notice that we embedded only the small slices locally; no local realization of the entire synthetic tester was required.
  Choose one synthetic array on which all these properties hold, and define
  $ F_l \( xi \, upsilon \) = f_i \( l \, q_(*) \, "key"_l \) + q_(*) . $
  For each tag define its Boolean cross-coefficient matrix by
  $ C_l \[ j \, k \] = F_l \( e_j \, e_k \) + F_l \( e_j \, 0 \) + F_l \( 0 \, e_k \) + F_l \( 0 \, 0 \) . $
  On a coordinate slice where $F_l$ is a sum of $s_1$ affine products, this is the matrix of $xi_j upsilon_k$ coefficients. One affine product contributes a sum of two rank-one matrices to this cross matrix. Every $\( 2 s_1 + 1 \)$-square minor of $C_l$ is therefore singular, so $"rank" C_l lt.eq 2 s_1$. On the other hand (9.8), together with odd $g$, gives $sum_l F_l = q_(*)$ and hence
  $ sum_l C_l = I_(m_1) . $
  Rank subadditivity would imply $m_1 lt.eq sum_l "rank" C_l lt.eq 2 g s_1$, contradicting $m_1 = 2 g s_1 + 1$. This proves $alpha_1 = alpha_2$. ◻
]

=== 9.4 Proof of the preparation statement <proof-of-the-preparation-statement>

#proof[
  If no prediction exists along any subsequence, retain the first-peeling law. Apply 30 to the unconditional pair event, using the first pins and the final budget $K$ as an upper bound. The failure tolerance here and in the remaining cases is a fixed numerical constant chosen before $h$. With a sufficiently small failure tolerance it gives injection probability greater than $.99$. The actual small table is admissible, so this proves (i). Negligible later deletions cannot create a prediction on a mass bounded above $10^(- 6)$ by a fixed positive amount: transfer its uniformly valid marks and functions to the original law and multiply its mass by the retained proportion. This is the form of the no-prediction conclusion used subsequently.
  Otherwise make the prediction and the finite initial pigeonholing described after 33. If both prediction classes vanish, perform the $o \( 1 \)$ deletion in 35 now. Thus all later refinements start with the exact identity in that case. For the moment test attainability of (9.3) on the actual table.
  ===== 9.4.1 Vanishing tensor difference. <vanishing-tensor-difference.>
  Suppose first that $Delta = 0$. If there is exactly one active class and its first bit were $d = 1$, its endpoint would have $alpha_i = 0$, whereas the inactive endpoint would have $alpha_(i') = 1$. This contradicts 37. With two equal active classes the right side of (9.3) is $2 d = 0$. Thus all nonempty-support conditions are automatic. If both classes vanish and $c = 1$, the equality $U_1 lambda_1 = U_2 lambda_2$, together with (9.4), gives the two affine-gradient equations and the required unequal $a$-values for an internal hole. This is impossible for a unit. Consequently $c = 0$, and the empty-support phase conditions are automatic too. Unconditional injection gives (ii).
  ===== 9.4.2 Mixing of the four phase bits. <mixing-of-the-four-phase-bits.>
  Now suppose $Delta eq.not 0$, and apply 28. If its mixing alternative holds, any specified pattern of the four cross-phase bits has probability at least
  $ frac(1 - 15 \( .005 \), 16) > .05 $
  by binary Fourier inversion. Choose a pattern satisfying (9.3), if any condition is required. Unconditional injection fails on an arbitrarily small fixed pair mass by 30. Taking that mass below $.01$ leaves a positive mass of actual tables with all required properties, proving (ii).
  ===== 9.4.3 A tiny cover with nonempty support. <a-tiny-cover-with-nonempty-support.>
  It remains to treat the tiny-cover alternative. If there is no extra phase condition, injection alone suffices. If there is one active class, the only condition is one singleton phase equality, which has probability $1 \/ 2 + 2^(- Omega \( N \))$. Again unconditional injection leaves positive mass. If both classes are nonzero and equal, the required bit is
  $ F \( A \, B \) + F \( B \, A \) = 0 \, #h(2em) F \( A \, B \) = u_(B \, { 1 \, 2 }) \( Delta_A \) . $
  Pass to a subsequence on which its probability has a limit. If that limit is positive, use the accepting family in 32 and the relative form of 30; a positive mass remains. If the limit is zero, part (a) of 31 retains a fiber of mass $2^(- o \( N \))$ on which the condition is automatic. Its individual marginals have at most the allowed $2^(o \( N \))$ inflation. Unconditional injection on that fiber gives a positive mass of suitable tables in the normalized law. All these cases give (ii).
  ===== 9.4.4 A tiny cover with vanishing classes. <a-tiny-cover-with-vanishing-classes.>
  Finally suppose both prediction classes vanish. For any unit,
  $ F \( A \, A \) = u_1 \( U_2 lambda_2 \) + u_2 \( U_1 lambda_1 \) = p_2 \( lambda_2 \) + p_1 \( lambda_1 \) = 0 . $
  The same-endpoint contractions vanish by $u_i U_i = 0$, and (9.4) gives
  $ p_i \( lambda_i \) = T \( lambda_i \, lambda_i \) + a \( lambda_i \) = a \( lambda_i \) + a \( lambda_i \) = 0 . $
  Parts (b) and (c) of 31 now give four-phase compatibility on $Omega \( N^(- 4) \)$ leaf-pair mass, determined by those leaves after at most $u_0$ additional pins and the second peeling. The exponential deletions leave the same polynomial order of mass. Apply 30 to this compatibility event, using the family in 32. Its relative failure can be made less than $.001$.
  For clarity, disintegrate this last assertion over the independent leaf pair. A positive fixed fraction of the compatible leaf-pair mass has conditional injection probability at least $1 \/ 2$; indeed a conditional failure larger than $1 \/ 2$ can account for at most twice the total failure mass. There are at most a fixed number $Q$ of numerical small tables in any leaf-pair format, since all table-coordinate dimensions are bounded by constants in $n$. For each of these good pairs, some actual injecting table value occurs on conditional pair mass at least $1 \/ \( 2 Q \)$. This table is compatible: the old tensor supports are pinned, so all its contractions on the old marks agree with the fixed actual values.
  For that table, admissibility is the intersection of one filter on the first orientation and one on the second, because pin images are fixed in the leaves. Their conditional product mass is at least $1 \/ \( 2 Q \)$, since it includes the event where the actual table equals the chosen one. Each separate filter therefore has mass at least $a_0 = 1 \/ \( 2 Q \)$. Choosing such a table for each good leaf pair proves (iii), without pigeonholing over the number of leaves or ambient image values.
  In the positive-mass cases the existence statement also has the required finite-data form. Table entries and pin/projection relations are bounded numerical data. The old marks can be recorded by their coordinates in the old effective bases, and exception labels have bounded descriptions. For a fixed leaf pair the admissibility checks are separate unary orientation flags. The phase contractions are computed from the table and these bounded mark coordinates. Thus the actual-table success is detected among a finite list of table/metadata alternatives; no pairwise conditioning of the two unit draws is needed.
  ===== 9.4.5 Retained masses and leaf bounds. <retained-masses-and-leaf-bounds.>
  We finish by recording the density and peeling effects. All global restrictions above have mass at least $2^(- o \( N \))$; all except the alternating fiber have fixed positive mass, apart from deletions tending to zero. Therefore the mixed law has the density caps in the statement. If a retained portion of a first leaf has relative mass less than $2^(- zeta N)$, discard that portion. Summed over the old leaf weights, these losses have exponentially small mass, also after division by the global retained mass $2^(- o \( N \))$. On the other leaves the joint exact-image bound weakens from $1 - zeta$ to at most $1 - 2 zeta$, as in 15. Use its second-peeling conclusion only in case (iii), where the new image rank is within $u_0$. This leaves total rank at most $K$ and all stated conditional leaf bounds. The uniform unitwise errors of (9.1) survive every restriction; when both classes vanish, the identity is already exact. This proves all assertions. ◻
]

#prodef([Remark 9.6.])[
  (No feedback from later accuracies).  The injection tolerances used in this section are fixed numerical constants: they are chosen before $h$, together with the early phase thresholds. Injection is established before splitting success among numerical tables. Thus the potentially much smaller flag lower bound $a_0 = 1 \/ \( 2 Q \)$, which may depend on $h$, never becomes an input to the choice of $h$. The errors in the affine-slice comparison and in subsequent fixed-test limiting arguments are handled by increasing $n$. Their accuracies, slice counts, partition sizes, and flag-mass thresholds do not require any alteration of the already fixed channel size or of the early pin budgets.
] <rem:preparation-accuracies>

== 10 Leaf histograms and mixed-law estimates <sec:histograms>

The collision criterion in 26 asks for overlap between the unnormalized distributions of accepted query keys. We prepare two different controls on these distributions. On each normalized leaf, the exponential joint density bound gives uniform integrability and finite $L^1$-nets, even after orientation and flag filters. On the mixed law, the additional subexponential marginal bounds give typicality for prescribed common tests and positive fractions for basis statuses on common key cells. 11 will connect these controls to the successful queries used in the overlap argument.

All construction parameters, including $M_0$, are fixed throughout this section, and $N = M_0 n$. Constants in estimates may depend on those parameters. A bounded number always means a number bounded independently of $n$. In particular, the numbers of tags, labels, coordinates in a small table, and positions in a query are bounded in this sense.

=== 10.1 Query measures and the distinction between tests and flags <query-measures-and-the-distinction-between-tests-and-flags>

A position specifies an endpoint of a unit, a tag $l$, a label $s$, and one of the flavors from 5. Its parameter is a uniform allowed base input. We may condition this input on a possible value of $q$, or on a feasible tester summary. The probability of any such fixed conditioning is bounded below by a positive constant. The $Z$ block remains uniform and independent of the other input coordinates. The parameters of different positions are independent, even when some positions have the same label. At a fixed orientation $O$, the key at position $j$ is denoted by $K_j \( O \, z_j \)$. A query consists of a fixed bounded list of positions and their fresh parameters.

For a position of tag $l$ and diagonal value $q$, let $Omega_(l \, q \, n)$ be the uniform law on its global vector slots, subject to the prescribed plus–minus diagonal $q$ at each component of its star. For a query, write

$ overline(Omega)_n = ⨂_j Omega_(l_j \, q_j \, n) . $

Let $omega_n$ instead be uniform on all its vector slots without any Gram conditions. Finally, $nu_n$ is uniform on $cal(K)_n$, the set obtained by imposing all the individual diagonals and all the off-position Gram zeros required in 7. Each of these bounded lists of Gram conditions has probability bounded below under $omega_n$.

We will use three different kinds of assertions.

+ A #emph[common key test] is a prescribed function of global keys. It may depend on $n$ and on the law under consideration, but it is not chosen using the particular orientation being queried.
+ A #emph[common input-and-key test] may also use the nominal parameters. The concentration result below applies to these more general tests. The positivity result for basis statuses applies only to common key tests.
+ A histogram #emph[flag] is any one of a fixed bounded list of bits depending on an orientation and its query parameters. The histogram compactness result permits arbitrary filters of the orientation and these flags. Later successful queries use a narrower class: products of unary status requirements, the specified Gram and $L \, R$ constraints, and an additional orientation-only filter. The product comparison in 11 is stated for that narrower class.

All filtered measures in this section are subprobability measures. We do not divide them by the probabilities of their filters.

=== 10.2 Compactness of the leaf histograms <compactness-of-the-leaf-histograms>

On a normalized leaf, average a query over both its orientation and its fresh parameters. We call the resulting key distribution, or a filtered subdistribution, a #emph[histogram]. The following lemma bounds all histograms obtained from a fixed number of flags, while allowing every orientation filter. Its proof follows the Gram and many-query estimates below.

#thm([Lemma 10.1.])[
  (Uniform histogram control).  #emph[Fix a query shape, a constant $C_L$, and an integer $F$. Consider any collection of normalized leaf laws $pi$ satisfying 
#[#set math.equation(numbering: n => "(10.1)")
 $ pi lt.eq 2^(C_L N) mu^2 . $ <eq:histogram-leaf-cap>]

 The following assertions are uniform over those leaves and over the bounded numerical choices of a query.]
  + #emph[If $A_n$ is a sequence of slot sets with $omega_n \( A_n \) arrow.r 0$, then the probability that the unfiltered query key belongs to $A_n$, averaged on any choice of leaves, tends to zero. Equivalently, the averaged key laws are uniformly absolutely continuous in this asymptotic small-set sense.]
  + #emph[On each leaf, choose any $F$ binary flags of the orientation and query parameters. Let $cal(H)_(pi \, n)$ be the family of unnormalized key densities obtained by filtering by any event of the orientation and the flag values. For every $epsilon > 0$, this family has an $L^1 \( omega_n \)$ $epsilon$-net of cardinality bounded independently of $n$ and of the leaf, for all sufficiently large $n$. The net itself may depend on the leaf.]
  + #emph[Both conclusions persist after restricting the query to $cal(K)_n$ and expressing the subdensities relative to $nu_n$. In particular these subdensities are uniformly integrable: for every $eta > 0$ there is $R < oo$ such that, for all sufficiently large $n$, all their tails above $R$ have integral at most $eta$.]
  #emph[The flag functions may vary with the leaf and with $n$. The number of flags is fixed. No bound on the normalized marginal of an individual leaf is assumed here.]
] <lem:histogram-control>

=== 10.3 Finite Gram comparisons <finite-gram-comparisons>

We use the following comparisons both to prove histogram compactness and to compare empirical query integrals with the global reference laws.

#thm([Lemma 10.2.])[
  (Gram normalization).  #emph[Let $a$ plus slots and $b$ minus slots in one ambient component be independent uniform vectors, and prescribe their entire $a$ by $b$ Gram matrix. If $a + b lt.eq N \/ 2$, the probability of that prescription together with injectivity in each mode is 
$ 2^(- a b) #scale(x: 120%, y: 120%)[\(] 1 + O \( 2^(- N + a + b) \) #scale(x: 120%, y: 120%)[\)] \, $

 uniformly in the prescribed matrix. The same statement holds for a fixed collection of independent endpoint/component groups, with the sum of their Gram-bit counts in place of $a b$ and a fixed factor in the error bound. In particular, for a bounded number of slots all relevant Gram normalizations and their ratios are bounded above and below by positive constants, uniformly in the nominal inputs.]
] <lem:histogram-gram-normalization>

#proof[
  The bounds in 12 put the probability, divided by $2^(- a b)$, between $\( 1 - 2^(a - N) \) \( 1 - 2^(a + b - N) \)$ and $1$. This gives the stated relative error uniformly even when $a \, b$ grow subject to $a + b lt.eq N \/ 2$. Multiplication over the independent groups gives the remaining assertions. ◻
]

When the number of slots is bounded, dropping an injectivity condition in a normalized Gram law changes a bounded integral by $O \( 2^(- N + O \( 1 \)) \)$. For the growing batches used below we will instead retain injectivity in the denominator and drop it only from a nonnegative numerator; this avoids paying an inappropriate additive error before a density bound.

#thm([Lemma 10.3.])[
  (Comparison of two bounded batches).  #emph[Consider two bounded batches of prescribed nominal columns in one raw endpoint, or in two independent raw endpoints. Suppose their union is nominally independent in every endpoint, component, and mode. Let $F$ and $G$ be bounded functions of the separate image batches, respectively. The difference between their joint raw expectation and the product of their separate raw expectations is 
$ O #scale(x: 120%, y: 120%)[\(] lr(bar.v.double F bar.v.double)_oo lr(bar.v.double G bar.v.double)_oo 2^(- N \/ 2) #scale(x: 120%, y: 120%)[\)] . $

 The bound is uniform in the independent nominal columns and all their prescribed same-endpoint Gram entries. The functions may also depend on the fixed nominal inputs determining their own batch.]
] <lem:histogram-batch-comparison>

#proof[
  By 13, the image laws are uniform laws on the indicated independent vectors with their same-endpoint Gram entries prescribed. Relative to the product of the two separate batch laws, the union law adds only the mutual Gram entries and joint injectivity. The latter may be omitted at an exponentially small error because the number of columns is bounded.
  Expand the indicators of the mutual Gram entries into binary characters. Their values, which are determined by the nominal inputs, enter this expansion only as signs. In a nontrivial character, after identical descriptions of an unordered slot pair have been collapsed, the coefficient matrix between the two batches is nonzero. Its bit rank is at least $N$. The individual batch Gram densities can be included in the two separate bounded weights. 16 bounds this character by a constant times $lr(bar.v.double F bar.v.double)_oo lr(bar.v.double G bar.v.double)_oo 2^(- N \/ 2)$. There are only boundedly many characters. Applying the same expansion with $F = G = 1$ controls the normalization, while 40 bounds all internal normalization factors. The zero character gives the product of separate expectations. ◻
]

#thm([Lemma 10.4.])[
  (Product tests under the key reference).  #emph[For a fixed query shape and arbitrary global single-key functions $f_(j \, n)$ with $\| f_(j \, n) \| lt.eq 1$, 
$ integral product_j f_(j \, n) \( k_j \) thin d nu_n = product_j integral f_(j \, n) thin d Omega_(l_j \, q_j \, n) + O \( 2^(- N \/ 2) \) . $

 The bound is uniform over the functions.]
] <lem:reference-product>

#proof[
  Start with $overline(Omega)_n$ and expand the off-position Gram conditions. For any nonzero character, choose an interacting pair of positions and fix all other positions. The remaining phase has rank at least $N$ between the two selected position groups. The prescribed single-position diagonal densities and the unary functions are separately bounded weights. 16 gives the error above. The identical expansion with all functions one gives the normalization of the off-position Gram event. Its zero-character contribution is a fixed positive constant, and all other contributions are exponentially small. Dividing proves the assertion. ◻
]

=== 10.4 A many-query Fourier bound <a-many-query-fourier-bound>

To use the exponential cap (10.1), we repeat a query a number of times proportional to $n$. At a fixed orientation, the empirical cell frequencies approach its conditional cell law. The next bound will make excess coarse entropy sufficiently unlikely under the raw law to outweigh the leaf’s density cap. The leaf remains normalized to have mass one; its individual marginals need not satisfy a small cap.

#thm([Lemma 10.5.])[
  (Many queries and prescribed cells).  #emph[Fix a bounded query shape. There are constants $c_1 \, c_2 > 0$, independent of any key-space partition, with the following property. Put $ell = floor.l c_1 n floor.r$ and repeat the query independently $ell$ times at a common orientation. Let $A_1 \, dots.h \, A_ell$ be cells of a partition of the full slot space, with weights $w_j = omega_n \( A_j \)$. Suppose the partition has bounded size and its nonempty weights have a positive lower bound along the sequence under consideration. Conditional on any nominal inputs whose queried columns are jointly independent in every endpoint, component, and mode, the raw image probability that query $j$ lies in $A_j$ is at most 
#[#set math.equation(numbering: n => "(10.2)")
 $ 2^(c_2 ell) product_(j = 1)^ell w_j $ <eq:histogram-many-query-bound>]

 for all sufficiently large $n$. How large $n$ must be may depend on the partition and its weight bound. The constants $c_1 \, c_2$ do not.]
  #emph[The probability, over the repeated fresh parameters, that the required nominal independence fails tends to zero exponentially in $n$, uniformly over the common orientation.]
] <lem:histogram-many-queries>

#proof[
  Let $k$ bound the number of vector slots in one draw, enlarging it by a fixed factor when convenient. At any endpoint and component, a new point column contains the component $p_s ⊗ Z$ with a fresh uniform $n$-bit vector $Z$. Its probability of lying in a previously exposed space of dimension $v$ is at most $2^(- n + v)$: the projection of that space onto its $p_s ⊗ Z$ direction space has dimension at most $v$. This remains valid with repeated labels, and also after the input is conditioned on $q$ or a tester summary. A union bound, with $k ell$ a small fraction of $n$, proves the independence assertion.
  Fix independent nominal inputs. The raw image law is an iid global slot law conditioned on all required same-endpoint Gram entries and on injectivity. Divide the Gram entries into those within a draw and those between draws, after collapsing duplicate descriptions of the same unordered slot pairing. Write their numbers as $b_(upright("in"))$ and $b_(upright("cross"))$, respectively. We have $b_(upright("in")) = O \( ell \)$. The normalization in the denominator is at least a fixed constant times $2^(- b_(upright("in")) - b_(upright("cross")))$ by 40. In the nonnegative numerator, drop injectivity and the within-draw conditions, and expand only the cross-draw conditions. It remains to bound
  $ 2^(O \( ell \)) sum_chi \| bb(E)_(omega_n^(⊗ ell)) chi product_(j = 1)^ell upright(bold(1))_(A_j) \| \, $
  where the zero character has contribution $product_j w_j$.
  Represent a nonzero character by a symmetric binary matrix on the distinguished slot indices, grouped into $ell$ draw blocks of size at most $k$. Its diagonal draw blocks are zero. A coefficient records one unordered interacting slot pair; in particular there is no nontrivial character represented by the zero matrix. Let $t gt.eq 1$ be the maximum rank of a coefficient rectangle whose row draw-block set and column draw-block set are disjoint.
  We claim that the number of such patterns with this value of $t$ is at most $2^(C k^2 ell t)$ for an absolute constant $C$. Choose a nonsingular $t$ by $t$ minor witnessing the rank, with row-block set $I$ and column-block set $J$. Each of $I \, J$ has at most $t$ blocks. Specify all entries incident with those blocks. If $u \, v$ lie in two distinct unselected blocks, border the chosen minor by row $u$ and column $v$. The enlarged row and column block sets are still disjoint. Its rank cannot exceed $t$, so its bottom-right entry is uniquely determined by the other entries and the invertible minor. Entries in a single unselected diagonal block are already zero. Thus the specified entries determine the whole pattern. Their number is $O \( k^2 ell t \)$; the choices of the minor add at most $2 t log_2 \( k ell \)$ bits, which is absorbed in the asserted bound.
  For one pattern, fix slots outside the draw blocks $I union J$. Across $I$ and $J$ the phase has bit rank at least $t N$. Phases internal to each group or involving the fixed slots are separate weights, and the cell indicators within the two groups are bounded by one. The Walsh estimate gives $2^(- t N \/ 2)$. Integrating the other cell indicators gives
  #[#set math.equation(numbering: n => "(10.3)")
   $ \| bb(E) chi product_j upright(bold(1))_(A_j) \| lt.eq 2^(- t N \/ 2) product_(j in.not I union J) w_j lt.eq 2^(- t N \/ 2) w_min^(- 2 t) product_j w_j \, $ <eq:histogram-character-bound>]
  where $w_min = min_j w_j$. This argument treats components and modes as distinguished slots; their only effect is to constrain which coefficient entries may be nonzero.
  The sum of nonzero characters, divided by $product_j w_j$, is therefore at most
  $ sum_(t gt.eq 1) 2^(C k^2 ell t - t N \/ 2 + 2 t log_2 \( 1 \/ w_min \)) . $
  Choose $c_1$ small enough both for nominal independence and for $C k^2 c_1 < M_0 \/ 8$. For any fixed positive weight bound, the displayed sum is at most $sum_(t gt.eq 1) 2^(- t N \/ 4)$ for all sufficiently large $n$. It can consequently be absorbed in the within-draw factor $2^(O \( ell \))$. This proves (10.2) with a constant independent of the partition and its positive weight bound. ◻
]

=== 10.5 Entropy control and finite nets <entropy-control-and-finite-nets>

For a finite partition $cal(P)$ and reference weights $w_C$, use relative entropy in bits,

$ D_2 \( p bar.v.double w \) = sum_(C in cal(P)) p_C log_2 p_C / w_C \, #h(2em) 0 log_2 0 = 0 . $

Only nonempty reference cells are used.

For the finite entropy chain rule and Pinsker inequality in these units, see #cite(label("cover2006"), form: "prose") Theorem 2.5.3 and Lemma 11.6.1. We include the short derivation of the inequality and its constants in bits. For probability vectors $p \, q$, put $A = { j : p_j > q_j }$. Convexity of $t log t$ (the log-sum inequality) collapses their relative entropy to that of the two probabilities $p \( A \) \, q \( A \)$. Binary relative entropy in natural units has second derivative $1 \/ \[ u \( 1 - u \) \] gt.eq 4$ in its first argument and has value and first derivative zero at $u = q \( A \)$. Since $p \( A \) - q \( A \) = lr(bar.v.double p - q bar.v.double)_1 \/ 2$, Taylor’s integral formula gives

#[#set math.equation(numbering: n => "(10.4)")
 $ D_2 \( p bar.v.double q \) gt.eq frac(lr(bar.v.double p - q bar.v.double)_1^2, 2 ln 2) gt.eq 1 / 2 lr(bar.v.double p - q bar.v.double)_1^2 . $ <eq:histogram-pinsker>]

Zero probabilities follow by continuity, with infinite relative entropy when appropriate.

#proof[
  We first obtain a uniform bound for coarse conditional information. Fix a partition with a bounded number $r$ of cells and with every nonempty reference weight bounded below by a positive constant. At an orientation $O$, let $H_O \( C \)$ be its input probability of cell $C$. Repeated queries are independent with this cell law. Uniformly over probability vectors on the fixed $r$-simplex, the empirical histogram of $ell = floor.l c_1 n floor.r$ samples converges to $H_O$. Relative entropy against the fixed positive reference weights is uniformly continuous on that simplex: each cell frequency has variance at most $1 \/ \( 4 ell \)$, and $u log u$ is continuous at zero. Consequently, on orientations with $D_2 \( H_O bar.v.double w \) > L + 1$, the empirical histogram has entropy greater than $L$ with probability $1 - o \( 1 \)$, uniformly over those orientations. The nominal independence event of 43 can be imposed simultaneously at a further $o \( 1 \)$ loss, also uniformly over orientations.
  There are at most $\( ell + 1 \)^r$ empirical types. The standard method-of-types estimate #cite(label("cover2006")) Theorems 11.1.1 and 11.1.4 gives, for a type $v$,
  $ frac(ell !, product_C \( ell v_C \) !) product_C w_C^(ell v_C) lt.eq 2^(- ell D_2 \( v bar.v.double w \)) . $
  Indeed the probability of that same type under cell probabilities $v$ is at most one, which bounds its multinomial coefficient by $product_C v_C^(- ell v_C)$. Apply (10.2) for each cell sequence of a type, and then pay (10.1). We obtain
  #[#set math.equation(numbering: n => "(10.5)")
   $ & \( 1 - o \( 1 \) \) pi { D_2 \( H_O bar.v.double w \) > L + 1 }\
 & #h(1cm)  lt.eq 2^(C_L M_0 n + \( c_2 - L \) ell + r log_2 \( ell + 1 \)) . $ <eq:histogram-entropy-tail>]
  Choose $L > c_2 + C_L M_0 \/ c_1 + 2$. This bound is exponentially small. The density cap has been applied only on the event of nominal independence. Its failure was removed in the uniform per-orientation lower bound, not multiplied by $2^(C_L N)$ as an additive raw exceptional probability.
  Since $D_2 \( H_O bar.v.double w \) lt.eq log_2 \( 1 \/ w_min \)$, it follows that
  #[#set math.equation(numbering: n => "(10.6)")
   $ limsup_(n arrow.r oo) bb(E)_(O tilde.op pi) D_2 \( H_O bar.v.double w \) lt.eq C_H $ <eq:histogram-coarse-entropy>]
  for a constant $C_H$ independent of the fixed partition size and its positive weight bound. The onset of the bound may depend on both. The constant may depend on $C_L \, M_0$ and the query shape.
  Let $V$ denote the flag vector, let $C_(cal(P)) \( K \)$ denote the cell of $cal(P)$ containing the key $K$, and let $p_(O \, V)$ be its cell law conditional on $O \, V$. Average this law with the actual joint distribution of $\( O \, V \)$; flag values of probability zero may be given any conditional law. The entropy chain rule gives
  $ bb(E) D_2 \( p_(O \, V) bar.v.double w \) = bb(E) D_2 \( H_O bar.v.double w \) + I \( C_(cal(P)) \( K \) \; V divides O \) lt.eq bb(E) D_2 \( H_O bar.v.double w \) + F . $
  Indeed, split each logarithm $log_2 \( p_(O \, V) \( C \) \/ w_C \)$ through $H_O \( C \)$. The first term averages to $I \( C_(cal(P)) \( K \) \; V divides O \)$; the second averages to $bb(E) D_2 \( H_O bar.v.double w \)$ because averaging $p_(O \, V)$ over the conditional flag law gives $H_O$. The information term is at most the entropy of the $F$-bit flag vector, hence at most $F$. Thus (10.6) holds for these conditional histograms with $C_H + F$ in place of $C_H$.
  For the small-set assertion, suppose by contradiction that $omega_n \( A_n \) arrow.r 0$ but the averaged query probability of $A_n$ is bounded below by $a > 0$ on a sequence of leaves. Fix $0 < delta < 1 \/ 2$ and enlarge $A_n$ to a set of reference weight tending to $delta$; the uniform slot atoms tend to zero, so this is possible. On the resulting two-cell partition, the binary entropy inequality gives
  $ D_2 \( \( p \, 1 - p \) bar.v.double \( delta \, 1 - delta \) \) gt.eq p log_2 \( 1 \/ delta \) - 1 . $
  Taking expectations and limits in (10.6) yields $a log_2 \( 1 \/ delta \) lt.eq C_H + 1$. Sending $delta$ to zero is a contradiction. This proves (i), and the same assertion holds for every filtered submeasure by domination.
  We next prove the net assertion. For a partition $cal(P)$, write $Pi_(cal(P)) d$ for its conditional-average density relative to $omega_n$. If some filtered density $d$ satisfies $lr(bar.v.double d - Pi_(cal(P)) d bar.v.double)_1 > epsilon$, split every cell by the set where $d - Pi_(cal(P)) d$ is positive. On the refined partition the filtered cell masses differ in $ell^1$ by more than $epsilon$ from their parent masses subdivided in reference proportions. Since the filter is a function of $\( O \, V \)$ with values in $\[ 0 \, 1 \]$, the triangle inequality implies that the #emph[expected] corresponding discrepancy of the unfiltered conditional vectors $p_(O \, V)$ is at least $epsilon$.
  For any refinement, the relative entropy chain rule and (10.4) give
  #[#set math.equation(numbering: n => "(10.7)")
   $ & bb(E) D_2 \( p_(upright("child")) bar.v.double w_(upright("child")) \) - bb(E) D_2 \( p_(upright("parent")) bar.v.double w_(upright("parent")) \)\
 & quad gt.eq 1 / 2 (bb(E) lr(bar.v.double p_(upright("child")) - "split"_w \( p_(upright("parent")) \) bar.v.double)_1)^2 . $ <eq:histogram-refinement-gain>]
  Here $"split"_w$ divides each parent mass among its children in their reference proportions. To see the last step, apply the usual conditional relative entropy identity inside each parent, then Pinsker, and then Jensen first with the parent masses and then over $\( O \, V \)$.
  A bounded number of refinements must suffice uniformly asymptotically. For otherwise choose any large fixed depth $d$ and a sequence of leaves with $d$ successive witnessing refinements. Their final partitions have at most $2^d$ cells. Pass to a subsequence on which the reference weights of the entire finite tree converge and the laws of the conditional histogram vectors converge. A final cell of zero limiting reference weight has zero limiting expected conditional mass by (i), and hence zero conditional mass almost surely. Delete these zero-weight cells in the limit. For a positive-weight parent, reference subdivision ratios converge. For a zero-weight parent, both the actual and subdivided total masses tend to zero in expectation. The positive discrepancy at every refinement consequently persists in the limit, at least as $epsilon \/ 2$ if needed.
  The limiting final conditional entropy is at most $C_H + F$. Indeed, before taking limits merge all zero-limiting-weight final cells into one positive cell, and use the conditional version of (10.6) on that partition. All its limiting weights are positive, so entropy is continuous. This merging is used only for the final upper bound. The remaining positive limit cells still form a genuine refinement tree, on which (10.7) telescopes. That identity forces the final entropy to be at least $d epsilon^2 \/ 8$, a contradiction for large fixed $d$.
  Apply the preceding argument with $epsilon \/ 2$. On a partition of bounded size $r'_0$ that approximates every family member, quantize each cell mass downwards in increments $epsilon \/ \( 2 r'_0 \)$. The $L^1$ error in the piecewise-constant density is the sum of the cell-mass errors, at most $epsilon \/ 2$. There are at most $\( 1 + 2 r'_0 \/ epsilon \)^(r'_0)$ possible quantized mass lists. They form the required net, proving (ii).
  For (iii), the restriction of a density $d$ relative to $omega_n$ has density $omega_n \( cal(K)_n \) d$ on $cal(K)_n$ relative to $nu_n$. Restriction therefore cannot increase the $L^1$ distance. A $nu_n$-small set is also $omega_n$-small, so (i) transfers as well. Every resulting subdensity has integral at most one; its superlevel set above $R$ has reference measure at most $1 \/ R$. Assertion (i), applied along any contrary sequence, makes the integrals on those superlevel sets tend to zero uniformly as $R arrow.r oo$. This is uniform integrability. ◻
]

#prodef([Remark 10.6.])[
  39 allows a leaf to have strongly nonuniform histograms. For example, forcing a whole primal frame map into a fixed ambient subspace of constant codimension costs $2^(O \( n \))$ and can be consistent with (10.1). It puts its keys on a fixed small reference set. The uniform entropy constant is therefore allowed to depend on the leaf density exponent and on $M_0$.
] <rem:histogram-leaf-versus-mixed>

=== 10.6 Fixed tests under the mixed law <fixed-tests-under-the-mixed-law>

The remaining estimates concern typical orientations in the mixture. They compare empirical query integrals with their global reference values, then combine unary weights with the prescribed binary constraints and give positive conditional fractions for basis statuses. For these conclusions we use the marginal bounds retained by the mixed law.

For the rest of this section, let $rho_n$ be a law on units satisfying, for a fixed $C$ and some $a_n arrow.r 0$,

#[#set math.equation(numbering: n => "(10.8)")
 $ rho_n lt.eq 2^(C N) mu^2 \, #h(2em) \( rho_n \)_i lt.eq M 2^(a_n N) mu quad \( i = 1 \, 2 \) . $ <eq:histogram-mixed-caps>]

Changing the fixed factor $M$ does not matter. Since $M_0$ is fixed, $a_n N = o \( n \)$. The law may have arbitrary dependence between its two endpoints. A decomposition into leaves does not change (10.8) for its mixture.

#thm([Lemma 10.7.])[
  (Typicality of common input-and-key tests).  #emph[Let $F_n$ be a uniformly bounded common function of the inputs and keys of a fixed bounded query, with no other orientation dependence. Put 
$ A_n \( O \) = bb(E)_z F_n \( z \, K \( O \, z \) \) \, #h(2em) m_n = bb(E)_(O tilde.op mu^2 \, z) F_n \( z \, K \( O \, z \) \) . $

 For every fixed $epsilon > 0$, under (10.8), 
$ rho_n { \| A_n - m_n \| > epsilon } = 2^(- Omega \( n \)) . $

 Repeated labels in the query are allowed. The constants may depend on the query and $epsilon$, but the estimate is uniform over tests with the given sup bound. The exceptional set may depend on the test.]
  #emph[For a query at just one endpoint, its raw variance about its raw mean is $2^(- Omega \( n \))$. This variance bound is also uniform when an arbitrary external input-and-image datum is fixed as an argument of the test.]
] <lem:typicality>

#proof[
  Rescale the test to have absolute value at most one. First consider one raw endpoint and duplicate its parameter batch. The two batches have jointly independent nominal columns except with $2^(- Omega \( n \))$ probability, because their $Z$ inputs are independent and their total number of columns is bounded. With the nominal inputs fixed on this event, 41 compares the product of the two tests with the product of their separate raw expectations, at error $O \( 2^(- N \/ 2) \)$. Averaging the two independent input batches and bounding the dependent-input event trivially proves
  #[#set math.equation(numbering: n => "(10.9)")
   $ "Var"_(O tilde.op mu) #scale(x: 120%, y: 120%)[\(] bb(E)_z F_n \( z \, K \( O \, z \) \) #scale(x: 120%, y: 120%)[\)] lt.eq C_1 2^(- c'_1 n) . $ <eq:histogram-one-endpoint-variance>]
  All these estimates are uniform in a fixed external datum, since it only changes the separate bounded test functions. Chebyshev’s inequality proves the one-endpoint assertion at every fixed tolerance.
  For the paired assertion, assume that both endpoints are used; the other case follows at once from the marginal bound. Let $D_2$ denote the second endpoint’s input-and-image data under its raw model, and for a first orientation $o$ define
  $ h_o \( D_2 \) = bb(E)_(z_1) F_n \( z_1 \, K_1 \( o \, z_1 \) \, D_2 \) \, #h(2em) macron(h) \( D_2 \) = bb(E)_(o tilde.op mu) h_o \( D_2 \) . $
  Fix a small constant $eta > 0$. By (10.9), uniformly in $D_2$, $bb(P)_mu { \| h_o \( D_2 \) - macron(h) \( D_2 \) \| > eta }$ is exponentially small. Fubini and Markov show that, outside an exponentially small set of first orientations, the raw-model probability of the bad data set
  $ B_o = { D_2 : \| h_o \( D_2 \) - macron(h) \( D_2 \) \| > eta } $
  is at most $2^(- c n)$ for some $c > 0$. The marginal cap in (10.8) still makes the discarded first-endpoint mass exponentially small.
  Fix any of the remaining first orientations. We claim that a raw second orientation $o'$ has empirical input probability at least $eta$ of $B_o$ only with probability $2^(- Omega \( n^2 \))$. Draw $ell' = floor.l c'_2 n floor.r$ independent second-endpoint input batches. For an orientation with empirical bad probability at least $eta$, at each step success and nominal independence of the new columns modulo the previous ones have conditional probability at least
  $ eta - O \( 2^(- n + O \( ell' \)) \) gt.eq eta \/ 2 . $
  The failure bound depends only on fresh uniform $Z$ coordinates and holds for any past inputs. Thus all successes together with joint nominal independence have probability at least $\( eta \/ 2 \)^(ell')$.
  For independent nominal columns, the joint raw image law of these batches has density at most $2^(C_2 \( ell' \)^2)$ relative to the product of the individual raw batch laws. Indeed it adds only $O \( \( ell' \)^2 \)$ mutual Gram conditions and injectivity; count their normalizations by 40 and bound the indicator in the numerator by one. After averaging the inputs, the all-success probability on the independence event is consequently at most
  $ 2^(C_2 \( ell' \)^2) bb(P) \( D_2 in B_o \)^(ell') lt.eq 2^(C_2 \( ell' \)^2 - c n ell') . $
  Choose $c'_2 > 0$ small enough that $C_2 \( c'_2 \)^2 < c c'_2 \/ 2$ and that nominal independence is available. Dividing by $\( eta \/ 2 \)^(ell')$ proves the claim.
  This quadratic-exponential estimate is uniform in the fixed good first orientation. Hence the set of paired orientations with a good first endpoint but a bad oversampling second endpoint has $mu^2$-mass $2^(- Omega \( n^2 \))$. Multiplying by the joint density $2^(C N) = 2^(C M_0 n)$ still leaves quadratic-exponentially small mass. On every remaining pair,
  $ \| bb(E)_(z_2) h_o \( D_2 \) - bb(E)_(z_2) macron(h) \( D_2 \) \| lt.eq 3 eta . $
  Finally, $macron(h)$ is a common input-and-key test of the second endpoint. Apply the one-endpoint estimate again and its marginal cap to compare its empirical integral with its raw mean to within $eta$. Taking $4 eta < epsilon$ proves the lemma. ◻
]

#prodef([Remark 10.8.])[
  Uniformity in the test means that each prescribed test has a small exceptional set with the stated bound. It does not mean that one orientation is simultaneously good for every possible global test. The later arguments use only finitely many common tests at a time. Restriction to a sublaw of inverse-polynomial mass, or more generally of reciprocal mass $2^(o \( n \))$, preserves (10.8). Such restriction need not preserve a uniform cap on every individually normalized old leaf. The mixed-law lemmas do not require that additional conclusion.
] <rem:typicality-no-test-supremum>

=== 10.7 Mixing of the binary parameter constraints <mixing-of-the-binary-parameter-constraints>

#thm([Lemma 10.9.])[
  (Binary mixing).  #emph[Fix a query template whose labels are distinct at each used endpoint. Impose the off-position Gram zeros of $cal(K)_n$ and a consistent fixed specification of the within-endpoint ordered $L \, R$ evaluations used in 6. Let $cal(A)_n \( O \, z \)$ be their joint indicator. There is a template constant $kappa > 0$ such that, outside an exponentially small set of orientations under (10.8), 
#[#set math.equation(numbering: n => "(10.10)")
 $ bb(E)_z cal(A)_n \( O \, z \) product_j w_j \( O \, z_j \) = kappa product_j bb(E)_(z_j) w_j \( O \, z_j \) + O \( 2^(- c n) \) $ <eq:binary-mixing>]

 uniformly over all unary weights with $\| w_j \| lt.eq 1$. These weights may depend on the entire fixed orientation. The input laws may be conditioned separately on feasible diagonal values or tester summaries. The exceptional set is independent of the unary weights.]
] <lem:binary-mixing>

#proof[
  Collapse all identical Gram entries, including the repeated same-endpoint entries that equal the same $E$ evaluation, and impose only one copy of each. Consistency means that their prescribed values respect these repetitions. Expand the resulting binary indicators into characters. Its zero character has coefficient $kappa = 2^(- b)$, where $b$ is the number of the resulting specified bits. We show that every nonzero character has an exponentially small integral against the product of unary weights.
  If an interacting pair of positions belongs to the same endpoint, their labels are distinct. The second property of 21 says that every nonzero parity of its ordered $L \, R$ bits, with its possible $E$ bits in either order, has bilinear rank at least $n \/ 5$ on the retained free variables. This includes characters involving only $E$ bits.
  For positions from opposite endpoints, we establish the analogous claim for their global Gram bits except on a $2^(- Omega \( n^2 \))$ raw exceptional set. Write $d = dim cal(B) + h$ for the full plus-frame dimension. At one component, an intersection of dimension at least $v = floor.l n \/ 10 floor.r$ between the two full plus spans gives $v$ independent image relations. Their coefficient choices number at most $2^(2 d v)$, and the frame image estimate bounds each event by $2^(- \( 1 - epsilon.alt \) v N)$, for a fixed small $epsilon.alt$. The choice of $M_0$, hence $d \/ N$ small, makes this $2^(- Omega \( n^2 \))$. There are only boundedly many components.
  Condition on plus frames off this exception. Choose a nonzero pair pattern and a component where, after exchanging the endpoints if necessary, it uses a plus slot at endpoint 1 paired with a minus slot at endpoint 2. At least $n - v$ of the first position’s $Z$ directions are independent modulo the second endpoint’s full plus frame. The second position’s nominal minus $Z$ directions are independent. Conditional on the plus frames, the latter minus columns have independent uniform values on the appropriate affine annihilator spaces, before their full-rank conditioning. Their evaluations on these $n - v$ directions therefore form a uniform rectangular matrix, up to a fixed translation. Terms in the reverse order and other components may be frozen first; they use separate minus-frame randomness. The final injectivity conditioning costs only a bounded multiplicative factor.
  A uniform $a$ by $b$ binary matrix has rank at most $r$ with probability at most $2^(\( a + b \) r - a b)$, by writing it as a product of an $a$ by $r$ and an $r$ by $b$ matrix and counting. With $a gt.eq n - v$ and $b = n$, this shows that the bilinear rank is greater than $n \/ 5$ except with probability $2^(- Omega \( n^2 \))$. Union over the boundedly many nonzero pair patterns. The joint density in (10.8) preserves this exceptional scale.
  For any nonzero full character, choose a pair with nonzero coefficient pattern and fix the other position inputs. The remaining terms become separate unary phases. The selected pair has rank at least $n \/ 5$ by one of the preceding two arguments. 16 gives an error $O \( 2^(- n \/ 10) \)$ against the two remaining bounded unary weights. Input conditioning costs only the fixed reciprocal probabilities of the diagonal values or tester summaries; those events can be absorbed into the respective weights. Summing the bounded number of characters proves (10.10). All estimates were uniform in the unary weights, so the exceptional set does not depend on them. ◻
]

=== 10.8 Positive basis fractions on common key cells <positive-basis-fractions-on-common-key-cells>

We give the small-cell argument explicitly, because its uniform lower fraction will be used on a countable collection of signature cells.

#thm([Lemma 10.10.])[
  (Quadratic signs on affine subspaces).  #emph[Let $Q$ be a quadratic function on a binary vector space and let its polar form have rank $2 r$. Its uniform sign bias has magnitude at most $2^(- r)$. On an affine subspace of codimension $c$, the restricted polar rank is at least $2 r - 2 c$, and its sign bias is at most $2^(- r + c)$ whenever this bound is less than one.]
] <lem:histogram-quadratic-bias>

#proof[
  Squaring the mean sign and translating one variable gives
  $ \| bb(E)_x \( - 1 \)^(Q \( x \)) \|^2 = bb(E)_h \( - 1 \)^(Q \( h \) + Q \( 0 \)) upright(bold(1))_({ B \( h \, dot.op \) = 0 }) \, $
  where $B$ is the polar form. Its absolute value is at most the kernel proportion $2^(- 2 r)$. Restricting a bilinear form to a codimension-$c$ subspace in each of its two factors can decrease rank by at most $2 c$. Apply the first assertion on that affine subspace, where translation affects only the linear and constant terms. ◻
]

#thm([Lemma 10.11.])[
  (Unary reference law and base-status positivity).  #emph[Fix an endpoint, tag, label, flavor, and feasible tester summary with diagonal $q$. For a bounded number of common global key tests, its empirical conditional key frequencies differ from $Omega_(l \, q \, n)$ by any prescribed fixed tolerance except on exponentially small mixed mass under (10.8).]
  #emph[At each unit, let $C_i subset cal(X)$ be any orientation-dependent space of dimension at most $K^2$ all of whose elements have total component rank at most $K$, and choose any basis. Fix a sequence of global single-key sets $A_n$ with $Omega_(l \, q \, n) \( A_n \) gt.eq delta > 0$. Except on exponentially small mixed mass, every basis assignment has, conditional on the tester summary and on $K_i in A_n$, fraction at least $\( 7 \/ 8 \) 2^(- dim C_i)$.]
  #emph[For the full generic flavor and inputs conditional just on $q$, the following conservative constant is valid: 
#[#set math.equation(numbering: n => "(10.11)")
 $ beta = 2^(- K^2 - 1) 4^(- \( g^2 + 1 \)) > 0 . $ <eq:uniform-base-fraction>]

 For every feasible specified tester summary and basis assignment, outside an exponentially small exceptional set, 
#[#set math.equation(numbering: n => "(10.12)")
 $ bb(P)_z { K_i in A_n \, med upright("the specified summary and basis bits") divides q } gt.eq beta thin Omega_(l \, q \, n) \( A_n \) . $ <eq:histogram-base-cell-lower>]

 In particular each joint choice of the role $a \( "atom" \)$ and the basis bits has this lower bound, after choosing a compatible summary. Both roles are available for either possible generic $q$.]
  #emph[The lower constants do not depend on $delta$, on the key tests, or on the orientation-dependent choice of $C_i$. The onset of the asymptotics and the exceptional-set constants may depend on a fixed positive lower bound $delta$. The exceptional set is allowed to depend on the prescribed tests: there is no simultaneous assertion over all measurable key sets at one orientation.]
] <lem:unary-positivity>

#proof[
  For each fixed point parameter, the raw key law is the single-key reference up to an exponentially small injectivity error, by 13. The first conclusion therefore follows from the one-endpoint part of 45, also after conditioning on a feasible summary.
  Fix a nonzero profile $x in cal(X)$ of total component rank at most $K$, and consider the sign
  $ s_x \( z \) = \( - 1 \)^(T \( x \, "atom" \( z \) \)) . $
  By the first property of 21, its dependence on $Z$ factors through a bounded-dimensional space of linear forms, independent of the other input values, and its $Z$-polar rank is at least $2 \( J - s_0 \)$. Put
  $ gamma = 2^(- K^2 - 3) \, #h(2em) b_(*) = 2^(- J + 2 s_0) < gamma . $
  The strict inequality follows from the chosen lower bound on $J$.
  Apply a uniform $G in "GL"_n \( bb(F)_2 \)$ simultaneously to the $Z$ input coordinates in all primal frames at the queried endpoint. This preserves the raw law because $E$ has no $Z$ rows or columns. It also preserves the empirical mass of a global key cell: change variables in the uniform $Z$ input and leave the other coordinates unchanged. After this change of variables the cell event is fixed and the sign’s bounded row-bit space is moved by the inverse transformation.
  Fix a starting orientation for which the cell, conditional on the summary, has input mass at least $delta \/ 2$. We claim that at most $2^(- 2 A n)$ of the transformations can make its conditional absolute sign bias exceed $gamma$, for sufficiently large $n$. Suppose the contrary and retain one bias sign, losing at most a factor two. For any fixed integer $u$, choose $u$ such transformations successively so that each new row-bit space meets the span of the previous ones in dimension at most $s_0$. This is possible for large $n$. Indeed, for a uniformly moved space of bounded dimension and a fixed space of bounded dimension, the probability of an intersection of dimension greater than $s_0$ is $O_u \( 2^(- s_0 n) \)$: choose $s_0$ independent vectors in the former and bound the probability that their uniformly independent images all lie in the latter. The number of such choices and target vectors is bounded independently of $n$. Since $s_0 = 4 ceil.l A ceil.r > 2 A$, this excluded fraction is smaller than the retained fraction at each of the fixed number of choices.
  Let $E_0$ be the fixed cell event in the conditional input probability space and let $delta' = bb(P) \( E_0 \) gt.eq delta \/ 2$. Denote the chosen signs, with their common bias sign adjusted to be positive, by $s_1 \, dots.h \, s_u$. Let $cal(F)_(j - 1)$ contain all non-$Z$ inputs and the row bits of the preceding chosen spaces, and put
  $ m_j = bb(E) \( s_j divides cal(F)_(j - 1) \) \, #h(2em) D_j = s_j - m_j . $
  Conditioning the current row bits on the past imposes at most $s_0$ linear conditions on their distribution. The polar rank can therefore lose at most $2 s_0$ further dimensions. By 48,
  $ \| m_j \| lt.eq b_(*) $
  pointwise, including after the non-$Z$ inputs are fixed. The $D_j$ are martingale differences with second moments at most one, so $lr(bar.v.double u^(- 1) sum_j D_j bar.v.double)_2 lt.eq u^(- 1 \/ 2)$. On the other hand every selected sign has conditional mean greater than $gamma$ on $E_0$. Consequently
  #[#set math.equation(numbering: n => "(10.13)")
   $ \( gamma - b_(*) \) delta' lt.eq \| bb(E) upright(bold(1))_(E_0) thin u^(- 1) sum_j D_j \| lt.eq sqrt(delta' \/ u) . $ <eq:histogram-tiny-cell-martingale>]
  Here the intrinsic bias costs $b_(*) delta'$, because its conditional mean is bounded pointwise; it does not cost an absolute $b_(*)$ before division by the cell mass. Taking $u > 2 \/ \[ delta \( gamma - b_(*) \)^2 \]$ contradicts (10.13). This proves the transformation claim with $J$ fixed independently of the cell mass.
  Integrate that claim over the starting raw orientation, using frame-law invariance. The first part of the lemma makes the cell mass at least $delta \/ 2$ outside an exponentially small set. More precisely, the transformation estimate is used only on orientations with this mass; that property is itself invariant under the transformations. This cell-mass exceptional set is common to all profiles and is discarded only once. For a fixed $x$, the bad conditional sign-bias event on that set has raw probability at most $2^(- 2 A n)$. There are at most $2^(A n)$ nonzero profiles of the required rank for all sufficiently large $n$, by 21. Union over them, and over the bounded numerical position and summary choices. The resulting event is still exponentially small, also after the marginal inflation in (10.8).
  On its complement every nonzero linear combination of a basis of $C_i$ has conditional sign bias at most $gamma$, regardless of how the space and basis were selected from the unit. Fourier inversion, for $d_i = dim C_i$, gives for every assignment
  $ bb(P) \( upright("assignment") divides E_0 \, upright("summary") \) gt.eq 2^(- d_i) #scale(x: 120%, y: 120%)[\(] 1 - \( 2^(d_i) - 1 \) gamma #scale(x: 120%, y: 120%)[\)] gt.eq \( 7 \/ 8 \) 2^(- d_i) . $
  This also covers $d_i = 0$.
  It remains to check the uniform generic constant. For one retained tester block, the sum of $r_0 gt.eq 1$ independent bit-pair products has probabilities $\( 1 plus.minus 2^(- r_0) \) \/ 2$, both at least $1 \/ 4$. Distinct tester blocks use disjoint input bits. There are at most $g^2 + 1$ such blocks, so every feasible summary has probability at least $4^(- \( g^2 + 1 \))$. Conditional on its compatible value of $q$, its probability is no smaller. Its empirical key-cell mass, conditional on that summary, is at least $\( 3 \/ 4 \) Omega_(l \, q \, n) \( A_n \)$ outside an exponentially small set by the first part. Combining this with the basis lower fraction gives (10.12), since $\( 3 \/ 4 \) \( 7 \/ 8 \) > 1 \/ 2$. In the generic flavor there is at least one retained $O$ tester and the independent shared tester. Prescribing their parities realizes either $a$ role at either fixed $q$, and a feasible summary for each has the same lower probability bound. ◻
]

#prodef([Remark 10.12.])[
  The key-only hypothesis cannot be omitted. For a fixed nonzero profile $x_0$, the input event ${ z : T \( x_0 \, "atom" \( z \) \) = 0 }$ has zero conditional mass for the opposite basis bit. This is an allowed input-and-key test for concentration, but is not a common global key cell for positivity. The constants in 49 apply on every fixed positive limiting key cell, however small. Countably many resulting cell inequalities can be passed through a diagonal subsequence; they do not assert simultaneous finite-$n$ control of all possible cells. An orientation-only subfilter preserves an almost-sure limiting positivity statement, whereas an arbitrary additional input filter need not.
] <rem:unary-positivity-key-only>

== 11 Weak product testing <sec:product-tests>

The preceding histogram lemma gives compact families within each leaf. We now prove a different statement: a fixed global test on a tuple of keys can be replaced, for the integrations that occur here, by a bounded sum of products of global single-key functions. Both its reference and its actual-query conclusions are needed.

Fix a query template with $r$ positions and with labels distinct at each used endpoint. Its input laws and reference measures are those of 10. In particular $overline(Omega)_n = ⨂_(j = 1)^r Omega_(l_j \, q_j \, n)$ and $nu_n$ is its off-position-Gram-conditioned reference on $cal(K)_n$. The additional prescribed binary tests are the within-endpoint ordered $L \, R$ evaluations from 6. Let $cal(A)_n \( O \, z \)$ be the successful binary indicator from 47, including the off-position Gram zeros.

#thm([Theorem 11.1.])[
  (Weak product comparison).  #emph[Let $W_n$ be any sequence of real functions on $cal(K)_n$ with $lr(bar.v.double W_n bar.v.double)_oo lt.eq B$, where $B$ is fixed. Extend it to the product of the single-key spaces with the same bound. For every $epsilon > 0$ there are constants $L \, C < oo$, independent of $n$, and functions 
#[#set math.equation(numbering: n => "(11.1)")
 $ S_n \( k_1 \, dots.h \, k_r \) = sum_(a = 1)^L c_(a \, n) product_(j = 1)^r f_(a \, j \, n) \( k_j \) \, #h(2em) \| c_(a \, n) \| lt.eq C \, quad \| f_(a \, j \, n) \| lt.eq 1 \, $ <eq:weak-product-approximant>]

 with the following properties.]
  + #emph[For arbitrary global unary functions $g_(j \, n)$ of bound one, 
#[#set math.equation(numbering: n => "(11.2)")
 $ \| integral \( W_n - S_n \) product_j g_(j \, n) \( k_j \) thin d nu_n \| lt.eq epsilon $ <eq:weak-product-reference>]

 for all sufficiently large $n$.]
  + #emph[Under any mixed unit law satisfying (10.8), outside an exponentially small exceptional set of orientations, 
#[#set math.equation(numbering: n => "(11.3)")
 $ sup_(\| w_j \| lt.eq 1) \| bb(E)_z cal(A)_n \( O \, z \) \( W_n - S_n \) \( K \( O \, z \) \) product_j w_j \( O \, z_j \) \| lt.eq epsilon . $ <eq:weak-product-actual>]

 The unary input weights may depend on the entire fixed orientation and on any additional marks fixed with it. The exceptional set is independent of these weights.]
  #emph[The functions $f_(a \, j \, n)$ are global key functions; they can be chosen to be indicators of sets, or finite linear combinations of such indicators with uniformly bounded complexity. They do not depend on the sampled orientation. The constants may depend on $B \, epsilon$ and the fixed template and construction parameters, but not on $n$.]
  #emph[An additional orientation-only filter of bound one may multiply (11.3) without changing it. In particular, after averaging normalized leaves, the same error control applies to unnormalized admissibility-filtered query measures, even when the filter is chosen using the opposite leaf. No assertion is made for an arbitrary additional joint input filter.]
] <thm:weak-product>

The proof uses a finite family of twists. If $I \, J$ partition a set of positions into two nonempty groups, let $cal(T)_(I \, J)$ consist of all products of their available inter-position global Gram signs: the dot products of a plus slot at one position with a minus slot at another position in the same component. These signs are defined on the product reference whether or not that Gram is prescribed by a raw same-endpoint frame law. Every such twist equals one on $cal(K)_n$. The number of twists is a constant depending only on the query shape.

For a real function $D$ on the keys of $I union J$, define its twisted cut norm by

#[#set math.equation(numbering: n => "(11.4)")
 $ lr(bar.v.double D bar.v.double)_(square.stroked.tiny \, cal(T)) = max_(tau in cal(T)_(I \, J)) sup_(\| f \| \, \| g \| lt.eq 1) \| integral D \( k_I \, k_J \) tau \( k_I \, k_J \) f \( k_I \) g \( k_J \) thin d overline(Omega)_(I union J \, n) \| . $ <eq:twisted-cut-norm>]

Here $f \, g$ may be arbitrary functions on their whole respective groups. Only after the recursion below will they become unary.

We use the finite-partition energy-increment method underlying weak regularity; see #cite(label("frieze1999"), form: "prose"). The additional Gram conditioning needed here is retained explicitly in the following self-contained proof.

#thm([Lemma 11.2.])[
  (Finite twisted regularity).  #emph[Let $\| W \| lt.eq B$ on the product key space of $I union J$, and let $delta > 0$. There is a decomposition 
#[#set math.equation(numbering: n => "(11.5)")
 $ W = sum_(a = 1)^(L') c_a f_a \( k_I \) g_a \( k_J \) tau_a \( k_I \, k_J \) + D \, $ <eq:twisted-regularity-decomposition>]

 where $\| f_a \| \, \| g_a \| lt.eq 1$, $tau_a in cal(T)_(I \, J)$, $\| c_a \| lt.eq B$, $lr(bar.v.double D bar.v.double)_oo lt.eq 2 B$, and $lr(bar.v.double D bar.v.double)_(square.stroked.tiny \, cal(T)) lt.eq delta$. The number $L'$ is bounded in terms of $B \, delta$ and the twist count only. The functions $f_a \, g_a$ may be chosen as indicators of cells in finite group partitions.]
] <lem:product-twisted-regularity>

#proof[
  Let $Gamma$ be the finite list of crossing Gram bits generating the twists. Begin with the trivial partitions of the two groups. For any current pair of finite partitions, condition $W$ on their cells and on $Gamma$; call the resulting conditional expectation $S$. Then $lr(bar.v.double S bar.v.double)_oo lt.eq B$ and $lr(bar.v.double W - S bar.v.double)_oo lt.eq 2 B$.
  If $D = W - S$ has twisted cut norm greater than $delta$, choose a twist and witnesses $f \, g$ giving correlation greater than $delta$. Quantize $f \, g$ uniformly within their bounds finely enough, with a mesh depending only on $B \, delta$, that their quantized product times the twist still correlates with $D$ by more than $delta \/ 2$. Refine the group partitions by the values of these quantized functions. The witness product is measurable for the new conditioning algebra and has $L^2$ norm at most one. Thus the new conditional expectation of $D$ has $L^2$ norm at least $delta \/ 2$. Since $D$ is orthogonal to the old conditioning algebra, the squared $L^2$ norm of the new conditional expectation of $W$ increases by at least $delta^2 \/ 4$. It is bounded above by $B^2$. At most $4 B^2 \/ delta^2 + 1$ refinements are possible. Each increases the partition sizes by a factor bounded in terms of $B \, delta$, so the final partitions have bounded size.
  On each product of group cells, the final conditional expectation is a bounded function of $Gamma$. Assign value zero to any impossible combination of a cell pair and Gram bits. Its finite Fourier expansion on the Gram bits has coefficients of absolute value at most $B$. Multiplying by the two cell indicators gives (11.5). The decomposition is exact everywhere on the product key space, regardless of which Gram bit values occur in a particular cell pair. ◻
]

We next prove that a small twisted-cut remainder is negligible on actual queries. This is the step that is not supplied by unary histograms alone.

#thm([Lemma 11.3.])[
  (A terminal remainder on actual inputs).  #emph[Let $I \, J$ be a nontrivial partition of some of the template positions. Let $D_n$ be a common function of their global keys with $lr(bar.v.double D_n bar.v.double)_oo lt.eq B_1$ and $lr(bar.v.double D_n bar.v.double)_(square.stroked.tiny \, cal(T)) lt.eq delta$. Let $psi_n \( I \, J \)$ be any product of the specified nominal $L \, R$ signs and global Gram signs crossing from $I$ to $J$, evaluated on their actual inputs and keys. For each fixed $rho > 0$, except on exponentially small mixed mass, 
#[#set math.equation(numbering: n => "(11.6)")
 $ sup_(\| f \| \, \| g \| lt.eq 1) \| bb(E)_(z_I \, z_J) D_n \( K_I \, K_J \) psi_n \( I \, J \) f \( O \, z_I \) g \( O \, z_J \) \| lt.eq #scale(x: 120%, y: 120%)[\(] C_3 delta + rho + o \( 1 \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 4) . $ <eq:product-remainder-actual>]

 The constant $C_3$ and the vanishing error depend only on $B_1$ and the fixed template. The weights may depend arbitrarily on the fixed orientation. The exceptional set does not depend on those weights.]
] <lem:product-terminal-remainder>

#proof[
  For one fixed orientation, put $U \( I \, J \) = D_n \( K_I \, K_J \) psi_n \( I \, J \)$ and use independent copies of the parameter groups $I \, J$. Cauchy–Schwarz in $I$ gives
  $ \| bb(E) U \( I \, J \) f \( I \) g \( J \) \|^2 lt.eq bb(E)_I #scale(x: 120%, y: 120%)[\(] bb(E)_J U \( I \, J \) g \( J \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Expand the square, and apply Cauchy–Schwarz in the two $J$ variables. The factors $g \( J_0 \) g \( J_1 \)$ have bound one. We obtain
  #[#set math.equation(numbering: n => "(11.7)")
   $ \| bb(E) U \( I \, J \) f \( I \) g \( J \) \|^4 lt.eq Q_n \( O \) := bb(E)_(I_0 \, I_1 \, J_0 \, J_1) product_(a \, b in { 0 \, 1 }) U \( I_a \, J_b \) . $ <eq:product-four-corner>]
  In particular $Q_n \( O \) gt.eq 0$: it is the expectation over $J_0 \, J_1$ of the square of $bb(E)_I U \( I \, J_0 \) U \( I \, J_1 \)$. All separate weights, including their orientation dependence, have disappeared.
  The right-hand side is a bounded common input-and-key test, involving two fresh copies of each original position. Repeated labels across these copies are permitted by 45. It follows that, outside an exponentially small mixed exceptional set,
  #[#set math.equation(numbering: n => "(11.8)")
   $ Q_n \( O \) lt.eq bb(E)_(mu^2) Q_n + rho . $ <eq:product-four-corner-typical>]
  We bound the raw mean by $C_3 delta + o \( 1 \)$.
  Fix the nominal inputs of the four groups. Their columns are jointly independent within each endpoint, component, and mode except with $2^(- Omega \( n \))$ probability, since all copies have fresh $Z$ inputs. The dependent-input contribution is $o \( 1 \)$ by the fixed sup bound. On the independence event, 13 gives the uniform image law with prescribed same-endpoint Grams and injectivity. Ignore injectivity at an exponentially small error and express this law relative to the product of all the individual single-key references. There are only boundedly many additional Gram bits, and their normalization is bounded uniformly in the nominal inputs by 40. Expand their indicators into characters. The nominal $L \, R$ phases are now constants. The global Gram phases already in the four copies of $psi_n$ can be combined with the expansion characters.
  For completeness, distinguish a slot by its group $I$ or $J$, its copy, its position, component, and sign. Remove the diagonals already in the reference and collapse repeated descriptions of the same unordered slot dot. Every remaining Gram coefficient belongs to exactly one of the following classes:
  + both slots lie in one of $I_0 \, I_1 \, J_0 \, J_1$;
  + the slots join $I_0$ to $I_1$, or $J_0$ to $J_1$;
  + the slots lie in one of the four $I_a$–$J_b$ quadrants.
  Class (a) contributes bounded separate group phases. Suppose a nonzero class-(b) pattern between $I_0 \, I_1$ remains. Fix both $J$ groups. The four $D_n$ factors split into two bounded functions of $I_0$ and $I_1$. The class-(c) phases become separate functions of those two groups, as do all class-(a) phases. Their only remaining interaction is the nonzero coefficient rectangle between $I_0$ and $I_1$, whose bit rank is at least $N$. The individual diagonal densities may also be absorbed into the respective bounded weights. 16 bounds this term by $O \( 2^(- N \/ 2) \)$. The same argument applies to a nonzero $J_0$–$J_1$ pattern.
  If neither class-(b) pattern remains, attach each class-(c) pattern as an available twist to its corresponding $D_n \( K_(I_a) \, K_(J_b) \)$. Fix $I_1 \, J_1$. The remaining integral in $I_0 \, J_0$ has one factor $D_n$ times an available twist, tested against bounded separate functions. The two other unfixed $D_n$ factors have bound $B_1$ and the fixed factor has bound $B_1$. The twisted cut estimate therefore bounds this term by $B_1^3 delta$, with the harmless fixed normalization factors included in the constant.
  These cases exhaust the character expansion. Positions in $I$ or $J$ may belong to both endpoints of the unit: this only removes some same-endpoint Gram bits from the expansion and does not create a new class. A nonzero coefficient rectangle has rank at least one in distinguished global slots, hence bit rank at least $N$. The two dots $P_a dot.op Q_b$ and $P_b dot.op Q_a$, for example, use different slots and are not duplicates. The prescribed nominal Gram values affect character coefficients only by signs.
  Summing the bounded number of terms and averaging the nominal inputs gives $bb(E)_(mu^2) Q_n lt.eq C_3 delta + o \( 1 \)$. Combine this with (11.7) and (11.8). The same $Q_n \( O \)$ bounds every choice of separate weights, so the exceptional set is independent of them. ◻
]

#proof[
  If $r = 1$, quantize the values of $W_n$ in $\[ - B \, B \]$ with mesh at most $epsilon \/ 2$, choosing representatives in the same interval. The resulting $S_n$ satisfies $lr(bar.v.double W_n - S_n bar.v.double)_oo lt.eq epsilon \/ 2$ and is a linear combination of at most $1 + ceil.l 4 B \/ epsilon ceil.r$ global level-set indicators, with coefficients bounded by $B$. Both required errors are at most $epsilon \/ 2$, since the reference measure is a probability measure and the actual-query indicator and weights have bound one. This includes $B = 0$, when $S_n = 0$. For $r gt.eq 2$, apply 52 to a nontrivial split of the full set of positions. Recursively apply it to group factors in the structured terms until every factor is unary. Whenever a remainder is produced, leave that whole term terminal; do not expand its other factors. We obtain the exact decomposition, on the unconditioned product reference,
  #[#set math.equation(numbering: n => "(11.9)")
   $ W_n = S_n^(upright("tw")) + sum_(v in cal(V)_n) R_(v \, n) . $ <eq:product-recursive-decomposition>]
  Each structured term is a product of unary global functions times available Gram twists. Each terminal term has the form
  #[#set math.equation(numbering: n => "(11.10)")
   $ R_(v \, n) \( k \) = c_(v \, n) D_(v \, n) \( k_I \, k_J \) product_H f_(v \, H \, n) \( k_H \) thin tau_(v \, n) \( k \) \, $ <eq:product-terminal-form>]
  where $I \, J$ partition one group, the groups $H$ are disjoint outside $I union J$, all outside functions are bounded, $tau_(v \, n)$ is a product of available Gram signs, and $D_(v \, n)$ has a specified small twisted cut norm on $I \| J$. The sup bounds, numbers of terms, and partition complexities are all bounded independently of $n$.
  Here is an explicit way to organize the tolerance choices. Along any structured branch a split replaces one group by two, so at most $r - 1$ splits are needed before all groups are unary. At any fixed depth the number of pending terms and all their coefficient and factor bounds have already been bounded using previous choices. Allocate at most $epsilon \/ \( 2 r \)$ of each desired final error to that depth, dividing this budget among its pending terms and their known outside bounds. Choose the next cut tolerances small enough for the reference estimates below and for the fourth roots in 53. These choices determine a finite bound on the next level’s number of structured terms. Continue for at most $r - 1$ levels. The empirical tolerance $rho$ for each terminal test is chosen at the same stage, sufficiently small for its allotted fourth-root error. All choices are constants; none requires a change in the construction parameters or in $M_0$.
  On $cal(K)_n$, every Gram twist in $S_n^(upright("tw"))$ equals one. Removing them gives the function $S_n$ in (11.1). Its unary factors are indicators of the finite partitions used in the recursion; coefficients and term counts have the asserted bounds.
  To prove the reference assertion, multiply a terminal term (11.10) by a product of arbitrary bounded unary tests and expand the off-position Gram event defining $nu_n$. Fix all positions outside its remainder. Their group factors are bounded constants. Gram phases internal to $I$ or $J$ and phases involving a fixed outside position are separate bounded group weights. The only other phases are available crossing twists. Thus the integral is bounded by the twisted cut norm of $D_(v \, n)$ times a constant depending only on its known bounds and the fixed Gram normalization. The tolerance allocation makes the sum of these errors at most $epsilon$, proving (11.2). This estimate is uniform over all unary reference test functions.
  For the actual-query assertion, expand $cal(A)_n$ into its Gram and nominal $L \, R$ characters. The number of terms is bounded. Consider a terminal term and fix the outside position parameters. All phases internal to $I$ or $J$, or involving an outside position, can be absorbed into separate group weights. The remaining crossing phases are a product $psi_n \( I \, J \)$ of precisely the form in 53. It is independent of the outside parameter values: a binary bit involving an outside position has already been put into a separate weight. All original unary weights, even when they depend on the orientation, can also be included in these two weights.
  Apply 53, scaling the known outside bounds as necessary. Its common four-copy test is independent of the fixed outside parameters, so one exceptional orientation set controls every such fixation. Integrate the outside parameters, sum the bounded binary-character expansion, and sum the terminal terms. The chosen cut and empirical tolerances make the total at most $epsilon$ for sufficiently large $n$. The union of the finitely many exceptional sets is exponentially small. Since each four-copy estimate is uniform over its separate weights, the final exceptional set is independent of all unary input weights and of orientation-only filters. This proves (11.3). ◻
]

#thm([Corollary 11.4.])[
  (Factorized integration of the approximant).  #emph[For the structured sum in (11.1) and arbitrary bounded unary input weights, outside exponentially small mixed mass, 
#[#set math.equation(numbering: n => "(11.11)")
 $ & bb(E)_z cal(A)_n \( O \, z \) S_n \( K \( O \, z \) \) product_j w_j \( O \, z_j \)\
 & #h(2em) = kappa sum_(a = 1)^L c_(a \, n) product_j bb(E)_(z_j) #scale(x: 120%, y: 120%)[\[] f_(a \, j \, n) \( K_j \( O \, z_j \) \) w_j \( O \, z_j \) #scale(x: 120%, y: 120%)[\]] + o \( 1 \) . $ <eq:weak-product-factorized-integration>]

 The error is uniform over the unary weights. An orientation-only filter may be included before averaging this identity over leaves.]
] <cor:weak-product-factorized-integration>

#proof[
  Apply 47 to each structured term, with $f_(a \, j \, n) \( K_j \) w_j$ as its unary weights. The number of terms and their bounds are fixed at the chosen approximation accuracy, so the sum of the exponentially small errors tends to zero. The exceptional set in that lemma is independent of these weights. ◻
]

#prodef([Remark 11.5.])[
  (What the two comparisons do not assert).  The reference error in (11.2) is weak testing error, not $L^1$ error. The actual comparison allows arbitrary orientation-dependent #emph[unary] parameter weights, and the specified binary Gram/$L \, R$ conditions. It does not allow an unprescribed joint input filter to be inserted without proof. For instance, two complementary bounded tuple densities determined by a high-rank global bilinear bit can have nearly uniform unary marginals and zero overlap. A two-element histogram net would not exclude that example. The additional actual-query conclusion of 51, proved by the four-copy expansion, is what rules it out for the successful-query format used here. All factors added to the common signature lists by this theorem are global key functions. Nominal input status bits remain weights, not common key cells in 49.
] <rem:weak-product-filter-class>

== 12 A common limit for successful queries <sec:common-limit>

We first treat the alternatives of 34 in which the mass admitting a compatible injecting table is bounded away from zero. All arguments in this section concern a sequence with $n arrow.r oo$, with the construction parameters, including $M_0$, fixed. We freely pass to subsequences. The leaves retain their actual mass weights. Conditional on a leaf, its orientation law is normalized; a restriction imposed on a query is never normalized away.

The task is to turn positive status overlap at individual matched positions into overlap for an entire successful query, including its binary conditions. 13 will construct lists satisfying the scalar recipe equations. Here we establish the analytic implication that allows those lists to be used simultaneously.

=== 12.1 Options and the permitted filters <options-and-the-permitted-filters>

#prodef([Definition 12.1.])[
  (Numerical option).  A numerical option specifies a recipe shape with between one and seven positions on each cross edge, together with the following data:
  + the endpoint, tag, label, flavor, and diagonal bit at every position;
  + the full numerical unary statuses required at those positions, including the tester summary, the role $a \( upright("atom") \)$, the basis coordinates of $T \( upright("atom") \, dot.op \) \|_(C_i)$, and the $p_i$ bit;
  + the required within-endpoint binary evaluations, and the off-position Gram conditions defining the reference key space;
  + the small tables and the finite coordinate formats in which they are written.
  The two sides have matching tags and diagonal bits position by position. All labels used at one endpoint are distinct. Coordinate formats of smaller dimension are padded by zeros.
] <def:limit-option>

Once the construction parameters have been chosen, the collection of options is finite. In particular, a large selector length does not make this collection grow with $n$. The actual frames, leaves, and effective spaces may vary with $n$; an option records only their bounded numerical formats. A basis of each $C_i$ was chosen on its own leaf. Its tensor coordinates in the projected pin bases, its $a$ values, the pin/projection relations, and the mandatory support exclusions all have bounded finite descriptions. No arbitrary ambient tensor is included in this metadata.

Fix an option $omega$ and a pair of leaves $\( L_A \, L_B \)$. Call the option #emph[usable] on this pair if its finite metadata satisfy the label and injection requirements and its numerical statuses imply (6.2), with its binary prescriptions supplying (6.3). Denote this indicator by $U_omega \( L_A \, L_B \)$. Usability is determined by bounded discrete metadata. The phase conditions in 34 will help us find usable options; they need not be added to the definition of usability. Likewise, prediction exceptions may remain orientation metadata. They restrict our later choice of an option, rather than its definition of usability on an entire leaf pair.

For a specified table, admissibility against pinned images is checked separately on the two orientations. Write these flags as $F_(A \, omega)$ and $F_(B \, omega)$. They may depend on both leaves, but each is a function of only one orientation once the leaves are fixed. The successful query on one side therefore consists exactly of

#[#set math.equation(numbering: n => "(12.1)")
 $ & upright("an orientation-only flag") med times med product_ell upright("a unary status indicator at ") ell\
 & #h(3em)  times med upright("the specified binary and Gram indicators") . $ <eq:limit-success-format>]

The parameter input at each position is independent and uniform in its specified flavor, conditional on the requested feasible diagonal bit. Only the diagonal conditioning is included in this input normalization. The other successful-query factors remain unnormalized.

#prodef([Remark 12.2.])[
  (Two different classes of flags).  The density nets in 39 cover arbitrary orientation filters and a bounded family of additional numerical flags. The factorization argument below uses the narrower format (12.1). It does not introduce an arbitrary additional joint predicate on the point parameters. In particular, membership in a nominal basis-bit cell is a status requirement, not a global key test on which all basis assignments are asserted to remain possible.
] <rem:limit-filter-boundary>

For the key shape of $omega$, let $\( cal(K)_n \, nu_n \)$ be the uniform reference space from 7. Define $d_(A \, n)^omega$ and $d_(B \, n)^omega$ to be the densities of the two successful queries with respect to $nu_n$, after averaging orientations in their normalized leaves. Their integrals are at most one. Set

#[#set math.equation(numbering: n => "(12.2)")
 $ I_n \( omega \) = bb(E)_(L_A \, L_B) U_omega \( L_A \, L_B \) integral_(cal(K)_n) d_(A \, n)^omega d_(B \, n)^omega thin d nu_n . $ <eq:limit-option-overlap>]

Here the leaves are independent before usability or flag passage is tested. All restrictions in the integrand have already been charged to the subdensities. By 26, a positive lower bound for $I_n \( omega \)$ along a subsequence suffices for the desired collision. We shall analyze the contrary possibility

#[#set math.equation(numbering: n => "(12.3)")
 $ I_n \( omega \) arrow.r 0 #h(2em) upright("for every numerical option ") omega . $ <eq:limit-vanishing-overlap>]

Under this assumption we will construct a limiting experiment in which almost every orientation pair has the following property: every usable option whose two flags pass has zero unary status overlap at some matched position. This is the obstruction stated precisely in 62 and contradicted in 13.

Two parts of the construction are needed. Own-leaf nets and common projections pass vanishing overlaps of truncated densities to the limit. Uniform integrability identifies the full limiting measures as increasing suprema of those truncated measures, so their density products are also zero. Separately, both conclusions of 51 identify the full successful-query densities from their unary status measures. Lemma 12.5, Lemma 12.6 establish these two facts.

=== 12.2 A global projection for independent leaf families <a-global-projection-for-independent-leaf-families>

The nets supplied by 39 are chosen separately for each leaf. The next elementary Hilbert-space argument produces the common partitions that will be needed in the limit.

#thm([Lemma 12.3.])[
  (Global projections with adaptive filter choices).  #emph[Let $\( K_n \, nu_n \)$ be finite probability spaces. On each first-side leaf $L$ and each second-side leaf $L'$ let there be a family of subdensities. Assume that, for each fixed $R < oo$ and $epsilon > 0$, their truncations at height $R$ have $L^1 \( nu_n \)$ nets of uniformly bounded size, with the nets chosen using their own leaf only. The bounds may depend on $R \, epsilon$ but not on $n$ or the leaf.]
  #emph[For every $R < oo$ and $eta > 0$, there are deterministic partitions $cal(P)_n$ of uniformly bounded size such that the following holds. These partitions may depend on the leaf laws, but are chosen before the leaves are sampled. For independent leaves, choose a member $f$ and a member $g$ of the two truncated families, allowing either choice to depend on both leaves. If $P_n$ is conditional expectation onto $cal(P)_n$, then 
#[#set math.equation(numbering: n => "(12.4)")
 $ bb(E) \| chevron.l f \, g chevron.r - chevron.l P_n f \, P_n g chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq eta . $ <eq:limit-projection-error>]

 The same conclusion holds for every deterministic refinement of $cal(P)_n$ chosen independently of the sampled leaves. Multiplication of the discrepancy by any indicator determined by the leaf pair does not increase the bound.]
] <lem:limit-global-projection>

#proof[
  We may truncate net representatives to $\[ 0 \, R \]$. Since $lr(bar.v.double f - g bar.v.double)_2^2 lt.eq R lr(bar.v.double f - g bar.v.double)_1$ for functions in this interval, we obtain $L^2$ nets with uniformly bounded size, say at most $m$. Pad shorter nets by zero functions. Write their members as $f_(L \, a)$ and $g_(L' \, b)$, and form the positive operators on $L^2 \( nu_n \)$
  $ C_A = bb(E)_L sum_(a = 1)^m f_(L \, a) ⊗ f_(L \, a) \, #h(2em) C_B = bb(E)_(L') sum_(b = 1)^m g_(L' \, b) ⊗ g_(L' \, b) . $
  Here $\( f ⊗ f \) v = f chevron.l f \, v chevron.r$. Both traces are at most $T = m R^2$.
  Fix $delta > 0$. There are at most $T \/ delta$ eigenvalues of $C_A$ larger than $delta$. A unit eigenfunction $e$ for such an eigenvalue $lambda$ satisfies, pointwise,
  $ \| e \( x \) \| lt.eq lambda^(- 1) bb(E)_L sum_a \| f_(L \, a) \( x \) \| thin \| chevron.l f_(L \, a) \, e chevron.r \| lt.eq T \/ lambda lt.eq T \/ delta . $
  Quantize these finitely many bounded eigenfunctions with a common finite partition. Its conditional expectation $P$ can be made to satisfy $lr(bar.v.double \( 1 - P \) e bar.v.double)_2 lt.eq epsilon$ for every one of them. With $Q = 1 - P$, the spectral decomposition gives
  $ lr(bar.v.double Q C_A Q bar.v.double)_(upright("op")) lt.eq delta + T epsilon^2 . $
  The number of partition cells is bounded in terms of $m \, R \, delta \, epsilon$. If $P'$ is a refinement and $Q' = 1 - P'$, then $Q' = Q' Q = Q Q'$, so the same operator bound holds for $Q' C_A Q'$.
  For net representatives, independence of the leaves gives
  $ bb(E)_(L \, L') sum_(a \, b) \| chevron.l f_(L \, a) \, g_(L' \, b) chevron.r - chevron.l P' f_(L \, a) \, P' g_(L' \, b) chevron.r #scale(x: 120%, y: 120%)[\|]^2 & = "Tr" \( Q' C_A Q' C_B \)\
 & lt.eq \( delta + T epsilon^2 \) T . $
  This estimate permits pairwise-adaptive choices: the squared error for any chosen pair of representatives is pointwise at most the displayed sum. Cauchy–Schwarz bounds its expected absolute error. Approximating arbitrary family members by their net representatives costs at most a constant times $R$ times the $L^2$ net error, since orthogonal projections are contractions. Choose the net accuracy, then $delta$ and $epsilon$, sufficiently small in terms of $eta$. This proves (12.4), also for refinements. The final indicator assertion follows from the absolute-value bound before the indicator is applied. ◻
]

For a fixed numerical option, all parameter-dependent predicates needed by one side can be put in a bounded own-leaf flag family: its own basis bits, tester outcomes, and prescribed binary tests are already fixed by the option. All remaining dependence on the opposite leaf is an orientation filter. Consequently 39 supplies the net hypothesis of 58 for all such filters simultaneously. No net need be chosen anew using the opposite leaf.

=== 12.3 Common signatures and stored conditional measures <common-signatures-and-stored-conditional-measures>

The key spaces change with $n$. We compare them through lists of common binary tests: a key’s #emph[signature] is the sequence of its test values, and a cylinder prescribes finitely many of those values. There are lists for single keys and for key tuples. The tuple lists include all unary pullbacks and the additional tests needed to retain the projected overlaps. Their construction is given in the proof below.

At an orientation, record the empirical mass of every unary signature cylinder together with every full numerical status. The unary type $t = \( i \, l \, s \, phi \, q \)$ specifies the endpoint, tag, label, flavor, and diagonal bit. These masses and the finite metadata form an array $theta_n$. For each leaf pair, also store the two conditional laws of $\( theta_n \, upright("flag vector") \)$ in a record $Z_n$. This is necessary because a side’s admissibility flags may depend on the opposite leaf. Conditional on the leaf pair, the two orientation draws are still independent; averaging the record and ignoring the flags recovers the iid base arrays. The next lemma preserves this structure in the limit.

#thm([Lemma 12.4.])[
  (Common signature model).  #emph[There is a subsequence and a common limiting experiment with the following properties.]
  + #emph[For each tag and diagonal bit $\( l \, q \)$ there is a compact bit-sequence space $Xi_(l \, q)$ with reference law $m_(l \, q)$. For each key shape there is a compact tuple-test space $Upsilon$ with reference law $rho$. Its single-position projections $xi_ell$ have the independent laws $m_(l_ell \, q_ell)$.]
  + #emph[A base orientation array $theta$ contains its bounded discrete metadata and its single-atom status measures. For a unary type $t = \( i \, l \, s \, phi \, q \)$ and a full numerical status $upsilon$, these measures have jointly measurable densities 
#[#set math.equation(numbering: n => "(12.5)")
 $ h_(t \, upsilon)^theta : Xi_(l \, q) arrow.r \[ 0 \, 1 \] \, #h(2em) sum_upsilon h_(t \, upsilon)^theta = 1 quad m_(l \, q) upright("-almost everywhere") . $ <eq:limit-unary-densities>]

 For the full generic flavor, the sum of these densities over statuses with any specified role and basis vector in the recorded actual dimension is bounded below by a positive construction constant, almost everywhere. Compatible finer tester requirements have the lower fractions supplied by 49.]
  + #emph[There is first a random limiting leaf-pair record $Z$, which includes two conditional laws $Lambda_A \, Lambda_B$ of the arrays and their finite flag vectors. Conditional on $Z$, the two orientation records are drawn independently from these laws. After flags are dropped and $Z$ is averaged out, $theta_A \, theta_B$ are iid.]
  + #emph[Every discrete assertion of table usability, injection, and prepared phase compatibility is retained in this experiment. In particular, the positive mass of a passed compatible injecting table from 34 is retained. On the no-prediction branch the mass of a passed injecting table is at least $.99$. On a predicted branch the prediction relation is exact in the limiting status measures outside its stored exceptions.]
  #emph[All single-key tests used to define $Xi_(l \, q)$ are functions of global keys only.]
] <lem:limit-model>

#proof[
  We construct the test lists by successive finite stages. On predicted branches begin with the two global predictor bits. For every numerical option, positive integer truncation height, and successively improving fixed accuracy, request the cells of a partition provided by 58 as tuple tests. For every tuple cylinder already obtained and successively improving accuracy, request all unary indicator factors needed in 51. Include their unary pullbacks and the finite Boolean operations needed to record them. Enumerate these requests and fulfill finitely many at each stage, so that every request is eventually included. The resulting countable lists are closed under the required operations.
  Every finite stage has bounded complexity independent of $n$, so it defines sequences of tests for all sufficiently large $n$; finitely many missing initial values may be assigned arbitrarily. Bounded coefficients in the approximations are also included among the scalar coordinates that will converge. Regularity in 51 is performed on key spaces, so its new unary factors remain global key functions. Nominal input phases handled in that theorem are not added to the lists.
  In $theta_n$, include the finite metadata needed for the chosen $C_i$ bases and all numerical options; in predicted cases include the old marked profiles in these bases, the fixed role coefficients, and their exception sets. The cylinder masses lie in $\[ 0 \, 1 \]$ and obey consistent finite additivity identities. Their closed consistency space, together with the finite metadata, is compact and metrizable.
  Besides the two conditional laws already specified, retain in $Z_n$ the full and truncated successful-query measures on all tuple cylinders, for each option. These are measures of mass at most one on compact bit-sequence spaces; their spaces are compact for weak convergence. Take a common subsequence of the laws on the resulting countable product, and simultaneously of the deterministic reference laws and the bounded approximation coefficients. Consistent limiting cylinder masses define countably additive measures on the bit-sequence spaces, for example by first defining the measure on finite prefixes and taking the unique measure with those finite-dimensional laws.
  Cylinder evaluation is continuous because bit cylinders are clopen. For each fixed unary cylinder, 45 says that the sum of its empirical status masses differs in probability from its reference mass by a quantity tending to zero. The mixed marginal assumption is the one needed here; no assertion is made about every individually normalized leaf. Countably many limiting cylinder equalities imply that the total status measure is $m_(l \, q)$ almost surely. Each status measure is therefore dominated by $m_(l \, q)$, giving (12.5). Versions jointly measurable in $\( theta \, xi \)$ are obtained by taking the limits of their conditional density averages on increasing finite cylinder partitions.
  For a generic role/basis assignment, apply 49 to each fixed cylinder of positive limiting reference weight. The lower fraction is independent of the cell; the onset of the estimate may depend on its positive weight. All profiles of the relevant rank are covered by that lemma, so the chosen $C_i$ may vary with the orientation. Its lower inequalities pass to the limiting cylinder masses. Zero-reference cylinders already have zero total status mass. The cylinder inequalities extend by finite unions and monotone approximation to all measurable sets, giving the claimed almost-everywhere lower densities. This argument does not condition on arbitrary nominal input cells.
  By 42, every finite collection of unary signature tests has its product reference law in the tuple limit. Therefore the unary projections under $rho$ are independent with the stated marginal laws.
  There is no need to interchange disintegration and weak convergence. The conditional laws themselves were retained as random coordinates. For bounded continuous tests, taking their product is continuous in these two laws. Consequently sampling from $Lambda_A ⊗ Lambda_B$ conditional on the limiting record $Z$ reproduces the limiting joint orientation tests. Before flags are applied, the two base orientations were independent with the same law at every $n$, so this remains true after averaging $Z$ and dropping flags. Finite metadata are discrete coordinates, hence all their incidence and compatibility identities are retained. This proves the table assertions and their mass statements. Finally the prediction errors tend uniformly to zero on the retained orientations. Since the predictor bits are included as unary tests, each such error is a finite status-cylinder mass and becomes zero in the limit. ◻
]

=== 12.4 Truncation and the zero-product implication <truncation-and-the-zero-product-implication>

Fix the common model from 59. For an option and a side, let $eta_R \( Z \)$ and $eta \( Z \)$ denote the limiting successful-query measures obtained respectively from $min \( d_n \, R \) nu_n$ and $d_n nu_n$. All are measures on the tuple space for that shape.

#thm([Lemma 12.5.])[
  (Passage of vanishing overlaps).  #emph[Assume (12.3). For almost every $Z$, the measures $eta_A \( Z \) \, eta_B \( Z \)$ of every usable option are absolutely continuous with respect to $rho$, and their densities have product zero $rho$-almost everywhere.]
] <lem:limit-zero-product>

#proof[
  For each integer $R$, cylinder inequalities give $0 lt.eq eta_R lt.eq R rho$, and the measures increase with $R$. The uniform small-set conclusion of 39 also gives uniform integrability of the successful-query densities. Indeed, since their masses are at most one, $nu_n { d_n > R } lt.eq 1 \/ R$; uniform small-set control bounds the mass on this set by a quantity tending to zero as $R arrow.r oo$, uniformly asymptotically in the leaf and in its orientation filter. Thus there is a deterministic function $epsilon_R arrow.r 0$ such that, in the limit,
  $ 0 lt.eq eta \( Z \) \( Upsilon \) - eta_R \( Z \) \( Upsilon \) lt.eq epsilon_R quad upright("almost surely") . $
  It follows that $eta = sup_R eta_R$. In particular it has a density which is the increasing supremum of the truncated limiting densities.
  Fix $R$. The prelimit inner product of the two truncated densities, multiplied by usability, tends to zero because it is bounded above by (12.2). Choose a global partition with projection error at most $epsilon$ in 58. For that finite partition the inner product of the projected densities is
  $ sum_(C : thin nu_n \( C \) > 0) frac(eta_(A \, R \, n) \( C \) eta_(B \, R \, n) \( C \), nu_n \( C \)) . $
  This expression passes to its limiting counterpart in expectation, jointly with the discrete usability indicator. A cell whose reference weight tends to zero contributes at most $R^2 nu_n \( C \)$ and may be omitted. On the other cells ordinary continuity applies.
  Take increasing cylinder partitions which generate all tuple tests and include global projection partitions at accuracies tending to zero. The refinement assertion in 58 preserves the error estimate. Conditional expectations of the limiting bounded densities on these partitions converge in $L^2 \( rho \)$: this follows, for instance, by approximating an $L^2$ function by cylinder-simple functions and using that conditional expectation is an $L^2$ contraction. Their inner products therefore converge in expectation, being bounded by $R^2$. We obtain
  $ bb(E)_Z U_omega \( Z \) integral frac(d eta_(A \, R), d rho) frac(d eta_(B \, R), d rho) thin d rho = 0 . $
  All terms are nonnegative. Taking the countable intersection of the resulting almost-sure assertions, then increasing $R$, proves the same product-zero conclusion for the full densities. There are only finitely many options. ◻
]

=== 12.5 Identification of the full limiting density <identification-of-the-full-limiting-density>

The preceding argument transfers zero products to the limit. To express those products in terms of individual statuses, we now identify the full limiting query measure. The actual-query comparison in 51 replaces an arbitrary tuple test by a bounded sum of unary products. Binary mixing evaluates those products from the single-atom status measures. The reference comparison makes the same replacement against the limiting status densities.

For a side of an option, let $alpha_Z$ be the subprobability law of $theta$ obtained from its conditional law $Lambda$ by retaining the appropriate orientation flag. Let $t_ell \, upsilon_ell$ be its required unary type and status at position $ell$. Write $kappa > 0$ for the binary mixing constant for this side and numerical prescription. Constants on the two sides need not be denoted by the same letter.

#thm([Lemma 12.6.])[
  (Successful-query density).  #emph[For almost every $Z$, the full limiting successful-query measure on this side has density 
#[#set math.equation(numbering: n => "(12.6)")
 $ G_Z \( u \) = kappa integral product_ell h_(t_ell \, upsilon_ell)^theta #scale(x: 120%, y: 120%)[\(] xi_ell \( u \) #scale(x: 120%, y: 120%)[\)] thin d alpha_Z \( theta \) #h(2em) \( u in Upsilon \) $ <eq:limit-density>]

 with respect to $rho$.]
] <lem:limit-density>

#proof[
  The displayed expression is jointly measurable and nonnegative, by 59. We prove equality against every tuple cylinder indicator $W$.
  At a fixed accuracy $epsilon$, apply 51 to its prelimit global key test $W_n$. On the reference key space its structured approximation has the form
  $ W_n^(\( epsilon \)) \( k \) = sum_(a = 1)^(m_epsilon) c_(a \, n) product_ell phi.alt_(a \, ell \, n) \( k_ell \) \, $
  where the number of terms and all bounds are fixed at this accuracy. The unary factors may be taken to be finite linear combinations of indicator factors already in the common test lists. In the actual-query assertion of that theorem, take as unary weights the numerical status indicators of this option. These may depend on the orientation. The extra admissibility condition is orientation-only. Thus, after averaging over leaves, the successful mass tested by $W_n$ differs from that tested by $W_n^(\( epsilon \))$ by at most the prescribed accuracy and a vanishing error.
  For clarity, this last use does not require typicality separately on every leaf. At a typical orientation the product-testing error is uniform over the allowed bounded unary weights. Multiplying by any orientation flag only decreases its bound. After both leaves are averaged, the mass of exceptional orientations is bounded by the mixed orientation error in 45. An opposite-leaf-dependent choice of the flag cannot increase that unconditional error.
  Apply 47 to each structured term. Again its unary weights are the status indicators times bounded global unary factors. The resulting expression is
  #[#set math.equation(numbering: n => "(12.7)")
   $ kappa integral sum_a c_(a \, n) product_ell (integral phi.alt_(a \, ell \, n) thin d eta_(t_ell \, upsilon_ell \, n)^(theta_n)) d alpha_(Z_n) \( theta_n \) \, $ <eq:limit-structured-mass>]
  up to a vanishing error at this fixed complexity. Here the measures inside the product are the empirical single-atom status measures at the given orientation. Every integral in parentheses is a finite linear combination of status-cylinder coordinates. The coefficients and conditional measures were stored in the compactification. Consequently (12.7) converges jointly with the successful cylinder mass to the analogous expression in the limit. The preceding errors are controlled in mean absolute value over $Z$.
  It remains to compare that limiting structured expression with the integral of $W G_Z$. This is where the #emph[reference] conclusion of 51 is also needed. Its error bound, uniform against products of bounded unary functions, passes to the limiting reference law first for cylinder-simple unary functions, since all the relevant finite test probabilities converge. It then holds for all bounded measurable unary functions on the signature spaces: approximate each one in $L^1 \( m_(l \, q) \)$ by cylinder-simple functions, and telescope the product. At this fixed approximation accuracy the structured test has a fixed finite bound, so this passage costs a quantity tending to zero.
  We may therefore use the unary functions $h_(t_ell \, upsilon_ell)^theta$ in the limiting reference comparison, for each $theta$, and integrate it under the subprobability law $alpha_Z$. Independence of the unary projections under $rho$ gives
  $ integral W^(\( epsilon \)) \( u \) G_Z \( u \) thin d rho \( u \) & = kappa integral sum_a c_a product_ell (integral phi.alt_(a \, ell) \( xi \) h_(t_ell \, upsilon_ell)^theta \( xi \) thin d m_(l_ell \, q_ell) \( xi \)) d alpha_Z \( theta \) . $
  This is exactly the limit of (12.7). Replacing $W^(\( epsilon \))$ by $W$ in this last integral costs at most $kappa$ times the reference approximation accuracy. Combining the empirical and reference estimates and sending $epsilon arrow.r 0$ yields
  $ bb(E)_Z lr(|eta \( Z \) \( W \) - integral W G_Z thin d rho|) = 0 . $
  There are countably many cylinder indicators. Equality on all of them determines the measures and proves the lemma. ◻
]

#thm([Proposition 12.7.])[
  (The limiting overlap obstruction).  #emph[Assume (12.3). In the common experiment of 59, almost every sampled pair of orientation records has the following property: there is no usable numerical option whose two orientation flags pass and for which, at every matched position, 
#[#set math.equation(numbering: n => "(12.8)")
 $ integral_(Xi_(l \, q)) h_(t_A \, upsilon_A)^(theta_A) \( xi \) h_(t_B \, upsilon_B)^(theta_B) \( xi \) thin d m_(l \, q) \( xi \) > 0 . $ <eq:limit-positive-generator>]

]
] <prop:limit-overlap>

#proof[
  For a usable option, Lemma 12.5, Lemma 12.6 give $integral G_(A \, Z) G_(B \, Z) thin d rho = 0$ for almost every $Z$. Fubini’s theorem and independence of the unary projections express this integral as
  $ kappa_A kappa_B integral #h(-0.16667em) integral product_ell (integral h_(t_(A \, ell) \, upsilon_(A \, ell))^(theta_A) \( xi \) h_(t_(B \, ell) \, upsilon_(B \, ell))^(theta_B) \( xi \) thin d m_(l_ell \, q_ell) \( xi \)) thin d alpha_(A \, Z) \( theta_A \) thin d alpha_(B \, Z) \( theta_B \) . $
  All factors are nonnegative and both $kappa$ constants are positive. Hence the product inside is zero for almost every passed pair from the conditional laws. Averaging $Z$ and taking the finite union over options proves the assertion. ◻
]

== 13 Solving the status constraints <sec:status-span>

To contradict 62, we need a passed table and matched lists whose scalar recipe is satisfied and whose unary status overlaps are all positive. We first solve the scalar equations in the spans of numerical status vectors with positive overlap. Without a prediction, sufficiently frequent dual relations would produce a common prediction on the finite key spaces. With a prediction, the prepared phase conditions make every dual relation vanish on the target. We then turn the scalar solutions into lists of at most seven generators per cross edge, with distinct labels at every endpoint.

Write the endpoints of the two units as $\( A \, 1 \) \, \( A \, 2 \)$ and $\( B \, 1 \) \, \( B \, 2 \)$. In this section $h_(A \, i)$ or $h_(B \, j)$ denotes an atom’s role bit $a \( upright("atom") \)$, not the channel dimension. The basis status vector at an endpoint is denoted by $upright(bold(x))$, and its dimension is the recorded dimension of that endpoint’s effective space $C_i$.

=== 13.1 Generators and the coupled linear system <generators-and-the-coupled-linear-system>

Fix two orientation arrays $theta_A \, theta_B$ satisfying the almost-sure conclusions of 59. Some labels at each endpoint may be excluded. In particular, the mandatory support exclusions from (5.4) are always excluded.

#prodef([Definition 13.1.])[
  (Available generator).  On the cross edge $\( i \, j \)$, an available generator consists of a vector
  #[#set math.equation(numbering: n => "(13.1)")
   $ g = \( q \, h_(A \, i) \, h_(B \, j) \, upright(bold(x))_(A \, i) \, upright(bold(x))_(B \, j) \, p_(A \, i) \, p_(B \, j) \) $ <eq:status-generator-vector>]
  and a #emph[certificate]: a common tag, a surviving label at each end, and allowed flavors giving positive overlap as in (12.8) for these entries. Entries of the tester summary not displayed in (13.1) are summed over. All witnessing certificates remain available. Generators with the same numerical vector and different certificates may therefore be used as different occurrences. Sums and spans of generators refer to their numerical vectors.
  Let $V_(i j)$ be the binary span of these generators. Its #emph[base projection] forgets the final two $p$ entries and has target
  $ B_(i j) = bb(F)_2 xor bb(F)_2 xor bb(F)_2 xor bb(F)_2^(dim C_(A \, i)) xor bb(F)_2^(dim C_(B \, j)) . $
] <def:status-generator>

For every surviving pair of labels and every tag, each base vector has at least one available generator in the full generic flavor with those labels and that tag. Indeed, at fixed $q$ the sum of the status densities with any requested role/basis assignment is bounded below almost everywhere by 59. The product of the two such sums has positive integral on the common signature space. Splitting its finite sum over the two $p$ bits yields an available generator. Both diagonal bits are feasible in the full generic flavor. Thus

#[#set math.equation(numbering: n => "(13.2)")
 $ V_(i j) arrow.r B_(i j) upright(" is surjective") \, #h(2em) dim ker \( V_(i j) arrow.r B_(i j) \) lt.eq 2 . $ <eq:status-full-projection>]

This remains true after any exclusions leaving surviving generic labels.

Fix a small table. Its local target basis vectors are the evaluations of

$ \( a + \( u_(B \, j) U_(A \, i) \)^(*) \) \|_(C_(A \, i)) \, #h(2em) \( a + \( u_(A \, i) U_(B \, j) \)^(*) \) \|_(C_(B \, j)) \, $

in the recorded bases. Denote these vectors by $upright(bold(t))_(A \, i \; j)$ and $upright(bold(t))_(B \, j \; i)$, respectively. We seek one sum vector $v_(i j) in V_(i j)$ for each cross edge, subject to

#[#set math.equation(numbering: n => "(13.3)")
 $ q_(i j) & = 1 \, & h_(A \, i \; i j) + h_(B \, j \; i j) & = 1 \,\
upright(bold(x))_(A \, i \; i j) & = upright(bold(t))_(A \, i \; j) \, & upright(bold(x))_(B \, j \; i j) & = upright(bold(t))_(B \, j \; i) \, $ <eq:status-local-targets>]

#[#set math.equation(numbering: n => "(13.4)")
 $ sum_(i = 1)^2 \( p_(A \, i \; i j) + h_(A \, i \; i j) \) & = 0 &  & \( j = 1 \, 2 \) \,\
sum_(j = 1)^2 \( p_(B \, j \; i j) + h_(B \, j \; i j) \) & = 0 &  & \( i = 1 \, 2 \) . $ <eq:status-coupled-targets>]

These are precisely the scalar recipe equations (6.2). The occurrence of a given endpoint in two different sums is distinguished by its edge subscript. By 25, these are the effective-space conditions needed for the full gradients; the conditions on the selected atoms are supplied by (6.3). This use does not require pins to be supported at individual endpoints. The realization theorem already treats the mixed pin spaces through their projections and the injection hypothesis.

#thm([Lemma 13.2.])[
  (Dual relations).  #emph[Any obstruction to the scalar system has a nonzero vector of weights $\( s_1 \, s_2 \, r_1 \, r_2 \) in bb(F)_2^4$. On every edge span $V_(i j)$ these give a relation 
#[#set math.equation(numbering: n => "(13.5)")
 $ s_j \( p_(A \, i) + h_(A \, i) \) + r_i \( p_(B \, j) + h_(B \, j) \) = upright(bold(c))_(i j) dot.op upright(bold(x))_(A \, i) + upright(bold(c))'_(i j) dot.op upright(bold(x))_(B \, j) + beta_(i j) \( h_(A \, i) + h_(B \, j) \) + gamma_(i j) q $ <eq:status-dual-relation>]

 for suitable coefficients. The scalar system is soluble if, for every such relation, the sum of the right sides evaluated at the local targets is zero.]
] <lem:status-duality>

#proof[
  Apply finite-dimensional duality to the linear constraint map on $xor.big_(i \, j) V_(i j)$. The coefficients of the four coupled equations are $s_j \, r_i$, giving (13.5) separately on each edge. If they were all zero, the local projection onto $\( q \, h_(A \, i) + h_(B \, j) \, upright(bold(x))_(A \, i) \, upright(bold(x))_(B \, j) \)$ would be surjective by (13.2), forcing all other dual coefficients to vanish. Hence a nonzero obstruction uses some coupled equation. Conversely the constraint target lies in the image exactly when it annihilates every dual relation. The coupled targets are zero, so their evaluated contribution is the sum stated in the lemma. ◻
]

=== 13.2 Frequent dual relations give a common prediction <frequent-dual-relations-give-a-common-prediction>

Call a pair of arrays #emph[obstructable] if there are total exclusion sets of size at most $B_(*)$ at each endpoint, containing the mandatory exclusions, and some nonzero weights for which (13.5) holds throughout. We do not require the relation to take a nonzero value on a particular table target. This stronger event is useful because its complement works for every table.

A dual relation on one pair need not give a prediction common to many units. The next lemma shows that obstructable pairs of mass at least $.1$ would yield a common prediction on more than $10^(- 6)$ unit mass. The estimate covers all exclusions within the budget, so that labels may still be reserved when the final lists are chosen.

#thm([Lemma 13.3.])[
  (Extraction of a global prediction).  #emph[On the no-prediction alternative of 34, the probability that the iid base arrays are obstructable is less than $.1$.]
] <lem:status-global-prediction>

#proof[
  Suppose otherwise. Let $E_s$ be the event that a witnessing relation has some $s_j = 1$, and define $E_r$ similarly. Interchanging the two iid units interchanges these events, so they have the same probability. Their union is the obstructable event. Therefore $bb(P) \( E_s \) gt.eq .05$.
  Fix a witness with $s_j = 1$. For each first-side endpoint $i$, rewrite its edge relation as
  #[#set math.equation(numbering: n => "(13.6)")
   $ p_(A \, i) + upright(bold(c))_(i j) dot.op upright(bold(x))_(A \, i) + \( 1 + beta_(i j) \) h_(A \, i) =  & r_i p_(B \, j) + upright(bold(c))'_(i j) dot.op upright(bold(x))_(B \, j) + \( r_i + beta_(i j) \) h_(B \, j) + gamma_(i j) q . $ <eq:status-deterministic-comparison>]
  For any surviving label/flavor choices and any common feasible $\( l \, q \)$, this equality holds almost surely under the product of the two status distributions conditional on the same signature. Otherwise a violating pair of numerical statuses would have positive overlap and would be a generator violating the relation. The two bits in (13.6) are conditionally independent at a fixed signature. If two independent bits agree almost surely, both are constant almost surely with their common value: writing their success probabilities as $a \, b$, the mismatch probability $a \( 1 - b \) + \( 1 - a \) b$ is zero only for $\( a \, b \) = \( 0 \, 0 \)$ or $\( 1 \, 1 \)$.
  Compare all surviving first-side choices to one fixed generic surviving choice at $\( B \, j \)$. Its total conditional status mass is one on every signature space, and its generic flavor admits either $q$. It follows that, simultaneously over all tags, feasible bits, labels and flavors remaining at $\( A \, i \)$,
  #[#set math.equation(numbering: n => "(13.7)")
   $ p_(A \, i) = T \( lambda_(A \, i) \, upright("atom") \) + alpha_(A \, i) h_(A \, i) + f_i \( l \, q \, xi \) \, $ <eq:status-extracted-prediction>]
  where $lambda_(A \, i)$ is the basis combination specified by $upright(bold(c))_(i j)$ and $alpha_(A \, i) = 1 + beta_(i j)$. The coefficients are common to these choices. The offset is also common across them; one does not choose a new offset for every label or flavor.
  There are very few possible offsets after the second-side array is fixed. If $r_i = 0$, generic positivity of the role and basis at $\( B \, j \)$ forces $upright(bold(c))'_(i j) = 0$ and $beta_(i j) = 0$ in (13.6). The offset is then either zero or $q$. If $r_i = 1$, it is, up to a common multiple of $q$, the deterministic value of
  #[#set math.equation(numbering: n => "(13.8)")
   $ p_(B \, j) + upright(bold(c))' dot.op upright(bold(x))_(B \, j) + alpha' h_(B \, j) . $ <eq:status-opposite-offset>]
  For this fixed array and endpoint there is at most one possible deterministic expression (13.8), including its coefficients, even if the permitted exclusions vary. Indeed two candidate exclusion sets of size at most $B_(*)$ have a common surviving generic label, since the label universe is larger than $2 B_(*)$. At that label every role/basis assignment has positive density conditional on the signature. Subtracting the two claimed deterministic expressions therefore forces their coefficient differences to be zero, and then their offset functions agree almost everywhere on every $\( l \, q \)$ space. The same generic label can be used at every tag and diagonal bit.
  Thus, for a fixed second-side array, each choice of $j$ supplies at most four offsets for each first-side endpoint: the two multiples of $q$, and the unique function (13.8) plus those two multiples, if that function exists. Across both choices of $j$ there are at most $2 dot.op 4^2 = 32$ pairs $\( f_1 \, f_2 \)$.
  All events used here are measurable. There are finitely many types, status vectors, coefficients, and exclusion sets, and generator availability is a positivity test on the integral of jointly measurable densities. By Fubini, choose a fixed second-side array for which the first-side mass of $E_s$ exceeds $.04$. One of the at most 32 pairs of offset functions then gives (13.7) on first-side mass at least $delta_0 = .04 \/ 32$, allowing its coefficients and exclusion sets to vary with the first-side array. This is much larger than $10^(- 6)$.
  We now transfer these fixed signature functions to a prediction in the finite problem. This step is necessary because the definition of prediction asks for global functions of actual keys. For any $epsilon > 0$, approximate each fixed binary function $f_i$ by a binary cylinder function $f_i^(\( epsilon \))$, with disagreement measure at most $epsilon$ on each of the finitely many $\( l \, q \)$ reference spaces. Such approximation follows by approximating the measurable event where $f_i = 1$ in measure by the algebra of finite cylinders. The total unary measure of every type is its reference measure, so replacing $f_i$ increases every relation error in (13.7) by at most $epsilon$.
  For fixed cylinder functions and a fixed choice of coefficient bits and exclusions, all these error probabilities are finite linear combinations of status-cylinder coordinates. Their maximum over the remaining unary types is continuous. Minimizing over the finitely many permitted coefficient/exclusion choices is also continuous, separately on each discrete coordinate format. The strict event that this minimum is below $2 epsilon$ consequently has limiting probability at least $delta_0$. Weak convergence implies that its prelimit probability exceeds $delta_0 \/ 2$ for all sufficiently large indices. One may see this directly by approximating the indicator of an open strict-error event from below by continuous functions.
  Choose decreasing $epsilon_m arrow.r 0$ and increasing prelimit indices at which the last mass bound holds. At index $m$ use the two global functions obtained by evaluating $f_i^(\( epsilon_m \))$ on the actual global key signature. Keep the orientations in the strict-error event and choose one of their successful coefficient/exclusion records. The kept mass is at least $delta_0 \/ 2 > 10^(- 6)$, and the maximum relation error over all remaining unary types tends uniformly to zero. Conditional-on-$q$ errors give the same conclusion for the unconditioned flavor tests. These are precisely the requirements of 33. The no-prediction branch has only the first effective spaces and only negligible trimming, so this mass margin also gives a prediction before that trimming. This contradiction proves the lemma. ◻
]

=== 13.3 The predicted dual relations <the-predicted-dual-relations>

In the predicted alternatives, exclude the stored prediction exceptions as well as the mandatory support exclusions. Write the marked profiles as $lambda_(A \, i)$ and $lambda_(B \, i)$. The constants $alpha_i$ and the functions $f_i$ are common by endpoint index across units. Put $d_i = 1 + alpha_i$. The prepared class $e_i = \( d_i \, \[ f_i \] \)$ is as in (9.2): functions are first identified almost everywhere on all tag/bit signature spaces, and then quotiented by the span of the one function $q$, with a common coefficient on those spaces.

In a limiting table computation, use the notation

#[#set math.equation(numbering: n => "(13.9)")
 $ sans(u)_(B \, j) \( Delta_A \) = sum_(i = 1)^2 \( u_(B \, j) U_(A \, i) \)^(*) \( lambda_(A \, i) \) \, #h(2em) sans(u)_(A \, i) \( Delta_B \) = sum_(j = 1)^2 \( u_(A \, i) U_(B \, j) \)^(*) \( lambda_(B \, j) \) . $ <eq:status-table-delta>]

These are finite contractions in the recorded table coordinates. The notation does not require retaining an ambient tensor $Delta$ in the compactification.

#thm([Lemma 13.4.])[
  (Predicted scalar compatibility).  #emph[For a predicted pair with a table satisfying the compatibility conditions of 34, the system (13.3)–(13.4) is soluble. The assertion survives any further bounded label exclusions leaving generic labels.]
] <lem:status-predicted>

#proof[
  The exact limiting prediction is
  $ p_(A \, i) = bold(lambda)_(A \, i) dot.op upright(bold(x))_(A \, i) + alpha_i h_(A \, i) + f_i \, #h(2em) p_(B \, j) = bold(lambda)_(B \, j) dot.op upright(bold(x))_(B \, j) + alpha_j h_(B \, j) + f_j \, $
  where bold $bold(lambda)$ denotes coordinates in the effective basis. Substitute this into a dual relation (13.5). At a fixed signature the two generic status distributions have every pair of role/basis assignments available. Comparing their coefficients forces
  #[#set math.equation(numbering: n => "(13.10)")
   $ upright(bold(c))_(i j) & = s_j bold(lambda)_(A \, i) \, & upright(bold(c))'_(i j) & = r_i bold(lambda)_(B \, j) \, & beta_(i j) & = s_j d_i = r_i d_j \,\
s_j f_i + r_i f_j & = gamma_(i j) q . $ <eq:status-forced-coefficients>]
  Thus
  #[#set math.equation(numbering: n => "(13.11)")
   $ s_j e_i = r_i e_j #h(2em) \( i \, j in { 1 \, 2 } \) . $ <eq:status-class-equations>]
  Equality of functions here is exactly the almost-everywhere equality recorded in the prepared subsequential class.
  If both $e_i$ vanish, 35 supplies the exact identity $p_i = T \( lambda_i \, upright("atom") \) + h_i$ on all atoms. Hence on each span $p_i + h_i = bold(lambda)_i dot.op upright(bold(x))_i$. At the local targets, the first coupled sum for a fixed $j$ is
  $ sum_i a \( lambda_(A \, i) \) + sans(u)_(B \, j) \( Delta_A \) = c + sans(u)_(B \, j) \( Delta_A \) = 0 $
  by the empty-status compatibility condition. The reciprocal coupled sums vanish in the same way. Local surjectivity therefore solves all constraints in this case.
  Suppose that some $e_i$ is nonzero. A nonzero solution of (13.11) is possible only when all nonzero $e_i$ are equal, and then both weight vectors are the indicator of their support $S$. To check this without any assumption on the dimension of the function space, first consider a support with one index, say $e_1 eq.not 0 \, e_2 = 0$. The off-diagonal equations force $r_2 = s_2 = 0$, and the diagonal gives $s_1 = r_1 = 1$ for a nonzero solution. If both $e_i$ are nonzero, the diagonal equations give $s_i = r_i$. The off-diagonal equation $s_2 e_1 = s_1 e_2$ either makes both weights zero, or makes both one and $e_1 = e_2$. These cases exhaust the possibilities.
  If the two nonzero classes are unequal, no dual obstruction exists. Otherwise let $d$ be the common first bit on $S$. With $s_i = r_i = upright(bold(1))_(i in S)$, (13.10) is symmetric in $i \, j$. Its diagonal is zero. Since the function $q$ is not zero on the family of reference spaces, this gives $gamma_(i j) = gamma_(j i)$ and $gamma_(i i) = 0$. The sum of all four $q$-contributions to a target is therefore zero. The total role contribution is
  $ sum_(i \, j) beta_(i j) = \| S \| d quad upright("in ") bb(F)_2 . $
  Evaluate the basis terms in (13.10) at their local targets. The $a$-terms sum to $\| S \| c + \| S \| c = 0$, because 34 fixed the same value $c = sum_i a \( lambda_i \)$ in both units. The remaining terms are
  $ sum_(j in S) sans(u)_(B \, j) \( Delta_A \) + sum_(i in S) sans(u)_(A \, i) \( Delta_B \) . $
  By (9.3), this equals $\| S \| d$. Together with the role contribution it is zero. Thus every dual relation vanishes on the target, and 64 proves solvability. The argument used only surviving generic labels and the prediction on those labels, so additional exclusions of the indicated kind do not change it. ◻
]

#thm([Lemma 13.5.])[
  (Scalar solvability on positive mass).  #emph[In each positive-mass alternative of 34, the common experiment has positive mass of passed injecting tables for which the scalar system is soluble, robustly under the exclusions needed below. On the no-prediction branch this holds whenever the total exclusions stay within $B_(*)$ per endpoint. On a predicted branch it holds after the stored exceptions and any further bounded exclusions leaving generic labels.]
] <lem:status-span>

#proof[
  Without prediction, the probability of an obstructable base pair is less than $.1$ by 65. This statement uses the unflagged iid base law. In the full conditional-law experiment, a passed injecting table exists on mass at least $.99$ by 59. Their intersection therefore has mass greater than $.89$. On it no nonzero dual pattern exists for any exclusions within the stated budget, so 64 solves the scalar system for every such table. No independence of the two events is being assumed.
  With prediction, a passed compatible injecting table exists on positive mass in the same experiment. The exact prediction and all almost-sure unary properties continue to hold on that event, and 66 gives the assertion. ◻
]

=== 13.4 Stable spans and fresh short lists <stable-spans-and-fresh-short-lists>

It remains to replace a vector in an edge span by a short list of actual generators, using distinct labels across both lists at an endpoint. The base space may have large dimension, but every base vector has a single-generator lift at fresh generic labels. Only the discrepancy in the kernel must be corrected. Its dimension is at most two by (13.2); we will choose a kernel basis whose vectors each use at most three generators, giving the bound $1 + 3 + 3 = 7$.

#thm([Lemma 13.6.])[
  (Fresh lists of at most seven generators).  #emph[On each scalar-soluble pair from 67, further bounded exclusions can be made so that every scalar solution on the resulting four edge spans can be realized by between one and seven available generators per edge. The two endpoint labels of each generator are retained with its certificate, and all labels used at an endpoint are distinct across its two incident lists. Every realized matched position has positive status overlap.]
] <lem:fresh-lists>

#proof[
  Begin with the mandatory support exclusions and, in the predicted case, the stored exceptions. Whenever deleting at most 100 additional labels at each endpoint can shrink any of the four edge spans, make such a deletion. Each span continues to project onto its full base space. Its dimension exceeds that base dimension by at most two, so there are at most eight dimension-reducing steps in total. At the end, every edge span is unchanged by deleting up to 100 further labels at each endpoint. There remain generic labels, since (5.5) makes the label universe much larger than all these bounded exclusions. On the no-prediction branch the total budget, including later fresh-label removals, is at most $B_0 + 900 < B_(*)$. On a predicted branch it is at most the stored exceptions plus this quantity, still leaving many generic labels. Scalar solvability is retained by 67. Fix one solution on these stabilized spans.
  We prove a statement for one edge after any labels used on earlier edges have also been reserved. Write its stabilized span as $V$, its base space as $B$, and its projection as $pi$. Let $G_L$ be the generators avoiding the current reserved sets $L$. Their span is still $V$. Let $H_L$ be the span of sums of one, two, or three members of $G_L$ whose total base projection is zero and whose endpoint labels are mutually disjoint within that word. We claim
  #[#set math.equation(numbering: n => "(13.12)")
   $ H_L = ker pi . $ <eq:status-short-kernel>]
  To prove the claim, take two generator lifts of the same $b in B$. There is a third generic lift of $b$ at labels avoiding both of them and $L$. Comparing each original lift to this third one gives an allowed two-generator kernel word. Hence all lifts of $b$ have the same class modulo $H_L$. Call that class $ell \( b \)$. A generator above base zero is itself an allowed one-generator kernel word, so $ell \( 0 \) = 0$. Choose mutually label-disjoint generic lifts of $b \, c \, b + c$. Their sum is an allowed three-generator kernel word, and therefore $ell \( b \) + ell \( c \) = ell \( b + c \)$. The generators span $V$, so this additive lift identifies $V \/ H_L$ with $B$: the induced projection is inverse to $ell$. This proves (13.12), including the case of zero base projection.
  For the desired vector in $V$, first choose a generic singleton lift of its base projection. Reserve its labels. The remaining discrepancy belongs to $ker pi$, whose dimension is at most two. On the remaining labels (13.12) still holds because stability has preserved $V$. If the kernel is zero no correction is needed. If it is one-dimensional, choose a nonzero short kernel word and use it if needed. If it is two-dimensional, choose a nonzero short word, reserve its at most three labels at each end, and apply (13.12) again. The new short words still span the full kernel, so one lies outside the first word’s direction. These two words form a basis and the discrepancy is the sum of an appropriate subset of them. This uses at most $1 + 3 + 3 = 7$ generators. The initial lift is always retained, so the list is nonempty; reserving labels before each choice ensures disjointness even when two generators have the same numerical bit vector.
  Carry out this procedure on the four edges in turn. Each endpoint is incident to only two lists and uses at most fourteen labels in total. All removals and auxiliary freshness comparisons in the procedure are within the 100-label stability allowance. The generators keep their certificates of positive overlap, proving the lemma. ◻
]

=== 13.5 Positive overlap on every positive-mass prepared alternative <positive-overlap-on-every-positive-mass-prepared-alternative>

#thm([Proposition 13.7.])[
  (Positive-mass overlap).  #emph[For every positive-mass alternative of 34, some fixed numerical option has expected unnormalized successful-query overlap bounded below by a positive constant along a subsequence. Consequently it satisfies (7.3). This conclusion includes the prepared restrictions of reciprocal mass $2^(o \( N \))$ permitted there.]
] <prop:positive-overlap>

#proof[
  If the conclusion failed, finiteness of the option collection would give (12.3) along the sequence in question. Construct the common model of 59 and apply 62.
  By 67, there is positive model mass of a table with both flags passed and with a scalar solution surviving the needed exclusions. Apply 68. This gives between one and seven matched generators per edge with fresh allowed labels. Their sum vectors obey (13.3) and (13.4); equivalently, the lists obey all scalar recipe equations. At each generator the unspecified tester bits were only aggregated. Expanding the positive overlap integral as a finite sum over the two full tester summaries yields at least one pair of summaries for which the overlap is still positive. Make that refinement independently at each position.
  The scalar consistency argument in 6, in particular (6.3), now supplies a consistent numerical prescription of the required within-endpoint binary bits from these summaries and $p$ bits. Together with the already passed table, these data define a usable numerical option. The only parameter filters added are precisely the unary statuses and the prescribed binary conditions in (12.1). At every matched position the refined status overlap is positive. The full-density identification in 61, combined with the independent unary projections of the limiting reference law, expresses the limiting full-query overlap as $kappa_A kappa_B$ times the integral of the product of these matched overlaps against the two flagged orientation laws. Thus this usable option contradicts 62 on a positive-mass event.
  No pointwise uniform lower bound for these individual positive integrals is needed. The options form a finite collection and every product has finitely many nonnegative factors. A positive-mass event on which some such product is positive gives positive expectation for at least one option. Its lower bound is a constant on the chosen subsequence, however small that constant may be. The preceding contradiction therefore proves the stated subsequential lower bound.
  Finally the successful densities are unnormalized with respect to the retained law, and 26 explicitly charges any law restriction of reciprocal mass $2^(o \( N \))$. A positive constant, or its product with such restriction costs, is $2^(- o \( N \))$. The resulting four-hole probability has exponent at most $k_max + .03 + o \( 1 \)$, whereas
  $ 100 g - \( k_max + .03 \) = 44 g + 55.97 > 0 . $
  Thus these overlaps are on the scale required for 6. ◻
]

== 14 The inverse-polynomial option and completion of the proof <sec:rare-overlap>

In the remaining alternative of 34, compatible pairs of leaves have mass $Omega \( N^(- 4) \)$. We will prove an expected overlap lower bound of the same order. The compatible event can have zero mass in the common limit of 12, so we need exceptional-set estimates smaller than $N^(- 4)$.

The endpoint identities in this alternative are exact:

#[#set math.equation(numbering: n => "(14.1)")
 $ p_i = T \( lambda_i \, dot.op \) + a . $ <eq:rare-exact-prediction>]

The bit $c = a \( lambda_1 \) + a \( lambda_2 \)$ is common to the prepared law, and the old marked tensors and their evaluations on the fixed cover have been pinned. Compatibility is therefore determined by the two leaves before their orientations are sampled. We shall use the exact identities to choose one generic atom per cross edge, with no additional $p_i$-status filter.

First we prove a hit estimate for each prescribed large reference set, with a uniform superpolynomial bound on the exceptional orientation mass. This estimate uses the mixed-law bounds. The original prepared leaves’ histogram bounds then supply a finite family of large sets on each B-leaf. Choosing that family before the independent A-leaf is sampled lets us apply the hit estimate to all its members.

=== 14.1 Generic base queries <generic-base-queries>

In this Section a #emph[base query] is a successful-query format with at most four atom positions in one unit, with labels distinct at each endpoint. Every position uses the full generic flavor, a prescribed possible diagonal bit $q$, a feasible tester summary, and a prescribed assignment of the basis bits $T \( x \, dot.op \) \|_(C_i)$. It also imposes the reference off-position Gram zeros and a consistent numerical specification of the binary evaluations used in 25. There is no additional $p_i$-status restriction and, for now, no orientation-only filter.

The point inputs are independent, each normalized conditional on its prescribed $q$. For a unit orientation $omega$, write $Q_(omega \, frak(r))$ for the unnormalized measure of its accepted key tuples in format $frak(r)$. Its total mass is at most one. The reference space for its shape is $\( cal(K)_(frak(r) \, n) \, nu_(frak(r) \, n) \)$. The request is #emph[feasible] at $omega$ when its coordinate format, labels, summaries and assignments are allowed there. A basis of dimension smaller than $K^2$ may be padded by zero coordinates; feasibility then requires the corresponding requested bits to be zero. There are only finitely many numerical formats and requests, although their effective tensor bases can depend on the orientation and its leaf.

Let

#[#set math.equation(numbering: n => "(14.2)")
 $ beta = 2^(- K^2 - 1) 4^(- \( g^2 + 1 \)) . $ <eq:rare-base-beta>]

This is the uniform generic base-status fraction from 49; see (10.11). The constant applies to every feasible generic tester summary and basis assignment on each fixed common key cell of positive mass, independently of that cell’s mass.

Let $kappa_(frak(r)) > 0$ be the product-mixing constant of 47 for a consistent format, and take $kappa_min > 0$ to be the minimum over the finite collection in use. If necessary include the finitely many coordinate formats separately. Put $s_max = 4$.

#thm([Lemma 14.1.])[
  (Uniform large-set hit estimate).  #emph[Fix $delta > 0$, and consider a sequence of unit laws whose mixed joint densities are at most $2^(O \( N \))$ relative to $mu^2$, whose two marginals are at most $M 2^(o \( N \)) mu$, and whose marked effective spaces have the rank and dimension bounds of 49. The implied joint-density constant is uniform. Set 
#[#set math.equation(numbering: n => "(14.3)")
 $ c_(upright("hit")) \( delta \) = 1 / 4 thin kappa_min beta^(s_max) delta . $ <eq:rare-hit-threshold>]

 For every fixed $p > 0$, 
#[#set math.equation(numbering: n => "(14.4)")
 $ sup_(frak(r) \, W_n) bb(P) #h(-0.16667em) vec(frak(r) upright(" is feasible at ") omega \,, Q_(omega \, frak(r)) \( W_n \) < c_(upright("hit")) \( delta \)) = o \( n^(- p) \) \, $ <eq:rare-superpolynomial-tail>]

 where the supremum is over the finitely many numerical requests and deterministic measurable sets $W_n subset.eq cal(K)_(frak(r) \, n)$ satisfying $nu_(frak(r) \, n) \( W_n \) gt.eq delta$. Each choice of $W_n$ has its own exceptional orientations.]
] <lem:rare-large-set-hit>

#proof[
  Suppose the conclusion fails for some $p$. Along a subsequence there are deterministic sets $W_n$, requests $frak(r)$, and a fixed $c > 0$ for which the displayed bad event has probability at least $c n^(- p)$. By a finite subdivision, fix the numerical format and request along this subsequence. Restrict the unit law to this bad event and normalize it. The additional density factor is at most $c^(- 1) n^p$. Since $N = M_0 n$ with $M_0$ fixed, its logarithm is $O \( log n \) = o \( n \) = o \( N \)$. The restricted mixed law therefore still satisfies the hypotheses of Lemma 10.7, Theorem 11.1, and the uniform profile estimates in 49.
  We give the measure-identification argument for this restricted law. It uses no density bound on its individually normalized old leaves. On each single-key space choose countably many common bit tests, and on the tuple-key space choose countably many bit tests containing $upright(bold(1))_(W_n)$. Include the unary factors in weak product approximations to every tuple cylinder at accuracies tending to zero, their unary pullbacks, and the resulting finite Boolean combinations. This countable collection is obtained by successive closure. At every fixed stage its complexity is bounded independently of $n$.
  Pass to a subsequence on which the reference signature laws, the bounded coefficients in these approximations, and the laws of all empirical unary status arrays converge. The arrays have coordinates in $\[ 0 \, 1 \]$, indexed by finite cylinders and the finite status choices; hence this is ordinary compactness on a countable product of compact spaces. Write $Xi_j$ for the single-key signature space at position $j$, and $rho$ for the tuple-test reference law. By 42, the unary projections of $rho$ are independent with the respective laws on $Xi_j$. The limiting $W$-coordinate is a bit, and $rho \( W \) gt.eq delta$.
  Let $theta$ denote a limiting orientation status array. Its unfiltered unary measure equals the single-key reference measure on every cylinder, by 45. The requested unary base-status measure therefore has a density $h_j^theta$ relative to that reference measure. Versions can be chosen measurably by conditional averages on the increasing finite cylinder partitions. The simultaneous positive-fraction estimates on all fixed positive-reference-mass cylinders give
  #[#set math.equation(numbering: n => "(14.5)")
   $ beta lt.eq h_j^theta lt.eq 1 quad upright("almost everywhere, for almost every ") theta . $ <eq:rare-unary-density-lower>]
  Indeed these inequalities hold on the generating cylinder algebra and hence on its generated sigma-algebra by measure domination. All requests are feasible in the restricted law, so their limiting coordinate formats and summary assignments are feasible as well.
  Also pass to a limit of the unnormalized accepted tuple measures on the tuple-test cylinders. Denote it by $tau$. We claim that
  #[#set math.equation(numbering: n => "(14.6)")
   $ frac(d tau, d rho) = kappa_(frak(r)) thin bb(E)_theta product_(j = 1)^s h_j^theta \( xi_j \) \, #h(2em) s lt.eq s_max . $ <eq:rare-one-law-density>]
  Here $xi_j$ is the unary projection of the tuple signature. This is the one-law version of the density identification in 61; the details needed here are as follows.
  Fix a tuple cylinder and an accuracy $epsilon.alt > 0$. By 51, its prelimit indicator can be replaced on actual successful queries by a bounded finite sum of products of global unary key functions, with error at most $epsilon.alt$ outside a vanishing set of orientations. This comparison allows the requested unary status indicators as orientation-dependent unary weights. For each structured product, 47 gives its successful integral as $kappa_(frak(r))$ times the product of its separate unary status integrals, with vanishing error. Averaging over the restricted law preserves these errors: the relevant estimates use the mixed density and marginal bounds already checked.
  The unary integrals and finite numerical metadata are coordinates of the status arrays. Their finite products and averages therefore pass to the limit. Independence of the unary projections of $rho$ identifies the result with the structured test against the right side of (14.6). The reference part of 51 bounds the error of the same replacement against arbitrary products of unary functions bounded by one. Passing this assertion first for cylinder-simple functions and then by $L^1$ approximation permits the functions $h_j^theta$ themselves. After averaging $theta$, the discrepancy on the chosen cylinder is bounded by a constant multiple of $epsilon.alt$. Send $epsilon.alt$ to zero. A countable generating algebra of cylinders proves (14.6).
  In particular, the limiting mean of $Q_(omega \, frak(r)) \( W_n \)$ is
  $ tau \( W \) = kappa_(frak(r)) integral_W bb(E)_theta product_(j = 1)^s h_j^theta \( xi_j \) thin d rho gt.eq kappa_min beta^(s_max) delta . $
  But each restricted orientation had hit mass smaller than $c_(upright("hit")) \( delta \)$, contradicting (14.3). This proves (14.4). ◻
]

#prodef([Remark 14.2.])[
  A restriction of polynomial total mass need not preserve a uniform density cap for every separately normalized old leaf. 70 does not require that conclusion: its proof uses mixed-law typicality and weak product testing, not the per-leaf net lemma or the two-leaf covariance projection. The leaf estimates used next concern the original prepared leaves. Also, the proof of 49 may choose a larger fixed number of transformations for a smaller positive key cell. This changes an asymptotic onset and a constant prefactor, not $beta$, $J$, or $M_0$.
] <rem:rare-restriction-caps>

=== 14.2 A bounded family of large superlevel sets <a-bounded-family-of-large-superlevel-sets>

We record explicitly the elementary net consequence that determines the order of the remaining choices.

#thm([Lemma 14.3.])[
  (Superlevel sets from all-filter nets).  #emph[Consider the family of unnormalized successful base-query densities on a prepared leaf, allowing every orientation-only filter. Suppose a member $d$ has total mass at least $b_0 > 0$. Uniformly over the prepared leaves and the finite formats, there are constants $t \, delta_0 > 0$ such that, for every sufficiently small fixed $epsilon.alt > 0$, a bounded family of reference sets contains a set $W$ satisfying 
#[#set math.equation(numbering: n => "(14.7)")
 $ nu \( W \) gt.eq delta_0 \/ 2 \, #h(2em) nu { k in W : d \( k \) < t \/ 4 } lt.eq 4 epsilon.alt \/ t . $ <eq:rare-net-superlevel>]

 The family depends on the leaf, format, and $epsilon.alt$, but not on the orientation-only filter subsequently selected. The constants $t \, delta_0$ can be fixed before $epsilon.alt$.]
] <lem:rare-superlevel-nets>

#proof[
  Every such density is dominated by the corresponding unfiltered query density. Since $integral d thin d nu lt.eq 1$, its superlevel set ${ d > T }$ has reference measure at most $1 \/ T$. The uniform small-set conclusion of 39 therefore makes the integral on this set uniformly small as $T$ increases. Choose a fixed $T$ so large that $integral_({ d > T }) d thin d nu < b_0 \/ 4$ for every density in question and all sufficiently large $n$. Put
  $ t = b_0 \/ 4 \, #h(2em) delta_0 = b_0 \/ \( 2 T \) . $
  The region $t lt.eq d lt.eq T$ carries integral at least $b_0 \/ 2$, so its reference measure is at least $delta_0$.
  Take an $L^1 \( nu \)$ $epsilon.alt$-net for the entire family of orientation-filtered densities, as supplied by 39. If $f_j$ approximates $d$, set $W_j = { f_j gt.eq t \/ 2 }$. At most $2 epsilon.alt \/ t$ of the region $d gt.eq t$ lies outside $W_j$. Consequently $nu \( W_j \) gt.eq delta_0 \/ 2$ when $epsilon.alt lt.eq delta_0 t \/ 4$. On $W_j ∩ { d < t \/ 4 }$ one has $\| f_j - d \| gt.eq t \/ 4$, so that set has measure at most $4 epsilon.alt \/ t$. The sets $W_j$ for all net representatives form the required family. ◻
]

=== 14.3 Overlap on the compatible leaf pairs <overlap-on-the-compatible-leaf-pairs>

#thm([Proposition 14.4.])[
  #emph[In the inverse-polynomial alternative of 34, the overlap criterion (7.3) holds with a lower bound $Omega \( N^(- 4) \)$, along the prepared sequence.]
] <prop:rare-overlap>

#proof[
  Write $pi_n$ for the prepared leaf distribution and $sigma_ell$ for the conditional orientation law on a leaf. Two leaves are initially independent. The preparation supplies a set $cal(C)_n$ of compatible leaf pairs with
  $ \( pi_n ⊗ pi_n \) \( cal(C)_n \) gt.eq c_0 N^(- 4) $
  for some fixed $c_0 > 0$. For every pair in this set, choose an injecting compatible small table whose two separate admissibility filters have orientation masses at least $a_0 > 0$. All choices are from finite numerical table and coordinate formats; the constants $c_0 \, a_0$ do not depend on $n$.
  Choose one generic atom for each cross edge, at a common fixed tag, with diagonal bit $q = 1$. At each endpoint choose two distinct allowed labels. Use role zero on the first unit and role one on the second. Feasible summaries exist: on the first side take all ordinary-block tester bits zero and the shared tester bit one; on the second side take one allowed ordinary-block tester bit one, all the other such bits zero, and the shared tester bit zero. Prescribe the basis values at endpoint $i$, facing endpoint $z$, to be
  $ T \( x_(i z) \, dot.op \) \|_(C_i) = \( a + \( u_z U_i \)^(*) \) \|_(C_i) . $
  Here the star denotes the contraction computed with the chosen table. By (14.1),
  $ \( p_i + a \) \( x_(i z) \) = T \( lambda_i \, x_(i z) \) = a \( lambda_i \) + \( u_z U_i \)^(*) \( lambda_i \) . $
  Summing over the two endpoints $i$ gives $c + u_z \( Delta_A \) = 0$, by the pinned compatibility. The same calculation applies with the two units interchanged. Thus the coupled conditions in (6.2) hold, as do its diagonal and role conditions. Choose the binary prescriptions given by 24. These are base queries: the recorded old marks and prescribed basis values already determine the $p_i$-values, so no additional $p_i$-filter is imposed. By 25, equal accepted keys therefore satisfy the hypotheses of 26.
  At all but an exponentially small proportion of orientations, Lemma 10.9, Lemma 10.11 give a fixed positive lower bound for the total successful mass of every feasible numerical base request. There are finitely many requests. Markov’s inequality over conditional leaf probabilities shows that, outside an exponentially small set of second-side leaves, every admissibility filter of mass at least $a_0$ retains total successful query mass at least a fixed $b_0 > 0$. For example, first make the conditional fraction of exceptional orientations at most $a_0 \/ 2$; the fixed success lower bound times $a_0 \/ 2$ then gives $b_0$. Removing these leaves loses $o \( N^(- 4) \)$ leaf-pair mass even before compatibility is imposed.
  Apply 72 on each remaining B-leaf and each numerical base format. Fix its uniform constants $t \, delta_0$, and put
  $ delta = delta_0 \/ 2 \, #h(2em) c_(upright("hit")) = c_(upright("hit")) \( delta \) \, #h(2em) A_0 = \( a_0 \/ 2 \) c_(upright("hit")) > 0 . $
  Use uniform per-leaf small-set control to choose $eta > 0$ such that every reference set of measure at most $eta$ has A-query mass less than $A_0 \/ 2$, for all sufficiently large $n$. This applies also to a filtered query, which is dominated by the unfiltered one. Now fix a net accuracy satisfying
  $ epsilon.alt lt.eq min { delta_0 t \/ 4 \, eta t \/ 4 } . $
  For each B-leaf and numerical base format, take the family of sets $W_(ell_B \, r \, j)$ supplied at this accuracy, and let $L$ be a uniform bound on its cardinality. The constants through $L$ are independent of $n$, although the sets themselves may vary with $n$ and the B-leaf. Each family was formed over all orientation-only filters. For a compatible pair, its filtered B-density $d_B$ has mass at least $b_0$, so choose a member $W$ satisfying (14.7) for that density. Although the table and filter may depend on $ell_A$, that dependence only selects a member of the already fixed B-leaf family.
  We now quantify the first-side exceptional pairs. Let $C$ bound the number of numerical request and shape choices. Discard family members of reference measure below $delta$; the selected member is not discarded. Let $e_n$ denote the supremum bad probability in (14.4), over the remaining sets and all relevant requests. For a fixed B-leaf every such set is deterministic for an independent A-orientation. A union bound and then independence of the original leaves give
  #[#set math.equation(numbering: n => "(14.8)")
   $ bb(E)_(ell_A \, ell_B) bb(P)_(omega_A divides ell_A) #scale(x: 120%, y: 120%)[\(] upright("some relevant ") W_(ell_B \, r \, j) upright(" fails its feasible hit bound") #scale(x: 120%, y: 120%)[\)] lt.eq C L e_n . $ <eq:rare-independent-net-error>]
  Hence the leaf pairs on which the inner probability exceeds $a_0 \/ 2$ have mass at most $2 C L e_n \/ a_0 = o \( N^(- 4) \)$, by 70. On any other compatible pair, at least $a_0 \/ 2$ of the A-orientations pass the admissibility filter and all relevant hit bounds. For its selected $W$ and unnormalized density $d_A$, this gives
  #[#set math.equation(numbering: n => "(14.9)")
   $ integral_W d_A thin d nu gt.eq A_0 . $ <eq:rare-a-hit>]
  Together with the exceptional B-leaves, the discarded leaf pairs consume $o \( N^(- 4) \)$ mass.
  On a remaining compatible pair let $H = { k in W : d_B \( k \) < t \/ 4 }$. Then $nu \( H \) lt.eq eta$, and (14.9) yields
  $ integral d_A d_B thin d nu gt.eq t / 4 (integral_W d_A thin d nu - integral_H d_A thin d nu) gt.eq frac(t A_0, 8) . $
  There remain at least $\( c_0 \/ 2 \) N^(- 4)$ compatible pairs for large $n$. Consequently
  #[#set math.equation(numbering: n => "(14.10)")
   $ bb(E)_(ell_A \, ell_B) integral d_A d_B thin d nu gt.eq frac(c_0 t A_0, 16) N^(- 4) . $ <eq:rare-overlap-bound>]
  Tables and numerical requests may be chosen separately for each leaf pair, as allowed in 26; alternatively one may sum over their finitely many options. This proves the overlap criterion. ◻
]

=== 14.4 Completion <completion>

#proof[
  Fix the construction constants and, for every sufficiently large $n$, fix mixers satisfying 21, before choosing a unit law. Suppose there is no common sufficiently-large-$n$ bound as asserted. Then along an increasing sequence of $n$’s there are admissible unit laws $sigma_n$ whose probability of four cross holes is smaller than $2^(- 100 g N)$. Apply Lemma 4.5, Proposition 9.2, taking subsequences where needed. All retained laws have relative mass $2^(- o \( N \))$, and their final leaves satisfy the required image bounds.
  Every alternative with positive limiting mass of injecting compatible tables gives the overlap criterion by 69. The remaining inverse-polynomial alternative gives it by 73. In both cases 26, including the cost of returning to the original laws, gives four-hole probability at least
  $ 2^(- \( k_max + .03 \) N - o \( N \)) . $
  But
  $ 100 g - k_max - .03 = 100 g - 56 \( g - 1 \) - .03 = 44 g + 55.97 > 0 . $
  The displayed lower bound is therefore larger than $2^(- 100 g N)$ for large $n$, a contradiction. Since a failure of uniformity over admissible laws produced precisely such a sequence, the resulting sufficiently-large-$n$ statement is uniform over those laws. ◻
]

#proof[
  Apply 9 to 6. For every sufficiently large admissible $n$, there is a graph on $m = 2^(C_0 g N)$ sampled positions with independence number at most two and with $"cm" \( G \) < m \/ 100$. Since all constants, including $M_0$, are fixed and $N = M_0 n$ tends to infinity, these orders are arbitrarily large. ◻
]

== 15 Parameters, ranks, and probability scales <sec:parameters>

This Appendix checks that the construction parameters can be chosen in the required order and that the resulting bounds suffice at every probability scale. All construction constants are fixed independently of $n$ and of the unit law. These constants may be very large. The mixer matrices are then chosen separately at each sufficiently large $n$, by 21, before the unit law is selected.

=== 15.1 The acyclic order of construction <the-acyclic-order-of-construction>

The construction constants and first pin budget from (2.3) and (4.4) are

#[#set math.equation(numbering: n => "(15.1)")
 $ C_0 & = 1000 \, & g & = 10^9 + 1 \, & D & = 4 C_0 g \, & M & = 2^1000 \,\
k_max & = 56 \( g - 1 \) \, & zeta & = frac(1, 1000 k_max) \, & K_1 & = ⌈frac(4 \( D + 1 \), zeta)⌉ . $ <eq:ledger-early>]

In particular $g$ is odd and $D = 4000 g$. The early law and repinning budgets are

#[#set math.equation(numbering: n => "(15.2)")
 $ r & = 2 K_1 + 2 \, & L_0 & = ceil.l 100 \( D + 10 \) ceil.r \, & d_0 & = 4 r L_0 \,\
u_0 & = 10 \( K_1 + d_0 + 1 \) \, & K & in bb(N) \, #h(2em) K gt.eq frac(10 \( D + K_1 + u_0 + 10 \), zeta) . $ <eq:ledger-law>]

These are the bounds in (4.5); the construction takes $K$ to be the least integer meeting the displayed lower bound.

The remaining early tolerances in Theorem 8.2, Lemma 8.4 include

#[#set math.equation(numbering: n => "(15.3)")
 $ c_s = 10^(- 12) \( 1 + r \)^(- 4) \, #h(2em) q_0 = 2^(- 100 r - 10) \, #h(2em) delta_(upright("cov")) = .0005 . $ <eq:ledger-cover-tolerances>]

For each $n$, the moment order is the largest power of two $s lt.eq c_s N$; it is even for sufficiently large $n$, and $s gt.eq c_s N \/ 2$. Choose $p_0 > 0$ sufficiently small in terms of $r \, D \, c_s \, q_0$ and the fixed phase tolerance. Fix the transpose-injection error thresholds as well, with their total over all component and endpoint roles below the required constant error, such as $.001$. These thresholds precede selector and channel sizes.

The exponential demands of the no-cover argument are simultaneously satisfiable in this order. Fix a phase-test threshold $theta.alt > 0$ smaller than the required fixed phase accuracy, and choose a constant $Gamma > D + 2 r + 1$ large enough to absorb the indicated density and bounded-rank tensor counts. With $L_theta.alt = log_2 \( 1 \/ theta.alt \)$, it suffices to arrange

#[#set math.equation(numbering: n => "(15.4)")
 $ c_s / 2 (q_0 / 2 log_2 \( 1 \/ p_0 \) - 2 - L_theta.alt) & > Gamma \,\
c_s / 2 (frac(h q_0, 4) - L_theta.alt) & > Gamma . $ <eq:ledger-p0-demand>]

The first determines a sufficiently small $p_0$ using only early quantities; the second is a later lower bound on $h$. Indeed the two moment terms are $2^(2 s) p_0^(q_0 s \/ 2)$ and $2^(- h q_0 s \/ 4)$, and Markov at threshold $theta.alt$ costs $2^(s L_theta.alt)$. The comparison between raw and independent channel laws has a factor depending on $h$, but it is constant in $n$ and does not alter the linear exponents.

Next choose the row and selector parameters:

#[#set math.equation(numbering: n => "(15.5)")
 $ R_(*) & = 2 \( K + 20 \) \, & j_(*) & gt.eq 10 \( K + 1 \) \( R_(*) + 20 \) \,\
B_0 & = 2 \| cal(E) \| K \( R_(*) + 14 \) \, & B_(*) & = 10 \( B_0 + 10000 g + 1 \) \,\
2^(b - 2 j_(*)) & > 100 g \( B_(*) + 1 \) \, & p_(*) & = sum_(j = 0)^(j_(*)) binom(b, j) \,\
A & = 10 \( K + 1 \) p_(*) \( g^2 + 5 \) \, & s_0 & = 4 ceil.l A ceil.r \, #h(2em) J > 100 \( s_0 + K^2 + 1 \) . $ <eq:ledger-selectors>]

Integer inequalities are met by rounding upward when needed. This agrees with Lemma 5.2, Lemma 5.5. In particular $j_(*)$ exceeds the interpolation degree required for $\( K + 1 \) \( R_(*) + 14 \)$ labels. The length $b$ is chosen before $A$, and hence before $s_0 \, J$.

Now choose a sufficiently large integer $r_0$, always setting

#[#set math.equation(numbering: n => "(15.6)")
 $ h = 1000 r_0 . $ <eq:ledger-channels>]

The demands are finite in number and depend only on preceding constants:

+ the moment demand (15.4);
+ fixed-cover and fresh-probe transpose-injection errors in 28;
+ the accepting-set family estimate in 30;
+ residual ranks and private-channel space in 25;
+ the tester rank inequality in 37.

Each is eventually satisfied by increasing $r_0$. Quantitative checks appear below.

Finally choose a sufficiently large integer $M_0$, and put

#[#set math.equation(numbering: n => "(15.7)")
 $ N = M_0 n \, #h(2em) m = 2^(C_0 g N) . $ <eq:ledger-final-dimensions>]

The coefficient of every $O \( n \)$ count paid as a fraction of $N$ has then been fixed. Choose $M_0$ to make all those fractions smaller than their prescribed slacks. Only afterward does $n$ tend to infinity through integers with $n gt.eq 2 r_0$. The resulting dependency order is

$ \( C_0 \, g \, D \, M \, k_max \, zeta \, K_1 \) arrow.r \( r \, L_0 \, d_0 \, u_0 \, K \, upright("early tolerances") \, p_0 \)\
arrow.r \( R_(*) \, j_(*) \, B_0 \, B_(*) \, b \, p_(*) \, A \, s_0 \, J \) arrow.r \( r_0 \, h \) arrow.r M_0 arrow.r n . $

=== 15.2 The channel demands precede later tests <the-channel-demands-precede-later-tests>

In the frequent-output argument, a fixed collection of $L_0$ fresh probes succeeds on B-mass at least

#[#set math.equation(numbering: n => "(15.8)")
 $ q_(*) = \( delta_(upright("cov")) \/ 2 \) \( delta_(upright("cov")) \/ 4 \)^(L_0) > 0 . $ <eq:ledger-probe-mass>]

The one-vertex density factor depends only on the early marked-law restrictions and $p_0$. Transpose-injection failure on the fixed fresh vectors is at most that factor times $O \( L_0 \) 2^(L_0 - h)$. It can be made smaller than $q_(*) \/ 2$ by increasing $h$, without consulting a selector choice or a future common test. The later raw-event exponent is at most

$ - \( .99 - .51 \) L_0 N + D N + upright("small linear errors") . $

The specified $L_0$ leaves a margin close to $\( .48 L_0 - D \) N$. The small coefficient-count errors are paid by $M_0$.

For 30, one may use accepting-set log-size

#[#set math.equation(numbering: n => "(15.9)")
 $ C_s N \, #h(2em) C_s = 100 \( r + d_0 + 1 \) . $ <eq:ledger-accepting-family>]

The family is encoded by rank-bounded $Delta$’s and channel functionals on a cover tensor space of dimension at most $d_0 N$. There is no $h$ multiplier in its $N$-coefficient. Let $c > 0$ be the fixed per-probe success lower bound after the early failure tolerances are fixed. With $ell = floor.l N \/ \( 10 \( K + 1 \) \) floor.r$, the comparison is

$ c^ell quad upright("against") quad 2^(- \( h - 2 K \) ell + o \( N \)) 2^(C_s N) . $

For example it suffices that

#[#set math.equation(numbering: n => "(15.10)")
 $ h > 2 K + log_2 \( 1 \/ c \) + 10 \( K + 1 \) \( C_s + 2 \) . $ <eq:ledger-injection-demand>]

The floor changes only a bounded factor. Every quantity on the right was fixed before $h$.

For channel realization, the explicit bounds in (6.5), (6.10), (6.11), (6.12) are

$ B_(upright("lin")) & = 3 K + 28 \, & R_(upright("res")) & = 14 K + 140 \,\
D_(upright("blk")) & = 2 p_(*) \| cal(E) \| \( K + 14 + R_(upright("res")) \) \, & D_(upright("quo")) & = 2 p_(*) #scale(x: 120%, y: 120%)[\(] 1 + \( g^2 + 3 \) D_(upright("blk")) #scale(x: 120%, y: 120%)[\)] + 2 K . $

The pure correction rank per component is at most $30 r_0 + 28 J \| cal(E) \| + D_(upright("quo"))$, and the remaining channel pairing has rank at least $h - 2 K - 4 B_(upright("lin"))$. Thus (6.14) asks precisely for

#[#set math.equation(numbering: n => "(15.11)")
 $ 970 r_0 > 28 J \| cal(E) \| + D_(upright("quo")) + 2 K + 4 B_(upright("lin")) . $ <eq:ledger-realization-demand>]

Every quantity on the right is independent of $h \, r_0 \, n$ and is fixed by parameters through $J$. The baseline first factors through bounded pin/key projections on primal inputs, then derivative corrections of bounded rank are chosen, and the small residual is compressed before the $r_0$-sized pure terms are factored through private channels.

The tester inequality in 37 is

#[#set math.equation(numbering: n => "(15.12)")
 $ frac(g - 1, 2) (g - frac(4 D, g)) r_0 > 2 \( g - 1 \) \( h + 2 J K_1 \) + 1 . $ <eq:ledger-pure-tester-demand>]

Substituting $D = 4000 g$ and $h = 1000 r_0$ gives

$ frac(g - 20000, 2) thin r_0 > 4 J K_1 + frac(1, g - 1) . $

The coefficient on the left is positive for the specified $g$. This is therefore another compatible lower bound on $r_0$.

=== 15.3 Pin, atom, and tensor-rank ledger <pin-atom-and-tensor-rank-ledger>

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Bound and role
]),
  table.cell(rowspan: 1, colspan: 1)[First pin dimension
], table.cell(rowspan: 1, colspan: 1)[$K_1$, summed over components and signs.
],
  table.cell(rowspan: 1, colspan: 1)[Added exact support pins
], table.cell(rowspan: 1, colspan: 1)[At most $4 K_1$, for both old marked tensors in a unit.
],
  table.cell(rowspan: 1, colspan: 1)[Added cover-evaluation pins
], table.cell(rowspan: 1, colspan: 1)[At most $2 d_0$, for both endpoints’ channel products on cover bases.
],
  table.cell(rowspan: 1, colspan: 1)[Total added rank
], table.cell(rowspan: 1, colspan: 1)[$4 K_1 + 2 d_0 < u_0$.
],
  table.cell(rowspan: 1, colspan: 1)[Final pin dimension
], table.cell(rowspan: 1, colspan: 1)[At most $K$; the second peeling is needed only in case (iii) of 34.
],
  table.cell(rowspan: 1, colspan: 1)[Effective space
], table.cell(rowspan: 1, colspan: 1)[$dim C_i lt.eq K^2$; every member has total component rank at most $K$.
],
  table.cell(rowspan: 1, colspan: 1)[Selected atoms at one endpoint
], table.cell(rowspan: 1, colspan: 1)[At most $14$, across its two lists.
],
  table.cell(rowspan: 1, colspan: 1)[Component rank in the annihilator argument
], table.cell(rowspan: 1, colspan: 1)[$2 \( K + 14 \) lt.eq R_(*) = 2 \( K + 20 \)$.
],
  table.cell(rowspan: 1, colspan: 1)[List length per cross edge
], table.cell(rowspan: 1, colspan: 1)[At most $7$ on either side.
],
  table.cell(rowspan: 1, colspan: 1)[Atom positions in one unit’s full query
], table.cell(rowspan: 1, colspan: 1)[At most $4 dot.op 7 = 28$.
],
  table.cell(rowspan: 1, colspan: 1)[General key-vector slots
], table.cell(rowspan: 1, colspan: 1)[$28 dot.op 2 \( g - 1 \) = k_max = 56 \( g - 1 \)$.
],
  table.cell(rowspan: 1, colspan: 1)[Rare-query key-vector slots
], table.cell(rowspan: 1, colspan: 1)[$4 dot.op 2 \( g - 1 \) = 8 \( g - 1 \)$.
],
)
]

Each tag atom occupies $g - 1$ star components and supplies one plus and one minus vector at each. These are vector counts, not scalar Gram counts. The label exclusions in 19 give nominal independence modulo the pins, as proved in 24, part (ii). The effective-space dimension is counted in projected pin bases: for a fixed endpoint $sum_e dim S_(i \, e)^plus.minus lt.eq K$, so

$ sum_e dim \( S_(i \, e)^(+) ⊗ S_(i \, e)^(-) \) lt.eq (sum_e dim S_(i \, e)^(+)) (sum_e dim S_(i \, e)^(-)) lt.eq K^2 . $

Thus an effective tensor basis is encoded in bounded projected coordinates, not as unrestricted matrices with $O \( n^2 \)$ entries.

The unprojected representation of one gradient in 25 has per-component rank at most

$ 15 r_0 + 14 J \| cal(E) \| . $

Two endpoint contributions give $30 r_0 + O \( 1 \)$. If $A_(+) \, A_(-)$ remove bounded pin/key subspaces, then

$ "rank" \( M - A_(+)^(sans(T)) M A_(-) \) lt.eq "rank" \( I - A_(+) \) + "rank" \( I - A_(-) \) . $

Hence this projection contributes only bounded residual rank, without multiplying the tester rank by a pin-dependent constant. The later blockwise compression and derivative corrections preserve that independence from $r_0$.

=== 15.4 Scalar records and the final dimension multiplier <scalar-records-and-the-final-dimension-multiplier>

Write

#[#set math.equation(numbering: n => "(15.13)")
 $ d_n = dim cal(B) = p_(*) #scale(x: 120%, y: 120%)[\(] 1 + \( g^2 + 3 \) n #scale(x: 120%, y: 120%)[\)] . $ <eq:ledger-column-dimension>]

Then

$ d_n / N = frac(p_(*) \( g^2 + 3 \), M_0) + frac(p_(*), M_0 n) . $

This ratio, and the ratio after adding the bounded channel dimension, can be made arbitrarily small by choosing $M_0$ last. In particular the image estimate can use a fixed sufficiently small $epsilon < zeta \/ 4$. The same choice leaves room for the injective frames and prescribed self-Gram values.

The collision records are linear in $n$. There are at most $56$ point inputs across two units, costing at most

$ 56 \( g^2 + 3 \) n + 56 b $

bits. A list of $K$ nominal pin directions uses at most $2 K \( d_n + h \)$ coefficient bits, plus bounded component, sign and rank indices. Once pin projections are fixed, a basis of $C_i$ uses at most $K^4$ binary coefficients in its tensor-coordinate space; there are four endpoints. Tester summaries, numerical small tables, projection relationships and finite statuses have bounded lengths in $n$. The construction matrices $E \, L \, R$ are fixed data and are not encoded afresh in each query record.

The total frozen dimension of a unit is at most $K + k_max$, over all components and signs. There are $2 \( d_n + h \)$ nominal columns of a given sign at each component. Recording all interactions of both units’ columns with opposite frozen images therefore uses at most

$ 4 \( d_n + h \) \( K + k_max \) $

scalar bits. The deterministic solution is selected from these data and the point parameters. No unrestricted $O \( n^2 \)$-entry matrix is appended. The number of record cells, including bounded nominal choices when needed, is consequently at most

#[#set math.equation(numbering: n => "(15.14)")
 $ 2^(C_(upright("rec")) n + C_(upright("rec") \, 0)) \, $ <eq:ledger-record-count>]

for constants fixed before $M_0$.

Only mixed primal-channel Gram entries are tested in the final target. For one cross Gram block and component, the two endpoint primal summands have total dimension $2 d_n$ and the channel summands have total dimension $2 h$ on either side. The two mixed products contain at most $8 d_n h$ entries. There are two cross Gram blocks; hence at most

#[#set math.equation(numbering: n => "(15.15)")
 $ 16 \| cal(E) \| thin h thin d_n $ <eq:ledger-tested-gram-bits>]

bits are tested. Frozen or redundant entries only reduce this count. This is $O \( n \)$, with coefficient already fixed.

Choose $M_0$ to meet every earlier coefficient/codimension slack and, in particular, so that for sufficiently large $n$,

#[#set math.equation(numbering: n => "(15.16)")
 $ log_2 \( upright("record-cell count") \) < .005 N \, #h(2em) upright("tested scalar Gram bits") < .01 N . $ <eq:ledger-collision-bit-slacks>]

The smaller image and pin-count slacks form a finite collection and can be met by the same final enlargement of $M_0$.

The remaining collision estimates are those of 26. In particular, (7.8) gives the following conditional point-mass bound on a surviving cell:

$ log_2 p_max \/ N & lt.eq - \( 1 - 2 zeta \) \( k + t \) + \( k + .01 \)\
 & = - \( 1 - 2 zeta \) t + .01 + 2 zeta k lt.eq - .95 t #h(2em) \( t gt.eq 1 \, med k lt.eq k_max \) . $

Here $2 zeta k lt.eq .002$. The quotient-character estimate (7.9) bounds the absolute mean of a rank-$t$ character by

$ 2^(t N \/ 2) #scale(x: 120%, y: 120%)[\(] 2^(- .95 t N) 2^(- .95 t N) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) = 2^(- .45 t N) . $

This pays for fewer than $.01 N$ scalar bits, leaving agreement probability at least $2^(- .02 N)$. The overlap loss in (7.7), with the record count made explicit, is at most

$ 2 \| cal(K)_n \| thin 2^(C_(upright("rec")) n + C_(upright("rec") \, 0)) 2^(- \( k + .01 \) N) \, $

which is exponentially small since $\| cal(K)_n \| lt.eq 2^(k N)$ and (15.16) holds. As in that proof, this bound is obtained at each fixed parameter pair and then averaged.

=== 15.5 Probability scales and later analytic choices <sec:probability-scales>

The mixed law retains marginal control, whereas a normalized leaf is required to satisfy a joint cap and the exact-image bounds. Since $M_0$ is fixed, $o \( N \) = o \( n \)$ in all the comparisons below.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Mechanism
], table.cell(rowspan: 1, colspan: 1)[Scale and permissible cost
]),
  table.cell(rowspan: 1, colspan: 1)[Original unit law
], table.cell(rowspan: 1, colspan: 1)[Joint cap $2^(D N) mu^2$; both marginals at most $M mu$.
],
  table.cell(rowspan: 1, colspan: 1)[Prepared mixed law
], table.cell(rowspan: 1, colspan: 1)[Joint cap $2^(\( D + o \( 1 \) \) N) mu^2$, marginals at most $M 2^(o \( N \)) mu$; restriction mass $2^(- o \( N \))$.
],
  table.cell(rowspan: 1, colspan: 1)[Prepared normalized leaves
], table.cell(rowspan: 1, colspan: 1)[Uniform joint cap $2^(C_(upright("leaf")) N) mu^2$ and the fresh-image bound with $2 zeta$ slack.
],
  table.cell(rowspan: 1, colspan: 1)[Fixed-cost early restrictions
], table.cell(rowspan: 1, colspan: 1)[Negative logarithmic mass cost $O \( 1 \)$, absorbed by fixed linear exponent margins.
],
  table.cell(rowspan: 1, colspan: 1)[Polynomial bad-law restriction
], table.cell(rowspan: 1, colspan: 1)[$n^p = 2^(o \( n \)) = 2^(o \( N \))$ for fixed $p$; mixed caps survive, but old separate leaf caps need not.
],
  table.cell(rowspan: 1, colspan: 1)[Single-endpoint typicality
], table.cell(rowspan: 1, colspan: 1)[Error $2^(- Omega \( n \))$, surviving $2^(o \( n \))$ marginal inflation.
],
  table.cell(rowspan: 1, colspan: 1)[Paired oversampling and cross-rank failures
], table.cell(rowspan: 1, colspan: 1)[Error $2^(- Omega \( n^2 \))$, surviving $2^(O \( N \)) = 2^(O \( n \))$ joint inflation.
],
  table.cell(rowspan: 1, colspan: 1)[Tiny-cover compatible pairs
], table.cell(rowspan: 1, colspan: 1)[Mass $Omega \( N^(- 4) \)$, with exponential singleton-character and peeling errors.
],
  table.cell(rowspan: 1, colspan: 1)[Large-set hit exceptions
], table.cell(rowspan: 1, colspan: 1)[$o \( n^(- p) \)$ for every fixed $p$, uniform over deterministic large key sets and finite requests.
],
  table.cell(rowspan: 1, colspan: 1)[Independent B-leaf net use
], table.cell(rowspan: 1, colspan: 1)[Exception at most $2 C L e_n \/ a_0 = o \( N^(- 4) \)$, with $C \, L \, a_0^(- 1)$ fixed.
],
  table.cell(rowspan: 1, colspan: 1)[Key equality
], table.cell(rowspan: 1, colspan: 1)[Factor $\| cal(K)_n \|^(- 1) gt.eq 2^(- k N)$, $k lt.eq k_max$.
],
  table.cell(rowspan: 1, colspan: 1)[Final four-hole probability
], table.cell(rowspan: 1, colspan: 1)[$2^(- \( k_max + .03 \) N - o \( N \))$, exceeding $2^(- 100 g N)$ for large $n$.
],
)
]

The polynomial compatibility scale is explicit. The cover tensor space has dimension at most $d_0 N$, so $"rank" \( 1 + F \) lt.eq R_N := 1 + d_0 N$. An incompatible clique has size at most $R_N^2$. Sampling $R_N^2 + 1$ times and union bounding compatible pairs gives probability at least $binom(R_N^2 + 1, 2)^(- 1)$. The four requested phase bits retain one quarter of this contribution, up to exponentially small error. A fixed fourth power therefore suffices; no exponent depending on $n$ is concealed in the term #emph[inverse-polynomial].

Subexponential restrictions are compatible with leaf trimming. If retained total mass is $q_n = 2^(- o \( N \))$, leaves whose surviving fraction is below $2^(- zeta N)$ contribute at most

$ 2^(- zeta N) \/ q_n = 2^(- \( zeta - o \( 1 \) \) N) $

of the retained law, negligible compared with $N^(- 4)$. The second-peeling threshold also loses exponentially little: there are at most $2^(u_0 N)$ image choices and $2^(O \( n \))$ other choices, while each discarded part has relative mass below $2^(- \( u_0 + 1 \) N)$.

Later entropy bounds, nets, partitions, weak product accuracies and finite transformation sample sizes are analytic choices made after the construction constants. They may depend on $M_0$, on a fixed positive test-cell mass, or on fixed accuracy. They do not change a vector-pin rank or the scalar record coefficient in (15.14). For each law sequence satisfying the stated density bounds and each fixed finite test, these choices affect only constant factors and the required onset in $n$. In a countable common-test construction, each fixed finite stage is passed before taking a diagonal subsequence. No exponential rate uniform over all stages is asserted.

For example, unary positivity fixes $gamma = 2^(- K^2 - 3)$ and $b_(upright("int")) = 2^(- J + 2 s_0) < gamma$. On a reference key cell of mass at least $delta > 0$, the proof first obtains conditional input mass at least $delta \/ 2$. It may therefore use

$ u > frac(2, delta \( gamma - b_(upright("int")) \)^2) $

transformations. This changes the constant in $O_u \( 2^(- s_0 n) \)$, while $s_0 = 4 ceil.l A ceil.r$ and the profile count $2^(A n)$ remain fixed. A smaller cell does not require a larger $J$. Likewise the final B-net accuracy in 73 is fixed after the positive density, set-size, flag-mass and A-hit thresholds. Its cardinality is then a constant that a superpolynomial error absorbs.

The final collision margin is

$ 100 g - \[ 56 \( g - 1 \) + .03 \] = 44 g + 55.97 > 0 . $

For sampling, the fingerprint log-count is

$ O \( N^3 2^(100 g N) \) = o \( m \) \, #h(2em) m = 2^(1000 g N) . $

For $k = ceil.l m \/ 200 ceil.r$, the exceptional-pair bound is

$ m^(2 k) 2^(- k D N) = 2^(- 2000 g N k) . $

The terminal endpoint-set mass is below $1 \/ M = 2^(- 1000)$; its binomial tail at $m \/ 200$ is exponentially small in $m$. These estimates pay for the fingerprint union in 9 and complete the scale ledger.


#bibliography("refs.bib", style: "ieee", title: [References])
