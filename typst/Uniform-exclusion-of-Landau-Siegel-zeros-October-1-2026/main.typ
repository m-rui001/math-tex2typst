#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform exclusion of Landau--Siegel zeros]]
#align(center)[OpenAI]
#align(center)[October 1, 2026]

== 1 Introduction <sec:intro>

For a primitive Dirichlet character $chi$ of conductor $q$, let

$ L \( s \, chi \) = sum_(n gt.eq 1) frac(chi \( n \), n^s) wide \( "Re" s > 1 \) \, $

and use its analytic continuation elsewhere. For an absolute constant $c_1 > 0$, the classical region

$ "Re" s gt.eq 1 - frac(c_1, log \( q \( \| "Im" s \| + 2 \) \)) $

is zero-free except for a possible simple real zero attached to a real character [3] Section 14.
  Excluding this possibility uniformly is the Landau–Siegel zero problem. We prove its logarithmic formulation.

#thm([Theorem 1.])[
  #emph[There is an absolute constant $c > 0$ such that every real zero $beta
    in \( 0 \, 1 \)$ of every primitive nonprincipal real Dirichlet $L$-function of conductor $q gt.eq 3$ satisfies
#[#set math.equation(numbering: n => "(1.1)")
 $ \( 1 - beta \) log q gt.eq c . $ <eq:main>]

]
] <thm:main>

Possible exceptional zeros obstruct uniform estimates for primes in arithmetic progressions.
  They also affect the study of quadratic class numbers through the values $L \( 1 \, chi \)$ in Dirichlet’s
  class-number formula. Siegel’s theorem of 1935 gives $L \( 1 \, chi \) gt.double_epsilon
  q^(- epsilon)$ for every $epsilon > 0$, with an ineffective constant [11,3].
  This estimate leaves open the possibility of a sequence of real zeros with $\( 1 - beta \) log q arrow.r 0$.
  More uniformly across characters, Page’s theorem gives an absolute constant $c_2 > 0$ such that,
  for every $Q gt.eq 3$, at most one primitive real character of conductor at most $Q$ has a real zero in
  $\( 1 - c_2 \/ log Q \, 1 \)$ [9]. The common window depends on $Q$, not on each character’s own conductor.
  The Deuring–Heilbronn phenomenon, developed quantitatively by Linnik and Heath-Brown,
  forces other zeros away from $1$ [8,6]; see Benli, Goel, Twiss, and Zaman [1] for a recent explicit form.
  Friedlander and Iwaniec [5] discuss the logarithmic zero-gap conjecture and its relation to lower bounds for
  $L \( 1 \, chi \)$.

=== The argument <the-argument>

The analytic starting point is that a zero with $\( 1 - beta \) log
  q$ small forces a shortage of primes with $chi \( p \) = 1$; compare [5] Section 5.
  Consequently, primes with $chi \( p \) = - 1$ carry enough logarithmic mass for the determinant comparison.
  We give the short logarithmic-derivative proof in Section 2.

The remaining argument is algebraic. Associate to $chi$ a quadratic field $bb(Q) \( sqrt(d) \)$ and adjoin
  $sqrt(2)$. Except for one fixed quadratic field, this gives a biquadratic field $K = bb(Q) \( a \, b \)$,
  with $a^2 = d$ and $b^2 = 2$. Let $sigma$ change the sign of $a$ and let $tau$ change the sign of $b$.
  For $n = \( n_1 \, n_2 \, n_3 \, n_4 \) in { 0 \, dots.h \, N - 1 }^4$, put

$ theta_n = n_1 + n_2 a + n_3 b + n_4 a b . $

We form rows indexed by triples $alpha in bb(Z)_(gt.eq 0)^3$ whose entries are

$ theta_n^(alpha_1) sigma \( theta_n \)^(alpha_2) sigma tau \( theta_n \)^(alpha_3) . $

There are $N^4$ columns. The interpolation estimate supplies enough independent rows to form a nonzero square
  determinant at the natural degree scale $U = N^(4 \/ 3)$, for which $U^3 = N^4$.
  To favor the first exponent, we order the rows by $alpha_1 + H alpha_2 +
  H alpha_3$ and retain a row exactly when it increases the span of its predecessors.
  Here the integer $H$ will be large and fixed. Summed over the retained rows,
  the last two exponents account for an arbitrarily small fraction of the total degree.

At an odd prime $p divides.not q$ with $chi \( p \) = - 1$,
  taking $p$-th powers modulo $p$ sends $theta_n$ to either $sigma \( theta_n \)$ or $sigma tau \( theta_n \)$.
  When $p > H$, replacing a block of $p$ first factors by the corresponding conjugate strictly lowers the row
  weight. Subtraction therefore preserves the determinant and extracts powers of $p$ from the rows.
  Primes up to $U$ contribute the leading factor $log U$ to the divisibility bound,
  whereas the evaluation points contribute $log N = 3 / 4 log U$ to the size bound.
  This strict difference drives the contradiction. Taking $N$ to be a sufficiently large fixed power of $q$
  controls the additional $log q$ term in the size bound. Section 4 constructs the rows,
  Section 5 proves the two bounds, and Section 6 makes the parameter choices.

=== Interpolation and arithmetic context <interpolation-and-arithmetic-context>

The reusable algebraic input is Lemma 3, proved in Section 3.
  It bounds the separate degrees needed to interpolate on a linear image of an integer box in $bb(C)^4$.
  Its hypothesis is that the kernel is spanned by a vector whose coordinates are linearly independent over
  $bb(Q)$. The estimate is uniform in the linear map and in the choice of coordinates on the three-dimensional
  image. This allows the interpolation box to have an arbitrarily large fixed aspect ratio without introducing a
  constant depending on the field. The proof uses a dimension count,
  a nearest-point argument for an integer polytope, and Lagrange interpolation on a supporting face.

General multiplicity estimates on commutative algebraic groups are developed in [10];
  rectangular derivative conditions and interpolation duality appear in [4] Theorem 1.1 and Lemma 1.3.
  The estimate proved here makes the coefficient and coordinate uniformity explicit.
  The final comparison belongs to the interpolation-determinant method described by Laurent [7] Section 6.
  Bost’s arithmetic algebraicity criteria use spaces of derivations closed under $p$-fold composition at almost
  all prime ideals [2] Theorems 2.1 and 2.3. In the torus interpretation recalled in Section 3,
  our argument controls this operation on one distinguished derivation at selected primes and uses it directly for
  determinant divisibility, rather than applying an algebraicity criterion.
  All algebraic estimates used in the proof are established below.

All logarithms are natural. Constants implicit in $O \( dot.op \)$ and $lt.double$ are absolute unless a
  dependence is specified. All vector-space spans are over the indicated field, and we use $z^0 = 1$,
  including when $z = 0$.

== 2 The prime bias forced by a real zero <sec:analytic>

We first record the prime-sum estimate that will be compared with the determinant bound.
  Let $chi$ be primitive, nonprincipal, and real of conductor $q gt.eq 3$,
  and let $beta in \( 0 \, 1 \)$ be a real zero. Write

$ ell = log q \, wide delta = \( 1 - beta \) ell . $

#thm([Lemma 2.])[
  #emph[For $X gt.eq 3$,
#[#set math.equation(numbering: n => "(2.1)")
 $ sum_(p lt.eq X\
chi \( p \) = 1) frac(log p, p) lt.double ell + frac(delta \( log X \)^2, ell) . $ <eq:primebias>]

 Consequently, for each integer $H gt.eq 2$,
#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(H < p lt.eq X\
p divides.not 2 q\
chi \( p \) = - 1) frac(log p, p) gt.eq log X - C ell - C frac(delta \( log X \)^2, ell) - C_H \, $ <eq:mass>]

 where $C$ is absolute and $C_H$ depends only on $H$.]
] <lem:primebias>

#proof[
  Put $epsilon = \( 1 - chi \( - 1 \) \) \/ 2$. For the completed function
  $ Lambda_chi \( s \) = \( q \/ pi \)^(\( s + epsilon \) \/ 2) Gamma
    #scale(x: 120%, y: 120%)[\(] \( s + epsilon \) \/ 2 #scale(x: 120%, y: 120%)[\)] L \( s \, chi \) \, $
  the Hadamard product and functional equation give, for real $s > 1$,
  #[#set math.equation(numbering: n => "(2.3)")
   $ - L' / L \( s \, chi \) = 1 / 2 log q / pi + 1 / 2 Gamma' /
     Gamma #scale(x: 120%, y: 120%)[\(] \( s + epsilon \) \/ 2 #scale(x: 120%, y: 120%)[\)] -
     sum_rho "Re" frac(1, s - rho) . $ <eq:hadamard>]
  Here $rho$ runs over the nontrivial zeros with multiplicity.
    The sum of real parts converges, and each term is nonnegative.
    This is the standard logarithmic-derivative identity; see [3] Sections 12 and 14.
    The functional equation cancels the real constant from the Hadamard product.
    For $1 < s lt.eq 2$, the gamma term is bounded for both parities.
    Keeping only the term for $beta$ and using $- zeta' \/ zeta \( s \) = 1 \/ \( s - 1 \) + O \( 1 \)$ gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ - zeta' / zeta \( s \) - L' / L \( s \, chi \) lt.eq C ell + frac(1, s - 1) -
     frac(1, s - beta) . $ <eq:logderivative>]
  Take $s = 1 + 1 \/ log X$, which lies in $\( 1 \, 2 \)$ for $X gt.eq 3$.
    Writing $Lambda \( n \)$ for the von Mangoldt function, the Euler products give the nonnegative series
  $ - zeta' / zeta \( s \) - L' / L \( s \, chi \) = sum_(n gt.eq 1)
    frac(Lambda \( n \) \( 1 + chi \( n \) \), n^s) gt.eq 2 / e sum_(p lt.eq X\
chi \( p \) = 1) frac(log p, p) . $
  Also,
  $ frac(1, s - 1) - frac(1, s - beta) = frac(1 - beta, \( s - 1 \) \( s - beta \))
    lt.eq \( 1 - beta \) \( log X \)^2 . $
  This proves (2.1). To obtain (2.2), use Mertens’ estimate and the elementary bound for primes dividing $q$:
  $ sum_(p lt.eq X) frac(log p, p) = log X + O \( 1 \) \, wide sum_(p divides q) frac(log p, p) lt.eq log q . $
  Removing primes at most $H$ costs a constant depending only on $H$. ◻
]

== 3 Interpolation on a projected integer box <sec:interpolation>

The purpose of this section is to obtain a nonzero evaluation determinant using monomials whose separate degrees
  may be very different. No arithmetic estimates enter the interpolation lemma.

#thm([Lemma 3.])[
  #emph[Let $A : bb(C)^4 arrow.r bb(C)^3$ be a surjective linear map, with $ker A = bb(C) c$,
    where the four coordinates of $c$ are linearly independent over $bb(Q)$.
    Let $N gt.eq 1$ and $t_1 \, t_2 \, t_3$ be integers satisfying
#[#set math.equation(numbering: n => "(3.1)")
 $ t_j gt.eq 3 \( N - 1 \) quad \( 1 lt.eq j lt.eq 3 \) \, wide
   product_(j = 1)^3 #scale(x: 120%, y: 120%)[\(] t_j - 3 \( N - 1 \) +
   1 #scale(x: 120%, y: 120%)[\)] > \( 4 N - 3 \)^4 . $ <eq:budget>]

 Set $E_N = { 0 \, dots.h \, N - 1 }^4$ and
$ cal(P)_t = { B in bb(C) \[ z_1 \, z_2 \, z_3 \] : deg_(z_j) B lt.eq t_j upright(" for ") 1 lt.eq j lt.eq 3 } . $

 Then the evaluation map $B mapsto \( B \( A n \) \)_(n in E_N)$ from $cal(P)_t$ to $bb(C)^(E_N)$ is surjective.]
] <lem:interpolation>

#proof[
  Suppose the evaluation map is not surjective. There are complex numbers $v_n$, not all zero, such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ sum_(n in E_N) v_n B \( A n \) = 0 wide \( B in cal(P)_t \) . $ <eq:moments>]
  Let $S = { n : v_n eq.not 0 }$ and $P = "conv" \( S \) subset bb(R)^4$.
    We construct the test polynomial as a product. A translated polynomial will vanish at $A n$ for every $n in
    S$ outside one supporting face of $P$. A second polynomial will select a single vertex on that face,
    with total degree at most $3 \( N - 1 \)$.
  Put $cal(K) = 4 P$. For $b_j = t_j - 3 \( N - 1 \)$, the polynomials of separate degrees at most $b_j$ form a
    vector space of dimension $product_j \( b_j + 1 \)$. Since
  $ cal(K) subset \[ 0 \, 4 \( N - 1 \) \]^4 \, wide \# \( cal(K) ∩ bb(Z)^4 \) lt.eq \( 4 N - 3 \)^4 <
    product_j \( b_j + 1 \) \, $
  there is a nonzero polynomial $R$ with $deg_(z_j) R lt.eq b_j$ and
  #[#set math.equation(numbering: n => "(3.3)")
   $ R \( A m \) = 0 wide \( m in cal(K) ∩ bb(Z)^4 \) . $ <eq:zeros>]
  #emph[A supporting face.] The polynomial $R compose A$ is nonzero because $A$ is surjective.
    A nonzero polynomial on $bb(C)^4$ cannot vanish on all of $bb(Z)^4$:
    this follows by applying the one-variable root bound successively to its four coordinates.
    Choose $m in bb(Z)^4$ with $R \( A m \) eq.not 0$ whose distance to $cal(K)$ is least.
    Such a minimum exists because bounded neighborhoods of the compact set $cal(K)$ contain finitely many lattice
    points. Let $y in cal(K)$ be nearest to $m$ and set $h = m - y$. By (3.3), $h eq.not 0$.
  The nearest-point inequality $h dot.op \( x - y \) lt.eq 0$ for $x in cal(K)$ shows that $y \/
    4$ belongs to the supporting face
  $ G = { v in P : h dot.op v = max_(w in P) h dot.op w } . $
  This face has dimension at most three: if $P$ is four-dimensional then $G$ is proper, and otherwise $dim G lt.eq
    dim P lt.eq 3$. Removing affine dependencies from a convex combination expresses $y \/
    4$ as a combination of at most four vertices of $G$. One coefficient is at least $1 \/ 4$.
    Choosing its vertex $u$ gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ u in S ∩ G \, wide y - u in 3 P . $ <eq:vertex>]
  Indeed, subtracting $u$ from four times that convex combination leaves nonnegative coefficients with sum three.
  For $n in S \\ G$, define
  $ y' = y + n - u in 4 P \, wide m' = m + n - u = y' + h . $
  The inclusion follows from (3.4). Since $h dot.op \( u - n \) > 0$,
    for sufficiently small $eta > 0$ the point $y' + eta \( y - y' \) in cal(K)$ satisfies
  #[#set math.equation(numbering: n => "(3.5)")
   $ parallel m' - \[ y' + eta \( y - y' \) \] #scale(x: 120%, y: 120%)[parallel]^2 = parallel h -
     eta \( u - n \) parallel^2 < parallel h parallel^2 . $ <eq:distance>]
  Thus $m'$ is closer to $cal(K)$ than $m$ is. By the choice of $m$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ R #scale(x: 120%, y: 120%)[\(] A \( m + n - u \) #scale(x: 120%, y: 120%)[\)] =
     0 wide \( n in S \\ G \) . $ <eq:offface>]
  Figure 1 illustrates the strict decrease in distance.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (5.04, 0), (5.32, 2.24), (2.94, 2.8), (1.4, 2.1), close: true, fill: rgb("#f2f2ff"), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  content((3.71, 0.56), [#text(size: 9pt)[$cal(K) =4P$]])
  line((1.96, 2.8), (4.76, 2.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((2.94, 2.8), (2.94, 4.2), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.94, 3.5), [#text(size: 9pt)[$h$]], anchor: "west", padding: 0.1176cm)
  line((1.26, 0.98), (1.26, 2.38), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.26, 1.68), [#text(size: 9pt)[$h$]], anchor: "east", padding: 0.1176cm)
  line((1.26, 0.98), (2.94, 2.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((1.26, 0.98), (1.848, 1.617), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  line((1.26, 2.38), (1.848, 1.617), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((2.94, 2.8), radius: 0.05292, fill: black, stroke: none)
  content((2.94, 2.8), [#text(size: 9pt)[$y$]], anchor: "west", padding: 0.1176cm)
  circle((2.94, 4.2), radius: 0.05292, fill: black, stroke: none)
  content((2.94, 4.2), [#text(size: 9pt)[$m$]], anchor: "south", padding: 0.1176cm)
  circle((1.26, 0.98), radius: 0.05292, fill: black, stroke: none)
  content((1.26, 0.98), [#text(size: 9pt)[$y'$]], anchor: "north", padding: 0.1176cm)
  circle((1.26, 2.38), radius: 0.05292, fill: black, stroke: none)
  content((1.26, 2.38), [#text(size: 9pt)[$m'$]], anchor: "south-east", padding: 0.1176cm)
  circle((1.848, 1.617), radius: 0.05292, fill: black, stroke: none)
  content((1.848, 1.617), [#text(size: 9pt)[$z_ eta$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: Schematic of (3.5). Both $y$ and $y'$ lie in $cal(K)$, and $m - y = m' - y' = h$. Moving to $z_eta = y' + eta \( y - y' \)$ decreases the distance to $m'$ because $h dot.op \( y - y' \) > 0$. The dashed red segment is shorter than $parallel h parallel$; the argument takes place in $bb(R)^4$. ],
  ) <fig:nearest>
  #emph[Interpolation on the face.] The integer vertices of $G$ span an affine space of dimension at most three.
    Solving their affine linear equations over $bb(Q)$ and clearing denominators gives a hyperplane
  $ cal(H) = { v in bb(C)^4 : r dot.op v = k } \, wide 0 eq.not r in bb(Z)^4 \, quad k in bb(Z) \, $
  containing $G$. Rational independence gives $r dot.op c eq.not 0$.
    The restriction $A \|_(cal(H))$ is therefore an affine bijection onto $bb(C)^3$:
    each affine line parallel to $ker A$ meets $cal(H)$ exactly once.
  Choose $i_0$ with $r_(i_0) eq.not 0$. The other three coordinates determine a point of $cal(H)$.
    Let $lambda_i \( z \)$, for $i eq.not i_0$, be those affine coordinate functions of
    $\( A \|_(cal(H)) \)^(- 1) \( z \)$. Thus $lambda_i \( A n \) = n_i$ for $n in cal(H)$. The Lagrange polynomial
  $ Q \( z \) = product_(i eq.not i_0) med product_(0 lt.eq a < N\
a eq.not u_i) frac(lambda_i \( z \) - a, u_i - a) $
  has total degree at most $3 \( N - 1 \)$ and satisfies
  $ Q \( A n \) = cases(delim: "{", 1 \, & n = u \,, 0 \, & n in \( S ∩ G \) \\ { u } .) $
  The denominators are nonzero integers; empty products are $1$.
  Now set $B \( z \) = Q \( z \) R \( z + A \( m - u \) \)$.
    Translation preserves each separate degree of $R$, and the total degree bound on $Q$ bounds each of its
    separate degrees. Hence $B in cal(P)_t$. Equation (3.6) eliminates the terms off $G$,
    and $Q$ eliminates all remaining terms except the one at $u$. Substitution in (3.2) gives the contradiction
  $ 0 = sum_(n in S) v_n Q \( A n \) R #scale(x: 120%, y: 120%)[\(] A \( m + n - u \)
    #scale(x: 120%, y: 120%)[\)] = v_u R \( A m \) eq.not 0 . $
  ◻
]

#thm([Corollary 4.])[
  #emph[Let $A$ satisfy the hypotheses of Lemma 3. For integers $1 lt.eq H lt.eq N$, set
$ U = N^(4 \/ 3) \, wide T_1 = 32 H^(2 \/ 3) U \, wide T_2 = T_3 = 32 H^(- 1 \/ 3) U . $

 The rows $\( \( A n \)_1^(alpha_1) \( A n \)_2^(alpha_2) \( A n \)_3^(alpha_3) \)_(n in E_N)$,
   with $alpha in bb(Z)_(gt.eq 0)^3$ and $alpha_j lt.eq T_j$, span $bb(C)^(E_N)$.
   The constant $32$ is independent of $A$ and $H$.]
] <cor:rectangle>

#proof[
  Put $t_j = floor.l T_j floor.r$. Since $H lt.eq N$, every $T_j gt.eq 32 N$, and $T_1 T_2 T_3 = 32^3 N^4$.
    In particular $t_j gt.eq 3 \( N - 1 \)$, and
  $ product_(j = 1)^3 #scale(x: 120%, y: 120%)[\(] t_j - 3 \( N - 1 \) +
    1 #scale(x: 120%, y: 120%)[\)] > product_(j = 1)^3 #scale(x: 120%, y: 120%)[\(] T_j -
    3 \( N - 1 \) #scale(x: 120%, y: 120%)[\)] gt.eq frac(T_1 T_2 T_3, 8) = 4096 N^4 > \( 4 N - 3 \)^4 . $
  Apply Lemma 3 to the monomial basis of $cal(P)_t$. ◻
]

#prodef([Remark 5.])[
  The connection with multiplicity estimates is immediate. On $\( bb(C)^times \)^4$, write $D_j =
    sum_i A_(j i) x_i partial \/ partial x_i$. For $x^n = x_1^(n_1) dots.h.c x_4^(n_4)$,
    $\( D_1^(alpha_1) D_2^(alpha_2) D_3^(alpha_3) x^n \) \( 1 \, 1 \, 1 \, 1 \) = \( A n \)^alpha$.
    Thus Corollary 4 is a rectangular multiplicity estimate. This interpolation viewpoint is standard in the
    subject; compare [4] Section 1. We use the evaluation rows directly in what follows.
]

== 4 A weighted determinant of conjugates <sec:determinant>

We now construct a nonzero determinant for which most of the total exponent lies in the first coordinate.
  This is the coordinate to which the prime congruence will apply.

A primitive nonprincipal real character $chi$ corresponds to a fundamental discriminant $D$ with $\| D \| = q$.
  Write $bb(Q) \( sqrt(D) \) = bb(Q) \( sqrt(d) \)$ with $d$ squarefree.
  Then $\| d \| lt.eq q$ and, for odd $p divides.not q$, $chi \( p \) = \( d \/ p \)$, the Legendre symbol;
  see [3]. Temporarily exclude $d = 2$ and put

$ a = sqrt(d) \, wide b = sqrt(2) \, wide K = bb(Q) \( a \, b \) \, wide cal(R) = bb(Z) \[ a \, b \] . $

Since $chi$ is nonprincipal, $d eq.not 1$, so $\[ K : bb(Q) \] = 4$.
  Every element of $cal(R)$ has a unique expression $z_1 + z_2 a + z_3 b + z_4 a b$ with $z_i in bb(Z)$.
  The automorphisms $sigma \( a \) = - a$, $sigma \( b \) = b$ and $tau \( a \) = a$, $tau \( b \) = -
  b$ generate $"Gal" \( K \/ bb(Q) \)$.

For integers $1 lt.eq H lt.eq N$, retain the notation $U = N^(4 \/ 3)$ and set $M = N^4 = U^3$.
  For $n in E_N$ define $theta_n = n_1 + n_2 a + n_3 b + n_4 a b$. The map

#[#set math.equation(numbering: n => "(4.1)")
 $ A = mat(delim: "(", 1, a, b, a b; 1, - a, b, - a b; 1, - a, - b, a b) quad upright("satisfies") quad
   A n = \( theta_n \, sigma \( theta_n \) \, sigma tau \( theta_n \) \) . $ <eq:A>]

It has rank three and

$ ker A = bb(C) \( a b \, b \, - a \, - 1 \) . $

For example, the minor in the first three columns is $4 a b eq.not 0$,
  and multiplication verifies the displayed kernel. Its four coordinates are linearly independent over $bb(Q)$
  because $1 \, a \, b \, a b$ are a $bb(Q)$-basis of $K$. Thus Corollary 4 applies.

For $alpha in bb(Z)_(gt.eq 0)^3$, write

#[#set math.equation(numbering: n => "(4.2)")
 $ R_alpha = #scale(x: 120%, y: 120%)[\(] theta_n^(alpha_1) sigma \( theta_n \)^(alpha_2) sigma
   tau \( theta_n \)^(alpha_3) #scale(x: 120%, y: 120%)[\)]_(n in E_N) . $ <eq:rows>]

Fix an order of the columns. Order all indices in $bb(Z)_(gt.eq 0)^3$ by increasing $w \( alpha \) = alpha_1 +
  H alpha_2 + H alpha_3$, with any fixed rule to break ties.
  Retain a row precisely when it increases the span of the earlier rows over $K$.
  Rank is unchanged on extending scalars from $K$ to $bb(C)$, so Corollary 4 guarantees $M$ retained rows.
  Every row in that corollary has weight at most $T_1 + H T_2 + H T_3 = 96 H^(2 \/ 3) U$.
  Therefore all retained rows have weight at most this bound.

Let $cal(P)$ be the set of retained indices, in their retained order, and put

#[#set math.equation(numbering: n => "(4.3)")
 $ Delta = det \( R_alpha \)_(alpha in cal(P)) in cal(R) \\ { 0 } \, wide S_1 = sum_(alpha in cal(P)) alpha_1 \,
   wide S_2 = sum_(alpha in cal(P)) \( alpha_2 + alpha_3 \) . $ <eq:det>]

Only the surjectivity conclusion of Corollary 4 enters the selection of these rows.
  The coefficients of the auxiliary polynomials used to prove it may depend on $A$, but they do not enter $Delta$,
  which is formed from the original monomial rows. Thus no bound on those coefficients is needed for the size
  estimate below. This is the interpolation-determinant construction, with a weighted row order; compare [7] Section 6.

#thm([Lemma 6.])[
  #emph[There are absolute constants $c_0 \, C_0 > 0$ such that for every fixed integer $H gt.eq
    1$ and all sufficiently large $N$ in terms of $H$ alone,
#[#set math.equation(numbering: n => "(4.4)")
 $ S_1 gt.eq c_0 M H^(2 \/ 3) U \, wide S_2 lt.eq C_0 M H^(- 1 \/ 3) U . $ <eq:exponents>]

 In particular, $S_2 \/ S_1 lt.eq \( C_0 \/ c_0 \) \/ H$.]
] <lem:exponents>

#proof[
  The weight bound gives $alpha_2 \, alpha_3 lt.eq B := 96 H^(- 1 \/ 3) U$ for every retained index.
    Thus $S_2 lt.eq 192 M H^(- 1 \/ 3) U$. For each fixed value of $alpha_1$, there are at most
  $ Q_0 = \( floor.l B floor.r + 1 \)^2 lt.eq 97^2 H^(- 2 \/ 3) U^2 $
  retained indices; here $H^(- 1 \/ 3) U gt.eq 1$ follows from $N gt.eq H$.
    List the first coordinates in increasing order as $b_1 \, dots.h \, b_M$.
    Then $b_i gt.eq floor.l \( i - 1 \) \/ Q_0 floor.r$. Writing $M = k Q_0 + r$, $0 lt.eq r < Q_0$, gives
  $ S_1 gt.eq Q_0 frac(k \( k - 1 \), 2) + k r gt.eq frac(M^2, 2 Q_0) - M / 2 . $
  The last inequality has difference $r \( Q_0 - r \) \/ \( 2 Q_0 \) gt.eq 0$.
    For fixed $H$, the condition $M gt.eq 2 Q_0$ holds whenever $H^(2 \/ 3) N^(4 \/ 3) gt.eq 2 dot.op 97^2$.
    Thus, uniformly in the field,
  $ S_1 gt.eq frac(M^2, 4 Q_0) gt.eq frac(M H^(2 \/ 3) U, 4 dot.op 97^2) . $
  We may take $c_0 = \( 4 dot.op 97^2 \)^(- 1)$ and $C_0 = 192$. ◻
]

== 5 Two bounds for the determinant <sec:comparison>

For $z in K$, define $"N" \( z \) = z sigma \( z \) tau \( z \) sigma tau \( z \)$.
  If $z in cal(R)$, then $"N" \( z \) in bb(Z)$: its product belongs to $cal(R)$ and is fixed by both $sigma$ and
  $tau$, so only its integer constant coefficient remains. In particular $"N" \( Delta \)$ is a nonzero integer.
  We bound its absolute value from above at the complex embeddings and from below by divisibility.

=== The Archimedean bound <the-archimedean-bound>

For every embedding $nu : K arrow.r.hook bb(C)$ and every $n in E_N$,

$ \| nu \( theta_n \) \| lt.eq \( N - 1 \) \( 1 + sqrt(\| d \|) \) \( 1 + sqrt(2) \) lt.eq 8 N sqrt(q) . $

This estimate is valid for either sign of $d$. Each row indexed by $alpha$ has Euclidean norm at most
  $sqrt(M) \( 8 N sqrt(q) \)^(alpha_1 + alpha_2 + alpha_3)$ at every embedding.
  Hadamard’s inequality and the four embeddings give

#[#set math.equation(numbering: n => "(5.1)")
 $ 1 / 4 log \| "N" \( Delta \) \| lt.eq M / 2 log M + \( S_1 + S_2 \) #scale(x: 120%, y: 120%)[\(] log N + 1 /
   2 ell + log 8 #scale(x: 120%, y: 120%)[\)] . $ <eq:upper>]

=== The prime divisibility <the-prime-divisibility>

Call a prime $p$ admissible if $p > H$, $p divides.not 2 q$, and $chi \( p \) = - 1$.
  Euler’s criterion gives in $cal(R) \/ p cal(R)$

$ a^p = a thin d^(\( p - 1 \) \/ 2) equiv - a \, wide b^p = b thin 2^(\( p - 1 \) \/ 2) equiv \( 2 \/ p \) b . $

The $p$-th-power map is a ring homomorphism in characteristic $p$, and integer coefficients are fixed by it.
  Consequently

#[#set math.equation(numbering: n => "(5.2)")
 $ theta^p equiv g_p \( theta \) med \( mod med p cal(R) \) quad \( theta in cal(R) \) \, wide g_p =
   cases(delim: "{", sigma \, & \( 2 \/ p \) = 1 \,, sigma tau \, & \( 2 \/ p \) = - 1 .) $ <eq:frobenius>]

This is the Frobenius relation in the ring $cal(R)$.

#thm([Lemma 7.])[
  #emph[For every admissible prime $p$,
#[#set math.equation(numbering: n => "(5.3)")
 $ Delta in p^(E_p) cal(R) \, wide E_p = sum_(alpha in cal(P)) ⌊alpha_1 / p⌋ . $ <eq:divisibility>]

]
] <lem:divisibility>

#proof[
  Let $j = 2$ or $3$ according as $g_p = sigma$ or $sigma tau$.
    For a retained index $alpha$, write $alpha_1 = p k + r$ with $0 lt.eq r < p$. In (4.2), replace the first factor by
  $ theta_n^r #scale(x: 120%, y: 120%)[\(] theta_n^p - g_p \( theta_n \) #scale(x: 120%, y: 120%)[\)]^k $
  and leave the other two factors unchanged. Denote the resulting row by $tilde(R)_alpha$.
    Expansion yields the exact identity
  #[#set math.equation(numbering: n => "(5.4)")
   $ tilde(R)_alpha = R_alpha + sum_(m = 1)^k \( - 1 \)^m binom(k, m) R_(alpha - p m e_1 + m e_j) \, $ <eq:replacement>]
  where $e_1 \, e_2 \, e_3$ are the standard coordinate vectors.
    Every row on the right after $R_alpha$ has smaller weight, since its weight is $w \( alpha \) - m \( p - H \)$.
  By the greedy selection rule, every earlier row lies in the $K$-span of the earlier retained rows.
    Thus the matrix of replacement rows equals $L$ times the matrix of retained rows,
    where $L$ is lower triangular over $K$ with diagonal entries $1$. In particular,
  #[#set math.equation(numbering: n => "(5.5)")
   $ det \( tilde(R)_alpha \)_(alpha in cal(P)) = Delta . $ <eq:det-preserved>]
  On the other hand, (5.2) shows that every entry of $tilde(R)_alpha$ belongs to $p^k cal(R)$.
    Dividing its entries by $p^k$ leaves a matrix over $cal(R)$. Factoring these powers from (5.5) proves (5.3).
    The equality of determinants is over $K$; the divisibility follows from the replacement entries themselves,
    so no integrality of $L$ is required. ◻
]

Taking norms in (5.3) gives $p^(4 E_p) divides "N" \( Delta \)$.
  Since the norm is a nonzero integer, distinct admissible primes may be combined. Therefore

#[#set math.equation(numbering: n => "(5.6)")
 $ 1 / 4 log \| "N" \( Delta \) \| & gt.eq sum_(p lt.eq U\
p med upright("admissible")) E_p log p\
 & gt.eq S_1 sum_(p lt.eq U\
p med upright("admissible")) frac(log p, p) - M sum_(p lt.eq U) log p . $ <eq:lower-primes>]

The second inequality uses $floor.l x floor.r gt.eq x - 1$ in each row.
  Chebyshev’s bound $sum_(p lt.eq U) log p lt.double U$ and Lemma 2 now give, when $U gt.eq 3$ and $H gt.eq 2$,

#[#set math.equation(numbering: n => "(5.7)")
 $ 1 / 4 log \| "N" \( Delta \) \| gt.eq S_1 (log U - C ell - C frac(delta \( log U \)^2, ell) - C_H) -
   C M U . $ <eq:lower>]

The leading term here is $S_1 log U$. In (5.1), the corresponding term is $\( S_1 + S_2 \) log N$, and $log N =
  3 / 4 log U$. The weight $H$ makes $S_2 \/ S_1$ small enough to preserve this difference.

== 6 Completion of the proof <sec:conclusion>

Suppose Theorem 1 is false. Then there is a sequence of primitive nonprincipal real characters and real zeros with

#[#set math.equation(numbering: n => "(6.1)")
 $ q arrow.r oo \, wide delta = \( 1 - beta \) log q arrow.r 0 . $ <eq:sequence>]

To justify $q arrow.r oo$, there are only finitely many characters of bounded conductor,
  and for each of them $L \( 1 \, chi \) eq.not 0$. Analyticity therefore prevents zeros from accumulating at $1$.
  Passing to a subsequence gives (6.1). In particular $bb(Q) \( sqrt(d) \) eq.not
  bb(Q) \( sqrt(2) \)$ for all sufficiently large $q$, so the field construction applies.

Fix $H gt.eq 2$ for the moment. Combining (5.1) and (5.7), then dividing by $S_1 log U$, yields

#[#set math.equation(numbering: n => "(6.2)")
 $ 1 lt.eq  & 3 / 4 (1 + S_2 / S_1) + (C + 1 / 2 (1 + S_2 / S_1)) frac(ell, log U) + C delta frac(log U, ell)\
 & + frac(C_H + \( 1 + S_2 \/ S_1 \) log 8, log U) + frac(C M U + 1 / 2 M log M, S_1 log U) . $ <eq:master>]

The constants denoted by $C$ are absolute. The division is legitimate for all sufficiently large $N$ by Lemma 6.

First choose the integer $H$ so large that $\( C_0 \/ c_0 \) \/ H lt.eq 1 \/ 12$.
  Lemma 6 then makes the first term of (6.2) at most $13 \/ 16$.

Next choose a fixed real $gamma > 0$ and set $N = ceil.l q^gamma ceil.r$. Along (6.1),

$ frac(log U, ell) arrow.r frac(4 gamma, 3) . $

Take $gamma$ sufficiently large that the limiting upper bound for the second term of (6.2) is less than $1 \/ 16$.
  This choice depends only on the absolute constants and the already fixed bound $S_2 \/ S_1 lt.eq 1 \/ 12$.

Finally let $q arrow.r oo$ along (6.1). The third term tends to zero because $gamma$ is fixed and $delta arrow.r
  0$. The fourth tends to zero because $H$ is fixed. For the last term, Lemma 6 and $log M = 3 log U$ give

$ frac(M U, S_1 log U) lt.double frac(H^(- 2 \/ 3), log U) \, wide
  frac(M log M, S_1 log U) lt.double H^(- 2 \/ 3) / U \, $

both tending to zero. The conditions $N gt.eq H$, $U gt.eq 3$, and the lower bound on $S_1$ all hold eventually.
  Taking an upper limit in (6.2) gives $1 lt.eq 13 \/ 16 + 1 \/ 16 = 7 \/ 8$, a contradiction. This proves Theorem 1.

#heading(level: 1)[References]
#bibitem([1])[K.~Benli, S.~Goel, H.~Twiss, and A.~Zaman, #emph[Explicit Deuring--Heilbronn phenomenon for
  Dirichlet $L$-functions], Proc. Amer. Math. Soc. #strong[154] (2026), no.~2, 509--525.
  #link("https://doi.org/10.1090/proc/17450")[doi:10.1090/proc/17450].]
#bibitem([2])[J.-B.~Bost, #emph[Algebraic leaves of algebraic foliations over number fields], Publ. Math. Inst.
  Hautes Études Sci. #strong[93] (2001), 161--221.
  #link("https://doi.org/10.1007/s10240-001-8191-3")[doi:10.1007/s10240-001-8191-3].]
#bibitem([3])[H.~Davenport, #emph[Multiplicative number theory], 2nd ed., revised by H.~L.~Montgomery,
  Graduate Texts in Mathematics, vol.~74, Springer-Verlag, New York, 1980.]
#bibitem([4])[S.~Fischler, #emph[Interpolation on algebraic groups], Compos. Math.
  #strong[141] (2005), no.~4, 907--925.
  #link("https://doi.org/10.1112/S0010437X05001351")[doi:10.1112/S0010437X05001351].]
#bibitem([5])[J.~B.~Friedlander and H.~Iwaniec, #emph[A note on Dirichlet $L$-functions], Expo. Math.
  #strong[36] (2018), nos.~3--4, 343--350.
  #link("https://doi.org/10.1016/j.exmath.2018.06.003")[doi:10.1016/j.exmath.2018.06.003].]
#bibitem([6])[D.~R.~Heath-Brown, #emph[Zero-free regions for Dirichlet $L$-functions,
  and the least prime in an arithmetic progression], Proc. London Math. Soc.
  (3) #strong[64] (1992), no.~2, 265--338.
  #link("https://doi.org/10.1112/plms/s3-64.2.265")[doi:10.1112/plms/s3-64.2.265].]
#bibitem([7])[M.~Laurent, #emph[Sur quelques résultats récents de transcendance],
  Astérisque #strong[198--199--200] (1991), 209--230.
  #link("https://www.numdam.org/item/AST_1991__198-199-200__209_0/").]
#bibitem([8])[U.~V.~Linnik, #emph[On the least prime in an arithmetic progression. II.
  The Deuring--Heilbronn phenomenon], Rec. Math. \[Mat. Sbornik\] N.S. #strong[15(57)] (1944), no.~3, 347--368.
  #link("https://www.mathnet.ru/eng/sm6202").]
#bibitem([9])[A.~Page, #emph[On the number of primes in an arithmetic progression], Proc. London Math. Soc.
  (2) #strong[39] (1935), 116--141. #link("https://doi.org/10.1112/plms/s2-39.1.116")[doi:10.1112/plms/s2-39.1.116].]
#bibitem([10])[P.~Philippon, #emph[Lemmes de zéros dans les groupes algébriques commutatifs], Bull. Soc. Math.
  France #strong[114] (1986), 355--383; errata et addenda, #strong[115] (1987), 397--398.
  #link("https://doi.org/10.24033/bsmf.2060")[doi:10.24033/bsmf.2060]\;
  #link("https://doi.org/10.24033/bsmf.2084")[doi:10.24033/bsmf.2084].]
#bibitem([11])[C.~L.~Siegel, #emph[Über die Classenzahl quadratischer Zahlkörper], Acta Arith.
  #strong[1] (1935), 83--86. #link("https://doi.org/10.4064/aa-1-1-83-86")[doi:10.4064/aa-1-1-83-86].]
