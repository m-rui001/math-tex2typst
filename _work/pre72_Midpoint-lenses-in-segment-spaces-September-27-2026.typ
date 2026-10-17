#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
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

#align(center)[#text(size: 16pt, weight: "bold")[Midpoint lenses in segment spaces]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

For a normed space $Y$, a vector $x in Y$, and $R > 0$, consider the symmetric lens of displacements

$ cal(L) \( x \, R \) = { y in Y : parallel x + y parallel lt.eq R \, med parallel x - y parallel lt.eq R } . $

When $parallel x parallel$ is close to $R$, convexity restricts this set. In an infinite-dimensional space one can ask for smallness after projecting away finitely many coordinates. We prove such an estimate for a particular tree norm, with a bound determined by the squared-radius deficit $R^2 - parallel x parallel^2$ of the center.

Approximate-midpoint lenses are central to asymptotic midpoint uniform convexity: Dilworth, Kutzarova, Randrianarivony, Revalski, and Zhivkov characterized that property in terms of the measure of noncompactness of suitable lenses #cite(label("DKRRZ2016")) Theorem 2.1 and Definition 2.2. Their framework concerns finite-codimensional control of symmetric displacements. The estimate here gives explicit control outside each finite ancestral set for the specified norm. Its proof uses disjoint tree segments, following the norm construction introduced by James #cite(label("James1974")) p. 739.

=== 1.1 The space and the tail estimate <the-space-and-the-tail-estimate>

For each integer $h gt.eq 1$, let $T_h = bb(N)^(lt.eq h)$ be the rooted tree of words of length at most $h$, ordered by extension of words. Its root is the empty word. Keep separate copies of these trees in the forest

$ cal(F) = product.co_(h gt.eq 1) \( { h } times T_h \) . $

Write $a prec.curly.eq b$ if $a$ is an ancestor of $b$ in the same component. A #emph[segment] is a nonempty interval $\[ a \, b \] = { v : a prec.curly.eq v prec.curly.eq b }$ in an ancestral chain. For a finitely supported real function $u$ on $cal(F)$, set $u \( S \) = sum_(v in S) u \( v \)$ and define

#[#set math.equation(numbering: n => "(1.1)")
 $ rho \( u \) = sup {(sum_(i = 1)^m u \( S_i \)^2)^(1 \/ 2) : m gt.eq 1 \, med S_1 \, dots.h \, S_m upright(" pairwise disjoint segments")} . $ <eq:segment-norm>]

The Euclidean triangle inequality and singleton segments show that $rho$ is a norm. Let $J$ be its completion and let $X = J^(*)$, with the dual norm denoted by $parallel dot.op parallel$. We write $e_v in J$ for a coordinate unit vector. Singleton tests give $\| u \( v \) \| lt.eq rho \( u \)$, so coordinate evaluation extends to an element $e_v^(*) in X$. The construction in (1.1) uses James’s square-sum norm on disjoint segments #cite(label("James1974")) p. 739; the branching and component heights here differ from the classical binary tree.

The second model uses the infinite tree $T_oo = bb(N)^(< omega)$, including its root. Let $J_oo$ be the completion for the same disjoint-segment norm, and let

$ B_oo = overline("span") { e_v^(*) : v in T_oo } subset J_oo^(*) . $

This closure uses the dual norm. It is the coordinate predual in the Ghoussoub–Maurey–Schachermayer construction presented by Banakh #cite(label("Banakh2000")) Section 2.II. Section 3 proves its finite-coordinate and atomic descriptions separately. Perreau asked whether the canonical predual of the countably branching James tree space is asymptotically midpoint uniformly convex #cite(label("Perreau2021")) Question 6, p. 23 of arXiv v1. This question motivates our study of the infinite-height coordinate predual $B_oo$ with the real norm specified here; the finite-height forest is a separate model.

A finite set $H$ is #emph[ancestral] if it contains every ancestor of its vertices. On either coordinate space write

$ P_H x = sum_(v in H) x \( e_v \) e_v^(*) \, #h(2em) Q_H x = x - P_H x . $

Both projections are contractive. The displacement below may have a nonzero head.

#thm([Theorem 1.1.])[
  #emph[ Let $Y$ be either the finite-height forest dual $X = J^(*)$ or the infinite-height coordinate predual $B_oo$. For every finite ancestral $H$, every $x \, y in Y$ with $x = P_H x$, and every $R gt.eq 0$ with $parallel x + y parallel \, parallel x - y parallel lt.eq R$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ parallel Q_H y parallel lt.eq 2 sqrt(R^2 - parallel x parallel^2) . $ <eq:main-squared-tail>]

]
] <thm:main-tail>

The same head works for every displacement in the lens. This is the feature needed when a single center has infinitely many possible midpoints. Corollary 10 gives an explicit averaged asymptotic midpoint modulus for both models.

For comparison with the tree-space history, Girardi proved asymptotic uniform convexity (AUC) of the canonical predual and full dual of the classical binary James tree space #cite(label("Girardi2001")) Theorems 3 and 5 of arXiv v1. Our finite-height model uses countably branching trees with finite, unbounded heights. The local cancellation estimate in this paper is proved for those specified segment tests; it is not imported from the binary-tree result.

=== 1.2 The mechanism of the proof <the-mechanism-of-the-proof>

Section 2 proves the coordinate structure locally, so no companion theorem is needed to read the argument. The tail splits into an $ell_2$ sum over the descendant subtrees starting just outside a finite ancestral set.

In Section 4, we represent points of each finite head unit ball by convex combinations of disjoint segment functionals. A functional nearly norming the center makes the atom coefficients close to its sums over the same segments. The difficulty is cancellation: two represented atoms can have opposite sums when they leave the head at the same vertex. Their head segments are nested. Splitting the longer one improves its squared segment test, so the opposite-sign product is bounded by the amount that the two tests fall short of one. Section 5 proves this crossing comparison.

The two endpoint distributions can be combined with a random sign. Keeping the coefficient error and the unused head-test energy in one budget gives Theorem 1, proved in Section 6. The same head controls every displacement, so finite-coordinate approximation yields an asymptotic midpoint modulus uniformly over all centers.

The obstruction to an equivalent AUC norm uses a different feature of the spaces. Every root-path functional has norm one, while its child increments are unit coordinate vectors and are weakly null. A positive one-sided asymptotic modulus would permit successive children whose path norms grow by a fixed factor. This contradicts the uniform bound on path norms. The forest supplies arbitrarily long finite paths; the infinite tree also permits an argument using the supremum of all path norms. Sections 8 and 9 prove these assertions for the two completions separately.

=== 1.3 The other quantities measured by the methods <the-other-quantities-measured-by-the-methods>

A second proof method works directly with primal tests. Clipping their cumulative sums along each exterior path produces two perturbations with a quadratic norm cost. Testing the two endpoints on these perturbations controls their average. Corollary 21 gives the resulting uniform gain for perturbations in a suitable finite-codimensional subspace. The construction and its root-shift variants occupy Sections 10–11.

The later atomic arguments compare what survives when one changes the normalization or retains more of the original representation. A common head test can control several endpoint distributions with unequal weights or a nonzero center tail. A bound on their mixture does not automatically give the same bound on each conditional law. Proposition 29, for example, records separate coefficient errors and boundary masses. Some alternative calculations give weaker geometric constants: the radial bound $\( sqrt(2) + sqrt(6) \) sqrt(R \( R - parallel x parallel \))$ of Proposition 27 estimates the two errors separately, while the original-product route incurs a fourth-root loss. These calculations record the losses of their respective methods. Sign selection and maximal-gain trimming instead isolate which crossing contributions can be retained with a common sign.

These estimates have metric consequences. The companion #emph[Distortion of countably branching diamonds from midpoint and tree energies] #cite(label("DiamondEnergies")) Theorem 1.1 proves that Theorem 1 forces $D^2 gt.eq 1 + k \/ 4$ for embeddings of the depth-$k$ countably branching normalized diamond. That graph starts from an edge of length one and replaces each edge by countably many two-edge paths of the same total length; distortion means a common ratio between upper and lower all-pairs Lipschitz factors. The companion proves all infinite-family selections and graph recurrences, and also preserves the independent radial-deficit route and direct energy methods.

The broader question whether asymptotic midpoint uniform convexity implies an equivalent asymptotically uniformly convex norm already has a negative answer. Baudier proved midpoint convexity for the Kadets–Werner modification of the Bourgain–Rosenthal space, which has no equivalent AUC norm #cite(label("Baudier2026")) Theorem 1 and Corollary 1. Here the finite-height forest is reflexive, and the infinite-height coordinate predual is a different completion. Their exact identification statements and local estimates are part of the proofs below. The numerical bounds are not claims of optimality or priority.

===== 1.3.1 Reading guide. <reading-guide.>

Sections 2–6 establish the coordinate foundations and the main lens theorem. Section 7 derives the midpoint modulus; the bounded-path arguments in Sections 8– 9 complete the principal geometric conclusions. Sections 10–11 then develop the independent primal method, from cumulative clipping to root shifts and bounded separated families.

The remaining sections study atomic representations in more detail. Sections 12–13 retain radial and conditional estimates. Sections 14– 15 give the gauge and polar descriptions and the common finite-test estimates. Sections 16–22 use them to compare weighted endpoint laws, original coefficients and sign choices, with the model specified in each statement. Sections 23–24 finish with qualitative arguments and their distinct normalization procedures.

== 2 The coordinate structure of the forest <sec:forest>

We first establish the structural facts needed to separate a vector into finitely many coordinates and its complement. The finite heights give reflexivity and coordinate density; the ancestral order gives contractive projections and an exact norm formula on the complementary subtrees.

For a finite set $H$, the coordinate projections are $P_H u = sum_(v in H) u \( v \) e_v$ on $J$ and $P_H x = sum_(v in H) x \( e_v \) e_v^(*)$ on $X$; write $Q_H = I - P_H$.

#thm([Lemma 2.1.])[
  #emph[The space $X$ defined by (1.1) is infinite dimensional, separable, and reflexive, and the coordinate functionals have dense span in $X$. Let $H subset cal(F)$ be finite and #emph[ancestral], meaning that it contains every ancestor of each of its vertices. The coordinate projections $P_H$ and $Q_H$ are contractive on both $J$ and $X$. Moreover, $P_H x arrow.r x$ along any increasing ancestral exhaustion of $cal(F)$.]
] <lem:forest-structure>

#proof[
  Singleton tests give $parallel u parallel_2 lt.eq rho \( u \)$. On a component of height $h$, each segment has at most $h + 1$ vertices. Thus Cauchy–Schwarz and disjointness give
  $ parallel u parallel_2 lt.eq rho \( u \) lt.eq sqrt(h + 1) parallel u parallel_2 . $
  Write $J_h$ for the completion on that component. Segment families from different components combine freely, so
  $ J = (xor.big_(h gt.eq 1) J_h)_(ell_2) . $
  Each $J_h$ is isomorphic to Hilbert space. The dual of an $ell_2$ sum is isometrically the $ell_2$ sum of the duals: Cauchy–Schwarz proves one inequality, and testing on almost norming unit vectors in finitely many components, with proportional weights, proves the other. Applying this identity twice proves reflexivity. One may also pass from reflexivity of $J$ to that of its dual through the canonical maps. Write $iota_J : J arrow.r J^(* *)$ and $iota_X : X arrow.r X^(* *)$. For $Phi in X^(* *)$, define $x = Phi compose iota_J in J^(*) = X$. Every $f in X^(*) = J^(* *)$ is $iota_J \( p \)$ for some $p in J$, so
  $ \( iota_X x \) \( f \) = f \( x \) = x \( p \) = Phi \( iota_J \( p \) \) = Phi \( f \) . $
  Thus $iota_X$ is onto. In particular $X^(*) = J$ canonically. If the coordinate functionals did not have dense span in $X$, Hahn–Banach would give a nonzero element of $X^(*) = J$ annihilating them. All its coordinates would vanish, a contradiction. Countability of $cal(F)$ now proves separability; the independent coordinates prove infinite dimensionality.
  A segment meets $H$ in a prefix and its complement in a suffix. Restricting disjoint segment tests to either set therefore proves contractivity on $J$. The adjoints give precisely the coordinate projections on $X$, and remain contractive. Finally, approximate $x$ by a finite coordinate combination. Once $H$ contains its support, contractivity bounds the discarded tail of $x$ by that approximation error. This proves convergence along an ancestral exhaustion. ◻
]

Let $G_H$ be the set of minimal vertices outside $H$. We call these vertices #emph[gates]. They include roots of components disjoint from $H$. Distinct gates are incomparable, and the descendant sets $U_g = { v : g prec.curly.eq v }$ partition $cal(F) \\ H$. Each segment crossing from $H$ to its complement passes through one gate. Let $J \( U_g \)$ denote the coordinate subspace of $J$ supported in $U_g$, with its inherited norm.

#thm([Lemma 2.2.])[
  #emph[For every finite ancestral $H$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ Q_H J = (xor.big_(g in G_H) J \( U_g \))_(ell_2) \, #h(2em) parallel Q_H x parallel^2 = sum_(g in G_H) parallel x \|_(J \( U_g \)) parallel^2 quad \( x in X \) . $ <eq:cone-decomposition>]

 The gate-coordinate map $x mapsto \( x \( e_g \) \)_(g in G_H)$ is a contraction from $X$ to $ell_2 \( G_H \)$.]
] <lem:cones>

#proof[
  On a vector supported outside $H$, every segment test reduces to a segment in one cone. Grouping a disjoint family by its gates gives the upper estimate for the first identity; combining almost maximizing families from finitely many distinct cones gives the reverse estimate. Pass to the completion. A functional supported outside $H$ has exactly the norm of its restriction to $Q_H J$, because $Q_H$ is contractive. Duality for the $ell_2$ sum therefore proves the second identity.
  A segment contains at most one gate, so $rho \( u \) = parallel u parallel_2$ for vectors supported on $G_H$. Testing $x$ on such finite vectors proves the gate-coordinate contraction. ◻
]

== 3 The infinite-height coordinate predual <binf:definition>

The finite-height forest and the infinite tree have the same finite segment tests, but their completions must be specified separately. Here we give the infinite-tree construction and the precise finite-head facts needed by the subsequent arguments.

Let $T_oo = bb(N)^(< omega)$, with root $o$, ordered by extension of finite words. On $c_00 \( T_oo \)$ use the real segment norm

$ rho \( u \) = sup_(cal(S)) (sum_(S in cal(S)) u \( S \)^2)^(1 \/ 2) \, #h(2em) u \( S \) = sum_(v in S) u \( v \) \, $

where $cal(S)$ ranges over finite families of pairwise disjoint nonempty segments. Singleton tests and the Euclidean triangle inequality show that this is a norm, with $parallel u parallel_2 lt.eq rho \( u \) lt.eq parallel u parallel_1$. Let $J_oo$ be its completion and define

$ B_oo = overline("span") { e_v^(*) : v in T_oo } subset J_oo^(*) . $

The closure and norm in this definition are those of $J_oo^(*)$. This is the coordinate predual described in #cite(label("Banakh2000")) Section 2.II. On finite coefficient vectors its norm is

#[#set math.equation(numbering: n => "(3.1)")
 $ ∥sum_v a_v e_v^(*)∥ = sup {lr(|sum_v a_v u \( v \)|) : u in c_00 \( T_oo \) \, med rho \( u \) lt.eq 1} . $ <binf:polar>]

Indeed finite tests are dense in $J_oo$, with rescaling permitting approximation within its unit ball. Consequently completing the finite coefficient vectors in (3.1) gives exactly $B_oo$. In particular $parallel a parallel_oo lt.eq parallel a parallel lt.eq parallel a parallel_2$ for finite coefficient arrays, and every coordinate functional has norm one, by testing on the corresponding primal coordinate vector. For any $x in B_oo$, the same supremum computes $parallel x parallel$: each test is continuous, and the supremum is a $1$-Lipschitz function of $x$ agreeing with its norm on the dense coordinate span. We use only this closed coordinate span, without identifying it with the full dual $J_oo^(*)$.

#thm([Lemma 3.1.])[
  (Finite heads and their complements).  #emph[Let $H subset T_oo$ be finite and ancestral. The coordinate projections $P_H$ and $Q_H = I - P_H$ are contractive on $J_oo$ and $B_oo$. The range of $P_H$ is finite dimensional, and finite coefficient vectors supported outside $H$ are dense in $ker P_H$. Along every increasing ancestral exhaustion, $P_H x arrow.r x$ in $B_oo$. A nonzero vector $x = P_H x$ has a norming test $f = P_H f$ with $rho \( f \) = 1$ and $x \( f \) = parallel x parallel$.]
] <binf:projections>

#proof[
  A segment intersects $H$ in a prefix and its complement in a suffix. Restricting every member of a disjoint testing family proves the primal contractions. Their adjoints preserve the coordinate span, hence its closure, and give the asserted dual contractions. Applying $Q_H$ to finite approximants proves density in its range. An exhaustion eventually fixes each finite coefficient vector; contractivity extends convergence to the completion. Finally the norm of $x = P_H x$ can be computed using only $P_H J_oo$, whose unit ball is compact. A maximizer is a unit test when $x eq.not 0$. ◻
]

For a segment $S subset T_oo$ write $d_S = sum_(v in S) e_v^(*)$. A represented atom is a finite sum $sum_i a_i d_(S_i)$ with disjoint segments $S_i$ and $sum_i a_i^2 lt.eq 1$. Cauchy–Schwarz gives its norm at most one. The representation is part of the data when coefficients or crossings are subsequently examined.

#thm([Lemma 3.2.])[
  (Finite polar hull and completed atomic ball).  #emph[For finite ancestral $H$, the unit ball of $P_H B_oo$ is the convex hull of represented atoms with all segments in $H$. Each point is a convex combination of at most $\| H \| + 1$ such atoms. The full unit ball of $B_oo$ is the norm-closed convex hull of finite atoms.]
  #emph[On $P_H B_oo$ the norm also equals the gauge 
$ inf {sum_j lambda_j : x = sum_j lambda_j A_j \, quad lambda_j gt.eq 0 \, quad A_j upright(" atoms supported in ") H} . $

 In particular, a vector of norm strictly below one has such a finite representation with $sum_j lambda_j < 1$. The gauge defined on $c_00 \( T_oo \)$ by allowing all finite atoms has the same value. Its completion is therefore isometric to $B_oo$.]
] <binf:finite-hull>

#proof[
  There are finitely many disjoint segment families in $H$. For each family, its atoms form the continuous image of a Euclidean unit ball. Their union is compact, as is its finite-dimensional convex hull $C$. For a test $f = P_H f$, the support function of $C$ is precisely $rho \( f \)$, by optimizing the coefficients in each family. Finite-dimensional separation identifies $C$ with the dual unit ball of $P_H J_oo$; contractivity identifies this with the inherited ball of $P_H B_oo$. Carathéodory’s theorem gives $\| H \| + 1$ atoms. Equivalently, its elementary proof repeatedly removes a term from any longer convex combination using an affine dependence among its points, keeping the coefficients nonnegative and their sum one.
  For the gauge assertion, every displayed representation bounds the norm by $sum_j lambda_j$. Conversely, write $x = r \( x \/ r \)$, where $r = parallel x parallel > 0$, and represent $x \/ r in C$; $x = 0$ is immediate. For the global gauge, choose an ancestral $H$ containing the support of $x$. Projection $P_H$ sends every global atom to an atom in $H$: intersect its disjoint segments with $H$ and discard empty intersections. Thus every global representation projects to a local representation with no larger total weight. Local representations are already global ones, so the two gauges agree on every finite coefficient vector. The completion identification follows from (3.1).
  For a completed unit vector, Lemma 4 gives $P_H x arrow.r x$ with each $P_H x$ in the finite atomic ball. Thus the norm-closed convex hull of all finite atoms is the completed unit ball. This last assertion is an approximation statement; the finite exact representations are used only after a finite projection. ◻
]

Let $G_H$ be the minimal vertices outside $H$, and let $U_g = { v : g prec.curly.eq v }$ for $g in G_H$. When $H$ is empty the root is the sole gate.

#thm([Lemma 3.3.])[
  (Exterior square sums).  #emph[For a finite test $u = Q_H u$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ rho \( u \)^2 = sum_(g in G_H) rho \( u upright(bold(1))_(U_g) \)^2 . $ <binf:primal-cones>]

 After completion, $Q_H J_oo = \( xor.big_(g in G_H) J_oo \( U_g \) \)_(ell_2)$. For $x in B_oo$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ parallel Q_H x parallel^2 = sum_(g in G_H) parallel x \|_(J_oo \( U_g \)) parallel^2 . $ <binf:dual-cones>]

 The map $x mapsto \( x \( e_g \) \)_(g in G_H)$ is a contraction to $ell_2 \( G_H \)$.]
] <binf:cones>

#proof[
  Each exterior part of a segment lies in one cone. Grouping tests by cones gives one inequality in (3.2); joining nearly maximizing disjoint families from the finitely many nonzero cones gives the other. Completion gives the displayed primal sum. The norm of $Q_H x$ is exactly that of its restriction to $Q_H J_oo$, by contractivity. The dual norm of an $ell_2$ sum is the $ell_2$ sum of the restriction norms: Cauchy–Schwarz proves the upper bound, and finitely many almost norming tests with proportional weights give the lower bound. This proves (3.3) without any assertion that $B_oo$ is the full dual. Finally a segment meets the antichain $G_H$ in at most one point, so tests supported there have precisely their Euclidean norm. Testing $x$ on them gives the contraction. The same argument shows that $x mapsto \( x \( e_v \) \)_(v in A)$ is a contraction to $ell_2 \( A \)$ for every antichain $A$, not only for a gate set. ◻
]

== 4 Finite convex representations <sec:atoms>

We next describe the finite-dimensional dual balls. Exact finite representations will let us perform the cancellation calculation with finite probability spaces, postponing the only limit until a coordinate exhaustion at the end.

For a segment $S$, write $d_S = sum_(v in S) e_v^(*)$. By (1.1),

#[#set math.equation(numbering: n => "(4.1)")
 $ ∥sum_i a_i d_(S_i)∥ lt.eq (sum_i a_i^2)^(1 \/ 2) #h(2em) \( S_i upright(" pairwise disjoint") \) . $ <eq:atom-coefficients>]

Indeed, evaluate on a vector $u$ with $rho \( u \) lt.eq 1$ and apply Cauchy–Schwarz to the coefficient vector and the segment sums. Call such a represented functional an #emph[atom] when $sum_i a_i^2 lt.eq 1$. The representation, including the segment family, is part of the data.

#thm([Lemma 4.1.])[
  #emph[For a finite ancestral set $K$, the unit ball of $P_K X$ is the convex hull of the atoms whose segments lie in $K$. Each member is a convex combination of at most $\| K \| + 1$ such atoms. If $0 eq.not x = P_H x$ for a finite ancestral $H$, there is $p = P_H p in J$ with $rho \( p \) = 1$ and $x \( p \) = parallel x parallel$.]
] <lem:finite-hull>

#proof[
  There are finitely many disjoint segment families in $K$. For each, its atoms are the continuous image of a Euclidean unit ball, so the union is compact. Its convex hull is compact in the finite-dimensional space $P_K X$. For a test $p$ supported in $K$, optimizing the atom coefficients shows that the support function of this convex hull is $rho \( p \)$. In computing $rho \( p \)$, all segment families can be restricted to $K$. Finite-dimensional separation therefore identifies the hull with the dual unit ball on that coordinate space. By contractivity of $P_K$, this is precisely the inherited unit ball of $P_K X$.
  To obtain the stated bound on the number of atoms, consider a convex representation with more than $\| K \| + 1$ positive weights. Its atoms are affinely dependent, so there are real numbers $theta_i$, not all zero, with $sum_i theta_i = 0$ and $sum_i theta_i A_i = 0$. Vary the weights along this direction until the first weight reaches zero; all weights remain nonnegative, and both their sum and their represented vector are unchanged. Repeating leaves at most $\| K \| + 1$ terms.
  Likewise, for $x = P_H x$ the dual pairing may be restricted to $P_H J$ without altering its norm. That space is finite dimensional, so its compact unit ball contains a norming test, of norm one when $x eq.not 0$. ◻
]

#thm([Corollary 4.2.])[
  (The completed atomic ball).  #emph[Let $cal(A)$ be the set of all represented atoms in $X$. Then 
$ B_X = overline("conv" cal(A))^(thin parallel dot.op parallel) . $

 Every segment functional $d_S$ has norm one.]
] <cor:closed-atomic-ball>

#proof[
  The coefficient estimate puts every atom in $B_X$. Conversely, for $x in B_X$, choose an increasing finite ancestral exhaustion $\( K_n \)$. Contractivity gives $P_(K_n) x in B_X$, and Lemma 7 puts each $P_(K_n) x$ in $"conv" cal(A)$. The convergence $P_(K_n) x arrow.r x$ proves the reverse inclusion. For a nonempty segment $S$, its functional has norm at most one by the coefficient estimate, and evaluation on $e_v$, for any $v in S$, gives equality: the singleton vector $e_v$ has $rho \( e_v \) = 1$.
  There is also a direct separation proof of the completed hull identity. Optimizing the atom coefficients gives $sup_(A in cal(A)) A \( p \) = rho \( p \)$ for every $p in J$. Since $X^(*) = J$, separation of any point of $B_X$ from the norm-closed convex hull would give $x \( p \) > rho \( p \)$, contradicting $parallel x parallel lt.eq 1$. This second proof uses reflexivity; the finite-projection proof only uses the coordinate completion and its contractive exhaustion. ◻
]

== 5 Cancellation at the boundary <sec:cancellation>

We can now compare the segment coefficients of two endpoint laws. The first step depends only on the head test, not on the original atom coefficients. It explains why opposite crossing sums cannot be large when both segment tests are nearly maximal.

For a finite ancestral $H$, a segment #emph[crosses at $g in G_H$] if it meets $H$ and its first vertex outside $H$ is $g$. For a disjoint segment family $cal(S)$ and a test $p = P_H p$ with $rho \( p \) lt.eq 1$, put

$ L_(cal(S)) = 1 - sum_(S in cal(S)) p \( S \)^2 \, #h(2em) b_(cal(S)) \( g \) = cases(delim: "{", p \( S \) \, & S in cal(S) upright(" crosses at ") g \,, 0 \, & upright("no segment of ") cal(S) upright(" crosses at ") g .) $

At most one segment of a disjoint family crosses at each gate, so this definition is unambiguous. Also $L_(cal(S)) gt.eq 0$.

#thm([Lemma 5.1.])[
  #emph[With the preceding notation, two disjoint segment families $cal(S) \, cal(S)'$ satisfy 
#[#set math.equation(numbering: n => "(5.1)")
 $ 2 sum_(g : thin b_(cal(S)) \( g \) b_(cal(S)') \( g \) < 0) \| b_(cal(S)) \( g \) b_(cal(S)') \( g \) \| lt.eq L_(cal(S)) + L_(cal(S)') . $ <eq:opposite-crossing>]

]
] <lem:opposite-crossing>

#proof[
  At a gate with opposite nonzero sums $b \, b'$, the two heads end at the same parent $v$. They are therefore nested and cannot coincide. Suppose the unprimed head $\[ a \, v \]$ is longer than the primed head $\[ a' \, v \]$. Split the unprimed segment immediately before $a'$, retaining its own endpoint in the second piece. Since $p$ vanishes outside $H$, the two new sums are $b - b'$ and $b'$. The gain in its squared test is
  $ \( b - b' \)^2 + \( b' \)^2 - b^2 = 2 \( b' \)^2 - 2 b b' gt.eq 2 \| b b' \| . $
  Figure 1 distinguishes the two original segments from the two pieces created by the split.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1.4, 3.45), [#text(size: 9pt)[Two crossing heads]])
  line((-0.6, 0.3), (3.1, 0.3), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt))
  content((2.6, 0.6375), [#text(size: 9pt)[$H$]], anchor: "west")
  content((2.6, -0.0375), [#text(size: 9pt)[$H^c$]], anchor: "west")
  line((0, 2.85), (0, 0.6), stroke: (paint: rgb("#0000a6"), thickness: 1.4pt))
  line((0, 0.6), (0, -0.525), stroke: (paint: rgb("#0000a6"), thickness: 1.4pt, dash: "dashed"))
  line((1.1, 1.65), (1.1, 0.6), stroke: (paint: rgb("#a60000"), thickness: 1.4pt))
  line((1.1, 0.6), (1.1, -0.525), stroke: (paint: rgb("#a60000"), thickness: 1.4pt, dash: "dashed"))
  circle((0, 2.85), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 2.85), [$a$], anchor: "east")
  circle((0, 1.65), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 1.65), [$a'$], anchor: "east")
  circle((1.1, 1.65), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((0, 0.6), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 0.6), [$v$], anchor: "east")
  circle((1.1, 0.6), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((0, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 0), [$g$], anchor: "east")
  circle((1.1, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((0.15, 2.325), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$b$]]], anchor: "west")
  content((1.25, 1.125), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$b'$]]], anchor: "west")
  content((1.1, -0.975), [#text(size: 9pt)[$"bb"'<0$]])
  line((3.5, 1.575), (4.7, 1.575), stroke: (paint: rgb("#999999"), thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.1764cm, fill: rgb("#999999"))))
  content((4.1, 2.287), [#text(size: 9pt)[Split before#linebreak()\(a'\)]])
  content((7.3, 3.45), [#text(size: 9pt)[Splitting the longer segment]])
  line((5.4, 0.3), (9.2, 0.3), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt))
  line((6, 2.85), (6, 2.025), stroke: (paint: rgb("#0000a6"), thickness: 1.4pt))
  line((6, 1.65), (6, 0.6), stroke: (paint: rgb("#a60000"), thickness: 1.4pt))
  line((6, 0.6), (6, -0.525), stroke: (paint: rgb("#a60000"), thickness: 1.4pt, dash: "dashed"))
  circle((6, 2.85), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((5.965, 2.85), [$a$], anchor: "east")
  circle((6, 2.025), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((6, 1.65), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((5.965, 1.65), [$a'$], anchor: "east")
  circle((6, 0.6), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((5.965, 0.6), [$v$], anchor: "east")
  circle((6, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((5.965, 0), [$g$], anchor: "east")
  content((6.25, 2.475), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[sum $b-b'$]]], anchor: "west")
  content((6.25, 1.125), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[sum $b'$]]], anchor: "west")
  content((7.25, -0.975), [#text(size: 9pt)[Gain $gt.eq 2|"bb"'|$]])
})],
    caption: [Figure 1: Opposite $p$-sums at a gate $g$, with $p$ supported in $H$. The two heads on the left belong to different segment families; their traces are displaced to show their nesting on the same ancestral chain. Their tails are schematic and need not coincide. On the right, the longer segment is split before $a'$; the lower piece retains that segment’s original tail and has $p$-sum $b'$. The squared segment test increases by at least $2 \| b b' \|$. ],
  ) <fig:opposite-crossing>
  Do this at every opposite-sign gate, in the family with the longer head. Within each family each original segment is cut at most once, because it crosses only one gate. Disjointness is preserved, so the total gain in each family is at most its deficit $L$. Summing proves (5.1). ◻
]

== 6 Keeping the coefficient and slack budgets together <mol:sec:joint-budget>

We will replace each atom coefficient by a multiple of the head test’s sum on that segment. This produces two nonnegative errors: the squared change of coefficients and the unused squared head-test energy. Their sum is controlled by the squared-radius deficit of the center. Keeping this joint budget proves the main estimate for the part of an arbitrary displacement outside the head.

We use the segment atoms, ancestral projections, and cone decomposition already established above. The argument applies both to the coordinate completion on the infinite tree and to the finite-height forest, after their respective atomic-ball identifications. It does not identify those two spaces.

#proof[
  Put $r = parallel x parallel$. If $r = 0$, contractivity gives $parallel Q_H y parallel lt.eq parallel y parallel lt.eq R$, which proves the assertion. Assume $r > 0$. First suppose that $y$ has finite support, and enlarge $H$ to a finite ancestral set $K$ containing that support. Choose a head test $p$ of norm one such that $x \( p \) = r$. By the finite atomic-ball formula, choose finite laws of represented vectors
  $ A = sum_i a_i d_(S_i) \, #h(2em) sum_i a_i^2 lt.eq R^2 \, $
  with means $x + y$ and $x - y$. Choose a sign $sigma$ with equal probabilities and then the corresponding law. Thus $bb(E) A = x$ and $bb(E) \( sigma A \) = y$.
  For each outcome put
  $ b_i = r p \( S_i \) \, quad A^compose = sum_i b_i d_(S_i) \, quad V = sum_i \( a_i - b_i \)^2 \, quad L = r^2 - sum_i b_i^2 . $
  Both $V$ and $L$ are nonnegative. Since $bb(E) sum_i a_i b_i = r bb(E) A \( p \) = r^2$, expansion gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ eta + theta := bb(E) V + bb(E) L = bb(E) sum_i a_i^2 - r^2 lt.eq R^2 - r^2 . $ <mol:eq:joint-identity>]
  The atom coefficient estimate also gives $parallel Q_H \( A - A^compose \) parallel lt.eq sqrt(V)$.
  Let $G$ be the gates outside $H$ which occur in the finite representations. At a gate $g$, write $b \( g \)$ for the coefficient of the crossing segment in $A^compose$, and put it equal to zero when there is no crossing segment. Every segment wholly outside $H$ has replaced coefficient zero. If $W = Q_H \( A - A^compose \)$, then
  $ sum_(g in G) \| W \( e_g \) \|^2 lt.eq V . $
  Indeed, the gates are incomparable, so each segment contains at most one gate, and disjointness assigns different gates to different coefficients. Since $bb(E) A \( e_g \) = x \( e_g \) = 0$,
  #[#set math.equation(numbering: n => "(6.2)")
   $ sum_g \( bb(E) b \( g \) \)^2 = sum_g \( bb(E) W \( e_g \) \)^2 lt.eq bb(E) V = eta . $ <mol:eq:joint-signed-mass>]
  The simultaneous opposite-head splitting argument, applied to the test $r p$, gives for two independent outcomes
  $ 2 sum_(g : b \( g \) b' \( g \) < 0) \| b \( g \) b' \( g \) \| lt.eq L + L' . $
  Here the available squared-test budget is $r^2$; this is the only change from the norm-one version. Consequently, with $m \( g \) = bb(E) \| b \( g \) \|$,
  #[#set math.equation(numbering: n => "(6.3)")
   $ parallel m parallel_2^2 - parallel bb(E) b parallel_2^2 = bb(E) sum_g #scale(x: 120%, y: 120%)[\(] \| b \( g \) b' \( g \) \| - b \( g \) b' \( g \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 theta . $ <mol:eq:joint-absolute-mass>]
  Equations (6.2) and (6.3) therefore give $parallel m parallel_2 lt.eq sqrt(eta + 2 theta)$.
  On the cone rooted at $g$, each replaced outcome is $b \( g \) d_(J \( g \))$, where $J \( g \)$ is its crossing tail starting at $g$. The term is zero when there is no crossing segment. Thus the signed mean decomposes as
  #[#set math.equation(numbering: n => "(6.4)")
   $ Q_H bb(E) \( sigma A^compose \) = sum_g bb(E) #scale(x: 120%, y: 120%)[\[] sigma b \( g \) d_(J \( g \)) #scale(x: 120%, y: 120%)[\]] . $ <mol:eq:signed-product-recovery>]
  Each cone term has norm at most $bb(E) \| b \( g \) \| = m \( g \)$, since $\| sigma \| = 1$ and a segment indicator has norm one. The cone identity therefore gives
  $ parallel Q_H bb(E) \( sigma A^compose \) parallel lt.eq parallel m parallel_2 lt.eq sqrt(eta + 2 theta) . $
  Lemma 40 gives a direct convex-product proof of the same reconstruction, allowing any multiplier of absolute value at most one in place of $sigma$.
  The signed mean of the original atoms is $y$, so its tail satisfies
  $ parallel Q_H y parallel lt.eq sqrt(eta) + sqrt(eta + 2 theta) lt.eq 2 sqrt(eta + theta) . $
  For the last inequality, square both sides and use $sqrt(eta \( eta + 2 theta \)) lt.eq eta + theta$. Now apply (6.1).
  For an arbitrary completed vector $y$, take an increasing finite ancestral exhaustion $K_n supset H$. Contractivity gives $parallel x plus.minus P_(K_n) y parallel lt.eq R$, and $P_(K_n) y arrow.r y$ in norm. The finite estimate passes to the limit. No bound on the height or the number of children entered the calculation. ◻
]

== 7 Asymptotic midpoint growth <sec:consequences>

The main tail estimate gives a uniform increase in the endpoint norms on a finite-codimensional subspace. We specify the two standard midpoint moduli before deriving this consequence for both models.

For an infinite-dimensional real Banach space $Y$ and $t > 0$, define the maximum-based asymptotic midpoint modulus by

#[#set math.equation(numbering: n => "(7.1)")
 $ overline(theta)_Y \( t \) = inf_(parallel x parallel = 1) sup_(F in "cof" \( Y \)) inf_(y in F \, thin parallel y parallel = 1) (max { parallel x + t y parallel \, parallel x - t y parallel } - 1) \, $ <eq:max-modulus>]

where $"cof" \( Y \)$ denotes the closed finite-codimensional subspaces. This is the convention of #cite(label("DKRRZ2016")) Definition 2.2. A norm is AMUC when this modulus is positive for every $t > 0$.

We shall also use the averaged convention

#[#set math.equation(numbering: n => "(7.2)")
 $ hat(delta)_Y \( t \) = inf_(parallel x parallel = 1) sup_(F in "cof" \( Y \)) inf_(y in F \, thin parallel y parallel = 1) (frac(parallel x + t y parallel + parallel x - t y parallel, 2) - 1) . $ <eq:averaged-modulus>]

For every infinite-dimensional real Banach space,

#[#set math.equation(numbering: n => "(7.3)")
 $ 1 / 2 overline(theta)_Y \( t \) lt.eq hat(delta)_Y \( t \) lt.eq overline(theta)_Y \( t \) . $ <eq:modulus-comparison>]

The second inequality is pointwise. For the first, fix a unit center $x$ and a norming functional $f$. Intersect a finite-codimensional subspace used for the maximum with $ker f$. Both signed norms are then at least one, and an excess $a$ for their maximum gives an excess at least $a \/ 2$ for their average. Arbitrary approximations to the supremum over subspaces, followed by the infimum over centers, prove the first inequality. The two conventions therefore agree as qualitative properties, but their numerical bounds must be distinguished.

For either symmetric expression, allowing $parallel y parallel gt.eq 1$ in place of $parallel y parallel = 1$ does not change the inner infimum. Indeed, the maximum and the average are even convex functions of the scalar multiplying a fixed direction, and are nondecreasing on the nonnegative half-line. This also shows that both moduli are nondecreasing in $t$.

=== 7.1 Averaged midpoint growth at every radius <averaged-midpoint-growth-at-every-radius>

Write $hat(delta) \( t \)$ for the averaged modulus of the chosen space, defined in (7.2).

#thm([Corollary 7.1.])[
  #emph[In either of the segment-atomic completions considered above, 
#[#set math.equation(numbering: n => "(7.4)")
 $ hat(delta) \( t \) gt.eq frac(sqrt(1 + t^2 \/ 4) - 1, 2) #h(2em) \( t > 0 \) . $ <mol:eq:all-radius-averaged>]

]
] <mol:cor:all-radius-averaged>

#proof[
  For a unit $x = P_H x$ and $y in ker P_H$ with $parallel y parallel gt.eq 1$, Theorem 1.1 applied to $t y$ gives
  $ max { parallel x + t y parallel \, parallel x - t y parallel } gt.eq sqrt(1 + t^2 \/ 4) . $
  Both endpoint norms are at least one, by applying the contractive projection $P_H$. Their average therefore exceeds one by at least the right side of (7.4).
  For an arbitrary unit center $x$, choose a finitely supported unit vector $x_0$ with $parallel x - x_0 parallel < epsilon$, and let $H$ contain its ancestral support. The estimate for $x_0$ applies to every $y in ker P_H$ of norm at least one. Replacing $x_0$ by $x$ loses at most $epsilon$ in the average. Take the infimum over these $y$, then the supremum over finite-codimensional subspaces, and finally let $epsilon arrow.b 0$. The resulting bound is uniform over the original unit center. ◻
]

== 8 Coordinate variants and bounded paths <sec:coordinate-variants>

=== 8.1 Projections and height conventions <projections-and-height-conventions>

The coordinate arguments also apply to restrictions of the forest and to other choices of finite component heights. We first record these variants, then use bounded root paths to rule out an equivalent AUC norm.

#thm([Lemma 8.1.])[
  #emph[Let $E$ be a set of vertices whose intersection with every segment is empty or a segment. The coordinate projection $P_E$ is contractive on both $J$ and $X = J^(*)$. Its range on $J$ is the completion of $c_00 \( E \)$ under the segment norm restricted to $E$, and 
$ parallel P_E x parallel = parallel x \|_(P_E J) parallel #h(2em) \( x in X \) . $

 In particular these assertions apply to an ancestral set, its complement, a difference of nested ancestral sets, a descendant subtree, and an antichain. On an antichain the coordinate norm on either space is exactly the usual $ell_2$ norm.]
] <foundation:order-convex>

#proof[
  For a finite vector $u$, each segment sum of $P_E u$ is the sum of $u$ over the intersection of that segment with $E$. Nonempty intersections are disjoint segments when the original segments are disjoint. Taking the supremum proves $rho \( P_E u \) lt.eq rho \( u \)$. Extend by density and take the adjoint to obtain the assertion on $X$. Contractivity and density identify $P_E J$ with the indicated completion. Since $P_E$ maps the unit ball of $J$ onto the unit ball of its range, restriction has exactly the asserted dual norm. A segment meets an antichain in at most one vertex; singleton tests then give the $ell_2$ norm on its primal range. The restriction identity and $ell_2$ duality give the dual assertion. ◻
]

#thm([Proposition 8.2.])[
  #emph[Let $I$ be countable and let $\( h_i \)_(i in I)$ be nonnegative integers. On the disjoint forest 
$ cal(F)_(bold(h)) = product.co_(i in I) \( { i } times bb(N)^(lt.eq h_i) \) $

 define $J_(bold(h))$ by the same disjoint-segment norm and set $X_(bold(h)) = J_(bold(h))^(*)$. If $J \( h \)$ denotes the single-tree completion on $bb(N)^(lt.eq h)$, then 
$ J_(bold(h)) = #scale(x: 180%, y: 180%)[\(] xor.big_(i in I) J \( h_i \) #scale(x: 180%, y: 180%)[\)]_(ell_2) \, #h(2em) X_(bold(h)) = #scale(x: 180%, y: 180%)[\(] xor.big_(i in I) J \( h_i \)^(*) #scale(x: 180%, y: 180%)[\)]_(ell_2) $

 isometrically under coordinate restriction. Both spaces are reflexive, and finite coordinate vectors are dense in each. The projection and complementary-subtree formulas remain valid for this forest.]
  #emph[The convention of one tree with $n$ levels, including the root, for every $n gt.eq 1$ gives exactly 
$ J_(upright("levels")) = bb(R) xor_2 J \, #h(2em) X_(upright("levels")) = bb(R) xor_2 X . $

 Its component estimate is $parallel u parallel_2 lt.eq rho \( u \) lt.eq sqrt(n) thin parallel u parallel_2$, and a root-to-leaf path has $n - 1$ extension steps.]
] <foundation:height-variants>

#proof[
  Every segment belongs to one component. Grouping a test family by component gives one inequality in the primal sum formula. For the other, choose nearly maximizing finite families on each of the finitely many components meeting the support and combine them. Completion gives the displayed primal identity, and duality for $ell_2$ sums gives the dual identity. On component $i$,
  $ parallel u parallel_2 lt.eq rho \( u \) lt.eq sqrt(h_i + 1) thin parallel u parallel_2 . $
  Thus each component and its dual are reflexive Hilbert space renormings with dense coordinates. The sum identities give reflexivity and coordinate density on the entire forest. No bound uniform in $i$ on the Hilbert space comparison is needed. Projection contractivity uses only segment intersection, as in Lemma 11; the complementary-subtree identity uses independent segment tests in its incomparable subtrees.
  For the last assertion, put $h = n - 1$. The component $n = 1$ is the one-dimensional singleton tree with the absolute-value norm. The remaining components have heights $1 \, 2 \, dots.h$, and the coordinate map $\( n \, sigma \) mapsto \( n - 1 \, sigma \)$ preserves their segments and all their tests. Splitting off the singleton proves both isometries. The component bound and the number of extension steps follow from the maximal chain cardinality $n$. ◻
]

=== 8.2 Bounded paths and equivalent norms <bounded-paths-and-equivalent-norms>

A single segment functional has norm one even when the segment is very long. Its successive coordinate increments therefore give bounded paths. The following argument explains why weakly null choices of the next increment obstruct an asymptotically uniformly convex equivalent norm. It also retains the precise radius when increments are normalized before being approximated in a finite-codimensional subspace.

For a norm $N$ on an infinite-dimensional real Banach space $Z$, write $S_N = { z : N \( z \) = 1 }$ and let $"cof" \( Z \)$ denote the closed finite-codimensional linear subspaces. Define

#[#set math.equation(numbering: n => "(8.1)")
 $ overline(delta)_N \( t \) = inf_(x in S_N) sup_(F in "cof" \( Z \)) inf_(y in F ∩ S_N) #scale(x: 120%, y: 120%)[\(] N \( x + t y \) - 1 #scale(x: 120%, y: 120%)[\)] \, #h(2em) t > 0 . $ <eq:one-sided-modulus>]

Positivity at every $t > 0$ is asymptotic uniform convexity. The spheres $F ∩ S_N$ are nonempty. A norming functional for $x$, with $F$ contained in its kernel, gives the lower bound in $0 lt.eq overline(delta)_N \( t \) lt.eq t$; the upper bound is the triangle inequality.

#thm([Lemma 8.3.])[
  #emph[Let $x in S_N$, let $\( z_j \)$ be weakly null, and suppose $N \( z_j \) gt.eq t > 0$ for every $j$. For every $0 < gamma < overline(delta)_N \( t \)$, all sufficiently large $j$ satisfy 
$ N \( x + z_j \) > 1 + gamma . $

]
] <foundation:weak-null-growth>

#proof[
  Choose $eta$ with $gamma < eta < overline(delta)_N \( t \)$ and then $F in "cof" \( Z \)$ such that $N \( x + t v \) > 1 + eta$ for every $v in F ∩ S_N$. Put $u_j = z_j \/ N \( z_j \)$. These vectors are weakly null because $1 \/ N \( z_j \) lt.eq 1 \/ t$. Their images in $Z \/ F$ converge to zero weakly, hence in norm, since the quotient is finite dimensional. Choose $v_j in F$ with $N \( v_j - u_j \) arrow.r 0$. Then $N \( v_j \) arrow.r 1$, so $w_j = v_j \/ N \( v_j \)$ is defined for large $j$, belongs to $F ∩ S_N$, and satisfies $N \( w_j - u_j \) arrow.r 0$. Consequently
  $ N \( x + t u_j \) > 1 + eta - t N \( w_j - u_j \) > 1 + gamma $
  for large $j$. For $r gt.eq t$, convexity gives
  $ N \( x + r u_j \) - 1 gt.eq r / t #scale(x: 120%, y: 120%)[\(] N \( x + t u_j \) - 1 #scale(x: 120%, y: 120%)[\)] . $
  Apply this at $r = N \( z_j \)$ to finish the proof. ◻
]

There is a second useful form of the approximation step. If $N \( z_j \) gt.eq 2 t$ and $N \( x + t v \) > 1 + eta$ on $F ∩ S_N$, approximate $z_j$ directly by $v_j in F$ with $N \( z_j - v_j \) arrow.r 0$. Eventually $N \( v_j \) gt.eq t$, so the same ray-convexity inequality gives $N \( x + v_j \) > 1 + eta$. For every $0 < gamma < eta$, choosing $N \( z_j - v_j \) < eta - gamma$ gives $N \( x + z_j \) > 1 + gamma$. This form uses the spare factor two in the radius and does not require approximating the normalized sequence.

#thm([Proposition 8.4.])[
  #emph[Suppose an infinite-dimensional real Banach space $\( Z \, parallel dot.op parallel \)$ contains, for every positive integer $k$, vectors $\( u_s \)_(s in bb(N)^(lt.eq k))$ such that 
$ 0 < m lt.eq parallel u_s parallel lt.eq M \, #h(2em) parallel u_(s^frown j) - u_s parallel gt.eq c > 0 \, $

 where $m \, M \, c$ are independent of $k$, and for each nonterminal $s$ the sequence $\( u_(s^frown j) - u_s \)_j$ is weakly null against the whole continuous dual of $Z$. If $0 < a lt.eq b < oo$ and $a parallel z parallel lt.eq N \( z \) lt.eq b parallel z parallel$, then 
$ overline(delta)_N #h(-1em) (frac(a c, b M)) = 0 . $

 In particular the same conclusion holds at $a c \/ \( 2 b M \)$, and $Z$ admits no equivalent asymptotically uniformly convex norm.]
] <foundation:bounded-tree>

#proof[
  Suppose the modulus at $t = a c \/ \( b M \)$ is positive and choose $0 < gamma < overline(delta)_N \( t \)$. At a nonterminal $s$, put
  $ x = frac(u_s, N \( u_s \)) \, #h(2em) z_j = frac(u_(s^frown j) - u_s, N \( u_s \)) . $
  The equivalent norms have the same continuous linear functionals, so $\( z_j \)$ is weakly null, and $N \( z_j \) gt.eq a c \/ \( b M \) = t$. Lemma 13 gives a child for which $N \( u_(s^frown j) \) > \( 1 + gamma \) N \( u_s \)$. Starting at the root and repeating $k$ times gives $a m \( 1 + gamma \)^k < b M$, which is impossible for sufficiently large $k$. Thus the modulus at $t$ is zero. Applying the same argument at $t \/ 2$, using either the lemma or the direct approximation form above, proves the stated smaller-radius conclusion. ◻
]

#thm([Corollary 8.5.])[
  #emph[If the finite component heights $h_i$ in Proposition 12 are unbounded, then every equivalent norm $N$ on $X_(bold(h))$ with $a parallel x parallel lt.eq N \( x \) lt.eq b parallel x parallel$ satisfies 
$ overline(delta)_N \( a \/ b \) = overline(delta)_N \( a \/ \( 2 b \) \) = 0 . $

]
] <foundation:forest-obstruction>

#proof[
  For a vertex $s$ in a component with root $o$, put $u_s = sum_(o prec.curly.eq v prec.curly.eq s) e_v^(*)$. A single segment test gives $parallel u_s parallel lt.eq 1$, while evaluation on $e_s$ gives equality. Likewise $parallel e_s^(*) parallel = 1$, and $u_(s^frown j) - u_s = e_(s^frown j)^(*)$. These increments are weakly null: under the canonical identification $X_(bold(h))^(*) = J_(bold(h))$, their evaluations on $g$ are the coordinates $g \( s^frown j \)$, which tend to zero since $parallel g parallel_2 lt.eq rho \( g \)$. Equivalently, the coordinate map on this fixed component is a Hilbert space isomorphism, so every continuous functional on the full space restricts to a continuous Hilbert space functional there. Components of unbounded finite height give the trees required by Proposition 14, with $m = M = c = 1$. For the convention of $n$ levels the same iteration makes $n - 1$ steps. Both step counts tend to infinity. ◻
]

== 9 The infinite-height renorming obstruction <sec:infinite-obstruction>

#thm([Proposition 9.1.])[
  (The bounded-path obstruction).  #emph[The unit root-path vectors in $B_oo$ have unit child increments which are weakly null among the children of each fixed vertex. Every sequence of distinct coordinate vectors is in fact weakly null. If $a parallel dot.op parallel lt.eq N lt.eq b parallel dot.op parallel$, with $0 < a lt.eq b < oo$, then the one-sided asymptotic modulus of $N$ vanishes at $a \/ \( 2 b \)$ and at $a \/ b$. In particular, $B_oo$ has no equivalent AUC norm. The same obstruction holds for the finite-height forest, using trees of arbitrarily large finite height.]
] <binf:obstruction>

#proof[
  Singleton tests and Cauchy–Schwarz give
  $ ∥sum_v c_v e_v^(*)∥ lt.eq (sum_v c_v^2)^(1 \/ 2) . $
  For coefficients supported on an antichain, equality holds: the test with proportional coefficients on that antichain has its Euclidean norm, since a segment meets it in at most one point. In particular sibling coordinate vectors span an isometric $ell_2$. Thus the map sending the unit vectors of $ell_2 \( T_oo \)$ to $e_v^(*)$ extends boundedly into $B_oo$. For any $L in B_oo^(*)$, finite Euclidean duality gives $sum_v \| L \( e_v^(*) \) \|^2 lt.eq parallel L parallel^2$. Hence distinct coordinates are weakly null against the whole continuous dual. A root-path functional $z_v = d_(\[ o \, v \])$ has norm one, by the single segment upper bound and any coordinate test on that path. Its child is $z_(v^frown n) = z_v + e_(v^frown n)^(*)$.
  Use the one-sided modulus defined in (8.1). It is nonnegative: for each $x$, the kernel of a norming functional makes every displayed norm at least one. Suppose its value is positive at a radius $r_0 lt.eq a \/ b$. Choose $0 < d < overline(delta)_N \( r_0 \)$. For a path $z$, put $x = z \/ N \( z \)$ and choose $F$ so that $N \( x + r_0 w \) gt.eq 1 + d$ on the $N$-unit sphere of $F$. The normalized child directions $v_n = e_(v^frown n)^(*) \/ N \( e_(v^frown n)^(*) \)$ are weakly null. Their images in the finite-dimensional quotient by $F$ converge to zero in norm. Approximate them in $F$ and normalize those approximants to obtain $N$-unit vectors $w_n in F$ with $N \( v_n - w_n \) arrow.r 0$. Choose $N \( v_n - w_n \) < d \/ \( 2 r_0 \)$. Then $N \( x + r_0 v_n \) > 1 + d \/ 2$ for large $n$. The actual child step has radius
  $ r_n = frac(N \( e_(v^frown n)^(*) \), N \( z \)) in \[ a \/ b \, b \/ a \] . $
  Convexity along this ray, including the case $r_n = r_0$, gives
  #[#set math.equation(numbering: n => "(9.1)")
   $ N \( x + r_n v_n \) > 1 + r_n / r_0 d / 2 gt.eq 1 + d / 2 . $ <binf:radial-growth>]
  Choosing a child repeatedly contradicts $a lt.eq N \( z_v \) lt.eq b$. For the forest, choose the component height in advance large enough that $a \( 1 + d \/ 2 \)^h > b$ and carry out only $h$ such selections. ◻
]

=== 9.1 Transferring the cofinite gain to a child <binf:transfer-comparisons>

The following procedures keep track of the radius and approximation error in the bounded-path argument. Fix the equivalent norm $N$ and constants $a \, b$ from Proposition 16. For a root path $z = d_(\[ o \, v \])$, put $x = z \/ N \( z \)$ and write $e_n = e_(v^frown n)^(*)$ for its child increments. Then

$ a lt.eq N \( z \) lt.eq b \, #h(2em) a lt.eq N \( e_n \) lt.eq b . $

At each stated radius $r_0$, suppose a finite-codimensional subspace $F$ gives $N \( x + r_0 w \) gt.eq 1 + d$ for every $N$-unit $w in F$, with $d > 0$ chosen below the putative positive modulus. Raw, path-normalized, and unit child sequences are weakly null, so all three can be approximated in $F$. Each resulting uniform child gain contradicts bounded path norms by the iteration just proved.

===== 9.1.1 Raw children at the safety radius. <raw-children-at-the-safety-radius.>

At the safety radius $r_0 = a \/ \( 2 b \)$, one can approximate the child without first normalizing it. Given a cofinite gain $d > 0$ at $z \/ N \( z \)$, choose a raw child $e$ and $q in F$ with

#[#set math.equation(numbering: n => "(9.2)")
 $ N \( e - q \) < min { a \/ 2 \, d N \( z \) \/ 2 } . $ <binf:raw-error>]

Then $N \( q \) gt.eq a \/ 2 gt.eq r_0 N \( z \)$, and ray convexity yields $N \( z + q \) gt.eq \( 1 + d \) N \( z \)$. Consequently $N \( z + e \) gt.eq \( 1 + d \/ 2 \) N \( z \)$. The stronger restriction $N \( e - q \) < min { a \/ 2 \, a d \/ 2 }$ suffices uniformly over all paths. If the cofinite gain is $2 d$, the error bound $d N \( z \)$ gives factor $1 + d$; if that gain is half a named modulus $delta$, error less than $delta N \( z \) \/ 4$ gives factor $1 + delta \/ 4$.

===== 9.1.2 Repair at the endpoint radius. <repair-at-the-endpoint-radius.>

Normalize a raw child by the path norm, setting $h_n = e_(v^frown n)^(*) \/ N \( z \)$. Its norm is at least $a \/ b$. At the radius $r_0 = a \/ b$, take $q_n in F$ with $N \( q_n - h_n \) arrow.r 0$. These approximants may have norm slightly less than $r_0$. For large $n$, set

#[#set math.equation(numbering: n => "(9.3)")
 $ q'_n = max { 1 \, r_0 \/ N \( q_n \) } thin q_n . $ <binf:radial-repair>]

Since $N \( h_n \) gt.eq r_0$, the enlargement costs at most $N \( q_n - h_n \)$, so $N \( q'_n - h_n \) lt.eq 2 N \( q_n - h_n \) arrow.r 0$. The cofinite gain applied to $q'_n$ therefore gives a strict child factor greater than $1 + d \/ 2$ once the repaired error $N \( q'_n - h_n \)$ is less than $d \/ 2$ (for example, when the original error is less than $d \/ 4$). At the safety radius $r_0 = a \/ \( 2 b \)$ no enlargement is needed: $N \( h_n \) gt.eq 2 r_0$, and choosing $N \( q_n - h_n \) < min { r_0 \, gamma \/ 2 }$ transfers a cofinite gain $gamma$ to a strict child factor greater than $1 + gamma \/ 2$.

===== 9.1.3 Unit directions at the variable radius. <unit-directions-at-the-variable-radius.>

For $0 < r_0 lt.eq a \/ b$, the unit-child procedure from the proof inserts the approximating unit direction at the actual variable radius $r_n$, instead of first transferring at $r_0$. Ray convexity gives $N \( x + r_n w_n \) gt.eq 1 + d$. As $r_n lt.eq b \/ a$,

#[#set math.equation(numbering: n => "(9.4)")
 $ N \( x + r_n v_n \) gt.eq 1 + d - r_n N \( v_n - w_n \) gt.eq 1 + d - \( b \/ a \) N \( v_n - w_n \) > 1 + d \/ 2 $ <binf:variable-radius-transfer>]

for all sufficiently close unit approximants. This proves the variable-scale transfer with its uniform error factor and also covers the endpoint $r_n = r_0$.

===== 9.1.4 Additive growth. <additive-growth.>

At the safety radius $r_0 = a \/ \( 2 b \)$, a cofinite gain $eta > 0$ gives $N \( z + q \) gt.eq N \( z \) + a eta$ since $N \( z \) gt.eq a$. With $N \( e - q \) < min { a \/ 2 \, a eta \/ 2 }$, each chosen child satisfies $N \( z + e \) gt.eq N \( z \) + a eta \/ 2$. Repetition again contradicts the same upper bound $b$. This is a separate way to accumulate the gain.

=== 9.2 Parameter choices for the raw-child transfer <parameter-choices-for-the-raw-child-transfer>

At the safety radius $t_0 = a \/ \( 2 b \)$, the raw-child argument above turns a cofinite gain into growth of a root-path norm. The following statement records three choices of that gain and their uniform error bounds.

#thm([Proposition 9.2.])[
  #emph[In $B_oo$, the root paths $h_v = d_(\[ o \, v \])$ and the coordinates $e_v^(*)$ have norm one, and the children $\( e_(v^frown j)^(*) \)_j$ of each fixed vertex are weakly null. If $a parallel z parallel lt.eq N \( z \) lt.eq b parallel z parallel$, with $0 < a lt.eq b < oo$, then $overline(delta)_N \( a \/ \( 2 b \) \) = 0$.]
  #emph[More precisely, put $t_0 = a \/ \( 2 b \)$, with $d \, epsilon > 0$ below. Each of the following assumptions would permit a finite-codimensional subspace and a child whose approximation error and growth factor satisfy the corresponding row: 
$ upright("assumed positive lower bound") & upright("error less than") & upright("growth factor")\
0 < d < overline(delta)_N \( t_0 \) & min \( a \/ 2 \, a d \/ 2 \) & 1 + d \/ 2\
2 epsilon < overline(delta)_N \( t_0 \) & min \( a \/ 2 \, a epsilon \/ 2 \) & 1 + epsilon \/ 2\
d = overline(delta)_N \( t_0 \) > 0 & min \( a \/ 2 \, a d \/ 4 \) & 1 + d \/ 4 $

 Here the error is $N \( e_v^(*) - f \)$ for the chosen child and its approximant $f$ in the finite-codimensional subspace. Growth is measured relative to the $N$-norm of the parent root-path vector.]
] <stab:sign:obstruction>

#proof[
  The path norms, weak nullity against the whole dual and vanishing one-sided modulus are Proposition 16. For the table, choose respectively a cofinite gain $gamma = d$, $gamma = epsilon$ or $gamma = d \/ 2$. The uniform raw-child error bound $N \( e_v^(*) - f \) < min \( a \/ 2 \, a gamma \/ 2 \)$ from (9.2) gives growth at least $1 + gamma \/ 2$. These are exactly the three rows. In the last row the selected gain $d \/ 2$ lies strictly below the named modulus, as required by the supremum over finite-codimensional subspaces. ◻
]

#prodef([Remark 9.3.])[
  (Taking the supremum of the path norms).  For the infinite tree there is a second contradiction that uses no iteration along a branch. Set
  $ M = sup_v N \( d_(\[ o \, v \]) \) in \[ a \, b \] \, #h(2em) t_0 = frac(a, 2 M) . $
  Suppose $0 < gamma < overline(delta)_N \( t_0 \)$. For each path vector $z = d_(\[ o \, v \])$, choose a cofinite subspace $F$ giving gain $gamma$ at $z \/ N \( z \)$. The child increments $e_(v^frown n)^(*)$ are weakly null, so choose $q_n in F$ with $N \( q_n - e_(v^frown n)^(*) \) arrow.r 0$. Eventually $N \( q_n \) gt.eq a \/ 2 gt.eq t_0 N \( z \)$. Convexity along the ray through $q_n$ therefore gives $N \( z + q_n \) gt.eq \( 1 + gamma \) N \( z \)$. Passing to the lower limit and using the vanishing approximation error yields
  $ M gt.eq liminf_n N \( z + e_(v^frown n)^(*) \) gt.eq \( 1 + gamma \) N \( z \) . $
  Taking the supremum over all $v$ gives $M gt.eq \( 1 + gamma \) M$, a contradiction. No path is required to attain $M$. This argument uses the fact that every vertex of the infinite tree has children; the finite-height forest is covered by the finite-iteration argument above.
] <binf:supremum-obstruction>

== 10 Clipping cumulative segment sums <clip:section>

We now perturb a primal head test while keeping the squared cost quadratic in the perturbation size. The construction works on $T_oo$ and on the finite-height forest. In this section $cal(T)$ denotes either tree system, $J \( cal(T) \)$ its segment completion, and $Z$ its closed coordinate span in $J \( cal(T) \)^(*)$. Thus $Z = B_oo$ in the first case and $Z = X$ in the second. We retain $rho$ for the test norm and $parallel dot.op parallel$ for the coefficient norm. All tests constructed below are finitely supported.

Fix a finite ancestral head $H$. For a gate $g$ let $U_g$ be its exterior cone, and give its parent the artificial cumulative value zero when that parent is absent from the component. For $v = Q_H v$ define

$ V_g \( w \) = v \( \[ g \, w \] \) \, #h(2em) m_g = max_(w in U_g) \| V_g \( w \) \| \, #h(2em) q_g = rho \( v upright(bold(1))_(U_g) \) . $

These maxima exist: finite support gives only finitely many distinct cumulative values. We have

#[#set math.equation(numbering: n => "(10.1)")
 $ sum_g m_g^2 lt.eq rho \( v \)^2 = sum_g q_g^2 . $ <clip:budgets>]

The equality follows from the exterior square-sum identity. For the inequality, choose one maximizing root prefix in each nonzero cone; these prefixes are disjoint.

A third useful grouping collects cones with the same last head vertex. For $p in H$, let $C_p$ consist of all exterior vertices whose last ancestor in $H$ is $p$. Either of

#[#set math.equation(numbering: n => "(10.2)")
 $ b_p = rho \( v upright(bold(1))_(C_p) \) \, #h(2em) M_p = max_(w in C_p) \| v \( \( p \, w \] \) \| $ <clip:group-budgets>]

may be used as its budget, with $M_p = 0$ when $C_p$ is empty. Both satisfy $sum_p b_p^2 lt.eq rho \( v \)^2$ and $sum_p M_p^2 lt.eq rho \( v \)^2$. The first follows by joining nearly maximizing families in the disjoint regions; for the second choose one maximizing prefix in each region. A region may contain several cones, but a segment meeting it stays in one cone, and disjoint crossing segments have distinct last head vertices. These facts, rather than an assumed orthogonality within a region, justify the grouping. For a component disjoint from $H$, there is no last head vertex. Keep each such cone as a separate group, use its prefix maximum or full cone norm, and choose an arbitrary fixed inward sign. It has no head crossing and contributes only to exterior squares. This convention also handles $H = diameter$.

#thm([Lemma 10.1.])[
  (An inward crossing estimate).  #emph[Let $f = P_H f$ and $v = Q_H v$ be finite tests. Use either the cone budgets $m_g$ or $q_g$, or the last-head budgets in (10.2); write $c_j$ for the chosen budget of a cone or region. Fix $s > 0$. At each attached group choose the shortest head suffix ending at its attachment whose $f$-sum has magnitude at least $s c_j$, if one exists and $c_j > 0$. Let $sigma_j$ be the opposite sign of that sum, and otherwise choose either sign.]
  #emph[Suppose a finite exterior test $w$ satisfies $rho \( w \) lt.eq rho \( v \)$, and every root prefix in group $j$ has $w$-sum in $sigma_j \[ 0 \, c_j \]$. Then 
#[#set math.equation(numbering: n => "(10.3)")
 $ rho \( f + s w \)^2 lt.eq rho \( f \)^2 + 3 s^2 rho \( v \)^2 . $ <clip:crossing-bound>]

 The same conclusion holds with a strictly greater suffix threshold, provided the small-crossing case includes equality. With a non-strict suffix threshold, equality may also be assigned to the small-crossing case, leaving only strictly larger terms to be split.]
] <clip:crossing>

#proof[
  Take a disjoint segment family. Write $A_i$ and $B_i$ for its head $f$-sum and exterior $w$-sum. Then $sum_i B_i^2 lt.eq rho \( v \)^2$. A positive product $A_i B_i$ occurs only at a crossing, and different crossings use different cone indices (or different last head vertices in the grouped construction). If $\| A_i \| < s c_j$, its cross term is bounded by $2 s^2 c_j^2$. Their total is at most $2 s^2 rho \( v \)^2$.
  For a remaining positive product, the head qualifies for the suffix selection. It contains the selected suffix, whose sum $C_i$ has the opposite sign to $A_i$ and magnitude at least $s c_j$. The suffix is proper, so splitting it off leaves two nonempty head segments. The increase in their squared $f$-sums is
  #[#set math.equation(numbering: n => "(10.4)")
   $ \( A_i - C_i \)^2 + C_i^2 - A_i^2 = 2 C_i^2 - 2 A_i C_i gt.eq 2 s \| A_i \| c_j gt.eq 2 s A_i B_i . $ <clip:split-gain>]
  These cuts are simultaneous cuts in distinct original segments. Their pieces and the other nonempty heads are a valid disjoint test family for $f$. Thus the original head energy plus all large positive cross terms is at most $rho \( f \)^2$. Drop nonpositive cross terms, add the small-crossing budget $2 s^2 rho \( v \)^2$, and add the pure exterior budget $s^2 rho \( v \)^2$. This proves the result. For a strict threshold, use $\| A_i \| lt.eq s c_j$ in the small case and $\| A_i \| > s c_j$ in the large case; the proof is unchanged. ◻
]

#thm([Lemma 10.2.])[
  (Two cumulative clips).  #emph[For every $s > 0$ and finite tests $f = P_H f$, $v = Q_H v$, there are $h_1 \, h_2$ supported on $"supp" v$ such that 
#[#set math.equation(numbering: n => "(10.5)")
 $ v = h_1 - h_2 \, #h(2em) rho \( h_j \) lt.eq rho \( v \) \, #h(2em) rho \( f + s h_j \)^2 lt.eq rho \( f \)^2 + 3 s^2 rho \( v \)^2 quad \( j = 1 \, 2 \) . $ <clip:difference-split>]

 Equivalently, $v = k_1 + k_2$ with $k_1 = h_1$, $k_2 = - h_2$, and the two admissible perturbations are $f + s k_1$ and $f - s k_2$.]
] <clip:two-clips>

#proof[
  Fix any one of the budgets above and choose its signs by Lemma 19. For each group let $Phi_j \( r \) = sigma_j max { sigma_j r \, 0 }$. On an exterior cone in that group, set the cumulative potentials of $h_1 \, h_2$ equal to $Phi_j \( V_g \( w \) \)$ and $Phi_j \( - V_g \( w \) \)$, respectively, and take successive differences down the edges from initial value zero. Since $Phi_j \( r \) - Phi_j \( - r \) = r$, the difference of the two tests is $v$. If $v \( w \) = 0$, its cumulative values at $w$ and its parent are equal, so both new increments vanish. Thus no new support appears, even along infinite descendant paths.
  On any segment in a cone, its $h_j$-sum is a difference of two values of a single $1$-Lipschitz map. Its magnitude is therefore at most the absolute $v$-sum on that same segment. The same assertion holds for a crossing after deleting its zero head portion. In a last-head group, both endpoints use the same grouping index, including the artificial zero at the head predecessor. Hence $rho \( h_j \) lt.eq rho \( v \)$. Root prefixes have the chosen sign and the chosen budget bounds their magnitudes. Lemma 19 completes the proof. ◻
]

The large-crossing calculation has a second form which retains only one of the two split pieces. If $A_i C_i < 0$, the preceding head piece has sum $A_i - C_i$, and

#[#set math.equation(numbering: n => "(10.6)")
 $ \( A_i - C_i \)^2 gt.eq A_i^2 + 2 s \| A_i \| c_j gt.eq A_i^2 + 2 s A_i B_i . $ <clip:shortening>]

Keeping this piece for each large crossing, and keeping each other head unchanged, is again a disjoint head family. This proves the homogeneous sum-decomposition estimate in Lemma 20 by shortening rather than by retaining both pieces. The missing suffix is discarded only from the test family, not from the vector being constructed.

=== 10.1 What the two tests recover <clip:testing>

For $x = P_H x$ and $y in ker P_H$, the mixed head–tail pairings vanish. If $rho \( f \) \, rho \( v \) lt.eq 1$, $x \( f \) = parallel x parallel$, and $y \( v \) gt.eq theta parallel y parallel$ for $0 < theta < 1$, the two clips yield both

#[#set math.equation(numbering: n => "(10.7)")
 $ max_plus.minus parallel x plus.minus t y parallel & gt.eq frac(parallel x parallel + s t theta parallel y parallel \/ 2, sqrt(1 + 3 s^2)) \,\
frac(parallel x + t y parallel + parallel x - t y parallel, 2) & gt.eq frac(parallel x parallel + s t theta parallel y parallel \/ 2, sqrt(1 + 3 s^2)) . $ <clip:max-testing>]

The first uses one clip with $\| y \( h_j \) \| gt.eq theta parallel y parallel \/ 2$ and chooses the corresponding endpoint sign. The second tests $x + t y$ on $f + s h_1$ and $x - t y$ on $f + s h_2$, and uses $y \( h_1 \) - y \( h_2 \) = y \( v \)$ before averaging. These are distinct testing procedures, although their displayed right sides agree. Both norms are separately at least $parallel x parallel$ by testing on $f$.

Finite tail vectors have exact norming tests after a finite ancestral projection and then $Q_H$. For completed tails, finite test density allows $theta arrow.t 1$; alternatively approximate the tail in norm using Lemma 4. Thus, for every $s \, t > 0$,

#[#set math.equation(numbering: n => "(10.8)")
 $ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(parallel x parallel + s t parallel y parallel \/ 2, sqrt(1 + 3 s^2)) . $ <clip:general-head-tail>]

This preserves arbitrary head norms and arbitrary tail magnitudes. In particular, if $parallel x - P_H x parallel < epsilon$ at a unit center and $y in ker P_H$, $parallel y parallel gt.eq 1$, contractivity gives both endpoint bounds $parallel x plus.minus t y parallel gt.eq 1 - epsilon$, while (10.8) applied to $P_H x$ gives

$ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 - epsilon + s t \/ 2, sqrt(1 + 3 s^2)) - epsilon . $

The paired argument also gives the same lower bound for the average.

Use the averaged modulus in (7.2), with $Z$ as the chosen coordinate space. A uniform estimate proved for finite unit centers passes to general centers by normalized finite approximation. If its excess is $E \( t \)$, choosing an approximation within $E \( t \) \/ 2$ retains $E \( t \) \/ 2$. If approximation errors are allowed to tend to zero after choosing the cofinite subspace, the full $E \( t \)$ remains. The supremum over subspaces is taken before the infimum over centers. For a bound first proved for unit tails, the symmetric norm average is an even convex function of the tail radius, hence nondecreasing at nonnegative radii; this gives the required $parallel y parallel gt.eq 1$ version.

#thm([Corollary 10.3.])[
  (The averaged clipping estimate).  #emph[For the infinite-height coordinate predual $B_oo$ and the finite-height forest space $X$, 
$ hat(delta)_Z \( t \) gt.eq sqrt(1 + t^2 \/ 12) - 1 #h(2em) \( t > 0 \) . $

]
] <clip:paired-modulus>

#proof[
  Use the paired test procedure (10.7), let the tail test approach its norm, and put $s = t \/ 6$. At a finite unit center the average is at least
  $ frac(1 + s t \/ 2, sqrt(1 + 3 s^2)) = sqrt(1 + t^2 \/ 12) . $
  Arbitrarily close normalized approximation of the center preserves this bound. The construction applies to untouched forest components because they have no crossing terms. It needs no bound on the component height. ◻
]

=== 10.2 Homogeneous consequences of the clipped tests <dir:primal:add:homogeneous>

We record two consequences of the common clipped construction that will be useful for comparing midpoint bounds. Here $X$ is the finite-height forest dual, and $H$ is a finite ancestral head.

#thm([Proposition 10.4.])[
  #emph[If $x = P_H x$ and $y = Q_H y$, then 
#[#set math.equation(numbering: n => "(10.9)")
 $ max_plus.minus parallel x plus.minus y parallel gt.eq sqrt(parallel x parallel^2 + parallel y parallel^2 \/ 12) . $ <dir:primal:add:optimized>]

 If $0 < sigma lt.eq 1$ and $w \, Z_1 \, Z_2 \, dots.h in X$ satisfy $parallel w plus.minus Z_j parallel lt.eq 1$ and $parallel Z_j - Z_l parallel gt.eq 2 sigma$ for $j eq.not l$, then $parallel w parallel lt.eq 1 - sigma^2 \/ 24$.]
] <dir:primal:add:head-tail-lens>

#proof[
  In (10.8), put $t = 1$ and $s = parallel y parallel \/ \( 6 parallel x parallel \)$ when both vectors are nonzero. This gives (10.9). If $y = 0$ the assertion is equality; if $x = 0$, it follows from $parallel y parallel gt.eq parallel y parallel \/ sqrt(12)$.
  For the second assertion, given $epsilon > 0$, choose $H$ with $parallel w - P_H w parallel lt.eq epsilon$. The bounded sequence $P_H Z_j$ has two distinct terms for which $h = \( Z_j - Z_l \) \/ 2$ satisfies $parallel P_H h parallel lt.eq epsilon$. Then $parallel h parallel gt.eq sigma$ and $parallel w plus.minus h parallel lt.eq 1$ by convexity. Formula (10.8) at $P_H w \, Q_H h$, again with $t = 1$, gives
  $ \( 1 + 2 epsilon \) sqrt(1 + 3 s^2) gt.eq parallel w parallel - epsilon + s / 2 \( sigma - epsilon \) . $
  Let $epsilon arrow.b 0$, put $s = sigma \/ 6$, and use $sqrt(1 + 3 s^2) lt.eq 1 + 3 s^2 \/ 2$. This retains the stated $1 \/ 24$ loss. ◻
]

=== 10.3 Three ways to retain a useful sign <clip:selection>

We return to both choices of $Z$ for the three selection procedures below.

The two global clips retain half the original pairing in a single endpoint test. Sometimes the construction selects signs before it chooses that endpoint. The resulting extra loss records a different selection mechanism.

#thm([Proposition 10.5.])[
  (Selection before testing).  #emph[Suppose $x = P_H x$, $parallel x parallel = 1$, $y in ker P_H$, and $v = Q_H v$, $rho \( v \) lt.eq 1$, and $y \( v \) > parallel y parallel \/ 2$. For every $s > 0$, each of the following constructions produces an exterior test $w$ with 
$ \| y \( w \) \| > parallel y parallel \/ 8 \, #h(2em) rho \( w \) lt.eq 1 \, #h(2em) rho \( f + s w \)^2 lt.eq 1 + 3 s^2 \, $

 where $f = P_H f$ norms $x$ and the inward signs are chosen with full cone budgets $q_g$.]
  + #emph[Take the positive and negative cumulative parts globally, choose one by its total pairing, then retain one of the two groups of cones having the same prescribed inward sign.]
  + #emph[Form all four combinations of a cumulative positive/negative part and a prescribed inward-sign group, and select one by its pairing.]
  + #emph[Choose a cumulative part separately in each cone, orient it inward, then retain the cones on which the resulting pairings have one common sign.]
] <clip:selection-prop>

#proof[
  The exterior-test requirement loses no norming accuracy: replacing any finite test $v$ by $Q_H v$ preserves $y \( v \)$ and cannot increase $rho \( v \)$. Let $v^(+) \, v^(-)$ be the successive differences of $max \( V_g \, 0 \)$ and $max \( - V_g \, 0 \)$ on each cone. Both have nonnegative root prefixes, $v = v^(+) - v^(-)$, and each segment sum is dominated in absolute value by the corresponding $v$-sum.
  For the first construction choose $q in { v^(+) \, v^(-) }$ with $\| y \( q \) \| > parallel y parallel \/ 4$. Partition its cones by $sigma_g = 1$ and $sigma_g = - 1$, writing $q = q_(+) + q_(-)$. One part has pairing of absolute value greater than $parallel y parallel \/ 8$. For that sign $sigma$ put $w = sigma q_sigma$. This last sign makes its root prefixes inward; the eventual endpoint sign is chosen from the sign of $y \( w \)$. These two choices must not be confused.
  For the second construction form $w_(sigma \, +) = sigma v^(+) upright(bold(1))_({ sigma_g = sigma })$ and $w_(sigma \, -) = sigma v^(-) upright(bold(1))_({ sigma_g = sigma })$ for $sigma in { - 1 \, 1 }$. Then $v = sum_sigma sigma \( w_(sigma \, +) - w_(sigma \, -) \)$. The triangle inequality for their four pairings gives the claimed $1 \/ 8$ bound for one of them. Each of the four was fixed before the endpoint was selected.
  For the third construction write $v_g = v upright(bold(1))_(U_g)$. In each nonzero cone select $q'_g$ from the two cumulative parts so that $\| y \( q'_g \) \| gt.eq \| y \( v_g \) \| \/ 2$. Reverse the selected part if necessary to make its root prefixes inward. Call the oriented test $r_g$. Then
  $ sum_g \| y \( r_g \) \| gt.eq 1 / 2 sum_g \| y \( v_g \) \| gt.eq 1 / 2 y \( v \) > parallel y parallel \/ 4 . $
  Keep either the positive-pairing cones or the negative-pairing cones, whichever has larger total absolute pairing, and sum their $r_g$. This loses another factor two. The selected half in each cone can differ; this procedure is not the choice of one of two fixed global clips.
  In all three constructions, masking cones and reversing complete cone pieces preserves the same-segment absolute-sum domination. Thus $rho \( w \) lt.eq rho \( v \)$ and all prefix signs are inward. Lemma 19 proves the test-cost bound. ◻
]

For each selection procedure the selected endpoint satisfies

#[#set math.equation(numbering: n => "(10.10)")
 $ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 + s t parallel y parallel \/ 8, sqrt(1 + 3 s^2)) \, $ <clip:eighth-ratio>]

and the other endpoint has norm at least one. If $parallel y parallel gt.eq 1$, then for every fixed $t > 0$ the ratio exceeds one by a uniform amount when $s > 0$ is sufficiently small. The previously described center approximation then gives a uniform positive averaged gain. This route spends a second factor two to impose the selected sign; the paired procedure uses both test evaluations instead.

=== 10.4 Selection order and whole-crossing replacement <dir:primal:add:selection>

In this subsection we specialize to the finite-height forest dual $X$. The constructions in Proposition 23 allow two further choices worth distinguishing. The first chooses its prefix budget only after selecting a global clipped part. The second pays for a whole crossing square with a single shortened head segment.

===== 10.4.1 Choosing the budget after a global clip. <dir:primal:add:global>

Let $0 < t lt.eq 1$, $parallel x parallel = 1$, and put $eta = t^2 \/ 1000$. Choose a finite ancestral $H$ with $parallel Q_H x parallel < eta$, and a head test $f$ with $rho \( f \) lt.eq 1$, $x \( f \) > 1 - 2 eta$. For $z in ker P_H$ with $parallel z parallel gt.eq t$, choose a finite unit-ball tail test $v$ with $z \( v \) > 3 t \/ 4$. Take positive and negative cumulative parts as in Proposition 23. One global part $q$ has $\| z \( q \) \| > 3 t \/ 8$; all its root prefixes are nonnegative. Now assign to each cone the prefix maximum of $q$, rather than that of $v$,

$ M_g = max_(u in U_g) q \( \[ g \, u \] \) \, #h(2em) sum_g M_g^2 lt.eq 1 . $

With $s = t \/ 32$, choose the inward sign from the shortest head suffix of magnitude at least $s M_g$, taking a default sign when $M_g = 0$, there is no parent, or there is no qualifying suffix. One of the two sign classes of cones retains absolute pairing greater than $3 t \/ 16$. Multiply that class by its common inward sign, and call it $w$. Then $rho \( w \) lt.eq 1$. Lemma 19, applied with baseline $q$ and its own prefix budgets, gives $rho \( f + s w \)^2 lt.eq 1 + 3 s^2$. Since $\| x \( w \) \| < eta$ and $z \( f \) = 0$,

#[#set math.equation(numbering: n => "(10.11)")
 $ max_plus.minus parallel x plus.minus z parallel gt.eq frac(1 - 2 eta - s eta + 3 s t \/ 16, sqrt(1 + 3 s^2)) gt.eq 1 + t^2 \/ 1000 . $ <dir:primal:add:global-gain>]

Indeed, after replacing the denominator by $1 + 3 s^2 \/ 2$, the numerator minus $\( 1 + t^2 \/ 1000 \) \( 1 + 3 s^2 \/ 2 \)$, divided by $t^2$, is

$ 3 / 512 - 3 / 1000 - t / 32000 - 3 / 2048 - frac(3 t^2, 2048000) gt.eq 2789 / 2048000 > 0 . $

Thus this order of selection keeps both losses $3 t \/ 8$ and $3 t \/ 16$.

===== 10.4.2 One head piece for a whole crossing. <dir:primal:add:whole-crossing>

Take a finite head test $f$ with $rho \( f \) lt.eq 1$, a unit $y in ker P_H$, and a finite tail test $v$ with $rho \( v \) lt.eq 1$, $y \( v \) > 1 \/ 2$. The third construction in the proof of Proposition 23 uses only $f$ and these tests, before any center is evaluated. With full cone budgets $q_g$ and threshold $s q_g$, it produces $w$ with $rho \( w \) lt.eq 1$, $\| y \( w \) \| > 1 \/ 8$, and inward root prefixes of magnitude at most $q_g$.

Consider a crossing segment with head $P$, and put $A = f \( P \)$, $B = w \( \[ g \, u \] \)$. If its cone is unselected or $B = 0$, keep the head square. Otherwise $q_g > 0$. If $\| A \| < s q_g$, its whole square is at most $A^2 + 3 s^2 q_g^2$. If $\| A \| gt.eq s q_g$, the selected suffix $I subset.eq P$, with sum $C = f \( I \)$, exists. When $A$ and $C$ have the same sign, the inward tail cancels and $\| A + s B \| lt.eq \| A \|$. With opposite signs, $I$ is proper and

$ \| f \( P \\ I \) \| = \| A \| + \| C \| gt.eq \| A + s B \| . $

In that case replace the whole head test by its preceding piece. All retained head pieces are disjoint. Small crossings cost at most $3 s^2 sum_g q_g^2$, and wholly exterior segments cost at most $s^2$. We have proved, directly by whole-crossing replacement,

#[#set math.equation(numbering: n => "(10.12)")
 $ rho \( f + s w \)^2 lt.eq 1 + 4 s^2 . $ <dir:primal:add:four-cost>]

This differs from paying the cross term and tail square separately in (10.6).

For an actual unit center $x$, take $s = t \/ 64$ and $eta = min { 1 \/ 2 \, t s \/ \[ 32 \( 1 + s \) \] }$, for any $t > 0$. Choose $f$ finite with $rho \( f \) lt.eq 1$, $x \( f \) > 1 - eta$, and a finite coordinate approximation $x_0$ within $eta$ of $x$. Choose $H$ to contain both supports and their ancestors. For each unit tail $y$, the selected $w$ above satisfies $\| x \( w \) \| < eta$. Hence

#[#set math.equation(numbering: n => "(10.13)")
 $ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 - \( 1 + s \) eta + t s \/ 8, sqrt(1 + 4 s^2)) gt.eq frac(1 + 3 t s \/ 32, 1 + t s \/ 32) > 1 . $ <dir:primal:add:four-gain>]

The last step uses $2 s^2 = t s \/ 32$.

=== 10.5 Direct estimates at an approximate center <clip:approximate-center>

Here $Z$ again denotes either coordinate model. We record the error calculation because it permits the tests to be chosen at the actual center, and it distinguishes paired testing from selection of one endpoint. Let $parallel x parallel = 1$, let $x_0 = P_H x_0$ with $parallel x - x_0 parallel lt.eq epsilon$, and choose a head test $f$ with $rho \( f \) lt.eq 1$. Suppose

$ x \( f \) gt.eq 1 - kappa epsilon \, #h(2em) y in ker P_H \, #h(2em) parallel y parallel gt.eq 1 . $

Every exterior unit test $w$ satisfies $\| x \( w \) \| lt.eq epsilon$. If a selected inward test has $\| y \( w \) \| gt.eq theta$, then

#[#set math.equation(numbering: n => "(10.14)")
 $ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 - kappa epsilon - s epsilon + s t theta, sqrt(1 + 3 s^2)) \, #h(2em) min_plus.minus parallel x plus.minus t y parallel gt.eq 1 - kappa epsilon . $ <clip:approx-selected>]

These follow by evaluating on $f + s w$ with the chosen endpoint sign, and on $f$ itself. If $v = h_1 - h_2$ and $y \( v \) gt.eq theta$, testing both endpoints instead gives

#[#set math.equation(numbering: n => "(10.15)")
 $ frac(parallel x + t y parallel + parallel x - t y parallel, 2) gt.eq frac(1 - kappa epsilon - s epsilon + s t theta \/ 2, sqrt(1 + 3 s^2)) . $ <clip:approx-paired>]

Here the tail pairings combine exactly to $y \( v \)$, while the average of the two center errors is bounded below by $- s epsilon$. If one instead works first at $x_0$, with $x_0 \( f \) gt.eq 1 - 2 epsilon$, and then transfers the norm estimate back to $x$, the corresponding paired bound is

#[#set math.equation(numbering: n => "(10.16)")
 $ frac(parallel x + t y parallel + parallel x - t y parallel, 2) gt.eq frac(1 - 2 epsilon + s t theta \/ 2, sqrt(1 + 3 s^2)) - epsilon . $ <clip:finite-transfer>]

===== 10.5.1 Choosing the test size before its accuracy. <clip:ordered-accuracy>

The formulas also prove positivity without choosing a numerical test size in advance. With a half-norming tail and one global clip, first choose $0 < s < 1$ so that $\( 1 + s t \/ 4 \) \/ sqrt(1 + 3 s^2) > 1$. Then choose the center and head-test accuracy $epsilon$ small enough that

$ 1 / 2 [frac(1 - epsilon - s epsilon + s t \/ 4, sqrt(1 + 3 s^2)) + 1 - epsilon] > 1 . $

The head normer and its finite approximation are chosen to this accuracy, and the cofinite subspace annihilates the resulting head. The choices depend on $t$, not on the unit tail. Their order separates the quadratic test cost from the approximation error.

===== 10.5.2 Using a norming-functional kernel. <clip:norming-kernel>

Let $ell in Z^(*)$ norm the actual center $x$, and use $F = ker P_H ∩ ker ell$. Then both endpoints have norm at least one, without a center error in that conclusion. A tail test with pairing above $3 \/ 4$ supplies one global clip with pairing above $3 \/ 8$. Choosing a head test with $x \( f \) gt.eq 1 - 3 epsilon$, formula (10.14) gives

$ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 - 3 epsilon - s epsilon + 3 s t \/ 8, sqrt(1 + 3 s^2)) . $

Averaging this bound with one exploits information from the added kernel that the finite-coordinate conditions alone do not supply.

===== 10.5.3 Testing the two endpoints directly. <clip:direct-paired>

For a half-norming tail, the difference decomposition and two head-plus-tail tests instead give

$ frac(parallel x + t y parallel + parallel x - t y parallel, 2) gt.eq frac(1 - 3 epsilon - s epsilon + s t \/ 4, sqrt(1 + 3 s^2)) . $

Here the tail gain is the pairing of the original tail test, divided by two; the center errors are estimated before averaging. Thus this procedure controls the sum directly. Formula (10.16) records the other order: test a finite approximant first, then transfer both endpoint norms to the actual center.

===== 10.5.4 Separating crossing and wholly exterior budgets. <clip:constant-four>

For full-cone budgets, keep the sum decomposition $v = k_1 + k_2$. One may bound a crossing by its retained or split head square plus $3 s^2 q_g^2$: $2 s^2 q_g^2$ pays the small cross term and $s^2 q_g^2$ pays its tail square. Sum over crossings and then pay at most another $s^2$ for all wholly exterior segments. This gives

$ rho \( f + s k_1 \)^2 \, med rho \( f - s k_2 \)^2 lt.eq 1 + 4 s^2 . $

With a half-norming tail and a finite-center test of value at least $1 - 2 eta$, paired testing followed by center transfer therefore gives

$ frac(parallel x + t y parallel + parallel x - t y parallel, 2) gt.eq frac(1 - 2 eta + s t \/ 4, sqrt(1 + 4 s^2)) - eta . $

First choose $s > 0$ so that the ratio at $eta = 0$ exceeds one, then choose $eta$ from this positive gap. This retains the separate crossing and exterior accounting, including its constant $4$.

== 11 Frontier shifts and separated families <sec:primal-additions>

=== 11.1 A selected frontier shift <clip:frontier>

Cumulative clipping changes the increments only where the original test is supported. The next construction instead places a compensating value at each relevant gate. Its two possible perturbations recover the original tail through their difference, while the selected-endpoint argument keeps only half of the resulting maximum excess.

#thm([Proposition 11.1.])[
  (Frontier shift and selected endpoint).  #emph[For finite $f = P_H f$ and $v = Q_H v$ with $rho \( f \) \, rho \( v \) lt.eq 1$, and every $s > 0$, there is a finitely supported gate vector $a$ such that 
#[#set math.equation(numbering: n => "(11.1)")
 $ rho \( a \) lt.eq 1 \, #h(2em) rho \( a plus.minus v \) lt.eq 2 \, #h(2em) rho #scale(x: 120%, y: 120%)[\(] f + s \( a plus.minus v \) #scale(x: 120%, y: 120%)[\)]^2 lt.eq 1 + 12 s^2 . $ <clip:frontier-tests>]

 For either $Z = B_oo$ or the finite-height forest space, this selected-endpoint method gives 
#[#set math.equation(numbering: n => "(11.2)")
 $ hat(delta)_Z \( t \) gt.eq frac(sqrt(1 + t^2 \/ 48) - 1, 4) #h(2em) \( 0 < t < 1 \) . $ <clip:frontier-modulus>]

]
] <clip:frontier-prop>

#proof[
  Put $q_g = rho \( v upright(bold(1))_(U_g) \)$, so $sum_g q_g^2 lt.eq 1$. At each attached gate with $q_g > 0$, choose the shortest head suffix of magnitude at least $2 s q_g$, if one exists, and let $tau_g$ be its sign. Otherwise use $tau_g = 1$. Set $a \( g \) = - tau_g q_g$ at the gates and zero elsewhere. The gates form an antichain, so $rho \( a \)^2 = sum_g q_g^2 lt.eq 1$. For $w = a plus.minus v$, every root prefix at $g$ has sign $- tau_g$ or is zero, and magnitude at most $2 q_g$. Also $rho \( w \) lt.eq 2$.
  In a disjoint testing family write the head and tail sums as $A_i \, B_i$. The pure tail contribution $s^2 sum_i B_i^2$ is at most $4 s^2$. A positive cross term with $\| A_i \| < 2 s q_g$ costs at most $8 s^2 q_g^2$. Their total is at most $8 s^2$. For a larger positive term the selected suffix has sum $C_i$ opposite to $A_i$ and magnitude at least $2 s q_g$. Splitting it off gains
  $ \( A_i - C_i \)^2 + C_i^2 - A_i^2 gt.eq 4 s \| A_i \| q_g gt.eq 2 s A_i B_i . $
  The simultaneous cuts are disjoint, so all these larger terms are paid by the head norm. This proves (11.1). Unattached roots contribute only to the pure tail budget.
  For a finite unit center choose its head normer $f$ and a half-norming exterior test $v$, so $\| y \( v \) \| gt.eq 1 \/ 2$ for $parallel y parallel gt.eq 1$. One of $a + v \, a - v$ has pairing of absolute value at least $\| y \( v \) \|$, because their difference is $2 v$. Selecting that test and then the endpoint sign gives
  $ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 + s t \/ 2, sqrt(1 + 12 s^2)) . $
  Take $s = t \/ 24$. The ratio equals $sqrt(1 + t^2 \/ 48)$; testing on $f$ makes the other endpoint at least one. Finally approximate an arbitrary unit center within one quarter of this ratio’s excess. The average retains precisely the lower bound in (11.2). ◻
]

=== 11.2 An independent suffix threshold for root shifts <dir:primal:add:root-shifts>

A root shift can be chosen with a suffix threshold independent of the size by which the shifted test is later multiplied. This retains a rational estimate and also permits prefix-maximum root weights.

#thm([Lemma 11.2.])[
  #emph[On either the finite-height forest or the infinite tree, let $f = P_H f$, $v = Q_H v$ be finite tests with $rho \( f \) \, rho \( v \) lt.eq 1$. Let finitely many $a_g gt.eq 0$ satisfy $sum_g a_g^2 lt.eq 1$ and $\| v \( \[ g \, u \] \) \| lt.eq a_g$ on every root prefix. Fix $alpha > 0$. For $a_g > 0$, choose the shortest attached head suffix of magnitude at least $alpha a_g$, if one exists, and let $tau_g$ be its sign; otherwise put $tau_g = 1$. Strict thresholds may be used instead. Set 
$ a = - sum_g tau_g a_g e_g \, #h(2em) h_(+) = a + v \, #h(2em) h_(-) = a - v . $

 For $h in { a \, h_(+) \, h_(-) }$ and $0 < c lt.eq alpha \/ 2$, 
#[#set math.equation(numbering: n => "(11.3)")
 $ rho \( h \) lt.eq 2 \, #h(2em) rho \( f + c h \)^2 lt.eq 1 + 4 c alpha + 4 c^2 . $ <dir:primal:add:independent-cost>]

 Both the full cone norms $q_g$ and the prefix maxima $m_g$ may be used for $a_g$.]
] <dir:primal:add:independent-threshold>

#proof[
  Since the gates form an antichain, $rho \( a \)^2 = sum_g a_g^2 lt.eq 1$. Each root prefix of $h$ has sign $- tau_g$ or is zero and magnitude at most $2 a_g$, and $rho \( h \) lt.eq 2$. Zero weights give zero cross terms; unattached roots have no head crossing.
  For a disjoint test family write $A_i \, B_i$ for head and tail sums and $L = sum_i A_i^2 lt.eq 1$. Small positive products, with $\| A_i \| lt.eq alpha a_g$, have total at most $2 alpha$. For every other positive product, the simultaneous suffix cuts in (10.4) release at least $2 \| A_i \| alpha a_g$. Their total release is at most $1 - L$, whereas $\| B_i \| lt.eq 2 a_g$. Thus the large positive products total at most $\( 1 - L \) \/ alpha$. Since $sum_i B_i^2 lt.eq 4$,
  $ sum_i \( A_i + c B_i \)^2 lt.eq L + 2 c #scale(x: 120%, y: 120%)[\(] 2 alpha + \( 1 - L \) \/ alpha #scale(x: 120%, y: 120%)[\)] + 4 c^2 lt.eq 1 + 4 c alpha + 4 c^2 . $
  This uses precisely $2 c lt.eq alpha$. Strict thresholds use the same small class, including equality. Formula (10.1) verifies both proposed choices of weights. ◻
]

The next two endpoint estimates concern the finite-height forest dual $X$.

===== 11.2.1 The rational gap. <dir:primal:add:rational>

At a finite unit center take its head normer $f$, and a finite tail normer $v$ with $rho \( v \) = 1$ and $y \( v \) > 1 \/ 2$, for unit $y in ker P_H$. Use $a_g = q_g$, so $sum_g q_g^2 = 1$. The difference $h_(+) - h_(-) = 2 v$ gives one $\| y \( h \) \| > 1 \/ 2$. The mixed head–tail pairings vanish, and

$ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 + c t \/ 2, sqrt(1 + 4 c alpha + 4 c^2)) gt.eq frac(1 + c t \/ 2, 1 + 2 c alpha + 2 c^2) . $

Choose $alpha = t \/ 16$, $c = t \/ 32$, for any $t > 0$. The ratio equals $1 + d_0 \( t \)$, where

$ d_0 \( t \) = frac(5 t^2, 512 + 3 t^2) . $

Approximation of any unit center by a finite unit center within $d_0 \( t \) \/ 2$ retains gain $d_0 \( t \) \/ 2$, with the same finite-coordinate annihilator.

===== 11.2.2 Prefix weights at the actual center. <dir:primal:add:root-actual>

Fix $t > 0$, $0 < c < t \/ 6$, and put $L_c = sqrt(1 + 12 c^2)$, $b = 1 + c t - L_c > 0$. Choose

$ 0 < eta < min { 1 \, b \/ \[ 2 \( 1 + c t + 2 c \) \] } \, #h(2em) gamma = b \/ \( 2 L_c \) . $

For any unit $x$, choose a finite ancestral $H$ with $parallel Q_H x parallel < eta$ and a head test $f$ with $rho \( f \) lt.eq 1$, $x \( f \) gt.eq 1 - eta$. For a unit $y in ker P_H$, choose a finite tail test $v$ with $rho \( v \) lt.eq 1$, $y \( v \) > 1 - eta$. In Lemma 25, use prefix weights $a_g = m_g$, strict threshold $alpha = 2 c$, and the deepest qualifying starting vertex, which is the shortest qualifying suffix. One $h in { h_(+) \, h_(-) }$ has $\| y \( h \) \| > 1 - eta$, while $\| x \( h \) \| < 2 eta$. Consequently

#[#set math.equation(numbering: n => "(11.4)")
 $ max_plus.minus parallel x plus.minus t y parallel gt.eq frac(1 - eta + c \( \( 1 - eta \) t - 2 eta \), sqrt(1 + 12 c^2)) > 1 + gamma . $ <dir:primal:add:root-actual-gain>]

Indeed $L_c lt.eq 1 + 6 c^2 < 1 + c t$, and the numerator is $L_c + b - eta \( 1 + c t + 2 c \) > L_c + b \/ 2$.

=== 11.3 Two tests for a bounded separated family <dir:primal:add:fixed-bound>

The final variant uses a tail witness selected from an entire separated family. Its member need not annihilate the head. Testing the two endpoints with different primal vectors cancels that unknown head evaluation.

#thm([Proposition 11.3.])[
  #emph[For each $D gt.eq 1$, there exists $c_D > 0$ such that, if $x \, z_i in X$, $1 lt.eq parallel x parallel lt.eq D$, $parallel z_i parallel lt.eq 2 D$, and $parallel z_i - z_j parallel gt.eq 1$ for distinct indices in an infinite sequence, then some $i$ satisfies $max_plus.minus parallel x plus.minus z_i parallel > parallel x parallel + c_D$.]
] <dir:primal:add:separated>

#proof[
  First choose $c > 0$, depending only on $D$, with $D \( sqrt(1 + 16 c^2) - 1 \) < c \/ 16$, and then choose $0 < eta < c \/ \[ 64 \( 1 + c \) \]$. Choose a head $H$, a head test $f$, and a center tail error so that $rho \( f \) lt.eq 1$, $x \( f \) > parallel x parallel - eta$, and $parallel Q_H x parallel < eta$. Boundedness in the finite-dimensional head gives distinct indices with $parallel P_H \( z_i - z_j \) parallel < 1 \/ 4$, hence their tail difference has norm greater than $3 \/ 4$. A finite tail test $v$, $rho \( v \) lt.eq 1$, has $\| \( z_i - z_j \) \( v \) \| > 1 \/ 2$. Rename one index so $\| z_i \( v \) \| > 1 \/ 4$.
  Use prefix weights $a_g = m_g$ and strict threshold $2 c m_g$ in Lemma 25. The two perturbations $h_0 = a$, $h_1 = a + v$ differ by $v$, have norms at most one and two, and have the same inward prefix signs with magnitudes at most $2 m_g$. One choice $h$ has $\| z_i \( h \) \| > 1 \/ 8$. We retain the following direct whole-crossing estimate:
  #[#set math.equation(numbering: n => "(11.5)")
   $ rho \( f + c h \)^2 lt.eq 1 + 16 c^2 . $ <dir:primal:add:sixteen>]
  For a crossing write its entire sum as $A + B$, where $B$ already includes the factor $c$, so $\| B \| lt.eq 2 c m_g$. If $\| A \| lt.eq 2 c m_g$, its square is at most $A^2 + 12 c^2 m_g^2$. If $\| A \| > 2 c m_g$ and $A B lt.eq 0$, it is at most $A^2$. Otherwise the chosen suffix has sum $C$ opposite to $A$, with $\| C \| > 2 c m_g gt.eq \| B \|$, and
  $ \( A - C \)^2 + C^2 = A^2 + 2 \| A \| \| C \| + 2 C^2 gt.eq \( A + B \)^2 . $
  The simultaneous head cuts remain disjoint. Crossings and wholly head segments therefore cost at most $1 + 12 c^2$; wholly tail segments add at most $c^2 rho \( h \)^2 lt.eq 4 c^2$. This proves (11.5).
  Put $M = max_plus.minus parallel x plus.minus z_i parallel$, and choose $epsilon.alt in { - 1 \, 1 }$ so that $epsilon.alt z_i \( h \) = \| z_i \( h \) \|$. Test $x + epsilon.alt z_i$ on $f + c h$, and $x - epsilon.alt z_i$ on $f$, and add. The head evaluations of $z_i$ cancel. With $L = sqrt(1 + 16 c^2)$, this gives
  #[#set math.equation(numbering: n => "(11.6)")
   $ M \( 1 + L \) gt.eq 2 \( parallel x parallel - eta \) + c \( 1 \/ 8 - 2 eta \) . $ <dir:primal:add:two-test>]
  Here $x \( h \) > - 2 eta$. It follows that
  $ \( 1 + L \) \( M - parallel x parallel \) > c \/ 16 - 2 eta \( 1 + c \) > c \/ 32 . $
  Thus $c_D = c \/ \[ 32 \( 1 + L \) \]$ works. The parameter choice depends on the fixed bound $D$; no unit-tail hypothesis on the selected $z_i$ was used. ◻
]

== 12 A radial deficit and separate endpoint laws <sec:radial>

After normalizing the lens radius to one, this argument uses the norm-one head-test sums $p \( S_i \)$ as replacement coefficients; the joint-budget proof used $parallel x parallel p \( S_i \)$. Estimating the coefficient change and squared-test slack separately gives a radial-deficit bound. The same calculation then controls each endpoint law.

#thm([Proposition 12.1.])[
  (A radial-deficit estimate).  #emph[For a finite ancestral $H$, $x = P_H x$, and arbitrary $y in X$ with $parallel x plus.minus y parallel lt.eq R$, one has 
#[#set math.equation(numbering: n => "(12.1)")
 $ parallel Q_H y parallel lt.eq \( sqrt(2) + sqrt(6) \) sqrt(R \( R - parallel x parallel \)) . $ <eq:atomic-tail>]

]
] <thm:tail>

#proof[
  If $R = 0$, both vectors vanish. If $x = 0$, contractivity of $Q_H$ gives $parallel Q_H y parallel lt.eq R$, which implies the theorem. In the remaining case, scale to $R = 1$ and put $d = 1 - parallel x parallel$. By Lemma 7, choose a norming test $p = P_H p$ with $rho \( p \) = 1$ and $x \( p \) = parallel x parallel$.
  Fix a finite ancestral $K supset H$. Represent each of $P_K \( x + y \)$ and $P_K \( x - y \)$ as a finite convex combination of atoms, as supplied by Lemma 7. On a finite probability space choose a uniform sign $sigma in { - 1 \, 1 }$ and conditionally choose a represented atom $A = sum_i a_i d_(S_i)$ from the corresponding combination. Then
  $ bb(E) A = x \, #h(2em) bb(E) \( sigma A \) = P_K y . $
  For each outcome set $b_i = p \( S_i \)$, $A^compose = sum_i b_i d_(S_i)$, and $L = 1 - sum_i b_i^2$. Replacing the original coefficients by these segment sums has the joint error estimate
  $ L + sum_i \( a_i - b_i \)^2 = 1 + sum_i a_i^2 - 2 A \( p \) lt.eq 2 \( 1 - A \( p \) \) . $
  Taking expectations and applying (4.1) gives
  #[#set math.equation(numbering: n => "(12.2)")
   $ bb(E) L lt.eq 2 d \, #h(2em) bb(E) parallel A - A^compose parallel lt.eq sqrt(2 d) . $ <eq:mixture-error>]
  We have paid for coefficient replacement. It remains to control the tail of the replaced signed mean. At a gate $g$, let $b \( g \)$ be the crossing sum of the represented family, or zero. Segments entirely outside $H$ have replaced coefficient zero. Thus $A^compose \( e_g \) = b \( g \)$ and its restriction to $J \( U_g \)$ has norm at most $\| b \( g \) \|$. Define finite gate vectors
  $ h \( g \) = bb(E) b \( g \) \, #h(2em) m \( g \) = bb(E) \| b \( g \) \| . $
  Because $x \( e_g \) = 0$, Lemma 3 and (12.2) give $parallel h parallel_2 lt.eq sqrt(2 d)$. Take two independent copies of the atom data. Lemma 9 and independence yield
  $ parallel m parallel_2^2 - parallel h parallel_2^2 & = bb(E) sum_g #scale(x: 120%, y: 120%)[\(] \| b \( g \) b' \( g \) \| - b \( g \) b' \( g \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq bb(E) \( L + L' \) lt.eq 4 d . $
  Consequently $parallel m parallel_2 lt.eq sqrt(6 d)$. By the cone identity (2.1),
  $ parallel Q_H bb(E) \( sigma A^compose \) parallel lt.eq parallel m parallel_2 lt.eq sqrt(6 d) . $
  Its distance to $Q_H P_K y$ is at most $sqrt(2 d)$ by (12.2). Let $K$ increase through an ancestral exhaustion. Lemma 2 gives $P_K y arrow.r y$, proving (12.1) for $R = 1$. Scaling gives the stated theorem. ◻
]

=== 12.1 A maximum bound from the radial estimate <a-maximum-bound-from-the-radial-estimate>

The radial estimate also gives a bound for the maximum-based modulus defined in (7.1), with a weaker constant than the joint-budget estimate. We retain this calculation to record the effect of the alternative normalization.

#thm([Corollary 12.2.])[
  #emph[For the specified dual norm on $X$, 
$ overline(theta)_X \( t \) gt.eq frac(sqrt(1 + t^2 \/ 4) - 1, 2) #h(2em) \( t > 0 \) . $

]
] <cor:max-modulus>

#proof[
  For a finite-head unit vector $u = P_H u$ and unit $y in ker P_H$, put $R = max { parallel u + t y parallel \, parallel u - t y parallel }$. Convexity gives $R gt.eq 1$. Since $\( sqrt(2) + sqrt(6) \)^2 < 16$, Proposition 27 implies $t^2 lt.eq 16 R \( R - 1 \)$. Solving this quadratic inequality gives the asserted lower bound for $R - 1$.
  For an arbitrary unit $x$, choose an ancestral head $H$ with $parallel Q_H x parallel < eta < 1$. Then $u = P_H x \/ parallel P_H x parallel$ is well defined and $parallel x - u parallel < 2 eta$. The preceding bound for $R - 1$, diminished by $2 eta$, therefore holds for all unit $y in ker P_H$ with center $x$. Take the infimum over these $y$, the supremum over finite-codimensional subspaces, and then let $eta arrow.b 0$. The bound is independent of $x$, so the final infimum proves the corollary. ◻
]

=== 12.2 Keeping the endpoint laws separate <keeping-the-endpoint-laws-separate>

The proof of Proposition 27 estimates a signed mixture of the two atom laws. It does not require a small replacement error for either conditional law separately. The next proposition supplies that representation-level information.

#thm([Proposition 12.3.])[
  #emph[Let $0 lt.eq d < 1$, let $H$ be finite and ancestral, and suppose $x = P_H x$, $parallel x parallel gt.eq 1 - d$, and $parallel x plus.minus y parallel lt.eq 1$. Fix a head norming test $p$ with $rho \( p \) = 1$ and $x \( p \) = parallel x parallel$, and a finite ancestral set $K supset H$. For each $tau in { - 1 \, 1 }$ choose any finite represented atom law with mean $P_K \( x + tau y \)$, and denote its expectation by $bb(E)_tau$. For an atom $A = sum_i a_i d_(S_i)$, put $b_i = p \( S_i \)$, $A^compose = sum_i b_i d_(S_i)$, and $L = 1 - sum_i b_i^2$. Then 
#[#set math.equation(numbering: n => "(12.3)")
 $ bb(E)_tau #h(-1em) [L + sum_i \( a_i - b_i \)^2] lt.eq 4 d \, #h(2em) bb(E)_tau parallel A - A^compose parallel lt.eq 2 sqrt(d) . $ <eq:endpoint-coefficients>]

 If $b \( g \)$ is the replaced crossing sum at gate $g$, put $m_tau \( g \) = bb(E)_tau \| b \( g \) \|$ and $m = \( m_1 + m_(- 1) \) \/ 2$. These nonnegative vectors satisfy 
#[#set math.equation(numbering: n => "(12.4)")
 $ m_tau lt.eq 2 m upright(" coordinatewise") \, #h(2em) parallel m parallel_2 lt.eq sqrt(6 d) . $ <eq:endpoint-gates>]

]
] <prop:endpoint>

#proof[
  The test exists by Lemma 7, since $parallel x parallel gt.eq 1 - d > 0$. Both endpoint evaluations on $p$ are at most one, so $\| y \( p \) \| lt.eq 1 - parallel x parallel lt.eq d$ and $\( x plus.minus y \) \( p \) gt.eq 1 - 2 d$. The coefficient identity from the proof of Proposition 27 gives
  $ bb(E)_tau #h(-1em) [L + sum_i \( a_i - b_i \)^2] lt.eq 2 #scale(x: 120%, y: 120%)[\(] 1 - \( x + tau y \) \( p \) #scale(x: 120%, y: 120%)[\)] lt.eq 4 d . $
  Equation (4.1) and Cauchy–Schwarz give the second bound in (12.3).
  Combine the laws with equal probabilities. Their mean is $x$, whose pairing with $p$ is at least $1 - d$. The coefficient and opposite-crossing calculation in the proof of Proposition 27 therefore gives $parallel m parallel_2 lt.eq sqrt(6 d)$. The coordinate inequality in (12.4) follows from $m = \( m_1 + m_(- 1) \) \/ 2$.
  These separate-law bounds also give a tail estimate directly. The cone identity implies
  $ parallel Q_H bb(E)_tau A^compose parallel lt.eq parallel m_tau parallel_2 lt.eq 2 sqrt(6 d) \, #h(2em) Q_H bb(E)_tau A = tau Q_H P_K y . $
  Thus (12.3) gives $parallel Q_H P_K y parallel lt.eq 2 sqrt(d) + 2 sqrt(6 d)$. Ancestral exhaustion yields
  $ parallel Q_H y parallel lt.eq \( 2 + 2 sqrt(6) \) sqrt(d) . $
  The larger constant records the cost of retaining the two conditional laws separately; Proposition 27 uses their signed mixture. ◻
]

== 13 Further consequences of the joint budget <sec:joint-consequences>

=== 13.1 Separate endpoint recovery and strict gauge representations <separate-endpoint-recovery-and-strict-gauge-representations>

The signed mixture in Theorem 1.1 can be replaced by the recovery of one conditional endpoint. This pays for the fact that a conditional absolute mass can be twice the mixed mass. The next statement keeps that loss explicit.

#thm([Proposition 13.1.])[
  #emph[Under the hypotheses of Theorem 1.1, assume in addition that $P_H y = 0$ and $r = parallel x parallel > 0$, and put $Delta = R^2 - r^2$. Fix a head norming test $p = P_H p$ with $rho \( p \) = 1$ and $x \( p \) = r$. For every finite ancestral $K supset H$ and each sign $tau in { - 1 \, 1 }$, choose any finite law of represented vectors 
$ A = sum_i a_i d_(S_i) \, #h(2em) sum_i a_i^2 lt.eq R^2 \, #h(2em) bb(E)_tau A = P_K \( x + tau y \) \, $

 where each represented family consists of disjoint segments. Put 
$ b_i = r p \( S_i \) \, #h(2em) A^compose = sum_i b_i d_(S_i) \, #h(2em) V = sum_i \( a_i - b_i \)^2 \, #h(2em) L = r^2 - sum_i b_i^2 . $

 These laws exist by the finite atomic-ball formula. For every such choice, the replacement satisfies 
#[#set math.equation(numbering: n => "(13.1)")
 $ bb(E)_tau \( V + L \) lt.eq Delta \, #h(2em) bb(E)_tau parallel Q_H \( A - A^compose \) parallel lt.eq sqrt(Delta) . $ <mol:eq:conditional-joint>]

 At each gate $g$, let $b \( g \)$ be the replaced crossing coefficient, or zero when there is no crossing segment. The mixed absolute crossing vector $m \( g \) = #scale(x: 120%, y: 120%)[\(] bb(E)_1 \| b \( g \) \| + bb(E)_(- 1) \| b \( g \) \| #scale(x: 120%, y: 120%)[\)] \/ 2$ satisfies $parallel m parallel_2 lt.eq sqrt(2 Delta)$. Consequently a separate endpoint argument, followed by ancestral exhaustion, yields 
#[#set math.equation(numbering: n => "(13.2)")
 $ parallel y parallel lt.eq \( 1 + 2 sqrt(2) \) sqrt(Delta) . $ <mol:eq:conditional-joint-tail>]

 If the same two nonnegative errors are bounded separately, without retaining their sum, the corresponding calculation gives 
#[#set math.equation(numbering: n => "(13.3)")
 $ parallel y parallel lt.eq \( 1 + 2 sqrt(3) \) sqrt(Delta) . $ <mol:eq:strict-gauge-tail>]

]
] <mol:prop:conditional-joint>

#proof[
  The head support of $p$ and $P_H y = 0$ imply $P_K \( x + tau y \) \( p \) = r$ for both signs. Expanding exactly as in (6.1) gives the first assertion of (13.1), and Cauchy–Schwarz gives the second. For the equal mixture, put $eta = bb(E) V$ and $theta = bb(E) L$. Then $eta + theta lt.eq Delta$, so $eta + 2 theta lt.eq 2 Delta$. Thus (6.3) bounds $parallel m parallel_2$ as asserted. Writing $m_tau \( g \) = bb(E)_tau \| b \( g \) \|$, positivity gives $m_tau lt.eq 2 m$ coordinatewise. Hence
  $ parallel Q_H bb(E)_tau A^compose parallel lt.eq parallel m_tau parallel_2 lt.eq 2 sqrt(2 Delta) . $
  The original conditional tail is $tau P_K y$. Adding its replacement error gives $parallel P_K y parallel lt.eq \( 1 + 2 sqrt(2) \) sqrt(Delta)$ for every finite ancestral $K supset H$. Along an ancestral exhaustion, $P_K y arrow.r y$ in norm, proving (13.2) for the completed vector.
  Alternatively, use only $eta lt.eq Delta$ and $theta lt.eq Delta$. Then $eta + 2 theta lt.eq 3 Delta$, and the identical endpoint recovery proves (13.3). This calculation is useful when starting from the gauge definition. First let $x$ and $y$ have finite coordinate support. For every $lambda > max { parallel x + y parallel \, parallel x - y parallel }$ there are finite convex representations with coefficient radii at most $lambda$. Carrying out the calculation with $lambda$ gives
  $ parallel y parallel lt.eq \( 1 + 2 sqrt(3) \) sqrt(lambda^2 - r^2) . $
  Letting $lambda arrow.b R$ gives (13.3), without assuming that the infimum in the gauge definition is attained. For a completed tail $y$, first apply this finite-coordinate argument to $P_K y$, where $K supset H$ is finite and ancestral. Contractivity bounds both projected endpoint norms by $R$, and $P_K x = x$. The resulting estimate for $P_K y$ passes to $y$ along an ancestral exhaustion, as in the preceding proof. ◻
]

=== 13.2 A radial deficit budget <a-radial-deficit-budget>

A different normalization puts both endpoints in the unit ball and replaces their coefficients by the norm-one head-test sums. In the notation of the original cancellation proof, let $d = 1 - parallel x parallel$. The joint estimate is $eta + theta lt.eq 2 d$, with $eta = bb(E) sum_i \( a_i - p \( S_i \) \)^2$ and $theta = bb(E) \( 1 - sum_i p \( S_i \)^2 \)$. Consequently

#[#set math.equation(numbering: n => "(13.4)")
 $ parallel m parallel_2^2 lt.eq eta + 2 theta lt.eq 4 d \, #h(2em) parallel Q_H y parallel lt.eq \( 2 + sqrt(2) \) sqrt(d) . $ <mol:eq:radial-budget>]

The second inequality follows by adding the mixed replacement error $sqrt(eta) lt.eq sqrt(2 d)$ to $parallel m parallel_2 lt.eq 2 sqrt(d)$. This retains the radial-budget route and its constants; it uses neither individual conditional error bounds nor equality of the two endpoint head projections. After scaling, it reads

$ parallel Q_H y parallel lt.eq \( 2 + sqrt(2) \) sqrt(R \( R - parallel x parallel \)) . $

The coefficient $2 + sqrt(2) < 4$ gives the convenient consequence $parallel y parallel^2 lt.eq 16 R \( R - parallel x parallel \)$ for a zero-head displacement.

== 14 Atomic gauges and finite-coordinate polars <presentation:constructions>

The forest space also admits two direct constructions. Identify a coefficient vector $x in c_00 \( cal(F) \)$ with $sum_v x \( v \) e_v^(*)$, and let $cal(A)$ be the atoms defined above, including zero. Define

$ a \( x \) = inf { lambda > 0 : x in lambda "conv" cal(A) } \, #h(2em) q \( x \) = sup_(u in c_00 \( cal(F) \)\
rho \( u \) lt.eq 1) lr(|sum_v x \( v \) u \( v \)|) . $

Let $X_a$ and $X_q$ be the respective completions.

#thm([Proposition 14.1.])[
  #emph[The coordinate identity satisfies $a \( x \) = q \( x \) = parallel x parallel$ on $c_00 \( cal(F) \)$ and extends to surjective linear isometries 
$ X_a = X_q = X = J^(*) . $

 The finite unit balls and completed atomic ball are therefore exactly those of Lemma 7 and Corollary 8.]
] <presentation:identity>

#proof[
  The convex hull of $cal(A)$ is symmetric and absorbing. Disjointness bounds every atom’s coordinates by one, while singleton segments make $x \/ parallel x parallel_2$ an atom for $x eq.not 0$. Hence its gauge is a norm and
  #[#set math.equation(numbering: n => "(14.1)")
   $ parallel x parallel_oo lt.eq a \( x \) lt.eq parallel x parallel_2 . $ <presentation:gauge-bounds>]
  For every $lambda > a \( x \)$ there is a finite convex representation
  $ x = sum_(k = 1)^N theta_k A_k \, #h(2em) theta_k gt.eq 0 \, quad sum_k theta_k = 1 \, #h(2em) A_k = sum_i c_(k i) d_(S_(k i)) \, quad sum_i c_(k i)^2 lt.eq lambda^2 . $
  Indeed, the defining infimum gives such a representation at some radius less than $lambda$; adjoining the zero atom permits any larger radius. No attainment of the gauge infimum is used here.
  If every segment meets $E subset cal(F)$ in a segment or the empty set, then $P_E$ preserves atoms: intersect their disjoint segment families with $E$ and discard empty terms. Thus $P_E$ is contractive for $a$ and extends to $X_a$. This applies to ancestral sets, descendant subtrees, and unions of incomparable descendant subtrees. Along a finite ancestral exhaustion, $P_H x arrow.r x$ in $X_a$, because these projections are contractive and eventually fix each finite coordinate vector.
  Density of $c_00 \( cal(F) \)$ in $J$ gives $q \( x \) = parallel x parallel$; tests approaching the unit ball may be rescaled to have norm at most one. Every atom belongs to $B_X$, so $parallel x parallel lt.eq a \( x \)$. Conversely, place the support of a nonzero $x$ in a finite ancestral set $H$. Lemma 7 expresses $x \/ parallel x parallel$ as a finite convex combination of atoms supported in $H$, giving $a \( x \) lt.eq parallel x parallel$. The zero vector is immediate. This proves equality of the three norms. Coordinate density in Lemma 2 makes both completion maps onto $X$.
  In particular the component duality already proved in that lemma applies to the finite polar construction without a change of norm: $q_h = q \|_(c_00 \( T_h \))$ is the norm inherited from $J_h^(*)$, and
  $ q \( x \)^2 = sum_h q_h \( x \|_(T_h) \)^2 #h(2em) \( x in c_00 \( cal(F) \) \) . $
  On each component the inherited bounds are
  $ frac(parallel x parallel_2, sqrt(h + 1)) lt.eq q_h \( x \) lt.eq parallel x parallel_2 #h(2em) \( x in c_00 \( T_h \) \) . $
  Thus the polar completion has the asserted component decomposition and is reflexive. ◻
]

#prodef([Remark 14.2.])[
  (Rescaled finite approximants).  There is also a direct closed-ball argument from the strict gauge infimum. If $a \( x \) lt.eq 1$ in the completion, choose finite $x_n$ with $a \( x_n - x \) < 1 \/ n$. Then $a \( x_n \) lt.eq 1 + 1 \/ n < 1 + 2 \/ n$, so the strict infimum and balance of the convex hull give $x_n \/ \( 1 + 2 \/ n \) in "conv" cal(A)$. These vectors converge to $x$. Conversely, every atom has norm at most one, so the closed convex hull is contained in the completed unit ball. The same argument applies to the infinite-tree gauge of Lemma 5.
] <presentation:rescaled-closed-ball>

The atomic gauge also gives a direct proof of the subtree formula.

#thm([Proposition 14.3.])[
  #emph[Let $\( r_j \)$ be a finite or countable family of incomparable vertices, and put $U_j = { v : r_j prec.curly.eq v }$. For $x in X_a$ supported in $union.big_j U_j$, 
$ a \( x \)^2 = sum_j a \( P_(U_j) x \)^2 . $

]
] <presentation:subtrees>

#proof[
  First take a finite family and $x in c_00 \( cal(F) \)$. A segment meets at most one $U_j$. Consequently the squared coefficient norms of an atom’s restrictions sum to at most one. The seminorm $z mapsto \( sum_j a \( P_(U_j) z \)^2 \)^(1 \/ 2)$ is at most one on every atom, so it is at most $a \( z \)$ by convexity and passage through radii $lambda > a \( z \)$.
  For the reverse inequality, choose $lambda_j > a \( P_(U_j) x \)$. Write each $P_(U_j) x$ as a finite convex average $sum_(k_j) theta_(j \, k_j) A_(j \, k_j)$ of disjoint-segment sums with coefficient norm at most $lambda_j$. Project these representations onto $U_j$, preserving that bound. For each tuple $\( k_1 \, dots.h \, k_m \)$, the sum $sum_j A_(j \, k_j)$ still uses disjoint segments and has coefficient norm at most $\( sum_j lambda_j^2 \)^(1 \/ 2)$. Give this sum the product weight $product_j theta_(j \, k_j)$. These weights are nonnegative and sum to one, and their average is $sum_j P_(U_j) x = x$. Therefore
  $ a \( x \) lt.eq (sum_j lambda_j^2)^(1 \/ 2) . $
  Let each $lambda_j$ decrease to $a \( P_(U_j) x \)$, including when this value is zero. This proves the finite-coordinate identity.
  Projection onto the union of the subtrees preserves atoms. Apply it to finite-coordinate approximants of $x$ to obtain the finite-family identity in the completion. For a countable family, the finite-subtree truncations converge: a finite-coordinate approximant in the union meets only finitely many subtrees, and projection onto the remaining subtrees has norm at most one. The finite-family formula passes to the limit and proves the asserted sum.
  Taking the component roots gives the atomic construction’s outer $ell_2$ sum directly. Project atomic representations onto $T_h$. Every resulting atom has Euclidean norm at most $sqrt(h + 1)$, since its segments are disjoint and each has at most $h + 1$ vertices. Convexity and the strict-radius limit therefore give $parallel x parallel_2 lt.eq sqrt(h + 1) thin a \( x \)$; the reverse Hilbert bound is (14.1). The components are thus Hilbert-isomorphic, and the $ell_2$-sum reflexivity argument of Lemma 2 applies to this direct construction. ◻
]

#prodef([Remark 14.4.])[
  The gauge gives a direct whole-dual proof of coordinate weak nullity. For $L in X_a^(*)$, (14.1) yields
  $ \| L \( x \) \| lt.eq parallel L parallel a \( x \) lt.eq parallel L parallel parallel x parallel_2 #h(2em) \( x in c_00 \( cal(F) \) \) . $
  Thus $L$ extends continuously to $ell_2 \( cal(F) \)$ and $\( L \( e_v^(*) \) \)_(v in cal(F))$ is square summable. Its values tend to zero along every sequence of distinct vertices. In particular, the successive child increments are weakly null in $X_a$.
] <presentation:weak-null-coordinates>

#prodef([Remark 14.5.])[
  The full-dual identification uses the finite component heights. On $T_oo = bb(N)^(< omega)$, let $J_oo$ be the completion under the same segment norm, and let $B_oo$ be the norm-closed coordinate span in $J_oo^(*)$, as in Section 3. Then
  $ B_oo subset.neq J_oo^(*) . $
  Indeed, fix an infinite branch $beta$. The functional $f_beta \( u \) = sum_(v in beta) u \( v \)$ on finite vectors has norm one: its value is a finite segment sum, and evaluation on any coordinate unit vector of the branch attains one. It therefore extends to $J_oo$. If $y$ is a finite coordinate functional, choose a vertex $v in beta$ beyond its support. Since $rho \( e_v \) = 1$,
  $ parallel f_beta - y parallel gt.eq \| \( f_beta - y \) \( e_v \) \| = 1 . $
  The same lower bound holds on the closed coordinate span $B_oo$. The zero functional gives the reverse bound, so $"dist" \( f_beta \, B_oo \) = 1$. Thus completing the finite coordinate polar norm yields the proper coordinate subspace here.
] <presentation:infinite-height>

== 15 A finite-coordinate toolkit <stab:toolkit>

The estimates in this section apply to either coordinate model already constructed. We write $Z$ for the chosen model: the finite-height forest space $X$ of Proposition 31, or the infinite-height coordinate predual $B_oo$ of Section 3. In each case $J$ is the corresponding primal segment completion and $rho$ is its norm. The finite atomic hulls and norming head tests are supplied by Lemma 7 in the forest and Lemma 5 in the infinite-height model.

For a finite ancestral set $H$, let $P_H$ be its coordinate projection and put $Q_H = I - P_H$. These projections are contractive in either model. Write $G_H$ for the minimal vertices of the complement of $H$. Thus $G_H$ includes the roots of forest components missing $H$; if $H$ is empty, it consists of all component roots. Its vertices are incomparable, and their descendant subtrees partition the complement. A crossing segment meets both $H$ and its complement and has a unique first exterior vertex, its gate. A root of a component missing $H$ carries no crossing coefficient.

We use $d_S = sum_(v in S) e_v^(*)$ for a segment functional. The coefficient estimate holds in both models:

#[#set math.equation(numbering: n => "(15.1)")
 $ ∥sum_i a_i d_(S_i)∥ lt.eq (sum_i a_i^2)^(1 \/ 2) #h(2em) \( S_i upright(" pairwise disjoint") \) . $ <stab:sign:coefficients>]

Indeed, Cauchy–Schwarz bounds evaluation on $v in J$ by the coefficient norm times $rho \( v \)$. An atom includes its chosen representation

$ A = sum_i c_i d_(S_i) \, #h(2em) S_i upright(" pairwise disjoint") \, #h(2em) sum_i c_i^2 lt.eq 1 . $

A functional may have several such representations; all subsequent statements concern the chosen one.

We will use the following common form of the cone estimates from the forest construction and Lemma 6. For a finite antichain $G$ and vectors $u_g in Z$ supported in its descendant subtrees,

#[#set math.equation(numbering: n => "(15.2)")
 $ (sum_(g in G) \| u_g \( e_g \) \|^2)^(1 \/ 2) lt.eq ∥sum_(g in G) u_g∥ lt.eq (sum_(g in G) parallel u_g parallel^2)^(1 \/ 2) . $ <stab:cone-bounds>]

Tests supported on $G$ have $rho$-norm equal to their Euclidean norm, which proves the lower bound and the contraction of restriction to an antichain. For the upper bound, combine finite disjoint segment tests from the separate subtrees to obtain $sum_g rho \( P_(T_g) v \)^2 lt.eq rho \( v \)^2$, and apply Cauchy–Schwarz. Choosing almost maximizing families suffices. For countable $G$, finite partial sums give the same estimates whenever $sum_g parallel u_g parallel^2 < oo$; the upper bound makes those sums Cauchy. If an existing vector is decomposed into its cone restrictions, its finite cone sums converge by coordinate approximation, so the finite estimates pass to that decomposition as well.

=== 15.1 The exterior term and two boundary comparisons <stab:coef:boundary>

Fix $p = P_H p in J$ with $rho \( p \) lt.eq 1$. For a represented atom put

$ s_i = p \( S_i \) \, #h(2em) L \( A \) = 1 - A \( p \) \, #h(2em) D \( A \) = 1 - sum_i s_i^2 \,\
E \( A \) = sum_i \( c_i - s_i \)^2 \, #h(2em) A^compose = sum_i s_i d_(S_i) . $

The evaluation deficit $L \( A \)$, squared-test slack $D \( A \)$, and coefficient error $E \( A \)$ are nonnegative; also $A^compose$ is an atom. For each gate $g$, let $c_g \( A \) \, s_g \( A \)$ be the coefficient and head sum of the crossing segment through $g in G_H$, or zero if there is none. There is at most one such segment in a disjoint family. Write $c \( A \) = \( c_g \( A \) \)_g$ and $s \( A \) = \( s_g \( A \) \)_g$, and define

$ O \( A \) = sum_(S_i ∩ H = diameter) c_i d_(S_i) \, #h(2em) C \( A \) = sum_(S_i upright(" crossing")) c_i d_(S_i \\ H) . $

Thus $Q_H A = O \( A \) + C \( A \)$. The letters $O$ and $C$ denote the wholly exterior part and the crossing part, respectively.

#thm([Lemma 15.1.])[
  #emph[For every represented atom, the exact identity is 
#[#set math.equation(numbering: n => "(15.3)")
 $ 2 L \( A \) = 1 - sum_i c_i^2 + D \( A \) + E \( A \) . $ <stab:deficit-identity>]

 In particular, 
#[#set math.equation(numbering: n => "(15.4)")
 $ D \( A \) + sum_i \( c_i - s_i \)^2 = 1 + sum_i c_i^2 - 2 A \( p \) lt.eq 2 L \( A \) . $ <stab:coef:budget>]

 The full coefficient replacement satisfies 
#[#set math.equation(numbering: n => "(15.5)")
 $ max { parallel A - A^compose parallel \, parallel Q_H \( A - A^compose \) parallel } lt.eq sqrt(E \( A \)) lt.eq sqrt(2 L \( A \)) . $ <stab:toolkit:replacement>]

 Consequently, 
#[#set math.equation(numbering: n => "(15.6)")
 $ parallel O \( A \) parallel lt.eq sqrt(2 L \( A \)) \, #h(2em) parallel c \( A \) - s \( A \) parallel_2 lt.eq sqrt(2 L \( A \)) . $ <stab:coef:exterior>]

 At the gates one has 
#[#set math.equation(numbering: n => "(15.7)")
 $ A \( e_g \) = c_g \( A \) + O \( A \) \( e_g \) \, #h(2em) parallel \( O \( A \) \( e_g \) \)_g parallel_2 lt.eq parallel O \( A \) parallel . $ <stab:coef:gate-coordinates>]

]
] <stab:coef:pointwise>

#proof[
  The identity is an expansion of the square; its right-hand inequality uses $sum_i c_i^2 lt.eq 1$. Applying (15.1) to the coefficients $c_i - s_i$ and using contractivity of $Q_H$ proves the replacement bound. For the exterior segments $s_i = 0$, so the coefficient norm bound for disjoint segment functionals gives the first inequality in (15.6). The crossing indices form a subset of the full coefficient array, giving the second. A crossing segment contains its gate, and all other contributions there come from $O \( A \)$, proving the coordinate identity. On any finite array supported on the gate antichain, $rho$ equals the Euclidean norm: a segment meets that antichain at most once, and singleton tests give the reverse inequality. Dual testing proves the final contraction, also for an infinite gate set by taking finite subsets. ◻
]

#thm([Lemma 15.2.])[
  #emph[Two represented atoms $A \, B$, tested against the same $p$, satisfy 
#[#set math.equation(numbering: n => "(15.8)")
 $ 2 sum_(g : s_g \( A \) s_g \( B \) < 0) \| s_g \( A \) s_g \( B \) \| lt.eq D \( A \) + D \( B \) . $ <stab:coef:head-conflict-eq>]

 There are two direct proofs: one discards a suffix of the longer head, and the other splits the longer segment into two pieces.]
] <stab:coef:head-conflict>

#proof[
  At an opposite-sign gate, both head segments end at the parent of that gate. Their starting vertices lie on the same ancestor chain, so the heads are nested. They are unequal because equal heads have equal sums on $p$. Suppose $A$ has the longer head, with sum $s$, and the shorter head of $B$ has sum $s'$. Replace the segment of $A$ by its prefix ending just before the shorter head starts. This prefix is nonempty, and its sum is $s - s'$. Its squared sum increases by
  $ \( s - s' \)^2 - s^2 = \( s' \)^2 - 2 s s' gt.eq 2 \| s s' \| . $
  Perform these truncations at every opposite-sign gate where $A$ has the longer head. Each original segment is used at most once, since it has only one gate. The new segments are subsets of the old ones, so they remain disjoint. Their total squared test sum is at most one, and hence the total increase is at most $D \( A \)$. The other nesting direction has budget $D \( B \)$. Adding proves the assertion.
  This comparison can also be indexed first by the last interior vertex: at most one crossing segment of an atom uses any given such vertex, and the same nesting proof applies. Before using a cancellation of coordinates, however, one must reindex by the #emph[first exterior] vertex. Different children of one interior vertex are different coordinates. Applying the same comparison after this reindexing gives (15.8) in precisely the form needed below. ◻
]

#proof[
  Apply Lemma 9 to the two underlying segment families. In its notation, $L_(cal(S)) = D \( A \)$, $L_(cal(S)') = D \( B \)$, and the crossing sums are $s_g \( A \) \, s_g \( B \)$. Its simultaneous two-piece cuts retain the longer segment’s original endpoint and give exactly (15.8). The proof uses only nesting of finite paths and the bound on their squared $p$-sums, so it applies unchanged in either coordinate model. Gates that are untouched component roots have zero crossing sums and contribute nothing. ◻
]

#thm([Lemma 15.3.])[
  #emph[For the original crossing coefficients, 
#[#set math.equation(numbering: n => "(15.9)")
 $ sum_g \( - c_g \( A \) c_g \( B \) \)_(+) lt.eq L \( A \) + L \( B \) + sqrt(2 L \( A \)) + sqrt(2 L \( B \)) \, $ <stab:coef:original-products-eq>]

 where $r_(+) = max \( r \, 0 \)$.]
] <stab:coef:original-products>

#proof[
  The map $r mapsto \( - r \)_(+)$ is one-Lipschitz. The difference between the product sums formed with $c$ and with $s$ is therefore bounded by
  $ sum_g \| c_g \( A \) - s_g \( A \) \| thin \| c_g \( B \) \| + sum_g \| s_g \( A \) \| thin \| c_g \( B \) - s_g \( B \) \| . $
  The crossing arrays $c \( B \)$ and $s \( A \)$ have Euclidean norms at most one. Cauchy–Schwarz and Lemma 36 bound this error by $sqrt(2 L \( A \)) + sqrt(2 L \( B \))$. Lemma 37 bounds the remaining sum by $\( D \( A \) + D \( B \) \) \/ 2 lt.eq L \( A \) + L \( B \)$. ◻
]

=== 15.2 From scalar means to a tail norm <stab:coef:means>

Only finite probability spaces occur in the next two lemmas. This allows every expectation, product measure, and maximizing segment to be chosen before any passage to the completion.

#thm([Lemma 15.4.])[
  #emph[Let $A$ have a finite law of represented atoms and suppose $bb(E) L \( A \) lt.eq k$, where $k gt.eq 0$. Write 
$ beta = parallel bb(E) c \( A \) parallel_2 \, #h(2em) M_c = \( bb(E) \| c_g \( A \) \| \)_g \, #h(2em) M_s = \( bb(E) \| s_g \( A \) \| \)_g . $

 Then 
#[#set math.equation(numbering: n => "(15.10)")
 $ parallel bb(E) s \( A \) parallel_2 & lt.eq beta + sqrt(2 k) \,\
parallel M_s parallel_2^2 & lt.eq \( beta + sqrt(2 k) \)^2 + 4 k \,\
parallel M_c parallel_2 & lt.eq sqrt(\( beta + sqrt(2 k) \)^2 + 4 k) + sqrt(2 k) \,\
parallel M_c parallel_2^2 & lt.eq beta^2 + 4 k + 4 sqrt(2 k) . $ <stab:coef:mean-head>]

 The last inequality is obtained directly from the original products, whereas the preceding one first controls the signs of the head sums.]
] <stab:coef:gate-bound>

#proof[
  The mean of $parallel c - s parallel_2$ is at most $sqrt(2 k)$, which proves (15.10). Put $a_g = bb(E) \( s_g \)_(+)$ and $b_g = bb(E) \( - s_g \)_(+)$. For independent copies $A \, B$, the expected opposite-sign product sum is $2 sum_g a_g b_g$. Thus Lemma 37 and $bb(E) D lt.eq 2 k$ give
  $ 4 sum_g a_g b_g lt.eq 2 bb(E) D lt.eq 4 k . $
  Since $M_s = a + b$ and $bb(E) s = a - b$, the same expansion gives
  #[#set math.equation(numbering: n => "(15.11)")
   $ parallel M_s parallel_2^2 - parallel bb(E) s parallel_2^2 = 2 bb(E) sum_(g : s_g \( A \) s_g \( B \) < 0) \| s_g \( A \) s_g \( B \) \| lt.eq 2 bb(E) D \( A \) lt.eq 4 k . $ <stab:signed-unsigned>]
  Together with (15.10), this proves (15.10). The coordinate inequality $\| \| c_g \| - \| s_g \| \| lt.eq \| c_g - s_g \|$ gives $parallel M_c - M_s parallel_2 lt.eq sqrt(2 k)$, proving (15.10).
  For the other route put $u_g = bb(E) \( c_g \)_(+)$ and $w_g = bb(E) \( - c_g \)_(+)$. Lemma 38 and Cauchy–Schwarz in the probability space give
  $ 2 sum_g u_g w_g = bb(E) sum_g \( - c_g \( A \) c_g \( B \) \)_(+) lt.eq 2 k + 2 sqrt(2 k) . $
  Now $M_c = u + w$ and $bb(E) c = u - w$, so $parallel M_c parallel_2^2 = beta^2 + 4 sum_g u_g w_g$ gives (15.10). ◻
]

#thm([Lemma 15.5.])[
  (Rooted mixtures and tail assembly).  #emph[ Let $G$ be a finite antichain and, for each $g in G$, let 
$ f_g = sum_j a_(g \, j) d_(\[ g \, w_(g \, j) \]) \, #h(2em) M_g = sum_j \| a_(g \, j) \| \, $

 where every sum is finite. Then 
#[#set math.equation(numbering: n => "(15.12)")
 $ ∥sum_g f_g∥ lt.eq parallel \( M_g \)_g parallel_2 . $ <stab:sign:absolute-masses>]

 If the nonzero coefficients have one common sign for each fixed $g$, then 
#[#set math.equation(numbering: n => "(15.13)")
 $ ∥sum_g f_g∥ = (sum_g \| f_g \( e_g \) \|^2)^(1 \/ 2) . $ <stab:sign:rooted-equality>]

 Consequently, adding another rooted mixture with the same sign at each $g$ cannot decrease the norm.]
  #emph[In particular, for a finite law of represented atoms, put $M_c = \( bb(E) \| c_g \( A \) \| \)_g$. For any real random variable $theta$ with $\| theta \| lt.eq 1$, 
#[#set math.equation(numbering: n => "(15.14)")
 $ parallel bb(E) \( theta C \( A \) \) parallel lt.eq parallel M_c parallel_2 . $ <stab:coef:tail-assembly-eq>]

 If the law is an equal mixture of two laws with expectations $bb(E)_(+) \, bb(E)_(-)$, then 
#[#set math.equation(numbering: n => "(15.15)")
 $ parallel bb(E)_plus.minus C \( A \) parallel lt.eq parallel \( bb(E)_plus.minus \| c_g \( A \) \| \)_g parallel_2 lt.eq 2 parallel M_c parallel_2 . $ <stab:coef:conditional-assembly>]

 The same estimates pass to norm limits of finite rooted mixtures when their absolute-mass vectors converge in $ell_2$. In particular, countably many roots are permitted when their masses are square summable and the series at each root is absolutely summable.]
] <stab:coef:tail-assembly>

#proof[
  Ignore roots with $M_g = 0$. At each remaining root, select $j$ with probability $\| a_(g \, j) \| \/ M_g$ and choose the signed segment $"sgn" \( a_(g \, j) \) d_(\[ g \, w_(g \, j) \])$. Make these choices independently at the finitely many roots. Put $r = parallel \( M_g \)_g parallel_2$. If $r = 0$, all mixtures vanish. Otherwise multiply the selected segment at $g$ by $M_g \/ r$. The selected segments lie in incomparable subtrees and are disjoint, and their squared coefficients sum to one. Every resulting functional is therefore an atom. Its expectation is $\( sum_g f_g \) \/ r$, which proves (15.12).
  For the crossing expectation in (15.14), the contribution at $g$ divided by $M_c \( g \) > 0$ is a convex combination of signed segments starting at $g$, with zero allowed to account for $\| theta \| < 1$. The same finite product construction applies; choosing zero simply omits that segment. Apply it separately to either conditional law. Since $bb(E)_plus.minus \| c_g \| lt.eq 2 bb(E) \| c_g \|$ coordinatewise, it also proves (15.15).
  Under the one-sign assumption, $M_g = \| f_g \( e_g \) \|$. Antichain testing gives the reverse inequality in (15.13). Adding same-sign coefficients increases every absolute root coordinate, proving the asserted monotonicity. This conclusion concerns these rooted mixtures; it does not assert lattice monotonicity of the norm on $Z$.
  For the stated extensions, apply the finite inequalities first. Their upper bounds show that truncating absolutely summable coefficients at each root and then square-summable root masses gives a Cauchy sequence in $Z$. Root coordinates converge by continuity, so the equalities pass to the limit as well. No infinite product is needed to produce an atom. ◻
]

#proof[
  For $v in c_00$, let $m_g \( v \)$ be the largest $\| d_R \( v \) \|$ among the rooted segments appearing at $g$, or zero if there are none. Choose a maximizing segment for every nonzero $m_g \( v \)$. They lie in incomparable subtrees and are disjoint, so $sum_g m_g \( v \)^2 lt.eq rho \( v \)^2$. Consequently,
  $ lr(|sum_g f_g \( v \)|) lt.eq sum_g M_g m_g \( v \) lt.eq parallel \( M_g \)_g parallel_2 rho \( v \) . $
  Density extends this bound to $J$. For a finite atom law use the crossing tails in its support in the same calculation:
  $ \| bb(E) \( theta C \( A \) \) \( v \) \| lt.eq sum_g bb(E) \| c_g \| thin m_g \( v \) lt.eq parallel M_c parallel_2 rho \( v \) . $
  The conditional argument is identical, and the root tests used in the first proof again give the one-sign equality.
  One may maximize over all rooted segments in a fixed finite ancestral set, or take the supremum over all such segments in a subtree. In the latter case, choose almost maximizing segments for finitely many roots before taking the limit. This proves the same estimate without assuming global attainment. The norm-limit statements then follow by the finite truncations described above. ◻
]

== 16 Stability from a nearly norming head test <stab:section>

A common head test controls each endpoint of a convex combination, even when the combination has a nonzero tail. The two relevant errors are the evaluation deficit and the tail of the combination. Keeping them separate also identifies the cost of unequal endpoint weights.

Throughout this section, $Z$ is either the forest coordinate space $X$ or the infinite-height coordinate predual $B_oo$. We use the notation and estimates of the common atom toolkit: $H$ is a finite ancestral head, $G_H$ is its set of exterior gates, and $p = P_H p in J$ is a head test with $rho \( p \) lt.eq 1$. For a represented atom $A = sum_j c_j d_(S_j)$, its replacement is $A^compose = sum_j s_j d_(S_j)$, where $s_j = p \( S_j \)$. The quantities $L \( A \) = 1 - A \( p \)$, $D \( A \) = 1 - sum_j s_j^2$, and $E \( A \) = sum_j \( c_j - s_j \)^2$ are respectively its evaluation deficit, squared-test slack, and squared coefficient error.

=== 16.1 A common test and weighted endpoint laws <a-common-test-and-weighted-endpoint-laws>

#thm([Theorem 16.1.])[
  #emph[Let $z_1 \, dots.h \, z_m in B_Z$ and let $lambda_1 \, dots.h \, lambda_m > 0$ with $sum_i lambda_i = 1$. Put 
$ z = sum_i lambda_i z_i \, #h(2em) delta_i = 1 - z_i \( p \) \, #h(2em) delta = 1 - z \( p \) = sum_i lambda_i delta_i \, #h(2em) eta = parallel Q_H z parallel . $

 Then, for each $i$, 
#[#set math.equation(numbering: n => "(16.1)")
 $ parallel Q_H z_i parallel lt.eq lambda_i^(- 1) sqrt(\( eta + sqrt(2 delta) \)^2 + 4 delta) + sqrt(2 delta_i) . $ <stab:weighted-bound>]

 All deficits are nonnegative, and $delta_i lt.eq delta \/ lambda_i$. For two equally weighted endpoints this gives 
#[#set math.equation(numbering: n => "(16.2)")
 $ parallel Q_H z_plus.minus parallel lt.eq 2 sqrt(\( eta + sqrt(2 delta) \)^2 + 4 delta) + 2 sqrt(delta) . $ <stab:nonzero-midpoint>]

]
] <stab:weighted>

#proof[
  First suppose each endpoint has a finite law of represented atoms. Write $bb(E)_i$ for its law and $bb(E) = sum_i lambda_i bb(E)_i$ for their mixture. The pointwise budget of Lemma 36 gives
  #[#set math.equation(numbering: n => "(16.3)")
   $ bb(E) \( D + E \) lt.eq 2 delta \, #h(2em) bb(E)_i \( D + E \) lt.eq 2 delta_i \, #h(2em) parallel bb(E) \( A - A^compose \) parallel lt.eq sqrt(2 delta) . $ <stab:conditional-deficits>]
  The same argument under the $i$th law bounds its replacement error by $sqrt(2 delta_i)$.
  Let $s_g \( A \)$ denote the head sum of the crossing at $g$, with value zero when no segment crosses there. A segment wholly outside $H$ has replacement coefficient zero. Thus $Q_H A^compose$ consists of segments starting at the gates, with coefficients $s_g \( A \)$. Put $v = bb(E) s$ and $m = bb(E) \| s \|$, coordinatewise. Gate-coordinate contraction and (16.3) give $parallel v parallel_2 lt.eq eta + sqrt(2 delta)$. Applying the signed–unsigned identity (15.11) to the mixture yields
  $ parallel m parallel_2^2 lt.eq parallel v parallel_2^2 + 2 bb(E) D lt.eq \( eta + sqrt(2 delta) \)^2 + 4 delta . $
  Equivalently, its positive and negative mean masses $l_g \, n_g$ satisfy $sum_g l_g n_g lt.eq delta$.
  The conditional absolute masses $m_i = bb(E)_i \| s \|$ satisfy $m_i lt.eq m \/ lambda_i$ coordinatewise. Rooted-mass recovery, Lemma 40, therefore gives
  $ parallel Q_H bb(E)_i A^compose parallel lt.eq parallel m_i parallel_2 lt.eq lambda_i^(- 1) parallel m parallel_2 . $
  This comparison concerns nonnegative Euclidean mass vectors; it does not require lattice monotonicity of the coordinate-space norm. Adding the conditional replacement error proves (16.1).
  For completed endpoints, choose finite coordinate approximants and divide each by the maximum of one and its norm. They converge in norm inside $B_Z$ and have finite atom laws by the finite-hull theorem for the chosen model. Evaluation and both coordinate projections are continuous, so the inequality passes to the limit. Finally, nonnegativity of the individual deficits gives $delta_i lt.eq delta \/ lambda_i$ and hence (16.2). ◻
]

#thm([Corollary 16.2.])[
  (Bounded multipliers).  #emph[Let $A$ be a finite random represented atom, and let $nu$ be a real random variable on the same probability space with $\| nu \| lt.eq 1$. Set $x = bb(E) A$, $u = bb(E) \( nu A \)$, $delta = 1 - x \( p \)$, and $eta = parallel Q_H x parallel$. Then 
#[#set math.equation(numbering: n => "(16.4)")
 $ parallel Q_H u parallel lt.eq sqrt(\( eta + sqrt(2 delta) \)^2 + 4 delta) + sqrt(2 delta) lt.eq eta + \( 2 + 2 sqrt(2) \) sqrt(delta) . $ <stab:bounded-multiplier-bound>]

 Consequently, whenever $x \, u in Z$ satisfy $x plus.minus u in B_Z$, 
#[#set math.equation(numbering: n => "(16.5)")
 $ parallel Q_H u parallel lt.eq parallel Q_H x parallel + \( 2 + 2 sqrt(2) \) sqrt(1 - x \( p \)) . $ <stab:symmetric-tail>]

]
] <stab:bounded-multiplier>

#proof[
  Apply (15.11) to the head-sum arrays of $A$. The pointwise replacement budget gives $parallel bb(E) s parallel_2 lt.eq eta + sqrt(2 delta)$, and hence
  $ parallel bb(E) \| s \| parallel_2 lt.eq sqrt(\( eta + sqrt(2 delta) \)^2 + 4 delta) . $
  The bounded-multiplier case of Lemma 40, applied to the replaced atoms $A^compose$, bounds $parallel Q_H bb(E) \( nu A^compose \) parallel$ by this absolute mass. The remaining term satisfies
  $ parallel Q_H bb(E) \( nu \( A - A^compose \) \) parallel lt.eq bb(E) sqrt(E \( A \)) lt.eq sqrt(2 delta) . $
  Adding proves the first inequality. The second follows from $sqrt(a^2 + b^2) lt.eq a + b$ for $a \, b gt.eq 0$. No independence between $nu$ and $A$ was used.
  For finite convex representations of $x + u$ and $x - u$, take their equal mixture and let $nu$ be its endpoint sign. Then $bb(E) A = x$ and $bb(E) \( nu A \) = u$. For completed endpoints, approximate both inside their finite atomic balls and pass to the limit, as in Theorem 41. ◻
]

#thm([Corollary 16.3.])[
  #emph[Let $z_(+) \, z_(-) in B_Z$. If $z = \( z_(+) + z_(-) \) \/ 2$ is supported on $H$ and $parallel z parallel gt.eq 1 - epsilon$, where $0 < epsilon < 1$, then 
#[#set math.equation(numbering: n => "(16.6)")
 $ parallel Q_H z_plus.minus parallel lt.eq \( 2 + 2 sqrt(6) \) sqrt(epsilon) . $ <stab:supported-bound>]

 More generally, let $R > 0$, $d gt.eq 0$, and $h_(+) \, h_(-) in Z$ satisfy $parallel h_plus.minus parallel lt.eq R$, with $h_(+) + h_(-)$ supported on $H$. If a common head test $p$, $rho \( p \) = 1$, satisfies $h_plus.minus \( p \) gt.eq \( 1 - d \) R$, then 
#[#set math.equation(numbering: n => "(16.7)")
 $ parallel Q_H h_plus.minus parallel lt.eq R \( 2 sqrt(6 d) + sqrt(2 d) \) . $ <stab:common-test-bound>]

]
] <stab:supported-pair>

#proof[
  For the first assertion choose a norming test in the finite-dimensional head. Then $delta lt.eq epsilon$ and $eta = 0$, so (16.2) proves the claim. At the level of finite laws the proof retains the separate estimates
  $ bb(E) \( D + E \) lt.eq 2 epsilon \, #h(2em) parallel bb(E) s parallel_2 lt.eq sqrt(2 epsilon) \, #h(2em) parallel bb(E) \| s \| parallel_2 lt.eq sqrt(6 epsilon) \, #h(2em) bb(E)_plus.minus sqrt(E) lt.eq 2 sqrt(epsilon) . $
  For the second assertion apply Theorem 41 to $z_plus.minus = h_plus.minus \/ R$. Both individual deficits and the mixed deficit are at most $d$, while $eta = 0$. The conditional replacement cost is therefore $sqrt(2 d)$ and its crossing cost is at most $2 sqrt(6 d)$. Multiplication by $R$ proves the assertion, including $d = 0$. Alternatively, projecting both endpoints onto increasing finite ancestral sets containing $H$ preserves their sum and their evaluations on $p$, and gives the same limit. ◻
]

=== 16.2 Keeping the original crossing coefficients <keeping-the-original-crossing-coefficients>

The original coefficients give a second estimate in which segments lying wholly outside the head remain visible as a separate error.

#thm([Proposition 16.4.])[
  #emph[Let $z_1 \, z_2 in B_Z$, $z = \( z_1 + z_2 \) \/ 2$, and let $H$ be finite ancestral. For a head test $p$, put $delta = 1 - z \( p \)$ and $kappa = parallel \( z \( e_g \) \)_(g in G_H) parallel_2$. Then 
#[#set math.equation(numbering: n => "(16.8)")
 $ parallel Q_H z_i parallel lt.eq 2 kappa + \( 6 sqrt(2) + 6 \) sqrt(delta) . $ <stab:gate-original-bound>]

 In particular, choosing a norming head test gives 
#[#set math.equation(numbering: n => "(16.9)")
 $ parallel Q_H z_i parallel lt.eq 2 parallel Q_H z parallel + \( 6 sqrt(2) + 6 \) sqrt(1 - parallel P_H z parallel) lt.eq 2 parallel Q_H z parallel + 15 sqrt(1 - parallel P_H z parallel) . $ <stab:original-crossing-bound>]

]
] <stab:original-crossing>

#proof[
  Use finite atom laws first, with equal mixture $bb(E)$. The decomposition $Q_H A = C \( A \) + O \( A \)$ from the toolkit separates crossing and wholly exterior segments. Let $c_g \( A \)$ and $s_g \( A \)$ be the original crossing coefficient and its head sum. The pointwise estimates (15.6) and the gate identity (15.7) imply
  $ parallel bb(E) c parallel_2 lt.eq kappa + sqrt(2 delta) \, #h(2em) parallel bb(E) s - bb(E) c parallel_2 lt.eq sqrt(2 delta) . $
  By (15.11), $parallel bb(E) \| s \| parallel_2 lt.eq parallel bb(E) s parallel_2 + 2 sqrt(delta)$. The coordinate inequality $\| \| c_g \| - \| s_g \| \| lt.eq \| c_g - s_g \|$ and Jensen’s inequality therefore give
  #[#set math.equation(numbering: n => "(16.10)")
   $ parallel bb(E) \| c \| parallel_2 lt.eq kappa + \( 3 sqrt(2) + 2 \) sqrt(delta) . $ <stab:original-mass>]
  Lemma 40 bounds the crossing mean of either conditional law by $2 parallel bb(E) \| c \| parallel_2$. Its exterior mean costs at most
  $ bb(E)_i parallel O \( A \) parallel lt.eq sqrt(2 bb(E)_i L \( A \)) lt.eq 2 sqrt(delta) . $
  Their sum proves (16.8). For a norming head test, $delta = 1 - parallel P_H z parallel$; gate contraction gives $kappa lt.eq parallel Q_H z parallel$, and $6 sqrt(2) + 6 < 15$.
  Keeping the weaker conditional exterior estimate $bb(E)_i parallel O \( A \) parallel lt.eq 2 sqrt(2 delta)$ instead records the alternative budget
  #[#set math.equation(numbering: n => "(16.11)")
   $ parallel Q_H z_i parallel lt.eq 2 kappa + \( 8 sqrt(2) + 4 \) sqrt(delta) < 2 kappa + 16 sqrt(delta) #h(2em) \( delta > 0 \) . $ <stab:sixteen-budget>]
  For $delta = 0$ the last inequality is non-strict. Either the one-piece truncation or the two-piece comparison in Lemma 37 supplies the required opposite-sign estimate. Thus this original-coefficient calculation is compatible with both surgeries. Normalized finite approximants and norm continuity give the result for completed endpoints. ◻
]

=== 16.3 A small tail at an arbitrary center <a-small-tail-at-an-arbitrary-center>

For a fixed center we can use an ordered comparison: positive crossings from the first sample are matched only against negative crossings from the second. The deterministic step is the one-piece truncation in Lemma 37; its ordered expectation keeps a different budget.

#thm([Proposition 16.5.])[
  #emph[Let $0 < e < 1 \/ 4$, let $x in Z$ satisfy $parallel x parallel = 1$, and let $H$ be finite ancestral with $parallel Q_H x parallel lt.eq e$. Suppose $p = P_H p$, $rho \( p \) = 1$, and $x \( p \) gt.eq 1 - e$. For every $u in ker P_H$, 
#[#set math.equation(numbering: n => "(16.12)")
 $ max { parallel x + u parallel \, parallel x - u parallel } lt.eq 1 + e quad arrow.r.double quad parallel u parallel lt.eq 25 sqrt(e) . $ <stab:small-center-implication>]

]
] <stab:small-center-tail>

#proof[
  Fix a finite ancestral $K supset H$ and represent $P_K \( x plus.minus u \) \/ \( 1 + e \)$ by finite atom laws. Under each law the expectation on $p$ is at least $\( 1 - e \) \/ \( 1 + e \) gt.eq 1 - 2 e$. The pointwise budget gives
  $ bb(E)_plus.minus E \( A \) lt.eq 4 e \, #h(2em) bb(E)_plus.minus D \( A \) lt.eq 4 e \, #h(2em) parallel bb(E)_plus.minus \( A - A^compose \) parallel lt.eq 2 sqrt(e) . $
  Let $l_g \, n_g$ be the positive and negative crossing masses of the equal mixture after replacement. Its mean before replacement is $P_K x \/ \( 1 + e \)$, so gate contraction gives $parallel l - n parallel_2 lt.eq 2 sqrt(e) + e$.
  Take independent outcomes of this mixed law. At each gate compare only a positive head sum in the first outcome with a negative head sum in the second. If the sums of the longer and shorter nested heads are $b \, b'$, truncation leaves the sum $b - b'$ and gains $\( b - b' \)^2 - b^2 = \( b' \)^2 - 2 b b' gt.eq 2 \| b b' \|$ in the squared test. As in Lemma 37, different gates require different original segments, so the gains total at most $D \( A \) + D \( A' \)$. Independence now gives the one-orientation estimate $2 sum_g l_g n_g lt.eq bb(E) \( D \( A \) + D \( A' \) \) lt.eq 8 e$. Hence
  #[#set math.equation(numbering: n => "(16.13)")
   $ sum_g l_g n_g lt.eq 4 e \, #h(2em) parallel l + n parallel_2 lt.eq sqrt(\( 2 sqrt(e) + e \)^2 + 16 e) . $ <stab:directional-mass>]
  Rooted-mass recovery bounds each conditional replaced tail by $2 parallel l + n parallel_2$. Either proof in Lemma 40 applies; in its finite-test proof all maximizing segments may be taken in the finite set $K$.
  Using the sufficient bound $parallel I - P_H parallel lt.eq 2$, restriction of each replacement error costs at most $4 sqrt(e)$. Half the difference of the conditional tails is $P_K u \/ \( 1 + e \)$, since the center cancels. Consequently
  $ parallel P_K u parallel lt.eq \( 1 + e \) [2 sqrt(\( 2 sqrt(e) + e \)^2 + 16 e) + 4 sqrt(e)] lt.eq 5 / 4 \( sqrt(89) + 4 \) sqrt(e) < 25 sqrt(e) . $
  Here $e lt.eq sqrt(e) \/ 2$. Coordinate exhaustion proves the claim. ◻
]

=== 16.4 From endpoint stability to averaged midpoint gain <from-endpoint-stability-to-averaged-midpoint-gain>

We use the averaged modulus of (7.2). A norming-functional kernel makes both endpoint norms at least one; a finite head alone gives this lower bound for a head-supported center. These two choices yield the following consequences.

#thm([Corollary 16.6.])[
  #emph[For either coordinate model, 
$ hat(delta)_Z \( t \) gt.eq t^2 \/ 1024 #h(2em) \( 0 < t < 1 \) . $

 For every $t > 0$ and every $0 < e < 1 \/ 4$ with $25 sqrt(e) < t$, one also has $hat(delta)_Z \( t \) gt.eq e \/ 2$.]
] <stab:averaged-gain>

#proof[
  For the first assertion set $d = t^2 \/ 256$. Let $x_0$ be a finitely supported unit vector and choose $H$ containing its support. For $y in ker P_H$, $parallel y parallel gt.eq 1$, both endpoint norms are at least one. If both were at most $1 + d$, their normalized midpoint $x_0 \/ \( 1 + d \)$ would have norm at least $1 - d$. Equation (16.6) would give
  $ frac(t parallel y parallel, 1 + d) lt.eq \( 2 + 2 sqrt(6) \) sqrt(d) < 7 sqrt(d) = 7 t \/ 16 < t \/ 2 \, $
  whereas $d < 1$ makes the left side greater than $t \/ 2$. The average therefore exceeds $1 + d \/ 2$. For an arbitrary unit $x$, choose a finitely supported unit $x_0$ with $parallel x - x_0 parallel < d \/ 4$ and use its head subspace. The average loses less than $d \/ 4$, leaving gain $d \/ 4 = t^2 \/ 1024$.
  For the second assertion choose a head with $parallel Q_H x parallel lt.eq e$ and a norming head test with $x \( p \) gt.eq 1 - e$. Intersect $ker P_H$ with the kernel of a norming functional for $x$ on $Z$. Both actual endpoints have norm at least one. For $u = t y$, $parallel y parallel gt.eq 1$, Proposition 45 forces one endpoint to exceed $1 + e$, so their average exceeds $1 + e \/ 2$. Taking the modulus proves the claim. ◻
]

== 17 Endpoint distributions and conditional recovery <endpoint-distributions-and-conditional-recovery>

The probabilities assigned to two atom laws determine which combination of their endpoints can be recovered. We first weight the laws by the actual endpoint norms to control their average. We then compare signed and conditional recovery when finite laws only approximate the endpoints, and finally keep the original radius and a small center tail in the budget.

=== 17.1 Weighting the endpoint distributions by their norms <molw:sec>

The two actual endpoint norms determine a probability law that controls their average directly. We work in the infinite-height coordinate predual $B_oo$ of Section 3. Its atomic gauge and finite-coordinate polar descriptions agree by Lemma 5; the completion is the norm-closed coordinate span specified there, as distinguished in Remark 35. We use its represented atoms $m = sum_i a_i d_(S_i)$, its ancestral projections $P_A$ and $Q_A = I - P_A$, and the cone estimates from Lemmas 4 and 6.

#thm([Theorem 17.1.])[
  #emph[Let $A subset T_oo$ be finite and ancestral, let $x in B_oo$ be supported in $A$, and let $z in ker P_A$. Write 
$ r = parallel x parallel \, #h(2em) L_(+) = parallel x + z parallel \, #h(2em) L_(-) = parallel x - z parallel \, #h(2em) L = frac(L_(+) + L_(-), 2) . $

 Then $L_(+) \, L_(-) gt.eq r$ and 
#[#set math.equation(numbering: n => "(17.1)")
 $ parallel z parallel lt.eq C sqrt(L \( L - r \)) \, #h(2em) C = sqrt(2) + sqrt(6) . $ <molw:lens>]

]
] <molw:average>

#proof[
  Projection onto $A$ gives $L_(+) \, L_(-) gt.eq r$. Thus $L < r$ is impossible. If $r = 0$, then $x = 0$ and $L_(+) = L_(-) = L = parallel z parallel$, and (17.1) follows because $C gt.eq 1$. This includes $L = 0$. If an endpoint norm is zero, projection forces $r = 0$ and then $z = 0$, so no zero denominator is needed in what follows. For $r > 0$, divide $x$ and $z$ by $r$; it is enough to prove the assertion with $r = 1$. In this case $L_(+) \, L_(-) gt.eq 1$.
  First suppose $z$ is finitely supported, and choose a finite ancestral set $B$ containing $A$ and the support of $z$. By Lemma 4, choose a head test $f = P_A f$ with $rho \( f \) = 1$ and $x \( f \) = 1$. The segment test norm gives
  #[#set math.equation(numbering: n => "(17.2)")
   $ sum_i f \( S_i \)^2 lt.eq 1 $ <molw:test>]
  for every disjoint segment family.
  Choose a sign $sigma$ with probabilities
  #[#set math.equation(numbering: n => "(17.3)")
   $ bb(P) { sigma = 1 } = frac(L_(+), 2 L) \, #h(2em) bb(P) { sigma = - 1 } = frac(L_(-), 2 L) . $ <molw:weights>]
  Conditionally on that sign, choose a finite distribution of represented atoms with mean $\( x + sigma z \) \/ L_sigma$. Such distributions exist by Lemma 5; the random data retain a chosen coefficient list and segment family for every atom. These probabilities give both identities
  #[#set math.equation(numbering: n => "(17.4)")
   $ bb(E) m = x / L \, #h(2em) bb(E) \( sigma m \) = z / L . $ <molw:means>]
  The first identity cancels the tail. The second recovers the desired displacement without passing to one conditional distribution.
  Apply Corollary 42 to this finite law, with multiplier $nu = sigma$. Its mean $x \/ L$ is supported in $A$, so the center-tail parameter in that corollary is zero. Its evaluation deficit under $f$ is
  $ delta = 1 - \( x \/ L \) \( f \) = 1 - 1 \/ L gt.eq 0 . $
  The first inequality in (16.4), together with the two identities in (17.4), therefore gives
  $ frac(parallel z parallel, L) = ∥Q_A bb(E) \( sigma m \)∥ lt.eq sqrt(6 delta) + sqrt(2 delta) = \( sqrt(6) + sqrt(2) \) sqrt(1 - 1 \/ L) . $
  Multiplying by $L$ proves (17.1) when $r = 1$. The multiplier may depend on the represented atom; the corollary requires only $\| sigma \| lt.eq 1$, which holds for the endpoint sign used here.
  For general $z in ker P_A$, use the finite tail approximants from Lemma 4. Their endpoint norms and averages converge, so the finite-support inequality passes to the limit. Finally, rescaling from $r = 1$ gives $r C sqrt(\( L \/ r \) \( L \/ r - 1 \)) = C sqrt(L \( L - r \))$. ◻
]

#thm([Corollary 17.2.])[
  #emph[For every $t > 0$, put 
#[#set math.equation(numbering: n => "(17.5)")
 $ omega \( t \) = frac(sqrt(1 + 4 \( t \/ C \)^2) - 1, 2) \, #h(2em) C = sqrt(2) + sqrt(6) . $ <molw:rho>]

 Then the averaged asymptotic modulus of $B_oo$ satisfies $hat(delta)_(B_oo) \( t \) gt.eq omega \( t \) \/ 2 > 0$. The bound holds when the cofinite infimum allows every perturbation direction of norm at least one.]
] <molw:modulus>

#proof[
  For a finite-support unit center $x$, choose a finite ancestral set $A$ containing its support and take $F = ker P_A$. If $y in F$ and $parallel y parallel gt.eq 1$, Theorem 47 applied to $z = t y$ yields $t^2 lt.eq C^2 L \( L - 1 \)$. Since $L gt.eq 1$, solving this quadratic gives $L - 1 gt.eq omega \( t \)$. The projection $P_A$ has finite rank, so $F$ is closed and has finite codimension.
  For an arbitrary unit center $x$, density and normalization provide a finite-support unit vector $x_0$ with $parallel x - x_0 parallel < omega \( t \) \/ 2$. Choose the subspace associated with $x_0$ before choosing $y$. Each endpoint norm changes by at most $parallel x - x_0 parallel$, uniformly for all such $y$, so their average exceeds $1 + omega \( t \) \/ 2$. Taking the infimum over $y$, the supremum over $F$, and then the infimum over unit centers gives the assertion. This argument imposes no upper bound on $t$. ◻
]

We now return to the finite-height forest space $X = J^(*)$ of Proposition 31.

=== 17.2 Signed and conditional recovery from finite approximations <mola:conditional-section>

Finite atom laws approximate completed endpoints in norm. Their mixture therefore has a small tail even when the intended center is supported on the head. The next two estimates keep this approximation error explicit. Recovering one conditional law incurs a factor of two in its absolute boundary mass; recovering the signed mixture avoids that factor. The conditional estimate allows the displacement to have a nonzero head, whereas the signed statement below is formulated for a pure tail.

#thm([Proposition 17.3.])[
  #emph[Let $H$ be finite and ancestor-closed, $x = P_H x$, and $x + h \, x - h in B_X$, with arbitrary $h in X$. Suppose $0 < d < 1$ and $parallel x parallel gt.eq 1 - d$. For every $eta > 0$, choose finite represented-atom laws with means $z_plus.minus$ such that $parallel z_plus.minus - \( x plus.minus h \) parallel lt.eq eta$. Such laws exist, and every such pair gives 
#[#set math.equation(numbering: n => "(17.6)")
 $ parallel Q_H h parallel lt.eq eta + 2 sqrt(d + eta) + 2 sqrt(\( eta + sqrt(2 \( d + eta \)) \)^2 + 4 \( d + eta \)) . $ <mola:conditional-prelimit>]

 Consequently, 
$ parallel Q_H h parallel lt.eq \( 2 + 2 sqrt(6) \) sqrt(d) . $

]
] <mola:conditional>

#proof[
  By Lemma 7, choose $p = P_H p$ with $rho \( p \) = 1$ and $x \( p \) = parallel x parallel gt.eq 1 - d$. The two ball inclusions give $x \( p \) plus.minus h \( p \) lt.eq 1$, and hence $\| h \( p \) \| lt.eq d$. Fix $eta > 0$. Corollary 8 provides finite represented-atom mixtures approximating the two endpoints within $eta$. Write $bb(E)_(+)$, $bb(E)_(-)$ for their expectations and $bb(E) = \( bb(E)_(+) + bb(E)_(-) \) \/ 2$ for the equal mixture. For each atom $Z = sum_i a_i d_(S_i)$ set $b_i = p \( S_i \)$, $hat(Z) = sum_i b_i d_(S_i)$, $D = sum_i \( a_i - b_i \)^2$, and $L = 1 - sum_i b_i^2$. Pointwise $D + L lt.eq 2 \( 1 - Z \( p \) \)$. The mixture pairs with $p$ by at least $1 - d - eta$, whereas each conditional law pairs with $p$ by at least $1 - 2 d - eta$. Therefore
  $ bb(E) D \, bb(E) L lt.eq 2 \( d + eta \) \, #h(2em) bb(E)_plus.minus D \, bb(E)_plus.minus L lt.eq 4 d + 2 eta lt.eq 4 \( d + eta \) . $
  In particular the conditional replacement error is at most $2 sqrt(d + eta)$.
  Write $z_plus.minus = bb(E)_plus.minus Z$ and $z = \( z_(+) + z_(-) \) \/ 2$. These finite atom means lie in $B_X$. Their approximation to the intended endpoints gives
  $ parallel Q_H z parallel lt.eq eta \, #h(2em) 1 - z \( p \) lt.eq d + eta \, #h(2em) 1 - z_plus.minus \( p \) lt.eq 2 d + eta . $
  Apply Theorem 41 to $z_(+) \, z_(-)$ with equal weights and this same head test. It gives
  $ parallel Q_H z_plus.minus parallel lt.eq 2 sqrt(\( eta + sqrt(2 \( d + eta \)) \)^2 + 4 \( d + eta \)) + sqrt(4 d + 2 eta) . $
  The conditional boundary-mass factor is two, while the conditional replacement term is at most $2 sqrt(d + eta)$. Restoring the endpoint approximation costs at most $eta$, since $Q_H x = 0$ and $Q_H$ is contractive. This proves (17.6). Letting $eta arrow.b 0$ gives the asserted limit. ◻
]

For signed recovery, retain the endpoint sign in the equal mixture of the two approximating laws. The following estimate shows exactly which conditional loss disappears. The head again remains fixed, and the displacement is not projected to finite support.

#thm([Proposition 17.4.])[
  #emph[In the forest space $X = J^(*)$, let $H$ be finite and ancestral, $x = P_H x$, $y = Q_H y$, and $x plus.minus y in B_X$. Put $d = 1 - parallel x parallel$. For every $epsilon > 0$, the finite atomic approximation argument gives 
#[#set math.equation(numbering: n => "(17.7)")
 $ parallel y parallel lt.eq e_epsilon + sqrt(e_epsilon^2 + 4 \( d + epsilon \)) \, #h(2em) e_epsilon = epsilon + sqrt(2 \( d + epsilon \)) . $ <mol:closed-hull-error>]

 Consequently $parallel y parallel lt.eq \( sqrt(2) + sqrt(6) \) sqrt(d)$.]
] <mol:closed-hull-signed>

#proof[
  Choose a head test $p = P_H p$ with $rho \( p \) lt.eq 1$ and $x \( p \) = parallel x parallel$. Approximate $x plus.minus y$ within $epsilon$ by finite represented-atom means $z_plus.minus$, using Corollary 8. On their equal mixture, let $sigma = 1$ on the plus law and $sigma = - 1$ on the minus law. Then $parallel bb(E) A - x parallel lt.eq epsilon$ and $parallel bb(E) \( sigma A \) - y parallel lt.eq epsilon$. Its mean test deficit is at most $d + epsilon$, and its mean tail has norm at most $epsilon$. Corollary 42 applies to this finite law with multiplier $sigma$, and hence gives
  $ ∥Q_H bb(E) \( sigma A \)∥ lt.eq sqrt(\( epsilon + sqrt(2 \( d + epsilon \)) \)^2 + 4 \( d + epsilon \)) + sqrt(2 \( d + epsilon \)) . $
  There is no conditional boundary-mass factor: the signed expectation recovers the difference of the two approximating endpoints directly. Since $Q_H y = y$, adding the endpoint approximation error $epsilon$ proves (17.7) with the stated $e_epsilon$. Let $epsilon$ decrease to zero. For endpoints of norm at most $1 + lambda$ about a supported unit center, first divide by $1 + lambda$ and take $d = lambda \/ \( 1 + lambda \)$ in the same calculation. ◻
]

For a general near-unit center, first approximate it by its projection onto one finite ancestor-closed head, and divide that projected center and each displacement by one plus the center-approximation error. Both endpoint bounds then hold in the unit ball, so Proposition 49 controls every displacement tail using that same head. For an infinite family $\( v_j \)$ with $x plus.minus v_j in B_X$, the bounded head projections $\( P_H v_j \)$ are totally bounded. Thus, if the family is $epsilon$-separated, the center satisfies $parallel x parallel lt.eq 1 - delta$ for some $delta > 0$ depending only on $epsilon$. This is the conclusion of Corollary 75.

=== 17.3 Endpoint laws at their original radius <molb:unscaled-section>

We work in the finite-height forest space $X$ of Proposition 31, with primal segment norm $rho$ on $J$. Keeping the endpoint radius in the represented coefficients gives a joint budget for their replacement error and the unused squared head test.

#thm([Proposition 17.5.])[
  #emph[Let $delta > 0$ and $x in X$ satisfy $parallel x parallel = 1$. There are a finite ancestral head $H$ and a test $p = P_H p in J$ such that 
#[#set math.equation(numbering: n => "(17.8)")
 $ rho \( p \) lt.eq 1 \, #h(2em) x \( p \) gt.eq 1 - delta \, #h(2em) parallel Q_H x parallel lt.eq delta . $ <molb:unscaled-head>]

 For this same head and every $y in X$ satisfying $parallel x + y parallel \, parallel x - y parallel lt.eq 1 + delta$, put $h = 6 delta + delta^2$. Then 
#[#set math.equation(numbering: n => "(17.9)")
 $ max { parallel Q_H \( x + y \) parallel \, parallel Q_H \( x - y \) parallel \, parallel Q_H y parallel } lt.eq F \( delta \) := delta + sqrt(2 h) + 2 sqrt(\( 2 delta + sqrt(h) \)^2 + 2 h) . $ <molb:unscaled-bound>]

 In particular, for every $epsilon > 0$ one can choose $delta > 0$ independently of $x$ so that this head satisfies $parallel Q_H y parallel < epsilon$ for every such $y$.]
] <molb:unscaled-tail>

#proof[
  Coordinate density and contractivity give a finite ancestral $H$ with $parallel Q_H x parallel lt.eq delta$. Under the identification $X^(*) = J$ in Proposition 31, choose a norming test $f in J$ with $rho \( f \) = 1$ and $x \( f \) = 1$. Set $p = P_H f$. Then $rho \( p \) lt.eq 1$ and $x \( p \) = 1 - \( Q_H x \) \( f \) gt.eq 1 - delta$, proving (17.8). This choice uses only $x$ and $delta$.
  Fix any permitted $y$. The radius-$\( 1 + delta \)$ version of Corollary 8 provides two finite laws of represented functionals
  $ V = sum_i a_i d_(S_i) \, #h(2em) S_i upright(" pairwise disjoint") \, #h(2em) sum_i a_i^2 lt.eq \( 1 + delta \)^2 \, $
  whose respective means approximate $x + y$ and $x - y$ within $delta$. Write $bb(E)_(+)$ and $bb(E)_(-)$ for these laws and $bb(E) = \( bb(E)_(+) + bb(E)_(-) \) \/ 2$ for their equal mixture. Thus
  $ parallel bb(E)_plus.minus V - \( x plus.minus y \) parallel lt.eq delta \, #h(2em) parallel bb(E) V - x parallel lt.eq delta \, #h(2em) \( bb(E) V \) \( p \) gt.eq 1 - 2 delta . $
  The last bound uses $rho \( p \) lt.eq 1$ and (17.8).
  In each represented outcome define
  $ b_i = p \( S_i \) \, #h(2em) W = sum_i b_i d_(S_i) \, #h(2em) L = 1 - sum_i b_i^2 \, #h(2em) E = sum_i \( a_i - b_i \)^2 . $
  Both $L$ and $E$ are nonnegative. Expanding the square and taking expectations gives the unscaled joint budget
  #[#set math.equation(numbering: n => "(17.10)")
   $ bb(E) \( E + L \) = bb(E) (1 + sum_i a_i^2 - 2 V \( p \)) lt.eq \( 1 + delta \)^2 + 1 - 2 \( 1 - 2 delta \) = 6 delta + delta^2 = h . $ <molb:unscaled-budget>]
  The disjoint-segment coefficient estimate (15.1) gives $parallel V - W parallel lt.eq sqrt(E)$. Cauchy–Schwarz, nonnegativity, and the equal mixture therefore yield
  #[#set math.equation(numbering: n => "(17.11)")
   $ bb(E) parallel V - W parallel lt.eq sqrt(h) \, #h(2em) bb(E)_plus.minus parallel V - W parallel lt.eq sqrt(bb(E)_plus.minus E) lt.eq sqrt(2 h) . $ <molb:unscaled-replacement>]
  Let $G_H$ be the first exterior vertices. A segment wholly outside $H$ has replacement coefficient zero. At each $g in G_H$ there is at most one crossing segment in an outcome; let $q_g$ be its head sum $b_i$, or zero if it is absent. Thus $W \( e_g \) = q_g$ and the restriction of $Q_H W$ to the cone at $g$ is either zero or $q_g$ times a segment functional starting at $g$. Put $m_g = bb(E) \| q_g \|$ and $v_g = bb(E) q_g$. These vectors have finite support. Antichain contraction, followed by (17.11), gives
  #[#set math.equation(numbering: n => "(17.12)")
   $ parallel v parallel_2 lt.eq parallel Q_H bb(E) W parallel lt.eq parallel Q_H x parallel + parallel bb(E) V - x parallel + parallel bb(E) \( W - V \) parallel lt.eq 2 delta + sqrt(h) . $ <molb:unscaled-signed>]
  Apply Lemma 9 to two independent copies of the represented segment families, both tested against $p$. Its simultaneous two-piece splits retain the longer segment’s exterior endpoint, and their available squared-test budgets are $L$ and $L'$. Consequently
  $ 2 sum_(g : q_g q'_g < 0) \| q_g q'_g \| lt.eq L + L' . $
  Independence factors every product expectation. In combination with (17.10), this gives
  #[#set math.equation(numbering: n => "(17.13)")
   $ parallel m parallel_2^2 - parallel v parallel_2^2 = 2 bb(E) sum_(g : q_g q'_g < 0) \| q_g q'_g \| lt.eq 2 bb(E) L lt.eq 2 h \, #h(2em) parallel m parallel_2 lt.eq sqrt(\( 2 delta + sqrt(h) \)^2 + 2 h) . $ <molb:unscaled-unsigned>]
  For either conditional law, the absolute mass in the cone at $g$ is at most $bb(E)_plus.minus \| q_g \| lt.eq 2 m_g$. The rooted-mixture estimate in Lemma 40, equivalently the subtree decomposition of Proposition 33, therefore gives
  #[#set math.equation(numbering: n => "(17.14)")
   $ parallel Q_H bb(E)_plus.minus W parallel lt.eq 2 parallel m parallel_2 . $ <molb:unscaled-conditional>]
  Restoring the conditional coefficient error and the endpoint approximation yields
  $ parallel Q_H \( x plus.minus y \) parallel lt.eq delta + sqrt(2 h) + 2 parallel m parallel_2 lt.eq F \( delta \) . $
  Taking half the difference of the two endpoint tails proves the same bound for $Q_H y$. Finally $F \( delta \) arrow.r 0$ as $delta arrow.b 0$. Choosing $F \( delta \) < epsilon$ before choosing $x$, and then choosing $H$ as above before $y$, proves the uniform assertion. ◻
]

== 18 Original coefficients: cancellation and recovery <stab:coef:section>

Retaining the original crossing coefficients leaves two terms to control: segments wholly outside the head and segments that cross its boundary. The toolkit gives two estimates for the latter. Transferring absolute head masses back to the coefficients yields a square-root bound; perturbing their pairwise products first yields a fourth-root bound. These are different estimates for the same coefficient data.

A second choice concerns recovery. A signed mixture directly represents the displacement, whereas selecting one endpoint from the pooled law can introduce a factor of two. We first compare these choices for exact finite laws, then retain approximation errors and a nonzero center tail. The final subsections convert the resulting estimates into midpoint bounds.

Unless a statement specifies the forest space $X$, we use either coordinate model $Z$ and the notation of Section 15. Thus $L \( A \)$ is the evaluation deficit, $D \( A \)$ the squared-test slack, and $O \( A \) \, C \( A \)$ the exterior and crossing parts of a represented atom. All representations retain their chosen segment families and coefficients.

=== 18.1 Exact finite laws: two different estimates <stab:coef:exact>

#thm([Proposition 18.1.])[
  #emph[Let $H$ be finite and ancestral, $x = P_H x$, $P_H z = 0$, and $parallel x plus.minus z parallel lt.eq 1$. Put $d = 1 - parallel x parallel in \[ 0 \, 1 \]$ and 
$ omega_(upright("coef")) \( d \) = 2 #scale(x: 120%, y: 120%)[\(] sqrt(2 d) + sqrt(6 d + 4 sqrt(2 d)) #scale(x: 120%, y: 120%)[\)] #h(2em) \( d gt.eq 0 \) . $

 The original coefficients give both 
#[#set math.equation(numbering: n => "(18.1)")
 $ parallel z parallel & lt.eq \( sqrt(12) + 2 sqrt(2) \) sqrt(d) \,\
parallel z parallel & lt.eq omega_(upright("coef")) \( d \) . $ <stab:coef:square-root>]

 More generally, if $0 lt.eq d_0 < 1$ and $parallel x parallel gt.eq 1 - d_0$, the right side of (18.1) may be replaced by $omega_(upright("coef")) \( d_0 \)$.]
] <stab:coef:exact-tail>

#proof[
  First suppose that $x \, z$ are supported in a finite ancestral $K supset H$. Choose a head test $p$ with $rho \( p \) lt.eq 1$ and $x \( p \) = parallel x parallel$; when $x eq.not 0$ it can be chosen of norm one, and when $x = 0$ take $p = 0$. The finite atomic-ball identity represents each endpoint as a finite law of represented atoms. Let $tau$ be the endpoint sign and use the equal mixture of the laws. Then
  #[#set math.equation(numbering: n => "(18.2)")
   $ bb(E) A = x \, #h(2em) bb(E) \( tau A \) = z \, #h(2em) bb(E)_plus.minus L = bb(E) L = d . $ <stab:coef:exact-laws>]
  Here the last equality uses $z \( p \) = 0$. The gate coordinates of the mixed mean vanish. Lemma 36 therefore gives
  #[#set math.equation(numbering: n => "(18.3)")
   $ beta = parallel bb(E) c parallel_2 = parallel \( bb(E) O \( A \) \( e_g \) \)_g parallel_2 lt.eq sqrt(2 d) \, #h(2em) parallel bb(E) s parallel_2 lt.eq 2 sqrt(2 d) . $ <stab:coef:exact-means>]
  Thus (15.10) and (15.10) yield
  #[#set math.equation(numbering: n => "(18.4)")
   $ parallel M_s parallel_2^2 lt.eq 12 d \, #h(2em) parallel M_c parallel_2 lt.eq sqrt(12 d) + sqrt(2 d) . $ <stab:coef:twelve>]
  The signed mixture in (18.2), followed by Lemma 40, gives
  $ parallel z parallel = parallel bb(E) \( tau Q_H A \) parallel lt.eq parallel M_c parallel_2 + bb(E) parallel O \( A \) parallel lt.eq sqrt(12 d) + 2 sqrt(2 d) . $
  This signed reconstruction has no conditional factor of two.
  For the second route use the original-product estimate (15.10). If $u_g = bb(E) \( c_g \)_(+)$ and $w_g = bb(E) \( - c_g \)_(+)$, it says
  #[#set math.equation(numbering: n => "(18.5)")
   $ sum_g u_g w_g lt.eq d + sqrt(2 d) \, quad parallel u - w parallel_2 lt.eq sqrt(2 d) \, quad parallel u + w parallel_2^2 lt.eq 6 d + 4 sqrt(2 d) . $ <stab:coef:fourth-moments>]
  Let $upright(bold(1))_(+)$ indicate the plus law in the mixture. Now $bb(E) \( upright(bold(1))_(+) Q_H A \) = z \/ 2$. Applying the test-segment proof of Lemma 40 to $upright(bold(1))_(+) C \( A \)$, and bounding the exterior term by its pooled mean, gives
  $ frac(parallel z parallel, 2) lt.eq sqrt(6 d + 4 sqrt(2 d)) + sqrt(2 d) . $
  The factor of two comes from this indicator reconstruction. This proves (18.1). The fourth-root order comes from the product perturbation, while the leading factor two comes from the indicator recovery; the two losses have separate causes.
  The same loss can be recorded as two separate conditional bounds. If $d lt.eq d_0$, positivity of the conditional weights and (15.15) give
  #[#set math.equation(numbering: n => "(18.6)")
   $ parallel bb(E)_(+) O \( A \) parallel lt.eq 2 sqrt(2 d_0) \, #h(2em) parallel bb(E)_(+) C \( A \) parallel lt.eq 2 sqrt(6 d_0 + 4 sqrt(2 d_0)) . $ <stab:coef:fourth-conditional>]
  Indeed each conditional mean of a nonnegative quantity is at most twice its pooled mean. Since $z = bb(E)_(+) Q_H A$, adding these bounds gives $omega_(upright("coef")) \( d_0 \)$ directly, with the exterior and crossing errors still distinguished.
  For a general $z$, let $K$ increase through finite ancestral sets containing $H$. Contractivity gives $parallel x plus.minus P_K z parallel lt.eq 1$, and $P_H P_K z = 0$. Apply the finite calculation and use $P_K z arrow.r z$ in $Z$. The function $omega_(upright("coef"))$ is nondecreasing, so $d lt.eq d_0$ proves the last assertion. This also handles nonattainment in the completed space without a representation of its endpoints. ◻
]

==== 18.1.1 Signed recovery in the forest <mola:actual-section>

The product estimate also permits signed recovery. The next forest statement uses the same absolute-mass budget as (18.5), but retains the endpoint sign instead of selecting one conditional law. Its function $g$ is exactly $omega_(upright("coef")) \/ 2$.

#thm([Proposition 18.2.])[
  #emph[In the forest space $X$, suppose $H$ is finite and ancestor-closed, $x = P_H x$, $y = Q_H y$, and $parallel x + y parallel \, parallel x - y parallel lt.eq 1$. Then 
$ parallel y parallel lt.eq g \( 1 - parallel x parallel \) \, #h(2em) g \( s \) = sqrt(2 s) + sqrt(6 s + 4 sqrt(2 s)) quad \( s gt.eq 0 \) . $

]
] <mola:actual>

#proof[
  For finite $y$, use the exact laws of (18.2), with $z = y$ and $d = s = 1 - parallel x parallel$. The original crossing coefficients obey (18.5), so
  $ parallel M_c parallel_2 lt.eq sqrt(6 s + 4 sqrt(2 s)) \, #h(2em) bb(E) parallel O \( A \) parallel lt.eq sqrt(2 s) . $
  The signed reconstruction $y = bb(E) \( tau Q_H A \)$ and Lemma 40 give
  $ parallel y parallel lt.eq parallel M_c parallel_2 + bb(E) parallel O \( A \) parallel lt.eq g \( s \) . $
  There is no conditional factor of two in this calculation. It keeps the original-product transfer error, which is responsible for the fourth-root order. For general $y$, apply this finite estimate to $P_K y$ along a finite ancestral exhaustion containing $H$. Contractivity preserves both endpoint bounds, and norm convergence proves the assertion. When $x = 0$, the head test used in the exact-law calculation is $p = 0$, as before. ◻
]

We now return to either coordinate model $Z$.

#thm([Corollary 18.3.])[
  #emph[If $x = P_H x$ has norm one, $P_H y = 0$, and $parallel x plus.minus y parallel lt.eq R$ for $R gt.eq 1$, then 
#[#set math.equation(numbering: n => "(18.7)")
 $ parallel y parallel lt.eq \( sqrt(12) + 2 sqrt(2) \) sqrt(R \( R - 1 \)) . $ <stab:coef:unit-head-lens-eq>]

]
] <stab:coef:unit-head-lens>

#proof[
  Apply (18.1) to $x \/ R \, y \/ R$, whose deficit is $h = 1 - 1 \/ R$, and multiply by $R$. In particular, both the mean coefficient error squared and the mean head slack are at most $2 h$; the wholly exterior term has mean norm at most $sqrt(2 h)$. The crossing means have norms at most $sqrt(2 h)$ and $2 sqrt(2 h)$ before absolute values, and the unsigned head mean has squared norm at most $12 h$. These are the terms retained in the stated constant. ◻
]

=== 18.2 Approximate laws in the completed atomic ball <stab:coef:approximate>

The completed atomic-ball description also lets us approximate the endpoints themselves, rather than first projecting the displacement to finite support. The norm errors then remain in the cancellation equation. The gauge and coordinate-span presentations agree, so both routes are available in either model. Direct approximation does not require a completed endpoint to be an exact finite convex combination.

#thm([Proposition 18.4.])[
  #emph[Let $H$ be finite and ancestral, $x = P_H x$ have norm one, and $P_H y = 0$. For $d > 0$, the assumptions $parallel x plus.minus y parallel lt.eq 1 + d$ imply 
#[#set math.equation(numbering: n => "(18.8)")
 $ parallel y parallel lt.eq \( 1 + d \) \( 7 sqrt(2) + 4 \) sqrt(d) . $ <stab:coef:approximate-tail-eq>]

 In particular, $parallel y parallel lt.eq 32 sqrt(d)$ when $0 < d lt.eq 1$.]
] <stab:coef:approximate-tail>

#proof[
  Choose a norming head test $p$ as above. Equivalently, in the gauge presentation choose a norm-one functional norming $x$ and compose it with $P_H$; its coordinate values define $p$, since optimizing over disjoint-segment atoms gives $sum_i p \( S_i \)^2 lt.eq 1$. For $epsilon.alt > 0$, choose finite convex combinations $w^plus.minus$ of atoms with
  $ ∥w^plus.minus - frac(x plus.minus y, 1 + d)∥ < epsilon.alt . $
  Such approximants follow from the closed atomic-ball description, not an exact convex representation in the completion. This closure also follows directly from the strict-gauge property: approximate a completed unit-ball vector $u$ by finite $u_n$ with $parallel u_n - u parallel < 1 \/ n$. Then $u_n \/ \( 1 + 2 \/ n \)$ has gauge strictly below one and belongs to the convex hull of atoms, while still converging to $u$. Use the two endpoint approximants’ finite laws and their equal mixture, and put $k = d + epsilon.alt$. Since $y \( p \) = 0$,
  #[#set math.equation(numbering: n => "(18.9)")
   $ bb(E)_plus.minus L lt.eq 1 - frac(1, 1 + d) + epsilon.alt lt.eq k \, #h(2em) bb(E) L lt.eq k \, #h(2em) ∥bb(E) A - frac(x, 1 + d)∥ < epsilon.alt . $ <stab:coef:approximate-deficit>]
  The gate restriction is contractive and vanishes on $x$. Thus (15.7) yields
  #[#set math.equation(numbering: n => "(18.10)")
   $ parallel bb(E) c parallel_2 lt.eq epsilon.alt + sqrt(2 k) \, #h(2em) parallel bb(E) s parallel_2 lt.eq epsilon.alt + 2 sqrt(2 k) . $ <stab:coef:approximate-means>]
  Use the splitting proof of Lemma 37. Independence gives the same conflict budget as in Lemma 39, so
  #[#set math.equation(numbering: n => "(18.11)")
   $ parallel M_s parallel_2^2 & lt.eq \( epsilon.alt + 2 sqrt(2 k) \)^2 + 4 k \,\
parallel M_c parallel_2 & lt.eq epsilon.alt + 3 sqrt(2 k) + 2 sqrt(k) . $ <stab:coef:approximate-absolute-head>]
  For the second line, first bound the square root in the first line by $epsilon.alt + 2 sqrt(2 k) + 2 sqrt(k)$, and then use the mean coefficient error $sqrt(2 k)$.
  The exterior term under the plus law has norm at most $sqrt(2 k)$ by (18.9). Apply the convex-product proof of Lemma 40 to its crossing part. The conditional absolute coefficient mean is bounded coordinatewise by twice the pooled mean. Hence
  #[#set math.equation(numbering: n => "(18.12)")
   $ parallel Q_H w^(+) parallel lt.eq sqrt(2 k) + 2 \( epsilon.alt + 3 sqrt(2 k) + 2 sqrt(k) \) . $ <stab:coef:approximate-conditional>]
  Since $Q_H$ is contractive and $Q_H \( x + y \) = y$, add $epsilon.alt$ to this bound for $parallel y parallel \/ \( 1 + d \)$. Let $epsilon.alt arrow.b 0$. This proves (18.8). Only when $d lt.eq 1$ may one use $1 + d lt.eq 2$ to obtain $2 \( 7 sqrt(2) + 4 \) sqrt(d) < 32 sqrt(d)$. ◻
]

=== 18.3 A common head at a general center <a-common-head-at-a-general-center>

We now work in the finite-height forest space $X = J^(*)$. For each head $H$, write $P = P_H$ and $Q = Q_H$. The next two applications choose the head before the displacement. Their center and radius assumptions differ, but they use the same original-coefficient mass estimate. For a finite atom law tested by $p = P_H p$ with $rho \( p \) lt.eq 1$, put

$ k = bb(E) L \( A \) \, #h(2em) kappa = parallel \( \( bb(E) A \) \( e_g \) \)_(g in G_H) parallel_2 \, #h(2em) M_c = \( bb(E) \| c_g \( A \) \| \)_(g in G_H) . $

The gate-coordinate identity gives $beta = parallel bb(E) c parallel_2 lt.eq kappa + sqrt(2 k)$. Hence the original-product bound in Lemma 39 gives

$ parallel M_c parallel_2 lt.eq sqrt(\( kappa + sqrt(2 k) \)^2 + 4 k + 4 sqrt(2 k)) . $

For an equal mixture, each conditional crossing tail costs at most $2 parallel M_c parallel_2$, and its wholly exterior part costs at most $2 sqrt(2 k)$. These follow from Lemma 40 and the nonnegative pooled exterior budget. The proofs below specify $k$, $kappa$, and the endpoint-approximation error in their respective settings.

==== 18.3.1 Unit centers and an enlarged lens <molb:sec:original-coefficients>

#thm([Proposition 18.5.])[
  #emph[For $0 < delta < 1$ and every unit $x in X$, one can choose a finite ancestor-closed $H$ such that $parallel x plus.minus y parallel lt.eq 1 + delta$ implies 
$ parallel Q y parallel lt.eq eta \( delta \) := \( 1 + delta \) {2 sqrt(\( 2 delta + sqrt(6 delta) \)^2 + 4 \( 3 delta + sqrt(6 delta) \)) + 2 sqrt(6 delta) + delta} . $

 In particular $eta \( delta \) arrow.r 0$ as $delta arrow.b 0$.]
] <molb:prop:original-lens>

#proof[
  Choose $H$ so that $parallel Q_H x parallel lt.eq delta$, and choose a primal unit test $p = P_H p$ with $x \( p \) gt.eq 1 - delta$. Such a test norms $P_H x$, whose norm is at least $1 - delta > 0$. Both choices depend only on $x \, delta$, before $y$ is given.
  Approximate each scaled endpoint $\( x plus.minus y \) \/ \( 1 + delta \)$ within $delta$ by a finite atom mean, and mix the two laws equally. With $k = bb(E) \( 1 - A \( p \) \)$, the pooled evaluation and tail satisfy
  $ k lt.eq 1 - frac(1 - delta, 1 + delta) + delta lt.eq 3 delta \, #h(2em) parallel Q_H bb(E) A parallel lt.eq frac(parallel Q_H x parallel, 1 + delta) + delta lt.eq 2 delta . $
  Thus the pooled gate norm $kappa$ is at most $2 delta$. The product-transfer estimate used here is
  #[#set math.equation(numbering: n => "(18.13)")
   $ sum_g \( - c_g \( A \) c_g \( A' \) \)_(+) lt.eq L \( A \) + L \( A' \) + sqrt(2 L \( A \)) + sqrt(2 L \( A' \)) \, $ <molb:eq:original-products>]
  proved in Lemma 38 by the one-Lipschitz property of the positive part and the head-conflict bound. Applying the displayed mass estimate above gives
  $ parallel M_c parallel_2 lt.eq B := sqrt(\( 2 delta + sqrt(2 k) \)^2 + 4 \( k + sqrt(2 k) \)) . $
  For either conditional law, the crossing tail has norm at most $2 B$ and the wholly exterior part has norm at most $2 sqrt(2 k)$. Restore the endpoint approximation error $delta$, take half the difference of the two endpoint tails, and multiply by $1 + delta$. The bound is therefore
  $ parallel Q_H y parallel lt.eq \( 1 + delta \) \( 2 B + 2 sqrt(2 k) + delta \) . $
  Using $k lt.eq 3 delta$ gives exactly the stated $eta \( delta \)$. Its leading order is $delta^(1 \/ 4)$, inherited from the original-product estimate. ◻
]

==== 18.3.2 Near-unit centers in the unit ball <molx:actual-center-section>

Here the endpoints lie in the unit ball and the center is only assumed nearly unit. The finite head must again be fixed uniformly for all displacements in its lens.

#thm([Proposition 18.6.])[
  #emph[For $0 < lambda < 1$ and $x in B_X$ with $parallel x parallel gt.eq 1 - lambda$, there is a finite ancestral set $H$, depending only on $x$ and $lambda$, such that every $y in X$ with $x plus.minus y in B_X$ satisfies 
#[#set math.equation(numbering: n => "(18.14)")
 $ parallel Q_H y parallel lt.eq G_(upright("orig")) \( lambda \) := lambda + 2 sqrt(6 lambda) + 2 sqrt(\( 2 lambda + sqrt(6 lambda) \)^2 + 12 lambda + 4 sqrt(6 lambda)) . $ <molx:actual-center-fourth-bound>]

 In particular $G_(upright("orig")) \( lambda \) arrow.r 0$ as $lambda arrow.b 0$.]
] <molx:actual-center-fourth>

#proof[
  By density of finitely supported vectors in $J$, choose $p in B_J$ with finite support and $x \( p \) gt.eq parallel x parallel - lambda$. Use the contractive exhaustion in Lemma 2 to choose a finite ancestral $H$ containing this support and satisfying $parallel Q_H x parallel lt.eq lambda$. Make these choices before selecting $y$.
  By Corollary 8, choose finite represented atom laws with means $z_(+) \, z_(-)$ such that $parallel z_plus.minus - \( x plus.minus y \) parallel lt.eq lambda$. Write $bb(E)_plus.minus$ for their expectations and $bb(E) = \( bb(E)_(+) + bb(E)_(-) \) \/ 2$. For $z = \( z_(+) + z_(-) \) \/ 2$ one has
  #[#set math.equation(numbering: n => "(18.15)")
   $ parallel Q_H z parallel lt.eq 2 lambda \, #h(2em) z \( p \) gt.eq 1 - 3 lambda . $ <molx:actual-center-budget>]
  Use the notation of Section 15. For an atom $A = sum_i c_i d_(S_i)$, put $s_i = p \( S_i \)$ and $L = 1 - A \( p \)$. Its wholly exterior part is $O \( A \)$, and $c_g \, s_g$ are its original and corrected crossing coefficients at $g in G_H$. The pointwise budgets in Lemma 36 give
  $ parallel O \( A \) parallel lt.eq sqrt(2 L) \, #h(2em) parallel c - s parallel_2 lt.eq sqrt(2 L) \, #h(2em) parallel c parallel_2 \, parallel s parallel_2 lt.eq 1 . $
  Here the last two vectors are the crossing arrays. In particular $bb(E) L lt.eq 3 lambda$ and $bb(E) sqrt(2 L) lt.eq sqrt(6 lambda)$.
  For two independent represented atoms, the original-product estimate of Lemma 38 reads
  #[#set math.equation(numbering: n => "(18.16)")
   $ sum_g \( - c_g c'_g \)_(+) lt.eq L + L' + sqrt(2 L) + sqrt(2 L') . $ <molx:actual-center-transfer>]
  Its head comparison may use either the truncation or the two-piece proof in Lemma 37; both give the same transfer bound. This is the estimate underlying the common mass bound above. Thus, for $a_g = bb(E) \( c_g \)_(+)$ and $b_g = bb(E) \( - c_g \)_(+)$, independence yields
  $ 4 sum_g a_g b_g lt.eq 12 lambda + 4 sqrt(6 lambda) . $
  The gate-coordinate identity (15.7) also gives
  $ parallel a - b parallel_2 = parallel bb(E) c parallel_2 lt.eq parallel Q_H z parallel + bb(E) parallel O \( A \) parallel lt.eq 2 lambda + sqrt(6 lambda) . $
  Consequently the original absolute mass $m = a + b = bb(E) \| c \|$ satisfies
  #[#set math.equation(numbering: n => "(18.17)")
   $ parallel m parallel_2^2 lt.eq \( 2 lambda + sqrt(6 lambda) \)^2 + 12 lambda + 4 sqrt(6 lambda) . $ <molx:actual-center-mass>]
  For either endpoint law, positivity of the mixture weights gives
  $ bb(E)_plus.minus parallel O \( A \) parallel lt.eq 2 sqrt(6 lambda) \, #h(2em) bb(E)_plus.minus \| c_g \| lt.eq 2 m_g . $
  Lemma 40, or its proof by maximizing one test segment in each cone, therefore bounds the whole crossing tail by $2 parallel m parallel_2$. The segments selected in different cones are disjoint, so their primal test sums have squared sum at most one; this is what turns the absolute masses into the whole-tail bound. Thus $parallel Q_H z_plus.minus parallel lt.eq 2 sqrt(6 lambda) + 2 parallel m parallel_2$. Finally $parallel y - \( z_(+) - z_(-) \) \/ 2 parallel lt.eq lambda$, and hence
  $ parallel Q_H y parallel lt.eq lambda + 1 / 2 #scale(x: 120%, y: 120%)[\(] parallel Q_H z_(+) parallel + parallel Q_H z_(-) parallel #scale(x: 120%, y: 120%)[\)] . $
  Substitute (18.17). All choices of $H$ and $p$ preceded $y$, as required. ◻
]

=== 18.4 Midpoint consequences with their original losses <stab:coef:moduli>

We return to either coordinate model $Z$ and use the averaged modulus defined in (7.2), with perturbations of norm at least one. The following conversions retain their different lower bounds on the endpoint norms.

#thm([Proposition 18.7.])[
  #emph[For $0 < t < 1$, each of the following conclusions holds.]
  + #emph[If $e > 0$ satisfies 
$ \( sqrt(12) + 2 sqrt(2) \) sqrt(\( 1 + e \) e) < t \/ 2 \, $

 then $hat(delta)_Z \( t \) gt.eq e \/ 4$.]
  + #emph[If $0 < c < 1$, $R = 1 + 4 c$, and $R omega_(upright("coef")) \( 5 c \/ R \) < t$, then $hat(delta)_Z \( t \) gt.eq c$.]
  + #emph[If $d > 0$, $3 d < 1$, and $\( 1 + 2 d \) omega_(upright("coef")) \( 3 d \) < t$, then $hat(delta)_Z \( t \) gt.eq d \/ 2$.]
  + #emph[The completed atomic-ball route gives $hat(delta)_Z \( t \) gt.eq t^2 \/ 16384$.]
] <stab:coef:modulus-conversions>

#proof[
  For the first assertion, approximate any unit $x$ by a unit finite head $x_0 = P_H x_0$ with $parallel x - x_0 parallel < e \/ 4$, and use $F = ker P_H$. For $y in F$ with $parallel y parallel gt.eq 1$, Corollary 54 rules out both $parallel x_0 plus.minus t y parallel lt.eq 1 + e$, since their lens bound is less than $t \/ 2 < t parallel y parallel$. Both endpoint norms are at least one by projection. Their average is therefore greater than $1 + e \/ 2$, and replacing $x_0$ by $x$ leaves it greater than $1 + e \/ 4$.
  For the second assertion choose $H$ with $parallel x - P_H x parallel lt.eq c$ and again let $F = ker P_H$. Both $parallel x plus.minus t y parallel gt.eq parallel P_H x parallel gt.eq 1 - c$. If their average were at most $1 + c$, each would be at most $1 + 3 c$. It would follow that $parallel P_H x plus.minus t y parallel lt.eq 1 + 4 c = R$. For every finite ancestral $K supset H$, apply (18.1) to $P_H x \/ R$ and $t P_K y \/ R$. Its deficit is at most $1 - \( 1 - c \) \/ R = 5 c \/ R$, so
  $ t parallel P_K y parallel lt.eq R omega_(upright("coef")) \( 5 c \/ R \) < t . $
  Exhaustion gives $t parallel y parallel < t$, a contradiction. Notice that the definition of $omega_(upright("coef"))$ for all nonnegative arguments makes this parameter substitution meaningful even before $c$ is made small.
  For the third assertion choose $H$ with $parallel x - P_H x parallel < d$, and let $f in Z^(*)$ have norm one and $f \( x \) = 1$. Put $F = ker P_H ∩ ker f$. Then $parallel x plus.minus t y parallel gt.eq 1$ for $y in F$. If both were at most $1 + d$, then $parallel P_H x plus.minus t y parallel lt.eq 1 + 2 d$, and the normalized head would have norm at least
  $ frac(1 - d, 1 + 2 d) gt.eq 1 - 3 d . $
  Proposition 52 would give $t lt.eq \( 1 + 2 d \) omega_(upright("coef")) \( 3 d \)$ for $parallel y parallel gt.eq 1$, contrary to the chosen parameter. Thus the average is greater than $1 + d \/ 2$.
  Finally set $d = \( t \/ 64 \)^2$ for the fourth assertion. Choose $H$ so that $parallel x - P_H x parallel < d \/ 8$. The normalized head $x_0 = P_H x \/ parallel P_H x parallel$ then exists and satisfies $parallel x - x_0 parallel < d \/ 4$, because normalization costs at most the projection error again. For $y in ker P_H$ of norm at least one, Proposition 55 and $32 sqrt(d) = t \/ 2 < t$ show that one endpoint $x_0 plus.minus t y$ has norm greater than $1 + d$. Both have norm at least one. Their average exceeds $1 + d \/ 2$, and replacing $x_0$ by $x$ leaves more than $1 + d \/ 4 = 1 + t^2 \/ 16384$. ◻
]

=== 18.5 A conditional estimate using prefix truncation <stab:coef:conditional>

One can also keep an endpoint law separate while using the head-sign comparison. The following argument retains the wholly exterior term under that law; its coefficient is smaller than the one obtained by bounding every conditional term through the pooled expectation.

#thm([Proposition 18.8.])[
  #emph[For $0 < t < 1$, set $delta = \( t \/ 25 \)^2$. If $x_0 = P_H x_0$ and $y$ are unit vectors, $P_H y = 0$, and both are finitely supported, then 
#[#set math.equation(numbering: n => "(18.18)")
 $ max { parallel x_0 + t y parallel \, parallel x_0 - t y parallel } > 1 + delta . $ <stab:coef:finite-strict>]

 For general unit $y in ker P_H$, the same inequality holds with $gt.eq$ in place of $>$. Moreover, 
#[#set math.equation(numbering: n => "(18.19)")
 $ hat(delta)_Z \( t \) gt.eq t^2 \/ 2500 . $ <stab:coef:conditional-modulus-eq>]

]
] <stab:coef:conditional-modulus>

#proof[
  If (18.18) failed, represent the two scaled endpoints by exact finite atom laws and use their equal mixture as in (18.2). Put $eta = delta \/ \( 1 + delta \)$; this is the deficit of the scaled unit head. The conditional and pooled deficits all equal $eta$. Using the #emph[truncation] proof of Lemma 37, the calculations (18.3)–(18.4) give
  $ parallel bb(E) c parallel_2 lt.eq sqrt(2 eta) \, quad parallel bb(E) s parallel_2 lt.eq 2 sqrt(2 eta) \, quad parallel M_s parallel_2^2 lt.eq 12 eta \, quad parallel M_c parallel_2 lt.eq sqrt(12 eta) + sqrt(2 eta) . $
  In the plus law, $bb(E)_(+) parallel O \( A \) parallel lt.eq sqrt(2 eta)$ because its own mean deficit is $eta$. For the crossing part use the disjoint-test-segment proof of Lemma 40 and the bound of its conditional absolute mean by twice the pooled one. Therefore
  #[#set math.equation(numbering: n => "(18.20)")
   $ frac(t, 1 + delta) lt.eq 2 \( sqrt(12 eta) + sqrt(2 eta) \) + sqrt(2 eta) lt.eq 12 sqrt(delta) . $ <stab:coef:twelve-conditional>]
  Indeed $2 sqrt(12) + 3 sqrt(2) < 12$ and $eta lt.eq delta$. But $delta < 1 \/ 625$ and
  $ 12 \( 1 + delta \) sqrt(delta) = 12 / 25 \( 1 + delta \) t < t \, $
  contradicting (18.20).
  For a completed unit tail $y$, take finite ancestral projections $P_K y arrow.r y$ with $K supset H$. For all sufficiently large $K$ the projections are nonzero. Normalize them to unit vectors; they still vanish on $H$ and converge to $y$. Passing to the limit in the finite strict inequality yields the stated non-strict one.
  Given an arbitrary unit center $x$, choose $H$ so that its normalized head $x_0$ satisfies $parallel x - x_0 parallel < delta \/ 2$. Choose a norm-one $f in Z^(*)$ with $f \( x \) = 1$, and set $F = ker P_H ∩ ker f$. For unit $y in F$, both actual endpoint norms are at least one, and the maximum is at least $1 + delta \/ 2$. Their average is at least $1 + delta \/ 4$. For a fixed direction, the average $s mapsto \( parallel x + s y parallel + parallel x - s y parallel \) \/ 2$ is even and convex, hence nondecreasing for $s gt.eq 0$. This extends the bound to all $y in F$ of norm at least one and gives $hat(delta)_Z \( t \) gt.eq delta \/ 4 = t^2 \/ 2500$. ◻
]

=== 18.6 Separated families in a lens <separated-families-in-a-lens>

For the forest space $X$, the function $g \( s \)$ of Proposition 53 tends to zero and is of order $s^(1 \/ 4)$ as $s arrow.b 0$. To see the separated-lens consequence directly, fix $t > 0$ and choose $0 < Delta < 1 \/ 2$ such that

$ \( 1 + 2 Delta \) g \( 4 Delta \) + Delta < t . $

If an infinite family $\( y_j \)$ satisfies $parallel x parallel > 1 - Delta$, $parallel x plus.minus y_j parallel lt.eq 1$, and $parallel y_i - y_j parallel gt.eq 2 t$ for distinct indices, choose a finite head with $parallel Q_H x parallel lt.eq Delta$ and a pair with $parallel P_H \( y_i - y_j \) \/ 2 parallel lt.eq Delta$. Put $v = \( y_i - y_j \) \/ 2$. The vectors $x plus.minus v$ are averages of opposite endpoints and lie in $B_X$. The vectors $P_H x \/ \( 1 + 2 Delta \)$ and $Q_H v \/ \( 1 + 2 Delta \)$ satisfy the hypotheses of Proposition 53; the first has deficit at most $4 Delta$, whereas the second has norm at least $\( t - Delta \) \/ \( 1 + 2 Delta \)$. This contradicts the choice of $Delta$.

The actual-center estimate gives a direct version with one head for the whole family. For example, choose $lambda in \( 0 \, 1 \)$ so that $2 G_(upright("orig")) \( lambda \) < epsilon \/ 2$. If $x plus.minus y_j in B_X$ for an infinite $epsilon$-separated family and $parallel x parallel gt.eq 1 - lambda$, the same head works for every $j$. The bounded sequence $\( P_H y_j \)$ has two terms at distance less than $epsilon \/ 2$, while the corresponding tail difference has norm at most $2 G_(upright("orig")) \( lambda \) < epsilon \/ 2$, a contradiction.

== 19 Alternative cancellation estimates <molb:sec:variants>

The first two comparisons use different information about the same crossing coefficients. Fractional matching assigns cancellation to the slack of individual outcomes. A cross-law comparison instead keeps the smaller absolute mass supplied by the two endpoints in each cone. We then record the losses from using only one ordered sign conflict and from retaining weaker projection and trimming estimates. These are comparisons of proof mechanisms and error budgets; their lens bounds need not improve the main theorem.

The matching and cross-law arguments below concern the finite-height forest space $X = J^(*)$. The ordered and weaker-trimming arguments concern $B_oo$, with their own hypotheses stated at the point of use. Write $upright(bold(1))_I = d_I$ for a segment functional. The atomic, gauge, and coordinate-polar descriptions of $X$ agree by Proposition 31. Its finite head normers and atomic approximations come from Lemma 7 and Corollary 8.

For a finite ancestor-closed head $H$, put $P = P_H$ and $Q = I - P$. The minimal excluded nodes $g$ are its gates, and $T_g$ denotes the full descendant cone at $g$. The contractive projections and the cone formula of Proposition 33 imply the two estimates used below: gate-coordinate restriction is contractive into $ell_2$, and a combination of rooted tail segments with absolute coefficient totals $a_g$ has norm at most $parallel \( a_g \) parallel_2$. The latter follows by applying the triangle inequality in each cone and then the cone formula. Countable cone sums and norm limits use the completed version of that proposition.

=== 19.1 Fractional matching of opposite masses <molb:sec:matching>

#thm([Lemma 19.1.])[
  #emph[Fix a primal unit vector $z$ supported on $H$, and a finite probability distribution of represented atoms $A_omega = sum_I c_(omega I) upright(bold(1))_I$, with probabilities $p_omega$. Write 
$ b_(omega I) = z \( I \) \, #h(2em) L_omega = 1 - sum_I b_(omega I)^2 \, #h(2em) B_omega = sum_I b_(omega I) Q upright(bold(1))_I . $

 At each gate let $P_g$ and $M_g$ be the positive and absolute negative coefficient masses in $bb(E) B$. Then 
#[#set math.equation(numbering: n => "(19.1)")
 $ sum_g min \( P_g \, M_g \)^2 lt.eq bb(E) L . $ <molb:eq:matching-capacity>]

]
] <molb:lem:matching>

#proof[
  Only crossing segments contribute to $B_omega$. At any gate an outcome supplies at most one crossing, with signed coefficient $b_(omega g)$. Regard its absolute mass $p_omega \| b_(omega g) \|$ as a supply. Match positive and negative supplies at this gate by repeatedly assigning the smaller of the two remaining supplies to a pair and deleting every exhausted supply. This finite procedure produces pair masses $m gt.eq 0$ whose total is $min \( P_g \, M_g \)$. The total mass using any one outcome at this gate is at most its supply.
  In a pair of positive mass, the two head intervals end at the parent of the gate. They are strictly nested: equality would give equal primal evaluations, whereas the signs are opposite. Denote the absolute evaluations of the longer and shorter heads by $u > 0$ and $v > 0$, respectively. Splitting the longer crossing immediately before the shorter head gives a squared-test gain
  $ D = \( u + v \)^2 + v^2 - u^2 gt.eq u v . $
  Charge $\( m \/ u \) D$ to the outcome containing the longer crossing. This charge is at least $m v$.
  Here is the capacity argument for all these charges. Fix an outcome $omega$ and one of its crossing segments $I$. Its absolute evaluation $u$ is fixed. The sum of the fractions $m \/ u$ over pairs in which this segment supplies the longer head is at most $p_omega$. Consequently its total charge is at most $p_omega$ times the largest proposed gain on this segment, or zero if there is no proposal. Choose one split giving this largest gain on every affected segment of the outcome. These segments were disjoint, so all chosen splits can be made together. Their total gain is at most $L_omega$, because the new family is a legal test on the primal unit vector. Summing gives a bound $p_omega L_omega$ for the charge to this outcome. Thus
  $ sum_g sum_(upright("pairs at ") g) m v lt.eq bb(E) L . $
  At a fixed gate the shorter member of a pair contributes the quantity $m \/ v$. The supply constraint for each outcome implies that the sum of these quantities over pairs having that outcome as shorter member is at most its probability. There is at most one crossing per outcome at the gate, hence $sum m \/ v lt.eq sum_omega p_omega = 1$. Cauchy–Schwarz now gives
  $ min \( P_g \, M_g \)^2 = \( sum m \)^2 lt.eq \( sum m v \) \( sum m \/ v \) lt.eq sum m v . $
  Sum over gates to obtain (19.1). ◻
]

The independent-sample argument gives a stronger numerical bound for these same masses. Indeed Lemma 37 gives $4 sum_g P_g M_g lt.eq 2 bb(E) L$, so

$ sum_g min \( P_g \, M_g \)^2 lt.eq sum_g P_g M_g lt.eq 1 / 2 bb(E) L . $

The fractional proof above instead displays a matching and charges its pairs to individual segment-test slacks. The next application retains its stated capacity bound to show how that argument controls a whole lens.

#thm([Proposition 19.2.])[
  #emph[For $0 < h < 1 \/ 4$ and every unit $x in X$, there is a finite ancestor-closed $H$, depending only on $x \, h$, such that $parallel x plus.minus y parallel lt.eq 1 + h$ implies 
#[#set math.equation(numbering: n => "(19.2)")
 $ parallel Q y parallel lt.eq h + \( 1 + h \) #scale(x: 120%, y: 120%)[\[] h + 2 sqrt(6 h) + 2 \( 2 h + 3 sqrt(6 h) \) #scale(x: 120%, y: 120%)[\]] . $ <molb:eq:matching-lens>]

]
] <molb:prop:matching-lens>

#proof[
  Choose a finitely supported primal unit vector $z$ with $x \( z \) > 1 - h$, and enlarge its ancestor closure so that $parallel Q x parallel < h$. Approximate each $\( x plus.minus y \) \/ \( 1 + h \)$ within $h$ by a finite mean of atoms. Let $bb(E)$ be their equal mixture and $bb(E)_plus.minus$ the two conditional means. The identity
  $ 2 \( 1 - A \( z \) \) = \( 1 - sum c_I^2 \) + \( 1 - sum b_I^2 \) + sum \( c_I - b_I \)^2 $
  has three nonnegative terms on the right. Also $bb(E) A \( z \) gt.eq \( 1 - h \) \/ \( 1 + h \) - h gt.eq 1 - 3 h$. Therefore
  $ bb(E) L lt.eq 6 h \, #h(2em) bb(E) sum \( c_I - b_I \)^2 lt.eq 6 h \, #h(2em) bb(E) parallel Q A - B parallel lt.eq sqrt(6 h) . $
  The corresponding conditional replacement error is at most $2 sqrt(6 h)$. Since $bb(E) A$ approximates $x \/ \( 1 + h \)$ within $h$, gate-coordinate contraction gives
  $ parallel P - M parallel_2 lt.eq parallel bb(E) B parallel lt.eq 2 h + sqrt(6 h) . $
  By Lemma 60 and the coordinatewise identity $P + M = \| P - M \| + 2 min \( P \, M \)$, $parallel P + M parallel_2 lt.eq 2 h + 3 sqrt(6 h)$. Each conditional absolute coefficient mass is at most twice the mixed mass, whence $parallel bb(E)_(+) B parallel lt.eq 2 \( 2 h + 3 sqrt(6 h) \)$. Approximation and replacement bound the tail of $\( x + y \) \/ \( 1 + h \)$ by the bracket in (19.2); subtracting $Q x$ proves the result. The displayed bound tends to zero with $h$ uniformly in the unit center. ◻
]

=== 19.2 Comparing the two endpoint laws <molx:separate-laws>

The tail can also be recovered by comparing the two endpoint laws separately. This argument keeps the smaller absolute mass in each subtree. It gives a different proof, with the following constant.

#thm([Proposition 19.3.])[
  #emph[Let $X = J^(*)$ be the finite-height forest space defined by (1.1), with the atomic and polar norm identifications of Proposition 31. For a finite ancestor-closed set $A subset cal(F)$, let $P_A$ be coordinate restriction on $X$ and let $Q_A = I - P_A$. If 
$ P_A x = x \, #h(2em) Q_A y = y \, #h(2em) parallel x + y parallel \, parallel x - y parallel lt.eq 1 \, $

 then, with $d = 1 - parallel x parallel$, 
#[#set math.equation(numbering: n => "(19.3)")
 $ parallel y parallel lt.eq \( sqrt(6) + 2 sqrt(2) \) sqrt(d) lt.eq 6 sqrt(d) . $ <molx:minimum-conclusion>]

]
] <molx:minimum-tail>

#proof[
  Let $R$ be the minimal vertices of $cal(F) \\ A$, and let $U_r$ be the descendant subtree rooted at $r in R$. Lemma 2 supplies the contractive projections, and Lemma 3 supplies both the exact subtree norm identity (2.1) and the contractive root-coordinate map.
  If $x = 0$, the conclusion follows from $parallel y parallel lt.eq 1$. Otherwise, Lemma 7 gives a head-supported test $a in J$ with $rho \( a \) = 1$ and $x \( a \) = parallel x parallel$. Since $P_A y = 0$, both endpoints $z^plus.minus = x plus.minus y$ have value $1 - d$ on $a$.
  Write each represented atom as
  $ m = sum_i c_i d_(S_i) \, #h(2em) sum_i c_i^2 lt.eq 1 \, $
  with its disjoint segment family included in the data. Corollary 8 supplies the norm approximations used below.
  Fix $eta > 0$. Choose two finite laws on represented atoms, with expectations $E_(+) \, E_(-)$, such that $parallel E_plus.minus m - z^plus.minus parallel lt.eq eta$. For each atom put
  $ b_i = a \( S_i \) \, #h(2em) m_a = sum_i b_i d_(S_i) \, #h(2em) D \( m \) = 1 - sum_i b_i^2 . $
  The coefficient identity gives
  $ D \( m \) + sum_i \( c_i - b_i \)^2 = 1 + sum_i c_i^2 - 2 m \( a \) lt.eq 2 \( 1 - m \( a \) \) . $
  Since each endpoint has the same evaluation on $a$, each law separately satisfies
  #[#set math.equation(numbering: n => "(19.4)")
   $ E_plus.minus D \( m \) lt.eq 2 \( d + eta \) \, #h(2em) E_plus.minus sum_i \( c_i - b_i \)^2 lt.eq 2 \( d + eta \) . $ <molx:separate-deficits>]
  Consequently, for $e = eta + sqrt(2 \( d + eta \))$,
  #[#set math.equation(numbering: n => "(19.5)")
   $ parallel z^plus.minus - E_plus.minus m_a parallel lt.eq e . $ <molx:separate-error>]
  The estimates for separate laws here use $y \( a \) = 0$; they do not follow from a bound on their mixture alone.
  Only segments crossing from $A$ into its complement contribute to $Q_A m_a$. In each $U_r$ there is at most one such segment in a represented atom, because it must pass through $r$. Let $b_r \( m \)$ be its coefficient, or zero if it is absent. The restriction of $m_a$ to $J \( U_r \)$ has norm at most $\| b_r \( m \) \|$ and value $b_r \( m \)$ on the unit vector at $r$. Segments wholly outside $A$, including those in components disjoint from $A$, have corrected coefficient zero; their original coefficients have already been included in (19.4).
  The truncation comparison in Lemma 37, applied to the test $a$ and the two represented families, gives
  #[#set math.equation(numbering: n => "(19.6)")
   $ 2 sum_(r : thin b_r \( m \) b_r \( m' \) < 0) \| b_r \( m \) b_r \( m' \) \| lt.eq D \( m \) + D \( m' \) . $ <molx:cross-conflict>]
  The important choice here is the law of each sample: we compare one sample from each endpoint, instead of two samples from their mixture.
  Now take $m$ from the plus law and $m'$ independently from the minus law. Set
  $ L_r^plus.minus = E_plus.minus \| b_r \( m \) \| \, #h(2em) S_r^plus.minus = E_plus.minus b_r \( m \) . $
  All these arrays have finite support. Independence and (19.4)–(19.6) yield
  #[#set math.equation(numbering: n => "(19.7)")
   $ sum_r \( L_r^(+) L_r^(-) - S_r^(+) S_r^(-) \) lt.eq 4 \( d + eta \) . $ <molx:cross-law-product>]
  The endpoint sum $z^(+) + z^(-) = 2 x$ vanishes outside $A$. By (19.5) and the contractive root-coordinate map, $parallel S^(+) + S^(-) parallel_2 lt.eq 2 e$. Therefore
  $ sum_r S_r^(+) S_r^(-) = 1 / 4 #scale(x: 120%, y: 120%)[\(] parallel S^(+) + S^(-) parallel_2^2 - parallel S^(+) - S^(-) parallel_2^2 #scale(x: 120%, y: 120%)[\)] lt.eq e^2 \, $
  and hence
  #[#set math.equation(numbering: n => "(19.8)")
   $ sum_r min \( L_r^(+) \, L_r^(-) \)^2 lt.eq sum_r L_r^(+) L_r^(-) lt.eq 4 \( d + eta \) + e^2 . $ <molx:min-mass>]
  Let $y_r = y \|_(J \( U_r \))$ and let $e_r^plus.minus$ be the norm of the restriction of $z^plus.minus - E_plus.minus m_a$ to that subtree. Equation (2.1) and (19.5) give $parallel \( e_r^plus.minus \)_r parallel_2 lt.eq e$. The restrictions of $z^plus.minus$ are $plus.minus y_r$, so
  $ parallel y_r parallel lt.eq min \( L_r^(+) \, L_r^(-) \) + e_r^(+) + e_r^(-) . $
  Combining (2.1), the Euclidean triangle inequality, and (19.8), we obtain the complete error estimate
  #[#set math.equation(numbering: n => "(19.9)")
   $ parallel y parallel lt.eq sqrt(4 \( d + eta \) + e^2) + 2 e \, #h(2em) e = eta + sqrt(2 \( d + eta \)) . $ <molx:minimum-budget>]
  Let $eta$ decrease to zero. This gives (19.3), since $sqrt(6) + 2 sqrt(2) < 6$. ◻
]

=== 19.3 An ordered sign comparison <molc:oriented-section>

An ordered sign comparison gives a tail estimate in terms of the head deficit. We work in the infinite-height space $B_oo$ of Remark 35, on $T = T_oo$, and write $J \( a \) = rho \( a \)$ for its segment test norm. Finite coefficient arrays are identified with coordinate functionals. We use the contractive projections and norming head tests from Lemma 4, the exact finite atomic representations from Lemma 5, and the exterior cone estimates from Lemma 6.

#thm([Proposition 19.4.])[
  #emph[Let $A$ be a nonempty finite ancestral set and let $x \, y in B_oo$ with $x = P_A x$ and $P_A y = 0$. For every $epsilon gt.eq 0$, 
$ max { parallel x + y parallel \, parallel x - y parallel } lt.eq 1 \, #h(2em) parallel x parallel gt.eq 1 - epsilon quad arrow.r.double quad parallel y parallel lt.eq \( sqrt(2) + sqrt(10) \) sqrt(epsilon) . $

]
] <molc:oriented-lens>

#proof[
  First suppose that $y$ is finitely supported and choose a finite ancestral set $B supset.eq A$ containing its support. Choose a test $a$ supported in $A$ such that $J \( a \) = 1$ and $chevron.l x \, a chevron.r = parallel x parallel$. Lemma 4 supplies such a test when $x eq.not 0$; when $x = 0$, any $J$-unit test supported in the nonempty set $A$ has the required equality.
  Choose a uniform sign $sigma in { - 1 \, 1 }$ and, conditionally on that sign, a finitely supported law of represented molecules $m = sum_i lambda_i upright(bold(1))_(S_i)$, with $S_i subset B$ and $sum_i lambda_i^2 lt.eq 1$, as supplied by Lemma 5, such that
  $ bb(E) \( m divides sigma \) = x + sigma y . $
  The representation includes the segment family and its coefficients. Thus $bb(E) m = x$ and $bb(E) \( sigma m \) = y$. For each outcome define
  $ u_i = a \( S_i \) \, #h(2em) D = 1 - sum_i u_i^2 \, #h(2em) H = sum_i \( lambda_i - u_i \)^2 \, #h(2em) tilde(m) = sum_i u_i upright(bold(1))_(S_i) . $
  Both $D$ and $H$ are nonnegative, and
  #[#set math.equation(numbering: n => "(19.10)")
   $ bb(E) \( D + H \) = bb(E) (1 + sum_i lambda_i^2 - 2 chevron.l m \, a chevron.r) lt.eq 2 \( 1 - parallel x parallel \) lt.eq 2 epsilon . $ <molc:joint-budget>]
  The nonempty suffixes $S_i \\ A$ remain disjoint segments. Therefore, with $Q = I - P_A$,
  #[#set math.equation(numbering: n => "(19.11)")
   $ parallel Q \( m - tilde(m) \) parallel lt.eq sqrt(H) \, #h(2em) parallel y - bb(E) \( sigma Q tilde(m) \) parallel lt.eq bb(E) sqrt(H) lt.eq sqrt(2 epsilon) . $ <molc:replacement>]
  Let $R$ consist of the minimal nodes of $B \\ A$. These nodes are incomparable, and their descendant subtrees intersected with $B$ partition $B \\ A$. For each $r in R$, let $c_r$ be the coefficient $u_i$ of the segment crossing from $A$ through $r$, or zero if there is no crossing. A segment entirely outside $A$ has $u_i = 0$, and each segment meets at most one member of $R$. Consequently $\( Q tilde(m) \) \( r \) = c_r$ and
  $ sum_(r in R) \| c_r - m \( r \) \|^2 lt.eq H . $
  Since $bb(E) m = x$ vanishes on $R$, Jensen’s inequality gives
  #[#set math.equation(numbering: n => "(19.12)")
   $ sum_(r in R) \( bb(E) c_r \)^2 lt.eq bb(E) H lt.eq 2 epsilon . $ <molc:frontier-mean>]
  Compare two represented molecules, using primes for the second. Write $c^(+) = max \( c \, 0 \)$ and $c^(-) = max \( - c \, 0 \)$ coordinatewise. Retain only conflicts with $c_r > 0 > c'_r$ in the nonnegative sum of Lemma 37. Its truncation proof, applied to these families and the test $a$, gives
  #[#set math.equation(numbering: n => "(19.13)")
   $ 2 sum_(r in R) c_r^(+) \( c'_r \)^(-) lt.eq D + D' . $ <molc:ordered-conflict>]
  Thus the ordered estimate uses only one of the two opposite-sign orientations controlled by the common boundary comparison. Take two independent copies of the mixture law. Independence and (19.13) imply
  $ sum_(r in R) \( bb(E) c_r^(+) \) \( bb(E) c_r^(-) \) lt.eq bb(E) D . $
  Thus the unsigned means satisfy
  #[#set math.equation(numbering: n => "(19.14)")
   $ sum_(r in R) \( bb(E) \| c_r \| \)^2 & = sum_(r in R) \( bb(E) c_r \)^2 + 4 sum_(r in R) \( bb(E) c_r^(+) \) \( bb(E) c_r^(-) \)\
 & lt.eq 2 epsilon + 4 bb(E) D lt.eq 10 epsilon . $ <molc:ten-deficit>]
  The coefficient $10$ results from retaining just one ordered conflict and then using the separate bounds on $bb(E) H$ and $bb(E) D$ in (19.10). Using both orientations in the common boundary comparison gives a smaller unsigned-mass bound; the present calculation records the cost of the ordered choice.
  Only crossing segments contribute to $Q tilde(m)$. For a finitely supported test $b$, put
  $ L_r \( b \) = max { \| b \( \[ r \, s \] \) \| : s in B \, med r prec.curly.eq s } . $
  The segments attaining these finitely many maxima lie in disjoint subtrees, so $sum_r L_r \( b \)^2 lt.eq J \( b \)^2$. Hence
  $ \| chevron.l bb(E) \( sigma Q tilde(m) \) \, b chevron.r \| lt.eq sum_r bb(E) \| c_r \| thin L_r \( b \) lt.eq sqrt(10 epsilon) thin J \( b \) . $
  Taking the supremum over $J \( b \) lt.eq 1$ and using (19.11) proves the finite-support estimate. If $R$ is empty, all these tail sums are zero and the same conclusion holds.
  For general $y in B_oo$, apply the finite estimate to $x plus.minus P_B y = P_B \( x plus.minus y \)$ along the exhaustion in Lemma 4. These pairs remain in the unit ball, and $P_B y arrow.r y$ in norm, so the same bound passes to the limit. ◻
]

===== 19.3.1 The original-center budget. <molc:original-center-budget>

Put $K = sqrt(2) + sqrt(10)$. Given $0 < t < 1$, choose $0 < d < 1$ with $K sqrt(3 d \( 1 + 2 d \)) < t$. For $x in S_(B_oo)$, choose a nonempty finite ancestral set $A$ with $parallel x - P_A x parallel lt.eq d$, and choose a norm-one functional $x^(*)$ with $x^(*) \( x \) = 1$. Set $F = ker P_A ∩ ker x^(*)$. If $y in F$, $parallel y parallel gt.eq 1$, and both $parallel x plus.minus t y parallel lt.eq 1 + d$, then

$ parallel P_A x plus.minus t y parallel lt.eq 1 + 2 d \, #h(2em) parallel P_A x parallel gt.eq 1 - d . $

Apply Proposition 63 after dividing both vectors by $1 + 2 d$, with deficit $3 d \/ \( 1 + 2 d \)$. It gives

$ t parallel y parallel lt.eq K sqrt(3 d \( 1 + 2 d \)) < t \, $

a contradiction. Both original endpoint norms are at least $1$ because $x^(*) \( x plus.minus t y \) = 1$, so their average exceeds $1 + d \/ 2$. This proves the averaged asymptotic modulus bound $d \/ 2$ with the stated choice of $d$.

===== 19.3.2 The splitting variant and a half-tail budget. <molc:half-tail-budget>

The splitting proof in Lemma 37 gives the same ordered inequality (19.13), since its squared-test gain is at least twice the absolute product of the two head sums at each opposite-sign gate. Using that proof with the same single orientation therefore retains the bound $10 d$ above. In a finite ancestral set, let $L$ denote the dual norm of $J$, let the head $x$ have $L \( x \) = 1$, and suppose $L \( x plus.minus z \) lt.eq 1 + eta$ with $z$ vanishing on the head. Applying this version with $d = 1 - 1 \/ \( 1 + eta \)$ gives

#[#set math.equation(numbering: n => "(19.15)")
 $ L \( z \) lt.eq \( 1 + eta \) \( sqrt(2 d) + sqrt(10 d) \) . $ <molc:finite-ordered-lens>]

For $0 < t < 1$, choose $eta > 0$ so that the right side is less than $t \/ 2$. Approximate an arbitrary unit center within $eta \/ 4$ by a finite unit center on a head $A$. For any completed tail $y in ker P_A$ of norm at least $1$, choose a finite ancestral $B supset.eq A$ with $parallel P_B y parallel > 1 \/ 2$. If both norms at the finite center with perturbation $t y$ were at most $1 + eta$, projection into $B$ and (19.15) would give $t parallel P_B y parallel < t \/ 2$. Both norms at the finite center are at least $1$. Passing back to the original center therefore gives an average greater than $1 + eta \/ 4$.

=== 19.4 A weaker trimming budget <mold:weaker-trimming>

We work in the infinite-height coordinate predual $B_oo$, with its atomic gauge presentation from Lemma 5. Let $D$ be a nonempty finite ancestral set, $x = P_D x$, $parallel x parallel = 1$, and $z in ker P_D subset B_oo$. We use $Q_D = I - P_D$. This calculation keeps only the bounds $parallel Q_D parallel lt.eq 2$ and a squared-test gain bounded below by the absolute product of the two opposite head sums per conflict, although the earlier lemmas give $parallel Q_D parallel lt.eq 1$ and at least twice that gain. We record the resulting larger error budget from these weaker inputs. Suppose

$ 0 < h < 1 \, #h(2em) max { parallel x + z parallel \, parallel x - z parallel } lt.eq 1 + h . $

Then

#[#set math.equation(numbering: n => "(19.16)")
 $ parallel z parallel lt.eq \( 1 + h \) #scale(x: 120%, y: 120%)[\(] 2 sqrt(10 h) + 2 sqrt(2 h) #scale(x: 120%, y: 120%)[\)] . $ <mold:weaker-trimming-bound>]

For the proof, first take $z$ finitely supported and choose a head-supported norming functional $f$ for $x$, using Lemma 4. Lemma 5 represents $\( x plus.minus z \) \/ \( 1 + h \)$ by finite probability distributions of segment atoms $m = sum_i a_i d_(S_i)$. Put $b_i = f \( d_(S_i) \)$, $tilde(m) = sum_i b_i d_(S_i)$, $L = sum_i \( a_i - b_i \)^2$, and $Delta = 1 - sum_i b_i^2$. Since $L + Delta = 1 + sum_i a_i^2 - 2 f \( m \)$ and $bb(E)_plus.minus f \( m \) = 1 \/ \( 1 + h \)$, each conditional distribution satisfies

$ bb(E)_plus.minus L lt.eq 2 h \, #h(2em) bb(E)_plus.minus Delta lt.eq 2 h . $

Let $B_r = tilde(m) \( e_r \)$ at the roots immediately outside $D$, and use $bb(E)$ for the equal mixture of the two distributions. Each segment meets at most one such root. Since $bb(E) m = x \/ \( 1 + h \)$,

$ sum_r \( bb(E) B_r \)^2 lt.eq bb(E) L lt.eq 2 h . $

For independent outcomes, trimming the longer of two opposite-signed heads preserves disjointness and increases its squared evaluation by at least $\| B_r B'_r \|$. Retaining this bound on the gain gives

$ sum_(B_r B'_r < 0) \| B_r B'_r \| lt.eq Delta + Delta' . $

The modifications can be simultaneous: different exterior roots use distinct segments of either list. Independence now gives

$ sum_r \( bb(E) \| B_r \| \)^2 = sum_r \( bb(E) B_r \)^2 + 2 bb(E) sum_(B_r B'_r < 0) \| B_r B'_r \| lt.eq 2 h + 8 h = 10 h . $

For either conditional distribution, the corrected tail has norm at most $parallel \( bb(E)_plus.minus \| B_r \| \)_r parallel_2 lt.eq 2 sqrt(10 h)$. Indeed, in each exterior component its mean is a positive scalar times a convex combination of signed segment indicators; products of these finite combinations produce disjoint segment atoms. Recovering the uncorrected conditional tail costs at most $parallel Q_D parallel bb(E)_plus.minus sqrt(L) lt.eq 2 sqrt(2 h)$, proving (19.16). Approximation in $ker P_D$, with an arbitrarily small increase of $h$, proves the completed-tail assertion; the required density is supplied by Lemma 4.

For $0 < t < 1$, choose $h in \( 0 \, 1 \)$ so that the right side of (19.16) is less than $t$. At a finite unit head, every displacement in the tail of norm at least $t$ makes one endpoint norm exceed $1 + h$, while both endpoint norms are at least one. A finite unit approximation to an arbitrary unit center with error less than $h \/ 4$ therefore gives $hat(delta)_(B_oo) \( t \) gt.eq h \/ 4$.

== 20 Signs determined by the target tail <signs-determined-by-the-target-tail>

Work in the finite-height forest space $X = J^(*)$. For a finite ancestor-closed head $H$, put $P = P_H$ and $Q = I - P$; its gates $g$ are the minimal excluded nodes, and $T_g$ is the full descendant cone rooted at $g$. We use the represented atoms, head normers, and completed cone formula from Lemma 7, Corollary 8, and Proposition 33.

=== 20.1 Signs chosen from the target tail <molb:sec:target-signs>

#thm([Proposition 20.1.])[
  #emph[Suppose $P x = x$, $Q y = y$, and $parallel x plus.minus y parallel lt.eq 1$. Then 
#[#set math.equation(numbering: n => "(20.1)")
 $ parallel y parallel lt.eq \( 2 sqrt(2) + 2 sqrt(6) \) sqrt(1 - parallel x parallel) lt.eq 8 sqrt(1 - parallel x parallel) . $ <molb:eq:target-sign-bound>]

 Consequently, if $parallel p plus.minus u_j parallel lt.eq 1$ and $parallel u_i - u_j parallel gt.eq epsilon > 0$ for all distinct $i \, j$ in an infinite sequence, then 
#[#set math.equation(numbering: n => "(20.2)")
 $ parallel p parallel lt.eq 1 - epsilon^2 \/ 256 . $ <molb:eq:target-separated>]

]
] <molb:prop:target-signs>

#proof[
  The case $x = 0$ in (20.1) follows from $parallel y parallel lt.eq 1$. Otherwise choose a primal unit vector $z$ supported on $H$ with $x \( z \) = parallel x parallel$. Set
  $ Delta = 1 - parallel x parallel \, #h(2em) h_g = parallel y \|_(T_g) parallel \, #h(2em) R^2 = sum_g h_g^2 = parallel y parallel^2 \, #h(2em) theta = 1 \/ 4 . $
  If $h_g > 0$ and $g$ has parent $p_g in H$, inspect the terminal head intervals $\[ q \, p_g \]$ with absolute $z$-sum at least $theta h_g$. When there are any, choose the shortest such interval and let $d_g in { - 1 \, 1 }$ be the sign of its sum. In all other cases put $d_g = 1$. The signs depend on $z \, y \, H$, and will be the same for both endpoint approximations.
  For an atom $A = sum_I a_I upright(bold(1))_I$, put $b_I = z \( I \)$, $tilde(A) = sum_I b_I upright(bold(1))_I$, and $L_A = 1 - sum_I b_I^2$. Let $b_g$ be its crossing coefficient, zero if there is no crossing. We claim
  #[#set math.equation(numbering: n => "(20.3)")
   $ sum_g h_g \| b_g \| lt.eq sum_g h_g d_g b_g + 2 theta R^2 + L_A \/ theta . $ <molb:eq:target-charge>]
  Call a gate bad if $h_g > 0$, $d_g b_g < 0$, and $\| b_g \| gt.eq theta h_g$. Its crossing head qualifies for the selection above; it strictly contains the selected shortest suffix, since the signs disagree. Delete that suffix and the tail from the crossing, retaining its nonempty initial part. The squared-test gain is at least $2 \| b_g \| theta h_g$. All bad gates use distinct segments, so the deletions preserve a disjoint test family and
  $ 2 theta sum_(g upright(" bad")) h_g \| b_g \| lt.eq L_A . $
  At remaining gates with $d_g b_g < 0$, the sum of $h_g \| b_g \|$ is at most $theta sum_g h_g^2 = theta R^2$. The identity $\| b_g \| = d_g b_g + 2 \| b_g \| upright(bold(1))_({ d_g b_g < 0 })$ proves (20.3).
  Fix $rho > 0$, and approximate each endpoint $x + sigma y$, $sigma = plus.minus 1$, separately within $rho$ by a finite atom mean. For its expectation, the usual coefficient identity gives
  $ bb(E) L_A lt.eq 2 \( Delta + rho \) \, #h(2em) parallel bb(E) tilde(A) - \( x + sigma y \) parallel lt.eq rho + sqrt(2 \( Delta + rho \)) = : E_rho . $
  Here each law has this bound because $y \( z \) = 0$. If $r_g = parallel \[ bb(E) tilde(A) - \( x + sigma y \) \] \|_(T_g) parallel$, then $parallel \( r_g \) parallel_2 lt.eq E_rho$. Thus
  $ h_g lt.eq bb(E) \| b_g \| + r_g \, #h(2em) \| bb(E) b_g - sigma y \( g \) \| lt.eq r_g . $
  Multiply by $h_g$, sum, and apply (20.3) to obtain
  $ R^2 lt.eq sigma sum_g h_g d_g y \( g \) + 2 R E_rho + 2 theta R^2 + 2 \( Delta + rho \) \/ theta . $
  All sums converge: $\( h_g \) in ell_2$, $\| y \( g \) \| lt.eq h_g$, and the error-cone norms are square summable. Both signs yield this inequality with the same $d_g$. Select the sign for which the first term is nonpositive and let $rho arrow.b 0$. With $theta = 1 \/ 4$,
  $ 1 / 2 R^2 lt.eq 2 R sqrt(2 Delta) + 8 Delta . $
  Solving this quadratic proves (20.1), including $Delta = 0$.
  For the separated-sequence consequence, fix $rho > 0$ and choose a finite ancestor-closed $H$ with $parallel Q p parallel lt.eq rho$. The head projections of the bounded sequence have a pair with $parallel P \( u_i - u_j \) parallel lt.eq 2 rho$. Let $v = \( u_i - u_j \) \/ 2$. Convexity gives $parallel p plus.minus v parallel lt.eq 1$, while $parallel P v parallel lt.eq rho$ and $parallel v parallel gt.eq epsilon \/ 2$. Therefore
  $ parallel P p plus.minus Q v parallel lt.eq 1 + 2 rho \, #h(2em) parallel P p parallel gt.eq parallel p parallel - rho \, #h(2em) parallel Q v parallel gt.eq epsilon \/ 2 - rho . $
  Apply (20.1) with its constant $8$ after division by $1 + 2 rho$, then let $rho arrow.b 0$. This gives $epsilon \/ 2 lt.eq 8 sqrt(1 - parallel p parallel)$, which is (20.2). ◻
]

== 21 Choosing signs at the boundary <stab:sign:section>

The preceding tail estimates control cancellation by comparing signed and absolute means. We now retain more of the individual segment representations. Two sign choices will be useful. The first assigns one sign to every possible last vertex in the head; the second assigns one sign to every first vertex outside it. Both produce tail vectors whose norms can be recovered from their boundary coordinates.

The preferred-parent argument applies to either coordinate model $Z$. For the subsequent exit-sign and trimming arguments we use the infinite-height coordinate predual $B_oo$ from Section 3. Finite representations and head tests come from the model’s finite-hull theorem; the coordinate projections are contractive and finite coordinate vectors are norm dense. Write $H$ for a finite ancestral set. Its gates $G_H$ are the first vertices outside $H$, including roots of untouched forest components. A segment crossing the boundary has an exterior portion $\[ g \, w \]$ with $g in G_H$; the parent of $g$ is its last head vertex.

The shared coefficient estimate (15.1), rooted-mass bound (15.12) and same-sign norm formula (15.13) will turn crossing coefficients into tail norms. We also use the two subtree estimates (15.2); the lower estimate reads the root coordinates, and the upper estimate combines the norms in incomparable subtrees.

=== 21.1 One preferred sign at each last head vertex <one-preferred-sign-at-each-last-head-vertex>

Grouping exits by their parent permits different child subtrees to share one sign. The loss is controlled by the conflict between two nested head segments ending at that parent.

#thm([Proposition 21.1.])[
  #emph[Let $H$ be finite and ancestral, $x = P_H x$ with $parallel x parallel = 1$, and $u in ker P_H$. For every $L > 1$, 
#[#set math.equation(numbering: n => "(21.1)")
 $ max { parallel x + u parallel \, parallel x - u parallel } < L quad arrow.r.double quad parallel u parallel lt.eq 3 (sqrt(L^2 - 1) + 2 sqrt(frac(1 - L^(- 2), 2))) . $ <stab:sign:parent-lens-bound>]

]
] <stab:sign:parent-lens>

#proof[
  First suppose $u$ has finite support. The finite-hull theorem for $Z$ gives two finite laws of represented vectors $A = sum_i c_i d_(S_i)$ with disjoint segments and $sum_i c_i^2 lt.eq L^2$, such that $bb(E)_(+) A = x + u$ and $bb(E)_(-) A = x - u$. In $B_oo$ these laws also follow directly from the strict gauge representation, since both endpoint norms are strictly less than $L$. Choose a head test $p = P_H p$ with $rho \( p \) = 1$ and $x \( p \) = 1$. For each represented outcome set
  $ s_i = p \( S_i \) \, #h(2em) D = 1 - sum_i s_i^2 . $
  Every such disjoint family is a test for $rho$, so $D gt.eq 0$. Both conditional expectations of $sum_i c_i s_i$ equal one. Expansion and Cauchy–Schwarz give, separately for both laws,
  #[#set math.equation(numbering: n => "(21.2)")
   $ bb(E)_plus.minus sum_i \( c_i - s_i \)^2 lt.eq L^2 - 1 \, #h(2em) bb(E)_plus.minus D lt.eq 1 - L^(- 2) . $ <stab:sign:parent-error>]
  For the second inequality, use $1 lt.eq L \( bb(E)_plus.minus sum_i s_i^2 \)^(1 \/ 2)$.
  Pool the laws with probabilities $1 \/ 2$, and write $bb(E)$ for their mixture. At a vertex $v in H$ there is at most one segment of an outcome that crosses with last head vertex $v$: two such segments would both contain $v$. Let $C_v$ be its $s_i$ value, or zero if it is absent. Define
  $ p_v = bb(E) \( C_v \)_(+) \, #h(2em) n_v = bb(E) \( - C_v \)_(+) . $
  Take an independent second outcome, denoted by primes. If $C_v C'_v < 0$, their head portions are distinct nested segments ending at $v$. Split the longer immediately before the shorter starts. If its old sum is $C_v$, the new sums are $C_v - C'_v \, C'_v$; the gain in squared sums is
  $ \( C_v - C'_v \)^2 + \( C'_v \)^2 - C_v^2 = 2 \( C'_v \)^2 - 2 C_v C'_v gt.eq 2 \| C_v C'_v \| . $
  Make every such split in the outcome having the longer head. Different $v$ require different original segments, so these splits preserve disjointness in both outcomes. Their total gain is at most $D + D'$. Independence and (21.2) yield
  #[#set math.equation(numbering: n => "(21.3)")
   $ 2 sum_v p_v n_v lt.eq 1 - L^(- 2) . $ <stab:sign:parent-conflicts>]
  Choose sign $+$ at $v$ if $p_v gt.eq n_v$ and sign $-$ otherwise. The minority masses $m_v = min \( p_v \, n_v \)$ satisfy
  #[#set math.equation(numbering: n => "(21.4)")
   $ sum_v m_v^2 lt.eq frac(1 - L^(- 2), 2) . $ <stab:sign:parent-minority>]
  In $Q_H A$, replace each coefficient $c_i$ by $s_i$. In the expectation of either law this changes the vector by at most $sqrt(L^2 - 1)$, by (15.1), contractivity of $Q_H$, and (21.2). Segments wholly outside $H$ disappear because $s_i = 0$. Split the remaining expected crossing terms into $G_plus.minus + B_plus.minus$, retaining in $G_plus.minus$ the preferred parent sign and putting the other terms in $B_plus.minus$.
  For children $g in G_H$ of a fixed $v$, the sum of absolute coefficients in $B_plus.minus$ is at most $2 m_v$: a nonnegative conditional expectation is at most twice its mixture expectation. Put $b_g = \| B_plus.minus \( e_g \) \|$. Formula (15.13), followed by $sum_g b_g^2 lt.eq \( sum_g b_g \)^2$ within each parent group, gives
  $ parallel B_plus.minus parallel lt.eq 2 (sum_v m_v^2)^(1 \/ 2) lt.eq 2 sqrt(\( 1 - L^(- 2) \) \/ 2) . $
  Thus $plus.minus u = G_plus.minus + E_plus.minus$, where
  $ parallel E_plus.minus parallel lt.eq b_L \, #h(2em) b_L = sqrt(L^2 - 1) + 2 sqrt(\( 1 - L^(- 2) \) \/ 2) . $
  The two $G$ vectors have the same sign at each exit vertex. Lemma 15.5 therefore gives $parallel G_(+) parallel lt.eq parallel G_(+) + G_(-) parallel lt.eq 2 b_L$, and hence $parallel u parallel lt.eq 3 b_L$.
  For a completed tail $u$, approximate it by $Q_H u_j$ with finitely supported $u_j$. The strict endpoint hypothesis persists for all sufficiently large $j$. Passing to the limit proves the proposition. ◻
]

We use the averaged modulus $hat(delta)_Z$ from (7.2).

#thm([Corollary 21.2.])[
  #emph[Let $b_L = sqrt(L^2 - 1) + 2 sqrt(\( 1 - L^(- 2) \) \/ 2)$ for $L > 1$. If $0 < t < 1$ and $L$ is chosen so that $3 b_L < t$, then 
$ hat(delta)_Z \( t \) gt.eq \( L - 1 \) \/ 8 > 0 . $

]
] <stab:sign:parent-modulus>

#proof[
  Put $delta = \( L - 1 \) \/ 8$. Given a unit $x$, choose a finite-head unit $x_0$ with $parallel x - x_0 parallel < delta$, supported on an ancestral $H$. If $y in ker P_H$, $parallel y parallel gt.eq 1$, and the average of $parallel x plus.minus t y parallel$ were at most $1 + delta$, the average at $x_0$ would be less than $1 + 2 delta$. Each endpoint at $x_0$ has norm at least one by $P_H$-contractivity. Their maximum would therefore be less than $1 + 4 delta < L$. Proposition 65 would give $t lt.eq parallel t y parallel lt.eq 3 b_L < t$, a contradiction. ◻
]

#thm([Corollary 21.3.])[
  (A forest lens from preferred parent signs).  #emph[In the forest space $X$, let $h = P_H h$, $P_H u = 0$, and $h + u \, h - u in B_X$. Then 
#[#set math.equation(numbering: n => "(21.5)")
 $ parallel u parallel lt.eq 3 \( sqrt(2) + 2 \) sqrt(1 - parallel h parallel) . $ <stab:sign:forest-parent-bound>]

]
] <stab:sign:forest-parent-lens>

#proof[
  If $h = 0$, then $parallel u parallel lt.eq 1$ proves the assertion. Otherwise fix a norming head test $p$, so $rho \( p \) = 1$ and $h \( p \) = parallel h parallel$. For $epsilon.alt > 0$, approximate $h plus.minus u$ within $epsilon.alt$ by finite convex combinations $V_plus.minus = bb(E)_plus.minus A$ of atoms. Put $d_epsilon.alt = 1 - parallel h parallel + epsilon.alt$ and mix the two laws equally. The individual evaluation deficits obey $bb(E)_plus.minus L \( A \) lt.eq d_epsilon.alt$. Therefore Lemma 36 gives the prelimit budgets
  #[#set math.equation(numbering: n => "(21.6)")
   $ bb(E)_plus.minus E \( A \) lt.eq 2 d_epsilon.alt \, #h(2em) bb(E)_plus.minus D \( A \) lt.eq 2 d_epsilon.alt . $ <stab:sign:parent-approx-budget>]
  Group only the crossings by their last head vertex $v$, and let $p_v \, n_v$ be their positive and negative mean head-sum masses in the mixture. The simultaneous parent-indexed splitting in the proof of Proposition 65 gives $sum_v p_v n_v lt.eq d_epsilon.alt$. This step compares crossings that may leave through different children of the same parent. The proof applies in each forest component separately; untouched roots have no crossing term.
  Choose the same preferred parent sign for both laws. Each law’s wrong-sign mass at $v$ is at most $2 min \( p_v \, n_v \)$, so the sum of its squared parent masses is at most $4 d_epsilon.alt$. Splitting each parent mass among its child gates cannot increase that square sum. Thus the discarded replaced tail has norm at most $2 sqrt(d_epsilon.alt)$ by (15.13). Replacement itself costs at most $sqrt(2 d_epsilon.alt)$ under each law. If $M_plus.minus$ are the retained replaced tails, contractivity and the approximation errors give
  #[#set math.equation(numbering: n => "(21.7)")
   $ parallel plus.minus u - M_plus.minus parallel lt.eq epsilon.alt + \( sqrt(2) + 2 \) sqrt(d_epsilon.alt) . $ <stab:sign:parent-approx-remainder>]
  The signs of $M_(+)$ and $M_(-)$ agree at every gate. Hence their rooted norm formula gives $parallel M_(+) parallel lt.eq parallel M_(+) + M_(-) parallel$, at most twice the right side of (21.7). Adding the remaining error and letting $epsilon.alt arrow.b 0$ proves (21.5). ◻
]

=== 21.2 Majority signs at the first exit <majority-signs-at-the-first-exit>

From this point through the trimming argument we work in $B_oo$, and take the finite ancestral heads to contain its root.

There is a second way to remove the minority contributions. We keep the original atom coefficients, assigning signs at individual exit vertices. The cost now separates into a wholly exterior part and a wrong-sign crossing part. This leads to a direct quadratic bound for the averaged modulus.

#thm([Proposition 21.4.])[
  #emph[Let $x = P_H x$, $parallel x parallel = 1$, and $y in ker P_H$. Put $C_(upright("ex")) = 2 + 3 sqrt(2)$. For every $delta > 0$, with $eta = delta \/ \( 1 + delta \)$, 
#[#set math.equation(numbering: n => "(21.8)")
 $ max { parallel x + y parallel \, parallel x - y parallel } lt.eq 1 + delta quad arrow.r.double quad frac(parallel y parallel, 1 + delta) lt.eq 3 C_(upright("ex")) sqrt(eta) . $ <stab:sign:exit-lens-bound>]

]
] <stab:sign:exit-lens>

#proof[
  First suppose $y$ is supported on $K \\ H$ for a finite ancestral $K supset H$. By Lemma 5, represent $\( x plus.minus y \) \/ \( 1 + delta \)$ as finite expectations $bb(E)_plus.minus A$ of atoms $A = sum_i c_i d_(S_i)$ supported in $K$, where $sum_i c_i^2 lt.eq 1$. Choose a norming head test $p$ for $x$, set $s_i = p \( S_i \)$, and put $D_A = 1 - sum_i s_i^2$. The shared identity (15.3) gives
  $ D_A + sum_i \( c_i - s_i \)^2 lt.eq 2 \( 1 - A \( p \) \) . $
  Both terms on the left are nonnegative. Since $bb(E)_plus.minus A \( p \) = 1 \/ \( 1 + delta \)$, both conditional laws and their equal mixture satisfy
  #[#set math.equation(numbering: n => "(21.9)")
   $ bb(E)_plus.minus sum_i \( c_i - s_i \)^2 lt.eq 2 eta \, #h(2em) bb(E)_plus.minus D_A lt.eq 2 eta . $ <stab:sign:exit-error>]
  For a crossing at $g in G_H ∩ K$, denote its coefficients by $c_g = c_i$ and $s_g = s_i$, using zero for an absent crossing. Take independent outcomes from the mixture. The full opposite-sign comparison (15.8), applied to their head sums, gives
  $ 2 sum_g \( - s_g s'_g \)_(+) lt.eq D_A + D_(A') . $
  Its expectation is $4 sum_g bb(E) \( s_g \)_(+) thin bb(E) \( - s_g \)_(+)$ on the left and at most $4 eta$ on the right. Consequently
  #[#set math.equation(numbering: n => "(21.10)")
   $ sum_g bb(E) \( s_g \)_(+) thin bb(E) \( - s_g \)_(+) lt.eq eta . $ <stab:sign:exit-conflicts>]
  Choose $sigma_g in { - 1 \, 1 }$ to be a majority sign for $s_g$. The Euclidean norm of the vector of expected wrong-sign $s_g$ masses is at most $sqrt(eta)$, because $min \( P \, Q \)^2 lt.eq P Q$. Moreover, Jensen’s inequality in Euclidean space and (21.9) imply
  $ ∥\( bb(E) \| c_g - s_g \| \)_g∥_2 lt.eq sqrt(2 eta) . $
  Using $\( - sigma_g c_g \)_(+) lt.eq \( - sigma_g s_g \)_(+) + \| c_g - s_g \|$, we obtain
  #[#set math.equation(numbering: n => "(21.11)")
   $ ∥\( bb(E) \( - sigma_g c_g \)_(+) \)_g∥_2 lt.eq \( 1 + sqrt(2) \) sqrt(eta) . $ <stab:sign:exit-minority>]
  For either conditional law the bound is twice this large.
  We now recover the tail vectors from these masses. Wholly exterior segments have $s_i = 0$. Their expected vector in either law has norm at most $sqrt(2 eta)$ by (21.9) and (15.1). A crossing at $g$ has exterior segment $L_g = \[ g \, w \]$. Its retained and discarded conditional means are
  $ g_(plus.minus \, g) = sigma_g bb(E)_plus.minus \[ \( sigma_g c_g \)_(+) d_(L_g) \] \, #h(2em) h_(plus.minus \, g) = - sigma_g bb(E)_plus.minus \[ \( - sigma_g c_g \)_(+) d_(L_g) \] \, $
  with zero terms for absent crossings. Since $parallel d_(L_g) parallel = 1$, (15.2) and (21.11) bound $parallel sum_g h_(plus.minus \, g) parallel$ by $2 \( 1 + sqrt(2) \) sqrt(eta)$. Thus, with $g_plus.minus = sum_g g_(plus.minus \, g)$,
  #[#set math.equation(numbering: n => "(21.12)")
   $ plus.minus frac(y, 1 + delta) = g_plus.minus + r_plus.minus \, #h(2em) parallel r_plus.minus parallel lt.eq C_(upright("ex")) sqrt(eta) . $ <stab:sign:exit-discard>]
  To verify the required comparison explicitly, put $C_(plus.minus \, g) = bb(E)_plus.minus \( sigma_g c_g \)_(+)$. Then $parallel g_(plus.minus \, g) parallel lt.eq C_(plus.minus \, g)$ and $g_(plus.minus \, g) \( e_g \) = sigma_g C_(plus.minus \, g)$. The upper and lower estimates in (15.2) give
  $ parallel g_(+) parallel lt.eq parallel \( C_(+ \, g) \) parallel_2 lt.eq parallel \( C_(+ \, g) + C_(- \, g) \) parallel_2 lt.eq parallel g_(+) + g_(-) parallel lt.eq 2 C_(upright("ex")) sqrt(eta) . $
  Adding the remainder in (21.12) proves the claim for finite support.
  For a general completed tail, let $K$ increase through a finite ancestral exhaustion containing $H$. Contractivity gives $parallel x plus.minus P_K y parallel lt.eq 1 + delta$, and $P_K y arrow.r y$ in norm by coordinate-span density. The finite-support estimate passes to the limit with the same $delta$. This uses exact finite closed-ball representations, rather than a strict-radius approximation. ◻
]

#thm([Corollary 21.5.])[
  #emph[For $0 < t < 1$ and $C_(upright("ex")) = 2 + 3 sqrt(2)$, 
$ hat(delta)_(B_oo) \( t \) gt.eq frac(t^2, 576 C_(upright("ex"))^2) . $

]
] <stab:sign:exit-modulus>

#proof[
  Set $delta_t = \( t \/ \( 12 C_(upright("ex")) \) \)^2 < 1$. For a unit finite-head $x_0$ and $y in ker P_H$ with $parallel y parallel gt.eq 1$, the two inequalities $parallel x_0 plus.minus t y parallel lt.eq 1 + delta_t$ would imply
  $ parallel t y parallel lt.eq 3 C_(upright("ex")) sqrt(delta_t \( 1 + delta_t \)) lt.eq 6 C_(upright("ex")) sqrt(delta_t) = t \/ 2 \, $
  which is impossible. Each endpoint has norm at least one, so their average exceeds $1 + delta_t \/ 2$. For an arbitrary unit $x$, choose a finite-head unit $x_0$ with $parallel x - x_0 parallel < delta_t \/ 4$. The resulting average at $x$ exceeds $1 + delta_t \/ 4$, uniformly on this tail subspace. Formula (7.2) gives the conclusion. ◻
]

== 22 Trimming by maximal splitting gain <stab:trim:section>

The next argument keeps the absolute crossing masses of the original coefficients. A crossing is discarded if its coefficient is too small, if it is poorly aligned with the head test, or if its head allows a large increase by splitting. The remaining crossings have one sign in each exit component. The point requiring care is the discarded mass: a small probability alone does not control its Euclidean norm.

#thm([Proposition 22.1.])[
  #emph[There are no sequences of finite ancestral sets $H_n$, finite-head unit vectors $x_n = P_(H_n) x_n$, and finitely supported $z_n in ker P_(H_n)$ such that 
$ max { parallel x_n + z_n parallel \, parallel x_n - z_n parallel } arrow.r 1 \, #h(2em) liminf_n parallel z_n parallel > 0 . $

 The same assertion holds with $z_n$ in the completed tail spaces.]
] <stab:trim:vanishing-lens>

#proof[
  We first prove the finite-support assertion. Choose radii $R_n > max { parallel x_n + z_n parallel \, parallel x_n - z_n parallel }$ with $R_n arrow.r 1$. The gauge representation supplies two finite laws of atoms with means $\( x_n plus.minus z_n \) \/ R_n$. Pool them equally. Suppress the index $n$ and choose a norming head test $p$ for $x$. For an outcome $A = sum_i c_i d_(S_i)$, put $s_i = p \( S_i \)$,
  $ E_A = sum_i \( c_i - s_i \)^2 \, #h(2em) D_A = 1 - sum_i s_i^2 . $
  Since $bb(E)_plus.minus A \( p \) = 1 \/ R$, the same calculation as in (21.9) gives
  #[#set math.equation(numbering: n => "(22.1)")
   $ bb(E)_plus.minus E_A arrow.r 0 \, #h(2em) bb(E)_plus.minus D_A arrow.r 0 . $ <stab:trim:error>]
  All expectations in what follows are finite, even though the tree has infinitely many children.
  For a crossing at $g$, let $c_g \, s_g$ be its coefficient and head sum. Its head is a suffix $\[ v \, "parent" \( g \) \]$ of the ancestral path. Define $d_g gt.eq 0$ as the maximum gain in the sum of squared $p$-sums obtainable by splitting this head at one place, leaving the exterior portion attached to the later piece. Include the option of no split, with gain zero. The head is finite, so this maximum exists. Define all three quantities to be zero if there is no crossing at $g$. Maximizing splits for different crossings act on distinct disjoint segments. Therefore
  #[#set math.equation(numbering: n => "(22.2)")
   $ sum_g d_g lt.eq D_A . $ <stab:trim:gain-budget>]
  Let $W$ be the part of $A$ consisting of wholly exterior segments. These have $s_i = 0$, so
  #[#set math.equation(numbering: n => "(22.3)")
   $ parallel bb(E)_plus.minus W parallel lt.eq \( bb(E)_plus.minus E_A \)^(1 \/ 2) = o \( 1 \) . $ <stab:trim:exterior>]
  Also the Euclidean norm of the expected root-coordinate vector $\( bb(E) W \( e_g \) \)_g$ is $o \( 1 \)$. Indeed, exit vertices are incomparable, so a wholly exterior segment meets at most one of them; disjointness then bounds the root-coordinate norm by the Euclidean coefficient norm of the exterior segments.
  Put $m_g = bb(E) \| c_g \|$. We will show $parallel \( m_g \) parallel_2 = o \( 1 \)$. Indices with $m_g = 0$ can be omitted. Discard an observation at $g$ if any one of the following holds:
  #[#set math.equation(numbering: n => "(22.4)")
   $ \| c_g \| < m_g \/ 4 \, #h(2em) \| c_g - s_g \| > m_g \/ 8 \, #h(2em) sqrt(d_g) gt.eq m_g \/ 8 . $ <stab:trim:tests>]
  The first condition removes an expected absolute mass at most $m_g \/ 4$. For the union $B_g$ of the last two conditions, put $p_g = bb(P) \( B_g \)$ and $b_g = bb(E) \[ \| c_g \| 1_(B_g) \]$. Markov’s inequality, (22.1), and (22.2) imply
  #[#set math.equation(numbering: n => "(22.5)")
   $ sum_g m_g^2 p_g lt.eq 64 bb(E) sum_g #scale(x: 120%, y: 120%)[\(] \( c_g - s_g \)^2 + d_g #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <stab:trim:bad-probability>]
  Write the last quantity as $epsilon_n arrow.r 0$.
  To bound actual mass removal, fix $eta > 0$ and separate the components according to $p_g > eta$ or $p_g lt.eq eta$. On the first set, $b_g lt.eq m_g$, hence
  $ sum_(p_g > eta) b_g^2 lt.eq epsilon_n \/ eta . $
  On the second set, Cauchy–Schwarz gives $b_g^2 lt.eq p_g bb(E) \[ c_g^21 ""_(B_g) \]$; therefore
  #[#set math.equation(numbering: n => "(22.6)")
   $ sum_(p_g lt.eq eta) b_g^2 lt.eq eta bb(E) sum_g c_g^2 lt.eq eta \, #h(2em) parallel b parallel_2^2 lt.eq epsilon_n \/ eta + eta . $ <stab:trim:bad-mass>]
  Choose $eta = eta_n arrow.r 0$ slowly enough that $epsilon_n \/ eta_n arrow.r 0$ (for example $eta_n = sqrt(epsilon_n) + 1 \/ n$). Thus $parallel b parallel_2 = o \( 1 \)$.
  Every surviving observation has $c_g$ and $s_g$ of the same sign, $\| s_g \| gt.eq m_g \/ 8$, and $d_g < \( m_g \/ 8 \)^2$. If two survivors at one exit vertex had opposite signs, their head suffixes would be distinct and nested. Splitting the longer at the shorter would increase its squared sum by at least $2 \( m_g \/ 8 \)^2$, contradicting the definition and bound of its maximal gain. Hence the survivors have one common sign at each $g$.
  Let $a_g$ be the mass discarded by the first condition; thus $a_g lt.eq m_g \/ 4$. The total discarded mass is at most $a_g + b_g$, so the single-sign conclusion implies
  #[#set math.equation(numbering: n => "(22.7)")
   $ \| bb(E) c_g \| gt.eq m_g - 2 \( a_g + b_g \) gt.eq m_g \/ 2 - 2 b_g . $ <stab:trim:signed-mean>]
  The mixture has mean $x \/ R$ and therefore zero exterior coordinates. At the exit roots its crossing part has values $bb(E) c_g$; the remaining values come from $bb(E) W$. By (22.3), $parallel \( bb(E) c_g \)_g parallel_2 = o \( 1 \)$. Equation (22.7) consequently yields
  #[#set math.equation(numbering: n => "(22.8)")
   $ 1 / 2 parallel m parallel_2 lt.eq parallel \( bb(E) c_g \)_g parallel_2 + 2 parallel b parallel_2 = o \( 1 \) . $ <stab:trim:mass-vanishes>]
  The expected absolute crossing mass at each $g$ in either conditional law is at most $2 m_g$. By (15.12), its expected crossing tail has norm at most $2 parallel m parallel_2 = o \( 1 \)$. Add the wholly exterior part from (22.3). Since the conditional tail means are $plus.minus z \/ R$, we obtain $parallel z \/ R parallel = o \( 1 \)$, the desired contradiction.
  For completed tails, choose finitely supported approximations and apply $Q_(H_n)$, with errors tending to zero. Contractivity preserves the tail condition and the endpoint limits, while the lower norm bound persists. The finite-support contradiction applies. ◻
]

#thm([Corollary 22.2.])[
  #emph[For the coordinate segment space, $hat(delta)_(B_oo) \( t \) > 0$ for every $0 < t < 1$.]
] <stab:trim:modulus>

#proof[
  The modulus is nonnegative by convexity. If it vanished at $t$, there would be unit vectors $v_n$ for which the supremum over finite-codimensional subspaces in (7.2) tends to zero. Choose unit finite-head $x_n$ with $parallel x_n - v_n parallel < 1 \/ n$ and support contained in an ancestral $H_n$. Using $ker P_(H_n)$ in that supremum, choose $z_n$ there with $parallel z_n parallel gt.eq t$ and
  $ frac(parallel x_n + z_n parallel + parallel x_n - z_n parallel, 2) arrow.r 1 . $
  The choice of $z_n$ uses approximate infima; attainment is unnecessary. Both endpoint norms are at least one by projection, and therefore both converge to one. Approximation by finite tails gives, if desired, $parallel z_n parallel gt.eq t - o \( 1 \)$ with the same endpoint limit. This contradicts Proposition 70. ◻
]

== 23 Sequential cancellation in the forest <sec:sequential-forest>

Here $X = J^(*)$ is the finite-height forest space. The heads and the heights of their tree components may vary along a sequence. The argument therefore gives a uniform near-unit lens conclusion without selecting a numerical rate.

#thm([Lemma 23.1.])[
  #emph[Let $P$ be a bounded finite-rank projection on a Banach space and let $\( u_j \)$ be an infinite bounded sequence. For every $epsilon > 0$ there are distinct $i \, j$ with $parallel P \( u_i - u_j \) parallel < epsilon$. If in addition $x plus.minus u_j in R B$ and $parallel u_i - u_j parallel gt.eq theta$ for all distinct indices, then $v = \( u_i - u_j \) \/ 2$ satisfies 
#[#set math.equation(numbering: n => "(23.1)")
 $ x plus.minus v in R B \, #h(2em) parallel P v parallel < epsilon \/ 2 \, #h(2em) parallel v parallel gt.eq theta \/ 2 . $ <mol:half-difference>]

]
] <mol:finite-head-pair>

#proof[
  The bounded set of images $P u_j$ is totally bounded in the finite-dimensional range of $P$. Cover it by finitely many open balls of radius $epsilon \/ 2$. Two images with distinct indices belong to the same ball. The norm bounds for their half-difference follow immediately, and $x + v = \( \( x + u_i \) + \( x - u_j \) \) \/ 2$ and $x - v = \( \( x - u_i \) + \( x + u_j \) \) \/ 2$ belong to $R B$ by convexity. ◻
]

=== 23.1 A sequential argument using the smaller squared crossing <mola:sequential-section>

The following argument uses only vanishing test deficits and the smaller of two squared crossing coefficients. It gives a qualitative estimate, with no choice of numerical rate built into the proof.

#thm([Lemma 23.2.])[
  #emph[For each positive integer $n$, let $H_n$ be a finite ancestor-closed subset of the finite-height forest, and let $x_n \, y_n in X$ satisfy 
$ P_(H_n) x_n = x_n \, #h(2em) P_(H_n) y_n = 0 \, #h(2em) parallel x_n + y_n parallel \, parallel x_n - y_n parallel lt.eq 1 . $

 If $parallel x_n parallel arrow.r 1$, then $parallel y_n parallel arrow.r 0$. The heads and the heights of the trees meeting them may vary with $n$.]
] <mola:sequential>

#proof[
  By Lemma 7, choose $p_n = P_(H_n) p_n$ with $rho \( p_n \) lt.eq 1$ and $x_n \( p_n \) = parallel x_n parallel$; take $p_n = 0$ when $x_n = 0$. Let $eta_n > 0$ tend to zero. Corollary 8 provides approximations to $x_n + y_n$ and $x_n - y_n$ within $eta_n$ by finite convex combinations of represented atoms $Z = sum_i a_i d_(S_i)$, where the segments in each represented atom are pairwise disjoint and $sum_i a_i^2 lt.eq 1$. Sample the two combinations with equal probabilities, recorded by a sign $sigma$. Thus
  $ parallel bb(E) Z - x_n parallel lt.eq eta_n \, #h(2em) parallel bb(E) \( sigma Z \) - y_n parallel lt.eq eta_n . $
  The probability space may depend on $n$, but it is finite for each $n$. Put $b_i = p_n \( S_i \)$, $hat(Z) = sum_i b_i d_(S_i)$, $L = 1 - sum_i b_i^2$, and $D = sum_i \( a_i - b_i \)^2$. The defining segment test gives $L gt.eq 0$, and expansion of the square gives
  $ L + D = 1 + sum_i a_i^2 - 2 Z \( p_n \) lt.eq 2 \( 1 - Z \( p_n \) \) . $
  Consequently, with $d_n = 1 - parallel x_n parallel + eta_n arrow.r 0$,
  $ bb(E) L lt.eq 2 d_n \, quad bb(E) D lt.eq 2 d_n \, quad bb(E) parallel Z - hat(Z) parallel lt.eq sqrt(2 d_n) . $
  Thus both corrected means approximate their targets with error $e_n = eta_n + sqrt(2 d_n) arrow.r 0$.
  Let $G_n$ be the minimal nodes outside $H_n$. For a represented atom, write $A_r$ for the corrected coefficient of its crossing segment at $r in G_n$, or zero if no such segment exists. There is at most one such segment at each $r$, and segments wholly outside $H_n$ have corrected coefficient zero. Hence $sum_r A_r^2 lt.eq 1$ pointwise. The gate-coordinate contraction and $x_n \( e_r \) = 0$ imply
  $ sum_r \( bb(E) A_r \)^2 lt.eq e_n^2 . $
  Only finitely many gates occur for each $n$.
  Take an independent copy of the represented data, with crossing coefficients $B_r$ and deficit $L'$. Whenever $A_r B_r < 0$, the two head portions end at the parent of $r$ and are properly nested. Split the longer head at the start of the shorter, in the family to which the longer head belongs. If the two sums are $a \, b$, with $a$ corresponding to the longer head, the increase in the squared segment test is
  $ \( a - b \)^2 + b^2 - a^2 = 2 b^2 - 2 a b gt.eq min { a^2 \, b^2 } . $
  Splitting the actual segment into two retains its original endpoint; $p_n$ vanishes on its tail, so these are precisely the two new sums. Each segment crosses at only one gate. All assigned splits can therefore be performed simultaneously in each family and preserve disjointness. Their total increases are bounded by $L$ and $L'$. It follows that
  $ M_n := bb(E) sum_(A_r B_r < 0) min { A_r^2 \, B_r^2 } lt.eq 2 bb(E) L arrow.r 0 . $
  Cauchy–Schwarz on the product probability space and the finite set of gates now supplies the step from smaller squares to products:
  $ bb(E) sum_(A_r B_r < 0) \| A_r B_r \| & lt.eq (bb(E) sum_(A_r B_r < 0) min { A_r^2 \, B_r^2 })^(1 \/ 2) (bb(E) sum_(A_r B_r < 0) max { A_r^2 \, B_r^2 })^(1 \/ 2)\
 & lt.eq sqrt(2 M_n) arrow.r 0 . $
  For $m_r = bb(E) \| A_r \|$ and $h_r = bb(E) A_r$, independence gives
  $ sum_r m_r^2 - sum_r h_r^2 = 2 bb(E) sum_(A_r B_r < 0) \| A_r B_r \| arrow.r 0 . $
  Together with the signed-mean estimate this proves $parallel \( m_r \) parallel_2 arrow.r 0$.
  In the cone rooted at $r$, the corrected tail is a segment functional with coefficient $A_r$, or zero. Its signed expectation has norm at most $m_r$. Propositions 31 and 33 therefore give
  $ parallel Q_(H_n) bb(E) \( sigma hat(Z) \) parallel lt.eq parallel \( m_r \) parallel_2 arrow.r 0 . $
  Restoring the error $e_n$ and using $Q_(H_n) y_n = y_n$ proves the lemma. ◻
]

#thm([Corollary 23.3.])[
  #emph[For every $epsilon > 0$ there is $delta > 0$ such that, for every finite ancestor-closed $H$ and all $x = P_H x$, $y = Q_H y$ with $parallel x plus.minus y parallel lt.eq 1$ and $parallel x parallel > 1 - delta$, one has $parallel y parallel < epsilon$. The given norm is asymptotically midpoint uniformly convex, with the maximum of the two endpoint norms in the definition.]
] <mola:uniform-sequential>

#proof[
  If the first statement failed, taking $delta = 1 \/ n$ would produce a sequence contradicting Lemma 73. This contradiction also proves that the choice is independent of the head and its height.
  Fix $t > 0$ and apply the first statement with $epsilon = t \/ 2$. Choose $0 < e < 1$ so that $e \/ \( 1 + e \) < delta$. If $u = P_H u$ is a unit vector and $v = Q_H v$ has norm $t$, the inequality $max { parallel u + v parallel \, parallel u - v parallel } lt.eq 1 + e$ would allow its endpoints to be divided by $1 + e$. The normalized center has norm greater than $1 - delta$, whereas the normalized displacement has norm $t \/ \( 1 + e \) > t \/ 2$, a contradiction. Thus the maximum is greater than $1 + e$ for every such $u \, v$.
  For any unit $x in X$, choose a finite ancestor-closed $H$ such that $u = P_H x \/ parallel P_H x parallel$ is defined and $parallel x - u parallel < e \/ 2$, using the contractive exhaustion in Proposition 31. On the unit sphere of the finite-codimensional space $ker P_H$, apply the preceding result to $v = t y$. It gives
  $ max { parallel x + t y parallel \, parallel x - t y parallel } > 1 + e \/ 2 . $
  Taking the infimum over that sphere, the supremum over finite-codimensional spaces, and the infimum over unit centers yields a midpoint modulus at least $e \/ 2 > 0$. ◻
]

#thm([Corollary 23.4.])[
  #emph[For every $epsilon > 0$ there is $delta > 0$ such that any infinite $epsilon$-separated family $\( v_j \)$ satisfying $x plus.minus v_j in B_X$ has $parallel x parallel lt.eq 1 - delta$.]
] <mola:separated-sequential>

#proof[
  Otherwise choose such configurations indexed by $n$, with $parallel x_n parallel arrow.r 1$. Choose finite ancestor-closed $H_n$ with $parallel Q_(H_n) x_n parallel < 1 \/ n$. The sequence $\( P_(H_n) v_j \)$ is bounded in a finite-dimensional space. Hence two different indices $i \, j$ have $parallel P_(H_n) \( v_i - v_j \) \/ 2 parallel < 1 \/ n$. Put $w_n = \( v_i - v_j \) \/ 2$. Separation gives $parallel w_n parallel gt.eq epsilon \/ 2$, and convexity of the two opposite endpoint pairs gives $x_n plus.minus w_n in B_X$. The head center $a_n = P_(H_n) x_n$ and tail displacement $b_n = Q_(H_n) w_n$ satisfy
  $ parallel a_n plus.minus b_n parallel lt.eq 1 + 2 \/ n \, quad parallel a_n parallel gt.eq parallel x_n parallel - 1 \/ n \, quad parallel b_n parallel gt.eq epsilon \/ 2 - 1 \/ n . $
  Dividing both by $1 + 2 \/ n$ contradicts Lemma 73. ◻
]

=== 23.2 Coordinatewise-null displacements <molx:coordinate-null-section>

#thm([Corollary 23.5.])[
  #emph[Let $x in X$ and let $\( z_j \) subset X$ satisfy $x plus.minus z_j in B_X$ and $z_j \( e_v \) arrow.r 0$ for every forest vertex $v$. Then, with $C = sqrt(2) + 2 sqrt(6) < 7$, 
#[#set math.equation(numbering: n => "(23.2)")
 $ limsup_(j arrow.r oo) parallel z_j parallel lt.eq C sqrt(1 - parallel x parallel) lt.eq 7 sqrt(1 - parallel x parallel) . $ <molx:coordinate-null-bound>]

]
] <molx:coordinate-null>

#proof[
  First recall the separate-endpoint bound for a finite ancestral head: if $a = P_H a$, $P_H b = 0$, and $parallel a plus.minus b parallel lt.eq R$, then
  #[#set math.equation(numbering: n => "(23.3)")
   $ parallel b parallel lt.eq C sqrt(R \( R - parallel a parallel \)) . $ <molx:coordinate-null-input>]
  For $a eq.not 0$ choose a norming head test by Lemma 7 and apply (16.7) with $d = 1 - parallel a parallel \/ R$. Both endpoints have the same test value $parallel a parallel$, since the test vanishes on $b$; thus the individual replacement cost is $sqrt(2 d)$ and the conditional crossing cost is $2 sqrt(6 d)$. Scaling gives the displayed inequality. If $a = 0$ or $R = 0$, it follows directly from $parallel b parallel lt.eq R$.
  Fix $epsilon > 0$. Lemma 2 supplies a finite ancestral $H$ with $parallel Q_H x parallel lt.eq epsilon$. Coordinatewise convergence on this fixed finite set implies $parallel P_H z_j parallel lt.eq epsilon$ for all sufficiently large $j$. For those indices,
  $ parallel P_H x plus.minus Q_H z_j parallel lt.eq parallel x plus.minus z_j parallel + parallel Q_H x parallel + parallel P_H z_j parallel lt.eq 1 + 2 epsilon . $
  Applying (23.3) with $R = 1 + 2 epsilon$ gives
  #[#set math.equation(numbering: n => "(23.4)")
   $ parallel z_j parallel lt.eq epsilon + C sqrt(\( 1 + 2 epsilon \) \( 1 + 2 epsilon - parallel P_H x parallel \)) . $ <molx:coordinate-null-approximation>]
  Take the upper limit in $j$ with this head fixed. Since $parallel P_H x parallel gt.eq parallel x parallel - epsilon$, the right side is at most $epsilon + C sqrt(\( 1 + 2 epsilon \) \( 1 - parallel x parallel + 3 epsilon \))$. Letting $epsilon arrow.b 0$ proves the result. The argument uses only convergence of the finitely many coordinates on each chosen head. ◻
]

== 24 Qualitative midpoint arguments in infinite height <sec:qualitative-infinite>

We work in the coordinate predual $B_oo$ of Section 3, with the distinction from the full dual specified in Remark 35. The averaged modulus is defined in (7.2). Three different reductions lead to a vanishing-deficit contradiction: adding a supporting kernel, normalizing the displacement twice, and normalizing the two endpoints separately.

The common recovery step is Theorem 41. To make its inputs explicit, let two finite laws of represented atoms have means $w_plus.minus$, and choose a head test $p = P_H p$ with $rho \( p \) lt.eq 1$. Put

$ delta_plus.minus = 1 - w_plus.minus \( p \) \, #h(2em) delta = frac(delta_(+) + delta_(-), 2) \, #h(2em) eta = ∥Q_H frac(w_(+) + w_(-), 2)∥ . $

Use the toolkit’s squared-test slack $D$ and squared coefficient error $E$ for these laws and this test. The pointwise budget and Theorem 41, with weights $1 \/ 2$, give

#[#set math.equation(numbering: n => "(24.1)")
 $ bb(E)_plus.minus \( D + E \) & lt.eq 2 delta_plus.minus \,\
parallel Q_H w_plus.minus parallel & lt.eq 2 sqrt(\( eta + sqrt(2 delta) \)^2 + 4 delta) + sqrt(2 delta_plus.minus) . $ <qual:conditional-budget>]

Thus $delta_plus.minus arrow.r 0$ and $eta arrow.r 0$ force both conditional tails to vanish, even when the heads, tests, and finite laws vary. The first two reductions below give an exactly zero pooled tail. Separate endpoint normalization gives a residual tail whose norm must also be shown to tend to zero. The conditional budgets record what each normalization preserves in the atom representations.

=== 24.1 A qualitative contradiction with a supporting kernel <mold:qualitative>

Suppose that $hat(delta)_(B_oo) \( t \) = 0$ for some $0 < t < 1$. For each positive integer $n$, choose a unit center $v in B_oo$ whose centerwise supremum in the definition of this modulus is less than $1 \/ n$, and a finitely supported unit vector $x$ with $parallel x - v parallel < 1 \/ n$. Let $A$ be a finite initial set supporting $x$, and choose $f in B_oo^(*)$ with $parallel f parallel = f \( v \) = 1$. In $ker P_A ∩ ker f$, choose $y$ of norm at least one such that

$ frac(parallel v + t y parallel + parallel v - t y parallel, 2) < 1 + 2 \/ n . $

The supporting-functional condition makes each endpoint norm at least one; hence both are less than $1 + 4 \/ n$. Approximate $t y$ by a finitely supported $u in ker P_A$ within $min { t \/ 2 \, 1 \/ n }$, as allowed by Lemma 4. Then

$ parallel u parallel gt.eq t \/ 2 \, #h(2em) max { parallel x + u parallel \, parallel x - u parallel } lt.eq 1 + 6 \/ n . $

Choose $r gt.eq 1$ dominating these endpoint norms, with $r arrow.r 1$, and use Lemma 5 to represent $\( x plus.minus u \) \/ r$ exactly by finite convex combinations of atoms in a finite ancestral set containing their supports. Choose a head test $p = P_A p$ with $rho \( p \) = x \( p \) = 1$. For the means $w_plus.minus = \( x plus.minus u \) \/ r$,

$ delta_plus.minus = 1 - 1 \/ r arrow.r 0 \, #h(2em) Q_A frac(w_(+) + w_(-), 2) = Q_A \( x \/ r \) = 0 . $

In particular, each law has $bb(E)_plus.minus \( D + E \) lt.eq 2 \( 1 - 1 \/ r \) arrow.r 0$. Equation (24.1) now gives $parallel u parallel \/ r = parallel Q_A w_(+) parallel arrow.r 0$, contradicting $parallel u parallel gt.eq t \/ 2$. Thus the averaged modulus is positive.

=== 24.2 A qualitative route with two normalizations <mold:qualitative-normalized>

A second reduction uses the radial monotonicity of the symmetric average. Suppose that $hat(delta)_(B_oo) \( t \) = 0$ at a fixed $0 < t < 1$. Choose unit centers in $B_oo$ whose centerwise suprema tend to zero; approximate each by a finitely supported unit vector $x$ with error tending to zero, and let $H$ be a finite initial set containing its support. In $ker P_H$, the infimum provides a vector $y$ of norm at least one for which the endpoint average at $x$, with displacement $t y$, is

$ frac(parallel x + t y parallel + parallel x - t y parallel, 2) lt.eq 1 + o \( 1 \) . $

For a fixed direction, the symmetric average

$ s mapsto frac(parallel x + s y parallel + parallel x - s y parallel, 2) $

is even and convex, hence nondecreasing for $s gt.eq 0$. Replacing $y$ by $y \/ parallel y parallel$ therefore does not increase that average. Next approximate this unit vector in $ker P_H$ by finite vectors, using Lemma 4, and normalize the approximants again. Their errors can be made to tend to zero, so we obtain finite unit $y in ker P_H$ with the same $1 + o \( 1 \)$ bound.

Both endpoint norms are at least one by $P_H$, and therefore both tend to one. Choose $r$ strictly larger than their maximum, with $r arrow.r 1$. The finite vectors $\( x plus.minus t y \) \/ r$ have norm strictly less than one, so the strict gauge assertion in Lemma 5 gives exact finite convex representations. Choose a head test $p = P_H p$ with $rho \( p \) = x \( p \) = 1$. Each mean $w_plus.minus = \( x plus.minus t y \) \/ r$ has evaluation $1 \/ r$, so its own coefficient budget is $bb(E)_plus.minus \( D + E \) lt.eq 2 \( 1 - 1 \/ r \) arrow.r 0$. The pooled mean is $x \/ r$, whose tail vanishes. Thus $delta_plus.minus = 1 - 1 \/ r arrow.r 0$ and $eta = 0$ in (24.1). It follows that $parallel Q_H w_plus.minus parallel arrow.r 0$, whereas these norms equal $t \/ r arrow.r t > 0$. This contradiction proves positivity.

=== 24.3 A sequential argument with separate endpoint normalizations <molc:sequential-section>

We now prove the averaged midpoint property of $B_oo$ qualitatively, normalizing the two endpoints separately.

We use the averaged modulus defined in (7.2), with the inner infimum taken over directions of norm at least one. Its inner expression is nonnegative by the triangle inequality.

#thm([Proposition 24.1.])[
  #emph[For each fixed $0 < t < 1$, the space $B_oo$ satisfies $hat(delta)_(B_oo) \( t \) > 0$.]
] <molc:sequential-positive>

#proof[
  Suppose instead that $hat(delta)_(B_oo) \( t \) = 0$. There are unit vectors $x_n$ for which the supremum over finite-codimensional subspaces is less than $1 \/ n$. Approximate $x_n$ within $1 \/ n$ by a finitely supported unit vector $a_n$, and let $A_n$ be a finite nonempty initial set containing its support. Taking the subspace $ker P_(A_n)$ in the definition, choose $y_n$ there with $parallel y_n parallel gt.eq 1$ and
  $ frac(parallel x_n + t y_n parallel + parallel x_n - t y_n parallel, 2) lt.eq 1 + 2 \/ n . $
  By Lemma 4, choose a finite vector $z_n in ker P_(A_n)$ within $1 \/ n$ of $t y_n$. It follows that
  $ parallel z_n parallel gt.eq t - 1 \/ n \, #h(2em) frac(parallel a_n + z_n parallel + parallel a_n - z_n parallel, 2) lt.eq 1 + 4 \/ n . $
  Put $r_n^plus.minus = parallel a_n plus.minus z_n parallel$. Projection onto the head shows that $r_n^plus.minus gt.eq 1$, so both sequences tend to $1$. Moreover,
  #[#set math.equation(numbering: n => "(24.2)")
   $ parallel z_n parallel lt.eq frac(r_n^(+) + r_n^(-), 2) lt.eq 1 + 4 \/ n . $ <molc:sequential-tail-bounded>]
  This boundedness is needed when the two normalizations are compared.
  For each $n$, take a finite initial set $B_n supset.eq A_n$ containing both supports. Choose a head test $p_n = P_(A_n) p_n$ with $rho \( p_n \) = a_n \( p_n \) = 1$. Lemma 5 gives two finite laws of represented molecules $G = sum_i lambda_i upright(bold(1))_(S_i)$ satisfying
  $ bb(E)_(n \, plus.minus) G = \( a_n plus.minus z_n \) \/ r_n^plus.minus . $
  Write $w_(n \, plus.minus)$ for these means. Their deficits on $p_n$ are $delta_(n \, plus.minus) = 1 - 1 \/ r_n^plus.minus arrow.r 0$. With $D \, E$ computed using $p_n$, each law retains the budget
  #[#set math.equation(numbering: n => "(24.3)")
   $ bb(E)_(n \, plus.minus) \( D + E \) lt.eq 2 (1 - \( bb(E)_(n \, plus.minus) G \) \( p_n \)) = 2 \( 1 - 1 \/ r_n^plus.minus \) arrow.r 0 . $ <molc:sequential-deficits>]
  Write $Q_n = I - P_(A_n)$ and let $bb(E)_n$ denote the equally weighted mixture. Its tail is
  #[#set math.equation(numbering: n => "(24.4)")
   $ bb(E)_n Q_n G = 1 / 2 (1 / r_n^(+) - 1 / r_n^(-)) z_n . $ <molc:unequal-normalization-tail>]
  It need not vanish exactly. Its norm $eta_n$ tends to zero because $r_n^plus.minus arrow.r 1$ and (24.2) bounds $parallel z_n parallel$. Apply (24.1) with the head $A_n$, the test $p_n$, the deficits $delta_(n \, plus.minus)$, and this $eta_n$. It gives $parallel Q_n w_(n \, plus.minus) parallel arrow.r 0$. These norms are $parallel z_n parallel \/ r_n^plus.minus$, which cannot tend to zero because $parallel z_n parallel gt.eq t - 1 \/ n$ and $r_n^plus.minus arrow.r 1$. This contradiction proves the proposition. ◻
]

The obstruction to an equivalent asymptotically uniformly convex norm is Proposition 16, an instance of the general criterion in Proposition 14.


#bibliography("refs.bib", style: "ieee", title: [References])
