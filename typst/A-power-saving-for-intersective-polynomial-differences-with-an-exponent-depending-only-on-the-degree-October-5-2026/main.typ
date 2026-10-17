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

#align(center)[#text(size: 16pt, weight: "bold")[A power saving for intersective polynomial differences \
with an exponent depending only on the degree]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

For a polynomial $h in bb(Z) \[ x \]$, consider how large a set of integers can be if no difference between two of its elements is a nonzero value of $h$. Write $bb(N)_(+) = { 1 \, 2 \, dots.h }$, $\[ N \] = { 1 \, dots.h \, N }$, and $A - A = { a - b : a \, b in A }$. We call $h$ #emph[intersective] if, for every integer $q gt.eq 1$, some integer $t$ satisfies $h \( t \) equiv 0 med \( mod med q \)$. This is the necessary local condition for polynomial differences in every set of positive density: if $h$ has no root modulo $q$, the multiples of $q$ contain no difference in $h \( bb(N)_(+) \)$. The condition allows the roots at different moduli to arise from different factors of $h$; a rational root is not required.

#thm([Theorem 1.1.])[
  #emph[For every integer $k gt.eq 2$, there is a constant $c_k in \( 0 \, 1 \)$ with the following property. For every intersective polynomial $h in bb(Z) \[ x \]$ of degree $k$ with positive leading coefficient, there are a constant $C_h gt.eq 1$ and an integer $N_h gt.eq 1$ such that, whenever $N gt.eq N_h$ and $A subset.eq \[ N \]$ satisfy 
$ \( A - A \) ∩ h \( bb(N)_(+) \) subset.eq { 0 } \, $

 one has 
$ \| A \| lt.eq C_h N^(1 - c_k) . $

]
] <thm:main>

The exponent is common to all polynomials of a fixed degree. The constants $C_h \, N_h$ may depend on every coefficient of $h$, and $h$ remains fixed as $N$ grows. The theorem concerns ordinary integer differences; zero values of $h$ impose no restriction on $A$.

=== 1.1 History and relation to earlier work <history-and-relation-to-earlier-work>

Furstenberg #cite(label("Furstenberg1977")) and Sárközy #cite(label("Sarkozy1978")) proved that every set of positive upper density contains two elements whose difference is a nonzero square. Their proofs introduced distinct ergodic and Fourier-analytic approaches to this recurrence problem. Kamae and Mendès France #cite(label("KamaeMendesFrance1978")) extended the positive-density conclusion to nonconstant intersective polynomials. Together with the elementary congruence obstruction above, this identifies the exact class of nonconstant polynomials for which the density of an avoiding set must tend to zero.

The quantitative problem has driven successive refinements of Fourier density-increment methods. For square differences, Pintz, Steiger, and Szemerédi #cite(label("PintzSteigerSzemeredi1988")) introduced a substantially stronger iteration. Bloom and Maynard #cite(label("BloomMaynard2022")) later obtained the bound

$ \| A \| lt.double N \( log N \)^(- c log log log N) $

using estimates for the additive energy of rational numbers. For general intersective polynomials, Lucier #cite(label("Lucier2006")) established quantitative bounds using auxiliary polynomials adapted to progressions, and Rice #cite(label("Rice2019")) developed stronger estimates by combining iteration with sieved polynomial sums. Arala #cite(label("Arala2024")) extended the Bloom–Maynard bound to every intersective polynomial of degree at least two, with a constant depending only on the degree in the exponent of $log N$.

Green and Sawhney #cite(label("GreenSawhney2025")) Theorem 1.1 obtained the square-difference bound

$ \| A \| lt.double N exp \( - c sqrt(log N) \) . $

Their arithmetic level-$d$ inequality and random sparsification also underpin the recent general-polynomial result of Adajar et al. #cite(label("AdajarEtAl2026")) Theorem 1.1: for every fixed intersective $h$ of degree at least two and every fixed $0 < mu < 1 \/ 2$,

$ \| A \| lt.eq N exp #scale(x: 120%, y: 120%)[\(] - c_(h \, mu) \( log N \)^mu #scale(x: 120%, y: 120%)[\)] $

for sufficiently large $N$. Theorem 1 gives a fixed power of $N$ as the saving, with an exponent common to all polynomials of each fixed degree.

The immediate predecessor for our method is the power-saving theorem for square differences in #cite(label("squarepower")) Theorem 1.1. Its proof uses finite reflection-positive tuple laws and a signed multilinear functional. Hatami #cite(label("Hatami2010")) gave a multilinear Hölder criterion for graph norms. Reflection and Cauchy–Schwarz arguments are central to the reflection-group constructions of Conlon and Lee #cite(label("ConlonLee2017")). Here we adapt the specific laws and functional of #cite(label("squarepower")), with all required proofs included, and supply the polynomial and change-of-scale arguments described next.

=== 1.2 The argument and its principal constructions <the-argument-and-its-principal-constructions>

The square-difference method constructs a multilinear form which dominates a fixed power of density, and proves that this form contracts on passing to shorter intervals. We retain this organization, but polynomial values require two additional compatibilities: the polynomial changes when one passes to a progression, and the local distribution supplied by the multilinear construction need not be the natural distribution of polynomial values.

===== 1.2.1 Normalizing the local coefficients. <normalizing-the-local-coefficients.>

We first pass from the polynomial in Theorem 1 to a polynomial $g \( x \) = h \( r + D_0 x \) \/ M$ for which the first nonzero Taylor coefficient at one chosen root in each $bb(Z)_p$ is a unit. Only finitely many primes require the extra division by $M$. The multiplicity of each chosen root is retained, and the representative $r$ is chosen so that positive inputs for $g$ give positive inputs for $h$. The purpose is to make the local numerical choices that determine the final exponent depend only on the degree.

===== 1.2.2 A family closed under passage to progressions. <a-family-closed-under-passage-to-progressions.>

Section 2 retains the auxiliary construction for an arbitrary fixed intersective polynomial $h$. It gives integer polynomials $h_l$, indexed by $l in bb(N)_(+)$, with $h_1 = h$, and a fixed completely multiplicative function $lambda : bb(N)_(+) arrow.r bb(N)_(+)$ such that, for all positive integers $l \, D$,

$ h_l \( D x - i \) = lambda \( D \) h_(l D) \( x \) quad upright("for some ") 0 lt.eq i < D \, #h(2em) D divides lambda \( D \) \, quad lambda \( D \) lt.eq D^(deg h) . $

Consequently, a subset of an arithmetic progression of step $lambda \( D \)$ which avoids nonzero $h_l$-differences becomes, in progression coordinates, a set avoiding nonzero $h_(l D)$-differences. Compatible roots in the rings $bb(Z)_p$ produce the family. Its coefficient bounds, complete exponential-sum estimates, and local lifting properties are uniform in $l$.

Applied to $g$, the family retains the zero valuation of the first nonzero coefficient at each chosen root: Lucier’s auxiliary formula preserves that valuation #cite(label("Lucier2006")) Section 8. Thus every auxiliary polynomial for $g$ is nonconstant as an element of $bb(F)_p \[ x \]$ for every prime $p$. For $p > k$, its reduced derivative is nonzero, and the complete-sum estimates hold beyond a threshold depending only on $k$. At the finitely many smaller primes below that threshold, interpolation bounds the derivative valuation at some argument in terms of $k$ and $p$. These bounds make the lifting moduli and cycle length, and hence the number of tuple slots below, depend only on $k$.

===== 1.2.3 Weighted forms that follow the family. <weighted-forms-that-follow-the-family.>

For each sufficiently large prime $p$, Section 3 constructs a probability distribution on tuples $\( z_v \)_(v in V) in bb(F)_p^V$, where $V$ is one fixed finite set of even cardinality $d$. A distinguished cycle of slots has increments among the values of $h_l$ at arguments where its derivative is nonzero modulo $p$, apart from a small exceptional part of the distribution. The constraint on an edge is weighted by the number of such arguments giving its increment. This weight has a Fourier bound uniform in the auxiliary polynomial and transforms exactly under the progression identity above.

The laws are reflection positive: the quadratic form obtained by splitting the slots across any of a specified family of reflections is positive semidefinite. They also have uniform individual marginals and a conditional mixing estimate. Section 4 derives the resulting signed Hölder inequality and estimates for Fourier lifts. At scale $N$, the lift retains the normalized Fourier coefficients of $1_A$ at rational frequencies whose denominators are at most a small fixed power of $N$. Integrating its product over the $d$ slots gives a nonnegative quantity $Y_l \( N \, A \)$ satisfying

$ Y_l \( N \, A \) gt.eq \( \| A \| \/ N \)^d . $

The associated seminorm permits comparison along progressions with a factor tending to one, rather than a fixed loss at every scale.

===== 1.2.4 A kernel realizing the resulting increment distribution. <a-kernel-realizing-the-resulting-increment-distribution.>

The increment distribution of two slots is determined by the whole tuple construction. It is supported on regular polynomial values, but there is no reason for it to equal the distribution obtained by evaluating $h_l$ at a uniform argument. Section 5 constructs a signed kernel on actual positive values of $h_l$ whose Fourier transform approximates the desired local multipliers. At each sufficiently large prime, a density on regular arguments realizes the prescribed increment distribution. A truncated divisor expansion combines these densities, while uniform lifting handles characters of higher prime-power conductor. Minor arcs are controlled by elementary Weyl differencing.

Only support is needed to use this kernel: its bilinear form vanishes on two ordered subsets of an avoiding set, regardless of the signs of the kernel weights. Its Fourier approximation therefore gives cancellation for the chosen pair of slots. This separates the construction of a useful tuple law from the problem of realizing its pair distribution on integer polynomial values.

===== 1.2.5 Contraction while the auxiliary parameter grows. <contraction-while-the-auxiliary-parameter-grows.>

Section 6 combines the kernel estimate with the seminorm comparison. A fixed positive proportion of assignments of residue classes at the finitely many small primes gives cancellation. The other assignments, together with the summable exceptional parts of the tuple laws, are bounded using shorter intervals and polynomials farther along the family. Section 7 closes the resulting recurrence with a bound that holds for some fixed $a \, b > 0$, simultaneously for every $l$ and every set $A$ avoiding nonzero $h_l$-differences:

$ Y_l \( N \, A \) lt.eq C l^b N^(- a) . $

The factor $l^b$ is necessary to accommodate the growth of the auxiliary polynomial: when $l$ is large relative to $N$, a uniform subpower bound suffices, while the kernel supplies contraction in the remaining range. For the normalized polynomial $g$, the parameters can be chosen so that $a \/ d$ depends only on $k$. Taking $l = 1$ and using density domination bounds sets avoiding nonzero $g$-differences. Partitioning $A$ into residue classes modulo $M$, and using $M g \( n \) = h \( r + D_0 n \)$ with $r + D_0 n gt.eq 1$, then transfers the bound to $h$ and proves Theorem 1.

The polynomial argument thus adds exact covariance of the weighted tuple laws across the auxiliary family and a signed polynomial kernel realizing their pair multipliers. The initial normalization controls the structural parameters that determine the exponent. All the estimates needed from the reflection-positive method are proved below.

=== 1.3 Notation and uniformity <notation-and-uniformity>

We write $e \( x \) = exp \( 2 pi i x \)$ and use the negative sign in Fourier coefficients. For $xi in bb(Q) \/ bb(Z)$, let $q \( xi \)$ be its reduced positive denominator, with $q \( 0 \) = 1$. Averages, measures, and norms on finite sets use uniform probability measure unless a different measure is specified. For a positive integer $n$, write $"rad" \( n \) = product_(p divides n) p$, with $"rad" \( 1 \) = 1$. Empty products equal $1$, and a product space with no coordinates is a singleton. Conditional expectations are with respect to the law specified in the surrounding statement.

The auxiliary-family development applies to any fixed intersective polynomial $h$ with chosen roots, and we write $k = deg h$. Constants in $O \( dot.op \)$ and $lt.double$ may depend on this fixed datum and on parameters already fixed from it; they are independent of the varying integers, sets, and auxiliary index $l$, unless a restriction is explicitly stated. Likewise, sufficiently-large thresholds are uniform in those varying data. We explicitly identify the structural choices that depend only on $k$ when the first nonzero coefficient at every chosen root is a unit. Bounds denoted $O_k \( dot.op \)$ are uniform over all fixed data of degree $k$ satisfying those choices. A bound $N^(o \( 1 \))$ means $C_epsilon.alt N^epsilon.alt$ for every $epsilon.alt > 0$ under the same uniformity convention. All structural parameters are fixed before the asymptotic scale $N$ varies.

== 2 Auxiliary polynomials and local estimates <sec:local>

Passing to an arithmetic progression changes the polynomial whose values are forbidden differences. We first show that one such change can make the first nonzero Taylor coefficient at each chosen local root a unit. We then organize all subsequent changes into a coherent family $h_l$, indexed by positive integers, and show that this local property is preserved. The family and its local estimates remain available for an arbitrary fixed intersective polynomial; the unit condition will let us choose their structural parameters using only the degree. The estimates give decay of complete exponential sums at large primes, together with residue classes on which polynomial values lift uniformly and support cycles of one fixed length.

Throughout this section, $h in bb(Z) \[ x \]$ is the fixed intersective polynomial of degree $k gt.eq 2$, with positive leading coefficient $a$.

=== 2.1 A family compatible with progressions <a-family-compatible-with-progressions>

We use Lucier’s auxiliary-polynomial construction #cite(label("Lucier2006")) Section 8, in which a compatible root at each prime determines the normalization by its multiplicity. We give the construction and its inheritance rule explicitly, before proving the uniform local estimates needed here.

Here $bb(Z)_p$ denotes the ring of compatible residues modulo the powers of a prime $p$, and $v_p$ its valuation, with $v_p \( 0 \) = oo$. Every nonzero element is a power of $p$ times a unit, so $bb(Z)_p$ is an integral domain. Intersectivity supplies a root of $h$ modulo every power of $p$. These roots can be chosen compatibly: at each stage, retain a residue class having root extensions to arbitrarily high powers, and then choose one of its finitely many refinements with the same property. Fix the resulting root $frak(z)_p in bb(Z)_p$ for each prime $p$, and write

$ h \( frak(z)_p + X \) = sum_(j = m_p)^k b_(j \, p) X^j \, #h(2em) 1 lt.eq m_p lt.eq k \, #h(2em) b_(m_p \, p) eq.not 0 . $

Thus $m_p$ is the multiplicity of the chosen root.

The coefficient $b_(m_p \, p)$ is a unit for all sufficiently large primes, with a threshold depending only on $h$. To see this, factor $h = c product_i g_i^(d_i)$, where $c$ is a nonzero integer and the $g_i$ are pairwise nonassociate primitive irreducible polynomials in $bb(Z) \[ x \]$. Cleared Bézout identities for $\( g_i \, g_j \)$, $i eq.not j$, and for $\( g_i \, g'_i \)$ have nonzero integer right-hand sides. Exactly one factor $g_i$ vanishes at $frak(z)_p$, and $g'_i \( frak(z)_p \) eq.not 0$. Outside the finite set of primes dividing these right-hand sides or $c$, the derivative and all other factor values at $frak(z)_p$ are units. Hence $m_p = d_i$ and

$ b_(m_p \, p) = c thin g'_i \( frak(z)_p \)^(d_i) product_(j eq.not i) g_j \( frak(z)_p \)^(d_j) $

is a unit. This argument allows repeated factors of $h$.

We will sometimes impose the following additional condition on the chosen roots:

#[#set math.equation(numbering: n => "(U)")
 $ b_(m_p \, p) in bb(Z)_p^times #h(2em) upright("for every prime ") p . $ <local:unit-condition>]

The construction below works without this condition. Its role is to make the local parameter choices depend only on $k$. Every intersective polynomial can be reduced to this case by one progression change.

#thm([Lemma 2.1.])[
  (Normalization at the chosen roots).  #emph[There are positive integers $D_0 \, M$, an integer $- D_0 < r lt.eq 0$, and an intersective polynomial 
$ g \( x \) = frac(h \( r + D_0 x \), M) in bb(Z) \[ x \] $

 of degree $k$ with positive leading coefficient such that, for every prime $p$, the element $w_p = \( frak(z)_p - r \) \/ D_0$ belongs to $bb(Z)_p$ and 
$ g \( w_p + X \) = sum_(j = m_p)^k b_(j \, p)^(*) X^j \, #h(2em) b_(j \, p)^(*) in bb(Z)_p \, #h(2em) b_(m_p \, p)^(*) in bb(Z)_p^times . $

 Thus $g$, with these chosen roots, satisfies Condition (U). Moreover, for every $n in bb(N)_(+)$, 
$ M g \( n \) = h \( r + D_0 n \) \, #h(2em) r + D_0 n gt.eq 1 . $

]
] <local:normalization>

#proof[
  Put $u'_p = v_p \( b_(m_p \, p) \)$. These are nonnegative integers, and the factorization argument above shows that $S_0 = { p : u'_p > 0 }$ is finite. For $p in S_0$, take $u_p = u'_p + 1$, and set
  $ D_0 = product_(p in S_0) p^(u_p) \, #h(2em) M = product_(p in S_0) p^(u_p m_p + u'_p) . $
  Choose the representative $- D_0 < r lt.eq 0$ satisfying $r equiv frak(z)_p med \( mod med p^(u_p) \)$ for every $p in S_0$, by the Chinese remainder theorem. If $S_0$ is empty, these definitions give $D_0 = M = 1$ and $r = 0$.
  For $p in S_0$, the congruence defining $r$ shows that $w_p = \( frak(z)_p - r \) \/ D_0$ lies in $bb(Z)_p$; for $p in.not S_0$, the same conclusion follows because $D_0$ is a $p$-adic unit. Define $g$ initially as the displayed rational polynomial. Its centered expansion is
  $ g \( w_p + X \) = sum_(j = m_p)^k b_(j \, p) D_0^j / M X^j . $
  If $p in S_0$, the coefficient at $j = m_p$ has valuation $u'_p + u_p m_p - \( u_p m_p + u'_p \) = 0$. For $j > m_p$, its valuation is at least
  $ u_p \( j - m_p \) - u'_p gt.eq 1 . $
  If $p in.not S_0$, both $D_0$ and $M$ are $p$-adic units, so every coefficient is integral and the coefficient at $j = m_p$ is again a unit. Thus the centered expansion belongs to $bb(Z)_p \[ X \]$ for every prime $p$. Translation by $- w_p in bb(Z)_p$ shows that $g$ itself belongs to $bb(Z)_p \[ x \]$. Every rational coefficient of $g$ is therefore integral at every prime and hence is an integer.
  The elements $w_p$ are roots of $g$; reducing them at the prime-power factors of any modulus and applying the Chinese remainder theorem proves intersectivity. The degree and sign of the leading coefficient are preserved because $D_0 \, M > 0$. Finally, the defining identity for $g$ gives $M g \( n \) = h \( r + D_0 n \)$, and $r > - D_0$ gives $r + D_0 n gt.eq 1$ for $n gt.eq 1$. ◻
]

In the coordinates of any progression of step $M$, a nonzero difference $g \( n \)$, $n gt.eq 1$, therefore gives the nonzero original difference $h \( r + D_0 n \)$ at a positive argument. This will transfer the final bound for $g$ back to the original polynomial. We continue below with the arbitrary fixed polynomial $h$ and its chosen roots, assuming Condition (U) only when explicitly stated.

Define a completely multiplicative function $lambda : bb(N)_(+) arrow.r bb(N)_(+)$ by $lambda \( p \) = p^(m_p)$. For each $l gt.eq 1$, let $r_l$ be the unique integer in $\( - l \, 0 \]$ satisfying

$ r_l equiv frak(z)_p med \( mod med p^(v_p \( l \)) \) #h(2em) \( p divides l \) \, $

and set

$ h_l \( x \) = frac(h \( r_l + l x \), lambda \( l \)) \, #h(2em) a_l = frac(a l^k, lambda \( l \)) . $

For $l = 1$, this convention gives $r_1 = 0$ and $h_1 = h$.

#thm([Lemma 2.2.])[
  (The auxiliary family).  #emph[For every $l gt.eq 1$, the polynomial $h_l$ belongs to $bb(Z) \[ x \]$, is intersective, and has degree $k$ and positive leading coefficient $a_l$. Every coefficient of $h_l$ is $O_h \( a_l \)$. For every prime $p$, the element $frak(z)_(p \, l) = \( frak(z)_p - r_l \) \/ l$ belongs to $bb(Z)_p$, and 
#[#set math.equation(numbering: n => "(2.1)")
 $ h_l \( frak(z)_(p \, l) + X \) & = sum_(j = m_p)^k b_(j \, p) frac(l^j, lambda \( l \)) X^j \,\
v_p #h(-0.16667em) (b_(m_p \, p) frac(l^(m_p), lambda \( l \))) & = v_p \( b_(m_p \, p) \) . $ <local:centered-expansion>]

 In particular, the root multiplicity remains $m_p$, and Condition (U), when it holds for $h$, holds for every $h_l$ at these roots. For all positive integers $l \, D$, there is an integer $i$, $0 lt.eq i < D$, such that 
#[#set math.equation(numbering: n => "(2.2)")
 $ h_l \( D x - i \) = lambda \( D \) h_(l D) \( x \) \,\
D divides lambda \( D \) \, #h(2em) lambda \( D \) lt.eq D^k \, #h(2em) "rad" \( lambda \( D \) \) = "rad" \( D \) . $ <eq:1>]

 In particular, the argument $D x - i$ is positive whenever $x in bb(N)_(+)$.]
] <local:family>

#proof[
  Only primes dividing $lambda \( l \)$ can occur in denominators of the coefficients of $h_l$. Fix such a prime, put $u = v_p \( l \) > 0$, and use the affine coordinate
  $ Y = frac(r_l - frak(z)_p, p^u) + l / p^u x quad upright("over ") bb(Z)_p . $
  Its slope is a unit, and expansion at $frak(z)_p$ gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ h_l \( x \) = (frac(lambda \( l \), p^(u m_p)))^(- 1) sum_(j = m_p)^k b_(j \, p) p^(u \( j - m_p \)) Y^j . $ <local:normalized-expansion>]
  The prefactor is a $p$-adic unit, and the displayed polynomial is integral over $bb(Z)_p$. This proves $h_l in bb(Z) \[ x \]$.
  For every prime $p$, the element $\( frak(z)_p - r_l \) \/ l$ belongs to $bb(Z)_p$: when $p divides l$, this uses the defining congruence for $r_l$, and otherwise $l$ is a unit. It is a root of $h_l$. Reducing these roots at the prime-power factors of an arbitrary modulus and applying the Chinese remainder theorem proves intersectivity.
  Substitution of $frak(z)_(p \, l) + X$ into the definition of $h_l$ gives the centered expansion in (2.1). Complete multiplicativity gives $v_p \( lambda \( l \) \) = m_p v_p \( l \)$, so $l^(m_p) \/ lambda \( l \)$ is a unit in $bb(Z)_p$. This proves the exact valuation there, including the preservation of the multiplicity and of the unit condition. The assertion is local at $p$; the displayed quotient need not be an integer.
  The degree and leading coefficient follow from the definition. Expanding $h \( r_l + l x \)$ and using $\| r_l \| < l$ bounds every coefficient by $O_h \( l^k \/ lambda \( l \) \) = O_h \( a_l \)$.
  The same root choices give $r_(l D) equiv r_l med \( mod med l \)$. The representatives of this class in $\( - l D \, 0 \]$ are exactly $r_l \, r_l - l \, dots.h \, r_l - \( D - 1 \) l$, so $r_(l D) = r_l - i l$ for some $0 lt.eq i < D$. Complete multiplicativity of $lambda$ now gives the polynomial identity in (2.2). The remaining bounds follow from $1 lt.eq m_p lt.eq k$, while $lambda \( p \) = p^(m_p)$ gives the equality of prime supports. Finally, $D x - i gt.eq D - \( D - 1 \) = 1$ for $x gt.eq 1$. ◻
]

Equation (2.2) is the inheritance rule for avoidance. If a set contained in one progression of step $lambda \( D \)$ avoids nonzero values of $h_l$ as differences, then its progression coordinates avoid nonzero values of $h_(l D)$. Indeed a difference $h_(l D) \( m \)$, $m gt.eq 1$, would give the old difference $lambda \( D \) h_(l D) \( m \) = h_l \( D m - i \)$, with a positive argument.

=== 2.2 Exponential sums uniformly over the family <exponential-sums-uniformly-over-the-family>

For all sufficiently large primes $p$, the reduction of $h_l$ is nonconstant for every $l$. Indeed, $b_(m_p \, p)$ is a unit outside the finite set found above, so the first coefficient in the centered expansion (2.1) is a unit. If $h_l med mod med p$ were constant, translation by the integral element $frak(z)_(p \, l)$ would still give a constant polynomial modulo $p$, a contradiction. Under Condition (U), this argument works at every prime: for every $p \, l$, some nonconstant coefficient of $h_l$ is a $p$-adic unit. At any such prime with $p > k$, the reduced degree $k'$ lies in ${ 1 \, dots.h \, k }$, so $h'_l med mod med p$ is not the zero polynomial. The reduced degree may be smaller than the degree over the integers.

Set

$ delta = frac(1, 100 k 2^k) \, #h(2em) gamma = delta / 10 . $

An argument $x in bb(F)_p$ is called #emph[regular for $h_l$] if $h'_l \( x \) eq.not 0$ in $bb(F)_p$.

#thm([Lemma 2.3.])[
  (Complete polynomial sums).  #emph[There is a threshold $P_1 > max \( k \, 2 \)$, depending only on $h$, such that for every prime $p gt.eq P_1$ and every $l gt.eq 1$, all but at most $k - 1$ arguments modulo $p$ are regular for $F = h_l$, and at least half are regular. If Condition (U) holds, one may choose $P_1 = P_1 \( k \)$, uniformly over all such polynomials and chosen roots of degree $k$. For every integer $u$ with $p divides.not u$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ lr(|bb(E)_(x med mod med p^j) e #h(-0.16667em) (frac(u F \( x \), p^j))|) lt.eq p^(- 8 delta j) quad \( j gt.eq 1 \) \, #h(2em) lr(|bb(E)_(x med mod med p\
x upright(" regular")) e #h(-0.16667em) (frac(u F \( x \), p))|) lt.eq p^(- 4 delta) . $ <eq:2>]

 The second average is normalized by the number of regular arguments.]
] <local:sums>

#proof[
  Choose an initial threshold so that the preceding nonconstancy holds and $p > k$. Under Condition (U), this initial threshold can be chosen using only $k$. The nonzero polynomial $F' med mod med p$ has degree at most $k - 1$, which gives the count of regular arguments; taking $p gt.eq 2 \( k - 1 \)$ also makes at least half of the arguments regular.
  First consider the sum modulo $p$, and let $k'$ be the degree of $F med mod med p$. If $k' = 1$, the sum is zero. If $k' gt.eq 2$, repeated differencing gives
  $ lr(|bb(E)_(x med mod med p) e \( u F \( x \) \/ p \)|)^(2^(k' - 1)) lt.eq bb(E)_(b_1 \, dots.h \, b_(k' - 1) med mod med p) lr(|bb(E)_(x med mod med p) e #h(-0.16667em) (frac(u thin Delta_(b_1) dots.h.c Delta_(b_(k' - 1)) F \( x \), p))|) \, $
  where $Delta_b F \( x \) = F \( x + b \) - F \( x \)$. To obtain the inequality, square the mean, express it as the mean of multiplicative differences, and iterate the triangle inequality and Cauchy–Schwarz. The reduction modulo $p$ of $u Delta_(b_1) dots.h.c Delta_(b_(k' - 1)) F$ has degree at most one, with coefficient of $x$ equal to $u k' !$ times the leading coefficient of $F med mod med p$ times $b_1 dots.h.c b_(k' - 1)$. Its character mean vanishes unless one increment is zero. The right-hand side is therefore at most $\( k' - 1 \) \/ p$. Since $8 delta < 2^(1 - k) lt.eq 2^(1 - k')$ and $1 lt.eq k' lt.eq k$, increasing the threshold by an amount depending only on $k$ gives the first bound in (2.4) for $j = 1$. Removing at most $k - 1$ arguments gives
  $ lr(|bb(E)_(x med mod med p\
x upright(" regular")) e \( u F \( x \) \/ p \)|) lt.eq frac(p, p - k + 1) (lr(|bb(E)_(x med mod med p) e \( u F \( x \) \/ p \)|) + frac(k - 1, p)) . $
  The first bound and another increase depending only on $k$ give the second bound in (2.4).
  For $j gt.eq 2$, put $n = floor.l j \/ 2 floor.r$. Write $x = x_0 + p^(j - n) y$, where $x_0$ runs modulo $p^(j - n)$ and $y$ runs modulo $p^n$. Taylor expansion modulo $p^j$ leaves only the linear variation, because $2 \( j - n \) gt.eq j$. The average over $y$ vanishes unless $F' \( x_0 \) equiv 0 med \( mod med p^n \)$. We claim that these arguments occupy at most $k - 1$ classes modulo $p^v$, where $v = ceil.l n \/ \( k - 1 \) ceil.r$.
  Otherwise choose $k$ integer representatives $x_1 \, dots.h \, x_k$ in distinct such classes with $p^n divides F' \( x_i \)$. Interpolation of the degree-at-most-$k - 1$ polynomial $F'$ gives
  $ F' \( X \) = sum_(i = 1)^k F' \( x_i \) frac(product_(j eq.not i) \( X - x_j \), product_(j eq.not i) \( x_i - x_j \)) . $
  Each denominator has valuation at most $\( k - 1 \) \( v - 1 \) < n$, whereas the numerator polynomial has integral coefficients. Every coefficient of every summand is therefore divisible by $p$ in $bb(Z)_p$. This contradicts $F' equiv.not 0 med \( mod med p \)$ and proves the claim. Since $v lt.eq n lt.eq j - n$, the density of the surviving arguments is at most
  $ \( k - 1 \) p^(- ceil.l n \/ \( k - 1 \) ceil.r) lt.eq \( k - 1 \) p^(- j \/ \( 3 \( k - 1 \) \)) . $
  Here $n gt.eq j \/ 3$. Since $1 \/ \( 3 \( k - 1 \) \) > 8 delta$, one fixed increase of the prime threshold absorbs the factor $k - 1$ for every $j gt.eq 2$. All choices of threshold are uniform in $l$ and $u$; fix $P_1$ large enough to satisfy them all. After the initial nonconstancy condition, every increase used only $k$. This proves the stated degree-only choice under Condition (U). ◻
]

=== 2.3 Admissible residues and uniform lifting <admissible-residues-and-uniform-lifting>

At large primes we have many regular arguments. At the finitely many smaller primes, the derivative may be divisible by $p$ at every argument. We therefore need, uniformly in $l$, an argument at which $v_p \( h'_l \( x \) \)$ is bounded above. Restrictions based on derivative nonvanishing and lifting at prime powers also appear in Rice’s treatment #cite(label("Rice2019")) Sections 2.4–2.5 and 4 of the revised version.

#thm([Lemma 2.4.])[
  (A derivative bound at small primes).  #emph[Let 
$ V_k = \( i^j \)_(0 lt.eq i \, j lt.eq k - 1) \, #h(2em) T_(k \, p) = max_(1 lt.eq j lt.eq k) v_p \( j \) . $

 For every prime $p < P_1$, one may take 
#[#set math.equation(numbering: n => "(2.5)")
 $ S_p = v_p \( b_(m_p \, p) \) + T_(k \, p) + v_p \( det V_k \) $ <local:small-prime-choice>]

 so that for every $l gt.eq 1$ some integer $x in { 0 \, dots.h \, k - 1 }$ satisfies $v_p \( h'_l \( x \) \) lt.eq S_p$. In general this choice depends only on the fixed $h$, its chosen roots, and $p$. Under Condition (U), it reduces to 
$ S_p = T_(k \, p) + v_p \( det V_k \) \, #h(2em) det V_k = product_(j = 1)^(k - 1) j ! \, $

 and hence depends only on $k$ and $p$.]
] <local:small-primes>

#proof[
  For a nonconstant polynomial over $bb(Z)_p$, consider the ideal generated by its nonconstant coefficients. An affine substitution with unit slope preserves this ideal: substitution gives one inclusion, since a constant cannot contribute to a nonconstant coefficient, and the inverse affine substitution gives the reverse inclusion. Thus it preserves the minimum valuation of the nonconstant coefficients.
  Apply this observation to the translation by $frak(z)_(p \, l)$. Equation (2.1) displays a nonconstant coefficient of valuation $v_p \( b_(m_p \, p) \)$, so the minimum for $F = h_l$ is at most that number, uniformly in $l$. Differentiation multiplies the coefficient of degree $j$ by $j$. Hence some coefficient of $F'$ has valuation at most $v_p \( b_(m_p \, p) \) + T_(k \, p)$.
  The matrix $V_k$ maps the coefficient vector of a polynomial of degree at most $k - 1$ to its values at $0 \, 1 \, dots.h \, k - 1$. Its determinant is $product_(0 lt.eq i < j lt.eq k - 1) \( j - i \) = product_(j = 1)^(k - 1) j !$, and its adjugate has integer entries. If every value $F' \( x \)$, $0 lt.eq x < k$, had valuation greater than $S_p$, multiplication by $V_k^(- 1) = "adj" \( V_k \) \/ det V_k$ would give valuation greater than $S_p - v_p \( det V_k \) = v_p \( b_(m_p \, p) \) + T_(k \, p)$ for every coefficient of $F'$. This contradicts the preceding bound and proves the lemma. ◻
]

Fix one such $S_p$ for each $p < P_1$, and define

$ E_p = cases(delim: "{", 2 S_p + 1 \, & p < P_1 \,, 1 \, & p gt.eq P_1 .) $

When Condition (U) holds, use the choice $P_1 = P_1 \( k \)$ from Lemma 4 and the degree-only choice of $S_p$ in Lemma 5. Then all the exponents $E_p$ are determined by $k$ and $p$. For $F = h_l$, call a residue $r med mod med p^(E_p)$ #emph[admissible for $l$] if it has the following form. When $p < P_1$, require $r equiv F \( x \) med \( mod med p^(E_p) \)$ for some integer $x$ with $v_p \( F' \( x \) \) lt.eq S_p$. When $p gt.eq P_1$, require that $r$ be a value of $F$ at a regular argument modulo $p$. There is at least one admissible residue at every prime. A residue equal to zero is allowed.

The next elementary lifting statement explains this choice of modulus.

#thm([Lemma 2.5.])[
  (Uniform lifting on an argument class).  #emph[Let $F in bb(Z) \[ x \]$, let $p$ be a prime, and suppose $s = v_p \( F' \( x_0 \) \) < oo$ for an integer $x_0$. If $E$ is an integer with $E gt.eq 2 s + 1$, then $F$ is constant modulo $p^E$ on the argument class $x_0 med mod med p^(E - s)$. For every integer $j > E$, a uniform argument in that class modulo $p^j$ gives a uniform value among the residues modulo $p^j$ congruent to $F \( x_0 \) med mod med p^E$.]
] <local:lifting>

#proof[
  Taylor expansion over the integers gives
  $ F \( x_0 + p^(E - s) y \) = F \( x_0 \) + p^E #scale(x: 120%, y: 120%)[\(] c_1 y + p C \( y \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) p divides.not c_1 \, quad C in bb(Z) \[ y \] . $
  Indeed the linear coefficient is $p^E F' \( x_0 \) \/ p^s$, and every term of degree at least two is divisible by $p^(E + 1)$, since $E - 2 s gt.eq 1$. The polynomial $T \( y \) = c_1 y + p C \( y \)$ induces a bijection modulo every power of $p$: its difference at two arguments is their difference times a $p$-adic unit, so the induced map on each finite residue ring is injective and hence bijective.
  For a uniform argument in the stated class modulo $p^j$, the variable $y$ is uniform modulo $p^(j - E + s)$. Its reduction modulo $p^(j - E)$ is still uniform, with each residue occurring $p^s$ times. The bijectivity of $T$ at this latter modulus proves the asserted distribution of $F$. ◻
]

For an admissible residue of $F = h_l$, take its defining argument $x_0$ and put $s = v_p \( F' \( x_0 \) \)$; at a large prime any integer representative of the regular argument has $s = 0$. The chosen exponent always satisfies $E_p gt.eq 2 s + 1$. Lemma 6 therefore supplies an argument class of modulus $p^(E_p - s)$, which divides $p^(E_p)$, on which $F$ has precisely the required uniform lifting property.

=== 2.4 Admissible cycles of a fixed length <admissible-cycles-of-a-fixed-length>

We finally choose one cycle length that works simultaneously at every prime and for every member of the auxiliary family. Fix an integer $L > 2$ such that

$ p^(E_p) divides L quad \( p < P_1 \) \, #h(2em) 4 delta L > 2 . $

There are only finitely many divisibility conditions, so such a choice exists. For example, take the least multiple of $product_(p < P_1) p^(E_p)$ exceeding $max { 2 \, \( 2 delta \)^(- 1) }$. In general $L$ may depend on $h$ and its chosen roots; under Condition (U) and the degree-only choices above, this choice of $L$ depends only on $k$.

#thm([Lemma 2.6.])[
  (Zero-sum admissible sequences).  #emph[For every prime $p$ and every positive integer $l$, there are $L$ admissible residues $r_1 \, dots.h \, r_L med mod med p^(E_p)$ such that $r_1 + dots.h.c + r_L = 0 med mod med p^(E_p)$.]
] <local:cycles>

#proof[
  If $p < P_1$, repeat any admissible residue $L$ times. The sum is zero because $p^(E_p) divides L$.
  If $p gt.eq P_1$, let $R$ be $h_l \( x \)$ for a uniform regular argument $x med mod med p$, and take independent copies $R_1 \, dots.h \, R_L$. Fourier inversion gives
  $ p thin bb(P) \( R_1 + dots.h.c + R_L = 0 \) = 1 + sum_(u = 1)^(p - 1) #scale(x: 120%, y: 120%)[\(] bb(E) e \( u R \/ p \) #scale(x: 120%, y: 120%)[\)]^L . $
  By (2.4), the sum following $1$ has modulus at most $\( p - 1 \) p^(- 4 delta L) < 1$. The probability is therefore positive, and any realization with sum zero supplies the required residues. ◻
]

Label the $L$ vertices of a directed cycle by starting with any initial residue and taking successive partial sums of $r_1 \, dots.h \, r_L$. Their zero sum makes the final increment close the cycle. The vertices are distinct, but their labels need not be. The later finite-field construction may impose a larger prime threshold $P > P_1$ while retaining the exponents $E_p$ just fixed. In particular, $E_p = 1$ still holds on $P_1 lt.eq p < P$, where the lemma already supplies a length-$L$ sequence. Thus increasing that threshold does not require changing the cycle length.

== 3 Weighted reflection-positive tuple laws <sec:tuples>

We now construct the finite-field probability laws used to average products of Fourier lifts. The two requirements that must be reconciled are positivity across certain reflections of the slots and support on polynomial differences around a prescribed cycle. A measure obtained simply by imposing the cycle constraints need not have the required positivity. We instead construct several measures, indexed by sets of #emph[marked blocks]. Marking a block removes some constraints and creates a positive contribution at reflections in that block. A suitably weighted mixture lets this contribution dominate the possible negative contribution from the corresponding unmarked measure.

The graph estimates and marked-block construction adapt #cite(label("squarepower")) Lemmas 2.1–2.2 and Section 3. Here the edge constraints are weighted by regular fibers of $h_l$. Their directions are retained throughout: neither the polynomial value set nor its weight is assumed to be invariant under negation. We prove all the properties needed below, including the exact covariance under changes of the auxiliary parameter.

=== 3.1 Slots, reflections, and mixing of edge weights <slots-reflections-and-mixing-of-edge-weights>

Retain the constants $delta \, gamma$ and the integer $L > 2$ from Section 2. Choose the least integer $t gt.eq 1$ such that $\( t + 1 \) delta \/ 2 > 5$, and set

$ w = 2 t + 1 \, #h(2em) K = L ! \, #h(2em) r_(*) = K \/ 2 \, #h(2em) V = Pi^w \, #h(2em) d = K^w \, #h(2em) n_(*) = d \/ 2 \, $

where $Pi$ is the set of bijections from the positions $\[ L \]$ to the symbols $\[ L \]$. Thus an element of $Pi$ is a permutation word, and a slot $v in V$ consists of $w$ such words, which we call its blocks. Fix an $L$-cycle $c$ acting on positions. Right composition $q mapsto q c$ shifts a word, whereas left composition permutes its symbols. The designated cycle of slots is

$ v_j = \( c^j \, dots.h \, c^j \) quad \( 0 lt.eq j < L \) \, #h(2em) v_L = v_0 . $

A reflection cut is specified by a block $b in \[ w \]$ and two distinct symbols $a_1 \, a_2$ in a specified order. Let $V_(+)$ consist of the slots in which $a_1$ precedes $a_2$ in block $b$. Let $theta$ interchange these two symbols in that block, leaving every other block unchanged. Then $theta$ is an involution exchanging $V_(+)$ and $V_(-) = V \\ V_(+)$, and both halves have size $n_(*)$. For a finite measure $nu$ on $bb(F)_p^V$, its matrix at this cut is the matrix of joint point masses of

$ \( z_v \)_(v in V_(+)) quad upright("and") quad \( z_(theta v) \)_(v in V_(+)) . $

We call $nu$ #emph[reflection positive] if this matrix is symmetric positive semidefinite at every cut. Equivalently, symmetry holds and

$ integral J \( \( z_v \)_(v in V_(+)) \) J \( \( z_(theta v) \)_(v in V_(+)) \) thin d nu \( z \) gt.eq 0 $

for every real function $J$ on $bb(F)_p^(V_(+))$ and every cut.

Fix $l gt.eq 1$ and a prime $p gt.eq P_1$, and write $F = h_l$. Define

$ W \( y \) = W_(l \, p) \( y \) = 1 / k \| { x in bb(F)_p : F \( x \) = y \, med F' \( x \) eq.not 0 } #scale(x: 120%, y: 120%)[\|] \, #h(2em) c_p = bb(E)_(y in bb(F)_p) W \( y \) . $

The mean $c_p$ may depend on $l$. Nonconstancy of $F$ modulo $p$ and the degree bound give $0 lt.eq W lt.eq 1$, and $W$ is supported on the admissible residues. Moreover,

$ c_p = frac(\| { x : F' \( x \) eq.not 0 } #scale(x: 120%, y: 120%)[\|], k p) gt.eq frac(1, 2 k) . $

Equation (2.4) bounds every nonconstant Fourier coefficient of $W$ by $p^(- 4 delta)$. Consequently the kernel $W \( y - x \) - c_p$, acting between uniform $L^2 \( bb(F)_p \)$ spaces, has operator norm at most $p^(- 4 delta)$. This follows by diagonalizing the convolution operator in the character basis; no symmetry of $W$ is needed.

We shall apply this one-edge estimate to fixed systems of edges. All graphs in the next lemma have distinct formal vertices, whose field labels are independent and uniform before the edge weights are applied.

#thm([Lemma 3.1.])[
  (Graph counting and list mixing).  #emph[Let $G$ be a fixed directed graph with no loops and with at most one edge on each unordered pair of vertices. Write $e_G$ for its number of edges. All averages below use the normalized uniform measures on the indicated label configurations. Then 
$ lr(|bb(E) product_(x arrow.r y in E \( G \)) W \( Y_y - Y_x \) - c_p^(e_G)|) lt.eq e_G p^(- 4 delta) . $

 If every edge joins a vertex in one list $X$ to a vertex in a disjoint list $Y$, in either direction, let $K_G \( X \, Y \)$ denote this product of edge weights. As a kernel acting by normalized averaging between the uniform $L^2$ spaces of the two lists, 
#[#set math.equation(numbering: n => "(3.1)")
 $ parallel K_G - c_p^(e_G) parallel_(upright("op")) lt.eq \( 32 e_G \)^(1 \/ 4) p^(- delta) . $ <eq:3>]

 Both bounds are uniform in $l$ and $p$ and include $e_G = 0$, when the products are one and both errors are zero.]
] <tuple:list-mixing>

#proof[
  Reversing a directed edge replaces the one-edge operator by its adjoint, so its norm remains at most $p^(- 4 delta)$. The case $e_G = 0$ is immediate; assume $e_G gt.eq 1$. For the first assertion, replace the edge weights by $c_p$ one at a time. In a term containing the difference for an edge $x arrow.r y$, fix all labels other than $Y_x \, Y_y$. Because there is no other edge on this unordered pair, the remaining factors separate into a function of $Y_x$ and a function of $Y_y$, each bounded by one and hence of uniform $L^2$ norm at most one. The one-edge operator estimate bounds this term by $p^(- 4 delta)$. Summing over the $e_G$ replacements gives the stated error $e_G p^(- 4 delta)$.
  For the second assertion put $B = K_G - c_p^(e_G)$. If the two configuration spaces have cardinalities $N_X \, N_Y$, the kernel operator $\( T_B f \) \( X \) = bb(E)_Y B \( X \, Y \) f \( Y \)$ has Euclidean matrix $B \( X \, Y \) \/ sqrt(N_X N_Y)$ under the isometries from uniform $L^2$ to Euclidean space. Thus, with two independent copies of each list, matrix multiplication gives
  $ parallel B parallel_(upright("op"))^4 lt.eq sum_j s_j \( B \)^4 = bb(E) product_(a \, b in { 0 \, 1 }) B \( X_a \, Y_b \) \, $
  where $s_j \( B \)$ are the singular values for the normalized measures. Indeed, the trace of $\( T_B T_B^(*) \)^2$ is the uniform average of $B \( X_0 \, Y_0 \) overline(B \( X_1 \, Y_0 \)) B \( X_1 \, Y_1 \) overline(B \( X_0 \, Y_1 \))$; here $B$ is real, so the conjugates can be omitted. This explains why no factor depending on $N_X \, N_Y$ occurs. Expand the four copies of $B$. A product using any subset of the four corners again comes from a graph of the stated kind: an unordered pair of its formal endpoints determines both the original edge and its corner. A term using $j$ corners has exactly $j e_G$ edges, so its graph error is at most $j e_G p^(- 4 delta)$. Its constant multiplier has modulus $c_p^(\( 4 - j \) e_G) lt.eq 1$. All main terms are $c_p^(4 e_G)$ times the corresponding sign, so they cancel. Consequently
  $ parallel B parallel_(upright("op"))^4 lt.eq sum_(j = 0)^4 binom(4, j) j e_G p^(- 4 delta) = 32 e_G p^(- 4 delta) \, $
  because $sum_(j = 0)^4 binom(4, j) j = 4 dot.op 2^3 = 32$. Taking fourth roots proves (3.1). ◻
]

=== 3.2 Measures indexed by marked blocks <measures-indexed-by-marked-blocks>

For $S subset.eq \[ w \]$ with $s = \| S \| lt.eq t + 1$, regard the blocks in $S$ as marked. The #emph[address] of a slot is the tuple of its unmarked words:

$ u_S : V arrow.r U_S = Pi^(\[ w \] \\ S) . $

At each address take a list of length $ell_s = r_(*)^s$,

$ \( Y_(u \, i) \)_(i in \[ ell_s \]) \, #h(2em) u in U_S \, $

with all entries independent and uniform in $bb(F)_p$. The length grows with $s$ so that, upon marking one more block, the lists on one side of a cut can be concatenated into the new lists.

For $s lt.eq t$, put a directed edge $u arrow.r u'$ between addresses whenever

$ u'_b = u_b c quad upright("in at least ") t + 1 upright(" blocks ") b in.not S . $

For every address edge impose all list-entry weights in its direction, and write their product as

$ I_S \( Y \) = product_(u arrow.r u') med product_(i \, i' in \[ ell_s \]) W \( Y_(u' \, i') - Y_(u \, i) \) . $

There are no loops, since $q c eq.not q$ for a permutation word $q$. Nor can both $u arrow.r u'$ and $u' arrow.r u$ occur: a block certifying one direction cannot certify the other, as $c^2 eq.not 1$. The two directions would therefore require at least $2 \( t + 1 \) > w - s$ unmarked blocks. The resulting graph on list entries satisfies Lemma 8. The same threshold also preserves the designated cycle: if $s lt.eq t$, at least $t + 1$ blocks remain unmarked, and each consecutive pair of cycle vertices shifts in every one of them. At $s = t + 1$ only $t$ blocks remain, and we set $I_S = 1$; we call these sets $S$ terminal.

Each slot will choose an entry of its address list. To obtain strict positivity at a marked cut, we also weight the choices themselves. Set $Delta = 1 \/ \( 10 L^2 \)$. For an unordered pair of distinct slots $x \, y in V$, set $H_(x y)^S = 0$ unless $x \, y$ agree in every block except one marked block and their words in that block differ by a transposition of symbols. If the exchanged positions have gap $g$, set $H_(x y)^S = Delta^g$. Choose independent uniform indices $j_v in \[ ell_s \]$ and put

$ R_S \( j \) = exp (sum_({ x \, y } subset.eq V) H_(x y)^S upright(bold(1))_({ j_x = j_y })) . $

Define a finite, not yet normalized, measure $nu_S = nu_(l \, p \, S)$ by

$ integral Phi \( z \) thin d nu_S \( z \) = bb(E)_(Y \, j) [I_S \( Y \) R_S \( j \) Phi #scale(x: 120%, y: 120%)[\(] \( Y_(u_S \( v \) \, j_v) \)_(v in V) #scale(x: 120%, y: 120%)[\)]] . $

Thus the output label at $v$ is $z_v = Y_(u_S \( v \) \, j_v)$. All underlying averages in this definition are independent uniform averages. Since the index set is fixed,

$ 0 lt.eq I_S lt.eq 1 \, #h(2em) 1 lt.eq R_S lt.eq C \, #h(2em) nu_S \( 1 \) lt.eq C \, $

with a constant independent of $l \, p \, S$.

Every $nu_S$ is invariant under the slot involution $theta$ of any reflection cut. Indeed, simultaneous symbol relabeling preserves $H^S$: it conjugates the transposition defining an interaction and leaves the exchanged positions unchanged. If the cut block is marked, addresses are unchanged. If it is unmarked, reflection permutes the lists, preserving each directed edge because left symbol permutations commute with right composition by $c$. Reindexing the independent lists and indices therefore preserves the measure. In particular, every component has a symmetric matrix at every cut.

=== 3.3 Positivity across a cut <positivity-across-a-cut>

Fix a reflection cut in block $b$. For a real function $J : bb(F)_p^(V_(+)) arrow.r bb(R)$, write

$ Q_S \( J \) = integral J \( \( z_v \)_(v in V_(+)) \) J \( \( z_(theta v) \)_(v in V_(+)) \) thin d nu_S \( z \) . $

We compare $Q_S$ with $Q_(S union { b })$. When $b$ is marked, the index interactions give a fixed positive lower bound. When $b$ is unmarked, list mixing bounds any negative contribution by a power of $p$. The same half-label square occurs in both bounds after concatenating the lists.

#thm([Lemma 3.2.])[
  (Positivity at a marked block).  #emph[There is a constant $c_(*) > 0$, independent of $l \, p \, S$ and the cut, such that if $b in S$, then 
#[#set math.equation(numbering: n => "(3.2)")
 $ Q_S \( J \) gt.eq c_(*) thin bb(E)_(Y \, j_(+)) I_S \( Y \) J #scale(x: 120%, y: 120%)[\(] \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) #scale(x: 120%, y: 120%)[\)]^2 . $ <eq:4>]

 Here $j_(+)$ consists of independent uniform indices on $V_(+)$.]
] <tuple:marked-positive>

#proof[
  The interaction between the two halves is governed by the symmetric matrix
  $ sans(A)_(x y) = H_(x \, theta y)^S \, #h(2em) x \, y in V_(+) . $
  Fix $x in V_(+)$, and suppose that the cut symbols occur at positions $i < j$ in its cut block, with gap $g = j - i$. Swapping the cut symbols gives the diagonal entry $sans(A)_(x x) = Delta^g$. Any other transposition carrying $x$ across the cut must move the first cut symbol to a position beyond $j$, or the second to a position before $i$. Its gap is at least $g + 1$. There are fewer than $L^2$ such transpositions; transpositions in other blocks do not cross the cut. Consequently the absolute off-diagonal row sum is at most $L^2 Delta^(g + 1) = Delta^g \/ 10$. Symmetric diagonal dominance gives
  $ sans(A) succ.curly.eq kappa "Id" \, #h(2em) kappa = 9 / 10 Delta^(L - 1) > 0 . $
  For $j in \[ ell_s \]^(V_(+))$ define $u \( j \) = \( upright(bold(1))_({ j_x = i }) \)_(x in V_(+) \, thin i in \[ ell_s \])$. After identifying the minus side with the plus side by reflection, the cross-interaction matrix on half-index assignments is
  $ C_(j \, j') = exp #scale(x: 120%, y: 120%)[\(] u \( j \)^T \( sans(A) ⊗ "Id" \) u \( j' \) #scale(x: 120%, y: 120%)[\)] . $
  Split $sans(A) = \( sans(A) - kappa "Id" \) + kappa "Id"$. The entrywise exponential associated with the first summand is positive semidefinite: its power-series expansion is a sum of Gram matrices of tensor powers. Its diagonal entries are at least one. The exponential associated with the second summand is a tensor product, over $x in V_(+)$, of
  $ upright(bold(1)) upright(bold(1))^T + \( exp \( kappa \) - 1 \) "Id" $
  on $\[ ell_s \]$. It therefore dominates $a_(*) "Id"$, where $a_(*) = \( exp \( kappa \) - 1 \)^(n_(*))$. The entrywise product of positive semidefinite matrices is positive semidefinite, as follows directly from their Gram representations. Multiply the lower bound for the second exponential entrywise by the first. The resulting diagonal lower bound is at least $a_(*) "Id"$ because the first exponential has diagonal entries at least one. Thus $C succ.curly.eq a_(*) "Id"$.
  The interactions within the two halves give the same diagonal factor on either side of $C$, with all entries at least one. The full index matrix retains the lower bound $a_(*) "Id"$. For fixed lists $Y$, reflected vertices have the same address because $b$ is marked. The half-label evaluations therefore form the same vector on both sides of this matrix, even when some field labels coincide. There are $ell_s^(n_(*))$ half-index assignments. Averaging uniformly on both sides converts the matrix lower bound into
  $ bb(E)_(j_(+) \, j_(-)) R_S \( j \) J \( \( z_v \)_(v in V_(+)) \) J \( \( z_(theta v) \)_(v in V_(+)) \) gt.eq a_(*) ell_s^(- n_(*)) thin bb(E)_(j_(+)) J \( \( z_v \)_(v in V_(+)) \)^2 . $
  Multiplying by $I_S \( Y \)$ and averaging $Y$ proves (3.2) with $c_(*) = a_(*) ell_(t + 1)^(- n_(*))$. ◻
]

#thm([Lemma 3.3.])[
  (The contribution at an unmarked block).  #emph[Suppose $b in.not S$. Split the address lists into the two halves of the cut. Denote the plus lists by $Y_(+)$, and let $I_(+) \( Y_(+) \)$ be the product of the weights on edges internal to them. Put 
$ cal(D)_S \( J \) = bb(E)_(Y_(+) \, j_(+)) I_(+) \( Y_(+) \) J #scale(x: 120%, y: 120%)[\(] \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) #scale(x: 120%, y: 120%)[\)]^2 . $

 If $\| S \| lt.eq t$, then 
#[#set math.equation(numbering: n => "(3.3)")
 $ Q_S \( J \) gt.eq - C p^(- delta) cal(D)_S \( J \) . $ <eq:5>]

 If $\| S \| = t + 1$, then $Q_S \( J \) gt.eq 0$.]
] <tuple:unmarked-defect>

#proof[
  Reflection identifies the minus lists and their internal edge factors with the plus lists and their internal factors. No index interaction crosses this cut: an interaction changes only a marked block, whereas the cut is determined by the unmarked block $b$. The two within-half index weights are likewise identified by reflection; write $R_(+)$ for the one on the plus half.
  Let $K \( Y_(+) \, Y_(-) \)$ be the product of all cross-list edge weights. Then $Q_S \( J \)$ is the quadratic form of this kernel on the half function
  $ g \( Y_(+) \) = I_(+) \( Y_(+) \) bb(E)_(j_(+)) R_(+) \( j_(+) \) J #scale(x: 120%, y: 120%)[\(] \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) #scale(x: 120%, y: 120%)[\)] . $
  Cauchy–Schwarz, the uniform bound on $R_(+)$, and $I_(+)^2 lt.eq I_(+)$ give $parallel g parallel_2^2 lt.eq C cal(D)_S \( J \)$. By (3.1), the kernel $K$ differs in operator norm by $O \( p^(- delta) \)$ from the constant $c_p^(e_(upright("cross")))$, where $e_(upright("cross"))$ is its number of edges. The constant contributes $c_p^(e_(upright("cross"))) \( bb(E) g \)^2 gt.eq 0$. This proves (3.3). In the terminal case $I_S = 1$, so the cross kernel is exactly one and the entire form is nonnegative. ◻
]

#thm([Lemma 3.4.])[
  (Domination after marking one more block).  #emph[If $b in.not S$ and $\| S \| lt.eq t$, then, with $S' = S union { b }$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ Q_(S') \( J \) gt.eq c_(*) r_(*)^(- n_(*)) cal(D)_S \( J \) . $ <eq:6>]

]
] <tuple:marking-domination>

#proof[
  Let $Pi_(+)$ be the $r_(*)$ words in block $b$ satisfying the cut order. For each new address $u in U_(S')$, the old plus addresses above it are $\( u \, q \)$ with $q in Pi_(+)$; here $q$ is inserted in block $b$. Concatenate their lists by identifying
  $ \[ ell_(s + 1) \] med tilde.equiv med Pi_(+) times \[ ell_s \] \, #h(2em) Y'_(u \, \( q \, i \)) = Y_(\( u \, q \) \, i) . $
  This is a bijection of independent uniform list entries, so it changes neither their joint distribution nor the value of an average. Figure 1 separates this relabeling from the index restriction used below.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1.55, 0.85), [#text(size: 9pt)[$r_*$ old plus lists#linebreak()addresses $(u,q)$, $q in Pi_+$]])
  content((8.65, 0.85), [#text(size: 9pt)[one new list at $u$#linebreak()length $ell_(s+1)=r_* ell_s$]])
  content((1.55, 0), [#box(width: 3.1cm, height: 0.56cm, inset: 0.3333em, radius: 1pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$1 dots.h ell_s$]]])])
  content((-0.15, 0), [#text(size: 9pt)[$q_1$]], anchor: "east", padding: 0.1176cm)
  content((1.55, -0.62), [#text(size: 9pt)[$dots.v$]])
  content((1.55, -1.25), [#box(width: 3.1cm, height: 0.56cm, inset: 0.3333em, radius: 1pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#e8e8ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$1 dots.h ell_s$]]])])
  content((-0.15, -1.25), [#text(size: 9pt)[$q=v_b$]], anchor: "east", padding: 0.1176cm)
  content((1.55, -1.88), [#text(size: 9pt)[$dots.v$]])
  content((1.55, -2.5), [#box(width: 3.1cm, height: 0.56cm, inset: 0.3333em, radius: 1pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$1 dots.h ell_s$]]])])
  content((-0.15, -2.5), [#text(size: 9pt)[$q_(r_*)$]], anchor: "east", padding: 0.1176cm)
  line((3.38, -1.25), (6.82, -1.25), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((5.1, -1.13), [#text(size: 9pt)[bijective relabeling]], anchor: "south", padding: 0.1176cm)
  content((5.1, -1.37), [#text(size: 9pt)[no restriction]], anchor: "north", padding: 0.1176cm)
  rect((7.05, 0.32), (10.25, -2.82), stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), radius: 1pt)
  content((8.65, 0), [#text(size: 9pt)[$\{q_1\} times [ ell_s]$]])
  content((8.65, -0.62), [#text(size: 9pt)[$dots.v$]])
  rect((7.05, -0.97), (10.25, -1.53), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#000099"), thickness: 0.55pt, miter-limit: 10))
  content((8.65, -1.25), [#text(size: 9pt)[$\{v_b\} times [ ell_s]$]])
  content((8.65, -1.88), [#text(size: 9pt)[$dots.v$]])
  content((8.65, -2.5), [#text(size: 9pt)[$\{q_(r_*)\} times [ ell_s]$]])
  line((8.65, -2.92), (8.65, -3.72), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.45, -3.32), [#text(size: 9pt)[restrict the index#linebreak()to $q=v_b$]], anchor: "east", padding: 0.1176cm)
  content((8.85, -3.32), [#text(size: 9pt)[probability $1"/"r_*$]], anchor: "west", padding: 0.1176cm)
  content((8.65, -4.1), [#box(width: 3.1cm, height: 0.56cm, inset: 0.3333em, radius: 1pt, stroke: (paint: rgb("#595959"), thickness: 0.55pt, miter-limit: 10), fill: rgb("#e8e8ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$j'_v=(v_b,i)$]]])])
  content((8.65, -4.42), [#text(size: 9pt)[$i$ uniform on $[ ell_s]$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Regrouping at a fixed new address $u = u_(S union { b }) \( v \)$ and restricting the index of one slot $v in V_(+)$. The horizontal arrow only relabels the same independent entries; it incurs no probability factor. The highlighted sublist is prescribed by $v_b$. Restricting all $n_(*)$ independent slot indices to their respective prescribed sublists has probability $r_(*)^(- n_(*))$. The ellipses denote the other words in $Pi_(+)$; boxes describe index positions, and their field values may coincide. ],
  ) <tuple:fig-regrouping>
  A new address edge requires $t + 1$ shifted blocks outside $S'$. Those blocks also certify an old edge for every choice of the two words in block $b$. Hence every factor of $I_(S') \( Y' \)$ occurs, with its direction unchanged, among the factors of $I_(+) \( Y_(+) \)$. Since all factors belong to $\[ 0 \, 1 \]$,
  $ I_(+) \( Y_(+) \) lt.eq I_(S') \( Y' \) . $
  When $S'$ is terminal this inequality follows from $I_(S') = 1$.
  Apply (3.2) to $S'$. In its nonnegative right-hand side, restrict the new index at each $v in V_(+)$ to the sublist ${ v_b } times \[ ell_s \]$. Each restriction has probability $1 \/ r_(*)$, independently across the $n_(*)$ slots. On this event the labels and the remaining independent indices are exactly those in $cal(D)_S \( J \)$. Its probability is $r_(*)^(- n_(*))$, and the pointwise weight comparison above now yields (3.4). ◻
]

=== 3.4 The mixture, its support, and covariance <the-mixture-its-support-and-covariance>

We can now choose the mixture. The gain in (3.4) is a fixed positive constant, whereas the possible loss in (3.3) tends to zero with $p$. Thus a component with one more marked block may receive a smaller coefficient and still compensate for that loss.

#thm([Proposition 3.5.])[
  (Reflection-positive laws with polynomial cycle support).  #emph[For all sufficiently large primes $p$, uniformly in $l gt.eq 1$, define 
$ M_(l \, p) & = sum_(S subset.eq \[ w \]\
\| S \| lt.eq t + 1) p^(- \| S \| delta \/ 2) nu_(l \, p \, S) \,\
mu_(l \, p) & = frac(M_(l \, p), M_(l \, p) \( 1 \)) \,\
epsilon_(l \, p) & = frac(1, M_(l \, p) \( 1 \)) sum_(\| S \| = t + 1) p^(- \( t + 1 \) delta \/ 2) nu_(l \, p \, S) . $

 Then $mu_(l \, p)$ is a reflection-positive probability law and $0 lt.eq epsilon_(l \, p) lt.eq mu_(l \, p)$. Its exceptional mass satisfies 
$ eta_(l \, p) := epsilon_(l \, p) \( 1 \) lt.eq p^(- 4) . $

 The probability law 
$ mu_(l \, p)^compose = frac(mu_(l \, p) - epsilon_(l \, p), 1 - eta_(l \, p)) $

 has only admissible increments $z_(v_(j + 1)) - z_(v_j)$ along the designated cycle. Every component and both measures $mu_(l \, p)$, $epsilon_(l \, p)$ are invariant under simultaneous translation of all labels. Every positive-mass component or subsum therefore has uniform single-slot marginals after normalization. In either $mu_(l \, p)$ or $mu_(l \, p)^compose$, the total probability of components with $S eq.not diameter$ is $O \( p^(- delta \/ 2) \)$.]
] <tuple:laws>

#proof[
  At a cut in block $b$, pair each $S$ with $b in.not S$, $\| S \| lt.eq t$, with $S union { b }$. Each component containing $b$ appears in exactly one pair. Equations (3.3) and (3.4) bound the quadratic form of the pair below by
  $ p^(- \| S \| delta \/ 2) (p^(- delta \/ 2) c_(*) r_(*)^(- n_(*)) - C p^(- delta)) cal(D)_S \( J \) . $
  This is nonnegative once $p$ is sufficiently large. The only unpaired sets are terminal sets omitting $b$; their forms are nonnegative by Lemma 10. Thus $M_(l \, p)$ is reflection positive at every cut.
  For $S = diameter$, each list has length one and $R_S = 1$. Lemma 8 and $c_p gt.eq 1 \/ \( 2 k \)$ show that $nu_diameter \( 1 \)$ is bounded below by a fixed positive constant for all sufficiently large $p$. All component masses are bounded above, and the number of components is fixed. It follows that
  $ 0 < c lt.eq M_(l \, p) \( 1 \) lt.eq C \, #h(2em) epsilon_(l \, p) \( 1 \) lt.eq C p^(- \( t + 1 \) delta \/ 2) . $
  Our choice $\( t + 1 \) delta \/ 2 > 5$ gives the stated bound $p^(- 4)$ after increasing the prime threshold. Summing the nonleading coefficients also gives total probability $O \( p^(- delta \/ 2) \)$ for $S eq.not diameter$. Removing the terminal components retains the positive leading mass, so the same estimate holds after normalization to $mu_(l \, p)^compose$.
  Simultaneous translation of all list entries preserves their product law, all differences in $I_S$, and the index weight $R_S$. It therefore translates every output label and proves the asserted invariances and marginal uniformity.
  Finally, a nonterminal $S$ leaves at least $t + 1$ blocks unmarked. Consecutive cycle vertices shift by $c$ in all these blocks, including the edge from $v_(L - 1)$ to $v_0$. Their addresses are consequently joined by a directed edge. Since its weights include every pair of list entries, any positive-weight label tuple has admissible increment on this edge, regardless of the chosen indices. This holds around the entire cycle in every component retained by $mu_(l \, p)^compose$. ◻
]

The auxiliary parameter changes the edge weight, so we need covariance between different laws rather than dilation invariance of a single law.

#thm([Lemma 3.6.])[
  (Covariance under progression changes).  #emph[For every $l gt.eq 1$, every sufficiently large prime $p$, and every integer $D gt.eq 1$ with $p divides.not D$, the following holds. For each $a' in bb(F)_p$, the map 
#[#set math.equation(numbering: n => "(3.5)")
 $ \( z_v \)_(v in V) mapsto #scale(x: 120%, y: 120%)[\(] lambda \( D \)^(- 1) \( z_v - a' \) #scale(x: 120%, y: 120%)[\)]_(v in V) $ <eq:7>]

 pushes $mu_(l \, p)$ to $mu_(l D \, p)$ and $epsilon_(l \, p)$ to $epsilon_(l D \, p)$.]
] <tuple:covariance>

#proof[
  Equation (2.2) states that $h_l \( D x - i \) = lambda \( D \) h_(l D) \( x \)$. Both $D$ and $lambda \( D \)$ are units modulo $p$. The argument map $x mapsto D x - i$ is therefore a bijection and, on differentiating this identity, preserves regularity. Counting regular arguments gives
  $ W_(l D \, p) \( y \) = W_(l \, p) \( lambda \( D \) y \) . $
  Apply (3.5) to every list entry in a component measure. The independent uniform list law and all index weights are unchanged; each old edge weight becomes exactly the corresponding new edge weight. Thus the map pushes $nu_(l \, p \, S)$ to $nu_(l D \, p \, S)$ for each $S$. All component masses, and in particular the normalizing masses $M_(l \, p) \( 1 \)$ and $M_(l D \, p) \( 1 \)$, agree. The two claimed pushforwards follow with no additional factor. ◻
]

=== 3.5 Conditional mixing and the prime threshold <conditional-mixing-and-the-prime-threshold>

The mixture has the required positivity and support. To control high Fourier frequencies later, we also need to know that the other labels give little information about a mean-zero function of any one label. The leading component has this property by list mixing. The remaining components have small total probability, and their uniform marginals give the bound needed to include them.

#thm([Lemma 3.7.])[
  (Conditional mixing).  #emph[For all sufficiently large $p$, uniformly in $l$, let $rho_p$ be either $mu_(l \, p)$ or $mu_(l \, p)^compose$. For every $v in V$ and every function $f : bb(F)_p arrow.r bb(C)$ of uniform mean zero, 
#[#set math.equation(numbering: n => "(3.6)")
 $ ∥bb(E)_(rho_p) #scale(x: 120%, y: 120%)[\(] f \( z_v \) divides \( z_(v') \)_(v' eq.not v) #scale(x: 120%, y: 120%)[\)]∥_2 lt.eq p^(- gamma) parallel f parallel_2 . $ <eq:8>]

 The norm on the left is taken in the other-label marginal of $rho_p$; the norm on the right is uniform on $bb(F)_p$.]
] <tuple:conditional-mixing>

#proof[
  First normalize the leading component $nu_diameter$, and write $x = z_v$, $y = \( z_(v') \)_(v' eq.not v)$. Before normalization its density relative to uniform labels is $K_1 \( x \, y \) K_2 \( y \)$, where $K_1$ is the product of the $m$ weights on edges incident to $v$, and $K_2$ contains the remaining weights. Put
  $ A \( y \) = bb(E)_x K_1 \( x \, y \) \, #h(2em) B_f \( y \) = bb(E)_x f \( x \) K_1 \( x \, y \) . $
  The incident edges form a graph between the singleton list $x$ and the list $y$. Equation (3.1), applied to this kernel, gives
  $ parallel A - c_p^m parallel_2 lt.double p^(- delta) \, #h(2em) parallel B_f parallel_2 lt.double p^(- delta) parallel f parallel_2 . $
  This includes $m = 0$, when $A = 1$ and $B_f = 0$.
  Let $Z_0 = nu_diameter \( 1 \)$, which is bounded below uniformly. The other-label marginal has density $Z_0^(- 1) K_2 \( y \) A \( y \)$, and the conditional expectation equals $B_f \( y \) \/ A \( y \)$ where $A \( y \) > 0$. Its squared norm is therefore exactly
  $ 1 / Z_0 bb(E)_y K_2 \( y \) frac(\| B_f \( y \) \|^2, A \( y \)) \, $
  with the ratio taken as zero if $A \( y \) = 0$. On $A gt.eq c_p^m \/ 2$, the bound on $B_f$ makes this $O \( p^(- 2 delta) \) parallel f parallel_2^2$. The complement has uniform probability $O \( p^(- 2 delta) \)$, by the bound on $A - c_p^m$ and the fixed positive lower bound on $c_p^m$. Everywhere, weighted Cauchy–Schwarz gives
  $ frac(\| B_f \( y \) \|^2, A \( y \)) lt.eq bb(E)_x \| f \( x \) \|^2 K_1 \( x \, y \) lt.eq parallel f parallel_2^2 . $
  Since $K_2 lt.eq 1$, the complement has the same required bound. Thus the squared conditional norm in the normalized leading component is $O \( p^(- 2 delta) \) parallel f parallel_2^2$.
  For either mixture, condition additionally on its component index. The tower property and Jensen’s inequality can only increase the squared conditional norm under this extra conditioning. In each nonleading component the trivial bound is $parallel f parallel_2^2$, because its single-slot marginal is uniform. Proposition 12 bounds their total probability by $O \( p^(- delta \/ 2) \)$. The squared norm for the mixture is consequently $O \( p^(- delta \/ 2) \) parallel f parallel_2^2$, and the norm is $O \( p^(- delta \/ 4) \) parallel f parallel_2$. Since $gamma = delta \/ 10$, the fixed implicit constant is absorbed by taking $p$ sufficiently large, proving (3.6). ◻
]

We require a threshold $P > P_1$ such that all the preceding assertions hold for every prime $p gt.eq P$, uniformly in $l$. We further require

#[#set math.equation(numbering: n => "(3.7)")
 $ 3 lt.eq p^(gamma \/ 2) quad \( p gt.eq P \) \, #h(2em) product_(p gt.eq P\
p med upright("prime")) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 . $ <eq:9>]

The second requirement is possible by convergence of the product. For such a choice, define the small-prime modulus

$ M_0 = product_(p < P\
p med upright("prime")) p^(E_p) gt.eq 2 \, $

using the exponents $E_p$ from Section 2. If a modulus is $M_0$ times a squarefree product of primes at least $P$, a residue modulo that modulus is called admissible for $l$ when it is admissible at each of its local prime-power factors. This convention combines the small-prime lifting conditions with the cycle support supplied by Proposition 12.

=== 3.6 Dependence of the tuple threshold <dependence-of-the-tuple-threshold>

To obtain an exponent depending only on the degree, we need the tuple threshold to be uniform when the local choices are uniform. The next proposition traces that dependence while retaining the construction for general fixed polynomial data.

#thm([Proposition 3.8.])[
  (Dependence of the prime threshold).  #emph[For the auxiliary family and local choices above, the threshold $P$ can be chosen as a function of $k \, P_1 \, L \, t$ alone so that Proposition 12, Lemmas 13 and 14, and (3.7) hold uniformly in $l$. For general fixed data, $P_1$ may depend on $h$, and $L$ may depend on $h$ and its chosen roots. If $h$ satisfies Condition (U) and the degree-dependent choices of $P_1$, $E_p$, and $L$ from Section 2 are used, then $P$ and $M_0$ depend only on $k$.]
] <tuple:threshold-dependence>

#proof[
  For every prime $p gt.eq P_1$, the quantitative local input to the estimates above is
  $ 0 lt.eq W_(l \, p) lt.eq 1 \, #h(2em) c_p gt.eq \( 2 k \)^(- 1) \, #h(2em) max_(u eq.not 0) \| hat(W)_(l \, p) \( u \) \| lt.eq p^(- 4 delta) . $
  Indeed, with the normalized Fourier convention, for $u eq.not 0$ the coefficient $hat(W)_(l \, p) \( u \)$ is $c_p$ times the corresponding regular-argument average in (2.4); also $c_p lt.eq 1$. These statements hold uniformly in $l$. We extract constants from the preceding proofs using
  $ e_(*) := binom(d, 2) \, #h(2em) R_(*) := exp \( e_(*) \) \, #h(2em) C_(upright("gr")) := \( 32 e_(*) \)^(1 \/ 4) \, #h(2em) Z_(*) := 1 / 2 \( 2 k \)^(- e_(*)) . $
  They depend only on $k \, L \, t$, since $d = \( L ! \)^(2 t + 1)$.
  For a set of $s$ marked blocks, the graph on list entries has $K^(w - s) ell_s = d \/ 2^s lt.eq d$ formal vertices. Its simplicity was checked above before field labels were assigned, so coincidences between their values do not affect the graph bound. Every graph for $I_S$, every cross-list graph in Lemma 10, and every incident graph in Lemma 14 consequently has at most $e_(*)$ edges. Lemma 8 therefore bounds their graph errors by $e_(*) p^(- 4 delta)$. For the cross-list and incident graphs, which join two lists, it bounds the operator errors by $C_(upright("gr")) p^(- delta)$.
  Each index interaction $H_(x y)^S$ is at most one, so $R_S$ and every within-half weight $R_(+)$ are at most $R_(*)$. In particular, $nu_S \( 1 \) lt.eq R_(*)$. The proof of Lemma 9 gives the explicit constant
  $ c_(*) = \( exp \( kappa \) - 1 \)^(n_(*)) ell_(t + 1)^(- n_(*)) \, #h(2em) kappa = 9 / 10 \( 10 L^2 \)^(- \( L - 1 \)) . $
  The exact half-index factor $ell_s^(- n_(*))$ proved there and the exact index-restriction factor $r_(*)^(- n_(*))$ in Lemma 11 give the domination constant $c_(*) r_(*)^(- n_(*))$. In the unmarked proof, Cauchy–Schwarz and $I_(+)^2 lt.eq I_(+)$ give $parallel g parallel_2^2 lt.eq R_(*)^2 cal(D)_S \( J \)$. The list bound just obtained thus allows the constant in (3.3) to be
  $ C_(upright("def")) := R_(*)^2 C_(upright("gr")) . $
  The pairing proof of Proposition 12 is therefore nonnegative at every cut whenever
  $ p^(delta \/ 2) gt.eq C_(upright("def")) r_(*)^(n_(*)) \/ c_(*) . $
  Let $e_0 lt.eq e_(*)$ be the number of edges in the leading component. The graph estimate and the lower bound on $c_p$ give
  $ nu_diameter \( 1 \) gt.eq c_p^(e_0) - e_0 p^(- 4 delta) gt.eq \( 2 k \)^(- e_(*)) - e_(*) p^(- 4 delta) . $
  Consequently $nu_diameter \( 1 \) gt.eq Z_(*)$ once $e_(*) p^(- 4 delta) lt.eq Z_(*)$. There are at most $2^w$ components, each of mass at most $R_(*)$. Set
  $ C_(upright("mass")) := frac(2^w R_(*), Z_(*)) \, #h(2em) alpha_(upright("exc")) := frac(\( t + 1 \) delta, 2) > 5 . $
  The normalizing mass $M_(l \, p) \( 1 \)$ is at least the leading mass, so
  $ eta_(l \, p) lt.eq C_(upright("mass")) p^(- alpha_(upright("exc"))) . $
  It is at most $p^(- 4)$ if $p^(alpha_(upright("exc")) - 4) gt.eq C_(upright("mass"))$. In either $mu_(l \, p)$ or $mu_(l \, p)^compose$ the probability of nonleading components is at most $C_(upright("mass")) p^(- delta \/ 2)$. For the latter law, its unnormalized mass after removing the terminal terms still contains $nu_diameter \( 1 \) gt.eq Z_(*)$; hence the same denominator bound applies without an additional normalization factor. Cycle support and translation invariance in Proposition 12 are exact properties of these components and impose no further threshold.
  For the leading component in Lemma 14, the incident graph has $m lt.eq e_(*)$ edges. Its list operator error is at most $C_(upright("gr")) p^(- delta)$. The split into $A gt.eq c_p^m \/ 2$ and its complement in that proof therefore bounds the squared conditional norm by
  $ Z_0^(- 1) C_(upright("gr"))^2 #scale(x: 120%, y: 120%)[\(] 2 c_p^(- m) + 4 c_p^(- 2 m) #scale(x: 120%, y: 120%)[\)] p^(- 2 delta) parallel f parallel_2^2 . $
  Using $Z_0 gt.eq Z_(*)$ and $c_p^(- m) lt.eq \( 2 k \)^(e_(*))$ bounds this by
  $ C_(upright("lead")) p^(- 2 delta) parallel f parallel_2^2 \, #h(2em) C_(upright("lead")) := Z_(*)^(- 1) C_(upright("gr"))^2 #scale(x: 120%, y: 120%)[\(] 2 \( 2 k \)^(e_(*)) + 4 \( 2 k \)^(2 e_(*)) #scale(x: 120%, y: 120%)[\)] . $
  The case $m = 0$ already has zero conditional norm. For either mixture, conditioning additionally on the component index and applying Jensen’s inequality bounds its squared conditional norm by
  $ #scale(x: 120%, y: 120%)[\(] C_(upright("lead")) p^(- 2 delta) + C_(upright("mass")) p^(- delta \/ 2) #scale(x: 120%, y: 120%)[\)] parallel f parallel_2^2 lt.eq \( C_(upright("lead")) + C_(upright("mass")) \) p^(- delta \/ 2) parallel f parallel_2^2 . $
  Here the bound in every other component is $parallel f parallel_2^2$ because its single-slot marginal is uniform. As $delta \/ 2 - 2 gamma = 3 delta \/ 10 > 0$, the desired squared bound $p^(- 2 gamma) parallel f parallel_2^2$ follows once
  $ p^(delta \/ 2 - 2 gamma) gt.eq C_(upright("lead")) + C_(upright("mass")) . $
  Choose an integer $P > P_1$ large enough that the displayed requirements on $p$ above hold for every $p gt.eq P$, and that $P^(gamma \/ 2) gt.eq 3$. This is possible because $delta > 0$, $alpha_(upright("exc")) - 4 > 0$, and $delta \/ 2 - 2 gamma > 0$, and all the constants depend only on $k \, L \, t$. The product condition in (3.7) can be included in the same choice: for integer $P gt.eq 2$,
  $ product_(p gt.eq P\
p med upright("prime")) \( 1 + p^(- 3) \) lt.eq exp (sum_(n gt.eq P) n^(- 3)) lt.eq exp (frac(1, 2 \( P - 1 \)^2)) \, $
  whose last expression tends to one. The covariance proof uses only the exact progression identity and bijections when $p divides.not D$, so it imposes no further restriction on $P$. This proves the stated dependence of $P$. Under Condition (U), Section 2 allows $P_1 \, L$ to be chosen from $k$ and each $E_p$ from $k \, p$. Also, $t$ is chosen from $delta$, which depends only on $k$. The product defining $M_0$ then uses a degree-dependent set of primes and degree-dependent exponents. For a general fixed polynomial, $M_0$ retains any dependence of the local exponents $E_p$ as well as that of $P_1$ and $L$. ◻
]

For the rest of the paper, fix a choice of $P$ supplied by Proposition 15 and the corresponding $M_0$.

== 4 Multilinear estimates and Fourier lifts <sec:lifts>

The tuple laws of Section 3 provide two ways to control multilinear averages: reflection positivity compares different inputs with a single diagonal quantity, while conditional mixing suppresses large Fourier denominators. We develop both estimates, then prove the moment bounds needed to apply them to bounded functions on integer intervals. The signed-form estimates adapt #cite(label("squarepower")) Proposition 4.1 and Lemmas 4.2–4.3. We prove the needed estimates for the present laws, with changes of auxiliary parameter replacing the dilation invariance used in the square setting.

Retain the index set $V = Pi^w$, where $Pi$ consists of the permutation words on $\[ L \]$, and put $d = \| V \|$; in particular, $d$ is even. Fix a positive integer $l$ and a finite set $cal(P)$ of primes at least $P$. Set

$ X_(cal(P)) = product_(p in cal(P)) bb(F)_p \, #h(2em) mu_(l \, cal(P)) = ⨂_(p in cal(P)) mu_(l \, p) . $

We collect the prime labels in slot $v$ into a single variable $z_v in X_(cal(P))$, so $mu_(l \, cal(P))$ is a probability law on $X_(cal(P))^V$. Each single-slot marginal is uniform. Norms of functions on $X_(cal(P))$ will always use uniform probability measure unless another measure is specified. For real functions on this space define

$ cal(Z)_(l \, cal(P)) \( \( g_v \)_(v in V) \) = integral product_(v in V) g_v \( z_v \) thin d mu_(l \, cal(P)) \, #h(2em) Z_(l \, cal(P)) \( g \) = cal(Z)_(l \, cal(P)) \( \( g \)_(v in V) \) . $

The empty prime set is allowed: its residue space is a singleton and $Z_(l \, diameter) \( g \) = g^d$.

We also fix the Fourier notation on these spaces. Every frequency has a unique additive decomposition

$ xi = sum_(p in cal(P)) a_p / p med \( mod med 1 \) \, #h(2em) 0 lt.eq a_p < p \, $

and its character is $e \( z xi \) = product_(p in cal(P)) e \( a_p z_p \/ p \)$. Equivalently, one may use any integer representative of $z$ supplied by the Chinese remainder theorem. The #emph[exact support] of this character is ${ p : a_p eq.not 0 }$; its reduced denominator is the product of those primes. For $B subset.eq cal(P)$ write $q_B = product_(p in B) p$, with $q_diameter = 1$.

=== 4.1 Signed Hölder inequality and seminorm rules <signed-hölder-inequality-and-seminorm-rules>

The finite reflection argument below follows the chessboard method of Fröhlich, Israel, Lieb and Simon #cite(label("FILS1978")) Theorem 4.1; related reflection arguments for graph norms appear in Conlon and Lee #cite(label("ConlonLee2017")) Section 3. The standard passage from a multilinear Hölder inequality to a seminorm is also part of Hatami’s criterion for graph norms #cite(label("Hatami2010")) Theorem 2.8 of the arXiv version; we prove both steps directly for the present tuple laws.

#thm([Proposition 4.1.])[
  (Signed Hölder inequality).  #emph[For every positive integer $l$, finite set $cal(P)$ of primes at least $P$, and real functions $g \, g_v : X_(cal(P)) arrow.r bb(R)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ Z_(l \, cal(P)) \( g \) gt.eq 0 \, #h(2em) lr(|cal(Z)_(l \, cal(P)) \( \( g_v \)_(v in V) \)|) lt.eq product_(v in V) Z_(l \, cal(P)) \( g_v \)^(1 \/ d) . $ <eq:10>]

]
] <lift:signed-holder>

#proof[
  Across any reflection cut of $V$, the matrix of the product law is the tensor product of the corresponding prime-law matrices. It is therefore positive semidefinite. To explain its consequence for signed inputs, fix a cut $V = V_(+) union.sq V_(-)$ and its reflection $theta$. Define maps $phi.alt_plus.minus : V arrow.r V_plus.minus$ that fix the selected half and reflect the other half into it. An assignment of functions is a map $a : v mapsto g_v$; write its integral as $Lambda \( a \)$. The two real functions on the plus-half labels that enter the cut bilinear form are
  $ F \( x \) = product_(v in V_(+)) a \( v \) \( x_v \) \, #h(2em) G \( x \) = product_(v in V_(+)) a \( theta v \) \( x_v \) . $
  Its mixed value is $Lambda \( a \)$, and its two quadratic values are $Lambda \( a compose phi.alt_(+) \)$ and $Lambda \( a compose phi.alt_(-) \)$. Cauchy–Schwarz for the positive semidefinite matrix gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ \| Lambda \( a \) \|^2 lt.eq Lambda \( a compose phi.alt_(+) \) Lambda \( a compose phi.alt_(-) \) \, #h(2em) Lambda \( a compose phi.alt_plus.minus \) gt.eq 0 . $ <lift:fold-cs>]
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
 $ ∥g #scale(x: 120%, y: 120%)[\(] lambda \( D \)^(- 1) \( thin dot.op - a' \) #scale(x: 120%, y: 120%)[\)]∥_(l \, cal(P)) = parallel g parallel_(l D \, cal(P)) . $ <lift:transport>]

 Here the affine change is interpreted separately at each prime.]
] <lift:seminorm>

#proof[
  Nonnegativity follows from Proposition 16. Since $d$ is even, homogeneity of $Z$ gives absolute homogeneity of its $d$-th root. Expanding $Z \( g + h \)$ by its slots and applying (4.1) termwise gives
  $ Z_(l \, cal(P)) \( g + h \) lt.eq sum_(S subset.eq V) parallel g parallel_(l \, cal(P))^(\| S \|) parallel h parallel_(l \, cal(P))^(d - \| S \|) = #scale(x: 120%, y: 120%)[\(] parallel g parallel_(l \, cal(P)) + parallel h parallel_(l \, cal(P)) #scale(x: 120%, y: 120%)[\)]^d . $
  Taking roots proves the triangle inequality. Putting $g$ in one slot and 1 in all others in (4.1) proves mean domination, since the single-slot marginal is uniform and $Z \( 1 \) = 1$.
  The simultaneous translation invariance of the tuple laws proves that translations are isometries. Let $G_B subset.eq X_(cal(P))$ be the additive subgroup of vectors supported on $B$. Then
  $ \( bb(E)_B g \) \( z \) = frac(1, \| G_B \|) sum_(a in G_B) g \( z + a \) . $
  The triangle inequality gives the asserted contraction. Since $bb(E)_B g$ is independent of $B$, the probability laws at those primes integrate out, proving the equality of the two seminorms. Finally, $lambda \( D \)$ is a unit at each remaining prime, and (3.5) pushes the product law at $l$ exactly to that at $l D$. This proves (4.3). ◻
]

=== 4.2 Decay at large Fourier denominators <decay-at-large-fourier-denominators>

Conditional mixing gives a different estimate, valid also after removing the exceptional part of each prime law. Its proof requires orthogonality between different exact supports; applying the triangle inequality to all Fourier coefficients would lose this decay.

#thm([Lemma 4.3.])[
  (Large-denominator estimate).  #emph[Fix $l gt.eq 1$ and a finite prime set $cal(P)$ as above. At each prime choose either $rho_p = mu_(l \, p)$ or $rho_p = mu_(l \, p)^compose$. Let $g_v : X_(cal(P)) arrow.r bb(C)$ be arbitrary functions. If, in one distinguished slot $v$, every Fourier coefficient at a denominator at most $R$ vanishes, where $R gt.eq 1$, then 
#[#set math.equation(numbering: n => "(4.4)")
 $ lr(|integral product_(u in V) g_u \( z_u \) thin d ⨂_(p in cal(P)) rho_p|) lt.eq R^(- gamma) parallel g_v parallel_2 product_(u eq.not v) parallel g_u parallel_(2 \( d - 1 \)) . $ <eq:11>]

]
] <lift:large-denominator>

#proof[
  At one prime, let $frak(m)_p$ denote the marginal law of the labels in all slots other than $v$, and let
  $ T_p f = bb(E)_(rho_p) #scale(x: 120%, y: 120%)[\(] f \( z_v \) divides \( z_u \)_(u eq.not v) #scale(x: 120%, y: 120%)[\)] . $
  This is an operator from uniform $L^2 \( bb(F)_p \)$ to $L^2 \( frak(m)_p \)$. It preserves constants. It sends uniform-mean-zero inputs to $frak(m)_p$-mean-zero outputs, since $bb(E)_(frak(m)_p) T_p f = bb(E) f$. By (3.6), its norm on the mean-zero subspace is at most $p^(- gamma)$.
  The product law makes the conditional operator for all primes equal to $T = ⨂_p T_p$: this identity holds first for products of one-prime functions, by independence across primes, and then for every function by linearity. The exact-support $B$ Fourier space has a mean-zero factor at primes in $B$ and a constant factor elsewhere. On this space the operator norm is at most $q_B^(- gamma)$. Furthermore, the images of two distinct exact-support spaces are orthogonal in $L^2 \( ⨂_p frak(m)_p \)$. At a prime in the symmetric difference of the supports, one image factor is constant and the other has mean zero. Their inner product is zero, and tensoring preserves this orthogonality.
  Decompose $g_v = sum_(q_B > R) g_(v \, B)$ by exact supports. Both the domain summands and their images are orthogonal, so
  $ parallel T g_v parallel_2^2 = sum_(q_B > R) parallel T g_(v \, B) parallel_2^2 lt.eq sum_(q_B > R) q_B^(- 2 gamma) parallel g_(v \, B) parallel_2^2 lt.eq R^(- 2 gamma) parallel g_v parallel_2^2 . $
  Condition the original integral on the other slots and apply Cauchy–Schwarz. The remaining factor is bounded by
  $ ∥product_(u eq.not v) g_u \( z_u \)∥_2 lt.eq product_(u eq.not v) (bb(E) \| g_u \( z_u \) \|^(2 \( d - 1 \)))^(1 \/ \( 2 \( d - 1 \) \)) = product_(u eq.not v) parallel g_u parallel_(2 \( d - 1 \)) \, $
  using ordinary Hölder and the uniform single-slot marginals. This proves (4.4). If $cal(P)$ is empty, the frequency hypothesis forces $g_v = 0$, and the conclusion is immediate. ◻
]

=== 4.3 Fourier lifts and uniform moments <fourier-lifts-and-uniform-moments>

A bounded function on an integer interval gives Fourier coefficients at rational frequencies. We transfer a finite set of these coefficients to $X_(cal(P))$. Such a transfer need not preserve pointwise bounds, so we prove bounds for every fixed moment, following the Fourier-lift argument of #cite(label("squarepower")) Lemmas 5.1–5.2. We must also allow arbitrary subfamilies of complete exact supports, because fixing some residue coordinates changes which denominators remain.

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
 $ ∥sum_(B in cal(F)) f_B∥_(2 r) lt.eq C_(r \, epsilon.alt) parallel f parallel_oo Q^epsilon.alt . $ <eq:12>]

 The constant is independent of the prime set, the interval and its location, the function, and the subfamily.]
] <lift:moments>

#proof[
  The zero function is immediate; otherwise scale so that $parallel f parallel_oo lt.eq 1$. Write $N_I = \| I \|$, and let $u$ be the largest cardinality of a support whose prime product is at most $Q$. We first control conditional sums of squares of the $f_B$, then their square-function moments. Symmetrization will recover the moment of their sum.
  #emph[Conditional energy.] For $J subset.eq cal(P)$ with $q_J lt.eq Q$, and any fixed coordinate vector $z_J$, we claim that
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(B in cal(F)\
B supset.eq J) bb(E) #scale(x: 120%, y: 120%)[\(] \| f_B \|^2 divides z_J #scale(x: 120%, y: 120%)[\)] lt.double 4^(\| J \|) . $ <eq:13>]
  The conditional expectation here averages uniformly over all coordinates outside $J$. If $B supset.eq J$, the coefficient of an outside character $eta$ of exact support $B \\ J$, after fixing $z_J$, is
  $ c_J \( eta \; z_J \) = 1 / N_I sum_(x in I) f \( x \) e \( - x eta \) product_(p in J) #scale(x: 120%, y: 120%)[\(] p upright(bold(1))_({ x equiv z_p med \( mod med p \) }) - 1 #scale(x: 120%, y: 120%)[\)] . $
  Indeed, the sum over the nonzero frequencies at $p$ is $sum_(a = 1)^(p - 1) e \( a \( z_p - x \) \/ p \) = p upright(bold(1))_({ x equiv z_p med \( mod med p \) }) - 1$. Different supports $B supset.eq J$ have disjoint sets of outside characters. Conditional Parseval therefore identifies the left side of (4.6) with the squared Euclidean norm of this coefficient vector on the union of those character sets.
  Expand the product in $c_J$ over subsets $J' subset.eq J$. Apart from a sign, the corresponding vector has coordinates
  $ q_(J') / N_I sum_(x in I\
x equiv z_(J') med \( mod med q_(J') \)) f \( x \) e \( - x eta \) . $
  The congruence denotes the class determined by the fixed coordinates in $J'$; for the empty subset it imposes no restriction. Write its progression as $x = a + q_(J') n$, with $n$ in a consecutive interval of length $N'$. Then
  $ N' gt.eq 0.9 N_I \/ q_(J') \, #h(2em) N' q_(J') \/ N_I lt.eq 1.1 . $
  In these coordinates the frequencies are $q_(J') eta$, up to constant phases. They remain distinct because their denominators are coprime to $q_J$. Their denominators are at most $Q$, so they number at most $Q^2$ and have pairwise circle distance at least $Q^(- 2)$.
  The Gram matrix of these characters in normalized $L^2$ on the progression has diagonal 1. By geometric summation, every off-diagonal entry has modulus at most $Q^2 \/ \( 2 N' \)$. Its operator norm is therefore at most its maximum absolute row sum, which is bounded by
  $ 1 + frac(Q^4, 2 N') lt.eq 1 + frac(Q^5, 1.8 N_I) lt.eq 1 + frac(1, 18 Q) . $
  The associated Fourier analysis map has norm squared equal to this Gram-matrix norm. Since $parallel f parallel_oo lt.eq 1$ and $N' q_(J') \/ N_I lt.eq 1.1$, the displayed coefficient vector has Euclidean norm bounded by an absolute constant. The triangle inequality over the $2^(\| J \|)$ subsets $J'$, followed by squaring, proves (4.6).
  #emph[Square-function moments.] Set
  $ S \( z \) = (sum_(B in cal(F)) \| f_B \( z \) \|^2)^(1 \/ 2) . $
  Expand $bb(E) S^(2 r)$ and fix the supports of its first $r - 1$ factors. Their union $W'$ has size at most $\( r - 1 \) u$, and their product depends only on $z_(W')$. For the final support $B$, integration outside $W'$ leaves exactly $bb(E) \( \| f_B \|^2 divides z_J \)$, where $J = B ∩ W'$. Every intersection that occurs satisfies $q_J lt.eq q_B lt.eq Q$. For each fixed intersection $J$, the sum over supports with $B ∩ W' = J$ is bounded by the larger sum over all $B supset.eq J$ in (4.6). There are at most $2^(\( r - 1 \) u)$ possible intersections and each has at most $u$ elements. Thus
  $ bb(E) S^(2 r) lt.eq C thin 2^(\( r - 1 \) u) 4^u bb(E) S^(2 r - 2) . $
  The same argument with $r = 1$ uses $J = W' = diameter$. Iteration gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ parallel S parallel_(2 r) lt.eq C_r^(1 + u) . $ <lift:square-function>]
  The overlaps among supports have now been controlled. It remains to bound their sum by this square function with a loss exponential only in $u$.
  #emph[Recovering the sum.] Fix a support size $j gt.eq 1$ and color every prime coordinate with one of $j$ colors. Call a support #emph[transversal] when it has exactly one prime of each color, and let $cal(T)$ be the transversal supports in $cal(F)$ for this coloring. Take independent uniform pairs $X_p^0 \, X_p^1$ at every prime. The operator $"swap"_p$ interchanges these two copies. Define
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
  Now color independently and uniformly. A fixed size-$j$ support is transversal with probability $j ! \/ j^j gt.eq e^(- j)$, where here $e$ is Euler’s number; the inequality follows from $log \( j ! \) gt.eq integral_1^j log x thin d x$. Thus the full size-$j$ sum is exactly the coloring average of its transversal sum divided by this probability. Minkowski yields
  $ ∥sum_(B in cal(F)\
\| B \| = j) f_B∥_(2 r) lt.eq \( 2 e C_r \)^j parallel S parallel_(2 r) . $
  Include the constant term of size zero and sum over $j lt.eq u$. Together with (4.7), this bounds the norm of the full sum by $\( C'_r \)^(1 + u)$. Finally, the product of $u$ distinct primes is at least $\( u + 1 \) !$, so $\( u + 1 \) ! lt.eq Q$. Hence $u = o \( log Q \)$ as $Q arrow.r oo$, uniformly in the prime set. For every fixed $r$ and $epsilon.alt > 0$, $\( C'_r \)^(1 + u) lt.eq C_(r \, epsilon.alt) Q^epsilon.alt$. Restoring $parallel f parallel_oo$ proves (4.5) with all the stated uniformities. ◻
]

#thm([Lemma 4.5.])[
  (Specialization of residue coordinates).  #emph[Let $B subset.eq cal(P)$, fix $z_B in X_B$, and let $G : X_(cal(P)) arrow.r bb(C)$. For $1 lt.eq s < oo$, 
$ parallel G \( z_B \, dot.op \) parallel_(L^s \( X_(cal(P) \\ B) \)) lt.eq q_B^(1 \/ s) parallel G parallel_(L^s \( X_(cal(P)) \)) . $

 In particular, a Fourier lift or a subfamily of its complete supports satisfies (4.5) after specialization with the additional factor $q_B^(1 \/ \( 2 r \))$. The same bound holds after retaining either the remaining denominators at most a given $H gt.eq 1$, or those greater than $H$.]
] <lift:specialization>

#proof[
  The specified fiber has uniform probability $1 \/ q_B$. Its contribution to $bb(E) \| G \|^s$ is $q_B^(- 1) bb(E) \| G \( z_B \, dot.op \) \|^s$. Dropping the other nonnegative contributions proves the first assertion. For the last assertion, a character with original exact support $C$ retains exact support $C \\ B$ after specialization. The two cuts therefore arise, before specialization, from the complete-support subfamilies
  $ { C in cal(F) : q_(C \\ B) lt.eq H } \, #h(2em) { C in cal(F) : q_(C \\ B) > H } . $
  Apply Proposition 19 to these subfamilies and then use the fiber bound. Combining coefficients can cancel frequencies but cannot create any outside the indicated ranges. ◻
]

In particular, applying (4.4) with the same set of coordinates fixed in every slot incurs total specialization factor

$ q_B^(1 \/ 2) (q_B^(1 \/ \( 2 \( d - 1 \) \)))^(d - 1) = q_B . $

Two specialized $L^2$ norms incur the same factor. All moment orders needed here are fixed after $h$ is fixed. Finite products of their subpower bounds remain subpower; none of these constants depends on $l$, the specialized residues, or the retained supports.

=== 4.4 Parameters and the density quantity <parameters-and-the-density-quantity>

We now choose the analytic parameters used in the kernel estimate and the scale comparison. The constants $k \, d \, gamma$ have already been fixed. Set

#[#set math.equation(numbering: n => "(4.8)")
 $ eta & = frac(1, 100 k) \, & zeta & = frac(eta, 20 k) \, & nu & = frac(eta, 10 thin 2^k) \,\
beta & = nu / 100 \, & tau & = frac(beta gamma, 1000 k \( d + 1 \)) \, & sigma & = frac(gamma tau, 4) . $ <eq:14>]

The displayed parameters are functions only of the already fixed numbers $k \, d \, gamma$. When Condition (U) holds and the designated choices of Sections 2 and 3 are made, these numbers, and hence every parameter in (4.8), depend only on $k$. Here $eta$ is distinct from the exceptional masses $eta_(l \, p)$. At an integer scale $N gt.eq 1$, the kernel proof will use $eta$ to set the denominators and widths of neighborhoods of rational frequencies, $nu$ for the exponential-sum saving $N^(- nu)$ outside them, and $zeta$ for the allowed range $l lt.eq N^zeta$. The exponent $beta$ fixes the Fourier denominator cutoff $N^beta$; $tau$ sets the subdivision into about $N^tau$ intervals and the bound $q_B lt.eq N^tau$ in the shorter-scale comparison, while $sigma$ is the common error exponent in $N^(- sigma)$. Put

$ Q = N^beta \, #h(2em) H = N^(beta \/ 2) \, #h(2em) cal(P)_N = { p upright(" prime") : P lt.eq p lt.eq Q } . $

For $A subset.eq \[ N \]$, define

$ Y_l \( N \, A \) = Z_(l \, cal(P)_N) #scale(x: 120%, y: 120%)[\(] cal(L)_(\[ N \] \, cal(P)_N \, Q) upright(bold(1))_A #scale(x: 120%, y: 120%)[\)] . $

This is the quantity that will be compared between scales.

#thm([Corollary 4.6.])[
  (Density domination and a uniform upper bound).  #emph[For all positive integers $l \, N$ and all $A subset.eq \[ N \]$, 
$ Y_l \( N \, A \) gt.eq (frac(\| A \|, N))^d gt.eq 0 . $

 For every $epsilon.alt > 0$, there is a constant $C_epsilon.alt$, independent of $l \, N \, A$, such that 
$ Y_l \( N \, A \) lt.eq C_epsilon.alt N^epsilon.alt . $

]
] <lift:density>

#proof[
  The lift is real and has uniform mean $\| A \| \/ N$. The lower bound follows from Lemma 17. Ordinary Hölder and the uniform single-slot marginals give
  $ Y_l \( N \, A \) lt.eq ∥cal(L)_(\[ N \] \, cal(P)_N \, Q) upright(bold(1))_A∥_d^d . $
  The integer $d$ is even. Also $6 beta < 1$, so for all sufficiently large $N$ one has $N gt.eq 10 Q^6$. Apply (4.5) with moment order $d$, choosing its exponent small enough that its $d$-th power is at most $C_epsilon.alt N^epsilon.alt$. In the bounded remaining range of $N$, the lift has a bounded number of coefficients, each of modulus at most one. The probability normalization then supplies a uniform bound independent of $l$, and enlarging $C_epsilon.alt$ finishes the proof. ◻
]

== 5 A signed kernel for polynomial differences <sec:kernel>

The tuple laws constrain differences modulo primes. We now connect their pair distributions to actual values of $h_l$ at positive integers. The connection is a uniform Fourier approximation: a kernel supported on those polynomial values will have the same small-denominator multipliers as the pair law, up to a power error. We adapt the signed square-kernel construction of #cite(label("squarepower")) Section 6, especially Proposition 6.1. For a general polynomial, we realize the pair distribution by weighting regular argument classes; its explicit probability formula is not needed.

=== 5.1 Pair multipliers and the ordered estimate <pair-multipliers-and-the-ordered-estimate>

Fix an integer $l gt.eq 1$, put $F = h_l$, and choose a directed edge $v_j arrow.r v_(j + 1)$ of the designated cycle. For $p gt.eq P$, let $pi_p$ be the distribution of $z_(v_(j + 1)) - z_(v_j)$ under $mu_(l \, p)^compose$. Write $pi_p \( y \)$ for its point probabilities and define

$ Gamma_p \( a' \/ p \) = sum_(y in bb(F)_p) pi_p \( y \) e \( a' y \/ p \) . $

The distribution is supported on values of $F$ at regular arguments. Conditioning the character of the second endpoint on the other slots, then pairing with the opposite character of the first endpoint, gives

$ \| Gamma_p \( a' \/ p \) \| lt.eq p^(- gamma) #h(2em) \( p divides.not a' \) $

by (3.6) and Cauchy–Schwarz. For a rational $xi$ with squarefree denominator supported on primes at least $P$, decompose $xi$ additively into its prime-denominator parts and define $Gamma \( xi \)$ as the product of the corresponding $Gamma_p$. In particular,

#[#set math.equation(numbering: n => "(5.1)")
 $ Gamma \( 0 \) = 1 \, #h(2em) \| Gamma \( xi \) \| lt.eq q \( xi \)^(- gamma) . $ <eq:15>]

All estimates below are uniform in the selected cycle edge.

#thm([Proposition 5.1.])[
  (Ordered polynomial-kernel estimate).  #emph[Use the fixed parameters in (4.8), and let $N$ be a sufficiently large integer. Suppose $1 lt.eq l lt.eq N^zeta$ and 
$ D = M_0 product_(p in B) p lt.eq N^beta \, $

 where $B$ is a finite set of primes at least $P$. Let $J_1 \, J_2 : \[ N \] arrow.r bb(C)$ satisfy $\| J_1 \| \, \| J_2 \| lt.eq 1$ and be supported in residue classes $a_1 \, a_2$ modulo $D$, respectively. Suppose that $r = a_2 - a_1$ is admissible for $l$ modulo $D$, that $x < y$ whenever $x in "supp" J_1$ and $y in "supp" J_2$, and that no such difference $y - x$ belongs to $F \( bb(N)_(+) \)$. Put $H = N^(beta \/ 2)$ and 
$ Xi = { xi in bb(Q) \/ bb(Z) : q \( xi \) lt.eq H \, quad q \( xi \) upright(" squarefree") \, quad \( q \( xi \) \, D \) = 1 } . $

 Then 
#[#set math.equation(numbering: n => "(5.2)")
 $ D lr(|sum_(xi in Xi) Gamma \( xi \) hat(J_1)_(\[ N \]) \( - xi \) hat(J_2)_(\[ N \]) \( xi \)|) lt.double H^(- gamma \/ 2) . $ <eq:16>]

 The implied constant and the threshold for $N$ depend only on the fixed polynomial and the fixed parameters, not on $l \, D \, r \, J_1 \, J_2$.]
] <kernel:estimate>

Every prime below $P$ divides $D$, so $Gamma$ is defined at every frequency in $Xi$. We prove the proposition by constructing two kernels: one encodes its Fourier expression, and the other is supported on forbidden positive polynomial shifts. We first establish the uniform Fourier comparison; a bilinear identity then gives (5.2).

=== 5.2 The model kernel and a kernel on polynomial values <the-model-kernel-and-a-kernel-on-polynomial-values>

Fix the data of Proposition 22. Define the model kernel on $bb(Z)$ by

$ k_0 \( n \) = D / N upright(bold(1))_({ 1 lt.eq n lt.eq N }) upright(bold(1))_({ n equiv r med \( D \) }) sum_(xi in Xi) Gamma \( xi \) e \( - xi n \) . $

We first choose periodic argument weights that will reproduce its coefficients. For every $p divides D$, admissibility and the lifting construction in Section 2 provide an integer $x_p$ with $F \( x_p \) equiv r med \( mod med p^(E_p) \)$ and $s_p = v_p \( F' \( x_p \) \)$ satisfying $E_p gt.eq 2 s_p + 1$. On the argument class $x_p med \( mod med p^(E_p - s_p) \)$, the polynomial $F$ is constant $r$ modulo $p^(E_p)$ and uniform among its higher lifts. Combine these classes by the Chinese remainder theorem. Their modulus $d_r = product_(p divides D) p^(E_p - s_p)$ divides $D$; let $rho_D$ be $d_r$ times the indicator of the resulting argument class. Thus $rho_D$ has periodic mean one and supremum at most $D$.

For $p divides.not D$ (and hence $p gt.eq P$), choose, for each $y$ with $pi_p \( y \) > 0$, one regular argument $x_y$ satisfying $F \( x_y \) = y$ in $bb(F)_p$. Define

$ psi_p \( x_y \) = p pi_p \( y \) \, #h(2em) psi_p \( x \) = 0 quad upright("at the other arguments") . $

Then $psi_p$ is nonnegative, has uniform mean one, and pushes forward under $F$ to $pi_p$. In particular $0 lt.eq psi_p lt.eq p$. For positive squarefree integers $u$ coprime to $D$, define periodic functions

$ B_p \( m \) = psi_p \( m \) - 1 \, #h(2em) B_u \( m \) = product_(p divides u) B_p \( m \) \, #h(2em) B_1 = 1 . $

Each $B_p$ has mean zero, and $\| B_u \| lt.eq u$. We will use the truncated sum of these products to select the prescribed local distributions at small denominators. Indeed, for positive squarefree $R$ coprime to $D$,

$ sum_(u divides R) B_u \( m \) = product_(p divides R) \( 1 + B_p \( m \) \) = product_(p divides R) psi_p \( m \) . $

The cutoff $u lt.eq H$ preserves this identity when $R lt.eq H$, and we will use local exponential-sum cancellation for larger denominators. The truncated sum may have either sign.

All coefficients of $F$ are $O_h \( a_l \)$. Hence one integer $x_(*) gt.eq 1$, depending only on $h$, can be chosen for the entire auxiliary family, independently of $l$, so that for $x gt.eq x_(*)$,

$ F \( x \) asymp a_l x^k \, #h(2em) F' \( x \) asymp a_l x^(k - 1) \, #h(2em) \| F'' \( x \) \| lt.double a_l x^(k - 2) \, $

with $F' \( x \) > 0$. The lower-degree terms have total absolute value $O_h \( a_l x^(k - 1) \)$ for $x gt.eq 1$. Enlarging this same $x_(*)$ therefore also arranges

$ F \( x \) gt.eq frac(a_l x^k, 2) > 0 #h(2em) \( x gt.eq x_(*) \) \, $

uniformly in $l$. Put $U = \( N \/ a_l \)^(1 \/ k)$. Since $k zeta = eta \/ 20$, the hypothesis $l lt.eq N^zeta$ gives

$ k ! a_l lt.eq k ! a l^k lt.eq k ! a N^(eta \/ 20) . $

The exponent gap $eta \/ 8 - eta \/ 20 = 3 eta \/ 40$ is positive. Thus one sufficiently large threshold for $N$, depending on $h$ and the fixed parameters but independent of $l$, ensures $k ! a lt.eq N^(3 eta \/ 40)$ and hence, simultaneously for all $l lt.eq N^zeta$,

$ k ! a_l lt.eq N^(eta \/ 8) \, #h(2em) N^(1 - eta \/ 8) lt.eq U^k lt.eq N . $

The last inequality uses that $a_l$ is a positive integer. The lower bound for $U$ tends to infinity uniformly in this range of $l$, so increasing the same threshold ensures that there is a unique real $X > x_(*)$ with $F \( X \) = N$, and $X asymp U$. The lower bound on $F \( X \)$ gives

$ X lt.eq \( 2 N \/ a_l \)^(1 \/ k) = 2^(1 \/ k) U < 2 U . $

With $m$ ranging over integers and $u$ over positive integers, define

#[#set math.equation(numbering: n => "(5.3)")
 $ k_1 \( n \) = sum_(x_(*) < m lt.eq X) upright(bold(1))_({ n = F \( m \) }) frac(F' \( m \), N) rho_D \( m \) sum_(u lt.eq H med upright("squarefree")\
\( u \, D \) = 1) B_u \( m \) . $ <eq:17>]

This kernel is supported on positive values in $F \( bb(N)_(+) \)$. Derivative weights also occur in Lucier’s polynomial-difference argument #cite(label("Lucier2006")) Section 2. Here the factor $F' \( m \) \/ N$ is chosen so that the corresponding continuous measure becomes $d t \/ N$ under $t = F \( x \)$; it will therefore match the interval average in the model kernel.

Use positive-sign transforms for the kernels, and write

$ S_i \( alpha \) = sum_n k_i \( n \) e \( alpha n \) \, #h(2em) V_N \( y \) = 1 / N sum_(n = 1)^N e \( y n \) . $

Our main analytic claim is the following.

#thm([Lemma 5.2.])[
  (Uniform kernel comparison).  #emph[For the kernels just constructed, 
#[#set math.equation(numbering: n => "(5.4)")
 $ sup_(alpha in bb(R) \/ bb(Z)) \| S_1 \( alpha \) - S_0 \( alpha \) \| lt.double H^(- gamma \/ 2) \, $ <eq:18>]

 uniformly in the data of Proposition 22.]
] <kernel:comparison>

To describe the model transform, expand its congruence indicator:

#[#set math.equation(numbering: n => "(5.5)")
 $ S_0 \( alpha \) = sum_(xi in Xi) sum_(j med mod med D) Gamma \( xi \) e \( - j r \/ D \) V_N \( alpha - xi + j \/ D \) . $ <eq:19>]

There are at most $D H^2$ terms, all with coefficients of modulus at most one. Their centers $xi - j \/ D$ have denominators at most $D H$ and are distinct: equality of two centers makes $xi - xi'$ have denominator both coprime to $D$ and dividing $D$, so it is zero.

Every $alpha_0 in bb(Q) \/ bb(Z)$ has a unique decomposition $alpha_0 = alpha_D + alpha_1$ in which $q \( alpha_D \)$ has only prime factors dividing $D$ and $\( q \( alpha_1 \) \, D \) = 1$. Prime powers are allowed in both parts. The coefficient of the center $alpha_0$ in (5.5), taken to be zero when that center is absent, is

#[#set math.equation(numbering: n => "(5.6)")
 $ c_0 \( alpha_0 \) = cases(delim: "{", e \( alpha_D r \) Gamma \( alpha_1 \) \, & q \( alpha_D \) divides D \, quad alpha_1 in Xi \,, 0 \, & upright("otherwise") .) $ <eq:20>]

Indeed, at a center one has $alpha_1 = xi$ and $alpha_D = - j \/ D$.

=== 5.3 Minor arcs: a uniform Weyl estimate <minor-arcs-a-uniform-weyl-estimate>

Take the major arcs to be the closed balls of radius $3 N^(- 1 + eta)$ about the rational points with reduced denominator at most $N^eta$. They are disjoint for large $N$, since $3 eta < 1$. Their complement is the set of minor arcs. We write $parallel t parallel_(bb(R) \/ bb(Z))$ for distance to the nearest integer. The periodic weights in $k_1$ will introduce linear twists, so the required exponential-sum estimate includes them.

#thm([Lemma 5.3.])[
  #emph[If $alpha$ lies on the minor arcs, then, for every real $y'$ and every integer interval $I subset.eq \( x_(*) \, X \]$, 
#[#set math.equation(numbering: n => "(5.7)")
 $ lr(|sum_(m in I) e #scale(x: 120%, y: 120%)[\(] alpha F \( m \) + y' m #scale(x: 120%, y: 120%)[\)]|) lt.double U N^(- nu) . $ <eq:21>]

]
] <kernel:weyl>

#proof[
  Put $A_l = k ! a_l$, $theta' = A_l alpha$, and $Q_0 = floor.l N^(1 - eta) floor.r$. Pigeonholing the $Q_0 + 1$ points $0 \, theta' \, dots.h \, Q_0 theta'$ into $Q_0$ equal intervals gives a reduced rational $a' \/ q'$ such that
  $ 1 lt.eq q' lt.eq Q_0 \, #h(2em) parallel theta' - a' \/ q' parallel_(bb(R) \/ bb(Z)) lt.eq frac(1, q' Q_0) lt.eq frac(1, \( q' \)^2) . $
  Lifting this approximation through multiplication by $A_l$ places $alpha$ within $1 \/ \( A_l q' Q_0 \)$ of a rational with denominator at most $A_l q'$. If $A_l q' lt.eq N^eta$, this would place $alpha$ in a major arc, since $Q_0^(- 1) lt.eq 2 N^(- 1 + eta)$. Therefore $A_l q' > N^eta$, and in particular
  $ N^(eta \/ 2) lt.eq q' lt.eq N^(1 - eta) \, $
  using $A_l lt.eq N^(eta \/ 8)$.
  Choose $M = ceil.l 2 U ceil.r$. Since $X < 2 U$, this integer is larger than all the interval lengths under consideration. Also $U gt.eq 1$, so the absolute comparison $2 U lt.eq M lt.eq 2 U + 1 lt.eq 3 U$ holds. Repeated differencing gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ lr(|sum_(m in I) e #scale(x: 120%, y: 120%)[\(] alpha F \( m \) + y' m #scale(x: 120%, y: 120%)[\)]|)^(2^(k - 1)) & lt.eq C_k M^(2^(k - 1) - k)\
 & quad times sum_(\| b_1 \| \, dots.h \, \| b_(k - 1) \| < M) min #h(-0.16667em) (M \, parallel theta' b_1 dots.h.c b_(k - 1) parallel_(bb(R) \/ bb(Z))^(- 1)) . $ <eq:22>]
  Here the minimum equals $M$ when the distance is zero. To verify the estimate, square the sum and group pairs by their difference. After taking absolute values, square again and use Cauchy–Schwarz on the increment indices. At each step the inner sum is over an intersection of interval translates, hence an interval. After $s$ steps the prefactor is $M^(2^s - s - 1)$: its exponent is zero for $s = 1$, and the next step doubles that exponent and adds $s$. After $k - 1$ steps the phase is linear with coefficient $k ! a_l alpha b_1 dots.h.c b_(k - 1)$, and a geometric sum proves (5.8). The added linear term contributes only a constant after the first differencing and does not change the estimate. This derivation uses only $\| I \| lt.eq M$, so also covers short intervals.
  The tuples with a zero increment contribute $O_k \( M^(k - 1) \)$ inside the sum in (5.8). For the others, group by the absolute product $m lt.eq M^(k - 1)$. For each $epsilon.alt > 0$ their multiplicity is $O_(epsilon.alt \, k) \( m^epsilon.alt \)$. Indeed, at a prime power $p^a$ the number of exponent choices is a binomial coefficient of fixed degree in $a$; it is at most $p^(a epsilon.alt)$ for all sufficiently large $p$. The finitely many smaller primes contribute a bounded extra factor, since a fixed polynomial in $a$ divided by $p^(a epsilon.alt)$ is bounded.
  Partition the positive product indices into blocks of $floor.l q' \/ 2 floor.r$ consecutive integers. If $0 < b < q' \/ 2$, then
  $ parallel theta' b parallel_(bb(R) \/ bb(Z)) gt.eq parallel a' b \/ q' parallel_(bb(R) \/ bb(Z)) - frac(b, \( q' \)^2) gt.eq frac(1, 2 q') . $
  Thus the points in a block have spacing at least $1 \/ \( 2 q' \)$ on the circle. Ordering their distances to zero and summing the reciprocal-distance bound gives $O \( M + q' log \( 2 q' \) \)$ per block. There are $O \( M^(k - 1) \/ q' + 1 \)$ blocks. Dividing (5.8) by $M^(2^(k - 1))$, and absorbing the divisor bound and logarithms into $N^epsilon.alt$, gives
  $ C_(epsilon.alt \, k) N^epsilon.alt (1 / q' + 1 / M + q' / M^k) . $
  Here $M^k lt.double N$ and $M^k gt.double N^(1 - eta \/ 8)$. The three terms are bounded respectively by $N^(- eta \/ 2)$, $O \( N^(- \( 1 - eta \/ 8 \) \/ k) \)$, and $O \( N^(- 7 eta \/ 8) \)$. For sufficiently small fixed $epsilon.alt$, the displayed expression is $O \( N^(- eta \/ 4) \)$. Taking its $2^(k - 1)$-st root proves (5.7), because $eta \/ \( 4 dot.op 2^(k - 1) \) = 5 nu$. ◻
]

We can now bound both kernels on the minor arcs. The supremum and total variation of $F' \/ N$ on $\[ x_(*) \, X \]$ are $O \( 1 \/ U \)$, so partial summation in (5.7) gives $O \( N^(- nu) \)$ with this weight. With Fourier coefficients normalized by their period, $rho_D$ has Fourier $ell^1$ norm $d_r lt.eq D$. The corresponding norm of $B_u$ is at most $u^2$, by its period and supremum. Expanding these periodic weights into linear twists and summing over $u lt.eq H$ yields

$ \| S_1 \( alpha \) \| lt.double D H^3 N^(- nu) . $

Every center in (5.5) has denominator at most $D H lt.eq N^(3 beta \/ 2) lt.eq N^eta$. On the minor arcs its distance from $alpha$ is at least $3 N^(- 1 + eta)$. The geometric-sum bound $\| V_N \( t \) \| lt.eq min \( 1 \, \( 2 N parallel t parallel_(bb(R) \/ bb(Z)) \)^(- 1) \)$ therefore gives

$ \| S_0 \( alpha \) \| lt.double D H^2 N^(- eta) . $

These bounds prove the required comparison away from the major arcs. Near a small rational, cancellation in the argument variable must be replaced by an exact calculation of its periodic mean.

=== 5.4 Major arcs and the local coefficient calculation <major-arcs-and-the-local-coefficient-calculation>

Write $alpha = alpha_0 + y$, where $q = q \( alpha_0 \) lt.eq N^eta$ and $\| y \| lt.eq 3 N^(- 1 + eta)$. A model center other than $alpha_0$ is at distance at least $1 \/ \( q D H \)$ from $alpha_0$. Since $\| y \| q D H = o \( 1 \)$ uniformly, (5.5) gives

$ S_0 \( alpha \) = c_0 \( alpha_0 \) V_N \( y \) + O \( q D^2 H^3 \/ N \) . $

For squarefree $u lt.eq H$ coprime to $D$, let $A_u$ be the periodic mean of

$ b_u \( m \) = rho_D \( m \) B_u \( m \) e \( alpha_0 F \( m \) \) . $

Its period is at most $q D u$ and its supremum at most $D u$. Consequently its sum over any real interval differs from $A_u$ times the interval’s length by $O \( q D^2 u^2 \)$. For $w \( x \) = F' \( x \) e \( y F \( x \) \) \/ N$, differentiation gives

$ parallel w parallel_oo + integral_(x_(*))^X \| w' \( x \) \| thin d x lt.double frac(1 + \| y \| N, U) . $

Partial summation, followed by the substitution $t = F \( x \)$, gives

$ sum_(x_(*) < m lt.eq X) frac(F' \( m \), N) e \( y F \( m \) \) b_u \( m \) = A_u / N integral_(F \( x_(*) \))^N e \( y t \) thin d t + O #h(-0.16667em) (q D^2 u^2 frac(1 + \| y \| N, U)) . $

The normalized integral differs from $V_N \( y \)$ by $O \( a_l \/ N + \( 1 + \| y \| N \) \/ N \)$. Multiplying by $\| A_u \| lt.eq D u$ leaves an error covered by the one already displayed, since $a_l \/ N = U^(- k)$ and $U lt.eq N$. Summing over $u$ therefore proves

#[#set math.equation(numbering: n => "(5.9)")
 $ S_1 \( alpha \) & = c \( alpha_0 \) V_N \( y \) + O #h(-0.16667em) (q D^2 H^3 frac(1 + \| y \| N, U)) \,\
c \( alpha_0 \) & = sum_(u lt.eq H med upright("squarefree")\
\( u \, D \) = 1) A_u . $ <eq:23>]

The analytic approximations now have the same factor $V_N \( y \)$. It remains to compare their coefficients. This is where the regular argument weights $psi_p$ reproduce the pair law. The periodic means $A_u$ and their sum $c \( alpha_0 \)$ are defined by the same formulas for every rational $alpha_0$, without a denominator restriction; we use that domain in the next lemma.

#thm([Lemma 5.4.])[
  (Comparison of rational coefficients).  #emph[For every $alpha_0 in bb(Q) \/ bb(Z)$, write $alpha_0 = alpha_D + alpha_1$ for the unique decomposition in which $q \( alpha_D \)$ has only prime factors dividing $D$ and $\( q \( alpha_1 \) \, D \) = 1$. Then the coefficients defined by (5.6) and (5.9) satisfy 
$ \| c \( alpha_0 \) - c_0 \( alpha_0 \) \| lt.eq H^(- gamma \/ 2) . $

 In fact they agree when $q \( alpha_1 \) lt.eq H$.]
] <kernel:coefficients>

#proof[
  In a periodic mean we may average at any common multiple of the periods and separate prime-power factors by the Chinese remainder theorem. First consider a prime $p divides D$, and abbreviate $E = E_p$, $s = s_p$. On the chosen argument class, Section 2 gives
  $ F \( x_p + p^(E - s) z \) = F \( x_p \) + p^E \( c_1 z + p C \( z \) \) \, #h(2em) p divides.not c_1 \, $
  where $C$ has integer coefficients. The polynomial in parentheses is a bijection modulo every power of $p$: its difference at two arguments is their difference times a unit. Thus for a local frequency of denominator $p^j$ with $j lt.eq E$, the phase is constant at its value on $r$. This remains true if $j > E - s$. For $j > E$, uniform arguments in the restricted class modulo $p^j$ give uniform $z$ modulo $p^(j - E + s)$, hence uniform reduction modulo $p^(j - E)$. The $F$-values are consequently uniform among the lifts of $r$ modulo $p^j$, and a primitive character has mean zero. The joint factor from primes dividing $D$ is therefore
  $ chi_D \( alpha_0 \) = cases(delim: "{", e \( alpha_D r \) \, & q \( alpha_D \) divides D \,, 0 \, & q \( alpha_D \) divides.not D .) $
  Put $q_1 = q \( alpha_1 \)$. If $u$ has a prime not dividing $q_1$, its factor $B_p$ has mean zero independently of all the other factors, so $A_u = 0$. Thus only divisors of $"rad" \( q_1 \) = product_(p divides q_1) p$ contribute. For $p^j bar.v.double q_1$, let $alpha_p$ be the primitive $p^j$-denominator part of $alpha_1$ and set
  $ a_(p \, j) = bb(E)_(m med mod med p^j) e \( alpha_p F \( m \) \) \, #h(2em) b_(p \, j) = bb(E)_(m med mod med p^j) B_p \( m \) e \( alpha_p F \( m \) \) . $
  The Chinese remainder theorem now expresses the truncated coefficient as
  #[#set math.equation(numbering: n => "(5.10)")
   $ c \( alpha_0 \) = chi_D \( alpha_0 \) sum_(u divides "rad" \( q_1 \)\
u lt.eq H) (product_(p^j bar.v.double q_1\
p divides u) b_(p \, j)) (product_(p^j bar.v.double q_1\
p divides.not u) a_(p \, j)) . $ <kernel:truncated-coefficient>]
  The mean against $1 + B_p = psi_p$ is
  $ a_(p \, j) + b_(p \, j) = cases(delim: "{", Gamma_p \( alpha_p \) \, & j = 1 \,, 0 \, & j gt.eq 2 .) $
  For $j = 1$ this is the defining pushforward of $psi_p$. For $j gt.eq 2$, condition on a regular argument modulo $p$. Its lifts are mapped uniformly to the lifts of its value, so their primitive character mean vanishes. This holds on each argument class separately, regardless of the size of $psi_p$ there.
  If $q_1 lt.eq H$, all divisors of $"rad" \( q_1 \)$ occur. Thus (5.10) factors as
  $ c \( alpha_0 \) = chi_D \( alpha_0 \) product_(p^j bar.v.double q_1) \( a_(p \, j) + b_(p \, j) \) . $
  For squarefree $q_1$ this is $chi_D \( alpha_0 \) Gamma \( alpha_1 \)$; if any exponent is at least two, it is zero. These are precisely the cases in (5.6). The empty product, when $q_1 = 1$, also gives the required coefficient.
  Suppose instead that $q_1 > H$. The model coefficient is then zero. By (2.4), $\| a_(p \, j) \| lt.eq p^(- 8 delta j)$. For $j = 1$ the preceding identity and (5.1) give $\| b_(p \, 1) \| lt.eq 2 p^(- gamma)$; for $j gt.eq 2$ the identity gives $b_(p \, j) = - a_(p \, j)$, hence again $\| b_(p \, j) \| lt.eq 2 p^(- gamma j)$. Taking absolute values in (5.10) and dropping the divisor cutoff yields
  $ \| c \( alpha_0 \) \| & lt.eq product_(p^j bar.v.double q_1) \( \| a_(p \, j) \| + \| b_(p \, j) \| \)\
 & lt.eq 3^(omega \( q_1 \)) q_1^(- gamma) lt.eq q_1^(- gamma \/ 2) < H^(- gamma \/ 2) . $
  Here $omega \( q_1 \)$ is the number of distinct prime divisors, and the last inequality before the strict one follows from (3.7), since every prime of $q_1$ is at least $P$. This bound also covers $"rad" \( q_1 \) lt.eq H < q_1$: in that case the full divisor product is present and is actually zero, because some exponent is at least two. If $q \( alpha_D \) divides.not D$, all coefficients vanish already through $chi_D \( alpha_0 \)$. ◻
]

#proof[
  On the minor arcs the two bounds already proved give
  $ \| S_1 \| lt.double N^(- nu + \( 5 \/ 2 \) beta) \, #h(2em) \| S_0 \| lt.double N^(- eta + 2 beta) . $
  On a major arc, the error terms in the two approximations are at most
  $ O \( N^(eta + 4 beta - 1) \) \, #h(2em) O #scale(x: 120%, y: 120%)[\(] N^(2 eta + 4 beta - \( 1 - eta \/ 8 \) \/ k) #scale(x: 120%, y: 120%)[\)] \, $
  respectively. Each of these four bounds is $O \( N^(- beta gamma \/ 4) \) = O \( H^(- gamma \/ 2) \)$ by (4.8). Indeed $nu = 100 beta$, $eta = 1 \/ \( 100 k \)$ and $beta = eta \/ \( 1000 dot.op 2^k \)$, so the two major-arc exponents are less than $- 0.99$ and $- 0.97 \/ k$, respectively; the minor-arc exponents have still larger margins than required. Lemma 25 and $\| V_N \( y \) \| lt.eq 1$ now complete the comparison on the major arcs as well. All thresholds used here are uniform under $l lt.eq N^zeta$ and $D lt.eq N^beta$. ◻
]

=== 5.5 From Fourier comparison to forbidden differences <from-fourier-comparison-to-forbidden-differences>

#proof[
  Extend $J_1 \, J_2$ by zero to $bb(Z)$, and for either kernel define
  $ cal(B)_i = 1 / N sum_(x \, n in bb(Z)) k_i \( n \) J_1 \( x \) J_2 \( x + n \) . $
  Let $tilde(J)_i \( alpha \) = sum_x J_i \( x \) e \( - x alpha \)$ denote the counting-measure Fourier transforms. Expanding the characters and integrating imposes $n + x - y = 0$, so
  $ cal(B)_i = 1 / N integral_0^1 S_i \( alpha \) tilde(J)_1 \( - alpha \) tilde(J)_2 \( alpha \) thin d alpha . $
  Cauchy–Schwarz, Plancherel and Lemma 23 give
  $ \| cal(B)_1 - cal(B)_0 \| lt.eq frac(parallel S_1 - S_0 parallel_oo, N) parallel J_1 parallel_(ell^2 \( bb(Z) \)) parallel J_2 parallel_(ell^2 \( bb(Z) \)) lt.double H^(- gamma \/ 2) \, $
  because the two counting-measure norms are at most $sqrt(N)$.
  Every term in $cal(B)_1$ uses a positive shift $F \( m \)$ with $m in bb(N)_(+)$, and hence vanishes by avoidance. Thus $cal(B)_1 = 0$, regardless of the signed weights in (5.3). For a pair in the supports of $J_1 \, J_2$, ordering gives $1 lt.eq y - x lt.eq N - 1$ and the residue conditions give $y - x equiv r med \( mod med D \)$. Both indicators in $k_0$ are therefore automatic, and
  $ cal(B)_0 & = D / N^2 sum_(x \, y in \[ N \]) J_1 \( x \) J_2 \( y \) sum_(xi in Xi) Gamma \( xi \) e \( - xi \( y - x \) \)\
 & = D sum_(xi in Xi) Gamma \( xi \) hat(J_1)_(\[ N \]) \( - xi \) hat(J_2)_(\[ N \]) \( xi \) . $
  This proves (5.2) with its stated normalization and signs. ◻
]

== 6 Comparison and cancellation <sec:transfer>

We now establish the two estimates that will control the quantity $Y_l \( N \, A \)$ in the induction. The first compares a lift, after some prime coordinates have been fixed, with lifts of sets on shorter intervals. The second gives a power saving when the small-prime residues permit every increment of the designated cycle. The progression comparison and the reduction to an ordered pair adapt the arguments of #cite(label("squarepower")) Sections 7–8, especially Propositions 7.2 and 8.1. For a modulus $D$, our progression spacing is $lambda \( D \)$, and the change of variables also changes the auxiliary parameter from $l$ to $l D$.

For positive integers $l \, N$, let

$ cal(Y)_l \( N \) = max_A Y_l \( N \, A \) \, $

where the maximum is over all $A subset.eq \[ N \]$ satisfying

#[#set math.equation(numbering: n => "(6.1)")
 $ \( A - A \) ∩ h_l \( bb(N)_(+) \) subset.eq { 0 } . $ <eq:24>]

We retain the parameters of (4.8), in particular $Q = N^beta$, $H = N^(beta \/ 2)$, and $cal(P)_N = { p upright(" prime") : P lt.eq p lt.eq Q }$. For a fixed set $A subset.eq \[ N \]$, define

$ f_s \( x \) = M_0 upright(bold(1))_({ x equiv s med \( mod med M_0 \) }) upright(bold(1))_A \( x \) \, #h(2em) G_s = cal(L)_(\[ N \] \, cal(P)_N \, Q) f_s \, #h(2em) s in bb(Z) \/ M_0 bb(Z) . $

Thus $upright(bold(1))_A$ is the uniform average of the functions $f_s$, and its lift is the corresponding average of the $G_s$.

=== 6.1 Fourier coefficients after specialization <fourier-coefficients-after-specialization>

Fixing prime coordinates restricts the underlying integers to a residue class, provided the cutoff includes all characters on those coordinates. The precise identity is the following.

#thm([Lemma 6.1.])[
  (Specialization of a lift).  #emph[Let $I subset.eq \[ N \]$ be a nonempty integer interval, let $B subset.eq cal(P)_N$, and put $D = M_0 q_B$. Fix $s in bb(Z) \/ M_0 bb(Z)$ and $b = \( b_p \)_(p in B) in X_B$. Let $g$ be the function on $X_(cal(P)_N \\ B)$ obtained by specializing $cal(L)_(I \, cal(P)_N \, Q) f_s$ at $z_B = b$. For every remaining-coordinate frequency $xi$ with $q \( xi \) q_B lt.eq Q$, one has 
#[#set math.equation(numbering: n => "(6.2)")
 $ hat(g) \( xi \) = frac(D, \| I \|) sum_(x in I\
x equiv a' med \( mod med D \)) upright(bold(1))_A \( x \) e \( - x xi \) \, $ <eq:25>]

 where $a' med \( mod med D \)$ is determined by $a' equiv s med \( mod med M_0 \)$ and $a' equiv b_p med \( mod med p \)$ for $p in B$.]
] <transfer:specialization>

#proof[
  The frequencies contributing to $hat(g) \( xi \)$ have the form $xi + omega$, where $omega$ ranges over the characters on $X_B$ that survive the cutoff. The denominators are coprime, so $q \( xi + omega \) = q \( xi \) q \( omega \) lt.eq q \( xi \) q_B lt.eq Q$. Consequently every character on $X_B$ occurs in the specialized coefficient, which equals
  $ frac(M_0, \| I \|) sum_(x in I) upright(bold(1))_A \( x \) upright(bold(1))_({ x equiv s med \( mod med M_0 \) }) e \( - x xi \) sum_(omega upright(" on ") X_B) e \( \( b - x \) omega \) . $
  Character orthogonality makes the inner sum $q_B$ when $x equiv b_p med \( mod med p \)$ for every $p in B$, and zero otherwise. The Chinese remainder theorem now gives (6.2). ◻
]

=== 6.2 Comparison with a shorter interval <comparison-with-a-shorter-interval>

The next estimate is uniform in the auxiliary parameter $l$. This uniformity is necessary because a progression replaces $l$ by $l D$, which need not satisfy the size restriction used in the kernel estimate.

#thm([Proposition 6.2.])[
  (Shorter-scale comparison).  #emph[Let $N$ be sufficiently large, let $l gt.eq 1$, and let $A subset.eq \[ N \]$ satisfy (6.1). Suppose that $B subset.eq cal(P)_N$ and $q_B lt.eq N^tau$. Set 
$ cal(S) = cal(P)_N \\ B \, #h(2em) D = M_0 q_B \, #h(2em) L_D = lambda \( D \) \,\
n_B = ⌈N / L_D⌉ \, #h(2em) Lambda_B = frac(L_D n_B, N) . $

 For each $v in V$, choose $s_v in bb(Z) \/ M_0 bb(Z)$ and specialize $G_(s_v)$ at an arbitrary vector of coordinates on $B$, obtaining a function $g_v$ on $X_(cal(S))$. Then 
#[#set math.equation(numbering: n => "(6.3)")
 $ \| cal(Z)_(l \, cal(S)) \( \( g_v \)_(v in V) \) #scale(x: 120%, y: 120%)[\|] lt.eq Lambda_B^d cal(Y)_(l D) \( n_B \) + O \( N^(- sigma) \) . $ <eq:26>]

 The scale and the rounding factor satisfy $1 lt.eq n_B < N$ and 
#[#set math.equation(numbering: n => "(6.4)")
 $ 1 lt.eq Lambda_B lt.eq 1 + M_0^k N^(k tau - 1) . $ <eq:27>]

 The implied constant and the threshold for $N$ are independent of $l \, A \, B$ and all specializations.]
] <transfer:shorter-scale>

#proof[
  We first record the scale inequalities. By (2.2), $D lt.eq L_D lt.eq D^k$, so $L_D gt.eq M_0 gt.eq 2$ and $n_B < N$ for large $N$. The defining ceiling gives (6.4). Also
  $ n_B gt.eq M_0^(- k) N^(1 - k tau) gt.eq N^(1 \/ 2) \,\
H lt.eq Q' := n_B^beta lt.eq Q \, #h(2em) q_B H lt.eq Q . $
  Here $k tau < 1 \/ 2$ and $tau < beta \/ 2$ follow from (4.8).
  By the signed Hölder inequality (4.1), it is enough to prove the asserted common bound for $Z_(l \, cal(S)) \( g \)$, where $g$ is any one of the specialized inputs. Let $g_(lt.eq H)$ retain exactly the remaining-coordinate frequencies of denominator at most $H$. We claim that
  $ Z_(l \, cal(S)) \( g \) = Z_(l \, cal(S)) \( g_(lt.eq H) \) + O \( H^(- gamma) q_B N^(o \( 1 \)) \) . $
  To see this, telescope the $d$ slots and apply (4.4) to the high-frequency input in each term. The moment estimate (4.5) is applicable to all the other inputs as well as to that high-frequency piece. Indeed, before specialization, a cut on the remaining denominator retains entire supports $C subset.eq cal(P)_N$ according to the condition on $q_(C \\ B)$; it never selects only part of the frequencies with a given full support $C$. Fixing $B$ costs at most $q_B^(1 \/ 2)$ in the distinguished $L^2$ norm and $q_B^(1 \/ \[ 2 \( d - 1 \) \])$ in each of the other $d - 1$ norms. The total cost is therefore $q_B$. The original input is bounded by $M_0$, and $N gt.eq 10 Q^6$ for large $N$, so (4.5) supplies the remaining $N^(o \( 1 \))$ factor. Since
  $ frac(beta gamma, 2) - tau - sigma = tau (500 k \( d + 1 \) - 1 - gamma / 4) > 0 \, $
  the claimed error is $O \( N^(- sigma) \)$. The denominator cuts are symmetric under negation, so the functions used here are real.
  We next express $g_(lt.eq H)$ as an average of shorter lifts. Let $a' med \( mod med D \)$ be the residue in Lemma 26. For each representative $j in \[ L_D \]$ with $j equiv a' med \( mod med D \)$, set
  $ c_j = j - L_D \, #h(2em) A'_j = { x' in \[ n_B \] : L_D x' + c_j in A } . $
  These progressions partition the integers of $\[ N \]$ in the class $a' med \( mod med D \)$: the first positive term is $j$, and $n_B$ terms suffice for every such integer. Terms above $N$ contribute no points to $A'_j$. Moreover, $A'_j$ satisfies (6.1) with $l D$ in place of $l$. For if a nonzero difference in $A'_j - A'_j$ were $h_(l D) \( m \)$ with $m gt.eq 1$, the corresponding difference in $A - A$ would be
  $ L_D h_(l D) \( m \) = h_l \( D m - i \) \, #h(2em) 0 lt.eq i < D \, $
  by (2.2); its argument is positive and its value is nonzero.
  Put $cal(H)_j = cal(L)_(\[ n_B \] \, cal(S) \, H) upright(bold(1))_(A'_j)$. Every prime of $L_D$ divides $D$, so $L_D$ is invertible on $X_(cal(S))$ and multiplication by $L_D$ preserves denominators. Lemma 26, applied using $q_B H lt.eq Q$, gives the exact identity
  #[#set math.equation(numbering: n => "(6.5)")
   $ g_(lt.eq H) \( z \) = frac(Lambda_B, L_D \/ D) sum_(j in \[ L_D \]\
j equiv a' med \( mod med D \)) cal(H)_j #scale(x: 120%, y: 120%)[\(] L_D^(- 1) \( z - c_j \) #scale(x: 120%, y: 120%)[\)] . $ <eq:28>]
  For completeness, the summand on the right has Fourier coefficient $hat(cal(H)_j) \( L_D xi \) e \( - c_j xi \)$ at $xi$. Since $Lambda_B \/ \( L_D \/ D \) = D n_B \/ N$, summing these coefficients gives $D \/ N$ times the sum over the required original integers, exactly as in (6.2); both sides have zero coefficients above $H$.
  Under the map $z mapsto L_D^(- 1) \( z - c_j \)$, the tuple law for $l$ pushes forward to the tuple law for $l D$, by (3.5) at each remaining prime. There are exactly $L_D \/ D$ representatives $j$. The seminorm triangle inequality applied to (6.5) therefore yields
  $ Z_(l \, cal(S)) \( g_(lt.eq H) \) lt.eq Lambda_B^d max_j Z_(l D \, cal(S)) \( cal(H)_j \) . $
  This is where the exact change of tuple laws preserves the leading constant in the comparison.
  It remains to replace the cutoff $H$ on the shorter interval by its natural cutoff $Q'$. Equations (4.4) and (4.5), now on $\[ n_B \]$, bound the change of the diagonal by $O \( H^(- gamma) N^(o \( 1 \)) \) = O \( N^(- sigma) \)$. Their interval hypothesis holds because $6 beta < 1$, and hence $n_B gt.eq 10 \( Q' \)^6$ for large $N$. The extended lift only uses primes in $cal(P)_(n_B)$. It is obtained from $cal(L)_(\[ n_B \] \, cal(P)_(n_B) \, Q') upright(bold(1))_(A'_j)$ by averaging the coordinates in $B ∩ cal(P)_(n_B)$ and then viewing the result as independent of the additional coordinates in $cal(S)$. The contraction under coordinate averaging from Lemma 17 gives
  $ Z_(l D \, cal(S)) \( cal(H)_j \) lt.eq Y_(l D) \( n_B \, A'_j \) + O \( N^(- sigma) \) lt.eq cal(Y)_(l D) \( n_B \) + O \( N^(- sigma) \) . $
  Combining these estimates with (6.4) proves the diagonal bound. Applying (4.1) to the mixed inputs proves (6.3): the product of $d$th roots of quantities bounded by the same nonnegative upper bound is at most that upper bound. ◻
]

=== 6.3 Cancellation for good residue assignments <cancellation-for-good-residue-assignments>

The previous comparison applies to every residue assignment. We now use avoidance to obtain a stronger estimate for assignments compatible with the designated cycle. An assignment $\( s_v \)_(v in V) in \( bb(Z) \/ M_0 bb(Z) \)^V$ is #emph[good for $l$] if every increment $s_(v_(j + 1)) - s_(v_j)$, $0 lt.eq j < L$, is admissible for $l$ modulo $M_0$. As before, $v_L = v_0$.

#thm([Lemma 6.3.])[
  #emph[For every $l gt.eq 1$, the proportion $rho_l$ of good assignments under independent uniform choices of all the $s_v$ satisfies 
$ rho_l gt.eq rho_(*) := M_0^(1 - L) > 0 . $

]
] <transfer:good-assignments>

#proof[
  At every prime-power factor of $M_0$, the construction in Section 2 supplies a length-$L$ sequence of admissible residues whose sum is zero. The Chinese remainder theorem combines them into such a sequence modulo $M_0$. Fix one sequence. There are $M_0$ choices of the initial cycle residue; the other cycle residues are then determined, and the zero-sum condition closes the cycle. Its $L$ vertices are distinct. The remaining $d - L$ residues can be arbitrary, giving at least $M_0^(d - L + 1)$ good assignments out of $M_0^d$. ◻
]

The proportion $rho_l$ may vary with $h$ and $l$. When Condition (U) holds and the designated choices of Sections 2 and 3 are made, both $M_0$ and $L$, and therefore the lower bound $rho_(*) = M_0^(1 - L)$, depend only on $k$.

#thm([Proposition 6.4.])[
  (Cancellation on good assignments).  #emph[Let $N$ be sufficiently large, let $l lt.eq N^zeta$, and let $A subset.eq \[ N \]$ satisfy (6.1). If $\( s_v \)_(v in V)$ is good for $l$, then 
#[#set math.equation(numbering: n => "(6.6)")
 $ lr(|integral product_(v in V) G_(s_v) \( z_v \) thin d ⨂_(p in cal(P)_N) \( mu_(l \, p) - epsilon_(l \, p) \)|) lt.double N^(- sigma) . $ <eq:29>]

 The bound is uniform in $l \, A$ and the good assignment.]
] <transfer:cancellation>

#proof[
  We may replace each $mu_(l \, p) - epsilon_(l \, p)$ by its normalized law $mu_(l \, p)^compose$: passing back multiplies the integral by $product_(p in cal(P)_N) \( 1 - eta_(l \, p) \) lt.eq 1$. We first locate an ordered pair of intervals along the cycle. We then truncate the other inputs and condition on their prime supports; the remaining pair integral will have exactly the multipliers appearing in Proposition 22.
  Partition $\[ N \]$ into $floor.l N^tau floor.r$ consecutive intervals whose lengths differ by at most one. Each $G_s$ is the average of the interval lifts $cal(L)_(I \, cal(P)_N \, Q) f_s$ with weights $\| I \| \/ N$. Thus we may average independently over an interval assignment to every slot. These intervals have length $gt.double N^(1 - tau)$, so the moment estimate (4.5) applies: indeed $6 beta + tau < 7 beta < 1$ by (4.8). For any interval assignment, ordinary Hölder, uniform single-slot marginals and (4.5) bound the integral in absolute value by $N^(o \( 1 \))$. The probability that all $L$ cycle slots choose the same interval is
  $ sum_I (frac(\| I \|, N))^L lt.eq (max_I frac(\| I \|, N))^(L - 1) lt.double N^(- \( L - 1 \) tau) . $
  Their contribution is $O \( N^(- sigma) \)$, since $\( L - 1 \) tau > sigma = gamma tau \/ 4$.
  In every other assignment, some directed cycle edge has its first interval $I_1$ strictly before its second interval $I_2$. Otherwise the interval indices would be nonincreasing all the way around the cycle, and therefore constant. Fix such an edge for the current assignment. The constants below are uniform in this choice.
  Set $T = N^tau$ and truncate every interval lift except the two selected ones to denominators at most $T$. Telescoping the other slots, (4.4) and (4.5) give total error $O \( T^(- gamma) N^(o \( 1 \)) \) = O \( N^(- sigma) \)$, because $gamma tau > sigma$. Expand the truncated inputs into characters. Each coefficient has modulus at most $M_0$, and there are at most $T^2$ rational frequencies of denominator at most $T$. Thus the sum of the absolute coefficients in the resulting expansion is $O \( T^(2 \( d - 2 \)) \)$.
  Fix one term, let $B$ be the union of the supports of its $d - 2$ characters, and put
  $ R = q_B lt.eq T^(d - 2) \, #h(2em) cal(S) = cal(P)_N \\ B . $
  Condition on all tuple labels at every prime in $B$. The expanded characters become constants of modulus one. By independence between primes, the remaining tuple labels still have law $⨂_(p in cal(S)) mu_(l \, p)^compose$. Let $g_1 \, g_2$ denote the two selected interval lifts after specialization at this conditioning. They are functions on $X_(cal(S))$. For the chosen directed edge, let $Gamma$ be the increment multiplier defined in Section 5. The remaining pair integral is exactly
  #[#set math.equation(numbering: n => "(6.7)")
   $ sum_(xi upright(" on ") X_(cal(S))) hat(g)_1 \( - xi \) hat(g)_2 \( xi \) Gamma \( xi \) . $ <eq:30>]
  Indeed, simultaneous translation of the two labels kills all pairs of characters whose frequencies do not sum to zero. The surviving pair with frequencies $- xi \, xi$ has value $e \( xi \( z_2 - z_1 \) \)$, whose expectation is $Gamma \( xi \)$.
  For the terms with $q \( xi \) > H$, (5.1) and Parseval give
  $ lr(|sum_(q \( xi \) > H) hat(g)_1 \( - xi \) hat(g)_2 \( xi \) Gamma \( xi \)|) lt.eq H^(- gamma) parallel g_1 parallel_2 parallel g_2 parallel_2 lt.double H^(- gamma) R N^(o \( 1 \)) . $
  The last inequality uses the interval moment bound and the cost $R^(1 \/ 2)$ of each specialization in $L^2$.
  We apply the kernel estimate to the remaining terms. Put $D = M_0 R$. The parameter choice gives
  $ \( d - 2 \) tau < beta / 2 \, #h(2em) H R lt.eq Q \, #h(2em) D lt.eq N^beta $
  for large $N$; the first inequality follows directly from $tau = beta gamma \/ \[ 1000 k \( d + 1 \) \]$. By Lemma 26, their Fourier coefficient formulas for $q \( xi \) lt.eq H$ restrict the underlying integers to classes $a'_1 \, a'_2 med \( mod med D \)$. The difference $a'_2 - a'_1$ is admissible modulo $M_0$ by goodness. It is admissible at each prime in $B$ because every conditioning of positive probability is in the cycle support of the nonexceptional law. It is therefore admissible modulo $D$.
  The remaining frequencies of denominator at most $H$ are precisely the set $Xi$ in Proposition 22. Indeed, their denominators are squarefree and coprime to $D$. Conversely, a squarefree denominator at most $H$ and coprime to $D$ has no prime below $P$, since all those primes divide $M_0$, and no prime in $B$; every prime divisor is at most $H lt.eq Q$.
  Define functions on $\[ N \]$ by
  $ J_i \( x \) = upright(bold(1))_A \( x \) upright(bold(1))_(I_i) \( x \) upright(bold(1))_({ x equiv a'_i med \( mod med D \) }) \, #h(2em) i = 1 \, 2 . $
  They are bounded by one and have ordered supports. Every difference from the first support to the second is positive, so a zero polynomial value cannot be such a difference; (6.1) excludes all nonzero values of $h_l \( bb(N)_(+) \)$. Thus all hypotheses of Proposition 22 hold at scale $N$. The Fourier normalizations in (6.2) are
  $ hat(g)_i \( xi \) = frac(D N, \| I_i \|) hat(J_i)_(\[ N \]) \( xi \) #h(2em) \( q \( xi \) lt.eq H \) . $
  Since (5.2) has a factor $D$ outside its absolute value, the low-denominator part of (6.7) is at most
  $ C H^(- gamma \/ 2) D frac(N^2, \| I_1 \| \| I_2 \|) lt.double H^(- gamma \/ 2) D N^(2 tau) . $
  Both parts of (6.7) are consequently bounded, uniformly in the conditioning and in the term of the character expansion, by
  $ O #h(-0.16667em) (N^(- beta gamma \/ 4 + \( d + 2 \) tau + o \( 1 \))) . $
  Averaging the conditioning costs no factor, and summing the character expansion costs at most $O \( N^(2 d tau) \)$. The final exponent satisfies
  $ frac(beta gamma, 4) - \( 3 d + 2 \) tau - sigma = tau (250 k \( d + 1 \) - \( 3 d + 2 \) - gamma / 4) > 0 . $
  Thus the resulting error is $O \( N^(- sigma) \)$. The same-interval contribution and the truncation error already satisfy this bound. Finally, the interval assignments were averaged with probabilities summing to one, so the uniform estimate proves (6.6). ◻
]

== 7 Exceptional terms and the power-saving induction <sec:induction>

We now combine the shorter-scale comparison with cancellation on good residue assignments to obtain a recurrence for $cal(Y)_l \( N \)$. The exceptional parts of the prime laws contribute a summable family of additional shorter-scale terms. The expansion and contraction argument adapt #cite(label("squarepower")) Proposition 9.2 and Theorem 9.3.

Retain all parameters from (4.8). For $B subset.eq cal(P)_N$, put

$ D_B = M_0 q_B \, #h(2em) n_B = ⌈frac(N, lambda \( D_B \))⌉ \, #h(2em) eta_(l \, B) = product_(p in B) eta_(l \, p) . $

Thus $q_diameter = eta_(l \, diameter) = 1$ and $D_diameter = M_0$. Recall that $rho_l$ is the proportion of good residue assignments for $h_l$, and that $rho_l gt.eq rho_(*) = M_0^(1 - L) > 0$ by Lemma 28.

#thm([Proposition 7.1.])[
  (Recurrence for the maximal functional).  #emph[There are constants $C_1 gt.eq 1$ and $N_1 gt.eq 3$, depending only on the fixed polynomial $h$, its chosen roots, and the fixed structural choices, such that for every integer $N gt.eq N_1$ and every positive integer $l lt.eq N^zeta$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ cal(Y)_l \( N \) lt.eq C_1 N^(- sigma) + \( 1 + u_N \) #scale(x: 300%, y: 300%)[\(] & \( 1 - rho_l \) cal(Y)_(l D_diameter) \( n_diameter \)\
 & + rho_l sum_(diameter eq.not B subset.eq cal(P)_N\
q_B lt.eq N^tau) eta_(l \, B) cal(Y)_(l D_B) \( n_B \) #scale(x: 300%, y: 300%)[\)] \, $ <eq:31>]

 where 
$ u_N = #scale(x: 120%, y: 120%)[\(] 1 + M_0^k N^(k tau - 1) #scale(x: 120%, y: 120%)[\)]^d - 1 arrow.r 0 . $

 Every scale $n_B$ appearing on the right belongs to $\[ 1 \, N - 1 \]$.]
] <induction:recurrence>

#proof[
  Fix $A subset.eq \[ N \]$ satisfying (6.1). Use the functions $f_s$ and their lifts $G_s$ from Section 6, and, for a residue assignment $upright(bold(s)) = \( s_v \)_(v in V)$, write
  $ Phi_(upright(bold(s))) \( \( z_v \)_(v in V) \) = product_(v in V) G_(s_v) \( z_v \) . $
  Since $bb(E)_s f_s = upright(bold(1))_A$, linearity of the lift and multilinearity of the integral give
  #[#set math.equation(numbering: n => "(7.2)")
   $ Y_l \( N \, A \) = bb(E)_(upright(bold(s))) integral Phi_(upright(bold(s))) thin d ⨂_(p in cal(P)_N) mu_(l \, p) \, $ <induction:residue-average>]
  where the residues $s_v$ are independent and uniform modulo $M_0$.
  For each $B subset.eq cal(P)_N$, define the nonnegative measure
  $ kappa_(l \, B) = ⨂_(p in B) epsilon_(l \, p) ⊗ ⨂_(p in cal(P)_N \\ B) mu_(l \, p) . $
  Its mass is $eta_(l \, B)$. Expanding the finite product gives the identity of signed measures
  #[#set math.equation(numbering: n => "(7.3)")
   $ ⨂_(p in cal(P)_N) mu_(l \, p) - ⨂_(p in cal(P)_N) \( mu_(l \, p) - epsilon_(l \, p) \) = sum_(diameter eq.not B subset.eq cal(P)_N) \( - 1 \)^(\| B \| + 1) kappa_(l \, B) . $ <induction:exceptional-expansion>]
  The complement of $B$ therefore carries the full laws $mu_(l \, p)$, to which Proposition 27 applies. The functions $Phi_(upright(bold(s)))$ can have either sign; we will take the absolute value of each integral on the right of (7.3).
  The exceptional masses have a uniform bound with an extra factor $q_B$:
  #[#set math.equation(numbering: n => "(7.4)")
   $ sum_(diameter eq.not B subset.eq cal(P)_N) q_B eta_(l \, B) = product_(p in cal(P)_N) \( 1 + p eta_(l \, p) \) - 1 lt.eq product_(p gt.eq P) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 . $ <eq:32>]
  Here we used $eta_(l \, p) lt.eq p^(- 4)$ and the choice of $P$ in (3.7). This bound first allows us to discard the terms with $q_B > N^tau$.
  To see this, suppose $eta_(l \, B) > 0$. Simultaneous translation invariance of $epsilon_(l \, p)$ implies that each single-label marginal of $epsilon_(l \, p) \/ eta_(l \, p)$ is uniform on $bb(F)_p$. The same holds for the full laws. Thus each single-slot marginal of $kappa_(l \, B) \/ eta_(l \, B)$ is uniform on $X_(cal(P)_N)$. Ordinary Hölder’s inequality and the moment estimate (4.5), at the fixed even exponent $d$, give
  #[#set math.equation(numbering: n => "(7.5)")
   $ lr(|integral Phi_(upright(bold(s))) thin d kappa_(l \, B)|) lt.eq eta_(l \, B) product_(v in V) parallel G_(s_v) parallel_d lt.eq C_epsilon.alt eta_(l \, B) N^epsilon.alt #h(2em) \( epsilon.alt > 0 \) . $ <induction:exceptional-moment>]
  The constants are uniform in $l \, B \, A$ and $upright(bold(s))$; the bound $\| f_s \| lt.eq M_0$ only introduces a fixed factor. Terms of zero mass vanish. Combining (7.5) with (7.4) yields
  $ sum_(diameter eq.not B subset.eq cal(P)_N\
q_B > N^tau) lr(|integral Phi_(upright(bold(s))) thin d kappa_(l \, B)|) lt.eq C_epsilon.alt / 4 N^(- tau + epsilon.alt) = O \( N^(- sigma) \) \, $
  where, for example, $epsilon.alt = tau \/ 2$ suffices because $sigma = gamma tau \/ 4 < tau \/ 2$.
  For $q_B lt.eq N^tau$ and positive mass, condition instead on all the labels at primes in $B$. The laws at the remaining primes are unchanged, and the function in each slot is the corresponding specialization of $G_(s_v)$. Proposition 27, which allows arbitrary slotwise specializations, gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ lr(|integral Phi_(upright(bold(s))) thin d kappa_(l \, B)|) lt.eq eta_(l \, B) (Lambda_B^d cal(Y)_(l D_B) \( n_B \) + C_2 N^(- sigma)) \, #h(2em) Lambda_B = frac(lambda \( D_B \) n_B, N) . $ <induction:exceptional-transfer>]
  The bound is uniform in every conditioned tuple, so integration over the prescribed labels preserves it. It also holds for zero-mass terms. By (6.4), $Lambda_B^d lt.eq 1 + u_N$; by (7.4), $sum_(B eq.not diameter) eta_(l \, B) lt.eq 1 \/ 4$. Therefore summing the errors in (7.6) still costs $O \( N^(- sigma) \)$.
  For a good assignment $upright(bold(s))$, Proposition 29 bounds the integral against $⨂_p \( mu_(l \, p) - epsilon_(l \, p) \)$ by $O \( N^(- sigma) \)$ in absolute value. The expansion (7.3) and the two exceptional estimates consequently give
  $ integral Phi_(upright(bold(s))) thin d ⨂_p mu_(l \, p) lt.eq O \( N^(- sigma) \) + \( 1 + u_N \) sum_(diameter eq.not B subset.eq cal(P)_N\
q_B lt.eq N^tau) eta_(l \, B) cal(Y)_(l D_B) \( n_B \) . $
  For every other assignment, apply Proposition 27 directly with $B = diameter$. The resulting bound is $\( 1 + u_N \) cal(Y)_(l M_0) \( n_diameter \) + O \( N^(- sigma) \)$. Averaging these estimates in (7.2) gives the coefficients $rho_l$ and $1 - rho_l$ in (7.1). The bounds are uniform in $A$, so we may take the maximum defining $cal(Y)_l \( N \)$.
  Finally, $k tau < 1$ by (4.8), so $u_N arrow.r 0$, and the bound $1 lt.eq n_B < N$ is part of Proposition 27. ◻
]

The recurrence decreases $N$ while replacing $l$ by $l D_B$. Its cancellation hypothesis $l lt.eq N^zeta$ need not persist at the smaller scale. The next estimate is therefore stated for every $l$: a small positive power of $l$ permits the uniform moment bound to handle the range where that hypothesis fails.

#thm([Proposition 7.2.])[
  (Decay throughout the auxiliary family).  #emph[There are constants $a_0 \, b_0 > 0$ and $C_0 gt.eq 1$, depending only on the fixed polynomial $h$, its chosen roots, and the fixed structural choices, such that for all positive integers $l \, N$, 
#[#set math.equation(numbering: n => "(7.7)")
 $ cal(Y)_l \( N \) lt.eq C_0 l^(b_0) N^(- a_0) . $ <eq:33>]

 The exponents $a_0 \, b_0$ can be chosen as functions only of the structural parameters $k \, zeta \, sigma \, M_0 \, rho_(*)$. If the chosen roots of $h$ satisfy Condition (U) and the choices depending only on $k$ from Sections 2 and 3 are used, then $a_0 \, b_0 \, d$ depend only on $k$, while $C_0$ may still depend on the fixed data.]
] <induction:decay>

#proof[
  To select the exponents, suppose that at a scale where the recurrence applies the trial bound $cal(Y)_(l D_B) \( n_B \) lt.eq C \( l D_B \)^b n_B^(- a)$ is available at every successor scale, with $C gt.eq 1$ and $a \, b > 0$. Put $s = k a + b$. Since $n_B gt.eq N \/ lambda \( D_B \)$ and $lambda \( D_B \) lt.eq D_B^k$, each trial bound gives
  $ C \( l D_B \)^b n_B^(- a) lt.eq C l^b N^(- a) lambda \( D_B \)^a D_B^b lt.eq C l^b N^(- a) D_B^s . $
  If $s lt.eq 1$, then $q_B^s lt.eq q_B$, so Equation (7.4) bounds the coefficient of $C l^b N^(- a)$ inside the parentheses of (7.1) by
  $ M_0^s (1 - rho_l + rho_l sum_(diameter eq.not B subset.eq cal(P)_N\
q_B lt.eq N^tau) eta_(l \, B) q_B^s) lt.eq M_0^s \( 1 - 3 rho_(*) \/ 4 \) . $
  This upper bound tends to $1 - 3 rho_(*) \/ 4 < 1$ as $s$ tends to zero. Two further restrictions handle the other parts of the argument. For any proposed $a > 0$, Corollary 21 gives a bound $cal(Y)_l \( N \) lt.eq C_a N^a$ for all positive $l \, N$. Taking $b = 2 a \/ zeta$ makes $l^b N^(- a) > N^a$ whenever $l > N^zeta$, so this subpower bound covers the range outside the recurrence after increasing $C$. Finally, $a < sigma$ makes $C_1 N^(- sigma) = o \( N^(- a) \)$, allowing the additive error to be absorbed at sufficiently large scales.
  Choose explicitly
  $ a_0 = 1 / 2 min {sigma \, quad frac(1, k + 2 \/ zeta) \, quad frac(- log \( 1 - 3 rho_(*) \/ 4 \), \( k + 2 \/ zeta \) log M_0)} \, #h(2em) b_0 = frac(2 a_0, zeta) . $
  These numbers are positive because $M_0 gt.eq 2$ and $0 < rho_(*) lt.eq 1$. They satisfy
  #[#set math.equation(numbering: n => "(7.8)")
   $ a_0 < sigma \, #h(2em) s_0 := k a_0 + b_0 lt.eq 1 \, #h(2em) theta := M_0^(s_0) \( 1 - 3 rho_(*) \/ 4 \) < 1 . $ <induction:exponent-choice>]
  Indeed, $s_0 = \( k + 2 \/ zeta \) a_0 lt.eq 1 \/ 2$, and the third term in the minimum gives
  $ s_0 log M_0 lt.eq - 1 / 2 log \( 1 - 3 rho_(*) \/ 4 \) \, #h(2em) theta lt.eq \( 1 - 3 rho_(*) \/ 4 \)^(1 \/ 2) < 1 . $
  This displays the asserted structural dependence. Under Condition (U), Sections 2 and 3 permit $L \, P \, M_0 \, d$ to be fixed in terms of $k$ only. Then $rho_(*) = M_0^(1 - L)$ and all parameters in (4.8) depend only on $k$, so the displayed choices of $a_0 \, b_0$ do as well. The constants in the estimates below, and consequently $C_0$, may depend on the fixed data. All quantities in (7.8) are fixed from now on.
  Corollary 21 supplies a constant $C_(*) gt.eq 1$ such that
  #[#set math.equation(numbering: n => "(7.9)")
   $ cal(Y)_l \( N \) lt.eq C_(*) N^(a_0) #h(2em) \( l \, N gt.eq 1 \) . $ <induction:subpower-bound>]
  If $l > N^zeta$, then
  $ l^(b_0) N^(- a_0) > N^(zeta b_0 - a_0) = N^(a_0) \, $
  so (7.7) follows from (7.9) for any $C_0 gt.eq C_(*)$. This establishes the estimate outside the range of the recurrence at every scale.
  We choose the initial range before fixing $C_0$. Set $kappa = \( 1 - theta \) \/ 2 > 0$, and take an integer $N_(*) gt.eq N_1$ so large that for every $N gt.eq N_(*)$,
  #[#set math.equation(numbering: n => "(7.10)")
   $ theta u_N lt.eq kappa \, #h(2em) C_1 N^(a_0 - sigma) lt.eq kappa . $ <induction:threshold>]
  This is possible because $u_N arrow.r 0$ and $a_0 < sigma$; the choice is independent of $C_0$. Now choose $C_0 gt.eq max { 1 \, C_(*) N_(*)^(2 a_0) }$. For all $l gt.eq 1$ and $N < N_(*)$, (7.9) gives
  $ cal(Y)_l \( N \) lt.eq C_(*) N^(a_0) lt.eq C_0 N^(- a_0) lt.eq C_0 l^(b_0) N^(- a_0) . $
  Thus the initial range is covered simultaneously for every $l$.
  Proceed by strong induction on $N$, simultaneously for all positive integers $l$. Suppose $N gt.eq N_(*)$ and the estimate is known at every smaller scale. The case $l > N^zeta$ was established above, so assume $l lt.eq N^zeta$ and apply Proposition 30. Its successor scales satisfy $1 lt.eq n_B < N$, so the simultaneous induction hypothesis gives $cal(Y)_(l D_B) \( n_B \) lt.eq C_0 \( l D_B \)^(b_0) n_B^(- a_0)$ at every positive index $l D_B$, with no restriction on $l D_B$ relative to $n_B$. The trial calculation above, with $C = C_0$, $a = a_0$, $b = b_0$, and $s = s_0$, therefore bounds the successor expression inside the parentheses of (7.1) by $theta C_0 l^(b_0) N^(- a_0)$. Substituting in (7.1), and then using (7.10), yields
  $ cal(Y)_l \( N \) & lt.eq C_1 N^(- sigma) + \( 1 + u_N \) theta C_0 l^(b_0) N^(- a_0)\
 & lt.eq kappa N^(- a_0) + \( 1 - kappa \) C_0 l^(b_0) N^(- a_0) lt.eq C_0 l^(b_0) N^(- a_0) . $
  The last step uses $C_0 l^(b_0) gt.eq 1$. This closes the induction. ◻
]

#proof[
  Fix $k gt.eq 2$. For this degree, fix the numerical choices furnished under Condition (U) by Sections 2, 3, and 4. In particular, $L \, P \, M_0 \, d \, zeta \, sigma$ and $rho_(*) = M_0^(1 - L)$ are now fixed using only $k$. Evaluate the explicit minimum above with these numbers to fix $a_0$, and put
  $ b_0 = frac(2 a_0, zeta) \, #h(2em) c_k = a_0 / d in \( 0 \, 1 \) . $
  The stated range for $c_k$ follows from $0 < a_0 < sigma < 1$ and $d gt.eq 1$.
  Now let $h in bb(Z) \[ x \]$ be an intersective polynomial of degree $k$ with positive leading coefficient, and fix its chosen roots as in Section 2. Apply Lemma 2 to $h$. It supplies positive integers $D_0 \, M$, an integer $r$ with $- D_0 < r lt.eq 0$, and an intersective polynomial
  $ g \( x \) = frac(h \( r + D_0 x \), M) in bb(Z) \[ x \] $
  of degree $k$ with positive leading coefficient whose chosen roots satisfy Condition (U). Moreover,
  $ M g \( m \) = h \( r + D_0 m \) \, #h(2em) r + D_0 m gt.eq 1 quad \( m in bb(N)_(+) \) . $
  Apply the preceding auxiliary family construction and estimates with $g$ and its chosen roots as the fixed polynomial data, using the numerical choices already fixed for degree $k$. Proposition 31 then gives a constant $C_0 gt.eq 1$, which may depend on the fixed normalized polynomial, its chosen roots, and the fixed structural choices, for which (7.7) holds with the previously chosen $a_0 \, b_0$. At $l = 1$ the auxiliary polynomial is $g_1 = g$, since $r_1 = 0$ and $lambda \( 1 \) = 1$. Thus for every positive integer $n$ and every $B subset.eq \[ n \]$ with $\( B - B \) ∩ g \( bb(N)_(+) \) subset.eq { 0 }$, Corollary 21 and Proposition 31, both applied to the framework for $g$, give
  $ frac(\| B \|, n) lt.eq Y_1 \( n \, B \)^(1 \/ d) lt.eq C_0^(1 \/ d) n^(- c_k) . $
  Now let $N gt.eq M$ and let $A subset.eq \[ N \]$ satisfy the avoidance condition of the theorem. For each $j in \[ M \]$, set
  $ A_j = {x in [⌈N / M⌉] : j + M \( x - 1 \) in A} . $
  These sets give the progression coordinates of a partition of $A$. If a nonzero difference in $A_j - A_j$ were $g \( m \)$ for some $m in bb(N)_(+)$, the corresponding difference in $A - A$ would be $M g \( m \) = h \( r + D_0 m \)$, nonzero and with $r + D_0 m gt.eq 1$, contradicting avoidance. The bound just obtained therefore applies to each $A_j$. Since $ceil.l N \/ M ceil.r lt.eq 2 N \/ M$ for $N gt.eq M$ and $1 - c_k > 0$, it gives
  $ \| A \| = sum_(j = 1)^M \| A_j \| lt.eq M C_0^(1 \/ d) ⌈N / M⌉^(1 - c_k) lt.eq 2^(1 - c_k) M^(c_k) C_0^(1 \/ d) N^(1 - c_k) . $
  Taking $C_h = 2^(1 - c_k) M^(c_k) C_0^(1 \/ d) gt.eq 1$ and $N_h = M$ proves the theorem. The constants $C_h \, N_h$ may depend on every coefficient of $h$, while $c_k$ depends only on $k$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
