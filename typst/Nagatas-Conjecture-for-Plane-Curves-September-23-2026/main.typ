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

#align(center)[#text(size: 16pt, weight: "bold")[Nagata's conjecture for plane curves]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Prescribing multiple points of a plane curve is an interpolation problem:
  how small can its degree be when the positions and the required orders of vanishing are given?
  Nagata’s conjecture predicts the answer at the square-root scale for sufficiently many very general points.
  Nagata introduced the problem in his work on Hilbert’s fourteenth problem and proved the square cases $r gt.eq
  16$ #cite(label("Nagata1959")) #cite(label("Nagata1965")).
  We prove the strict inequality for every $r gt.eq 10$, allowing unequal multiplicities.

We first work over $bb(C)$. Let

$ U_r = { \( p_1 \, dots.h \, p_r \) in \( bb(P)_(bb(C))^2 \)^r : p_i eq.not p_j upright(" for ") i eq.not j } . $

A nonzero effective plane curve is the zero divisor of a nonzero homogeneous form of degree $d gt.eq 1$.
  Its multiplicity at a point is the order of that form in the regular local ring. Components may repeat.
  The phrase #emph[very general] in the following theorem means the complement of one countable union of proper
  closed subsets, chosen simultaneously for all degrees and multiplicity vectors.

The scale can already be seen when all prescribed multiplicities equal $m$.
  A degree-$d$ form has $binom(d + 2, 2)$ coefficients, and order at least $m$ at $r$ points imposes at most $r
  binom(m + 1, 2)$ linear conditions. Their leading terms balance at $d = m sqrt(r)$.
  A count of conditions supplies curves asymptotically above this scale;
  proving their absence below it requires control of the dependencies among the conditions, for every $m$.
  The strict endpoint also matters: at nine points a nonzero cubic always exists,
  so the asserted strict inequality cannot start at $r = 9$.

#thm([Theorem 1.1.])[
  #emph[For every integer $r gt.eq 10$, there is a countable union $E_r$ of proper Zariski-closed subsets of
    $U_r$, with nonempty complement, such that the following holds for every tuple $\( p_1 \, dots.h \, p_r \)
    in.not E_r$. If $C$ is a nonzero effective plane curve of degree $d gt.eq 1$ and $m_1 \, dots.h \,
    m_r in bb(Z)_(gt.eq 0)$ satisfy $"mult"_(p_i) C gt.eq m_i$, then
$ d sqrt(r) > sum_(i = 1)^r m_i . $

]
] <thm:main>

On the blowup of the plane at such a tuple, the theorem gives a real divisor class of self-intersection zero that
  intersects every curve positively. It also determines the multipoint Seshadri constant:
  the largest $t$ for which the pullback of a line minus $t$ times the sum of the exceptional curves has
  nonnegative intersection with every curve. Its value is $1 \/ sqrt(r)$,
  which is irrational when $r$ is nonsquare. Section 6 proves these consequences and extends the theorem to every
  uncountable algebraically closed field of characteristic zero.

=== 1.1 Prior work and the interpolation approach <prior-work-and-the-interpolation-approach>

The geometry of plane linear systems connects this problem with the cones of effective and nef divisor classes on
  blowups. Ciliberto–Harbourne– Miranda–Roé #cite(label("CHMR2012")) develop these connections and compare several
  forms and extensions of Nagata’s conjecture. For homogeneous multiplicities,
  Roé #cite(label("Roe2001")) obtained the uniform estimate $d > m \( sqrt(r - 1) - pi \/ 8 \)$ for $r gt.eq
  10$ by specializing to configurations with infinitely near points.
  Harbourne #cite(label("Harbourne2001")) sharpened rational lower bounds and proved further cases in restricted
  multiplicity ranges. For ten very general points, degeneration methods give $d \/ m gt.eq
  117 \/ 37$ for every nonempty homogeneous system: Eckl’s Seshadri estimate and
  Ciliberto–Dumitrescu–Miranda–Roé’s analysis of plane systems give this bound in their respective
  formulations #cite(label("Eckl2011")) #cite(label("CDMR2011")).
  Such bounds explain the importance of controlling arbitrarily large multiplicities at each fixed nonsquare $r$.

Dumnicki–Harbourne–Küronya–Roé–Szemberg #cite(label("DHKRS2016")) study an analogue for very general monomial
  valuations, while Nivoche #cite(label("Nivoche2019")) relates the conjecture to transcendental interpolation in
  $bb(C)^n$. These perspectives emphasize that the obstruction is not merely the number of imposed conditions,
  but how vanishing conditions interact with the geometry of the ambient surface.
  More recently, Ciliberto–Miranda–Roé #cite(label("CMR2026")) Theorem 1 constructed irrational square-zero nef
  rays on the blowups at every $r gt.eq 10$ very general points.
  Those constructions do not determine the equal-weight multipoint Seshadri constant.
  Nagata’s conjecture singles out the class with equal exceptional coefficients,
  whose nefness gives that constant’s exact value.

The proof below uses two established approaches to this interaction.
  Ciliberto–Miranda #cite(label("CM1998")) develop degenerations of plane linear systems,
  and Evain #cite(label("Evain2007")) studies their infinitesimal limits when fat points,
  meaning points equipped with specified orders of vanishing, approach a divisor.
  Dumnicki #cite(label("Dumnicki2007")) encodes interpolation by finite diagrams of monomial exponents and their
  evaluation matrices. In particular, the proof of his Proposition 13 converts a one-point derivative matrix into
  polynomial evaluation on the exponent diagram. Our final rank problem has the same evaluation interpretation,
  with a different set of allowed polynomial degrees supplied by a collinear collision.

The elliptic stage uses the classical multiplicative theta product and its residue-class Laurent bases;
  the conventions used here are recorded in Rosengren #cite(label("Rosengren2020")) arXiv version,
  Section 1.2 and Exercise 1.6.5. We prove the needed product identities,
  basis formulas and convergence estimates in the normalization required by the argument.

=== 1.2 Proof strategy <proof-strategy>

Closed incidence loci turn a failure at very general points into a system of curves existing at every
  configuration. A product over cyclic permutations makes the multiplicities equal;
  write $d$ and $m$ for the resulting degree and common multiplicity.
  Moving the points toward a smooth curve gives a nonzero polynomial on its normal line bundle,
  with order at least $m$ at arbitrary normal displacements.
  For square $r$, its two highest coefficients already exclude $d \/ m lt.eq sqrt(r)$, including equality (Section 2).

For nonsquare $r$, we use a cubic and set nine normal displacements to zero.
  Dividing out the forced coefficient zeros and changing the fiber coordinate give a finite-dimensional space of
  polynomial sections whose first $m + 1$ coefficient bundles have equal degree (Section 3).
  On each fixed elliptic curve, the remaining $q = r - 9$ points collide along a horizontal coordinate line.
  After $b < m$ fiber derivatives, a section must then have base order at least $q \( m - b \)$;
  thus a particular finite jet map has a nonzero kernel. A separate degeneration gives explicit normalized theta
  bases whose expressions in logarithmic base and fiber coordinates $\( x \, y \)$ tend to $e^(K x + j y)$.
  Here $j$ is the fiber degree and $K$ a Laurent exponent. Their mixed derivatives give the limiting matrix

$ #scale(x: 120%, y: 120%)[\(] K^ell j^b #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq b < m \, quad 0 lt.eq
  ell < q \( m - b \) \, $

with columns indexed by exponent pairs $\( j \, K \)$ (Section 4).
  Only these numerical matrices are compared across curves;
  the argument does not choose a simultaneous family of kernel vectors.

To exclude the kernel, a total count of exponent pairs is not enough.
  We group them into horizontal rows of fixed $K$, with $j$ varying.
  Interpolation one row at a time gives full column rank if no row has more than $m$ points and at most
  $q \( m - t + 1 \)$ rows have at least $t$ points. The exponent pairs lie in a polygon whose slice-width profile
  supplies exactly these bounds. Since $d \/ m$ is rational and $r$ is nonsquare,
  the strict gap $d \/ m < sqrt(r)$ permits a contraction of that polygon;
  taking a common power of the original curve absorbs the integer endpoint error in the row count.
  Full rank persists for small positive degeneration parameter,
  contradicting the kernel on each fixed curve (Section 5).

== 2 From plane curves to normal polynomials <sec:reductions>

We reduce a violation at very general points to an equal-multiplicity system existing at every configuration.
  Moving its points toward a smooth plane curve then gives a polynomial on the normal bundle.
  This polynomial will exclude the square cases and supply the input for the cubic construction in Section 3.

The order of a section is the order of its scalar expression in a local frame.
  A frame change multiplies this expression by a unit, preserving the order.
  In local coordinates, order at least $m$ means that every Taylor coefficient of total degree less than $m$
  vanishes. Thus algebraic and holomorphic orders agree, and holomorphic coordinate changes preserve them.

=== 2.1 A universal equal-multiplicity system <a-universal-equal-multiplicity-system>

For positive integers $d \, m$, write $sans(U)_r \( d \, m \)$ for the property

#[#set math.equation(numbering: n => "(2.1)")
 $ upright("For every ") \( p_1 \, dots.h \, p_r \) in U_r upright(" there is a nonzero form")\
S in H^0 \( bb(P)^2 \, cal(O)_(bb(P)^2) \( d \) \) quad upright("such that") quad "mult"_(p_i) \( S \) gt.eq
  m quad \( 1 lt.eq i lt.eq r \) . $ <eq:universal>]

Here and below the multiplicity of a form is the multiplicity of its zero divisor.

#thm([Lemma 2.1.])[
  (Reduction to universal systems).  #emph[For each $r gt.eq
    10$ there is a countable union $E_r$ of proper Zariski-closed subsets of $U_r$, all defined over $bb(Q)$,
    with $U_r \\ E_r eq.not diameter$, having the following property.
    If a tuple outside $E_r$ supports a degree-$d_0$ form, $d_0 gt.eq 1$, with multiplicities at least $m_1 \,
    dots.h \, m_r in bb(Z)_(gt.eq 0)$ and
$ d_0 sqrt(r) lt.eq sum_(i = 1)^r m_i \, $

 then $sans(U)_r \( d \, m \)$ holds for some positive integers $d \, m$ with $d \/ m lt.eq sqrt(r)$.
   If $sans(U)_r \( d \, m \)$ holds, then $sans(U)_r \( N d \, N m \)$ holds for every positive integer $N$.
   Consequently, to prove Theorem 1 for a fixed $r$, it suffices to rule out every $sans(U)_r \( d \, m \)$ with
   $d \/ m lt.eq sqrt(r)$.]
] <lem:universal>

#proof[
  For a positive integer $e$ and $upright(bold(n)) = \( n_1 \, dots.h \, n_r \) in bb(Z)_(gt.eq 0)^r$,
    let $A_(e \, upright(bold(n))) subset.eq U_r$ consist of the tuples admitting a nonzero degree-$e$ form with
    multiplicity at least $n_i$ at the $i$th point. In standard affine charts,
    the required Taylor coefficients give a matrix with $binom(e + 2, 2)$ columns, one for each form coefficient.
    Its entries are polynomials with integer coefficients in the point coordinates.
    A nonzero form exists exactly when the matrix has less than full column rank.
    Thus $A_(e \, upright(bold(n)))$ is cut out by its full-column-size minors;
    if there are fewer rows than columns, the condition is automatic.
    Invariance of order makes these rank conditions agree on overlaps.
    Consequently $A_(e \, upright(bold(n)))$ is Zariski closed and defined over $bb(Q)$.
  Let $E_r$ be the union of all proper $A_(e \, upright(bold(n)))$. This is a countable union.
    On the dense chart where all points are affine, each proper $A_(e \, upright(bold(n)))$ has a defining minor
    that is a nonzero polynomial over $bb(Q)$. Choose $2 r$ complex numbers algebraically independent over $bb(Q)$
    as affine coordinates of the marked points. Such numbers can be chosen successively,
    since the algebraic closure of a countable field is countable.
    None of these minors vanishes at the resulting tuple, which also avoids the diagonals.
    Hence it lies in $U_r \\ E_r$.
  Now suppose that a violation as in the statement occurs outside $E_r$. Then $A_(d_0 \, upright(bold(m))) = U_r$.
    We use the cyclic-product reduction of Nagata #cite(label("Nagata1965")).
    Permuting the ordered points gives the same assertion for each cyclic shift of $upright(bold(m))$.
    At any fixed tuple, choose a nonzero form for each of the $r$ cyclic shifts and take their product.
    This product is nonzero, and orders add because the product of the initial Taylor terms is nonzero.
    Each original multiplicity occurs once at each point. Hence the product has degree and common lower multiplicity
  $ d = r d_0 \, wide m = sum_(i = 1)^r m_i . $
  The assumed violation makes $m > 0$, and
  $ d / m = frac(r d_0, sum_i m_i) lt.eq sqrt(r) . $
  The construction applies at every tuple, proving $sans(U)_r \( d \, m \)$;
    taking $N$th powers proves the common-multiple assertion.
    Thus excluding these universal systems excludes every violation outside the same $E_r$,
    for all degrees and multiplicity vectors. ◻
]

=== 2.2 Specialization to a normal bundle <specialization-to-a-normal-bundle>

Let $B subset.eq bb(P)^2$ be a smooth irreducible plane curve of degree $k gt.eq 1$,
  and fix a nonzero homogeneous equation $G_B$ for it. Put

$ L = cal(O)_B \( 1 \) \, wide M = L^k . $

The equation identifies the normal bundle of $B$ in $bb(P)^2$ with $M$,
  as in the formula for an effective Cartier divisor #cite(label("Stacks")) Tag 0B3P.
  In a local frame $e$ for $cal(O)_(bb(P)^2) \( 1 \)$, the local equation $t =
  G_B \/ e^k$ identifies a normal vector with its derivative under $t$.
  For $w in M_a$, the expression $f_j \( a \) w^j$ is an element of $L_a^d$ when $f_j$ is a section of
  $L^(d - k j)$. Thus the polynomial in the next proposition is intrinsically a section of the pullback of $L^d$
  to $"Tot" \( M \)$.

#thm([Proposition 2.2.])[
  (A necessary normal polynomial).  #emph[Suppose that $sans(U)_r \( d \, m \)$ holds.
    For every choice of distinct points $a_1 \, dots.h \, a_r in B$ and arbitrary vectors $c_i in M_(a_i)$,
    there is a nonzero polynomial
#[#set math.equation(numbering: n => "(2.2)")
 $ F \( w \) = sum_(j = 0)^(floor.l d \/ k floor.r) f_j w^j \, wide f_j in H^0 \( B \, L^(d - k j) \) \,
   $ <eq:normal-polynomial>]

 having multiplicity at least $m$ at each $\( a_i \, c_i \) in "Tot" \( M \)$.
   Its coefficients may be taken to be algebraic sections.]
] <prop:normal-polynomial>

#proof[
  We move the marked points in the plane, rescale the normal coordinate,
    and retain the first nonzero term of a family of plane forms.
  Choose a plane affine chart and its standard frame near each $a_i$.
    The differential of the local equation $t_i$ is nonzero by smoothness,
    so choose an affine tangent vector $V_i$ with $d t_i \( V_i \) = c_i$ in that frame. The affine-linear motions
  $ p_i \( s \) = a_i + s V_i $
  are rational in $s$, stay distinct for sufficiently small $s$, and satisfy
  $ lim_(s arrow.r 0) frac(t_i \( p_i \( s \) \), s) = c_i $
  in the chosen frames. The vectors $c_i$ are arbitrary complex normal vectors; no compatibility among them is required.
  Multiplicity at least $m$ at all $p_i \( s \)$ gives a homogeneous linear system over $bb(C) \( s \)$ in the
    degree-$d$ form coefficients. It has a nonzero solution: otherwise some full-column-size minor would be a
    nonzero rational function, giving full column rank at general complex values of $s$ and contradicting
    $sans(U)_r \( d \, m \)$.
  Clear denominators in a nonzero rational solution, and divide its polynomial coefficients by their maximal
    common power of $s$. This gives a finite polynomial family of homogeneous degree-$d$ forms
  $ S \( s \) = sum_(alpha gt.eq 0) s^alpha S_alpha \, wide S_0 eq.not 0 \, $
  satisfying the required multiplicities for general $s$. For each nonzero $S_alpha$,
    factor out its largest power of $G_B$:
  $ S_alpha = G_B^(j_alpha) R_alpha \, wide 0 lt.eq j_alpha lt.eq floor.l d \/ k floor.r . $
  Then $R_alpha$ has degree $d - k j_alpha$ and $R_alpha \|_B eq.not 0$,
    since the homogeneous ideal of $B$ is generated by $G_B$. Set
  $ u = min_(S_alpha eq.not 0) \( alpha + j_alpha \) \, wide F \( w \) =
    sum_(alpha + j_alpha = u) \( R_alpha \|_B \) w^(j_alpha) . $
  The sum is nonempty, and its terms have distinct exponents $j_alpha$ because $alpha + j_alpha = u$.
    Thus $F$ is nonzero, with algebraic coefficients of the types in (2.2).
  It remains to identify this polynomial as the normal limit and pass the multiplicities to it.
    Near a marked point choose a frame $e$ for $cal(O)_(bb(P)^2) \( 1 \)$, put $t = G_B \/ e^k$,
    and extend a local coordinate on $B$ to a holomorphic coordinate $zeta$ off $B$ so that $\( zeta \, t \)$ are
    surface coordinates. Write $r_alpha \( zeta \, t \)$ for the scalar expression of $R_alpha$ in the frame
    $e^(d - k j_alpha)$. Substituting $t = s w$ in the local expression of $S \( s \)$ and dividing by $s^u$ gives
  $ Phi \( s \, zeta \, w \) = sum_(S_alpha eq.not 0) s^(alpha + j_alpha - u) w^(j_alpha) r_alpha \( zeta \, s w \) . $
  Every exponent of $s$ is nonnegative, so $Phi$ extends holomorphically to $s = 0$ with value $F$.
    Terms with $alpha + j_alpha > u$ vanish there; in the remaining terms only $r_alpha \( zeta \, 0 \)$ contributes.
  The limit respects the normal-bundle and value-bundle frames.
    Indeed, if $e' = a \( zeta \, t \) e$, then $t' = a \( zeta \, t \)^(- k)
    t$ and the scalar expression of the section is multiplied by $a \( zeta \, t \)^(- d)$.
    After $t = s w$, the transitions at $s = 0$ are
  $ w' = a \( zeta \, 0 \)^(- k) w \, wide F' = a \( zeta \, 0 \)^(- d) F . $
  These are the transitions of $M$ and the pullback of $L^d$.
    Changing the extension of $zeta$ off $B$ reduces at $s = 0$ to its coordinate change on $B$,
    since the other terms contain $t = s w$. Thus the local rescaling realizes the intrinsic polynomial $F$ above.
  Finally fix an index $i$ and use such coordinates near $a_i$. The functions
  $ zeta_i \( s \) = zeta \( p_i \( s \) \) \, wide w_i \( s \) = frac(t \( p_i \( s \) \), s) $
  extend holomorphically to $s = 0$, with values representing $a_i$ and $c_i$.
    Translate the divided family to the lifted moving point:
  $ Psi_i \( s \, xi \, omega \) = Phi #scale(x: 120%, y: 120%)[\(] s \, zeta_i \( s \) + xi \, w_i \( s \) +
    omega #scale(x: 120%, y: 120%)[\)] . $
  For each general nonzero $s$, the substitution $t = s w$ is a local biholomorphism of the surface,
    and multiplication by $s^(- u)$ is multiplication by a nonzero scalar.
    The multiplicity assumption on $S \( s \)$ therefore implies
  $ partial_xi^a partial_omega^b Psi_i \( s \, 0 \, 0 \) = 0 wide \( a \, b gt.eq 0 \, med a + b < m \) . $
  Each expression on the left is holomorphic at $s = 0$ and vanishes for general nonzero $s$, hence also at zero.
    These are exactly the order-$m$ conditions for $F$ at $\( a_i \, c_i \)$. ◻
]

=== 2.3 The square case <the-square-case>

We use two basic facts about smooth projective curves. A nonzero section of a line bundle has an effective zero
  divisor whose degree is the degree of the bundle. In particular,
  a degree-zero line bundle has a nonzero section only if it is trivial.
  Also, for a smooth complex projective curve of positive genus, $"Pic"^0 \( B \)$ is a complex torus;
  its subgroup of elements of any fixed finite order is finite,
  so its torsion subgroup is countable #cite(label("Stacks")) Tag 0C1Z.

#thm([Proposition 2.3.])[
  (Strict inequality for square $r$).  #emph[Let $r = k^2$ with $k gt.eq 4$.
    There are no positive integers $d \, m$ such that $d lt.eq k m$ and $sans(U)_r \( d \, m \)$ holds.]
] <prop:squares>

#proof[
  Suppose that $d lt.eq k m$ and $sans(U)_r \( d \, m \)$ holds.
    We choose the marked points to exclude normal polynomials of fiber degree below $m$,
    and the displacements to exclude fiber degree $m$. Take a smooth degree-$k$ plane curve $B$,
    for example a Fermat curve, and retain $L = cal(O)_B \( 1 \)$ and $M = L^k$.
    Its genus is $\( k - 1 \) \( k - 2 \) \/ 2 > 0$, and $deg M = k^2 = r$.
    Choose distinct points $a_1 \, dots.h \, a_r$ so that, with $P = sum_i a_i$, the degree-zero bundle
  $ A = M \( - P \) $
  is nontorsion. Such a choice exists: fix $r - 1$ distinct points and vary the last one.
    The map $a mapsto cal(O)_B \( a \)$ is injective on a positive-genus curve,
    since a linear equivalence between two distinct single points would give a nonconstant meromorphic function
    with one simple pole, hence a degree-one map to $bb(P)^1$, making the curve rational.
    Thus varying the last point gives uncountably many distinct bundles $A$,
    while the torsion bundles are countable; the finitely many prohibited coincidences may also be avoided.
  The restriction sequence
  $ 0 arrow.r cal(O)_(bb(P)^2) arrow.r^(thin G_B thin) cal(O)_(bb(P)^2) \( k \) arrow.r cal(O)_B \( k \) arrow.r 0 $
  and $H^1 \( bb(P)^2 \, cal(O)_(bb(P)^2) \) = 0$ #cite(label("Stacks")) Tag 01XT give
  $ h^0 \( B \, M \) = binom(k + 2, 2) - 1 = frac(k^2 + 3 k, 2) < k^2 = r . $
  Hence one can choose $c = \( c_i \)_i in xor.big_i M_(a_i)$ outside the image of the evaluation map
  $ H^0 \( B \, M \) arrow.r xor.big_(i = 1)^r M_(a_i) . $
  Apply Proposition 3 with these choices. Let $j$ be the largest exponent with $f_j eq.not 0$.
    Then $j lt.eq floor.l d \/ k floor.r lt.eq m$. If $j < m$,
    take $j$ derivatives with respect to a local fiber coordinate.
    Since $j$ is the largest exponent, the result is $j ! f_j$, independent of the fiber coordinate.
    Differentiation lowers order by at most $j$, so $f_j$ has base vanishing order at least $m - j$ at each $a_i$.
    Its bundle has degree
  $ deg L^(d - k j) = k \( d - k j \) lt.eq k^2 \( m - j \) = r \( m - j \) . $
  Strict inequality is incompatible with these required zeros.
    Equality forces $d = k m$, and removing the zeros then gives a nonzero section of
  $ L^(k \( m - j \)) #scale(x: 120%, y: 120%)[\(] - \( m - j \) P #scale(x: 120%, y: 120%)[\)] = A^(m - j) . $
  This is a nontrivial degree-zero bundle, because $A$ is nontorsion and $m - j > 0$,
    so it too has no nonzero section. Thus $j < m$ is impossible.
  It follows that $j = m$ and $d = k m$. In this case $f_m$ is a nonzero constant.
    At each marked fiber the restriction of $F$ is a degree-$m$ polynomial, with leading coefficient $f_m$,
    having a zero of order at least $m$ at $c_i$. In any compatible frame it therefore equals
  $ F \|_(M_(a_i)) \( w \) = f_m \( w - c_i \)^m . $
  Comparing the coefficient of $w^(m - 1)$ gives
  $ \( f_(m - 1) \( a_i \) \)_i = - m f_m \( c_i \)_i . $
  But $f_(m - 1) in H^0 \( B \, M \)$, and multiplication by the nonzero scalar $-
    m f_m$ preserves the image of the evaluation map. This contradicts the choice of $c$ and finishes the proof. ◻
]

Together with Lemma 2, the proposition proves Theorem 1 for square $r$,
  including the strict inequality and unequal multiplicities.

=== 2.4 Nine zero displacements on a cubic <nine-zero-displacements-on-a-cubic>

For the remaining argument we will apply Proposition 3 with $k =
  3$ and with zero normal displacements at nine distinct points of a smooth plane cubic.
  Write $P = a_1 + dots.h.c + a_9$. Extend the coefficient list by $f_j = 0$ for $j > floor.l d \/ 3 floor.r$.
  At each $\( a_i \, 0 \)$, expansion in the fiber variable shows that multiplicity at least $m$ implies

#[#set math.equation(numbering: n => "(2.3)")
 $ f_j in H^0 #scale(x: 120%, y: 120%)[\(] B \, L^(d - 3 j) \( - \( m - j \) P \) #scale(x: 120%, y: 120%)[\)]
   wide \( 0 lt.eq j < m \) . $ <eq:nine-zeros>]

Indeed, in a local base coordinate $zeta$ centered at $a_i$,
  the coefficient of $zeta^a w^j$ must vanish whenever $a + j < m$.
  Thus $f_j$ has base order at least $m - j$ at every point of $P$.
  The coefficient bundles in (2.3) all have degree $3 \( d - 3 m \)$, independent of $j$.
  These conditions hold regardless of the additional points and normal displacements chosen in the proposition.

#thm([Lemma 2.4.])[
  (Excluding degree at most $3 m$).  #emph[If $r gt.eq 10$ and $sans(U)_r \( d \, m \)$ holds for positive
    integers $d \, m$, then $d > 3 m$.]
] <lem:cubic-low-degree>

#proof[
  Suppose first that $d < 3 m$. Choose a smooth plane cubic and nine distinct points with zero normal
    displacements, as above, completing them to $r$ distinct base points with arbitrary further displacements.
    Every exponent occurring in (2.2) is less than $m$. For each such exponent,
    (2.3) prescribes at least $9 \( m - j \)$ zeros, whereas
  $ deg L^(d - 3 j) = 3 \( d - 3 j \) < 9 \( m - j \) . $
  Thus every coefficient is zero, contradicting the nonzero polynomial provided by Proposition 3.
  Now suppose that $d = 3 m$. A smooth plane cubic has genus one.
    Choose the nine points so that $A = L^3 \( - P \)$ is nontorsion,
    by the same argument used in the square case. Complete them to $r$ distinct base points,
    choosing a nonzero vector $c_10 in M_(a_10)$; this is possible because $r gt.eq 10$.
    Apply Proposition 3 with these choices and zero displacements at the first nine points.
    For every $j < m$, the bundle in (2.3) is $A^(m - j)$, a nontrivial degree-zero bundle.
    Hence these coefficients vanish, and the nonzero normal polynomial must be $F \( w \) =
    f_m w^m$ for a nonzero constant $f_m$. This is nonzero at $\( a_10 \, c_10 \)$,
    so it cannot have multiplicity at least $m gt.eq 1$ there. This is again a contradiction. ◻
]

== 3 Polynomial sections on an elliptic curve <sec:elliptic>

Nine zero normal displacements impose zeros on the coefficients of a normal polynomial.
  Dividing out these zeros puts its first $m + 1$ coefficients in bundles of the same positive degree.
  We first make this change intrinsically on any smooth cubic.
  We then choose cubics and marked points for which theta functions give explicit bases of the resulting spaces,
  ready for the collision and limit in Section 4.

In this section and Section 4, $H^0$ denotes holomorphic sections.
  The algebraic sections supplied by Proposition 3 belong to these spaces,
  so excluding holomorphic solutions will also exclude the necessary normal polynomials.

=== 3.1 Removing the nine prescribed coefficient zeros <removing-the-nine-prescribed-coefficient-zeros>

For this construction, let $d \, m$ be any positive integers with $d > 3 m$.
  Let $B$ be a smooth plane cubic, let $L = cal(O)_B \( 1 \)$ and $M = L^3$,
  and choose nine distinct points with divisor $P = a_1 + dots.h.c + a_9$.
  Write $sigma_P$ for the canonical section of $cal(O)_B \( P \)$ with zero divisor $P$, and put

$ A = M ⊗ cal(O)_B \( - P \) \, wide T = L^(d - 3 m) \, wide u_0 = floor.l d \/ 3 floor.r . $

Thus $deg A = 0$ and $deg T = 3 \( d - 3 m \) > 0$. Multiplication by $sigma_P$ defines a bundle map $A arrow.r
  M$, written

$ w = sigma_P v \, $

which is invertible over $B \\ P$. Define coefficient spaces inside $H^0 \( B \, T ⊗ A^(m - j) \)$ by

#[#set math.equation(numbering: n => "(3.1)")
 $ V_j =
   cases(delim: "{", H^0 \( B \, T ⊗ A^(m - j) \) \, & 0 lt.eq j lt.eq m \,, sigma_P^(j - m) H^0 \( B \, L^(d - 3
   j) \) \, & m < j lt.eq u_0 .) $ <eq:coefficient-spaces>]

Negative powers denote dual powers. The target in the second line is correct because

$ L^(d - 3 j) ⊗ cal(O)_B \( \( j - m \) P \) = T ⊗ A^(m - j) . $

Multiplication by $sigma_P^(j - m)$ is injective, as can be checked on $B \\ P$.
  Let $cal(W)$ be the space of polynomial sections on $"Tot" \( A \)$

$ tilde(F) \( v \) = sum_(j = 0)^(u_0) g_j v^j \, wide g_j in V_j \, $

valued in the pullback of $T ⊗ A^m = L^d \( - m P \)$. It is a finite-dimensional space:
  its coefficient blocks are spaces of sections on the compact curve $B$,
  and distinct powers of the fiber coordinate make their sum direct.

The nine zero displacements are now built into $cal(W)$. The remaining points impose ordinary multiplicities at
  scalar fiber coordinate $1$, as follows.

#thm([Proposition 3.1.])[
  #emph[Suppose $r gt.eq 10$, $d > 3 m$, and $sans(U)_r \( d \, m \)$ holds.
    Choose $B \, P \, A$ and $cal(W)$ as above, and fix a holomorphic frame of $A$ on a coordinate disk in
    $B \\ P$. For every choice of $q = r - 9$ distinct points $b_1 \, dots.h \, b_q$ in this disk,
    there is a nonzero $tilde(F) in cal(W)$ of multiplicity at least $m$ at each point $\( b_alpha \, 1 \)$ of
    $"Tot" \( A \)$, where $1$ is the scalar coordinate in the chosen frame.]
] <prop:necessary-W>

#proof[
  Apply Proposition 3 at the distinct points $a_1 \, dots.h \, a_9 \, b_1 \, dots.h \, b_q$.
    Take zero normal displacements at the $a_i$. At $b_alpha$,
    take the image under multiplication by $sigma_P$ of the vector with scalar coordinate $1$ in the chosen frame
    of $A$. The normal-polynomial proposition allows these arbitrary normal vectors, so it supplies a nonzero
  $ F \( w \) = sum_(j = 0)^(u_0) f_j w^j \, wide f_j in H^0 \( B \, L^(d - 3 j) \) \, $
  with the required multiplicities.
  By (2.3), $f_j$ vanishes along $\( m - j \) P$ for $j < m$. Consequently the expression
  $ tilde(F) \( v \) = sigma_P^(- m) F \( sigma_P v \) = sum_(j = 0)^(u_0) f_j sigma_P^(j - m) v^j $
  extends across $P$. The prescribed zeros cancel its negative powers of $sigma_P$,
    and its coefficients have exactly the forms in (3.1). It therefore belongs to $cal(W)$ and is nonzero,
    since the fiber substitution is invertible on $B \\ P$.
  Near each $b_alpha$, $w = sigma_P v$ is a nonsingular change of surface coordinates.
    The value-bundle map given by multiplication by $sigma_P^(- m)$ is also invertible there;
    in local frames it is multiplication by a holomorphic unit.
    These two operations preserve ordinary order of vanishing and take the displaced point to $\( b_alpha \, 1 \)$. ◻
]

We next realize these coefficient spaces on explicit elliptic curves.
  Their bases will retain the bundle multipliers, not merely their degrees;
  those multipliers determine the Laurent exponents in the limit.

=== 3.2 Theta functions and plane cubics <theta-functions-and-plane-cubics>

For $0 < tau < 1$, let

$ X_tau = bb(C)^(*) \/ tau^(bb(Z)) tilde.eq bb(C) \/ \( 2 pi i bb(Z) + \( log tau \) bb(Z) \) . $

This is a connected compact complex torus of dimension one.
  For $n in bb(Z)$ and $gamma in bb(C)^(*)$, define $D \( n \, gamma \)$ as the holomorphic line bundle obtained
  from $bb(C)^(*) times bb(C)$ by the action generated by

$ \( z \, t \) mapsto \( tau z \, gamma z^(- n) t \) . $

In its covering-space frame, sections are holomorphic functions with

$ f \( tau z \) = gamma z^(- n) f \( z \) \, $

and ordinary multiplication gives the tensor identifications

$ D \( n \, gamma \) ⊗ D \( n' \, gamma' \) = D \( n + n' \, gamma gamma' \) . $

Define

#[#set math.equation(numbering: n => "(3.2)")
 $ Theta_tau \( z \) = product_(p = 0)^oo \( 1 - tau^p z \) product_(p = 1)^oo \( 1 - tau^p \/ z \) .
   $ <eq:theta-product>]

We write $Theta$ when $tau$ is fixed. On every compact annulus,
  the sums of the absolute deviations of the factors from $1$ are bounded by geometric series.
  The products therefore converge locally uniformly on $bb(C)^(*)$, and reindexing gives

$ Theta \( tau z \) = - z^(- 1) Theta \( z \) . $

Its zeros are precisely the points of $tau^(bb(Z))$, all simple:
  exactly one factor vanishes at each, while the remaining product is nonzero.
  Thus $Theta \( z \/ a \)$ is a section of $D \( 1 \, - a \)$ with divisor the single point represented by $a in
  bb(C)^(*)$. Products of $n$ such sections, with the parameters having product $\( - 1 \)^n gamma$,
  show that $D \( n \, gamma \)$ has degree $n$ for $n > 0$.
  Tensor products and duals give the formula for every integer $n$; in degree zero, use $D \( 0 \, gamma \) =
  D \( 1 \, gamma \) ⊗ D \( 1 \, 1 \)^(- 1)$.

The multiplicative theta convention and residue-class bases are classical;
  see Rosengren #cite(label("Rosengren2020")) arXiv version, Section 1.2 and Exercise 1.6.5.
  We include the proof to fix all multipliers and normalizations.

#thm([Lemma 3.2.])[
  #emph[For $n > 0$ and $gamma in bb(C)^(*)$, the space $H^0 \( X_tau \, D \( n \, gamma \) \)$ has dimension $n$.
    The Laurent coefficients of a section $f \( z \) = sum_(K in bb(Z)) c_K z^K$ satisfy
#[#set math.equation(numbering: n => "(3.3)")
 $ c_(K + n) & = gamma^(- 1) tau^K c_K \,\
c_(K + n p) & = c_K gamma^(- p) tau^(p K + n p \( p - 1 \) \/ 2) wide \( p in bb(Z) \) . $ <eq:laurent-recurrence>]

 One coefficient in each residue class modulo $n$ may be prescribed arbitrarily.
   Taking one nonzero starting coefficient at a time gives a basis supported in the individual residue classes.]
] <lem:torus-sections>

#proof[
  A holomorphic function on $bb(C)^(*)$ has a Laurent expansion convergent on compact annuli.
    Comparing coefficients in its functional equation gives $tau^K c_K = gamma c_(K + n)$;
    iteration in either direction proves (3.3).
  Conversely, prescribe one coefficient per residue class and extend by the recurrence.
    For a fixed starting exponent $K$, the terms on any compact annulus are bounded by
  $ C exp \( - c p^2 + C' \| p \| \) \, wide c > 0 \, $
  because $n > 0$ and $log tau < 0$. The resulting Laurent series converges normally and satisfies the functional
    equation. There are exactly $n$ free coefficients, and uniqueness of Laurent expansions proves the basis
    assertion. ◻
]

#thm([Lemma 3.3.])[
  #emph[For every $gamma in bb(C)^(*)$, the complete space of sections of $D \( 3 \, gamma \)$ embeds $X_tau$ into
    $bb(P)^2$ as a smooth irreducible plane cubic, with $cal(O)_(bb(P)^2) \( 1 \)$ pulling back to
    $D \( 3 \, gamma \)$.]
] <lem:cubic-embedding>

#proof[
  Let $Q$ be an effective divisor of degree $t in { 1 \, 2 }$.
    A product of $t$ theta factors, using lifts of its points with their multiplicities,
    is a section with divisor exactly $Q$. Division by this product identifies sections of $D \( 3 \, gamma \)$
    vanishing along $Q$ with sections of some $D \( 3 - t \, gamma' \)$. Their dimension is $3 - t$ by Lemma 7.
  For $t = 1$, this proves that the three-dimensional section space has no base points.
    For two distinct points it shows that the associated map separates them.
    For $Q = 2 p$, the dimension drop from sections vanishing at $p$ to those vanishing twice supplies a section
    of order exactly one at $p$. Its ratio with a section nonzero there has nonzero derivative.
    The map is therefore an injective holomorphic immersion, and compactness makes it an embedding.
  By Chow’s Theorem #cite(label("Chow1949")), the closed analytic image is algebraic.
    It is smooth and irreducible because it is an embedded connected compact Riemann surface.
    Its hyperplane bundle pulls back to $D \( 3 \, gamma \)$, of degree three, so the image is a plane cubic. ◻
]

=== 3.3 Choosing the cubic and marked points <choosing-the-cubic-and-marked-points>

We now fix a nonsquare integer $r gt.eq 10$ and a hypothetical universal system $sans(U)_r \( d \, m \)$ with
  $d \/ m lt.eq sqrt(r)$. The rationality of $d \/ m$ and Lemma 5 give $3 < d \/ m < sqrt(r)$. Set

#[#set math.equation(numbering: n => "(3.4)")
 $ q = r - 9 \, wide rho = 3 \( d \/ m - 3 \) \, wide rho_(*) = 3 \( sqrt(r) - 3 \) \,\
0 < rho < rho_(*) \, wide 2 rho_(*) + rho_(*)^2 / 9 = q . $ <eq:rho>]

Put

$ h = 3 \( d - 3 m \) = m rho > 0 \, wide u_0 = floor.l d \/ 3 floor.r gt.eq m . $

Set $x_0 = 1 \/ 2$ and choose a rational number $Delta$ such that

#[#set math.equation(numbering: n => "(3.5)")
 $ 0 < Delta < x_0 \, wide rho + frac(Delta rho, 9) < rho_(*) . $ <eq:delta>]

The strict slope gap leaves an interval of such choices. Rationality of $Delta$ will keep the Laurent exponent
  intervals away from integral endpoints.

Choose nine distinct real numbers $x_i$ with

#[#set math.equation(numbering: n => "(3.6)")
 $ 0 < x_i < x_0 \, wide sum_(i = 1)^9 \( x_0 - x_i \) = Delta \,\
eta = frac(sum_(i = 1)^9 x_i + rho_(*), 3) \, wide z_i = tau^(x_i) med \( 1 lt.eq i lt.eq 9 \) \, wide z_0 =
  tau^(x_0) . $ <eq:marked-parameters>]

For example, take $x_i = x_0 - i Delta \/ 45$. The quantities $rho \, Delta \, x_i \,
  eta$ can be kept unchanged under a common multiple of $\( d \, m \)$, whereas $h \,
  u_0$ and the coefficient spaces depend on the actual pair.
  We keep this pair fixed while taking the collision on each curve and the subsequent limit in $tau$.

For each $0 < tau < 1$, use Lemma 8 to identify $X_tau$ with a plane cubic $B$, with the holomorphic identification

$ L = cal(O)_B \( 1 \) = D \( 3 \, tau^eta \) \, wide M = L^3 . $

Let $a_i$ be the point represented by $z_i$ and put $P = a_1 + dots.h.c + a_9$.
  These points and the point represented by $z_0$ are distinct:
  their exponents lie in $\( 0 \, 1 \)$, and two lifts represent the same point only if their exponents differ by
  an integer.

In the covering-space frame, the section

$ Pi \( z \) = product_(i = 1)^9 Theta \( z \/ z_i \) $

has divisor $P$ and gives an identification

$ cal(O)_B \( P \) = D (9 \, - tau^(sum_i x_i)) $

under which the canonical section $sigma_P$ is represented by $Pi \( z \)$.
  Thus the bundles already used in the construction are

$ A = M ⊗ cal(O)_B \( - P \) \, wide T = L^(d - 3 m) . $

Since $3 eta = sum_i x_i + rho_(*)$, we have

$ A = D \( 0 \, - tau^(rho_(*)) \) \, wide deg T = h \, wide T ⊗ A^m = L^d ⊗ cal(O)_B \( - m P \) . $

These identifications use the covering-space frames and their tensor products.
  We retain the displayed powers of $tau$ as written, without replacing the multiplier presentations by isomorphic ones.

A cubic equation identifies the normal bundle of $B$ with $M = L^3$.
  Its differential at each point surjects onto the normal fiber,
  so every scalar specified in the chosen covering-space frame is an allowed normal displacement in Proposition 3.
  Rescaling the cubic equation does not restrict those choices.
  All constructions are made for each fixed $tau$; their algebraic dependence on $tau$ is not required.

Denote the resulting polynomial space by $cal(W)_tau$. By Lemma 7, its first $m +
  1$ coefficient blocks have degree and dimension $h$. For $j > m$, the dimension is $3 \( d - 3 j \)$ when $d -
  3 j > 0$, and is one when $d - 3 j = 0$. In the last case the source is $H^0 \( B \, cal(O)_B \) = bb(C)$,
  since $B$ is compact and connected.

Near the point represented by $\( z \, v \) = \( z_0 \, 1 \)$, use coordinates

#[#set math.equation(numbering: n => "(3.7)")
 $ z = z_0 e^x \, wide v = e^y . $ <eq:local-chart>]

Choose the $x$-disk small enough to map injectively to $B$ and avoid $P$,
  and the $y$-disk small enough that $e^y$ is injective. In the fixed covering-space frame of $T ⊗ A^m$,
  the scalar expression is

$ tilde(F) \( x \, y \) = sum_(j = 0)^(u_0) g_j \( z_0 e^x \) e^(j y) . $

Here $g_j \( z \)$ denotes the holomorphic function in its covering-space frame;
  all summands take values in the same bundle.

For every fixed $tau in \( 0 \, 1 \)$ and every $q$ distinct positions $xi_1 \, dots.h \,
  xi_q$ sufficiently near zero, apply Proposition 6 in this disk and the fixed frame of $A$.
  It gives a nonzero $tilde(F) in cal(W)_tau$ of multiplicity at least $m$ at each
  $\( x \, y \) = \( xi_alpha \, 0 \)$, since $v = 1$ corresponds to $y = 0$.
  The existence is pointwise in $tau$ and in the tuple of positions;
  the collision will use no simultaneous choice of sections.

== 4 Colliding points and degenerating sections <sec:limits>

We turn the multiplicities at the remaining $q$ points into derivative conditions at one point of $"Tot" \( A \)$.
  Universal existence will force these conditions to have a nonzero solution in $cal(W)_tau$.
  We then choose bases whose derivative matrices have an explicit limit as $tau arrow.r 0^(+)$.
  Section 5 will prove full column rank when the common multiplicity is sufficiently large at a fixed ratio $d \/ m$.

All choices from Section 3, including $d \, m \, q \, h \, u_0$ and $rho \, rho_(*) \, Delta \, x_i \, x_0 \,
  eta$, remain fixed. The collision takes place with $tau$ fixed, before the matrix limit in $tau$.

=== 4.1 Collision on a fixed surface <collision-on-a-fixed-surface>

The collision below belongs to the broader study of limits of fat-point conditions;
  compare Evain #cite(label("Evain2007")) Sections 2 and 6. We prove the particular local constraint directly.

For each fixed $tau$, use the coordinates and the frame in (3.7).
  If $F in cal(W)_tau$ has coefficients $g_j$, write its scalar expression in this chart as

$ H_F \( x \, y \) = sum_(j = 0)^(u_0) g_j \( z_0 e^x \) e^(j y) . $

Define the finite index set

$ cal(I) = { \( ell \, b \) in bb(Z)_(gt.eq 0)^2 : 0 lt.eq b < m \, quad 0 lt.eq ell < q \( m - b \) } $

and the linear map $J_tau : cal(W)_tau arrow.r bb(C)^(cal(I))$ whose coordinates are

#[#set math.equation(numbering: n => "(4.1)")
 $ \( J_tau F \)_(ell \, b) = partial_x^ell partial_y^b H_F \( x \, y \)\|_(\( 0 \, 0 \)) \, wide 0 lt.eq b < m \,
   quad 0 lt.eq ell < q \( m - b \) . $ <eq:jet-rows>]

The value bundle is expressed in one fixed local frame when these derivatives are taken.

#thm([Lemma 4.1.])[
  (Collision of the further points).  #emph[If $sans(U)_r \( d \, m \)$ holds,
    then $ker J_tau eq.not { 0 }$ for every fixed $tau in \( 0 \, 1 \)$.]
] <lem:collision>

#proof[
  Fix $tau$. Choose a sequence of ordered tuples $\( xi_(1 \, nu) \, dots.h \, xi_(q \, nu) \)$ of distinct points
    in the $x$-coordinate disk, all tending to zero. By Proposition 6,
    there is a nonzero $F_nu in cal(W)_tau$ with multiplicity at least $m$ at every $\( xi_(a \, nu) \, 0 \)$.
  Fix a basis of the finite-dimensional space $cal(W)_tau$ and normalize the coefficient vector of each $F_nu$ to
    have Euclidean norm one. A subsequence converges to a unit vector, defining a nonzero $F_0 in cal(W)_tau$:
    the coefficient blocks in (3.1) form a direct sum. As the basis and chart are fixed,
    coefficient convergence gives locally uniform convergence of $H_(F_nu)$ and all of its derivatives.
  For $0 lt.eq b < m$, set
  $ h_(b \, nu) \( x \) = partial_y^b H_(F_nu) \( x \, 0 \) \, wide h_(b \, 0) \( x \) =
    partial_y^b H_(F_0) \( x \, 0 \) . $
  Multiplicity at least $m$ at $\( xi_(a \, nu) \, 0 \)$ implies
  $ "ord"_(xi_(a \, nu)) h_(b \, nu) gt.eq m - b wide \( 1 lt.eq a lt.eq q \) . $
  If $h_(b \, 0)$ is identically zero, all of its required jets already vanish.
    Otherwise choose a small closed disk centered at zero, contained in the coordinate disk,
    on which $h_(b \, 0)$ has no zeros except possibly at zero and has none on the boundary.
    For all sufficiently large $nu$, every $xi_(a \, nu)$ is inside this disk,
    and uniform convergence on its boundary implies that $h_(b \, nu)$ and $h_(b \, 0)$ have the same number of
    zeros there, counted with multiplicity. The argument principle, or Rouché’s Theorem, therefore gives
  $ "ord"_0 h_(b \, 0) gt.eq q \( m - b \) . $
  This holds for every $b < m$, and is exactly $J_tau F_0 = 0$. ◻
]

The rows in (4.1) describe a local ideal. If the distinct centers are $\( xi_a \, 0 \)$ and $Q \( x \) =
  product_(a = 1)^q \( x - xi_a \)$, write a local holomorphic function as $sum_(b gt.eq 0) h_b \( x \) y^b$.
  The multiplicity conditions require $Q^(m - b)$ to divide $h_b$ for $b < m$.
  When the centers collide, the corresponding limiting conditions are divisibility by $x^(q \( m - b \))$,
  or membership in $\( x^q \, y \)^m$. Their number is

$ \| cal(I) \| = sum_(b = 0)^(m - 1) q \( m - b \) = frac(q m \( m + 1 \), 2) . $

Lemma 9 establishes these conditions for a nonzero limit.
  It remains to compute the matrix of $J_tau$ in bases suited to $tau arrow.r 0^(+)$.

=== 4.2 A common chart and normalized theta sections <a-common-chart-and-normalized-theta-sections>

Although the tori vary, one polydisk in $\( x \, y \)$ is a valid chart for all sufficiently small positive $tau$.
  Fix $R$ with $0 < R < pi \/ 2$, and let

$ delta_P = min_(1 lt.eq i lt.eq 9) { x_0 - x_i \, thin 1 - \( x_0 - x_i \) } > 0 . $

For small enough $tau$, require $\| log tau \| > 2 R$ and $delta_P \| log tau \| > R$.
  If $z_0 e^x$ and $z_0 e^(x')$, with $\| x \| \, \| x' \| < R$, represent the same point of $X_tau$, then

$ x' - x = a log tau + 2 pi upright(i) b wide \( a \, b in bb(Z) \) . $

The bounds on the real and imaginary parts force $a = b = 0$. Thus this disk maps injectively to $X_tau$.
  If a point of the disk represented a point of $P$, its real coordinate would satisfy

$ "Re" x = \( x_i - x_0 + a \) log tau wide upright("for some ") i upright(" and ") a in bb(Z) \, $

whose absolute value is at least $delta_P \| log tau \| > R$. Hence the disk avoids $P$.
  The covering-space frame trivializes $A$ there, and $v = e^y$ is injective for $\| y \| < R$.
  Thus (3.7) gives the common polydisk $\| x \| \, \| y \| < R$ around the marked point on $"Tot" \( A \)$.
  We continue to use the covering-space frames of Section 3.

#thm([Lemma 4.2.])[
  (Normalized theta sections).  #emph[Fix an integer $n > 0$, a real number $sigma$,
    and a complex number $epsilon.alt$ with $\| epsilon.alt \| = 1$.
    Put $U = sigma - x_0 n$ and assume $U in.not bb(Z)$. For each integer $K$ with $U < K < U + n$,
    there is a section $s_(K \, tau)$ of $D \( n \, epsilon.alt tau^sigma \)$ obtained from the Laurent recurrence
    (3.3) by setting the coefficient of $z^K$ equal to $tau^(- x_0 K)$ and all other residue classes modulo $n$
    equal to zero. These $n$ sections form a basis. In the local covering-space frame their expressions are
#[#set math.equation(numbering: n => "(4.2)")
 $ s_(K \, tau) \( z_0 e^x \) = sum_(p in bb(Z)) epsilon.alt^(- p) tau^(p \( K - U \) + n p \( p - 1 \) \/ 2)
   e^(\( K + n p \) x) arrow.r e^(K x) . $ <eq:normalized-theta>]

 The convergence is uniform on each compact subset of the complex $x$-plane,
   and the same is true after any fixed number of $x$-derivatives. Moreover,
$ Pi \( z_0 e^x \) arrow.r 1 $

 with the same uniform holomorphic and derivative convergence.]
] <lem:theta-limit>

#proof[
  Because $U in.not bb(Z)$, the interval $\( U \, U + n \)$ contains $n$ integers,
    one in each residue class modulo $n$. The chosen starting coefficients therefore give a basis by Lemma 7.
    The recurrence yields
  $ c_(K + n p) = tau^(- x_0 K) epsilon.alt^(- p) tau^(- sigma p + p K + n p \( p - 1 \) \/ 2) . $
  Substitution of $z = z_0 e^x = tau^(x_0) e^x$ gives the series in (4.2).
  Write $a = K - U in \( 0 \, n \)$ and $delta = min { a \, n - a } > 0$.
    For each integer $t gt.eq 1$, the exponent of $tau$ in the term with $p = t$ is
  $ t a + frac(n t \( t - 1 \), 2) \, $
  and in the term with $p = - t$ it is
  $ t \( n - a \) + frac(n t \( t - 1 \), 2) . $
  Both are at least $delta t$. Their quadratic growth gives normal convergence on compact $x$-disks for each fixed
    $tau$, permitting termwise differentiation. On $\| x \| lt.eq R'$,
    the contribution of all terms with $p eq.not 0$ to the derivative of order $c gt.eq 0$ has absolute value at most
  $ 2 e^(\| K \| R') sum_(t gt.eq 1) \( \| K \| + n t \)^c #scale(x: 120%, y: 120%)[\(] e^(n R') tau^delta
    #scale(x: 120%, y: 120%)[\)]^t . $
  For sufficiently small $tau$, the quantity in parentheses is at most $1 \/ 2$.
    The sum is then bounded by a constant, depending only on $R' \, c \, n \, K$, times $tau^delta$,
    and tends to zero. The $p = 0$ term is $e^(K x)$. This proves the asserted convergence of the sections and all
    fixed derivatives on any compact disk.
  For the product, put $a_i = x_0 - x_i in \( 0 \, 1 \)$. The factors of $Theta \( tau^(a_i) e^x \)$ differ from
    $1$ by terms whose total absolute value on $\| x \| lt.eq R'$ is at most
  $ e^(R') (sum_(p = 0)^oo tau^(p + a_i) + sum_(p = 1)^oo tau^(p - a_i)) =
    frac(e^(R'), 1 - tau) #scale(x: 120%, y: 120%)[\(] tau^(a_i) + tau^(1 - a_i) #scale(x: 120%, y: 120%)[\)] . $
  Summing over the nine indices gives a quantity $S_(R') \( tau \)$ tending to zero. The elementary product bound
  $ lr(|product_nu \( 1 + u_nu \) - 1|) lt.eq exp (sum_nu \| u_nu \|) - 1 $
  holds for an absolutely summable family by passage from finite products.
    It bounds $\| Pi \( z_0 e^x \) - 1 \|$ uniformly by $exp \( S_(R') \( tau \) \) - 1$.
    The product converges normally on compact disks for each $tau$, so its expressions are holomorphic.
    Applying the uniform bound on a slightly larger disk and then using Cauchy’s derivative estimates proves
    convergence of every fixed derivative on the original disk. ◻
]

=== 4.3 Bases for the polynomial spaces <bases-for-the-polynomial-spaces>

We now apply Lemma 10 to the actual coefficient spaces of $cal(W)_tau$. For $0 lt.eq j lt.eq m$, their bundle is

$ T ⊗ A^(m - j) = D #scale(x: 120%, y: 120%)[\(] h \, \( - 1 \)^(m - j)
  tau^(\( d - 3 m \) eta + \( m - j \) rho_(*)) #scale(x: 120%, y: 120%)[\)] . $

Since $eta - 3 x_0 = \( rho_(*) - Delta \) \/ 3$, its interval parameter is

$ U_j = h / 9 \( rho_(*) - Delta \) + \( m - j \) rho_(*) . $

For $m < j lt.eq u_0$ with $d - 3 j > 0$, the space in (3.1) is the image of the sections of

$ L^(d - 3 j) = D #scale(x: 120%, y: 120%)[\(] n_j \, tau^(\( d - 3 j \) eta) #scale(x: 120%, y: 120%)[\)] \, wide
  n_j = 3 \( d - 3 j \) = h - 9 \( j - m \) > 0 \, $

under multiplication by $Pi^(j - m)$. The interval parameter for this source bundle is

$ U_j = n_j / 9 \( rho_(*) - Delta \) . $

These parameters are irrational. Indeed, after substituting $rho_(*) = 3 \( sqrt(r) - 3 \)$,
  the coefficient of $sqrt(r)$ in either expression is the positive integer $d - 3 j$,
  and the remaining terms are rational because $Delta in bb(Q)$. In particular,

#[#set math.equation(numbering: n => "(4.3)")
 $ U_j in.not bb(Z) wide \( 0 lt.eq j lt.eq u_0 \, med d - 3 j > 0 \) . $ <eq:nonintegral>]

The finite exponent set is

#[#set math.equation(numbering: n => "(4.4)")
 $ cal(S) =  & union.big_(j = 0)^m {\( j \, K \) : K in bb(Z) \, quad U_j < K < U_j + h}\
 &  union union.big_(m < j lt.eq u_0\
d - 3 j > 0) {\( j \, K \) : K in bb(Z) \, quad U_j < K < U_j + n_j}\
 &  union {\( j \, 0 \) : m < j lt.eq u_0 \, quad d - 3 j = 0} \, wide n_j = h - 9 \( j - m \) . $ <eq:exponent-set>]

All indices $j$ in this definition are integers. The last set is empty unless $3$ divides $d$,
  and otherwise consists of the single pair $\( d \/ 3 \, 0 \)$. Because $d > 3 m$, that pair has $j > m$.

For a pair $\( j \, K \)$ in the first union, choose the normalized section from Lemma 10 in
  $H^0 \( B \, T ⊗ A^(m - j) \)$ as the coefficient of $v^j$.
  For a pair in the second union, choose the normalized section in $H^0 \( B \, L^(d - 3 j) \)$,
  multiply it by $Pi^(j - m)$, and use the result as the coefficient of $v^j$.
  For the last union, use $Pi^(j - m)$ as the coefficient of $v^j$:
  the source space is $H^0 \( B \, L^0 \) = bb(C)$, with basis the constant section $1$.
  Denote the resulting fiber polynomials by $E_(j \, K \, tau)$.

Each choice gives a basis of its coefficient block. For $j > m$, multiplication by $Pi^(j - m)$ is injective,
  since $Pi$ is nonzero on $B \\ P$, and its image is the block by definition.
  The different powers $v^j$ form a direct sum. Hence

$ { E_(j \, K \, tau) : \( j \, K \) in cal(S) } $

is a basis of $cal(W)_tau$ for every $tau in \( 0 \, 1 \)$.
  There are no duplicate pairs, and the index set is independent of $tau$.

The block dimensions also give the useful identity

$ \| cal(S) \| = dim cal(W)_tau = binom(d + 2, 2) - 9 binom(m + 1, 2) . $

To see this, sum the dimensions $3 \( d - 3 j \)$ of $H^0 \( B \, L^(d - 3 j) \)$ for $d -
  3 j > 0$ and add one when $3$ divides $d$. The result is $binom(d + 2, 2)$.
  For $j < m$, the coefficient condition in (2.3) reduces the block dimension by $9 \( m - j \)$;
  their sum is $9 binom(m + 1, 2)$.

In the common local chart, the scalar expressions of this basis satisfy

$ H_(E_(j \, K \, tau)) \( x \, y \) arrow.r e^(K x + j y) wide \( \( j \, K \) in cal(S) \) $

locally uniformly, together with all fixed mixed derivatives. For the first union this is (4.2) times $e^(j y)$.
  For the second union, the additional factor $Pi \( z_0 e^x \)^(j - m)$ tends to $1$ with all derivatives by
  Lemma 10; the exponent $j - m$ is fixed. The same product assertion proves the claim for the degree-zero case
  with $K = 0$. As $cal(S)$ is finite, all of these convergences can be taken on one fixed smaller polydisk and
  for the same sufficiently small values of $tau$.

=== 4.4 The limiting jet matrix <the-limiting-jet-matrix>

Evaluation of monomials in exponent pairs is a useful way to express interpolation rank.
  Dumnicki #cite(label("Dumnicki2007")) proof of Proposition 13 uses this principle to relate a one-point
  multiplicity matrix to polynomial evaluation on a diagram.
  Here the normalized theta sections produce the exponent pairs directly,
  with the derivative indices prescribed by the preceding collision.

#thm([Proposition 4.3.])[
  #emph[Choose fixed orderings of $cal(I)$ and $cal(S)$, and represent $J_tau$ in the basis $E_(j \, K \, tau)$ by
    the matrix $B_tau$. These matrices have one fixed size and converge entrywise as $tau arrow.r 0^(+)$ to the matrix
#[#set math.equation(numbering: n => "(4.5)")
 $ B_0 = #scale(x: 120%, y: 120%)[\(] K^ell j^b #scale(x: 120%, y: 120%)[\)]_(\( ell \, b \) in cal(I)\
\( j \, K \) in cal(S)) . $ <eq:limiting-matrix>]

 If $B_0$ has full column rank, then $J_tau$ is injective for all sufficiently small positive $tau$.]
] <prop:matrix-limit>

#proof[
  The basis construction gives $\| cal(S) \|$ columns for every $tau$, and the row set is the fixed set $cal(I)$.
    The mixed-derivative convergence just established gives
  $ \( B_tau \)_(\( ell \, b \) \, \( j \, K \)) = partial_x^ell partial_y^b
    H_(E_(j \, K \, tau)) \( x \, y \)\|_(\( 0 \, 0 \)) arrow.r K^ell j^b . $
  Zeroth derivatives contribute the factor $1$, also when $K = 0$ or $j = 0$. This is (4.5).
    If $B_0$ has full column rank, some minor of size $\| cal(S) \|$ has nonzero determinant.
    The corresponding determinant of $B_tau$ converges to it and is therefore nonzero for all sufficiently small
    positive $tau$. Thus $B_tau$ has full column rank, and its linear map $J_tau$ is injective. ◻
]

The factors $tau^(- x_0 K)$ may tend to zero or infinity,
  but for each $tau > 0$ they give invertible basis changes and preserve rank.
  Lemma 9 supplies a nonzero kernel separately for each fixed $tau$;
  Proposition 11 compares numerical matrices in the explicit bases.
  Thus no continuous choice of kernel vectors, or algebraic family of plane embeddings across $tau = 0$,
  is required. To contradict Lemma 9, it remains to prove full column rank of the corresponding limiting matrix
  for a sufficiently large common multiple of $\( d \, m \)$.

== 5 Interpolation on the exponent set <sec:interpolation>

We prove that the limiting matrix (4.5) has full column rank when the common multiplicity is sufficiently large at
  a fixed ratio $d \/ m$. The final assembly will achieve that size by taking a common power.
  The matrix columns are indexed by the finite exponent set $cal(S)$ of (4.4),
  and its rows are the restrictions to $cal(S)$ of the monomials

$ K^ell J^b \, wide 0 lt.eq b < m \, quad 0 lt.eq ell < q \( m - b \) \, $

where evaluation at $\( j \, K \)$ substitutes $J = j$. Thus full column rank means that their span interpolates
  every function on $cal(S)$. We first give a sufficient condition in terms of the distribution of horizontal row
  sizes. We then prove that condition by enclosing $cal(S)$ in a polygon and counting its horizontal slices.
  All parameters remain fixed as in Section 3; in particular, $q = r - 9$ and $h = m rho > 0$.

=== 5.1 Interpolation by horizontal rows <interpolation-by-horizontal-rows>

The interpolation procedure treats larger rows first and multiplies each correction by factors vanishing on all
  previously treated rows. The number of earlier rows controls the degree in $K$,
  while the current row size controls the degree in $J$. Their joint constraint explains why a bound on the
  largest row, or on the total number of points, would not suffice.

#thm([Lemma 5.1.])[
  (Interpolation by horizontal rows).  #emph[Let $q \, m$ be positive integers and $S subset
    bb(C)^2$ a finite set, with coordinates $\( j \, K \)$. For each represented height $K$,
    let $N_K$ be its row size. Suppose
$ N_K lt.eq m \, wide \# { K : N_K gt.eq t } lt.eq q \( m - t + 1 \) quad \( 1 lt.eq t lt.eq m \, med t in bb(Z) \) . $

 Then every function $S arrow.r bb(C)$ is the restriction of a polynomial in
$ cal(P)_(q \, m) = "span"_(bb(C)) { K^ell J^b : 0 lt.eq b < m \, quad 0 lt.eq
  ell < q \( m - b \) #scale(x: 120%, y: 120%)[}] subset bb(C) \[ J \, K \] . $

 Here evaluation at $\( j \, K \)$ substitutes $J = j$.]
] <lem:interpolation>

#proof[
  The empty set is immediate. Otherwise order the distinct heights as $K_1 \, dots.h \,
    K_s$ so that their sizes $N_1 \, dots.h \, N_s$ are nonincreasing.
    The first $i$ rows have size at least $N_i$, even when sizes are tied, and hence
  #[#set math.equation(numbering: n => "(5.1)")
   $ i lt.eq \# { K : N_K gt.eq N_i } lt.eq q \( m - N_i + 1 \) . $ <eq:ordered-row-bound>]
  Starting with the zero polynomial, match the prescribed values one row at a time. For row $i$, put
  $ Q_i \( K \) = product_(a = 1)^(i - 1) \( K - K_a \) \, $
  where the empty product is one. Since $Q_i \( K_i \) eq.not
    0$ and the $N_i$ first coordinates on this row are distinct,
    univariate interpolation gives a polynomial $p_i \( J \)$ of degree at most $N_i -
    1$ such that $Q_i \( K_i \) p_i \( j \)$ is the correction required at every point of row $i$.
    Adding $Q_i \( K \) p_i \( J \)$ matches that row and preserves all previous rows.
  Every monomial of this correction has $b lt.eq N_i - 1 < m$ and
  $ ell lt.eq i - 1 < q \( m - N_i + 1 \) lt.eq q \( m - b \) \, $
  by (5.1). Thus each correction belongs to $cal(P)_(q \, m)$, and their sum interpolates the prescribed values. ◻
]

For the exponent set $cal(S)$, it remains to prove the two row bounds in this lemma.
  We will obtain them by enclosing $cal(S)$ in a polygon and using its horizontal slice lengths to count the rows.

=== 5.2 An enclosing polygon <an-enclosing-polygon>

Write $a = rho_(*) = 3 \( sqrt(r) - 3 \) > 0$, and set

$ U_0 = h / 9 \( a - Delta \) + m a \, wide X = j / m \, wide Y = frac(K - U_0, m) . $

Thus $U_0$ is the lower endpoint of the exponent interval for $j = 0$.
  For $0 < lambda lt.eq 1$, and with $t_(+) = max { t \, 0 }$, define

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(D)_lambda = { \( X \, Y \) in bb(R)^2 : X gt.eq 0 \, quad - a X lt.eq Y lt.eq - a X + lambda a -
   9 \( X - lambda \)_(+) #scale(x: 120%, y: 120%)[}] . $ <eq:enclosing-polygon>]

By (3.5), we have $rho + Delta rho \/ 9 < a$. Choose $0 < lambda < 1$ sufficiently close to $1$ that

#[#set math.equation(numbering: n => "(5.3)")
 $ rho + frac(Delta rho, 9) < lambda a - 9 \( 1 - lambda \) . $ <eq:lambda>]

This choice depends only on $r$, the ratio $d \/ m$, and $Delta$.
  We will show that this inequality places $cal(S)$ inside $m cal(D)_lambda + \( 0 \, U_0 \)$.
  The horizontal widths of this scaled, translated polygon will be at most $m lambda < m$,
  and the heights supporting a slice of length at least $s$ will form an interval of length $q \( m lambda - s \)$
  for $0 lt.eq s lt.eq m lambda$.

#thm([Lemma 5.2.])[
  #emph[Every pair $\( j \, K \) in cal(S)$ satisfies
#[#set math.equation(numbering: n => "(5.4)")
 $ 0 & lt.eq X lt.eq 1 + rho \/ 9 \,\
- a X + Delta \( X - 1 \)_(+) & lt.eq Y lt.eq - a X + rho + \( Delta - 9 \) \( X - 1 \)_(+) . $ <eq:exponent-polygon>]

 The region in (5.4) is contained in $cal(D)_lambda$. Consequently,
   $cal(S) subset.eq m cal(D)_lambda + \( 0 \, U_0 \)$.]
] <lem:exponent-enclosure>

#proof[
  The index bound $j lt.eq floor.l d \/ 3 floor.r$ gives $X lt.eq d \/ \( 3 m \) = 1 + rho \/ 9$.
    For $j lt.eq m$, the exponent interval is
  $ U_0 - a j < K < U_0 - a j + h \, $
  which gives the first branches of the two bounds. For $j > m$ with $d - 3 j > 0$, its length is $n = h -
    9 \( j - m \)$ and its lower endpoint is $n \( a - Delta \) \/ 9$. The identities
  $ n / 9 \( a - Delta \) - U_0 = - a j + Delta \( j - m \) \, wide n = h - 9 \( j - m \) $
  give the second branches after division by $m$.
  If a degree-zero block occurs, its sole exponent is $\( j \, K \) = \( d \/ 3 \, 0 \)$, where $j = m + h \/ 9$. Hence
  $ X = 1 + rho \/ 9 \, wide Y = - a - rho / 9 \( a - Delta \) . $
  Both bounds in (5.4) equal this value, so the endpoint is included.
  For containment, the lower bound is at least $- a X$. If $X lt.eq 1$, then (5.3) gives
  $ lambda a - 9 \( X - lambda \)_(+) gt.eq lambda a - 9 \( 1 - lambda \) > rho . $
  If $1 lt.eq X lt.eq 1 + rho \/ 9$, subtracting the common term $- a X -
    9 \( X - 1 \)$ from the upper bounds reduces their comparison to
  $ rho + Delta \( X - 1 \) lt.eq rho + Delta rho \/ 9 < lambda a - 9 \( 1 - lambda \) \, $
  by (5.3). Thus the entire region, including its endpoint, lies in $cal(D)_lambda$. ◻
]

=== 5.3 Horizontal slices and integer rows <horizontal-slices-and-integer-rows>

The length of a bounded interval is the difference of its endpoints; a singleton has length zero.
  When a required length is zero, we still require the slice to be nonempty.

#thm([Lemma 5.3.])[
  (Horizontal slice profile).  #emph[We have $cal(D)_lambda = lambda cal(D)_1$.
    The nonempty horizontal slices of $cal(D)_1$ have lengths
$ w \( Y \) =
  cases(delim: "{", 1 - Y \/ a \, & 0 lt.eq Y lt.eq a \,, 1 + Y \/ #scale(x: 120%, y: 120%)[\(] a \( 1 + a \/ 9 \)
  #scale(x: 120%, y: 120%)[\)] \, & - a \( 1 + a \/ 9 \) lt.eq Y lt.eq 0 .) $

 Their maximum length is one. For $0 lt.eq s lt.eq m lambda$,
   the heights of nonempty slices of $m cal(D)_lambda + \( 0 \, U_0 \)$ of length at least $s$ form the closed interval
$ #scale(x: 120%, y: 120%)[\[] U_0 - a \( 1 + a \/ 9 \) \( m lambda - s \) \, thick U_0 +
  a \( m lambda - s \) #scale(x: 120%, y: 120%)[\]] \, $

 whose length is $q \( m lambda - s \)$.]
] <lem:slice-profile>

#proof[
  Scaling both coordinates by $lambda$ in (5.2) gives $cal(D)_lambda = lambda cal(D)_1$.
    The lower boundary of $cal(D)_1$ is $Y = - a X$ and its upper boundary is
  $ Y = cases(delim: "{", a \( 1 - X \) \, & 0 lt.eq X lt.eq 1 \,, \( a + 9 \) \( 1 - X \) \, & X gt.eq 1 .) $
  Thus its vertices are
  $ \( 0 \, 0 \) \, quad \( 0 \, a \) \, quad \( 1 \, 0 \) \, quad #scale(x: 120%, y: 120%)[\(] 1 + a \/ 9 \, -
    a \( 1 + a \/ 9 \) #scale(x: 120%, y: 120%)[\)] . $
  The slices are
  $ 0 lt.eq X lt.eq 1 - Y \/ a \, & 0 lt.eq Y lt.eq a \,\
- Y \/ a lt.eq X lt.eq 1 - Y \/ \( a + 9 \) \, & - a \( 1 + a \/ 9 \) lt.eq Y lt.eq 0 \, $
  and are empty at all other heights. Their lengths are the stated functions, since $1 + Y \/ a -
    Y \/ \( a + 9 \) = 1 + Y \/ #scale(x: 120%, y: 120%)[\(] a \( 1 + a \/ 9 \) #scale(x: 120%, y: 120%)[\)]$.
    Both attain their maximum one at $Y = 0$.
  Scale by $m lambda$ and translate vertically by $U_0$. Solving these two linear inequalities for length at least
    $s$ gives the claimed closed interval. Its length is
  $ \( 2 a + a^2 \/ 9 \) \( m lambda - s \) = q \( m lambda - s \) \, $
  because $a = 3 \( sqrt(r) - 3 \)$ implies $2 a + a^2 \/ 9 = r - 9 = q$.
    At $s = m lambda$ the interval is the single height $U_0$; at $s =
    0$ it is the full vertical range of the polygon. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.669, 2.47), [#text(size: 9pt)[\(a\) The polygon $cal(D)_1$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (0, 1.9), (2.65, 0), (3.533, -2.533), close: true, fill: rgb("#ededff"), stroke: none)
  line((-0.265, 0), (4.24, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((4.24, 0), [#text(size: 9pt)[$X$]], anchor: "west", padding: 0.1176cm)
  line((0, -2.85), (0, 2.28), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((0, 2.28), [#text(size: 9pt)[$Y$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (0, 1.9), (2.65, 0), (3.533, -2.533), close: true, stroke: (paint: rgb("#000073"), thickness: 0.8pt, cap: "round", join: "round"))
  content((0.795, 0.266), [#text(size: 9pt)[$cal(D)_1$]], anchor: "south-west", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1058cm)
  content((0, 1.9), [#text(size: 9pt)[$a$]], anchor: "east", padding: 0.1411cm)
  content((2.65, 0), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1411cm)
  line((0, -1.013), (1.413, -1.013), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((1.413, -1.013), (3.003, -1.013), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, cap: "round", join: "round"))
  circle((1.413, -1.013), radius: 0.07982, fill: rgb("#a60000"), stroke: none)
  circle((3.003, -1.013), radius: 0.07982, fill: rgb("#a60000"), stroke: none)
  content((0, -1.013), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$Y_-$]]], anchor: "east", padding: 0.1411cm)
  content((2.208, -1.013), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$s$]]], anchor: "south", padding: 0.1411cm)
  circle((3.533, -2.533), radius: 0.04939, fill: rgb("#000073"), stroke: none)
  content((2.862, -2.533), [#text(size: 9pt)[$ (1+a"/"9,-a(1+a"/"9) )$]], anchor: "north", padding: 0.1764cm)
  content((8.526, 2.465), [#text(size: 9pt)[\(b\) Heights with $w(Y) gt.eq s$]], anchor: "south", padding: 0.1176cm)
  line((6.257, -1.88), (8.75, 0.87), (10.62, -1.88), close: true, fill: rgb("#ededff"), stroke: none)
  line((7.753, -0.23), (8.75, 0.87), (9.498, -0.23), close: true, fill: rgb("#ffe0e0"), stroke: none)
  line((5.964, -1.88), (11.09, -1.88), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((11.09, -1.88), [#text(size: 9pt)[$Y$]], anchor: "west", padding: 0.1176cm)
  line((8.75, -2.1), (8.75, 1.31), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((8.75, 1.31), [#text(size: 9pt)[$w(Y)$]], anchor: "south", padding: 0.1176cm)
  line((6.257, -1.88), (8.75, 0.87), (10.62, -1.88), stroke: (paint: rgb("#000073"), thickness: 0.8pt, cap: "round", join: "round"))
  line((7.753, -1.88), (7.753, -0.23), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((9.498, -1.88), (9.498, -0.23), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((7.753, -0.23), (9.498, -0.23), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((7.753, -1.88), (9.498, -1.88), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, cap: "round", join: "round"))
  circle((7.753, -0.23), radius: 0.07982, fill: rgb("#a60000"), stroke: none)
  circle((9.498, -0.23), radius: 0.07982, fill: rgb("#a60000"), stroke: none)
  line((6.257, -1.819), (6.257, -1.94), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((10.62, -1.819), (10.62, -1.94), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((6.257, -1.88), [#text(size: 9pt)[$-a(1+a"/"9)$]], anchor: "north", padding: 0.1764cm)
  content((10.62, -1.88), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1764cm)
  content((8.75, -1.88), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1411cm)
  content((8.75, 0.87), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1411cm)
  content((7.753, -1.88), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$Y_-$]]], anchor: "north", padding: 0.1764cm)
  content((9.498, -1.88), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$Y_+$]]], anchor: "north", padding: 0.1764cm)
  content((7.753, -0.23), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$s$]]], anchor: "east", padding: 0.1411cm)
})],
  caption: [Figure 1: Slice widths and their superlevel interval for $cal(D)_1$, drawn schematically with $a = rho_(*)$ and $0 < s < 1$. In panel (a), the marked slice at $Y_(-) = - a \( 1 + a \/ 9 \) \( 1 - s \)$ has length $s$. In panel (b), slices of length at least $s$ occur exactly at heights from $Y_(-)$ to $Y_(+) = a \( 1 - s \)$, an interval of length $q \( 1 - s \)$. Scaling by $m lambda$ and translating by $\( 0 \, U_0 \)$ gives the polygon and height intervals used to bound the integer rows. ],
) <fig:slice-profile>

For each integer $K$, let

$ N_K = \# { j in bb(Z) : \( j \, K \) in cal(S) } . $

Only finitely many of these row sizes are nonzero. The slice profile in Figure 1 bounds both each row size and the
  number of rows of any given minimum size. The passage from lengths to integer counts adds at most one endpoint.
  We will absorb it with the size condition

#[#set math.equation(numbering: n => "(5.5)")
 $ q \( 1 - lambda \) m gt.eq 1 . $ <eq:scaling>]

#thm([Lemma 5.4.])[
  (Integer row counts).  #emph[If $q \( 1 - lambda \) m gt.eq 1$, then the exponent set satisfies
#[#set math.equation(numbering: n => "(5.6)")
 $ N_K & lt.eq m &  & \( K in bb(Z) \) \,\
\# { K in bb(Z) : N_K gt.eq t } & lt.eq q \( m - t + 1 \) &  & \( 1 lt.eq t lt.eq m \, med t in bb(Z) \) .
  $ <eq:row-count>]

]
] <lem:integer-rows>

#proof[
  By Lemmas 13 and 14, the integer positions in a represented row lie in an interval of length at most $m lambda <
    m$. Their span is at least $N_K - 1$, so integrality gives $N_K lt.eq m$, also for a singleton row.
  A row with $N_K gt.eq t$ requires a nonempty slice of length at least $t - 1$.
    If $t - 1 > m lambda$, there are no such rows. Otherwise their integer heights lie in a closed interval of
    length $q \( m lambda - t + 1 \)$. An interval of length $L gt.eq 0$ contains at most $floor.l L floor.r +
    1 lt.eq L + 1$ integers. Therefore
  $ \# { K in bb(Z) : N_K gt.eq t } & lt.eq q \( m lambda - t + 1 \) + 1\
 & = q \( m - t + 1 \) - q \( 1 - lambda \) m + 1\
 & lt.eq q \( m - t + 1 \) $
  by (5.5). The extra one accounts for integral endpoints, including when the height interval is a singleton. ◻
]

=== 5.4 Full rank and the strict inequality <full-rank-and-the-strict-inequality>

#thm([Proposition 5.5.])[
  #emph[If $q \( 1 - lambda \) m gt.eq 1$, then the limiting matrix $B_0$ of (4.5) has full column rank.
    Consequently, $J_tau$ is injective for all sufficiently small positive $tau$.]
] <prop:full-rank>

#proof[
  Apply Lemma 12 to $S = cal(S)$, using Lemma 15. The row vectors of $B_0$ are the restrictions to $cal(S)$ of the
    monomials spanning $cal(P)_(q \, m)$. They therefore span $bb(C)^(cal(S))$, so $B_0$ has rank $\# cal(S)$.
    Proposition 11 then gives the injectivity of $J_tau$ for sufficiently small $tau$. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] By Lemma 2, it suffices to exclude every universal system
    $sans(U)_r \( d \, m \)$ with $d \/ m lt.eq sqrt(r)$. Proposition 4 does so when $r$ is a square,
    including equality.
  For nonsquare $r$, the rational ratio $d \/ m$ is strictly below $sqrt(r)$, and Lemma 5 forces $d \/ m > 3$.
    Choose $Delta$ as in (3.5) and $lambda$ as in (5.3). By Lemma 2,
    replace $\( d \, m \)$ by a common positive integral multiple large enough to satisfy (5.5).
    The ratio $d \/ m$, and hence the choices of $rho$, $Delta$, and $lambda$, do not change.
    Apply all the preceding constructions to this one chosen pair.
    Then Proposition 6 and Lemma 9 give a nonzero kernel of $J_tau$ for every fixed $tau in \( 0 \, 1 \)$.
    Proposition 16 gives an injective $J_tau$ for all sufficiently small positive $tau$, a contradiction.
    The collision has been taken on each fixed curve before the matrix limit;
    no simultaneous choice of kernel vectors is needed.
  There are therefore no universal systems of the required slope.
    Lemma 2 supplies the single countable union $E_r$ and the strict inequality outside it,
    simultaneously for every positive degree and every nonnegative integral multiplicity vector.
    That reduction concerns all nonzero homogeneous forms, so the conclusion includes reducible and nonreduced
    effective curves. ◻
]

== 6 Fields and multipoint positivity <sec:consequences>

The analytic proof was carried out over $bb(C)$. Its conclusion extends by algebraic incidence conditions,
  without embedding another field into $bb(C)$. The implication from complex Nagata to the corresponding statement
  over uncountable algebraically closed characteristic-zero fields is also discussed by
  Bansal–Majumder #cite(label("BM2025")). We give the incidence argument with the simultaneous quantifiers needed here.

#thm([Corollary 6.1.])[
  #emph[Let $k$ be an uncountable algebraically closed field of characteristic zero, and let $r gt.eq 10$.
    There is a countable union of proper Zariski-closed subsets of the space of distinct ordered $r$-tuples in
    $bb(P)_k^2$, with nonempty complement, outside which the conclusion of Theorem 1 holds with the same degree
    and multiplicity conventions.]
] <cor:fields>

#proof[
  Let $A_(d \, upright(bold(m)))$ be the $bb(Q)$-defined incidence locus constructed in the proof of Lemma 2:
    its points are the tuples admitting a nonzero degree-$d$ form with multiplicities at least $upright(bold(m))$.
    On affine charts it is defined by the full-column-size minors of the Taylor-coefficient matrix.
    The same rational minors define its base change over any characteristic-zero field.
  Whenever $d sqrt(r) lt.eq sum_i m_i$, Theorem 1 shows that this locus is proper over $bb(C)$.
    It is therefore proper over $bb(Q)$ and remains proper over $k$:
    a nonzero defining minor on a rational affine chart stays nonzero after field extension.
    Exclude these loci for all the countably many violating pairs $\( d \, upright(bold(m)) \)$.
    Each tuple remaining satisfies every asserted inequality. The complement is nonempty:
    choose $2 r$ affine coordinates in $k$ algebraically independent over $bb(Q)$.
    They avoid all these proper rationally defined loci and all coincidences.
    Such coordinates exist by uncountability, since the algebraic closure in $k$ of a field generated over $bb(Q)$
    by finitely many elements is countable. ◻
]

Let $X$ be the blowup of the plane at a tuple covered by Theorem 1 or Corollary 17.
  Write $H$ for the pullback of a line and $E_1 \, dots.h \, E_r$ for the exceptional curves.
  A real divisor class is #emph[nef] if its intersection with every irreducible curve is nonnegative,
  and #emph[strictly nef] if every such intersection is positive.
  The multipoint Seshadri constant of the line bundle $cal(O)_(bb(P)^2) \( 1 \)$ at the tuple is

$ epsilon \( cal(O) \( 1 \) \; p_1 \, dots.h \, p_r \) = sup { t gt.eq 0 : H - t sum_i E_i upright(" is nef") } . $

#thm([Corollary 6.2.])[
  #emph[The class $N_r = sqrt(r) thin H - sum_i E_i$ is strictly nef and satisfies $N_r^2 = 0$. In particular,
$ epsilon \( cal(O) \( 1 \) \; p_1 \, dots.h \, p_r \) = 1 / sqrt(r) . $

]
] <cor:sesha>

#proof[
  Every irreducible curve on $X$ is either an exceptional curve or the strict transform of an irreducible plane
    curve. The first kind has intersection $1$ with $N_r$. For the second kind, the intersection is $d sqrt(r) -
    sum_i "mult"_(p_i) C > 0$. Thus $N_r$ is strictly nef. The intersection identities $H^2 = 1$, $H dot.op E_i =
    0$, and $E_i dot.op E_j = - delta_(i j)$ give $N_r^2 = 0$.
  The class $H - r^(- 1 \/ 2) sum_i E_i$ is nef, so the Seshadri constant is at least $r^(- 1 \/ 2)$.
    For the opposite bound, fix a positive integer $n$ and put $e_n = ceil.l sqrt(r) thin \( n + 1 \) ceil.r$.
    There are at most $r binom(n + 1, 2)$ linear conditions on degree-$e_n$ forms for multiplicity at least $n$ at
    all the points, whereas
  $ binom(e_n + 2, 2) > r binom(n + 1, 2) . $
  Thus a nonzero such form exists. If $H - t sum_i E_i$ is nef with $t gt.eq 0$,
    intersecting its class with the strict transform of this form’s divisor $D$ gives
  $ 0 lt.eq e_n - t sum_i "mult"_(p_i) D lt.eq e_n - t r n . $
  Hence $t lt.eq e_n \/ \( r n \)$, which tends to $1 \/ sqrt(r)$ as $n arrow.r oo$.
    This proves the upper bound using only the count of multiplicity conditions. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
