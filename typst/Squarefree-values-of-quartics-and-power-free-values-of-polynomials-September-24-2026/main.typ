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

#align(center)[#text(size: 16pt, weight: "bold")[Squarefree values of quartics and power-free values of polynomials]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For an integer $k gt.eq 2$, an integer $a$ is #emph[$k$-power-free] if no prime power $p^k$ divides $a$.
  This convention includes negative integers and excludes zero. Given $f in bb(Z) \[ x \]$, write

$ rho_f \( q \) = \# { a in bb(Z) \/ q bb(Z) : f \( a \) equiv 0 med \( mod med q \) } \, wide
  S_(f \, k) \( X \) = \# { 1 lt.eq n lt.eq X : f \( n \) upright(" is ") k upright("-power-free") } . $

The necessary local condition is

#[#set math.equation(numbering: n => "(1.1)")
 $ rho_f \( p^k \) < p^k quad upright("for every prime ") p . $ <eq:local-admissibility>]

It says that no prime $k$th power divides every value of $f$.
  The natural candidate for the density is the product of the proportions that survive these separate congruence
  conditions.

#thm([Theorem 1.1.])[
  #emph[Let $f in bb(Z) \[ x \]$ be irreducible over $bb(Q)$, of degree $d$ with $4 lt.eq d lt.eq 8$, and put $k =
    d - 2$. If (1.1) holds, then
$ S_(f \, k) \( X \) = c_(f \, k) X + o_f \( X \) \, wide c_(f \, k) =
  product_p (1 - frac(rho_f \( p^k \), p^k)) > 0 . $

 No primitivity or sign condition on the leading coefficient is required.]
] <thm:density>

For quartics this is a squarefree-value density theorem. In degrees $5 \, 6 \, 7 \, 8$,
  the respective excluded powers are $3 \, 4 \, 5 \, 6$. The statement concerns positive integer inputs and
  imposes no bound on the height of the fixed polynomial’s coefficients.
  The error term is not asserted to be uniform as $f$ varies.

In particular, the quartics $x^4 + 2$ and $x^4 + 1$ have positive squarefree-value density.
  The first is Eisenstein at $2$; the second is the eighth cyclotomic polynomial.
  For $x^4 + 2$, its value at zero excludes a fixed odd prime square,
  and its value at one excludes a fixed square of $2$. The value at zero of $x^4 + 1$ is one,
  so its local condition is immediate.

=== 1.1 Earlier results and the higher-degree consequence <earlier-results-and-the-higher-degree-consequence>

The power-free-value problem has a long history. Ricci obtained the asymptotic in the range $k gt.eq
  d$ #cite(label("Ricci1933")). For $d gt.eq 3$, Erdős proved infinitude for exponent $d - 1$,
  and Hooley obtained the corresponding asymptotic #cite(label("Erdos1953")) #cite(label("Hooley1967"));
  see also the historical discussion in #cite(label("HeathBrown2013Powerfree")) Introduction.
  The cubic squarefree case therefore belongs to this classical range.
  Already in 1953, Erdős singled out the unresolved squarefreeness of $n^4 + 2$ #cite(label("Erdos1953")) p. 425.
  In his 1965 survey he returned to this example when describing the obstacle at exponent $d -
  2$ #cite(label("Erdos1965")) Section 6, p. 219.

Nair obtained the asymptotic for $k gt.eq \( sqrt(2) - 1 / 2 \) d$ #cite(label("Nair1976")),
  with further developments by Nair and Huxley–Nair #cite(label("Nair1979")) #cite(label("HuxleyNair1980")).
  The 1976 bound reaches $k = d - 2$ for $d gt.eq 24$. Heath-Brown’s affine determinant method gave the range $k
  gt.eq \( 3 d + 2 \) \/ 4$ #cite(label("HeathBrown2006Counting")) Theorem 16, reaching $k = d - 2$ for $d gt.eq
  10$. Combining that method with Salberger’s global determinant estimates,
  Browning improved the range to $k gt.eq \( 3 d + 1 \) \/ 4$ #cite(label("Browning2011PowerFree")),
  which reaches $k = d - 2$ for $d gt.eq 9$. We use the formulation and published reproof in Xiao
  #cite(label("Xiao2017PowerFree")) Theorem 9.1 and Section 9:
  the input interval is $1 lt.eq n lt.eq X$ and the constant is the Euler product over all residue classes modulo $p^k$.

The shape of the polynomial can permit stronger estimates.
  Heath-Brown proved an asymptotic with a power-saving error for irreducible binomials $x^d +
  c$ when $k gt.eq \( 5 d + 3 \) \/ 9$ #cite(label("HeathBrown2013Powerfree")) Theorem 1.
  At $k = d - 2$ this covers such binomials in degrees $d gt.eq 6$, while imposing the special binomial form.
  Reuss obtained a power-saving error for the general degree-$d$ polynomial at exponent $d -
  1$ #cite(label("Reuss2015PowerFree")) Theorem 2. The quartic theorem above concerns squarefree values at
  positive integer arguments for each fixed admissible polynomial.

Other important directions involve different hypotheses or quantifiers.
  Granville showed that the $a b c$ conjecture yields the predicted squarefree-value density for separable integer
  polynomials with no fixed prime-square divisor #cite(label("granville1998abc")) Theorem 1.
  Greaves and Helfgott studied squarefree values of binary forms;
  Helfgott’s Theorems 5.1–5.2 distinguish univariate cubics from homogeneous forms in two variables of degree at
  most six #cite(label("Greaves1992")) #cite(label("Helfgott2004")).
  A density in two integer variables does not by itself give the density on the fixed line with second coordinate
  one. Recent results of Browning–Shparlinski and Sofos study the discrepancy from the predicted squarefree count
  on average over polynomial coefficient families #cite(label("BrowningShparlinski2024")) Theorems 1.1–1.2,
  #cite(label("Sofos2026")) Theorem 1.1; those averaged statements do not imply a theorem for every fixed polynomial.

Carella’s preprint claims squarefree-value asymptotics for both $n^4 + 1$ and $n^4 +
  2$ #cite(label("carella2023squarefree")) Theorems 1.1–1.2.
  Zapata Ceballos–Jalalvand claim positive density for monic irreducible degree-$2
  q$ polynomials with squarefree fixed divisor whose root field contains a degree-$q$ Galois subfield,
  where $q$ is prime; this includes $n^4 + 1$ #cite(label("zapataceballosjalalvand2026squarefree")) Theorem 1.1.
  We do not use either claim as a theorem input. Our large-prime estimate and sieve transfer are proved
  independently below.

The new argument in this paper concerns degrees four through eight.
  For higher degrees, Browning’s theorem supplies a direct consequence.

#thm([Corollary 1.2.])[
  #emph[Let $f in bb(Z) \[ x \]$ be irreducible over $bb(Q)$ of degree $d gt.eq 4$, and put $k = d - 2$.
    If $f$ has no fixed prime $k$th-power divisor, then
$ S_(f \, k) \( X \) = c_(f \, k) X + o_f \( X \) \, wide c_(f \, k) =
  product_p (1 - frac(rho_f \( p^k \), p^k)) > 0 . $

]
] <cor:all-degrees>

#proof[
  For $4 lt.eq d lt.eq 8$ use Theorem 1. For $d gt.eq 9$,
  $ d - 2 gt.eq frac(3 d + 1, 4) \, $
  so Browning’s theorem, in the cited form of Xiao, applies to the primitive positive-leading part of $f$.
    Lemma 7 transfers its density to $f$, retaining the original local factors. ◻
]

The factorwise large-prime estimates also give a fixed-product consequence.
  Here a nonzero polynomial is #emph[separable over $bb(Q)$] if each of its nonconstant irreducible factors occurs
  with multiplicity one.

#thm([Corollary 1.3.])[
  (Separable products and simultaneous values).  #emph[Fix an integer $k gt.eq 2$.
    Let $F in bb(Z) \[ x \] \\ { 0 }$ be separable over $bb(Q)$,
    with every nonconstant irreducible factor of degree at most $k + 2$.
    If $rho_F \( p^k \) < p^k$ for every prime $p$, then
$ S_(F \, k) \( N \) = c_(F \, k) N + o_(F \, k) \( N \) \, wide c_(F \, k) =
  product_p (1 - frac(rho_F \( p^k \), p^k)) > 0 . $

 More generally, let $upright(bold(F)) = \( F_1 \, dots.h \, F_r \)$, with $r gt.eq 1$,
   be a fixed family of nonzero integer polynomials, each separable over $bb(Q)$ with all nonconstant irreducible
   factors of degree at most $k + 2$. Factors may be shared by different $F_i$. Put
$ Omega_p = { a in bb(Z) \/ p^k bb(Z) : p^k divides F_i \( a \) upright(" for at least one ") i } . $

 Let $S_(upright(bold(F)) \, k) \( N \)$ count the integers $1 lt.eq n lt.eq
   N$ for which every $F_i \( n \)$ is $k$-power-free. If $\# Omega_p < p^k$ for every prime $p$, then
$ S_(upright(bold(F)) \, k) \( N \) = c_(upright(bold(F)) \, k) N + o_(upright(bold(F)) \, k) \( N \) \, wide
  c_(upright(bold(F)) \, k) = product_p (1 - frac(\# Omega_p, p^k)) > 0 . $

]
] <cor:separable-products>

The first assertion requires the value of the entire product $F$ to be $k$-power-free.
  The second imposes power-freeness separately on the $F_i \( n \)$, not on their product,
  and uses the joint local condition $Omega_p$ rather than a product of individual local factors.
  All polynomials, their number, and $k$ are fixed; no uniform or power-saving error is asserted here.
  The proof is at the end of Section 2.

Our method combines number-field factorization with approximating determinants,
  following the framework developed by Reuss for power-free polynomial values #cite(label("Reuss2015PowerFree"))
  Sections 3–6. Heath-Brown’s determinant arguments for squarefree values of $n^2 +
  1$ and for power-free binomial values provide related precedents #cite(label("HeathBrown2012Squarefree"))
  #cite(label("HeathBrown2013Powerfree")). The real determinant method originates in work of Bombieri–Pila;
  Heath-Brown developed the prime-adic and approximating forms used in this line of arguments,
  and Salberger developed their local Hilbert and global congruence aspects #cite(label("BombieriPila1989"))
  #cite(label("HeathBrown2002Density")) #cite(label("HeathBrown2009Sums")) #cite(label("Salberger2007"))
  #cite(label("Salberger2023")). The uniform affine counting theorem,
  the explicit weighted Hilbert calculations and the quartic surface and curve arguments needed here are proved below.

=== 1.2 The large-prime problem <the-large-prime-problem>

The finite-prime part of the problem follows from the Chinese remainder theorem.
  For primes outside a fixed finite set, separability and Hensel lifting give $rho_f \( p^k \) lt.eq d$.
  Consequently, for fixed large $Y$, primes $Y < p lt.eq X$ remove at most

$ O_f #scale(x: 120%, y: 120%)[\(] X Y^(1 - k) + pi \( X \) #scale(x: 120%, y: 120%)[\)] $

integers in $\( X \, 2 X \]$. The remaining task is to control primes larger than the length of the input
  interval. We prove the following estimate.

#thm([Proposition 1.4.])[
  #emph[Let $f in bb(Z) \[ x \]$ be primitive and irreducible,
    with positive leading coefficient and degree $4 lt.eq d lt.eq 8$. Put $k = d - 2$.
    There exists $delta = delta_f > 0$ such that
$ \# { n in bb(Z) : X < n lt.eq 2 X \, med p^k divides f \( n \) upright(" for some prime ") p > X } lt.double_f
  X^(1 - delta) . $

]
] <prop:large-prime-tail>

The proposition does not require local admissibility. In Section 2, we prove explicitly that it implies Theorem 1,
  including the stated sign and content generality. The density argument first holds the finite-prime cutoff fixed
  while $X$ tends to infinity, and then lets the cutoff tend to infinity.
  This order gives the exact Euler product without an assertion of a power-saving error in the density asymptotic.

=== 1.3 Proof strategy <proof-strategy>

Fix a dyadic prime interval $P lt.eq p lt.eq 2 P$, and choose one such prime for each input being counted.
  Write $P = X^eta$ and $b = d - k eta$. The elementary relation $f \( n \) =
  y p^k$ puts the chosen triples on the surface $f \( x \) = y z^k$, with coordinate sizes $X \, X^b \, X^eta$.
  A weighted determinant argument on this surface suffices when $eta$ is large.
  The harder range requires more information from the factorization of $f$.

Let $theta$ be a root of $f$ and let $K = bb(Q) \( theta \)$.
  Ideal factorization and the unit theorem produce integral elements $alpha \, beta in K$ satisfying

$ alpha^k beta = mu \( n - theta \) $

for a fixed nonzero integer $mu$. Their conjugates are balanced:
  the sizes of $alpha$ and $beta$ at each embedding are respectively comparable to $P^(1 \/ d)$ and $X^(b \/ d)$.
  Integer coordinates in a fixed integral basis therefore give two boxes,
  while their projective directions satisfy explicit polynomial equations.
  Near a balanced point, and after choosing one of finitely many local branches,
  either direction determines the other analytically once $1 \/ n$ is specified.

We partition these directions into small paired boxes. An archimedean determinant gives a polynomial equation on
  the points in each pair. Components defined by an equation in only one of the two coordinate groups receive a
  second cut. Explicit complete intersection calculations measure the independent monomials available on the
  resulting sets. The distinction between a mixed equation and a pure equation is important:
  the latter also reduces the number of independent Taylor monomials in the local determinant.

Two further steps turn these cuts into a count. First, a reduced basis of the integer lattice associated with a
  direction box makes its points smaller in new integral coordinates.
  An exceptionally short lattice vector also limits the number of boxes in which it can occur.
  Second, we apply the general affine counting theorem proved in Section 3,
  using lower bounds for weighted spaces of polynomial functions.
  Its proof repeatedly uses residue classes at small auxiliary primes.
  Its auxiliary varieties depend on earlier choices of primes;
  a random deletion argument controls the primes at which their equations fail to give smooth local coordinates.
  This permits a uniform count through successive dimension drops.

For quartics, surfaces and curves need sharper geometric bounds.
  On a surface, the difficult projections have degree one or two.
  The quadric case supplies an additional field degree. On a plane,
  a deficient bound would force either a polynomial of degree at most four on a general line or a degree-two
  rational map on the line of directions to have four distinct critical values.
  On a curve, the limiting case is a polynomial of degree five with four prescribed critical values.
  Up to a normalization of two critical points, only finitely many such polynomials occur.
  Their integer values in the input interval form one set of size $O_f \( X^(1 \/ 5) \)$,
  which is removed once before summing over boxes. The remaining curve estimates and an exact finite choice of
  parameters give a common power saving.

=== 1.4 Organization <organization>

Figure 1 shows how the principal estimates feed into the density theorem.
  Its arrows indicate uses of established modules; the order of the sections places the uniform counting statement
  before its arithmetic applications.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.847cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Exact density from finite congruences#linebreak()Section~2]]])])
  content((7.547, 0), [#box(width: 6.847cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Large prime powers $p^(d-2) divides f(n)$#linebreak()Section~11]]])])
  content((7.547, -1.798), [#box(width: 6.847cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Balanced field factors and paired boxes#linebreak()Sections~4--6]]])])
  content((0, -1.798), [#box(width: 6.847cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Function spaces on surfaces and curves#linebreak()Sections~7--9]]])])
  content((0, -3.573), [#box(width: 6.847cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Uniform affine counting#linebreak()Section~3]]])])
  content((7.547, -3.573), [#box(width: 6.847cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Strict parameter margins and summation#linebreak()Sections~10--11]]])])
  line((4.123, -1.798), (3.423, -1.798), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -2.292), (0, -3.092), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.423, -3.573), (4.123, -3.573), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((10.97, -3.573), (11.47, -3.573), (11.47, 0), (10.97, 0), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((4.123, 0), (3.423, 0), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The number-field route to the large-prime bound and the exact density. The direct-surface estimate handles the complementary upper prime range in Section 11. ],
) <fig:proof-flow>

Section 2 gives the density reduction, and Section 3 proves the general counting theorem.
  Sections 4–6 construct the number-field boxes, determinant cuts and lattice coordinates.
  Section 7 establishes weighted Hilbert bounds; Sections 8 and 9 sharpen them for quartic surfaces and curves.
  Section 10 selects the parameters, and Section 11 proves the large-prime estimate and completes the density
  theorem. Section 12 gives the explicit cyclotomic density, retains a quantitative central-prime estimate,
  and explains the special factorization, level equation and Pell alternative.

== 2 From a large-prime tail to the exact density <sec:sieve>

The geometric argument will estimate large prime-power divisors for a primitive polynomial with positive leading
  coefficient. We first prove that this is enough for the full density statement.
  The finite-prime conditions must still be imposed on the original polynomial:
  removing its content can change the corresponding factors of the Euler product.

#thm([Proposition 2.1.])[
  (Sieve transfer).  #emph[Let $f in bb(Z) \[ x \]$ be irreducible over $bb(Q)$, of degree $d gt.eq 2$,
    and let $k gt.eq 2$. Suppose that $rho_f \( p^k \) < p^k$ for every prime $p$. Write
$ f = s c g \, wide s in { - 1 \, 1 } \, quad c in bb(N) \, $

 where $c$ is the positive content of $f$ and $g in bb(Z) \[ x \]$ is primitive with positive leading coefficient.
   Assume that
#[#set math.equation(numbering: n => "(2.1)")
 $ T_g \( X \) := \# { n in bb(Z) : X < n lt.eq 2 X \, med
   p^k divides g \( n \) upright(" for some prime ") p > X } = o_(g \, k) \( X \) . $ <eq:sieve-tail-hypothesis>]

 Then
$ S_(f \, k) \( N \) = c_(f \, k) N + o_(f \, k) \( N \) \, wide c_(f \, k) =
  product_p (1 - frac(rho_f \( p^k \), p^k)) > 0 . $

]
] <prop:sieve-transfer>

#proof[
  #emph[Normalization and local factors.] Multiplication by $s$ does not affect divisibility.
    The polynomial $g$ is irreducible over $bb(Q)$, and it inherits local admissibility from $f$.
    Neither polynomial has an integer root, because its degree is at least two. Thus none of the counted values is zero.
  For a prime $p divides c$, put $e = v_p \( c \)$. Local admissibility forces $e < k$, and
  #[#set math.equation(numbering: n => "(2.2)")
   $ rho_f \( p^k \) = p^e rho_g \( p^(k - e) \) \, wide 1 - frac(rho_f \( p^k \), p^k) = 1 -
     frac(rho_g \( p^(k - e) \), p^(k - e)) . $ <eq:sieve-content-factor>]
  Indeed, $p^k divides f \( a \)$ is equivalent to $p^(k - e) divides g \( a \)$,
    and each class modulo $p^(k - e)$ has exactly $p^e$ lifts modulo $p^k$.
    For $p divides.not c$ the root counts of $f$ and $g$ modulo $p^k$ agree.
    Once $X$ exceeds every prime divisor of $c$, the large-prime exceptional sets for $f$ and $g$ are therefore
    identical.
  Let $cal(B)$ contain the prime divisors of $c$, the leading coefficient of $g$, and the discriminant of $g$.
    This is a finite set. If $p in.not cal(B)$, reduction of $g$ has degree $d$ and simple roots.
    Each root modulo $p^j$ lifts uniquely modulo $p^(j + 1)$: the expansion
  $ g \( a + p^j u \) equiv g \( a \) + p^j u g' \( a \) med \( mod med p^(j + 1) \) $
  determines $u$ modulo $p$, since $g' \( a \)$ is invertible there. Consequently
  #[#set math.equation(numbering: n => "(2.3)")
   $ rho_f \( p^k \) = rho_g \( p^k \) = rho_g \( p \) lt.eq d wide \( p in.not cal(B) \) . $ <eq:sieve-root-bound>]
  Put $q_p = rho_f \( p^k \) \/ p^k$. Each $q_p < 1$ by hypothesis,
    and (2.3) gives $sum_p q_p < oo$ because $k gt.eq 2$. For all sufficiently large $p$, $q_p lt.eq
    1 \/ 2$ and $- 2 q_p lt.eq log \( 1 - q_p \) lt.eq - q_p$.
    Thus the Euler product converges to a strictly positive number.
    Its finitely many factors at primes in $cal(B)$ are retained exactly, including (2.2).
  #emph[The finite sieve and the intermediate primes.] Fix an integer $Y gt.eq
    2$ exceeding every prime in $cal(B)$, and set
  $ Q_Y = product_(p lt.eq Y) p^k \, wide c_Y = product_(p lt.eq Y) (1 - frac(rho_f \( p^k \), p^k)) . $
  Let $A_Y \( X \)$ count the integers $n in \( X \, 2 X \]$ for which $p^k divides.not f \( n \)$ for every $p
    lt.eq Y$. The Chinese remainder theorem gives exactly $Q_Y c_Y$ permitted classes modulo $Q_Y$.
    Counting each class in the interval gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ A_Y \( X \) = c_Y X + O \( Q_Y \) . $ <eq:sieve-finite-crt>]
  Here $Y$ remains fixed as $X$ tends to infinity.
  Write $A \( X \)$ for the count of all $k$-power-free values in $\( X \, 2 X \]$.
    For $X > Y$, the integers removed by primes $Y < p lt.eq X$ number at most
  #[#set math.equation(numbering: n => "(2.5)")
   $ I_Y \( X \) & lt.eq sum_(Y < p lt.eq X) rho_f \( p^k \) (X / p^k + 1)\
 & lt.eq d X sum_(m > Y) 1 / m^k + d pi \( X \) lt.eq frac(d, k - 1) X Y^(1 - k) +
   d pi \( X \) . $ <eq:sieve-intermediate>]
  The elementary bound $pi \( X \) lt.double X \/ log X$ is sufficient here.
    For all sufficiently large $X$, the remaining exceptional set is counted by $T_g \( X \)$, so
  #[#set math.equation(numbering: n => "(2.6)")
   $ 0 lt.eq A_Y \( X \) - A \( X \) lt.eq I_Y \( X \) + T_g \( X \) . $ <eq:sieve-sandwich>]
  We can now identify the density. Divide (2.4)–(2.6) by $X$ and first let $X arrow.r oo$ with $Y$ fixed.
    The tail hypothesis gives
  $ c_Y - frac(d, k - 1) Y^(1 - k) lt.eq liminf_(X arrow.r oo) frac(A \( X \), X) lt.eq
    limsup_(X arrow.r oo) frac(A \( X \), X) lt.eq c_Y . $
  Then let $Y arrow.r oo$. Since $c_Y arrow.r c_(f \, k)$, this proves
  #[#set math.equation(numbering: n => "(2.7)")
   $ A \( X \) = c_(f \, k) X + o_(f \, k) \( X \) . $ <eq:sieve-dyadic-density>]
  #emph[From dyadic intervals to positive inputs.] Fix an integer $J gt.eq 1$.
    Apply (2.7) to the finitely many disjoint intervals
  $ \( N \/ 2^(j + 1) \, N \/ 2^j \] \, wide 0 lt.eq j < J . $
  For fixed $J$, their total count is $c_(f \, k) N \( 1 - 2^(- J) \) + o_(f \, k \, J) \( N \)$.
    The interval $\[ 1 \, N \/ 2^J \]$ contains at most $N \/ 2^J$ integers. Hence
  $ c_(f \, k) \( 1 - 2^(- J) \) & lt.eq liminf_(N arrow.r oo) frac(S_(f \, k) \( N \), N)\
 & lt.eq limsup_(N arrow.r oo) frac(S_(f \, k) \( N \), N) lt.eq c_(f \, k) \( 1 - 2^(- J) \) + 2^(- J) . $
  Letting $J arrow.r oo$ proves the proposition. ◻
]

#prodef([Remark 2.2.])[
  A large-prime bound remains valid after imposing any fixed finite congruence restrictions on $n$,
    since the restricted exceptional set is a subset of the unrestricted one.
    In the finite sieve those restrictions are combined with the conditions modulo $p^k$ using their least common
    multiple as modulus. No independence of overlapping congruence conditions is needed.
    In particular, the exact conditions at content primes can be retained while using the large-prime bound for
    the primitive polynomial.
] <rem:sieve-congruences>

The same normalization also applies when a density theorem for the primitive polynomial is already available.
  It does not require a separate estimate for values in arithmetic progressions.

#thm([Lemma 2.3.])[
  (Removing sign and content).  #emph[Let $f in bb(Z) \[ x \]$ be irreducible over $bb(Q)$,
    of degree at least two, and let $k gt.eq 2$. Suppose that $rho_f \( p^k \) < p^k$ for every prime $p$,
    and write $f = s c g$, where $s in { - 1 \, 1 }$, $c$ is the positive content,
    and $g$ is primitive with positive leading coefficient. If
$ S_(g \, k) \( N \) = c_(g \, k) N + o_(g \, k) \( N \) \, wide c_(g \, k) =
  product_p (1 - frac(rho_g \( p^k \), p^k)) \, $

 then $S_(f \, k) \( N \) = c_(f \, k) N + o_(f \, k) \( N \)$ with the Euler product $c_(f \, k) >
   0$ of Proposition 5.]
] <lem:density-content>

#proof[
  The normalization and product-convergence arguments above do not use the tail hypothesis.
    Thus both Euler products converge, and their factors are related by (2.2).
    Fix an integer $Y$ exceeding every prime divisor of $c$. For $h = f \, g$,
    let $B_(h \, Y) \( N \)$ count the integers $1 lt.eq n lt.eq
    N$ avoiding $p^k divides h \( n \)$ for every $p lt.eq Y$, and put
  $ c_(h \, Y) = product_(p lt.eq Y) (1 - frac(rho_h \( p^k \), p^k)) . $
  The finite Chinese remainder calculation gives $B_(h \, Y) \( N \) = c_(h \, Y) N + O \( Q_Y \)$, with $Q_Y =
    product_(p lt.eq Y) p^k$.
  An input counted by $B_(f \, Y) \( N \) - S_(f \, k) \( N \)$ avoids all the small-prime conditions for $f$ but
    has a divisor $p^k$ with $p > Y$. It also avoids the small-prime conditions for $g$,
    and $p divides.not c$ implies $p^k divides g \( n \)$. Consequently
  $ 0 lt.eq B_(f \, Y) \( N \) - S_(f \, k) \( N \) lt.eq B_(g \, Y) \( N \) - S_(g \, k) \( N \) . $
  For fixed $Y$, divide by $N$ and let $N arrow.r oo$. The assumed density of $g$ yields
  $ c_(f \, Y) - \( c_(g \, Y) - c_(g \, k) \) lt.eq liminf_(N arrow.r oo) frac(S_(f \, k) \( N \), N) lt.eq
    limsup_(N arrow.r oo) frac(S_(f \, k) \( N \), N) lt.eq c_(f \, Y) . $
  Letting $Y arrow.r oo$ proves the claim. ◻
]

#proof[
  Write
  $ F_i = c_i product_(g in cal(G)_i) g \, wide c_i in bb(Z) \\ { 0 } \, $
  where $cal(G)_i$ is a set of distinct primitive irreducible polynomials with positive leading coefficients.
    Let $cal(G) = union.big_i cal(G)_i$, so shared factors are included only once.
    The joint local condition implies local admissibility of each $F_i$, and hence of every $g in cal(G)$.
    For such a factor of degree $d lt.eq k + 2$, let $T_(g \, k) \( X \)$ count the integers $X < n lt.eq
    2 X$ for which $p^k divides g \( n \)$ for some prime $p > X$. We first record
  #[#set math.equation(numbering: n => "(2.8)")
   $ T_(g \, k) \( X \) = o_(g \, k) \( X \) . $ <eq:factorwise-tail>]
  For $d lt.eq k$, omit the finitely many integer roots of $g$ and use $\| g \( n \) \| lt.double_g X^d$.
    If $d < k$, the tail is empty for large $X$. If $d = k$, only primes $X < p lt.eq C_g X$ can occur,
    for a fixed $C_g$. Outside finitely many primes, each has at most $d$ roots modulo $p^k$,
    and an interval of length $X < p^k$ contains at most one representative of each root.
    Thus $T_(g \, k) \( X \) lt.double_g pi \( C_g X \) = o_g \( X \)$.
    If $d = k + 1$, the unweighted triple estimates of Reuss #cite(label("Reuss2015PowerFree")) Lemma 3 and its
    proof, and Section 6 give $o_g \( X \)$ triples with $X < n lt.eq 2 X$, $a > X^(1 - delta)$, $mu^2 \( a \) =
    1$, and $a^(d - 1) b = g \( n \)$, for a suitable fixed $delta > 0$.
    For large $X$ the values $g \( n \)$ here are positive, so $a = p$ and $b =
    g \( n \) \/ p^k$ include every input counted by $T_(g \, k) \( X \)$.
    If $d = k + 2 lt.eq 8$, use Proposition 4. Finally, if $d = k + 2 gt.eq 9$, then $k = d -
    2 gt.eq \( 3 d + 1 \) \/ 4$ and $k \/ d > 3 \/ 4$. Xiao’s estimate in #cite(label("Xiao2017PowerFree"))
    Section 9 is $E_B \( B^(1 - delta) \) = o_g \( B \)$ for some fixed $delta > 0$, where
  $ E_B \( xi \) = \# { 1 lt.eq n lt.eq B : med b^k divides g \( n \) upright(" for some squarefree integer ") b >
    xi } . $
  Take $B = 2 X$: eventually $p > X > \( 2 X \)^(1 - delta)$, so this exceptional set contains the tail.
    This proves (2.8) in every case.
  Let $cal(B)$ contain the prime divisors of all $c_i$, leading coefficients and discriminants of the $g in
    cal(G)$, and resultants of distinct pairs in $cal(G)$. This set is finite:
    all the discriminants and pairwise resultants are nonzero.
    For $p in.not cal(B)$, no two distinct factors vanish at the same residue modulo $p$,
    and their roots are simple. Consequently
  $ p^k divides F_i \( n \) & med arrow.l.r.double med p^k divides g \( n \) upright(" for some ") g in cal(G)_i \,\
\# Omega_p & lt.eq sum_(g in cal(G)) rho_g \( p^k \) = sum_(g in cal(G)) rho_g \( p \) lt.eq D \, $
  where $D = sum_(g in cal(G)) deg g$. Once $X$ exceeds all primes in $cal(B)$,
    the large-prime exceptional set for the family is contained in the union of the sets counted by the
    $T_(g \, k) \( X \)$, and hence has size $o_(upright(bold(F)) \, k) \( X \)$.
  For fixed $Y$ beyond $cal(B)$, the Chinese remainder theorem leaves exactly
  $ Q_Y product_(p lt.eq Y) (1 - frac(\# Omega_p, p^k)) quad upright("classes modulo ") Q_Y =
    product_(p lt.eq Y) p^k . $
  The estimate (2.5), with $D$ in place of $d$, bounds the contribution of $Y < p lt.eq X$.
    Combining it with the family tail and taking the two limits as in (2.4)–(2.7) gives the stated density on
    positive inputs. The product is positive because its local factors are positive and $sum_p \# Omega_p \/ p^k <
    oo$. At primes in $cal(B)$ the full set $Omega_p$ is retained:
    in particular, valuations contributed by different factors of one $F_i$ are not separated there.
    Taking $r = 1$ gives the first assertion with $\# Omega_p = rho_F \( p^k \)$.
    Empty products cover nonzero constants, and the finitely many integer zeros of nonconstant polynomials have no
    effect on the asymptotic. ◻
]

== 3 Affine counting with adaptive auxiliary primes <sec:affine-counting>

The geometric arguments below place the points to be counted on varieties whose equations vary with the box.
  We first prove a counting theorem that is uniform for these moving varieties.
  Its input is a lower bound for the number of independent monomials on each subvariety.
  Its proof successively cuts residue classes by polynomial equations.
  A deletion argument controls the primes at which these newly constructed equations have singular reduction.
  The local prime-adic determinant principle is due to Heath-Brown #cite(label("HeathBrown2002Density"))
  Section 3, Lemmas 5–6; the ordered local Hilbert and divisibility estimates are developed in
  #cite(label("Salberger2007")) Lemmas 2.3–2.5. Simultaneous prime conditions appear in
  #cite(label("Salberger2007")) Theorem 3.2 and #cite(label("Salberger2023")) Section 2, Theorem 2.2.
  The argument here includes the additional patch construction and deletion estimate needed when later varieties
  depend on earlier prime choices.

Throughout this section, degree means the ordinary degree of projective closure;
  for a reducible algebraic set we use the sum of the degrees of its irreducible components.
  Irreducibility is over $bb(C)$. We use the degree bounds for intersections and linear projections supplied by
  Bézout’s theorem. The ambient dimension is fixed.

Fix positive weights $omega_1 \, dots.h \, omega_N$. The weight of the coordinate monomial $z^alpha$ is $omega
  dot.op alpha$. For an affine algebraic set $A subset.eq bb(C)^N$, define

$ H_A \( T \) = dim_(bb(C)) "span" { z^alpha \|_A : omega dot.op alpha lt.eq T } . $

Thus $H_A \( T \)$ measures the supply of independent polynomial functions whose sizes in the weighted box are at
  most a constant times $X^T$.

#thm([Theorem 3.1.])[
  #emph[Fix integers $1 lt.eq r lt.eq N$, a degree bound $e_0$, a constant $C$,
    positive coordinate weights $omega_l$, and positive numbers $delta_1 \, dots.h \, delta_r$.
    For $X gt.eq 2$, let $S subset.eq bb(Z)^N$ satisfy
$ \| z_l \| lt.eq C X^(omega_l) quad \( z in S \) \, $

 and suppose $S$ lies on an algebraic set $Z$ of degree at most $e_0$ and dimension at most $r$.
   Assume the following uniform alternative. For every fixed degree bound $e$,
   each irreducible subvariety $A subset.eq Z$ defined over $bb(Q)$, of degree at most $e$ and dimension $h > 0$,
   meeting $S$, satisfies either
#[#set math.equation(numbering: n => "(3.1)")
 $ \| S ∩ A \| lt.double_(e \, alpha) X^alpha quad upright("for every fixed ") alpha > 0 \, $ <eq:affine-exception>]

 or
#[#set math.equation(numbering: n => "(3.2)")
 $ H_A \( T \) gt.eq frac(T^h, h ! delta_h^h) - C_e T^(h - 1) quad \( T gt.eq 1 \) . $ <eq:affine-hilbert-input>]

 The constants in these alternatives are uniform in $X \, Z \, S \, A$.
   Put $E_h = max_(h lt.eq s lt.eq r) delta_s$. Then, for every $epsilon > 0$,
#[#set math.equation(numbering: n => "(3.3)")
 $ \| S \| lt.double_epsilon X^(E_1 + dots.h.c + E_r + epsilon) . $ <eq:affine-counting-conclusion>]

 The implied constant depends only on the fixed data and the uniform constants in the hypotheses.
   In particular, no bound on the coefficients initially defining $Z$ is required.]
] <thm:affine-counting>

The coordinate weights are fixed in this statement. Uniformity over a family of weights follows from the proof
  when their positive lower bounds, upper bounds, and the constants in (3.2) are uniform.
  Empty sets cause no issue; zero-dimensional sets have at most their degree many points.
  We may therefore assume $1 lt.eq r lt.eq N$ and $S eq.not diameter$.

=== 3.1 Smooth patches with controlled equations <smooth-patches-with-controlled-equations>

A #emph[patch] will mean a triple $\( A \, G \, Delta \)$,
  where $A$ is an irreducible $bb(Q)$-defined variety of dimension $h$, the list $G$ consists of $N -
  h$ integer polynomials vanishing on $A$, and $Delta$ is a square Jacobian minor in $N -
  h$ chosen coordinate columns. It covers the points of $A$ at which $Delta eq.not 0$.
  If $h = N$, the list is empty and $Delta = 1$. A patch need not describe $A$ globally as a complete
  intersection: its equations provide local coordinates wherever its minor is nonzero.

#thm([Lemma 3.2.])[
  #emph[Let $S$ satisfy the box bound in Theorem 8. For every algebraic set $Z' subset.eq
    bb(C)^N$ of degree at most $e$, there is a list of boundedly many patches $\( A \, G \, Delta \)$ with $A
    subset.eq Z'$ that covers $S ∩ Z'$. Their degrees are bounded,
    and all coefficients of $G$ and $Delta$ are bounded by $C' X^(C')$, where the bounds depend only on $e \, N \,
    C$ and the weights. In particular, at a covered point $z$,
    the integer $Delta \( z \)$ is nonzero and has absolute value at most $C''
    X^(C'')$ with the same uniform dependence. The construction can be fixed as a function of $Z'$ and $S$ alone.]
] <lem:affine-patches>

#proof[
  Split $Z'$ into irreducible components. If a component $A$ is not defined over $bb(Q)$,
    some automorphism $sigma$ of $bb(C)$ fixing $bb(Q)$ satisfies $sigma \( A \) eq.not A$.
    Every rational point of $A$ lies in $A ∩ sigma \( A \)$, a proper intersection of bounded degree.
    We replace $A$ by the components of this intersection and continue in smaller dimension.
  Here is a justification of the descent assertion used in this step.
    If all such automorphisms fixed $A$, they would preserve each finite-dimensional space of its polynomial
    equations of degree at most $e'$. The reduced row-echelon basis in the ordered monomial coordinates is unique,
    so its coefficients would be fixed by all these automorphisms and hence rational.
    These spaces would give rational equations for $A$. The fixed field is indeed $bb(Q)$:
    a nonrational algebraic number has a conjugate, while a transcendental number can be included in a
    transcendence basis over $overline(bb(Q))$ and moved, for example by translation in that basis;
    these maps extend to automorphisms of $bb(C)$.
  Now let $A$ be defined over $bb(Q)$, of dimension $h$ and degree $e'$.
    The equations of ordinary degree at most $e'$ in its ideal have generic Jacobian rank $N - h$.
    To see this, choose $h$ coordinate functions algebraically independent in $bb(C) \( A \)$.
    Project onto these coordinates and, in turn, each remaining coordinate.
    Each image closure is an irreducible hypersurface of degree at most $e'$.
    Its equation has nonzero derivative in the extra coordinate, by separability in characteristic zero.
    Lifting these equations to $bb(C)^N$ gives a diagonal, generically nonzero minor in the remaining $N -
    h$ coordinates.
  Evaluate all monomials of degree at most $e'$ on the finite set $S ∩ A$.
    The resulting integer matrix has a bounded number of columns, all entries bounded by a fixed power of $X$.
    Its nullspace $W$ has an integer spanning set of polynomial height:
    select independent rows and pivot columns, solve for the nonpivot variables by cofactors,
    and clear the pivot determinant. All determinants have bounded size.
    We compare its complexification with the degree-$e'$ part of the ideal of $A$, which it contains.
  If this containment is strict, one bounded-height spanning polynomial of $W$ does not vanish identically on $A$.
    Its zero set contains $S ∩ A$, so we replace $A$ by the components of the resulting proper intersection and
    recurse. If equality holds, the bounded-height spanning equations furnish the generic Jacobian rank just
    proved. Choose $N - h$ of them and a minor $Delta$ nonzero on $A$.
    They give one patch, and we recurse on $A ∩ { Delta = 0 }$ for its uncovered points.
    A rational zero-dimensional component containing $z in S$ is the point $z$; use the equations $z'_l -
    z_l$ and minor $1$.
  Every recursive intersection is proper, with degree bounded in terms of the preceding degree.
    The dimension decreases along every branch, so Bézout’s bounds control the length of the list and all its
    degrees. The same argument controls all height exponents.
    Finally, fix the choices and ordering once as functions of the input algebraic set,
    its fixed degree allowance, and $S$. Equal inputs then give identical lists, equations, minors and orderings. ◻
]

The last convention is essential below. A prime used to define an input variety may affect that variety,
  but it is not separately consulted when choosing its patch list.

=== 3.2 A determinant cut in a simultaneous residue class <a-determinant-cut-in-a-simultaneous-residue-class>

For $h gt.eq 1$, let $s_h \( L \)$ be the sum of the first $L$ total degrees of monomials in $h$ variables,
  ordered by degree and counted with their monomial multiplicities. Counting lattice points in a simplex gives

#[#set math.equation(numbering: n => "(3.4)")
 $ s_h \( L \) = frac(h, h + 1) \( h ! \)^(1 \/ h) L^(1 + 1 \/ h) + O_h \( L \) . $ <eq:affine-local-orders>]

#thm([Lemma 3.3.])[
  #emph[Fix $nu > 0$ and a bound on the degree of a patch $\( A \, G \, Delta \)$ and its equations, with $h =
    dim A > 0$. Suppose $A$ satisfies (3.2). Let $z in S ∩ A$ be covered by the patch,
    and let $cal(Q)$ be distinct primes such that
$ q divides.not Delta \( z \) quad \( q in cal(Q) \) \, wide product_(q in cal(Q)) q gt.eq X^(delta_h + nu) . $

 For sufficiently large $X$, the set of all points in $S ∩
   A$ congruent to $z$ modulo these primes lies on a polynomial of bounded degree that does not vanish identically
   on $A$. The degree bound is uniform in the patch and primes, with dependence on $nu$ and the fixed data.
   Additional congruence conditions may also be imposed.]
] <lem:affine-residue-cut>

#proof[
  Fix $q divides.not Delta \( z \)$. Translate coordinates by $z$,
    taking as free coordinates the $h$ columns outside the chosen minor.
    The implicit equations $G = 0$ solve the other coordinates as power series in these free differences,
    with coefficients in $bb(Z)_q$: recursively solve by the Jacobian matrix, which is invertible over $bb(Z)_q$.
    The series converge on $q bb(Z)_q^h$, and Hensel uniqueness gives every solution to $G = 0$ congruent to $z$.
    Hence each coordinate monomial has such an integral expansion on the entire residue class.
  An $L$-by-$L$ determinant of monomial values at points in that class has $q$-adic valuation at least
    $s_h \( L \)$. Indeed, expand in monomials of the free differences.
    A term with a repeated expansion monomial vanishes, and the differences belong to $q bb(Z)_q$.
    The least total degree of $L$ distinct expansion monomials is $s_h \( L \)$.
    Truncation modulo arbitrary powers of $q$ justifies this argument for the convergent series.
  On the other hand, (3.2) permits us to choose independent coordinate monomials successively,
    with the $j$-th of weight at most
  $ delta_h \( h ! j \)^(1 \/ h) + O \( 1 \) . $
  To obtain this bound, substitute $T = delta_h \( h ! j \)^(1 \/ h) +
    C_1$ in the Hilbert lower bound and choose the fixed $C_1$ sufficiently large.
    Summing the weights and using (3.4), the first $L$ chosen monomials have total weight at most $delta_h
    s_h \( L \) + O \( L \)$.
  The absolute value of their evaluation determinant is therefore at most
  $ C_L X^(delta_h s_h \( L \) + C_2 L) . $
  It is an integer divisible by $#scale(x: 120%, y: 120%)[\(] product_(q in cal(Q)) q
    #scale(x: 120%, y: 120%)[\)]^(s_h \( L \))$. Choose $L$ sufficiently large that $nu s_h \( L \) > C_2 L$,
    and then take $X$ large. Every such determinant is zero. Thus the evaluations of these independent monomials
    on the full class have deficient rank. A nonzero rational linear combination vanishes on the class but not on
    $A$. Its ordinary degree is bounded because its weight and the positive minimum coordinate weight are bounded.
    All these choices are uniform under the stated hypotheses. ◻
]

We have obtained polynomial cuts whenever a sufficiently large product of primes is good for the current patch.
  The remaining issue is that the patch itself will depend on earlier primes.
  We address this by recording the entire finite sequence of evaluation ranks.

=== 3.3 Adaptive paths and a deletion estimate <adaptive-paths-and-a-deletion-estimate>

To compare a block of primes with the same block after one prime is deleted,
  we must define the successive patches for both choices before knowing which primes are good.
  We therefore construct all $r$ stages for every point and every block choice,
  even when the expected dimension drops fail. At each stage we retain the whole space of bounded-degree
  polynomials vanishing on the current residue class. Equal-dimensional nested spaces are equal;
  this will make unchanged evaluation ranks force the same subsequent patches.
  Choosing just one vanishing polynomial would not provide that implication.

Fix a small $gamma > 0$ and set $h_i = r + 1 - i$ for $1 lt.eq i lt.eq r$.
  Choose successive ordinary degree limits $D_i$ for the polynomial cuts.
  At step $i$, take $D_i$ large enough for Lemma 10 in parent dimension $h_i$, with $nu = gamma \/ 2$.
  This can be done inductively. Intersecting with the common zero set of a polynomial space of degree at most
  $D_i$, then applying Lemma 9, gives degree bounds determined by the parent bound and $D_i$.
  These bounds hold even when dimension does not decrease. Consequently they cover every path of the fixed length $r$.

Let $cal(B)_1 \, dots.h \, cal(B)_r$ be disjoint finite blocks of primes, and write

$ Q_i = product_(j lt.eq i) product_(q in cal(B)_j) q . $

For each $z in S$, define a path through all $r$ steps as follows.
  Take the first patch $\( A_0 \, G_0 \, Delta_0 \)$ of $Z$ covering $z$. Given its parent patch at step $i$, let

#[#set math.equation(numbering: n => "(3.5)")
 $ cal(K)_i = {F in bb(Q) \[ z_1 \, dots.h \, z_N \]_(lt.eq D_i) : F \( z' \) =
   0 upright(" for all ") z' in S ∩ A_(i - 1) \, med z' equiv
   z med \( mod med Q_i \)} . $ <eq:affine-evaluation-kernel>]

Record its codimension $rho_i$ in the polynomial space. Take the first patch $\( A_i \, G_i \, Delta_i \)$
  covering $z$ in $A_(i - 1) ∩ V \( cal(K)_i \)$. Every such patch exists because the intersection contains $z$.
  In particular, all $Delta_i \( z \)$ are nonzero integers of uniformly polynomial size.
  An exceptional alternative or a zero-dimensional parent does not stop this construction.

Adding a prime to one block makes the vector $\( rho_1 \, dots.h \, rho_r \)$ lexicographically nonincreasing.
  Until its first changed entry the parent patches agree: the new residue class is a subset of the old one,
  so the kernels are nested, and equal codimensions make them equal.
  Their intersection sets and deterministic patch lists therefore agree as well.
  The first changed codimension can only decrease. Moreover,
  equality of the complete rank vectors forces equality of all kernels and patches along the paths.

Put $M_i = binom(N + D_i, N)$. Encode the rank vector by the integer

#[#set math.equation(numbering: n => "(3.6)")
 $ cal(R) = sum_(i = 1)^r rho_i product_(j > i) \( M_j + 1 \) \, wide 0 lt.eq cal(R) < B_0 :=
   product_(i = 1)^r \( M_i + 1 \) . $ <eq:affine-rank-record>]

It is nonincreasing when a prime is added. An unchanged encoding gives identical evaluated minors along the entire path.

#thm([Lemma 3.4.])[
  (Deletion estimate).  #emph[Fix $z in S$, all blocks except the $i$-th,
    and a prime pool $cal(P)_i$ disjoint from those blocks, whose primes lie between $X^zeta$ and $C_r X^zeta$,
    where $zeta > 0$ is fixed and $\| cal(P)_i \| arrow.r oo$.
    Choose $t$ uniformly among $T_0$ consecutive positive integers $ell \, dots.h \, ell + T_0 - 1$,
    fixed independently of $X$, and then choose $cal(B)_i$ uniformly among the $t$-subsets of the pool.
    The expected fraction of primes in $cal(B)_i$ dividing at least one of the full-path integers
    $Delta_0 \( z \) \, dots.h \, Delta_r \( z \)$ is at most
$ B_0 \/ T_0 + o \( 1 \) . $

 The error is uniform in $z$ and in the fixed other blocks.]
] <lem:affine-deletion>

#proof[
  Delete a uniformly chosen prime $q$ from $cal(B)_i$. Let $F \( t \)$ be the expected record (3.6) for a uniform
    $t$-subset. The deleted subset is uniform of size $t - 1$,
    so the expected increase in the record is $F \( t - 1 \) - F \( t \)$.
    This increase is a nonnegative integer and is at least one whenever the record changes.
    Averaging over the consecutive sizes gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ bb(P) \( upright("record changes") \) lt.eq frac(F \( ell - 1 \) - F \( ell + T_0 - 1 \), T_0) lt.eq B_0 /
     T_0 . $ <eq:affine-deletion-change>]
  Condition now on the deleted subset and all other blocks.
    The deleted-path minors at $z$ are fixed nonzero integers of uniformly polynomial size.
    Their product has only $O \( 1 \/ zeta \)$ prime divisors at least $X^zeta$.
    The removed prime is uniform in the complement of the deleted subset in $cal(P)_i$,
    whose size tends to infinity. Its conditional probability of dividing that product is therefore $o \( 1 \)$,
    uniformly.
  No conditioning on record stability is made in this last assertion.
    Rather, if the record is unchanged, the full and deleted paths have identical minors. Consequently
  $ { q upright(" divides a full-path minor") } subset.eq { upright("record changes") } union { q
    upright(" divides a deleted-path minor") } . $
  The probability is bounded by (3.7) plus $o \( 1 \)$. Choosing $q$ uniformly from the full block samples exactly
    its fraction of primes dividing a full-path minor, proving the lemma. ◻
]

=== 3.4 Good cumulative products and the counting tree <good-cumulative-products-and-the-counting-tree>

We now choose blocks for which at least half of $S$ has enough good primes at every stage.
  As the scheduled dimension falls from $r$ to $1$, the determinant thresholds are $delta_r \, dots.h \, delta_1$.
  Earlier primes remain available at later stages, so we allocate the nondecreasing cumulative exponents $E_r \,
  dots.h \, E_1$ instead. Recall that $E_h = max_(h lt.eq s lt.eq r) delta_s$. Put $E_(r + 1) = 0$ and

$ a_i = E_(h_i) - E_(h_i + 1) gt.eq 0 . $

Choose a small $xi > 0$ such that

#[#set math.equation(numbering: n => "(3.8)")
 $ xi \( E_1 + r gamma \) < gamma \/ 2 . $ <eq:affine-bad-fraction>]

Take $T_0$ large in terms of $r \, B_0 \, xi$, then take $zeta > 0$ so small that $zeta \( T_0 + 1 \) lt.eq
  gamma$. Use disjoint prime pools of cardinality tending to infinity, all between $X^zeta$ and $C_r X^zeta$.
  The lower and upper Chebyshev bounds for the prime-counting function give such pools for sufficiently large
  fixed $C_r$: partition the primes in that interval into $r$ pools of comparable size.
  Choose the blocks independently, with block $i$ sampled as in Lemma 11, starting its size interval at

$ ell_i = ⌈frac(a_i + gamma, zeta)⌉ . $

Every allowed size $t_i$ then satisfies

#[#set math.equation(numbering: n => "(3.9)")
 $ a_i + gamma lt.eq zeta t_i lt.eq a_i + 2 gamma . $ <eq:affine-block-sizes>]

All sizes are constants as $X$ tends to infinity.

Call $z in S$ #emph[regular] if in each block at most a fraction $xi$ of its primes divide any of the full-path
  minors at $z$. Lemma 11, Markov’s inequality and a union bound give

$ bb(P) \( z upright(" is not regular") \) lt.eq r / xi #scale(x: 120%, y: 120%)[\(] B_0 \/ T_0 +
  o \( 1 \) #scale(x: 120%, y: 120%)[\)] < 1 / 2 $

for our sufficiently large $T_0$ and then sufficiently large $X$.
  Summing over the finite set $S$, some fixed choice of blocks makes at least $\| S \| \/ 2$ points regular.
  Fix those blocks.

For a regular point, all but a fraction $xi$ of the primes in each of the first $i$ blocks avoid the current
  parent minor $Delta_(i - 1) \( z \)$. Their product is at least

#[#set math.equation(numbering: n => "(3.10)")
 $ X^(\( 1 - xi \) zeta sum_(j lt.eq i) t_j) & gt.eq X^(\( 1 - xi \) \( E_(h_i) + i gamma \)) gt.eq
   X^(delta_(h_i) + gamma \/ 2) . $ <eq:affine-cumulative-product>]

The first inequality uses $sum_(j lt.eq i) a_j = E_(h_i)$; the last uses (3.8).
  This cumulative product includes primes chosen before the current parent was constructed.

The full paths were needed to compare prime choices in the deletion estimate.
  We now arrange the full paths of regular points in a tree, using the same kernels and fixed patch lists,
  and stop whenever a bound is already available. Start from their bounded list of initial patches;
  a node records its parent patch and the previous residue classes.
  Stop at a parent satisfying (3.1), charging all its points by that bound;
  also stop at a zero-dimensional parent. Otherwise continue as follows.
  We show inductively that a parent at step $i$ has dimension at most $h_i$.

Fix such a parent patch $\( A \, G \, Delta \)$ of dimension $h lt.eq h_i$.
  At an auxiliary prime $q$, its reductions with $Delta eq.not 0$ number $O \( q^h \)$.
  Indeed, fix the $h$ free coordinates determined by the minor.
  The other $N - h$ equations have invertible Jacobian at every point being counted,
  so these points are isolated zeros of that square system.
  Bézout bounds their number by a fixed constant, even if other components of the fiber have positive dimension.
  Summing over the free coordinates proves the bound. It uses no assumption that the whole variety has good reduction.

For regular points, the primes of the new block at which this parent minor vanishes form a subset of size at most
  $xi t_i$. Allow all such subsets; their number is at most $2^(t_i)$, a constant.
  At those primes use the trivial $q^N$ bound and at the others use $O \( q^(h_i) \)$.
  Since $q lt.eq C_r X^zeta$, the number of new simultaneous residue classes is at most

#[#set math.equation(numbering: n => "(3.11)")
 $ O #h(-0.16667em) (X^(zeta t_i \( h_i + N xi \))) lt.eq O #h(-0.16667em)
   (X^(\( a_i + 2 gamma \) \( h_i + N xi \))) . $ <eq:affine-branch-count>]

The constants from Bézout raised to $t_i$ are still independent of $X$.
  Imposing earlier congruences can only decrease this count.

Consider one resulting class containing a regular point $z$.
  If the parent has dimension exactly $h_i$, then (3.10) and Lemma 10 give a polynomial in $cal(K)_i$ that does
  not vanish identically on the parent. This polynomial vanishes on the #emph[entire] class in $S ∩ A$:
  every class member has the same residues as $z$ at the good primes and satisfies $G = 0$.
  Thus it is a cut for the kernel in (3.5), not merely for its regular points.
  Consequently $A ∩ V \( cal(K)_i \)$ has dimension at most $h_i - 1$,
  and its fixed patch list has boundedly many members. If the parent had smaller dimension already,
  its children automatically satisfy the same bound. This proves the dimension induction.

After $r$ stages every nonexceptional leaf is zero-dimensional and contains boundedly many points.
  The total branching exponent from (3.11) is at most

#[#set math.equation(numbering: n => "(3.12)")
 $ sum_(i = 1)^r h_i a_i + 2 gamma sum_(i = 1)^r h_i + N xi \( E_1 + 2 r gamma \) . $ <eq:affine-exponent-accounting>]

The first term telescopes to

$ sum_(h = 1)^r h \( E_h - E_(h + 1) \) = sum_(h = 1)^r E_h . $

Every prefix of the tree has no larger exponent, because all the block increments and errors are nonnegative.
  Hence stopping at exceptional parents multiplies this bound only by $O \( X^alpha \)$, using (3.1);
  the bounded number of possible stopping depths contributes a constant.

To complete the choices for a prescribed $epsilon$, first take $gamma$ so small that the second term of (3.12) is
  less than $epsilon \/ 4$. Choose the degree limits and hence $B_0$.
  Then take $xi$ small enough for (3.8) and for the last term of (3.12) to be less than $epsilon \/ 4$.
  Take $alpha < epsilon \/ 4$, then choose $T_0$, $zeta$ and finally $X$ as above.
  This order makes every degree, height and probability constant fixed before $X$ tends to infinity.
  We have bounded at least half of $S$ by the right side of (3.3); multiplying by two proves Theorem 8.

== 4 Arithmetic factorization and paired boxes <sec:arithmetic-boxes>

We convert a large prime-power divisor into an integral equation in a fixed number field.
  Balancing its factors at every embedding will put their projective coordinates in compact sets.
  The resulting equations then pair small boxes in the two sets of coordinates,
  with only boundedly many partners for each box. This factorization-and-balancing strategy follows Reuss
  #cite(label("Reuss2015PowerFree")) Section 3, with the Gaussian factorization in Heath-Brown
  #cite(label("HeathBrown2012Squarefree")) Sections 2–4 as an earlier model.
  We use the standard ideal factorization, class-group finiteness and full logarithmic unit lattice from
  #cite(label("milne2020ant")) Theorems 3.7, 4.4 and 5.9.

Throughout this section, $f in bb(Z) \[ T \]$ is primitive and irreducible,
  has degree $d$ and positive leading coefficient $c$, and $k = d - 2 gt.eq 2$.
  Fix a root $theta$, put $K = bb(Q) \( theta \)$, and let $L$ be a splitting field of $f$.
  Write $sigma_i : K arrow.r.hook L$ for the $d$ embeddings, with $theta_i = sigma_i \( theta \)$. We consider

$ X < n lt.eq 2 X \, wide P lt.eq p lt.eq 2 P \, wide p > X \, wide p^k divides f \( n \) \, wide P = X^eta \, $

and put $b = d - k eta$. All constants below may depend on $f$; none depends on the individual $n \, p$ or on $X$.

#thm([Lemma 4.1.])[
  (Balanced factorization).  #emph[There are a positive integer $mu$ and a fixed finite list of integral ideals
    $frak(c)$ of $K$ with the following property. For all sufficiently large $X$,
    each pair $\( n \, p \)$ above admits integral elements $alpha \,
    beta in cal(O)_K$ and one ideal from the list such that
#[#set math.equation(numbering: n => "(4.1)")
 $ alpha^k beta = mu \( n - theta \) \, wide \| N_(K \/ bb(Q)) \( alpha \) \| = p N \( frak(c) \) \,
   $ <eq:arithmetic-factorization>]

 and, for every embedding $sigma_i$,
#[#set math.equation(numbering: n => "(4.2)")
 $ \| sigma_i \( alpha \) \| asymp_f P^(1 \/ d) \, wide \| sigma_i \( beta \) \/ mu \| asymp_f X \/ P^(k \/ d) .
   $ <eq:arithmetic-balanced-sizes>]

 We may select one representation for each $n$ under consideration.
   For a fixed ideal case and fixed $alpha$, there are at most $d$ selected values of $n$.]
] <lem:balanced-factorization>

#proof[
  The element $c theta$ is integral, with monic minimal polynomial $F \( T \) =
    c^(d - 1) f \( T \/ c \) in bb(Z) \[ T \]$, and
  #[#set math.equation(numbering: n => "(4.3)")
   $ N_(K \/ bb(Q)) \( c n - c theta \) = F \( c n \) = c^(d - 1) f \( n \) . $ <eq:arithmetic-norm>]
  Exclude the finitely many primes dividing $c$, the discriminant of $F$,
    or $\[ cal(O)_K : bb(Z) \[ c theta \] \]$; the factorization theorem for this order is recalled in
    #cite(label("milne2020ant")) Theorem 3.41 and Remark 3.43.
    For every remaining prime $p$ dividing $f \( n \)$, exactly one prime ideal $frak(p)$ above $p$ contains $c
    n - c theta$. Indeed its residue factor must be the simple linear factor $T - c n$ of $F$ modulo $p$.
    Thus $N \( frak(p) \) = p$, and (4.3) shows that its valuation in $\( c n - c theta \)$ is exactly
    $v_p \( f \( n \) \)$. In particular, $frak(p)^k divides \( c n - c theta \)$.
    Every excluded prime is smaller than $X$ once $X$ is sufficiently large.
  Choose fixed integral representatives for the ideal classes of $K$.
    One of them, denoted $frak(c)$, makes $frak(p) frak(c)$ principal. Write
  $ \( alpha \) = frak(p) frak(c) . $
  Then $alpha$ is integral and its absolute norm is $p N \( frak(c) \)$.
    We may multiply $alpha$ by a unit to obtain the first estimate in (4.2).
    To see that this balances all embeddings, use one logarithmic coordinate for each real embedding and each
    complex pair, with respective weights $1$ and $2$. Subtract $d^(- 1)
    log \( p N \( frak(c) \) \)$ from every coordinate. The resulting vector lies in the weighted sum-zero
    hyperplane. Dirichlet’s Unit Theorem allows it to be moved into a bounded fundamental parallelepiped of the
    unit lattice. Exponentiating gives the asserted bounds at every real and complex embedding.
  Choose a positive integer $q$ such that $q frak(c)^(- k) subset.eq cal(O)_K$ for every ideal in the finite list,
    and put $mu = c q$. Such a $q$ exists; for example one may take a common multiple of the integers
    $N \( frak(c) \)^k$. The ideal $\( c n - c theta \) frak(p)^(- k)$ is integral, so
  $ beta = frac(mu \( n - theta \), alpha^k) $
  is integral. Since $\| n - theta_i \| asymp_f X$, the second estimate in (4.2) follows from the first.
  For each $n$ choose one admissible prime in the dyadic range, one ideal case and one balanced generator;
    these choices determine $beta$. For a fixed ideal case, $alpha$ determines $p = \|
    N_(K \/ bb(Q)) \( alpha \) \| \/ N \( frak(c) \)$. Outside the excluded primes,
    $f$ has at most $d$ roots modulo $p^k$. Since $p^k > X$, each such residue class meets $\( X \, 2 X \]$ in at
    most one integer. This proves the last assertion. ◻
]

Fix an integral basis $omega_0 \, dots.h \, omega_(d - 1)$ of $K$ and write

$ alpha = sum_(j = 0)^(d - 1) x_j omega_j \, wide beta = sum_(j = 0)^(d - 1) y_j omega_j \, wide x \, y in bb(Z)^d . $

Define the conjugate linear forms

$ a_i \( x \) = sum_j sigma_i \( omega_j \) x_j \, wide b_i \( y \) = mu^(- 1) sum_j sigma_i \( omega_j \) y_j . $

The selected points satisfy

#[#set math.equation(numbering: n => "(4.4)")
 $ a_i \( x \)^k b_i \( y \) = n - theta_i \, wide \| a_i \( x \) \| asymp_f X^(eta \/ d) \,
   wide \| b_i \( y \) \| asymp_f X^(b \/ d) . $ <eq:arithmetic-conjugate-equations>]

Both embedding matrices are invertible. There is at most one selected point for each $n$,
  and a fixed $x$ costs $O_f \( 1 \)$ selected points, including all ideal cases.
  These two properties survive any invertible integral changes in $x$ and $y$.

=== 4.1 Uniform analytic coordinates <uniform-analytic-coordinates>

Split into the finitely many choices of a largest absolute coordinate of $x$ and of $y$,
  breaking ties in a fixed order. Within each chart reindex them as $x_0 \, y_0$.
  Invertibility of the embedding matrices and (4.2) give

$ \| x_0 \| asymp_f P^(1 \/ d) \, wide \| y_0 \| asymp_f X \/ P^(k \/ d) . $

Put

$ s_j = x_j \/ x_0 \, wide t_j = y_j \/ y_0 quad \( 1 lt.eq j < d \) \, wide z = 1 \/ n . $

Thus $s \, t in \[ - 1 \, 1 \]^(d - 1)$. Every normalized conjugate form $a_i \( 1 \, s \)$ and $b_i \( 1 \, t \)$
  has modulus bounded above and below by positive constants.
  The chart vectors $s \, t$ here are distinct from the scalar parameter used later to choose bidegrees.

#thm([Lemma 4.2.])[
  (Paired boxes).  #emph[Fix $0 < w < 1$ and an integer $M asymp X^w$.
    Partition each of the $s$- and $t$-cubes into grid boxes of side $M^(- 1)$.
    For the selected points in any fixed arithmetic and coordinate chart, the following hold uniformly.]
  + #emph[The vector $t$ is locally an analytic function of $\( s \, z \)$.
    Conversely, $s$ is locally given by boundedly many analytic branches in $\( t \, z \)$.]
  + #emph[The branches needed at a counted point extend to a neighborhood of fixed radius containing the
    corresponding grid base with last coordinate $z = 0$. Derivatives of every fixed order are uniformly bounded there.]
  + #emph[Every relevant box of either type has $O_f \( 1 \)$ partner boxes of the other type.
    In particular, there are $O_f \( M^(d - 1) \)$ relevant pairs of boxes.]
  #emph[When $m = \( d - 1 \) w$, the last bound is $O_f \( X^m \)$.
    No primality assumption on $M$ is needed for this lemma.]
] <lem:paired-boxes>

#proof[
  Let $cal(A)$ and $cal(B)$ be the invertible complex linear maps from the chart coordinates to their $a$- and
    $b$-embedding vectors. At a counted point put
  $ kappa = frac(x_0^k y_0, n) . $
  The size bounds show $\| kappa \| asymp_f 1$. The normalized equations (4.4) give
  #[#set math.equation(numbering: n => "(4.5)")
   $ (frac(1 - theta_i z, a_i \( 1 \, s \)^k))_(i = 1)^d = kappa thin cal(B) \( 1 \, t \) .
     $ <eq:arithmetic-chart-forward>]
  Applying $cal(B)^(- 1)$ and dividing by its first coordinate gives the forward formula for $t$.
    Its normalizing denominator equals $kappa$ at the counted point, and is therefore bounded away from zero.
  In the reverse direction, take local $k$-th roots of
  $ frac(1 - theta_i z, b_i \( 1 \, t \)) . $
  The inputs lie in a fixed bounded annulus separated from zero.
    At a counted point, compatible roots have the form $gamma a_i \( 1 \, s \)$ with $gamma^k = kappa$.
    Applying $cal(A)^(- 1)$ gives $gamma \( 1 \, s \)$; its first coordinate has modulus $asymp_f 1$.
    Thus division by that coordinate is again allowed. There are at most $k^d$ root choices,
    so only boundedly many branches are needed. Complex embeddings cause no additional restriction:
    we only retain the branches that describe the counted real coordinate vectors.
  These formulas also give uniform neighborhoods. The normalized forms,
    root inputs and the normalizing denominators have fixed upper bounds and positive lower bounds at every
    counted point. On a sufficiently small complex polydisc, the same lower bounds hold with a smaller constant.
    Each root has a holomorphic branch on that polydisc, and the rational operations remain holomorphic there.
    Their formulas, or Cauchy’s estimates on a slightly smaller polydisc,
    bound every fixed order of derivative uniformly. This construction is local;
    it does not require one choice of a root on the whole annulus.
  The distance from a counted point to its grid base with $z = 0$ is $O \( M^(- 1) + X^(- 1) \)$,
    so that base lies in the same fixed neighborhood for large $X$.
    The allowed $z$-interval has length $O \( X^(- 1) \)$. Since $w < 1$, this is $O \( M^(- 1) \)$.
    The derivative bound therefore maps one relevant $s$-box and the whole $z$-interval into a set of $t$-diameter
    $O_f \( M^(- 1) \)$, meeting $O_f \( 1 \)$ grid boxes. For a fixed $t$-box,
    continue its relevant root choices to the common grid base. There are at most $k^d$ such choices there.
    Every branch realized by a counted point has a uniformly nonzero normalizing denominator throughout this small
    box and the allowed $z$-interval. Each therefore has an $s$-image of diameter $O_f \( M^(- 1) \)$,
    proving the reverse partner bound. There are $O \( M^(d - 1) \)$ boxes in either fixed cube,
    proving the total bound. ◻
]

We have reduced the selected inputs to finitely many arithmetic cases and paired projective boxes.
  The equations (4.4) retain the integer input $n$, while the analytic descriptions provide the small variables
  for the determinant cuts in the next section.

== 5 Bihomogeneous determinant cuts <sec:determinant-cuts>

We now reduce the dimension of the algebraic sets containing the points in each paired box of Lemma 13.
  The first determinant gives a hypersurface section. When one component of that section is defined using only one
  coordinate block, a second determinant reduces its dimension again.
  The estimates for this second step must be uniform in the equation of the moving component.
  The Taylor-determinant construction belongs to the real determinant method of Bombieri–Pila and its
  approximating form developed by Heath-Brown #cite(label("BombieriPila1989")) #cite(label("HeathBrown2009Sums"));
  the number-field application follows the arrangement in #cite(label("Reuss2015PowerFree")) Section 4.
  We supply the complete estimates, including the second cut on pure components.

=== 5.1 The bicone and its Hilbert polynomial <the-bicone-and-its-hilbert-polynomial>

Fix the distinct roots $theta_1 \, dots.h \, theta_d$, and put $k = d - 2$.
  In $bb(C)^(2 d)$, with coordinate blocks $a = \( a_i \)$, $b = \( b_i \)$,
  let $cal(B)$ be the scheme defined by the condition

$ \( a_i^k b_i \)_(i = 1)^d in "span"_(bb(C)) { \( 1 \)_i \, \( theta_i \)_i } . $

Equivalently, impose $d - 2$ independent linear relations on these products.
  Each relation has bidegree $\( k \, 1 \)$. Write the products as

$ a_i^k b_i = N_0 - theta_i L_0 \; $

on $cal(B)$, the functions $N_0 \, L_0$ are fixed linear combinations of the products.
  The corresponding subvariety of $bb(P)^(d - 1) times bb(P)^(d - 1)$ will be denoted by $cal(V)$.

#thm([Lemma 5.1.])[
  #emph[The defining ideal of $cal(B)$ is prime and is a complete intersection of $d -
    2$ equations of bidegree $\( k \, 1 \)$. The dimension of $cal(V)$ is $d$.
    If $A \, B$ tend to infinity with fixed positive rational ratio $B \/ A$,
    its bihomogeneous coordinate space in degree $\( A \, B \)$ has dimension
$ R \( A \, B \) + O \( A^(d - 1) \) \, $

 where
#[#set math.equation(numbering: n => "(5.1)")
 $ R \( A \, B \) = frac(1, d !) sum_(j = 1)^(d - 1) binom(d, j) binom(d - 2, j - 1) k^(j - 1) A^(d - j) B^j .
   $ <eq:hilbert-polynomial>]

]
] <lem:bicone>

#proof[
  Where all $a_i eq.not 0$, the coordinates $a_i \, N_0 \, L_0$ are free and determine the $b_i$.
    This is an integral smooth open of dimension $d + 2$. If some $a_i = 0$ and the product vector is nonzero,
    then $N_0 = theta_i L_0$, $L_0 eq.not 0$, and every other $a_j eq.not 0$, since the roots are distinct.
    This stratum has the $d - 1$ coordinates $a_j$, together with $L_0 \, b_i$, and dimension $d + 1$.
    If the product vector is zero, the equations are $a_i^k b_i = 0$ for all $i$.
    Their zero set is a union of coordinate $d$-planes.
  These counts give codimension $d - 2$ and a unique top-dimensional component meeting the first open.
    Here and below we use the following complete-intersection criterion.
    In a polynomial ring, homogeneous equations of the expected codimension form a regular sequence;
    their quotient is equidimensional and Cohen–Macaulay, with no embedded components.
    If there is one top-dimensional component and the scheme is reduced at its generic point,
    the quotient is reduced and hence a domain. For completeness, localize at the homogeneous maximal ideal.
    The ambient regular local ring is Cohen–Macaulay, so the expected codimension gives a regular sequence;
    the positive grading detects regularity globally. The quotient is Cohen–Macaulay and equidimensional by the
    local dimension formula #cite(label("stacks-project")) Tags 00NQ, 02JN, 00NB, and 00NA.
    It therefore has no embedded associated primes. Generic reducedness on its unique minimal component then
    implies reducedness #cite(label("stacks-project")) Tags 031Q and 031R.
    This reasoning also applies to positive weighted homogeneous equations.
    In the present case the indicated smooth open supplies generic reducedness, proving primeness.
    Passing to the two projective factors subtracts two dimensions.
  The Hilbert series of the regular sequence is
  $ frac(\( 1 - z_1^k z_2 \)^(d - 2), \( 1 - z_1 \)^d \( 1 - z_2 \)^d) . $
  Thus the dimension in bidegree $\( A \, B \)$ is the $\( d - 2 \)$-fold finite difference,
    with step $\( k \, 1 \)$, of $binom(A + d - 1, d - 1) binom(B + d - 1, d - 1)$. Its leading term is
  $ \( k partial_A + partial_B \)^(d - 2) frac(A^(d - 1) B^(d - 1), \( \( d - 1 \) ! \)^2) \, $
  which expands to (5.1). The remaining terms have total degree at most $d - 1$. ◻
]

Define the one-variable polynomials

$ H \( t \) = d ! R \( 1 \, t \) \, wide H_a \( t \) = \( d - 1 \) ! \( partial_A R \) \( 1 \, t \) \, wide
  H_b \( t \) = \( d - 1 \) ! \( partial_B R \) \( 1 \, t \) . $

They measure the spaces of determinant columns on $cal(V)$ and on a pure hypersurface section, respectively.

#thm([Proposition 5.2.])[
  #emph[Fix positive upper exponents $eta_(+) \, b_(+)$. Consider a paired box as in Lemma 13,
    with integer coordinates satisfying
$ \| x_i \| lt.double X^(eta_(+) \/ d) \, wide \| y_i \| lt.double X^(b_(+) \/ d) . $

 Assume that its normalized chart variables have width $O \( X^(- w) \)$, that $z = 1 \/ n = O \( X^(- 1) \)$,
   and that the forward and reverse analytic chart functions have the uniform derivative bounds of that lemma.
   Let $t_(*) \, w > 0$ be fixed rational numbers satisfying
#[#set math.equation(numbering: n => "(5.2)")
 $ w^(d - 1) H \( t_(*) \) & > (frac(\( d + 1 \) \( eta_(+) + b_(+) t_(*) \), d^2))^d \,\
w^(d - 2) min { H_a \( t_(*) \) \, H_b \( t_(*) \) } & > (frac(eta_(+) + b_(+) t_(*), d - 1))^(d - 1) .
  $ <eq:cut-conditions>]

 For sufficiently large $X$, the points in this box lie on a bounded number of bounded-degree algebraic sets of
   the following two types:]
  + #emph[a mixed hypersurface section of $cal(V)$, whose bicone is a prime complete intersection with one
    additional equation of bidegree $\( lambda \, s_0 \)$, where $lambda \, s_0 gt.eq 1$;]
  + #emph[a set of biprojective dimension at most $d - 2$.]
  #emph[On returning to the affine equations $a_i^k b_i = n - theta_i$,
    the corresponding dimensions are $d$ and at most $d - 1$.
    All number and degree bounds are uniform over the boxes and $X$.]
] <prop:archimedean-cuts>

=== 5.2 A uniform Taylor determinant estimate <a-uniform-taylor-determinant-estimate>

We first describe the analytic estimate used in both cuts.
  Let $ell$ column functions have uniformly bounded derivatives on the chart neighborhoods,
  and let the small variables be $u_1 \, dots.h \, u_(d - 1) \, z$, of weights $w \, dots.h \, w \, 1$.
  For a fixed finite set of evaluation points, suppose that the rank of the evaluation columns of monomials of
  weight at most $T$ is at most

$ a T^r + O \( T^(r - 1) + 1 \) \, wide a > 0 . $

If $ell$ such monomial columns are independent, and their weights in increasing order are $lambda_j$,
  then $j lt.eq a lambda_j^r + O \( lambda_j^(r - 1) + 1 \)$. Inverting and summing gives

#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(j = 1)^ell lambda_j gt.eq frac(r, r + 1) a^(- 1 \/ r) ell^(1 + 1 \/ r) -
   O \( ell \) . $ <eq:taylor-rank-weights>]

The constants are uniform whenever the rank estimate is uniform.

Expand each analytic column at the box base in the #emph[original] monomials in $u \, z$,
  to a fixed total order $K$. A polynomial summand in the multilinear expansion of the determinant vanishes if its
  monomial evaluation columns are dependent. Otherwise (5.3) bounds its total weight,
  and hence its absolute value by a constant times $X$ to the negative of that weight.
  The Taylor coefficients are uniformly bounded. The remainder in a column is
  $O \( X^(- min \( w \, 1 \) \( K + 1 \)) \)$. After fixing the column degrees and $ell$,
  choose $K$ so large that every determinant term containing a remainder has a stronger bound than the required
  one. There are then only boundedly many terms. Thus the normalized determinant is

#[#set math.equation(numbering: n => "(5.4)")
 $ lt.double X^(- S) \, wide S = frac(r, r + 1) a^(- 1 \/ r) ell^(1 + 1 \/ r) -
   O \( ell \) . $ <eq:taylor-determinant-bound>]

This argument requires only exact dependence of evaluation columns,
  not any bound on coefficients expressing that dependence.

=== 5.3 The first cut and its components <the-first-cut-and-its-components>

Choose large integer bidegrees with $B \/ A = t_(*)$, and choose a basis of the degree-$\( A \, B \)$ coordinate
  space of $cal(V)$ from raw monomials in the integral coordinates $x \, y$. By Lemma 14, its size is

$ ell = frac(H \( t_(*) \), d !) A^d + O \( A^(d - 1) \) . $

For any $ell$ counted points, the raw evaluation determinant is an integer.
  Divide each row by $x_0^A y_0^B$, using the nonzero chart coordinates.
  If the determinant is nonzero, its normalized absolute value is at least

#[#set math.equation(numbering: n => "(5.5)")
 $ c_(A \, B) thin X^(- ell A \( eta_(+) + b_(+) t_(*) \) \/ d) \, wide
   c_(A \, B) > 0 . $ <eq:integer-determinant-lower>]

The constant can be chosen uniformly in the box.

Normalized monomials are analytic functions of the chart variables and $z$.
  Without an extra relation among the small variables, their monomial count is

$ frac(T^d, d ! w^(d - 1)) + O \( T^(d - 1) + 1 \) . $

Equations (5.3)–(5.4) therefore give

$ S = frac(d, d + 1) \( d ! w^(d - 1) \)^(1 \/ d) ell^(1 + 1 \/ d) - O \( ell \) \, wide S / ell =
  frac(d, d + 1) #scale(x: 120%, y: 120%)[\(] w^(d - 1) H \( t_(*) \) #scale(x: 120%, y: 120%)[\)]^(1 \/ d) A +
  O \( 1 \) . $

The first inequality in (5.2) makes this exponent larger than the one in (5.5),
  first for sufficiently large fixed $A \, B$, then for sufficiently large $X$. Every such determinant vanishes.
  The evaluation map therefore has rank less than $ell$, also when there are fewer than $ell$ points.
  Its kernel gives a bihomogeneous equation vanishing on all the counted points but not identically on $cal(V)$.

We must describe the actual components of this cut before using their Hilbert functions.
  On the open where all $a_i eq.not 0$, substitute $b_i = \( N_0 - theta_i L_0 \) \/ a_i^k$, clear denominators,
  and factor. Each relevant irreducible factor

$ F \( a \, N_0 \, L_0 \) = sum_I a^I f_I \( N_0 \, L_0 \) $

is bihomogeneous, say of degrees $\( l \, s_0 \)$ in $a$ and $\( N_0 \, L_0 \)$.
  Indeed, the two scaling actions preserve each irreducible factor up to scalar.
  Factors $a_i$ or $L_0$ do not meet the open of counted points and can be omitted.
  Returning to the $\( a \, b \)$-coordinates replaces $N_0 - theta_i L_0$ by $a_i^k b_i$,
  so the substituted terms may acquire common powers of $a_i$.
  We extract these powers and then verify that the remaining equation has no extra boundary component.
  For each nonzero $f_I$, set

$ nu_(i \, I) = "ord"_(N_0 - theta_i L_0) f_I \, wide e_i = min_I \( I_i + k nu_(i \, I) \) . $

Writing $f_I = product_i \( N_0 - theta_i L_0 \)^(nu_(i \, I)) g_I$, the expression

#[#set math.equation(numbering: n => "(5.6)")
 $ C \( a \, b \) = sum_I a^(I + k nu_I - e) b^(nu_I) g_I \( N_0 \, L_0 \) $ <eq:saturated-bihomogeneous-cut>]

is a polynomial: every exponent of $a$ is nonnegative. It represents $F \/ product_i a_i^(e_i)$ on the bicone,
  and has bidegree

$ \( lambda \, s_0 \) \, wide lambda = l + k s_0 - sum_i e_i . $

This extension has no unwanted boundary component. On $a_i = 0$ with nonzero product vector, set $L_0 = 1$.
  Substitution for the other $b_j$ leaves, precisely when $I_i + k nu_(i \, I) = e_i$, a nonzero constant times

$ a_(- i)^(I_(- i) - e_(- i)) b_i^(nu_(i \, I)) . $

These Laurent monomials are distinct: their exponents determine $I_(- i)$ and $nu_(i \, I)$, and then $I_i = e_i -
  k nu_(i \, I)$. Thus the restriction of $C$ is nonzero. It reduces this boundary stratum to dimension at most
  $d$; the zero-product boundary already has dimension $d$.
  The open defined by $F$ is integral and generically reduced of dimension $d + 1$.
  Since $C$ is a nonzero element of the prime bicone ring, adding it preserves the complete-intersection property.
  The boundary calculation and the criterion in the proof of Lemma 14 now prove that the new ideal is prime.

The Hilbert series acquires the factor $1 - z_1^lambda z_2^(s_0)$. Its leading term in bidegree $\( A \, B \)$ is

#[#set math.equation(numbering: n => "(5.7)")
 $ \( lambda partial_A + s_0 partial_B \) R \( A \, B \) \, $ <eq:cut-hilbert-leading>]

with error $O \( A^(d - 2) \)$ at fixed $B \/ A$. The nonnegative integers $lambda \, s_0$ are not both zero.
  If both are positive we retain this mixed component. All degrees remain bounded,
  by the degree of the first determinant equation and the fixed substitutions.

=== 5.4 The second cut on pure components <the-second-cut-on-pure-components>

Suppose instead that $C$ uses only one block, with degree $c_0 > 0$.
  Use the $s$-chart for a pure $a$ equation and the $t$-chart for a pure $b$ equation.
  In the latter case, partition the counted points according to the boundedly many reverse branches at the common
  $t$-box base supplied by Lemma 13, and apply the following determinant argument to each subset.
  Thus all rows of each determinant use the same analytic chart map.
  This only multiplies the number of resulting sets by a bounded factor.
  Dehomogenization and translation to the box base give an exact polynomial relation

$ Q_0 \( u_1 \, dots.h \, u_(d - 1) \) = 0 \, wide 1 lt.eq deg Q_0 lt.eq c_0 . $

A nonzero constant relation gives no points. No bound on the coefficients of $Q_0$ is imposed.

Here is the needed coefficient-uniform rank estimate. Put $r = d - 1$ and $e = deg Q_0$.
  Multiplication by $Q_0$ injects polynomials of degree at most $q - e$ into polynomials of degree at most $q$,
  and its image evaluates to zero. Therefore the evaluation rank of the latter space is at most

$ D_e \( q \) = binom(q + r, r) - binom(q - e + r, r) \, $

with the second term zero when $q < e$. At each power $z^j$, apply this bound with $q =
  floor.l \( T - j \) \/ w floor.r$. Since $D_e \( q \) = e q^(r - 1) \/ \( r - 1 \) ! +
  O_(r \, c_0) \( \( q + 1 \)^(r - 2) \)$, summing gives

$ N \( T \) lt.eq frac(c_0, r ! w^(r - 1)) T^r + O_(r \, c_0 \, w) \( T^(r - 1) + 1 \) . $

This bound involves no coefficients of the relation. Inserting it into the Taylor argument above gives

$ S gt.eq frac(r, r + 1) (frac(r ! w^(r - 1), c_0))^(1 \/ r) ell^(1 + 1 \/ r) - O \( ell \) . $

In particular, we have never solved the moving equation for one variable or reduced Taylor monomials by division
  by a coefficient.

Keep the first-cut degrees fixed, so that $c_0$ ranges over a bounded set of positive integers.
  Choose new, sufficiently large bidegrees $A \, B$, again with $B \/ A = t_(*)$, for the second determinant.
  By (5.7), a basis of raw monomials on a pure $a$ component has size

$ ell = frac(c_0 H_a \( t_(*) \), r !) A^r + O \( A^(r - 1) \) . $

Consequently

$ S / ell gt.eq r / d #scale(x: 120%, y: 120%)[\(] w^(r - 1) H_a \( t_(*) \) #scale(x: 120%, y: 120%)[\)]^(1 \/ r)
  A - O \( 1 \) . $

The factor $c_0$ cancels. The identical calculation for a pure $b$ component uses $H_b$.
  The second inequality in (5.2) contradicts (5.5) in both cases.
  The resulting equation is nonzero on the component, so it cuts its biprojective dimension from $d -
  1$ to at most $d - 2$. The Hilbert series and errors depend only on bounded bidegrees,
  and the analytic bounds come from the ambient chart maps.
  Thus the second-cut degrees can be fixed uniformly for every pure component.

Finally, on the counted affine locus $L_0 = 1$, the map to $cal(V)$ has one-dimensional scaling fibers:
  $a mapsto c a$ requires $b mapsto c^(- k) b$. Mixed components therefore have affine dimension $d$,
  and second-cut components have dimension at most $d - 1$.
  In the mixed case the equation on the nonzero-$a$ open is $F \( a \, n \, 1 \) = 0$.
  It is irreducible, since a factorization would rehomogenize to one of $F$,
  and its degree in $n$ is exactly $s_0$, since $L_0$ does not divide $F$.
  Since $s_0 gt.eq 1$, its coefficient polynomials in $a$ have no common nonconstant factor;
  such a factor would contradict irreducibility. Their common zero set therefore has codimension at least two in
  the $a$-space whenever it is nonempty. Taking closures preserves these dimensions and bounded degrees.
  This proves Proposition 15.

== 6 Lattice coordinates and exceptional fibers <sec:lattice-boxes>

Membership in an approximation box of Lemma 13 bounds linear forms such as $M x_i - c_i x_0$,
  where $c_i \/ M$ is the corresponding grid coordinate. We encode these bounds by lattices and choose an adapted
  integral basis in each coordinate block. A box requiring a larger coordinate bound has a shorter lattice vector;
  such boxes are correspondingly fewer. This tradeoff will allow the affine counting theorem to be summed over all
  boxes. The use of a short vector to count the direction boxes in which it can occur follows the method of Reuss
  #cite(label("Reuss2015PowerFree")) Sections 5–6. The common excess for the two paired lattices below is tailored
  to our affine Hilbert bounds.

=== 6.1 A basis bound with uniform constants <a-basis-bound-with-uniform-constants>

#thm([Lemma 6.1.])[
  #emph[Let $Lambda subset bb(R)^d$ be a full lattice of covolume $Delta$,
    and let $lambda_1$ be its shortest nonzero Euclidean length. There is a lattice basis $b_1 \, dots.h \, b_d$ with
$ product_(i = 1)^d parallel b_i parallel lt.eq C_d Delta . $

 In this basis, every $v in Lambda$ with $parallel v parallel lt.eq
   C$ has integral coordinates of absolute value at most $C C_d \/ lambda_1$.]
] <lem:lattice-basis>

#proof[
  We prove the product bound by induction on $d$. Choose a shortest vector $b_1$, which is primitive,
    and project orthogonally to $b_1^perp$. The image $Lambda'$ is a lattice of covolume $Delta \/ parallel b_1
    parallel$, and the projection kernel is $bb(Z) b_1$. Every nonzero vector of $Lambda'$ has length at least
    $sqrt(3) parallel b_1 parallel \/ 2$: lift it and subtract an integer multiple of $b_1$ until its parallel
    component has length at most $parallel b_1 parallel \/ 2$;
    the resulting nonzero lattice vector still has length at least $parallel b_1 parallel$.
  Apply induction to $Lambda'$, and lift its basis vectors with these reduced parallel components.
    Each lift has length at most $2 \/ sqrt(3)$ times the projected length.
    Together with $b_1$ the lifts form a basis of $Lambda$, proving the asserted product bound with a constant
    depending only on $d$. Finally, Cramer’s rule gives, for the coordinate $z_i$ of $v$,
  $ \| z_i \| lt.eq frac(C product_(h eq.not i) parallel b_h parallel, Delta) lt.eq
    frac(C C_d, parallel b_i parallel) lt.eq frac(C C_d, lambda_1) . $
  ◻
]

=== 6.2 Grouping the paired boxes <grouping-the-paired-boxes>

Fix a maximal-coordinate chart from Section 4, and reindex its coordinates as
  $x = \( x_0 \, dots.h \, x_(d - 1) \)$, $y = \( y_0 \, dots.h \, y_(d - 1) \)$.
  Thus $s_i = x_i \/ x_0$ and $t_i = y_i \/ y_0$ for $1 lt.eq i < d$.
  Let $eta_(+) \, b_(+) > 0$ be fixed upper exponents for which

$ \| x_i \| lt.double X^(eta_(+) \/ d) \, wide \| y_i \| lt.double X^(b_(+) \/ d) . $

Choose fixed $w \, tau > 0$ with

#[#set math.equation(numbering: n => "(6.1)")
 $ m = \( d - 1 \) w < min \( eta_(+) \, b_(+) \) \, wide u = frac(eta_(+) - m, d) \, wide v =
   frac(b_(+) - m, d) . $ <eq:lattice-parameters>]

Use a prime $M asymp X^w$ for the approximation grid. Such a prime exists by Bertrand’s postulate.
  All constants in this section are uniform in the grid boxes and in $X$; they may depend on the fixed parameters,
  the dimension, and the polynomial.

#thm([Proposition 6.2.])[
  #emph[For the paired boxes of Lemma 13, assume the coordinate bounds above and fix parameters satisfying (6.1).
    The paired boxes can be grouped into finitely many ranges indexed by $j = ell tau$, $ell in bb(Z)_(gt.eq 0)$,
    with $j lt.eq m \/ d$. The number of paired boxes in range $j$ is
#[#set math.equation(numbering: n => "(6.2)")
 $ O #scale(x: 120%, y: 120%)[\(] X^(m - d j) #scale(x: 120%, y: 120%)[\)] . $ <eq:lattice-box-count>]

 For each paired box there are integral unimodular changes $x arrow.l.r x'$ and $y arrow.l.r
   y'$ such that all its selected points satisfy
#[#set math.equation(numbering: n => "(6.3)")
 $ \| x'_i \| lt.double X^U \, wide \| y'_i \| lt.double X^V \, wide U = u + j + tau \, quad V = v + j +
   tau . $ <eq:lattice-coordinate-bounds>]

 The matrices of these changes and their inverses have entries bounded by a fixed power of $X$.]
] <prop:lattice-boxes>

#proof[
  Suppose the $s$-box has grid base $\( c_1 \/ M \, dots.h \, c_(d - 1) \/ M \)$.
    Its integers $c_i$ satisfy $\| c_i \| lt.double M$. Consider the lattice
  $ Lambda_c = X^(- eta_(+) \/ d) {#scale(x: 120%, y: 120%)[\(] q_0 \, M q_1 - c_1 q_0 \, dots.h \, M q_(d - 1) -
    c_(d - 1) q_0 #scale(x: 120%, y: 120%)[\)] : q in bb(Z)^d} . $
  The image of every counted $x$ has bounded Euclidean norm, since
  $ M x_i - c_i x_0 = M x_0 \( s_i - c_i \/ M \) \, wide \| s_i - c_i \/ M \| lt.eq M^(- 1) . $
  Let $U_(*)$ be the inverse shortest nonzero length of $Lambda_c$.
    Lemma 16 gives integral coordinates with $\| x'_i \| lt.double U_(*)$.
    The preimages of a lattice basis form a basis of $bb(Z)^d$, so this is a unimodular change.
    Apply the same construction to the $t$-box, using the scaling $X^(- b_(+) \/ d)$,
    and denote its inverse shortest length by $V_(*)$. Then $\| y'_i \| lt.double V_(*)$.
  Define the excess
  $ J = max { 1 \, U_(*) \/ X^u \, V_(*) \/ X^v } . $
  Before the common scaling, every nonzero lattice vector is a nonzero integer vector and has norm at least one.
    Consequently
  #[#set math.equation(numbering: n => "(6.4)")
   $ U_(*) lt.eq X^(eta_(+) \/ d) \, wide V_(*) lt.eq X^(b_(+) \/ d) \, wide 1 lt.eq J lt.eq
     X^(m \/ d) . $ <eq:lattice-J-bound>]
  Put a pair in range $j$ when $X^j lt.eq J < X^(j + tau)$.
    The exact upper bound in (6.4) shows that only $0 lt.eq j lt.eq m \/ d$ occur.
    In particular there are boundedly many ranges and $X^(m \/ d - j) gt.eq 1$ in every occupied range.
    The upper bound for $J$ within its range proves (6.3).
  For $j > 0$, at least one of $U_(*) gt.eq X^(u + j)$ and $V_(*) gt.eq X^(v + j)$ holds.
    In the first case a shortest lattice vector gives a nonzero integer vector
  $ q = \( q_0 \, M q'_1 - c_1 q_0 \, dots.h \, M q'_(d - 1) - c_(d - 1) q_0 \) \, wide parallel q parallel lt.eq
    T := X^(m \/ d - j) . $
  Here $1 lt.eq T lt.eq X^(m \/ d)$ and $T \/ M lt.double X^(- w \/ d)$, so $T < M$ for sufficiently large $X$.
    If $q_0 = 0$, every other coordinate would be divisible by $M$, contrary to $0 < parallel q parallel < M$.
    Thus $0 < \| q_0 \| < M$, and the primality of $M$ gives
  $ c_i equiv - q_i q_0^(- 1) med \( mod med M \) wide \( 1 lt.eq i < d \) . $
  Each vector $q$ determines the grid base up to boundedly many possibilities, because $\| c_i \| lt.double M$.
    There are $O \( T^d \)$ such integer vectors. Hence there are $O \( X^(m - d j) \)$ possible $s$-boxes in this
    case. The $V_(*)$ case gives the identical bound for $t$-boxes.
    Lemma 13 supplies boundedly many partners in either direction, proving (6.2) for their union.
    When $j = 0$, use the total bound $O \( M^(d - 1) \) = O \( X^m \)$ from that lemma.
  For completeness, the bases above also have polynomial height.
    The covolume of $Lambda_c$ is $X^(- eta_(+)) M^(d - 1) asymp X^(m - eta_(+))$,
    and its shortest length is at least $X^(- eta_(+) \/ d)$. The product bound in Lemma 16 therefore gives
  $ max_i parallel b_i parallel lt.double X^(m - eta_(+) \/ d) . $
  The inverse of the unscaled triangular map defining $Lambda_c$ has bounded norm, since $\| c_i \| lt.double M$.
    Its lattice basis thus pulls back to integral vectors of size $O \( X^m \)$.
    Cofactors bound the inverse unimodular matrix by a fixed power of $X$. The argument for $y$ is the same. ◻
]

Linear changes preserve dimensions and degrees of all the cut sets.
  They also preserve the weighted polynomial spaces within each coordinate block:
  every $a_i$ is a linear combination of the $x'_i$, which all have weight $U$,
  and every $b_i$ is a linear combination of the $y'_i$, which all have weight $V$.
  This assertion concerns the polynomial filtration, irrespective of the coefficients of the linear forms.
  The numerical size bounds used for integral counting are those on $x' \, y'$ in (6.3).

=== 6.3 Removing infinite fibers in the quartic case <removing-infinite-fibers-in-the-quartic-case>

For $d = 4$, a later Hilbert estimate requires $n$ to be algebraic over the functions $a_1 \, dots.h \, a_4$.
  We arrange this by removing a small set of possible $x'$ from each initial cut set of Proposition 15.

#thm([Lemma 6.3.])[
  #emph[Suppose $d = 4$, and let $Z$ be an initial bounded-degree set from Proposition 15,
    restricted to the open $a_1 a_2 a_3 a_4 eq.not 0$. Use coordinates $\( a \, n \)$ there,
    with $b_i = \( n - theta_i \) \/ a_i^2$. Assume either that $dim Z lt.eq 3$,
    or that $Z$ has the irreducible equation $F \( a \, n \) = 0$ with positive degree in $n$.
    The set of $a$ for which the $n$-fiber has dimension one has a closure of dimension at most two and bounded degree.]
  #emph[In a box satisfying (6.3), deleting all selected points above this base costs $O_f \( X^(2 U) \)$ points.
    On every irreducible subvariety of $Z$ meeting the remaining selected set,
    $n$ is algebraic over the field generated by the $a_i$.]
] <lem:quartic-fibers>

#proof[
  Substitute $b_i = \( n - theta_i \) \/ a_i^2$ into bounded-degree defining equations for $Z$ and clear their
    denominators. On the specified open, a fiber has dimension one precisely when each resulting polynomial in $n$
    vanishes identically. Thus its base is the common zero set of their coefficient polynomials,
    restricted to the $a$-torus. These equations have bounded degrees;
    retaining their relevant components and taking closure preserves a bounded degree.
    Components contained entirely in $a_1 a_2 a_3 a_4 = 0$ are not included.
  If $dim Z lt.eq 3$, the fiber-dimension inequality gives dimension at most two for this base.
    In the other case the coefficients of $F$ as a polynomial in $n$ have no common nonconstant factor:
    such a factor would factor the irreducible polynomial $F$, whose $n$-degree is positive.
    Their common zero set therefore has codimension at least two in four-dimensional $a$-space.
    Indeed, a codimension-one component would give an irreducible polynomial dividing every coefficient.
    This proves the dimension bound in both cases.
  The invertible linear change from $a$ to $x'$ preserves this dimension and degree.
    A bounded-degree algebraic set of dimension at most two contains $O \( B^2 \)$ integer points in a box of
    radius $B gt.eq 1$, with a constant independent of its coefficients.
    To recall the elementary argument, split into irreducible components and slice a positive-dimensional
    component by a nonconstant coordinate. Each integer slice is a proper hyperplane section of smaller dimension
    and bounded degree; induction ends with the degree bound for a zero-dimensional set.
    Taking $B asymp X^U$ bounds the exceptional $x'$ by $O \( X^(2 U) \)$.
    Each such $x'$ determines $x$, and the fixed-$x$ conclusion of Lemma 12 gives only $O_f \( 1 \)$ selected
    points above it.
  Finally, suppose $Y subset.eq Z$ is irreducible and $n$ is transcendental over the field generated by its $a_i$.
    Every polynomial relation in $n$ from the substituted equations then has all coefficients zero on $Y$.
    Its entire $a$-image lies in the base just removed. Consequently such a $Y$ meets no remaining selected point,
    proving the last assertion. ◻
]

Proposition 17 supplies the integral boxes for the affine counting theorem,
  and Lemma 18 supplies the additional projection property needed in the quartic case.
  The next sections establish the Hilbert bounds on the sets inside these boxes;
  the final summation will combine their cost with the factor $X^(m - d j)$ in (6.2).

== 7 Weighted Hilbert bounds from selected pairs <sec:hilbert-bounds>

The affine counting theorem requires lower bounds for spaces of polynomial functions on every subvariety
  encountered during its successive cuts. We obtain these bounds by retaining a small number of conjugate
  coordinate pairs. Their image has an explicit complete-intersection description, including at weighted infinity.

Give every $a_i$ weight $U > 0$ and every $b_i$ weight $V > 0$, where $U \, V$ are fixed rational numbers.
  In the transformed integral coordinates of Proposition 17,
  these are the weights of the entire $x'$ and $y'$ blocks.
  Invertible linear changes within either block preserve the weighted polynomial filtration,
  even if their coefficients vary.

Let $Y$ be an irreducible subvariety of the affine equations

$ a_i^k b_i = n - theta_i wide \( 1 lt.eq i lt.eq d \) \, $

of dimension $2 lt.eq h lt.eq d$, with a nonempty open where all $a_i eq.not 0$. Assume that $n$ is nonconstant.
  On this open its function field is generated by the $a_i$ and $n$.
  Choose $h - 1$ of the $a_i$ algebraically independent over $bb(C) \( n \)$, and one more distinct index.
  The image in these $h$ coordinates and $n$ has dimension $h$,
  so its ideal is generated by one irreducible polynomial. Relabeling the selected indices, write it as

$ F_1 \( a_1 \, dots.h \, a_h \, n \) = sum_I a^I f_I \( n \) . $

None of the $a_i$ divides $F_1$. Let $Y_(upright("pair"))$ denote the closure of the projection onto the selected
  pairs $\( a_i \, b_i \)_(i = 1)^h$. It has the same function field as the image just described.

#thm([Proposition 7.1.])[
  #emph[For each nonzero coefficient polynomial $f_I$, define
$ nu_(i \, I) = "ord"_(n - theta_i) f_I \, wide e_i = min_I \( I_i + k nu_(i \, I) \) \, $

 and put
#[#set math.equation(numbering: n => "(7.1)")
 $ D = max_I { U \| I \| + \( k U + V \) deg f_I } - U sum_i e_i . $ <eq:extracted-weight>]

 Then $D > 0$, and the weighted filtered Hilbert function of the pair image satisfies
#[#set math.equation(numbering: n => "(7.2)")
 $ H_(Y_(upright("pair"))) \( T \) = frac(\( k U + V \)^(h - 1) D, U^h V^h) frac(T^h, h !) +
   O \( T^(h - 1) + 1 \) . $ <eq:pair-hilbert>]

 This is a lower bound for $H_Y \( T \)$. If the function field degree of $Y$ over its pair image is at least two,
   the leading coefficient in this lower bound can be doubled.
   For fixed weights and bounded degree of $Y$, all error constants are uniform,
   independently of the coefficients of its equations.]
] <prop:weighted-hilbert>

=== 7.1 Extracting a polynomial equation <extracting-a-polynomial-equation>

Factor

$ f_I \( n \) = product_(i = 1)^h \( n - theta_i \)^(nu_(i \, I)) g_I \( n \) . $

As in (5.6), define

#[#set math.equation(numbering: n => "(7.3)")
 $ C_1 \( a \, b \) = sum_I a^(I + k nu_I - e) b^(nu_I) g_I \( a_1^k b_1 + theta_1 \) . $ <eq:affine-extracted-cut>]

All exponents of $a$ are nonnegative. Impose, in addition, the $h - 1$ equations

#[#set math.equation(numbering: n => "(7.4)")
 $ a_i^k b_i + theta_i = a_1^k b_1 + theta_1 wide \( 2 lt.eq i lt.eq h \) . $ <eq:pair-product-relations>]

On the open where all $a_i eq.not 0$, these equations and $C_1 = 0$ have coordinate ring

$ bb(C) \[ a_1^(plus.minus 1) \, dots.h \, a_h^(plus.minus 1) \, n \] \/ \( F_1 \) \, $

which is integral of dimension $h$.

The boundary has smaller dimension. If $a_i = 0$, then $n = theta_i$, every other $a_j eq.not 0$,
  and $b_j = \( theta_i - theta_j \) \/ a_j^k$. Before imposing $C_1$, the free coordinates are $b_i$ and the $h -
  1$ nonzero $a_j$, giving dimension $h$. The terms of $C_1$ surviving there have $I_i + k nu_(i \, I) =
  e_i$ and are nonzero scalar multiples of

$ a_(- i)^(I_(- i) - e_(- i)) b_i^(nu_(i \, I)) . $

Their exponents determine $I$, so these Laurent monomials are distinct.
  Thus $C_1$ is nonzero on this stratum and reduces its dimension to at most $h - 1$.
  This checks every affine boundary stratum, since two different $a_i$ cannot vanish when the $theta_i$ are distinct.

Every term in (7.3) has weight at most the number $D$ in (7.1). The bound is attained without cancellation.
  To see this, retain the highest weighted parts in (7.4); they say that the products $a_i^k
  b_i$ all equal a common variable $q$. On their nonzero-$a$ open, the weight-$D$ part of $C_1$ restricts to

#[#set math.equation(numbering: n => "(7.5)")
 $ a^(- e) "in"_(\( U \, k U + V \)) F_1 \( a \, q \) . $ <eq:nonzero-weighted-top>]

Here $"in"_(\( U \, k U + V \))$ means the sum of terms of largest weight when each $a_i$ has weight $U$ and $q$
  has weight $k U + V$. The expression is a nonzero Laurent polynomial:
  distinct monomials $a^I q^j$ remain distinct after division by $a^e$.
  This also follows directly from the extracted-factor formula,
  since constants $theta_i$ disappear in the highest-weight terms. Consequently $C_1$ has exact weight $D$.
  It is nonconstant, since otherwise the nonempty open hypersurface defined by $F_1$ would be empty. Hence

#[#set math.equation(numbering: n => "(7.6)")
 $ D gt.eq min \( U \, V \) > 0 . $ <eq:basic-extracted-weight>]

=== 7.2 The complete intersection at weighted infinity <the-complete-intersection-at-weighted-infinity>

Choose a positive integer $L_(upright("wt"))$ such that $A = L_(upright("wt")) U$ and $B =
  L_(upright("wt")) V$ are integers, and set

$ Q = k A + B \, wide E = L_(upright("wt")) D . $

Homogenize (7.4) and $C_1$ with a variable $t$ of weight one, giving $h$ homogeneous equations in $2 h +
  1$ variables. On $t eq.not 0$, scaling to $t = 1$ identifies the scheme with the affine one times $bb(C)^times$.
  Its nonzero-$a$ open is integral and generically reduced of dimension $h + 1$.
  Its remaining affine strata have dimension at most $h$, by the preceding boundary calculation.

At $t = 0$, the products $a_i^k b_i$ must coincide. If all $a_i eq.not 0$, the variables $a_1 \, dots.h \, a_h \,
  q$ are free before the last equation, and (7.5) is nonzero. This part of infinity has dimension at most $h$.
  If some $a_i = 0$, the common product is zero, so $a_j^k b_j = 0$ for every $j$.
  This locus is a union of coordinate $h$-planes. Its dimension is $h$,
  even if the last equation vanishes on an entire such plane.

It follows that the homogeneous system has dimension $h + 1$,
  and no top-dimensional component is contained in either boundary.
  The complete-intersection criterion used in Lemma 14 therefore makes its ideal prime.
  In particular, it is saturated with respect to $t$. Dehomogenization gives precisely the prime ideal of
  $Y_(upright("pair"))$: on the nonzero-$a$ open the descriptions agree, and the boundary has smaller dimension.

The degree-$N$ part of this graded quotient is the space of affine functions represented by monomials of weight at
  most $N$ in the scaled weights $A \, B$. Surjectivity follows by homogenizing each such monomial with a power of
  $t$. For injectivity, a homogeneous element vanishing after dehomogenization vanishes after localization at $t$,
  and saturation implies that it was zero in the graded quotient.
  Thus the Hilbert series of these filtered dimensions is

#[#set math.equation(numbering: n => "(7.7)")
 $ frac(\( 1 - z^Q \)^(h - 1) \( 1 - z^E \), \( 1 - z \) \( 1 - z^A \)^h \( 1 - z^B \)^h) .
   $ <eq:weighted-hilbert-series>]

At $z = 1$ this series has a pole of order $h + 1$, with leading factor $Q^(h - 1) E \/ \( A^h B^h \)$.
  We also check all other roots of unity. If only one of $1 - z^A \, 1 - z^B$ vanishes,
  its denominator order is $h$. If both vanish at a nontrivial root $zeta$, its order divides $gcd \( A \, B \)$,
  and therefore divides $Q$ and $E$: the latter is a monomial weight of the nonzero polynomial $C_1$.
  All $h$ numerator factors then vanish, reducing the denominator order $2 h$ to at most $h$.
  The extra factor $1 - z$ is nonzero at $zeta$. Partial fractions consequently give

$ frac(Q^(h - 1) E, A^h B^h) frac(N^h, h !) + O \( N^(h - 1) + 1 \) $

for the coefficient of $z^N$. Taking $N = floor.l L_(upright("wt")) T floor.r$ and rescaling proves (7.2).
  In particular, lower-dimensional coordinate planes at infinity do not change its leading coefficient or
  introduce a periodic term of order $T^h$.

=== 7.3 Uniformity and function-field extensions <uniformity-and-function-field-extensions>

The degree of $F_1$ is bounded in terms of $d \, k$ and the degree of $Y$.
  Indeed, $n = a_1^k b_1 + theta_1$ is a polynomial of fixed degree.
  Form the graph of the map to the selected $a_i$ and $n$, then project linearly;
  the usual degree bounds for graphs and projections give the assertion. They do not involve coefficient heights.
  For fixed $U \, V$ and a bound on that degree, only finitely many numerator degrees $E$ can occur in (7.7).
  Its coefficient errors are therefore uniform. This proves the required uniformity even for moving equations and
  moving blockwise linear changes of coordinates.

Pullback from the pair image is injective and preserves weights,
  so its Hilbert function is a lower bound for that of $Y$.
  Let $K_(upright("pair")) = bb(C) \( Y_(upright("pair")) \)$.
  If $\[ bb(C) \( Y \) : K_(upright("pair")) \] gt.eq 2$, one of the original $a$ or $b$ coordinates, say $xi$,
  lies outside $K_(upright("pair"))$, since these coordinates generate $bb(C) \( Y \)$.
  Its weight $omega$ is $U$ or $V$. The two spaces consisting of pair-image functions of weight at most $T$,
  and $xi$ times such functions of weight at most $T - omega$, are linearly independent on $Y$:
  a relation $A + xi B = 0$ with $A \, B in K_(upright("pair"))$ would contradict $xi in.not
  K_(upright("pair"))$ unless $A = B = 0$. Hence

#[#set math.equation(numbering: n => "(7.8)")
 $ H_Y \( T \) gt.eq H_(Y_(upright("pair"))) \( T \) + H_(Y_(upright("pair"))) \( T - omega \) $ <eq:field-degree-gain>]

for $T gt.eq omega$. The bounded shift leaves the leading coefficient unchanged and only changes the uniform
  $O \( T^(h - 1) + 1 \)$ term. This proves the asserted doubling and completes Proposition 19.

=== 7.4 The general dimensional thresholds <the-general-dimensional-thresholds>

We record the consequences needed before the special quartic surface argument.
  Here $Y$ is an irreducible subvariety of one of the initial affine sets obtained in Proposition 15.
  If $Y$ has dimension $d$, it must be one of the mixed affine components of Proposition 15;
  the second-cut sets have smaller dimension. In this case the equation is $F \( a \, n \, 1 \)$,
  with $F$ of bidegree $\( l \, s_0 \)$ and saturated bidegree $\( lambda \, s_0 \)$, where $lambda \, s_0 gt.eq
  1$. Homogeneity in $a$, and the fact that its degree in $n$ is exactly $s_0$, give

$ D = l U + \( k U + V \) s_0 - U sum_i e_i = lambda U + s_0 V gt.eq U + V . $

Thus (7.2) gives a lower bound with leading coefficient

$ frac(\( k U + V \)^(d - 1) \( U + V \), U^d V^d) . $

In every dimension $2 lt.eq h lt.eq d - 1$, the general bound (7.6) gives the coefficient

$ frac(\( k U + V \)^(h - 1) min \( U \, V \), U^h V^h) . $

If instead we can select $h$ algebraically independent $a$-coordinates, the same pair-image construction applies.
  Its polynomial $C_1$ must involve a $b$-coordinate; otherwise it is a nonzero relation among those independent
  $a$’s. Consequently $D gt.eq V$, giving coefficient

$ frac(\( k U + V \)^(h - 1) V, U^h V^h) . $

After the quartic infinite-fiber removal in Lemma 18, $n$ is algebraic over the $a$-coordinate field on every
  remaining subvariety. That field has transcendence degree $h$, so the independent selection exists.
  In particular, this last coefficient supplies the quartic $h = 3$ bound.
  The next section sharpens the remaining quartic surface case.

== 8 The additional geometry for quartics <sec:quartic-geometry>

In this section $d = 4$ and $k = 2$. We retain the number field $K = bb(Q) \( theta \)$, its splitting field $L$,
  and the distinct roots $theta_1 \, dots.h \, theta_4$. We first improve the Hilbert bound for surfaces after the
  infinite-fibre removal of Lemma 18. We then construct one fixed exceptional set of integers that will remove the
  equality case in the curve argument.

=== 8.1 The surface bound <the-surface-bound>

#thm([Proposition 8.1.])[
  #emph[Let $Y$ be a geometrically irreducible surface defined over $bb(Q)$ in the rational coordinates of the
    arithmetic boxes. Suppose that it meets the open $a_1 a_2 a_3 a_4 eq.not 0$, satisfies
$ a_i^2 b_i = n - theta_i wide \( 1 lt.eq i lt.eq 4 \) \, $

 and that $n$ is nonconstant and algebraic over the field generated by $a_1 \, dots.h \, a_4$.
   Give the two coordinate blocks positive rational weights $U \, V$, respectively, and put
$ D_0 = min \( 3 U \, 2 V \, U + V \) . $

 Then
#[#set math.equation(numbering: n => "(8.1)")
 $ H_Y \( T \) gt.eq T^2 / 2 min {frac(\( 2 U + V \) D_0, U^2 V^2) \, 3 / U^2} -
   O \( T \) . $ <eq:quartic-surface-hilbert>]

 For fixed weights and a bound on $deg Y$, the error is uniform in the moving coordinate changes and defining
   equations.]
] <prop:quartic-surface>

#proof[
  Let $S$ be the closure of the full $a$-image of $Y$. It is a surface,
    because $n$ is algebraic over its function field and the $b_i$ are $\( n - theta_i \) \/
    a_i^2$ on the indicated open. It is defined over $bb(Q)$ in the rational coordinates of the first block.
  We separate the cases in which the $a$-image has degree at least three, two, or one.
    The first supplies three independent families directly. A quadric supplies a pair-image bound or an extra
    field degree; on a plane, deficient bounds for every pair lead to a contradiction.
  We will repeatedly use Proposition 19 for algebraically independent coordinate functions $a_i \, a_j$.
    Its polynomial $C_1$ has weight $D$ and involves $b_i$ or $b_j$, since $a_i \, a_j$ are independent.
    If $D < D_0$, no monomial can contain two $b$ factors, an $a$ factor and a $b$ factor, or three $a$ factors.
    Thus its equation has the form
  #[#set math.equation(numbering: n => "(8.2)")
   $ c_i b_i + c_j b_j = S_(i j) \( a_i \, a_j \) \, wide deg S_(i j) lt.eq 2 \,
     wide \( c_i \, c_j \) eq.not \( 0 \, 0 \) . $ <eq:quartic-small-relation>]
  In particular $D gt.eq V$. Substitution of the equations for $b_i \, b_j$ gives
  #[#set math.equation(numbering: n => "(8.3)")
   $ B_(i j) n & = c_i theta_i a_j^2 + c_j theta_j a_i^2 + a_i^2 a_j^2 S_(i j) \( a_i \, a_j \) \,\
B_(i j) & = c_i a_j^2 + c_j a_i^2 . $ <eq:quartic-rational-n>]
  The independence of $a_i \, a_j$ implies $B_(i j) eq.not 0$.
    Consequently, in this case $n \, b_i \, b_j$ all belong to $bb(C) \( a_i \, a_j \)$.
  ===== 8.1.1 An $a$-image of degree at least three. <an-a-image-of-degree-at-least-three.>
  Suppose $deg S = e gt.eq 3$. A general linear projection to an affine plane, with coordinates $s \,
    t$ linear in the $a_i$, has function-field degree $e$. Indeed choose its projective centre at infinity
    disjoint from the projective closure of $S$. A general fibre is a complementary linear section of degree $e$,
    with no intersection at infinity; in characteristic zero its general points are distinct.
    A further general linear form $r$ in the $a_i$ separates this finite extension, so $1 \, r \,
    r^2$ are independent over $bb(C) \( s \, t \)$. Products with monomials in $s \, t$ give
  $ H_Y \( T \) gt.eq sum_(j = 0)^2 \# { \( p \, q \) in bb(Z)_(gt.eq 0)^2 : U \( p + q + j \) lt.eq T } =
    frac(3 T^2, 2 U^2) - O \( T \) . $
  This proves the second bound in (8.1).
  ===== 8.1.2 A quadric $a$-image. <a-quadric-a-image.>
  Suppose $deg S = 2$. The degree of an irreducible projective variety is at least its codimension in its linear
    span plus one #cite(label("EisenbudGreenHulekPopescu2006")) Introduction, equation $\( * \)$.
    Applying this to the projective closure shows that $S$ spans an affine three-space $A$ and is a quadratic
    hypersurface there: a surface spanning only an affine plane would equal that plane and have degree one.
  The span $A$ is rational in the first-block rational coordinates. Its direction is a rational hyperplane in $K$.
    The nondegeneracy of the trace pairing writes its equation as $"Tr"_(K \/ bb(Q)) \( gamma alpha \) =
    0$ for some $gamma in K \\ { 0 }$. Write $ell_i$ for the linear part of $a_i$ on $A$.
    The equation of this direction space is therefore
  $ sum_(i = 1)^4 sigma_i \( gamma \) ell_i = 0 \, $
  with all four coefficients nonzero. In the projective plane of this direction space, the four lines $ell_i =
    0$ have no triple intersection. Their six pair intersections are therefore distinct.
  Let $Q_2$ be the homogeneous quadratic part of the equation of $S$ in $A$.
    It cannot vanish at all six intersections. Otherwise its restriction to each of the four lines would have
    three distinct zeros and hence vanish identically, forcing all four line equations to divide the nonzero
    quadratic $Q_2$. Choose a pair $i \, j$ at whose intersection direction $v$ one has $Q_2 \( v \) eq.not 0$.
  The fibres of the projection $A arrow.r bb(A)^2$ given by $\( a_i \, a_j \)$ are lines parallel to $v$.
    On each fibre the equation of $S$ has a nonzero quadratic leading coefficient $Q_2 \( v \)$.
    Thus $S$ has degree two over this coordinate plane, and $a_i \, a_j$ are independent.
    If $D gt.eq D_0$, Proposition 19 already gives the first bound in (8.1).
    If $D < D_0$, (8.3) shows that the projected-pair field is $bb(C) \( a_i \, a_j \)$.
    The full field $bb(C) \( Y \)$ has degree at least two over it,
    so the field-extension clause of Proposition 19 doubles the leading coefficient.
    Since $D gt.eq V$ and $2 D gt.eq 2 V gt.eq D_0$, the doubled coefficient suffices as well.
  ===== 8.1.3 A plane $a$-image. <a-plane-a-image.>
  It remains to consider $deg S = 1$, so $S = A$ is an affine plane rational in the first-block coordinates.
    Every $a_i$ is nonconstant on $A$: a nonzero rational direction represents a nonzero element of $K$,
    and all its embeddings are nonzero. Their linear parts span the dual of the two-dimensional direction space.
  Join indices $i \, j$ when those linear parts are independent.
    The resulting graph is the complete multipartite graph on their parallelism classes,
    with at least two classes. It is connected and has no isolated vertex.
    An edge is exactly an independent pair of affine coordinates on $A$.
  Assume for a contradiction that every such pair has $D < D_0$.
    Then (8.2) holds for every edge, and (8.3) makes $n$ a rational function on $A$.
    We distinguish whether it is polynomial.
  If $n$ is polynomial, (8.3) shows that its degree is at most four.
    Indeed $B_(i j)$ has degree exactly two for an independent pair,
    whereas the right side has degree at most six. Every index $i$ has nonzero coefficient in at least one
    relation (8.2). To see this, start with one nonzero coefficient and apply Galois automorphisms:
    they preserve $Y$, permute the conjugate coordinates and roots transitively,
    and preserve both independence and the degree bound. This uses the collection of all such relations,
    without requiring any chosen representatives to be Galois-invariant.
  Fix a relation with $c_i eq.not 0$. At the generic point of $a_i = 0$,
    the independent coordinate $a_j$ is a unit. Polynomiality of $n$ therefore makes $b_j = \( n - theta_j \) \/
    a_j^2$ regular there, and the relation makes $b_i$ regular too. It follows that
  $ a_i^2 divides n - theta_i quad upright("in ") bb(C) \[ A \] wide \( 1 lt.eq i lt.eq 4 \) . $
  The four zero lines are distinct, since their prescribed values $theta_i$ are distinct.
    Restriction to a general affine line gives a polynomial of degree at most four with four distinct critical
    points and four distinct critical values. Its derivative would have four roots despite degree at most three;
    if the derivative were zero, the values would all be equal. This is impossible.
  Now suppose $n$ is nonpolynomial. Both coefficients in every relation (8.2) must be nonzero,
    since otherwise it would express $n$ as a polynomial. Write $n =
    P \/ Q$ in reduced form and fix an irreducible factor of the nonconstant denominator $Q$.
    By (8.3) it divides every $B_(i j)$. Over $bb(C)$, $B_(i j)$ is a product of two distinct affine linear forms
    $a_j plus.minus zeta a_i$, with $zeta eq.not 0$. The fixed factor therefore defines a line $ell$ through the
    common zero of $a_i \, a_j$, transverse to both of their zero lines.
    For each edge, the two intersections with $ell$ coincide.
    Connectivity of the graph forces all four zero lines to pass through one point $O$.
  Center the plane coordinates at $O$, making each $a_i$ homogeneous linear.
    Scale these coordinates by a variable $t$ in (8.3) and take the rational-function limit at $t = 0$.
    For every independent pair the result is the same function on the projective line of directions:
  #[#set math.equation(numbering: n => "(8.4)")
   $ cal(R) = frac(c_i theta_i a_j^2 + c_j theta_j a_i^2, c_i a_j^2 + c_j a_i^2) . $ <eq:quartic-direction-map>]
  The term involving $S_(i j)$ acquires an extra factor $t^2$. The limit is taken in the function field of directions.
  For an independent pair, (8.4) is a nonconstant fractional linear transform of $\( a_i \/ a_j \)^2$:
    its determinant is nonzero because $c_i c_j \( theta_j - theta_i \) eq.not 0$.
    It has degree two and is ramified exactly at the two directions $a_i = 0 \, a_j = 0$,
    with respective values $theta_i \, theta_j$. Since every index occurs in an edge,
    the same function would be ramified in four directions with four distinct values.
    Coincident directions already contradict the distinct values,
    and four distinct directions contradict its displayed degree-two form. This proves the required contradiction.
  There is consequently an independent pair with $D gt.eq D_0$,
    and Proposition 19 proves the first bound in (8.1) for the plane case.
    Together the three degree cases prove the proposition. All extra independent functions used above have bounded
    weighted degree, so their shifts preserve the asserted uniform $O \( T \)$ error. ◻
]

=== 8.2 One global set of quintic values <one-global-set-of-quintic-values>

The curve argument will encounter degree-five polynomials with four prescribed critical values.
  Their coefficients can initially depend on the box and on the curve.
  The following normalization places all of them in one fixed finite family before any counting is done.

#thm([Proposition 8.2.])[
  #emph[There are finitely many polynomials $Phi in L \[ t \]$ of degree five with distinct critical points $z_1 =
    0 \, z_2 = 1 \, z_3 \, z_4$ satisfying
$ Phi \( z_i \) = theta_i wide \( 1 lt.eq i lt.eq 4 \) . $

 Let $cal(F)_f$ be this finite family and put
$ cal(E)_f = { n in bb(Z) : n = Phi \( z \) upright(" for some ") Phi in cal(F)_f \, z in L } . $

 Then, for $X gt.eq 1$,
#[#set math.equation(numbering: n => "(8.5)")
 $ \# #scale(x: 120%, y: 120%)[\(] cal(E)_f ∩ \[ - 2 X \, 2 X \] #scale(x: 120%, y: 120%)[\)] lt.double_f
   X^(1 \/ 5) . $ <eq:quintic-discard-count>]

 Moreover, if $N \( s \) in L \[ s \]$ has degree five and distinct critical points $tau_1 \, dots.h \,
   tau_4 in L$ with $N \( tau_i \) = theta_i$, every integer value $N \( s \)$ at $s in L$ belongs to $cal(E)_f$.]
] <prop:quintic-discard>

#proof[
  We first prove finiteness over $bb(C)$. Introduce the six coefficients of $Phi$ and the two variables $z_3 \,
    z_4$, impose $Phi \( z_i \) = theta_i$ and $Phi' \( z_i \) = 0$,
    and require that the leading coefficient and all differences $z_i - z_j$ be nonzero.
    This defines a finite-type parameter locus. Its four critical points are simple,
    because they are distinct and exhaust the roots of the degree-four polynomial $Phi'$.
  Suppose a reduced irreducible component of this locus had positive dimension.
    Its function field $F \/ bb(C)$ admits a nonzero derivation $partial$ over $bb(C)$:
    differentiate a member of a transcendence basis and extend through the finite separable extension.
    Write $Q = partial Phi$ for coefficient differentiation. Differentiating the value equations gives
    $Q \( z_i \) = 0$, since $Phi' \( z_i \) = 0$. Consequently
  $ Q = A Phi' \, wide deg A lt.eq 1 . $
  Differentiating the critical-point equations now gives
  $ 0 = Q' \( z_i \) + Phi'' \( z_i \) partial z_i = Phi'' \( z_i \) #scale(x: 120%, y: 120%)[\(] A \( z_i \) +
    partial z_i #scale(x: 120%, y: 120%)[\)] . $
  The second derivative is nonzero at each $z_i$. The fixed normalizations $z_1 = 0 \, z_2 = 1$ imply $A \( 0 \) =
    A \( 1 \) = 0$, so $A = 0$. Thus $partial$ kills all coefficients of $Phi$ and all $z_i$.
    These generate $F$, contradicting $partial eq.not 0$. The parameter locus is therefore zero-dimensional and
    has finitely many complex points. Its subset of polynomials over $L$ is finite as well.
  Fix one such $Phi$. Choose an integer $c > 0$ such that
  $ c Phi \( t \) = A_5 t^5 + A_4 t^4 + dots.h.c + A_0 \, wide A_i in cal(O)_L \, quad A_5 eq.not 0 . $
  If $Phi \( z \) = n in bb(Z)$ and $w = A_5 z$, then
  #[#set math.equation(numbering: n => "(8.6)")
   $ 0 =  & w^5 + A_4 w^4 + A_3 A_5 w^3 + A_2 A_5^2 w^2\
 & + A_1 A_5^3 w + \( A_0 - c n \) A_5^4 . $ <eq:quintic-integral-input>]
  This is monic over $cal(O)_L$, so $w in cal(O)_L$. Hence every possible $z$ lies in the fixed fractional lattice
    $A_5^(- 1) cal(O)_L$.
  For each embedding $sigma : L arrow.r bb(C)$ one has $sigma \( Phi \) \( sigma \( z \) \) = n$.
    The leading term of each of these fixed degree-five polynomials dominates its lower terms outside a fixed
    radius. For $\| n \| lt.eq 2 X$ it follows that
  $ max_sigma \| sigma \( z \) \| lt.double_(Phi \, L) X^(1 \/ 5) . $
  Choose a fixed $bb(Z)$-basis $e_1 \, dots.h \, e_(r_L)$ of the fractional lattice,
    where $r_L = \[ L : bb(Q) \]$, and write $z = sum_j u_j e_j$ with $u_j in bb(Z)$.
    Inverting its embedding matrix gives $\| u_j \| lt.double_(Phi \, L) X^(1 \/ 5)$ for every $j$.
  We count these lattice points on the locus where $Phi \( z \)$ is rational.
    To define this locus over $bb(Q)$, expand $Phi \( sum_j u_j e_j \)$ in a rational basis of $L$ beginning with
    $1$ and set its other coordinates equal to zero. After base change to $bb(C)$,
    the embedding coordinates identify it with the inverse image of the diagonal under the map
  $ \( w_sigma \)_sigma mapsto #scale(x: 120%, y: 120%)[\(] sigma \( Phi \) \( w_sigma \)
    #scale(x: 120%, y: 120%)[\)]_sigma . $
  This is a product of finite polynomial maps. More explicitly, the inverse image of the diagonal has coordinate ring
  $ bb(C) \[ v \, \( w_sigma \)_sigma \] #scale(x: 120%, y: 120%)[\/] #scale(x: 120%, y: 120%)[\(]
    sigma \( Phi \) \( w_sigma \) - v : sigma : L arrow.r bb(C) #scale(x: 120%, y: 120%)[\)] . $
  After dividing each relation by its leading coefficient, the equations are monic in separate variables.
    The ring is finite free of rank $5^(r_L)$ over $bb(C) \[ v \]$,
    with basis the products of powers $w_sigma^(e_sigma)$ for $0 lt.eq e_sigma < 5$.
    Thus the rational-value locus has dimension one and degree bounded in terms of $Phi \, L$.
  A bounded-degree affine set of dimension at most one has $O \( R \)$ integer points in a coordinate box of
    radius $R$. Indeed, on each curve component choose a nonconstant coordinate,
    slice at its $O \( R \)$ integer values, and apply Bézout to each finite fibre.
    Zero-dimensional components contribute only a bounded number of points.
    Apply this bound in the $u_j$ coordinates with $R lt.double_(Phi \, L) X^(1 \/ 5)$.
    It counts $O_(Phi \, L) \( X^(1 \/ 5) \)$ possible $z$, and therefore at most that many integer values.
    Summing over the fixed finite family proves (8.5).
  Finally, for the polynomial $N$ in the statement set
  $ Phi \( t \) = N #scale(x: 120%, y: 120%)[\(] tau_1 + \( tau_2 - tau_1 \) t #scale(x: 120%, y: 120%)[\)] . $
  Its coefficients lie in $L$, and its critical points $\( tau_i - tau_1 \) \/ \( tau_2 - tau_1 \)$ have the
    required normalizations and values. Hence $Phi in cal(F)_f$.
    For every $s in L$, the normalized input $\( s - tau_1 \) \/ \( tau_2 - tau_1 \)$ also lies in $L$ and has the
    same value under $Phi$. This proves the final assertion without any restriction on the heights of $N$ or its
    critical points. ◻
]

== 9 Curve alternatives <sec:curves>

It remains to supply the one-dimensional Hilbert bounds for the affine counting theorem.
  A curve with a nonpolynomial rational coordinate will instead contain very few selected points.
  We first prove that assertion uniformly, even when the rational function varies with the curve and with the
  integral coordinate changes.

#thm([Lemma 9.1.])[
  (Integral values of a rational function).  #emph[Fix a positive integer $D$ and positive constants $A \, B \,
    C_0$. For every $epsilon > 0$ and $X gt.eq 2$, let $R in bb(Q) \( s \)$ be a nonpolynomial rational function
    whose reduced numerator and denominator have degrees at most $D$. Then
$ \# { s in bb(Z) : \| s \| lt.eq C_0 X^A \, med R \( s \) in bb(Z) \, med \| R \( s \) \| lt.eq
  C_0 X^B } lt.double_(D \, A \, B \, C_0 \, epsilon) X^epsilon . $

 The constant is independent of the coefficients of $R$. Inputs at which $R$ has a pole are excluded from the set.]
] <lem:rational-values>

#proof[
  Write $R = A_0 \/ B_0$ in lowest terms, with true degrees $a \, b lt.eq D$.
    Since $R$ is not polynomial, $b gt.eq 1$. If there are at most $a + b$ counted inputs,
    the result is immediate. Otherwise choose $a + b + 1$ distinct input-value pairs $\( s_i \, v_i \)$ and impose
    the homogeneous linear equations
  $ A_1 \( s_i \) - v_i B_1 \( s_i \) = 0 \, wide deg A_1 lt.eq a \, quad deg B_1 lt.eq b . $
  Their solution space is one-dimensional. Indeed, for any solution the polynomial $A_1 B_0 -
    A_0 B_1$ has degree at most $a + b$ and vanishes at all the chosen inputs. It is therefore zero.
    Coprimality of $A_0 \, B_0$ and the true degree restrictions force $\( A_1 \, B_1 \)$ to be a scalar multiple
    of $\( A_0 \, B_0 \)$.
  The integer matrix of this system has polynomially bounded entries in $X$.
    Its maximal signed minors give a nonzero integer solution $\( A_1 \, B_1 \)$ with coefficients
    $X^(O_(D \, A \, B \, C_0) \( 1 \))$. The resultant
  $ R_0 = "Res" \( A_1 \, B_1 \) $
  is a nonzero integer of size $X^(O_(D \, A \, B \, C_0) \( 1 \))$.
    At a counted input, $B_1 \( s \)$ is nonzero and divides $A_1 \( s \)$.
    The integral Bezout identity for the resultant consequently gives $B_1 \( s \) divides R_0$.
    The integer $R_0$ has $O_epsilon \( X^epsilon \)$ signed divisors,
    after adjusting the exponent in the divisor bound. For each such divisor $q$,
    the nonconstant polynomial equation $B_1 \( s \) = q$ has at most $b$ solutions. This proves the uniform estimate. ◻
]

We apply this lemma to the selected arithmetic points from Section 4,
  after the integral changes of coordinates in Proposition 17.
  Thus the coordinates are $x' \, y' in bb(Z)^d$, with respective weights $U \, V > 0$ and size bounds

$ \| x'_i \| lt.double_f X^U \, wide \| y'_i \| lt.double_f X^V . $

The conjugate forms $a_i \, b_i$ are complex linear combinations of $x'$ and $y'$ respectively.
  Their filtered weights are at most $U$ and $V$, regardless of the sizes of those linear coefficients.
  They satisfy $a_i^k b_i = n - theta_i$. The function

#[#set math.equation(numbering: n => "(9.1)")
 $ n = 1 / d sum_(i = 1)^d \( a_i^k b_i + theta_i \) $ <eq:curve-input-function>]

is defined over $bb(Q)$: its coefficients are traces of elements of $K$.
  It is a polynomial of degree at most $k + 1$ in the rational coordinates.

Let $S$ denote any resulting selected set, with the global exceptional values of Proposition 21 removed when $d =
  4$. By Lemma 12, a fixed $n$ costs at most one point of $S$, and a fixed $x'$ costs $O_f \( 1 \)$ points.
  These bounds are preserved when $S$ is restricted to any of the algebraic subsets used in the counting argument.

#thm([Proposition 9.2.])[
  (Curve alternatives).  #emph[Put
$ g = \( d - 1 \) \( k - 1 \) + upright(bold(1))_(d = 4) \, wide delta_1 \( U \, V \) = max { U \/ 2 \,
  min \( U \, V \/ g \) } . $

 Fix a degree bound $E$, and let $C$ be a geometrically irreducible curve of degree at most $E$,
   defined over $bb(Q)$, in the arithmetic variety $a_i^k b_i = n - theta_i$ in the coordinates just described.
   For every $epsilon > 0$, either
$ \| S ∩ C \| lt.double_(f \, E \, epsilon) X^epsilon \, $

 or its filtered Hilbert dimension, with weight $U$ on $x'$ and weight $V$ on $y'$, satisfies
#[#set math.equation(numbering: n => "(9.2)")
 $ H_C \( T \) gt.eq frac(T, delta_1 \( U \, V \)) - O_(f \, E) \( 1 \) . $ <eq:curve-hilbert-bound>]

 The implied constants may also depend on a fixed compact subset of $\( 0 \, oo \)$ containing $U \, V$.
   They are otherwise uniform in the weights and in the integral coordinate changes.
   In particular they are uniform for the weights arising from Proposition 17.]
] <prop:curve-alternatives>

#proof[
  If $n$ is constant on $C$, the fixed-$n$ bound applies. If the $a$-image is constant,
    invertibility of the coordinate changes makes $x'$ constant, so the fixed-$x'$ bound applies.
    We henceforth assume both are nonconstant.
  Suppose first that the $a$-image is a nonlinear curve. A generic linear projection of that image to an affine
    line has degree equal to its degree, hence at least two. This follows by intersecting the projective closure
    with general hyperplanes in the corresponding pencil; the center can be chosen to avoid the points at
    infinity. Let $t$ be the projected linear function, of weight at most $U$.
    The field $bb(C) \( C \)$ then has degree at least two over $bb(C) \( t \)$.
    When the $a$-image is a line, choose a nonconstant $x'$-coordinate as $t$;
    the same conclusion holds if the function field of $C$ has degree at least two over that line.
    In either case some $x'$- or $y'$-coordinate $q$ lies outside $bb(C) \( t \)$,
    since the ambient coordinates generate $bb(C) \( C \)$. The families
  $ 1 \, t \, t^2 \, dots.h \, wide q \, q t \, q t^2 \, dots.h $
  are linearly independent. The weight of $q$ is at most $max \( U \, V \)$, so counting these functions gives
  #[#set math.equation(numbering: n => "(9.3)")
   $ H_C \( T \) gt.eq 2 T \/ U - O \( 1 \) . $ <eq:curve-two-families>]
  The error is uniform for the stated weights. Since $delta_1 \( U \, V \) gt.eq U \/ 2$,
    this proves (9.2) in these cases.
  It remains to treat a line image with function-field extension degree one.
    Work in the rational coordinates $x'$. The image line is defined over $bb(Q)$,
    as the image closure of a $bb(Q)$-defined curve under a $bb(Q)$-linear projection.
    Choose a nonconstant coordinate $s = x'_j$ as its parameter.
    Each $x'_i$ is an affine rational function of $s$. Undoing the integral coordinate change and using the
    integral basis of $K$, the line takes the form
  $ alpha = r s + q \, wide r \, q in K \, quad r eq.not 0 . $
  Consequently
  #[#set math.equation(numbering: n => "(9.4)")
   $ a_i = r_i s + q_i \, wide r_i = sigma_i \( r \) eq.not 0 \, quad q_i = sigma_i \( q \) \, quad r_i \,
     q_i in L . $ <eq:curve-conjugate-line>]
  Every conjugate slope is nonzero because a field embedding cannot annihilate a nonzero element.
  The degree-one field extension gives $bb(C) \( C \) = bb(C) \( s \)$.
    Each $y'_i$, and the function $n$ in (9.1), therefore belongs to $bb(Q) \( s \)$.
    Indeed its expression as a rational function of the $bb(Q)$-defined parameter $s$ is unique when written with
    a coprime numerator and monic denominator. All coefficients are therefore fixed by automorphisms over $bb(Q)$.
    These rational functions have uniformly bounded degrees. For $y'_i$,
    project the curve to the $\( s \, y'_i \)$-plane: its graph has degree at most $E$,
    and its reduced equation is $B \( s \) y'_i - A \( s \) = 0$.
    The same argument with the fixed-degree map (9.1) bounds the degree for $n$.
  If any $y'_i$ is a nonpolynomial rational function, apply Lemma 22 to the integral inputs $s$ and the integral
    outputs $y'_i$. Their bounds follow from the transformed coordinate box.
    Each $s$ fixes the point $x'$ on the line, so there are only $O_f \( 1 \)$ selected points for that input.
    This proves the exceptional counting alternative. This argument requires no height bound on the coefficients
    of the moving line or coordinate change.
  We may now assume that every $y'_i$ is polynomial in $s$. Then the $b_i$ and $n$ are polynomials as well.
    Put $tau_i = - q_i \/ r_i$. The identities give
  $ \( s - tau_i \)^k divides n \( s \) - theta_i . $
  The numbers $tau_i$ are distinct: a common value would force two distinct conjugates $theta_i$ to equal $n$ at
    that value. As $n$ is nonconstant, differentiation yields
  #[#set math.equation(numbering: n => "(9.5)")
   $ deg n gt.eq 1 + d \( k - 1 \) \, wide deg b_i = deg n -
     k gt.eq \( d - 1 \) \( k - 1 \) . $ <eq:curve-polynomial-degrees>]
  The first inequality follows because $product_i \( s - tau_i \)^(k - 1)$ divides $n' \( s \)$;
    the degree identity uses the nonzero slope of each $a_i$.
  For $d = 4$, equality in the first inequality would give $deg n = 5$.
    Its derivative would then have precisely the four simple zeros $tau_i$,
    with respective critical values $theta_i$. Define
  $ Phi \( z \) = n #scale(x: 120%, y: 120%)[\(] tau_1 + \( tau_2 - tau_1 \) z #scale(x: 120%, y: 120%)[\)] . $
  This polynomial belongs to $L \[ z \]$, has degree five, and has normalized critical points $0 \,
    1$ and two further distinct points with the prescribed ordered critical values.
    At a selected point, the integer $s$ gives $z = \( s - tau_1 \) \/ \( tau_2 - tau_1 \) in L$.
    Thus its integer value $n = Phi \( z \)$ belongs to the global exceptional set of Proposition 21.
    Such a curve has no surviving selected points. On every remaining polynomial line curve,
  $ deg b_i gt.eq g = \( d - 1 \) \( k - 1 \) + upright(bold(1))_(d = 4) . $
  The exceptional set was removed once, before choosing curves;
    its bound is not charged separately to different lines or boxes.
  Finally choose one $b_i$, of degree $ell gt.eq g$ in $s$. The functions
  $ s^j b_i^a \, wide 0 lt.eq j < g \, quad a gt.eq 0 \, quad j U + a V lt.eq T \, $
  are linearly independent, since their degrees $j + ell a$ as polynomials in $s$ are distinct.
    Their weights are at most $j U + a V$. They therefore give
  $ H_C \( T \) gt.eq g T \/ V - O_g \( 1 + U \/ V \) . $
  Powers of $s$ alone also give $H_C \( T \) gt.eq T \/ U - O \( 1 \)$.
    The ratio $U \/ V$ is bounded in the stated range, so these two estimates imply
  $ H_C \( T \) gt.eq frac(T, min \( U \, V \/ g \)) - O \( 1 \) . $
  Together with (9.3), this proves the proposition. ◻
]

The proof applies to every bounded-degree curve defined over $bb(Q)$ that occurs after a later cut.
  Its exceptional alternative uses only the bounded integral input and output sizes;
  its Hilbert alternative uses only degrees and weights. Thus moving equations and moving integral bases introduce
  no new coefficient-height requirement in dimension one.

== 10 Parameters and an exact finite certificate <sec:parameters>

The preceding counting bounds leave a finite numerical choice:
  the partition exponent must be large enough for the archimedean cuts,
  but small enough that the number of boxes does not consume the saving in each box. We now make that choice.
  We also control the simultaneous increase of the two coordinate weights caused by an unusually short lattice
  vector. The finite calculation below concerns these numerical inequalities;
  the geometric estimates supplying the counting thresholds were proved in the preceding sections.

Throughout this section, $4 lt.eq d lt.eq 8$, $k = d - 2$, and

$ K_0 = 3000 \, wide G_0 = 100000 \, wide tau = 1 / 50000 . $

Recall the homogeneous polynomial $R \( A \, B \)$ from (5.1), and its associated one-variable polynomials

$ H \( t \) = d ! R \( 1 \, t \) \, wide H_a \( t \) = \( d - 1 \) ! \( partial_A R \) \( 1 \, t \) \, wide
  H_b \( t \) = \( d - 1 \) ! \( partial_B R \) \( 1 \, t \) . $

The argument $t$ here is a scalar ratio of bidegrees; it is distinct from the normalized chart coordinates used earlier.

For an integer $z gt.eq K_0$, set

#[#set math.equation(numbering: n => "(10.1)")
 $ eta_(-) = z / K_0 \, quad eta_(+) = frac(z + 1, K_0) \, quad b_(-) = d - k eta_(+) \, quad b_(+) = d -
   k eta_(-) . $ <eq:parameter-interval>]

We use these intervals until the first index $z_d$ for which

#[#set math.equation(numbering: n => "(10.2)")
 $ eta_(-) \( 1 - k eta_(-) \/ d \) < 2495 / 10000 . $ <eq:parameter-stop>]

An interval is in mode $sans(Q)$ when $d = 4$ and $z < 4000$.
  This mode records the use of the stronger quartic surface estimate.

We collect the thresholds that enter the affine counting theorem. For $U \, V \, D > 0$ and $h gt.eq 2$, write

$ Psi_h \( U \, V \; D \) =
  frac(U V, #scale(x: 120%, y: 120%)[\(] \( k U + V \)^(h - 1) D #scale(x: 120%, y: 120%)[\)]^(1 \/ h)) \, wide
  g = \( d - 1 \) \( k - 1 \) + upright(bold(1))_(d = 4) . $

Keep the mode fixed when evaluating the following functions:

#[#set math.equation(numbering: n => "(10.3)")
 $ delta_d \( U \, V \) & = Psi_d \( U \, V \; U + V \) \,\
delta_h \( U \, V \) & =
  Psi_h \( U \, V \; min \( U \, V \) \) &  & \( 2 lt.eq h lt.eq d - 1 \, med upright("outside mode ") sans(Q) \) \,\
delta_3 \( U \, V \) & = Psi_3 \( U \, V \; V \) &  & \( upright("mode ") sans(Q) \) \,\
delta_2 \( U \, V \) & = max {Psi_2 \( U \, V \; min \( 3 U \, 2 V \, U + V \) \) \, U /
  sqrt(3)} &  & \( upright("mode ") sans(Q) \) \,\
delta_1 \( U \, V \) & = max {U / 2 \, min (U \, V / g)} . $ <eq:parameter-thresholds>]

Finally put $E_h \( U \, V \) = max_(h lt.eq s lt.eq d) delta_s \( U \, V \)$.

#thm([Proposition 10.1.])[
  (Parameter choice).  #emph[For each $d in { 4 \, 5 \, 6 \, 7 \, 8 }$,
    the stopping index in (10.2) is the one listed in Table 1.
    For every integer $K_0 lt.eq z < z_d$, there are positive rational numbers $t_(*) \, w$ such that,
    with $m = \( d - 1 \) w$,
#[#set math.equation(numbering: n => "(10.4)")
 $ 0 < m < 1 \, wide min \( eta_(-) \, b_(-) \) > m \,\
w^(d - 1) H \( t_(*) \) > (frac(\( d + 1 \) \( eta_(+) + b_(+) t_(*) \), d^2))^d \,\
w^(d - 2) min { H_a \( t_(*) \) \, H_b \( t_(*) \) } > (frac(eta_(+) + b_(+) t_(*), d - 1))^(d - 1) .
  $ <eq:parameter-cut-inequalities>]

 In particular, the cut conditions (5.2) hold. For
$ u = frac(eta_(+) - m, d) \, wide v = frac(b_(+) - m, d) \, $

 these choices also satisfy
#[#set math.equation(numbering: n => "(10.5)")
 $ 3 / 20 lt.eq v / u lt.eq 5 \, wide m + sum_(h = 1)^d E_h \( u \, v \) < 999 / 1000 \, wide m + 2 u < 999 /
   1000 quad \( upright("mode ") sans(Q) \) . $ <eq:parameter-saving>]

 Moreover, for either fixed mode, every $U \, V > 0$ with $3 \/ 20 lt.eq V \/ U lt.eq 5$ satisfies
#[#set math.equation(numbering: n => "(10.6)")
 $ delta_h \( U + s \, V + s \) lt.eq delta_h \( U \, V \) +
   s quad \( s gt.eq 0 \, med 1 lt.eq h lt.eq d \) . $ <eq:parameter-shift>]

]
] <prop:parameter-certificate>

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, right, right, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$z_d$
], table.cell(rowspan: 1, colspan: 1)[Intervals
], table.cell(rowspan: 1, colspan: 1)[$z_d \/ K_0$
], table.cell(rowspan: 1, colspan: 1)[Certified gap before $d tau$
]),
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[5124
], table.cell(rowspan: 1, colspan: 1)[2124
], table.cell(rowspan: 1, colspan: 1)[$427 \/ 250$
], table.cell(rowspan: 1, colspan: 1)[$191 \/ 100000$
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[4084
], table.cell(rowspan: 1, colspan: 1)[1084
], table.cell(rowspan: 1, colspan: 1)[$1021 \/ 750$
], table.cell(rowspan: 1, colspan: 1)[$293 \/ 50000$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[3552
], table.cell(rowspan: 1, colspan: 1)[552
], table.cell(rowspan: 1, colspan: 1)[$148 \/ 125$
], table.cell(rowspan: 1, colspan: 1)[$321 \/ 2500$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[3226
], table.cell(rowspan: 1, colspan: 1)[226
], table.cell(rowspan: 1, colspan: 1)[$1613 \/ 1500$
], table.cell(rowspan: 1, colspan: 1)[$23177 \/ 100000$
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[3003
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$1001 \/ 1000$
], table.cell(rowspan: 1, colspan: 1)[$31683 \/ 100000$
],
)
]],
  caption: [Table 1: The intervals have indices $3000 lt.eq z < z_d$. The last column is the minimum of $1 - m - sum_h overline(E)_h$, where each radical threshold is rounded strictly upwards as described in the proof. It is therefore a lower bound for the true gap. ],
)

#proof[
  We first give the rational prescription for $t_(*) \, w$,
    together with an exact check of the finite inequalities. We then prove the continuous assertion (10.6).
  ===== 10.1 Polynomial coefficients and the choice of weights. <polynomial-coefficients-and-the-choice-of-weights.>
  If
  $ c_j = binom(d, j) binom(d - 2, j - 1) k^(j - 1) wide \( 1 lt.eq j lt.eq d - 1 \) \, $
  then direct differentiation of $R$ gives
  #[#set math.equation(numbering: n => "(10.7)")
   $ H \( t \) = sum_(j = 1)^(d - 1) c_j t^j \, quad H_a \( t \) = sum_(j = 1)^(d - 1) frac(d - j, d) c_j t^j \,
     quad H_b \( t \) = sum_(j = 1)^(d - 1) j / d c_j t^(j - 1) . $ <eq:parameter-polynomials>]
  The binomial identities $\( d - j \) binom(d, j) \/ d = binom(d - 1, j)$ and $j binom(d, j) \/ d =
    binom(d - 1, j - 1)$ explain the three sums used in the certificate below.
  Choose $t_(*)$ among $i \/ 50$, $1 lt.eq i < 500$, to minimize
  $ frac(\( eta_(+) + b_(+) t \)^d, H \( t \)) \, $
  breaking a tie by taking the first value. For $0 lt.eq x < 1$ and an integer $e gt.eq 1$,
    let $"up"_e \( x \)$ be the least grid point $r \/ G_0$, with $r in { 1 \, dots.h \, G_0 }$,
    whose $e$-th power is strictly larger than $x$. Set
  #[#set math.equation(numbering: n => "(10.8)")
   $ w = "up"_(d - 1) (frac(1, H \( t_(*) \)) (frac(\( d + 1 \) \( eta_(+) + b_(+) t_(*) \), d^2))^d) .
     $ <eq:parameter-prescription>]
  The certificate checks that the argument lies in $\[ 0 \, 1 \)$.
    The first strict cut inequality then follows from the definition of $"up"_(d - 1)$;
    the second one and all the other finite conditions are checked directly.
  There is no floating-point root evaluation. The function #raw("upper") in the complete Python certificate of
    Appendix 13 maintains
  $ \( l \/ G_0 \)^e lt.eq x < \( r \/ G_0 \)^e $
  and terminates when $r = l + 1$. Thus the output is a strict upper bound,
    including when the exact root is already a grid point. Replacing each radical in (10.3) by such an upper bound
    can only increase each $E_h$. The list #raw("P") in that certificate is ordered from dimension $d$ down to
    dimension $1$; its successive prefix maxima therefore give exactly these conservative bounds for $E_d \,
    E_(d - 1) \, dots.h \, E_1$.
  All comparisons in this certificate use integers or rational numbers.
    It verifies every interval and the entries of Table 1, rather than an interpolation between sampled intervals.
    The choice of the two endpoint weights in (10.1) makes each successful check valid throughout its full interval.
  ===== 10.2 The common-shift estimate. <the-common-shift-estimate.>
  For $a \, b gt.eq 0$ with $a + b > 0$, define
  $ q_(a \, b) \( U \, V \) = frac(U V, a U + b V) \, wide F_(h \, a \, b) \( U \, V \) =
    frac(U V, #scale(x: 120%, y: 120%)[\(] \( k U + V \)^(h - 1) \( a U + b V \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ h)) . $
  The Hessian of $q_(a \, b)$ is
  $ frac(- 2 a b, \( a U + b V \)^3) mat(delim: "(", V^2, - U V; - U V, U^2) \, $
  so $q_(a \, b)$ is concave. It is also increasing in each variable;
    when one coefficient is zero it is a positive multiple of a coordinate. The identity
  $ F_(h \, a \, b) = q_(k \, 1)^(\( h - 1 \) \/ h) q_(a \, b)^(1 \/ h) $
  and concavity and monotonicity of the weighted geometric mean show that each $F_(h \, a \, b)$ is concave and
    increasing. It is homogeneous of degree one.
  Write $f \( t \) = F_(h \, a \, b) \( 1 \, t \)$. Homogeneity shows that the derivative in the direction
    $\( 1 \, 1 \)$, at a point with ratio $t = V \/ U$, is
  $ D \( t \) = f \( t \) + \( 1 - t \) f' \( t \) . $
  Since $D' \( t \) = \( 1 - t \) f'' \( t \)$, this derivative is nonincreasing before $t =
    1$ and nondecreasing after $t = 1$. Its maximum on $\[ 3 \/ 20 \, 5 \]$ is attained at an endpoint.
    Direct differentiation gives
  $ D \( t \) =
    frac(N_(h \, a \, b) \( t \), #scale(x: 120%, y: 120%)[\(] \( k + t \)^(h - 1) \( a + b t \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ h)) \, $
  where
  $ N_(h \, a \, b) \( t \) = t (1 + 1 / t - frac(h - 1, h) frac(k + 1, k + t) - 1 / h frac(a + b, a + b t)) . $
  The function #raw("check_derivatives") verifies, for both endpoints, all $2 lt.eq k lt.eq 6$, all $2 lt.eq
    h lt.eq k + 2$, and $\( a \, b \) = \( 1 \, 0 \) \, \( 0 \, 1 \) \, \( 1 \, 1 \)$, that
  $ N_(h \, a \, b) \( t \) gt.eq 0 \, wide N_(h \, a \, b) \( t \)^h < \( k + t \)^(h - 1) \( a + b t \) . $
  Thus $D \( t \) lt.eq 1$ on the full ratio interval for these branches. The shifted ratio
  $ frac(V + s, U + s) = frac(U, U + s) V / U + frac(s, U + s) $
  remains between $V \/ U$ and $1$. Integrating the derivative bound along this path gives the claimed shift
    estimate for every branch.
  Multiplying the denominator form by a constant $c gt.eq 1$ multiplies the branch by $c^(- 1 \/ h) lt.eq 1$,
    so the forms $3 U$ and $2 V$ are covered as well. A finite minimum or maximum of functions satisfying the
    shift estimate satisfies the same estimate, simply by taking that extremum on both sides.
    This handles the min/max expressions in (10.3); no concavity of their maximum is needed.
    Finally, the functions $U \/ sqrt(3)$, $U \/ 2$, $U$, and $V \/ g$ have directional slopes at most one.
    This also proves the curve case and completes (10.6). ◻
]

=== 10.1 Coverage and the remaining exponent margins <coverage-and-the-remaining-exponent-margins>

The transition function $phi.alt_d \( eta \) = eta \( 1 - k eta \/ d \)$ is nonincreasing for $eta gt.eq 1$, since

$ phi.alt'_d \( eta \) = 1 - frac(2 k eta, d) lt.eq frac(4 - d, d) lt.eq 0 . $

Consequently all intervals before the stopping index are covered by Proposition 24,
  and every subsequent $eta lt.eq d \/ k$ satisfies the larger-$eta$ condition $phi.alt_d \( eta \) < 2495 \/
  10000$. The last closed interval ends at $z_d \/ K_0$, so the two ranges meet without a gap.
  In the quartic case, the last $sans(Q)$ interval ends at $4 \/
  3$ and the next interval uses the ordinary thresholds; either interval covers their common endpoint.

The lattice ranges of Proposition 17 have $U = u + j + tau$, $V = v + j + tau$ and box factor $X^(m - d j)$.
  By (10.6), their combined exponent is at most

#[#set math.equation(numbering: n => "(10.9)")
 $ m - d j + sum_(h = 1)^d E_h \( U \, V \) lt.eq m + sum_(h = 1)^d E_h \( u \, v \) + d tau < 24979 /
   25000 < 1 . $ <eq:parameter-final-box-exponent>]

The estimate uses only the advertised $999 \/ 1000$ bound and $d lt.eq 8$; Table 1 gives stronger bounds.
  For mode $sans(Q)$, the removed base fibers have combined exponent

#[#set math.equation(numbering: n => "(10.10)")
 $ m - 4 j + 2 U = m + 2 u - 2 j + 2 tau < 3122 / 3125 < 1 . $ <eq:parameter-fiber-exponent>]

In particular, both inequalities leave positive room for the arbitrarily small loss in the affine counting theorem.

The direct larger-$eta$ argument uses a fixed finite set of positive rational coordinate weights even at the
  terminal point $b = d - k eta = 0$. The available product gap is

#[#set math.equation(numbering: n => "(10.11)")
 $ (4999 / 10000)^2 - 2495 / 10000 = 40001 / 100000000 > 0 . $ <eq:parameter-large-eta-gap>]

An explicit choice on $1 lt.eq eta lt.eq d \/ k$ is, with $e = 1 \/ 10000$,

$ b' = e \( floor.l b \/ e floor.r + 1 \) \, wide eta' = e \( floor.l eta \/ e floor.r + 1 \) . $

These are strict positive upper weights, drawn from a finite set.
  Since $b + eta lt.eq 3$ and $d gt.eq 4$, whenever $b eta \/ d lt.eq 2495 \/ 10000$ they satisfy

$ frac(b' eta', d) lt.eq 2495 / 10000 + frac(3 e + e^2, 4) < (4999 / 10000)^2 . $

Also include the pair $\( b' \, eta' \) = \( e \, d \/ k + e \)$, which covers $d \/ k lt.eq eta < d \/ k + e$.
  This includes every fixed-coefficient $O_f \( 1 \/ log X \)$ overshoot once $X$ is sufficiently large.
  Thus the surface threshold in the direct argument is strictly below $4999 \/ 10000$,
  including the endpoint range. Together with the curve threshold $1 \/ 2$,
  the exponent from the two cumulative maxima is strictly below $9999 \/ 10000$.
  These fixed margins are the numerical input for the final tail summation.

== 11 The large-prime estimate <sec:tail-proof>

We now assemble the preceding estimates to prove Proposition 4.
  Throughout this section $f$ is fixed, primitive and irreducible, with positive leading coefficient, $4 lt.eq
  d lt.eq 8$, and $k = d - 2$. For sufficiently large $X$,

$ 0 < f \( n \) lt.double_f X^d wide \( X < n lt.eq 2 X \) . $

If $p^k divides f \( n \)$, then $p lt.double_f X^(d \/ k)$.
  Partition the primes $p > X$ into $O_f \( log X \)$ dyadic intervals $\[ P \, 2 P \]$,
  truncating the final interval as necessary. For each interval,
  choose one qualifying prime for each qualifying input. Put

$ eta = frac(log P, log X) \, wide b = d - k eta . $

Thus $1 lt.eq eta lt.eq d \/ k + O_f \( 1 \/ log X \)$. We seek one common positive saving throughout these
  intervals. Choices of charts, ideal classes and components made below have bounded multiplicity and may be
  summed at the end.

=== 11.1 The range handled by the original surface <the-range-handled-by-the-original-surface>

Suppose first that

#[#set math.equation(numbering: n => "(11.1)")
 $ eta (1 - frac(k eta, d)) lt.eq 2495 / 10000 . $ <eq:tail-direct-range>]

The chosen triples

$ \( x \, y \, z \) = (n \, frac(f \( n \), p^k) \, p) $

are integer points on the irreducible affine surface

#[#set math.equation(numbering: n => "(11.2)")
 $ f \( x \) = y z^k . $ <eq:tail-direct-surface>]

Its irreducibility follows from Gauss’s lemma, since it is primitive and linear in $y$ over $bb(C) \[ x \, z \]$:
  the coefficients $z^k$ and $f \( x \)$ are coprime. The coordinate bounds are $O_f \( X \)$,
  $O_f \( X^b \)$ and $O_f \( X^eta \)$.

Use the finite positive rational upper weights $b' \, eta'$ constructed at the end of Section 10. They satisfy

#[#set math.equation(numbering: n => "(11.3)")
 $ sqrt(b' eta' \/ d) < 0.4999 . $ <eq:tail-direct-margin>]

The construction covers $b = 0$ and the possible $O_f \( 1 \/ log X \)$ excess beyond $d \/ k$,
  for all sufficiently large $X$. Work separately with these finitely many choices.

For weights $\( 1 \, b' \, eta' \)$, the space of polynomial functions on (11.2) has filtered dimension

#[#set math.equation(numbering: n => "(11.4)")
 $ H \( T \) = frac(D, b' eta') T^2 / 2 + O \( T \) \, wide D = max { d \, b' + k eta' } . $ <eq:tail-surface-hilbert>]

Indeed multiplication by the defining polynomial increases weight by exactly $D$,
  since its weighted highest part is nonzero and the polynomial ring is a domain.
  Choose a positive integer $L$ so that $A = L$, $B = L b'$, $C = L eta'$ and $E = L D$ are integers.
  Weighted homogenization, with a variable of weight one, gives the filtered Hilbert series

$ frac(1 - t^E, \( 1 - t \) \( 1 - t^A \) \( 1 - t^B \) \( 1 - t^C \)) . $

The pole at one has order three and leading coefficient $E \/ \( A B C \)$.
  Every other root of unity has pole order at most two: if its order divides all three coordinate weights $A \,
  B \, C$, it also divides the monomial weight $E$, so the numerator cancels a denominator factor.
  Extracting the coefficient of $t^(floor.l L T floor.r)$ and rescaling gives (11.4),
  with the stated $O \( T \)$ error. Consequently the surface threshold in Theorem 8 may be taken to be

$ delta_2 = sqrt(b' eta' \/ D) < 0.4999 . $

Consider an irreducible curve defined over $bb(Q)$ on this surface and meeting the selected points.
  A constant $x$ contributes at most one selected triple. Otherwise $bb(C) \( x \)$ is a subfield of its function
  field. If the extension has degree at least two, one of the other coordinate functions lies outside
  $bb(C) \( x \)$. Multiplying powers of $x$ by that function and by one gives two independent families,
  so $H \( T \) gt.eq 2 T - O \( 1 \)$.

In the remaining case $y$ and $z$ are rational functions of $x$. They are defined over $bb(Q)$:
  the curve is defined over $bb(Q)$ and the functions are uniquely determined by $x$.
  Their degrees are bounded in terms of the curve degree, by projection.
  A nonpolynomial function is covered by Lemma 22 and contributes $O_epsilon \( X^epsilon \)$ points.
  If both are polynomials, the identity $f \( x \) = y \( x \)
  z \( x \)^k$ and the absence of repeated roots of $f$ force $z$ to be constant.
  At selected points this constant is a prime $p > X$. Outside the fixed bad primes,
  $f$ has at most $d$ roots modulo $p^k$, and $p^k > X$; hence this curve contributes $O_f \( 1 \)$ inputs in
  $\( X \, 2 X \]$. These alternatives are uniform for bounded curve degrees.

An irreducible two-dimensional subvariety of (11.2) is the surface itself.
  Its Hilbert bound and the curve alternatives above, including the bounded constant-$x$ and constant-$z$ cases,
  therefore verify the hypotheses of Theorem 8 with $delta_1 = 1 \/ 2$.
  Since $delta_2 < delta_1$, that theorem bounds the number of triples by

$ O_(f \, epsilon) #scale(x: 120%, y: 120%)[\(] X^(delta_2 + 1 \/ 2 + epsilon) #scale(x: 120%, y: 120%)[\)] . $

The finite list of choices in (11.3) permits one sufficiently small $epsilon > 0$ and one positive power saving.

=== 11.2 The number-field range <the-number-field-range>

For all other $eta$, use one of the finite parameter intervals from Proposition 24.
  Denote its parameters by $t_(*) \, w \, m \, u \, v$ and use the thresholds $delta_h \( U \, V \)$ defined
  there. In particular,

$ m = \( d - 1 \) w \, wide 0 < m < min \( eta_(-) \, b_(-) \) \, wide u = frac(eta_(+) - m, d) \, quad v =
  frac(b_(+) - m, d) \, quad tau = 1 / 50000 . $

The finite interval list covers the complement of (11.1);
  its stopping endpoints lie strictly inside the latter range. This supplies coverage at all boundaries.

For $d = 4$, remove once the set of exceptional values in Proposition 21.
  Its total size is $O_f \( X^(1 \/ 5) \)$, independently of the subsequent prime intervals, boxes or curves.
  Lemma 12 and Lemma 13 place the remaining chosen inputs in paired arithmetic boxes.
  The strict inequalities in the parameter certificate permit the cuts of Proposition 15.

For each box pair, the resulting affine sets have dimension at most $d - 1$,
  except for the mixed-cut components of dimension $d$. All their degrees and their number per pair are bounded
  before $X$ varies. Group the pairs as in Proposition 17. There are only boundedly many indices $j gt.eq 0$,
  and a group has

#[#set math.equation(numbering: n => "(11.5)")
 $ O_f \( X^(m - d j) \) upright(" pairs") \, wide \| x'_i \| lt.double_f X^U \,
   quad \| y'_i \| lt.double_f X^V \, quad U = u + j + tau \, quad V = v + j + tau . $ <eq:tail-lattice-group>]

The coordinate changes are integral and unimodular. Their coefficients may vary;
  the preceding Hilbert statements are uniform under these changes and fixed degree bounds.

In quartic mode $sans(Q)$, first delete the infinite-fiber points of Lemma 18 from each initial set.
  The cost per box is $O_f \( X^(2 U) \)$. On the remaining point set, Proposition 19,
  Proposition 20 and Proposition 23 give, for every irreducible $bb(Q)$-defined subvariety that can occur in the
  affine counting theorem, either its uniform small-count alternative or

$ H_A \( T \) gt.eq frac(T^h, h ! thin delta_h \( U \, V \)^h) - O \( T^(h - 1) \) \, wide h = dim A > 0 . $

Outside mode $sans(Q)$ the general Hilbert and curve statements give the same assertion with the corresponding
  thresholds. A constant input or constant first coordinate tuple has the already proved bounded count.
  The deletion of the quintic values is precisely what supplies the improved quartic curve threshold.

Set $E_h \( U \, V \) = max_(h lt.eq s lt.eq d) delta_s \( U \, V \)$.
  Theorem 8, with ambient dimension $2 d$ and dimension bound $d$,
  bounds each remaining set by $O_(f \, epsilon) \( X^(sum_h E_h \( U \, V \) + epsilon) \)$.
  Its hypotheses have been checked for every bounded degree,
  so they apply to the moving subvarieties introduced by that theorem, not just to the initial cut components.
  Multiplying by (11.5), and applying the shift inequality in the parameter certificate, gives the exponent

$ m - d j + sum_(h = 1)^d E_h \( u + j + tau \, v + j + tau \) + epsilon & lt.eq m - d j +
  sum_(h = 1)^d #scale(x: 120%, y: 120%)[\(] E_h \( u \, v \) + j + tau #scale(x: 120%, y: 120%)[\)] + epsilon\
 & = m + sum_(h = 1)^d E_h \( u \, v \) + d tau + epsilon . $

By (10.9), this is less than $24979 \/ 25000 + epsilon$. A sufficiently small fixed $epsilon$ therefore leaves a
  uniform positive gap below one.

The quartic infinite-fiber cost, including the number of boxes, has exponent

$ m - d j + 2 \( u + j + tau \) < 3122 \/ 3125 < 1 $

by (10.10). Thus it also has a uniform positive saving. The finite number of parameter intervals,
  boundedly many lattice groups and bounded component multiplicities affect only the implied constant.

=== 11.3 Completion <completion>

The determinant degrees, patch degrees, Hilbert error constants and counting tolerances are fixed using the strict
  margins before $X$ tends to infinity. There are finitely many parameter intervals;
  take the minimum of their savings and that of the direct surface range.
  Increasing one threshold for $X$ absorbs all bounded constants.
  Summing over the $O_f \( log X \)$ dyadic prime intervals then preserves a smaller positive power saving.
  The single quartic exceptional set is also smaller than this bound after decreasing the saving if necessary.
  This proves Proposition 4.

Finally, Proposition 5 applies to a sign-normalized primitive part of each polynomial in Theorem 1.
  It retains the exact local factors of the original polynomial, including its content primes,
  and gives the asserted positive Euler-product asymptotic.

== 12 The cyclotomic quartic as a worked example <sec:cyclotomic>

For $f \( T \) = T^4 + 1$, the preceding argument gives an explicit density.
  The arithmetic of $bb(Q) \( zeta_8 \)$ also makes several parts of the determinant construction particularly
  concrete. We describe that specialization and two additional ways of organizing its estimates:
  the level equation on integral representatives and the negative Pell equation at the upper end of the prime
  range. We conclude with a conditional estimate for analytic relations.
  The factorization viewpoint is closely related to Heath-Brown’s Gaussian treatment of $n^2 +
  1$ and Reuss’s number-field construction #cite(label("HeathBrown2012Squarefree")) #cite(label("Reuss2015PowerFree")).

=== 12.1 Local factors and the dyadic conclusion <local-factors-and-the-dyadic-conclusion>

#thm([Corollary 12.1.])[
  #emph[Put
$ c_8 = product_(p equiv 1 med \( mod med 8 \)) (1 - 4 / p^2) . $

 Then $c_8 > 3 \/ 4$, and
$ \# { 1 lt.eq n lt.eq X : n^4 + 1 upright(" is squarefree") } = c_8 X + o \( X \) . $

 Consequently, for every sufficiently large real $N$,
$ \# { n in bb(Z) : N lt.eq n lt.eq 2 N \, med n^4 + 1 upright(" is squarefree") } gt.eq N \/ 2 . $

]
] <cor:cyclotomic-density>

#proof[
  The polynomial $\( T + 1 \)^4 + 1$ is Eisenstein at $2$, so $T^4 + 1$ is irreducible.
    Its value at zero is one, which proves local admissibility. There is no root modulo $4$:
    the value is $1$ for even inputs and $2$ for odd inputs. For an odd prime $p$, a root of $T^4 +
    1$ has order eight in $bb(F)_p^times$. Conversely, the cyclic group $bb(F)_p^times$ has precisely four
    elements of order eight when $p equiv 1 med \( mod med 8 \)$, and none otherwise.
    Each root is simple, since $4 T^3$ is nonzero there, and therefore lifts uniquely modulo $p^2$.
    Theorem 1 gives the displayed Euler product and asymptotic.
  Every prime in this product is at least $17$. For finite products, $product_j \( 1 - a_j \) gt.eq 1 -
    sum_j a_j$ when $0 lt.eq a_j lt.eq 1$; passing to the limit gives
  $ c_8 gt.eq 1 - 4 sum_(p equiv 1 med \( mod med 8 \)) p^(- 2) > 1 - 4 sum_(m gt.eq 17) m^(- 2) > 1 -
    4 integral_16^oo t^(- 2) thin d t = 3 / 4 . $
  Taking the difference of the asymptotics at $2 N$ and $N$, with an $O \( 1 \)$ endpoint correction,
    proves the final assertion. ◻
]

The central prime range admits a stronger error estimate than the positive-proportion conclusion by itself
  requires. We retain it explicitly, including the small extension below the input scale.

#thm([Proposition 12.2.])[
  #emph[With $epsilon.alt_0 = 10^(- 6)$, there exists $delta_0 > 0$ such that
$ \# { n in bb(Z) : N lt.eq n lt.eq 2 N \, med p^2 divides n^4 +
  1 upright(" for some prime ") N^(1 - epsilon.alt_0) lt.eq p lt.eq
  N^(3 \/ 2 + epsilon.alt_0) } lt.double N^(1 - delta_0) . $

]
] <prop:cyclotomic-central>

#proof[
  Proposition 4 already treats the primes $p > N$. For the remaining range,
    split into dyadic intervals with lower endpoint $P = N^eta$, where $1 - epsilon.alt_0 lt.eq eta lt.eq 1$.
    Use the first quartic parameter cell with the following enlarged endpoint bounds:
  $ eta_(-) = 1 - epsilon.alt_0 \, quad eta_(+) = 3001 / 3000 \, quad b_(-) = 2999 / 1500 \, quad b_(+) = 2 +
    2 epsilon.alt_0 \, quad t_(*) = 1 / 2 \, quad w = 24809 / 100000 . $
  Keep mode $sans(Q)$ and $tau = 1 \/ 50000$. These are fixed rational parameters.
    In the notation of Section 10, they give
  $ m = 74427 / 100000 \, quad u = 76819 / 1200000 \, quad v = 313933 / 1000000 . $
  Both strict cut inequalities (10.4) hold, $m < min \( eta_(-) \, b_(-) \)$, and $3 \/ 20 lt.eq v \/ u lt.eq 5$.
    An exact check is supplied in Appendix 13.1. The conservative upper bounds for the thresholds in decreasing
    dimension order are
  $ \( overline(delta)_4 \, overline(delta)_3 \, overline(delta)_2 \, delta_1 \) =
    (4729 / 100000 \, 5097 / 100000 \, 6899 / 100000 \, 76819 / 1200000) . $
  Taking cumulative maxima gives
  $ 1 - m - sum_(h = 1)^4 overline(E)_h - 4 tau = 1941 / 100000 > 0 \, wide 1 - m - 2 u - 2 tau = 15319 / 120000 > 0 . $
  Thus the lattice summation and infinite-fiber deletion have fixed positive savings on this entire enlarged cell.
  We check the arithmetic hypotheses rather than inferring them from the numerical test.
    Since $epsilon.alt_0 < 1 \/ 2$, every prime now considered satisfies $p^2 gt.eq N^(2 - 2 epsilon.alt_0) > N$.
    It also tends to infinity, so the fixed bad primes are eventually absent.
    These are the only uses of $p > X$ in the proof of Lemma 12:
    exclusion of the fixed bad primes and at most one input per root class modulo $p^2$ in an interval of length
    $N$. Repeating that proof therefore gives the same factorization and selected-point multiplicities in this
    band. The paired charts, determinant cuts and lattice groups require only the displayed coordinate upper
    bounds and their strict parameter inequalities. The Hilbert and curve alternatives concern these arithmetic
    equations and weights and impose no further condition $p > N$.
    The argument of Section 11 in the number-field range consequently gives one power saving on every dyadic
    interval here. Delete the one global quintic-value set before this summation,
    absorb the $O \( log N \)$ intervals by a smaller saving, and combine with the already proved $p > N$ bound.
    The endpoint correction at $n = N$ is $O \( 1 \)$. ◻
]

=== 12.2 An explicit factorization and a Pell estimate <an-explicit-factorization-and-a-pell-estimate>

Write $zeta = exp \( 2 pi i \/ 8 \)$ and $R = bb(Z) \[ zeta \]$.
  In this case the ideal-class correction in Lemma 12 can be omitted:
  one can take $mu = 1$ and obtain primitive coefficient vectors. The following direct argument records why.

The ring $R = bb(Z) \[ i \] + zeta bb(Z) \[ i \]$ is Euclidean for the absolute field norm.
  Given $a + b zeta in bb(Q) \( zeta \)$, round $a \, b in bb(Q) \( i \)$ to Gaussian integers, with errors $c \,
  d$ satisfying $\| c \|^2 \, \| d \|^2 lt.eq 1 \/ 2$. Then

$ \| N_(bb(Q) \( zeta \) \/ bb(Q)) \( c + d zeta \) \| = \| c^2 - i d^2 \|^2 < 1 . $

The triangle inequality gives strictness unless both errors have squared modulus $1 \/ 2$.
  In that remaining case their real and imaginary parts have absolute value $1 \/ 2$,
  so $c^2$ and $i d^2$ are perpendicular and the squared modulus is $1 \/ 2$.
  Euclidean division implies that every ideal of $R$ is principal.

If $p^2 divides n^4 + 1$, evaluation $zeta mapsto n$ defines surjections $phi.alt_j : R arrow.r
  bb(Z) \/ p^j bb(Z)$ for $j = 1 \, 2$. Write $ker phi.alt_1 = \( A \)$.
  Its index is $p$, so $N \( A \) = p$; the norm is positive because the embeddings occur in complex conjugate
  pairs. The inclusion $\( A \)^2 subset.eq ker phi.alt_2$ is an equality by their indices. It follows that

#[#set math.equation(numbering: n => "(12.1)")
 $ A^2 B = n - zeta \, wide A \, B in R \, wide N \( A \) = p . $ <eq:cyclotomic-factorization>]

The unit $1 + sqrt(2)$, where $sqrt(2) = zeta - zeta^3$, has absolute values $1 +
  sqrt(2)$ and $\( 1 + sqrt(2) \)^(- 1)$ at the two complex places.
  Multiplication by a suitable power of this unit balances the two absolute values of $A$.
  Thus, if $N lt.eq n lt.eq 2 N$ and $P lt.eq p < 2 P$,

$ \| sigma \( A \) \| asymp P^(1 \/ 4) \, wide \| sigma \( B \) \| asymp N P^(- 1 \/ 2) $

at every embedding. Both coefficient vectors in the basis $1 \, zeta \, zeta^2 \, zeta^3$ are primitive,
  since a common integer divisor of either vector would divide the coefficient $- 1$ of $zeta$ in $A^2 B$.

#thm([Lemma 12.3.])[
  #emph[Uniformly in the positive integer $D$, the number of positive integer pairs $\( n \, q \)$ with $N lt.eq
    n lt.eq 2 N$ and $n^4 + 1 = D q^2$ is $O \( 1 + log N \)$.
    Consequently, for every fixed $epsilon.alt > 0$, the number of inputs in this interval with $p^2 divides n^4 +
    1$ for some prime $p > N^(3 \/ 2 + epsilon.alt)$ is $O \( N^(1 - 2 epsilon.alt) \( 1 + log N \) \)$.]
] <lem:cyclotomic-pell>

#proof[
  Put $x = n^2$. If $D$ is a square, factoring $D q^2 - x^2 = 1$ rules out $x > 0$.
    Otherwise attach to a solution the positive number $alpha = x + q sqrt(D) = x + sqrt(x^2 + 1)$, of norm $- 1$.
    For two distinct solutions with $alpha_2 > alpha_1$, their ratio $gamma =
    alpha_2 \/ alpha_1$ belongs to $bb(Z) \[ sqrt(D) \]$ and has norm one, because $alpha_1^(- 1) = -
    overline(alpha_1)$. Writing $gamma = a + b sqrt(D)$ gives $2 a = gamma + gamma^(- 1) > 2$, whence $a gt.eq
    2$ and $gamma gt.eq 2 + sqrt(3)$. All the $alpha$ are at most $8 N^2 + 1$.
    Their fixed multiplicative spacing proves the first assertion.
    For the second, $D = \( n^4 + 1 \) \/ p^2 lt.eq 17 N^(1 - 2 epsilon.alt)$;
    sum the first bound over these integers $D$. ◻
]

A fixed projective $B$-direction has at most two primitive integral representatives and hence fixes $D =
  N \( B \)$. Taking norms in (12.1) then gives the same Pell equation with $q = p$.
  A fixed $A$-direction fixes $p = N \( A \)$ and one residue class for $n$ modulo $p^2$,
  so it contributes $O \( 1 + N \/ p^2 \)$ inputs. These are special projective-direction multiplicity bounds.
  The general affine argument instead selects one representation per input and uses the fixed-$x$ bound in Lemma 12.

=== 12.3 Directions and the level equation <directions-and-the-level-equation>

For coefficient vectors $A \, B$, let $T_0 \, S \, C_2 \, C_3$ be the coefficients of $1 \, zeta \, zeta^2 \,
  zeta^3$ in $A^2 B$. Their projective directions lie on

$ cal(V)_8 = { C_2 = C_3 = 0 } subset.eq bb(P)^3 times bb(P)^3 \, $

while the actual integral representatives satisfy

#[#set math.equation(numbering: n => "(12.2)")
 $ T_0 = n \, wide S = - 1 . $ <eq:cyclotomic-level>]

If $H \, J$ denote the hyperplane classes of the two factors, the complete-intersection calculation in Lemma 14 becomes

$ \[ cal(V)_8 \] = \( 2 H + J \)^2 \,
  wide \( H^4 \, H^3 J \, H^2 J^2 \, H J^3 \, J^4 \)_(cal(V)_8) = \( 0 \, 1 \, 4 \, 4 \, 0 \) . $

On the split-coordinate torus, with conjugates $zeta_i$, its points satisfy $A_i^2 B_i = T_0 + S zeta_i$.
  Thus the divisor $S = 0$ is, on that open set, the inverse-square graph $\[ B_i \] = \[ A_i^(- 2) \]$.
  The analytic coordinate $- S \/ T_0$ is exactly $1 \/ n$ at the counted points.
  This identifies the concrete direction geometry behind the paired charts of Section 4.

There is also a determinant saving obtained directly from $S = - 1$.
  We give its column-selection form; it explains why that equation contains more information than its projective
  zero locus.

Let $D subset.eq cal(V)_8$ be an integral direction variety of dimension $r gt.eq 1$ meeting ${ S eq.not 0 }$,
  and write $cal(R)_D \( K \, L \)$ for the restrictions of bihomogeneous forms of bidegree $\( K \, L \)$.
  Suppose a homogeneous polynomial $v_0 \( k \, l \)$ of degree $r$, with nonnegative mixed-degree coefficients,
  supplies the lower bound

#[#set math.equation(numbering: n => "(12.3)")
 $ dim cal(R)_D \( T k \, T l \) gt.eq frac(v_0 \( k \, l \), r !) T^r -
   O \( T^(r - 1) \) $ <eq:cyclotomic-volume-input>]

on each fixed positive rational ray. One can use the actual mixed-degree polynomial,
  or coordinatewise lower bounds for its coefficients. For bounded geometric degree,
  the error can be taken uniformly on any fixed finite list of rays.
  Indeed, after the corresponding projective embedding, linear Noether normalization of the coordinate ring gives
  a polynomial subring whose field extension degree is the projective degree $e$.
  Monomials of degree at most $e - 1$ contain a field basis:
  their spans increase strictly until they fill the extension.
  After multiplication by powers of one normalization coordinate,
  these give a graded injection of $e$ copies of that polynomial ring, shifted by $e - 1$.
  Its degree-$T$ dimension is $e binom(T - e + 1 + r, r)$, which proves the required uniform lower bound.

Suppose the integral representatives in polynomial-height lattice bases satisfy $\| A \| lt.double N^h$,
  $\| B \| lt.double N^g$, where $h \, g gt.eq 0$. For positive rational $k \, l$, put $a =
  min \( k \/ 2 \, l \)$ and assume $v_0 \( k \, l \) > 0$.
  A nested selection of integral columns has average logarithmic size, divided by the common bidegree scale $T$, at most

#[#set math.equation(numbering: n => "(12.4)")
 $ k h + l g - \( 2 h + g \) integral_0^a frac(v_0 \( k - 2 j \, l - j \), v_0 \( k \, l \)) thin d j +
   epsilon . $ <eq:cyclotomic-level-saving>]

Here $epsilon > 0$ is arbitrarily prescribed: first fix a sufficiently fine mesh and then a sufficiently large
  $T$, before $N$ grows.

To prove this, fix a rational mesh $0 = j_0 < dots.h.c < j_s < a$ and consider the nested subspaces

$ S^(j_i T) cal(R)_D \( T \( k - 2 j_i \) \, T \( l - j_i \) \) subset.eq cal(R)_D \( T k \, T l \) . $

Multiplication by $S$ is injective, since $S$ is nonzero on $D$.
  Choose decreasing integers $r_i = v_0 \( k - 2 j_i \, l - j_i \) T^r \/ r ! +
  O \( T^(r - 1) \)$ below their dimensions, and put $P = r_0$.
  Starting from the smallest subspace, extend to $r_i$ independent generators at each stage.
  Each generator is an individual integral form $S^b cal(M)$ of bidegree $\( T k \, T l \)$.
  Its value at a counted point is $\( - 1 \)^b cal(M) \( A \, B \)$, bounded by

$ O_T #scale(x: 120%, y: 120%)[\(] N^(h \( T k - 2 b \) + g \( T l - b \)) #scale(x: 120%, y: 120%)[\)] . $

At least $r_i$ columns have $b gt.eq j_i T$. Summing these exponents, then refining the fixed mesh, gives (12.4).
  This argument does not require small coefficients for the rebased form $S$.

For the local divisibility step, suppose that $D$ is defined over $bb(Q)$ and has an integral model smooth of
  relative dimension $r$ at the chosen residue class modulo $q$.
  A determinant of $P$ such common-bidegree columns in that projective residue class has valuation at least
  $s_r \( P \)$, as in (3.4): normalize by chart coordinates that are units modulo $q$ and expand in the $r$ free
  differences. Combining that divisibility with (12.4), a prime $q gt.eq N^rho$ forces a proper cut whenever

#[#set math.equation(numbering: n => "(12.5)")
 $ rho > frac(1 + 1 \/ r, v_0 \( k \, l \)^(1 \/ r)) {k h +
   l g - \( 2 h + g \) integral_0^a frac(v_0 \( k - 2 j \, l - j \), v_0 \( k \, l \)) thin d j} .
   $ <eq:cyclotomic-level-threshold>]

The strict margin fixes the mesh and determinant degree before $N$.
  In particular, for a curve with $a_1 = H dot.op D$, $b_1 = J dot.op D$,
  the choice $\( k \, l \) = \( 2 \, 1 \)$ makes the integral $1 \/
  2$ and the threshold $\( 2 h + g \) \/ \( 2 a_1 + b_1 \)$.
  This is the projective counterpart of the weighted affine curve estimates in Section 9;
  the general proof uses those affine estimates throughout.

=== 12.4 Analytic relations and box incidence <analytic-relations-and-box-incidence>

The main proof uses an exact polynomial relation in each pure direction component.
  We record a local analytic version with its hypotheses, describe the quintic equality case,
  and give an elementary box-incidence estimate. These observations explain uses of the cyclotomic geometry;
  the proof of the density theorem uses the affine constructions of Sections 5 and 6.

===== 12.4.1 Approximate rank from an actual analytic relation. <approximate-rank-from-an-actual-analytic-relation.>

Fix $omega > 0$ and give four local variables $u_1 \, u_2 \, u_3 \,
  u_4$ weights $\( omega \, omega \, omega \, 1 \)$. For the paired quartic charts one takes $omega = w$,
  the grid exponent, whereas $m = 3 w$ counts the boxes. Let $f_lambda$ be holomorphic on one fixed complex
  polydisc about zero, uniformly bounded there, with Taylor coefficients continuous at a parameter $lambda_0$.
  Assume that $f_(lambda_0)$ is a nonzero germ of lowest weighted degree $D > 0$. Consider points satisfying

$ \| u_i \| lt.double N^(- omega) med \( 1 lt.eq i lt.eq 3 \) \, wide \| u_4 \| lt.double N^(- 1) \, wide
  f_lambda \( u \) = 0 \, $

where $lambda$ lies in a sufficiently small neighborhood of $lambda_0$.
  For each evaluation matrix, fix one such $lambda$; all its points satisfy the same equation $f_lambda = 0$.
  All truncation levels and matrix sizes below are fixed before $N$ grows.
  If the limiting germ instead has nonzero constant term, there are no such shrinking zeros near $lambda_0$ for
  large $N$.

Let $E_Z$ be the coefficient space spanned by monomials of weight strictly less than $Z$,
  with its Euclidean coefficient norm. For fixed $Z > D$, truncated multiplication defines

$ M_lambda : E_(Z - D) arrow.r E_Z \, wide p mapsto \[ p f_lambda \]_(< Z) . $

This map is injective at $lambda_0$. Indeed the lowest weighted parts of two nonzero polynomials have nonzero
  product, and the lowest weight of $p f_(lambda_0)$ is less than $Z$ for nonzero $p in E_(Z - D)$.
  A nonzero maximal minor persists near $lambda_0$, so $M_lambda$ has a uniformly bounded left inverse on its image.

At the chosen points, every truncated multiple $\[ u^alpha f_lambda \]_(< Z)$ is $O_Z \( N^(- Z) \)$.
  To justify this uniformly, expand on the common polydisc to an ordinary Taylor order $K$ with
  $min \( omega \, 1 \) \( K + 1 \) gt.eq Z$. The omitted finite terms have weight at least $Z$,
  and the remaining Taylor tail has the same bound. The identity $f_lambda \( u \) =
  0$ then gives the assertion for the truncated multiple. The bounded left inverse gives that bound for every
  unit-norm element of $W_lambda = "im" M_lambda$.

Now take any fixed number of analytic column functions, uniformly bounded on the same polydisc,
  and evaluate them at the chosen points. Truncate each column to $E_Z$ and project its coefficient vector onto
  $W_lambda^perp$. The evaluation matrix changes entrywise by $O_Z \( N^(- Z) \)$,
  while the projected matrix has rank at most

$ q_Z = dim E_Z - dim E_(Z - D) = frac(D, 6 omega^3) Z^3 + O_(D \, omega) \( Z^2 + 1 \) . $

For the last equality choose a lowest monomial $u^gamma$ of the limiting relation, so its weight is $D$.
  The dimension difference counts the monomials of weight less than $Z$ not divisible by $u^gamma$.
  Their exponents lie in the union of the strips $alpha_i < gamma_i$.
  The individual strips have total leading coefficient $D \/ \( 6 omega^3 \)$,
  and pairwise intersections contribute $O \( Z^2 + 1 \)$.

This is a bound on an approximating matrix, not an exact rank bound on the analytic evaluations.
  For an $ell$-by-$ell$ evaluation matrix $G$, the singular values in decreasing order satisfy
  $sigma_(q_Z + 1) \( G \) lt.double_(ell \, Z) N^(- Z)$ when $q_Z < ell$.
  Choosing finitely many levels $Z$ and multiplying these bounds gives

$ \| det G \| lt.double_ell N^(- 3 / 4 \( 6 omega^3 \/ D \)^(1 \/ 3) ell^(4 \/ 3) + O \( ell \)) . $

Indeed the $j$th singular value may use $Z = \( 6 omega^3 j \/ D \)^(1 \/ 3) - O \( 1 \)$,
  and summing these levels gives the displayed exponent. The finitely many small indices for which this level is
  at most $D$ use the uniform $O \( 1 \)$ bound on the matrix entries and are absorbed in $O \( ell \)$.
  The neighborhoods are chosen for those finitely many levels.
  Thus no rate of convergence of $lambda$ to $lambda_0$ is needed.
  A compact parameter family of nonzero pulled-back germs, with the same analytic bounds and coefficient
  continuity, gives uniform constants by a finite cover; if their orders vary,
  use the largest order among the finitely many centers. Normalizing the original sections alone does not
  establish this nonvanishing condition on the pulled-back germs.

===== 12.4.2 The quintic equality case. <the-quintic-equality-case.>

The polynomial line curves of Section 9 also have a concrete interpretation here.
  If their first coordinates are linear in a rational parameter and their second coordinates polynomial, then

$ \( t - tau_i \)^2 divides n \( t \) - zeta_i wide \( 1 lt.eq i lt.eq 4 \) . $

The least possible degree of $n \( t \)$ is five. After normalizing two critical points to $0 \, 1$,
  Proposition 21 places these quintics in one fixed finite family.
  Here the splitting field is $bb(Q) \( zeta \)$ itself, of degree four.
  Integrality of a quintic value places its input in a fixed fractional lattice,
  with all embedding sizes $O \( N^(1 \/ 5) \)$. Counting the entire rank-four lattice already gives
  $O \( N^(4 \/ 5) \)$ exceptional inputs. The rational-value locus in Proposition 21 has dimension one,
  which improves this to $O \( N^(1 \/ 5) \)$. Both counts are global:
  the exceptional set is removed once before any box, prime partition or curve is selected.

===== 12.4.3 A box-incidence estimate. <a-box-incidence-estimate.>

The elementary box-incidence estimate can be stated in a concrete grid.
  Fix $C gt.eq 1$, $M > T gt.eq 1$, and grid bases $c = \( c_1 \, c_2 \, c_3 \) in bb(Z)^3$ with $\| c_i \| lt.eq
  C M$. Call a nonzero vector $v = \( v_0 \, v_1 \, v_2 \, v_3 \) in bb(Z)^4$ a witness for $c$ if

$ \| v_0 \| lt.eq T \, wide \| M v_i - c_i v_0 \| lt.eq T quad \( 1 lt.eq i lt.eq 3 \) . $

Then $v_0 eq.not 0$, since $v_0 = 0$ and $M > T$ would force every $v_i = 0$.
  Moreover $\| v_i \| lt.eq C \| v_0 \| + T \/ M lt.eq \( C + 1 \) \| v_0 \|$, so, with the maximum norm,
  $parallel v parallel_oo asymp_C \| v_0 \|$ and $parallel v parallel_oo lt.double_C T$.
  For fixed $v$, each $c_i$ has $O_C \( T \/ \| v_0 \| \)$ possible integer values. Consequently $v$ witnesses at most

$ O_C #scale(x: 120%, y: 120%)[\(] \( T \/ parallel v parallel_oo \)^3 #scale(x: 120%, y: 120%)[\)] $

grid boxes. These are original coordinate vectors; the residual vector
  $\( v_0 \, M v_1 - c_1 v_0 \, M v_2 - c_2 v_0 \, M v_3 - c_3 v_0 \)$ used in Proposition 17 is a different vector.

In the density proof, Proposition 17 counts boxes with its single prime approximation grid,
  and Theorem 8 handles adaptive auxiliary primes separately inside each transformed affine box.

The exact density follows from the general large-prime estimate and the finite sieve.
  The Euclidean factorization, level equation and Pell estimate use the explicit arithmetic of $T^4 + 1$.
  The analytic-relation estimate is conditional on its stated hypotheses.

== 13 The exact parameter certificate <app:certificate>

The following Python program uses only integer and rational arithmetic.
  It implements the prescription in Section 10, checks every parameter interval and the endpoint derivative
  inequalities, and verifies the stopping indices and gaps in Table 1.

#raw(block: true, lang: "", "from fractions import Fraction as F\nfrom math import comb\n\nK, G = 3000, 100000\n\ndef polynomials(d):\n    k = d - 2\n    for i in range(1, 500):\n        t = F(i, 50)\n        values = [sum(comb(d-r, j-s) * comb(k, j-1)\n                      * k**(j-1) * t**(j-s)\n                      for j in range(1, d))\n                  for r, s in [(0, 0), (1, 0), (1, 1)]]\n        yield (t, *values)\n\ndef upper(x, e):\n    assert 0 <= x < 1\n    l, r = 0, G\n    while r > l + 1:\n        middle = (l + r) // 2\n        if F(middle, G)**e > x:\n            r = middle\n        else:\n            l = middle\n    return F(r, G)\n\ndef check_derivatives():\n    for k in range(2, 7):\n        for t in [F(3, 20), F(5)]:\n            for a, b in [(1, 0), (0, 1), (1, 1)]:\n                for h in range(2, k+3):\n                    N = t * (1 + 1/t\n                        - F(h-1, h)*(k+1)/(k+t)\n                        - F(1, h)*(a+b)/(a+b*t))\n                    assert N >= 0\n                    assert N**h < (k+t)**(h-1)*(a+b*t)\n\ndef check_degree(d):\n    k, choices, least = d-2, list(polynomials(d)), F(1)\n    for z in range(K, 2*K):\n        etaL, etaH = F(z, K), F(z+1, K)\n        if etaL*(1-k*etaL/d) < F(2495, 10000):\n            return z, least\n        bL, bH = d-k*etaH, d-k*etaL\n        t, H, Ha, Hb = min(choices,\n            key=lambda row: (etaH+bH*row[0])**d/row[1])\n        w = upper(((d+1)*(etaH+bH*t)/d**2)**d/H, d-1)\n        assert (w**(d-2)*min(Ha, Hb)\n                > ((etaH+bH*t)/(d-1))**(d-1))\n        m = (d-1)*w\n        u, v = (etaH-m)/d, (bH-m)/d\n        assert 0 < m < 1 and min(etaL, bL) > m\n        assert min(u, v) > 0 and F(3, 20) <= v/u <= 5\n\n        def delta(h, D):\n            return upper((u*v)**h/((k*u+v)**(h-1)*D), h)\n\n        P = [delta(d, u+v)]\n        if d == 4 and z < 4000:\n            assert m+2*u < F(999, 1000)\n            P += [delta(3, v),\n                  max(delta(2, min(3*u, 2*v, u+v)),\n                      upper(u*u/3, 2))]\n        else:\n            P += [delta(h, min(u, v))\n                  for h in range(d-1, 1, -1)]\n        g = (d-1)*(k-1) + (d == 4)\n        P.append(max(u/2, min(u, v/g)))\n        gap = 1-m-sum(max(P[:h]) for h in range(1, d+1))\n        assert gap > F(1, 1000)\n        least = min(least, gap)\n    raise AssertionError('cutoff not reached')\n\ncheck_derivatives()\nassert [check_degree(d) for d in range(4, 9)] == [\n    (5124, F(191, 100000)), (4084, F(293, 50000)),\n    (3552, F(321, 2500)), (3226, F(23177, 100000)),\n    (3003, F(31683, 100000))]")

=== 13.1 The enlarged first quartic cell <app:quartic-extension>

The following additional exact checks verify the parameters used in Proposition 26.
  They use the functions #raw("upper") and #raw("F") from the program above.
  The fixed bidegree ratio is $t_(*) = 1 \/ 2$, for which $\( H \, H_a \, H_b \) = \( 10 \, 5 \, 10 \)$.
  In particular, no continuity argument or floating-point computation is needed for the small extension below $eta = 1$.

#raw(block: true, lang: "", "epsilon = F(1, 10**6)\netaL, etaH = 1-epsilon, F(3001, 3000)\nbL, bH = 4-2*etaH, 2+2*epsilon\nt, w = F(1, 2), F(24809, 100000)\nm = 3*w\nu, v = (etaH-m)/4, (bH-m)/4\nassert 0 < epsilon < F(1, 2)\nassert 0 < m < 1 and m < min(etaL, bL)\nassert w**3*10 > (F(5, 16)*(etaH+bH*t))**4\nassert w**2*5 > ((etaH+bH*t)/3)**3\nassert min(u, v) > 0 and F(3, 20) <= v/u <= 5\ndef quartic_delta(h, D):\n    return upper((u*v)**h/((2*u+v)**(h-1)*D), h)\nP = [quartic_delta(4, u+v), quartic_delta(3, v),\n     max(quartic_delta(2, min(3*u, 2*v, u+v)),\n         upper(u*u/3, 2)), max(u/2, min(u, v/4))]\nassert P == [F(4729, 100000), F(5097, 100000),\n             F(6899, 100000), F(76819, 1200000)]\ngap = 1-m-sum(max(P[:i]) for i in range(1, 5))\ntau = F(1, 50000)\nassert gap-4*tau == F(1941, 100000)\nassert 1-m-2*u-2*tau == F(15319, 120000)")

#bibliography("refs.bib", style: "ieee", title: [References])
