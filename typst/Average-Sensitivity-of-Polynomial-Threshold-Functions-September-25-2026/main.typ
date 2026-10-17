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

#align(center)[#text(size: 16pt, weight: "bold")[Average sensitivity of polynomial threshold functions]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

A polynomial threshold function assigns a sign to each vertex of the Boolean cube by evaluating a real polynomial. On the cube, the identities $x_i^2 = 1$ allow every polynomial to be replaced by a multilinear polynomial of no larger degree without changing its values. Average sensitivity measures the expected number of coordinate changes that reverse that sign. For $x in { - 1 \, 1 }^n$, let $x^(xor i)$ be obtained by reversing coordinate $i$. For $f : { - 1 \, 1 }^n arrow.r { - 1 \, 1 }$, define

#[#set math.equation(numbering: n => "(1)")
 $ I \( f \) = sum_(i = 1)^n bb(P) { f \( X \) eq.not f \( X^(xor i) \) } \, #h(2em) X upright(" uniform on ") { - 1 \, 1 }^n . $ <eq:influence-definition>]

This quantity is also called the total influence of $f$. Throughout,

$ "sgn" \( t \) = cases(delim: "{", 1 \, & t gt.eq 0 \,, - 1 \, & t < 0 .) $

We prove the following estimate.

#thm([Theorem 1.])[
  #emph[Let $n gt.eq 1$ and $1 lt.eq d lt.eq n$ be integers. Let $p$ be a real multilinear polynomial of degree at most $d$, and define $f : { - 1 \, 1 }^n arrow.r { - 1 \, 1 }$ by $f \( x \) = "sgn" \( p \( x \) \)$, with $"sgn" \( 0 \) = 1$. Then, for average sensitivity under the uniform law, 
$ I \( f \) lt.eq 8 d sqrt(n) . $

]
] <thm:main>

The constant is independent of both $d$ and $n$. In particular, the degree may grow with the dimension. The polynomial may vanish on the cube, and no regularity condition is imposed on $p$.

Gotsman and Linial proposed an exact extremal bound for average sensitivity [4] Section 5, p. 47. Their candidate is symmetric: it is the sign of a degree-$d$ polynomial in $x_1 + dots.h.c + x_n$ whose roots lie between the central levels of the cube. The proposal asserts that this function maximizes influence among all degree-$d$ polynomial threshold functions in $n$ variables. Chapman constructed counterexamples to this exact assertion and explicitly distinguished it from the asymptotic bound $I \( f \) = O \( d sqrt(n) \)$ [2] Conjectures 1.1–1.2 and Theorem 1.1. Kim, Maldonado, and Wellens independently constructed quadratic counterexamples for odd $n gt.eq 5$ and proved influence bounds for quadratic polynomials with restricted support graphs [9] Theorems 1.1–1.3. Theorem 1 establishes the asymptotic bound with an absolute constant; it makes no assertion about exact maximizers. Numbered locators in references with a listed preprint refer to that preprint version.

The classical symmetric examples explain the scale of the theorem. Let $1 lt.eq d lt.eq sqrt(n)$, let $J$ consist of the $d$ indices nearest $\( n - 1 \) \/ 2$ in ${ 0 \, dots.h \, n - 1 }$, breaking a tie arbitrarily, and put

$ t \( x \) = frac(n + x_1 + dots.h.c + x_n, 2) \, #h(2em) p_J \( x \) = product_(j in J) #scale(x: 120%, y: 120%)[\(] t \( x \) - j - 1 / 2 #scale(x: 120%, y: 120%)[\)] . $

Here $t \( x \)$ is the number of coordinates of $x$ equal to $+ 1$. Multilinearization preserves the values of $p_J$ on the cube and has degree at most $d$. Its sign changes exactly across the boundaries between Hamming weights $j$ and $j + 1$ for $j in J$. There are $\( n - j \) binom(n, j) = n binom(n - 1, j)$ unoriented edges at such a boundary, so the ordered-edge normalization in (1) gives

$ I \( "sgn" p_J \) = n thin 2^(- \( n - 1 \)) sum_(j in J) binom(n - 1, j) asymp d sqrt(n) . $

Here the comparison constants are absolute. The central-binomial estimate from Stirling’s formula, together with the ratios of consecutive binomial coefficients, shows that the binomial masses are comparable to $n^(- 1 \/ 2)$ within $sqrt(n) \/ 2$ of the center, which includes all selected indices; the case $n = 1$ follows directly from the count. Thus the order $d sqrt(n)$ is sharp throughout this degree range; see also [9] p. 3, discussion following Theorem 1.1. For every Boolean function, the additional bound $I \( f \) lt.eq n$ holds.

Early general bounds established sublinear influence for every fixed degree. For $n > 1$, Harsha, Klivans, and Meka proved $I \( f \) lt.eq 2^(O \( d \)) n^(1 - 1 \/ \( 4 d + 6 \))$ [5] Theorem 1.6, while the independent work of Diakonikolas, Raghavendra, Servedio, and Tan gave $I \( f \) lt.eq 2^(O \( d \)) \( log n \) n^(1 - 1 \/ \( 4 d + 2 \))$ [3] Theorem 1.1. These results first circulated in 2009, before their 2014 journal publications. Their proofs use regularity and invariance arguments to compare sufficiently regular Boolean polynomials with Gaussian ones. Kane subsequently established the square-root exponent in the dimension:

#[#set math.equation(numbering: n => "(2)")
 $ I \( f \) lt.eq sqrt(n) thin \( log n \)^(O \( d log d \)) 2^(O \( d^2 log d \)) #h(2em) \( n > 1 \) $ <eq:kane-bound>]

[8] Theorem 2. For each fixed $d gt.eq 2$, this is an $n^(1 \/ 2 + o \( 1 \))$ bound with a polylogarithmic loss. His proof combines random restrictions, regularity, and invariance estimates. Theorem 1 removes that loss and gives linear dependence on $d$ with an absolute constant.

Small moments of the local sensitivity $s_f \( x \) = \| { i : f \( x \) eq.not f \( x^(xor i) \) } \|$ give further information about its distribution. Chang, Slote, Volberg, and Zhang bounded the Boolean surface area $bb(E) sqrt(s_f \( X \))$ by a polynomial in $log \( e n \)$ for each fixed degree [1] Theorem 1.1, equation (1.6). Tseng and Volberg studied a wider range of sensitivity moments [11]. For comparison with the first moment, the pointwise inequality $s_f lt.eq sqrt(n) sqrt(s_f)$ converts the surface-area estimate into an influence bound with a logarithmic loss. At moment order one, the estimate in [11] Section 2.5, equation (11) is $C \( d \) sqrt(n) \( log n \)^(C d log d)$ for $n > 1$, which likewise retains a logarithmic factor for $d gt.eq 2$.

===== 1.1 Proof strategy. <proof-strategy.>

The proof separates a probability estimate from a finite-dimensional operator construction. The probability estimate says that equal-law random variables of variance $sigma^2$ satisfy $bb(E) \( U - V \)^2 lt.eq 8 a sigma$ whenever $V - U lt.eq a$ almost surely. A bound on increments in the opposite direction is not assumed. Equality of the marginal laws supplies the needed balance through an increasing function whose increments dominate squared displacement. Section 2 proves this estimate directly.

For the operator construction, begin with the spaces of cube polynomials of degrees at most $k$, for $0 lt.eq k lt.eq n$. Multiply these spaces by $sqrt(w)$ for a positive weight $w$, and take their successive orthogonal increments in the counting inner product. The increments have dimensions $binom(n, k)$, although the weight changes their positions. Give the $k$th increment eigenvalue $k - n \/ 2$; this defines a self-adjoint operator $M$ with fixed squared Hilbert–Schmidt norm $n 2^n \/ 4$. Its squared Hilbert–Schmidt norm is the sum of the squared moduli of all matrix entries. Multiplication by a coordinate connects only equal or adjacent grades, because it raises polynomial degree by at most one and is self-adjoint. These are the two features of the grading used in the proof: fixed dimensions and locality under coordinate multiplication (Section 3).

When $w equiv 1$, $M$ is minus one-half of the cube adjacency matrix. For a general weight, some edge entries may have smaller squared modulus, and other entries may appear. Section 4 shows that the total squared entry mass between vertices at distance at least two is bounded by the mass on the diagonal. Together with a bound on each edge entry, this controls the total deficit from the unweighted squared edge value $1 \/ 4$. If $H$ multiplies by a sign function $h$, the anticommutator $M H + H M$ retains diagonal entries and equal-sign edge entries, multiplying them by $2$ or $- 2$. Its squared norm therefore bounds the number of equal-sign edges even for an arbitrary positive weight.

Finally, multiply $f$ by full parity to obtain $h \( x \) = \( product_(i = 1)^n x_i \) f \( x \)$, and use $w = \| p \|$ after removing zeros without changing signs. The equal-sign edges of $h$ are exactly the sensitive edges of $f$. Moreover, multiplication by parity turns the Fourier support of $p$ into degrees at least $n - d$. This forces the block of $H$ between grades $r$ and $s$ to vanish when $r + s < n - d$. The normalized squared block norms define a probability law for $\( R \, S \)$ whose two marginals are $"Bin" \( n \, 1 \/ 2 \)$. Reflecting one index gives $U = S$ and $V = n - R$, with the same marginals and $V - U lt.eq d$. The coupling estimate then bounds the anticommutator norm, and the edge estimate gives the theorem. Section 5 performs this assembly, keeping track of ordered edges.

===== 1.2 Consequences. <consequences.>

Section 6 derives a dimension-free Boolean noise sensitivity bound and a quantitative learning guarantee from the influence estimate. The learning statement concerns independent labeled samples whose input marginal is uniform, while the labels may be arbitrary. It follows by combining noise smoothing with polynomial regression.

== 2 A one-sided coupling estimate <sec:coupling>

The next lemma controls mean square displacement from an upper bound in only one direction. Large downward displacements are permitted, so bounding the positive and negative displacements separately would lose information. Equality of the marginal laws instead balances the expected change of any integrable function applied to the two variables. We use an increasing function whose increments dominate squared displacement; its increments in the bounded direction can be estimated using the common variance. Neither independence nor exchangeability is assumed.

#thm([Lemma 2.])[
  #emph[Let $U \, V$ be real random variables with the same distribution, finite mean $m$, and finite variance $sigma^2$. If $V - U lt.eq a$ almost surely, where $a gt.eq 0$, then 
$ bb(E) \( U - V \)^2 lt.eq 8 a sigma . $

]
] <lem:coupling>

#proof[
  The function $\| t - m \|$ grows linearly away from the common mean. Its primitive is the increasing function
  $ g \( t \) = integral_m^t \| z - m \| thin d z = 1 / 2 \( t - m \) \| t - m \| . $
  For $u < v$, we have
  #[#set math.equation(numbering: n => "(3)")
   $ frac(\( v - u \)^2, 4) lt.eq g \( v \) - g \( u \) lt.eq frac(v - u, 2) #scale(x: 120%, y: 120%)[\(] \| u - m \| + \| v - m \| #scale(x: 120%, y: 120%)[\)] . $ <eq:g-increments>]
  For the lower bound, if $u lt.eq m lt.eq v$, the integral is $#scale(x: 120%, y: 120%)[\(] \( m - u \)^2 + \( v - m \)^2 #scale(x: 120%, y: 120%)[\)] \/ 2 gt.eq \( v - u \)^2 \/ 4$; if the interval lies on one side of $m$, the integral is at least $\( v - u \)^2 \/ 2$. For the upper bound, convexity places $\| z - m \|$ below the chord joining its endpoint values, whose integral is the displayed upper bound.
  The second-moment assumption makes $g \( U \)$ and $g \( V \)$ integrable. Their expectations agree. For the integrable random variable $Y = g \( V \) - g \( U \)$, write $Y_(+) = max { Y \, 0 }$. The identity $bb(E) Y = 0$ implies $bb(E) \| Y \| = 2 bb(E) Y_(+)$. Since $g$ is strictly increasing, $Y > 0$ exactly when $V > U$, and hence
  $ bb(E) \| g \( U \) - g \( V \) \| & = 2 bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ V > U }) \( g \( V \) - g \( U \) \) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq a bb(E) #scale(x: 120%, y: 120%)[\[] \| U - m \| + \| V - m \| #scale(x: 120%, y: 120%)[\]] lt.eq 2 a sigma . $
  The first inequality uses (3) and $V - U lt.eq a$ on ${ V > U }$; the last is Cauchy–Schwarz. The lower bound in (3), with the endpoints put in increasing order, gives $\( U - V \)^2 lt.eq 4 \| g \( U \) - g \( V \) \|$ pointwise. Taking expectations proves the lemma. ◻
]

The cancellation $bb(E) \[ g \( V \) - g \( U \) \] = 0$ uses only equality of marginal laws. Primitive differences with this property also appear in Röllin’s formulation of Stein’s method [10] Section 1. The present one-sided second-moment estimate follows from the elementary increment bounds above.

== 3 Weighted Fourier grading <sec:grading>

We next construct an operator whose spectrum is fixed by the dimensions of polynomial spaces, while its matrix entries respond to an arbitrary positive weight. The construction is the cube instance of the usual degree filtration for discrete multivariate orthogonal polynomials, whose coordinate multipliers satisfy a three-term recurrence; compare Xu [12] Section 3. We give the finite-dimensional argument in the present notation.

Write $Omega = { - 1 \, 1 }^n$ and $N = 2^n$. We work in $cal(H) = bb(C)^Omega$ with the counting inner product

$ chevron.l a \, b chevron.r = sum_(x in Omega) overline(a \( x \)) b \( x \) . $

Thus the point masses $delta_x$ form an orthonormal basis. For an operator $B$, write $B_(x y) = chevron.l delta_x \, B delta_y chevron.r$ and let

$ lr(bar.v.double  bar.v.double) B_(upright("HS"))^2 = sum_(x \, y in Omega) \| B_(x y) \|^2 $

be its Hilbert–Schmidt norm squared; $lr(bar.v.double  bar.v.double) B_(upright("op"))$ denotes its operator norm. The Hilbert–Schmidt norm is independent of the orthonormal basis.

For $S subset.eq \[ n \] = { 1 \, dots.h \, n }$, set $chi_S \( x \) = product_(j in S) x_j$. These real characters satisfy

$ chevron.l chi_S \, chi_T chevron.r = N upright(bold(1))_({ S = T }) \, #h(2em) chi_S chi_T = chi_(S triangle.stroked.t T) . $

Indeed, a nonconstant character sums to zero by pairing vertices that differ in one of its coordinates. The displayed product rule therefore gives orthogonality, and the $N$ characters form a basis of the $N$-dimensional space $cal(H)$. Let

$ V_k = "span" { chi_S : \| \| S lt.eq k } \, #h(2em) 0 lt.eq k lt.eq n \, $

and set $V_k = cal(H)$ for $k gt.eq n$. Membership in $V_k$ means that a function has Fourier degree at most $k$. The character multiplication rule shows that $a in V_r$ and $b in V_s$ imply $overline(b) a in V_(r + s)$.

Fix any function $w : Omega arrow.r \( 0 \, oo \)$, and let $D$ be multiplication by $sqrt(w)$. The identity

$ chevron.l D a \, D b chevron.r = sum_(x in Omega) w \( x \) overline(a \( x \)) b \( x \) $

identifies the weighted inner product with the counting inner product after applying $D$. We can therefore orthogonalize polynomial degrees for the weight $w$ while retaining the orthonormal point basis used to count edges. Form the nested subspaces

$ K_k = D V_k \, #h(2em) K_(- 1) = { 0 } \, #h(2em) E_k = K_k ∩ K_(k - 1)^perp quad \( 0 lt.eq k lt.eq n \) . $

Let $Pi_k$ be the orthogonal projection onto $E_k$. The spaces $K_k$ are nested, and $K_k = K_(k - 1) xor E_k$. Since $D$ is invertible, $dim K_k = dim V_k = sum_(j = 0)^k binom(n, j)$ and $K_n = cal(H)$. Subtracting consecutive dimensions gives

$ cal(H) = xor.big_(k = 0)^n E_k \, #h(2em) dim E_k = binom(n, k) . $

Choosing an orthonormal basis in each $E_k$ and decomposing the image of each basis vector gives, for every operator $B$,

#[#set math.equation(numbering: n => "(4)")
 $ lr(bar.v.double  bar.v.double) B_(upright("HS"))^2 = sum_(r \, s = 0)^n lr(bar.v.double Pi_s B Pi_r bar.v.double)_(upright("HS"))^2 . $ <eq:block-parseval>]

Define the grading operator and its centered version by

#[#set math.equation(numbering: n => "(5)")
 $ L = sum_(k = 0)^n k Pi_k \, #h(2em) M = L - n / 2 upright("Id") . $ <eq:grading>]

They are self-adjoint. Their prescribed eigenvalue multiplicities give

#[#set math.equation(numbering: n => "(6)")
 $ lr(bar.v.double  bar.v.double) M_(upright("HS"))^2 = sum_(k = 0)^n binom(n, k) (k - n / 2)^2 = frac(n N, 4) . $ <eq:total-energy>]

The last equality is the variance identity for a sum of $n$ independent Bernoulli random variables of parameter $1 \/ 2$.

Let $rho \( x \, y \)$ denote Hamming distance. All pairs of vertices in what follows are #emph[ordered]. When $w equiv 1$, the identity $sum_(y : rho \( x \, y \) = 1) chi_S \( y \) = \( n - 2 \| \| S \) chi_S \( x \)$ shows that $M$ is minus one-half of the cube adjacency matrix. Thus every edge entry has squared modulus $1 \/ 4$; the proof below controls the total deficit from this value for arbitrary positive weights.

The key local property is that multiplying by a coordinate connects only equal or adjacent grades.

For each $i in \[ n \]$, let $Z_i$ be multiplication by $x_i$. It is a self-adjoint unitary and commutes with $D$. Multiplication by $x_i$ raises Fourier degree by at most one, so $Z_i K_r subset.eq K_(r + 1)$. For $s > r + 1$, the inclusion $K_(r + 1) subset.eq K_(s - 1)$ and the orthogonality $E_s perp K_(s - 1)$ give $Pi_s Z_i Pi_r = 0$. Taking adjoints gives the opposite triangular vanishing, so

#[#set math.equation(numbering: n => "(7)")
 $ Pi_s Z_i Pi_r = 0 #h(2em) upright("whenever ") \| s - r \| > 1 . $ <eq:tridiagonal>]

Together with the fixed total energy in (6), this restriction will control the entries of $M$ between vertices at Hamming distance at least two.

== 4 Recovering edges from the anticommutator <sec:edges>

Keep the grading of Section 3, with no restriction on the positive weight $w$. For an operator $H$ that multiplies by a sign, the anticommutator $M H + H M$ vanishes between opposite signs and multiplies entries of $M$ by $2$ or $- 2$ between equal signs. The following lemma turns this observation into an edge count even though an arbitrary weight can change the individual edge entries.

#thm([Lemma 3.])[
  (Recovering edges from the grading).  #emph[Let $n gt.eq 1$, $Omega = { - 1 \, 1 }^n$, and $w : Omega arrow.r \( 0 \, oo \)$. Let $M$ be the centered grading operator (5) constructed from $w$. For $h : Omega arrow.r { - 1 \, 1 }$, let $H$ be multiplication by $h$ and set 
$ cal(E)_h = { \( x \, y \) in Omega^2 : rho \( x \, y \) = 1 \, med h \( x \) = h \( y \) } . $

 Then, counting ordered pairs, 
#[#set math.equation(numbering: n => "(8)")
 $ \| cal(E)_h \| lt.eq 2 lr(bar.v.double M H + H M bar.v.double)_(upright("HS"))^2 . $ <eq:edge-recovery>]

]
] <lem:edges>

#proof[
  We compare $M$ with the unweighted grading, whose edge entries have squared modulus $1 \/ 4$. First we show that every edge entry of $M$ has squared modulus at most $1 \/ 4$. We then bound the sum of the deficits by diagonal energy, which the anticommutator detects for every choice of signs.
  #emph[A bound for each off-diagonal entry.] Write $C_i = \[ L \, Z_i \] = \[ M \, Z_i \]$, where $\[ A \, B \] = A B - B A$. Its grade blocks are
  $ Pi_s C_i Pi_r = \( s - r \) Pi_s Z_i Pi_r . $
  We will prove $lr(bar.v.double C_i bar.v.double)_(upright("op")) lt.eq 1$. The commutator keeps only adjacent-grade blocks, with opposite signs in the two directions. We first remove the equal-grade blocks by a norm-nonincreasing average, then supply those opposite signs, up to a common phase, by unitary conjugation. Introduce the unitaries
  $ J = sum_(k = 0)^n \( - 1 \)^k Pi_k \, #h(2em) W = sum_(k = 0)^n upright(i)^k Pi_k \, #h(2em) upright(i)^2 = - 1 . $
  Set $O_i = \( Z_i - J Z_i J \) \/ 2$. The triangle inequality gives $lr(bar.v.double O_i bar.v.double)_(upright("op")) lt.eq \( lr(bar.v.double Z_i bar.v.double)_(upright("op")) + lr(bar.v.double J Z_i J bar.v.double)_(upright("op")) \) \/ 2 = 1$. In the $\( s \, r \)$ block, the factor defining $O_i$ is $\( 1 - \( - 1 \)^(s + r) \) \/ 2$. It is zero on the diagonal and one when $\| s - r \| = 1$. By (7), $O_i$ therefore consists precisely of the blocks of $Z_i$ with $\| s - r \| = 1$. On these blocks, conjugation by $W$ multiplies by $upright(i)^(s - r) = upright(i) \( s - r \)$. Therefore
  $ W O_i W^(*) = upright(i) C_i \, #h(2em) upright("and hence") #h(2em) lr(bar.v.double C_i bar.v.double)_(upright("op")) lt.eq 1 . $
  In the point basis, $\( C_i \)_(x y) = \( y_i - x_i \) M_(x y)$. If $x eq.not y$, choose $i$ with $x_i eq.not y_i$ to obtain
  $ 2 \| M_(x y) \| = \| \( C_i \)_(x y) \| lt.eq lr(bar.v.double C_i bar.v.double)_(upright("op")) lt.eq 1 . $
  In particular, each neighbor deficit $1 \/ 4 - \| M_(x y) \|^2$ is nonnegative.
  #emph[The total neighbor deficit.] The same grade blocks also give an aggregate bound. By (4) and (7),
  $ lr(bar.v.double C_i bar.v.double)_(upright("HS"))^2 = sum_(r \, s = 0)^n \( s - r \)^2 lr(bar.v.double Pi_s Z_i Pi_r bar.v.double)_(upright("HS"))^2 lt.eq lr(bar.v.double Z_i bar.v.double)_(upright("HS"))^2 = N . $
  Summing the squared point-basis entries of $C_i$ over coordinates gives
  #[#set math.equation(numbering: n => "(9)")
   $ sum_(x \, y) rho \( x \, y \) \| M_(x y) \|^2 = 1 / 4 sum_(i = 1)^n lr(bar.v.double C_i bar.v.double)_(upright("HS"))^2 lt.eq frac(n N, 4) = sum_(x \, y) \| M_(x y) \|^2 \, $ <eq:distance-energy>]
  where the last equality is (6). Set
  $ A_0 = sum_x \| M_(x x) \|^2 \, #h(2em) F = sum_(rho \( x \, y \) gt.eq 2) \| M_(x y) \|^2 . $
  The difference between the outermost sums in (9) is $- A_0 + sum_(rho \( x \, y \) gt.eq 2) \( rho \( x \, y \) - 1 \) \| M_(x y) \|^2 lt.eq 0$. Thus energy beyond neighboring pairs is bounded by diagonal energy:
  #[#set math.equation(numbering: n => "(10)")
   $ F lt.eq sum_(rho \( x \, y \) gt.eq 2) \( rho \( x \, y \) - 1 \) \| M_(x y) \|^2 lt.eq A_0 . $ <eq:far-energy>]
  There are $n N$ ordered neighbor pairs, and thus
  #[#set math.equation(numbering: n => "(11)")
   $ sum_(rho \( x \, y \) = 1) (1 / 4 - \| M_(x y) \|^2) & = frac(n N, 4) - sum_(rho \( x \, y \) = 1) \| M_(x y) \|^2\
 & = A_0 + F lt.eq 2 A_0 . $ <eq:deficit>]
  Here we used (6) and (10). The fixed total energy consequently controls the full deficit from the unweighted edge value $1 \/ 4$.
  #emph[Recovering the equal-sign edges.] Let $A_h = sum_(\( x \, y \) in cal(E)_h) \| M_(x y) \|^2$. Because the individual deficits are nonnegative, their sum over $cal(E)_h$ is at most the full sum in (11). Hence
  #[#set math.equation(numbering: n => "(12)")
   $ frac(\| cal(E)_h \|, 4) lt.eq A_h + 2 A_0 lt.eq 2 \( A_h + A_0 \) . $ <eq:count-deficit>]
  For $T = M H + H M$ we have $T_(x y) = \( h \( x \) + h \( y \) \) M_(x y)$. On both the diagonal and $cal(E)_h$, the squared factor is $4$, so
  $ 4 \( A_0 + A_h \) lt.eq lr(bar.v.double  bar.v.double) T_(upright("HS"))^2 . $
  Together with (12), this proves (8). ◻
]

== 5 Parity and the binomial coupling <sec:parity>

We now choose the weight from the polynomial. Parity will convert the sensitivity problem into the equal-sign edge count of Lemma 3, while the polynomial degree will produce the one-sided constraint needed for Lemma 2.

#proof[
  We may assume that $p \( x \) eq.not 0$ for every $x in Omega$. Indeed, if $p$ takes negative values, add a positive constant smaller than $min { \| p \( x \) \| : p \( x \) < 0 }$; otherwise add any positive constant. Negative values remain negative, while zero values become positive and positive values stay positive. Thus the perturbation preserves $f$ under our convention $"sgn" \( 0 \) = 1$, does not increase the degree, and makes $p$ nonzero at every vertex. We henceforth use $p$ for the perturbed polynomial.
  Let $chi = chi_(\[ n \])$ be full parity and set
  $ w = \| \| p \, #h(2em) h = chi f \, #h(2em) q = chi p . $
  Full parity changes sign across every edge, so $h \( x \) = h \( y \)$ for neighbors $x \, y$ exactly when $f \( x \) eq.not f \( y \)$. Consequently
  #[#set math.equation(numbering: n => "(13)")
   $ I \( f \) = frac(\| cal(E)_h \|, N) . $ <eq:sensitivity-count>]
  Here both sides count sensitive edges in both directions. We have $w > 0$ and $h w = q$. Construct the weighted grading (5) from $w$, and let $H$ be multiplication by $h$. Since $chi chi_S = chi_(\[ n \] \\ S)$ and $deg p lt.eq d$, the Fourier support of $q$ lies in degrees at least $n - d$.
  We claim that
  #[#set math.equation(numbering: n => "(14)")
   $ Pi_s H Pi_r = 0 #h(2em) upright("if ") r + s < n - d . $ <eq:vanishing>]
  To see this, write elements of $E_r subset.eq D V_r$ and $E_s subset.eq D V_s$ as $D a$ and $D b$, with $a in V_r$ and $b in V_s$. Then
  $ chevron.l D b \, H D a chevron.r = sum_(x in Omega) overline(b \( x \)) a \( x \) w \( x \) h \( x \) = sum_(x in Omega) overline(b \( x \)) a \( x \) q \( x \) = 0 . $
  The last equality follows from character orthogonality: the product $overline(b) a$ has Fourier degree at most $r + s < n - d$.
  Set $T = M H + H M$. Its blocks are
  #[#set math.equation(numbering: n => "(15)")
   $ Pi_s T Pi_r = \( s + r - n \) Pi_s H Pi_r . $ <eq:T-blocks>]
  Thus the anticommutator energy is a weighted second moment of the sum of the two grade indices:
  $ 1 / N lr(bar.v.double  bar.v.double) T_(upright("HS"))^2 = sum_(r \, s = 0)^n \( s + r - n \)^2 thin lr(bar.v.double Pi_s H Pi_r bar.v.double)_(upright("HS"))^2 / N . $
  The coefficients on the right define a probability distribution. Indeed, because $H$ is unitary and the projections are orthogonal,
  $ sum_s lr(bar.v.double Pi_s H Pi_r bar.v.double)_(upright("HS"))^2 = lr(bar.v.double H Pi_r bar.v.double)_(upright("HS"))^2 = binom(n, r) . $
  Decomposing the domain into grades and taking adjoints likewise gives
  $ sum_r lr(bar.v.double Pi_s H Pi_r bar.v.double)_(upright("HS"))^2 = lr(bar.v.double Pi_s H bar.v.double)_(upright("HS"))^2 = lr(bar.v.double H^(*) Pi_s bar.v.double)_(upright("HS"))^2 = binom(n, s) . $
  Since $sum_r binom(n, r) = N$, we may therefore define random indices $R \, S in { 0 \, dots.h \, n }$ by
  #[#set math.equation(numbering: n => "(16)")
   $ bb(P) { R = r \, S = s } = 1 / N lr(bar.v.double Pi_s H Pi_r bar.v.double)_(upright("HS"))^2 . $ <eq:block-coupling>]
  Both marginals are $"Bin" \( n \, 1 \/ 2 \)$, and the preceding energy identity becomes
  $ 1 / N lr(bar.v.double  bar.v.double) T_(upright("HS"))^2 = bb(E) \( R + S - n \)^2 . $
  To use Lemma 2, reflect the first index: put $U = S$ and $V = n - R$. Binomial symmetry gives $U$ and $V$ the same distribution, with mean $n \/ 2$ and variance $n \/ 4$. Meanwhile, (14) gives $R + S gt.eq n - d$ almost surely, which becomes $V - U lt.eq d$. Figure 1 shows how the zero-block region becomes this one-sided support constraint.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (3, 0), (0, 2.7), close: true, fill: rgb("#e9e9e9"), stroke: none)
  line((0, 0), (0, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((1, 0), (1, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((2, 0), (2, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((3, 0), (3, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((4, 0), (4, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 0), (4, 0), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 0.9), (4, 0.9), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 1.8), (4, 1.8), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 2.7), (4, 2.7), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 3.6), (4, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 3.6), (4, 3.6), (4, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 0), (4.25, 0), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((4.25, 0), [#text(size: 9pt)[$r$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 3.825), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((0, 3.825), [#text(size: 9pt)[$s$]], anchor: "south", padding: 0.1176cm)
  content((-0.04989, -0.04989), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  line((3, 0.045), (3, -0.045), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((3, -0.1156), [#text(size: 9pt)[$n-d$]], anchor: "north", padding: 0.1176cm)
  line((4, 0.045), (4, -0.045), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((4, -0.1156), [#text(size: 9pt)[$n$]], anchor: "north", padding: 0.1176cm)
  line((0.05, 2.7), (-0.05, 2.7), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((-0.1206, 2.7), [#text(size: 9pt)[$n-d$]], anchor: "east", padding: 0.1176cm)
  line((0.05, 3.6), (-0.05, 3.6), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((-0.1206, 3.6), [#text(size: 9pt)[$n$]], anchor: "east", padding: 0.1176cm)
  line((0, 2.7), (3, 0), stroke: (thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  content((1.5, 1.421), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$r+s=n-d$]]])], anchor: "south")
  line((0, 3.6), (4, 0), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  content((2, 1.871), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$r+s=n$]]])], anchor: "south")
  content((0.85, 0.765), [#text(size: 9pt)[zero#linebreak()blocks]])
  content((2.95, 2.925), [#text(size: 7pt)[other blocks#linebreak()not specified]])
  content((2, 4.178), [#text(size: 9pt)[Grade blocks $Pi_"sH" Pi_r$]], anchor: "south", padding: 0.1176cm)
  line((4.48, 1.8), (5.57, 1.8), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  content((5.02, 2.367), [#text(size: 7pt)[$u=s$#linebreak()$v=n-r$]])
  line((6, 0.9), (6, 3.6), (9, 3.6), close: true, fill: rgb("#e9e9e9"), stroke: none)
  line((6, 0), (6, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((7, 0), (7, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((8, 0), (8, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((9, 0), (9, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((10, 0), (10, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6, 0), (10, 0), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6, 0.9), (10, 0.9), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6, 1.8), (10, 1.8), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6, 2.7), (10, 2.7), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6, 3.6), (10, 3.6), stroke: (paint: rgb("#dfdfdf"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6, 3.6), (10, 3.6), (10, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6, 0), (10.25, 0), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((10.25, 0), [#text(size: 9pt)[$u$]], anchor: "west", padding: 0.1176cm)
  line((6, 0), (6, 3.825), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((6, 3.825), [#text(size: 9pt)[$v$]], anchor: "south", padding: 0.1176cm)
  content((5.95, -0.04989), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  line((10, 0.045), (10, -0.045), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((10, -0.1156), [#text(size: 9pt)[$n$]], anchor: "north", padding: 0.1176cm)
  line((6.05, 0.9), (5.95, 0.9), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((5.879, 0.9), [#text(size: 9pt)[$d$]], anchor: "east", padding: 0.1176cm)
  line((6.05, 3.6), (5.95, 3.6), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((5.879, 3.6), [#text(size: 9pt)[$n$]], anchor: "east", padding: 0.1176cm)
  line((6, 0.9), (9, 3.6), stroke: (thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  content((7.5, 2.321), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$v=u+d$]]])], anchor: "south")
  line((6, 0), (10, 3.6), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  content((8, 1.729), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$v=u$]]])], anchor: "north")
  content((6.85, 2.79), [#text(size: 9pt)[zero#linebreak()mass]])
  content((8.65, 0.855), [#text(size: 9pt)[$v-u lt.eq d$]])
  content((8, 4.178), [#text(size: 9pt)[Reflected coupling $(U,V)$]], anchor: "south", padding: 0.1176cm)
}) 
$ bb(P) { R = r \, S = s } = 2^(- n) parallel Pi_s H Pi_r parallel_(upright("HS"))^2 \, #h(2em) r + s - n = u - v . $

],
    caption: [Figure 1: Grade blocks and their reflected coupling, schematic for $0 < d < n$. Under $U = S$, $V = n - R$, the zero-block region $r + s < n - d$ becomes the zero-mass region $v - u > d$, giving $V - U lt.eq d$ almost surely. Dashed boundaries are allowed; solid diagonals mark $r + s - n = u - v = 0$. Each marginal is $"Bin" \( n \, 1 \/ 2 \)$. Unshaded locations need not carry positive mass, and grid spacing is illustrative. ],
  ) <fig:grade-coupling>
  Apply Lemma 2 with $a = d$ and $sigma = sqrt(n) \/ 2$ to obtain
  #[#set math.equation(numbering: n => "(17)")
   $ 1 / N lr(bar.v.double  bar.v.double) T_(upright("HS"))^2 = bb(E) \( R + S - n \)^2 = bb(E) \( U - V \)^2 lt.eq 4 d sqrt(n) . $ <eq:coupling-bound>]
  Finally, (13) and Lemma 3 give
  $ I \( f \) = frac(\| cal(E)_h \|, N) lt.eq 2 / N lr(bar.v.double  bar.v.double) T_(upright("HS"))^2 lt.eq 8 d sqrt(n) . $
  This completes the proof. ◻
]

== 6 Noise sensitivity and agnostic learning <sec:consequences>

The influence bound has two consequences that are independent of the weighted grading used to prove it. A random-bucketing construction transfers the bound from one-bit changes to independent noise. Smoothing by this noise then gives low-degree polynomial approximants, which yield an agnostic learner by $L_1$ regression.

=== 6.1 Noise sensitivity <noise-sensitivity>

For $0 lt.eq eta lt.eq 1 \/ 2$, define the noise sensitivity $"NS"_eta \( f \) = bb(P) { f \( X \) eq.not f \( Y \) }$, where $X$ is uniform on the cube and $Y$ is obtained by flipping each coordinate of $X$ independently with probability $eta$.

#thm([Corollary 4.])[
  (Boolean noise sensitivity).  #emph[Let $n gt.eq 1$ and $d gt.eq 0$ be integers. If $f = "sgn" \( p \)$ on ${ - 1 \, 1 }^n$ for a real polynomial $p$ of degree at most $d$, with $"sgn" \( 0 \) = 1$, then 
$ "NS"_eta \( f \) lt.eq C d sqrt(eta) #h(2em) \( 0 < eta lt.eq 1 \/ 2 \) \, $

 where $C$ is an absolute constant.]
] <cor:noise-sensitivity>

#proof[
  Constants have zero noise sensitivity. For an integer $q gt.eq 2$, use the random-bucketing reduction of Diakonikolas, Raghavendra, Servedio, and Tan [3] Section 7.1, equation (14): choose independent uniform signs $a_i$ and independent uniform buckets $b \( i \) in { 1 \, dots.h \, q }$, and set
  $ g \( z \) = f \( a_1 z_(b \( 1 \)) \, dots.h \, a_n z_(b \( n \)) \) \, #h(2em) z in { - 1 \, 1 }^q . $
  Multilinearizing the substituted polynomial preserves its cube values, including zeros, and gives degree at most $min \( d \, q \)$. Theorem 1 therefore gives $I \( g \) lt.eq 8 d sqrt(q)$; a constant substitution contributes zero.
  Independently choose uniform $z in { - 1 \, 1 }^q$ and $J in { 1 \, dots.h \, q }$. Put $X_i = a_i z_(b \( i \))$ and $Y_i = X_i \( - 1 \)^(upright(bold(1))_({ b \( i \) = J }))$. Conditional on $J$, the flip indicators are independent Bernoulli variables of parameter $1 \/ q$, and their joint law does not depend on $J$. Conditional on $b \, J \, z$, the random signs make $X$ uniform, so $X$ is independent of the flip vector. Thus $\( X \, Y \)$ has exactly the noise law at rate $1 \/ q$. Since replacing $z$ by $z^(xor J)$ produces $Y$, averaging first over $z \, J$ gives
  $ "NS"_(1 \/ q) \( f \) = frac(bb(E)_(a \, b) I \( g \), q) lt.eq frac(8 d, sqrt(q)) . $
  For the rest of this section, Fourier coefficients and $L_1 \, L_2$ norms are normalized by uniform probability on the cube. In particular, $hat(f) \( S \) = bb(E) \[ f \( X \) chi_S \( X \) \]$ and
  $ "NS"_eta \( f \) = 1 / 2 sum_(S subset.eq \[ n \]) #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - 2 eta \)^(\| S \|) #scale(x: 120%, y: 120%)[\)] hat(f) \( S \)^2 . $
  This expression is nondecreasing for $0 lt.eq eta lt.eq 1 \/ 2$. Taking $q = floor.l 1 \/ eta floor.r$, so that $eta lt.eq 1 \/ q lt.eq 1 \/ 2$ and $q gt.eq 1 \/ \( 2 eta \)$, proves the claim with $C = 8 sqrt(2)$. ◻
]

For comparison, Kane proved an absolute $O \( d sqrt(epsilon) \)$ noise sensitivity bound for degree-$d$ polynomial threshold functions under standard Gaussian noise [7] Theorem 1. Here $0 < epsilon lt.eq 1$, and the input pair is $X$ and $\( 1 - epsilon \) X + sqrt(2 epsilon - epsilon^2) thin Z$, with $X \, Z$ independent standard Gaussian vectors. His proof counts sign changes along Gaussian rotations. Corollary 4 gives the same dependence on degree and noise rate for independent coordinate flips on the Boolean cube.

=== 6.2 Agnostic learning <agnostic-learning>

In agnostic learning the labels may be arbitrary: the objective is to predict nearly as well as the best function in a specified class. We use the $L_1$ polynomial regression method of Kalai, Klivans, Mansour, and Servedio [6], which was applied to polynomial threshold functions in [3] Section 8.

#thm([Corollary 5.])[
  (Uniform-marginal agnostic learning).  #emph[Let $n \, d gt.eq 1$ be integers, and let $cal(C)_(n \, d)$ be the class of functions $"sgn" \( p \)$ on ${ - 1 \, 1 }^n$ with $deg p lt.eq d$. Let $D$ be any distribution on ${ - 1 \, 1 }^n times { - 1 \, 1 }$ whose first marginal is uniform, and set 
$ upright("OPT") = min_(f in cal(C)_(n \, d)) bb(P)_(\( X \, Y \) tilde.op D) { f \( X \) eq.not Y } . $

 There is an absolute constant $A$ such that, for $0 < alpha \, delta < 1$, a learner using independent labeled samples from $D$ returns, with probability at least $1 - delta$, a Boolean hypothesis $h$ satisfying 
$ bb(P)_(\( X \, Y \) tilde.op D) { h \( X \) eq.not Y } lt.eq upright("OPT") + alpha . $

 Its running time and sample size are polynomial in $\( n + 1 \)^k$, $1 \/ alpha$, and $log \( 1 \/ delta \)$, where 
$ k = min {n \, ⌈A d^2 alpha^(- 2) log \( 4 \/ alpha \)⌉} . $

 The labels are unrestricted, and $h$ need not belong to $cal(C)_(n \, d)$.]
] <cor:agnostic-learning>

#proof[
  We first construct an $L_1$ approximant to each $f in cal(C)_(n \, d)$. For $0 < eta < 1 \/ 2$ and $rho = 1 - 2 eta$, the noise operator is
  $ T_rho f = sum_(S subset.eq \[ n \]) rho^(\| S \|) hat(f) \( S \) chi_S . $
  Equivalently, $T_rho f \( x \)$ is the expected value of $f$ after independent noise of rate $eta$ is applied to $x$. Since $f$ is Boolean and $T_rho f$ takes values in $\[ - 1 \, 1 \]$, $\| f - T_rho f \| = 1 - f T_rho f$ pointwise. Corollary 4 therefore gives, with $C = 8 sqrt(2)$,
  $ lr(bar.v.double f - T_rho f bar.v.double)_1 = 2 "NS"_eta \( f \) lt.eq 2 C d sqrt(eta) . $
  Take $eta = \( alpha \/ \( 8 C d \) \)^2$ and $K = ceil.l log \( 4 \/ alpha \) \/ \( 2 eta \) ceil.r$. Let $q$ be the Fourier truncation of $T_rho f$ to degrees at most $min \( K \, n \)$. If $K < n$, Parseval’s identity gives
  $ lr(bar.v.double T_rho f - q bar.v.double)_1 lt.eq lr(bar.v.double T_rho f - q bar.v.double)_2 lt.eq rho^(K + 1) lt.eq e^(- 2 eta \( K + 1 \)) lt.eq alpha \/ 4 \; $
  if $K gt.eq n$, the truncation error is zero. The first error is also at most $alpha \/ 4$, so
  #[#set math.equation(numbering: n => "(18)")
   $ lr(bar.v.double f - q bar.v.double)_1 lt.eq alpha \/ 2 . $ <eq:learning-approximation>]
  Taking $A = 32 C^2$ makes $min \( K \, n \) = k$ in the statement.
  For completeness, we explain how this direct $L_1$ estimate enters the regression argument of [6] proof of Theorem 5. Use the $M = sum_(j = 0)^k binom(n, j) lt.eq \( n + 1 \)^k$ characters of degree at most $k$ as features. On a training sample $Z$ of size $m$, fit a polynomial $P$ in these features by minimizing empirical absolute loss, then choose $t in \[ - 1 \, 1 \]$ to minimize the empirical error of $h = "sgn" \( P - t \)$. The fit is a linear program, and the threshold is found by sorting the fitted values. Write $hat(bb(E))_Z$ and $hat("err")_Z$ for empirical means and errors. A uniformly random threshold has error at most half the absolute loss, so the minimizing threshold satisfies
  $ hat("err")_Z \( h \) lt.eq 1 / 2 hat(bb(E))_Z \| Y - P \( X \) \| lt.eq 1 / 2 hat(bb(E))_Z \| Y - q \( X \) \| . $
  Choose an optimal $f in cal(C)_(n \, d)$ and its fixed approximant $q$. The triangle inequality and (18) imply $bb(E)_Z hat("err")_Z \( h \) lt.eq upright("OPT") + alpha \/ 4$. These hypotheses are halfspaces in the $M$ character features, so their VC dimension is at most $M + 1$. The usual expected uniform generalization bound, as used in [6] proof of Theorem 5, makes $bb(E)_Z "err"_D \( h \) lt.eq upright("OPT") + 3 alpha \/ 8$ for $m$ polynomial in $M$ and $1 \/ alpha$.
  Apply Markov’s inequality to the nonnegative random variable $"err"_D \( h \)$. Since $upright("OPT") lt.eq 1$ and $alpha < 1$,
  $ bb(P)_Z { "err"_D \( h \) > upright("OPT") + alpha \/ 2 } lt.eq frac(upright("OPT") + 3 alpha \/ 8, upright("OPT") + alpha \/ 2) lt.eq 1 - alpha \/ 12 . $
  Thus one trial succeeds with probability at least $alpha \/ 12$. Repeat independently $r = ceil.l \( 12 \/ alpha \) log \( 2 \/ delta \) ceil.r$ times. With probability at least $1 - delta \/ 2$, one candidate has this error. On an independent validation sample of size $ceil.l 8 alpha^(- 2) log \( 4 r \/ delta \) ceil.r$, Hoeffding’s inequality and a union bound estimate all $r$ errors within $alpha \/ 4$, except with probability $delta \/ 2$. Selecting the best validation score therefore gives error at most $upright("OPT") + alpha$. All the training, regression, repetition and validation costs have the stated polynomial bounds. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Fan Chang, Joseph Slote, Alexander Volberg, and Haonan Zhang, #emph[The Boolean surface area of polynomial threshold functions], preprint, 2026. #link("https://arxiv.org/abs/2604.08095v2")[arXiv:2604.08095v2].]
#bibitem([2])[Brynmor Chapman, #emph[The Gotsman--Linial conjecture is false], in Proceedings of the Twenty-Ninth Annual ACM--SIAM Symposium on Discrete Algorithms (SODA 2018), Society for Industrial and Applied Mathematics, 2018, 692--699. #link("https://doi.org/10.1137/1.9781611975031.45")[`doi:10.1137/1.9781611975031.45`]. Preprint: #link("https://arxiv.org/abs/2108.02288v1")[arXiv:2108.02288v1].]
#bibitem([3])[Ilias Diakonikolas, Prasad Raghavendra, Rocco A. Servedio, and Li-Yang Tan, #emph[Average sensitivity and noise sensitivity of polynomial threshold functions], SIAM Journal on Computing #strong[43] (2014), no.~1, 231--253. #link("https://doi.org/10.1137/110855223")[`doi:10.1137/110855223`]. Preprint: #link("https://arxiv.org/abs/0909.5011v2")[arXiv:0909.5011v2].]
#bibitem([4])[Craig Gotsman and Nathan Linial, #emph[Spectral properties of threshold functions], Combinatorica #strong[14] (1994), no.~1, 35--50. #link("https://doi.org/10.1007/BF01305949")[`doi:10.1007/BF01305949`].]
#bibitem([5])[Prahladh Harsha, Adam Klivans, and Raghu Meka, #emph[Bounding the sensitivity of polynomial threshold functions], Theory of Computing #strong[10] (2014), no.~1, 1--26. #link("https://doi.org/10.4086/toc.2014.v010a001")[`doi:10.4086/toc.2014.v010a001`].]
#bibitem([6])[Adam Tauman Kalai, Adam R. Klivans, Yishay Mansour, and Rocco A. Servedio, #emph[Agnostically learning halfspaces], SIAM Journal on Computing #strong[37] (2008), no.~6, 1777--1805. #link("https://doi.org/10.1137/060649057")[`doi:10.1137/060649057`].]
#bibitem([7])[Daniel M. Kane, #emph[The Gaussian surface area and noise sensitivity of degree-$d$ polynomial threshold functions], Computational Complexity #strong[20] (2011), 389--412. #link("https://doi.org/10.1007/s00037-011-0012-6")[`doi:10.1007/s00037-011-0012-6`]. Preprint (titled #emph[The Gaussian surface area and noise sensitivity of degree-$d$ polynomials]): #link("https://arxiv.org/abs/0912.2709v1")[arXiv:0912.2709v1].]
#bibitem([8])[Daniel M. Kane, #emph[The correct exponent for the Gotsman--Linial conjecture], Computational Complexity #strong[23] (2014), no.~2, 151--175. #link("https://doi.org/10.1007/s00037-014-0086-z")[`doi:10.1007/s00037-014-0086-z`]. Preprint: #link("https://arxiv.org/abs/1210.1283v1")[arXiv:1210.1283v1].]
#bibitem([9])[H. W. Kim, C. Maldonado, and J. Wellens, #emph[On graphs and the Gotsman--Linial conjecture for $d = 2$], preprint, 2017. #link("https://arxiv.org/abs/1709.06650v1")[arXiv:1709.06650v1].]
#bibitem([10])[Adrian Röllin, #emph[A note on the exchangeability condition in Stein's method], Statistics & Probability Letters #strong[78] (2008), no.~13, 1800--1806. #link("https://doi.org/10.1016/j.spl.2008.01.043")[`doi:10.1016/j.spl.2008.01.043`]. Preprint: #link("https://arxiv.org/abs/math/0611050v2")[arXiv:math/0611050v2].]
#bibitem([11])[Chun-Kai Tseng and Alexander Volberg, #emph[Small moments of the sensitivity of polynomial threshold functions], preprint, 2026. #link("https://arxiv.org/abs/2606.16004v2")[arXiv:2606.16004v2].]
#bibitem([12])[Yuan Xu, #emph[On discrete orthogonal polynomials of several variables], Advances in Applied Mathematics #strong[33] (2004), 615--632. #link("https://doi.org/10.1016/j.aam.2004.03.002")[`doi:10.1016/j.aam.2004.03.002`]. Preprint: #link("https://arxiv.org/abs/math/0401418v2")[arXiv:math/0401418v2].]


