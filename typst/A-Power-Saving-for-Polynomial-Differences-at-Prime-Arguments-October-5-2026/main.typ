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

#align(center)[#text(size: 16pt, weight: "bold")[A Power Saving for Polynomial Differences \
at Prime Arguments]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A polynomial difference theorem asks how large a set of integers can be if the differences of its elements avoid a prescribed polynomial sequence. Restricting the polynomial’s argument to primes imposes an additional arithmetic condition: a root modulo a given modulus must be compatible with a prime residue class. We prove a power-saving bound when these local conditions hold at every modulus.

Write $bb(P)$ for the positive rational primes and $\[ N \] = { 1 \, dots.h \, N }$. An integer polynomial $h$ is #emph[prime-intersective] if, for every positive integer $q$, there is an integer $r$ with

$ \( r \, q \) = 1 \, #h(2em) h \( r \) equiv 0 med \( mod med q \) . $

For a set $A$ of integers, write $A - A = { a - b : a \, b in A }$.

#thm([Theorem 1.1.])[
  #emph[Let $h in bb(Z) \[ x \]$ be prime-intersective, of degree at least two and with positive leading coefficient. There exist constants $c_h > 0$ and $C_h gt.eq 1$ such that, for every positive integer $N$ and every $A subset.eq \[ N \]$, 
$ \( A - A \) ∩ { h \( p \) : p in bb(P) } subset.eq { 0 } quad arrow.r.double quad \| A \| lt.eq C_h N^(1 - c_h) . $

]
] <thm:main>

The convention at zero allows a prime root of $h$: a value $h \( p \) = 0$ places no restriction on $A$. All constants in the theorem depend only on the fixed polynomial. Increasing $C_h$ incorporates the finitely many small values of $N$.

=== 1.1 History and main ideas <history-and-main-ideas>

The starting point is the Furstenberg–Sárközy theorem: every subset of the integers with positive upper density contains two elements whose difference is a nonzero square. Furstenberg’s ergodic proof and Sárközy’s quantitative Fourier argument established this independently #cite(label("Furstenberg1977")) #cite(label("Sarkozy1978")). For a nonconstant integer polynomial, the unavoidable local condition is a root modulo every positive integer. Kamae and Mendès France’s difference theorem implies that this condition also suffices for density decay #cite(label("KamaeMendesFrance1978")). Lucier made the general polynomial theorem quantitative by organizing the iteration around compatible $p$-adic roots and a family of auxiliary polynomials #cite(label("Lucier2006")).

Much subsequent work sharpened the density bounds. For square differences, the double iteration of Pintz, Steiger, and Szemerédi #cite(label("PintzSteigerSzemeredi1988")) was improved by Bloom and Maynard #cite(label("BloomMaynard2022")), and Green and Sawhney obtained $N exp \( - c sqrt(log N) \)$ using an arithmetic level-$d$ inequality #cite(label("GreenSawhney2025")). Rice #cite(label("Rice2019")) and Arala #cite(label("Arala2024")) extended the earlier bounds to general intersective polynomials. Adajar and collaborators subsequently obtained $N exp \( - c_(h \, mu) \( log N \)^mu \)$ for every $0 < mu < 1 \/ 2$ #cite(label("AdajarEtAl2026")). These results concern unrestricted integer arguments. Restricting the argument to primes makes avoidance a weaker condition and introduces the unit-root requirement in our definition.

The prime problem already has a substantial history. Sárközy treated the shifts $p - 1$ and $p + 1$ #cite(label("Sarkozy1978III")). After successive improvements by Lucier, Ruzsa–Sanders, and Wang #cite(label("Lucier2008")) #cite(label("RuzsaSanders2008")) #cite(label("Wang2020")), Green proved a power saving for $p - 1$, noting that his argument also applies to $p + 1$ #cite(label("Green2024")) Theorem 1.1 and the following remarks. Thorner and Zaman made an admissible exponent explicit #cite(label("ThornerZaman2024")). For nonlinear polynomials, Li and Pan proved a quantitative result when $h \( 1 \) = 0$ #cite(label("LiPan2009")). Rice’s theorem covers every prime-intersective polynomial of degree $k gt.eq 2$, with

$ \| A \| lt.double_(h \, c) N \( log N \)^(- c) #h(2em) upright("for every ") c < frac(1, 2 k - 2) \, $

and gives a stronger bound for quadratics #cite(label("Rice2013")) Theorems 1 and 2. Rice also records Wierdl’s earlier qualitative characterization by the unit-root condition #cite(label("Rice2013")) Section 1.2. The auxiliary family used below, including its prime-argument restriction, already appears in #cite(label("Rice2013")) Section 2.1.

Our direct methodological predecessor is the companion #emph[A power saving for intersective polynomial differences with an exponent depending only on the degree] #cite(label("IntersectivePower")). We adapt its reflection-positive tuple laws, Fourier lifts, signed kernels, and contracting induction to prime arguments. In particular, the Fourier-lift moment estimate is reproduced with its proof below. The new requirements concern the compatibility of the tuple laws with unit residue classes and the realization of their pair correlations by a signed kernel supported on values at prime arguments. The example $h \( x \) = \( x - 1 \)^2$ gives a power saving when only the differences $\( p - 1 \)^2$ are forbidden; it therefore implies a power saving for sets avoiding all nonzero square differences as well.

Here is the mechanism. For each sufficiently large prime we construct a probability law on a fixed finite tuple of residue labels. A designated cycle of tuple positions has increments satisfying the congruence conditions imposed by prime arguments, apart from a component of very small mass. Reflection positivity means that the joint distribution across each prescribed cut of the tuple gives a positive semidefinite matrix. The cuts are chosen so that successive reflections can make all inputs agree. Repeated Cauchy–Schwarz inequalities then give a multilinear Hölder inequality and a seminorm. This is the classical chessboard method of reflection positivity #cite(label("FILS1978")) Theorem 4.1. For related Hölder inequalities and folding arguments in graph-norm theory, see #cite(label("Hatami2010")) #cite(label("ConlonLee2017")). We prove the form needed for our tuple laws directly.

We next lift an interval indicator to the product of these residue spaces by retaining its rational Fourier coefficients with bounded denominator. Averaging a product of copies of this lift over the tuple laws gives a nonnegative quantity that dominates a fixed power of the set’s density. To exploit avoidance, a signed weight on prime polynomial values is compared with a model kernel encoding the correlations of a cycle edge; their Fourier transforms are uniformly close. Major arcs match the local unit distributions; minor arcs are controlled by Vaughan’s identity and Weyl differencing #cite(label("Vaughan1980")) #cite(label("Vaughan1997")) #cite(label("Weyl1916")). Avoidance annihilates the prime-supported kernel on ordered pairs from the set. The resulting cancellation, together with the seminorm estimate for restriction to progressions, produces a contraction of the lifted quantity on shorter intervals. Induction turns that contraction into the claimed power saving.

The prime-distribution estimate used in the major arcs is derived from #cite(label("ZeroFree")) Theorem 1.1: every Dirichlet $L$-function, uniformly over all characters and moduli, has no zero in $Re s > 7 \/ 8$, with the principal pole at $s = 1$ allowed. This fixed half-plane is a theorem input from that companion, stronger than the classical zero-free regions near $Re s = 1$. We prove here its required consequence for primes in arithmetic progressions and all subsequent steps of the argument.

=== 1.2 Notation and organization <notation-and-organization>

Throughout the proof, $h$ is fixed, its degree is $k gt.eq 2$, and its leading coefficient is $a > 0$. Put $e \( x \) = exp \( 2 pi i x \)$. For $xi in bb(Q) \/ bb(Z)$, let $q \( xi \)$ be its reduced positive denominator, with $q \( 0 \) = 1$. Fourier coefficients use the negative sign in the exponential. Averages and norms on finite sets use uniform probability measure unless another measure is specified. Empty products have value one, and an empty product of spaces is a singleton.

Implicit constants and lower thresholds may depend on $h$ and on the structural parameters fixed in terms of $h$, but are uniform in the auxiliary parameter and residue classes introduced below. The notation $N^(o \( 1 \))$ denotes a quantity bounded by $C_epsilon.alt N^epsilon.alt$ for every $epsilon.alt > 0$, with this same uniformity.

Section 2 constructs the auxiliary polynomials and their admissible local values. Section 3 builds the reflection-positive tuple laws, and Section 4 develops their multilinear estimates and proves the Fourier-lift moment bound. Section 5 obtains the prime estimates from the stated zero-free input and elementary differencing. Section 6 matches the tuple multipliers with a kernel supported on prime polynomial values. Section 7 uses that comparison to contract a multilinear density quantity and proves Theorem 1.

== 2 Auxiliary polynomials and local admissibility <sec:local>

Throughout this section, $h in bb(Z) \[ x \]$ is prime-intersective, of degree $k gt.eq 2$ and leading coefficient $a > 0$. Restricting a set to an arithmetic progression changes the polynomial describing its forbidden differences. We first choose progression steps for which the transformed polynomials belong to a common auxiliary family. We then select local polynomial values whose arguments satisfy the unit condition required of primes. These values will supply the increments of the residue-label cycles used later.

=== 2.1 A family compatible with progression restriction <a-family-compatible-with-progression-restriction>

We use the auxiliary-polynomial construction of Lucier #cite(label("Lucier2006")) in its prime-intersective form in Rice #cite(label("Rice2013")) Section 2.1. For every prime $p$, prime-intersectivity gives a root of $h$ in $bb(Z)_p^times$, the units of the $p$-adic integers. Indeed, the unit roots modulo $p^j$ form a finitely branching tree under reduction, with vertices at every depth. Successively choosing a vertex that has descendants at arbitrarily large depths gives a compatible sequence of roots. Fix its limit $frak(z)_p in bb(Z)_p^times$, and write

#[#set math.equation(numbering: n => "(2.1)")
 $ h \( frak(z)_p + X \) = sum_(j = m_p)^k b_(j \, p) X^j \, #h(2em) b_(m_p \, p) eq.not 0 \, #h(2em) 1 lt.eq m_p lt.eq k . $ <eq:root-expansion>]

The coefficients lie in $bb(Z)_p$. Define a completely multiplicative function $lambda : bb(N) arrow.r bb(N)$ by $lambda \( p \) = p^(m_p)$. For $l gt.eq 1$, the Chinese remainder theorem specifies a unique integer $r_l in \( - l \, 0 \]$ satisfying

$ r_l equiv frak(z)_p med \( mod med p^(v_p \( l \)) \) #h(2em) \( p divides l \) . $

Here $v_p$ denotes the $p$-adic valuation. In particular $\( r_l \, l \) = 1$; for $l = 1$ the convention is $r_1 = 0$. Put

#[#set math.equation(numbering: n => "(2.2)")
 $ T_l \( x \) = r_l + l x \, #h(2em) h_l \( x \) = frac(h \( T_l \( x \) \), lambda \( l \)) \, #h(2em) a_l = frac(a l^k, lambda \( l \)) . $ <eq:auxiliary-definition>]

#thm([Lemma 2.1.])[
  (Auxiliary family).  #emph[For every $l gt.eq 1$, the polynomial $h_l$ belongs to $bb(Z) \[ x \]$, has degree $k$ and positive leading coefficient $a_l$, and all its coefficients are $O_h \( a_l \)$. We have $h_1 = h$ and $T_1 \( x \) = x$. For every $D gt.eq 1$, there is an integer $i in { 0 \, dots.h \, D - 1 }$ such that 
#[#set math.equation(numbering: n => "(2.3)")
 $ T_l \( D x - i \) & = T_(l D) \( x \) \,\
h_l \( D x - i \) & = lambda \( D \) h_(l D) \( x \) \, #h(2em) D divides lambda \( D \) \, quad lambda \( D \) lt.eq D^k . $ <eq:auxiliary-change>]

 Moreover, $b_(m_p \, p)$ is a $p$-adic unit for all sufficiently large $p$, with a threshold depending only on $h$.]
] <lem:auxiliary>

#proof[
  To check integrality at $p divides l$, write $u = v_p \( l \)$ and make the affine change of variable
  $ Y = frac(r_l - frak(z)_p, p^u) + l / p^u x . $
  Its coefficients lie in $bb(Z)_p$, and its slope is a unit. Since $v_p \( lambda \( l \) \) = u m_p$, (2.1) gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ h_l \( x \) = (frac(lambda \( l \), p^(u m_p)))^(- 1) sum_(j = m_p)^k b_(j \, p) p^(u \( j - m_p \)) Y^j . $ <eq:auxiliary-padic>]
  Thus $h_l$ is integral at $p$. If $p divides.not l$, its denominator $lambda \( l \)$ is a $p$-adic unit, so integrality is immediate. This proves $h_l in bb(Z) \[ x \]$. Its leading coefficient is $a_l$, and expanding $h \( r_l + l x \)$ with $\| r_l \| < l$ bounds each coefficient by $O_h \( l^k \/ lambda \( l \) \) = O_h \( a_l \)$.
  The residues $r_l$ and $r_(l D)$ agree modulo $l$. Their specified ranges therefore give $r_(l D) = r_l - i l$ for some $0 lt.eq i < D$. Substitution and complete multiplicativity prove (2.3); its last two assertions follow from $1 lt.eq m_p lt.eq k$.
  For the final assertion, factor $h = c product_i g_i^(d_i)$ over $bb(Z) \[ x \]$, where $c eq.not 0$ is an integer and the $g_i$ are distinct primitive irreducible nonconstant polynomials. Exclude primes dividing $c$ or the nonzero integer right-hand sides of cleared Bézout identities for $g_i \, g_j$ with $i eq.not j$, and for $g_i \, g'_i$. At a root $frak(z)_p$ for any remaining prime, exactly one factor $g_i$ vanishes, its derivative is a unit, and all the other factors have unit values. Consequently $m_p = d_i$, and the coefficient of $X^(m_p)$ in (2.1) is a unit. ◻
]

Define the forbidden values at parameter $l$ by

#[#set math.equation(numbering: n => "(2.5)")
 $ cal(D)_l = { h_l \( m \) : m in bb(Z) \, med m gt.eq 1 \, med T_l \( m \) upright(" is prime") } . $ <eq:forbidden-family>]

A set $A subset.eq \[ N \]$ is #emph[avoiding at $l$] if $\( A - A \) ∩ cal(D)_l subset.eq { 0 }$. This condition passes to progression coordinates: for every $D \, n gt.eq 1$ and every integer $c$, the set

$ A' = { x in \[ n \] : lambda \( D \) x + c in A } $

is avoiding at $l D$ whenever $A$ is avoiding at $l$. In fact, a nonzero difference $h_(l D) \( m \)$ in $A'$ would give the nonzero difference $lambda \( D \) h_(l D) \( m \) = h_l \( D m - i \)$ in $A$. Formula (2.3) preserves its prime argument, and $D m - i gt.eq 1$ for $m gt.eq 1$. This also explains why no restriction at a zero polynomial value is needed.

=== 2.2 Uniform cancellation at large primes <uniform-cancellation-at-large-primes>

We next estimate exponential sums over arguments $x$ satisfying $p divides.not T_l \( x \)$, and over the subset on which $h'_l \( x \)$ is nonzero modulo $p$. Besides controlling local Fourier coefficients, the latter estimates will produce zero-sum lists of polynomial values: we seek one length $L$, independent of $l$ and $p$, for which $L$ selected values sum to zero in each local residue ring. At large primes cancellation supplies these lists; at the finitely many smaller primes we will repeat a single value. The selected values must also come from argument classes on which values lift uniformly to higher prime powers.

Fix

#[#set math.equation(numbering: n => "(2.6)")
 $ delta = frac(1, 100 k 2^k) \, #h(2em) gamma = delta / 10 . $ <eq:local-exponents>]

For the remainder of this section, $l gt.eq 1$ is arbitrary and $F = h_l$. At all sufficiently large primes, $F med mod med p$ is nonconstant, uniformly in $l$. For $p divides.not l$, this follows from $p divides.not a$ and (2.2); for $p divides l$, formula (2.4) reduces to a unit multiple of $Y^(m_p)$. When $p > k$, it follows that $F' med mod med p$ is not identically zero. Call an argument $x in bb(F)_p$ #emph[allowed regular] if

$ p divides.not T_l \( x \) #h(2em) upright("and") #h(2em) F' \( x \) eq.not 0 med \( mod med p \) . $

The unit condition excludes at most one residue: if $p divides l$, it excludes none because $\( r_l \, l \) = 1$.

#thm([Lemma 2.2.])[
  (Local exponential sums).  #emph[There is an integer $P_1 > max \( k \, 2 \)$, depending only on $h$, such that for every $l gt.eq 1$ and every prime $p gt.eq P_1$, at least $p \/ 2$ arguments in $bb(F)_p$ are allowed regular. For every integer $v$ with $p divides.not v$, 
#[#set math.equation(numbering: n => "(2.7)")
 $ lr(|bb(E)_(x med mod med p^j\
p divides.not T_l \( x \)) e (frac(v F \( x \), p^j))|) & lt.eq p^(- 8 delta j) #h(2em) \( j gt.eq 1 \) \,\
lr(|bb(E)_(x med mod med p\
x upright(" allowed regular")) e (frac(v F \( x \), p))|) & lt.eq p^(- 4 delta) . $ <eq:local-sums>]

 Each expectation is normalized by the number of arguments in its stated averaging set.]
] <lem:local-sums>

#proof[
  Take the threshold large enough for the preceding nonconstancy statements. The derivative excludes at most $k - 1$ residues, so at most $k$ arguments fail to be allowed regular. This gives the asserted cardinality after increasing the threshold.
  We first work modulo $p$. If $k'$ is the degree of $F med mod med p$, then the complete mean $S = bb(E)_(x med mod med p) e \( v F \( x \) \/ p \)$ vanishes when $k' = 1$. For $k' gt.eq 2$, repeated differencing gives
  $ \| S \|^(2^(k' - 1)) lt.eq bb(E)_(u_1 \, dots.h \, u_(k' - 1) med mod med p) lr(|bb(E)_(x med mod med p) e (frac(v Delta_(u_1) dots.h.c Delta_(u_(k' - 1)) F \( x \), p))|) lt.eq frac(k' - 1, p) \, $
  where $Delta_u F \( x \) = F \( x + u \) - F \( x \)$. The first inequality follows by squaring, grouping the two arguments by their difference, and iterating the triangle and Cauchy–Schwarz inequalities. For the second, the final phase is linear, with nonzero coefficient unless one of the $u_i$ is zero: its coefficient is $v k' !$ times the leading coefficient of $F med mod med p$ times $u_1 dots.h.c u_(k' - 1)$. A union bound gives the displayed probability. Removing at most $k$ arguments changes a normalized mean by $O_k \( p^(- 1) \)$. Since $8 delta < 2^(- \( k - 1 \))$, this proves both assertions of (2.7) at conductor $p$, for sufficiently large $p$.
  For $j gt.eq 2$, set $n = floor.l j \/ 2 floor.r$ and write $x = x_0 + p^(j - n) y$, with $x_0$ modulo $p^(j - n)$ and $y$ modulo $p^n$. Taylor expansion over the integers gives
  $ F \( x_0 + p^(j - n) y \) equiv F \( x_0 \) + p^(j - n) y F' \( x_0 \) med \( mod med p^j \) . $
  The condition $p divides.not T_l \( x \)$ depends only on $x_0$. Averaging over $y$ therefore annihilates every term for which $p^n divides.not F' \( x_0 \)$. We bound the proportion of the remaining $x_0$ by interpolation.
  Put $b = ceil.l n \/ \( k - 1 \) ceil.r$. The solutions of $F' \( x_0 \) equiv 0 med \( mod med p^n \)$ occupy at most $k - 1$ residue classes modulo $p^b$. Otherwise, choose $k$ integer solutions $x_1 \, dots.h \, x_k$ in distinct such classes. In the Lagrange interpolation formula for the degree-at-most-$\( k - 1 \)$ polynomial $F'$, every denominator $product_(s eq.not r) \( x_r - x_s \)$ has valuation at most
  $ \( k - 1 \) \( b - 1 \) < n . $
  Since every $F' \( x_r \)$ is divisible by $p^n$, each interpolating summand has all coefficients divisible by $p$. This contradicts $F' equiv.not 0 med \( mod med p \)$.
  Since $b lt.eq n lt.eq j - n$, the class count applies to the full range of $x_0$ modulo $p^(j - n)$. The unit condition retains at least a proportion $1 \/ 2$ of all arguments. Consequently the conditional proportion that can survive $y$-averaging is at most
  $ 2 \( k - 1 \) p^(- b) lt.eq 2 \( k - 1 \) p^(- j \/ \( 3 \( k - 1 \) \)) \, $
  where $floor.l j \/ 2 floor.r gt.eq j \/ 3$ for $j gt.eq 2$. Because $8 delta < 1 \/ \( 3 \( k - 1 \) \)$, one further increase of $P_1$ makes this at most $p^(- 8 delta j)$ for every $j gt.eq 2$. All thresholds were independent of $l$. ◻
]

=== 2.3 Small primes and uniform lifting <small-primes-and-uniform-lifting>

The preceding cancellation estimate will be used only for $p gt.eq P_1$. For the finitely many smaller primes, we instead select a residue class on which polynomial values lift uniformly. The crucial point is that its modulus can be fixed independently of $l$.

#thm([Lemma 2.3.])[
  (Uniform lifting classes).  #emph[For every prime $p < P_1$, there is an integer $S_p gt.eq 0$, depending only on $h$ and $p$, such that, for every $l gt.eq 1$, some integer $x$ satisfies 
#[#set math.equation(numbering: n => "(2.8)")
 $ p divides.not T_l \( x \) \, #h(2em) v_p \( h'_l \( x \) \) lt.eq S_p . $ <eq:small-prime-argument>]

 Set 
#[#set math.equation(numbering: n => "(2.9)")
 $ E_p = 2 S_p + 1 quad \( p < P_1 \) \, #h(2em) E_p = 1 quad \( p gt.eq P_1 \) . $ <eq:local-modulus-exponents>]

 For any prime $p$, let $x$ be an integer satisfying (2.8) when $p < P_1$, or representing an allowed regular argument when $p gt.eq P_1$. Write $s = v_p \( h'_l \( x \) \)$. Every integer in the class $x med \( mod med p^(E_p - s) \)$ satisfies the unit condition, and its $h_l$-value is congruent to $h_l \( x \)$ modulo $p^(E_p)$. For each $j > E_p$, the uniform distribution on this argument class modulo $p^j$ pushes forward under $h_l$ to the uniform distribution on 
$ { y med mod med p^j : y equiv h_l \( x \) med \( mod med p^(E_p) \) } . $

]
] <lem:local-lifting>

#proof[
  Fix $p < P_1$. For a nonconstant polynomial over $bb(Z)_p$, the minimum valuation of its nonconstant coefficients is preserved by an affine substitution of unit slope. One inequality follows by expanding the substitution, and the other by applying its inverse. If $p divides.not l$, this observation applied to (2.2) bounds that minimum for $F = h_l$ by a constant depending only on $h \, p$. If $p divides l$, use (2.4): before the unit affine substitution, its degree-$m_p$ coefficient is a unit multiple of $b_(m_p \, p)$, whose valuation is fixed. The same uniform bound therefore holds in this case. Differentiation increases the minimum valuation by at most $max_(1 lt.eq j lt.eq k) v_p \( j \)$, so the minimum coefficient valuation of $F'$ has a uniform upper bound $C_p gt.eq 0$, which we take to be an integer.
  There are at least $k$ distinct integers in $\[ 1 \, k p \]$ satisfying $p divides.not T_l \( x \)$. Interpolate $F'$, of degree at most $k - 1$, at any $k$ of them. The interpolation denominators are products of differences of integers in this fixed interval. Let $B_p gt.eq 0$ be a uniform integer upper bound for their $p$-adic valuations. If all $k$ values of $F'$ had valuation greater than $C_p + B_p$, Lagrange interpolation would force every coefficient of $F'$ to have valuation greater than $C_p$, a contradiction. Thus (2.8) holds with $S_p = C_p + B_p$.
  Now let $p$ be arbitrary and $x \, s$ be as in the statement. In either case $E_p gt.eq 2 s + 1$. Taylor expansion with integer coefficients gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ F \( x + p^(E_p - s) y \) = F \( x \) + p^(E_p) #scale(x: 120%, y: 120%)[\(] c_1 y + p C \( y \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) p divides.not c_1 \, quad C in bb(Z) \[ y \] . $ <eq:local-permutation>]
  Indeed $c_1 = p^(- s) F' \( x \)$, and each term of degree at least two contains, after division by $p^(E_p)$, a factor $p^(E_p - 2 s)$. The polynomial $G \( y \) = c_1 y + p C \( y \)$ permutes the residues modulo every power of $p$: for integers $y \, z$, the quotient $\( G \( y \) - G \( z \) \) \/ \( y - z \)$ is a unit when $y eq.not z$, so
  $ v_p \( G \( y \) - G \( z \) \) = v_p \( y - z \) . $
  It follows that $G$ is injective, hence bijective, on every finite residue ring. Formula (2.10) proves constancy modulo $p^(E_p)$. The argument class preserves the unit condition because $E_p - s gt.eq 1$.
  Finally, uniform arguments in this class modulo $p^j$ correspond to uniform $y$ modulo $p^(j - E_p + s)$. Each residue of $y$ modulo $p^(j - E_p)$ occurs exactly $p^s$ times. Applying the permutation $G$ modulo $p^(j - E_p)$ therefore gives precisely the asserted uniform distribution of polynomial values. ◻
]

Call a residue modulo $p^(E_p)$ #emph[admissible at $l$] if it equals $h_l \( x \)$ for an argument satisfying (2.8) when $p < P_1$, or for an allowed regular argument when $p gt.eq P_1$. The equality is taken modulo $p^(E_p)$. Thus every admissible residue has an argument class satisfying the unit condition and the uniform lifting property of Lemma 4. For a modulus that is a product of distinct factors $p^(E_p)$, admissibility means admissibility at every factor.

#thm([Lemma 2.4.])[
  (A fixed admissible cycle length).  #emph[Fix an integer $L > 2$ such that 
#[#set math.equation(numbering: n => "(2.11)")
 $ 4 delta L > 2 \, #h(2em) p^(E_p) divides L quad \( p < P_1 \) . $ <eq:cycle-length>]

 For every $l gt.eq 1$ and every prime $p$, there are $L$ admissible residues $y_0 \, dots.h \, y_(L - 1)$ modulo $p^(E_p)$, with repetitions allowed, such that 
$ y_0 + dots.h.c + y_(L - 1) = 0 med \( mod med p^(E_p) \) . $

]
] <lem:admissible-cycle>

#proof[
  For $p < P_1$, an admissible residue exists by Lemma 4. Repeat it $L$ times and use $p^(E_p) divides L$. For $p gt.eq P_1$, take independent uniform allowed regular arguments $x_0 \, dots.h \, x_(L - 1)$ modulo $p$. Character orthogonality and (2.7) give
  $ lr(|p thin bb(P) (sum_(j = 0)^(L - 1) F \( x_j \) = 0 med \( mod med p \)) - 1|) lt.eq \( p - 1 \) p^(- 4 delta L) < 1 . $
  The probability is therefore positive, yielding the required sequence of admissible values. ◻
]

The terminology refers to the residue labels $z_0 = 0$ and $z_j = y_0 + dots.h.c + y_(j - 1)$ for $1 lt.eq j lt.eq L$: we have $z_L = z_0$, and the increment on the indexed edge $j arrow.r j + 1$ is the admissible value $y_j$. Distinct indices need not carry distinct residue labels.

We now keep $P_1$, the exponents $E_p$, and $L$ fixed. For any later threshold $P > P_1$, apply Lemma 5 at each $p < P$ and combine the lists by the Chinese remainder theorem. This gives $L$ admissible residues modulo $product_(p < P) p^(E_p)$ with sum zero. Thus a larger prime cutoff never requires a new cycle length.

== 3 Reflection-positive laws on residue tuples <sec:tuples>

We now construct a probability law on finitely many residue labels at each large prime. The law must serve two purposes: reflection positivity will give a multilinear Hölder inequality, while a designated cycle of labels will have admissible increments except on a small part of the measure. We adapt the reflection-positive construction of #cite(label("IntersectivePower")) Section 3, imposing the allowed regular argument condition from the preceding section. The proof below includes the positivity argument, since the small exceptional measure and the uniformity in the auxiliary index $l$ are both needed later.

=== 3.1 Slots, reflections, and the required properties <slots-reflections-and-the-required-properties>

Keep $L$ from Lemma 5 and the exponents $delta$, $gamma = delta \/ 10$ from (2.6) fixed. Choose an integer $t gt.eq 1$ such that $\( t + 1 \) delta \/ 2 > 5$, and set

$ w = 2 t + 1 \, #h(2em) K = L ! \, #h(2em) r_(*) = K \/ 2 . $

Let $Pi$ be the set of permutation words of length $L$: a word is a bijection from the positions $\[ L \]$ to the symbols $\[ L \]$. The slots of our tuple are

$ V = Pi^w \, #h(2em) d = \| V \| = K^w . $

The entries of a slot are called its blocks. Fix an $L$-cycle $c$ on the positions. Composition $pi c$ therefore permutes the positions of a word $pi$. Identifying $c^j$ itself with a word, fix the distinct slots

$ v_j = \( c^j \, dots.h \, c^j \) quad \( 0 lt.eq j < L \) \, #h(2em) v_L = v_0 . $

These slots, in this order, form the designated cycle.

A #emph[cut] is specified by a block $b in \[ w \]$ and an ordered pair of distinct symbols $alpha \, beta$. Its plus side $V_(+)$ consists of slots in whose $b$th word $alpha$ precedes $beta$; its minus side is $V_(-) = V \\ V_(+)$. The involution $theta$ exchanges these two symbols in block $b$ and fixes all other blocks. Thus $\| V_(+) \| = \| V_(-) \| = d \/ 2$, and $theta$ identifies the two halves. For a measure $nu$ on $bb(F)_p^V$, the matrix of masses across this cut has rows and columns indexed by $a \, a' in bb(F)_p^(V_(+))$ and entry

$ nu { z_v = a_v \, z_(theta v) = a'_v upright(" for every ") v in V_(+) } . $

We call $nu$ #emph[reflection positive] if every such matrix is symmetric positive semidefinite. Equivalently, each matrix is symmetric and

$ integral J \( \( z_v \)_(v in V_(+)) \) J \( \( z_(theta v) \)_(v in V_(+)) \) thin d nu \( z \) gt.eq 0 $

for every real function $J$ on $bb(F)_p^(V_(+))$.

#thm([Proposition 3.1.])[
  (Tuple laws).  #emph[There is a threshold $P > P_1$, depending only on $h$, with the following property. For every $l gt.eq 1$ and prime $p gt.eq P$, there are a probability measure $mu_(l \, p)$ on $bb(F)_p^V$ and a submeasure $0 lt.eq epsilon_(l \, p) lt.eq mu_(l \, p)$ such that:]
  + #emph[$mu_(l \, p)$ is reflection positive. Both $mu_(l \, p)$ and $epsilon_(l \, p)$ are invariant under simultaneous translation of all labels. In particular, any nonzero one of these measures, or their difference, has uniform single-slot marginals after normalization.]
  + #emph[Writing 
$ eta_(l \, p) = epsilon_(l \, p) \( 1 \) \, #h(2em) mu_(l \, p)^compose = frac(mu_(l \, p) - epsilon_(l \, p), 1 - eta_(l \, p)) \, $

 we have $eta_(l \, p) lt.eq p^(- 4)$. Under $mu_(l \, p)^compose$ every increment $z_(v_(j + 1)) - z_(v_j)$, $0 lt.eq j < L$, is admissible at $l$.]
  + #emph[For any integer $D gt.eq 1$ with $p divides.not D$ and any $a' in bb(F)_p$, let $A_(D \, a')$ act on all labels by $z_v mapsto lambda \( D \)^(- 1) \( z_v - a' \)$. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ \( A_(D \, a') \)_(*) mu_(l \, p) = mu_(l D \, p) \, #h(2em) \( A_(D \, a') \)_(*) epsilon_(l \, p) = epsilon_(l D \, p) . $ <eq:tuple-covariance>]

]
  + #emph[For $rho_p = mu_(l \, p)$ or $mu_(l \, p)^compose$, every $v in V$, and every $f : bb(F)_p arrow.r bb(C)$ of uniform mean zero, 
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥bb(E)_(rho_p) #scale(x: 120%, y: 120%)[\[] f \( z_v \) divides \( z_u \)_(u eq.not v) #scale(x: 120%, y: 120%)[\]]∥_(L^2 \( rho_p \)) lt.eq p^(- gamma) parallel f parallel_(L^2 \( bb(F)_p \)) . $ <eq:tuple-mixing>]

]
  #emph[All thresholds and constants are independent of $l$.]
] <prop:tuple-laws>

The construction starts from independent labels weighted by admissible increments. Such a law has the cycle property and the required mixing, but need not be reflection positive. We add components in which selected blocks are forgotten when labels are assigned. For cuts in those blocks, reflected slots share a list of labels. We choose bounded interactions between their selection indices so that the cut quadratic form controls the mean square of its test function. This lower bound will dominate the possible negative contribution from the preceding component. The last components need no cycle constraints, and form the exceptional submeasure.

=== 3.2 Two estimates for weighted graphs <two-estimates-for-weighted-graphs>

Fix $l$ and $p gt.eq P_1$, and write $F = h_l$. Define

#[#set math.equation(numbering: n => "(3.3)")
 $ W \( y \) = 1 / k \# { x in bb(F)_p : F \( x \) = y \, x upright(" allowed regular") } \, #h(2em) c_p = bb(E)_(y in bb(F)_p) W \( y \) . $ <eq:tuple-edge-weight>]

Since $F med mod med p$ is nonconstant of degree at most $k$, we have $0 lt.eq W lt.eq 1$ and $c_p gt.eq 1 \/ \( 2 k \)$. Lemma 3 for allowed regular arguments gives, with negative-sign Fourier coefficients,

#[#set math.equation(numbering: n => "(3.4)")
 $ \| hat(W) \( a \) \| lt.eq p^(- 4 delta) #h(2em) \( a in bb(F)_p \\ { 0 } \) . $ <eq:tuple-edge-fourier>]

Indeed $hat(W) \( a \)$ is the normalized mean over allowed regular arguments multiplied by their proportion divided by $k$.

#thm([Lemma 3.2.])[
  (Weighted graph estimates).  #emph[Let $G$ be a fixed finite directed graph with no loops and with at most one edge on each unordered pair of vertices. Give its vertices independent uniform labels $Y_x in bb(F)_p$, and put 
$ I_G \( Y \) = product_(x arrow.r y in E \( G \)) W \( Y_y - Y_x \) \, #h(2em) e_G = \| E \( G \) \| . $

 Then 
#[#set math.equation(numbering: n => "(3.5)")
 $ bb(E) I_G = c_p^(e_G) + O_G \( p^(- 4 delta) \) . $ <eq:tuple-graph-mean>]

 If the vertices are partitioned into two classes and every edge joins different classes, regard $I_G$ as a kernel between their uniform label spaces. Its associated operator satisfies 
#[#set math.equation(numbering: n => "(3.6)")
 $ parallel I_G - c_p^(e_G) parallel_(L^2 arrow.r L^2) = O_G \( p^(- delta) \) . $ <eq:tuple-graph-operator>]

 Both bounds are uniform in $l$.]
] <lem:graph-estimates>

#proof[
  The convolution kernel $W \( y - x \) - c_p$ has $L^2$ operator norm at most $p^(- 4 delta)$ by (3.4). Telescope the product $I_G$ by replacing one edge weight at a time by $c_p$. In a resulting term, hold fixed all labels except those at the endpoints $x \, y$ of the edge being replaced. As there is no second edge on this pair, the other factors depending on these two labels separate as $a \( Y_x \) b \( Y_y \)$, with $\| a \| \, \| b \| lt.eq 1$. The convolution bound controls the conditional average by $p^(- 4 delta)$. Summing over the edges proves (3.5).
  For the second assertion write $A \, B$ for the label spaces of these two classes and $D \( a \, b \) = I_G \( a \, b \) - c_p^(e_G)$. In uniform $L^2$ spaces, the fourth Schatten moment of its operator $T_D$ is
  $ "tr" #scale(x: 120%, y: 120%)[\(] \( T_D T_D^(*) \)^2 #scale(x: 120%, y: 120%)[\)] = bb(E)_(a \, a' in A\
b \, b' in B) D \( a \, b \) D \( a' \, b \) D \( a' \, b' \) D \( a \, b' \) . $
  All kernels here are real. Expand the four differences. Each term is the graph average of the selected copies of $I_G$, times the corresponding power of $- c_p^(e_G)$. Its formal vertices consist of two separate copies of each of the two vertex classes. No pair of formal vertices receives two edges: it determines one corner of the rectangle and one edge of $G$. Thus (3.5) applies to every term. Replacing all its edge weights by $c_p$ makes the expanded sum zero, so the fourth moment is $O_G \( p^(- 4 delta) \)$. The fourth power of the largest singular value is at most this moment, proving (3.6). ◻
]

=== 3.3 Components obtained by forgetting blocks <components-obtained-by-forgetting-blocks>

For $S subset.eq \[ w \]$ with $s = \| S \| lt.eq t + 1$, call the blocks in $S$ marked. For $v in V$, its #emph[address] $u_S \( v \)$ is the tuple of its words in the unmarked blocks; the address set is $U_S = Pi^(\[ w \] \\ S)$. At every address $u$ take a list

$ \( Y_(u \, 1) \, dots.h \, Y_(u \, ell_s) \) \, #h(2em) ell_s = r_(*)^s \, $

with all entries independent and uniform in $bb(F)_p$, independently over the addresses as well. A slot of address $u$ will choose one of the labels in this list.

For $s lt.eq t$ put a directed edge $u arrow.r u'$ between addresses whenever

#[#set math.equation(numbering: n => "(3.7)")
 $ u'_b = u_b c quad upright("in at least ") t + 1 upright(" unmarked blocks ") b . $ <eq:tuple-address-edge>]

Every entry of the first list is joined to every entry of the second, with weight

$ I_S \( Y \) = product_(u arrow.r u') product_(i \, i' in \[ ell_s \]) W \( Y_(u' \, i') - Y_(u \, i) \) . $

There are no loops, since $c eq.not 1$. There are also no opposite edges: because $c^2 eq.not 1$, the witnessing blocks for $u arrow.r u'$ and for $u' arrow.r u$ would be disjoint, requiring $2 t + 2 > w$ blocks. Consequently the graph on individual list entries satisfies Lemma 7. For $s = t + 1$ define $I_S = 1$; these are precisely the components in which we will dispense with the cycle constraints.

Independently select indices $j_v in \[ ell_s \]$ uniformly at all slots. To obtain the mean-square lower bound when the cut block is marked, we put a positive interaction on some pairs of these indices. Let $Delta = 1 \/ \( 10 L^2 \)$. For distinct slots $x \, y$, set $H_(x y)^S = Delta^g$ if they agree except in one marked block and the words in that block differ by exchanging symbols at positions of distance $g$. In all other cases set $H_(x y)^S = 0$, and also set $H_(x x)^S = 0$. Define

#[#set math.equation(numbering: n => "(3.8)")
 $ R_S \( j \) & = exp (sum_({ x \, y } subset.eq V) H_(x y)^S upright(bold(1))_({ j_x = j_y })) \,\
nu_S \( Phi \) & = bb(E)_(Y \, j) I_S \( Y \) R_S \( j \) thin Phi #scale(x: 120%, y: 120%)[\(] \( Y_(u_S \( v \) \, j_v) \)_(v in V) #scale(x: 120%, y: 120%)[\)] . $ <eq:tuple-index-weight>]

The sum in (3.8) is over unordered two-element subsets. Each $nu_S$ is a finite nonnegative measure, with mass bounded above by a fixed constant: $I_S lt.eq 1$ and $1 lt.eq R_S lt.eq C$ for a constant depending only on the fixed slot set.

Every component is invariant under each reflection $theta$. To see this, exchanging two symbols throughout one block preserves all transposition distances used in $H^S$. For an unmarked block, the same symbol exchange permutes addresses and preserves (3.7), since symbol permutations commute with the right action of $c$ on positions. For a marked block, addresses are unchanged. The uniform lists and indices are preserved in either case. Thus the cut matrices of $nu_S$ are symmetric. Their positivity is the remaining issue.

=== 3.4 Positive contributions and their comparison <positive-contributions-and-their-comparison>

Fix a cut in block $b$, and for a real function $J$ of the plus labels write its quadratic form as

$ Q_S \( J \) = integral J \( \( z_v \)_(v in V_(+)) \) J \( \( z_(theta v) \)_(v in V_(+)) \) thin d nu_S \( z \) . $

We first prove that marking $b$ gives a strictly positive lower bound. We then compare that lower bound with the possible negative contribution when $b$ is unmarked. These two estimates explain both the list lengths $ell_s$ and the coefficients in the final mixture.

Suppose first that $b in S$. The matrix of interactions across the cut, indexed by $x \, y in V_(+)$, is

$ sans(A)_(x y) = H_(x \, theta y)^S . $

It is symmetric by reflection invariance. If the two cut symbols in slot $x$ occupy positions of distance $g$, then $sans(A)_(x x) = Delta^g$. Any other transposition taking $x$ across the cut must move one cut symbol past the other, leaving the latter fixed. It therefore exchanges positions at distance at least $g + 1$. Only a transposition in block $b$ can do this. There are fewer than $L^2$ choices, whence

$ sum_(y eq.not x) \| sans(A)_(x y) \| lt.eq L^2 Delta^(g + 1) = 1 / 10 Delta^g . $

By diagonal dominance, $sans(A) succ.curly.eq kappa "Id"$ with the fixed choice $kappa = \( 9 \/ 10 \) Delta^(L - 1) > 0$.

Here is why this positivity for interactions gives strict positivity for the whole index kernel. Identify minus indices with plus indices using $theta$, and let $j \, j'$ be two half-index assignments. Put

$ u \( j \) = \( upright(bold(1))_({ j_x = i }) \)_(x in V_(+) \, med i in \[ ell_s \]) . $

The cross factor of $R_S$ is the matrix with entries

$ C \( j \, j' \) = exp #scale(x: 120%, y: 120%)[\(] u \( j \)^T \( sans(A) ⊗ "Id" \) u \( j' \) #scale(x: 120%, y: 120%)[\)] . $

Split $sans(A)$ as $kappa "Id"$ plus a positive semidefinite matrix. The entrywise exponential of a positive semidefinite Gram matrix is positive semidefinite: expand its power series and apply the Schur product theorem to each power. The factor from $sans(A) - kappa "Id"$ therefore is positive semidefinite and has diagonal entries at least one. The factor from $kappa "Id"$ is the tensor product, over $x in V_(+)$, of

$ upright(bold(1)) upright(bold(1))^T + \( e^kappa - 1 \) "Id" . $

It dominates $\( e^kappa - 1 \)^(d \/ 2) "Id"$. Taking its Schur product with the other factor preserves this lower bound, since the Schur product with the identity is the diagonal of that factor. The internal interactions in the two halves multiply this matrix on the left and right by the same diagonal matrix with entries at least one, so the lower bound is still valid.

Reflected slots have the same address when $b in S$. For fixed lists $Y$, the two factors involving $J$ consequently evaluate the same vector indexed by half-index assignments. There are $n_s = ell_s^(d \/ 2)$ such assignments. The uniform average over both halves is $n_s^(- 2)$ times the associated quadratic form; its diagonal lower bound is thus $\( e^kappa - 1 \)^(d \/ 2) n_s^(- 1)$ times the uniform average of the squares. Since there are only finitely many possible $s$, we obtain a fixed $c_(*) > 0$ such that

#[#set math.equation(numbering: n => "(3.9)")
 $ Q_S \( J \) gt.eq c_(*) thin bb(E)_(Y \, j_(+)) I_S \( Y \) J \( \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) \)^2 #h(2em) \( b in S \) . $ <eq:tuple-marked-positive>]

Now suppose $b in.not S$. The lists split into plus and minus addresses according to the order of the cut symbols in block $b$. Write $Y_(+)$ for the plus lists, and $I_(+) \( Y_(+) \)$ for the factors of $I_S$ whose edges have both ends on that side. Set

$ cal(A)_S \( J \) = bb(E)_(Y_(+) \, j_(+)) I_(+) \( Y_(+) \) J \( \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) \)^2 . $

No index interaction crosses this cut, because changing a marked block does not change the word in block $b$. Let $R_(+)$ be the internal index weight on the plus side. After averaging the indices, $Q_S \( J \)$ is the quadratic form of the kernel of cross-list edge weights applied to the half-function

$ B \( Y_(+) \) = I_(+) \( Y_(+) \) thin bb(E)_(j_(+)) R_(+) \( j_(+) \) J \( \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) \) . $

By Cauchy–Schwarz, $R_(+) lt.eq C$, and $I_(+)^2 lt.eq I_(+)$, $parallel B parallel_2^2 lt.eq C cal(A)_S \( J \)$. Lemma 7 replaces the cross kernel by its nonnegative constant value with operator error $O \( p^(- delta) \)$. The constant kernel contributes a nonnegative multiple of $\( bb(E) B \)^2$. Hence, uniformly over $S$ and the cut,

#[#set math.equation(numbering: n => "(3.10)")
 $ Q_S \( J \) gt.eq - C p^(- delta) cal(A)_S \( J \) #h(2em) \( b in.not S \) . $ <eq:tuple-unmarked-error>]

If $s = t + 1$, the cross kernel is exactly $1$, and $Q_S \( J \) gt.eq 0$.

For $b in.not S$ and $s lt.eq t$, let $S' = S union { b }$. We claim that

#[#set math.equation(numbering: n => "(3.11)")
 $ Q_(S') \( J \) gt.eq c_(*) r_(*)^(- d \/ 2) cal(A)_S \( J \) . $ <eq:tuple-concatenation>]

The new address forgets block $b$. Exactly $r_(*) = K \/ 2$ old plus addresses become each new address, one for each word in which $alpha$ precedes $beta$. Enumerate those words as $sigma_1 \, dots.h \, sigma_(r_(*))$, and write the old addresses above a new address $u$ as $\( u \, sigma_a \)$. Concatenate their old lists by setting

$ tilde(Y)_(u \, \( a - 1 \) ell_s + i) = Y_(\( u \, sigma_a \) \, i) #h(2em) \( a in \[ r_(*) \] \, med i in \[ ell_s \] \) . $

These are independent uniform lists of length $r_(*) ell_s = ell_(s + 1)$, precisely as required by the definition of $nu_(S')$.

Under this identification of list variables, $I_(S') gt.eq I_(+)$ pointwise. Indeed, any edge between new addresses is witnessed by at least $t + 1$ blocks other than $b$, so every pair of their constituent old plus addresses already had that directed edge. Thus every factor of $I_(S')$ occurs in $I_(+)$; the latter may have additional factors in $\[ 0 \, 1 \]$. If $\| S' \| = t + 1$, the same inequality follows from $I_(S') = 1$. In the nonnegative right side of (3.9) for $S'$, denote the independently chosen uniform new indices by $j'_v$. For a plus slot of old address $\( u \, sigma_a \)$, restrict $j'_v$ to ${ \( a - 1 \) ell_s + 1 \, dots.h \, a ell_s }$. Each restriction has probability $1 \/ r_(*)$, independently over the $d \/ 2$ slots. Conditional on these restrictions, the selected labels have exactly their old distribution. Using $I_(S') gt.eq I_(+)$ gives (3.11). Figure 1 illustrates this identification of the lists and the index restrictions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((5.4, 0.9), [#text(size: 9pt)[Old plus lists whose addresses forget to $u$]], anchor: "south", padding: 0.1176cm)
  content((1.6, 0.42), [#text(size: 9pt)[$(u, sigma_1)$]], anchor: "south", padding: 0.1176cm)
  content((5.4, 0.42), [#text(size: 9pt)[$(u, sigma_a)$]], anchor: "south", padding: 0.1176cm)
  content((9.2, 0.42), [#text(size: 9pt)[$(u, sigma_(r_*))$]], anchor: "south", padding: 0.1176cm)
  content((1.6, 0), [#box(width: 3.2cm, height: 0.8cm, inset: 0.07056cm, radius: 1pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$(Y_((u, sigma_1),i))_(i in [ ell_s])$]]])])
  content((5.4, 0), [#box(width: 3.2cm, height: 0.8cm, inset: 0.07056cm, radius: 1pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ededff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$(Y_((u, sigma_a),i))_(i in [ ell_s])$]]])])
  content((9.2, 0), [#box(width: 3.2cm, height: 0.8cm, inset: 0.07056cm, radius: 1pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$(Y_((u, sigma_(r_*)),i))_(i in [ ell_s])$]]])])
  content((3.5, 0), [#text(size: 9pt)[$dots.h$]])
  content((7.3, 0), [#text(size: 9pt)[$dots.h$]])
  line((1.6, -0.4), (1.6, -1.18), stroke: (paint: rgb("#595959"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  line((5.4, -0.4), (5.4, -1.18), stroke: (paint: rgb("#595959"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  line((9.2, -0.4), (9.2, -1.18), stroke: (paint: rgb("#595959"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  content((5.4, -0.8), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[concatenate]]])])
  rect((3.8, -1.2), (7, -2), fill: rgb("#ededff"), stroke: none)
  rect((0, -1.2), (10.8, -2), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((3.2, -1.2), (3.2, -2), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((3.8, -1.2), (3.8, -2), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((7, -1.2), (7, -2), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((7.6, -1.2), (7.6, -2), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((1.6, -1.6), [#text(size: 9pt)[sublist $1$]])
  content((3.5, -1.6), [#text(size: 9pt)[$dots.h$]])
  content((5.4, -1.6), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[sublist $a$]]])
  content((7.3, -1.6), [#text(size: 9pt)[$dots.h$]])
  content((9.2, -1.6), [#text(size: 9pt)[sublist $r_*$]])
  line((0, -2.12), (10.8, -2.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.4, -2.33), [#text(size: 9pt)[$tilde(Y)_u: ell_(s+1)=r_* ell_s#h(0.3333em) "independent" "uniform" "entries"$]], anchor: "north", padding: 0.1176cm)
  content((5.4, -3.02), [#box(width: 11.64cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[For $v in V_+$ with $u_S(v)=(u, sigma_a)$, retain only indices#linebreak() $ j'_v in \{(a-1) ell_s+1, dots.h ,a ell_s\}, bb(P) ( "retained" "at" "every" v in V_+)=r_*^(-d"/"2).$]]])], anchor: "north")
})],
  caption: [Figure 1: Marking the cut block $b$: the comparison between $S$ and $S' = S union { b }$. For each new address $u$, concatenate its $r_(*)$ old plus lists; the displayed sublists are schematic. Independence and probabilities refer to sampling before weights are applied. Restricting the new index at each plus slot to its former sublist recovers the old distribution of selected labels, with probability $r_(*)^(- d \/ 2)$. Every edge between new addresses gives an old edge between every pair of their plus sublists. Hence every factor of $I_(S')$ occurs in $I_(+)$, and $0 lt.eq W lt.eq 1$ gives $I_(S') gt.eq I_(+)$. These are the two ingredients of the comparison for $Q_(S') \( J \)$. ],
) <fig:list-concatenation>

=== 3.5 The mixture and its cycle property <the-mixture-and-its-cycle-property>

Define a finite measure and its normalization by

#[#set math.equation(numbering: n => "(3.12)")
 $ M = sum_(S subset.eq \[ w \]\
\| S \| lt.eq t + 1) p^(- \| S \| delta \/ 2) nu_S \, #h(2em) mu_(l \, p) = frac(M, M \( 1 \)) . $ <eq:tuple-mixture>]

For a fixed cut in block $b$, pair each $S$ missing $b$, $\| S \| lt.eq t$, with $S' = S union { b }$. By (3.10) and (3.11), their combined quadratic form is at least

$ p^(- s delta \/ 2) #scale(x: 120%, y: 120%)[\(] c_(*) r_(*)^(- d \/ 2) p^(- delta \/ 2) - C p^(- delta) #scale(x: 120%, y: 120%)[\)] cal(A)_S \( J \) gt.eq 0 $

for all sufficiently large $p$. Every component containing $b$ is used in exactly one such pair; the remaining components have $\| S \| = t + 1$, $b in.not S$, and nonnegative quadratic forms. This proves reflection positivity of $M$ and hence of $mu_(l \, p)$.

For $S = diameter$, every list has length one, all index weights are one, and the component mass is a graph average. Therefore (3.5) and $c_p gt.eq 1 \/ \( 2 k \)$ show that $nu_diameter \( 1 \) gt.eq c_0 > 0$ for sufficiently large $p$, uniformly in $l$. The uniform upper bounds on all component masses give

$ c_0 lt.eq M \( 1 \) lt.eq C_0 . $

Define the exceptional submeasure by

#[#set math.equation(numbering: n => "(3.13)")
 $ epsilon_(l \, p) = frac(p^(- \( t + 1 \) delta \/ 2), M \( 1 \)) sum_(\| S \| = t + 1) nu_S . $ <eq:tuple-exceptional>]

It has mass $O \( p^(- \( t + 1 \) delta \/ 2) \) lt.eq p^(- 4)$ after increasing the prime threshold, by the choice of $t$.

For $\| S \| lt.eq t$ at least $t + 1$ blocks remain unmarked, and the addresses of $v_j \, v_(j + 1)$ satisfy (3.7) in every one of them. The product $I_S$ therefore includes the weight on every pair of their list entries. On its support, in particular, the entries selected at those two slots have increment in the support of $W$, which consists of admissible residues. This proves the cycle property for $mu_(l \, p)^compose$. Translating every list entry by the same element of $bb(F)_p$ leaves all the weights unchanged. Each component, and hence both measures in the proposition, is translation invariant. The assertion about one-slot marginals follows because translation acts transitively on $bb(F)_p$.

=== 3.6 Covariance and conditional mixing <covariance-and-conditional-mixing>

It remains to show that the construction follows the auxiliary family under affine changes and that conditioning on the other slots reveals little about a mean-zero function at one slot. The first property will permit passage to progressions. The second will control large denominators in the Fourier lifts.

If $p divides.not D$, the auxiliary-family identity (2.3) gives

$ W_(l D \, p) \( y \) = W_(l \, p) \( lambda \( D \) y \) . $

Indeed the substitution $x mapsto D x - i$ is bijective modulo $p$, preserves $T_l \( D x - i \) = T_(l D) \( x \)$, and preserves nonvanishing of the derivative because both $D$ and $lambda \( D \)$ are units modulo $p$. Consequently changing every list entry to $lambda \( D \)^(- 1) \( Y_(u \, i) - a' \)$ transforms each component for $l$ into the component for $l D$, preserving its mass and all index weights. The mixtures and their exceptional parts therefore satisfy (3.1).

For (3.2), first consider the normalized component $nu_diameter \/ nu_diameter \( 1 \)$. At a fixed slot $v$ write $x = z_v$ and $y = \( z_u \)_(u eq.not v)$. Its unnormalized density, relative to independent uniform labels, factors as

$ J_1 \( x \, y \) J_2 \( y \) \, $

where $J_1$ is the product of the $m$ edge weights incident with $v$, and $J_2$ contains the remaining edges. Put

$ A \( y \) = bb(E)_x J_1 \( x \, y \) \, #h(2em) B \( y \) = bb(E)_x f \( x \) J_1 \( x \, y \) . $

Apply (3.6) to the graph of incident edges, whose two sides are ${ v }$ and the other vertices. Since $bb(E) f = 0$, it gives

$ parallel A - c_p^m parallel_2 lt.eq C p^(- delta) \, #h(2em) parallel B parallel_2 lt.eq C p^(- delta) parallel f parallel_2 . $

The conditional expectation at $y$ is $B \( y \) \/ A \( y \)$ when $A \( y \) > 0$. The marginal density of $y$ is $J_2 \( y \) A \( y \) \/ nu_diameter \( 1 \)$, so the squared conditional norm is

#[#set math.equation(numbering: n => "(3.14)")
 $ frac(1, nu_diameter \( 1 \)) bb(E)_y J_2 \( y \) frac(\| B \( y \) \|^2, A \( y \)) \, $ <eq:tuple-leading-conditional>]

with the ratio defined as zero when $A = 0$. On $A gt.eq c_p^m \/ 2$, this is bounded using the estimate for $B$. The complementary set has uniform probability $O \( p^(- 2 delta) \)$ by the estimate for $A$, since $c_p^m$ is bounded below. On that set, weighted Cauchy–Schwarz and $J_1 lt.eq 1$ give

$ frac(\| B \( y \) \|^2, A \( y \)) lt.eq bb(E)_x \| f \( x \) \|^2 J_1 \( x \, y \) lt.eq parallel f parallel_2^2 . $

Together with $J_2 lt.eq 1$ and the lower bound on $nu_diameter \( 1 \)$, this proves that (3.14) is $O \( p^(- 2 delta) \) parallel f parallel_2^2$.

Both $mu_(l \, p)$ and $mu_(l \, p)^compose$ are mixtures of the normalized components, and in either mixture the total probability of $S eq.not diameter$ is $O \( p^(- delta \/ 2) \)$. To justify transfer of the estimate, retain the component label as an additional random variable. Conditional Jensen shows that conditioning on this label as well as on all other slots can only increase the squared conditional norm. In each normalized component the trivial bound is $parallel f parallel_2^2$, since that component has a uniform marginal at slot $v$. Averaging the leading estimate and these trivial bounds therefore yields

$ ∥bb(E)_(rho_p) \[ f \( z_v \) divides \( z_u \)_(u eq.not v) \]∥_2^2 lt.eq C p^(- delta \/ 2) parallel f parallel_2^2 . $

As $2 gamma = delta \/ 5 < delta \/ 2$, increasing the prime threshold makes this at most $p^(- 2 gamma) parallel f parallel_2^2$. This proves (3.2) and completes the proof of Proposition 6.

Fix henceforth a threshold $P > P_1$ for which the proposition holds, large enough also that

#[#set math.equation(numbering: n => "(3.15)")
 $ p^(gamma \/ 2) gt.eq 3 quad \( p gt.eq P \) \, #h(2em) product_(p gt.eq P) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 \, $ <eq:prime-thresholds>]

where the product is over primes. Its tail tends to one because $sum_p p^(- 3) < oo$. Define

#[#set math.equation(numbering: n => "(3.16)")
 $ M_0 = product_(p < P) p^(E_p) gt.eq 2 . $ <eq:small-prime-modulus>]

The previously chosen $L$ is unchanged when $P$ is enlarged. For $D = M_0$ times a product of distinct primes at least $P$, a residue modulo $D$ is called admissible at $l$ if it is admissible at every local factor $p^(E_p)$ of $D$.

== 4 Multilinear estimates and Fourier lifts <sec:lifts>

The tuple laws of Section 3 provide two ways to control multilinear averages: reflection positivity compares different inputs with a single diagonal quantity, while conditional mixing suppresses large Fourier denominators. We develop both estimates, then prove the moment bounds needed to apply them to bounded functions on integer intervals. The signed-form and Fourier-lift arguments follow the corresponding section of #cite(label("IntersectivePower")). The signed-form estimates have their square-difference counterpart in #cite(label("SquarePower")) Proposition 4.1 and Lemmas 4.2–4.3. We give full proofs of the estimates needed here. The change of coordinates in Lemma 9 carries the auxiliary parameter from $l$ to $l D$.

Retain the index set $V = Pi^w$, where $Pi$ consists of the permutation words on $\[ L \]$, and put $d = \| V \|$; in particular, $d$ is even. Fix a positive integer $l$ and a finite set $cal(P)$ of primes at least $P$. Set

$ X_(cal(P)) = product_(p in cal(P)) bb(F)_p \, #h(2em) mu_(l \, cal(P)) = ⨂_(p in cal(P)) mu_(l \, p) . $

We collect the prime labels in slot $v$ into a single variable $z_v in X_(cal(P))$, so $mu_(l \, cal(P))$ is a probability law on $X_(cal(P))^V$. Each single-slot marginal is uniform. Norms of functions on $X_(cal(P))$ will always use uniform probability measure unless another measure is specified. For real functions on this space define

$ cal(Z)_(l \, cal(P)) \( \( g_v \)_(v in V) \) = integral product_(v in V) g_v \( z_v \) thin d mu_(l \, cal(P)) \, #h(2em) Z_(l \, cal(P)) \( g \) = cal(Z)_(l \, cal(P)) \( \( g \)_(v in V) \) . $

The empty prime set is allowed: its residue space is a singleton and $Z_(l \, diameter) \( g \) = g^d$.

We also fix the Fourier notation on these spaces. Every frequency has a unique additive decomposition

$ xi = sum_(p in cal(P)) a_p / p med \( mod med 1 \) \, #h(2em) 0 lt.eq a_p < p \, $

and its character is $e \( z xi \) = product_(p in cal(P)) e \( a_p z_p \/ p \)$. Equivalently, one may use any integer representative of $z$ supplied by the Chinese remainder theorem. The #emph[exact support] of this character is ${ p : a_p eq.not 0 }$; its reduced denominator, denoted $q \( xi \)$, is the product of those primes. For $B subset.eq cal(P)$ write $q_B = product_(p in B) p$, with $q_diameter = 1$.

=== 4.1 Signed Hölder inequality and seminorm rules <signed-hölder-inequality-and-seminorm-rules>

The finite reflection argument below follows the chessboard method of Fröhlich, Israel, Lieb and Simon #cite(label("FILS1978")) Theorem 4.1; related reflection arguments for graph norms appear in Conlon and Lee #cite(label("ConlonLee2017")) Section 3. The standard passage from a multilinear Hölder inequality to a seminorm is also part of Hatami’s criterion for graph norms #cite(label("Hatami2010")) Theorem 2.8 of the arXiv version; we prove both steps directly for the present tuple laws.

#thm([Proposition 4.1.])[
  (Signed Hölder inequality).  #emph[For every positive integer $l$, finite set $cal(P)$ of primes at least $P$, and real functions $g \, g_v : X_(cal(P)) arrow.r bb(R)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ Z_(l \, cal(P)) \( g \) gt.eq 0 \, #h(2em) lr(|cal(Z)_(l \, cal(P)) \( \( g_v \)_(v in V) \)|) lt.eq product_(v in V) Z_(l \, cal(P)) \( g_v \)^(1 \/ d) . $ <eq:signed-holder>]

]
] <prop:signed-holder>

#proof[
  Across any reflection cut of $V$, the matrix of the product law is the tensor product of the corresponding prime-law matrices. It is therefore positive semidefinite. To explain its consequence for signed inputs, fix a cut $V = V_(+) union.sq V_(-)$ and its reflection $theta$. Define maps $phi.alt_plus.minus : V arrow.r V_plus.minus$ that fix the selected half and reflect the other half into it. An assignment of functions is a map $a : v mapsto g_v$; write its integral as $Lambda \( a \)$. The two real functions on the plus-half labels that enter the cut bilinear form are
  $ F \( x \) = product_(v in V_(+)) a \( v \) \( x_v \) \, #h(2em) G \( x \) = product_(v in V_(+)) a \( theta v \) \( x_v \) . $
  Its mixed value is $Lambda \( a \)$, and its two quadratic values are $Lambda \( a compose phi.alt_(+) \)$ and $Lambda \( a compose phi.alt_(-) \)$. Cauchy–Schwarz for the positive semidefinite matrix gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ \| Lambda \( a \) \|^2 lt.eq Lambda \( a compose phi.alt_(+) \) Lambda \( a compose phi.alt_(-) \) \, #h(2em) Lambda \( a compose phi.alt_plus.minus \) gt.eq 0 . $ <eq:fold-cs>]
  In particular a constant assignment has nonnegative integral, proving the first assertion of (4.1).
  We next give a finite sequence of fold maps that sends every vertex to one vertex. In one block write $p_i$ for the position of symbol $i$ in its permutation word. Folding onto the half where $i$ precedes $i + 1$ sorts the pair $\( p_i \, p_(i + 1) \)$, leaving all other entries unchanged. Apply the comparisons $i = 1 \, dots.h \, L - 1$ in that order, and repeat this sweep $L - 1$ times. A sweep moves the largest entry to the end. Once the largest entries occupy their final positions, the next sweep leaves them there and places the largest remaining entry immediately before them. Thus every position array becomes $\( 1 \, dots.h \, L \)$. Perform these sweeps in each block. If their fold maps in chronological order are $phi.alt_1 \, dots.h \, phi.alt_m$, then
  $ phi.alt_m compose dots.h.c compose phi.alt_1 \( v \) = v_(*) quad upright("for every ") v in V \, $
  where $v_(*)$ has the identity word in every block.
  Now fix a finite nonempty list of real functions and let $M$ be the maximum absolute integral over all assignments from that list, allowing repetition. If $M > 0$, take a maximizing assignment. Each of its folded integrals is nonnegative and at most $M$, while their product is at least $M^2$ by (4.2). Both therefore equal $M$. Hence either fold preserves maximality. Apply the pullbacks in reverse order, first $phi.alt_m$, then $phi.alt_(m - 1)$, and so on. The final assignment is $a compose phi.alt_m compose dots.h.c compose phi.alt_1$, which is constant. It follows that $M$ is a diagonal value. Conversely, constant assignments are included in the maximum. We have proved that the maximum absolute mixed integral equals the largest diagonal value in the list; this is also true when $M = 0$.
  For $epsilon.alt > 0$, apply this conclusion to the list
  $ frac(g_v, \( Z_(l \, cal(P)) \( g_v \) + epsilon.alt \)^(1 \/ d)) \, #h(2em) v in V . $
  Each diagonal value in this list is at most one. Multilinearity gives $\| cal(Z)_(l \, cal(P)) \( \( g_v \)_v \) \| lt.eq product_v \( Z_(l \, cal(P)) \( g_v \) + epsilon.alt \)^(1 \/ d)$. Let $epsilon.alt arrow.b 0$. This proves the second assertion, including cases where some diagonal values vanish. ◻
]

Define

$ parallel g parallel_(l \, cal(P)) = Z_(l \, cal(P)) \( g \)^(1 \/ d) quad upright("for real ") g . $

For $B subset.eq cal(P)$, let $bb(E)_B g$ mean uniform averaging over the coordinates in $B$, with all other coordinates held fixed. The resulting function may be viewed on either $X_(cal(P))$ or $X_(cal(P) \\ B)$.

#thm([Lemma 4.2.])[
  (Seminorm and changes of coordinates).  #emph[The map $g mapsto parallel g parallel_(l \, cal(P))$ is a seminorm on the real functions on $X_(cal(P))$. It satisfies 
$ \| bb(E) g \| lt.eq parallel g parallel_(l \, cal(P)) \, #h(2em) parallel bb(E)_B g parallel_(l \, cal(P) \\ B) = parallel bb(E)_B g parallel_(l \, cal(P)) lt.eq parallel g parallel_(l \, cal(P)) . $

 Translations of the input are isometries. Moreover, if $D$ is a positive integer coprime to every prime of $cal(P)$, then for any $a' in X_(cal(P))$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ ∥g #scale(x: 120%, y: 120%)[\(] lambda \( D \)^(- 1) \( thin dot.op - a' \) #scale(x: 120%, y: 120%)[\)]∥_(l \, cal(P)) = parallel g parallel_(l D \, cal(P)) . $ <eq:lift-transport>]

 Here the affine change is interpreted separately at each prime.]
] <lem:seminorm>

#proof[
  Nonnegativity follows from Proposition 8. Since $d$ is even, homogeneity of $Z$ gives absolute homogeneity of its $d$-th root. Expanding $Z \( g + h \)$ by its slots and applying (4.1) termwise gives
  $ Z_(l \, cal(P)) \( g + h \) lt.eq sum_(S subset.eq V) parallel g parallel_(l \, cal(P))^(\| S \|) parallel h parallel_(l \, cal(P))^(d - \| S \|) = #scale(x: 120%, y: 120%)[\(] parallel g parallel_(l \, cal(P)) + parallel h parallel_(l \, cal(P)) #scale(x: 120%, y: 120%)[\)]^d . $
  Taking roots proves the triangle inequality. Putting $g$ in one slot and 1 in all others in (4.1) proves mean domination, since the single-slot marginal is uniform and $Z \( 1 \) = 1$.
  The simultaneous translation invariance of the tuple laws proves that translations are isometries. Let $G_B subset.eq X_(cal(P))$ be the additive subgroup of vectors supported on $B$. Then
  $ \( bb(E)_B g \) \( z \) = frac(1, \| G_B \|) sum_(a in G_B) g \( z + a \) . $
  The triangle inequality gives the asserted contraction. Since $bb(E)_B g$ is independent of $B$, the probability laws at those primes integrate out, proving the equality of the two seminorms. Finally, $lambda \( D \)$ is a unit at each remaining prime, and the covariance identity (3.1) pushes the product law at $l$ exactly to that at $l D$. This proves (4.3). ◻
]

=== 4.2 Decay at large Fourier denominators <decay-at-large-fourier-denominators>

Conditional mixing gives a different estimate, valid also after removing the exceptional part of each prime law. Its proof requires orthogonality between different exact supports; applying the triangle inequality to all Fourier coefficients would lose this decay.

#thm([Lemma 4.3.])[
  (Large-denominator estimate).  #emph[Fix $l gt.eq 1$ and a finite prime set $cal(P)$ as above. At each prime choose either $rho_p = mu_(l \, p)$ or $rho_p = mu_(l \, p)^compose$. Let $g_v : X_(cal(P)) arrow.r bb(C)$ be arbitrary functions. If, in one distinguished slot $v$, every Fourier coefficient at a denominator at most $R$ vanishes, where $R gt.eq 1$, then 
#[#set math.equation(numbering: n => "(4.4)")
 $ lr(|integral product_(u in V) g_u \( z_u \) thin d ⨂_(p in cal(P)) rho_p|) lt.eq R^(- gamma) parallel g_v parallel_2 product_(u eq.not v) parallel g_u parallel_(2 \( d - 1 \)) . $ <eq:large-denominator>]

]
] <lem:large-denominator>

#proof[
  At one prime, let $frak(m)_p$ denote the marginal law of the labels in all slots other than $v$, and let
  $ T_p f = bb(E)_(rho_p) #scale(x: 120%, y: 120%)[\(] f \( z_v \) divides \( z_u \)_(u eq.not v) #scale(x: 120%, y: 120%)[\)] . $
  This is an operator from uniform $L^2 \( bb(F)_p \)$ to $L^2 \( frak(m)_p \)$. It preserves constants. It sends uniform-mean-zero inputs to $frak(m)_p$-mean-zero outputs, since $bb(E)_(frak(m)_p) T_p f = bb(E) f$. By the conditional mixing estimate (3.2), its norm on the mean-zero subspace is at most $p^(- gamma)$.
  The product law makes the conditional operator for all primes equal to $T = ⨂_p T_p$: this identity holds first for products of one-prime functions, by independence across primes, and then for every function by linearity. The exact-support $B$ Fourier space has a mean-zero factor at primes in $B$ and a constant factor elsewhere. On this space the operator norm is at most $q_B^(- gamma)$. Furthermore, the images of two distinct exact-support spaces are orthogonal in $L^2 \( ⨂_p frak(m)_p \)$. At a prime in the symmetric difference of the supports, one image factor is constant and the other has mean zero. Their inner product is zero, and tensoring preserves this orthogonality.
  Decompose $g_v = sum_(q_B > R) g_(v \, B)$ by exact supports. Both the domain summands and their images are orthogonal, so
  $ parallel T g_v parallel_2^2 = sum_(q_B > R) parallel T g_(v \, B) parallel_2^2 lt.eq sum_(q_B > R) q_B^(- 2 gamma) parallel g_(v \, B) parallel_2^2 lt.eq R^(- 2 gamma) parallel g_v parallel_2^2 . $
  Condition the original integral on the other slots and apply Cauchy–Schwarz. The remaining factor is bounded by
  $ ∥product_(u eq.not v) g_u \( z_u \)∥_2 lt.eq product_(u eq.not v) (bb(E) \| g_u \( z_u \) \|^(2 \( d - 1 \)))^(1 \/ \( 2 \( d - 1 \) \)) = product_(u eq.not v) parallel g_u parallel_(2 \( d - 1 \)) \, $
  using ordinary Hölder and the uniform single-slot marginals. This proves (4.4). If $cal(P)$ is empty, the frequency hypothesis forces $g_v = 0$, and the conclusion is immediate. ◻
]

=== 4.3 Fourier lifts and uniform moments <fourier-lifts-and-uniform-moments>

A bounded function on an integer interval gives Fourier coefficients at rational frequencies. We transfer a finite set of these coefficients to $X_(cal(P))$. Such a transfer need not preserve pointwise bounds, so we prove bounds for every fixed moment. The following proposition and proof reproduce the uniform lift argument of #cite(label("IntersectivePower")) section “Multilinear estimates and Fourier lifts”. For the square-difference setting, see #cite(label("SquarePower")) Lemmas 5.2–5.3. We must also allow arbitrary subfamilies of complete exact supports, because fixing some residue coordinates changes which denominators remain.

Let $I$ be a nonempty consecutive interval of integers and let $f : I arrow.r bb(C)$. Put

$ hat(f)_I \( xi \) = frac(1, \| I \|) sum_(x in I) f \( x \) e \( - x xi \) . $

For $B subset.eq cal(P)$, define its exact-support contribution

$ f_B \( z \) = sum_(q \( xi \) = q_B) hat(f)_I \( xi \) e \( z xi \) \, $

where the frequencies are characters of $X_(cal(P))$. For $Q gt.eq 1$, the Fourier lift is

$ cal(L)_(I \, cal(P) \, Q) f \( z \) = sum_(B subset.eq cal(P)\
q_B lt.eq Q) f_B \( z \) = sum_(xi upright(" on ") X_(cal(P))\
q \( xi \) lt.eq Q) hat(f)_I \( xi \) e \( z xi \) . $

Each $f_B$ depends only on the coordinates in $B$, and has mean zero in each of those coordinates. If $f$ is real, all these functions are real because each summation set is closed under negation. Retaining a support $B$ always means retaining all its frequencies.

#thm([Proposition 4.4.])[
  (Uniform lift moments).  #emph[Let $cal(P)$ be any finite set of primes, $Q gt.eq 1$, and let $I$ be a consecutive integer interval with $\| I \| gt.eq 10 Q^6$. For every integer $r gt.eq 1$, every $epsilon.alt > 0$, every function $f : I arrow.r bb(C)$, and every subfamily $cal(F) subset.eq { B subset.eq cal(P) : q_B lt.eq Q }$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ ∥sum_(B in cal(F)) f_B∥_(2 r) lt.eq C_(r \, epsilon.alt) parallel f parallel_oo Q^epsilon.alt . $ <eq:lift-moments>]

 The constant is independent of the prime set, the interval and its location, the function, and the subfamily.]
] <prop:lift-moments>

#proof[
  The zero function is immediate; otherwise scale so that $parallel f parallel_oo lt.eq 1$. Write $N_I = \| I \|$, and let
  $ u = max { \| B \| : B subset.eq cal(P) \, med q_B lt.eq Q } . $
  The empty support is included, so this maximum is defined even when $cal(P)$ is empty. We first control conditional sums of squares of the $f_B$, then their square-function moments. Symmetrization will recover the moment of their sum.
  #emph[Conditional energy.] For $J subset.eq cal(P)$ with $q_J lt.eq Q$, and any fixed coordinate vector $z_J$, we claim that
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(B in cal(F)\
B supset.eq J) bb(E) #scale(x: 120%, y: 120%)[\(] \| f_B \|^2 divides z_J #scale(x: 120%, y: 120%)[\)] lt.double 4^(\| J \|) . $ <eq:conditional-energy>]
  The conditional expectation here averages uniformly over all coordinates outside $J$. If $B supset.eq J$, the coefficient of an outside character $eta$ of exact support $B \\ J$, after fixing $z_J$, is
  $ c_J \( eta \; z_J \) = 1 / N_I sum_(x in I) f \( x \) e \( - x eta \) product_(p in J) #scale(x: 120%, y: 120%)[\(] p upright(bold(1))_({ x equiv z_p med \( mod med p \) }) - 1 #scale(x: 120%, y: 120%)[\)] . $
  Indeed, the sum over the nonzero frequencies at $p$ is $sum_(a = 1)^(p - 1) e \( a \( z_p - x \) \/ p \) = p upright(bold(1))_({ x equiv z_p med \( mod med p \) }) - 1$. The outside characters associated with $B$ have exact support $B \\ J$. These supports distinguish the sets $B supset.eq J$, so their character sets are disjoint. Conditional Parseval therefore identifies the left side of (4.6) with the squared Euclidean norm of this coefficient vector on the union of those sets.
  Expand the product in $c_J$ over subsets $J' subset.eq J$. Apart from a sign, the corresponding vector has coordinates
  $ q_(J') / N_I sum_(x in I\
x equiv z_(J') med \( mod med q_(J') \)) f \( x \) e \( - x eta \) . $
  The congruence denotes the class determined by the fixed coordinates in $J'$; for the empty subset it imposes no restriction. Write its progression as $x = a + q_(J') n$, with $n$ in a consecutive interval of length $N'$. Then
  $ N' gt.eq 0.9 N_I \/ q_(J') \, #h(2em) N' q_(J') \/ N_I lt.eq 1.1 . $
  In these coordinates the frequencies are $q_(J') eta$, up to constant phases. They remain distinct because their denominators are coprime to $q_J$. Their denominators are at most $Q$, so they number at most $Q^2$ and have pairwise circle distance at least $Q^(- 2)$.
  The Gram matrix of these characters in normalized $L^2$ on the progression has diagonal 1. By geometric summation, every off-diagonal entry has modulus at most $Q^2 \/ \( 2 N' \)$. Its operator norm is therefore at most its maximum absolute row sum, which is bounded by
  $ 1 + frac(Q^4, 2 N') lt.eq 1 + frac(Q^5, 1.8 N_I) lt.eq 1 + frac(1, 18 Q) . $
  To see how this bounds the coefficients, let the synthesis map send $\( b_eta \)_eta$ to $sum_eta b_eta e \( n q_(J') eta \)$ on the progression interval with normalized counting measure. Its adjoint is the normalized Fourier analysis map, and its Gram matrix is the matrix just estimated. The two maps therefore have norm squared equal to that Gram-matrix norm. Since $parallel f parallel_oo lt.eq 1$ and $N' q_(J') \/ N_I lt.eq 1.1$, the displayed coefficient vector has Euclidean norm bounded by an absolute constant. The triangle inequality over the $2^(\| J \|)$ subsets $J'$, followed by squaring, proves (4.6).
  #emph[Square-function moments.] Set
  $ S \( z \) = (sum_(B in cal(F)) \| f_B \( z \) \|^2)^(1 \/ 2) . $
  Expand $bb(E) S^(2 r)$ and fix the supports of its first $r - 1$ factors. Their union $W'$ has size at most $\( r - 1 \) u$, and their product depends only on $z_(W')$. For the final support $B$, the function $f_B$ ignores every coordinate outside $B$. Thus integration outside $W'$ leaves exactly $bb(E) \( \| f_B \|^2 divides z_J \)$, where $J = B ∩ W'$. Every intersection that occurs satisfies $q_J lt.eq q_B lt.eq Q$. For each fixed intersection $J$, the sum over supports with $B ∩ W' = J$ is bounded by the larger sum over all $B supset.eq J$ in (4.6). There are at most $2^(\( r - 1 \) u)$ possible intersections and each has at most $u$ elements. Thus
  $ bb(E) S^(2 r) lt.eq C thin 2^(\( r - 1 \) u) 4^u bb(E) S^(2 r - 2) . $
  The same argument with $r = 1$ uses $J = W' = diameter$. Iteration gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ parallel S parallel_(2 r) lt.eq C_r^(1 + u) . $ <eq:lift-square-function>]
  The overlaps among supports have now been controlled. It remains to bound their sum by this square function with a loss exponential only in $u$.
  #emph[Recovering the sum.] We color the prime coordinates and first retain only terms that use one coordinate of each color. This will let us apply a scalar random-sign estimate one color at a time and use consistent coordinate copies across the retained terms. Fix a support size $j gt.eq 1$ and color every prime coordinate with one of $j$ colors. Call a support #emph[transversal] when it has exactly one prime of each color, and let $cal(T)$ be the transversal supports in $cal(F)$ for this coloring. Take independent uniform pairs $X_p^0 \, X_p^1$ at every prime. The operator $"swap"_p$ interchanges these two copies. Define
  $ D_B = product_(p in B) \( 1 - "swap"_p \) f_B \( X^0 \) \, #h(2em) B in cal(T) . $
  Averaging over all second copies leaves $f_B \( X^0 \)$, since every other term in this expansion has mean zero in at least one copied coordinate. Jensen’s inequality gives
  $ ∥sum_(B in cal(T)) f_B∥_(2 r) lt.eq ∥sum_(B in cal(T)) D_B∥_(L^(2 r) \( X^0 \, X^1 \)) . $
  Independent swaps preserve the joint law of the copies and multiply $D_B$ by the product of the corresponding signs. Thus for independent uniform signs $epsilon.alt_p$, indexed by primes,
  $ ∥sum_(B in cal(T)) D_B∥_(L^(2 r) \( X^0 \, X^1 \)) = ∥sum_(B in cal(T)) D_B product_(p in B) epsilon.alt_p∥_(L^(2 r) \( X^0 \, X^1 \, epsilon.alt \)) . $
  For completeness, the scalar sign estimate
  $ ∥sum_i a_i epsilon.alt_i∥_(2 r) lt.eq C_r (sum_i \| a_i \|^2)^(1 \/ 2) $
  follows by expanding the even moment. Surviving terms have even multiplicity at every index. For nonnegative coefficients their sum is at most
  $ frac(\( 2 r \) !, 2^r r !) (sum_i a_i^2)^r \, $
  because $\( 2 m \) ! gt.eq 2^m m !$. For complex coefficients, take absolute values of the surviving terms in $\( sum_i a_i epsilon.alt_i \)^r \( sum_i overline(a_i) epsilon.alt_i \)^r$ and use the nonnegative case. Iterating this estimate over the color classes gives, for fixed copies,
  $ ∥sum_(B in cal(T)) D_B product_(p in B) epsilon.alt_p∥_(L^(2 r) \( epsilon.alt \)) lt.eq C_r^j (sum_(B in cal(T)) \| D_B \|^2)^(1 \/ 2) . $
  At each step Minkowski is used in the form $parallel \( sum_i \| B_i \|^2 \)^(1 \/ 2) parallel_(2 r) lt.eq \( sum_i parallel B_i parallel_(2 r)^2 \)^(1 \/ 2)$. The signs are indexed by individual primes; transversality ensures that each monomial uses exactly one sign from each color class.
  In expanding the swaps in $D_B$, index its $2^j$ terms by a choice of copy for each color. For any fixed such choice, made consistently across all supports, the selected prime coordinates have the original product law. The triangle inequality in $L^(2 r) \( ell^2 \( cal(T) \) \)$ therefore gives
  $ ∥(sum_(B in cal(T)) \| D_B \|^2)^(1 \/ 2)∥_(2 r) lt.eq 2^j ∥(sum_(B in cal(T)) \| f_B \|^2)^(1 \/ 2)∥_(2 r) lt.eq 2^j parallel S parallel_(2 r) . $
  Consequently the transversal sum has norm at most $\( 2 C_r \)^j parallel S parallel_(2 r)$.
  Now average over independent uniform colorings. A fixed size-$j$ support is transversal with probability $j ! \/ j^j gt.eq e^(- j)$, where here $e$ is Euler’s number; the inequality follows from $log \( j ! \) gt.eq integral_1^j log x thin d x$. Thus the full size-$j$ sum is exactly the coloring average of its transversal sum divided by this probability. Minkowski yields
  $ ∥sum_(B in cal(F)\
\| B \| = j) f_B∥_(2 r) lt.eq \( 2 e C_r \)^j parallel S parallel_(2 r) . $
  Include the constant term of size zero and sum over $j lt.eq u$. Together with (4.7), this bounds the norm of the full sum by $\( C'_r \)^(1 + u)$. Finally, the product of $u$ distinct primes is at least $\( u + 1 \) !$, so $\( u + 1 \) ! lt.eq Q$. Hence $u = o \( log Q \)$ as $Q arrow.r oo$, uniformly in the prime set. For every fixed $r$ and $epsilon.alt > 0$, $\( C'_r \)^(1 + u) lt.eq C_(r \, epsilon.alt) Q^epsilon.alt$. Restoring $parallel f parallel_oo$ proves (4.5) with all the stated uniformities. ◻
]

#thm([Lemma 4.5.])[
  (Specialization of residue coordinates).  #emph[Let $B subset.eq cal(P)$, fix $z_B in X_B$, and let $G : X_(cal(P)) arrow.r bb(C)$. For $1 lt.eq s < oo$, 
$ parallel G \( z_B \, dot.op \) parallel_(L^s \( X_(cal(P) \\ B) \)) lt.eq q_B^(1 \/ s) parallel G parallel_(L^s \( X_(cal(P)) \)) . $

 In particular, a Fourier lift or a subfamily of its complete supports satisfies (4.5) after specialization with the additional factor $q_B^(1 \/ \( 2 r \))$. The same bound holds after retaining either the remaining denominators at most a given $H gt.eq 1$, or those greater than $H$.]
] <lem:lift-specialization>

#proof[
  The specified fiber has uniform probability $1 \/ q_B$. Its contribution to $bb(E) \| G \|^s$ is $q_B^(- 1) bb(E) \| G \( z_B \, dot.op \) \|^s$. Dropping the other nonnegative contributions proves the first assertion. For the last assertion, a character with original exact support $C$ retains exact support $C \\ B$ after specialization. The two cuts therefore arise, before specialization, from the complete-support subfamilies
  $ { C in cal(F) : q_(C \\ B) lt.eq H } \, #h(2em) { C in cal(F) : q_(C \\ B) > H } . $
  Apply Proposition 11 to these subfamilies and then use the fiber bound. Combining coefficients can cancel frequencies but cannot create any outside the indicated ranges. ◻
]

In particular, specialize the same set $B$ of coordinates in every slot, with possibly different values in different slots. Applying (4.4) to the product law on the remaining primes incurs total specialization factor

$ q_B^(1 \/ 2) (q_B^(1 \/ \( 2 \( d - 1 \) \)))^(d - 1) = q_B . $

Two specialized $L^2$ norms incur the same factor. All moment orders needed here are fixed after $h$ is fixed. Finite products of their subpower bounds remain subpower; none of these constants depends on $l$, the specialized residues, or the retained supports.

== 5 Prime estimates <sec:primes>

The kernel construction requires two uniform estimates: an asymptotic formula for primes in residue classes, and cancellation in polynomial exponential sums over primes. We derive the first from a zero-free half-plane theorem and prove the second by Vaughan’s identity and Weyl differencing. The latter argument also records why the product cutoff and the arithmetic coefficients do not obstruct mixed differencing.

For positive integers $n$, put

$ Lambda' \( n \) = \( log n \) upright(bold(1))_({ n upright(" is prime") }) \, #h(2em) Lambda \( n \) = cases(delim: "{", log p \, & n = p^j upright(" for a prime ") p upright(" and ") j gt.eq 1 \,, 0 \, & upright("otherwise") .) $

All sums below run over integers, including sums whose endpoints are real. The constants in this section are independent of the lower coefficients of the polynomial phases.

=== 5.1 Primes in arithmetic progressions <primes-in-arithmetic-progressions>

Here is the precise analytic input from the companion zero-free theorem. Only its assertion about Dirichlet $L$-functions is needed.

#thm([Theorem 5.1.])[
  (Zero-free input, #cite(label("ZeroFree")) Theorem 1.1).  #emph[For every integer $b gt.eq 1$ and every Dirichlet character $chi$ modulo $b$, the Dirichlet $L$-function $L \( s \, chi \)$ has no zero in $Re s > 7 \/ 8$. This includes imprimitive characters and the trivial character of modulus $1$, whose $L$-function is $zeta \( s \)$. A pole at $s = 1$ for a principal character is allowed.]
] <thm:zero-free-input>

#thm([Proposition 5.2.])[
  (Uniform distribution in residue classes).  #emph[Uniformly for $Y gt.eq 2$, $0 lt.eq x lt.eq Y$, integers $b gt.eq 1$, and reduced residue classes $c$ modulo $b$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ sum_(n lt.eq x\
n equiv c med \( mod med b \)) Lambda' \( n \) = frac(x, phi \( b \)) + O #scale(x: 120%, y: 120%)[\(] Y^(31 \/ 32) log^2 \( 2 b Y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:prime-progression>]

 For a nonreduced class modulo $b > 1$, the sum is $O \( log b \)$ and has zero main term.]
] <prop:prime-progressions>

#proof[
  Set $sigma_0 = 15 \/ 16$. We first prove the logarithmic derivative estimate
  #[#set math.equation(numbering: n => "(5.2)")
   $ L' / L \( s \, chi \) lt.double log #scale(x: 120%, y: 120%)[\(] 2 b \( 2 + \| Im s \| \) #scale(x: 120%, y: 120%)[\)] $ <eq:log-derivative>]
  on $Re s = sigma_0$, and throughout $sigma_0 lt.eq Re s lt.eq 2$ when $\| Im s \| gt.eq 1$. The constants are absolute, including for imprimitive characters.
  Write $delta_chi = 1$ for a principal character and $0$ otherwise, and let
  $ G_chi \( s \) = \( s - 1 \)^(delta_chi) L \( s \, chi \) . $
  Fix radii $2 - sigma_0 < r < R < 2 - 7 \/ 8$ and use disks of radius $R$ centered at $s_t = 2 + i t$. Theorem 13 makes $G_chi$ holomorphic and nonvanishing on each disk, with the principal pole removed. To bound its size there, use periodicity to write
  $ sum_(n lt.eq u) chi \( n \) = overline(chi) thin u + E_chi \( u \) \, #h(2em) \| E_chi \( u \) \| lt.eq 2 b \, #h(2em) overline(chi) = cases(delim: "{", phi \( b \) \/ b \, & delta_chi = 1 \,, 0 \, & delta_chi = 0 .) $
  Partial summation continues the Dirichlet series to $Re s > 0$ as
  $ L \( s \, chi \) = overline(chi) thin frac(s, s - 1) + s integral_1^oo E_chi \( u \) u^(- s - 1) thin d u . $
  Consequently, on the disk, $\| G_chi \( s \) \| lt.eq C \[ 2 b \( 2 + \| t \| \) \]^C$. At its center the absolutely convergent Euler product gives $\| L \( 2 + i t \, chi \) \| gt.eq zeta \( 4 \) \/ zeta \( 2 \)$; hence $\| G_chi \( s_t \) \|$ is bounded below by the same positive constant. Choose a holomorphic logarithm and subtract its value at $s_t$. Its real part is bounded above by $C log \( 2 b \( 2 + \| t \| \) \)$. Borel–Carathéodory on an intermediate disk, followed by Cauchy’s estimate on the disk of radius $r$, now gives
  $ G'_chi / G_chi \( s \) lt.double log \( 2 b \( 2 + \| t \| \) \) #h(2em) \( \| s - s_t \| lt.eq r \) . $
  Subtracting $delta_chi \/ \( s - 1 \)$ proves (5.2) in the asserted ranges.
  We next pass through a smoothed sum so that the contour integral is absolutely convergent. Mellin inversion for $\( 1 - u \)_(+)$ gives, for $x gt.eq 1$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ sum_(n lt.eq x) \( x - n \) Lambda \( n \) chi \( n \) = frac(1, 2 pi i) integral_(\( 2 \)) - L' / L \( s \, chi \) frac(x^(s + 1), s \( s + 1 \)) thin d s . $ <eq:smoothed-character-primes>]
  Here the interchange with the Dirichlet series is absolute. Move the line to $Re s = sigma_0$. Estimate (5.2) bounds the horizontal integrals by a constant times $x^3 log \( 2 b \( 2 + T \) \) \/ T^2$, which tends to zero with the height $T$. The sole crossed pole is at $s = 1$ for the principal character; its residue is $x^2 \/ 2$. On the new vertical line, integration of $log \( 2 b \( 2 + \| t \| \) \) \/ \( 1 + t^2 \)$ gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ sum_(n lt.eq x) \( x - n \) Lambda \( n \) chi \( n \) = delta_chi x^2 / 2 + O #scale(x: 120%, y: 120%)[\(] x^(1 + sigma_0) log \( 2 b \) #scale(x: 120%, y: 120%)[\)] . $ <eq:smoothed-character-result>]
  For $\( c \, b \) = 1$, character orthogonality yields
  $ A_c \( x \) := sum_(n lt.eq x\
n equiv c med \( mod med b \)) \( x - n \) Lambda \( n \) = frac(x^2, 2 phi \( b \)) + O #scale(x: 120%, y: 120%)[\(] x^(1 + sigma_0) log \( 2 b \) #scale(x: 120%, y: 120%)[\)] . $
  There are $phi \( b \)$ character errors and a factor $1 \/ phi \( b \)$, so the error is uniform in $b$. Crucially, sharp differencing is now performed on this nonnegative progression sum, rather than on a complex character sum. For $0 < H < x$, positivity of $Lambda$ gives
  $ frac(A_c \( x \) - A_c \( x - H \), H) lt.eq sum_(n lt.eq x\
n equiv c med \( mod med b \)) Lambda \( n \) lt.eq frac(A_c \( x + H \) - A_c \( x \), H) . $
  Take $H = x^(31 \/ 32)$ for sufficiently large $x$. The main terms differ from $x \/ phi \( b \)$ by $O \( H \)$, and the errors are
  $ O #scale(x: 120%, y: 120%)[\(] x^(1 + sigma_0) \/ H dot.op log \( 2 b \) #scale(x: 120%, y: 120%)[\)] = O #scale(x: 120%, y: 120%)[\(] x^(31 \/ 32) log \( 2 b \) #scale(x: 120%, y: 120%)[\)] . $
  Bounded $x$ is harmless. Finally,
  $ sum_(p^j lt.eq Y\
j gt.eq 2) log p lt.double Y^(1 \/ 2) log^2 \( 2 Y \) \, $
  so removing higher prime powers proves (5.1). If a prime lies in a nonreduced residue class modulo $b$, it divides $b$; the sum of the logarithms of distinct such primes is at most $log b$. This proves the last assertion. ◻
]

=== 5.2 A minor-arc estimate over primes <a-minor-arc-estimate-over-primes>

#thm([Proposition 5.3.])[
  (Prime polynomial sums).  #emph[For fixed $k gt.eq 2$ and $0 < rho < 1$, there is a constant $c_m = c_m \( k \, rho \) in \( 0 \, 1 \/ 4 \)$ with the following property. If $Y$ is sufficiently large, $I subset.eq \[ 1 \, Y \]$ is an interval, and $f in bb(R) \[ x \]$ has degree at most $k$ with coefficient $b_k$ of $x^k$, then 
#[#set math.equation(numbering: n => "(5.5)")
 $ lr(|sum_(n in I) Lambda' \( n \) e \( f \( n \) \)|) lt.double_(k \, rho) Y^(1 - c_m) \, $ <eq:prime-minor-arc>]

 provided $theta = \( k ! \)^2 b_k$ has an approximation $a \/ q$ satisfying 
#[#set math.equation(numbering: n => "(5.6)")
 $ \( a \, q \) = 1 \, #h(2em) \| theta - a \/ q \| lt.eq q^(- 2) \, #h(2em) Y^rho lt.eq q lt.eq Y^(k - rho) . $ <eq:minor-rational-range>]

]
] <prop:prime-minor-arcs>

Vaughan’s identity will split the prime weight into sums with one short variable and bilinear sums. Weyl differencing turns each into averages of linear phases, which rational approximation then bounds. We first prove the needed spacing and differencing estimates. Uniformity in the lower coefficients and in the interval will later permit additive linear twists for periodic restrictions and partial summation for smooth weights in the kernel construction.

Write $parallel u parallel$ for the distance of $u in bb(R)$ to the nearest integer, and interpret $min \( M \, parallel u parallel^(- 1) \)$ as $M$ when $parallel u parallel = 0$.

#thm([Lemma 5.4.])[
  (Rational spacing).  #emph[Suppose $\( a \, q \) = 1$, $q gt.eq 2$, and $\| theta - a \/ q \| lt.eq q^(- 2)$. For $R gt.eq 1$ and $M gt.eq 1$, 
#[#set math.equation(numbering: n => "(5.7)")
 $ sum_(1 lt.eq r lt.eq R) min \( M \, parallel theta r parallel^(- 1) \) lt.double \( R \/ q + 1 \) #scale(x: 120%, y: 120%)[\(] M + q log \( 2 q \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rational-spacing>]

]
] <lem:rational-spacing>

#proof[
  Within a block of $floor.l q \/ 2 floor.r$ consecutive integers, two distinct indices differ by a nonzero $d$ with $\| d \| < q \/ 2$. Thus
  $ parallel theta d parallel gt.eq parallel a d \/ q parallel - \| d \| \/ q^2 gt.eq 1 \/ \( 2 q \) . $
  The associated points are $1 \/ \( 2 q \)$ separated on the circle. The nearest point to zero contributes at most $M$, and summing the others in bands of width $1 \/ \( 2 q \)$ gives $O \( q log \( 2 q \) \)$, with another $O \( M \)$ for the bounded number of points in the first band. Partitioning the indices into such blocks proves the result, also when $q = 2$ or $3$. ◻
]

We will repeatedly group a fixed number of nonzero integer factors by their product. If that product has absolute value at most $Y^(C_k)$, the number of such factorizations is $Y^(o \( 1 \))$, uniformly in the product. Indeed, its prime factorization bounds the number by a fixed order divisor function, up to a bounded number of sign choices. For every $epsilon.alt > 0$ that function is $O_(k \, epsilon.alt) \( Y^epsilon.alt \)$: allocating a prime exponent among finitely many factors gives a polynomial in the exponent, which is bounded by any fixed positive power of the prime power after allowing a constant for finitely many small primes.

The following two differencing bounds isolate the treatment of coefficients and summation domains. They are forms of classical Weyl differencing; see #cite(label("Weyl1916")) #cite(label("Vaughan1997")) for the method.

#thm([Lemma 5.5.])[
  (One-variable and mixed differencing).  #emph[Let $k gt.eq 2$, and let $f in bb(R) \[ x \]$ have degree at most $k$, with coefficient $b_k$ of $x^k$.]
  #emph[If $J$ is an interval of integers of length at most an integer $M gt.eq 1$, and $m$ is a positive integer, then 
#[#set math.equation(numbering: n => "(5.8)")
 $ lr(|1 / M sum_(n in J) e \( f \( m n \) \)|)^(2^(k - 1)) lt.double_k 1 / M^k sum_(\| u_1 \| \, dots.h \, \| u_(k - 1) \| < M) min #scale(x: 120%, y: 120%)[\(] M \, parallel k ! b_k m^k u_1 dots.h.c u_(k - 1) parallel^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <eq:type-one-differencing>]

]
  #emph[Next let $A \, B$ be positive integers, let $I subset.eq \[ 1 \, Y \]$ be an interval, and let $\| a_m \| \, \| d_n \| lt.eq 1$. Set 
$ S = sum_(A lt.eq m < 2 A\
B lt.eq n < 2 B) a_m d_n upright(bold(1))_({ m n in I }) e \( f \( m n \) \) \, #h(2em) theta = \( k ! \)^2 b_k . $

 Then 
#[#set math.equation(numbering: n => "(5.9)")
 $ lr(|frac(S, A B)|)^(2^(2 k - 1)) lt.double_k frac(1, A^k B^k) sum_(\| u_1 \| \, dots.h \, \| u_k \| < B\
\| v_1 \| \, dots.h \, \| v_(k - 1) \| < A) min #scale(x: 120%, y: 120%)[\(] A \, parallel theta u_1 dots.h.c u_k v_1 dots.h.c v_(k - 1) parallel^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <eq:type-two-differencing>]

 Zero shifts are included in both sums.]
] <lem:prime-differencing>

#proof[
  We give the mixed argument explicitly. For a function $g$ of two integer variables, define
  $ Delta_u^n g \( m \, n \) = g \( m \, n + u \) - g \( m \, n \) \, #h(2em) Delta_v^m g \( m \, n \) = g \( m + v \, n \) - g \( m \, n \) . $
  Let $D_0$ be the set of pairs in the displayed box with $m n in I$. Extend $a_m$ and $d_n$ by zero outside their respective intervals, and extend every summand by zero outside $D_0$. Cauchy–Schwarz first removes $a_m$:
  $ lr(|frac(S, A B)|)^2 lt.eq 1 / A sum_(A lt.eq m < 2 A) lr(|1 / B sum_n d_n upright(bold(1))_(D_0) \( m \, n \) e \( f \( m n \) \)|)^2 . $
  Expanding the square and grouping by $u = n' - n$ bounds its right side by
  $ 1 / B sum_(\| u \| < B) lr(|frac(1, A B) sum_(m \, n) d_(n + u) overline(d_n) thin upright(bold(1))_(D_0) \( m \, n + u \) upright(bold(1))_(D_0) \( m \, n \) e #scale(x: 120%, y: 120%)[\(] Delta_u^n f \( m n \) #scale(x: 120%, y: 120%)[\)]|) . $
  For fixed $u$ the new weight depends only on $n$ and has modulus at most one. This is exactly the form needed for another $n$-difference. In particular, the product cutoff remains inside the sum; it has not been replaced by a rectangular domain.
  For $j$ fixed shifts $upright(bold(u)) = \( u_1 \, dots.h \, u_j \)$, let
  $ D_(upright(bold(u))) & = { \( m \, n \) : \( m \, n + epsilon dot.op upright(bold(u)) \) in D_0 upright(" for every ") epsilon in { 0 \, 1 }^j } \,\
F_(upright(bold(u))) \( m \, n \) & = Delta_(u_j)^n dots.h.c Delta_(u_1)^n f \( m n \) . $
  The accompanying coefficient $d_(upright(bold(u))) \( n \)$ is defined recursively by $d_diameter \( n \) = d_n$ and
  $ d_(\( upright(bold(u)) \, u \)) \( n \) = d_(upright(bold(u))) \( n + u \) overline(d_(upright(bold(u))) \( n \)) . $
  It depends only on $n$ and is bounded by one. At each subsequent step, Cauchy–Schwarz in the existing shifts costs only a constant depending on $j$, because their total normalized mass is at most $2^j$. Cauchy–Schwarz in $m$, followed by the same square expansion, adds one $n$-shift. Induction therefore gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ lr(|frac(S, A B)|)^(2^k) lt.double_k 1 / B^k sum_(\| u_1 \| \, dots.h \, \| u_k \| < B) lr(|frac(1, A B) sum_(m \, n) d_(upright(bold(u))) \( n \) upright(bold(1))_(D_(upright(bold(u)))) \( m \, n \) e \( F_(upright(bold(u))) \( m \, n \) \)|) . $ <eq:n-difference-stage>]
  All summands still have $m$ and $n$ in their original intervals, as the zero vertex of every translated cube belongs to $D_0$.
  After $k$ differences in $n$, every lower-degree term vanishes, and
  $ F_(upright(bold(u))) \( m \, n \) = k ! b_k u_1 dots.h.c u_k m^k . $
  For $0 lt.eq j lt.eq k - 1$ and $m$-shifts $upright(bold(v)) = \( v_1 \, dots.h \, v_j \)$, define the domains
  $ D_(upright(bold(u)) \, upright(bold(v))) = { \( m \, n \) : #h(0.27778em) & \( m + eta dot.op upright(bold(v)) \, n + epsilon dot.op upright(bold(u)) \) in D_0\
 & upright("for every ") eta in { 0 \, 1 }^j \, med epsilon in { 0 \, 1 }^k } . $
  Thus $D_(upright(bold(u)) \, diameter) = D_(upright(bold(u)))$. For $1 lt.eq j lt.eq k - 1$, let
  $ T_(upright(bold(u)) \, upright(bold(v))) = frac(1, A B) sum_(m \, n) upright(bold(1))_(D_(upright(bold(u)) \, upright(bold(v)))) \( m \, n \) e #scale(x: 120%, y: 120%)[\(] Delta_(v_j)^m dots.h.c Delta_(v_1)^m F_(upright(bold(u))) \( m \, n \) #scale(x: 120%, y: 120%)[\)] . $
  To enter this unweighted family, remove $d_(upright(bold(u)))$ by Cauchy–Schwarz in $n$:
  $ lr(|frac(1, A B) sum_(m \, n) d_(upright(bold(u))) \( n \) upright(bold(1))_(D_(upright(bold(u)))) \( m \, n \) e \( F_(upright(bold(u))) \( m \, n \) \)|)^2 lt.eq 1 / B sum_(B lt.eq n < 2 B) lr(|1 / A sum_m upright(bold(1))_(D_(upright(bold(u)))) \( m \, n \) e \( F_(upright(bold(u))) \( m \, n \) \)|)^2 . $
  Expanding the square bounds this by $A^(- 1) sum_(\| v_1 \| < A) \| T_(upright(bold(u)) \, \( v_1 \)) \|$. This is the first $m$-differencing step, so removing the coefficients requires no additional squaring. For $1 lt.eq j lt.eq k - 2$, Cauchy–Schwarz in $n$ and the same square expansion give
  $ \| T_(upright(bold(u)) \, upright(bold(v))) \|^2 lt.eq 1 / A sum_(\| v \| < A) \| T_(upright(bold(u)) \, \( upright(bold(v)) \, v \)) \| . $
  Applying Cauchy–Schwarz also to all existing shift variables, whose total normalized mass is bounded in terms of $k$, now yields
  #[#set math.equation(numbering: n => "(5.11)")
   $ lr(|frac(S, A B)|)^(2^(k + j)) lt.double_k frac(1, B^k A^j) sum_(\| u_1 \| \, dots.h \, \| u_k \| < B\
\| v_1 \| \, dots.h \, \| v_j \| < A) \| T_(upright(bold(u)) \, upright(bold(v))) \| #h(2em) \( 1 lt.eq j lt.eq k - 1 \) . $ <eq:m-difference-stage>]
  This accounts for all $k + \( k - 1 \)$ squarings.
  Take $j = k - 1$. For fixed $n$, the section of $D_(upright(bold(u)) \, upright(bold(v)))$ is an interval of $m$’s, possibly empty. In fact each condition puts $m + eta dot.op upright(bold(v))$ in $\[ A \, 2 A \)$ and its product with the positive number $n + epsilon dot.op upright(bold(u))$ in $I$; it therefore specifies an interval in $m$. Their intersection is an interval of length at most $A$. The final phase $Delta_(v_(k - 1))^m dots.h.c Delta_(v_1)^m F_(upright(bold(u)))$ is linear in $m$ with coefficient
  $ \( k ! \)^2 b_k thin u_1 dots.h.c u_k v_1 dots.h.c v_(k - 1) . $
  A geometric-sum estimate bounds each $m$-sum by the corresponding minimum in (5.9). Summing over at most $B$ values of $n$, the remaining normalized sum is bounded by that minimum divided by $A$. The shifts have normalizing factor $B^(- k) A^(- \( k - 1 \))$, which proves (5.9).
  For (5.8), perform the same square expansion $k - 1$ times in a single variable. The translated intersections of $J$ are intervals of length at most $M$, and the final linear coefficient is $k ! b_k m^k u_1 dots.h.c u_(k - 1)$. The normalizing factor is $M^(- \( k - 1 \))$, followed by $M^(- 1)$ for the final geometric sum. This proves the first bound as well. ◻
]

#proof[
  We now apply the differencing bounds to Vaughan’s decomposition. We first prove the estimate with $Lambda$ in place of $Lambda'$. Put $e_0 = rho \/ \( 100 k \)$ and $Z = Y^(e_0)$. For an arithmetic function $g$, write $g_(lt.eq Z) \( n \) = g \( n \) upright(bold(1))_({ n lt.eq Z })$ and $g_(> Z) = g - g_(lt.eq Z)$. Let $mu$ denote the Möbius function, let $1$ denote the constant arithmetic function, and use $*$ for Dirichlet convolution. Vaughan’s identity, in the form used here, is
  #[#set math.equation(numbering: n => "(5.12)")
   $ Lambda = Lambda_(lt.eq Z) + mu_(lt.eq Z) * log - mu_(lt.eq Z) * Lambda_(lt.eq Z) * 1 + mu_(> Z) * 1 * Lambda_(> Z) . $ <eq:vaughan-identity>]
  This decomposition is classical; see #cite(label("Vaughan1997")) Chapter 3. It follows directly from $log = 1 * Lambda$ and $mu * 1 = upright(bold(1))_({ 1 })$: split $mu$ at $Z$ in $mu * log$, and then split $Lambda$ at $Z$ in the term $mu_(> Z) * 1 * Lambda$.
  #emph[The two sums with a short variable.] The middle two terms of (5.12) reduce to sums with an outer variable $m lt.eq Z^2$ and an inner variable $n lt.eq Y \/ m$. The outer coefficient is either $mu \( m \)$ or $sum_(a b = m \, thin a \, b lt.eq Z) mu \( a \) Lambda \( b \)$, and therefore has size $Y^(o \( 1 \))$. The inner weight is respectively $log n$ or $1$. Fix $m$, let $M = ceil.l Y \/ m ceil.r$, and consider any interval subsum $S_m = sum_(n in J) e \( f \( m n \) \)$ of the inner sum.
  Apply (5.8). For every integer $r$,
  $ min \( M \, parallel k ! b_k r parallel^(- 1) \) lt.eq k ! min \( M \, parallel theta r parallel^(- 1) \) \, $
  since $parallel k ! u parallel lt.eq k ! parallel u parallel$. Tuples with a zero shift contribute $O_k \( M^(- 1) \)$ after normalization. For the others group by $r = m^k \| u_1 dots.h.c u_(k - 1) \| lt.eq m^k M^(k - 1)$ and apply Lemma 16. The divisor bound gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ lr(|S_m / M|)^(2^(k - 1)) lt.double Y^(o \( 1 \)) (1 / M + m^k / q + m^k / M + 1 / M^(k - 1) + q / M^k) . $ <eq:type-one-saving>]
  Here and below logarithmic factors are included in $Y^(o \( 1 \))$. For completeness, the four terms after $1 \/ M$ result from expanding
  $ M^(- k) (frac(m^k M^(k - 1), q) + 1) \( M + q log \( 2 q \) \) . $
  As $m lt.eq Y^(2 e_0)$ and $M gt.eq Y^(1 - 2 e_0)$,
  $ m^k / q \, med q / M^k lt.eq Y^(- rho + 2 k e_0) \, #h(2em) m^k / M lt.eq Y^(- 1 + 2 \( k + 1 \) e_0) . $
  The remaining terms also save a positive power of $Y$. Taking the $2^(k - 1)$-st root in (5.13) therefore gives $S_m lt.double M Y^(- c)$ for some $c = c \( k \, rho \) > 0$, uniformly in the subinterval. Partial summation permits the weight $log n$ with a further $O \( log Y \)$ factor. Since
  $ sum_(m lt.eq Z^2) ceil.l Y \/ m ceil.r lt.double Y log \( 2 Y \) \, $
  both short-variable terms save a fixed power of $Y$ after including the outer coefficients.
  #emph[The bilinear sum.] For the final term of (5.12), group the factors as $\( mu_(> Z) * 1 \) \( m \) Lambda_(> Z) \( n \)$. Each coefficient is $Y^(o \( 1 \))$ when $m n lt.eq Y$, and a nonzero coefficient requires both $m > Z$ and $n > Z$. Partition into dyadic boxes
  $ A lt.eq m < 2 A \, #h(2em) B lt.eq n < 2 B \, #h(2em) A \, B gt.eq Z \/ 2 \, #h(2em) A B lt.eq Y . $
  There are $O \( log^2 \( 2 Y \) \)$ relevant boxes. Divide out the coefficient bounds to reduce to $\| a_m \| \, \| d_n \| lt.eq 1$. If $A B < Y^(1 - e_0)$, the trivial estimate is already sufficient. Otherwise put $R = A^(k - 1) B^k$ and apply (5.9).
  There are $k$ shifts of range $B$ and $k - 1$ of range $A$. Tuples containing a zero shift contribute $O_k \( A^(- 1) + B^(- 1) \)$. Group the others by their nonzero absolute product, at most $R$. Lemma 16 and the divisor bound imply
  #[#set math.equation(numbering: n => "(5.14)")
   $ lr(|frac(S, A B)|)^(2^(2 k - 1)) lt.double Y^(o \( 1 \)) (1 / A + 1 / B + 1 / q + 1 / R + frac(q, A R)) . $ <eq:type-two-saving>]
  Indeed the nonzero-shift bound before expansion is
  $ frac(Y^(o \( 1 \)), A R) \( R \/ q + 1 \) \( A + q log \( 2 q \) \) \; $
  the additional term $O \( log \( 2 q \) \/ A \)$ is included in $Y^(o \( 1 \)) \/ A$. Now $A \, B gt.eq Y^(e_0) \/ 2$, while
  $ A R = \( A B \)^k gt.eq Y^(k \( 1 - e_0 \)) \, #h(2em) frac(q, A R) lt.eq Y^(- rho + k e_0) . $
  Thus (5.14) saves a fixed power. Restoring the coefficients and summing the boxes preserves a positive saving.
  The remaining term $Lambda_(lt.eq Z)$ costs only $O \( Z log \( 2 Z \) \)$. This proves the required estimate for $Lambda$, with some positive exponent depending only on $k \, rho$. Removing higher prime powers costs $O \( Y^(1 \/ 2) log^2 \( 2 Y \) \)$, as in Proposition 14. Decreasing the exponent if necessary gives $c_m in \( 0 \, 1 \/ 4 \)$ and proves (5.5). ◻
]

== 6 A kernel on differences at prime arguments <sec:kernel>

The tuple laws prescribe a distribution of admissible increments along each edge of the distinguished cycle. We now realize its low-denominator Fourier multipliers by a signed kernel supported on polynomial values at prime arguments. This will turn avoidance of those values into cancellation for a pair of Fourier lifts. The kernel comparison adapts the integer-argument method of #cite(label("IntersectivePower")); the unit conditions in its local weights and their realization using prime arguments are the additional ingredients here.

=== 6.1 Parameters and the pair estimate <parameters-and-the-pair-estimate>

Fix the following parameters, all depending only on $h$ and the tuple construction:

#[#set math.equation(numbering: n => "(6.1)")
 $ & eta = frac(1, 10000 k) \, #h(2em) c_m = c_m \( k \, eta \/ 4 \) quad upright("from Proposition ") upright("5.3") \, #h(2em) nu = frac(min \( eta \, c_m \/ k \), 10) \,\
 & beta = nu / 100 \, #h(2em) zeta = nu / 100 \, #h(2em) tau = frac(beta gamma, 1000 k \( d + 1 \)) \, #h(2em) sigma = frac(gamma tau, 4) . $ <eq:parameters>]

Here $eta$ controls the major arcs, $nu$ is a common saving from prime sums, $beta$ controls the Fourier cutoffs, and $zeta$ bounds the auxiliary parameter $l$. The smaller exponents $tau$ and $sigma$ are reserved for the descent in Section 7. The parameter $eta$ is distinct from the exceptional masses $eta_(l \, p)$. For a scale $N$ put

#[#set math.equation(numbering: n => "(6.2)")
 $ Q = N^beta \, #h(2em) H = N^(beta \/ 2) \, #h(2em) cal(P)_N = { p upright(" prime") : P lt.eq p lt.eq Q } . $ <eq:kernel-cutoffs>]

Fix $l gt.eq 1$, write $F = h_l$, and choose a directed cycle edge $v_j arrow.r v_(j + 1)$. For each $p gt.eq P$, let $pi_p$ be the distribution on $bb(F)_p$ of $z_(v_(j + 1)) - z_(v_j)$ under $mu_(l \, p)^compose$. It is supported on admissible residues by Proposition 6. For $v in bb(Z)$ define

$ Gamma_p \( v \/ p \) = sum_(y in bb(F)_p) pi_p \( y \) e \( v y \/ p \) . $

For a nonzero character, the conditional mixing estimate (3.2), applied to the second endpoint and paired with the conjugate character at the first, gives $\| Gamma_p \( v \/ p \) \| lt.eq p^(- gamma)$. If $xi$ has squarefree denominator supported on primes at least $P$, write $xi = sum_(p divides q \( xi \)) xi_p$ for its prime-denominator decomposition and put $Gamma \( xi \) = product_(p divides q \( xi \)) Gamma_p \( xi_p \)$. Thus

#[#set math.equation(numbering: n => "(6.3)")
 $ Gamma \( 0 \) = 1 \, #h(2em) \| Gamma \( xi \) \| lt.eq q \( xi \)^(- gamma) . $ <eq:edge-multiplier-bound>]

The multiplier may depend on $l$ and the chosen edge; all estimates below are uniform in both.

#thm([Proposition 6.1.])[
  (Cancellation for an ordered pair).  #emph[Suppose $N$ is sufficiently large, $l lt.eq N^zeta$, and $D = M_0 product_(p in B) p lt.eq N^beta$, where $B$ is a finite set of primes at least $P$. Let $J_1 \, J_2 : \[ N \] arrow.r bb(C)$ have modulus at most one and be supported on residue classes $a'_1 \, a'_2 med \( mod med D \)$. Assume that $r = a'_2 - a'_1 med \( mod med D \)$ is admissible at $l$ and that 
$ J_1 \( x \) J_2 \( y \) eq.not 0 quad arrow.r.double quad x < y quad upright("and") quad y - x in.not cal(D)_l . $

 Set 
$ Xi = { xi in bb(Q) \/ bb(Z) : q \( xi \) lt.eq H \, med q \( xi \) upright(" squarefree") \, med \( q \( xi \) \, D \) = 1 } . $

 Then, for the multiplier of any directed cycle edge, 
#[#set math.equation(numbering: n => "(6.4)")
 $ D lr(|sum_(xi in Xi) Gamma \( xi \) hat(J_1)_(\[ N \]) \( - xi \) hat(J_2)_(\[ N \]) \( xi \)|) lt.double H^(- gamma \/ 2) . $ <eq:pair-cancellation>]

]
] <prop:pair-cancellation>

Since $M_0$ contains every prime below $P$, the multiplier is defined on all of $Xi$. To prove the proposition, consider the model kernel

#[#set math.equation(numbering: n => "(6.5)")
 $ k_0 \( n \) = D / N thin upright(bold(1))_({ 1 lt.eq n lt.eq N }) upright(bold(1))_({ n equiv r med \( D \) }) sum_(xi in Xi) Gamma \( xi \) e \( - xi n \) . $ <eq:model-kernel>]

We will construct a kernel $k_1$ supported on $cal(D)_l$ such that $sup_alpha \| sum_n \( k_0 \( n \) - k_1 \( n \) \) e \( alpha n \) \| lt.double H^(- gamma \/ 2)$. The congruence restriction in $k_0$ will be imposed on polynomial arguments by a local weight; the factors $Gamma_p$ will be imposed by further weights of mean one.

=== 6.2 Weights on polynomial arguments <weights-on-polynomial-arguments>

For a periodic function of the argument $m$, its #emph[unit mean modulo $b$] is the uniform average over the classes $m med \( mod med b \)$ satisfying $\( T_l \( m \) \, b \) = 1$. There are exactly

#[#set math.equation(numbering: n => "(6.6)")
 $ n_b = b product_(p divides b\
p divides.not l) \( 1 - 1 \/ p \) = frac(phi \( l b \), phi \( l \)) $ <eq:unit-mean-count>]

such classes. Indeed, a prime dividing $l$ excludes no argument because $\( r_l \, l \) = 1$, and any other prime excludes exactly one class modulo that prime. These means factor over prime powers. They are also consistent under replacing $b$ by a multiple: each allowed class has the same number of allowed lifts.

At a prime $p divides D$, choose an argument witnessing admissibility of $r med \( mod med p^(E_p) \)$, and denote the valuation of its derivative by $s_p$. Lemma 4 supplies a class modulo $p^(E_p - s_p)$ on which the unit condition holds and $F$ is constantly $r$ modulo $p^(E_p)$. Uniform argument lifts in this class give uniform higher lifts of that value. Combining the chosen classes gives one class modulo

$ d_r = product_(p divides D) p^(E_p - s_p) divides D . $

Let $rho_D$ be $n_(d_r)$ times its indicator. Then $rho_D$ has unit mean one and $parallel rho_D parallel_oo lt.eq D$.

For every prime $p divides.not D$, necessarily $p gt.eq P$, choose, for each $y$ with $pi_p \( y \) > 0$, one allowed regular argument $x_y med \( mod med p \)$ satisfying $F \( x_y \) = y$. Define a function $psi_p$ modulo $p$ by

$ psi_p \( x_y \) = n_p pi_p \( y \) \, #h(2em) psi_p \( x \) = 0 quad upright("at all other classes") . $

It has unit mean one, and its weighted $F$-value distribution is precisely $pi_p$. Put

$ B_p \( m \) = psi_p \( m \) - 1 \, #h(2em) B_u \( m \) = product_(p divides u) B_p \( m \) \, #h(2em) B_1 = 1 \, $

where $u$ is squarefree and $\( u \, D \) = 1$. Each $B_p$ has unit mean zero, $B_u$ has period $u$, and $\| B_u \| lt.eq u$. In particular these definitions specify the weights also on nonunit arguments; those arguments will have zero main term in the prime-progression estimate.

Expanding a finite product of $psi_p = 1 + B_p$ produces a sum of the $B_u$ over squarefree products of those primes. We retain $u lt.eq H$ to bound the periods of the weights. In a unit average against a rational phase $e \( alpha F \( m \) \)$, any prime factor of $u$ absent from $q \( alpha \)$ makes that term vanish. Thus, when the part of $q \( alpha \)$ supported away from $D$ is at most $H$, the truncation retains every potentially nonzero term of the corresponding product expansion. The comparison below will also bound the contribution from larger denominators.

By Lemma 2, all coefficients of $F$ are $O_h \( a_l \)$. Consequently there is an integer $x_(*) gt.eq 1$, independent of $l$, such that for $x gt.eq x_(*)$,

#[#set math.equation(numbering: n => "(6.7)")
 $ F \( x \) asymp a_l x^k \, #h(2em) F' \( x \) asymp a_l x^(k - 1) \, #h(2em) \| F'' \( x \) \| lt.double a_l x^(k - 2) \, $ <eq:kernel-polynomial-scale>]

with $F \, F'$ positive. Put $U = \( N \/ a_l \)^(1 \/ k)$. Since $a_l$ is a positive integer and $a_l lt.eq a l^k$,

$ U lt.eq N^(1 \/ k) \, #h(2em) U gt.double N^(1 \/ k - zeta) . $

For large $N$ there is therefore a unique $X gt.eq x_(*)$ with $F \( X \) = N$, and $X asymp U$. With $Lambda' \( n \) = \( log n \) upright(bold(1))_({ n upright(" prime") })$, define the signed kernel below. The factor $phi \( l \) \/ l$ compensates for the prime density in the progression $T_l \( m \)$, and $F' \( m \) \/ N$ turns the resulting $m$-integral into normalized measure on the $F$-values:

#[#set math.equation(numbering: n => "(6.8)")
 $ k_1 \( n \) = sum_(x_(*) < m lt.eq X) & upright(bold(1))_({ n = F \( m \) }) frac(F' \( m \), N) frac(phi \( l \), l) Lambda' \( T_l \( m \) \) rho_D \( m \)\
 & #h(15mm)  times sum_(u lt.eq H\
u upright(" squarefree")\
\( u \, D \) = 1) B_u \( m \) . $ <eq:prime-kernel>]

Here and below the argument $m$ is an integer in sums. Every nonzero term has $0 < F \( m \) lt.eq N$ and $T_l \( m \)$ prime, so $k_1$ is supported on $cal(D)_l ∩ \[ N \]$. No positivity is required of $k_1$.

Choose a fixed constant $C$ so that $Y = C l U$ bounds $T_l \( X \)$. The relation $a_l = a l^k \/ lambda \( l \)$ gives

#[#set math.equation(numbering: n => "(6.9)")
 $ Y gt.double N^(1 \/ k) \, #h(2em) Y lt.double N^(1 \/ k + zeta) \, #h(2em) Y^k asymp N lambda \( l \) . $ <eq:prime-kernel-range>]

In particular $Y lt.eq N$ for sufficiently large $N$.

=== 6.3 Uniform Fourier comparison <uniform-fourier-comparison>

For $i = 0 \, 1$ use positive-sign transforms $S_i \( alpha \) = sum_n k_i \( n \) e \( alpha n \)$ on $bb(R) \/ bb(Z)$. The signs differ from the negative-sign convention for Fourier coefficients of functions; this choice makes $S_0$ concentrate at the frequencies occurring in (6.5).

#thm([Lemma 6.2.])[
  (Comparison of the two kernels).  #emph[For the data and ranges of Proposition 18, 
#[#set math.equation(numbering: n => "(6.10)")
 $ sup_(alpha in bb(R) \/ bb(Z)) \| S_0 \( alpha \) - S_1 \( alpha \) \| lt.double H^(- gamma \/ 2) . $ <eq:kernel-comparison>]

]
] <lem:kernel-comparison>

#proof[
  Use major arcs of radius $3 N^(- 1 + eta)$ around the reduced rationals with denominator at most $N^eta$. They are disjoint for large $N$, since $3 eta < 1$. The remaining points form the minor arcs. We first bound both transforms on the minor arcs; on a major arc we will compare their local coefficients.
  Write $V_N \( y \) = N^(- 1) sum_(n in \[ N \]) e \( y n \)$. Expanding the congruence indicator in (6.5) gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ S_0 \( alpha \) = sum_(xi in Xi) sum_(j' med mod med D) Gamma \( xi \) e \( - j' r \/ D \) V_N \( alpha - xi + j' \/ D \) . $ <eq:model-transform>]
  There are $O \( D H^2 \)$ terms. Their centers $xi - j' \/ D$ are distinct: an equality would give a rational with denominator both coprime to $D$ and dividing $D$, and hence an integer. Each center has denominator at most $D H lt.eq N^(3 beta \/ 2) lt.eq N^eta$. On minor arcs, geometric summation therefore gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| S_0 \( alpha \) \| lt.double D H^2 N^(- eta) . $ <eq:model-minor>]
  To estimate $S_1$, first consider, with any linear twist $y'$, the sums
  $ sum_(m in I) Lambda' \( T_l \( m \) \) e \( alpha F \( m \) + y' m \) $
  over subintervals $I$ of $\( x_(*) \, X \]$. On setting $n = T_l \( m \)$, expand the restriction $n equiv r_l med \( mod med l \)$ as the average of its $l$ additive characters. Each resulting prime sum has a polynomial phase in $n$ whose coefficient of $n^k$ is $b_k = alpha a \/ lambda \( l \)$; the new twists change only the linear coefficient because $k gt.eq 2$.
  Fix a representative of $alpha$ and apply Dirichlet approximation to $theta.alt = \( k ! \)^2 b_k$ with
  $ Q_0 = floor.l Y^k N^(- eta \/ 2) floor.r . $
  The resulting reduced fraction $a' \/ q$ satisfies $q lt.eq Q_0$ and $\| theta.alt - a' \/ q \| lt.eq 1 \/ \( q Q_0 \) lt.eq q^(- 2)$. By (6.9), this places $alpha$ within $O \( N^(- 1 + eta \/ 2) \)$ of a rational of denominator at most $\( k ! \)^2 a q$. For a minor-arc point that denominator must exceed $N^eta$ for large $N$. Hence, using $Y lt.eq N$ and absorbing the fixed factor $\( k ! \)^2 a$,
  $ Y^(eta \/ 4) lt.eq q lt.eq Y^(k - eta \/ 4) . $
  Proposition 15 applies uniformly in the linear twists and in the interval, and gives a bound $O \( Y^(1 - c_m) \)$. The relation $Y = C l U$ and the lower bound in (6.9) imply
  $ Y^(1 - c_m) lt.double U thin l N^(- c_m \/ k) lt.eq U N^(zeta - c_m \/ k) lt.double U N^(- nu) . $
  This accounts for the dependence on $l$ before any periodic weight is expanded.
  By (6.7), the supremum and total variation of $F' \/ N$ on $\[ x_(*) \, X \]$ are $O \( U^(- 1) \)$. Partial summation therefore retains an $O \( N^(- nu) \)$ bound after including this weight. Use normalized Fourier coefficients on each finite period for the other weights. Since $rho_D$ is a constant times one residue-class indicator, its Fourier $ell^1$ norm is $n_(d_r) lt.eq D$. For $B_u$ the bound by its period times its supremum gives Fourier $ell^1$ norm at most $u^2$. Expanding the weights in (6.8), and using $phi \( l \) \/ l lt.eq 1$, yields
  #[#set math.equation(numbering: n => "(6.13)")
   $ \| S_1 \( alpha \) \| lt.double D sum_(u lt.eq H) u^2 N^(- nu) lt.double D H^3 N^(- nu) . $ <eq:prime-minor-kernel>]
  The powers in (6.12) and (6.13) are $2 beta - eta$ and $5 beta \/ 2 - nu$, respectively. Both are smaller than $- beta gamma \/ 4$, so these bounds are $O \( H^(- gamma \/ 2) \)$.
  Now let $alpha = alpha_0 + y$ be on a major arc, with $q = q \( alpha_0 \) lt.eq N^eta$ and $\| y \| lt.eq 3 N^(- 1 + eta)$. Decompose $alpha_0 = alpha_D + alpha_1$ into the prime-power denominator parts supported, respectively, on primes dividing $D$ and on primes not dividing $D$. The coefficient in (6.11) belonging to the center $alpha_0$, or zero if that center is absent, is
  #[#set math.equation(numbering: n => "(6.14)")
   $ c_0 \( alpha_0 \) = cases(delim: "{", e \( alpha_D r \) Gamma \( alpha_1 \) \, & q \( alpha_D \) divides D med upright("and") med alpha_1 in Xi \,, 0 \, & upright("otherwise") .) $ <eq:model-local-coefficient>]
  Here the sign follows from $alpha_D = - j' \/ D$ at that center. Every other center is at circle distance at least $1 \/ \( q D H \)$ from $alpha_0$. Since $\| y \| q D H = o \( 1 \)$, geometric summation in each of the $O \( D H^2 \)$ terms gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ S_0 \( alpha \) = c_0 \( alpha_0 \) V_N \( y \) + O \( q D^2 H^3 \/ N \) . $ <eq:model-major>]
  We next derive the corresponding coefficient for $S_1$, including the normalization of the prime weights. For squarefree $u lt.eq H$ coprime to $D$, let $A_u$ be the unit mean of
  $ b_u \( m \) = rho_D \( m \) B_u \( m \) e \( alpha_0 F \( m \) \) . $
  Its period divides $b = q D u$, and $parallel b_u parallel_oo lt.eq D u$. For $x_(*) lt.eq x' < x'' lt.eq X$, Proposition 14 gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ sum_(x' < m lt.eq x'') b_u \( m \) frac(phi \( l \), l) Lambda' \( T_l \( m \) \) = A_u \( x'' - x' \) + O #scale(x: 120%, y: 120%)[\(] q D^2 u^2 Y^(31 \/ 32) log^2 \( 2 l b Y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:weighted-prime-progression>]
  Indeed, one class $m equiv c med \( mod med b \)$ corresponds to the class $r_l + l c med \( mod med l b \)$ in a prime interval of length $l \( x'' - x' \)$. It is reduced exactly when $\( T_l \( c \) \, b \) = 1$, since $\( r_l \, l \) = 1$. For such a class the factor $phi \( l \) \/ l$ changes the prime main term to $\( x'' - x' \) \/ n_b$, by (6.6). On a nonreduced class the only possible primes divide $l b$, and their total logarithmic weight is $O \( log \( l b \) \)$, with zero main term. Apply the progression bound at both endpoints, then sum its errors over at most $b = q D u$ classes with weights of modulus at most $D u$. This proves (6.16), including the nonreduced classes.
  The smooth factor $F' \( x \) e \( y F \( x \) \) \/ N$ has supremum plus total variation
  $ O #scale(x: 120%, y: 120%)[\(] \( 1 + N \| y \| \) \/ U #scale(x: 120%, y: 120%)[\)] . $
  For example, its derivative is bounded in integral by the contributions of $F'' \/ N$ and $2 pi \| y \| \( F' \)^2 \/ N$, which are $O \( U^(- 1) \)$ and $O \( N \| y \| \/ U \)$ by (6.7). Partial summation in (6.16) therefore produces main term
  $ A_u / N integral_(x_(*))^X F' \( x \) e \( y F \( x \) \) thin d x = A_u / N integral_(F \( x_(*) \))^N e \( y t' \) thin d t' . $
  The normalized integral $N^(- 1) integral_(F \( x_(*) \))^N e \( y t' \) thin d t'$ differs from $V_N \( y \)$ by $O \( a_l \/ N + \( 1 + N \| y \| \) \/ N \)$: the missing initial interval has length $F \( x_(*) \) lt.double a_l$, and comparison of the integral on $\[ 0 \, N \]$ with its integer sum costs $O \( 1 + N \| y \| \)$. It follows that
  #[#set math.equation(numbering: n => "(6.17)")
   $ S_1 \( alpha \) = c \( alpha_0 \) V_N \( y \) + O \( H^(- gamma \/ 2) \) \, #h(2em) c \( alpha_0 \) = sum_(u lt.eq H\
u upright(" squarefree")\
\( u \, D \) = 1) A_u . $ <eq:prime-major>]
  Here are the error bounds underlying this assertion. Since $Y^(31 \/ 32) \/ U lt.double l N^(- 1 \/ \( 32 k \))$, the summed progression error is at most
  $ frac(1 + N \| y \|, U) thin q D^2 sum_(u lt.eq H) u^2 Y^(31 \/ 32) N^(o \( 1 \)) lt.double N^(2 eta + 4 beta + zeta - 1 \/ \( 32 k \) + o \( 1 \)) . $
  The replacement of the integrals costs, using $\| A_u \| lt.eq D u$,
  $ O #scale(x: 120%, y: 120%)[\(] D H^2 \( U^(- k) + N^(eta - 1) \) #scale(x: 120%, y: 120%)[\)] lt.double N^(2 beta + k zeta - 1) + N^(2 beta + eta - 1) . $
  The error in (6.15) is at most $N^(eta + 7 beta \/ 2 - 1)$. All three estimates are $O \( N^(- beta gamma \/ 4) \)$: indeed $beta \, zeta lt.eq eta \/ 1000$, $eta = 1 \/ \( 10000 k \)$, and $gamma < 1$. The first exponent has a strict margin, so its $o \( 1 \)$ loss is harmless.
  It remains to compare $c$ and $c_0$. This is precisely the reason for the unit means and the regular argument classes used above. At primes dividing $D$, the common factor in each $A_u$ is
  #[#set math.equation(numbering: n => "(6.18)")
   $ chi_D \( alpha_0 \) = cases(delim: "{", e \( alpha_D r \) \, & q \( alpha_D \) divides D \,, 0 \, & upright("otherwise") .) $ <eq:kernel-D-factor>]
  To see both cases, factor $rho_D$ and the unit mean prime by prime. At $p divides D$ the chosen class has weight of unit mean one and prescribed $F$-value modulo $p^(E_p)$. A character of conductor at most $p^(E_p)$ therefore gives its value at $r$. A primitive character of higher conductor averages to zero, since Lemma 4 gives uniform higher lifts of $F$ on that class, all still satisfying the unit condition.
  Put $q_1 = q \( alpha_1 \)$. If $u$ has a prime factor outside $q_1$, its local $B_p$ factor has unit mean zero and $A_u = 0$. For $p^j bar.v.double q_1$, write $alpha_p$ for the $p^j$-part of $alpha_1$ and let
  $ a_(p \, j) = bb(E)_(m med mod med p^j\
p divides.not T_l \( m \)) e \( alpha_p F \( m \) \) \, #h(2em) b_(p \, j) = bb(E)_(m med mod med p^j\
p divides.not T_l \( m \)) B_p \( m \) e \( alpha_p F \( m \) \) . $
  The surviving $A_u$, for squarefree divisors $u$ of $q_1$, are $chi_D \( alpha_0 \)$ times products that choose $b_(p \, j)$ when $p divides u$ and $a_(p \, j)$ otherwise. Moreover,
  #[#set math.equation(numbering: n => "(6.19)")
   $ a_(p \, j) + b_(p \, j) = cases(delim: "{", Gamma_p \( alpha_p \) \, & j = 1 \,, 0 \, & j gt.eq 2 .) $ <eq:kernel-local-realization>]
  For $j = 1$, the weight $1 + B_p = psi_p$ pushes the unit mean forward to $pi_p$. For $j gt.eq 2$, it is supported on allowed regular classes modulo $p$, and their uniform argument lifts give uniform lifts of the $F$-value. The primitive character therefore has mean zero.
  If $q_1 lt.eq H$, every squarefree divisor needed in the product expansion occurs in the sum for $c$. Thus (6.19) and (6.18) show that $c = c_0$, including the case of a nonsquarefree $q_1$, when both vanish. If $q_1 > H$, the model coefficient is zero. Lemma 3 gives $\| a_(p \, j) \| lt.eq p^(- 8 delta j)$, while (6.3) and (6.19) give $\| b_(p \, j) \| lt.eq 2 p^(- gamma j)$ (for $j gt.eq 2$ one has $b_(p \, j) = - a_(p \, j)$). Bounding the truncated product expansion by the full sum of absolute values, and using (3.15), we obtain
  $ \| c \( alpha_0 \) \| lt.eq product_(p^j bar.v.double q_1) \( \| a_(p \, j) \| + \| b_(p \, j) \| \) lt.eq product_(p^j bar.v.double q_1) 3 p^(- gamma j) lt.eq q_1^(- gamma \/ 2) < H^(- gamma \/ 2) . $
  Indeed $p^(gamma \/ 2) gt.eq 3$, so each factor is at most $p^(- gamma j \/ 2)$. Together with (6.15) and (6.17), this proves the comparison on major arcs. The minor-arc bounds already proved complete the lemma. ◻
]

#proof[
  Extend $J_1 \, J_2$ by zero to $bb(Z)$ and put
  $ cal(B)_i = 1 / N sum_(x \, n in bb(Z)) k_i \( n \) J_1 \( x \) J_2 \( x + n \) \, #h(2em) i = 0 \, 1 . $
  To keep track of signs and normalizations, let $tilde(J)_i \( alpha \) = sum_x J_i \( x \) e \( - alpha x \)$, with counting measure in this transform. Character orthogonality gives
  $ cal(B)_i = 1 / N integral_(bb(R) \/ bb(Z)) S_i \( alpha \) tilde(J)_1 \( - alpha \) tilde(J)_2 \( alpha \) thin d alpha . $
  Both counting-measure $ell^2$ norms are at most $sqrt(N)$. Cauchy–Schwarz, Plancherel, and Lemma 19 therefore imply $\| cal(B)_1 - cal(B)_0 \| lt.double H^(- gamma \/ 2)$. The forbidden-support hypothesis gives $cal(B)_1 = 0$. For every contributing pair in $cal(B)_0$, the ordering and the residue classes imply $1 lt.eq n lt.eq N$ and $n equiv r med \( mod med D \)$. Substituting (6.5) and setting $y = x + n$ thus yields
  $ cal(B)_0 = D / N^2 sum_(xi in Xi) Gamma \( xi \) sum_(x \, y) J_1 \( x \) J_2 \( y \) e \( - xi \( y - x \) \) = D sum_(xi in Xi) Gamma \( xi \) hat(J_1)_(\[ N \]) \( - xi \) hat(J_2)_(\[ N \]) \( xi \) . $
  This is exactly (6.4). ◻
]

== 7 Descent to shorter intervals <sec:descent>

We now combine the pair cancellation estimate with the seminorm furnished by the tuple laws. The quantity to be decreased is a diagonal tuple integral of a Fourier lift. Restriction to progressions compares this quantity with the same quantity on shorter intervals; avoidance makes a fixed proportion of the residue assignments cancel, apart from the small exceptional measures. This is the recurrence method of #cite(label("IntersectivePower")), adapted here to preserve the prime argument condition throughout the auxiliary family.

All structural parameters, including $M_0 \, d \, gamma$ and those in (6.1), remain fixed. At every integer scale $N gt.eq 1$ we use $cal(P)_N \, Q \, H$ from (6.2). For $l gt.eq 1$ and $A subset.eq \[ N \]$, define

#[#set math.equation(numbering: n => "(7.1)")
 $ Y_l \( N \, A \) & = Z_(l \, cal(P)_N) #scale(x: 120%, y: 120%)[\(] cal(L)_(\[ N \] \, cal(P)_N \, Q) upright(bold(1))_A #scale(x: 120%, y: 120%)[\)] \,\
cal(Y)_l \( N \) & = max_(A subset.eq \[ N \]\
A upright(" avoiding at ") l) Y_l \( N \, A \) . $ <eq:descent-quantity>]

Here $Y_l$ is unrelated to the prime-sum range $Y$ used in the preceding section. Lemma 9 and the constant Fourier coefficient of the lift give the first bound in

#[#set math.equation(numbering: n => "(7.2)")
 $ (frac(\| A \|, N))^d lt.eq Y_l \( N \, A \) \, #h(2em) 0 lt.eq cal(Y)_l \( N \) lt.double N^(o \( 1 \)) . $ <eq:descent-trivial>]

For the upper bound, ordinary Hölder with the uniform single-slot marginals gives $Z_(l \, cal(P)_N) \( g \) lt.eq parallel g parallel_d^d$. Apply Proposition 11; its length hypothesis holds for large $N$ since $6 beta < 1$. For bounded $N$, bounding each term of the finite Fourier sum gives the same uniform conclusion. In particular, the upper bound in (7.2) holds for every $l gt.eq 1$, with no restriction of the form $l lt.eq N^zeta$.

For each $s med mod med M_0$ put

$ f_s \( x \) = M_0 upright(bold(1))_A \( x \) upright(bold(1))_({ x equiv s med \( mod med M_0 \) }) \, #h(2em) G_s = cal(L)_(\[ N \] \, cal(P)_N \, Q) f_s . $

Averaging $f_s$ over uniform $s$ gives $upright(bold(1))_A$. Thus, for independent uniform residues $s_v med mod med M_0$ indexed by $v in V$, multilinearity gives

#[#set math.equation(numbering: n => "(7.3)")
 $ Y_l \( N \, A \) = bb(E)_(\( s_v \)_(v in V)) cal(Z)_(l \, cal(P)_N) \( \( G_(s_v) \)_(v in V) \) . $ <eq:residue-average>]

We shall bound these integrals in two ways. The comparison with shorter intervals holds for every $l$; cancellation will require the analytic range $l lt.eq N^zeta$.

=== 7.1 Specialization and progression coordinates <specialization-and-progression-coordinates>

Fixing prime coordinates of a lift restricts its underlying set to a residue class, provided the remaining Fourier denominator is sufficiently small. The following exact formula records the normalization.

#thm([Lemma 7.1.])[
  (Residue specialization).  #emph[Let $N gt.eq 1$, $A subset.eq \[ N \]$, $s med mod med M_0$, and let $I subset.eq \[ N \]$ be a nonempty consecutive interval. Let $B subset.eq cal(P)_N$, write $q_B = product_(p in B) p$, $D = M_0 q_B$, and $cal(S) = cal(P)_N \\ B$. Fix the coordinates indexed by $B$ of $cal(L)_(I \, cal(P)_N \, Q) f_s$ at $b = \( b_p \)_(p in B)$, obtaining $g_I : X_(cal(S)) arrow.r bb(R)$. Let $a' med mod med D$ be the unique residue satisfying $a' equiv s med \( mod med M_0 \)$ and $a' equiv b_p med \( mod med p \)$ for $p in B$. Then every frequency $xi$ on $X_(cal(S))$ with $q \( xi \) q_B lt.eq Q$ satisfies 
#[#set math.equation(numbering: n => "(7.4)")
 $ hat(g_I) \( xi \) = frac(D, \| I \|) sum_(x in I\
x equiv a' med \( mod med D \)) upright(bold(1))_A \( x \) e \( - x xi \) . $ <eq:residue-specialization>]

]
] <lem:residue-specialization>

#proof[
  The coefficient on the left is the sum of $hat(f_s)_I \( xi + omega \) e \( b omega \)$ over the frequencies $omega$ on $X_B$ retained by the lift. The denominator condition retains every $omega$, because $q \( xi + omega \) = q \( xi \) q \( omega \) lt.eq Q$. Orthogonality of these $q_B$ characters imposes $x equiv b_p med \( mod med p \)$ for every $p in B$ and contributes the factor $q_B$. Together with the factor $M_0$ in $f_s$, this gives (7.4). ◻
]

#thm([Proposition 7.2.])[
  (Comparison with shorter intervals).  #emph[For all sufficiently large $N$, every $l gt.eq 1$, and every set $A subset.eq \[ N \]$ avoiding at $l$, the following holds. Let $B subset.eq cal(P)_N$ satisfy $q_B lt.eq N^tau$, and put 
$ D = M_0 q_B \, #h(2em) L_D = lambda \( D \) \, #h(2em) n_B = ⌈N / L_D⌉ \, #h(2em) Lambda_B = frac(L_D n_B, N) \, #h(2em) cal(S) = cal(P)_N \\ B . $

 For each $v in V$, choose $s_v med mod med M_0$ and fix the $B$-coordinates of $G_(s_v)$ arbitrarily, obtaining $g_v : X_(cal(S)) arrow.r bb(R)$. Then 
#[#set math.equation(numbering: n => "(7.5)")
 $ \| cal(Z)_(l \, cal(S)) \( \( g_v \)_(v in V) \) #scale(x: 120%, y: 120%)[\|] lt.eq Lambda_B^d cal(Y)_(l D) \( n_B \) + O \( N^(- sigma) \) \, $ <eq:shorter-scale>]

 uniformly in all these choices. The new scale and normalization satisfy 
#[#set math.equation(numbering: n => "(7.6)")
 $ N^(1 \/ 2) lt.eq M_0^(- k) N^(1 - k tau) lt.eq n_B < N \, #h(2em) 1 lt.eq Lambda_B lt.eq 1 + M_0^k N^(k tau - 1) . $ <eq:shorter-scale-size>]

]
] <prop:shorter-scale>

#proof[
  The scale bounds follow from $D lt.eq L_D lt.eq D^k$ and $M_0 gt.eq 2$; their first inequality holds for sufficiently large $N$ because $k tau < 1 \/ 2$. In particular, with $Q' = n_B^beta$,
  #[#set math.equation(numbering: n => "(7.7)")
   $ H lt.eq Q' lt.eq Q . $ <eq:shorter-cutoffs>]
  By Proposition 8, it is enough to prove (7.5) for $Z_(l \, cal(S)) \( g \)$, where $g$ is any one of the specialized inputs.
  First keep only the frequencies of $g$ with denominator at most $H$, and call the resulting real function $g_(lt.eq H)$. Telescope the diagonal integral one slot at a time. Lemma 10, followed by Proposition 11 and Lemma 12, bounds the change by
  #[#set math.equation(numbering: n => "(7.8)")
   $ \| Z_(l \, cal(S)) \( g \) - Z_(l \, cal(S)) \( g_(lt.eq H) \) #scale(x: 120%, y: 120%)[\|] lt.double H^(- gamma) q_B N^(o \( 1 \)) = O \( N^(- sigma) \) . $ <eq:specialization-tail>]
  Indeed specialization costs $q_B^(1 \/ 2)$ in the $L^2$ norm of the removed part, and $q_B^(1 \/ \( 2 \( d - 1 \) \))$ in each of the other $d - 1$ norms. Their product is $q_B$. All frequency selections retain whole exact supports before specialization, as required by the moment bound. Here $N gt.eq 10 Q^6$ for large $N$, and the saving follows from $beta gamma \/ 2 - tau > sigma$.
  The auxiliary-family identity transports avoidance along progressions of step $L_D = lambda \( D \)$. Since $D divides L_D$, we split the prescribed class modulo $D$ into its $L_D \/ D$ classes modulo $L_D$. Let $a' med mod med D$ be the class determined by this specialization. For $j in \[ L_D \]$ with $j equiv a' med \( mod med D \)$, set
  $ c_j = j - L_D \, #h(2em) A'_j = { x' in \[ n_B \] : L_D x' + c_j in A } \, #h(2em) cal(H)_j = cal(L)_(\[ n_B \] \, cal(S) \, H) upright(bold(1))_(A'_j) . $
  Every integer of $A$ in the class $a' med mod med D$ has a unique representation $L_D x' + c_j$ of this form: take $j$ to be its representative in $\[ L_D \]$. The definition by membership in $A$ excludes any surplus points beyond $N$ in these progressions.
  Each $A'_j$ avoids at $l D$. More explicitly, a nonzero difference $h_(l D) \( m \)$ with $m gt.eq 1$ and $T_(l D) \( m \)$ prime would give the difference $lambda \( D \) h_(l D) \( m \) = h_l \( D m - i \)$ in $A$, where $0 lt.eq i < D$ is supplied by (2.3). We have $D m - i gt.eq 1$ and $T_l \( D m - i \) = T_(l D) \( m \)$, so this would violate avoidance at $l$. The nonzero condition is preserved because $lambda \( D \) > 0$.
  Since $q_B H lt.eq Q$, Lemma 20 now gives the exact identity
  #[#set math.equation(numbering: n => "(7.9)")
   $ g_(lt.eq H) \( z \) = frac(Lambda_B, L_D \/ D) sum_(j in \[ L_D \]\
j equiv a' med \( mod med D \)) cal(H)_j #scale(x: 120%, y: 120%)[\(] L_D^(- 1) \( z - c_j \) #scale(x: 120%, y: 120%)[\)] . $ <eq:progression-fibers>]
  To check it, every prime divisor of $L_D$ divides $D$, so multiplication by $L_D$ is invertible on $X_(cal(S))$ and preserves Fourier denominators. For $q \( xi \) lt.eq H$, the coefficient of the $j$th summand at $xi$ is $hat(cal(H)_j) \( L_D xi \) e \( - c_j xi \)$. Multiplication by the prefactor $Lambda_B \/ \( L_D \/ D \) = D n_B \/ N$ and summation over $j$ therefore gives $\( D \/ N \) sum_(x in A \, med x equiv a' med \( D \)) e \( - x xi \)$, which is exactly the coefficient in (7.4) for $I = \[ N \]$. Both sides of (7.9) have zero coefficients at denominators greater than $H$.
  There are $L_D \/ D$ summands. The triangle inequality from Lemma 9 and its transport identity (4.3) imply
  #[#set math.equation(numbering: n => "(7.10)")
   $ Z_(l \, cal(S)) \( g_(lt.eq H) \) lt.eq Lambda_B^d max_j Z_(l D \, cal(S)) \( cal(H)_j \) . $ <eq:fiber-seminorm>]
  Increase the cutoff in $cal(H)_j$ from $H$ to $Q'$. The same large-denominator argument, now without specialization, changes its diagonal integral by $O \( H^(- gamma) N^(o \( 1 \)) \) = O \( N^(- sigma) \)$. The moment hypothesis is valid at the new scale: $n_B gt.eq 10 \( Q' \)^6$ for large $N$, by $6 beta < 1$ and (7.6).
  The extended lift is obtained from $cal(L)_(\[ n_B \] \, cal(P)_(n_B) \, Q') upright(bold(1))_(A'_j)$ by averaging out its coordinates in $B ∩ cal(P)_(n_B)$ and adding unused coordinates in $cal(S) \\ cal(P)_(n_B)$. Averaging contracts the seminorm, and adding unused coordinates does not change it, by Lemma 9. Consequently its diagonal integral is at most $Y_(l D) \( n_B \, A'_j \) lt.eq cal(Y)_(l D) \( n_B \)$. Combining this observation with (7.8) and (7.10) proves the diagonal bound, hence the stated multilinear bound. None of these steps restricts the size of $l$. ◻
]

=== 7.2 Cancellation for admissible residue assignments <cancellation-for-admissible-residue-assignments>

The preceding proposition controls every assignment in (7.3). We now obtain a stronger bound for those assignments whose cycle increments can occur as local polynomial values. Call $\( s_v \)_(v in V)$ #emph[good at $l$] if every $s_(v_(j + 1)) - s_(v_j)$, $0 lt.eq j < L$, is admissible modulo $M_0$ at $l$. Let $rho_l$ be the proportion of good assignments. The zero-sum admissible sequences of Lemma 5 give

#[#set math.equation(numbering: n => "(7.11)")
 $ rho_l gt.eq rho_(*) := M_0^(1 - L) > 0 . $ <eq:good-proportion>]

Indeed combine such a sequence at each prime power dividing $M_0$ by the Chinese remainder theorem. After prescribing these $L$ increments, the initial cycle residue and every residue off the cycle are free.

#thm([Proposition 7.3.])[
  (Cancellation on the nonexceptional laws).  #emph[For all sufficiently large $N$, all $1 lt.eq l lt.eq N^zeta$, every $A subset.eq \[ N \]$ avoiding at $l$, and every good assignment $\( s_v \)_(v in V)$, 
#[#set math.equation(numbering: n => "(7.12)")
 $ lr(|integral product_(v in V) G_(s_v) \( z_v \) thin d ⨂_(p in cal(P)_N) \( mu_(l \, p) - epsilon_(l \, p) \)|) lt.double N^(- sigma) . $ <eq:descent-cancellation>]

 The implied constant is uniform in $l$, $A$, and the assignment.]
] <prop:descent-cancellation>

#proof[
  The aim is to leave just the two endpoint lifts on an ordered cycle edge. We first average over short intervals, then truncate and expand the other inputs. Each expansion term uses prime coordinates with small product; conditioning on those coordinates leaves the pair to which Proposition 18 applies.
  It suffices to use the probability laws $mu_(l \, p)^compose$, since restoring the omitted masses multiplies the integral by $product_p \( 1 - eta_(l \, p) \) lt.eq 1$. Partition $\[ N \]$ into $m = floor.l N^tau floor.r$ consecutive intervals of lengths as equal as possible. Each $G_s$ is the weighted average of $cal(L)_(I \, cal(P)_N \, Q) f_s$ over these intervals, with weights $\| I \| \/ N$. Thus the integral is an average over independently chosen intervals for all slots. Their lengths are comparable to $N^(1 - tau)$, so the lift moment bound applies because $6 beta + tau < 1$. Ordinary Hölder and uniform marginals bound every interval assignment by $N^(o \( 1 \))$ in absolute value.
  The probability that all $L$ cycle slots use the same interval is $sum_I \( \| I \| \/ N \)^L = O \( N^(- \( L - 1 \) tau) \)$. These assignments contribute $O \( N^(- sigma) \)$. For any remaining assignment, the cyclic sequence of interval indices is nonconstant, and hence has a strict increase along some directed cycle edge. Choose such an edge, with first endpoint in $I_1$ and second endpoint in the later interval $I_2$.
  Keep the two endpoint lifts unchanged and truncate every other lift to denominators at most $T = N^tau$. Telescoping with Lemma 10 and the lift moment bound costs $O \( T^(- gamma) N^(o \( 1 \)) \) = O \( N^(- sigma) \)$. Expand the truncated $d - 2$ inputs into characters. Their coefficients have absolute value at most $M_0$, and each input has $O \( T^2 \)$ frequencies, so the sum of absolute coefficients in this product expansion is $O \( T^(2 \( d - 2 \)) \)$.
  Fix one term. Let $B$ be the union of the prime supports of its characters and write
  $ R = q_B lt.eq T^(d - 2) \, #h(2em) D = M_0 R \, #h(2em) cal(S) = cal(P)_N \\ B . $
  Condition on the entire tuple of labels at every prime in $B$, taking any conditioning with positive probability under the product of the $mu_(l \, p)^compose$. The expanded characters become constants of modulus one. The specialized endpoint lifts give functions $g_1 \, g_2$ on $X_(cal(S))$, and the laws at primes in $cal(S)$ remain unchanged. Translation invariance shows that their pair integral is
  #[#set math.equation(numbering: n => "(7.13)")
   $ sum_(xi upright(" on ") X_(cal(S))) hat(g)_1 \( - xi \) hat(g)_2 \( xi \) Gamma \( xi \) \, $ <eq:conditioned-pair>]
  where $Gamma$ is the multiplier for this directed cycle edge. Indeed only opposite characters survive common translation, and their product is the character of the second label minus the first. By (6.3), Parseval, and the specialized moment bound, the part with $q \( xi \) > H$ is at most
  #[#set math.equation(numbering: n => "(7.14)")
   $ H^(- gamma) parallel g_1 parallel_2 parallel g_2 parallel_2 lt.double H^(- gamma) R N^(o \( 1 \)) . $ <eq:conditioned-pair-tail>]
  For the remaining frequencies, $H R lt.eq Q$ and $D lt.eq N^beta$ for large $N$, since $\( d - 2 \) tau < beta \/ 2$. Apply Lemma 20 to the endpoint lifts, obtaining classes $a'_1 \, a'_2 med mod med D$. Their directed difference is admissible at $l$: goodness supplies admissibility modulo $M_0$, and the cycle property of $mu_(l \, p)^compose$ supplies it at the conditioned primes $p in B$. Set
  $ J_i = upright(bold(1))_A upright(bold(1))_(I_i) upright(bold(1))_({ x equiv a'_i med \( mod med D \) }) \, #h(2em) i = 1 \, 2 \, $
  as functions on $\[ N \]$. Every contributing pair $x \, y$ has $x < y$ because $I_1$ precedes $I_2$. Avoidance therefore gives $y - x in.not cal(D)_l$. All hypotheses of Proposition 18 hold. Its frequency set $Xi$ is exactly the remaining frequencies on $X_(cal(S))$ with denominator at most $H$: coprimality with $D$ excludes the primes below $P$ and the primes in $B$, while every prime in a denominator at most $H$ is at most $Q$. The coefficient identity becomes
  $ hat(g)_i \( xi \) = frac(D N, \| I_i \|) hat(J_i)_(\[ N \]) \( xi \) #h(2em) \( q \( xi \) lt.eq H \) . $
  Consequently (6.4) bounds the low-denominator part of (7.13) by
  #[#set math.equation(numbering: n => "(7.15)")
   $ O (H^(- gamma \/ 2) D frac(N^2, \| I_1 \| \| I_2 \|)) = O \( H^(- gamma \/ 2) D N^(2 tau) \) . $ <eq:conditioned-pair-main>]
  After multiplication by the expansion bound $O \( T^(2 \( d - 2 \)) \)$, both (7.14) and (7.15) are bounded by
  $ N^(- beta gamma \/ 4 + \( 3 d + 2 \) tau + o \( 1 \)) = O \( N^(- sigma) \) \, $
  since (6.1) gives $beta gamma \/ 4 > \( 3 d + 2 \) tau + sigma$. These estimates are uniform in the conditioning, in the selected edge, and in the interval assignment. Averaging, and including the earlier truncation and coincident-interval errors, proves the proposition. ◻
]

=== 7.3 The contracting recurrence <the-contracting-recurrence>

We have obtained cancellation after removing the exceptional part of every local law. To return to the full laws in (7.3), we expand that removal. The total mass of the resulting exceptional terms is small enough to pay for their possibly shorter progression scales. For $B subset.eq cal(P)_N$ write

$ eta_(l \, B) = product_(p in B) eta_(l \, p) \, #h(2em) D_B = M_0 q_B \, #h(2em) n_B = ⌈frac(N, lambda \( D_B \))⌉ . $

Thus $D_diameter = M_0$. The mass estimate in Proposition 6 and the fixed choice of $P$ give, uniformly in $l$,

#[#set math.equation(numbering: n => "(7.16)")
 $ sum_(diameter eq.not B subset.eq cal(P)_N) q_B eta_(l \, B) lt.eq product_(p gt.eq P) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 . $ <eq:exceptional-budget>]

#thm([Proposition 7.4.])[
  (Recurrence).  #emph[There is a constant $C_1$ such that for every sufficiently large $N$ and $1 lt.eq l lt.eq N^zeta$, 
#[#set math.equation(numbering: n => "(7.17)")
 $ cal(Y)_l \( N \) lt.eq  & C_1 N^(- sigma) + \( 1 + u_N \) #scale(x: 240%, y: 240%)[\[] \( 1 - rho_l \) cal(Y)_(l M_0) \( n_diameter \)\
 & #h(12mm)  + rho_l sum_(diameter eq.not B subset.eq cal(P)_N\
q_B lt.eq N^tau) eta_(l \, B) cal(Y)_(l D_B) \( n_B \) #scale(x: 240%, y: 240%)[\]] \,\
u_N =  & \( 1 + M_0^k N^(k tau - 1) \)^d - 1 = o \( 1 \) . $ <eq:descent-recurrence>]

 The constant and the sufficiently-large threshold are independent of $l$.]
] <prop:descent-recurrence>

#proof[
  Fix an avoiding set $A$. For assignments in (7.3) that are not good, apply Proposition 21 with $B = diameter$. Their proportion is $1 - rho_l$. For a good assignment, Proposition 22 handles the product of the measures $mu_(l \, p) - epsilon_(l \, p)$. The difference from the full product is
  $ ⨂_(p in cal(P)_N) mu_(l \, p) - ⨂_(p in cal(P)_N) \( mu_(l \, p) - epsilon_(l \, p) \) = sum_(diameter eq.not B subset.eq cal(P)_N) \( - 1 \)^(\| B \| + 1) (⨂_(p in B) epsilon_(l \, p)) ⊗ (⨂_(p in.not B) mu_(l \, p)) . $
  The positive product measure in the $B$th summand has mass $eta_(l \, B)$. If this mass is zero the term vanishes. Otherwise, after normalization, every single-slot marginal is uniform by simultaneous translation invariance. Hölder and Proposition 11 thus bound its integral by $N^(o \( 1 \))$ in absolute value. The terms with $q_B > N^tau$ have total mass at most $N^(- tau) \/ 4$ by (7.16), and hence contribute $O \( N^(- sigma) \)$.
  For $q_B lt.eq N^tau$, condition on all labels at the primes in $B$. The remaining law is the product of the full measures $mu_(l \, p)$, so Proposition 21 applies to the specialized inputs. Its factor $Lambda_B^d$ is at most $1 + u_N$ by (7.6), and its errors sum to $O \( N^(- sigma) \)$ by (7.16). Taking absolute upper bounds in the signed expansion and averaging over the good assignments gives their contribution in (7.17). Finally maximize over $A$ in (7.3). ◻
]

=== 7.4 Uniform induction and the density bound <uniform-induction-and-the-density-bound>

The recurrence uses prime estimates only when $l lt.eq N^zeta$, but its successors $l D_B$ need not lie in the corresponding analytic range at $n_B$. We therefore prove a bound simultaneously for every auxiliary parameter $l$. The factor $l^(b_0)$ below covers the complementary range by the elementary bound (7.2).

#thm([Proposition 7.5.])[
  (Uniform power decay).  #emph[There are constants $a_0 \, b_0 > 0$ and $C_0 gt.eq 1$, depending only on $h$, such that for all integers $l \, N gt.eq 1$, 
#[#set math.equation(numbering: n => "(7.18)")
 $ cal(Y)_l \( N \) lt.eq C_0 l^(b_0) N^(- a_0) . $ <eq:uniform-descent>]

]
] <prop:uniform-descent>

#proof[
  After all parameters in (6.1) have been fixed, choose $a_0 > 0$ sufficiently small and put $b_0 = 2 a_0 \/ zeta$, so that
  #[#set math.equation(numbering: n => "(7.19)")
   $ a_0 < sigma \, #h(2em) s_0 := k a_0 + b_0 lt.eq 1 \, #h(2em) theta_0 := M_0^(s_0) \( 1 - 3 rho_(*) \/ 4 \) < 1 . $ <eq:induction-parameters>]
  This is possible because $s_0 arrow.r 0$ with $a_0$ while $rho_(*) > 0$ is fixed. If $l > N^zeta$, then
  $ l^(b_0) N^(- a_0) gt.eq N^(a_0) . $
  The estimate (7.2), used with exponent $a_0$, proves (7.18) in this range after a fixed enlargement of $C_0$. This treats all such $l \, N$ before the induction.
  For the remaining pairs, induct on the integer $N$, simultaneously for all $l gt.eq 1$. At a sufficiently large scale with $l lt.eq N^zeta$, every successor in (7.17) satisfies $n_B < N$ by (7.6). The induction hypothesis is available at $l D_B$ whether or not that parameter satisfies $l D_B lt.eq n_B^zeta$. Since $n_B gt.eq N \/ D_B^k$, it gives
  $ cal(Y)_(l D_B) \( n_B \) lt.eq C_0 \( l D_B \)^(b_0) n_B^(- a_0) lt.eq C_0 l^(b_0) N^(- a_0) D_B^(s_0) . $
  Use $q_B^(s_0) lt.eq q_B$ and (7.16) to bound the bracket in (7.17) by
  $ C_0 l^(b_0) N^(- a_0) M_0^(s_0) #scale(x: 120%, y: 120%)[\(] 1 - rho_l + rho_l \/ 4 #scale(x: 120%, y: 120%)[\)] & lt.eq C_0 l^(b_0) N^(- a_0) theta_0 \, $
  where (7.11) was used in the last step. Choose a fixed threshold $N_(*)$, large enough for the recurrence and for
  $ C_1 N^(a_0 - sigma) + \( 1 + u_N \) theta_0 lt.eq 1 #h(2em) \( N gt.eq N_(*) \) . $
  Such a threshold exists by (7.19) and $u_N = o \( 1 \)$; it is independent of $C_0 gt.eq 1$. Dividing the recurrence by $C_0 l^(b_0) N^(- a_0)$ now proves the induction step, since $C_0 l^(b_0) gt.eq 1$. Finally choose $C_0$ large enough to cover both the previously treated range $l > N^zeta$ and every $N < N_(*)$, uniformly in $l$, by (7.2). This completes the induction. ◻
]

#proof[
  At $l = 1$ we have $T_1 \( m \) = m$ and $h_1 = h$, so the hypothesis of the theorem is exactly avoidance at $l = 1$. Combining (7.2) with (7.18) gives
  $ (frac(\| A \|, N))^d lt.eq C_0 N^(- a_0) \, #h(2em) \| A \| lt.eq C_0^(1 \/ d) N^(1 - a_0 \/ d) . $
  Thus one may take $c_h = a_0 \/ d$ and $C_h = C_0^(1 \/ d)$, for every $N gt.eq 1$. Only strictly ordered pairs, and hence positive differences, were used in cancellation. Restriction to progressions preserved nonzero forbidden values and their prime arguments. A value $h \( p \) = 0$ therefore imposes no additional condition at any stage. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
