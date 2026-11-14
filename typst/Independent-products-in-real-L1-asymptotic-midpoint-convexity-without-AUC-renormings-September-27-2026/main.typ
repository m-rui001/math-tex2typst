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

#align(center)[#text(size: 16pt, weight: "bold")[Independent products in real $L^1$: \
asymptotic midpoint convexity without AUC renormings]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <introduction>

A norm may force the average distance to two opposite points to grow in every sufficiently large direction,
  yet have no equivalent norm with the corresponding one-sided growth.
  We construct two explicit real $L^1$ spaces that exhibit this distinction.
  In both spaces, multiplying along a tree has two effects:
  fresh variables force midpoint growth, while path products of $L^1$ norm one prevent asymptotically uniformly
  convex renormings.

For a norm $N$ on an infinite-dimensional real Banach space $X$,
  let $"cof" \( X \)$ denote the closed linear subspaces of finite codimension.
  For $t > 0$, define the averaged asymptotic midpoint modulus and the usual one-sided asymptotic modulus
  #cite(label("JLPS2002")) Section 2.1 by

$ hat(delta)_N \( t \) & = inf_(N \( x \) = 1) sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) gt.eq 1) (frac(N \( x + t y \) + N \( x - t y \), 2) - 1) \,\
overline(delta)_N \( t \) & = inf_(N \( x \) = 1) sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) = 1) #scale(x: 120%, y: 120%)[\(] N \( x + t y \) - 1 #scale(x: 120%, y: 120%)[\)] . $

The norm is #emph[asymptotically uniformly convex] (AUC) if $overline(delta)_N \( t \) > 0$ for every $t > 0$.
  The subspace $F$ may depend on the center $x$ and on $t$; it must work for all the indicated directions.
  The standard asymptotic midpoint modulus uses unit directions $N \( y \) =
  1$ and replaces the displayed average by the maximum of the two norms.
  A norm is #emph[asymptotically midpoint uniformly convex] (AMUC) when this maximum modulus is positive for every
  $t > 0$ #cite(label("DKRRZ2016")) Definition 2.2. All numerical midpoint estimates below concern the displayed
  average. They imply the same lower bounds for the maximum, and hence AMUC, because the maximum dominates the average.

Let $cal(T) = bb(N)^(< omega)$ be the tree of finite sequences of positive integers, with root $diameter$.
  For a nonroot vertex $v$, write $v^(-)$ for its parent. Fix a positive nonconstant real random variable $W$ such that

$ bb(E) W = 1 \, wide m_2 := bb(E) W^2 < oo . $

On a countable product probability space take independent copies $W_v$, indexed by the nonroot vertices, and define

$ P_diameter = 1 \, wide P_v = P_(v^(-)) W_v \, wide X_W = overline("span"_(bb(R)) { P_v : v in cal(T) })^(thin L^1) . $

We use the inherited real $L^1$ norm, denoted by $lr(bar.v.double dot.op bar.v.double)_1$.
  Write $X_(upright("exp"))$ for the law with density $e^(- w)$ on $\( 0 \, oo \)$,
  and $X_(upright("sq"))$ for the law of $G^2$, where $G$ is a standard real Gaussian. For $K > 0$ set

$ c \( K \) = 1 / 16 bb(E) \( \| G \| - 2 K \)_(+) \, wide r_(+) = max { r \, 0 } . $

#thm([Theorem 1.1.])[
  #emph[For every multiplier $W$ as above, the Banach space $X_W$ is infinite dimensional and has no equivalent
    AUC norm. For the exponential and Gaussian-square laws, the inherited norms satisfy
#[#set math.equation(numbering: n => "(1)")
 $ hat(delta)_(X_(upright("exp"))) \( t \) & gt.eq frac(7 t, 30) c \( 10 \/ t \) > 0 &  & \( t > 0 \) \,\
hat(delta)_(X_(upright("sq"))) \( t \) & gt.eq
  frac(bb(P) #scale(x: 120%, y: 120%)[\(] \| G \| gt.eq 4 sqrt(2) \( 2 + sqrt(2) \) \/ t
  #scale(x: 120%, y: 120%)[\)], 8) > 0 &  & \( t > 0 \) \,\
hat(delta)_(X_(upright("sq"))) \( t \) & gt.eq
  frac(bb(P) #scale(x: 120%, y: 120%)[\(] \| G \| gt.eq 8 sqrt(6) \/ t #scale(x: 120%, y: 120%)[\)], 4) >
  0 &  & \( t > 0 \) . $ <eq:main-exp>]

]
] <thm:main>

The three estimates come from different scalar arguments, whose parameter-dependent forms are proved below.
  None of the displayed constants is asserted to be optimal.
  The general multiplier hypothesis is used for the renorming obstruction;
  the positive midpoint estimates are proved for the two specified laws.

=== Context and method <context-and-method>

Dilworth, Kutzarova, Randrianarivony, Revalski, and Zhivkov introduced AMUC and distinguished it from AUC for a
  given norm: they constructed an equivalent norm on $ell_2$ that is AMUC but is not AUC #cite(label("DKRRZ2016"))
  Theorem 2.4. The renorming question is different. They proved that an AMUC space with an unconditional Schauder
  basis admits an equivalent AUC norm, and asked whether this remains true for every AMUC space
  #cite(label("DKRRZ2016")) Section 5 and Proposition 5.1.

Baudier answered that question negatively. He proved that a closed subspace of $L^1$ whose unit ball is relatively
  compact in measure is AMUC, and applied this result to the Kadets–Werner space,
  which admits no equivalent AUC norm #cite(label("Baudier2026")) Theorem 1 and Corollary 1.
  His example also satisfies a linear lower bound for the maximum midpoint modulus #cite(label("Baudier2026"))
  final paragraph. Theorem 1 instead gives explicit spaces obtained from one repeated multiplier law,
  with direct proofs of quantitative bounds for the averaged modulus and of the renorming obstruction.

The construction has a useful relation to the multiplication step in the Bourgain–Rosenthal construction
  #cite(label("BourgainRosenthal1980")) as developed by Kadets and Werner #cite(label("KW2004")) Lemmas 2.2
  and 2.4. Their enlargement multiplies selected old vectors by fresh nonnegative variables,
  chosen anew at successive enlargement stages. Here one fixed positive law with finite second moment is repeated
  at every vertex. Our arguments concern this closed product span directly; they make no assertion of reflexivity,
  measure precompactness of its unit ball, or the Daugavet property.

The main difficulty in the midpoint estimate is uniformity over all directions in a subspace of finite
  codimension. Conditioning on the variables in a finite predecessor-closed subtree $T$ produces a finite-rank
  projection on $X_W$. In a finite linear combination of products in its kernel,
  the terms beyond $T$ can be grouped by their first vertices outside $T$.
  Each group factors into the multiplier at its first exit and a coefficient depending only on old coordinates and
  coordinates strictly below that exit. Fixing these coefficients leaves the exit multipliers independent.
  An independent-copy and random-sign argument controls the vector’s $L^1$ norm by the expected Euclidean size of
  its coefficient list. The scalar probability estimates then force a definite midpoint gain for every such list,
  even in the presence of an arbitrary shift.

The three scalar mechanisms are elementary but distinct. For exponential multipliers,
  a difference of independent copies is a Gaussian scale mixture,
  which gives positive expected excess past every fixed threshold.
  For Gaussian squares, an orthogonal change of variables turns the difference into a conditionally Gaussian
  variable. One proof transfers its tail probability back to the original shifted variable by a union bound.
  The other uses even convexity of the midpoint increment directly on the difference.

Section 2 establishes the finite-rank projections, the two coefficient estimates,
  and the common passage to completed tails and arbitrary centers. Section 3 treats the exponential law.
  Section 4 gives the two Gaussian routes. Section 5 proves the renorming obstruction locally:
  path products have norm one, but their child increments are weakly null with fixed positive norm.
  An AUC renorming would force geometric growth along a selected branch, contradicting boundedness.

== 2 Finite conditional kernels and fresh multipliers <sec:conditional>

We first construct the subspaces of finite codimension needed for the midpoint estimates.
  The point is that conditioning on finitely many coordinates has finite rank on the actual closed span $X_W$.

Independence and positivity give

#[#set math.equation(numbering: n => "(2)")
 $ lr(bar.v.double P_v bar.v.double)_1 = 1 \, wide bb(E) P_v^2 = m_2^(\| v \|) . $ <prob:product-moments>]

As a closed subspace of $L^1$, $X_W$ is a Banach space. The first-generation differences $P_(\( n \)) - 1 =
  W_(\( n \)) - 1$ are nonzero and pairwise orthogonal in $L^2$, so every finite subset is linearly independent,
  also as elements of $L^1$. Thus $X_W$ is infinite dimensional.
  The first-generation products themselves are also linearly independent:
  taking expectations in a relation $sum_n a_n W_(\( n \)) = 0$ gives $sum_n a_n = 0$,
  reducing it to the corresponding relation among the orthogonal differences.
  Rational finite combinations of the countable family of products are dense, so $X_W$ is separable.

Let $T subset cal(T)$ be finite, contain the root, and contain every predecessor of each of its vertices.
  Write $cal(G)_T$ for the $sigma$-field generated by the coordinates $W_v$ with $v in T \\ { diameter }$.
  For $v in cal(T)$, let $v_T$ be its last ancestor in $T$. Conditional expectation satisfies

#[#set math.equation(numbering: n => "(3)")
 $ Q_T P_v := bb(E) \( P_v divides cal(G)_T \) = P_(v_T) . $ <prob:head-projection>]

Consequently $Q_T$ restricts to a contractive projection of $X_W$ onto the finite-dimensional space

$ E_T = "span" { P_v : v in T } \, wide F_T = ker \( Q_T \|_(X_W) \) in "cof" \( X_W \) . $

This assertion on the completion follows from the continuity of conditional expectation and the closedness of
  $E_T$. Applying $I - Q_T$ to finite-product approximations shows that finite-product combinations in $F_T$ are
  dense in $F_T$.

The same space and tails can also be described using increments.
  Put $u_v = P_v - P_(v^(-))$ for $v eq.not diameter$. Telescoping along paths shows that ${ 1 \, u_v :
  v eq.not diameter }$ and ${ P_v : v in cal(T) }$ have the same algebraic span.
  Formula (3) gives $Q_T u_v = u_v$ for $v in T$ and $Q_T u_v = 0$ for $v in.not T$.
  Applying $I - Q_T$ to the algebraic span and then passing to its closure proves

#[#set math.equation(numbering: n => "(4)")
 $ F_T = overline("span" { u_v : v in.not T })^(thin L^1) . $ <prob:jump-tail>]

For $t > 0$ and $x \, y in X_W$, define the midpoint increment

$ M_t \( x \, y \) = frac(lr(bar.v.double x + t y bar.v.double)_1 + lr(bar.v.double x - t y bar.v.double)_1, 2) -
  lr(bar.v.double x bar.v.double)_1 . $

The real scalar identity $\( \| a + b \| + \| a - b \| \) \/ 2 = max { \| a \| \, \| b \| }$ gives

#[#set math.equation(numbering: n => "(5)")
 $ M_t \( x \, y \) = bb(E) \( t \| y \| - \| x \| \)_(+) . $ <prob:midpoint-identity>]

For $u in E_T$ and $y in F_T$, we seek a lower bound on this excess in terms of
  $lr(bar.v.double y bar.v.double)_1$ and $lr(bar.v.double u bar.v.double)_1$, uniform over $T$.
  Since $u$ is $cal(G)_T$-measurable, we first separate the fresh multipliers in $y$ from the coordinates
  determining $u$.

Now write a finite-product combination in the kernel as $y = sum_(v in S) alpha_v P_v in F_T$,
  where $S subset cal(T)$ is finite. Write $w prec.curly.eq v$ when $w$ is an ancestor of $v$,
  including $v$ itself, and use $w prec v$ for strict ancestry.
  Let $I$ be the finite set of first vertices outside $T$ on paths to vertices of $S \\ T$.
  Factoring out the multiplier at each such exit gives

$ d = sum_(v in S ∩ T) alpha_v P_v \, wide B_i = P_(i^(-)) sum_(v in S\
i prec.curly.eq v) alpha_v product_(i prec w prec.curly.eq v) W_w quad \( i in I \) \, $

where an empty product is $1$. Thus $d$ is $cal(G)_T$-measurable,
  and $B_i$ depends only on old coordinates and on strict descendants of $i$, not on $W_i$.
  Put $m_i = bb(E) \( B_i divides cal(G)_T \)$. The factorization and the condition $Q_T y = 0$ yield

#[#set math.equation(numbering: n => "(6)")
 $ y = d + sum_(i in I) W_i B_i \, wide d = - sum_(i in I) m_i \, wide sigma =
   #scale(x: 180%, y: 180%)[\(] sum_(i in I) B_i^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $ <prob:first-exit>]

Distinct first-exit vertices have disjoint descendant subtrees.
  Hence, conditionally on $cal(G)_T$, the $B_i$ are independent,
  and their entire vector is independent of the first-exit variables $W_i$.
  In particular, conditioning further on all $B_i$ leaves the $W_i$ independent with their original law. Write

$ cal(H)_T = cal(G)_T or sigma \( B_i : i \) . $

We will condition on $cal(G)_T$ when copying entire coefficients,
  and on $cal(H)_T$ when resampling only first-exit multipliers. Figure 1 illustrates this distinction.
  All quantities used here are integrable; in fact the finite products belong to $L^2$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.6), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((0, 1.635), [$nothing$], anchor: "south")
  circle((-1.7, 0.8), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  circle((1.7, 0.8), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  circle((-2.5, 0), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  circle((-0.9, 0), radius: 0.1247, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.8647, 0), [$i$], anchor: "west")
  circle((0.9, 0), radius: 0.1247, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.8647, 0), [$j$], anchor: "east")
  circle((2.5, 0), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  line((0, 1.6), (-1.7, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.7, 0.8), (-2.5, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.5, 0), (-1.7, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.7, 0.8), (-0.9, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.9, 0), (0, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 1.6), (1.7, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.7, 0.8), (0.9, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.9, 0), (1.7, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.7, 0.8), (2.5, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.9, 0), (-1.55, -1), (-0.25, -1), close: true, stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.9, 0), (0.25, -1), (1.55, -1), close: true, stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((-0.9, -1.7), [data in#linebreak()$B_i$])
  content((0.9, -1.7), [data in#linebreak()$B_j$])
  content((3.3, 1.4), [old data:#linebreak()$cal(G)_T$])
  content((-3.15, -0.45), [$dots.h$])
  content((3.15, -0.45), [$dots.h$])
})],
  caption: [Figure 1: A finite predecessor-closed set $T$ (solid vertices) and two first-exit vertices $i \, j$ (open vertices). Only $W_i \, W_j$ are resampled after the coefficients $B_i \, B_j$ have been fixed. Those coefficients may depend on the old coordinates and on the disjoint strict descendant subtrees (triangles). Only finitely many exits occur in a finite linear combination; the ambient tree has countably many children at every vertex. ],
) <fig:exit>

The next two estimates measure the size of a tail vector by the expected Euclidean size of its coefficient list.
  Their upper bounds on $lr(bar.v.double y bar.v.double)_1$ give lower bounds on $bb(E) sigma$,
  which the scalar estimates in Sections 3 and 4 will convert into midpoint gains.
  They use independent-copy symmetrization followed by averaging over independent signs;
  this is the standard symmetrization method, here applied conditionally on the old coordinates
  #cite(label("BartlettMendelson2002")) proof of Theorem 8, p. 468. Both constants will be useful:
  they come from different ways of centering the sum.

#thm([Lemma 2.1.])[
  (Two first-moment estimates).  #emph[For the representation (6),
#[#set math.equation(numbering: n => "(7)")
 $ lr(bar.v.double y bar.v.double)_1 & lt.eq #scale(x: 120%, y: 120%)[\(] sqrt(m_2 - 1) +
   2 #scale(x: 120%, y: 120%)[\)] bb(E) sigma \,\
lr(bar.v.double y bar.v.double)_1 & lt.eq 2 sqrt(m_2) thin bb(E) sigma . $ <prob:first-moment-centered>]

 Both inequalities also hold conditionally on $cal(G)_T$, with $bb(E) \( \| y \| divides cal(G)_T \)$ and
   $bb(E) \( sigma divides cal(G)_T \)$ in place of the unconditional first moments.]
] <prob:first-moment>

#proof[
  Work conditionally on $cal(G)_T$, suppressing this conditioning in the expectation notation throughout the
    proof. Integrating the resulting inequalities gives the unconditional statements. First write
  $ y = sum_i B_i \( W_i - 1 \) + sum_i \( B_i - m_i \) . $
  After fixing all $B_i$, the first sum has mean zero and second moment $\( m_2 - 1 \) sigma^2$.
    Its expected absolute value is thus at most $sqrt(m_2 - 1) thin bb(E) sigma$ after averaging over the $B_i$.
    For the second sum, take independent copies $B'_i$ of the independent $B_i$.
    Jensen’s inequality, independent random signs $epsilon_i$, and Cauchy–Schwarz give
  $ bb(E) \| sum_i \( B_i - m_i \) \| & lt.eq bb(E) \| sum_i \( B_i - B'_i \) \|\
 & = bb(E) bb(E)_epsilon \| sum_i epsilon_i \( B_i - B'_i \) \|\
 & lt.eq bb(E) #scale(x: 180%, y: 180%)[\(] sum_i \( B_i - B'_i \)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq
   2 bb(E) sigma . $
  The equality uses independence and symmetry of the differences. Combining the two estimates proves (7) conditionally.
  For the other estimate, put $U_i = W_i B_i$. These variables are independent, and $y =
    sum_i \( U_i - bb(E) U_i \)$. Symmetrizing with independent copies $U'_i$ and inserting independent signs as
    above yields
  $ bb(E) \| y \| & lt.eq bb(E) bb(E)_epsilon \| sum_i epsilon_i \( U_i - U'_i \) \|\
 & lt.eq 2 bb(E) bb(E)_epsilon \| sum_i epsilon_i U_i \| lt.eq
   2 bb(E) #scale(x: 180%, y: 180%)[\(] sum_i W_i^2 B_i^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $
  With the $B_i$ fixed, concavity of the square root bounds the expectation over the $W_i$ of
    $#scale(x: 120%, y: 120%)[\(] sum_i W_i^2 B_i^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)$ by $sqrt(m_2) thin
    sigma$. Averaging over the $B_i$ proves (7) conditionally on $cal(G)_T$. ◻
]

The preceding construction applies to finite-product tails.
  To pass midpoint estimates to their closure, the triangle inequality gives

#[#set math.equation(numbering: n => "(8)")
 $ \| M_t \( x \, y \) - M_t \( x' \, y' \) \| lt.eq 2 lr(bar.v.double x - x' bar.v.double)_1 +
   t lr(bar.v.double y - y' bar.v.double)_1 . $ <prob:continuity>]

Thus all tail estimates below pass to the completed tail subspace before we impose the condition
  $lr(bar.v.double y bar.v.double)_1 gt.eq 1$.

#thm([Lemma 2.2.])[
  (Passage to completed tails and arbitrary centers).  #emph[Fix $t > 0$ and nonnegative constants $A \, B$.
    Suppose that, for every finite predecessor-closed $T$, every $u in E_T$,
    and every finite-product combination $y in F_T$,
$ M_t \( u \, y \) gt.eq A lr(bar.v.double y bar.v.double)_1 - B lr(bar.v.double u bar.v.double)_1 . $

 Then this inequality holds for all $y in F_T$, and
$ hat(delta)_(X_W) \( t \) gt.eq max { 0 \, A - B } . $

]
] <lem:affine>

#proof[
  The first assertion follows from density in $F_T$ and (8).
    For a unit vector $x$ and any $epsilon > 0$, choose a finite-product combination $u$ with
    $lr(bar.v.double x - u bar.v.double)_1 < epsilon$, and let $T$ contain the root and all its support paths.
    Then $u in E_T$, $lr(bar.v.double u bar.v.double)_1 lt.eq 1 + epsilon$,
    and every $y in F_T$ with $lr(bar.v.double y bar.v.double)_1 gt.eq 1$ satisfies
  $ M_t \( x \, y \) gt.eq A - B - \( B + 2 \) epsilon . $
  For this fixed $x$, take the supremum over finite-codimensional subspaces and let $epsilon arrow.b 0$.
    The resulting bound $A - B$ is independent of $x$, so it survives the final infimum.
    The scalar midpoint identity also gives the lower bound zero. ◻
]

The lemma is applied to norm inequalities, not to an infinite first-exit expansion.
  Thus no representation or extra integrability of a general completed tail is needed.
  It also fixes the order of choices: $t$ and $x$ determine $T$ before the direction $y$ is allowed to vary.

== 3 Exponential products: a uniform excess estimate <sec:exponential>

The exponential law supplies positive expected excess beyond every multiple of the coefficient size.
  A Gaussian scale mixture makes that excess uniform over all real coefficient lists and all shifts.
  Take $W = Z$ to have the exponential distribution with density $e^(- z)$ on $\( 0 \, oo \)$,
  and write $X_(upright("exp")) = X_Z$. Here $m_2 = 2$, so Lemma 2 gives $lr(bar.v.double y bar.v.double)_1 lt.eq
  3 bb(E) sigma$. Let $G$ denote a standard real Gaussian and put, for $K > 0$,

#[#set math.equation(numbering: n => "(9)")
 $ c \( K \) = 1 / 16 bb(E) \( \| G \| - 2 K \)_(+) > 0 . $ <prob:excess-constant>]

The Laplace distribution as a Gaussian scale mixture belongs to the theory of normal scale mixtures
  #cite(label("AndrewsMallows1974")); the characteristic-function calculation below proves the exact identity
  needed here. We prove the uniform conditional bound

#[#set math.equation(numbering: n => "(10)")
 $ bb(E) #scale(x: 120%, y: 120%)[\(] \( \| y \| - K sigma \)_(+) divides cal(G)_T \, \( B_i \)_i
   #scale(x: 120%, y: 120%)[\)] gt.eq c \( K \) sigma . $ <prob:exponential-excess>]

After conditioning as indicated, all coefficients, $d$, and $sigma$ are fixed.
  Resample only the exponential multipliers to obtain $y'$ with the same conditional law.
  The triangle inequality and the positive-part inequality give

$ 2 bb(E) \( \| y \| - K sigma \)_(+) gt.eq bb(E) \( \| y - y' \| - 2 K sigma \)_(+) . $

The difference of two independent standard exponentials has characteristic function $\( 1 + q^2 \)^(- 1)$ at $q in
  bb(R)$. This also equals $bb(E) exp \( - q^2 U \)$ for a standard exponential $U$,
  so that difference has the law of $sqrt(2 U) thin G$, with $U$ and $G$ independent.
  Using independent such representations for the different multipliers,
  if $sigma > 0$ the law of $\( y - y' \) \/ sigma$ is a centered Gaussian mixture with variance

$ V = frac(2 sum_i B_i^2 U_i, sigma^2) \, wide bb(E) V = 2 \, wide bb(E) V^2 =
  4 (1 + frac(sum_i B_i^4, sigma^4)) lt.eq 8 . $

Since $bb(E) \[ V upright(bold(1))_({ V gt.eq 1 }) \] gt.eq 1$, Cauchy–Schwarz gives $bb(P) \( V gt.eq 1 \) gt.eq
  1 \/ 8$. On that event the Gaussian excess above $2 K$ is at least $bb(E) \( \| G \| - 2 K \)_(+)$. Hence

$ bb(E) \( \| y - y' \| - 2 K sigma \)_(+) gt.eq sigma / 8 bb(E) \( \| G \| - 2 K \)_(+) \, $

which proves (10). For $sigma = 0$ the asserted lower bound is zero, so the conclusion holds without normalization.

#thm([Proposition 3.1.])[
  #emph[For every $t \, K > 0$, the exponential product space satisfies
#[#set math.equation(numbering: n => "(11)")
 $ hat(delta)_(X_(upright("exp"))) \( t \) gt.eq c \( K \) (t / 3 - 1 / K)_(+) . $ <eq:exponential-parameter>]

 In particular, the exponential estimate in Theorem 1 holds.]
] <prop:exponential>

#proof[
  Fix $u in E_T$ and a finite-product combination $y in F_T$.
    The event $A = { \| u \| lt.eq t K sigma }$ is fixed under conditioning on $cal(H)_T$.
    Since $sigma upright(bold(1))_(A^c) lt.eq \| u \| \/ \( t K \)$, the conditional excess estimate gives
  $ M_t \( u \, y \) & gt.eq t bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_A \( \| y \| - K sigma \)_(+)
    #scale(x: 120%, y: 120%)[\]] gt.eq t c \( K \) bb(E) \( sigma upright(bold(1))_A \)\
 & gt.eq t c \( K \) bb(E) sigma - frac(c \( K \), K) lr(bar.v.double u bar.v.double)_1 gt.eq
   c \( K \) (t / 3 lr(bar.v.double y bar.v.double)_1 - 1 / K lr(bar.v.double u bar.v.double)_1) . $
  Apply Lemma 3. At $K = 10 \/ t$ this gives $7 t c \( 10 \/ t \) \/ 30$, as asserted in Theorem 1. ◻
]

#prodef([Remark 3.2.])[
  (A fixed-error passage from finite tails).  The excess estimate also permits a direct passage using a fixed
    positive approximation tolerance, rather than letting the center error tend to zero as in Lemma 3.
    Fix $t > 0$, a finite predecessor-closed subtree $T$ containing the root, $u in E_T$,
    and a finite-product combination $y in F_T$. If $lr(bar.v.double u bar.v.double)_1 lt.eq
    2$ and $lr(bar.v.double y bar.v.double)_1 gt.eq 9 \/ 10$, then $bb(E) sigma gt.eq 3 \/ 10$.
    On $A = { \| u \| lt.eq 10 sigma }$, at least $1 \/ 10$ of the expected coefficient size remains,
    because $bb(E) \( sigma upright(bold(1))_(A^c) \) lt.eq 1 \/ 5$. Consequently (10), with $K = 10 \/ t$, gives
  $ M_t \( u \, y \) gt.eq t / 10 c \( 10 \/ t \) . $
  Finite-tail approximation extends this last bound to every $y in F_T$ with $lr(bar.v.double y bar.v.double)_1
    gt.eq 1$. Put $L_t = t c \( 10 \/ t \) \/ 10$. Approximating a unit center with error less than $min { 1 \,
    L_t \/ 4 }$ ensures $lr(bar.v.double u bar.v.double)_1 < 2$ and loses less than $L_t \/ 2$ by (8).
    Thus this passage gives the weaker estimate $hat(delta)_(X_(upright("exp"))) \( t \) gt.eq
    t c \( 10 \/ t \) \/ 20$ for every $t > 0$ directly, without using the affine conclusion of Lemma 3.
] <rem:finite-head>

== 4 Gaussian squares: two scalar mechanisms <sec:gaussian>

Now take $W = G^2$, where $G$ is standard Gaussian, and put $X_(upright("sq")) = X_(G^2)$. Here $m_2 = 3$.
  In particular, the product and jump descriptions above give the same closed subspace with the same norm.
  We first establish the Gaussian difference calculation that both estimates will use,
  while keeping their subsequent probability and convexity steps separate.

For fixed real coefficients $a_1 \, dots.h \, a_k$ and a fixed $b in bb(R)$, put

$ H = b + sum_i a_i \( G_i^2 - 1 \) \, wide s = #scale(x: 180%, y: 180%)[\(] sum_i a_i^2
  #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) \, $

where the $G_i$ are independent standard Gaussians. Let $H'$ be an independent copy with the same coefficients and
  shift. The Gaussian polarization identity used in decoupling #cite(label("LevinaVershynin2012")) proof of
  Lemma 3.2 is especially simple here. The orthogonal change of variables $A_i = \( G_i + G'_i \) \/ sqrt(2)$,
  $C_i = \( G_i - G'_i \) \/ sqrt(2)$ shows that

$ H - H' med upright("has law") med 2 sum_i a_i A_i C_i \, $

where all $A_i \, C_i$ are independent standard Gaussians.
  Conditionally on the $A_i$, this is Gaussian with variance $4 V$, where

$ V = sum_i a_i^2 A_i^2 \, wide bb(E) V = s^2 \, wide bb(E) V^2 = s^4 + 2 sum_i a_i^4 lt.eq 3 s^4 . $

This is the elementary second-moment step usually called the Paley–Zygmund inequality
  #cite(label("PaleyZygmund1932Series")) #cite(label("PaleyZygmund1932Note")). We include the argument:
  for $s > 0$, the inequality $bb(E) \[ V upright(bold(1))_({ V gt.eq s^2 \/ 2 }) \] gt.eq
  s^2 \/ 2$ and Cauchy–Schwarz yield $bb(P) \( V gt.eq s^2 \/ 2 \) gt.eq 1 \/ 12$.
  On this event the conditional standard deviation of $H - H'$ is at least $sqrt(2) s$. Consequently, for every $K > 0$,

#[#set math.equation(numbering: n => "(12)")
 $ bb(P) \( \| H - H' \| gt.eq 2 K s \) gt.eq q_K \, wide q_K =
   frac(bb(P) \( \| G \| gt.eq sqrt(2) K \), 12) > 0 . $ <prob:gaussian-difference>]

The event in (12) has probability one when $s = 0$, so the same statement remains valid in that case.

#thm([Proposition 4.1.])[
  (Shifted Gaussian tails).  #emph[With $C = 2 + sqrt(2)$, for every $t \, lambda > 0$,
#[#set math.equation(numbering: n => "(13)")
 $ hat(delta)_(X_(upright("sq"))) \( t \) gt.eq frac(bb(P) \( \| G \| gt.eq sqrt(2) lambda \), 24)
   (frac(t lambda, C) - 1)_(+) . $ <eq:gaussian-parameter-24>]

]
] <prob:gaussian-24>

#proof[
  For the preceding fixed-coefficient variables, $\| H - H' \| gt.eq 2 lambda s$ requires $\| H \| gt.eq
    lambda s$ or $\| H' \| gt.eq lambda s$. Their equal laws and (12) therefore imply the shift-uniform estimate
  #[#set math.equation(numbering: n => "(14)")
   $ bb(P) \( \| H \| gt.eq lambda s \) gt.eq p_lambda \, wide p_lambda =
     frac(bb(P) \( \| G \| gt.eq sqrt(2) lambda \), 24) . $ <prob:gaussian-shifted>]
  Again the zero-coefficient case is immediate.
  For a finite-product $y in F_T$, condition on the old coordinates and all $B_i$ in (6).
    It has the required form with $a_i = B_i$ and shift $b = d + sum_i B_i$. Thus, for $x_0 in E_T$,
  #[#set math.equation(numbering: n => "(15)")
   $ M_t \( x_0 \, y \) & gt.eq p_lambda bb(E) \( t lambda sigma - \| x_0 \| \)_(+)\
 & gt.eq p_lambda #scale(x: 120%, y: 120%)[\(] t lambda bb(E) sigma -
   lr(bar.v.double x_0 bar.v.double)_1 #scale(x: 120%, y: 120%)[\)] gt.eq
   p_lambda (frac(t lambda, C) lr(bar.v.double y bar.v.double)_1 - lr(bar.v.double x_0 bar.v.double)_1) .
   $ <prob:gaussian-24-gain>]
  The last step uses (7) with $m_2 = 3$. Lemma 3 now proves (13).
    Taking $lambda = 4 C \/ t$ gives the first Gaussian bound in Theorem 1 for every $t > 0$. ◻
]

#thm([Proposition 4.2.])[
  (Convex comparison with a Gaussian difference).  #emph[For every $t \, K > 0$, the same norm satisfies
#[#set math.equation(numbering: n => "(16)")
 $ hat(delta)_(X_(upright("sq"))) \( t \) gt.eq frac(bb(P) \( \| G \| gt.eq sqrt(2) K \), 12)
   (frac(t K, 2 sqrt(3)) - 1)_(+) . $ <eq:gaussian-parameter-12>]

]
] <prob:gaussian-12>

#proof[
  For a finite-product $y in F_T$, fix the old coordinates and the $B_i$,
    and resample only the first-exit Gaussian squares to obtain $tilde(y)$.
    These variables have the same conditional law. Applying (12) to their difference gives
  #[#set math.equation(numbering: n => "(17)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \| y - tilde(y) \| gt.eq
     2 K sigma divides cal(G)_T \, \( B_i \)_i #scale(x: 120%, y: 120%)[\)] gt.eq
     q_K . $ <prob:conditional-gaussian-difference>]
  For fixed old coordinates and $x_0 in E_T$, the function $phi.alt \( v \) = \( t \| v \| - \| x_0 \| \)_(+)$ is
    even and convex. Hence
  $ phi.alt #scale(x: 120%, y: 120%)[\(] \( y - tilde(y) \) \/ 2 #scale(x: 120%, y: 120%)[\)] lt.eq 1 /
    2 #scale(x: 120%, y: 120%)[\(] phi.alt \( y \) + phi.alt \( - tilde(y) \) #scale(x: 120%, y: 120%)[\)] . $
  Taking conditional expectations given $cal(H)_T$ and then integrating gives $bb(E) phi.alt \( y \) gt.eq
    bb(E) phi.alt \( \( y - tilde(y) \) \/ 2 \)$. Combining this inequality with (17) and (7), now with $m_2 = 3$,
    yields
  #[#set math.equation(numbering: n => "(18)")
   $ M_t \( x_0 \, y \) & gt.eq bb(E) \( t \| y - tilde(y) \| \/ 2 - \| x_0 \| \)_(+)\
 & gt.eq q_K bb(E) \( t K sigma - \| x_0 \| \)_(+)\
 & gt.eq q_K (frac(t K, 2 sqrt(3)) lr(bar.v.double y bar.v.double)_1 - lr(bar.v.double x_0 bar.v.double)_1) .
   $ <prob:gaussian-12-gain>]
  This argument uses the probability of a difference directly;
    the convexity step is what preserves the denominator $12$ in $q_K$. Apply Lemma 3 to this affine bound.
    This proves (16). Taking $K = 8 sqrt(3) \/ t$ yields the second Gaussian bound in Theorem 1 for every $t > 0$. ◻
]

The two proofs control different scalar quantities. Proposition 6 first estimates a shifted original variable and
  pays a factor of two in the union bound. Proposition 7 estimates a difference and uses even convexity directly
  in the midpoint increment, preserving the denominator $12$.
  Their first-moment constants are respectively $2 + sqrt(2)$ and $2 sqrt(3)$.
  Neither proof requires the original shifted variable to be symmetric.

== 5 Bounded paths exclude AUC renormings <sec:obstruction>

The midpoint arguments depend on the multiplier distribution.
  Here we use only positivity, a nonconstant mean-one law, and a finite second moment to rule out AUC renormings.
  At every vertex the child increments are weakly null and have the same positive norm.
  An AUC norm would therefore grow by a fixed factor at each step of a suitably chosen branch,
  whereas all path products have inherited norm one.

For each fixed vertex $v$ and its children $v^frown n$, put

$ D_(v \, n) = P_(v^frown n) - P_v = P_v \( W_(v^frown n) - 1 \) . $

Independence and (2) give

#[#set math.equation(numbering: n => "(19)")
 $ lr(bar.v.double D_(v \, n) bar.v.double)_1 = rho := bb(E) \| W - 1 \| > 0 \, wide bb(E) D_(v \, n)^2 =
   m_2^(\| v \|) \( m_2 - 1 \) . $ <prob:child-moments>]

For fixed $v$ the sequence $\( D_(v \, n) \)_n$ is pairwise orthogonal in $L^2$ and has constant finite $L^2$
  norm. Bessel’s inequality therefore makes it weakly null in $L^2$.
  The inclusion $L^2 arrow.r L^1$ is continuous on this probability space.
  Moreover, each continuous linear functional on $X_W$ extends to $L^1$ by Hahn–Banach and hence restricts to a
  continuous functional on $L^2$. Thus $\( D_(v \, n) \)_n$ is weakly null in $X_W$ itself.

Suppose $N$ is equivalent to the inherited norm, with $a lr(bar.v.double z bar.v.double)_1 lt.eq N \( z \) lt.eq
  b lr(bar.v.double z bar.v.double)_1$ for $0 < a lt.eq b < oo$. We will show the precise obstruction

#[#set math.equation(numbering: n => "(20)")
 $ overline(delta)_N (frac(a rho, 2 b)) = 0 . $ <eq:auc-zero>]

The usual one-sided modulus is nonnegative: for each unit center $x$,
  a norming functional gives a finite-codimensional kernel on which $N \( x + t y \) gt.eq 1$.
  It remains to rule out positivity at the displayed scale.

Assume, to the contrary, that

$ t_0 = frac(a rho, 2 b) \, wide delta = overline(delta)_N \( t_0 \) > 0 \, wide gamma = delta \/ 2 . $

At a vertex $v$, we have $a lt.eq N \( P_v \) lt.eq b$. The modulus at the unit center $P_v \/
  N \( P_v \)$ supplies a closed finite-codimensional subspace $F$ such that

$ N \( P_v + z \) gt.eq \( 1 + gamma \) N \( P_v \) quad \( z in F \, med N \( z \) gt.eq t_0 N \( P_v \) \) . $

Indeed, its definition first gives the estimate at equality of the radius.
  For $N \( x \) = N \( w \) = 1$, with $w in F$ and $r gt.eq t_0$, convexity yields

$ N \( x + r w \) - 1 gt.eq r / t_0 #scale(x: 120%, y: 120%)[\(] N \( x + t_0 w \) - 1 #scale(x: 120%, y: 120%)[\)] \, $

so the estimate extends to all larger radii.

Equivalent norms induce the same weak topology. The quotient images of the weakly null sequence $D_(v \, n)$ in
  the finite-dimensional space $X_W \/ F$ therefore tend to zero in quotient norm.
  We may choose $z_n in F$ with $N \( D_(v \, n) - z_n \) arrow.r 0$. Eventually

$ N \( z_n \) gt.eq a rho \/ 2 = t_0 b gt.eq t_0 N \( P_v \) . $

Choose such an $n$ with approximation error at most $gamma N \( P_v \) \/ 2$. Then

$ N \( P_(v^frown n) \) gt.eq N \( P_v + z_n \) - N \( D_(v \, n) - z_n \) gt.eq \( 1 + gamma \/ 2 \) N \( P_v \) . $

The same $gamma$ works at every vertex, although $F$ and $n$ may change.
  Repeatedly selecting a child gives a depth-$k$ product with norm at least $a \( 1 + delta \/ 4 \)^k$,
  contrary to the uniform upper bound $b$. This proves (20) and the renorming assertion of Theorem 1.

Finally $0 < rho < 2$: nonconstancy gives positivity, and $bb(E) \| W - 1 \| = 2 - 2 bb(E) min { W \,
  1 } < 2$ because $W > 0$ almost surely. Thus $0 < t_0 < 1$,
  so positivity of the one-sided modulus on $\( 0 \, 1 \)$ alone would already contradict the tree.
  For exponential multipliers $rho = 2 \/ e$; indeed $bb(E) \| Z - 1 \| = 2 bb(E) \( Z - 1 \)_(+) =
  2 integral_1^oo e^(- s) thin d s$. The weak-null calculation requires only a finite $L^2$ bound at each fixed
  parent, not a bound uniform over the depth.

#bibliography("refs.bib", style: "ieee", title: [References])
