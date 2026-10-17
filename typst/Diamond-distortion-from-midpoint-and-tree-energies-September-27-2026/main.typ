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

#align(center)[#text(size: 16pt, weight: "bold")[Distortion of countably branching diamonds from midpoint and tree energies]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <met:introduction>

Countably branching diamond graphs test whether a Banach space can accommodate many separated approximate midpoints at every scale. Each edge is replaced by countably many two-edge paths with common endpoints. A target space that forces these midpoint families away from the sphere must lose some edge stretch at every replacement. The question is what quantity decreases, and how the resulting distortion bound depends on the geometry used to prove that decrease.

We use the normalized diamond $cal(D)_k$: the original edge has length one, and the two edges in each replacement path have half the length of their parent. Thus $cal(D)_k$ has finite depth and countably many vertices; write $d_k$ for its shortest-path metric. A map $f$ has distortion at most $D$ if some $s > 0$ satisfies

$ s d_k \( u \, v \) lt.eq parallel f \( u \) - f \( v \) parallel lt.eq D s d_k \( u \, v \) #h(2em) \( u \, v in cal(D)_k \) . $

The scale $s$ may depend on the map and on $k$. Its removal by multiplying $f$ by a scalar does not change $D$.

Our main example applies James’s disjoint-segment norm #cite(label("James1974")) p. 739 to a forest of finite heights. Let $cal(T) = product.co_(h gt.eq 1) bb(N)^(lt.eq h)$, with the prefix order within each rooted tree. A segment is the set of consecutive vertices between two comparable nodes. Complete the finitely supported real arrays on $cal(T)$ in the norm

$ rho \( a \) = sup {(sum_(j = 1)^m lr(|sum_(s in S_j) a_s|)^2)^(1 \/ 2) : S_1 \, dots.h \, S_m upright(" are pairwise disjoint segments")} \, $

and call the resulting space $J$. We consider $X = J^(*)$ with its given dual norm. On the infinite tree $T_oo = bb(N)^(< omega)$, including its root, let $J_oo$ be the completion of the finitely supported real arrays for the same disjoint-segment formula. Define

$ B_oo = overline("span") { e_t^(*) : t in T_oo } subset J_oo^(*) \, $

where $e_t^(*)$ is coordinate evaluation and the closure uses the dual norm. The companion on midpoint lenses proves the midpoint estimates and the finite-coordinate approximation facts for these two spaces #cite(label("SegmentLenses")). Section 3 also gives the forest foundations needed for our direct proofs.

James’s original construction uses the infinite binary tree. Girardi proved asymptotic uniform convexity for the coordinate predual and the dual of that binary-tree space #cite(label("Girardi2001")) Theorems 3 and 5. The countably branching spaces defined here use their own segment estimates.

#thm([Theorem 1.1.])[
  #emph[ For every integer $k gt.eq 0$, every distortion-$D$ embedding of $cal(D)_k$ into either $X$ or $B_oo$ satisfies 
$ D^2 gt.eq 1 + k \/ 4 . $

]
] <met:intro-main>

In both cases the input is the following tail inequality. A finite set $H$ is ancestral if it contains every ancestor of each of its vertices; $P_H$ retains its coordinates and $Q_H = I - P_H$. If $P_H p = p$, then

$ parallel p plus.minus y parallel lt.eq R quad arrow.r.double quad parallel Q_H y parallel lt.eq 2 sqrt(R^2 - parallel p parallel^2) . $

It holds for arbitrary displacements $y$. In a symmetric lens ${ z : parallel x plus.minus z parallel lt.eq R }$ containing infinitely many separated deviations, two projected deviations can be made arbitrarily close, and their half-difference remains in the same lens. This turns the tail inequality into a loss in squared edge stretch. Section 2.3 gives the complete deduction. The coefficient $1 \/ 4$ results from retaining the full quadratic budget in this calculation.

=== 1.1 Midpoint methods and earlier work <midpoint-methods-and-earlier-work>

Diamond graphs connect metric embeddings with convexity of Banach-space norms. For binary diamonds, Lee and Naor obtain quantitative lower bounds in $L_p$, $1 < p lt.eq 2$, by summing a convexity inequality over the replacement levels #cite(label("LeeNaor2004")) Lemma 2.2. Johnson and Schechtman characterize superreflexivity by the failure of uniformly bounded binary-diamond embeddings; their lower-bound proof iterates a modulus-of-convexity estimate #cite(label("JohnsonSchechtman2009")) Section 4. The countably branching graphs studied here make a further selection possible: infinitely many midpoint images can be compared after their projections onto a fixed finite-dimensional space have become arbitrarily close.

Dilworth, Kutzarova, Randrianarivony, Revalski, and Zhivkov introduced asymptotic midpoint uniform convexity and characterized it by uniform smallness of the noncompactness of symmetric approximate-midpoint sets #cite(label("DKRRZ2016")) Theorem 2.1 and Definition 2.2. In finite-codimensional terms, for each $t > 0$ there is $delta > 0$ such that every unit center $x$ admits a finite-codimensional subspace on whose unit directions $y$ one has $max { parallel x + t y parallel \, parallel x - t y parallel } gt.eq 1 + delta$. Replacing the maximum by $parallel x + t y parallel$ gives asymptotic uniform convexity. Baudier, Causey, Dilworth, Kutzarova, Randrianarivony, Schlumprecht, and Zhang turn this property into a countably branching diamond obstruction #cite(label("BaudierEtAl2017")) Section 4. Their Theorem 4.1 includes a quantitative conclusion: a midpoint modulus bounded below by a positive multiple of $t^p$ for $0 < t < 1$, with $1 < p < oo$, gives distortion bounded below by a positive multiple of $k^(1 \/ p)$. Their proof combines control of midpoint sets with an iterated improvement of endpoint distances. The slope-loss arguments here use that mechanism and retain the constants furnished by the stated vector estimates. Malthaner gives another proof of the power-type lower bound through coloring, a path lemma, and separated approximate-midpoint configurations #cite(label("Malthaner2025")) Theorem 3.5 of arXiv v2. He also proves a power-type obstruction for metric targets satisfying a diamond inequality #cite(label("Malthaner2025")) Equation (2) and Theorem 3.7 of arXiv v2. The squared-lens inequality used here is its $p = 2$ Banach-space form; our coefficient comes from the stated norm-specific tail estimate.

Converse embedding results use additional geometry. For reflexive spaces with unconditional asymptotic structure, Baudier et al. characterize existence of an equivalent asymptotically uniformly convex norm by the failure of uniformly bounded diamond embeddings #cite(label("BaudierEtAl2017")) Corollary 5.3. Swift extends the characterization to countably branching bundle graphs with these hypotheses #cite(label("Swift2018")) Corollary 3.4 and Theorem 6.9. Perreau gives a dual characterization for separable $Y$ when $Y^(*)$ has weak-star unconditional asymptotic structure, and a characterization for reflexive spaces with unconditional asymptotic structure #cite(label("Perreau2021")) Theorems 4.8 and 5.3. These assumptions remain part of the corresponding converses.

Normalized diamond slopes also occur in the sprawling-tree construction of Basset, Lancien, and Procházka #cite(label("BassetLancienProchazka2026")) Definition 3.7 and Proposition 6.4. Our direct proofs specialize that construction to finite height and then supply coordinate selections, primal corrections, and predictions of atomic segment coefficients for the norms considered here.

We distinguish numerical conventions for the midpoint modulus. Dilworth et al. #cite(label("DKRRZ2016")) Definition 2.2 and Baudier et al. #cite(label("BaudierEtAl2017")) Section 4 use the maximum of the two signed norms. The Baudier–Lancien book manuscript uses their average #cite(label("BaudierLancien2025")) Definition 5.1.15 of arXiv v1. An average lower bound implies the corresponding maximum lower bound; each application below specifies which estimate it uses.

=== 1.2 Direct proofs and the organization of the paper <direct-proofs-and-the-organization-of-the-paper>

The forest also admits direct graph arguments that construct their own energy budgets. These proofs use the segment norm itself, without invoking the companion’s midpoint inequality. The common first step is to select one replacement path at each retained edge. Infinite branching permits coordinate choices at this step; subsequent descent uses only the two half-edges of each selected path.

Sections 3 and 4 develop the forest foundations and two primal-test constructions. A test is a finitely supported vector in $J$, evaluated by the current slope in $X$. One construction adds a correction at the first vertices outside a finite head, so that a gain in evaluation costs only a bounded increase in the squared test norm. The other balances prefix sums at each dyadic size and bounds the final accumulated test by charging segment sums to their largest encountered size. Both compare growing evaluations with the norm of the test.

Section 5 uses a different budget. Fair choices between the two half-edges make the selected slopes a finite martingale. After projection to a common finite head, the terminal slopes are represented exactly by random sums of disjoint-segment functionals whose squared coefficients sum to at most one. As more of a segment’s location is revealed, conditional predictions of its coefficient have bounded total squared change. Counting segment endpoints, or only segment starts, finds an interval of levels where this prediction energy cannot sustain all the large new coordinate layers selected from the graph. The coordinate selections and test estimates here are specific to our norm.

Section 6 then treats the linear path-cost norm. It states each imported energy estimate alongside the graph construction that meets its support and timing hypotheses. Some constructions keep the exact graph slopes and allow small tails outside a head; others replace the slopes by finitely supported approximations while preserving their exact averaging identity.

Section 7 collects the remaining midpoint transfers after these direct proofs. They distinguish squared or higher-power losses, a fixed contraction from a separated lens, and growth of an actual child slope. Sections 8 and 9 introduce the other path-cost, segment-start and recursive-array norms and apply these transfers. Each application states its intrinsic input from the complete companions on bounded tree potentials or recursive potentials. Linear and quadratic path costs, free and fixed joining roots, and different child-aggregation exponents give different norms; the stated constants belong to those specified norms and inputs. Appendix 10 records the alternative forest midpoint arguments and their individual quantitative or qualitative losses.

== 2 From infinitely many midpoints to diamond distortion <met:section>

A symmetric midpoint estimate becomes a graph obstruction because each edge of a countably branching diamond has infinitely many replacement midpoints. Finite-dimensional compactness lets us compare two of them while making any prescribed finite set of coordinates negligible. We give the transfer with all scaling factors and deduce the principal squared-loss bound. Section 7 develops further ways to accumulate midpoint estimates. These are instances of the midpoint method for countably branching diamonds; see #cite(label("BaudierEtAl2017")) Section 4. The quantitative constants below come from the estimates stated here.

For $x in X$ and $R gt.eq 0$, write $cal(L)_R \( x \) = { z in X : parallel x + z parallel lt.eq R \, med parallel x - z parallel lt.eq R }$ for the symmetric $R$-lens at $x$. Its members are deviations from the common midpoint, rather than the two endpoints themselves.

=== 2.1 The graph and its slopes <met:graph-definition>

Let $cal(D)_0$ consist of two vertices joined by an edge of length one. To obtain $cal(D)_(j + 1)$, replace every edge $\[ a \, b \]$ of $cal(D)_j$ by paths $\[ a \, m_i \, b \]$, indexed by $i in bb(N)$, whose middle vertices are distinct and new. Both new edges have half the length of their parent. Let $d_k$ be the shortest-path metric on the vertices of $cal(D)_k$. We call an edge present at stage $j$ a #emph[stage-$j$ edge]; it need no longer be an edge at stage $k > j$.

Distances between old vertices are unchanged at a replacement. Indeed, an old path can be replaced by paths of the same total length. Conversely, a path between old vertices consists of two-edge portions through new vertices; each portion either returns to the same old vertex or traverses the endpoints of one old edge. Compressing these portions gives an old walk of no greater length. It follows that a stage-$j$ edge has endpoint distance $ell_j = 2^(- j)$ in $cal(D)_k$. Its distinct replacement midpoints have mutual distance $ell_j$, and distance $ell_j \/ 2$ from either endpoint. At their introduction the assertion is immediate because two distinct middle vertices are nonadjacent, and every incident edge has length $ell_j \/ 2$; subsequent replacements preserve it.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (1.7, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.85, 0), [#text(size: 9pt)[$ell$]], anchor: "south", padding: 0.1176cm)
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
  content((4.888, 0.85), [#text(size: 9pt)[$ell"/"2$]])
  content((7.013, 0.85), [#text(size: 9pt)[$ell"/"2$]])
  content((5.95, -0.425), [#text(size: 9pt)[$dots.v$]])
  circle((4.25, 0), radius: 0.07056, fill: black, stroke: none)
  content((4.25, 0), [#text(size: 9pt)[$u$]], anchor: "east", padding: 0.1176cm)
  circle((7.65, 0), radius: 0.07056, fill: black, stroke: none)
  content((7.65, 0), [#text(size: 9pt)[$v$]], anchor: "west", padding: 0.1176cm)
  content((0.85, -1.615), [#text(size: 9pt)[one old edge]])
  content((5.95, -1.615), [#text(size: 9pt)[countably many two-edge paths]])
})],
  caption: [Figure 1: One normalized diamond replacement, with only three of the countably many paths shown. Each new edge has length $ell \/ 2$. The old endpoints remain at distance $ell$, and any two distinct new middle vertices also have distance $ell$. The drawing is schematic. ],
) <fig:diamond>

The normalized metric $d_k$ defined above differs by the global factor $2^(- k)$ from the convention in which every edge of the final graph has length one. In that convention old-vertex distances double at each replacement and a stage-$j$ edge has represented length $2^(k - j)$. Both conventions give exactly the same embedding distortion.

Suppose $f : cal(D)_k arrow.r X$, $s > 0$ and $D gt.eq 1$ satisfy

#[#set math.equation(numbering: n => "(2.1)")
 $ s d_k \( u \, v \) lt.eq parallel f \( u \) - f \( v \) parallel lt.eq D s d_k \( u \, v \) #h(2em) \( u \, v in cal(D)_k \) . $ <met:all-pairs>]

The lower inequality is required for all pairs, including distinct replacement midpoints. Dividing $f$ by $s$ gives the noncontracting normalization $d_k lt.eq parallel f \( u \) - f \( v \) parallel lt.eq D d_k$. Dividing instead by $D s$ gives lower factor $alpha = 1 \/ D$ and upper factor one. We use both normalizations and state which one is in force.

Orient the original edge and orient every replacement path consistently. For a parent edge $\[ a \, b \]$ of represented length $ell$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ x = frac(f \( b \) - f \( a \), ell) \, #h(2em) z_i = 2 / ell (f \( m_i \) - frac(f \( a \) + f \( b \), 2)) . $ <met:slopes>]

Its child slopes are $x + z_i$ and $x - z_i$. Under lower factor $alpha$,

#[#set math.equation(numbering: n => "(2.3)")
 $ parallel z_i - z_j parallel gt.eq 2 alpha #h(2em) \( i eq.not j \) . $ <met:sibling-separation>]

Every slope lies between $alpha$ and the upper embedding factor. The sequence $\( z_i \)$ is bounded, since each $z_i$ is half the difference of two child slopes.

=== 2.2 The finite-dimensional pair selection <met:pairing-section>

The next observation records the approximation errors that will be used throughout. It requires bounded finite-rank projections, rather than contractivity of the complementary projections.

#thm([Lemma 2.1.])[
  #emph[Let $X$ be a Banach space, $R > 0$, and let $\( z_i \)_(i in bb(N))$ satisfy $parallel x plus.minus z_i parallel lt.eq R$ with $parallel z_i - z_j parallel gt.eq epsilon > 0$ for $i eq.not j$. Every half-difference $w = \( z_i - z_j \) \/ 2$ with $i eq.not j$ satisfies $parallel w parallel gt.eq epsilon \/ 2$ and $parallel x plus.minus w parallel lt.eq R$. Fix $eta > 0$. The following two selections are available.]
  + #emph[Suppose $p$ has finite support, $parallel p - x parallel < eta$, and $P$ is a bounded finite-rank coordinate projection satisfying $P p = p$. There are distinct $i \, j$ for which, with $w = \( z_i - z_j \) \/ 2$ and $y = w - P w$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ parallel P w parallel < eta \, quad parallel y parallel gt.eq epsilon \/ 2 - eta \, quad parallel p parallel gt.eq parallel x parallel - eta \, quad parallel p plus.minus y parallel lt.eq R + 2 eta . $ <met:pair-errors>]

]
  + #emph[If $F$ is a closed finite-codimensional subspace, there are distinct $i \, j$ whose half-difference satisfies $"dist" \( w \, F \) < eta$. This selection requires no coordinate structure on $X$.]
] <met:finite-pair>

#proof[
  For the common endpoint bound use
  $ x + w = 1 / 2 \( \( x + z_i \) + \( x - z_j \) \) \, #h(2em) x - w = 1 / 2 \( \( x - z_i \) + \( x + z_j \) \) . $
  In the first selection, the bounded sequence $\( P z_i \)$ has two distinct members at distance less than $2 eta$, because bounded subsets of a finite-dimensional space are totally bounded. This gives the first inequality in (2.4) and hence the second. Replacing $x$ by $p$ and $w$ by $w - P w$ costs less than $2 eta$. The last assertion follows by applying the same argument to the bounded images of $z_i$ in the finite-dimensional quotient $X \/ F$. ◻
]

=== 2.3 The quadratic loss from the pooled atomic estimate <met:joint-section>

For the segment forest space, the pooled atomic estimate has the form

#[#set math.equation(numbering: n => "(2.5)")
 $ parallel Q_H y parallel lt.eq 2 sqrt(R^2 - parallel p parallel^2) \, #h(2em) P_H p = p \, quad parallel p plus.minus y parallel lt.eq R . $ <met:joint-input>]

Here $H$ is finite and ancestral, $Q_H = I - P_H$, and the displacement $y$ is arbitrary. The estimate is supplied by the joint-budget theorem in the companion on midpoint lenses #cite(label("SegmentLenses")) Theorem 1.1. Its target is the projected tail $Q_H y$; an individual endpoint-law estimate is not being used with an arbitrary head.

The same companion establishes, for both the finite-forest dual and the infinite-height closed coordinate span, density of finite coordinate vectors and contractivity of $P_H$ and $Q_H$ for ancestral $H$. Thus $P_H x$ can approximate any center $x$: take a finite coordinate approximation and let $H$ contain its support and all its ancestors. These approximation properties refer to each space with its own norm.

#thm([Lemma 2.2.])[
  #emph[In the finite-height segment forest dual, every infinite $epsilon$-separated symmetric $R$-lens satisfies 
#[#set math.equation(numbering: n => "(2.6)")
 $ parallel x parallel^2 + epsilon^2 \/ 16 lt.eq R^2 . $ <met:joint-lens>]

 The same lens conclusion holds for the infinite-height closed coordinate span with its own segment-dual norm and finite-head approximation theorem.]
] <met:joint-lens-lemma>

#proof[
  Fix $0 < eta < epsilon \/ 2$ and choose $H$ so that $p = P_H x$ has $parallel p - x parallel < eta$. Choose two deviations with $w = \( z_i - z_j \) \/ 2$ satisfying $parallel P_H w parallel < eta$. Then $parallel Q_H w parallel gt.eq epsilon \/ 2 - eta$ and $parallel p plus.minus w parallel lt.eq R + eta$, because $parallel x plus.minus w parallel lt.eq R$. Apply (2.5) to the arbitrary displacement $w$:
  $ \( epsilon \/ 2 - eta \)^2 lt.eq 4 #scale(x: 120%, y: 120%)[\(] \( R + eta \)^2 - parallel p parallel^2 #scale(x: 120%, y: 120%)[\)] . $
  Letting $eta arrow.b 0$ proves (2.6). The same argument applies with the infinite-height coordinate span’s own version of (2.5). ◻
]

#proof[
  Normalize to lower factor one and upper factor $D$. Let $R_j$ be the supremum of stage-$j$ slope norms. Every parent slope is the center of a $2$-separated lens whose endpoints have norms at most $R_(j + 1)$. Thus $parallel x_e parallel^2 + 1 \/ 4 lt.eq R_(j + 1)^2$ for every parent. Only now take the supremum: $R_j^2 + 1 \/ 4 lt.eq R_(j + 1)^2$. Since $R_0 gt.eq 1$ and $R_k lt.eq D$, summing gives $D^2 gt.eq 1 + k \/ 4$. No supremum need be attained. The infinite-height statement uses exactly the same scalar argument with that space’s proved version of (2.5); no identification with the full infinite-height dual is required. ◻
]

The $1 \/ 4$ coefficient comes from retaining the joint quadratic budget in (2.5). The direct graph-energy arguments follow next. General transfer rules and alternative forest estimates appear in Section 7 and Appendix 10.

== 3 The segment forest and its atoms <dir:forest-definition>

The direct graph arguments below use the same finite-height segment forest, with James’s disjoint-segment norm #cite(label("James1974")) p. 739. We first give its norm and the two forms of its atomic unit ball that the arguments need.

Let

$ T = product.co_(n gt.eq 1) T_n \, #h(2em) T_n = bb(N)^(lt.eq n) \, $

where each component has its own root and is ordered by extension. A segment is a set $\[ a \, b \] = { t : a lt.eq t lt.eq b }$ with $a lt.eq b$ in one component. Disjoint segments need only be disjoint as sets. A set is ancestral if it contains every ancestor of each of its vertices. On real finitely supported arrays define

#[#set math.equation(numbering: n => "(3.1)")
 $ rho \( y \) = sup_(cal(I)) (sum_(I in cal(I)) lr(|sum_(t in I) y \( t \)|)^2)^(1 \/ 2) \, $ <dir:atomic:forest-norm>]

where the supremum runs over finite disjoint families of segments. Let $J$ be its completion and $X = J^(*)$. Write $e_t^(*)$ for the coordinate functional and $s_I^(*) = sum_(t in I) e_t^(*)$, with $s_diameter^(*) = 0$. We recall the elementary facts that the argument needs, including the exact form of the atomic representation.

#thm([Lemma 3.1.])[
  #emph[The spaces $J$ and $X$ are reflexive, and finite coordinate arrays are dense in both. If a set $B subset T$ meets each segment in either a segment or the empty set, its coordinate projection $P_B$ is contractive on both spaces. For an antichain $V$, the coordinate space supported on $V$ has its $ell_2 \( V \)$ norm in both spaces. In particular, 
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥sum_(I in cal(I)) lambda_I s_I^(*)∥_X lt.eq (sum_(I in cal(I)) lambda_I^2)^(1 \/ 2) $ <dir:atomic:atom-bound>]

 for every disjoint segment family. Call a vector on the left with $sum_I lambda_I^2 lt.eq 1$ an atom. The unit ball of $X$ is the norm-closed convex hull of the atoms. If $S$ is finite and ancestral, the unit ball of $P_S X$ is the convex hull of atoms whose segments lie in $S$; every point has a finite convex representation.]
] <dir:atomic:atoms>

#proof[
  Singleton tests give the lower estimate in
  $ parallel y parallel_2 lt.eq rho \( y \) lt.eq sqrt(n + 1) thin parallel y parallel_2 #h(2em) \( "supp" y subset T_n \) . $
  For the upper estimate apply Cauchy–Schwarz on every segment and use its length at most $n + 1$, followed by disjointness. Norm squares add over the components: one inequality follows by restricting each segment family to each component, and the reverse inequality follows by combining families that approximate the component suprema. Thus $J$ is the $ell_2$-sum of spaces isomorphic to $ell_2 \( T_n \)$. The dual of an $ell_2$-sum is the $ell_2$-sum of the duals: Cauchy–Schwarz gives the upper norm bound and finite coordinate tests give the reverse bound. Applying this description to the bidual proves reflexivity, and truncation first in components and then in coordinates proves density in $J$ and $X$.
  Intersecting a disjoint segment family with $B$ proves contractivity on $J$, hence on $X$ by duality. This applies to ancestral sets, their complements, differences of nested ancestral sets, and antichains. Each segment meets an antichain in at most one point, so singleton tests identify its $rho$ norm with $ell_2$; duality and the contractive projection give the same identification in $X$. Equation (3.2) follows directly from Cauchy–Schwarz and (3.1).
  The supremum of pairing with the atoms equals the right side of (3.1). If their norm-closed convex hull omitted a point of the unit ball, Hahn–Banach separation would give a separating functional in $X^(*) = J$, contradicting this equality. Here reflexivity is used to identify the separating functional with an element of $J$. For finite ancestral $S$, the same argument is finite-dimensional: projection clips atoms to atoms in $S$, and the family of atoms in $S$ is compact, being a finite union of continuous images of finite-dimensional Euclidean unit balls. Its convex hull is compact and equals the coordinate unit ball. Every point therefore has a finite convex representation. ◻
]

For ancestral $S$ put $Q_S = I - P_S$. Finite-support density and contractivity imply that, for a finite collection of vectors and any $eta > 0$, a finite ancestral $S$ makes every $Q_S$-tail smaller than $eta$. Indeed, take finite approximations and add all ancestors of their supports; each vertex has only finitely many ancestors.

== 4 Direct descent with primal tests <dir:accumulated>

The next two arguments follow actual edges of a diamond and construct a test vector at each step. Earlier diamond obstructions include Lee–Naor’s telescoping squared-distance inequality #cite(label("LeeNaor2004")) Lemma 2.2 and Johnson–Schechtman’s iterated modulus-of-convexity estimate #cite(label("JohnsonSchechtman2009")) Section 4. Here the accumulated evaluation is compared with the cost of its primal test. The first argument pays a bounded squared-norm cost for each increase in its evaluation. The second balances prefix sums of comparable sizes and controls the final test all at once.

=== 4.1 The graph slopes <dir:graph-slopes>

For an oriented parent edge of represented length $ell$, use the slope $x$ and deviations $z_j$ of Section 2.1:

#[#set math.equation(numbering: n => "(4.1)")
 $ x = frac(f \( b \) - f \( a \), ell) \, #h(2em) z_j = frac(2 f \( m_j \) - f \( a \) - f \( b \), ell) \, #h(2em) upright("child slopes ") x + z_j \, med x - z_j . $ <dir:splitting>]

In the noncontracting normalization all slopes have norm at most $D$ and the deviations are $2$-separated. After division by $D$, these bounds are one and $2 \/ D$. The symmetric splitting is the finite-level version of the sprawling-tree construction in #cite(label("BassetLancienProchazka2026")) Definition 3.7 and Proposition 6.4.

The selections below use the same compactness step as Lemma 2: two bounded projections onto a fixed finite head can be made arbitrarily close. Their separated full vectors then have a large tail difference, so at least one has a large tail. This choice requires the infinitely many middle vertices. Once a middle vertex has been selected, either sign in (4.1) follows an actual child edge.

=== 4.2 A correction at the first fresh roots <a-correction-at-the-first-fresh-roots>

The correction controls the extra squared cost of segments crossing the head boundary. Its value is placed at each first exterior vertex. For crossings with a large head sum, the proof either makes the cross term nonpositive or controls it by splitting the head portion.

#thm([Lemma 4.1.])[
  #emph[Suppose $v \, u in c_00 \( T \)$, $v = P_A v$, and $u = Q_A u$, where $A$ is finite and ancestral. There is $c = Q_A c in c_00 \( T \)$ such that 
#[#set math.equation(numbering: n => "(4.2)")
 $ rho \( c \) lt.eq rho \( u \) \, #h(2em) rho \( v + c + r u \)^2 lt.eq rho \( v \)^2 + 16 rho \( u \)^2 quad \( r in { - 1 \, 1 } \) . $ <dir:correction-cost>]

]
] <dir:root-correction>

#proof[
  The complement of $A$ is the disjoint union of subtrees $U_d$ whose roots are its first vertices. Put $u_d = u \|_(U_d)$ and $a_d = rho \( u_d \)$. Independent segment tests in these subtrees give $sum_d a_d^2 = rho \( u \)^2$; only finitely many terms are nonzero. If $d$ has parent $p in A$, examine the suffix sums $V_d \( h \) = sum_(q in \[ h \, p \]) v \( q \)$. If some suffix has absolute sum greater than $2 a_d$, choose the shortest such suffix, with initial vertex $h_d$, and set
  $ c_d = - "sign" \( V_d \( h_d \) \) a_d . $
  Otherwise set $c_d = 0$, also when $d$ has no parent in $A$. Let $c = sum_d c_d e_d$. The roots $d$ are incomparable, so $rho \( c \)^2 = sum_d c_d^2 lt.eq rho \( u \)^2$.
  Fix a disjoint segment family testing $v + c + r u$. Segments wholly outside $A$ cost at most $4 sum_d a_d^2$ in squared sum, since $rho \( c_d e_d + r u_d \) lt.eq 2 a_d$. A crossing into $U_d$ has head sum $P$ and tail sum $Q$, with $\| Q \| lt.eq 2 a_d$. We claim that
  $ \( P + Q \)^2 lt.eq E + 12 a_d^2 \, $
  where $E$ is the squared-sum test of one or two disjoint subsegments of the original head portion. If $\| P \| lt.eq 2 a_d$, use $E = P^2$, since $2 \| P Q \| + Q^2 lt.eq 12 a_d^2$. Otherwise the preferred suffix exists. If its sum has the same sign as $P$, the choice of $c_d$ gives $P Q lt.eq 0$, and again $E = P^2$ suffices. In the remaining case let $P' = V_d \( h_d \)$. The preferred suffix lies properly inside the head portion: the latter qualifies, and the former is shortest and has the opposite sign. Splitting there gives
  $ E = \( P - P' \)^2 + \( P' \)^2 gt.eq P^2 + 4 \| P \| a_d gt.eq P^2 + 2 P Q . $
  Adding $Q^2 lt.eq 4 a_d^2$ proves the claim in this case as well. All the replacement head segments remain disjoint. Their total squared test, including the unchanged segments in $A$, is at most $rho \( v \)^2$. At most one crossing uses each fresh root $d$. Combining the crossing cost $12 sum_d a_d^2$ and the wholly exterior cost proves (4.2). ◻
]

#thm([Proposition 4.2.])[
  #emph[Every embedding of $cal(D)_k$ into $X$ with distortion at most $D$ satisfies $k lt.eq 256 D^2$.]
] <dir:deterministic-descent>

#proof[
  Rescale to upper Lipschitz constant one and lower constant $1 \/ D$. Start at the initial edge with test $v = 0$. At a current edge of slope $x$, enlarge a finite ancestral $A$ to contain the support of $v$ and make $parallel Q_A x parallel < 1 \/ \( 4 D \)$. In (4.1), choose two deviations whose head projections are less than $1 \/ \( 2 D \)$ apart. Since the deviations are $2 \/ D$-separated, at least one of them, denoted $z$, has $parallel Q_A z parallel > 1 \/ \( 2 D \)$. Finite-support density in $J$ and contractivity of $Q_A$ supply $u = Q_A u in c_00 \( T \)$ with $rho \( u \) lt.eq 1$ and $z \( u \) > 1 \/ \( 2 D \)$.
  Apply Lemma 5. Because $rho \( c \) lt.eq 1$, $\| x \( c \) \| < 1 \/ \( 4 D \)$. Averaging the two matching evaluations gives
  $ 1 / 2 sum_(r = plus.minus 1) \( x + r z \) \( v + c + r u \) = x \( v \) + x \( c \) + z \( u \) > x \( v \) + frac(1, 4 D) . $
  Choose a sign attaining at least this average, follow that actual child edge, and replace $v$ by $v + c + r u$. Each step increases $rho \( v \)^2$ by at most $16$. After $k$ steps the evaluation is at least $k \/ \( 4 D \)$, whereas the final slope has norm at most one and the final test has norm at most $4 sqrt(k)$. Hence $k lt.eq 256 D^2$. ◻
]

=== 4.3 Balancing dyadic sizes along a random descent <balancing-dyadic-sizes-along-a-random-descent>

The next construction does not control the increase of the test norm at an individual step. It controls prefix sums separately at every dyadic size, then bounds any segment by charging its largest size to a root through which that segment passes.

#thm([Proposition 4.3.])[
  #emph[Every noncontracting $D$-Lipschitz embedding of $cal(D)_k$ into $X$ satisfies $D > sqrt(k) \/ 144$ for $k gt.eq 1$.]
] <dir:bin-descent>

#proof[
  We descend at random, choosing a fair sign after selecting a middle vertex. Write $x$ for the current slope and $G$ for the accumulated test, initially zero. Along a fixed history, the preceding tests lie in finite blocks $Q \\ P$ with ancestral endpoints, and every new $P$ contains the previous $Q$. Enlarge $P$ until $parallel Q_P x parallel < 1 \/ 32$. By the separation in (4.1) and finite-dimensional total boundedness, choose a deviation $z$ with $parallel Q_P z parallel gt.eq 3 \/ 4$. There is a finite test $g$ supported in a block $Q \\ P$ such that
  #[#set math.equation(numbering: n => "(4.3)")
   $ rho \( g \) lt.eq 1 \, #h(2em) z \( g \) > 1 \/ 2 . $ <dir:bin-witness>]
  Here $Q$ is a finite ancestral enlargement containing the support of $g$; both choices are made before tossing the next sign.
  Decompose the block into its connected tree components $C$. If $r_C$ is the root of $C$, define
  $ p_C \( v \) = sum_(w in \[ r_C \, v \]) g \( w \) \, #h(2em) A_C = max_(v in C) \| p_C \( v \) \| . $
  Ignore components with $A_C = 0$. Choose a power of two $B_C$ with $A_C lt.eq B_C < 2 A_C$. Disjoint root-prefix tests give $sum_C A_C^2 lt.eq 1$. Differencing the potentials $max \( p_C \, 0 \)$ and $min \( p_C \, 0 \)$ gives arrays $g_C^(+) \, g_C^(-)$ with $g \|_C = g_C^(+) + g_C^(-)$. On every subsegment, either array has sum in absolute value at most the absolute value of the corresponding sum of $g$, since both scalar truncations are 1-Lipschitz.
  To state the balancing rule precisely, call a component earlier if it was selected before the current update. Label each earlier component by its bin size and, for every vertex $v$ and dyadic size $B$, put
  $ S_B \( v \) = sum_(t prec.curly.eq v : med t upright(" lies in an earlier")\
upright("component of bin size ") B) G \( t \) . $
  The invariant is $\| S_B \( v \) \| lt.eq B$ for every $v$. Before adding a new component $C$, the sum of earlier bin-$B_C$ contributions above its root $r_C$ is fixed; choose a weak sign opposite to this sum, with either choice at zero. Allow the new test on $C$ to be zero or either of $g_C^(+) \, g_C^(-)$ oriented so that all its prefix sums have this chosen sign. Each such prefix has magnitude at most $B_C$.
  This preserves the invariant at every vertex. All earlier supports lie in $P$, so their prefix contribution is constant through $C$. Adding an opposite-sign quantity of magnitude at most $B_C$ keeps its absolute value at most $B_C$. In a gap there is no new contribution; an ignored component has $g \|_C = 0$. Beyond $Q$, the new prefix is the one at its last ancestor in $Q$, or zero when there is no such ancestor. Thus the same bound holds after every update, for every ancestor path.
  The sign restriction is fixed before the next fair sign $s in { - 1 \, 1 }$. For each $C$, choose an allowed option maximizing $s z$ on that component; let $w$ be the resulting increment. The choice depends on $s$. Nevertheless $rho \( w \) lt.eq 1$: every tested segment meets this block in a segment in one component, and the preceding contraction estimate applies simultaneously to disjoint tests. If $a \, b$ are the evaluations under $z$ of the two oriented offers in a component, then
  $ bb(E)_s max \( 0 \, s a \, s b \) gt.eq frac(\| a \| + \| b \|, 4) = frac(\| z \( g_C^(+) \) \| + \| z \( g_C^(-) \) \|, 4) gt.eq frac(z \( g \|_C \), 4) . $
  Sum over $C$ and use (4.3) to obtain $bb(E)_s \[ s z \( w \) \] > 1 \/ 8$. Also $\| x \( w \) \| < 1 \/ 32$ and $bb(E)_s \[ s z \( G \) \] = 0$. Thus the next actual slope $x + s z$ satisfies
  $ bb(E)_s \[ \( x + s z \) \( G + w \) \] > x \( G \) + 1 \/ 8 - 1 \/ 32 > x \( G \) + 1 \/ 16 . $
  After $k$ steps the expected evaluation exceeds $k \/ 16$. The entire probability space has only $2^k$ outcomes.
  It remains to bound $rho \( G \)$ for every final outcome. Fix any finite disjoint segment family. On a segment, first separate the portion lying in the component that contains its initial vertex, if this is a nonignored component. Across all segments these initial portions have squared-sum total at most $k$: grouping them by construction step gives disjoint tests of an increment of norm at most one. The remainder of a segment enters every nonignored component it meets at its root, since all blocks have ancestral endpoints and are successively outside previous blocks. For a bin of size $B$, its sum on this remainder is a difference of two values of $S_B$, hence has magnitude at most $2 B$. A remainder meeting no nonignored component contributes zero. Otherwise, if $B_(*)$ is the largest encountered bin, geometric summation gives a total magnitude at most $4 B_(*)$. Charge the square of this bound to an encountered component with size $B_(*)$. Two disjoint segments cannot charge the same component: both would contain its root. Since
  $ sum_(upright("all components")) B_C^2 lt.eq 4 sum_(upright("steps")) sum_C A_C^2 lt.eq 4 k \, $
  the remaining portions have squared-sum total at most $64 k$. The Euclidean triangle inequality for the vector of segment sums now gives $rho \( G \) lt.eq sqrt(k) + 8 sqrt(k) = 9 sqrt(k)$.
  Every final slope has norm at most $D$, so every final evaluation is at most $9 D sqrt(k)$. Comparison with its expectation gives $k \/ 16 < 9 D sqrt(k)$, as claimed. ◻
]

== 5 Direct graph obstructions from atomic prediction energy <dir:atomic:section>

We give two direct proofs that the countably branching diamonds do not embed with uniformly bounded distortion into the finite-height segment-forest dual. Both proofs first select finitely many edge slopes from the infinitely branching graph. An atomic representation then turns these slopes into conditional means. The first proof counts segment endpoints and predicts the coefficients of segments crossing a long interval of layers. The second counts segment starts and follows each segment until it terminates. Their energy estimates concern these finite martingales; no midpoint-modulus estimate is needed.

#thm([Theorem 5.1.])[
  #emph[For the real space $X$ defined by (3.1), no finite $D$ has the following property: for every $k gt.eq 1$ there are a map $f_k : cal(D)_k arrow.r X$ and a scalar $a_k > 0$ such that 
$ a_k d_k \( u \, v \) lt.eq parallel f_k \( u \) - f_k \( v \) parallel_X lt.eq D a_k d_k \( u \, v \) #h(2em) \( u \, v in cal(D)_k \) . $

]
] <dir:atomic:obstruction>

Rescaling by $D a_k$ reduces the theorem to excluding maps satisfying

#[#set math.equation(numbering: n => "(5.1)")
 $ D^(- 1) d_k \( u \, v \) lt.eq parallel f \( u \) - f \( v \) parallel_X lt.eq d_k \( u \, v \) . $ <dir:atomic:normalization>]

Necessarily $D gt.eq 1$. The graph normalization and old-vertex distance calculation in Section 2.1 apply throughout. Orient the edges consistently and write their normalized slopes as in (2.2). They have norm at most one, and each retained parent has the symmetric children

#[#set math.equation(numbering: n => "(5.2)")
 $ x + d_j \, quad x - d_j \, #h(2em) parallel d_j - d_l parallel_X gt.eq 2 \/ D quad \( j eq.not l \) . $ <dir:atomic:splittings>]

At every retained edge choose one replacement path, retain both its slopes, and then descend by fair binary choices. The resulting random slopes $M_0 \, dots.h \, M_k$ form a martingale, because the two children average to their parent. Let $cal(F)_i$ record the first $i$ binary choices. Every history at level $i$ has probability $2^(- i)$, and each history has two children of conditional probability $1 \/ 2$. Infinite branching is used only to select a suitable replacement path before this finite probability space is formed.

#thm([Lemma 5.2.])[
  (A finite slope martingale and its exact atomic law).  #emph[Suppose a depth-$k$ embedding satisfies (5.1). For every $0 < eta < 1 \/ \( 4 D \)$ one can select a fair binary slope martingale $\( M_i \)_(i = 0)^k$, nested finite ancestral sets $S_0 subset.eq dots.h.c subset.eq S_k$, and a finitely valued random atom $Z$ supported in $S_k$, such that, with $E_i = bb(E) \[ thin dot.op divides cal(F)_i \]$ and $U_i = E_i Z = P_(S_k) M_i$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ parallel Q_(S_(i - 1)) U_(i - 1) parallel < eta \, #h(2em) parallel P_(S_i \\ S_(i - 1)) U_i parallel gt.eq 1 \/ D - 4 eta quad \( 1 lt.eq i lt.eq k \) . $ <dir:atomic:preparation-bounds>]

 The unprojected slopes also satisfy $parallel Q_(S_i) M_i parallel < eta$ for $0 lt.eq i lt.eq k$. Every $M_i$ and $U_i$ has norm at most one. The additional terminal sampling used to produce $Z$ is excluded from each $cal(F)_i$, including $cal(F)_k$.]
] <dir:atomic:preparation>

#proof[
  Choose a finite ancestral $S_0$ with $parallel Q_(S_0) M_0 parallel < eta$. Suppose that the selected level-$\( i - 1 \)$ slopes have tails smaller than $eta$ outside a common finite ancestral $S_(i - 1)$. For each such parent $x$, the first-child slopes $x + d_j$ in (5.2) have bounded projections to the finite-dimensional space $P_(S_(i - 1)) X$. Two distinct projections are within $2 eta$. Their tail difference has norm at least $2 \/ D - 2 eta$, so one first-child tail has norm at least $1 \/ D - eta$. Retain that path. Since its two slopes add to $2 x$, the mate’s tail has norm at least $1 \/ D - 3 eta$.
  Only finitely many slopes have now been selected. Enlarge $S_(i - 1)$ to a finite ancestral $S_i$ making all their tails smaller than $eta$. Writing $B_i = S_i \\ S_(i - 1)$, both children satisfy
  $ parallel P_(B_i) M_i parallel gt.eq 1 \/ D - 4 eta . $
  Repeat through level $k$. All sets are common to an entire level, not chosen after its final random history.
  The finite-support martingale $P_(S_k) M_i$ has norm at most one. By Lemma 4, at every terminal binary history its value is a finite convex combination of atoms supported in $S_k$. Enlarge the finite sample space by selecting one atom from that combination and call it
  $ Z = sum_(I in cal(I)) a_I s_I^(*) \, #h(2em) sum_(I in cal(I)) a_I^2 lt.eq 1 . $
  The extra terminal sampling is excluded from every $cal(F)_i$, even $cal(F)_k$. With $E_i = bb(E) \[ thin dot.op divides cal(F)_i \]$, the tower property gives $E_i Z = P_(S_k) M_i$. The projections commute, and $S_i subset.eq S_k$, so the displayed layer lower bounds also hold for $U_i$. Moreover, $Q_(S_(i - 1)) U_(i - 1) = P_(S_k) Q_(S_(i - 1)) M_(i - 1)$; contractivity gives the first bound. This proves (5.3). ◻
]

The lemma supplies the same finite martingale for two different energy arguments. In either argument a large child layer is decomposed into three terms: segments charged to the chosen interval, coefficients already predicted from the parent, and the change in their prediction. The first term has a counting budget, the second is controlled by the small parent tail, and scalar $L^2$ orthogonality bounds the third.

=== 5.1 Endpoint intervals and crossing predictions <dir:atomic:endpoint-route>

We prove Theorem 8 first by charging the two endpoints of every terminal atom. Assume that (5.1) is available for every $k$, with $D$ fixed, and set

#[#set math.equation(numbering: n => "(5.4)")
 $ eta = frac(1, 32 D) \, #h(2em) c = frac(1, 2 D) . $ <dir:atomic:endpoint-constants>]

Apply Lemma 9 with this $eta$, write $B_i = S_i \\ S_(i - 1)$, and write its random atom as

$ Z = sum_(I in cal(I)) w_I s_I^(*) \, #h(2em) sum_I w_I^2 lt.eq 1 . $

Since $1 \/ D - 4 eta > c$, we have on every binary history

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel Q_(S_(i - 1)) E_(i - 1) Z parallel < eta \, #h(2em) parallel P_(B_i) E_i Z parallel gt.eq c quad \( 1 lt.eq i lt.eq k \) . $ <dir:atomic:endpoint-layer>]

Take $k = M L$ and partition the layers into $M$ consecutive intervals of length $L$. A segment has at most two endpoints, so the sum, over these intervals, of its squared coefficient charged to an interval containing an endpoint is at most $2 w_I^2$. Consequently some interval $p lt.eq i lt.eq q$, $q - p + 1 = L$, has

$ bb(E) sum_(I : upright("an endpoint of ") I upright(" lies in") thin S_q \\ S_(p - 1)) w_I^2 lt.eq 2 / M . $

Call these segments endpoint segments and let $Z^(upright("end"))$ be their sum. Put $b_0 = sqrt(2 \/ M)$. By (3.2),

#[#set math.equation(numbering: n => "(5.6)")
 $ parallel Z^(upright("end")) parallel_(L^2 \( X \)) lt.eq b_0 . $ <dir:atomic:endpoint-error>]

Here $parallel V parallel_(L^2 \( X \)) = \( bb(E) parallel V parallel_X^2 \)^(1 \/ 2)$; contractive projections and conditional expectations preserve upper bounds in this norm, by Jensen’s inequality.

Every other segment meeting a layer in this interval begins in $S_(p - 1)$ and ends outside $S_q$: heredity puts its first endpoint in $S_q$, and the absence of either endpoint in $S_q \\ S_(p - 1)$ then forces these two alternatives. Call such segments crossing segments and write $Z^(upright("cr"))$ for their sum. On every relevant layer only $Z^(upright("end"))$ and $Z^(upright("cr"))$ contribute.

For $p lt.eq i lt.eq q + 1$ let $A_i$ be the minimal vertices of $S_k \\ S_(i - 1)$, and put $A'_i = A_i ∩ S_i$ for $i lt.eq q$. These are finite antichains. Each crossing segment meets every $A_i$ in exactly one vertex, since it begins in $S_(p - 1)$ and ends outside $S_q$. Label it by its vertex $r in A_p$. Disjointness allows at most one crossing segment with a given label. Let $W_r$ be its coefficient, and $d_i^r$ its vertex in $A_i$; in the absence of such a segment put $W_r = 0$ and $d_i^r = dagger$ for every $i$.

A later location determines an earlier one by taking its unique $A_i$-ancestor, with $dagger$ mapping to $dagger$. For each fixed $r$, the sigma-algebras

$ cal(G)_(i - 1)^r = cal(F)_(i - 1) or sigma \( d_i^r \) #h(2em) \( p lt.eq i lt.eq q + 1 \) $

therefore increase with $i$. Define $H_(i - 1)^r = bb(E) \[ W_r divides cal(G)_(i - 1)^r \]$. Scalar conditional expectation is orthogonal projection in $L^2$, whence

#[#set math.equation(numbering: n => "(5.7)")
 $ sum_(i = p)^q h_i^2 lt.eq 1 \, #h(2em) h_i^2 := sum_(r in A_p) bb(E) \| H_i^r - H_(i - 1)^r \|^2 . $ <dir:atomic:crossing-energy>]

Indeed the sum for each $r$ telescopes to at most $bb(E) W_r^2$, and the sum of those quantities is at most one. Different labels may use different sigma-algebras; no joint refinement across labels is being asserted.

Let $J_i^r$ be the part of the crossing segment with label $r$ in $B_i$, empty if the label is absent. It is determined by $d_(i + 1)^r$: the previous location is recovered from it, and the portion runs from $d_i^r$ up to but excluding $d_(i + 1)^r$. If these locations agree the portion is empty. Therefore

$ E_i sum_r W_r s_(J_i^r)^(*) = E_i sum_r H_i^r s_(J_i^r)^(*) . $

Replacing $H_i^r$ by $H_(i - 1)^r$ in this expression costs at most $h_i$ in $L^2 \( X \)$, by disjointness, (3.2), and conditional Jensen. Together with (5.6), this reduces the layer estimate to bounding

$ V_i = E_i sum_r H_(i - 1)^r s_(J_i^r)^(*) . $

Fix a history through time $i - 1$. For $v in A'_i$, let $r \( v \)$ be its unique $A_p$-ancestor and let $m \( v \)$ be the mean of $W_(r \( v \))$ conditional on this history and $d_i^(r \( v \)) = v$. Set it to zero on an empty conditional event. Write

$ p_j \( v \) = Pr \( d_i^(r \( v \)) = v divides cal(F)_j \) \, #h(2em) j = i - 1 \, i . $

On either child history, $p_i \( v \) lt.eq 2 p_(i - 1) \( v \)$, because that history has half its parent’s probability. The contribution from $v$ to $V_i$ is $m \( v \) p_i \( v \)$ times an average of segment functionals starting at $v$. The descendant subtrees at different $v$ are disjoint. Independently sampling one segment from each of these averages and applying (3.2) before averaging proves

$ parallel V_i parallel_X lt.eq (sum_(v in A'_i) \| m \( v \) p_i \( v \) \|^2)^(1 \/ 2) lt.eq 2 (sum_(v in A'_i) \| m \( v \) p_(i - 1) \( v \) \|^2)^(1 \/ 2) . $

The products in the final sum are precisely the coordinates of $E_(i - 1) Z^(upright("cr"))$ on $A'_i$. The antichain norm, the parent-tail bound in (5.5), and (5.6) now give

$ parallel V_i parallel_(L^2 \( X \)) lt.eq 2 \( eta + b_0 \) . $

Combining the three contributions yields, for every $p lt.eq i lt.eq q$,

#[#set math.equation(numbering: n => "(5.8)")
 $ c lt.eq 2 eta + 3 sqrt(2 \/ M) + h_i . $ <dir:atomic:endpoint-final>]

By (5.7), some $h_i lt.eq L^(- 1 \/ 2)$. Since $2 eta = c \/ 8 < c$, choose $M$ and then $L$ so that $3 sqrt(2 \/ M) + L^(- 1 \/ 2) < c - 2 eta$. This contradicts (5.8) and proves Theorem 8.

=== 5.2 Start intervals and terminating segments <dir:atomic:status-route>

A second proof uses a smaller counting budget, one charge per segment, and a different prediction space. It allows old segments to terminate inside the chosen interval. Recording their last vertices is the additional information needed to retain a refining sequence of partitions.

Assume again that (5.1) is available for all $k$ at a fixed $D$. This time choose

#[#set math.equation(numbering: n => "(5.9)")
 $ c_0 = frac(1, 2 D) \, #h(2em) delta = c_0 / 2 \, #h(2em) eta > 0 \, quad 3 eta < c_0 / 2 \, quad 4 eta < delta / 4 . $ <dir:atomic:status-constants>]

Apply Lemma 9, put $H_i = S_i$ and $J_i = H_(i + 1) \\ H_i$, and write

$ Z = sum_(I in cal(I)) lambda_I s_I^(*) \, #h(2em) sum_I lambda_I^2 lt.eq 1 \, #h(2em) U_i = E_i Z = P_(S_k) M_i . $

The common preparation gives the exact conditional-mean identity. Since $1 \/ D = 2 c_0$ and $eta < c_0$, its bounds imply

#[#set math.equation(numbering: n => "(5.10)")
 $ parallel Q_(H_i) M_i parallel < eta \, #h(2em) parallel P_(J_i) M_(i + 1) parallel gt.eq 2 c_0 - 4 eta \, $ <dir:atomic:status-selected>]

and, in particular, the weaker bounds

#[#set math.equation(numbering: n => "(5.11)")
 $ parallel Q_(H_i) U_i parallel lt.eq 2 eta \, #h(2em) parallel P_(J_i) U_(i + 1) parallel gt.eq c_0 - 3 eta > delta . $ <dir:atomic:status-layer>]

We keep this slack in the estimates below. The distinction from the endpoint argument will be that segments may terminate inside the chosen interval; their last vertices must therefore remain in the prediction information.

Take $k = N L$ and divide its steps into intervals $r lt.eq i < r + L$, where $r$ ranges over $0 \, L \, dots.h \, \( N - 1 \) L$. For each interval put

$ B_r = sum_(min I in H_(r + L) \\ H_r) lambda_I^2 \, #h(2em) b_r = bb(E) B_r . $

Every segment has one first vertex, so $sum_r b_r lt.eq 1$. Fix one such interval. Call a sampled segment old if its first vertex lies in $H_r$, and new if its first vertex lies in $H_(r + L) \\ H_r$. No other segment meets a layer $J_i$ of this interval, by heredity. The new contribution after projection and conditional expectation has $L^2 \( X \)$ norm at most $sqrt(b_r)$, because its pointwise norm before conditioning is at most $sqrt(B_r)$.

To predict the coefficients of old segments, use the finite set of pairs $\( omega \, I \)$ with $omega$ a terminal sample outcome and $I$ an old segment in its sampled atom. Give each such pair mass $Pr \( omega \)$, obtaining a finite measure $mu$, and write $lambda \( omega \, I \) = lambda_I \( omega \)$. Then

$ integral lambda^2 thin d mu = bb(E) sum_(I upright(" old")) lambda_I^2 lt.eq 1 . $

If there are no pairs, all old contributions and all energies below are zero. Otherwise, for $r lt.eq i lt.eq r + L$, partition this pair set by the binary history through time $i$ and the following tagged status:

- if $I$ has a vertex outside $H_i$, record “active” and its first vertex outside $H_i$;
- if $I subset H_i$, record “inactive” and its last vertex.

These partitions refine. An old segment starts in $H_r subset H_i$, so a later active entry determines its earlier entry by the ancestor chain. A later inactive endpoint determines whether the earlier status was inactive at that endpoint or active at the first ancestor outside $H_i$. The tags distinguish these cases.

Let $m_i$ be the mean of $lambda$ on each positive-mass cell of the $i$th partition, with arbitrary value zero on empty cells, and define

#[#set math.equation(numbering: n => "(5.12)")
 $ g_i = integral \| m_(i + 1) - m_i \|^2 thin d mu . #h(2em) sum_(i = r)^(r + L - 1) g_i lt.eq integral lambda^2 thin d mu lt.eq 1 . $ <dir:atomic:status-energy>]

The inequality is the orthogonality identity for conditional means in $L^2 \( mu \)$; it does not require $mu$ to be a probability measure.

The next status determines $I ∩ J_i$. If it is active, this portion ends just before the next entry; if it is inactive, it ends at the recorded last vertex. Its first vertex, when the portion is nonempty, is the first ancestor outside $H_i$. Equal successive entries, or an endpoint already in $H_i$, give an empty portion. Thus the clipped segment functional is constant on every cell of the $\( i + 1 \)$st partition, and

$ E_(i + 1) sum_(I upright(" old")) lambda_I P_(J_i) s_I^(*) = E_(i + 1) sum_(I upright(" old")) m_(i + 1) \( omega \, I \) P_(J_i) s_I^(*) . $

Split $m_(i + 1) = \( m_(i + 1) - m_i \) + m_i$. Disjointness of the clipped segments and conditional Jensen bound the first term in $L^2 \( X \)$ by $sqrt(g_i)$.

We now bound the second term using the small parent tail. At a fixed history $h$ through time $i$, possible active entries form the antichain of minimal vertices outside $H_i$. Only finitely many occur in the finite sample space. Let $V$ be those lying in $H_(i + 1)$, let $p_v$ be the conditional expected number of old segments with entry $v$, and let $m_v$ be their mean coefficient under $mu$ conditional on $h$ and this entry. Empty cells give $m_v = 0$. There is at most one such segment per outcome, by disjointness. Hence the coordinates of the conditional old contribution on $V$ are exactly $p_v m_v$. Its only other contributions in $U_i$ come from new segments. The antichain norm and (5.11) therefore imply

#[#set math.equation(numbering: n => "(5.13)")
 $ (sum_(v in V) \| p_v m_v \|^2)^(1 \/ 2) lt.eq 2 eta + \( E_i B_r \)^(1 \/ 2) . $ <dir:atomic:status-antichain>]

For the new term, this follows from its disjoint-segment bound and conditional Cauchy–Schwarz before restricting to $V$.

At a child history $h'$ of $h$, the conditional expected number of old segments with a given previous entry $v$ is at most $2 p_v$. To see the measure normalization explicitly, if $C \( h \, v \)$ denotes the corresponding cell of pairs, then

$ p_v = frac(mu \( C \( h \, v \) \), Pr \( h \)) \, #h(2em) frac(mu \( C \( h \, v \) ∩ { upright("history ") h' } \), Pr \( h' \)) lt.eq 2 p_v \, $

since $Pr \( h' \) = Pr \( h \) \/ 2$. This fairness assertion concerns the original binary probability, not the pair measure $mu$.

The contribution with coefficient $m_i$ at $h'$ is consequently, for each $v in V$, $m_v$ times a nonnegative mixture of segment functionals starting at $v$, of total mass at most $2 p_v$. Add a zero functional to make this mass exactly $2 p_v$, when needed. Choose independently one term per $v$ from the normalized mixtures. Distinct $v$ lie in disjoint descendant subtrees, so (3.2) bounds every such sum by $2 \( sum_v \| p_v m_v \|^2 \)^(1 \/ 2)$. Averaging and then applying (5.13) gives an $L^2 \( X \)$ bound $4 eta + 2 sqrt(b_r)$ for this term. Adding the prediction difference and the new contribution proves

#[#set math.equation(numbering: n => "(5.14)")
 $ delta lt.eq 4 eta + 3 sqrt(b_r) + sqrt(g_i) #h(2em) \( r lt.eq i < r + L \) . $ <dir:atomic:status-final>]

Choose $L > 4 \/ delta^2$ first. Then choose $N$ large enough that $3 \/ sqrt(N) < delta \/ 4$, and take $k = N L$. Some interval satisfies $b_r lt.eq 1 \/ N$, since $sum_r b_r lt.eq 1$. For this interval, (5.9) and (5.14) force $sqrt(g_i) > delta \/ 2$ at every step. This contradicts (5.12), because

$ sum_(i = r)^(r + L - 1) g_i > L delta^2 \/ 4 > 1 . $

This completes the second proof of Theorem 8.

The two estimates retain different information. In the endpoint proof, the selected interval has endpoint energy at most $2 \/ M$, all surviving segments cross the entire interval, and the coefficient predictions are scalar martingales for each boundary label. In the start proof, total start energy is at most one, segments may terminate inside the interval, and prediction uses their refining active or inactive statuses on a finite measure space. These are direct obstruction arguments with their respective parameter choices; neither calculation above asserts an asymptotic midpoint modulus.

== 6 Fresh coordinate layers along diamond slopes <dir:layers>

We now use the linear path-cost space. Its intrinsic estimates control either a fresh part of a finite martingale or the squared-norm increase of a symmetric split. The graph arguments below supply precisely those inputs, with their separate support and measurability conditions.

For $T_n = bb(N)^(lt.eq n)$, including its root, let $b_t = sum_(s prec.curly.eq t) e_s$ and

$ L_n \( z \) = inf_(z = h + sum_t alpha_t b_t) #scale(x: 120%, y: 120%)[\(] parallel h parallel_(ell_2 \( T_n \)) + parallel alpha parallel_(ell_1 \( T_n \)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) X_(upright("lin")) = (xor.big_(n gt.eq 1) \( ell_2 \( T_n \) \, L_n \))_2 . $

The infimum ranges over real $h in ell_2 \( T_n \)$ and $alpha in ell_1 \( T_n \)$; it need not be attained. The intrinsic estimates below allow arbitrarily close decompositions. This definition is the linear path-cost model of #cite(label("TreePotentials")) Propositions 5.1 and 5.2. In particular, that paper proves the equivalence with the bounded global-test norm on each finite-height component. No infinite-height completion is substituted for this Hilbert sum.

For a finite ancestral set $A$ in the forest, $P_A$ is contractive on $X_(upright("lin"))$: it restricts a Hilbert vector and truncates every $b_t$ to another root path or zero. Finite coordinate vectors are dense because $parallel z parallel_2 \/ sqrt(n + 1) lt.eq L_n \( z \) lt.eq parallel z parallel_2$ on each component. Thus the $P_A$ approximate the identity strongly. For $A subset.eq B$, the layer projection is $P_(B \\ A) = P_B - P_A$ and has norm at most two. The tail projection $I - P_A$ also has norm at most two.

We use three forms of coordinate selection. Exact graph slopes can be paired with windows chosen at the current history, or with one head fixed across a whole level. Estimates requiring exact support instead use finite approximations: the approximating slopes retain the exact parent–child averaging identity, and the next support is fixed before the next sign. We give each intrinsic estimate immediately before the construction that meets its hypotheses.

Throughout, the probability space is a uniform finite sign cube, $cal(F)_i$ records its first $i$ signs, and a dyadic martingale satisfies $W_i = bb(E) \[ W_m divides cal(F)_i \]$. The estimates are the separate sign-prediction, variation, and stopping arguments proved in #cite(label("TreePotentials")); no constant is transferred between these proofs.

=== 6.1 Exact slopes with adaptive windows <dir:adaptive-windows>

The weighted sign-prediction estimate #cite(label("TreePotentials")) Theorem 6.4 supplies an absolute constant $C_(upright("sign"))$ such that, for finite ancestral windows $A_i subset.eq B_i$ measurable with respect to $cal(F)_i$, with $B_i subset.eq A_(i + 1)$ whenever $i + 1 < m$,

#[#set math.equation(numbering: n => "(6.1)")
 $ sum_(i < m) bb(E) parallel P_(B_i \\ A_i) W_(i + 1) parallel^2 lt.eq C_(upright("sign")) (bb(E) parallel W_m parallel^2 + sum_(i < m) bb(E) parallel P_(B_i \\ A_i) W_i parallel^2) . $ <dir:sign-input>]

There is no support assumption on $W_i$ and no specified numerical value for $C_(upright("sign"))$.

Suppose $f : cal(D)_k arrow.r X_(upright("lin"))$ is noncontracting and $D$-Lipschitz, where $k gt.eq 1$. We recursively select a middle vertex at each encountered edge, then choose a half-edge by a fair sign. The resulting true slopes $W_i$ form a dyadic martingale and satisfy $parallel W_i parallel lt.eq D$. At a history of length $i$, choose a finite ancestral $A_i$, containing $B_(i - 1)$ when $i gt.eq 1$, with $parallel \( I - P_(A_i) \) W_i parallel lt.eq 2^(- k)$. For each middle vertex consider its two child slopes. The first-child sequence is pairwise $2$-separated, as is the second-child sequence. Each sequence has only finitely many members with tail norm at most $1 \/ 2$: infinitely many such members, together with compactness of their bounded head projections, would give a pair at distance less than $2$. Thus one middle vertex has #emph[both] child tails greater than $1 \/ 2$.

Before tossing the next sign, enlarge $A_i$ to a finite ancestral $B_i$ capturing these two child tails closely enough that

$ parallel P_(B_i \\ A_i) W_(i + 1) parallel > 1 \/ 4 $

on either outcome. For the parent, $P_(B_i \\ A_i) W_i = P_(B_i) \( I - P_(A_i) \) W_i$, so its layer norm is at most $2^(- k)$. All windows are known before the next sign and are disjoint along each complete history. Applying (6.1) therefore gives

#[#set math.equation(numbering: n => "(6.2)")
 $ k / 16 lt.eq C_(upright("sign")) \( D^2 + k 2^(- 2 k) \) lt.eq C_(upright("sign")) \( D^2 + 1 \) . $ <dir:adaptive-conclusion>]

The constant remains independent of $k$ and $D$.

=== 6.2 Exact slopes with a common head at each level <dir:deterministic-heads>

For fixed finite ancestral $A_0 subset.eq dots.h.c subset.eq A_m$, with $E_i = A_i \\ A_(i - 1)$, the deterministic-head leakage estimate #cite(label("TreePotentials")) Theorem 6.5 is

#[#set math.equation(numbering: n => "(6.3)")
 $ sum_(i = 1)^m bb(E) parallel P_(E_i) W_i parallel^2 lt.eq 1024 (bb(E) parallel W_m parallel^2 + sum_(i = 1)^m bb(E) parallel P_(E_i) W_(i - 1) parallel^2) . $ <dir:leakage-input>]

It imposes no support restriction on the martingale.

Return to the noncontracting normalization and keep the true slopes $W_i$, so $parallel W_i parallel lt.eq D$. Put $epsilon = min { 1 \/ 8 \, 1 \/ sqrt(k) }$. Once the finitely many slopes at level $i$ have been selected, choose a single finite ancestral $A_i$ containing $A_(i - 1)$ when $i gt.eq 1$ and satisfying

$ parallel \( I - P_(A_i) \) W_i parallel lt.eq epsilon $

for every history at that level. At each current edge the first-child slopes are pairwise $2$-separated. Two have head projections less than $1 \/ 2$ apart; one therefore has tail norm at least $3 \/ 4$. Keep that middle vertex and its two half-edges as the next fair choice. After all choices at this level, enlarge the common head to approximate all next slopes as well.

For $E_(i + 1) = A_(i + 1) \\ A_i$, the first-child outcome satisfies $parallel P_(E_(i + 1)) W_(i + 1) parallel gt.eq 3 \/ 4 - epsilon gt.eq 1 \/ 2$. This outcome has conditional probability one half. On all outcomes the parent layer norm is at most $epsilon$, because $P_(E_(i + 1)) W_i = P_(A_(i + 1)) \( I - P_(A_i) \) W_i$. The sets $A_i$ are fixed across each level, exactly as required by (6.3). It follows that

#[#set math.equation(numbering: n => "(6.4)")
 $ k / 8 lt.eq 1024 \( D^2 + k epsilon^2 \) lt.eq 1024 \( D^2 + 1 \) . $ <dir:leakage-conclusion>]

=== 6.3 Supported approximations with predictable heads <dir:predictable-application>

The predictable-layer estimate #cite(label("TreePotentials")) Theorem 6.1 applies when $P_0$ is a fixed finite ancestral set, $P_i$ is finite ancestral and $cal(F)_(i - 1)$-measurable for $i gt.eq 1$, $P_(i - 1) subset.eq P_i$, and $W_i = P_(P_i) W_i$. If $parallel W_m parallel lt.eq C$ on every outcome, it gives

#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(i = 1)^m bb(E) parallel P_(P_i \\ P_(i - 1)) W_i parallel^2 lt.eq 495 C^2 . $ <dir:predictable-input>]

For the estimate with constant $495$, keep the noncontracting normalization. Set $alpha = 1 \/ \[ 8 \( k + 1 \) \]$. Approximate the initial true slope within $alpha$ by a finite vector $W_0$ supported on a finite ancestral $P_0$. At a history of length $i - 1$, choose from the true edge a deviation $z$ with

$ parallel \( I - P_(P_(i - 1)) \) z parallel gt.eq 3 \/ 4 . $

To do so, take two of the $2$-separated deviations with projected difference less than $1 \/ 2$, and use the triangle inequality for their tails. Approximate $z$ within $alpha$ by a finite vector $v_i$ and choose a finite ancestral $P_i supset.eq P_(i - 1)$ containing its support. For the next fair sign put $W_i = W_(i - 1) plus.minus v_i$ and follow the corresponding actual half-edge.

The sets $P_i$ and vectors $v_i$ are fixed before this sign. Consequently the $W_i$ form an exact dyadic martingale, are supported in $P_i$, and differ from their true slopes by less than $\( i + 1 \) alpha$. In particular, $parallel W_k parallel lt.eq D + 1$. Since the parent has no coordinates outside $P_(i - 1)$, on either sign

$ parallel P_(P_i \\ P_(i - 1)) W_i parallel = parallel \( I - P_(P_(i - 1)) \) v_i parallel gt.eq 3 \/ 4 - 2 alpha gt.eq 1 \/ 2 . $

The factor two uses only the bound for $I - P_(P_(i - 1))$. Every hypothesis of (6.5) now holds, giving

#[#set math.equation(numbering: n => "(6.6)")
 $ k / 4 lt.eq 495 \( D + 1 \)^2 . $ <dir:495-conclusion>]

Under the same predictable support hypotheses, the separate variation-and-mass-removal estimate #cite(label("TreePotentials")) Theorem 6.3 gives

#[#set math.equation(numbering: n => "(6.7)")
 $ sum_(i = 1)^m bb(E) parallel P_(P_i \\ P_(i - 1)) W_i parallel^2 lt.eq 252 C^2 . $ <dir:variation-input>]

In particular its bound is $1008$ when $C = 2$.

The variation estimate has a useful different graph normalization. Rescale the graph to upper constant one and lower constant $1 \/ D$, and put $epsilon = min { 1 \/ \( 4 D \) \, 1 \/ \( k + 1 \) }$. Approximate the initial slope within $epsilon$ as before. Given a finite head space $E = "ran" P_(P_(i - 1))$, some deviation has distance from $E$ greater than $1 \/ \( 2 D \)$. Otherwise all deviations would have bounded approximants in $E$ with errors less than $3 \/ \( 4 D \)$, and two close approximants would contradict their separation $2 \/ D$. Choose this deviation, approximate it by a finite $v_i$ with error less than $epsilon$, and update $W_i = W_(i - 1) plus.minus v_i$ using a predictable ancestral enlargement $P_i$. The cumulative error is less than $\( i + 1 \) epsilon$, and hence $parallel W_k parallel lt.eq 2$. Moreover,

$ parallel P_(P_i \\ P_(i - 1)) W_i parallel = parallel v_i - P_(P_(i - 1)) v_i parallel gt.eq "dist" \( v_i \, E \) > frac(1, 4 D) . $

Using (6.7) with $C = 2$ proves

#[#set math.equation(numbering: n => "(6.8)")
 $ frac(k, 16 D^2) lt.eq 1008 . $ <dir:1008-conclusion>]

The distance-to-head argument avoids requiring the tail projection to be contractive.

=== 6.4 A telescoping squared-gap argument <dir:gap-application>

For finite ancestral $A subset.eq A'$, $x = P_A x$, and $y = P_(A') y$, the fresh-layer squared-gap estimate #cite(label("TreePotentials")) Theorem 5.11 is

#[#set math.equation(numbering: n => "(6.9)")
 $ parallel P_(A' \\ A) y parallel^2 lt.eq 400 (frac(parallel x + y parallel^2 + parallel x - y parallel^2, 2) - parallel x parallel^2) . $ <dir:gap-input>]

The increment $y$ may have a nonzero part in $A$. Averaging a convexity gain and telescoping is the martingale method for uniformly convex norms #cite(label("Pisier2011")) Theorem 4.6 and its proof. Here the estimate controls only the part of the increment in the new coordinate layer.

Normalize the graph to upper constant one and lower constant $1 \/ D$. Let $a = 2 \/ D$ and choose $0 < gamma < min { a \/ 8 \, 1 \/ \( k + 1 \) }$. At the root use a finite ancestral projection $W_0 = P_(A_0) x_0$ of the true slope, with error at most $gamma$. Work successively by levels. Given a current true slope and $A_(i - 1)$, its $a$-separated deviations have one member $z$ with $parallel \( I - P_(A_(i - 1)) \) z parallel gt.eq a \/ 4$, by the same finite-head compactness argument. Choose one at each of the finitely many histories. Enlarge to a common finite ancestral $A_i$ so that $parallel z - P_(A_i) z parallel lt.eq gamma$ for all these choices. Set $v_i = P_(A_i) z$ and define $W_i = W_(i - 1) plus.minus v_i$, associated with the actual half-edges. The parent is supported in $A_(i - 1)$, the increment is supported in $A_i$, and every approximation error is at most $\( i + 1 \) gamma$. Thus $parallel W_i parallel lt.eq 2$.

For $E_i = A_i \\ A_(i - 1)$, nesting of the projections gives

$ P_(E_i) v_i = \( P_(A_i) - P_(A_(i - 1)) \) z \, #h(2em) parallel P_(E_i) v_i parallel gt.eq a \/ 4 - gamma > a \/ 8 . $

Here the error is exactly $z - P_(A_i) z$, whose norm is at most $gamma$; no layer-projection bound enters this comparison. Apply (6.9) at every parent with $x = W_(i - 1)$ and $y = v_i$. Averaging over a level and then summing the squared-norm increases yields

#[#set math.equation(numbering: n => "(6.10)")
 $ 4 gt.eq bb(E) parallel W_k parallel^2 gt.eq parallel W_0 parallel^2 + frac(k \( a \/ 8 \)^2, 400) gt.eq frac(k \( a \/ 8 \)^2, 400) . $ <dir:400-conclusion>]

Thus this direct argument also excludes a uniform distortion bound. Only a finite binary tree was averaged after the coordinate choices; the availability of infinitely many middle vertices was used at each selection step.

== 7 Midpoint transfer rules <met:transfer-section>

The principal forest bound used an arbitrary-displacement quadratic estimate. We now give transfers for other intrinsic inputs, to be used in the path-cost and recursive models below. The three mechanisms are additive loss of a power of the slope, exclusion of separated lenses, and finite-codimensional gain. The approximation head is fixed before selecting a pair of deviations; no child supremum is assumed attained.

=== 7.1 Homogeneous tail estimates and separated lenses <homogeneous-tail-estimates-and-separated-lenses>

#thm([Proposition 7.1.])[
  (Homogeneous tail estimates).  #emph[Let $X$ have a specified coordinate system with dense finite-support vectors. Fix a family $cal(P)$ of bounded finite-rank coordinate projections such that every finite support is contained in the range of some $P in cal(P)$. Consider separately the following two hypotheses, each imposed for every $P in cal(P)$, all pure head and tail vectors $p = P p$, $P y = 0$, and every $R > 0$: 
#[#set math.equation(numbering: n => "(7.1)")
 $ parallel y parallel^2 & lt.eq C^2 R \( R - parallel p parallel \) &  & upright("if ") parallel p plus.minus y parallel lt.eq R \,\
parallel p parallel^2 + a parallel y parallel^2 & lt.eq R^2 &  & upright("if ") parallel p plus.minus y parallel lt.eq R . $ <met:radial-input>]

 Here $C > 0$, respectively $a > 0$, is uniform over $cal(P)$, the vectors, and $R$. No uniform bound on $parallel P parallel$ or $parallel I - P parallel$ is assumed. For $R > 0$ and $epsilon > 0$, an infinite $epsilon$-separated family in the symmetric $R$-lens at $x$ then satisfies, respectively, 
#[#set math.equation(numbering: n => "(7.2)")
 $ epsilon^2 \/ 4 & lt.eq C^2 R \( R - parallel x parallel \) \,\
parallel x parallel^2 + a epsilon^2 \/ 4 & lt.eq R^2 . $ <met:radial-lens>]

]
] <met:tail-to-lens>

#proof[
  Choose $p$ and $P$ as in Lemma 2, and apply the assumed estimate to $p \, y$ at radius $R + 2 eta$. In the first case,
  $ \( epsilon \/ 2 - eta \)^2 lt.eq C^2 \( R + 2 eta \) \( R + 2 eta - parallel p parallel \) lt.eq C^2 \( R + 2 eta \) \( R + 3 eta - parallel x parallel \) . $
  In the second case, $max { parallel x parallel - eta \, 0 }^2 + a \( epsilon \/ 2 - eta \)^2 lt.eq \( R + 2 eta \)^2$. Take $0 < eta < epsilon \/ 2$ and let $eta$ decrease to zero. ◻
]

=== 7.2 Squared losses and additive losses <met:squared-section>

For the noncontracting normalization define

$ R_j = sup { parallel x_e parallel : e upright(" is a stage-") j upright(" edge") } \, #h(2em) 1 lt.eq R_j lt.eq D . $

The countable supremum need not be attained. Our estimates apply to each parent edge before the supremum is taken.

The squared-lens hypothesis below is the $p = 2$ Banach-space form of the metric diamond inequality in #cite(label("Malthaner2025")) Equation (2) and Theorem 3.7 of arXiv v2: its endpoints are $- x \, x$ and its intermediate points are the deviations $z_i$. We retain the coefficient by summing the squared losses directly.

#thm([Theorem 7.2.])[
  #emph[If every infinite $epsilon$-separated symmetric $R$-lens satisfies $parallel x parallel^2 lt.eq R^2 - b epsilon^2$ for some $b > 0$, then every embedding (2.1) satisfies $D^2 gt.eq 1 + 4 b k$. If instead (7.2) holds, then 
#[#set math.equation(numbering: n => "(7.3)")
 $ k lt.eq C^2 D \( D - 1 \) . $ <met:additive-bound>]

]
] <met:squared-transfer>

#proof[
  For each stage-$j$ parent, its children lie in the lens of radius $R_(j + 1)$ and its deviations are $2$-separated. The first hypothesis gives $parallel x parallel^2 lt.eq R_(j + 1)^2 - 4 b$. Taking suprema gives $R_j^2 lt.eq R_(j + 1)^2 - 4 b$, and summing yields $1 lt.eq R_0^2 lt.eq D^2 - 4 b k$. For the radial estimate,
  $ 1 lt.eq C^2 R_(j + 1) \( R_(j + 1) - parallel x parallel \) \, #h(2em) R_j lt.eq R_(j + 1) - frac(1, C^2 R_(j + 1)) lt.eq R_(j + 1) - frac(1, C^2 D) . $
  Summing proves (7.3). Empty sums cover $k = 0$. ◻
]

=== 7.3 Retaining a homogeneous power loss <retaining-a-homogeneous-power-loss>

The radius dependence of a higher-power input can be accumulated directly. Replacing it by a fixed contraction factor would discard this information.

#thm([Theorem 7.3.])[
  #emph[Assume the density and projection-family hypotheses of Proposition 10. Let $q gt.eq 2$ and $c > 0$. Suppose that for every admissible projection, every pure head–tail pair $p \, y$, and every $R > 0$, 
$ parallel p plus.minus y parallel lt.eq R quad arrow.r.double quad parallel p parallel^2 + c R^(2 - q) parallel y parallel^q lt.eq R^2 . $

 Then every distortion-$D$ embedding of $cal(D)_k$ satisfies 
$ c k lt.eq D^(q - 2) \( D^2 - 1 \) . $

]
] <met:power-transfer>

#proof[
  Use the noncontracting normalization. Fix a parent $x$ whose child slopes have norm at most $R$. Lemma 2, followed by $eta arrow.b 0$, gives
  $ parallel x parallel^2 + c R^(2 - q) lt.eq R^2 . $
  Here the paired tail has limiting lower norm one. Set $R = R_(j + 1)$ and take the supremum over stage-$j$ parents. Since $1 lt.eq R_(j + 1) lt.eq D$ and $q gt.eq 2$,
  $ R_(j + 1)^2 - R_j^2 gt.eq c R_(j + 1)^(2 - q) gt.eq c D^(2 - q) . $
  Summing between $R_0 gt.eq 1$ and $R_k lt.eq D$ gives $D^2 - 1 gt.eq k c D^(2 - q)$, as required. ◻
]

=== 7.4 Keeping the parameterized test losses <met:parametric-section>

Some primal tests give a linear gain before optimization. The graph argument can preserve that parameter instead of replacing the input by a single modulus.

#thm([Proposition 7.4.])[
  #emph[Assume the density and projection-family hypotheses of Proposition 10. Fix constants $a \, b > 0$. Suppose that for every admissible projection and every pure head–tail pair $p \, y$, the following estimate holds for all $lambda > 0$: 
$ max_plus.minus parallel p plus.minus y parallel gt.eq frac(parallel p parallel + a lambda parallel y parallel, sqrt(1 + b lambda^2)) . $

 Put $Q = sqrt(1 + b lambda^2)$. For noncontracting diamond slopes bounded above by $D$, the stage suprema satisfy 
$ R_j lt.eq Q R_(j + 1) - a lambda lt.eq R_(j + 1) - #scale(x: 120%, y: 120%)[\(] a lambda - \( Q - 1 \) D #scale(x: 120%, y: 120%)[\)] . $

 In particular, whenever $Delta = a lambda - \( Q - 1 \) D > 0$, one has $1 + k Delta lt.eq D$.]
] <met:parametric>

#proof[
  For each parent $x$, choose a finite-support approximation $p$ and a paired tail $y$ as in Lemma 2. The half-difference has norm at least one, so $parallel y parallel gt.eq 1 - eta$. If the child bound is $R$, then $R + 2 eta gt.eq \( parallel p parallel + a lambda \( 1 - eta \) \) \/ Q$. Let $eta arrow.b 0$ to obtain $parallel x parallel lt.eq Q R - a lambda$, and then take suprema. Summation proves the last assertion. ◻
]

=== 7.5 Backward contraction <met:backward-section>

An exact power-law lens estimate is useful but unnecessary for a qualitative obstruction. The following form also handles estimates whose constants are selected only after the separation is specified.

#thm([Proposition 7.5.])[
  #emph[Fix $0 < alpha lt.eq 1$. Suppose some $0 lt.eq rho < 1$ has the following property: whenever $parallel x plus.minus z_i parallel lt.eq 1$ and $parallel z_i - z_j parallel gt.eq 2 alpha$ for $i eq.not j$, one has $parallel x parallel lt.eq rho$. An embedding with lower factor $alpha$ and upper factor one must satisfy 
#[#set math.equation(numbering: n => "(7.4)")
 $ alpha lt.eq rho^k \, $ <met:backward-bound>]

 where the empty product $rho^0$ is one.]
] <met:backward>

#proof[
  Let $r_j$ be the supremum of stage-$j$ slope norms. Initially $r_k lt.eq 1$, and every $r_j gt.eq alpha > 0$. If all child slopes are at most $r_(j + 1)$, normalize (2.2) by this positive number. The resulting unit lens has separation at least $2 alpha \/ r_(j + 1) gt.eq 2 alpha$. The hypothesis gives $parallel x parallel lt.eq rho r_(j + 1)$ for every parent, hence $r_j lt.eq rho r_(j + 1)$. Induction proves the assertion. If $rho = 0$, the existence of any replacement already contradicts $r_j gt.eq alpha$. ◻
]

For example, (7.2) gives $rho = 1 - alpha^2 \/ C^2$ when this number is positive. If it is nonpositive, a parent lens with center norm at least $alpha > 0$ is already impossible. With upper factor one it also gives the stronger intermediate inequality

$ parallel x parallel lt.eq r - frac(alpha^2, C^2 r) lt.eq r - alpha^2 / C^2 \, #h(2em) 0 < r lt.eq 1 . $

Thus $k lt.eq C^2 \( D^2 - D \)$ when $alpha = 1 \/ D$. Alternatively, if the proved lens input is $parallel x parallel lt.eq 1 - eta \( 2 alpha \)$, the direct conclusion is $alpha lt.eq \( 1 - eta \( 2 alpha \) \)^k$; a polynomial rate requires an actual quantitative bound for $eta$.

=== 7.6 Enlarged lenses and stable parents <met:selection-section>

A unit-ball lens gap bounds the parent relative to the child bound. The equivalent normalization below divides by the parent norm instead. It also identifies an actual parent at which all children have moderate stretch.

#thm([Proposition 7.6.])[
  (Enlarged lenses and a stable parent).  #emph[ Let $D gt.eq 1$ and $delta > 0$. If $\( 1 + delta \)^k > D$, every noncontracting embedding with upper factor $D$ has a parent edge all of whose child slopes have norm at most $\( 1 + delta \)$ times its own slope norm. If, for every unit $u$, the enlarged lens 
$ M \( u \, delta \) = { z : max_plus.minus parallel u plus.minus z parallel lt.eq 1 + delta } $

 contains no infinite $2 \/ D$-separated family, then every such embedding satisfies 
#[#set math.equation(numbering: n => "(7.5)")
 $ 1 lt.eq frac(D, \( 1 + delta \)^k) . $ <met:bridge:enlarged-depth>]

]
] <met:stable-parent>

#proof[
  If no stable parent existed, choose at each stage an actual child whose slope norm is greater than $1 + delta$ times its parent’s norm. Starting with norm at least one would contradict the terminal upper bound $D$. At a stable parent of norm $r lt.eq D$, division by $r$ puts all deviations in $M \( x \/ r \, delta \)$ with separation at least $2 \/ r gt.eq 2 \/ D$. This proves the second assertion by contradiction.
  The same exclusion also gives a backward proof. If all children of a parent of norm $r$ have norm at most $L lt.eq D$, then $r gt.eq L \/ \( 1 + delta \)$ would put the normalized deviations in the forbidden lens. Thus every parent has norm less than $L \/ \( 1 + delta \)$; taking suprema gives the non-strict bound, and iteration from $L = D$ proves (7.5). Neither proof assumes attainment of a child supremum. ◻
]

The stable parent may instead be divided by its child bound $\( 1 + delta \) r$. Its unit-ball lens has center norm $1 \/ \( 1 + delta \)$ and separation at least $2 \/ \( \( 1 + delta \) D \)$. This is useful when the intrinsic estimate is stated for unit-ball lenses rather than enlarged unit-center lenses.

=== 7.7 Uniform finite-head bounds and their parameters <met:packing-section>

Many estimates above control all lens vectors using one head selected from the center. This order of quantifiers is precisely what packing requires.

#thm([Lemma 7.7.])[
  #emph[Let $P$ be bounded and finite rank, let $A subset X$ be bounded, and let $b gt.eq 0$ and $epsilon > 0$. If $parallel \( I - P \) v parallel lt.eq b$ for all $v in A$, then $A$ contains no infinite $epsilon$-separated family when $2 b < epsilon$. Consequently the following two inputs have different graph conclusions.]
  + #emph[Let $0 < delta < 1$. For each $parallel x parallel > 1 - delta$, suppose one such $P$ bounds by $b \( delta \)$ the tails of every $v$ with $parallel x plus.minus v parallel lt.eq 1$. If $2 b \( delta \) < 2 \/ D$, backward contraction gives $D^(- 1) lt.eq \( 1 - delta \)^k$.]
  + #emph[Let $delta > 0$. For every unit $x$, suppose one such $P$ bounds by $b \( delta \)$ the tails of every $v$ with $parallel x plus.minus v parallel lt.eq 1 + delta$. If $2 b \( delta \) < 2 \/ D$, actual-child selection gives $D gt.eq \( 1 + delta \)^k$.]
  #emph[The same conclusions hold when the bound is on the first endpoint of every pair with $\( u + v \) \/ 2 = x$: take $u \, v in B_X$ in case (1), and $u \, v in \( 1 + delta \) B_X$ in case (2).]
] <met:packing>

#proof[
  If $\( v_i \)$ were such a separated family, choose distinct $i \, j$ with $parallel P v_i - P v_j parallel < epsilon - 2 b$. The triangle inequality contradicts $parallel v_i - v_j parallel gt.eq epsilon$. The graph conclusions follow from Propositions 14 and 15. For first endpoints, translation by their common center preserves separation and the same finite-dimensional argument applies directly to $\( u_i \)$. ◻
]

Under the projection-family hypotheses of Proposition 10, a bound only on pure tails uses Lemma 2 for a second form of compactness. For example, suppose unit-ball head–tail pairs obey $parallel y parallel lt.eq g \( 1 - parallel p parallel \)$, where $g : \[ 0 \, 1 \] arrow.r \[ 0 \, oo \)$ is nondecreasing and $g \( r \) arrow.r 0$ as $r arrow.b 0$. For $t > 0$, an infinite $2 t$-separated unit lens cannot have center norm greater than $1 - Delta$ if

#[#set math.equation(numbering: n => "(7.6)")
 $ 0 < Delta < 1 \/ 4 \, #h(2em) \( 1 + 2 Delta \) g \( 4 Delta \) + Delta < t . $ <met:g-parameters>]

Indeed choose a head approximating the center within $Delta$ and a half-difference with head norm at most $Delta$. After division by $1 + 2 Delta$, its tail norm is at least $\( t - Delta \) \/ \( 1 + 2 Delta \)$, whereas the normalized center deficit is at most $4 Delta$. This contradicts (7.6). Thus with $t = 1 \/ D$ the resulting backward factor is $1 - Delta$. Neither monotonicity nor a power-law rate is presumed for a function until its actual formula establishes it.

=== 7.8 From a qualitative sequential estimate to a uniform lens gap <met:bridge:sequential-section>

The qualitative argument can start with a statement about sequences of pure head–tail pairs, without first constructing a numerical modulus.

#thm([Lemma 7.8.])[
  #emph[Assume the density and projection-family hypotheses of Proposition 10. Suppose that whenever admissible heads $P_n in cal(P)$ and vectors $p_n \, y_n$ satisfy 
$ P_n p_n = p_n \, #h(2em) P_n y_n = 0 \, #h(2em) parallel p_n plus.minus y_n parallel lt.eq 1 \, #h(2em) parallel p_n parallel arrow.r 1 \, $

 one has $parallel y_n parallel arrow.r 0$. The heads are allowed to vary with $n$. Then, for each $epsilon > 0$, there is $0 < rho < 1$ such that every infinite $epsilon$-separated symmetric unit lens has center norm at most $rho$.]
] <met:bridge:sequential-lens>

#proof[
  If no such $rho$ existed, choose centers $x_n$ with $parallel x_n parallel arrow.r 1$ and infinite $epsilon$-separated families $\( z_(n \, i) \)_i$ with $parallel x_n plus.minus z_(n \, i) parallel lt.eq 1$. Choose $eta_n arrow.b 0$, finitely supported $p_n$ with $parallel p_n - x_n parallel < eta_n$, and admissible heads $P_n$ satisfying $P_n p_n = p_n$. Lemma 2 gives a half-difference $w_n$ and the tail $y_n = w_n - P_n w_n$ with
  $ parallel y_n parallel gt.eq epsilon \/ 2 - eta_n \, #h(2em) parallel p_n parallel gt.eq parallel x_n parallel - eta_n \, #h(2em) parallel p_n plus.minus y_n parallel lt.eq 1 + 2 eta_n . $
  Divide both vectors by $1 + 2 eta_n$. The resulting pure head–tail pairs have endpoints in the unit ball and centers whose norms tend to one. Their tail norms have lower limit at least $epsilon \/ 2 > 0$, contradicting the assumed sequential statement. This contradiction gives one $rho$ valid for all centers and heads. ◻
]

In the upper-one graph normalization, take $epsilon = 2 \/ D$. Dividing a parent configuration by any child bound $0 < L lt.eq 1$ leaves separation at least $2 \/ \( D L \) gt.eq epsilon$. Thus the lemma gives the parent bound $rho L$ and Proposition 14 yields $1 \/ D lt.eq rho^k$.

=== 7.9 Finite-codimensional gains <met:quotient-section>

The relation between finite-codimensional midpoint gains and small symmetric lenses is developed in #cite(label("DKRRZ2016")) Theorem 2.1. Here we retain the quantitative difference between selecting an actual child with a reserved error margin and taking a limiting supremum. The next transfer uses the symmetric maximum, so it also applies when the intrinsic theorem controls the average of the endpoint norms.

#thm([Proposition 7.9.])[
  #emph[Suppose that for some $t > 0$ and $g > 0$, every unit vector $u in X$ admits a closed finite-codimensional subspace $F_u$ such that 
$ y in F_u \, quad parallel y parallel gt.eq t quad arrow.r.double quad max { parallel u + y parallel \, parallel u - y parallel } gt.eq 1 + g . $

 If $D gt.eq 1$ and $t lt.eq 1 \/ \( 2 D \)$, every noncontracting embedding of $cal(D)_k$ with upper factor $D$ satisfies $D gt.eq \( 1 + g \/ 2 \)^k$.]
] <met:quotient-transfer>

#proof[
  For a parent slope $x$, put $r = parallel x parallel in \[ 1 \, D \]$ and use the subspace $F_(x \/ r)$. Apply the quotient part of Lemma 2 to choose $w = \( z_i - z_j \) \/ 2$, with $parallel w parallel gt.eq 1$, and $w' in F_(x \/ r)$ such that $parallel w - w' parallel < min { 1 \/ 2 \, r g \/ 2 }$. Then $parallel w' \/ r parallel gt.eq 1 \/ \( 2 D \) gt.eq t$, and
  $ max_plus.minus parallel x plus.minus w parallel gt.eq r \( 1 + g \) - parallel w - w' parallel > r \( 1 + g \/ 2 \) . $
  Each $x plus.minus w$ is the average of two of the four selected child slopes. One of these four actual slopes is therefore greater than $r \( 1 + g \/ 2 \)$. Choose it and repeat through $k$ generations. This argument makes no claim that a supremum over all children is attained. ◻
]

A bound initially stated only for $parallel y parallel = t$ extends to $parallel y parallel gt.eq t$: for a fixed direction $v$, the function $h \( r \) = max { parallel u + r v parallel \, parallel u - r v parallel }$ is even and convex, and hence nondecreasing on $\[ 0 \, oo \)$. This observation applies likewise to the average of the two norms.

#thm([Proposition 7.10.])[
  (The full asymptotic gain in a backward step).  #emph[Assume the finite-codimensional hypothesis of Proposition 18. Consider a noncontracting embedding with upper factor $D gt.eq 1$. If $t lt.eq 1 \/ D$ and all child slopes of one parent have norm at most $L$, then $parallel x parallel lt.eq L \/ \( 1 + g \)$. Consequently every depth-$k$ embedding with upper factor $D$ satisfies $1 lt.eq D \/ \( 1 + g \)^k$.]
] <met:full-gain>

#proof[
  Put $r = parallel x parallel in \[ 1 \, D \]$. Quotient compactness supplies half-differences $w$ with $parallel w parallel gt.eq 1$ and vectors $v in F_(x \/ r)$ with $parallel v - w parallel < eta$, where $0 < eta < 1 \/ 2$ is arbitrarily small. Set $w' = parallel w parallel v \/ parallel v parallel$. Then $w' in F_(x \/ r)$, $parallel w' parallel \/ r = parallel w parallel \/ r gt.eq 1 \/ D gt.eq t$, and
  $ parallel w' - w parallel lt.eq \| parallel w parallel - parallel v parallel #scale(x: 120%, y: 120%)[\|] + parallel v - w parallel < 2 eta . $
  The intrinsic gain and the crossed-average child bound imply $\( 1 + g \) r lt.eq max_plus.minus parallel x plus.minus w' parallel lt.eq L + 2 eta$. Let $eta arrow.b 0$ before taking suprema over parents, then iterate backward. Without the norm-preserving rescaling, the same proof works under the smaller threshold $t lt.eq 1 \/ \( 2 D \)$. ◻
]

#thm([Lemma 7.11.])[
  (The local midpoint estimate gives an enlarged lens gap).  #emph[Let $R > 0$ and put $t = R \/ 4$. Suppose $gamma > 0$ is such that every unit $u$ admits a closed finite-codimensional subspace $F_u$ with 
#[#set math.equation(numbering: n => "(7.7)")
 $ max_plus.minus parallel u plus.minus t y parallel gt.eq 1 + gamma #h(2em) \( y in F_u \, med parallel y parallel = 1 \) . $ <met:bridge:local-amuc-input>]

 Then $beta = gamma \/ 2$ excludes infinite $R$-separated families in $M \( u \, beta \)$, uniformly over unit $u$.]
] <met:bridge:local-amuc>

#proof[
  If $\( z_i \) subset M \( u \, beta \)$ were such a family, symmetry and convexity would place every half-difference $\( z_i - z_j \) \/ 2$ in the same lens. The family is bounded, so its image in the finite-dimensional quotient $X \/ F_u$ has arbitrarily close distinct pairs. Hence there are $i eq.not j$ and $w in F_u$ such that, with $v = \( z_i - z_j \) \/ 2$,
  $ parallel v parallel gt.eq R \/ 2 \, #h(2em) parallel v - w parallel < min { R \/ 4 \, gamma \/ 2 } . $
  In particular $parallel w parallel > R \/ 4 = t$. For a fixed unit direction $y$, the function $s mapsto max_plus.minus parallel u plus.minus s y parallel$ is even and convex, hence nondecreasing for $s gt.eq 0$. Apply (7.7) to $y = w \/ parallel w parallel$ to obtain $max_plus.minus parallel u plus.minus w parallel gt.eq 1 + gamma$. On the other hand, $v in M \( u \, beta \)$ and the strict approximation error give
  $ max_plus.minus parallel u plus.minus w parallel lt.eq 1 + beta + parallel w - v parallel < 1 + gamma \, $
  a contradiction. For $R = 2 \/ D$, Proposition 7.6 now gives (7.5) with $delta = beta = gamma \/ 2$. ◻
]

=== 7.10 The obstruction for an equivalent midpoint-convex norm <met:bridge:renorming-section>

The following obstruction is the countably branching diamond case of #cite(label("BaudierEtAl2017")) Theorem 4.1. We include the short deduction from the quotient transfer to specify the norm convention and the effect of an equivalent norm.

#thm([Theorem 7.12.])[
  #emph[If a Banach space admits an equivalent asymptotically midpoint uniformly convex norm, then the family $\( cal(D)_k \)_(k gt.eq 0)$ does not embed into it with uniformly bounded distortion. Write $"cof" \( X \)$ for the closed finite-codimensional linear subspaces of $X$. In infinite dimension, midpoint convexity may be expressed by positivity of the maximum modulus 
#[#set math.equation(numbering: n => "(7.8)")
 $ delta_N^max \( t \) = inf_(N \( u \) = 1) med sup_(F in "cof" \( X \)) med inf_(y in F\
N \( y \) = 1) #scale(x: 120%, y: 120%)[\(] max_plus.minus N \( u plus.minus t y \) - 1 #scale(x: 120%, y: 120%)[\)] > 0 #h(2em) \( 0 < t < 1 \) . $ <met:bridge:max-modulus>]

]
] <met:bridge:equivalent-amuc>

#proof[
  In finite dimension, even $cal(D)_1$ has a bounded infinite separated family of midpoints, whose images under a bi-Lipschitz map would contradict total boundedness. Consider an infinite-dimensional space, and suppose $a parallel x parallel lt.eq N \( x \) lt.eq b parallel x parallel$ with $a \, b > 0$. Embeddings with common distortion $D_0$ for the original norm, and arbitrary positive scales, would give embeddings with common distortion $D = \( b \/ a \) D_0$ for $N$: divide each map by its original lower scale times $a$.
  Fix $t = 1 \/ \( 2 D \)$ and $0 < g < delta_N^max \( t \)$. The definition of the supremum in (7.8) supplies, for every $N$-unit $u$, a finite-codimensional $F_u$ on whose unit sphere the maximum is at least $1 + g$. Even convexity in each direction extends this bound to every vector of $F_u$ with $N$-norm at least $t$. Proposition 18, applied to $N$, therefore gives $D gt.eq \( 1 + g \/ 2 \)^k$ for every $k$, which is impossible. An averaged midpoint lower bound also supplies the required maximum bound, since the maximum dominates the average. ◻
]

More generally, if $a parallel v parallel lt.eq N \( v \) lt.eq b parallel v parallel$, an embedding with distortion $D$ for $N$ has distortion at most $\( b \/ a \) D$ for the original norm, and conversely with the same factor. Thus the absence of uniform diamond distortion is invariant under equivalent renorming, while the numerical constants attached to a given norm need not be.

== 8 Graph consequences of path and segment costs <met:d-section>

The next four models change what a tree representation costs: a sum of Hilbert and path costs, their Euclidean combination, a charge at each segment’s start, or a restriction to incomparable segments. These are different norms. Within one norm, several estimates can also give different bounds. We first extract their squared losses, then retain the actual-child or qualitative conclusions when the method supplies different information. All intrinsic inputs come from the companion on bounded tree potentials and path costs; the graph deductions use the transfers proved above.

=== 8.1 Linear path cost <met:linear-section>

Recall the linear path-cost space $X_(upright("lin"))$ from Section 6. Its component norm is the infimum of $parallel h parallel_2 + parallel mu parallel_1$ over decompositions into a Hilbert vector and root paths, including the component root. For later comparison write $J_n mu = sum_s mu \( s \) b_s$ for the root-path sum on $T_n = bb(N)^(lt.eq n)$. The finite ancestor-closed coordinate projections are contractive, finite supports are dense, and this space and its dual are separable and reflexive. The squared estimates below and the weakly null estimate in Section 8.2 give lower bounds for this same norm; the latter will give the strongest coefficient displayed here.

The positive-flow argument gives, for $P p = p$, $P y = 0$ #cite(label("TreePotentials")) Theorem 5.7,

#[#set math.equation(numbering: n => "(8.1)")
 $ parallel y parallel^2 lt.eq C^2 \( parallel p + y parallel^2 + parallel p - y parallel^2 - 2 parallel p parallel^2 \) \, #h(2em) C = 6 \( sqrt(2) + 1 \) . $ <met:linear-flow-input>]

A separate trimming argument #cite(label("TreePotentials")) Theorem 5.10 gives the same inequality with $C^2$ replaced by $242$. Since each endpoint is at most $R$, these are (7.1) with $a = 1 \/ \( 2 C^2 \)$ and $a = 1 \/ 484$, respectively. Proposition 10 and Theorem 11 therefore give

#[#set math.equation(numbering: n => "(8.2)")
 $ D^2 gt.eq 1 + frac(k, 2 C^2) \, #h(2em) D^2 gt.eq 1 + k / 484 \, $ <met:linear-flow-graph>]

using the corresponding proof in each case. In upper-one normalization, the first argument says $r_j^2 lt.eq r_(j + 1)^2 - 1 \/ \( 2 C^2 D^2 \)$ and hence also retains $k lt.eq 2 C^2 D^2$.

The inward-clipping argument #cite(label("TreePotentials")) Theorem 5.4 gives the different parameterized estimate

#[#set math.equation(numbering: n => "(8.3)")
 $ max_plus.minus parallel p plus.minus y parallel gt.eq frac(parallel p parallel + c parallel y parallel \/ 2, sqrt(1 + 4 c^2)) #h(2em) \( c > 0 \, P p = p \, P y = 0 \) . $ <met:linear-clipping-input>]

Here is its direct actual-child application, retaining the error budget. For a parent $x$ in the noncontracting normalization set

$ c = frac(1, 8 D) \, quad Q = sqrt(1 + 4 c^2) \, quad gamma = c / 2 - \( Q - 1 \) D \, quad eta = frac(gamma, 2 \( 1 + c \/ 2 + 2 Q \)) . $

Since $Q - 1 lt.eq 2 c^2$, we have $gamma gt.eq c \/ 4 > 0$. Choose a finite head $P$ with $parallel x - P x parallel < eta$, and choose the pair in Lemma 2; write $w = \( z_i - z_j \) \/ 2$ and $y = w - P w$. The greatest of the four actual child norms is at least

$ max_plus.minus parallel x plus.minus w parallel & gt.eq frac(parallel P x parallel + c parallel y parallel \/ 2, Q) - 2 eta\
 & gt.eq frac(parallel x parallel - eta + c \( 1 - eta \) \/ 2, Q) - 2 eta gt.eq parallel x parallel + frac(gamma, 2 Q) . $

Selecting such a child through all $k$ generations gives

#[#set math.equation(numbering: n => "(8.4)")
 $ 1 + frac(k gamma, 2 Q) lt.eq D . $ <met:linear-clipping-graph>]

The additive increment is attached to the clipping estimate, independently of the positive-flow and trimming proofs.

=== 8.2 Weakly null pairs for the linear norm <met:weak-linear>

A further form of inward clipping #cite(label("TreePotentials")) Theorem 5.5 states that for every $x in X_(upright("lin"))$ and every bounded weakly null sequence $\( y_j \)$,

#[#set math.equation(numbering: n => "(8.5)")
 $ liminf_j max_plus.minus parallel x plus.minus y_j parallel gt.eq sqrt(parallel x parallel^2 + 1 / 16 \( liminf_j parallel y_j parallel \)^2) . $ <met:weak-input>]

This input retains a larger squared loss when we pair deviations before applying it:

#[#set math.equation(numbering: n => "(8.6)")
 $ D^2 gt.eq 1 + k \/ 16 . $ <met:linear-weak-graph>]

For a parent with child bound $R$ in the noncontracting normalization, the bounded sequence of deviations $z_i$ has a weakly Cauchy subsequence. Indeed, diagonalize its evaluations on a countable norm-dense subset of $X_(upright("lin"))^(*)$, then use boundedness to approximate every other functional. Relabel this subsequence and set $w_j = \( z_(2 j) - z_(2 j - 1) \) \/ 2$. It is weakly null, and sibling separation gives $parallel w_j parallel gt.eq 1$. Crossed convex averages give

$ x + w_j = 1 / 2 \( \( x + z_(2 j) \) + \( x - z_(2 j - 1) \) \) \, #h(2em) x - w_j = 1 / 2 \( \( x - z_(2 j) \) + \( x + z_(2 j - 1) \) \) \, $

so both norms are at most $R$. Equation (8.5) yields $parallel x parallel^2 + 1 \/ 16 lt.eq R^2$. Taking the stage suprema and summing proves (8.6). Alternatively, reflexivity supplies a weak limit $z$ and one can use $\( z_i - z \) \/ 2$. Separation then gives only $liminf parallel \( z_i - z \) \/ 2 parallel gt.eq 1 \/ 2$, yielding the weaker $D^2 gt.eq 1 + k \/ 64$; pairing two deviations avoids that loss.

The qualitative bottom-up mass-removal argument #cite(label("TreePotentials")) Theorem 5.9 can also be transferred without replacing it by (8.5). It states that pure-tail perturbations tend uniformly to zero as finite-head centers approach the unit sphere, allowing the heads to vary. Thus it satisfies the hypothesis of Lemma 17, which supplies a uniform separated-lens gap. Proposition 14 gives $D^(- 1) lt.eq rho_D^k$ for some $rho_D < 1$. This route uses the qualitative input alone and requires no weak-limit extraction or numerical modulus.

=== 8.3 Quadratic path cost <met:quadratic-section>

On the same trees define

$ Q_n \( z \) = inf_(z = h + J_n mu) \( parallel h parallel_2^2 + parallel mu parallel_1^2 \)^(1 \/ 2) \, #h(2em) X_(upright("quad")) = (xor.big_(n gt.eq 1) \( ell_2 \( T_n \) \, Q_n \))_2 . $

This changes the norm: the root singleton has quadratic-cost norm $1 \/ sqrt(2)$, whereas its linear-cost norm is one. The two cancellation estimates #cite(label("TreePotentials")) Theorem 7.6 and Proposition 7.10 have the same arbitrary-displacement form, with constants $8$ and $7$:

#[#set math.equation(numbering: n => "(8.7)")
 $ parallel \( I - P \) y parallel lt.eq K sqrt(R^2 - parallel p parallel^2) \, #h(2em) P p = p \, quad parallel p plus.minus y parallel lt.eq R \, #h(2em) K in { 8 \, 7 } . $ <met:quadratic-input>]

Finite ancestral heads have bounded finite-rank projections, and finite coordinate vectors are dense. These facts permit the same packing argument for either constant. For an infinite $epsilon$-separated $R$-lens at arbitrary $x$, choose a finite-support $p$ with $parallel p - x parallel < eta$. Apply (8.7) to every deviation at radius $R + eta$, using the same finite-rank head $P$. Two head projections are arbitrarily close. Hence

$ epsilon lt.eq 2 K sqrt(\( R + eta \)^2 - parallel p parallel^2) . $

Letting $eta$ decrease to zero gives $parallel x parallel^2 lt.eq R^2 - epsilon^2 \/ \( 4 K^2 \)$. Thus Theorem 11 gives $D^2 gt.eq 1 + k \/ K^2$. In particular,

#[#set math.equation(numbering: n => "(8.8)")
 $ D^2 gt.eq 1 + k \/ 49 . $ <met:quadratic-graph>]

The coefficient-$8$ proof independently gives $D^2 gt.eq 1 + k \/ 64$. Only boundedness and finite rank of $P$ entered the packing step.

The separate stopped-flow energy estimate #cite(label("TreePotentials")) Proposition 7.8 has input

$ parallel p parallel^2 + parallel y parallel^2 \/ 144 lt.eq 1 / 2 \( parallel p + y parallel^2 + parallel p - y parallel^2 \) \, #h(2em) P p = p \, quad P y = 0 . $

It gives $r_j^2 lt.eq r_(j + 1)^2 - 1 \/ \( 144 D^2 \)$ in upper-one normalization, and hence the quantitative necessary condition $k lt.eq 144 D^2$. The finite-head pairing, the $R + 2 eta$ endpoint error, and the limiting step are exactly those in Proposition 10.

===== 8.3.1 Packing at a fixed radius. <packing-at-a-fixed-radius.>

The same arbitrary-tail input also allows a direct finite-error packing argument. Its coefficient-$7$ version gives, for $alpha = 1 \/ D$ and $delta = alpha^2 \/ 2000$, the backward factor $1 - delta$. Indeed, if a unit-ball lens had center norm greater than $1 - delta$, approximate it within $delta$ by $p$. Then $parallel p parallel > 1 - 2 delta$ and the endpoint radius is $1 + delta$. Its common tails have norm at most

$ 7 sqrt(\( 1 + delta \)^2 - \( 1 - 2 delta \)^2) lt.eq 7 sqrt(6 delta) < alpha \/ 2 . $

Two head projections within $alpha$ contradict separation $2 alpha$. For the pruning estimate with coefficient $9$ #cite(label("TreePotentials")) Proposition 7.12, choose instead

#[#set math.equation(numbering: n => "(8.9)")
 $ 0 < gamma < 1 \/ 2 \, #h(2em) 9 sqrt(\( 1 + gamma \)^2 - \( 1 - 2 gamma \)^2) < frac(2 alpha, 3) . $ <met:pruning-parameter>]

The same approximation bounds every tail by $2 alpha \/ 3$; choose two head projections within $2 alpha \/ 3$. Their full distance is less than $2 alpha$, a contradiction. Thus the backward factor is $1 - gamma$. These choices retain the bounds supplied by their respective proofs.

The threshold-removal argument #cite(label("TreePotentials")) Proposition 7.14 gives a different relative-radius input: for every nonzero $x$ and $0 < delta lt.eq 1$, a single finite head bounds all deviations satisfying $parallel x plus.minus y parallel lt.eq \( 1 + delta \) parallel x parallel$ by

$ parallel \( I - P \) y parallel lt.eq 72 sqrt(delta) thin parallel x parallel . $

Take $delta = \( 200 D \)^(- 2)$. If every child of a noncontracting parent had norm at most $\( 1 + delta \) parallel x parallel$, their deviations would have a common tail bound $72 sqrt(delta) D$. Two head projections can be chosen within one, giving full distance less than $1 + 144 sqrt(delta) D < 2$. This contradicts sibling separation. An actual child therefore grows by the factor $1 + delta$, and $D gt.eq \( 1 + delta \)^k$.

===== 8.3.2 A finite-codimensional input. <a-finite-codimensional-input.>

The component-to-sum argument #cite(label("TreePotentials")) Lemma 7.15, Proposition 7.16 and Corollary 7.17 for the quadratic norm gives, at arbitrary unit centers, a finite-codimensional subspace on which

$ max_plus.minus parallel x plus.minus y parallel lt.eq 1 + e quad arrow.r.double quad parallel y parallel lt.eq 17 \( 2 e \)^(1 \/ 6) \, #h(2em) 0 < e lt.eq 1 \/ 16 . $

Given $D$, choose $e$ so that $17 \( 2 e \)^(1 \/ 6) < 1 \/ \( 2 D \)$. Proposition 18 then gives an actual child gain $1 + e \/ 2$, and $D gt.eq \( 1 + e \/ 2 \)^k$. This application uses the proved component-to-sum estimate, including its zero-center cases, rather than an assertion that passing to an outer Hilbert sum automatically preserves a midpoint gap.

=== 8.4 Segments with prescribed start cost <met:segment-section>

For nonnegative start masses $m_s$ on $T_n$, let $q_s = m_s + \( sum_(c upright(" child of ") s) q_c^2 \)^(1 \/ 2)$, computed upward from the leaves. A finite or countable signed segment representation $z = sum_j a_j upright(bold(1))_(\[ s_j \, t_j \])$, with absolutely convergent output at every coordinate, has start masses $m_s = sum_(j : s_j = s) \| a_j \|$ and cost $q_o$ at the root. Take the infimum over all such representations of finite cost and complete; the outer Hilbert sum of the resulting finite-height spaces is denoted $X_(upright("start"))$. Its intrinsic inequality is #cite(label("TreePotentials")) Theorem 8.4

#[#set math.equation(numbering: n => "(8.10)")
 $ max_plus.minus parallel p plus.minus y parallel^2 gt.eq parallel p parallel^2 + parallel y parallel^2 \/ 64 \, #h(2em) P_C p = p \, quad P_C y = 0 \, $ <met:segment-input>]

where $C$ is a finite ancestral head. Coordinate projections onto such heads are bounded and finite supports are dense.

For a noncontracting parent $x$ let $M$ be the supremum of its child norms. For arbitrarily small $eta > 0$, choose $p$ and the paired tail $y$ by Lemma 2, with $parallel y parallel gt.eq 1 - eta$. Then

$ M gt.eq sqrt(parallel p parallel^2 + \( 1 - eta \)^2 \/ 64) - 2 eta . $

On letting $eta$ decrease to zero, $M^2 gt.eq parallel x parallel^2 + 1 \/ 64$. Apply this to every parent before taking the stage suprema. Summing their squared losses gives

#[#set math.equation(numbering: n => "(8.11)")
 $ D^2 gt.eq 1 + k \/ 64 . $ <met:segment-graph>]

If one instead wants to follow actual children, some child has squared norm greater than $parallel x parallel^2 + 1 \/ 128$: otherwise the supremum would be at most this strictly smaller number. Selecting an actual child at each generation retains the separate bound $D^2 gt.eq 1 + k \/ 128$. No contractivity of $I - P_C$ was used, and no child was presumed to attain the supremum.

=== 8.5 Incomparable segments <met:incomparable-section>

Let $Y_I$ be the completion on the disjoint union of $T_n$ for the supremum of Euclidean sums of segment evaluations, where the admissible segments are pairwise incomparable: every node of one segment is incomparable with every node of another. Put $X_I = Y_I^(*)$. This restriction differs from requiring the segments merely to be disjoint. The intrinsic estimate for $X_I$ #cite(label("TreePotentials")) Theorem 9.5 is

$ parallel \( I - P_E \) y parallel lt.eq K sqrt(1 - parallel p parallel) \, #h(2em) P_E p = p \, quad parallel p plus.minus y parallel lt.eq 1 \, quad K = sqrt(2) + sqrt(6) \, $

where $E$ is finite and ancestral and $y$ may have head coordinates. Finite ancestral projections are contractive and finite coordinate vectors are dense. For a pure tail, homogeneity gives $parallel y parallel^2 lt.eq K^2 R \( R - parallel p parallel \)$ at radius $R$. Proposition 10 and Theorem 11 therefore give

#[#set math.equation(numbering: n => "(8.12)")
 $ k lt.eq K^2 D \( D - 1 \) . $ <met:incomparable-additive>]

At radius one the same lens estimate reads, for an infinite $2 alpha$-separated family,

$ parallel x parallel lt.eq 1 - \( alpha \/ K \)^2 . $

Under lower factor $alpha = 1 \/ D$ and upper factor one, normalize each parent lens by its child bound $R lt.eq 1$. Its separation is at least $2 alpha \/ R gt.eq 2 alpha$, so every parent bound contracts by $rho = 1 - \( alpha \/ K \)^2$. Hence $alpha lt.eq rho^k$ by Proposition 14. This is an application to the incomparable-segment norm itself, regardless of the equality of its displayed tail constant with one obtained for the disjoint-segment norm.

== 9 Graph consequences of recursive upper-array norms <met:f:applications>

Recursive upper arrays give three further target norms. The first uses a height-dependent child exponent and an outer Hilbert sum; its sixth- and cubic-power estimates yield additive losses in squared slope norm. The other two use Euclidean child aggregation on a joined tree and differ at the joining root. We retain the qualitative propagation argument for the free-root norm and an explicit finite-error cubic argument for the fixed-zero-root norm. The constants below belong to these stated inputs and deductions.

Let $T_h = union.big_(j = 0)^h bb(N)^j$ and $p_h = 1 + 1 \/ h$. For real $v in ell_(p_h) \( T_h \)$, let $P \( v \) \, Q \( v \)$ be the least nonnegative arrays whose difference is $v$ and which satisfy

$ P_s \( v \) gt.eq #scale(x: 180%, y: 180%)[\(] sum_(t in C \( s \)) P_t \( v \)^(p_h) #scale(x: 180%, y: 180%)[\)]^(1 \/ p_h) \, #h(2em) Q_s \( v \) gt.eq #scale(x: 180%, y: 180%)[\(] sum_(t in C \( s \)) Q_t \( v \)^(p_h) #scale(x: 180%, y: 180%)[\)]^(1 \/ p_h) . $

Here $C \( s \)$ is the set of children of $s$ and the sums at leaves are zero. More explicitly, if the two child norms are $a_s \, b_s$, then $P_s \( v \) = max { a_s \, v_s + b_s }$ and $Q_s \( v \) = max { a_s - v_s \, b_s }$. Write

$ nu_h \( v \) = P_nothing \( v \) + Q_nothing \( v \) \, #h(2em) X_(upright(v)) = #scale(x: 180%, y: 180%)[\(] xor.big_(h gt.eq 1) \( ell_(p_h) \( T_h \) \, nu_h \) #scale(x: 180%, y: 180%)[\)]_(ell_2) . $

The intrinsic upper-array results supply completeness, reflexivity, separability of $X_(upright(v))^(*)$, density of finite coordinate vectors, and the estimates used below; see #cite(label("RecursivePotentials")) Section 7. We use the slopes from (2.2). To discuss paired children, write

#[#set math.equation(numbering: n => "(9.1)")
 $ y_j = x + z_j \, #h(2em) macron(y)_j = x - z_j . $ <met:f:slopes>]

In noncontracting normalization the $y_j$, and also the $z_j$, are $2$-separated. In upper-one normalization the separation is $2 \/ D$.

=== 9.1 The sixth-power estimate <the-sixth-power-estimate>

A finite head in $X_(upright(v))$ means a finite ancestor-closed set in each of finitely many components, containing the component root whenever that component is used. Its coordinate projection is a bounded finite-rank operator. No estimate on its operator norm is needed in the following argument.

The finite-head estimate in #cite(label("RecursivePotentials")) Theorem 7.4 allows arbitrary completed tails.

#thm([Proposition 9.1.])[
  #emph[For $X_(upright(v))$ one has 
#[#set math.equation(numbering: n => "(9.2)")
 $ S - 2 parallel x parallel_(upright(v))^2 gt.eq c_6 S^(- 2) parallel y parallel_(upright(v))^6 \, #h(2em) S = parallel x + y parallel_(upright(v))^2 + parallel x - y parallel_(upright(v))^2 \, #h(2em) c_6 = 2 exp \( - \( upright(e) - 1 \) \) 4^(- 6) \, $ <met:f:sixth-input>]

 whenever $x$ is supported on a finite head and $y$ vanishes there. The right side is interpreted as zero when $S = 0$. Every distortion-$D$ embedding of $cal(D)_k$ into this norm satisfies 
#[#set math.equation(numbering: n => "(9.3)")
 $ frac(c_6 k, 8) lt.eq D^6 - D^4 . $ <met:f:sixth-power-depth>]

 For $0 < epsilon lt.eq 1$, put 
#[#set math.equation(numbering: n => "(9.4)")
 $ q_6 \( epsilon \) = (1 - frac(c_6 epsilon^6, 512))^(1 \/ 2) . $ <met:f:sixth-q>]

 Every infinite family satisfying 
$ parallel x + u_j parallel_(upright(v)) \, med parallel x - u_j parallel_(upright(v)) lt.eq 1 \, #h(2em) parallel u_j - u_l parallel_(upright(v)) gt.eq epsilon quad \( j eq.not l \) $

 has $parallel x parallel_(upright(v)) lt.eq q_6 \( epsilon \)$. Keeping a fixed unit-lens contraction gives the additional form 
#[#set math.equation(numbering: n => "(9.5)")
 $ D^(- 1) lt.eq q_6 \( D^(- 1) \)^k . $ <met:f:sixth-depth>]

]
] <met:f:sixth>

#proof[
  If $parallel x plus.minus y parallel_(upright(v)) lt.eq R$ with $R > 0$, then $S lt.eq 2 R^2$. For $S > 0$, (9.2) implies
  $ R^2 gt.eq parallel x parallel_(upright(v))^2 + frac(c_6, 8 R^4) parallel y parallel_(upright(v))^6 . $
  It is trivial when $S = 0$. Theorem 12, with power $6$ and coefficient $c_6 \/ 8$, gives (9.3).
  For the unit-lens statement, Lemma 2 supplies pure head–tail pairs $x' \, y'$ with $parallel x' - x parallel_(upright(v)) < tau$, $parallel y' parallel_(upright(v)) gt.eq epsilon \/ 2 - tau$, and endpoints of norm at most $1 + 2 tau$. Apply the displayed homogeneous estimate and let $tau arrow.b 0$. It gives $parallel x parallel_(upright(v))^2 + c_6 epsilon^6 \/ 512 lt.eq 1$. In upper-one graph normalization use the fixed separation parameter $epsilon = 1 \/ D$; actual sibling separation is at least $2 \/ D$. Proposition 14 proves (9.5). ◻
]

The power bound keeps the child radius in the loss at every level. The geometric form instead uses one contraction factor chosen at the start from $D$.

=== 9.2 The cubic estimate and weakly null paired differences <the-cubic-estimate-and-weakly-null-paired-differences>

The intrinsic cubic inequality and its weakly null consequence are #cite(label("RecursivePotentials")) Theorem 7.6 and Proposition 7.7. The first gives another additive power bound. The second exhibits a different selection: pairing a weakly Cauchy subsequence. The paired differences and crossed convex averages also occur in the approximate midpoint argument of #cite(label("DKRRZ2016")) proof of Corollary 2.3; here dual separability supplies the subsequence by diagonal extraction.

#thm([Proposition 9.2.])[
  #emph[The dual $X_(upright(v))^(*)$ is separable, and under the same finite-head support conditions as above one has 
#[#set math.equation(numbering: n => "(9.6)")
 $ parallel x plus.minus y parallel_(upright(v)) lt.eq R quad arrow.r.double quad R^2 gt.eq parallel x parallel_(upright(v))^2 + frac(c_3, 2 sqrt(2) thin R) parallel y parallel_(upright(v))^3 \, #h(2em) R > 0 \, quad c_3 = \( 6 upright(e) \)^(- 3) . $ <met:f:cubic-input>]

 Consequently every distortion-$D$ embedding of $cal(D)_k$ satisfies 
#[#set math.equation(numbering: n => "(9.7)")
 $ frac(c_3 k, 2 sqrt(2)) lt.eq D^3 - D . $ <met:f:cubic-power-depth>]

 For $0 < epsilon lt.eq 1$, define 
#[#set math.equation(numbering: n => "(9.8)")
 $ theta \( epsilon \) = (1 - frac(c_3 epsilon^3, 2 sqrt(2)))^(1 \/ 2) . $ <met:f:cubic-theta>]

 If $\( h_j \)$ is weakly null, $parallel h_j parallel_(upright(v)) gt.eq epsilon$, and $parallel x plus.minus h_j parallel_(upright(v)) lt.eq 1$, then $parallel x parallel_(upright(v)) lt.eq theta \( epsilon \)$. Every distortion-$D$ embedding of the depth-$k$ countably branching diamond into $X_(upright(v))$ satisfies 
#[#set math.equation(numbering: n => "(9.9)")
 $ 1 lt.eq D theta \( D^(- 1) \)^k . $ <met:f:cubic-depth>]

]
] <met:f:cubic-weak>

#proof[
  Theorem 12, applied directly to (9.6), gives (9.7). The weakly null implication is the cited Proposition 7.7. To use it in the graph, normalize to lower factor one and upper factor $D$, and let $R lt.eq D$ bound the children of one parent $x$. Dual separability gives a weakly Cauchy subsequence of $\( y_j \)$. The diagonal argument is the one in Section 8.2.
  Take successive disjoint pairs $y_(j_(2 r)) \, y_(j_(2 r + 1))$ from this subsequence and put
  $ h_r = frac(y_(j_(2 r)) - y_(j_(2 r + 1)), 2 R) . $
  The sequence $\( h_r \)$ is weakly null. Sibling separation gives $parallel h_r parallel_(upright(v)) gt.eq 1 \/ R gt.eq 1 \/ D$. The identities
  $ x / R + h_r = frac(y_(j_(2 r)) + macron(y)_(j_(2 r + 1)), 2 R) \, #h(2em) x / R - h_r = frac(y_(j_(2 r + 1)) + macron(y)_(j_(2 r)), 2 R) $
  show that both points belong to the unit ball. The weakly null conclusion, with $epsilon = 1 \/ D$, gives $parallel x parallel_(upright(v)) lt.eq R theta \( D^(- 1) \)$. Taking the parent suprema and iterating this contraction proves (9.9). ◻
]

=== 9.3 A qualitative contraction for the free-root sum norm <a-qualitative-contraction-for-the-free-root-sum-norm>

We next change the norm. Join disjoint copies of $T_h$ at a new root $rho$ whose children are their roots. At every node use the least nonnegative arrays $p \, q$ with difference equal to the coordinate and with each array dominating the $ell_2$ norm of its child values. For a finitely supported vector with an unrestricted root coordinate, put

$ N_J \( x \) = p_rho \( x \) + q_rho \( x \) \, $

and let $X_J$ be the completion. In this subsection $X_J$ refers to the tree formed by joining these finite-height components, with a free root coordinate. In particular, the norm of an indicator of an initial path starting at a component root is two.

Restriction $P_H$ to a finite ancestral set containing $rho$ is contractive. On finitely supported arrays, restriction removes child values outside $H$; the recursion is monotone in their nonnegative norms, so neither root field can increase. This proves contractivity on the dense finite arrays and hence on the completion. Applying $I - P_H$ to finite approximations also proves density of finitely supported vectors in $ker P_H$.

The intrinsic probabilistic propagation estimate #cite(label("RecursivePotentials")) Lemmas 6.1 and 6.2 supplies, for every $0 < zeta lt.eq 2$, a number $gamma \( 2 \, zeta \/ 4 \) > 0$ such that

#[#set math.equation(numbering: n => "(9.10)")
 $ frac(N_J \( x + y \) + N_J \( x - y \), 2) gt.eq N_J \( x \) + 2 gamma \( 2 \, zeta \/ 4 \) $ <met:f:sum-input>]

whenever $x \, y$ are finitely supported, $x$ is supported on a finite ancestor-closed set $H$ containing $rho$, $y$ vanishes on $H$, $N_J \( x plus.minus y \) lt.eq 2$, and $N_J \( y \) gt.eq zeta$. The number $gamma$ is uniform in the finite tree and its height. The estimate comes from the logarithmic-martingale propagation of the two upper arrays; only its positivity is used here.

The resulting separated-lens statement is also #cite(label("RecursivePotentials")) Theorem 6.3.

#thm([Proposition 9.3.])[
  #emph[For every $0 < epsilon lt.eq 2$ there is $eta \( epsilon \) in \( 0 \, 1 \)$ such that 
$ N_J \( x plus.minus z_j \) lt.eq 1 \, #h(2em) N_J \( z_j - z_l \) gt.eq epsilon quad \( j eq.not l \) quad arrow.r.double quad N_J \( x \) lt.eq 1 - eta \( epsilon \) . $

 For $epsilon > 2$ the hypotheses are impossible, so any $eta \( epsilon \) in \( 0 \, 1 \)$ is admissible. An embedding of the depth-$k$ countably branching diamond into $X_J$ with distortion at most $D$ therefore satisfies 
#[#set math.equation(numbering: n => "(9.11)")
 $ D^(- 1) lt.eq #scale(x: 120%, y: 120%)[\(] 1 - eta \( 2 \/ D \) #scale(x: 120%, y: 120%)[\)]^k . $ <met:f:sum-depth>]

]
] <met:f:sum>

#proof[
  Fix $epsilon$ and put $zeta = epsilon \/ 4$. For each sufficiently small $delta > 0$, take a finite coordinate vector $x'$ with $N_J \( x - x' \) < delta$ and a finite ancestor-closed head $H$ containing its support and $rho$. The sequence $\( z_j \)$ is bounded. Finite-dimensional total boundedness therefore supplies a pair with
  $ u = \( z_j - z_l \) \/ 2 \, #h(2em) N_J \( u \) gt.eq epsilon \/ 2 \, #h(2em) N_J \( P_H u \) < delta . $
  Also $N_J \( x plus.minus u \) lt.eq 1$ by convexity. Approximate $\( I - P_H \) u$ by a finitely supported vector $y$ vanishing on $H$ so that $N_J \( y - u \) < 2 delta$. This is possible by first using density and then applying the bounded operator $I - P_H$; no contractivity is assumed. For small enough $delta$ we have
  $ N_J \( y \) gt.eq zeta \, #h(2em) N_J \( x' plus.minus y \) lt.eq 1 + 3 delta lt.eq 2 . $
  Now (9.10) gives
  $ 1 + 3 delta gt.eq N_J \( x' \) + 2 gamma \( 2 \, epsilon \/ 16 \) gt.eq N_J \( x \) - delta + 2 gamma \( 2 \, epsilon \/ 16 \) . $
  Let $delta arrow.b 0$. For example, $eta \( epsilon \) = min { gamma \( 2 \, epsilon \/ 16 \) \, 1 \/ 2 }$ has the required property. This choice records positivity, not a numerical power law in $epsilon$.
  In upper-one normalization use the fixed separation $2 \/ D$ and apply Proposition 14 with $rho = 1 - eta \( 2 \/ D \)$. This proves (9.11). ◻
]

=== 9.4 An additive cubic loss for the fixed-zero-root norm <an-additive-cubic-loss-for-the-fixed-zero-root-norm>

On the same joined tree, now require $x_rho = 0$ and define

$ N_0 \( x \) = p_rho \( x \) = q_rho \( x \) = max {#scale(x: 180%, y: 180%)[\(] sum_h p_(r_h) \( x \)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) \, #scale(x: 180%, y: 180%)[\(] sum_h q_(r_h) \( x \)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2)} \, $

where $r_h$ is the root of the $h$th component. Denote its completion by $X_0$. The root coordinate is fixed at zero and the cost is the common root value. On the root-zero subspace the preceding sum norm is $2 N_0$; keeping the actual normalization is essential for the constants below. The same ancestral projections preserve this subspace and are contractive for $N_0$; finitely supported tails are dense here as well.

The deterministic upper-array estimate for $X_0$ is #cite(label("RecursivePotentials")) Theorem 2.1, equation (2.4):

#[#set math.equation(numbering: n => "(9.12)")
 $ frac(N_0 \( x + y \) + N_0 \( x - y \), 2) gt.eq N_0 \( x \) + frac(N_0 \( y \)^3, 8 \( 2 N_0 \( x \) + N_0 \( y \) \)^2) \, $ <met:f:zero-input>]

for every finite ancestor-closed head containing $rho$, every $x$ supported on it, and every nonzero completed tail $y$ vanishing there. Finite support is required of $x$, but not of $y$.

#thm([Proposition 9.4.])[
  #emph[If the depth-$k$ countably branching diamond admits an embedding into $X_0$ with distortion at most $D gt.eq 1$, then 
#[#set math.equation(numbering: n => "(9.13)")
 $ k lt.eq 4608 D^3 \( 1 - D^(- 1) \) . $ <met:f:zero-depth>]

]
] <met:f:zero>

#proof[
  Normalize to lower constant $A = 1 \/ D$ and upper constant one. For each level $i$, let $L_i$ be the supremum of the $N_0$-norms of all its historical edge slopes. Thus $A lt.eq L_i lt.eq 1$. Fix any parent slope $x$ at level $i < k$. Its child slopes satisfy $N_0 \( y_j \) \, N_0 \( macron(y)_j \) lt.eq L_(i + 1)$ and $N_0 \( y_j - y_l \) gt.eq 2 A$ for $j eq.not l$. For such a pair put $z = \( y_j - y_l \) \/ 2$. Then
  #[#set math.equation(numbering: n => "(9.14)")
   $ A lt.eq N_0 \( z \) lt.eq 1 \, #h(2em) N_0 \( x plus.minus z \) lt.eq L_(i + 1) \, $ <met:f:zero-pair>]
  because $x + z = \( y_j + macron(y)_l \) \/ 2$ and $x - z = \( y_l + macron(y)_j \) \/ 2$.
  Fix the errors before selecting the finite head and the pair:
  $ c_0 = A^3 / 2304 \, #h(2em) eta = c_0 / 6 . $
  Since $0 < A lt.eq 1$, we have $eta lt.eq A \/ 2$ and $eta lt.eq 1$. Choose a finitely supported $x'$ with $N_0 \( x - x' \) lt.eq eta$, and then a finite ancestor-closed head $H$ containing its support and $rho$. The projected child slopes $P_H y_j$ form a bounded subset of a finite-dimensional space. Choose $j eq.not l$ so that their half-difference $z$ satisfies $N_0 \( P_H z \) lt.eq eta$, and put $y = z - P_H z$. Then
  $ A \/ 2 lt.eq N_0 \( y \) lt.eq 1 + eta \, #h(2em) N_0 \( x' \) lt.eq 1 + eta . $
  In particular $y eq.not 0$, so (9.12) applies to $x' \, y$. Its gain is at least
  $ frac(\( A \/ 2 \)^3, 8 thin \[ 3 \( 1 + eta \) \]^2) gt.eq frac(\( A \/ 2 \)^3, 8 dot.op 6^2) = A^3 / 2304 = c_0 . $
  For both signs, $N_0 \( x plus.minus z \) gt.eq N_0 \( x' plus.minus y \) - 2 eta$, and $N_0 \( x' \) gt.eq N_0 \( x \) - eta$. Consequently
  $ L_(i + 1) & gt.eq frac(N_0 \( x + z \) + N_0 \( x - z \), 2)\
 & gt.eq N_0 \( x \) + c_0 - 3 eta = N_0 \( x \) + c_0 / 2 . $
  The parent edge was arbitrary. Taking the supremum over all parent edges gives $L_i lt.eq L_(i + 1) - c_0 \/ 2$, without requiring that a supremum be attained. Iteration yields
  $ A lt.eq L_0 lt.eq L_k - frac(k c_0, 2) lt.eq 1 - frac(k A^3, 4608) \, $
  which is (9.13). ◻
]

The bounds for $X_(upright(v))$ distinguish an additive power budget from a contraction chosen at a fixed separation. For the Euclidean joined-tree models, (9.11) records the positivity obtained by probabilistic propagation, while (9.13) retains the explicit approximation errors in a deterministic cubic-gain argument. Each conclusion rules out a distortion bound independent of the diamond depth, in its stated norm.

== 10 Alternative midpoint estimates for the segment forest <met:forest-variants>

The joint quadratic estimate gives the strongest forest bound in this paper. The following inputs come from different intrinsic arguments and illustrate the transfer rules of Section 7. They control radial deficit, parameterized test gains, or tails selected by sequential compactness and a common primal norming test.

=== 10.1 Radial deficit <radial-deficit>

#thm([Corollary 10.1.])[
  (The atomic forest bound).  #emph[For the segment forest space $X$, every map satisfying (2.1) has $D^2 gt.eq 1 + k \/ 16$.]
] <met:atomic-distortion>

#proof[
  For the forest atomic estimate, the constant $C_(*) = sqrt(2) + sqrt(6) < 4$ in the companion’s arbitrary-displacement radial estimate #cite(label("SegmentLenses")) Proposition 12.1 gives (7.1). In particular,
  $ epsilon^2 \/ 64 lt.eq R \( R - parallel x parallel \) lt.eq R^2 - parallel x parallel^2 \, #h(2em) D^2 gt.eq 1 + k \/ 16 . $
  This radial input gives a separate proof from the joint quadratic estimate. ◻
]

Keeping the exact constant in the same calculation also gives $k lt.eq C_(*)^2 D \( D - 1 \)$. Different atomic derivations with their own radial constant $C$ give (7.3) with that constant; replacing one proof’s $C$ by another proof’s value would discard its quantitative content.

=== 10.2 Parameterized clipping tests <parameterized-clipping-tests>

Apply Proposition 13 with $a = 1 \/ 2$ and $b = 3$, as in the clipping input of #cite(label("SegmentLenses")) Section 10.1, Equation (10.9). Take $lambda = 1 \/ \( 6 D \)$; $Q - 1 lt.eq 3 lambda^2 \/ 2$ gives $Delta gt.eq 1 \/ \( 24 D \)$. Thus the full parameterized consequence is

#[#set math.equation(numbering: n => "(10.1)")
 $ 1 + frac(k, 24 D) lt.eq D . $ <met:parametric-twentyfour>]

For an optimized input $max_plus.minus parallel p plus.minus y parallel gt.eq sqrt(parallel p parallel^2 + a parallel y parallel^2)$, the same limiting selection gives a child supremum at least $sqrt(parallel x parallel^2 + a)$. Since $sqrt(r^2 + a) - r$ decreases with $r > 0$, some actual child has norm at least $parallel x parallel + g \/ 2$, where $g = sqrt(D^2 + a) - D > 0$. With $a = 1 \/ 12$, as in #cite(label("SegmentLenses")) Proposition 10.4 and Equation (10.10), this gives $1 + k g \/ 2 lt.eq D$. For this value of $a$, one may make the finite selection before passing to a limit by taking approximation error $eta = g \/ 8$: the norm comparison costs at most $4 eta$, leaving $g \/ 2$. Both descriptions retain the same actual-child loss.

Likewise, a radial input with constant $C$ gives a child supremum at least $parallel x parallel + 1 \/ \( C^2 D \)$. Selecting an actual child above the smaller threshold $parallel x parallel + 1 \/ \( 2 C^2 D \)$ gives $1 + k \/ \( 2 C^2 D \) < D$ for $k gt.eq 1$. The forest estimate in #cite(label("SegmentLenses")) Proposition 20.1 permits $C = 8$, giving the distinct supremal gain $1 \/ \( 64 D \)$ and actual gain greater than $1 \/ \( 128 D \)$.

=== 10.3 An additive gain for a fixed distortion bound <met:bridge:fixed-bound-section>

The two-test estimate for an infinite bounded separated family in the segment forest has the following form #cite(label("SegmentLenses")) Proposition 11.3: for each $D gt.eq 1$ there is $c_D > 0$ such that

#[#set math.equation(numbering: n => "(10.2)")
 $ 1 lt.eq parallel x parallel lt.eq D \, #h(2em) parallel z_i parallel lt.eq 2 D \, #h(2em) parallel z_i - z_j parallel gt.eq 1 quad \( i eq.not j \)\
arrow.r.double quad max_plus.minus parallel x plus.minus z_i parallel > parallel x parallel + c_D quad upright("for some ") i . $ <met:bridge:fixed-bound-input>]

For fixed $D$, the same $c_D$ works for every center and every family satisfying the displayed assumptions. The selected deviation need not annihilate the head.

#thm([Proposition 10.2.])[
  #emph[If a target satisfies (10.2), every noncontracting embedding of $cal(D)_k$ with upper factor $D$ obeys 
$ 1 + k c_D lt.eq D . $

]
] <met:bridge:fixed-bound>

#proof[
  For every parent slope $x$ and its deviations $z_i$ from (2.2), one has $1 lt.eq parallel x parallel lt.eq D$, $parallel z_i parallel lt.eq D lt.eq 2 D$, and $parallel z_i - z_j parallel gt.eq 2 gt.eq 1$. The input therefore selects an actual child slope with norm greater than $parallel x parallel + c_D$. Starting at the original slope and making this choice through $k$ replacements gives a final slope greater than $1 + k c_D$ when $k gt.eq 1$, and every final slope is at most $D$. For $k = 0$ the conclusion is $1 lt.eq D$. ◻
]

=== 10.4 Coordinate-null and sequential estimates <coordinate-null-and-sequential-estimates>

Use the upper-one normalization with $alpha = 1 \/ D$. At a parent with child bound $0 < R lt.eq 1$, its deviations satisfy $parallel x plus.minus z_i parallel lt.eq R$ and $parallel z_i - z_j parallel gt.eq 2 alpha$ for $i eq.not j$. On the countable forest coordinate set they admit a subsequence whose coordinates all converge, by successive extraction and a diagonal choice. Pairing successive terms gives $w_j = \( z_(2 j) - z_(2 j - 1) \) \/ 2$ with coordinates tending to zero, $parallel w_j parallel gt.eq alpha$, and $parallel x plus.minus w_j parallel lt.eq R$. If the intrinsic estimate gives

$ limsup_j parallel w_j parallel lt.eq C sqrt(R \( R - parallel x parallel \)) \, $

then

$ parallel x parallel lt.eq R (1 - frac(alpha^2, C^2 R^2)) lt.eq R \( 1 - alpha^2 \/ C^2 \) \, #h(2em) 0 < R lt.eq 1 . $

The forest coordinate-null estimate #cite(label("SegmentLenses")) Corollary 23.5 has $C = sqrt(2) + 2 sqrt(6) < 7$. Using $C = 7$ retains the $R$-dependent intermediate inequality and gives the backward factor $1 - 1 \/ \( 49 D^2 \)$. Coordinatewise convergence here is used only with the stated intrinsic estimate; it is not silently replaced by weak convergence.

The qualitative sequential cancellation theorem for the forest #cite(label("SegmentLenses")) Lemma 23.2 satisfies the varying-head hypothesis of Lemma 17. Hence it also gives, for each fixed $D$, a uniform unit-lens gap and a backward bound $D^(- 1) lt.eq rho^k$. This application uses only sequential vanishing, without a quantitative power law.

=== 10.5 Choosing the norming test before the head and the pair <met:bridge:normer-section>

For the segment forest, the weighted endpoint estimate in the companion #cite(label("SegmentLenses")) Theorem 16.1 and equation (16.2) gives the following particular input. Let $f$ be a finitely supported primal vector with $rho \( f \) lt.eq 1$, let $H$ be finite and ancestral with $"supp" f subset H$, and suppose $z_(+) \, z_(-) in B_X$. Put

$ x = \( z_(+) + z_(-) \) \/ 2 \, #h(2em) d = 1 - x \( f \) \, #h(2em) a = parallel Q_H x parallel . $

Then $d gt.eq 0$ and

#[#set math.equation(numbering: n => "(10.3)")
 $ parallel Q_H z_plus.minus parallel lt.eq 2 sqrt(\( a + sqrt(2 d) \)^2 + 4 d) + 2 sqrt(d) . $ <met:bridge:weighted-input>]

The same test $f$ is used for both endpoint laws; their individual deficits are nonnegative and at most $2 d$.

#thm([Proposition 10.3.])[
  #emph[For every $epsilon > 0$ there is $0 < rho < 1$ such that an infinite $epsilon$-separated symmetric unit lens in the segment forest space has center norm at most $rho$.]
] <met:bridge:normer-first>

#proof[
  Otherwise choose centers $x_n in B_X$ with $parallel x_n parallel arrow.r 1$ and infinite $epsilon$-separated families $\( v_(n \, i) \)_i$ satisfying $parallel x_n plus.minus v_(n \, i) parallel lt.eq 1$. First choose a finitely supported primal near-normer $f_n$ with
  $ rho \( f_n \) lt.eq 1 \, #h(2em) x_n \( f_n \) > parallel x_n parallel - 1 \/ n . $
  Next choose a finite ancestral $H_n$ containing $"supp" f_n$ and satisfying $parallel Q_(H_n) x_n parallel < 1 \/ n$. This is possible by density of finite coordinate vectors in $X$ and contractivity of $Q_(H_n)$: include the support of an approximation to $x_n$ before taking its finite ancestral closure.
  Only now choose two members of the $n$th lens whose projections onto $H_n$ differ by less than $1 \/ n$, and set $u_n = \( v_(n \, i) - v_(n \, j) \) \/ 2$. Finite-dimensional total boundedness justifies this choice, and crossed convex averages give
  #[#set math.equation(numbering: n => "(10.4)")
   $ parallel x_n plus.minus u_n parallel lt.eq 1 \, #h(2em) parallel P_(H_n) u_n parallel < frac(1, 2 n) \, #h(2em) parallel Q_(H_n) u_n parallel gt.eq epsilon / 2 - frac(1, 2 n) . $ <met:bridge:normer-selection>]
  Apply (10.3) with the already chosen $f_n \, H_n$ and with $z_plus.minus = x_n plus.minus u_n$. Here $d_n = 1 - x_n \( f_n \) arrow.r 0$ and $a_n = parallel Q_(H_n) x_n parallel arrow.r 0$. Consequently both endpoint tails tend to zero. Their half-difference $Q_(H_n) u_n$ also tends to zero, contradicting (10.4). No head has been chosen from the selected pair; the order is near-normer, head, and then pair. ◻
]

For the original upper-one graph normalization, retain the separation parameter $epsilon = 1 \/ D$. The normalized sibling deviations have separation at least $2 \/ \( D L \) gt.eq 1 \/ D$ when the child bound is $0 < L lt.eq 1$. The proposition gives the parent bound $rho L$. Backward iteration therefore gives $1 \/ D lt.eq rho^k$, with one fixed $rho$ for this $D$.


#bibliography("refs.bib", style: "ieee", title: [References])
