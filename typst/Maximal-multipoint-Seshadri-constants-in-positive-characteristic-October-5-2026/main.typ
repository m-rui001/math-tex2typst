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

#align(center)[#text(size: 16pt, weight: "bold")[Maximal multipoint Seshadri constants \
in positive characteristic]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Multipoint Seshadri constants measure how much positivity an ample line bundle retains after imposing simultaneous
  conditions at several points. Their volume bound depends only on the top self-intersection of the line bundle
  and the number of points. The question is whether, for sufficiently many general points,
  any curve can impose a stricter bound. We prove that no such curve exists at a geometric generic tuple in
  positive characteristic.

Let $k$ be an algebraically closed field of characteristic $p > 0$,
  let $X \/ k$ be a smooth integral projective variety of dimension $n$, and let $L$ be an ample line bundle.
  For $r gt.eq 1$, write

$ U_r = { \( x_1 \, dots.h \, x_r \) in X^r : x_i eq.not x_j upright(" for ") i eq.not j } $

for the open configuration space of ordered distinct points.
  Put $K_r = overline(k \( U_r \))$, and let $p_1 \, dots.h \,
  p_r in X \( K_r \)$ be the points specified by its geometric generic point. Define

#[#set math.equation(numbering: n => "(1.1)")
 $ epsilon_r \( X \, L \) = inf_C frac(L_(K_r) dot.op C, sum_(i = 1)^r "mult"_(p_i) C) \, $ <eq:generic-seshadri>]

where $C$ ranges over integral curves in $X_(K_r)$ meeting at least one $p_i$.
  Multiplicity at a point outside $C$ is zero. Throughout, we use this ordinary, curve-defined Seshadri constant.

#thm([Theorem 1.1.])[
  #emph[Let $X \/ k$ be a smooth integral projective variety over an algebraically closed field of characteristic
    $p > 0$, with $dim X = n gt.eq 3$, and let $L$ be ample. There is an integer $r_0 = r_0 \( X \, L \)$ such that
$ epsilon_r \( X \, L \) = (L^n / r)^(1 \/ n) wide upright("for every integer ") r gt.eq r_0 . $

]
] <thm:main>

The same conclusion holds when $n = 2$; see Remark 17.

The geometric generic formulation includes countable algebraically closed fields.
  It also gives a precise meaning to general position without choosing points in an infinite intersection of open
  subsets. The equality is exact for each sufficiently large point count.
  On the blow-up of the geometric generic points, it says that

$ pi^(*) L_(K_r) - \( L^n \/ r \)^(1 \/ n) sum_(i = 1)^r E_i $

is a nef real divisor class with top self-intersection zero.

=== 1.1 History and the characteristic issue <history-and-the-characteristic-issue>

Nagata’s work on Hilbert’s fourteenth problem led to his conjecture on the degrees of plane curves with assigned
  multiplicities at general points, and to its proof when the number of points is a square at least $16$
  #cite(label("Nagata1959")). The qualitative Nagata–Biran–Szemberg assertion extends eventual maximality to
  polarized varieties. Roé and Ross formulate it in arbitrary dimension over uncountable algebraically closed
  fields and distinguish the ordinary Seshadri constant from its higher-dimensional cycle analogues
  #cite(label("RoeRoss2009")) Conjecture 1.3 and Remark 1.2.
  Theorem 1 proves its positive-characteristic form, with general position expressed by the geometric generic
  tuple, in the stated dimensions.

Several preceding results explain the volume scale of this question.
  Biran’s packing stability theorem gives a symplectic analogue on closed four-manifolds with rational symplectic
  class #cite(label("Biran1999")). Küchle obtains asymptotically optimal lower bounds for multipoint Seshadri
  constants on complex projective varieties #cite(label("Kuechle1996")).
  Product inequalities compare point counts on a variety with those on projective space
  #cite(label("RoeRoss2009")) Theorem 1.1 and Remark 1.2. These are distinct from exact algebraic maximality for
  every sufficiently large integer $r$.

Our proof adapts the graded-support construction of the companion #emph[Maximal Multipoint Seshadri Constants in
  Higher Dimensions] #cite(label("OpenAI2026Higher")) Sections 2–6, which treats complex varieties.
  Its two-coordinate reshaping follows the nodal exponent bounds and primitive lattice directions in the surface
  companion #cite(label("OpenAI2026Surfaces")) Propositions 3.2 and 3.4 and Lemma 4.3.
  We prove every required statement here. The passage to positive characteristic requires an algebraic replacement
  for analytic limits and a nodal equation that retains two distinct branches in characteristic two.
  Formal substitutions over $k \[ \[ s \] \]$ supply the first; the curve $y^2 + x y - x^3 = 0$ supplies the second.

The relation between positivity and asymptotic jet separation is classical #cite(label("Demailly1992"))
  Theorem 6.4. The use of leading monomials belongs to the valuation approach to linear series
  #cite(label("Okounkov1996")) #cite(label("LazarsfeldMustata2009")) #cite(label("KavehKhovanskii2012"));
  Ito gives finite-degree comparisons between multipoint jet separation and initial monomial spaces
  #cite(label("Ito2013")) Proposition 5.7 and Theorem 5.8. Park and Shin give characteristic-independent
  Okounkov-body descriptions of one-point Seshadri constants for complete series of nef and big divisors
  #cite(label("ParkShin2021")) Theorem 1.2(1). Monomial interpolation also underlies Dumnicki’s diagram-cutting
  method #cite(label("Dumnicki2007")) Proposition 13 and Theorem 14.
  The statements below isolate two useful forms of these ideas:
  formal transfer of arbitrary finite jets, and reshaping of a graded family with prescribed real simplex
  intercepts. The latter keeps both the exact cardinality in every degree and multiplication between degrees.
  A short counting argument then turns full asymptotic density into exact filling of compact subsets of the interior.

=== 1.2 Proof strategy <proof-strategy>

Put $V = L^n$ and, for a fixed point count $r$, put $w = \( V \/ r \)^(1 \/ n)$.
  For a line bundle $A$ at a smooth point $x$, its jets through order $m$ form $A_x \/ frak(m)_x^(m + 1) A_x$.
  Separating those jets at a tuple means that sections surject onto the direct sum of these spaces.
  Such separation by $H^0 \( X \, L^(⊗ N) \)$ gives the curve inequality

$ N L dot.op C gt.eq m sum_i "mult"_(p_i) C . $

It therefore suffices to obtain jets through order $floor.l N theta floor.r$ for every fixed $0 < theta <
  w$ and all sufficiently large $N$.

We encode sections by finite sets $S_N subset bb(Z)^n$ of leading exponents, with the multiplication property

$ S_N + S_M subset.eq S_(N + M) . $

Their monomial spaces on $bb(T)^n = \( bb(G)_(m \, k) \)^n$ are $M \( S_N \) = "span"_k { z^alpha :
  alpha in S_N }$. Section 2 shows how jet separation for such monomials can be transferred to the original
  functions or sections. The transfer is a finite-degree rank argument.
  Its auxiliary weights may depend on $N$, while the orders defining the graded sets remain fixed.

For positive intercepts $a_1 \, dots.h \, a_n$, write

$ Delta \( a_1 \, dots.h \, a_n \) = {x in bb(R)_(gt.eq 0)^n : sum_i x_i \/ a_i lt.eq 1} . $

A complete-intersection flag in Section 3 gives

$ S_N subset.eq N Delta \( 1 \/ D \, dots.h \, 1 \/ D \, D^(n - 1) V \) \, wide \# S_N = h^0 \( X \, L^(⊗ N) \) \, $

where $D L$ is very ample. The simplex has volume $V \/ n !$, equal to the leading coefficient of the section count.

The main geometric step, Section 4, replaces two intercepts $A \, B$ by $w \,
  A B \/ w$ for any sufficiently small prescribed real $w > 0$.
  It preserves cardinalities, the graded property, and the implication from jet separation after the replacement
  to jet separation before it. For a suitable leading-term order,
  a node bounds the exponents by a quadrilateral of the same area.
  Integral changes of coordinates and successive compressions, which move interval slices to start at zero,
  turn this quadrilateral into the desired triangle. The other coordinates serve only as labels.

For large $r$, repeating this step yields graded supports $F_N$ inside

$ N P_(*) \, wide P_(*) = Delta \( w \, dots.h \, w \, r w \) \, wide \# F_N = frac(V, n !) N^n + o \( N^n \) . $

Section 5 proves that every lattice point in a fixed compact interior region belongs to $F_N$ in large degree.
  Indeed, each such point has on the order of $N^n$ decompositions into two nearly equal degrees,
  whereas the missing points exclude only $o \( N^n \)$ of them.
  The long final intercept of $P_(*)$ then permits polynomial interpolation at $r$ points differing only in their
  last coordinate. This interpolation uses the Chinese remainder theorem and is valid in every characteristic.

Each transferred jet-separation statement holds on a nonempty open subset of $U_r$,
  hence at its geometric generic point. Section 6 converts these statements into the required lower bound for
  every curve and proves the matching volume upper bound on the blow-up.

== 2 Leading terms and transfer of jets <sec:transfer>

We first turn spaces of sections into finite sets of exponents.
  The essential point is that jet separation by the resulting monomials implies jet separation by the original
  sections. We will also make two elementary changes to the exponent sets while retaining this implication.
  These operations follow the support method of #cite(label("OpenAI2026Higher")) Section 2;
  the formal transfer below makes the method available in arbitrary characteristic.

Throughout, $k$ is algebraically closed. The arguments of this section work in every characteristic.
  For a smooth $d$-dimensional variety $Y$, a line bundle $A$, and $y in Y \( k \)$,
  the jets through order $m gt.eq 0$ are

$ J_y^m \( A \) = A_y \/ frak(m)_y^(m + 1) A_y . $

A finite-dimensional space $W subset H^0 \( Y \, A \)$ #emph[separates these jets at] $y_1 \, dots.h \,
  y_r$ if the evaluation map $W arrow.r xor.big_i J_(y_i)^m \( A \)$ is surjective.
  The locus of such ordered distinct tuples is open in $Y^r$:
  the jet spaces are the fibers of the locally free sheaf of principal parts of $A$, of rank $binom(d + m, d)$,
  and surjectivity is a rank condition. The description of principal parts by the $m$th infinitesimal neighborhood
  of the diagonal also shows compatibility with field extension.
  Local coordinates for a smooth variety identify its fibers with truncated polynomial rings.
  For the diagonal description and base change, see #cite(label("StacksProject")) Tags 0H90 and 0H8Z.
  Local freeness follows as well from the filtration whose graded pieces are $A ⊗ "Sym"^j Omega_Y^1$, $0 lt.eq
  j lt.eq m$.

Put $bb(T)^d = \( bb(G)_(m \, k) \)^d$. For a finite set $S subset bb(Z)^d$, write

$ M \( S \) = "span"_k { x^alpha : alpha in S } subset k \[ x_1^(plus.minus 1) \, dots.h \, x_d^(plus.minus 1) \] . $

Here and below, auxiliary existence statements about points on a torus refer to $k$-points.

#prodef([Definition 2.1.])[
  A family of finite sets $\( S_N \)_(N gt.eq 1)$ in $bb(Z)^d$ is #emph[graded] if
  $ S_N + S_(N') subset S_(N + N') wide \( N \, N' gt.eq 1 \) . $
  A transformation $\( S_N \) mapsto \( T_N \)$ has #emph[backward jet transfer] if, for every $N \, r gt.eq
    1$ and $m gt.eq 0$, separation of jets through order $m$ by $M \( T_N \)$ at some $r$ distinct torus points
    implies the same assertion for $M \( S_N \)$, possibly at a different tuple.
] <def:graded>

=== 2.1 Least exponents <least-exponents>

A monomial order on $bb(Z)_(gt.eq 0)^h$ means an addition-compatible total well-order.
  For a nonzero formal series $f in k \[ \[ z_1 \, dots.h \, z_h \] \]$,
  let $nu \( f \)$ be the least exponent occurring in $f$, for a fixed such order. In particular,

#[#set math.equation(numbering: n => "(2.1)")
 $ nu \( f g \) = nu \( f \) + nu \( g \) . $ <eq:least-product>]

Indeed, the product of the two least terms is the unique least term in the product.

#thm([Lemma 2.2.])[
  #emph[For a finite-dimensional subspace $W subset k \[ \[ z_1 \, dots.h \, z_h \] \]$, the set ${ nu \( f \) :
    0 eq.not f in W }$ has cardinality $dim_k W$. More generally,
    suppose finite-dimensional spaces $W_(N \, gamma)$, with only finitely many nonzero spaces in each degree,
    are indexed by $N gt.eq 1$ and $gamma in bb(Z)^(d - h)$ and satisfy
$ W_(N \, gamma) W_(N' \, gamma') subset W_(N + N' \, gamma + gamma') . $

 Then recording the pairs $\( nu \( f \) \, gamma \)$ for $0 eq.not f in W_(N \, gamma)$ gives a graded family,
   with cardinality $sum_gamma dim_k W_(N \, gamma)$ in degree $N$.]
] <lem:least-terms>

#proof[
  Choose the smallest exponent occurring as $nu \( f \)$ for a nonzero member of $W$,
    and choose a member whose coefficient there is $1$. The kernel of that coefficient functional has codimension
    one. Repeating in this kernel gives a basis with distinct least exponents.
    Every nonzero linear combination has as its least exponent the smallest least exponent among the basis vectors
    with nonzero coefficients. This proves the first assertion; the second follows label by label and from (2.1). ◻
]

For the transfer of jets we need to realize finitely many chosen least terms by a single positive weight vector.
  The weights may depend on the degree; the monomial order defining the graded family will remain fixed.

#thm([Lemma 2.3.])[
  #emph[Let $f_1 \, dots.h \, f_q$ be nonzero formal series, and let $e_j = nu \( f_j \)$.
    There is a vector $lambda in bb(Z)_(> 0)^h$ for which $e_j$ is the unique exponent of least $lambda$-weight in
    $f_j$, simultaneously for all $j$, in either of the following cases:]
  + #emph[the order is lexicographic;]
  + #emph[$h = 2$ and, for a fixed real $t > 0$, the order compares $\( alpha + t beta \, beta \)$ lexicographically.]
] <lem:exposing-weights>

#proof[
  In the lexicographic case set $lambda_h = 1$, and successively choose
  $ lambda_i > max_j sum_(a > i) lambda_a \( e_j \)_a wide \( i = h - 1 \, dots.h \, 1 \) . $
  If an exponent is lexicographically greater than $e_j$, its gain at the first differing coordinate outweighs
    every possible loss in the later coordinates.
  For (ii), the indicated order is a monomial order because every bounded weight range contains only finitely many
    nonnegative integral exponents. Choose a real bound larger than the weights of all the $e_j$.
    Among the finitely many exponents below that bound, replacing $t$ by a sufficiently close rational $t' >
    t$ preserves all strict comparisons with the $e_j$ and resolves equal-weight comparisons by increasing $beta$.
    Exponents above the bound cannot interfere: their weights only increase,
    while the new weights of the $e_j$ stay below the bound. Clearing the denominator of $\( 1 \, t' \)$ gives the
    required positive integral weights. ◻
]

=== 2.2 Formal specialization of jet matrices <formal-specialization-of-jet-matrices>

The next lemma supplies the passage from formal leading terms to actual points.
  Ito’s weighted degeneration argument gives such a jet-rank comparison over $bb(C)$ #cite(label("Ito2013"))
  Proposition 5.7. Here substitution in truncated rings supplies a formal version in arbitrary characteristic,
  without differentiation or factorial denominators.

#thm([Lemma 2.4.])[
  (Formal jet transfer).  #emph[Let $1 lt.eq h lt.eq d$, let $Y$ be a smooth integral $h$-dimensional $k$-variety,
    and choose $y in Y \( k \)$ with formal coordinates $z_1 \, dots.h \, z_h$.
    Let $f_1 \, dots.h \, f_q$ be regular functions on a common neighborhood of $y$,
    and let $gamma_j in bb(Z)^(d - h)$. Suppose the expansion of $f_j$ has a term $c_j z^(e_j)$,
    with $c_j eq.not 0$, which is uniquely lowest for one common weight vector $lambda in bb(Z)_(> 0)^h$.]
  #emph[If the span of the monomials $Z^(e_j) u^(gamma_j)$ separates jets through order $m$ at $r$ distinct points
    of $bb(T)^h times bb(T)^(d - h)$, then the span of $f_j u^(gamma_j)$ separates the same jets at $r$ distinct
    points in the product of that neighborhood with $bb(T)^(d - h)$.
    The points may be chosen in any prescribed dense open subset of this product.
    The statement also holds for sections written in a local frame of a line bundle.]
] <lem:formal-transfer>

#proof[
  Let $\( Q_i \, U_i \)$, $1 lt.eq i lt.eq r$, be a tuple at which the monomials separate the stated jets.
    Shrink the neighborhood of $y$ to an affine one, denoted $Y^compose$, on which all the functions are defined. Put
  $ R = k \[ \[ s \] \] \, wide F = k \( \( s \) \) \, wide B =
    R \[ delta_1 \, dots.h \, delta_d \] \/ \( delta_1 \, dots.h \, delta_d \)^(m + 1) \, $
  and write $delta = \( delta' \, delta'' \)$ according to the two factors. For each $i$, substitute
  #[#set math.equation(numbering: n => "(2.2)")
   $ z_a = s^(lambda_a) \( Q_(i \, a) + delta'_a \) \, wide u_b = U_(i \, b) + delta''_b . $ <eq:formal-substitution>]
  The first substitution is defined on the completed local ring,
    since $B$ is $s$-adically complete and every $lambda_a$ is positive.
    The second is defined on Laurent polynomials, since each $U_(i \, b)$ is nonzero.
    In particular, these substitutions define ring maps from the coordinate ring of $Y^compose times
    bb(T)^(d - h)$ to $B$.
  Use the classes of $delta^alpha$, $\| alpha \| lt.eq m$, as an $R$-basis of $B$.
    The images of $f_j u^(gamma_j)$ under all $r$ substitutions give the $j$th column of a matrix with $r
    binom(d + m, d)$ rows. Divide this column by $c_j s^(lambda dot.op e_j)$.
    These normalized columns still belong to $B^(xor r)$, and their reductions modulo $s$ are precisely the jets
    of $Z^(e_j) u^(gamma_j)$ at $\( Q_i \, U_i \)$ in translated coordinates.
    The assumed surjectivity supplies a maximal minor nonzero modulo $s$.
    The original columns therefore span $B \[ 1 \/ s \]^(xor r)$ over $F$.
  We now interpret this rank statement as jet separation on a variety.
    Setting $delta = 0$ in (2.2) gives actual $F$-points $P_i$ of $Y^compose times bb(T)^(d - h)$.
    After inverting $s$, the corresponding ring map factors through the order-$m$ jet algebra of
    $\( Y^compose times bb(T)^(d - h) \)_F$ at $P_i$: elements nonvanishing at $P_i$ map to units,
    and its maximal ideal maps into $\( delta \)$. Both this jet algebra and $B \[ 1 \/ s \]$ have dimension
    $binom(d + m, d)$ over $F$. Surjectivity onto the direct sum of the latter spaces forces each induced map from
    a jet algebra to be an isomorphism. It follows that the original functions separate the order-$m$ jets at the
    $P_i$ themselves. These points are distinct, since two repeated centers would make two target blocks factor
    through one jet algebra, contradicting surjectivity.
  Thus the open jet-separation locus has an $F$-point and is nonempty.
    The configuration space is irreducible, so this locus meets the configuration space of any prescribed dense
    open subset. A nonempty open subset of a variety over the algebraically closed field $k$ has a $k$-point.
    This proves the assertion. A local frame reduces the line-bundle version to the one just proved. ◻
]

Together, Lemmas 3–5 allow us to replace finite-dimensional spaces by their least exponents,
  using either of the two orders above, while preserving dimension and transferring jet separation back to the
  original spaces. Labels record the exponents of variables that are left unchanged.

=== 2.3 Two elementary transformations <two-elementary-transformations>

#thm([Lemma 2.5.])[
  #emph[For $A in "GL"_d \( bb(Z) \)$, the transformation $S_N mapsto A
    S_N$ preserves cardinalities and gradedness, and has backward jet transfer.]
] <lem:unimodular>

#proof[
  An invertible integral linear map preserves cardinalities and addition.
    Its action on characters is induced by a torus automorphism, which identifies the corresponding jet evaluations. ◻
]

The other transformation uses orders of vanishing to place each row in an interval starting at zero.
  The resulting exponents need not be consecutive.

#thm([Lemma 2.6.])[
  (Coordinate compression).  #emph[Let $\( S_N \)$ be a graded family in $bb(Z)^d$, and select one coordinate,
    written $z$. For each degree $N$ and each label $gamma in bb(Z)^(d - 1)$, form its row space
$ W_(N \, gamma) = "span"_k { z^a : \( a \, gamma \) in S_N } . $

 Replace this row by the set of orders at $z = 1$ of nonzero elements of $W_(N \, gamma)$,
   retaining the label $gamma$. The resulting family preserves cardinalities and gradedness,
   and has backward jet transfer. If the original row lies in a real interval of length $b$,
   every new exponent lies in $\[ 0 \, b \]$.]
] <lem:compression>

#proof[
  Expand the row spaces in the parameter $z - 1$. Lemma 3 proves the cardinality and gradedness assertions,
    because multiplication adds both degrees and labels. Lemma 5, with $Y = bb(G)_m$, $y = 1$, and weight $1$,
    proves backward jet transfer.
  For a nonempty row let $a_(-)$ and $a_(+)$ be its smallest and largest exponents.
    Multiplication by $z^(- a_(-))$ preserves orders at $1$ and turns each member into a polynomial of degree at
    most $a_(+) - a_(-) lt.eq b$. Its order of vanishing is at most its degree, proving the bound. ◻
]

Consequently, suppose a family is bounded by dilates of a polygon.
  Replacing each slice of that polygon parallel to the compressed coordinate by an interval of the same length
  starting at zero gives a new region whose dilates contain the compressed family.
  This applies equally to real slice endpoints and to every dilation of the polygon.
  In characteristic $p$, a compressed row need not contain all intermediate integers:
  for example, $"span"_k { 1 \, z^p }$ has orders $0$ and $p$ at $1$. Only the interval bound of Lemma 7 will be used.

== 3 An initial simplex from a flag <sec:flag>

We now apply the leading-term construction to the section ring of $L$.
  A complete-intersection flag gives a particularly simple bound on the exponents:
  a simplex whose volume equals the leading coefficient of the Hilbert polynomial.
  We give the complete argument for the flag construction of #cite(label("OpenAI2026Higher")) Section 3.

For positive real numbers $a_1 \, dots.h \, a_d$, write

$ Delta \( a_1 \, dots.h \, a_d \) = {x in bb(R)_(gt.eq 0)^d : sum_(i = 1)^d x_i / a_i lt.eq 1} . $

Its volume is $product_i a_i \/ d !$. We use additive notation $N L$ for $L^(⊗ N)$.

#thm([Proposition 3.1.])[
  #emph[Let $X$ be a smooth integral projective $n$-dimensional variety over an algebraically closed field,
    with $n gt.eq 2$, and let $L$ be ample. Put $V = L^n$, and choose an integer $D gt.eq
    1$ such that $D L$ is very ample. There is a graded family of finite sets $S_N subset bb(Z)_(gt.eq 0)^n$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ S_N & subset N P_0 \, & P_0 & = Delta \( 1 \/ D \, dots.h \, 1 \/ D \, D^(n - 1) V \) \,\
\# S_N & = h^0 \( X \, N L \) = frac(V, n !) N^n + o \( N^n \) . $ <eq:initial-simplex>]

 For every $N \, r gt.eq 1$ and $m gt.eq 0$, if $M \( S_N \)$ separates jets through order $m$ at some $r$
   distinct torus points, then $H^0 \( X \, N L \)$ separates the same jets at some $r$ distinct points of $X$.]
] <prop:initial-simplex>

#proof[
  Bertini’s theorem for hyperplane sections, valid in every characteristic for a projective embedding over an
    algebraically closed field, gives sections $sigma_1 \, dots.h \,
    sigma_(n - 1) in H^0 \( X \, D L \)$ whose successive zero loci form a smooth integral flag
  $ X = X_0 supset X_1 supset dots.h.c supset X_(n - 1) = C_0 . $
  See #cite(label("StacksProject")) Tags 0FD6 and 0G4G for the smoothness and integrality assertions.
    At each step the variety being cut has dimension at least two.
    Choose $x in C_0 \( k \)$ and a local frame $e$ of $L$ near $x$.
    The functions $z_i = sigma_i \/ e^D$, $i < n$, form part of a regular system of parameters at $x$;
    complete them by $z_n$. These parameters identify $hat(cal(O))_(X \, x)$ with $k \[ \[ z_1 \, dots.h \, z_n \] \]$.
  Expand every section of $N L$ using the frame $e^N$, and let $S_N$ be the set of lexicographically least
    exponents of the nonzero expansions. The expansion map is injective:
    a section with zero germ is zero by integrality, and the local ring injects into its completion.
    Lemma 3 therefore gives $\# S_N = h^0 \( X \, N L \)$ and the graded property.
    The Hilbert polynomial of the ample line bundle gives the last equality in (3.1).
    A basis with distinct least exponents, Lemma 4(i), and Lemma 5 with $h = n$ prove the jet-transfer assertion.
  It remains to prove the simplex bound. Let $alpha = \( alpha_1 \, dots.h \, alpha_n \) in S_N$,
    coming from a nonzero section $s$. We successively divide by the equations of the flag and restrict to the
    next member. The details matter because the lexicographic order first measures vanishing along an entire
    divisor, not just at the chosen point.
  Suppose we have reached a nonzero section on $X_(i - 1)$ with least exponent
    $\( alpha_i \, dots.h \, alpha_n \)$ in its formal expansion at $x$.
    If $alpha_i > 0$, restriction of this section to $X_i$ has zero formal expansion.
    Injectivity into the completed local ring, followed by integrality of $X_i$,
    shows that this restriction is identically zero. The exact sequence for the effective Cartier divisor $X_i
    subset X_(i - 1)$ therefore allows division by $sigma_i \|_(X_(i - 1))$.
    Repeating this argument $alpha_i$ times, and then restricting to $X_i$,
    gives a nonzero section whose least exponent is $\( alpha_(i + 1) \, dots.h \, alpha_n \)$.
    Nonvanishing follows from the nonzero coefficient of the original least term.
    Each division subtracts $D L$ from the line bundle.
  After these steps, the resulting nonzero section on $C_0$ belongs to
  $ (N - D sum_(i < n) alpha_i) L \|_(C_0) $
  and has order exactly $alpha_n$ at $x$. Since $L dot.op C_0 = D^(n - 1) V$,
    comparison with the degree of its zero divisor gives
  $ alpha_n lt.eq (N - D sum_(i < n) alpha_i) D^(n - 1) V . $
  Equivalently, $D sum_(i < n) alpha_i + alpha_n \/ \( D^(n - 1) V \) lt.eq N$, which is (3.1). ◻
]

The intercepts of $P_0$ have product $V$. The next section changes them, two at a time,
  without changing this product, the numbers of exponents, or backward jet transfer.

== 4 Reshaping two intercepts <sec:reshape>

We now change two intercepts of a simplex while preserving their product.
  The support sets need not fill the simplex: the construction applies to any graded family inside it.
  Its algebraic step uses the two branches of a node; its remaining steps are lattice changes and coordinate
  compressions. This follows the planar construction of #cite(label("OpenAI2026Higher"), form: "prose") Section 4,
  Proposition 4.1, with a formal node whose branches remain distinct in characteristic two.
  The nodal bound, compressions, and primitive-direction choice also appear in
  #cite(label("OpenAI2026Surfaces"), form: "prose") Propositions 3.2 and 3.4, Lemma 4.3;
  we give all the arguments needed here.

#thm([Proposition 4.1.])[
  (Two-intercept reshaping).  #emph[Let $n gt.eq 2$, let $A \, B \, a_3 \, dots.h \, a_n > 0$,
    and let $\( S_N \)_(N gt.eq 1)$ be a graded family of finite subsets of $bb(Z)^n$ satisfying
$ S_N subset N Delta \( A \, B \, a_3 \, dots.h \, a_n \) . $

 Put $H = A B$ and $d = max { 3 \/ A \, 2 \/ B }$. For every $w > 0$ with $d w < 1 \/ 16$,
   there is a graded family $\( S'_N \)_(N gt.eq 1)$ such that
$ S'_N subset N Delta \( w \, H \/ w \, a_3 \, dots.h \, a_n \) \, wide \# S'_N = \# S_N quad \( N gt.eq 1 \) . $

 The transformation from $S_N$ to $S'_N$ has backward jet transfer in every degree.
   For $n = 2$, the lists $a_3 \, dots.h \, a_n$ are empty.]
] <prop:reshape>

We first prove the nodal bound and then choose the lattice direction that produces the prescribed intercept $w$.
  Throughout this section, $H$ and $d$ have the meanings above, and we put

#[#set math.equation(numbering: n => "(4.1)")
 $ W = d H = max { 2 A \, 3 B } \, wide c = 1 \/ d \, wide T = d^2 H = max { 9 B \/ A \, 4 A \/ B } gt.eq
   6 . $ <eq:reshape-constants>]

In particular, $c W = H$.

=== 4.1 The two branches of a node <the-two-branches-of-a-node>

For $t > 0$, order pairs $\( alpha \, beta \) in bb(Z)_(gt.eq 0)^2$ by the lexicographic order of
  $\( alpha + t beta \, beta \)$, as in Lemma 4. We denote the least exponent in this order by $nu_t$.

#thm([Lemma 4.2.])[
  (Nodal support bound).  #emph[There are formal coordinates $xi \, eta$ at the origin of $bb(A)_k^2$ with
$ y^2 + x y - x^3 = xi eta $

 for which the following assertion holds. Given $t > 0$, set
$ a = frac(W t, 1 + t) \, wide b = frac(W, 1 + t) \, wide Q =
  "conv" { \( 0 \, 0 \) \, \( a \, 0 \) \, \( c \, c \) \, \( 0 \, b \) } . $

 If $kappa gt.eq 0$ and $0 eq.not f in k \[ x \, y \]$ has all its exponents in $kappa Delta \( A \, B \)$,
   then its expansion in these coordinates satisfies $nu_t \( f \) in kappa Q$.]
] <lem:nodal-bound>

#proof[
  Write $g = y^2 + x y - x^3$. The parametrization
  #[#set math.equation(numbering: n => "(4.2)")
   $ x = v \( v + 1 \) \, wide y = v^2 \( v + 1 \) = v x $ <eq:node-parametrization>]
  identifies the complement of $x = 0$ in $g = 0$ with $"Spec" k \[ v \, 1 \/ \( v \( v + 1 \) \) \]$:
    the inverse is $v = y \/ x$. Consequently, a polynomial vanishes under (4.2) if and only if it is divisible by
    $g$. Indeed, vanishing implies membership in $\( g \)$ after inverting $x$,
    and $g$ is relatively prime to $x$ in the unique factorization domain $k \[ x \, y \]$.
  The polynomial $Z^2 + Z - x$ has simple roots $0$ and $- 1$ modulo $x$.
    Hensel lifting gives roots $r_1 \, r_2 in k \[ \[ x \] \]$ with these respective constant terms. Set
  $ eta = y - x r_1 \( x \) \, wide xi = y - x r_2 \( x \) . $
  Their linear terms are $y$ and $y + x$, so they are formal coordinates, and $xi eta = g$.
    These assertions also hold in characteristic two: the roots $0$ and $- 1 =
    1$ remain distinct and the linear terms remain independent.
    Along (4.2) near $v = 0$, uniqueness of the lifted root gives $r_1 \( x \( v \) \) = v$, so $eta =
    0$ and $xi$ has order one in $v$. Near $v = - 1$, one similarly has $xi = 0$ and $eta$ has order one in $v + 1$.
  Factor $f = g^e f_0$ with $e gt.eq 0$ and $g divides.not f_0$.
    Give $x \, y$ the positive weights $1 \/ A \, 1 \/ B$, and write $deg_(A \, B)$ for the maximum weight of a
    polynomial’s monomials. This degree is additive on products,
    because their highest weight forms multiply nontrivially. Moreover,
  $ deg_(A \, B) \( g \) = d \, wide deg_(A \, B) \( f_0 \) lt.eq kappa - e d \; $
  here $1 \/ A + 1 \/ B lt.eq max { 3 \/ A \, 2 \/ B } = d$. Thus $e d lt.eq kappa$. The nonzero polynomial
  $ F_0 \( v \) = f_0 #scale(x: 120%, y: 120%)[\(] v \( v + 1 \) \, v^2 \( v + 1 \) #scale(x: 120%, y: 120%)[\)] $
  has degree at most $W \( kappa - e d \)$, since
  $ 2 i + 3 j lt.eq W \( i \/ A + j \/ B \) $
  for every monomial $x^i y^j$ of $f_0$. Its expansions at $v = 0$ and $v = - 1$ are both nonzero,
    since $k \[ v \]$ injects into each completed local ring.
    These expansions are exactly the restrictions of $f_0$ to the two formal branches described above.
  Let $nu_t \( f_0 \) = \( alpha \, beta \)$ and $mu = alpha + t beta$.
    Every term of its formal expansion has weight at least $mu$.
    Restricting to $eta = 0$ therefore gives order at least $mu$ on the branch at $v = 0$; restricting to $xi =
    0$ gives order at least $mu \/ t$ on the branch at $v = - 1$. The nonzero polynomial $F_0$ consequently satisfies
  $ \( 1 + 1 \/ t \) mu lt.eq "ord"_(v = 0) \( F_0 \) + "ord"_(v = - 1) \( F_0 \) lt.eq deg \( F_0 \) lt.eq
    W \( kappa - e d \) . $
  Equivalently, $\( alpha \, beta \) in \( kappa - e d \) Delta \( a \, b \)$.
    Because $g = xi eta$, multiplicativity of least exponents gives
  $ nu_t \( f \) = \( e \, e \) + nu_t \( f_0 \) = e d \( c \, c \) + nu_t \( f_0 \) in kappa Q . $
  This also covers $kappa = 0$, when $f$ is constant. ◻
]

=== 4.2 A lattice direction of prescribed height <a-lattice-direction-of-prescribed-height>

Choose $t > T$. With $a \, b$ as in Lemma 10, one has

$ a + b = W \, wide c / a + c / b = frac(\( 1 + t \)^2, T t) > 1 . $

Thus $Q$ is a quadrilateral with the vertices in the order displayed in that lemma,
  and its area is $c \( a + b \) \/ 2 = H \/ 2$. The shear $\( alpha \, beta \)
  mapsto \( alpha - beta \, beta \)$ sends its vertices to

$ \( 0 \, 0 \) \, quad \( a \, 0 \) \, quad \( 0 \, c \) \, quad \( - b \, b \) . $

Its vertical slice at horizontal coordinate $q$ has length

#[#set math.equation(numbering: n => "(4.3)")
 $ cases(delim: "{", c \( 1 + q \/ b \) \, & - b lt.eq q lt.eq 0 \,, c \( 1 - q \/ a \) \, & 0 lt.eq q lt.eq a .)
   $ <eq:first-slice-length>]

Compression in the second coordinate therefore places the support in the triangle

#[#set math.equation(numbering: n => "(4.4)")
 $ P = "conv" { \( - b \, 0 \) \, \( a \, 0 \) \, \( 0 \, c \) } . $ <eq:reshape-triangle>]

Its area is again $H \/ 2$; see Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (3.6, 0), (0.63, 1.68), (0, 1.2), close: true, fill: rgb("#e8e8ff"), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((3.6, 0), [#text(size: 9pt)[$(a,0)$]], anchor: "north", padding: 0.1176cm)
  content((0.63, 1.68), [#text(size: 9pt)[$(c,c)$]], anchor: "south", padding: 0.1176cm)
  content((0, 1.2), [#text(size: 9pt)[$(0,b)$]], anchor: "east", padding: 0.1176cm)
  content((1.485, 0.528), [#text(size: 9pt)[$Q$]])
  line((4.05, 0.8), (5.25, 0.8), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.65, 0.8), [#text(size: 9pt)[shear, then#linebreak()compress]], anchor: "south", padding: 0.1176cm)
  line((5.65, 0), (9.7, 0), (6.1, 1.68), close: true, fill: rgb("#e8e8ff"), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  line((6.1, 0), (6.1, 1.68), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((5.65, 0), [#text(size: 9pt)[$(-b,0)$]], anchor: "north", padding: 0.1176cm)
  content((9.7, 0), [#text(size: 9pt)[$(a,0)$]], anchor: "north", padding: 0.1176cm)
  content((6.1, 1.68), [#text(size: 9pt)[$(0,c)$]], anchor: "south", padding: 0.1176cm)
  content((7.54, 0.528), [#text(size: 9pt)[$P$]])
})],
  caption: [Figure 1: The nodal bound $Q$ becomes the triangle $P$ after a shear and vertical compression. Each vertical slice of the sheared bounding polygon is replaced by an interval of the same length starting at zero; Formula (4.3) gives the resulting boundary. Both polygons have area $H \/ 2$. The drawing is schematic; the displayed vertex coordinates are exact. ],
) <fig:reshape-polygons>

The next lemma chooses both $t$ and a primitive lattice direction.
  We seek unimodular coordinates in which $P$ has vertical extent $H \/ w$;
  its area $H \/ 2$ will then force its largest horizontal slice to have length $w$.

#thm([Lemma 4.3.])[
  (Prescribed primitive height).  #emph[If $w > 0$ and $d w < 1 \/ 16$,
    there exist $t > T$ and a primitive vector $u = \( i \, j \) in bb(Z)^2$ such that the three vertex heights $z
    mapsto det \( u \, z \)$ of the triangle $P$ in (4.4) are distinct and their range has length $H \/ w$.]
] <lem:primitive-height>

#proof[
  Put $R = H \/ w$ and $a_0 = W T \/ \( 1 + T \)$. As $t$ ranges over $\( T \, oo \)$, the value $a =
    W t \/ \( 1 + t \)$ ranges over $\( a_0 \, W \)$. For $u = \( i \, j \)$,
    the heights of $\( - b \, 0 \) \, \( a \, 0 \) \, \( 0 \, c \)$ are $j b \, - j a \, i \/ d$.
    We seek $j > 0$ and $i$ such that
  $ j a + i \/ d = R \, wide i \/ d > j b . $
  The first equality turns the second inequality into $R - j W > 0$.
    Thus we first choose $j W lt.eq R \/ 2$, and then use the freedom in $a$ to obtain the equality with $i$
    coprime to $j$.
  Take $j$ to be the largest power of two at most
  $ frac(R, 2 W) = frac(1, 2 d w) . $
  Then $j > 1 \/ \( 4 d w \) > 4$. The open interval
  $ #scale(x: 120%, y: 120%)[\(] d \( R - j W \) \, med d \( R - j a_0 \) #scale(x: 120%, y: 120%)[\)] $
  has length
  $ d j \( W - a_0 \) = frac(j T, 1 + T) > 2 \, $
  so it contains an odd integer $i$. Since $j$ is a power of two, $\( i \, j \)$ is primitive.
    There is a unique $t > T$ such that
  $ a = frac(R - i \/ d, j) in \( a_0 \, W \) . $
  The resulting heights satisfy
  $ - j a < j b < i \/ d \, wide i \/ d - j b = R - j W gt.eq R \/ 2 > 0 \, wide i \/ d + j a = R . $
  This gives the required height range and distinctness. ◻
]

=== 4.3 Completion of the transformation <completion-of-the-transformation>

#proof[
  Fix $t$ and $u$ from Lemma 11; these choices will be used in every degree.
    Keep coordinates $3 \, dots.h \, n$ unchanged. For each degree $N$ and each label
    $gamma = \( gamma_3 \, dots.h \, gamma_n \)$ occurring in $S_N$, put
  $ kappa = N - sum_(h = 3)^n gamma_h / a_h gt.eq 0 . $
  The pair exponents with this label lie in $kappa Delta \( A \, B \)$.
    Take their polynomial span in $k \[ x \, y \]$ and replace it by its least exponents in the coordinates $xi \,
    eta$ and order $nu_t$. Lemma 3 preserves cardinality and gradedness:
    the row spaces multiply into the row with degree and label added,
    and the same coordinates and order are used throughout. For fixed $N$,
    choose a basis with distinct least exponents in each row and apply Lemma 4 to the finite union of these bases.
    Its common weight vector allows Lemma 5 to apply to all labels at once, giving backward jet transfer.
    The old points can be chosen in the dense open torus of $bb(A)^2 times bb(T)^(n - 2)$.
  Lemma 10 places the new pair exponents in $kappa Q$. Apply the shear above and compress in the second
    coordinate. Lemmas 6 and 7, together with (4.3), give the bound $kappa P$.
    It remains to turn this triangle into $Delta \( w \, H \/ w \)$.
  Complete the primitive vector $u$ to an integral basis $\( u \, v \)$ with $det \( u \, v \) = 1$,
    and use the coordinates in that basis. This is a unimodular change,
    and its second coordinate is precisely $z mapsto det \( u \, z \)$.
    Write $q_0 < q_1 < q_2$ for the three vertex heights of the transformed triangle.
    Its horizontal slice length is linear from zero at $q_0$ to a maximum at $q_1$,
    and linear back to zero at $q_2$. The maximum is $w$, since area is preserved and
  $ H / 2 = 1 / 2 \( q_2 - q_0 \) thin #scale(x: 120%, y: 120%)[\(] upright("maximum slice length")
    #scale(x: 120%, y: 120%)[\)] \, wide q_2 - q_0 = R = H \/ w . $
  Compressing in the first coordinate therefore gives the bound
  $ "conv" { \( 0 \, q_0 \) \, \( w \, q_1 \) \, \( 0 \, q_2 \) } . $
  Its vertical slice at first coordinate $h in \[ 0 \, w \]$ has length $R \( 1 - h \/ w \)$.
    Compression in the second coordinate gives $Delta \( w \, R \)$, as illustrated in Figure 2.
    These slice statements commute with multiplication by $kappa$,
    so the resulting pair bound is $kappa Delta \( w \, R \)$ for every label.
    If $kappa = 0$, its only possible pair exponent is $\( 0 \, 0 \)$, which remains unchanged at every step.
  Restoring the labels gives $S'_N subset N Delta \( w \, R \, a_3 \, dots.h \, a_n \)$.
    Every step preserves cardinality and gradedness and has backward jet transfer,
    so their composition has all the asserted properties. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, -0.6), (2, 0.4), (0, 1.8), close: true, fill: rgb("#e8e8ff"), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  line((1, -0.1), (1, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0, -0.6), [#text(size: 9pt)[$(0,q_0)$]], anchor: "east", padding: 0.1176cm)
  content((0, 1.8), [#text(size: 9pt)[$(0,q_2)$]], anchor: "east", padding: 0.1176cm)
  content((2, 0.4), [#text(size: 9pt)[$(w,q_1)$]], anchor: "west", padding: 0.1176cm)
  line((3.65, 0.6), (5.15, 0.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.4, 0.6), [#text(size: 9pt)[vertical#linebreak()compression]], anchor: "south", padding: 0.1176cm)
  line((6.5, -0.6), (8.5, -0.6), (6.5, 1.8), close: true, fill: rgb("#e8e8ff"), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  line((7.5, -0.6), (7.5, 0.6), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((6.5, -0.6), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((8.5, -0.6), [#text(size: 9pt)[$(w,0)$]], anchor: "north", padding: 0.1176cm)
  content((6.5, 1.8), [#text(size: 9pt)[$(0,R)$]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 2: After the lattice change and horizontal compression, a final vertical compression produces the target triangle. At first coordinate $h$, both vertical slices have length $R \( 1 - h \/ w \)$, where $R = q_2 - q_0 = H \/ w$. Dashed segments mark corresponding slices. ],
) <fig:final-compression>

== 5 Interior filling and interpolation <sec:interpolation>

The reshaping construction preserves the number of exponents,
  but does not identify the individual exponents that survive. Gradedness supplies the missing information:
  a family with full asymptotic density contains every lattice point in a fixed compact subset of the interior,
  in all sufficiently large degrees. We first prove this statement,
  then use it to find a complete interpolation space inside the reshaped supports.
  These two arguments follow #cite(label("OpenAI2026Higher")) Lemmas 5.1 and 5.2.
  Interior filling for semigroups is studied more generally in #cite(label("KavehKhovanskii2012")) Theorem 1.6;
  the full-density hypothesis here permits a direct proof by counting decompositions.

#thm([Lemma 5.1.])[
  (Interior filling).  #emph[Let $P subset bb(R)^n$, $n gt.eq 1$, be a compact convex set with nonempty interior.
    Suppose finite sets $F_N subset N P ∩ bb(Z)^n$, indexed by integers $N gt.eq 1$, satisfy
$ F_N + F_(N') subset F_(N + N') quad upright("and") quad \# F_N = "vol" \( P \) N^n + o \( N^n \) . $

 Then for every compact set $K subset "int" \( P \)$ there is an integer $N_K$ such that
$ N K ∩ bb(Z)^n subset F_N wide \( N gt.eq N_K \) . $

]
] <lem:interior-filling>

#proof[
  The boundary of a convex body has measure zero, so lattice-point counting by Riemann sums gives
  $ \# \( N P ∩ bb(Z)^n \) = "vol" \( P \) N^n + o \( N^n \) . $
  Consequently the number of missing lattice points
  $ b_N := \# #scale(x: 120%, y: 120%)[\(] \( N P ∩ bb(Z)^n \) \\ F_N #scale(x: 120%, y: 120%)[\)] $
  is $o \( N^n \)$. We show that a point of $N K$ has too many decompositions into two points in nearly equal
    degrees for all of them to involve a missing point.
  Assume $K$ is nonempty, and choose $rho > 0$ so that the closed ball of radius $rho$ about every point of $K$
    lies in $P$. Write $N = N_1 + N_2$ with $N_1 = floor.l N \/ 2 floor.r$ and $N_2 = ceil.l N \/ 2 ceil.r$.
    For $y in N K ∩ bb(Z)^n$, consider all lattice points
  $ y_1 in bb(Z)^n \, wide ∥y_1 - N_1 / N y∥ < rho N_1 \, wide y_2 := y - y_1 . $
  Both $y_1 \/ N_1$ and $y_2 \/ N_2$ lie in the radius-$rho$ ball about $y \/ N$. Thus $y_i in N_i P ∩ bb(Z)^n$.
    The ball from which $y_1$ is chosen contains at least $c N^n$ lattice points for a constant $c >
    0$ independent of $y$ and all sufficiently large $N$: an inscribed cube gives this bound uniformly in the
    center. Among these choices, at most $b_(N_1)$ have $y_1 in.not F_(N_1)$,
    and at most $b_(N_2)$ have $y_2 in.not F_(N_2)$, since $y_1 mapsto y - y_1$ is injective.
    As $b_(N_1) + b_(N_2) = o \( N^n \)$, at least one choice has $y_i in F_(N_i)$.
    Gradedness then gives $y = y_1 + y_2 in F_N$. All bounds are uniform in $y$, which proves the assertion. ◻
]

The interpolation space we need is a simplex stretched in the last coordinate by the number of points.
  Its fibers over the other exponents have exactly the lengths needed for one-variable interpolation with
  multiplicities.

#thm([Lemma 5.2.])[
  (Jets from an elongated simplex).  #emph[Let $n \, r gt.eq 1$ and $m gt.eq 0$ be integers,
    and let $k$ be a field containing distinct nonzero elements $c_1 \, dots.h \, c_r$. Set
#[#set math.equation(numbering: n => "(5.1)")
 $ E_m = {\( beta \, b \) in bb(Z)_(gt.eq 0)^(n - 1) times bb(Z)_(gt.eq 0) : \| beta \| + b / r < m + 1} \,
   wide \| beta \| = sum_(j = 1)^(n - 1) beta_j . $ <eq:interpolation-support>]

 Then $M \( E_m \)$ separates jets through order $m$ at the $r$ points
$ q_i = \( 1 \, dots.h \, 1 \, c_i \) in bb(T)^n \( k \) . $

 For $n = 1$, the tuple $beta$ is empty and $\| beta \| = 0$.]
] <lem:elongated-jets>

#proof[
  Write the coordinates as $\( x_1 \, dots.h \, x_(n - 1) \, Y \)$ and put $x' -
    1 = \( x_1 - 1 \, dots.h \, x_(n - 1) - 1 \)$. An arbitrary jet through order $m$ at $q_i$ has a unique expression
  $ sum_(\| alpha \| lt.eq m) \( x' - 1 \)^alpha h_(i \, alpha) \( Y - c_i \) \, wide deg h_(i \, alpha) lt.eq
    m - \| alpha \| . $
  For each $alpha$, the Chinese remainder theorem gives a polynomial $h_alpha \( Y \)$ satisfying
  $ h_alpha \( Y \) equiv h_(i \, alpha) \( Y - c_i \) med \( mod med \( Y - c_i \)^(m - \| alpha \| + 1) \)
    quad \( 1 lt.eq i lt.eq r \) \, wide deg h_alpha < r \( m - \| alpha \| + 1 \) . $
  Indeed, the ideals in this display are pairwise comaximal,
    and their product is generated by a monic polynomial of degree $r \( m - \| alpha \| + 1 \)$. The polynomial
  $ sum_(\| alpha \| lt.eq m) \( x' - 1 \)^alpha h_alpha \( Y \) $
  realizes the prescribed jets. Each monomial $x' ""^beta Y^b$ in its expansion satisfies $beta_j lt.eq
    alpha_j$ for every $j$ and $b < r \( m - \| alpha \| + 1 \)$ for some $alpha$.
    Hence $\| beta \| + b \/ r < m + 1$, so the polynomial belongs to $M \( E_m \)$.
    This uses powers of local parameters and the Chinese remainder theorem,
    and therefore works in every characteristic. ◻
]

We now choose the number of points large enough that successive applications of Proposition 9 produce the required
  elongated simplex.

#thm([Proposition 5.3.])[
  (Jets at the geometric generic tuple).  #emph[Let $k$ be an algebraically closed field of positive
    characteristic, let $X \/ k$ be a smooth integral projective variety of dimension $n gt.eq 2$,
    and let $L$ be ample. Put $V = L^n$. There is an integer $r_0 = r_0 \( X \, L \)$ such that,
    for every integer $r gt.eq r_0$ and every real number
$ 0 < theta < (V / r)^(1 \/ n) \, $

 there is an integer $N_0 = N_0 \( r \, theta \)$ such that, for every $N gt.eq N_0$,
   the sections of $N L$ separate jets through order $floor.l N theta
   floor.r$ at some ordered $r$-tuple of distinct $k$-points, which may depend on $N$.
   For each such $N$, the same jet separation holds after base change to $K_r$ at the geometric generic tuple
   $p_1 \, dots.h \, p_r$.]
] <prop:generic-jets>

#proof[
  Take the graded family $S_N$ and simplex $P_0 = Delta \( a_1 \, dots.h \, a_n \)$ from Proposition 8.
    Thus $product_j a_j = V$, the support $S_N$ lies in $N P_0$, and
  $ \# S_N = frac(V, n !) N^n + o \( N^n \) . $
  Let $ell = min_j a_j$, and choose $r_0$ so large that
  $ w := (V / r)^(1 \/ n) < ell / 100 wide \( r gt.eq r_0 \) . $
  Fix one such $r$. Reshape the first two intercepts to $\( w \, a_1 a_2 \/ w \)$,
    then reshape the second and third intercepts, and continue through the $\( n - 1 \)$st and $n$th intercepts.
    At every step, both intercepts $A \, B$ being reshaped are at least $ell$:
    untouched intercepts have this property, and the carried intercept $A B \/ w$ is larger than $A$ because $B >
    w$. Consequently
  $ w max \( 3 \/ A \, 2 \/ B \) lt.eq frac(3 w, ell) < 1 / 16 \, $
  as required by Proposition 9. The product of all intercepts remains $V$.
    The resulting graded family $F_N$ therefore satisfies
  #[#set math.equation(numbering: n => "(5.2)")
   $ & F_N subset N P_(*) ∩ bb(Z)^n \, wide P_(*) := Delta \( w \, dots.h \, w \, r w \) \,\
 & \# F_N = frac(V, n !) N^n + o \( N^n \) = "vol" \( P_(*) \) N^n + o \( N^n \) . $ <eq:elongated-full-density>]
  Here the last intercept is $V \/ w^(n - 1) = r w$. The transformations preserve backward jet transfer,
    so jet separation by $M \( F_N \)$ will imply jet separation by $H^0 \( X \, N L \)$.
  Fix $0 < theta < w$. To apply Lemma 12, we contract $P_(*)$ and then translate it away from the coordinate
    faces. Choose $lambda$ with $theta \/ w < lambda < 1$, and choose a vector $v in bb(R)_(> 0)^n$ small enough that
  $ v + lambda P_(*) subset "int" \( P_(*) \) . $
  For example, it suffices that $sum_(j < n) v_j \/ w + v_n \/ \( r w \) < 1 - lambda$.
    Choose vectors $v_N in N^(- 1) bb(Z)^n$ tending to $v$. For all sufficiently large $N$, the sets $v_N +
    lambda P_(*)$ lie in a common compact subset $K$ of $"int" \( P_(*) \)$. Applying Lemma 12 to (5.2) gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ N v_N + #scale(x: 120%, y: 120%)[\(] N lambda P_(*) ∩ bb(Z)^n #scale(x: 120%, y: 120%)[\)] subset F_N
     $ <eq:translated-inner-support>]
  for all sufficiently large $N$.
  Put $m = floor.l N theta floor.r$. Since $theta < lambda w$, we have $m + 1 lt.eq
    N lambda w$ for all sufficiently large $N$. The defining inequality (5.1) therefore gives
  $ E_m subset N lambda P_(*) ∩ bb(Z)^n . $
  Choose distinct $c_1 \, dots.h \, c_r in k^times$ and apply Lemma 13.
    Multiplication by the Laurent monomial with exponent $N v_N in
    bb(Z)^n$ is multiplication by a unit on the torus, hence induces an automorphism on every jet space.
    Thus (5.3) implies that $M \( F_N \)$ separates jets through order $m$ at these $r$ points.
    Backward jet transfer through all reshapings and Proposition 8 gives the asserted jet separation at an ordered
    tuple on $X$.
  For each fixed $r$, $theta$, and sufficiently large $N$, the locus in $U_r$ where this evaluation map is
    surjective is a nonempty open set, by the openness of jet separation established in Section 2.
    The variety $U_r$ is integral, so its generic point belongs to that open set.
    Base change of the jet evaluation map to $K_r$ preserves surjectivity and identifies its targets with the jets
    at $p_1 \, dots.h \, p_r$. The same geometric generic tuple therefore satisfies every required jet-separation
    statement. ◻
]

== 6 From jets to the Seshadri constant <sec:positivity>

The interpolation statement now gives the lower bound for the Seshadri constant.
  We first spell out the passage from jets to intersection numbers, including at singular points of a curve,
  and then recall the matching volume bound. The relation between asymptotic jet separation and Seshadri constants
  is classical; see #cite(label("Demailly1992")) Theorem 6.4 in the complex setting and
  #cite(label("MustataSchwede2014")) Section 2, Equation (2.3) in arbitrary characteristic.
  The arguments below work in arbitrary characteristic.

#thm([Lemma 6.1.])[
  (Jets and curve multiplicities).  #emph[Let $Y$ be a smooth integral projective variety over an algebraically
    closed field, let $A$ be a line bundle on $Y$, and let $q_1 \, dots.h \, q_r$ be distinct points.
    Suppose that $H^0 \( Y \, A \)$ separates jets through order $m gt.eq 1$ at these points.
    Then every integral curve $C subset Y$ meeting at least one of them satisfies
$ A dot.op C gt.eq m sum_(i = 1)^r "mult"_(q_i) C \, $

 where the multiplicity is zero at a point outside $C$.]
] <lem:jet-curve-bound>

#proof[
  Choose such a point $q_j$. Write $R = cal(O)_(C \, q_j)$ and let $frak(n)$ be its maximal ideal.
    The vector space $frak(n)^m \/ frak(n)^(m + 1)$ is nonzero:
    otherwise Nakayama’s lemma would give $frak(n)^m = 0$, contrary to $R$ being a one-dimensional local domain.
    In a local frame of $A$, lift a nonzero class in this vector space to an ambient jet of order $m$ at $q_j$.
    This lift can be chosen in the image of $frak(m)_(Y \, q_j)^m$.
    Prescribe that jet at $q_j$ and the zero jet at all other marked points.
    Jet separation produces a section $sigma in H^0 \( Y \, A \)$ which vanishes to order at least $m$ at every
    $q_i$ and whose restriction to $C$ is nonzero.
  For completeness, the local multiplicity estimate used here is
  #[#set math.equation(numbering: n => "(6.1)")
   $ "length"_R \( R \/ \( f \) \) gt.eq m thin e \( R \) wide \( 0 eq.not f in frak(n)^m \) \,
     $ <eq:local-zero-length>]
  where $e \( R \)$ denotes the Hilbert–Samuel multiplicity of a one-dimensional Noetherian local domain
    $\( R \, frak(n) \)$; see #cite(label("StacksProject")) Definition 43.15.1, Tag 0AZV.
    Indeed, for positive integers $t$, the nonzero divisor $f$ gives
  $ t "length"_R \( R \/ \( f \) \) = "length"_R \( R \/ \( f^t \) \) gt.eq "length"_R \( R \/ frak(n)^(m t) \) =
    m t thin e \( R \) + O \( 1 \) . $
  Divide by $t$ and let $t$ tend to infinity. Applying (6.1) to the local equations of $sigma \|_C$ at the marked
    points proves the inequality: the sum of all local zero lengths of a nonzero section of $A \|_C$ is
    $deg \( A \|_C \) = A dot.op C$. ◻
]

#thm([Lemma 6.2.])[
  (Volume bound).  #emph[Let $Y$ be a smooth integral projective variety of dimension $d gt.eq
    2$ over an algebraically closed field, let $A$ be ample, and let $q_1 \, dots.h \, q_r$ be distinct points. Then
$ inf_(C ∩ { q_1 \, dots.h \, q_r } eq.not diameter) frac(A dot.op C, sum_i "mult"_(q_i) C) lt.eq
  (A^d / r)^(1 \/ d) \, $

 where the infimum is over integral curves in $Y$.]
] <lem:volume-bound>

#proof[
  Denote the infimum by $epsilon$. If $epsilon = 0$, the conclusion is immediate. Otherwise, blow up the marked points:
  $ pi : tilde(Y) arrow.r Y \, wide E_1 \, dots.h \, E_r subset tilde(Y) . $
  For each rational number $0 lt.eq s < epsilon$, the divisor class
  $ D_s = pi^(*) A - s sum_i E_i $
  is nef. To check this on curves, first observe that $D_s \|_(E_i) = s cal(O)_(bb(P)^(d - 1)) \( 1 \)$,
    which has nonnegative degree on every curve in $E_i$. Every other integral curve in $tilde(Y)$ is the strict
    transform $tilde(C)$ of an integral curve $C subset Y$, and
  #[#set math.equation(numbering: n => "(6.2)")
   $ E_i dot.op tilde(C) = "mult"_(q_i) C . $ <eq:exceptional-multiplicity>]
  Thus $D_s dot.op tilde(C) gt.eq 0$ by the definition of $epsilon$;
    for curves missing all marked points this follows from the ampleness of $A$.
  Here is a local justification of (6.2), which also covers singular curves.
    If $q_i in C$, the Rees algebra construction identifies $tilde(C)$ with the blow-up of $C$ at the marked
    points. Indeed, the ambient Rees algebra surjects onto the Rees algebra of the restricted ideal.
    The latter is integral, and its Proj agrees with $C$ away from the centers,
    so its closed image is exactly the strict transform. For $R = cal(O)_(C \, q_i)$ with maximal ideal $frak(n)$,
    its exceptional fiber is
  $ "Proj" #scale(x: 120%, y: 120%)[\(] "gr"_(frak(n)) R #scale(x: 120%, y: 120%)[\)] . $
  It is the effective Cartier divisor cut out on $tilde(C)$ by $E_i$. Its length is $e \( R \)$:
    the Hilbert function $dim_(k \( q_i \)) \( frak(n)^t \/ frak(n)^(t + 1) \)$ equals $e \( R \)$ for all
    sufficiently large $t$, and its eventual value is the length of this zero-dimensional projective scheme.
    This proves (6.2); if $q_i in.not C$, both sides vanish.
  A nef class on a projective variety is a limit of ample classes and therefore has nonnegative top
    self-intersection. The exceptional divisors are disjoint, $pi^(*) A$ restricts trivially to each of them,
    and $E_i^d = \( - 1 \)^(d - 1)$. Consequently
  $ 0 lt.eq D_s^d = A^d - r s^d . $
  If $epsilon > \( A^d \/ r \)^(1 \/ d)$, even if $epsilon = + oo$,
    there is a rational number $s$ strictly between $\( A^d \/ r \)^(1 \/ d)$ and $epsilon$.
    The displayed inequality excludes such an $s$, proving the bound. ◻
]

#proof[
  Choose $r_0$ as in Proposition 14 and fix $r gt.eq r_0$. Put $V = L^n$ and $w = \( V \/ r \)^(1 \/ n)$.
    Work over $K_r$ at the geometric generic tuple $p_1 \, dots.h \, p_r$.
    For every fixed real number $0 < theta < w$ and all sufficiently large integers $N$,
    Proposition 14 gives separation of jets through order $m =
    floor.l N theta floor.r$ by $H^0 \( X_(K_r) \, L_(K_r)^(⊗ N) \)$ at this fixed tuple.
  For large $N$ we have $m gt.eq 1$, so Lemma 15 yields
  $ frac(L_(K_r) dot.op C, sum_i "mult"_(p_i) C) gt.eq frac(floor.l N theta floor.r, N) $
  for every integral curve in the defining infimum. Letting $N$ tend to infinity gives $epsilon_r \( X \, L \)
    gt.eq theta$. Since $theta < w$ was arbitrary, $epsilon_r \( X \, L \) gt.eq w$.
    Intersection numbers are unchanged by extension of the algebraically closed ground field,
    so $\( L_(K_r) \)^n = V$; Lemma 16 supplies the reverse inequality. ◻
]

#prodef([Remark 6.3.])[
  (Surfaces).  The same proof gives the conclusion of Theorem 1 when $n = 2$.
    Indeed, Propositions 8, 9, and 14 all allow $n = 2$; the reshaping is then performed just once,
    with no unchanged coordinates. Both intersection lemmas above also apply in dimension two.
] <rem:surfaces>

#bibliography("refs.bib", style: "ieee", title: [References])
