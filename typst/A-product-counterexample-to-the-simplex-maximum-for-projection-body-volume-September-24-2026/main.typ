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

#align(center)[#text(size: 16pt, weight: "bold")[A product counterexample to the simplex maximum \
for projection-body volume]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Throughout, a convex body in $bb(R)^d$ is compact and convex with nonempty interior, and $d gt.eq 2$. Write $\| K \|$ for its $d$-dimensional volume and $h_C \( x \) = max_(y in C) chevron.l x \, y chevron.r$ for the support function of a compact convex set $C$. The projection body $Pi_d K$, also written $Pi K$ when the dimension is evident, is defined by

$ h_(Pi K) \( u \) = "vol"_(d - 1) #scale(x: 120%, y: 120%)[\(] "proj"_(u^perp) K #scale(x: 120%, y: 120%)[\)] \, #h(2em) u in S^(d - 1) \, $

extended homogeneously to all of $bb(R)^d$. Here $S^(d - 1)$ is the Euclidean unit sphere and $"proj"_(u^perp)$ is orthogonal projection. We write $B_2^j$ for the Euclidean unit ball in $bb(R)^j$ and $kappa_j = \| B_2^j \|$. The functional under consideration is

#[#set math.equation(numbering: n => "(1)")
 $ R_d \( K \) = frac(\| Pi K \|, \| K \|^(d - 1)) \, #h(2em) c_d = frac(\( d + 1 \) d^d, d !) . $ <eq:functional>]

The extremal values of this affine-invariant functional are classical questions in convex geometry. Petty established the affine covariance of the projection-body operator [6]; see also [5] Equation (1). Brannen conjectured in 1996 that simplices maximize $R_d$ among all convex bodies [1]. The simplex value is $c_d$, as we verify below. Thus the proposed simplex upper bound is

#[#set math.equation(numbering: n => "(2)")
 $ \| Pi K \| lt.eq c_d \| K \|^(d - 1) . $ <eq:proposed-bound>]

It is the volume of $Pi K$ itself that occurs here, not the volume of its polar: the classical projection inequalities involving the polar concern a different functional. For $d gt.eq 3$, Petty’s separate minimum problem asks whether ellipsoids are the only minimizers of the same functional $R_d$; see [7] Section 1 for these distinctions.

In dimension three, Chen, Feng, Li, Xi, and Xu settle the minimum problem and also prove the bound $R_3 \( K \) lt.eq 18 = c_3$ for all three-dimensional convex bodies, with tetrahedra attaining equality [2] Theorems 1.1 and 1.2. Feng, Hu, Liu, and Xu give counterexamples to (2) in every dimension $d gt.eq 9$, using polytopes with at most $d + 2$ facets [3] Theorem 1.3. Their result already gives a negative answer to the unrestricted-dimensional simplex-maximum question. Their construction uses perturbed projections of a cube and Minkowski’s existence theorem [3] Section 4. The present paper supplies a direct Cartesian-product construction and its exact value: two ten-dimensional simplices suffice.

#thm([Theorem 1.])[
  #emph[Let $T_10 = "conv" \( 0 \, e_1 \, dots.h \, e_10 \) subset bb(R)^10$, where the $e_i$ are the coordinate unit vectors, and let $K = T_10 times T_10 subset bb(R)^20$. Then 
$ frac(R_20 \( K \), c_20) = frac(121 binom(20, 10), 21 dot.op 2^20) = frac(22 thin 355 thin 476, 22 thin 020 thin 096) > 1 . $

 Thus $K$ violates (2) in dimension twenty.]
] <thm:counterexample>

The exact witness in Theorem 1 provides an elementary illustration of the failure of the simplex maximum. The optimal upper constant and its maximizing bodies remain separate questions.

The useful mechanism is a product test: for full-dimensional polytopes $A subset bb(R)^r$ and $B subset bb(R)^s$, with $r \, s gt.eq 2$,

$ R_(r + s) \( A times B \) = R_r \( A \) R_s \( B \) . $

Consequently, the product $c_r c_s$ of the simplex values is a necessary lower bound for any universal upper constant in dimension $r + s$. The dimension-twenty counterexample comes from comparing two copies of the ten-dimensional simplex value with the twenty-dimensional simplex value. All identities used in that comparison are proved below.

The growth of upper constants with dimension is a further quantitative question. For centrally symmetric bodies, Henk gives the lower bound $2^d \( 9 \/ 8 \)^(floor.l d \/ 3 floor.r)$ for the optimal upper constant [4]. Iterating our product identity gives an exponential excess over the simplex benchmark: for some fixed $lambda > 1$ and every sufficiently large $n$, a product of simplices $K_n subset bb(R)^n$ satisfies $R_n \( K_n \) gt.eq lambda^n c_n$. Corollary 6 proves this consequence by repeating ten-dimensional factors and using one additional simplex to reach each dimension.

Section 2 derives the facet formula, the product identity, and affine covariance. Section 3 computes the simplex value by expressing its projection body as a cube plus one segment. Section 4 combines the identities and gives the exact integer comparison, then proves the exponential excess in all sufficiently large dimensions.

== 2 Facet vectors and Cartesian products <sec:facets>

We first express projection bodies of polytopes as sums of segments. The facets of a Cartesian product then separate into two families, which will make its normalized projection-body volume multiplicative. The facet formula is the polytopal case of Cauchy’s projection formula; see [7] Section 1. We include its proof to fix the factor $1 \/ 2$ on which the subsequent constants depend.

We use Minkowski addition $C + D = { c + d : c in C \, med d in D }$. Support functions add under this operation and determine compact convex sets uniquely. For the latter assertion, if $x in.not C$ and $y in C$ is nearest to $x$, minimization along each segment $\[ y \, z \] subset C$ gives $chevron.l x - y \, z - y chevron.r lt.eq 0$ for every $z in C$. The linear functional with vector $x - y$ therefore separates $x$ from $C$.

#thm([Lemma 2.])[
  #emph[Let $P subset bb(R)^d$, $d gt.eq 2$, be a full-dimensional convex polytope. For each facet $F$, let $s_F$ be its $\( d - 1 \)$-dimensional volume and $nu_F$ its outward unit normal. Then 
#[#set math.equation(numbering: n => "(3)")
 $ h_(Pi P) \( u \) = 1 / 2 sum_F s_F \| chevron.l nu_F \, u chevron.r \| \, #h(2em) u in bb(R)^d \, $ <eq:facet>]

 and therefore 
#[#set math.equation(numbering: n => "(4)")
 $ Pi P = sum_F [- frac(s_F nu_F, 2) \, frac(s_F nu_F, 2)] . $ <eq:zonotope>]

]
] <lem:facets>

#proof[
  First take $u$ to be a unit vector. Orthogonal projection from the hyperplane of $F$ to $u^perp$ has absolute Jacobian $\| chevron.l nu_F \, u chevron.r \|$. Indeed, for an orthonormal tangent basis $v_1 \, dots.h \, v_(d - 1)$, that Jacobian is $\| det \( v_1 \, dots.h \, v_(d - 1) \, u \) \|$, which equals the stated inner product in absolute value.
  Apart from a set of $\( d - 1 \)$-dimensional measure zero, a point in the projection of $P$ lies on the projections of exactly two facet interiors: the entry and exit points of its line parallel to $u$. To see that the exceptions are null, discard the boundary of the projection and the projections of all faces of dimension at most $d - 2$. Also discard projections of facets whose hyperplanes are parallel to $u$; these projections have dimension at most $d - 2$. Every remaining line meets $P$ in a nondegenerate interval with its two endpoints in facet interiors. Integrating this multiplicity gives (3) for unit $u$, and homogeneity gives the general case.
  The support function of $\[ - v \/ 2 \, v \/ 2 \]$ is $1 / 2 \| chevron.l v \, u chevron.r \|$. Adding these support functions proves (4). ◻
]

#thm([Proposition 3.])[
  #emph[Let $A subset bb(R)^r$ and $B subset bb(R)^s$ be full-dimensional convex polytopes, where $r \, s gt.eq 2$. In the orthogonal product space $bb(R)^(r + s) = bb(R)^r times bb(R)^s$, 
#[#set math.equation(numbering: n => "(5)")
 $ Pi \( A times B \) = \( \| B \| Pi A \) times \( \| A \| Pi B \) . $ <eq:product-body>]

 In particular, 
#[#set math.equation(numbering: n => "(6)")
 $ R_(r + s) \( A times B \) = R_r \( A \) R_s \( B \) . $ <eq:multiplicative>]

]
] <prop:product>

#proof[
  The face exposed by a linear functional $\( u \, v \)$ on $A times B$ is the product of the faces exposed by $u$ and $v$. Dimensions add under Cartesian products. A nonzero linear functional exposes a proper face of a full-dimensional body, so if both $u$ and $v$ are nonzero, the product face has codimension at least two. A facet therefore has one facet factor and one whole factor. Thus the facets are $F times B$ and $A times G$, with area-normal vectors
  $ \( \| B \| s_F nu_F \, 0 \) quad upright("and") quad \( 0 \, \| A \| s_G nu_G \) \, $
  respectively. The area factors are products because the two coordinate spaces are orthogonal. Lemma 2 now gives
  $ h_(Pi \( A times B \)) \( u \, v \) = \| B \| h_(Pi A) \( u \) + \| A \| h_(Pi B) \( v \) . $
  This is the support function of the right side of (5), proving that identity. Hence
  $ R_(r + s) \( A times B \) & = frac(\| B \|^r \| A \|^s \| Pi A \| \| Pi B \|, \( \| A \| \| B \| \)^(r + s - 1))\
 & = frac(\| Pi A \|, \| A \|^(r - 1)) frac(\| Pi B \|, \| B \|^(s - 1)) \, $
  as required. ◻
]

The product identity reduces our comparison to the values of its factors. To use simplices as a dimension-dependent benchmark, we also need to know that all full-dimensional simplices of a fixed dimension have the same value. The following affine covariance formula supplies that fact.

#thm([Lemma 4.])[
  #emph[Let $P subset bb(R)^d$, $d gt.eq 2$, be a convex body. For every invertible linear map $L : bb(R)^d arrow.r bb(R)^d$, 
$ Pi \( L P \) = \| det L \| L^(- t) Pi P \, #h(2em) R_d \( L P \) = R_d \( P \) \, $

 where $L^(- t)$ denotes the inverse transpose. Translations also preserve $R_d$.]
] <lem:affine>

#proof[
  First suppose that $P$ is a polytope. The transformed outward unit normal of $F$ is $L^(- t) nu_F \/ parallel L^(- t) nu_F parallel$. Its area is
  $ s_(L F) = \| det L \| thin parallel L^(- t) nu_F parallel thin s_F . $
  For the area formula, take a prism of height one over $F$, extending in direction $nu_F$. Its image has volume $\| det L \| s_F$ and height $1 \/ parallel L^(- t) nu_F parallel$ over $L F$; dividing volume by height gives the formula. Thus each area-normal vector transforms by $\| det L \| L^(- t)$, including when $det L < 0$. Apply (4). The absolute determinant of this map is $\| det L \|^(d - 1)$, exactly the scaling of $\| L P \|^(d - 1)$. Translation invariance follows directly from projection volumes.
  For completeness, we justify the passage to an arbitrary convex body and the existence of its projection body. Translate an interior point of $P$ to the origin, choose $R > 0$ with $P subset R B_2^d$, and take increasing inscribed polytopes $P_m$ containing a fixed ball $a B_2^d$, $a > 0$, such that
  $ P_m subset P subset P_m + epsilon_m B_2^d subset \( 1 + epsilon_m \/ a \) P_m \, #h(2em) epsilon_m arrow.r 0 . $
  Take, for example, convex hulls of cumulative finite nets in $P$ and a fixed inscribed polytope containing $a B_2^d$. Put $lambda_m = 1 + epsilon_m \/ a$, and for unit $u$ write $F \( u \) = "vol"_(d - 1) \( "proj"_(u^perp) P \)$ and $f_m \( u \) = h_(Pi P_m) \( u \)$. Projection and volume monotonicity give
  $ 0 lt.eq F \( u \) - f_m \( u \) lt.eq \( lambda_m^(d - 1) - 1 \) kappa_(d - 1) R^(d - 1) . $
  Thus $f_m arrow.r F$ uniformly. The increasing bodies $Pi P_m$ lie in a fixed ball and contain $kappa_(d - 1) a^(d - 1) B_2^d$, so their union closure is a convex body with support function $F$, namely $Pi P$. The support inequalities also give
  $ Pi P_m subset Pi P subset lambda_m^(d - 1) Pi P_m \, #h(2em) \| Pi P_m \| lt.eq \| Pi P \| lt.eq lambda_m^(d \( d - 1 \)) \| Pi P_m \| . $
  Likewise $\| P_m \| lt.eq \| P \| lt.eq lambda_m^d \| P_m \|$. Applying $L$ to the original sandwich gives the same convergence for $L P_m$. Passing to the limit in the polytope identity proves covariance and, by these volume inequalities, the asserted invariance of $R_d$. ◻
]

== 3 The simplex value <sec:simplex>

We now compute the value to which the product will be compared. Only one extra segment beyond a coordinate cube is needed to describe the projection body of a simplex.

#thm([Proposition 5.])[
  #emph[For $d gt.eq 2$, the standard simplex $T_d = "conv" \( 0 \, e_1 \, dots.h \, e_d \) subset bb(R)^d$ satisfies 
$ \| T_d \| = frac(1, d !) \, #h(2em) \| Pi T_d \| = frac(d + 1, \( \( d - 1 \) ! \)^d) \, #h(2em) R_d \( T_d \) = c_d . $

 Every full-dimensional $d$-simplex has the same value $c_d$.]
] <prop:simplex>

#proof[
  The simplex volume follows by iterated base and height. Put $w = e_1 + dots.h.c + e_d$. The coordinate facets have area-normal vectors $- e_i \/ \( d - 1 \) !$. The remaining facet has unit normal $w \/ sqrt(d)$. Dropping its last coordinate projects it onto the standard $\( d - 1 \)$-simplex with Jacobian $1 \/ sqrt(d)$; its area-normal vector is therefore $w \/ \( d - 1 \) !$. In the centered segments of Lemma 2, changing the sign of a generator changes no segment. Translating each segment to start at the origin therefore shows that $Pi T_d$ is a translate of
  $ frac(\[ 0 \, 1 \]^d + \[ 0 \, w \], \( d - 1 \) !) . $
  To compute the numerator’s volume, let $Q = \[ 0 \, 1 \]^d$. Every nonempty fiber of $Q$ parallel to $w$ is an interval, and adding $\[ 0 \, w \]$ increases its length by $parallel w parallel$. The base projection is unchanged. Fubini therefore gives
  $ \| Q + \[ 0 \, w \] \| = \| Q \| + parallel w parallel "vol"_(d - 1) \( "proj"_(w^perp) Q \) = 1 + h_(Pi Q) \( w \) . $
  The cube has two facets of area one in each coordinate direction, so (3) gives $h_(Pi Q) \( w \) = d$. Thus $\| Q + \[ 0 \, w \] \| = d + 1$; Figure 1 illustrates the two-dimensional case. Dilation by $1 \/ \( d - 1 \) !$ and division by $\| T_d \|^(d - 1)$ now yield
  $ R_d \( T_d \) = frac(\( d + 1 \) \( d ! \)^(d - 1), \( \( d - 1 \) ! \)^d) = frac(\( d + 1 \) d^d, d !) . $
  Every full-dimensional simplex is an invertible affine image of $T_d$, so Lemma 4 proves the final assertion. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.5, 1.5), fill: rgb("#ededed"), stroke: none)
  line((1.5, 0), (3, 1.5), (3, 3), (1.5, 1.5), close: true, fill: rgb("#dedeff"), stroke: none)
  line((0, 1.5), (1.5, 1.5), (3, 3), (1.5, 3), close: true, fill: rgb("#ffffc4"), stroke: none)
  line((0, 0), (1.5, 0), (3, 1.5), (3, 3), (1.5, 3), (0, 1.5), close: true, stroke: (thickness: 0.8pt, join: "round"))
  line((0, 1.5), (1.5, 1.5), (1.5, 0), stroke: (thickness: 0.4pt, join: "round"))
  line((1.5, 1.5), (3, 3), stroke: (thickness: 0.4pt, join: "round"))
  content((0.75, 0.75), [$Q$])
  content((2.25, 1.5), [$1$])
  content((1.5, 2.25), [$1$])
  content((0, 0), [$0$], anchor: "north-east", padding: 0.1176cm)
  content((3, 3), [$(2,2)$], anchor: "south-west", padding: 0.1176cm)
  line((3.9, 0.45), (5.4, 1.95), stroke: (thickness: 0.8pt, join: "round"), mark: (end: ">"))
  content((4.725, 0.975), [$w=(1,1)$], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The planar extrusion $Q + \[ 0 \, \( 1 \, 1 \) \]$, with $Q = \[ 0 \, 1 \]^2$, consists of the unit square and two parallelograms of area one. Its area is $3$. The fiber argument in Proposition 5 proves the corresponding volume $d + 1$ in every dimension. ],
) <fig:extrusion>

== 4 The counterexample and exponential excess <sec:counterexample>

The geometric work is complete. The product formula turns the comparison in dimension twenty into a calculation with two simplex constants.

#proof[
  The product $K = T_10 times T_10$ is compact and convex with nonempty interior in $bb(R)^20$. Propositions 3 and 5 give
  $ R_20 \( K \) = R_10 \( T_10 \)^2 = (frac(11 dot.op 10^10, 10 !))^2 . $
  Consequently,
  $ frac(R_20 \( K \), c_20) = frac(121 dot.op 10^20 dot.op 20 !, \( 10 ! \)^2 dot.op 21 dot.op 20^20) = frac(121 binom(20, 10), 21 dot.op 2^20) = frac(22 thin 355 thin 476, 22 thin 020 thin 096) > 1 . $
  Here $binom(20, 10) = 184 thin 756$, and the exact integer certificate is
  $ 121 dot.op 184 thin 756 - 21 dot.op 1 thin 048 thin 576 = 335 thin 380 > 0 . $
  This is an exact strict violation of (2). ◻
]

More generally, for $r \, s gt.eq 2$, the same two propositions give the explicit product test

$ frac(R_(r + s) \( T_r times T_s \), c_(r + s)) = frac(\( r + 1 \) \( s + 1 \), r + s + 1) binom(r + s, r) frac(r^r s^s, \( r + s \)^(r + s)) . $

Thus any universal upper constant in dimension $r + s$ must be at least $c_r c_s$.

Iterating the product test gives the following quantitative consequence.

#thm([Corollary 6.])[
  #emph[There exist a constant $lambda > 1$ and an integer $N gt.eq 20$ such that, for every integer $n gt.eq N$, some full-dimensional convex polytope $K_n subset bb(R)^n$ satisfies 
$ frac(R_n \( K_n \), R_n \( T_n \)) gt.eq lambda^n . $

 The polytopes $K_n$ may be chosen as Cartesian products of simplices.]
] <cor:exponential-excess>

#proof[
  We use repeated ten-dimensional factors to obtain exponential growth, and one factor of dimension between ten and nineteen to reach every sufficiently large dimension. For $r in { 0 \, dots.h \, 9 }$, put $d_r = 10 + r$. Every integer $n gt.eq 20$ has a unique representation $n = 10 k + d_r$ with $k gt.eq 1$. In the orthogonal coordinate product space, take
  $ K_n = T_10^(thin k) times T_(d_r) . $
  Here $T_10^(thin k)$ denotes the $k$-fold Cartesian product. All factors and their successive products are full-dimensional convex polytopes, with each factor dimension at least ten. Thus Propositions 3 and 5 apply iteratively and give
  $ R_n \( K_n \) = c_10^k c_(d_r) . $
  To compare this value with $c_n$, we bound the simplex constants by $n + 1$ times a fixed exponential, whose rate is smaller than that supplied by the ten-dimensional factors. Put $beta = 11 \/ 4$. The exponential series gives
  $ e = 5 / 2 + sum_(j = 3)^oo frac(1, j !) < 5 / 2 + 1 / 6 sum_(j = 0)^oo 3^(- j) = beta \, $
  since the successive ratios in the tail are strictly less than $1 \/ 3$. The positive term $n^n \/ n !$ in the series for $e^n$ is strictly smaller than the full sum, so
  $ c_n < \( n + 1 \) e^n < \( n + 1 \) beta^n #h(2em) \( n gt.eq 2 \) . $
  For the fixed ten-dimensional block, exact arithmetic yields
  $ c_10 = frac(17 thin 187 thin 500, 567) \, #h(2em) A := c_10 / beta^10 = frac(1 thin 638 thin 400 thin 000 thin 000, 1 thin 336 thin 956 thin 340 thin 797) > 1 . $
  Choose a fixed $lambda$ with $1 < lambda < A^(1 \/ 10)$. Combining these estimates with the formula for $R_n \( K_n \)$ gives
  $ frac(R_n \( K_n \), R_n \( T_n \) lambda^n) > c_(d_r) beta^(- d_r) lambda^(- d_r) frac(\( A \/ lambda^10 \)^k, 10 k + d_r + 1) . $
  For each fixed $r$, the right side tends to infinity as $k arrow.r oo$, because $A \/ lambda^10 > 1$. A threshold can therefore be chosen in each of the ten residue classes; their maximum, enlarged to be at least twenty, gives one $N$ for all $n gt.eq N$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[N.~S.~Brannen, #emph[Volumes of projection bodies], Mathematika #strong[43] (1996), no.~2, 255--264. #link("https://doi.org/10.1112/S002557930001175X")[doi:10.1112/S002557930001175X].]
#bibitem([2])[S.~Chen, Y.~Feng, Y.~Li, D.~Xi, and L.~Xu, #emph[Petty's conjectured projection inequality in dimension three], preprint, 2026, MathSciDoc:2608.23001. #link("https://archive.ymsc.tsinghua.edu.cn/pacm_download/741/12780-pettyinequality.pdf")[Full text].]
#bibitem([3])[Y.~Feng, S.~Hu, W.~Liu, and L.~Xu, #emph[On the reverse projection inequality], preprint, 2026, MathSciDoc:2608.23002. #link("https://archive.ymsc.tsinghua.edu.cn/pacm_download/743/12781--2026.8.26.pdf")[Full text].]
#bibitem([4])[M.~Henk, #emph[Note on projection bodies of zonotopes with $n + 1$ generators], Acta Mathematica Scientia #strong[45] (2025), 96--103. #link("https://doi.org/10.1007/s10473-025-0107-9")[doi:10.1007/s10473-025-0107-9].]
#bibitem([5])[M.~Ludwig, #emph[Projection bodies and valuations], Advances in Mathematics #strong[172] (2002), no.~2, 158--168. #link("https://doi.org/10.1016/S0001-8708(02)00021-X")[doi:10.1016/S0001-8708(02)00021-X].]
#bibitem([6])[C.~M.~Petty, #emph[Projection bodies], in #emph[Proceedings of the Colloquium on Convexity (Copenhagen, 1965)], Københavns Universitet Matematiske Institut, Copenhagen, 1967, pp.~234--241.]
#bibitem([7])[C.~Saroglou, #emph[On the shape of a convex body with respect to its second projection body], Advances in Applied Mathematics #strong[67] (2015), 55--74. #link("https://doi.org/10.1016/j.aam.2015.03.004")[doi:10.1016/j.aam.2015.03.004]. Preprint: #link("https://arxiv.org/abs/1409.4347v2")[arXiv:1409.4347v2].]


