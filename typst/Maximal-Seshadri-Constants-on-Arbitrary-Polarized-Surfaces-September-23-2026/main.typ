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

#align(center)[#text(size: 16pt, weight: "bold")[Maximal Seshadri constants on arbitrary polarized surfaces]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $S$ be a smooth integral complex projective surface and $L$ an ample line bundle.
  We use additive notation for tensor powers and put $H = L^2$.
  For a tuple of distinct points $upright(bold(p)) = \( p_1 \, dots.h \, p_r \)$, the multipoint Seshadri constant is

$ epsilon \( S \, L \; upright(bold(p)) \) = inf_C frac(L dot.op C, sum_(i = 1)^r "mult"_(p_i) C) \, $

where $C$ ranges over integral curves meeting at least one of the points.
  If $pi : Y arrow.r S$ is the blow-up of these points, with exceptional curves $E_1 \, dots.h \, E_r$,
  the same constant is the largest $lambda gt.eq 0$ for which $pi^(*) L - lambda sum_i E_i$ is nef.
  Here a real divisor class is #emph[nef] if it has nonnegative intersection with every integral curve.
  This constant measures how much of the positivity of $L$ remains after subtracting equal exceptional weights at
  the chosen points. Its universal bound is

#[#set math.equation(numbering: n => "(1.1)")
 $ epsilon \( S \, L \; upright(bold(p)) \) lt.eq sqrt(H / r) \; $ <eq:upper-bound>]

an elementary jet-count proof appears in Lemma 16.

Write

$ U_r = { \( p_1 \, dots.h \, p_r \) in S^r : p_i eq.not p_j upright(" for ") i eq.not j } . $

A property holds at #emph[very general] tuples if its failures are contained in a countable union of proper
  Zariski-closed subsets of $U_r$.

#thm([Theorem 1.1.])[
  #emph[For every smooth integral complex projective surface $S$ and every ample line bundle $L$ on $S$,
    there is an integer $r_0 = r_0 \( S \, L \)$ with the following property.
    For each integer $r gt.eq r_0$, there is a countable union $Z_r$ of proper Zariski-closed subsets of $U_r$,
    with nonempty complement, such that for every $upright(bold(p)) in U_r \\ Z_r$ the class
$ pi^(*) L - sqrt(L^2 / r) sum_(i = 1)^r E_i $

 is nef on the blow-up at $upright(bold(p))$. Consequently,
$ epsilon \( S \, L \; upright(bold(p)) \) = sqrt(L^2 / r) . $

]
] <thm:main>

Theorem 1 resolves positively the qualitative Nagata–Biran conjecture for surfaces,
  also called the qualitative Nagata–Biran–Szemberg conjecture.
  The threshold is allowed to depend on the polarized surface.
  The conclusion concerns the nef boundary class of self-intersection zero.
  Thus it excludes every curve whose ratio of degree to total point multiplicity falls below the numerical bound,
  even when those multiplicities are unequal. The sharp threshold $r gt.eq
  10$ and strict nonhomogeneous inequality in the plane Nagata problem at very general complex points are a
  separate refinement, proved in #cite(label("OpenAINagata2026")) Theorem 1.1.
  Corollary 17 extends eventual maximality to uncountable algebraically closed fields of characteristic zero.

=== 1.1 Background <background>

Nagata formulated his plane conjecture in his work on Hilbert’s fourteenth problem and proved its strict
  multiplicity inequality when the number of points is a square at least $16$ #cite(label("Nagata1959"));
  see also #cite(label("Nagata1965")) Chapter III, Section 1, Proposition 1.
  Multipoint Seshadri constants place that problem in the geometry of arbitrary polarized surfaces.
  The qualitative formulation asks for equality in (1.1) for every sufficiently large integer $r$;
  see Syzdek–Szemberg #cite(label("SyzdekSzemberg2010")) Conjecture 4.3.
  Strycharz-Szemberg–Szemberg #cite(label("StrycharzSzemberg2004")) Conjecture 2.1 formulate a stronger prediction
  specifying the threshold in terms of a linear system on the surface.

Biran’s stability theorem gives full symplectic packings for sufficiently large numbers of equal balls,
  for rational symplectic classes on closed four-manifolds #cite(label("Biran1999"));
  see also #cite(label("Biran2001")) Theorem 6.3. Buse–Hind–Opshtein subsequently proved strong packing stability,
  allowing unequal sufficiently small balls, for all closed symplectic four-manifolds
  #cite(label("BuseHindOpshtein2016")) Theorem 1. The algebraic statement asks for nefness on blow-ups of the
  fixed complex surface. Its packing interpretation uses Kähler forms,
  as made precise by Eckl #cite(label("Eckl2017")) Theorem 0.5;
  symplectic packing stability alone does not fix the required complex structure.

On the algebraic side, Harbourne’s estimates include maximality for all sufficiently large $r$ with $r
  L^2$ a square, as well as asymptotic lower bounds #cite(label("Harbourne2003")) Theorem I.1 and Proposition I.2.
  The stated results assume very ampleness; for an ample $L$,
  apply them to a very ample power $a L$ and use $epsilon \( S \, a L \; upright(bold(p)) \) =
  a epsilon \( S \, L \; upright(bold(p)) \)$. For these square values of $r L^2$,
  intersecting over $bb(C)$ the countably many open loci for bounds approaching the maximum gives equality at very
  general tuples. Assuming maximality for the corresponding plane constant,
  Roé’s transfer gives the maximal bound when the surface has a point with maximal one-point Seshadri constant
  #cite(label("Roe2004")) Theorem 3 and Corollary 7. The multipoint product inequality,
  due to Biran for surfaces and stated in greater generality by Roé–Ross,
  propagates maximality from a fixed configuration to suitable multiples of its size when the corresponding plane
  constants are maximal #cite(label("RoeRoss2009")) Theorem 1.1 and Remark 1.2.
  Our argument treats arbitrary ample polarizations and all integers beyond one threshold directly.

There is also a distinction between eventual maximality and exact values on particular surfaces.
  Dionne–Roth compute multipoint constants for substantial families of polarizations on $bb(P)^1 times
  bb(P)^1$ #cite(label("DionneRoth2025")). The recent preprint of Laface–Ugaglia #cite(label("LafaceUgaglia2026"))
  Theorem 1 claims the maximal irrational value $1 \/ sqrt(5)$ for $cal(O) \( 1 \, 1 \)$ at ten very general
  points of that surface. These fixed-surface and fixed-point-count results address a different question from the
  uniform eventuality in Theorem 1.

=== 1.2 Proof overview <proof-overview>

The proof turns the problem into finite interpolation on the algebraic torus $\( bb(C)^times \)^2$.
  An #emph[injective jet test of order $m$] on a vector space of functions means that only the zero function
  vanishes to order at least $m$ at all the test points. We will show that,
  for every sufficiently large $r$ and all positive integers $k \, m$ with $m > k sqrt(H \/ r)$,
  the sections of $k L$ admit such a test at some $r$ distinct surface points.
  The threshold in $r$ must work for arbitrarily large jet orders.
  This uniformity is different from the asymptotic postulation theorem of Alexander–Hirschowitz
  #cite(label("AlexanderHirschowitz2000")) Theorem 1.1 and Corollary 1.2,
  where the degree threshold depends on a fixed bound for the point multiplicities.

Section 2 establishes the transfer principle: a full-rank jet matrix for the initial Taylor monomials remains full
  rank after a sufficiently small analytic rescaling. We then choose one integral divisor $V in \| d
  L \|$ with an ordinary node. In local coordinates its two branches are the coordinate axes.
  The intersection number $k L dot.op V$ bounds the least Taylor exponent of a section under weights
  $\( 1 \, t \)$, after any copies of $V$ are removed. The resulting exponents lie in a quadrilateral $k Q_t$.
  A change of torus coordinates, followed by compression of the slices parallel to $\( 1 \, 1 \)$,
  gives a triangle $k P_t$ of area $k^2 H \/ 2$ (Section 3).
  The slice compression has its own finite jet-matrix limit.
  Applying these two transfers in succession carries an injective torus test for this triangle to sections on the
  surface. Monomial diagrams and nonzero interpolation minors are central in Dumnicki’s diagram method
  #cite(label("Dumnicki2007")) Proposition 13 and Theorem 14;
  the particular weighted-exponent bound and diagonal compression needed here are proved in full.

The next step uses the continuously varying shape of $P_t$.
  The equality $"area" \( P_t \) = H \/ 2$ makes the torus jet threshold exactly $sqrt(H \/ r)$.
  For every sufficiently large integer $r$, we tune this shape to a primitive lattice direction and choose a
  subgroup of $\( bb(C)^times \)^2$ with exactly $r$ points.
  The subgroup is the kernel of two monomial equations with exponent lattice of index $r$;
  it need not be a square grid. The parameter $t$ and the subgroup are fixed before the jet orders $k \,
  m$ are chosen. Projection onto its characters reduces the jet test to a Laurent polynomial supported in a
  triangle of area $\( k w \)^2 \/ 2$ and vertical range $k w$, where $w = sqrt(H \/ r)$.
  An elementary estimate using horizontal slices bounds its multiplicity at the identity by $k w$ (Section 4).

Finally, the transferred surface tuple can depend on $k \, m$, but injectivity is a Zariski-open rank condition.
  Countably many such conditions give simultaneous tests at very general tuples.
  To pass from equal vanishing orders to all curves, suppose that a curve has negative intersection with the
  square-zero boundary class. Subtracting a small multiple of that curve and making a rational perturbation
  produces a positive-square divisor beyond the boundary. Riemann–Roch makes a multiple effective;
  adding back the curve yields a section with equal vanishing orders larger than the critical slope,
  contradicting the jet tests (Section 5).

== 2 Finite jet tests and initial monomials <sec:jets>

We first explain how an injective jet test for initial monomials gives an injective jet test for the original
  holomorphic functions. The argument uses finite matrices and convergent power series.

For a holomorphic function $f$ near a point $q$ of a smooth complex surface,
  write $"ord"_q \( f \)$ for its order of vanishing, with $"ord"_q \( 0 \) = oo$.
  In local coordinates, $"ord"_q \( f \) gt.eq m$ means that all partial derivatives of total order less than $m$
  vanish at $q$. For distinct points $bold(q) = \( q_1 \, dots.h \, q_r \)$ and a finite-dimensional space $F$ of
  functions defined near them, its #emph[order-$m$ jet map] is

$ J_(bold(q))^m : F arrow.r xor.big_(j = 1)^r cal(O)_(q_j) \/ frak(m)_(q_j)^m \, wide
  f mapsto \( f med mod med frak(m)_(q_j)^m \)_(j = 1)^r . $

Here $cal(O)_(q_j)$ is the ring of holomorphic germs at $q_j$,
  and $frak(m)_(q_j)$ is its ideal of germs vanishing there.
  We call the corresponding jet test #emph[injective] when this map is injective,
  or equivalently when no nonzero $f in F$ vanishes to order at least $m$ at every $q_j$.
  In two local coordinates, the matrix of this map records the derivatives of total order less than $m$ of a basis
  of $F$; it has $r binom(m + 1, 2)$ rows. Its injectivity is exactly full column rank.

The same definition applies to sections of a line bundle using local frames.
  Multiplication by a holomorphic unit induces an invertible map on each jet quotient,
  so the definition is independent of those frames. A biholomorphic change of coordinates preserves the powers of
  the maximal ideal and hence preserves orders of vanishing and jet injectivity.

Finite matrices also underlie monomial diagram methods for plane interpolation #cite(label("Dumnicki2007"))
  Propositions 10 and 13. The transfer below applies to convergent local functions and follows from persistence of
  one nonzero maximal minor.

#thm([Lemma 2.1.])[
  (Persistence of a finite jet test).  #emph[Let $m \, r \, N$ be positive integers and let $q_1 \, dots.h \,
    q_r$ be distinct points of an open subset $U subset bb(C)^2$.
    For $1 lt.eq i lt.eq N$ and $0 lt.eq s < s_0$, let $f_(i \, s)$ be holomorphic on $U$.
    Suppose that, as $s arrow.b 0$, every derivative of $f_(i \, s)$ of total order less than $m$ at each $q_j$
    converges to the corresponding derivative of $f_(i \, 0)$.
    If the jet matrix of $f_(1 \, 0) \, dots.h \, f_(N \, 0)$ has column rank $N$,
    then the jet matrix of $f_(1 \, s) \, dots.h \, f_(N \, s)$ also has column rank $N$ for all sufficiently
    small positive $s$.]
  #emph[In particular, convergence locally uniformly on $U$ suffices for the derivative hypothesis.]
] <lem:rank-persistence>

#proof[
  A nonzero $N times N$ minor of the limiting jet matrix remains nonzero for all sufficiently small $s$,
    since each of its entries converges. The final assertion follows from the Cauchy integral formula on small
    polydiscs around the finitely many points. ◻
]

For a bounded set $Omega subset bb(R)^2$, denote by

$ cal(M) \( Omega \) = "span"_(bb(C)) { x^alpha z^beta : \( alpha \, beta \) in Omega ∩ bb(Z)^2 } $

the finite-dimensional space of Laurent polynomials on the torus $\( bb(C)^times \)^2$.
  When another pair of torus coordinates is specified, the same notation uses that pair in place of $\( x \, z \)$.

We now consider convergent power series at the origin. Fix $t > 0$ and order pairs $\( alpha \, beta \) in
  bb(Z)_(gt.eq 0)^2$ lexicographically by

$ \( alpha + t beta \, beta \) . $

Every bounded interval of weights contains only finitely many exponent pairs.
  Thus each nonzero series $f in bb(C) { x \, z }$ has a first nonzero exponent in this order,
  denoted by $nu_t \( f \)$. For a finite-dimensional subspace $F subset bb(C) { x \, z }$, put

$ E_t \( F \) = { nu_t \( f \) : 0 eq.not f in F } . $

#thm([Proposition 2.2.])[
  (Transfer from initial monomials).  #emph[Let $F subset bb(C) { x \,
    z }$ be a finite-dimensional complex vector space of convergent holomorphic germs, and let $t > 0$.
    The set $E_t \( F \)$ has exactly $dim F$ elements, and $F$ admits a basis whose initial exponents are these
    distinct elements.]
  #emph[Let $r \, m$ be positive integers. If the monomial space
$ "span"_(bb(C)) { X^alpha Z^beta : \( alpha \, beta \) in E_t \( F \) } $

 has an injective order-$m$ jet test at some distinct points $q_1 \, dots.h \, q_r in \( bb(C)^times \)^2$,
   then representatives of $F$ on a common neighborhood of the origin have an injective order-$m$ jet test at
   distinct points arbitrarily close to the origin.]
] <prop:initial-transfer>

#proof[
  The statement is immediate if $F = 0$, so write $N = dim F > 0$.
  #emph[Choose a basis with distinct initial terms.] Among the initial exponents of nonzero elements of $F$,
    choose the least one, $e_1$. Every element of $F$ has zero coefficient at every earlier exponent.
    The coefficient at $e_1$ is a nonzero linear functional on $F$.
    Choose $f_1$ on which it equals $1$, and continue inside its codimension-one kernel.
    After $N$ steps this gives a basis $f_1 \, dots.h \, f_N$ with strictly increasing initial exponents
    $e_i = \( alpha_i \, beta_i \)$ and initial coefficients $1$.
    In a nonzero linear combination of the basis vectors, the first vector with nonzero coefficient supplies its
    uncancelled initial term. Consequently $E_t \( F \) = { e_1 \, dots.h \, e_N }$.
  #emph[Separate the initial terms by a single positive weight.] Set
  $ M = 1 + max_(1 lt.eq i lt.eq N) \( alpha_i + t beta_i \) . $
  Choose a small number $eta > 0$. For $eta$ sufficiently small,
    all the weights $alpha_i + \( t + eta \) beta_i$ remain below $M$.
    Every term of old weight at least $M$ has new weight at least $M$, since its second exponent is nonnegative,
    so it cannot become a least term.
  Only finitely many exponent pairs have old weight below $M$.
    For a noninitial term of $f_i$ in this finite set, either its old weight is strictly greater than that of
    $e_i$, or its old weight is equal and its second exponent is strictly greater.
    In the first case the strict inequality persists for all sufficiently small $eta > 0$.
    In the second case increasing $t$ by $eta$ makes the new weight strictly greater.
    One common choice of $eta > 0$ therefore makes $e_i$ the unique term of least weight $\( 1 \, t' \)$ in every
    $f_i$, where $t' = t + eta$. Put
  $ lambda_i = alpha_i + t' beta_i . $
  #emph[Dilate the convergent series.] Choose representatives of the finitely many basis germs on a common
    polydisc, and define, for positive real $s$,
  $ g_(i \, s) \( X \, Z \) = s^(- lambda_i) f_i \( s X \, s^(t') Z \) . $
  These functions converge locally uniformly on $bb(C)^2$ to $X^(alpha_i) Z^(beta_i)$,
    in the sense that they are defined on any fixed compact set for all sufficiently small $s$.
    To verify the convergence, write $f_i \( x \, z \) = sum_(alpha \, beta) c_(i \, alpha \, beta) x^alpha
    z^beta$. Fix $R > 0$ and choose $0 < s_0 < 1$ so that the radii $\( s_0 R \, s_0^(t') R \)$ lie strictly
    inside a common polydisc of absolute Taylor convergence. Every supported exponent satisfies $alpha + t' beta -
    lambda_i gt.eq 0$, with equality only at $e_i$. For $0 < s lt.eq s_0$,
    the sum of uniform majorants for the rescaled terms on $\| X \| \, \| Z \| lt.eq R$ is
  $ sum_(alpha \, beta) \| c_(i \, alpha \, beta) \| s_0^(alpha + t' beta - lambda_i) R^(alpha + beta) =
    s_0^(- lambda_i) sum_(alpha \, beta) \| c_(i \, alpha \, beta) \| \( s_0 R \)^alpha \( s_0^(t') R \)^beta < oo . $
  Each noninitial term tends uniformly to zero. The summable majorant therefore proves the asserted uniform
    convergence. Applying this argument on a slightly larger polydisc and using the Cauchy integral formula gives
    convergence of all derivatives of any fixed finite order on the smaller polydisc.
  #emph[Transfer the jet test.] At the given points $q_j$, the limiting monomials have an injective jet test.
    Lemma 2 shows that the functions $g_(1 \, s) \, dots.h \,
    g_(N \, s)$ have an injective jet test at the same points for every sufficiently small positive $s$. The map
  $ D_s \( X \, Z \) = \( s X \, s^(t') Z \) $
  is invertible for each such $s$. Its images $p_j = D_s \( q_j \)$ are distinct,
    lie in the common coordinate neighborhood, and approach the origin.
    Pullback by $D_s$ preserves orders of vanishing at corresponding points.
    The nonzero scalar factors $s^(- lambda_i)$ change only the basis.
    Hence the original space $F$ has an injective order-$m$ jet test at $p_1 \, dots.h \, p_r$. ◻
]

The auxiliary weight $t'$ in this proof separates finitely many initial terms chosen using $t$;
  those exponents remain unchanged. Thus a bound for $E_t \( F \)$ in a fixed diagram is preserved throughout the
  argument. The weights and the positive real dilation parameter need not be rational,
  and the construction makes no assertion about their uniformity over different finite-dimensional spaces.

To apply Proposition 3 to global sections on $S$, choose local coordinates and a nonvanishing frame for the line
  bundle. Restriction to germs is injective: a section vanishing on a neighborhood vanishes everywhere by the
  identity principle on the connected surface. A change of frame multiplies each germ by a holomorphic unit,
  whose nonzero constant term preserves its initial exponent.
  In particular, if all the initial exponents lie in a bounded set $Omega subset bb(R)_(gt.eq 0)^2$,
  an injective jet test for the larger space $cal(M) \( Omega \)$ suffices for the transfer.

== 3 A nodal divisor and its exponent diagram <sec:node>

We now bound the initial exponents of sections of an ample line bundle by intersecting their divisors with one
  fixed nodal curve. Varying the weight in the two branch coordinates produces a family of quadrilaterals.
  The next subsection will compress these diagrams to triangles.
  The variable Newton–Okounkov quadrilaterals of Ciliberto, Farnik, Küronya, Lozovanu, Roé,
  and Shramov #cite(label("CFKLRS2016")) Section 5.1 and Corollary 5.8 suggested this weighted-diagram approach.
  The nodal bound on an arbitrary polarized surface and the diagonal compression used here are proved directly;
  the plane corollary in that source is not a premise.

#thm([Lemma 3.1.])[
  (A nodal ample divisor).  #emph[Let $S$ be a smooth integral complex projective surface and let $L$ be an ample
    line bundle. There exist a positive integer $d$, an integral divisor $V in \| d L \|$,
    and a point $p in V$ such that $V$ is smooth away from $p$ and has two smooth transverse analytic branches at $p$.]
] <lem:node>

#proof[
  Choose an integer $e > 0$ such that $e L$ is very ample, embed $S$ in $bb(P)^N$ using this line bundle,
    and choose any $p in S$. Take homogeneous coordinates with $p = \[ 1 : 0 : dots.h.c : 0 \]$.
    The restrictions of $X_1 \, dots.h \, X_N$ generate $cal(I)_p ⊗ cal(O)_S \( e L \)$:
    away from $p$ at least one is nonzero, and near $p$ their ratios with $X_0$ generate the maximal ideal because
    the embedding is a closed immersion.
  Let $pi : X = "Bl"_p S arrow.r S$ be the blow-up, with exceptional curve $E$.
    The generators just described give a surjection onto the twisted Rees algebra
  $ "Sym"^bullet \( cal(O)_S^(xor N) \) arrow.r xor.big_(n gt.eq 0) cal(I)_p^n ⊗ cal(O)_S \( n e L \) . $
  Taking relative $"Proj"$ gives a closed immersion $X arrow.r.hook S times bb(P)^(N - 1)$,
    the closure of the graph of projection from $p$. The second factor pulls $cal(O) \( 1 \)$ back to
    $cal(O)_X \( e pi^(*) L - E \)$; see also #cite(label("Stacks")) Tag 01OF.
    After embedding the first factor in $bb(P)^N$, the very ample bundle $cal(O) \( 1 \, 1 \)$ therefore restricts to
  $ cal(A) = cal(O)_X \( 2 e pi^(*) L - E \) . $
  In particular, $cal(A)^(⊗ 2) = cal(O)_X \( 4 e pi^(*) L - 2 E \)$ is very ample.
  The point blow-up $X$ is a smooth integral projective surface.
    By Bertini, a general divisor $tilde(V)$ in this last linear system is smooth and integral
    #cite(label("Stacks")) Tags 0FD6 and 0G4F. We may also require that it meet $E$ transversely at two distinct
    points. Indeed, $cal(A) \|_E tilde.eq cal(O)_(bb(P)^1) \( 1 \)$,
    and the restrictions of its global sections generate this bundle,
    hence span its full two-dimensional space of sections. Products of these sections show that
  $ H^0 \( X \, cal(A)^(⊗ 2) \) arrow.r H^0 \( E \, cal(O)_(bb(P)^1) \( 2 \) \) $
  is surjective. Having two distinct zeros on $E$ is consequently a nonempty open condition,
    which can be imposed along with the Bertini conditions.
  Set $d = 4 e$ and $V = pi \( tilde(V) \)$. Pushing down the divisor class shows that $V in \| d L \|$,
    and $V$ is integral because $tilde(V)$ is. The blow-down is an isomorphism away from $E$,
    so $V$ is smooth away from $p$. In a local blow-up chart the map has the form $\( a_0 \, u_0 \)
    mapsto \( a_0 \, a_0 u_0 \)$ with $E = { a_0 = 0 }$. A curve transverse to $E$ has $a_0$ as a local parameter,
    and its image is a smooth branch. The two different points of $tilde(V) ∩
    E$ give different tangent directions. Thus the two image branches are smooth and transverse at $p$. ◻
]

Fix $d \, V \, p$ as in Lemma 4, and set $H = L^2$. Choose holomorphic coordinates $\( x \, z \)$ at $p$ in which
  the two branches are the coordinate axes, and choose a nonvanishing local frame of $L$.
  In this frame a defining section $tau in H^0 \( S \, d L \)$ of $V$ has the form

#[#set math.equation(numbering: n => "(3.1)")
 $ tau = u \( x \, z \) x z \, wide u \( 0 \, 0 \) eq.not 0 . $ <eq:node-unit>]

Here and below a section is identified with its local function in the chosen frame and its tensor powers.

Choose once and for all $T > 1$ so large that

#[#set math.equation(numbering: n => "(3.2)")
 $ \( 1 + t \)^2 > d^2 H t wide upright("for every ") t > T . $ <eq:weight-range>]

Such a choice is possible because the left side is quadratic in $t$. For $t > T$, put

#[#set math.equation(numbering: n => "(3.3)")
 $ c = 1 / d \, wide W = d H \, wide a = frac(W t, 1 + t) \, wide b = frac(W, 1 + t) \,\
Q_t = "conv" { \( 0 \, 0 \) \, \( a \, 0 \) \, \( c \, c \) \, \( 0 \, b \) } . $ <eq:quadrilateral>]

Recall that $nu_t \( f \)$ denotes the first nonzero Taylor exponent of $f$ when exponents $\( alpha \, beta \)$
  are ordered by $\( alpha + t beta \, beta \)$. The inequality (3.2) is equivalent to $c \/ a + c \/ b > 1$.
  Thus $\( c \, c \)$ lies beyond the side joining $\( a \, 0 \)$ and $\( 0 \, b \)$,
  and the four vertices in (3.3) occur in the displayed cyclic order.

#thm([Proposition 3.2.])[
  (The quadrilateral bound).  #emph[For the surface, line bundle, nodal divisor,
    coordinates and frame fixed above, every integer $k gt.eq 1$, every $t > T$,
    and every nonzero $s in H^0 \( S \, k L \)$ satisfy
$ nu_t \( s \) in k Q_t . $

 Moreover, $H^0 \( S \, k L \)$ has a basis with pairwise distinct initial exponents in $k Q_t$;
   the basis is empty if this section space is zero.]
] <prop:quadrilateral>

#proof[
  First suppose that the divisor $D$ of $s$ does not contain $V$,
    and write $f \( x \, z \)$ for its local function. Neither $f \( x \, 0 \)$ nor $f \( 0 \, z \)$ vanishes
    identically. To see this, $D ∩ V$ is a proper closed subset of the integral algebraic curve $V$,
    hence is finite. An identically vanishing branch restriction would put an entire analytic branch in this
    finite set. This argument uses the global integrality of $V$ without asserting that its nodal analytic germ is
    irreducible.
  Let $ell_x = "ord"_0 f \( x \, 0 \)$ and $ell_z = "ord"_0 f \( 0 \, z \)$,
    and let $v$ be the weight of $nu_t \( f \)$. The pure terms defining these two finite orders have weights
    $ell_x$ and $t ell_z$, respectively. Therefore $ell_x gt.eq v$ and $ell_z gt.eq v \/ t$.
    Intersection multiplicity is additive over the two smooth branches, so
  #[#set math.equation(numbering: n => "(3.4)")
   $ v (1 + 1 / t) lt.eq ell_x + ell_z = I_p \( D \, V \) lt.eq D dot.op V = k d H . $ <eq:branch-bound>]
  The analytic computation gives the algebraic local intersection number:
    both are the colength of $\( f \, x z \)$ in the common completed local ring $bb(C) \[ \[ x \, z \] \]$.
    The final inequality in (3.4) follows from nonnegativity of all the other local intersection numbers.
    Consequently $v lt.eq k a$, and
  #[#set math.equation(numbering: n => "(3.5)")
   $ nu_t \( s \) in k Delta_t \, wide Delta_t = "conv" { \( 0 \, 0 \) \, \( a \, 0 \) \, \( 0 \, b \) } \,
     $ <eq:residual-triangle>]
  since $a = t b$.
  For a general nonzero $s$, let $j$ be the coefficient of $V$ in its divisor.
    Dividing by the defining section of this effective Cartier divisor gives
  $ s = tau^j rho \, wide rho in H^0 \( S \, n L \) \, wide n = k - j d \, $
  where the effective divisor $R$ of $rho$ does not contain $V$.
    Intersecting with the ample line bundle gives $n H = L dot.op R gt.eq 0$, so $n gt.eq 0$.
    If $n = 0$, then $R = 0$ by ampleness and $rho$ is a nonzero constant, since $S$ is integral and projective.
    If $n > 0$, the preceding argument gives $nu_t \( rho \) in n Delta_t$.
  The order on exponents is compatible with addition, so initial exponents add under multiplication.
    A unit has initial exponent $\( 0 \, 0 \)$. Equation (3.1) therefore yields
  $ nu_t \( s \) = \( j \, j \) + nu_t \( rho \) . $
  When $n > 0$, this implies
  $ frac(nu_t \( s \), k) = n / k thin frac(nu_t \( rho \), n) + frac(j d, k) \( c \, c \) in Q_t \, $
  because the two coefficients are nonnegative and sum to one.
    When $n = 0$, the normalized exponent equals $\( c \, c \)$ directly.
  Finally, restriction to the analytic chart is injective on global sections, by the identity theorem.
    Apply the finite coefficient elimination in Proposition 3 to this finite-dimensional space of germs.
    It gives a basis with distinct initial exponents, each of which satisfies the bound just proved. ◻
]

Proposition 5 controls the initial exponents; it makes no claim about the remaining Taylor coefficients.
  We next use slices parallel to $\( 1 \, 1 \)$ to replace its quadrilateral by a triangle for the purpose of
  testing jets.

=== 3.1 Compressing diagonal slices <sec:compression>

The quadrilateral in Proposition 5 bounds the initial exponents of sections.
  We next reduce its jet tests to those of the triangle

$ P_t = "conv" { \( - b \, 0 \) \, \( a \, 0 \) \, \( 0 \, c \) } . $

Since $a + b = d H$ and $c = 1 \/ d$, this triangle has area $c \( a + b \) \/ 2 = H \/ 2$.
  The reduction preserves the length of each diagonal slice and moves its lower endpoint to height zero.
  Throughout this subsection we test the full monomial spaces $cal(M) \( k Q_t \)$ and $cal(M) \( k P_t \)$.
  The initial monomials of sections need only span a subspace of the former.

#thm([Lemma 3.3.])[
  (Diagonal slices).  #emph[For $- b lt.eq q lt.eq a$, the slice of $Q_t$ on the line $alpha - beta =
    q$ has length in the $beta$ coordinate equal to
$ ell_t \( q \) =
  cases(delim: "{", c \( 1 + q \/ b \) \, & - b lt.eq q lt.eq 0 \,, c \( 1 - q \/ a \) \, & 0 lt.eq q lt.eq a .) $

 There are no slices outside this interval, and
$ P_t = { \( q \, h \) : - b lt.eq q lt.eq a \, med 0 lt.eq h lt.eq ell_t \( q \) } . $

]
] <lem:slices>

#proof[
  The strict inequality defining $t$ is equivalent to
  $ c \( a + b \) > a b . $
  Thus $\( c \, c \)$ lies strictly beyond the segment joining $\( a \, 0 \)$ to $\( 0 \, b \)$,
    on the side away from the origin. In the coordinates $\( q \, beta \) = \( alpha - beta \, beta \)$,
    the four vertices of $Q_t$, in cyclic order, are
  $ \( 0 \, 0 \) \, quad \( a \, 0 \) \, quad \( 0 \, c \) \, quad \( - b \, b \) . $
  For $0 lt.eq q lt.eq a$, the slice runs from $beta = 0$ to $beta = c \( 1 - q \/ a \)$.
    For $- b lt.eq q lt.eq 0$, it runs from
  $ beta = - q wide upright("to") wide beta = c + frac(c - b, b) q . $
  Subtracting the endpoints gives the stated formula. The region below this tent is precisely $P_t$,
    as illustrated in Figure 1. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (2.752, 0), (0, 2.16), (-1.376, 1.44), close: true, fill: rgb("#ecf0f3"), stroke: none)
  line((-1.72, 0), (3.139, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((3.139, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$q$]]], anchor: "west", padding: 0.1176cm)
  line((0, -0.108), (0, 2.79), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((0, 2.79), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$beta$]]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (2.752, 0), (0, 2.16), (-1.376, 1.44), close: true, stroke: (paint: rgb("#28587d"), thickness: 0.8pt, cap: "round", join: "round"))
  line((-0.688, 0), (-0.688, 0.72), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((-0.688, 0.72), (-0.688, 1.8), stroke: (paint: rgb("#a1501c"), thickness: 2.0pt, cap: "round", join: "round"))
  line((-0.7998, 0.72), (-0.5762, 0.72), (-0.7998, 1.8), (-0.5762, 1.8), stroke: (paint: rgb("#a1501c"), thickness: 0.4pt, cap: "round", join: "round"))
  content((-1.72, 0.558), [#text(fill: rgb("#a1501c"))[#text(size: 9pt)[$ell_t(q)$]]])
  line((-1.393, 0.702), (-0.8084, 1.206), stroke: (paint: rgb("#a1501c"), thickness: 0.4pt, cap: "round", join: "round"))
  content((-0.473, 0.684), [#box(inset: 0.04586cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$-q$]]])], anchor: "west")
  merge-path({line((0, 0), (2.752, 0)); line((2.752, 0), (0, 2.16)); line((0, 2.16), (-1.376, 1.44))}, close: false, fill: black, stroke: none)
  circle((0, 0), radius: 0.04233, fill: black, stroke: none)
  circle((2.752, 0), radius: 0.04233, fill: black, stroke: none)
  circle((0, 2.16), radius: 0.04233, fill: black, stroke: none)
  circle((-1.376, 1.44), radius: 0.04233, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$(0,0)$]], anchor: "north-west", padding: 0.1058cm)
  content((2.752, 0), [#text(size: 9pt)[$(a,0)$]], anchor: "north", padding: 0.1058cm)
  content((0, 2.16), [#text(size: 9pt)[$(0,c)$]], anchor: "south-east", padding: 0.1058cm)
  content((-1.376, 1.44), [#text(size: 9pt)[$(-b,b)$]], anchor: "south-east", padding: 0.1058cm)
  content((-0.688, 0), [#text(size: 9pt)[$q<0$]], anchor: "north", padding: 0.1058cm)
  content((0.602, -0.792), [#text(size: 9pt)[$Q_t$ in $(q, beta )$ coordinates]])
  line((3.44, 1.125), (4.3, 1.125), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: black)))
  line((4.988, 0), (9.116, 0), (6.364, 2.16), close: true, fill: rgb("#ecf0f3"), stroke: none)
  line((4.644, 0), (9.503, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((9.503, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$q$]]], anchor: "west", padding: 0.1176cm)
  line((6.364, -0.108), (6.364, 2.79), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((6.364, 2.79), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$h$]]], anchor: "south", padding: 0.1176cm)
  line((4.988, 0), (9.116, 0), (6.364, 2.16), close: true, stroke: (paint: rgb("#28587d"), thickness: 0.8pt, cap: "round", join: "round"))
  line((5.676, 0), (5.676, 1.08), stroke: (paint: rgb("#a1501c"), thickness: 2.0pt, cap: "round", join: "round"))
  line((5.564, 0), (5.788, 0), (5.564, 1.08), (5.788, 1.08), stroke: (paint: rgb("#a1501c"), thickness: 0.4pt, cap: "round", join: "round"))
  content((4.644, 0.747), [#text(fill: rgb("#a1501c"))[#text(size: 9pt)[$ell_t(q)$]]])
  line((5.014, 0.747), (5.556, 0.576), stroke: (paint: rgb("#a1501c"), thickness: 0.4pt, cap: "round", join: "round"))
  merge-path({line((4.988, 0), (9.116, 0)); line((9.116, 0), (6.364, 2.16))}, close: false, fill: black, stroke: none)
  circle((4.988, 0), radius: 0.04233, fill: black, stroke: none)
  circle((9.116, 0), radius: 0.04233, fill: black, stroke: none)
  circle((6.364, 2.16), radius: 0.04233, fill: black, stroke: none)
  content((4.988, 0), [#text(size: 9pt)[$(-b,0)$]], anchor: "north", padding: 0.1058cm)
  content((9.116, 0), [#text(size: 9pt)[$(a,0)$]], anchor: "north", padding: 0.1058cm)
  content((6.364, 2.16), [#text(size: 9pt)[$(0,c)$]], anchor: "south-east", padding: 0.1058cm)
  content((6.966, -0.792), [#text(size: 9pt)[$P_t$: each slice starts at height zero]])
})],
  caption: [Figure 1: Diagonal compression of exponent slices. For $c \( a + b \) > a b$, the change $q = alpha - beta$ turns $Q_t$ into the quadrilateral on the left. Moving each vertical slice down to height zero gives $P_t$, with the same slice length $ell_t \( q \)$. The highlighted slice has $q < 0$ and lower endpoint $- q$. This diagram describes the containing regions; the jet transfer is proved by convergence of finite jet matrices. ],
) <fig:compression>

#thm([Proposition 3.4.])[
  (Diagonal compression).  #emph[Let $k \, m \, r$ be positive integers.
    If $cal(M) \( k P_t \)$ has injective order-$m$ jets at some $r$ distinct points of $\( bb(C)^times \)^2$,
    then $cal(M) \( k Q_t \)$ has injective order-$m$ jets at some $r$ distinct points of $\( bb(C)^times \)^2$.]
] <prop:compression>

#proof[
  Use the torus coordinates
  $ \( x \, z \) = \( u \, v \/ u \) \, wide \( u \, v \) = \( x \, x z \) . $
  A monomial $x^alpha z^beta$ becomes $u^q v^beta$, where $q = alpha - beta$.
    For every nonempty integer slice $q$ of $k Q_t$, write
  $ beta_q^(-) = min { beta in bb(Z) : \( q + beta \, beta \) in k Q_t } \, wide beta_q^(+) =
    max { beta in bb(Z) : \( q + beta \, beta \) in k Q_t } . $
  Convexity of the slice implies that all integers between these endpoints occur. Hence the slice has the basis
  #[#set math.equation(numbering: n => "(3.6)")
   $ u^q v^(beta_q^(-)) \( v - 1 \)^h \, wide 0 lt.eq h lt.eq beta_q^(+) - beta_q^(-) . $ <eq:compression-row-basis>]
  Indeed, expanding $\( v - 1 \)^h$ gives a triangular change of basis from the consecutive powers of $v$,
    with diagonal entries equal to one. By Lemma 6,
  $ h lt.eq beta_q^(+) - beta_q^(-) lt.eq k ell_t \( q \/ k \) . $
  Consequently every pair $\( q \, h \)$ in (3.6) belongs to $k P_t ∩ bb(Z)^2$.
    These pairs are distinct, both within each slice and between different slices.
  Let $\( u_i \, y_i \)$, $1 lt.eq i lt.eq r$, be distinct torus points giving an injective jet test for
    $cal(M) \( k P_t \)$, now written in the variables $\( u \, y \)$.
    For a positive parameter $s$, substitute $v = 1 + s y$ into (3.6) and divide its member indexed by $h$ by
    $s^h$. The resulting functions are
  #[#set math.equation(numbering: n => "(3.7)")
   $ u^q \( 1 + s y \)^(beta_q^(-)) y^h arrow.r u^q y^h wide \( s arrow.r 0^(+) \) . $ <eq:compression-limit>]
  The convergence is locally uniform, with every spatial derivative,
    on fixed neighborhoods of the finitely many test points. To see this,
    choose bounded neighborhoods on which $u$ stays away from zero and then take $s$ small enough that $\| s
    y \| < 1 \/ 2$ there. The factors $\( 1 + s y \)^(beta_q^(-))$ are holomorphic and converge uniformly to one
    on slightly larger neighborhoods, so the derivative assertion follows from the Cauchy estimates.
    The argument also applies to negative Laurent powers, since $1 + s y$ stays away from zero.
  The distinct limiting monomials in (3.7) span a subspace of $cal(M) \( k P_t \)$,
    so their jet matrix has full column rank. Lemma 2 gives the same conclusion for the functions on the left for
    every sufficiently small positive $s$. These functions form a rescaled pullback of a basis of $cal(M) \( k Q_t \)$.
  For such an $s$, the corresponding points in the original torus are
  $ (u_i \, frac(1 + s y_i, u_i)) \, wide 1 lt.eq i lt.eq r . $
  They lie in $\( bb(C)^times \)^2$ because $u_i eq.not 0$ and $1 + s y_i eq.not 0$. They are distinct:
    equality of two images forces equality first of their $u$ coordinates and then of their $y$ coordinates.
    The coordinate map
  $ \( u \, y \) mapsto (u \, frac(1 + s y, u)) $
  has Jacobian determinant $s \/ u eq.not 0$, and therefore preserves orders of vanishing at these points.
    The full-column-rank conclusion is thus exactly the required injectivity for $cal(M) \( k Q_t \)$. ◻
]

The two transfers now give the test needed on the surface.

#thm([Corollary 3.5.])[
  (From the triangle to the surface).  #emph[Let $k \, m \, r$ be positive integers.
    If $cal(M) \( k P_t \)$ has injective order-$m$ jets at some $r$ distinct torus points,
    then $H^0 \( S \, k L \)$ has injective order-$m$ jets at some $r$ distinct points of $S$.]
] <cor:surface-transfer>

#proof[
  If $H^0 \( S \, k L \) = 0$, the conclusion is immediate.
    Otherwise, Proposition 7 gives such a jet test for $cal(M) \( k Q_t \)$.
    Trivialize $L$ in the fixed coordinate chart at the node and regard the sections of $k
    L$ as holomorphic germs there. This identification is injective:
    a global section vanishing on a nonempty open subset of the integral surface vanishes identically.
    Proposition 5 gives a basis whose distinct initial monomials lie in $k Q_t$.
    Their span therefore has injective jets at the torus tuple just constructed.
    Applying Proposition 3 gives injective jets for the section germs at distinct points in the chart,
    and hence for $H^0 \( S \, k L \)$ on $S$. ◻
]

== 4 Finite subgroups as jet tests <sec:lattice>

We now find an injective jet test for the triangle spaces $cal(M) \( k P_t \)$.
  The test points will form a finite subgroup of the complex torus.
  Averaging over this group separates a Laurent polynomial into components supported on cosets of a sublattice.
  In the coordinates of that sublattice, each component lies in a triangle for which a one-point multiplicity
  estimate applies.

=== 4.1 A multiplicity estimate for triangles <a-multiplicity-estimate-for-triangles>

Gundlach’s discussion of varying triangles #cite(label("Gundlach2021")) Section 6, Remark 28, Question 29,
  and Remark 30 motivated the search for continuously varying triangle interpolation tests.
  The multiplicity estimate used here is proved directly by slices and Laurent-polynomial factorization,
  not by a topological argument.

For a bounded subset of $bb(R)^2$, its #emph[vertical range] is the length of its projection onto the second
  coordinate axis. The following estimate allows arbitrary real vertices and translations.

#thm([Lemma 4.1.])[
  #emph[Let $rho > 0$, and let $Delta subset bb(R)^2$ be a triangle of area $rho^2 \/ 2$ and vertical range $rho$.
    Every nonzero Laurent polynomial $F in bb(C) \[ U^(plus.minus 1) \, Z^(plus.minus 1) \]$ whose exponent
    support is contained in $Delta$ satisfies
$ "ord"_(\( 1 \, 1 \)) F lt.eq rho . $

]
] <lem:triangle-multiplicity>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0.5192, 1.104), (1.298, 2.76), (2.643, 1.104), close: true, fill: rgb("#ecf0f3"), stroke: none)
  line((-0.413, 0), (4.307, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((4.307, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$y$]]], anchor: "west", padding: 0.1176cm)
  line((0, -0.1104), (0, 3.312), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((0, 3.312), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$ell (y)$]]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (1.298, 2.76), (3.54, 0), stroke: (paint: rgb("#28587d"), thickness: 1.2pt, cap: "round", join: "round"))
  line((0, 2.76), (1.298, 2.76), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((0, 1.104), (3.87, 1.104), stroke: (paint: rgb("#a1501c"), thickness: 0.8pt, cap: "round", join: "round"))
  line((0.5192, 0), (0.5192, 1.104), (2.643, 0), (2.643, 1.104), (1.298, 0), (1.298, 2.76), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  circle((0.5192, 1.104), radius: 0.05997, fill: rgb("#a1501c"), stroke: none)
  circle((2.643, 1.104), radius: 0.05997, fill: rgb("#a1501c"), stroke: none)
  line((0.5192, 1.104), (2.643, 1.104), fill: rgb("#a1501c"), stroke: none)
  content((0, 2.76), [#text(size: 9pt)[$rho$]], anchor: "east", padding: 0.1411cm)
  content((0, 1.104), [#text(size: 9pt)[$e$]], anchor: "east", padding: 0.1411cm)
  content((0, 0), [#text(size: 9pt)[$y_0$]], anchor: "north", padding: 0.1411cm)
  content((1.298, 0), [#text(size: 9pt)[$y_1$]], anchor: "north", padding: 0.1411cm)
  content((3.54, 0), [#text(size: 9pt)[$y_2$]], anchor: "north", padding: 0.1411cm)
  line((0.5192, -0.6256), (2.643, -0.6256), stroke: (paint: rgb("#a1501c"), thickness: 0.4pt, cap: "round", join: "round"), mark: (start: (symbol: ">>", fill: rgb("#a1501c")), end: (symbol: ">>", fill: rgb("#a1501c"))))
  content((1.581, -0.6256), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$rho -e$]]])])
  line((0.5192, -0.414), (0.5192, -0.7636), (2.643, -0.414), (2.643, -0.7636), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, -1.104), (3.54, -1.104), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((1.77, -1.104), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$rho$]]])])
  line((0, -0.8556), (0, -1.242), (3.54, -0.8556), (3.54, -1.242), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, cap: "round", join: "round"))
})],
  caption: [Figure 2: Horizontal slice lengths of a triangle of area $rho^2 \/ 2$ and vertical range $rho$. The tent has height $rho$. For $0 lt.eq e lt.eq rho$, the heights in the vertical projection at which $ell \( y \) gt.eq e$ form an interval of length $rho - e$. The graph shows three distinct vertex heights; a horizontal side gives the same conclusion with a one-sided tent. ],
) <fig:triangle-slices>

#proof[
  For a height $y$ in the vertical projection of $Delta$, let $ell \( y \)$ be the horizontal length of the slice
    of $Delta$ at that height. Write $y_0 lt.eq y_1 lt.eq y_2$ for the three vertex heights; thus $y_2 - y_0 =
    rho$. If these heights are distinct, $ell$ increases linearly from zero at $y_0$ to its maximum at $y_1$,
    then decreases linearly to zero at $y_2$. If two vertex heights coincide,
    $Delta$ has a horizontal side and there is just one linear segment.
    In either case, the area is one half the vertical range times the maximum slice length.
    The maximum is therefore $rho$.
  More precisely, for $0 lt.eq e lt.eq rho$, the heights with $ell \( y \) gt.eq
    e$ form an interval of length $rho - e$ (Figure 2). When the three heights are distinct, its endpoints are
  $ y_0 + e / rho \( y_1 - y_0 \) \, wide y_2 - e / rho \( y_2 - y_1 \) . $
  The same formulas apply when two adjacent heights coincide, including the cases $e = 0$ and $e = rho$.
  Write $F = sum_q f_q \( U \) Z^q$, with each displayed row $f_q$ nonzero,
    and let $e$ be the least order of these rows at $U = 1$. Dividing every row by $\( U - 1 \)^e$ gives
  $ F = \( U - 1 \)^e D \, wide D = sum_q d_q \( U \) Z^q \, wide D \( 1 \, Z \) eq.not 0 . $
  Indeed, at least one $d_q \( 1 \)$ is nonzero, and distinct powers of $Z$ are linearly independent.
    All $d_q$ remain Laurent polynomials, including when some exponents are negative.
  The horizontal exponent span of the row $f_q = \( U - 1 \)^e d_q$ is exactly $e$ plus that of $d_q$:
    the extreme coefficients of the product are nonzero. Thus $ell \( q \) gt.eq
    e$ for every height occurring in $D$. There is no cancellation between distinct heights,
    since the multiplying factor depends only on $U$. It follows that $e lt.eq
    rho$ and that the heights occurring in $D$ span an interval of length at most $rho - e$.
  On setting $U = 1$, some rows may disappear, but no new height appears.
    The nonzero Laurent polynomial $D \( 1 \, Z \)$ therefore has exponent span at most $rho - e$.
    Multiplication by a power of $Z$, which is a unit at $Z = 1$,
    turns it into an ordinary polynomial of degree at most $rho - e$. Consequently
  $ "ord"_(\( 1 \, 1 \)) D lt.eq "ord"_1 D \( 1 \, Z \) lt.eq rho - e . $
  The first inequality holds because restriction cannot introduce a term of smaller total degree into the local
    Taylor series. Orders add under products of nonzero holomorphic germs, so $"ord"_(\( 1 \, 1 \)) F lt.eq rho$.
    All exponent spans and orders used here are integers; no integrality of $rho$, the vertices,
    or the translating vector is required. ◻
]

=== 4.2 The subgroup test <the-subgroup-test>

For integer vectors $u \, xi in bb(Z)^2$, write $det \( u \, xi \)$ for their oriented determinant,
  extending this notation linearly to real $xi$. A vector in $bb(Z)^2$ is #emph[primitive] if its coordinates are
  coprime.

#thm([Proposition 4.2.])[
  #emph[Let $H > 0$, let $r$ be a positive integer, and let $P subset bb(R)^2$ be a triangle of area $H \/ 2$.
    Suppose there is a primitive vector $u in bb(Z)^2$ such that
$ max_(xi in P) det \( u \, xi \) - min_(xi in P) det \( u \, xi \) = sqrt(r H) . $

 Then there is a subgroup $G subset \( bb(C)^times \)^2$ of exactly $r$ distinct points such that,
   for all positive integers $k \, m$ with $m > k sqrt(H \/ r)$,
   the order-$m$ jet test on $cal(M) \( k P \)$ at $G$ is injective.]
] <prop:subgroup-test>

#proof[
  Complete $u$ to an integer basis $\( u \, v_0 \)$ with $det \( u \, v_0 \) = 1$. Put $v = r v_0$ and
  $ M = bb(Z) u + bb(Z) v subset bb(Z)^2 . $
  This sublattice has index $r$. For $eta = \( eta_1 \, eta_2 \) in bb(Z)^2$, write $chi_eta \( x \, z \) =
    x^(eta_1) z^(eta_2)$ for the corresponding character on $\( bb(C)^times \)^2$, and define
  $ G = { p in \( bb(C)^times \)^2 : chi_eta \( p \) = 1 upright(" for every ") eta in M } . $
  The characters $X = chi_u$ and $Y = chi_(v_0)$ are torus coordinates:
    their exponent matrix is unimodular, so its inverse also has integer entries. In these coordinates,
  $ G = { \( X \, Y \) : X = 1 \, med Y^r = 1 } . $
  Over $bb(C)$, this consists of exactly $r$ distinct points.
  Suppose, toward a contradiction, that a nonzero $f in cal(M) \( k P \)$ has order at least $m$ at every point of
    $G$. For $g in G$, let $\( tau_g f \) \( p \) = f \( g p \)$.
    Translation by $g$ permutes $G$ and is locally invertible,
    so every $tau_g f$ has the same prescribed vanishing. For a coset $eta + M$, its character projection is
  $ f_eta = 1 / r sum_(g in G) chi_eta \( g \)^(- 1) tau_g f . $
  This is exactly the sum of the monomials of $f$ with exponents in $eta + M$.
    Indeed, if $xi - eta = n u + ell v_0$, then $chi_(xi - eta)$ restricts to $zeta^ell$ on $G$.
    The sum over the $r$th roots of unity gives
  $ 1 / r sum_(g in G) chi_(xi - eta) \( g \) = cases(delim: "{", 1 \, & xi - eta in M \,, 0 \, & xi - eta in.not M .) $
  Thus the displayed projection keeps precisely the required coset.
    Each $f_eta$ still has order at least $m$ at every point of $G$, and its support remains inside $k P$.
    Since the components sum to $f$, choose one that is nonzero.
  Multiplication by the Laurent monomial $chi_(- eta)$ preserves local orders and shifts this component’s support
    into $M$. There is therefore a nonzero Laurent polynomial $F$ such that
  $ chi_(- eta) f_eta = F \( U \, Z \) \, wide U = chi_u \, wide Z = chi_v = Y^r . $
  The map $\( x \, z \) mapsto \( U \, Z \)$ is locally invertible at the identity:
    in coordinates $\( X \, Y \)$ it is $\( X \, Y \) mapsto \( X \, Y^r \)$,
    whose derivative at $\( 1 \, 1 \)$ is $"diag" \( 1 \, r \)$.
    The complex inverse function theorem therefore makes it a biholomorphism on sufficiently small analytic
    neighborhoods. In particular,
  $ "ord"_(\( 1 \, 1 \)) F = "ord"_(\( 1 \, 1 \)) \( chi_(- eta) f_eta \) gt.eq m . $
  Only local invertibility is used; the map need not be injective on the whole torus.
  Let $N$ be the matrix with columns $u \, v$. The exponent support of $F$ lies in the real triangle
  $ Delta = N^(- 1) \( k P - eta \) . $
  Since $det N = r$, this triangle has area $k^2 H \/ \( 2 r \)$.
    The second coordinate of $N^(- 1) xi$ is $det \( u \, xi \) \/ r$,
    so its vertical range is $k sqrt(r H) \/ r = k sqrt(H \/ r)$.
    Translation by $eta$ changes neither calculation. Lemma 9, with $rho = k sqrt(H \/ r)$,
    now gives $"ord"_(\( 1 \, 1 \)) F lt.eq k sqrt(H \/ r) < m$, the required contradiction. ◻
]

=== 4.3 A direction for every sufficiently large integer <a-direction-for-every-sufficiently-large-integer>

We apply Proposition 10 to

$ P_t = "conv" { \( - b \, 0 \) \, \( a \, 0 \) \, \( 0 \, 1 \/ d \) } \, wide a = frac(d H t, 1 + t) \, quad b =
  frac(d H, 1 + t) \, quad t > T \, $

with $d \, H \, T$ fixed in Section 3. Every triangle in this family has area $H \/ 2$, since $a + b = d H$.
  Varying $t$ continuously will make its determinant projection have the exact length needed for each large $r$.

#thm([Lemma 4.3.])[
  #emph[Fix $d \, H > 0$ and $T > 1$, and define $P_t$ as above for $t > T$.
    For every sufficiently large integer $r$ there are $t > T$ and a primitive vector $u in
    bb(Z)^2$ such that the range of $det \( u \, dot.op \)$ on $P_t$ has length $sqrt(r H)$.
    The threshold depends only on $d \, H \, T$.]
] <lem:direction>

#proof[
  Put $W = d H$ and $a_0 = W T \/ \( 1 + T \)$. As $t$ ranges over $\( T \, oo \)$, $a =
    W t \/ \( 1 + t \)$ ranges continuously and bijectively over $\( a_0 \, W \)$.
    For $R = sqrt(r H)$ sufficiently large, choose $j$ to be the largest power of two at most $R \/ \( 2 W \)$. Then
  $ frac(R, 4 W) < j lt.eq frac(R, 2 W) \, wide j W < R . $
  The open interval
  $ I_r = #scale(x: 120%, y: 120%)[\(] d \( R - j W \) \, med d \( R - j a_0 \) #scale(x: 120%, y: 120%)[\)] $
  has length
  $ d j \( W - a_0 \) > frac(d R, 4 \( 1 + T \)) \, $
  which exceeds $2$ for every sufficiently large $r$. Hence $I_r$ contains an odd integer $i$.
    Its lower endpoint is positive, so $i > 0$; as $j$ is a power of two, the vector $u = \( i \, j \)$ is primitive.
  The strict inequalities defining $I_r$ imply
  $ a_(*) := frac(R - i \/ d, j) in \( a_0 \, W \) . $
  Choose the unique $t > T$ for which $a = a_(*)$. Since $b = W - a$, we have
  $ i / d + j a = R \, wide i / d - j b = R - j W > 0 . $
  The determinant functional has the three vertex values
  $ det #scale(x: 120%, y: 120%)[\(] u \, \( - b \, 0 \) #scale(x: 120%, y: 120%)[\)] = j b \, wide
    det #scale(x: 120%, y: 120%)[\(] u \, \( a \, 0 \) #scale(x: 120%, y: 120%)[\)] = - j a \, wide
    det #scale(x: 120%, y: 120%)[\(] u \, \( 0 \, 1 \/ d \) #scale(x: 120%, y: 120%)[\)] = i / d . $
  Its minimum is therefore $- j a$ and its maximum is $i \/ d$, giving the required range $R$ exactly.
    All lower bounds on $r$ in this construction depend only on the fixed data $d \, H \, T$. ◻
]

#thm([Corollary 4.4.])[
  #emph[For the fixed parameters $d \, H \, T$ of Section 3,
    there is an integer $r_0$ such that for every integer $r gt.eq
    r_0$ one can choose a single $t > T$ and a subgroup $G subset \( bb(C)^times \)^2$ of $r$ distinct points for
    which the following holds: for all positive integers $k \, m$ satisfying
$ m > k sqrt(H \/ r) \, $

 the order-$m$ jet test on $cal(M) \( k P_t \)$ at $G$ is injective.]
] <cor:torus-test>

#proof[
  First fix $r$ and choose $t$ and $u$ by Lemma 11. The area of $P_t$ is $H \/ 2$,
    so Proposition 10 produces $G$ with the stated property simultaneously for all $k \, m$.
    Thus $r_0$, and then $t \, G$, are chosen before these two jet parameters. ◻
]

Corollary 8 now gives a surface configuration with the same injective jet test for each pair $k \, m$.
  These configurations may depend on the pair. The next section passes to very general points where all the tests
  hold at once, and uses them to prove nefness.

== 5 From homogeneous jets to nefness <sec:nef>

The preceding sections produce an injective jet test at some tuple for each pair of integers $k \,
  m$ above the critical slope. We first make all these tests hold at one very general tuple.
  A separate surface argument then converts them into inequalities for every curve,
  including curves whose multiplicities at the points are unequal.

#thm([Lemma 5.1.])[
  (The open locus of an injective jet test).  #emph[Let $S$ be a smooth integral complex projective surface,
    let $L$ be a line bundle, and let $r \, k \, m$ be positive integers. In the configuration space
$ U_r = { \( p_1 \, dots.h \, p_r \) in S^r : p_i eq.not p_j upright(" for ") i eq.not j } \, $

 the tuples at which the order-$m$ jet test on $H^0 \( S \, L^(⊗ k) \)$ is injective form a Zariski-open subset.
   If each test in a countable collection with fixed $S \, L \, r$ is injective at some tuple,
   then all those tests are simultaneously injective at very general tuples. Their common locus is nonempty.]
] <lem:jet-open>

#proof[
  Let $q_1 \, q_2 : S times S arrow.r S$ be the projections and let $cal(I)_Delta$ be the ideal of the diagonal.
    The bundle of jets of orders less than $m$ is
  $ cal(J)_(k \, m) = q_(1 *) #h(-0.16667em) (q_2^(*) L^(⊗ k) ⊗ cal(O)_(S times S) \/ cal(I)_Delta^m) . $
  This is the algebraic principal-parts construction #cite(label("Stacks")) Tags 0G3P and 0638;
    it is locally free of rank $binom(m + 1, 2)$. Indeed, the diagonal is a regular embedding with conormal bundle
    $Omega_S^1$; the successive quotients of the displayed sheaf, pushed forward to $S$,
    are $L^(⊗ k) ⊗ "Sym"^j Omega_S^1$ for $0 lt.eq j < m$. They are locally free of ranks $j + 1$.
    The thickened diagonal is finite over $S$, so these pushforwards are exact and give the asserted filtration.
    The fiber at $p$ is $\( L^(⊗ k) \)_p \/ frak(m)_p^m \( L^(⊗ k) \)_p$.
  Writing $"pr"_i : U_r arrow.r S$ for the coordinate projections, consider the algebraic bundle map
  $ H^0 \( S \, L^(⊗ k) \) ⊗ cal(O)_(U_r) arrow.r xor.big_(i = 1)^r "pr"_i^(*) cal(J)_(k \, m) . $
  Its fiber kernel consists exactly of sections vanishing to order at least $m$ at every point.
    If $n = h^0 \( S \, L^(⊗ k) \) > 0$, failure of injectivity is cut out locally by the $n times n$ minors.
    If $n = 0$, the map is injective everywhere. In either case the injective locus is Zariski open,
    and a single injective tuple makes it nonempty. The analytic and algebraic finite jets agree at complex
    points: in local coordinates both are the same Taylor polynomial modulo terms of total degree at least $m$.
    Thus a tuple obtained by the analytic transfers of the preceding sections is a valid witness here.
  The variety $U_r$ is smooth and irreducible. A proper algebraic closed subset has empty interior in its complex
    manifold of points. For a countable collection of nonempty injective loci,
    their complements are therefore closed nowhere-dense subsets of $U_r \( bb(C) \)$.
    This locally compact Hausdorff space is a Baire space, so their common complement is nonempty, indeed dense.
    By construction it is the complement of a countable union of proper Zariski-closed subsets of $U_r$,
    as required for very general tuples. ◻
]

We next record the precise Riemann–Roch argument that will turn a negative curve into an effective divisor with
  equal prescribed multiplicities. The divisor being made effective need not be nef.

#thm([Lemma 5.2.])[
  (Effective multiples of a positive-square divisor).  #emph[Let $Y$ be a smooth integral complex projective
    surface, let $A$ be a nef real divisor class, and let $D$ be a rational Cartier divisor.
    If $D^2 > 0$ and $A dot.op D > 0$, then $H^0 \( Y \, cal(O)_Y \( k D \) \) eq.not
    0$ for every sufficiently large positive integer $k$ divisible by the denominators of $D$.]
] <lem:positive-square>

#proof[
  Choose a positive integer $q$ such that $q D$ is Cartier and let $k$ run through positive multiples of $q$.
    By Serre duality #cite(label("Stacks")) Tag 0FVV, Lemma 48.27.1(6)–(7),
  $ h^2 \( Y \, cal(O)_Y \( k D \) \) = h^0 \( Y \, cal(O)_Y \( K_Y - k D \) \) . $
  For sufficiently large $k$,
  $ A dot.op \( K_Y - k D \) = A dot.op K_Y - k A dot.op D < 0 . $
  A divisor with a nonzero section is linearly equivalent to an effective divisor,
    which has nonnegative intersection with the nef class $A$.
    Hence the displayed $h^2$ vanishes for all such $k$. Surface Riemann–Roch #cite(label("Stacks")) Tag 02UO now gives
  $ h^0 \( Y \, cal(O)_Y \( k D \) \) & gt.eq chi \( Y \, cal(O)_Y \( k D \) \)\
 & = frac(k^2 D^2 - k D dot.op K_Y, 2) + chi \( Y \, cal(O)_Y \) > 0 $
  for sufficiently large $k$, since $D^2 > 0$. ◻
]

#thm([Proposition 5.3.])[
  (Homogeneous tests imply nefness).  #emph[Let $S$ be a smooth integral complex projective surface,
    let $L$ be ample, and let $p_1 \, dots.h \, p_r$ be distinct points. Put $H = L^2$ and $w = sqrt(H \/ r)$.
    Suppose that, for all positive integers $k \, m$ with $m > k w$,
    no nonzero section of $L^(⊗ k)$ vanishes to order at least $m$ at every $p_i$.
    On the blow-up $pi : Y arrow.r S$ of these points, with exceptional curves $E_i$, the real divisor class
$ D_0 = pi^(*) L - w sum_(i = 1)^r E_i $

 is nef.]
] <prop:homogeneous-nef>

#proof[
  Choose a Cartier divisor representing $L$ and retain the notation $L$ for it.
    Write $A = pi^(*) L$ and $E = sum_i E_i$. The class $A$ is nef and
  $ A^2 = H \, wide A dot.op E_i = 0 \, wide E_i dot.op E_j = - delta_(i j) \, wide D_0^2 = 0 . $
  If $D_0$ were not nef, there would be an integral curve $C subset Y$ with $D_0 dot.op C < 0$.
    Since $D_0 dot.op E_i = w > 0$, this curve is not exceptional, and $A dot.op C = L dot.op pi_(*) C > 0$.
    For sufficiently small positive rational $delta$, both
  $ \( D_0 - delta C \)^2 = - 2 delta D_0 dot.op C + delta^2 C^2 > 0 \, wide A dot.op \( D_0 - delta C \) = H -
    delta A dot.op C > 0 $
  hold. Fix such a $delta$. By continuity, there is a rational number $s > w$, sufficiently close to $w$, such that
  $ D = A - s E - delta C quad upright("satisfies") quad D^2 > 0 \, wide A dot.op D > 0 . $
  Here $A dot.op D = H - delta A dot.op C$ is independent of $s$.
  Choose a sufficiently large positive integer $k$ divisible by the denominators of both $s$ and $delta$.
    Lemma 14 supplies an effective divisor $F tilde.op k D$. Since $k delta$ and $m = k s$ are positive integers,
  $ F + k delta C tilde.op k A - m E $
  is effective. The blow-up identity #cite(label("Stacks")) Tag 0AGP, Lemma 54.3.4(4)
  $ pi_(*) cal(O)_Y \( - m E \) = ⋂_(i = 1)^r cal(I)_(p_i)^(thin m) $
  and the projection formula give a nonzero section of $L^(⊗ k)$ vanishing to order at least $m$ at every $p_i$.
    To recall the local content of this identity, sections of a pullback line bundle descend across the missing
    points because $S$ is normal, and the exceptional order of a local equation on the blow-up of a smooth point
    is its ordinary multiplicity. Thus the condition at each $E_i$ is precisely membership in
    $cal(I)_(p_i)^(thin m)$. But $m = k s > k w$, contradicting the hypothesis. Therefore $D_0$ is nef. ◻
]

For completeness, Riemann–Roch and a count of jet conditions also give the universal upper bound for the Seshadri
  constant.

#thm([Lemma 5.4.])[
  (The square upper bound).  #emph[For every ample line bundle $L$ on a smooth integral complex projective surface
    $S$ and every tuple of $r$ distinct points,
$ epsilon \( S \, L \; p_1 \, dots.h \, p_r \) lt.eq sqrt(L^2 \/ r) . $

]
] <lem:sesha-upper>

#proof[
  Put $H = L^2$, let $pi : Y arrow.r S$ be the blow-up, and write $A = pi^(*) L$ and $E = sum_i E_i$.
    Suppose $A - lambda E$ is nef for some $lambda gt.eq 0$. Fix $0 < alpha < sqrt(H \/ r)$ and set $m_k =
    ceil.l k alpha ceil.r$. The proof of Lemma 14, applied on $S$ with $A = D = L$, gives
  $ h^0 \( S \, L^(⊗ k) \) gt.eq H / 2 k^2 + O \( k \) . $
  The dimension of the target of the order-$m_k$ jet evaluation at the $r$ points is
  $ r binom(m_k + 1, 2) = frac(r alpha^2, 2) k^2 + O \( k \) . $
  Since $r alpha^2 < H$, evaluation has a nonzero kernel for all sufficiently large $k$.
    A section in that kernel gives an effective divisor $F_k tilde.op k A - m_k E$ on $Y$. Nefness implies
  $ 0 lt.eq \( A - lambda E \) dot.op F_k = k H - lambda r m_k . $
  Letting $k arrow.r oo$ gives $lambda lt.eq H \/ \( r alpha \)$,
    and then letting $alpha arrow.t sqrt(H \/ r)$ gives $lambda lt.eq sqrt(H \/ r)$.
    Taking the supremum over the nef coefficients $lambda$ proves the claim. ◻
]

#proof[
  Choose the nodal divisor and parameters in Section 3. Corollary 12 supplies an integer $r_0$,
    depending only on these choices and hence on $\( S \, L \)$, with the following property.
    For every integer $r gt.eq r_0$, there is a parameter $t >
    T$ and an $r$-point torus tuple such that the jet test on $cal(M) \( k P_t \)$ is injective for every pair of
    positive integers $k \, m$ with $m > k sqrt(H \/ r)$.
  Fix any such integer $r$. For each of these pairs, Corollary 8 gives an injective jet test on
    $H^0 \( S \, L^(⊗ k) \)$ at some tuple of $r$ distinct points of $S$. The tuples may depend on $k \, m$.
    Lemma 13 makes all these countably many tests hold simultaneously at very general tuples.
    Proposition 15 proves that the class $pi^(*) L - sqrt(H \/ r) sum_i E_i$ is nef at every such tuple.
    Combining this lower bound for the Seshadri constant with Lemma 16 proves the required equality.
    The integer $r$ was arbitrary subject to $r gt.eq r_0$, and $r_0$ was fixed before $k \, m$ were chosen.
    This proves the assertion for every sufficiently large integer $r$. ◻
]

=== 5.1 Extension of the ground field <extension-of-the-ground-field>

#thm([Corollary 5.5.])[
  #emph[Let $K$ be an uncountable algebraically closed field of characteristic zero,
    let $S$ be a smooth integral projective surface over $K$, and let $L$ be an ample line bundle on $S$.
    There is an integer $r_0 = r_0 \( S \, L \)$ such that, for every $r gt.eq r_0$,
    outside a countable union of proper Zariski-closed subsets of $U_r$, with nonempty complement, one has
$ epsilon \( S \, L \; p_1 \, dots.h \, p_r \) = sqrt(L^2 \/ r) . $

]
] <cor:fields>

#proof[
  Descend the projective equations and the finite gluing data for $L$ to a subfield $F subset
    K$ finitely generated over $bb(Q)$. This gives a smooth geometrically integral projective surface $S_0 \/
    F$ and an ample line bundle $L_0$ whose base change is $\( S \, L \)$;
    these properties descend through field extension, and the finite-data descent and ampleness criteria are
    recorded in #cite(label("Stacks")) Tags 01ZM and 0D3C. The field $F$ is countable and embeds into $bb(C)$.
    Fix such an embedding and choose $r_0$ from Theorem 1 for $\( S_(0 \, bb(C)) \, L_(0 \, bb(C)) \)$.
    The intersection number $H = L_0^2 = L^2$ is unchanged by field extension.
  Fix $r gt.eq r_0$ and put $w = sqrt(H \/ r)$. For every pair of positive integers $a \, m$ with $m > a w$,
    form on $U_(r \, 0) = U_r \( S_0 \)$ the evaluation map
  $ H^0 \( S_0 \, L_0^(⊗ a) \) ⊗ cal(O)_(U_(r \, 0)) arrow.r xor.big_(i = 1)^r "pr"_i^(*) cal(J)_(a \, m) $
  using the principal-parts construction in the proof of Lemma 13.
    Its noninjectivity locus $B_(a \, m)$ is closed, cut out by maximal minors,
    and is empty if the source space is zero. Principal parts and these minors commute with field extension,
    as does $H^0$ by flat base change #cite(label("Stacks")) Tag 02KH. Each $B_(a \, m)$ is proper over $bb(C)$:
    at a tuple where $A - w E$ is nef, with $A = pi^(*) L_(0 \, bb(C))$ and $E = sum_i E_i$,
    a section in the evaluation kernel would give an effective divisor of class $a A - m E$,
    whose intersection with $A - w E$ is $a H - r m w < 0$. Thus $B_(a \, m)$ is proper over $F$ and remains
    proper over $K$. The single threshold $r_0$ works for all these pairs.
  Let $Z_r = union.big_(a \, m : thin m > a w) B_(a \, m \, K)$.
    This is a countable union of proper closed subsets. Its complement contains a $K$-point:
    the function field $F \( U_(r \, 0) \)$ has transcendence degree $2 r$ over $F$ and embeds over $F$ into $K$.
    Indeed, choose $2 r$ algebraically independent elements of $K$ over the countable field $F$ and extend the
    resulting embedding of a rational function field across the finite algebraic extension,
    using that $K$ is algebraically closed. The resulting $K$-point maps to the generic point of $U_(r \, 0)$ and
    therefore avoids all the $B_(a \, m)$.
  At every tuple outside $Z_r$, all the homogeneous jet tests are injective.
    The proofs of Lemma 14, Proposition 15, and Lemma 16 use only surface Riemann–Roch, Serre duality,
    and the blow-up ideal identity, and are valid over $K$. They give nefness of $pi^(*) L -
    w sum_i E_i$ and the matching upper bound, respectively. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
