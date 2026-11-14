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

#align(center)[#text(size: 16pt, weight: "bold")[Maximal Multipoint Seshadri Constants \
in Higher Dimensions]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $X$ be a smooth integral complex projective variety of dimension $n gt.eq 3$,
  and let $L$ be an ample line bundle. Put $V = L^n$. For a tuple $upright(bold(p)) = \( p_1 \, dots.h \, p_r \)$
  of distinct points, the ordinary multipoint Seshadri constant is

#[#set math.equation(numbering: n => "(1.1)")
 $ epsilon \( X \, L \; upright(bold(p)) \) = inf_C frac(L dot.op C, sum_(i = 1)^r "mult"_(p_i) C) \,
   $ <eq:seshadri-definition>]

where $C$ ranges over integral curves meeting at least one of the marked points,
  and the multiplicity is zero at points outside $C$. This invariant measures the local positivity of $L$ at the
  entire tuple. Its universal upper bound is

#[#set math.equation(numbering: n => "(1.2)")
 $ epsilon \( X \, L \; upright(bold(p)) \) lt.eq \( V \/ r \)^(1 \/ n) . $ <eq:volume-bound>]

Equality means that no curve imposes a stronger constraint than the volume of $L$.

Write

$ U_r \( X \) = { \( p_1 \, dots.h \, p_r \) in X^r : p_i eq.not p_j upright(" when ") i eq.not j } . $

A property holds at #emph[very general] tuples if the exceptional tuples are contained in a countable union of
  proper Zariski-closed subsets of $U_r \( X \)$.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a smooth integral complex projective variety of dimension $n gt.eq 3$,
    and let $L$ be an ample line bundle on $X$. There is an integer $r_0 = r_0 \( X \, L \) gt.eq
    1$ such that for every integer $r gt.eq r_0$ there is a countable union $Z_r$ of proper Zariski-closed subsets
    of $U_r \( X \)$, with nonempty complement, for which
$ epsilon \( X \, L \; upright(bold(p)) \) = (L^n / r)^(1 \/ n) wide
  upright("for every ") upright(bold(p)) in U_r \( X \) \\ Z_r . $

]
] <thm:main>

Equivalently, on the blow-up $pi : Y arrow.r X$ at such a tuple, with exceptional divisors $E_1 \, dots.h \, E_r$,
  the real divisor class

$ pi^(*) L - \( V \/ r \)^(1 \/ n) sum_(i = 1)^r E_i $

is nef and has top self-intersection zero. Here nefness means nonnegative intersection with every integral curve.
  The threshold depends on the fixed polarized variety, but all integers beyond it are included.
  In particular, Theorem 1 asserts exact equality for each such point count,
  rather than convergence of a normalized constant as $r$ increases.

=== 1.1 Background and relation to earlier work <background-and-relation-to-earlier-work>

The plane problem originates in Nagata’s work on Hilbert’s fourteenth problem.
  He conjectured a lower bound on the degree of a plane curve in terms of its multiplicities at very general
  points, and proved the strict inequality when the number of points is a square at least $16$
  #cite(label("Nagata1959")). Multipoint Seshadri constants express the corresponding positivity question on an
  arbitrary polarized variety. The qualitative Nagata–Biran–Szemberg formulation asks for maximality at every
  sufficiently large point count. Roé and Ross state this formulation in arbitrary dimension and distinguish the
  ordinary curve-defined constant from its higher-cycle analogues #cite(label("RoeRoss2009")) Conjecture 1.3 and
  Remark 1.4. We use the ordinary constant throughout, even when $dim X > 2$.

Biran’s packing stability theorem supplies an important symplectic precedent:
  sufficiently many equal balls can fill a closed symplectic four-manifold with rational symplectic class with
  arbitrarily small volume deficit #cite(label("Biran1999")); see also #cite(label("Biran2001")) Theorem 6.3.
  The algebraic question fixes the complex variety and asks for a nef class on its point blow-ups,
  so symplectic packing stability is not by itself the required algebraic statement.
  In arbitrary dimension, Küchle obtained lower bounds for multipoint Seshadri constants that are asymptotically
  optimal as the number of points tends to infinity #cite(label("Kuechle1996")) Theorem 1.1.
  Biran’s product inequality, extended to higher-cycle constants by Roé–Ross,
  relates point counts on a variety to point counts on projective space #cite(label("RoeRoss2009")) Theorem 1.1
  and Remark 1.2. These results illuminate the volume scale in (1.2);
  an asymptotically optimal estimate alone does not imply eventual equality.

The companion paper #cite(label("OpenAI2026Surfaces")) establishes the qualitative surface statement by a nodal
  exponent bound, diagonal slice compression, and a primitive lattice direction tuned to the number of points.
  Its final tests are #emph[injective] jet evaluations on finite torus subgroups.
  We adapt the planar geometric mechanism to polynomial spaces in two variables and use #emph[surjective]
  full-dimensional jet evaluations instead. All arguments required for this adaptation are proved here;
  the surface maximality theorem is not an input.

The interpretation of positivity through asymptotic jet generation is classical;
  see Demailly #cite(label("Demailly1992")) Section 6. Our use of initial monomials belongs to the valuation
  approach to linear series initiated by Okounkov #cite(label("Okounkov1996")) and developed by Lazarsfeld–Mustaţă
  #cite(label("LazarsfeldMustata2009")) and Kaveh–Khovanskii #cite(label("KavehKhovanskii2012")).
  More directly, Ito compares multipoint jet separation with initial monomial spaces by separate finite-degree
  degenerations, without a finite-generation hypothesis #cite(label("Ito2013")) Proposition 5.7 and Theorem 5.8.
  Monomial diagrams and interpolation minors also underlie Dumnicki’s diagram-cutting method
  #cite(label("Dumnicki2007")) Proposition 13 and Theorem 14.
  We retain elementary proofs of the specific transfer and counting statements used below.

=== 1.2 Proof strategy and the two-coordinate construction <proof-strategy-and-the-two-coordinate-construction>

Separating jets through degree $m$ at a tuple means prescribing, independently at each point,
  all Taylor coefficients of total degree at most $m$, in local coordinates and line-bundle frames.
  If $H^0 \( X \, k L \)$ separates these jets, then

$ epsilon \( X \, L \; upright(bold(p)) \) gt.eq m / k \; $

the curve-intersection argument is given in Lemma 14. Thus, for $w = \( V \/ r \)^(1 \/ n)$,
  our interpolation target is jet separation through degree $floor.l k theta floor.r$ for every fixed $0 < theta <
  w$ and all sufficiently large $k$. We first construct a tuple for each such test and later obtain simultaneous
  tests at very general tuples.

The argument works with finite exponent sets $S_k subset bb(Z)^n$, one for each positive integer degree $k$, satisfying

$ S_k + S_l subset S_(k + l) . $

For a set $S$, its monomial space is the span of the Laurent monomials $z^alpha$ with $alpha in
  S$ on $\( bb(C)^(*) \)^n$. The multiplication condition will be as important as the geometry of the individual sets.

A complete-intersection flag on $X$ first supplies sets $S_k$ whose cardinalities are $h^0 \( X \, k L \)$.
  They lie in the dilates of a simplex

$ Delta \( a_1 \, dots.h \, a_n \) = {x in bb(R)_(gt.eq 0)^n : sum_(i = 1)^n x_i / a_i lt.eq 1} $

of volume $V \/ n !$. Jet surjectivity for the corresponding monomials can be transferred back to sections on $X$.

The main construction replaces any two intercepts $A \, B$ of the bounding simplex by $w \, A B \/ w$,
  for any sufficiently small positive real $w$. It preserves the number of exponents,
  the multiplication condition, and the implication from jet surjectivity after the replacement to jet
  surjectivity before it. The other exponent coordinates are carried along unchanged.
  The planar node bound and primitive-direction argument come from the surface method;
  the real-intercept replacement and its compatibility with these remaining coordinates allow the process to be
  iterated in higher dimensions.

For a fixed sufficiently large integer $r$, choose $w = \( V \/ r \)^(1 \/ n)$.
  Repeated replacements produce sets $F_k$ inside dilates of

$ P_(*) = Delta \( w \, dots.h \, w \, r w \) \, wide \# F_k = h^0 \( X \, k L \) \, wide F_k + F_l subset F_(k + l) . $

Because this simplex still has volume $V \/ n !$, only $o \( k^n \)$ of its degree-$k$ lattice points are missing.
  The multiplication condition upgrades this density statement:
  for each fixed compact set $K subset "int" P_(*)$, every lattice point of $k
  K$ belongs to $F_k$ for all sufficiently large $k$. Indeed,
  such a point has on the order of $k^n$ decompositions into two nearly equal degrees,
  whereas the holes can exclude only $o \( k^n \)$ of them.
  This short argument is a full-density version of the interior approximation results for semigroups
  #cite(label("KavehKhovanskii2012")) Theorem 1.6.

The long last intercept of $P_(*)$ permits explicit interpolation at $r$ points that differ only in their last
  coordinate. One-variable Hermite interpolation, applied to the coefficients of monomials in the other
  coordinates, gives arbitrary jets through degree $floor.l k theta floor.r$ for every fixed $0 < theta <
  w$ and all sufficiently large $k$. Transferring these tests to $X$,
  taking a countable intersection of nonempty Zariski-open loci,
  and then letting $theta$ increase to $w$ proves Theorem 1.

Section 2 establishes the monomial operations and their jet transfers,
  and Section 3 constructs the initial exponent sets on $X$. Section 4 proves the two-coordinate replacement.
  Section 5 establishes interior filling and interpolation, and Section 6 assembles the very-general conclusion.

== 2 Monomial spaces and finite jets <sec:transfers>

The proof will replace spaces of sections by monomial spaces and then change their exponent sets.
  Two properties must survive these changes: multiplication between different degrees,
  and the implication that interpolation for the new space yields interpolation for the old one.
  We establish these properties separately. Multiplication concerns the exact exponent sets in every degree;
  interpolation will be transferred by analytic limits at one fixed degree.

=== 2.1 Jets and graded exponent sets <jets-and-graded-exponent-sets>

Write $bb(T)^n = \( bb(C)^(*) \)^n$. For a finite set $S subset bb(Z)^n$, put

$ cal(M) \( S \) = "span"_(bb(C)) { x^alpha : alpha in S } \, wide x^alpha = x_1^(alpha_1) dots.h.c x_n^(alpha_n) . $

These Laurent polynomials are regular on $bb(T)^n$. If $A$ is a line bundle on a smooth complex variety $Y$,
  its jets through an integer degree $m gt.eq 0$ at $p in Y$ form the vector space

$ upright(J)_p^m \( A \) = A_p \/ frak(m)_p^(m + 1) A_p . $

Here $A_p$ denotes the stalk of the sheaf of sections. A space of sections $W$ #emph[separates jets through degree
  $m$] at distinct points $p_1 \, dots.h \, p_r$ if the evaluation map

$ W arrow.r xor.big_(i = 1)^r upright(J)_(p_i)^m \( A \) $

is surjective. For functions we use the trivial line bundle.
  Local frames and local coordinates change the matrices of these maps but not their ranks.
  Analytic and algebraic finite jets agree at a smooth complex point,
  since the corresponding local rings have the same completion.
  Our aim is to obtain such surjections for $W = H^0 \( X \, k L \)$ with $m \/ k$ approaching $\( V \/ r \)^(1 \/ n)$.

#prodef([Definition 2.1.])[
  A #emph[graded support family] in $bb(Z)^n$ is a sequence of finite sets $\( S_k \)_(k gt.eq 1)$ such that
  #[#set math.equation(numbering: n => "(2.1)")
   $ S_k + S_l subset S_(k + l) wide \( k \, l gt.eq 1 \) . $ <eq:graded-support>]
  Empty sets are allowed. Equivalently, $cal(M) \( S_k \) cal(M) \( S_l \) subset cal(M) \( S_(k + l) \)$,
    where a product of spaces denotes the span of their pairwise products.
] <def:graded-support>

We will say that an operation on monomial spaces #emph[transfers jet separation backward] if,
  for every fixed degree, number of points, and jet order, separation by the output space at some distinct torus
  tuple implies separation by the input space at some distinct torus tuple. The tuples need not be the same.
  A finite sequence of such operations has the same property.

=== 2.2 Least terms and analytic limits <least-terms-and-analytic-limits>

A monomial order on $bb(Z)_(gt.eq 0)^q$ will mean a total well-order preserved by addition.
  For a nonzero convergent power series $f$, let $nu \( f \)$ be the least exponent in its support for this order.

#thm([Lemma 2.2.])[
  (Least-term bases).  #emph[Let $W$ be a finite-dimensional space of convergent power series in $q$ variables,
    and fix a monomial order. The set
$ nu \( W \\ { 0 } \) $

 has cardinality $dim W$. There is a basis of $W$ whose least exponents are exactly this set,
   with each least coefficient equal to $1$. Moreover, $nu \( f g \) = nu \( f \) +
   nu \( g \)$ for nonzero convergent power series $f \, g$.]
] <lem:least-terms>

#proof[
  If $W eq.not 0$, choose the smallest exponent occurring as the least exponent of an element of $W$,
    and normalize one such element to have coefficient $1$ there.
    Continue in the kernel of that coefficient functional, which has codimension one.
    After $dim W$ steps this gives a basis with strictly increasing least exponents.
    In any nonzero linear combination, the first basis element with a nonzero coefficient determines the least
    term. This proves the assertion about the whole set of possible exponents.
  For the product assertion, write $a = nu \( f \)$ and $b = nu \( g \)$.
    Every exponent of $f$ is at least $a$, and every exponent of $g$ is at least $b$.
    Additivity of the order implies that any pair other than $\( a \, b \)$ has sum strictly greater than $a + b$.
    The coefficient of $x^(a + b)$ in the product is therefore the product of the two nonzero least coefficients. ◻
]

#thm([Lemma 2.3.])[
  (Least terms in labeled spaces).  #emph[Fix integers $1 lt.eq q lt.eq n$ and a monomial order in $q$ variables.
    For $k gt.eq 1$ and $gamma in bb(Z)^(n - q)$, let $W_(k \, gamma)$ be finite-dimensional spaces of convergent
    power series in those variables, with only finitely many nonzero spaces in each degree. Assume that
$ W_(k \, gamma) W_(l \, eta) subset W_(k + l \, gamma + eta)
  wide \( k \, l gt.eq 1 \; med gamma \, eta in bb(Z)^(n - q) \) . $

 Then
$ S'_k = { \( nu \( f \) \, gamma \) : 0 eq.not f in W_(k \, gamma) } $

 is a graded support family and $\# S'_k = sum_gamma dim W_(k \, gamma)$.]
] <lem:row-valuation>

#proof[
  The cardinality assertion follows from Lemma 3 in each label.
    Given two exponents in $S'_k$ and $S'_l$, choose functions witnessing them.
    Their nonzero product belongs to the summed degree and label,
    and its least exponent is the sum of the two least exponents.
    Expanding products of arbitrary linear combinations therefore gives $cal(M) \( S'_k \) cal(M) \( S'_l \)
    subset cal(M) \( S'_(k + l) \)$. The full new monomial spaces thus retain the multiplication property needed
    for the next operation; no simultaneous choice of lifts to earlier spaces is required. ◻
]

The finite-degree passage to initial monomials is a standard jet-degeneration principle;
  see #cite(label("Ito2013"), form: "prose") Proposition 5.7.
  The next two lemmas give the direct analytic form used here, including unchanged coordinate factors.
  The first is analytic; the second is finite-dimensional linear algebra.

#thm([Lemma 2.4.])[
  (Weighted limits with unchanged variables).  #emph[Let $1 lt.eq q lt.eq n$, and let $f_1 \, dots.h \,
    f_N$ be convergent power series near $0 in bb(C)^q$. Suppose that a vector $lambda in
    bb(R)_(> 0)^q$ makes a specified exponent $e_j$ the unique minimum of $lambda dot.op
    alpha$ on the support of $f_j$, and let $c_j eq.not 0$ be its coefficient.
    For any $gamma_j in bb(Z)^(n - q)$, as $s arrow.b 0$ the functions
#[#set math.equation(numbering: n => "(2.2)")
 $ c_j^(- 1) s^(- lambda dot.op e_j) f_j \( s^(lambda_1) Z_1 \, dots.h \, s^(lambda_q) Z_q \) U^(gamma_j) arrow.r
   Z^(e_j) U^(gamma_j) $ <eq:weighted-limit>]

 converge locally uniformly on $bb(C)^q times bb(T)^(n - q)$, with all derivatives of any fixed finite order.
   The assertion means that each fixed compact set is in the domain of the left-hand side for all sufficiently
   small $s > 0$. When $q = n$, the unchanged variable block is omitted.]
] <lem:weighted-limit>

#proof[
  First omit the unchanged factor $U^(gamma_j)$. On a bounded polydisc in $Z$,
    choose $s_0 > 0$ small enough that the power series converges absolutely on a slightly larger polydisc after
    scaling by $s_0^lambda$. In the normalized expansion every exponent $lambda
    dot.op \( alpha - e_j \)$ is nonnegative, and every exponent other than the least one is strictly positive.
    For $0 < s lt.eq s_0$, the terms are dominated by the summable series obtained at $s_0$.
    Dominated convergence gives locally uniform convergence to $Z^(e_j)$.
    Applying Cauchy’s estimates on slightly larger polydiscs gives convergence of derivatives.
    The unchanged Laurent monomials and their derivatives are holomorphic near every compact subset of the torus,
    so multiplying by them preserves these conclusions. ◻
]

#thm([Lemma 2.5.])[
  (Persistence of jet separation).  #emph[Fix a finite tuple of distinct points in a complex manifold and a jet
    order $m$. Suppose that finitely many holomorphic functions, depending on a positive parameter $s$,
    converge with their derivatives through order $m$ near that tuple.
    If the limiting functions separate those jets, then the functions for sufficiently small $s > 0$ do also.]
  #emph[The same conclusion applies to sections written in local frames.
    If the functions before the limit are pullbacks under a coordinate change sending the tuple to distinct
    points, their original functions separate jets at the image tuple.
    Multiplication of individual functions by nonzero constants does not affect this statement.]
] <lem:rank-transfer>

#proof[
  Choose coordinates and frames near the points. The entries of the jet matrix are the finitely many required
    Taylor coefficients. A maximal minor that is nonzero in the limit remains nonzero for small $s$.
    Coordinate changes and frame changes induce isomorphisms of truncated local rings or their rank-one modules.
    Rescaling an individual function rescales a matrix column by a nonzero constant. ◻
]

In particular, the unchanged variables in Lemma 5 cause no restriction on the jets being separated:
  all derivatives, including derivatives in those variables, enter the same convergent jet matrix.
  We shall apply the lemmas to finitely many spaces distinguished by a common exponent in the unchanged variables.

=== 2.3 Lattice changes and coordinate compression <lattice-changes-and-coordinate-compression>

We next record two operations directly on Laurent monomials.
  They will let us change the shape of an exponent set while retaining both properties above.

#thm([Lemma 2.6.])[
  (Unimodular changes).  #emph[Let $B in "GL"_n \( bb(Z) \)$.
    Replacing $S_k$ by $B S_k$ preserves cardinality and the graded support property.
    It preserves, in both directions, the existence of a distinct torus tuple at which the associated monomial
    space separates any prescribed finite jets.]
] <lem:unimodular>

#proof[
  The lattice map is bijective and additive. The torus automorphism
  $ phi.alt_B \( x \)_j = product_(i = 1)^n x_i^(B_(i j)) $
  has pullback $phi.alt_B^(*) \( x^alpha \) = x^(B alpha)$.
    Its inverse is the monomial map associated with $B^(- 1) in "GL"_n \( bb(Z) \)$,
    so the jet assertion follows by change of coordinates. ◻
]

For compression in the first coordinate, write an exponent as $\( a \, beta \)$ with $a in bb(Z)$ and $beta in
  bb(Z)^(n - 1)$. For a finite set $S$, define its row space at $beta$ by

$ W_beta \( S \) = "span"_(bb(C)) { z^a : \( a \, beta \) in S } \, $

and define the compressed exponent set by

#[#set math.equation(numbering: n => "(2.3)")
 $ cal(C)_1 \( S \) = { \( "ord"_(z = 1) f \, beta \) : 0 eq.not f in W_beta \( S \) } . $ <eq:coordinate-compression>]

All functions in a row are holomorphic near $z = 1$, even when their exponents are negative.
  Compression in another coordinate is defined by permuting coordinates.

#thm([Lemma 2.7.])[
  (Coordinate compression).  #emph[Coordinate compression preserves the cardinalities and the graded support
    property of a family $\( S_k \)$. It transfers jet separation backward.
    In a nonempty row with smallest and largest exponents $a_(-)$ and $a_(+)$,
    every compressed exponent lies in $\[ 0 \, a_(+) - a_(-) \]$.]
  #emph[Consequently, suppose that, after fixing all but two coordinates,
    the pair exponents lie in a scaled convex polygon $kappa Q$, where $kappa gt.eq 0$.
    Compression in one pair coordinate bounds the new pair exponents by the shape obtained by moving each interval
    slice parallel to that coordinate to start at zero, without changing its length.
    This shape operation commutes with scaling by $kappa$.]
] <lem:compression>

#proof[
  Use the coordinate $u = z - 1$ near $z = 1$. Lemma 3 identifies the possible orders in a row with a basis of
    distinct leading orders. If the input sets are graded, the product of two row spaces lies in the summed degree
    and remaining exponent. Lemma 4 therefore proves both cardinality preservation and the graded support property.
  Multiplying a nonzero row element by the unit $z^(- a_(-))$ gives a polynomial of degree at most $a_(+) -
    a_(-)$. Its order at $1$ is unchanged and cannot exceed that degree.
    This proves the row bound, including for Laurent exponents.
  For a fixed degree, choose in every nonempty row a basis with distinct orders and leading coefficients $1$ in
    $u$. Substitute $z = 1 + s Z$, normalize each basis element by $s$ to its order,
    and carry along the unchanged monomial in the other variables.
    Lemmas 5 and 6 apply to all rows simultaneously. At a fixed finite torus tuple,
    the substitution has nonzero values and is injective for sufficiently small $s > 0$.
    It gives a local coordinate change, so jet separation transfers to the original space at the image tuple.
  Finally, a row contained in an interval slice of $kappa Q$ has exponent span no greater than the length of that
    slice. Its compressed row is therefore contained in the interval beginning at zero with that length.
    For $kappa > 0$, slices and their lengths scale by $kappa$.
    When $kappa = 0$, the only possible pair exponent is zero and compression leaves it unchanged. ◻
]

When these operations act on a graded family, the support sets are defined by fixed exact orders and fixed lattice
  maps. The weights and small parameters used to transfer jets may nevertheless depend on the degree:
  they only establish finite-rank implications. The multiplication property in Lemma 4 holds independently of
  those analytic choices.

== 3 A simplex from a complete-intersection flag <sec:flag>

We now associate to $\( X \, L \)$ a graded support family with the same dimensions as the spaces of sections.
  Its exponent sets lie in a simplex whose volume is exactly the leading coefficient of the Hilbert polynomial.
  This equality of volumes will later ensure that changing the shape of the simplex loses no asymptotic supply of
  exponents.

Encoding sections by the least exponents associated with a flag is standard in the theory of Okounkov bodies; see,
  for example, #cite(label("LazarsfeldMustata2009"), form: "prose") Lemma 1.3.
  For our complete-intersection flag, the required bound follows directly from division by its defining sections
  and a degree calculation on the final curve.

For positive real numbers $a_1 \, dots.h \, a_n$, write

#[#set math.equation(numbering: n => "(3.1)")
 $ Delta \( a_1 \, dots.h \, a_n \) = {y in bb(R)_(gt.eq 0)^n : sum_(i = 1)^n y_i / a_i lt.eq
   1} . $ <eq:simplex-definition>]

Its Euclidean volume is $a_1 dots.h.c a_n \/ n !$.

#thm([Proposition 3.1.])[
  (The initial simplex).  #emph[Let $X$ be a smooth integral complex projective variety of dimension $n gt.eq 3$,
    let $L$ be ample, and put $V = L^n$. Choose a positive integer $D$ such that $D L$ is very ample.
    There is a graded support family $S_k subset bb(Z)_(gt.eq 0)^n$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ S_k & subset k P_0 \, & P_0 & = Delta \( 1 \/ D \, dots.h \, 1 \/ D \, D^(n - 1) V \) \,\
\# S_k & = h^0 \( X \, k L \) = frac(V, n !) k^n + O \( k^(n - 1) \) \, & "vol" \( P_0 \) & =
  frac(V, n !) . $ <eq:flag-simplex>]

 For all integers $k gt.eq 1$, $m gt.eq 0$, and $r gt.eq 1$,
   if $cal(M) \( S_k \)$ separates jets through degree $m$ at some distinct $r$-tuple in $bb(T)^n$,
   then $H^0 \( X \, k L \)$ does so at some distinct $r$-tuple in $X$.]
] <prop:flag-simplex>

#proof[
  Choose general sections $sigma_1 \, dots.h \, sigma_(n - 1)$ of $D
    L$ so that their successive zero loci form a smooth integral flag
  $ X = X_0 supset X_1 supset dots.h.c supset X_(n - 1) = C \, wide X_i = X_(i - 1) ∩ { sigma_i = 0 } . $
  Such a flag exists by Bertini’s theorem for very ample hyperplane sections.
    Choose $p in C$ and a local frame $e$ of $L$ near $p$. The functions $z_i = sigma_i \/ e^D$ for $1 lt.eq
    i < n$ have independent differentials at $p$; complete them by a function $z_n$ to local analytic coordinates
    centered at $p$.
  Represent every section of $k L$ by its germ in the frame $e^k$.
    These representations are compatible with products in different degrees.
    They are injective, since a section on an integral variety vanishing on an open germ vanishes identically.
    Order Taylor exponents lexicographically, starting with the exponent of $z_1$,
    and let $S_k$ be the set of possible least exponents of nonzero section germs. Lemma 3 gives
  $ \# S_k = h^0 \( X \, k L \) \, wide S_k + S_l subset S_(k + l) . $
  We next bound these exponents by global vanishing orders.
    Let $alpha = \( alpha_1 \, dots.h \, alpha_n \) in S_k$ be the least exponent of a section $s$. Put $s_0 = s$.
    For $1 lt.eq i < n$, suppose inductively that the residual section on $X_(i - 1)$ has least exponent
    $\( alpha_i \, dots.h \, alpha_n \)$. Its local order along $X_i$ is $alpha_i$.
    A restriction to the integral divisor $X_i$ that vanishes near $p$ vanishes identically.
    The Cartier divisor exact sequence therefore allows division by $sigma_i \|_(X_(i - 1))$,
    one factor at a time, exactly $alpha_i$ times. Define
  $ s_i = frac(s_(i - 1), \( sigma_i \|_(X_(i - 1)) \)^(alpha_i))\|_(X_i) in H^0
    (X_i \, (k - D sum_(j = 1)^i alpha_j) L \|_(X_i)) . $
  The exact local order ensures that $s_i$ is nonzero. Its germ is obtained by dividing by $z_i^(alpha_i)$ and
    setting $z_i = 0$, so its least exponent is $\( alpha_(i + 1) \, dots.h \, alpha_n \)$.
    This completes the induction. At $i = n - 1$ we obtain a nonzero section on $C$ of
  $ (k - D sum_(i = 1)^(n - 1) alpha_i) L \|_C . $
  Its vanishing order at $p$ is $alpha_n$. Since $deg \( L \|_C \) = D^(n - 1) V$,
    the degree bounds that order and yields
  $ alpha_n lt.eq (k - D sum_(i = 1)^(n - 1) alpha_i) D^(n - 1) V . $
  Equivalently,
  $ D sum_(i = 1)^(n - 1) alpha_i + frac(alpha_n, D^(n - 1) V) lt.eq k \, $
  which proves (3.2). The volume formula and the Hilbert polynomial asymptotic for an ample line bundle give (3.2).
  It remains to transfer jets from the least monomials to the sections. Fix $k$.
    If $S_k$ is empty, the asserted implication has a false premise and there is nothing to prove.
    Otherwise, choose a basis with distinct least exponents. A single positive weight vector exposes all these
    least terms, even though the series may have infinite support.
    Indeed, put $lambda_n = 1$ and choose the preceding weights recursively so that
  #[#set math.equation(numbering: n => "(3.3)")
   $ lambda_i > max_(alpha in S_k) sum_(j > i) lambda_j alpha_j wide \( 1 lt.eq i < n \) . $ <eq:lex-exposing-weights>]
  If $beta$ is lexicographically later than $alpha$ and $i$ is their first differing coordinate, then
  $ lambda dot.op \( beta - alpha \) gt.eq lambda_i - sum_(j > i) lambda_j alpha_j > 0 . $
  Here we used that all Taylor exponents are nonnegative.
  Now take a torus tuple at which $cal(M) \( S_k \)$ separates the specified jets.
    The substitution $z_i = s^(lambda_i) Z_i$ sends this tuple into the chosen coordinate chart for sufficiently
    small $s > 0$, without identifying any points. Lemma 5 gives the least monomials as limits of normalized
    section germs, and Lemma 6 gives jet separation by the original sections at the image tuple in $X$. ◻
]

The weights in the last paragraph may depend on $k$. In contrast, the flag, the local frame,
  and the lexicographic order are fixed once and for all. Thus Proposition 9 supplies a single graded family,
  together with the separate finite-degree interpolation implications needed to use it.

== 4 Reshaping two intercepts <sec:reshaping>

We now change two intercepts of a simplex while preserving its volume, the cardinality of every exponent set,
  and the graded inclusion. The replacement will also preserve the implication from monomial jet surjectivity back
  to the original spaces. The important freedom is that the new small intercept can be prescribed as a real
  number; the argument can therefore be iterated even when the preceding step has produced irrational intercepts.

The node, diagonal compression, and primitive-direction choice adapt the corresponding constructions of
  #cite(label("OpenAI2026Surfaces"), form: "prose") Propositions 3.2 and 3.4 and Lemma 4.3.
  Here they are applied directly to polynomial spaces in two variables,
  with the remaining exponents retained as labels. We give the argument in full.

#thm([Proposition 4.1.])[
  (Two-intercept reshaping).  #emph[Let $n gt.eq 2$, let $A \, B \, a_3 \, dots.h \,
    a_n$ be positive real numbers, and let $\( S_k \)_(k gt.eq 1)$ be finite exponent sets satisfying
$ S_k subset k Delta \( A \, B \, a_3 \, dots.h \, a_n \) ∩ bb(Z)^n \, wide S_k +
  S_l subset S_(k + l) quad \( k \, l gt.eq 1 \) . $

 Set $H = A B$ and $d = max \( 3 \/ A \, 2 \/ B \)$. For every real number $w > 0$ with $d w < 1 \/ 16$,
   there are finite sets $\( S'_k \)_(k gt.eq 1)$ such that
#[#set math.equation(numbering: n => "(4.1)")
 $ S'_k & subset k Delta \( w \, H \/ w \, a_3 \, dots.h \, a_n \) ∩ bb(Z)^n \,\
\# S'_k & = \# S_k \, wide S'_k + S'_l subset S'_(k + l) . $ <eq:reshape-bound>]

 Moreover, for every $k gt.eq 1$, $m gt.eq 0$, and $r gt.eq 1$,
   if $cal(M) \( S'_k \)$ surjects onto jets through degree $m$ at some $r$ distinct points of $bb(T)^n$,
   then $cal(M) \( S_k \)$ does so at some $r$ distinct points of $bb(T)^n$.]
] <prop:reshape>

#proof[
  Fix the target $w$. We first use a node to replace the triangular bound $Delta \( A \, B \)$ by a quadrilateral
    of the same area. A diagonal compression then produces a triangle with a variable shape.
    We choose that shape and a primitive lattice direction together so that two further compressions give exactly
    $Delta \( w \, H \/ w \)$.
  Throughout, write $gamma = \( gamma_3 \, dots.h \, gamma_n \)$ for an exponent in the unchanged coordinates.
    For a label occurring in degree $k$, the pair exponents with this label lie in
  #[#set math.equation(numbering: n => "(4.2)")
   $ kappa Delta \( A \, B \) \, wide kappa = k - sum_(i = 3)^n gamma_i / a_i gt.eq 0 . $ <eq:residual-degree>]
  For $n = 2$ the label is empty and $kappa = k$. Each operation below acts on these two-coordinate spaces,
    carrying the common monomial with exponent $gamma$ along unchanged.
    In particular, a planar bound by $kappa K$ will hold simultaneously for every label.
    If $kappa = 0$, the only possible pair exponent is zero and it stays zero throughout;
    hence the geometric calculations may be made with $kappa > 0$.
  ===== 4.1 The node and its exponent bound. <the-node-and-its-exponent-bound.>
  In pair variables $x \, y$, consider
  #[#set math.equation(numbering: n => "(4.3)")
   $ g \( x \, y \) = y^2 - x^2 \( 1 + x \) . $ <eq:node-polynomial>]
  This polynomial is irreducible, since $1 + x$ is not a square in $bb(C) \( x \)$. Its curve has the parametrization
  #[#set math.equation(numbering: n => "(4.4)")
   $ x = v^2 - 1 \, wide y = v \( v^2 - 1 \) \, $ <eq:node-parametrization>]
  which covers the part where $x eq.not 0$. Near the origin choose the analytic square root with value $1$ and set
  #[#set math.equation(numbering: n => "(4.5)")
   $ xi = y + x sqrt(1 + x) \, wide eta = y - x sqrt(1 + x) . $ <eq:node-coordinates>]
  These are local coordinates and $g = xi eta$.
  For now fix a real parameter $t > 0$, and order the Taylor exponents $\( alpha \, beta \)$ in $xi \,
    eta$ by lexicographic comparison of $\( alpha + t beta \, beta \)$, and denote the least exponent by $nu_t$.
    This is a multiplicative well-order: only finitely many nonnegative integer exponents have weight below any
    given bound. The node gives two controls on these exponents:
    its two branches bound the least weight after factors of $g$ have been removed,
    while each extracted factor translates the least exponent by $\( 1 \, 1 \)$.
  Let $f eq.not 0$ be supported in $kappa Delta \( A \, B \)$, and write $f = g^j f_0$, where $j gt.eq
    0$ and $g$ does not divide $f_0$. The weighted polynomial degree with weights $\( 1 \/ A \, 1 \/ B \)$ is
    additive on nonzero products, since highest-weight forms multiply nontrivially.
    As $g$ has weighted degree $d$, the weighted degree of $f_0$ is at most $kappa - j d$, which is nonnegative.
    Under (4.4), its restriction is a nonzero polynomial in $v$:
    otherwise $f_0$ would vanish on the irreducible curve $g = 0$. Define
  #[#set math.equation(numbering: n => "(4.6)")
   $ W = max \( 2 A \, 3 B \) = d H . $ <eq:normalization-degree-constant>]
  The monomial inequality
  $ 2 i + 3 i' lt.eq W (i / A + i' / B) $
  shows that the restriction polynomial has degree at most
  #[#set math.equation(numbering: n => "(4.7)")
   $ \( kappa - j d \) W . $ <eq:restriction-degree>]
  Let $mu$ be the weight of $nu_t \( f_0 \)$. At $v = 1$, the branch is $eta = 0$ and $xi$ vanishes simply.
    At $v = - 1$, the branch is $xi = 0$ and $eta$ vanishes simply.
    Indeed, the chosen square root becomes $v$ near $1$ and $- v$ near $- 1$,
    and the nonzero branch coordinate in either case is $2 v \( v^2 - 1 \)$.
    Every nonzero pure $xi$ term in $f_0$ has exponent at least $mu$,
    and every nonzero pure $eta$ term has exponent at least $mu \/ t$.
    The restriction polynomial therefore has orders at least $mu$ and $mu \/ t$ at these two distinct points.
    Comparing their sum with (4.7) gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ (1 + 1 / t) mu lt.eq \( kappa - j d \) W . $ <eq:two-branch-bound>]
  To express this bound as a triangle, define its intercepts
  #[#set math.equation(numbering: n => "(4.9)")
   $ a = frac(W t, 1 + t) \, wide b = frac(W, 1 + t) . $ <eq:node-intercepts>]
  For $nu_t \( f_0 \) = \( alpha \, beta \)$, inequality (4.8) is exactly $alpha \/ a + beta \/ b lt.eq kappa -
    j d$. Hence $nu_t \( f_0 \) in \( kappa - j d \) Delta \( a \, b \)$.
  The extracted factors account for the rest of the degree bound.
    Set $c = 1 \/ d$, so their contribution is $nu_t \( g^j \) = \( j \, j \) = j d \( c \, c \)$.
    The coefficients $kappa - j d$ and $j d$ sum to $kappa$, and therefore
  #[#set math.equation(numbering: n => "(4.10)")
   $ nu_t \( f \) & in \( kappa - j d \) Delta \( a \, b \) + j d { \( c \, c \) } subset kappa Q \,\
Q & = "conv" { \( 0 \, 0 \) \, \( a \, 0 \) \, \( c \, c \) \, \( 0 \, b \) } . $ <eq:node-envelope>]
  Thus the axis triangle comes from the two branch orders, and the diagonal point comes from powers of the node
    equation.
  From this point on, restrict the free parameter to $t > T$, where
  #[#set math.equation(numbering: n => "(4.11)")
   $ T = d^2 H = max \( 9 B \/ A \, 4 A \/ B \) gt.eq 6 . $ <eq:node-parameters>]
  The inequality
  $ c / a + c / b = frac(\( 1 + t \)^2, T t) > 1 $
  shows that $Q$ is a quadrilateral with the vertices in the stated order. Its area is
  #[#set math.equation(numbering: n => "(4.12)")
   $ "area" \( Q \) = frac(c \( a + b \), 2) = H / 2 . $ <eq:node-area>]
  The identity $W = d H$ is what makes this area equal to that of the input triangle $Delta \( A \, B \)$.
    The parameter $t$ remains free to change the shape of $Q$ for the later lattice-direction choice.
    For each label, replace its pair support by the possible values of $nu_t$ on its polynomial span.
    The product of the spaces in degrees $k \, l$ with labels $gamma \, gamma'$ lies in the space of degree $k +
    l$ with label $gamma + gamma'$, by the original support inclusion.
    Lemmas 3 and 4 preserve cardinality and the graded inclusion, and (4.10) supplies the bound $kappa Q$.
  We also need the jet implication for this change. At each fixed degree,
    choose a basis with distinct least exponents in each nonempty label space.
    One sufficiently small $e > 0$ makes weights $\( 1 \, t + e \)$ select all these least terms strictly.
    To see this, choose $M$ larger than all the selected $\( 1 \, t \)$-weights.
    Among the finitely many exponents of weight at most $M$, a small positive perturbation preserves strict
    comparisons and realizes the tie-break by the second exponent.
    Make $e$ smaller still so that all selected weights remain below $M$;
    exponents originally above $M$ cannot interfere, because a positive perturbation only increases their weights.
    Lemmas 5 and 6 apply under $\( xi \, eta \) = \( s X \, s^(t + e) Y \)$, with the other variables unchanged.
    Their inverse images are torus points. In fact, for each of the finitely many test points with $X \,
    Y eq.not 0$, one has $eta \/ xi arrow.r 0$, while
  $ x = frac(xi - eta, 2) + O #scale(x: 120%, y: 120%)[\(] \( xi - eta \)^2 #scale(x: 120%, y: 120%)[\)] \, wide
    y = frac(xi + eta, 2) . $
  Thus $x \, y eq.not 0$ for all sufficiently small positive $s$.
    The local coordinate map is injective on a common neighborhood,
    so it also preserves distinctness of the test points.
  ===== 4.2 From the quadrilateral to a triangle. <from-the-quadrilateral-to-a-triangle.>
  Apply the integral shear
  $ \( alpha \, beta \) mapsto \( alpha - beta \, beta \) $
  and then compress in the second coordinate. The transformed quadrilateral has vertices
    $\( 0 \, 0 \) \, \( a \, 0 \) \, \( 0 \, c \) \, \( - b \, b \)$.
    For first coordinate $q$ in $\[ - b \, 0 \]$, its lower boundary is $-
    q$ and its upper boundary is $c + \( c - b \) q \/ b$; their difference is $c \( 1 + q \/ b \)$.
    For $q in \[ 0 \, a \]$, the vertical slice length is $c \( 1 - q \/ a \)$. Compression therefore gives the triangle
  #[#set math.equation(numbering: n => "(4.13)")
   $ P = "conv" { \( - b \, 0 \) \, \( a \, 0 \) \, \( 0 \, c \) } \, wide "area" \( P \) = H /
     2 . $ <eq:compressed-triangle>]
  Figure 1 displays these slice lengths geometrically. Lemmas 7 and 8 show that the exponent sets remain graded,
    retain their cardinalities, admit backward jet transfer, and are bounded, label by label, by $kappa P$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1.232, 2.156), [#text(size: 9pt)[$Q$]])
  line((-0.176, 0), (2.948, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((0, -0.112), (0, 1.764), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((0, 0), (2.64, 0), (0.44, 1.4), (0, 1.05), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((2.64, 0), [#text(size: 9pt)[$(a,0)$]], anchor: "north", padding: 0.1176cm)
  content((0.44, 1.4), [#text(size: 9pt)[$(c,c)$]], anchor: "south-west", padding: 0.1176cm)
  content((0, 1.05), [#text(size: 9pt)[$(0,b)$]], anchor: "east", padding: 0.1176cm)
  line((0, 0.504), (0.2288, 1.232), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10))
  content((1.232, -0.588), [#text(size: 9pt)[diagonal slices]])
  content((5.838, 2.156), [#text(size: 9pt)[after the shear]])
  line((4.034, 0), (7.598, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((4.65, -0.112), (4.65, 1.764), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((4.65, 0), (7.29, 0), (4.65, 1.4), (4.32, 1.05), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.65, 0), [#text(size: 9pt)[$0$]], anchor: "north-west", padding: 0.1176cm)
  content((7.29, 0), [#text(size: 9pt)[$(a,0)$]], anchor: "north", padding: 0.1176cm)
  content((4.65, 1.4), [#text(size: 9pt)[$(0,c)$]], anchor: "south-west", padding: 0.1176cm)
  content((4.32, 1.05), [#text(size: 9pt)[$(-b,b)$]], anchor: "east", padding: 0.1176cm)
  line((4.492, 0.504), (4.492, 1.232), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10))
  content((5.838, -0.588), [#text(size: 9pt)[vertical slices]])
  content((10.49, 2.156), [#text(size: 9pt)[$P$]])
  line((8.684, 0), (12.25, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((9.3, -0.112), (9.3, 1.764), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((8.97, 0), (11.94, 0), (9.3, 1.4), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((8.97, 0), [#text(size: 9pt)[$(-b,0)$]], anchor: "north-east", padding: 0.1176cm)
  content((11.94, 0), [#text(size: 9pt)[$(a,0)$]], anchor: "north", padding: 0.1176cm)
  content((9.3, 1.4), [#text(size: 9pt)[$(0,c)$]], anchor: "south-west", padding: 0.1176cm)
  line((9.142, 0), (9.142, 0.728), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10))
  content((10.49, -0.588), [#text(size: 9pt)[slices moved to height $0$]])
  line((3.212, 0.644), (3.74, 0.644), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((7.832, 0.644), (8.36, 0.644), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
    caption: [Figure 1: Bounding polygons in the diagonal compression. The shear turns lines of direction $\( 1 \, 1 \)$ into vertical lines. Moving each vertical slice to start at height zero produces $P$; the marked slices correspond under these operations. These are continuous bounds: actual row exponents are replaced by possible vanishing orders, not translated point by point. All three polygons have area $H \/ 2$. Axis scales are chosen for legibility. ],
  ) <fig:node-compression>
  The area is now correct, but we have not yet obtained the prescribed intercept $w$.
    We choose a primitive integral direction whose transverse range is exactly $H \/ w$.
    In the resulting coordinates, the longest horizontal slice will have length $w$;
    compression will turn that length into the horizontal intercept.
  ===== 4.3 Choosing the primitive direction. <choosing-the-primitive-direction.>
  Put $R = H \/ w$ and $a_0 = W T \/ \( 1 + T \)$. As $t$ ranges over $\( T \, oo \)$,
    the intercept $a$ ranges over $\( a_0 \, W \)$. Choose $j$ to be the largest power of two not exceeding
  $ frac(R, 2 W) = frac(1, 2 d w) . $
  Then
  #[#set math.equation(numbering: n => "(4.14)")
   $ j > frac(1, 4 d w) > 4 \, wide R - j W gt.eq R / 2 > 0 . $ <eq:primitive-j>]
  The open interval
  #[#set math.equation(numbering: n => "(4.15)")
   $ #scale(x: 120%, y: 120%)[\(] d \( R - j W \) \, med d \( R - j a_0 \) #scale(x: 120%, y: 120%)[\)]
     $ <eq:primitive-interval>]
  has length
  $ frac(d j W, 1 + T) = frac(j T, 1 + T) > 2 . $
  It therefore contains an odd integer $i$. This is the point of choosing $j$ to be a power of two:
    the vector $u = \( i \, j \)$ is automatically primitive. Choose the unique $t > T$ for which
  #[#set math.equation(numbering: n => "(4.16)")
   $ a = frac(R - i \/ d, j) . $ <eq:tuned-intercept>]
  The interval (4.15) ensures that this value lies in $\( a_0 \, W \)$.
  At the three vertices $\( - b \, 0 \) \, \( a \, 0 \) \, \( 0 \, c \)$ of $P$,
    the functional $z mapsto det \( u \, z \)$ takes values $j b \, - j a \, i \/ d$, respectively.
    They are distinct and ordered as
  #[#set math.equation(numbering: n => "(4.17)")
   $ - j a < j b < i \/ d \, wide i \/ d - j b = R - j W > 0 . $ <eq:vertex-heights>]
  Their range is exactly $i \/ d + j a = R$. This choice used only inequalities between real numbers;
    in particular, no rationality of the intercepts was required.
    We now fix this $t$ and this primitive vector for all degrees.
  ===== 4.4 The two final compressions. <the-two-final-compressions.>
  Complete $u$ to an integral basis $\( u \, u' \)$ with determinant $1$,
    and use the coefficients in that basis as new exponent coordinates.
    The second coordinate of a vector $z$ is $det \( u \, z \)$.
    Thus the transformed triangle still has area $H \/ 2$, and its three vertex heights, say $q_0 < q_1 < q_2$,
    satisfy $q_2 - q_0 = R$.
  Its horizontal slice length is zero at $q_0$, increases linearly up to $q_1$,
    and decreases linearly to zero at $q_2$. If the maximum slice length is $h_max$,
    integration of this tent gives area $R h_max \/ 2$. Hence $h_max = H \/ R = w$.
    Compressing in the first coordinate therefore gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ "conv" { \( 0 \, q_0 \) \, \( w \, q_1 \) \, \( 0 \, q_2 \) } . $ <eq:tent-triangle>]
  Its vertical slice at first coordinate $h in \[ 0 \, w \]$ has length $R \( 1 - h \/ w \)$.
    A final compression in the second coordinate produces $Delta \( w \, R \)$, as illustrated in Figure 2.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1.32, 2.86), [#text(size: 9pt)[in the basis $(u,u')$]])
  line((0.88, 0), (2.64, 0.792), (0.352, 2.112), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-0.088, 0), (0.88, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.088, 0.792), (0.682, 0.792), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.088, 2.112), (0.352, 2.112), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.088, 0), [#text(size: 9pt)[$q_0$]], anchor: "east", padding: 0.1176cm)
  content((-0.088, 0.792), [#text(size: 9pt)[$q_1$]], anchor: "east", padding: 0.1176cm)
  content((-0.088, 2.112), [#text(size: 9pt)[$q_2$]], anchor: "east", padding: 0.1176cm)
  line((0.682, 0.792), (2.64, 0.792), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10))
  content((1.672, 0.792), [#text(size: 9pt)[$w$]], anchor: "south", padding: 0.1176cm)
  content((1.32, -0.5456), [#text(size: 9pt)[height range $R$]])
  content((5.838, 2.86), [#text(size: 9pt)[horizontal compression]])
  line((4.65, -0.1056), (4.65, 2.42), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((4.65, 0), (6.608, 0.792), (4.65, 2.112), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.65, 0), [#text(size: 9pt)[$q_0$]], anchor: "east", padding: 0.1176cm)
  content((4.65, 0.792), [#text(size: 9pt)[$q_1$]], anchor: "east", padding: 0.1176cm)
  content((4.65, 2.112), [#text(size: 9pt)[$q_2$]], anchor: "east", padding: 0.1176cm)
  line((4.65, 0.792), (6.608, 0.792), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10))
  content((6.608, 0.792), [#text(size: 9pt)[$(w,q_1)$]], anchor: "west", padding: 0.1176cm)
  line((5.398, 0.3027), (5.398, 1.608), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((5.838, -0.5456), [#text(size: 9pt)[maximum slice length $w$]])
  content((10.53, 2.86), [#text(size: 9pt)[vertical compression]])
  line((9.194, 0), (11.63, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((9.3, -0.1056), (9.3, 2.42), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((9.3, 0), (11.26, 0), (9.3, 2.112), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((9.3, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((11.26, 0), [#text(size: 9pt)[$w$]], anchor: "north", padding: 0.1176cm)
  content((9.3, 2.112), [#text(size: 9pt)[$R$]], anchor: "east", padding: 0.1176cm)
  line((10.05, 0), (10.05, 1.305), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10))
  content((10.53, -0.5456), [#text(size: 9pt)[$Delta (w,R)$]])
  line((3.124, 1.452), (3.652, 1.452), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((7.7, 1.452), (8.228, 1.452), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
    caption: [Figure 2: The primitive direction is chosen so that the transverse height range is $R = H \/ w$. Since the area is $H \/ 2$, the longest horizontal slice has length $w$. Horizontal compression aligns the left endpoints of these slices. Vertical compression then gives the right triangle with intercepts $w$ and $R$. The middle and right panels mark vertical slices of equal length; the drawing is schematic. ],
  ) <fig:final-compressions>
  All these changes satisfy Lemmas 7 and 8. They commute with scaling of the bounding shapes,
    so for the label $gamma$ the final pair exponents lie in $kappa Delta \( w \, R \)$.
    Substituting (4.2) gives (4.1). Cardinality, the graded inclusion,
    and the backward jet implication hold at every stage, proving all the assertions.
  For clarity, the sets in every degree are defined by the fixed exact order $nu_t$, the fixed integral maps,
    and exact orders of vanishing at $1$. The perturbation $e$ and the small scaling parameters only witness
    jet-rank implications at a specified degree. They may depend on that degree and on the test tuple without
    changing the sets or their graded inclusion. ◻
]

== 5 Interior lattice points and interpolation <sec:saturation>

The reshaping proposition preserves the number of monomials, but does not describe each resulting exponent.
  For interpolation we need more than the correct asymptotic number: we need specific sets of exponents.
  Additivity across degrees supplies the missing information.
  An additive family $F_k$ occupying asymptotically the full volume of $k P$ contains every lattice point of $k
  K$ for each fixed compact set $K subset "int" P$, once the degree $k$ is sufficiently large.

The general semigroup approximation theorem of #cite(label("KavehKhovanskii2012"), form: "prose") Theorem 1.6
  provides a broader setting for interior-saturation statements.
  Under the full-density hypothesis needed here, the following direct proof uses only decompositions into two summands.

#thm([Lemma 5.1.])[
  (Interior saturation).  #emph[Let $n gt.eq 1$ be an integer,
    let $P subset bb(R)^n$ be a compact convex set with nonempty interior,
    and let $F_k subset k P ∩ bb(Z)^n$ for every integer $k gt.eq 1$. Suppose that
$ F_k + F_l subset F_(k + l) quad \( k \, l gt.eq 1 \) \, wide \# F_k = "vol" \( P \) k^n + o \( k^n \) . $

 For every compact set $K subset "int" P$, there is an integer $k_K$ such that
$ k K ∩ bb(Z)^n subset F_k wide \( k gt.eq k_K \) . $

]
] <lem:interior-saturation>

#proof[
  The lattice-point estimate for a full-dimensional compact convex set gives
  $ \# \( k P ∩ bb(Z)^n \) = "vol" \( P \) k^n + o \( k^n \) . $
  Consequently the sets of missing exponents
  $ H_k = \( k P ∩ bb(Z)^n \) \\ F_k $
  satisfy $\# H_k = o \( k^n \)$. This estimate alone would allow individual missing points deep inside $k P$.
    We use additivity to exclude them.
  We may assume that $K$ is nonempty. Choose $delta > 0$ so that every closed ball of radius $delta$ centered in
    $K$ is contained in $P$. For a large integer $k$, put $k_1 = floor.l k \/ 2 floor.r$ and $k_2 = k - k_1$,
    and fix $y in k K ∩ bb(Z)^n$. Write $z = y \/ k$. Every integer vector $y_1$ satisfying
  $ lr(bar.v.double y_1 - k_1 z bar.v.double) lt.eq delta min \( k_1 \, k_2 \) $
  gives a decomposition $y = y_1 + y_2$ with $y_i in k_i P ∩ bb(Z)^n$.
    Indeed, both $y_1 \/ k_1$ and $y_2 \/ k_2$ are within distance $delta$ of $z$.
    The ball in this display contains at least $c k^n$ lattice points for all sufficiently large $k$,
    where $c > 0$ is independent of $y$.
  At most $\# H_(k_1)$ choices have $y_1 in.not F_(k_1)$, and at most $\# H_(k_2)$ choices have $y_2 in.not
    F_(k_2)$, because $y_1 mapsto y - y_1$ is injective. The total number excluded is $o \( k^n \)$.
    Thus some decomposition has $y_i in F_(k_i)$, and additivity gives $y in F_k$.
    All constants and degree thresholds used here are uniform over $y in k K ∩ bb(Z)^n$. ◻
]

The lemma requires no finite-generation hypothesis on the sets $F_k$ or on the semigroup they form.
  It also permits real, rather than rational, bounding polytopes.
  We next describe the exponents needed for interpolation in the simplex that will result from repeated reshaping.

#thm([Lemma 5.2.])[
  (Interpolation in an elongated simplex).  #emph[Let $n gt.eq 2$, $r gt.eq 1$, and $m gt.eq 0$ be integers,
    and let $c_1 \, dots.h \, c_r in bb(C)^(*)$ be distinct. Put
$ E_(r \, m) = {\( beta \, b \) in bb(Z)_(gt.eq 0)^(n - 1) times bb(Z)_(gt.eq 0) : \| beta \| + b / r < m + 1} . $

 Then $cal(M) \( E_(r \, m) \)$ surjects onto jets through degree $m$ at the points
$ q_i = \( 1 \, dots.h \, 1 \, c_i \) in bb(T)^n \, wide 1 lt.eq i lt.eq r . $

]
] <lem:simplex-interpolation>

#proof[
  Write the coordinates as $\( x' \, Y \)$, with $n - 1$ coordinates in $x'$.
    At $q_i$, an arbitrary jet through degree $m$ has a unique expression
  $ sum_(\| alpha \| lt.eq m) \( x' - 1 \)^alpha h_(i \, alpha) \( Y - c_i \) \, wide deg h_(i \, alpha) lt.eq
    m - \| alpha \| . $
  For each $alpha$, the Chinese remainder theorem provides a polynomial $f_alpha \( Y \)$ such that
  $ f_alpha \( Y \) & equiv h_(i \, alpha) \( Y - c_i \) med \( mod med \( Y - c_i \)^(m + 1 - \| alpha \|) \)
    quad \( 1 lt.eq i lt.eq r \) \,\
deg f_alpha & < r \( m + 1 - \| alpha \| \) . $
  The polynomial
  $ f \( x' \, Y \) = sum_(\| alpha \| lt.eq m) \( x' - 1 \)^alpha f_alpha \( Y \) $
  has all the prescribed jets. Every monomial $\( x' \)^beta Y^b$ occurring in its $alpha$-summand satisfies $beta
    lt.eq alpha$ componentwise and hence
  $ \| beta \| + b / r lt.eq \| alpha \| + b / r < \| alpha \| + \( m + 1 - \| alpha \| \) = m + 1 . $
  Thus $f in cal(M) \( E_(r \, m) \)$. ◻
]

The two lemmas now convert asymptotically full additive supports into simultaneous jet surjectivity.
  Translating a slightly smaller simplex into the interior avoids any assertion about exponents on the boundary.

#thm([Proposition 5.3.])[
  (Jets from full-volume supports).  #emph[Let $n gt.eq 2$ and $r gt.eq 1$ be integers, let $w > 0$, and set
$ P = Delta \( w \, dots.h \, w \, r w \) . $

 Suppose that finite sets $F_k subset k P ∩ bb(Z)^n$, indexed by all integers $k gt.eq 1$, satisfy
$ F_k + F_l subset F_(k + l) \, wide \# F_k = "vol" \( P \) k^n + o \( k^n \) . $

 For every $0 < theta < w$ and every choice of distinct $c_1 \, dots.h \, c_r in bb(C)^(*)$,
   the space $cal(M) \( F_k \)$ surjects onto jets through degree $floor.l k theta
   floor.r$ at $\( 1 \, dots.h \, 1 \, c_i \)$ for all sufficiently large $k$.]
] <prop:asymptotic-jets>

#proof[
  Choose $theta \/ w < lambda < 1$. There is a vector $a$ with strictly positive coordinates such that $a +
    lambda P subset "int" P$: it suffices to require
  $ frac(a_1 + dots.h.c + a_(n - 1), w) + frac(a_n, r w) < 1 - lambda . $
  Choose $a_k in k^(- 1) bb(Z)^n$ with $a_k arrow.r a$. For all sufficiently large $k$,
    the translated simplices $a_k + lambda P$ lie in a single compact subset $K$ of $"int" P$. Lemma 11 therefore gives
  $ k a_k + \( k lambda P ∩ bb(Z)^n \) subset F_k . $
  Consequently $cal(M) \( F_k \)$ contains the monomial space for $k lambda P ∩ bb(Z)^n$,
    multiplied by the monomial with exponent $k a_k$. Multiplication by this monomial is an isomorphism on each
    jet algebra at a torus point, since the monomial is a unit there.
  Put $m = floor.l k theta floor.r$. For all sufficiently large $k$, $m + 1 lt.eq k lambda w$, and hence
  $ E_(r \, m) subset k lambda P ∩ bb(Z)^n . $
  Lemma 12 supplies jet surjectivity for this subspace. The monomial translation preserves surjectivity and proves
    the claim. ◻
]

== 6 Proof of the main theorem <sec:conclusion>

We now assemble the exponent construction and interpolation results.
  The reshaping parameters will depend on the point count $r$,
  but a single threshold will allow every sufficiently large integer $r$.
  The final passage from jets to intersection numbers uses ordinary curve multiplicities,
  including at singular points of the curves.

=== 6.1 The exponent sets for every sufficiently large point count <the-exponent-sets-for-every-sufficiently-large-point-count>

Fix the polarized variety $\( X \, L \)$ of Theorem 1, and write $V = L^n$.
  Choose an integer $D > 0$ for which $D L$ is very ample. Proposition 9 supplies additive support sets $S_k$ with

$ S_k subset k P_0 ∩ bb(Z)^n \, wide \# S_k = h^0 \( X \, k L \) . $

Here $P_0 = Delta \( 1 \/ D \, dots.h \, 1 \/ D \, D^(n - 1) V \)$.
  Let $ell > 0$ be the smallest intercept of $P_0$. Choose an integer $r_0$ such that

#[#set math.equation(numbering: n => "(6.1)")
 $ \( V \/ r \)^(1 \/ n) < ell \/ 100 wide \( r gt.eq r_0 \) . $ <eq:threshold>]

Such a choice exists because $X$ and $L$ are fixed.

Fix any integer $r gt.eq r_0$, and put $w = \( V \/ r \)^(1 \/ n)$.
  Apply Proposition 10 to the first two intercepts, replacing them by $w$ and their product divided by $w$.
  Keep the intercept $w$ fixed, and pair the other new intercept with the next untouched one.
  Continue until $n - 1$ intercepts equal $w$.

Every pair of input intercepts $A \, B$ in this procedure satisfies $A \, B gt.eq ell$.
  Indeed, an untouched intercept has this property, and the new carried intercept $A B \/ w$ is greater than $A$,
  since $B gt.eq ell > w$. Thus the hypothesis of Proposition 10 holds at every step:

$ w max \( 3 \/ A \, 2 \/ B \) lt.eq frac(3 w, ell) < 1 / 16 . $

The product of all intercepts remains $V$. We obtain finite sets $F_k$ in

#[#set math.equation(numbering: n => "(6.2)")
 $ k P_(*) \, wide P_(*) = Delta \( w \, dots.h \, w \, V \/ w^(n - 1) \) = Delta \( w \, dots.h \, w \, r w \) \,
   $ <eq:final-simplex>]

with

$ F_k + F_l subset F_(k + l) \, wide \# F_k = h^0 \( X \, k L \) = frac(V, n !) k^n + o \( k^n \) . $

Since $"vol" \( P_(*) \) = V \/ n !$, these sets satisfy the hypotheses of Proposition 13.

For each $0 < theta < w$ and all sufficiently large $k$, that proposition gives simultaneous jets through degree
  $floor.l k theta floor.r$ for $cal(M) \( F_k \)$ at an $r$-tuple of distinct torus points.
  Each application of Proposition 10 transfers this surjectivity to the preceding support set.
  Proposition 9 finally transfers it to $H^0 \( X \, k L \)$ at some tuple of distinct points of $X$.
  In particular, for every such $theta$ and $k$, the set

#[#set math.equation(numbering: n => "(6.3)")
 $ {upright(bold(p)) in U_r \( X \) : H^0 \( X \, k L \) arrow.r
   xor.big_(i = 1)^r upright(J)_(p_i)^(floor.l k theta floor.r) \( k L \) upright(" is surjective")}
   $ <eq:surjectivity-locus>]

is nonempty. The tuple witnessing this assertion may depend on both $theta$ and $k$.

=== 6.2 A common very-general locus <a-common-very-general-locus>

For fixed integers $k gt.eq 1$ and $m gt.eq 0$, the locus of tuples at which $H^0 \( X \, k L \)$ surjects onto
  jets through degree $m$ is Zariski open in $U_r \( X \)$.
  Indeed, the bundle of principal parts of order $m$ of $k L$ is locally free because $X$ is smooth.
  Pulling it back along each coordinate projection of $U_r \( X \)$ gives an algebraic vector-bundle map

$ H^0 \( X \, k L \) ⊗ cal(O)_(U_r \( X \)) arrow.r xor.big_(i = 1)^r "pr"_i^(*) cal(P)^m \( k L \) . $

Its surjectivity locus is defined by the nonvanishing of maximal minors.

Choose $0 < theta_j < w$ with $theta_j arrow.t w$. For each $j$,
  choose $k_j$ so that the locus in (6.3) is nonempty and $floor.l k theta_j floor.r gt.eq 1$ for every $k gt.eq
  k_j$. Denote this open locus by $O_(j \, k)$ and set

#[#set math.equation(numbering: n => "(6.4)")
 $ Z_r = union.big_(j gt.eq 1) med union.big_(k gt.eq k_j) #scale(x: 120%, y: 120%)[\(] U_r \( X \) \\ O_(j \, k)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:exceptional-set>]

Every set in this countable union is a proper Zariski-closed subset of $U_r \( X \)$.

The complement is nonempty. The complex points of $U_r \( X \)$ form a nonempty locally compact Hausdorff space,
  and hence a Baire space. Since $U_r \( X \)$ is smooth and irreducible,
  every proper algebraic closed subset has empty interior in its complex topology.
  A countable union of these closed subsets cannot cover $U_r \( X \)$.
  Thus every tuple outside $Z_r$ simultaneously has all the jet-surjectivity properties indexed by $j$ and $k
  gt.eq k_j$.

=== 6.3 From jets to ordinary curve multiplicities <from-jets-to-ordinary-curve-multiplicities>

The relation between Seshadri constants and jet separation appears in Demailly’s one-point formulation
  #cite(label("Demailly1992")) Section 6 and in the weighted multipoint framework of
  #cite(label("Ito2013"), form: "prose") Section 5. The following elementary implication is the one needed here.
  We give its local proof, including at singular points of the curves.

#thm([Lemma 6.1.])[
  (Jets bound curve intersections).  #emph[Let $X$ be a smooth complex projective variety,
    let $A$ be a line bundle on $X$, and let $p_1 \, dots.h \, p_r$ be distinct points.
    Suppose that, for an integer $m gt.eq 1$, the map
$ H^0 \( X \, A \) arrow.r xor.big_(i = 1)^r upright(J)_(p_i)^m \( A \) $

 is surjective. Then every integral curve $C subset X$ satisfies
$ A dot.op C gt.eq m sum_(i = 1)^r "mult"_(p_i) C $

 provided that $C$ meets at least one of the points.]
] <lem:jets-curves>

#proof[
  Choose a point $p_i in C$. The local ring $R = cal(O)_(C \, p_i)$ is a one-dimensional Noetherian local domain.
    Its maximal ideal $frak(m)_R$ satisfies
  $ frak(m)_R^m \/ frak(m)_R^(m + 1) eq.not 0 . $
  Otherwise Nakayama’s lemma would give $frak(m)_R^m = 0$, contrary to $dim R = 1$.
    The quotient map from the ambient local ring to $R$ lifts a nonzero element of this quotient to a jet on $X$
    with no terms of degree less than $m$. Prescribe this jet at $p_i$ and the zero jet at every other marked
    point. By surjectivity, a section $s in H^0 \( X \, A \)$ has these jets.
    It vanishes to order at least $m$ at every marked point, and its restriction to $C$ is nonzero.
  We recall the local intersection bound for this restriction.
    In a one-dimensional Noetherian local domain $\( R \, frak(m)_R \)$, let $0 eq.not f in frak(m)_R^m$.
    For every integer $q gt.eq 1$, multiplication by powers of $f$ gives
  $ "length" \( R \/ \( f^q \) \) = q thin "length" \( R \/ \( f \) \) . $
  Since $\( f^q \) subset frak(m)_R^(m q)$, the Hilbert–Samuel formula yields
  $ q thin "length" \( R \/ \( f \) \) gt.eq "length" \( R \/ frak(m)_R^(m q) \) = m q thin e \( R \) + O \( 1 \) \, $
  where $e \( R \)$ is the ordinary multiplicity. Dividing by $q$ and letting $q arrow.r oo$ gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ "length" \( R \/ \( f \) \) gt.eq m thin e \( R \) . $ <eq:local-curve-bound>]
  Apply (6.5) to the local equations of $s \|_C$ at the marked points on $C$.
    The zero scheme of this nonzero section is an effective Cartier divisor on the integral projective curve,
    and its total length is $deg \( A \|_C \) = A dot.op C$. Summing the local contributions proves the assertion. ◻
]

Fix a tuple $upright(bold(p)) in U_r \( X \) \\ Z_r$. Applying Lemma 14 with $A = k L$ and $m =
  floor.l k theta_j floor.r$ gives

$ epsilon \( X \, L \; upright(bold(p)) \) gt.eq frac(floor.l k theta_j floor.r, k) wide \( k gt.eq k_j \) . $

First let $k arrow.r oo$ for each fixed $j$, and then let $j arrow.r oo$. We obtain

#[#set math.equation(numbering: n => "(6.6)")
 $ epsilon \( X \, L \; upright(bold(p)) \) gt.eq w = \( V \/ r \)^(1 \/ n) . $ <eq:main-lower-bound>]

=== 6.4 The volume bound <the-volume-bound>

For completeness, we derive the reverse inequality for every tuple of distinct points.
  Let $pi : Y arrow.r X$ be the blow-up of such a tuple, with exceptional divisors $E_1 \, dots.h \, E_r$.
  For $t gt.eq 0$, put

$ D_t = pi^(*) L - t sum_(i = 1)^r E_i . $

If an integral curve $Gamma$ is contained in $E_i tilde.eq bb(P)^(n - 1)$, then $D_t \|_(E_i) =
  t cal(O)_(bb(P)^(n - 1)) \( 1 \)$ is nonnegative on $Gamma$.
  Every other integral curve is the strict transform of an integral curve $C subset X$, and

#[#set math.equation(numbering: n => "(6.7)")
 $ D_t dot.op Gamma = L dot.op C - t sum_(i = 1)^r "mult"_(p_i) C . $ <eq:strict-transform-intersection>]

Here $E_i dot.op Gamma = "mult"_(p_i) C$ also when $C$ is singular. If $p_i in.not C$, both sides vanish.
  For $p_i in C$, identify the strict transform locally with the blow-up of $cal(O)_(C \, p_i)$ at its maximal
  ideal. Its intersection with $E_i$ is the zero-dimensional exceptional fiber
  $"Proj" \( "gr"_(frak(m)) cal(O)_(C \, p_i) \)$, whose length is the Hilbert–Samuel multiplicity.
  This is the degree of the effective Cartier divisor cut out by $E_i$ on the strict transform.

It follows from (6.7) that $D_t$ is nef whenever $0 lt.eq t < epsilon \( X \, L \; upright(bold(p)) \)$.
  A nef real divisor has nonnegative top self-intersection.
  The exceptional divisors are disjoint, $pi^(*) L \|_(E_i)$ is trivial, and $E_i^n = \( - 1 \)^(n - 1)$. Therefore

$ 0 lt.eq D_t^n = V - r t^n . $

This inequality for all $0 lt.eq t < epsilon \( X \, L \; upright(bold(p)) \)$ proves the universal bound

#[#set math.equation(numbering: n => "(6.8)")
 $ epsilon \( X \, L \; upright(bold(p)) \) lt.eq \( V \/ r \)^(1 \/ n) . $ <eq:volume-upper-bound>]

Together, (6.6) and (6.8) give the equality asserted in Theorem 1 at every tuple outside $Z_r$.
  Equation (6.7) also shows that $D_w$ is nef there, and its top self-intersection is zero.
  The threshold (6.1) was chosen before fixing $r$, so this proves the theorem for every integer $r gt.eq r_0$.

#bibliography("refs.bib", style: "ieee", title: [References])
