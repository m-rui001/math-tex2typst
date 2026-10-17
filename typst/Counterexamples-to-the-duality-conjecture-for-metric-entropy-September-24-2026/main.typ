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

#align(center)[#text(size: 16pt, weight: "bold")[Counterexamples to the duality conjecture \
for metric entropy]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For bounded sets $A \, B$ in a finite-dimensional real vector space, with $B$ having nonempty interior, let $N \( A \, B \)$ denote the least number of translates of $B$ that cover $A$. The translation vectors may lie anywhere in the ambient space. For an origin-symmetric convex body $K subset bb(R)^n$, its polar is

$ K^compose = { y in bb(R)^n : chevron.l x \, y chevron.r lt.eq 1 upright(" for every ") x in K } . $

Here a convex body is compact and has nonempty interior. All logarithms are natural.

The duality conjecture for metric entropy, originating in Pietsch’s operator-theoretic work in 1972, asks whether there are absolute constants $a \, b gt.eq 1$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ 1 / b log N \( L^compose \, a K^compose \) lt.eq log N \( K \, L \) lt.eq b log N \( L^compose \, a^(- 1) K^compose \) $ <eq:duality-conjecture>]

for every dimension and every pair of origin-symmetric convex bodies $K \, L$; see #cite(label("AMSTJ2004")) Conjecture 1. It asks whether passing to the polar pair preserves covering complexity up to universal changes of scale and multiplicative constants.

We disprove the full conjecture.

#thm([Theorem 1.1.])[
  #emph[For every $a \, b gt.eq 1$, there are a positive integer $n$ and an origin-symmetric convex body $K subset bb(R)^n$ such that, with $L = \[ - 1 \, 1 \]^n$, 
$ log N \( K \, L \) > b log N \( L^compose \, a^(- 1) K^compose \) . $

]
] <thm:main>

Thus the upper bound in (1.1) fails for every proposed pair of absolute constants. In particular, the two-sided duality conjecture has a negative answer. The bodies in Theorem 1 have nonempty interior in the full ambient dimension. Their dimensions grow with the parameters; no assertion about a fixed dimension is intended.

=== 1.1 Related work <related-work>

The question developed from the duality problem for entropy numbers of operators; Artstein, Milman and Szarek give the geometric and operator formulations in #cite(label("AMS2004")) pp. 1314–1315 and attribute the original problem to Pietsch’s 1972 work. Early progress already showed that polarity controls covering numbers in several regimes. König and Milman proved a comparison of the $n$th roots of the two covering numbers #cite(label("KonigMilman1987")) Theorem 1; on the logarithmic scale this allows an additive error proportional to $n$. Bourgain, Pajor, Szarek and Tomczak-Jaegermann established entropy-number comparisons under geometric and sequence-regularity assumptions, as well as estimates with losses depending on the rank #cite(label("BPSTJ1989")).

Artstein, Milman and Szarek proved the dimension-free conjecture when one body is a Euclidean ball, and hence when either body is an ellipsoid #cite(label("AMS2004")) Theorem 1. Artstein, Milman, Szarek and Tomczak-Jaegermann proved universal duality for #emph[convexified packing] #cite(label("AMSTJ2004")) Theorem 2. This quantity uses an ordered sequence of points: the interior of the translate centered at each new point must avoid the convex hull of its predecessors. That requirement is stronger than pairwise separation and differs from the ordinary covering number in (1.1). They also announced ordinary entropy duality for spaces whose K-convexity constant is bounded, with the comparison constants depending on that bound #cite(label("AMSTJ2004")) Theorem 5; see also the later derivation in #cite(label("Milman2007")) Section 2. A bound for each individual finite-dimensional space does not provide one pair of constants for all spaces and dimensions.

For arbitrary symmetric convex bodies, Emanuel Milman obtained a comparison with logarithmic losses in both the scale and the entropy factor #cite(label("Milman2007")) Corollary 1.2. Connections with learning theory provide another perspective: Hu, Peale and Reingold study dual covering numbers of function classes, obtaining a comparison with an explicit prefactor depending on the approximation scale and the uniform bounds of the function classes #cite(label("HuPealeReingold2022")) Theorem 11. These dimension- or scale-dependent estimates are compatible with the failure of a universal pair $a \, b$.

The column approximation in this paper also belongs to the broader study of entropy of convex hulls. For example, Mendelson develops finite-set convex-hull estimates in $L_2 \( mu \)$ using Maurey’s approximation method #cite(label("Mendelson2001")) Section 2.1. Here the approximation is uniform over all row coordinates and uses the special partition structure: labels replace the original centers in the finite encoding. The finite-field side uses the polynomial zero estimate associated with Schwartz and Zippel #cite(label("Schwartz1980")) #cite(label("Zippel1979")), together with diagonal recovery of symmetric multilinear forms in sufficiently large characteristic #cite(label("FerreroMicali1979")) #cite(label("DrapalVojtechovsky2009")). We prove the precise elementary forms of these tools and the additional compression and separation arguments below.

Theorem 1 also separates ordinary covering entropy from convexified-packing entropy, even after a fixed change of scale; Corollary 9 states and proves this consequence after the construction.

=== 1.2 The construction and its main mechanism <the-construction-and-its-main-mechanism>

The proof starts with a finite real matrix whose entries lie in $\[ 0 \, 1 \]$. Its rows are pairwise separated by one in the sup norm, while the absolutely convex hull of its columns admits a small uniform approximation list. A direct support-function calculation converts these two properties into large primal entropy and small polar entropy.

The approximation statement is the reusable part of the argument. Suppose a finite set carries $u$ partitions, each with at most $q$ classes. For a subset $T$ of the partition indices, join two points whenever they belong to the same class in one partition indexed by $T$. We consider the resulting graph distances $d_T$, allowing infinite distance between components. For a positive integer cutoff $h$, define the profiles

$ x mapsto max {0 \, 1 - frac(log \( 1 + d_T \( x \, v \) \), log \( 1 + h \))} \, $

with value zero at infinite distance. The columns consist of these profiles over all centers $v$ and over a family of sets $T$, each omitting only a small fraction of the partitions.

Proposition 4 gives a uniform approximation of every nonnegative combination of these columns whose coefficients sum to at most one. For a given combination, averaging finds one partition present in all but a small amount of coefficient mass. At each distance level, a greedy selection of a bounded number of pivots captures all but a small residual mass at every point. Each pivot can then be replaced by a fixed representative of its class in the common partition. This replacement requires storing a label, rather than a point of the original set.

The replacement enlarges the relevant distance radii from $j$ to at most $3 j + 2$. The logarithmic profile bounds the error caused by this enlargement by $log 3 \/ log \( 1 + h \)$, uniformly over all columns and all graph components. After grouping weights by pivot slot and by $T$, the approximation count depends on $q$ through a fixed power. It does not depend on the number of possible column centers through an additional factor. Both the choice of the common partition and all grouped weights are included in the count. Splitting a signed coefficient vector into its positive and negative parts then gives an approximation list for the absolutely convex column hull, with twice the full error of the nonnegative approximation and the square of the list size.

To obtain separated rows, we use symmetric $h$-linear forms on $bb(F)_p^r$, where $p$ is a sufficiently large prime and $r$ is a positive integer. A probabilistic choice of directions ensures that, for every nonzero form, one can delete a small fraction of the directions so that no evaluation on a remaining $h$-tuple vanishes, including tuples with repetitions. Contraction with one direction supplies a partition. A short path in the associated graph would express a nonzero form as a sum of forms killed by the directions along the path, contradicting the nonvanishing property.

There are $p^(D_h)$ rows but at most $p^(D_(h - 1))$ labels in each partition, where $D_j = binom(r + j - 1, j)$ for $j gt.eq 0$. The ratio

$ D_(h - 1) / D_h = frac(h, r + h - 1) $

tends to zero as $r$ grows with $h$ fixed. All remaining encoding costs are fixed before the prime $p$ is chosen. Taking $p$ sufficiently large therefore makes those costs negligible. This order of choices is what allows the compression result and the separation construction to produce a failure of dimension-free entropy duality.

Section 2 first proves the matrix-to-body conversion, which serves as the construction target. Section 3 then establishes uniform compression for an arbitrary admissible family of partitions. Section 4 constructs the finite-field partitions and proves row separation. Finally, Section 5 chooses the parameters and applies the conversion to defeat any proposed universal constants, then derives the convexified-packing consequence. All arguments needed for the construction are included.

=== 1.3 Notation <notation>

For a finite set $S$, write

$ B_oo^S = \[ - 1 \, 1 \]^S \, #h(2em) B_1^S = {lambda in bb(R)^S : sum_(s in S) \| lambda_s \| lt.eq 1} . $

The sup norm on functions on $S$ is denoted by $parallel dot.op parallel_(oo \, S)$. For a finite collection of vectors, $"absconv"$ denotes the convex hull of the vectors and their negatives. A uniform $epsilon$-approximation list may have centers outside the class being approximated; actual centers in the coefficient ball will be chosen in Lemma 2. We write $\[ u \] = { 1 \, dots.h \, u }$.

== 2 The matrix construction target <sec:convex-bodies>

The geometric part of the argument is an elementary conversion of a real matrix into a pair of convex bodies. It specifies exactly what the two combinatorial constructions must achieve: many separated rows and a small uniform approximation list for the absolutely convex hull of the columns. The small cube added to the row hull ensures nonempty interior without losing the polar covering estimate.

#thm([Lemma 2.1.])[
  (Matrix-to-body conversion).  #emph[Let $X$ and $Y$ be finite nonempty sets, and let $g_y : X arrow.r bb(R)$, $y in Y$, be real functions. Write 
$ R_x = \( g_y \( x \) \)_(y in Y) in bb(R)^Y \, #h(2em) f_lambda = sum_(y in Y) lambda_y g_y \, #h(2em) cal(F) = { f_lambda : parallel lambda parallel_1 lt.eq 1 } . $

 Suppose that 
$ parallel R_x - R_(x') parallel_oo gt.eq 1 quad upright("for all distinct ") x \, x' in X \, $

 and that, for some $epsilon > 0$, there is a list of $M$ functions on $X$ such that every member of $cal(F)$ is within $epsilon$ of a function on the list in the uniform norm. The functions on the list need not belong to $cal(F)$. For $t > 0$, set 
$ K = 3 "absconv" { R_x : x in X } + t B_oo^Y \, #h(2em) L = B_oo^Y . $

 Then $K \, L$ are origin-symmetric compact convex bodies with nonempty interior in $bb(R)^Y$, and 
#[#set math.equation(numbering: n => "(2.1)")
 $ N \( K \, L \) gt.eq \| X \| \, #h(2em) N #scale(x: 120%, y: 120%)[\(] L^compose \, \( 6 epsilon + 2 t \) K^compose #scale(x: 120%, y: 120%)[\)] lt.eq M . $ <eq:matrix-body-bounds>]

 Both covering numbers use arbitrary ambient translation centers.]
] <lem:matrix-to-bodies>

#proof[
  The hull $"absconv" { R_x : x in X }$ is the convex hull of the finitely many vectors $plus.minus R_x$. It is compact, convex, and symmetric, and contains zero. Thus $K$ has the same three properties and contains $t B_oo^Y$, which gives it nonempty interior in the full ambient space. The corresponding properties of $L$ are immediate.
  Each point $3 R_x$ belongs to $K$, and two distinct such points have uniform distance at least $3$. Every translate of $L$ has uniform diameter $2$, whatever its center. Hence it contains at most one of these $\| X \|$ points. This proves the first inequality in (2.1).
  For the polar estimate, the support function $h_K \( delta \) = sup_(z in K) chevron.l z \, delta chevron.r$ is exactly
  #[#set math.equation(numbering: n => "(2.2)")
   $ h_K \( delta \) = 3 max_(x in X) \| chevron.l R_x \, delta chevron.r \| + t sum_(y in Y) \| delta_y \| = 3 parallel f_delta parallel_(oo \, X) + t parallel delta parallel_1 . $ <eq:row-support-function>]
  Indeed, a linear functional attains its maximum over the finite convex hull at one of the vectors $plus.minus R_x$. Its maximum over $B_oo^Y$ is $sum_y \| delta_y \|$, attained by choosing the sign of each coordinate. The two choices in the Minkowski sum are independent, so their maxima add. The same cube calculation gives
  $ L^compose = B_1^Y = { lambda in bb(R)^Y : parallel lambda parallel_1 lt.eq 1 } . $
  Order the approximating list. Assign each $lambda in B_1^Y$ to the first list function within $epsilon$ of $f_lambda$, thereby partitioning $B_1^Y$ into at most $M$ nonempty clusters. From each nonempty cluster choose one actual vector $lambda^(\( k \)) in B_1^Y$. For any $lambda$ in that cluster, the triangle inequality gives
  $ parallel f_lambda - f_(lambda^(\( k \))) parallel_(oo \, X) lt.eq 2 epsilon \, #h(2em) parallel lambda - lambda^(\( k \)) parallel_1 lt.eq 2 . $
  Consequently (2.2) implies
  $ h_K \( lambda - lambda^(\( k \)) \) lt.eq 6 epsilon + 2 t . $
  For every $c > 0$, the definition of the polar and positive homogeneity give the equivalence
  $ delta in c K^compose quad arrow.l.r.double quad h_K \( delta \) lt.eq c . $
  Each cluster is therefore contained in $lambda^(\( k \)) + \( 6 epsilon + 2 t \) K^compose$. These at most $M$ translates cover $B_1^Y = L^compose$, proving the second inequality. Selecting representatives inside the coefficient ball is what controls the contribution of the added cube, even when the original list functions lie outside $cal(F)$. ◻
]

For proposed constants $a \, b gt.eq 1$, the lemma reduces the problem to finding a matrix and positive numbers $epsilon \, t$ for which

$ log \| X \| > b log M \, #h(2em) 6 epsilon + 2 t lt.eq a^(- 1) . $

Indeed, increasing the polar covering body preserves the cover supplied by the lemma. The next two sections construct the matrix. The compression argument controls $M$ through the number of labels in a partition; the finite-field construction makes that number small relative to the row count on the logarithmic scale.

== 3 Uniform compression from partitions <sec:compression>

We first prove an approximation result for an arbitrary family of partitions of a finite set. Its cost depends on the number of labels of a partition, whereas the underlying set can be much larger.

Let $X$ be a finite nonempty set, let $u \, q$ be positive integers, and let

$ L_i : X arrow.r Sigma_i \, #h(2em) i in \[ u \] = { 1 \, dots.h \, u } \, #h(2em) \| L_i \( X \) \| lt.eq q . $

Fix $0 < theta < 1$ and a nonempty family $cal(T)$ of subsets of $\[ u \]$ such that

#[#set math.equation(numbering: n => "(3.1)")
 $ \| \[ u \] \\ T \| lt.eq theta u #h(2em) \( T in cal(T) \) . $ <eq:admissible-sets>]

In particular, every $T in cal(T)$ is nonempty. For each such $T$, form the undirected graph on $X$ in which distinct vertices $x \, z$ are adjacent when $L_i \( x \) = L_i \( z \)$ for some $i in T$. Write $d_T \( x \, z \)$ for its graph distance, with distance $oo$ between different components.

Choose a positive integer $h$ such that

#[#set math.equation(numbering: n => "(3.2)")
 $ frac(log 3, log \( h + 1 \)) lt.eq theta \, #h(2em) s = ceil.l 1 \/ theta ceil.r . $ <eq:compression-parameters>]

Define the logarithmic profile

$ phi.alt_h \( d \) = max {0 \, 1 - frac(log \( d + 1 \), log \( h + 1 \))} quad \( d = 0 \, 1 \, 2 \, dots.h \) \, #h(2em) phi.alt_h \( oo \) = 0 . $

Set $Y = X times cal(T)$. For $y = \( v \, T \) in Y$, define the column function

#[#set math.equation(numbering: n => "(3.3)")
 $ g_y \( x \) = phi.alt_h \( d_T \( x \, v \) \) #h(2em) \( x in X \) . $ <eq:column-functions>]

Thus $0 lt.eq g_y lt.eq 1$. For nonnegative coefficients of total mass at most one, write

$ f_mu = sum_(y in Y) mu_y g_y \, #h(2em) cal(F)_(+) = {f_mu : mu_y gt.eq 0 \, med sum_(y in Y) mu_y lt.eq 1} . $

For a function $f : X arrow.r bb(R)$, let $parallel f parallel_(oo \, X) = max_(x in X) \| f \( x \) \|$.

We seek a uniform approximation list for $cal(F)_(+)$ whose size is controlled by $h \, theta \, u \, q$, rather than $\| X \|$. The next lemma expresses each profile as a weighted sum of graph-ball indicators and bounds the error caused by enlarging their radii from $j$ to $3 j + 2$.

#thm([Lemma 3.1.])[
  (Logarithmic profile).  #emph[For any positive integer $h$, the weights 
$ gamma_j = frac(log \( j + 2 \) - log \( j + 1 \), log \( h + 1 \)) quad \( 0 lt.eq j < h \) $

 are positive, sum to one, and satisfy, for every $d in { 0 \, 1 \, 2 \, dots.h } union { oo }$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ phi.alt_h \( d \) & = sum_(j = 0)^(h - 1) gamma_j upright(bold(1))_({ d lt.eq j }) \,\
sum_(j = 0)^(h - 1) gamma_j upright(bold(1))_({ d lt.eq 3 j + 2 }) & lt.eq phi.alt_h \( d \) + frac(log 3, log \( h + 1 \)) . $ <eq:profile-expansion>]

]
] <lem:log-profile>

#proof[
  Positivity and the identity $sum_j gamma_j = 1$ follow by telescoping. If $0 lt.eq d < h$, the sum in (3.4) runs from $j = d$ to $j = h - 1$ and equals
  $ frac(log \( h + 1 \) - log \( d + 1 \), log \( h + 1 \)) . $
  If $d gt.eq h$, including $d = oo$, both sides are zero.
  For finite $d$, the extra indices counted on the left of (3.4) satisfy $j < d lt.eq 3 j + 2$. When this index set is nonempty, it is the integer interval from
  $ a_d = max {0 \, ⌈frac(d + 1, 3)⌉ - 1} quad upright("to") quad b_d = min { h - 1 \, d - 1 } . $
  Since $b_d + 2 lt.eq d + 1$ and $a_d + 1 gt.eq \( d + 1 \) \/ 3$, its weight is
  $ sum_(j = a_d)^(b_d) gamma_j = frac(log \( \( b_d + 2 \) \/ \( a_d + 1 \) \), log \( h + 1 \)) lt.eq frac(log 3, log \( h + 1 \)) . $
  An empty interval contributes zero. If $d = oo$, all the indicators vanish. This also covers all distances at and beyond the cutoff $h$. ◻
]

#thm([Proposition 3.2.])[
  (Uniform compression).  #emph[Under the hypotheses above, there is a finite list $cal(A)$ of real-valued functions on $X$, of cardinality $Q$, such that every $f in cal(F)_(+)$ has an approximant $A in cal(A)$ satisfying 
#[#set math.equation(numbering: n => "(3.5)")
 $ f \( x \) - 3 theta lt.eq A \( x \) lt.eq f \( x \) + theta #h(2em) \( x in X \) . $ <eq:positive-approximation>]

 In particular, $parallel f - A parallel_(oo \, X) lt.eq 3 theta$. The list can be chosen with 
#[#set math.equation(numbering: n => "(3.6)")
 $ log Q lt.eq h s log q + C_(h \, theta \, u) \, #h(2em) C_(h \, theta \, u) = log u + h s 2^u log (1 + frac(s 2^u, theta)) . $ <eq:compression-count>]

]
] <prop:compression>

#proof[
  For each $i in \[ u \]$, fix a representative map
  $ rho_i : L_i \( X \) arrow.r X \, #h(2em) L_i \( rho_i \( sigma \) \) = sigma . $
  These maps are fixed for the entire approximation problem, before any coefficient vector is chosen.
  #emph[A common index.] Fix $f = f_mu in cal(F)_(+)$, and use $mu \( S \) = sum_(y in S) mu_y$ for subsets $S subset.eq Y$. Averaging (3.1) gives
  $ 1 / u sum_(i = 1)^u mu { \( v \, T \) : i in.not T } = sum_(\( v \, T \) in Y) mu_(\( v \, T \)) frac(\| \[ u \] \\ T \|, u) lt.eq theta . $
  Choose $i_0 in \[ u \]$ for which the omitted mass is at most $theta$, and retain the columns in
  $ Y_0 = { \( v \, T \) in Y : i_0 in T } . $
  This one index will serve at every level $j$.
  #emph[A bounded number of pivots at each level.] Fix $j in { 0 \, dots.h \, h - 1 }$ and, for $x in X$, let
  $ I_x = { \( v \, T \) in Y_0 : d_T \( x \, v \) lt.eq j } . $
  Starting with an empty union, add a set $I_z$ whenever its mass outside the current union is greater than $theta$. If $k_j$ sets are added, their successive contributions give $k_j theta < 1$; in particular $k_j lt.eq s$. The process therefore terminates with pivots $z_(j \, 1) \, dots.h \, z_(j \, k_j)$ and union
  $ U_j = union.big_(k = 1)^(k_j) I_(z_(j \, k)) quad upright("such that") quad mu \( I_x \\ U_j \) lt.eq theta #h(2em) \( x in X \) . $
  The empty choice is allowed. Assign every column of $U_j$ to the first pivot whose set contains it, and denote its assigned slot by $kappa_j \( y \)$.
  For a pivot $z = z_(j \, k)$, retain only its label $L_(i_0) \( z \)$, and replace it by $z' = rho_(i_0) \( L_(i_0) \( z \) \)$. If $y = \( v \, T \)$ is assigned to this pivot, then $i_0 in T$, $d_T \( v \, z \) lt.eq j$, and $d_T \( z \, z' \) lt.eq 1$. Consequently,
  #[#set math.equation(numbering: n => "(3.7)")
   $ d_T \( v \, z' \) lt.eq j + 1 . $ <eq:pivot-replacement>]
  For every $x in X$, the triangle inequality now gives the two implications
  #[#set math.equation(numbering: n => "(3.8)")
   $ d_T \( x \, v \) lt.eq j & med arrow.r.double med d_T \( x \, z' \) lt.eq 2 j + 1 \,\
d_T \( x \, z' \) lt.eq 2 j + 1 & med arrow.r.double med d_T \( x \, v \) lt.eq 3 j + 2 . $ <eq:pivot-forward>]
  All distances used in these triangle inequalities are finite under their respective hypotheses, even if the graph is disconnected. Figure 1 illustrates the two bounds.
  #figure(
    [#grid(
    columns: (0.48fr, 0.48fr,),
    column-gutter: 4%,
    [
      (a) Keeping an assigned match
      #cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, 0.03528), [$x$], anchor: "south")
  circle((1.5, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.5, 0.03528), [$v$], anchor: "south")
  circle((3, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3, 0.03528), [$z$], anchor: "south")
  circle((4.5, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((4.5, 0.03528), [$z'$], anchor: "south")
  line((0, 0), (1.5, 0), stroke: (paint: rgb("#404040"), thickness: 0.6pt, miter-limit: 10))
  content((0.75, 0), [#text(size: 9pt)[$lt.eq j$]], anchor: "north", padding: 0.1176cm)
  line((1.5, 0), (3, 0), stroke: (paint: rgb("#404040"), thickness: 0.6pt, miter-limit: 10))
  content((2.25, 0), [#text(size: 9pt)[$lt.eq j$]], anchor: "north", padding: 0.1176cm)
  line((3, 0), (4.5, 0), stroke: (paint: rgb("#404040"), thickness: 0.6pt, miter-limit: 10))
  content((3.75, 0), [#text(size: 9pt)[$lt.eq 1$]], anchor: "north", padding: 0.1176cm)
  bezier((0, 0), (4.5, 0), (1.344, -1.128), (3.156, -1.128), stroke: (paint: rgb("#183e6e"), thickness: 0.7pt, miter-limit: 10, dash: "dashed"))
  content((2.25, -0.9519), [#text(fill: rgb("#183e6e"))[#text(size: 9pt)[$d_T(x,z') lt.eq 2j+1$]]], anchor: "north", padding: 0.1176cm)
  line((0, -1.55), (4.5, -1.55), stroke: none)
})
    ],
    [
      (b) Controlling the extra matches
      #cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, 0.03528), [$x$], anchor: "south")
  circle((3.8, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.8, 0.03528), [$z'$], anchor: "south")
  circle((3.8, -1.2), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.8, -1.235), [$v$], anchor: "north")
  line((0, 0), (3.8, 0), stroke: (paint: rgb("#404040"), thickness: 0.6pt, miter-limit: 10))
  content((1.9, 0), [#text(size: 9pt)[$lt.eq 2j+1$]], anchor: "south", padding: 0.1176cm)
  line((3.8, 0), (3.8, -1.2), stroke: (paint: rgb("#404040"), thickness: 0.6pt, miter-limit: 10))
  content((3.8, -0.6), [#text(size: 9pt)[$lt.eq j+1$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (3.8, -1.2), stroke: (paint: rgb("#183e6e"), thickness: 0.7pt, miter-limit: 10, dash: "dashed"))
  content((1.9, -0.6), [#text(fill: rgb("#183e6e"))[#text(size: 9pt)[$lt.eq 3j+2$]]], anchor: "north-east", padding: 0.1176cm)
  line((0, -1.55), (4.5, -1.55), stroke: none)
})
    ],
  )],
    caption: [Figure 1: The two triangle inequalities in the compression step. The pivot $z$ is replaced by its fixed label representative $z'$. The diagrams show schematic graph paths; the labels are upper bounds on their lengths. The logarithmic profile controls the enlargement to radius $3 j + 2$. ],
  ) <fig:pivot-comparison>
  Write $z'_(j \, k) = rho_(i_0) \( L_(i_0) \( z_(j \, k) \) \)$ and define
  $ A_j \( x \) = sum_(y = \( v \, T \) in U_j) mu_y upright(bold(1))_({ d_T \( x \, z'_(j \, kappa_j \( y \)) \) lt.eq 2 j + 1 }) . $
  For comparison, let
  $ f_(mu \, j) \( x \) = sum_(y = \( v \, T \) in Y) mu_y upright(bold(1))_({ d_T \( x \, v \) lt.eq j }) . $
  Every assigned column counted by $f_(mu \, j) \( x \)$ is counted by $A_j \( x \)$, by (3.8). The other columns counted by $f_(mu \, j) \( x \)$ have total mass at most $2 theta$: at most $theta$ lies outside $Y_0$, and at most $theta$ lies in $I_x \\ U_j$. Conversely, (3.8) bounds every column counted by $A_j \( x \)$. Hence
  #[#set math.equation(numbering: n => "(3.9)")
   $ f_(mu \, j) \( x \) - 2 theta lt.eq A_j \( x \) lt.eq sum_(y = \( v \, T \) in Y) mu_y upright(bold(1))_({ d_T \( x \, v \) lt.eq 3 j + 2 }) . $ <eq:level-comparison>]
  #emph[Combining the levels.] Let $F = sum_(j = 0)^(h - 1) gamma_j A_j$. By (3.4), $f_mu = sum_j gamma_j f_(mu \, j)$. Thus the lower bound in (3.9) gives $F gt.eq f_mu - 2 theta$. For the upper bound, apply (3.4) separately to each distance $d_T \( x \, v \)$ and sum with weights $mu_(\( v \, T \))$. Since the total mass is at most one and $log 3 \/ log \( h + 1 \) lt.eq theta$, this yields the pointwise interval
  #[#set math.equation(numbering: n => "(3.10)")
   $ f_mu - 2 theta lt.eq F lt.eq f_mu + theta . $ <eq:unrounded-approximation>]
  #emph[A finite encoding.] The center $v$ of an assigned column no longer occurs in its indicator in $A_j$. Grouping columns by assigned slot and by $T$ gives exactly
  #[#set math.equation(numbering: n => "(3.11)")
   $ A_j \( x \) = sum_(k = 1)^s sum_(T in cal(T)) w_(j \, k \, T) upright(bold(1))_({ d_T \( x \, z'_(j \, k) \) lt.eq 2 j + 1 }) \, $ <eq:grouped-approximation>]
  where
  $ w_(j \, k \, T) = sum_(v in X : med \( v \, T \) in U_j thin \, med kappa_j \( v \, T \) = k) mu_(\( v \, T \)) . $
  Unused slots have all weights zero and are padded with a fixed realized $L_(i_0)$-label. Such a label exists because $X$ is nonempty. Each weight belongs to $\[ 0 \, 1 \]$, and there are at most $M_0 = s 2^u$ weights at each level. Round each weight down to a multiple of $delta = theta \/ M_0$, writing
  $ tilde(w)_(j \, k \, T) = delta ⌊w_(j \, k \, T) / delta⌋ . $
  Let $tilde(A)_j$ be (3.11) with these rounded weights, and put $A = sum_j gamma_j tilde(A)_j$. Since every indicator is at most one,
  $ 0 lt.eq A_j \( x \) - tilde(A)_j \( x \) lt.eq M_0 delta = theta . $
  The weights $gamma_j$ sum to one, so $0 lt.eq F - A lt.eq theta$. Together with (3.10), this proves (3.5).
  It remains to count one list that works for all $mu$. For fixed $i_0$, the data determining $A$ are the $s$ pivot labels at each of the $h$ levels and the rounded weights in (3.11). The label determines $z'_(j \, k)$ through the fixed map $rho_(i_0)$, so no original pivot or column center must also be specified. There are at most $q^(h s)$ choices of labels. Each rounded weight has at most
  $ ⌊M_0 / theta⌋ + 1 lt.eq 1 + M_0 / theta $
  possible values, and there are at most $h M_0$ such weights. Enumerate these choices for every $i_0 in \[ u \]$, allowing also codes that do not arise from a coefficient vector. This gives a fixed finite list of functions containing every approximant constructed above, with
  $ Q lt.eq u thin q^(h s) (1 + frac(s 2^u, theta))^(h s 2^u) . $
  Taking logarithms proves (3.6). The graphs and the representative maps are shared data defining this list; they are not additional choices for each approximant. ◻
]

The family $cal(T)$ and all the graphs are fixed before applying Proposition 4. The common index $i_0$ may depend on the coefficient vector. No separation assumption on $X$, and no choice of a single distinguished member of $cal(T)$, enters the argument.

#thm([Corollary 3.3.])[
  (Signed compression).  #emph[With the notation of Proposition 4, put 
$ f_lambda = sum_(y in Y) lambda_y g_y \, #h(2em) B_1^Y = {lambda in bb(R)^Y : sum_(y in Y) \| lambda_y \| lt.eq 1} \, $

 and 
$ cal(F) = { f_lambda : lambda in B_1^Y } = "absconv" { g_y : y in Y } . $

 There is a list of at most $Q^2$ functions which approximates every member of $cal(F)$ to uniform error $6 theta$. Moreover, $B_1^Y$ can be partitioned into at most $Q^2$ nonempty clusters such that 
#[#set math.equation(numbering: n => "(3.12)")
 $ parallel f_lambda - f_(lambda') parallel_(oo \, X) lt.eq 12 theta $ <eq:signed-cluster-diameter>]

 whenever $lambda \, lambda'$ belong to the same cluster.]
] <cor:signed-compression>

#proof[
  Write $lambda = lambda^(+) - lambda^(-)$, where $lambda_y^(+) = max { lambda_y \, 0 }$ and $lambda_y^(-) = max { - lambda_y \, 0 }$. Each part is nonnegative and has total mass at most one. Apply Proposition 4 to choose $A^(+) \, A^(-) in cal(A)$ with
  $ parallel f_(lambda^(+)) - A^(+) parallel_(oo \, X) lt.eq 3 theta \, #h(2em) parallel f_(lambda^(-)) - A^(-) parallel_(oo \, X) lt.eq 3 theta . $
  Then $A^(+) - A^(-)$ approximates $f_lambda$ to error at most $6 theta$. There are at most $Q^2$ differences in $cal(A) - cal(A)$. Order this finite list and assign each $lambda in B_1^Y$ to its first approximant with error at most $6 theta$. The nonempty fibers form the claimed partition, and the triangle inequality proves (3.12). The approximating functions need not belong to $cal(F)$; the clusters themselves consist of actual coefficient vectors in $B_1^Y$. ◻
]

== 4 Finite-field partitions and separated rows <sec:partitions>

We now construct partitions with few labels for which the functions of Section 3 separate every pair of rows. The construction has two steps. First, we choose directions so that, for each nonzero symmetric multilinear form, one can make a form-dependent deletion of a small fraction of the directions and obtain nonzero evaluations on every tuple of remaining directions. Second, these remaining directions obstruct short paths in the corresponding partition graph.

We use the standard total-degree polynomial zero estimate #cite(label("Schwartz1980")) Corollary 1; related early work on randomized polynomial evaluation is due to Zippel #cite(label("Zippel1979")). We include the precise finite-field statement and its elementary proof.

#thm([Lemma 4.1.])[
  (Polynomial zero bound).  #emph[Let $P in bb(F)_p \[ z_1 \, dots.h \, z_k \]$ be a nonzero polynomial of total degree at most $d$, where $k \, d$ are nonnegative integers and $p$ is prime. If $U_1 \, dots.h \, U_k$ are independent and uniform in $bb(F)_p$, then 
$ Pr #scale(x: 120%, y: 120%)[\(] P \( U_1 \, dots.h \, U_k \) = 0 #scale(x: 120%, y: 120%)[\)] lt.eq d / p . $

]
] <lem:polynomial-zero>

#proof[
  We induct on $k$. When $k = 0$, the polynomial is a nonzero constant, and its zero probability is zero. For $k gt.eq 1$, write
  $ P \( z_1 \, dots.h \, z_k \) = sum_(j = 0)^e P_j \( z_1 \, dots.h \, z_(k - 1) \) z_k^j \, #h(2em) P_e eq.not 0 . $
  The total degree of $P_e$ is at most $d - e$, so the induction hypothesis bounds the probability that this leading coefficient vanishes by $\( d - e \) \/ p$. Conditional on any values of the first $k - 1$ variables for which it does not vanish, the resulting univariate polynomial has degree $e$ and at most $e$ roots, by successive division by linear factors. Its conditional zero probability is therefore at most $e \/ p$. The sum of these two bounds is $d \/ p$. This argument also covers $e = 0$ and, in particular, all nonzero constant polynomials. ◻
]

For positive integers $r \, h$, set

$ D_j = binom(r + j - 1, j) quad \( j gt.eq 0 \) . $

If $E = bb(F)_p^r$, write $"Sym"^j \( E^(*) \)$ for the space of maps $E^j arrow.r bb(F)_p$ that are multilinear and invariant under permutations of their arguments. We interpret $"Sym"^0 \( E^(*) \)$ as $bb(F)_p$. Relative to a basis $e_1 \, dots.h \, e_r$, a symmetric $j$-linear form is specified freely by its values on multisets of $j$ basis vectors. The number of such multisets is $D_j$. Thus

#[#set math.equation(numbering: n => "(4.1)")
 $ dim_(bb(F)_p) "Sym"^j \( E^(*) \) = D_j \, #h(2em) \| "Sym"^j \( E^(*) \) #scale(x: 120%, y: 120%)[\|] = p^(D_j) . $ <eq:symmetric-form-dimension>]

#thm([Proposition 4.2.])[
  (Directions with nonvanishing evaluations).  #emph[Let $0 < theta < 1$ and let $r \, h$ be positive integers. Put 
#[#set math.equation(numbering: n => "(4.2)")
 $ w = 2 D_h \, #h(2em) u = ⌈frac(h w, theta)⌉ \, $ <eq:field-parameters>]

 and let $p$ be any prime satisfying 
#[#set math.equation(numbering: n => "(4.3)")
 $ p > max { h \, h^2 u^(2 h) } . $ <eq:field-prime-threshold>]

 There exist $t_1 \, dots.h \, t_u in E = bb(F)_p^r$ such that, for every nonzero $Z in "Sym"^h \( E^(*) \)$, there is a set $T subset.eq \[ u \]$ with $\| \[ u \] \\ T \| lt.eq theta u$ for which 
#[#set math.equation(numbering: n => "(4.4)")
 $ Z \( t_(i_1) \, dots.h \, t_(i_h) \) eq.not 0 #h(2em) upright("for all ") \( i_1 \, dots.h \, i_h \) in T^h . $ <eq:robust-nonvanishing>]

 Tuples in this assertion may have repeated indices.]
] <prop:robust-directions>

#proof[
  Choose $t_1 \, dots.h \, t_u$ independently and uniformly in $E$. Fix a nonzero form $Z$. For $z = sum_(a = 1)^r z_a e_a$, its diagonal polynomial is
  #[#set math.equation(numbering: n => "(4.5)")
   $ P_Z \( z_1 \, dots.h \, z_r \) & = Z \( z \, dots.h \, z \)\
 & = sum_(alpha_1 + dots.h.c + alpha_r = h\
alpha_a gt.eq 0) frac(h !, alpha_1 ! dots.h.c alpha_r !) Z \( e_1^(\[ alpha_1 \]) \, dots.h \, e_r^(\[ alpha_r \]) \) z_1^(alpha_1) dots.h.c z_r^(alpha_r) \, $ <eq:diagonal-polynomial>]
  where $e_a^(\[ alpha_a \])$ means that $e_a$ is repeated $alpha_a$ times among the arguments. At least one displayed value of $Z$ is nonzero. Since $p > h$, every displayed multinomial coefficient is nonzero in $bb(F)_p$. Distinct multisets give distinct monomials, so $P_Z$ is a nonzero polynomial of total degree $h$. This is the diagonal recovery of a symmetric multilinear form when $h !$ is invertible; see #cite(label("FerreroMicali1979")) Corollary 1.2 and #cite(label("DrapalVojtechovsky2009")) Proposition 3.3. The coordinate argument above gives the precise fact needed here.
  For an ordered tuple $upright(bold(i)) = \( i_1 \, dots.h \, i_h \) in \[ u \]^h$, let $"supp" \( upright(bold(i)) \) = { i_1 \, dots.h \, i_h }$. The expression $Z \( t_(i_1) \, dots.h \, t_(i_h) \)$, considered as a polynomial in the scalar coordinates of the vectors with indices in $"supp" \( upright(bold(i)) \)$, has total degree $h$ and is nonzero: setting all those vector variables equal to $z$ gives the nonzero polynomial (4.5). Lemma 6 therefore gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ Pr #scale(x: 120%, y: 120%)[\(] Z \( t_(i_1) \, dots.h \, t_(i_h) \) = 0 #scale(x: 120%, y: 120%)[\)] lt.eq h / p . $ <eq:tuple-zero-probability>]
  This applies to every pattern of repeated indices.
  For this fixed $Z$, evaluations on tuples with pairwise disjoint index supports depend on disjoint subsets of the independent vectors $t_i$. Their zero events are consequently independent. There are at most $u^(h w)$ ordered lists of $w$ ordered $h$-tuples, and fewer than $p^(D_h)$ choices of nonzero $Z$. A union bound shows that the probability that some nonzero $Z$ has $w$ zero tuples with pairwise disjoint supports is at most
  #[#set math.equation(numbering: n => "(4.7)")
   $ p^(D_h) u^(h w) (h / p)^w = (frac(h^2 u^(2 h), p))^(D_h) < 1 . $ <eq:field-union-bound>]
  The count includes all forms over the chosen field; no independence between different forms is needed. Fix vectors for which this event does not occur.
  For each nonzero $Z$, take a family of zero tuples with pairwise disjoint supports that is maximal under inclusion. It contains at most $w - 1$ tuples. Delete the union of their supports, and let $T$ be the remaining indices. The number deleted is at most
  $ h \( w - 1 \) < h w lt.eq theta u . $
  If any zero tuple were supported in $T$, its support would be disjoint from all the selected supports, contradicting maximality. Thus (4.4) holds. Since $theta < 1$, the set $T$ is nonempty. The construction imposed no requirement that the sampled vectors be distinct or nonzero. ◻
]

#thm([Proposition 4.3.])[
  (Partitions with separated rows).  #emph[With the parameters and directions of Proposition 7, let 
$ X = "Sym"^h \( E^(*) \) \, #h(2em) L_i \( x \) = x \( t_i \, dot.op \, dots.h \, dot.op \) \, $

 and let $cal(T) = { T subset.eq \[ u \] : \| \[ u \] \\ T \| lt.eq theta u }$. Then $\| X \| = m = p^(D_h)$, and each label map $L_i$ has at most $q = p^(D_(h - 1))$ realized labels. For the partition graphs of Section 3, every pair of distinct $x \, y in X$ has some $T in cal(T)$ satisfying 
#[#set math.equation(numbering: n => "(4.8)")
 $ d_T \( x \, y \) > h . $ <eq:graph-separation>]

 Consequently, for $Y = X times cal(T)$ and $R_x = \( g_(\( v \, T \)) \( x \) \)_(\( v \, T \) in Y) in bb(R)^Y$, the rows satisfy 
#[#set math.equation(numbering: n => "(4.9)")
 $ parallel R_x - R_y parallel_oo = 1 #h(2em) \( x eq.not y \) . $ <eq:row-separation>]

]
] <prop:separated-rows>

#proof[
  The cardinality of $X$ follows from (4.1). The contraction $L_i \( x \)$ is a symmetric $\( h - 1 \)$-linear form, so its possible values belong to a space of cardinality $p^(D_(h - 1))$. This bounds the realized labels even if a contraction is not surjective.
  Fix distinct $x \, y in X$, and apply Proposition 7 to $Z = y - x$. Let $T in cal(T)$ be the resulting nonempty set. Recall that distinct vertices are adjacent in the graph for $T$ if their labels agree at some $i in T$. Suppose there were a path
  $ x = x_0 \, x_1 \, dots.h \, x_k = y \, #h(2em) 1 lt.eq k lt.eq h . $
  For each edge choose $i_j in T$ such that $L_(i_j) \( x_j \) = L_(i_j) \( x_(j - 1) \)$, and put $Delta_j = x_j - x_(j - 1)$. Thus
  $ Delta_j \( t_(i_j) \, v_2 \, dots.h \, v_h \) = 0 #h(2em) upright("for every ") v_2 \, dots.h \, v_h in E . $
  Choose any $i_(*) in T$, and form the $h$-tuple consisting of $t_(i_1) \, dots.h \, t_(i_k)$ followed by $h - k$ copies of $t_(i_(*))$. Every $Delta_j$ vanishes on this tuple, since it is symmetric and one of its arguments is $t_(i_j)$. The identity $Z = sum_(j = 1)^k Delta_j$ implies that $Z$ also vanishes on the tuple, contrary to (4.4). This proves (4.8); vertices in different components have infinite distance and already satisfy it.
  At the column $\( x \, T \)$, the logarithmic profile gives $g_(\( x \, T \)) \( x \) = 1$ and $g_(\( x \, T \)) \( y \) = 0$, because $d_T \( x \, y \) > h$. All column values lie in $\[ 0 \, 1 \]$, so this unit difference also gives the exact equality (4.9). ◻
]

The family $cal(T)$ here contains every admissible subset and is fixed with the partitions. The separating set $T$ may depend on the pair of rows. This is compatible with Proposition 4, whose common index may depend on the particular convex combination of columns. If $h$ also satisfies $log 3 \/ log \( h + 1 \) lt.eq theta$, the compression bound applies with $q = p^(D_(h - 1))$ and $s = ceil.l 1 \/ theta ceil.r$, giving

#[#set math.equation(numbering: n => "(4.10)")
 $ log Q lt.eq h s D_(h - 1) log p + C_(h \, theta \, u) . $ <eq:field-compression-bound>]

Once $r \, h \, theta$ are fixed, so are $u$ and $C_(h \, theta \, u)$; the prime $p$ can still be taken arbitrarily large subject to (4.3).

== 5 Choice of parameters and failure of duality <sec:parameters>

We now choose the parameters in their order of dependence. The field size is chosen last, so it can absorb the encoding term from Proposition 4.

#proof[
  Fix $a \, b gt.eq 1$. Put
  $ theta = frac(1, 1000 a) \, #h(2em) s = ceil.l 1 \/ theta ceil.r \, $
  and choose a positive integer $h$ with $log 3 \/ log \( h + 1 \) lt.eq theta$. Such an integer exists because $log \( h + 1 \)$ tends to infinity. Choose a positive integer $r$ so that
  #[#set math.equation(numbering: n => "(5.1)")
   $ r + h - 1 > 8 b h^2 s . $ <eq:rank-choice>]
  As in Section 4, define
  $ D_j = binom(r + j - 1, j) quad \( 0 lt.eq j lt.eq h \) \, #h(2em) w = 2 D_h \, #h(2em) u = ⌈frac(h w, theta)⌉ . $
  The number
  #[#set math.equation(numbering: n => "(5.2)")
   $ C = C_(h \, theta \, u) = log u + h s 2^u log (1 + frac(s 2^u, theta)) $ <eq:fixed-encoding-term>]
  is now fixed. Choose a prime $p$ satisfying
  #[#set math.equation(numbering: n => "(5.3)")
   $ p > max {h \, med h^2 u^(2 h) \, med exp (frac(8 b C, D_h))} . $ <eq:prime-choice>]
  All quantities on the right have already been determined, and primes exceed every finite bound.
  Apply Proposition 7 with these parameters, and form the label maps and graph profiles in Proposition 8. The row index set $X$ consists of the symmetric $h$-linear forms on $bb(F)_p^r$, so
  $ m = \| X \| = p^(D_h) > 1 . $
  Each label map takes at most $q = p^(D_(h - 1))$ values. The columns are indexed by $Y = X times cal(T)$, where
  $ cal(T) = { T subset.eq \[ u \] : \| \[ u \] \\ T \| lt.eq theta u } \, $
  and the real row vectors satisfy
  #[#set math.equation(numbering: n => "(5.4)")
   $ parallel R_x - R_(x') parallel_oo = 1 #h(2em) \( x eq.not x' \) . $ <eq:final-row-separation>]
  In particular, $Y$ is a finite nonempty set. The finite field serves only to construct the indices and label maps; the matrix entries and the convex bodies below are real.
  By Proposition 4, the positive column class has a uniform $3 theta$ approximation list of cardinality $Q$ satisfying
  $ log Q lt.eq h s log q + C = h s D_(h - 1) log p + C . $
  Corollary 5 gives a uniform $6 theta$ approximation list of at most $Q^2$ functions for the absolutely convex column hull. Thus Lemma 2 applies with $epsilon = 6 theta$ and $t = theta$. It gives admissible bodies in dimension $n = \| Y \|$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ K = 3 "absconv" { R_x : x in X } + theta B_oo^Y \, #h(2em) L = B_oo^Y \, $ <eq:final-bodies>]
  such that
  $ N \( K \, L \) gt.eq m \, #h(2em) N \( L^compose \, 38 theta K^compose \) lt.eq Q^2 . $
  Since $38 theta = 38 \/ \( 1000 a \) < a^(- 1)$, increasing the covering body preserves this cover, and therefore
  #[#set math.equation(numbering: n => "(5.6)")
   $ N \( L^compose \, a^(- 1) K^compose \) lt.eq Q^2 . $ <eq:final-dual-bound>]
  It remains to compare the two entropies. The exact identity
  $ D_(h - 1) / D_h = frac(h, r + h - 1) $
  yields
  #[#set math.equation(numbering: n => "(5.7)")
   $ frac(log \( Q^2 \), log m) lt.eq frac(2 h^2 s, r + h - 1) + frac(2 C, D_h log p) < frac(1, 4 b) + frac(1, 4 b) = frac(1, 2 b) \, $ <eq:entropy-ratio>]
  where the strict inequalities follow respectively from (5.1) and (5.3). Combining (5.6) with $N \( K \, L \) gt.eq m > 1$ gives
  $ b log N \( L^compose \, a^(- 1) K^compose \) lt.eq b log \( Q^2 \) < 1 / 2 log m < log N \( K \, L \) . $
  Identifying $bb(R)^Y$ with $bb(R)^n$ makes $L = \[ - 1 \, 1 \]^n$ and proves the claimed counterexample for the arbitrary proposed constants $a \, b$. ◻
]

The same estimate gives an asymptotic form of the conclusion. Fix $a gt.eq 1$, and hence $theta \, h \, s$. For each positive integer $r$, set $D_h \, u \, C$ as above and choose a prime

$ p > max {h \, med h^2 u^(2 h) \, med exp (frac(r C, D_h))} . $

The resulting bodies $K_r \, L_r$ satisfy

$ 0 lt.eq frac(log N \( L_r^compose \, a^(- 1) K_r^compose \), log N \( K_r \, L_r \)) lt.eq frac(2 h^2 s, r + h - 1) + 2 / r arrow.r 0 . $

Although $u$ and $C$ may grow rapidly with $r$, both are fixed before $p$ is chosen. No upper bound on the resulting ambient dimension is required for this conclusion.

=== 5.1 A consequence for convexified packing <a-consequence-for-convexified-packing>

Theorem 1 also separates ordinary covering entropy from convexified-packing entropy. For a nonempty bounded set $T$ and an origin-symmetric convex body $B$, let $hat(M) \( T \, B \)$ be the largest length of an ordered sequence $x_1 \, dots.h \, x_m in T$ such that

$ \( x_j + "int" B \) ∩ "conv" { x_i : i < j } = diameter #h(2em) \( 1 lt.eq j lt.eq m \) \, $

with the first convex hull taken to be empty #cite(label("AMSTJ2004")) Section 2.

#thm([Corollary 5.1.])[
  (Separation from convexified packing).  #emph[For every $A \, C gt.eq 1$, there are an integer $n gt.eq 1$ and an origin-symmetric convex body $K subset bb(R)^n$ such that, with $L = \[ - 1 \, 1 \]^n$, 
$ log N \( K \, L \) > C log hat(M) \( K \, L \/ A \) . $

]
] <cor:convexified-separation>

#proof[
  An ordered $B$-convexly separated sequence has at most one point in each translate of $B \/ 4$: two such points have difference in $B \/ 2 subset "int" B$, contradicting the separation condition. Consequently $hat(M) \( T \, B \) lt.eq N \( T \, B \/ 4 \)$, with no boundary ambiguity for covers by closed translates. The universal convexified duality bound #cite(label("AMSTJ2004")) Theorem 2, applied to $K \, L \/ A$, gives
  $ hat(M) \( K \, L \/ A \) & lt.eq hat(M) \( A L^compose \, K^compose \/ 2 \)^2\
 & = hat(M) \( L^compose \, K^compose \/ \( 2 A \) \)^2\
 & lt.eq N \( L^compose \, K^compose \/ \( 8 A \) \)^2 . $
  Here the equality uses simultaneous dilation of both arguments. Choose $K \, L$ by Theorem 1 with $a = 8 A$ and $b = 2 C$. Taking logarithms in the displayed bound proves the corollary. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
