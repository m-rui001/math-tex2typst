#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Midpoint convexity from two recursive potentials]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <rec:intro>

A recursively defined norm can be easy to evaluate at one node while its estimates deteriorate as the tree grows. We study a recursion in which two nonnegative fields encode a vector as their difference. Each field at a node dominates the norm of its values at the children, and the recursion chooses the least feasible pair. For Euclidean child aggregation, one of the two inequalities is consequently tight at every node. We show that this local equality controls midpoint perturbations uniformly in the height and branching of the tree.

For an infinite-dimensional real Banach space $X$ with norm $N$, let $"cof" \( X \)$ denote its closed finite-codimensional linear subspaces. The averaged asymptotic midpoint modulus is

#[#set math.equation(numbering: n => "(1.1)")
 $ hat(delta)_N \( t \) = inf_(N \( x \) = 1) sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) gt.eq 1) (frac(N \( x + t y \) + N \( x - t y \), 2) - 1) \, #h(2em) t > 0 . $ <intro:modulus>]

It measures the mean increase in the endpoint norms when a perturbation avoids a suitable finite-dimensional part of the space. The usual asymptotic midpoint modulus $m_N \( t \)$ uses the maximum of the two endpoint norms, with unit directions, in the same infimum and supremum. The norm is #emph[asymptotically midpoint uniformly convex], abbreviated AMUC, if $m_N \( t \) > 0$ for every $t > 0$. This condition was introduced by Dilworth, Kutzarova, Randrianarivony, Revalski, and Zhivkov #cite(label("DKRRZ2016")) Definition 2.2. The one-sided modulus is

#[#set math.equation(numbering: n => "(1.2)")
 $ overline(delta)_N \( t \) = inf_(N \( x \) = 1) sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) = 1) #scale(x: 120%, y: 120%)[\(] N \( x + t y \) - 1 #scale(x: 120%, y: 120%)[\)] . $ <intro:auc>]

A norm is asymptotically uniformly convex, abbreviated AUC, if this last quantity is positive for every $t > 0$.

The averaged and maximum midpoint moduli have the same positivity property, with

#[#set math.equation(numbering: n => "(1.3)")
 $ 1 / 2 m_N \( t \) lt.eq hat(delta)_N \( t \) lt.eq m_N \( t \) . $ <intro:comparisons>]

Indeed, average is at most maximum. For the converse, at a fixed unit center intersect a witnessing subspace with the kernel of a norming functional. Both endpoint norms are then at least one, and their average excess is at least half the maximum excess. Taking the infima and suprema proves (1.3). For a fixed direction, the mean of the two endpoint norms is an even convex function of the radius. It is therefore nondecreasing on the positive half-line. Thus the inner infimum in (1.1) can equally use $N \( y \) = 1$, and $hat(delta)_N$ is nondecreasing. In particular, positivity for $0 < t < 1$ implies positivity at every radius.

The distinction from AUC renormability is already established. Dilworth and coauthors separated the two norm properties on $ell_2$ and posed the corresponding renorming question #cite(label("DKRRZ2016")) Theorem 2.4 and Section 5. Baudier answered the general question negatively by using the Kadets–Werner modification of the Bourgain–Rosenthal construction #cite(label("Baudier2026")) Theorem 1 and Corollary 1; the underlying construction is due to Kadets and Werner #cite(label("KW2004")) Theorem 2.5. That example is nonreflexive #cite(label("KW2004")) Corollary 2.6. Our focus is the quantitative geometry of norms given by an explicit tree recursion. The joining-root versions are reflexive and still admit no equivalent AUC norm.

Tree norms have a substantial history in Banach-space theory. James’s construction uses sums over disjoint segments of a binary tree #cite(label("James1974")) p. 739; Girardi proved AUC for its canonical predual and full dual #cite(label("Girardi2001")) Theorems 3 and 5. A closer comparison is the positive tree cone recalled by Banakh, following Ghoussoub, Maurey, and Schachermayer #cite(label("Banakh2000")) Section 2.I, pp. 28–29: a nonnegative field at a node dominates the Euclidean norm of its children. That construction uses interpolation after taking a symmetric convex hull. Here the vector is the difference of two least such fields, and the norm is an explicit cost at the root. The defining norm and its completion are proved directly below.

===== 1.1 Results and proof structure. <results-and-proof-structure.>

Section 2 defines three Euclidean constructions, proves their completion and finite-coordinate projection properties, and states Theorem 1. The first norm takes the sum of the root fields on the infinite tree. The second joins finite-height components at a zero coordinate and takes the common root field; it satisfies a homogeneous cubic inequality. The third keeps a free coordinate at that joining root and takes the sum. Both root-sum norms have averaged modulus at least $t^3 \/ 128$ for $0 < t < 1$; the joined space is reflexive. Distinguishing the root normalizations is essential to the constants.

The shortest quantitative argument is in Section 3. Averaging the fields at $x + z$ and $x - z$ increases both fields of $x$ by the same nonnegative amount $d_s$ at node $s$. Writing $P_s \, Q_s$ for the fields of $x$, the expression

$ \[ d_s \( 2 P_s + d_s \) \( 2 Q_s + d_s \) \]^(2 \/ 3) $

dominates the sum of its values at the children, by Hölder’s inequality and the tight child inequality. Iterating to the first nodes outside a finite initial set containing the support of the center controls the complete tail by the defect at the root. No factor is multiplied once per level. Section 4 supplies the bounded-path argument that excludes AUC renormings.

Section 5 gives a second way to propagate the same root-sum defect. A finite stopping rule separates paths according to the smaller field, a product of field ratios, and the local increase. An absorbing martingale controls the small-product event. The proof is uniform over the finite head and retains the order of its parameter limits. Section 6 gives a different argument on the joined tree: a logarithmic transform of two bounded supermartingales bounds a product of ratios and proves a gap for infinite separated midpoint families. The stopping proof uses a predictable martingale transform, a classical tool studied by Burkholder #cite(label("Burkholder1966")). In the logarithmic proof, the selected supermartingale increments split into predictable drift and centered martingale differences. The exact finite square identities and stopping estimates used here are proved in place. These arguments explain distinct mechanisms for uniformity, even though the cubic bound already proves positive midpoint modulus.

Finally, Section 7 replaces Euclidean aggregation inside a height-$h$ component by $ell_(1 + 1 \/ h)$ aggregation. This exponent is constant inside each component. Two propagation arguments control different energies: normalized iteration yields a sixth-power estimate, while accumulated layer energy yields a cubic estimate with coefficient $\( 6 e \)^(- 3)$. Their complete proofs include the outer $ell_2$ sum and the precise finite-head and weakly null tail statements. The cubic estimate also gives a cubic lower bound for the averaged midpoint modulus of this variable-exponent space.

== 2 The fields, the roots, and the completed spaces <rec:norms>

Our first objective is to define the norms to which the estimates apply. All scalars are real. A rooted tree has a distinguished root, and every node has finitely many predecessors. Its set of children is denoted by $"ch" \( s \)$. We allow countably many children. For a finitely supported vector $v = \( v_s \)$, set the fields to zero below its support and compute upwards:

#[#set math.equation(numbering: n => "(2.1)")
 $ A_s \( v \) & = #scale(x: 180%, y: 180%)[\(] sum_(c in "ch" \( s \)) P_c \( v \)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) \, & B_s \( v \) & = #scale(x: 180%, y: 180%)[\(] sum_(c in "ch" \( s \)) Q_c \( v \)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) \,\
P_s \( v \) & = max { A_s \( v \) \, v_s + B_s \( v \) } \, & Q_s \( v \) & = max { B_s \( v \) \, - v_s + A_s \( v \) } . $ <rec:definition>]

Only the finite predecessor closure of the support has nonzero fields. Empty sums are zero. Thus this instruction is independent of the depth at which the upward computation starts. At every node,

#[#set math.equation(numbering: n => "(2.2)")
 $ P_s \( v \) - Q_s \( v \) = v_s \, #h(2em) P_s \( v \) gt.eq A_s \( v \) \, #h(2em) Q_s \( v \) gt.eq B_s \( v \) \, $ <rec:field-properties>]

and at least one of the last two inequalities is an equality. Indeed, subtracting $v_s$ from the formula for $P_s$ gives the formula for $Q_s$. If the maximum for $P_s$ selects its first entry, its inequality is tight; otherwise the inequality for $Q_s$ is tight. Induction also shows that this is the coordinatewise least nonnegative pair with the prescribed difference and child lower bounds.

=== 2.1 Three Euclidean constructions <three-euclidean-constructions>

The local rule is the same in the following spaces, but the underlying trees and the values taken at the root differ.

+ On $T = bb(N)^(< omega)$, including the root $o = diameter$, put
  $ N_Sigma \( v \) = P_o \( v \) + Q_o \( v \) \, #h(2em) v in c_00 \( T \) \, $
  and let $X_Sigma$ be the completion.
+ Let $T_n = union.big_(j = 0)^n bb(N)^j$, $n gt.eq 1$, be disjoint copies with roots $r_n$. Add a root $rho$ whose children are the $r_n$, obtaining a tree $cal(J)$. For vectors on $cal(J) \\ { rho }$ set $v_rho = 0$. Then $P_rho \( v \) = Q_rho \( v \)$; define
  $ N_0 \( v \) = P_rho \( v \) = Q_rho \( v \) \, $
  and let $X_0$ be the completion.
+ On the same tree $cal(J)$, now allowing the coordinate $v_rho$ to vary, put
  $ N_J \( v \) = P_rho \( v \) + Q_rho \( v \) \, #h(2em) v in c_00 \( cal(J) \) \, $
  and let $X_J$ be the completion.

In particular, $N_J \( v \) = 2 N_0 \( v \)$ on the subspace where $v_rho = 0$. Allowing that coordinate to vary produces an additional one-dimensional part; it does not change the local recursion.

We call a finite root-containing set #emph[initial] if it contains all predecessors of its nodes, write $Pi_H$ for coordinate restriction, and put $F_H = ker Pi_H$ in the corresponding completion. The next theorem gives the principal quantitative conclusions. The definition of $hat(delta)$ is (1.1).

#thm([Theorem 2.1.])[
  #emph[ For $N = N_Sigma$ on $X_Sigma$, or $N = N_J$ on $X_J$, one has 
#[#set math.equation(numbering: n => "(2.3)")
 $ hat(delta)_N \( t \) gt.eq t^3 \/ 128 #h(2em) \( 0 < t < 1 \) . $ <rec:sum-modulus>]

 For $X_0$, a finite initial set $H$, a vector $x$ supported in $H$, and $z in F_H \\ { 0 }$, one has 
#[#set math.equation(numbering: n => "(2.4)")
 $ frac(N_0 \( x + z \) + N_0 \( x - z \), 2) gt.eq N_0 \( x \) + frac(N_0 \( z \)^3, 8 \( 2 N_0 \( x \) + N_0 \( z \) \)^2) . $ <rec:equal-estimate>]

 Each of $X_Sigma \, X_0 \, X_J$ admits no equivalent AUC norm.]
] <rec:main>

The energy proof in Section 3 gives the first two assertions, uniformly in the height and branching of $H$. Section 4 proves the last assertion by following bounded paths whose next increments are weakly null. The two later probabilistic arguments obtain uniform separation by controlling the propagation along random paths.

#thm([Proposition 2.2.])[
  #emph[These formulas define infinite-dimensional Banach spaces after completion. Coordinate evaluations and the fields extend continuously. If $H$ is a finite set containing the root and all predecessors of its nodes, then coordinate restriction $Pi_H$ is a contractive projection. Its kernel $F_H$ has finite codimension, and finitely supported elements of $F_H$ are dense in $F_H$. Both $X_0$ and $X_J$ are reflexive.]
] <rec:completion>

#proof[
  The fields are positively homogeneous and subadditive. To verify subadditivity, induct upwards: the child Euclidean norms are monotone on nonnegative arrays and satisfy the triangle inequality. Each entry in either maximum in (2.1) is therefore subadditive, and a maximum of two subadditive functions is subadditive. Negation interchanges $P_s$ and $Q_s$. This proves symmetry and the triangle inequality for each proposed norm. Moreover,
  $ \| v_s \| lt.eq max { P_s \( v \) \, Q_s \( v \) } lt.eq N \( v \) \, #h(2em) N in { N_Sigma \, N_0 \, N_J } \, $
  by following the child inequalities to the corresponding root. This proves definiteness and coordinate continuity. The coordinate vectors are linearly independent, so the spaces are infinite dimensional.
  The fields of $Pi_H v$ vanish outside $H$. Inside $H$ its coordinates are unchanged, and each maximum is nondecreasing in the child fields; induction gives $P_s \( Pi_H v \) lt.eq P_s \( v \)$ and the same for $Q_s$. Thus $Pi_H$ is contractive. Ignore the fixed coordinate $rho$ when $N = N_0$. It extends to the completion and has finite-dimensional range. Applying $I - Pi_H$ to finite approximations proves tail density. Choose an increasing sequence $\( H_k \)$ of finite initial sets covering the tree. If a finite vector $v$ is supported in $H_k$, then
  $ N \( x - Pi_(H_k) x \) lt.eq N \( x - v \) + N \( Pi_(H_k) \( v - x \) \) lt.eq 2 N \( x - v \) . $
  Density therefore gives $Pi_(H_k) x arrow.r x$ for every completed vector $x$. In particular, the coordinates separate points. A completed vector whose coordinates vanish outside a finite initial set $H$ equals $Pi_H x$, so support in $H$ has its usual coordinate meaning. Subadditivity and sign exchange give
  $ \| P_s \( v \) - P_s \( w \) \| lt.eq N \( v - w \) \, #h(2em) \| Q_s \( v \) - Q_s \( w \) \| lt.eq N \( v - w \) . $
  The fields therefore extend continuously, and the root norm formulas persist on the completions.
  We prove reflexivity by describing the finite-height components. Set $M_n \( v \) = max { P_(r_n) \( v \) \, Q_(r_n) \( v \) }$ on $c_00 \( T_n \)$, and let $E_n$ be its completion under this norm. Writing $m_s = max { P_s \, Q_s }$ gives
  $ m_s lt.eq \| v_s \| + #scale(x: 180%, y: 180%)[\(] sum_(c in "ch" \( s \)) m_c^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $
  The Euclidean norm of the $m_s$ on one level is at most the Euclidean norm of the coordinates on that level plus the corresponding norm of $m_c$ on the next level. Iteration and Cauchy–Schwarz yield $M_n \( v \) lt.eq sqrt(n + 1) thin parallel v parallel_2$. Conversely the $ell_2$ norm of either field on any level is at most its root value. Since $v = P - Q$,
  #[#set math.equation(numbering: n => "(2.5)")
   $ frac(parallel v parallel_2, 2 sqrt(n + 1)) lt.eq M_n \( v \) lt.eq sqrt(n + 1) thin parallel v parallel_2 . $ <rec:block-equivalence>]
  Hence $E_n$ is $ell_2 \( T_n \)$ with an equivalent norm, and is reflexive. The recursion extends to its vectors by continuity or directly by the finitely many levels.
  For $v$ with zero joining coordinate, put $L \( v \) = \( sum_n M_n \( v \|_(T_n) \)^2 \)^(1 \/ 2)$. The two child arrays at $rho$ give
  #[#set math.equation(numbering: n => "(2.6)")
   $ N_0 \( v \) lt.eq L \( v \) lt.eq sqrt(2) thin N_0 \( v \) . $ <rec:joined-equivalence>]
  For a free root coordinate $a = v_rho$, with the remaining coordinates written as $w$, let $A = \( sum_n P_(r_n) \( w \)^2 \)^(1 \/ 2)$ and $B = \( sum_n Q_(r_n) \( w \)^2 \)^(1 \/ 2)$. Then
  #[#set math.equation(numbering: n => "(2.7)")
   $ N_J \( v \) = max { 2 A - a \, 2 B + a } \, #h(2em) max { \| a \| \, L \( w \) } lt.eq N_J \( v \) lt.eq \| a \| + 2 L \( w \) . $ <rec:free-root-equivalence>]
  For the lower bound, $N_J gt.eq \| a \|$ and $N_J gt.eq A + B gt.eq L \( w \)$. These comparisons identify $X_0$ with the $ell_2$ sum of the $E_n$ under an equivalent norm, and $X_J$ with that sum plus $bb(R)$. The Hilbert comparisons for individual components need not be uniform in $n$: we take the outer sum in the norms $M_n$ themselves.
  For completeness, an $ell_2$ sum of Banach spaces is complete: a Cauchy sequence converges in each component, and its Cauchy bounds pass to all finite component sums and then to their supremum. Its dual is the $ell_2$ sum of the component duals. The upper norm bound is Cauchy–Schwarz; the lower bound follows by testing a functional on finitely many almost norming component vectors with scalar coefficients proportional to their dual norms. Finite component vectors are dense. Applying this dual identification twice proves reflexivity when each component is reflexive. Equivalent norms preserve reflexivity. This proves the assertion for both joined spaces. ◻
]

===== 2.1.1 Component root sums. <component-root-sums.>

The alternative norm $P_(r_n) + Q_(r_n)$ lies between $M_n$ and $2 M_n$, so it gives the same component completion. Its behavior on individual levels can also be read directly from the recursion. For a finite vector on $T_n$, put $s_a = P_a + Q_a$. Then

#[#set math.equation(numbering: n => "(2.8)")
 $ max { \| v_a \| \, parallel \( s_c \)_(c in "ch" \( a \)) parallel_2 } lt.eq s_a lt.eq \| v_a \| + 2 parallel \( s_c \)_(c in "ch" \( a \)) parallel_2 . $ <rec:sum-level-bounds>]

Indeed, $s_a gt.eq A_a + B_a gt.eq parallel \( s_c \)_c parallel_2$ and $s_a = max { 2 A_a - v_a \, 2 B_a + v_a }$. Iteration bounds its root value above by $sum_(d = 0)^n 2^d parallel v \|_(upright("level ") d) parallel_2$, while each level norm of $v$ is at most that root value. These provide direct Hilbert comparisons for the component root-sum convention.

== 3 From root defect to boundary energy <rec:energy>

To prove Theorem 1, we will compare the fields of the center with their averages at the two endpoints. The following lemma is the required calculation. It bounds the squared increases at a chosen boundary by a quantity measured only at the root.

#thm([Lemma 3.1.])[
  (Two-field energy).  #emph[Let $J$ be a subset of the leaves of a finite tree with root $o$. Suppose that $P \, Q \, P' \, Q'$ are nonnegative fields, each satisfying 
$ A_s^2 gt.eq sum_(c in "ch" \( s \)) A_c^2 $

 at every internal node, for each $A in { P \, Q \, P' \, Q' }$. Suppose also that $P' - P = Q' - Q = d gt.eq 0$, and that at each internal node at least one of the inequalities for $P \, Q$ is an equality. If $P_b = Q_b = 0$ for $b in J$, then 
$ sum_(b in J) d_b^2 lt.eq #scale(x: 120%, y: 120%)[\[] d_o \( 2 P_o + d_o \) \( 2 Q_o + d_o \) #scale(x: 120%, y: 120%)[\]]^(2 \/ 3) . $

]
] <rec:two-field>

#proof[
  Put $E_s = \[ d_s \( 2 P_s + d_s \) \( 2 Q_s + d_s \) \]^(2 \/ 3)$. We show that $E_s gt.eq sum_c E_c$. Suppose first that $P_s^2 = sum_c P_c^2$, and put
  $ U_s = \( P'_s \)^2 - P_s^2 = d_s \( 2 P_s + d_s \) \, #h(2em) V_s = \( Q'_s + Q_s \)^2 = \( 2 Q_s + d_s \)^2 . $
  Use the same definitions at the children. The upper inequality for $P'$ and the equality for $P$ give $U_s gt.eq sum_c U_c$. The triangle inequality in $ell_2$ applied to the child fields $Q' \, Q$ gives $V_s gt.eq sum_c V_c$. Consequently Hölder’s inequality yields
  $ sum_c E_c = sum_c U_c^(2 \/ 3) V_c^(1 \/ 3) lt.eq (sum_c U_c)^(2 \/ 3) (sum_c V_c)^(1 \/ 3) lt.eq U_s^(2 \/ 3) V_s^(1 \/ 3) = E_s . $
  If the tight field at $s$ is $Q$, interchange $P \, Q$ in this calculation. At a leaf in $J$, $E_b = d_b^2$. Iterating the inequality through the finite tree and discarding the nonnegative energies of the other leaves proves the assertion. ◻
]

#thm([Lemma 3.2.])[
  #emph[Let $N = N_Sigma$ or $N = N_J$. Suppose that $x$ is a finitely supported unit vector and that $z in F_H$, where $H$ is a finite initial set containing $"supp" x$. If 
$ d = 1 / 2 (frac(N \( x + z \) + N \( x - z \), 2) - 1) \, $

 then $d gt.eq 0$ and $N \( z \)^3 lt.eq 64 d \( 1 + d \)^2$.]
] <rec:root-sum-stability>

#proof[
  We use the fields from (2.1). For a finite head vector $x$ and a finite tail $z$ vanishing on an initial set $H$ containing $"supp" x$, set
  $ P_s = P_s \( x \) \, quad Q_s = Q_s \( x \) \, quad P'_s = 1 / 2 \( P_s \( x + z \) + P_s \( x - z \) \) \, quad Q'_s = 1 / 2 \( Q_s \( x + z \) + Q_s \( x - z \) \) . $
  The coordinate difference identity and convexity give the same nonnegative defect $d_s = P'_s - P_s = Q'_s - Q_s$. The averaged fields satisfy the upper inequalities by the $ell_2$ triangle inequality. At a first node $b$ outside $H$, the head fields vanish on its whole subtree, so
  $ d_b = 1 / 2 \( P_b \( z \) + Q_b \( z \) \) . $
  Only finitely many such values are nonzero. Apply Lemma 3 to the finite relevant part of $H$ and its first-exit boundary, retaining at each boundary node its already-computed full-subtree field values. Discard only subtrees where all four fields vanish. This gives the bound on $sum_b d_b^2$. Figure 1 shows the finite part through which the inequality is propagated.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.1768, 2.023), (0.1768, 2.377), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$o$]]], frame: "circle", fill: rgb("#ccccff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.6, 1.1), radius: 0.25, fill: rgb("#ccccff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  circle((1.3, 1.1), radius: 0.25, fill: rgb("#ccccff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.3, 0), radius: 0.25, fill: rgb("#ccccff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  content((-1.077, -0.1768), (-0.7232, 0.1768), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b_1$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((0.5232, -0.1768), (0.8768, 0.1768), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b_2$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((1.923, -0.1768), (2.277, 0.1768), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b_3$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((-3.077, -1.277), (-2.723, -0.9232), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b_4$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((-1.877, -1.277), (-1.523, -0.9232), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b_5$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  line((-0.2118, 2.054), (-1.388, 1.246), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.1962, 2.034), (1.104, 1.266), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.738, 0.8831), (-2.162, 0.2169), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.462, 0.8831), (-1.038, 0.2169), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.177, 0.8743), (0.8231, 0.2257), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.451, 0.8921), (1.949, 0.2079), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.423, -0.2257), (-2.777, -0.8743), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.177, -0.2257), (-1.823, -0.8743), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.9, -0.2571), (-0.9, -0.8071), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((0.7, -0.2571), (0.7, -0.8071), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((2.1, -0.2571), (2.1, -0.8071), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-2.9, -1.357), (-2.9, -1.907), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-1.7, -1.357), (-1.7, -1.907), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((3.05, 0.8), [#text(size: 9pt)[$E_s gt.eq sum_c E_c$#linebreak()$E_b=d_b^2$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: The shaded nodes form the finite initial set $H$. Each boundary node $b$ represents its entire descendant subtree: the head vector is zero there, while the tail fields $P_b \( z \) \, Q_b \( z \)$ have already been computed. The energy inequality propagates from these boundary values to the root. The omitted branches contribute zero in a finite-support calculation. ],
  ) <fig:boundary>
  We next convert this energy into a norm estimate for each of the two root conventions. On $H$ the coordinate of $z$ is zero, so $P_s \( z \) = Q_s \( z \)$ there. With $r_s = max { P_s \( z \) \, Q_s \( z \) }$ one has $r_s^2 lt.eq sum_c r_c^2$ on $H$ and $r_b lt.eq 2 d_b$ at its boundary. Thus $r_o lt.eq 2 \( sum_b d_b^2 \)^(1 \/ 2)$.
  #emph[The sum of the root fields.] First use either root-sum space $X_Sigma$ or $X_J$, and write $N = N_Sigma$ or $N = N_J$, respectively. Assume $N \( x \) = 1$ and put
  $ d = d_o = 1 / 2 (frac(N \( x + z \) + N \( x - z \), 2) - 1) . $
  Since $N \( z \) = 2 r_o$, the energy lemma gives
  $ N \( z \)^3 lt.eq 64 d \( 2 P_o + d \) \( 2 Q_o + d \) lt.eq 64 d \( 1 + d \)^2 . $
  The last inequality uses $P_o + Q_o = 1$. The field continuity and tail density from Proposition 2 extend this cubic inequality to every $z in F_H$, with the finite unit center $x$ fixed. This proves Lemma 4. If $N \( z \) gt.eq t$ with $0 < t < 1$, then $d gt.eq t^3 \/ 256$: for $d lt.eq 1$ use $\( 1 + d \)^2 lt.eq 4$, and for $d > 1$ the claim is immediate. Since the average gain is $2 d$, it is at least $t^3 \/ 128$.
  Fix either root-sum space $X in { X_Sigma \, X_J }$ with its norm $N$. For any unit center $x_0 in X$ and $epsilon > 0$, choose a finite unit center $x$ with $N \( x - x_0 \) < epsilon$, then choose a finite initial $H$ containing its support. For all $y in F_H$ with $N \( y \) gt.eq 1$, put $z = t y$ in the preceding estimate. Replacing $x$ by $x_0$ loses at most $epsilon$ in the average, uniformly in $y$. Thus the supremum over finite-codimensional subspaces at $x_0$ is at least $t^3 \/ 128 - epsilon$. Letting $epsilon arrow.b 0$ and taking the infimum over unit $x_0$ proves (2.3).
  #emph[The common root field.] Now use $X_0$ and write $N = N_0$, with $o = rho$ in the preceding calculation. By definition $N \( v \) = P_o \( v \) = Q_o \( v \)$. Put
  $ d = d_o = frac(N \( x + z \) + N \( x - z \), 2) - N \( x \) . $
  Now $N \( z \) = r_o$, and the same energy lemma yields
  $ N \( z \)^3 lt.eq 8 d \( 2 N \( x \) + d \)^2 . $
  The triangle inequality gives $d lt.eq N \( z \)$. For $z eq.not 0$ this proves the homogeneous estimate
  $ frac(N \( x + z \) + N \( x - z \), 2) gt.eq N \( x \) + frac(N \( z \)^3, 8 \( 2 N \( x \) + N \( z \) \)^2) . $
  The tail density from Section 2 and continuity extend this inequality to every nonzero completed tail, proving (2.4). ◻
]

The factors eight and sixty-four come from the conversion of boundary fields into the tail norm: the sum of the root fields introduces a factor two before cubing. Both estimates therefore depend on the same local energy inequality, while their root normalizations remain distinct.

#emph[Remark (reciprocal form).] In the finite-head calculation above, let $cal(B)$ denote the first-exit boundary, and retain the fields $P \, Q$ and their averaged increments $d$. For a node $s$ of that finite tree, put

$ B_s = (sum_(b in cal(B)\
s prec.curly.eq b) d_b^2)^(1 \/ 2) \, #h(2em) w_s^P = 2 P_s + d_s \, #h(2em) w_s^Q = 2 Q_s + d_s . $

Here $s prec.curly.eq b$ means that $s$ lies on the path from the root to $b$, including $s = b$. Both $w$ fields dominate their child Euclidean norms and equal $d_b$ at a boundary node, so $w_s^P \, w_s^Q gt.eq B_s$. Applying Lemma 3 to the descendant subtree rooted at $s$ gives $B_s^3 lt.eq d_s w_s^P w_s^Q$. Thus, whenever $B_s > 0$,

#[#set math.equation(numbering: n => "(3.1)")
 $ d_s gt.eq frac(B_s^3, w_s^P w_s^Q) . $ <rec:reciprocal-energy>]

The undivided inequality is an equality at every boundary node. This form expresses the same energy estimate through the accumulated boundary norm $B_s$.

== 4 Bounded paths exclude AUC renormings <rec:obstruction>

The midpoint gain controls two opposite perturbations together. To distinguish it from one-sided asymptotic convexity, we use positive path vectors that remain bounded as their paths grow. At each stage, the next coordinate can be chosen from a weakly null sequence of increments whose norms stay bounded away from zero.

#thm([Lemma 4.1.])[
  (Bounded trees).  #emph[Let $X$ be a Banach space. Suppose that for every $h gt.eq 1$ there are vectors $u_s^(\( h \))$, indexed by $s in bb(N)^(lt.eq h)$, such that $0 < m lt.eq parallel u_s^(\( h \)) parallel lt.eq M < oo$ uniformly. Suppose also that for $\| s \| < h$ the increments $d_(s \, k)^(\( h \)) = u_(s^frown k)^(\( h \)) - u_s^(\( h \))$ are weakly null as $k arrow.r oo$ and have norms at least $c > 0$, uniformly in $h \, s \, k$. If $N$ is a norm and $0 < alpha lt.eq beta < oo$ satisfy $alpha parallel dot.op parallel lt.eq N lt.eq beta parallel dot.op parallel$, then 
$ overline(delta)_N (frac(alpha c, 2 beta M)) = 0 . $

 The conclusion also holds if one infinite tree has these properties.]
] <rec:bounded-tree>

#proof[
  Set $t_0 = alpha c \/ \( 2 beta M \)$ and suppose $0 < gamma < overline(delta)_N \( t_0 \)$. At a current vector $u_s^(\( h \)) = u$, choose a closed finite-codimensional subspace $F$ such that
  $ N \( u + t_0 N \( u \) y \) gt.eq \( 1 + gamma \) N \( u \) #h(2em) \( y in F \, med N \( y \) = 1 \) . $
  Convexity extends this inequality to every $w in F$ with $N \( w \) gt.eq t_0 N \( u \)$. More explicitly, for a unit center $x$ and a unit direction $y$, convexity at the radii $0 \, t_0 \, r$ gives $N \( x + r y \) - 1 gt.eq \( r \/ t_0 \) \( N \( x + t_0 y \) - 1 \)$ for $r gt.eq t_0$.
  Weak nullity persists under an equivalent norm. In the finite-dimensional quotient $X \/ F$ the increments converge to zero in norm, so there are $w_k in F$ with $N \( w_k - d_(s \, k)^(\( h \)) \) arrow.r 0$. For large $k$, $N \( w_k \) gt.eq alpha c \/ 2 gt.eq t_0 N \( u \)$. Choose $k$ with error less than $gamma N \( u \) \/ 2$. The preceding estimate then gives
  $ N \( u_(s^frown k)^(\( h \)) \) gt.eq \( 1 + gamma \/ 2 \) N \( u_s^(\( h \)) \) . $
  Choose $h$ such that $alpha m \( 1 + gamma \/ 2 \)^h > beta M$ and iterate this choice for $h$ steps, a contradiction. Restricting an infinite tree to that height gives the same argument. Finally, $overline(delta)_N \( t_0 \) gt.eq 0$: intersect a finite-codimensional subspace with the kernel of a functional norming a given center. Both signs of every perturbation in that kernel have norm at least that of the center. ◻
]

#proof[
  On the infinite tree define $v_s = sum_(r prec.curly.eq s) e_r$. Along this path the fields of $v_s$ are $P = 1 \, Q = 0$, so $N_Sigma \( v_s \) = 1$. Its child increments are $e_(s k)$, and for a finite scalar family $\( a_k \)$ the recursion gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ N_Sigma #scale(x: 180%, y: 180%)[\(] sum_k a_k e_(s k) #scale(x: 180%, y: 180%)[\)] = 2 max { parallel \( a_k^(+) \) parallel_2 \, parallel \( a_k^(-) \) parallel_2 } lt.eq 2 parallel \( a_k \) parallel_2 . $ <rec:sibling-formula>]
  Here $a^(+) = max { a \, 0 }$ and $a^(-) = max { - a \, 0 }$. In particular $N_Sigma \( e_(s k) \) = 2$. The map taking the unit vectors of $ell_2$ to $e_(s k)$ extends to a bounded linear map by (4.1). Since the unit vectors of $ell_2$ are weakly null, so are these increments against every continuous linear functional on $X_Sigma$. Lemma 5 applies with $m = M = 1 \, c = 2$.
  For a node $s in T_n$, let $v_s$ be the indicator of the path from $r_n$ to $s$, with joining coordinate zero. Its component fields are again $P = 1 \, Q = 0$ along the path. At $rho$ they both equal one. Thus
  $ N_0 \( v_s \) = N_0 \( e_s \) = 1 \, #h(2em) N_J \( v_s \) = N_J \( e_s \) = 2 . $
  At a fixed non-leaf $s$ in a component, the sibling sequence is weakly null: restricting any functional to that component gives a continuous functional on a space equivalent to $ell_2 \( T_n \)$ by (2.5). Alternatively, the sibling computation in (4.1) gives a direct bounded map from $ell_2$; for $N_0$ its factor two is replaced by one. The joined trees contain components of every finite height. Lemma 5 therefore applies to $X_0$ with $m = M = c = 1$, and to $X_J$ with $m = M = c = 2$. In both cases the vanishing one-sided modulus occurs at $t_0 = alpha \/ \( 2 beta \)$; for $X_Sigma$ it occurs at $t_0 = alpha \/ beta$. ◻
]

The argument permits the finite-codimensional subspace to change at every node. Its contradiction uses only a fixed positive gain and arbitrarily long bounded paths. Reflexivity of the joined constructions is compatible with this obstruction; it does not imply the existence of an AUC renorming.

== 5 Stopping the propagation of normalized defects <stop:section>

We return to the root-sum norm $N_Sigma$ on the infinite tree from Section 2. This section gives a second proof that a tail of fixed size forces a uniform midpoint gain. Its main object is a product of ratios along a branch. We stop the product when either a normalized base field becomes small, the product becomes small, or an endpoint defect becomes large. A finite martingale controls the second kind of stop; the other two are controlled directly by the fields.

#thm([Lemma 5.1.])[
  (Uniform sequential separation).  #emph[For each $n$, let $x_n \, z_n$ be finitely supported real vectors on $bb(N)^(< omega)$, with $N_Sigma \( x_n \) = 1$. Let $H_n$ be the predecessor closure of $"supp" x_n$, and suppose that $\( z_n \)_s = 0$ for every $s in H_n$. Then 
$ frac(N_Sigma \( x_n + z_n \) + N_Sigma \( x_n - z_n \), 2) arrow.r 1 quad arrow.r.double quad N_Sigma \( z_n \) arrow.r 0 . $

 In particular, the assertion is uniform in the height and size of $H_n$.]
] <stop:sequential>

#proof[
  We first work with one pair $x \, z$, writing $H$ for its head and omitting $n$. Write $C_s^1 = P_s \( x \)$ and $C_s^2 = Q_s \( x \)$. For $s in H$ define
  #[#set math.equation(numbering: n => "(5.1)")
   $ w_s = \( C_s^1 \)^2 + \( C_s^2 \)^2 \, #h(2em) nu_s = w_s / w_o \, #h(2em) u_s^i = C_s^i / sqrt(w_s) \, #h(2em) ell_s = min { u_s^1 \, u_s^2 } . $ <stop:normalization>]
  Every subtree rooted in $H$ contains a nonzero coordinate of $x$. The child inequalities therefore imply $w_s > 0$. At the root, $1 \/ 2 lt.eq w_o lt.eq 1$, since $P_o \( x \) + Q_o \( x \) = 1$. Also $\( u_s^1 \)^2 + \( u_s^2 \)^2 = 1$. Let $I_s$ be the children of $s$ in $H$, and $J_s$ the children outside $H$. Choose an index $i_s in { 1 \, 2 }$ for which the child inequality of the base vector is tight at $s$.
  For $sigma in { - 1 \, 1 }$ set
  #[#set math.equation(numbering: n => "(5.2)")
   $ D_s^sigma = P_s \( x + sigma z \) - P_s \( x \) = Q_s \( x + sigma z \) - Q_s \( x \) \, #h(2em) d_s^sigma = D_s^sigma / sqrt(w_s) quad \( s in H \) . $ <stop:defects>]
  The two differences agree because $z_s = 0$ on $H$. They are nonnegative: at exterior children the base fields are zero, and upward induction uses the monotonicity of the recursion in both child bounds. Thus
  #[#set math.equation(numbering: n => "(5.3)")
   $ N_Sigma \( x + sigma z \) = 1 + 2 D_o^sigma . $ <stop:root-defect>]
  Here and below, $C^1 \( v \) = P \( v \)$ and $C^2 \( v \) = Q \( v \)$ when an argument is specified. Define the exterior energies by
  #[#set math.equation(numbering: n => "(5.4)")
   $ E_s^sigma = 1 / w_o sum_(c in J_s) C_c^(i_s) \( sigma z \)^2 \, #h(2em) cal(E) = sum_(s in H) sum_sigma E_s^sigma = 1 / w_o sum_(s in H) sum_(c in J_s) #scale(x: 120%, y: 120%)[\(] P_c \( z \)^2 + Q_c \( z \)^2 #scale(x: 120%, y: 120%)[\)] . $ <stop:exterior>]
  Negation interchanges the fields, so the last sum is independent of our choices of $i_s$. Only finitely many exterior terms are nonzero. On $H$ the fields of $z$ agree. The recursion there gives
  $ P_s \( z \)^2 = sum_(c in I_s) P_c \( z \)^2 + max {sum_(c in J_s) P_c \( z \)^2 \, sum_(c in J_s) Q_c \( z \)^2} . $
  Telescoping over $H$ proves
  #[#set math.equation(numbering: n => "(5.5)")
   $ N_Sigma \( z \)^2 lt.eq 4 w_o cal(E) . $ <stop:tail-energy>]
  We will show that a small root defect forces this exterior energy to be small, independently of the head.
  There is a second useful estimate, for every $a in H$:
  #[#set math.equation(numbering: n => "(5.6)")
   $ sum_(s in H\
a prec.curly.eq s) sum_sigma E_s^sigma lt.eq nu_a sum_sigma \( ell_a + d_a^sigma \)^2 . $ <stop:subtree>]
  Choose one index $i$ with $u_a^i = ell_a$, and iterate the child inequality for the single field $C^i \( x + sigma z \)$ from $a$ to all first exterior nodes below it. At those nodes the whole base subtree vanishes. Summing over signs makes the resulting boundary sum independent of $i$, and division by $w_o$ gives (5.6).
  #emph[The identity that propagates the defect.] For a fixed sign abbreviate $d_s = d_s^sigma$. Subtracting the tight base inequality for $C^(i_s)$ from its endpoint inequality yields
  #[#set math.equation(numbering: n => "(5.7)")
   $ nu_s \( 2 u_s^(i_s) d_s + d_s^2 \) gt.eq sum_(c in I_s) nu_c \( 2 u_c^(i_s) d_c + d_c^2 \) + E_s^sigma . $ <stop:increment>]
  Whenever $u_s^(i_s) > 0$, put $R_(s c) = u_c^(i_s) \/ u_s^(i_s)$. Tightness gives $sum_(c in I_s) nu_c R_(s c)^2 = nu_s$. Expanding the squares in the following display and using that identity rewrites (5.7) as
  #[#set math.equation(numbering: n => "(5.8)")
   $ 2 \( u_s^(i_s) + d_s \) (nu_s d_s - sum_(c in I_s) nu_c R_(s c) d_c) gt.eq E_s^sigma + sum_(c in I_s) nu_c \( d_c - R_(s c) d_s \)^2 . $ <stop:square>]
  The last sum measures the failure of the defect to propagate by the ratios $R_(s c)$. Multiplying those ratios along a branch makes the left side telescope.
  Fix $0 < lambda < 1 \/ 2$, $0 < zeta < 1$, and $h > 0$. Inspect the root with $Z_o = 1$. At an inspected node $s$, stop when
  #[#set math.equation(numbering: n => "(5.9)")
   $ ell_s < lambda \, #h(2em) Z_s < zeta \, #h(2em) upright("or") #h(2em) max_sigma d_s^sigma > h . $ <stop:rule>]
  If none holds, call $s$ a continuation node and inspect its children $c in I_s$ with $Z_c = Z_s R_(s c)$. The denominator in $R_(s c)$ is at least $lambda$ at such a node. Let $G$ and $S$ denote the continuation and stop sets. Every leaf of $H$ has $ell_s = 0$, so every inspected branch stops. The stops are incomparable, and the child inequalities give
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_(T in S) nu_T lt.eq 1 . $ <stop:mass>]
  Multiplying (5.8) at $s in G$ by $Z_s \/ \[ 2 \( u_s^(i_s) + d_s^sigma \) \]$, which is at least $zeta \/ \[ 2 \( 1 + h \) \]$, and summing gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(T in S) nu_T Z_T d_T^sigma & + frac(zeta, 2 \( 1 + h \)) sum_(s in G) (E_s^sigma + sum_(c in I_s) nu_c \( d_c^sigma - R_(s c) d_s^sigma \)^2) lt.eq d_o^sigma . $ <stop:telescope>]
  If the root itself stops, this is equality with $G$ empty.
  A nonroot stop $T$ has a parent $s in G$, and $R_(s T) d_s^sigma lt.eq h \/ lambda$. Use $\( a + b \)^2 lt.eq 2 a^2 + 2 b^2$, then (5.10) and (5.11), to obtain
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(T in S) nu_T \( d_T^sigma \)^2 lt.eq \( d_o^sigma \)^2 + frac(4 \( 1 + h \), zeta) d_o^sigma + 2 \( h \/ lambda \)^2 . $ <stop:squares>]
  The first term includes the possible root stop. Classify stops first by $ell_T < lambda$, then by $ell_T gt.eq lambda$ and $Z_T < zeta$. At every remaining stop, $Z_T gt.eq zeta$ and some $d_T^sigma > h$. The boundary term in (5.11) therefore gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ sum_(T in S) nu_T ell_T^2 lt.eq lambda^2 + sum_(T in S\
ell_T gt.eq lambda \, med Z_T < zeta) nu_T + frac(sum_sigma d_o^sigma, zeta h) . $ <stop:minima>]
  Only the middle term still needs a bound uniform in the tree.
  #emph[The probability of a small product.] Run the following finite random process from $o$. At $s in H$ move to $c in I_s$ with probability $w_c \/ w_s$, and move to absorbing states labelled $1$ and $0$ with respective probabilities
  $ frac(P_s \( x \)^2 - sum_(c in I_s) P_c \( x \)^2, w_s) \, #h(2em) frac(Q_s \( x \)^2 - sum_(c in I_s) Q_c \( x \)^2, w_s) . $
  These are nonnegative and sum with the child probabilities to one. Stay at an absorbing state and run to one step beyond the height of $H$. Reaching a particular node $s$ has probability $nu_s$. Give that node value $p_s = P_s \( x \)^2 \/ w_s$, and an absorbing state its label. The conditional expectation of the next value is $p_s$, since
  $ sum_(c in I_s) w_c / w_s frac(P_c \( x \)^2, w_c) + frac(P_s \( x \)^2 - sum_(c in I_s) P_c \( x \)^2, w_s) = p_s . $
  The successive values $p_j$ thus form a martingale in $\[ 0 \, 1 \]$ for the filtration generated by the path.
  On $\[ lambda^2 \, 1 - lambda^2 \]$ define $H_1 \( p \) = 1 / 2 log p$ and $H_2 \( p \) = 1 / 2 log \( 1 - p \)$. Their derivatives satisfy
  #[#set math.equation(numbering: n => "(5.14)")
   $ \| H'_i \| lt.eq B_lambda := frac(1, 2 lambda^2) \, #h(2em) \| H''_i \| lt.eq 2 K_lambda := frac(1, 2 lambda^4) . $ <stop:derivative-constants>]
  At a step starting at $s in G$ take $b_j = H'_(i_s) \( p_s \)$; at every other step take $b_j = 0$. These coefficients are known before the step. With $Delta p_j = p_(j + 1) - p_j$, put
  $ V = sum_j \( Delta p_j \)^2 \, #h(2em) M = sum_j b_j Delta p_j . $
  The sum $M$ is a predictable martingale transform #cite(label("Burkholder1966")). Here its second moment follows directly: conditional mean-zero increments make the cross terms vanish, giving
  #[#set math.equation(numbering: n => "(5.15)")
   $ bb(E) V = bb(E) p_(upright("end"))^2 - p_o^2 lt.eq 1 \, #h(2em) bb(E) M^2 = sum_j bb(E) #scale(x: 120%, y: 120%)[\[] b_j^2 \( Delta p_j \)^2 #scale(x: 120%, y: 120%)[\]] lt.eq B_lambda^2 . $ <stop:moments>]
  Suppose that the path reaches $T in S$ with $ell_T gt.eq lambda$ and $Z_T < zeta$. All preceding nodes are in $G$, and all values through $T$ lie in $\[ lambda^2 \, 1 - lambda^2 \]$. On each such edge $s arrow.r c$, Taylor’s inequality gives
  $ log R_(s c) = H_(i_s) \( p_c \) - H_(i_s) \( p_s \) gt.eq b_j Delta p_j - K_lambda \( Delta p_j \)^2 . $
  After this stop the path meets no further node of $G$. Thus the later coefficients of $M$ are zero, and allowing later nonnegative terms in $V$ gives $log zeta > log Z_T gt.eq M - K_lambda V$. For $L = log \( 1 \/ zeta \)$ this event is contained in ${ M < - L \/ 2 } union { K_lambda V > L \/ 2 }$. Chebyshev’s and Markov’s inequalities, followed by (5.15), show that
  #[#set math.equation(numbering: n => "(5.16)")
   $ sum_(T in S\
ell_T gt.eq lambda \, med Z_T < zeta) nu_T lt.eq r_lambda \( zeta \) := frac(4 B_lambda^2, L^2) + frac(2 K_lambda, L) . $ <stop:probability>]
  Different stops correspond to disjoint path events. For each fixed $lambda$, the right side tends to zero as $zeta arrow.b 0$.
  #emph[Finishing the estimate in the required order.] The head consists of $G$ and the disjoint subtrees beginning at its stops. By (5.6), the latter contribute at most
  $ 4 sum_(T in S) nu_T ell_T^2 + 2 sum_sigma sum_(T in S) nu_T \( d_T^sigma \)^2 $
  to $cal(E)$. Write $alpha = sum_sigma d_o^sigma$ and $beta_0 = sum_sigma \( d_o^sigma \)^2$. Combining (5.11)–(5.13) with (5.16) proves the finite estimate
  #[#set math.equation(numbering: n => "(5.17)")
   $ cal(E) lt.eq  & 4 lambda^2 + 4 r_lambda \( zeta \) + 8 \( h \/ lambda \)^2 + 2 beta_0\
 & + (frac(10 \( 1 + h \), zeta) + frac(4, zeta h)) alpha . $ <stop:uniform-energy>]
  Restore the sequence index. The assumed convergence and (5.3), together with $w_o gt.eq 1 \/ 2$, imply $d_o^sigma arrow.r 0$ for both signs. Keep $lambda \, zeta \, h$ fixed while taking this limit in (5.17). Then
  $ limsup_n cal(E)_n lt.eq 4 lambda^2 + 4 r_lambda \( zeta \) + 8 \( h \/ lambda \)^2 . $
  Choose $lambda$ small, then choose $zeta$ small with that $lambda$ fixed, and finally choose $h$ small. The right side becomes arbitrarily small. Therefore $cal(E)_n arrow.r 0$, and (5.5) proves the lemma. ◻
]

#thm([Corollary 5.2.])[
  #emph[For every $t > 0$, the averaged asymptotic modulus of $N_Sigma$ is positive.]
] <stop:all-radii>

#proof[
  Fix $t > 0$. Lemma 6 gives an $eta > 0$, independent of the finite unit center $x$, such that the average endpoint norm is at least $1 + eta$ for every finite tail $z$ vanishing on its predecessor closure and satisfying $N_Sigma \( z \) gt.eq t \/ 2$. Otherwise a sequence would contradict the lemma; convexity always bounds the average below by one.
  Given a unit center $x_0$ in the completion, choose a finite unit vector $x$ with $N_Sigma \( x - x_0 \) < eta \/ 2$, and let $H$ be its predecessor closure. The finite tails are dense in $ker Pi_H$, as established in Section 2. A tail of norm at least $t$ is the limit of finite tails whose norms are eventually at least $t \/ 2$. Continuity therefore gives the endpoint estimate at $x$ for this completed tail. Replacing $x$ by $x_0$ loses less than $eta \/ 2$ in the average. Taking $z = t y$ with $y in ker Pi_H$ and $N_Sigma \( y \) gt.eq 1$, then performing the defining infimum and supremum, gives $hat(delta)_(N_Sigma) \( t \) gt.eq eta \/ 2 > 0$. ◻
]

== 6 Logarithmic propagation on the joined tree <log:section>

We now use the norm $N_J$ on $X_J$ from construction Section 2.1: the finite-height trees are joined at a root whose coordinate is free, and the norm is the sum of its two fields. The following argument begins with a finite-tree statement about arbitrary nonnegative fields. It propagates a positive amount of boundary mass through a product of ratios. Taking logarithms turns that product into increments of two bounded supermartingales.

Call a nonnegative field $a$ on a finite rooted tree an #emph[upper field] if $a_s^2 gt.eq sum_(c in "ch" \( s \)) a_c^2$ at every nonleaf.

#thm([Lemma 6.1.])[
  (Uniform logarithmic propagation).  #emph[Fix $M gt.eq beta > 0$. Let $p \, q \, r$ be nonnegative fields on a finite rooted tree with root $o$. Suppose that $p \, q \, p + r \, q + r$ are upper fields, and at every nonleaf the upper inequality for at least one of $p \, q$ is an equality. If 
$ p_o + q_o + 2 r_o lt.eq M \, #h(2em) sum_(b upright(" a leaf")) r_b^2 gt.eq beta^2 \, $

 then $r_o gt.eq gamma \( M \, beta \) > 0$, independently of the tree. One possible choice is 
#[#set math.equation(numbering: n => "(6.1)")
 $ h = frac(beta^2, 2 M^2) \, #h(2em) c_(*) = frac(beta sqrt(h), 8) \, #h(2em) H_(*) = 1 + log \( M \/ c_(*) \) \, #h(2em) K = frac(4 \( 2 + sqrt(6) \) H_(*), h) \,\
gamma \( M \, beta \) = frac(beta h, 8) e^(- K) . $ <log:gamma>]

]
] <log:finite-tree>

#proof[
  Put $u = p + r \/ 2$ and $v = q + r \/ 2$. These are upper fields by convexity. We first distribute probability along the tree. Set $mu_o = 1$, and choose masses recursively so that the masses of the children of every nonleaf sum to its mass and
  #[#set math.equation(numbering: n => "(6.2)")
   $ mu_s gt.eq M^(- 2) #scale(x: 120%, y: 120%)[\(] \( p_s + r_s \)^2 + \( q_s + r_s \)^2 #scale(x: 120%, y: 120%)[\)] . $ <log:masses>]
  At the root the right side is at most one. At every other step the sum of the children’s required lower bounds is at most the required lower bound at their parent. Assign those lower bounds first and distribute the remaining mass among the children. This constructs the masses. Nodes of zero mass have all three fields zero and can be omitted from the random process.
  Start a path at the root, moving from $s$ to $c$ with probability $mu_c \/ mu_s$. Once it reaches a leaf, leave it there until the common terminal time $l$, the height of the tree. Relative to the filtration of the path, define
  $ U_i = u_(s_i) / sqrt(mu_(s_i)) \, #h(2em) V_i = v_(s_i) / sqrt(mu_(s_i)) \, #h(2em) R_i = r_(s_i) / sqrt(mu_(s_i)) . $
  All three processes lie in $\[ 0 \, M \]$, and $U_i \, V_i gt.eq R_i \/ 2$. The upper inequalities give $bb(E)_i U_(i + 1)^2 lt.eq U_i^2$ and $bb(E)_i V_(i + 1)^2 lt.eq V_i^2$. Conditional Cauchy–Schwarz also makes $U \, V$ supermartingales.
  At each nonleaf choose $U$ if the inequality for $p$ is tight, and choose $V$ otherwise. Write $W_i^(\( i \)) \, W_(i + 1)^(\( i \))$ for the two consecutive values of the process chosen at time $i$; choose $U$ once the path has stopped at a leaf. Subtracting the tight squared inequality for $p$ from the one for $p + r$ gives
  $ u_s r_s gt.eq sum_c u_c r_c . $
  The corresponding formula holds for $v$ when $q$ is tight. Consequently
  $ W_i^(\( i \)) R_i gt.eq bb(E)_i #scale(x: 120%, y: 120%)[\[] W_(i + 1)^(\( i \)) R_(i + 1) #scale(x: 120%, y: 120%)[\]] . $
  Put $L_i = W_(i + 1)^(\( i \)) \/ W_i^(\( i \))$ when the denominator is positive, and $L_i = 0$ otherwise. A zero denominator forces $R_i = 0$ and the conditional product on the right to vanish, so in every case $R_i gt.eq bb(E)_i \[ L_i R_(i + 1) \]$. Iterating yields
  #[#set math.equation(numbering: n => "(6.3)")
   $ r_o gt.eq bb(E) [R_l product_(i < l) L_i] . $ <log:product>]
  The boundary hypothesis says $bb(E) R_l^2 = sum_b r_b^2 gt.eq beta^2$. Since $R_l lt.eq M$,
  $ bb(P) \( R_l gt.eq beta \/ 2 \) gt.eq frac(beta^2, 2 M^2) = h . $
  On this event $U_l \, V_l gt.eq beta \/ 4$. For the first time $U_i < c_(*)$, condition on the path up to that time. The squared supermartingale inequality gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] U_i < c_(*) upright(" for some ") i \, U_l gt.eq beta \/ 4 #scale(x: 120%, y: 120%)[\)] lt.eq frac(c_(*)^2, \( beta \/ 4 \)^2) . $
  This follows by summing the conditional estimate over the disjoint first-time events; the same argument applies to $V$. Our choice of $c_(*)$ makes twice this bound at most $h \/ 2$. Hence the event
  #[#set math.equation(numbering: n => "(6.4)")
   $ G = { R_l gt.eq beta \/ 2 \, med U_i \, V_i gt.eq c_(*) upright(" for every ") i } $ <log:good-event>]
  has probability at least $h \/ 2$.
  We have retained a definite set of paths on which all ratios can be logged. It remains to prevent their product from becoming too small. Define the increasing concave function
  $ g \( t \) = cases(delim: "{", log c_(*) + \( t - c_(*) \) \/ c_(*) \, & 0 lt.eq t < c_(*) \,, log t \, & c_(*) lt.eq t lt.eq M .) $
  The processes $A_i = g \( U_i \) - g \( 0 \)$ and $B_i = g \( V_i \) - g \( 0 \)$ are nonnegative supermartingales bounded by $H_(*)$. Indeed, conditional Jensen followed by the monotonicity of $g$ proves their supermartingale inequalities. Let
  $ Z = sum_(i < l) #scale(x: 120%, y: 120%)[\(] g \( W_(i + 1)^(\( i \)) \) - g \( W_i^(\( i \)) \) #scale(x: 120%, y: 120%)[\)] . $
  For either process $D = A$ or $D = B$, write $d_i^D = D_i - bb(E)_i D_(i + 1) gt.eq 0$. Telescoping expectations gives $sum_i bb(E) d_i^D lt.eq H_(*)$. Expanding squared increments gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ sum_(i < l) bb(E) \( D_(i + 1) - D_i \)^2 & = bb(E) \( D_l^2 - D_0^2 \) + 2 sum_(i < l) bb(E) \( D_i d_i^D \)\
 & lt.eq 3 H_(*)^2 . $ <log:quadratic-increments>]
  Split each selected increment in $Z$ into its conditional mean and its centered part. The absolute expectation of the sum of the means is at most $2 H_(*)$. The centered parts are martingale differences, since the choice between $A$ and $B$ is made before the step. Their cross terms have zero expectation, and their total variance is at most $6 H_(*)^2$ by (6.5). Therefore
  #[#set math.equation(numbering: n => "(6.6)")
   $ bb(E) \| Z \| lt.eq \( 2 + sqrt(6) \) H_(*) . $ <log:increment-bound>]
  Markov’s inequality and (6.1) give $bb(P) \( Z < - K \) lt.eq h \/ 4$, so $bb(P) \( G ∩ { Z gt.eq - K } \) gt.eq h \/ 4$. On $G$, the product of ratios in (6.3) is $e^Z$. Restricting its expectation to this last event proves $r_o gt.eq \( h \/ 4 \) \( beta \/ 2 \) e^(- K) = gamma \( M \, beta \)$. ◻
]

#thm([Lemma 6.2.])[
  (Finite-head gap for the joined-root sum).  #emph[Let $x \, y$ be finitely supported vectors in $X_J$. Suppose that $x$ is supported in a finite predecessor-closed set $H$ containing the joining root, and that $y$ vanishes on $H$. If 
$ N_J \( x + y \) \, N_J \( x - y \) lt.eq 2 \, #h(2em) N_J \( y \) gt.eq zeta \, #h(2em) 0 < zeta lt.eq 2 \, $

 then 
$ frac(N_J \( x + y \) + N_J \( x - y \), 2) gt.eq N_J \( x \) + 2 gamma \( 2 \, zeta \/ 4 \) . $

]
] <log:tail-gap>

#proof[
  Write $o = rho$ for the joining root. Use $p = P \( x \)$ and $q = Q \( x \)$, and define $r$ by
  $ p + r = 1 / 2 #scale(x: 120%, y: 120%)[\(] P \( x + y \) + P \( x - y \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) q + r = 1 / 2 #scale(x: 120%, y: 120%)[\(] Q \( x + y \) + Q \( x - y \) #scale(x: 120%, y: 120%)[\)] . $
  The same $r$ occurs because both differences of fields equal $x$. Convexity gives $r gt.eq 0$. Take the finite tree consisting of $H$ and the first vertices outside $H$ on paths to the support of $y$. Call those exterior vertices $B$. Preserve the complete subtree values at them. The four restricted fields are upper fields; a base tight inequality remains tight at every internal node because omitted subtrees have zero base fields. At the root the endpoint average gives $p_o + q_o + 2 r_o lt.eq 2$. At $b in B$,
  $ p_b = q_b = 0 \, #h(2em) r_b = 1 / 2 \( P_b \( y \) + Q_b \( y \) \) . $
  On $H$ the two fields of $y$ agree. Upward induction therefore bounds both by the Euclidean norm of the boundary sums $P_b \( y \) + Q_b \( y \)$ below the node. In particular,
  $ N_J \( y \) lt.eq 2 (sum_(b in B) \( P_b \( y \) + Q_b \( y \) \)^2)^(1 \/ 2) = 4 (sum_(b in B) r_b^2)^(1 \/ 2) . $
  Other leaves, if present, have nonnegative $r_b^2$ and cause no loss. Lemma 8 with $M = 2$ and $beta = zeta \/ 4$ gives $r_o gt.eq gamma \( 2 \, zeta \/ 4 \)$. The average norm equals $N_J \( x \) + 2 r_o$. ◻
]

The next theorem is a separated-family formulation of asymptotic midpoint uniform convexity; see #cite(label("BLP2026"), form: "prose") Definition 6.15 and Proposition 6.16. Here the field argument supplies the gap directly, with the explicit constant from Lemma 8.

#thm([Theorem 6.3.])[
  (Separated midpoint families).  #emph[For every $epsilon > 0$ there is $eta \( epsilon \) in \( 0 \, 1 \)$ such that, for $x \, z_1 \, z_2 \, dots.h in X_J$, 
$ N_J \( x + z_j \) \, N_J \( x - z_j \) lt.eq 1 quad \( j gt.eq 1 \) \,\
N_J \( z_i - z_j \) gt.eq epsilon quad \( i eq.not j \)} quad arrow.r.double quad N_J \( x \) lt.eq 1 - eta \( epsilon \) . $

 For $0 < epsilon lt.eq 2$, one can take $eta \( epsilon \) = min { 1 \/ 2 \, gamma \( 2 \, epsilon \/ 16 \) }$.]
] <log:lens-gap>

#proof[
  The hypotheses imply $N_J \( z_j \) lt.eq 1$, so for $epsilon > 2$ there is no such family and any $eta in \( 0 \, 1 \)$ works. Suppose $0 < epsilon lt.eq 2$ and fix $0 < delta < min { 1 \/ 3 \, epsilon \/ 8 }$. Choose a finite vector $x'$ with $N_J \( x - x' \) < delta$, and let $H$ be the finite predecessor closure of $"supp" x'$ together with the root. The bounded sequence $Pi_H z_j$ lies in a finite-dimensional space. Hence we can choose $i eq.not j$ so that, for $u = \( z_i - z_j \) \/ 2$, $N_J \( Pi_H u \) < delta$. Then
  $ N_J \( u \) gt.eq epsilon \/ 2 \, #h(2em) N_J \( x + u \) \, N_J \( x - u \) lt.eq 1 . $
  For example, $x + u$ is the average of $x + z_i$ and $x - z_j$. The completed tail $u - Pi_H u$ can be approximated, by the density statement of Section 2, by a finite tail $y$ satisfying $N_J \( y - \( u - Pi_H u \) \) < delta$. Consequently
  $ N_J \( y \) gt.eq epsilon \/ 2 - 2 delta gt.eq epsilon \/ 4 \, #h(2em) N_J \( x' plus.minus y \) lt.eq 1 + 3 delta lt.eq 2 . $
  Apply Lemma 9 with $zeta = epsilon \/ 4$ to obtain
  $ 1 + 3 delta gt.eq N_J \( x' \) + 2 gamma \( 2 \, epsilon \/ 16 \) gt.eq N_J \( x \) - delta + 2 gamma \( 2 \, epsilon \/ 16 \) . $
  Let $delta arrow.b 0$. This proves the stated conclusion, with room to choose the displayed $eta$ strictly below one. ◻
]

== 7 Changing the child exponent with the height <sec:variable>

We now change the child aggregation to an $ell_p$ norm, choosing $p = 1 + 1 \/ h$ on a tree of height $h$. This choice keeps the powers $p^h lt.eq e$ that arise in iteration bounded independently of $h$. The resulting outer Hilbert sum is reflexive and admits no equivalent AUC norm. Its midpoint estimates will be uniform in the component height. We first consider centers with finite total support and perturbations that vanish on a finite subtree containing the center’s support in each nonzero component. A normalized boundary calculation bounds the sixth power of the perturbation by the excess in the sum of the squared endpoint norms. Accumulating the energy that has left these subtrees gives cubic control of the radius of a ball containing both endpoints. We then obtain a bound for arbitrary centers with weakly null perturbations, and a positive averaged midpoint modulus.

=== 7.1 The norm and its completion <the-norm-and-its-completion>

For an integer $h gt.eq 1$, let

$ T_h = union.big_(j = 0)^h bb(N)^j \, #h(2em) p_h = 1 + 1 / h . $

The root $o$ is the empty sequence; the children of $s$ are the sequences $s i$, $i in bb(N)$, when $\| s \| < h$. We write $t prec.curly.eq s$ when $t$ is a prefix of $s$, including $t = s$. All vectors and arrays in this section are real. For $v in ell_(p_h) \( T_h \)$, define two nonnegative arrays from the leaves upward. At a node $s$, put

$ a_s = #scale(x: 240%, y: 240%)[\(] sum_i P_(s i) \( v \)^(p_h) #scale(x: 240%, y: 240%)[\)]^(1 \/ p_h) \, #h(2em) b_s = #scale(x: 240%, y: 240%)[\(] sum_i Q_(s i) \( v \)^(p_h) #scale(x: 240%, y: 240%)[\)]^(1 \/ p_h) \, $

where both values are zero at a leaf, and set

#[#set math.equation(numbering: n => "(7.1)")
 $ P_s \( v \) = max { a_s \, v_s + b_s } \, #h(2em) Q_s \( v \) = max { a_s - v_s \, b_s } . $ <var:recursion>]

Thus $P_s \( v \) - Q_s \( v \) = v_s$. The pair is the coordinatewise least nonnegative pair with this difference and with each array dominating the $ell_(p_h)$ norm of its children. Indeed, at a node whose child values have been fixed, every feasible pair must have $P_s gt.eq max { a_s \, v_s + b_s }$ and $Q_s = P_s - v_s$. The formulas are increasing in both child bounds, so induction from the leaves proves minimality throughout the tree. At least one of the two child inequalities is an equality at every node.

Define

$ nu_h \( v \) = P_o \( v \) + Q_o \( v \) \, #h(2em) E_h = \( ell_(p_h) \( T_h \) \, nu_h \) \, #h(2em) X_(upright(v)) = #scale(x: 180%, y: 180%)[\(] xor.big_(h = 1)^oo E_h #scale(x: 180%, y: 180%)[\)]_(ell_2) . $

We write $parallel x parallel_(upright(v))^2 = sum_h nu_h \( x^(\( h \)) \)^2$ for its norm.

#thm([Proposition 7.1.])[
  #emph[The recursion (7.1) defines a norm equivalent to the usual $ell_(p_h) \( T_h \)$ norm. In particular, $E_h$ is complete and reflexive, with separable dual. The space $X_(upright(v))$ is complete and reflexive, its dual is separable, and vectors with finite total coordinate support are dense in it. Every finite coordinate projection is bounded and has finite rank.]
] <var:space>

#proof[
  Write $p = p_h$ and $M_s = max { P_s \( v \) \, Q_s \( v \) }$. The recursion gives
  $ M_s lt.eq \| v_s \| + parallel \( M_(s i) \)_i parallel_p . $
  Taking the $ell_p$ norm on a level and proceeding upward proves that all the defining arrays have finite level norms and that
  $ M_o lt.eq sum_(j = 0)^h parallel \( v_s \)_(\| s \| = j) parallel_p . $
  In particular, the recursion is defined for every $v in ell_p \( T_h \)$. Conversely, iteration of the child inequalities gives, on every level $j$,
  $ parallel \( P_s \( v \) \)_(\| s \| = j) parallel_p lt.eq P_o \( v \) \, #h(2em) parallel \( Q_s \( v \) \)_(\| s \| = j) parallel_p lt.eq Q_o \( v \) . $
  Since $v = P \( v \) - Q \( v \)$, these estimates imply
  #[#set math.equation(numbering: n => "(7.2)")
   $ \( h + 1 \)^(- 1 \/ p) parallel v parallel_(ell_p \( T_h \)) lt.eq nu_h \( v \) lt.eq 2 \( h + 1 \)^(1 - 1 \/ p) parallel v parallel_(ell_p \( T_h \)) . $ <var:equivalence>]
  They also give $\| v_s \| lt.eq nu_h \( v \)$ for every coordinate $s$.
  Negation exchanges the two arrays, and positive scaling scales them. If $\( P \, Q \)$ and $\( P' \, Q' \)$ are feasible pairs for $v$ and $w$, then $\( P + P' \, Q + Q' \)$ is feasible for $v + w$, by the triangle inequality in $ell_p$. Minimality therefore gives the triangle inequality for $nu_h$. The lower bound in (7.2) gives definiteness. Norm equivalence proves completeness of $E_h$ and density of its finitely supported vectors.
  On a countable set, the usual dual of $ell_p$, $1 < p < oo$, is $ell_(p \/ \( p - 1 \))$: Hölder gives the pairing in one direction, and testing a functional on finitely supported signed powers of its coordinate values gives the converse and the dual norm. Applying this twice proves reflexivity, and finite support approximation proves dual separability. Equivalent norms preserve the continuous dual, bidual, and surjectivity of the canonical map into the bidual, so these properties hold for $E_h$.
  The outer-sum argument in Proposition 2, applied to these component norms, proves completeness and reflexivity of $X_(upright(v))$ and the dual identification
  $ X_(upright(v))^(*) = #scale(x: 180%, y: 180%)[\(] xor.big_(h = 1)^oo E_h^(*) #scale(x: 180%, y: 180%)[\)]_(ell_2) $
  under the componentwise pairing. Finite component approximation and separability of each $E_h^(*)$ give separability of this dual. Truncating the component sum and then approximating within the retained components proves finite total support density in $X_(upright(v))$. Coordinate evaluations are bounded by the norm; each finite coordinate projection is consequently a finite sum of bounded rank-one operators. ◻
]

The spaces also retain uniformly bounded paths with weakly null increments. This supplies their obstruction to asymptotically uniformly convex renormings before we turn to their midpoint gains.

#thm([Proposition 7.2.])[
  #emph[The space $X_(upright(v))$ admits no equivalent asymptotically uniformly convex norm. More precisely, if $a parallel dot.op parallel_(upright(v)) lt.eq N lt.eq b parallel dot.op parallel_(upright(v))$ with $0 < a lt.eq b$, then $overline(delta)_N \( a \/ b \) = 0$.]
] <var:no-auc>

#proof[
  For $s in T_h$, let $e_s$ be its coordinate vector and put $b_s = sum_(t prec.curly.eq s) e_t$. The path indicator itself is a feasible $P$ array for $b_s$, with $Q = 0$, and its root coordinate supplies the reverse inequality. Hence $nu_h \( b_s \) = 1$. For a nonterminal $s$, the vector $e_(s i)$ has fields $P = 1 \, Q = 0$ at $s i$ and $P = Q = 1$ at each proper ancestor. Thus $nu_h \( e_(s i) \) = 2$. The sequence of distinct child vectors $\( e_(s i) \)_i$ is weakly null in $E_h$, by (7.2) and $p_h > 1$, and hence in $X_(upright(v))$. Since $b_(s i) - b_s = e_(s i)$ and the component heights are unbounded, Lemma 5 applies with $m = M = 1$, $c = 2$, $alpha = a$, and $beta = b$. It gives $overline(delta)_N \( a \/ b \) = 0$, excluding an AUC norm. ◻
]

=== 7.2 A boundary quantity and a sixth-power estimate <a-boundary-quantity-and-a-sixth-power-estimate>

Fix $h$ and abbreviate $p = p_h$. A finite set $A subset T_h$ is #emph[ancestral] if it contains the root and every prefix of each of its elements. In the next two arguments, the center $x in E_h$ is supported on $A$, while $y in E_h$ vanishes on $A$. Write

$ B = nu_h \( x \) \, quad Y = nu_h \( y \) \, quad M_sigma = nu_h \( x + sigma y \) quad \( sigma in { + \, - } \) . $

The arrays for $x$ vanish off $A$. On $A$, monotonicity of the recursion shows that the arrays for $x + sigma y$ have the form

#[#set math.equation(numbering: n => "(7.3)")
 $ P_s \( x + sigma y \) = P_s \( x \) + d_s^sigma \, #h(2em) Q_s \( x + sigma y \) = Q_s \( x \) + d_s^sigma \, #h(2em) d_s^sigma gt.eq 0 . $ <var:common-increments>]

The increments are equal because the coordinate difference is still $x_s$. In particular, $M_sigma = B + 2 d_o^sigma gt.eq B$.

Let $H$ consist of the nodes outside $A$ whose parents belong to $A$. This is a possibly infinite antichain. At each node $s in A$, fix one of the labels $P \, Q$ whose old value equals its child norm. For $i in H$, let $v_i^sigma$ be the value at $i$ of the endpoint array with the label chosen by its parent. The same label is used for both signs. On the subtree below $i$, the center is zero, so negation interchanges the two arrays and

#[#set math.equation(numbering: n => "(7.4)")
 $ v_i^(+) + v_i^(-) = P_i \( y \) + Q_i \( y \) . $ <var:boundary-signs>]

We shall propagate one of these two boundary vectors to the root.

#thm([Lemma 7.3.])[
  #emph[Let $x \, y in E_h$, with $x$ supported on a finite ancestral set $A$ and $y$ zero on $A$. Put $B = nu_h \( x \)$, $Y = nu_h \( y \)$, and $M_sigma = nu_h \( x + sigma y \)$. With $upright(e) = exp \( 1 \)$ and 
$ c_6 = 2 exp \( - \( upright(e) - 1 \) \) 4^(- 6) \, #h(2em) U^2 = M_(+)^2 + M_(-)^2 \, $

 one has 
#[#set math.equation(numbering: n => "(7.5)")
 $ U^2 - 2 B^2 gt.eq c_6 U^(- 4) Y^6 . $ <var:sixth-component-eq>]

 A quotient with numerator and denominator both zero is interpreted as zero. The same estimate holds when $x = 0$ and $y$ is arbitrary.]
] <var:sixth-component>

#proof[
  The total array $R_s = P_s + Q_s$ of any vector satisfies $parallel \( R_(s i) \)_i parallel_p lt.eq R_s$, by Minkowski. Consequently its $p$th powers sum to at most $R_s^p$ on any antichain below $s$. This follows first for finite antichains by iterating the child inequality, and then for countable ones by increasing finite subsets.
  There is a feasible pair for $y$ which uses its minimal arrays off $A$ and whose two values at $s in A$ both equal
  $ (sum_(i in H : thin s prec.curly.eq i) \( P_i \( y \) + Q_i \( y \) \)^p)^(1 \/ p) . $
  Grouping boundary descendants by the first child proves the child inequalities. The antichain estimate just proved makes the sums finite. Minimality, (7.4), and Minkowski give
  $ Y lt.eq 2 parallel \( P_i \( y \) + Q_i \( y \) \)_(i in H) parallel_p lt.eq 2 #scale(x: 120%, y: 120%)[\(] parallel \( v_i^(+) \)_(i in H) parallel_p + parallel \( v_i^(-) \)_(i in H) parallel_p #scale(x: 120%, y: 120%)[\)] . $
  Choose a sign $sigma$ with $parallel \( v_i^sigma \)_(i in H) parallel_p gt.eq Y \/ 4$. For this sign, put
  $ R_s = P_s \( x + sigma y \) + Q_s \( x + sigma y \) \, #h(2em) d_s = d_s^sigma med \( s in A \) \, #h(2em) d_i = v_i^sigma med \( i in H \) . $
  Let $L_s$ be the old value at $s in A$ of its chosen tight array. Subtract its old equality from the new child inequality. For children in $A$, use $\( a + d \)^p - a^p gt.eq d^p$, and for boundary children use that the old value was zero. It follows that
  $ sum_(i upright(" child of ") s) d_i^p lt.eq \( L_s + d_s \)^p - L_s^p lt.eq p R_s^(p - 1) d_s . $
  Here and below a node in $A$ with no boundary descendants makes no contribution. Define $z_s = d_s \/ R_s$ when $R_s > 0$, and $z_s = 0$ otherwise. All child values vanish when $R_s = 0$; for positive $R_s$ we have
  #[#set math.equation(numbering: n => "(7.6)")
   $ z_s gt.eq 1 / p sum_(i upright(" child of ") s) (R_i / R_s)^p z_i^p . $ <var:normalized-recursion>]
  The weights in this sum have total at most one.
  To keep track of the boundary mass, define for $s in A union H$
  $ W_s = 1 / R_s^p sum_(i in H : thin s prec.curly.eq i) \( v_i^sigma \)^p quad \( R_s > 0 \) \, #h(2em) W_s = 0 quad \( R_s = 0 \) . $
  The antichain bound gives $0 lt.eq W_s lt.eq 1$. At $s in H$ we have $W_s = z_s^p$, and at $s in A$ the quantity $W_s$ is the weighted sum of the child quantities with the weights in (7.6). For a node with remaining height $m = h - \| s \|$, we claim
  #[#set math.equation(numbering: n => "(7.7)")
   $ z_s gt.eq C_m W_s^(p^m) \, #h(2em) C_0 = 1 \, #h(2em) C_m = p^(- 1) C_(m - 1)^p . $ <var:normalized-iteration>]
  It holds at boundary nodes because $z_s = W_s^(1 \/ p)$, $0 lt.eq W_s lt.eq 1$, and $C_m lt.eq 1$. At nodes of $A$ of depth $h$, $W_s = 0$. For the induction step, insert the child bounds into (7.6) and apply Jensen to the power $p^m$, placing any missing weight at zero. This proves (7.7), including countably many children by the same Jensen inequality for a probability measure on a countable set.
  At the root,
  $ C_h = p^(- \( 1 + p + dots.h.c + p^(h - 1) \)) gt.eq exp \( - \( upright(e) - 1 \) \) \, #h(2em) p^(h + 1) lt.eq 2 upright(e) < 6 . $
  Indeed $p^h lt.eq upright(e)$ and $log p lt.eq p - 1$ bound the first geometric sum after taking logarithms. If $Y = 0$, the conclusion is immediate from $M_plus.minus gt.eq B$. Otherwise let $M = M_sigma = R_o$. The selected sign gives $W_o gt.eq \( Y \/ \( 4 M \) \)^p$, so $Y \/ \( 4 M \) lt.eq 1$. Equation (7.7) therefore yields
  $ M - B = 2 d_o gt.eq 2 M exp \( - \( upright(e) - 1 \) \) (frac(Y, 4 M))^6 . $
  Since $M lt.eq U$,
  $ M^2 - B^2 gt.eq M \( M - B \) gt.eq c_6 M^(- 4) Y^6 gt.eq c_6 U^(- 4) Y^6 . $
  The other squared endpoint norm is at least $B^2$, proving (7.5). If $x = 0$, then $U^2 = 2 Y^2$, and the same inequality holds directly because $c_6 lt.eq 8$. ◻
]

We can now sum the component estimate without a constant depending on the number of components or their heights.

#thm([Theorem 7.4.])[
  #emph[Let $x in X_(upright(v))$ have finite total support. In each component where $x^(\( h \)) eq.not 0$, choose a finite ancestral set $A_h$ containing that support. Suppose $y in X_(upright(v))$ vanishes on every such $A_h$. With $S = parallel x + y parallel_(upright(v))^2 + parallel x - y parallel_(upright(v))^2$, one has 
#[#set math.equation(numbering: n => "(7.8)")
 $ S - 2 parallel x parallel_(upright(v))^2 gt.eq c_6 S^(- 2) parallel y parallel_(upright(v))^6 \, #h(2em) c_6 = 2 exp \( - \( upright(e) - 1 \) \) 4^(- 6) . $ <var:sixth-sum>]

 The right side is zero when $S = 0$.]
] <var:sixth-stability>

#proof[
  Set $Y_h = nu_h \( y^(\( h \)) \)$ and $U_h^2 = nu_h \( x^(\( h \)) + y^(\( h \)) \)^2 + nu_h \( x^(\( h \)) - y^(\( h \)) \)^2$. Lemma 13 applies also to components with $x^(\( h \)) = 0$. Summing it reduces the assertion to
  $ sum_(U_h > 0) Y_h^6 / U_h^4 gt.eq S^(- 2) (sum_h Y_h^2)^3 . $
  For $S > 0$, this is Jensen for the cube with weights $U_h^2 \/ S$ and values $Y_h^2 \/ U_h^2$. Components with $U_h = 0$ have both vectors zero and can be omitted. The case $S = 0$ is immediate. ◻
]

=== 7.3 Accumulating the exit energy <accumulating-the-exit-energy>

The preceding proof chooses one sign and repeatedly raises a normalized boundary quantity to a power. We now keep both signs and retain the mass at every boundary level after it has left the head. This yields a different recurrence and the cubic estimate.

#thm([Lemma 7.5.])[
  #emph[Let $x \, y in E_h$, with $x$ supported on a finite ancestral set $A$ and $y$ zero on $A$. Put $M_sigma = nu_h \( x + sigma y \)$, $B = nu_h \( x \)$, and $M = max { M_(+) \, M_(-) }$. If $M > 0$, then 
#[#set math.equation(numbering: n => "(7.9)")
 $ frac(M_(+) + M_(-), 2) - B gt.eq c_3 frac(nu_h \( y \)^3, M^2) \, #h(2em) c_3 = \( 6 upright(e) \)^(- 3) . $ <var:cubic-component-eq>]

 This also holds for $x = 0$ and arbitrary $y$. When $M = 0$, both vectors are zero.]
] <var:cubic-component>

#proof[
  By homogeneity, assume $M = 1$, so $nu_h \( y \) lt.eq 1$. Use $p = p_h$, the common increments (7.3), and the same choice of tight label at each node as above. Denote that label by $S$ in a calculation at its chosen node; the children in that calculation use the parent’s label. For a nonterminal $s in A$, the subtraction that gave (7.6) gives
  #[#set math.equation(numbering: n => "(7.10)")
   $ sum_(i : thin s i in A) \( d_(s i)^sigma \)^p + sum_(i : thin s i in.not A) S_(s i) \( x + sigma y \)^p lt.eq p S_s \( x + sigma y \)^(p - 1) d_s^sigma . $ <var:layer-increment>]
  At an outside child, the two signs interchange $P \, Q$. Thus the sum of the second term over signs is the sum of the $p$th powers of both arrays for $y$, independently of the parent’s label.
  For $0 lt.eq j lt.eq h$, and for $0 lt.eq j < h$ respectively, define
  $ L_j^p = sum_(s in A\
\| s \| = j) sum_(sigma = plus.minus) \( d_s^sigma \)^p \, #h(2em) H_j^p = sum_(s in A\
\| s \| = j) sum_(i : thin s i in.not A) #scale(x: 120%, y: 120%)[\(] P_(s i) \( y \)^p + Q_(s i) \( y \)^p #scale(x: 120%, y: 120%)[\)] . $
  An empty sum is zero. Summing (7.10) gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ L_(j + 1)^p + H_j^p lt.eq p sum_(s in A\
\| s \| = j) sum_(sigma = plus.minus) S_s \( x + sigma y \)^(p - 1) d_s^sigma . $ <var:layer-sum>]
  The sum of $S_s \( x + sigma y \)^p$ on the right is at most two: for each sign, the sum of the $p$th powers of both arrays on a level is at most $P_o \( x + sigma y \)^p + Q_o \( x + sigma y \)^p lt.eq 1$. Moreover, the first-exit children form an antichain, so
  #[#set math.equation(numbering: n => "(7.12)")
   $ sum_(j < h) H_j^p lt.eq P_o \( y \)^p + Q_o \( y \)^p lt.eq nu_h \( y \)^p lt.eq 1 . $ <var:exit-mass>]
  The antichain argument includes infinitely many children by increasing finite subsets, as in Lemma 13.
  We retain the exit mass from all preceding levels by setting
  $ K_j = (L_j^p + sum_(i < j) H_i^p)^(1 \/ p) \, #h(2em) 0 lt.eq j lt.eq h . $
  Add $sum_(i < j) H_i^p$ to (7.11), bound it by $p sum_(i < j) H_i^(p - 1) H_i$, and apply Hölder to this list of terms together with the terms indexed by $\( s \, sigma \)$. The $p \/ \( p - 1 \)$ powers of the first factors sum to at most $2 + 1 = 3$, by the level bound and (7.12); the $p$th powers of the second factors sum to $K_j^p$. Therefore
  #[#set math.equation(numbering: n => "(7.13)")
   $ K_(j + 1)^p lt.eq p thin 3^(\( p - 1 \) \/ p) K_j . $ <var:accumulated-recursion>]
  Iterating gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ K_h lt.eq #scale(x: 120%, y: 120%)[\(] p thin 3^(\( p - 1 \) \/ p) #scale(x: 120%, y: 120%)[\)]^(sum_(i = 1)^h p^(- i)) K_0^(p^(- h)) lt.eq 3 upright(e) thin K_0^(p^(- h)) . $ <var:accumulated-bound>]
  For the last inequality, use $sum_(i = 1)^h p^(- i) lt.eq 1 \/ \( p - 1 \)$ and $p^(1 \/ \( p - 1 \)) lt.eq upright(e)$.
  It remains to relate the accumulated exit mass to the norm of $y$. On $A$, the two arrays for $y$ are equal, since $y_s = 0$. Their common $p$th power at a nonterminal node $s in A$ is
  $ sum_(i : thin s i in A) P_(s i) \( y \)^p + max {sum_(i : thin s i in.not A) P_(s i) \( y \)^p \, sum_(i : thin s i in.not A) Q_(s i) \( y \)^p} . $
  At nodes of $A$ of depth $h$ it is zero. Bounding each maximum by the sum of its two entries and iterating upward yields $P_o \( y \)^p lt.eq sum_(j < h) H_j^p$. Consequently
  $ nu_h \( y \) = 2 P_o \( y \) lt.eq 2 K_h . $
  Combining with (7.14), and using $p^h lt.eq upright(e) < 3$ and $0 lt.eq nu_h \( y \) \/ \( 6 upright(e) \) lt.eq 1$, gives
  $ K_0 gt.eq (frac(nu_h \( y \), 6 upright(e)))^(p^h) gt.eq (frac(nu_h \( y \), 6 upright(e)))^3 . $
  Finally,
  $ frac(M_(+) + M_(-), 2) - B = d_o^(+) + d_o^(-) gt.eq #scale(x: 120%, y: 120%)[\(] \( d_o^(+) \)^p + \( d_o^(-) \)^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) = K_0 . $
  This proves the normalized estimate and hence (7.9) by scaling. For $x = 0$ its left side is $nu_h \( y \) = M$, and the right side is $c_3 M lt.eq M$. ◻
]

#thm([Theorem 7.6.])[
  #emph[Let $x in X_(upright(v))$ have finite total support. In every component with $x^(\( h \)) eq.not 0$, choose a finite ancestral set $A_h$ containing its support, and let $y in X_(upright(v))$ vanish on these sets. If $R > 0$ and $parallel x + y parallel_(upright(v)) \, parallel x - y parallel_(upright(v)) lt.eq R$, then 
#[#set math.equation(numbering: n => "(7.15)")
 $ R^2 gt.eq parallel x parallel_(upright(v))^2 + frac(c_3, 2 sqrt(2) thin R) parallel y parallel_(upright(v))^3 \, #h(2em) c_3 = \( 6 upright(e) \)^(- 3) . $ <var:cubic-sum>]

]
] <var:cubic-stability>

#proof[
  In component $h$ write $B_h = nu_h \( x^(\( h \)) \)$, $Y_h = nu_h \( y^(\( h \)) \)$, $M_(h \, sigma) = nu_h \( x^(\( h \)) + sigma y^(\( h \)) \)$, $M_h = max_sigma M_(h \, sigma)$, and $m_h = \( M_(h \, +) + M_(h \, -) \) \/ 2$. Lemma 15, including its zero-center case, and $m_h gt.eq M_h \/ 2$ give
  $ frac(M_(h \, +)^2 + M_(h \, -)^2, 2) - B_h^2 gt.eq \( m_h - B_h \) \( m_h + B_h \) gt.eq c_3 / 2 Y_h^3 / M_h $
  whenever $M_h > 0$. When $M_h = 0$, both component vectors vanish. Hölder gives
  $ sum_h Y_h^2 lt.eq (sum_(M_h > 0) Y_h^3 / M_h)^(2 \/ 3) (sum_h M_h^2)^(1 \/ 3) . $
  Since $sum_h M_h^2 lt.eq 2 R^2$, summing the component inequalities proves (7.15). The same calculation for finite partial sums and monotone convergence justifies all infinite sums. ◻
]

The finite-head hypotheses in these two theorems do not require the perturbation to have finite support. Their proofs already use the completed component spaces and countable sums. The following consequence removes the finite-support restriction on the center when the perturbations form a weakly null sequence. It bounds the norm of the center from the size of weakly null midpoint perturbations.

#thm([Proposition 7.7.])[
  #emph[Let $x in X_(upright(v))$ and $0 < epsilon lt.eq 1$. Suppose $\( y_j \)$ is weakly null, $parallel y_j parallel_(upright(v)) gt.eq epsilon$, and $parallel x + y_j parallel_(upright(v)) \, parallel x - y_j parallel_(upright(v)) lt.eq 1$ for every $j$. Then 
#[#set math.equation(numbering: n => "(7.16)")
 $ parallel x parallel_(upright(v)) lt.eq theta \( epsilon \) := (1 - frac(c_3, 2 sqrt(2)) epsilon^3)^(1 \/ 2) < 1 . $ <var:theta>]

]
] <var:cubic-weak-null>

#proof[
  Fix $eta > 0$ and choose a vector $x'$ of finite total support with $parallel x - x' parallel_(upright(v)) < eta$. In its nonzero components, take finite ancestral sets containing the support, and let $P$ be the projection onto their union. Proposition 11 makes $P$ bounded and finite rank, so weak nullity gives $parallel P y_j parallel_(upright(v)) arrow.r 0$. Set $y'_j = y_j - P y_j$. The pair $x' \, y'_j$ satisfies the hypotheses of Theorem 16, with $R_j = 1 + eta + parallel P y_j parallel_(upright(v))$. Moreover, $liminf_j parallel y'_j parallel_(upright(v)) gt.eq epsilon$. First let $j arrow.r oo$ in (7.15) to obtain
  $ \( 1 + eta \)^2 gt.eq parallel x' parallel_(upright(v))^2 + frac(c_3 epsilon^3, 2 sqrt(2) \( 1 + eta \)) . $
  Then let $eta arrow.b 0$. This gives (7.16). ◻
]

===== 7.3.1 The averaged midpoint modulus. <the-averaged-midpoint-modulus.>

The finite-head estimate also gives

$ hat(delta)_(parallel dot.op parallel_(upright(v))) \( t \) gt.eq frac(c_3, 24 sqrt(2)) thin t^3 #h(2em) \( 0 < t < 1 \) . $

To see this, fix a finite unit center $x$ and let $F$ be the kernel of the finite coordinate projection onto ancestral sets containing its support in its nonzero components. For $y in F$ with $parallel y parallel_(upright(v)) = 1$, put $R = max { parallel x + t y parallel_(upright(v)) \, parallel x - t y parallel_(upright(v)) }$. The component inequalities $M_sigma gt.eq B$ in (7.3), together with the zero-center components, give $parallel x plus.minus t y parallel_(upright(v)) gt.eq 1$. Also $R lt.eq 1 + t < 2$. Theorem 16 therefore yields

$ R \( R + 1 \) \( R - 1 \) gt.eq frac(c_3, 2 sqrt(2)) thin t^3 \, #h(2em) R - 1 gt.eq frac(c_3, 12 sqrt(2)) thin t^3 . $

Since the other endpoint norm is at least one, their mean is at least $1 + \( R - 1 \) \/ 2$. For an arbitrary unit center $x_0$, approximate it by a finite unit center $x$. Replacing $x$ by $x_0$ loses at most $parallel x - x_0 parallel_(upright(v))$ in the mean, uniformly over unit $y in F$. The subspace $F$ is closed and finite codimensional by Proposition 11. Letting this approximation error tend to zero in the definition of the modulus proves the claim; unit directions suffice by the radius monotonicity established in the introduction.


#bibliography("refs.bib", style: "ieee", title: [References])
