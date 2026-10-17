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

#align(center)[#text(size: 16pt, weight: "bold")[Asymptotic midpoint uniform convexity \
and unbounded diamond distortion \
in a reflexive tree space]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Asymptotic convexity describes the convexity that remains after finitely many directions are discarded. The question considered here is whether symmetric midpoint convexity can persist in a reflexive Banach space which admits no asymptotically uniformly convex equivalent norm.

All spaces and scalars are real. For an infinite-dimensional Banach space $Y$ with norm $N$, write $"cof" \( Y \)$ for the closed finite-codimensional subspaces of $Y$. For $t > 0$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ overline(delta)_N \( t \) & = inf_(N \( x \) = 1) sup_(F in "cof" \( Y \)) inf_(y in F \, thin N \( y \) = 1) #scale(x: 120%, y: 120%)[\(] N \( x + t y \) - 1 #scale(x: 120%, y: 120%)[\)] \,\
hat(delta)_N \( t \) & = inf_(N \( x \) = 1) sup_(F in "cof" \( Y \)) inf_(y in F \, thin N \( y \) = 1) (frac(N \( x + t y \) + N \( x - t y \), 2) - 1) . $ <eq:auc-modulus>]

The norm is #emph[asymptotically uniformly convex] (AUC) if $overline(delta)_N \( t \) > 0$ for all $t > 0$, and #emph[asymptotically midpoint uniformly convex] (AMUC) if $hat(delta)_N \( t \) > 0$ for all $t > 0$. Thus AUC requires a gain in every sufficiently far-out direction; AMUC permits the two opposite directions to be tested together. A norm $N$ is equivalent to a given norm $parallel dot.op parallel$ if $a parallel x parallel lt.eq N \( x \) lt.eq b parallel x parallel$ for some $0 < a lt.eq b < oo$ and all $x$. A space is #emph[AUC renormable] if it admits an equivalent AUC norm.

Dilworth, Kutzarova, Randrianarivony, Revalski, and Zhivkov introduced AMUC and constructed an AMUC norm on $ell_2$ which is not AUC #cite(label("DKRRZ2016")) Definition 2.2 and Theorem 2.4. Their question about equivalence up to renorming #cite(label("DKRRZ2016")) Section 5 has already been answered negatively by Baudier #cite(label("Baudier2026")) Theorem 1 and Corollary 1, using the Kadets–Werner modification of the Bourgain–Rosenthal space #cite(label("KW2004")) Theorem 2.5. We give a reflexive example with an explicit midpoint estimate.

The historical definition of AMUC uses the maximum of the two signed norms in (1.1). This gives the same positivity property. The average never exceeds the maximum. Conversely, intersect any chosen finite-codimensional subspace with the kernel of a functional norming $x$. Both signed norms are then at least one, so a gap for their maximum gives half that gap for their average. Our quantitative modulus always uses the average in (1.1).

The example also addresses a metric question. Define the #emph[countably branching diamonds] by taking $D_0$ to be a single edge and replacing every edge at each step by countably many internally disjoint two-edge paths. Each current edge has length one; let $d_k$ be the shortest-path metric on $D_k$. An embedding of $D_k$ into a Banach space has distortion at most $D$ if it is a map $f$ for which some scale $s > 0$ satisfies

#[#set math.equation(numbering: n => "(1.2)")
 $ s thin d_k \( u \, v \) lt.eq parallel f \( u \) - f \( v \) parallel lt.eq D s thin d_k \( u \, v \) #h(2em) \( u \, v in D_k \) . $ <eq:embedding-definition>]

The family embeds uniformly when one finite $D$ works for all $k$. For finite binary diamonds, Lee and Naor obtained quantitative $L_p$ distortion bounds by summing convexity losses #cite(label("LeeNaor2004")) Lemma 2.2, and Johnson and Schechtman developed a self-improvement proof #cite(label("JohnsonSchechtman2009")) Section 4. Baudier, Causey, Dilworth, Kutzarova, Randrianarivony, Schlumprecht, and Zhang proved that an equivalent AMUC norm prevents uniform embeddings of the countably branching diamonds #cite(label("BaudierEtAl2017")) Theorem 4.1. For reflexive spaces with unconditional asymptotic structure, they also proved that failure of AUC renormability implies uniform diamond embeddings #cite(label("BaudierEtAl2017")) Theorem B and Corollary 5.3. Swift extended the embedding construction to countably branching bundle graphs under the same reflexive, unconditional, and non-AUC-renormable hypotheses #cite(label("Swift2018")) Theorem 3.2 and Corollary 3.4. Perreau subsequently treated duals of separable spaces with weak-star unconditional asymptotic structure, retaining unconditional asymptotic structure in the reflexive formulation #cite(label("Perreau2021")) Theorems 4.8 and 5.3. The example below shows that the diamond implication fails for general reflexive spaces.

More recently, Basset, Lancien, and Procházka related AMUC to separated families of midpoints and obtained the diamond obstruction even when the maps are controlled only on specified vertex pairs #cite(label("BassetLancienProchazka2026")) Definition 6.15 and Propositions 6.16 and 6.20. Malthaner obtained quantitative obstructions for countably branching diamonds using a Matoušek-type coloring and path argument #cite(label("Malthaner2025")) Theorems 3.5 and 3.7. We use the full bi-Lipschitz convention (1.2) and prove the required midpoint estimate directly.

=== 1.1 The example and result <the-example-and-result>

For each integer $h gt.eq 1$, let $T_h = bb(N)^(lt.eq h)$ be the rooted tree of words of length at most $h$, ordered by extension of words. Its root is the empty word. Keep separate copies of these trees in the forest

$ cal(F) = product.co_(h gt.eq 1) \( { h } times T_h \) . $

Write $a prec.curly.eq b$ if $a$ is an ancestor of $b$ in the same component. A #emph[segment] is a nonempty interval $\[ a \, b \] = { v : a prec.curly.eq v prec.curly.eq b }$ in an ancestral chain. For a finitely supported real function $u$ on $cal(F)$, set $u \( S \) = sum_(v in S) u \( v \)$ and define

#[#set math.equation(numbering: n => "(1.3)")
 $ rho \( u \) = sup {(sum_(i = 1)^m u \( S_i \)^2)^(1 \/ 2) : m gt.eq 1 \, med S_1 \, dots.h \, S_m upright(" pairwise disjoint segments")} . $ <eq:segment-norm>]

The Euclidean triangle inequality and singleton segments show that $rho$ is a norm, with $parallel u parallel_2 lt.eq rho \( u \) lt.eq parallel u parallel_1$. Let $J$ be its completion and let $X = J^(*)$, with the dual norm denoted by $parallel dot.op parallel$. We write $e_v in J$ for a coordinate unit vector. Singleton tests give $\| u \( v \) \| lt.eq rho \( u \)$, so coordinate evaluation extends to an element $e_v^(*) in X$. The construction in (1.3) uses James’s square-sum norm on disjoint segments #cite(label("James1974")) p. 739; the branching and component heights here differ from the classical binary tree.

For the classical binary James tree space, Girardi proved AUC of both the coordinate predual and the full dual #cite(label("Girardi2001")) Theorems 3 and 5. The countable branching and finite, unbounded component heights used here lead to the following different behavior.

#thm([Theorem 1.1.])[
  #emph[The space $X = J^(*)$ defined by (1.3) is infinite dimensional, separable, and reflexive, and has no equivalent AUC norm. Its given norm satisfies 
$ hat(delta)_X \( t \) gt.eq sqrt(1 + t^2 \/ 12) - 1 #h(2em) \( t > 0 \) . $

 For every integer $k gt.eq 0$, every embedding of $D_k$ into $X$ has distortion at least $sqrt(1 + k \/ 12)$.]
] <thm:main>

This gives a negative answer to the reflexive diamond question recorded as Problem 39 in #cite(label("BaudierLancien2025")) author manuscript p. 388. The metric obstruction is unchanged by equivalent renorming, although the numerical constants refer to the specified dual norm.

=== 1.2 How the argument fits together <how-the-argument-fits-together>

Section 2 establishes reflexivity and the coordinate projections used throughout the proof. A sum of coordinate functionals along one root path has norm one, while its next coordinate increment is a weakly null unit vector as the child varies. In Section 3, a hypothetical AUC norm forces repeated multiplicative gains along one such path. Arbitrarily high finite trees contradict its bounded norm.

The midpoint argument in Section 4 must control segment tests crossing from a finite ancestral set (one closed under taking ancestors) to its complement. Simply adding norming tests for the two parts creates uncontrolled positive cross terms. We add one correction at their first exit vertices. The correction makes both resulting tests inexpensive, and its evaluations cancel when the two endpoint norms are averaged. Lemma 6 expresses the result as a lower bound in terms of the squared head and tail norms. Section 4.1 extends this estimate to coordinate completions on general rooted forests.

Finally, the infinitely many middle vertices of a diamond supply a separated family of approximate midpoints. Two of their finite coordinate projections can be made arbitrarily close. Their half-difference therefore reduces the metric problem to the head–tail estimate. Section 5 turns this into a loss in squared stretch at every replacement and sums the losses. This gives a direct quantitative instance of the midpoint and self-improvement methods for these graphs #cite(label("BaudierEtAl2017")) Section 4.

== 2 The coordinate structure of the forest <sec:forest>

We first establish the structural facts needed to separate a vector into finitely many coordinates and its complement. The finite heights give reflexivity and coordinate density; the ancestral order gives contractive projections and an exact norm formula on the complementary subtrees.

For a finite set $H$, the coordinate projections are $P_H u = sum_(v in H) u \( v \) e_v$ on $J$ and $P_H x = sum_(v in H) x \( e_v \) e_v^(*)$ on $X$; write $Q_H = I - P_H$.

#thm([Lemma 2.1.])[
  #emph[The space $X$ defined by (1.3) is infinite dimensional, separable, and reflexive, and the coordinate functionals have dense span in $X$. Let $H subset cal(F)$ be finite and #emph[ancestral], meaning that it contains every ancestor of each of its vertices. The coordinate projections $P_H$ and $Q_H$ are contractive on both $J$ and $X$. Moreover, $P_H x arrow.r x$ along any increasing ancestral exhaustion of $cal(F)$.]
] <lem:forest-structure>

#proof[
  Singleton tests give $parallel u parallel_2 lt.eq rho \( u \)$. On a component of height $h$, each segment has at most $h + 1$ vertices. Thus Cauchy–Schwarz and disjointness give
  $ parallel u parallel_2 lt.eq rho \( u \) lt.eq sqrt(h + 1) parallel u parallel_2 . $
  Write $J_h$ for the completion on that component. Segment families from different components combine freely, so
  $ J = (xor.big_(h gt.eq 1) J_h)_(ell_2) . $
  Each $J_h$ is isomorphic to Hilbert space. The dual of an $ell_2$ sum is isometrically the $ell_2$ sum of the duals: Cauchy–Schwarz proves one inequality, and testing on almost norming unit vectors in finitely many components, with proportional weights, proves the other. Applying this identity twice proves reflexivity. In particular $X^(*) = J$ canonically. If the coordinate functionals did not have dense span in $X$, Hahn–Banach would give a nonzero element of $X^(*) = J$ annihilating them. All its coordinates would vanish, a contradiction. Countability of $cal(F)$ now proves separability; the independent coordinates prove infinite dimensionality.
  A segment meets $H$ in a prefix and its complement in a suffix. Restricting disjoint segment tests to either set therefore proves contractivity on $J$. The adjoints give precisely the coordinate projections on $X$, and remain contractive. Finally, approximate $x$ by a finite coordinate combination. Once $H$ contains its support, contractivity bounds the discarded tail of $x$ by that approximation error. This proves convergence along an ancestral exhaustion. ◻
]

In particular, the completion of the finite coordinate functionals in

$ parallel x parallel = sup {sum_v x \( v \) u \( v \) : u in c_00 \( cal(F) \) \, med rho \( u \) lt.eq 1} $

is exactly $X$, under the coordinate pairing. This identifies the dual and coordinate-completion descriptions of the present finite-height forest. Each component has infinitely many vertices; only its height is finite, and no Hilbert equivalence constant uniform in the height was needed.

For $x = P_H x$, restriction to $P_H J$ preserves its functional norm. The finite-dimensional unit ball is compact, so there is $f = P_H f$ with $rho \( f \) lt.eq 1$ and $x \( f \) = parallel x parallel$. If $x eq.not 0$ then $rho \( f \) = 1$; if $x = 0$, including when $H$ is empty, take $f = 0$.

Let $G_H$ be the set of minimal vertices outside $H$. We call these vertices #emph[gates]. They include roots of components disjoint from $H$. Distinct gates are incomparable, and the descendant sets $U_g = { v : g prec.curly.eq v }$ partition $cal(F) \\ H$. Each segment crossing from $H$ to its complement passes through one gate. Figure 1 illustrates the partition.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((1.54, 1.1), (0.66, -0.25), (2.42, -0.25), close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((5.5, 2.3), (3.63, -0.3), (7.37, -0.3), close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((-0.055, 2.2), (-1.1, 1.05), (-1.815, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.1, 1.05), (-0.385, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.055, 2.2), (1.54, 1.05), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.54, 1.05), (0.935, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.54, 1.05), (2.145, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.055, 2.2), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  content((-0.055, 2.235), [$r_2$], anchor: "south")
  circle((-1.1, 1.05), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  content((-1.135, 1.05), [$s$], anchor: "east")
  circle((-1.815, 0), radius: 0.1397, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.815, -0.03528), [$g_1$], anchor: "north")
  circle((-0.385, 0), radius: 0.1397, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.385, -0.03528), [$g_2$], anchor: "north")
  circle((1.54, 1.05), radius: 0.1397, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.575, 1.05), [$g_3$], anchor: "west")
  circle((0.935, 0), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  circle((2.145, 0), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((-1.1, 0), [#text(size: 9pt)[$dots.h$]])
  content((0.715, 1.4), [#text(size: 9pt)[$dots.h$]])
  content((1.54, -0.25), [#text(size: 9pt)[$dots.h$]])
  content((-0.385, 2.85), [#text(size: 9pt)[$H=\{r_2,s\}$]])
  line((5.5, 2.2), (4.51, 1.05), (4.015, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.51, 1.05), (5.005, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.5, 2.2), (6.49, 1.05), (5.995, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6.49, 1.05), (6.985, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((5.5, 2.2), radius: 0.1397, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.5, 2.235), [$g_4=r_3$], anchor: "south")
  circle((4.51, 1.05), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  circle((6.49, 1.05), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((5.5, 1.15), [#text(size: 9pt)[$dots.h$]])
  content((4.51, -0.2), [#text(size: 9pt)[$dots.v$]])
  content((6.49, -0.2), [#text(size: 9pt)[$dots.v$]])
  content((5.5, 2.85), [#text(size: 9pt)[An untouched component]])
})],
  caption: [Figure 1: A finite ancestor-closed head and some of its gates. Black large nodes belong to $H$; circled nodes are gates. Shading indicates two complementary descendant cones. Only finitely many of the countably many branches are drawn. In particular an untouched component begins with a gate at its root. ],
) <fig:forest-gates>

Let $J \( U_g \)$ denote the coordinate subspace of $J$ supported in $U_g$, with its inherited norm.

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

If $A$ is any antichain and $\( a_v \)_(v in A)$ has finite support, then

#[#set math.equation(numbering: n => "(2.2)")
 $ rho (sum_(v in A) a_v e_v) = ∥sum_(v in A) a_v e_v^(*)∥ = (sum_(v in A) a_v^2)^(1 \/ 2) . $ <eq:antichain-isometry>]

The first equality with the Euclidean norm follows because a segment meets $A$ at most once. For the dual norm, singleton tests give the upper bound, and testing on the proportional vector supported on $A$ gives the lower bound. Thus these identities concern the specified norm, not merely equivalent norms on the same coordinate space.

== 3 Why no equivalent norm is AUC <sec:no-auc>

The renorming obstruction uses bounded root paths and weakly null child increments. We first isolate the elementary finite-codimensional argument; its midpoint counterpart will be proved separately.

#thm([Lemma 3.1.])[
  (Modulus conventions).  #emph[For an infinite-dimensional real Banach space $Y$ with norm $N$, let $m_N$ be the modulus obtained from (1.1) by replacing the average by $max { N \( x + t y \) \, N \( x - t y \) }$. Then, for $t > 0$, 
$ 0 lt.eq overline(delta)_N \( t \) lt.eq hat(delta)_N \( t \) lt.eq m_N \( t \) lt.eq 2 hat(delta)_N \( t \) . $

 For either symmetric modulus the inner infimum is unchanged if $N \( y \) = 1$ is replaced by $N \( y \) gt.eq 1$. Both symmetric moduli, including their centerwise versions before taking the infimum over $x$, are nondecreasing. Positivity on $\( 0 \, 1 \)$ therefore implies positivity at every positive radius.]
] <lem:modulus-conventions>

#proof[
  For fixed $x \, y$, the average and maximum of the two signed norms are even convex functions of the radius, hence nondecreasing on $\[ 0 \, oo \)$. This proves the assertions about radii and monotonicity. A norming functional for a unit center $x$ makes both signed norms at least one on its kernel. Intersecting any chosen finite-codimensional subspace with this kernel proves nonnegativity of the one-sided modulus and that the maximum excess is at most twice the average excess, after taking the supremum over subspaces. The average is pointwise at most the maximum. Finally, on a fixed subspace the infimum of the one-sided excess is a lower bound for each of the two signed excesses, since $y$ and $- y$ both belong to that subspace. Taking the successive suprema and infima proves the remaining comparison. ◻
]

#thm([Lemma 3.2.])[
  (Bounded trees).  #emph[Let $Y$ be a real Banach space. Suppose that for every integer $h gt.eq 1$ there are vectors $\( u_s^(\( h \)) \)_(s in bb(N)^(lt.eq h))$ and constants $m \, M \, c > 0$, independent of $h$, such that 
$ m lt.eq parallel u_s^(\( h \)) parallel lt.eq M \, #h(2em) parallel u_(s^frown j)^(\( h \)) - u_s^(\( h \)) parallel gt.eq c quad \( \| s \| < h \) . $

 For every nonterminal $s$, suppose the child increments tend weakly to zero as $j arrow.r oo$. Then every equivalent norm satisfying $alpha parallel dot.op parallel lt.eq N lt.eq beta parallel dot.op parallel$, with $0 < alpha lt.eq beta < oo$, obeys 
#[#set math.equation(numbering: n => "(3.1)")
 $ overline(delta)_N #h(-0.16667em) (frac(alpha c, 2 beta M)) = 0 . $ <eq:bounded-tree-scale>]

 The same conclusion holds for one infinite tree with these properties.]
] <lem:bounded-tree>

#proof[
  Put $t_0 = alpha c \/ \( 2 beta M \)$. If the displayed modulus is positive, choose $0 < gamma < overline(delta)_N \( t_0 \)$. At a current vector $u = u_s^(\( h \))$, the definition supplies a finite-codimensional $F$ such that
  $ N \( u + t_0 N \( u \) y \) gt.eq \( 1 + gamma \) N \( u \) #h(2em) \( y in F \, med N \( y \) = 1 \) . $
  Convexity extends this to every $w in F$ with $N \( w \) gt.eq t_0 N \( u \)$: for a unit center $z$ and $r gt.eq t_0$,
  $ N \( z + r y \) - 1 gt.eq r / t_0 #scale(x: 120%, y: 120%)[\(] N \( z + t_0 y \) - 1 #scale(x: 120%, y: 120%)[\)] . $
  The weakly null increments $d_j = u_(s^frown j)^(\( h \)) - u$ have images tending to zero in norm in the finite-dimensional quotient $Y \/ F$. Thus there are $w_j in F$ with $N \( w_j - d_j \) arrow.r 0$. Eventually $N \( w_j \) gt.eq alpha c \/ 2 gt.eq t_0 N \( u \)$. Taking the approximation error at most $gamma N \( u \) \/ 2$ gives a child with
  $ N \( u_(s^frown j)^(\( h \)) \) gt.eq \( 1 + gamma \/ 2 \) N \( u_s^(\( h \)) \) . $
  The gain is uniform although $F$ may depend on the current node. Choose $h$ with $alpha m \( 1 + gamma \/ 2 \)^h > beta M$ and make this choice successively along a branch of that tree. The resulting norm exceeds $beta M$, a contradiction. The increments in particular force $Y$ to be infinite dimensional, and Lemma 4 gives the reverse nonnegative inequality in (3.1). An infinite tree may be restricted to any sufficiently large height. ◻
]

We apply the lemma to the forest. For a node $v$ in the component with root $r$, put $p_v = sum_(r prec.curly.eq w prec.curly.eq v) e_w^(*)$. The root path is one segment test, so $parallel p_v parallel lt.eq 1$; evaluation at a coordinate on that path gives equality. At a nonterminal node the child increments are $e_(v^frown j)^(*)$, each of norm one. They tend weakly to zero: $X^(*) = J$, and every $u in J$ has square-summable coordinates, so $u \( v^frown j \) arrow.r 0$. We therefore have $m = M = c = 1$ in Lemma 5. For every equivalent norm $alpha parallel dot.op parallel lt.eq N lt.eq beta parallel dot.op parallel$,

$ overline(delta)_N \( alpha \/ \( 2 beta \) \) = 0 . $

This proves the renorming assertion in Theorem 1.

== 4 A paired extension of segment tests <sec:paired>

The renorming obstruction is proved. To establish midpoint convexity, we now show that a symmetric pair must grow when its center and displacement occupy a finite ancestral set and its complement. The squared-norm form will also be the input for the diamond argument.

#thm([Lemma 4.1.])[
  #emph[Let $H subset cal(F)$ be finite and ancestral. If $x \, y in X$ satisfy $x = P_H x$ and $y = Q_H y$, then 
#[#set math.equation(numbering: n => "(4.1)")
 $ frac(parallel x + y parallel + parallel x - y parallel, 2) gt.eq sqrt(parallel x parallel^2 + parallel y parallel^2 \/ 12) . $ <eq:paired>]

 More generally, for all $s \, t > 0$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ frac(parallel x + t y parallel + parallel x - t y parallel, 2) gt.eq frac(parallel x parallel + s t parallel y parallel, sqrt(1 + 12 s^2)) . $ <eq:paired-two-parameters>]

]
] <lem:paired>

#proof[
  We first prove, for every $s > 0$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ frac(parallel x + y parallel + parallel x - y parallel, 2) gt.eq frac(parallel x parallel + s parallel y parallel, sqrt(1 + 12 s^2)) . $ <eq:paired-parameter>]
  Suppose initially that $y$ has finite support. Choose finite tests $f \, k in J$, supported in $H$ and its complement respectively, with $rho \( f \) \, rho \( k \) lt.eq 1$ and pairings as close as desired to $parallel x parallel$ and $parallel y parallel$. The naive tests $f + s k$ and $f - s k$ can have large positive crossing terms. We will add the same vector to both tail tests; its contribution to the endpoint average will cancel. To control its size, at each gate $g$ put
  $ m_g = sup_(w succ.curly.eq g) \| k \( \[ g \, w \] \) \| . $
  Only finitely many $m_g$ are nonzero, and $sum_g m_g^2 lt.eq 1$: choose an almost maximizing initial segment in each of finitely many distinct cones and use their disjointness.
  For a gate with parent $v in H$, consider the suffixes $\[ a \, v \]$ whose $f$-sum has magnitude at least $2 s m_g$. If $m_g > 0$ and such suffixes exist, choose the shortest one and let $sigma_g$ be opposite to the sign of its sum. In all other cases put $sigma_g = 1$. Set
  $ c = sum_g sigma_g m_g e_g \, #h(2em) v^(+) = c + k \, #h(2em) v^(-) = c - k . $
  The gates form an antichain, so $rho \( c \) lt.eq 1$ and $rho \( v^plus.minus \) lt.eq 2$. Every initial segment in the cone of $g$ has $v^plus.minus$-sum of sign $sigma_g$ or zero, and magnitude at most $2 m_g$.
  We claim $rho \( f + s v^plus.minus \)^2 lt.eq 1 + 12 s^2$. Fix a disjoint family of segments and denote their $f$- and $v^plus.minus$-sums by $alpha_i$ and $beta_i$. We have $sum_i beta_i^2 lt.eq 4$. A positive cross term $alpha_i beta_i$ can occur only at a crossing segment, with some gate $g$; different crossing segments use different gates. If $\| alpha_i \| lt.eq 2 s m_g$, then $2 s alpha_i beta_i lt.eq 8 s^2 m_g^2$. Otherwise the head itself reaches the threshold, so it contains the shortest selected suffix. Write $alpha'_i$ for that suffix’s $f$-sum. Since $alpha_i beta_i > 0$ and $beta_i$ has sign $sigma_g$, the choice of $sigma_g$ gives $alpha_i alpha'_i < 0$. Thus the selected suffix is proper, and $\| alpha'_i \| gt.eq 2 s m_g$ by its selection. Splitting it off the head increases the sum of squared $f$-sums by
  $ \( alpha_i - alpha'_i \)^2 + \( alpha'_i \)^2 - alpha_i^2 = 2 \( alpha'_i \)^2 + 2 \| alpha_i alpha'_i \| gt.eq 4 s \| alpha_i \| m_g gt.eq 2 s alpha_i beta_i . $
  Figure 2 shows the proper suffix and the cut, with the segment index suppressed.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.4, -0.6), (6.25, 1.25), fill: rgb("#f2f2ff"), stroke: none)
  rect((6.25, -0.6), (9.6, 1.25), fill: rgb("#fff5eb"), stroke: none)
  line((0, 0), (9.2, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((6.25, -0.7), (6.25, 0.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((0, 0), radius: 0.05997, fill: black, stroke: none)
  circle((1, 0), radius: 0.05997, fill: black, stroke: none)
  circle((2, 0), radius: 0.05997, fill: black, stroke: none)
  circle((3, 0), radius: 0.05997, fill: black, stroke: none)
  circle((4, 0), radius: 0.05997, fill: black, stroke: none)
  circle((5, 0), radius: 0.05997, fill: black, stroke: none)
  circle((6, 0), radius: 0.05997, fill: black, stroke: none)
  circle((6.6, 0), radius: 0.05997, fill: black, stroke: none)
  circle((7.5, 0), radius: 0.05997, fill: black, stroke: none)
  circle((8.3, 0), radius: 0.05997, fill: black, stroke: none)
  circle((9.2, 0), radius: 0.05997, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1176cm)
  content((4, 0), [#text(size: 9pt)[$a'$]], anchor: "north", padding: 0.1176cm)
  content((6, 0), [#text(size: 9pt)[$v$]], anchor: "north", padding: 0.1176cm)
  content((6.6, 0), [#text(size: 9pt)[$g$]], anchor: "north", padding: 0.1176cm)
  content((9.2, 0), [#text(size: 9pt)[$w$]], anchor: "north", padding: 0.1176cm)
  line((0, 0.35), (6, 0.35), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3, 0.5264), [#text(size: 9pt)[head sum $alpha$]], anchor: "south", padding: 0.1176cm)
  line((4, 0.95), (6, 0.95), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5, 1.126), [#text(size: 9pt)[selected suffix $alpha '$]], anchor: "south", padding: 0.1176cm)
  line((6.6, 0.35), (9.2, 0.35), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.9, 0.5264), [#text(size: 9pt)[tail sum $beta$]], anchor: "south", padding: 0.1176cm)
  content((2, -0.5), [#text(size: 9pt)[$H$]])
  content((8, -0.5), [#text(size: 9pt)[$cal(F) without H$]])
})],
    caption: [Figure 2: The threshold cut for a crossing segment. Its head has $f$-sum $alpha$ and its selected suffix has $f$-sum $alpha'$. When $alpha beta > 0$ and $\| alpha \| > 2 s m_g$, the sign choice gives $alpha alpha' < 0$ and $\| alpha' \| gt.eq 2 s m_g$. Cutting immediately before $a'$ therefore increases the squared $f$-test by at least $2 s alpha beta$. The vertex spacing is schematic. ],
  ) <fig:paired-cut>
  These splits involve distinct original segments, so all can be made simultaneously. Their pieces and the remaining heads are still disjoint. Thus $sum_i alpha_i^2$ together with all the large positive cross terms is at most $rho \( f \)^2 lt.eq 1$. The small cross terms cost at most $8 s^2$, and the pure tail terms cost at most $4 s^2$. We have controlled both corrected tests. It remains to use them together so that their common correction disappears.
  Test $x + y$ against $\( f + s v^(+) \) \/ sqrt(1 + 12 s^2)$ and $x - y$ against $\( f + s v^(-) \) \/ sqrt(1 + 12 s^2)$. The mixed support terms vanish, and the two evaluations involving $c$ cancel in the average. Letting the norming errors tend to zero proves (4.3). Finite tails are dense in $Q_H X$, so (4.3) holds for every $y = Q_H y$. If $parallel x parallel > 0$, maximize its right side by taking $s = parallel y parallel \/ \( 12 parallel x parallel \)$; zero values follow by a limit. The maximum is the right side of (4.1). Replacing $y$ by $t y$ in (4.3) proves (4.2). ◻
]

#proof[
  For a unit $x in X$, choose $H$ with $parallel x - P_H x parallel < eta$. For every unit $y in ker P_H$, Lemma 6 applied to $P_H x$ and $t y$ gives
  $ frac(parallel x + t y parallel + parallel x - t y parallel, 2) gt.eq sqrt(\( 1 - eta \)^2 + t^2 \/ 12) - eta #h(2em) \( 0 < eta < 1 \) . $
  Take the infimum over these $y$, the supremum over finite-codimensional subspaces, and let $eta arrow.b 0$. This proves the asserted bound, since it is independent of the unit center $x$. ◻
]

=== 4.1 The coordinate completion on a general forest <sec:general-forest>

The paired argument used finite support and ancestral cuts, rather than finite component heights. We record its resulting scope, while keeping the distinction between a coordinate completion and a full dual explicit. Let $T$ be any countably infinite rooted forest in which every vertex has finitely many ancestors. Define $rho_T$ by (1.3) with $T$ in place of $cal(F)$, let $J \( T \)$ be the completion, and put

$ X \( T \) = overline("span")^(parallel dot.op parallel) { e_v^(*) : v in T } subset J \( T \)^(*) . $

Thus $X \( T \)$ is the completion of finite coordinate vectors in the polar norm. We do not identify it with all of $J \( T \)^(*)$.

A finite ancestral set cuts each segment into a prefix and suffix. The projections $P_H \, Q_H$ are therefore contractive on $J \( T \)$ and $X \( T \)$, and finite vectors outside $H$ are dense in $Q_H X \( T \)$. Every finite set has finite ancestral closure, so an increasing finite ancestral exhaustion gives $P_H x arrow.r x$ for all $x in X \( T \)$. The proof of Lemma 6 applies unchanged to these objects: there are finitely many nonzero masses $m_g$, their initial segments are disjoint, and unattached roots give no crossing term. These are all the properties used in the test construction, the simultaneous suffix cuts, and the passage to completed tails. Consequently (4.1) and (4.2) hold in $X \( T \)$, and the same arbitrary-center approximation gives

#[#set math.equation(numbering: n => "(4.4)")
 $ hat(delta)_(X \( T \)) \( t \) gt.eq sqrt(1 + t^2 \/ 12) - 1 #h(2em) \( t > 0 \) . $ <eq:general-forest-modulus>]

This also explains why reflexivity is used for the example’s structural identification, rather than as a hypothesis of the paired estimate.

For $T = bb(N)^(< omega)$, the coordinate completion $X \( T \)$ is the countably branching James-tree predual $B_oo$, as described in Banakh #cite(label("Banakh2000")) §2.II following Ghoussoub–Maurey–Schachermayer. We give its path obstruction in the displayed norm. Each root-path functional $p_v = sum_(w prec.curly.eq v) e_w^(*)$ again has norm one. The antichain calculation in (2.2) uses only disjoint segments and applies to $X \( T \)$ as well. Thus, for any $phi.alt in X \( T \)^(*)$ and finitely many children of a fixed vertex,

$ lr(|sum_j a_j phi.alt \( e_(v^frown j)^(*) \)|) lt.eq parallel phi.alt parallel (sum_j a_j^2)^(1 \/ 2) . $

Taking $a_j = phi.alt \( e_(v^frown j)^(*) \)$ shows that these evaluations are square summable, and hence tend to zero. The child increments are therefore weakly null against the whole continuous dual. Applying Lemma 5 with $m = M = c = 1$ proves $overline(delta)_N \( alpha \/ \( 2 beta \) \) = 0$ for every equivalent norm $alpha parallel dot.op parallel lt.eq N lt.eq beta parallel dot.op parallel$ on this coordinate completion. This argument does not require it to be reflexive.

== 5 From approximate midpoints to diamonds <sec:diamonds>

=== 5.1 An infinite family of approximate midpoints <an-infinite-family-of-approximate-midpoints>

Support restrictions disappear when infinitely many separated perturbations are available. This is the only compactness step in the metric proof. Approximate-midpoint lenses are central to AMUC #cite(label("DKRRZ2016")) Theorem 2.1; the broader midpoint method is attributed to Enflo’s unpublished argument in #cite(label("BaudierEtAl2017")) Section 4. The configuration below is a separated midpoint family, called a spider in #cite(label("BassetLancienProchazka2026")) Definition 3.7; Definition 6.15 and Proposition 6.16. We derive its precise squared deficit from Lemma 6.

#thm([Lemma 5.1.])[
  #emph[Let $R > 0$, $epsilon > 0$, $x in X$, and $\( y_j \)_(j gt.eq 1) subset X$ satisfy 
$ parallel x plus.minus y_j parallel lt.eq R \, #h(2em) parallel y_i - y_j parallel gt.eq epsilon > 0 quad \( i eq.not j \) . $

 Then 
#[#set math.equation(numbering: n => "(5.1)")
 $ R^2 - parallel x parallel^2 gt.eq epsilon^2 \/ 48 . $ <eq:lens>]

]
] <lem:lens>

#proof[
  Convexity gives $parallel x parallel \, parallel y_j parallel lt.eq R$. Given $eta > 0$, choose finite ancestral $H$ with $parallel Q_H x parallel < eta$. The bounded sequence $\( P_H y_j \)$ is in a finite-dimensional space, so some distinct $i \, j$ satisfy $parallel P_H \( y_i - y_j \) parallel < 2 eta$. Put $z = \( y_i - y_j \) \/ 2$. Since
  $ x + z = 1 / 2 \( \( x + y_i \) + \( x - y_j \) \) \, quad x - z = 1 / 2 \( \( x - y_i \) + \( x + y_j \) \) \, $
  we have $parallel x plus.minus z parallel lt.eq R$. Also
  $ parallel P_H z parallel < eta \, quad parallel Q_H z parallel gt.eq epsilon \/ 2 - eta \, quad parallel P_H x parallel gt.eq parallel x parallel - eta . $
  Both $P_H x plus.minus Q_H z$ have norm at most $R + 2 eta$. By Lemma 6,
  $ \( R + 2 eta \)^2 gt.eq parallel P_H x parallel^2 + parallel Q_H z parallel^2 \/ 12 . $
  For $0 < eta < epsilon \/ 2$, let $eta arrow.b 0$ to obtain (5.1). ◻
]

=== 5.2 Adding the loss over the diamond levels <adding-the-loss-over-the-diamond-levels>

Figure 3 shows the replacement whose loss we now estimate.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (1.7, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$u$]], anchor: "east", padding: 0.1176cm)
  circle((1.7, 0), radius: 0.07056, fill: black, stroke: none)
  content((1.7, 0), [#text(size: 9pt)[$v$]], anchor: "west", padding: 0.1176cm)
  line((2.38, 0), (3.4, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.25, 0), (5.95, 1.19), (7.65, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((5.95, 1.19), radius: 0.07056, fill: black, stroke: none)
  content((5.95, 1.19), [#text(size: 9pt)[$w_1$]], anchor: "south", padding: 0.1176cm)
  line((4.25, 0), (5.95, 0.3825), (7.65, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((5.95, 0.3825), radius: 0.07056, fill: black, stroke: none)
  content((5.95, 0.3825), [#text(size: 9pt)[$w_2$]], anchor: "south", padding: 0.1176cm)
  line((4.25, 0), (5.95, -1.19), (7.65, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((5.95, -1.19), radius: 0.07056, fill: black, stroke: none)
  content((5.95, -1.19), [#text(size: 9pt)[$w_j$]], anchor: "south", padding: 0.1176cm)
  content((5.95, -0.425), [#text(size: 9pt)[$dots.v$]])
  circle((4.25, 0), radius: 0.07056, fill: black, stroke: none)
  content((4.25, 0), [#text(size: 9pt)[$u$]], anchor: "east", padding: 0.1176cm)
  circle((7.65, 0), radius: 0.07056, fill: black, stroke: none)
  content((7.65, 0), [#text(size: 9pt)[$v$]], anchor: "west", padding: 0.1176cm)
  content((0.85, -1.615), [#text(size: 9pt)[one old edge]])
  content((5.95, -1.615), [#text(size: 9pt)[countably many two-edge paths]])
})],
  caption: [Figure 3: One diamond replacement, with only three of the countably many paths shown. All new edges have length one. The old endpoints are at distance two, as are any two distinct new middle vertices. ],
) <fig:diamond>

Each parent edge will consume the same positive amount of squared stretch. Earlier quantitative diamond arguments accumulate convexity losses across levels #cite(label("LeeNaor2004")) Lemma 2.2, or use a self-improvement induction #cite(label("JohnsonSchechtman2009")) Lemma 1 and Proposition 2. The countably branching AMUC form appears in #cite(label("BaudierEtAl2017")) Section 4. Here Lemma 7 supplies a fixed squared loss, which we can add directly.

#proof[
  Let $f : D_k arrow.r X$ satisfy $s d_k lt.eq parallel f \( u \) - f \( v \) parallel lt.eq D s d_k$. Divide by $s$, so $f$ is noncontracting and $D$-Lipschitz. Distances between old vertices double at each refinement: a new path between old vertices consists of two-edge passages which either return to their starting vertex or contract to an old edge, and every old path can be lifted with twice its length. Therefore the endpoints of an edge of $D_m$ have distance $2^(k - m)$ in $D_k$. Distinct middle vertices replacing that edge also have distance $2^(k - m)$ in $D_k$.
  Put
  $ L_m = sup_({ u \, v } in E \( D_m \)) frac(parallel f \( v \) - f \( u \) parallel, 2^(k - m)) \, #h(2em) 0 lt.eq m lt.eq k . $
  These suprema need not be attained; all that is used is $1 lt.eq L_m lt.eq D$. Fix one parent edge at level $m < k$, put $ell = 2^(k - m - 1)$, and let $w_j$ be its middle vertices. Set
  $ x = frac(f \( v \) - f \( u \), 2 ell) \, #h(2em) y_j = frac(f \( w_j \) - \( f \( u \) + f \( v \) \) \/ 2, ell) . $
  The child edges give $parallel x plus.minus y_j parallel lt.eq L_(m + 1)$, and the middle-vertex distances give $parallel y_i - y_j parallel gt.eq 2$. Applying Lemma 7 and then taking the supremum over the parent edges yields
  $ L_m^2 lt.eq L_(m + 1)^2 - 1 \/ 12 . $
  Summing over $m$ gives
  $ D^2 gt.eq L_k^2 gt.eq L_0^2 + k \/ 12 gt.eq 1 + k \/ 12 . $
  For $k = 0$ this is just $D gt.eq 1$. This completes the proof of Theorem 1. ◻
]

To verify the renorming assertion in the introduction, suppose $a parallel z parallel lt.eq N \( z \) lt.eq b parallel z parallel$. An embedding with distortion at most $D$ for $N$ has distortion at most $b D \/ a$ for $parallel dot.op parallel$. Thus uniform embeddings for an equivalent norm would contradict the distortion bound just proved.


#bibliography("refs.bib", style: "ieee", title: [References])
